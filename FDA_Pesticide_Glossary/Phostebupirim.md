---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.302172, 0.208232, -0.4804221, 1, 0, 0, 1,
-3.285677, 1.242171, -0.7032893, 1, 0.007843138, 0, 1,
-3.03404, 1.296931, -1.127323, 1, 0.01176471, 0, 1,
-2.973168, -1.304206, -2.201093, 1, 0.01960784, 0, 1,
-2.758003, -0.8419653, -1.787395, 1, 0.02352941, 0, 1,
-2.712248, 0.5306986, -1.164118, 1, 0.03137255, 0, 1,
-2.710205, 1.340822, 0.1579779, 1, 0.03529412, 0, 1,
-2.599541, 1.330749, -1.136287, 1, 0.04313726, 0, 1,
-2.589829, 1.225109, -2.060215, 1, 0.04705882, 0, 1,
-2.577343, 0.3506155, -2.376889, 1, 0.05490196, 0, 1,
-2.569762, 0.01159564, -1.612316, 1, 0.05882353, 0, 1,
-2.509659, -1.013624, -3.634176, 1, 0.06666667, 0, 1,
-2.437184, 1.840918, -0.1482384, 1, 0.07058824, 0, 1,
-2.399051, -0.1367503, -0.31106, 1, 0.07843138, 0, 1,
-2.395319, 1.019828, -0.5447619, 1, 0.08235294, 0, 1,
-2.254421, -1.112176, -0.7515055, 1, 0.09019608, 0, 1,
-2.24124, -0.9447851, -0.8627908, 1, 0.09411765, 0, 1,
-2.194375, 1.945367, -0.3508695, 1, 0.1019608, 0, 1,
-2.19251, 0.4633521, -0.7304434, 1, 0.1098039, 0, 1,
-2.176794, -1.227286, -1.661478, 1, 0.1137255, 0, 1,
-2.056325, 0.9079099, -0.5073445, 1, 0.1215686, 0, 1,
-2.052788, -0.2533242, -3.937192, 1, 0.1254902, 0, 1,
-2.009052, -1.056327, -2.815012, 1, 0.1333333, 0, 1,
-1.997747, 0.1110925, -1.914408, 1, 0.1372549, 0, 1,
-1.989713, 0.06572367, -2.151426, 1, 0.145098, 0, 1,
-1.973623, -0.5096119, -0.1686441, 1, 0.1490196, 0, 1,
-1.955543, 1.809493, 1.155059, 1, 0.1568628, 0, 1,
-1.939968, 0.1956668, 0.4961495, 1, 0.1607843, 0, 1,
-1.939634, 0.06771232, -3.814076, 1, 0.1686275, 0, 1,
-1.930411, -0.3432451, 0.3949665, 1, 0.172549, 0, 1,
-1.914338, -0.6628668, -1.544434, 1, 0.1803922, 0, 1,
-1.913201, 0.2828207, -1.572073, 1, 0.1843137, 0, 1,
-1.896781, -0.8291314, -1.992477, 1, 0.1921569, 0, 1,
-1.85642, -0.73715, -2.415305, 1, 0.1960784, 0, 1,
-1.842636, -1.379483, -0.4798909, 1, 0.2039216, 0, 1,
-1.81591, 0.03748157, -2.212151, 1, 0.2117647, 0, 1,
-1.815518, -0.5344641, -1.107016, 1, 0.2156863, 0, 1,
-1.778266, -0.1184361, -1.949109, 1, 0.2235294, 0, 1,
-1.773112, 0.2863763, -2.544252, 1, 0.227451, 0, 1,
-1.766988, 0.8099849, -0.3013169, 1, 0.2352941, 0, 1,
-1.740007, 0.9064372, -0.3277402, 1, 0.2392157, 0, 1,
-1.70759, 0.667133, -1.926267, 1, 0.2470588, 0, 1,
-1.683675, 1.548495, -0.6904597, 1, 0.2509804, 0, 1,
-1.680776, 0.482286, -0.9754485, 1, 0.2588235, 0, 1,
-1.678389, -1.417482, -0.3243154, 1, 0.2627451, 0, 1,
-1.675124, 1.738309, 0.3997186, 1, 0.2705882, 0, 1,
-1.67099, 0.371336, -2.551286, 1, 0.2745098, 0, 1,
-1.670456, -0.7392918, -2.462493, 1, 0.282353, 0, 1,
-1.662733, -1.290215, -2.003281, 1, 0.2862745, 0, 1,
-1.660583, -2.089062, -3.377386, 1, 0.2941177, 0, 1,
-1.65362, 0.8448759, -1.045697, 1, 0.3019608, 0, 1,
-1.638989, 2.097492, -0.658143, 1, 0.3058824, 0, 1,
-1.623341, -0.6888611, -1.061257, 1, 0.3137255, 0, 1,
-1.607746, -0.9082375, -2.150575, 1, 0.3176471, 0, 1,
-1.547938, 1.925317, -0.365347, 1, 0.3254902, 0, 1,
-1.547385, 0.5928394, -0.001005894, 1, 0.3294118, 0, 1,
-1.547012, -0.73711, -1.886335, 1, 0.3372549, 0, 1,
-1.543552, -1.315425, -2.207194, 1, 0.3411765, 0, 1,
-1.505379, -0.1155844, -2.982123, 1, 0.3490196, 0, 1,
-1.479474, 0.3657242, -0.2172074, 1, 0.3529412, 0, 1,
-1.478346, -1.193954, -2.94436, 1, 0.3607843, 0, 1,
-1.475232, 1.319578, -0.5037162, 1, 0.3647059, 0, 1,
-1.464654, -1.65413, -2.57475, 1, 0.372549, 0, 1,
-1.442492, 0.5462086, -1.929106, 1, 0.3764706, 0, 1,
-1.44241, -1.181685, -2.54853, 1, 0.3843137, 0, 1,
-1.44182, -0.457097, -1.547027, 1, 0.3882353, 0, 1,
-1.43376, -0.7927872, -3.411221, 1, 0.3960784, 0, 1,
-1.430029, -0.5689656, -1.494224, 1, 0.4039216, 0, 1,
-1.421777, 0.6264343, -0.5379102, 1, 0.4078431, 0, 1,
-1.421345, 1.669797, -0.9140317, 1, 0.4156863, 0, 1,
-1.410892, 1.090082, -0.8209382, 1, 0.4196078, 0, 1,
-1.404049, -1.059919, -1.729884, 1, 0.427451, 0, 1,
-1.402738, -0.3148001, -2.908648, 1, 0.4313726, 0, 1,
-1.399307, 1.203157, -1.230486, 1, 0.4392157, 0, 1,
-1.389286, 0.5050691, -2.630583, 1, 0.4431373, 0, 1,
-1.384325, 1.890262, 0.8458561, 1, 0.4509804, 0, 1,
-1.376816, -0.7622112, -3.485124, 1, 0.454902, 0, 1,
-1.369591, -0.4591591, -2.614243, 1, 0.4627451, 0, 1,
-1.369439, -0.7769617, -2.337508, 1, 0.4666667, 0, 1,
-1.368281, -0.04278625, -2.214628, 1, 0.4745098, 0, 1,
-1.368217, -0.1431468, -2.348408, 1, 0.4784314, 0, 1,
-1.368149, -1.008015, -1.316106, 1, 0.4862745, 0, 1,
-1.36163, 0.8546975, -2.094807, 1, 0.4901961, 0, 1,
-1.359937, -0.7507641, -2.429234, 1, 0.4980392, 0, 1,
-1.359088, -0.4548429, -0.07469387, 1, 0.5058824, 0, 1,
-1.350969, -0.5228053, -1.912608, 1, 0.509804, 0, 1,
-1.342, 0.2191799, -2.92653, 1, 0.5176471, 0, 1,
-1.340671, -1.30907, -2.759333, 1, 0.5215687, 0, 1,
-1.311072, 0.1993768, -1.231384, 1, 0.5294118, 0, 1,
-1.310368, 1.878613, -0.8476211, 1, 0.5333334, 0, 1,
-1.308936, -0.7223778, -2.059452, 1, 0.5411765, 0, 1,
-1.294469, -0.1227035, -3.356519, 1, 0.5450981, 0, 1,
-1.293979, -0.7233922, -1.677292, 1, 0.5529412, 0, 1,
-1.279329, -0.9338521, -3.397666, 1, 0.5568628, 0, 1,
-1.278505, -0.440764, -0.01289391, 1, 0.5647059, 0, 1,
-1.276308, -0.03197521, -1.980253, 1, 0.5686275, 0, 1,
-1.276281, 2.417973, 0.7081169, 1, 0.5764706, 0, 1,
-1.274649, -0.8925664, -2.394804, 1, 0.5803922, 0, 1,
-1.248802, -1.580141, -1.451699, 1, 0.5882353, 0, 1,
-1.248378, 1.095864, 0.8935323, 1, 0.5921569, 0, 1,
-1.23917, 1.426353, 0.2324603, 1, 0.6, 0, 1,
-1.23885, -0.1841507, -1.118386, 1, 0.6078432, 0, 1,
-1.236705, 0.4978493, 0.3591063, 1, 0.6117647, 0, 1,
-1.235317, 0.6911327, -1.106654, 1, 0.6196079, 0, 1,
-1.229087, -1.031272, -3.167501, 1, 0.6235294, 0, 1,
-1.226873, -0.4140069, -0.0446376, 1, 0.6313726, 0, 1,
-1.226737, -2.962284, -1.730581, 1, 0.6352941, 0, 1,
-1.226454, -0.4031188, -1.36766, 1, 0.6431373, 0, 1,
-1.208046, 1.163003, -0.9487153, 1, 0.6470588, 0, 1,
-1.206654, 0.6074756, -0.6227937, 1, 0.654902, 0, 1,
-1.205, 1.088111, 0.4294819, 1, 0.6588235, 0, 1,
-1.204197, -1.434751, -2.518812, 1, 0.6666667, 0, 1,
-1.199709, 1.201862, -0.9459506, 1, 0.6705883, 0, 1,
-1.1868, -0.5557219, -0.4286761, 1, 0.6784314, 0, 1,
-1.183898, 0.9069712, -0.03402199, 1, 0.682353, 0, 1,
-1.174443, 0.2879667, -2.600705, 1, 0.6901961, 0, 1,
-1.167747, 0.6990517, -2.007598, 1, 0.6941177, 0, 1,
-1.157647, -0.4311567, -1.338534, 1, 0.7019608, 0, 1,
-1.141865, 1.466313, -0.2222666, 1, 0.7098039, 0, 1,
-1.126419, -0.6343547, -1.863602, 1, 0.7137255, 0, 1,
-1.12515, -0.9686481, -2.666594, 1, 0.7215686, 0, 1,
-1.115602, 1.318645, -1.551795, 1, 0.7254902, 0, 1,
-1.109303, 0.4005405, -0.9492081, 1, 0.7333333, 0, 1,
-1.104872, -0.2452545, -1.739492, 1, 0.7372549, 0, 1,
-1.102228, -0.9446597, -2.676444, 1, 0.7450981, 0, 1,
-1.082505, 0.6561695, -0.7482779, 1, 0.7490196, 0, 1,
-1.079705, 0.8409349, -3.837649, 1, 0.7568628, 0, 1,
-1.065146, 1.038705, -0.2476986, 1, 0.7607843, 0, 1,
-1.06239, 1.03252, -0.3448784, 1, 0.7686275, 0, 1,
-1.061069, -0.9403908, -2.801151, 1, 0.772549, 0, 1,
-1.060283, -0.209584, -1.570301, 1, 0.7803922, 0, 1,
-1.048099, -1.502013, -3.322664, 1, 0.7843137, 0, 1,
-1.046653, 0.2153335, -0.6579276, 1, 0.7921569, 0, 1,
-1.035098, -0.7372016, -2.433545, 1, 0.7960784, 0, 1,
-1.034311, 2.205099, -0.3168606, 1, 0.8039216, 0, 1,
-1.029903, 0.1035767, -2.336027, 1, 0.8117647, 0, 1,
-1.029292, 0.3547806, -1.574717, 1, 0.8156863, 0, 1,
-1.023422, 1.11096, -1.632312, 1, 0.8235294, 0, 1,
-1.022369, 1.44551, -2.252647, 1, 0.827451, 0, 1,
-1.021969, 0.7942183, -0.1144989, 1, 0.8352941, 0, 1,
-1.018947, 1.548545, -0.2374828, 1, 0.8392157, 0, 1,
-1.015502, 1.784553, -1.50368, 1, 0.8470588, 0, 1,
-0.9954048, 0.0189693, -2.249636, 1, 0.8509804, 0, 1,
-0.9842888, 0.7086701, -1.503738, 1, 0.8588235, 0, 1,
-0.979368, 1.527862, 0.6338989, 1, 0.8627451, 0, 1,
-0.9755703, 0.8205872, -1.96298, 1, 0.8705882, 0, 1,
-0.9713575, -0.7360937, -4.846503, 1, 0.8745098, 0, 1,
-0.9685218, -0.5340726, -3.123595, 1, 0.8823529, 0, 1,
-0.9676319, 0.7505531, -1.041175, 1, 0.8862745, 0, 1,
-0.9622263, -0.9094247, -0.6785255, 1, 0.8941177, 0, 1,
-0.9608327, -1.214758, -1.467251, 1, 0.8980392, 0, 1,
-0.9579754, -0.9339185, -2.174945, 1, 0.9058824, 0, 1,
-0.950878, 1.438314, 0.6856157, 1, 0.9137255, 0, 1,
-0.9470139, 0.680559, -1.165566, 1, 0.9176471, 0, 1,
-0.9438018, 0.13986, 0.1732751, 1, 0.9254902, 0, 1,
-0.9416072, -0.2751229, -0.6494524, 1, 0.9294118, 0, 1,
-0.9406994, 0.1820559, -3.40619, 1, 0.9372549, 0, 1,
-0.9359054, 1.055846, -0.6352876, 1, 0.9411765, 0, 1,
-0.9319747, -0.9446949, 0.4282824, 1, 0.9490196, 0, 1,
-0.924464, 1.314627, 1.785758, 1, 0.9529412, 0, 1,
-0.9160941, -0.9171998, -2.298896, 1, 0.9607843, 0, 1,
-0.9137789, -1.271734, -2.133029, 1, 0.9647059, 0, 1,
-0.9085288, 1.288978, -0.8020858, 1, 0.972549, 0, 1,
-0.9074673, -0.1461411, -0.1411625, 1, 0.9764706, 0, 1,
-0.9015928, -0.6400616, -1.763438, 1, 0.9843137, 0, 1,
-0.8964635, 2.045179, -1.662764, 1, 0.9882353, 0, 1,
-0.8923141, -1.884945, -2.584489, 1, 0.9960784, 0, 1,
-0.8806545, 0.4666175, -2.685207, 0.9960784, 1, 0, 1,
-0.8806244, -0.8447351, -4.423811, 0.9921569, 1, 0, 1,
-0.8790985, -1.102666, -2.721607, 0.9843137, 1, 0, 1,
-0.8750138, 1.582477, -0.218723, 0.9803922, 1, 0, 1,
-0.8749899, -0.987877, -1.689026, 0.972549, 1, 0, 1,
-0.872566, -0.5291442, -1.982546, 0.9686275, 1, 0, 1,
-0.8679307, 0.1240549, -1.707992, 0.9607843, 1, 0, 1,
-0.8624495, 0.9834219, -0.4429234, 0.9568627, 1, 0, 1,
-0.8622442, 0.2523891, -1.162977, 0.9490196, 1, 0, 1,
-0.8558913, -0.6146838, -2.672835, 0.945098, 1, 0, 1,
-0.8555264, 0.3708534, 0.09035769, 0.9372549, 1, 0, 1,
-0.8546004, 0.4135566, -1.495628, 0.9333333, 1, 0, 1,
-0.8494439, -0.5053004, 0.7441675, 0.9254902, 1, 0, 1,
-0.8312424, -0.4826568, -0.7190574, 0.9215686, 1, 0, 1,
-0.831174, -0.5196513, -0.6796728, 0.9137255, 1, 0, 1,
-0.8306934, -0.416635, -2.337266, 0.9098039, 1, 0, 1,
-0.8297508, -1.694648, -1.269606, 0.9019608, 1, 0, 1,
-0.8233297, -1.735682, -2.425838, 0.8941177, 1, 0, 1,
-0.821008, -0.3752425, -0.3685528, 0.8901961, 1, 0, 1,
-0.8145425, -0.768571, -1.637125, 0.8823529, 1, 0, 1,
-0.7993978, -0.5676529, -2.307485, 0.8784314, 1, 0, 1,
-0.7974843, 1.542269, -0.8651221, 0.8705882, 1, 0, 1,
-0.795216, -0.5235818, -2.931258, 0.8666667, 1, 0, 1,
-0.7923884, -0.1628763, -0.6417853, 0.8588235, 1, 0, 1,
-0.7907734, -0.2542974, -3.251962, 0.854902, 1, 0, 1,
-0.783976, -0.3313044, -1.823836, 0.8470588, 1, 0, 1,
-0.783805, 1.48853, -0.2976435, 0.8431373, 1, 0, 1,
-0.7813976, 1.169235, -0.1725747, 0.8352941, 1, 0, 1,
-0.7800525, 0.4899836, -1.76912, 0.8313726, 1, 0, 1,
-0.7764245, 0.4125825, -0.08109564, 0.8235294, 1, 0, 1,
-0.7727758, 1.627614, 0.3878204, 0.8196079, 1, 0, 1,
-0.7643344, 2.161044, 0.4199504, 0.8117647, 1, 0, 1,
-0.7640741, -0.7680773, -2.681413, 0.8078431, 1, 0, 1,
-0.7602357, -1.453943, -4.56933, 0.8, 1, 0, 1,
-0.7567498, 0.1253915, 0.868076, 0.7921569, 1, 0, 1,
-0.755327, 0.4333708, -0.9577307, 0.7882353, 1, 0, 1,
-0.7534596, -0.1349179, -1.479549, 0.7803922, 1, 0, 1,
-0.7518573, 0.9317792, 0.5043519, 0.7764706, 1, 0, 1,
-0.7515641, 0.5781136, -3.657888, 0.7686275, 1, 0, 1,
-0.7508939, 0.1212543, -0.6020067, 0.7647059, 1, 0, 1,
-0.7502585, -1.460769, -2.589641, 0.7568628, 1, 0, 1,
-0.7479588, 0.2424326, -2.224134, 0.7529412, 1, 0, 1,
-0.745156, 0.215602, -1.176637, 0.7450981, 1, 0, 1,
-0.7429338, -0.9583169, -0.889451, 0.7411765, 1, 0, 1,
-0.7394879, 0.5318497, 0.8033128, 0.7333333, 1, 0, 1,
-0.7379012, 1.474757, -1.099874, 0.7294118, 1, 0, 1,
-0.7333847, 0.07443793, -1.993583, 0.7215686, 1, 0, 1,
-0.7256461, -0.4835319, -0.9723386, 0.7176471, 1, 0, 1,
-0.7196404, -1.624297, -4.490845, 0.7098039, 1, 0, 1,
-0.7191734, -0.7400972, -3.595573, 0.7058824, 1, 0, 1,
-0.7083106, 0.6369233, -1.767182, 0.6980392, 1, 0, 1,
-0.7034827, 0.7020113, 0.1645129, 0.6901961, 1, 0, 1,
-0.7030377, 0.2973203, -1.578156, 0.6862745, 1, 0, 1,
-0.6968205, 1.665889, -1.770646, 0.6784314, 1, 0, 1,
-0.6913047, 0.611553, -0.2883511, 0.6745098, 1, 0, 1,
-0.6895447, -0.4092429, -2.341882, 0.6666667, 1, 0, 1,
-0.6871469, -0.3201369, -0.7867109, 0.6627451, 1, 0, 1,
-0.6844671, 0.2974941, -2.412886, 0.654902, 1, 0, 1,
-0.6830557, -0.06903055, -0.5128044, 0.6509804, 1, 0, 1,
-0.6820041, -1.143043, -0.08141666, 0.6431373, 1, 0, 1,
-0.6814356, 0.3254034, -1.17843, 0.6392157, 1, 0, 1,
-0.6784084, 1.282954, 0.03017305, 0.6313726, 1, 0, 1,
-0.6693193, 0.8639522, -0.7016129, 0.627451, 1, 0, 1,
-0.6677539, 0.1706041, -3.120878, 0.6196079, 1, 0, 1,
-0.6649917, -1.404245, -1.49342, 0.6156863, 1, 0, 1,
-0.6628693, -0.6296185, -1.06732, 0.6078432, 1, 0, 1,
-0.6620539, 1.043582, 0.3897527, 0.6039216, 1, 0, 1,
-0.6572369, -0.6747881, -2.021446, 0.5960785, 1, 0, 1,
-0.6498113, -0.2758089, -2.493839, 0.5882353, 1, 0, 1,
-0.6491749, -0.6509594, -1.017033, 0.5843138, 1, 0, 1,
-0.6451352, -0.3671426, -2.287344, 0.5764706, 1, 0, 1,
-0.6447113, 0.3535797, -0.9873908, 0.572549, 1, 0, 1,
-0.6441434, 0.4322095, -2.351325, 0.5647059, 1, 0, 1,
-0.6430435, 0.5206193, -0.5706723, 0.5607843, 1, 0, 1,
-0.6368563, 1.533108, 0.4250318, 0.5529412, 1, 0, 1,
-0.636271, 1.646142, 0.3915915, 0.5490196, 1, 0, 1,
-0.6328731, 1.500131, 0.3757828, 0.5411765, 1, 0, 1,
-0.632865, 0.770675, -0.03623592, 0.5372549, 1, 0, 1,
-0.6306605, -0.5048163, -1.652861, 0.5294118, 1, 0, 1,
-0.6282949, -1.412001, -3.99638, 0.5254902, 1, 0, 1,
-0.6243607, 0.7558126, -1.818871, 0.5176471, 1, 0, 1,
-0.614614, 0.3541863, -1.822636, 0.5137255, 1, 0, 1,
-0.6101097, 0.01542459, -1.248209, 0.5058824, 1, 0, 1,
-0.6085139, -1.665826, -2.729714, 0.5019608, 1, 0, 1,
-0.6042441, -1.484286, -4.951162, 0.4941176, 1, 0, 1,
-0.6032606, 1.643758, 0.1912407, 0.4862745, 1, 0, 1,
-0.6012406, 0.3390013, -1.723995, 0.4823529, 1, 0, 1,
-0.6001111, -1.582483, -4.103147, 0.4745098, 1, 0, 1,
-0.5992211, -0.2121844, -3.084151, 0.4705882, 1, 0, 1,
-0.5990501, -0.2847339, -3.093088, 0.4627451, 1, 0, 1,
-0.5941826, 0.5658405, -3.98558, 0.4588235, 1, 0, 1,
-0.5925905, 0.6088899, -0.7055331, 0.4509804, 1, 0, 1,
-0.5892617, 0.6848427, -0.9520113, 0.4470588, 1, 0, 1,
-0.5846847, -1.170435, -2.723502, 0.4392157, 1, 0, 1,
-0.5845921, 0.6436883, -0.3534299, 0.4352941, 1, 0, 1,
-0.5762867, -1.838498, -4.996349, 0.427451, 1, 0, 1,
-0.5754527, -0.1383025, -3.505371, 0.4235294, 1, 0, 1,
-0.5752125, 0.6421993, -0.1268374, 0.4156863, 1, 0, 1,
-0.5749021, -1.816462, -2.751221, 0.4117647, 1, 0, 1,
-0.5744069, 0.5758609, -0.5426108, 0.4039216, 1, 0, 1,
-0.5649705, -0.3978036, -1.293063, 0.3960784, 1, 0, 1,
-0.5606615, -0.8748118, -1.654205, 0.3921569, 1, 0, 1,
-0.5598794, -0.6183713, -1.537707, 0.3843137, 1, 0, 1,
-0.5546184, -2.161761, -4.228704, 0.3803922, 1, 0, 1,
-0.5535789, 1.321153, -1.885508, 0.372549, 1, 0, 1,
-0.5520025, 0.9335113, -1.86001, 0.3686275, 1, 0, 1,
-0.5483798, 0.9900224, -1.56491, 0.3607843, 1, 0, 1,
-0.542013, -1.577675, -2.750207, 0.3568628, 1, 0, 1,
-0.5344037, 0.4309579, -1.208534, 0.3490196, 1, 0, 1,
-0.5329092, 1.600298, -0.7124063, 0.345098, 1, 0, 1,
-0.5285348, 0.4538467, -0.8125263, 0.3372549, 1, 0, 1,
-0.5243018, 1.49656, 0.3212854, 0.3333333, 1, 0, 1,
-0.5239875, 1.156924, -0.1567075, 0.3254902, 1, 0, 1,
-0.5224451, 0.5746459, -0.2511626, 0.3215686, 1, 0, 1,
-0.5143676, -0.8752961, -4.258747, 0.3137255, 1, 0, 1,
-0.510871, 1.081693, -0.5794603, 0.3098039, 1, 0, 1,
-0.5098574, 0.6123203, -1.709823, 0.3019608, 1, 0, 1,
-0.5070219, -1.850296, -3.054867, 0.2941177, 1, 0, 1,
-0.4964127, 1.98944, -1.147112, 0.2901961, 1, 0, 1,
-0.4876925, 2.40511, -0.3923761, 0.282353, 1, 0, 1,
-0.4858958, -1.167017, -2.337276, 0.2784314, 1, 0, 1,
-0.4816714, 0.3524375, -1.73621, 0.2705882, 1, 0, 1,
-0.4799633, 1.060476, -0.3634898, 0.2666667, 1, 0, 1,
-0.4766707, 1.582892, 1.006416, 0.2588235, 1, 0, 1,
-0.4733439, 0.8521538, 1.005667, 0.254902, 1, 0, 1,
-0.4718324, 1.162501, 1.255551, 0.2470588, 1, 0, 1,
-0.4615139, -0.6331245, -3.852075, 0.2431373, 1, 0, 1,
-0.4607063, 0.2317123, -1.379263, 0.2352941, 1, 0, 1,
-0.4598769, -1.086367, -5.203178, 0.2313726, 1, 0, 1,
-0.4560404, -1.525628, -3.534204, 0.2235294, 1, 0, 1,
-0.453944, -0.09174182, -1.707566, 0.2196078, 1, 0, 1,
-0.4532993, 1.102613, 0.6346989, 0.2117647, 1, 0, 1,
-0.448954, -0.3246549, -2.530394, 0.2078431, 1, 0, 1,
-0.4475579, 1.834733, -1.78576, 0.2, 1, 0, 1,
-0.4475267, -0.1507987, -2.443556, 0.1921569, 1, 0, 1,
-0.4468434, -0.8581336, -3.443795, 0.1882353, 1, 0, 1,
-0.4432742, 2.403451, 1.143835, 0.1803922, 1, 0, 1,
-0.4393009, -0.1061084, -3.599336, 0.1764706, 1, 0, 1,
-0.4380961, -1.215318, -1.522309, 0.1686275, 1, 0, 1,
-0.4379559, 1.878837, -0.3382553, 0.1647059, 1, 0, 1,
-0.4342123, -1.428103, -1.583287, 0.1568628, 1, 0, 1,
-0.4340708, 0.7476086, -1.186958, 0.1529412, 1, 0, 1,
-0.4305808, 2.586938, -0.05656425, 0.145098, 1, 0, 1,
-0.4304434, -0.5067559, -3.172252, 0.1411765, 1, 0, 1,
-0.4291758, 0.3454715, -0.2314795, 0.1333333, 1, 0, 1,
-0.4291618, -0.3954166, -1.585561, 0.1294118, 1, 0, 1,
-0.4240004, 0.6317642, -1.271702, 0.1215686, 1, 0, 1,
-0.4236787, 0.2521251, -1.174393, 0.1176471, 1, 0, 1,
-0.4222749, 0.7503963, -0.0002861861, 0.1098039, 1, 0, 1,
-0.4208089, -1.565497, -2.644338, 0.1058824, 1, 0, 1,
-0.4162897, -1.312621, -2.743462, 0.09803922, 1, 0, 1,
-0.4124962, -1.060774, -2.628649, 0.09019608, 1, 0, 1,
-0.4110083, -0.0688195, -2.25434, 0.08627451, 1, 0, 1,
-0.4064519, -1.084083, -2.488766, 0.07843138, 1, 0, 1,
-0.4053112, -0.6857716, -2.925533, 0.07450981, 1, 0, 1,
-0.3975582, -0.2995195, -2.86119, 0.06666667, 1, 0, 1,
-0.3967218, 0.4056104, -1.67727, 0.0627451, 1, 0, 1,
-0.3940887, 0.0059041, -2.52988, 0.05490196, 1, 0, 1,
-0.3935983, -0.5989158, -2.54754, 0.05098039, 1, 0, 1,
-0.3864914, 2.152467, -0.6699025, 0.04313726, 1, 0, 1,
-0.3822765, 1.533355, -0.4967999, 0.03921569, 1, 0, 1,
-0.3802393, -0.9766129, -3.399616, 0.03137255, 1, 0, 1,
-0.3776314, 0.6784168, -1.537175, 0.02745098, 1, 0, 1,
-0.3769482, 0.6779912, -1.187981, 0.01960784, 1, 0, 1,
-0.3753798, -0.5829332, -2.007737, 0.01568628, 1, 0, 1,
-0.3740249, 1.174151, 0.5009518, 0.007843138, 1, 0, 1,
-0.3728693, -0.435274, -3.555473, 0.003921569, 1, 0, 1,
-0.371875, -1.081495, -2.067691, 0, 1, 0.003921569, 1,
-0.3692413, 1.02148, -0.7279873, 0, 1, 0.01176471, 1,
-0.3688331, -0.2480535, -2.856043, 0, 1, 0.01568628, 1,
-0.3651689, -0.2046973, 0.06291403, 0, 1, 0.02352941, 1,
-0.3617205, 1.326372, 1.131479, 0, 1, 0.02745098, 1,
-0.3615907, 0.835864, -0.9368095, 0, 1, 0.03529412, 1,
-0.3598118, 0.7880508, -1.545728, 0, 1, 0.03921569, 1,
-0.3567426, -0.9072266, -0.6235255, 0, 1, 0.04705882, 1,
-0.3541851, -0.6069182, -1.286316, 0, 1, 0.05098039, 1,
-0.3537994, -0.01843837, -1.562467, 0, 1, 0.05882353, 1,
-0.35289, -0.521962, -0.8625112, 0, 1, 0.0627451, 1,
-0.3522397, 0.05136167, -2.495789, 0, 1, 0.07058824, 1,
-0.3511491, -0.7585019, -3.137254, 0, 1, 0.07450981, 1,
-0.3499202, 0.7680572, -1.128762, 0, 1, 0.08235294, 1,
-0.3488564, -0.4222671, -2.391771, 0, 1, 0.08627451, 1,
-0.3488477, 0.23044, -1.933607, 0, 1, 0.09411765, 1,
-0.3383927, 0.2504773, -1.569117, 0, 1, 0.1019608, 1,
-0.3358281, 1.424391, -0.3480389, 0, 1, 0.1058824, 1,
-0.3337897, 1.202697, -0.6857067, 0, 1, 0.1137255, 1,
-0.3337792, -0.07663412, -1.164363, 0, 1, 0.1176471, 1,
-0.333127, -0.2552096, -1.878864, 0, 1, 0.1254902, 1,
-0.332771, 1.588515, -0.3534109, 0, 1, 0.1294118, 1,
-0.3320513, -0.6321551, -3.267908, 0, 1, 0.1372549, 1,
-0.3303621, 0.3262917, -1.408294, 0, 1, 0.1411765, 1,
-0.3298226, 0.8635702, -2.556752, 0, 1, 0.1490196, 1,
-0.3284448, -2.183985, -1.946771, 0, 1, 0.1529412, 1,
-0.3245692, -0.3874319, -3.623796, 0, 1, 0.1607843, 1,
-0.3149972, 0.3448642, -2.01748, 0, 1, 0.1647059, 1,
-0.3126252, -0.8226702, -3.699987, 0, 1, 0.172549, 1,
-0.3111297, -1.266824, -4.31762, 0, 1, 0.1764706, 1,
-0.3091185, -0.1706692, -3.111891, 0, 1, 0.1843137, 1,
-0.300113, -0.772168, -2.222522, 0, 1, 0.1882353, 1,
-0.2940243, -0.5831097, -1.721752, 0, 1, 0.1960784, 1,
-0.2933961, -0.392593, -1.932421, 0, 1, 0.2039216, 1,
-0.2889691, 2.276222, 0.5196301, 0, 1, 0.2078431, 1,
-0.2780766, 0.5050842, -1.727367, 0, 1, 0.2156863, 1,
-0.2759028, 0.4418114, 0.6827673, 0, 1, 0.2196078, 1,
-0.269195, -0.2370008, -1.936503, 0, 1, 0.227451, 1,
-0.2605718, 0.506104, -1.004992, 0, 1, 0.2313726, 1,
-0.2601318, 1.739866, 0.4036144, 0, 1, 0.2392157, 1,
-0.260045, 0.8699973, -0.3769864, 0, 1, 0.2431373, 1,
-0.2545989, 1.90248, -0.6149645, 0, 1, 0.2509804, 1,
-0.2541282, 0.03718394, -1.480615, 0, 1, 0.254902, 1,
-0.2539483, 0.3188709, -0.3211916, 0, 1, 0.2627451, 1,
-0.2535343, 0.3617088, 1.486997, 0, 1, 0.2666667, 1,
-0.2535287, -0.4837119, -1.850651, 0, 1, 0.2745098, 1,
-0.2506979, -1.072703, -1.862756, 0, 1, 0.2784314, 1,
-0.2476132, 0.1311194, -1.843396, 0, 1, 0.2862745, 1,
-0.2469293, -1.527019, -4.346721, 0, 1, 0.2901961, 1,
-0.2459847, -0.3487045, -1.996472, 0, 1, 0.2980392, 1,
-0.2455095, -1.609398, -2.653144, 0, 1, 0.3058824, 1,
-0.2449551, 0.809644, -0.02328488, 0, 1, 0.3098039, 1,
-0.2442984, 0.05967776, -1.792746, 0, 1, 0.3176471, 1,
-0.2355821, 1.012322, 1.01563, 0, 1, 0.3215686, 1,
-0.2340469, 0.439258, -0.9973912, 0, 1, 0.3294118, 1,
-0.231583, 1.348323, 0.8450773, 0, 1, 0.3333333, 1,
-0.224248, 0.308732, 0.6435586, 0, 1, 0.3411765, 1,
-0.2229824, -1.274979, -3.441357, 0, 1, 0.345098, 1,
-0.2206705, -0.3378296, -3.244545, 0, 1, 0.3529412, 1,
-0.220517, -0.613619, -2.644839, 0, 1, 0.3568628, 1,
-0.2171423, -0.9569181, -2.441335, 0, 1, 0.3647059, 1,
-0.2098139, 1.966643, -0.6371486, 0, 1, 0.3686275, 1,
-0.2007868, -1.483004, -4.088308, 0, 1, 0.3764706, 1,
-0.1993966, -0.3031024, -2.465917, 0, 1, 0.3803922, 1,
-0.1972371, 1.023677, 0.539336, 0, 1, 0.3882353, 1,
-0.1948504, 0.3361468, 0.920274, 0, 1, 0.3921569, 1,
-0.1881651, -0.3103597, -1.576888, 0, 1, 0.4, 1,
-0.1830699, -0.8906773, -1.610033, 0, 1, 0.4078431, 1,
-0.1820858, 0.5868286, 1.100285, 0, 1, 0.4117647, 1,
-0.1808864, 1.590487, 1.406388, 0, 1, 0.4196078, 1,
-0.1792645, 0.8697018, 1.033688, 0, 1, 0.4235294, 1,
-0.1724118, -1.61734, -3.582947, 0, 1, 0.4313726, 1,
-0.1707533, -0.3305296, -2.006295, 0, 1, 0.4352941, 1,
-0.1646142, 2.494128, 1.402969, 0, 1, 0.4431373, 1,
-0.1570086, 1.194334, 0.1395302, 0, 1, 0.4470588, 1,
-0.1560298, 0.5006025, -1.336762, 0, 1, 0.454902, 1,
-0.1531241, -1.537688, -1.737156, 0, 1, 0.4588235, 1,
-0.1491549, -0.6355503, -2.981067, 0, 1, 0.4666667, 1,
-0.1482284, -0.9309338, -2.070552, 0, 1, 0.4705882, 1,
-0.1463994, 0.8174471, -0.7398686, 0, 1, 0.4784314, 1,
-0.1429598, 0.8342503, -0.1810104, 0, 1, 0.4823529, 1,
-0.1385177, 0.1513657, -0.8490437, 0, 1, 0.4901961, 1,
-0.1371317, -0.4940664, -3.44907, 0, 1, 0.4941176, 1,
-0.1275176, 0.3794333, 1.782165, 0, 1, 0.5019608, 1,
-0.1252136, -0.2301968, -1.808874, 0, 1, 0.509804, 1,
-0.1225172, 1.46883, -0.623271, 0, 1, 0.5137255, 1,
-0.1223431, -0.3654864, -5.151112, 0, 1, 0.5215687, 1,
-0.121558, -2.276389, -2.246931, 0, 1, 0.5254902, 1,
-0.1201319, -1.095313, -2.910904, 0, 1, 0.5333334, 1,
-0.1164295, -0.5458474, -3.394585, 0, 1, 0.5372549, 1,
-0.115453, 1.262303, 0.6516981, 0, 1, 0.5450981, 1,
-0.1152636, -0.477944, -2.336113, 0, 1, 0.5490196, 1,
-0.1119517, 1.219768, -1.168843, 0, 1, 0.5568628, 1,
-0.1118174, 1.991758, 0.9936464, 0, 1, 0.5607843, 1,
-0.1102878, 1.500149, -0.5734601, 0, 1, 0.5686275, 1,
-0.1096934, -0.616176, -3.814241, 0, 1, 0.572549, 1,
-0.1088489, 0.7388783, 0.2470716, 0, 1, 0.5803922, 1,
-0.1087, 1.905642, -0.3690156, 0, 1, 0.5843138, 1,
-0.1082643, -0.2496192, -2.785701, 0, 1, 0.5921569, 1,
-0.1059425, -1.047281, -4.156731, 0, 1, 0.5960785, 1,
-0.1010982, -0.08343856, -0.9606746, 0, 1, 0.6039216, 1,
-0.09838502, -0.8707684, -3.825509, 0, 1, 0.6117647, 1,
-0.09606816, -0.8659729, -3.368168, 0, 1, 0.6156863, 1,
-0.0885235, -1.131107, -4.416492, 0, 1, 0.6235294, 1,
-0.08773104, -0.1917437, -2.40686, 0, 1, 0.627451, 1,
-0.08376633, 0.3080177, 0.02134193, 0, 1, 0.6352941, 1,
-0.0831881, 0.2283434, -1.728616, 0, 1, 0.6392157, 1,
-0.08287335, -0.7707622, -2.548423, 0, 1, 0.6470588, 1,
-0.08213823, 0.0867589, -0.7631981, 0, 1, 0.6509804, 1,
-0.08109543, 1.282659, 0.876816, 0, 1, 0.6588235, 1,
-0.07985669, -1.364158, -3.062948, 0, 1, 0.6627451, 1,
-0.07684328, -1.104763, -3.745206, 0, 1, 0.6705883, 1,
-0.07557022, 1.270792, 1.705423, 0, 1, 0.6745098, 1,
-0.07046936, -0.1478085, -2.948535, 0, 1, 0.682353, 1,
-0.06453762, -1.920262, -1.979919, 0, 1, 0.6862745, 1,
-0.06228115, -0.416379, -2.728576, 0, 1, 0.6941177, 1,
-0.06073718, -0.5917624, -4.524188, 0, 1, 0.7019608, 1,
-0.05978925, 0.1056162, -0.2684903, 0, 1, 0.7058824, 1,
-0.05543678, -0.2755578, -2.702526, 0, 1, 0.7137255, 1,
-0.05459959, -0.3570397, -2.851938, 0, 1, 0.7176471, 1,
-0.04845521, -0.0576551, -2.54235, 0, 1, 0.7254902, 1,
-0.04742303, -1.379475, -1.207696, 0, 1, 0.7294118, 1,
-0.04732303, -1.111578, -3.708432, 0, 1, 0.7372549, 1,
-0.0454933, 0.9097063, 0.2717777, 0, 1, 0.7411765, 1,
-0.04520441, 0.3764857, 1.330469, 0, 1, 0.7490196, 1,
-0.04322141, 0.3834395, 2.725323, 0, 1, 0.7529412, 1,
-0.04309563, 0.0310041, -0.6687222, 0, 1, 0.7607843, 1,
-0.04108528, -0.8453866, -3.146187, 0, 1, 0.7647059, 1,
-0.03745406, -0.1247628, -3.129655, 0, 1, 0.772549, 1,
-0.03401652, 0.8856481, -1.609179, 0, 1, 0.7764706, 1,
-0.03111491, -0.6012893, -2.230499, 0, 1, 0.7843137, 1,
-0.02235761, 0.6586565, 1.099543, 0, 1, 0.7882353, 1,
-0.02102614, 0.5694069, 0.423735, 0, 1, 0.7960784, 1,
-0.01631512, -1.196116, -2.299108, 0, 1, 0.8039216, 1,
-0.01481783, -1.457397, -3.161083, 0, 1, 0.8078431, 1,
-0.01469692, -0.1381526, -2.576949, 0, 1, 0.8156863, 1,
-0.01404669, 1.015072, 0.5301264, 0, 1, 0.8196079, 1,
-0.01335065, -0.5077596, -2.142198, 0, 1, 0.827451, 1,
-0.01176991, -0.907035, -2.124769, 0, 1, 0.8313726, 1,
-0.004462901, 0.1697017, 1.025324, 0, 1, 0.8392157, 1,
-0.002572589, -0.4642799, -3.242556, 0, 1, 0.8431373, 1,
-0.002031691, 1.035599, 0.7165297, 0, 1, 0.8509804, 1,
-0.001173266, -0.4561402, -3.739961, 0, 1, 0.854902, 1,
-0.0005084968, 0.3828733, -0.1635028, 0, 1, 0.8627451, 1,
0.001286594, -0.1616655, 2.302909, 0, 1, 0.8666667, 1,
0.001712519, 1.734557, -1.193102, 0, 1, 0.8745098, 1,
0.005024919, -1.813142, 1.016458, 0, 1, 0.8784314, 1,
0.009568891, -0.8225008, 3.523293, 0, 1, 0.8862745, 1,
0.01584343, 1.153824, -0.2930444, 0, 1, 0.8901961, 1,
0.01882811, 1.551644, -1.593189, 0, 1, 0.8980392, 1,
0.01990439, -1.885625, 2.576372, 0, 1, 0.9058824, 1,
0.02113843, -1.478567, 2.028734, 0, 1, 0.9098039, 1,
0.0222825, -0.475921, 3.001778, 0, 1, 0.9176471, 1,
0.02542691, -1.377229, 2.098246, 0, 1, 0.9215686, 1,
0.02614564, 0.3858823, -0.319997, 0, 1, 0.9294118, 1,
0.02698926, -0.5130491, 2.313719, 0, 1, 0.9333333, 1,
0.03179254, -0.1016852, 3.178884, 0, 1, 0.9411765, 1,
0.03196217, -0.58931, 1.559731, 0, 1, 0.945098, 1,
0.03378563, 1.564835, 0.06908795, 0, 1, 0.9529412, 1,
0.04481167, 0.644225, 0.4168895, 0, 1, 0.9568627, 1,
0.04624122, 0.5820678, -0.815051, 0, 1, 0.9647059, 1,
0.0481233, 0.1678286, 0.2542407, 0, 1, 0.9686275, 1,
0.04862117, 0.7020135, 1.665865, 0, 1, 0.9764706, 1,
0.0502977, 0.2549713, -1.586961, 0, 1, 0.9803922, 1,
0.05056067, -1.95941, 3.340942, 0, 1, 0.9882353, 1,
0.05170396, 0.3178765, -1.011604, 0, 1, 0.9921569, 1,
0.05557514, -0.5220824, 1.56571, 0, 1, 1, 1,
0.05578737, 0.3133157, -0.6313457, 0, 0.9921569, 1, 1,
0.05828141, -0.5676802, 3.417482, 0, 0.9882353, 1, 1,
0.06138241, -1.415196, 2.556973, 0, 0.9803922, 1, 1,
0.0619671, 0.8608388, 0.8506166, 0, 0.9764706, 1, 1,
0.06824925, 0.7255536, -0.711074, 0, 0.9686275, 1, 1,
0.07030044, -0.9240525, 3.818542, 0, 0.9647059, 1, 1,
0.07455122, -0.181232, 1.349583, 0, 0.9568627, 1, 1,
0.07646549, 0.4296364, 0.3383018, 0, 0.9529412, 1, 1,
0.07687423, -0.7159965, 3.050033, 0, 0.945098, 1, 1,
0.07846632, -1.520338, 2.267568, 0, 0.9411765, 1, 1,
0.08478491, -0.3845155, 4.484677, 0, 0.9333333, 1, 1,
0.08640683, 0.9147534, -0.4341072, 0, 0.9294118, 1, 1,
0.09001254, -0.2159634, 3.6164, 0, 0.9215686, 1, 1,
0.09182009, 1.451831, -0.2463885, 0, 0.9176471, 1, 1,
0.09309223, -0.9973043, 2.591946, 0, 0.9098039, 1, 1,
0.0935909, -1.972791, 4.061995, 0, 0.9058824, 1, 1,
0.1017635, 0.8486589, 2.135596, 0, 0.8980392, 1, 1,
0.1052942, -1.59355, 1.976405, 0, 0.8901961, 1, 1,
0.1067539, 0.3289598, -0.08078059, 0, 0.8862745, 1, 1,
0.1070752, 0.7941173, 0.4168648, 0, 0.8784314, 1, 1,
0.1096917, -1.39346, 2.268564, 0, 0.8745098, 1, 1,
0.110193, -0.3306347, 2.501922, 0, 0.8666667, 1, 1,
0.1197641, -0.3465591, 2.674717, 0, 0.8627451, 1, 1,
0.1207498, -0.9982046, 3.478382, 0, 0.854902, 1, 1,
0.1211277, 0.1319068, 1.445486, 0, 0.8509804, 1, 1,
0.1289009, 0.01485121, 0.7860513, 0, 0.8431373, 1, 1,
0.1306513, 1.387395, -0.2483463, 0, 0.8392157, 1, 1,
0.1338883, 0.448284, 1.652249, 0, 0.8313726, 1, 1,
0.1342454, 1.024827, -0.8770058, 0, 0.827451, 1, 1,
0.134611, -1.388791, 4.708801, 0, 0.8196079, 1, 1,
0.1346497, -1.157134, 2.391497, 0, 0.8156863, 1, 1,
0.1419399, -0.7656749, 4.323022, 0, 0.8078431, 1, 1,
0.1428569, 0.776709, -0.8820741, 0, 0.8039216, 1, 1,
0.1430961, -0.00306303, 0.09109236, 0, 0.7960784, 1, 1,
0.1433566, 1.199368, 0.2910985, 0, 0.7882353, 1, 1,
0.1435905, 0.6124883, 1.304189, 0, 0.7843137, 1, 1,
0.1444583, 1.828319, 1.334376, 0, 0.7764706, 1, 1,
0.1483127, -1.526173, 1.491619, 0, 0.772549, 1, 1,
0.1484713, -1.418006, 3.646897, 0, 0.7647059, 1, 1,
0.1519278, -0.955663, 1.984404, 0, 0.7607843, 1, 1,
0.1535717, 0.06820238, 1.386619, 0, 0.7529412, 1, 1,
0.1550318, -0.5232994, 2.131433, 0, 0.7490196, 1, 1,
0.1572497, 0.770349, 0.5601931, 0, 0.7411765, 1, 1,
0.159431, -0.1726001, 3.07835, 0, 0.7372549, 1, 1,
0.1685516, 1.585955, 0.6889811, 0, 0.7294118, 1, 1,
0.1714872, 1.607289, -0.3929316, 0, 0.7254902, 1, 1,
0.1764358, 0.9337326, 0.384941, 0, 0.7176471, 1, 1,
0.177279, -0.5176542, 3.464686, 0, 0.7137255, 1, 1,
0.1780629, 0.6650229, 0.2257012, 0, 0.7058824, 1, 1,
0.180806, 0.07572823, 1.6149, 0, 0.6980392, 1, 1,
0.1895753, -0.03377749, 2.112062, 0, 0.6941177, 1, 1,
0.1978411, 1.003004, 0.7359282, 0, 0.6862745, 1, 1,
0.2041229, 0.2154939, 0.3207267, 0, 0.682353, 1, 1,
0.2121816, 0.5363178, 0.9492509, 0, 0.6745098, 1, 1,
0.2135008, -0.5174618, 1.65376, 0, 0.6705883, 1, 1,
0.2145658, 0.5068216, 0.8959381, 0, 0.6627451, 1, 1,
0.2167175, 1.897277, -0.5481481, 0, 0.6588235, 1, 1,
0.2198871, 0.351922, -1.240191, 0, 0.6509804, 1, 1,
0.2202032, 1.812694, 0.8165232, 0, 0.6470588, 1, 1,
0.2243623, -1.180745, 2.382155, 0, 0.6392157, 1, 1,
0.2244856, -1.090707, 3.74646, 0, 0.6352941, 1, 1,
0.2273757, -0.7052004, 3.101346, 0, 0.627451, 1, 1,
0.2274057, -1.118967, 3.362766, 0, 0.6235294, 1, 1,
0.2274195, 0.9505204, 1.031823, 0, 0.6156863, 1, 1,
0.2303677, -1.024016, 2.715661, 0, 0.6117647, 1, 1,
0.2351716, -1.432756, 1.357246, 0, 0.6039216, 1, 1,
0.2380138, -1.52686, 4.649391, 0, 0.5960785, 1, 1,
0.2471726, 0.4143547, -0.5065977, 0, 0.5921569, 1, 1,
0.2504925, 1.483396, 1.179222, 0, 0.5843138, 1, 1,
0.2572756, 0.7848913, 1.182126, 0, 0.5803922, 1, 1,
0.2595248, 0.8963015, 1.77733, 0, 0.572549, 1, 1,
0.2631022, -0.340626, 3.503711, 0, 0.5686275, 1, 1,
0.2673934, 0.5569654, -0.3361093, 0, 0.5607843, 1, 1,
0.2677193, 1.156611, 2.604623, 0, 0.5568628, 1, 1,
0.2702854, -0.7852119, 3.140496, 0, 0.5490196, 1, 1,
0.2708566, 0.5494642, -1.479789, 0, 0.5450981, 1, 1,
0.271932, 0.2919565, 0.2826702, 0, 0.5372549, 1, 1,
0.2745053, -0.5492173, 4.93567, 0, 0.5333334, 1, 1,
0.281278, -0.2097481, 1.557484, 0, 0.5254902, 1, 1,
0.2846153, 0.4930608, 1.695604, 0, 0.5215687, 1, 1,
0.2860359, 1.392082, -1.187595, 0, 0.5137255, 1, 1,
0.291215, -0.8774631, 2.312025, 0, 0.509804, 1, 1,
0.29212, -0.9259834, 0.3714445, 0, 0.5019608, 1, 1,
0.2929197, 0.04282941, 1.171456, 0, 0.4941176, 1, 1,
0.2949057, -1.178342, 1.333871, 0, 0.4901961, 1, 1,
0.3046391, -0.1343986, 2.457429, 0, 0.4823529, 1, 1,
0.3055679, -0.5534568, 1.877117, 0, 0.4784314, 1, 1,
0.3072685, 1.661928, -0.0919134, 0, 0.4705882, 1, 1,
0.3096048, 0.7050065, 0.5460892, 0, 0.4666667, 1, 1,
0.3131536, -0.9057975, 1.82492, 0, 0.4588235, 1, 1,
0.3144244, 1.488706, -2.297636, 0, 0.454902, 1, 1,
0.3144843, -0.6472526, 1.485776, 0, 0.4470588, 1, 1,
0.3163502, -0.4715392, 2.920973, 0, 0.4431373, 1, 1,
0.3195239, -0.5870112, 3.321976, 0, 0.4352941, 1, 1,
0.3306688, -1.061808, 3.288868, 0, 0.4313726, 1, 1,
0.3322224, 0.5261731, -0.0677246, 0, 0.4235294, 1, 1,
0.3327993, 0.09568968, 0.8311452, 0, 0.4196078, 1, 1,
0.3346711, -0.7231271, 3.136849, 0, 0.4117647, 1, 1,
0.3350974, 0.6742883, -0.5008232, 0, 0.4078431, 1, 1,
0.336379, -1.039269, 2.965267, 0, 0.4, 1, 1,
0.3390539, 0.06933157, 0.7864379, 0, 0.3921569, 1, 1,
0.3415836, -0.5096995, 2.639078, 0, 0.3882353, 1, 1,
0.343858, 0.4845138, 2.671855, 0, 0.3803922, 1, 1,
0.347305, 0.6146644, 0.9430391, 0, 0.3764706, 1, 1,
0.3486132, 1.083877, -1.35158, 0, 0.3686275, 1, 1,
0.3515466, -1.045517, 2.634848, 0, 0.3647059, 1, 1,
0.3532929, 0.3593937, 0.9670499, 0, 0.3568628, 1, 1,
0.3542561, 1.014845, 1.68372, 0, 0.3529412, 1, 1,
0.3552903, -0.2673367, 2.382262, 0, 0.345098, 1, 1,
0.3555728, -0.2783131, 1.721932, 0, 0.3411765, 1, 1,
0.3563074, 0.1602056, 1.172192, 0, 0.3333333, 1, 1,
0.3587375, 0.0005857372, 1.452646, 0, 0.3294118, 1, 1,
0.3595321, 0.7750328, 0.3021981, 0, 0.3215686, 1, 1,
0.3611276, 1.140227, 1.010542, 0, 0.3176471, 1, 1,
0.3645428, -0.7479134, 2.920834, 0, 0.3098039, 1, 1,
0.3654432, -0.8185259, 3.725772, 0, 0.3058824, 1, 1,
0.3671024, 0.07612769, 2.270851, 0, 0.2980392, 1, 1,
0.3678903, 1.026388, 0.7998931, 0, 0.2901961, 1, 1,
0.3709202, 1.529597, 0.7412415, 0, 0.2862745, 1, 1,
0.3725721, -0.8394992, 3.221764, 0, 0.2784314, 1, 1,
0.3761188, 0.8609952, -0.1521812, 0, 0.2745098, 1, 1,
0.3774808, -0.2952484, 2.364018, 0, 0.2666667, 1, 1,
0.3776596, -0.8495644, 2.651701, 0, 0.2627451, 1, 1,
0.3866975, 1.803214, 1.553064, 0, 0.254902, 1, 1,
0.387591, -0.694568, 1.73574, 0, 0.2509804, 1, 1,
0.3917931, 0.5958328, 2.053548, 0, 0.2431373, 1, 1,
0.3947219, -0.9893787, 2.152836, 0, 0.2392157, 1, 1,
0.3958256, -1.02979, 3.814894, 0, 0.2313726, 1, 1,
0.3969333, 0.8811595, 0.6261017, 0, 0.227451, 1, 1,
0.4025553, 1.244183, -0.4091308, 0, 0.2196078, 1, 1,
0.4035088, 0.3581326, 0.9091563, 0, 0.2156863, 1, 1,
0.403867, 0.8012035, 1.95815, 0, 0.2078431, 1, 1,
0.4040416, 1.017437, 0.4501309, 0, 0.2039216, 1, 1,
0.4040566, -0.3384879, 1.549186, 0, 0.1960784, 1, 1,
0.4088612, -0.3248309, 1.608202, 0, 0.1882353, 1, 1,
0.4120043, -0.5491358, 3.551756, 0, 0.1843137, 1, 1,
0.4143469, -0.103458, 2.357411, 0, 0.1764706, 1, 1,
0.4249414, -1.746899, 3.130111, 0, 0.172549, 1, 1,
0.4278037, -0.01227798, 1.178619, 0, 0.1647059, 1, 1,
0.4289081, -0.1874938, 2.035806, 0, 0.1607843, 1, 1,
0.4330308, -1.204355, 1.69209, 0, 0.1529412, 1, 1,
0.438588, -0.8397049, 3.83067, 0, 0.1490196, 1, 1,
0.4393842, 0.1591844, 0.4991575, 0, 0.1411765, 1, 1,
0.4430336, 1.78169, 1.092824, 0, 0.1372549, 1, 1,
0.4432211, -1.531732, 1.629782, 0, 0.1294118, 1, 1,
0.4444954, 0.1163278, -0.1420814, 0, 0.1254902, 1, 1,
0.4602157, -0.3645053, 2.299984, 0, 0.1176471, 1, 1,
0.4696915, 0.0964265, 1.060223, 0, 0.1137255, 1, 1,
0.4697303, -0.7858805, 1.688166, 0, 0.1058824, 1, 1,
0.4719977, -0.1681671, 2.901767, 0, 0.09803922, 1, 1,
0.4721543, 0.5777959, 1.317964, 0, 0.09411765, 1, 1,
0.4729055, 1.438924, -0.09264779, 0, 0.08627451, 1, 1,
0.4759567, -0.6153481, 1.8405, 0, 0.08235294, 1, 1,
0.4762467, -0.03864342, 0.2990983, 0, 0.07450981, 1, 1,
0.479641, 1.273368, 0.2546104, 0, 0.07058824, 1, 1,
0.4812783, 1.440694, 0.2770625, 0, 0.0627451, 1, 1,
0.4921556, -1.208364, 2.876638, 0, 0.05882353, 1, 1,
0.4937642, -0.4513806, 1.299783, 0, 0.05098039, 1, 1,
0.4950555, 0.5590714, 1.938237, 0, 0.04705882, 1, 1,
0.4955475, -0.7445543, 1.423545, 0, 0.03921569, 1, 1,
0.4965513, -1.342744, 1.380414, 0, 0.03529412, 1, 1,
0.5015658, -1.179683, 1.837547, 0, 0.02745098, 1, 1,
0.5031495, -1.019127, 2.685915, 0, 0.02352941, 1, 1,
0.5050738, 1.678483, 0.4214297, 0, 0.01568628, 1, 1,
0.5054179, 0.580034, 0.9813151, 0, 0.01176471, 1, 1,
0.5071912, -0.4237351, 2.778772, 0, 0.003921569, 1, 1,
0.5096964, 0.2020484, 1.596672, 0.003921569, 0, 1, 1,
0.5142782, -0.5935181, 4.693278, 0.007843138, 0, 1, 1,
0.5160922, 0.6276792, 1.823521, 0.01568628, 0, 1, 1,
0.5203197, 0.8512634, -0.5774472, 0.01960784, 0, 1, 1,
0.5223052, -1.742119, 3.200247, 0.02745098, 0, 1, 1,
0.5263312, -0.1708259, 2.241389, 0.03137255, 0, 1, 1,
0.5309801, 1.366088, 0.4146296, 0.03921569, 0, 1, 1,
0.5315006, 0.5477854, 1.29585, 0.04313726, 0, 1, 1,
0.531858, -0.4093923, 2.913127, 0.05098039, 0, 1, 1,
0.5318707, 0.3778754, 1.858017, 0.05490196, 0, 1, 1,
0.5319903, -0.3233592, 2.107176, 0.0627451, 0, 1, 1,
0.5323558, -0.1078705, 2.725687, 0.06666667, 0, 1, 1,
0.5331726, -0.1175932, 0.7130226, 0.07450981, 0, 1, 1,
0.533942, 1.163831, -0.6413685, 0.07843138, 0, 1, 1,
0.5361166, 0.7447122, -1.021826, 0.08627451, 0, 1, 1,
0.5368672, -1.875871, 2.22448, 0.09019608, 0, 1, 1,
0.538947, -0.2438551, -0.1346441, 0.09803922, 0, 1, 1,
0.5426306, -0.567027, 0.9796744, 0.1058824, 0, 1, 1,
0.5427013, -0.2544146, 1.329907, 0.1098039, 0, 1, 1,
0.5488251, -1.189455, 3.520388, 0.1176471, 0, 1, 1,
0.549364, -0.6540237, 2.161324, 0.1215686, 0, 1, 1,
0.554279, 0.9358494, 0.01461341, 0.1294118, 0, 1, 1,
0.5682375, -0.5688041, 3.784327, 0.1333333, 0, 1, 1,
0.5735952, 1.373171, 0.02496669, 0.1411765, 0, 1, 1,
0.57976, 1.729367, -1.095902, 0.145098, 0, 1, 1,
0.5840325, -0.1654234, 2.28678, 0.1529412, 0, 1, 1,
0.5938132, 0.09758464, -0.0410634, 0.1568628, 0, 1, 1,
0.5980285, -1.647173, 1.660559, 0.1647059, 0, 1, 1,
0.598448, -1.973224, 2.956786, 0.1686275, 0, 1, 1,
0.5984655, 0.489817, 2.270842, 0.1764706, 0, 1, 1,
0.6025766, -0.7980399, 1.572501, 0.1803922, 0, 1, 1,
0.6038653, -0.1578593, 0.8541074, 0.1882353, 0, 1, 1,
0.6048495, -0.5184384, 1.726514, 0.1921569, 0, 1, 1,
0.6086007, 0.993026, 1.071494, 0.2, 0, 1, 1,
0.6117995, -0.2967609, 2.575113, 0.2078431, 0, 1, 1,
0.6119158, -0.2519387, 1.023441, 0.2117647, 0, 1, 1,
0.6169226, -0.4957729, 2.128957, 0.2196078, 0, 1, 1,
0.6175701, 0.8889192, 0.5693367, 0.2235294, 0, 1, 1,
0.6194963, -0.4700049, 1.916895, 0.2313726, 0, 1, 1,
0.6212365, 0.5249569, 0.1922165, 0.2352941, 0, 1, 1,
0.6245828, 0.9738391, -0.3886061, 0.2431373, 0, 1, 1,
0.6323323, -0.9541703, 2.834684, 0.2470588, 0, 1, 1,
0.6353278, 0.163603, -0.3747528, 0.254902, 0, 1, 1,
0.6361337, 0.4430976, 0.6362668, 0.2588235, 0, 1, 1,
0.6388366, 0.5388462, 0.5223458, 0.2666667, 0, 1, 1,
0.639171, -1.396417, 2.571945, 0.2705882, 0, 1, 1,
0.642075, 0.9583127, 2.247452, 0.2784314, 0, 1, 1,
0.6445664, -0.08122785, 2.297704, 0.282353, 0, 1, 1,
0.6459086, 1.182783, -0.2737125, 0.2901961, 0, 1, 1,
0.6476644, -0.2120498, 1.35771, 0.2941177, 0, 1, 1,
0.6528926, 0.2687382, -0.1270196, 0.3019608, 0, 1, 1,
0.6553165, 0.3552591, 0.2363695, 0.3098039, 0, 1, 1,
0.6580456, 1.338071, -1.246747, 0.3137255, 0, 1, 1,
0.6588966, 0.2026058, 0.4221629, 0.3215686, 0, 1, 1,
0.6611484, 0.4344252, 0.1673991, 0.3254902, 0, 1, 1,
0.6640887, 1.331746, 0.1430453, 0.3333333, 0, 1, 1,
0.6642349, -0.3180685, 0.8418431, 0.3372549, 0, 1, 1,
0.6676219, 0.37245, -0.6392305, 0.345098, 0, 1, 1,
0.6718252, -0.6261309, 3.35177, 0.3490196, 0, 1, 1,
0.6740564, 1.71718, 0.7650943, 0.3568628, 0, 1, 1,
0.6758228, 0.2610746, 0.6579449, 0.3607843, 0, 1, 1,
0.6775683, 0.8981626, 1.715207, 0.3686275, 0, 1, 1,
0.6783227, 1.031849, 0.06937796, 0.372549, 0, 1, 1,
0.6784832, -0.2588192, 2.557797, 0.3803922, 0, 1, 1,
0.6795124, -0.4444864, 1.103031, 0.3843137, 0, 1, 1,
0.6843087, -0.3081023, 3.950373, 0.3921569, 0, 1, 1,
0.6929723, -1.167572, 2.719853, 0.3960784, 0, 1, 1,
0.6944228, -0.8387456, 0.2314121, 0.4039216, 0, 1, 1,
0.7014289, 0.5727841, 0.9774674, 0.4117647, 0, 1, 1,
0.7015613, 0.7901521, 1.258214, 0.4156863, 0, 1, 1,
0.7033359, 0.3263172, 0.2386828, 0.4235294, 0, 1, 1,
0.7035564, 0.08623619, 1.911433, 0.427451, 0, 1, 1,
0.7044137, -0.04942546, 1.360148, 0.4352941, 0, 1, 1,
0.7045907, -0.5859237, 2.358439, 0.4392157, 0, 1, 1,
0.7046388, -1.813822, 3.882087, 0.4470588, 0, 1, 1,
0.7051982, -1.367017, 2.260198, 0.4509804, 0, 1, 1,
0.7058969, -1.298851, 3.932066, 0.4588235, 0, 1, 1,
0.7063512, 0.8796811, 0.7270421, 0.4627451, 0, 1, 1,
0.7079709, -0.6851382, 2.068851, 0.4705882, 0, 1, 1,
0.709062, 0.5403627, -1.76357, 0.4745098, 0, 1, 1,
0.7120218, -0.8157094, 2.655817, 0.4823529, 0, 1, 1,
0.7154623, -3.3087, 3.526604, 0.4862745, 0, 1, 1,
0.7181139, 0.671243, 1.153214, 0.4941176, 0, 1, 1,
0.7195119, 1.524018, 0.0366524, 0.5019608, 0, 1, 1,
0.7205934, 0.2863847, 0.4326501, 0.5058824, 0, 1, 1,
0.7213854, -0.8489405, 0.9746577, 0.5137255, 0, 1, 1,
0.7259524, 0.6083468, 1.808638, 0.5176471, 0, 1, 1,
0.7334305, 1.499257, 0.3593543, 0.5254902, 0, 1, 1,
0.7341946, -0.05458231, 1.155573, 0.5294118, 0, 1, 1,
0.7497408, -0.1811027, 0.9494479, 0.5372549, 0, 1, 1,
0.7507281, 0.5580364, 0.8280833, 0.5411765, 0, 1, 1,
0.7511415, 1.987738, -0.05760735, 0.5490196, 0, 1, 1,
0.7534027, 1.220841, -0.3438317, 0.5529412, 0, 1, 1,
0.7659993, 0.4822304, 1.966771, 0.5607843, 0, 1, 1,
0.7671425, -0.008838462, 3.901764, 0.5647059, 0, 1, 1,
0.771262, 0.3723429, 1.747137, 0.572549, 0, 1, 1,
0.7744366, -0.3442197, 0.7296847, 0.5764706, 0, 1, 1,
0.7771015, -0.5890948, 3.260106, 0.5843138, 0, 1, 1,
0.7790143, 1.543711, 2.065605, 0.5882353, 0, 1, 1,
0.7798073, 0.4305026, -0.5919155, 0.5960785, 0, 1, 1,
0.7798213, 1.199835, 1.731966, 0.6039216, 0, 1, 1,
0.7812865, -0.8276049, 4.233718, 0.6078432, 0, 1, 1,
0.7874096, -0.5818956, 2.068319, 0.6156863, 0, 1, 1,
0.7876144, 0.9947966, 1.015442, 0.6196079, 0, 1, 1,
0.787974, 0.8047835, 1.541349, 0.627451, 0, 1, 1,
0.7925414, -0.1909232, 2.629495, 0.6313726, 0, 1, 1,
0.7928938, -0.5154213, 1.586028, 0.6392157, 0, 1, 1,
0.7979634, 0.2730416, 0.3289293, 0.6431373, 0, 1, 1,
0.7992562, -0.2252257, 2.654351, 0.6509804, 0, 1, 1,
0.8020272, -0.8809535, 1.063415, 0.654902, 0, 1, 1,
0.8024377, -0.8260224, 3.231208, 0.6627451, 0, 1, 1,
0.8037184, 1.207774, -0.4281608, 0.6666667, 0, 1, 1,
0.8041571, 1.190567, -0.2084772, 0.6745098, 0, 1, 1,
0.8054004, 0.2842692, -0.4008625, 0.6784314, 0, 1, 1,
0.8056819, 1.429427, 1.38619, 0.6862745, 0, 1, 1,
0.8069065, -1.175545, 2.696293, 0.6901961, 0, 1, 1,
0.8090261, 0.08472503, 1.608263, 0.6980392, 0, 1, 1,
0.8173108, -0.34067, 2.063076, 0.7058824, 0, 1, 1,
0.8173574, 0.2697228, 2.386877, 0.7098039, 0, 1, 1,
0.8199391, 0.2831424, 2.019334, 0.7176471, 0, 1, 1,
0.822255, -0.9237071, 2.737041, 0.7215686, 0, 1, 1,
0.8266721, 0.4428836, -0.4154674, 0.7294118, 0, 1, 1,
0.8275657, -0.7723052, 2.014151, 0.7333333, 0, 1, 1,
0.8333074, 1.961833, -0.7514843, 0.7411765, 0, 1, 1,
0.8442907, 1.597073, 0.2597372, 0.7450981, 0, 1, 1,
0.8450184, 1.578218, -2.176789, 0.7529412, 0, 1, 1,
0.8463574, 0.3592407, 1.403872, 0.7568628, 0, 1, 1,
0.8527241, 1.368341, 0.9520606, 0.7647059, 0, 1, 1,
0.8547121, -1.664155, 4.002013, 0.7686275, 0, 1, 1,
0.8548112, -0.1975805, 1.524709, 0.7764706, 0, 1, 1,
0.8550698, 0.4687886, 0.1067252, 0.7803922, 0, 1, 1,
0.857256, 0.4594699, 1.988622, 0.7882353, 0, 1, 1,
0.8579566, -1.011226, 2.77863, 0.7921569, 0, 1, 1,
0.8598334, 0.1385949, 2.205607, 0.8, 0, 1, 1,
0.8621799, -0.7477033, 1.376409, 0.8078431, 0, 1, 1,
0.8669411, -2.531151, 1.590367, 0.8117647, 0, 1, 1,
0.8695429, -1.38396, 2.531109, 0.8196079, 0, 1, 1,
0.8699516, -1.52693, 2.693676, 0.8235294, 0, 1, 1,
0.8747638, -1.413783, 4.678889, 0.8313726, 0, 1, 1,
0.877746, -1.11048, 1.379266, 0.8352941, 0, 1, 1,
0.8777623, 0.0237111, 1.093622, 0.8431373, 0, 1, 1,
0.8791391, -0.7445913, 2.836788, 0.8470588, 0, 1, 1,
0.8827882, 1.154135, 0.8585184, 0.854902, 0, 1, 1,
0.8834488, -1.204733, 3.88489, 0.8588235, 0, 1, 1,
0.8837516, 1.243825, 0.3496094, 0.8666667, 0, 1, 1,
0.8839714, 1.073952, 0.8464652, 0.8705882, 0, 1, 1,
0.898186, 0.1187741, -0.276276, 0.8784314, 0, 1, 1,
0.900004, -1.445825, 3.587361, 0.8823529, 0, 1, 1,
0.9019471, -1.610625, 3.435201, 0.8901961, 0, 1, 1,
0.9047056, -0.06620056, 2.444766, 0.8941177, 0, 1, 1,
0.9106333, 1.595432, -0.7350535, 0.9019608, 0, 1, 1,
0.9117467, 0.3082471, 1.576838, 0.9098039, 0, 1, 1,
0.9126668, 1.960839, 0.5062994, 0.9137255, 0, 1, 1,
0.9131203, 0.03969105, 1.253406, 0.9215686, 0, 1, 1,
0.9136463, -0.001792139, 2.470096, 0.9254902, 0, 1, 1,
0.9155746, -0.1109275, 1.818353, 0.9333333, 0, 1, 1,
0.9163154, 0.3887857, 2.578157, 0.9372549, 0, 1, 1,
0.9359923, 0.7165395, 0.550912, 0.945098, 0, 1, 1,
0.9419858, 1.939839, 3.746226, 0.9490196, 0, 1, 1,
0.9452294, 0.673555, 2.610955, 0.9568627, 0, 1, 1,
0.9459557, -0.8753831, 2.825855, 0.9607843, 0, 1, 1,
0.9474021, -0.2747297, 3.878608, 0.9686275, 0, 1, 1,
0.9478464, 0.4817947, 1.519985, 0.972549, 0, 1, 1,
0.9492913, -0.5857596, 2.47327, 0.9803922, 0, 1, 1,
0.95958, 1.186418, -0.5013275, 0.9843137, 0, 1, 1,
0.9616097, -0.01374085, 1.782796, 0.9921569, 0, 1, 1,
0.9636493, -0.9827864, 1.071505, 0.9960784, 0, 1, 1,
0.9726752, 0.2104564, 0.5674061, 1, 0, 0.9960784, 1,
0.9739177, 0.1985462, 3.241858, 1, 0, 0.9882353, 1,
0.9763492, -1.362967, 1.98316, 1, 0, 0.9843137, 1,
0.9781739, 0.8641295, -0.9810186, 1, 0, 0.9764706, 1,
0.9781978, 0.367984, 1.849687, 1, 0, 0.972549, 1,
0.9792414, -0.1277141, 0.6512823, 1, 0, 0.9647059, 1,
0.9823161, -0.002160927, 2.08755, 1, 0, 0.9607843, 1,
0.9892471, 0.3961632, 0.706021, 1, 0, 0.9529412, 1,
0.9962869, -0.4682168, 0.8950102, 1, 0, 0.9490196, 1,
1.004787, 1.560199, -0.4454014, 1, 0, 0.9411765, 1,
1.007583, 0.2834037, 0.8208686, 1, 0, 0.9372549, 1,
1.010842, -0.8131748, 2.357889, 1, 0, 0.9294118, 1,
1.014896, 0.3278718, 1.734205, 1, 0, 0.9254902, 1,
1.026192, -0.3729407, 0.6506331, 1, 0, 0.9176471, 1,
1.027672, -0.9569578, 2.591599, 1, 0, 0.9137255, 1,
1.028558, -1.076346, 2.27361, 1, 0, 0.9058824, 1,
1.029338, -1.689715, 2.07955, 1, 0, 0.9019608, 1,
1.029414, -0.4270819, 0.6626475, 1, 0, 0.8941177, 1,
1.030496, -0.04977965, 0.1594034, 1, 0, 0.8862745, 1,
1.03844, 0.6338667, 1.535574, 1, 0, 0.8823529, 1,
1.039088, -0.8592681, 3.031426, 1, 0, 0.8745098, 1,
1.040601, 0.8217645, 0.4968871, 1, 0, 0.8705882, 1,
1.041547, -1.793819, 4.461712, 1, 0, 0.8627451, 1,
1.056844, -0.6944771, 2.049912, 1, 0, 0.8588235, 1,
1.060426, 1.694213, 0.2302351, 1, 0, 0.8509804, 1,
1.062435, 1.143197, 1.993828, 1, 0, 0.8470588, 1,
1.062466, -1.399915, 1.41371, 1, 0, 0.8392157, 1,
1.076788, 1.12517, 0.4015309, 1, 0, 0.8352941, 1,
1.082257, 1.061677, 0.6932155, 1, 0, 0.827451, 1,
1.084282, -1.120928, 1.752663, 1, 0, 0.8235294, 1,
1.086503, -2.218601, 1.156814, 1, 0, 0.8156863, 1,
1.087364, 0.5741279, 1.065766, 1, 0, 0.8117647, 1,
1.110575, 1.211683, -0.2053569, 1, 0, 0.8039216, 1,
1.111194, 2.408324, 0.1290378, 1, 0, 0.7960784, 1,
1.129953, -0.1323805, 2.490396, 1, 0, 0.7921569, 1,
1.131456, -1.274237, 2.269907, 1, 0, 0.7843137, 1,
1.138143, -0.05940511, 1.512998, 1, 0, 0.7803922, 1,
1.141411, -0.9179213, 3.207606, 1, 0, 0.772549, 1,
1.14758, -0.4674838, 3.411733, 1, 0, 0.7686275, 1,
1.151246, -0.926212, 2.79684, 1, 0, 0.7607843, 1,
1.159561, -0.5351045, 2.295913, 1, 0, 0.7568628, 1,
1.162225, 0.6735314, 0.4766246, 1, 0, 0.7490196, 1,
1.165976, -0.451919, 3.987191, 1, 0, 0.7450981, 1,
1.174016, -0.1428475, 2.197307, 1, 0, 0.7372549, 1,
1.182017, -1.690181, 1.279534, 1, 0, 0.7333333, 1,
1.186318, -1.399903, 1.000203, 1, 0, 0.7254902, 1,
1.186669, -0.200413, 2.385263, 1, 0, 0.7215686, 1,
1.189127, 0.2567913, 2.452224, 1, 0, 0.7137255, 1,
1.189363, -0.1134924, 3.498304, 1, 0, 0.7098039, 1,
1.194573, -0.891364, 2.750443, 1, 0, 0.7019608, 1,
1.196457, 0.2775231, 1.879549, 1, 0, 0.6941177, 1,
1.199423, 0.5861173, -0.4164006, 1, 0, 0.6901961, 1,
1.204945, 1.878304, 0.142502, 1, 0, 0.682353, 1,
1.210133, -0.1172912, 1.088632, 1, 0, 0.6784314, 1,
1.219034, -0.013314, -0.3150038, 1, 0, 0.6705883, 1,
1.219725, 0.8167775, 3.000898, 1, 0, 0.6666667, 1,
1.225592, -1.014322, 4.367132, 1, 0, 0.6588235, 1,
1.22803, -0.617081, 3.67329, 1, 0, 0.654902, 1,
1.229224, -0.39093, 2.187989, 1, 0, 0.6470588, 1,
1.23312, -0.2427792, 2.777558, 1, 0, 0.6431373, 1,
1.239517, -0.9244334, 2.551404, 1, 0, 0.6352941, 1,
1.239801, 0.2467059, 0.6236122, 1, 0, 0.6313726, 1,
1.24404, -0.06197841, 1.796442, 1, 0, 0.6235294, 1,
1.249563, -0.9864821, 1.715247, 1, 0, 0.6196079, 1,
1.25931, 0.5348801, -0.03479853, 1, 0, 0.6117647, 1,
1.261588, 1.346392, -1.855026, 1, 0, 0.6078432, 1,
1.26499, -0.5712104, 2.82435, 1, 0, 0.6, 1,
1.281879, 0.7323694, 0.1243688, 1, 0, 0.5921569, 1,
1.283374, 1.378627, -0.01976781, 1, 0, 0.5882353, 1,
1.291458, -1.559328, 2.682285, 1, 0, 0.5803922, 1,
1.292886, 0.3028592, 0.4129092, 1, 0, 0.5764706, 1,
1.293055, -0.6051786, 1.83281, 1, 0, 0.5686275, 1,
1.293509, -1.028662, 2.858873, 1, 0, 0.5647059, 1,
1.29624, -0.7726142, 2.475488, 1, 0, 0.5568628, 1,
1.304229, -0.7672634, 1.819106, 1, 0, 0.5529412, 1,
1.310761, 0.1596489, 2.602493, 1, 0, 0.5450981, 1,
1.311662, -0.8277543, 3.508988, 1, 0, 0.5411765, 1,
1.312438, -1.292627, 2.779849, 1, 0, 0.5333334, 1,
1.331559, 0.7055839, 1.184946, 1, 0, 0.5294118, 1,
1.337494, -1.68395, 2.743303, 1, 0, 0.5215687, 1,
1.344125, 0.564812, 1.055723, 1, 0, 0.5176471, 1,
1.344657, -0.9291916, 2.024936, 1, 0, 0.509804, 1,
1.34666, 1.019042, 1.113882, 1, 0, 0.5058824, 1,
1.349353, 1.139325, 1.784067, 1, 0, 0.4980392, 1,
1.362352, -0.02788426, 0.3752424, 1, 0, 0.4901961, 1,
1.370068, 0.8464465, -0.705727, 1, 0, 0.4862745, 1,
1.373545, 1.209157, -0.2789029, 1, 0, 0.4784314, 1,
1.375274, 0.5208529, 1.90528, 1, 0, 0.4745098, 1,
1.386079, 0.3124427, 2.434273, 1, 0, 0.4666667, 1,
1.395254, -0.3707993, 0.6760956, 1, 0, 0.4627451, 1,
1.405904, -0.03782988, 1.991311, 1, 0, 0.454902, 1,
1.424064, 0.3689345, 1.858767, 1, 0, 0.4509804, 1,
1.424599, 0.4534655, 1.645661, 1, 0, 0.4431373, 1,
1.433741, 1.56439, -0.9906334, 1, 0, 0.4392157, 1,
1.436452, 0.5223179, 1.166921, 1, 0, 0.4313726, 1,
1.439745, -2.145755, 1.18922, 1, 0, 0.427451, 1,
1.465114, -1.228314, 4.436026, 1, 0, 0.4196078, 1,
1.481933, -0.08383527, 1.609501, 1, 0, 0.4156863, 1,
1.491879, 0.5650437, 2.983392, 1, 0, 0.4078431, 1,
1.497379, -0.4894713, 1.675631, 1, 0, 0.4039216, 1,
1.497453, -0.7775795, 2.744289, 1, 0, 0.3960784, 1,
1.498188, -0.04358608, 0.2615085, 1, 0, 0.3882353, 1,
1.507159, 1.815738, 0.1092232, 1, 0, 0.3843137, 1,
1.508657, 0.4283096, 0.6595933, 1, 0, 0.3764706, 1,
1.513845, -0.5599, 2.811475, 1, 0, 0.372549, 1,
1.515185, 1.164741, 0.6208615, 1, 0, 0.3647059, 1,
1.519269, -0.4092796, 1.768581, 1, 0, 0.3607843, 1,
1.523052, 0.8490885, 1.502175, 1, 0, 0.3529412, 1,
1.534813, 0.8434844, 0.9471641, 1, 0, 0.3490196, 1,
1.54083, 0.02136434, 1.05788, 1, 0, 0.3411765, 1,
1.545096, 0.1021369, 3.66278, 1, 0, 0.3372549, 1,
1.554547, 2.118287, 1.179104, 1, 0, 0.3294118, 1,
1.565671, -0.8710118, 0.5411896, 1, 0, 0.3254902, 1,
1.581029, 0.173622, 2.059083, 1, 0, 0.3176471, 1,
1.587935, 0.3678714, 1.217623, 1, 0, 0.3137255, 1,
1.594421, -0.006046573, 1.254939, 1, 0, 0.3058824, 1,
1.604331, -1.229485, 1.372881, 1, 0, 0.2980392, 1,
1.610429, -0.8378681, 1.939636, 1, 0, 0.2941177, 1,
1.615226, -2.381373, 2.750398, 1, 0, 0.2862745, 1,
1.637274, -1.467493, 1.044762, 1, 0, 0.282353, 1,
1.642745, 0.860054, 0.2975514, 1, 0, 0.2745098, 1,
1.661653, -0.1302557, 2.63414, 1, 0, 0.2705882, 1,
1.667013, 0.1187205, 0.7934938, 1, 0, 0.2627451, 1,
1.677233, 0.594907, 2.026002, 1, 0, 0.2588235, 1,
1.700473, 0.5533406, 2.656378, 1, 0, 0.2509804, 1,
1.716062, 1.964339, -0.8971288, 1, 0, 0.2470588, 1,
1.720584, 0.5444275, 0.4879211, 1, 0, 0.2392157, 1,
1.729343, -0.9634179, 2.03514, 1, 0, 0.2352941, 1,
1.730576, 1.744223, 0.4499052, 1, 0, 0.227451, 1,
1.734779, -0.6205279, 2.961814, 1, 0, 0.2235294, 1,
1.742185, -1.240768, 2.730497, 1, 0, 0.2156863, 1,
1.745006, -0.1207822, 0.9159966, 1, 0, 0.2117647, 1,
1.745262, 0.5079756, 0.7505906, 1, 0, 0.2039216, 1,
1.759672, 0.5251851, 2.385866, 1, 0, 0.1960784, 1,
1.765952, -0.06841934, 1.096681, 1, 0, 0.1921569, 1,
1.772374, -0.4999811, 0.8407847, 1, 0, 0.1843137, 1,
1.777696, 0.5780638, 0.6782957, 1, 0, 0.1803922, 1,
1.783395, -0.6407183, 1.230191, 1, 0, 0.172549, 1,
1.829572, -1.489836, 2.32261, 1, 0, 0.1686275, 1,
1.849962, 0.2932477, 1.309708, 1, 0, 0.1607843, 1,
1.876351, 1.074769, -0.1141821, 1, 0, 0.1568628, 1,
1.891624, -0.3118566, 0.3065935, 1, 0, 0.1490196, 1,
1.901882, 1.651258, -0.277526, 1, 0, 0.145098, 1,
1.914314, 2.216675, 1.299204, 1, 0, 0.1372549, 1,
1.921458, 0.5561227, 1.217917, 1, 0, 0.1333333, 1,
1.954731, -0.7522784, 2.851096, 1, 0, 0.1254902, 1,
1.961151, -0.7363629, 0.4147481, 1, 0, 0.1215686, 1,
1.972958, 0.06274144, 1.283991, 1, 0, 0.1137255, 1,
1.974939, -1.123239, 0.7618291, 1, 0, 0.1098039, 1,
2.019508, 0.8816284, 0.8661932, 1, 0, 0.1019608, 1,
2.021982, 0.09740794, 1.447006, 1, 0, 0.09411765, 1,
2.081861, 0.2889605, -0.4534644, 1, 0, 0.09019608, 1,
2.096611, 0.8222147, 0.0562319, 1, 0, 0.08235294, 1,
2.134119, 0.2135117, 2.136355, 1, 0, 0.07843138, 1,
2.224163, -0.7965112, 4.482309, 1, 0, 0.07058824, 1,
2.228296, -0.7509276, 1.917489, 1, 0, 0.06666667, 1,
2.258554, -0.8661021, 3.607354, 1, 0, 0.05882353, 1,
2.324502, -0.1683069, 1.4275, 1, 0, 0.05490196, 1,
2.503078, -0.1832358, 2.275705, 1, 0, 0.04705882, 1,
2.570456, 0.9512593, 0.5702107, 1, 0, 0.04313726, 1,
2.648116, 1.037507, 1.115953, 1, 0, 0.03529412, 1,
2.700363, -0.958393, 1.30001, 1, 0, 0.03137255, 1,
2.765073, 0.3071307, 1.287356, 1, 0, 0.02352941, 1,
2.914556, -0.2620287, 1.568725, 1, 0, 0.01960784, 1,
3.035697, 1.219237, 0.3070416, 1, 0, 0.01176471, 1,
3.280265, 1.455405, -0.139506, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.01095343, -4.308011, -6.921713, 0, -0.5, 0.5, 0.5,
-0.01095343, -4.308011, -6.921713, 1, -0.5, 0.5, 0.5,
-0.01095343, -4.308011, -6.921713, 1, 1.5, 0.5, 0.5,
-0.01095343, -4.308011, -6.921713, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.417895, -0.360881, -6.921713, 0, -0.5, 0.5, 0.5,
-4.417895, -0.360881, -6.921713, 1, -0.5, 0.5, 0.5,
-4.417895, -0.360881, -6.921713, 1, 1.5, 0.5, 0.5,
-4.417895, -0.360881, -6.921713, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.417895, -4.308011, -0.1337538, 0, -0.5, 0.5, 0.5,
-4.417895, -4.308011, -0.1337538, 1, -0.5, 0.5, 0.5,
-4.417895, -4.308011, -0.1337538, 1, 1.5, 0.5, 0.5,
-4.417895, -4.308011, -0.1337538, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.397134, -5.355261,
3, -3.397134, -5.355261,
-3, -3.397134, -5.355261,
-3, -3.548947, -5.616336,
-2, -3.397134, -5.355261,
-2, -3.548947, -5.616336,
-1, -3.397134, -5.355261,
-1, -3.548947, -5.616336,
0, -3.397134, -5.355261,
0, -3.548947, -5.616336,
1, -3.397134, -5.355261,
1, -3.548947, -5.616336,
2, -3.397134, -5.355261,
2, -3.548947, -5.616336,
3, -3.397134, -5.355261,
3, -3.548947, -5.616336
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.852572, -6.138487, 0, -0.5, 0.5, 0.5,
-3, -3.852572, -6.138487, 1, -0.5, 0.5, 0.5,
-3, -3.852572, -6.138487, 1, 1.5, 0.5, 0.5,
-3, -3.852572, -6.138487, 0, 1.5, 0.5, 0.5,
-2, -3.852572, -6.138487, 0, -0.5, 0.5, 0.5,
-2, -3.852572, -6.138487, 1, -0.5, 0.5, 0.5,
-2, -3.852572, -6.138487, 1, 1.5, 0.5, 0.5,
-2, -3.852572, -6.138487, 0, 1.5, 0.5, 0.5,
-1, -3.852572, -6.138487, 0, -0.5, 0.5, 0.5,
-1, -3.852572, -6.138487, 1, -0.5, 0.5, 0.5,
-1, -3.852572, -6.138487, 1, 1.5, 0.5, 0.5,
-1, -3.852572, -6.138487, 0, 1.5, 0.5, 0.5,
0, -3.852572, -6.138487, 0, -0.5, 0.5, 0.5,
0, -3.852572, -6.138487, 1, -0.5, 0.5, 0.5,
0, -3.852572, -6.138487, 1, 1.5, 0.5, 0.5,
0, -3.852572, -6.138487, 0, 1.5, 0.5, 0.5,
1, -3.852572, -6.138487, 0, -0.5, 0.5, 0.5,
1, -3.852572, -6.138487, 1, -0.5, 0.5, 0.5,
1, -3.852572, -6.138487, 1, 1.5, 0.5, 0.5,
1, -3.852572, -6.138487, 0, 1.5, 0.5, 0.5,
2, -3.852572, -6.138487, 0, -0.5, 0.5, 0.5,
2, -3.852572, -6.138487, 1, -0.5, 0.5, 0.5,
2, -3.852572, -6.138487, 1, 1.5, 0.5, 0.5,
2, -3.852572, -6.138487, 0, 1.5, 0.5, 0.5,
3, -3.852572, -6.138487, 0, -0.5, 0.5, 0.5,
3, -3.852572, -6.138487, 1, -0.5, 0.5, 0.5,
3, -3.852572, -6.138487, 1, 1.5, 0.5, 0.5,
3, -3.852572, -6.138487, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.400908, -3, -5.355261,
-3.400908, 2, -5.355261,
-3.400908, -3, -5.355261,
-3.570406, -3, -5.616336,
-3.400908, -2, -5.355261,
-3.570406, -2, -5.616336,
-3.400908, -1, -5.355261,
-3.570406, -1, -5.616336,
-3.400908, 0, -5.355261,
-3.570406, 0, -5.616336,
-3.400908, 1, -5.355261,
-3.570406, 1, -5.616336,
-3.400908, 2, -5.355261,
-3.570406, 2, -5.616336
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.909401, -3, -6.138487, 0, -0.5, 0.5, 0.5,
-3.909401, -3, -6.138487, 1, -0.5, 0.5, 0.5,
-3.909401, -3, -6.138487, 1, 1.5, 0.5, 0.5,
-3.909401, -3, -6.138487, 0, 1.5, 0.5, 0.5,
-3.909401, -2, -6.138487, 0, -0.5, 0.5, 0.5,
-3.909401, -2, -6.138487, 1, -0.5, 0.5, 0.5,
-3.909401, -2, -6.138487, 1, 1.5, 0.5, 0.5,
-3.909401, -2, -6.138487, 0, 1.5, 0.5, 0.5,
-3.909401, -1, -6.138487, 0, -0.5, 0.5, 0.5,
-3.909401, -1, -6.138487, 1, -0.5, 0.5, 0.5,
-3.909401, -1, -6.138487, 1, 1.5, 0.5, 0.5,
-3.909401, -1, -6.138487, 0, 1.5, 0.5, 0.5,
-3.909401, 0, -6.138487, 0, -0.5, 0.5, 0.5,
-3.909401, 0, -6.138487, 1, -0.5, 0.5, 0.5,
-3.909401, 0, -6.138487, 1, 1.5, 0.5, 0.5,
-3.909401, 0, -6.138487, 0, 1.5, 0.5, 0.5,
-3.909401, 1, -6.138487, 0, -0.5, 0.5, 0.5,
-3.909401, 1, -6.138487, 1, -0.5, 0.5, 0.5,
-3.909401, 1, -6.138487, 1, 1.5, 0.5, 0.5,
-3.909401, 1, -6.138487, 0, 1.5, 0.5, 0.5,
-3.909401, 2, -6.138487, 0, -0.5, 0.5, 0.5,
-3.909401, 2, -6.138487, 1, -0.5, 0.5, 0.5,
-3.909401, 2, -6.138487, 1, 1.5, 0.5, 0.5,
-3.909401, 2, -6.138487, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.400908, -3.397134, -4,
-3.400908, -3.397134, 4,
-3.400908, -3.397134, -4,
-3.570406, -3.548947, -4,
-3.400908, -3.397134, -2,
-3.570406, -3.548947, -2,
-3.400908, -3.397134, 0,
-3.570406, -3.548947, 0,
-3.400908, -3.397134, 2,
-3.570406, -3.548947, 2,
-3.400908, -3.397134, 4,
-3.570406, -3.548947, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.909401, -3.852572, -4, 0, -0.5, 0.5, 0.5,
-3.909401, -3.852572, -4, 1, -0.5, 0.5, 0.5,
-3.909401, -3.852572, -4, 1, 1.5, 0.5, 0.5,
-3.909401, -3.852572, -4, 0, 1.5, 0.5, 0.5,
-3.909401, -3.852572, -2, 0, -0.5, 0.5, 0.5,
-3.909401, -3.852572, -2, 1, -0.5, 0.5, 0.5,
-3.909401, -3.852572, -2, 1, 1.5, 0.5, 0.5,
-3.909401, -3.852572, -2, 0, 1.5, 0.5, 0.5,
-3.909401, -3.852572, 0, 0, -0.5, 0.5, 0.5,
-3.909401, -3.852572, 0, 1, -0.5, 0.5, 0.5,
-3.909401, -3.852572, 0, 1, 1.5, 0.5, 0.5,
-3.909401, -3.852572, 0, 0, 1.5, 0.5, 0.5,
-3.909401, -3.852572, 2, 0, -0.5, 0.5, 0.5,
-3.909401, -3.852572, 2, 1, -0.5, 0.5, 0.5,
-3.909401, -3.852572, 2, 1, 1.5, 0.5, 0.5,
-3.909401, -3.852572, 2, 0, 1.5, 0.5, 0.5,
-3.909401, -3.852572, 4, 0, -0.5, 0.5, 0.5,
-3.909401, -3.852572, 4, 1, -0.5, 0.5, 0.5,
-3.909401, -3.852572, 4, 1, 1.5, 0.5, 0.5,
-3.909401, -3.852572, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.400908, -3.397134, -5.355261,
-3.400908, 2.675372, -5.355261,
-3.400908, -3.397134, 5.087753,
-3.400908, 2.675372, 5.087753,
-3.400908, -3.397134, -5.355261,
-3.400908, -3.397134, 5.087753,
-3.400908, 2.675372, -5.355261,
-3.400908, 2.675372, 5.087753,
-3.400908, -3.397134, -5.355261,
3.379001, -3.397134, -5.355261,
-3.400908, -3.397134, 5.087753,
3.379001, -3.397134, 5.087753,
-3.400908, 2.675372, -5.355261,
3.379001, 2.675372, -5.355261,
-3.400908, 2.675372, 5.087753,
3.379001, 2.675372, 5.087753,
3.379001, -3.397134, -5.355261,
3.379001, 2.675372, -5.355261,
3.379001, -3.397134, 5.087753,
3.379001, 2.675372, 5.087753,
3.379001, -3.397134, -5.355261,
3.379001, -3.397134, 5.087753,
3.379001, 2.675372, -5.355261,
3.379001, 2.675372, 5.087753
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.397107;
var distance = 32.91056;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.01095343, 0.360881, 0.1337538 );
mvMatrix.scale( 1.179646, 1.317067, 0.765861 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.91056);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Phostebupirim<-read.table("Phostebupirim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phostebupirim$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phostebupirim' not found
```

```r
y<-Phostebupirim$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phostebupirim' not found
```

```r
z<-Phostebupirim$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phostebupirim' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.302172, 0.208232, -0.4804221, 0, 0, 1, 1, 1,
-3.285677, 1.242171, -0.7032893, 1, 0, 0, 1, 1,
-3.03404, 1.296931, -1.127323, 1, 0, 0, 1, 1,
-2.973168, -1.304206, -2.201093, 1, 0, 0, 1, 1,
-2.758003, -0.8419653, -1.787395, 1, 0, 0, 1, 1,
-2.712248, 0.5306986, -1.164118, 1, 0, 0, 1, 1,
-2.710205, 1.340822, 0.1579779, 0, 0, 0, 1, 1,
-2.599541, 1.330749, -1.136287, 0, 0, 0, 1, 1,
-2.589829, 1.225109, -2.060215, 0, 0, 0, 1, 1,
-2.577343, 0.3506155, -2.376889, 0, 0, 0, 1, 1,
-2.569762, 0.01159564, -1.612316, 0, 0, 0, 1, 1,
-2.509659, -1.013624, -3.634176, 0, 0, 0, 1, 1,
-2.437184, 1.840918, -0.1482384, 0, 0, 0, 1, 1,
-2.399051, -0.1367503, -0.31106, 1, 1, 1, 1, 1,
-2.395319, 1.019828, -0.5447619, 1, 1, 1, 1, 1,
-2.254421, -1.112176, -0.7515055, 1, 1, 1, 1, 1,
-2.24124, -0.9447851, -0.8627908, 1, 1, 1, 1, 1,
-2.194375, 1.945367, -0.3508695, 1, 1, 1, 1, 1,
-2.19251, 0.4633521, -0.7304434, 1, 1, 1, 1, 1,
-2.176794, -1.227286, -1.661478, 1, 1, 1, 1, 1,
-2.056325, 0.9079099, -0.5073445, 1, 1, 1, 1, 1,
-2.052788, -0.2533242, -3.937192, 1, 1, 1, 1, 1,
-2.009052, -1.056327, -2.815012, 1, 1, 1, 1, 1,
-1.997747, 0.1110925, -1.914408, 1, 1, 1, 1, 1,
-1.989713, 0.06572367, -2.151426, 1, 1, 1, 1, 1,
-1.973623, -0.5096119, -0.1686441, 1, 1, 1, 1, 1,
-1.955543, 1.809493, 1.155059, 1, 1, 1, 1, 1,
-1.939968, 0.1956668, 0.4961495, 1, 1, 1, 1, 1,
-1.939634, 0.06771232, -3.814076, 0, 0, 1, 1, 1,
-1.930411, -0.3432451, 0.3949665, 1, 0, 0, 1, 1,
-1.914338, -0.6628668, -1.544434, 1, 0, 0, 1, 1,
-1.913201, 0.2828207, -1.572073, 1, 0, 0, 1, 1,
-1.896781, -0.8291314, -1.992477, 1, 0, 0, 1, 1,
-1.85642, -0.73715, -2.415305, 1, 0, 0, 1, 1,
-1.842636, -1.379483, -0.4798909, 0, 0, 0, 1, 1,
-1.81591, 0.03748157, -2.212151, 0, 0, 0, 1, 1,
-1.815518, -0.5344641, -1.107016, 0, 0, 0, 1, 1,
-1.778266, -0.1184361, -1.949109, 0, 0, 0, 1, 1,
-1.773112, 0.2863763, -2.544252, 0, 0, 0, 1, 1,
-1.766988, 0.8099849, -0.3013169, 0, 0, 0, 1, 1,
-1.740007, 0.9064372, -0.3277402, 0, 0, 0, 1, 1,
-1.70759, 0.667133, -1.926267, 1, 1, 1, 1, 1,
-1.683675, 1.548495, -0.6904597, 1, 1, 1, 1, 1,
-1.680776, 0.482286, -0.9754485, 1, 1, 1, 1, 1,
-1.678389, -1.417482, -0.3243154, 1, 1, 1, 1, 1,
-1.675124, 1.738309, 0.3997186, 1, 1, 1, 1, 1,
-1.67099, 0.371336, -2.551286, 1, 1, 1, 1, 1,
-1.670456, -0.7392918, -2.462493, 1, 1, 1, 1, 1,
-1.662733, -1.290215, -2.003281, 1, 1, 1, 1, 1,
-1.660583, -2.089062, -3.377386, 1, 1, 1, 1, 1,
-1.65362, 0.8448759, -1.045697, 1, 1, 1, 1, 1,
-1.638989, 2.097492, -0.658143, 1, 1, 1, 1, 1,
-1.623341, -0.6888611, -1.061257, 1, 1, 1, 1, 1,
-1.607746, -0.9082375, -2.150575, 1, 1, 1, 1, 1,
-1.547938, 1.925317, -0.365347, 1, 1, 1, 1, 1,
-1.547385, 0.5928394, -0.001005894, 1, 1, 1, 1, 1,
-1.547012, -0.73711, -1.886335, 0, 0, 1, 1, 1,
-1.543552, -1.315425, -2.207194, 1, 0, 0, 1, 1,
-1.505379, -0.1155844, -2.982123, 1, 0, 0, 1, 1,
-1.479474, 0.3657242, -0.2172074, 1, 0, 0, 1, 1,
-1.478346, -1.193954, -2.94436, 1, 0, 0, 1, 1,
-1.475232, 1.319578, -0.5037162, 1, 0, 0, 1, 1,
-1.464654, -1.65413, -2.57475, 0, 0, 0, 1, 1,
-1.442492, 0.5462086, -1.929106, 0, 0, 0, 1, 1,
-1.44241, -1.181685, -2.54853, 0, 0, 0, 1, 1,
-1.44182, -0.457097, -1.547027, 0, 0, 0, 1, 1,
-1.43376, -0.7927872, -3.411221, 0, 0, 0, 1, 1,
-1.430029, -0.5689656, -1.494224, 0, 0, 0, 1, 1,
-1.421777, 0.6264343, -0.5379102, 0, 0, 0, 1, 1,
-1.421345, 1.669797, -0.9140317, 1, 1, 1, 1, 1,
-1.410892, 1.090082, -0.8209382, 1, 1, 1, 1, 1,
-1.404049, -1.059919, -1.729884, 1, 1, 1, 1, 1,
-1.402738, -0.3148001, -2.908648, 1, 1, 1, 1, 1,
-1.399307, 1.203157, -1.230486, 1, 1, 1, 1, 1,
-1.389286, 0.5050691, -2.630583, 1, 1, 1, 1, 1,
-1.384325, 1.890262, 0.8458561, 1, 1, 1, 1, 1,
-1.376816, -0.7622112, -3.485124, 1, 1, 1, 1, 1,
-1.369591, -0.4591591, -2.614243, 1, 1, 1, 1, 1,
-1.369439, -0.7769617, -2.337508, 1, 1, 1, 1, 1,
-1.368281, -0.04278625, -2.214628, 1, 1, 1, 1, 1,
-1.368217, -0.1431468, -2.348408, 1, 1, 1, 1, 1,
-1.368149, -1.008015, -1.316106, 1, 1, 1, 1, 1,
-1.36163, 0.8546975, -2.094807, 1, 1, 1, 1, 1,
-1.359937, -0.7507641, -2.429234, 1, 1, 1, 1, 1,
-1.359088, -0.4548429, -0.07469387, 0, 0, 1, 1, 1,
-1.350969, -0.5228053, -1.912608, 1, 0, 0, 1, 1,
-1.342, 0.2191799, -2.92653, 1, 0, 0, 1, 1,
-1.340671, -1.30907, -2.759333, 1, 0, 0, 1, 1,
-1.311072, 0.1993768, -1.231384, 1, 0, 0, 1, 1,
-1.310368, 1.878613, -0.8476211, 1, 0, 0, 1, 1,
-1.308936, -0.7223778, -2.059452, 0, 0, 0, 1, 1,
-1.294469, -0.1227035, -3.356519, 0, 0, 0, 1, 1,
-1.293979, -0.7233922, -1.677292, 0, 0, 0, 1, 1,
-1.279329, -0.9338521, -3.397666, 0, 0, 0, 1, 1,
-1.278505, -0.440764, -0.01289391, 0, 0, 0, 1, 1,
-1.276308, -0.03197521, -1.980253, 0, 0, 0, 1, 1,
-1.276281, 2.417973, 0.7081169, 0, 0, 0, 1, 1,
-1.274649, -0.8925664, -2.394804, 1, 1, 1, 1, 1,
-1.248802, -1.580141, -1.451699, 1, 1, 1, 1, 1,
-1.248378, 1.095864, 0.8935323, 1, 1, 1, 1, 1,
-1.23917, 1.426353, 0.2324603, 1, 1, 1, 1, 1,
-1.23885, -0.1841507, -1.118386, 1, 1, 1, 1, 1,
-1.236705, 0.4978493, 0.3591063, 1, 1, 1, 1, 1,
-1.235317, 0.6911327, -1.106654, 1, 1, 1, 1, 1,
-1.229087, -1.031272, -3.167501, 1, 1, 1, 1, 1,
-1.226873, -0.4140069, -0.0446376, 1, 1, 1, 1, 1,
-1.226737, -2.962284, -1.730581, 1, 1, 1, 1, 1,
-1.226454, -0.4031188, -1.36766, 1, 1, 1, 1, 1,
-1.208046, 1.163003, -0.9487153, 1, 1, 1, 1, 1,
-1.206654, 0.6074756, -0.6227937, 1, 1, 1, 1, 1,
-1.205, 1.088111, 0.4294819, 1, 1, 1, 1, 1,
-1.204197, -1.434751, -2.518812, 1, 1, 1, 1, 1,
-1.199709, 1.201862, -0.9459506, 0, 0, 1, 1, 1,
-1.1868, -0.5557219, -0.4286761, 1, 0, 0, 1, 1,
-1.183898, 0.9069712, -0.03402199, 1, 0, 0, 1, 1,
-1.174443, 0.2879667, -2.600705, 1, 0, 0, 1, 1,
-1.167747, 0.6990517, -2.007598, 1, 0, 0, 1, 1,
-1.157647, -0.4311567, -1.338534, 1, 0, 0, 1, 1,
-1.141865, 1.466313, -0.2222666, 0, 0, 0, 1, 1,
-1.126419, -0.6343547, -1.863602, 0, 0, 0, 1, 1,
-1.12515, -0.9686481, -2.666594, 0, 0, 0, 1, 1,
-1.115602, 1.318645, -1.551795, 0, 0, 0, 1, 1,
-1.109303, 0.4005405, -0.9492081, 0, 0, 0, 1, 1,
-1.104872, -0.2452545, -1.739492, 0, 0, 0, 1, 1,
-1.102228, -0.9446597, -2.676444, 0, 0, 0, 1, 1,
-1.082505, 0.6561695, -0.7482779, 1, 1, 1, 1, 1,
-1.079705, 0.8409349, -3.837649, 1, 1, 1, 1, 1,
-1.065146, 1.038705, -0.2476986, 1, 1, 1, 1, 1,
-1.06239, 1.03252, -0.3448784, 1, 1, 1, 1, 1,
-1.061069, -0.9403908, -2.801151, 1, 1, 1, 1, 1,
-1.060283, -0.209584, -1.570301, 1, 1, 1, 1, 1,
-1.048099, -1.502013, -3.322664, 1, 1, 1, 1, 1,
-1.046653, 0.2153335, -0.6579276, 1, 1, 1, 1, 1,
-1.035098, -0.7372016, -2.433545, 1, 1, 1, 1, 1,
-1.034311, 2.205099, -0.3168606, 1, 1, 1, 1, 1,
-1.029903, 0.1035767, -2.336027, 1, 1, 1, 1, 1,
-1.029292, 0.3547806, -1.574717, 1, 1, 1, 1, 1,
-1.023422, 1.11096, -1.632312, 1, 1, 1, 1, 1,
-1.022369, 1.44551, -2.252647, 1, 1, 1, 1, 1,
-1.021969, 0.7942183, -0.1144989, 1, 1, 1, 1, 1,
-1.018947, 1.548545, -0.2374828, 0, 0, 1, 1, 1,
-1.015502, 1.784553, -1.50368, 1, 0, 0, 1, 1,
-0.9954048, 0.0189693, -2.249636, 1, 0, 0, 1, 1,
-0.9842888, 0.7086701, -1.503738, 1, 0, 0, 1, 1,
-0.979368, 1.527862, 0.6338989, 1, 0, 0, 1, 1,
-0.9755703, 0.8205872, -1.96298, 1, 0, 0, 1, 1,
-0.9713575, -0.7360937, -4.846503, 0, 0, 0, 1, 1,
-0.9685218, -0.5340726, -3.123595, 0, 0, 0, 1, 1,
-0.9676319, 0.7505531, -1.041175, 0, 0, 0, 1, 1,
-0.9622263, -0.9094247, -0.6785255, 0, 0, 0, 1, 1,
-0.9608327, -1.214758, -1.467251, 0, 0, 0, 1, 1,
-0.9579754, -0.9339185, -2.174945, 0, 0, 0, 1, 1,
-0.950878, 1.438314, 0.6856157, 0, 0, 0, 1, 1,
-0.9470139, 0.680559, -1.165566, 1, 1, 1, 1, 1,
-0.9438018, 0.13986, 0.1732751, 1, 1, 1, 1, 1,
-0.9416072, -0.2751229, -0.6494524, 1, 1, 1, 1, 1,
-0.9406994, 0.1820559, -3.40619, 1, 1, 1, 1, 1,
-0.9359054, 1.055846, -0.6352876, 1, 1, 1, 1, 1,
-0.9319747, -0.9446949, 0.4282824, 1, 1, 1, 1, 1,
-0.924464, 1.314627, 1.785758, 1, 1, 1, 1, 1,
-0.9160941, -0.9171998, -2.298896, 1, 1, 1, 1, 1,
-0.9137789, -1.271734, -2.133029, 1, 1, 1, 1, 1,
-0.9085288, 1.288978, -0.8020858, 1, 1, 1, 1, 1,
-0.9074673, -0.1461411, -0.1411625, 1, 1, 1, 1, 1,
-0.9015928, -0.6400616, -1.763438, 1, 1, 1, 1, 1,
-0.8964635, 2.045179, -1.662764, 1, 1, 1, 1, 1,
-0.8923141, -1.884945, -2.584489, 1, 1, 1, 1, 1,
-0.8806545, 0.4666175, -2.685207, 1, 1, 1, 1, 1,
-0.8806244, -0.8447351, -4.423811, 0, 0, 1, 1, 1,
-0.8790985, -1.102666, -2.721607, 1, 0, 0, 1, 1,
-0.8750138, 1.582477, -0.218723, 1, 0, 0, 1, 1,
-0.8749899, -0.987877, -1.689026, 1, 0, 0, 1, 1,
-0.872566, -0.5291442, -1.982546, 1, 0, 0, 1, 1,
-0.8679307, 0.1240549, -1.707992, 1, 0, 0, 1, 1,
-0.8624495, 0.9834219, -0.4429234, 0, 0, 0, 1, 1,
-0.8622442, 0.2523891, -1.162977, 0, 0, 0, 1, 1,
-0.8558913, -0.6146838, -2.672835, 0, 0, 0, 1, 1,
-0.8555264, 0.3708534, 0.09035769, 0, 0, 0, 1, 1,
-0.8546004, 0.4135566, -1.495628, 0, 0, 0, 1, 1,
-0.8494439, -0.5053004, 0.7441675, 0, 0, 0, 1, 1,
-0.8312424, -0.4826568, -0.7190574, 0, 0, 0, 1, 1,
-0.831174, -0.5196513, -0.6796728, 1, 1, 1, 1, 1,
-0.8306934, -0.416635, -2.337266, 1, 1, 1, 1, 1,
-0.8297508, -1.694648, -1.269606, 1, 1, 1, 1, 1,
-0.8233297, -1.735682, -2.425838, 1, 1, 1, 1, 1,
-0.821008, -0.3752425, -0.3685528, 1, 1, 1, 1, 1,
-0.8145425, -0.768571, -1.637125, 1, 1, 1, 1, 1,
-0.7993978, -0.5676529, -2.307485, 1, 1, 1, 1, 1,
-0.7974843, 1.542269, -0.8651221, 1, 1, 1, 1, 1,
-0.795216, -0.5235818, -2.931258, 1, 1, 1, 1, 1,
-0.7923884, -0.1628763, -0.6417853, 1, 1, 1, 1, 1,
-0.7907734, -0.2542974, -3.251962, 1, 1, 1, 1, 1,
-0.783976, -0.3313044, -1.823836, 1, 1, 1, 1, 1,
-0.783805, 1.48853, -0.2976435, 1, 1, 1, 1, 1,
-0.7813976, 1.169235, -0.1725747, 1, 1, 1, 1, 1,
-0.7800525, 0.4899836, -1.76912, 1, 1, 1, 1, 1,
-0.7764245, 0.4125825, -0.08109564, 0, 0, 1, 1, 1,
-0.7727758, 1.627614, 0.3878204, 1, 0, 0, 1, 1,
-0.7643344, 2.161044, 0.4199504, 1, 0, 0, 1, 1,
-0.7640741, -0.7680773, -2.681413, 1, 0, 0, 1, 1,
-0.7602357, -1.453943, -4.56933, 1, 0, 0, 1, 1,
-0.7567498, 0.1253915, 0.868076, 1, 0, 0, 1, 1,
-0.755327, 0.4333708, -0.9577307, 0, 0, 0, 1, 1,
-0.7534596, -0.1349179, -1.479549, 0, 0, 0, 1, 1,
-0.7518573, 0.9317792, 0.5043519, 0, 0, 0, 1, 1,
-0.7515641, 0.5781136, -3.657888, 0, 0, 0, 1, 1,
-0.7508939, 0.1212543, -0.6020067, 0, 0, 0, 1, 1,
-0.7502585, -1.460769, -2.589641, 0, 0, 0, 1, 1,
-0.7479588, 0.2424326, -2.224134, 0, 0, 0, 1, 1,
-0.745156, 0.215602, -1.176637, 1, 1, 1, 1, 1,
-0.7429338, -0.9583169, -0.889451, 1, 1, 1, 1, 1,
-0.7394879, 0.5318497, 0.8033128, 1, 1, 1, 1, 1,
-0.7379012, 1.474757, -1.099874, 1, 1, 1, 1, 1,
-0.7333847, 0.07443793, -1.993583, 1, 1, 1, 1, 1,
-0.7256461, -0.4835319, -0.9723386, 1, 1, 1, 1, 1,
-0.7196404, -1.624297, -4.490845, 1, 1, 1, 1, 1,
-0.7191734, -0.7400972, -3.595573, 1, 1, 1, 1, 1,
-0.7083106, 0.6369233, -1.767182, 1, 1, 1, 1, 1,
-0.7034827, 0.7020113, 0.1645129, 1, 1, 1, 1, 1,
-0.7030377, 0.2973203, -1.578156, 1, 1, 1, 1, 1,
-0.6968205, 1.665889, -1.770646, 1, 1, 1, 1, 1,
-0.6913047, 0.611553, -0.2883511, 1, 1, 1, 1, 1,
-0.6895447, -0.4092429, -2.341882, 1, 1, 1, 1, 1,
-0.6871469, -0.3201369, -0.7867109, 1, 1, 1, 1, 1,
-0.6844671, 0.2974941, -2.412886, 0, 0, 1, 1, 1,
-0.6830557, -0.06903055, -0.5128044, 1, 0, 0, 1, 1,
-0.6820041, -1.143043, -0.08141666, 1, 0, 0, 1, 1,
-0.6814356, 0.3254034, -1.17843, 1, 0, 0, 1, 1,
-0.6784084, 1.282954, 0.03017305, 1, 0, 0, 1, 1,
-0.6693193, 0.8639522, -0.7016129, 1, 0, 0, 1, 1,
-0.6677539, 0.1706041, -3.120878, 0, 0, 0, 1, 1,
-0.6649917, -1.404245, -1.49342, 0, 0, 0, 1, 1,
-0.6628693, -0.6296185, -1.06732, 0, 0, 0, 1, 1,
-0.6620539, 1.043582, 0.3897527, 0, 0, 0, 1, 1,
-0.6572369, -0.6747881, -2.021446, 0, 0, 0, 1, 1,
-0.6498113, -0.2758089, -2.493839, 0, 0, 0, 1, 1,
-0.6491749, -0.6509594, -1.017033, 0, 0, 0, 1, 1,
-0.6451352, -0.3671426, -2.287344, 1, 1, 1, 1, 1,
-0.6447113, 0.3535797, -0.9873908, 1, 1, 1, 1, 1,
-0.6441434, 0.4322095, -2.351325, 1, 1, 1, 1, 1,
-0.6430435, 0.5206193, -0.5706723, 1, 1, 1, 1, 1,
-0.6368563, 1.533108, 0.4250318, 1, 1, 1, 1, 1,
-0.636271, 1.646142, 0.3915915, 1, 1, 1, 1, 1,
-0.6328731, 1.500131, 0.3757828, 1, 1, 1, 1, 1,
-0.632865, 0.770675, -0.03623592, 1, 1, 1, 1, 1,
-0.6306605, -0.5048163, -1.652861, 1, 1, 1, 1, 1,
-0.6282949, -1.412001, -3.99638, 1, 1, 1, 1, 1,
-0.6243607, 0.7558126, -1.818871, 1, 1, 1, 1, 1,
-0.614614, 0.3541863, -1.822636, 1, 1, 1, 1, 1,
-0.6101097, 0.01542459, -1.248209, 1, 1, 1, 1, 1,
-0.6085139, -1.665826, -2.729714, 1, 1, 1, 1, 1,
-0.6042441, -1.484286, -4.951162, 1, 1, 1, 1, 1,
-0.6032606, 1.643758, 0.1912407, 0, 0, 1, 1, 1,
-0.6012406, 0.3390013, -1.723995, 1, 0, 0, 1, 1,
-0.6001111, -1.582483, -4.103147, 1, 0, 0, 1, 1,
-0.5992211, -0.2121844, -3.084151, 1, 0, 0, 1, 1,
-0.5990501, -0.2847339, -3.093088, 1, 0, 0, 1, 1,
-0.5941826, 0.5658405, -3.98558, 1, 0, 0, 1, 1,
-0.5925905, 0.6088899, -0.7055331, 0, 0, 0, 1, 1,
-0.5892617, 0.6848427, -0.9520113, 0, 0, 0, 1, 1,
-0.5846847, -1.170435, -2.723502, 0, 0, 0, 1, 1,
-0.5845921, 0.6436883, -0.3534299, 0, 0, 0, 1, 1,
-0.5762867, -1.838498, -4.996349, 0, 0, 0, 1, 1,
-0.5754527, -0.1383025, -3.505371, 0, 0, 0, 1, 1,
-0.5752125, 0.6421993, -0.1268374, 0, 0, 0, 1, 1,
-0.5749021, -1.816462, -2.751221, 1, 1, 1, 1, 1,
-0.5744069, 0.5758609, -0.5426108, 1, 1, 1, 1, 1,
-0.5649705, -0.3978036, -1.293063, 1, 1, 1, 1, 1,
-0.5606615, -0.8748118, -1.654205, 1, 1, 1, 1, 1,
-0.5598794, -0.6183713, -1.537707, 1, 1, 1, 1, 1,
-0.5546184, -2.161761, -4.228704, 1, 1, 1, 1, 1,
-0.5535789, 1.321153, -1.885508, 1, 1, 1, 1, 1,
-0.5520025, 0.9335113, -1.86001, 1, 1, 1, 1, 1,
-0.5483798, 0.9900224, -1.56491, 1, 1, 1, 1, 1,
-0.542013, -1.577675, -2.750207, 1, 1, 1, 1, 1,
-0.5344037, 0.4309579, -1.208534, 1, 1, 1, 1, 1,
-0.5329092, 1.600298, -0.7124063, 1, 1, 1, 1, 1,
-0.5285348, 0.4538467, -0.8125263, 1, 1, 1, 1, 1,
-0.5243018, 1.49656, 0.3212854, 1, 1, 1, 1, 1,
-0.5239875, 1.156924, -0.1567075, 1, 1, 1, 1, 1,
-0.5224451, 0.5746459, -0.2511626, 0, 0, 1, 1, 1,
-0.5143676, -0.8752961, -4.258747, 1, 0, 0, 1, 1,
-0.510871, 1.081693, -0.5794603, 1, 0, 0, 1, 1,
-0.5098574, 0.6123203, -1.709823, 1, 0, 0, 1, 1,
-0.5070219, -1.850296, -3.054867, 1, 0, 0, 1, 1,
-0.4964127, 1.98944, -1.147112, 1, 0, 0, 1, 1,
-0.4876925, 2.40511, -0.3923761, 0, 0, 0, 1, 1,
-0.4858958, -1.167017, -2.337276, 0, 0, 0, 1, 1,
-0.4816714, 0.3524375, -1.73621, 0, 0, 0, 1, 1,
-0.4799633, 1.060476, -0.3634898, 0, 0, 0, 1, 1,
-0.4766707, 1.582892, 1.006416, 0, 0, 0, 1, 1,
-0.4733439, 0.8521538, 1.005667, 0, 0, 0, 1, 1,
-0.4718324, 1.162501, 1.255551, 0, 0, 0, 1, 1,
-0.4615139, -0.6331245, -3.852075, 1, 1, 1, 1, 1,
-0.4607063, 0.2317123, -1.379263, 1, 1, 1, 1, 1,
-0.4598769, -1.086367, -5.203178, 1, 1, 1, 1, 1,
-0.4560404, -1.525628, -3.534204, 1, 1, 1, 1, 1,
-0.453944, -0.09174182, -1.707566, 1, 1, 1, 1, 1,
-0.4532993, 1.102613, 0.6346989, 1, 1, 1, 1, 1,
-0.448954, -0.3246549, -2.530394, 1, 1, 1, 1, 1,
-0.4475579, 1.834733, -1.78576, 1, 1, 1, 1, 1,
-0.4475267, -0.1507987, -2.443556, 1, 1, 1, 1, 1,
-0.4468434, -0.8581336, -3.443795, 1, 1, 1, 1, 1,
-0.4432742, 2.403451, 1.143835, 1, 1, 1, 1, 1,
-0.4393009, -0.1061084, -3.599336, 1, 1, 1, 1, 1,
-0.4380961, -1.215318, -1.522309, 1, 1, 1, 1, 1,
-0.4379559, 1.878837, -0.3382553, 1, 1, 1, 1, 1,
-0.4342123, -1.428103, -1.583287, 1, 1, 1, 1, 1,
-0.4340708, 0.7476086, -1.186958, 0, 0, 1, 1, 1,
-0.4305808, 2.586938, -0.05656425, 1, 0, 0, 1, 1,
-0.4304434, -0.5067559, -3.172252, 1, 0, 0, 1, 1,
-0.4291758, 0.3454715, -0.2314795, 1, 0, 0, 1, 1,
-0.4291618, -0.3954166, -1.585561, 1, 0, 0, 1, 1,
-0.4240004, 0.6317642, -1.271702, 1, 0, 0, 1, 1,
-0.4236787, 0.2521251, -1.174393, 0, 0, 0, 1, 1,
-0.4222749, 0.7503963, -0.0002861861, 0, 0, 0, 1, 1,
-0.4208089, -1.565497, -2.644338, 0, 0, 0, 1, 1,
-0.4162897, -1.312621, -2.743462, 0, 0, 0, 1, 1,
-0.4124962, -1.060774, -2.628649, 0, 0, 0, 1, 1,
-0.4110083, -0.0688195, -2.25434, 0, 0, 0, 1, 1,
-0.4064519, -1.084083, -2.488766, 0, 0, 0, 1, 1,
-0.4053112, -0.6857716, -2.925533, 1, 1, 1, 1, 1,
-0.3975582, -0.2995195, -2.86119, 1, 1, 1, 1, 1,
-0.3967218, 0.4056104, -1.67727, 1, 1, 1, 1, 1,
-0.3940887, 0.0059041, -2.52988, 1, 1, 1, 1, 1,
-0.3935983, -0.5989158, -2.54754, 1, 1, 1, 1, 1,
-0.3864914, 2.152467, -0.6699025, 1, 1, 1, 1, 1,
-0.3822765, 1.533355, -0.4967999, 1, 1, 1, 1, 1,
-0.3802393, -0.9766129, -3.399616, 1, 1, 1, 1, 1,
-0.3776314, 0.6784168, -1.537175, 1, 1, 1, 1, 1,
-0.3769482, 0.6779912, -1.187981, 1, 1, 1, 1, 1,
-0.3753798, -0.5829332, -2.007737, 1, 1, 1, 1, 1,
-0.3740249, 1.174151, 0.5009518, 1, 1, 1, 1, 1,
-0.3728693, -0.435274, -3.555473, 1, 1, 1, 1, 1,
-0.371875, -1.081495, -2.067691, 1, 1, 1, 1, 1,
-0.3692413, 1.02148, -0.7279873, 1, 1, 1, 1, 1,
-0.3688331, -0.2480535, -2.856043, 0, 0, 1, 1, 1,
-0.3651689, -0.2046973, 0.06291403, 1, 0, 0, 1, 1,
-0.3617205, 1.326372, 1.131479, 1, 0, 0, 1, 1,
-0.3615907, 0.835864, -0.9368095, 1, 0, 0, 1, 1,
-0.3598118, 0.7880508, -1.545728, 1, 0, 0, 1, 1,
-0.3567426, -0.9072266, -0.6235255, 1, 0, 0, 1, 1,
-0.3541851, -0.6069182, -1.286316, 0, 0, 0, 1, 1,
-0.3537994, -0.01843837, -1.562467, 0, 0, 0, 1, 1,
-0.35289, -0.521962, -0.8625112, 0, 0, 0, 1, 1,
-0.3522397, 0.05136167, -2.495789, 0, 0, 0, 1, 1,
-0.3511491, -0.7585019, -3.137254, 0, 0, 0, 1, 1,
-0.3499202, 0.7680572, -1.128762, 0, 0, 0, 1, 1,
-0.3488564, -0.4222671, -2.391771, 0, 0, 0, 1, 1,
-0.3488477, 0.23044, -1.933607, 1, 1, 1, 1, 1,
-0.3383927, 0.2504773, -1.569117, 1, 1, 1, 1, 1,
-0.3358281, 1.424391, -0.3480389, 1, 1, 1, 1, 1,
-0.3337897, 1.202697, -0.6857067, 1, 1, 1, 1, 1,
-0.3337792, -0.07663412, -1.164363, 1, 1, 1, 1, 1,
-0.333127, -0.2552096, -1.878864, 1, 1, 1, 1, 1,
-0.332771, 1.588515, -0.3534109, 1, 1, 1, 1, 1,
-0.3320513, -0.6321551, -3.267908, 1, 1, 1, 1, 1,
-0.3303621, 0.3262917, -1.408294, 1, 1, 1, 1, 1,
-0.3298226, 0.8635702, -2.556752, 1, 1, 1, 1, 1,
-0.3284448, -2.183985, -1.946771, 1, 1, 1, 1, 1,
-0.3245692, -0.3874319, -3.623796, 1, 1, 1, 1, 1,
-0.3149972, 0.3448642, -2.01748, 1, 1, 1, 1, 1,
-0.3126252, -0.8226702, -3.699987, 1, 1, 1, 1, 1,
-0.3111297, -1.266824, -4.31762, 1, 1, 1, 1, 1,
-0.3091185, -0.1706692, -3.111891, 0, 0, 1, 1, 1,
-0.300113, -0.772168, -2.222522, 1, 0, 0, 1, 1,
-0.2940243, -0.5831097, -1.721752, 1, 0, 0, 1, 1,
-0.2933961, -0.392593, -1.932421, 1, 0, 0, 1, 1,
-0.2889691, 2.276222, 0.5196301, 1, 0, 0, 1, 1,
-0.2780766, 0.5050842, -1.727367, 1, 0, 0, 1, 1,
-0.2759028, 0.4418114, 0.6827673, 0, 0, 0, 1, 1,
-0.269195, -0.2370008, -1.936503, 0, 0, 0, 1, 1,
-0.2605718, 0.506104, -1.004992, 0, 0, 0, 1, 1,
-0.2601318, 1.739866, 0.4036144, 0, 0, 0, 1, 1,
-0.260045, 0.8699973, -0.3769864, 0, 0, 0, 1, 1,
-0.2545989, 1.90248, -0.6149645, 0, 0, 0, 1, 1,
-0.2541282, 0.03718394, -1.480615, 0, 0, 0, 1, 1,
-0.2539483, 0.3188709, -0.3211916, 1, 1, 1, 1, 1,
-0.2535343, 0.3617088, 1.486997, 1, 1, 1, 1, 1,
-0.2535287, -0.4837119, -1.850651, 1, 1, 1, 1, 1,
-0.2506979, -1.072703, -1.862756, 1, 1, 1, 1, 1,
-0.2476132, 0.1311194, -1.843396, 1, 1, 1, 1, 1,
-0.2469293, -1.527019, -4.346721, 1, 1, 1, 1, 1,
-0.2459847, -0.3487045, -1.996472, 1, 1, 1, 1, 1,
-0.2455095, -1.609398, -2.653144, 1, 1, 1, 1, 1,
-0.2449551, 0.809644, -0.02328488, 1, 1, 1, 1, 1,
-0.2442984, 0.05967776, -1.792746, 1, 1, 1, 1, 1,
-0.2355821, 1.012322, 1.01563, 1, 1, 1, 1, 1,
-0.2340469, 0.439258, -0.9973912, 1, 1, 1, 1, 1,
-0.231583, 1.348323, 0.8450773, 1, 1, 1, 1, 1,
-0.224248, 0.308732, 0.6435586, 1, 1, 1, 1, 1,
-0.2229824, -1.274979, -3.441357, 1, 1, 1, 1, 1,
-0.2206705, -0.3378296, -3.244545, 0, 0, 1, 1, 1,
-0.220517, -0.613619, -2.644839, 1, 0, 0, 1, 1,
-0.2171423, -0.9569181, -2.441335, 1, 0, 0, 1, 1,
-0.2098139, 1.966643, -0.6371486, 1, 0, 0, 1, 1,
-0.2007868, -1.483004, -4.088308, 1, 0, 0, 1, 1,
-0.1993966, -0.3031024, -2.465917, 1, 0, 0, 1, 1,
-0.1972371, 1.023677, 0.539336, 0, 0, 0, 1, 1,
-0.1948504, 0.3361468, 0.920274, 0, 0, 0, 1, 1,
-0.1881651, -0.3103597, -1.576888, 0, 0, 0, 1, 1,
-0.1830699, -0.8906773, -1.610033, 0, 0, 0, 1, 1,
-0.1820858, 0.5868286, 1.100285, 0, 0, 0, 1, 1,
-0.1808864, 1.590487, 1.406388, 0, 0, 0, 1, 1,
-0.1792645, 0.8697018, 1.033688, 0, 0, 0, 1, 1,
-0.1724118, -1.61734, -3.582947, 1, 1, 1, 1, 1,
-0.1707533, -0.3305296, -2.006295, 1, 1, 1, 1, 1,
-0.1646142, 2.494128, 1.402969, 1, 1, 1, 1, 1,
-0.1570086, 1.194334, 0.1395302, 1, 1, 1, 1, 1,
-0.1560298, 0.5006025, -1.336762, 1, 1, 1, 1, 1,
-0.1531241, -1.537688, -1.737156, 1, 1, 1, 1, 1,
-0.1491549, -0.6355503, -2.981067, 1, 1, 1, 1, 1,
-0.1482284, -0.9309338, -2.070552, 1, 1, 1, 1, 1,
-0.1463994, 0.8174471, -0.7398686, 1, 1, 1, 1, 1,
-0.1429598, 0.8342503, -0.1810104, 1, 1, 1, 1, 1,
-0.1385177, 0.1513657, -0.8490437, 1, 1, 1, 1, 1,
-0.1371317, -0.4940664, -3.44907, 1, 1, 1, 1, 1,
-0.1275176, 0.3794333, 1.782165, 1, 1, 1, 1, 1,
-0.1252136, -0.2301968, -1.808874, 1, 1, 1, 1, 1,
-0.1225172, 1.46883, -0.623271, 1, 1, 1, 1, 1,
-0.1223431, -0.3654864, -5.151112, 0, 0, 1, 1, 1,
-0.121558, -2.276389, -2.246931, 1, 0, 0, 1, 1,
-0.1201319, -1.095313, -2.910904, 1, 0, 0, 1, 1,
-0.1164295, -0.5458474, -3.394585, 1, 0, 0, 1, 1,
-0.115453, 1.262303, 0.6516981, 1, 0, 0, 1, 1,
-0.1152636, -0.477944, -2.336113, 1, 0, 0, 1, 1,
-0.1119517, 1.219768, -1.168843, 0, 0, 0, 1, 1,
-0.1118174, 1.991758, 0.9936464, 0, 0, 0, 1, 1,
-0.1102878, 1.500149, -0.5734601, 0, 0, 0, 1, 1,
-0.1096934, -0.616176, -3.814241, 0, 0, 0, 1, 1,
-0.1088489, 0.7388783, 0.2470716, 0, 0, 0, 1, 1,
-0.1087, 1.905642, -0.3690156, 0, 0, 0, 1, 1,
-0.1082643, -0.2496192, -2.785701, 0, 0, 0, 1, 1,
-0.1059425, -1.047281, -4.156731, 1, 1, 1, 1, 1,
-0.1010982, -0.08343856, -0.9606746, 1, 1, 1, 1, 1,
-0.09838502, -0.8707684, -3.825509, 1, 1, 1, 1, 1,
-0.09606816, -0.8659729, -3.368168, 1, 1, 1, 1, 1,
-0.0885235, -1.131107, -4.416492, 1, 1, 1, 1, 1,
-0.08773104, -0.1917437, -2.40686, 1, 1, 1, 1, 1,
-0.08376633, 0.3080177, 0.02134193, 1, 1, 1, 1, 1,
-0.0831881, 0.2283434, -1.728616, 1, 1, 1, 1, 1,
-0.08287335, -0.7707622, -2.548423, 1, 1, 1, 1, 1,
-0.08213823, 0.0867589, -0.7631981, 1, 1, 1, 1, 1,
-0.08109543, 1.282659, 0.876816, 1, 1, 1, 1, 1,
-0.07985669, -1.364158, -3.062948, 1, 1, 1, 1, 1,
-0.07684328, -1.104763, -3.745206, 1, 1, 1, 1, 1,
-0.07557022, 1.270792, 1.705423, 1, 1, 1, 1, 1,
-0.07046936, -0.1478085, -2.948535, 1, 1, 1, 1, 1,
-0.06453762, -1.920262, -1.979919, 0, 0, 1, 1, 1,
-0.06228115, -0.416379, -2.728576, 1, 0, 0, 1, 1,
-0.06073718, -0.5917624, -4.524188, 1, 0, 0, 1, 1,
-0.05978925, 0.1056162, -0.2684903, 1, 0, 0, 1, 1,
-0.05543678, -0.2755578, -2.702526, 1, 0, 0, 1, 1,
-0.05459959, -0.3570397, -2.851938, 1, 0, 0, 1, 1,
-0.04845521, -0.0576551, -2.54235, 0, 0, 0, 1, 1,
-0.04742303, -1.379475, -1.207696, 0, 0, 0, 1, 1,
-0.04732303, -1.111578, -3.708432, 0, 0, 0, 1, 1,
-0.0454933, 0.9097063, 0.2717777, 0, 0, 0, 1, 1,
-0.04520441, 0.3764857, 1.330469, 0, 0, 0, 1, 1,
-0.04322141, 0.3834395, 2.725323, 0, 0, 0, 1, 1,
-0.04309563, 0.0310041, -0.6687222, 0, 0, 0, 1, 1,
-0.04108528, -0.8453866, -3.146187, 1, 1, 1, 1, 1,
-0.03745406, -0.1247628, -3.129655, 1, 1, 1, 1, 1,
-0.03401652, 0.8856481, -1.609179, 1, 1, 1, 1, 1,
-0.03111491, -0.6012893, -2.230499, 1, 1, 1, 1, 1,
-0.02235761, 0.6586565, 1.099543, 1, 1, 1, 1, 1,
-0.02102614, 0.5694069, 0.423735, 1, 1, 1, 1, 1,
-0.01631512, -1.196116, -2.299108, 1, 1, 1, 1, 1,
-0.01481783, -1.457397, -3.161083, 1, 1, 1, 1, 1,
-0.01469692, -0.1381526, -2.576949, 1, 1, 1, 1, 1,
-0.01404669, 1.015072, 0.5301264, 1, 1, 1, 1, 1,
-0.01335065, -0.5077596, -2.142198, 1, 1, 1, 1, 1,
-0.01176991, -0.907035, -2.124769, 1, 1, 1, 1, 1,
-0.004462901, 0.1697017, 1.025324, 1, 1, 1, 1, 1,
-0.002572589, -0.4642799, -3.242556, 1, 1, 1, 1, 1,
-0.002031691, 1.035599, 0.7165297, 1, 1, 1, 1, 1,
-0.001173266, -0.4561402, -3.739961, 0, 0, 1, 1, 1,
-0.0005084968, 0.3828733, -0.1635028, 1, 0, 0, 1, 1,
0.001286594, -0.1616655, 2.302909, 1, 0, 0, 1, 1,
0.001712519, 1.734557, -1.193102, 1, 0, 0, 1, 1,
0.005024919, -1.813142, 1.016458, 1, 0, 0, 1, 1,
0.009568891, -0.8225008, 3.523293, 1, 0, 0, 1, 1,
0.01584343, 1.153824, -0.2930444, 0, 0, 0, 1, 1,
0.01882811, 1.551644, -1.593189, 0, 0, 0, 1, 1,
0.01990439, -1.885625, 2.576372, 0, 0, 0, 1, 1,
0.02113843, -1.478567, 2.028734, 0, 0, 0, 1, 1,
0.0222825, -0.475921, 3.001778, 0, 0, 0, 1, 1,
0.02542691, -1.377229, 2.098246, 0, 0, 0, 1, 1,
0.02614564, 0.3858823, -0.319997, 0, 0, 0, 1, 1,
0.02698926, -0.5130491, 2.313719, 1, 1, 1, 1, 1,
0.03179254, -0.1016852, 3.178884, 1, 1, 1, 1, 1,
0.03196217, -0.58931, 1.559731, 1, 1, 1, 1, 1,
0.03378563, 1.564835, 0.06908795, 1, 1, 1, 1, 1,
0.04481167, 0.644225, 0.4168895, 1, 1, 1, 1, 1,
0.04624122, 0.5820678, -0.815051, 1, 1, 1, 1, 1,
0.0481233, 0.1678286, 0.2542407, 1, 1, 1, 1, 1,
0.04862117, 0.7020135, 1.665865, 1, 1, 1, 1, 1,
0.0502977, 0.2549713, -1.586961, 1, 1, 1, 1, 1,
0.05056067, -1.95941, 3.340942, 1, 1, 1, 1, 1,
0.05170396, 0.3178765, -1.011604, 1, 1, 1, 1, 1,
0.05557514, -0.5220824, 1.56571, 1, 1, 1, 1, 1,
0.05578737, 0.3133157, -0.6313457, 1, 1, 1, 1, 1,
0.05828141, -0.5676802, 3.417482, 1, 1, 1, 1, 1,
0.06138241, -1.415196, 2.556973, 1, 1, 1, 1, 1,
0.0619671, 0.8608388, 0.8506166, 0, 0, 1, 1, 1,
0.06824925, 0.7255536, -0.711074, 1, 0, 0, 1, 1,
0.07030044, -0.9240525, 3.818542, 1, 0, 0, 1, 1,
0.07455122, -0.181232, 1.349583, 1, 0, 0, 1, 1,
0.07646549, 0.4296364, 0.3383018, 1, 0, 0, 1, 1,
0.07687423, -0.7159965, 3.050033, 1, 0, 0, 1, 1,
0.07846632, -1.520338, 2.267568, 0, 0, 0, 1, 1,
0.08478491, -0.3845155, 4.484677, 0, 0, 0, 1, 1,
0.08640683, 0.9147534, -0.4341072, 0, 0, 0, 1, 1,
0.09001254, -0.2159634, 3.6164, 0, 0, 0, 1, 1,
0.09182009, 1.451831, -0.2463885, 0, 0, 0, 1, 1,
0.09309223, -0.9973043, 2.591946, 0, 0, 0, 1, 1,
0.0935909, -1.972791, 4.061995, 0, 0, 0, 1, 1,
0.1017635, 0.8486589, 2.135596, 1, 1, 1, 1, 1,
0.1052942, -1.59355, 1.976405, 1, 1, 1, 1, 1,
0.1067539, 0.3289598, -0.08078059, 1, 1, 1, 1, 1,
0.1070752, 0.7941173, 0.4168648, 1, 1, 1, 1, 1,
0.1096917, -1.39346, 2.268564, 1, 1, 1, 1, 1,
0.110193, -0.3306347, 2.501922, 1, 1, 1, 1, 1,
0.1197641, -0.3465591, 2.674717, 1, 1, 1, 1, 1,
0.1207498, -0.9982046, 3.478382, 1, 1, 1, 1, 1,
0.1211277, 0.1319068, 1.445486, 1, 1, 1, 1, 1,
0.1289009, 0.01485121, 0.7860513, 1, 1, 1, 1, 1,
0.1306513, 1.387395, -0.2483463, 1, 1, 1, 1, 1,
0.1338883, 0.448284, 1.652249, 1, 1, 1, 1, 1,
0.1342454, 1.024827, -0.8770058, 1, 1, 1, 1, 1,
0.134611, -1.388791, 4.708801, 1, 1, 1, 1, 1,
0.1346497, -1.157134, 2.391497, 1, 1, 1, 1, 1,
0.1419399, -0.7656749, 4.323022, 0, 0, 1, 1, 1,
0.1428569, 0.776709, -0.8820741, 1, 0, 0, 1, 1,
0.1430961, -0.00306303, 0.09109236, 1, 0, 0, 1, 1,
0.1433566, 1.199368, 0.2910985, 1, 0, 0, 1, 1,
0.1435905, 0.6124883, 1.304189, 1, 0, 0, 1, 1,
0.1444583, 1.828319, 1.334376, 1, 0, 0, 1, 1,
0.1483127, -1.526173, 1.491619, 0, 0, 0, 1, 1,
0.1484713, -1.418006, 3.646897, 0, 0, 0, 1, 1,
0.1519278, -0.955663, 1.984404, 0, 0, 0, 1, 1,
0.1535717, 0.06820238, 1.386619, 0, 0, 0, 1, 1,
0.1550318, -0.5232994, 2.131433, 0, 0, 0, 1, 1,
0.1572497, 0.770349, 0.5601931, 0, 0, 0, 1, 1,
0.159431, -0.1726001, 3.07835, 0, 0, 0, 1, 1,
0.1685516, 1.585955, 0.6889811, 1, 1, 1, 1, 1,
0.1714872, 1.607289, -0.3929316, 1, 1, 1, 1, 1,
0.1764358, 0.9337326, 0.384941, 1, 1, 1, 1, 1,
0.177279, -0.5176542, 3.464686, 1, 1, 1, 1, 1,
0.1780629, 0.6650229, 0.2257012, 1, 1, 1, 1, 1,
0.180806, 0.07572823, 1.6149, 1, 1, 1, 1, 1,
0.1895753, -0.03377749, 2.112062, 1, 1, 1, 1, 1,
0.1978411, 1.003004, 0.7359282, 1, 1, 1, 1, 1,
0.2041229, 0.2154939, 0.3207267, 1, 1, 1, 1, 1,
0.2121816, 0.5363178, 0.9492509, 1, 1, 1, 1, 1,
0.2135008, -0.5174618, 1.65376, 1, 1, 1, 1, 1,
0.2145658, 0.5068216, 0.8959381, 1, 1, 1, 1, 1,
0.2167175, 1.897277, -0.5481481, 1, 1, 1, 1, 1,
0.2198871, 0.351922, -1.240191, 1, 1, 1, 1, 1,
0.2202032, 1.812694, 0.8165232, 1, 1, 1, 1, 1,
0.2243623, -1.180745, 2.382155, 0, 0, 1, 1, 1,
0.2244856, -1.090707, 3.74646, 1, 0, 0, 1, 1,
0.2273757, -0.7052004, 3.101346, 1, 0, 0, 1, 1,
0.2274057, -1.118967, 3.362766, 1, 0, 0, 1, 1,
0.2274195, 0.9505204, 1.031823, 1, 0, 0, 1, 1,
0.2303677, -1.024016, 2.715661, 1, 0, 0, 1, 1,
0.2351716, -1.432756, 1.357246, 0, 0, 0, 1, 1,
0.2380138, -1.52686, 4.649391, 0, 0, 0, 1, 1,
0.2471726, 0.4143547, -0.5065977, 0, 0, 0, 1, 1,
0.2504925, 1.483396, 1.179222, 0, 0, 0, 1, 1,
0.2572756, 0.7848913, 1.182126, 0, 0, 0, 1, 1,
0.2595248, 0.8963015, 1.77733, 0, 0, 0, 1, 1,
0.2631022, -0.340626, 3.503711, 0, 0, 0, 1, 1,
0.2673934, 0.5569654, -0.3361093, 1, 1, 1, 1, 1,
0.2677193, 1.156611, 2.604623, 1, 1, 1, 1, 1,
0.2702854, -0.7852119, 3.140496, 1, 1, 1, 1, 1,
0.2708566, 0.5494642, -1.479789, 1, 1, 1, 1, 1,
0.271932, 0.2919565, 0.2826702, 1, 1, 1, 1, 1,
0.2745053, -0.5492173, 4.93567, 1, 1, 1, 1, 1,
0.281278, -0.2097481, 1.557484, 1, 1, 1, 1, 1,
0.2846153, 0.4930608, 1.695604, 1, 1, 1, 1, 1,
0.2860359, 1.392082, -1.187595, 1, 1, 1, 1, 1,
0.291215, -0.8774631, 2.312025, 1, 1, 1, 1, 1,
0.29212, -0.9259834, 0.3714445, 1, 1, 1, 1, 1,
0.2929197, 0.04282941, 1.171456, 1, 1, 1, 1, 1,
0.2949057, -1.178342, 1.333871, 1, 1, 1, 1, 1,
0.3046391, -0.1343986, 2.457429, 1, 1, 1, 1, 1,
0.3055679, -0.5534568, 1.877117, 1, 1, 1, 1, 1,
0.3072685, 1.661928, -0.0919134, 0, 0, 1, 1, 1,
0.3096048, 0.7050065, 0.5460892, 1, 0, 0, 1, 1,
0.3131536, -0.9057975, 1.82492, 1, 0, 0, 1, 1,
0.3144244, 1.488706, -2.297636, 1, 0, 0, 1, 1,
0.3144843, -0.6472526, 1.485776, 1, 0, 0, 1, 1,
0.3163502, -0.4715392, 2.920973, 1, 0, 0, 1, 1,
0.3195239, -0.5870112, 3.321976, 0, 0, 0, 1, 1,
0.3306688, -1.061808, 3.288868, 0, 0, 0, 1, 1,
0.3322224, 0.5261731, -0.0677246, 0, 0, 0, 1, 1,
0.3327993, 0.09568968, 0.8311452, 0, 0, 0, 1, 1,
0.3346711, -0.7231271, 3.136849, 0, 0, 0, 1, 1,
0.3350974, 0.6742883, -0.5008232, 0, 0, 0, 1, 1,
0.336379, -1.039269, 2.965267, 0, 0, 0, 1, 1,
0.3390539, 0.06933157, 0.7864379, 1, 1, 1, 1, 1,
0.3415836, -0.5096995, 2.639078, 1, 1, 1, 1, 1,
0.343858, 0.4845138, 2.671855, 1, 1, 1, 1, 1,
0.347305, 0.6146644, 0.9430391, 1, 1, 1, 1, 1,
0.3486132, 1.083877, -1.35158, 1, 1, 1, 1, 1,
0.3515466, -1.045517, 2.634848, 1, 1, 1, 1, 1,
0.3532929, 0.3593937, 0.9670499, 1, 1, 1, 1, 1,
0.3542561, 1.014845, 1.68372, 1, 1, 1, 1, 1,
0.3552903, -0.2673367, 2.382262, 1, 1, 1, 1, 1,
0.3555728, -0.2783131, 1.721932, 1, 1, 1, 1, 1,
0.3563074, 0.1602056, 1.172192, 1, 1, 1, 1, 1,
0.3587375, 0.0005857372, 1.452646, 1, 1, 1, 1, 1,
0.3595321, 0.7750328, 0.3021981, 1, 1, 1, 1, 1,
0.3611276, 1.140227, 1.010542, 1, 1, 1, 1, 1,
0.3645428, -0.7479134, 2.920834, 1, 1, 1, 1, 1,
0.3654432, -0.8185259, 3.725772, 0, 0, 1, 1, 1,
0.3671024, 0.07612769, 2.270851, 1, 0, 0, 1, 1,
0.3678903, 1.026388, 0.7998931, 1, 0, 0, 1, 1,
0.3709202, 1.529597, 0.7412415, 1, 0, 0, 1, 1,
0.3725721, -0.8394992, 3.221764, 1, 0, 0, 1, 1,
0.3761188, 0.8609952, -0.1521812, 1, 0, 0, 1, 1,
0.3774808, -0.2952484, 2.364018, 0, 0, 0, 1, 1,
0.3776596, -0.8495644, 2.651701, 0, 0, 0, 1, 1,
0.3866975, 1.803214, 1.553064, 0, 0, 0, 1, 1,
0.387591, -0.694568, 1.73574, 0, 0, 0, 1, 1,
0.3917931, 0.5958328, 2.053548, 0, 0, 0, 1, 1,
0.3947219, -0.9893787, 2.152836, 0, 0, 0, 1, 1,
0.3958256, -1.02979, 3.814894, 0, 0, 0, 1, 1,
0.3969333, 0.8811595, 0.6261017, 1, 1, 1, 1, 1,
0.4025553, 1.244183, -0.4091308, 1, 1, 1, 1, 1,
0.4035088, 0.3581326, 0.9091563, 1, 1, 1, 1, 1,
0.403867, 0.8012035, 1.95815, 1, 1, 1, 1, 1,
0.4040416, 1.017437, 0.4501309, 1, 1, 1, 1, 1,
0.4040566, -0.3384879, 1.549186, 1, 1, 1, 1, 1,
0.4088612, -0.3248309, 1.608202, 1, 1, 1, 1, 1,
0.4120043, -0.5491358, 3.551756, 1, 1, 1, 1, 1,
0.4143469, -0.103458, 2.357411, 1, 1, 1, 1, 1,
0.4249414, -1.746899, 3.130111, 1, 1, 1, 1, 1,
0.4278037, -0.01227798, 1.178619, 1, 1, 1, 1, 1,
0.4289081, -0.1874938, 2.035806, 1, 1, 1, 1, 1,
0.4330308, -1.204355, 1.69209, 1, 1, 1, 1, 1,
0.438588, -0.8397049, 3.83067, 1, 1, 1, 1, 1,
0.4393842, 0.1591844, 0.4991575, 1, 1, 1, 1, 1,
0.4430336, 1.78169, 1.092824, 0, 0, 1, 1, 1,
0.4432211, -1.531732, 1.629782, 1, 0, 0, 1, 1,
0.4444954, 0.1163278, -0.1420814, 1, 0, 0, 1, 1,
0.4602157, -0.3645053, 2.299984, 1, 0, 0, 1, 1,
0.4696915, 0.0964265, 1.060223, 1, 0, 0, 1, 1,
0.4697303, -0.7858805, 1.688166, 1, 0, 0, 1, 1,
0.4719977, -0.1681671, 2.901767, 0, 0, 0, 1, 1,
0.4721543, 0.5777959, 1.317964, 0, 0, 0, 1, 1,
0.4729055, 1.438924, -0.09264779, 0, 0, 0, 1, 1,
0.4759567, -0.6153481, 1.8405, 0, 0, 0, 1, 1,
0.4762467, -0.03864342, 0.2990983, 0, 0, 0, 1, 1,
0.479641, 1.273368, 0.2546104, 0, 0, 0, 1, 1,
0.4812783, 1.440694, 0.2770625, 0, 0, 0, 1, 1,
0.4921556, -1.208364, 2.876638, 1, 1, 1, 1, 1,
0.4937642, -0.4513806, 1.299783, 1, 1, 1, 1, 1,
0.4950555, 0.5590714, 1.938237, 1, 1, 1, 1, 1,
0.4955475, -0.7445543, 1.423545, 1, 1, 1, 1, 1,
0.4965513, -1.342744, 1.380414, 1, 1, 1, 1, 1,
0.5015658, -1.179683, 1.837547, 1, 1, 1, 1, 1,
0.5031495, -1.019127, 2.685915, 1, 1, 1, 1, 1,
0.5050738, 1.678483, 0.4214297, 1, 1, 1, 1, 1,
0.5054179, 0.580034, 0.9813151, 1, 1, 1, 1, 1,
0.5071912, -0.4237351, 2.778772, 1, 1, 1, 1, 1,
0.5096964, 0.2020484, 1.596672, 1, 1, 1, 1, 1,
0.5142782, -0.5935181, 4.693278, 1, 1, 1, 1, 1,
0.5160922, 0.6276792, 1.823521, 1, 1, 1, 1, 1,
0.5203197, 0.8512634, -0.5774472, 1, 1, 1, 1, 1,
0.5223052, -1.742119, 3.200247, 1, 1, 1, 1, 1,
0.5263312, -0.1708259, 2.241389, 0, 0, 1, 1, 1,
0.5309801, 1.366088, 0.4146296, 1, 0, 0, 1, 1,
0.5315006, 0.5477854, 1.29585, 1, 0, 0, 1, 1,
0.531858, -0.4093923, 2.913127, 1, 0, 0, 1, 1,
0.5318707, 0.3778754, 1.858017, 1, 0, 0, 1, 1,
0.5319903, -0.3233592, 2.107176, 1, 0, 0, 1, 1,
0.5323558, -0.1078705, 2.725687, 0, 0, 0, 1, 1,
0.5331726, -0.1175932, 0.7130226, 0, 0, 0, 1, 1,
0.533942, 1.163831, -0.6413685, 0, 0, 0, 1, 1,
0.5361166, 0.7447122, -1.021826, 0, 0, 0, 1, 1,
0.5368672, -1.875871, 2.22448, 0, 0, 0, 1, 1,
0.538947, -0.2438551, -0.1346441, 0, 0, 0, 1, 1,
0.5426306, -0.567027, 0.9796744, 0, 0, 0, 1, 1,
0.5427013, -0.2544146, 1.329907, 1, 1, 1, 1, 1,
0.5488251, -1.189455, 3.520388, 1, 1, 1, 1, 1,
0.549364, -0.6540237, 2.161324, 1, 1, 1, 1, 1,
0.554279, 0.9358494, 0.01461341, 1, 1, 1, 1, 1,
0.5682375, -0.5688041, 3.784327, 1, 1, 1, 1, 1,
0.5735952, 1.373171, 0.02496669, 1, 1, 1, 1, 1,
0.57976, 1.729367, -1.095902, 1, 1, 1, 1, 1,
0.5840325, -0.1654234, 2.28678, 1, 1, 1, 1, 1,
0.5938132, 0.09758464, -0.0410634, 1, 1, 1, 1, 1,
0.5980285, -1.647173, 1.660559, 1, 1, 1, 1, 1,
0.598448, -1.973224, 2.956786, 1, 1, 1, 1, 1,
0.5984655, 0.489817, 2.270842, 1, 1, 1, 1, 1,
0.6025766, -0.7980399, 1.572501, 1, 1, 1, 1, 1,
0.6038653, -0.1578593, 0.8541074, 1, 1, 1, 1, 1,
0.6048495, -0.5184384, 1.726514, 1, 1, 1, 1, 1,
0.6086007, 0.993026, 1.071494, 0, 0, 1, 1, 1,
0.6117995, -0.2967609, 2.575113, 1, 0, 0, 1, 1,
0.6119158, -0.2519387, 1.023441, 1, 0, 0, 1, 1,
0.6169226, -0.4957729, 2.128957, 1, 0, 0, 1, 1,
0.6175701, 0.8889192, 0.5693367, 1, 0, 0, 1, 1,
0.6194963, -0.4700049, 1.916895, 1, 0, 0, 1, 1,
0.6212365, 0.5249569, 0.1922165, 0, 0, 0, 1, 1,
0.6245828, 0.9738391, -0.3886061, 0, 0, 0, 1, 1,
0.6323323, -0.9541703, 2.834684, 0, 0, 0, 1, 1,
0.6353278, 0.163603, -0.3747528, 0, 0, 0, 1, 1,
0.6361337, 0.4430976, 0.6362668, 0, 0, 0, 1, 1,
0.6388366, 0.5388462, 0.5223458, 0, 0, 0, 1, 1,
0.639171, -1.396417, 2.571945, 0, 0, 0, 1, 1,
0.642075, 0.9583127, 2.247452, 1, 1, 1, 1, 1,
0.6445664, -0.08122785, 2.297704, 1, 1, 1, 1, 1,
0.6459086, 1.182783, -0.2737125, 1, 1, 1, 1, 1,
0.6476644, -0.2120498, 1.35771, 1, 1, 1, 1, 1,
0.6528926, 0.2687382, -0.1270196, 1, 1, 1, 1, 1,
0.6553165, 0.3552591, 0.2363695, 1, 1, 1, 1, 1,
0.6580456, 1.338071, -1.246747, 1, 1, 1, 1, 1,
0.6588966, 0.2026058, 0.4221629, 1, 1, 1, 1, 1,
0.6611484, 0.4344252, 0.1673991, 1, 1, 1, 1, 1,
0.6640887, 1.331746, 0.1430453, 1, 1, 1, 1, 1,
0.6642349, -0.3180685, 0.8418431, 1, 1, 1, 1, 1,
0.6676219, 0.37245, -0.6392305, 1, 1, 1, 1, 1,
0.6718252, -0.6261309, 3.35177, 1, 1, 1, 1, 1,
0.6740564, 1.71718, 0.7650943, 1, 1, 1, 1, 1,
0.6758228, 0.2610746, 0.6579449, 1, 1, 1, 1, 1,
0.6775683, 0.8981626, 1.715207, 0, 0, 1, 1, 1,
0.6783227, 1.031849, 0.06937796, 1, 0, 0, 1, 1,
0.6784832, -0.2588192, 2.557797, 1, 0, 0, 1, 1,
0.6795124, -0.4444864, 1.103031, 1, 0, 0, 1, 1,
0.6843087, -0.3081023, 3.950373, 1, 0, 0, 1, 1,
0.6929723, -1.167572, 2.719853, 1, 0, 0, 1, 1,
0.6944228, -0.8387456, 0.2314121, 0, 0, 0, 1, 1,
0.7014289, 0.5727841, 0.9774674, 0, 0, 0, 1, 1,
0.7015613, 0.7901521, 1.258214, 0, 0, 0, 1, 1,
0.7033359, 0.3263172, 0.2386828, 0, 0, 0, 1, 1,
0.7035564, 0.08623619, 1.911433, 0, 0, 0, 1, 1,
0.7044137, -0.04942546, 1.360148, 0, 0, 0, 1, 1,
0.7045907, -0.5859237, 2.358439, 0, 0, 0, 1, 1,
0.7046388, -1.813822, 3.882087, 1, 1, 1, 1, 1,
0.7051982, -1.367017, 2.260198, 1, 1, 1, 1, 1,
0.7058969, -1.298851, 3.932066, 1, 1, 1, 1, 1,
0.7063512, 0.8796811, 0.7270421, 1, 1, 1, 1, 1,
0.7079709, -0.6851382, 2.068851, 1, 1, 1, 1, 1,
0.709062, 0.5403627, -1.76357, 1, 1, 1, 1, 1,
0.7120218, -0.8157094, 2.655817, 1, 1, 1, 1, 1,
0.7154623, -3.3087, 3.526604, 1, 1, 1, 1, 1,
0.7181139, 0.671243, 1.153214, 1, 1, 1, 1, 1,
0.7195119, 1.524018, 0.0366524, 1, 1, 1, 1, 1,
0.7205934, 0.2863847, 0.4326501, 1, 1, 1, 1, 1,
0.7213854, -0.8489405, 0.9746577, 1, 1, 1, 1, 1,
0.7259524, 0.6083468, 1.808638, 1, 1, 1, 1, 1,
0.7334305, 1.499257, 0.3593543, 1, 1, 1, 1, 1,
0.7341946, -0.05458231, 1.155573, 1, 1, 1, 1, 1,
0.7497408, -0.1811027, 0.9494479, 0, 0, 1, 1, 1,
0.7507281, 0.5580364, 0.8280833, 1, 0, 0, 1, 1,
0.7511415, 1.987738, -0.05760735, 1, 0, 0, 1, 1,
0.7534027, 1.220841, -0.3438317, 1, 0, 0, 1, 1,
0.7659993, 0.4822304, 1.966771, 1, 0, 0, 1, 1,
0.7671425, -0.008838462, 3.901764, 1, 0, 0, 1, 1,
0.771262, 0.3723429, 1.747137, 0, 0, 0, 1, 1,
0.7744366, -0.3442197, 0.7296847, 0, 0, 0, 1, 1,
0.7771015, -0.5890948, 3.260106, 0, 0, 0, 1, 1,
0.7790143, 1.543711, 2.065605, 0, 0, 0, 1, 1,
0.7798073, 0.4305026, -0.5919155, 0, 0, 0, 1, 1,
0.7798213, 1.199835, 1.731966, 0, 0, 0, 1, 1,
0.7812865, -0.8276049, 4.233718, 0, 0, 0, 1, 1,
0.7874096, -0.5818956, 2.068319, 1, 1, 1, 1, 1,
0.7876144, 0.9947966, 1.015442, 1, 1, 1, 1, 1,
0.787974, 0.8047835, 1.541349, 1, 1, 1, 1, 1,
0.7925414, -0.1909232, 2.629495, 1, 1, 1, 1, 1,
0.7928938, -0.5154213, 1.586028, 1, 1, 1, 1, 1,
0.7979634, 0.2730416, 0.3289293, 1, 1, 1, 1, 1,
0.7992562, -0.2252257, 2.654351, 1, 1, 1, 1, 1,
0.8020272, -0.8809535, 1.063415, 1, 1, 1, 1, 1,
0.8024377, -0.8260224, 3.231208, 1, 1, 1, 1, 1,
0.8037184, 1.207774, -0.4281608, 1, 1, 1, 1, 1,
0.8041571, 1.190567, -0.2084772, 1, 1, 1, 1, 1,
0.8054004, 0.2842692, -0.4008625, 1, 1, 1, 1, 1,
0.8056819, 1.429427, 1.38619, 1, 1, 1, 1, 1,
0.8069065, -1.175545, 2.696293, 1, 1, 1, 1, 1,
0.8090261, 0.08472503, 1.608263, 1, 1, 1, 1, 1,
0.8173108, -0.34067, 2.063076, 0, 0, 1, 1, 1,
0.8173574, 0.2697228, 2.386877, 1, 0, 0, 1, 1,
0.8199391, 0.2831424, 2.019334, 1, 0, 0, 1, 1,
0.822255, -0.9237071, 2.737041, 1, 0, 0, 1, 1,
0.8266721, 0.4428836, -0.4154674, 1, 0, 0, 1, 1,
0.8275657, -0.7723052, 2.014151, 1, 0, 0, 1, 1,
0.8333074, 1.961833, -0.7514843, 0, 0, 0, 1, 1,
0.8442907, 1.597073, 0.2597372, 0, 0, 0, 1, 1,
0.8450184, 1.578218, -2.176789, 0, 0, 0, 1, 1,
0.8463574, 0.3592407, 1.403872, 0, 0, 0, 1, 1,
0.8527241, 1.368341, 0.9520606, 0, 0, 0, 1, 1,
0.8547121, -1.664155, 4.002013, 0, 0, 0, 1, 1,
0.8548112, -0.1975805, 1.524709, 0, 0, 0, 1, 1,
0.8550698, 0.4687886, 0.1067252, 1, 1, 1, 1, 1,
0.857256, 0.4594699, 1.988622, 1, 1, 1, 1, 1,
0.8579566, -1.011226, 2.77863, 1, 1, 1, 1, 1,
0.8598334, 0.1385949, 2.205607, 1, 1, 1, 1, 1,
0.8621799, -0.7477033, 1.376409, 1, 1, 1, 1, 1,
0.8669411, -2.531151, 1.590367, 1, 1, 1, 1, 1,
0.8695429, -1.38396, 2.531109, 1, 1, 1, 1, 1,
0.8699516, -1.52693, 2.693676, 1, 1, 1, 1, 1,
0.8747638, -1.413783, 4.678889, 1, 1, 1, 1, 1,
0.877746, -1.11048, 1.379266, 1, 1, 1, 1, 1,
0.8777623, 0.0237111, 1.093622, 1, 1, 1, 1, 1,
0.8791391, -0.7445913, 2.836788, 1, 1, 1, 1, 1,
0.8827882, 1.154135, 0.8585184, 1, 1, 1, 1, 1,
0.8834488, -1.204733, 3.88489, 1, 1, 1, 1, 1,
0.8837516, 1.243825, 0.3496094, 1, 1, 1, 1, 1,
0.8839714, 1.073952, 0.8464652, 0, 0, 1, 1, 1,
0.898186, 0.1187741, -0.276276, 1, 0, 0, 1, 1,
0.900004, -1.445825, 3.587361, 1, 0, 0, 1, 1,
0.9019471, -1.610625, 3.435201, 1, 0, 0, 1, 1,
0.9047056, -0.06620056, 2.444766, 1, 0, 0, 1, 1,
0.9106333, 1.595432, -0.7350535, 1, 0, 0, 1, 1,
0.9117467, 0.3082471, 1.576838, 0, 0, 0, 1, 1,
0.9126668, 1.960839, 0.5062994, 0, 0, 0, 1, 1,
0.9131203, 0.03969105, 1.253406, 0, 0, 0, 1, 1,
0.9136463, -0.001792139, 2.470096, 0, 0, 0, 1, 1,
0.9155746, -0.1109275, 1.818353, 0, 0, 0, 1, 1,
0.9163154, 0.3887857, 2.578157, 0, 0, 0, 1, 1,
0.9359923, 0.7165395, 0.550912, 0, 0, 0, 1, 1,
0.9419858, 1.939839, 3.746226, 1, 1, 1, 1, 1,
0.9452294, 0.673555, 2.610955, 1, 1, 1, 1, 1,
0.9459557, -0.8753831, 2.825855, 1, 1, 1, 1, 1,
0.9474021, -0.2747297, 3.878608, 1, 1, 1, 1, 1,
0.9478464, 0.4817947, 1.519985, 1, 1, 1, 1, 1,
0.9492913, -0.5857596, 2.47327, 1, 1, 1, 1, 1,
0.95958, 1.186418, -0.5013275, 1, 1, 1, 1, 1,
0.9616097, -0.01374085, 1.782796, 1, 1, 1, 1, 1,
0.9636493, -0.9827864, 1.071505, 1, 1, 1, 1, 1,
0.9726752, 0.2104564, 0.5674061, 1, 1, 1, 1, 1,
0.9739177, 0.1985462, 3.241858, 1, 1, 1, 1, 1,
0.9763492, -1.362967, 1.98316, 1, 1, 1, 1, 1,
0.9781739, 0.8641295, -0.9810186, 1, 1, 1, 1, 1,
0.9781978, 0.367984, 1.849687, 1, 1, 1, 1, 1,
0.9792414, -0.1277141, 0.6512823, 1, 1, 1, 1, 1,
0.9823161, -0.002160927, 2.08755, 0, 0, 1, 1, 1,
0.9892471, 0.3961632, 0.706021, 1, 0, 0, 1, 1,
0.9962869, -0.4682168, 0.8950102, 1, 0, 0, 1, 1,
1.004787, 1.560199, -0.4454014, 1, 0, 0, 1, 1,
1.007583, 0.2834037, 0.8208686, 1, 0, 0, 1, 1,
1.010842, -0.8131748, 2.357889, 1, 0, 0, 1, 1,
1.014896, 0.3278718, 1.734205, 0, 0, 0, 1, 1,
1.026192, -0.3729407, 0.6506331, 0, 0, 0, 1, 1,
1.027672, -0.9569578, 2.591599, 0, 0, 0, 1, 1,
1.028558, -1.076346, 2.27361, 0, 0, 0, 1, 1,
1.029338, -1.689715, 2.07955, 0, 0, 0, 1, 1,
1.029414, -0.4270819, 0.6626475, 0, 0, 0, 1, 1,
1.030496, -0.04977965, 0.1594034, 0, 0, 0, 1, 1,
1.03844, 0.6338667, 1.535574, 1, 1, 1, 1, 1,
1.039088, -0.8592681, 3.031426, 1, 1, 1, 1, 1,
1.040601, 0.8217645, 0.4968871, 1, 1, 1, 1, 1,
1.041547, -1.793819, 4.461712, 1, 1, 1, 1, 1,
1.056844, -0.6944771, 2.049912, 1, 1, 1, 1, 1,
1.060426, 1.694213, 0.2302351, 1, 1, 1, 1, 1,
1.062435, 1.143197, 1.993828, 1, 1, 1, 1, 1,
1.062466, -1.399915, 1.41371, 1, 1, 1, 1, 1,
1.076788, 1.12517, 0.4015309, 1, 1, 1, 1, 1,
1.082257, 1.061677, 0.6932155, 1, 1, 1, 1, 1,
1.084282, -1.120928, 1.752663, 1, 1, 1, 1, 1,
1.086503, -2.218601, 1.156814, 1, 1, 1, 1, 1,
1.087364, 0.5741279, 1.065766, 1, 1, 1, 1, 1,
1.110575, 1.211683, -0.2053569, 1, 1, 1, 1, 1,
1.111194, 2.408324, 0.1290378, 1, 1, 1, 1, 1,
1.129953, -0.1323805, 2.490396, 0, 0, 1, 1, 1,
1.131456, -1.274237, 2.269907, 1, 0, 0, 1, 1,
1.138143, -0.05940511, 1.512998, 1, 0, 0, 1, 1,
1.141411, -0.9179213, 3.207606, 1, 0, 0, 1, 1,
1.14758, -0.4674838, 3.411733, 1, 0, 0, 1, 1,
1.151246, -0.926212, 2.79684, 1, 0, 0, 1, 1,
1.159561, -0.5351045, 2.295913, 0, 0, 0, 1, 1,
1.162225, 0.6735314, 0.4766246, 0, 0, 0, 1, 1,
1.165976, -0.451919, 3.987191, 0, 0, 0, 1, 1,
1.174016, -0.1428475, 2.197307, 0, 0, 0, 1, 1,
1.182017, -1.690181, 1.279534, 0, 0, 0, 1, 1,
1.186318, -1.399903, 1.000203, 0, 0, 0, 1, 1,
1.186669, -0.200413, 2.385263, 0, 0, 0, 1, 1,
1.189127, 0.2567913, 2.452224, 1, 1, 1, 1, 1,
1.189363, -0.1134924, 3.498304, 1, 1, 1, 1, 1,
1.194573, -0.891364, 2.750443, 1, 1, 1, 1, 1,
1.196457, 0.2775231, 1.879549, 1, 1, 1, 1, 1,
1.199423, 0.5861173, -0.4164006, 1, 1, 1, 1, 1,
1.204945, 1.878304, 0.142502, 1, 1, 1, 1, 1,
1.210133, -0.1172912, 1.088632, 1, 1, 1, 1, 1,
1.219034, -0.013314, -0.3150038, 1, 1, 1, 1, 1,
1.219725, 0.8167775, 3.000898, 1, 1, 1, 1, 1,
1.225592, -1.014322, 4.367132, 1, 1, 1, 1, 1,
1.22803, -0.617081, 3.67329, 1, 1, 1, 1, 1,
1.229224, -0.39093, 2.187989, 1, 1, 1, 1, 1,
1.23312, -0.2427792, 2.777558, 1, 1, 1, 1, 1,
1.239517, -0.9244334, 2.551404, 1, 1, 1, 1, 1,
1.239801, 0.2467059, 0.6236122, 1, 1, 1, 1, 1,
1.24404, -0.06197841, 1.796442, 0, 0, 1, 1, 1,
1.249563, -0.9864821, 1.715247, 1, 0, 0, 1, 1,
1.25931, 0.5348801, -0.03479853, 1, 0, 0, 1, 1,
1.261588, 1.346392, -1.855026, 1, 0, 0, 1, 1,
1.26499, -0.5712104, 2.82435, 1, 0, 0, 1, 1,
1.281879, 0.7323694, 0.1243688, 1, 0, 0, 1, 1,
1.283374, 1.378627, -0.01976781, 0, 0, 0, 1, 1,
1.291458, -1.559328, 2.682285, 0, 0, 0, 1, 1,
1.292886, 0.3028592, 0.4129092, 0, 0, 0, 1, 1,
1.293055, -0.6051786, 1.83281, 0, 0, 0, 1, 1,
1.293509, -1.028662, 2.858873, 0, 0, 0, 1, 1,
1.29624, -0.7726142, 2.475488, 0, 0, 0, 1, 1,
1.304229, -0.7672634, 1.819106, 0, 0, 0, 1, 1,
1.310761, 0.1596489, 2.602493, 1, 1, 1, 1, 1,
1.311662, -0.8277543, 3.508988, 1, 1, 1, 1, 1,
1.312438, -1.292627, 2.779849, 1, 1, 1, 1, 1,
1.331559, 0.7055839, 1.184946, 1, 1, 1, 1, 1,
1.337494, -1.68395, 2.743303, 1, 1, 1, 1, 1,
1.344125, 0.564812, 1.055723, 1, 1, 1, 1, 1,
1.344657, -0.9291916, 2.024936, 1, 1, 1, 1, 1,
1.34666, 1.019042, 1.113882, 1, 1, 1, 1, 1,
1.349353, 1.139325, 1.784067, 1, 1, 1, 1, 1,
1.362352, -0.02788426, 0.3752424, 1, 1, 1, 1, 1,
1.370068, 0.8464465, -0.705727, 1, 1, 1, 1, 1,
1.373545, 1.209157, -0.2789029, 1, 1, 1, 1, 1,
1.375274, 0.5208529, 1.90528, 1, 1, 1, 1, 1,
1.386079, 0.3124427, 2.434273, 1, 1, 1, 1, 1,
1.395254, -0.3707993, 0.6760956, 1, 1, 1, 1, 1,
1.405904, -0.03782988, 1.991311, 0, 0, 1, 1, 1,
1.424064, 0.3689345, 1.858767, 1, 0, 0, 1, 1,
1.424599, 0.4534655, 1.645661, 1, 0, 0, 1, 1,
1.433741, 1.56439, -0.9906334, 1, 0, 0, 1, 1,
1.436452, 0.5223179, 1.166921, 1, 0, 0, 1, 1,
1.439745, -2.145755, 1.18922, 1, 0, 0, 1, 1,
1.465114, -1.228314, 4.436026, 0, 0, 0, 1, 1,
1.481933, -0.08383527, 1.609501, 0, 0, 0, 1, 1,
1.491879, 0.5650437, 2.983392, 0, 0, 0, 1, 1,
1.497379, -0.4894713, 1.675631, 0, 0, 0, 1, 1,
1.497453, -0.7775795, 2.744289, 0, 0, 0, 1, 1,
1.498188, -0.04358608, 0.2615085, 0, 0, 0, 1, 1,
1.507159, 1.815738, 0.1092232, 0, 0, 0, 1, 1,
1.508657, 0.4283096, 0.6595933, 1, 1, 1, 1, 1,
1.513845, -0.5599, 2.811475, 1, 1, 1, 1, 1,
1.515185, 1.164741, 0.6208615, 1, 1, 1, 1, 1,
1.519269, -0.4092796, 1.768581, 1, 1, 1, 1, 1,
1.523052, 0.8490885, 1.502175, 1, 1, 1, 1, 1,
1.534813, 0.8434844, 0.9471641, 1, 1, 1, 1, 1,
1.54083, 0.02136434, 1.05788, 1, 1, 1, 1, 1,
1.545096, 0.1021369, 3.66278, 1, 1, 1, 1, 1,
1.554547, 2.118287, 1.179104, 1, 1, 1, 1, 1,
1.565671, -0.8710118, 0.5411896, 1, 1, 1, 1, 1,
1.581029, 0.173622, 2.059083, 1, 1, 1, 1, 1,
1.587935, 0.3678714, 1.217623, 1, 1, 1, 1, 1,
1.594421, -0.006046573, 1.254939, 1, 1, 1, 1, 1,
1.604331, -1.229485, 1.372881, 1, 1, 1, 1, 1,
1.610429, -0.8378681, 1.939636, 1, 1, 1, 1, 1,
1.615226, -2.381373, 2.750398, 0, 0, 1, 1, 1,
1.637274, -1.467493, 1.044762, 1, 0, 0, 1, 1,
1.642745, 0.860054, 0.2975514, 1, 0, 0, 1, 1,
1.661653, -0.1302557, 2.63414, 1, 0, 0, 1, 1,
1.667013, 0.1187205, 0.7934938, 1, 0, 0, 1, 1,
1.677233, 0.594907, 2.026002, 1, 0, 0, 1, 1,
1.700473, 0.5533406, 2.656378, 0, 0, 0, 1, 1,
1.716062, 1.964339, -0.8971288, 0, 0, 0, 1, 1,
1.720584, 0.5444275, 0.4879211, 0, 0, 0, 1, 1,
1.729343, -0.9634179, 2.03514, 0, 0, 0, 1, 1,
1.730576, 1.744223, 0.4499052, 0, 0, 0, 1, 1,
1.734779, -0.6205279, 2.961814, 0, 0, 0, 1, 1,
1.742185, -1.240768, 2.730497, 0, 0, 0, 1, 1,
1.745006, -0.1207822, 0.9159966, 1, 1, 1, 1, 1,
1.745262, 0.5079756, 0.7505906, 1, 1, 1, 1, 1,
1.759672, 0.5251851, 2.385866, 1, 1, 1, 1, 1,
1.765952, -0.06841934, 1.096681, 1, 1, 1, 1, 1,
1.772374, -0.4999811, 0.8407847, 1, 1, 1, 1, 1,
1.777696, 0.5780638, 0.6782957, 1, 1, 1, 1, 1,
1.783395, -0.6407183, 1.230191, 1, 1, 1, 1, 1,
1.829572, -1.489836, 2.32261, 1, 1, 1, 1, 1,
1.849962, 0.2932477, 1.309708, 1, 1, 1, 1, 1,
1.876351, 1.074769, -0.1141821, 1, 1, 1, 1, 1,
1.891624, -0.3118566, 0.3065935, 1, 1, 1, 1, 1,
1.901882, 1.651258, -0.277526, 1, 1, 1, 1, 1,
1.914314, 2.216675, 1.299204, 1, 1, 1, 1, 1,
1.921458, 0.5561227, 1.217917, 1, 1, 1, 1, 1,
1.954731, -0.7522784, 2.851096, 1, 1, 1, 1, 1,
1.961151, -0.7363629, 0.4147481, 0, 0, 1, 1, 1,
1.972958, 0.06274144, 1.283991, 1, 0, 0, 1, 1,
1.974939, -1.123239, 0.7618291, 1, 0, 0, 1, 1,
2.019508, 0.8816284, 0.8661932, 1, 0, 0, 1, 1,
2.021982, 0.09740794, 1.447006, 1, 0, 0, 1, 1,
2.081861, 0.2889605, -0.4534644, 1, 0, 0, 1, 1,
2.096611, 0.8222147, 0.0562319, 0, 0, 0, 1, 1,
2.134119, 0.2135117, 2.136355, 0, 0, 0, 1, 1,
2.224163, -0.7965112, 4.482309, 0, 0, 0, 1, 1,
2.228296, -0.7509276, 1.917489, 0, 0, 0, 1, 1,
2.258554, -0.8661021, 3.607354, 0, 0, 0, 1, 1,
2.324502, -0.1683069, 1.4275, 0, 0, 0, 1, 1,
2.503078, -0.1832358, 2.275705, 0, 0, 0, 1, 1,
2.570456, 0.9512593, 0.5702107, 1, 1, 1, 1, 1,
2.648116, 1.037507, 1.115953, 1, 1, 1, 1, 1,
2.700363, -0.958393, 1.30001, 1, 1, 1, 1, 1,
2.765073, 0.3071307, 1.287356, 1, 1, 1, 1, 1,
2.914556, -0.2620287, 1.568725, 1, 1, 1, 1, 1,
3.035697, 1.219237, 0.3070416, 1, 1, 1, 1, 1,
3.280265, 1.455405, -0.139506, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.258167;
var distance = 32.51892;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.01095343, 0.3608809, 0.1337538 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.51892);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
