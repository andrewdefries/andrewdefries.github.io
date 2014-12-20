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
-3.630922, -0.08956421, -0.01976405, 1, 0, 0, 1,
-3.202075, 0.2158576, -3.425891, 1, 0.007843138, 0, 1,
-3.175915, 0.9507917, -0.859591, 1, 0.01176471, 0, 1,
-2.776436, -1.011602, -1.801419, 1, 0.01960784, 0, 1,
-2.68001, 0.8166456, -1.219241, 1, 0.02352941, 0, 1,
-2.51975, -0.5688663, -1.556341, 1, 0.03137255, 0, 1,
-2.47548, -0.03632118, -0.5055482, 1, 0.03529412, 0, 1,
-2.374547, -0.7896844, -1.735041, 1, 0.04313726, 0, 1,
-2.27278, 1.011541, -0.874081, 1, 0.04705882, 0, 1,
-2.265745, -1.353272, -4.113285, 1, 0.05490196, 0, 1,
-2.23164, -0.8189256, -0.4181569, 1, 0.05882353, 0, 1,
-2.201802, 0.608691, -2.943336, 1, 0.06666667, 0, 1,
-2.180142, 0.07062578, -2.307871, 1, 0.07058824, 0, 1,
-2.163233, -0.3492113, -2.812102, 1, 0.07843138, 0, 1,
-2.149947, -0.4176716, -2.808037, 1, 0.08235294, 0, 1,
-2.077503, 0.1122789, -2.123796, 1, 0.09019608, 0, 1,
-2.058542, 0.7149881, -0.6748464, 1, 0.09411765, 0, 1,
-2.050021, -0.5101553, -0.5886409, 1, 0.1019608, 0, 1,
-2.016531, 0.4085774, -2.316446, 1, 0.1098039, 0, 1,
-2.013933, 0.8482772, -2.96982, 1, 0.1137255, 0, 1,
-1.990967, -0.4939887, -1.700619, 1, 0.1215686, 0, 1,
-1.981137, 1.641131, -2.20108, 1, 0.1254902, 0, 1,
-1.974759, 0.1499914, -1.547966, 1, 0.1333333, 0, 1,
-1.949073, -2.288483, -0.9466513, 1, 0.1372549, 0, 1,
-1.94885, -0.6956549, -3.981612, 1, 0.145098, 0, 1,
-1.933166, -0.7164029, -2.548372, 1, 0.1490196, 0, 1,
-1.93114, 0.94381, -2.389266, 1, 0.1568628, 0, 1,
-1.908577, -0.4860942, -1.523857, 1, 0.1607843, 0, 1,
-1.898932, -0.2614276, -2.240189, 1, 0.1686275, 0, 1,
-1.898542, -0.7353984, -1.256568, 1, 0.172549, 0, 1,
-1.893917, -1.325692, -1.716819, 1, 0.1803922, 0, 1,
-1.856338, -0.5740193, -0.1211521, 1, 0.1843137, 0, 1,
-1.829665, 0.4903897, -0.6009909, 1, 0.1921569, 0, 1,
-1.828367, 1.561403, -1.841484, 1, 0.1960784, 0, 1,
-1.818348, 1.442988, -1.193298, 1, 0.2039216, 0, 1,
-1.818048, -0.5253097, -3.33595, 1, 0.2117647, 0, 1,
-1.813774, -1.097684, -1.375014, 1, 0.2156863, 0, 1,
-1.805419, -1.358292, -3.351137, 1, 0.2235294, 0, 1,
-1.788156, -1.07278, -1.884927, 1, 0.227451, 0, 1,
-1.775512, 1.742924, -1.580943, 1, 0.2352941, 0, 1,
-1.769262, 0.2864468, -1.947672, 1, 0.2392157, 0, 1,
-1.752754, -1.706709, -2.170509, 1, 0.2470588, 0, 1,
-1.733856, -1.266582, -1.807149, 1, 0.2509804, 0, 1,
-1.72199, -0.9557803, -1.723846, 1, 0.2588235, 0, 1,
-1.721525, 0.4806453, 0.5187563, 1, 0.2627451, 0, 1,
-1.7143, 1.66299, -1.539796, 1, 0.2705882, 0, 1,
-1.709882, 1.617487, -1.89761, 1, 0.2745098, 0, 1,
-1.701679, 0.29201, -1.303917, 1, 0.282353, 0, 1,
-1.700619, -0.5488709, -2.307562, 1, 0.2862745, 0, 1,
-1.695118, -1.406177, -2.16392, 1, 0.2941177, 0, 1,
-1.688393, -1.231493, -1.943785, 1, 0.3019608, 0, 1,
-1.683657, -0.2560157, -1.492125, 1, 0.3058824, 0, 1,
-1.669188, -0.7839016, -0.8253691, 1, 0.3137255, 0, 1,
-1.652516, -1.869082, -4.974939, 1, 0.3176471, 0, 1,
-1.645939, -0.5867954, -0.3947644, 1, 0.3254902, 0, 1,
-1.637619, 1.303997, -0.8227961, 1, 0.3294118, 0, 1,
-1.629452, -1.060152, -0.8901028, 1, 0.3372549, 0, 1,
-1.617894, -0.4678019, -0.8789941, 1, 0.3411765, 0, 1,
-1.61741, 0.572255, -0.6123329, 1, 0.3490196, 0, 1,
-1.614849, 0.8291221, 0.9395608, 1, 0.3529412, 0, 1,
-1.603539, -0.9913043, -3.362554, 1, 0.3607843, 0, 1,
-1.593163, -0.3045379, -1.506444, 1, 0.3647059, 0, 1,
-1.580337, -0.2033272, -1.927024, 1, 0.372549, 0, 1,
-1.570998, 0.5161191, -0.6840044, 1, 0.3764706, 0, 1,
-1.558384, -0.5261028, -2.858283, 1, 0.3843137, 0, 1,
-1.55568, 1.001692, 0.2235112, 1, 0.3882353, 0, 1,
-1.550915, -1.257277, -2.567846, 1, 0.3960784, 0, 1,
-1.519709, 1.0312, -0.3378316, 1, 0.4039216, 0, 1,
-1.51911, -0.5286411, -2.059641, 1, 0.4078431, 0, 1,
-1.478568, 0.3153417, -2.013172, 1, 0.4156863, 0, 1,
-1.471404, 1.163629, 1.391976, 1, 0.4196078, 0, 1,
-1.471071, 0.09748073, -1.56111, 1, 0.427451, 0, 1,
-1.470157, 0.2092576, 0.09333187, 1, 0.4313726, 0, 1,
-1.461987, -0.5836162, -0.9484791, 1, 0.4392157, 0, 1,
-1.439641, -0.531986, -1.130027, 1, 0.4431373, 0, 1,
-1.433049, -0.141905, -2.048053, 1, 0.4509804, 0, 1,
-1.426935, -0.2436749, -3.246001, 1, 0.454902, 0, 1,
-1.409308, -0.574615, -2.38627, 1, 0.4627451, 0, 1,
-1.394357, -2.217639, -2.8781, 1, 0.4666667, 0, 1,
-1.394125, -0.5818164, -1.376421, 1, 0.4745098, 0, 1,
-1.391167, -0.8159363, -2.242032, 1, 0.4784314, 0, 1,
-1.389437, -0.80316, -2.553296, 1, 0.4862745, 0, 1,
-1.388613, 1.053451, -2.215653, 1, 0.4901961, 0, 1,
-1.385901, 0.5184683, -2.603764, 1, 0.4980392, 0, 1,
-1.38206, -0.3508582, -2.971036, 1, 0.5058824, 0, 1,
-1.380454, 0.4115437, 0.4953765, 1, 0.509804, 0, 1,
-1.371711, -1.287235, -2.944585, 1, 0.5176471, 0, 1,
-1.361635, -0.5464638, -3.240631, 1, 0.5215687, 0, 1,
-1.356024, -0.6791068, -0.4358528, 1, 0.5294118, 0, 1,
-1.350814, 0.01049855, -1.531925, 1, 0.5333334, 0, 1,
-1.34735, 1.199483, -0.5128747, 1, 0.5411765, 0, 1,
-1.339092, 2.331761, -1.564544, 1, 0.5450981, 0, 1,
-1.337312, -1.040326, -3.458088, 1, 0.5529412, 0, 1,
-1.336973, -0.5043002, -1.9131, 1, 0.5568628, 0, 1,
-1.335454, 0.5973865, -1.789671, 1, 0.5647059, 0, 1,
-1.334855, -0.1780175, -1.945194, 1, 0.5686275, 0, 1,
-1.331407, -1.278687, -2.051774, 1, 0.5764706, 0, 1,
-1.324799, 0.2573707, -0.4718077, 1, 0.5803922, 0, 1,
-1.31132, 0.02415027, -2.707644, 1, 0.5882353, 0, 1,
-1.311005, 0.5684921, -2.990101, 1, 0.5921569, 0, 1,
-1.306128, 1.725975, 0.6698985, 1, 0.6, 0, 1,
-1.302747, 0.2184012, -1.626632, 1, 0.6078432, 0, 1,
-1.296762, -0.4872404, -4.125838, 1, 0.6117647, 0, 1,
-1.266595, 0.2099309, 0.7884114, 1, 0.6196079, 0, 1,
-1.263389, -0.4152473, -0.5444662, 1, 0.6235294, 0, 1,
-1.254037, 0.7793987, -0.5470079, 1, 0.6313726, 0, 1,
-1.253256, -1.423389, -2.199835, 1, 0.6352941, 0, 1,
-1.253026, 1.418845, 0.3920324, 1, 0.6431373, 0, 1,
-1.252311, -1.040965, -1.742891, 1, 0.6470588, 0, 1,
-1.250216, 0.5750771, -2.875206, 1, 0.654902, 0, 1,
-1.23542, 0.5819047, 0.8570928, 1, 0.6588235, 0, 1,
-1.229708, 1.699162, -1.700295, 1, 0.6666667, 0, 1,
-1.22851, -0.1400415, -0.9160168, 1, 0.6705883, 0, 1,
-1.226754, -0.621639, -2.134135, 1, 0.6784314, 0, 1,
-1.221326, -1.636391, -1.973339, 1, 0.682353, 0, 1,
-1.214296, 0.03785922, -1.856791, 1, 0.6901961, 0, 1,
-1.21379, -0.06427562, -2.051684, 1, 0.6941177, 0, 1,
-1.206176, -1.049939, -2.890298, 1, 0.7019608, 0, 1,
-1.205791, 1.681697, 1.997651, 1, 0.7098039, 0, 1,
-1.203642, 0.05883297, -2.69386, 1, 0.7137255, 0, 1,
-1.197831, 0.3180445, -2.336177, 1, 0.7215686, 0, 1,
-1.196293, 0.493104, -0.04370277, 1, 0.7254902, 0, 1,
-1.18139, 0.522785, -2.981833, 1, 0.7333333, 0, 1,
-1.162685, 0.3359775, -1.623243, 1, 0.7372549, 0, 1,
-1.152377, -0.367694, -1.013577, 1, 0.7450981, 0, 1,
-1.139921, 0.1276176, -3.15301, 1, 0.7490196, 0, 1,
-1.138523, -0.2275348, -1.304009, 1, 0.7568628, 0, 1,
-1.136292, 0.5883369, -0.04321682, 1, 0.7607843, 0, 1,
-1.135597, -0.6941335, -0.8520059, 1, 0.7686275, 0, 1,
-1.130822, 0.6423455, -2.464947, 1, 0.772549, 0, 1,
-1.129207, 2.78693, 0.6203855, 1, 0.7803922, 0, 1,
-1.125875, 0.2609382, -2.112045, 1, 0.7843137, 0, 1,
-1.111677, 1.8716, 0.3757579, 1, 0.7921569, 0, 1,
-1.11002, -1.81615, -3.091039, 1, 0.7960784, 0, 1,
-1.098466, 0.7589574, -1.114672, 1, 0.8039216, 0, 1,
-1.093446, 1.788141, -1.815427, 1, 0.8117647, 0, 1,
-1.086737, 0.6590208, -1.520208, 1, 0.8156863, 0, 1,
-1.078175, 0.1388359, -2.253586, 1, 0.8235294, 0, 1,
-1.078065, 0.9460567, -1.450474, 1, 0.827451, 0, 1,
-1.065027, 1.946289, -1.288555, 1, 0.8352941, 0, 1,
-1.062473, 1.122731, -0.8907259, 1, 0.8392157, 0, 1,
-1.040474, 1.315564, -1.593697, 1, 0.8470588, 0, 1,
-1.039875, 1.307495, -0.3226757, 1, 0.8509804, 0, 1,
-1.038872, 0.896154, -0.7815885, 1, 0.8588235, 0, 1,
-1.036807, 0.2139439, -0.4779484, 1, 0.8627451, 0, 1,
-1.033399, -0.1394482, 0.2209853, 1, 0.8705882, 0, 1,
-1.033096, -0.06227669, -1.27788, 1, 0.8745098, 0, 1,
-1.030544, -0.312655, -2.768858, 1, 0.8823529, 0, 1,
-1.029763, -1.938497, -3.057992, 1, 0.8862745, 0, 1,
-1.014647, 0.3785342, -2.369674, 1, 0.8941177, 0, 1,
-1.012367, 0.8670382, -1.235121, 1, 0.8980392, 0, 1,
-1.011402, -0.7231858, -2.941107, 1, 0.9058824, 0, 1,
-1.009369, -0.9301929, -1.502036, 1, 0.9137255, 0, 1,
-1.006454, -0.374549, -1.412329, 1, 0.9176471, 0, 1,
-1.006439, -1.843648, -3.205571, 1, 0.9254902, 0, 1,
-1.004882, -0.03588914, -1.953096, 1, 0.9294118, 0, 1,
-0.9992275, 1.450217, 0.7234153, 1, 0.9372549, 0, 1,
-0.9952518, 0.4628169, -1.903169, 1, 0.9411765, 0, 1,
-0.9869041, 0.4857982, -1.808278, 1, 0.9490196, 0, 1,
-0.9861301, -0.9210421, -4.433887, 1, 0.9529412, 0, 1,
-0.9848278, -0.8885181, -1.655689, 1, 0.9607843, 0, 1,
-0.9834776, 0.03807195, -1.413272, 1, 0.9647059, 0, 1,
-0.9804829, 1.418976, -0.7983614, 1, 0.972549, 0, 1,
-0.9800001, -0.707439, -4.11524, 1, 0.9764706, 0, 1,
-0.9789935, -0.3537625, -4.482871, 1, 0.9843137, 0, 1,
-0.9713801, -0.9705797, -3.337455, 1, 0.9882353, 0, 1,
-0.9679529, 0.5143645, -1.156308, 1, 0.9960784, 0, 1,
-0.9648933, -0.1421807, -0.3870826, 0.9960784, 1, 0, 1,
-0.9620821, -0.3826144, -2.642553, 0.9921569, 1, 0, 1,
-0.9613557, -0.009741464, -1.1426, 0.9843137, 1, 0, 1,
-0.9575638, -0.6556205, -2.080313, 0.9803922, 1, 0, 1,
-0.9548686, 0.01884945, -4.395154, 0.972549, 1, 0, 1,
-0.9483212, 1.45587, -1.755842, 0.9686275, 1, 0, 1,
-0.9409803, -0.02258313, -1.85289, 0.9607843, 1, 0, 1,
-0.9384661, 0.9806401, -1.413864, 0.9568627, 1, 0, 1,
-0.9371567, 0.2530791, -2.539188, 0.9490196, 1, 0, 1,
-0.9351458, -0.3755444, -2.051986, 0.945098, 1, 0, 1,
-0.9347576, 0.6252837, -1.544773, 0.9372549, 1, 0, 1,
-0.9279198, 1.06355, -1.675062, 0.9333333, 1, 0, 1,
-0.9253612, 0.01968526, -2.118808, 0.9254902, 1, 0, 1,
-0.9233569, -0.2674983, -0.7776543, 0.9215686, 1, 0, 1,
-0.9224306, -0.4554458, -2.137898, 0.9137255, 1, 0, 1,
-0.9202797, 1.983592, -1.323128, 0.9098039, 1, 0, 1,
-0.9194598, -1.053007, -0.4591017, 0.9019608, 1, 0, 1,
-0.9169698, 1.200122, 0.6992061, 0.8941177, 1, 0, 1,
-0.9142959, -0.865766, -1.081022, 0.8901961, 1, 0, 1,
-0.8963785, -0.3484045, -1.034405, 0.8823529, 1, 0, 1,
-0.8946908, 0.8790379, -0.9845896, 0.8784314, 1, 0, 1,
-0.8864251, 0.290204, -0.1947248, 0.8705882, 1, 0, 1,
-0.8854625, -0.2889591, -1.2061, 0.8666667, 1, 0, 1,
-0.8841897, -0.23207, -2.78284, 0.8588235, 1, 0, 1,
-0.8830784, 0.1136765, -1.541768, 0.854902, 1, 0, 1,
-0.8790447, -1.461362, -1.538141, 0.8470588, 1, 0, 1,
-0.8745369, 0.4481803, -0.1497198, 0.8431373, 1, 0, 1,
-0.8722589, 0.08959404, -0.81072, 0.8352941, 1, 0, 1,
-0.8714016, -0.8689513, -0.9047292, 0.8313726, 1, 0, 1,
-0.870856, -0.7505718, -2.841181, 0.8235294, 1, 0, 1,
-0.8662199, -0.142655, -1.349125, 0.8196079, 1, 0, 1,
-0.8618897, 0.3985128, -0.5957531, 0.8117647, 1, 0, 1,
-0.8604355, 0.576941, -1.543282, 0.8078431, 1, 0, 1,
-0.858385, 0.198026, 0.003863548, 0.8, 1, 0, 1,
-0.8581032, -1.709846, -3.081316, 0.7921569, 1, 0, 1,
-0.8553029, -0.6696371, -2.040997, 0.7882353, 1, 0, 1,
-0.8545694, 0.8730376, 0.4330215, 0.7803922, 1, 0, 1,
-0.8543542, 1.568093, 0.3965136, 0.7764706, 1, 0, 1,
-0.8535559, 1.135038, -0.398742, 0.7686275, 1, 0, 1,
-0.8493301, -0.04619675, -2.399691, 0.7647059, 1, 0, 1,
-0.8467792, 0.4282252, -2.419785, 0.7568628, 1, 0, 1,
-0.8317462, -1.151911, -2.208263, 0.7529412, 1, 0, 1,
-0.8308402, -0.9535499, -2.232185, 0.7450981, 1, 0, 1,
-0.8302127, 0.9554302, -0.8954111, 0.7411765, 1, 0, 1,
-0.8290427, 1.558383, -0.6301361, 0.7333333, 1, 0, 1,
-0.8278887, -1.001094, -2.071326, 0.7294118, 1, 0, 1,
-0.8237066, -0.6391541, -1.25083, 0.7215686, 1, 0, 1,
-0.8201834, -0.08167724, -1.201172, 0.7176471, 1, 0, 1,
-0.8200316, -0.6193817, -1.3759, 0.7098039, 1, 0, 1,
-0.8172289, -3.057019, -0.7489007, 0.7058824, 1, 0, 1,
-0.8110703, 0.394751, -2.768893, 0.6980392, 1, 0, 1,
-0.8093951, -0.4609443, -1.661009, 0.6901961, 1, 0, 1,
-0.8093323, -0.3980088, -1.363264, 0.6862745, 1, 0, 1,
-0.8070028, -0.7055196, -1.463885, 0.6784314, 1, 0, 1,
-0.7997233, 0.090653, -1.897104, 0.6745098, 1, 0, 1,
-0.7916034, 0.4186044, -0.2243052, 0.6666667, 1, 0, 1,
-0.7851027, 1.047608, -2.007036, 0.6627451, 1, 0, 1,
-0.7804424, 0.1686536, 0.1161068, 0.654902, 1, 0, 1,
-0.7802823, 1.470059, 1.012795, 0.6509804, 1, 0, 1,
-0.7784625, -0.2975183, -1.568883, 0.6431373, 1, 0, 1,
-0.7751294, -0.4429934, -2.011081, 0.6392157, 1, 0, 1,
-0.7678092, 0.02644287, -1.228542, 0.6313726, 1, 0, 1,
-0.7662593, 0.06946716, -1.475182, 0.627451, 1, 0, 1,
-0.7661849, 0.1308225, 0.1660284, 0.6196079, 1, 0, 1,
-0.7661433, -1.043599, -3.134789, 0.6156863, 1, 0, 1,
-0.7558956, 2.357215, 1.108305, 0.6078432, 1, 0, 1,
-0.7523986, 0.4617657, -1.931252, 0.6039216, 1, 0, 1,
-0.7503098, 0.9743285, -1.951073, 0.5960785, 1, 0, 1,
-0.7499005, -0.196625, -1.933517, 0.5882353, 1, 0, 1,
-0.7497213, 1.035138, -0.583849, 0.5843138, 1, 0, 1,
-0.7488035, -0.5829864, -1.956869, 0.5764706, 1, 0, 1,
-0.745029, -0.4371082, -2.098623, 0.572549, 1, 0, 1,
-0.7449029, -1.947733, -3.245216, 0.5647059, 1, 0, 1,
-0.7389032, -1.936384, -3.005761, 0.5607843, 1, 0, 1,
-0.7372557, -0.6148832, -2.159956, 0.5529412, 1, 0, 1,
-0.7324318, 0.5168968, -0.5280002, 0.5490196, 1, 0, 1,
-0.7316806, -0.3816215, -1.888762, 0.5411765, 1, 0, 1,
-0.7249001, -0.5489196, -1.239923, 0.5372549, 1, 0, 1,
-0.7199053, 0.5818719, -0.8821081, 0.5294118, 1, 0, 1,
-0.7183029, 0.01425994, -2.855176, 0.5254902, 1, 0, 1,
-0.7165508, 0.6808042, 0.8643409, 0.5176471, 1, 0, 1,
-0.7160506, -0.9111591, -3.191761, 0.5137255, 1, 0, 1,
-0.7128432, 1.001341, -2.42657, 0.5058824, 1, 0, 1,
-0.7101614, -0.4574084, -3.062992, 0.5019608, 1, 0, 1,
-0.7082223, -0.7777504, -2.554451, 0.4941176, 1, 0, 1,
-0.7043898, -0.2098581, -0.06457896, 0.4862745, 1, 0, 1,
-0.6977354, -0.3228779, -1.645306, 0.4823529, 1, 0, 1,
-0.6942917, 0.1677808, -3.112436, 0.4745098, 1, 0, 1,
-0.6929787, -0.001140415, -0.8844688, 0.4705882, 1, 0, 1,
-0.6884335, -0.5060077, -2.449505, 0.4627451, 1, 0, 1,
-0.6760795, -1.581768, -2.416062, 0.4588235, 1, 0, 1,
-0.6717792, 1.351601, -2.646174, 0.4509804, 1, 0, 1,
-0.667057, -0.1563357, -3.845966, 0.4470588, 1, 0, 1,
-0.6658418, -1.329447, -2.525475, 0.4392157, 1, 0, 1,
-0.665792, -0.3759049, -1.8952, 0.4352941, 1, 0, 1,
-0.6645011, -0.2478696, -1.742363, 0.427451, 1, 0, 1,
-0.6630298, 1.466465, -0.5848018, 0.4235294, 1, 0, 1,
-0.6623636, 2.006678, -1.712882, 0.4156863, 1, 0, 1,
-0.6621082, 0.6313538, -1.027502, 0.4117647, 1, 0, 1,
-0.6587697, -0.6651408, -1.500664, 0.4039216, 1, 0, 1,
-0.6551832, -0.2489328, -2.577503, 0.3960784, 1, 0, 1,
-0.6549861, 0.3037007, -2.559041, 0.3921569, 1, 0, 1,
-0.6464828, 0.2228241, -0.3663336, 0.3843137, 1, 0, 1,
-0.6450536, -0.9148285, -0.04854264, 0.3803922, 1, 0, 1,
-0.6445255, -1.131957, -0.9973613, 0.372549, 1, 0, 1,
-0.6439079, -0.7205027, 0.359545, 0.3686275, 1, 0, 1,
-0.6437843, 0.1581729, -0.1939665, 0.3607843, 1, 0, 1,
-0.6399279, -1.286878, -3.034189, 0.3568628, 1, 0, 1,
-0.6393535, -0.5747628, -1.243919, 0.3490196, 1, 0, 1,
-0.6342853, 1.982153, 0.7650347, 0.345098, 1, 0, 1,
-0.6303714, -0.2532164, -3.063495, 0.3372549, 1, 0, 1,
-0.625257, -2.465547, -3.567662, 0.3333333, 1, 0, 1,
-0.6248636, 1.462471, 0.9888918, 0.3254902, 1, 0, 1,
-0.6211774, 0.3133739, -2.980524, 0.3215686, 1, 0, 1,
-0.6139062, -0.1466098, -2.819542, 0.3137255, 1, 0, 1,
-0.6049227, -1.612831, -1.017138, 0.3098039, 1, 0, 1,
-0.5967654, 0.4707671, -0.7458028, 0.3019608, 1, 0, 1,
-0.5958403, -0.3084339, -1.00855, 0.2941177, 1, 0, 1,
-0.5936326, 0.3639963, -1.374458, 0.2901961, 1, 0, 1,
-0.5896804, -0.1576168, -2.16412, 0.282353, 1, 0, 1,
-0.5885621, 1.419103, -1.819033, 0.2784314, 1, 0, 1,
-0.5773827, -0.9176281, -1.624631, 0.2705882, 1, 0, 1,
-0.5726319, -0.8223909, -3.687418, 0.2666667, 1, 0, 1,
-0.572419, -0.6536663, -3.221098, 0.2588235, 1, 0, 1,
-0.5698859, 0.371713, -0.6952835, 0.254902, 1, 0, 1,
-0.5697671, 0.4758333, -0.02509064, 0.2470588, 1, 0, 1,
-0.5691492, -1.698083, -3.301405, 0.2431373, 1, 0, 1,
-0.5658054, 1.012537, -1.793798, 0.2352941, 1, 0, 1,
-0.5629867, 0.08563578, -2.042485, 0.2313726, 1, 0, 1,
-0.5622936, 0.5651955, -2.883023, 0.2235294, 1, 0, 1,
-0.5599513, -0.1730055, -0.3650933, 0.2196078, 1, 0, 1,
-0.5579106, -0.4482134, -2.24637, 0.2117647, 1, 0, 1,
-0.5577663, 1.32781, -0.9489743, 0.2078431, 1, 0, 1,
-0.5561342, 0.00653967, 0.5675121, 0.2, 1, 0, 1,
-0.5558558, 0.297569, -0.2320779, 0.1921569, 1, 0, 1,
-0.5549456, 0.1500738, 0.04783622, 0.1882353, 1, 0, 1,
-0.5461534, 0.08736516, -1.047779, 0.1803922, 1, 0, 1,
-0.5412241, -1.022912, -3.061852, 0.1764706, 1, 0, 1,
-0.5407299, -0.449826, -1.178022, 0.1686275, 1, 0, 1,
-0.5381057, -0.721314, -3.056365, 0.1647059, 1, 0, 1,
-0.537865, -0.8614059, -1.977262, 0.1568628, 1, 0, 1,
-0.5356887, -0.03610018, -1.397572, 0.1529412, 1, 0, 1,
-0.535132, -0.9061996, -4.135255, 0.145098, 1, 0, 1,
-0.5340987, -2.104773, -2.739738, 0.1411765, 1, 0, 1,
-0.5324319, 1.479577, -1.281755, 0.1333333, 1, 0, 1,
-0.5320677, 1.249913, -0.1877049, 0.1294118, 1, 0, 1,
-0.5263899, -0.002562918, -1.826102, 0.1215686, 1, 0, 1,
-0.5241002, -0.2864916, -0.5176305, 0.1176471, 1, 0, 1,
-0.52227, 0.8163687, -0.9480173, 0.1098039, 1, 0, 1,
-0.5189798, -0.8395662, -2.624402, 0.1058824, 1, 0, 1,
-0.5164781, 1.216178, 0.2774702, 0.09803922, 1, 0, 1,
-0.5117465, 1.812411, 0.2896562, 0.09019608, 1, 0, 1,
-0.5061116, 0.8413087, 0.1754062, 0.08627451, 1, 0, 1,
-0.5042189, 0.1348077, -0.1040505, 0.07843138, 1, 0, 1,
-0.5011584, 1.000096, -0.159077, 0.07450981, 1, 0, 1,
-0.5002121, 0.3098814, -1.039682, 0.06666667, 1, 0, 1,
-0.4999873, 0.08070131, -1.618561, 0.0627451, 1, 0, 1,
-0.4964553, 2.093422, 1.264492, 0.05490196, 1, 0, 1,
-0.4945489, 0.6529945, -1.189663, 0.05098039, 1, 0, 1,
-0.4922326, -0.1241196, -2.237599, 0.04313726, 1, 0, 1,
-0.4898424, -0.1482097, -1.968814, 0.03921569, 1, 0, 1,
-0.4871844, 0.600063, -1.703904, 0.03137255, 1, 0, 1,
-0.4868574, 0.8224727, -1.534909, 0.02745098, 1, 0, 1,
-0.4845564, -0.04004996, 0.6617457, 0.01960784, 1, 0, 1,
-0.4834, -0.6338142, -4.778924, 0.01568628, 1, 0, 1,
-0.4833596, 0.8474546, -1.145619, 0.007843138, 1, 0, 1,
-0.4828207, -1.400785, -4.147784, 0.003921569, 1, 0, 1,
-0.4825656, -1.162433, -2.677477, 0, 1, 0.003921569, 1,
-0.4819886, -0.7341402, -3.430261, 0, 1, 0.01176471, 1,
-0.4811903, -0.366105, -2.350008, 0, 1, 0.01568628, 1,
-0.4806573, 0.2200775, -0.8996017, 0, 1, 0.02352941, 1,
-0.476981, -0.7023934, -4.040333, 0, 1, 0.02745098, 1,
-0.4768048, -0.02274336, -2.478676, 0, 1, 0.03529412, 1,
-0.4758512, -0.7854739, -2.656047, 0, 1, 0.03921569, 1,
-0.4748617, 0.6165897, -1.60564, 0, 1, 0.04705882, 1,
-0.473307, 1.374607, 0.9351594, 0, 1, 0.05098039, 1,
-0.4677464, 0.6178298, -1.81307, 0, 1, 0.05882353, 1,
-0.4673225, 1.718449, -1.555889, 0, 1, 0.0627451, 1,
-0.4671458, 0.5993907, -2.074836, 0, 1, 0.07058824, 1,
-0.4641293, 0.6516271, -1.202745, 0, 1, 0.07450981, 1,
-0.4622096, -1.211935, -2.822555, 0, 1, 0.08235294, 1,
-0.4620699, 0.3678875, -1.490799, 0, 1, 0.08627451, 1,
-0.4564683, -0.1640692, 0.01145579, 0, 1, 0.09411765, 1,
-0.4526198, 0.2823366, -2.080817, 0, 1, 0.1019608, 1,
-0.4468933, 1.132562, -0.2365058, 0, 1, 0.1058824, 1,
-0.4416204, -0.286132, -0.3524772, 0, 1, 0.1137255, 1,
-0.4399563, 0.1239056, 0.7697231, 0, 1, 0.1176471, 1,
-0.4397501, 0.3250906, -0.5654261, 0, 1, 0.1254902, 1,
-0.437921, 0.8628018, 0.05529488, 0, 1, 0.1294118, 1,
-0.4377159, -0.5706576, -2.809305, 0, 1, 0.1372549, 1,
-0.4274775, -0.1935559, -2.508667, 0, 1, 0.1411765, 1,
-0.4268017, 0.6779072, -0.5098193, 0, 1, 0.1490196, 1,
-0.425984, 0.2834536, -0.1862485, 0, 1, 0.1529412, 1,
-0.4249894, -0.2948636, -2.044533, 0, 1, 0.1607843, 1,
-0.4210612, -3.003647, -1.528117, 0, 1, 0.1647059, 1,
-0.4204661, -0.3510101, -3.295747, 0, 1, 0.172549, 1,
-0.4191962, -0.7920437, -1.624743, 0, 1, 0.1764706, 1,
-0.4177815, -1.222825, -3.230525, 0, 1, 0.1843137, 1,
-0.4159175, -3.114542, -4.126392, 0, 1, 0.1882353, 1,
-0.4142866, -1.033749, -2.528666, 0, 1, 0.1960784, 1,
-0.4122071, -0.4081668, -2.69949, 0, 1, 0.2039216, 1,
-0.408032, 1.466843, -1.834288, 0, 1, 0.2078431, 1,
-0.4047697, -0.5588748, -1.800214, 0, 1, 0.2156863, 1,
-0.4041601, 0.4971378, 0.1653046, 0, 1, 0.2196078, 1,
-0.400293, 2.142959, -0.2033611, 0, 1, 0.227451, 1,
-0.3981742, 0.5736411, 0.5374559, 0, 1, 0.2313726, 1,
-0.3937393, 1.074893, -0.6665884, 0, 1, 0.2392157, 1,
-0.3906412, -0.5910757, -3.696679, 0, 1, 0.2431373, 1,
-0.390438, 0.1801939, -2.720773, 0, 1, 0.2509804, 1,
-0.3886626, -0.3219765, -1.504854, 0, 1, 0.254902, 1,
-0.3825246, 2.705492, 0.1926067, 0, 1, 0.2627451, 1,
-0.3728375, -0.9890332, -0.509356, 0, 1, 0.2666667, 1,
-0.3723538, 0.277091, -0.6749829, 0, 1, 0.2745098, 1,
-0.3706271, -0.5684006, -1.901895, 0, 1, 0.2784314, 1,
-0.3697899, 1.320603, -1.105619, 0, 1, 0.2862745, 1,
-0.3696904, -0.998462, -3.845724, 0, 1, 0.2901961, 1,
-0.3628236, 0.4199626, -3.284511, 0, 1, 0.2980392, 1,
-0.3606301, 0.2008621, -1.097729, 0, 1, 0.3058824, 1,
-0.3570504, -0.1452989, -3.330783, 0, 1, 0.3098039, 1,
-0.3568011, 1.480231, 0.1071569, 0, 1, 0.3176471, 1,
-0.3563996, 1.119675, -0.3157588, 0, 1, 0.3215686, 1,
-0.353848, -0.7268009, -1.13269, 0, 1, 0.3294118, 1,
-0.3526392, -0.9069939, -2.91609, 0, 1, 0.3333333, 1,
-0.3490537, -0.5868407, -2.492406, 0, 1, 0.3411765, 1,
-0.3407431, 0.7873284, -1.876989, 0, 1, 0.345098, 1,
-0.3402194, -0.3969043, -1.851344, 0, 1, 0.3529412, 1,
-0.3398909, -0.7192997, -4.08251, 0, 1, 0.3568628, 1,
-0.3388026, -0.02455651, -1.706952, 0, 1, 0.3647059, 1,
-0.333179, -1.064822, -4.081161, 0, 1, 0.3686275, 1,
-0.3316474, 0.3679599, -1.227452, 0, 1, 0.3764706, 1,
-0.3315724, 2.872003, 0.100685, 0, 1, 0.3803922, 1,
-0.3244187, -0.04786342, -1.618596, 0, 1, 0.3882353, 1,
-0.3241813, -0.0810688, -2.68146, 0, 1, 0.3921569, 1,
-0.3174988, 0.5311407, 0.8479381, 0, 1, 0.4, 1,
-0.3172193, -0.6077109, -2.134072, 0, 1, 0.4078431, 1,
-0.3150299, 0.6209351, -0.8247752, 0, 1, 0.4117647, 1,
-0.314212, -0.0851493, -2.771494, 0, 1, 0.4196078, 1,
-0.3104745, 0.3965998, 0.4968152, 0, 1, 0.4235294, 1,
-0.3041236, 0.5903595, -0.7472169, 0, 1, 0.4313726, 1,
-0.3024968, -1.06376, -2.613998, 0, 1, 0.4352941, 1,
-0.3008627, -1.740167, -3.099863, 0, 1, 0.4431373, 1,
-0.2925819, -0.05123871, -0.6769297, 0, 1, 0.4470588, 1,
-0.291396, -0.771338, -3.089236, 0, 1, 0.454902, 1,
-0.2885533, -0.7507888, -3.598317, 0, 1, 0.4588235, 1,
-0.2870928, -0.7633933, -2.06813, 0, 1, 0.4666667, 1,
-0.2847502, -1.150049, -2.576189, 0, 1, 0.4705882, 1,
-0.2808972, 0.9064268, -0.9108148, 0, 1, 0.4784314, 1,
-0.2776064, -0.8000108, -3.752638, 0, 1, 0.4823529, 1,
-0.2719102, 0.6714914, 0.04116201, 0, 1, 0.4901961, 1,
-0.2707517, 0.2035506, 0.5727745, 0, 1, 0.4941176, 1,
-0.2704338, 0.2448306, 1.316197, 0, 1, 0.5019608, 1,
-0.2684483, 1.799463, -1.447589, 0, 1, 0.509804, 1,
-0.2682232, -1.825932, -2.002513, 0, 1, 0.5137255, 1,
-0.2658835, -0.5289713, -3.20012, 0, 1, 0.5215687, 1,
-0.2637535, -0.9382656, -2.256672, 0, 1, 0.5254902, 1,
-0.2634277, 0.9032995, 0.1762059, 0, 1, 0.5333334, 1,
-0.2610886, 0.1907674, -1.670461, 0, 1, 0.5372549, 1,
-0.2585379, -0.1774368, -2.811929, 0, 1, 0.5450981, 1,
-0.257205, -0.3215582, -1.820426, 0, 1, 0.5490196, 1,
-0.2566831, -1.628106, -3.791564, 0, 1, 0.5568628, 1,
-0.2556024, 0.757107, 1.169168, 0, 1, 0.5607843, 1,
-0.2555993, -0.7814821, -4.38094, 0, 1, 0.5686275, 1,
-0.2428744, -1.828601, -2.499464, 0, 1, 0.572549, 1,
-0.2420773, 0.1788286, -1.885712, 0, 1, 0.5803922, 1,
-0.2417473, -0.4282299, -2.012603, 0, 1, 0.5843138, 1,
-0.2396152, 0.2821802, -1.38171, 0, 1, 0.5921569, 1,
-0.2369165, 0.9573555, -0.7700124, 0, 1, 0.5960785, 1,
-0.2344323, -0.684375, -3.408412, 0, 1, 0.6039216, 1,
-0.2336685, 1.155395, -0.1506537, 0, 1, 0.6117647, 1,
-0.2288906, 0.6106697, -1.021606, 0, 1, 0.6156863, 1,
-0.2249367, 0.3993592, 0.1320295, 0, 1, 0.6235294, 1,
-0.2231695, 0.722344, 0.3655154, 0, 1, 0.627451, 1,
-0.2226611, -1.974505, -3.365782, 0, 1, 0.6352941, 1,
-0.2152483, 1.214932, -0.102055, 0, 1, 0.6392157, 1,
-0.2149016, 0.2275776, -1.130912, 0, 1, 0.6470588, 1,
-0.2103992, -1.009276, -3.371351, 0, 1, 0.6509804, 1,
-0.2103886, 2.529855, -0.8643187, 0, 1, 0.6588235, 1,
-0.2097231, 0.4853995, -0.7320757, 0, 1, 0.6627451, 1,
-0.2095192, -3.262543, -5.218408, 0, 1, 0.6705883, 1,
-0.2085946, -0.1248897, -1.754837, 0, 1, 0.6745098, 1,
-0.2075824, -0.4217925, -1.539165, 0, 1, 0.682353, 1,
-0.2050346, -0.6409798, -3.814629, 0, 1, 0.6862745, 1,
-0.2046221, 0.3668402, -1.102601, 0, 1, 0.6941177, 1,
-0.2020857, 0.2231592, -0.7738783, 0, 1, 0.7019608, 1,
-0.2008855, 0.07200191, -1.713891, 0, 1, 0.7058824, 1,
-0.1997191, 0.46734, 0.03626012, 0, 1, 0.7137255, 1,
-0.1957841, -0.04827204, -1.878114, 0, 1, 0.7176471, 1,
-0.1950355, -1.358595, -1.771734, 0, 1, 0.7254902, 1,
-0.181247, 0.04393213, -1.506611, 0, 1, 0.7294118, 1,
-0.1801304, 1.195878, 0.5974581, 0, 1, 0.7372549, 1,
-0.1795209, 0.1260347, -0.944308, 0, 1, 0.7411765, 1,
-0.1787355, 1.997363, 0.9884682, 0, 1, 0.7490196, 1,
-0.1786727, 0.07010695, -2.195778, 0, 1, 0.7529412, 1,
-0.1720857, 0.1822693, 0.0008106671, 0, 1, 0.7607843, 1,
-0.1711474, 0.3355613, -2.378418, 0, 1, 0.7647059, 1,
-0.1707547, -0.9678897, -1.944296, 0, 1, 0.772549, 1,
-0.1682881, 0.156877, -0.405808, 0, 1, 0.7764706, 1,
-0.1658046, 0.8650639, -0.5392337, 0, 1, 0.7843137, 1,
-0.1650439, 1.038526, 1.228813, 0, 1, 0.7882353, 1,
-0.163129, 0.4412556, -0.2502973, 0, 1, 0.7960784, 1,
-0.1616119, 1.40047, -2.314929, 0, 1, 0.8039216, 1,
-0.1576864, -0.07819779, -2.661816, 0, 1, 0.8078431, 1,
-0.1531812, 0.7735069, -2.106446, 0, 1, 0.8156863, 1,
-0.1524719, 1.14071, 0.1736008, 0, 1, 0.8196079, 1,
-0.1499867, -0.9135643, -1.906727, 0, 1, 0.827451, 1,
-0.1476634, 0.3188217, 0.9928797, 0, 1, 0.8313726, 1,
-0.1452585, 0.3176839, -0.8649622, 0, 1, 0.8392157, 1,
-0.1424204, 2.359658, 0.3303049, 0, 1, 0.8431373, 1,
-0.1412871, -0.1780341, -2.195327, 0, 1, 0.8509804, 1,
-0.138881, -0.1230235, -1.340428, 0, 1, 0.854902, 1,
-0.1370342, -1.274184, -4.722046, 0, 1, 0.8627451, 1,
-0.1348555, -0.5624789, -4.270154, 0, 1, 0.8666667, 1,
-0.132794, 0.1760972, -1.257792, 0, 1, 0.8745098, 1,
-0.1302448, -1.671848, -4.0006, 0, 1, 0.8784314, 1,
-0.1281325, -1.032411, -1.78096, 0, 1, 0.8862745, 1,
-0.1270345, -0.3827902, -3.627317, 0, 1, 0.8901961, 1,
-0.1255068, -0.7017503, -3.605119, 0, 1, 0.8980392, 1,
-0.1252936, 0.9600867, 0.04551109, 0, 1, 0.9058824, 1,
-0.1149681, -0.8969982, -3.352986, 0, 1, 0.9098039, 1,
-0.1074852, -0.06047554, -2.656582, 0, 1, 0.9176471, 1,
-0.1074488, 0.3983181, 0.0429472, 0, 1, 0.9215686, 1,
-0.1040011, -1.267022, -3.167894, 0, 1, 0.9294118, 1,
-0.1030821, -1.232154, -3.482029, 0, 1, 0.9333333, 1,
-0.1006156, -0.6002989, -2.173025, 0, 1, 0.9411765, 1,
-0.09988706, -0.3583997, -4.347896, 0, 1, 0.945098, 1,
-0.09219202, 0.8779602, -0.07497715, 0, 1, 0.9529412, 1,
-0.08738403, 0.04752056, -1.926835, 0, 1, 0.9568627, 1,
-0.08466444, 0.5853889, -0.5449578, 0, 1, 0.9647059, 1,
-0.08444452, -0.01766651, -1.698888, 0, 1, 0.9686275, 1,
-0.07943361, -2.283929, -2.847404, 0, 1, 0.9764706, 1,
-0.07901914, -0.7252969, -3.07794, 0, 1, 0.9803922, 1,
-0.07801574, -0.3565989, -4.08762, 0, 1, 0.9882353, 1,
-0.07060636, 0.5689905, -1.019663, 0, 1, 0.9921569, 1,
-0.06294473, -0.8128835, -0.4815578, 0, 1, 1, 1,
-0.06025071, 0.8349037, -1.591139, 0, 0.9921569, 1, 1,
-0.05857789, 1.163298, 0.5186777, 0, 0.9882353, 1, 1,
-0.05711527, 0.5540335, -0.2922345, 0, 0.9803922, 1, 1,
-0.05217862, -0.5261217, -1.353064, 0, 0.9764706, 1, 1,
-0.05024313, -0.2877865, -0.9602396, 0, 0.9686275, 1, 1,
-0.0498408, 0.2277576, 0.03872783, 0, 0.9647059, 1, 1,
-0.048963, -0.695151, -2.173005, 0, 0.9568627, 1, 1,
-0.04860741, 0.1935544, 1.120979, 0, 0.9529412, 1, 1,
-0.04469131, -1.911639, -2.116303, 0, 0.945098, 1, 1,
-0.04205831, -0.5860466, -3.021166, 0, 0.9411765, 1, 1,
-0.03948463, 1.176071, -1.066438, 0, 0.9333333, 1, 1,
-0.03789621, 1.304186, -0.9569158, 0, 0.9294118, 1, 1,
-0.0373424, 0.2341227, -1.885286, 0, 0.9215686, 1, 1,
-0.03647863, -0.2969963, -3.390994, 0, 0.9176471, 1, 1,
-0.02196899, -0.9864118, -3.75901, 0, 0.9098039, 1, 1,
-0.02172848, -1.094089, -3.63252, 0, 0.9058824, 1, 1,
-0.02080256, -1.192294, -2.793823, 0, 0.8980392, 1, 1,
-0.01758381, 0.6646103, 0.4615116, 0, 0.8901961, 1, 1,
-0.0175369, 1.051732, -0.695235, 0, 0.8862745, 1, 1,
-0.01451462, -1.077427, -1.94289, 0, 0.8784314, 1, 1,
-0.01159986, 0.8663314, 1.83341, 0, 0.8745098, 1, 1,
-0.005998383, 0.8136051, 0.4664681, 0, 0.8666667, 1, 1,
-0.003259259, 0.1232182, -0.1228677, 0, 0.8627451, 1, 1,
-0.002757332, -1.214171, -2.490288, 0, 0.854902, 1, 1,
-0.0005149661, -0.6614038, -2.485063, 0, 0.8509804, 1, 1,
-0.0005066406, 0.2714359, 0.6255067, 0, 0.8431373, 1, 1,
-0.0001405924, -1.980345, -1.840745, 0, 0.8392157, 1, 1,
0.0001362151, -0.002145916, 2.996555, 0, 0.8313726, 1, 1,
0.00458741, 0.7829567, 0.8289596, 0, 0.827451, 1, 1,
0.004792594, -0.3493308, 3.973565, 0, 0.8196079, 1, 1,
0.009876662, -1.322148, 4.849448, 0, 0.8156863, 1, 1,
0.01331975, -1.213863, 2.673055, 0, 0.8078431, 1, 1,
0.01467674, 1.099495, -2.144602, 0, 0.8039216, 1, 1,
0.02002345, -1.518844, 2.979612, 0, 0.7960784, 1, 1,
0.02016896, 0.3999639, 1.189426, 0, 0.7882353, 1, 1,
0.0205531, -1.787014, 2.399412, 0, 0.7843137, 1, 1,
0.02691855, 0.6983766, -0.4925441, 0, 0.7764706, 1, 1,
0.02758138, 0.4553764, 1.64935, 0, 0.772549, 1, 1,
0.02987943, -1.271921, 3.118443, 0, 0.7647059, 1, 1,
0.02995282, -1.050627, 4.331761, 0, 0.7607843, 1, 1,
0.03521507, -0.9770045, 2.847518, 0, 0.7529412, 1, 1,
0.04220366, 1.817313, -0.3465096, 0, 0.7490196, 1, 1,
0.04477414, 2.616637, -0.783671, 0, 0.7411765, 1, 1,
0.04563576, -0.04554971, 1.878183, 0, 0.7372549, 1, 1,
0.04673241, 1.148636, 0.5598441, 0, 0.7294118, 1, 1,
0.04678588, -0.5370905, 2.88673, 0, 0.7254902, 1, 1,
0.04678936, -0.5757417, 3.239094, 0, 0.7176471, 1, 1,
0.04891408, 0.9895363, 2.006101, 0, 0.7137255, 1, 1,
0.05003222, 0.4801331, -0.7692321, 0, 0.7058824, 1, 1,
0.06056771, -1.57986, 2.264359, 0, 0.6980392, 1, 1,
0.0613744, -0.2520365, 2.024538, 0, 0.6941177, 1, 1,
0.06413877, -0.2218811, 3.478196, 0, 0.6862745, 1, 1,
0.06447461, -0.8859947, 2.915492, 0, 0.682353, 1, 1,
0.06904858, 0.5810311, -0.07000517, 0, 0.6745098, 1, 1,
0.07238784, 0.6995828, 0.06666331, 0, 0.6705883, 1, 1,
0.07663654, -0.3201365, 3.510751, 0, 0.6627451, 1, 1,
0.07776251, -2.337631, 1.767782, 0, 0.6588235, 1, 1,
0.08314691, -0.9543153, 1.409836, 0, 0.6509804, 1, 1,
0.08331472, 0.324667, 1.310434, 0, 0.6470588, 1, 1,
0.08993123, -1.050293, 2.329218, 0, 0.6392157, 1, 1,
0.09089868, -1.015352, 2.221946, 0, 0.6352941, 1, 1,
0.112333, -1.590291, 4.008233, 0, 0.627451, 1, 1,
0.1136022, -1.159009, 1.776636, 0, 0.6235294, 1, 1,
0.1137582, -0.6252462, 3.076064, 0, 0.6156863, 1, 1,
0.1150113, -2.060264, 1.913522, 0, 0.6117647, 1, 1,
0.11737, 1.202543, -1.651125, 0, 0.6039216, 1, 1,
0.1179948, 0.3254921, 0.9368099, 0, 0.5960785, 1, 1,
0.1217594, -1.090709, 3.973946, 0, 0.5921569, 1, 1,
0.1220858, -1.473847, 4.153885, 0, 0.5843138, 1, 1,
0.1254195, -0.331249, 2.758422, 0, 0.5803922, 1, 1,
0.1268592, -0.4412217, 2.865833, 0, 0.572549, 1, 1,
0.1284452, -0.6098487, 3.068764, 0, 0.5686275, 1, 1,
0.1296877, -1.062094, 3.300738, 0, 0.5607843, 1, 1,
0.1318539, 0.3607893, 0.7357322, 0, 0.5568628, 1, 1,
0.1368714, 0.7242348, 1.103925, 0, 0.5490196, 1, 1,
0.1369527, -0.7910947, 2.864051, 0, 0.5450981, 1, 1,
0.141665, -0.8898491, 3.125091, 0, 0.5372549, 1, 1,
0.1417125, -2.422594, 3.393653, 0, 0.5333334, 1, 1,
0.1419298, 3.025342, 0.09023312, 0, 0.5254902, 1, 1,
0.142072, -1.369498, 3.981725, 0, 0.5215687, 1, 1,
0.1423137, 0.804563, -0.3439336, 0, 0.5137255, 1, 1,
0.1428716, 2.317261, 1.325251, 0, 0.509804, 1, 1,
0.1470279, 0.4362661, 0.9228851, 0, 0.5019608, 1, 1,
0.1516505, 0.9014735, -0.7494305, 0, 0.4941176, 1, 1,
0.1524456, 1.808729, -0.9405847, 0, 0.4901961, 1, 1,
0.1560495, 1.105858, -0.04058649, 0, 0.4823529, 1, 1,
0.1577434, 1.189136, 1.892013, 0, 0.4784314, 1, 1,
0.1587394, -0.3330727, 1.872084, 0, 0.4705882, 1, 1,
0.1646661, 0.5570472, 1.032807, 0, 0.4666667, 1, 1,
0.1694548, -0.6276315, 4.314221, 0, 0.4588235, 1, 1,
0.1704478, 0.8409273, -0.4509621, 0, 0.454902, 1, 1,
0.1719963, 0.01131519, 3.472034, 0, 0.4470588, 1, 1,
0.1755306, 0.3692331, -0.8839102, 0, 0.4431373, 1, 1,
0.1776823, -0.2343173, 2.069319, 0, 0.4352941, 1, 1,
0.1799711, 0.1213898, -1.01234, 0, 0.4313726, 1, 1,
0.1820425, 0.6693751, 1.786729, 0, 0.4235294, 1, 1,
0.1856822, 0.1802162, 1.467067, 0, 0.4196078, 1, 1,
0.1862315, -0.8142833, 4.239104, 0, 0.4117647, 1, 1,
0.1867203, -0.2342636, 2.972183, 0, 0.4078431, 1, 1,
0.1887513, 1.051008, 2.198319, 0, 0.4, 1, 1,
0.1891652, 1.086476, 1.451177, 0, 0.3921569, 1, 1,
0.1917863, 0.5234625, 0.1932652, 0, 0.3882353, 1, 1,
0.1983634, -1.684448, 3.117079, 0, 0.3803922, 1, 1,
0.2029792, -0.9560767, 1.983671, 0, 0.3764706, 1, 1,
0.2051662, 0.4359328, 1.536758, 0, 0.3686275, 1, 1,
0.2055397, -0.5823165, 4.03633, 0, 0.3647059, 1, 1,
0.2141846, 0.02896495, 0.1604512, 0, 0.3568628, 1, 1,
0.2175007, -1.762838, 2.046748, 0, 0.3529412, 1, 1,
0.220558, -0.2728294, 2.850381, 0, 0.345098, 1, 1,
0.221527, -1.656769, 3.056237, 0, 0.3411765, 1, 1,
0.2232166, 2.77973, 0.7635824, 0, 0.3333333, 1, 1,
0.223332, 0.5485123, -0.08496498, 0, 0.3294118, 1, 1,
0.2234863, 0.2041252, 1.690007, 0, 0.3215686, 1, 1,
0.2264675, -0.6503519, 2.625595, 0, 0.3176471, 1, 1,
0.233293, 0.03535713, 2.451873, 0, 0.3098039, 1, 1,
0.2348945, 0.5374204, 1.174983, 0, 0.3058824, 1, 1,
0.2350715, 0.7427195, 1.150335, 0, 0.2980392, 1, 1,
0.238334, 0.1634589, 0.04379523, 0, 0.2901961, 1, 1,
0.2420515, 0.04065027, 1.997769, 0, 0.2862745, 1, 1,
0.2444419, 0.5935153, 2.012403, 0, 0.2784314, 1, 1,
0.2466577, 0.3030684, 0.5929648, 0, 0.2745098, 1, 1,
0.2490918, -0.5832577, 2.379162, 0, 0.2666667, 1, 1,
0.2492952, 0.9904574, -0.1490701, 0, 0.2627451, 1, 1,
0.249687, -0.3537742, 3.375162, 0, 0.254902, 1, 1,
0.250727, 0.007344712, 1.464274, 0, 0.2509804, 1, 1,
0.2548225, 1.329586, 0.7028142, 0, 0.2431373, 1, 1,
0.2552809, 1.004173, 0.1831174, 0, 0.2392157, 1, 1,
0.256864, -0.5115296, 1.883336, 0, 0.2313726, 1, 1,
0.2616477, 2.474589, -1.923511, 0, 0.227451, 1, 1,
0.2647766, -1.434307, 2.097677, 0, 0.2196078, 1, 1,
0.2708677, 0.5849572, 0.5074255, 0, 0.2156863, 1, 1,
0.2840877, -0.01133034, 0.2461487, 0, 0.2078431, 1, 1,
0.2918018, -0.03127659, 2.978086, 0, 0.2039216, 1, 1,
0.2935686, 0.3379509, 2.060192, 0, 0.1960784, 1, 1,
0.2936561, -0.4023428, 2.870352, 0, 0.1882353, 1, 1,
0.3005635, 0.7764831, 2.132846, 0, 0.1843137, 1, 1,
0.3087956, 0.3498058, 1.172238, 0, 0.1764706, 1, 1,
0.311803, -1.58478, 1.89435, 0, 0.172549, 1, 1,
0.3121096, -0.00754469, 1.50405, 0, 0.1647059, 1, 1,
0.3123434, 0.4951147, -1.508398, 0, 0.1607843, 1, 1,
0.3125857, 1.028268, -0.2676232, 0, 0.1529412, 1, 1,
0.3128359, 0.3361662, -0.149225, 0, 0.1490196, 1, 1,
0.3155504, 2.028961, 1.305807, 0, 0.1411765, 1, 1,
0.3240042, -0.0565335, 3.253173, 0, 0.1372549, 1, 1,
0.326731, -0.1959912, 1.12039, 0, 0.1294118, 1, 1,
0.3325017, -0.5544338, 2.312749, 0, 0.1254902, 1, 1,
0.3352314, 0.08294541, 1.665628, 0, 0.1176471, 1, 1,
0.336119, 0.3243595, 0.7697998, 0, 0.1137255, 1, 1,
0.3369812, -0.02301452, 1.946923, 0, 0.1058824, 1, 1,
0.3376079, -1.018553, 4.745667, 0, 0.09803922, 1, 1,
0.3411312, 0.6204342, -0.4886099, 0, 0.09411765, 1, 1,
0.3436946, 0.1616666, 0.8818565, 0, 0.08627451, 1, 1,
0.343849, 1.156223, 0.942787, 0, 0.08235294, 1, 1,
0.3448903, -0.4192997, 1.020566, 0, 0.07450981, 1, 1,
0.3466679, -0.1900257, 1.979354, 0, 0.07058824, 1, 1,
0.352546, -0.1815196, 2.664108, 0, 0.0627451, 1, 1,
0.3612823, -0.3952517, 2.461812, 0, 0.05882353, 1, 1,
0.3640551, 0.2591882, 1.303347, 0, 0.05098039, 1, 1,
0.3644402, 1.075982, 0.187152, 0, 0.04705882, 1, 1,
0.3677951, -0.6681086, 1.89887, 0, 0.03921569, 1, 1,
0.3711414, 0.1044783, -0.1383504, 0, 0.03529412, 1, 1,
0.3732499, 0.6784604, -1.277092, 0, 0.02745098, 1, 1,
0.3756039, -0.1066763, 3.620363, 0, 0.02352941, 1, 1,
0.3811817, -0.1916318, -0.3578601, 0, 0.01568628, 1, 1,
0.3829881, -1.392202, 1.73124, 0, 0.01176471, 1, 1,
0.3865587, -1.862808, 3.552276, 0, 0.003921569, 1, 1,
0.3870179, -1.077561, 3.80499, 0.003921569, 0, 1, 1,
0.3902191, 2.064135, -0.4565061, 0.007843138, 0, 1, 1,
0.3977542, -0.7925516, 4.161619, 0.01568628, 0, 1, 1,
0.4062164, -0.3824151, 1.030623, 0.01960784, 0, 1, 1,
0.412486, 2.00457, 1.653695, 0.02745098, 0, 1, 1,
0.4154828, -0.1420432, 1.821007, 0.03137255, 0, 1, 1,
0.4159022, 0.4166785, 1.17671, 0.03921569, 0, 1, 1,
0.4186975, 0.8382161, 0.4092643, 0.04313726, 0, 1, 1,
0.4211978, -0.1993482, 2.239845, 0.05098039, 0, 1, 1,
0.421592, -1.611576, 3.073631, 0.05490196, 0, 1, 1,
0.4220759, -2.08965, 0.4420586, 0.0627451, 0, 1, 1,
0.4236071, -0.4274654, 2.488232, 0.06666667, 0, 1, 1,
0.4240798, 1.798795, 1.436232, 0.07450981, 0, 1, 1,
0.425462, 0.04553503, 1.668351, 0.07843138, 0, 1, 1,
0.4256147, -0.510288, 2.159269, 0.08627451, 0, 1, 1,
0.4277475, 1.879953, -0.130832, 0.09019608, 0, 1, 1,
0.429322, 0.1702083, 1.250359, 0.09803922, 0, 1, 1,
0.4355713, -2.768111, 1.618973, 0.1058824, 0, 1, 1,
0.4437353, -0.4892808, 3.280892, 0.1098039, 0, 1, 1,
0.4454849, 0.3138128, 0.8713967, 0.1176471, 0, 1, 1,
0.4474323, 0.2110687, 0.5841319, 0.1215686, 0, 1, 1,
0.4505232, 0.2747817, 2.135508, 0.1294118, 0, 1, 1,
0.450541, 0.4967176, 0.5897586, 0.1333333, 0, 1, 1,
0.4576591, -0.247198, 1.979591, 0.1411765, 0, 1, 1,
0.4621534, -2.368655, 3.559145, 0.145098, 0, 1, 1,
0.4657364, 1.204788, 2.195387, 0.1529412, 0, 1, 1,
0.4768489, -0.2546378, 0.8321582, 0.1568628, 0, 1, 1,
0.4788919, -0.06903642, 1.169784, 0.1647059, 0, 1, 1,
0.4822565, -0.2304468, 0.7147526, 0.1686275, 0, 1, 1,
0.4830804, -0.1834244, 1.233755, 0.1764706, 0, 1, 1,
0.4845133, -0.8983077, 3.034735, 0.1803922, 0, 1, 1,
0.4869119, 0.3139693, 1.724519, 0.1882353, 0, 1, 1,
0.4934113, 0.2142079, 0.5591694, 0.1921569, 0, 1, 1,
0.4963121, 0.8554592, 1.312814, 0.2, 0, 1, 1,
0.4982034, 0.8017436, 1.508006, 0.2078431, 0, 1, 1,
0.4996293, 0.3440492, 0.4468242, 0.2117647, 0, 1, 1,
0.50644, 0.2249118, 0.8389612, 0.2196078, 0, 1, 1,
0.512241, -0.05319955, 0.8232374, 0.2235294, 0, 1, 1,
0.5128192, -0.009001506, 2.354326, 0.2313726, 0, 1, 1,
0.5140255, -1.058859, 3.455375, 0.2352941, 0, 1, 1,
0.5208116, 1.506229, 0.7836386, 0.2431373, 0, 1, 1,
0.5263681, 0.6699299, 0.6656767, 0.2470588, 0, 1, 1,
0.5277925, 0.1544813, 0.853099, 0.254902, 0, 1, 1,
0.5278534, -0.3244998, 1.125943, 0.2588235, 0, 1, 1,
0.5378963, -0.2177287, 2.437687, 0.2666667, 0, 1, 1,
0.5417331, -0.04816628, 1.050873, 0.2705882, 0, 1, 1,
0.5423376, -0.6231696, 2.224528, 0.2784314, 0, 1, 1,
0.5428621, 1.698981, -0.360638, 0.282353, 0, 1, 1,
0.5457278, 0.6630917, -0.8637583, 0.2901961, 0, 1, 1,
0.5467997, -1.193051, 1.858562, 0.2941177, 0, 1, 1,
0.5512698, 0.7576919, 1.979636, 0.3019608, 0, 1, 1,
0.5569898, 0.3305871, 0.7908739, 0.3098039, 0, 1, 1,
0.5579358, 1.555813, -0.9635075, 0.3137255, 0, 1, 1,
0.5605856, -0.240308, 3.23601, 0.3215686, 0, 1, 1,
0.5624612, 0.1059059, -0.05654782, 0.3254902, 0, 1, 1,
0.571477, 0.7494616, -0.7666124, 0.3333333, 0, 1, 1,
0.5715405, -1.942478, 3.917929, 0.3372549, 0, 1, 1,
0.5800243, -0.259586, 0.1665961, 0.345098, 0, 1, 1,
0.5827939, -1.032413, 0.8892298, 0.3490196, 0, 1, 1,
0.5844412, -0.009460595, 0.9340729, 0.3568628, 0, 1, 1,
0.5861219, -0.719969, 1.314621, 0.3607843, 0, 1, 1,
0.5967832, 0.04783984, 2.938814, 0.3686275, 0, 1, 1,
0.5984332, 1.307691, 0.5884491, 0.372549, 0, 1, 1,
0.6002178, -1.059964, 2.58764, 0.3803922, 0, 1, 1,
0.6027752, 0.9729679, 0.9074361, 0.3843137, 0, 1, 1,
0.6121187, 0.7679861, 0.4609689, 0.3921569, 0, 1, 1,
0.6135523, 0.5540707, 0.1880381, 0.3960784, 0, 1, 1,
0.6136446, 0.4050663, 1.854827, 0.4039216, 0, 1, 1,
0.6140608, 2.100917, 1.578339, 0.4117647, 0, 1, 1,
0.6142625, 0.1472302, 1.561282, 0.4156863, 0, 1, 1,
0.6162288, -1.717318, 1.48479, 0.4235294, 0, 1, 1,
0.6187431, -0.8979415, 3.12015, 0.427451, 0, 1, 1,
0.6216738, -0.3833387, 0.1455492, 0.4352941, 0, 1, 1,
0.6253147, 0.8701085, 1.075296, 0.4392157, 0, 1, 1,
0.6286316, -0.5297285, 3.535968, 0.4470588, 0, 1, 1,
0.6317271, -0.1162921, 1.167594, 0.4509804, 0, 1, 1,
0.6326805, 2.941941, -0.6047998, 0.4588235, 0, 1, 1,
0.6341221, -1.210933, 1.866142, 0.4627451, 0, 1, 1,
0.6402798, -1.59203, 2.76358, 0.4705882, 0, 1, 1,
0.640982, -2.328101, 2.038497, 0.4745098, 0, 1, 1,
0.6425189, 0.7718719, 1.959821, 0.4823529, 0, 1, 1,
0.6435518, 0.1720532, 2.518545, 0.4862745, 0, 1, 1,
0.6438153, 0.6095442, -0.468919, 0.4941176, 0, 1, 1,
0.6449074, 1.810928, -0.7150818, 0.5019608, 0, 1, 1,
0.6449509, 0.08563273, -0.3733124, 0.5058824, 0, 1, 1,
0.6479724, -0.7218108, 2.616357, 0.5137255, 0, 1, 1,
0.6512467, -0.7216154, 0.5181963, 0.5176471, 0, 1, 1,
0.6524022, 0.03734553, -0.3399485, 0.5254902, 0, 1, 1,
0.6609386, -0.4033985, 4.096522, 0.5294118, 0, 1, 1,
0.6634051, 1.849726, 0.2382195, 0.5372549, 0, 1, 1,
0.6636462, 1.30032, 0.05211671, 0.5411765, 0, 1, 1,
0.666606, 1.835951, 1.51737, 0.5490196, 0, 1, 1,
0.6724997, 0.1112845, 1.702735, 0.5529412, 0, 1, 1,
0.6749955, 0.001348382, 0.9099619, 0.5607843, 0, 1, 1,
0.6752509, 0.8363354, 0.4971846, 0.5647059, 0, 1, 1,
0.6782915, -0.05850161, 0.7737121, 0.572549, 0, 1, 1,
0.6817002, 1.387672, 1.609892, 0.5764706, 0, 1, 1,
0.6820952, -1.037357, 3.007763, 0.5843138, 0, 1, 1,
0.683544, 0.7800719, 1.211048, 0.5882353, 0, 1, 1,
0.683851, -0.142745, 0.360373, 0.5960785, 0, 1, 1,
0.6912364, -1.377515, 1.532761, 0.6039216, 0, 1, 1,
0.6923434, 0.5844306, -0.7386703, 0.6078432, 0, 1, 1,
0.6929421, -1.071829, 3.734114, 0.6156863, 0, 1, 1,
0.6931201, -1.031495, 2.139364, 0.6196079, 0, 1, 1,
0.6933953, -0.7928627, 2.891815, 0.627451, 0, 1, 1,
0.6937099, -0.7075747, 1.356499, 0.6313726, 0, 1, 1,
0.694909, 1.393046, 1.51087, 0.6392157, 0, 1, 1,
0.6974621, 0.08557355, 1.11765, 0.6431373, 0, 1, 1,
0.6997791, 0.7717822, 0.7630294, 0.6509804, 0, 1, 1,
0.705554, 0.7813038, 1.813363, 0.654902, 0, 1, 1,
0.705988, 0.4337884, 1.498491, 0.6627451, 0, 1, 1,
0.7060611, 0.4023456, 1.591482, 0.6666667, 0, 1, 1,
0.7063013, 0.6036678, 2.000976, 0.6745098, 0, 1, 1,
0.7137369, 0.4572111, 0.2023086, 0.6784314, 0, 1, 1,
0.7153851, -1.658039, 1.477762, 0.6862745, 0, 1, 1,
0.7201248, 0.6923963, 0.006250668, 0.6901961, 0, 1, 1,
0.7264951, 0.04346555, 1.22342, 0.6980392, 0, 1, 1,
0.7274673, -0.7210031, 0.7955143, 0.7058824, 0, 1, 1,
0.7286821, -1.284461, 0.1344059, 0.7098039, 0, 1, 1,
0.730435, -0.3189987, 0.3403778, 0.7176471, 0, 1, 1,
0.7304848, -1.42226, 2.410725, 0.7215686, 0, 1, 1,
0.7405058, 0.4442073, 1.117837, 0.7294118, 0, 1, 1,
0.7447182, -0.677973, 3.050607, 0.7333333, 0, 1, 1,
0.7470807, 0.0763675, -0.9155763, 0.7411765, 0, 1, 1,
0.7554641, -0.2986186, 2.357208, 0.7450981, 0, 1, 1,
0.7680595, 0.2449909, 0.9727939, 0.7529412, 0, 1, 1,
0.7706347, -0.2112467, 2.986359, 0.7568628, 0, 1, 1,
0.7810149, -0.372378, 3.827876, 0.7647059, 0, 1, 1,
0.7849804, -0.8943154, 2.024177, 0.7686275, 0, 1, 1,
0.7883759, -0.8595861, 1.96877, 0.7764706, 0, 1, 1,
0.7957768, 0.3810119, 1.558315, 0.7803922, 0, 1, 1,
0.7995158, 1.389609, 0.9428439, 0.7882353, 0, 1, 1,
0.8043455, -0.9107326, 0.6099371, 0.7921569, 0, 1, 1,
0.8054941, -0.8961202, 0.212562, 0.8, 0, 1, 1,
0.8056995, -0.5559784, 1.586594, 0.8078431, 0, 1, 1,
0.8119134, 0.2538805, 0.5678249, 0.8117647, 0, 1, 1,
0.8120854, 1.990067, 0.300958, 0.8196079, 0, 1, 1,
0.8135397, -0.8062893, 1.365561, 0.8235294, 0, 1, 1,
0.8147444, 0.2913921, 0.5603394, 0.8313726, 0, 1, 1,
0.8199284, -0.9622238, 3.02125, 0.8352941, 0, 1, 1,
0.8200979, -1.634131, 3.515771, 0.8431373, 0, 1, 1,
0.8222766, 0.4965373, 0.7974578, 0.8470588, 0, 1, 1,
0.8236642, -0.08584531, 2.395609, 0.854902, 0, 1, 1,
0.8239194, -1.327104, 2.083409, 0.8588235, 0, 1, 1,
0.8274657, -0.3871183, -0.4359704, 0.8666667, 0, 1, 1,
0.8279085, -0.7600164, 3.156568, 0.8705882, 0, 1, 1,
0.8329686, -0.7783611, 3.92046, 0.8784314, 0, 1, 1,
0.8407091, -0.643058, 2.104007, 0.8823529, 0, 1, 1,
0.8410571, 1.189583, 1.262491, 0.8901961, 0, 1, 1,
0.843811, 0.2719932, 0.1798548, 0.8941177, 0, 1, 1,
0.8577628, -2.068179, 3.329823, 0.9019608, 0, 1, 1,
0.8594513, 0.4462543, -1.080727, 0.9098039, 0, 1, 1,
0.8657938, 0.5943402, 1.340327, 0.9137255, 0, 1, 1,
0.8692021, -0.9645697, 3.783607, 0.9215686, 0, 1, 1,
0.869496, 1.225089, 1.395857, 0.9254902, 0, 1, 1,
0.8696224, 1.082732, -0.5735138, 0.9333333, 0, 1, 1,
0.8759544, -1.215161, 2.416216, 0.9372549, 0, 1, 1,
0.8807892, 1.128923, 1.10032, 0.945098, 0, 1, 1,
0.8848357, -0.3870308, 1.560719, 0.9490196, 0, 1, 1,
0.8874822, 0.3465983, 2.666889, 0.9568627, 0, 1, 1,
0.8891823, 0.5373246, 1.281672, 0.9607843, 0, 1, 1,
0.890418, -0.9970999, 3.184788, 0.9686275, 0, 1, 1,
0.8944702, 0.110261, 1.930421, 0.972549, 0, 1, 1,
0.8947607, 0.5666128, 1.825657, 0.9803922, 0, 1, 1,
0.8951972, 1.816013, -0.04669058, 0.9843137, 0, 1, 1,
0.9058083, -0.367978, 1.885265, 0.9921569, 0, 1, 1,
0.9066764, -1.111877, 1.89793, 0.9960784, 0, 1, 1,
0.908995, 1.265242, 0.3157761, 1, 0, 0.9960784, 1,
0.9092667, 0.8345945, 1.122794, 1, 0, 0.9882353, 1,
0.9154848, 1.120744, 1.894028, 1, 0, 0.9843137, 1,
0.9156852, 1.345683, -0.7966685, 1, 0, 0.9764706, 1,
0.9182612, 0.8082699, 1.789781, 1, 0, 0.972549, 1,
0.9257101, -0.1618736, 3.956165, 1, 0, 0.9647059, 1,
0.9307227, -0.9341449, 1.797645, 1, 0, 0.9607843, 1,
0.9346648, -0.1030484, 0.8595916, 1, 0, 0.9529412, 1,
0.9392569, -1.115696, 3.271869, 1, 0, 0.9490196, 1,
0.9475242, 0.7093498, 1.938421, 1, 0, 0.9411765, 1,
0.9503177, 1.117207, -0.7635618, 1, 0, 0.9372549, 1,
0.950959, -2.127659, 3.104498, 1, 0, 0.9294118, 1,
0.955645, 1.528819, 1.075572, 1, 0, 0.9254902, 1,
0.9567311, -0.3917832, 1.096323, 1, 0, 0.9176471, 1,
0.9623434, -0.09121218, 3.035008, 1, 0, 0.9137255, 1,
0.9667358, -0.644385, 1.625147, 1, 0, 0.9058824, 1,
0.9781415, 1.63454, -1.941472, 1, 0, 0.9019608, 1,
0.9796813, -0.9283077, 2.206075, 1, 0, 0.8941177, 1,
0.98162, -0.523729, 1.56731, 1, 0, 0.8862745, 1,
0.986931, -0.7521653, 2.090003, 1, 0, 0.8823529, 1,
0.9879163, 1.25053, 1.07402, 1, 0, 0.8745098, 1,
0.9896856, 0.2448431, 2.529328, 1, 0, 0.8705882, 1,
0.9950483, 1.031661, 0.9456478, 1, 0, 0.8627451, 1,
0.9974487, 2.95242, 0.9334013, 1, 0, 0.8588235, 1,
1.003201, 0.7856106, 0.9785931, 1, 0, 0.8509804, 1,
1.006576, 0.6227187, 3.04109, 1, 0, 0.8470588, 1,
1.006821, -0.7034373, 1.794268, 1, 0, 0.8392157, 1,
1.015379, 0.7786723, 1.577689, 1, 0, 0.8352941, 1,
1.016289, 0.85581, -0.09762896, 1, 0, 0.827451, 1,
1.017573, -1.297507, 2.177075, 1, 0, 0.8235294, 1,
1.027322, -0.4299405, 1.854389, 1, 0, 0.8156863, 1,
1.034167, -1.820278, 2.876456, 1, 0, 0.8117647, 1,
1.04034, 0.8565661, -0.1090966, 1, 0, 0.8039216, 1,
1.047767, 0.04106717, 2.095109, 1, 0, 0.7960784, 1,
1.048115, 0.6075104, 2.922513, 1, 0, 0.7921569, 1,
1.048515, 0.5299587, 0.8404133, 1, 0, 0.7843137, 1,
1.053298, -0.209917, 0.8529356, 1, 0, 0.7803922, 1,
1.054955, 0.3115426, 3.18524, 1, 0, 0.772549, 1,
1.060785, -0.4405463, 3.93328, 1, 0, 0.7686275, 1,
1.061126, 0.9458573, 0.2483957, 1, 0, 0.7607843, 1,
1.061892, -0.1633153, 2.267345, 1, 0, 0.7568628, 1,
1.0619, 1.067675, 0.7849932, 1, 0, 0.7490196, 1,
1.063387, -2.900129, 2.101969, 1, 0, 0.7450981, 1,
1.070388, -0.6521646, 1.656048, 1, 0, 0.7372549, 1,
1.078221, 1.38405, 0.7513228, 1, 0, 0.7333333, 1,
1.080859, 1.156452, 1.571892, 1, 0, 0.7254902, 1,
1.094278, -0.9985475, 2.15281, 1, 0, 0.7215686, 1,
1.09927, 1.68933, 1.084792, 1, 0, 0.7137255, 1,
1.101561, -0.154193, 2.262173, 1, 0, 0.7098039, 1,
1.101625, 0.8576216, -0.1488668, 1, 0, 0.7019608, 1,
1.107594, 0.3558143, 0.1321136, 1, 0, 0.6941177, 1,
1.108786, 0.8438626, 1.468337, 1, 0, 0.6901961, 1,
1.110916, 1.205292, -0.04535831, 1, 0, 0.682353, 1,
1.111632, -0.06197245, 2.775809, 1, 0, 0.6784314, 1,
1.113814, -2.094593, 2.585331, 1, 0, 0.6705883, 1,
1.119079, -1.366889, 2.308198, 1, 0, 0.6666667, 1,
1.123118, 0.3888087, -0.2773098, 1, 0, 0.6588235, 1,
1.126599, 1.020482, 1.100753, 1, 0, 0.654902, 1,
1.126633, 2.068037, 0.6854991, 1, 0, 0.6470588, 1,
1.134814, 0.08283121, 1.142201, 1, 0, 0.6431373, 1,
1.142587, -1.124261, 2.816615, 1, 0, 0.6352941, 1,
1.143322, -0.2992666, 1.269933, 1, 0, 0.6313726, 1,
1.151983, 0.2248772, -1.206402, 1, 0, 0.6235294, 1,
1.158746, 0.2588046, 0.370921, 1, 0, 0.6196079, 1,
1.160898, -0.05894873, 1.652662, 1, 0, 0.6117647, 1,
1.161014, -0.7625445, 3.62815, 1, 0, 0.6078432, 1,
1.186082, -0.7766545, 4.090499, 1, 0, 0.6, 1,
1.187416, 0.5743621, 0.165029, 1, 0, 0.5921569, 1,
1.189735, 2.281944, 1.12276, 1, 0, 0.5882353, 1,
1.195926, 0.3201403, 1.856313, 1, 0, 0.5803922, 1,
1.205382, -1.391384, 2.876447, 1, 0, 0.5764706, 1,
1.20925, -1.490138, 2.198364, 1, 0, 0.5686275, 1,
1.21601, -0.9680167, 3.581792, 1, 0, 0.5647059, 1,
1.220527, -0.3363172, 1.632653, 1, 0, 0.5568628, 1,
1.222223, -0.2760653, 2.202066, 1, 0, 0.5529412, 1,
1.231243, -0.4499761, 2.315074, 1, 0, 0.5450981, 1,
1.231278, 0.2767724, 1.752148, 1, 0, 0.5411765, 1,
1.238907, -0.6853617, 2.641776, 1, 0, 0.5333334, 1,
1.254199, 0.633692, 2.138906, 1, 0, 0.5294118, 1,
1.254578, 1.012627, 0.7883364, 1, 0, 0.5215687, 1,
1.256117, 0.1487179, 2.679535, 1, 0, 0.5176471, 1,
1.272046, -0.2957228, 0.4761077, 1, 0, 0.509804, 1,
1.280398, 0.8606963, 0.252079, 1, 0, 0.5058824, 1,
1.287263, -1.66757, 2.52497, 1, 0, 0.4980392, 1,
1.296232, -0.7332404, 3.571183, 1, 0, 0.4901961, 1,
1.307204, 0.1905885, 1.255297, 1, 0, 0.4862745, 1,
1.309424, -0.01802634, 1.422127, 1, 0, 0.4784314, 1,
1.316458, 0.3103634, 1.18413, 1, 0, 0.4745098, 1,
1.322884, 0.5169703, 0.4461542, 1, 0, 0.4666667, 1,
1.323167, 0.6195422, 1.914763, 1, 0, 0.4627451, 1,
1.340832, 1.172963, 1.389858, 1, 0, 0.454902, 1,
1.346283, -1.087105, 4.277125, 1, 0, 0.4509804, 1,
1.35584, 0.4402764, 0.3590759, 1, 0, 0.4431373, 1,
1.359825, 1.517912, 0.0616118, 1, 0, 0.4392157, 1,
1.365423, -0.4360848, 2.121156, 1, 0, 0.4313726, 1,
1.366806, 0.3214002, 2.662894, 1, 0, 0.427451, 1,
1.378404, -1.088758, 1.85768, 1, 0, 0.4196078, 1,
1.380182, -0.9197214, 1.694636, 1, 0, 0.4156863, 1,
1.389632, 0.5188991, 1.595586, 1, 0, 0.4078431, 1,
1.404871, 0.5145801, 0.9213059, 1, 0, 0.4039216, 1,
1.40878, -1.932959, 2.254635, 1, 0, 0.3960784, 1,
1.4306, -0.6127171, 2.049077, 1, 0, 0.3882353, 1,
1.4531, -0.4937617, 3.094357, 1, 0, 0.3843137, 1,
1.476033, 0.4084364, 1.085571, 1, 0, 0.3764706, 1,
1.483711, 1.607418, 2.404455, 1, 0, 0.372549, 1,
1.484366, -0.6627108, 0.9586604, 1, 0, 0.3647059, 1,
1.486334, -0.4597996, 2.289807, 1, 0, 0.3607843, 1,
1.492775, 1.529298, 0.7867993, 1, 0, 0.3529412, 1,
1.50086, 0.9209117, 1.086079, 1, 0, 0.3490196, 1,
1.502037, -0.2069764, 2.503337, 1, 0, 0.3411765, 1,
1.508554, -0.4782607, 2.190855, 1, 0, 0.3372549, 1,
1.50871, 0.00790808, -0.4894084, 1, 0, 0.3294118, 1,
1.526214, 0.5508472, 1.279267, 1, 0, 0.3254902, 1,
1.528116, -0.5749503, 1.445478, 1, 0, 0.3176471, 1,
1.555326, 1.112274, 0.7871941, 1, 0, 0.3137255, 1,
1.567631, 0.2585899, 1.588942, 1, 0, 0.3058824, 1,
1.568164, 0.9428769, 2.087364, 1, 0, 0.2980392, 1,
1.569794, 1.085039, -1.600984, 1, 0, 0.2941177, 1,
1.571226, 0.477279, 1.573484, 1, 0, 0.2862745, 1,
1.579842, 0.1911366, 1.266115, 1, 0, 0.282353, 1,
1.601741, -0.2100741, 0.1317876, 1, 0, 0.2745098, 1,
1.631501, 0.5978447, 2.733673, 1, 0, 0.2705882, 1,
1.63944, 0.7622296, 1.0696, 1, 0, 0.2627451, 1,
1.642887, -1.034404, 1.730556, 1, 0, 0.2588235, 1,
1.66629, -0.6115528, 0.4369369, 1, 0, 0.2509804, 1,
1.693179, -0.2780778, 4.128641, 1, 0, 0.2470588, 1,
1.706409, 0.3794023, 1.118395, 1, 0, 0.2392157, 1,
1.730498, -1.011185, 1.518348, 1, 0, 0.2352941, 1,
1.730985, -1.632846, 2.346702, 1, 0, 0.227451, 1,
1.733341, -0.9992085, 1.858605, 1, 0, 0.2235294, 1,
1.73335, -1.78269, 1.549448, 1, 0, 0.2156863, 1,
1.744594, -0.05926016, 0.5395939, 1, 0, 0.2117647, 1,
1.769486, 0.54524, -0.3044517, 1, 0, 0.2039216, 1,
1.786757, -0.1620326, 0.8333692, 1, 0, 0.1960784, 1,
1.805212, 0.1227777, 1.661714, 1, 0, 0.1921569, 1,
1.810035, 1.145907, -0.03496749, 1, 0, 0.1843137, 1,
1.824875, 0.3168135, -0.09676711, 1, 0, 0.1803922, 1,
1.835834, -0.04338616, 1.87072, 1, 0, 0.172549, 1,
1.855647, -0.1309999, 0.5598168, 1, 0, 0.1686275, 1,
1.863977, -0.08656988, 2.989522, 1, 0, 0.1607843, 1,
1.86902, 0.7357815, 0.6008152, 1, 0, 0.1568628, 1,
1.89546, -0.2429474, 1.511926, 1, 0, 0.1490196, 1,
1.914141, -0.3748876, 2.164881, 1, 0, 0.145098, 1,
1.918519, 0.7446452, 1.580169, 1, 0, 0.1372549, 1,
2.007865, -0.1911499, 0.2631632, 1, 0, 0.1333333, 1,
2.035044, -0.06280421, 2.006429, 1, 0, 0.1254902, 1,
2.044519, 1.241851, 0.02219884, 1, 0, 0.1215686, 1,
2.07931, -1.828029, 2.287626, 1, 0, 0.1137255, 1,
2.084219, -0.2047922, 1.295187, 1, 0, 0.1098039, 1,
2.142788, -0.9085447, 3.409693, 1, 0, 0.1019608, 1,
2.171265, 0.1165655, 2.602988, 1, 0, 0.09411765, 1,
2.181021, 1.440565, 2.023493, 1, 0, 0.09019608, 1,
2.205945, 0.2143822, 0.7893702, 1, 0, 0.08235294, 1,
2.269926, -0.8796257, 2.525134, 1, 0, 0.07843138, 1,
2.313297, 0.2032096, 1.253215, 1, 0, 0.07058824, 1,
2.33023, -0.6994137, 0.8744689, 1, 0, 0.06666667, 1,
2.371628, 1.571219, 1.369595, 1, 0, 0.05882353, 1,
2.40224, -0.6420679, 2.383341, 1, 0, 0.05490196, 1,
2.423335, -0.9175282, 1.506282, 1, 0, 0.04705882, 1,
2.441629, -2.003106, 1.20712, 1, 0, 0.04313726, 1,
2.512654, -1.470062, 1.905272, 1, 0, 0.03529412, 1,
2.525788, 1.190891, 0.6128979, 1, 0, 0.03137255, 1,
2.668533, -1.727806, 2.307721, 1, 0, 0.02352941, 1,
2.858999, 0.1706392, 3.478057, 1, 0, 0.01960784, 1,
2.870373, 0.001465594, 0.6126144, 1, 0, 0.01176471, 1,
2.8997, 0.7892463, 2.922516, 1, 0, 0.007843138, 1
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
-0.365611, -4.32834, -6.924909, 0, -0.5, 0.5, 0.5,
-0.365611, -4.32834, -6.924909, 1, -0.5, 0.5, 0.5,
-0.365611, -4.32834, -6.924909, 1, 1.5, 0.5, 0.5,
-0.365611, -4.32834, -6.924909, 0, 1.5, 0.5, 0.5
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
-4.737862, -0.1186004, -6.924909, 0, -0.5, 0.5, 0.5,
-4.737862, -0.1186004, -6.924909, 1, -0.5, 0.5, 0.5,
-4.737862, -0.1186004, -6.924909, 1, 1.5, 0.5, 0.5,
-4.737862, -0.1186004, -6.924909, 0, 1.5, 0.5, 0.5
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
-4.737862, -4.32834, -0.18448, 0, -0.5, 0.5, 0.5,
-4.737862, -4.32834, -0.18448, 1, -0.5, 0.5, 0.5,
-4.737862, -4.32834, -0.18448, 1, 1.5, 0.5, 0.5,
-4.737862, -4.32834, -0.18448, 0, 1.5, 0.5, 0.5
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
-3, -3.356861, -5.369425,
2, -3.356861, -5.369425,
-3, -3.356861, -5.369425,
-3, -3.518774, -5.628673,
-2, -3.356861, -5.369425,
-2, -3.518774, -5.628673,
-1, -3.356861, -5.369425,
-1, -3.518774, -5.628673,
0, -3.356861, -5.369425,
0, -3.518774, -5.628673,
1, -3.356861, -5.369425,
1, -3.518774, -5.628673,
2, -3.356861, -5.369425,
2, -3.518774, -5.628673
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
"2"
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
-3, -3.8426, -6.147167, 0, -0.5, 0.5, 0.5,
-3, -3.8426, -6.147167, 1, -0.5, 0.5, 0.5,
-3, -3.8426, -6.147167, 1, 1.5, 0.5, 0.5,
-3, -3.8426, -6.147167, 0, 1.5, 0.5, 0.5,
-2, -3.8426, -6.147167, 0, -0.5, 0.5, 0.5,
-2, -3.8426, -6.147167, 1, -0.5, 0.5, 0.5,
-2, -3.8426, -6.147167, 1, 1.5, 0.5, 0.5,
-2, -3.8426, -6.147167, 0, 1.5, 0.5, 0.5,
-1, -3.8426, -6.147167, 0, -0.5, 0.5, 0.5,
-1, -3.8426, -6.147167, 1, -0.5, 0.5, 0.5,
-1, -3.8426, -6.147167, 1, 1.5, 0.5, 0.5,
-1, -3.8426, -6.147167, 0, 1.5, 0.5, 0.5,
0, -3.8426, -6.147167, 0, -0.5, 0.5, 0.5,
0, -3.8426, -6.147167, 1, -0.5, 0.5, 0.5,
0, -3.8426, -6.147167, 1, 1.5, 0.5, 0.5,
0, -3.8426, -6.147167, 0, 1.5, 0.5, 0.5,
1, -3.8426, -6.147167, 0, -0.5, 0.5, 0.5,
1, -3.8426, -6.147167, 1, -0.5, 0.5, 0.5,
1, -3.8426, -6.147167, 1, 1.5, 0.5, 0.5,
1, -3.8426, -6.147167, 0, 1.5, 0.5, 0.5,
2, -3.8426, -6.147167, 0, -0.5, 0.5, 0.5,
2, -3.8426, -6.147167, 1, -0.5, 0.5, 0.5,
2, -3.8426, -6.147167, 1, 1.5, 0.5, 0.5,
2, -3.8426, -6.147167, 0, 1.5, 0.5, 0.5
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
-3.728881, -3, -5.369425,
-3.728881, 3, -5.369425,
-3.728881, -3, -5.369425,
-3.897045, -3, -5.628673,
-3.728881, -2, -5.369425,
-3.897045, -2, -5.628673,
-3.728881, -1, -5.369425,
-3.897045, -1, -5.628673,
-3.728881, 0, -5.369425,
-3.897045, 0, -5.628673,
-3.728881, 1, -5.369425,
-3.897045, 1, -5.628673,
-3.728881, 2, -5.369425,
-3.897045, 2, -5.628673,
-3.728881, 3, -5.369425,
-3.897045, 3, -5.628673
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
-4.233372, -3, -6.147167, 0, -0.5, 0.5, 0.5,
-4.233372, -3, -6.147167, 1, -0.5, 0.5, 0.5,
-4.233372, -3, -6.147167, 1, 1.5, 0.5, 0.5,
-4.233372, -3, -6.147167, 0, 1.5, 0.5, 0.5,
-4.233372, -2, -6.147167, 0, -0.5, 0.5, 0.5,
-4.233372, -2, -6.147167, 1, -0.5, 0.5, 0.5,
-4.233372, -2, -6.147167, 1, 1.5, 0.5, 0.5,
-4.233372, -2, -6.147167, 0, 1.5, 0.5, 0.5,
-4.233372, -1, -6.147167, 0, -0.5, 0.5, 0.5,
-4.233372, -1, -6.147167, 1, -0.5, 0.5, 0.5,
-4.233372, -1, -6.147167, 1, 1.5, 0.5, 0.5,
-4.233372, -1, -6.147167, 0, 1.5, 0.5, 0.5,
-4.233372, 0, -6.147167, 0, -0.5, 0.5, 0.5,
-4.233372, 0, -6.147167, 1, -0.5, 0.5, 0.5,
-4.233372, 0, -6.147167, 1, 1.5, 0.5, 0.5,
-4.233372, 0, -6.147167, 0, 1.5, 0.5, 0.5,
-4.233372, 1, -6.147167, 0, -0.5, 0.5, 0.5,
-4.233372, 1, -6.147167, 1, -0.5, 0.5, 0.5,
-4.233372, 1, -6.147167, 1, 1.5, 0.5, 0.5,
-4.233372, 1, -6.147167, 0, 1.5, 0.5, 0.5,
-4.233372, 2, -6.147167, 0, -0.5, 0.5, 0.5,
-4.233372, 2, -6.147167, 1, -0.5, 0.5, 0.5,
-4.233372, 2, -6.147167, 1, 1.5, 0.5, 0.5,
-4.233372, 2, -6.147167, 0, 1.5, 0.5, 0.5,
-4.233372, 3, -6.147167, 0, -0.5, 0.5, 0.5,
-4.233372, 3, -6.147167, 1, -0.5, 0.5, 0.5,
-4.233372, 3, -6.147167, 1, 1.5, 0.5, 0.5,
-4.233372, 3, -6.147167, 0, 1.5, 0.5, 0.5
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
-3.728881, -3.356861, -4,
-3.728881, -3.356861, 4,
-3.728881, -3.356861, -4,
-3.897045, -3.518774, -4,
-3.728881, -3.356861, -2,
-3.897045, -3.518774, -2,
-3.728881, -3.356861, 0,
-3.897045, -3.518774, 0,
-3.728881, -3.356861, 2,
-3.897045, -3.518774, 2,
-3.728881, -3.356861, 4,
-3.897045, -3.518774, 4
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
-4.233372, -3.8426, -4, 0, -0.5, 0.5, 0.5,
-4.233372, -3.8426, -4, 1, -0.5, 0.5, 0.5,
-4.233372, -3.8426, -4, 1, 1.5, 0.5, 0.5,
-4.233372, -3.8426, -4, 0, 1.5, 0.5, 0.5,
-4.233372, -3.8426, -2, 0, -0.5, 0.5, 0.5,
-4.233372, -3.8426, -2, 1, -0.5, 0.5, 0.5,
-4.233372, -3.8426, -2, 1, 1.5, 0.5, 0.5,
-4.233372, -3.8426, -2, 0, 1.5, 0.5, 0.5,
-4.233372, -3.8426, 0, 0, -0.5, 0.5, 0.5,
-4.233372, -3.8426, 0, 1, -0.5, 0.5, 0.5,
-4.233372, -3.8426, 0, 1, 1.5, 0.5, 0.5,
-4.233372, -3.8426, 0, 0, 1.5, 0.5, 0.5,
-4.233372, -3.8426, 2, 0, -0.5, 0.5, 0.5,
-4.233372, -3.8426, 2, 1, -0.5, 0.5, 0.5,
-4.233372, -3.8426, 2, 1, 1.5, 0.5, 0.5,
-4.233372, -3.8426, 2, 0, 1.5, 0.5, 0.5,
-4.233372, -3.8426, 4, 0, -0.5, 0.5, 0.5,
-4.233372, -3.8426, 4, 1, -0.5, 0.5, 0.5,
-4.233372, -3.8426, 4, 1, 1.5, 0.5, 0.5,
-4.233372, -3.8426, 4, 0, 1.5, 0.5, 0.5
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
-3.728881, -3.356861, -5.369425,
-3.728881, 3.119661, -5.369425,
-3.728881, -3.356861, 5.000465,
-3.728881, 3.119661, 5.000465,
-3.728881, -3.356861, -5.369425,
-3.728881, -3.356861, 5.000465,
-3.728881, 3.119661, -5.369425,
-3.728881, 3.119661, 5.000465,
-3.728881, -3.356861, -5.369425,
2.997659, -3.356861, -5.369425,
-3.728881, -3.356861, 5.000465,
2.997659, -3.356861, 5.000465,
-3.728881, 3.119661, -5.369425,
2.997659, 3.119661, -5.369425,
-3.728881, 3.119661, 5.000465,
2.997659, 3.119661, 5.000465,
2.997659, -3.356861, -5.369425,
2.997659, 3.119661, -5.369425,
2.997659, -3.356861, 5.000465,
2.997659, 3.119661, 5.000465,
2.997659, -3.356861, -5.369425,
2.997659, -3.356861, 5.000465,
2.997659, 3.119661, -5.369425,
2.997659, 3.119661, 5.000465
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
var radius = 7.451399;
var distance = 33.15211;
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
mvMatrix.translate( 0.365611, 0.1186004, 0.18448 );
mvMatrix.scale( 1.197733, 1.24397, 0.7769222 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.15211);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Nitenpyram<-read.table("Nitenpyram.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.630922, -0.08956421, -0.01976405, 0, 0, 1, 1, 1,
-3.202075, 0.2158576, -3.425891, 1, 0, 0, 1, 1,
-3.175915, 0.9507917, -0.859591, 1, 0, 0, 1, 1,
-2.776436, -1.011602, -1.801419, 1, 0, 0, 1, 1,
-2.68001, 0.8166456, -1.219241, 1, 0, 0, 1, 1,
-2.51975, -0.5688663, -1.556341, 1, 0, 0, 1, 1,
-2.47548, -0.03632118, -0.5055482, 0, 0, 0, 1, 1,
-2.374547, -0.7896844, -1.735041, 0, 0, 0, 1, 1,
-2.27278, 1.011541, -0.874081, 0, 0, 0, 1, 1,
-2.265745, -1.353272, -4.113285, 0, 0, 0, 1, 1,
-2.23164, -0.8189256, -0.4181569, 0, 0, 0, 1, 1,
-2.201802, 0.608691, -2.943336, 0, 0, 0, 1, 1,
-2.180142, 0.07062578, -2.307871, 0, 0, 0, 1, 1,
-2.163233, -0.3492113, -2.812102, 1, 1, 1, 1, 1,
-2.149947, -0.4176716, -2.808037, 1, 1, 1, 1, 1,
-2.077503, 0.1122789, -2.123796, 1, 1, 1, 1, 1,
-2.058542, 0.7149881, -0.6748464, 1, 1, 1, 1, 1,
-2.050021, -0.5101553, -0.5886409, 1, 1, 1, 1, 1,
-2.016531, 0.4085774, -2.316446, 1, 1, 1, 1, 1,
-2.013933, 0.8482772, -2.96982, 1, 1, 1, 1, 1,
-1.990967, -0.4939887, -1.700619, 1, 1, 1, 1, 1,
-1.981137, 1.641131, -2.20108, 1, 1, 1, 1, 1,
-1.974759, 0.1499914, -1.547966, 1, 1, 1, 1, 1,
-1.949073, -2.288483, -0.9466513, 1, 1, 1, 1, 1,
-1.94885, -0.6956549, -3.981612, 1, 1, 1, 1, 1,
-1.933166, -0.7164029, -2.548372, 1, 1, 1, 1, 1,
-1.93114, 0.94381, -2.389266, 1, 1, 1, 1, 1,
-1.908577, -0.4860942, -1.523857, 1, 1, 1, 1, 1,
-1.898932, -0.2614276, -2.240189, 0, 0, 1, 1, 1,
-1.898542, -0.7353984, -1.256568, 1, 0, 0, 1, 1,
-1.893917, -1.325692, -1.716819, 1, 0, 0, 1, 1,
-1.856338, -0.5740193, -0.1211521, 1, 0, 0, 1, 1,
-1.829665, 0.4903897, -0.6009909, 1, 0, 0, 1, 1,
-1.828367, 1.561403, -1.841484, 1, 0, 0, 1, 1,
-1.818348, 1.442988, -1.193298, 0, 0, 0, 1, 1,
-1.818048, -0.5253097, -3.33595, 0, 0, 0, 1, 1,
-1.813774, -1.097684, -1.375014, 0, 0, 0, 1, 1,
-1.805419, -1.358292, -3.351137, 0, 0, 0, 1, 1,
-1.788156, -1.07278, -1.884927, 0, 0, 0, 1, 1,
-1.775512, 1.742924, -1.580943, 0, 0, 0, 1, 1,
-1.769262, 0.2864468, -1.947672, 0, 0, 0, 1, 1,
-1.752754, -1.706709, -2.170509, 1, 1, 1, 1, 1,
-1.733856, -1.266582, -1.807149, 1, 1, 1, 1, 1,
-1.72199, -0.9557803, -1.723846, 1, 1, 1, 1, 1,
-1.721525, 0.4806453, 0.5187563, 1, 1, 1, 1, 1,
-1.7143, 1.66299, -1.539796, 1, 1, 1, 1, 1,
-1.709882, 1.617487, -1.89761, 1, 1, 1, 1, 1,
-1.701679, 0.29201, -1.303917, 1, 1, 1, 1, 1,
-1.700619, -0.5488709, -2.307562, 1, 1, 1, 1, 1,
-1.695118, -1.406177, -2.16392, 1, 1, 1, 1, 1,
-1.688393, -1.231493, -1.943785, 1, 1, 1, 1, 1,
-1.683657, -0.2560157, -1.492125, 1, 1, 1, 1, 1,
-1.669188, -0.7839016, -0.8253691, 1, 1, 1, 1, 1,
-1.652516, -1.869082, -4.974939, 1, 1, 1, 1, 1,
-1.645939, -0.5867954, -0.3947644, 1, 1, 1, 1, 1,
-1.637619, 1.303997, -0.8227961, 1, 1, 1, 1, 1,
-1.629452, -1.060152, -0.8901028, 0, 0, 1, 1, 1,
-1.617894, -0.4678019, -0.8789941, 1, 0, 0, 1, 1,
-1.61741, 0.572255, -0.6123329, 1, 0, 0, 1, 1,
-1.614849, 0.8291221, 0.9395608, 1, 0, 0, 1, 1,
-1.603539, -0.9913043, -3.362554, 1, 0, 0, 1, 1,
-1.593163, -0.3045379, -1.506444, 1, 0, 0, 1, 1,
-1.580337, -0.2033272, -1.927024, 0, 0, 0, 1, 1,
-1.570998, 0.5161191, -0.6840044, 0, 0, 0, 1, 1,
-1.558384, -0.5261028, -2.858283, 0, 0, 0, 1, 1,
-1.55568, 1.001692, 0.2235112, 0, 0, 0, 1, 1,
-1.550915, -1.257277, -2.567846, 0, 0, 0, 1, 1,
-1.519709, 1.0312, -0.3378316, 0, 0, 0, 1, 1,
-1.51911, -0.5286411, -2.059641, 0, 0, 0, 1, 1,
-1.478568, 0.3153417, -2.013172, 1, 1, 1, 1, 1,
-1.471404, 1.163629, 1.391976, 1, 1, 1, 1, 1,
-1.471071, 0.09748073, -1.56111, 1, 1, 1, 1, 1,
-1.470157, 0.2092576, 0.09333187, 1, 1, 1, 1, 1,
-1.461987, -0.5836162, -0.9484791, 1, 1, 1, 1, 1,
-1.439641, -0.531986, -1.130027, 1, 1, 1, 1, 1,
-1.433049, -0.141905, -2.048053, 1, 1, 1, 1, 1,
-1.426935, -0.2436749, -3.246001, 1, 1, 1, 1, 1,
-1.409308, -0.574615, -2.38627, 1, 1, 1, 1, 1,
-1.394357, -2.217639, -2.8781, 1, 1, 1, 1, 1,
-1.394125, -0.5818164, -1.376421, 1, 1, 1, 1, 1,
-1.391167, -0.8159363, -2.242032, 1, 1, 1, 1, 1,
-1.389437, -0.80316, -2.553296, 1, 1, 1, 1, 1,
-1.388613, 1.053451, -2.215653, 1, 1, 1, 1, 1,
-1.385901, 0.5184683, -2.603764, 1, 1, 1, 1, 1,
-1.38206, -0.3508582, -2.971036, 0, 0, 1, 1, 1,
-1.380454, 0.4115437, 0.4953765, 1, 0, 0, 1, 1,
-1.371711, -1.287235, -2.944585, 1, 0, 0, 1, 1,
-1.361635, -0.5464638, -3.240631, 1, 0, 0, 1, 1,
-1.356024, -0.6791068, -0.4358528, 1, 0, 0, 1, 1,
-1.350814, 0.01049855, -1.531925, 1, 0, 0, 1, 1,
-1.34735, 1.199483, -0.5128747, 0, 0, 0, 1, 1,
-1.339092, 2.331761, -1.564544, 0, 0, 0, 1, 1,
-1.337312, -1.040326, -3.458088, 0, 0, 0, 1, 1,
-1.336973, -0.5043002, -1.9131, 0, 0, 0, 1, 1,
-1.335454, 0.5973865, -1.789671, 0, 0, 0, 1, 1,
-1.334855, -0.1780175, -1.945194, 0, 0, 0, 1, 1,
-1.331407, -1.278687, -2.051774, 0, 0, 0, 1, 1,
-1.324799, 0.2573707, -0.4718077, 1, 1, 1, 1, 1,
-1.31132, 0.02415027, -2.707644, 1, 1, 1, 1, 1,
-1.311005, 0.5684921, -2.990101, 1, 1, 1, 1, 1,
-1.306128, 1.725975, 0.6698985, 1, 1, 1, 1, 1,
-1.302747, 0.2184012, -1.626632, 1, 1, 1, 1, 1,
-1.296762, -0.4872404, -4.125838, 1, 1, 1, 1, 1,
-1.266595, 0.2099309, 0.7884114, 1, 1, 1, 1, 1,
-1.263389, -0.4152473, -0.5444662, 1, 1, 1, 1, 1,
-1.254037, 0.7793987, -0.5470079, 1, 1, 1, 1, 1,
-1.253256, -1.423389, -2.199835, 1, 1, 1, 1, 1,
-1.253026, 1.418845, 0.3920324, 1, 1, 1, 1, 1,
-1.252311, -1.040965, -1.742891, 1, 1, 1, 1, 1,
-1.250216, 0.5750771, -2.875206, 1, 1, 1, 1, 1,
-1.23542, 0.5819047, 0.8570928, 1, 1, 1, 1, 1,
-1.229708, 1.699162, -1.700295, 1, 1, 1, 1, 1,
-1.22851, -0.1400415, -0.9160168, 0, 0, 1, 1, 1,
-1.226754, -0.621639, -2.134135, 1, 0, 0, 1, 1,
-1.221326, -1.636391, -1.973339, 1, 0, 0, 1, 1,
-1.214296, 0.03785922, -1.856791, 1, 0, 0, 1, 1,
-1.21379, -0.06427562, -2.051684, 1, 0, 0, 1, 1,
-1.206176, -1.049939, -2.890298, 1, 0, 0, 1, 1,
-1.205791, 1.681697, 1.997651, 0, 0, 0, 1, 1,
-1.203642, 0.05883297, -2.69386, 0, 0, 0, 1, 1,
-1.197831, 0.3180445, -2.336177, 0, 0, 0, 1, 1,
-1.196293, 0.493104, -0.04370277, 0, 0, 0, 1, 1,
-1.18139, 0.522785, -2.981833, 0, 0, 0, 1, 1,
-1.162685, 0.3359775, -1.623243, 0, 0, 0, 1, 1,
-1.152377, -0.367694, -1.013577, 0, 0, 0, 1, 1,
-1.139921, 0.1276176, -3.15301, 1, 1, 1, 1, 1,
-1.138523, -0.2275348, -1.304009, 1, 1, 1, 1, 1,
-1.136292, 0.5883369, -0.04321682, 1, 1, 1, 1, 1,
-1.135597, -0.6941335, -0.8520059, 1, 1, 1, 1, 1,
-1.130822, 0.6423455, -2.464947, 1, 1, 1, 1, 1,
-1.129207, 2.78693, 0.6203855, 1, 1, 1, 1, 1,
-1.125875, 0.2609382, -2.112045, 1, 1, 1, 1, 1,
-1.111677, 1.8716, 0.3757579, 1, 1, 1, 1, 1,
-1.11002, -1.81615, -3.091039, 1, 1, 1, 1, 1,
-1.098466, 0.7589574, -1.114672, 1, 1, 1, 1, 1,
-1.093446, 1.788141, -1.815427, 1, 1, 1, 1, 1,
-1.086737, 0.6590208, -1.520208, 1, 1, 1, 1, 1,
-1.078175, 0.1388359, -2.253586, 1, 1, 1, 1, 1,
-1.078065, 0.9460567, -1.450474, 1, 1, 1, 1, 1,
-1.065027, 1.946289, -1.288555, 1, 1, 1, 1, 1,
-1.062473, 1.122731, -0.8907259, 0, 0, 1, 1, 1,
-1.040474, 1.315564, -1.593697, 1, 0, 0, 1, 1,
-1.039875, 1.307495, -0.3226757, 1, 0, 0, 1, 1,
-1.038872, 0.896154, -0.7815885, 1, 0, 0, 1, 1,
-1.036807, 0.2139439, -0.4779484, 1, 0, 0, 1, 1,
-1.033399, -0.1394482, 0.2209853, 1, 0, 0, 1, 1,
-1.033096, -0.06227669, -1.27788, 0, 0, 0, 1, 1,
-1.030544, -0.312655, -2.768858, 0, 0, 0, 1, 1,
-1.029763, -1.938497, -3.057992, 0, 0, 0, 1, 1,
-1.014647, 0.3785342, -2.369674, 0, 0, 0, 1, 1,
-1.012367, 0.8670382, -1.235121, 0, 0, 0, 1, 1,
-1.011402, -0.7231858, -2.941107, 0, 0, 0, 1, 1,
-1.009369, -0.9301929, -1.502036, 0, 0, 0, 1, 1,
-1.006454, -0.374549, -1.412329, 1, 1, 1, 1, 1,
-1.006439, -1.843648, -3.205571, 1, 1, 1, 1, 1,
-1.004882, -0.03588914, -1.953096, 1, 1, 1, 1, 1,
-0.9992275, 1.450217, 0.7234153, 1, 1, 1, 1, 1,
-0.9952518, 0.4628169, -1.903169, 1, 1, 1, 1, 1,
-0.9869041, 0.4857982, -1.808278, 1, 1, 1, 1, 1,
-0.9861301, -0.9210421, -4.433887, 1, 1, 1, 1, 1,
-0.9848278, -0.8885181, -1.655689, 1, 1, 1, 1, 1,
-0.9834776, 0.03807195, -1.413272, 1, 1, 1, 1, 1,
-0.9804829, 1.418976, -0.7983614, 1, 1, 1, 1, 1,
-0.9800001, -0.707439, -4.11524, 1, 1, 1, 1, 1,
-0.9789935, -0.3537625, -4.482871, 1, 1, 1, 1, 1,
-0.9713801, -0.9705797, -3.337455, 1, 1, 1, 1, 1,
-0.9679529, 0.5143645, -1.156308, 1, 1, 1, 1, 1,
-0.9648933, -0.1421807, -0.3870826, 1, 1, 1, 1, 1,
-0.9620821, -0.3826144, -2.642553, 0, 0, 1, 1, 1,
-0.9613557, -0.009741464, -1.1426, 1, 0, 0, 1, 1,
-0.9575638, -0.6556205, -2.080313, 1, 0, 0, 1, 1,
-0.9548686, 0.01884945, -4.395154, 1, 0, 0, 1, 1,
-0.9483212, 1.45587, -1.755842, 1, 0, 0, 1, 1,
-0.9409803, -0.02258313, -1.85289, 1, 0, 0, 1, 1,
-0.9384661, 0.9806401, -1.413864, 0, 0, 0, 1, 1,
-0.9371567, 0.2530791, -2.539188, 0, 0, 0, 1, 1,
-0.9351458, -0.3755444, -2.051986, 0, 0, 0, 1, 1,
-0.9347576, 0.6252837, -1.544773, 0, 0, 0, 1, 1,
-0.9279198, 1.06355, -1.675062, 0, 0, 0, 1, 1,
-0.9253612, 0.01968526, -2.118808, 0, 0, 0, 1, 1,
-0.9233569, -0.2674983, -0.7776543, 0, 0, 0, 1, 1,
-0.9224306, -0.4554458, -2.137898, 1, 1, 1, 1, 1,
-0.9202797, 1.983592, -1.323128, 1, 1, 1, 1, 1,
-0.9194598, -1.053007, -0.4591017, 1, 1, 1, 1, 1,
-0.9169698, 1.200122, 0.6992061, 1, 1, 1, 1, 1,
-0.9142959, -0.865766, -1.081022, 1, 1, 1, 1, 1,
-0.8963785, -0.3484045, -1.034405, 1, 1, 1, 1, 1,
-0.8946908, 0.8790379, -0.9845896, 1, 1, 1, 1, 1,
-0.8864251, 0.290204, -0.1947248, 1, 1, 1, 1, 1,
-0.8854625, -0.2889591, -1.2061, 1, 1, 1, 1, 1,
-0.8841897, -0.23207, -2.78284, 1, 1, 1, 1, 1,
-0.8830784, 0.1136765, -1.541768, 1, 1, 1, 1, 1,
-0.8790447, -1.461362, -1.538141, 1, 1, 1, 1, 1,
-0.8745369, 0.4481803, -0.1497198, 1, 1, 1, 1, 1,
-0.8722589, 0.08959404, -0.81072, 1, 1, 1, 1, 1,
-0.8714016, -0.8689513, -0.9047292, 1, 1, 1, 1, 1,
-0.870856, -0.7505718, -2.841181, 0, 0, 1, 1, 1,
-0.8662199, -0.142655, -1.349125, 1, 0, 0, 1, 1,
-0.8618897, 0.3985128, -0.5957531, 1, 0, 0, 1, 1,
-0.8604355, 0.576941, -1.543282, 1, 0, 0, 1, 1,
-0.858385, 0.198026, 0.003863548, 1, 0, 0, 1, 1,
-0.8581032, -1.709846, -3.081316, 1, 0, 0, 1, 1,
-0.8553029, -0.6696371, -2.040997, 0, 0, 0, 1, 1,
-0.8545694, 0.8730376, 0.4330215, 0, 0, 0, 1, 1,
-0.8543542, 1.568093, 0.3965136, 0, 0, 0, 1, 1,
-0.8535559, 1.135038, -0.398742, 0, 0, 0, 1, 1,
-0.8493301, -0.04619675, -2.399691, 0, 0, 0, 1, 1,
-0.8467792, 0.4282252, -2.419785, 0, 0, 0, 1, 1,
-0.8317462, -1.151911, -2.208263, 0, 0, 0, 1, 1,
-0.8308402, -0.9535499, -2.232185, 1, 1, 1, 1, 1,
-0.8302127, 0.9554302, -0.8954111, 1, 1, 1, 1, 1,
-0.8290427, 1.558383, -0.6301361, 1, 1, 1, 1, 1,
-0.8278887, -1.001094, -2.071326, 1, 1, 1, 1, 1,
-0.8237066, -0.6391541, -1.25083, 1, 1, 1, 1, 1,
-0.8201834, -0.08167724, -1.201172, 1, 1, 1, 1, 1,
-0.8200316, -0.6193817, -1.3759, 1, 1, 1, 1, 1,
-0.8172289, -3.057019, -0.7489007, 1, 1, 1, 1, 1,
-0.8110703, 0.394751, -2.768893, 1, 1, 1, 1, 1,
-0.8093951, -0.4609443, -1.661009, 1, 1, 1, 1, 1,
-0.8093323, -0.3980088, -1.363264, 1, 1, 1, 1, 1,
-0.8070028, -0.7055196, -1.463885, 1, 1, 1, 1, 1,
-0.7997233, 0.090653, -1.897104, 1, 1, 1, 1, 1,
-0.7916034, 0.4186044, -0.2243052, 1, 1, 1, 1, 1,
-0.7851027, 1.047608, -2.007036, 1, 1, 1, 1, 1,
-0.7804424, 0.1686536, 0.1161068, 0, 0, 1, 1, 1,
-0.7802823, 1.470059, 1.012795, 1, 0, 0, 1, 1,
-0.7784625, -0.2975183, -1.568883, 1, 0, 0, 1, 1,
-0.7751294, -0.4429934, -2.011081, 1, 0, 0, 1, 1,
-0.7678092, 0.02644287, -1.228542, 1, 0, 0, 1, 1,
-0.7662593, 0.06946716, -1.475182, 1, 0, 0, 1, 1,
-0.7661849, 0.1308225, 0.1660284, 0, 0, 0, 1, 1,
-0.7661433, -1.043599, -3.134789, 0, 0, 0, 1, 1,
-0.7558956, 2.357215, 1.108305, 0, 0, 0, 1, 1,
-0.7523986, 0.4617657, -1.931252, 0, 0, 0, 1, 1,
-0.7503098, 0.9743285, -1.951073, 0, 0, 0, 1, 1,
-0.7499005, -0.196625, -1.933517, 0, 0, 0, 1, 1,
-0.7497213, 1.035138, -0.583849, 0, 0, 0, 1, 1,
-0.7488035, -0.5829864, -1.956869, 1, 1, 1, 1, 1,
-0.745029, -0.4371082, -2.098623, 1, 1, 1, 1, 1,
-0.7449029, -1.947733, -3.245216, 1, 1, 1, 1, 1,
-0.7389032, -1.936384, -3.005761, 1, 1, 1, 1, 1,
-0.7372557, -0.6148832, -2.159956, 1, 1, 1, 1, 1,
-0.7324318, 0.5168968, -0.5280002, 1, 1, 1, 1, 1,
-0.7316806, -0.3816215, -1.888762, 1, 1, 1, 1, 1,
-0.7249001, -0.5489196, -1.239923, 1, 1, 1, 1, 1,
-0.7199053, 0.5818719, -0.8821081, 1, 1, 1, 1, 1,
-0.7183029, 0.01425994, -2.855176, 1, 1, 1, 1, 1,
-0.7165508, 0.6808042, 0.8643409, 1, 1, 1, 1, 1,
-0.7160506, -0.9111591, -3.191761, 1, 1, 1, 1, 1,
-0.7128432, 1.001341, -2.42657, 1, 1, 1, 1, 1,
-0.7101614, -0.4574084, -3.062992, 1, 1, 1, 1, 1,
-0.7082223, -0.7777504, -2.554451, 1, 1, 1, 1, 1,
-0.7043898, -0.2098581, -0.06457896, 0, 0, 1, 1, 1,
-0.6977354, -0.3228779, -1.645306, 1, 0, 0, 1, 1,
-0.6942917, 0.1677808, -3.112436, 1, 0, 0, 1, 1,
-0.6929787, -0.001140415, -0.8844688, 1, 0, 0, 1, 1,
-0.6884335, -0.5060077, -2.449505, 1, 0, 0, 1, 1,
-0.6760795, -1.581768, -2.416062, 1, 0, 0, 1, 1,
-0.6717792, 1.351601, -2.646174, 0, 0, 0, 1, 1,
-0.667057, -0.1563357, -3.845966, 0, 0, 0, 1, 1,
-0.6658418, -1.329447, -2.525475, 0, 0, 0, 1, 1,
-0.665792, -0.3759049, -1.8952, 0, 0, 0, 1, 1,
-0.6645011, -0.2478696, -1.742363, 0, 0, 0, 1, 1,
-0.6630298, 1.466465, -0.5848018, 0, 0, 0, 1, 1,
-0.6623636, 2.006678, -1.712882, 0, 0, 0, 1, 1,
-0.6621082, 0.6313538, -1.027502, 1, 1, 1, 1, 1,
-0.6587697, -0.6651408, -1.500664, 1, 1, 1, 1, 1,
-0.6551832, -0.2489328, -2.577503, 1, 1, 1, 1, 1,
-0.6549861, 0.3037007, -2.559041, 1, 1, 1, 1, 1,
-0.6464828, 0.2228241, -0.3663336, 1, 1, 1, 1, 1,
-0.6450536, -0.9148285, -0.04854264, 1, 1, 1, 1, 1,
-0.6445255, -1.131957, -0.9973613, 1, 1, 1, 1, 1,
-0.6439079, -0.7205027, 0.359545, 1, 1, 1, 1, 1,
-0.6437843, 0.1581729, -0.1939665, 1, 1, 1, 1, 1,
-0.6399279, -1.286878, -3.034189, 1, 1, 1, 1, 1,
-0.6393535, -0.5747628, -1.243919, 1, 1, 1, 1, 1,
-0.6342853, 1.982153, 0.7650347, 1, 1, 1, 1, 1,
-0.6303714, -0.2532164, -3.063495, 1, 1, 1, 1, 1,
-0.625257, -2.465547, -3.567662, 1, 1, 1, 1, 1,
-0.6248636, 1.462471, 0.9888918, 1, 1, 1, 1, 1,
-0.6211774, 0.3133739, -2.980524, 0, 0, 1, 1, 1,
-0.6139062, -0.1466098, -2.819542, 1, 0, 0, 1, 1,
-0.6049227, -1.612831, -1.017138, 1, 0, 0, 1, 1,
-0.5967654, 0.4707671, -0.7458028, 1, 0, 0, 1, 1,
-0.5958403, -0.3084339, -1.00855, 1, 0, 0, 1, 1,
-0.5936326, 0.3639963, -1.374458, 1, 0, 0, 1, 1,
-0.5896804, -0.1576168, -2.16412, 0, 0, 0, 1, 1,
-0.5885621, 1.419103, -1.819033, 0, 0, 0, 1, 1,
-0.5773827, -0.9176281, -1.624631, 0, 0, 0, 1, 1,
-0.5726319, -0.8223909, -3.687418, 0, 0, 0, 1, 1,
-0.572419, -0.6536663, -3.221098, 0, 0, 0, 1, 1,
-0.5698859, 0.371713, -0.6952835, 0, 0, 0, 1, 1,
-0.5697671, 0.4758333, -0.02509064, 0, 0, 0, 1, 1,
-0.5691492, -1.698083, -3.301405, 1, 1, 1, 1, 1,
-0.5658054, 1.012537, -1.793798, 1, 1, 1, 1, 1,
-0.5629867, 0.08563578, -2.042485, 1, 1, 1, 1, 1,
-0.5622936, 0.5651955, -2.883023, 1, 1, 1, 1, 1,
-0.5599513, -0.1730055, -0.3650933, 1, 1, 1, 1, 1,
-0.5579106, -0.4482134, -2.24637, 1, 1, 1, 1, 1,
-0.5577663, 1.32781, -0.9489743, 1, 1, 1, 1, 1,
-0.5561342, 0.00653967, 0.5675121, 1, 1, 1, 1, 1,
-0.5558558, 0.297569, -0.2320779, 1, 1, 1, 1, 1,
-0.5549456, 0.1500738, 0.04783622, 1, 1, 1, 1, 1,
-0.5461534, 0.08736516, -1.047779, 1, 1, 1, 1, 1,
-0.5412241, -1.022912, -3.061852, 1, 1, 1, 1, 1,
-0.5407299, -0.449826, -1.178022, 1, 1, 1, 1, 1,
-0.5381057, -0.721314, -3.056365, 1, 1, 1, 1, 1,
-0.537865, -0.8614059, -1.977262, 1, 1, 1, 1, 1,
-0.5356887, -0.03610018, -1.397572, 0, 0, 1, 1, 1,
-0.535132, -0.9061996, -4.135255, 1, 0, 0, 1, 1,
-0.5340987, -2.104773, -2.739738, 1, 0, 0, 1, 1,
-0.5324319, 1.479577, -1.281755, 1, 0, 0, 1, 1,
-0.5320677, 1.249913, -0.1877049, 1, 0, 0, 1, 1,
-0.5263899, -0.002562918, -1.826102, 1, 0, 0, 1, 1,
-0.5241002, -0.2864916, -0.5176305, 0, 0, 0, 1, 1,
-0.52227, 0.8163687, -0.9480173, 0, 0, 0, 1, 1,
-0.5189798, -0.8395662, -2.624402, 0, 0, 0, 1, 1,
-0.5164781, 1.216178, 0.2774702, 0, 0, 0, 1, 1,
-0.5117465, 1.812411, 0.2896562, 0, 0, 0, 1, 1,
-0.5061116, 0.8413087, 0.1754062, 0, 0, 0, 1, 1,
-0.5042189, 0.1348077, -0.1040505, 0, 0, 0, 1, 1,
-0.5011584, 1.000096, -0.159077, 1, 1, 1, 1, 1,
-0.5002121, 0.3098814, -1.039682, 1, 1, 1, 1, 1,
-0.4999873, 0.08070131, -1.618561, 1, 1, 1, 1, 1,
-0.4964553, 2.093422, 1.264492, 1, 1, 1, 1, 1,
-0.4945489, 0.6529945, -1.189663, 1, 1, 1, 1, 1,
-0.4922326, -0.1241196, -2.237599, 1, 1, 1, 1, 1,
-0.4898424, -0.1482097, -1.968814, 1, 1, 1, 1, 1,
-0.4871844, 0.600063, -1.703904, 1, 1, 1, 1, 1,
-0.4868574, 0.8224727, -1.534909, 1, 1, 1, 1, 1,
-0.4845564, -0.04004996, 0.6617457, 1, 1, 1, 1, 1,
-0.4834, -0.6338142, -4.778924, 1, 1, 1, 1, 1,
-0.4833596, 0.8474546, -1.145619, 1, 1, 1, 1, 1,
-0.4828207, -1.400785, -4.147784, 1, 1, 1, 1, 1,
-0.4825656, -1.162433, -2.677477, 1, 1, 1, 1, 1,
-0.4819886, -0.7341402, -3.430261, 1, 1, 1, 1, 1,
-0.4811903, -0.366105, -2.350008, 0, 0, 1, 1, 1,
-0.4806573, 0.2200775, -0.8996017, 1, 0, 0, 1, 1,
-0.476981, -0.7023934, -4.040333, 1, 0, 0, 1, 1,
-0.4768048, -0.02274336, -2.478676, 1, 0, 0, 1, 1,
-0.4758512, -0.7854739, -2.656047, 1, 0, 0, 1, 1,
-0.4748617, 0.6165897, -1.60564, 1, 0, 0, 1, 1,
-0.473307, 1.374607, 0.9351594, 0, 0, 0, 1, 1,
-0.4677464, 0.6178298, -1.81307, 0, 0, 0, 1, 1,
-0.4673225, 1.718449, -1.555889, 0, 0, 0, 1, 1,
-0.4671458, 0.5993907, -2.074836, 0, 0, 0, 1, 1,
-0.4641293, 0.6516271, -1.202745, 0, 0, 0, 1, 1,
-0.4622096, -1.211935, -2.822555, 0, 0, 0, 1, 1,
-0.4620699, 0.3678875, -1.490799, 0, 0, 0, 1, 1,
-0.4564683, -0.1640692, 0.01145579, 1, 1, 1, 1, 1,
-0.4526198, 0.2823366, -2.080817, 1, 1, 1, 1, 1,
-0.4468933, 1.132562, -0.2365058, 1, 1, 1, 1, 1,
-0.4416204, -0.286132, -0.3524772, 1, 1, 1, 1, 1,
-0.4399563, 0.1239056, 0.7697231, 1, 1, 1, 1, 1,
-0.4397501, 0.3250906, -0.5654261, 1, 1, 1, 1, 1,
-0.437921, 0.8628018, 0.05529488, 1, 1, 1, 1, 1,
-0.4377159, -0.5706576, -2.809305, 1, 1, 1, 1, 1,
-0.4274775, -0.1935559, -2.508667, 1, 1, 1, 1, 1,
-0.4268017, 0.6779072, -0.5098193, 1, 1, 1, 1, 1,
-0.425984, 0.2834536, -0.1862485, 1, 1, 1, 1, 1,
-0.4249894, -0.2948636, -2.044533, 1, 1, 1, 1, 1,
-0.4210612, -3.003647, -1.528117, 1, 1, 1, 1, 1,
-0.4204661, -0.3510101, -3.295747, 1, 1, 1, 1, 1,
-0.4191962, -0.7920437, -1.624743, 1, 1, 1, 1, 1,
-0.4177815, -1.222825, -3.230525, 0, 0, 1, 1, 1,
-0.4159175, -3.114542, -4.126392, 1, 0, 0, 1, 1,
-0.4142866, -1.033749, -2.528666, 1, 0, 0, 1, 1,
-0.4122071, -0.4081668, -2.69949, 1, 0, 0, 1, 1,
-0.408032, 1.466843, -1.834288, 1, 0, 0, 1, 1,
-0.4047697, -0.5588748, -1.800214, 1, 0, 0, 1, 1,
-0.4041601, 0.4971378, 0.1653046, 0, 0, 0, 1, 1,
-0.400293, 2.142959, -0.2033611, 0, 0, 0, 1, 1,
-0.3981742, 0.5736411, 0.5374559, 0, 0, 0, 1, 1,
-0.3937393, 1.074893, -0.6665884, 0, 0, 0, 1, 1,
-0.3906412, -0.5910757, -3.696679, 0, 0, 0, 1, 1,
-0.390438, 0.1801939, -2.720773, 0, 0, 0, 1, 1,
-0.3886626, -0.3219765, -1.504854, 0, 0, 0, 1, 1,
-0.3825246, 2.705492, 0.1926067, 1, 1, 1, 1, 1,
-0.3728375, -0.9890332, -0.509356, 1, 1, 1, 1, 1,
-0.3723538, 0.277091, -0.6749829, 1, 1, 1, 1, 1,
-0.3706271, -0.5684006, -1.901895, 1, 1, 1, 1, 1,
-0.3697899, 1.320603, -1.105619, 1, 1, 1, 1, 1,
-0.3696904, -0.998462, -3.845724, 1, 1, 1, 1, 1,
-0.3628236, 0.4199626, -3.284511, 1, 1, 1, 1, 1,
-0.3606301, 0.2008621, -1.097729, 1, 1, 1, 1, 1,
-0.3570504, -0.1452989, -3.330783, 1, 1, 1, 1, 1,
-0.3568011, 1.480231, 0.1071569, 1, 1, 1, 1, 1,
-0.3563996, 1.119675, -0.3157588, 1, 1, 1, 1, 1,
-0.353848, -0.7268009, -1.13269, 1, 1, 1, 1, 1,
-0.3526392, -0.9069939, -2.91609, 1, 1, 1, 1, 1,
-0.3490537, -0.5868407, -2.492406, 1, 1, 1, 1, 1,
-0.3407431, 0.7873284, -1.876989, 1, 1, 1, 1, 1,
-0.3402194, -0.3969043, -1.851344, 0, 0, 1, 1, 1,
-0.3398909, -0.7192997, -4.08251, 1, 0, 0, 1, 1,
-0.3388026, -0.02455651, -1.706952, 1, 0, 0, 1, 1,
-0.333179, -1.064822, -4.081161, 1, 0, 0, 1, 1,
-0.3316474, 0.3679599, -1.227452, 1, 0, 0, 1, 1,
-0.3315724, 2.872003, 0.100685, 1, 0, 0, 1, 1,
-0.3244187, -0.04786342, -1.618596, 0, 0, 0, 1, 1,
-0.3241813, -0.0810688, -2.68146, 0, 0, 0, 1, 1,
-0.3174988, 0.5311407, 0.8479381, 0, 0, 0, 1, 1,
-0.3172193, -0.6077109, -2.134072, 0, 0, 0, 1, 1,
-0.3150299, 0.6209351, -0.8247752, 0, 0, 0, 1, 1,
-0.314212, -0.0851493, -2.771494, 0, 0, 0, 1, 1,
-0.3104745, 0.3965998, 0.4968152, 0, 0, 0, 1, 1,
-0.3041236, 0.5903595, -0.7472169, 1, 1, 1, 1, 1,
-0.3024968, -1.06376, -2.613998, 1, 1, 1, 1, 1,
-0.3008627, -1.740167, -3.099863, 1, 1, 1, 1, 1,
-0.2925819, -0.05123871, -0.6769297, 1, 1, 1, 1, 1,
-0.291396, -0.771338, -3.089236, 1, 1, 1, 1, 1,
-0.2885533, -0.7507888, -3.598317, 1, 1, 1, 1, 1,
-0.2870928, -0.7633933, -2.06813, 1, 1, 1, 1, 1,
-0.2847502, -1.150049, -2.576189, 1, 1, 1, 1, 1,
-0.2808972, 0.9064268, -0.9108148, 1, 1, 1, 1, 1,
-0.2776064, -0.8000108, -3.752638, 1, 1, 1, 1, 1,
-0.2719102, 0.6714914, 0.04116201, 1, 1, 1, 1, 1,
-0.2707517, 0.2035506, 0.5727745, 1, 1, 1, 1, 1,
-0.2704338, 0.2448306, 1.316197, 1, 1, 1, 1, 1,
-0.2684483, 1.799463, -1.447589, 1, 1, 1, 1, 1,
-0.2682232, -1.825932, -2.002513, 1, 1, 1, 1, 1,
-0.2658835, -0.5289713, -3.20012, 0, 0, 1, 1, 1,
-0.2637535, -0.9382656, -2.256672, 1, 0, 0, 1, 1,
-0.2634277, 0.9032995, 0.1762059, 1, 0, 0, 1, 1,
-0.2610886, 0.1907674, -1.670461, 1, 0, 0, 1, 1,
-0.2585379, -0.1774368, -2.811929, 1, 0, 0, 1, 1,
-0.257205, -0.3215582, -1.820426, 1, 0, 0, 1, 1,
-0.2566831, -1.628106, -3.791564, 0, 0, 0, 1, 1,
-0.2556024, 0.757107, 1.169168, 0, 0, 0, 1, 1,
-0.2555993, -0.7814821, -4.38094, 0, 0, 0, 1, 1,
-0.2428744, -1.828601, -2.499464, 0, 0, 0, 1, 1,
-0.2420773, 0.1788286, -1.885712, 0, 0, 0, 1, 1,
-0.2417473, -0.4282299, -2.012603, 0, 0, 0, 1, 1,
-0.2396152, 0.2821802, -1.38171, 0, 0, 0, 1, 1,
-0.2369165, 0.9573555, -0.7700124, 1, 1, 1, 1, 1,
-0.2344323, -0.684375, -3.408412, 1, 1, 1, 1, 1,
-0.2336685, 1.155395, -0.1506537, 1, 1, 1, 1, 1,
-0.2288906, 0.6106697, -1.021606, 1, 1, 1, 1, 1,
-0.2249367, 0.3993592, 0.1320295, 1, 1, 1, 1, 1,
-0.2231695, 0.722344, 0.3655154, 1, 1, 1, 1, 1,
-0.2226611, -1.974505, -3.365782, 1, 1, 1, 1, 1,
-0.2152483, 1.214932, -0.102055, 1, 1, 1, 1, 1,
-0.2149016, 0.2275776, -1.130912, 1, 1, 1, 1, 1,
-0.2103992, -1.009276, -3.371351, 1, 1, 1, 1, 1,
-0.2103886, 2.529855, -0.8643187, 1, 1, 1, 1, 1,
-0.2097231, 0.4853995, -0.7320757, 1, 1, 1, 1, 1,
-0.2095192, -3.262543, -5.218408, 1, 1, 1, 1, 1,
-0.2085946, -0.1248897, -1.754837, 1, 1, 1, 1, 1,
-0.2075824, -0.4217925, -1.539165, 1, 1, 1, 1, 1,
-0.2050346, -0.6409798, -3.814629, 0, 0, 1, 1, 1,
-0.2046221, 0.3668402, -1.102601, 1, 0, 0, 1, 1,
-0.2020857, 0.2231592, -0.7738783, 1, 0, 0, 1, 1,
-0.2008855, 0.07200191, -1.713891, 1, 0, 0, 1, 1,
-0.1997191, 0.46734, 0.03626012, 1, 0, 0, 1, 1,
-0.1957841, -0.04827204, -1.878114, 1, 0, 0, 1, 1,
-0.1950355, -1.358595, -1.771734, 0, 0, 0, 1, 1,
-0.181247, 0.04393213, -1.506611, 0, 0, 0, 1, 1,
-0.1801304, 1.195878, 0.5974581, 0, 0, 0, 1, 1,
-0.1795209, 0.1260347, -0.944308, 0, 0, 0, 1, 1,
-0.1787355, 1.997363, 0.9884682, 0, 0, 0, 1, 1,
-0.1786727, 0.07010695, -2.195778, 0, 0, 0, 1, 1,
-0.1720857, 0.1822693, 0.0008106671, 0, 0, 0, 1, 1,
-0.1711474, 0.3355613, -2.378418, 1, 1, 1, 1, 1,
-0.1707547, -0.9678897, -1.944296, 1, 1, 1, 1, 1,
-0.1682881, 0.156877, -0.405808, 1, 1, 1, 1, 1,
-0.1658046, 0.8650639, -0.5392337, 1, 1, 1, 1, 1,
-0.1650439, 1.038526, 1.228813, 1, 1, 1, 1, 1,
-0.163129, 0.4412556, -0.2502973, 1, 1, 1, 1, 1,
-0.1616119, 1.40047, -2.314929, 1, 1, 1, 1, 1,
-0.1576864, -0.07819779, -2.661816, 1, 1, 1, 1, 1,
-0.1531812, 0.7735069, -2.106446, 1, 1, 1, 1, 1,
-0.1524719, 1.14071, 0.1736008, 1, 1, 1, 1, 1,
-0.1499867, -0.9135643, -1.906727, 1, 1, 1, 1, 1,
-0.1476634, 0.3188217, 0.9928797, 1, 1, 1, 1, 1,
-0.1452585, 0.3176839, -0.8649622, 1, 1, 1, 1, 1,
-0.1424204, 2.359658, 0.3303049, 1, 1, 1, 1, 1,
-0.1412871, -0.1780341, -2.195327, 1, 1, 1, 1, 1,
-0.138881, -0.1230235, -1.340428, 0, 0, 1, 1, 1,
-0.1370342, -1.274184, -4.722046, 1, 0, 0, 1, 1,
-0.1348555, -0.5624789, -4.270154, 1, 0, 0, 1, 1,
-0.132794, 0.1760972, -1.257792, 1, 0, 0, 1, 1,
-0.1302448, -1.671848, -4.0006, 1, 0, 0, 1, 1,
-0.1281325, -1.032411, -1.78096, 1, 0, 0, 1, 1,
-0.1270345, -0.3827902, -3.627317, 0, 0, 0, 1, 1,
-0.1255068, -0.7017503, -3.605119, 0, 0, 0, 1, 1,
-0.1252936, 0.9600867, 0.04551109, 0, 0, 0, 1, 1,
-0.1149681, -0.8969982, -3.352986, 0, 0, 0, 1, 1,
-0.1074852, -0.06047554, -2.656582, 0, 0, 0, 1, 1,
-0.1074488, 0.3983181, 0.0429472, 0, 0, 0, 1, 1,
-0.1040011, -1.267022, -3.167894, 0, 0, 0, 1, 1,
-0.1030821, -1.232154, -3.482029, 1, 1, 1, 1, 1,
-0.1006156, -0.6002989, -2.173025, 1, 1, 1, 1, 1,
-0.09988706, -0.3583997, -4.347896, 1, 1, 1, 1, 1,
-0.09219202, 0.8779602, -0.07497715, 1, 1, 1, 1, 1,
-0.08738403, 0.04752056, -1.926835, 1, 1, 1, 1, 1,
-0.08466444, 0.5853889, -0.5449578, 1, 1, 1, 1, 1,
-0.08444452, -0.01766651, -1.698888, 1, 1, 1, 1, 1,
-0.07943361, -2.283929, -2.847404, 1, 1, 1, 1, 1,
-0.07901914, -0.7252969, -3.07794, 1, 1, 1, 1, 1,
-0.07801574, -0.3565989, -4.08762, 1, 1, 1, 1, 1,
-0.07060636, 0.5689905, -1.019663, 1, 1, 1, 1, 1,
-0.06294473, -0.8128835, -0.4815578, 1, 1, 1, 1, 1,
-0.06025071, 0.8349037, -1.591139, 1, 1, 1, 1, 1,
-0.05857789, 1.163298, 0.5186777, 1, 1, 1, 1, 1,
-0.05711527, 0.5540335, -0.2922345, 1, 1, 1, 1, 1,
-0.05217862, -0.5261217, -1.353064, 0, 0, 1, 1, 1,
-0.05024313, -0.2877865, -0.9602396, 1, 0, 0, 1, 1,
-0.0498408, 0.2277576, 0.03872783, 1, 0, 0, 1, 1,
-0.048963, -0.695151, -2.173005, 1, 0, 0, 1, 1,
-0.04860741, 0.1935544, 1.120979, 1, 0, 0, 1, 1,
-0.04469131, -1.911639, -2.116303, 1, 0, 0, 1, 1,
-0.04205831, -0.5860466, -3.021166, 0, 0, 0, 1, 1,
-0.03948463, 1.176071, -1.066438, 0, 0, 0, 1, 1,
-0.03789621, 1.304186, -0.9569158, 0, 0, 0, 1, 1,
-0.0373424, 0.2341227, -1.885286, 0, 0, 0, 1, 1,
-0.03647863, -0.2969963, -3.390994, 0, 0, 0, 1, 1,
-0.02196899, -0.9864118, -3.75901, 0, 0, 0, 1, 1,
-0.02172848, -1.094089, -3.63252, 0, 0, 0, 1, 1,
-0.02080256, -1.192294, -2.793823, 1, 1, 1, 1, 1,
-0.01758381, 0.6646103, 0.4615116, 1, 1, 1, 1, 1,
-0.0175369, 1.051732, -0.695235, 1, 1, 1, 1, 1,
-0.01451462, -1.077427, -1.94289, 1, 1, 1, 1, 1,
-0.01159986, 0.8663314, 1.83341, 1, 1, 1, 1, 1,
-0.005998383, 0.8136051, 0.4664681, 1, 1, 1, 1, 1,
-0.003259259, 0.1232182, -0.1228677, 1, 1, 1, 1, 1,
-0.002757332, -1.214171, -2.490288, 1, 1, 1, 1, 1,
-0.0005149661, -0.6614038, -2.485063, 1, 1, 1, 1, 1,
-0.0005066406, 0.2714359, 0.6255067, 1, 1, 1, 1, 1,
-0.0001405924, -1.980345, -1.840745, 1, 1, 1, 1, 1,
0.0001362151, -0.002145916, 2.996555, 1, 1, 1, 1, 1,
0.00458741, 0.7829567, 0.8289596, 1, 1, 1, 1, 1,
0.004792594, -0.3493308, 3.973565, 1, 1, 1, 1, 1,
0.009876662, -1.322148, 4.849448, 1, 1, 1, 1, 1,
0.01331975, -1.213863, 2.673055, 0, 0, 1, 1, 1,
0.01467674, 1.099495, -2.144602, 1, 0, 0, 1, 1,
0.02002345, -1.518844, 2.979612, 1, 0, 0, 1, 1,
0.02016896, 0.3999639, 1.189426, 1, 0, 0, 1, 1,
0.0205531, -1.787014, 2.399412, 1, 0, 0, 1, 1,
0.02691855, 0.6983766, -0.4925441, 1, 0, 0, 1, 1,
0.02758138, 0.4553764, 1.64935, 0, 0, 0, 1, 1,
0.02987943, -1.271921, 3.118443, 0, 0, 0, 1, 1,
0.02995282, -1.050627, 4.331761, 0, 0, 0, 1, 1,
0.03521507, -0.9770045, 2.847518, 0, 0, 0, 1, 1,
0.04220366, 1.817313, -0.3465096, 0, 0, 0, 1, 1,
0.04477414, 2.616637, -0.783671, 0, 0, 0, 1, 1,
0.04563576, -0.04554971, 1.878183, 0, 0, 0, 1, 1,
0.04673241, 1.148636, 0.5598441, 1, 1, 1, 1, 1,
0.04678588, -0.5370905, 2.88673, 1, 1, 1, 1, 1,
0.04678936, -0.5757417, 3.239094, 1, 1, 1, 1, 1,
0.04891408, 0.9895363, 2.006101, 1, 1, 1, 1, 1,
0.05003222, 0.4801331, -0.7692321, 1, 1, 1, 1, 1,
0.06056771, -1.57986, 2.264359, 1, 1, 1, 1, 1,
0.0613744, -0.2520365, 2.024538, 1, 1, 1, 1, 1,
0.06413877, -0.2218811, 3.478196, 1, 1, 1, 1, 1,
0.06447461, -0.8859947, 2.915492, 1, 1, 1, 1, 1,
0.06904858, 0.5810311, -0.07000517, 1, 1, 1, 1, 1,
0.07238784, 0.6995828, 0.06666331, 1, 1, 1, 1, 1,
0.07663654, -0.3201365, 3.510751, 1, 1, 1, 1, 1,
0.07776251, -2.337631, 1.767782, 1, 1, 1, 1, 1,
0.08314691, -0.9543153, 1.409836, 1, 1, 1, 1, 1,
0.08331472, 0.324667, 1.310434, 1, 1, 1, 1, 1,
0.08993123, -1.050293, 2.329218, 0, 0, 1, 1, 1,
0.09089868, -1.015352, 2.221946, 1, 0, 0, 1, 1,
0.112333, -1.590291, 4.008233, 1, 0, 0, 1, 1,
0.1136022, -1.159009, 1.776636, 1, 0, 0, 1, 1,
0.1137582, -0.6252462, 3.076064, 1, 0, 0, 1, 1,
0.1150113, -2.060264, 1.913522, 1, 0, 0, 1, 1,
0.11737, 1.202543, -1.651125, 0, 0, 0, 1, 1,
0.1179948, 0.3254921, 0.9368099, 0, 0, 0, 1, 1,
0.1217594, -1.090709, 3.973946, 0, 0, 0, 1, 1,
0.1220858, -1.473847, 4.153885, 0, 0, 0, 1, 1,
0.1254195, -0.331249, 2.758422, 0, 0, 0, 1, 1,
0.1268592, -0.4412217, 2.865833, 0, 0, 0, 1, 1,
0.1284452, -0.6098487, 3.068764, 0, 0, 0, 1, 1,
0.1296877, -1.062094, 3.300738, 1, 1, 1, 1, 1,
0.1318539, 0.3607893, 0.7357322, 1, 1, 1, 1, 1,
0.1368714, 0.7242348, 1.103925, 1, 1, 1, 1, 1,
0.1369527, -0.7910947, 2.864051, 1, 1, 1, 1, 1,
0.141665, -0.8898491, 3.125091, 1, 1, 1, 1, 1,
0.1417125, -2.422594, 3.393653, 1, 1, 1, 1, 1,
0.1419298, 3.025342, 0.09023312, 1, 1, 1, 1, 1,
0.142072, -1.369498, 3.981725, 1, 1, 1, 1, 1,
0.1423137, 0.804563, -0.3439336, 1, 1, 1, 1, 1,
0.1428716, 2.317261, 1.325251, 1, 1, 1, 1, 1,
0.1470279, 0.4362661, 0.9228851, 1, 1, 1, 1, 1,
0.1516505, 0.9014735, -0.7494305, 1, 1, 1, 1, 1,
0.1524456, 1.808729, -0.9405847, 1, 1, 1, 1, 1,
0.1560495, 1.105858, -0.04058649, 1, 1, 1, 1, 1,
0.1577434, 1.189136, 1.892013, 1, 1, 1, 1, 1,
0.1587394, -0.3330727, 1.872084, 0, 0, 1, 1, 1,
0.1646661, 0.5570472, 1.032807, 1, 0, 0, 1, 1,
0.1694548, -0.6276315, 4.314221, 1, 0, 0, 1, 1,
0.1704478, 0.8409273, -0.4509621, 1, 0, 0, 1, 1,
0.1719963, 0.01131519, 3.472034, 1, 0, 0, 1, 1,
0.1755306, 0.3692331, -0.8839102, 1, 0, 0, 1, 1,
0.1776823, -0.2343173, 2.069319, 0, 0, 0, 1, 1,
0.1799711, 0.1213898, -1.01234, 0, 0, 0, 1, 1,
0.1820425, 0.6693751, 1.786729, 0, 0, 0, 1, 1,
0.1856822, 0.1802162, 1.467067, 0, 0, 0, 1, 1,
0.1862315, -0.8142833, 4.239104, 0, 0, 0, 1, 1,
0.1867203, -0.2342636, 2.972183, 0, 0, 0, 1, 1,
0.1887513, 1.051008, 2.198319, 0, 0, 0, 1, 1,
0.1891652, 1.086476, 1.451177, 1, 1, 1, 1, 1,
0.1917863, 0.5234625, 0.1932652, 1, 1, 1, 1, 1,
0.1983634, -1.684448, 3.117079, 1, 1, 1, 1, 1,
0.2029792, -0.9560767, 1.983671, 1, 1, 1, 1, 1,
0.2051662, 0.4359328, 1.536758, 1, 1, 1, 1, 1,
0.2055397, -0.5823165, 4.03633, 1, 1, 1, 1, 1,
0.2141846, 0.02896495, 0.1604512, 1, 1, 1, 1, 1,
0.2175007, -1.762838, 2.046748, 1, 1, 1, 1, 1,
0.220558, -0.2728294, 2.850381, 1, 1, 1, 1, 1,
0.221527, -1.656769, 3.056237, 1, 1, 1, 1, 1,
0.2232166, 2.77973, 0.7635824, 1, 1, 1, 1, 1,
0.223332, 0.5485123, -0.08496498, 1, 1, 1, 1, 1,
0.2234863, 0.2041252, 1.690007, 1, 1, 1, 1, 1,
0.2264675, -0.6503519, 2.625595, 1, 1, 1, 1, 1,
0.233293, 0.03535713, 2.451873, 1, 1, 1, 1, 1,
0.2348945, 0.5374204, 1.174983, 0, 0, 1, 1, 1,
0.2350715, 0.7427195, 1.150335, 1, 0, 0, 1, 1,
0.238334, 0.1634589, 0.04379523, 1, 0, 0, 1, 1,
0.2420515, 0.04065027, 1.997769, 1, 0, 0, 1, 1,
0.2444419, 0.5935153, 2.012403, 1, 0, 0, 1, 1,
0.2466577, 0.3030684, 0.5929648, 1, 0, 0, 1, 1,
0.2490918, -0.5832577, 2.379162, 0, 0, 0, 1, 1,
0.2492952, 0.9904574, -0.1490701, 0, 0, 0, 1, 1,
0.249687, -0.3537742, 3.375162, 0, 0, 0, 1, 1,
0.250727, 0.007344712, 1.464274, 0, 0, 0, 1, 1,
0.2548225, 1.329586, 0.7028142, 0, 0, 0, 1, 1,
0.2552809, 1.004173, 0.1831174, 0, 0, 0, 1, 1,
0.256864, -0.5115296, 1.883336, 0, 0, 0, 1, 1,
0.2616477, 2.474589, -1.923511, 1, 1, 1, 1, 1,
0.2647766, -1.434307, 2.097677, 1, 1, 1, 1, 1,
0.2708677, 0.5849572, 0.5074255, 1, 1, 1, 1, 1,
0.2840877, -0.01133034, 0.2461487, 1, 1, 1, 1, 1,
0.2918018, -0.03127659, 2.978086, 1, 1, 1, 1, 1,
0.2935686, 0.3379509, 2.060192, 1, 1, 1, 1, 1,
0.2936561, -0.4023428, 2.870352, 1, 1, 1, 1, 1,
0.3005635, 0.7764831, 2.132846, 1, 1, 1, 1, 1,
0.3087956, 0.3498058, 1.172238, 1, 1, 1, 1, 1,
0.311803, -1.58478, 1.89435, 1, 1, 1, 1, 1,
0.3121096, -0.00754469, 1.50405, 1, 1, 1, 1, 1,
0.3123434, 0.4951147, -1.508398, 1, 1, 1, 1, 1,
0.3125857, 1.028268, -0.2676232, 1, 1, 1, 1, 1,
0.3128359, 0.3361662, -0.149225, 1, 1, 1, 1, 1,
0.3155504, 2.028961, 1.305807, 1, 1, 1, 1, 1,
0.3240042, -0.0565335, 3.253173, 0, 0, 1, 1, 1,
0.326731, -0.1959912, 1.12039, 1, 0, 0, 1, 1,
0.3325017, -0.5544338, 2.312749, 1, 0, 0, 1, 1,
0.3352314, 0.08294541, 1.665628, 1, 0, 0, 1, 1,
0.336119, 0.3243595, 0.7697998, 1, 0, 0, 1, 1,
0.3369812, -0.02301452, 1.946923, 1, 0, 0, 1, 1,
0.3376079, -1.018553, 4.745667, 0, 0, 0, 1, 1,
0.3411312, 0.6204342, -0.4886099, 0, 0, 0, 1, 1,
0.3436946, 0.1616666, 0.8818565, 0, 0, 0, 1, 1,
0.343849, 1.156223, 0.942787, 0, 0, 0, 1, 1,
0.3448903, -0.4192997, 1.020566, 0, 0, 0, 1, 1,
0.3466679, -0.1900257, 1.979354, 0, 0, 0, 1, 1,
0.352546, -0.1815196, 2.664108, 0, 0, 0, 1, 1,
0.3612823, -0.3952517, 2.461812, 1, 1, 1, 1, 1,
0.3640551, 0.2591882, 1.303347, 1, 1, 1, 1, 1,
0.3644402, 1.075982, 0.187152, 1, 1, 1, 1, 1,
0.3677951, -0.6681086, 1.89887, 1, 1, 1, 1, 1,
0.3711414, 0.1044783, -0.1383504, 1, 1, 1, 1, 1,
0.3732499, 0.6784604, -1.277092, 1, 1, 1, 1, 1,
0.3756039, -0.1066763, 3.620363, 1, 1, 1, 1, 1,
0.3811817, -0.1916318, -0.3578601, 1, 1, 1, 1, 1,
0.3829881, -1.392202, 1.73124, 1, 1, 1, 1, 1,
0.3865587, -1.862808, 3.552276, 1, 1, 1, 1, 1,
0.3870179, -1.077561, 3.80499, 1, 1, 1, 1, 1,
0.3902191, 2.064135, -0.4565061, 1, 1, 1, 1, 1,
0.3977542, -0.7925516, 4.161619, 1, 1, 1, 1, 1,
0.4062164, -0.3824151, 1.030623, 1, 1, 1, 1, 1,
0.412486, 2.00457, 1.653695, 1, 1, 1, 1, 1,
0.4154828, -0.1420432, 1.821007, 0, 0, 1, 1, 1,
0.4159022, 0.4166785, 1.17671, 1, 0, 0, 1, 1,
0.4186975, 0.8382161, 0.4092643, 1, 0, 0, 1, 1,
0.4211978, -0.1993482, 2.239845, 1, 0, 0, 1, 1,
0.421592, -1.611576, 3.073631, 1, 0, 0, 1, 1,
0.4220759, -2.08965, 0.4420586, 1, 0, 0, 1, 1,
0.4236071, -0.4274654, 2.488232, 0, 0, 0, 1, 1,
0.4240798, 1.798795, 1.436232, 0, 0, 0, 1, 1,
0.425462, 0.04553503, 1.668351, 0, 0, 0, 1, 1,
0.4256147, -0.510288, 2.159269, 0, 0, 0, 1, 1,
0.4277475, 1.879953, -0.130832, 0, 0, 0, 1, 1,
0.429322, 0.1702083, 1.250359, 0, 0, 0, 1, 1,
0.4355713, -2.768111, 1.618973, 0, 0, 0, 1, 1,
0.4437353, -0.4892808, 3.280892, 1, 1, 1, 1, 1,
0.4454849, 0.3138128, 0.8713967, 1, 1, 1, 1, 1,
0.4474323, 0.2110687, 0.5841319, 1, 1, 1, 1, 1,
0.4505232, 0.2747817, 2.135508, 1, 1, 1, 1, 1,
0.450541, 0.4967176, 0.5897586, 1, 1, 1, 1, 1,
0.4576591, -0.247198, 1.979591, 1, 1, 1, 1, 1,
0.4621534, -2.368655, 3.559145, 1, 1, 1, 1, 1,
0.4657364, 1.204788, 2.195387, 1, 1, 1, 1, 1,
0.4768489, -0.2546378, 0.8321582, 1, 1, 1, 1, 1,
0.4788919, -0.06903642, 1.169784, 1, 1, 1, 1, 1,
0.4822565, -0.2304468, 0.7147526, 1, 1, 1, 1, 1,
0.4830804, -0.1834244, 1.233755, 1, 1, 1, 1, 1,
0.4845133, -0.8983077, 3.034735, 1, 1, 1, 1, 1,
0.4869119, 0.3139693, 1.724519, 1, 1, 1, 1, 1,
0.4934113, 0.2142079, 0.5591694, 1, 1, 1, 1, 1,
0.4963121, 0.8554592, 1.312814, 0, 0, 1, 1, 1,
0.4982034, 0.8017436, 1.508006, 1, 0, 0, 1, 1,
0.4996293, 0.3440492, 0.4468242, 1, 0, 0, 1, 1,
0.50644, 0.2249118, 0.8389612, 1, 0, 0, 1, 1,
0.512241, -0.05319955, 0.8232374, 1, 0, 0, 1, 1,
0.5128192, -0.009001506, 2.354326, 1, 0, 0, 1, 1,
0.5140255, -1.058859, 3.455375, 0, 0, 0, 1, 1,
0.5208116, 1.506229, 0.7836386, 0, 0, 0, 1, 1,
0.5263681, 0.6699299, 0.6656767, 0, 0, 0, 1, 1,
0.5277925, 0.1544813, 0.853099, 0, 0, 0, 1, 1,
0.5278534, -0.3244998, 1.125943, 0, 0, 0, 1, 1,
0.5378963, -0.2177287, 2.437687, 0, 0, 0, 1, 1,
0.5417331, -0.04816628, 1.050873, 0, 0, 0, 1, 1,
0.5423376, -0.6231696, 2.224528, 1, 1, 1, 1, 1,
0.5428621, 1.698981, -0.360638, 1, 1, 1, 1, 1,
0.5457278, 0.6630917, -0.8637583, 1, 1, 1, 1, 1,
0.5467997, -1.193051, 1.858562, 1, 1, 1, 1, 1,
0.5512698, 0.7576919, 1.979636, 1, 1, 1, 1, 1,
0.5569898, 0.3305871, 0.7908739, 1, 1, 1, 1, 1,
0.5579358, 1.555813, -0.9635075, 1, 1, 1, 1, 1,
0.5605856, -0.240308, 3.23601, 1, 1, 1, 1, 1,
0.5624612, 0.1059059, -0.05654782, 1, 1, 1, 1, 1,
0.571477, 0.7494616, -0.7666124, 1, 1, 1, 1, 1,
0.5715405, -1.942478, 3.917929, 1, 1, 1, 1, 1,
0.5800243, -0.259586, 0.1665961, 1, 1, 1, 1, 1,
0.5827939, -1.032413, 0.8892298, 1, 1, 1, 1, 1,
0.5844412, -0.009460595, 0.9340729, 1, 1, 1, 1, 1,
0.5861219, -0.719969, 1.314621, 1, 1, 1, 1, 1,
0.5967832, 0.04783984, 2.938814, 0, 0, 1, 1, 1,
0.5984332, 1.307691, 0.5884491, 1, 0, 0, 1, 1,
0.6002178, -1.059964, 2.58764, 1, 0, 0, 1, 1,
0.6027752, 0.9729679, 0.9074361, 1, 0, 0, 1, 1,
0.6121187, 0.7679861, 0.4609689, 1, 0, 0, 1, 1,
0.6135523, 0.5540707, 0.1880381, 1, 0, 0, 1, 1,
0.6136446, 0.4050663, 1.854827, 0, 0, 0, 1, 1,
0.6140608, 2.100917, 1.578339, 0, 0, 0, 1, 1,
0.6142625, 0.1472302, 1.561282, 0, 0, 0, 1, 1,
0.6162288, -1.717318, 1.48479, 0, 0, 0, 1, 1,
0.6187431, -0.8979415, 3.12015, 0, 0, 0, 1, 1,
0.6216738, -0.3833387, 0.1455492, 0, 0, 0, 1, 1,
0.6253147, 0.8701085, 1.075296, 0, 0, 0, 1, 1,
0.6286316, -0.5297285, 3.535968, 1, 1, 1, 1, 1,
0.6317271, -0.1162921, 1.167594, 1, 1, 1, 1, 1,
0.6326805, 2.941941, -0.6047998, 1, 1, 1, 1, 1,
0.6341221, -1.210933, 1.866142, 1, 1, 1, 1, 1,
0.6402798, -1.59203, 2.76358, 1, 1, 1, 1, 1,
0.640982, -2.328101, 2.038497, 1, 1, 1, 1, 1,
0.6425189, 0.7718719, 1.959821, 1, 1, 1, 1, 1,
0.6435518, 0.1720532, 2.518545, 1, 1, 1, 1, 1,
0.6438153, 0.6095442, -0.468919, 1, 1, 1, 1, 1,
0.6449074, 1.810928, -0.7150818, 1, 1, 1, 1, 1,
0.6449509, 0.08563273, -0.3733124, 1, 1, 1, 1, 1,
0.6479724, -0.7218108, 2.616357, 1, 1, 1, 1, 1,
0.6512467, -0.7216154, 0.5181963, 1, 1, 1, 1, 1,
0.6524022, 0.03734553, -0.3399485, 1, 1, 1, 1, 1,
0.6609386, -0.4033985, 4.096522, 1, 1, 1, 1, 1,
0.6634051, 1.849726, 0.2382195, 0, 0, 1, 1, 1,
0.6636462, 1.30032, 0.05211671, 1, 0, 0, 1, 1,
0.666606, 1.835951, 1.51737, 1, 0, 0, 1, 1,
0.6724997, 0.1112845, 1.702735, 1, 0, 0, 1, 1,
0.6749955, 0.001348382, 0.9099619, 1, 0, 0, 1, 1,
0.6752509, 0.8363354, 0.4971846, 1, 0, 0, 1, 1,
0.6782915, -0.05850161, 0.7737121, 0, 0, 0, 1, 1,
0.6817002, 1.387672, 1.609892, 0, 0, 0, 1, 1,
0.6820952, -1.037357, 3.007763, 0, 0, 0, 1, 1,
0.683544, 0.7800719, 1.211048, 0, 0, 0, 1, 1,
0.683851, -0.142745, 0.360373, 0, 0, 0, 1, 1,
0.6912364, -1.377515, 1.532761, 0, 0, 0, 1, 1,
0.6923434, 0.5844306, -0.7386703, 0, 0, 0, 1, 1,
0.6929421, -1.071829, 3.734114, 1, 1, 1, 1, 1,
0.6931201, -1.031495, 2.139364, 1, 1, 1, 1, 1,
0.6933953, -0.7928627, 2.891815, 1, 1, 1, 1, 1,
0.6937099, -0.7075747, 1.356499, 1, 1, 1, 1, 1,
0.694909, 1.393046, 1.51087, 1, 1, 1, 1, 1,
0.6974621, 0.08557355, 1.11765, 1, 1, 1, 1, 1,
0.6997791, 0.7717822, 0.7630294, 1, 1, 1, 1, 1,
0.705554, 0.7813038, 1.813363, 1, 1, 1, 1, 1,
0.705988, 0.4337884, 1.498491, 1, 1, 1, 1, 1,
0.7060611, 0.4023456, 1.591482, 1, 1, 1, 1, 1,
0.7063013, 0.6036678, 2.000976, 1, 1, 1, 1, 1,
0.7137369, 0.4572111, 0.2023086, 1, 1, 1, 1, 1,
0.7153851, -1.658039, 1.477762, 1, 1, 1, 1, 1,
0.7201248, 0.6923963, 0.006250668, 1, 1, 1, 1, 1,
0.7264951, 0.04346555, 1.22342, 1, 1, 1, 1, 1,
0.7274673, -0.7210031, 0.7955143, 0, 0, 1, 1, 1,
0.7286821, -1.284461, 0.1344059, 1, 0, 0, 1, 1,
0.730435, -0.3189987, 0.3403778, 1, 0, 0, 1, 1,
0.7304848, -1.42226, 2.410725, 1, 0, 0, 1, 1,
0.7405058, 0.4442073, 1.117837, 1, 0, 0, 1, 1,
0.7447182, -0.677973, 3.050607, 1, 0, 0, 1, 1,
0.7470807, 0.0763675, -0.9155763, 0, 0, 0, 1, 1,
0.7554641, -0.2986186, 2.357208, 0, 0, 0, 1, 1,
0.7680595, 0.2449909, 0.9727939, 0, 0, 0, 1, 1,
0.7706347, -0.2112467, 2.986359, 0, 0, 0, 1, 1,
0.7810149, -0.372378, 3.827876, 0, 0, 0, 1, 1,
0.7849804, -0.8943154, 2.024177, 0, 0, 0, 1, 1,
0.7883759, -0.8595861, 1.96877, 0, 0, 0, 1, 1,
0.7957768, 0.3810119, 1.558315, 1, 1, 1, 1, 1,
0.7995158, 1.389609, 0.9428439, 1, 1, 1, 1, 1,
0.8043455, -0.9107326, 0.6099371, 1, 1, 1, 1, 1,
0.8054941, -0.8961202, 0.212562, 1, 1, 1, 1, 1,
0.8056995, -0.5559784, 1.586594, 1, 1, 1, 1, 1,
0.8119134, 0.2538805, 0.5678249, 1, 1, 1, 1, 1,
0.8120854, 1.990067, 0.300958, 1, 1, 1, 1, 1,
0.8135397, -0.8062893, 1.365561, 1, 1, 1, 1, 1,
0.8147444, 0.2913921, 0.5603394, 1, 1, 1, 1, 1,
0.8199284, -0.9622238, 3.02125, 1, 1, 1, 1, 1,
0.8200979, -1.634131, 3.515771, 1, 1, 1, 1, 1,
0.8222766, 0.4965373, 0.7974578, 1, 1, 1, 1, 1,
0.8236642, -0.08584531, 2.395609, 1, 1, 1, 1, 1,
0.8239194, -1.327104, 2.083409, 1, 1, 1, 1, 1,
0.8274657, -0.3871183, -0.4359704, 1, 1, 1, 1, 1,
0.8279085, -0.7600164, 3.156568, 0, 0, 1, 1, 1,
0.8329686, -0.7783611, 3.92046, 1, 0, 0, 1, 1,
0.8407091, -0.643058, 2.104007, 1, 0, 0, 1, 1,
0.8410571, 1.189583, 1.262491, 1, 0, 0, 1, 1,
0.843811, 0.2719932, 0.1798548, 1, 0, 0, 1, 1,
0.8577628, -2.068179, 3.329823, 1, 0, 0, 1, 1,
0.8594513, 0.4462543, -1.080727, 0, 0, 0, 1, 1,
0.8657938, 0.5943402, 1.340327, 0, 0, 0, 1, 1,
0.8692021, -0.9645697, 3.783607, 0, 0, 0, 1, 1,
0.869496, 1.225089, 1.395857, 0, 0, 0, 1, 1,
0.8696224, 1.082732, -0.5735138, 0, 0, 0, 1, 1,
0.8759544, -1.215161, 2.416216, 0, 0, 0, 1, 1,
0.8807892, 1.128923, 1.10032, 0, 0, 0, 1, 1,
0.8848357, -0.3870308, 1.560719, 1, 1, 1, 1, 1,
0.8874822, 0.3465983, 2.666889, 1, 1, 1, 1, 1,
0.8891823, 0.5373246, 1.281672, 1, 1, 1, 1, 1,
0.890418, -0.9970999, 3.184788, 1, 1, 1, 1, 1,
0.8944702, 0.110261, 1.930421, 1, 1, 1, 1, 1,
0.8947607, 0.5666128, 1.825657, 1, 1, 1, 1, 1,
0.8951972, 1.816013, -0.04669058, 1, 1, 1, 1, 1,
0.9058083, -0.367978, 1.885265, 1, 1, 1, 1, 1,
0.9066764, -1.111877, 1.89793, 1, 1, 1, 1, 1,
0.908995, 1.265242, 0.3157761, 1, 1, 1, 1, 1,
0.9092667, 0.8345945, 1.122794, 1, 1, 1, 1, 1,
0.9154848, 1.120744, 1.894028, 1, 1, 1, 1, 1,
0.9156852, 1.345683, -0.7966685, 1, 1, 1, 1, 1,
0.9182612, 0.8082699, 1.789781, 1, 1, 1, 1, 1,
0.9257101, -0.1618736, 3.956165, 1, 1, 1, 1, 1,
0.9307227, -0.9341449, 1.797645, 0, 0, 1, 1, 1,
0.9346648, -0.1030484, 0.8595916, 1, 0, 0, 1, 1,
0.9392569, -1.115696, 3.271869, 1, 0, 0, 1, 1,
0.9475242, 0.7093498, 1.938421, 1, 0, 0, 1, 1,
0.9503177, 1.117207, -0.7635618, 1, 0, 0, 1, 1,
0.950959, -2.127659, 3.104498, 1, 0, 0, 1, 1,
0.955645, 1.528819, 1.075572, 0, 0, 0, 1, 1,
0.9567311, -0.3917832, 1.096323, 0, 0, 0, 1, 1,
0.9623434, -0.09121218, 3.035008, 0, 0, 0, 1, 1,
0.9667358, -0.644385, 1.625147, 0, 0, 0, 1, 1,
0.9781415, 1.63454, -1.941472, 0, 0, 0, 1, 1,
0.9796813, -0.9283077, 2.206075, 0, 0, 0, 1, 1,
0.98162, -0.523729, 1.56731, 0, 0, 0, 1, 1,
0.986931, -0.7521653, 2.090003, 1, 1, 1, 1, 1,
0.9879163, 1.25053, 1.07402, 1, 1, 1, 1, 1,
0.9896856, 0.2448431, 2.529328, 1, 1, 1, 1, 1,
0.9950483, 1.031661, 0.9456478, 1, 1, 1, 1, 1,
0.9974487, 2.95242, 0.9334013, 1, 1, 1, 1, 1,
1.003201, 0.7856106, 0.9785931, 1, 1, 1, 1, 1,
1.006576, 0.6227187, 3.04109, 1, 1, 1, 1, 1,
1.006821, -0.7034373, 1.794268, 1, 1, 1, 1, 1,
1.015379, 0.7786723, 1.577689, 1, 1, 1, 1, 1,
1.016289, 0.85581, -0.09762896, 1, 1, 1, 1, 1,
1.017573, -1.297507, 2.177075, 1, 1, 1, 1, 1,
1.027322, -0.4299405, 1.854389, 1, 1, 1, 1, 1,
1.034167, -1.820278, 2.876456, 1, 1, 1, 1, 1,
1.04034, 0.8565661, -0.1090966, 1, 1, 1, 1, 1,
1.047767, 0.04106717, 2.095109, 1, 1, 1, 1, 1,
1.048115, 0.6075104, 2.922513, 0, 0, 1, 1, 1,
1.048515, 0.5299587, 0.8404133, 1, 0, 0, 1, 1,
1.053298, -0.209917, 0.8529356, 1, 0, 0, 1, 1,
1.054955, 0.3115426, 3.18524, 1, 0, 0, 1, 1,
1.060785, -0.4405463, 3.93328, 1, 0, 0, 1, 1,
1.061126, 0.9458573, 0.2483957, 1, 0, 0, 1, 1,
1.061892, -0.1633153, 2.267345, 0, 0, 0, 1, 1,
1.0619, 1.067675, 0.7849932, 0, 0, 0, 1, 1,
1.063387, -2.900129, 2.101969, 0, 0, 0, 1, 1,
1.070388, -0.6521646, 1.656048, 0, 0, 0, 1, 1,
1.078221, 1.38405, 0.7513228, 0, 0, 0, 1, 1,
1.080859, 1.156452, 1.571892, 0, 0, 0, 1, 1,
1.094278, -0.9985475, 2.15281, 0, 0, 0, 1, 1,
1.09927, 1.68933, 1.084792, 1, 1, 1, 1, 1,
1.101561, -0.154193, 2.262173, 1, 1, 1, 1, 1,
1.101625, 0.8576216, -0.1488668, 1, 1, 1, 1, 1,
1.107594, 0.3558143, 0.1321136, 1, 1, 1, 1, 1,
1.108786, 0.8438626, 1.468337, 1, 1, 1, 1, 1,
1.110916, 1.205292, -0.04535831, 1, 1, 1, 1, 1,
1.111632, -0.06197245, 2.775809, 1, 1, 1, 1, 1,
1.113814, -2.094593, 2.585331, 1, 1, 1, 1, 1,
1.119079, -1.366889, 2.308198, 1, 1, 1, 1, 1,
1.123118, 0.3888087, -0.2773098, 1, 1, 1, 1, 1,
1.126599, 1.020482, 1.100753, 1, 1, 1, 1, 1,
1.126633, 2.068037, 0.6854991, 1, 1, 1, 1, 1,
1.134814, 0.08283121, 1.142201, 1, 1, 1, 1, 1,
1.142587, -1.124261, 2.816615, 1, 1, 1, 1, 1,
1.143322, -0.2992666, 1.269933, 1, 1, 1, 1, 1,
1.151983, 0.2248772, -1.206402, 0, 0, 1, 1, 1,
1.158746, 0.2588046, 0.370921, 1, 0, 0, 1, 1,
1.160898, -0.05894873, 1.652662, 1, 0, 0, 1, 1,
1.161014, -0.7625445, 3.62815, 1, 0, 0, 1, 1,
1.186082, -0.7766545, 4.090499, 1, 0, 0, 1, 1,
1.187416, 0.5743621, 0.165029, 1, 0, 0, 1, 1,
1.189735, 2.281944, 1.12276, 0, 0, 0, 1, 1,
1.195926, 0.3201403, 1.856313, 0, 0, 0, 1, 1,
1.205382, -1.391384, 2.876447, 0, 0, 0, 1, 1,
1.20925, -1.490138, 2.198364, 0, 0, 0, 1, 1,
1.21601, -0.9680167, 3.581792, 0, 0, 0, 1, 1,
1.220527, -0.3363172, 1.632653, 0, 0, 0, 1, 1,
1.222223, -0.2760653, 2.202066, 0, 0, 0, 1, 1,
1.231243, -0.4499761, 2.315074, 1, 1, 1, 1, 1,
1.231278, 0.2767724, 1.752148, 1, 1, 1, 1, 1,
1.238907, -0.6853617, 2.641776, 1, 1, 1, 1, 1,
1.254199, 0.633692, 2.138906, 1, 1, 1, 1, 1,
1.254578, 1.012627, 0.7883364, 1, 1, 1, 1, 1,
1.256117, 0.1487179, 2.679535, 1, 1, 1, 1, 1,
1.272046, -0.2957228, 0.4761077, 1, 1, 1, 1, 1,
1.280398, 0.8606963, 0.252079, 1, 1, 1, 1, 1,
1.287263, -1.66757, 2.52497, 1, 1, 1, 1, 1,
1.296232, -0.7332404, 3.571183, 1, 1, 1, 1, 1,
1.307204, 0.1905885, 1.255297, 1, 1, 1, 1, 1,
1.309424, -0.01802634, 1.422127, 1, 1, 1, 1, 1,
1.316458, 0.3103634, 1.18413, 1, 1, 1, 1, 1,
1.322884, 0.5169703, 0.4461542, 1, 1, 1, 1, 1,
1.323167, 0.6195422, 1.914763, 1, 1, 1, 1, 1,
1.340832, 1.172963, 1.389858, 0, 0, 1, 1, 1,
1.346283, -1.087105, 4.277125, 1, 0, 0, 1, 1,
1.35584, 0.4402764, 0.3590759, 1, 0, 0, 1, 1,
1.359825, 1.517912, 0.0616118, 1, 0, 0, 1, 1,
1.365423, -0.4360848, 2.121156, 1, 0, 0, 1, 1,
1.366806, 0.3214002, 2.662894, 1, 0, 0, 1, 1,
1.378404, -1.088758, 1.85768, 0, 0, 0, 1, 1,
1.380182, -0.9197214, 1.694636, 0, 0, 0, 1, 1,
1.389632, 0.5188991, 1.595586, 0, 0, 0, 1, 1,
1.404871, 0.5145801, 0.9213059, 0, 0, 0, 1, 1,
1.40878, -1.932959, 2.254635, 0, 0, 0, 1, 1,
1.4306, -0.6127171, 2.049077, 0, 0, 0, 1, 1,
1.4531, -0.4937617, 3.094357, 0, 0, 0, 1, 1,
1.476033, 0.4084364, 1.085571, 1, 1, 1, 1, 1,
1.483711, 1.607418, 2.404455, 1, 1, 1, 1, 1,
1.484366, -0.6627108, 0.9586604, 1, 1, 1, 1, 1,
1.486334, -0.4597996, 2.289807, 1, 1, 1, 1, 1,
1.492775, 1.529298, 0.7867993, 1, 1, 1, 1, 1,
1.50086, 0.9209117, 1.086079, 1, 1, 1, 1, 1,
1.502037, -0.2069764, 2.503337, 1, 1, 1, 1, 1,
1.508554, -0.4782607, 2.190855, 1, 1, 1, 1, 1,
1.50871, 0.00790808, -0.4894084, 1, 1, 1, 1, 1,
1.526214, 0.5508472, 1.279267, 1, 1, 1, 1, 1,
1.528116, -0.5749503, 1.445478, 1, 1, 1, 1, 1,
1.555326, 1.112274, 0.7871941, 1, 1, 1, 1, 1,
1.567631, 0.2585899, 1.588942, 1, 1, 1, 1, 1,
1.568164, 0.9428769, 2.087364, 1, 1, 1, 1, 1,
1.569794, 1.085039, -1.600984, 1, 1, 1, 1, 1,
1.571226, 0.477279, 1.573484, 0, 0, 1, 1, 1,
1.579842, 0.1911366, 1.266115, 1, 0, 0, 1, 1,
1.601741, -0.2100741, 0.1317876, 1, 0, 0, 1, 1,
1.631501, 0.5978447, 2.733673, 1, 0, 0, 1, 1,
1.63944, 0.7622296, 1.0696, 1, 0, 0, 1, 1,
1.642887, -1.034404, 1.730556, 1, 0, 0, 1, 1,
1.66629, -0.6115528, 0.4369369, 0, 0, 0, 1, 1,
1.693179, -0.2780778, 4.128641, 0, 0, 0, 1, 1,
1.706409, 0.3794023, 1.118395, 0, 0, 0, 1, 1,
1.730498, -1.011185, 1.518348, 0, 0, 0, 1, 1,
1.730985, -1.632846, 2.346702, 0, 0, 0, 1, 1,
1.733341, -0.9992085, 1.858605, 0, 0, 0, 1, 1,
1.73335, -1.78269, 1.549448, 0, 0, 0, 1, 1,
1.744594, -0.05926016, 0.5395939, 1, 1, 1, 1, 1,
1.769486, 0.54524, -0.3044517, 1, 1, 1, 1, 1,
1.786757, -0.1620326, 0.8333692, 1, 1, 1, 1, 1,
1.805212, 0.1227777, 1.661714, 1, 1, 1, 1, 1,
1.810035, 1.145907, -0.03496749, 1, 1, 1, 1, 1,
1.824875, 0.3168135, -0.09676711, 1, 1, 1, 1, 1,
1.835834, -0.04338616, 1.87072, 1, 1, 1, 1, 1,
1.855647, -0.1309999, 0.5598168, 1, 1, 1, 1, 1,
1.863977, -0.08656988, 2.989522, 1, 1, 1, 1, 1,
1.86902, 0.7357815, 0.6008152, 1, 1, 1, 1, 1,
1.89546, -0.2429474, 1.511926, 1, 1, 1, 1, 1,
1.914141, -0.3748876, 2.164881, 1, 1, 1, 1, 1,
1.918519, 0.7446452, 1.580169, 1, 1, 1, 1, 1,
2.007865, -0.1911499, 0.2631632, 1, 1, 1, 1, 1,
2.035044, -0.06280421, 2.006429, 1, 1, 1, 1, 1,
2.044519, 1.241851, 0.02219884, 0, 0, 1, 1, 1,
2.07931, -1.828029, 2.287626, 1, 0, 0, 1, 1,
2.084219, -0.2047922, 1.295187, 1, 0, 0, 1, 1,
2.142788, -0.9085447, 3.409693, 1, 0, 0, 1, 1,
2.171265, 0.1165655, 2.602988, 1, 0, 0, 1, 1,
2.181021, 1.440565, 2.023493, 1, 0, 0, 1, 1,
2.205945, 0.2143822, 0.7893702, 0, 0, 0, 1, 1,
2.269926, -0.8796257, 2.525134, 0, 0, 0, 1, 1,
2.313297, 0.2032096, 1.253215, 0, 0, 0, 1, 1,
2.33023, -0.6994137, 0.8744689, 0, 0, 0, 1, 1,
2.371628, 1.571219, 1.369595, 0, 0, 0, 1, 1,
2.40224, -0.6420679, 2.383341, 0, 0, 0, 1, 1,
2.423335, -0.9175282, 1.506282, 0, 0, 0, 1, 1,
2.441629, -2.003106, 1.20712, 1, 1, 1, 1, 1,
2.512654, -1.470062, 1.905272, 1, 1, 1, 1, 1,
2.525788, 1.190891, 0.6128979, 1, 1, 1, 1, 1,
2.668533, -1.727806, 2.307721, 1, 1, 1, 1, 1,
2.858999, 0.1706392, 3.478057, 1, 1, 1, 1, 1,
2.870373, 0.001465594, 0.6126144, 1, 1, 1, 1, 1,
2.8997, 0.7892463, 2.922516, 1, 1, 1, 1, 1
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
var radius = 9.319111;
var distance = 32.73299;
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
mvMatrix.translate( 0.365611, 0.1186004, 0.18448 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.73299);
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
