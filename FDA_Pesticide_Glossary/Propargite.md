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
-2.878732, 2.099472, -1.958062, 1, 0, 0, 1,
-2.763516, -0.9527181, -3.900007, 1, 0.007843138, 0, 1,
-2.702311, 0.5501245, -1.222629, 1, 0.01176471, 0, 1,
-2.632706, 0.8310181, -2.11985, 1, 0.01960784, 0, 1,
-2.390018, 0.2300416, -2.9486, 1, 0.02352941, 0, 1,
-2.347924, -0.9503677, -1.991799, 1, 0.03137255, 0, 1,
-2.268434, 1.355318, -1.272712, 1, 0.03529412, 0, 1,
-2.228497, -2.354501, -3.028265, 1, 0.04313726, 0, 1,
-2.18269, -0.3228398, -0.6249597, 1, 0.04705882, 0, 1,
-2.166085, 0.3390296, -1.44546, 1, 0.05490196, 0, 1,
-2.154893, -0.4747363, 0.16927, 1, 0.05882353, 0, 1,
-2.077412, -0.8856553, -1.448672, 1, 0.06666667, 0, 1,
-2.061909, 0.7582944, -1.091533, 1, 0.07058824, 0, 1,
-2.055835, 0.869196, -1.845501, 1, 0.07843138, 0, 1,
-1.997744, 0.6594225, 0.05794446, 1, 0.08235294, 0, 1,
-1.915485, 0.3263494, -0.6757205, 1, 0.09019608, 0, 1,
-1.895258, -2.399522, -3.098797, 1, 0.09411765, 0, 1,
-1.89173, 0.2838821, -0.7644818, 1, 0.1019608, 0, 1,
-1.885946, 0.4887832, -1.850742, 1, 0.1098039, 0, 1,
-1.874689, 0.01941757, 0.5680661, 1, 0.1137255, 0, 1,
-1.867953, 0.06725084, -2.472973, 1, 0.1215686, 0, 1,
-1.865102, 0.7670363, -0.3005834, 1, 0.1254902, 0, 1,
-1.859176, -0.4342683, -2.108836, 1, 0.1333333, 0, 1,
-1.813112, -0.3960811, -0.7161735, 1, 0.1372549, 0, 1,
-1.81136, 0.5808401, -1.452295, 1, 0.145098, 0, 1,
-1.78749, 0.333587, -0.5212643, 1, 0.1490196, 0, 1,
-1.768949, -0.03353271, -0.6722008, 1, 0.1568628, 0, 1,
-1.762761, 2.068422, 0.02595966, 1, 0.1607843, 0, 1,
-1.759629, 0.254618, -1.758475, 1, 0.1686275, 0, 1,
-1.753739, -0.5262058, -0.242162, 1, 0.172549, 0, 1,
-1.742931, 0.574634, -0.2596013, 1, 0.1803922, 0, 1,
-1.7424, 2.270417, -0.9542344, 1, 0.1843137, 0, 1,
-1.740241, -0.6344994, -2.18333, 1, 0.1921569, 0, 1,
-1.73949, 0.9636369, -1.760272, 1, 0.1960784, 0, 1,
-1.736457, -0.1954571, -1.401045, 1, 0.2039216, 0, 1,
-1.72546, -0.9032628, -0.9537786, 1, 0.2117647, 0, 1,
-1.722783, 1.35805, -1.708171, 1, 0.2156863, 0, 1,
-1.71897, -1.295141, -1.954788, 1, 0.2235294, 0, 1,
-1.703054, -0.6915522, -1.572548, 1, 0.227451, 0, 1,
-1.692545, 1.727821, -1.433463, 1, 0.2352941, 0, 1,
-1.686327, -2.304082, -1.960232, 1, 0.2392157, 0, 1,
-1.671998, -0.7419627, -2.37074, 1, 0.2470588, 0, 1,
-1.66585, 2.348595, -1.1856, 1, 0.2509804, 0, 1,
-1.653136, 0.5974212, -1.282317, 1, 0.2588235, 0, 1,
-1.649987, -0.9683264, -1.207042, 1, 0.2627451, 0, 1,
-1.648416, -0.05951155, -0.4954201, 1, 0.2705882, 0, 1,
-1.645644, 1.870883, -3.168731, 1, 0.2745098, 0, 1,
-1.642555, 0.8283689, -0.4013067, 1, 0.282353, 0, 1,
-1.641284, -0.966358, -2.651346, 1, 0.2862745, 0, 1,
-1.63939, -0.3147614, -2.353958, 1, 0.2941177, 0, 1,
-1.607115, 0.8965942, -2.34325, 1, 0.3019608, 0, 1,
-1.604768, -0.4230198, -2.94615, 1, 0.3058824, 0, 1,
-1.59217, -1.390155, -1.996306, 1, 0.3137255, 0, 1,
-1.590593, -0.8576214, -1.508415, 1, 0.3176471, 0, 1,
-1.584646, -0.2370404, -2.875674, 1, 0.3254902, 0, 1,
-1.582199, -0.6200278, -2.910086, 1, 0.3294118, 0, 1,
-1.564846, 0.3072517, -2.005946, 1, 0.3372549, 0, 1,
-1.544075, 0.4529872, 1.00164, 1, 0.3411765, 0, 1,
-1.540713, 0.03308412, -1.168653, 1, 0.3490196, 0, 1,
-1.533417, -1.678756, -2.255409, 1, 0.3529412, 0, 1,
-1.531201, 0.9063321, -1.065415, 1, 0.3607843, 0, 1,
-1.530656, -0.8861163, -3.1075, 1, 0.3647059, 0, 1,
-1.519937, -0.3954609, -0.026482, 1, 0.372549, 0, 1,
-1.515697, 1.055166, -1.861204, 1, 0.3764706, 0, 1,
-1.513827, -0.7241386, -2.792181, 1, 0.3843137, 0, 1,
-1.507589, 0.764532, 0.162297, 1, 0.3882353, 0, 1,
-1.496415, -0.3049959, -0.9677009, 1, 0.3960784, 0, 1,
-1.491972, -1.149819, -0.1085343, 1, 0.4039216, 0, 1,
-1.489437, -2.286048, -1.984913, 1, 0.4078431, 0, 1,
-1.474366, -1.033127, -2.881952, 1, 0.4156863, 0, 1,
-1.459589, -0.4103025, -3.609079, 1, 0.4196078, 0, 1,
-1.453939, 0.9645213, -1.172622, 1, 0.427451, 0, 1,
-1.453602, 1.666462, -0.25214, 1, 0.4313726, 0, 1,
-1.447185, -1.378919, -3.095062, 1, 0.4392157, 0, 1,
-1.442187, -0.1612678, -1.864677, 1, 0.4431373, 0, 1,
-1.43411, 0.8628815, 0.3433678, 1, 0.4509804, 0, 1,
-1.432645, 0.4144203, -0.7008832, 1, 0.454902, 0, 1,
-1.426847, -1.549302, -1.548897, 1, 0.4627451, 0, 1,
-1.387084, -0.2474691, -1.758182, 1, 0.4666667, 0, 1,
-1.380272, 0.2231004, -1.37474, 1, 0.4745098, 0, 1,
-1.379035, 3.232116, -0.1322293, 1, 0.4784314, 0, 1,
-1.362654, -0.3006077, -2.07968, 1, 0.4862745, 0, 1,
-1.355157, -0.6206189, -0.9465172, 1, 0.4901961, 0, 1,
-1.344554, 1.320249, -1.048419, 1, 0.4980392, 0, 1,
-1.344163, -1.778304, -1.494942, 1, 0.5058824, 0, 1,
-1.341735, -0.2807258, -1.633211, 1, 0.509804, 0, 1,
-1.336468, 0.5061911, -0.8788399, 1, 0.5176471, 0, 1,
-1.331226, -2.308818, -2.384675, 1, 0.5215687, 0, 1,
-1.32089, 1.20704, -1.07589, 1, 0.5294118, 0, 1,
-1.318383, -0.1991088, -0.9319557, 1, 0.5333334, 0, 1,
-1.313907, -0.3358276, -3.001859, 1, 0.5411765, 0, 1,
-1.309722, 2.438377, 0.4249806, 1, 0.5450981, 0, 1,
-1.309176, -1.168526, -1.539678, 1, 0.5529412, 0, 1,
-1.305756, 0.7150574, -0.8090496, 1, 0.5568628, 0, 1,
-1.294532, 0.1530575, -0.7321938, 1, 0.5647059, 0, 1,
-1.293212, -0.4085509, -1.560799, 1, 0.5686275, 0, 1,
-1.292403, 1.59959, -0.9050703, 1, 0.5764706, 0, 1,
-1.284828, -0.2133859, -2.186167, 1, 0.5803922, 0, 1,
-1.282488, -1.114047, -2.285956, 1, 0.5882353, 0, 1,
-1.278378, 0.9440857, 0.3440644, 1, 0.5921569, 0, 1,
-1.275575, 0.7253323, -2.163661, 1, 0.6, 0, 1,
-1.270287, -0.7325094, -2.773762, 1, 0.6078432, 0, 1,
-1.268792, -0.9290547, 0.102207, 1, 0.6117647, 0, 1,
-1.264261, -0.6740927, -1.50326, 1, 0.6196079, 0, 1,
-1.25893, -1.142652, -2.707923, 1, 0.6235294, 0, 1,
-1.258485, -1.315383, -3.062191, 1, 0.6313726, 0, 1,
-1.255038, 1.295993, -0.9390732, 1, 0.6352941, 0, 1,
-1.253133, -0.3533174, -1.848826, 1, 0.6431373, 0, 1,
-1.24026, 1.035774, -0.1562323, 1, 0.6470588, 0, 1,
-1.239715, 0.8329898, -0.6399263, 1, 0.654902, 0, 1,
-1.23684, -0.4575346, -2.675165, 1, 0.6588235, 0, 1,
-1.23653, 0.3454384, -1.434098, 1, 0.6666667, 0, 1,
-1.235156, 0.009125541, -0.9075459, 1, 0.6705883, 0, 1,
-1.231411, -1.228143, -0.5380826, 1, 0.6784314, 0, 1,
-1.227301, -0.8051067, -1.573008, 1, 0.682353, 0, 1,
-1.225531, -0.06845777, -2.929446, 1, 0.6901961, 0, 1,
-1.213357, -0.2006039, -3.255896, 1, 0.6941177, 0, 1,
-1.207141, 1.150771, 0.002144141, 1, 0.7019608, 0, 1,
-1.206497, 1.200105, -2.934175, 1, 0.7098039, 0, 1,
-1.200181, -0.7493193, -2.7642, 1, 0.7137255, 0, 1,
-1.198536, 1.175275, -1.268556, 1, 0.7215686, 0, 1,
-1.182066, 2.092085, -1.166114, 1, 0.7254902, 0, 1,
-1.179383, 0.04925826, -0.1104483, 1, 0.7333333, 0, 1,
-1.179062, 0.2103382, -0.7782297, 1, 0.7372549, 0, 1,
-1.170906, -0.2829072, -3.611114, 1, 0.7450981, 0, 1,
-1.155206, 0.5588304, -1.76539, 1, 0.7490196, 0, 1,
-1.132604, 0.4793075, 0.09298539, 1, 0.7568628, 0, 1,
-1.130314, 0.9080968, -1.399913, 1, 0.7607843, 0, 1,
-1.09658, -1.902351, -2.364355, 1, 0.7686275, 0, 1,
-1.091242, 1.379987, -0.5982823, 1, 0.772549, 0, 1,
-1.090359, 0.2969461, -0.4866599, 1, 0.7803922, 0, 1,
-1.086651, -1.772326, -2.668008, 1, 0.7843137, 0, 1,
-1.083511, -1.070187, -2.712295, 1, 0.7921569, 0, 1,
-1.082531, -0.1898951, -1.160008, 1, 0.7960784, 0, 1,
-1.082475, 2.562211, 2.475986, 1, 0.8039216, 0, 1,
-1.074729, -0.08504317, -2.839206, 1, 0.8117647, 0, 1,
-1.063589, 0.8508126, -1.787795, 1, 0.8156863, 0, 1,
-1.063427, 1.006378, -1.220589, 1, 0.8235294, 0, 1,
-1.056428, 0.9104789, 0.05168405, 1, 0.827451, 0, 1,
-1.051474, -0.04402285, -1.488709, 1, 0.8352941, 0, 1,
-1.04748, -0.3120769, -0.9782855, 1, 0.8392157, 0, 1,
-1.042404, 0.3497135, 0.06589417, 1, 0.8470588, 0, 1,
-1.040826, -1.764324, -3.267992, 1, 0.8509804, 0, 1,
-1.035438, 0.1609408, -2.054386, 1, 0.8588235, 0, 1,
-1.028517, 0.2648274, -2.280609, 1, 0.8627451, 0, 1,
-1.02805, -0.4296429, -2.283741, 1, 0.8705882, 0, 1,
-1.023036, -0.6582073, -4.41246, 1, 0.8745098, 0, 1,
-1.021458, 0.9825795, -0.3751895, 1, 0.8823529, 0, 1,
-1.020786, -1.359294, -1.667314, 1, 0.8862745, 0, 1,
-1.016386, 1.070346, 0.1313174, 1, 0.8941177, 0, 1,
-1.006292, -0.5639983, -3.582781, 1, 0.8980392, 0, 1,
-1.005826, -0.2396601, -1.332046, 1, 0.9058824, 0, 1,
-0.9875754, 0.9168745, -0.007036206, 1, 0.9137255, 0, 1,
-0.9866262, -2.721614, -2.000205, 1, 0.9176471, 0, 1,
-0.9862997, -0.3402109, -2.208678, 1, 0.9254902, 0, 1,
-0.9856325, -0.8802457, -1.223997, 1, 0.9294118, 0, 1,
-0.9849473, -0.1871326, -2.894262, 1, 0.9372549, 0, 1,
-0.9794208, 0.2617612, -2.734598, 1, 0.9411765, 0, 1,
-0.974235, -0.3179378, -3.257079, 1, 0.9490196, 0, 1,
-0.9728929, -1.734292, -3.556777, 1, 0.9529412, 0, 1,
-0.9692786, 1.241548, -2.529543, 1, 0.9607843, 0, 1,
-0.9685746, 1.200321, 0.6512012, 1, 0.9647059, 0, 1,
-0.9672601, 1.155748, -0.494317, 1, 0.972549, 0, 1,
-0.9609404, -0.8842882, -2.988515, 1, 0.9764706, 0, 1,
-0.9607917, -1.6211, -1.696508, 1, 0.9843137, 0, 1,
-0.9594042, 2.076755, 1.042015, 1, 0.9882353, 0, 1,
-0.9479039, -0.1864695, -2.717966, 1, 0.9960784, 0, 1,
-0.9474623, 0.8564371, -0.871869, 0.9960784, 1, 0, 1,
-0.9449306, -0.1000647, -0.9565809, 0.9921569, 1, 0, 1,
-0.9427807, 2.131646, 0.2828586, 0.9843137, 1, 0, 1,
-0.9406283, 0.4030026, -0.4868821, 0.9803922, 1, 0, 1,
-0.9359503, 2.07627, -2.089909, 0.972549, 1, 0, 1,
-0.9335776, -0.4941427, -1.607379, 0.9686275, 1, 0, 1,
-0.9310597, -0.08579975, -3.508542, 0.9607843, 1, 0, 1,
-0.9290142, -1.241031, -1.992696, 0.9568627, 1, 0, 1,
-0.9265766, -0.09592563, -2.766186, 0.9490196, 1, 0, 1,
-0.9224259, -0.8455284, -2.310159, 0.945098, 1, 0, 1,
-0.9149069, 0.5304804, -2.331501, 0.9372549, 1, 0, 1,
-0.9103243, -1.241406, -1.866789, 0.9333333, 1, 0, 1,
-0.9038886, -0.6728911, -1.707738, 0.9254902, 1, 0, 1,
-0.899702, 0.4778597, -1.307361, 0.9215686, 1, 0, 1,
-0.8990818, 0.1745197, -1.741055, 0.9137255, 1, 0, 1,
-0.8966904, -0.3696023, -0.3614694, 0.9098039, 1, 0, 1,
-0.8895627, 0.7686083, -0.3373304, 0.9019608, 1, 0, 1,
-0.8885406, -1.010939, -1.746398, 0.8941177, 1, 0, 1,
-0.8859718, 1.028844, -1.608516, 0.8901961, 1, 0, 1,
-0.8840644, 1.542554, -0.4082436, 0.8823529, 1, 0, 1,
-0.8738381, -0.3120327, -0.03465256, 0.8784314, 1, 0, 1,
-0.8729223, -0.009333276, 0.7810446, 0.8705882, 1, 0, 1,
-0.8705532, -1.00694, -3.691918, 0.8666667, 1, 0, 1,
-0.8703226, -0.01167979, -1.882917, 0.8588235, 1, 0, 1,
-0.8662544, -1.213027, -3.275919, 0.854902, 1, 0, 1,
-0.8661012, 1.143689, -0.1394619, 0.8470588, 1, 0, 1,
-0.8651762, -0.2930301, -1.653822, 0.8431373, 1, 0, 1,
-0.8622326, -0.2965242, -0.2036218, 0.8352941, 1, 0, 1,
-0.8597503, 0.2490623, -0.9463945, 0.8313726, 1, 0, 1,
-0.8581401, 0.08197928, -0.6428057, 0.8235294, 1, 0, 1,
-0.8522567, 1.110639, -1.745394, 0.8196079, 1, 0, 1,
-0.8511838, 0.2706477, -1.120364, 0.8117647, 1, 0, 1,
-0.850215, -0.1631075, -2.263233, 0.8078431, 1, 0, 1,
-0.8498695, 1.000234, 0.4499968, 0.8, 1, 0, 1,
-0.8407019, 0.1320003, -0.6778385, 0.7921569, 1, 0, 1,
-0.8381785, 0.150314, -1.390191, 0.7882353, 1, 0, 1,
-0.8222916, 0.6509756, -2.322294, 0.7803922, 1, 0, 1,
-0.8158869, -0.1983082, -2.672783, 0.7764706, 1, 0, 1,
-0.8082594, -0.7015703, -3.206375, 0.7686275, 1, 0, 1,
-0.8080447, -1.31109, -1.95925, 0.7647059, 1, 0, 1,
-0.805932, -0.2047955, -2.211009, 0.7568628, 1, 0, 1,
-0.8012902, 1.781434, -2.234614, 0.7529412, 1, 0, 1,
-0.7974844, -2.253584, -3.522582, 0.7450981, 1, 0, 1,
-0.7974373, 0.4163679, -2.286312, 0.7411765, 1, 0, 1,
-0.7927734, 0.9983851, -2.589963, 0.7333333, 1, 0, 1,
-0.7847662, 1.180244, -1.102473, 0.7294118, 1, 0, 1,
-0.7724246, -0.565771, -0.925554, 0.7215686, 1, 0, 1,
-0.7721578, -1.300874, -2.322307, 0.7176471, 1, 0, 1,
-0.7693893, -0.7362497, -2.480929, 0.7098039, 1, 0, 1,
-0.7675295, 0.1719142, -1.501544, 0.7058824, 1, 0, 1,
-0.761198, -0.2700317, -1.403662, 0.6980392, 1, 0, 1,
-0.7588016, -0.5940894, -1.878058, 0.6901961, 1, 0, 1,
-0.7576413, -1.517506, -4.456981, 0.6862745, 1, 0, 1,
-0.7573619, 0.03990258, -1.877097, 0.6784314, 1, 0, 1,
-0.7573431, -0.3802703, -2.547694, 0.6745098, 1, 0, 1,
-0.755262, -2.194277, -0.08906168, 0.6666667, 1, 0, 1,
-0.7541685, 0.3487124, -2.408703, 0.6627451, 1, 0, 1,
-0.7499596, 0.1246647, -2.198501, 0.654902, 1, 0, 1,
-0.7477207, 0.7204861, -1.251619, 0.6509804, 1, 0, 1,
-0.7420095, 0.3819119, -0.2938936, 0.6431373, 1, 0, 1,
-0.7384518, 0.5007405, 0.4056569, 0.6392157, 1, 0, 1,
-0.7354457, -0.2820939, -1.571486, 0.6313726, 1, 0, 1,
-0.7340344, 0.2044208, -2.762129, 0.627451, 1, 0, 1,
-0.7225522, 0.673294, -0.1416467, 0.6196079, 1, 0, 1,
-0.7221261, 0.1178855, -1.852389, 0.6156863, 1, 0, 1,
-0.7147725, 0.4400181, -0.7408859, 0.6078432, 1, 0, 1,
-0.7105735, 0.2063794, -3.252531, 0.6039216, 1, 0, 1,
-0.6974062, -1.38291, -3.236901, 0.5960785, 1, 0, 1,
-0.6964234, 0.1693367, -1.133843, 0.5882353, 1, 0, 1,
-0.6951185, 0.2483186, -0.4756845, 0.5843138, 1, 0, 1,
-0.6865044, -0.8351347, -1.439561, 0.5764706, 1, 0, 1,
-0.6850461, -0.6362638, -0.6474041, 0.572549, 1, 0, 1,
-0.683785, -0.03425799, -1.448802, 0.5647059, 1, 0, 1,
-0.6836526, 0.455994, -0.8514593, 0.5607843, 1, 0, 1,
-0.6819279, 2.418072, -0.1776655, 0.5529412, 1, 0, 1,
-0.6783895, 0.2033673, -1.226406, 0.5490196, 1, 0, 1,
-0.6773323, 1.15579, 1.054857, 0.5411765, 1, 0, 1,
-0.6757401, -0.7030309, -2.875852, 0.5372549, 1, 0, 1,
-0.6754388, 0.01834733, -2.702821, 0.5294118, 1, 0, 1,
-0.6708078, -0.01666501, -2.476296, 0.5254902, 1, 0, 1,
-0.6677572, -0.5054758, -2.112895, 0.5176471, 1, 0, 1,
-0.6648656, -1.178939, -1.138766, 0.5137255, 1, 0, 1,
-0.6647646, -0.01821422, -1.627025, 0.5058824, 1, 0, 1,
-0.6616015, 0.4127229, -2.60945, 0.5019608, 1, 0, 1,
-0.6565524, -0.6001024, -2.952402, 0.4941176, 1, 0, 1,
-0.6558741, 0.0489033, -1.768661, 0.4862745, 1, 0, 1,
-0.6557091, 1.4073, -2.21246, 0.4823529, 1, 0, 1,
-0.6512383, 0.3695199, 0.4096644, 0.4745098, 1, 0, 1,
-0.6509649, -1.172599, -3.204409, 0.4705882, 1, 0, 1,
-0.645994, 0.5108083, -0.1682355, 0.4627451, 1, 0, 1,
-0.6426486, 1.445147, -0.1144361, 0.4588235, 1, 0, 1,
-0.6337013, -0.3393821, -3.266633, 0.4509804, 1, 0, 1,
-0.6336069, 1.724471, -0.5005574, 0.4470588, 1, 0, 1,
-0.6324188, -0.4223264, -1.693892, 0.4392157, 1, 0, 1,
-0.6253665, 1.157987, -1.595821, 0.4352941, 1, 0, 1,
-0.6196249, 1.397304, -0.8120276, 0.427451, 1, 0, 1,
-0.6157479, -0.521585, -1.235552, 0.4235294, 1, 0, 1,
-0.613065, -1.014428, -0.2279378, 0.4156863, 1, 0, 1,
-0.6098598, 0.6517447, -0.1530564, 0.4117647, 1, 0, 1,
-0.6061783, 0.8294666, -1.413153, 0.4039216, 1, 0, 1,
-0.6038206, 0.2350729, -1.45416, 0.3960784, 1, 0, 1,
-0.6032807, 0.2159414, -0.2945957, 0.3921569, 1, 0, 1,
-0.6008365, -0.5063658, -1.72243, 0.3843137, 1, 0, 1,
-0.5985139, -0.5215608, -1.057608, 0.3803922, 1, 0, 1,
-0.5985138, 2.074904, -0.6498479, 0.372549, 1, 0, 1,
-0.5955637, 0.3335125, -0.2498849, 0.3686275, 1, 0, 1,
-0.595484, -1.877979, -2.770549, 0.3607843, 1, 0, 1,
-0.5930485, -1.57594, -1.617115, 0.3568628, 1, 0, 1,
-0.589794, -0.7170865, -0.8508831, 0.3490196, 1, 0, 1,
-0.5865865, 0.248015, -0.5989934, 0.345098, 1, 0, 1,
-0.5845888, 0.2179714, -1.584446, 0.3372549, 1, 0, 1,
-0.5826306, -0.3756653, -0.9987836, 0.3333333, 1, 0, 1,
-0.5746725, -0.8551876, -1.437195, 0.3254902, 1, 0, 1,
-0.5734484, -0.9990252, -4.077803, 0.3215686, 1, 0, 1,
-0.5721855, 0.2224456, -0.4543349, 0.3137255, 1, 0, 1,
-0.5714009, 0.734872, 0.03399274, 0.3098039, 1, 0, 1,
-0.571181, 1.788507, -0.1634628, 0.3019608, 1, 0, 1,
-0.5609203, 0.4060721, 0.3574571, 0.2941177, 1, 0, 1,
-0.5535322, 0.6954286, -2.223951, 0.2901961, 1, 0, 1,
-0.5525351, -0.5253237, -1.606504, 0.282353, 1, 0, 1,
-0.5523804, -0.453066, -2.477646, 0.2784314, 1, 0, 1,
-0.5518609, 1.126613, 0.4910604, 0.2705882, 1, 0, 1,
-0.5517069, 1.424541, 0.9037073, 0.2666667, 1, 0, 1,
-0.5504075, -2.080678, -2.810939, 0.2588235, 1, 0, 1,
-0.544539, -1.14738, -1.496366, 0.254902, 1, 0, 1,
-0.5444365, 1.049361, -3.723725, 0.2470588, 1, 0, 1,
-0.5430858, -1.927403, -2.500567, 0.2431373, 1, 0, 1,
-0.5424378, -0.2199055, -1.57934, 0.2352941, 1, 0, 1,
-0.5411984, 1.672807, 0.3343392, 0.2313726, 1, 0, 1,
-0.5371296, -0.17076, -1.311184, 0.2235294, 1, 0, 1,
-0.5361194, 0.1614391, -1.417205, 0.2196078, 1, 0, 1,
-0.5350314, 0.7033707, 0.8908312, 0.2117647, 1, 0, 1,
-0.5308638, -1.378244, -4.068821, 0.2078431, 1, 0, 1,
-0.5265277, -0.3777359, -2.183302, 0.2, 1, 0, 1,
-0.5264842, 0.3045609, -1.590316, 0.1921569, 1, 0, 1,
-0.5213363, 0.7053757, -0.2094853, 0.1882353, 1, 0, 1,
-0.5182161, -1.098548, -2.485505, 0.1803922, 1, 0, 1,
-0.5129887, -0.4052731, -2.380989, 0.1764706, 1, 0, 1,
-0.5108482, 1.043684, -0.9175195, 0.1686275, 1, 0, 1,
-0.5061131, 0.2853591, -1.353488, 0.1647059, 1, 0, 1,
-0.5060384, -1.477041, -1.774627, 0.1568628, 1, 0, 1,
-0.5052145, 1.304969, 1.031949, 0.1529412, 1, 0, 1,
-0.4943107, 0.3085583, -1.481914, 0.145098, 1, 0, 1,
-0.4855528, 0.329746, -0.03768988, 0.1411765, 1, 0, 1,
-0.4837508, -1.10475, -2.422054, 0.1333333, 1, 0, 1,
-0.4811226, 0.2853039, -0.6331592, 0.1294118, 1, 0, 1,
-0.4811041, 0.9762833, 0.01390038, 0.1215686, 1, 0, 1,
-0.4742699, 0.86887, -0.5916184, 0.1176471, 1, 0, 1,
-0.4675012, 0.6669514, 0.2614066, 0.1098039, 1, 0, 1,
-0.4672756, -0.5569704, -3.864502, 0.1058824, 1, 0, 1,
-0.4634462, 1.857076, -1.189501, 0.09803922, 1, 0, 1,
-0.4625935, 0.5074477, -0.5896133, 0.09019608, 1, 0, 1,
-0.4610473, -0.9028955, -2.648585, 0.08627451, 1, 0, 1,
-0.4582109, -1.929211, -2.769316, 0.07843138, 1, 0, 1,
-0.4580256, 0.9338155, -0.3966004, 0.07450981, 1, 0, 1,
-0.449092, -0.3012089, 0.7146028, 0.06666667, 1, 0, 1,
-0.4437208, 0.4121136, -1.046144, 0.0627451, 1, 0, 1,
-0.4424237, 0.3403122, -0.9102306, 0.05490196, 1, 0, 1,
-0.433476, 1.269745, -1.389184, 0.05098039, 1, 0, 1,
-0.4328037, -0.06588855, -0.3515131, 0.04313726, 1, 0, 1,
-0.4226957, -0.9020494, -4.429457, 0.03921569, 1, 0, 1,
-0.4216011, -0.3429236, -2.552147, 0.03137255, 1, 0, 1,
-0.4207586, 0.4327798, -0.5964437, 0.02745098, 1, 0, 1,
-0.4194825, -0.4873423, -2.530037, 0.01960784, 1, 0, 1,
-0.4182234, -1.803822, -3.284331, 0.01568628, 1, 0, 1,
-0.4171727, 0.1684025, -2.150014, 0.007843138, 1, 0, 1,
-0.4162307, -0.3089828, -2.778821, 0.003921569, 1, 0, 1,
-0.4141859, 0.7392088, -1.696737, 0, 1, 0.003921569, 1,
-0.4135139, 0.3023329, -0.8231218, 0, 1, 0.01176471, 1,
-0.4122147, 0.3251961, -1.102969, 0, 1, 0.01568628, 1,
-0.4116331, 0.9248112, -2.017603, 0, 1, 0.02352941, 1,
-0.4060007, -1.29211, -2.938239, 0, 1, 0.02745098, 1,
-0.4044253, -0.3500302, -2.091257, 0, 1, 0.03529412, 1,
-0.3971501, 2.001751, -0.5379856, 0, 1, 0.03921569, 1,
-0.3939463, -0.7683818, -1.44216, 0, 1, 0.04705882, 1,
-0.3929783, -0.6142892, -3.710065, 0, 1, 0.05098039, 1,
-0.3925092, -0.3047262, -3.231072, 0, 1, 0.05882353, 1,
-0.3924694, 1.356583, -3.311557, 0, 1, 0.0627451, 1,
-0.39221, -0.1234628, -2.390781, 0, 1, 0.07058824, 1,
-0.3921208, -0.3213659, -1.28169, 0, 1, 0.07450981, 1,
-0.3908688, 0.4667875, -1.508033, 0, 1, 0.08235294, 1,
-0.3887692, -0.02761368, -1.719068, 0, 1, 0.08627451, 1,
-0.3852314, -0.2757395, -2.680811, 0, 1, 0.09411765, 1,
-0.3838199, -0.9108429, -3.933659, 0, 1, 0.1019608, 1,
-0.3813993, -1.674381, -3.181332, 0, 1, 0.1058824, 1,
-0.3753912, 0.6742496, -0.3032568, 0, 1, 0.1137255, 1,
-0.3724373, 1.699777, 0.9436942, 0, 1, 0.1176471, 1,
-0.3703732, 0.5490087, -2.286262, 0, 1, 0.1254902, 1,
-0.3582849, -0.9248663, -5.144506, 0, 1, 0.1294118, 1,
-0.3464576, -0.5165946, -1.509203, 0, 1, 0.1372549, 1,
-0.3447263, -1.140075, -2.144825, 0, 1, 0.1411765, 1,
-0.3443413, 0.6489549, 0.08178958, 0, 1, 0.1490196, 1,
-0.3434952, -1.59171, -3.995429, 0, 1, 0.1529412, 1,
-0.3305894, 0.8031376, -0.8657839, 0, 1, 0.1607843, 1,
-0.3294343, 0.276948, -2.02, 0, 1, 0.1647059, 1,
-0.3202611, -2.315626, -1.905232, 0, 1, 0.172549, 1,
-0.3115908, 0.07584408, -2.458839, 0, 1, 0.1764706, 1,
-0.3081159, -2.181102, -1.060832, 0, 1, 0.1843137, 1,
-0.3070257, -1.017864, -3.198848, 0, 1, 0.1882353, 1,
-0.3047061, 0.2069755, -1.910403, 0, 1, 0.1960784, 1,
-0.2969665, 1.331458, -0.6499684, 0, 1, 0.2039216, 1,
-0.2949435, -0.3355403, -3.233503, 0, 1, 0.2078431, 1,
-0.2913352, 1.596093, -1.282119, 0, 1, 0.2156863, 1,
-0.2895509, -0.1349704, -2.355578, 0, 1, 0.2196078, 1,
-0.2875134, 0.3911969, 1.147068, 0, 1, 0.227451, 1,
-0.2867313, -0.2117031, -1.272308, 0, 1, 0.2313726, 1,
-0.2835639, -0.5031502, -2.112206, 0, 1, 0.2392157, 1,
-0.2797896, 0.7683067, -1.629273, 0, 1, 0.2431373, 1,
-0.2747008, 1.923693, 0.2901813, 0, 1, 0.2509804, 1,
-0.2742386, -0.2074348, -2.923528, 0, 1, 0.254902, 1,
-0.2737651, -0.1508989, -2.363199, 0, 1, 0.2627451, 1,
-0.2706306, -0.7727037, -3.72745, 0, 1, 0.2666667, 1,
-0.2696089, -0.0571871, -1.657602, 0, 1, 0.2745098, 1,
-0.2683386, 1.299016, 0.6492906, 0, 1, 0.2784314, 1,
-0.26464, 1.232245, -0.6222173, 0, 1, 0.2862745, 1,
-0.2535341, 0.6121045, -1.667306, 0, 1, 0.2901961, 1,
-0.2507243, -1.237239, -2.912069, 0, 1, 0.2980392, 1,
-0.2505341, -0.1129857, -0.03776874, 0, 1, 0.3058824, 1,
-0.2504754, 0.9881535, 0.08901973, 0, 1, 0.3098039, 1,
-0.2502904, -1.910622, -3.451224, 0, 1, 0.3176471, 1,
-0.2428921, 0.638482, 1.915569, 0, 1, 0.3215686, 1,
-0.2419985, 0.4696784, -1.192331, 0, 1, 0.3294118, 1,
-0.2382881, 0.6525279, -1.97378, 0, 1, 0.3333333, 1,
-0.235776, -0.9365198, -3.319426, 0, 1, 0.3411765, 1,
-0.2343656, -0.7815972, -2.01673, 0, 1, 0.345098, 1,
-0.2342211, 0.797182, -0.6429537, 0, 1, 0.3529412, 1,
-0.2335247, -1.408683, -3.678223, 0, 1, 0.3568628, 1,
-0.2324326, -0.3564495, -3.011928, 0, 1, 0.3647059, 1,
-0.2271355, -1.488095, -3.664508, 0, 1, 0.3686275, 1,
-0.2247901, -0.03594012, -3.095456, 0, 1, 0.3764706, 1,
-0.2246851, 0.6059435, -0.1786856, 0, 1, 0.3803922, 1,
-0.2239497, -1.384898, -3.014648, 0, 1, 0.3882353, 1,
-0.2235056, 1.937346, 0.1769391, 0, 1, 0.3921569, 1,
-0.2169333, 0.5131169, -1.668046, 0, 1, 0.4, 1,
-0.2146785, 0.5462529, -1.76399, 0, 1, 0.4078431, 1,
-0.2134497, 0.8212187, 0.2930757, 0, 1, 0.4117647, 1,
-0.2100532, 1.678855, -2.03114, 0, 1, 0.4196078, 1,
-0.203193, 0.7463832, 0.8616135, 0, 1, 0.4235294, 1,
-0.1991412, 0.4203903, -0.4492162, 0, 1, 0.4313726, 1,
-0.1974485, -1.428169, -3.43246, 0, 1, 0.4352941, 1,
-0.195319, -0.0756248, -3.895039, 0, 1, 0.4431373, 1,
-0.1894412, 0.00636101, -1.787716, 0, 1, 0.4470588, 1,
-0.187758, -0.5525411, -3.884827, 0, 1, 0.454902, 1,
-0.1868877, 0.7616239, 1.142373, 0, 1, 0.4588235, 1,
-0.1838092, 1.257168, -0.1472264, 0, 1, 0.4666667, 1,
-0.1835111, 1.503811, -0.3877589, 0, 1, 0.4705882, 1,
-0.1828935, -0.2824678, -2.873951, 0, 1, 0.4784314, 1,
-0.1760062, 1.583378, -0.4434234, 0, 1, 0.4823529, 1,
-0.1751672, 1.509114, -0.6360427, 0, 1, 0.4901961, 1,
-0.170719, -0.7658281, -2.638085, 0, 1, 0.4941176, 1,
-0.1706636, 0.3049969, -0.5181085, 0, 1, 0.5019608, 1,
-0.1704869, 0.4953926, 1.116547, 0, 1, 0.509804, 1,
-0.1693538, -0.6545409, -3.357826, 0, 1, 0.5137255, 1,
-0.1668109, 0.4184085, -0.5141482, 0, 1, 0.5215687, 1,
-0.164627, -0.3660581, -2.951527, 0, 1, 0.5254902, 1,
-0.1640576, -1.356364, -3.037311, 0, 1, 0.5333334, 1,
-0.1606133, 1.654781, -0.1853445, 0, 1, 0.5372549, 1,
-0.1570627, -1.43779, -3.376509, 0, 1, 0.5450981, 1,
-0.1556835, 0.06046341, -0.9583728, 0, 1, 0.5490196, 1,
-0.1555188, 0.1903465, -1.113331, 0, 1, 0.5568628, 1,
-0.153596, 0.238133, -0.7411996, 0, 1, 0.5607843, 1,
-0.1532589, -1.23443, -2.963293, 0, 1, 0.5686275, 1,
-0.1515757, 0.3361746, -1.151298, 0, 1, 0.572549, 1,
-0.1478427, -0.1533512, -2.003666, 0, 1, 0.5803922, 1,
-0.1475126, 1.221297, -1.052964, 0, 1, 0.5843138, 1,
-0.1462342, 1.355175, -0.2673248, 0, 1, 0.5921569, 1,
-0.1454823, 1.439064, -0.07261817, 0, 1, 0.5960785, 1,
-0.1424816, 0.1446016, -0.1234474, 0, 1, 0.6039216, 1,
-0.1401043, 0.436532, -0.4952071, 0, 1, 0.6117647, 1,
-0.1389481, 0.636017, -2.246522, 0, 1, 0.6156863, 1,
-0.1348021, 0.713813, -1.014616, 0, 1, 0.6235294, 1,
-0.1306062, -0.479577, -1.796287, 0, 1, 0.627451, 1,
-0.1277288, 0.1327133, 0.1470576, 0, 1, 0.6352941, 1,
-0.1273548, -0.0241084, -2.601973, 0, 1, 0.6392157, 1,
-0.127139, -0.1121522, -2.543301, 0, 1, 0.6470588, 1,
-0.1253459, 0.7787356, -1.568921, 0, 1, 0.6509804, 1,
-0.1246207, -1.041445, -4.213511, 0, 1, 0.6588235, 1,
-0.1240808, 0.05409928, -0.8309824, 0, 1, 0.6627451, 1,
-0.1173239, -1.139968, -3.639606, 0, 1, 0.6705883, 1,
-0.1170079, 1.676707, 0.7675081, 0, 1, 0.6745098, 1,
-0.116563, 0.4788965, 0.2521871, 0, 1, 0.682353, 1,
-0.1065824, 1.335266, -0.3359669, 0, 1, 0.6862745, 1,
-0.1040973, -0.4462173, -3.495196, 0, 1, 0.6941177, 1,
-0.1039601, 0.4152717, 0.1674205, 0, 1, 0.7019608, 1,
-0.1020258, -0.2271162, -2.554747, 0, 1, 0.7058824, 1,
-0.1002706, -0.2370035, -1.864794, 0, 1, 0.7137255, 1,
-0.1001666, -0.1175792, -3.437549, 0, 1, 0.7176471, 1,
-0.09554436, 0.4583702, 0.4571104, 0, 1, 0.7254902, 1,
-0.09447186, 0.0924588, -1.923068, 0, 1, 0.7294118, 1,
-0.09383706, -0.2777591, -1.829157, 0, 1, 0.7372549, 1,
-0.09372637, -1.920823, -3.192702, 0, 1, 0.7411765, 1,
-0.09135476, -0.5971308, -2.757979, 0, 1, 0.7490196, 1,
-0.0904506, -0.3500902, -1.977804, 0, 1, 0.7529412, 1,
-0.08384208, -0.529802, -4.239508, 0, 1, 0.7607843, 1,
-0.07225002, 1.038536, -0.5523044, 0, 1, 0.7647059, 1,
-0.0702856, 0.2195054, 0.2210698, 0, 1, 0.772549, 1,
-0.06953403, 0.7707508, -0.8527637, 0, 1, 0.7764706, 1,
-0.0667345, 0.1400175, 0.844014, 0, 1, 0.7843137, 1,
-0.06646672, 0.2669519, 0.6690073, 0, 1, 0.7882353, 1,
-0.06138144, 0.2801166, -1.457395, 0, 1, 0.7960784, 1,
-0.05876233, 0.178408, 1.336586, 0, 1, 0.8039216, 1,
-0.05503986, -0.6850464, -3.44363, 0, 1, 0.8078431, 1,
-0.05350122, -0.3805152, -4.279672, 0, 1, 0.8156863, 1,
-0.05237654, -0.5700281, -4.385119, 0, 1, 0.8196079, 1,
-0.05137097, 0.05045266, -0.5262439, 0, 1, 0.827451, 1,
-0.05123847, 0.1696568, -0.8320541, 0, 1, 0.8313726, 1,
-0.04519878, -2.225915, -2.855465, 0, 1, 0.8392157, 1,
-0.04453223, -0.3268064, -3.389184, 0, 1, 0.8431373, 1,
-0.04446943, 0.6653813, 0.03956354, 0, 1, 0.8509804, 1,
-0.04242595, 0.2118022, 0.4639806, 0, 1, 0.854902, 1,
-0.03506323, -1.03095, -2.42698, 0, 1, 0.8627451, 1,
-0.03355077, -0.9689484, -4.044609, 0, 1, 0.8666667, 1,
-0.03343926, 1.771147, -1.023674, 0, 1, 0.8745098, 1,
-0.03268636, 1.179497, -0.7811688, 0, 1, 0.8784314, 1,
-0.02922572, -0.05677121, -0.3924424, 0, 1, 0.8862745, 1,
-0.0277511, -0.381108, -3.249311, 0, 1, 0.8901961, 1,
-0.02666376, -0.756879, -3.958941, 0, 1, 0.8980392, 1,
-0.0254503, -1.430662, -3.735661, 0, 1, 0.9058824, 1,
-0.0205922, -0.7077547, -2.818825, 0, 1, 0.9098039, 1,
-0.01972207, -0.02502704, -2.377022, 0, 1, 0.9176471, 1,
-0.01830774, 0.9579371, 1.382413, 0, 1, 0.9215686, 1,
-0.01723381, -1.265107, -2.324112, 0, 1, 0.9294118, 1,
-0.01567381, -0.1947048, -3.794436, 0, 1, 0.9333333, 1,
-0.009144126, -1.238424, -2.862234, 0, 1, 0.9411765, 1,
-0.007035822, 0.8797672, 0.6894098, 0, 1, 0.945098, 1,
0.001315743, 1.256658, -0.3248492, 0, 1, 0.9529412, 1,
0.007460596, 0.5581549, -0.4512815, 0, 1, 0.9568627, 1,
0.007696621, 0.1316596, 1.15988, 0, 1, 0.9647059, 1,
0.01240015, -1.277754, 3.479897, 0, 1, 0.9686275, 1,
0.01374729, 0.6583571, 0.8626767, 0, 1, 0.9764706, 1,
0.01637859, 0.9134595, 0.2350461, 0, 1, 0.9803922, 1,
0.02065123, -1.956807, 3.710012, 0, 1, 0.9882353, 1,
0.02070479, -0.4859353, 3.06638, 0, 1, 0.9921569, 1,
0.02407975, -0.2067971, 2.567623, 0, 1, 1, 1,
0.02696835, -1.743867, 2.947459, 0, 0.9921569, 1, 1,
0.02706, 0.1272283, -0.04950499, 0, 0.9882353, 1, 1,
0.02869099, -0.5999123, 2.346062, 0, 0.9803922, 1, 1,
0.03128463, -1.156071, 2.431697, 0, 0.9764706, 1, 1,
0.03172337, -1.184723, 3.479605, 0, 0.9686275, 1, 1,
0.03246983, -1.175334, 2.127306, 0, 0.9647059, 1, 1,
0.0357734, 0.7338676, -1.876328, 0, 0.9568627, 1, 1,
0.03803943, 0.5409884, -0.1389958, 0, 0.9529412, 1, 1,
0.03837562, -2.362111, 3.298047, 0, 0.945098, 1, 1,
0.03849551, 0.0542658, 0.156448, 0, 0.9411765, 1, 1,
0.04044187, -0.6169012, 2.440462, 0, 0.9333333, 1, 1,
0.0417942, -0.5933113, 5.040664, 0, 0.9294118, 1, 1,
0.04259619, -0.483097, 3.928159, 0, 0.9215686, 1, 1,
0.04279081, 0.7192222, 1.425993, 0, 0.9176471, 1, 1,
0.04500433, 0.3624622, 0.3533149, 0, 0.9098039, 1, 1,
0.04709206, 0.9942812, 1.05912, 0, 0.9058824, 1, 1,
0.0509717, 0.646058, -0.04484594, 0, 0.8980392, 1, 1,
0.05266266, 0.02219379, -0.2365668, 0, 0.8901961, 1, 1,
0.05392101, 0.5993162, 0.5387933, 0, 0.8862745, 1, 1,
0.05523001, 0.07350658, 2.190632, 0, 0.8784314, 1, 1,
0.05634815, -1.35079, 2.774293, 0, 0.8745098, 1, 1,
0.06210295, 0.683825, -0.4430623, 0, 0.8666667, 1, 1,
0.06214764, -0.1598891, 1.10714, 0, 0.8627451, 1, 1,
0.06228659, -0.2327979, 1.325555, 0, 0.854902, 1, 1,
0.0630454, -0.6817281, 3.386588, 0, 0.8509804, 1, 1,
0.06321096, -1.415895, 3.10291, 0, 0.8431373, 1, 1,
0.06361829, -1.347085, 3.863594, 0, 0.8392157, 1, 1,
0.06776527, 1.375123, -1.162317, 0, 0.8313726, 1, 1,
0.07096814, 2.486264, -1.04405, 0, 0.827451, 1, 1,
0.07132354, -0.4080768, 2.628817, 0, 0.8196079, 1, 1,
0.07166837, -0.03426316, 0.4687776, 0, 0.8156863, 1, 1,
0.07567085, -0.5672625, 4.406557, 0, 0.8078431, 1, 1,
0.07929429, -0.2124519, 2.692104, 0, 0.8039216, 1, 1,
0.08016891, -0.03399217, 0.9600841, 0, 0.7960784, 1, 1,
0.08118647, 0.168631, -0.07461028, 0, 0.7882353, 1, 1,
0.08397766, 0.7316786, -1.77914, 0, 0.7843137, 1, 1,
0.08617485, -0.1253358, 2.869356, 0, 0.7764706, 1, 1,
0.09307536, -1.928403, 2.679907, 0, 0.772549, 1, 1,
0.09309109, 0.4225947, -0.7108546, 0, 0.7647059, 1, 1,
0.09473243, -0.9215683, 2.686114, 0, 0.7607843, 1, 1,
0.09566252, -0.1287849, 3.742941, 0, 0.7529412, 1, 1,
0.09824321, 1.428058, -0.6657161, 0, 0.7490196, 1, 1,
0.100631, -0.1013685, 0.9759292, 0, 0.7411765, 1, 1,
0.1026954, 0.4335619, -0.8382984, 0, 0.7372549, 1, 1,
0.1039891, 0.03612248, 0.6105841, 0, 0.7294118, 1, 1,
0.1074526, -0.5161808, 2.390971, 0, 0.7254902, 1, 1,
0.1082939, 0.2908231, 0.7192442, 0, 0.7176471, 1, 1,
0.1085864, 0.9775349, -0.539524, 0, 0.7137255, 1, 1,
0.1094416, -0.2624805, 2.222414, 0, 0.7058824, 1, 1,
0.1110143, -0.009816804, 1.50105, 0, 0.6980392, 1, 1,
0.1117794, 0.3483542, 0.09504389, 0, 0.6941177, 1, 1,
0.116622, 1.600155, 0.00309546, 0, 0.6862745, 1, 1,
0.1223752, -2.412721, 2.760993, 0, 0.682353, 1, 1,
0.122425, 0.3386953, -1.211078, 0, 0.6745098, 1, 1,
0.1239593, -1.092091, 0.9716634, 0, 0.6705883, 1, 1,
0.1282237, -0.9693477, 3.342982, 0, 0.6627451, 1, 1,
0.1289733, -0.6586448, 1.92247, 0, 0.6588235, 1, 1,
0.1354793, 0.1120079, -0.1362777, 0, 0.6509804, 1, 1,
0.1364066, 0.9530638, 0.05411154, 0, 0.6470588, 1, 1,
0.1373815, 0.2751843, 3.166517, 0, 0.6392157, 1, 1,
0.1400341, 1.345724, 2.84543, 0, 0.6352941, 1, 1,
0.1408702, 0.5809188, 0.08257181, 0, 0.627451, 1, 1,
0.1460296, -1.994443, 2.767784, 0, 0.6235294, 1, 1,
0.1488825, -0.7614987, 2.741767, 0, 0.6156863, 1, 1,
0.1507632, 0.4419545, 0.1340611, 0, 0.6117647, 1, 1,
0.1511559, -1.024326, 2.522323, 0, 0.6039216, 1, 1,
0.1591153, 1.361908, 0.2155925, 0, 0.5960785, 1, 1,
0.1621675, 2.250454, -1.005283, 0, 0.5921569, 1, 1,
0.1626008, 0.5941947, 1.048983, 0, 0.5843138, 1, 1,
0.1636972, 1.212708, -0.7959872, 0, 0.5803922, 1, 1,
0.1649313, 0.1219964, 1.201232, 0, 0.572549, 1, 1,
0.1686365, 0.5120809, 0.9983277, 0, 0.5686275, 1, 1,
0.1709085, -0.1591295, 1.967666, 0, 0.5607843, 1, 1,
0.171521, -1.059207, 4.381862, 0, 0.5568628, 1, 1,
0.173835, 0.2379682, 1.543937, 0, 0.5490196, 1, 1,
0.1741581, 1.798495, 0.8984333, 0, 0.5450981, 1, 1,
0.17815, -1.250826, 4.302327, 0, 0.5372549, 1, 1,
0.1796571, -0.4187068, 3.150172, 0, 0.5333334, 1, 1,
0.1838482, 2.412081, -0.570246, 0, 0.5254902, 1, 1,
0.1841684, -0.6716534, 2.992622, 0, 0.5215687, 1, 1,
0.1937718, -1.055966, 4.52527, 0, 0.5137255, 1, 1,
0.1954454, 0.4398259, 0.3413836, 0, 0.509804, 1, 1,
0.1972556, 0.3150525, -0.8120626, 0, 0.5019608, 1, 1,
0.1974998, 1.831815, 1.568694, 0, 0.4941176, 1, 1,
0.1976281, 2.110512, 1.441848, 0, 0.4901961, 1, 1,
0.202858, -0.6737185, 2.44337, 0, 0.4823529, 1, 1,
0.2093654, -0.1964331, 3.268332, 0, 0.4784314, 1, 1,
0.2195868, -0.614851, 1.455461, 0, 0.4705882, 1, 1,
0.2216292, -0.55296, 2.986102, 0, 0.4666667, 1, 1,
0.2252609, -0.5541121, 0.867, 0, 0.4588235, 1, 1,
0.2254716, -0.5923855, 3.517044, 0, 0.454902, 1, 1,
0.2267949, -1.085642, 1.929528, 0, 0.4470588, 1, 1,
0.2292105, 1.947605, 2.067299, 0, 0.4431373, 1, 1,
0.2315255, 0.3743941, 0.1548378, 0, 0.4352941, 1, 1,
0.2320886, -0.2514793, 2.115156, 0, 0.4313726, 1, 1,
0.2352469, 0.3132362, 0.1022257, 0, 0.4235294, 1, 1,
0.2382448, 0.2911253, 2.509842, 0, 0.4196078, 1, 1,
0.2396452, 0.9822279, -0.6356258, 0, 0.4117647, 1, 1,
0.240302, -2.04644, 2.64147, 0, 0.4078431, 1, 1,
0.2416439, -0.2906028, 2.027751, 0, 0.4, 1, 1,
0.2459905, -0.414658, 2.111504, 0, 0.3921569, 1, 1,
0.2473139, 0.8556074, 0.2320099, 0, 0.3882353, 1, 1,
0.2477485, 0.5353611, -0.4015306, 0, 0.3803922, 1, 1,
0.2478783, -0.4688483, 4.118246, 0, 0.3764706, 1, 1,
0.2492142, 0.5939585, 1.13124, 0, 0.3686275, 1, 1,
0.2507111, -0.1381746, 1.581572, 0, 0.3647059, 1, 1,
0.2519284, 0.5871896, 1.114592, 0, 0.3568628, 1, 1,
0.2533373, 0.4797613, -0.4863315, 0, 0.3529412, 1, 1,
0.2567548, 0.2931949, 1.08455, 0, 0.345098, 1, 1,
0.2603281, 1.317586, -0.7816192, 0, 0.3411765, 1, 1,
0.2619157, 2.06201, -0.348867, 0, 0.3333333, 1, 1,
0.264545, -1.402221, 1.424126, 0, 0.3294118, 1, 1,
0.2662376, -0.4275655, 2.232201, 0, 0.3215686, 1, 1,
0.2680466, 2.188633, -0.4661988, 0, 0.3176471, 1, 1,
0.2696588, -2.027355, 3.830559, 0, 0.3098039, 1, 1,
0.2729977, 0.6865353, 0.7510626, 0, 0.3058824, 1, 1,
0.2758046, -2.241197, 5.26143, 0, 0.2980392, 1, 1,
0.2812651, 0.4082432, 1.283211, 0, 0.2901961, 1, 1,
0.2834177, 0.1120816, 2.61834, 0, 0.2862745, 1, 1,
0.2876011, -0.3739064, 3.064141, 0, 0.2784314, 1, 1,
0.2914026, -1.484253, 4.917525, 0, 0.2745098, 1, 1,
0.2917916, 0.3211581, 1.923232, 0, 0.2666667, 1, 1,
0.3014391, -0.2639272, 3.240182, 0, 0.2627451, 1, 1,
0.3029851, -0.2443825, 2.29289, 0, 0.254902, 1, 1,
0.3130275, -0.5122235, 2.585098, 0, 0.2509804, 1, 1,
0.3135551, -0.6501654, 3.422275, 0, 0.2431373, 1, 1,
0.3154719, -0.5062624, 2.724169, 0, 0.2392157, 1, 1,
0.3192084, -0.4255586, 3.00522, 0, 0.2313726, 1, 1,
0.3232907, -0.5912307, 1.993223, 0, 0.227451, 1, 1,
0.3260749, -0.5107512, 2.906186, 0, 0.2196078, 1, 1,
0.3278088, 0.100646, -0.5430151, 0, 0.2156863, 1, 1,
0.327861, -0.02310429, 2.673371, 0, 0.2078431, 1, 1,
0.3292518, -1.08466, 3.546784, 0, 0.2039216, 1, 1,
0.3306247, 0.2238521, 3.219708, 0, 0.1960784, 1, 1,
0.3307194, 0.750631, 1.449579, 0, 0.1882353, 1, 1,
0.3348927, -0.09920953, 2.357966, 0, 0.1843137, 1, 1,
0.3360478, 0.6054676, 0.6716483, 0, 0.1764706, 1, 1,
0.3420677, 0.8922644, 0.3052775, 0, 0.172549, 1, 1,
0.3499173, 0.2343048, 1.382362, 0, 0.1647059, 1, 1,
0.3528727, 0.6345174, 0.7565484, 0, 0.1607843, 1, 1,
0.3553589, 1.555303, 0.2027171, 0, 0.1529412, 1, 1,
0.3555577, 1.061855, 0.8411955, 0, 0.1490196, 1, 1,
0.3589549, -0.5369825, 1.437684, 0, 0.1411765, 1, 1,
0.3590858, 0.1968009, 0.4780654, 0, 0.1372549, 1, 1,
0.3597656, 0.6222453, -1.583191, 0, 0.1294118, 1, 1,
0.3602138, -1.837773, 2.397566, 0, 0.1254902, 1, 1,
0.3630844, -0.1573944, 1.54815, 0, 0.1176471, 1, 1,
0.3640932, 0.6209074, 0.04098875, 0, 0.1137255, 1, 1,
0.3650858, 1.098163, -0.05241955, 0, 0.1058824, 1, 1,
0.3667049, 0.5593655, 0.8725353, 0, 0.09803922, 1, 1,
0.3698961, -0.5682989, 2.06143, 0, 0.09411765, 1, 1,
0.3717822, 1.724781, -1.752593, 0, 0.08627451, 1, 1,
0.3718675, -0.156746, 1.724306, 0, 0.08235294, 1, 1,
0.3751835, 2.024146, 1.231741, 0, 0.07450981, 1, 1,
0.3759869, -1.156358, 2.600044, 0, 0.07058824, 1, 1,
0.3778856, 0.3244723, 2.062099, 0, 0.0627451, 1, 1,
0.3782838, 1.11554, -0.215517, 0, 0.05882353, 1, 1,
0.3790082, -0.07625302, 1.873951, 0, 0.05098039, 1, 1,
0.383117, -0.7474086, 2.237426, 0, 0.04705882, 1, 1,
0.3912989, 1.043627, -0.1013653, 0, 0.03921569, 1, 1,
0.3946712, -0.9712787, 2.514553, 0, 0.03529412, 1, 1,
0.3950452, -1.03268, 4.202474, 0, 0.02745098, 1, 1,
0.3960191, 1.243535, 1.834806, 0, 0.02352941, 1, 1,
0.3983589, -0.2789715, 3.08748, 0, 0.01568628, 1, 1,
0.4000703, -0.7247235, 1.782467, 0, 0.01176471, 1, 1,
0.4008118, -1.350278, 1.89496, 0, 0.003921569, 1, 1,
0.4039319, -0.2226981, 3.345887, 0.003921569, 0, 1, 1,
0.4055741, -2.052858, 2.299857, 0.007843138, 0, 1, 1,
0.4064636, 1.371267, -0.2634034, 0.01568628, 0, 1, 1,
0.4152053, -1.04179, 2.961482, 0.01960784, 0, 1, 1,
0.4164967, -0.6203829, 1.70911, 0.02745098, 0, 1, 1,
0.4172265, -1.35133, 3.154214, 0.03137255, 0, 1, 1,
0.42022, 1.993333, 0.815521, 0.03921569, 0, 1, 1,
0.4247369, -0.2783752, 2.652797, 0.04313726, 0, 1, 1,
0.4269827, -0.05058972, 0.617512, 0.05098039, 0, 1, 1,
0.4428798, -0.7335915, 3.375669, 0.05490196, 0, 1, 1,
0.4449894, -0.9405506, 3.76763, 0.0627451, 0, 1, 1,
0.453051, 0.2105085, 0.3074177, 0.06666667, 0, 1, 1,
0.4547704, -0.260249, 1.313472, 0.07450981, 0, 1, 1,
0.4645361, 0.9837074, 0.7834538, 0.07843138, 0, 1, 1,
0.4648512, -1.883647, 3.561296, 0.08627451, 0, 1, 1,
0.4667751, 0.472496, 1.499481, 0.09019608, 0, 1, 1,
0.4753623, -0.2539986, 2.020041, 0.09803922, 0, 1, 1,
0.4840335, -1.115619, 3.364153, 0.1058824, 0, 1, 1,
0.4882258, -1.398138, 3.093198, 0.1098039, 0, 1, 1,
0.5075561, -0.3241993, 2.726578, 0.1176471, 0, 1, 1,
0.5080951, -0.4924276, 1.516834, 0.1215686, 0, 1, 1,
0.5097993, 1.941633, 2.531023, 0.1294118, 0, 1, 1,
0.5228137, 0.127454, 2.283136, 0.1333333, 0, 1, 1,
0.53652, -0.2248382, 2.07863, 0.1411765, 0, 1, 1,
0.5390046, 1.573689, 0.9855895, 0.145098, 0, 1, 1,
0.5407294, 2.322823, -1.374985, 0.1529412, 0, 1, 1,
0.5418169, -0.7556913, 0.5179374, 0.1568628, 0, 1, 1,
0.5434643, -0.1132903, 2.752675, 0.1647059, 0, 1, 1,
0.5459352, 2.880092, -0.8010687, 0.1686275, 0, 1, 1,
0.5481867, 1.168642, 0.5879903, 0.1764706, 0, 1, 1,
0.551037, 0.5624903, 0.8495889, 0.1803922, 0, 1, 1,
0.5510595, 0.03222127, 0.5887742, 0.1882353, 0, 1, 1,
0.5523503, 1.140743, 1.277751, 0.1921569, 0, 1, 1,
0.552815, 0.464616, 1.18859, 0.2, 0, 1, 1,
0.5545855, 0.6910029, -0.801387, 0.2078431, 0, 1, 1,
0.5604445, 1.807794, 0.8994094, 0.2117647, 0, 1, 1,
0.5660486, -0.714012, 2.371202, 0.2196078, 0, 1, 1,
0.5680282, -0.02363393, 0.937331, 0.2235294, 0, 1, 1,
0.5693878, 0.1175364, 0.9345013, 0.2313726, 0, 1, 1,
0.575198, 1.858603, -0.3579648, 0.2352941, 0, 1, 1,
0.5778681, -0.731668, 1.609939, 0.2431373, 0, 1, 1,
0.5811182, -0.09480099, 0.5706989, 0.2470588, 0, 1, 1,
0.5814573, 0.7968187, 0.4344639, 0.254902, 0, 1, 1,
0.5859461, -0.4870879, 2.778732, 0.2588235, 0, 1, 1,
0.587961, 0.07585912, -0.2156348, 0.2666667, 0, 1, 1,
0.5891166, 0.1418391, 0.3482223, 0.2705882, 0, 1, 1,
0.5975239, -0.2659339, 0.6313508, 0.2784314, 0, 1, 1,
0.5980448, 0.7157016, 1.215268, 0.282353, 0, 1, 1,
0.6033649, 0.3477329, 0.6460044, 0.2901961, 0, 1, 1,
0.6099753, 0.485603, 2.478818, 0.2941177, 0, 1, 1,
0.6110324, -1.910869, 1.666537, 0.3019608, 0, 1, 1,
0.6148395, -0.3462069, 1.307039, 0.3098039, 0, 1, 1,
0.6156924, 0.3872269, 0.03713683, 0.3137255, 0, 1, 1,
0.6175689, -1.178673, 4.025964, 0.3215686, 0, 1, 1,
0.6204517, -0.6921957, 2.775054, 0.3254902, 0, 1, 1,
0.6211891, -0.4898324, 1.88828, 0.3333333, 0, 1, 1,
0.6222784, -1.816066, 1.32682, 0.3372549, 0, 1, 1,
0.6225873, 1.120958, 2.73122, 0.345098, 0, 1, 1,
0.6232664, 0.4069134, 0.5759627, 0.3490196, 0, 1, 1,
0.6259537, -0.931879, 1.579863, 0.3568628, 0, 1, 1,
0.6361144, 0.06509168, 1.873414, 0.3607843, 0, 1, 1,
0.6386598, 1.549013, -1.381432, 0.3686275, 0, 1, 1,
0.6401539, -1.560593, 2.069765, 0.372549, 0, 1, 1,
0.6413047, 0.9371538, 0.8244703, 0.3803922, 0, 1, 1,
0.6435896, 0.8670447, 0.2834176, 0.3843137, 0, 1, 1,
0.649755, 0.1152564, -0.3964958, 0.3921569, 0, 1, 1,
0.6502289, 0.1789629, 0.2668777, 0.3960784, 0, 1, 1,
0.6512856, -2.058486, 4.262472, 0.4039216, 0, 1, 1,
0.6593561, 0.001372779, 2.352834, 0.4117647, 0, 1, 1,
0.6606258, 1.376594, 1.178272, 0.4156863, 0, 1, 1,
0.6615778, -0.9524466, 1.750099, 0.4235294, 0, 1, 1,
0.6644847, -0.8292802, 2.819055, 0.427451, 0, 1, 1,
0.6684678, -0.407863, 2.628237, 0.4352941, 0, 1, 1,
0.6691715, -0.04235023, 1.971039, 0.4392157, 0, 1, 1,
0.6703698, 0.3167789, -0.4327426, 0.4470588, 0, 1, 1,
0.6709967, -0.5710411, 2.068338, 0.4509804, 0, 1, 1,
0.6723891, 0.1058847, 2.70808, 0.4588235, 0, 1, 1,
0.6776451, 0.02331454, 0.521089, 0.4627451, 0, 1, 1,
0.686949, 1.013158, -0.4880266, 0.4705882, 0, 1, 1,
0.6934435, -0.9354814, 2.470777, 0.4745098, 0, 1, 1,
0.6964743, 0.852142, 2.165718, 0.4823529, 0, 1, 1,
0.6969613, 1.690086, -0.1769039, 0.4862745, 0, 1, 1,
0.7007989, 0.5731452, 0.9300683, 0.4941176, 0, 1, 1,
0.7032021, -0.5818853, 2.411, 0.5019608, 0, 1, 1,
0.705906, -0.4380366, 0.3024868, 0.5058824, 0, 1, 1,
0.7078791, -0.8849907, 3.257693, 0.5137255, 0, 1, 1,
0.7102913, 0.3454701, 0.2851936, 0.5176471, 0, 1, 1,
0.7147514, 1.160971, -0.3558906, 0.5254902, 0, 1, 1,
0.716763, 0.3376029, -0.08546345, 0.5294118, 0, 1, 1,
0.7193292, -1.116242, 3.379599, 0.5372549, 0, 1, 1,
0.7216615, -0.7125463, 1.931329, 0.5411765, 0, 1, 1,
0.7220691, -0.06656212, 0.6859971, 0.5490196, 0, 1, 1,
0.7239516, -0.6218623, 0.1461073, 0.5529412, 0, 1, 1,
0.7248266, 0.005059015, 0.3047846, 0.5607843, 0, 1, 1,
0.7308066, 0.2280394, 0.3996845, 0.5647059, 0, 1, 1,
0.7368941, -0.7865487, 4.172727, 0.572549, 0, 1, 1,
0.7390934, -1.054737, 2.034923, 0.5764706, 0, 1, 1,
0.7516533, 0.8177443, 0.003605481, 0.5843138, 0, 1, 1,
0.7518587, -0.6485795, 3.42211, 0.5882353, 0, 1, 1,
0.7524004, 0.07337372, 1.01212, 0.5960785, 0, 1, 1,
0.7552758, -0.380778, 0.5439913, 0.6039216, 0, 1, 1,
0.7561651, -0.2483647, 3.468328, 0.6078432, 0, 1, 1,
0.7568069, 0.805183, 0.09538775, 0.6156863, 0, 1, 1,
0.7734203, -0.6170147, 3.475919, 0.6196079, 0, 1, 1,
0.7780731, -0.173321, 3.919052, 0.627451, 0, 1, 1,
0.783385, 2.226342, 1.905124, 0.6313726, 0, 1, 1,
0.7896454, -0.7334491, 1.45043, 0.6392157, 0, 1, 1,
0.792759, 0.05062284, 1.9812, 0.6431373, 0, 1, 1,
0.8029681, 0.2529193, 0.4889487, 0.6509804, 0, 1, 1,
0.8053759, -0.08358921, 3.285568, 0.654902, 0, 1, 1,
0.8096988, -0.9703075, 3.057069, 0.6627451, 0, 1, 1,
0.8173886, 0.7571656, 0.9878593, 0.6666667, 0, 1, 1,
0.8224304, -1.131334, 3.666614, 0.6745098, 0, 1, 1,
0.8250423, -0.2302631, 2.904194, 0.6784314, 0, 1, 1,
0.8284987, 1.015564, 0.8049321, 0.6862745, 0, 1, 1,
0.83075, 1.592403, 0.4014494, 0.6901961, 0, 1, 1,
0.8324382, -1.138373, 0.921555, 0.6980392, 0, 1, 1,
0.8325178, 0.6353241, 3.102043, 0.7058824, 0, 1, 1,
0.8334718, 0.2110284, 1.358217, 0.7098039, 0, 1, 1,
0.838927, 1.180792, 0.2561355, 0.7176471, 0, 1, 1,
0.8397279, -0.7695017, 2.935125, 0.7215686, 0, 1, 1,
0.84074, -0.9666118, 3.366557, 0.7294118, 0, 1, 1,
0.845754, 0.09630541, 0.6794884, 0.7333333, 0, 1, 1,
0.8480227, -0.9381437, 3.092235, 0.7411765, 0, 1, 1,
0.8510714, 0.2710937, 0.9729119, 0.7450981, 0, 1, 1,
0.8621115, -0.6120088, 2.414444, 0.7529412, 0, 1, 1,
0.8662527, 0.7545401, 1.516475, 0.7568628, 0, 1, 1,
0.8718924, 0.7289344, 1.68759, 0.7647059, 0, 1, 1,
0.8718942, 0.6183088, 0.9819326, 0.7686275, 0, 1, 1,
0.874893, 0.8863207, 0.295239, 0.7764706, 0, 1, 1,
0.8771375, 2.116768, 0.8911225, 0.7803922, 0, 1, 1,
0.8815485, 0.07520436, 0.8138186, 0.7882353, 0, 1, 1,
0.8821627, -0.3879503, 1.416435, 0.7921569, 0, 1, 1,
0.8824258, 0.1256535, 1.712068, 0.8, 0, 1, 1,
0.8835147, 0.3436284, -0.2088722, 0.8078431, 0, 1, 1,
0.8903855, -1.027921, 2.993654, 0.8117647, 0, 1, 1,
0.8925411, 1.111535, 1.501272, 0.8196079, 0, 1, 1,
0.8975504, 0.288176, 0.5615524, 0.8235294, 0, 1, 1,
0.9003227, -1.945688, 2.39063, 0.8313726, 0, 1, 1,
0.9021105, -0.8494214, 3.033383, 0.8352941, 0, 1, 1,
0.9026647, 0.8075226, -1.631701, 0.8431373, 0, 1, 1,
0.9116516, 0.6068825, -1.122196, 0.8470588, 0, 1, 1,
0.9144092, -0.6066926, 2.223912, 0.854902, 0, 1, 1,
0.9169853, 0.5695165, 0.3611549, 0.8588235, 0, 1, 1,
0.9208744, 1.199018, 1.069233, 0.8666667, 0, 1, 1,
0.9223507, -0.4688891, 2.138535, 0.8705882, 0, 1, 1,
0.9228557, 1.182405, 0.4373679, 0.8784314, 0, 1, 1,
0.9263995, -0.4637777, 1.201084, 0.8823529, 0, 1, 1,
0.9340228, -1.204139, 1.639211, 0.8901961, 0, 1, 1,
0.9351264, -0.6683532, 1.079565, 0.8941177, 0, 1, 1,
0.9383219, -0.01770302, 1.917167, 0.9019608, 0, 1, 1,
0.9384399, -1.280271, 2.87391, 0.9098039, 0, 1, 1,
0.9409053, -0.4181938, 1.319652, 0.9137255, 0, 1, 1,
0.9429416, -0.1228297, 1.874792, 0.9215686, 0, 1, 1,
0.9437536, 1.122671, 0.7219096, 0.9254902, 0, 1, 1,
0.9491837, -0.8761482, 0.7575523, 0.9333333, 0, 1, 1,
0.9568028, 2.117517, -0.5120589, 0.9372549, 0, 1, 1,
0.960296, 0.6332352, 1.810769, 0.945098, 0, 1, 1,
0.9626198, 1.390062, 1.253112, 0.9490196, 0, 1, 1,
0.9638487, -0.6750132, 1.132108, 0.9568627, 0, 1, 1,
0.9714097, 0.7360407, 0.7449433, 0.9607843, 0, 1, 1,
0.9735029, -0.2339969, 3.005061, 0.9686275, 0, 1, 1,
0.9755096, 0.4862323, 1.928844, 0.972549, 0, 1, 1,
0.987495, -1.221659, 2.97175, 0.9803922, 0, 1, 1,
0.9938149, 1.506617, 0.4138129, 0.9843137, 0, 1, 1,
0.9956511, -0.3686696, 1.715687, 0.9921569, 0, 1, 1,
1.002518, 2.06364, 0.06178991, 0.9960784, 0, 1, 1,
1.010429, 0.100167, 1.540663, 1, 0, 0.9960784, 1,
1.013985, 0.3854762, 1.949963, 1, 0, 0.9882353, 1,
1.020465, -0.4224163, 1.385519, 1, 0, 0.9843137, 1,
1.021358, -0.9755016, 2.057064, 1, 0, 0.9764706, 1,
1.021956, -1.754633, 2.630127, 1, 0, 0.972549, 1,
1.032921, 0.276894, 0.7037654, 1, 0, 0.9647059, 1,
1.034654, 1.431797, 1.177291, 1, 0, 0.9607843, 1,
1.039874, 1.691837, 2.053364, 1, 0, 0.9529412, 1,
1.042522, 0.07541299, 1.490787, 1, 0, 0.9490196, 1,
1.054056, -0.9108949, 0.1387048, 1, 0, 0.9411765, 1,
1.056029, -0.8222538, 2.471171, 1, 0, 0.9372549, 1,
1.05735, -0.4891091, 1.399139, 1, 0, 0.9294118, 1,
1.057554, 1.344208, 1.029964, 1, 0, 0.9254902, 1,
1.060599, -1.839363, 3.057263, 1, 0, 0.9176471, 1,
1.065735, -1.50273, 1.368837, 1, 0, 0.9137255, 1,
1.072843, -0.55525, 3.821573, 1, 0, 0.9058824, 1,
1.079339, 0.390971, 0.8041532, 1, 0, 0.9019608, 1,
1.083776, 0.4294004, 1.808316, 1, 0, 0.8941177, 1,
1.097969, -0.9560841, 1.051208, 1, 0, 0.8862745, 1,
1.102103, -1.023523, 1.499695, 1, 0, 0.8823529, 1,
1.110597, 0.2388823, 0.862885, 1, 0, 0.8745098, 1,
1.11297, 0.4735283, 3.426925, 1, 0, 0.8705882, 1,
1.114, -0.483675, 0.7344913, 1, 0, 0.8627451, 1,
1.116284, 1.626001, 0.1075104, 1, 0, 0.8588235, 1,
1.121434, -0.3283403, 1.810868, 1, 0, 0.8509804, 1,
1.121572, 0.4646744, 2.028953, 1, 0, 0.8470588, 1,
1.129318, -0.9417986, 2.51818, 1, 0, 0.8392157, 1,
1.129983, 1.859079, 0.5021375, 1, 0, 0.8352941, 1,
1.137362, -0.9174992, 1.094428, 1, 0, 0.827451, 1,
1.144001, -0.2931483, 1.807187, 1, 0, 0.8235294, 1,
1.145481, 0.26954, -0.2529208, 1, 0, 0.8156863, 1,
1.149955, -2.171502, 1.187385, 1, 0, 0.8117647, 1,
1.152906, 0.1288643, 0.9325789, 1, 0, 0.8039216, 1,
1.153841, 0.3152803, -0.2781501, 1, 0, 0.7960784, 1,
1.165417, 2.060194, 0.567423, 1, 0, 0.7921569, 1,
1.175994, 0.5597435, 0.1988555, 1, 0, 0.7843137, 1,
1.183446, 1.00498, 0.008600418, 1, 0, 0.7803922, 1,
1.185127, -0.5454525, 1.304291, 1, 0, 0.772549, 1,
1.186401, -0.8335901, 4.222546, 1, 0, 0.7686275, 1,
1.187112, 0.6001949, -0.1796833, 1, 0, 0.7607843, 1,
1.18941, -1.517914, 3.365765, 1, 0, 0.7568628, 1,
1.190087, -1.413187, 5.457412, 1, 0, 0.7490196, 1,
1.191958, 0.1421872, 0.8237211, 1, 0, 0.7450981, 1,
1.194271, -0.6262103, 2.889435, 1, 0, 0.7372549, 1,
1.203385, -0.3003735, 1.108103, 1, 0, 0.7333333, 1,
1.210803, -0.1766115, 0.8862655, 1, 0, 0.7254902, 1,
1.219045, -0.19913, 3.028773, 1, 0, 0.7215686, 1,
1.219335, 1.52784, 1.156683, 1, 0, 0.7137255, 1,
1.219752, -0.8558354, 3.211868, 1, 0, 0.7098039, 1,
1.223042, 0.2308096, -0.1798737, 1, 0, 0.7019608, 1,
1.227059, 0.9530619, -0.02252222, 1, 0, 0.6941177, 1,
1.229264, -0.6845911, 3.091329, 1, 0, 0.6901961, 1,
1.236902, 0.91142, 0.6019635, 1, 0, 0.682353, 1,
1.242721, -0.2110222, 2.860346, 1, 0, 0.6784314, 1,
1.243901, 0.4540948, 1.766199, 1, 0, 0.6705883, 1,
1.252862, 1.141927, -0.9640022, 1, 0, 0.6666667, 1,
1.258943, 0.3972818, 0.4727804, 1, 0, 0.6588235, 1,
1.267395, -0.009576945, -0.5599778, 1, 0, 0.654902, 1,
1.271597, -0.05060583, 0.5032715, 1, 0, 0.6470588, 1,
1.287245, 0.6843912, 0.8749422, 1, 0, 0.6431373, 1,
1.287972, -0.05116075, 0.8724976, 1, 0, 0.6352941, 1,
1.288581, 0.3648409, 1.838355, 1, 0, 0.6313726, 1,
1.291527, -1.217532, -0.5000002, 1, 0, 0.6235294, 1,
1.295763, -0.9083421, 2.741305, 1, 0, 0.6196079, 1,
1.297527, 0.6106345, 0.588337, 1, 0, 0.6117647, 1,
1.298022, -0.1183745, 1.609419, 1, 0, 0.6078432, 1,
1.299171, 0.09145509, 1.559712, 1, 0, 0.6, 1,
1.300614, -0.87043, 1.372924, 1, 0, 0.5921569, 1,
1.303377, 0.3211548, 0.9586878, 1, 0, 0.5882353, 1,
1.308174, -1.423168, 2.220183, 1, 0, 0.5803922, 1,
1.315352, 0.5401239, -0.5544958, 1, 0, 0.5764706, 1,
1.320818, -0.0839007, 0.01822444, 1, 0, 0.5686275, 1,
1.335926, 0.283518, 1.910591, 1, 0, 0.5647059, 1,
1.342619, 0.6317464, 0.6870554, 1, 0, 0.5568628, 1,
1.344864, -0.2571022, 1.657228, 1, 0, 0.5529412, 1,
1.354789, 0.07586967, 1.353391, 1, 0, 0.5450981, 1,
1.360731, 0.7414115, 1.835907, 1, 0, 0.5411765, 1,
1.366483, -0.1183715, 3.530959, 1, 0, 0.5333334, 1,
1.382272, 0.01747837, 1.858892, 1, 0, 0.5294118, 1,
1.391791, 0.6691905, 0.8024931, 1, 0, 0.5215687, 1,
1.394674, 1.150121, 2.815042, 1, 0, 0.5176471, 1,
1.405888, -0.09791589, 0.9082773, 1, 0, 0.509804, 1,
1.406772, -1.251417, 3.253777, 1, 0, 0.5058824, 1,
1.429999, -0.02397003, 1.706798, 1, 0, 0.4980392, 1,
1.431946, -1.688523, 2.288097, 1, 0, 0.4901961, 1,
1.473866, 0.4058993, 2.007875, 1, 0, 0.4862745, 1,
1.475402, -0.4450424, 2.247224, 1, 0, 0.4784314, 1,
1.476192, -1.194072, 2.111835, 1, 0, 0.4745098, 1,
1.477704, -1.512719, 3.65739, 1, 0, 0.4666667, 1,
1.490019, 0.1844797, 1.327765, 1, 0, 0.4627451, 1,
1.492585, 1.50243, 1.062532, 1, 0, 0.454902, 1,
1.503955, 0.9689959, 1.699327, 1, 0, 0.4509804, 1,
1.511164, 0.7680012, 1.218252, 1, 0, 0.4431373, 1,
1.523787, -0.9235173, 3.202617, 1, 0, 0.4392157, 1,
1.534603, -1.30022, 2.011037, 1, 0, 0.4313726, 1,
1.544914, -0.617382, 2.42384, 1, 0, 0.427451, 1,
1.572049, -2.316216, 2.817394, 1, 0, 0.4196078, 1,
1.581204, -1.218408, 1.301761, 1, 0, 0.4156863, 1,
1.589958, -1.358796, 2.412544, 1, 0, 0.4078431, 1,
1.59113, -1.618338, 2.227943, 1, 0, 0.4039216, 1,
1.595158, 0.6773819, 0.6785324, 1, 0, 0.3960784, 1,
1.599692, 0.9270769, 0.02622127, 1, 0, 0.3882353, 1,
1.603621, 0.08883998, 1.307406, 1, 0, 0.3843137, 1,
1.606302, 1.070211, 0.8451269, 1, 0, 0.3764706, 1,
1.612283, 1.374178, 2.095105, 1, 0, 0.372549, 1,
1.617924, -0.8399101, 2.044628, 1, 0, 0.3647059, 1,
1.633061, -0.9953022, 2.258908, 1, 0, 0.3607843, 1,
1.633517, -1.190459, 3.697444, 1, 0, 0.3529412, 1,
1.634532, 1.545863, 0.9200565, 1, 0, 0.3490196, 1,
1.639091, -0.4098789, 3.727443, 1, 0, 0.3411765, 1,
1.663434, -0.6269383, 2.777059, 1, 0, 0.3372549, 1,
1.676731, 1.05815, -0.2913583, 1, 0, 0.3294118, 1,
1.709208, 0.5237511, 0.6882678, 1, 0, 0.3254902, 1,
1.714287, 0.1395913, 2.485104, 1, 0, 0.3176471, 1,
1.723912, -0.2306135, 2.452259, 1, 0, 0.3137255, 1,
1.725322, 0.8965896, 0.03766425, 1, 0, 0.3058824, 1,
1.727271, -0.8149412, 3.214765, 1, 0, 0.2980392, 1,
1.728322, 0.1732454, 0.7986463, 1, 0, 0.2941177, 1,
1.758694, -0.3978847, 1.630902, 1, 0, 0.2862745, 1,
1.760736, -0.1460713, 1.190203, 1, 0, 0.282353, 1,
1.765774, 0.05190446, 2.996835, 1, 0, 0.2745098, 1,
1.772029, 0.01163294, -1.003119, 1, 0, 0.2705882, 1,
1.773634, -0.3064302, 0.9206918, 1, 0, 0.2627451, 1,
1.779043, 2.075335, 2.372776, 1, 0, 0.2588235, 1,
1.784721, -0.1726997, 2.326427, 1, 0, 0.2509804, 1,
1.791688, 0.4836015, 1.167997, 1, 0, 0.2470588, 1,
1.79305, 2.948825, 0.5812943, 1, 0, 0.2392157, 1,
1.820671, -0.3921002, 2.454471, 1, 0, 0.2352941, 1,
1.844653, -0.6746351, 2.448135, 1, 0, 0.227451, 1,
1.864683, -1.495145, 0.1916517, 1, 0, 0.2235294, 1,
1.868455, -1.625061, 2.371605, 1, 0, 0.2156863, 1,
1.872447, -1.554006, 1.357401, 1, 0, 0.2117647, 1,
1.879649, 0.3515323, 0.9281952, 1, 0, 0.2039216, 1,
1.932637, -0.3830488, 1.72969, 1, 0, 0.1960784, 1,
1.933091, -0.1082338, 1.624846, 1, 0, 0.1921569, 1,
1.962479, -0.4139908, 3.543208, 1, 0, 0.1843137, 1,
1.966924, 0.1598464, 1.719999, 1, 0, 0.1803922, 1,
1.98723, -1.203939, 0.4934385, 1, 0, 0.172549, 1,
2.021951, -1.297518, 3.086287, 1, 0, 0.1686275, 1,
2.046667, -0.526359, 1.755506, 1, 0, 0.1607843, 1,
2.0682, -1.272391, 2.372355, 1, 0, 0.1568628, 1,
2.113142, -0.89151, 3.000547, 1, 0, 0.1490196, 1,
2.118927, 0.02829202, 1.351155, 1, 0, 0.145098, 1,
2.132848, -0.5347033, 1.173342, 1, 0, 0.1372549, 1,
2.142979, -0.8005333, 2.206989, 1, 0, 0.1333333, 1,
2.146196, -1.08848, 3.651273, 1, 0, 0.1254902, 1,
2.197607, -0.3119168, 2.036263, 1, 0, 0.1215686, 1,
2.216946, -0.242784, 1.183341, 1, 0, 0.1137255, 1,
2.251113, -0.3051448, 1.622293, 1, 0, 0.1098039, 1,
2.255056, -1.459849, 2.657379, 1, 0, 0.1019608, 1,
2.314055, 0.8265125, 1.385004, 1, 0, 0.09411765, 1,
2.320253, 0.4167615, 0.202894, 1, 0, 0.09019608, 1,
2.430693, 1.027262, 2.321362, 1, 0, 0.08235294, 1,
2.432506, -0.4948981, 2.570867, 1, 0, 0.07843138, 1,
2.437336, -1.387544, 0.7808152, 1, 0, 0.07058824, 1,
2.451082, -0.02080251, 1.325937, 1, 0, 0.06666667, 1,
2.5043, -1.09476, 1.736694, 1, 0, 0.05882353, 1,
2.517183, -1.017445, 1.94189, 1, 0, 0.05490196, 1,
2.52123, -0.1366995, 0.9831355, 1, 0, 0.04705882, 1,
2.553871, 0.6648865, 1.124036, 1, 0, 0.04313726, 1,
2.616243, -0.938099, 3.942815, 1, 0, 0.03529412, 1,
2.704225, -0.8452632, 2.205382, 1, 0, 0.03137255, 1,
2.724815, 1.561552, 1.230928, 1, 0, 0.02352941, 1,
2.726808, 0.7671887, 3.268164, 1, 0, 0.01960784, 1,
2.828381, -0.07770707, 1.685705, 1, 0, 0.01176471, 1,
2.877965, -0.0209277, 0.9721108, 1, 0, 0.007843138, 1
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
-0.0003834963, -3.730771, -6.941531, 0, -0.5, 0.5, 0.5,
-0.0003834963, -3.730771, -6.941531, 1, -0.5, 0.5, 0.5,
-0.0003834963, -3.730771, -6.941531, 1, 1.5, 0.5, 0.5,
-0.0003834963, -3.730771, -6.941531, 0, 1.5, 0.5, 0.5
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
-3.854492, 0.2552513, -6.941531, 0, -0.5, 0.5, 0.5,
-3.854492, 0.2552513, -6.941531, 1, -0.5, 0.5, 0.5,
-3.854492, 0.2552513, -6.941531, 1, 1.5, 0.5, 0.5,
-3.854492, 0.2552513, -6.941531, 0, 1.5, 0.5, 0.5
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
-3.854492, -3.730771, 0.1564531, 0, -0.5, 0.5, 0.5,
-3.854492, -3.730771, 0.1564531, 1, -0.5, 0.5, 0.5,
-3.854492, -3.730771, 0.1564531, 1, 1.5, 0.5, 0.5,
-3.854492, -3.730771, 0.1564531, 0, 1.5, 0.5, 0.5
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
-2, -2.81092, -5.303534,
2, -2.81092, -5.303534,
-2, -2.81092, -5.303534,
-2, -2.964228, -5.576534,
-1, -2.81092, -5.303534,
-1, -2.964228, -5.576534,
0, -2.81092, -5.303534,
0, -2.964228, -5.576534,
1, -2.81092, -5.303534,
1, -2.964228, -5.576534,
2, -2.81092, -5.303534,
2, -2.964228, -5.576534
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
-2, -3.270845, -6.122532, 0, -0.5, 0.5, 0.5,
-2, -3.270845, -6.122532, 1, -0.5, 0.5, 0.5,
-2, -3.270845, -6.122532, 1, 1.5, 0.5, 0.5,
-2, -3.270845, -6.122532, 0, 1.5, 0.5, 0.5,
-1, -3.270845, -6.122532, 0, -0.5, 0.5, 0.5,
-1, -3.270845, -6.122532, 1, -0.5, 0.5, 0.5,
-1, -3.270845, -6.122532, 1, 1.5, 0.5, 0.5,
-1, -3.270845, -6.122532, 0, 1.5, 0.5, 0.5,
0, -3.270845, -6.122532, 0, -0.5, 0.5, 0.5,
0, -3.270845, -6.122532, 1, -0.5, 0.5, 0.5,
0, -3.270845, -6.122532, 1, 1.5, 0.5, 0.5,
0, -3.270845, -6.122532, 0, 1.5, 0.5, 0.5,
1, -3.270845, -6.122532, 0, -0.5, 0.5, 0.5,
1, -3.270845, -6.122532, 1, -0.5, 0.5, 0.5,
1, -3.270845, -6.122532, 1, 1.5, 0.5, 0.5,
1, -3.270845, -6.122532, 0, 1.5, 0.5, 0.5,
2, -3.270845, -6.122532, 0, -0.5, 0.5, 0.5,
2, -3.270845, -6.122532, 1, -0.5, 0.5, 0.5,
2, -3.270845, -6.122532, 1, 1.5, 0.5, 0.5,
2, -3.270845, -6.122532, 0, 1.5, 0.5, 0.5
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
-2.965082, -2, -5.303534,
-2.965082, 3, -5.303534,
-2.965082, -2, -5.303534,
-3.113317, -2, -5.576534,
-2.965082, -1, -5.303534,
-3.113317, -1, -5.576534,
-2.965082, 0, -5.303534,
-3.113317, 0, -5.576534,
-2.965082, 1, -5.303534,
-3.113317, 1, -5.576534,
-2.965082, 2, -5.303534,
-3.113317, 2, -5.576534,
-2.965082, 3, -5.303534,
-3.113317, 3, -5.576534
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
-3.409787, -2, -6.122532, 0, -0.5, 0.5, 0.5,
-3.409787, -2, -6.122532, 1, -0.5, 0.5, 0.5,
-3.409787, -2, -6.122532, 1, 1.5, 0.5, 0.5,
-3.409787, -2, -6.122532, 0, 1.5, 0.5, 0.5,
-3.409787, -1, -6.122532, 0, -0.5, 0.5, 0.5,
-3.409787, -1, -6.122532, 1, -0.5, 0.5, 0.5,
-3.409787, -1, -6.122532, 1, 1.5, 0.5, 0.5,
-3.409787, -1, -6.122532, 0, 1.5, 0.5, 0.5,
-3.409787, 0, -6.122532, 0, -0.5, 0.5, 0.5,
-3.409787, 0, -6.122532, 1, -0.5, 0.5, 0.5,
-3.409787, 0, -6.122532, 1, 1.5, 0.5, 0.5,
-3.409787, 0, -6.122532, 0, 1.5, 0.5, 0.5,
-3.409787, 1, -6.122532, 0, -0.5, 0.5, 0.5,
-3.409787, 1, -6.122532, 1, -0.5, 0.5, 0.5,
-3.409787, 1, -6.122532, 1, 1.5, 0.5, 0.5,
-3.409787, 1, -6.122532, 0, 1.5, 0.5, 0.5,
-3.409787, 2, -6.122532, 0, -0.5, 0.5, 0.5,
-3.409787, 2, -6.122532, 1, -0.5, 0.5, 0.5,
-3.409787, 2, -6.122532, 1, 1.5, 0.5, 0.5,
-3.409787, 2, -6.122532, 0, 1.5, 0.5, 0.5,
-3.409787, 3, -6.122532, 0, -0.5, 0.5, 0.5,
-3.409787, 3, -6.122532, 1, -0.5, 0.5, 0.5,
-3.409787, 3, -6.122532, 1, 1.5, 0.5, 0.5,
-3.409787, 3, -6.122532, 0, 1.5, 0.5, 0.5
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
-2.965082, -2.81092, -4,
-2.965082, -2.81092, 4,
-2.965082, -2.81092, -4,
-3.113317, -2.964228, -4,
-2.965082, -2.81092, -2,
-3.113317, -2.964228, -2,
-2.965082, -2.81092, 0,
-3.113317, -2.964228, 0,
-2.965082, -2.81092, 2,
-3.113317, -2.964228, 2,
-2.965082, -2.81092, 4,
-3.113317, -2.964228, 4
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
-3.409787, -3.270845, -4, 0, -0.5, 0.5, 0.5,
-3.409787, -3.270845, -4, 1, -0.5, 0.5, 0.5,
-3.409787, -3.270845, -4, 1, 1.5, 0.5, 0.5,
-3.409787, -3.270845, -4, 0, 1.5, 0.5, 0.5,
-3.409787, -3.270845, -2, 0, -0.5, 0.5, 0.5,
-3.409787, -3.270845, -2, 1, -0.5, 0.5, 0.5,
-3.409787, -3.270845, -2, 1, 1.5, 0.5, 0.5,
-3.409787, -3.270845, -2, 0, 1.5, 0.5, 0.5,
-3.409787, -3.270845, 0, 0, -0.5, 0.5, 0.5,
-3.409787, -3.270845, 0, 1, -0.5, 0.5, 0.5,
-3.409787, -3.270845, 0, 1, 1.5, 0.5, 0.5,
-3.409787, -3.270845, 0, 0, 1.5, 0.5, 0.5,
-3.409787, -3.270845, 2, 0, -0.5, 0.5, 0.5,
-3.409787, -3.270845, 2, 1, -0.5, 0.5, 0.5,
-3.409787, -3.270845, 2, 1, 1.5, 0.5, 0.5,
-3.409787, -3.270845, 2, 0, 1.5, 0.5, 0.5,
-3.409787, -3.270845, 4, 0, -0.5, 0.5, 0.5,
-3.409787, -3.270845, 4, 1, -0.5, 0.5, 0.5,
-3.409787, -3.270845, 4, 1, 1.5, 0.5, 0.5,
-3.409787, -3.270845, 4, 0, 1.5, 0.5, 0.5
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
-2.965082, -2.81092, -5.303534,
-2.965082, 3.321422, -5.303534,
-2.965082, -2.81092, 5.61644,
-2.965082, 3.321422, 5.61644,
-2.965082, -2.81092, -5.303534,
-2.965082, -2.81092, 5.61644,
-2.965082, 3.321422, -5.303534,
-2.965082, 3.321422, 5.61644,
-2.965082, -2.81092, -5.303534,
2.964315, -2.81092, -5.303534,
-2.965082, -2.81092, 5.61644,
2.964315, -2.81092, 5.61644,
-2.965082, 3.321422, -5.303534,
2.964315, 3.321422, -5.303534,
-2.965082, 3.321422, 5.61644,
2.964315, 3.321422, 5.61644,
2.964315, -2.81092, -5.303534,
2.964315, 3.321422, -5.303534,
2.964315, -2.81092, 5.61644,
2.964315, 3.321422, 5.61644,
2.964315, -2.81092, -5.303534,
2.964315, -2.81092, 5.61644,
2.964315, 3.321422, -5.303534,
2.964315, 3.321422, 5.61644
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
var radius = 7.39923;
var distance = 32.92001;
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
mvMatrix.translate( 0.0003834963, -0.2552513, -0.1564531 );
mvMatrix.scale( 1.349242, 1.30459, 0.7326201 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.92001);
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
Propargite<-read.table("Propargite.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propargite$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propargite' not found
```

```r
y<-Propargite$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propargite' not found
```

```r
z<-Propargite$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propargite' not found
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
-2.878732, 2.099472, -1.958062, 0, 0, 1, 1, 1,
-2.763516, -0.9527181, -3.900007, 1, 0, 0, 1, 1,
-2.702311, 0.5501245, -1.222629, 1, 0, 0, 1, 1,
-2.632706, 0.8310181, -2.11985, 1, 0, 0, 1, 1,
-2.390018, 0.2300416, -2.9486, 1, 0, 0, 1, 1,
-2.347924, -0.9503677, -1.991799, 1, 0, 0, 1, 1,
-2.268434, 1.355318, -1.272712, 0, 0, 0, 1, 1,
-2.228497, -2.354501, -3.028265, 0, 0, 0, 1, 1,
-2.18269, -0.3228398, -0.6249597, 0, 0, 0, 1, 1,
-2.166085, 0.3390296, -1.44546, 0, 0, 0, 1, 1,
-2.154893, -0.4747363, 0.16927, 0, 0, 0, 1, 1,
-2.077412, -0.8856553, -1.448672, 0, 0, 0, 1, 1,
-2.061909, 0.7582944, -1.091533, 0, 0, 0, 1, 1,
-2.055835, 0.869196, -1.845501, 1, 1, 1, 1, 1,
-1.997744, 0.6594225, 0.05794446, 1, 1, 1, 1, 1,
-1.915485, 0.3263494, -0.6757205, 1, 1, 1, 1, 1,
-1.895258, -2.399522, -3.098797, 1, 1, 1, 1, 1,
-1.89173, 0.2838821, -0.7644818, 1, 1, 1, 1, 1,
-1.885946, 0.4887832, -1.850742, 1, 1, 1, 1, 1,
-1.874689, 0.01941757, 0.5680661, 1, 1, 1, 1, 1,
-1.867953, 0.06725084, -2.472973, 1, 1, 1, 1, 1,
-1.865102, 0.7670363, -0.3005834, 1, 1, 1, 1, 1,
-1.859176, -0.4342683, -2.108836, 1, 1, 1, 1, 1,
-1.813112, -0.3960811, -0.7161735, 1, 1, 1, 1, 1,
-1.81136, 0.5808401, -1.452295, 1, 1, 1, 1, 1,
-1.78749, 0.333587, -0.5212643, 1, 1, 1, 1, 1,
-1.768949, -0.03353271, -0.6722008, 1, 1, 1, 1, 1,
-1.762761, 2.068422, 0.02595966, 1, 1, 1, 1, 1,
-1.759629, 0.254618, -1.758475, 0, 0, 1, 1, 1,
-1.753739, -0.5262058, -0.242162, 1, 0, 0, 1, 1,
-1.742931, 0.574634, -0.2596013, 1, 0, 0, 1, 1,
-1.7424, 2.270417, -0.9542344, 1, 0, 0, 1, 1,
-1.740241, -0.6344994, -2.18333, 1, 0, 0, 1, 1,
-1.73949, 0.9636369, -1.760272, 1, 0, 0, 1, 1,
-1.736457, -0.1954571, -1.401045, 0, 0, 0, 1, 1,
-1.72546, -0.9032628, -0.9537786, 0, 0, 0, 1, 1,
-1.722783, 1.35805, -1.708171, 0, 0, 0, 1, 1,
-1.71897, -1.295141, -1.954788, 0, 0, 0, 1, 1,
-1.703054, -0.6915522, -1.572548, 0, 0, 0, 1, 1,
-1.692545, 1.727821, -1.433463, 0, 0, 0, 1, 1,
-1.686327, -2.304082, -1.960232, 0, 0, 0, 1, 1,
-1.671998, -0.7419627, -2.37074, 1, 1, 1, 1, 1,
-1.66585, 2.348595, -1.1856, 1, 1, 1, 1, 1,
-1.653136, 0.5974212, -1.282317, 1, 1, 1, 1, 1,
-1.649987, -0.9683264, -1.207042, 1, 1, 1, 1, 1,
-1.648416, -0.05951155, -0.4954201, 1, 1, 1, 1, 1,
-1.645644, 1.870883, -3.168731, 1, 1, 1, 1, 1,
-1.642555, 0.8283689, -0.4013067, 1, 1, 1, 1, 1,
-1.641284, -0.966358, -2.651346, 1, 1, 1, 1, 1,
-1.63939, -0.3147614, -2.353958, 1, 1, 1, 1, 1,
-1.607115, 0.8965942, -2.34325, 1, 1, 1, 1, 1,
-1.604768, -0.4230198, -2.94615, 1, 1, 1, 1, 1,
-1.59217, -1.390155, -1.996306, 1, 1, 1, 1, 1,
-1.590593, -0.8576214, -1.508415, 1, 1, 1, 1, 1,
-1.584646, -0.2370404, -2.875674, 1, 1, 1, 1, 1,
-1.582199, -0.6200278, -2.910086, 1, 1, 1, 1, 1,
-1.564846, 0.3072517, -2.005946, 0, 0, 1, 1, 1,
-1.544075, 0.4529872, 1.00164, 1, 0, 0, 1, 1,
-1.540713, 0.03308412, -1.168653, 1, 0, 0, 1, 1,
-1.533417, -1.678756, -2.255409, 1, 0, 0, 1, 1,
-1.531201, 0.9063321, -1.065415, 1, 0, 0, 1, 1,
-1.530656, -0.8861163, -3.1075, 1, 0, 0, 1, 1,
-1.519937, -0.3954609, -0.026482, 0, 0, 0, 1, 1,
-1.515697, 1.055166, -1.861204, 0, 0, 0, 1, 1,
-1.513827, -0.7241386, -2.792181, 0, 0, 0, 1, 1,
-1.507589, 0.764532, 0.162297, 0, 0, 0, 1, 1,
-1.496415, -0.3049959, -0.9677009, 0, 0, 0, 1, 1,
-1.491972, -1.149819, -0.1085343, 0, 0, 0, 1, 1,
-1.489437, -2.286048, -1.984913, 0, 0, 0, 1, 1,
-1.474366, -1.033127, -2.881952, 1, 1, 1, 1, 1,
-1.459589, -0.4103025, -3.609079, 1, 1, 1, 1, 1,
-1.453939, 0.9645213, -1.172622, 1, 1, 1, 1, 1,
-1.453602, 1.666462, -0.25214, 1, 1, 1, 1, 1,
-1.447185, -1.378919, -3.095062, 1, 1, 1, 1, 1,
-1.442187, -0.1612678, -1.864677, 1, 1, 1, 1, 1,
-1.43411, 0.8628815, 0.3433678, 1, 1, 1, 1, 1,
-1.432645, 0.4144203, -0.7008832, 1, 1, 1, 1, 1,
-1.426847, -1.549302, -1.548897, 1, 1, 1, 1, 1,
-1.387084, -0.2474691, -1.758182, 1, 1, 1, 1, 1,
-1.380272, 0.2231004, -1.37474, 1, 1, 1, 1, 1,
-1.379035, 3.232116, -0.1322293, 1, 1, 1, 1, 1,
-1.362654, -0.3006077, -2.07968, 1, 1, 1, 1, 1,
-1.355157, -0.6206189, -0.9465172, 1, 1, 1, 1, 1,
-1.344554, 1.320249, -1.048419, 1, 1, 1, 1, 1,
-1.344163, -1.778304, -1.494942, 0, 0, 1, 1, 1,
-1.341735, -0.2807258, -1.633211, 1, 0, 0, 1, 1,
-1.336468, 0.5061911, -0.8788399, 1, 0, 0, 1, 1,
-1.331226, -2.308818, -2.384675, 1, 0, 0, 1, 1,
-1.32089, 1.20704, -1.07589, 1, 0, 0, 1, 1,
-1.318383, -0.1991088, -0.9319557, 1, 0, 0, 1, 1,
-1.313907, -0.3358276, -3.001859, 0, 0, 0, 1, 1,
-1.309722, 2.438377, 0.4249806, 0, 0, 0, 1, 1,
-1.309176, -1.168526, -1.539678, 0, 0, 0, 1, 1,
-1.305756, 0.7150574, -0.8090496, 0, 0, 0, 1, 1,
-1.294532, 0.1530575, -0.7321938, 0, 0, 0, 1, 1,
-1.293212, -0.4085509, -1.560799, 0, 0, 0, 1, 1,
-1.292403, 1.59959, -0.9050703, 0, 0, 0, 1, 1,
-1.284828, -0.2133859, -2.186167, 1, 1, 1, 1, 1,
-1.282488, -1.114047, -2.285956, 1, 1, 1, 1, 1,
-1.278378, 0.9440857, 0.3440644, 1, 1, 1, 1, 1,
-1.275575, 0.7253323, -2.163661, 1, 1, 1, 1, 1,
-1.270287, -0.7325094, -2.773762, 1, 1, 1, 1, 1,
-1.268792, -0.9290547, 0.102207, 1, 1, 1, 1, 1,
-1.264261, -0.6740927, -1.50326, 1, 1, 1, 1, 1,
-1.25893, -1.142652, -2.707923, 1, 1, 1, 1, 1,
-1.258485, -1.315383, -3.062191, 1, 1, 1, 1, 1,
-1.255038, 1.295993, -0.9390732, 1, 1, 1, 1, 1,
-1.253133, -0.3533174, -1.848826, 1, 1, 1, 1, 1,
-1.24026, 1.035774, -0.1562323, 1, 1, 1, 1, 1,
-1.239715, 0.8329898, -0.6399263, 1, 1, 1, 1, 1,
-1.23684, -0.4575346, -2.675165, 1, 1, 1, 1, 1,
-1.23653, 0.3454384, -1.434098, 1, 1, 1, 1, 1,
-1.235156, 0.009125541, -0.9075459, 0, 0, 1, 1, 1,
-1.231411, -1.228143, -0.5380826, 1, 0, 0, 1, 1,
-1.227301, -0.8051067, -1.573008, 1, 0, 0, 1, 1,
-1.225531, -0.06845777, -2.929446, 1, 0, 0, 1, 1,
-1.213357, -0.2006039, -3.255896, 1, 0, 0, 1, 1,
-1.207141, 1.150771, 0.002144141, 1, 0, 0, 1, 1,
-1.206497, 1.200105, -2.934175, 0, 0, 0, 1, 1,
-1.200181, -0.7493193, -2.7642, 0, 0, 0, 1, 1,
-1.198536, 1.175275, -1.268556, 0, 0, 0, 1, 1,
-1.182066, 2.092085, -1.166114, 0, 0, 0, 1, 1,
-1.179383, 0.04925826, -0.1104483, 0, 0, 0, 1, 1,
-1.179062, 0.2103382, -0.7782297, 0, 0, 0, 1, 1,
-1.170906, -0.2829072, -3.611114, 0, 0, 0, 1, 1,
-1.155206, 0.5588304, -1.76539, 1, 1, 1, 1, 1,
-1.132604, 0.4793075, 0.09298539, 1, 1, 1, 1, 1,
-1.130314, 0.9080968, -1.399913, 1, 1, 1, 1, 1,
-1.09658, -1.902351, -2.364355, 1, 1, 1, 1, 1,
-1.091242, 1.379987, -0.5982823, 1, 1, 1, 1, 1,
-1.090359, 0.2969461, -0.4866599, 1, 1, 1, 1, 1,
-1.086651, -1.772326, -2.668008, 1, 1, 1, 1, 1,
-1.083511, -1.070187, -2.712295, 1, 1, 1, 1, 1,
-1.082531, -0.1898951, -1.160008, 1, 1, 1, 1, 1,
-1.082475, 2.562211, 2.475986, 1, 1, 1, 1, 1,
-1.074729, -0.08504317, -2.839206, 1, 1, 1, 1, 1,
-1.063589, 0.8508126, -1.787795, 1, 1, 1, 1, 1,
-1.063427, 1.006378, -1.220589, 1, 1, 1, 1, 1,
-1.056428, 0.9104789, 0.05168405, 1, 1, 1, 1, 1,
-1.051474, -0.04402285, -1.488709, 1, 1, 1, 1, 1,
-1.04748, -0.3120769, -0.9782855, 0, 0, 1, 1, 1,
-1.042404, 0.3497135, 0.06589417, 1, 0, 0, 1, 1,
-1.040826, -1.764324, -3.267992, 1, 0, 0, 1, 1,
-1.035438, 0.1609408, -2.054386, 1, 0, 0, 1, 1,
-1.028517, 0.2648274, -2.280609, 1, 0, 0, 1, 1,
-1.02805, -0.4296429, -2.283741, 1, 0, 0, 1, 1,
-1.023036, -0.6582073, -4.41246, 0, 0, 0, 1, 1,
-1.021458, 0.9825795, -0.3751895, 0, 0, 0, 1, 1,
-1.020786, -1.359294, -1.667314, 0, 0, 0, 1, 1,
-1.016386, 1.070346, 0.1313174, 0, 0, 0, 1, 1,
-1.006292, -0.5639983, -3.582781, 0, 0, 0, 1, 1,
-1.005826, -0.2396601, -1.332046, 0, 0, 0, 1, 1,
-0.9875754, 0.9168745, -0.007036206, 0, 0, 0, 1, 1,
-0.9866262, -2.721614, -2.000205, 1, 1, 1, 1, 1,
-0.9862997, -0.3402109, -2.208678, 1, 1, 1, 1, 1,
-0.9856325, -0.8802457, -1.223997, 1, 1, 1, 1, 1,
-0.9849473, -0.1871326, -2.894262, 1, 1, 1, 1, 1,
-0.9794208, 0.2617612, -2.734598, 1, 1, 1, 1, 1,
-0.974235, -0.3179378, -3.257079, 1, 1, 1, 1, 1,
-0.9728929, -1.734292, -3.556777, 1, 1, 1, 1, 1,
-0.9692786, 1.241548, -2.529543, 1, 1, 1, 1, 1,
-0.9685746, 1.200321, 0.6512012, 1, 1, 1, 1, 1,
-0.9672601, 1.155748, -0.494317, 1, 1, 1, 1, 1,
-0.9609404, -0.8842882, -2.988515, 1, 1, 1, 1, 1,
-0.9607917, -1.6211, -1.696508, 1, 1, 1, 1, 1,
-0.9594042, 2.076755, 1.042015, 1, 1, 1, 1, 1,
-0.9479039, -0.1864695, -2.717966, 1, 1, 1, 1, 1,
-0.9474623, 0.8564371, -0.871869, 1, 1, 1, 1, 1,
-0.9449306, -0.1000647, -0.9565809, 0, 0, 1, 1, 1,
-0.9427807, 2.131646, 0.2828586, 1, 0, 0, 1, 1,
-0.9406283, 0.4030026, -0.4868821, 1, 0, 0, 1, 1,
-0.9359503, 2.07627, -2.089909, 1, 0, 0, 1, 1,
-0.9335776, -0.4941427, -1.607379, 1, 0, 0, 1, 1,
-0.9310597, -0.08579975, -3.508542, 1, 0, 0, 1, 1,
-0.9290142, -1.241031, -1.992696, 0, 0, 0, 1, 1,
-0.9265766, -0.09592563, -2.766186, 0, 0, 0, 1, 1,
-0.9224259, -0.8455284, -2.310159, 0, 0, 0, 1, 1,
-0.9149069, 0.5304804, -2.331501, 0, 0, 0, 1, 1,
-0.9103243, -1.241406, -1.866789, 0, 0, 0, 1, 1,
-0.9038886, -0.6728911, -1.707738, 0, 0, 0, 1, 1,
-0.899702, 0.4778597, -1.307361, 0, 0, 0, 1, 1,
-0.8990818, 0.1745197, -1.741055, 1, 1, 1, 1, 1,
-0.8966904, -0.3696023, -0.3614694, 1, 1, 1, 1, 1,
-0.8895627, 0.7686083, -0.3373304, 1, 1, 1, 1, 1,
-0.8885406, -1.010939, -1.746398, 1, 1, 1, 1, 1,
-0.8859718, 1.028844, -1.608516, 1, 1, 1, 1, 1,
-0.8840644, 1.542554, -0.4082436, 1, 1, 1, 1, 1,
-0.8738381, -0.3120327, -0.03465256, 1, 1, 1, 1, 1,
-0.8729223, -0.009333276, 0.7810446, 1, 1, 1, 1, 1,
-0.8705532, -1.00694, -3.691918, 1, 1, 1, 1, 1,
-0.8703226, -0.01167979, -1.882917, 1, 1, 1, 1, 1,
-0.8662544, -1.213027, -3.275919, 1, 1, 1, 1, 1,
-0.8661012, 1.143689, -0.1394619, 1, 1, 1, 1, 1,
-0.8651762, -0.2930301, -1.653822, 1, 1, 1, 1, 1,
-0.8622326, -0.2965242, -0.2036218, 1, 1, 1, 1, 1,
-0.8597503, 0.2490623, -0.9463945, 1, 1, 1, 1, 1,
-0.8581401, 0.08197928, -0.6428057, 0, 0, 1, 1, 1,
-0.8522567, 1.110639, -1.745394, 1, 0, 0, 1, 1,
-0.8511838, 0.2706477, -1.120364, 1, 0, 0, 1, 1,
-0.850215, -0.1631075, -2.263233, 1, 0, 0, 1, 1,
-0.8498695, 1.000234, 0.4499968, 1, 0, 0, 1, 1,
-0.8407019, 0.1320003, -0.6778385, 1, 0, 0, 1, 1,
-0.8381785, 0.150314, -1.390191, 0, 0, 0, 1, 1,
-0.8222916, 0.6509756, -2.322294, 0, 0, 0, 1, 1,
-0.8158869, -0.1983082, -2.672783, 0, 0, 0, 1, 1,
-0.8082594, -0.7015703, -3.206375, 0, 0, 0, 1, 1,
-0.8080447, -1.31109, -1.95925, 0, 0, 0, 1, 1,
-0.805932, -0.2047955, -2.211009, 0, 0, 0, 1, 1,
-0.8012902, 1.781434, -2.234614, 0, 0, 0, 1, 1,
-0.7974844, -2.253584, -3.522582, 1, 1, 1, 1, 1,
-0.7974373, 0.4163679, -2.286312, 1, 1, 1, 1, 1,
-0.7927734, 0.9983851, -2.589963, 1, 1, 1, 1, 1,
-0.7847662, 1.180244, -1.102473, 1, 1, 1, 1, 1,
-0.7724246, -0.565771, -0.925554, 1, 1, 1, 1, 1,
-0.7721578, -1.300874, -2.322307, 1, 1, 1, 1, 1,
-0.7693893, -0.7362497, -2.480929, 1, 1, 1, 1, 1,
-0.7675295, 0.1719142, -1.501544, 1, 1, 1, 1, 1,
-0.761198, -0.2700317, -1.403662, 1, 1, 1, 1, 1,
-0.7588016, -0.5940894, -1.878058, 1, 1, 1, 1, 1,
-0.7576413, -1.517506, -4.456981, 1, 1, 1, 1, 1,
-0.7573619, 0.03990258, -1.877097, 1, 1, 1, 1, 1,
-0.7573431, -0.3802703, -2.547694, 1, 1, 1, 1, 1,
-0.755262, -2.194277, -0.08906168, 1, 1, 1, 1, 1,
-0.7541685, 0.3487124, -2.408703, 1, 1, 1, 1, 1,
-0.7499596, 0.1246647, -2.198501, 0, 0, 1, 1, 1,
-0.7477207, 0.7204861, -1.251619, 1, 0, 0, 1, 1,
-0.7420095, 0.3819119, -0.2938936, 1, 0, 0, 1, 1,
-0.7384518, 0.5007405, 0.4056569, 1, 0, 0, 1, 1,
-0.7354457, -0.2820939, -1.571486, 1, 0, 0, 1, 1,
-0.7340344, 0.2044208, -2.762129, 1, 0, 0, 1, 1,
-0.7225522, 0.673294, -0.1416467, 0, 0, 0, 1, 1,
-0.7221261, 0.1178855, -1.852389, 0, 0, 0, 1, 1,
-0.7147725, 0.4400181, -0.7408859, 0, 0, 0, 1, 1,
-0.7105735, 0.2063794, -3.252531, 0, 0, 0, 1, 1,
-0.6974062, -1.38291, -3.236901, 0, 0, 0, 1, 1,
-0.6964234, 0.1693367, -1.133843, 0, 0, 0, 1, 1,
-0.6951185, 0.2483186, -0.4756845, 0, 0, 0, 1, 1,
-0.6865044, -0.8351347, -1.439561, 1, 1, 1, 1, 1,
-0.6850461, -0.6362638, -0.6474041, 1, 1, 1, 1, 1,
-0.683785, -0.03425799, -1.448802, 1, 1, 1, 1, 1,
-0.6836526, 0.455994, -0.8514593, 1, 1, 1, 1, 1,
-0.6819279, 2.418072, -0.1776655, 1, 1, 1, 1, 1,
-0.6783895, 0.2033673, -1.226406, 1, 1, 1, 1, 1,
-0.6773323, 1.15579, 1.054857, 1, 1, 1, 1, 1,
-0.6757401, -0.7030309, -2.875852, 1, 1, 1, 1, 1,
-0.6754388, 0.01834733, -2.702821, 1, 1, 1, 1, 1,
-0.6708078, -0.01666501, -2.476296, 1, 1, 1, 1, 1,
-0.6677572, -0.5054758, -2.112895, 1, 1, 1, 1, 1,
-0.6648656, -1.178939, -1.138766, 1, 1, 1, 1, 1,
-0.6647646, -0.01821422, -1.627025, 1, 1, 1, 1, 1,
-0.6616015, 0.4127229, -2.60945, 1, 1, 1, 1, 1,
-0.6565524, -0.6001024, -2.952402, 1, 1, 1, 1, 1,
-0.6558741, 0.0489033, -1.768661, 0, 0, 1, 1, 1,
-0.6557091, 1.4073, -2.21246, 1, 0, 0, 1, 1,
-0.6512383, 0.3695199, 0.4096644, 1, 0, 0, 1, 1,
-0.6509649, -1.172599, -3.204409, 1, 0, 0, 1, 1,
-0.645994, 0.5108083, -0.1682355, 1, 0, 0, 1, 1,
-0.6426486, 1.445147, -0.1144361, 1, 0, 0, 1, 1,
-0.6337013, -0.3393821, -3.266633, 0, 0, 0, 1, 1,
-0.6336069, 1.724471, -0.5005574, 0, 0, 0, 1, 1,
-0.6324188, -0.4223264, -1.693892, 0, 0, 0, 1, 1,
-0.6253665, 1.157987, -1.595821, 0, 0, 0, 1, 1,
-0.6196249, 1.397304, -0.8120276, 0, 0, 0, 1, 1,
-0.6157479, -0.521585, -1.235552, 0, 0, 0, 1, 1,
-0.613065, -1.014428, -0.2279378, 0, 0, 0, 1, 1,
-0.6098598, 0.6517447, -0.1530564, 1, 1, 1, 1, 1,
-0.6061783, 0.8294666, -1.413153, 1, 1, 1, 1, 1,
-0.6038206, 0.2350729, -1.45416, 1, 1, 1, 1, 1,
-0.6032807, 0.2159414, -0.2945957, 1, 1, 1, 1, 1,
-0.6008365, -0.5063658, -1.72243, 1, 1, 1, 1, 1,
-0.5985139, -0.5215608, -1.057608, 1, 1, 1, 1, 1,
-0.5985138, 2.074904, -0.6498479, 1, 1, 1, 1, 1,
-0.5955637, 0.3335125, -0.2498849, 1, 1, 1, 1, 1,
-0.595484, -1.877979, -2.770549, 1, 1, 1, 1, 1,
-0.5930485, -1.57594, -1.617115, 1, 1, 1, 1, 1,
-0.589794, -0.7170865, -0.8508831, 1, 1, 1, 1, 1,
-0.5865865, 0.248015, -0.5989934, 1, 1, 1, 1, 1,
-0.5845888, 0.2179714, -1.584446, 1, 1, 1, 1, 1,
-0.5826306, -0.3756653, -0.9987836, 1, 1, 1, 1, 1,
-0.5746725, -0.8551876, -1.437195, 1, 1, 1, 1, 1,
-0.5734484, -0.9990252, -4.077803, 0, 0, 1, 1, 1,
-0.5721855, 0.2224456, -0.4543349, 1, 0, 0, 1, 1,
-0.5714009, 0.734872, 0.03399274, 1, 0, 0, 1, 1,
-0.571181, 1.788507, -0.1634628, 1, 0, 0, 1, 1,
-0.5609203, 0.4060721, 0.3574571, 1, 0, 0, 1, 1,
-0.5535322, 0.6954286, -2.223951, 1, 0, 0, 1, 1,
-0.5525351, -0.5253237, -1.606504, 0, 0, 0, 1, 1,
-0.5523804, -0.453066, -2.477646, 0, 0, 0, 1, 1,
-0.5518609, 1.126613, 0.4910604, 0, 0, 0, 1, 1,
-0.5517069, 1.424541, 0.9037073, 0, 0, 0, 1, 1,
-0.5504075, -2.080678, -2.810939, 0, 0, 0, 1, 1,
-0.544539, -1.14738, -1.496366, 0, 0, 0, 1, 1,
-0.5444365, 1.049361, -3.723725, 0, 0, 0, 1, 1,
-0.5430858, -1.927403, -2.500567, 1, 1, 1, 1, 1,
-0.5424378, -0.2199055, -1.57934, 1, 1, 1, 1, 1,
-0.5411984, 1.672807, 0.3343392, 1, 1, 1, 1, 1,
-0.5371296, -0.17076, -1.311184, 1, 1, 1, 1, 1,
-0.5361194, 0.1614391, -1.417205, 1, 1, 1, 1, 1,
-0.5350314, 0.7033707, 0.8908312, 1, 1, 1, 1, 1,
-0.5308638, -1.378244, -4.068821, 1, 1, 1, 1, 1,
-0.5265277, -0.3777359, -2.183302, 1, 1, 1, 1, 1,
-0.5264842, 0.3045609, -1.590316, 1, 1, 1, 1, 1,
-0.5213363, 0.7053757, -0.2094853, 1, 1, 1, 1, 1,
-0.5182161, -1.098548, -2.485505, 1, 1, 1, 1, 1,
-0.5129887, -0.4052731, -2.380989, 1, 1, 1, 1, 1,
-0.5108482, 1.043684, -0.9175195, 1, 1, 1, 1, 1,
-0.5061131, 0.2853591, -1.353488, 1, 1, 1, 1, 1,
-0.5060384, -1.477041, -1.774627, 1, 1, 1, 1, 1,
-0.5052145, 1.304969, 1.031949, 0, 0, 1, 1, 1,
-0.4943107, 0.3085583, -1.481914, 1, 0, 0, 1, 1,
-0.4855528, 0.329746, -0.03768988, 1, 0, 0, 1, 1,
-0.4837508, -1.10475, -2.422054, 1, 0, 0, 1, 1,
-0.4811226, 0.2853039, -0.6331592, 1, 0, 0, 1, 1,
-0.4811041, 0.9762833, 0.01390038, 1, 0, 0, 1, 1,
-0.4742699, 0.86887, -0.5916184, 0, 0, 0, 1, 1,
-0.4675012, 0.6669514, 0.2614066, 0, 0, 0, 1, 1,
-0.4672756, -0.5569704, -3.864502, 0, 0, 0, 1, 1,
-0.4634462, 1.857076, -1.189501, 0, 0, 0, 1, 1,
-0.4625935, 0.5074477, -0.5896133, 0, 0, 0, 1, 1,
-0.4610473, -0.9028955, -2.648585, 0, 0, 0, 1, 1,
-0.4582109, -1.929211, -2.769316, 0, 0, 0, 1, 1,
-0.4580256, 0.9338155, -0.3966004, 1, 1, 1, 1, 1,
-0.449092, -0.3012089, 0.7146028, 1, 1, 1, 1, 1,
-0.4437208, 0.4121136, -1.046144, 1, 1, 1, 1, 1,
-0.4424237, 0.3403122, -0.9102306, 1, 1, 1, 1, 1,
-0.433476, 1.269745, -1.389184, 1, 1, 1, 1, 1,
-0.4328037, -0.06588855, -0.3515131, 1, 1, 1, 1, 1,
-0.4226957, -0.9020494, -4.429457, 1, 1, 1, 1, 1,
-0.4216011, -0.3429236, -2.552147, 1, 1, 1, 1, 1,
-0.4207586, 0.4327798, -0.5964437, 1, 1, 1, 1, 1,
-0.4194825, -0.4873423, -2.530037, 1, 1, 1, 1, 1,
-0.4182234, -1.803822, -3.284331, 1, 1, 1, 1, 1,
-0.4171727, 0.1684025, -2.150014, 1, 1, 1, 1, 1,
-0.4162307, -0.3089828, -2.778821, 1, 1, 1, 1, 1,
-0.4141859, 0.7392088, -1.696737, 1, 1, 1, 1, 1,
-0.4135139, 0.3023329, -0.8231218, 1, 1, 1, 1, 1,
-0.4122147, 0.3251961, -1.102969, 0, 0, 1, 1, 1,
-0.4116331, 0.9248112, -2.017603, 1, 0, 0, 1, 1,
-0.4060007, -1.29211, -2.938239, 1, 0, 0, 1, 1,
-0.4044253, -0.3500302, -2.091257, 1, 0, 0, 1, 1,
-0.3971501, 2.001751, -0.5379856, 1, 0, 0, 1, 1,
-0.3939463, -0.7683818, -1.44216, 1, 0, 0, 1, 1,
-0.3929783, -0.6142892, -3.710065, 0, 0, 0, 1, 1,
-0.3925092, -0.3047262, -3.231072, 0, 0, 0, 1, 1,
-0.3924694, 1.356583, -3.311557, 0, 0, 0, 1, 1,
-0.39221, -0.1234628, -2.390781, 0, 0, 0, 1, 1,
-0.3921208, -0.3213659, -1.28169, 0, 0, 0, 1, 1,
-0.3908688, 0.4667875, -1.508033, 0, 0, 0, 1, 1,
-0.3887692, -0.02761368, -1.719068, 0, 0, 0, 1, 1,
-0.3852314, -0.2757395, -2.680811, 1, 1, 1, 1, 1,
-0.3838199, -0.9108429, -3.933659, 1, 1, 1, 1, 1,
-0.3813993, -1.674381, -3.181332, 1, 1, 1, 1, 1,
-0.3753912, 0.6742496, -0.3032568, 1, 1, 1, 1, 1,
-0.3724373, 1.699777, 0.9436942, 1, 1, 1, 1, 1,
-0.3703732, 0.5490087, -2.286262, 1, 1, 1, 1, 1,
-0.3582849, -0.9248663, -5.144506, 1, 1, 1, 1, 1,
-0.3464576, -0.5165946, -1.509203, 1, 1, 1, 1, 1,
-0.3447263, -1.140075, -2.144825, 1, 1, 1, 1, 1,
-0.3443413, 0.6489549, 0.08178958, 1, 1, 1, 1, 1,
-0.3434952, -1.59171, -3.995429, 1, 1, 1, 1, 1,
-0.3305894, 0.8031376, -0.8657839, 1, 1, 1, 1, 1,
-0.3294343, 0.276948, -2.02, 1, 1, 1, 1, 1,
-0.3202611, -2.315626, -1.905232, 1, 1, 1, 1, 1,
-0.3115908, 0.07584408, -2.458839, 1, 1, 1, 1, 1,
-0.3081159, -2.181102, -1.060832, 0, 0, 1, 1, 1,
-0.3070257, -1.017864, -3.198848, 1, 0, 0, 1, 1,
-0.3047061, 0.2069755, -1.910403, 1, 0, 0, 1, 1,
-0.2969665, 1.331458, -0.6499684, 1, 0, 0, 1, 1,
-0.2949435, -0.3355403, -3.233503, 1, 0, 0, 1, 1,
-0.2913352, 1.596093, -1.282119, 1, 0, 0, 1, 1,
-0.2895509, -0.1349704, -2.355578, 0, 0, 0, 1, 1,
-0.2875134, 0.3911969, 1.147068, 0, 0, 0, 1, 1,
-0.2867313, -0.2117031, -1.272308, 0, 0, 0, 1, 1,
-0.2835639, -0.5031502, -2.112206, 0, 0, 0, 1, 1,
-0.2797896, 0.7683067, -1.629273, 0, 0, 0, 1, 1,
-0.2747008, 1.923693, 0.2901813, 0, 0, 0, 1, 1,
-0.2742386, -0.2074348, -2.923528, 0, 0, 0, 1, 1,
-0.2737651, -0.1508989, -2.363199, 1, 1, 1, 1, 1,
-0.2706306, -0.7727037, -3.72745, 1, 1, 1, 1, 1,
-0.2696089, -0.0571871, -1.657602, 1, 1, 1, 1, 1,
-0.2683386, 1.299016, 0.6492906, 1, 1, 1, 1, 1,
-0.26464, 1.232245, -0.6222173, 1, 1, 1, 1, 1,
-0.2535341, 0.6121045, -1.667306, 1, 1, 1, 1, 1,
-0.2507243, -1.237239, -2.912069, 1, 1, 1, 1, 1,
-0.2505341, -0.1129857, -0.03776874, 1, 1, 1, 1, 1,
-0.2504754, 0.9881535, 0.08901973, 1, 1, 1, 1, 1,
-0.2502904, -1.910622, -3.451224, 1, 1, 1, 1, 1,
-0.2428921, 0.638482, 1.915569, 1, 1, 1, 1, 1,
-0.2419985, 0.4696784, -1.192331, 1, 1, 1, 1, 1,
-0.2382881, 0.6525279, -1.97378, 1, 1, 1, 1, 1,
-0.235776, -0.9365198, -3.319426, 1, 1, 1, 1, 1,
-0.2343656, -0.7815972, -2.01673, 1, 1, 1, 1, 1,
-0.2342211, 0.797182, -0.6429537, 0, 0, 1, 1, 1,
-0.2335247, -1.408683, -3.678223, 1, 0, 0, 1, 1,
-0.2324326, -0.3564495, -3.011928, 1, 0, 0, 1, 1,
-0.2271355, -1.488095, -3.664508, 1, 0, 0, 1, 1,
-0.2247901, -0.03594012, -3.095456, 1, 0, 0, 1, 1,
-0.2246851, 0.6059435, -0.1786856, 1, 0, 0, 1, 1,
-0.2239497, -1.384898, -3.014648, 0, 0, 0, 1, 1,
-0.2235056, 1.937346, 0.1769391, 0, 0, 0, 1, 1,
-0.2169333, 0.5131169, -1.668046, 0, 0, 0, 1, 1,
-0.2146785, 0.5462529, -1.76399, 0, 0, 0, 1, 1,
-0.2134497, 0.8212187, 0.2930757, 0, 0, 0, 1, 1,
-0.2100532, 1.678855, -2.03114, 0, 0, 0, 1, 1,
-0.203193, 0.7463832, 0.8616135, 0, 0, 0, 1, 1,
-0.1991412, 0.4203903, -0.4492162, 1, 1, 1, 1, 1,
-0.1974485, -1.428169, -3.43246, 1, 1, 1, 1, 1,
-0.195319, -0.0756248, -3.895039, 1, 1, 1, 1, 1,
-0.1894412, 0.00636101, -1.787716, 1, 1, 1, 1, 1,
-0.187758, -0.5525411, -3.884827, 1, 1, 1, 1, 1,
-0.1868877, 0.7616239, 1.142373, 1, 1, 1, 1, 1,
-0.1838092, 1.257168, -0.1472264, 1, 1, 1, 1, 1,
-0.1835111, 1.503811, -0.3877589, 1, 1, 1, 1, 1,
-0.1828935, -0.2824678, -2.873951, 1, 1, 1, 1, 1,
-0.1760062, 1.583378, -0.4434234, 1, 1, 1, 1, 1,
-0.1751672, 1.509114, -0.6360427, 1, 1, 1, 1, 1,
-0.170719, -0.7658281, -2.638085, 1, 1, 1, 1, 1,
-0.1706636, 0.3049969, -0.5181085, 1, 1, 1, 1, 1,
-0.1704869, 0.4953926, 1.116547, 1, 1, 1, 1, 1,
-0.1693538, -0.6545409, -3.357826, 1, 1, 1, 1, 1,
-0.1668109, 0.4184085, -0.5141482, 0, 0, 1, 1, 1,
-0.164627, -0.3660581, -2.951527, 1, 0, 0, 1, 1,
-0.1640576, -1.356364, -3.037311, 1, 0, 0, 1, 1,
-0.1606133, 1.654781, -0.1853445, 1, 0, 0, 1, 1,
-0.1570627, -1.43779, -3.376509, 1, 0, 0, 1, 1,
-0.1556835, 0.06046341, -0.9583728, 1, 0, 0, 1, 1,
-0.1555188, 0.1903465, -1.113331, 0, 0, 0, 1, 1,
-0.153596, 0.238133, -0.7411996, 0, 0, 0, 1, 1,
-0.1532589, -1.23443, -2.963293, 0, 0, 0, 1, 1,
-0.1515757, 0.3361746, -1.151298, 0, 0, 0, 1, 1,
-0.1478427, -0.1533512, -2.003666, 0, 0, 0, 1, 1,
-0.1475126, 1.221297, -1.052964, 0, 0, 0, 1, 1,
-0.1462342, 1.355175, -0.2673248, 0, 0, 0, 1, 1,
-0.1454823, 1.439064, -0.07261817, 1, 1, 1, 1, 1,
-0.1424816, 0.1446016, -0.1234474, 1, 1, 1, 1, 1,
-0.1401043, 0.436532, -0.4952071, 1, 1, 1, 1, 1,
-0.1389481, 0.636017, -2.246522, 1, 1, 1, 1, 1,
-0.1348021, 0.713813, -1.014616, 1, 1, 1, 1, 1,
-0.1306062, -0.479577, -1.796287, 1, 1, 1, 1, 1,
-0.1277288, 0.1327133, 0.1470576, 1, 1, 1, 1, 1,
-0.1273548, -0.0241084, -2.601973, 1, 1, 1, 1, 1,
-0.127139, -0.1121522, -2.543301, 1, 1, 1, 1, 1,
-0.1253459, 0.7787356, -1.568921, 1, 1, 1, 1, 1,
-0.1246207, -1.041445, -4.213511, 1, 1, 1, 1, 1,
-0.1240808, 0.05409928, -0.8309824, 1, 1, 1, 1, 1,
-0.1173239, -1.139968, -3.639606, 1, 1, 1, 1, 1,
-0.1170079, 1.676707, 0.7675081, 1, 1, 1, 1, 1,
-0.116563, 0.4788965, 0.2521871, 1, 1, 1, 1, 1,
-0.1065824, 1.335266, -0.3359669, 0, 0, 1, 1, 1,
-0.1040973, -0.4462173, -3.495196, 1, 0, 0, 1, 1,
-0.1039601, 0.4152717, 0.1674205, 1, 0, 0, 1, 1,
-0.1020258, -0.2271162, -2.554747, 1, 0, 0, 1, 1,
-0.1002706, -0.2370035, -1.864794, 1, 0, 0, 1, 1,
-0.1001666, -0.1175792, -3.437549, 1, 0, 0, 1, 1,
-0.09554436, 0.4583702, 0.4571104, 0, 0, 0, 1, 1,
-0.09447186, 0.0924588, -1.923068, 0, 0, 0, 1, 1,
-0.09383706, -0.2777591, -1.829157, 0, 0, 0, 1, 1,
-0.09372637, -1.920823, -3.192702, 0, 0, 0, 1, 1,
-0.09135476, -0.5971308, -2.757979, 0, 0, 0, 1, 1,
-0.0904506, -0.3500902, -1.977804, 0, 0, 0, 1, 1,
-0.08384208, -0.529802, -4.239508, 0, 0, 0, 1, 1,
-0.07225002, 1.038536, -0.5523044, 1, 1, 1, 1, 1,
-0.0702856, 0.2195054, 0.2210698, 1, 1, 1, 1, 1,
-0.06953403, 0.7707508, -0.8527637, 1, 1, 1, 1, 1,
-0.0667345, 0.1400175, 0.844014, 1, 1, 1, 1, 1,
-0.06646672, 0.2669519, 0.6690073, 1, 1, 1, 1, 1,
-0.06138144, 0.2801166, -1.457395, 1, 1, 1, 1, 1,
-0.05876233, 0.178408, 1.336586, 1, 1, 1, 1, 1,
-0.05503986, -0.6850464, -3.44363, 1, 1, 1, 1, 1,
-0.05350122, -0.3805152, -4.279672, 1, 1, 1, 1, 1,
-0.05237654, -0.5700281, -4.385119, 1, 1, 1, 1, 1,
-0.05137097, 0.05045266, -0.5262439, 1, 1, 1, 1, 1,
-0.05123847, 0.1696568, -0.8320541, 1, 1, 1, 1, 1,
-0.04519878, -2.225915, -2.855465, 1, 1, 1, 1, 1,
-0.04453223, -0.3268064, -3.389184, 1, 1, 1, 1, 1,
-0.04446943, 0.6653813, 0.03956354, 1, 1, 1, 1, 1,
-0.04242595, 0.2118022, 0.4639806, 0, 0, 1, 1, 1,
-0.03506323, -1.03095, -2.42698, 1, 0, 0, 1, 1,
-0.03355077, -0.9689484, -4.044609, 1, 0, 0, 1, 1,
-0.03343926, 1.771147, -1.023674, 1, 0, 0, 1, 1,
-0.03268636, 1.179497, -0.7811688, 1, 0, 0, 1, 1,
-0.02922572, -0.05677121, -0.3924424, 1, 0, 0, 1, 1,
-0.0277511, -0.381108, -3.249311, 0, 0, 0, 1, 1,
-0.02666376, -0.756879, -3.958941, 0, 0, 0, 1, 1,
-0.0254503, -1.430662, -3.735661, 0, 0, 0, 1, 1,
-0.0205922, -0.7077547, -2.818825, 0, 0, 0, 1, 1,
-0.01972207, -0.02502704, -2.377022, 0, 0, 0, 1, 1,
-0.01830774, 0.9579371, 1.382413, 0, 0, 0, 1, 1,
-0.01723381, -1.265107, -2.324112, 0, 0, 0, 1, 1,
-0.01567381, -0.1947048, -3.794436, 1, 1, 1, 1, 1,
-0.009144126, -1.238424, -2.862234, 1, 1, 1, 1, 1,
-0.007035822, 0.8797672, 0.6894098, 1, 1, 1, 1, 1,
0.001315743, 1.256658, -0.3248492, 1, 1, 1, 1, 1,
0.007460596, 0.5581549, -0.4512815, 1, 1, 1, 1, 1,
0.007696621, 0.1316596, 1.15988, 1, 1, 1, 1, 1,
0.01240015, -1.277754, 3.479897, 1, 1, 1, 1, 1,
0.01374729, 0.6583571, 0.8626767, 1, 1, 1, 1, 1,
0.01637859, 0.9134595, 0.2350461, 1, 1, 1, 1, 1,
0.02065123, -1.956807, 3.710012, 1, 1, 1, 1, 1,
0.02070479, -0.4859353, 3.06638, 1, 1, 1, 1, 1,
0.02407975, -0.2067971, 2.567623, 1, 1, 1, 1, 1,
0.02696835, -1.743867, 2.947459, 1, 1, 1, 1, 1,
0.02706, 0.1272283, -0.04950499, 1, 1, 1, 1, 1,
0.02869099, -0.5999123, 2.346062, 1, 1, 1, 1, 1,
0.03128463, -1.156071, 2.431697, 0, 0, 1, 1, 1,
0.03172337, -1.184723, 3.479605, 1, 0, 0, 1, 1,
0.03246983, -1.175334, 2.127306, 1, 0, 0, 1, 1,
0.0357734, 0.7338676, -1.876328, 1, 0, 0, 1, 1,
0.03803943, 0.5409884, -0.1389958, 1, 0, 0, 1, 1,
0.03837562, -2.362111, 3.298047, 1, 0, 0, 1, 1,
0.03849551, 0.0542658, 0.156448, 0, 0, 0, 1, 1,
0.04044187, -0.6169012, 2.440462, 0, 0, 0, 1, 1,
0.0417942, -0.5933113, 5.040664, 0, 0, 0, 1, 1,
0.04259619, -0.483097, 3.928159, 0, 0, 0, 1, 1,
0.04279081, 0.7192222, 1.425993, 0, 0, 0, 1, 1,
0.04500433, 0.3624622, 0.3533149, 0, 0, 0, 1, 1,
0.04709206, 0.9942812, 1.05912, 0, 0, 0, 1, 1,
0.0509717, 0.646058, -0.04484594, 1, 1, 1, 1, 1,
0.05266266, 0.02219379, -0.2365668, 1, 1, 1, 1, 1,
0.05392101, 0.5993162, 0.5387933, 1, 1, 1, 1, 1,
0.05523001, 0.07350658, 2.190632, 1, 1, 1, 1, 1,
0.05634815, -1.35079, 2.774293, 1, 1, 1, 1, 1,
0.06210295, 0.683825, -0.4430623, 1, 1, 1, 1, 1,
0.06214764, -0.1598891, 1.10714, 1, 1, 1, 1, 1,
0.06228659, -0.2327979, 1.325555, 1, 1, 1, 1, 1,
0.0630454, -0.6817281, 3.386588, 1, 1, 1, 1, 1,
0.06321096, -1.415895, 3.10291, 1, 1, 1, 1, 1,
0.06361829, -1.347085, 3.863594, 1, 1, 1, 1, 1,
0.06776527, 1.375123, -1.162317, 1, 1, 1, 1, 1,
0.07096814, 2.486264, -1.04405, 1, 1, 1, 1, 1,
0.07132354, -0.4080768, 2.628817, 1, 1, 1, 1, 1,
0.07166837, -0.03426316, 0.4687776, 1, 1, 1, 1, 1,
0.07567085, -0.5672625, 4.406557, 0, 0, 1, 1, 1,
0.07929429, -0.2124519, 2.692104, 1, 0, 0, 1, 1,
0.08016891, -0.03399217, 0.9600841, 1, 0, 0, 1, 1,
0.08118647, 0.168631, -0.07461028, 1, 0, 0, 1, 1,
0.08397766, 0.7316786, -1.77914, 1, 0, 0, 1, 1,
0.08617485, -0.1253358, 2.869356, 1, 0, 0, 1, 1,
0.09307536, -1.928403, 2.679907, 0, 0, 0, 1, 1,
0.09309109, 0.4225947, -0.7108546, 0, 0, 0, 1, 1,
0.09473243, -0.9215683, 2.686114, 0, 0, 0, 1, 1,
0.09566252, -0.1287849, 3.742941, 0, 0, 0, 1, 1,
0.09824321, 1.428058, -0.6657161, 0, 0, 0, 1, 1,
0.100631, -0.1013685, 0.9759292, 0, 0, 0, 1, 1,
0.1026954, 0.4335619, -0.8382984, 0, 0, 0, 1, 1,
0.1039891, 0.03612248, 0.6105841, 1, 1, 1, 1, 1,
0.1074526, -0.5161808, 2.390971, 1, 1, 1, 1, 1,
0.1082939, 0.2908231, 0.7192442, 1, 1, 1, 1, 1,
0.1085864, 0.9775349, -0.539524, 1, 1, 1, 1, 1,
0.1094416, -0.2624805, 2.222414, 1, 1, 1, 1, 1,
0.1110143, -0.009816804, 1.50105, 1, 1, 1, 1, 1,
0.1117794, 0.3483542, 0.09504389, 1, 1, 1, 1, 1,
0.116622, 1.600155, 0.00309546, 1, 1, 1, 1, 1,
0.1223752, -2.412721, 2.760993, 1, 1, 1, 1, 1,
0.122425, 0.3386953, -1.211078, 1, 1, 1, 1, 1,
0.1239593, -1.092091, 0.9716634, 1, 1, 1, 1, 1,
0.1282237, -0.9693477, 3.342982, 1, 1, 1, 1, 1,
0.1289733, -0.6586448, 1.92247, 1, 1, 1, 1, 1,
0.1354793, 0.1120079, -0.1362777, 1, 1, 1, 1, 1,
0.1364066, 0.9530638, 0.05411154, 1, 1, 1, 1, 1,
0.1373815, 0.2751843, 3.166517, 0, 0, 1, 1, 1,
0.1400341, 1.345724, 2.84543, 1, 0, 0, 1, 1,
0.1408702, 0.5809188, 0.08257181, 1, 0, 0, 1, 1,
0.1460296, -1.994443, 2.767784, 1, 0, 0, 1, 1,
0.1488825, -0.7614987, 2.741767, 1, 0, 0, 1, 1,
0.1507632, 0.4419545, 0.1340611, 1, 0, 0, 1, 1,
0.1511559, -1.024326, 2.522323, 0, 0, 0, 1, 1,
0.1591153, 1.361908, 0.2155925, 0, 0, 0, 1, 1,
0.1621675, 2.250454, -1.005283, 0, 0, 0, 1, 1,
0.1626008, 0.5941947, 1.048983, 0, 0, 0, 1, 1,
0.1636972, 1.212708, -0.7959872, 0, 0, 0, 1, 1,
0.1649313, 0.1219964, 1.201232, 0, 0, 0, 1, 1,
0.1686365, 0.5120809, 0.9983277, 0, 0, 0, 1, 1,
0.1709085, -0.1591295, 1.967666, 1, 1, 1, 1, 1,
0.171521, -1.059207, 4.381862, 1, 1, 1, 1, 1,
0.173835, 0.2379682, 1.543937, 1, 1, 1, 1, 1,
0.1741581, 1.798495, 0.8984333, 1, 1, 1, 1, 1,
0.17815, -1.250826, 4.302327, 1, 1, 1, 1, 1,
0.1796571, -0.4187068, 3.150172, 1, 1, 1, 1, 1,
0.1838482, 2.412081, -0.570246, 1, 1, 1, 1, 1,
0.1841684, -0.6716534, 2.992622, 1, 1, 1, 1, 1,
0.1937718, -1.055966, 4.52527, 1, 1, 1, 1, 1,
0.1954454, 0.4398259, 0.3413836, 1, 1, 1, 1, 1,
0.1972556, 0.3150525, -0.8120626, 1, 1, 1, 1, 1,
0.1974998, 1.831815, 1.568694, 1, 1, 1, 1, 1,
0.1976281, 2.110512, 1.441848, 1, 1, 1, 1, 1,
0.202858, -0.6737185, 2.44337, 1, 1, 1, 1, 1,
0.2093654, -0.1964331, 3.268332, 1, 1, 1, 1, 1,
0.2195868, -0.614851, 1.455461, 0, 0, 1, 1, 1,
0.2216292, -0.55296, 2.986102, 1, 0, 0, 1, 1,
0.2252609, -0.5541121, 0.867, 1, 0, 0, 1, 1,
0.2254716, -0.5923855, 3.517044, 1, 0, 0, 1, 1,
0.2267949, -1.085642, 1.929528, 1, 0, 0, 1, 1,
0.2292105, 1.947605, 2.067299, 1, 0, 0, 1, 1,
0.2315255, 0.3743941, 0.1548378, 0, 0, 0, 1, 1,
0.2320886, -0.2514793, 2.115156, 0, 0, 0, 1, 1,
0.2352469, 0.3132362, 0.1022257, 0, 0, 0, 1, 1,
0.2382448, 0.2911253, 2.509842, 0, 0, 0, 1, 1,
0.2396452, 0.9822279, -0.6356258, 0, 0, 0, 1, 1,
0.240302, -2.04644, 2.64147, 0, 0, 0, 1, 1,
0.2416439, -0.2906028, 2.027751, 0, 0, 0, 1, 1,
0.2459905, -0.414658, 2.111504, 1, 1, 1, 1, 1,
0.2473139, 0.8556074, 0.2320099, 1, 1, 1, 1, 1,
0.2477485, 0.5353611, -0.4015306, 1, 1, 1, 1, 1,
0.2478783, -0.4688483, 4.118246, 1, 1, 1, 1, 1,
0.2492142, 0.5939585, 1.13124, 1, 1, 1, 1, 1,
0.2507111, -0.1381746, 1.581572, 1, 1, 1, 1, 1,
0.2519284, 0.5871896, 1.114592, 1, 1, 1, 1, 1,
0.2533373, 0.4797613, -0.4863315, 1, 1, 1, 1, 1,
0.2567548, 0.2931949, 1.08455, 1, 1, 1, 1, 1,
0.2603281, 1.317586, -0.7816192, 1, 1, 1, 1, 1,
0.2619157, 2.06201, -0.348867, 1, 1, 1, 1, 1,
0.264545, -1.402221, 1.424126, 1, 1, 1, 1, 1,
0.2662376, -0.4275655, 2.232201, 1, 1, 1, 1, 1,
0.2680466, 2.188633, -0.4661988, 1, 1, 1, 1, 1,
0.2696588, -2.027355, 3.830559, 1, 1, 1, 1, 1,
0.2729977, 0.6865353, 0.7510626, 0, 0, 1, 1, 1,
0.2758046, -2.241197, 5.26143, 1, 0, 0, 1, 1,
0.2812651, 0.4082432, 1.283211, 1, 0, 0, 1, 1,
0.2834177, 0.1120816, 2.61834, 1, 0, 0, 1, 1,
0.2876011, -0.3739064, 3.064141, 1, 0, 0, 1, 1,
0.2914026, -1.484253, 4.917525, 1, 0, 0, 1, 1,
0.2917916, 0.3211581, 1.923232, 0, 0, 0, 1, 1,
0.3014391, -0.2639272, 3.240182, 0, 0, 0, 1, 1,
0.3029851, -0.2443825, 2.29289, 0, 0, 0, 1, 1,
0.3130275, -0.5122235, 2.585098, 0, 0, 0, 1, 1,
0.3135551, -0.6501654, 3.422275, 0, 0, 0, 1, 1,
0.3154719, -0.5062624, 2.724169, 0, 0, 0, 1, 1,
0.3192084, -0.4255586, 3.00522, 0, 0, 0, 1, 1,
0.3232907, -0.5912307, 1.993223, 1, 1, 1, 1, 1,
0.3260749, -0.5107512, 2.906186, 1, 1, 1, 1, 1,
0.3278088, 0.100646, -0.5430151, 1, 1, 1, 1, 1,
0.327861, -0.02310429, 2.673371, 1, 1, 1, 1, 1,
0.3292518, -1.08466, 3.546784, 1, 1, 1, 1, 1,
0.3306247, 0.2238521, 3.219708, 1, 1, 1, 1, 1,
0.3307194, 0.750631, 1.449579, 1, 1, 1, 1, 1,
0.3348927, -0.09920953, 2.357966, 1, 1, 1, 1, 1,
0.3360478, 0.6054676, 0.6716483, 1, 1, 1, 1, 1,
0.3420677, 0.8922644, 0.3052775, 1, 1, 1, 1, 1,
0.3499173, 0.2343048, 1.382362, 1, 1, 1, 1, 1,
0.3528727, 0.6345174, 0.7565484, 1, 1, 1, 1, 1,
0.3553589, 1.555303, 0.2027171, 1, 1, 1, 1, 1,
0.3555577, 1.061855, 0.8411955, 1, 1, 1, 1, 1,
0.3589549, -0.5369825, 1.437684, 1, 1, 1, 1, 1,
0.3590858, 0.1968009, 0.4780654, 0, 0, 1, 1, 1,
0.3597656, 0.6222453, -1.583191, 1, 0, 0, 1, 1,
0.3602138, -1.837773, 2.397566, 1, 0, 0, 1, 1,
0.3630844, -0.1573944, 1.54815, 1, 0, 0, 1, 1,
0.3640932, 0.6209074, 0.04098875, 1, 0, 0, 1, 1,
0.3650858, 1.098163, -0.05241955, 1, 0, 0, 1, 1,
0.3667049, 0.5593655, 0.8725353, 0, 0, 0, 1, 1,
0.3698961, -0.5682989, 2.06143, 0, 0, 0, 1, 1,
0.3717822, 1.724781, -1.752593, 0, 0, 0, 1, 1,
0.3718675, -0.156746, 1.724306, 0, 0, 0, 1, 1,
0.3751835, 2.024146, 1.231741, 0, 0, 0, 1, 1,
0.3759869, -1.156358, 2.600044, 0, 0, 0, 1, 1,
0.3778856, 0.3244723, 2.062099, 0, 0, 0, 1, 1,
0.3782838, 1.11554, -0.215517, 1, 1, 1, 1, 1,
0.3790082, -0.07625302, 1.873951, 1, 1, 1, 1, 1,
0.383117, -0.7474086, 2.237426, 1, 1, 1, 1, 1,
0.3912989, 1.043627, -0.1013653, 1, 1, 1, 1, 1,
0.3946712, -0.9712787, 2.514553, 1, 1, 1, 1, 1,
0.3950452, -1.03268, 4.202474, 1, 1, 1, 1, 1,
0.3960191, 1.243535, 1.834806, 1, 1, 1, 1, 1,
0.3983589, -0.2789715, 3.08748, 1, 1, 1, 1, 1,
0.4000703, -0.7247235, 1.782467, 1, 1, 1, 1, 1,
0.4008118, -1.350278, 1.89496, 1, 1, 1, 1, 1,
0.4039319, -0.2226981, 3.345887, 1, 1, 1, 1, 1,
0.4055741, -2.052858, 2.299857, 1, 1, 1, 1, 1,
0.4064636, 1.371267, -0.2634034, 1, 1, 1, 1, 1,
0.4152053, -1.04179, 2.961482, 1, 1, 1, 1, 1,
0.4164967, -0.6203829, 1.70911, 1, 1, 1, 1, 1,
0.4172265, -1.35133, 3.154214, 0, 0, 1, 1, 1,
0.42022, 1.993333, 0.815521, 1, 0, 0, 1, 1,
0.4247369, -0.2783752, 2.652797, 1, 0, 0, 1, 1,
0.4269827, -0.05058972, 0.617512, 1, 0, 0, 1, 1,
0.4428798, -0.7335915, 3.375669, 1, 0, 0, 1, 1,
0.4449894, -0.9405506, 3.76763, 1, 0, 0, 1, 1,
0.453051, 0.2105085, 0.3074177, 0, 0, 0, 1, 1,
0.4547704, -0.260249, 1.313472, 0, 0, 0, 1, 1,
0.4645361, 0.9837074, 0.7834538, 0, 0, 0, 1, 1,
0.4648512, -1.883647, 3.561296, 0, 0, 0, 1, 1,
0.4667751, 0.472496, 1.499481, 0, 0, 0, 1, 1,
0.4753623, -0.2539986, 2.020041, 0, 0, 0, 1, 1,
0.4840335, -1.115619, 3.364153, 0, 0, 0, 1, 1,
0.4882258, -1.398138, 3.093198, 1, 1, 1, 1, 1,
0.5075561, -0.3241993, 2.726578, 1, 1, 1, 1, 1,
0.5080951, -0.4924276, 1.516834, 1, 1, 1, 1, 1,
0.5097993, 1.941633, 2.531023, 1, 1, 1, 1, 1,
0.5228137, 0.127454, 2.283136, 1, 1, 1, 1, 1,
0.53652, -0.2248382, 2.07863, 1, 1, 1, 1, 1,
0.5390046, 1.573689, 0.9855895, 1, 1, 1, 1, 1,
0.5407294, 2.322823, -1.374985, 1, 1, 1, 1, 1,
0.5418169, -0.7556913, 0.5179374, 1, 1, 1, 1, 1,
0.5434643, -0.1132903, 2.752675, 1, 1, 1, 1, 1,
0.5459352, 2.880092, -0.8010687, 1, 1, 1, 1, 1,
0.5481867, 1.168642, 0.5879903, 1, 1, 1, 1, 1,
0.551037, 0.5624903, 0.8495889, 1, 1, 1, 1, 1,
0.5510595, 0.03222127, 0.5887742, 1, 1, 1, 1, 1,
0.5523503, 1.140743, 1.277751, 1, 1, 1, 1, 1,
0.552815, 0.464616, 1.18859, 0, 0, 1, 1, 1,
0.5545855, 0.6910029, -0.801387, 1, 0, 0, 1, 1,
0.5604445, 1.807794, 0.8994094, 1, 0, 0, 1, 1,
0.5660486, -0.714012, 2.371202, 1, 0, 0, 1, 1,
0.5680282, -0.02363393, 0.937331, 1, 0, 0, 1, 1,
0.5693878, 0.1175364, 0.9345013, 1, 0, 0, 1, 1,
0.575198, 1.858603, -0.3579648, 0, 0, 0, 1, 1,
0.5778681, -0.731668, 1.609939, 0, 0, 0, 1, 1,
0.5811182, -0.09480099, 0.5706989, 0, 0, 0, 1, 1,
0.5814573, 0.7968187, 0.4344639, 0, 0, 0, 1, 1,
0.5859461, -0.4870879, 2.778732, 0, 0, 0, 1, 1,
0.587961, 0.07585912, -0.2156348, 0, 0, 0, 1, 1,
0.5891166, 0.1418391, 0.3482223, 0, 0, 0, 1, 1,
0.5975239, -0.2659339, 0.6313508, 1, 1, 1, 1, 1,
0.5980448, 0.7157016, 1.215268, 1, 1, 1, 1, 1,
0.6033649, 0.3477329, 0.6460044, 1, 1, 1, 1, 1,
0.6099753, 0.485603, 2.478818, 1, 1, 1, 1, 1,
0.6110324, -1.910869, 1.666537, 1, 1, 1, 1, 1,
0.6148395, -0.3462069, 1.307039, 1, 1, 1, 1, 1,
0.6156924, 0.3872269, 0.03713683, 1, 1, 1, 1, 1,
0.6175689, -1.178673, 4.025964, 1, 1, 1, 1, 1,
0.6204517, -0.6921957, 2.775054, 1, 1, 1, 1, 1,
0.6211891, -0.4898324, 1.88828, 1, 1, 1, 1, 1,
0.6222784, -1.816066, 1.32682, 1, 1, 1, 1, 1,
0.6225873, 1.120958, 2.73122, 1, 1, 1, 1, 1,
0.6232664, 0.4069134, 0.5759627, 1, 1, 1, 1, 1,
0.6259537, -0.931879, 1.579863, 1, 1, 1, 1, 1,
0.6361144, 0.06509168, 1.873414, 1, 1, 1, 1, 1,
0.6386598, 1.549013, -1.381432, 0, 0, 1, 1, 1,
0.6401539, -1.560593, 2.069765, 1, 0, 0, 1, 1,
0.6413047, 0.9371538, 0.8244703, 1, 0, 0, 1, 1,
0.6435896, 0.8670447, 0.2834176, 1, 0, 0, 1, 1,
0.649755, 0.1152564, -0.3964958, 1, 0, 0, 1, 1,
0.6502289, 0.1789629, 0.2668777, 1, 0, 0, 1, 1,
0.6512856, -2.058486, 4.262472, 0, 0, 0, 1, 1,
0.6593561, 0.001372779, 2.352834, 0, 0, 0, 1, 1,
0.6606258, 1.376594, 1.178272, 0, 0, 0, 1, 1,
0.6615778, -0.9524466, 1.750099, 0, 0, 0, 1, 1,
0.6644847, -0.8292802, 2.819055, 0, 0, 0, 1, 1,
0.6684678, -0.407863, 2.628237, 0, 0, 0, 1, 1,
0.6691715, -0.04235023, 1.971039, 0, 0, 0, 1, 1,
0.6703698, 0.3167789, -0.4327426, 1, 1, 1, 1, 1,
0.6709967, -0.5710411, 2.068338, 1, 1, 1, 1, 1,
0.6723891, 0.1058847, 2.70808, 1, 1, 1, 1, 1,
0.6776451, 0.02331454, 0.521089, 1, 1, 1, 1, 1,
0.686949, 1.013158, -0.4880266, 1, 1, 1, 1, 1,
0.6934435, -0.9354814, 2.470777, 1, 1, 1, 1, 1,
0.6964743, 0.852142, 2.165718, 1, 1, 1, 1, 1,
0.6969613, 1.690086, -0.1769039, 1, 1, 1, 1, 1,
0.7007989, 0.5731452, 0.9300683, 1, 1, 1, 1, 1,
0.7032021, -0.5818853, 2.411, 1, 1, 1, 1, 1,
0.705906, -0.4380366, 0.3024868, 1, 1, 1, 1, 1,
0.7078791, -0.8849907, 3.257693, 1, 1, 1, 1, 1,
0.7102913, 0.3454701, 0.2851936, 1, 1, 1, 1, 1,
0.7147514, 1.160971, -0.3558906, 1, 1, 1, 1, 1,
0.716763, 0.3376029, -0.08546345, 1, 1, 1, 1, 1,
0.7193292, -1.116242, 3.379599, 0, 0, 1, 1, 1,
0.7216615, -0.7125463, 1.931329, 1, 0, 0, 1, 1,
0.7220691, -0.06656212, 0.6859971, 1, 0, 0, 1, 1,
0.7239516, -0.6218623, 0.1461073, 1, 0, 0, 1, 1,
0.7248266, 0.005059015, 0.3047846, 1, 0, 0, 1, 1,
0.7308066, 0.2280394, 0.3996845, 1, 0, 0, 1, 1,
0.7368941, -0.7865487, 4.172727, 0, 0, 0, 1, 1,
0.7390934, -1.054737, 2.034923, 0, 0, 0, 1, 1,
0.7516533, 0.8177443, 0.003605481, 0, 0, 0, 1, 1,
0.7518587, -0.6485795, 3.42211, 0, 0, 0, 1, 1,
0.7524004, 0.07337372, 1.01212, 0, 0, 0, 1, 1,
0.7552758, -0.380778, 0.5439913, 0, 0, 0, 1, 1,
0.7561651, -0.2483647, 3.468328, 0, 0, 0, 1, 1,
0.7568069, 0.805183, 0.09538775, 1, 1, 1, 1, 1,
0.7734203, -0.6170147, 3.475919, 1, 1, 1, 1, 1,
0.7780731, -0.173321, 3.919052, 1, 1, 1, 1, 1,
0.783385, 2.226342, 1.905124, 1, 1, 1, 1, 1,
0.7896454, -0.7334491, 1.45043, 1, 1, 1, 1, 1,
0.792759, 0.05062284, 1.9812, 1, 1, 1, 1, 1,
0.8029681, 0.2529193, 0.4889487, 1, 1, 1, 1, 1,
0.8053759, -0.08358921, 3.285568, 1, 1, 1, 1, 1,
0.8096988, -0.9703075, 3.057069, 1, 1, 1, 1, 1,
0.8173886, 0.7571656, 0.9878593, 1, 1, 1, 1, 1,
0.8224304, -1.131334, 3.666614, 1, 1, 1, 1, 1,
0.8250423, -0.2302631, 2.904194, 1, 1, 1, 1, 1,
0.8284987, 1.015564, 0.8049321, 1, 1, 1, 1, 1,
0.83075, 1.592403, 0.4014494, 1, 1, 1, 1, 1,
0.8324382, -1.138373, 0.921555, 1, 1, 1, 1, 1,
0.8325178, 0.6353241, 3.102043, 0, 0, 1, 1, 1,
0.8334718, 0.2110284, 1.358217, 1, 0, 0, 1, 1,
0.838927, 1.180792, 0.2561355, 1, 0, 0, 1, 1,
0.8397279, -0.7695017, 2.935125, 1, 0, 0, 1, 1,
0.84074, -0.9666118, 3.366557, 1, 0, 0, 1, 1,
0.845754, 0.09630541, 0.6794884, 1, 0, 0, 1, 1,
0.8480227, -0.9381437, 3.092235, 0, 0, 0, 1, 1,
0.8510714, 0.2710937, 0.9729119, 0, 0, 0, 1, 1,
0.8621115, -0.6120088, 2.414444, 0, 0, 0, 1, 1,
0.8662527, 0.7545401, 1.516475, 0, 0, 0, 1, 1,
0.8718924, 0.7289344, 1.68759, 0, 0, 0, 1, 1,
0.8718942, 0.6183088, 0.9819326, 0, 0, 0, 1, 1,
0.874893, 0.8863207, 0.295239, 0, 0, 0, 1, 1,
0.8771375, 2.116768, 0.8911225, 1, 1, 1, 1, 1,
0.8815485, 0.07520436, 0.8138186, 1, 1, 1, 1, 1,
0.8821627, -0.3879503, 1.416435, 1, 1, 1, 1, 1,
0.8824258, 0.1256535, 1.712068, 1, 1, 1, 1, 1,
0.8835147, 0.3436284, -0.2088722, 1, 1, 1, 1, 1,
0.8903855, -1.027921, 2.993654, 1, 1, 1, 1, 1,
0.8925411, 1.111535, 1.501272, 1, 1, 1, 1, 1,
0.8975504, 0.288176, 0.5615524, 1, 1, 1, 1, 1,
0.9003227, -1.945688, 2.39063, 1, 1, 1, 1, 1,
0.9021105, -0.8494214, 3.033383, 1, 1, 1, 1, 1,
0.9026647, 0.8075226, -1.631701, 1, 1, 1, 1, 1,
0.9116516, 0.6068825, -1.122196, 1, 1, 1, 1, 1,
0.9144092, -0.6066926, 2.223912, 1, 1, 1, 1, 1,
0.9169853, 0.5695165, 0.3611549, 1, 1, 1, 1, 1,
0.9208744, 1.199018, 1.069233, 1, 1, 1, 1, 1,
0.9223507, -0.4688891, 2.138535, 0, 0, 1, 1, 1,
0.9228557, 1.182405, 0.4373679, 1, 0, 0, 1, 1,
0.9263995, -0.4637777, 1.201084, 1, 0, 0, 1, 1,
0.9340228, -1.204139, 1.639211, 1, 0, 0, 1, 1,
0.9351264, -0.6683532, 1.079565, 1, 0, 0, 1, 1,
0.9383219, -0.01770302, 1.917167, 1, 0, 0, 1, 1,
0.9384399, -1.280271, 2.87391, 0, 0, 0, 1, 1,
0.9409053, -0.4181938, 1.319652, 0, 0, 0, 1, 1,
0.9429416, -0.1228297, 1.874792, 0, 0, 0, 1, 1,
0.9437536, 1.122671, 0.7219096, 0, 0, 0, 1, 1,
0.9491837, -0.8761482, 0.7575523, 0, 0, 0, 1, 1,
0.9568028, 2.117517, -0.5120589, 0, 0, 0, 1, 1,
0.960296, 0.6332352, 1.810769, 0, 0, 0, 1, 1,
0.9626198, 1.390062, 1.253112, 1, 1, 1, 1, 1,
0.9638487, -0.6750132, 1.132108, 1, 1, 1, 1, 1,
0.9714097, 0.7360407, 0.7449433, 1, 1, 1, 1, 1,
0.9735029, -0.2339969, 3.005061, 1, 1, 1, 1, 1,
0.9755096, 0.4862323, 1.928844, 1, 1, 1, 1, 1,
0.987495, -1.221659, 2.97175, 1, 1, 1, 1, 1,
0.9938149, 1.506617, 0.4138129, 1, 1, 1, 1, 1,
0.9956511, -0.3686696, 1.715687, 1, 1, 1, 1, 1,
1.002518, 2.06364, 0.06178991, 1, 1, 1, 1, 1,
1.010429, 0.100167, 1.540663, 1, 1, 1, 1, 1,
1.013985, 0.3854762, 1.949963, 1, 1, 1, 1, 1,
1.020465, -0.4224163, 1.385519, 1, 1, 1, 1, 1,
1.021358, -0.9755016, 2.057064, 1, 1, 1, 1, 1,
1.021956, -1.754633, 2.630127, 1, 1, 1, 1, 1,
1.032921, 0.276894, 0.7037654, 1, 1, 1, 1, 1,
1.034654, 1.431797, 1.177291, 0, 0, 1, 1, 1,
1.039874, 1.691837, 2.053364, 1, 0, 0, 1, 1,
1.042522, 0.07541299, 1.490787, 1, 0, 0, 1, 1,
1.054056, -0.9108949, 0.1387048, 1, 0, 0, 1, 1,
1.056029, -0.8222538, 2.471171, 1, 0, 0, 1, 1,
1.05735, -0.4891091, 1.399139, 1, 0, 0, 1, 1,
1.057554, 1.344208, 1.029964, 0, 0, 0, 1, 1,
1.060599, -1.839363, 3.057263, 0, 0, 0, 1, 1,
1.065735, -1.50273, 1.368837, 0, 0, 0, 1, 1,
1.072843, -0.55525, 3.821573, 0, 0, 0, 1, 1,
1.079339, 0.390971, 0.8041532, 0, 0, 0, 1, 1,
1.083776, 0.4294004, 1.808316, 0, 0, 0, 1, 1,
1.097969, -0.9560841, 1.051208, 0, 0, 0, 1, 1,
1.102103, -1.023523, 1.499695, 1, 1, 1, 1, 1,
1.110597, 0.2388823, 0.862885, 1, 1, 1, 1, 1,
1.11297, 0.4735283, 3.426925, 1, 1, 1, 1, 1,
1.114, -0.483675, 0.7344913, 1, 1, 1, 1, 1,
1.116284, 1.626001, 0.1075104, 1, 1, 1, 1, 1,
1.121434, -0.3283403, 1.810868, 1, 1, 1, 1, 1,
1.121572, 0.4646744, 2.028953, 1, 1, 1, 1, 1,
1.129318, -0.9417986, 2.51818, 1, 1, 1, 1, 1,
1.129983, 1.859079, 0.5021375, 1, 1, 1, 1, 1,
1.137362, -0.9174992, 1.094428, 1, 1, 1, 1, 1,
1.144001, -0.2931483, 1.807187, 1, 1, 1, 1, 1,
1.145481, 0.26954, -0.2529208, 1, 1, 1, 1, 1,
1.149955, -2.171502, 1.187385, 1, 1, 1, 1, 1,
1.152906, 0.1288643, 0.9325789, 1, 1, 1, 1, 1,
1.153841, 0.3152803, -0.2781501, 1, 1, 1, 1, 1,
1.165417, 2.060194, 0.567423, 0, 0, 1, 1, 1,
1.175994, 0.5597435, 0.1988555, 1, 0, 0, 1, 1,
1.183446, 1.00498, 0.008600418, 1, 0, 0, 1, 1,
1.185127, -0.5454525, 1.304291, 1, 0, 0, 1, 1,
1.186401, -0.8335901, 4.222546, 1, 0, 0, 1, 1,
1.187112, 0.6001949, -0.1796833, 1, 0, 0, 1, 1,
1.18941, -1.517914, 3.365765, 0, 0, 0, 1, 1,
1.190087, -1.413187, 5.457412, 0, 0, 0, 1, 1,
1.191958, 0.1421872, 0.8237211, 0, 0, 0, 1, 1,
1.194271, -0.6262103, 2.889435, 0, 0, 0, 1, 1,
1.203385, -0.3003735, 1.108103, 0, 0, 0, 1, 1,
1.210803, -0.1766115, 0.8862655, 0, 0, 0, 1, 1,
1.219045, -0.19913, 3.028773, 0, 0, 0, 1, 1,
1.219335, 1.52784, 1.156683, 1, 1, 1, 1, 1,
1.219752, -0.8558354, 3.211868, 1, 1, 1, 1, 1,
1.223042, 0.2308096, -0.1798737, 1, 1, 1, 1, 1,
1.227059, 0.9530619, -0.02252222, 1, 1, 1, 1, 1,
1.229264, -0.6845911, 3.091329, 1, 1, 1, 1, 1,
1.236902, 0.91142, 0.6019635, 1, 1, 1, 1, 1,
1.242721, -0.2110222, 2.860346, 1, 1, 1, 1, 1,
1.243901, 0.4540948, 1.766199, 1, 1, 1, 1, 1,
1.252862, 1.141927, -0.9640022, 1, 1, 1, 1, 1,
1.258943, 0.3972818, 0.4727804, 1, 1, 1, 1, 1,
1.267395, -0.009576945, -0.5599778, 1, 1, 1, 1, 1,
1.271597, -0.05060583, 0.5032715, 1, 1, 1, 1, 1,
1.287245, 0.6843912, 0.8749422, 1, 1, 1, 1, 1,
1.287972, -0.05116075, 0.8724976, 1, 1, 1, 1, 1,
1.288581, 0.3648409, 1.838355, 1, 1, 1, 1, 1,
1.291527, -1.217532, -0.5000002, 0, 0, 1, 1, 1,
1.295763, -0.9083421, 2.741305, 1, 0, 0, 1, 1,
1.297527, 0.6106345, 0.588337, 1, 0, 0, 1, 1,
1.298022, -0.1183745, 1.609419, 1, 0, 0, 1, 1,
1.299171, 0.09145509, 1.559712, 1, 0, 0, 1, 1,
1.300614, -0.87043, 1.372924, 1, 0, 0, 1, 1,
1.303377, 0.3211548, 0.9586878, 0, 0, 0, 1, 1,
1.308174, -1.423168, 2.220183, 0, 0, 0, 1, 1,
1.315352, 0.5401239, -0.5544958, 0, 0, 0, 1, 1,
1.320818, -0.0839007, 0.01822444, 0, 0, 0, 1, 1,
1.335926, 0.283518, 1.910591, 0, 0, 0, 1, 1,
1.342619, 0.6317464, 0.6870554, 0, 0, 0, 1, 1,
1.344864, -0.2571022, 1.657228, 0, 0, 0, 1, 1,
1.354789, 0.07586967, 1.353391, 1, 1, 1, 1, 1,
1.360731, 0.7414115, 1.835907, 1, 1, 1, 1, 1,
1.366483, -0.1183715, 3.530959, 1, 1, 1, 1, 1,
1.382272, 0.01747837, 1.858892, 1, 1, 1, 1, 1,
1.391791, 0.6691905, 0.8024931, 1, 1, 1, 1, 1,
1.394674, 1.150121, 2.815042, 1, 1, 1, 1, 1,
1.405888, -0.09791589, 0.9082773, 1, 1, 1, 1, 1,
1.406772, -1.251417, 3.253777, 1, 1, 1, 1, 1,
1.429999, -0.02397003, 1.706798, 1, 1, 1, 1, 1,
1.431946, -1.688523, 2.288097, 1, 1, 1, 1, 1,
1.473866, 0.4058993, 2.007875, 1, 1, 1, 1, 1,
1.475402, -0.4450424, 2.247224, 1, 1, 1, 1, 1,
1.476192, -1.194072, 2.111835, 1, 1, 1, 1, 1,
1.477704, -1.512719, 3.65739, 1, 1, 1, 1, 1,
1.490019, 0.1844797, 1.327765, 1, 1, 1, 1, 1,
1.492585, 1.50243, 1.062532, 0, 0, 1, 1, 1,
1.503955, 0.9689959, 1.699327, 1, 0, 0, 1, 1,
1.511164, 0.7680012, 1.218252, 1, 0, 0, 1, 1,
1.523787, -0.9235173, 3.202617, 1, 0, 0, 1, 1,
1.534603, -1.30022, 2.011037, 1, 0, 0, 1, 1,
1.544914, -0.617382, 2.42384, 1, 0, 0, 1, 1,
1.572049, -2.316216, 2.817394, 0, 0, 0, 1, 1,
1.581204, -1.218408, 1.301761, 0, 0, 0, 1, 1,
1.589958, -1.358796, 2.412544, 0, 0, 0, 1, 1,
1.59113, -1.618338, 2.227943, 0, 0, 0, 1, 1,
1.595158, 0.6773819, 0.6785324, 0, 0, 0, 1, 1,
1.599692, 0.9270769, 0.02622127, 0, 0, 0, 1, 1,
1.603621, 0.08883998, 1.307406, 0, 0, 0, 1, 1,
1.606302, 1.070211, 0.8451269, 1, 1, 1, 1, 1,
1.612283, 1.374178, 2.095105, 1, 1, 1, 1, 1,
1.617924, -0.8399101, 2.044628, 1, 1, 1, 1, 1,
1.633061, -0.9953022, 2.258908, 1, 1, 1, 1, 1,
1.633517, -1.190459, 3.697444, 1, 1, 1, 1, 1,
1.634532, 1.545863, 0.9200565, 1, 1, 1, 1, 1,
1.639091, -0.4098789, 3.727443, 1, 1, 1, 1, 1,
1.663434, -0.6269383, 2.777059, 1, 1, 1, 1, 1,
1.676731, 1.05815, -0.2913583, 1, 1, 1, 1, 1,
1.709208, 0.5237511, 0.6882678, 1, 1, 1, 1, 1,
1.714287, 0.1395913, 2.485104, 1, 1, 1, 1, 1,
1.723912, -0.2306135, 2.452259, 1, 1, 1, 1, 1,
1.725322, 0.8965896, 0.03766425, 1, 1, 1, 1, 1,
1.727271, -0.8149412, 3.214765, 1, 1, 1, 1, 1,
1.728322, 0.1732454, 0.7986463, 1, 1, 1, 1, 1,
1.758694, -0.3978847, 1.630902, 0, 0, 1, 1, 1,
1.760736, -0.1460713, 1.190203, 1, 0, 0, 1, 1,
1.765774, 0.05190446, 2.996835, 1, 0, 0, 1, 1,
1.772029, 0.01163294, -1.003119, 1, 0, 0, 1, 1,
1.773634, -0.3064302, 0.9206918, 1, 0, 0, 1, 1,
1.779043, 2.075335, 2.372776, 1, 0, 0, 1, 1,
1.784721, -0.1726997, 2.326427, 0, 0, 0, 1, 1,
1.791688, 0.4836015, 1.167997, 0, 0, 0, 1, 1,
1.79305, 2.948825, 0.5812943, 0, 0, 0, 1, 1,
1.820671, -0.3921002, 2.454471, 0, 0, 0, 1, 1,
1.844653, -0.6746351, 2.448135, 0, 0, 0, 1, 1,
1.864683, -1.495145, 0.1916517, 0, 0, 0, 1, 1,
1.868455, -1.625061, 2.371605, 0, 0, 0, 1, 1,
1.872447, -1.554006, 1.357401, 1, 1, 1, 1, 1,
1.879649, 0.3515323, 0.9281952, 1, 1, 1, 1, 1,
1.932637, -0.3830488, 1.72969, 1, 1, 1, 1, 1,
1.933091, -0.1082338, 1.624846, 1, 1, 1, 1, 1,
1.962479, -0.4139908, 3.543208, 1, 1, 1, 1, 1,
1.966924, 0.1598464, 1.719999, 1, 1, 1, 1, 1,
1.98723, -1.203939, 0.4934385, 1, 1, 1, 1, 1,
2.021951, -1.297518, 3.086287, 1, 1, 1, 1, 1,
2.046667, -0.526359, 1.755506, 1, 1, 1, 1, 1,
2.0682, -1.272391, 2.372355, 1, 1, 1, 1, 1,
2.113142, -0.89151, 3.000547, 1, 1, 1, 1, 1,
2.118927, 0.02829202, 1.351155, 1, 1, 1, 1, 1,
2.132848, -0.5347033, 1.173342, 1, 1, 1, 1, 1,
2.142979, -0.8005333, 2.206989, 1, 1, 1, 1, 1,
2.146196, -1.08848, 3.651273, 1, 1, 1, 1, 1,
2.197607, -0.3119168, 2.036263, 0, 0, 1, 1, 1,
2.216946, -0.242784, 1.183341, 1, 0, 0, 1, 1,
2.251113, -0.3051448, 1.622293, 1, 0, 0, 1, 1,
2.255056, -1.459849, 2.657379, 1, 0, 0, 1, 1,
2.314055, 0.8265125, 1.385004, 1, 0, 0, 1, 1,
2.320253, 0.4167615, 0.202894, 1, 0, 0, 1, 1,
2.430693, 1.027262, 2.321362, 0, 0, 0, 1, 1,
2.432506, -0.4948981, 2.570867, 0, 0, 0, 1, 1,
2.437336, -1.387544, 0.7808152, 0, 0, 0, 1, 1,
2.451082, -0.02080251, 1.325937, 0, 0, 0, 1, 1,
2.5043, -1.09476, 1.736694, 0, 0, 0, 1, 1,
2.517183, -1.017445, 1.94189, 0, 0, 0, 1, 1,
2.52123, -0.1366995, 0.9831355, 0, 0, 0, 1, 1,
2.553871, 0.6648865, 1.124036, 1, 1, 1, 1, 1,
2.616243, -0.938099, 3.942815, 1, 1, 1, 1, 1,
2.704225, -0.8452632, 2.205382, 1, 1, 1, 1, 1,
2.724815, 1.561552, 1.230928, 1, 1, 1, 1, 1,
2.726808, 0.7671887, 3.268164, 1, 1, 1, 1, 1,
2.828381, -0.07770707, 1.685705, 1, 1, 1, 1, 1,
2.877965, -0.0209277, 0.9721108, 1, 1, 1, 1, 1
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
var radius = 9.239943;
var distance = 32.45491;
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
mvMatrix.translate( 0.0003834963, -0.2552514, -0.1564531 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.45491);
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
