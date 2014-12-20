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
-2.903854, 0.3785321, -0.01017802, 1, 0, 0, 1,
-2.842293, -0.1217944, 0.4401509, 1, 0.007843138, 0, 1,
-2.831236, -1.223864, -1.955611, 1, 0.01176471, 0, 1,
-2.723062, -0.6266385, -4.333624, 1, 0.01960784, 0, 1,
-2.702057, -0.9911571, -0.6423971, 1, 0.02352941, 0, 1,
-2.690967, 0.05276468, 0.5451314, 1, 0.03137255, 0, 1,
-2.687455, -0.9609187, -0.9291992, 1, 0.03529412, 0, 1,
-2.510469, -1.523847, -2.078717, 1, 0.04313726, 0, 1,
-2.472381, -0.2793556, 1.189159, 1, 0.04705882, 0, 1,
-2.451362, -0.2286614, -0.8787176, 1, 0.05490196, 0, 1,
-2.415507, -0.6692964, -2.995714, 1, 0.05882353, 0, 1,
-2.283059, 1.348469, 0.2488369, 1, 0.06666667, 0, 1,
-2.217262, 1.060581, -1.842544, 1, 0.07058824, 0, 1,
-2.212965, 0.05069145, -0.6242414, 1, 0.07843138, 0, 1,
-2.133334, -0.3175882, -1.155534, 1, 0.08235294, 0, 1,
-2.08308, 0.4079675, -0.0920032, 1, 0.09019608, 0, 1,
-2.065159, -0.4463223, -0.9194905, 1, 0.09411765, 0, 1,
-2.05266, 0.976385, -0.2115948, 1, 0.1019608, 0, 1,
-2.031635, -0.08390389, -3.024282, 1, 0.1098039, 0, 1,
-2.009076, -0.03971269, -2.067703, 1, 0.1137255, 0, 1,
-1.989319, -0.7509909, -0.4582489, 1, 0.1215686, 0, 1,
-1.986341, -0.3269974, -2.437898, 1, 0.1254902, 0, 1,
-1.97969, -0.6702901, -2.756256, 1, 0.1333333, 0, 1,
-1.978514, -1.216173, -2.26974, 1, 0.1372549, 0, 1,
-1.959186, -0.8748007, -2.223376, 1, 0.145098, 0, 1,
-1.950236, -0.7372357, -2.33378, 1, 0.1490196, 0, 1,
-1.926495, -0.6839306, -0.5472636, 1, 0.1568628, 0, 1,
-1.921096, -0.6366744, -1.017333, 1, 0.1607843, 0, 1,
-1.916415, 0.6585689, -0.8490189, 1, 0.1686275, 0, 1,
-1.897831, 0.9815048, -1.886833, 1, 0.172549, 0, 1,
-1.843419, -0.3568839, -1.63749, 1, 0.1803922, 0, 1,
-1.840949, -1.068363, -0.876692, 1, 0.1843137, 0, 1,
-1.826056, 0.4447256, -0.7308423, 1, 0.1921569, 0, 1,
-1.812126, 0.6062695, -4.130248, 1, 0.1960784, 0, 1,
-1.804143, -1.202119, -1.972865, 1, 0.2039216, 0, 1,
-1.791337, 0.05533849, -0.651388, 1, 0.2117647, 0, 1,
-1.76174, 0.5226407, -1.342446, 1, 0.2156863, 0, 1,
-1.735242, -2.013959, -2.493082, 1, 0.2235294, 0, 1,
-1.725553, 1.474317, -2.013171, 1, 0.227451, 0, 1,
-1.717224, 1.218251, -1.751047, 1, 0.2352941, 0, 1,
-1.712487, 2.039482, -1.934661, 1, 0.2392157, 0, 1,
-1.705354, 1.188821, -1.309275, 1, 0.2470588, 0, 1,
-1.677393, 0.2559826, 0.495974, 1, 0.2509804, 0, 1,
-1.670355, 1.469963, 0.1890853, 1, 0.2588235, 0, 1,
-1.652821, -0.4241101, -2.76721, 1, 0.2627451, 0, 1,
-1.589036, 0.01497758, 0.2057771, 1, 0.2705882, 0, 1,
-1.562728, 0.4527504, -1.417312, 1, 0.2745098, 0, 1,
-1.558697, 0.01182699, -2.505642, 1, 0.282353, 0, 1,
-1.555457, 0.8764129, 0.5674032, 1, 0.2862745, 0, 1,
-1.55267, -0.1108187, -0.7059715, 1, 0.2941177, 0, 1,
-1.52691, -1.131879, -2.424899, 1, 0.3019608, 0, 1,
-1.520067, 0.1934868, -1.971453, 1, 0.3058824, 0, 1,
-1.514468, -0.04913763, -0.4745967, 1, 0.3137255, 0, 1,
-1.512724, -0.7450925, -1.743295, 1, 0.3176471, 0, 1,
-1.511894, -0.6356442, -1.934863, 1, 0.3254902, 0, 1,
-1.50464, -0.2349633, -1.474295, 1, 0.3294118, 0, 1,
-1.502679, 1.374401, -0.3405673, 1, 0.3372549, 0, 1,
-1.491498, 1.437875, 0.8922095, 1, 0.3411765, 0, 1,
-1.479661, 0.9545242, -1.069638, 1, 0.3490196, 0, 1,
-1.46609, -1.32975, -2.606523, 1, 0.3529412, 0, 1,
-1.450731, -1.348298, -2.762855, 1, 0.3607843, 0, 1,
-1.447813, -1.890707, -0.9440418, 1, 0.3647059, 0, 1,
-1.435637, -2.333163, -1.807505, 1, 0.372549, 0, 1,
-1.435209, -2.478755, -0.7458744, 1, 0.3764706, 0, 1,
-1.431879, -0.1517459, -2.103458, 1, 0.3843137, 0, 1,
-1.419316, -0.8570116, -3.541186, 1, 0.3882353, 0, 1,
-1.417938, 1.622018, 0.8485095, 1, 0.3960784, 0, 1,
-1.413466, 0.7446588, -1.262249, 1, 0.4039216, 0, 1,
-1.402183, -1.688321, -1.877579, 1, 0.4078431, 0, 1,
-1.392648, -1.913515, -2.130382, 1, 0.4156863, 0, 1,
-1.389609, -0.4834931, -1.61242, 1, 0.4196078, 0, 1,
-1.359931, 0.2106645, 0.7667894, 1, 0.427451, 0, 1,
-1.357414, 0.3495009, -1.558836, 1, 0.4313726, 0, 1,
-1.352249, 0.5922598, -0.203299, 1, 0.4392157, 0, 1,
-1.351455, -0.5768323, -2.167084, 1, 0.4431373, 0, 1,
-1.34011, 1.491464, 2.048824, 1, 0.4509804, 0, 1,
-1.324132, -0.9744004, -1.774797, 1, 0.454902, 0, 1,
-1.31653, -0.8080406, -0.670657, 1, 0.4627451, 0, 1,
-1.310304, 0.7026067, -0.4692174, 1, 0.4666667, 0, 1,
-1.304677, 0.9189991, -2.433621, 1, 0.4745098, 0, 1,
-1.301882, 0.9183189, -1.07633, 1, 0.4784314, 0, 1,
-1.291195, -2.003547, -2.020322, 1, 0.4862745, 0, 1,
-1.286193, -0.8767125, -2.018691, 1, 0.4901961, 0, 1,
-1.282042, -0.7603445, -2.365956, 1, 0.4980392, 0, 1,
-1.273952, -0.8012034, -2.718864, 1, 0.5058824, 0, 1,
-1.260104, -0.5505256, -3.825604, 1, 0.509804, 0, 1,
-1.260011, -2.139323, -2.42213, 1, 0.5176471, 0, 1,
-1.253292, -0.4636204, -1.68128, 1, 0.5215687, 0, 1,
-1.248718, -0.01268288, 0.9792033, 1, 0.5294118, 0, 1,
-1.247836, -0.6691799, -1.606563, 1, 0.5333334, 0, 1,
-1.233723, 0.6726019, -1.354548, 1, 0.5411765, 0, 1,
-1.233463, -0.1154014, 0.04229545, 1, 0.5450981, 0, 1,
-1.223372, 0.06302191, -1.10681, 1, 0.5529412, 0, 1,
-1.216449, -1.632362, -2.897281, 1, 0.5568628, 0, 1,
-1.210618, -0.5348979, -1.225206, 1, 0.5647059, 0, 1,
-1.207105, -1.274897, -2.029887, 1, 0.5686275, 0, 1,
-1.20503, -0.6817729, -1.484659, 1, 0.5764706, 0, 1,
-1.197667, 0.6830781, -1.536607, 1, 0.5803922, 0, 1,
-1.190913, 0.6463446, -0.5068384, 1, 0.5882353, 0, 1,
-1.182216, -0.4461105, -2.052519, 1, 0.5921569, 0, 1,
-1.176023, 1.544682, -1.279314, 1, 0.6, 0, 1,
-1.173119, -0.3107656, -3.343175, 1, 0.6078432, 0, 1,
-1.170236, 1.61608, -1.47694, 1, 0.6117647, 0, 1,
-1.167546, -2.030386, -2.833495, 1, 0.6196079, 0, 1,
-1.166278, 1.173789, -0.1086315, 1, 0.6235294, 0, 1,
-1.157333, -0.7465762, -2.785377, 1, 0.6313726, 0, 1,
-1.154394, 1.401501, -0.7621351, 1, 0.6352941, 0, 1,
-1.147799, -0.5107469, -1.859978, 1, 0.6431373, 0, 1,
-1.142774, 0.125942, 0.09900188, 1, 0.6470588, 0, 1,
-1.140653, 0.06750285, -1.329379, 1, 0.654902, 0, 1,
-1.139006, 0.5865164, -2.224906, 1, 0.6588235, 0, 1,
-1.13892, -0.4532317, -2.584017, 1, 0.6666667, 0, 1,
-1.135805, -0.4172434, -1.465911, 1, 0.6705883, 0, 1,
-1.134877, 0.9746299, 0.2728377, 1, 0.6784314, 0, 1,
-1.132777, -0.7012066, -2.000362, 1, 0.682353, 0, 1,
-1.130493, 0.1517193, -2.185346, 1, 0.6901961, 0, 1,
-1.1237, 0.6661527, -1.070572, 1, 0.6941177, 0, 1,
-1.120441, 0.6387947, -0.8608108, 1, 0.7019608, 0, 1,
-1.104914, 0.2743119, -1.676932, 1, 0.7098039, 0, 1,
-1.102877, 0.8676257, -1.496615, 1, 0.7137255, 0, 1,
-1.0994, 0.8766078, 1.924797, 1, 0.7215686, 0, 1,
-1.097757, -0.07753798, -2.142476, 1, 0.7254902, 0, 1,
-1.09168, 0.1120499, -2.728077, 1, 0.7333333, 0, 1,
-1.084252, -0.68702, -2.031617, 1, 0.7372549, 0, 1,
-1.082412, -0.3582767, -1.754874, 1, 0.7450981, 0, 1,
-1.066769, 0.5397784, -0.4718982, 1, 0.7490196, 0, 1,
-1.0656, -0.1585541, -1.386529, 1, 0.7568628, 0, 1,
-1.06233, -0.8792824, -3.241826, 1, 0.7607843, 0, 1,
-1.058502, -1.908239, -3.590991, 1, 0.7686275, 0, 1,
-1.057617, 0.594579, -2.045845, 1, 0.772549, 0, 1,
-1.046654, 1.271898, 0.6376086, 1, 0.7803922, 0, 1,
-1.035886, 0.6152334, -3.284181, 1, 0.7843137, 0, 1,
-1.035555, -0.3599895, -3.564202, 1, 0.7921569, 0, 1,
-1.034234, -0.5938159, -2.565149, 1, 0.7960784, 0, 1,
-1.030201, -0.1708908, -2.127972, 1, 0.8039216, 0, 1,
-1.022871, 1.158453, -0.8250439, 1, 0.8117647, 0, 1,
-1.021584, 0.5849477, -0.3006271, 1, 0.8156863, 0, 1,
-1.012558, -1.462619, -3.033781, 1, 0.8235294, 0, 1,
-1.001877, -0.9557756, -2.727607, 1, 0.827451, 0, 1,
-0.9998959, 1.017092, -0.1174097, 1, 0.8352941, 0, 1,
-0.9998185, -1.058248, -4.264376, 1, 0.8392157, 0, 1,
-0.9973409, -0.7990658, -4.257987, 1, 0.8470588, 0, 1,
-0.9898528, 0.007983135, 1.101018, 1, 0.8509804, 0, 1,
-0.9886748, 0.2021259, -0.8897626, 1, 0.8588235, 0, 1,
-0.988535, 0.3979684, -0.2460137, 1, 0.8627451, 0, 1,
-0.9871895, 0.6791778, -1.665905, 1, 0.8705882, 0, 1,
-0.9871712, 1.448198, -0.242401, 1, 0.8745098, 0, 1,
-0.9863176, -1.783145, -2.649906, 1, 0.8823529, 0, 1,
-0.9665893, -0.1546603, -0.5781071, 1, 0.8862745, 0, 1,
-0.9554005, -0.8265297, 0.3069479, 1, 0.8941177, 0, 1,
-0.9507371, 0.7370892, -1.083658, 1, 0.8980392, 0, 1,
-0.9490306, 0.1143629, -0.5860191, 1, 0.9058824, 0, 1,
-0.9395966, 1.098188, -1.510269, 1, 0.9137255, 0, 1,
-0.9389602, -0.7550406, -2.85165, 1, 0.9176471, 0, 1,
-0.9359443, 0.6721991, -0.34455, 1, 0.9254902, 0, 1,
-0.9341686, -1.661905, -1.759607, 1, 0.9294118, 0, 1,
-0.9338202, 1.391194, -0.4820324, 1, 0.9372549, 0, 1,
-0.9321194, -1.680978, -3.880782, 1, 0.9411765, 0, 1,
-0.9193379, -0.381413, -1.372459, 1, 0.9490196, 0, 1,
-0.9186806, 1.147797, -2.558503, 1, 0.9529412, 0, 1,
-0.9138347, -0.4204008, -1.406898, 1, 0.9607843, 0, 1,
-0.9112861, -0.1352665, 1.002901, 1, 0.9647059, 0, 1,
-0.9103711, 0.4996414, -1.289955, 1, 0.972549, 0, 1,
-0.9100183, -1.654494, -1.983231, 1, 0.9764706, 0, 1,
-0.9043658, -0.5870122, -2.085634, 1, 0.9843137, 0, 1,
-0.8901373, 0.6622015, -0.8232576, 1, 0.9882353, 0, 1,
-0.8893498, 0.01193143, -2.197342, 1, 0.9960784, 0, 1,
-0.8845342, -0.2333935, -2.763885, 0.9960784, 1, 0, 1,
-0.8838779, -0.1169829, -1.224863, 0.9921569, 1, 0, 1,
-0.8780393, 0.779014, 0.07478967, 0.9843137, 1, 0, 1,
-0.8701825, -1.232725, -0.5824394, 0.9803922, 1, 0, 1,
-0.8663591, -0.6225095, -1.54435, 0.972549, 1, 0, 1,
-0.8568314, -0.02479482, -2.227016, 0.9686275, 1, 0, 1,
-0.8563256, -0.9830195, -0.6089844, 0.9607843, 1, 0, 1,
-0.8557293, -0.04341588, -2.430546, 0.9568627, 1, 0, 1,
-0.8552828, 0.1942028, -2.013552, 0.9490196, 1, 0, 1,
-0.8551177, 0.4336263, -0.3599915, 0.945098, 1, 0, 1,
-0.8536666, 2.464814, -1.185257, 0.9372549, 1, 0, 1,
-0.8503851, 0.5329733, -0.09212872, 0.9333333, 1, 0, 1,
-0.8489636, -0.3444463, -2.374908, 0.9254902, 1, 0, 1,
-0.8337181, -0.2410187, -1.551383, 0.9215686, 1, 0, 1,
-0.833541, -1.128202, -2.61936, 0.9137255, 1, 0, 1,
-0.8268347, -0.1230605, -1.054036, 0.9098039, 1, 0, 1,
-0.8268192, -1.034779, -4.032074, 0.9019608, 1, 0, 1,
-0.8245338, 0.08291408, -1.944183, 0.8941177, 1, 0, 1,
-0.8187594, -1.085003, -2.568372, 0.8901961, 1, 0, 1,
-0.8183147, 0.3741123, 0.2641216, 0.8823529, 1, 0, 1,
-0.8181211, 1.435541, 0.8217998, 0.8784314, 1, 0, 1,
-0.8123642, 0.4632162, -0.5119744, 0.8705882, 1, 0, 1,
-0.8103008, 0.8762638, -1.923424, 0.8666667, 1, 0, 1,
-0.8092561, -0.01987206, -2.668143, 0.8588235, 1, 0, 1,
-0.804942, -0.5197918, -1.906326, 0.854902, 1, 0, 1,
-0.7964774, 0.1570444, -1.882433, 0.8470588, 1, 0, 1,
-0.7959323, 0.427503, -1.971415, 0.8431373, 1, 0, 1,
-0.7895709, 0.3266107, -1.573488, 0.8352941, 1, 0, 1,
-0.7869037, -2.04837, -3.591952, 0.8313726, 1, 0, 1,
-0.7840365, -1.163789, -1.821962, 0.8235294, 1, 0, 1,
-0.7829372, -0.5895673, -2.93629, 0.8196079, 1, 0, 1,
-0.7817457, 0.9729873, -1.511684, 0.8117647, 1, 0, 1,
-0.7808552, 0.9576912, 0.4938257, 0.8078431, 1, 0, 1,
-0.7725747, -0.5089931, -2.372883, 0.8, 1, 0, 1,
-0.7719934, -0.5378973, -3.272707, 0.7921569, 1, 0, 1,
-0.7689647, 1.030599, 0.4591081, 0.7882353, 1, 0, 1,
-0.7650898, -0.811635, -3.215629, 0.7803922, 1, 0, 1,
-0.7609049, 0.3444072, -1.05227, 0.7764706, 1, 0, 1,
-0.7604324, -0.2764665, -1.699808, 0.7686275, 1, 0, 1,
-0.7595353, -0.09182908, -2.288479, 0.7647059, 1, 0, 1,
-0.7516678, -0.7337183, -0.8682792, 0.7568628, 1, 0, 1,
-0.7472246, 0.166852, -0.5915461, 0.7529412, 1, 0, 1,
-0.7464337, -0.7641047, -2.325082, 0.7450981, 1, 0, 1,
-0.7442923, 0.4904254, -1.951489, 0.7411765, 1, 0, 1,
-0.7431232, 1.804075, 0.4930345, 0.7333333, 1, 0, 1,
-0.742959, 2.249689, -1.288115, 0.7294118, 1, 0, 1,
-0.7424374, -0.01717131, -1.389572, 0.7215686, 1, 0, 1,
-0.7387447, -1.059304, -3.610585, 0.7176471, 1, 0, 1,
-0.7349813, -0.5906919, -1.626761, 0.7098039, 1, 0, 1,
-0.7198304, 2.003137, -2.603903, 0.7058824, 1, 0, 1,
-0.715529, -0.2121845, -1.173053, 0.6980392, 1, 0, 1,
-0.7122084, 1.486854, 0.6289988, 0.6901961, 1, 0, 1,
-0.7121987, -1.712337, -1.954054, 0.6862745, 1, 0, 1,
-0.7104898, -2.202644, -1.979275, 0.6784314, 1, 0, 1,
-0.7073265, -0.3183779, -3.017547, 0.6745098, 1, 0, 1,
-0.7071517, 1.72727, -0.3022722, 0.6666667, 1, 0, 1,
-0.7064256, 0.5957514, -2.252439, 0.6627451, 1, 0, 1,
-0.7063419, -0.9263349, -1.089723, 0.654902, 1, 0, 1,
-0.7063207, 1.047912, -1.472692, 0.6509804, 1, 0, 1,
-0.7062994, -0.364899, -2.307777, 0.6431373, 1, 0, 1,
-0.6974682, -0.6820853, -1.90412, 0.6392157, 1, 0, 1,
-0.6974149, 0.9351923, -0.7191844, 0.6313726, 1, 0, 1,
-0.6940246, 0.02229097, -2.830001, 0.627451, 1, 0, 1,
-0.6851329, -0.4848038, -1.049968, 0.6196079, 1, 0, 1,
-0.6835142, -0.3474772, -1.908151, 0.6156863, 1, 0, 1,
-0.6744831, -0.1256189, -2.834371, 0.6078432, 1, 0, 1,
-0.6727458, -0.8129989, -3.207751, 0.6039216, 1, 0, 1,
-0.6700962, -0.4518274, -3.157151, 0.5960785, 1, 0, 1,
-0.6686864, 0.8061222, -1.376004, 0.5882353, 1, 0, 1,
-0.6631326, -0.7694628, -3.082187, 0.5843138, 1, 0, 1,
-0.6624462, -1.868098, -4.478595, 0.5764706, 1, 0, 1,
-0.6612653, 0.09616095, -0.880383, 0.572549, 1, 0, 1,
-0.6567445, 1.276669, 0.9169984, 0.5647059, 1, 0, 1,
-0.652692, 1.410908, -1.3492, 0.5607843, 1, 0, 1,
-0.6522729, -1.47282, -1.209698, 0.5529412, 1, 0, 1,
-0.6510193, -0.04599959, -4.603921, 0.5490196, 1, 0, 1,
-0.6501586, 0.1198608, -2.266348, 0.5411765, 1, 0, 1,
-0.650045, 1.559871, -1.379317, 0.5372549, 1, 0, 1,
-0.6451194, 0.3626603, -1.828538, 0.5294118, 1, 0, 1,
-0.6367707, -2.787438, -2.960119, 0.5254902, 1, 0, 1,
-0.63094, -0.6484827, -3.271757, 0.5176471, 1, 0, 1,
-0.6298971, 0.03013256, -2.87503, 0.5137255, 1, 0, 1,
-0.6290286, 1.427874, -1.126675, 0.5058824, 1, 0, 1,
-0.6287606, -0.2009243, -1.602473, 0.5019608, 1, 0, 1,
-0.6287206, 1.037642, -0.1393453, 0.4941176, 1, 0, 1,
-0.6278851, -1.438801, -3.442265, 0.4862745, 1, 0, 1,
-0.6271137, -0.3459229, -2.243869, 0.4823529, 1, 0, 1,
-0.6268105, 0.5336927, -0.2557835, 0.4745098, 1, 0, 1,
-0.6267698, 1.239104, 0.5518631, 0.4705882, 1, 0, 1,
-0.6265802, -0.1365107, -0.9984685, 0.4627451, 1, 0, 1,
-0.6260384, 0.5393165, -0.5731722, 0.4588235, 1, 0, 1,
-0.622089, -0.6950108, -1.683463, 0.4509804, 1, 0, 1,
-0.6189582, -0.1144462, 0.115786, 0.4470588, 1, 0, 1,
-0.6125259, 0.5021244, -0.3927975, 0.4392157, 1, 0, 1,
-0.6123543, -0.4456959, -0.4683405, 0.4352941, 1, 0, 1,
-0.6099243, -0.1198635, -2.44225, 0.427451, 1, 0, 1,
-0.609763, -0.84356, -2.255482, 0.4235294, 1, 0, 1,
-0.6068809, 1.34743, -0.1013466, 0.4156863, 1, 0, 1,
-0.6067328, 1.489948, 0.4915982, 0.4117647, 1, 0, 1,
-0.6037101, 0.219567, -2.478336, 0.4039216, 1, 0, 1,
-0.5988705, -1.460248, -3.65106, 0.3960784, 1, 0, 1,
-0.5943325, 0.378257, -1.308124, 0.3921569, 1, 0, 1,
-0.5929242, -0.8986944, -3.670943, 0.3843137, 1, 0, 1,
-0.5842822, 0.6294319, -2.28554, 0.3803922, 1, 0, 1,
-0.5746742, -1.658796, -3.377516, 0.372549, 1, 0, 1,
-0.5742596, -1.801211, -4.892032, 0.3686275, 1, 0, 1,
-0.5712669, 0.6497509, 0.2226494, 0.3607843, 1, 0, 1,
-0.5704286, -1.17198, -1.704365, 0.3568628, 1, 0, 1,
-0.5699167, 1.337918, -0.1997515, 0.3490196, 1, 0, 1,
-0.5605189, -0.01878752, -0.1925688, 0.345098, 1, 0, 1,
-0.5504295, 1.798851, 1.008885, 0.3372549, 1, 0, 1,
-0.5492325, 1.387926, -0.7807096, 0.3333333, 1, 0, 1,
-0.5460545, -0.0153757, -1.420798, 0.3254902, 1, 0, 1,
-0.5436357, -1.235628, -2.997828, 0.3215686, 1, 0, 1,
-0.5430823, -0.8209217, -2.851741, 0.3137255, 1, 0, 1,
-0.540438, -0.1193403, -1.272348, 0.3098039, 1, 0, 1,
-0.5332842, 0.1821726, -0.1037657, 0.3019608, 1, 0, 1,
-0.5282319, -1.387339, -3.01277, 0.2941177, 1, 0, 1,
-0.518434, 0.1543572, -2.514215, 0.2901961, 1, 0, 1,
-0.5181584, -0.1952804, -2.001643, 0.282353, 1, 0, 1,
-0.5167637, -0.1012894, -0.8921283, 0.2784314, 1, 0, 1,
-0.5154819, 1.489373, -0.9195074, 0.2705882, 1, 0, 1,
-0.5122359, 0.0800773, -2.328271, 0.2666667, 1, 0, 1,
-0.5083584, -0.9035137, -1.457197, 0.2588235, 1, 0, 1,
-0.5078616, 0.1516353, 0.07190404, 0.254902, 1, 0, 1,
-0.5075154, 0.7763417, -2.607048, 0.2470588, 1, 0, 1,
-0.4963824, -0.9676176, -2.4847, 0.2431373, 1, 0, 1,
-0.4945835, -0.08303917, -1.250977, 0.2352941, 1, 0, 1,
-0.4907115, 0.2359565, -1.058179, 0.2313726, 1, 0, 1,
-0.4889499, 1.046828, -1.284204, 0.2235294, 1, 0, 1,
-0.4863239, 1.62653, 0.1898732, 0.2196078, 1, 0, 1,
-0.4829663, -0.1185412, -2.155926, 0.2117647, 1, 0, 1,
-0.4766048, -0.5045593, -3.119189, 0.2078431, 1, 0, 1,
-0.4745988, -0.8645778, -3.122544, 0.2, 1, 0, 1,
-0.4733948, -1.0495, -0.3976199, 0.1921569, 1, 0, 1,
-0.4728831, -1.515471, -2.461269, 0.1882353, 1, 0, 1,
-0.4700277, -1.021886, -1.440112, 0.1803922, 1, 0, 1,
-0.4657642, 0.2188497, -0.04628669, 0.1764706, 1, 0, 1,
-0.46367, -0.2697484, -1.63086, 0.1686275, 1, 0, 1,
-0.4629432, 0.4834746, -2.213089, 0.1647059, 1, 0, 1,
-0.4557003, 0.3708259, -1.13656, 0.1568628, 1, 0, 1,
-0.4551437, 1.149369, -0.2811092, 0.1529412, 1, 0, 1,
-0.4498245, 0.1912458, -0.1205909, 0.145098, 1, 0, 1,
-0.4486387, 0.7243445, -1.787297, 0.1411765, 1, 0, 1,
-0.4415413, -1.69711, -2.818827, 0.1333333, 1, 0, 1,
-0.4407772, 0.4819785, -1.393906, 0.1294118, 1, 0, 1,
-0.4368631, -0.5107428, -0.1887948, 0.1215686, 1, 0, 1,
-0.435565, -0.9186437, -1.769505, 0.1176471, 1, 0, 1,
-0.4342007, -0.7286756, -2.615656, 0.1098039, 1, 0, 1,
-0.430226, 0.7599455, -0.09270674, 0.1058824, 1, 0, 1,
-0.4248912, 0.1611381, -0.451739, 0.09803922, 1, 0, 1,
-0.4247797, 2.601017, -0.5977921, 0.09019608, 1, 0, 1,
-0.4243488, 1.54161, -0.6477687, 0.08627451, 1, 0, 1,
-0.421137, 0.5430066, -1.856686, 0.07843138, 1, 0, 1,
-0.4191717, 0.4143225, -0.4537445, 0.07450981, 1, 0, 1,
-0.4184185, 0.230364, -1.481624, 0.06666667, 1, 0, 1,
-0.4137035, -1.268524, -3.274405, 0.0627451, 1, 0, 1,
-0.4127768, -1.389797, -2.733829, 0.05490196, 1, 0, 1,
-0.4084635, -1.865202, -3.568108, 0.05098039, 1, 0, 1,
-0.4042834, 0.6617358, -1.23549, 0.04313726, 1, 0, 1,
-0.4040073, 0.6971062, 0.904053, 0.03921569, 1, 0, 1,
-0.4030815, -2.469158, -2.280669, 0.03137255, 1, 0, 1,
-0.3943297, 1.137231, 0.4803302, 0.02745098, 1, 0, 1,
-0.3942052, -0.2034015, -1.841202, 0.01960784, 1, 0, 1,
-0.3935561, 0.4590277, 0.5752019, 0.01568628, 1, 0, 1,
-0.3900206, -0.3355119, -2.708583, 0.007843138, 1, 0, 1,
-0.3883794, -0.06881163, -3.235571, 0.003921569, 1, 0, 1,
-0.3883349, 0.005628548, -2.061103, 0, 1, 0.003921569, 1,
-0.3877239, -1.207681, -1.358387, 0, 1, 0.01176471, 1,
-0.3855751, -1.128388, -5.533432, 0, 1, 0.01568628, 1,
-0.3852781, 0.3459097, -1.674343, 0, 1, 0.02352941, 1,
-0.3819735, 0.9198002, -0.5268085, 0, 1, 0.02745098, 1,
-0.3802908, 0.7554423, -0.3720315, 0, 1, 0.03529412, 1,
-0.3794742, -1.425757, -3.885235, 0, 1, 0.03921569, 1,
-0.3724982, -0.3198425, -0.5549864, 0, 1, 0.04705882, 1,
-0.368067, 0.6588419, -1.173232, 0, 1, 0.05098039, 1,
-0.3668723, 0.1844173, -1.491141, 0, 1, 0.05882353, 1,
-0.3633943, 0.5577173, -1.585352, 0, 1, 0.0627451, 1,
-0.3560264, -1.002212, -3.147644, 0, 1, 0.07058824, 1,
-0.3554713, 0.3426503, -2.948025, 0, 1, 0.07450981, 1,
-0.3545664, -0.1186982, -1.247155, 0, 1, 0.08235294, 1,
-0.3545502, 0.778678, 1.068585, 0, 1, 0.08627451, 1,
-0.3511342, 2.604432, 0.653492, 0, 1, 0.09411765, 1,
-0.3485036, 1.538208, 0.281396, 0, 1, 0.1019608, 1,
-0.3482045, -0.2910825, -4.510756, 0, 1, 0.1058824, 1,
-0.3468224, -0.1247611, -1.174902, 0, 1, 0.1137255, 1,
-0.3450559, 0.6709229, -1.378344, 0, 1, 0.1176471, 1,
-0.3443055, -0.3980075, -2.505231, 0, 1, 0.1254902, 1,
-0.3400964, -0.9354464, -2.785539, 0, 1, 0.1294118, 1,
-0.3363703, -0.8626215, -2.857177, 0, 1, 0.1372549, 1,
-0.3328425, -0.02014285, -0.3289883, 0, 1, 0.1411765, 1,
-0.331317, 0.3290181, -3.044785, 0, 1, 0.1490196, 1,
-0.3289431, 0.9220474, 1.689367, 0, 1, 0.1529412, 1,
-0.3287325, -0.4971502, -4.656728, 0, 1, 0.1607843, 1,
-0.3282098, 0.5177398, 2.020454, 0, 1, 0.1647059, 1,
-0.3235515, -0.4266772, -1.531193, 0, 1, 0.172549, 1,
-0.3181222, -0.4301957, -3.069552, 0, 1, 0.1764706, 1,
-0.3178159, -0.7334008, -2.177083, 0, 1, 0.1843137, 1,
-0.3145122, 0.126766, 0.9061252, 0, 1, 0.1882353, 1,
-0.3080084, -0.4488266, -2.810625, 0, 1, 0.1960784, 1,
-0.3073443, 1.244302, -0.3726943, 0, 1, 0.2039216, 1,
-0.306231, 0.07559986, -0.5647278, 0, 1, 0.2078431, 1,
-0.3060231, 0.2860207, 0.1335437, 0, 1, 0.2156863, 1,
-0.3054789, -0.3804644, -0.978283, 0, 1, 0.2196078, 1,
-0.3049212, -1.186882, -2.797113, 0, 1, 0.227451, 1,
-0.3048613, -0.04185393, -2.645532, 0, 1, 0.2313726, 1,
-0.3035544, -0.005703249, -2.989246, 0, 1, 0.2392157, 1,
-0.3034975, 0.2850765, -2.759363, 0, 1, 0.2431373, 1,
-0.3017626, -0.1828056, -4.027558, 0, 1, 0.2509804, 1,
-0.2970542, 0.6320719, 0.4827786, 0, 1, 0.254902, 1,
-0.296592, 0.1568408, -1.97797, 0, 1, 0.2627451, 1,
-0.2943682, 0.7749051, 0.4090672, 0, 1, 0.2666667, 1,
-0.292959, -0.04637938, -1.954971, 0, 1, 0.2745098, 1,
-0.2921323, -0.7138074, -2.269591, 0, 1, 0.2784314, 1,
-0.2875447, 0.458368, -1.799834, 0, 1, 0.2862745, 1,
-0.2860923, 0.1994036, -0.7647178, 0, 1, 0.2901961, 1,
-0.2855847, 0.1120888, -0.9820687, 0, 1, 0.2980392, 1,
-0.2828898, -0.5830883, -4.645382, 0, 1, 0.3058824, 1,
-0.2812788, 0.1400425, -2.096886, 0, 1, 0.3098039, 1,
-0.278125, 0.3772025, -1.557184, 0, 1, 0.3176471, 1,
-0.2742194, -0.6021124, -3.15631, 0, 1, 0.3215686, 1,
-0.2720804, -0.3371539, -2.394506, 0, 1, 0.3294118, 1,
-0.2654412, -0.5131303, -3.306904, 0, 1, 0.3333333, 1,
-0.262889, -0.7063522, -1.379161, 0, 1, 0.3411765, 1,
-0.2622884, -0.03856152, -0.644356, 0, 1, 0.345098, 1,
-0.2568606, 0.09018123, -2.362595, 0, 1, 0.3529412, 1,
-0.2539185, 1.987184, -1.682474, 0, 1, 0.3568628, 1,
-0.2510084, -1.300374, -2.240734, 0, 1, 0.3647059, 1,
-0.2493167, -1.041752, -1.488622, 0, 1, 0.3686275, 1,
-0.2464514, -0.878378, -3.882617, 0, 1, 0.3764706, 1,
-0.2453919, 0.2879303, -0.1329755, 0, 1, 0.3803922, 1,
-0.2425262, 2.667302, 2.263528, 0, 1, 0.3882353, 1,
-0.2414573, -1.964654, -3.169527, 0, 1, 0.3921569, 1,
-0.2408229, 1.227447, -1.226157, 0, 1, 0.4, 1,
-0.2360139, 0.795505, -0.8644498, 0, 1, 0.4078431, 1,
-0.2357686, 0.3805986, 1.775468, 0, 1, 0.4117647, 1,
-0.2318002, 0.9878616, 1.114371, 0, 1, 0.4196078, 1,
-0.2312193, 1.232082, 0.4319674, 0, 1, 0.4235294, 1,
-0.22222, -1.088781, -2.518161, 0, 1, 0.4313726, 1,
-0.2201069, 1.853972, -1.060398, 0, 1, 0.4352941, 1,
-0.2172513, 0.0966012, 0.03123932, 0, 1, 0.4431373, 1,
-0.216149, 0.1757002, -2.307416, 0, 1, 0.4470588, 1,
-0.213018, -2.002801, -4.803518, 0, 1, 0.454902, 1,
-0.2119504, 0.4639744, -0.5910353, 0, 1, 0.4588235, 1,
-0.2071958, 0.1108375, 0.4586267, 0, 1, 0.4666667, 1,
-0.2019481, -1.064451, -2.615499, 0, 1, 0.4705882, 1,
-0.2010854, -1.779614, -0.5857543, 0, 1, 0.4784314, 1,
-0.2005397, 0.5625293, 1.557051, 0, 1, 0.4823529, 1,
-0.1979559, -1.706859, -2.634169, 0, 1, 0.4901961, 1,
-0.1951097, -0.1264496, -3.013982, 0, 1, 0.4941176, 1,
-0.1943371, 1.728173, -0.0291446, 0, 1, 0.5019608, 1,
-0.1936403, 0.8642742, -1.482116, 0, 1, 0.509804, 1,
-0.1929159, 0.6190886, -0.8168904, 0, 1, 0.5137255, 1,
-0.1927288, 1.1694, -1.500171, 0, 1, 0.5215687, 1,
-0.1913573, -0.6193409, -2.174264, 0, 1, 0.5254902, 1,
-0.1883595, -0.1352215, -2.379356, 0, 1, 0.5333334, 1,
-0.1852609, -0.5399134, -2.069825, 0, 1, 0.5372549, 1,
-0.1838045, 0.1180957, -0.5247855, 0, 1, 0.5450981, 1,
-0.1797061, -1.821867, -3.306992, 0, 1, 0.5490196, 1,
-0.1792471, -0.2672859, -4.609606, 0, 1, 0.5568628, 1,
-0.1765986, 1.4017, -0.837476, 0, 1, 0.5607843, 1,
-0.1753203, 0.4405281, 0.4059048, 0, 1, 0.5686275, 1,
-0.1742312, -0.5972899, -3.285614, 0, 1, 0.572549, 1,
-0.1728631, 1.617328, 0.1804701, 0, 1, 0.5803922, 1,
-0.169533, -0.6442115, -2.258065, 0, 1, 0.5843138, 1,
-0.1695293, -2.688783, -4.012098, 0, 1, 0.5921569, 1,
-0.1685989, -0.4220123, -2.264663, 0, 1, 0.5960785, 1,
-0.1685545, -0.7331204, -3.867255, 0, 1, 0.6039216, 1,
-0.1678121, 0.8696176, -0.06420289, 0, 1, 0.6117647, 1,
-0.1651593, -1.794681, -2.387211, 0, 1, 0.6156863, 1,
-0.1562166, -0.3891716, -2.979638, 0, 1, 0.6235294, 1,
-0.1545887, -0.344302, 0.1047341, 0, 1, 0.627451, 1,
-0.1507938, -0.7911301, -5.039591, 0, 1, 0.6352941, 1,
-0.1494755, -0.5202411, -1.308888, 0, 1, 0.6392157, 1,
-0.1493823, 0.59408, 0.5359712, 0, 1, 0.6470588, 1,
-0.142709, 0.3081414, -0.2278866, 0, 1, 0.6509804, 1,
-0.1316231, 0.7014751, -0.1314526, 0, 1, 0.6588235, 1,
-0.1299878, -1.673209, -2.527765, 0, 1, 0.6627451, 1,
-0.129389, -0.8633348, -2.950895, 0, 1, 0.6705883, 1,
-0.1225221, -0.1593887, -3.650608, 0, 1, 0.6745098, 1,
-0.1151693, 0.4171195, 0.5970587, 0, 1, 0.682353, 1,
-0.1141725, 1.206012, -1.066061, 0, 1, 0.6862745, 1,
-0.1115105, 0.5632672, -0.5787061, 0, 1, 0.6941177, 1,
-0.1101408, 1.142437, 1.287791, 0, 1, 0.7019608, 1,
-0.1091281, -1.1753, -4.500387, 0, 1, 0.7058824, 1,
-0.1049148, 0.09676126, -0.911699, 0, 1, 0.7137255, 1,
-0.1039698, -1.715047, -4.714746, 0, 1, 0.7176471, 1,
-0.1020616, -0.029049, -1.734929, 0, 1, 0.7254902, 1,
-0.1015724, 0.2223248, -1.748527, 0, 1, 0.7294118, 1,
-0.1000911, 0.3719556, -1.013228, 0, 1, 0.7372549, 1,
-0.09892495, 1.485903, 0.9272143, 0, 1, 0.7411765, 1,
-0.09748133, 0.2975056, 1.002782, 0, 1, 0.7490196, 1,
-0.08956419, -1.043537, -2.510116, 0, 1, 0.7529412, 1,
-0.08364044, 1.539018, -0.8453592, 0, 1, 0.7607843, 1,
-0.07989832, 0.4979123, -0.1408487, 0, 1, 0.7647059, 1,
-0.07807186, -0.4745101, -2.034367, 0, 1, 0.772549, 1,
-0.07659265, 1.849207, 1.081324, 0, 1, 0.7764706, 1,
-0.07640314, 1.137867, 0.135266, 0, 1, 0.7843137, 1,
-0.0758054, 0.9018916, 1.083547, 0, 1, 0.7882353, 1,
-0.07314314, 0.5743141, 0.2785297, 0, 1, 0.7960784, 1,
-0.06925372, -1.550822, -2.023803, 0, 1, 0.8039216, 1,
-0.06855544, 0.1958667, -0.4151588, 0, 1, 0.8078431, 1,
-0.0672631, 2.78932, 0.1697501, 0, 1, 0.8156863, 1,
-0.06512947, -1.336335, -3.621322, 0, 1, 0.8196079, 1,
-0.06386649, 2.197833, 1.373141, 0, 1, 0.827451, 1,
-0.05871227, -1.803611, -4.190543, 0, 1, 0.8313726, 1,
-0.0500628, -0.6444442, -3.222012, 0, 1, 0.8392157, 1,
-0.04692756, -1.272271, -1.823802, 0, 1, 0.8431373, 1,
-0.04520719, -0.6107509, -2.027495, 0, 1, 0.8509804, 1,
-0.04501937, -0.5262014, -4.574049, 0, 1, 0.854902, 1,
-0.04245422, 0.7839436, -1.463762, 0, 1, 0.8627451, 1,
-0.03978069, 0.978399, 0.1166855, 0, 1, 0.8666667, 1,
-0.03903428, 1.323159, -0.4623809, 0, 1, 0.8745098, 1,
-0.0363322, -0.4575137, -2.020007, 0, 1, 0.8784314, 1,
-0.03438935, -0.7634699, -4.25456, 0, 1, 0.8862745, 1,
-0.03430665, 0.7194568, 0.722961, 0, 1, 0.8901961, 1,
-0.0327682, 0.5625483, 0.2456048, 0, 1, 0.8980392, 1,
-0.03156113, 1.58884, -0.2729844, 0, 1, 0.9058824, 1,
-0.03066049, 0.6063607, 0.6031358, 0, 1, 0.9098039, 1,
-0.02942721, -1.174211, -2.29856, 0, 1, 0.9176471, 1,
-0.02902306, -0.4219373, -3.858787, 0, 1, 0.9215686, 1,
-0.02792898, 1.624434, -0.1388874, 0, 1, 0.9294118, 1,
-0.02514617, 0.1342914, -0.9100169, 0, 1, 0.9333333, 1,
-0.02411009, -0.06380403, -3.104057, 0, 1, 0.9411765, 1,
-0.02085636, -0.2704099, -2.70866, 0, 1, 0.945098, 1,
-0.01930786, -0.7199725, -2.829994, 0, 1, 0.9529412, 1,
-0.01930666, -0.2409116, -1.533835, 0, 1, 0.9568627, 1,
-0.01717085, 0.3231709, -0.2368611, 0, 1, 0.9647059, 1,
-0.0130001, -0.7770922, -2.997138, 0, 1, 0.9686275, 1,
-0.01260611, -0.7883072, -4.053145, 0, 1, 0.9764706, 1,
-0.008851285, 1.929508, 0.3615154, 0, 1, 0.9803922, 1,
-0.007718531, -1.211926, -2.994768, 0, 1, 0.9882353, 1,
-0.0007375091, -0.3015007, -4.603918, 0, 1, 0.9921569, 1,
0.0004632263, 0.01598483, 0.8886789, 0, 1, 1, 1,
0.0006015144, -0.7489443, 3.267241, 0, 0.9921569, 1, 1,
0.003476949, 1.817361, 0.4106209, 0, 0.9882353, 1, 1,
0.003734938, -0.6249373, 4.474844, 0, 0.9803922, 1, 1,
0.007677199, 0.034738, -0.004252102, 0, 0.9764706, 1, 1,
0.01159362, -0.2866378, 2.831864, 0, 0.9686275, 1, 1,
0.01620698, -1.498772, 4.736133, 0, 0.9647059, 1, 1,
0.01724484, -0.3712383, 2.100797, 0, 0.9568627, 1, 1,
0.0176414, -0.1474223, 3.911301, 0, 0.9529412, 1, 1,
0.01938538, -0.9418701, 4.922644, 0, 0.945098, 1, 1,
0.02170911, -0.2531283, 1.57291, 0, 0.9411765, 1, 1,
0.03900382, 1.275971, 1.152676, 0, 0.9333333, 1, 1,
0.0398019, -0.8691776, 2.05106, 0, 0.9294118, 1, 1,
0.04661417, 0.07617237, -0.03342026, 0, 0.9215686, 1, 1,
0.04746621, 0.6441463, -0.9463152, 0, 0.9176471, 1, 1,
0.04963284, 0.824747, -0.5858204, 0, 0.9098039, 1, 1,
0.05145624, 0.4630038, -1.405143, 0, 0.9058824, 1, 1,
0.05588193, 1.75432, -0.07880781, 0, 0.8980392, 1, 1,
0.05715962, -1.041341, 3.809362, 0, 0.8901961, 1, 1,
0.0607809, -0.7063785, 3.056062, 0, 0.8862745, 1, 1,
0.06164602, -0.2177495, 2.354863, 0, 0.8784314, 1, 1,
0.06491686, -0.4445688, 2.091149, 0, 0.8745098, 1, 1,
0.06496778, 0.1893246, 0.3776764, 0, 0.8666667, 1, 1,
0.06890015, 0.542343, -0.0775158, 0, 0.8627451, 1, 1,
0.0743783, -2.501103, 2.758744, 0, 0.854902, 1, 1,
0.07483883, -0.03397957, 2.69309, 0, 0.8509804, 1, 1,
0.07806993, 0.1608272, -0.7881936, 0, 0.8431373, 1, 1,
0.07913984, -1.618935, 1.688362, 0, 0.8392157, 1, 1,
0.08015853, 0.742359, 0.8806643, 0, 0.8313726, 1, 1,
0.08242434, -0.6385757, 1.684022, 0, 0.827451, 1, 1,
0.08351082, 1.283668, 0.2184981, 0, 0.8196079, 1, 1,
0.08387478, -1.246215, 2.278913, 0, 0.8156863, 1, 1,
0.0861157, -0.9875816, 3.871711, 0, 0.8078431, 1, 1,
0.08978165, -1.053963, 2.902272, 0, 0.8039216, 1, 1,
0.09095893, -0.8970727, 0.9688846, 0, 0.7960784, 1, 1,
0.09238338, -1.708853, 0.2749151, 0, 0.7882353, 1, 1,
0.09295365, -0.1060758, 1.534324, 0, 0.7843137, 1, 1,
0.09392095, 0.4138778, 0.9979147, 0, 0.7764706, 1, 1,
0.09531508, 0.6606303, 1.371684, 0, 0.772549, 1, 1,
0.09680653, -0.004924752, 2.065174, 0, 0.7647059, 1, 1,
0.09721508, -0.8096825, 2.991217, 0, 0.7607843, 1, 1,
0.0983253, 0.8983999, 0.390714, 0, 0.7529412, 1, 1,
0.09961841, -0.904138, 1.253419, 0, 0.7490196, 1, 1,
0.1101765, -0.9898642, 3.80889, 0, 0.7411765, 1, 1,
0.1161164, 1.23878, 0.2676886, 0, 0.7372549, 1, 1,
0.1186773, -2.012293, 2.390142, 0, 0.7294118, 1, 1,
0.1247613, 1.112698, -1.709298, 0, 0.7254902, 1, 1,
0.1348948, -1.460273, 3.3585, 0, 0.7176471, 1, 1,
0.134943, -0.1174535, 3.038619, 0, 0.7137255, 1, 1,
0.1382094, 1.495326, 1.435856, 0, 0.7058824, 1, 1,
0.1451534, 0.7098888, 0.772723, 0, 0.6980392, 1, 1,
0.1463718, 0.3322925, 0.962165, 0, 0.6941177, 1, 1,
0.1470936, -0.1358503, 2.700721, 0, 0.6862745, 1, 1,
0.1471749, 0.4825152, 0.9799345, 0, 0.682353, 1, 1,
0.1475286, 0.3811149, 0.6996329, 0, 0.6745098, 1, 1,
0.1491416, -2.326081, 2.514796, 0, 0.6705883, 1, 1,
0.1546965, -1.203132, 3.281703, 0, 0.6627451, 1, 1,
0.1564777, 0.02332803, 1.730117, 0, 0.6588235, 1, 1,
0.1589266, -0.1574773, 2.57255, 0, 0.6509804, 1, 1,
0.159093, 0.6899528, -1.100542, 0, 0.6470588, 1, 1,
0.1611404, 0.5592197, -0.6270049, 0, 0.6392157, 1, 1,
0.165888, 0.5652146, 0.6290328, 0, 0.6352941, 1, 1,
0.1701817, -0.7460379, 3.288973, 0, 0.627451, 1, 1,
0.172342, 2.521938, 1.303273, 0, 0.6235294, 1, 1,
0.1728471, 0.5943099, 0.5766891, 0, 0.6156863, 1, 1,
0.1737769, 0.2702756, 0.2186616, 0, 0.6117647, 1, 1,
0.1751674, 0.3992158, -0.9706887, 0, 0.6039216, 1, 1,
0.175511, 0.2492173, 1.220587, 0, 0.5960785, 1, 1,
0.1796685, 0.6712109, 0.6631906, 0, 0.5921569, 1, 1,
0.180728, 0.2066269, 1.19779, 0, 0.5843138, 1, 1,
0.1889393, 0.03998613, 1.976361, 0, 0.5803922, 1, 1,
0.1928239, 0.2868117, -0.1861246, 0, 0.572549, 1, 1,
0.1932525, -0.1597774, 3.104096, 0, 0.5686275, 1, 1,
0.1954997, -0.7608222, 1.899502, 0, 0.5607843, 1, 1,
0.1983369, 0.03320227, 1.074248, 0, 0.5568628, 1, 1,
0.1992811, -2.081418, 5.195239, 0, 0.5490196, 1, 1,
0.199694, 0.9411452, -0.4060485, 0, 0.5450981, 1, 1,
0.1998315, -0.583847, 2.452838, 0, 0.5372549, 1, 1,
0.202571, 0.4056652, -0.03363985, 0, 0.5333334, 1, 1,
0.2039752, -0.7650079, 3.698053, 0, 0.5254902, 1, 1,
0.2065163, -0.2641303, 2.752889, 0, 0.5215687, 1, 1,
0.2070722, 0.7868042, 0.9249359, 0, 0.5137255, 1, 1,
0.2140675, 1.054208, -1.322, 0, 0.509804, 1, 1,
0.2170213, -0.04899439, 3.796933, 0, 0.5019608, 1, 1,
0.218464, 1.190602, -1.316984, 0, 0.4941176, 1, 1,
0.2244533, 1.297317, 0.7091872, 0, 0.4901961, 1, 1,
0.2255159, 1.199745, 0.5904287, 0, 0.4823529, 1, 1,
0.2264583, -1.619657, 4.406054, 0, 0.4784314, 1, 1,
0.2271368, -2.048821, 2.0109, 0, 0.4705882, 1, 1,
0.2284869, 0.7168427, 2.436158, 0, 0.4666667, 1, 1,
0.2285378, -0.2295172, 2.412895, 0, 0.4588235, 1, 1,
0.2305132, -0.7722707, 2.743858, 0, 0.454902, 1, 1,
0.2328592, 0.4109623, -0.5894565, 0, 0.4470588, 1, 1,
0.2336631, 0.09816214, 2.361168, 0, 0.4431373, 1, 1,
0.234288, 0.7345761, -0.06241459, 0, 0.4352941, 1, 1,
0.2351602, 0.2499985, 2.602188, 0, 0.4313726, 1, 1,
0.2397734, -0.05004229, 0.8994325, 0, 0.4235294, 1, 1,
0.2409526, 0.4245914, 0.3879655, 0, 0.4196078, 1, 1,
0.2422565, -0.01353955, 1.137154, 0, 0.4117647, 1, 1,
0.2465918, -1.50125, 2.699207, 0, 0.4078431, 1, 1,
0.2476224, -0.7199382, 4.372105, 0, 0.4, 1, 1,
0.2484169, 0.2532646, 0.5897833, 0, 0.3921569, 1, 1,
0.2558382, 0.2308128, -1.0819, 0, 0.3882353, 1, 1,
0.2562122, 0.3809289, 0.2551688, 0, 0.3803922, 1, 1,
0.2595312, 0.07839271, 1.116569, 0, 0.3764706, 1, 1,
0.2611603, 0.9676965, 0.1692705, 0, 0.3686275, 1, 1,
0.2616639, 0.2526923, -1.760969, 0, 0.3647059, 1, 1,
0.2671291, 0.5824386, -0.4697225, 0, 0.3568628, 1, 1,
0.2752271, -0.5294627, 1.274247, 0, 0.3529412, 1, 1,
0.2755001, -0.8494082, 1.558969, 0, 0.345098, 1, 1,
0.2812145, -0.08155636, 1.601512, 0, 0.3411765, 1, 1,
0.2829968, -2.509135, 4.024012, 0, 0.3333333, 1, 1,
0.2868054, 1.43547, 0.6437014, 0, 0.3294118, 1, 1,
0.2877138, 1.132466, -0.1167545, 0, 0.3215686, 1, 1,
0.2910412, 1.417027, -0.5194929, 0, 0.3176471, 1, 1,
0.2913094, 0.2311004, 1.461, 0, 0.3098039, 1, 1,
0.2936024, -0.4611315, 2.740823, 0, 0.3058824, 1, 1,
0.2984736, -0.3507166, 2.368827, 0, 0.2980392, 1, 1,
0.3023857, -1.425039, 2.65926, 0, 0.2901961, 1, 1,
0.3045238, 0.5345122, 2.67216, 0, 0.2862745, 1, 1,
0.308096, -0.7973626, 3.005826, 0, 0.2784314, 1, 1,
0.3092499, 1.043541, 0.181621, 0, 0.2745098, 1, 1,
0.3097501, 1.376329, -0.4849852, 0, 0.2666667, 1, 1,
0.3139229, -2.282192, 3.505125, 0, 0.2627451, 1, 1,
0.3160992, -0.9226721, 3.829014, 0, 0.254902, 1, 1,
0.320895, -0.6598125, 2.751831, 0, 0.2509804, 1, 1,
0.3232564, 0.3178614, 0.3909761, 0, 0.2431373, 1, 1,
0.3244371, -0.7612365, 2.142864, 0, 0.2392157, 1, 1,
0.3329544, -0.243883, 3.415687, 0, 0.2313726, 1, 1,
0.3335071, 0.8531839, 0.2003271, 0, 0.227451, 1, 1,
0.3361592, 0.2872488, 1.380175, 0, 0.2196078, 1, 1,
0.3427293, 0.6448401, 0.6509015, 0, 0.2156863, 1, 1,
0.3434535, -0.6480275, 4.284245, 0, 0.2078431, 1, 1,
0.3459046, 0.8034163, 0.8960538, 0, 0.2039216, 1, 1,
0.3477496, -1.010747, 3.536594, 0, 0.1960784, 1, 1,
0.3536262, 1.129966, -1.025893, 0, 0.1882353, 1, 1,
0.3555337, -0.2848766, 1.931705, 0, 0.1843137, 1, 1,
0.3555384, 1.266754, -0.1707611, 0, 0.1764706, 1, 1,
0.3578253, 0.1332302, 0.7743121, 0, 0.172549, 1, 1,
0.3587441, -0.3799721, 3.738007, 0, 0.1647059, 1, 1,
0.364437, 2.70226, -0.1515985, 0, 0.1607843, 1, 1,
0.3722651, -0.4430408, 3.74817, 0, 0.1529412, 1, 1,
0.3869669, -0.7053044, 0.9475245, 0, 0.1490196, 1, 1,
0.3885096, -1.714031, 2.12281, 0, 0.1411765, 1, 1,
0.392904, -0.6739274, 2.04817, 0, 0.1372549, 1, 1,
0.392946, -1.909509, 2.521945, 0, 0.1294118, 1, 1,
0.3985287, 0.4939233, 0.8989324, 0, 0.1254902, 1, 1,
0.4012649, -0.009153126, 2.096699, 0, 0.1176471, 1, 1,
0.4036968, 0.2445543, 0.1715044, 0, 0.1137255, 1, 1,
0.4061984, -0.7961247, 2.692615, 0, 0.1058824, 1, 1,
0.4081896, -1.249738, 3.383514, 0, 0.09803922, 1, 1,
0.4102162, 0.522674, 0.189999, 0, 0.09411765, 1, 1,
0.4106121, 1.832991, -0.27465, 0, 0.08627451, 1, 1,
0.4111683, 0.3524614, -0.4369076, 0, 0.08235294, 1, 1,
0.4121949, 1.254009, -1.331882, 0, 0.07450981, 1, 1,
0.4139947, -1.519971, 2.489531, 0, 0.07058824, 1, 1,
0.4145698, -0.8721166, -0.1359906, 0, 0.0627451, 1, 1,
0.4146428, -0.5824144, 1.835191, 0, 0.05882353, 1, 1,
0.4180916, -1.438831, 3.572032, 0, 0.05098039, 1, 1,
0.4184702, 1.52404, 0.3082818, 0, 0.04705882, 1, 1,
0.4197741, 0.838911, -0.2674203, 0, 0.03921569, 1, 1,
0.4251326, 1.990009, -0.7402796, 0, 0.03529412, 1, 1,
0.4277526, 1.46946, 0.3446576, 0, 0.02745098, 1, 1,
0.4294817, -1.214543, 3.464154, 0, 0.02352941, 1, 1,
0.4310414, -0.5427148, 1.732659, 0, 0.01568628, 1, 1,
0.4337131, 0.3139164, 0.8537033, 0, 0.01176471, 1, 1,
0.433928, 1.370394, 0.04799047, 0, 0.003921569, 1, 1,
0.4372954, 0.01916731, 1.428068, 0.003921569, 0, 1, 1,
0.4409527, 0.08715018, 0.7283044, 0.007843138, 0, 1, 1,
0.4412112, -0.7415559, 1.70268, 0.01568628, 0, 1, 1,
0.44536, -0.25214, 0.9191352, 0.01960784, 0, 1, 1,
0.4465013, -0.2050529, 1.58156, 0.02745098, 0, 1, 1,
0.4493077, 0.377149, -0.01086687, 0.03137255, 0, 1, 1,
0.451917, -0.8301389, 4.672735, 0.03921569, 0, 1, 1,
0.4530478, -0.7371609, 2.17977, 0.04313726, 0, 1, 1,
0.4556291, -0.4369789, 0.8613762, 0.05098039, 0, 1, 1,
0.4565706, 1.244223, -1.008513, 0.05490196, 0, 1, 1,
0.4656272, 0.2110635, 2.514433, 0.0627451, 0, 1, 1,
0.4660182, -0.6187263, 2.413144, 0.06666667, 0, 1, 1,
0.4689839, 0.852037, -0.3352166, 0.07450981, 0, 1, 1,
0.4765959, -0.06869633, 2.76863, 0.07843138, 0, 1, 1,
0.4796296, -1.592159, 4.230129, 0.08627451, 0, 1, 1,
0.4863911, 1.176917, -1.249796, 0.09019608, 0, 1, 1,
0.4899746, -0.1014233, 1.581284, 0.09803922, 0, 1, 1,
0.4945171, -0.8124539, 4.009088, 0.1058824, 0, 1, 1,
0.4948527, -0.5827966, 2.580264, 0.1098039, 0, 1, 1,
0.4997172, 0.2946947, 0.6869252, 0.1176471, 0, 1, 1,
0.5026316, -0.5103616, 2.934595, 0.1215686, 0, 1, 1,
0.5037048, 0.7342845, 0.6729172, 0.1294118, 0, 1, 1,
0.5077441, -2.442624, 2.656834, 0.1333333, 0, 1, 1,
0.5082223, -1.730326, 3.494836, 0.1411765, 0, 1, 1,
0.5105833, -1.658391, 2.131496, 0.145098, 0, 1, 1,
0.5121489, 0.3630337, 0.3671194, 0.1529412, 0, 1, 1,
0.5133615, -0.5483494, 1.6883, 0.1568628, 0, 1, 1,
0.5176277, 1.045048, 4.595579, 0.1647059, 0, 1, 1,
0.520157, -1.260648, 3.746694, 0.1686275, 0, 1, 1,
0.520238, 0.5291549, -0.9268862, 0.1764706, 0, 1, 1,
0.5210438, -0.3443166, 3.408174, 0.1803922, 0, 1, 1,
0.5210868, 1.476384, 1.03882, 0.1882353, 0, 1, 1,
0.5218176, 0.794377, 1.378128, 0.1921569, 0, 1, 1,
0.5226115, 0.9243473, -0.2233051, 0.2, 0, 1, 1,
0.5285774, -0.9908544, 3.098889, 0.2078431, 0, 1, 1,
0.5351489, -0.33861, 1.315479, 0.2117647, 0, 1, 1,
0.5429181, 0.7192987, 2.114413, 0.2196078, 0, 1, 1,
0.5435876, -0.02612058, 2.217038, 0.2235294, 0, 1, 1,
0.5439144, -0.7900306, 2.843102, 0.2313726, 0, 1, 1,
0.550652, -0.5051196, 3.352095, 0.2352941, 0, 1, 1,
0.5525498, -0.6167697, 3.191767, 0.2431373, 0, 1, 1,
0.55551, -0.7973657, 1.519423, 0.2470588, 0, 1, 1,
0.5601886, 1.680316, 0.1992401, 0.254902, 0, 1, 1,
0.5633544, -1.263033, 2.814574, 0.2588235, 0, 1, 1,
0.5646678, -0.02542961, 1.775046, 0.2666667, 0, 1, 1,
0.565195, 0.1078017, -0.4410455, 0.2705882, 0, 1, 1,
0.5652218, -0.8866499, 0.4642801, 0.2784314, 0, 1, 1,
0.5670028, 0.6016663, 1.05392, 0.282353, 0, 1, 1,
0.5739165, -0.3865901, 1.21086, 0.2901961, 0, 1, 1,
0.5747855, -0.3661506, 2.386399, 0.2941177, 0, 1, 1,
0.5748159, -1.34038, 2.331383, 0.3019608, 0, 1, 1,
0.5792124, 0.2463738, 1.457449, 0.3098039, 0, 1, 1,
0.5793301, 1.382778, 0.2442572, 0.3137255, 0, 1, 1,
0.5796931, 0.8507739, -1.293807, 0.3215686, 0, 1, 1,
0.5810616, 0.248541, 1.757815, 0.3254902, 0, 1, 1,
0.5831033, 0.4928802, 0.1068712, 0.3333333, 0, 1, 1,
0.590215, 0.3080478, 2.007535, 0.3372549, 0, 1, 1,
0.5927614, -0.7907617, 1.80704, 0.345098, 0, 1, 1,
0.594257, -0.4737125, 0.6582753, 0.3490196, 0, 1, 1,
0.5950989, -0.4421235, 3.070833, 0.3568628, 0, 1, 1,
0.595405, -1.372976, 2.886011, 0.3607843, 0, 1, 1,
0.597014, 0.6308793, 1.566349, 0.3686275, 0, 1, 1,
0.5973816, -0.5426667, 4.94538, 0.372549, 0, 1, 1,
0.6007741, -0.9333379, 2.71597, 0.3803922, 0, 1, 1,
0.6009715, 0.8776954, 0.3777223, 0.3843137, 0, 1, 1,
0.6088781, -0.2931973, 1.839156, 0.3921569, 0, 1, 1,
0.6093642, -1.226843, 2.33682, 0.3960784, 0, 1, 1,
0.6146048, 1.235215, 0.3443969, 0.4039216, 0, 1, 1,
0.6213146, 1.342718, 0.1950671, 0.4117647, 0, 1, 1,
0.6249999, 0.3500538, 0.5675402, 0.4156863, 0, 1, 1,
0.6282411, -0.8191383, 3.597666, 0.4235294, 0, 1, 1,
0.6329571, 0.6795216, -0.8766865, 0.427451, 0, 1, 1,
0.641923, -0.1160803, -1.071731, 0.4352941, 0, 1, 1,
0.6473609, -2.525939, 5.132156, 0.4392157, 0, 1, 1,
0.6485975, -0.1313684, 1.396767, 0.4470588, 0, 1, 1,
0.6495593, 0.1858987, 1.738885, 0.4509804, 0, 1, 1,
0.6517561, -0.3727621, 3.864187, 0.4588235, 0, 1, 1,
0.6652126, 0.1421436, 2.194337, 0.4627451, 0, 1, 1,
0.6725451, -0.5418391, 3.083021, 0.4705882, 0, 1, 1,
0.6820918, 0.6093959, 0.52273, 0.4745098, 0, 1, 1,
0.6873803, -0.702262, 5.000681, 0.4823529, 0, 1, 1,
0.6924148, -0.08871122, 3.4353, 0.4862745, 0, 1, 1,
0.6942033, -0.1482969, 1.989536, 0.4941176, 0, 1, 1,
0.6960328, -0.08630222, 0.6227453, 0.5019608, 0, 1, 1,
0.6975784, -1.311628, 3.611639, 0.5058824, 0, 1, 1,
0.6987863, -0.3707026, 2.37278, 0.5137255, 0, 1, 1,
0.7021461, -1.394074, 2.000447, 0.5176471, 0, 1, 1,
0.7113233, -0.7197269, 3.311607, 0.5254902, 0, 1, 1,
0.7113919, -0.5017632, 2.857222, 0.5294118, 0, 1, 1,
0.727446, 0.3061252, 2.177224, 0.5372549, 0, 1, 1,
0.7276506, 0.3736638, -0.5905569, 0.5411765, 0, 1, 1,
0.7312546, 1.515121, 1.095095, 0.5490196, 0, 1, 1,
0.7367135, 0.3815754, 1.881583, 0.5529412, 0, 1, 1,
0.7382751, 0.841672, 1.485564, 0.5607843, 0, 1, 1,
0.7406357, -1.732607, 3.513074, 0.5647059, 0, 1, 1,
0.7407709, 0.02470209, 2.084727, 0.572549, 0, 1, 1,
0.7420128, -0.7180158, 3.331774, 0.5764706, 0, 1, 1,
0.7455034, -0.5899099, 0.7793214, 0.5843138, 0, 1, 1,
0.7481893, -1.638483, 1.605983, 0.5882353, 0, 1, 1,
0.7535457, 0.4073034, 2.044347, 0.5960785, 0, 1, 1,
0.7537485, -0.1056384, 1.194804, 0.6039216, 0, 1, 1,
0.7545683, -0.128853, 2.184785, 0.6078432, 0, 1, 1,
0.7570217, -0.3741754, 1.380074, 0.6156863, 0, 1, 1,
0.7638027, 1.902796, 1.323657, 0.6196079, 0, 1, 1,
0.7662404, -2.097147, 2.079239, 0.627451, 0, 1, 1,
0.7683541, 0.4306651, 1.575489, 0.6313726, 0, 1, 1,
0.7720461, 1.137629, 1.133948, 0.6392157, 0, 1, 1,
0.773011, 0.3270268, 1.206568, 0.6431373, 0, 1, 1,
0.7767214, -1.296267, 0.7782621, 0.6509804, 0, 1, 1,
0.7776864, -0.06322176, -0.2228429, 0.654902, 0, 1, 1,
0.781165, -0.1690686, 2.530374, 0.6627451, 0, 1, 1,
0.7868162, 0.1877774, 2.566237, 0.6666667, 0, 1, 1,
0.7939668, 0.4414394, 2.072139, 0.6745098, 0, 1, 1,
0.7976785, 0.02777651, 0.9105451, 0.6784314, 0, 1, 1,
0.8017924, 1.086223, -0.1830757, 0.6862745, 0, 1, 1,
0.8028609, 0.9901582, 1.405164, 0.6901961, 0, 1, 1,
0.8037496, -1.408657, 2.834176, 0.6980392, 0, 1, 1,
0.8038917, -2.901596, 4.215031, 0.7058824, 0, 1, 1,
0.8046715, -1.688904, 1.967803, 0.7098039, 0, 1, 1,
0.8049676, 1.270853, -0.4119006, 0.7176471, 0, 1, 1,
0.807903, -0.2771727, 1.627609, 0.7215686, 0, 1, 1,
0.8146857, -0.3223583, 3.687231, 0.7294118, 0, 1, 1,
0.8165926, 0.3345663, 1.647944, 0.7333333, 0, 1, 1,
0.8185013, 0.3080207, 2.367054, 0.7411765, 0, 1, 1,
0.8196386, -1.155953, 0.6924087, 0.7450981, 0, 1, 1,
0.8229728, 0.1516331, 0.4950891, 0.7529412, 0, 1, 1,
0.8243796, 1.156388, 1.274431, 0.7568628, 0, 1, 1,
0.8286052, -0.3802795, 1.238925, 0.7647059, 0, 1, 1,
0.8426408, 1.778855, -2.400267, 0.7686275, 0, 1, 1,
0.8475175, 0.06747765, 1.896077, 0.7764706, 0, 1, 1,
0.8578119, -0.1962956, 1.764316, 0.7803922, 0, 1, 1,
0.8589658, 0.6848662, 0.1966577, 0.7882353, 0, 1, 1,
0.8619495, 1.994092, -1.198827, 0.7921569, 0, 1, 1,
0.8637228, 0.02625315, 2.441583, 0.8, 0, 1, 1,
0.8655977, 1.079819, 0.4364421, 0.8078431, 0, 1, 1,
0.8753791, -0.3471144, 2.063187, 0.8117647, 0, 1, 1,
0.880589, -1.48553, 1.905463, 0.8196079, 0, 1, 1,
0.8817369, 1.642788, 0.9270391, 0.8235294, 0, 1, 1,
0.8838071, 1.446674, -0.9610992, 0.8313726, 0, 1, 1,
0.8865688, -0.4212729, 3.563033, 0.8352941, 0, 1, 1,
0.8897556, -0.7915417, -0.4321188, 0.8431373, 0, 1, 1,
0.889764, -0.4527798, 0.6938788, 0.8470588, 0, 1, 1,
0.8930689, 0.9552606, 1.854826, 0.854902, 0, 1, 1,
0.8945234, 0.3456706, 1.609955, 0.8588235, 0, 1, 1,
0.8973809, 2.48319, -0.3850601, 0.8666667, 0, 1, 1,
0.8982191, -0.322142, 1.418006, 0.8705882, 0, 1, 1,
0.9019508, -0.4054402, 2.881641, 0.8784314, 0, 1, 1,
0.9025992, -0.2276111, 2.129904, 0.8823529, 0, 1, 1,
0.9036322, 0.03339057, 0.7270925, 0.8901961, 0, 1, 1,
0.9144435, -0.3752474, 1.295825, 0.8941177, 0, 1, 1,
0.9163356, 0.03321804, 1.849625, 0.9019608, 0, 1, 1,
0.9239171, -0.6903964, 2.527605, 0.9098039, 0, 1, 1,
0.930386, -0.943298, 1.858253, 0.9137255, 0, 1, 1,
0.9324122, 0.2815167, 3.509566, 0.9215686, 0, 1, 1,
0.9336972, -1.176945, 2.439584, 0.9254902, 0, 1, 1,
0.9338957, 0.4169374, 1.705635, 0.9333333, 0, 1, 1,
0.9398583, 0.05227174, 1.57048, 0.9372549, 0, 1, 1,
0.9399738, 1.064002, -0.5661951, 0.945098, 0, 1, 1,
0.9410616, 1.2734, -1.437693, 0.9490196, 0, 1, 1,
0.943498, -1.481625, 2.181476, 0.9568627, 0, 1, 1,
0.9435679, 1.185579, 0.2586842, 0.9607843, 0, 1, 1,
0.9472228, 0.3063683, 1.759308, 0.9686275, 0, 1, 1,
0.9589488, 0.6661817, 1.172565, 0.972549, 0, 1, 1,
0.964042, -0.7623712, 1.20041, 0.9803922, 0, 1, 1,
0.9641888, -0.7272593, 2.773027, 0.9843137, 0, 1, 1,
0.9655346, -0.1964409, 1.479931, 0.9921569, 0, 1, 1,
0.9759466, -0.8615341, 2.249403, 0.9960784, 0, 1, 1,
0.9768302, 0.8249232, -0.09582078, 1, 0, 0.9960784, 1,
0.9821226, 0.3177733, -0.5635559, 1, 0, 0.9882353, 1,
0.9857903, -0.1742909, 1.756313, 1, 0, 0.9843137, 1,
0.9888334, -0.6356386, 2.054426, 1, 0, 0.9764706, 1,
0.9920554, 0.7913708, 0.06333432, 1, 0, 0.972549, 1,
0.9930935, 0.2261265, 1.663567, 1, 0, 0.9647059, 1,
1.004356, -0.4075618, 2.798555, 1, 0, 0.9607843, 1,
1.006129, 0.009188407, 1.941527, 1, 0, 0.9529412, 1,
1.017035, 0.5535194, 2.191613, 1, 0, 0.9490196, 1,
1.01874, 0.874073, 1.294165, 1, 0, 0.9411765, 1,
1.019488, -0.4988436, 1.382729, 1, 0, 0.9372549, 1,
1.029294, -1.25108, 2.638835, 1, 0, 0.9294118, 1,
1.029297, 0.6766305, 0.7135961, 1, 0, 0.9254902, 1,
1.031706, 0.04597449, 3.424776, 1, 0, 0.9176471, 1,
1.034014, -0.2131234, 0.385139, 1, 0, 0.9137255, 1,
1.034478, 0.7624565, 0.3096542, 1, 0, 0.9058824, 1,
1.037617, 0.5245445, 1.15148, 1, 0, 0.9019608, 1,
1.040114, 0.3618494, 0.5624866, 1, 0, 0.8941177, 1,
1.040312, -0.888147, 1.945499, 1, 0, 0.8862745, 1,
1.050476, 1.181403, -1.34112, 1, 0, 0.8823529, 1,
1.051066, -0.4820408, 0.578553, 1, 0, 0.8745098, 1,
1.051857, 1.270272, -0.7648888, 1, 0, 0.8705882, 1,
1.053253, 0.2399108, 0.5921438, 1, 0, 0.8627451, 1,
1.058955, -1.444676, 2.31781, 1, 0, 0.8588235, 1,
1.062541, 0.915248, 1.148924, 1, 0, 0.8509804, 1,
1.073169, 0.7205518, 0.7075254, 1, 0, 0.8470588, 1,
1.077221, 0.7261, 0.3836564, 1, 0, 0.8392157, 1,
1.088803, -0.3532308, 0.8834183, 1, 0, 0.8352941, 1,
1.091529, 1.287303, 0.4189082, 1, 0, 0.827451, 1,
1.093177, 0.06105272, -0.240269, 1, 0, 0.8235294, 1,
1.097531, -0.1758362, 2.186505, 1, 0, 0.8156863, 1,
1.102749, -1.488173, -0.6150505, 1, 0, 0.8117647, 1,
1.106036, 1.703752, 0.7503038, 1, 0, 0.8039216, 1,
1.106845, 0.2328416, 1.489411, 1, 0, 0.7960784, 1,
1.111175, 0.4014368, 0.2881786, 1, 0, 0.7921569, 1,
1.115848, 1.711129, 0.4448212, 1, 0, 0.7843137, 1,
1.116963, -0.7604553, 2.223354, 1, 0, 0.7803922, 1,
1.11698, 0.9360985, -0.290668, 1, 0, 0.772549, 1,
1.118362, -0.764017, 2.82097, 1, 0, 0.7686275, 1,
1.123781, 1.585114, 0.8890656, 1, 0, 0.7607843, 1,
1.125375, 0.06378502, 1.982703, 1, 0, 0.7568628, 1,
1.127456, -0.1635202, 1.923163, 1, 0, 0.7490196, 1,
1.129598, 0.2773179, 0.2552364, 1, 0, 0.7450981, 1,
1.131632, 0.9680859, 2.100785, 1, 0, 0.7372549, 1,
1.139161, 0.4839329, 1.566782, 1, 0, 0.7333333, 1,
1.149546, 0.3432475, 1.398806, 1, 0, 0.7254902, 1,
1.158831, 0.274323, 1.84024, 1, 0, 0.7215686, 1,
1.16334, -1.27806, 2.151928, 1, 0, 0.7137255, 1,
1.167191, -1.24603, 2.988261, 1, 0, 0.7098039, 1,
1.171935, -0.5883262, 2.304716, 1, 0, 0.7019608, 1,
1.172682, 0.2739479, 2.185569, 1, 0, 0.6941177, 1,
1.173106, 0.1336885, 2.567977, 1, 0, 0.6901961, 1,
1.180484, 2.126185, 0.7300492, 1, 0, 0.682353, 1,
1.18769, 0.1706851, 2.251936, 1, 0, 0.6784314, 1,
1.18774, 0.9148052, -0.09155039, 1, 0, 0.6705883, 1,
1.191902, 0.1299754, 1.374316, 1, 0, 0.6666667, 1,
1.203359, -0.06370285, 2.170514, 1, 0, 0.6588235, 1,
1.212898, -0.5947658, 3.587676, 1, 0, 0.654902, 1,
1.226114, 1.37835, 0.2934644, 1, 0, 0.6470588, 1,
1.240567, -0.4828929, 2.643923, 1, 0, 0.6431373, 1,
1.245465, -0.3771036, 2.145863, 1, 0, 0.6352941, 1,
1.250718, 0.5259054, 0.4469122, 1, 0, 0.6313726, 1,
1.252468, 0.4748856, 2.19079, 1, 0, 0.6235294, 1,
1.260374, -0.5536904, 3.221526, 1, 0, 0.6196079, 1,
1.261985, -0.9935324, 2.235561, 1, 0, 0.6117647, 1,
1.26511, -0.8373081, 2.320107, 1, 0, 0.6078432, 1,
1.283206, -1.422306, 3.041552, 1, 0, 0.6, 1,
1.288237, 0.5562453, 0.8048548, 1, 0, 0.5921569, 1,
1.290955, 0.01681891, 3.119682, 1, 0, 0.5882353, 1,
1.29361, -0.3181453, 0.3392484, 1, 0, 0.5803922, 1,
1.3016, -0.4953521, 3.034187, 1, 0, 0.5764706, 1,
1.301879, 1.085561, -0.5030512, 1, 0, 0.5686275, 1,
1.311384, 0.3274526, 0.930199, 1, 0, 0.5647059, 1,
1.334258, 0.09530539, 2.071404, 1, 0, 0.5568628, 1,
1.342911, -0.1893496, 1.102723, 1, 0, 0.5529412, 1,
1.345262, -1.765033, 2.852384, 1, 0, 0.5450981, 1,
1.34537, 0.3298631, 3.188242, 1, 0, 0.5411765, 1,
1.345806, 1.170445, 1.655732, 1, 0, 0.5333334, 1,
1.354935, 0.6034894, 0.6540578, 1, 0, 0.5294118, 1,
1.375185, 0.4708149, 1.040693, 1, 0, 0.5215687, 1,
1.377335, -0.06198805, 0.6163791, 1, 0, 0.5176471, 1,
1.384604, -0.8792715, 2.379135, 1, 0, 0.509804, 1,
1.386021, -2.652889, 3.221102, 1, 0, 0.5058824, 1,
1.392059, -0.4896196, 1.036066, 1, 0, 0.4980392, 1,
1.397868, 0.7076569, 0.9482007, 1, 0, 0.4901961, 1,
1.406929, -0.1860407, 2.300258, 1, 0, 0.4862745, 1,
1.410146, -0.5326369, 2.466031, 1, 0, 0.4784314, 1,
1.413643, -0.452207, 1.927386, 1, 0, 0.4745098, 1,
1.418904, 0.234663, 0.4434358, 1, 0, 0.4666667, 1,
1.42397, -2.801247, 2.01563, 1, 0, 0.4627451, 1,
1.429946, 0.7062677, 2.38555, 1, 0, 0.454902, 1,
1.435424, 0.7396646, 1.112952, 1, 0, 0.4509804, 1,
1.438313, -0.5614156, 1.672184, 1, 0, 0.4431373, 1,
1.447395, -0.2901655, 3.191713, 1, 0, 0.4392157, 1,
1.45063, -1.29235, 1.912465, 1, 0, 0.4313726, 1,
1.458601, 1.131729, 0.03891691, 1, 0, 0.427451, 1,
1.494612, 0.9532112, 0.05384431, 1, 0, 0.4196078, 1,
1.498737, 0.3344323, 1.763225, 1, 0, 0.4156863, 1,
1.517918, -0.5009855, 0.4426333, 1, 0, 0.4078431, 1,
1.519957, 0.800554, 0.2875683, 1, 0, 0.4039216, 1,
1.535165, 0.496217, 2.778904, 1, 0, 0.3960784, 1,
1.538709, 0.05253379, 0.1032947, 1, 0, 0.3882353, 1,
1.547462, -0.7758913, 1.788254, 1, 0, 0.3843137, 1,
1.562849, 1.552973, 1.299068, 1, 0, 0.3764706, 1,
1.569082, -0.7839548, 3.381413, 1, 0, 0.372549, 1,
1.570115, 0.3293524, 1.184476, 1, 0, 0.3647059, 1,
1.571321, -1.163352, 2.216113, 1, 0, 0.3607843, 1,
1.585607, 1.115133, 0.3562206, 1, 0, 0.3529412, 1,
1.589973, 0.7034277, 2.169555, 1, 0, 0.3490196, 1,
1.609429, -1.874971, 1.92529, 1, 0, 0.3411765, 1,
1.62795, 0.07348355, 1.48724, 1, 0, 0.3372549, 1,
1.64666, 0.408913, 0.1937201, 1, 0, 0.3294118, 1,
1.655106, -0.7575753, 1.041725, 1, 0, 0.3254902, 1,
1.656368, 0.6120394, 2.528643, 1, 0, 0.3176471, 1,
1.663215, -1.008614, 1.514404, 1, 0, 0.3137255, 1,
1.665319, -0.3408762, 1.513938, 1, 0, 0.3058824, 1,
1.665693, 1.372212, 0.5837286, 1, 0, 0.2980392, 1,
1.672492, -1.479432, 1.528924, 1, 0, 0.2941177, 1,
1.675776, 1.388732, 1.632522, 1, 0, 0.2862745, 1,
1.72406, -1.674347, 1.010889, 1, 0, 0.282353, 1,
1.733248, -0.543435, 1.889683, 1, 0, 0.2745098, 1,
1.73712, -0.2624747, 2.204342, 1, 0, 0.2705882, 1,
1.744676, -0.2758086, 2.86429, 1, 0, 0.2627451, 1,
1.752961, -0.2613226, 1.583449, 1, 0, 0.2588235, 1,
1.807651, 0.1639153, 1.603141, 1, 0, 0.2509804, 1,
1.808275, -0.1226327, 2.534156, 1, 0, 0.2470588, 1,
1.811599, 1.202752, 0.7966754, 1, 0, 0.2392157, 1,
1.823155, -0.1533981, 2.220683, 1, 0, 0.2352941, 1,
1.845711, -0.188057, 0.3402867, 1, 0, 0.227451, 1,
1.85694, -0.3777197, 2.452564, 1, 0, 0.2235294, 1,
1.870231, -0.9250433, 2.145694, 1, 0, 0.2156863, 1,
1.876096, -0.4551853, 0.3243208, 1, 0, 0.2117647, 1,
1.876704, -0.2347099, 1.979855, 1, 0, 0.2039216, 1,
1.882956, 0.9721044, 1.21294, 1, 0, 0.1960784, 1,
1.895447, -0.09901898, 1.745495, 1, 0, 0.1921569, 1,
1.899948, 0.3558638, 2.199772, 1, 0, 0.1843137, 1,
1.913971, -2.138638, 3.391013, 1, 0, 0.1803922, 1,
1.921658, -0.2101551, 1.564848, 1, 0, 0.172549, 1,
1.95036, -0.94516, 3.193451, 1, 0, 0.1686275, 1,
1.952216, 1.158918, 1.562463, 1, 0, 0.1607843, 1,
1.953209, 0.5099679, 2.424578, 1, 0, 0.1568628, 1,
1.977019, -0.1686263, 0.2986545, 1, 0, 0.1490196, 1,
2.005635, -1.628034, 2.300605, 1, 0, 0.145098, 1,
2.007051, -0.1442362, 1.839826, 1, 0, 0.1372549, 1,
2.007226, -1.186814, 2.665582, 1, 0, 0.1333333, 1,
2.015205, -1.345478, 0.9885445, 1, 0, 0.1254902, 1,
2.01847, 2.078616, 1.986937, 1, 0, 0.1215686, 1,
2.025337, -1.230574, 3.150944, 1, 0, 0.1137255, 1,
2.034442, 0.9411605, 1.933727, 1, 0, 0.1098039, 1,
2.041543, 0.4834138, 0.6618069, 1, 0, 0.1019608, 1,
2.087841, 0.06926024, 0.2437293, 1, 0, 0.09411765, 1,
2.155322, 1.914407, 0.6385002, 1, 0, 0.09019608, 1,
2.189539, -0.2862932, 2.28308, 1, 0, 0.08235294, 1,
2.245975, -0.881337, 2.785841, 1, 0, 0.07843138, 1,
2.255164, 0.6354223, 0.7936981, 1, 0, 0.07058824, 1,
2.304736, -0.7026773, 1.371811, 1, 0, 0.06666667, 1,
2.411417, 1.222901, 1.334343, 1, 0, 0.05882353, 1,
2.422528, -0.4252366, 1.340358, 1, 0, 0.05490196, 1,
2.433717, 2.944857, -0.1845809, 1, 0, 0.04705882, 1,
2.560632, 0.5803784, 0.8694406, 1, 0, 0.04313726, 1,
2.582926, 2.418822, 1.200956, 1, 0, 0.03529412, 1,
2.637063, 0.4343227, 1.618185, 1, 0, 0.03137255, 1,
2.711107, -1.936012, 3.415767, 1, 0, 0.02352941, 1,
2.738984, -0.689956, 3.035404, 1, 0, 0.01960784, 1,
2.821404, -0.9099355, 0.8144234, 1, 0, 0.01176471, 1,
2.882748, 1.147111, 0.6769107, 1, 0, 0.007843138, 1
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
-0.01055312, -3.89257, -7.351942, 0, -0.5, 0.5, 0.5,
-0.01055312, -3.89257, -7.351942, 1, -0.5, 0.5, 0.5,
-0.01055312, -3.89257, -7.351942, 1, 1.5, 0.5, 0.5,
-0.01055312, -3.89257, -7.351942, 0, 1.5, 0.5, 0.5
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
-3.884683, 0.02163029, -7.351942, 0, -0.5, 0.5, 0.5,
-3.884683, 0.02163029, -7.351942, 1, -0.5, 0.5, 0.5,
-3.884683, 0.02163029, -7.351942, 1, 1.5, 0.5, 0.5,
-3.884683, 0.02163029, -7.351942, 0, 1.5, 0.5, 0.5
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
-3.884683, -3.89257, -0.1690965, 0, -0.5, 0.5, 0.5,
-3.884683, -3.89257, -0.1690965, 1, -0.5, 0.5, 0.5,
-3.884683, -3.89257, -0.1690965, 1, 1.5, 0.5, 0.5,
-3.884683, -3.89257, -0.1690965, 0, 1.5, 0.5, 0.5
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
-2, -2.989293, -5.694362,
2, -2.989293, -5.694362,
-2, -2.989293, -5.694362,
-2, -3.139839, -5.970625,
-1, -2.989293, -5.694362,
-1, -3.139839, -5.970625,
0, -2.989293, -5.694362,
0, -3.139839, -5.970625,
1, -2.989293, -5.694362,
1, -3.139839, -5.970625,
2, -2.989293, -5.694362,
2, -3.139839, -5.970625
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
-2, -3.440931, -6.523152, 0, -0.5, 0.5, 0.5,
-2, -3.440931, -6.523152, 1, -0.5, 0.5, 0.5,
-2, -3.440931, -6.523152, 1, 1.5, 0.5, 0.5,
-2, -3.440931, -6.523152, 0, 1.5, 0.5, 0.5,
-1, -3.440931, -6.523152, 0, -0.5, 0.5, 0.5,
-1, -3.440931, -6.523152, 1, -0.5, 0.5, 0.5,
-1, -3.440931, -6.523152, 1, 1.5, 0.5, 0.5,
-1, -3.440931, -6.523152, 0, 1.5, 0.5, 0.5,
0, -3.440931, -6.523152, 0, -0.5, 0.5, 0.5,
0, -3.440931, -6.523152, 1, -0.5, 0.5, 0.5,
0, -3.440931, -6.523152, 1, 1.5, 0.5, 0.5,
0, -3.440931, -6.523152, 0, 1.5, 0.5, 0.5,
1, -3.440931, -6.523152, 0, -0.5, 0.5, 0.5,
1, -3.440931, -6.523152, 1, -0.5, 0.5, 0.5,
1, -3.440931, -6.523152, 1, 1.5, 0.5, 0.5,
1, -3.440931, -6.523152, 0, 1.5, 0.5, 0.5,
2, -3.440931, -6.523152, 0, -0.5, 0.5, 0.5,
2, -3.440931, -6.523152, 1, -0.5, 0.5, 0.5,
2, -3.440931, -6.523152, 1, 1.5, 0.5, 0.5,
2, -3.440931, -6.523152, 0, 1.5, 0.5, 0.5
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
-2.990653, -2, -5.694362,
-2.990653, 2, -5.694362,
-2.990653, -2, -5.694362,
-3.139658, -2, -5.970625,
-2.990653, -1, -5.694362,
-3.139658, -1, -5.970625,
-2.990653, 0, -5.694362,
-3.139658, 0, -5.970625,
-2.990653, 1, -5.694362,
-3.139658, 1, -5.970625,
-2.990653, 2, -5.694362,
-3.139658, 2, -5.970625
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
-3.437668, -2, -6.523152, 0, -0.5, 0.5, 0.5,
-3.437668, -2, -6.523152, 1, -0.5, 0.5, 0.5,
-3.437668, -2, -6.523152, 1, 1.5, 0.5, 0.5,
-3.437668, -2, -6.523152, 0, 1.5, 0.5, 0.5,
-3.437668, -1, -6.523152, 0, -0.5, 0.5, 0.5,
-3.437668, -1, -6.523152, 1, -0.5, 0.5, 0.5,
-3.437668, -1, -6.523152, 1, 1.5, 0.5, 0.5,
-3.437668, -1, -6.523152, 0, 1.5, 0.5, 0.5,
-3.437668, 0, -6.523152, 0, -0.5, 0.5, 0.5,
-3.437668, 0, -6.523152, 1, -0.5, 0.5, 0.5,
-3.437668, 0, -6.523152, 1, 1.5, 0.5, 0.5,
-3.437668, 0, -6.523152, 0, 1.5, 0.5, 0.5,
-3.437668, 1, -6.523152, 0, -0.5, 0.5, 0.5,
-3.437668, 1, -6.523152, 1, -0.5, 0.5, 0.5,
-3.437668, 1, -6.523152, 1, 1.5, 0.5, 0.5,
-3.437668, 1, -6.523152, 0, 1.5, 0.5, 0.5,
-3.437668, 2, -6.523152, 0, -0.5, 0.5, 0.5,
-3.437668, 2, -6.523152, 1, -0.5, 0.5, 0.5,
-3.437668, 2, -6.523152, 1, 1.5, 0.5, 0.5,
-3.437668, 2, -6.523152, 0, 1.5, 0.5, 0.5
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
-2.990653, -2.989293, -4,
-2.990653, -2.989293, 4,
-2.990653, -2.989293, -4,
-3.139658, -3.139839, -4,
-2.990653, -2.989293, -2,
-3.139658, -3.139839, -2,
-2.990653, -2.989293, 0,
-3.139658, -3.139839, 0,
-2.990653, -2.989293, 2,
-3.139658, -3.139839, 2,
-2.990653, -2.989293, 4,
-3.139658, -3.139839, 4
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
-3.437668, -3.440931, -4, 0, -0.5, 0.5, 0.5,
-3.437668, -3.440931, -4, 1, -0.5, 0.5, 0.5,
-3.437668, -3.440931, -4, 1, 1.5, 0.5, 0.5,
-3.437668, -3.440931, -4, 0, 1.5, 0.5, 0.5,
-3.437668, -3.440931, -2, 0, -0.5, 0.5, 0.5,
-3.437668, -3.440931, -2, 1, -0.5, 0.5, 0.5,
-3.437668, -3.440931, -2, 1, 1.5, 0.5, 0.5,
-3.437668, -3.440931, -2, 0, 1.5, 0.5, 0.5,
-3.437668, -3.440931, 0, 0, -0.5, 0.5, 0.5,
-3.437668, -3.440931, 0, 1, -0.5, 0.5, 0.5,
-3.437668, -3.440931, 0, 1, 1.5, 0.5, 0.5,
-3.437668, -3.440931, 0, 0, 1.5, 0.5, 0.5,
-3.437668, -3.440931, 2, 0, -0.5, 0.5, 0.5,
-3.437668, -3.440931, 2, 1, -0.5, 0.5, 0.5,
-3.437668, -3.440931, 2, 1, 1.5, 0.5, 0.5,
-3.437668, -3.440931, 2, 0, 1.5, 0.5, 0.5,
-3.437668, -3.440931, 4, 0, -0.5, 0.5, 0.5,
-3.437668, -3.440931, 4, 1, -0.5, 0.5, 0.5,
-3.437668, -3.440931, 4, 1, 1.5, 0.5, 0.5,
-3.437668, -3.440931, 4, 0, 1.5, 0.5, 0.5
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
-2.990653, -2.989293, -5.694362,
-2.990653, 3.032553, -5.694362,
-2.990653, -2.989293, 5.356169,
-2.990653, 3.032553, 5.356169,
-2.990653, -2.989293, -5.694362,
-2.990653, -2.989293, 5.356169,
-2.990653, 3.032553, -5.694362,
-2.990653, 3.032553, 5.356169,
-2.990653, -2.989293, -5.694362,
2.969547, -2.989293, -5.694362,
-2.990653, -2.989293, 5.356169,
2.969547, -2.989293, 5.356169,
-2.990653, 3.032553, -5.694362,
2.969547, 3.032553, -5.694362,
-2.990653, 3.032553, 5.356169,
2.969547, 3.032553, 5.356169,
2.969547, -2.989293, -5.694362,
2.969547, 3.032553, -5.694362,
2.969547, -2.989293, 5.356169,
2.969547, 3.032553, 5.356169,
2.969547, -2.989293, -5.694362,
2.969547, -2.989293, 5.356169,
2.969547, 3.032553, -5.694362,
2.969547, 3.032553, 5.356169
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
var radius = 7.435588;
var distance = 33.08177;
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
mvMatrix.translate( 0.01055312, -0.02163029, 0.1690965 );
mvMatrix.scale( 1.348865, 1.335056, 0.7275219 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.08177);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Oxydemeton-Methyl<-read.table("Oxydemeton-Methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Oxydemeton-Methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Oxydemeton' not found
```

```r
y<-Oxydemeton-Methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Oxydemeton' not found
```

```r
z<-Oxydemeton-Methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Oxydemeton' not found
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
-2.903854, 0.3785321, -0.01017802, 0, 0, 1, 1, 1,
-2.842293, -0.1217944, 0.4401509, 1, 0, 0, 1, 1,
-2.831236, -1.223864, -1.955611, 1, 0, 0, 1, 1,
-2.723062, -0.6266385, -4.333624, 1, 0, 0, 1, 1,
-2.702057, -0.9911571, -0.6423971, 1, 0, 0, 1, 1,
-2.690967, 0.05276468, 0.5451314, 1, 0, 0, 1, 1,
-2.687455, -0.9609187, -0.9291992, 0, 0, 0, 1, 1,
-2.510469, -1.523847, -2.078717, 0, 0, 0, 1, 1,
-2.472381, -0.2793556, 1.189159, 0, 0, 0, 1, 1,
-2.451362, -0.2286614, -0.8787176, 0, 0, 0, 1, 1,
-2.415507, -0.6692964, -2.995714, 0, 0, 0, 1, 1,
-2.283059, 1.348469, 0.2488369, 0, 0, 0, 1, 1,
-2.217262, 1.060581, -1.842544, 0, 0, 0, 1, 1,
-2.212965, 0.05069145, -0.6242414, 1, 1, 1, 1, 1,
-2.133334, -0.3175882, -1.155534, 1, 1, 1, 1, 1,
-2.08308, 0.4079675, -0.0920032, 1, 1, 1, 1, 1,
-2.065159, -0.4463223, -0.9194905, 1, 1, 1, 1, 1,
-2.05266, 0.976385, -0.2115948, 1, 1, 1, 1, 1,
-2.031635, -0.08390389, -3.024282, 1, 1, 1, 1, 1,
-2.009076, -0.03971269, -2.067703, 1, 1, 1, 1, 1,
-1.989319, -0.7509909, -0.4582489, 1, 1, 1, 1, 1,
-1.986341, -0.3269974, -2.437898, 1, 1, 1, 1, 1,
-1.97969, -0.6702901, -2.756256, 1, 1, 1, 1, 1,
-1.978514, -1.216173, -2.26974, 1, 1, 1, 1, 1,
-1.959186, -0.8748007, -2.223376, 1, 1, 1, 1, 1,
-1.950236, -0.7372357, -2.33378, 1, 1, 1, 1, 1,
-1.926495, -0.6839306, -0.5472636, 1, 1, 1, 1, 1,
-1.921096, -0.6366744, -1.017333, 1, 1, 1, 1, 1,
-1.916415, 0.6585689, -0.8490189, 0, 0, 1, 1, 1,
-1.897831, 0.9815048, -1.886833, 1, 0, 0, 1, 1,
-1.843419, -0.3568839, -1.63749, 1, 0, 0, 1, 1,
-1.840949, -1.068363, -0.876692, 1, 0, 0, 1, 1,
-1.826056, 0.4447256, -0.7308423, 1, 0, 0, 1, 1,
-1.812126, 0.6062695, -4.130248, 1, 0, 0, 1, 1,
-1.804143, -1.202119, -1.972865, 0, 0, 0, 1, 1,
-1.791337, 0.05533849, -0.651388, 0, 0, 0, 1, 1,
-1.76174, 0.5226407, -1.342446, 0, 0, 0, 1, 1,
-1.735242, -2.013959, -2.493082, 0, 0, 0, 1, 1,
-1.725553, 1.474317, -2.013171, 0, 0, 0, 1, 1,
-1.717224, 1.218251, -1.751047, 0, 0, 0, 1, 1,
-1.712487, 2.039482, -1.934661, 0, 0, 0, 1, 1,
-1.705354, 1.188821, -1.309275, 1, 1, 1, 1, 1,
-1.677393, 0.2559826, 0.495974, 1, 1, 1, 1, 1,
-1.670355, 1.469963, 0.1890853, 1, 1, 1, 1, 1,
-1.652821, -0.4241101, -2.76721, 1, 1, 1, 1, 1,
-1.589036, 0.01497758, 0.2057771, 1, 1, 1, 1, 1,
-1.562728, 0.4527504, -1.417312, 1, 1, 1, 1, 1,
-1.558697, 0.01182699, -2.505642, 1, 1, 1, 1, 1,
-1.555457, 0.8764129, 0.5674032, 1, 1, 1, 1, 1,
-1.55267, -0.1108187, -0.7059715, 1, 1, 1, 1, 1,
-1.52691, -1.131879, -2.424899, 1, 1, 1, 1, 1,
-1.520067, 0.1934868, -1.971453, 1, 1, 1, 1, 1,
-1.514468, -0.04913763, -0.4745967, 1, 1, 1, 1, 1,
-1.512724, -0.7450925, -1.743295, 1, 1, 1, 1, 1,
-1.511894, -0.6356442, -1.934863, 1, 1, 1, 1, 1,
-1.50464, -0.2349633, -1.474295, 1, 1, 1, 1, 1,
-1.502679, 1.374401, -0.3405673, 0, 0, 1, 1, 1,
-1.491498, 1.437875, 0.8922095, 1, 0, 0, 1, 1,
-1.479661, 0.9545242, -1.069638, 1, 0, 0, 1, 1,
-1.46609, -1.32975, -2.606523, 1, 0, 0, 1, 1,
-1.450731, -1.348298, -2.762855, 1, 0, 0, 1, 1,
-1.447813, -1.890707, -0.9440418, 1, 0, 0, 1, 1,
-1.435637, -2.333163, -1.807505, 0, 0, 0, 1, 1,
-1.435209, -2.478755, -0.7458744, 0, 0, 0, 1, 1,
-1.431879, -0.1517459, -2.103458, 0, 0, 0, 1, 1,
-1.419316, -0.8570116, -3.541186, 0, 0, 0, 1, 1,
-1.417938, 1.622018, 0.8485095, 0, 0, 0, 1, 1,
-1.413466, 0.7446588, -1.262249, 0, 0, 0, 1, 1,
-1.402183, -1.688321, -1.877579, 0, 0, 0, 1, 1,
-1.392648, -1.913515, -2.130382, 1, 1, 1, 1, 1,
-1.389609, -0.4834931, -1.61242, 1, 1, 1, 1, 1,
-1.359931, 0.2106645, 0.7667894, 1, 1, 1, 1, 1,
-1.357414, 0.3495009, -1.558836, 1, 1, 1, 1, 1,
-1.352249, 0.5922598, -0.203299, 1, 1, 1, 1, 1,
-1.351455, -0.5768323, -2.167084, 1, 1, 1, 1, 1,
-1.34011, 1.491464, 2.048824, 1, 1, 1, 1, 1,
-1.324132, -0.9744004, -1.774797, 1, 1, 1, 1, 1,
-1.31653, -0.8080406, -0.670657, 1, 1, 1, 1, 1,
-1.310304, 0.7026067, -0.4692174, 1, 1, 1, 1, 1,
-1.304677, 0.9189991, -2.433621, 1, 1, 1, 1, 1,
-1.301882, 0.9183189, -1.07633, 1, 1, 1, 1, 1,
-1.291195, -2.003547, -2.020322, 1, 1, 1, 1, 1,
-1.286193, -0.8767125, -2.018691, 1, 1, 1, 1, 1,
-1.282042, -0.7603445, -2.365956, 1, 1, 1, 1, 1,
-1.273952, -0.8012034, -2.718864, 0, 0, 1, 1, 1,
-1.260104, -0.5505256, -3.825604, 1, 0, 0, 1, 1,
-1.260011, -2.139323, -2.42213, 1, 0, 0, 1, 1,
-1.253292, -0.4636204, -1.68128, 1, 0, 0, 1, 1,
-1.248718, -0.01268288, 0.9792033, 1, 0, 0, 1, 1,
-1.247836, -0.6691799, -1.606563, 1, 0, 0, 1, 1,
-1.233723, 0.6726019, -1.354548, 0, 0, 0, 1, 1,
-1.233463, -0.1154014, 0.04229545, 0, 0, 0, 1, 1,
-1.223372, 0.06302191, -1.10681, 0, 0, 0, 1, 1,
-1.216449, -1.632362, -2.897281, 0, 0, 0, 1, 1,
-1.210618, -0.5348979, -1.225206, 0, 0, 0, 1, 1,
-1.207105, -1.274897, -2.029887, 0, 0, 0, 1, 1,
-1.20503, -0.6817729, -1.484659, 0, 0, 0, 1, 1,
-1.197667, 0.6830781, -1.536607, 1, 1, 1, 1, 1,
-1.190913, 0.6463446, -0.5068384, 1, 1, 1, 1, 1,
-1.182216, -0.4461105, -2.052519, 1, 1, 1, 1, 1,
-1.176023, 1.544682, -1.279314, 1, 1, 1, 1, 1,
-1.173119, -0.3107656, -3.343175, 1, 1, 1, 1, 1,
-1.170236, 1.61608, -1.47694, 1, 1, 1, 1, 1,
-1.167546, -2.030386, -2.833495, 1, 1, 1, 1, 1,
-1.166278, 1.173789, -0.1086315, 1, 1, 1, 1, 1,
-1.157333, -0.7465762, -2.785377, 1, 1, 1, 1, 1,
-1.154394, 1.401501, -0.7621351, 1, 1, 1, 1, 1,
-1.147799, -0.5107469, -1.859978, 1, 1, 1, 1, 1,
-1.142774, 0.125942, 0.09900188, 1, 1, 1, 1, 1,
-1.140653, 0.06750285, -1.329379, 1, 1, 1, 1, 1,
-1.139006, 0.5865164, -2.224906, 1, 1, 1, 1, 1,
-1.13892, -0.4532317, -2.584017, 1, 1, 1, 1, 1,
-1.135805, -0.4172434, -1.465911, 0, 0, 1, 1, 1,
-1.134877, 0.9746299, 0.2728377, 1, 0, 0, 1, 1,
-1.132777, -0.7012066, -2.000362, 1, 0, 0, 1, 1,
-1.130493, 0.1517193, -2.185346, 1, 0, 0, 1, 1,
-1.1237, 0.6661527, -1.070572, 1, 0, 0, 1, 1,
-1.120441, 0.6387947, -0.8608108, 1, 0, 0, 1, 1,
-1.104914, 0.2743119, -1.676932, 0, 0, 0, 1, 1,
-1.102877, 0.8676257, -1.496615, 0, 0, 0, 1, 1,
-1.0994, 0.8766078, 1.924797, 0, 0, 0, 1, 1,
-1.097757, -0.07753798, -2.142476, 0, 0, 0, 1, 1,
-1.09168, 0.1120499, -2.728077, 0, 0, 0, 1, 1,
-1.084252, -0.68702, -2.031617, 0, 0, 0, 1, 1,
-1.082412, -0.3582767, -1.754874, 0, 0, 0, 1, 1,
-1.066769, 0.5397784, -0.4718982, 1, 1, 1, 1, 1,
-1.0656, -0.1585541, -1.386529, 1, 1, 1, 1, 1,
-1.06233, -0.8792824, -3.241826, 1, 1, 1, 1, 1,
-1.058502, -1.908239, -3.590991, 1, 1, 1, 1, 1,
-1.057617, 0.594579, -2.045845, 1, 1, 1, 1, 1,
-1.046654, 1.271898, 0.6376086, 1, 1, 1, 1, 1,
-1.035886, 0.6152334, -3.284181, 1, 1, 1, 1, 1,
-1.035555, -0.3599895, -3.564202, 1, 1, 1, 1, 1,
-1.034234, -0.5938159, -2.565149, 1, 1, 1, 1, 1,
-1.030201, -0.1708908, -2.127972, 1, 1, 1, 1, 1,
-1.022871, 1.158453, -0.8250439, 1, 1, 1, 1, 1,
-1.021584, 0.5849477, -0.3006271, 1, 1, 1, 1, 1,
-1.012558, -1.462619, -3.033781, 1, 1, 1, 1, 1,
-1.001877, -0.9557756, -2.727607, 1, 1, 1, 1, 1,
-0.9998959, 1.017092, -0.1174097, 1, 1, 1, 1, 1,
-0.9998185, -1.058248, -4.264376, 0, 0, 1, 1, 1,
-0.9973409, -0.7990658, -4.257987, 1, 0, 0, 1, 1,
-0.9898528, 0.007983135, 1.101018, 1, 0, 0, 1, 1,
-0.9886748, 0.2021259, -0.8897626, 1, 0, 0, 1, 1,
-0.988535, 0.3979684, -0.2460137, 1, 0, 0, 1, 1,
-0.9871895, 0.6791778, -1.665905, 1, 0, 0, 1, 1,
-0.9871712, 1.448198, -0.242401, 0, 0, 0, 1, 1,
-0.9863176, -1.783145, -2.649906, 0, 0, 0, 1, 1,
-0.9665893, -0.1546603, -0.5781071, 0, 0, 0, 1, 1,
-0.9554005, -0.8265297, 0.3069479, 0, 0, 0, 1, 1,
-0.9507371, 0.7370892, -1.083658, 0, 0, 0, 1, 1,
-0.9490306, 0.1143629, -0.5860191, 0, 0, 0, 1, 1,
-0.9395966, 1.098188, -1.510269, 0, 0, 0, 1, 1,
-0.9389602, -0.7550406, -2.85165, 1, 1, 1, 1, 1,
-0.9359443, 0.6721991, -0.34455, 1, 1, 1, 1, 1,
-0.9341686, -1.661905, -1.759607, 1, 1, 1, 1, 1,
-0.9338202, 1.391194, -0.4820324, 1, 1, 1, 1, 1,
-0.9321194, -1.680978, -3.880782, 1, 1, 1, 1, 1,
-0.9193379, -0.381413, -1.372459, 1, 1, 1, 1, 1,
-0.9186806, 1.147797, -2.558503, 1, 1, 1, 1, 1,
-0.9138347, -0.4204008, -1.406898, 1, 1, 1, 1, 1,
-0.9112861, -0.1352665, 1.002901, 1, 1, 1, 1, 1,
-0.9103711, 0.4996414, -1.289955, 1, 1, 1, 1, 1,
-0.9100183, -1.654494, -1.983231, 1, 1, 1, 1, 1,
-0.9043658, -0.5870122, -2.085634, 1, 1, 1, 1, 1,
-0.8901373, 0.6622015, -0.8232576, 1, 1, 1, 1, 1,
-0.8893498, 0.01193143, -2.197342, 1, 1, 1, 1, 1,
-0.8845342, -0.2333935, -2.763885, 1, 1, 1, 1, 1,
-0.8838779, -0.1169829, -1.224863, 0, 0, 1, 1, 1,
-0.8780393, 0.779014, 0.07478967, 1, 0, 0, 1, 1,
-0.8701825, -1.232725, -0.5824394, 1, 0, 0, 1, 1,
-0.8663591, -0.6225095, -1.54435, 1, 0, 0, 1, 1,
-0.8568314, -0.02479482, -2.227016, 1, 0, 0, 1, 1,
-0.8563256, -0.9830195, -0.6089844, 1, 0, 0, 1, 1,
-0.8557293, -0.04341588, -2.430546, 0, 0, 0, 1, 1,
-0.8552828, 0.1942028, -2.013552, 0, 0, 0, 1, 1,
-0.8551177, 0.4336263, -0.3599915, 0, 0, 0, 1, 1,
-0.8536666, 2.464814, -1.185257, 0, 0, 0, 1, 1,
-0.8503851, 0.5329733, -0.09212872, 0, 0, 0, 1, 1,
-0.8489636, -0.3444463, -2.374908, 0, 0, 0, 1, 1,
-0.8337181, -0.2410187, -1.551383, 0, 0, 0, 1, 1,
-0.833541, -1.128202, -2.61936, 1, 1, 1, 1, 1,
-0.8268347, -0.1230605, -1.054036, 1, 1, 1, 1, 1,
-0.8268192, -1.034779, -4.032074, 1, 1, 1, 1, 1,
-0.8245338, 0.08291408, -1.944183, 1, 1, 1, 1, 1,
-0.8187594, -1.085003, -2.568372, 1, 1, 1, 1, 1,
-0.8183147, 0.3741123, 0.2641216, 1, 1, 1, 1, 1,
-0.8181211, 1.435541, 0.8217998, 1, 1, 1, 1, 1,
-0.8123642, 0.4632162, -0.5119744, 1, 1, 1, 1, 1,
-0.8103008, 0.8762638, -1.923424, 1, 1, 1, 1, 1,
-0.8092561, -0.01987206, -2.668143, 1, 1, 1, 1, 1,
-0.804942, -0.5197918, -1.906326, 1, 1, 1, 1, 1,
-0.7964774, 0.1570444, -1.882433, 1, 1, 1, 1, 1,
-0.7959323, 0.427503, -1.971415, 1, 1, 1, 1, 1,
-0.7895709, 0.3266107, -1.573488, 1, 1, 1, 1, 1,
-0.7869037, -2.04837, -3.591952, 1, 1, 1, 1, 1,
-0.7840365, -1.163789, -1.821962, 0, 0, 1, 1, 1,
-0.7829372, -0.5895673, -2.93629, 1, 0, 0, 1, 1,
-0.7817457, 0.9729873, -1.511684, 1, 0, 0, 1, 1,
-0.7808552, 0.9576912, 0.4938257, 1, 0, 0, 1, 1,
-0.7725747, -0.5089931, -2.372883, 1, 0, 0, 1, 1,
-0.7719934, -0.5378973, -3.272707, 1, 0, 0, 1, 1,
-0.7689647, 1.030599, 0.4591081, 0, 0, 0, 1, 1,
-0.7650898, -0.811635, -3.215629, 0, 0, 0, 1, 1,
-0.7609049, 0.3444072, -1.05227, 0, 0, 0, 1, 1,
-0.7604324, -0.2764665, -1.699808, 0, 0, 0, 1, 1,
-0.7595353, -0.09182908, -2.288479, 0, 0, 0, 1, 1,
-0.7516678, -0.7337183, -0.8682792, 0, 0, 0, 1, 1,
-0.7472246, 0.166852, -0.5915461, 0, 0, 0, 1, 1,
-0.7464337, -0.7641047, -2.325082, 1, 1, 1, 1, 1,
-0.7442923, 0.4904254, -1.951489, 1, 1, 1, 1, 1,
-0.7431232, 1.804075, 0.4930345, 1, 1, 1, 1, 1,
-0.742959, 2.249689, -1.288115, 1, 1, 1, 1, 1,
-0.7424374, -0.01717131, -1.389572, 1, 1, 1, 1, 1,
-0.7387447, -1.059304, -3.610585, 1, 1, 1, 1, 1,
-0.7349813, -0.5906919, -1.626761, 1, 1, 1, 1, 1,
-0.7198304, 2.003137, -2.603903, 1, 1, 1, 1, 1,
-0.715529, -0.2121845, -1.173053, 1, 1, 1, 1, 1,
-0.7122084, 1.486854, 0.6289988, 1, 1, 1, 1, 1,
-0.7121987, -1.712337, -1.954054, 1, 1, 1, 1, 1,
-0.7104898, -2.202644, -1.979275, 1, 1, 1, 1, 1,
-0.7073265, -0.3183779, -3.017547, 1, 1, 1, 1, 1,
-0.7071517, 1.72727, -0.3022722, 1, 1, 1, 1, 1,
-0.7064256, 0.5957514, -2.252439, 1, 1, 1, 1, 1,
-0.7063419, -0.9263349, -1.089723, 0, 0, 1, 1, 1,
-0.7063207, 1.047912, -1.472692, 1, 0, 0, 1, 1,
-0.7062994, -0.364899, -2.307777, 1, 0, 0, 1, 1,
-0.6974682, -0.6820853, -1.90412, 1, 0, 0, 1, 1,
-0.6974149, 0.9351923, -0.7191844, 1, 0, 0, 1, 1,
-0.6940246, 0.02229097, -2.830001, 1, 0, 0, 1, 1,
-0.6851329, -0.4848038, -1.049968, 0, 0, 0, 1, 1,
-0.6835142, -0.3474772, -1.908151, 0, 0, 0, 1, 1,
-0.6744831, -0.1256189, -2.834371, 0, 0, 0, 1, 1,
-0.6727458, -0.8129989, -3.207751, 0, 0, 0, 1, 1,
-0.6700962, -0.4518274, -3.157151, 0, 0, 0, 1, 1,
-0.6686864, 0.8061222, -1.376004, 0, 0, 0, 1, 1,
-0.6631326, -0.7694628, -3.082187, 0, 0, 0, 1, 1,
-0.6624462, -1.868098, -4.478595, 1, 1, 1, 1, 1,
-0.6612653, 0.09616095, -0.880383, 1, 1, 1, 1, 1,
-0.6567445, 1.276669, 0.9169984, 1, 1, 1, 1, 1,
-0.652692, 1.410908, -1.3492, 1, 1, 1, 1, 1,
-0.6522729, -1.47282, -1.209698, 1, 1, 1, 1, 1,
-0.6510193, -0.04599959, -4.603921, 1, 1, 1, 1, 1,
-0.6501586, 0.1198608, -2.266348, 1, 1, 1, 1, 1,
-0.650045, 1.559871, -1.379317, 1, 1, 1, 1, 1,
-0.6451194, 0.3626603, -1.828538, 1, 1, 1, 1, 1,
-0.6367707, -2.787438, -2.960119, 1, 1, 1, 1, 1,
-0.63094, -0.6484827, -3.271757, 1, 1, 1, 1, 1,
-0.6298971, 0.03013256, -2.87503, 1, 1, 1, 1, 1,
-0.6290286, 1.427874, -1.126675, 1, 1, 1, 1, 1,
-0.6287606, -0.2009243, -1.602473, 1, 1, 1, 1, 1,
-0.6287206, 1.037642, -0.1393453, 1, 1, 1, 1, 1,
-0.6278851, -1.438801, -3.442265, 0, 0, 1, 1, 1,
-0.6271137, -0.3459229, -2.243869, 1, 0, 0, 1, 1,
-0.6268105, 0.5336927, -0.2557835, 1, 0, 0, 1, 1,
-0.6267698, 1.239104, 0.5518631, 1, 0, 0, 1, 1,
-0.6265802, -0.1365107, -0.9984685, 1, 0, 0, 1, 1,
-0.6260384, 0.5393165, -0.5731722, 1, 0, 0, 1, 1,
-0.622089, -0.6950108, -1.683463, 0, 0, 0, 1, 1,
-0.6189582, -0.1144462, 0.115786, 0, 0, 0, 1, 1,
-0.6125259, 0.5021244, -0.3927975, 0, 0, 0, 1, 1,
-0.6123543, -0.4456959, -0.4683405, 0, 0, 0, 1, 1,
-0.6099243, -0.1198635, -2.44225, 0, 0, 0, 1, 1,
-0.609763, -0.84356, -2.255482, 0, 0, 0, 1, 1,
-0.6068809, 1.34743, -0.1013466, 0, 0, 0, 1, 1,
-0.6067328, 1.489948, 0.4915982, 1, 1, 1, 1, 1,
-0.6037101, 0.219567, -2.478336, 1, 1, 1, 1, 1,
-0.5988705, -1.460248, -3.65106, 1, 1, 1, 1, 1,
-0.5943325, 0.378257, -1.308124, 1, 1, 1, 1, 1,
-0.5929242, -0.8986944, -3.670943, 1, 1, 1, 1, 1,
-0.5842822, 0.6294319, -2.28554, 1, 1, 1, 1, 1,
-0.5746742, -1.658796, -3.377516, 1, 1, 1, 1, 1,
-0.5742596, -1.801211, -4.892032, 1, 1, 1, 1, 1,
-0.5712669, 0.6497509, 0.2226494, 1, 1, 1, 1, 1,
-0.5704286, -1.17198, -1.704365, 1, 1, 1, 1, 1,
-0.5699167, 1.337918, -0.1997515, 1, 1, 1, 1, 1,
-0.5605189, -0.01878752, -0.1925688, 1, 1, 1, 1, 1,
-0.5504295, 1.798851, 1.008885, 1, 1, 1, 1, 1,
-0.5492325, 1.387926, -0.7807096, 1, 1, 1, 1, 1,
-0.5460545, -0.0153757, -1.420798, 1, 1, 1, 1, 1,
-0.5436357, -1.235628, -2.997828, 0, 0, 1, 1, 1,
-0.5430823, -0.8209217, -2.851741, 1, 0, 0, 1, 1,
-0.540438, -0.1193403, -1.272348, 1, 0, 0, 1, 1,
-0.5332842, 0.1821726, -0.1037657, 1, 0, 0, 1, 1,
-0.5282319, -1.387339, -3.01277, 1, 0, 0, 1, 1,
-0.518434, 0.1543572, -2.514215, 1, 0, 0, 1, 1,
-0.5181584, -0.1952804, -2.001643, 0, 0, 0, 1, 1,
-0.5167637, -0.1012894, -0.8921283, 0, 0, 0, 1, 1,
-0.5154819, 1.489373, -0.9195074, 0, 0, 0, 1, 1,
-0.5122359, 0.0800773, -2.328271, 0, 0, 0, 1, 1,
-0.5083584, -0.9035137, -1.457197, 0, 0, 0, 1, 1,
-0.5078616, 0.1516353, 0.07190404, 0, 0, 0, 1, 1,
-0.5075154, 0.7763417, -2.607048, 0, 0, 0, 1, 1,
-0.4963824, -0.9676176, -2.4847, 1, 1, 1, 1, 1,
-0.4945835, -0.08303917, -1.250977, 1, 1, 1, 1, 1,
-0.4907115, 0.2359565, -1.058179, 1, 1, 1, 1, 1,
-0.4889499, 1.046828, -1.284204, 1, 1, 1, 1, 1,
-0.4863239, 1.62653, 0.1898732, 1, 1, 1, 1, 1,
-0.4829663, -0.1185412, -2.155926, 1, 1, 1, 1, 1,
-0.4766048, -0.5045593, -3.119189, 1, 1, 1, 1, 1,
-0.4745988, -0.8645778, -3.122544, 1, 1, 1, 1, 1,
-0.4733948, -1.0495, -0.3976199, 1, 1, 1, 1, 1,
-0.4728831, -1.515471, -2.461269, 1, 1, 1, 1, 1,
-0.4700277, -1.021886, -1.440112, 1, 1, 1, 1, 1,
-0.4657642, 0.2188497, -0.04628669, 1, 1, 1, 1, 1,
-0.46367, -0.2697484, -1.63086, 1, 1, 1, 1, 1,
-0.4629432, 0.4834746, -2.213089, 1, 1, 1, 1, 1,
-0.4557003, 0.3708259, -1.13656, 1, 1, 1, 1, 1,
-0.4551437, 1.149369, -0.2811092, 0, 0, 1, 1, 1,
-0.4498245, 0.1912458, -0.1205909, 1, 0, 0, 1, 1,
-0.4486387, 0.7243445, -1.787297, 1, 0, 0, 1, 1,
-0.4415413, -1.69711, -2.818827, 1, 0, 0, 1, 1,
-0.4407772, 0.4819785, -1.393906, 1, 0, 0, 1, 1,
-0.4368631, -0.5107428, -0.1887948, 1, 0, 0, 1, 1,
-0.435565, -0.9186437, -1.769505, 0, 0, 0, 1, 1,
-0.4342007, -0.7286756, -2.615656, 0, 0, 0, 1, 1,
-0.430226, 0.7599455, -0.09270674, 0, 0, 0, 1, 1,
-0.4248912, 0.1611381, -0.451739, 0, 0, 0, 1, 1,
-0.4247797, 2.601017, -0.5977921, 0, 0, 0, 1, 1,
-0.4243488, 1.54161, -0.6477687, 0, 0, 0, 1, 1,
-0.421137, 0.5430066, -1.856686, 0, 0, 0, 1, 1,
-0.4191717, 0.4143225, -0.4537445, 1, 1, 1, 1, 1,
-0.4184185, 0.230364, -1.481624, 1, 1, 1, 1, 1,
-0.4137035, -1.268524, -3.274405, 1, 1, 1, 1, 1,
-0.4127768, -1.389797, -2.733829, 1, 1, 1, 1, 1,
-0.4084635, -1.865202, -3.568108, 1, 1, 1, 1, 1,
-0.4042834, 0.6617358, -1.23549, 1, 1, 1, 1, 1,
-0.4040073, 0.6971062, 0.904053, 1, 1, 1, 1, 1,
-0.4030815, -2.469158, -2.280669, 1, 1, 1, 1, 1,
-0.3943297, 1.137231, 0.4803302, 1, 1, 1, 1, 1,
-0.3942052, -0.2034015, -1.841202, 1, 1, 1, 1, 1,
-0.3935561, 0.4590277, 0.5752019, 1, 1, 1, 1, 1,
-0.3900206, -0.3355119, -2.708583, 1, 1, 1, 1, 1,
-0.3883794, -0.06881163, -3.235571, 1, 1, 1, 1, 1,
-0.3883349, 0.005628548, -2.061103, 1, 1, 1, 1, 1,
-0.3877239, -1.207681, -1.358387, 1, 1, 1, 1, 1,
-0.3855751, -1.128388, -5.533432, 0, 0, 1, 1, 1,
-0.3852781, 0.3459097, -1.674343, 1, 0, 0, 1, 1,
-0.3819735, 0.9198002, -0.5268085, 1, 0, 0, 1, 1,
-0.3802908, 0.7554423, -0.3720315, 1, 0, 0, 1, 1,
-0.3794742, -1.425757, -3.885235, 1, 0, 0, 1, 1,
-0.3724982, -0.3198425, -0.5549864, 1, 0, 0, 1, 1,
-0.368067, 0.6588419, -1.173232, 0, 0, 0, 1, 1,
-0.3668723, 0.1844173, -1.491141, 0, 0, 0, 1, 1,
-0.3633943, 0.5577173, -1.585352, 0, 0, 0, 1, 1,
-0.3560264, -1.002212, -3.147644, 0, 0, 0, 1, 1,
-0.3554713, 0.3426503, -2.948025, 0, 0, 0, 1, 1,
-0.3545664, -0.1186982, -1.247155, 0, 0, 0, 1, 1,
-0.3545502, 0.778678, 1.068585, 0, 0, 0, 1, 1,
-0.3511342, 2.604432, 0.653492, 1, 1, 1, 1, 1,
-0.3485036, 1.538208, 0.281396, 1, 1, 1, 1, 1,
-0.3482045, -0.2910825, -4.510756, 1, 1, 1, 1, 1,
-0.3468224, -0.1247611, -1.174902, 1, 1, 1, 1, 1,
-0.3450559, 0.6709229, -1.378344, 1, 1, 1, 1, 1,
-0.3443055, -0.3980075, -2.505231, 1, 1, 1, 1, 1,
-0.3400964, -0.9354464, -2.785539, 1, 1, 1, 1, 1,
-0.3363703, -0.8626215, -2.857177, 1, 1, 1, 1, 1,
-0.3328425, -0.02014285, -0.3289883, 1, 1, 1, 1, 1,
-0.331317, 0.3290181, -3.044785, 1, 1, 1, 1, 1,
-0.3289431, 0.9220474, 1.689367, 1, 1, 1, 1, 1,
-0.3287325, -0.4971502, -4.656728, 1, 1, 1, 1, 1,
-0.3282098, 0.5177398, 2.020454, 1, 1, 1, 1, 1,
-0.3235515, -0.4266772, -1.531193, 1, 1, 1, 1, 1,
-0.3181222, -0.4301957, -3.069552, 1, 1, 1, 1, 1,
-0.3178159, -0.7334008, -2.177083, 0, 0, 1, 1, 1,
-0.3145122, 0.126766, 0.9061252, 1, 0, 0, 1, 1,
-0.3080084, -0.4488266, -2.810625, 1, 0, 0, 1, 1,
-0.3073443, 1.244302, -0.3726943, 1, 0, 0, 1, 1,
-0.306231, 0.07559986, -0.5647278, 1, 0, 0, 1, 1,
-0.3060231, 0.2860207, 0.1335437, 1, 0, 0, 1, 1,
-0.3054789, -0.3804644, -0.978283, 0, 0, 0, 1, 1,
-0.3049212, -1.186882, -2.797113, 0, 0, 0, 1, 1,
-0.3048613, -0.04185393, -2.645532, 0, 0, 0, 1, 1,
-0.3035544, -0.005703249, -2.989246, 0, 0, 0, 1, 1,
-0.3034975, 0.2850765, -2.759363, 0, 0, 0, 1, 1,
-0.3017626, -0.1828056, -4.027558, 0, 0, 0, 1, 1,
-0.2970542, 0.6320719, 0.4827786, 0, 0, 0, 1, 1,
-0.296592, 0.1568408, -1.97797, 1, 1, 1, 1, 1,
-0.2943682, 0.7749051, 0.4090672, 1, 1, 1, 1, 1,
-0.292959, -0.04637938, -1.954971, 1, 1, 1, 1, 1,
-0.2921323, -0.7138074, -2.269591, 1, 1, 1, 1, 1,
-0.2875447, 0.458368, -1.799834, 1, 1, 1, 1, 1,
-0.2860923, 0.1994036, -0.7647178, 1, 1, 1, 1, 1,
-0.2855847, 0.1120888, -0.9820687, 1, 1, 1, 1, 1,
-0.2828898, -0.5830883, -4.645382, 1, 1, 1, 1, 1,
-0.2812788, 0.1400425, -2.096886, 1, 1, 1, 1, 1,
-0.278125, 0.3772025, -1.557184, 1, 1, 1, 1, 1,
-0.2742194, -0.6021124, -3.15631, 1, 1, 1, 1, 1,
-0.2720804, -0.3371539, -2.394506, 1, 1, 1, 1, 1,
-0.2654412, -0.5131303, -3.306904, 1, 1, 1, 1, 1,
-0.262889, -0.7063522, -1.379161, 1, 1, 1, 1, 1,
-0.2622884, -0.03856152, -0.644356, 1, 1, 1, 1, 1,
-0.2568606, 0.09018123, -2.362595, 0, 0, 1, 1, 1,
-0.2539185, 1.987184, -1.682474, 1, 0, 0, 1, 1,
-0.2510084, -1.300374, -2.240734, 1, 0, 0, 1, 1,
-0.2493167, -1.041752, -1.488622, 1, 0, 0, 1, 1,
-0.2464514, -0.878378, -3.882617, 1, 0, 0, 1, 1,
-0.2453919, 0.2879303, -0.1329755, 1, 0, 0, 1, 1,
-0.2425262, 2.667302, 2.263528, 0, 0, 0, 1, 1,
-0.2414573, -1.964654, -3.169527, 0, 0, 0, 1, 1,
-0.2408229, 1.227447, -1.226157, 0, 0, 0, 1, 1,
-0.2360139, 0.795505, -0.8644498, 0, 0, 0, 1, 1,
-0.2357686, 0.3805986, 1.775468, 0, 0, 0, 1, 1,
-0.2318002, 0.9878616, 1.114371, 0, 0, 0, 1, 1,
-0.2312193, 1.232082, 0.4319674, 0, 0, 0, 1, 1,
-0.22222, -1.088781, -2.518161, 1, 1, 1, 1, 1,
-0.2201069, 1.853972, -1.060398, 1, 1, 1, 1, 1,
-0.2172513, 0.0966012, 0.03123932, 1, 1, 1, 1, 1,
-0.216149, 0.1757002, -2.307416, 1, 1, 1, 1, 1,
-0.213018, -2.002801, -4.803518, 1, 1, 1, 1, 1,
-0.2119504, 0.4639744, -0.5910353, 1, 1, 1, 1, 1,
-0.2071958, 0.1108375, 0.4586267, 1, 1, 1, 1, 1,
-0.2019481, -1.064451, -2.615499, 1, 1, 1, 1, 1,
-0.2010854, -1.779614, -0.5857543, 1, 1, 1, 1, 1,
-0.2005397, 0.5625293, 1.557051, 1, 1, 1, 1, 1,
-0.1979559, -1.706859, -2.634169, 1, 1, 1, 1, 1,
-0.1951097, -0.1264496, -3.013982, 1, 1, 1, 1, 1,
-0.1943371, 1.728173, -0.0291446, 1, 1, 1, 1, 1,
-0.1936403, 0.8642742, -1.482116, 1, 1, 1, 1, 1,
-0.1929159, 0.6190886, -0.8168904, 1, 1, 1, 1, 1,
-0.1927288, 1.1694, -1.500171, 0, 0, 1, 1, 1,
-0.1913573, -0.6193409, -2.174264, 1, 0, 0, 1, 1,
-0.1883595, -0.1352215, -2.379356, 1, 0, 0, 1, 1,
-0.1852609, -0.5399134, -2.069825, 1, 0, 0, 1, 1,
-0.1838045, 0.1180957, -0.5247855, 1, 0, 0, 1, 1,
-0.1797061, -1.821867, -3.306992, 1, 0, 0, 1, 1,
-0.1792471, -0.2672859, -4.609606, 0, 0, 0, 1, 1,
-0.1765986, 1.4017, -0.837476, 0, 0, 0, 1, 1,
-0.1753203, 0.4405281, 0.4059048, 0, 0, 0, 1, 1,
-0.1742312, -0.5972899, -3.285614, 0, 0, 0, 1, 1,
-0.1728631, 1.617328, 0.1804701, 0, 0, 0, 1, 1,
-0.169533, -0.6442115, -2.258065, 0, 0, 0, 1, 1,
-0.1695293, -2.688783, -4.012098, 0, 0, 0, 1, 1,
-0.1685989, -0.4220123, -2.264663, 1, 1, 1, 1, 1,
-0.1685545, -0.7331204, -3.867255, 1, 1, 1, 1, 1,
-0.1678121, 0.8696176, -0.06420289, 1, 1, 1, 1, 1,
-0.1651593, -1.794681, -2.387211, 1, 1, 1, 1, 1,
-0.1562166, -0.3891716, -2.979638, 1, 1, 1, 1, 1,
-0.1545887, -0.344302, 0.1047341, 1, 1, 1, 1, 1,
-0.1507938, -0.7911301, -5.039591, 1, 1, 1, 1, 1,
-0.1494755, -0.5202411, -1.308888, 1, 1, 1, 1, 1,
-0.1493823, 0.59408, 0.5359712, 1, 1, 1, 1, 1,
-0.142709, 0.3081414, -0.2278866, 1, 1, 1, 1, 1,
-0.1316231, 0.7014751, -0.1314526, 1, 1, 1, 1, 1,
-0.1299878, -1.673209, -2.527765, 1, 1, 1, 1, 1,
-0.129389, -0.8633348, -2.950895, 1, 1, 1, 1, 1,
-0.1225221, -0.1593887, -3.650608, 1, 1, 1, 1, 1,
-0.1151693, 0.4171195, 0.5970587, 1, 1, 1, 1, 1,
-0.1141725, 1.206012, -1.066061, 0, 0, 1, 1, 1,
-0.1115105, 0.5632672, -0.5787061, 1, 0, 0, 1, 1,
-0.1101408, 1.142437, 1.287791, 1, 0, 0, 1, 1,
-0.1091281, -1.1753, -4.500387, 1, 0, 0, 1, 1,
-0.1049148, 0.09676126, -0.911699, 1, 0, 0, 1, 1,
-0.1039698, -1.715047, -4.714746, 1, 0, 0, 1, 1,
-0.1020616, -0.029049, -1.734929, 0, 0, 0, 1, 1,
-0.1015724, 0.2223248, -1.748527, 0, 0, 0, 1, 1,
-0.1000911, 0.3719556, -1.013228, 0, 0, 0, 1, 1,
-0.09892495, 1.485903, 0.9272143, 0, 0, 0, 1, 1,
-0.09748133, 0.2975056, 1.002782, 0, 0, 0, 1, 1,
-0.08956419, -1.043537, -2.510116, 0, 0, 0, 1, 1,
-0.08364044, 1.539018, -0.8453592, 0, 0, 0, 1, 1,
-0.07989832, 0.4979123, -0.1408487, 1, 1, 1, 1, 1,
-0.07807186, -0.4745101, -2.034367, 1, 1, 1, 1, 1,
-0.07659265, 1.849207, 1.081324, 1, 1, 1, 1, 1,
-0.07640314, 1.137867, 0.135266, 1, 1, 1, 1, 1,
-0.0758054, 0.9018916, 1.083547, 1, 1, 1, 1, 1,
-0.07314314, 0.5743141, 0.2785297, 1, 1, 1, 1, 1,
-0.06925372, -1.550822, -2.023803, 1, 1, 1, 1, 1,
-0.06855544, 0.1958667, -0.4151588, 1, 1, 1, 1, 1,
-0.0672631, 2.78932, 0.1697501, 1, 1, 1, 1, 1,
-0.06512947, -1.336335, -3.621322, 1, 1, 1, 1, 1,
-0.06386649, 2.197833, 1.373141, 1, 1, 1, 1, 1,
-0.05871227, -1.803611, -4.190543, 1, 1, 1, 1, 1,
-0.0500628, -0.6444442, -3.222012, 1, 1, 1, 1, 1,
-0.04692756, -1.272271, -1.823802, 1, 1, 1, 1, 1,
-0.04520719, -0.6107509, -2.027495, 1, 1, 1, 1, 1,
-0.04501937, -0.5262014, -4.574049, 0, 0, 1, 1, 1,
-0.04245422, 0.7839436, -1.463762, 1, 0, 0, 1, 1,
-0.03978069, 0.978399, 0.1166855, 1, 0, 0, 1, 1,
-0.03903428, 1.323159, -0.4623809, 1, 0, 0, 1, 1,
-0.0363322, -0.4575137, -2.020007, 1, 0, 0, 1, 1,
-0.03438935, -0.7634699, -4.25456, 1, 0, 0, 1, 1,
-0.03430665, 0.7194568, 0.722961, 0, 0, 0, 1, 1,
-0.0327682, 0.5625483, 0.2456048, 0, 0, 0, 1, 1,
-0.03156113, 1.58884, -0.2729844, 0, 0, 0, 1, 1,
-0.03066049, 0.6063607, 0.6031358, 0, 0, 0, 1, 1,
-0.02942721, -1.174211, -2.29856, 0, 0, 0, 1, 1,
-0.02902306, -0.4219373, -3.858787, 0, 0, 0, 1, 1,
-0.02792898, 1.624434, -0.1388874, 0, 0, 0, 1, 1,
-0.02514617, 0.1342914, -0.9100169, 1, 1, 1, 1, 1,
-0.02411009, -0.06380403, -3.104057, 1, 1, 1, 1, 1,
-0.02085636, -0.2704099, -2.70866, 1, 1, 1, 1, 1,
-0.01930786, -0.7199725, -2.829994, 1, 1, 1, 1, 1,
-0.01930666, -0.2409116, -1.533835, 1, 1, 1, 1, 1,
-0.01717085, 0.3231709, -0.2368611, 1, 1, 1, 1, 1,
-0.0130001, -0.7770922, -2.997138, 1, 1, 1, 1, 1,
-0.01260611, -0.7883072, -4.053145, 1, 1, 1, 1, 1,
-0.008851285, 1.929508, 0.3615154, 1, 1, 1, 1, 1,
-0.007718531, -1.211926, -2.994768, 1, 1, 1, 1, 1,
-0.0007375091, -0.3015007, -4.603918, 1, 1, 1, 1, 1,
0.0004632263, 0.01598483, 0.8886789, 1, 1, 1, 1, 1,
0.0006015144, -0.7489443, 3.267241, 1, 1, 1, 1, 1,
0.003476949, 1.817361, 0.4106209, 1, 1, 1, 1, 1,
0.003734938, -0.6249373, 4.474844, 1, 1, 1, 1, 1,
0.007677199, 0.034738, -0.004252102, 0, 0, 1, 1, 1,
0.01159362, -0.2866378, 2.831864, 1, 0, 0, 1, 1,
0.01620698, -1.498772, 4.736133, 1, 0, 0, 1, 1,
0.01724484, -0.3712383, 2.100797, 1, 0, 0, 1, 1,
0.0176414, -0.1474223, 3.911301, 1, 0, 0, 1, 1,
0.01938538, -0.9418701, 4.922644, 1, 0, 0, 1, 1,
0.02170911, -0.2531283, 1.57291, 0, 0, 0, 1, 1,
0.03900382, 1.275971, 1.152676, 0, 0, 0, 1, 1,
0.0398019, -0.8691776, 2.05106, 0, 0, 0, 1, 1,
0.04661417, 0.07617237, -0.03342026, 0, 0, 0, 1, 1,
0.04746621, 0.6441463, -0.9463152, 0, 0, 0, 1, 1,
0.04963284, 0.824747, -0.5858204, 0, 0, 0, 1, 1,
0.05145624, 0.4630038, -1.405143, 0, 0, 0, 1, 1,
0.05588193, 1.75432, -0.07880781, 1, 1, 1, 1, 1,
0.05715962, -1.041341, 3.809362, 1, 1, 1, 1, 1,
0.0607809, -0.7063785, 3.056062, 1, 1, 1, 1, 1,
0.06164602, -0.2177495, 2.354863, 1, 1, 1, 1, 1,
0.06491686, -0.4445688, 2.091149, 1, 1, 1, 1, 1,
0.06496778, 0.1893246, 0.3776764, 1, 1, 1, 1, 1,
0.06890015, 0.542343, -0.0775158, 1, 1, 1, 1, 1,
0.0743783, -2.501103, 2.758744, 1, 1, 1, 1, 1,
0.07483883, -0.03397957, 2.69309, 1, 1, 1, 1, 1,
0.07806993, 0.1608272, -0.7881936, 1, 1, 1, 1, 1,
0.07913984, -1.618935, 1.688362, 1, 1, 1, 1, 1,
0.08015853, 0.742359, 0.8806643, 1, 1, 1, 1, 1,
0.08242434, -0.6385757, 1.684022, 1, 1, 1, 1, 1,
0.08351082, 1.283668, 0.2184981, 1, 1, 1, 1, 1,
0.08387478, -1.246215, 2.278913, 1, 1, 1, 1, 1,
0.0861157, -0.9875816, 3.871711, 0, 0, 1, 1, 1,
0.08978165, -1.053963, 2.902272, 1, 0, 0, 1, 1,
0.09095893, -0.8970727, 0.9688846, 1, 0, 0, 1, 1,
0.09238338, -1.708853, 0.2749151, 1, 0, 0, 1, 1,
0.09295365, -0.1060758, 1.534324, 1, 0, 0, 1, 1,
0.09392095, 0.4138778, 0.9979147, 1, 0, 0, 1, 1,
0.09531508, 0.6606303, 1.371684, 0, 0, 0, 1, 1,
0.09680653, -0.004924752, 2.065174, 0, 0, 0, 1, 1,
0.09721508, -0.8096825, 2.991217, 0, 0, 0, 1, 1,
0.0983253, 0.8983999, 0.390714, 0, 0, 0, 1, 1,
0.09961841, -0.904138, 1.253419, 0, 0, 0, 1, 1,
0.1101765, -0.9898642, 3.80889, 0, 0, 0, 1, 1,
0.1161164, 1.23878, 0.2676886, 0, 0, 0, 1, 1,
0.1186773, -2.012293, 2.390142, 1, 1, 1, 1, 1,
0.1247613, 1.112698, -1.709298, 1, 1, 1, 1, 1,
0.1348948, -1.460273, 3.3585, 1, 1, 1, 1, 1,
0.134943, -0.1174535, 3.038619, 1, 1, 1, 1, 1,
0.1382094, 1.495326, 1.435856, 1, 1, 1, 1, 1,
0.1451534, 0.7098888, 0.772723, 1, 1, 1, 1, 1,
0.1463718, 0.3322925, 0.962165, 1, 1, 1, 1, 1,
0.1470936, -0.1358503, 2.700721, 1, 1, 1, 1, 1,
0.1471749, 0.4825152, 0.9799345, 1, 1, 1, 1, 1,
0.1475286, 0.3811149, 0.6996329, 1, 1, 1, 1, 1,
0.1491416, -2.326081, 2.514796, 1, 1, 1, 1, 1,
0.1546965, -1.203132, 3.281703, 1, 1, 1, 1, 1,
0.1564777, 0.02332803, 1.730117, 1, 1, 1, 1, 1,
0.1589266, -0.1574773, 2.57255, 1, 1, 1, 1, 1,
0.159093, 0.6899528, -1.100542, 1, 1, 1, 1, 1,
0.1611404, 0.5592197, -0.6270049, 0, 0, 1, 1, 1,
0.165888, 0.5652146, 0.6290328, 1, 0, 0, 1, 1,
0.1701817, -0.7460379, 3.288973, 1, 0, 0, 1, 1,
0.172342, 2.521938, 1.303273, 1, 0, 0, 1, 1,
0.1728471, 0.5943099, 0.5766891, 1, 0, 0, 1, 1,
0.1737769, 0.2702756, 0.2186616, 1, 0, 0, 1, 1,
0.1751674, 0.3992158, -0.9706887, 0, 0, 0, 1, 1,
0.175511, 0.2492173, 1.220587, 0, 0, 0, 1, 1,
0.1796685, 0.6712109, 0.6631906, 0, 0, 0, 1, 1,
0.180728, 0.2066269, 1.19779, 0, 0, 0, 1, 1,
0.1889393, 0.03998613, 1.976361, 0, 0, 0, 1, 1,
0.1928239, 0.2868117, -0.1861246, 0, 0, 0, 1, 1,
0.1932525, -0.1597774, 3.104096, 0, 0, 0, 1, 1,
0.1954997, -0.7608222, 1.899502, 1, 1, 1, 1, 1,
0.1983369, 0.03320227, 1.074248, 1, 1, 1, 1, 1,
0.1992811, -2.081418, 5.195239, 1, 1, 1, 1, 1,
0.199694, 0.9411452, -0.4060485, 1, 1, 1, 1, 1,
0.1998315, -0.583847, 2.452838, 1, 1, 1, 1, 1,
0.202571, 0.4056652, -0.03363985, 1, 1, 1, 1, 1,
0.2039752, -0.7650079, 3.698053, 1, 1, 1, 1, 1,
0.2065163, -0.2641303, 2.752889, 1, 1, 1, 1, 1,
0.2070722, 0.7868042, 0.9249359, 1, 1, 1, 1, 1,
0.2140675, 1.054208, -1.322, 1, 1, 1, 1, 1,
0.2170213, -0.04899439, 3.796933, 1, 1, 1, 1, 1,
0.218464, 1.190602, -1.316984, 1, 1, 1, 1, 1,
0.2244533, 1.297317, 0.7091872, 1, 1, 1, 1, 1,
0.2255159, 1.199745, 0.5904287, 1, 1, 1, 1, 1,
0.2264583, -1.619657, 4.406054, 1, 1, 1, 1, 1,
0.2271368, -2.048821, 2.0109, 0, 0, 1, 1, 1,
0.2284869, 0.7168427, 2.436158, 1, 0, 0, 1, 1,
0.2285378, -0.2295172, 2.412895, 1, 0, 0, 1, 1,
0.2305132, -0.7722707, 2.743858, 1, 0, 0, 1, 1,
0.2328592, 0.4109623, -0.5894565, 1, 0, 0, 1, 1,
0.2336631, 0.09816214, 2.361168, 1, 0, 0, 1, 1,
0.234288, 0.7345761, -0.06241459, 0, 0, 0, 1, 1,
0.2351602, 0.2499985, 2.602188, 0, 0, 0, 1, 1,
0.2397734, -0.05004229, 0.8994325, 0, 0, 0, 1, 1,
0.2409526, 0.4245914, 0.3879655, 0, 0, 0, 1, 1,
0.2422565, -0.01353955, 1.137154, 0, 0, 0, 1, 1,
0.2465918, -1.50125, 2.699207, 0, 0, 0, 1, 1,
0.2476224, -0.7199382, 4.372105, 0, 0, 0, 1, 1,
0.2484169, 0.2532646, 0.5897833, 1, 1, 1, 1, 1,
0.2558382, 0.2308128, -1.0819, 1, 1, 1, 1, 1,
0.2562122, 0.3809289, 0.2551688, 1, 1, 1, 1, 1,
0.2595312, 0.07839271, 1.116569, 1, 1, 1, 1, 1,
0.2611603, 0.9676965, 0.1692705, 1, 1, 1, 1, 1,
0.2616639, 0.2526923, -1.760969, 1, 1, 1, 1, 1,
0.2671291, 0.5824386, -0.4697225, 1, 1, 1, 1, 1,
0.2752271, -0.5294627, 1.274247, 1, 1, 1, 1, 1,
0.2755001, -0.8494082, 1.558969, 1, 1, 1, 1, 1,
0.2812145, -0.08155636, 1.601512, 1, 1, 1, 1, 1,
0.2829968, -2.509135, 4.024012, 1, 1, 1, 1, 1,
0.2868054, 1.43547, 0.6437014, 1, 1, 1, 1, 1,
0.2877138, 1.132466, -0.1167545, 1, 1, 1, 1, 1,
0.2910412, 1.417027, -0.5194929, 1, 1, 1, 1, 1,
0.2913094, 0.2311004, 1.461, 1, 1, 1, 1, 1,
0.2936024, -0.4611315, 2.740823, 0, 0, 1, 1, 1,
0.2984736, -0.3507166, 2.368827, 1, 0, 0, 1, 1,
0.3023857, -1.425039, 2.65926, 1, 0, 0, 1, 1,
0.3045238, 0.5345122, 2.67216, 1, 0, 0, 1, 1,
0.308096, -0.7973626, 3.005826, 1, 0, 0, 1, 1,
0.3092499, 1.043541, 0.181621, 1, 0, 0, 1, 1,
0.3097501, 1.376329, -0.4849852, 0, 0, 0, 1, 1,
0.3139229, -2.282192, 3.505125, 0, 0, 0, 1, 1,
0.3160992, -0.9226721, 3.829014, 0, 0, 0, 1, 1,
0.320895, -0.6598125, 2.751831, 0, 0, 0, 1, 1,
0.3232564, 0.3178614, 0.3909761, 0, 0, 0, 1, 1,
0.3244371, -0.7612365, 2.142864, 0, 0, 0, 1, 1,
0.3329544, -0.243883, 3.415687, 0, 0, 0, 1, 1,
0.3335071, 0.8531839, 0.2003271, 1, 1, 1, 1, 1,
0.3361592, 0.2872488, 1.380175, 1, 1, 1, 1, 1,
0.3427293, 0.6448401, 0.6509015, 1, 1, 1, 1, 1,
0.3434535, -0.6480275, 4.284245, 1, 1, 1, 1, 1,
0.3459046, 0.8034163, 0.8960538, 1, 1, 1, 1, 1,
0.3477496, -1.010747, 3.536594, 1, 1, 1, 1, 1,
0.3536262, 1.129966, -1.025893, 1, 1, 1, 1, 1,
0.3555337, -0.2848766, 1.931705, 1, 1, 1, 1, 1,
0.3555384, 1.266754, -0.1707611, 1, 1, 1, 1, 1,
0.3578253, 0.1332302, 0.7743121, 1, 1, 1, 1, 1,
0.3587441, -0.3799721, 3.738007, 1, 1, 1, 1, 1,
0.364437, 2.70226, -0.1515985, 1, 1, 1, 1, 1,
0.3722651, -0.4430408, 3.74817, 1, 1, 1, 1, 1,
0.3869669, -0.7053044, 0.9475245, 1, 1, 1, 1, 1,
0.3885096, -1.714031, 2.12281, 1, 1, 1, 1, 1,
0.392904, -0.6739274, 2.04817, 0, 0, 1, 1, 1,
0.392946, -1.909509, 2.521945, 1, 0, 0, 1, 1,
0.3985287, 0.4939233, 0.8989324, 1, 0, 0, 1, 1,
0.4012649, -0.009153126, 2.096699, 1, 0, 0, 1, 1,
0.4036968, 0.2445543, 0.1715044, 1, 0, 0, 1, 1,
0.4061984, -0.7961247, 2.692615, 1, 0, 0, 1, 1,
0.4081896, -1.249738, 3.383514, 0, 0, 0, 1, 1,
0.4102162, 0.522674, 0.189999, 0, 0, 0, 1, 1,
0.4106121, 1.832991, -0.27465, 0, 0, 0, 1, 1,
0.4111683, 0.3524614, -0.4369076, 0, 0, 0, 1, 1,
0.4121949, 1.254009, -1.331882, 0, 0, 0, 1, 1,
0.4139947, -1.519971, 2.489531, 0, 0, 0, 1, 1,
0.4145698, -0.8721166, -0.1359906, 0, 0, 0, 1, 1,
0.4146428, -0.5824144, 1.835191, 1, 1, 1, 1, 1,
0.4180916, -1.438831, 3.572032, 1, 1, 1, 1, 1,
0.4184702, 1.52404, 0.3082818, 1, 1, 1, 1, 1,
0.4197741, 0.838911, -0.2674203, 1, 1, 1, 1, 1,
0.4251326, 1.990009, -0.7402796, 1, 1, 1, 1, 1,
0.4277526, 1.46946, 0.3446576, 1, 1, 1, 1, 1,
0.4294817, -1.214543, 3.464154, 1, 1, 1, 1, 1,
0.4310414, -0.5427148, 1.732659, 1, 1, 1, 1, 1,
0.4337131, 0.3139164, 0.8537033, 1, 1, 1, 1, 1,
0.433928, 1.370394, 0.04799047, 1, 1, 1, 1, 1,
0.4372954, 0.01916731, 1.428068, 1, 1, 1, 1, 1,
0.4409527, 0.08715018, 0.7283044, 1, 1, 1, 1, 1,
0.4412112, -0.7415559, 1.70268, 1, 1, 1, 1, 1,
0.44536, -0.25214, 0.9191352, 1, 1, 1, 1, 1,
0.4465013, -0.2050529, 1.58156, 1, 1, 1, 1, 1,
0.4493077, 0.377149, -0.01086687, 0, 0, 1, 1, 1,
0.451917, -0.8301389, 4.672735, 1, 0, 0, 1, 1,
0.4530478, -0.7371609, 2.17977, 1, 0, 0, 1, 1,
0.4556291, -0.4369789, 0.8613762, 1, 0, 0, 1, 1,
0.4565706, 1.244223, -1.008513, 1, 0, 0, 1, 1,
0.4656272, 0.2110635, 2.514433, 1, 0, 0, 1, 1,
0.4660182, -0.6187263, 2.413144, 0, 0, 0, 1, 1,
0.4689839, 0.852037, -0.3352166, 0, 0, 0, 1, 1,
0.4765959, -0.06869633, 2.76863, 0, 0, 0, 1, 1,
0.4796296, -1.592159, 4.230129, 0, 0, 0, 1, 1,
0.4863911, 1.176917, -1.249796, 0, 0, 0, 1, 1,
0.4899746, -0.1014233, 1.581284, 0, 0, 0, 1, 1,
0.4945171, -0.8124539, 4.009088, 0, 0, 0, 1, 1,
0.4948527, -0.5827966, 2.580264, 1, 1, 1, 1, 1,
0.4997172, 0.2946947, 0.6869252, 1, 1, 1, 1, 1,
0.5026316, -0.5103616, 2.934595, 1, 1, 1, 1, 1,
0.5037048, 0.7342845, 0.6729172, 1, 1, 1, 1, 1,
0.5077441, -2.442624, 2.656834, 1, 1, 1, 1, 1,
0.5082223, -1.730326, 3.494836, 1, 1, 1, 1, 1,
0.5105833, -1.658391, 2.131496, 1, 1, 1, 1, 1,
0.5121489, 0.3630337, 0.3671194, 1, 1, 1, 1, 1,
0.5133615, -0.5483494, 1.6883, 1, 1, 1, 1, 1,
0.5176277, 1.045048, 4.595579, 1, 1, 1, 1, 1,
0.520157, -1.260648, 3.746694, 1, 1, 1, 1, 1,
0.520238, 0.5291549, -0.9268862, 1, 1, 1, 1, 1,
0.5210438, -0.3443166, 3.408174, 1, 1, 1, 1, 1,
0.5210868, 1.476384, 1.03882, 1, 1, 1, 1, 1,
0.5218176, 0.794377, 1.378128, 1, 1, 1, 1, 1,
0.5226115, 0.9243473, -0.2233051, 0, 0, 1, 1, 1,
0.5285774, -0.9908544, 3.098889, 1, 0, 0, 1, 1,
0.5351489, -0.33861, 1.315479, 1, 0, 0, 1, 1,
0.5429181, 0.7192987, 2.114413, 1, 0, 0, 1, 1,
0.5435876, -0.02612058, 2.217038, 1, 0, 0, 1, 1,
0.5439144, -0.7900306, 2.843102, 1, 0, 0, 1, 1,
0.550652, -0.5051196, 3.352095, 0, 0, 0, 1, 1,
0.5525498, -0.6167697, 3.191767, 0, 0, 0, 1, 1,
0.55551, -0.7973657, 1.519423, 0, 0, 0, 1, 1,
0.5601886, 1.680316, 0.1992401, 0, 0, 0, 1, 1,
0.5633544, -1.263033, 2.814574, 0, 0, 0, 1, 1,
0.5646678, -0.02542961, 1.775046, 0, 0, 0, 1, 1,
0.565195, 0.1078017, -0.4410455, 0, 0, 0, 1, 1,
0.5652218, -0.8866499, 0.4642801, 1, 1, 1, 1, 1,
0.5670028, 0.6016663, 1.05392, 1, 1, 1, 1, 1,
0.5739165, -0.3865901, 1.21086, 1, 1, 1, 1, 1,
0.5747855, -0.3661506, 2.386399, 1, 1, 1, 1, 1,
0.5748159, -1.34038, 2.331383, 1, 1, 1, 1, 1,
0.5792124, 0.2463738, 1.457449, 1, 1, 1, 1, 1,
0.5793301, 1.382778, 0.2442572, 1, 1, 1, 1, 1,
0.5796931, 0.8507739, -1.293807, 1, 1, 1, 1, 1,
0.5810616, 0.248541, 1.757815, 1, 1, 1, 1, 1,
0.5831033, 0.4928802, 0.1068712, 1, 1, 1, 1, 1,
0.590215, 0.3080478, 2.007535, 1, 1, 1, 1, 1,
0.5927614, -0.7907617, 1.80704, 1, 1, 1, 1, 1,
0.594257, -0.4737125, 0.6582753, 1, 1, 1, 1, 1,
0.5950989, -0.4421235, 3.070833, 1, 1, 1, 1, 1,
0.595405, -1.372976, 2.886011, 1, 1, 1, 1, 1,
0.597014, 0.6308793, 1.566349, 0, 0, 1, 1, 1,
0.5973816, -0.5426667, 4.94538, 1, 0, 0, 1, 1,
0.6007741, -0.9333379, 2.71597, 1, 0, 0, 1, 1,
0.6009715, 0.8776954, 0.3777223, 1, 0, 0, 1, 1,
0.6088781, -0.2931973, 1.839156, 1, 0, 0, 1, 1,
0.6093642, -1.226843, 2.33682, 1, 0, 0, 1, 1,
0.6146048, 1.235215, 0.3443969, 0, 0, 0, 1, 1,
0.6213146, 1.342718, 0.1950671, 0, 0, 0, 1, 1,
0.6249999, 0.3500538, 0.5675402, 0, 0, 0, 1, 1,
0.6282411, -0.8191383, 3.597666, 0, 0, 0, 1, 1,
0.6329571, 0.6795216, -0.8766865, 0, 0, 0, 1, 1,
0.641923, -0.1160803, -1.071731, 0, 0, 0, 1, 1,
0.6473609, -2.525939, 5.132156, 0, 0, 0, 1, 1,
0.6485975, -0.1313684, 1.396767, 1, 1, 1, 1, 1,
0.6495593, 0.1858987, 1.738885, 1, 1, 1, 1, 1,
0.6517561, -0.3727621, 3.864187, 1, 1, 1, 1, 1,
0.6652126, 0.1421436, 2.194337, 1, 1, 1, 1, 1,
0.6725451, -0.5418391, 3.083021, 1, 1, 1, 1, 1,
0.6820918, 0.6093959, 0.52273, 1, 1, 1, 1, 1,
0.6873803, -0.702262, 5.000681, 1, 1, 1, 1, 1,
0.6924148, -0.08871122, 3.4353, 1, 1, 1, 1, 1,
0.6942033, -0.1482969, 1.989536, 1, 1, 1, 1, 1,
0.6960328, -0.08630222, 0.6227453, 1, 1, 1, 1, 1,
0.6975784, -1.311628, 3.611639, 1, 1, 1, 1, 1,
0.6987863, -0.3707026, 2.37278, 1, 1, 1, 1, 1,
0.7021461, -1.394074, 2.000447, 1, 1, 1, 1, 1,
0.7113233, -0.7197269, 3.311607, 1, 1, 1, 1, 1,
0.7113919, -0.5017632, 2.857222, 1, 1, 1, 1, 1,
0.727446, 0.3061252, 2.177224, 0, 0, 1, 1, 1,
0.7276506, 0.3736638, -0.5905569, 1, 0, 0, 1, 1,
0.7312546, 1.515121, 1.095095, 1, 0, 0, 1, 1,
0.7367135, 0.3815754, 1.881583, 1, 0, 0, 1, 1,
0.7382751, 0.841672, 1.485564, 1, 0, 0, 1, 1,
0.7406357, -1.732607, 3.513074, 1, 0, 0, 1, 1,
0.7407709, 0.02470209, 2.084727, 0, 0, 0, 1, 1,
0.7420128, -0.7180158, 3.331774, 0, 0, 0, 1, 1,
0.7455034, -0.5899099, 0.7793214, 0, 0, 0, 1, 1,
0.7481893, -1.638483, 1.605983, 0, 0, 0, 1, 1,
0.7535457, 0.4073034, 2.044347, 0, 0, 0, 1, 1,
0.7537485, -0.1056384, 1.194804, 0, 0, 0, 1, 1,
0.7545683, -0.128853, 2.184785, 0, 0, 0, 1, 1,
0.7570217, -0.3741754, 1.380074, 1, 1, 1, 1, 1,
0.7638027, 1.902796, 1.323657, 1, 1, 1, 1, 1,
0.7662404, -2.097147, 2.079239, 1, 1, 1, 1, 1,
0.7683541, 0.4306651, 1.575489, 1, 1, 1, 1, 1,
0.7720461, 1.137629, 1.133948, 1, 1, 1, 1, 1,
0.773011, 0.3270268, 1.206568, 1, 1, 1, 1, 1,
0.7767214, -1.296267, 0.7782621, 1, 1, 1, 1, 1,
0.7776864, -0.06322176, -0.2228429, 1, 1, 1, 1, 1,
0.781165, -0.1690686, 2.530374, 1, 1, 1, 1, 1,
0.7868162, 0.1877774, 2.566237, 1, 1, 1, 1, 1,
0.7939668, 0.4414394, 2.072139, 1, 1, 1, 1, 1,
0.7976785, 0.02777651, 0.9105451, 1, 1, 1, 1, 1,
0.8017924, 1.086223, -0.1830757, 1, 1, 1, 1, 1,
0.8028609, 0.9901582, 1.405164, 1, 1, 1, 1, 1,
0.8037496, -1.408657, 2.834176, 1, 1, 1, 1, 1,
0.8038917, -2.901596, 4.215031, 0, 0, 1, 1, 1,
0.8046715, -1.688904, 1.967803, 1, 0, 0, 1, 1,
0.8049676, 1.270853, -0.4119006, 1, 0, 0, 1, 1,
0.807903, -0.2771727, 1.627609, 1, 0, 0, 1, 1,
0.8146857, -0.3223583, 3.687231, 1, 0, 0, 1, 1,
0.8165926, 0.3345663, 1.647944, 1, 0, 0, 1, 1,
0.8185013, 0.3080207, 2.367054, 0, 0, 0, 1, 1,
0.8196386, -1.155953, 0.6924087, 0, 0, 0, 1, 1,
0.8229728, 0.1516331, 0.4950891, 0, 0, 0, 1, 1,
0.8243796, 1.156388, 1.274431, 0, 0, 0, 1, 1,
0.8286052, -0.3802795, 1.238925, 0, 0, 0, 1, 1,
0.8426408, 1.778855, -2.400267, 0, 0, 0, 1, 1,
0.8475175, 0.06747765, 1.896077, 0, 0, 0, 1, 1,
0.8578119, -0.1962956, 1.764316, 1, 1, 1, 1, 1,
0.8589658, 0.6848662, 0.1966577, 1, 1, 1, 1, 1,
0.8619495, 1.994092, -1.198827, 1, 1, 1, 1, 1,
0.8637228, 0.02625315, 2.441583, 1, 1, 1, 1, 1,
0.8655977, 1.079819, 0.4364421, 1, 1, 1, 1, 1,
0.8753791, -0.3471144, 2.063187, 1, 1, 1, 1, 1,
0.880589, -1.48553, 1.905463, 1, 1, 1, 1, 1,
0.8817369, 1.642788, 0.9270391, 1, 1, 1, 1, 1,
0.8838071, 1.446674, -0.9610992, 1, 1, 1, 1, 1,
0.8865688, -0.4212729, 3.563033, 1, 1, 1, 1, 1,
0.8897556, -0.7915417, -0.4321188, 1, 1, 1, 1, 1,
0.889764, -0.4527798, 0.6938788, 1, 1, 1, 1, 1,
0.8930689, 0.9552606, 1.854826, 1, 1, 1, 1, 1,
0.8945234, 0.3456706, 1.609955, 1, 1, 1, 1, 1,
0.8973809, 2.48319, -0.3850601, 1, 1, 1, 1, 1,
0.8982191, -0.322142, 1.418006, 0, 0, 1, 1, 1,
0.9019508, -0.4054402, 2.881641, 1, 0, 0, 1, 1,
0.9025992, -0.2276111, 2.129904, 1, 0, 0, 1, 1,
0.9036322, 0.03339057, 0.7270925, 1, 0, 0, 1, 1,
0.9144435, -0.3752474, 1.295825, 1, 0, 0, 1, 1,
0.9163356, 0.03321804, 1.849625, 1, 0, 0, 1, 1,
0.9239171, -0.6903964, 2.527605, 0, 0, 0, 1, 1,
0.930386, -0.943298, 1.858253, 0, 0, 0, 1, 1,
0.9324122, 0.2815167, 3.509566, 0, 0, 0, 1, 1,
0.9336972, -1.176945, 2.439584, 0, 0, 0, 1, 1,
0.9338957, 0.4169374, 1.705635, 0, 0, 0, 1, 1,
0.9398583, 0.05227174, 1.57048, 0, 0, 0, 1, 1,
0.9399738, 1.064002, -0.5661951, 0, 0, 0, 1, 1,
0.9410616, 1.2734, -1.437693, 1, 1, 1, 1, 1,
0.943498, -1.481625, 2.181476, 1, 1, 1, 1, 1,
0.9435679, 1.185579, 0.2586842, 1, 1, 1, 1, 1,
0.9472228, 0.3063683, 1.759308, 1, 1, 1, 1, 1,
0.9589488, 0.6661817, 1.172565, 1, 1, 1, 1, 1,
0.964042, -0.7623712, 1.20041, 1, 1, 1, 1, 1,
0.9641888, -0.7272593, 2.773027, 1, 1, 1, 1, 1,
0.9655346, -0.1964409, 1.479931, 1, 1, 1, 1, 1,
0.9759466, -0.8615341, 2.249403, 1, 1, 1, 1, 1,
0.9768302, 0.8249232, -0.09582078, 1, 1, 1, 1, 1,
0.9821226, 0.3177733, -0.5635559, 1, 1, 1, 1, 1,
0.9857903, -0.1742909, 1.756313, 1, 1, 1, 1, 1,
0.9888334, -0.6356386, 2.054426, 1, 1, 1, 1, 1,
0.9920554, 0.7913708, 0.06333432, 1, 1, 1, 1, 1,
0.9930935, 0.2261265, 1.663567, 1, 1, 1, 1, 1,
1.004356, -0.4075618, 2.798555, 0, 0, 1, 1, 1,
1.006129, 0.009188407, 1.941527, 1, 0, 0, 1, 1,
1.017035, 0.5535194, 2.191613, 1, 0, 0, 1, 1,
1.01874, 0.874073, 1.294165, 1, 0, 0, 1, 1,
1.019488, -0.4988436, 1.382729, 1, 0, 0, 1, 1,
1.029294, -1.25108, 2.638835, 1, 0, 0, 1, 1,
1.029297, 0.6766305, 0.7135961, 0, 0, 0, 1, 1,
1.031706, 0.04597449, 3.424776, 0, 0, 0, 1, 1,
1.034014, -0.2131234, 0.385139, 0, 0, 0, 1, 1,
1.034478, 0.7624565, 0.3096542, 0, 0, 0, 1, 1,
1.037617, 0.5245445, 1.15148, 0, 0, 0, 1, 1,
1.040114, 0.3618494, 0.5624866, 0, 0, 0, 1, 1,
1.040312, -0.888147, 1.945499, 0, 0, 0, 1, 1,
1.050476, 1.181403, -1.34112, 1, 1, 1, 1, 1,
1.051066, -0.4820408, 0.578553, 1, 1, 1, 1, 1,
1.051857, 1.270272, -0.7648888, 1, 1, 1, 1, 1,
1.053253, 0.2399108, 0.5921438, 1, 1, 1, 1, 1,
1.058955, -1.444676, 2.31781, 1, 1, 1, 1, 1,
1.062541, 0.915248, 1.148924, 1, 1, 1, 1, 1,
1.073169, 0.7205518, 0.7075254, 1, 1, 1, 1, 1,
1.077221, 0.7261, 0.3836564, 1, 1, 1, 1, 1,
1.088803, -0.3532308, 0.8834183, 1, 1, 1, 1, 1,
1.091529, 1.287303, 0.4189082, 1, 1, 1, 1, 1,
1.093177, 0.06105272, -0.240269, 1, 1, 1, 1, 1,
1.097531, -0.1758362, 2.186505, 1, 1, 1, 1, 1,
1.102749, -1.488173, -0.6150505, 1, 1, 1, 1, 1,
1.106036, 1.703752, 0.7503038, 1, 1, 1, 1, 1,
1.106845, 0.2328416, 1.489411, 1, 1, 1, 1, 1,
1.111175, 0.4014368, 0.2881786, 0, 0, 1, 1, 1,
1.115848, 1.711129, 0.4448212, 1, 0, 0, 1, 1,
1.116963, -0.7604553, 2.223354, 1, 0, 0, 1, 1,
1.11698, 0.9360985, -0.290668, 1, 0, 0, 1, 1,
1.118362, -0.764017, 2.82097, 1, 0, 0, 1, 1,
1.123781, 1.585114, 0.8890656, 1, 0, 0, 1, 1,
1.125375, 0.06378502, 1.982703, 0, 0, 0, 1, 1,
1.127456, -0.1635202, 1.923163, 0, 0, 0, 1, 1,
1.129598, 0.2773179, 0.2552364, 0, 0, 0, 1, 1,
1.131632, 0.9680859, 2.100785, 0, 0, 0, 1, 1,
1.139161, 0.4839329, 1.566782, 0, 0, 0, 1, 1,
1.149546, 0.3432475, 1.398806, 0, 0, 0, 1, 1,
1.158831, 0.274323, 1.84024, 0, 0, 0, 1, 1,
1.16334, -1.27806, 2.151928, 1, 1, 1, 1, 1,
1.167191, -1.24603, 2.988261, 1, 1, 1, 1, 1,
1.171935, -0.5883262, 2.304716, 1, 1, 1, 1, 1,
1.172682, 0.2739479, 2.185569, 1, 1, 1, 1, 1,
1.173106, 0.1336885, 2.567977, 1, 1, 1, 1, 1,
1.180484, 2.126185, 0.7300492, 1, 1, 1, 1, 1,
1.18769, 0.1706851, 2.251936, 1, 1, 1, 1, 1,
1.18774, 0.9148052, -0.09155039, 1, 1, 1, 1, 1,
1.191902, 0.1299754, 1.374316, 1, 1, 1, 1, 1,
1.203359, -0.06370285, 2.170514, 1, 1, 1, 1, 1,
1.212898, -0.5947658, 3.587676, 1, 1, 1, 1, 1,
1.226114, 1.37835, 0.2934644, 1, 1, 1, 1, 1,
1.240567, -0.4828929, 2.643923, 1, 1, 1, 1, 1,
1.245465, -0.3771036, 2.145863, 1, 1, 1, 1, 1,
1.250718, 0.5259054, 0.4469122, 1, 1, 1, 1, 1,
1.252468, 0.4748856, 2.19079, 0, 0, 1, 1, 1,
1.260374, -0.5536904, 3.221526, 1, 0, 0, 1, 1,
1.261985, -0.9935324, 2.235561, 1, 0, 0, 1, 1,
1.26511, -0.8373081, 2.320107, 1, 0, 0, 1, 1,
1.283206, -1.422306, 3.041552, 1, 0, 0, 1, 1,
1.288237, 0.5562453, 0.8048548, 1, 0, 0, 1, 1,
1.290955, 0.01681891, 3.119682, 0, 0, 0, 1, 1,
1.29361, -0.3181453, 0.3392484, 0, 0, 0, 1, 1,
1.3016, -0.4953521, 3.034187, 0, 0, 0, 1, 1,
1.301879, 1.085561, -0.5030512, 0, 0, 0, 1, 1,
1.311384, 0.3274526, 0.930199, 0, 0, 0, 1, 1,
1.334258, 0.09530539, 2.071404, 0, 0, 0, 1, 1,
1.342911, -0.1893496, 1.102723, 0, 0, 0, 1, 1,
1.345262, -1.765033, 2.852384, 1, 1, 1, 1, 1,
1.34537, 0.3298631, 3.188242, 1, 1, 1, 1, 1,
1.345806, 1.170445, 1.655732, 1, 1, 1, 1, 1,
1.354935, 0.6034894, 0.6540578, 1, 1, 1, 1, 1,
1.375185, 0.4708149, 1.040693, 1, 1, 1, 1, 1,
1.377335, -0.06198805, 0.6163791, 1, 1, 1, 1, 1,
1.384604, -0.8792715, 2.379135, 1, 1, 1, 1, 1,
1.386021, -2.652889, 3.221102, 1, 1, 1, 1, 1,
1.392059, -0.4896196, 1.036066, 1, 1, 1, 1, 1,
1.397868, 0.7076569, 0.9482007, 1, 1, 1, 1, 1,
1.406929, -0.1860407, 2.300258, 1, 1, 1, 1, 1,
1.410146, -0.5326369, 2.466031, 1, 1, 1, 1, 1,
1.413643, -0.452207, 1.927386, 1, 1, 1, 1, 1,
1.418904, 0.234663, 0.4434358, 1, 1, 1, 1, 1,
1.42397, -2.801247, 2.01563, 1, 1, 1, 1, 1,
1.429946, 0.7062677, 2.38555, 0, 0, 1, 1, 1,
1.435424, 0.7396646, 1.112952, 1, 0, 0, 1, 1,
1.438313, -0.5614156, 1.672184, 1, 0, 0, 1, 1,
1.447395, -0.2901655, 3.191713, 1, 0, 0, 1, 1,
1.45063, -1.29235, 1.912465, 1, 0, 0, 1, 1,
1.458601, 1.131729, 0.03891691, 1, 0, 0, 1, 1,
1.494612, 0.9532112, 0.05384431, 0, 0, 0, 1, 1,
1.498737, 0.3344323, 1.763225, 0, 0, 0, 1, 1,
1.517918, -0.5009855, 0.4426333, 0, 0, 0, 1, 1,
1.519957, 0.800554, 0.2875683, 0, 0, 0, 1, 1,
1.535165, 0.496217, 2.778904, 0, 0, 0, 1, 1,
1.538709, 0.05253379, 0.1032947, 0, 0, 0, 1, 1,
1.547462, -0.7758913, 1.788254, 0, 0, 0, 1, 1,
1.562849, 1.552973, 1.299068, 1, 1, 1, 1, 1,
1.569082, -0.7839548, 3.381413, 1, 1, 1, 1, 1,
1.570115, 0.3293524, 1.184476, 1, 1, 1, 1, 1,
1.571321, -1.163352, 2.216113, 1, 1, 1, 1, 1,
1.585607, 1.115133, 0.3562206, 1, 1, 1, 1, 1,
1.589973, 0.7034277, 2.169555, 1, 1, 1, 1, 1,
1.609429, -1.874971, 1.92529, 1, 1, 1, 1, 1,
1.62795, 0.07348355, 1.48724, 1, 1, 1, 1, 1,
1.64666, 0.408913, 0.1937201, 1, 1, 1, 1, 1,
1.655106, -0.7575753, 1.041725, 1, 1, 1, 1, 1,
1.656368, 0.6120394, 2.528643, 1, 1, 1, 1, 1,
1.663215, -1.008614, 1.514404, 1, 1, 1, 1, 1,
1.665319, -0.3408762, 1.513938, 1, 1, 1, 1, 1,
1.665693, 1.372212, 0.5837286, 1, 1, 1, 1, 1,
1.672492, -1.479432, 1.528924, 1, 1, 1, 1, 1,
1.675776, 1.388732, 1.632522, 0, 0, 1, 1, 1,
1.72406, -1.674347, 1.010889, 1, 0, 0, 1, 1,
1.733248, -0.543435, 1.889683, 1, 0, 0, 1, 1,
1.73712, -0.2624747, 2.204342, 1, 0, 0, 1, 1,
1.744676, -0.2758086, 2.86429, 1, 0, 0, 1, 1,
1.752961, -0.2613226, 1.583449, 1, 0, 0, 1, 1,
1.807651, 0.1639153, 1.603141, 0, 0, 0, 1, 1,
1.808275, -0.1226327, 2.534156, 0, 0, 0, 1, 1,
1.811599, 1.202752, 0.7966754, 0, 0, 0, 1, 1,
1.823155, -0.1533981, 2.220683, 0, 0, 0, 1, 1,
1.845711, -0.188057, 0.3402867, 0, 0, 0, 1, 1,
1.85694, -0.3777197, 2.452564, 0, 0, 0, 1, 1,
1.870231, -0.9250433, 2.145694, 0, 0, 0, 1, 1,
1.876096, -0.4551853, 0.3243208, 1, 1, 1, 1, 1,
1.876704, -0.2347099, 1.979855, 1, 1, 1, 1, 1,
1.882956, 0.9721044, 1.21294, 1, 1, 1, 1, 1,
1.895447, -0.09901898, 1.745495, 1, 1, 1, 1, 1,
1.899948, 0.3558638, 2.199772, 1, 1, 1, 1, 1,
1.913971, -2.138638, 3.391013, 1, 1, 1, 1, 1,
1.921658, -0.2101551, 1.564848, 1, 1, 1, 1, 1,
1.95036, -0.94516, 3.193451, 1, 1, 1, 1, 1,
1.952216, 1.158918, 1.562463, 1, 1, 1, 1, 1,
1.953209, 0.5099679, 2.424578, 1, 1, 1, 1, 1,
1.977019, -0.1686263, 0.2986545, 1, 1, 1, 1, 1,
2.005635, -1.628034, 2.300605, 1, 1, 1, 1, 1,
2.007051, -0.1442362, 1.839826, 1, 1, 1, 1, 1,
2.007226, -1.186814, 2.665582, 1, 1, 1, 1, 1,
2.015205, -1.345478, 0.9885445, 1, 1, 1, 1, 1,
2.01847, 2.078616, 1.986937, 0, 0, 1, 1, 1,
2.025337, -1.230574, 3.150944, 1, 0, 0, 1, 1,
2.034442, 0.9411605, 1.933727, 1, 0, 0, 1, 1,
2.041543, 0.4834138, 0.6618069, 1, 0, 0, 1, 1,
2.087841, 0.06926024, 0.2437293, 1, 0, 0, 1, 1,
2.155322, 1.914407, 0.6385002, 1, 0, 0, 1, 1,
2.189539, -0.2862932, 2.28308, 0, 0, 0, 1, 1,
2.245975, -0.881337, 2.785841, 0, 0, 0, 1, 1,
2.255164, 0.6354223, 0.7936981, 0, 0, 0, 1, 1,
2.304736, -0.7026773, 1.371811, 0, 0, 0, 1, 1,
2.411417, 1.222901, 1.334343, 0, 0, 0, 1, 1,
2.422528, -0.4252366, 1.340358, 0, 0, 0, 1, 1,
2.433717, 2.944857, -0.1845809, 0, 0, 0, 1, 1,
2.560632, 0.5803784, 0.8694406, 1, 1, 1, 1, 1,
2.582926, 2.418822, 1.200956, 1, 1, 1, 1, 1,
2.637063, 0.4343227, 1.618185, 1, 1, 1, 1, 1,
2.711107, -1.936012, 3.415767, 1, 1, 1, 1, 1,
2.738984, -0.689956, 3.035404, 1, 1, 1, 1, 1,
2.821404, -0.9099355, 0.8144234, 1, 1, 1, 1, 1,
2.882748, 1.147111, 0.6769107, 1, 1, 1, 1, 1
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
var radius = 9.272306;
var distance = 32.56858;
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
mvMatrix.translate( 0.01055312, -0.02163029, 0.1690965 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.56858);
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
