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
-3.140575, -1.57036, -3.072115, 1, 0, 0, 1,
-3.044697, 1.021593, -1.690037, 1, 0.007843138, 0, 1,
-2.855098, 1.621179, -1.274554, 1, 0.01176471, 0, 1,
-2.761465, -0.702352, -3.414299, 1, 0.01960784, 0, 1,
-2.760765, -0.2325913, -3.397209, 1, 0.02352941, 0, 1,
-2.634585, -1.53698, -2.845659, 1, 0.03137255, 0, 1,
-2.581971, -0.5103639, -2.505712, 1, 0.03529412, 0, 1,
-2.512336, -0.4397043, -1.460945, 1, 0.04313726, 0, 1,
-2.366448, -0.9861556, -2.316646, 1, 0.04705882, 0, 1,
-2.358911, 0.3163657, 0.6514128, 1, 0.05490196, 0, 1,
-2.28866, 0.1235918, -2.073987, 1, 0.05882353, 0, 1,
-2.253549, 1.244215, -0.4790113, 1, 0.06666667, 0, 1,
-2.224231, 0.5332113, 0.8600352, 1, 0.07058824, 0, 1,
-2.215063, -0.7978986, -2.259658, 1, 0.07843138, 0, 1,
-2.158682, -0.5829414, -1.119232, 1, 0.08235294, 0, 1,
-2.129599, 0.2283033, -1.515951, 1, 0.09019608, 0, 1,
-2.084803, -0.8774939, -2.776563, 1, 0.09411765, 0, 1,
-2.065401, 0.104265, -1.915637, 1, 0.1019608, 0, 1,
-2.059351, 0.2143291, -0.585385, 1, 0.1098039, 0, 1,
-2.007368, 0.4931101, -0.4949947, 1, 0.1137255, 0, 1,
-2.007067, 1.046651, -2.213795, 1, 0.1215686, 0, 1,
-2.006005, -1.043168, -2.824735, 1, 0.1254902, 0, 1,
-1.982005, 0.8539438, -2.180859, 1, 0.1333333, 0, 1,
-1.962858, -1.325021, -2.070275, 1, 0.1372549, 0, 1,
-1.935936, 0.757872, -2.68708, 1, 0.145098, 0, 1,
-1.89524, 0.5763726, -0.8708216, 1, 0.1490196, 0, 1,
-1.887747, 0.9557939, -2.738434, 1, 0.1568628, 0, 1,
-1.887332, 0.178713, -2.242403, 1, 0.1607843, 0, 1,
-1.865413, 0.8976038, -2.276326, 1, 0.1686275, 0, 1,
-1.861561, -0.3005033, -1.383601, 1, 0.172549, 0, 1,
-1.843962, -0.6253204, -2.96953, 1, 0.1803922, 0, 1,
-1.828326, -0.6440669, -2.584482, 1, 0.1843137, 0, 1,
-1.798333, -0.1681108, -2.467531, 1, 0.1921569, 0, 1,
-1.794752, 0.8023346, -0.9471272, 1, 0.1960784, 0, 1,
-1.781363, 0.8911079, -1.053861, 1, 0.2039216, 0, 1,
-1.771047, 0.298524, -1.084372, 1, 0.2117647, 0, 1,
-1.767893, 1.204859, -1.937249, 1, 0.2156863, 0, 1,
-1.721833, 0.9856296, -0.7398007, 1, 0.2235294, 0, 1,
-1.68876, 0.4609488, -0.9424353, 1, 0.227451, 0, 1,
-1.685283, 1.921013, 1.11171, 1, 0.2352941, 0, 1,
-1.6759, -0.3556709, -0.556102, 1, 0.2392157, 0, 1,
-1.66198, -1.976623, -1.897779, 1, 0.2470588, 0, 1,
-1.661202, -0.4675263, -1.529779, 1, 0.2509804, 0, 1,
-1.645288, 0.9954683, -0.5314622, 1, 0.2588235, 0, 1,
-1.64013, -0.09524214, -0.9053946, 1, 0.2627451, 0, 1,
-1.635666, -0.7433244, -1.828175, 1, 0.2705882, 0, 1,
-1.635529, -0.7733004, -3.450036, 1, 0.2745098, 0, 1,
-1.63237, -0.4729475, -2.853303, 1, 0.282353, 0, 1,
-1.623332, -1.753995, -3.069978, 1, 0.2862745, 0, 1,
-1.605557, 0.621523, -0.1264678, 1, 0.2941177, 0, 1,
-1.604398, -0.9088598, -1.520801, 1, 0.3019608, 0, 1,
-1.603427, -0.3970615, -0.5912767, 1, 0.3058824, 0, 1,
-1.587041, -0.6840612, -1.797222, 1, 0.3137255, 0, 1,
-1.581244, 1.175386, 0.6567357, 1, 0.3176471, 0, 1,
-1.569909, 2.382939, -0.9040953, 1, 0.3254902, 0, 1,
-1.566616, -0.4698589, -2.416358, 1, 0.3294118, 0, 1,
-1.566566, -0.1419913, -2.291023, 1, 0.3372549, 0, 1,
-1.55944, 0.1801623, -2.60731, 1, 0.3411765, 0, 1,
-1.557983, 2.584969, -1.75148, 1, 0.3490196, 0, 1,
-1.557082, -0.4044748, -2.487047, 1, 0.3529412, 0, 1,
-1.556061, -0.3194528, -2.542934, 1, 0.3607843, 0, 1,
-1.539057, 1.268897, 0.2797951, 1, 0.3647059, 0, 1,
-1.532949, 0.3750142, -2.344886, 1, 0.372549, 0, 1,
-1.530906, 0.7931387, 0.2425629, 1, 0.3764706, 0, 1,
-1.513239, -0.02999799, -1.866327, 1, 0.3843137, 0, 1,
-1.504678, -1.529457, -1.881045, 1, 0.3882353, 0, 1,
-1.503348, 0.006564974, -0.2738928, 1, 0.3960784, 0, 1,
-1.483656, 0.005785653, -1.539813, 1, 0.4039216, 0, 1,
-1.471449, -1.576366, -2.54803, 1, 0.4078431, 0, 1,
-1.468132, 0.123489, 0.09547835, 1, 0.4156863, 0, 1,
-1.458458, -0.7466157, -1.095782, 1, 0.4196078, 0, 1,
-1.456555, 1.70535, -0.4140114, 1, 0.427451, 0, 1,
-1.45143, 0.8345203, -0.3213302, 1, 0.4313726, 0, 1,
-1.447691, -0.5750868, -2.461076, 1, 0.4392157, 0, 1,
-1.446879, -1.120019, -2.485631, 1, 0.4431373, 0, 1,
-1.441808, 1.148798, -3.719781, 1, 0.4509804, 0, 1,
-1.439697, 0.2524494, -0.6336491, 1, 0.454902, 0, 1,
-1.423787, -0.398264, -2.987543, 1, 0.4627451, 0, 1,
-1.422632, -0.7741202, -2.155594, 1, 0.4666667, 0, 1,
-1.421278, 0.2474406, -2.041709, 1, 0.4745098, 0, 1,
-1.4065, -2.671656, -2.73315, 1, 0.4784314, 0, 1,
-1.401159, 0.2765939, -3.133901, 1, 0.4862745, 0, 1,
-1.390681, -0.3996759, -0.2873219, 1, 0.4901961, 0, 1,
-1.389904, -2.55139, -2.462584, 1, 0.4980392, 0, 1,
-1.373677, 0.4881948, -0.2540336, 1, 0.5058824, 0, 1,
-1.36667, -0.120784, -1.120579, 1, 0.509804, 0, 1,
-1.366617, -0.3379495, -1.086933, 1, 0.5176471, 0, 1,
-1.352527, -0.3355255, 0.9717562, 1, 0.5215687, 0, 1,
-1.352355, -0.2608423, -3.432853, 1, 0.5294118, 0, 1,
-1.35196, 0.7226564, -1.461505, 1, 0.5333334, 0, 1,
-1.34782, -0.4263138, -0.2087081, 1, 0.5411765, 0, 1,
-1.347759, -0.5879322, -0.9241967, 1, 0.5450981, 0, 1,
-1.343619, -0.3579561, -2.29878, 1, 0.5529412, 0, 1,
-1.334117, -1.768041, -3.080737, 1, 0.5568628, 0, 1,
-1.327827, 0.6102147, -0.276073, 1, 0.5647059, 0, 1,
-1.327271, 0.1219721, -1.961108, 1, 0.5686275, 0, 1,
-1.323636, 0.3356552, -2.271486, 1, 0.5764706, 0, 1,
-1.320735, -0.1874132, -0.8643717, 1, 0.5803922, 0, 1,
-1.314733, -1.597124, -3.317688, 1, 0.5882353, 0, 1,
-1.314589, 0.8757142, -1.109849, 1, 0.5921569, 0, 1,
-1.293795, -0.1497379, -1.344445, 1, 0.6, 0, 1,
-1.287884, 0.2620222, -2.610823, 1, 0.6078432, 0, 1,
-1.278219, -0.2694673, -2.635787, 1, 0.6117647, 0, 1,
-1.268761, -0.01616351, -3.233342, 1, 0.6196079, 0, 1,
-1.267734, 0.9948272, -1.057984, 1, 0.6235294, 0, 1,
-1.261531, -0.08730184, -1.926485, 1, 0.6313726, 0, 1,
-1.249887, -2.000017, -2.74766, 1, 0.6352941, 0, 1,
-1.249606, 2.180667, 0.0567503, 1, 0.6431373, 0, 1,
-1.248366, -0.5943839, -3.149659, 1, 0.6470588, 0, 1,
-1.234276, -0.5687988, -0.8913134, 1, 0.654902, 0, 1,
-1.23256, 1.223882, -0.02899591, 1, 0.6588235, 0, 1,
-1.23182, -0.309765, -1.237076, 1, 0.6666667, 0, 1,
-1.228935, 0.3605591, -0.721857, 1, 0.6705883, 0, 1,
-1.226368, -0.5528395, -1.197746, 1, 0.6784314, 0, 1,
-1.225262, -0.9324204, -0.9454324, 1, 0.682353, 0, 1,
-1.218487, 0.08582185, 0.7770047, 1, 0.6901961, 0, 1,
-1.212844, -0.3598555, -2.888273, 1, 0.6941177, 0, 1,
-1.209978, 1.27758, 0.1480887, 1, 0.7019608, 0, 1,
-1.206836, -0.3654289, -1.810562, 1, 0.7098039, 0, 1,
-1.193809, 0.8666905, -0.4985965, 1, 0.7137255, 0, 1,
-1.187162, 0.7071115, -1.675613, 1, 0.7215686, 0, 1,
-1.185958, -1.263378, -2.489151, 1, 0.7254902, 0, 1,
-1.174611, 0.2217162, -1.252679, 1, 0.7333333, 0, 1,
-1.169431, 0.6952586, 0.2164413, 1, 0.7372549, 0, 1,
-1.162768, -0.3707202, -2.592243, 1, 0.7450981, 0, 1,
-1.161356, -0.2467753, -1.515414, 1, 0.7490196, 0, 1,
-1.154142, 0.4252355, -2.141075, 1, 0.7568628, 0, 1,
-1.153874, 0.1391405, -1.234997, 1, 0.7607843, 0, 1,
-1.151342, 2.53031, -0.7420142, 1, 0.7686275, 0, 1,
-1.141184, -0.6888794, -2.194238, 1, 0.772549, 0, 1,
-1.140159, -0.5782626, -2.888696, 1, 0.7803922, 0, 1,
-1.132898, -1.20336, -2.707865, 1, 0.7843137, 0, 1,
-1.131851, -1.518885, -3.450026, 1, 0.7921569, 0, 1,
-1.130613, -0.6433815, -2.553165, 1, 0.7960784, 0, 1,
-1.125361, 0.5626163, 0.1145741, 1, 0.8039216, 0, 1,
-1.122326, -1.622518, -3.644861, 1, 0.8117647, 0, 1,
-1.117058, 0.9543361, -1.863614, 1, 0.8156863, 0, 1,
-1.102728, -0.4873596, -4.89519, 1, 0.8235294, 0, 1,
-1.099097, 1.733304, 1.022264, 1, 0.827451, 0, 1,
-1.097031, 0.7597272, -1.911367, 1, 0.8352941, 0, 1,
-1.095601, -0.6540011, -2.279855, 1, 0.8392157, 0, 1,
-1.093432, 1.277879, 0.8686073, 1, 0.8470588, 0, 1,
-1.076375, 1.456838, -0.6051496, 1, 0.8509804, 0, 1,
-1.074361, 1.605994, 1.802319, 1, 0.8588235, 0, 1,
-1.062357, 1.365379, -1.813732, 1, 0.8627451, 0, 1,
-1.056018, 0.8217278, -1.092244, 1, 0.8705882, 0, 1,
-1.055183, -1.051841, -3.061362, 1, 0.8745098, 0, 1,
-1.047494, -1.246503, -1.191007, 1, 0.8823529, 0, 1,
-1.046078, 1.702686, -1.559056, 1, 0.8862745, 0, 1,
-1.040077, 1.269861, 0.5899321, 1, 0.8941177, 0, 1,
-1.035455, 1.111964, -1.59037, 1, 0.8980392, 0, 1,
-1.03313, -0.2988621, -2.338104, 1, 0.9058824, 0, 1,
-1.029299, 0.2059413, -1.603039, 1, 0.9137255, 0, 1,
-1.028059, -0.4592498, -2.036326, 1, 0.9176471, 0, 1,
-1.027293, 1.349154, -1.570343, 1, 0.9254902, 0, 1,
-1.016272, -0.04485941, 1.978932, 1, 0.9294118, 0, 1,
-1.016141, -0.06794461, -1.997117, 1, 0.9372549, 0, 1,
-1.013611, -0.05662854, -0.3083374, 1, 0.9411765, 0, 1,
-1.009641, 0.3566738, -1.898126, 1, 0.9490196, 0, 1,
-1.007058, -1.893318, -3.439825, 1, 0.9529412, 0, 1,
-1.006971, -0.3255148, -1.145074, 1, 0.9607843, 0, 1,
-1.002978, -0.5060508, -2.230681, 1, 0.9647059, 0, 1,
-1.002366, 2.273543, -0.1126123, 1, 0.972549, 0, 1,
-0.9981468, 0.4783472, -0.4934509, 1, 0.9764706, 0, 1,
-0.9970581, -0.3135822, -1.567057, 1, 0.9843137, 0, 1,
-0.995742, 0.6971112, -1.553217, 1, 0.9882353, 0, 1,
-0.9872393, -0.4568685, -1.943637, 1, 0.9960784, 0, 1,
-0.9785379, -0.02482603, -2.021067, 0.9960784, 1, 0, 1,
-0.9723053, 0.1248412, -2.038954, 0.9921569, 1, 0, 1,
-0.9582738, -1.899325, -3.268785, 0.9843137, 1, 0, 1,
-0.9567897, 0.2773466, -2.283614, 0.9803922, 1, 0, 1,
-0.9544377, 1.108166, 1.293468, 0.972549, 1, 0, 1,
-0.9483782, 0.9974446, -1.421111, 0.9686275, 1, 0, 1,
-0.9466689, -0.8321313, -2.703295, 0.9607843, 1, 0, 1,
-0.9430009, -0.1081858, -0.4531252, 0.9568627, 1, 0, 1,
-0.9299361, -0.7623527, -3.108517, 0.9490196, 1, 0, 1,
-0.927132, -1.02086, -3.810611, 0.945098, 1, 0, 1,
-0.923702, 0.0984515, -1.915478, 0.9372549, 1, 0, 1,
-0.9126133, 0.09198807, -2.927807, 0.9333333, 1, 0, 1,
-0.9122903, 0.6497213, -0.6175821, 0.9254902, 1, 0, 1,
-0.9113743, 0.5376336, -0.5465573, 0.9215686, 1, 0, 1,
-0.9108382, 0.7903638, -1.107343, 0.9137255, 1, 0, 1,
-0.907312, 1.379748, 0.6087388, 0.9098039, 1, 0, 1,
-0.9033754, 0.3713042, -0.978821, 0.9019608, 1, 0, 1,
-0.9030526, 0.3907848, -1.817715, 0.8941177, 1, 0, 1,
-0.8981295, 1.487564, 0.6690024, 0.8901961, 1, 0, 1,
-0.8952996, 0.03946362, -3.605684, 0.8823529, 1, 0, 1,
-0.892812, -0.05739982, -0.3151032, 0.8784314, 1, 0, 1,
-0.8897588, 0.8478951, -1.118311, 0.8705882, 1, 0, 1,
-0.8867623, 0.2207675, -0.6570878, 0.8666667, 1, 0, 1,
-0.8827277, 2.175117, -0.6887843, 0.8588235, 1, 0, 1,
-0.8807087, 2.714207, -0.2324561, 0.854902, 1, 0, 1,
-0.8789459, 0.9467163, -0.4512213, 0.8470588, 1, 0, 1,
-0.8769373, 1.860596, -0.4891463, 0.8431373, 1, 0, 1,
-0.8680662, 0.7805763, -2.391963, 0.8352941, 1, 0, 1,
-0.8658286, -0.3527468, -1.97825, 0.8313726, 1, 0, 1,
-0.865388, 1.607346, 0.401304, 0.8235294, 1, 0, 1,
-0.8634876, 1.604845, -1.624255, 0.8196079, 1, 0, 1,
-0.8560749, -0.8388013, -1.350347, 0.8117647, 1, 0, 1,
-0.8526055, -0.5422152, -2.147027, 0.8078431, 1, 0, 1,
-0.8467147, 1.320378, 0.452167, 0.8, 1, 0, 1,
-0.8451806, 0.04355725, -1.218586, 0.7921569, 1, 0, 1,
-0.8434827, 0.8714211, -2.246405, 0.7882353, 1, 0, 1,
-0.8401673, -0.009631211, -1.223384, 0.7803922, 1, 0, 1,
-0.8392953, 0.119505, -2.920635, 0.7764706, 1, 0, 1,
-0.8378178, -0.05776891, -1.300791, 0.7686275, 1, 0, 1,
-0.8376269, 0.9098859, 0.2721907, 0.7647059, 1, 0, 1,
-0.8348927, 0.2159213, -2.018868, 0.7568628, 1, 0, 1,
-0.8322932, 0.1308895, -2.949192, 0.7529412, 1, 0, 1,
-0.8316255, 0.3246056, -2.861905, 0.7450981, 1, 0, 1,
-0.8300222, -2.390035, -3.265093, 0.7411765, 1, 0, 1,
-0.8274817, 1.38162, -2.8004, 0.7333333, 1, 0, 1,
-0.8201119, 0.03102192, -1.877078, 0.7294118, 1, 0, 1,
-0.8193614, -1.266764, -2.996147, 0.7215686, 1, 0, 1,
-0.8143488, 0.379748, -1.110722, 0.7176471, 1, 0, 1,
-0.8099011, -1.185721, -0.2120516, 0.7098039, 1, 0, 1,
-0.8098708, 0.1107718, -1.852084, 0.7058824, 1, 0, 1,
-0.8064135, 0.1734048, -0.4728934, 0.6980392, 1, 0, 1,
-0.8053882, 2.473392, -0.6390878, 0.6901961, 1, 0, 1,
-0.8044132, -0.6652594, -1.797747, 0.6862745, 1, 0, 1,
-0.8019856, 1.565099, -1.244892, 0.6784314, 1, 0, 1,
-0.8016539, 0.3275926, -1.043117, 0.6745098, 1, 0, 1,
-0.8009487, -0.5577425, -2.206506, 0.6666667, 1, 0, 1,
-0.7952073, -1.354658, -4.158443, 0.6627451, 1, 0, 1,
-0.791808, 0.476472, -2.052993, 0.654902, 1, 0, 1,
-0.7759168, 1.238925, -0.3897848, 0.6509804, 1, 0, 1,
-0.7717521, -0.9474581, -2.391662, 0.6431373, 1, 0, 1,
-0.7694482, -0.1678462, -1.618481, 0.6392157, 1, 0, 1,
-0.7640014, -0.04374455, -0.8626835, 0.6313726, 1, 0, 1,
-0.760121, -2.298843, -1.383324, 0.627451, 1, 0, 1,
-0.7584251, -0.5294215, -2.302748, 0.6196079, 1, 0, 1,
-0.7573251, 0.4972422, -2.268764, 0.6156863, 1, 0, 1,
-0.7548325, -0.703945, -2.702896, 0.6078432, 1, 0, 1,
-0.7540352, 0.2823878, 0.05992875, 0.6039216, 1, 0, 1,
-0.7534415, 1.659776, -1.116578, 0.5960785, 1, 0, 1,
-0.7520999, -0.6122719, -1.33559, 0.5882353, 1, 0, 1,
-0.7519, 1.077935, -1.617592, 0.5843138, 1, 0, 1,
-0.7503188, 0.6118968, -1.292129, 0.5764706, 1, 0, 1,
-0.7432802, 1.813326, -1.674195, 0.572549, 1, 0, 1,
-0.7428166, -0.2199332, -1.843333, 0.5647059, 1, 0, 1,
-0.7391831, 0.1354767, -1.647417, 0.5607843, 1, 0, 1,
-0.7362124, 1.1332, -0.363218, 0.5529412, 1, 0, 1,
-0.7328615, -0.1670573, 0.2897421, 0.5490196, 1, 0, 1,
-0.7321876, 0.5133985, -0.9236765, 0.5411765, 1, 0, 1,
-0.7321545, -1.318376, -3.223787, 0.5372549, 1, 0, 1,
-0.7274975, -0.1716484, -1.954413, 0.5294118, 1, 0, 1,
-0.727497, -0.5510399, -1.906082, 0.5254902, 1, 0, 1,
-0.7208022, 1.158893, -0.5487701, 0.5176471, 1, 0, 1,
-0.7123247, -1.796614, -4.021343, 0.5137255, 1, 0, 1,
-0.7108656, 1.894971, 0.8554043, 0.5058824, 1, 0, 1,
-0.7105821, -0.8310229, -4.462708, 0.5019608, 1, 0, 1,
-0.7092451, -0.02738207, -2.827189, 0.4941176, 1, 0, 1,
-0.7026321, -0.01187667, -1.155934, 0.4862745, 1, 0, 1,
-0.701245, 0.4040118, -2.695186, 0.4823529, 1, 0, 1,
-0.7005919, -0.1341395, 0.08569121, 0.4745098, 1, 0, 1,
-0.7001113, 0.3877208, -0.7347422, 0.4705882, 1, 0, 1,
-0.6999576, -0.6489851, -2.376385, 0.4627451, 1, 0, 1,
-0.6998908, 1.351012, -1.041268, 0.4588235, 1, 0, 1,
-0.6838047, -2.099186, -4.364133, 0.4509804, 1, 0, 1,
-0.6836714, 0.8600578, -1.023754, 0.4470588, 1, 0, 1,
-0.6825958, 1.138759, -1.535853, 0.4392157, 1, 0, 1,
-0.678143, -0.1774823, -2.09798, 0.4352941, 1, 0, 1,
-0.6726704, 1.085732, -0.1113391, 0.427451, 1, 0, 1,
-0.6685244, 1.383194, -0.9852509, 0.4235294, 1, 0, 1,
-0.668318, 0.472295, -1.782787, 0.4156863, 1, 0, 1,
-0.6669253, -1.257776, -2.737472, 0.4117647, 1, 0, 1,
-0.6649454, 0.2817278, -0.2439019, 0.4039216, 1, 0, 1,
-0.6639004, 0.4791329, -1.901477, 0.3960784, 1, 0, 1,
-0.6637246, -0.7395038, -3.466928, 0.3921569, 1, 0, 1,
-0.6598889, 0.1803571, -1.145796, 0.3843137, 1, 0, 1,
-0.6551416, -1.306405, -3.547513, 0.3803922, 1, 0, 1,
-0.6550007, -0.002723855, -1.500374, 0.372549, 1, 0, 1,
-0.6526594, 0.1686926, -2.183598, 0.3686275, 1, 0, 1,
-0.6445556, 0.8389779, 2.031095, 0.3607843, 1, 0, 1,
-0.6407604, 0.5704095, -0.3413899, 0.3568628, 1, 0, 1,
-0.6400859, -0.8531043, -2.267762, 0.3490196, 1, 0, 1,
-0.6374677, 1.159397, -0.3396946, 0.345098, 1, 0, 1,
-0.6340366, -0.7227749, -2.671086, 0.3372549, 1, 0, 1,
-0.6335005, -1.527327, -4.067558, 0.3333333, 1, 0, 1,
-0.630629, -0.5347824, -1.818997, 0.3254902, 1, 0, 1,
-0.6232417, -0.1408325, -1.856172, 0.3215686, 1, 0, 1,
-0.6187482, 0.7270659, -1.213181, 0.3137255, 1, 0, 1,
-0.6065333, 0.8707801, -1.606581, 0.3098039, 1, 0, 1,
-0.6063503, 1.240315, -0.1917638, 0.3019608, 1, 0, 1,
-0.601401, 0.1855187, -1.053639, 0.2941177, 1, 0, 1,
-0.5997793, 1.143134, -0.6511708, 0.2901961, 1, 0, 1,
-0.5928834, 0.5764061, -1.660803, 0.282353, 1, 0, 1,
-0.5923952, 1.065225, -0.6098823, 0.2784314, 1, 0, 1,
-0.5869045, 1.266824, -0.5803914, 0.2705882, 1, 0, 1,
-0.5864466, -0.3572454, -0.6591986, 0.2666667, 1, 0, 1,
-0.5860131, -0.8370299, -1.852764, 0.2588235, 1, 0, 1,
-0.5850652, -0.7755899, -0.4000823, 0.254902, 1, 0, 1,
-0.5841491, 0.2035158, -1.146808, 0.2470588, 1, 0, 1,
-0.5824444, 0.5584291, -0.1304759, 0.2431373, 1, 0, 1,
-0.5808812, -0.2198736, -1.950802, 0.2352941, 1, 0, 1,
-0.5764104, 0.01557051, -1.803656, 0.2313726, 1, 0, 1,
-0.5748135, -0.2277424, -2.331091, 0.2235294, 1, 0, 1,
-0.5745862, 2.403965, -1.200009, 0.2196078, 1, 0, 1,
-0.5722718, -0.3303947, -3.356202, 0.2117647, 1, 0, 1,
-0.5621433, -1.785414, -1.907589, 0.2078431, 1, 0, 1,
-0.5605488, -1.000896, -3.28695, 0.2, 1, 0, 1,
-0.5541189, -0.5574048, -2.503858, 0.1921569, 1, 0, 1,
-0.5500299, -0.5500746, -0.7564327, 0.1882353, 1, 0, 1,
-0.5492716, -0.3292732, -0.9221739, 0.1803922, 1, 0, 1,
-0.5485187, -0.229543, -1.20195, 0.1764706, 1, 0, 1,
-0.536876, -0.566016, -3.601265, 0.1686275, 1, 0, 1,
-0.534013, 0.8810881, -0.7384977, 0.1647059, 1, 0, 1,
-0.5274567, -1.628994, -4.371766, 0.1568628, 1, 0, 1,
-0.5254719, 0.6271243, -0.4344575, 0.1529412, 1, 0, 1,
-0.5230631, 1.054495, 0.4406094, 0.145098, 1, 0, 1,
-0.5209569, 0.1514148, -1.070965, 0.1411765, 1, 0, 1,
-0.5205859, -0.04663992, -1.86939, 0.1333333, 1, 0, 1,
-0.5131676, -0.8106642, -1.175692, 0.1294118, 1, 0, 1,
-0.5089664, -0.5469365, -2.474629, 0.1215686, 1, 0, 1,
-0.5061272, -1.398709, -3.979795, 0.1176471, 1, 0, 1,
-0.5055076, -0.3232249, -1.501917, 0.1098039, 1, 0, 1,
-0.5053877, 0.7745801, -0.1925568, 0.1058824, 1, 0, 1,
-0.4854724, 0.6138494, -2.941362, 0.09803922, 1, 0, 1,
-0.4832129, -1.025341, -2.238793, 0.09019608, 1, 0, 1,
-0.4769708, -1.733136, -1.895569, 0.08627451, 1, 0, 1,
-0.4764304, 0.2179745, -0.2339988, 0.07843138, 1, 0, 1,
-0.4683426, -1.620721, -3.655714, 0.07450981, 1, 0, 1,
-0.4620935, 0.6574824, -2.158396, 0.06666667, 1, 0, 1,
-0.4600446, 0.2962785, 0.2206001, 0.0627451, 1, 0, 1,
-0.4592063, 1.650062, -1.279279, 0.05490196, 1, 0, 1,
-0.4576136, 0.6416059, -0.3121337, 0.05098039, 1, 0, 1,
-0.456449, 0.4488896, -0.6314318, 0.04313726, 1, 0, 1,
-0.4537272, -0.06552114, -2.276552, 0.03921569, 1, 0, 1,
-0.4503518, -0.4227044, -1.896424, 0.03137255, 1, 0, 1,
-0.4487928, 0.8639181, -1.476225, 0.02745098, 1, 0, 1,
-0.4481922, 1.917315, 0.8454984, 0.01960784, 1, 0, 1,
-0.4479429, -0.6322755, -1.757877, 0.01568628, 1, 0, 1,
-0.4479268, -0.8155181, -2.571011, 0.007843138, 1, 0, 1,
-0.4458009, -0.2412401, -2.882444, 0.003921569, 1, 0, 1,
-0.439737, -0.6462726, -2.405729, 0, 1, 0.003921569, 1,
-0.4147967, -1.788345, -4.981383, 0, 1, 0.01176471, 1,
-0.4135785, 1.149138, -0.6591095, 0, 1, 0.01568628, 1,
-0.4122121, -0.5980469, -3.31471, 0, 1, 0.02352941, 1,
-0.4047544, -0.7482314, -1.778688, 0, 1, 0.02745098, 1,
-0.403771, -0.5796504, -3.464953, 0, 1, 0.03529412, 1,
-0.3949837, -1.945991, -3.188714, 0, 1, 0.03921569, 1,
-0.3930487, 0.3741593, -1.711714, 0, 1, 0.04705882, 1,
-0.391246, -0.8905847, -4.527405, 0, 1, 0.05098039, 1,
-0.3892078, -0.5085773, -3.478896, 0, 1, 0.05882353, 1,
-0.3872108, -0.1379283, -2.136329, 0, 1, 0.0627451, 1,
-0.3867467, -0.7607543, -3.446387, 0, 1, 0.07058824, 1,
-0.3830447, 1.599021, -1.310818, 0, 1, 0.07450981, 1,
-0.3825777, 0.3474015, 0.06558383, 0, 1, 0.08235294, 1,
-0.3821338, 1.652997, -1.067286, 0, 1, 0.08627451, 1,
-0.3784544, -0.3291326, -1.058537, 0, 1, 0.09411765, 1,
-0.3752739, -0.264737, -3.502218, 0, 1, 0.1019608, 1,
-0.3742595, -1.000525, -6.22298, 0, 1, 0.1058824, 1,
-0.3604835, -0.5387822, -2.437113, 0, 1, 0.1137255, 1,
-0.3560399, 0.1537447, -1.545659, 0, 1, 0.1176471, 1,
-0.3557401, 0.4481559, 0.7003208, 0, 1, 0.1254902, 1,
-0.3521128, 0.922443, 0.520234, 0, 1, 0.1294118, 1,
-0.3510952, -2.24486, -2.749006, 0, 1, 0.1372549, 1,
-0.3465572, -0.6093631, -3.658883, 0, 1, 0.1411765, 1,
-0.3442254, -0.5429175, -1.046287, 0, 1, 0.1490196, 1,
-0.3432072, 0.2340391, -1.5441, 0, 1, 0.1529412, 1,
-0.342416, 0.6065967, -1.79919, 0, 1, 0.1607843, 1,
-0.3399138, -1.462501, -4.501629, 0, 1, 0.1647059, 1,
-0.3397468, 0.8630183, 1.851558, 0, 1, 0.172549, 1,
-0.3373309, 0.4314674, 1.263685, 0, 1, 0.1764706, 1,
-0.3355389, -1.376457, -4.719092, 0, 1, 0.1843137, 1,
-0.3326278, -0.5299989, -2.770604, 0, 1, 0.1882353, 1,
-0.3322939, -0.206505, -0.6757949, 0, 1, 0.1960784, 1,
-0.3286846, -0.9629794, -1.823237, 0, 1, 0.2039216, 1,
-0.3260266, 1.023703, -1.397511, 0, 1, 0.2078431, 1,
-0.3154095, -0.419313, -4.177736, 0, 1, 0.2156863, 1,
-0.3142312, -0.5937901, -3.332776, 0, 1, 0.2196078, 1,
-0.3126979, 0.6206262, -1.587828, 0, 1, 0.227451, 1,
-0.3102859, 0.05722522, -2.84325, 0, 1, 0.2313726, 1,
-0.3101973, -1.373996, -2.777713, 0, 1, 0.2392157, 1,
-0.3073892, 0.4784569, 0.5754836, 0, 1, 0.2431373, 1,
-0.3055524, 0.02828782, -1.439928, 0, 1, 0.2509804, 1,
-0.3053738, -0.2728623, -3.670301, 0, 1, 0.254902, 1,
-0.304029, 0.7002628, -0.5270723, 0, 1, 0.2627451, 1,
-0.2936192, 0.462769, -2.685241, 0, 1, 0.2666667, 1,
-0.2924899, 0.1989486, -0.7770002, 0, 1, 0.2745098, 1,
-0.2911843, -0.2268848, -1.495136, 0, 1, 0.2784314, 1,
-0.2883914, -1.342223, -4.820561, 0, 1, 0.2862745, 1,
-0.2866476, -1.805286, -4.138247, 0, 1, 0.2901961, 1,
-0.2847419, 1.709874, -1.074002, 0, 1, 0.2980392, 1,
-0.2838204, -0.8130519, -0.8990155, 0, 1, 0.3058824, 1,
-0.2826379, 1.432596, 0.8721183, 0, 1, 0.3098039, 1,
-0.2813753, 0.4962682, 0.3637983, 0, 1, 0.3176471, 1,
-0.2773136, 0.6242079, 0.2203084, 0, 1, 0.3215686, 1,
-0.2743223, -0.1827369, -1.914723, 0, 1, 0.3294118, 1,
-0.2702879, -1.387455, -4.654471, 0, 1, 0.3333333, 1,
-0.2683885, 0.2846574, -1.242887, 0, 1, 0.3411765, 1,
-0.2655881, 1.177374, -1.415175, 0, 1, 0.345098, 1,
-0.2603596, 0.121316, -2.419961, 0, 1, 0.3529412, 1,
-0.2592811, -0.3784995, -2.733389, 0, 1, 0.3568628, 1,
-0.2580047, 0.3726467, 1.82743, 0, 1, 0.3647059, 1,
-0.2551624, 0.1511796, -1.430681, 0, 1, 0.3686275, 1,
-0.2545382, 0.5990806, -2.125451, 0, 1, 0.3764706, 1,
-0.2523829, 1.354427, -0.8255818, 0, 1, 0.3803922, 1,
-0.251365, 1.768329, -0.0922786, 0, 1, 0.3882353, 1,
-0.2502294, 0.2954205, -1.84243, 0, 1, 0.3921569, 1,
-0.2501656, 0.6920934, -1.543263, 0, 1, 0.4, 1,
-0.2457719, 1.364806, -1.122766, 0, 1, 0.4078431, 1,
-0.2436255, -1.94774, -3.202967, 0, 1, 0.4117647, 1,
-0.2380028, -0.8898476, -3.44304, 0, 1, 0.4196078, 1,
-0.2359495, 0.164096, -1.01082, 0, 1, 0.4235294, 1,
-0.2359034, -1.595557, -3.075084, 0, 1, 0.4313726, 1,
-0.2323615, -1.497531, -1.013773, 0, 1, 0.4352941, 1,
-0.2305055, 0.8567323, 0.07590611, 0, 1, 0.4431373, 1,
-0.2303101, -1.125992, -2.063861, 0, 1, 0.4470588, 1,
-0.2259197, -0.5732275, -4.272594, 0, 1, 0.454902, 1,
-0.2251142, -1.135745, -2.754298, 0, 1, 0.4588235, 1,
-0.2176386, -0.9962525, -2.131061, 0, 1, 0.4666667, 1,
-0.2153966, 0.2667381, -1.098375, 0, 1, 0.4705882, 1,
-0.2150336, 1.585831, 0.2102391, 0, 1, 0.4784314, 1,
-0.21419, -0.5280973, -3.472307, 0, 1, 0.4823529, 1,
-0.2117876, -1.485791, -3.224659, 0, 1, 0.4901961, 1,
-0.2111221, 0.6986425, -0.4485343, 0, 1, 0.4941176, 1,
-0.2067781, -1.475287, -1.255976, 0, 1, 0.5019608, 1,
-0.2051256, 1.084658, -0.911345, 0, 1, 0.509804, 1,
-0.2024131, -0.8876275, -3.239301, 0, 1, 0.5137255, 1,
-0.1992629, 0.09459315, -1.72396, 0, 1, 0.5215687, 1,
-0.1991612, 0.3229201, 0.02781693, 0, 1, 0.5254902, 1,
-0.1981111, -0.9457515, -2.418869, 0, 1, 0.5333334, 1,
-0.197764, -0.5937786, -4.678943, 0, 1, 0.5372549, 1,
-0.1962576, 0.4040258, -2.771909, 0, 1, 0.5450981, 1,
-0.1941177, -0.5212808, -0.9508181, 0, 1, 0.5490196, 1,
-0.193234, -1.183691, -3.022594, 0, 1, 0.5568628, 1,
-0.1867103, -0.04242355, -2.71591, 0, 1, 0.5607843, 1,
-0.1857367, -0.2741487, -2.609147, 0, 1, 0.5686275, 1,
-0.1820941, -0.8434408, -1.473463, 0, 1, 0.572549, 1,
-0.1807101, -1.326836, -3.594262, 0, 1, 0.5803922, 1,
-0.1784671, 0.2816206, -0.6284037, 0, 1, 0.5843138, 1,
-0.1713008, -0.2437396, -2.716789, 0, 1, 0.5921569, 1,
-0.1689004, -0.960874, -5.497718, 0, 1, 0.5960785, 1,
-0.1681742, -0.4892831, -4.095726, 0, 1, 0.6039216, 1,
-0.1645572, -0.3051834, -1.653344, 0, 1, 0.6117647, 1,
-0.1590964, 1.280355, -0.07883099, 0, 1, 0.6156863, 1,
-0.1559445, 0.6121241, 0.8990308, 0, 1, 0.6235294, 1,
-0.1546482, -1.0915, -4.354711, 0, 1, 0.627451, 1,
-0.1525767, 1.082216, 0.8317384, 0, 1, 0.6352941, 1,
-0.1522373, 0.4527869, -1.68469, 0, 1, 0.6392157, 1,
-0.1516991, -0.2780032, -3.494056, 0, 1, 0.6470588, 1,
-0.1511231, -1.193897, -4.545108, 0, 1, 0.6509804, 1,
-0.1483866, -1.127685, -2.274709, 0, 1, 0.6588235, 1,
-0.1453717, 0.06810726, -2.857958, 0, 1, 0.6627451, 1,
-0.1448484, 1.220548, 1.471692, 0, 1, 0.6705883, 1,
-0.1440067, -0.125444, -3.660389, 0, 1, 0.6745098, 1,
-0.1409556, 1.114971, -0.6286013, 0, 1, 0.682353, 1,
-0.1395165, 0.4125233, -0.3625552, 0, 1, 0.6862745, 1,
-0.133248, -1.069112, -1.977969, 0, 1, 0.6941177, 1,
-0.1331639, -0.1240128, -2.160013, 0, 1, 0.7019608, 1,
-0.1290743, -0.2870857, -2.702302, 0, 1, 0.7058824, 1,
-0.1287303, 1.289948, -0.6556028, 0, 1, 0.7137255, 1,
-0.1283183, -0.07240928, -1.481253, 0, 1, 0.7176471, 1,
-0.1277528, 0.2408201, 0.4421299, 0, 1, 0.7254902, 1,
-0.1271324, 0.216518, -0.2055936, 0, 1, 0.7294118, 1,
-0.1253265, 0.8376152, -0.6593418, 0, 1, 0.7372549, 1,
-0.1244735, 0.3820624, -1.352708, 0, 1, 0.7411765, 1,
-0.1230104, 0.1514181, -0.1358744, 0, 1, 0.7490196, 1,
-0.1205199, -0.04969902, -1.294084, 0, 1, 0.7529412, 1,
-0.1144409, -0.7630442, -2.108992, 0, 1, 0.7607843, 1,
-0.1142853, -0.6360642, -4.347167, 0, 1, 0.7647059, 1,
-0.112731, -1.882517, -1.759663, 0, 1, 0.772549, 1,
-0.1014911, 1.931357, 2.257298, 0, 1, 0.7764706, 1,
-0.09960865, 0.4504812, -0.4114478, 0, 1, 0.7843137, 1,
-0.09870443, -1.098595, -2.670286, 0, 1, 0.7882353, 1,
-0.09801331, -0.4660441, -4.561309, 0, 1, 0.7960784, 1,
-0.09402855, 0.07252351, -1.40267, 0, 1, 0.8039216, 1,
-0.09293493, -1.527869, -3.320387, 0, 1, 0.8078431, 1,
-0.09263835, -0.06867069, -4.11867, 0, 1, 0.8156863, 1,
-0.0909217, -0.4359128, -4.210547, 0, 1, 0.8196079, 1,
-0.0874222, -0.6317992, -3.55588, 0, 1, 0.827451, 1,
-0.0841855, 0.1864158, -0.2727497, 0, 1, 0.8313726, 1,
-0.07906694, -0.3455345, -2.44204, 0, 1, 0.8392157, 1,
-0.07895097, -1.190097, -3.375496, 0, 1, 0.8431373, 1,
-0.07785963, 0.5863935, -0.5820124, 0, 1, 0.8509804, 1,
-0.07603988, -0.03684002, -2.622832, 0, 1, 0.854902, 1,
-0.07355257, -1.487747, -3.272242, 0, 1, 0.8627451, 1,
-0.07146964, 0.9861837, 1.682164, 0, 1, 0.8666667, 1,
-0.06519341, -1.102603, -2.570715, 0, 1, 0.8745098, 1,
-0.06409336, 0.8238648, 0.8504226, 0, 1, 0.8784314, 1,
-0.0624781, -0.2846327, -4.828247, 0, 1, 0.8862745, 1,
-0.06000111, -1.263291, -3.925293, 0, 1, 0.8901961, 1,
-0.05703456, -0.4245562, -3.012499, 0, 1, 0.8980392, 1,
-0.05686196, 2.679226, -1.773614, 0, 1, 0.9058824, 1,
-0.05461585, 0.1538119, -0.7768038, 0, 1, 0.9098039, 1,
-0.05408376, -0.08575934, -4.29053, 0, 1, 0.9176471, 1,
-0.05133008, -0.579439, -4.033338, 0, 1, 0.9215686, 1,
-0.0507942, -0.5781616, -3.102356, 0, 1, 0.9294118, 1,
-0.04872108, -0.2749763, -1.619922, 0, 1, 0.9333333, 1,
-0.04720328, 0.01753833, -1.673525, 0, 1, 0.9411765, 1,
-0.03868413, 1.705111, -1.924572, 0, 1, 0.945098, 1,
-0.03847211, -0.2339623, -3.949743, 0, 1, 0.9529412, 1,
-0.0381568, -1.331573, -2.360051, 0, 1, 0.9568627, 1,
-0.03604981, -1.304523, -2.164413, 0, 1, 0.9647059, 1,
-0.03599329, -0.113116, -2.576659, 0, 1, 0.9686275, 1,
-0.03296461, 0.1982256, 1.131678, 0, 1, 0.9764706, 1,
-0.03012295, 0.5296505, 0.06448799, 0, 1, 0.9803922, 1,
-0.02632689, -1.950648, -3.50601, 0, 1, 0.9882353, 1,
-0.02082791, 2.273422, 0.7834095, 0, 1, 0.9921569, 1,
-0.01885848, 0.3696962, 1.580946, 0, 1, 1, 1,
-0.01761644, -0.1738797, -2.606213, 0, 0.9921569, 1, 1,
-0.01486573, -1.76597, -4.723234, 0, 0.9882353, 1, 1,
-0.01337137, -0.1202382, -2.223221, 0, 0.9803922, 1, 1,
-0.01320523, -0.582819, -1.486138, 0, 0.9764706, 1, 1,
-0.01062027, 0.355562, -1.097637, 0, 0.9686275, 1, 1,
-0.009559301, -0.1706619, -4.32207, 0, 0.9647059, 1, 1,
-0.008072032, -1.983315, -5.126704, 0, 0.9568627, 1, 1,
-0.0007600458, 0.7799572, 1.239394, 0, 0.9529412, 1, 1,
0.003744859, -0.2632089, 3.682047, 0, 0.945098, 1, 1,
0.006447719, 0.7441072, -1.657863, 0, 0.9411765, 1, 1,
0.01056671, -0.8446776, 4.521517, 0, 0.9333333, 1, 1,
0.01135137, -0.8053224, 1.543037, 0, 0.9294118, 1, 1,
0.01416467, -0.1336496, 1.358112, 0, 0.9215686, 1, 1,
0.01612651, 0.7096277, 0.6508311, 0, 0.9176471, 1, 1,
0.0183737, -0.5260251, 2.816923, 0, 0.9098039, 1, 1,
0.02324809, -0.8433865, 4.238807, 0, 0.9058824, 1, 1,
0.02635096, -0.009046565, 1.329875, 0, 0.8980392, 1, 1,
0.02828544, 1.219779, 0.04729829, 0, 0.8901961, 1, 1,
0.03205993, 0.2849168, 0.3871285, 0, 0.8862745, 1, 1,
0.03570012, -0.7157323, 1.970146, 0, 0.8784314, 1, 1,
0.03713715, -0.8586152, 2.306901, 0, 0.8745098, 1, 1,
0.03876349, -3.244283, 3.049352, 0, 0.8666667, 1, 1,
0.0391638, -1.33513, 2.985895, 0, 0.8627451, 1, 1,
0.03976212, 2.080481, 0.4430164, 0, 0.854902, 1, 1,
0.04218327, -0.03630305, 2.981343, 0, 0.8509804, 1, 1,
0.04972094, 1.405838, 0.7805017, 0, 0.8431373, 1, 1,
0.05502575, -0.7113481, 3.127901, 0, 0.8392157, 1, 1,
0.05569068, 0.1134444, 1.017969, 0, 0.8313726, 1, 1,
0.05608204, 0.1306513, -0.08159764, 0, 0.827451, 1, 1,
0.06847837, 0.07027271, 2.837907, 0, 0.8196079, 1, 1,
0.06937873, -0.6893885, 2.532008, 0, 0.8156863, 1, 1,
0.07186858, -0.04323585, 3.034959, 0, 0.8078431, 1, 1,
0.07226656, 0.2071472, 0.5639583, 0, 0.8039216, 1, 1,
0.07280274, -1.13414, 1.914986, 0, 0.7960784, 1, 1,
0.07333126, -0.5342007, 3.297513, 0, 0.7882353, 1, 1,
0.07568415, -0.1575916, 3.412391, 0, 0.7843137, 1, 1,
0.07837987, 1.054945, -0.05135658, 0, 0.7764706, 1, 1,
0.08017854, 0.449681, -0.8042595, 0, 0.772549, 1, 1,
0.08504467, -0.7402944, 3.997338, 0, 0.7647059, 1, 1,
0.08562115, -0.8384512, 3.716222, 0, 0.7607843, 1, 1,
0.08874354, 0.3952902, -0.1533687, 0, 0.7529412, 1, 1,
0.08954379, -0.6156649, 1.880711, 0, 0.7490196, 1, 1,
0.09524418, -1.026046, 3.871899, 0, 0.7411765, 1, 1,
0.1044755, 0.5664077, -0.2257216, 0, 0.7372549, 1, 1,
0.1075076, 0.5311608, 1.891551, 0, 0.7294118, 1, 1,
0.1083276, -0.3363879, 2.597965, 0, 0.7254902, 1, 1,
0.1117854, -0.07189917, 4.18437, 0, 0.7176471, 1, 1,
0.114304, 1.243209, -1.052999, 0, 0.7137255, 1, 1,
0.1175057, 1.447883, 0.8266588, 0, 0.7058824, 1, 1,
0.1217867, 0.6210324, -0.4386663, 0, 0.6980392, 1, 1,
0.124163, 1.195121, 1.258328, 0, 0.6941177, 1, 1,
0.1244314, 1.53655, 0.703387, 0, 0.6862745, 1, 1,
0.1264484, -0.4443545, 2.731247, 0, 0.682353, 1, 1,
0.1301908, 0.9396009, 0.8657718, 0, 0.6745098, 1, 1,
0.1340848, 0.9076461, -0.136946, 0, 0.6705883, 1, 1,
0.134908, 2.082934, 0.7116163, 0, 0.6627451, 1, 1,
0.1370488, -0.6060092, 2.140746, 0, 0.6588235, 1, 1,
0.1432675, -0.9860995, 3.158553, 0, 0.6509804, 1, 1,
0.1448345, 1.192296, -0.3337332, 0, 0.6470588, 1, 1,
0.1527302, 0.3723261, 2.188767, 0, 0.6392157, 1, 1,
0.1573417, -0.06627321, 1.857196, 0, 0.6352941, 1, 1,
0.1619607, -1.67036, 3.731139, 0, 0.627451, 1, 1,
0.1641603, -1.026515, 4.861348, 0, 0.6235294, 1, 1,
0.1657415, -1.377925, 3.492982, 0, 0.6156863, 1, 1,
0.1742844, 0.5432785, 0.4206386, 0, 0.6117647, 1, 1,
0.1771099, 1.029498, 1.772182, 0, 0.6039216, 1, 1,
0.1791572, 1.491489, -1.291792, 0, 0.5960785, 1, 1,
0.184345, 1.549021, 0.7403754, 0, 0.5921569, 1, 1,
0.1850859, -0.8589653, 4.060674, 0, 0.5843138, 1, 1,
0.1851295, -0.3569986, 1.868331, 0, 0.5803922, 1, 1,
0.1859813, 1.445233, -0.2739693, 0, 0.572549, 1, 1,
0.1863857, 0.5661155, 0.4073108, 0, 0.5686275, 1, 1,
0.1869363, 1.120784, -0.1809047, 0, 0.5607843, 1, 1,
0.187318, -1.736658, 2.885346, 0, 0.5568628, 1, 1,
0.1889656, 1.062568, -0.01831362, 0, 0.5490196, 1, 1,
0.1940102, 0.6760304, -0.9462257, 0, 0.5450981, 1, 1,
0.1980321, 1.14801, -0.3499368, 0, 0.5372549, 1, 1,
0.1989864, -1.267446, 2.964628, 0, 0.5333334, 1, 1,
0.2023616, 1.228752, 0.4134431, 0, 0.5254902, 1, 1,
0.2036755, 1.334244, -0.5981724, 0, 0.5215687, 1, 1,
0.2156032, -0.2138796, 2.800119, 0, 0.5137255, 1, 1,
0.2165834, -0.6163878, 1.125194, 0, 0.509804, 1, 1,
0.2165946, -0.06514309, 1.552664, 0, 0.5019608, 1, 1,
0.2168973, -0.1395938, 1.410977, 0, 0.4941176, 1, 1,
0.2272353, -0.930526, 2.467981, 0, 0.4901961, 1, 1,
0.2296723, -0.2799358, 3.406639, 0, 0.4823529, 1, 1,
0.2309547, 2.313812, 0.1511688, 0, 0.4784314, 1, 1,
0.2336147, 1.194551, 0.5370424, 0, 0.4705882, 1, 1,
0.2383345, 0.8109037, -0.2610139, 0, 0.4666667, 1, 1,
0.2404735, 0.4429424, -1.132822, 0, 0.4588235, 1, 1,
0.2419679, 0.1017603, 2.406924, 0, 0.454902, 1, 1,
0.2463099, -0.6353329, 3.115427, 0, 0.4470588, 1, 1,
0.2483358, -0.1135952, 3.155703, 0, 0.4431373, 1, 1,
0.2528321, -1.161348, 2.985149, 0, 0.4352941, 1, 1,
0.2581832, -0.1531679, 2.104359, 0, 0.4313726, 1, 1,
0.2597722, -1.225849, 1.638957, 0, 0.4235294, 1, 1,
0.2600257, 1.721079, 0.04397766, 0, 0.4196078, 1, 1,
0.2650733, 0.2938422, 1.008021, 0, 0.4117647, 1, 1,
0.2663815, -0.6940814, 3.657331, 0, 0.4078431, 1, 1,
0.2671542, -0.0299238, 2.687713, 0, 0.4, 1, 1,
0.267911, 0.5940219, -0.3976116, 0, 0.3921569, 1, 1,
0.2692027, 0.4702044, 1.511665, 0, 0.3882353, 1, 1,
0.2697081, 1.11688, -0.4401245, 0, 0.3803922, 1, 1,
0.2774522, -2.080996, 2.891507, 0, 0.3764706, 1, 1,
0.283946, -1.057271, 1.380482, 0, 0.3686275, 1, 1,
0.2882279, 0.5876716, -0.9763135, 0, 0.3647059, 1, 1,
0.2892124, -0.7479033, 3.477873, 0, 0.3568628, 1, 1,
0.2921854, -0.9946203, 2.629914, 0, 0.3529412, 1, 1,
0.2929273, 0.3377903, 0.4441203, 0, 0.345098, 1, 1,
0.2938559, 0.110486, 1.604192, 0, 0.3411765, 1, 1,
0.2942488, 0.4042206, 0.5075594, 0, 0.3333333, 1, 1,
0.2946214, 1.071061, -0.3396795, 0, 0.3294118, 1, 1,
0.2949838, -0.1573902, 2.179122, 0, 0.3215686, 1, 1,
0.3026828, 0.9438211, 1.044405, 0, 0.3176471, 1, 1,
0.305682, -0.03957815, 1.754498, 0, 0.3098039, 1, 1,
0.3109161, -0.4663628, 4.138161, 0, 0.3058824, 1, 1,
0.3112097, 0.06276295, 0.9894947, 0, 0.2980392, 1, 1,
0.3176602, -0.6968554, 3.353187, 0, 0.2901961, 1, 1,
0.3258628, -0.9847373, 2.945002, 0, 0.2862745, 1, 1,
0.3268412, 1.71987, 2.120556, 0, 0.2784314, 1, 1,
0.3271842, -0.7368794, 2.540766, 0, 0.2745098, 1, 1,
0.3280653, 0.6766658, 1.742717, 0, 0.2666667, 1, 1,
0.3282533, 0.3106821, 1.155621, 0, 0.2627451, 1, 1,
0.3298163, -0.4765903, 2.582554, 0, 0.254902, 1, 1,
0.3333411, -0.8415094, 3.9147, 0, 0.2509804, 1, 1,
0.3406299, 0.9633001, 1.021777, 0, 0.2431373, 1, 1,
0.3407556, 0.3652104, 0.7019806, 0, 0.2392157, 1, 1,
0.3421612, 2.512648, 0.9986045, 0, 0.2313726, 1, 1,
0.3423538, -0.7037992, 2.559231, 0, 0.227451, 1, 1,
0.3427913, 0.3880846, 0.3624232, 0, 0.2196078, 1, 1,
0.3464279, -1.49957, 3.178651, 0, 0.2156863, 1, 1,
0.347176, -0.7953973, 2.426247, 0, 0.2078431, 1, 1,
0.3477225, 0.9690285, -0.340274, 0, 0.2039216, 1, 1,
0.3491432, 0.5325566, 0.896077, 0, 0.1960784, 1, 1,
0.3493609, -0.2132873, 2.746913, 0, 0.1882353, 1, 1,
0.3517382, -0.4582341, 3.671515, 0, 0.1843137, 1, 1,
0.3587028, 2.071362, 0.5467098, 0, 0.1764706, 1, 1,
0.3588596, -1.751061, 2.342028, 0, 0.172549, 1, 1,
0.3593876, -0.1624602, 1.039828, 0, 0.1647059, 1, 1,
0.3632398, -1.827202, 4.280854, 0, 0.1607843, 1, 1,
0.3640347, -1.248663, 4.224649, 0, 0.1529412, 1, 1,
0.3667313, 0.6347911, -0.3414689, 0, 0.1490196, 1, 1,
0.3673776, -0.5617964, 2.105773, 0, 0.1411765, 1, 1,
0.3704741, -1.930571, 3.989561, 0, 0.1372549, 1, 1,
0.3779478, -0.4425826, 0.8670474, 0, 0.1294118, 1, 1,
0.3785926, 0.05072575, -0.6189711, 0, 0.1254902, 1, 1,
0.3790989, 1.263797, -1.06709, 0, 0.1176471, 1, 1,
0.3838409, -0.9895098, 3.083849, 0, 0.1137255, 1, 1,
0.3949602, 0.1600771, 0.8809982, 0, 0.1058824, 1, 1,
0.3955228, 0.04611627, 2.366942, 0, 0.09803922, 1, 1,
0.3967142, 1.328165, -0.965947, 0, 0.09411765, 1, 1,
0.3970464, 0.02565501, 2.625746, 0, 0.08627451, 1, 1,
0.3988926, 0.6517994, 0.3656909, 0, 0.08235294, 1, 1,
0.4030847, 0.6770757, -1.636368, 0, 0.07450981, 1, 1,
0.4046584, -0.3184588, 1.478055, 0, 0.07058824, 1, 1,
0.4125952, 0.04997097, -0.1981071, 0, 0.0627451, 1, 1,
0.4175073, -0.853784, 1.852011, 0, 0.05882353, 1, 1,
0.4202588, -0.01448672, 1.863765, 0, 0.05098039, 1, 1,
0.4209418, 0.5754296, 1.503766, 0, 0.04705882, 1, 1,
0.4212462, 0.4141055, 0.01800146, 0, 0.03921569, 1, 1,
0.42145, 0.4509258, 0.9602822, 0, 0.03529412, 1, 1,
0.4223903, -1.181682, 3.509111, 0, 0.02745098, 1, 1,
0.4250247, -0.3874219, 1.409359, 0, 0.02352941, 1, 1,
0.4307589, 0.9357869, 0.1159637, 0, 0.01568628, 1, 1,
0.4308227, 0.2528767, 1.848895, 0, 0.01176471, 1, 1,
0.4323834, 0.2168278, 0.7598701, 0, 0.003921569, 1, 1,
0.4325069, -0.6030445, 1.238477, 0.003921569, 0, 1, 1,
0.4455574, 0.3367346, 0.6847963, 0.007843138, 0, 1, 1,
0.4477225, 0.9962237, 0.09058237, 0.01568628, 0, 1, 1,
0.447975, -0.262519, 0.9364823, 0.01960784, 0, 1, 1,
0.4523316, 0.4911466, 3.404734, 0.02745098, 0, 1, 1,
0.4563029, -0.6628894, 2.022043, 0.03137255, 0, 1, 1,
0.4655202, 1.451936, -0.4145514, 0.03921569, 0, 1, 1,
0.4681795, 1.023845, -1.202225, 0.04313726, 0, 1, 1,
0.4700583, -0.6596292, 1.687802, 0.05098039, 0, 1, 1,
0.470257, -0.3787009, 3.045086, 0.05490196, 0, 1, 1,
0.4705251, -0.8894756, 2.450561, 0.0627451, 0, 1, 1,
0.4714228, -0.4118666, 2.664445, 0.06666667, 0, 1, 1,
0.472773, 0.1720232, 1.012002, 0.07450981, 0, 1, 1,
0.473649, -0.1159616, 4.102487, 0.07843138, 0, 1, 1,
0.4737366, -1.037119, 3.873549, 0.08627451, 0, 1, 1,
0.4753993, 0.5160588, 1.023088, 0.09019608, 0, 1, 1,
0.4755476, 1.765037, 1.241735, 0.09803922, 0, 1, 1,
0.4787798, 0.9136776, 0.7828285, 0.1058824, 0, 1, 1,
0.4791701, -0.1722231, 1.584569, 0.1098039, 0, 1, 1,
0.4819416, 1.303321, 0.3944141, 0.1176471, 0, 1, 1,
0.4870152, -0.1469162, 1.009623, 0.1215686, 0, 1, 1,
0.4893649, 0.7845702, 1.368958, 0.1294118, 0, 1, 1,
0.4945777, 0.007812185, 2.463055, 0.1333333, 0, 1, 1,
0.4957741, -0.2343112, 3.804467, 0.1411765, 0, 1, 1,
0.5003753, -0.4947453, 3.331795, 0.145098, 0, 1, 1,
0.5037737, 0.133582, 2.480689, 0.1529412, 0, 1, 1,
0.5075809, 0.6797286, 0.9892907, 0.1568628, 0, 1, 1,
0.5148258, -0.2643571, 2.668207, 0.1647059, 0, 1, 1,
0.5183583, -1.833315, 1.340205, 0.1686275, 0, 1, 1,
0.5197736, -0.0272743, 2.11938, 0.1764706, 0, 1, 1,
0.5229238, -0.06516473, -0.08562971, 0.1803922, 0, 1, 1,
0.5254167, 0.8987438, 0.8863569, 0.1882353, 0, 1, 1,
0.5283154, -0.4475249, 1.497366, 0.1921569, 0, 1, 1,
0.5288019, 0.6115495, 2.25065, 0.2, 0, 1, 1,
0.5304384, 0.3271171, 1.448738, 0.2078431, 0, 1, 1,
0.5327987, 1.21671, 1.392947, 0.2117647, 0, 1, 1,
0.5352895, 0.3735685, 0.6768341, 0.2196078, 0, 1, 1,
0.5360005, 0.4353136, 1.822738, 0.2235294, 0, 1, 1,
0.5396621, -0.1097726, 1.214679, 0.2313726, 0, 1, 1,
0.5408403, 0.1487968, 0.9593685, 0.2352941, 0, 1, 1,
0.5435917, -0.01477222, -0.1162614, 0.2431373, 0, 1, 1,
0.5470018, -0.2707427, 1.720694, 0.2470588, 0, 1, 1,
0.5494704, -0.1203041, 2.39831, 0.254902, 0, 1, 1,
0.5522695, 1.126857, -0.9126049, 0.2588235, 0, 1, 1,
0.5557109, 1.249137, 0.2573116, 0.2666667, 0, 1, 1,
0.5581572, -0.3953192, 0.4303912, 0.2705882, 0, 1, 1,
0.5690512, 0.8057128, -2.186551, 0.2784314, 0, 1, 1,
0.5877977, -0.4491706, 2.74979, 0.282353, 0, 1, 1,
0.5900951, -1.219519, 1.723203, 0.2901961, 0, 1, 1,
0.5909659, 0.1251312, 1.635712, 0.2941177, 0, 1, 1,
0.5914235, 0.2170831, 1.134525, 0.3019608, 0, 1, 1,
0.5918625, 0.4387029, 2.372438, 0.3098039, 0, 1, 1,
0.5923985, 0.2567601, 3.734581, 0.3137255, 0, 1, 1,
0.5942885, -0.9538024, 1.337011, 0.3215686, 0, 1, 1,
0.5985427, 0.3697363, 0.6248028, 0.3254902, 0, 1, 1,
0.5993504, 0.1666596, 3.622124, 0.3333333, 0, 1, 1,
0.6004968, 1.011059, -0.8261291, 0.3372549, 0, 1, 1,
0.6051825, 1.175288, 0.09825367, 0.345098, 0, 1, 1,
0.6106482, -1.23217, 1.645634, 0.3490196, 0, 1, 1,
0.6157922, 0.4815188, -1.176305, 0.3568628, 0, 1, 1,
0.616305, 0.1457733, 0.6469837, 0.3607843, 0, 1, 1,
0.6173347, -0.4427752, 3.227486, 0.3686275, 0, 1, 1,
0.6186022, -0.6594892, 2.947142, 0.372549, 0, 1, 1,
0.6206379, 1.542663, 0.7594678, 0.3803922, 0, 1, 1,
0.6346522, 1.265081, 0.1104446, 0.3843137, 0, 1, 1,
0.6396268, -1.057915, 0.9443502, 0.3921569, 0, 1, 1,
0.6403918, -0.3067771, 1.753349, 0.3960784, 0, 1, 1,
0.6443657, 0.392458, 3.148448, 0.4039216, 0, 1, 1,
0.6478541, 2.611526, 1.123131, 0.4117647, 0, 1, 1,
0.6481822, -0.7197527, 2.430299, 0.4156863, 0, 1, 1,
0.6500344, -1.107384, 1.140858, 0.4235294, 0, 1, 1,
0.6541049, 1.198879, 0.1234276, 0.427451, 0, 1, 1,
0.6576937, -0.9326289, 2.050898, 0.4352941, 0, 1, 1,
0.6580665, 0.6238015, -0.05988292, 0.4392157, 0, 1, 1,
0.6582255, -0.1604296, 3.367968, 0.4470588, 0, 1, 1,
0.6596912, 0.09348265, 1.081562, 0.4509804, 0, 1, 1,
0.6693911, -0.1268482, 1.909584, 0.4588235, 0, 1, 1,
0.6745133, -0.4138798, 3.395005, 0.4627451, 0, 1, 1,
0.6761035, -0.01280183, 3.411061, 0.4705882, 0, 1, 1,
0.6765487, 0.8335397, 0.2280613, 0.4745098, 0, 1, 1,
0.6765841, 0.8063436, 2.264551, 0.4823529, 0, 1, 1,
0.6818433, -0.3189798, 2.421501, 0.4862745, 0, 1, 1,
0.6826852, -0.5471968, 3.049722, 0.4941176, 0, 1, 1,
0.6845577, 1.836991, 1.062588, 0.5019608, 0, 1, 1,
0.69045, -0.6914727, 3.058039, 0.5058824, 0, 1, 1,
0.6922297, -0.3215325, 3.360964, 0.5137255, 0, 1, 1,
0.6933149, -0.1870394, 2.302271, 0.5176471, 0, 1, 1,
0.6990241, -2.141815, 3.611145, 0.5254902, 0, 1, 1,
0.6990534, -1.02722, 3.542725, 0.5294118, 0, 1, 1,
0.7009106, 1.770817, 0.2667475, 0.5372549, 0, 1, 1,
0.7041119, -1.679064, 2.882029, 0.5411765, 0, 1, 1,
0.7049929, -0.9738859, 2.836615, 0.5490196, 0, 1, 1,
0.7081657, 2.4314, 0.020927, 0.5529412, 0, 1, 1,
0.714663, -1.480644, 1.76987, 0.5607843, 0, 1, 1,
0.7188189, 0.7979276, -0.6154547, 0.5647059, 0, 1, 1,
0.7226771, 0.8889044, 1.77258, 0.572549, 0, 1, 1,
0.7274389, -0.311604, 2.448351, 0.5764706, 0, 1, 1,
0.7412028, 0.8587261, 0.2979604, 0.5843138, 0, 1, 1,
0.7426814, 0.4885142, 1.812049, 0.5882353, 0, 1, 1,
0.7438762, 1.152972, 1.463542, 0.5960785, 0, 1, 1,
0.7467039, 0.03280995, 2.724511, 0.6039216, 0, 1, 1,
0.7482987, 0.7803492, 3.69753, 0.6078432, 0, 1, 1,
0.7498411, -0.8362735, 2.382402, 0.6156863, 0, 1, 1,
0.7505647, 0.9095294, 0.3377615, 0.6196079, 0, 1, 1,
0.7519495, -0.3648919, 2.301546, 0.627451, 0, 1, 1,
0.7524166, 0.5790237, -0.9639757, 0.6313726, 0, 1, 1,
0.753923, -0.3506143, 2.460517, 0.6392157, 0, 1, 1,
0.7598324, 0.7825887, 1.111356, 0.6431373, 0, 1, 1,
0.7659399, 1.888534, -0.5881613, 0.6509804, 0, 1, 1,
0.7738898, 0.8477635, 0.08042155, 0.654902, 0, 1, 1,
0.7760279, 0.3626235, 2.199888, 0.6627451, 0, 1, 1,
0.7833695, 0.8003345, 0.9471751, 0.6666667, 0, 1, 1,
0.7943621, 1.375246, -0.3047078, 0.6745098, 0, 1, 1,
0.7965912, 1.197477, 0.08571576, 0.6784314, 0, 1, 1,
0.8008903, 0.849679, 1.130549, 0.6862745, 0, 1, 1,
0.8020337, -1.458981, 3.538817, 0.6901961, 0, 1, 1,
0.8028494, 0.3881469, 2.405069, 0.6980392, 0, 1, 1,
0.8062097, -1.296549, 1.523536, 0.7058824, 0, 1, 1,
0.8090823, 1.175975, 2.092863, 0.7098039, 0, 1, 1,
0.8099355, 1.562431, 1.130674, 0.7176471, 0, 1, 1,
0.8106053, 0.2933779, 2.48002, 0.7215686, 0, 1, 1,
0.8110421, -1.25937, 1.547343, 0.7294118, 0, 1, 1,
0.8116111, -2.086373, 2.257298, 0.7333333, 0, 1, 1,
0.8207211, 1.249153, 2.312258, 0.7411765, 0, 1, 1,
0.8227192, -0.73437, 2.265535, 0.7450981, 0, 1, 1,
0.8291916, 1.486019, -0.07736553, 0.7529412, 0, 1, 1,
0.8318341, 1.216345, 0.9621881, 0.7568628, 0, 1, 1,
0.8331108, 0.3918974, 0.6808376, 0.7647059, 0, 1, 1,
0.8340422, 0.6941817, 2.499867, 0.7686275, 0, 1, 1,
0.8342686, -1.204643, 3.553433, 0.7764706, 0, 1, 1,
0.8420556, 1.571734, 1.738412, 0.7803922, 0, 1, 1,
0.8471979, -1.022175, 1.974879, 0.7882353, 0, 1, 1,
0.8473448, 0.1076258, 0.9500037, 0.7921569, 0, 1, 1,
0.8512163, -0.4620312, 3.328125, 0.8, 0, 1, 1,
0.8525718, 0.4511617, -0.009673133, 0.8078431, 0, 1, 1,
0.8579198, -1.768524, 1.74305, 0.8117647, 0, 1, 1,
0.8584194, 1.389197, -1.42673, 0.8196079, 0, 1, 1,
0.8605635, 0.8925394, 0.5519247, 0.8235294, 0, 1, 1,
0.86601, 2.357498, 0.1916022, 0.8313726, 0, 1, 1,
0.8692489, 0.4046762, -0.03323733, 0.8352941, 0, 1, 1,
0.8700334, -0.04745715, 0.5796479, 0.8431373, 0, 1, 1,
0.8743578, -1.013026, 1.989074, 0.8470588, 0, 1, 1,
0.8792511, 0.8731357, 1.165443, 0.854902, 0, 1, 1,
0.8821564, -1.364185, 2.835135, 0.8588235, 0, 1, 1,
0.889504, 1.543581, 2.901975, 0.8666667, 0, 1, 1,
0.8920227, -0.6872039, 0.6086758, 0.8705882, 0, 1, 1,
0.8937828, -0.8889283, 0.9231732, 0.8784314, 0, 1, 1,
0.8957106, 0.9811252, 0.6324474, 0.8823529, 0, 1, 1,
0.8973251, -0.1484241, 1.637833, 0.8901961, 0, 1, 1,
0.9087004, -0.6472788, 2.292341, 0.8941177, 0, 1, 1,
0.9099428, -0.8221234, 0.2453592, 0.9019608, 0, 1, 1,
0.9258507, 3.248492, 0.4602875, 0.9098039, 0, 1, 1,
0.9286618, -0.6677377, 2.47515, 0.9137255, 0, 1, 1,
0.9363146, -0.8296453, 0.5246259, 0.9215686, 0, 1, 1,
0.9436529, 0.4085812, 1.731685, 0.9254902, 0, 1, 1,
0.9512765, 0.7411668, 1.00661, 0.9333333, 0, 1, 1,
0.9515937, -0.16423, 1.230905, 0.9372549, 0, 1, 1,
0.9598321, -0.07423668, 1.141637, 0.945098, 0, 1, 1,
0.9693088, 0.4977294, 0.09722886, 0.9490196, 0, 1, 1,
0.9717413, 2.606802, 0.06428741, 0.9568627, 0, 1, 1,
0.9719463, -0.804068, -0.2134314, 0.9607843, 0, 1, 1,
0.9757686, -0.02570781, 2.06989, 0.9686275, 0, 1, 1,
0.9831309, -0.6046375, 3.004071, 0.972549, 0, 1, 1,
0.9840031, -1.29321, 4.259377, 0.9803922, 0, 1, 1,
0.9911436, -0.08764474, -0.5463727, 0.9843137, 0, 1, 1,
0.9912876, -1.188281, 2.866569, 0.9921569, 0, 1, 1,
0.9983931, -0.6466524, 2.89555, 0.9960784, 0, 1, 1,
0.9991654, 1.396565, 2.492436, 1, 0, 0.9960784, 1,
1.010693, -2.248862, 2.005487, 1, 0, 0.9882353, 1,
1.016312, 0.2103229, 0.8550128, 1, 0, 0.9843137, 1,
1.020757, 0.1041626, 0.1934967, 1, 0, 0.9764706, 1,
1.022625, 0.5441753, 2.001026, 1, 0, 0.972549, 1,
1.028018, 0.3651325, 1.894612, 1, 0, 0.9647059, 1,
1.030517, 0.2112759, 0.1215694, 1, 0, 0.9607843, 1,
1.035927, 1.46718, -1.073875, 1, 0, 0.9529412, 1,
1.037904, 0.6225663, 0.7342197, 1, 0, 0.9490196, 1,
1.051451, 0.7434459, 0.5666732, 1, 0, 0.9411765, 1,
1.055919, -0.7485615, 3.78767, 1, 0, 0.9372549, 1,
1.059276, 0.5380127, 0.8421392, 1, 0, 0.9294118, 1,
1.0599, 0.6725383, 1.781267, 1, 0, 0.9254902, 1,
1.06818, 2.419443, 2.119006, 1, 0, 0.9176471, 1,
1.084313, 1.167977, 0.7096115, 1, 0, 0.9137255, 1,
1.084353, -0.2422861, 4.239182, 1, 0, 0.9058824, 1,
1.090932, 0.7035639, 2.191313, 1, 0, 0.9019608, 1,
1.093762, 0.2099171, 2.236711, 1, 0, 0.8941177, 1,
1.093869, 0.2550756, 0.8936406, 1, 0, 0.8862745, 1,
1.095359, 1.654338, -0.02009919, 1, 0, 0.8823529, 1,
1.09755, -0.760462, 2.353634, 1, 0, 0.8745098, 1,
1.103558, 0.3640089, 1.202823, 1, 0, 0.8705882, 1,
1.106274, -0.423901, 1.546474, 1, 0, 0.8627451, 1,
1.120059, 0.964037, 1.279595, 1, 0, 0.8588235, 1,
1.121377, 1.545331, 0.121246, 1, 0, 0.8509804, 1,
1.123317, -0.9995562, 1.486938, 1, 0, 0.8470588, 1,
1.123789, -0.1118084, 0.7410935, 1, 0, 0.8392157, 1,
1.128148, 1.007001, 1.68918, 1, 0, 0.8352941, 1,
1.134746, 1.588364, 0.8060518, 1, 0, 0.827451, 1,
1.141109, 0.1483883, 2.541763, 1, 0, 0.8235294, 1,
1.143944, 0.8597978, 0.9342777, 1, 0, 0.8156863, 1,
1.151495, 1.369934, -2.136439, 1, 0, 0.8117647, 1,
1.155973, -1.463603, 1.619598, 1, 0, 0.8039216, 1,
1.167503, 1.139188, -0.01352313, 1, 0, 0.7960784, 1,
1.167894, 0.9777815, 0.5721815, 1, 0, 0.7921569, 1,
1.173018, -0.3999112, 1.679739, 1, 0, 0.7843137, 1,
1.179844, -0.6982442, 0.525139, 1, 0, 0.7803922, 1,
1.180412, 0.6562077, -0.5641762, 1, 0, 0.772549, 1,
1.181204, 2.141101, -0.2716257, 1, 0, 0.7686275, 1,
1.18388, 0.3050296, 2.842568, 1, 0, 0.7607843, 1,
1.203193, -1.177561, 2.859666, 1, 0, 0.7568628, 1,
1.20411, 0.1603018, 0.5302466, 1, 0, 0.7490196, 1,
1.223652, -1.097741, 3.613067, 1, 0, 0.7450981, 1,
1.239778, 1.774781, 2.072112, 1, 0, 0.7372549, 1,
1.243485, 0.05199704, 0.3269977, 1, 0, 0.7333333, 1,
1.245256, -0.5854771, 1.751226, 1, 0, 0.7254902, 1,
1.245367, -0.8850433, 2.392042, 1, 0, 0.7215686, 1,
1.258238, 1.035306, 0.1186892, 1, 0, 0.7137255, 1,
1.264957, -0.1050045, 3.079103, 1, 0, 0.7098039, 1,
1.270374, -0.332829, 2.70722, 1, 0, 0.7019608, 1,
1.280301, 1.128893, 1.394623, 1, 0, 0.6941177, 1,
1.291677, -0.1681641, 0.7973812, 1, 0, 0.6901961, 1,
1.300957, -0.312273, -0.3812654, 1, 0, 0.682353, 1,
1.30144, -0.3009619, 1.962979, 1, 0, 0.6784314, 1,
1.304524, 1.08478, -0.003091731, 1, 0, 0.6705883, 1,
1.304724, -0.917802, 2.109047, 1, 0, 0.6666667, 1,
1.30944, -0.3746386, 1.18873, 1, 0, 0.6588235, 1,
1.310455, -0.4158226, 2.45734, 1, 0, 0.654902, 1,
1.312669, 0.0885226, 2.015246, 1, 0, 0.6470588, 1,
1.313055, -1.067003, 1.395819, 1, 0, 0.6431373, 1,
1.313521, 0.406227, 0.1997811, 1, 0, 0.6352941, 1,
1.314935, -0.01157562, 0.3143933, 1, 0, 0.6313726, 1,
1.323479, -0.3003663, 2.114601, 1, 0, 0.6235294, 1,
1.327614, 0.3372532, -0.04976512, 1, 0, 0.6196079, 1,
1.327879, 0.9843193, 2.49472, 1, 0, 0.6117647, 1,
1.332042, 0.0249588, 1.621113, 1, 0, 0.6078432, 1,
1.343, 0.683558, 2.077423, 1, 0, 0.6, 1,
1.344722, 0.1344923, 1.232636, 1, 0, 0.5921569, 1,
1.346739, 1.093339, 0.976712, 1, 0, 0.5882353, 1,
1.353218, 1.043989, -0.6601809, 1, 0, 0.5803922, 1,
1.353815, 0.6406506, 1.938971, 1, 0, 0.5764706, 1,
1.362427, -0.2768842, 2.18672, 1, 0, 0.5686275, 1,
1.363621, 0.390349, -0.9693509, 1, 0, 0.5647059, 1,
1.372269, 0.6931622, 0.6185056, 1, 0, 0.5568628, 1,
1.375034, 1.466548, 0.6389775, 1, 0, 0.5529412, 1,
1.379145, -0.2497256, 0.4278049, 1, 0, 0.5450981, 1,
1.385038, -0.06489071, 2.652771, 1, 0, 0.5411765, 1,
1.387473, -0.4348006, 0.730291, 1, 0, 0.5333334, 1,
1.409912, -0.6093316, 3.274701, 1, 0, 0.5294118, 1,
1.410871, 1.89651, 2.103071, 1, 0, 0.5215687, 1,
1.41359, 1.073884, 2.878473, 1, 0, 0.5176471, 1,
1.437466, -0.2761713, -0.2425261, 1, 0, 0.509804, 1,
1.440518, -0.243613, 1.765503, 1, 0, 0.5058824, 1,
1.442146, -0.9490267, 3.890091, 1, 0, 0.4980392, 1,
1.442649, 1.625652, 0.2002176, 1, 0, 0.4901961, 1,
1.444317, 0.4482985, 0.9320517, 1, 0, 0.4862745, 1,
1.447738, 0.9271216, 1.93672, 1, 0, 0.4784314, 1,
1.45477, 0.08618325, 2.214092, 1, 0, 0.4745098, 1,
1.458589, -2.241282, 1.580097, 1, 0, 0.4666667, 1,
1.463548, -0.6310065, 1.661994, 1, 0, 0.4627451, 1,
1.465194, -1.20744, 2.107379, 1, 0, 0.454902, 1,
1.480775, 0.570602, 1.726605, 1, 0, 0.4509804, 1,
1.489855, -0.8505878, 2.214445, 1, 0, 0.4431373, 1,
1.496168, 0.1852215, 1.558055, 1, 0, 0.4392157, 1,
1.501828, -0.6278393, 1.488349, 1, 0, 0.4313726, 1,
1.518862, -0.8640381, 0.9881692, 1, 0, 0.427451, 1,
1.528046, -0.2508518, -0.3330628, 1, 0, 0.4196078, 1,
1.542771, 0.7598191, 2.570934, 1, 0, 0.4156863, 1,
1.548529, -0.9944321, 3.45785, 1, 0, 0.4078431, 1,
1.548658, 0.5850821, 1.126897, 1, 0, 0.4039216, 1,
1.557207, 1.862338, 1.610498, 1, 0, 0.3960784, 1,
1.564727, -0.4268176, 1.838462, 1, 0, 0.3882353, 1,
1.565876, 0.1758341, 0.2792159, 1, 0, 0.3843137, 1,
1.568997, 0.3308789, 2.775858, 1, 0, 0.3764706, 1,
1.572577, -0.5310197, 4.727824, 1, 0, 0.372549, 1,
1.584321, -0.345402, 2.182084, 1, 0, 0.3647059, 1,
1.584921, 0.1253677, 1.946385, 1, 0, 0.3607843, 1,
1.617978, -0.4931503, 1.977412, 1, 0, 0.3529412, 1,
1.62515, -0.4933871, 1.954073, 1, 0, 0.3490196, 1,
1.631478, -0.3867801, 2.291755, 1, 0, 0.3411765, 1,
1.634559, 0.1255126, 1.919475, 1, 0, 0.3372549, 1,
1.672966, 0.9768386, -0.6087619, 1, 0, 0.3294118, 1,
1.678788, 0.8447263, 2.42952, 1, 0, 0.3254902, 1,
1.682334, 0.552057, 2.436347, 1, 0, 0.3176471, 1,
1.683474, 0.02554451, 2.129866, 1, 0, 0.3137255, 1,
1.689387, -1.416452, 2.424938, 1, 0, 0.3058824, 1,
1.710077, -0.03877526, 2.271293, 1, 0, 0.2980392, 1,
1.71129, 0.09181985, 1.176606, 1, 0, 0.2941177, 1,
1.713979, -0.01948078, 0.0282282, 1, 0, 0.2862745, 1,
1.726659, 0.001983958, 0.7900867, 1, 0, 0.282353, 1,
1.748643, -0.9704103, 3.17899, 1, 0, 0.2745098, 1,
1.75497, 1.326567, 1.564394, 1, 0, 0.2705882, 1,
1.771291, 0.4695188, -1.096271, 1, 0, 0.2627451, 1,
1.781983, -1.142704, 2.047465, 1, 0, 0.2588235, 1,
1.812052, -0.02338262, 1.958083, 1, 0, 0.2509804, 1,
1.823934, 0.6570216, -0.5702527, 1, 0, 0.2470588, 1,
1.86205, -0.9098037, 1.939719, 1, 0, 0.2392157, 1,
1.864514, -0.59192, 2.065945, 1, 0, 0.2352941, 1,
1.871639, 0.5292255, 2.132507, 1, 0, 0.227451, 1,
1.891882, 0.06380963, 0.6702888, 1, 0, 0.2235294, 1,
1.896209, 1.157982, 0.5941622, 1, 0, 0.2156863, 1,
1.968086, 1.391116, 2.212528, 1, 0, 0.2117647, 1,
1.972975, -1.204147, 2.22999, 1, 0, 0.2039216, 1,
1.980882, -1.365291, 1.360425, 1, 0, 0.1960784, 1,
1.983296, 1.461694, -0.2928117, 1, 0, 0.1921569, 1,
1.983384, 0.6695251, 1.493104, 1, 0, 0.1843137, 1,
1.993166, 0.03797467, 3.650505, 1, 0, 0.1803922, 1,
2.012518, 1.438849, 1.197449, 1, 0, 0.172549, 1,
2.014188, -2.032257, 2.031249, 1, 0, 0.1686275, 1,
2.016096, 0.4715152, -0.2643523, 1, 0, 0.1607843, 1,
2.037528, 0.6324922, 1.757262, 1, 0, 0.1568628, 1,
2.060968, 0.2146468, 1.352487, 1, 0, 0.1490196, 1,
2.077693, -1.064818, 2.336253, 1, 0, 0.145098, 1,
2.161189, -0.208134, 0.1704654, 1, 0, 0.1372549, 1,
2.196218, -0.2007494, 2.041893, 1, 0, 0.1333333, 1,
2.216849, -0.08288145, 1.331179, 1, 0, 0.1254902, 1,
2.23964, -1.595623, -0.5180577, 1, 0, 0.1215686, 1,
2.264689, -1.422381, 1.009371, 1, 0, 0.1137255, 1,
2.268833, 1.404917, 1.963841, 1, 0, 0.1098039, 1,
2.274166, 0.8549384, 0.1163845, 1, 0, 0.1019608, 1,
2.292456, -0.06490222, 0.7305991, 1, 0, 0.09411765, 1,
2.344037, -1.481984, 2.084952, 1, 0, 0.09019608, 1,
2.384366, 0.8039736, 1.346889, 1, 0, 0.08235294, 1,
2.480119, 1.774136, 0.3396127, 1, 0, 0.07843138, 1,
2.538251, -0.337001, 1.216031, 1, 0, 0.07058824, 1,
2.585781, 0.3892508, 1.086136, 1, 0, 0.06666667, 1,
2.603455, -1.015053, 2.223321, 1, 0, 0.05882353, 1,
2.63409, -1.452604, 1.983809, 1, 0, 0.05490196, 1,
2.678411, 1.142387, 1.945529, 1, 0, 0.04705882, 1,
2.773305, 0.4971703, 0.5598521, 1, 0, 0.04313726, 1,
2.919731, 1.6208, 2.779763, 1, 0, 0.03529412, 1,
2.932184, -1.138613, 2.776526, 1, 0, 0.03137255, 1,
2.956271, 0.1883705, 2.183328, 1, 0, 0.02352941, 1,
3.041814, -0.05117065, 0.648742, 1, 0, 0.01960784, 1,
3.211689, -0.2692239, -0.429161, 1, 0, 0.01176471, 1,
3.223992, 1.229875, 2.454167, 1, 0, 0.007843138, 1
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
0.04170859, -4.344808, -8.101774, 0, -0.5, 0.5, 0.5,
0.04170859, -4.344808, -8.101774, 1, -0.5, 0.5, 0.5,
0.04170859, -4.344808, -8.101774, 1, 1.5, 0.5, 0.5,
0.04170859, -4.344808, -8.101774, 0, 1.5, 0.5, 0.5
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
-4.219369, 0.002104759, -8.101774, 0, -0.5, 0.5, 0.5,
-4.219369, 0.002104759, -8.101774, 1, -0.5, 0.5, 0.5,
-4.219369, 0.002104759, -8.101774, 1, 1.5, 0.5, 0.5,
-4.219369, 0.002104759, -8.101774, 0, 1.5, 0.5, 0.5
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
-4.219369, -4.344808, -0.6808162, 0, -0.5, 0.5, 0.5,
-4.219369, -4.344808, -0.6808162, 1, -0.5, 0.5, 0.5,
-4.219369, -4.344808, -0.6808162, 1, 1.5, 0.5, 0.5,
-4.219369, -4.344808, -0.6808162, 0, 1.5, 0.5, 0.5
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
-3, -3.341674, -6.389246,
3, -3.341674, -6.389246,
-3, -3.341674, -6.389246,
-3, -3.508863, -6.674667,
-2, -3.341674, -6.389246,
-2, -3.508863, -6.674667,
-1, -3.341674, -6.389246,
-1, -3.508863, -6.674667,
0, -3.341674, -6.389246,
0, -3.508863, -6.674667,
1, -3.341674, -6.389246,
1, -3.508863, -6.674667,
2, -3.341674, -6.389246,
2, -3.508863, -6.674667,
3, -3.341674, -6.389246,
3, -3.508863, -6.674667
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
-3, -3.843241, -7.24551, 0, -0.5, 0.5, 0.5,
-3, -3.843241, -7.24551, 1, -0.5, 0.5, 0.5,
-3, -3.843241, -7.24551, 1, 1.5, 0.5, 0.5,
-3, -3.843241, -7.24551, 0, 1.5, 0.5, 0.5,
-2, -3.843241, -7.24551, 0, -0.5, 0.5, 0.5,
-2, -3.843241, -7.24551, 1, -0.5, 0.5, 0.5,
-2, -3.843241, -7.24551, 1, 1.5, 0.5, 0.5,
-2, -3.843241, -7.24551, 0, 1.5, 0.5, 0.5,
-1, -3.843241, -7.24551, 0, -0.5, 0.5, 0.5,
-1, -3.843241, -7.24551, 1, -0.5, 0.5, 0.5,
-1, -3.843241, -7.24551, 1, 1.5, 0.5, 0.5,
-1, -3.843241, -7.24551, 0, 1.5, 0.5, 0.5,
0, -3.843241, -7.24551, 0, -0.5, 0.5, 0.5,
0, -3.843241, -7.24551, 1, -0.5, 0.5, 0.5,
0, -3.843241, -7.24551, 1, 1.5, 0.5, 0.5,
0, -3.843241, -7.24551, 0, 1.5, 0.5, 0.5,
1, -3.843241, -7.24551, 0, -0.5, 0.5, 0.5,
1, -3.843241, -7.24551, 1, -0.5, 0.5, 0.5,
1, -3.843241, -7.24551, 1, 1.5, 0.5, 0.5,
1, -3.843241, -7.24551, 0, 1.5, 0.5, 0.5,
2, -3.843241, -7.24551, 0, -0.5, 0.5, 0.5,
2, -3.843241, -7.24551, 1, -0.5, 0.5, 0.5,
2, -3.843241, -7.24551, 1, 1.5, 0.5, 0.5,
2, -3.843241, -7.24551, 0, 1.5, 0.5, 0.5,
3, -3.843241, -7.24551, 0, -0.5, 0.5, 0.5,
3, -3.843241, -7.24551, 1, -0.5, 0.5, 0.5,
3, -3.843241, -7.24551, 1, 1.5, 0.5, 0.5,
3, -3.843241, -7.24551, 0, 1.5, 0.5, 0.5
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
-3.236044, -3, -6.389246,
-3.236044, 3, -6.389246,
-3.236044, -3, -6.389246,
-3.399931, -3, -6.674667,
-3.236044, -2, -6.389246,
-3.399931, -2, -6.674667,
-3.236044, -1, -6.389246,
-3.399931, -1, -6.674667,
-3.236044, 0, -6.389246,
-3.399931, 0, -6.674667,
-3.236044, 1, -6.389246,
-3.399931, 1, -6.674667,
-3.236044, 2, -6.389246,
-3.399931, 2, -6.674667,
-3.236044, 3, -6.389246,
-3.399931, 3, -6.674667
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
"2",
"3"
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
-3.727706, -3, -7.24551, 0, -0.5, 0.5, 0.5,
-3.727706, -3, -7.24551, 1, -0.5, 0.5, 0.5,
-3.727706, -3, -7.24551, 1, 1.5, 0.5, 0.5,
-3.727706, -3, -7.24551, 0, 1.5, 0.5, 0.5,
-3.727706, -2, -7.24551, 0, -0.5, 0.5, 0.5,
-3.727706, -2, -7.24551, 1, -0.5, 0.5, 0.5,
-3.727706, -2, -7.24551, 1, 1.5, 0.5, 0.5,
-3.727706, -2, -7.24551, 0, 1.5, 0.5, 0.5,
-3.727706, -1, -7.24551, 0, -0.5, 0.5, 0.5,
-3.727706, -1, -7.24551, 1, -0.5, 0.5, 0.5,
-3.727706, -1, -7.24551, 1, 1.5, 0.5, 0.5,
-3.727706, -1, -7.24551, 0, 1.5, 0.5, 0.5,
-3.727706, 0, -7.24551, 0, -0.5, 0.5, 0.5,
-3.727706, 0, -7.24551, 1, -0.5, 0.5, 0.5,
-3.727706, 0, -7.24551, 1, 1.5, 0.5, 0.5,
-3.727706, 0, -7.24551, 0, 1.5, 0.5, 0.5,
-3.727706, 1, -7.24551, 0, -0.5, 0.5, 0.5,
-3.727706, 1, -7.24551, 1, -0.5, 0.5, 0.5,
-3.727706, 1, -7.24551, 1, 1.5, 0.5, 0.5,
-3.727706, 1, -7.24551, 0, 1.5, 0.5, 0.5,
-3.727706, 2, -7.24551, 0, -0.5, 0.5, 0.5,
-3.727706, 2, -7.24551, 1, -0.5, 0.5, 0.5,
-3.727706, 2, -7.24551, 1, 1.5, 0.5, 0.5,
-3.727706, 2, -7.24551, 0, 1.5, 0.5, 0.5,
-3.727706, 3, -7.24551, 0, -0.5, 0.5, 0.5,
-3.727706, 3, -7.24551, 1, -0.5, 0.5, 0.5,
-3.727706, 3, -7.24551, 1, 1.5, 0.5, 0.5,
-3.727706, 3, -7.24551, 0, 1.5, 0.5, 0.5
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
-3.236044, -3.341674, -6,
-3.236044, -3.341674, 4,
-3.236044, -3.341674, -6,
-3.399931, -3.508863, -6,
-3.236044, -3.341674, -4,
-3.399931, -3.508863, -4,
-3.236044, -3.341674, -2,
-3.399931, -3.508863, -2,
-3.236044, -3.341674, 0,
-3.399931, -3.508863, 0,
-3.236044, -3.341674, 2,
-3.399931, -3.508863, 2,
-3.236044, -3.341674, 4,
-3.399931, -3.508863, 4
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
"-6",
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
-3.727706, -3.843241, -6, 0, -0.5, 0.5, 0.5,
-3.727706, -3.843241, -6, 1, -0.5, 0.5, 0.5,
-3.727706, -3.843241, -6, 1, 1.5, 0.5, 0.5,
-3.727706, -3.843241, -6, 0, 1.5, 0.5, 0.5,
-3.727706, -3.843241, -4, 0, -0.5, 0.5, 0.5,
-3.727706, -3.843241, -4, 1, -0.5, 0.5, 0.5,
-3.727706, -3.843241, -4, 1, 1.5, 0.5, 0.5,
-3.727706, -3.843241, -4, 0, 1.5, 0.5, 0.5,
-3.727706, -3.843241, -2, 0, -0.5, 0.5, 0.5,
-3.727706, -3.843241, -2, 1, -0.5, 0.5, 0.5,
-3.727706, -3.843241, -2, 1, 1.5, 0.5, 0.5,
-3.727706, -3.843241, -2, 0, 1.5, 0.5, 0.5,
-3.727706, -3.843241, 0, 0, -0.5, 0.5, 0.5,
-3.727706, -3.843241, 0, 1, -0.5, 0.5, 0.5,
-3.727706, -3.843241, 0, 1, 1.5, 0.5, 0.5,
-3.727706, -3.843241, 0, 0, 1.5, 0.5, 0.5,
-3.727706, -3.843241, 2, 0, -0.5, 0.5, 0.5,
-3.727706, -3.843241, 2, 1, -0.5, 0.5, 0.5,
-3.727706, -3.843241, 2, 1, 1.5, 0.5, 0.5,
-3.727706, -3.843241, 2, 0, 1.5, 0.5, 0.5,
-3.727706, -3.843241, 4, 0, -0.5, 0.5, 0.5,
-3.727706, -3.843241, 4, 1, -0.5, 0.5, 0.5,
-3.727706, -3.843241, 4, 1, 1.5, 0.5, 0.5,
-3.727706, -3.843241, 4, 0, 1.5, 0.5, 0.5
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
-3.236044, -3.341674, -6.389246,
-3.236044, 3.345884, -6.389246,
-3.236044, -3.341674, 5.027613,
-3.236044, 3.345884, 5.027613,
-3.236044, -3.341674, -6.389246,
-3.236044, -3.341674, 5.027613,
-3.236044, 3.345884, -6.389246,
-3.236044, 3.345884, 5.027613,
-3.236044, -3.341674, -6.389246,
3.319461, -3.341674, -6.389246,
-3.236044, -3.341674, 5.027613,
3.319461, -3.341674, 5.027613,
-3.236044, 3.345884, -6.389246,
3.319461, 3.345884, -6.389246,
-3.236044, 3.345884, 5.027613,
3.319461, 3.345884, 5.027613,
3.319461, -3.341674, -6.389246,
3.319461, 3.345884, -6.389246,
3.319461, -3.341674, 5.027613,
3.319461, 3.345884, 5.027613,
3.319461, -3.341674, -6.389246,
3.319461, -3.341674, 5.027613,
3.319461, 3.345884, -6.389246,
3.319461, 3.345884, 5.027613
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
var radius = 7.884901;
var distance = 35.08081;
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
mvMatrix.translate( -0.04170859, -0.002104759, 0.6808162 );
mvMatrix.scale( 1.300481, 1.274802, 0.7467299 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.08081);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Nitenpyram<-read.table("Nitenpyram.xyz")
```

```
## Error in read.table("Nitenpyram.xyz"): no lines available in input
```

```r
x<-Nitenpyram$V2
```

```
## Error in eval(expr, envir, enclos): object 'Nitenpyram' not found
```

```r
y<-Nitenpyram$V3
```

```
## Error in eval(expr, envir, enclos): object 'Nitenpyram' not found
```

```r
z<-Nitenpyram$V4
```

```
## Error in eval(expr, envir, enclos): object 'Nitenpyram' not found
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
-3.140575, -1.57036, -3.072115, 0, 0, 1, 1, 1,
-3.044697, 1.021593, -1.690037, 1, 0, 0, 1, 1,
-2.855098, 1.621179, -1.274554, 1, 0, 0, 1, 1,
-2.761465, -0.702352, -3.414299, 1, 0, 0, 1, 1,
-2.760765, -0.2325913, -3.397209, 1, 0, 0, 1, 1,
-2.634585, -1.53698, -2.845659, 1, 0, 0, 1, 1,
-2.581971, -0.5103639, -2.505712, 0, 0, 0, 1, 1,
-2.512336, -0.4397043, -1.460945, 0, 0, 0, 1, 1,
-2.366448, -0.9861556, -2.316646, 0, 0, 0, 1, 1,
-2.358911, 0.3163657, 0.6514128, 0, 0, 0, 1, 1,
-2.28866, 0.1235918, -2.073987, 0, 0, 0, 1, 1,
-2.253549, 1.244215, -0.4790113, 0, 0, 0, 1, 1,
-2.224231, 0.5332113, 0.8600352, 0, 0, 0, 1, 1,
-2.215063, -0.7978986, -2.259658, 1, 1, 1, 1, 1,
-2.158682, -0.5829414, -1.119232, 1, 1, 1, 1, 1,
-2.129599, 0.2283033, -1.515951, 1, 1, 1, 1, 1,
-2.084803, -0.8774939, -2.776563, 1, 1, 1, 1, 1,
-2.065401, 0.104265, -1.915637, 1, 1, 1, 1, 1,
-2.059351, 0.2143291, -0.585385, 1, 1, 1, 1, 1,
-2.007368, 0.4931101, -0.4949947, 1, 1, 1, 1, 1,
-2.007067, 1.046651, -2.213795, 1, 1, 1, 1, 1,
-2.006005, -1.043168, -2.824735, 1, 1, 1, 1, 1,
-1.982005, 0.8539438, -2.180859, 1, 1, 1, 1, 1,
-1.962858, -1.325021, -2.070275, 1, 1, 1, 1, 1,
-1.935936, 0.757872, -2.68708, 1, 1, 1, 1, 1,
-1.89524, 0.5763726, -0.8708216, 1, 1, 1, 1, 1,
-1.887747, 0.9557939, -2.738434, 1, 1, 1, 1, 1,
-1.887332, 0.178713, -2.242403, 1, 1, 1, 1, 1,
-1.865413, 0.8976038, -2.276326, 0, 0, 1, 1, 1,
-1.861561, -0.3005033, -1.383601, 1, 0, 0, 1, 1,
-1.843962, -0.6253204, -2.96953, 1, 0, 0, 1, 1,
-1.828326, -0.6440669, -2.584482, 1, 0, 0, 1, 1,
-1.798333, -0.1681108, -2.467531, 1, 0, 0, 1, 1,
-1.794752, 0.8023346, -0.9471272, 1, 0, 0, 1, 1,
-1.781363, 0.8911079, -1.053861, 0, 0, 0, 1, 1,
-1.771047, 0.298524, -1.084372, 0, 0, 0, 1, 1,
-1.767893, 1.204859, -1.937249, 0, 0, 0, 1, 1,
-1.721833, 0.9856296, -0.7398007, 0, 0, 0, 1, 1,
-1.68876, 0.4609488, -0.9424353, 0, 0, 0, 1, 1,
-1.685283, 1.921013, 1.11171, 0, 0, 0, 1, 1,
-1.6759, -0.3556709, -0.556102, 0, 0, 0, 1, 1,
-1.66198, -1.976623, -1.897779, 1, 1, 1, 1, 1,
-1.661202, -0.4675263, -1.529779, 1, 1, 1, 1, 1,
-1.645288, 0.9954683, -0.5314622, 1, 1, 1, 1, 1,
-1.64013, -0.09524214, -0.9053946, 1, 1, 1, 1, 1,
-1.635666, -0.7433244, -1.828175, 1, 1, 1, 1, 1,
-1.635529, -0.7733004, -3.450036, 1, 1, 1, 1, 1,
-1.63237, -0.4729475, -2.853303, 1, 1, 1, 1, 1,
-1.623332, -1.753995, -3.069978, 1, 1, 1, 1, 1,
-1.605557, 0.621523, -0.1264678, 1, 1, 1, 1, 1,
-1.604398, -0.9088598, -1.520801, 1, 1, 1, 1, 1,
-1.603427, -0.3970615, -0.5912767, 1, 1, 1, 1, 1,
-1.587041, -0.6840612, -1.797222, 1, 1, 1, 1, 1,
-1.581244, 1.175386, 0.6567357, 1, 1, 1, 1, 1,
-1.569909, 2.382939, -0.9040953, 1, 1, 1, 1, 1,
-1.566616, -0.4698589, -2.416358, 1, 1, 1, 1, 1,
-1.566566, -0.1419913, -2.291023, 0, 0, 1, 1, 1,
-1.55944, 0.1801623, -2.60731, 1, 0, 0, 1, 1,
-1.557983, 2.584969, -1.75148, 1, 0, 0, 1, 1,
-1.557082, -0.4044748, -2.487047, 1, 0, 0, 1, 1,
-1.556061, -0.3194528, -2.542934, 1, 0, 0, 1, 1,
-1.539057, 1.268897, 0.2797951, 1, 0, 0, 1, 1,
-1.532949, 0.3750142, -2.344886, 0, 0, 0, 1, 1,
-1.530906, 0.7931387, 0.2425629, 0, 0, 0, 1, 1,
-1.513239, -0.02999799, -1.866327, 0, 0, 0, 1, 1,
-1.504678, -1.529457, -1.881045, 0, 0, 0, 1, 1,
-1.503348, 0.006564974, -0.2738928, 0, 0, 0, 1, 1,
-1.483656, 0.005785653, -1.539813, 0, 0, 0, 1, 1,
-1.471449, -1.576366, -2.54803, 0, 0, 0, 1, 1,
-1.468132, 0.123489, 0.09547835, 1, 1, 1, 1, 1,
-1.458458, -0.7466157, -1.095782, 1, 1, 1, 1, 1,
-1.456555, 1.70535, -0.4140114, 1, 1, 1, 1, 1,
-1.45143, 0.8345203, -0.3213302, 1, 1, 1, 1, 1,
-1.447691, -0.5750868, -2.461076, 1, 1, 1, 1, 1,
-1.446879, -1.120019, -2.485631, 1, 1, 1, 1, 1,
-1.441808, 1.148798, -3.719781, 1, 1, 1, 1, 1,
-1.439697, 0.2524494, -0.6336491, 1, 1, 1, 1, 1,
-1.423787, -0.398264, -2.987543, 1, 1, 1, 1, 1,
-1.422632, -0.7741202, -2.155594, 1, 1, 1, 1, 1,
-1.421278, 0.2474406, -2.041709, 1, 1, 1, 1, 1,
-1.4065, -2.671656, -2.73315, 1, 1, 1, 1, 1,
-1.401159, 0.2765939, -3.133901, 1, 1, 1, 1, 1,
-1.390681, -0.3996759, -0.2873219, 1, 1, 1, 1, 1,
-1.389904, -2.55139, -2.462584, 1, 1, 1, 1, 1,
-1.373677, 0.4881948, -0.2540336, 0, 0, 1, 1, 1,
-1.36667, -0.120784, -1.120579, 1, 0, 0, 1, 1,
-1.366617, -0.3379495, -1.086933, 1, 0, 0, 1, 1,
-1.352527, -0.3355255, 0.9717562, 1, 0, 0, 1, 1,
-1.352355, -0.2608423, -3.432853, 1, 0, 0, 1, 1,
-1.35196, 0.7226564, -1.461505, 1, 0, 0, 1, 1,
-1.34782, -0.4263138, -0.2087081, 0, 0, 0, 1, 1,
-1.347759, -0.5879322, -0.9241967, 0, 0, 0, 1, 1,
-1.343619, -0.3579561, -2.29878, 0, 0, 0, 1, 1,
-1.334117, -1.768041, -3.080737, 0, 0, 0, 1, 1,
-1.327827, 0.6102147, -0.276073, 0, 0, 0, 1, 1,
-1.327271, 0.1219721, -1.961108, 0, 0, 0, 1, 1,
-1.323636, 0.3356552, -2.271486, 0, 0, 0, 1, 1,
-1.320735, -0.1874132, -0.8643717, 1, 1, 1, 1, 1,
-1.314733, -1.597124, -3.317688, 1, 1, 1, 1, 1,
-1.314589, 0.8757142, -1.109849, 1, 1, 1, 1, 1,
-1.293795, -0.1497379, -1.344445, 1, 1, 1, 1, 1,
-1.287884, 0.2620222, -2.610823, 1, 1, 1, 1, 1,
-1.278219, -0.2694673, -2.635787, 1, 1, 1, 1, 1,
-1.268761, -0.01616351, -3.233342, 1, 1, 1, 1, 1,
-1.267734, 0.9948272, -1.057984, 1, 1, 1, 1, 1,
-1.261531, -0.08730184, -1.926485, 1, 1, 1, 1, 1,
-1.249887, -2.000017, -2.74766, 1, 1, 1, 1, 1,
-1.249606, 2.180667, 0.0567503, 1, 1, 1, 1, 1,
-1.248366, -0.5943839, -3.149659, 1, 1, 1, 1, 1,
-1.234276, -0.5687988, -0.8913134, 1, 1, 1, 1, 1,
-1.23256, 1.223882, -0.02899591, 1, 1, 1, 1, 1,
-1.23182, -0.309765, -1.237076, 1, 1, 1, 1, 1,
-1.228935, 0.3605591, -0.721857, 0, 0, 1, 1, 1,
-1.226368, -0.5528395, -1.197746, 1, 0, 0, 1, 1,
-1.225262, -0.9324204, -0.9454324, 1, 0, 0, 1, 1,
-1.218487, 0.08582185, 0.7770047, 1, 0, 0, 1, 1,
-1.212844, -0.3598555, -2.888273, 1, 0, 0, 1, 1,
-1.209978, 1.27758, 0.1480887, 1, 0, 0, 1, 1,
-1.206836, -0.3654289, -1.810562, 0, 0, 0, 1, 1,
-1.193809, 0.8666905, -0.4985965, 0, 0, 0, 1, 1,
-1.187162, 0.7071115, -1.675613, 0, 0, 0, 1, 1,
-1.185958, -1.263378, -2.489151, 0, 0, 0, 1, 1,
-1.174611, 0.2217162, -1.252679, 0, 0, 0, 1, 1,
-1.169431, 0.6952586, 0.2164413, 0, 0, 0, 1, 1,
-1.162768, -0.3707202, -2.592243, 0, 0, 0, 1, 1,
-1.161356, -0.2467753, -1.515414, 1, 1, 1, 1, 1,
-1.154142, 0.4252355, -2.141075, 1, 1, 1, 1, 1,
-1.153874, 0.1391405, -1.234997, 1, 1, 1, 1, 1,
-1.151342, 2.53031, -0.7420142, 1, 1, 1, 1, 1,
-1.141184, -0.6888794, -2.194238, 1, 1, 1, 1, 1,
-1.140159, -0.5782626, -2.888696, 1, 1, 1, 1, 1,
-1.132898, -1.20336, -2.707865, 1, 1, 1, 1, 1,
-1.131851, -1.518885, -3.450026, 1, 1, 1, 1, 1,
-1.130613, -0.6433815, -2.553165, 1, 1, 1, 1, 1,
-1.125361, 0.5626163, 0.1145741, 1, 1, 1, 1, 1,
-1.122326, -1.622518, -3.644861, 1, 1, 1, 1, 1,
-1.117058, 0.9543361, -1.863614, 1, 1, 1, 1, 1,
-1.102728, -0.4873596, -4.89519, 1, 1, 1, 1, 1,
-1.099097, 1.733304, 1.022264, 1, 1, 1, 1, 1,
-1.097031, 0.7597272, -1.911367, 1, 1, 1, 1, 1,
-1.095601, -0.6540011, -2.279855, 0, 0, 1, 1, 1,
-1.093432, 1.277879, 0.8686073, 1, 0, 0, 1, 1,
-1.076375, 1.456838, -0.6051496, 1, 0, 0, 1, 1,
-1.074361, 1.605994, 1.802319, 1, 0, 0, 1, 1,
-1.062357, 1.365379, -1.813732, 1, 0, 0, 1, 1,
-1.056018, 0.8217278, -1.092244, 1, 0, 0, 1, 1,
-1.055183, -1.051841, -3.061362, 0, 0, 0, 1, 1,
-1.047494, -1.246503, -1.191007, 0, 0, 0, 1, 1,
-1.046078, 1.702686, -1.559056, 0, 0, 0, 1, 1,
-1.040077, 1.269861, 0.5899321, 0, 0, 0, 1, 1,
-1.035455, 1.111964, -1.59037, 0, 0, 0, 1, 1,
-1.03313, -0.2988621, -2.338104, 0, 0, 0, 1, 1,
-1.029299, 0.2059413, -1.603039, 0, 0, 0, 1, 1,
-1.028059, -0.4592498, -2.036326, 1, 1, 1, 1, 1,
-1.027293, 1.349154, -1.570343, 1, 1, 1, 1, 1,
-1.016272, -0.04485941, 1.978932, 1, 1, 1, 1, 1,
-1.016141, -0.06794461, -1.997117, 1, 1, 1, 1, 1,
-1.013611, -0.05662854, -0.3083374, 1, 1, 1, 1, 1,
-1.009641, 0.3566738, -1.898126, 1, 1, 1, 1, 1,
-1.007058, -1.893318, -3.439825, 1, 1, 1, 1, 1,
-1.006971, -0.3255148, -1.145074, 1, 1, 1, 1, 1,
-1.002978, -0.5060508, -2.230681, 1, 1, 1, 1, 1,
-1.002366, 2.273543, -0.1126123, 1, 1, 1, 1, 1,
-0.9981468, 0.4783472, -0.4934509, 1, 1, 1, 1, 1,
-0.9970581, -0.3135822, -1.567057, 1, 1, 1, 1, 1,
-0.995742, 0.6971112, -1.553217, 1, 1, 1, 1, 1,
-0.9872393, -0.4568685, -1.943637, 1, 1, 1, 1, 1,
-0.9785379, -0.02482603, -2.021067, 1, 1, 1, 1, 1,
-0.9723053, 0.1248412, -2.038954, 0, 0, 1, 1, 1,
-0.9582738, -1.899325, -3.268785, 1, 0, 0, 1, 1,
-0.9567897, 0.2773466, -2.283614, 1, 0, 0, 1, 1,
-0.9544377, 1.108166, 1.293468, 1, 0, 0, 1, 1,
-0.9483782, 0.9974446, -1.421111, 1, 0, 0, 1, 1,
-0.9466689, -0.8321313, -2.703295, 1, 0, 0, 1, 1,
-0.9430009, -0.1081858, -0.4531252, 0, 0, 0, 1, 1,
-0.9299361, -0.7623527, -3.108517, 0, 0, 0, 1, 1,
-0.927132, -1.02086, -3.810611, 0, 0, 0, 1, 1,
-0.923702, 0.0984515, -1.915478, 0, 0, 0, 1, 1,
-0.9126133, 0.09198807, -2.927807, 0, 0, 0, 1, 1,
-0.9122903, 0.6497213, -0.6175821, 0, 0, 0, 1, 1,
-0.9113743, 0.5376336, -0.5465573, 0, 0, 0, 1, 1,
-0.9108382, 0.7903638, -1.107343, 1, 1, 1, 1, 1,
-0.907312, 1.379748, 0.6087388, 1, 1, 1, 1, 1,
-0.9033754, 0.3713042, -0.978821, 1, 1, 1, 1, 1,
-0.9030526, 0.3907848, -1.817715, 1, 1, 1, 1, 1,
-0.8981295, 1.487564, 0.6690024, 1, 1, 1, 1, 1,
-0.8952996, 0.03946362, -3.605684, 1, 1, 1, 1, 1,
-0.892812, -0.05739982, -0.3151032, 1, 1, 1, 1, 1,
-0.8897588, 0.8478951, -1.118311, 1, 1, 1, 1, 1,
-0.8867623, 0.2207675, -0.6570878, 1, 1, 1, 1, 1,
-0.8827277, 2.175117, -0.6887843, 1, 1, 1, 1, 1,
-0.8807087, 2.714207, -0.2324561, 1, 1, 1, 1, 1,
-0.8789459, 0.9467163, -0.4512213, 1, 1, 1, 1, 1,
-0.8769373, 1.860596, -0.4891463, 1, 1, 1, 1, 1,
-0.8680662, 0.7805763, -2.391963, 1, 1, 1, 1, 1,
-0.8658286, -0.3527468, -1.97825, 1, 1, 1, 1, 1,
-0.865388, 1.607346, 0.401304, 0, 0, 1, 1, 1,
-0.8634876, 1.604845, -1.624255, 1, 0, 0, 1, 1,
-0.8560749, -0.8388013, -1.350347, 1, 0, 0, 1, 1,
-0.8526055, -0.5422152, -2.147027, 1, 0, 0, 1, 1,
-0.8467147, 1.320378, 0.452167, 1, 0, 0, 1, 1,
-0.8451806, 0.04355725, -1.218586, 1, 0, 0, 1, 1,
-0.8434827, 0.8714211, -2.246405, 0, 0, 0, 1, 1,
-0.8401673, -0.009631211, -1.223384, 0, 0, 0, 1, 1,
-0.8392953, 0.119505, -2.920635, 0, 0, 0, 1, 1,
-0.8378178, -0.05776891, -1.300791, 0, 0, 0, 1, 1,
-0.8376269, 0.9098859, 0.2721907, 0, 0, 0, 1, 1,
-0.8348927, 0.2159213, -2.018868, 0, 0, 0, 1, 1,
-0.8322932, 0.1308895, -2.949192, 0, 0, 0, 1, 1,
-0.8316255, 0.3246056, -2.861905, 1, 1, 1, 1, 1,
-0.8300222, -2.390035, -3.265093, 1, 1, 1, 1, 1,
-0.8274817, 1.38162, -2.8004, 1, 1, 1, 1, 1,
-0.8201119, 0.03102192, -1.877078, 1, 1, 1, 1, 1,
-0.8193614, -1.266764, -2.996147, 1, 1, 1, 1, 1,
-0.8143488, 0.379748, -1.110722, 1, 1, 1, 1, 1,
-0.8099011, -1.185721, -0.2120516, 1, 1, 1, 1, 1,
-0.8098708, 0.1107718, -1.852084, 1, 1, 1, 1, 1,
-0.8064135, 0.1734048, -0.4728934, 1, 1, 1, 1, 1,
-0.8053882, 2.473392, -0.6390878, 1, 1, 1, 1, 1,
-0.8044132, -0.6652594, -1.797747, 1, 1, 1, 1, 1,
-0.8019856, 1.565099, -1.244892, 1, 1, 1, 1, 1,
-0.8016539, 0.3275926, -1.043117, 1, 1, 1, 1, 1,
-0.8009487, -0.5577425, -2.206506, 1, 1, 1, 1, 1,
-0.7952073, -1.354658, -4.158443, 1, 1, 1, 1, 1,
-0.791808, 0.476472, -2.052993, 0, 0, 1, 1, 1,
-0.7759168, 1.238925, -0.3897848, 1, 0, 0, 1, 1,
-0.7717521, -0.9474581, -2.391662, 1, 0, 0, 1, 1,
-0.7694482, -0.1678462, -1.618481, 1, 0, 0, 1, 1,
-0.7640014, -0.04374455, -0.8626835, 1, 0, 0, 1, 1,
-0.760121, -2.298843, -1.383324, 1, 0, 0, 1, 1,
-0.7584251, -0.5294215, -2.302748, 0, 0, 0, 1, 1,
-0.7573251, 0.4972422, -2.268764, 0, 0, 0, 1, 1,
-0.7548325, -0.703945, -2.702896, 0, 0, 0, 1, 1,
-0.7540352, 0.2823878, 0.05992875, 0, 0, 0, 1, 1,
-0.7534415, 1.659776, -1.116578, 0, 0, 0, 1, 1,
-0.7520999, -0.6122719, -1.33559, 0, 0, 0, 1, 1,
-0.7519, 1.077935, -1.617592, 0, 0, 0, 1, 1,
-0.7503188, 0.6118968, -1.292129, 1, 1, 1, 1, 1,
-0.7432802, 1.813326, -1.674195, 1, 1, 1, 1, 1,
-0.7428166, -0.2199332, -1.843333, 1, 1, 1, 1, 1,
-0.7391831, 0.1354767, -1.647417, 1, 1, 1, 1, 1,
-0.7362124, 1.1332, -0.363218, 1, 1, 1, 1, 1,
-0.7328615, -0.1670573, 0.2897421, 1, 1, 1, 1, 1,
-0.7321876, 0.5133985, -0.9236765, 1, 1, 1, 1, 1,
-0.7321545, -1.318376, -3.223787, 1, 1, 1, 1, 1,
-0.7274975, -0.1716484, -1.954413, 1, 1, 1, 1, 1,
-0.727497, -0.5510399, -1.906082, 1, 1, 1, 1, 1,
-0.7208022, 1.158893, -0.5487701, 1, 1, 1, 1, 1,
-0.7123247, -1.796614, -4.021343, 1, 1, 1, 1, 1,
-0.7108656, 1.894971, 0.8554043, 1, 1, 1, 1, 1,
-0.7105821, -0.8310229, -4.462708, 1, 1, 1, 1, 1,
-0.7092451, -0.02738207, -2.827189, 1, 1, 1, 1, 1,
-0.7026321, -0.01187667, -1.155934, 0, 0, 1, 1, 1,
-0.701245, 0.4040118, -2.695186, 1, 0, 0, 1, 1,
-0.7005919, -0.1341395, 0.08569121, 1, 0, 0, 1, 1,
-0.7001113, 0.3877208, -0.7347422, 1, 0, 0, 1, 1,
-0.6999576, -0.6489851, -2.376385, 1, 0, 0, 1, 1,
-0.6998908, 1.351012, -1.041268, 1, 0, 0, 1, 1,
-0.6838047, -2.099186, -4.364133, 0, 0, 0, 1, 1,
-0.6836714, 0.8600578, -1.023754, 0, 0, 0, 1, 1,
-0.6825958, 1.138759, -1.535853, 0, 0, 0, 1, 1,
-0.678143, -0.1774823, -2.09798, 0, 0, 0, 1, 1,
-0.6726704, 1.085732, -0.1113391, 0, 0, 0, 1, 1,
-0.6685244, 1.383194, -0.9852509, 0, 0, 0, 1, 1,
-0.668318, 0.472295, -1.782787, 0, 0, 0, 1, 1,
-0.6669253, -1.257776, -2.737472, 1, 1, 1, 1, 1,
-0.6649454, 0.2817278, -0.2439019, 1, 1, 1, 1, 1,
-0.6639004, 0.4791329, -1.901477, 1, 1, 1, 1, 1,
-0.6637246, -0.7395038, -3.466928, 1, 1, 1, 1, 1,
-0.6598889, 0.1803571, -1.145796, 1, 1, 1, 1, 1,
-0.6551416, -1.306405, -3.547513, 1, 1, 1, 1, 1,
-0.6550007, -0.002723855, -1.500374, 1, 1, 1, 1, 1,
-0.6526594, 0.1686926, -2.183598, 1, 1, 1, 1, 1,
-0.6445556, 0.8389779, 2.031095, 1, 1, 1, 1, 1,
-0.6407604, 0.5704095, -0.3413899, 1, 1, 1, 1, 1,
-0.6400859, -0.8531043, -2.267762, 1, 1, 1, 1, 1,
-0.6374677, 1.159397, -0.3396946, 1, 1, 1, 1, 1,
-0.6340366, -0.7227749, -2.671086, 1, 1, 1, 1, 1,
-0.6335005, -1.527327, -4.067558, 1, 1, 1, 1, 1,
-0.630629, -0.5347824, -1.818997, 1, 1, 1, 1, 1,
-0.6232417, -0.1408325, -1.856172, 0, 0, 1, 1, 1,
-0.6187482, 0.7270659, -1.213181, 1, 0, 0, 1, 1,
-0.6065333, 0.8707801, -1.606581, 1, 0, 0, 1, 1,
-0.6063503, 1.240315, -0.1917638, 1, 0, 0, 1, 1,
-0.601401, 0.1855187, -1.053639, 1, 0, 0, 1, 1,
-0.5997793, 1.143134, -0.6511708, 1, 0, 0, 1, 1,
-0.5928834, 0.5764061, -1.660803, 0, 0, 0, 1, 1,
-0.5923952, 1.065225, -0.6098823, 0, 0, 0, 1, 1,
-0.5869045, 1.266824, -0.5803914, 0, 0, 0, 1, 1,
-0.5864466, -0.3572454, -0.6591986, 0, 0, 0, 1, 1,
-0.5860131, -0.8370299, -1.852764, 0, 0, 0, 1, 1,
-0.5850652, -0.7755899, -0.4000823, 0, 0, 0, 1, 1,
-0.5841491, 0.2035158, -1.146808, 0, 0, 0, 1, 1,
-0.5824444, 0.5584291, -0.1304759, 1, 1, 1, 1, 1,
-0.5808812, -0.2198736, -1.950802, 1, 1, 1, 1, 1,
-0.5764104, 0.01557051, -1.803656, 1, 1, 1, 1, 1,
-0.5748135, -0.2277424, -2.331091, 1, 1, 1, 1, 1,
-0.5745862, 2.403965, -1.200009, 1, 1, 1, 1, 1,
-0.5722718, -0.3303947, -3.356202, 1, 1, 1, 1, 1,
-0.5621433, -1.785414, -1.907589, 1, 1, 1, 1, 1,
-0.5605488, -1.000896, -3.28695, 1, 1, 1, 1, 1,
-0.5541189, -0.5574048, -2.503858, 1, 1, 1, 1, 1,
-0.5500299, -0.5500746, -0.7564327, 1, 1, 1, 1, 1,
-0.5492716, -0.3292732, -0.9221739, 1, 1, 1, 1, 1,
-0.5485187, -0.229543, -1.20195, 1, 1, 1, 1, 1,
-0.536876, -0.566016, -3.601265, 1, 1, 1, 1, 1,
-0.534013, 0.8810881, -0.7384977, 1, 1, 1, 1, 1,
-0.5274567, -1.628994, -4.371766, 1, 1, 1, 1, 1,
-0.5254719, 0.6271243, -0.4344575, 0, 0, 1, 1, 1,
-0.5230631, 1.054495, 0.4406094, 1, 0, 0, 1, 1,
-0.5209569, 0.1514148, -1.070965, 1, 0, 0, 1, 1,
-0.5205859, -0.04663992, -1.86939, 1, 0, 0, 1, 1,
-0.5131676, -0.8106642, -1.175692, 1, 0, 0, 1, 1,
-0.5089664, -0.5469365, -2.474629, 1, 0, 0, 1, 1,
-0.5061272, -1.398709, -3.979795, 0, 0, 0, 1, 1,
-0.5055076, -0.3232249, -1.501917, 0, 0, 0, 1, 1,
-0.5053877, 0.7745801, -0.1925568, 0, 0, 0, 1, 1,
-0.4854724, 0.6138494, -2.941362, 0, 0, 0, 1, 1,
-0.4832129, -1.025341, -2.238793, 0, 0, 0, 1, 1,
-0.4769708, -1.733136, -1.895569, 0, 0, 0, 1, 1,
-0.4764304, 0.2179745, -0.2339988, 0, 0, 0, 1, 1,
-0.4683426, -1.620721, -3.655714, 1, 1, 1, 1, 1,
-0.4620935, 0.6574824, -2.158396, 1, 1, 1, 1, 1,
-0.4600446, 0.2962785, 0.2206001, 1, 1, 1, 1, 1,
-0.4592063, 1.650062, -1.279279, 1, 1, 1, 1, 1,
-0.4576136, 0.6416059, -0.3121337, 1, 1, 1, 1, 1,
-0.456449, 0.4488896, -0.6314318, 1, 1, 1, 1, 1,
-0.4537272, -0.06552114, -2.276552, 1, 1, 1, 1, 1,
-0.4503518, -0.4227044, -1.896424, 1, 1, 1, 1, 1,
-0.4487928, 0.8639181, -1.476225, 1, 1, 1, 1, 1,
-0.4481922, 1.917315, 0.8454984, 1, 1, 1, 1, 1,
-0.4479429, -0.6322755, -1.757877, 1, 1, 1, 1, 1,
-0.4479268, -0.8155181, -2.571011, 1, 1, 1, 1, 1,
-0.4458009, -0.2412401, -2.882444, 1, 1, 1, 1, 1,
-0.439737, -0.6462726, -2.405729, 1, 1, 1, 1, 1,
-0.4147967, -1.788345, -4.981383, 1, 1, 1, 1, 1,
-0.4135785, 1.149138, -0.6591095, 0, 0, 1, 1, 1,
-0.4122121, -0.5980469, -3.31471, 1, 0, 0, 1, 1,
-0.4047544, -0.7482314, -1.778688, 1, 0, 0, 1, 1,
-0.403771, -0.5796504, -3.464953, 1, 0, 0, 1, 1,
-0.3949837, -1.945991, -3.188714, 1, 0, 0, 1, 1,
-0.3930487, 0.3741593, -1.711714, 1, 0, 0, 1, 1,
-0.391246, -0.8905847, -4.527405, 0, 0, 0, 1, 1,
-0.3892078, -0.5085773, -3.478896, 0, 0, 0, 1, 1,
-0.3872108, -0.1379283, -2.136329, 0, 0, 0, 1, 1,
-0.3867467, -0.7607543, -3.446387, 0, 0, 0, 1, 1,
-0.3830447, 1.599021, -1.310818, 0, 0, 0, 1, 1,
-0.3825777, 0.3474015, 0.06558383, 0, 0, 0, 1, 1,
-0.3821338, 1.652997, -1.067286, 0, 0, 0, 1, 1,
-0.3784544, -0.3291326, -1.058537, 1, 1, 1, 1, 1,
-0.3752739, -0.264737, -3.502218, 1, 1, 1, 1, 1,
-0.3742595, -1.000525, -6.22298, 1, 1, 1, 1, 1,
-0.3604835, -0.5387822, -2.437113, 1, 1, 1, 1, 1,
-0.3560399, 0.1537447, -1.545659, 1, 1, 1, 1, 1,
-0.3557401, 0.4481559, 0.7003208, 1, 1, 1, 1, 1,
-0.3521128, 0.922443, 0.520234, 1, 1, 1, 1, 1,
-0.3510952, -2.24486, -2.749006, 1, 1, 1, 1, 1,
-0.3465572, -0.6093631, -3.658883, 1, 1, 1, 1, 1,
-0.3442254, -0.5429175, -1.046287, 1, 1, 1, 1, 1,
-0.3432072, 0.2340391, -1.5441, 1, 1, 1, 1, 1,
-0.342416, 0.6065967, -1.79919, 1, 1, 1, 1, 1,
-0.3399138, -1.462501, -4.501629, 1, 1, 1, 1, 1,
-0.3397468, 0.8630183, 1.851558, 1, 1, 1, 1, 1,
-0.3373309, 0.4314674, 1.263685, 1, 1, 1, 1, 1,
-0.3355389, -1.376457, -4.719092, 0, 0, 1, 1, 1,
-0.3326278, -0.5299989, -2.770604, 1, 0, 0, 1, 1,
-0.3322939, -0.206505, -0.6757949, 1, 0, 0, 1, 1,
-0.3286846, -0.9629794, -1.823237, 1, 0, 0, 1, 1,
-0.3260266, 1.023703, -1.397511, 1, 0, 0, 1, 1,
-0.3154095, -0.419313, -4.177736, 1, 0, 0, 1, 1,
-0.3142312, -0.5937901, -3.332776, 0, 0, 0, 1, 1,
-0.3126979, 0.6206262, -1.587828, 0, 0, 0, 1, 1,
-0.3102859, 0.05722522, -2.84325, 0, 0, 0, 1, 1,
-0.3101973, -1.373996, -2.777713, 0, 0, 0, 1, 1,
-0.3073892, 0.4784569, 0.5754836, 0, 0, 0, 1, 1,
-0.3055524, 0.02828782, -1.439928, 0, 0, 0, 1, 1,
-0.3053738, -0.2728623, -3.670301, 0, 0, 0, 1, 1,
-0.304029, 0.7002628, -0.5270723, 1, 1, 1, 1, 1,
-0.2936192, 0.462769, -2.685241, 1, 1, 1, 1, 1,
-0.2924899, 0.1989486, -0.7770002, 1, 1, 1, 1, 1,
-0.2911843, -0.2268848, -1.495136, 1, 1, 1, 1, 1,
-0.2883914, -1.342223, -4.820561, 1, 1, 1, 1, 1,
-0.2866476, -1.805286, -4.138247, 1, 1, 1, 1, 1,
-0.2847419, 1.709874, -1.074002, 1, 1, 1, 1, 1,
-0.2838204, -0.8130519, -0.8990155, 1, 1, 1, 1, 1,
-0.2826379, 1.432596, 0.8721183, 1, 1, 1, 1, 1,
-0.2813753, 0.4962682, 0.3637983, 1, 1, 1, 1, 1,
-0.2773136, 0.6242079, 0.2203084, 1, 1, 1, 1, 1,
-0.2743223, -0.1827369, -1.914723, 1, 1, 1, 1, 1,
-0.2702879, -1.387455, -4.654471, 1, 1, 1, 1, 1,
-0.2683885, 0.2846574, -1.242887, 1, 1, 1, 1, 1,
-0.2655881, 1.177374, -1.415175, 1, 1, 1, 1, 1,
-0.2603596, 0.121316, -2.419961, 0, 0, 1, 1, 1,
-0.2592811, -0.3784995, -2.733389, 1, 0, 0, 1, 1,
-0.2580047, 0.3726467, 1.82743, 1, 0, 0, 1, 1,
-0.2551624, 0.1511796, -1.430681, 1, 0, 0, 1, 1,
-0.2545382, 0.5990806, -2.125451, 1, 0, 0, 1, 1,
-0.2523829, 1.354427, -0.8255818, 1, 0, 0, 1, 1,
-0.251365, 1.768329, -0.0922786, 0, 0, 0, 1, 1,
-0.2502294, 0.2954205, -1.84243, 0, 0, 0, 1, 1,
-0.2501656, 0.6920934, -1.543263, 0, 0, 0, 1, 1,
-0.2457719, 1.364806, -1.122766, 0, 0, 0, 1, 1,
-0.2436255, -1.94774, -3.202967, 0, 0, 0, 1, 1,
-0.2380028, -0.8898476, -3.44304, 0, 0, 0, 1, 1,
-0.2359495, 0.164096, -1.01082, 0, 0, 0, 1, 1,
-0.2359034, -1.595557, -3.075084, 1, 1, 1, 1, 1,
-0.2323615, -1.497531, -1.013773, 1, 1, 1, 1, 1,
-0.2305055, 0.8567323, 0.07590611, 1, 1, 1, 1, 1,
-0.2303101, -1.125992, -2.063861, 1, 1, 1, 1, 1,
-0.2259197, -0.5732275, -4.272594, 1, 1, 1, 1, 1,
-0.2251142, -1.135745, -2.754298, 1, 1, 1, 1, 1,
-0.2176386, -0.9962525, -2.131061, 1, 1, 1, 1, 1,
-0.2153966, 0.2667381, -1.098375, 1, 1, 1, 1, 1,
-0.2150336, 1.585831, 0.2102391, 1, 1, 1, 1, 1,
-0.21419, -0.5280973, -3.472307, 1, 1, 1, 1, 1,
-0.2117876, -1.485791, -3.224659, 1, 1, 1, 1, 1,
-0.2111221, 0.6986425, -0.4485343, 1, 1, 1, 1, 1,
-0.2067781, -1.475287, -1.255976, 1, 1, 1, 1, 1,
-0.2051256, 1.084658, -0.911345, 1, 1, 1, 1, 1,
-0.2024131, -0.8876275, -3.239301, 1, 1, 1, 1, 1,
-0.1992629, 0.09459315, -1.72396, 0, 0, 1, 1, 1,
-0.1991612, 0.3229201, 0.02781693, 1, 0, 0, 1, 1,
-0.1981111, -0.9457515, -2.418869, 1, 0, 0, 1, 1,
-0.197764, -0.5937786, -4.678943, 1, 0, 0, 1, 1,
-0.1962576, 0.4040258, -2.771909, 1, 0, 0, 1, 1,
-0.1941177, -0.5212808, -0.9508181, 1, 0, 0, 1, 1,
-0.193234, -1.183691, -3.022594, 0, 0, 0, 1, 1,
-0.1867103, -0.04242355, -2.71591, 0, 0, 0, 1, 1,
-0.1857367, -0.2741487, -2.609147, 0, 0, 0, 1, 1,
-0.1820941, -0.8434408, -1.473463, 0, 0, 0, 1, 1,
-0.1807101, -1.326836, -3.594262, 0, 0, 0, 1, 1,
-0.1784671, 0.2816206, -0.6284037, 0, 0, 0, 1, 1,
-0.1713008, -0.2437396, -2.716789, 0, 0, 0, 1, 1,
-0.1689004, -0.960874, -5.497718, 1, 1, 1, 1, 1,
-0.1681742, -0.4892831, -4.095726, 1, 1, 1, 1, 1,
-0.1645572, -0.3051834, -1.653344, 1, 1, 1, 1, 1,
-0.1590964, 1.280355, -0.07883099, 1, 1, 1, 1, 1,
-0.1559445, 0.6121241, 0.8990308, 1, 1, 1, 1, 1,
-0.1546482, -1.0915, -4.354711, 1, 1, 1, 1, 1,
-0.1525767, 1.082216, 0.8317384, 1, 1, 1, 1, 1,
-0.1522373, 0.4527869, -1.68469, 1, 1, 1, 1, 1,
-0.1516991, -0.2780032, -3.494056, 1, 1, 1, 1, 1,
-0.1511231, -1.193897, -4.545108, 1, 1, 1, 1, 1,
-0.1483866, -1.127685, -2.274709, 1, 1, 1, 1, 1,
-0.1453717, 0.06810726, -2.857958, 1, 1, 1, 1, 1,
-0.1448484, 1.220548, 1.471692, 1, 1, 1, 1, 1,
-0.1440067, -0.125444, -3.660389, 1, 1, 1, 1, 1,
-0.1409556, 1.114971, -0.6286013, 1, 1, 1, 1, 1,
-0.1395165, 0.4125233, -0.3625552, 0, 0, 1, 1, 1,
-0.133248, -1.069112, -1.977969, 1, 0, 0, 1, 1,
-0.1331639, -0.1240128, -2.160013, 1, 0, 0, 1, 1,
-0.1290743, -0.2870857, -2.702302, 1, 0, 0, 1, 1,
-0.1287303, 1.289948, -0.6556028, 1, 0, 0, 1, 1,
-0.1283183, -0.07240928, -1.481253, 1, 0, 0, 1, 1,
-0.1277528, 0.2408201, 0.4421299, 0, 0, 0, 1, 1,
-0.1271324, 0.216518, -0.2055936, 0, 0, 0, 1, 1,
-0.1253265, 0.8376152, -0.6593418, 0, 0, 0, 1, 1,
-0.1244735, 0.3820624, -1.352708, 0, 0, 0, 1, 1,
-0.1230104, 0.1514181, -0.1358744, 0, 0, 0, 1, 1,
-0.1205199, -0.04969902, -1.294084, 0, 0, 0, 1, 1,
-0.1144409, -0.7630442, -2.108992, 0, 0, 0, 1, 1,
-0.1142853, -0.6360642, -4.347167, 1, 1, 1, 1, 1,
-0.112731, -1.882517, -1.759663, 1, 1, 1, 1, 1,
-0.1014911, 1.931357, 2.257298, 1, 1, 1, 1, 1,
-0.09960865, 0.4504812, -0.4114478, 1, 1, 1, 1, 1,
-0.09870443, -1.098595, -2.670286, 1, 1, 1, 1, 1,
-0.09801331, -0.4660441, -4.561309, 1, 1, 1, 1, 1,
-0.09402855, 0.07252351, -1.40267, 1, 1, 1, 1, 1,
-0.09293493, -1.527869, -3.320387, 1, 1, 1, 1, 1,
-0.09263835, -0.06867069, -4.11867, 1, 1, 1, 1, 1,
-0.0909217, -0.4359128, -4.210547, 1, 1, 1, 1, 1,
-0.0874222, -0.6317992, -3.55588, 1, 1, 1, 1, 1,
-0.0841855, 0.1864158, -0.2727497, 1, 1, 1, 1, 1,
-0.07906694, -0.3455345, -2.44204, 1, 1, 1, 1, 1,
-0.07895097, -1.190097, -3.375496, 1, 1, 1, 1, 1,
-0.07785963, 0.5863935, -0.5820124, 1, 1, 1, 1, 1,
-0.07603988, -0.03684002, -2.622832, 0, 0, 1, 1, 1,
-0.07355257, -1.487747, -3.272242, 1, 0, 0, 1, 1,
-0.07146964, 0.9861837, 1.682164, 1, 0, 0, 1, 1,
-0.06519341, -1.102603, -2.570715, 1, 0, 0, 1, 1,
-0.06409336, 0.8238648, 0.8504226, 1, 0, 0, 1, 1,
-0.0624781, -0.2846327, -4.828247, 1, 0, 0, 1, 1,
-0.06000111, -1.263291, -3.925293, 0, 0, 0, 1, 1,
-0.05703456, -0.4245562, -3.012499, 0, 0, 0, 1, 1,
-0.05686196, 2.679226, -1.773614, 0, 0, 0, 1, 1,
-0.05461585, 0.1538119, -0.7768038, 0, 0, 0, 1, 1,
-0.05408376, -0.08575934, -4.29053, 0, 0, 0, 1, 1,
-0.05133008, -0.579439, -4.033338, 0, 0, 0, 1, 1,
-0.0507942, -0.5781616, -3.102356, 0, 0, 0, 1, 1,
-0.04872108, -0.2749763, -1.619922, 1, 1, 1, 1, 1,
-0.04720328, 0.01753833, -1.673525, 1, 1, 1, 1, 1,
-0.03868413, 1.705111, -1.924572, 1, 1, 1, 1, 1,
-0.03847211, -0.2339623, -3.949743, 1, 1, 1, 1, 1,
-0.0381568, -1.331573, -2.360051, 1, 1, 1, 1, 1,
-0.03604981, -1.304523, -2.164413, 1, 1, 1, 1, 1,
-0.03599329, -0.113116, -2.576659, 1, 1, 1, 1, 1,
-0.03296461, 0.1982256, 1.131678, 1, 1, 1, 1, 1,
-0.03012295, 0.5296505, 0.06448799, 1, 1, 1, 1, 1,
-0.02632689, -1.950648, -3.50601, 1, 1, 1, 1, 1,
-0.02082791, 2.273422, 0.7834095, 1, 1, 1, 1, 1,
-0.01885848, 0.3696962, 1.580946, 1, 1, 1, 1, 1,
-0.01761644, -0.1738797, -2.606213, 1, 1, 1, 1, 1,
-0.01486573, -1.76597, -4.723234, 1, 1, 1, 1, 1,
-0.01337137, -0.1202382, -2.223221, 1, 1, 1, 1, 1,
-0.01320523, -0.582819, -1.486138, 0, 0, 1, 1, 1,
-0.01062027, 0.355562, -1.097637, 1, 0, 0, 1, 1,
-0.009559301, -0.1706619, -4.32207, 1, 0, 0, 1, 1,
-0.008072032, -1.983315, -5.126704, 1, 0, 0, 1, 1,
-0.0007600458, 0.7799572, 1.239394, 1, 0, 0, 1, 1,
0.003744859, -0.2632089, 3.682047, 1, 0, 0, 1, 1,
0.006447719, 0.7441072, -1.657863, 0, 0, 0, 1, 1,
0.01056671, -0.8446776, 4.521517, 0, 0, 0, 1, 1,
0.01135137, -0.8053224, 1.543037, 0, 0, 0, 1, 1,
0.01416467, -0.1336496, 1.358112, 0, 0, 0, 1, 1,
0.01612651, 0.7096277, 0.6508311, 0, 0, 0, 1, 1,
0.0183737, -0.5260251, 2.816923, 0, 0, 0, 1, 1,
0.02324809, -0.8433865, 4.238807, 0, 0, 0, 1, 1,
0.02635096, -0.009046565, 1.329875, 1, 1, 1, 1, 1,
0.02828544, 1.219779, 0.04729829, 1, 1, 1, 1, 1,
0.03205993, 0.2849168, 0.3871285, 1, 1, 1, 1, 1,
0.03570012, -0.7157323, 1.970146, 1, 1, 1, 1, 1,
0.03713715, -0.8586152, 2.306901, 1, 1, 1, 1, 1,
0.03876349, -3.244283, 3.049352, 1, 1, 1, 1, 1,
0.0391638, -1.33513, 2.985895, 1, 1, 1, 1, 1,
0.03976212, 2.080481, 0.4430164, 1, 1, 1, 1, 1,
0.04218327, -0.03630305, 2.981343, 1, 1, 1, 1, 1,
0.04972094, 1.405838, 0.7805017, 1, 1, 1, 1, 1,
0.05502575, -0.7113481, 3.127901, 1, 1, 1, 1, 1,
0.05569068, 0.1134444, 1.017969, 1, 1, 1, 1, 1,
0.05608204, 0.1306513, -0.08159764, 1, 1, 1, 1, 1,
0.06847837, 0.07027271, 2.837907, 1, 1, 1, 1, 1,
0.06937873, -0.6893885, 2.532008, 1, 1, 1, 1, 1,
0.07186858, -0.04323585, 3.034959, 0, 0, 1, 1, 1,
0.07226656, 0.2071472, 0.5639583, 1, 0, 0, 1, 1,
0.07280274, -1.13414, 1.914986, 1, 0, 0, 1, 1,
0.07333126, -0.5342007, 3.297513, 1, 0, 0, 1, 1,
0.07568415, -0.1575916, 3.412391, 1, 0, 0, 1, 1,
0.07837987, 1.054945, -0.05135658, 1, 0, 0, 1, 1,
0.08017854, 0.449681, -0.8042595, 0, 0, 0, 1, 1,
0.08504467, -0.7402944, 3.997338, 0, 0, 0, 1, 1,
0.08562115, -0.8384512, 3.716222, 0, 0, 0, 1, 1,
0.08874354, 0.3952902, -0.1533687, 0, 0, 0, 1, 1,
0.08954379, -0.6156649, 1.880711, 0, 0, 0, 1, 1,
0.09524418, -1.026046, 3.871899, 0, 0, 0, 1, 1,
0.1044755, 0.5664077, -0.2257216, 0, 0, 0, 1, 1,
0.1075076, 0.5311608, 1.891551, 1, 1, 1, 1, 1,
0.1083276, -0.3363879, 2.597965, 1, 1, 1, 1, 1,
0.1117854, -0.07189917, 4.18437, 1, 1, 1, 1, 1,
0.114304, 1.243209, -1.052999, 1, 1, 1, 1, 1,
0.1175057, 1.447883, 0.8266588, 1, 1, 1, 1, 1,
0.1217867, 0.6210324, -0.4386663, 1, 1, 1, 1, 1,
0.124163, 1.195121, 1.258328, 1, 1, 1, 1, 1,
0.1244314, 1.53655, 0.703387, 1, 1, 1, 1, 1,
0.1264484, -0.4443545, 2.731247, 1, 1, 1, 1, 1,
0.1301908, 0.9396009, 0.8657718, 1, 1, 1, 1, 1,
0.1340848, 0.9076461, -0.136946, 1, 1, 1, 1, 1,
0.134908, 2.082934, 0.7116163, 1, 1, 1, 1, 1,
0.1370488, -0.6060092, 2.140746, 1, 1, 1, 1, 1,
0.1432675, -0.9860995, 3.158553, 1, 1, 1, 1, 1,
0.1448345, 1.192296, -0.3337332, 1, 1, 1, 1, 1,
0.1527302, 0.3723261, 2.188767, 0, 0, 1, 1, 1,
0.1573417, -0.06627321, 1.857196, 1, 0, 0, 1, 1,
0.1619607, -1.67036, 3.731139, 1, 0, 0, 1, 1,
0.1641603, -1.026515, 4.861348, 1, 0, 0, 1, 1,
0.1657415, -1.377925, 3.492982, 1, 0, 0, 1, 1,
0.1742844, 0.5432785, 0.4206386, 1, 0, 0, 1, 1,
0.1771099, 1.029498, 1.772182, 0, 0, 0, 1, 1,
0.1791572, 1.491489, -1.291792, 0, 0, 0, 1, 1,
0.184345, 1.549021, 0.7403754, 0, 0, 0, 1, 1,
0.1850859, -0.8589653, 4.060674, 0, 0, 0, 1, 1,
0.1851295, -0.3569986, 1.868331, 0, 0, 0, 1, 1,
0.1859813, 1.445233, -0.2739693, 0, 0, 0, 1, 1,
0.1863857, 0.5661155, 0.4073108, 0, 0, 0, 1, 1,
0.1869363, 1.120784, -0.1809047, 1, 1, 1, 1, 1,
0.187318, -1.736658, 2.885346, 1, 1, 1, 1, 1,
0.1889656, 1.062568, -0.01831362, 1, 1, 1, 1, 1,
0.1940102, 0.6760304, -0.9462257, 1, 1, 1, 1, 1,
0.1980321, 1.14801, -0.3499368, 1, 1, 1, 1, 1,
0.1989864, -1.267446, 2.964628, 1, 1, 1, 1, 1,
0.2023616, 1.228752, 0.4134431, 1, 1, 1, 1, 1,
0.2036755, 1.334244, -0.5981724, 1, 1, 1, 1, 1,
0.2156032, -0.2138796, 2.800119, 1, 1, 1, 1, 1,
0.2165834, -0.6163878, 1.125194, 1, 1, 1, 1, 1,
0.2165946, -0.06514309, 1.552664, 1, 1, 1, 1, 1,
0.2168973, -0.1395938, 1.410977, 1, 1, 1, 1, 1,
0.2272353, -0.930526, 2.467981, 1, 1, 1, 1, 1,
0.2296723, -0.2799358, 3.406639, 1, 1, 1, 1, 1,
0.2309547, 2.313812, 0.1511688, 1, 1, 1, 1, 1,
0.2336147, 1.194551, 0.5370424, 0, 0, 1, 1, 1,
0.2383345, 0.8109037, -0.2610139, 1, 0, 0, 1, 1,
0.2404735, 0.4429424, -1.132822, 1, 0, 0, 1, 1,
0.2419679, 0.1017603, 2.406924, 1, 0, 0, 1, 1,
0.2463099, -0.6353329, 3.115427, 1, 0, 0, 1, 1,
0.2483358, -0.1135952, 3.155703, 1, 0, 0, 1, 1,
0.2528321, -1.161348, 2.985149, 0, 0, 0, 1, 1,
0.2581832, -0.1531679, 2.104359, 0, 0, 0, 1, 1,
0.2597722, -1.225849, 1.638957, 0, 0, 0, 1, 1,
0.2600257, 1.721079, 0.04397766, 0, 0, 0, 1, 1,
0.2650733, 0.2938422, 1.008021, 0, 0, 0, 1, 1,
0.2663815, -0.6940814, 3.657331, 0, 0, 0, 1, 1,
0.2671542, -0.0299238, 2.687713, 0, 0, 0, 1, 1,
0.267911, 0.5940219, -0.3976116, 1, 1, 1, 1, 1,
0.2692027, 0.4702044, 1.511665, 1, 1, 1, 1, 1,
0.2697081, 1.11688, -0.4401245, 1, 1, 1, 1, 1,
0.2774522, -2.080996, 2.891507, 1, 1, 1, 1, 1,
0.283946, -1.057271, 1.380482, 1, 1, 1, 1, 1,
0.2882279, 0.5876716, -0.9763135, 1, 1, 1, 1, 1,
0.2892124, -0.7479033, 3.477873, 1, 1, 1, 1, 1,
0.2921854, -0.9946203, 2.629914, 1, 1, 1, 1, 1,
0.2929273, 0.3377903, 0.4441203, 1, 1, 1, 1, 1,
0.2938559, 0.110486, 1.604192, 1, 1, 1, 1, 1,
0.2942488, 0.4042206, 0.5075594, 1, 1, 1, 1, 1,
0.2946214, 1.071061, -0.3396795, 1, 1, 1, 1, 1,
0.2949838, -0.1573902, 2.179122, 1, 1, 1, 1, 1,
0.3026828, 0.9438211, 1.044405, 1, 1, 1, 1, 1,
0.305682, -0.03957815, 1.754498, 1, 1, 1, 1, 1,
0.3109161, -0.4663628, 4.138161, 0, 0, 1, 1, 1,
0.3112097, 0.06276295, 0.9894947, 1, 0, 0, 1, 1,
0.3176602, -0.6968554, 3.353187, 1, 0, 0, 1, 1,
0.3258628, -0.9847373, 2.945002, 1, 0, 0, 1, 1,
0.3268412, 1.71987, 2.120556, 1, 0, 0, 1, 1,
0.3271842, -0.7368794, 2.540766, 1, 0, 0, 1, 1,
0.3280653, 0.6766658, 1.742717, 0, 0, 0, 1, 1,
0.3282533, 0.3106821, 1.155621, 0, 0, 0, 1, 1,
0.3298163, -0.4765903, 2.582554, 0, 0, 0, 1, 1,
0.3333411, -0.8415094, 3.9147, 0, 0, 0, 1, 1,
0.3406299, 0.9633001, 1.021777, 0, 0, 0, 1, 1,
0.3407556, 0.3652104, 0.7019806, 0, 0, 0, 1, 1,
0.3421612, 2.512648, 0.9986045, 0, 0, 0, 1, 1,
0.3423538, -0.7037992, 2.559231, 1, 1, 1, 1, 1,
0.3427913, 0.3880846, 0.3624232, 1, 1, 1, 1, 1,
0.3464279, -1.49957, 3.178651, 1, 1, 1, 1, 1,
0.347176, -0.7953973, 2.426247, 1, 1, 1, 1, 1,
0.3477225, 0.9690285, -0.340274, 1, 1, 1, 1, 1,
0.3491432, 0.5325566, 0.896077, 1, 1, 1, 1, 1,
0.3493609, -0.2132873, 2.746913, 1, 1, 1, 1, 1,
0.3517382, -0.4582341, 3.671515, 1, 1, 1, 1, 1,
0.3587028, 2.071362, 0.5467098, 1, 1, 1, 1, 1,
0.3588596, -1.751061, 2.342028, 1, 1, 1, 1, 1,
0.3593876, -0.1624602, 1.039828, 1, 1, 1, 1, 1,
0.3632398, -1.827202, 4.280854, 1, 1, 1, 1, 1,
0.3640347, -1.248663, 4.224649, 1, 1, 1, 1, 1,
0.3667313, 0.6347911, -0.3414689, 1, 1, 1, 1, 1,
0.3673776, -0.5617964, 2.105773, 1, 1, 1, 1, 1,
0.3704741, -1.930571, 3.989561, 0, 0, 1, 1, 1,
0.3779478, -0.4425826, 0.8670474, 1, 0, 0, 1, 1,
0.3785926, 0.05072575, -0.6189711, 1, 0, 0, 1, 1,
0.3790989, 1.263797, -1.06709, 1, 0, 0, 1, 1,
0.3838409, -0.9895098, 3.083849, 1, 0, 0, 1, 1,
0.3949602, 0.1600771, 0.8809982, 1, 0, 0, 1, 1,
0.3955228, 0.04611627, 2.366942, 0, 0, 0, 1, 1,
0.3967142, 1.328165, -0.965947, 0, 0, 0, 1, 1,
0.3970464, 0.02565501, 2.625746, 0, 0, 0, 1, 1,
0.3988926, 0.6517994, 0.3656909, 0, 0, 0, 1, 1,
0.4030847, 0.6770757, -1.636368, 0, 0, 0, 1, 1,
0.4046584, -0.3184588, 1.478055, 0, 0, 0, 1, 1,
0.4125952, 0.04997097, -0.1981071, 0, 0, 0, 1, 1,
0.4175073, -0.853784, 1.852011, 1, 1, 1, 1, 1,
0.4202588, -0.01448672, 1.863765, 1, 1, 1, 1, 1,
0.4209418, 0.5754296, 1.503766, 1, 1, 1, 1, 1,
0.4212462, 0.4141055, 0.01800146, 1, 1, 1, 1, 1,
0.42145, 0.4509258, 0.9602822, 1, 1, 1, 1, 1,
0.4223903, -1.181682, 3.509111, 1, 1, 1, 1, 1,
0.4250247, -0.3874219, 1.409359, 1, 1, 1, 1, 1,
0.4307589, 0.9357869, 0.1159637, 1, 1, 1, 1, 1,
0.4308227, 0.2528767, 1.848895, 1, 1, 1, 1, 1,
0.4323834, 0.2168278, 0.7598701, 1, 1, 1, 1, 1,
0.4325069, -0.6030445, 1.238477, 1, 1, 1, 1, 1,
0.4455574, 0.3367346, 0.6847963, 1, 1, 1, 1, 1,
0.4477225, 0.9962237, 0.09058237, 1, 1, 1, 1, 1,
0.447975, -0.262519, 0.9364823, 1, 1, 1, 1, 1,
0.4523316, 0.4911466, 3.404734, 1, 1, 1, 1, 1,
0.4563029, -0.6628894, 2.022043, 0, 0, 1, 1, 1,
0.4655202, 1.451936, -0.4145514, 1, 0, 0, 1, 1,
0.4681795, 1.023845, -1.202225, 1, 0, 0, 1, 1,
0.4700583, -0.6596292, 1.687802, 1, 0, 0, 1, 1,
0.470257, -0.3787009, 3.045086, 1, 0, 0, 1, 1,
0.4705251, -0.8894756, 2.450561, 1, 0, 0, 1, 1,
0.4714228, -0.4118666, 2.664445, 0, 0, 0, 1, 1,
0.472773, 0.1720232, 1.012002, 0, 0, 0, 1, 1,
0.473649, -0.1159616, 4.102487, 0, 0, 0, 1, 1,
0.4737366, -1.037119, 3.873549, 0, 0, 0, 1, 1,
0.4753993, 0.5160588, 1.023088, 0, 0, 0, 1, 1,
0.4755476, 1.765037, 1.241735, 0, 0, 0, 1, 1,
0.4787798, 0.9136776, 0.7828285, 0, 0, 0, 1, 1,
0.4791701, -0.1722231, 1.584569, 1, 1, 1, 1, 1,
0.4819416, 1.303321, 0.3944141, 1, 1, 1, 1, 1,
0.4870152, -0.1469162, 1.009623, 1, 1, 1, 1, 1,
0.4893649, 0.7845702, 1.368958, 1, 1, 1, 1, 1,
0.4945777, 0.007812185, 2.463055, 1, 1, 1, 1, 1,
0.4957741, -0.2343112, 3.804467, 1, 1, 1, 1, 1,
0.5003753, -0.4947453, 3.331795, 1, 1, 1, 1, 1,
0.5037737, 0.133582, 2.480689, 1, 1, 1, 1, 1,
0.5075809, 0.6797286, 0.9892907, 1, 1, 1, 1, 1,
0.5148258, -0.2643571, 2.668207, 1, 1, 1, 1, 1,
0.5183583, -1.833315, 1.340205, 1, 1, 1, 1, 1,
0.5197736, -0.0272743, 2.11938, 1, 1, 1, 1, 1,
0.5229238, -0.06516473, -0.08562971, 1, 1, 1, 1, 1,
0.5254167, 0.8987438, 0.8863569, 1, 1, 1, 1, 1,
0.5283154, -0.4475249, 1.497366, 1, 1, 1, 1, 1,
0.5288019, 0.6115495, 2.25065, 0, 0, 1, 1, 1,
0.5304384, 0.3271171, 1.448738, 1, 0, 0, 1, 1,
0.5327987, 1.21671, 1.392947, 1, 0, 0, 1, 1,
0.5352895, 0.3735685, 0.6768341, 1, 0, 0, 1, 1,
0.5360005, 0.4353136, 1.822738, 1, 0, 0, 1, 1,
0.5396621, -0.1097726, 1.214679, 1, 0, 0, 1, 1,
0.5408403, 0.1487968, 0.9593685, 0, 0, 0, 1, 1,
0.5435917, -0.01477222, -0.1162614, 0, 0, 0, 1, 1,
0.5470018, -0.2707427, 1.720694, 0, 0, 0, 1, 1,
0.5494704, -0.1203041, 2.39831, 0, 0, 0, 1, 1,
0.5522695, 1.126857, -0.9126049, 0, 0, 0, 1, 1,
0.5557109, 1.249137, 0.2573116, 0, 0, 0, 1, 1,
0.5581572, -0.3953192, 0.4303912, 0, 0, 0, 1, 1,
0.5690512, 0.8057128, -2.186551, 1, 1, 1, 1, 1,
0.5877977, -0.4491706, 2.74979, 1, 1, 1, 1, 1,
0.5900951, -1.219519, 1.723203, 1, 1, 1, 1, 1,
0.5909659, 0.1251312, 1.635712, 1, 1, 1, 1, 1,
0.5914235, 0.2170831, 1.134525, 1, 1, 1, 1, 1,
0.5918625, 0.4387029, 2.372438, 1, 1, 1, 1, 1,
0.5923985, 0.2567601, 3.734581, 1, 1, 1, 1, 1,
0.5942885, -0.9538024, 1.337011, 1, 1, 1, 1, 1,
0.5985427, 0.3697363, 0.6248028, 1, 1, 1, 1, 1,
0.5993504, 0.1666596, 3.622124, 1, 1, 1, 1, 1,
0.6004968, 1.011059, -0.8261291, 1, 1, 1, 1, 1,
0.6051825, 1.175288, 0.09825367, 1, 1, 1, 1, 1,
0.6106482, -1.23217, 1.645634, 1, 1, 1, 1, 1,
0.6157922, 0.4815188, -1.176305, 1, 1, 1, 1, 1,
0.616305, 0.1457733, 0.6469837, 1, 1, 1, 1, 1,
0.6173347, -0.4427752, 3.227486, 0, 0, 1, 1, 1,
0.6186022, -0.6594892, 2.947142, 1, 0, 0, 1, 1,
0.6206379, 1.542663, 0.7594678, 1, 0, 0, 1, 1,
0.6346522, 1.265081, 0.1104446, 1, 0, 0, 1, 1,
0.6396268, -1.057915, 0.9443502, 1, 0, 0, 1, 1,
0.6403918, -0.3067771, 1.753349, 1, 0, 0, 1, 1,
0.6443657, 0.392458, 3.148448, 0, 0, 0, 1, 1,
0.6478541, 2.611526, 1.123131, 0, 0, 0, 1, 1,
0.6481822, -0.7197527, 2.430299, 0, 0, 0, 1, 1,
0.6500344, -1.107384, 1.140858, 0, 0, 0, 1, 1,
0.6541049, 1.198879, 0.1234276, 0, 0, 0, 1, 1,
0.6576937, -0.9326289, 2.050898, 0, 0, 0, 1, 1,
0.6580665, 0.6238015, -0.05988292, 0, 0, 0, 1, 1,
0.6582255, -0.1604296, 3.367968, 1, 1, 1, 1, 1,
0.6596912, 0.09348265, 1.081562, 1, 1, 1, 1, 1,
0.6693911, -0.1268482, 1.909584, 1, 1, 1, 1, 1,
0.6745133, -0.4138798, 3.395005, 1, 1, 1, 1, 1,
0.6761035, -0.01280183, 3.411061, 1, 1, 1, 1, 1,
0.6765487, 0.8335397, 0.2280613, 1, 1, 1, 1, 1,
0.6765841, 0.8063436, 2.264551, 1, 1, 1, 1, 1,
0.6818433, -0.3189798, 2.421501, 1, 1, 1, 1, 1,
0.6826852, -0.5471968, 3.049722, 1, 1, 1, 1, 1,
0.6845577, 1.836991, 1.062588, 1, 1, 1, 1, 1,
0.69045, -0.6914727, 3.058039, 1, 1, 1, 1, 1,
0.6922297, -0.3215325, 3.360964, 1, 1, 1, 1, 1,
0.6933149, -0.1870394, 2.302271, 1, 1, 1, 1, 1,
0.6990241, -2.141815, 3.611145, 1, 1, 1, 1, 1,
0.6990534, -1.02722, 3.542725, 1, 1, 1, 1, 1,
0.7009106, 1.770817, 0.2667475, 0, 0, 1, 1, 1,
0.7041119, -1.679064, 2.882029, 1, 0, 0, 1, 1,
0.7049929, -0.9738859, 2.836615, 1, 0, 0, 1, 1,
0.7081657, 2.4314, 0.020927, 1, 0, 0, 1, 1,
0.714663, -1.480644, 1.76987, 1, 0, 0, 1, 1,
0.7188189, 0.7979276, -0.6154547, 1, 0, 0, 1, 1,
0.7226771, 0.8889044, 1.77258, 0, 0, 0, 1, 1,
0.7274389, -0.311604, 2.448351, 0, 0, 0, 1, 1,
0.7412028, 0.8587261, 0.2979604, 0, 0, 0, 1, 1,
0.7426814, 0.4885142, 1.812049, 0, 0, 0, 1, 1,
0.7438762, 1.152972, 1.463542, 0, 0, 0, 1, 1,
0.7467039, 0.03280995, 2.724511, 0, 0, 0, 1, 1,
0.7482987, 0.7803492, 3.69753, 0, 0, 0, 1, 1,
0.7498411, -0.8362735, 2.382402, 1, 1, 1, 1, 1,
0.7505647, 0.9095294, 0.3377615, 1, 1, 1, 1, 1,
0.7519495, -0.3648919, 2.301546, 1, 1, 1, 1, 1,
0.7524166, 0.5790237, -0.9639757, 1, 1, 1, 1, 1,
0.753923, -0.3506143, 2.460517, 1, 1, 1, 1, 1,
0.7598324, 0.7825887, 1.111356, 1, 1, 1, 1, 1,
0.7659399, 1.888534, -0.5881613, 1, 1, 1, 1, 1,
0.7738898, 0.8477635, 0.08042155, 1, 1, 1, 1, 1,
0.7760279, 0.3626235, 2.199888, 1, 1, 1, 1, 1,
0.7833695, 0.8003345, 0.9471751, 1, 1, 1, 1, 1,
0.7943621, 1.375246, -0.3047078, 1, 1, 1, 1, 1,
0.7965912, 1.197477, 0.08571576, 1, 1, 1, 1, 1,
0.8008903, 0.849679, 1.130549, 1, 1, 1, 1, 1,
0.8020337, -1.458981, 3.538817, 1, 1, 1, 1, 1,
0.8028494, 0.3881469, 2.405069, 1, 1, 1, 1, 1,
0.8062097, -1.296549, 1.523536, 0, 0, 1, 1, 1,
0.8090823, 1.175975, 2.092863, 1, 0, 0, 1, 1,
0.8099355, 1.562431, 1.130674, 1, 0, 0, 1, 1,
0.8106053, 0.2933779, 2.48002, 1, 0, 0, 1, 1,
0.8110421, -1.25937, 1.547343, 1, 0, 0, 1, 1,
0.8116111, -2.086373, 2.257298, 1, 0, 0, 1, 1,
0.8207211, 1.249153, 2.312258, 0, 0, 0, 1, 1,
0.8227192, -0.73437, 2.265535, 0, 0, 0, 1, 1,
0.8291916, 1.486019, -0.07736553, 0, 0, 0, 1, 1,
0.8318341, 1.216345, 0.9621881, 0, 0, 0, 1, 1,
0.8331108, 0.3918974, 0.6808376, 0, 0, 0, 1, 1,
0.8340422, 0.6941817, 2.499867, 0, 0, 0, 1, 1,
0.8342686, -1.204643, 3.553433, 0, 0, 0, 1, 1,
0.8420556, 1.571734, 1.738412, 1, 1, 1, 1, 1,
0.8471979, -1.022175, 1.974879, 1, 1, 1, 1, 1,
0.8473448, 0.1076258, 0.9500037, 1, 1, 1, 1, 1,
0.8512163, -0.4620312, 3.328125, 1, 1, 1, 1, 1,
0.8525718, 0.4511617, -0.009673133, 1, 1, 1, 1, 1,
0.8579198, -1.768524, 1.74305, 1, 1, 1, 1, 1,
0.8584194, 1.389197, -1.42673, 1, 1, 1, 1, 1,
0.8605635, 0.8925394, 0.5519247, 1, 1, 1, 1, 1,
0.86601, 2.357498, 0.1916022, 1, 1, 1, 1, 1,
0.8692489, 0.4046762, -0.03323733, 1, 1, 1, 1, 1,
0.8700334, -0.04745715, 0.5796479, 1, 1, 1, 1, 1,
0.8743578, -1.013026, 1.989074, 1, 1, 1, 1, 1,
0.8792511, 0.8731357, 1.165443, 1, 1, 1, 1, 1,
0.8821564, -1.364185, 2.835135, 1, 1, 1, 1, 1,
0.889504, 1.543581, 2.901975, 1, 1, 1, 1, 1,
0.8920227, -0.6872039, 0.6086758, 0, 0, 1, 1, 1,
0.8937828, -0.8889283, 0.9231732, 1, 0, 0, 1, 1,
0.8957106, 0.9811252, 0.6324474, 1, 0, 0, 1, 1,
0.8973251, -0.1484241, 1.637833, 1, 0, 0, 1, 1,
0.9087004, -0.6472788, 2.292341, 1, 0, 0, 1, 1,
0.9099428, -0.8221234, 0.2453592, 1, 0, 0, 1, 1,
0.9258507, 3.248492, 0.4602875, 0, 0, 0, 1, 1,
0.9286618, -0.6677377, 2.47515, 0, 0, 0, 1, 1,
0.9363146, -0.8296453, 0.5246259, 0, 0, 0, 1, 1,
0.9436529, 0.4085812, 1.731685, 0, 0, 0, 1, 1,
0.9512765, 0.7411668, 1.00661, 0, 0, 0, 1, 1,
0.9515937, -0.16423, 1.230905, 0, 0, 0, 1, 1,
0.9598321, -0.07423668, 1.141637, 0, 0, 0, 1, 1,
0.9693088, 0.4977294, 0.09722886, 1, 1, 1, 1, 1,
0.9717413, 2.606802, 0.06428741, 1, 1, 1, 1, 1,
0.9719463, -0.804068, -0.2134314, 1, 1, 1, 1, 1,
0.9757686, -0.02570781, 2.06989, 1, 1, 1, 1, 1,
0.9831309, -0.6046375, 3.004071, 1, 1, 1, 1, 1,
0.9840031, -1.29321, 4.259377, 1, 1, 1, 1, 1,
0.9911436, -0.08764474, -0.5463727, 1, 1, 1, 1, 1,
0.9912876, -1.188281, 2.866569, 1, 1, 1, 1, 1,
0.9983931, -0.6466524, 2.89555, 1, 1, 1, 1, 1,
0.9991654, 1.396565, 2.492436, 1, 1, 1, 1, 1,
1.010693, -2.248862, 2.005487, 1, 1, 1, 1, 1,
1.016312, 0.2103229, 0.8550128, 1, 1, 1, 1, 1,
1.020757, 0.1041626, 0.1934967, 1, 1, 1, 1, 1,
1.022625, 0.5441753, 2.001026, 1, 1, 1, 1, 1,
1.028018, 0.3651325, 1.894612, 1, 1, 1, 1, 1,
1.030517, 0.2112759, 0.1215694, 0, 0, 1, 1, 1,
1.035927, 1.46718, -1.073875, 1, 0, 0, 1, 1,
1.037904, 0.6225663, 0.7342197, 1, 0, 0, 1, 1,
1.051451, 0.7434459, 0.5666732, 1, 0, 0, 1, 1,
1.055919, -0.7485615, 3.78767, 1, 0, 0, 1, 1,
1.059276, 0.5380127, 0.8421392, 1, 0, 0, 1, 1,
1.0599, 0.6725383, 1.781267, 0, 0, 0, 1, 1,
1.06818, 2.419443, 2.119006, 0, 0, 0, 1, 1,
1.084313, 1.167977, 0.7096115, 0, 0, 0, 1, 1,
1.084353, -0.2422861, 4.239182, 0, 0, 0, 1, 1,
1.090932, 0.7035639, 2.191313, 0, 0, 0, 1, 1,
1.093762, 0.2099171, 2.236711, 0, 0, 0, 1, 1,
1.093869, 0.2550756, 0.8936406, 0, 0, 0, 1, 1,
1.095359, 1.654338, -0.02009919, 1, 1, 1, 1, 1,
1.09755, -0.760462, 2.353634, 1, 1, 1, 1, 1,
1.103558, 0.3640089, 1.202823, 1, 1, 1, 1, 1,
1.106274, -0.423901, 1.546474, 1, 1, 1, 1, 1,
1.120059, 0.964037, 1.279595, 1, 1, 1, 1, 1,
1.121377, 1.545331, 0.121246, 1, 1, 1, 1, 1,
1.123317, -0.9995562, 1.486938, 1, 1, 1, 1, 1,
1.123789, -0.1118084, 0.7410935, 1, 1, 1, 1, 1,
1.128148, 1.007001, 1.68918, 1, 1, 1, 1, 1,
1.134746, 1.588364, 0.8060518, 1, 1, 1, 1, 1,
1.141109, 0.1483883, 2.541763, 1, 1, 1, 1, 1,
1.143944, 0.8597978, 0.9342777, 1, 1, 1, 1, 1,
1.151495, 1.369934, -2.136439, 1, 1, 1, 1, 1,
1.155973, -1.463603, 1.619598, 1, 1, 1, 1, 1,
1.167503, 1.139188, -0.01352313, 1, 1, 1, 1, 1,
1.167894, 0.9777815, 0.5721815, 0, 0, 1, 1, 1,
1.173018, -0.3999112, 1.679739, 1, 0, 0, 1, 1,
1.179844, -0.6982442, 0.525139, 1, 0, 0, 1, 1,
1.180412, 0.6562077, -0.5641762, 1, 0, 0, 1, 1,
1.181204, 2.141101, -0.2716257, 1, 0, 0, 1, 1,
1.18388, 0.3050296, 2.842568, 1, 0, 0, 1, 1,
1.203193, -1.177561, 2.859666, 0, 0, 0, 1, 1,
1.20411, 0.1603018, 0.5302466, 0, 0, 0, 1, 1,
1.223652, -1.097741, 3.613067, 0, 0, 0, 1, 1,
1.239778, 1.774781, 2.072112, 0, 0, 0, 1, 1,
1.243485, 0.05199704, 0.3269977, 0, 0, 0, 1, 1,
1.245256, -0.5854771, 1.751226, 0, 0, 0, 1, 1,
1.245367, -0.8850433, 2.392042, 0, 0, 0, 1, 1,
1.258238, 1.035306, 0.1186892, 1, 1, 1, 1, 1,
1.264957, -0.1050045, 3.079103, 1, 1, 1, 1, 1,
1.270374, -0.332829, 2.70722, 1, 1, 1, 1, 1,
1.280301, 1.128893, 1.394623, 1, 1, 1, 1, 1,
1.291677, -0.1681641, 0.7973812, 1, 1, 1, 1, 1,
1.300957, -0.312273, -0.3812654, 1, 1, 1, 1, 1,
1.30144, -0.3009619, 1.962979, 1, 1, 1, 1, 1,
1.304524, 1.08478, -0.003091731, 1, 1, 1, 1, 1,
1.304724, -0.917802, 2.109047, 1, 1, 1, 1, 1,
1.30944, -0.3746386, 1.18873, 1, 1, 1, 1, 1,
1.310455, -0.4158226, 2.45734, 1, 1, 1, 1, 1,
1.312669, 0.0885226, 2.015246, 1, 1, 1, 1, 1,
1.313055, -1.067003, 1.395819, 1, 1, 1, 1, 1,
1.313521, 0.406227, 0.1997811, 1, 1, 1, 1, 1,
1.314935, -0.01157562, 0.3143933, 1, 1, 1, 1, 1,
1.323479, -0.3003663, 2.114601, 0, 0, 1, 1, 1,
1.327614, 0.3372532, -0.04976512, 1, 0, 0, 1, 1,
1.327879, 0.9843193, 2.49472, 1, 0, 0, 1, 1,
1.332042, 0.0249588, 1.621113, 1, 0, 0, 1, 1,
1.343, 0.683558, 2.077423, 1, 0, 0, 1, 1,
1.344722, 0.1344923, 1.232636, 1, 0, 0, 1, 1,
1.346739, 1.093339, 0.976712, 0, 0, 0, 1, 1,
1.353218, 1.043989, -0.6601809, 0, 0, 0, 1, 1,
1.353815, 0.6406506, 1.938971, 0, 0, 0, 1, 1,
1.362427, -0.2768842, 2.18672, 0, 0, 0, 1, 1,
1.363621, 0.390349, -0.9693509, 0, 0, 0, 1, 1,
1.372269, 0.6931622, 0.6185056, 0, 0, 0, 1, 1,
1.375034, 1.466548, 0.6389775, 0, 0, 0, 1, 1,
1.379145, -0.2497256, 0.4278049, 1, 1, 1, 1, 1,
1.385038, -0.06489071, 2.652771, 1, 1, 1, 1, 1,
1.387473, -0.4348006, 0.730291, 1, 1, 1, 1, 1,
1.409912, -0.6093316, 3.274701, 1, 1, 1, 1, 1,
1.410871, 1.89651, 2.103071, 1, 1, 1, 1, 1,
1.41359, 1.073884, 2.878473, 1, 1, 1, 1, 1,
1.437466, -0.2761713, -0.2425261, 1, 1, 1, 1, 1,
1.440518, -0.243613, 1.765503, 1, 1, 1, 1, 1,
1.442146, -0.9490267, 3.890091, 1, 1, 1, 1, 1,
1.442649, 1.625652, 0.2002176, 1, 1, 1, 1, 1,
1.444317, 0.4482985, 0.9320517, 1, 1, 1, 1, 1,
1.447738, 0.9271216, 1.93672, 1, 1, 1, 1, 1,
1.45477, 0.08618325, 2.214092, 1, 1, 1, 1, 1,
1.458589, -2.241282, 1.580097, 1, 1, 1, 1, 1,
1.463548, -0.6310065, 1.661994, 1, 1, 1, 1, 1,
1.465194, -1.20744, 2.107379, 0, 0, 1, 1, 1,
1.480775, 0.570602, 1.726605, 1, 0, 0, 1, 1,
1.489855, -0.8505878, 2.214445, 1, 0, 0, 1, 1,
1.496168, 0.1852215, 1.558055, 1, 0, 0, 1, 1,
1.501828, -0.6278393, 1.488349, 1, 0, 0, 1, 1,
1.518862, -0.8640381, 0.9881692, 1, 0, 0, 1, 1,
1.528046, -0.2508518, -0.3330628, 0, 0, 0, 1, 1,
1.542771, 0.7598191, 2.570934, 0, 0, 0, 1, 1,
1.548529, -0.9944321, 3.45785, 0, 0, 0, 1, 1,
1.548658, 0.5850821, 1.126897, 0, 0, 0, 1, 1,
1.557207, 1.862338, 1.610498, 0, 0, 0, 1, 1,
1.564727, -0.4268176, 1.838462, 0, 0, 0, 1, 1,
1.565876, 0.1758341, 0.2792159, 0, 0, 0, 1, 1,
1.568997, 0.3308789, 2.775858, 1, 1, 1, 1, 1,
1.572577, -0.5310197, 4.727824, 1, 1, 1, 1, 1,
1.584321, -0.345402, 2.182084, 1, 1, 1, 1, 1,
1.584921, 0.1253677, 1.946385, 1, 1, 1, 1, 1,
1.617978, -0.4931503, 1.977412, 1, 1, 1, 1, 1,
1.62515, -0.4933871, 1.954073, 1, 1, 1, 1, 1,
1.631478, -0.3867801, 2.291755, 1, 1, 1, 1, 1,
1.634559, 0.1255126, 1.919475, 1, 1, 1, 1, 1,
1.672966, 0.9768386, -0.6087619, 1, 1, 1, 1, 1,
1.678788, 0.8447263, 2.42952, 1, 1, 1, 1, 1,
1.682334, 0.552057, 2.436347, 1, 1, 1, 1, 1,
1.683474, 0.02554451, 2.129866, 1, 1, 1, 1, 1,
1.689387, -1.416452, 2.424938, 1, 1, 1, 1, 1,
1.710077, -0.03877526, 2.271293, 1, 1, 1, 1, 1,
1.71129, 0.09181985, 1.176606, 1, 1, 1, 1, 1,
1.713979, -0.01948078, 0.0282282, 0, 0, 1, 1, 1,
1.726659, 0.001983958, 0.7900867, 1, 0, 0, 1, 1,
1.748643, -0.9704103, 3.17899, 1, 0, 0, 1, 1,
1.75497, 1.326567, 1.564394, 1, 0, 0, 1, 1,
1.771291, 0.4695188, -1.096271, 1, 0, 0, 1, 1,
1.781983, -1.142704, 2.047465, 1, 0, 0, 1, 1,
1.812052, -0.02338262, 1.958083, 0, 0, 0, 1, 1,
1.823934, 0.6570216, -0.5702527, 0, 0, 0, 1, 1,
1.86205, -0.9098037, 1.939719, 0, 0, 0, 1, 1,
1.864514, -0.59192, 2.065945, 0, 0, 0, 1, 1,
1.871639, 0.5292255, 2.132507, 0, 0, 0, 1, 1,
1.891882, 0.06380963, 0.6702888, 0, 0, 0, 1, 1,
1.896209, 1.157982, 0.5941622, 0, 0, 0, 1, 1,
1.968086, 1.391116, 2.212528, 1, 1, 1, 1, 1,
1.972975, -1.204147, 2.22999, 1, 1, 1, 1, 1,
1.980882, -1.365291, 1.360425, 1, 1, 1, 1, 1,
1.983296, 1.461694, -0.2928117, 1, 1, 1, 1, 1,
1.983384, 0.6695251, 1.493104, 1, 1, 1, 1, 1,
1.993166, 0.03797467, 3.650505, 1, 1, 1, 1, 1,
2.012518, 1.438849, 1.197449, 1, 1, 1, 1, 1,
2.014188, -2.032257, 2.031249, 1, 1, 1, 1, 1,
2.016096, 0.4715152, -0.2643523, 1, 1, 1, 1, 1,
2.037528, 0.6324922, 1.757262, 1, 1, 1, 1, 1,
2.060968, 0.2146468, 1.352487, 1, 1, 1, 1, 1,
2.077693, -1.064818, 2.336253, 1, 1, 1, 1, 1,
2.161189, -0.208134, 0.1704654, 1, 1, 1, 1, 1,
2.196218, -0.2007494, 2.041893, 1, 1, 1, 1, 1,
2.216849, -0.08288145, 1.331179, 1, 1, 1, 1, 1,
2.23964, -1.595623, -0.5180577, 0, 0, 1, 1, 1,
2.264689, -1.422381, 1.009371, 1, 0, 0, 1, 1,
2.268833, 1.404917, 1.963841, 1, 0, 0, 1, 1,
2.274166, 0.8549384, 0.1163845, 1, 0, 0, 1, 1,
2.292456, -0.06490222, 0.7305991, 1, 0, 0, 1, 1,
2.344037, -1.481984, 2.084952, 1, 0, 0, 1, 1,
2.384366, 0.8039736, 1.346889, 0, 0, 0, 1, 1,
2.480119, 1.774136, 0.3396127, 0, 0, 0, 1, 1,
2.538251, -0.337001, 1.216031, 0, 0, 0, 1, 1,
2.585781, 0.3892508, 1.086136, 0, 0, 0, 1, 1,
2.603455, -1.015053, 2.223321, 0, 0, 0, 1, 1,
2.63409, -1.452604, 1.983809, 0, 0, 0, 1, 1,
2.678411, 1.142387, 1.945529, 0, 0, 0, 1, 1,
2.773305, 0.4971703, 0.5598521, 1, 1, 1, 1, 1,
2.919731, 1.6208, 2.779763, 1, 1, 1, 1, 1,
2.932184, -1.138613, 2.776526, 1, 1, 1, 1, 1,
2.956271, 0.1883705, 2.183328, 1, 1, 1, 1, 1,
3.041814, -0.05117065, 0.648742, 1, 1, 1, 1, 1,
3.211689, -0.2692239, -0.429161, 1, 1, 1, 1, 1,
3.223992, 1.229875, 2.454167, 1, 1, 1, 1, 1
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
var radius = 9.735045;
var distance = 34.19394;
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
mvMatrix.translate( -0.04170847, -0.002104759, 0.6808162 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.19394);
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
