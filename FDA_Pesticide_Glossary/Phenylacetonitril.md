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
-3.12814, 0.8465, -1.25486, 1, 0, 0, 1,
-2.828219, -0.1146295, -1.129455, 1, 0.007843138, 0, 1,
-2.800406, 0.6189657, -1.948385, 1, 0.01176471, 0, 1,
-2.750082, -1.958434, -0.7390488, 1, 0.01960784, 0, 1,
-2.6248, -0.9591091, -4.460647, 1, 0.02352941, 0, 1,
-2.623233, 1.615404, -1.97552, 1, 0.03137255, 0, 1,
-2.611817, -1.651378, -3.008113, 1, 0.03529412, 0, 1,
-2.442199, 1.599044, -1.158473, 1, 0.04313726, 0, 1,
-2.369015, -0.5141867, -0.6808496, 1, 0.04705882, 0, 1,
-2.363995, 0.5329381, -0.3795949, 1, 0.05490196, 0, 1,
-2.300092, -0.5140969, -1.24651, 1, 0.05882353, 0, 1,
-2.271374, 1.128561, -1.071758, 1, 0.06666667, 0, 1,
-2.271239, -1.162707, -2.125954, 1, 0.07058824, 0, 1,
-2.242181, -0.2115787, -2.910227, 1, 0.07843138, 0, 1,
-2.238207, 0.2995972, -0.6804482, 1, 0.08235294, 0, 1,
-2.206546, 1.106424, -0.6636968, 1, 0.09019608, 0, 1,
-2.185932, -0.2832166, -3.023543, 1, 0.09411765, 0, 1,
-2.176318, -0.4280754, -2.036086, 1, 0.1019608, 0, 1,
-2.150183, 2.079655, -0.555563, 1, 0.1098039, 0, 1,
-2.146055, 1.466947, -1.306713, 1, 0.1137255, 0, 1,
-2.145073, -2.005997, -2.639339, 1, 0.1215686, 0, 1,
-2.114065, -1.787092, -1.653025, 1, 0.1254902, 0, 1,
-2.109783, -0.2645743, -2.207938, 1, 0.1333333, 0, 1,
-2.062096, -1.197395, -2.19938, 1, 0.1372549, 0, 1,
-2.056562, 2.488387, -0.5237519, 1, 0.145098, 0, 1,
-2.048953, -0.3916002, -2.468216, 1, 0.1490196, 0, 1,
-2.036331, 0.8467541, 0.9235953, 1, 0.1568628, 0, 1,
-2.005022, -0.2973554, -2.317909, 1, 0.1607843, 0, 1,
-1.982679, 0.5079824, -2.491944, 1, 0.1686275, 0, 1,
-1.978298, -1.789738, -0.6748275, 1, 0.172549, 0, 1,
-1.977615, -0.9358625, -2.93201, 1, 0.1803922, 0, 1,
-1.943359, 1.905546, -0.6080799, 1, 0.1843137, 0, 1,
-1.926482, -0.888661, -2.52041, 1, 0.1921569, 0, 1,
-1.926428, -1.641341, -2.076096, 1, 0.1960784, 0, 1,
-1.925128, 0.8314045, -1.393782, 1, 0.2039216, 0, 1,
-1.913803, 0.6086784, 0.09589577, 1, 0.2117647, 0, 1,
-1.868261, -1.064404, -2.20395, 1, 0.2156863, 0, 1,
-1.828073, 0.7056264, -0.62516, 1, 0.2235294, 0, 1,
-1.827088, 0.1517925, -0.6652217, 1, 0.227451, 0, 1,
-1.814442, 1.205042, -1.070117, 1, 0.2352941, 0, 1,
-1.807516, 0.1101414, -2.04232, 1, 0.2392157, 0, 1,
-1.787484, 1.206836, -2.838093, 1, 0.2470588, 0, 1,
-1.782257, -0.4426016, -1.087073, 1, 0.2509804, 0, 1,
-1.779103, -1.298378, -0.5676809, 1, 0.2588235, 0, 1,
-1.753282, -0.9094919, -3.558798, 1, 0.2627451, 0, 1,
-1.742306, -0.5268699, -2.905233, 1, 0.2705882, 0, 1,
-1.735283, -0.4768476, -2.059317, 1, 0.2745098, 0, 1,
-1.734136, -0.1762842, -1.739584, 1, 0.282353, 0, 1,
-1.707099, -0.4340654, -2.281708, 1, 0.2862745, 0, 1,
-1.685876, 1.155048, -2.164003, 1, 0.2941177, 0, 1,
-1.656428, 0.8429096, -0.8241191, 1, 0.3019608, 0, 1,
-1.618826, 2.534983, 0.4020806, 1, 0.3058824, 0, 1,
-1.600949, -1.418882, -2.43727, 1, 0.3137255, 0, 1,
-1.586255, 0.1984511, -2.419416, 1, 0.3176471, 0, 1,
-1.58437, 0.6255559, -2.066769, 1, 0.3254902, 0, 1,
-1.57546, -0.833957, -1.845888, 1, 0.3294118, 0, 1,
-1.574899, -1.624376, -1.912907, 1, 0.3372549, 0, 1,
-1.572386, 1.302433, -0.3028472, 1, 0.3411765, 0, 1,
-1.569717, 0.8293758, -1.569649, 1, 0.3490196, 0, 1,
-1.560727, -0.6063384, -2.059101, 1, 0.3529412, 0, 1,
-1.547314, -1.025084, -2.965228, 1, 0.3607843, 0, 1,
-1.540318, -2.521865, -0.6639331, 1, 0.3647059, 0, 1,
-1.540158, 1.468978, -1.346127, 1, 0.372549, 0, 1,
-1.536747, 0.6382371, 0.05173142, 1, 0.3764706, 0, 1,
-1.532357, 0.444769, -0.8134184, 1, 0.3843137, 0, 1,
-1.526766, 0.1337667, -2.597847, 1, 0.3882353, 0, 1,
-1.516634, -0.3193677, -0.6534595, 1, 0.3960784, 0, 1,
-1.509742, -1.062341, -1.970056, 1, 0.4039216, 0, 1,
-1.500912, 1.36598, -0.6450885, 1, 0.4078431, 0, 1,
-1.490265, -1.217, -3.128858, 1, 0.4156863, 0, 1,
-1.477684, 0.4706429, -1.694389, 1, 0.4196078, 0, 1,
-1.475698, -1.083097, -2.535911, 1, 0.427451, 0, 1,
-1.458113, -1.538114, -1.270807, 1, 0.4313726, 0, 1,
-1.451287, -0.2583415, -3.362417, 1, 0.4392157, 0, 1,
-1.442801, -1.694623, -2.846308, 1, 0.4431373, 0, 1,
-1.441258, -0.4426031, -1.171492, 1, 0.4509804, 0, 1,
-1.436464, 0.07049932, -1.411769, 1, 0.454902, 0, 1,
-1.433552, 0.1149095, -2.572604, 1, 0.4627451, 0, 1,
-1.430272, 0.1036038, -1.305955, 1, 0.4666667, 0, 1,
-1.407254, 0.6887693, -0.7065232, 1, 0.4745098, 0, 1,
-1.406246, -0.2159458, -2.675996, 1, 0.4784314, 0, 1,
-1.388188, 0.7527204, -2.269281, 1, 0.4862745, 0, 1,
-1.356804, 0.4949738, -0.7904916, 1, 0.4901961, 0, 1,
-1.346321, -0.4668709, -0.6199876, 1, 0.4980392, 0, 1,
-1.345128, 0.4667298, -1.310187, 1, 0.5058824, 0, 1,
-1.341264, 0.5329658, -2.713848, 1, 0.509804, 0, 1,
-1.336318, 0.4534796, -1.129248, 1, 0.5176471, 0, 1,
-1.333328, 0.1143058, -1.575509, 1, 0.5215687, 0, 1,
-1.330255, 1.857112, -0.5800587, 1, 0.5294118, 0, 1,
-1.326919, -0.8596064, -1.065147, 1, 0.5333334, 0, 1,
-1.325758, -2.428283, -3.430921, 1, 0.5411765, 0, 1,
-1.310043, -0.6207304, -1.924783, 1, 0.5450981, 0, 1,
-1.299752, -0.4929444, -1.380926, 1, 0.5529412, 0, 1,
-1.277038, -0.1213412, -1.928126, 1, 0.5568628, 0, 1,
-1.27554, -1.177837, -2.173123, 1, 0.5647059, 0, 1,
-1.275011, 0.05500155, -1.925367, 1, 0.5686275, 0, 1,
-1.271667, 1.20905, 0.173658, 1, 0.5764706, 0, 1,
-1.269493, -1.006296, -2.326919, 1, 0.5803922, 0, 1,
-1.267852, -1.023027, -2.266313, 1, 0.5882353, 0, 1,
-1.263306, -1.095989, -1.906252, 1, 0.5921569, 0, 1,
-1.262324, 1.22463, -1.967854, 1, 0.6, 0, 1,
-1.2601, -0.5487236, -2.52147, 1, 0.6078432, 0, 1,
-1.244454, -2.098165, -3.201763, 1, 0.6117647, 0, 1,
-1.241431, 1.669691, -0.4034097, 1, 0.6196079, 0, 1,
-1.241281, -0.009942281, -1.659061, 1, 0.6235294, 0, 1,
-1.234263, -0.03184474, -2.022833, 1, 0.6313726, 0, 1,
-1.232324, 1.760556, 0.07811261, 1, 0.6352941, 0, 1,
-1.23198, 1.074265, 0.6235265, 1, 0.6431373, 0, 1,
-1.228028, -1.253777, -1.142929, 1, 0.6470588, 0, 1,
-1.220358, 1.973118, 0.7867256, 1, 0.654902, 0, 1,
-1.219936, -0.208228, -2.256901, 1, 0.6588235, 0, 1,
-1.209525, -0.7893642, -2.45096, 1, 0.6666667, 0, 1,
-1.196435, -0.3852998, -1.749642, 1, 0.6705883, 0, 1,
-1.190927, -0.08896773, -1.415103, 1, 0.6784314, 0, 1,
-1.183444, 1.979288, -0.01289114, 1, 0.682353, 0, 1,
-1.169482, 0.9645064, -1.157168, 1, 0.6901961, 0, 1,
-1.161592, -0.8051932, -2.307213, 1, 0.6941177, 0, 1,
-1.15695, 0.7535422, -1.434216, 1, 0.7019608, 0, 1,
-1.141938, -1.944858, -2.833993, 1, 0.7098039, 0, 1,
-1.135941, 1.359626, -0.02436974, 1, 0.7137255, 0, 1,
-1.12278, -0.9792269, -0.923969, 1, 0.7215686, 0, 1,
-1.113234, 0.3581755, -2.452696, 1, 0.7254902, 0, 1,
-1.110882, 0.6205245, -2.78414, 1, 0.7333333, 0, 1,
-1.105345, -0.02205813, -1.372502, 1, 0.7372549, 0, 1,
-1.098526, 0.4021211, 0.4105441, 1, 0.7450981, 0, 1,
-1.098359, 0.4742096, -1.58732, 1, 0.7490196, 0, 1,
-1.09201, 0.2521302, -0.2435383, 1, 0.7568628, 0, 1,
-1.090297, 0.09343076, -1.660739, 1, 0.7607843, 0, 1,
-1.073671, -1.564925, -2.837899, 1, 0.7686275, 0, 1,
-1.071532, -0.6679342, -1.304168, 1, 0.772549, 0, 1,
-1.070254, 1.356488, -1.977929, 1, 0.7803922, 0, 1,
-1.063985, 0.8122867, 0.2607984, 1, 0.7843137, 0, 1,
-1.059797, -1.356352, -2.110359, 1, 0.7921569, 0, 1,
-1.059614, 0.5154648, -2.166674, 1, 0.7960784, 0, 1,
-1.05377, 0.2198973, -0.9953957, 1, 0.8039216, 0, 1,
-1.05196, 0.7071002, -0.6404258, 1, 0.8117647, 0, 1,
-1.050489, -0.1812711, -1.205167, 1, 0.8156863, 0, 1,
-1.044327, -0.1531844, -1.810055, 1, 0.8235294, 0, 1,
-1.03603, -0.0694122, -1.273454, 1, 0.827451, 0, 1,
-1.035459, -0.3692917, -2.293356, 1, 0.8352941, 0, 1,
-1.012601, 0.3109255, -0.9061705, 1, 0.8392157, 0, 1,
-1.007904, 0.09287178, -1.840571, 1, 0.8470588, 0, 1,
-1.004298, 0.36249, -2.523395, 1, 0.8509804, 0, 1,
-1.003636, -0.6324787, -0.7897953, 1, 0.8588235, 0, 1,
-0.9989731, 0.7754182, -0.7397478, 1, 0.8627451, 0, 1,
-0.9966447, -1.096128, -3.632562, 1, 0.8705882, 0, 1,
-0.9957097, 0.4146463, -3.320494, 1, 0.8745098, 0, 1,
-0.9947557, -0.7912071, -3.015904, 1, 0.8823529, 0, 1,
-0.9894352, 1.262079, -1.401299, 1, 0.8862745, 0, 1,
-0.9893275, -0.6281916, -3.533074, 1, 0.8941177, 0, 1,
-0.9887553, -0.06762231, 0.2546485, 1, 0.8980392, 0, 1,
-0.9784491, -0.9802665, -1.720409, 1, 0.9058824, 0, 1,
-0.9749364, 1.332861, 0.0599946, 1, 0.9137255, 0, 1,
-0.9723659, 1.46406, -0.153819, 1, 0.9176471, 0, 1,
-0.9666347, -0.2729926, -2.112932, 1, 0.9254902, 0, 1,
-0.9624095, 0.3427151, -1.544042, 1, 0.9294118, 0, 1,
-0.9568477, 0.001406109, -0.3257647, 1, 0.9372549, 0, 1,
-0.9545075, -0.2088732, -0.9149099, 1, 0.9411765, 0, 1,
-0.9531572, -0.8085087, 0.1076511, 1, 0.9490196, 0, 1,
-0.9476908, -0.3800752, -0.5123247, 1, 0.9529412, 0, 1,
-0.9437354, 0.67758, -0.541019, 1, 0.9607843, 0, 1,
-0.9393038, 0.3153188, -1.562919, 1, 0.9647059, 0, 1,
-0.9364792, -1.011065, -2.86082, 1, 0.972549, 0, 1,
-0.9300662, -0.2746727, -0.5065536, 1, 0.9764706, 0, 1,
-0.9248803, -0.08439505, -3.572981, 1, 0.9843137, 0, 1,
-0.9229725, 2.774713, 0.6436123, 1, 0.9882353, 0, 1,
-0.9210371, -0.5556424, -2.848983, 1, 0.9960784, 0, 1,
-0.9172229, -0.7898349, -2.12396, 0.9960784, 1, 0, 1,
-0.9162758, 1.496825, 0.479377, 0.9921569, 1, 0, 1,
-0.9143161, 0.05611832, -2.636981, 0.9843137, 1, 0, 1,
-0.9117591, 0.9409158, 0.3462675, 0.9803922, 1, 0, 1,
-0.9105555, 0.1148354, -0.4479134, 0.972549, 1, 0, 1,
-0.9101575, 1.105355, -0.1184324, 0.9686275, 1, 0, 1,
-0.909285, -2.603012, -3.899075, 0.9607843, 1, 0, 1,
-0.8913829, 1.50448, -0.9267527, 0.9568627, 1, 0, 1,
-0.8907139, -1.076468, -2.964556, 0.9490196, 1, 0, 1,
-0.886251, 0.5870053, -1.596568, 0.945098, 1, 0, 1,
-0.8806362, 1.310924, -0.543108, 0.9372549, 1, 0, 1,
-0.8801461, -0.0067444, -1.337464, 0.9333333, 1, 0, 1,
-0.8790258, 0.5848872, -1.102317, 0.9254902, 1, 0, 1,
-0.8776534, -0.4946001, -3.604515, 0.9215686, 1, 0, 1,
-0.8750923, 0.2627394, -1.571073, 0.9137255, 1, 0, 1,
-0.8734027, -0.2895202, -1.746759, 0.9098039, 1, 0, 1,
-0.8475242, 0.1325082, -0.8073791, 0.9019608, 1, 0, 1,
-0.8469978, -0.878926, -3.628446, 0.8941177, 1, 0, 1,
-0.8466038, 0.3858163, -2.802862, 0.8901961, 1, 0, 1,
-0.8433021, 0.3836583, -0.9135672, 0.8823529, 1, 0, 1,
-0.8424384, -2.243244, -2.958008, 0.8784314, 1, 0, 1,
-0.8345062, -0.5125259, -2.025765, 0.8705882, 1, 0, 1,
-0.8263171, 0.01446748, -0.3303837, 0.8666667, 1, 0, 1,
-0.8242211, 1.165833, -1.781171, 0.8588235, 1, 0, 1,
-0.8231552, 2.366942, -0.8769937, 0.854902, 1, 0, 1,
-0.8207563, 0.3071323, -0.3720657, 0.8470588, 1, 0, 1,
-0.8204649, 1.016007, -2.065932, 0.8431373, 1, 0, 1,
-0.8128359, 1.449028, -1.740558, 0.8352941, 1, 0, 1,
-0.8113796, 0.277796, -1.832376, 0.8313726, 1, 0, 1,
-0.8106694, 0.2583496, -0.1673719, 0.8235294, 1, 0, 1,
-0.8060027, -0.8603625, -1.156563, 0.8196079, 1, 0, 1,
-0.8022052, -0.8162436, -2.641155, 0.8117647, 1, 0, 1,
-0.7990884, 1.248006, -0.02642396, 0.8078431, 1, 0, 1,
-0.7987812, 0.4842949, -0.5093552, 0.8, 1, 0, 1,
-0.7958576, -1.058518, -3.839131, 0.7921569, 1, 0, 1,
-0.7928572, 0.9172809, -0.473859, 0.7882353, 1, 0, 1,
-0.7898342, -0.4647033, -2.3304, 0.7803922, 1, 0, 1,
-0.7892109, -0.5837293, -2.933988, 0.7764706, 1, 0, 1,
-0.7849152, -0.9432465, -2.373115, 0.7686275, 1, 0, 1,
-0.7843078, 0.539493, -1.203112, 0.7647059, 1, 0, 1,
-0.7769687, -0.2315346, -1.819722, 0.7568628, 1, 0, 1,
-0.7761842, 1.643716, -1.327021, 0.7529412, 1, 0, 1,
-0.77421, -0.1773936, -0.6362163, 0.7450981, 1, 0, 1,
-0.7737574, -0.5892125, -4.599747, 0.7411765, 1, 0, 1,
-0.7722329, -0.6663002, -2.525119, 0.7333333, 1, 0, 1,
-0.7715179, -1.353101, -2.538474, 0.7294118, 1, 0, 1,
-0.748077, 0.4323647, -1.410008, 0.7215686, 1, 0, 1,
-0.7477503, -0.536406, -1.873536, 0.7176471, 1, 0, 1,
-0.7456732, 0.7291574, 0.3297542, 0.7098039, 1, 0, 1,
-0.7441494, -2.214121, -2.241862, 0.7058824, 1, 0, 1,
-0.7432173, -0.3144889, -0.9088696, 0.6980392, 1, 0, 1,
-0.7419168, -0.7235714, -2.726489, 0.6901961, 1, 0, 1,
-0.7418483, 0.2824232, -1.078806, 0.6862745, 1, 0, 1,
-0.7406842, -1.331112, -1.509897, 0.6784314, 1, 0, 1,
-0.7345258, -1.753544, -4.491421, 0.6745098, 1, 0, 1,
-0.72025, -0.3036367, -3.181764, 0.6666667, 1, 0, 1,
-0.7169714, 0.2833472, -0.8641016, 0.6627451, 1, 0, 1,
-0.7163621, 0.3284738, -1.473557, 0.654902, 1, 0, 1,
-0.7154321, -0.2738338, -3.595553, 0.6509804, 1, 0, 1,
-0.7139014, 1.145504, 0.3575451, 0.6431373, 1, 0, 1,
-0.7135875, -0.7540532, -3.312531, 0.6392157, 1, 0, 1,
-0.7113965, -0.4839646, -3.414878, 0.6313726, 1, 0, 1,
-0.7040268, 0.4721113, -0.6226706, 0.627451, 1, 0, 1,
-0.7025581, -1.395033, -4.908107, 0.6196079, 1, 0, 1,
-0.6997603, 0.3965638, -0.07832713, 0.6156863, 1, 0, 1,
-0.6995683, -1.277328, -0.8650641, 0.6078432, 1, 0, 1,
-0.6972381, -1.291436, -3.442896, 0.6039216, 1, 0, 1,
-0.6919095, -1.859969, -2.836777, 0.5960785, 1, 0, 1,
-0.688826, -0.5367472, -1.65667, 0.5882353, 1, 0, 1,
-0.6883234, -2.800136, -4.887053, 0.5843138, 1, 0, 1,
-0.6876607, -0.6560316, -1.412563, 0.5764706, 1, 0, 1,
-0.6863587, 0.08449715, 0.5833655, 0.572549, 1, 0, 1,
-0.6830662, 2.145154, 1.773742, 0.5647059, 1, 0, 1,
-0.6789323, 0.5093731, -3.034463, 0.5607843, 1, 0, 1,
-0.6728833, 0.9291233, -1.644301, 0.5529412, 1, 0, 1,
-0.6722372, -1.253924, -0.06372935, 0.5490196, 1, 0, 1,
-0.6688414, 0.8645735, -0.312519, 0.5411765, 1, 0, 1,
-0.6664013, -0.4485578, -1.634345, 0.5372549, 1, 0, 1,
-0.6658624, 0.5176888, -2.847646, 0.5294118, 1, 0, 1,
-0.6612437, 0.417769, 1.48708, 0.5254902, 1, 0, 1,
-0.6555381, 1.286329, 2.05643, 0.5176471, 1, 0, 1,
-0.6474035, -0.8347918, -2.217314, 0.5137255, 1, 0, 1,
-0.6467463, 0.08928754, -1.692787, 0.5058824, 1, 0, 1,
-0.6433307, -2.427723, -3.348911, 0.5019608, 1, 0, 1,
-0.6394897, 0.9280167, -1.941595, 0.4941176, 1, 0, 1,
-0.6353511, 0.2462835, -0.9015477, 0.4862745, 1, 0, 1,
-0.6318389, 0.3643429, 0.5295864, 0.4823529, 1, 0, 1,
-0.6312639, 1.131545, -1.024794, 0.4745098, 1, 0, 1,
-0.630005, -0.2237666, -2.036829, 0.4705882, 1, 0, 1,
-0.6278554, 1.855024, 1.516581, 0.4627451, 1, 0, 1,
-0.6159299, 0.383386, -1.077904, 0.4588235, 1, 0, 1,
-0.6157109, -0.7475306, -1.172172, 0.4509804, 1, 0, 1,
-0.613164, 1.404763, -1.514676, 0.4470588, 1, 0, 1,
-0.6114904, 1.239973, -0.4537192, 0.4392157, 1, 0, 1,
-0.6110489, -0.3231064, -3.528693, 0.4352941, 1, 0, 1,
-0.6102637, -0.4205204, -0.9118581, 0.427451, 1, 0, 1,
-0.6084538, 1.874311, -0.543898, 0.4235294, 1, 0, 1,
-0.6069412, 0.8351757, -0.6462267, 0.4156863, 1, 0, 1,
-0.6036628, 0.7205025, -0.7256287, 0.4117647, 1, 0, 1,
-0.5978478, -0.2557733, -1.175835, 0.4039216, 1, 0, 1,
-0.5973057, 0.8269413, -2.112202, 0.3960784, 1, 0, 1,
-0.5929321, 0.783321, -0.6328316, 0.3921569, 1, 0, 1,
-0.5925216, -0.3516829, -1.837391, 0.3843137, 1, 0, 1,
-0.586376, 1.354005, -1.091294, 0.3803922, 1, 0, 1,
-0.5861301, 1.579331, 0.04189877, 0.372549, 1, 0, 1,
-0.5848784, -0.9204441, -2.512801, 0.3686275, 1, 0, 1,
-0.5798544, 1.298401, -1.232676, 0.3607843, 1, 0, 1,
-0.5795983, -0.558766, -1.499207, 0.3568628, 1, 0, 1,
-0.5791597, -0.7477236, -1.781769, 0.3490196, 1, 0, 1,
-0.5760378, 1.452003, -0.6940392, 0.345098, 1, 0, 1,
-0.5757315, -1.393403, -3.171076, 0.3372549, 1, 0, 1,
-0.5716295, 0.9864119, 0.7878079, 0.3333333, 1, 0, 1,
-0.5713885, -2.188448, -4.243768, 0.3254902, 1, 0, 1,
-0.5633609, -2.16584, -2.601246, 0.3215686, 1, 0, 1,
-0.5560197, 1.858715, 0.7963559, 0.3137255, 1, 0, 1,
-0.5522575, 0.3754573, -2.666607, 0.3098039, 1, 0, 1,
-0.5511239, -0.2922232, -2.719154, 0.3019608, 1, 0, 1,
-0.5483497, 0.102412, -0.9031243, 0.2941177, 1, 0, 1,
-0.5444185, 2.742374, 0.05380584, 0.2901961, 1, 0, 1,
-0.543816, 0.6206054, -0.9486182, 0.282353, 1, 0, 1,
-0.5379482, -0.374385, -2.045947, 0.2784314, 1, 0, 1,
-0.5346097, -0.6560926, -2.274939, 0.2705882, 1, 0, 1,
-0.5341775, -0.6704781, -3.643529, 0.2666667, 1, 0, 1,
-0.5322098, -0.5771497, -2.97999, 0.2588235, 1, 0, 1,
-0.5316378, -0.4192889, -1.772735, 0.254902, 1, 0, 1,
-0.5307928, -0.1117636, -0.1182264, 0.2470588, 1, 0, 1,
-0.5294895, 1.058906, -1.006236, 0.2431373, 1, 0, 1,
-0.5284084, -1.086565, -1.319669, 0.2352941, 1, 0, 1,
-0.5239475, 0.08416528, -1.68134, 0.2313726, 1, 0, 1,
-0.5226777, 0.694438, 0.009042667, 0.2235294, 1, 0, 1,
-0.518697, -0.717885, -1.297052, 0.2196078, 1, 0, 1,
-0.5166361, -0.9553524, -3.47979, 0.2117647, 1, 0, 1,
-0.5163052, 0.5720261, -1.60609, 0.2078431, 1, 0, 1,
-0.5150621, -0.9374976, -3.002683, 0.2, 1, 0, 1,
-0.5120379, -0.6805339, -1.984921, 0.1921569, 1, 0, 1,
-0.5019275, -0.4628962, -2.220216, 0.1882353, 1, 0, 1,
-0.4972603, 0.3261304, 0.107351, 0.1803922, 1, 0, 1,
-0.4945221, -0.6017591, -1.215968, 0.1764706, 1, 0, 1,
-0.4925639, 0.8021264, -1.200984, 0.1686275, 1, 0, 1,
-0.490861, 0.0100629, -1.484135, 0.1647059, 1, 0, 1,
-0.49036, 0.851376, -0.3593289, 0.1568628, 1, 0, 1,
-0.4875459, 0.4884145, -0.4797989, 0.1529412, 1, 0, 1,
-0.4870815, 1.936831, -0.2864147, 0.145098, 1, 0, 1,
-0.4864112, -2.303041, -2.126229, 0.1411765, 1, 0, 1,
-0.4848521, 1.500531, 0.9996946, 0.1333333, 1, 0, 1,
-0.4765769, 2.002279, 0.4723153, 0.1294118, 1, 0, 1,
-0.4752602, 0.3332092, -1.742764, 0.1215686, 1, 0, 1,
-0.4736827, -1.520769, -3.889772, 0.1176471, 1, 0, 1,
-0.4692613, -0.1346078, -1.759972, 0.1098039, 1, 0, 1,
-0.4684148, 0.368259, -1.246885, 0.1058824, 1, 0, 1,
-0.4634123, -0.6768009, -2.6808, 0.09803922, 1, 0, 1,
-0.456576, -0.8240439, -2.083523, 0.09019608, 1, 0, 1,
-0.4549692, -2.299364, -1.661304, 0.08627451, 1, 0, 1,
-0.4516498, 1.263116, 0.5054852, 0.07843138, 1, 0, 1,
-0.447942, -1.611753, -2.899239, 0.07450981, 1, 0, 1,
-0.4478283, 2.401261, -1.720699, 0.06666667, 1, 0, 1,
-0.4463538, -1.502777, -2.621849, 0.0627451, 1, 0, 1,
-0.4425943, 0.0793889, 0.07430453, 0.05490196, 1, 0, 1,
-0.4419336, 0.4377723, -1.354174, 0.05098039, 1, 0, 1,
-0.4392689, 2.106937, 1.098838, 0.04313726, 1, 0, 1,
-0.4338517, -0.4752745, -1.389015, 0.03921569, 1, 0, 1,
-0.4297518, 0.118385, -1.129471, 0.03137255, 1, 0, 1,
-0.4283387, 0.3667498, 0.830843, 0.02745098, 1, 0, 1,
-0.427471, 0.5894677, 0.4826553, 0.01960784, 1, 0, 1,
-0.4273165, 1.79178, -1.192287, 0.01568628, 1, 0, 1,
-0.4167006, 1.262727, -0.1356402, 0.007843138, 1, 0, 1,
-0.4153912, -0.6912301, -3.290048, 0.003921569, 1, 0, 1,
-0.4136375, 0.7645632, 0.6446912, 0, 1, 0.003921569, 1,
-0.4131047, 0.6277724, -1.502632, 0, 1, 0.01176471, 1,
-0.4117691, 0.5347739, -1.449259, 0, 1, 0.01568628, 1,
-0.4107876, 0.5515214, -0.3760008, 0, 1, 0.02352941, 1,
-0.4093625, -0.9547208, -2.121157, 0, 1, 0.02745098, 1,
-0.4060126, 0.01914508, -1.958435, 0, 1, 0.03529412, 1,
-0.4008508, -1.469469, -2.106111, 0, 1, 0.03921569, 1,
-0.400512, 0.9291088, 0.1120076, 0, 1, 0.04705882, 1,
-0.3989426, 1.128978, -0.1898404, 0, 1, 0.05098039, 1,
-0.3975216, 0.485113, 0.1831399, 0, 1, 0.05882353, 1,
-0.3901464, 0.1918616, -1.565947, 0, 1, 0.0627451, 1,
-0.3896882, -0.5917738, -2.304923, 0, 1, 0.07058824, 1,
-0.3885682, 0.5740731, 1.095464, 0, 1, 0.07450981, 1,
-0.3867627, -1.450716, -1.864135, 0, 1, 0.08235294, 1,
-0.3862877, -0.6144145, -2.986131, 0, 1, 0.08627451, 1,
-0.3747048, -0.6584375, -4.131321, 0, 1, 0.09411765, 1,
-0.3630859, 0.9343952, -0.9477141, 0, 1, 0.1019608, 1,
-0.3618135, 0.5457348, -2.699168, 0, 1, 0.1058824, 1,
-0.3590648, 1.038883, -0.3369995, 0, 1, 0.1137255, 1,
-0.3587252, 0.9214639, 1.96372, 0, 1, 0.1176471, 1,
-0.3513094, 1.546026, -0.1693412, 0, 1, 0.1254902, 1,
-0.3475451, 0.04907595, -0.8102252, 0, 1, 0.1294118, 1,
-0.3455324, -0.6158152, -2.911172, 0, 1, 0.1372549, 1,
-0.3426661, 1.002942, -0.1922274, 0, 1, 0.1411765, 1,
-0.3389189, -1.605233, -2.379662, 0, 1, 0.1490196, 1,
-0.3371378, 0.1537219, -1.190068, 0, 1, 0.1529412, 1,
-0.3332641, -1.028101, -3.472142, 0, 1, 0.1607843, 1,
-0.3330614, -1.285591, -1.644683, 0, 1, 0.1647059, 1,
-0.3323815, -1.070484, -3.001869, 0, 1, 0.172549, 1,
-0.3272895, -1.437018, -3.135514, 0, 1, 0.1764706, 1,
-0.3266151, -0.8250741, -3.428297, 0, 1, 0.1843137, 1,
-0.3250832, 0.4090616, -2.22246, 0, 1, 0.1882353, 1,
-0.3184851, -1.316015, -3.031575, 0, 1, 0.1960784, 1,
-0.3104385, 0.8995293, 0.8346232, 0, 1, 0.2039216, 1,
-0.3090937, -0.8214754, -3.322208, 0, 1, 0.2078431, 1,
-0.3089302, 0.1703569, -1.520649, 0, 1, 0.2156863, 1,
-0.3084032, 2.137383, -0.777648, 0, 1, 0.2196078, 1,
-0.289427, -0.3924156, -1.707531, 0, 1, 0.227451, 1,
-0.2892296, -0.7586789, -4.565952, 0, 1, 0.2313726, 1,
-0.2885826, -0.283162, -1.171561, 0, 1, 0.2392157, 1,
-0.2858241, 0.4493274, -0.2527411, 0, 1, 0.2431373, 1,
-0.2830902, -0.8664705, -2.676855, 0, 1, 0.2509804, 1,
-0.2786307, -0.09477795, -2.026284, 0, 1, 0.254902, 1,
-0.2783812, -1.94619, -0.693992, 0, 1, 0.2627451, 1,
-0.2700433, 0.9421479, -0.4074486, 0, 1, 0.2666667, 1,
-0.2683303, 0.3779526, 0.2939501, 0, 1, 0.2745098, 1,
-0.2651425, 0.3985905, -2.136269, 0, 1, 0.2784314, 1,
-0.261253, 1.141118, -1.071018, 0, 1, 0.2862745, 1,
-0.2586681, -1.299994, -2.504013, 0, 1, 0.2901961, 1,
-0.2534697, 0.6781192, -1.431511, 0, 1, 0.2980392, 1,
-0.2347343, -0.284766, -3.643404, 0, 1, 0.3058824, 1,
-0.2328898, -0.1175736, -2.713502, 0, 1, 0.3098039, 1,
-0.2270952, 0.9510739, 0.2585627, 0, 1, 0.3176471, 1,
-0.2208166, -0.5611069, -2.354414, 0, 1, 0.3215686, 1,
-0.2177633, 0.8711846, -2.00697, 0, 1, 0.3294118, 1,
-0.2149459, 0.04611816, -0.03405033, 0, 1, 0.3333333, 1,
-0.2146022, -1.08129, -3.17598, 0, 1, 0.3411765, 1,
-0.2083727, 0.6698595, 0.5622141, 0, 1, 0.345098, 1,
-0.2064419, -0.7343171, -3.786699, 0, 1, 0.3529412, 1,
-0.2011473, 0.6011891, -0.697687, 0, 1, 0.3568628, 1,
-0.1985859, -0.7821729, -3.909199, 0, 1, 0.3647059, 1,
-0.1973867, 0.5268551, 0.8658912, 0, 1, 0.3686275, 1,
-0.1944351, -1.599287, -3.342889, 0, 1, 0.3764706, 1,
-0.1836134, -0.2241129, -2.958909, 0, 1, 0.3803922, 1,
-0.1740284, 2.628639, -0.4677776, 0, 1, 0.3882353, 1,
-0.1719142, 0.1768277, 0.04128535, 0, 1, 0.3921569, 1,
-0.170889, -0.4258218, -3.287025, 0, 1, 0.4, 1,
-0.1682024, -1.229217, -2.900808, 0, 1, 0.4078431, 1,
-0.1632615, 0.648845, -0.03573239, 0, 1, 0.4117647, 1,
-0.1596318, 0.8481763, -1.397013, 0, 1, 0.4196078, 1,
-0.1548423, 0.3937587, 0.01566289, 0, 1, 0.4235294, 1,
-0.150756, 0.4315348, -1.193299, 0, 1, 0.4313726, 1,
-0.1492479, -0.7633065, -3.169628, 0, 1, 0.4352941, 1,
-0.1450541, -1.215891, -2.669301, 0, 1, 0.4431373, 1,
-0.1399096, 0.4326446, 0.2289468, 0, 1, 0.4470588, 1,
-0.1391407, 1.407787, 0.5873998, 0, 1, 0.454902, 1,
-0.1381063, 0.7005354, -1.080543, 0, 1, 0.4588235, 1,
-0.1365356, -0.9310811, -3.837981, 0, 1, 0.4666667, 1,
-0.1359707, -0.1959615, -3.342225, 0, 1, 0.4705882, 1,
-0.1353129, -1.098109, -4.400981, 0, 1, 0.4784314, 1,
-0.1290401, -0.5151725, -2.914341, 0, 1, 0.4823529, 1,
-0.1279842, 1.116812, -0.6817729, 0, 1, 0.4901961, 1,
-0.1258013, 0.6245092, -0.6644478, 0, 1, 0.4941176, 1,
-0.123911, 0.5323563, -0.5358976, 0, 1, 0.5019608, 1,
-0.1210675, -0.01826067, -2.601282, 0, 1, 0.509804, 1,
-0.1150947, -0.05394064, -2.885848, 0, 1, 0.5137255, 1,
-0.1140626, -0.5064344, -2.02612, 0, 1, 0.5215687, 1,
-0.1122204, -0.902159, -2.029851, 0, 1, 0.5254902, 1,
-0.1121026, -0.4218069, -1.762869, 0, 1, 0.5333334, 1,
-0.1075724, -1.190087, -0.4896688, 0, 1, 0.5372549, 1,
-0.1044352, -0.1547875, -2.644416, 0, 1, 0.5450981, 1,
-0.1039763, 0.664516, -1.811063, 0, 1, 0.5490196, 1,
-0.1029874, -1.212955, -3.592237, 0, 1, 0.5568628, 1,
-0.1018766, 1.846372, -0.9464018, 0, 1, 0.5607843, 1,
-0.09714323, -0.5418264, -3.806124, 0, 1, 0.5686275, 1,
-0.09498862, 0.7438346, -0.6172112, 0, 1, 0.572549, 1,
-0.0939557, 0.1770797, 0.2210139, 0, 1, 0.5803922, 1,
-0.09279359, -0.1963698, -2.229924, 0, 1, 0.5843138, 1,
-0.09092216, 0.2638455, -0.6199908, 0, 1, 0.5921569, 1,
-0.08827261, 0.2458044, -1.177439, 0, 1, 0.5960785, 1,
-0.08786663, -0.7702122, -2.992092, 0, 1, 0.6039216, 1,
-0.08680215, 0.558009, -1.44743, 0, 1, 0.6117647, 1,
-0.0863782, -0.5461579, -3.162556, 0, 1, 0.6156863, 1,
-0.0838082, 1.091001, -1.794019, 0, 1, 0.6235294, 1,
-0.07997727, 1.731588, -0.5055215, 0, 1, 0.627451, 1,
-0.0770793, -1.691124, -2.589448, 0, 1, 0.6352941, 1,
-0.077038, -0.5611079, -2.662314, 0, 1, 0.6392157, 1,
-0.07678779, -0.516503, -3.457228, 0, 1, 0.6470588, 1,
-0.07626657, -0.3821845, -2.510939, 0, 1, 0.6509804, 1,
-0.07111169, -0.2340538, -2.942424, 0, 1, 0.6588235, 1,
-0.06810508, -2.562597, -4.429031, 0, 1, 0.6627451, 1,
-0.06467626, 0.1439635, 0.6371004, 0, 1, 0.6705883, 1,
-0.06352751, 0.7463409, 2.115818, 0, 1, 0.6745098, 1,
-0.06221131, -2.141751, -1.494024, 0, 1, 0.682353, 1,
-0.06165202, 0.5313963, 1.521143, 0, 1, 0.6862745, 1,
-0.06150518, 0.2870805, -2.537958, 0, 1, 0.6941177, 1,
-0.0605927, 0.3016449, -0.9977226, 0, 1, 0.7019608, 1,
-0.05995156, -1.099806, -2.266555, 0, 1, 0.7058824, 1,
-0.05680824, -1.303105, -2.239151, 0, 1, 0.7137255, 1,
-0.0488169, 1.221326, 0.0008891894, 0, 1, 0.7176471, 1,
-0.04794915, 0.2644378, -0.800137, 0, 1, 0.7254902, 1,
-0.04400801, 0.2444615, 0.8668599, 0, 1, 0.7294118, 1,
-0.0414259, 0.2713764, 0.5707886, 0, 1, 0.7372549, 1,
-0.03739822, -0.03625561, -2.616221, 0, 1, 0.7411765, 1,
-0.03560109, -0.6471029, -3.269935, 0, 1, 0.7490196, 1,
-0.03483064, -0.07229053, -4.898283, 0, 1, 0.7529412, 1,
-0.03270254, 0.4024553, -1.019249, 0, 1, 0.7607843, 1,
-0.03047008, -0.7243188, -3.887061, 0, 1, 0.7647059, 1,
-0.01590085, 0.3695934, 0.6581229, 0, 1, 0.772549, 1,
-0.008370239, 0.219568, 0.4799902, 0, 1, 0.7764706, 1,
-0.008170133, -0.4597546, -3.902607, 0, 1, 0.7843137, 1,
-0.004961129, -1.937112, -3.584778, 0, 1, 0.7882353, 1,
-0.004171977, -0.5436857, -4.429681, 0, 1, 0.7960784, 1,
-0.0005460659, 0.2284353, 0.7681742, 0, 1, 0.8039216, 1,
0.003390801, 0.06121035, -0.4655887, 0, 1, 0.8078431, 1,
0.005907112, 0.6663631, 1.140941, 0, 1, 0.8156863, 1,
0.006994405, 0.2199633, -0.5802798, 0, 1, 0.8196079, 1,
0.00834409, -1.018533, 0.6965869, 0, 1, 0.827451, 1,
0.0111565, -0.2388985, 3.991407, 0, 1, 0.8313726, 1,
0.01132376, -0.4196391, 2.478202, 0, 1, 0.8392157, 1,
0.01305535, -1.636851, 2.770519, 0, 1, 0.8431373, 1,
0.01408617, 1.115802, -0.2286377, 0, 1, 0.8509804, 1,
0.01455206, -0.1024358, 3.602649, 0, 1, 0.854902, 1,
0.01463602, -0.3717783, 3.851851, 0, 1, 0.8627451, 1,
0.01582943, 1.70667, -0.3878873, 0, 1, 0.8666667, 1,
0.0185977, 1.846332, 0.6630136, 0, 1, 0.8745098, 1,
0.02118437, 0.1435172, -1.93327, 0, 1, 0.8784314, 1,
0.02317033, -0.922983, 4.813004, 0, 1, 0.8862745, 1,
0.02651577, -0.3421562, 3.739476, 0, 1, 0.8901961, 1,
0.03358282, -0.3878952, 2.19874, 0, 1, 0.8980392, 1,
0.0352701, 0.362555, 0.4697888, 0, 1, 0.9058824, 1,
0.03643763, 0.1037502, 0.3138672, 0, 1, 0.9098039, 1,
0.04450889, -1.042471, 2.856082, 0, 1, 0.9176471, 1,
0.04855229, 0.3969813, 0.3941373, 0, 1, 0.9215686, 1,
0.05104221, 0.7240245, 0.152618, 0, 1, 0.9294118, 1,
0.05109872, -0.5045541, 2.494736, 0, 1, 0.9333333, 1,
0.05267871, -0.7044248, 4.173496, 0, 1, 0.9411765, 1,
0.053521, 2.558927, 0.09043603, 0, 1, 0.945098, 1,
0.05387379, -0.4343208, 3.819978, 0, 1, 0.9529412, 1,
0.05684652, 0.5832908, 0.202704, 0, 1, 0.9568627, 1,
0.05751152, -0.5800822, 3.601089, 0, 1, 0.9647059, 1,
0.05978576, 1.972474, -0.3038295, 0, 1, 0.9686275, 1,
0.06506323, -1.77721, 3.879747, 0, 1, 0.9764706, 1,
0.06749804, -0.5707484, 4.932697, 0, 1, 0.9803922, 1,
0.07228051, -0.9503002, 3.951527, 0, 1, 0.9882353, 1,
0.07311559, -0.6441477, 1.875494, 0, 1, 0.9921569, 1,
0.07423121, -1.107779, 2.598317, 0, 1, 1, 1,
0.07973505, -1.560858, 2.909944, 0, 0.9921569, 1, 1,
0.08097143, -0.7770669, 4.721419, 0, 0.9882353, 1, 1,
0.0812636, 0.9710293, -0.1985075, 0, 0.9803922, 1, 1,
0.08256929, -0.4690937, 4.806734, 0, 0.9764706, 1, 1,
0.08606027, 0.9801134, 1.676499, 0, 0.9686275, 1, 1,
0.0897109, 0.8282393, -1.48096, 0, 0.9647059, 1, 1,
0.09988297, 1.233219, 1.702987, 0, 0.9568627, 1, 1,
0.09997217, 1.054431, 0.1293918, 0, 0.9529412, 1, 1,
0.1016557, 0.07054668, 0.6176162, 0, 0.945098, 1, 1,
0.1061721, -1.247262, 4.226583, 0, 0.9411765, 1, 1,
0.107189, -0.3578007, 1.99956, 0, 0.9333333, 1, 1,
0.1109506, 0.4214373, -1.054059, 0, 0.9294118, 1, 1,
0.1142314, 0.6143371, -0.7551091, 0, 0.9215686, 1, 1,
0.1175156, -1.12706, 3.655172, 0, 0.9176471, 1, 1,
0.1176345, -0.2573607, 3.174246, 0, 0.9098039, 1, 1,
0.1196782, 0.01638392, -1.233983, 0, 0.9058824, 1, 1,
0.1205935, -1.109639, 0.8696293, 0, 0.8980392, 1, 1,
0.1270079, -0.5299028, 1.148324, 0, 0.8901961, 1, 1,
0.1289335, -0.6567127, 3.462534, 0, 0.8862745, 1, 1,
0.1294614, -0.3401748, 1.257448, 0, 0.8784314, 1, 1,
0.135192, 1.481179, -0.2774077, 0, 0.8745098, 1, 1,
0.1359634, -0.3295702, 2.59228, 0, 0.8666667, 1, 1,
0.138999, 0.6789487, 1.112843, 0, 0.8627451, 1, 1,
0.153042, -1.416462, 3.553069, 0, 0.854902, 1, 1,
0.1550803, 0.6837956, -0.6778274, 0, 0.8509804, 1, 1,
0.1570096, -2.027548, 2.222267, 0, 0.8431373, 1, 1,
0.1586043, 0.5801023, -1.375746, 0, 0.8392157, 1, 1,
0.1597379, 0.3039206, 2.442095, 0, 0.8313726, 1, 1,
0.1599792, 0.6234427, -0.6664289, 0, 0.827451, 1, 1,
0.1605316, 0.1127032, 2.26826, 0, 0.8196079, 1, 1,
0.1616154, 0.9137036, -1.047285, 0, 0.8156863, 1, 1,
0.1687075, 0.2284376, 0.5125092, 0, 0.8078431, 1, 1,
0.1709464, 0.461298, 1.212855, 0, 0.8039216, 1, 1,
0.1729056, 1.130914, 0.2197219, 0, 0.7960784, 1, 1,
0.1748164, 2.337006, -0.1706975, 0, 0.7882353, 1, 1,
0.1758669, -0.5939169, 1.694376, 0, 0.7843137, 1, 1,
0.1785677, -0.03568055, 1.554101, 0, 0.7764706, 1, 1,
0.1796165, 0.1518227, 1.405508, 0, 0.772549, 1, 1,
0.1808304, 0.156672, 0.4231275, 0, 0.7647059, 1, 1,
0.1809429, -0.8991233, 2.296191, 0, 0.7607843, 1, 1,
0.182266, 0.7267053, 1.307629, 0, 0.7529412, 1, 1,
0.184857, -0.9884927, 3.890291, 0, 0.7490196, 1, 1,
0.1880846, 0.4393263, -0.3977652, 0, 0.7411765, 1, 1,
0.1928338, 0.5989601, 0.2695436, 0, 0.7372549, 1, 1,
0.1929934, -0.3712827, 1.807129, 0, 0.7294118, 1, 1,
0.1964829, 0.9911178, -0.2638472, 0, 0.7254902, 1, 1,
0.198071, -0.02785504, 1.740685, 0, 0.7176471, 1, 1,
0.2001184, 0.4986601, 1.02211, 0, 0.7137255, 1, 1,
0.2013068, -0.01496698, 2.581888, 0, 0.7058824, 1, 1,
0.201551, -0.251694, 1.68442, 0, 0.6980392, 1, 1,
0.2027266, 0.5260638, -1.476573, 0, 0.6941177, 1, 1,
0.2076339, 0.236681, 1.854741, 0, 0.6862745, 1, 1,
0.2086316, 0.5072667, 0.4952388, 0, 0.682353, 1, 1,
0.2088184, 1.856264, -1.283426, 0, 0.6745098, 1, 1,
0.2097134, -0.2194651, 2.862729, 0, 0.6705883, 1, 1,
0.2137532, -1.239343, 3.45173, 0, 0.6627451, 1, 1,
0.218838, -0.2105372, 0.6551234, 0, 0.6588235, 1, 1,
0.2188794, -0.8088618, 1.757578, 0, 0.6509804, 1, 1,
0.2257592, 1.104355, 0.88352, 0, 0.6470588, 1, 1,
0.2266427, 0.5991322, 0.4204756, 0, 0.6392157, 1, 1,
0.2388215, -0.7296325, 2.924435, 0, 0.6352941, 1, 1,
0.2389307, 0.8458152, -0.5178868, 0, 0.627451, 1, 1,
0.2404681, 0.7245748, 1.50778, 0, 0.6235294, 1, 1,
0.242207, -0.2230593, 2.750182, 0, 0.6156863, 1, 1,
0.2461513, -1.030439, 2.309702, 0, 0.6117647, 1, 1,
0.2473544, -1.01955, 1.823418, 0, 0.6039216, 1, 1,
0.2490681, 0.7129936, -1.127183, 0, 0.5960785, 1, 1,
0.2495229, -1.43361, 3.672395, 0, 0.5921569, 1, 1,
0.2504676, 0.0926281, 2.397247, 0, 0.5843138, 1, 1,
0.251734, -1.263082, 3.970908, 0, 0.5803922, 1, 1,
0.2528435, 0.2663232, 0.1319115, 0, 0.572549, 1, 1,
0.2555556, 0.07256984, 0.5867828, 0, 0.5686275, 1, 1,
0.2558558, 1.080041, 1.69353, 0, 0.5607843, 1, 1,
0.2604092, 0.8555014, 0.7362565, 0, 0.5568628, 1, 1,
0.2609938, 1.132664, -0.5522131, 0, 0.5490196, 1, 1,
0.2610539, -0.04291376, 0.9890822, 0, 0.5450981, 1, 1,
0.262402, -0.2424362, 0.7676982, 0, 0.5372549, 1, 1,
0.2663703, -1.531042, 2.068907, 0, 0.5333334, 1, 1,
0.2691661, 1.557779, 1.569044, 0, 0.5254902, 1, 1,
0.2721783, 0.475314, 0.9393337, 0, 0.5215687, 1, 1,
0.2750925, -1.512889, 4.417048, 0, 0.5137255, 1, 1,
0.2756287, -0.9112775, 5.05662, 0, 0.509804, 1, 1,
0.2756353, -1.961743, 1.645239, 0, 0.5019608, 1, 1,
0.2765744, 0.02687732, 1.952083, 0, 0.4941176, 1, 1,
0.2766433, 1.665782, 2.008002, 0, 0.4901961, 1, 1,
0.2767746, 1.787043, -0.3117679, 0, 0.4823529, 1, 1,
0.2789503, -1.164308, 3.973309, 0, 0.4784314, 1, 1,
0.2836178, -0.9763635, 1.09913, 0, 0.4705882, 1, 1,
0.283707, -0.5112236, 3.29213, 0, 0.4666667, 1, 1,
0.2843226, 0.6723751, 0.4020473, 0, 0.4588235, 1, 1,
0.285806, 0.6260574, 0.4238361, 0, 0.454902, 1, 1,
0.2881355, 0.005583836, 0.2188455, 0, 0.4470588, 1, 1,
0.2881776, -0.7250475, 1.982445, 0, 0.4431373, 1, 1,
0.2919575, 2.07699, 1.505772, 0, 0.4352941, 1, 1,
0.2948893, -0.854929, 3.700637, 0, 0.4313726, 1, 1,
0.2977176, 0.1875651, 0.922585, 0, 0.4235294, 1, 1,
0.3031923, -0.3783695, 3.120861, 0, 0.4196078, 1, 1,
0.3080902, 0.5718104, 1.258182, 0, 0.4117647, 1, 1,
0.3115724, -0.5573641, 3.650187, 0, 0.4078431, 1, 1,
0.313282, -0.529914, 3.149395, 0, 0.4, 1, 1,
0.3153786, 1.584855, 1.529497, 0, 0.3921569, 1, 1,
0.3158406, -0.6949618, 2.324849, 0, 0.3882353, 1, 1,
0.3173154, 1.014901, -0.8109867, 0, 0.3803922, 1, 1,
0.3219754, -0.9327652, 3.609315, 0, 0.3764706, 1, 1,
0.3275303, 0.8431842, 1.105646, 0, 0.3686275, 1, 1,
0.3275716, -0.2722674, 2.459877, 0, 0.3647059, 1, 1,
0.3275935, -1.306765, 4.84569, 0, 0.3568628, 1, 1,
0.3285226, 0.2170073, 1.294244, 0, 0.3529412, 1, 1,
0.3342419, -1.888443, 2.331661, 0, 0.345098, 1, 1,
0.3369267, 1.375293, 0.2241597, 0, 0.3411765, 1, 1,
0.3413244, 0.5905072, 0.07982641, 0, 0.3333333, 1, 1,
0.3413986, 0.4338976, 0.8061243, 0, 0.3294118, 1, 1,
0.3418939, -0.6958739, 1.877432, 0, 0.3215686, 1, 1,
0.3420194, 1.073531, 3.286263, 0, 0.3176471, 1, 1,
0.3452418, 0.3284935, -0.01733742, 0, 0.3098039, 1, 1,
0.3456182, 0.7466429, 1.099259, 0, 0.3058824, 1, 1,
0.3507128, -2.341886, 3.141301, 0, 0.2980392, 1, 1,
0.3699504, -0.3429924, 2.237454, 0, 0.2901961, 1, 1,
0.3722036, -0.6828341, 3.177932, 0, 0.2862745, 1, 1,
0.3764257, 1.615314, 1.866672, 0, 0.2784314, 1, 1,
0.3780139, 0.3971554, 0.8049393, 0, 0.2745098, 1, 1,
0.3795341, -0.5716057, 1.554816, 0, 0.2666667, 1, 1,
0.379812, 2.142512, -1.717242, 0, 0.2627451, 1, 1,
0.3891229, -0.5437655, 2.793994, 0, 0.254902, 1, 1,
0.38973, -0.5086703, 3.604265, 0, 0.2509804, 1, 1,
0.3899743, 0.4054942, 1.964632, 0, 0.2431373, 1, 1,
0.3937411, -1.21382, 4.060324, 0, 0.2392157, 1, 1,
0.3937936, -1.087774, 2.472719, 0, 0.2313726, 1, 1,
0.397921, 0.1668424, -0.7772454, 0, 0.227451, 1, 1,
0.3993618, 0.2404201, 0.8779997, 0, 0.2196078, 1, 1,
0.400243, 0.1009796, 1.114114, 0, 0.2156863, 1, 1,
0.4010724, 1.321136, 1.822162, 0, 0.2078431, 1, 1,
0.4040824, -0.264697, 4.45142, 0, 0.2039216, 1, 1,
0.4063495, -0.5132573, 2.23432, 0, 0.1960784, 1, 1,
0.4084457, 0.5000829, -1.300466, 0, 0.1882353, 1, 1,
0.4130689, 0.3821364, -0.4082063, 0, 0.1843137, 1, 1,
0.4131806, 0.2528335, 1.499931, 0, 0.1764706, 1, 1,
0.4141268, -1.743469, 2.926733, 0, 0.172549, 1, 1,
0.4167951, 1.10069, 0.4614691, 0, 0.1647059, 1, 1,
0.4184068, -1.219155, 3.980808, 0, 0.1607843, 1, 1,
0.4207116, 0.7769479, 0.2834788, 0, 0.1529412, 1, 1,
0.4250273, 1.210919, 0.7270283, 0, 0.1490196, 1, 1,
0.4309095, 0.7808831, -0.145254, 0, 0.1411765, 1, 1,
0.4363183, -1.53499, 3.087185, 0, 0.1372549, 1, 1,
0.4382426, -0.9297409, 1.629826, 0, 0.1294118, 1, 1,
0.4412499, 0.117562, 1.358457, 0, 0.1254902, 1, 1,
0.4438647, -1.400539, 2.394368, 0, 0.1176471, 1, 1,
0.4461708, 0.8013393, -0.0166739, 0, 0.1137255, 1, 1,
0.449487, 0.7586173, 1.782476, 0, 0.1058824, 1, 1,
0.4563085, -0.9638405, 3.276825, 0, 0.09803922, 1, 1,
0.4573096, 0.1254107, 2.348337, 0, 0.09411765, 1, 1,
0.4585531, 1.132579, -1.789582, 0, 0.08627451, 1, 1,
0.4600425, -0.5147933, 0.8965067, 0, 0.08235294, 1, 1,
0.4604941, 2.75219, 0.4077823, 0, 0.07450981, 1, 1,
0.4658904, -0.5873138, 2.152417, 0, 0.07058824, 1, 1,
0.4698069, 0.2264026, 0.628698, 0, 0.0627451, 1, 1,
0.4770015, 0.9464298, 1.256793, 0, 0.05882353, 1, 1,
0.4775627, -1.111238, 0.8615804, 0, 0.05098039, 1, 1,
0.4791712, 1.31563, 0.5332582, 0, 0.04705882, 1, 1,
0.4802163, -0.447294, 3.380257, 0, 0.03921569, 1, 1,
0.4809219, 0.6214002, 1.05995, 0, 0.03529412, 1, 1,
0.4826971, -0.1478913, 1.991227, 0, 0.02745098, 1, 1,
0.4850836, -0.9042682, 2.550891, 0, 0.02352941, 1, 1,
0.4901941, 1.51292, 0.04977832, 0, 0.01568628, 1, 1,
0.4988253, 0.08838831, 0.4502165, 0, 0.01176471, 1, 1,
0.5025084, -0.8125644, 2.351709, 0, 0.003921569, 1, 1,
0.5164292, -0.3007056, 2.217276, 0.003921569, 0, 1, 1,
0.5199256, -0.1523731, 1.595313, 0.007843138, 0, 1, 1,
0.5249571, -0.8498504, 4.85617, 0.01568628, 0, 1, 1,
0.5256673, 1.159142, 0.4081824, 0.01960784, 0, 1, 1,
0.5263442, -0.6415522, 1.484753, 0.02745098, 0, 1, 1,
0.5265614, 0.1530204, 2.898213, 0.03137255, 0, 1, 1,
0.5291682, -0.2180036, 2.337911, 0.03921569, 0, 1, 1,
0.5319161, -1.252236, 0.8175152, 0.04313726, 0, 1, 1,
0.5369429, 1.088549, -1.400761, 0.05098039, 0, 1, 1,
0.5414962, -0.3849585, 1.844522, 0.05490196, 0, 1, 1,
0.5436105, 1.60903, -1.522265, 0.0627451, 0, 1, 1,
0.5502006, -0.3970273, 2.390394, 0.06666667, 0, 1, 1,
0.5507607, -0.2005142, -0.4895608, 0.07450981, 0, 1, 1,
0.5521856, 0.569602, 0.8245582, 0.07843138, 0, 1, 1,
0.5528406, -0.5241716, 1.930542, 0.08627451, 0, 1, 1,
0.5600976, -0.9222974, 2.899092, 0.09019608, 0, 1, 1,
0.5687466, -0.7344557, 2.13939, 0.09803922, 0, 1, 1,
0.5697465, -0.2985626, 2.256833, 0.1058824, 0, 1, 1,
0.5806848, -1.147567, 3.018313, 0.1098039, 0, 1, 1,
0.5819883, 0.300767, 2.043987, 0.1176471, 0, 1, 1,
0.586045, -0.9130833, 2.34027, 0.1215686, 0, 1, 1,
0.5861201, -0.1245469, 1.378429, 0.1294118, 0, 1, 1,
0.5934166, 0.9606036, 0.9818794, 0.1333333, 0, 1, 1,
0.5934477, -1.838489, 1.578234, 0.1411765, 0, 1, 1,
0.5945987, -0.0497338, 1.953667, 0.145098, 0, 1, 1,
0.598765, 1.980548, -0.4749869, 0.1529412, 0, 1, 1,
0.5999129, -0.04271273, 0.03073765, 0.1568628, 0, 1, 1,
0.601016, -2.079133, 1.848522, 0.1647059, 0, 1, 1,
0.6040637, 0.3533004, 0.09773706, 0.1686275, 0, 1, 1,
0.6043276, 1.099722, 0.846858, 0.1764706, 0, 1, 1,
0.604641, 1.214671, 0.8588477, 0.1803922, 0, 1, 1,
0.6165214, 0.7559294, 1.625965, 0.1882353, 0, 1, 1,
0.6166726, -2.300413, 1.569641, 0.1921569, 0, 1, 1,
0.6210691, -1.271402, 1.604463, 0.2, 0, 1, 1,
0.6230779, -1.216222, 2.820238, 0.2078431, 0, 1, 1,
0.6239017, -0.666976, 2.132673, 0.2117647, 0, 1, 1,
0.628424, -0.8018625, 2.524023, 0.2196078, 0, 1, 1,
0.6357195, -0.8486744, 2.262032, 0.2235294, 0, 1, 1,
0.6384833, -1.047989, 2.391249, 0.2313726, 0, 1, 1,
0.6453441, 0.3872443, 1.561869, 0.2352941, 0, 1, 1,
0.6568061, 2.119225, 0.3163127, 0.2431373, 0, 1, 1,
0.6586227, -0.1467528, 2.008872, 0.2470588, 0, 1, 1,
0.6604882, 2.450642, -0.9046113, 0.254902, 0, 1, 1,
0.6680167, 1.241663, 1.111374, 0.2588235, 0, 1, 1,
0.6700232, -0.7089406, 2.278837, 0.2666667, 0, 1, 1,
0.6742845, -0.8021474, 2.752656, 0.2705882, 0, 1, 1,
0.6809248, 0.5723429, 0.5751178, 0.2784314, 0, 1, 1,
0.6846759, -0.1147175, 4.439139, 0.282353, 0, 1, 1,
0.6849061, -0.7743774, 2.709831, 0.2901961, 0, 1, 1,
0.6885294, 0.7595071, 0.2387381, 0.2941177, 0, 1, 1,
0.6886389, -0.2773332, 4.337692, 0.3019608, 0, 1, 1,
0.6908459, -1.181287, 3.371812, 0.3098039, 0, 1, 1,
0.6919358, -1.397595, 2.574594, 0.3137255, 0, 1, 1,
0.6919668, -1.364265, 2.619362, 0.3215686, 0, 1, 1,
0.698393, 1.641515, 1.725882, 0.3254902, 0, 1, 1,
0.7036085, -1.135716, 4.396925, 0.3333333, 0, 1, 1,
0.7052067, -0.4074001, 1.91164, 0.3372549, 0, 1, 1,
0.7053437, -0.3215569, 0.7718556, 0.345098, 0, 1, 1,
0.7084165, -0.1452495, 1.818287, 0.3490196, 0, 1, 1,
0.7111841, -0.1986132, 1.856842, 0.3568628, 0, 1, 1,
0.714061, -1.258156, 3.597205, 0.3607843, 0, 1, 1,
0.7162709, -0.1445519, 1.925042, 0.3686275, 0, 1, 1,
0.7181402, 0.5750681, 0.6555962, 0.372549, 0, 1, 1,
0.7210985, 0.3766176, 2.780959, 0.3803922, 0, 1, 1,
0.7233942, -0.6856764, 2.717279, 0.3843137, 0, 1, 1,
0.7258195, -1.089327, 3.728107, 0.3921569, 0, 1, 1,
0.7313227, 0.6265689, 2.443369, 0.3960784, 0, 1, 1,
0.7329962, -1.982652, 4.911788, 0.4039216, 0, 1, 1,
0.7332744, 0.7549021, 0.2749221, 0.4117647, 0, 1, 1,
0.7366769, -1.125887, 1.594626, 0.4156863, 0, 1, 1,
0.7378777, -0.6288372, 3.217344, 0.4235294, 0, 1, 1,
0.7395105, -1.634704, 2.190728, 0.427451, 0, 1, 1,
0.7396938, 0.7471777, 0.6018921, 0.4352941, 0, 1, 1,
0.7402617, 0.383224, 2.211382, 0.4392157, 0, 1, 1,
0.7444682, -0.2567236, 1.318568, 0.4470588, 0, 1, 1,
0.7449321, -1.203082, 4.101675, 0.4509804, 0, 1, 1,
0.7465255, -0.5401142, 1.584547, 0.4588235, 0, 1, 1,
0.7505, 2.701905, 0.5545773, 0.4627451, 0, 1, 1,
0.7562916, -0.4885508, 0.01705361, 0.4705882, 0, 1, 1,
0.7581244, 0.6616327, 2.145154, 0.4745098, 0, 1, 1,
0.7611999, 1.059877, 1.38556, 0.4823529, 0, 1, 1,
0.762352, -1.021753, 2.496777, 0.4862745, 0, 1, 1,
0.762992, 0.8282087, -0.2716945, 0.4941176, 0, 1, 1,
0.764057, 2.620645, 0.667689, 0.5019608, 0, 1, 1,
0.7673863, -0.007366122, 2.43518, 0.5058824, 0, 1, 1,
0.7760862, -0.08821952, 0.1058038, 0.5137255, 0, 1, 1,
0.7764576, -1.195126, 4.533564, 0.5176471, 0, 1, 1,
0.7865869, 0.2824647, 2.140626, 0.5254902, 0, 1, 1,
0.7889252, 0.5405895, 1.563952, 0.5294118, 0, 1, 1,
0.790095, 0.2507197, 1.460798, 0.5372549, 0, 1, 1,
0.7929847, 1.390373, 1.380482, 0.5411765, 0, 1, 1,
0.7936609, -0.0212876, 1.609345, 0.5490196, 0, 1, 1,
0.7950224, 0.2892258, 2.386216, 0.5529412, 0, 1, 1,
0.7970635, -0.2541541, 2.531475, 0.5607843, 0, 1, 1,
0.7972366, 0.2462849, 0.6378866, 0.5647059, 0, 1, 1,
0.7992262, -0.1579481, 0.9821411, 0.572549, 0, 1, 1,
0.800482, -2.097736, 3.066876, 0.5764706, 0, 1, 1,
0.8005918, 0.1628145, 1.24536, 0.5843138, 0, 1, 1,
0.8029388, 0.0460578, 0.941103, 0.5882353, 0, 1, 1,
0.8139891, -0.5956686, 4.112329, 0.5960785, 0, 1, 1,
0.8214646, 0.6773506, -0.8368967, 0.6039216, 0, 1, 1,
0.8265058, -0.5866278, 2.859463, 0.6078432, 0, 1, 1,
0.8338291, 0.1783107, -0.397384, 0.6156863, 0, 1, 1,
0.8358372, -0.2904372, 0.8199263, 0.6196079, 0, 1, 1,
0.8358806, -0.7238645, 4.034465, 0.627451, 0, 1, 1,
0.8360262, -1.198894, 3.092446, 0.6313726, 0, 1, 1,
0.8380811, 1.138383, 2.309398, 0.6392157, 0, 1, 1,
0.8455417, -2.617206, 3.269521, 0.6431373, 0, 1, 1,
0.8492343, 0.9382846, 0.7180583, 0.6509804, 0, 1, 1,
0.8499261, -0.1596063, 2.593173, 0.654902, 0, 1, 1,
0.8529838, -0.6391659, 1.95932, 0.6627451, 0, 1, 1,
0.8536713, 0.3830563, 2.256139, 0.6666667, 0, 1, 1,
0.8562801, -0.8305226, 0.9270291, 0.6745098, 0, 1, 1,
0.8567741, -0.3126294, 2.24837, 0.6784314, 0, 1, 1,
0.8654408, 1.039835, -0.1480342, 0.6862745, 0, 1, 1,
0.8657088, -1.548184, 2.481995, 0.6901961, 0, 1, 1,
0.86633, -0.3952295, 4.244165, 0.6980392, 0, 1, 1,
0.8760969, -0.03634634, 1.918518, 0.7058824, 0, 1, 1,
0.8775108, 0.1959073, 2.948009, 0.7098039, 0, 1, 1,
0.8803185, 1.625597, 0.9305636, 0.7176471, 0, 1, 1,
0.8844678, 1.432699, -0.2823689, 0.7215686, 0, 1, 1,
0.8877829, -0.532927, 2.016419, 0.7294118, 0, 1, 1,
0.8890747, -1.473184, 4.556159, 0.7333333, 0, 1, 1,
0.9025449, 1.352075, 0.4286944, 0.7411765, 0, 1, 1,
0.9045057, -0.4391301, 3.397933, 0.7450981, 0, 1, 1,
0.9066778, -0.9785904, 1.679361, 0.7529412, 0, 1, 1,
0.908385, -0.9155052, 3.602183, 0.7568628, 0, 1, 1,
0.9102605, -0.9972792, 3.043219, 0.7647059, 0, 1, 1,
0.9121713, -0.2347016, 2.075403, 0.7686275, 0, 1, 1,
0.9178686, -0.699793, 3.249705, 0.7764706, 0, 1, 1,
0.9179233, -0.3859341, 2.545098, 0.7803922, 0, 1, 1,
0.9239727, -0.9150314, 2.550288, 0.7882353, 0, 1, 1,
0.927458, 0.4160828, 1.554906, 0.7921569, 0, 1, 1,
0.934016, -0.7030131, 2.489259, 0.8, 0, 1, 1,
0.936388, -0.2851555, -0.1552631, 0.8078431, 0, 1, 1,
0.9391558, -0.740732, 3.025913, 0.8117647, 0, 1, 1,
0.9422508, -0.8063712, 1.580033, 0.8196079, 0, 1, 1,
0.9429458, -0.08513433, 2.047398, 0.8235294, 0, 1, 1,
0.9453306, -0.6901933, -0.752343, 0.8313726, 0, 1, 1,
0.9481402, -0.7575748, 1.703607, 0.8352941, 0, 1, 1,
0.9485576, -0.1997169, 2.931066, 0.8431373, 0, 1, 1,
0.9523767, 0.6144882, 0.9595315, 0.8470588, 0, 1, 1,
0.9524229, -2.268628, 1.630773, 0.854902, 0, 1, 1,
0.9542506, 1.330271, -0.7476813, 0.8588235, 0, 1, 1,
0.9548307, -1.511469, 2.996431, 0.8666667, 0, 1, 1,
0.9597651, 1.81353, -0.03481052, 0.8705882, 0, 1, 1,
0.9616904, 0.8838446, 0.7455903, 0.8784314, 0, 1, 1,
0.9674803, -0.06749696, 1.188099, 0.8823529, 0, 1, 1,
0.9716852, 0.553648, 1.903276, 0.8901961, 0, 1, 1,
0.9771984, 0.1688575, -0.0627132, 0.8941177, 0, 1, 1,
0.9801735, 1.595551, -0.7123911, 0.9019608, 0, 1, 1,
0.9835671, -1.238121, 1.264618, 0.9098039, 0, 1, 1,
0.9877008, -0.490943, 0.791387, 0.9137255, 0, 1, 1,
0.9998673, -0.8749211, 1.538017, 0.9215686, 0, 1, 1,
1.00036, 1.359371, 1.088153, 0.9254902, 0, 1, 1,
1.003625, -1.545575, 1.384939, 0.9333333, 0, 1, 1,
1.018804, -0.09834799, 1.473447, 0.9372549, 0, 1, 1,
1.027653, 0.4584222, 1.159592, 0.945098, 0, 1, 1,
1.030406, -0.6865362, 1.885111, 0.9490196, 0, 1, 1,
1.039293, -1.176087, 3.384925, 0.9568627, 0, 1, 1,
1.042746, 0.8120963, 2.700654, 0.9607843, 0, 1, 1,
1.04473, -0.4322478, 2.788981, 0.9686275, 0, 1, 1,
1.045169, 1.054635, 2.549109, 0.972549, 0, 1, 1,
1.056059, 0.9921345, 0.6407115, 0.9803922, 0, 1, 1,
1.058619, 0.7556311, 0.6886761, 0.9843137, 0, 1, 1,
1.058803, -0.660628, 1.983834, 0.9921569, 0, 1, 1,
1.063909, -0.3500721, 2.17024, 0.9960784, 0, 1, 1,
1.066897, 0.63496, -1.162351, 1, 0, 0.9960784, 1,
1.068816, -0.09245726, 1.898544, 1, 0, 0.9882353, 1,
1.078112, 0.7918541, 1.75874, 1, 0, 0.9843137, 1,
1.078616, -0.4717673, 1.967501, 1, 0, 0.9764706, 1,
1.079138, -0.8524994, 1.717639, 1, 0, 0.972549, 1,
1.082637, -1.119906, 3.832777, 1, 0, 0.9647059, 1,
1.08576, -0.5547343, 3.582465, 1, 0, 0.9607843, 1,
1.086469, 0.9806421, 1.384935, 1, 0, 0.9529412, 1,
1.08777, -0.2880834, 2.490618, 1, 0, 0.9490196, 1,
1.091726, -0.3322318, 1.13536, 1, 0, 0.9411765, 1,
1.097822, -0.740257, 3.092629, 1, 0, 0.9372549, 1,
1.103246, 1.088045, -0.9496306, 1, 0, 0.9294118, 1,
1.103259, 0.1748623, -0.4739624, 1, 0, 0.9254902, 1,
1.11289, -3.005669, 3.599644, 1, 0, 0.9176471, 1,
1.113179, -0.7324125, 2.023117, 1, 0, 0.9137255, 1,
1.115088, -1.067029, 2.679308, 1, 0, 0.9058824, 1,
1.125005, 1.162358, 3.284107, 1, 0, 0.9019608, 1,
1.129906, 0.5237609, 2.686964, 1, 0, 0.8941177, 1,
1.133934, -0.9142414, 1.576929, 1, 0, 0.8862745, 1,
1.136623, 1.954917, -0.3267547, 1, 0, 0.8823529, 1,
1.143672, -0.0567152, 1.91901, 1, 0, 0.8745098, 1,
1.144731, -1.433654, 4.513292, 1, 0, 0.8705882, 1,
1.156695, 0.4143213, 0.5088953, 1, 0, 0.8627451, 1,
1.159921, -0.02508337, 1.879488, 1, 0, 0.8588235, 1,
1.161831, -0.9461224, 1.709413, 1, 0, 0.8509804, 1,
1.163015, 1.124976, -1.083454, 1, 0, 0.8470588, 1,
1.17125, 0.6796228, -0.1917108, 1, 0, 0.8392157, 1,
1.175228, 0.6351117, 2.007802, 1, 0, 0.8352941, 1,
1.178838, 0.1389054, 1.498756, 1, 0, 0.827451, 1,
1.179098, -0.02615812, 0.5668673, 1, 0, 0.8235294, 1,
1.179466, 0.4330589, 3.123091, 1, 0, 0.8156863, 1,
1.185172, -0.6628218, 1.15079, 1, 0, 0.8117647, 1,
1.192945, -0.8364083, 2.042432, 1, 0, 0.8039216, 1,
1.193445, 0.5457324, -0.4109814, 1, 0, 0.7960784, 1,
1.194818, 1.0967, -0.4190776, 1, 0, 0.7921569, 1,
1.196356, 0.4178935, 2.198247, 1, 0, 0.7843137, 1,
1.198191, -1.009333, 2.954421, 1, 0, 0.7803922, 1,
1.200675, -0.2997397, 1.503529, 1, 0, 0.772549, 1,
1.208017, 2.00214, 0.7030685, 1, 0, 0.7686275, 1,
1.21003, -0.610942, -0.8233531, 1, 0, 0.7607843, 1,
1.212041, 0.4338154, 1.28913, 1, 0, 0.7568628, 1,
1.213549, 0.3854876, 0.9345679, 1, 0, 0.7490196, 1,
1.222198, 0.2002985, 3.297559, 1, 0, 0.7450981, 1,
1.222269, 0.6957287, 0.8305029, 1, 0, 0.7372549, 1,
1.228969, 0.6328256, 1.573539, 1, 0, 0.7333333, 1,
1.235699, 0.07941365, 0.9789432, 1, 0, 0.7254902, 1,
1.237346, -0.4512033, 0.6473041, 1, 0, 0.7215686, 1,
1.238765, -0.35074, 2.675902, 1, 0, 0.7137255, 1,
1.251806, -0.3898038, 3.836128, 1, 0, 0.7098039, 1,
1.257997, 2.109894, 1.545884, 1, 0, 0.7019608, 1,
1.267686, -0.4118738, 0.8957793, 1, 0, 0.6941177, 1,
1.273905, 1.442461, 0.3661152, 1, 0, 0.6901961, 1,
1.285549, -0.9238275, 1.793152, 1, 0, 0.682353, 1,
1.293963, 1.174581, 2.206447, 1, 0, 0.6784314, 1,
1.294971, -1.184413, 2.116233, 1, 0, 0.6705883, 1,
1.297834, -0.8231436, 1.744469, 1, 0, 0.6666667, 1,
1.304423, 0.1224744, 1.702442, 1, 0, 0.6588235, 1,
1.314647, 0.3066942, 1.598557, 1, 0, 0.654902, 1,
1.319223, 1.010324, -0.0356237, 1, 0, 0.6470588, 1,
1.319599, 1.446298, 2.399711, 1, 0, 0.6431373, 1,
1.319905, 0.7688264, -0.5896847, 1, 0, 0.6352941, 1,
1.32126, -0.2301717, 2.117942, 1, 0, 0.6313726, 1,
1.32449, -1.533913, 2.901007, 1, 0, 0.6235294, 1,
1.335685, -0.4120123, 1.350395, 1, 0, 0.6196079, 1,
1.337721, 0.813018, 0.8527986, 1, 0, 0.6117647, 1,
1.338513, -0.9408847, 2.136989, 1, 0, 0.6078432, 1,
1.340412, -0.2790607, 0.6230696, 1, 0, 0.6, 1,
1.342937, 1.117077, 1.266095, 1, 0, 0.5921569, 1,
1.356826, -0.1906458, 0.6947236, 1, 0, 0.5882353, 1,
1.357415, -1.324688, 1.991935, 1, 0, 0.5803922, 1,
1.368002, 1.958463, 0.5136925, 1, 0, 0.5764706, 1,
1.372348, -0.3222877, 0.6741984, 1, 0, 0.5686275, 1,
1.376274, -0.07400493, 3.281647, 1, 0, 0.5647059, 1,
1.38409, -0.2214884, 2.29758, 1, 0, 0.5568628, 1,
1.385978, 0.1818102, 0.6777338, 1, 0, 0.5529412, 1,
1.391854, 0.3665313, 0.6668575, 1, 0, 0.5450981, 1,
1.393803, 0.9118836, 1.89407, 1, 0, 0.5411765, 1,
1.399386, -0.6326203, 3.074116, 1, 0, 0.5333334, 1,
1.403665, 0.2506998, 1.374638, 1, 0, 0.5294118, 1,
1.403847, -0.3545026, 2.100981, 1, 0, 0.5215687, 1,
1.41253, 1.793379, 0.3274305, 1, 0, 0.5176471, 1,
1.417058, -0.3803644, 0.8854766, 1, 0, 0.509804, 1,
1.42752, -1.555392, 4.512293, 1, 0, 0.5058824, 1,
1.432657, 1.58733, 0.9854059, 1, 0, 0.4980392, 1,
1.432751, 0.5982559, 1.896918, 1, 0, 0.4901961, 1,
1.437253, 0.03738258, 2.763409, 1, 0, 0.4862745, 1,
1.440099, 1.427697, 0.368601, 1, 0, 0.4784314, 1,
1.440593, -0.5960006, 2.414096, 1, 0, 0.4745098, 1,
1.445703, -0.9687364, 1.832776, 1, 0, 0.4666667, 1,
1.456939, 0.7393969, 1.515503, 1, 0, 0.4627451, 1,
1.463322, 1.962362, 0.3240747, 1, 0, 0.454902, 1,
1.466328, -0.6161761, 1.661724, 1, 0, 0.4509804, 1,
1.469205, -2.201834, 2.876154, 1, 0, 0.4431373, 1,
1.472406, 1.363407, 0.8852528, 1, 0, 0.4392157, 1,
1.48066, 1.650619, 0.6161252, 1, 0, 0.4313726, 1,
1.480755, -1.411956, 1.233739, 1, 0, 0.427451, 1,
1.498008, -0.336284, 1.231896, 1, 0, 0.4196078, 1,
1.512432, -0.4447985, 2.25504, 1, 0, 0.4156863, 1,
1.531359, 0.6136035, 0.9248246, 1, 0, 0.4078431, 1,
1.536107, -0.8124085, 2.032945, 1, 0, 0.4039216, 1,
1.538503, 0.8897344, 1.708146, 1, 0, 0.3960784, 1,
1.544263, -1.07965, 2.370776, 1, 0, 0.3882353, 1,
1.546219, -1.353761, 4.500533, 1, 0, 0.3843137, 1,
1.558758, 2.46055, -0.5884892, 1, 0, 0.3764706, 1,
1.564151, 0.04864482, 2.19648, 1, 0, 0.372549, 1,
1.566312, -0.2683169, 1.34249, 1, 0, 0.3647059, 1,
1.572194, -0.1514356, 2.649763, 1, 0, 0.3607843, 1,
1.573607, 1.474487, 0.9162301, 1, 0, 0.3529412, 1,
1.580487, 1.099704, 2.054537, 1, 0, 0.3490196, 1,
1.598117, -2.64848, 4.170185, 1, 0, 0.3411765, 1,
1.59832, 0.9381605, 0.365985, 1, 0, 0.3372549, 1,
1.605595, -0.1370254, 0.07683741, 1, 0, 0.3294118, 1,
1.605996, 1.462273, 1.142128, 1, 0, 0.3254902, 1,
1.609912, -0.06245318, 0.3910879, 1, 0, 0.3176471, 1,
1.618858, -0.1361549, 2.006066, 1, 0, 0.3137255, 1,
1.621316, -1.733314, 1.709488, 1, 0, 0.3058824, 1,
1.638495, 3.09043, 1.527453, 1, 0, 0.2980392, 1,
1.646622, -0.9533052, 2.312243, 1, 0, 0.2941177, 1,
1.654241, -0.02819922, -2.160974, 1, 0, 0.2862745, 1,
1.677576, -1.964852, 2.116814, 1, 0, 0.282353, 1,
1.689057, -1.298602, 2.60783, 1, 0, 0.2745098, 1,
1.69298, -1.395042, 1.760657, 1, 0, 0.2705882, 1,
1.706788, -1.496106, 2.143661, 1, 0, 0.2627451, 1,
1.729022, -0.6373054, 2.693904, 1, 0, 0.2588235, 1,
1.768727, 0.7868685, 1.63341, 1, 0, 0.2509804, 1,
1.788526, 0.03551579, 3.152516, 1, 0, 0.2470588, 1,
1.795232, -1.461781, 1.781003, 1, 0, 0.2392157, 1,
1.807577, 0.421891, -0.4497502, 1, 0, 0.2352941, 1,
1.820238, -0.3261708, 1.988871, 1, 0, 0.227451, 1,
1.82149, -0.4608667, 2.140569, 1, 0, 0.2235294, 1,
1.822294, 1.851953, -0.5038401, 1, 0, 0.2156863, 1,
1.860362, -0.9527639, 1.390283, 1, 0, 0.2117647, 1,
1.862287, -1.484835, 2.949686, 1, 0, 0.2039216, 1,
1.878902, 0.2181394, 3.145804, 1, 0, 0.1960784, 1,
1.880112, -1.028679, 3.686238, 1, 0, 0.1921569, 1,
1.890503, 0.7441144, 1.554515, 1, 0, 0.1843137, 1,
1.890812, -0.4401724, 2.317775, 1, 0, 0.1803922, 1,
1.89294, 0.4152385, 1.261969, 1, 0, 0.172549, 1,
1.89667, -0.4853886, 1.40625, 1, 0, 0.1686275, 1,
1.911468, -1.713052, 4.365612, 1, 0, 0.1607843, 1,
1.967378, 0.4215508, 1.911065, 1, 0, 0.1568628, 1,
1.96843, -0.1337869, 1.028227, 1, 0, 0.1490196, 1,
1.975423, 0.1313117, 1.354555, 1, 0, 0.145098, 1,
1.976458, -0.8829002, 2.06443, 1, 0, 0.1372549, 1,
2.000037, 1.135483, 1.936291, 1, 0, 0.1333333, 1,
2.037348, 0.08296791, 1.111147, 1, 0, 0.1254902, 1,
2.042274, 1.568154, 1.763788, 1, 0, 0.1215686, 1,
2.061853, -1.334533, 2.440158, 1, 0, 0.1137255, 1,
2.079141, -0.7311122, 0.6075795, 1, 0, 0.1098039, 1,
2.163183, -0.1548817, 3.41815, 1, 0, 0.1019608, 1,
2.184994, -0.9526358, 2.257897, 1, 0, 0.09411765, 1,
2.187446, -0.1682412, 1.722319, 1, 0, 0.09019608, 1,
2.205563, 2.620573, 2.116493, 1, 0, 0.08235294, 1,
2.214051, 0.4269533, 1.359997, 1, 0, 0.07843138, 1,
2.217515, 0.8316833, 1.474252, 1, 0, 0.07058824, 1,
2.218513, -0.4695706, 1.477747, 1, 0, 0.06666667, 1,
2.298385, -0.4121706, 2.638468, 1, 0, 0.05882353, 1,
2.307555, 0.4660949, 0.8477276, 1, 0, 0.05490196, 1,
2.311372, -0.2881689, 0.8119688, 1, 0, 0.04705882, 1,
2.33437, -0.1725481, 1.589963, 1, 0, 0.04313726, 1,
2.416629, 0.5061855, 1.37201, 1, 0, 0.03529412, 1,
2.726018, 1.179323, 0.9190832, 1, 0, 0.03137255, 1,
2.912598, 0.9375324, 1.580244, 1, 0, 0.02352941, 1,
3.071876, -2.64886, 2.771337, 1, 0, 0.01960784, 1,
3.150524, -0.08397263, 1.05147, 1, 0, 0.01176471, 1,
3.176135, -0.2962576, 2.363795, 1, 0, 0.007843138, 1
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
0.02399707, -4.038958, -6.597128, 0, -0.5, 0.5, 0.5,
0.02399707, -4.038958, -6.597128, 1, -0.5, 0.5, 0.5,
0.02399707, -4.038958, -6.597128, 1, 1.5, 0.5, 0.5,
0.02399707, -4.038958, -6.597128, 0, 1.5, 0.5, 0.5
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
-4.196715, 0.04238081, -6.597128, 0, -0.5, 0.5, 0.5,
-4.196715, 0.04238081, -6.597128, 1, -0.5, 0.5, 0.5,
-4.196715, 0.04238081, -6.597128, 1, 1.5, 0.5, 0.5,
-4.196715, 0.04238081, -6.597128, 0, 1.5, 0.5, 0.5
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
-4.196715, -4.038958, 0.07425642, 0, -0.5, 0.5, 0.5,
-4.196715, -4.038958, 0.07425642, 1, -0.5, 0.5, 0.5,
-4.196715, -4.038958, 0.07425642, 1, 1.5, 0.5, 0.5,
-4.196715, -4.038958, 0.07425642, 0, 1.5, 0.5, 0.5
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
-3, -3.09711, -5.057578,
3, -3.09711, -5.057578,
-3, -3.09711, -5.057578,
-3, -3.254085, -5.314169,
-2, -3.09711, -5.057578,
-2, -3.254085, -5.314169,
-1, -3.09711, -5.057578,
-1, -3.254085, -5.314169,
0, -3.09711, -5.057578,
0, -3.254085, -5.314169,
1, -3.09711, -5.057578,
1, -3.254085, -5.314169,
2, -3.09711, -5.057578,
2, -3.254085, -5.314169,
3, -3.09711, -5.057578,
3, -3.254085, -5.314169
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
-3, -3.568034, -5.827353, 0, -0.5, 0.5, 0.5,
-3, -3.568034, -5.827353, 1, -0.5, 0.5, 0.5,
-3, -3.568034, -5.827353, 1, 1.5, 0.5, 0.5,
-3, -3.568034, -5.827353, 0, 1.5, 0.5, 0.5,
-2, -3.568034, -5.827353, 0, -0.5, 0.5, 0.5,
-2, -3.568034, -5.827353, 1, -0.5, 0.5, 0.5,
-2, -3.568034, -5.827353, 1, 1.5, 0.5, 0.5,
-2, -3.568034, -5.827353, 0, 1.5, 0.5, 0.5,
-1, -3.568034, -5.827353, 0, -0.5, 0.5, 0.5,
-1, -3.568034, -5.827353, 1, -0.5, 0.5, 0.5,
-1, -3.568034, -5.827353, 1, 1.5, 0.5, 0.5,
-1, -3.568034, -5.827353, 0, 1.5, 0.5, 0.5,
0, -3.568034, -5.827353, 0, -0.5, 0.5, 0.5,
0, -3.568034, -5.827353, 1, -0.5, 0.5, 0.5,
0, -3.568034, -5.827353, 1, 1.5, 0.5, 0.5,
0, -3.568034, -5.827353, 0, 1.5, 0.5, 0.5,
1, -3.568034, -5.827353, 0, -0.5, 0.5, 0.5,
1, -3.568034, -5.827353, 1, -0.5, 0.5, 0.5,
1, -3.568034, -5.827353, 1, 1.5, 0.5, 0.5,
1, -3.568034, -5.827353, 0, 1.5, 0.5, 0.5,
2, -3.568034, -5.827353, 0, -0.5, 0.5, 0.5,
2, -3.568034, -5.827353, 1, -0.5, 0.5, 0.5,
2, -3.568034, -5.827353, 1, 1.5, 0.5, 0.5,
2, -3.568034, -5.827353, 0, 1.5, 0.5, 0.5,
3, -3.568034, -5.827353, 0, -0.5, 0.5, 0.5,
3, -3.568034, -5.827353, 1, -0.5, 0.5, 0.5,
3, -3.568034, -5.827353, 1, 1.5, 0.5, 0.5,
3, -3.568034, -5.827353, 0, 1.5, 0.5, 0.5
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
-3.222705, -3, -5.057578,
-3.222705, 3, -5.057578,
-3.222705, -3, -5.057578,
-3.38504, -3, -5.314169,
-3.222705, -2, -5.057578,
-3.38504, -2, -5.314169,
-3.222705, -1, -5.057578,
-3.38504, -1, -5.314169,
-3.222705, 0, -5.057578,
-3.38504, 0, -5.314169,
-3.222705, 1, -5.057578,
-3.38504, 1, -5.314169,
-3.222705, 2, -5.057578,
-3.38504, 2, -5.314169,
-3.222705, 3, -5.057578,
-3.38504, 3, -5.314169
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
-3.70971, -3, -5.827353, 0, -0.5, 0.5, 0.5,
-3.70971, -3, -5.827353, 1, -0.5, 0.5, 0.5,
-3.70971, -3, -5.827353, 1, 1.5, 0.5, 0.5,
-3.70971, -3, -5.827353, 0, 1.5, 0.5, 0.5,
-3.70971, -2, -5.827353, 0, -0.5, 0.5, 0.5,
-3.70971, -2, -5.827353, 1, -0.5, 0.5, 0.5,
-3.70971, -2, -5.827353, 1, 1.5, 0.5, 0.5,
-3.70971, -2, -5.827353, 0, 1.5, 0.5, 0.5,
-3.70971, -1, -5.827353, 0, -0.5, 0.5, 0.5,
-3.70971, -1, -5.827353, 1, -0.5, 0.5, 0.5,
-3.70971, -1, -5.827353, 1, 1.5, 0.5, 0.5,
-3.70971, -1, -5.827353, 0, 1.5, 0.5, 0.5,
-3.70971, 0, -5.827353, 0, -0.5, 0.5, 0.5,
-3.70971, 0, -5.827353, 1, -0.5, 0.5, 0.5,
-3.70971, 0, -5.827353, 1, 1.5, 0.5, 0.5,
-3.70971, 0, -5.827353, 0, 1.5, 0.5, 0.5,
-3.70971, 1, -5.827353, 0, -0.5, 0.5, 0.5,
-3.70971, 1, -5.827353, 1, -0.5, 0.5, 0.5,
-3.70971, 1, -5.827353, 1, 1.5, 0.5, 0.5,
-3.70971, 1, -5.827353, 0, 1.5, 0.5, 0.5,
-3.70971, 2, -5.827353, 0, -0.5, 0.5, 0.5,
-3.70971, 2, -5.827353, 1, -0.5, 0.5, 0.5,
-3.70971, 2, -5.827353, 1, 1.5, 0.5, 0.5,
-3.70971, 2, -5.827353, 0, 1.5, 0.5, 0.5,
-3.70971, 3, -5.827353, 0, -0.5, 0.5, 0.5,
-3.70971, 3, -5.827353, 1, -0.5, 0.5, 0.5,
-3.70971, 3, -5.827353, 1, 1.5, 0.5, 0.5,
-3.70971, 3, -5.827353, 0, 1.5, 0.5, 0.5
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
-3.222705, -3.09711, -4,
-3.222705, -3.09711, 4,
-3.222705, -3.09711, -4,
-3.38504, -3.254085, -4,
-3.222705, -3.09711, -2,
-3.38504, -3.254085, -2,
-3.222705, -3.09711, 0,
-3.38504, -3.254085, 0,
-3.222705, -3.09711, 2,
-3.38504, -3.254085, 2,
-3.222705, -3.09711, 4,
-3.38504, -3.254085, 4
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
-3.70971, -3.568034, -4, 0, -0.5, 0.5, 0.5,
-3.70971, -3.568034, -4, 1, -0.5, 0.5, 0.5,
-3.70971, -3.568034, -4, 1, 1.5, 0.5, 0.5,
-3.70971, -3.568034, -4, 0, 1.5, 0.5, 0.5,
-3.70971, -3.568034, -2, 0, -0.5, 0.5, 0.5,
-3.70971, -3.568034, -2, 1, -0.5, 0.5, 0.5,
-3.70971, -3.568034, -2, 1, 1.5, 0.5, 0.5,
-3.70971, -3.568034, -2, 0, 1.5, 0.5, 0.5,
-3.70971, -3.568034, 0, 0, -0.5, 0.5, 0.5,
-3.70971, -3.568034, 0, 1, -0.5, 0.5, 0.5,
-3.70971, -3.568034, 0, 1, 1.5, 0.5, 0.5,
-3.70971, -3.568034, 0, 0, 1.5, 0.5, 0.5,
-3.70971, -3.568034, 2, 0, -0.5, 0.5, 0.5,
-3.70971, -3.568034, 2, 1, -0.5, 0.5, 0.5,
-3.70971, -3.568034, 2, 1, 1.5, 0.5, 0.5,
-3.70971, -3.568034, 2, 0, 1.5, 0.5, 0.5,
-3.70971, -3.568034, 4, 0, -0.5, 0.5, 0.5,
-3.70971, -3.568034, 4, 1, -0.5, 0.5, 0.5,
-3.70971, -3.568034, 4, 1, 1.5, 0.5, 0.5,
-3.70971, -3.568034, 4, 0, 1.5, 0.5, 0.5
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
-3.222705, -3.09711, -5.057578,
-3.222705, 3.181872, -5.057578,
-3.222705, -3.09711, 5.20609,
-3.222705, 3.181872, 5.20609,
-3.222705, -3.09711, -5.057578,
-3.222705, -3.09711, 5.20609,
-3.222705, 3.181872, -5.057578,
-3.222705, 3.181872, 5.20609,
-3.222705, -3.09711, -5.057578,
3.270699, -3.09711, -5.057578,
-3.222705, -3.09711, 5.20609,
3.270699, -3.09711, 5.20609,
-3.222705, 3.181872, -5.057578,
3.270699, 3.181872, -5.057578,
-3.222705, 3.181872, 5.20609,
3.270699, 3.181872, 5.20609,
3.270699, -3.09711, -5.057578,
3.270699, 3.181872, -5.057578,
3.270699, -3.09711, 5.20609,
3.270699, 3.181872, 5.20609,
3.270699, -3.09711, -5.057578,
3.270699, -3.09711, 5.20609,
3.270699, 3.181872, -5.057578,
3.270699, 3.181872, 5.20609
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
var radius = 7.300762;
var distance = 32.48192;
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
mvMatrix.translate( -0.02399707, -0.04238081, -0.07425642 );
mvMatrix.scale( 1.215653, 1.257167, 0.7690942 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.48192);
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
Phenylacetonitril<-read.table("Phenylacetonitril.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenylacetonitril$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetonitril' not found
```

```r
y<-Phenylacetonitril$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetonitril' not found
```

```r
z<-Phenylacetonitril$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenylacetonitril' not found
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
-3.12814, 0.8465, -1.25486, 0, 0, 1, 1, 1,
-2.828219, -0.1146295, -1.129455, 1, 0, 0, 1, 1,
-2.800406, 0.6189657, -1.948385, 1, 0, 0, 1, 1,
-2.750082, -1.958434, -0.7390488, 1, 0, 0, 1, 1,
-2.6248, -0.9591091, -4.460647, 1, 0, 0, 1, 1,
-2.623233, 1.615404, -1.97552, 1, 0, 0, 1, 1,
-2.611817, -1.651378, -3.008113, 0, 0, 0, 1, 1,
-2.442199, 1.599044, -1.158473, 0, 0, 0, 1, 1,
-2.369015, -0.5141867, -0.6808496, 0, 0, 0, 1, 1,
-2.363995, 0.5329381, -0.3795949, 0, 0, 0, 1, 1,
-2.300092, -0.5140969, -1.24651, 0, 0, 0, 1, 1,
-2.271374, 1.128561, -1.071758, 0, 0, 0, 1, 1,
-2.271239, -1.162707, -2.125954, 0, 0, 0, 1, 1,
-2.242181, -0.2115787, -2.910227, 1, 1, 1, 1, 1,
-2.238207, 0.2995972, -0.6804482, 1, 1, 1, 1, 1,
-2.206546, 1.106424, -0.6636968, 1, 1, 1, 1, 1,
-2.185932, -0.2832166, -3.023543, 1, 1, 1, 1, 1,
-2.176318, -0.4280754, -2.036086, 1, 1, 1, 1, 1,
-2.150183, 2.079655, -0.555563, 1, 1, 1, 1, 1,
-2.146055, 1.466947, -1.306713, 1, 1, 1, 1, 1,
-2.145073, -2.005997, -2.639339, 1, 1, 1, 1, 1,
-2.114065, -1.787092, -1.653025, 1, 1, 1, 1, 1,
-2.109783, -0.2645743, -2.207938, 1, 1, 1, 1, 1,
-2.062096, -1.197395, -2.19938, 1, 1, 1, 1, 1,
-2.056562, 2.488387, -0.5237519, 1, 1, 1, 1, 1,
-2.048953, -0.3916002, -2.468216, 1, 1, 1, 1, 1,
-2.036331, 0.8467541, 0.9235953, 1, 1, 1, 1, 1,
-2.005022, -0.2973554, -2.317909, 1, 1, 1, 1, 1,
-1.982679, 0.5079824, -2.491944, 0, 0, 1, 1, 1,
-1.978298, -1.789738, -0.6748275, 1, 0, 0, 1, 1,
-1.977615, -0.9358625, -2.93201, 1, 0, 0, 1, 1,
-1.943359, 1.905546, -0.6080799, 1, 0, 0, 1, 1,
-1.926482, -0.888661, -2.52041, 1, 0, 0, 1, 1,
-1.926428, -1.641341, -2.076096, 1, 0, 0, 1, 1,
-1.925128, 0.8314045, -1.393782, 0, 0, 0, 1, 1,
-1.913803, 0.6086784, 0.09589577, 0, 0, 0, 1, 1,
-1.868261, -1.064404, -2.20395, 0, 0, 0, 1, 1,
-1.828073, 0.7056264, -0.62516, 0, 0, 0, 1, 1,
-1.827088, 0.1517925, -0.6652217, 0, 0, 0, 1, 1,
-1.814442, 1.205042, -1.070117, 0, 0, 0, 1, 1,
-1.807516, 0.1101414, -2.04232, 0, 0, 0, 1, 1,
-1.787484, 1.206836, -2.838093, 1, 1, 1, 1, 1,
-1.782257, -0.4426016, -1.087073, 1, 1, 1, 1, 1,
-1.779103, -1.298378, -0.5676809, 1, 1, 1, 1, 1,
-1.753282, -0.9094919, -3.558798, 1, 1, 1, 1, 1,
-1.742306, -0.5268699, -2.905233, 1, 1, 1, 1, 1,
-1.735283, -0.4768476, -2.059317, 1, 1, 1, 1, 1,
-1.734136, -0.1762842, -1.739584, 1, 1, 1, 1, 1,
-1.707099, -0.4340654, -2.281708, 1, 1, 1, 1, 1,
-1.685876, 1.155048, -2.164003, 1, 1, 1, 1, 1,
-1.656428, 0.8429096, -0.8241191, 1, 1, 1, 1, 1,
-1.618826, 2.534983, 0.4020806, 1, 1, 1, 1, 1,
-1.600949, -1.418882, -2.43727, 1, 1, 1, 1, 1,
-1.586255, 0.1984511, -2.419416, 1, 1, 1, 1, 1,
-1.58437, 0.6255559, -2.066769, 1, 1, 1, 1, 1,
-1.57546, -0.833957, -1.845888, 1, 1, 1, 1, 1,
-1.574899, -1.624376, -1.912907, 0, 0, 1, 1, 1,
-1.572386, 1.302433, -0.3028472, 1, 0, 0, 1, 1,
-1.569717, 0.8293758, -1.569649, 1, 0, 0, 1, 1,
-1.560727, -0.6063384, -2.059101, 1, 0, 0, 1, 1,
-1.547314, -1.025084, -2.965228, 1, 0, 0, 1, 1,
-1.540318, -2.521865, -0.6639331, 1, 0, 0, 1, 1,
-1.540158, 1.468978, -1.346127, 0, 0, 0, 1, 1,
-1.536747, 0.6382371, 0.05173142, 0, 0, 0, 1, 1,
-1.532357, 0.444769, -0.8134184, 0, 0, 0, 1, 1,
-1.526766, 0.1337667, -2.597847, 0, 0, 0, 1, 1,
-1.516634, -0.3193677, -0.6534595, 0, 0, 0, 1, 1,
-1.509742, -1.062341, -1.970056, 0, 0, 0, 1, 1,
-1.500912, 1.36598, -0.6450885, 0, 0, 0, 1, 1,
-1.490265, -1.217, -3.128858, 1, 1, 1, 1, 1,
-1.477684, 0.4706429, -1.694389, 1, 1, 1, 1, 1,
-1.475698, -1.083097, -2.535911, 1, 1, 1, 1, 1,
-1.458113, -1.538114, -1.270807, 1, 1, 1, 1, 1,
-1.451287, -0.2583415, -3.362417, 1, 1, 1, 1, 1,
-1.442801, -1.694623, -2.846308, 1, 1, 1, 1, 1,
-1.441258, -0.4426031, -1.171492, 1, 1, 1, 1, 1,
-1.436464, 0.07049932, -1.411769, 1, 1, 1, 1, 1,
-1.433552, 0.1149095, -2.572604, 1, 1, 1, 1, 1,
-1.430272, 0.1036038, -1.305955, 1, 1, 1, 1, 1,
-1.407254, 0.6887693, -0.7065232, 1, 1, 1, 1, 1,
-1.406246, -0.2159458, -2.675996, 1, 1, 1, 1, 1,
-1.388188, 0.7527204, -2.269281, 1, 1, 1, 1, 1,
-1.356804, 0.4949738, -0.7904916, 1, 1, 1, 1, 1,
-1.346321, -0.4668709, -0.6199876, 1, 1, 1, 1, 1,
-1.345128, 0.4667298, -1.310187, 0, 0, 1, 1, 1,
-1.341264, 0.5329658, -2.713848, 1, 0, 0, 1, 1,
-1.336318, 0.4534796, -1.129248, 1, 0, 0, 1, 1,
-1.333328, 0.1143058, -1.575509, 1, 0, 0, 1, 1,
-1.330255, 1.857112, -0.5800587, 1, 0, 0, 1, 1,
-1.326919, -0.8596064, -1.065147, 1, 0, 0, 1, 1,
-1.325758, -2.428283, -3.430921, 0, 0, 0, 1, 1,
-1.310043, -0.6207304, -1.924783, 0, 0, 0, 1, 1,
-1.299752, -0.4929444, -1.380926, 0, 0, 0, 1, 1,
-1.277038, -0.1213412, -1.928126, 0, 0, 0, 1, 1,
-1.27554, -1.177837, -2.173123, 0, 0, 0, 1, 1,
-1.275011, 0.05500155, -1.925367, 0, 0, 0, 1, 1,
-1.271667, 1.20905, 0.173658, 0, 0, 0, 1, 1,
-1.269493, -1.006296, -2.326919, 1, 1, 1, 1, 1,
-1.267852, -1.023027, -2.266313, 1, 1, 1, 1, 1,
-1.263306, -1.095989, -1.906252, 1, 1, 1, 1, 1,
-1.262324, 1.22463, -1.967854, 1, 1, 1, 1, 1,
-1.2601, -0.5487236, -2.52147, 1, 1, 1, 1, 1,
-1.244454, -2.098165, -3.201763, 1, 1, 1, 1, 1,
-1.241431, 1.669691, -0.4034097, 1, 1, 1, 1, 1,
-1.241281, -0.009942281, -1.659061, 1, 1, 1, 1, 1,
-1.234263, -0.03184474, -2.022833, 1, 1, 1, 1, 1,
-1.232324, 1.760556, 0.07811261, 1, 1, 1, 1, 1,
-1.23198, 1.074265, 0.6235265, 1, 1, 1, 1, 1,
-1.228028, -1.253777, -1.142929, 1, 1, 1, 1, 1,
-1.220358, 1.973118, 0.7867256, 1, 1, 1, 1, 1,
-1.219936, -0.208228, -2.256901, 1, 1, 1, 1, 1,
-1.209525, -0.7893642, -2.45096, 1, 1, 1, 1, 1,
-1.196435, -0.3852998, -1.749642, 0, 0, 1, 1, 1,
-1.190927, -0.08896773, -1.415103, 1, 0, 0, 1, 1,
-1.183444, 1.979288, -0.01289114, 1, 0, 0, 1, 1,
-1.169482, 0.9645064, -1.157168, 1, 0, 0, 1, 1,
-1.161592, -0.8051932, -2.307213, 1, 0, 0, 1, 1,
-1.15695, 0.7535422, -1.434216, 1, 0, 0, 1, 1,
-1.141938, -1.944858, -2.833993, 0, 0, 0, 1, 1,
-1.135941, 1.359626, -0.02436974, 0, 0, 0, 1, 1,
-1.12278, -0.9792269, -0.923969, 0, 0, 0, 1, 1,
-1.113234, 0.3581755, -2.452696, 0, 0, 0, 1, 1,
-1.110882, 0.6205245, -2.78414, 0, 0, 0, 1, 1,
-1.105345, -0.02205813, -1.372502, 0, 0, 0, 1, 1,
-1.098526, 0.4021211, 0.4105441, 0, 0, 0, 1, 1,
-1.098359, 0.4742096, -1.58732, 1, 1, 1, 1, 1,
-1.09201, 0.2521302, -0.2435383, 1, 1, 1, 1, 1,
-1.090297, 0.09343076, -1.660739, 1, 1, 1, 1, 1,
-1.073671, -1.564925, -2.837899, 1, 1, 1, 1, 1,
-1.071532, -0.6679342, -1.304168, 1, 1, 1, 1, 1,
-1.070254, 1.356488, -1.977929, 1, 1, 1, 1, 1,
-1.063985, 0.8122867, 0.2607984, 1, 1, 1, 1, 1,
-1.059797, -1.356352, -2.110359, 1, 1, 1, 1, 1,
-1.059614, 0.5154648, -2.166674, 1, 1, 1, 1, 1,
-1.05377, 0.2198973, -0.9953957, 1, 1, 1, 1, 1,
-1.05196, 0.7071002, -0.6404258, 1, 1, 1, 1, 1,
-1.050489, -0.1812711, -1.205167, 1, 1, 1, 1, 1,
-1.044327, -0.1531844, -1.810055, 1, 1, 1, 1, 1,
-1.03603, -0.0694122, -1.273454, 1, 1, 1, 1, 1,
-1.035459, -0.3692917, -2.293356, 1, 1, 1, 1, 1,
-1.012601, 0.3109255, -0.9061705, 0, 0, 1, 1, 1,
-1.007904, 0.09287178, -1.840571, 1, 0, 0, 1, 1,
-1.004298, 0.36249, -2.523395, 1, 0, 0, 1, 1,
-1.003636, -0.6324787, -0.7897953, 1, 0, 0, 1, 1,
-0.9989731, 0.7754182, -0.7397478, 1, 0, 0, 1, 1,
-0.9966447, -1.096128, -3.632562, 1, 0, 0, 1, 1,
-0.9957097, 0.4146463, -3.320494, 0, 0, 0, 1, 1,
-0.9947557, -0.7912071, -3.015904, 0, 0, 0, 1, 1,
-0.9894352, 1.262079, -1.401299, 0, 0, 0, 1, 1,
-0.9893275, -0.6281916, -3.533074, 0, 0, 0, 1, 1,
-0.9887553, -0.06762231, 0.2546485, 0, 0, 0, 1, 1,
-0.9784491, -0.9802665, -1.720409, 0, 0, 0, 1, 1,
-0.9749364, 1.332861, 0.0599946, 0, 0, 0, 1, 1,
-0.9723659, 1.46406, -0.153819, 1, 1, 1, 1, 1,
-0.9666347, -0.2729926, -2.112932, 1, 1, 1, 1, 1,
-0.9624095, 0.3427151, -1.544042, 1, 1, 1, 1, 1,
-0.9568477, 0.001406109, -0.3257647, 1, 1, 1, 1, 1,
-0.9545075, -0.2088732, -0.9149099, 1, 1, 1, 1, 1,
-0.9531572, -0.8085087, 0.1076511, 1, 1, 1, 1, 1,
-0.9476908, -0.3800752, -0.5123247, 1, 1, 1, 1, 1,
-0.9437354, 0.67758, -0.541019, 1, 1, 1, 1, 1,
-0.9393038, 0.3153188, -1.562919, 1, 1, 1, 1, 1,
-0.9364792, -1.011065, -2.86082, 1, 1, 1, 1, 1,
-0.9300662, -0.2746727, -0.5065536, 1, 1, 1, 1, 1,
-0.9248803, -0.08439505, -3.572981, 1, 1, 1, 1, 1,
-0.9229725, 2.774713, 0.6436123, 1, 1, 1, 1, 1,
-0.9210371, -0.5556424, -2.848983, 1, 1, 1, 1, 1,
-0.9172229, -0.7898349, -2.12396, 1, 1, 1, 1, 1,
-0.9162758, 1.496825, 0.479377, 0, 0, 1, 1, 1,
-0.9143161, 0.05611832, -2.636981, 1, 0, 0, 1, 1,
-0.9117591, 0.9409158, 0.3462675, 1, 0, 0, 1, 1,
-0.9105555, 0.1148354, -0.4479134, 1, 0, 0, 1, 1,
-0.9101575, 1.105355, -0.1184324, 1, 0, 0, 1, 1,
-0.909285, -2.603012, -3.899075, 1, 0, 0, 1, 1,
-0.8913829, 1.50448, -0.9267527, 0, 0, 0, 1, 1,
-0.8907139, -1.076468, -2.964556, 0, 0, 0, 1, 1,
-0.886251, 0.5870053, -1.596568, 0, 0, 0, 1, 1,
-0.8806362, 1.310924, -0.543108, 0, 0, 0, 1, 1,
-0.8801461, -0.0067444, -1.337464, 0, 0, 0, 1, 1,
-0.8790258, 0.5848872, -1.102317, 0, 0, 0, 1, 1,
-0.8776534, -0.4946001, -3.604515, 0, 0, 0, 1, 1,
-0.8750923, 0.2627394, -1.571073, 1, 1, 1, 1, 1,
-0.8734027, -0.2895202, -1.746759, 1, 1, 1, 1, 1,
-0.8475242, 0.1325082, -0.8073791, 1, 1, 1, 1, 1,
-0.8469978, -0.878926, -3.628446, 1, 1, 1, 1, 1,
-0.8466038, 0.3858163, -2.802862, 1, 1, 1, 1, 1,
-0.8433021, 0.3836583, -0.9135672, 1, 1, 1, 1, 1,
-0.8424384, -2.243244, -2.958008, 1, 1, 1, 1, 1,
-0.8345062, -0.5125259, -2.025765, 1, 1, 1, 1, 1,
-0.8263171, 0.01446748, -0.3303837, 1, 1, 1, 1, 1,
-0.8242211, 1.165833, -1.781171, 1, 1, 1, 1, 1,
-0.8231552, 2.366942, -0.8769937, 1, 1, 1, 1, 1,
-0.8207563, 0.3071323, -0.3720657, 1, 1, 1, 1, 1,
-0.8204649, 1.016007, -2.065932, 1, 1, 1, 1, 1,
-0.8128359, 1.449028, -1.740558, 1, 1, 1, 1, 1,
-0.8113796, 0.277796, -1.832376, 1, 1, 1, 1, 1,
-0.8106694, 0.2583496, -0.1673719, 0, 0, 1, 1, 1,
-0.8060027, -0.8603625, -1.156563, 1, 0, 0, 1, 1,
-0.8022052, -0.8162436, -2.641155, 1, 0, 0, 1, 1,
-0.7990884, 1.248006, -0.02642396, 1, 0, 0, 1, 1,
-0.7987812, 0.4842949, -0.5093552, 1, 0, 0, 1, 1,
-0.7958576, -1.058518, -3.839131, 1, 0, 0, 1, 1,
-0.7928572, 0.9172809, -0.473859, 0, 0, 0, 1, 1,
-0.7898342, -0.4647033, -2.3304, 0, 0, 0, 1, 1,
-0.7892109, -0.5837293, -2.933988, 0, 0, 0, 1, 1,
-0.7849152, -0.9432465, -2.373115, 0, 0, 0, 1, 1,
-0.7843078, 0.539493, -1.203112, 0, 0, 0, 1, 1,
-0.7769687, -0.2315346, -1.819722, 0, 0, 0, 1, 1,
-0.7761842, 1.643716, -1.327021, 0, 0, 0, 1, 1,
-0.77421, -0.1773936, -0.6362163, 1, 1, 1, 1, 1,
-0.7737574, -0.5892125, -4.599747, 1, 1, 1, 1, 1,
-0.7722329, -0.6663002, -2.525119, 1, 1, 1, 1, 1,
-0.7715179, -1.353101, -2.538474, 1, 1, 1, 1, 1,
-0.748077, 0.4323647, -1.410008, 1, 1, 1, 1, 1,
-0.7477503, -0.536406, -1.873536, 1, 1, 1, 1, 1,
-0.7456732, 0.7291574, 0.3297542, 1, 1, 1, 1, 1,
-0.7441494, -2.214121, -2.241862, 1, 1, 1, 1, 1,
-0.7432173, -0.3144889, -0.9088696, 1, 1, 1, 1, 1,
-0.7419168, -0.7235714, -2.726489, 1, 1, 1, 1, 1,
-0.7418483, 0.2824232, -1.078806, 1, 1, 1, 1, 1,
-0.7406842, -1.331112, -1.509897, 1, 1, 1, 1, 1,
-0.7345258, -1.753544, -4.491421, 1, 1, 1, 1, 1,
-0.72025, -0.3036367, -3.181764, 1, 1, 1, 1, 1,
-0.7169714, 0.2833472, -0.8641016, 1, 1, 1, 1, 1,
-0.7163621, 0.3284738, -1.473557, 0, 0, 1, 1, 1,
-0.7154321, -0.2738338, -3.595553, 1, 0, 0, 1, 1,
-0.7139014, 1.145504, 0.3575451, 1, 0, 0, 1, 1,
-0.7135875, -0.7540532, -3.312531, 1, 0, 0, 1, 1,
-0.7113965, -0.4839646, -3.414878, 1, 0, 0, 1, 1,
-0.7040268, 0.4721113, -0.6226706, 1, 0, 0, 1, 1,
-0.7025581, -1.395033, -4.908107, 0, 0, 0, 1, 1,
-0.6997603, 0.3965638, -0.07832713, 0, 0, 0, 1, 1,
-0.6995683, -1.277328, -0.8650641, 0, 0, 0, 1, 1,
-0.6972381, -1.291436, -3.442896, 0, 0, 0, 1, 1,
-0.6919095, -1.859969, -2.836777, 0, 0, 0, 1, 1,
-0.688826, -0.5367472, -1.65667, 0, 0, 0, 1, 1,
-0.6883234, -2.800136, -4.887053, 0, 0, 0, 1, 1,
-0.6876607, -0.6560316, -1.412563, 1, 1, 1, 1, 1,
-0.6863587, 0.08449715, 0.5833655, 1, 1, 1, 1, 1,
-0.6830662, 2.145154, 1.773742, 1, 1, 1, 1, 1,
-0.6789323, 0.5093731, -3.034463, 1, 1, 1, 1, 1,
-0.6728833, 0.9291233, -1.644301, 1, 1, 1, 1, 1,
-0.6722372, -1.253924, -0.06372935, 1, 1, 1, 1, 1,
-0.6688414, 0.8645735, -0.312519, 1, 1, 1, 1, 1,
-0.6664013, -0.4485578, -1.634345, 1, 1, 1, 1, 1,
-0.6658624, 0.5176888, -2.847646, 1, 1, 1, 1, 1,
-0.6612437, 0.417769, 1.48708, 1, 1, 1, 1, 1,
-0.6555381, 1.286329, 2.05643, 1, 1, 1, 1, 1,
-0.6474035, -0.8347918, -2.217314, 1, 1, 1, 1, 1,
-0.6467463, 0.08928754, -1.692787, 1, 1, 1, 1, 1,
-0.6433307, -2.427723, -3.348911, 1, 1, 1, 1, 1,
-0.6394897, 0.9280167, -1.941595, 1, 1, 1, 1, 1,
-0.6353511, 0.2462835, -0.9015477, 0, 0, 1, 1, 1,
-0.6318389, 0.3643429, 0.5295864, 1, 0, 0, 1, 1,
-0.6312639, 1.131545, -1.024794, 1, 0, 0, 1, 1,
-0.630005, -0.2237666, -2.036829, 1, 0, 0, 1, 1,
-0.6278554, 1.855024, 1.516581, 1, 0, 0, 1, 1,
-0.6159299, 0.383386, -1.077904, 1, 0, 0, 1, 1,
-0.6157109, -0.7475306, -1.172172, 0, 0, 0, 1, 1,
-0.613164, 1.404763, -1.514676, 0, 0, 0, 1, 1,
-0.6114904, 1.239973, -0.4537192, 0, 0, 0, 1, 1,
-0.6110489, -0.3231064, -3.528693, 0, 0, 0, 1, 1,
-0.6102637, -0.4205204, -0.9118581, 0, 0, 0, 1, 1,
-0.6084538, 1.874311, -0.543898, 0, 0, 0, 1, 1,
-0.6069412, 0.8351757, -0.6462267, 0, 0, 0, 1, 1,
-0.6036628, 0.7205025, -0.7256287, 1, 1, 1, 1, 1,
-0.5978478, -0.2557733, -1.175835, 1, 1, 1, 1, 1,
-0.5973057, 0.8269413, -2.112202, 1, 1, 1, 1, 1,
-0.5929321, 0.783321, -0.6328316, 1, 1, 1, 1, 1,
-0.5925216, -0.3516829, -1.837391, 1, 1, 1, 1, 1,
-0.586376, 1.354005, -1.091294, 1, 1, 1, 1, 1,
-0.5861301, 1.579331, 0.04189877, 1, 1, 1, 1, 1,
-0.5848784, -0.9204441, -2.512801, 1, 1, 1, 1, 1,
-0.5798544, 1.298401, -1.232676, 1, 1, 1, 1, 1,
-0.5795983, -0.558766, -1.499207, 1, 1, 1, 1, 1,
-0.5791597, -0.7477236, -1.781769, 1, 1, 1, 1, 1,
-0.5760378, 1.452003, -0.6940392, 1, 1, 1, 1, 1,
-0.5757315, -1.393403, -3.171076, 1, 1, 1, 1, 1,
-0.5716295, 0.9864119, 0.7878079, 1, 1, 1, 1, 1,
-0.5713885, -2.188448, -4.243768, 1, 1, 1, 1, 1,
-0.5633609, -2.16584, -2.601246, 0, 0, 1, 1, 1,
-0.5560197, 1.858715, 0.7963559, 1, 0, 0, 1, 1,
-0.5522575, 0.3754573, -2.666607, 1, 0, 0, 1, 1,
-0.5511239, -0.2922232, -2.719154, 1, 0, 0, 1, 1,
-0.5483497, 0.102412, -0.9031243, 1, 0, 0, 1, 1,
-0.5444185, 2.742374, 0.05380584, 1, 0, 0, 1, 1,
-0.543816, 0.6206054, -0.9486182, 0, 0, 0, 1, 1,
-0.5379482, -0.374385, -2.045947, 0, 0, 0, 1, 1,
-0.5346097, -0.6560926, -2.274939, 0, 0, 0, 1, 1,
-0.5341775, -0.6704781, -3.643529, 0, 0, 0, 1, 1,
-0.5322098, -0.5771497, -2.97999, 0, 0, 0, 1, 1,
-0.5316378, -0.4192889, -1.772735, 0, 0, 0, 1, 1,
-0.5307928, -0.1117636, -0.1182264, 0, 0, 0, 1, 1,
-0.5294895, 1.058906, -1.006236, 1, 1, 1, 1, 1,
-0.5284084, -1.086565, -1.319669, 1, 1, 1, 1, 1,
-0.5239475, 0.08416528, -1.68134, 1, 1, 1, 1, 1,
-0.5226777, 0.694438, 0.009042667, 1, 1, 1, 1, 1,
-0.518697, -0.717885, -1.297052, 1, 1, 1, 1, 1,
-0.5166361, -0.9553524, -3.47979, 1, 1, 1, 1, 1,
-0.5163052, 0.5720261, -1.60609, 1, 1, 1, 1, 1,
-0.5150621, -0.9374976, -3.002683, 1, 1, 1, 1, 1,
-0.5120379, -0.6805339, -1.984921, 1, 1, 1, 1, 1,
-0.5019275, -0.4628962, -2.220216, 1, 1, 1, 1, 1,
-0.4972603, 0.3261304, 0.107351, 1, 1, 1, 1, 1,
-0.4945221, -0.6017591, -1.215968, 1, 1, 1, 1, 1,
-0.4925639, 0.8021264, -1.200984, 1, 1, 1, 1, 1,
-0.490861, 0.0100629, -1.484135, 1, 1, 1, 1, 1,
-0.49036, 0.851376, -0.3593289, 1, 1, 1, 1, 1,
-0.4875459, 0.4884145, -0.4797989, 0, 0, 1, 1, 1,
-0.4870815, 1.936831, -0.2864147, 1, 0, 0, 1, 1,
-0.4864112, -2.303041, -2.126229, 1, 0, 0, 1, 1,
-0.4848521, 1.500531, 0.9996946, 1, 0, 0, 1, 1,
-0.4765769, 2.002279, 0.4723153, 1, 0, 0, 1, 1,
-0.4752602, 0.3332092, -1.742764, 1, 0, 0, 1, 1,
-0.4736827, -1.520769, -3.889772, 0, 0, 0, 1, 1,
-0.4692613, -0.1346078, -1.759972, 0, 0, 0, 1, 1,
-0.4684148, 0.368259, -1.246885, 0, 0, 0, 1, 1,
-0.4634123, -0.6768009, -2.6808, 0, 0, 0, 1, 1,
-0.456576, -0.8240439, -2.083523, 0, 0, 0, 1, 1,
-0.4549692, -2.299364, -1.661304, 0, 0, 0, 1, 1,
-0.4516498, 1.263116, 0.5054852, 0, 0, 0, 1, 1,
-0.447942, -1.611753, -2.899239, 1, 1, 1, 1, 1,
-0.4478283, 2.401261, -1.720699, 1, 1, 1, 1, 1,
-0.4463538, -1.502777, -2.621849, 1, 1, 1, 1, 1,
-0.4425943, 0.0793889, 0.07430453, 1, 1, 1, 1, 1,
-0.4419336, 0.4377723, -1.354174, 1, 1, 1, 1, 1,
-0.4392689, 2.106937, 1.098838, 1, 1, 1, 1, 1,
-0.4338517, -0.4752745, -1.389015, 1, 1, 1, 1, 1,
-0.4297518, 0.118385, -1.129471, 1, 1, 1, 1, 1,
-0.4283387, 0.3667498, 0.830843, 1, 1, 1, 1, 1,
-0.427471, 0.5894677, 0.4826553, 1, 1, 1, 1, 1,
-0.4273165, 1.79178, -1.192287, 1, 1, 1, 1, 1,
-0.4167006, 1.262727, -0.1356402, 1, 1, 1, 1, 1,
-0.4153912, -0.6912301, -3.290048, 1, 1, 1, 1, 1,
-0.4136375, 0.7645632, 0.6446912, 1, 1, 1, 1, 1,
-0.4131047, 0.6277724, -1.502632, 1, 1, 1, 1, 1,
-0.4117691, 0.5347739, -1.449259, 0, 0, 1, 1, 1,
-0.4107876, 0.5515214, -0.3760008, 1, 0, 0, 1, 1,
-0.4093625, -0.9547208, -2.121157, 1, 0, 0, 1, 1,
-0.4060126, 0.01914508, -1.958435, 1, 0, 0, 1, 1,
-0.4008508, -1.469469, -2.106111, 1, 0, 0, 1, 1,
-0.400512, 0.9291088, 0.1120076, 1, 0, 0, 1, 1,
-0.3989426, 1.128978, -0.1898404, 0, 0, 0, 1, 1,
-0.3975216, 0.485113, 0.1831399, 0, 0, 0, 1, 1,
-0.3901464, 0.1918616, -1.565947, 0, 0, 0, 1, 1,
-0.3896882, -0.5917738, -2.304923, 0, 0, 0, 1, 1,
-0.3885682, 0.5740731, 1.095464, 0, 0, 0, 1, 1,
-0.3867627, -1.450716, -1.864135, 0, 0, 0, 1, 1,
-0.3862877, -0.6144145, -2.986131, 0, 0, 0, 1, 1,
-0.3747048, -0.6584375, -4.131321, 1, 1, 1, 1, 1,
-0.3630859, 0.9343952, -0.9477141, 1, 1, 1, 1, 1,
-0.3618135, 0.5457348, -2.699168, 1, 1, 1, 1, 1,
-0.3590648, 1.038883, -0.3369995, 1, 1, 1, 1, 1,
-0.3587252, 0.9214639, 1.96372, 1, 1, 1, 1, 1,
-0.3513094, 1.546026, -0.1693412, 1, 1, 1, 1, 1,
-0.3475451, 0.04907595, -0.8102252, 1, 1, 1, 1, 1,
-0.3455324, -0.6158152, -2.911172, 1, 1, 1, 1, 1,
-0.3426661, 1.002942, -0.1922274, 1, 1, 1, 1, 1,
-0.3389189, -1.605233, -2.379662, 1, 1, 1, 1, 1,
-0.3371378, 0.1537219, -1.190068, 1, 1, 1, 1, 1,
-0.3332641, -1.028101, -3.472142, 1, 1, 1, 1, 1,
-0.3330614, -1.285591, -1.644683, 1, 1, 1, 1, 1,
-0.3323815, -1.070484, -3.001869, 1, 1, 1, 1, 1,
-0.3272895, -1.437018, -3.135514, 1, 1, 1, 1, 1,
-0.3266151, -0.8250741, -3.428297, 0, 0, 1, 1, 1,
-0.3250832, 0.4090616, -2.22246, 1, 0, 0, 1, 1,
-0.3184851, -1.316015, -3.031575, 1, 0, 0, 1, 1,
-0.3104385, 0.8995293, 0.8346232, 1, 0, 0, 1, 1,
-0.3090937, -0.8214754, -3.322208, 1, 0, 0, 1, 1,
-0.3089302, 0.1703569, -1.520649, 1, 0, 0, 1, 1,
-0.3084032, 2.137383, -0.777648, 0, 0, 0, 1, 1,
-0.289427, -0.3924156, -1.707531, 0, 0, 0, 1, 1,
-0.2892296, -0.7586789, -4.565952, 0, 0, 0, 1, 1,
-0.2885826, -0.283162, -1.171561, 0, 0, 0, 1, 1,
-0.2858241, 0.4493274, -0.2527411, 0, 0, 0, 1, 1,
-0.2830902, -0.8664705, -2.676855, 0, 0, 0, 1, 1,
-0.2786307, -0.09477795, -2.026284, 0, 0, 0, 1, 1,
-0.2783812, -1.94619, -0.693992, 1, 1, 1, 1, 1,
-0.2700433, 0.9421479, -0.4074486, 1, 1, 1, 1, 1,
-0.2683303, 0.3779526, 0.2939501, 1, 1, 1, 1, 1,
-0.2651425, 0.3985905, -2.136269, 1, 1, 1, 1, 1,
-0.261253, 1.141118, -1.071018, 1, 1, 1, 1, 1,
-0.2586681, -1.299994, -2.504013, 1, 1, 1, 1, 1,
-0.2534697, 0.6781192, -1.431511, 1, 1, 1, 1, 1,
-0.2347343, -0.284766, -3.643404, 1, 1, 1, 1, 1,
-0.2328898, -0.1175736, -2.713502, 1, 1, 1, 1, 1,
-0.2270952, 0.9510739, 0.2585627, 1, 1, 1, 1, 1,
-0.2208166, -0.5611069, -2.354414, 1, 1, 1, 1, 1,
-0.2177633, 0.8711846, -2.00697, 1, 1, 1, 1, 1,
-0.2149459, 0.04611816, -0.03405033, 1, 1, 1, 1, 1,
-0.2146022, -1.08129, -3.17598, 1, 1, 1, 1, 1,
-0.2083727, 0.6698595, 0.5622141, 1, 1, 1, 1, 1,
-0.2064419, -0.7343171, -3.786699, 0, 0, 1, 1, 1,
-0.2011473, 0.6011891, -0.697687, 1, 0, 0, 1, 1,
-0.1985859, -0.7821729, -3.909199, 1, 0, 0, 1, 1,
-0.1973867, 0.5268551, 0.8658912, 1, 0, 0, 1, 1,
-0.1944351, -1.599287, -3.342889, 1, 0, 0, 1, 1,
-0.1836134, -0.2241129, -2.958909, 1, 0, 0, 1, 1,
-0.1740284, 2.628639, -0.4677776, 0, 0, 0, 1, 1,
-0.1719142, 0.1768277, 0.04128535, 0, 0, 0, 1, 1,
-0.170889, -0.4258218, -3.287025, 0, 0, 0, 1, 1,
-0.1682024, -1.229217, -2.900808, 0, 0, 0, 1, 1,
-0.1632615, 0.648845, -0.03573239, 0, 0, 0, 1, 1,
-0.1596318, 0.8481763, -1.397013, 0, 0, 0, 1, 1,
-0.1548423, 0.3937587, 0.01566289, 0, 0, 0, 1, 1,
-0.150756, 0.4315348, -1.193299, 1, 1, 1, 1, 1,
-0.1492479, -0.7633065, -3.169628, 1, 1, 1, 1, 1,
-0.1450541, -1.215891, -2.669301, 1, 1, 1, 1, 1,
-0.1399096, 0.4326446, 0.2289468, 1, 1, 1, 1, 1,
-0.1391407, 1.407787, 0.5873998, 1, 1, 1, 1, 1,
-0.1381063, 0.7005354, -1.080543, 1, 1, 1, 1, 1,
-0.1365356, -0.9310811, -3.837981, 1, 1, 1, 1, 1,
-0.1359707, -0.1959615, -3.342225, 1, 1, 1, 1, 1,
-0.1353129, -1.098109, -4.400981, 1, 1, 1, 1, 1,
-0.1290401, -0.5151725, -2.914341, 1, 1, 1, 1, 1,
-0.1279842, 1.116812, -0.6817729, 1, 1, 1, 1, 1,
-0.1258013, 0.6245092, -0.6644478, 1, 1, 1, 1, 1,
-0.123911, 0.5323563, -0.5358976, 1, 1, 1, 1, 1,
-0.1210675, -0.01826067, -2.601282, 1, 1, 1, 1, 1,
-0.1150947, -0.05394064, -2.885848, 1, 1, 1, 1, 1,
-0.1140626, -0.5064344, -2.02612, 0, 0, 1, 1, 1,
-0.1122204, -0.902159, -2.029851, 1, 0, 0, 1, 1,
-0.1121026, -0.4218069, -1.762869, 1, 0, 0, 1, 1,
-0.1075724, -1.190087, -0.4896688, 1, 0, 0, 1, 1,
-0.1044352, -0.1547875, -2.644416, 1, 0, 0, 1, 1,
-0.1039763, 0.664516, -1.811063, 1, 0, 0, 1, 1,
-0.1029874, -1.212955, -3.592237, 0, 0, 0, 1, 1,
-0.1018766, 1.846372, -0.9464018, 0, 0, 0, 1, 1,
-0.09714323, -0.5418264, -3.806124, 0, 0, 0, 1, 1,
-0.09498862, 0.7438346, -0.6172112, 0, 0, 0, 1, 1,
-0.0939557, 0.1770797, 0.2210139, 0, 0, 0, 1, 1,
-0.09279359, -0.1963698, -2.229924, 0, 0, 0, 1, 1,
-0.09092216, 0.2638455, -0.6199908, 0, 0, 0, 1, 1,
-0.08827261, 0.2458044, -1.177439, 1, 1, 1, 1, 1,
-0.08786663, -0.7702122, -2.992092, 1, 1, 1, 1, 1,
-0.08680215, 0.558009, -1.44743, 1, 1, 1, 1, 1,
-0.0863782, -0.5461579, -3.162556, 1, 1, 1, 1, 1,
-0.0838082, 1.091001, -1.794019, 1, 1, 1, 1, 1,
-0.07997727, 1.731588, -0.5055215, 1, 1, 1, 1, 1,
-0.0770793, -1.691124, -2.589448, 1, 1, 1, 1, 1,
-0.077038, -0.5611079, -2.662314, 1, 1, 1, 1, 1,
-0.07678779, -0.516503, -3.457228, 1, 1, 1, 1, 1,
-0.07626657, -0.3821845, -2.510939, 1, 1, 1, 1, 1,
-0.07111169, -0.2340538, -2.942424, 1, 1, 1, 1, 1,
-0.06810508, -2.562597, -4.429031, 1, 1, 1, 1, 1,
-0.06467626, 0.1439635, 0.6371004, 1, 1, 1, 1, 1,
-0.06352751, 0.7463409, 2.115818, 1, 1, 1, 1, 1,
-0.06221131, -2.141751, -1.494024, 1, 1, 1, 1, 1,
-0.06165202, 0.5313963, 1.521143, 0, 0, 1, 1, 1,
-0.06150518, 0.2870805, -2.537958, 1, 0, 0, 1, 1,
-0.0605927, 0.3016449, -0.9977226, 1, 0, 0, 1, 1,
-0.05995156, -1.099806, -2.266555, 1, 0, 0, 1, 1,
-0.05680824, -1.303105, -2.239151, 1, 0, 0, 1, 1,
-0.0488169, 1.221326, 0.0008891894, 1, 0, 0, 1, 1,
-0.04794915, 0.2644378, -0.800137, 0, 0, 0, 1, 1,
-0.04400801, 0.2444615, 0.8668599, 0, 0, 0, 1, 1,
-0.0414259, 0.2713764, 0.5707886, 0, 0, 0, 1, 1,
-0.03739822, -0.03625561, -2.616221, 0, 0, 0, 1, 1,
-0.03560109, -0.6471029, -3.269935, 0, 0, 0, 1, 1,
-0.03483064, -0.07229053, -4.898283, 0, 0, 0, 1, 1,
-0.03270254, 0.4024553, -1.019249, 0, 0, 0, 1, 1,
-0.03047008, -0.7243188, -3.887061, 1, 1, 1, 1, 1,
-0.01590085, 0.3695934, 0.6581229, 1, 1, 1, 1, 1,
-0.008370239, 0.219568, 0.4799902, 1, 1, 1, 1, 1,
-0.008170133, -0.4597546, -3.902607, 1, 1, 1, 1, 1,
-0.004961129, -1.937112, -3.584778, 1, 1, 1, 1, 1,
-0.004171977, -0.5436857, -4.429681, 1, 1, 1, 1, 1,
-0.0005460659, 0.2284353, 0.7681742, 1, 1, 1, 1, 1,
0.003390801, 0.06121035, -0.4655887, 1, 1, 1, 1, 1,
0.005907112, 0.6663631, 1.140941, 1, 1, 1, 1, 1,
0.006994405, 0.2199633, -0.5802798, 1, 1, 1, 1, 1,
0.00834409, -1.018533, 0.6965869, 1, 1, 1, 1, 1,
0.0111565, -0.2388985, 3.991407, 1, 1, 1, 1, 1,
0.01132376, -0.4196391, 2.478202, 1, 1, 1, 1, 1,
0.01305535, -1.636851, 2.770519, 1, 1, 1, 1, 1,
0.01408617, 1.115802, -0.2286377, 1, 1, 1, 1, 1,
0.01455206, -0.1024358, 3.602649, 0, 0, 1, 1, 1,
0.01463602, -0.3717783, 3.851851, 1, 0, 0, 1, 1,
0.01582943, 1.70667, -0.3878873, 1, 0, 0, 1, 1,
0.0185977, 1.846332, 0.6630136, 1, 0, 0, 1, 1,
0.02118437, 0.1435172, -1.93327, 1, 0, 0, 1, 1,
0.02317033, -0.922983, 4.813004, 1, 0, 0, 1, 1,
0.02651577, -0.3421562, 3.739476, 0, 0, 0, 1, 1,
0.03358282, -0.3878952, 2.19874, 0, 0, 0, 1, 1,
0.0352701, 0.362555, 0.4697888, 0, 0, 0, 1, 1,
0.03643763, 0.1037502, 0.3138672, 0, 0, 0, 1, 1,
0.04450889, -1.042471, 2.856082, 0, 0, 0, 1, 1,
0.04855229, 0.3969813, 0.3941373, 0, 0, 0, 1, 1,
0.05104221, 0.7240245, 0.152618, 0, 0, 0, 1, 1,
0.05109872, -0.5045541, 2.494736, 1, 1, 1, 1, 1,
0.05267871, -0.7044248, 4.173496, 1, 1, 1, 1, 1,
0.053521, 2.558927, 0.09043603, 1, 1, 1, 1, 1,
0.05387379, -0.4343208, 3.819978, 1, 1, 1, 1, 1,
0.05684652, 0.5832908, 0.202704, 1, 1, 1, 1, 1,
0.05751152, -0.5800822, 3.601089, 1, 1, 1, 1, 1,
0.05978576, 1.972474, -0.3038295, 1, 1, 1, 1, 1,
0.06506323, -1.77721, 3.879747, 1, 1, 1, 1, 1,
0.06749804, -0.5707484, 4.932697, 1, 1, 1, 1, 1,
0.07228051, -0.9503002, 3.951527, 1, 1, 1, 1, 1,
0.07311559, -0.6441477, 1.875494, 1, 1, 1, 1, 1,
0.07423121, -1.107779, 2.598317, 1, 1, 1, 1, 1,
0.07973505, -1.560858, 2.909944, 1, 1, 1, 1, 1,
0.08097143, -0.7770669, 4.721419, 1, 1, 1, 1, 1,
0.0812636, 0.9710293, -0.1985075, 1, 1, 1, 1, 1,
0.08256929, -0.4690937, 4.806734, 0, 0, 1, 1, 1,
0.08606027, 0.9801134, 1.676499, 1, 0, 0, 1, 1,
0.0897109, 0.8282393, -1.48096, 1, 0, 0, 1, 1,
0.09988297, 1.233219, 1.702987, 1, 0, 0, 1, 1,
0.09997217, 1.054431, 0.1293918, 1, 0, 0, 1, 1,
0.1016557, 0.07054668, 0.6176162, 1, 0, 0, 1, 1,
0.1061721, -1.247262, 4.226583, 0, 0, 0, 1, 1,
0.107189, -0.3578007, 1.99956, 0, 0, 0, 1, 1,
0.1109506, 0.4214373, -1.054059, 0, 0, 0, 1, 1,
0.1142314, 0.6143371, -0.7551091, 0, 0, 0, 1, 1,
0.1175156, -1.12706, 3.655172, 0, 0, 0, 1, 1,
0.1176345, -0.2573607, 3.174246, 0, 0, 0, 1, 1,
0.1196782, 0.01638392, -1.233983, 0, 0, 0, 1, 1,
0.1205935, -1.109639, 0.8696293, 1, 1, 1, 1, 1,
0.1270079, -0.5299028, 1.148324, 1, 1, 1, 1, 1,
0.1289335, -0.6567127, 3.462534, 1, 1, 1, 1, 1,
0.1294614, -0.3401748, 1.257448, 1, 1, 1, 1, 1,
0.135192, 1.481179, -0.2774077, 1, 1, 1, 1, 1,
0.1359634, -0.3295702, 2.59228, 1, 1, 1, 1, 1,
0.138999, 0.6789487, 1.112843, 1, 1, 1, 1, 1,
0.153042, -1.416462, 3.553069, 1, 1, 1, 1, 1,
0.1550803, 0.6837956, -0.6778274, 1, 1, 1, 1, 1,
0.1570096, -2.027548, 2.222267, 1, 1, 1, 1, 1,
0.1586043, 0.5801023, -1.375746, 1, 1, 1, 1, 1,
0.1597379, 0.3039206, 2.442095, 1, 1, 1, 1, 1,
0.1599792, 0.6234427, -0.6664289, 1, 1, 1, 1, 1,
0.1605316, 0.1127032, 2.26826, 1, 1, 1, 1, 1,
0.1616154, 0.9137036, -1.047285, 1, 1, 1, 1, 1,
0.1687075, 0.2284376, 0.5125092, 0, 0, 1, 1, 1,
0.1709464, 0.461298, 1.212855, 1, 0, 0, 1, 1,
0.1729056, 1.130914, 0.2197219, 1, 0, 0, 1, 1,
0.1748164, 2.337006, -0.1706975, 1, 0, 0, 1, 1,
0.1758669, -0.5939169, 1.694376, 1, 0, 0, 1, 1,
0.1785677, -0.03568055, 1.554101, 1, 0, 0, 1, 1,
0.1796165, 0.1518227, 1.405508, 0, 0, 0, 1, 1,
0.1808304, 0.156672, 0.4231275, 0, 0, 0, 1, 1,
0.1809429, -0.8991233, 2.296191, 0, 0, 0, 1, 1,
0.182266, 0.7267053, 1.307629, 0, 0, 0, 1, 1,
0.184857, -0.9884927, 3.890291, 0, 0, 0, 1, 1,
0.1880846, 0.4393263, -0.3977652, 0, 0, 0, 1, 1,
0.1928338, 0.5989601, 0.2695436, 0, 0, 0, 1, 1,
0.1929934, -0.3712827, 1.807129, 1, 1, 1, 1, 1,
0.1964829, 0.9911178, -0.2638472, 1, 1, 1, 1, 1,
0.198071, -0.02785504, 1.740685, 1, 1, 1, 1, 1,
0.2001184, 0.4986601, 1.02211, 1, 1, 1, 1, 1,
0.2013068, -0.01496698, 2.581888, 1, 1, 1, 1, 1,
0.201551, -0.251694, 1.68442, 1, 1, 1, 1, 1,
0.2027266, 0.5260638, -1.476573, 1, 1, 1, 1, 1,
0.2076339, 0.236681, 1.854741, 1, 1, 1, 1, 1,
0.2086316, 0.5072667, 0.4952388, 1, 1, 1, 1, 1,
0.2088184, 1.856264, -1.283426, 1, 1, 1, 1, 1,
0.2097134, -0.2194651, 2.862729, 1, 1, 1, 1, 1,
0.2137532, -1.239343, 3.45173, 1, 1, 1, 1, 1,
0.218838, -0.2105372, 0.6551234, 1, 1, 1, 1, 1,
0.2188794, -0.8088618, 1.757578, 1, 1, 1, 1, 1,
0.2257592, 1.104355, 0.88352, 1, 1, 1, 1, 1,
0.2266427, 0.5991322, 0.4204756, 0, 0, 1, 1, 1,
0.2388215, -0.7296325, 2.924435, 1, 0, 0, 1, 1,
0.2389307, 0.8458152, -0.5178868, 1, 0, 0, 1, 1,
0.2404681, 0.7245748, 1.50778, 1, 0, 0, 1, 1,
0.242207, -0.2230593, 2.750182, 1, 0, 0, 1, 1,
0.2461513, -1.030439, 2.309702, 1, 0, 0, 1, 1,
0.2473544, -1.01955, 1.823418, 0, 0, 0, 1, 1,
0.2490681, 0.7129936, -1.127183, 0, 0, 0, 1, 1,
0.2495229, -1.43361, 3.672395, 0, 0, 0, 1, 1,
0.2504676, 0.0926281, 2.397247, 0, 0, 0, 1, 1,
0.251734, -1.263082, 3.970908, 0, 0, 0, 1, 1,
0.2528435, 0.2663232, 0.1319115, 0, 0, 0, 1, 1,
0.2555556, 0.07256984, 0.5867828, 0, 0, 0, 1, 1,
0.2558558, 1.080041, 1.69353, 1, 1, 1, 1, 1,
0.2604092, 0.8555014, 0.7362565, 1, 1, 1, 1, 1,
0.2609938, 1.132664, -0.5522131, 1, 1, 1, 1, 1,
0.2610539, -0.04291376, 0.9890822, 1, 1, 1, 1, 1,
0.262402, -0.2424362, 0.7676982, 1, 1, 1, 1, 1,
0.2663703, -1.531042, 2.068907, 1, 1, 1, 1, 1,
0.2691661, 1.557779, 1.569044, 1, 1, 1, 1, 1,
0.2721783, 0.475314, 0.9393337, 1, 1, 1, 1, 1,
0.2750925, -1.512889, 4.417048, 1, 1, 1, 1, 1,
0.2756287, -0.9112775, 5.05662, 1, 1, 1, 1, 1,
0.2756353, -1.961743, 1.645239, 1, 1, 1, 1, 1,
0.2765744, 0.02687732, 1.952083, 1, 1, 1, 1, 1,
0.2766433, 1.665782, 2.008002, 1, 1, 1, 1, 1,
0.2767746, 1.787043, -0.3117679, 1, 1, 1, 1, 1,
0.2789503, -1.164308, 3.973309, 1, 1, 1, 1, 1,
0.2836178, -0.9763635, 1.09913, 0, 0, 1, 1, 1,
0.283707, -0.5112236, 3.29213, 1, 0, 0, 1, 1,
0.2843226, 0.6723751, 0.4020473, 1, 0, 0, 1, 1,
0.285806, 0.6260574, 0.4238361, 1, 0, 0, 1, 1,
0.2881355, 0.005583836, 0.2188455, 1, 0, 0, 1, 1,
0.2881776, -0.7250475, 1.982445, 1, 0, 0, 1, 1,
0.2919575, 2.07699, 1.505772, 0, 0, 0, 1, 1,
0.2948893, -0.854929, 3.700637, 0, 0, 0, 1, 1,
0.2977176, 0.1875651, 0.922585, 0, 0, 0, 1, 1,
0.3031923, -0.3783695, 3.120861, 0, 0, 0, 1, 1,
0.3080902, 0.5718104, 1.258182, 0, 0, 0, 1, 1,
0.3115724, -0.5573641, 3.650187, 0, 0, 0, 1, 1,
0.313282, -0.529914, 3.149395, 0, 0, 0, 1, 1,
0.3153786, 1.584855, 1.529497, 1, 1, 1, 1, 1,
0.3158406, -0.6949618, 2.324849, 1, 1, 1, 1, 1,
0.3173154, 1.014901, -0.8109867, 1, 1, 1, 1, 1,
0.3219754, -0.9327652, 3.609315, 1, 1, 1, 1, 1,
0.3275303, 0.8431842, 1.105646, 1, 1, 1, 1, 1,
0.3275716, -0.2722674, 2.459877, 1, 1, 1, 1, 1,
0.3275935, -1.306765, 4.84569, 1, 1, 1, 1, 1,
0.3285226, 0.2170073, 1.294244, 1, 1, 1, 1, 1,
0.3342419, -1.888443, 2.331661, 1, 1, 1, 1, 1,
0.3369267, 1.375293, 0.2241597, 1, 1, 1, 1, 1,
0.3413244, 0.5905072, 0.07982641, 1, 1, 1, 1, 1,
0.3413986, 0.4338976, 0.8061243, 1, 1, 1, 1, 1,
0.3418939, -0.6958739, 1.877432, 1, 1, 1, 1, 1,
0.3420194, 1.073531, 3.286263, 1, 1, 1, 1, 1,
0.3452418, 0.3284935, -0.01733742, 1, 1, 1, 1, 1,
0.3456182, 0.7466429, 1.099259, 0, 0, 1, 1, 1,
0.3507128, -2.341886, 3.141301, 1, 0, 0, 1, 1,
0.3699504, -0.3429924, 2.237454, 1, 0, 0, 1, 1,
0.3722036, -0.6828341, 3.177932, 1, 0, 0, 1, 1,
0.3764257, 1.615314, 1.866672, 1, 0, 0, 1, 1,
0.3780139, 0.3971554, 0.8049393, 1, 0, 0, 1, 1,
0.3795341, -0.5716057, 1.554816, 0, 0, 0, 1, 1,
0.379812, 2.142512, -1.717242, 0, 0, 0, 1, 1,
0.3891229, -0.5437655, 2.793994, 0, 0, 0, 1, 1,
0.38973, -0.5086703, 3.604265, 0, 0, 0, 1, 1,
0.3899743, 0.4054942, 1.964632, 0, 0, 0, 1, 1,
0.3937411, -1.21382, 4.060324, 0, 0, 0, 1, 1,
0.3937936, -1.087774, 2.472719, 0, 0, 0, 1, 1,
0.397921, 0.1668424, -0.7772454, 1, 1, 1, 1, 1,
0.3993618, 0.2404201, 0.8779997, 1, 1, 1, 1, 1,
0.400243, 0.1009796, 1.114114, 1, 1, 1, 1, 1,
0.4010724, 1.321136, 1.822162, 1, 1, 1, 1, 1,
0.4040824, -0.264697, 4.45142, 1, 1, 1, 1, 1,
0.4063495, -0.5132573, 2.23432, 1, 1, 1, 1, 1,
0.4084457, 0.5000829, -1.300466, 1, 1, 1, 1, 1,
0.4130689, 0.3821364, -0.4082063, 1, 1, 1, 1, 1,
0.4131806, 0.2528335, 1.499931, 1, 1, 1, 1, 1,
0.4141268, -1.743469, 2.926733, 1, 1, 1, 1, 1,
0.4167951, 1.10069, 0.4614691, 1, 1, 1, 1, 1,
0.4184068, -1.219155, 3.980808, 1, 1, 1, 1, 1,
0.4207116, 0.7769479, 0.2834788, 1, 1, 1, 1, 1,
0.4250273, 1.210919, 0.7270283, 1, 1, 1, 1, 1,
0.4309095, 0.7808831, -0.145254, 1, 1, 1, 1, 1,
0.4363183, -1.53499, 3.087185, 0, 0, 1, 1, 1,
0.4382426, -0.9297409, 1.629826, 1, 0, 0, 1, 1,
0.4412499, 0.117562, 1.358457, 1, 0, 0, 1, 1,
0.4438647, -1.400539, 2.394368, 1, 0, 0, 1, 1,
0.4461708, 0.8013393, -0.0166739, 1, 0, 0, 1, 1,
0.449487, 0.7586173, 1.782476, 1, 0, 0, 1, 1,
0.4563085, -0.9638405, 3.276825, 0, 0, 0, 1, 1,
0.4573096, 0.1254107, 2.348337, 0, 0, 0, 1, 1,
0.4585531, 1.132579, -1.789582, 0, 0, 0, 1, 1,
0.4600425, -0.5147933, 0.8965067, 0, 0, 0, 1, 1,
0.4604941, 2.75219, 0.4077823, 0, 0, 0, 1, 1,
0.4658904, -0.5873138, 2.152417, 0, 0, 0, 1, 1,
0.4698069, 0.2264026, 0.628698, 0, 0, 0, 1, 1,
0.4770015, 0.9464298, 1.256793, 1, 1, 1, 1, 1,
0.4775627, -1.111238, 0.8615804, 1, 1, 1, 1, 1,
0.4791712, 1.31563, 0.5332582, 1, 1, 1, 1, 1,
0.4802163, -0.447294, 3.380257, 1, 1, 1, 1, 1,
0.4809219, 0.6214002, 1.05995, 1, 1, 1, 1, 1,
0.4826971, -0.1478913, 1.991227, 1, 1, 1, 1, 1,
0.4850836, -0.9042682, 2.550891, 1, 1, 1, 1, 1,
0.4901941, 1.51292, 0.04977832, 1, 1, 1, 1, 1,
0.4988253, 0.08838831, 0.4502165, 1, 1, 1, 1, 1,
0.5025084, -0.8125644, 2.351709, 1, 1, 1, 1, 1,
0.5164292, -0.3007056, 2.217276, 1, 1, 1, 1, 1,
0.5199256, -0.1523731, 1.595313, 1, 1, 1, 1, 1,
0.5249571, -0.8498504, 4.85617, 1, 1, 1, 1, 1,
0.5256673, 1.159142, 0.4081824, 1, 1, 1, 1, 1,
0.5263442, -0.6415522, 1.484753, 1, 1, 1, 1, 1,
0.5265614, 0.1530204, 2.898213, 0, 0, 1, 1, 1,
0.5291682, -0.2180036, 2.337911, 1, 0, 0, 1, 1,
0.5319161, -1.252236, 0.8175152, 1, 0, 0, 1, 1,
0.5369429, 1.088549, -1.400761, 1, 0, 0, 1, 1,
0.5414962, -0.3849585, 1.844522, 1, 0, 0, 1, 1,
0.5436105, 1.60903, -1.522265, 1, 0, 0, 1, 1,
0.5502006, -0.3970273, 2.390394, 0, 0, 0, 1, 1,
0.5507607, -0.2005142, -0.4895608, 0, 0, 0, 1, 1,
0.5521856, 0.569602, 0.8245582, 0, 0, 0, 1, 1,
0.5528406, -0.5241716, 1.930542, 0, 0, 0, 1, 1,
0.5600976, -0.9222974, 2.899092, 0, 0, 0, 1, 1,
0.5687466, -0.7344557, 2.13939, 0, 0, 0, 1, 1,
0.5697465, -0.2985626, 2.256833, 0, 0, 0, 1, 1,
0.5806848, -1.147567, 3.018313, 1, 1, 1, 1, 1,
0.5819883, 0.300767, 2.043987, 1, 1, 1, 1, 1,
0.586045, -0.9130833, 2.34027, 1, 1, 1, 1, 1,
0.5861201, -0.1245469, 1.378429, 1, 1, 1, 1, 1,
0.5934166, 0.9606036, 0.9818794, 1, 1, 1, 1, 1,
0.5934477, -1.838489, 1.578234, 1, 1, 1, 1, 1,
0.5945987, -0.0497338, 1.953667, 1, 1, 1, 1, 1,
0.598765, 1.980548, -0.4749869, 1, 1, 1, 1, 1,
0.5999129, -0.04271273, 0.03073765, 1, 1, 1, 1, 1,
0.601016, -2.079133, 1.848522, 1, 1, 1, 1, 1,
0.6040637, 0.3533004, 0.09773706, 1, 1, 1, 1, 1,
0.6043276, 1.099722, 0.846858, 1, 1, 1, 1, 1,
0.604641, 1.214671, 0.8588477, 1, 1, 1, 1, 1,
0.6165214, 0.7559294, 1.625965, 1, 1, 1, 1, 1,
0.6166726, -2.300413, 1.569641, 1, 1, 1, 1, 1,
0.6210691, -1.271402, 1.604463, 0, 0, 1, 1, 1,
0.6230779, -1.216222, 2.820238, 1, 0, 0, 1, 1,
0.6239017, -0.666976, 2.132673, 1, 0, 0, 1, 1,
0.628424, -0.8018625, 2.524023, 1, 0, 0, 1, 1,
0.6357195, -0.8486744, 2.262032, 1, 0, 0, 1, 1,
0.6384833, -1.047989, 2.391249, 1, 0, 0, 1, 1,
0.6453441, 0.3872443, 1.561869, 0, 0, 0, 1, 1,
0.6568061, 2.119225, 0.3163127, 0, 0, 0, 1, 1,
0.6586227, -0.1467528, 2.008872, 0, 0, 0, 1, 1,
0.6604882, 2.450642, -0.9046113, 0, 0, 0, 1, 1,
0.6680167, 1.241663, 1.111374, 0, 0, 0, 1, 1,
0.6700232, -0.7089406, 2.278837, 0, 0, 0, 1, 1,
0.6742845, -0.8021474, 2.752656, 0, 0, 0, 1, 1,
0.6809248, 0.5723429, 0.5751178, 1, 1, 1, 1, 1,
0.6846759, -0.1147175, 4.439139, 1, 1, 1, 1, 1,
0.6849061, -0.7743774, 2.709831, 1, 1, 1, 1, 1,
0.6885294, 0.7595071, 0.2387381, 1, 1, 1, 1, 1,
0.6886389, -0.2773332, 4.337692, 1, 1, 1, 1, 1,
0.6908459, -1.181287, 3.371812, 1, 1, 1, 1, 1,
0.6919358, -1.397595, 2.574594, 1, 1, 1, 1, 1,
0.6919668, -1.364265, 2.619362, 1, 1, 1, 1, 1,
0.698393, 1.641515, 1.725882, 1, 1, 1, 1, 1,
0.7036085, -1.135716, 4.396925, 1, 1, 1, 1, 1,
0.7052067, -0.4074001, 1.91164, 1, 1, 1, 1, 1,
0.7053437, -0.3215569, 0.7718556, 1, 1, 1, 1, 1,
0.7084165, -0.1452495, 1.818287, 1, 1, 1, 1, 1,
0.7111841, -0.1986132, 1.856842, 1, 1, 1, 1, 1,
0.714061, -1.258156, 3.597205, 1, 1, 1, 1, 1,
0.7162709, -0.1445519, 1.925042, 0, 0, 1, 1, 1,
0.7181402, 0.5750681, 0.6555962, 1, 0, 0, 1, 1,
0.7210985, 0.3766176, 2.780959, 1, 0, 0, 1, 1,
0.7233942, -0.6856764, 2.717279, 1, 0, 0, 1, 1,
0.7258195, -1.089327, 3.728107, 1, 0, 0, 1, 1,
0.7313227, 0.6265689, 2.443369, 1, 0, 0, 1, 1,
0.7329962, -1.982652, 4.911788, 0, 0, 0, 1, 1,
0.7332744, 0.7549021, 0.2749221, 0, 0, 0, 1, 1,
0.7366769, -1.125887, 1.594626, 0, 0, 0, 1, 1,
0.7378777, -0.6288372, 3.217344, 0, 0, 0, 1, 1,
0.7395105, -1.634704, 2.190728, 0, 0, 0, 1, 1,
0.7396938, 0.7471777, 0.6018921, 0, 0, 0, 1, 1,
0.7402617, 0.383224, 2.211382, 0, 0, 0, 1, 1,
0.7444682, -0.2567236, 1.318568, 1, 1, 1, 1, 1,
0.7449321, -1.203082, 4.101675, 1, 1, 1, 1, 1,
0.7465255, -0.5401142, 1.584547, 1, 1, 1, 1, 1,
0.7505, 2.701905, 0.5545773, 1, 1, 1, 1, 1,
0.7562916, -0.4885508, 0.01705361, 1, 1, 1, 1, 1,
0.7581244, 0.6616327, 2.145154, 1, 1, 1, 1, 1,
0.7611999, 1.059877, 1.38556, 1, 1, 1, 1, 1,
0.762352, -1.021753, 2.496777, 1, 1, 1, 1, 1,
0.762992, 0.8282087, -0.2716945, 1, 1, 1, 1, 1,
0.764057, 2.620645, 0.667689, 1, 1, 1, 1, 1,
0.7673863, -0.007366122, 2.43518, 1, 1, 1, 1, 1,
0.7760862, -0.08821952, 0.1058038, 1, 1, 1, 1, 1,
0.7764576, -1.195126, 4.533564, 1, 1, 1, 1, 1,
0.7865869, 0.2824647, 2.140626, 1, 1, 1, 1, 1,
0.7889252, 0.5405895, 1.563952, 1, 1, 1, 1, 1,
0.790095, 0.2507197, 1.460798, 0, 0, 1, 1, 1,
0.7929847, 1.390373, 1.380482, 1, 0, 0, 1, 1,
0.7936609, -0.0212876, 1.609345, 1, 0, 0, 1, 1,
0.7950224, 0.2892258, 2.386216, 1, 0, 0, 1, 1,
0.7970635, -0.2541541, 2.531475, 1, 0, 0, 1, 1,
0.7972366, 0.2462849, 0.6378866, 1, 0, 0, 1, 1,
0.7992262, -0.1579481, 0.9821411, 0, 0, 0, 1, 1,
0.800482, -2.097736, 3.066876, 0, 0, 0, 1, 1,
0.8005918, 0.1628145, 1.24536, 0, 0, 0, 1, 1,
0.8029388, 0.0460578, 0.941103, 0, 0, 0, 1, 1,
0.8139891, -0.5956686, 4.112329, 0, 0, 0, 1, 1,
0.8214646, 0.6773506, -0.8368967, 0, 0, 0, 1, 1,
0.8265058, -0.5866278, 2.859463, 0, 0, 0, 1, 1,
0.8338291, 0.1783107, -0.397384, 1, 1, 1, 1, 1,
0.8358372, -0.2904372, 0.8199263, 1, 1, 1, 1, 1,
0.8358806, -0.7238645, 4.034465, 1, 1, 1, 1, 1,
0.8360262, -1.198894, 3.092446, 1, 1, 1, 1, 1,
0.8380811, 1.138383, 2.309398, 1, 1, 1, 1, 1,
0.8455417, -2.617206, 3.269521, 1, 1, 1, 1, 1,
0.8492343, 0.9382846, 0.7180583, 1, 1, 1, 1, 1,
0.8499261, -0.1596063, 2.593173, 1, 1, 1, 1, 1,
0.8529838, -0.6391659, 1.95932, 1, 1, 1, 1, 1,
0.8536713, 0.3830563, 2.256139, 1, 1, 1, 1, 1,
0.8562801, -0.8305226, 0.9270291, 1, 1, 1, 1, 1,
0.8567741, -0.3126294, 2.24837, 1, 1, 1, 1, 1,
0.8654408, 1.039835, -0.1480342, 1, 1, 1, 1, 1,
0.8657088, -1.548184, 2.481995, 1, 1, 1, 1, 1,
0.86633, -0.3952295, 4.244165, 1, 1, 1, 1, 1,
0.8760969, -0.03634634, 1.918518, 0, 0, 1, 1, 1,
0.8775108, 0.1959073, 2.948009, 1, 0, 0, 1, 1,
0.8803185, 1.625597, 0.9305636, 1, 0, 0, 1, 1,
0.8844678, 1.432699, -0.2823689, 1, 0, 0, 1, 1,
0.8877829, -0.532927, 2.016419, 1, 0, 0, 1, 1,
0.8890747, -1.473184, 4.556159, 1, 0, 0, 1, 1,
0.9025449, 1.352075, 0.4286944, 0, 0, 0, 1, 1,
0.9045057, -0.4391301, 3.397933, 0, 0, 0, 1, 1,
0.9066778, -0.9785904, 1.679361, 0, 0, 0, 1, 1,
0.908385, -0.9155052, 3.602183, 0, 0, 0, 1, 1,
0.9102605, -0.9972792, 3.043219, 0, 0, 0, 1, 1,
0.9121713, -0.2347016, 2.075403, 0, 0, 0, 1, 1,
0.9178686, -0.699793, 3.249705, 0, 0, 0, 1, 1,
0.9179233, -0.3859341, 2.545098, 1, 1, 1, 1, 1,
0.9239727, -0.9150314, 2.550288, 1, 1, 1, 1, 1,
0.927458, 0.4160828, 1.554906, 1, 1, 1, 1, 1,
0.934016, -0.7030131, 2.489259, 1, 1, 1, 1, 1,
0.936388, -0.2851555, -0.1552631, 1, 1, 1, 1, 1,
0.9391558, -0.740732, 3.025913, 1, 1, 1, 1, 1,
0.9422508, -0.8063712, 1.580033, 1, 1, 1, 1, 1,
0.9429458, -0.08513433, 2.047398, 1, 1, 1, 1, 1,
0.9453306, -0.6901933, -0.752343, 1, 1, 1, 1, 1,
0.9481402, -0.7575748, 1.703607, 1, 1, 1, 1, 1,
0.9485576, -0.1997169, 2.931066, 1, 1, 1, 1, 1,
0.9523767, 0.6144882, 0.9595315, 1, 1, 1, 1, 1,
0.9524229, -2.268628, 1.630773, 1, 1, 1, 1, 1,
0.9542506, 1.330271, -0.7476813, 1, 1, 1, 1, 1,
0.9548307, -1.511469, 2.996431, 1, 1, 1, 1, 1,
0.9597651, 1.81353, -0.03481052, 0, 0, 1, 1, 1,
0.9616904, 0.8838446, 0.7455903, 1, 0, 0, 1, 1,
0.9674803, -0.06749696, 1.188099, 1, 0, 0, 1, 1,
0.9716852, 0.553648, 1.903276, 1, 0, 0, 1, 1,
0.9771984, 0.1688575, -0.0627132, 1, 0, 0, 1, 1,
0.9801735, 1.595551, -0.7123911, 1, 0, 0, 1, 1,
0.9835671, -1.238121, 1.264618, 0, 0, 0, 1, 1,
0.9877008, -0.490943, 0.791387, 0, 0, 0, 1, 1,
0.9998673, -0.8749211, 1.538017, 0, 0, 0, 1, 1,
1.00036, 1.359371, 1.088153, 0, 0, 0, 1, 1,
1.003625, -1.545575, 1.384939, 0, 0, 0, 1, 1,
1.018804, -0.09834799, 1.473447, 0, 0, 0, 1, 1,
1.027653, 0.4584222, 1.159592, 0, 0, 0, 1, 1,
1.030406, -0.6865362, 1.885111, 1, 1, 1, 1, 1,
1.039293, -1.176087, 3.384925, 1, 1, 1, 1, 1,
1.042746, 0.8120963, 2.700654, 1, 1, 1, 1, 1,
1.04473, -0.4322478, 2.788981, 1, 1, 1, 1, 1,
1.045169, 1.054635, 2.549109, 1, 1, 1, 1, 1,
1.056059, 0.9921345, 0.6407115, 1, 1, 1, 1, 1,
1.058619, 0.7556311, 0.6886761, 1, 1, 1, 1, 1,
1.058803, -0.660628, 1.983834, 1, 1, 1, 1, 1,
1.063909, -0.3500721, 2.17024, 1, 1, 1, 1, 1,
1.066897, 0.63496, -1.162351, 1, 1, 1, 1, 1,
1.068816, -0.09245726, 1.898544, 1, 1, 1, 1, 1,
1.078112, 0.7918541, 1.75874, 1, 1, 1, 1, 1,
1.078616, -0.4717673, 1.967501, 1, 1, 1, 1, 1,
1.079138, -0.8524994, 1.717639, 1, 1, 1, 1, 1,
1.082637, -1.119906, 3.832777, 1, 1, 1, 1, 1,
1.08576, -0.5547343, 3.582465, 0, 0, 1, 1, 1,
1.086469, 0.9806421, 1.384935, 1, 0, 0, 1, 1,
1.08777, -0.2880834, 2.490618, 1, 0, 0, 1, 1,
1.091726, -0.3322318, 1.13536, 1, 0, 0, 1, 1,
1.097822, -0.740257, 3.092629, 1, 0, 0, 1, 1,
1.103246, 1.088045, -0.9496306, 1, 0, 0, 1, 1,
1.103259, 0.1748623, -0.4739624, 0, 0, 0, 1, 1,
1.11289, -3.005669, 3.599644, 0, 0, 0, 1, 1,
1.113179, -0.7324125, 2.023117, 0, 0, 0, 1, 1,
1.115088, -1.067029, 2.679308, 0, 0, 0, 1, 1,
1.125005, 1.162358, 3.284107, 0, 0, 0, 1, 1,
1.129906, 0.5237609, 2.686964, 0, 0, 0, 1, 1,
1.133934, -0.9142414, 1.576929, 0, 0, 0, 1, 1,
1.136623, 1.954917, -0.3267547, 1, 1, 1, 1, 1,
1.143672, -0.0567152, 1.91901, 1, 1, 1, 1, 1,
1.144731, -1.433654, 4.513292, 1, 1, 1, 1, 1,
1.156695, 0.4143213, 0.5088953, 1, 1, 1, 1, 1,
1.159921, -0.02508337, 1.879488, 1, 1, 1, 1, 1,
1.161831, -0.9461224, 1.709413, 1, 1, 1, 1, 1,
1.163015, 1.124976, -1.083454, 1, 1, 1, 1, 1,
1.17125, 0.6796228, -0.1917108, 1, 1, 1, 1, 1,
1.175228, 0.6351117, 2.007802, 1, 1, 1, 1, 1,
1.178838, 0.1389054, 1.498756, 1, 1, 1, 1, 1,
1.179098, -0.02615812, 0.5668673, 1, 1, 1, 1, 1,
1.179466, 0.4330589, 3.123091, 1, 1, 1, 1, 1,
1.185172, -0.6628218, 1.15079, 1, 1, 1, 1, 1,
1.192945, -0.8364083, 2.042432, 1, 1, 1, 1, 1,
1.193445, 0.5457324, -0.4109814, 1, 1, 1, 1, 1,
1.194818, 1.0967, -0.4190776, 0, 0, 1, 1, 1,
1.196356, 0.4178935, 2.198247, 1, 0, 0, 1, 1,
1.198191, -1.009333, 2.954421, 1, 0, 0, 1, 1,
1.200675, -0.2997397, 1.503529, 1, 0, 0, 1, 1,
1.208017, 2.00214, 0.7030685, 1, 0, 0, 1, 1,
1.21003, -0.610942, -0.8233531, 1, 0, 0, 1, 1,
1.212041, 0.4338154, 1.28913, 0, 0, 0, 1, 1,
1.213549, 0.3854876, 0.9345679, 0, 0, 0, 1, 1,
1.222198, 0.2002985, 3.297559, 0, 0, 0, 1, 1,
1.222269, 0.6957287, 0.8305029, 0, 0, 0, 1, 1,
1.228969, 0.6328256, 1.573539, 0, 0, 0, 1, 1,
1.235699, 0.07941365, 0.9789432, 0, 0, 0, 1, 1,
1.237346, -0.4512033, 0.6473041, 0, 0, 0, 1, 1,
1.238765, -0.35074, 2.675902, 1, 1, 1, 1, 1,
1.251806, -0.3898038, 3.836128, 1, 1, 1, 1, 1,
1.257997, 2.109894, 1.545884, 1, 1, 1, 1, 1,
1.267686, -0.4118738, 0.8957793, 1, 1, 1, 1, 1,
1.273905, 1.442461, 0.3661152, 1, 1, 1, 1, 1,
1.285549, -0.9238275, 1.793152, 1, 1, 1, 1, 1,
1.293963, 1.174581, 2.206447, 1, 1, 1, 1, 1,
1.294971, -1.184413, 2.116233, 1, 1, 1, 1, 1,
1.297834, -0.8231436, 1.744469, 1, 1, 1, 1, 1,
1.304423, 0.1224744, 1.702442, 1, 1, 1, 1, 1,
1.314647, 0.3066942, 1.598557, 1, 1, 1, 1, 1,
1.319223, 1.010324, -0.0356237, 1, 1, 1, 1, 1,
1.319599, 1.446298, 2.399711, 1, 1, 1, 1, 1,
1.319905, 0.7688264, -0.5896847, 1, 1, 1, 1, 1,
1.32126, -0.2301717, 2.117942, 1, 1, 1, 1, 1,
1.32449, -1.533913, 2.901007, 0, 0, 1, 1, 1,
1.335685, -0.4120123, 1.350395, 1, 0, 0, 1, 1,
1.337721, 0.813018, 0.8527986, 1, 0, 0, 1, 1,
1.338513, -0.9408847, 2.136989, 1, 0, 0, 1, 1,
1.340412, -0.2790607, 0.6230696, 1, 0, 0, 1, 1,
1.342937, 1.117077, 1.266095, 1, 0, 0, 1, 1,
1.356826, -0.1906458, 0.6947236, 0, 0, 0, 1, 1,
1.357415, -1.324688, 1.991935, 0, 0, 0, 1, 1,
1.368002, 1.958463, 0.5136925, 0, 0, 0, 1, 1,
1.372348, -0.3222877, 0.6741984, 0, 0, 0, 1, 1,
1.376274, -0.07400493, 3.281647, 0, 0, 0, 1, 1,
1.38409, -0.2214884, 2.29758, 0, 0, 0, 1, 1,
1.385978, 0.1818102, 0.6777338, 0, 0, 0, 1, 1,
1.391854, 0.3665313, 0.6668575, 1, 1, 1, 1, 1,
1.393803, 0.9118836, 1.89407, 1, 1, 1, 1, 1,
1.399386, -0.6326203, 3.074116, 1, 1, 1, 1, 1,
1.403665, 0.2506998, 1.374638, 1, 1, 1, 1, 1,
1.403847, -0.3545026, 2.100981, 1, 1, 1, 1, 1,
1.41253, 1.793379, 0.3274305, 1, 1, 1, 1, 1,
1.417058, -0.3803644, 0.8854766, 1, 1, 1, 1, 1,
1.42752, -1.555392, 4.512293, 1, 1, 1, 1, 1,
1.432657, 1.58733, 0.9854059, 1, 1, 1, 1, 1,
1.432751, 0.5982559, 1.896918, 1, 1, 1, 1, 1,
1.437253, 0.03738258, 2.763409, 1, 1, 1, 1, 1,
1.440099, 1.427697, 0.368601, 1, 1, 1, 1, 1,
1.440593, -0.5960006, 2.414096, 1, 1, 1, 1, 1,
1.445703, -0.9687364, 1.832776, 1, 1, 1, 1, 1,
1.456939, 0.7393969, 1.515503, 1, 1, 1, 1, 1,
1.463322, 1.962362, 0.3240747, 0, 0, 1, 1, 1,
1.466328, -0.6161761, 1.661724, 1, 0, 0, 1, 1,
1.469205, -2.201834, 2.876154, 1, 0, 0, 1, 1,
1.472406, 1.363407, 0.8852528, 1, 0, 0, 1, 1,
1.48066, 1.650619, 0.6161252, 1, 0, 0, 1, 1,
1.480755, -1.411956, 1.233739, 1, 0, 0, 1, 1,
1.498008, -0.336284, 1.231896, 0, 0, 0, 1, 1,
1.512432, -0.4447985, 2.25504, 0, 0, 0, 1, 1,
1.531359, 0.6136035, 0.9248246, 0, 0, 0, 1, 1,
1.536107, -0.8124085, 2.032945, 0, 0, 0, 1, 1,
1.538503, 0.8897344, 1.708146, 0, 0, 0, 1, 1,
1.544263, -1.07965, 2.370776, 0, 0, 0, 1, 1,
1.546219, -1.353761, 4.500533, 0, 0, 0, 1, 1,
1.558758, 2.46055, -0.5884892, 1, 1, 1, 1, 1,
1.564151, 0.04864482, 2.19648, 1, 1, 1, 1, 1,
1.566312, -0.2683169, 1.34249, 1, 1, 1, 1, 1,
1.572194, -0.1514356, 2.649763, 1, 1, 1, 1, 1,
1.573607, 1.474487, 0.9162301, 1, 1, 1, 1, 1,
1.580487, 1.099704, 2.054537, 1, 1, 1, 1, 1,
1.598117, -2.64848, 4.170185, 1, 1, 1, 1, 1,
1.59832, 0.9381605, 0.365985, 1, 1, 1, 1, 1,
1.605595, -0.1370254, 0.07683741, 1, 1, 1, 1, 1,
1.605996, 1.462273, 1.142128, 1, 1, 1, 1, 1,
1.609912, -0.06245318, 0.3910879, 1, 1, 1, 1, 1,
1.618858, -0.1361549, 2.006066, 1, 1, 1, 1, 1,
1.621316, -1.733314, 1.709488, 1, 1, 1, 1, 1,
1.638495, 3.09043, 1.527453, 1, 1, 1, 1, 1,
1.646622, -0.9533052, 2.312243, 1, 1, 1, 1, 1,
1.654241, -0.02819922, -2.160974, 0, 0, 1, 1, 1,
1.677576, -1.964852, 2.116814, 1, 0, 0, 1, 1,
1.689057, -1.298602, 2.60783, 1, 0, 0, 1, 1,
1.69298, -1.395042, 1.760657, 1, 0, 0, 1, 1,
1.706788, -1.496106, 2.143661, 1, 0, 0, 1, 1,
1.729022, -0.6373054, 2.693904, 1, 0, 0, 1, 1,
1.768727, 0.7868685, 1.63341, 0, 0, 0, 1, 1,
1.788526, 0.03551579, 3.152516, 0, 0, 0, 1, 1,
1.795232, -1.461781, 1.781003, 0, 0, 0, 1, 1,
1.807577, 0.421891, -0.4497502, 0, 0, 0, 1, 1,
1.820238, -0.3261708, 1.988871, 0, 0, 0, 1, 1,
1.82149, -0.4608667, 2.140569, 0, 0, 0, 1, 1,
1.822294, 1.851953, -0.5038401, 0, 0, 0, 1, 1,
1.860362, -0.9527639, 1.390283, 1, 1, 1, 1, 1,
1.862287, -1.484835, 2.949686, 1, 1, 1, 1, 1,
1.878902, 0.2181394, 3.145804, 1, 1, 1, 1, 1,
1.880112, -1.028679, 3.686238, 1, 1, 1, 1, 1,
1.890503, 0.7441144, 1.554515, 1, 1, 1, 1, 1,
1.890812, -0.4401724, 2.317775, 1, 1, 1, 1, 1,
1.89294, 0.4152385, 1.261969, 1, 1, 1, 1, 1,
1.89667, -0.4853886, 1.40625, 1, 1, 1, 1, 1,
1.911468, -1.713052, 4.365612, 1, 1, 1, 1, 1,
1.967378, 0.4215508, 1.911065, 1, 1, 1, 1, 1,
1.96843, -0.1337869, 1.028227, 1, 1, 1, 1, 1,
1.975423, 0.1313117, 1.354555, 1, 1, 1, 1, 1,
1.976458, -0.8829002, 2.06443, 1, 1, 1, 1, 1,
2.000037, 1.135483, 1.936291, 1, 1, 1, 1, 1,
2.037348, 0.08296791, 1.111147, 1, 1, 1, 1, 1,
2.042274, 1.568154, 1.763788, 0, 0, 1, 1, 1,
2.061853, -1.334533, 2.440158, 1, 0, 0, 1, 1,
2.079141, -0.7311122, 0.6075795, 1, 0, 0, 1, 1,
2.163183, -0.1548817, 3.41815, 1, 0, 0, 1, 1,
2.184994, -0.9526358, 2.257897, 1, 0, 0, 1, 1,
2.187446, -0.1682412, 1.722319, 1, 0, 0, 1, 1,
2.205563, 2.620573, 2.116493, 0, 0, 0, 1, 1,
2.214051, 0.4269533, 1.359997, 0, 0, 0, 1, 1,
2.217515, 0.8316833, 1.474252, 0, 0, 0, 1, 1,
2.218513, -0.4695706, 1.477747, 0, 0, 0, 1, 1,
2.298385, -0.4121706, 2.638468, 0, 0, 0, 1, 1,
2.307555, 0.4660949, 0.8477276, 0, 0, 0, 1, 1,
2.311372, -0.2881689, 0.8119688, 0, 0, 0, 1, 1,
2.33437, -0.1725481, 1.589963, 1, 1, 1, 1, 1,
2.416629, 0.5061855, 1.37201, 1, 1, 1, 1, 1,
2.726018, 1.179323, 0.9190832, 1, 1, 1, 1, 1,
2.912598, 0.9375324, 1.580244, 1, 1, 1, 1, 1,
3.071876, -2.64886, 2.771337, 1, 1, 1, 1, 1,
3.150524, -0.08397263, 1.05147, 1, 1, 1, 1, 1,
3.176135, -0.2962576, 2.363795, 1, 1, 1, 1, 1
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
var radius = 9.164764;
var distance = 32.19085;
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
mvMatrix.translate( -0.02399707, -0.04238081, -0.07425642 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.19085);
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
