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
-3.144858, 1.521819, -1.41449, 1, 0, 0, 1,
-2.87793, -0.3754012, -0.8897645, 1, 0.007843138, 0, 1,
-2.840907, -2.660652, -3.135887, 1, 0.01176471, 0, 1,
-2.619148, 0.4229896, -0.8410537, 1, 0.01960784, 0, 1,
-2.549079, 0.4675046, -1.248742, 1, 0.02352941, 0, 1,
-2.535566, 0.06525024, -2.113999, 1, 0.03137255, 0, 1,
-2.497772, -0.5448799, -0.9899126, 1, 0.03529412, 0, 1,
-2.482068, 1.155692, -0.7426879, 1, 0.04313726, 0, 1,
-2.458483, -0.5707353, -1.467874, 1, 0.04705882, 0, 1,
-2.444327, 0.3073961, -2.020756, 1, 0.05490196, 0, 1,
-2.386842, -0.5476435, -0.8040758, 1, 0.05882353, 0, 1,
-2.322329, -0.4336304, -1.06306, 1, 0.06666667, 0, 1,
-2.308947, -1.905295, -3.938923, 1, 0.07058824, 0, 1,
-2.299597, -1.280894, -1.962088, 1, 0.07843138, 0, 1,
-2.265236, 1.546394, -1.329082, 1, 0.08235294, 0, 1,
-2.253921, 0.4680217, -1.551863, 1, 0.09019608, 0, 1,
-2.18063, 0.5832918, -2.31767, 1, 0.09411765, 0, 1,
-2.114531, 0.04698902, -1.357346, 1, 0.1019608, 0, 1,
-2.107227, 0.7897589, -0.831857, 1, 0.1098039, 0, 1,
-2.079433, 0.6288343, -0.9715072, 1, 0.1137255, 0, 1,
-2.050015, -1.073842, -2.613185, 1, 0.1215686, 0, 1,
-2.045933, -3.356634, -2.097413, 1, 0.1254902, 0, 1,
-2.004936, 1.135177, -1.875491, 1, 0.1333333, 0, 1,
-1.986867, -1.270085, -3.137296, 1, 0.1372549, 0, 1,
-1.969163, 1.048575, -2.064051, 1, 0.145098, 0, 1,
-1.946991, -1.115031, -1.37761, 1, 0.1490196, 0, 1,
-1.946348, -1.5598, -1.893391, 1, 0.1568628, 0, 1,
-1.934249, -0.3484884, -1.84245, 1, 0.1607843, 0, 1,
-1.929782, -0.2929468, -1.755332, 1, 0.1686275, 0, 1,
-1.863279, 2.293272, -1.351292, 1, 0.172549, 0, 1,
-1.785595, 0.1934853, -2.005702, 1, 0.1803922, 0, 1,
-1.770325, -0.6717207, -1.071905, 1, 0.1843137, 0, 1,
-1.750771, 0.4398412, -1.043517, 1, 0.1921569, 0, 1,
-1.74975, 1.631612, 0.3353944, 1, 0.1960784, 0, 1,
-1.744186, 0.8681245, -1.855809, 1, 0.2039216, 0, 1,
-1.734244, -0.6591473, -1.294328, 1, 0.2117647, 0, 1,
-1.727043, 0.6375383, -2.735061, 1, 0.2156863, 0, 1,
-1.722248, 0.2446684, -1.450405, 1, 0.2235294, 0, 1,
-1.71904, 0.6256765, -1.237965, 1, 0.227451, 0, 1,
-1.716597, -1.032445, -2.043464, 1, 0.2352941, 0, 1,
-1.711916, 0.5220553, -0.6995121, 1, 0.2392157, 0, 1,
-1.70808, -1.079031, -0.7682267, 1, 0.2470588, 0, 1,
-1.705239, -0.8405976, -2.234071, 1, 0.2509804, 0, 1,
-1.70403, -2.047841, -3.06202, 1, 0.2588235, 0, 1,
-1.681324, 0.4449402, -1.953876, 1, 0.2627451, 0, 1,
-1.678339, 0.4151019, -2.639418, 1, 0.2705882, 0, 1,
-1.666685, 0.1698304, -2.852941, 1, 0.2745098, 0, 1,
-1.635633, 0.1396299, -3.462948, 1, 0.282353, 0, 1,
-1.630568, -0.7291615, -2.128871, 1, 0.2862745, 0, 1,
-1.621624, 0.05161345, -1.02655, 1, 0.2941177, 0, 1,
-1.618136, 0.05856163, -1.294132, 1, 0.3019608, 0, 1,
-1.604733, 1.015668, -1.585159, 1, 0.3058824, 0, 1,
-1.587637, 0.08759524, -0.0349134, 1, 0.3137255, 0, 1,
-1.585773, -1.538825, -3.63311, 1, 0.3176471, 0, 1,
-1.579606, 0.1011033, -1.371941, 1, 0.3254902, 0, 1,
-1.563246, 0.6071222, 0.3284331, 1, 0.3294118, 0, 1,
-1.563187, 0.1959317, -1.494216, 1, 0.3372549, 0, 1,
-1.546582, -1.990295, -1.351377, 1, 0.3411765, 0, 1,
-1.546223, 0.3591788, -1.066096, 1, 0.3490196, 0, 1,
-1.542154, -0.2345687, -1.290883, 1, 0.3529412, 0, 1,
-1.505785, 1.336484, -1.334856, 1, 0.3607843, 0, 1,
-1.502287, -1.660817, -2.053897, 1, 0.3647059, 0, 1,
-1.494202, 1.2004, -2.330926, 1, 0.372549, 0, 1,
-1.487328, 0.8607831, -0.4493892, 1, 0.3764706, 0, 1,
-1.484378, 0.3731026, -3.102005, 1, 0.3843137, 0, 1,
-1.479098, -0.0873346, -2.6031, 1, 0.3882353, 0, 1,
-1.477773, 0.07782029, -1.861558, 1, 0.3960784, 0, 1,
-1.475561, 0.6354387, 0.02445057, 1, 0.4039216, 0, 1,
-1.463234, 1.420986, -2.388193, 1, 0.4078431, 0, 1,
-1.462872, 0.6506397, -2.014758, 1, 0.4156863, 0, 1,
-1.455096, -0.8269535, -2.393497, 1, 0.4196078, 0, 1,
-1.453866, 0.4930849, -0.6836818, 1, 0.427451, 0, 1,
-1.447962, -1.082084, -2.372637, 1, 0.4313726, 0, 1,
-1.445342, 0.09025766, -1.532036, 1, 0.4392157, 0, 1,
-1.426107, 1.437946, -0.1302671, 1, 0.4431373, 0, 1,
-1.423042, -1.476773, -1.661544, 1, 0.4509804, 0, 1,
-1.416938, -0.3517417, -2.629763, 1, 0.454902, 0, 1,
-1.385586, 0.368843, -2.202415, 1, 0.4627451, 0, 1,
-1.367105, 0.5601474, -0.9693254, 1, 0.4666667, 0, 1,
-1.364766, -0.4281513, -0.9006516, 1, 0.4745098, 0, 1,
-1.360263, -0.7093371, -3.769249, 1, 0.4784314, 0, 1,
-1.356918, -0.4499418, -0.8645074, 1, 0.4862745, 0, 1,
-1.351701, 0.06643343, -1.358465, 1, 0.4901961, 0, 1,
-1.340672, -0.7445591, -3.138601, 1, 0.4980392, 0, 1,
-1.33367, -0.7724851, -1.987552, 1, 0.5058824, 0, 1,
-1.329709, -0.7720421, -3.092097, 1, 0.509804, 0, 1,
-1.326955, 1.426609, 0.4991698, 1, 0.5176471, 0, 1,
-1.324298, -1.925887, -3.567117, 1, 0.5215687, 0, 1,
-1.32025, -0.8905475, -0.6900417, 1, 0.5294118, 0, 1,
-1.31946, -0.7100579, 0.1682599, 1, 0.5333334, 0, 1,
-1.315217, 0.4624145, 0.2278568, 1, 0.5411765, 0, 1,
-1.304831, 0.6451126, -0.3475685, 1, 0.5450981, 0, 1,
-1.297926, 0.1871068, -2.587755, 1, 0.5529412, 0, 1,
-1.287222, -1.075443, -2.669517, 1, 0.5568628, 0, 1,
-1.285403, 0.733341, -1.315248, 1, 0.5647059, 0, 1,
-1.273021, 1.093186, -0.3971996, 1, 0.5686275, 0, 1,
-1.271852, -0.02196688, -1.474136, 1, 0.5764706, 0, 1,
-1.248798, 0.8121822, -0.6220461, 1, 0.5803922, 0, 1,
-1.245779, 0.04545409, -1.502898, 1, 0.5882353, 0, 1,
-1.227599, -0.2975534, -2.170967, 1, 0.5921569, 0, 1,
-1.208758, 0.3739419, -2.415062, 1, 0.6, 0, 1,
-1.192613, -0.8106744, -2.948142, 1, 0.6078432, 0, 1,
-1.172708, -1.683838, -2.367796, 1, 0.6117647, 0, 1,
-1.164992, -1.606307, -4.072206, 1, 0.6196079, 0, 1,
-1.163487, 0.8305464, -1.479439, 1, 0.6235294, 0, 1,
-1.160532, 0.1942447, -0.9773486, 1, 0.6313726, 0, 1,
-1.159049, -0.6977645, -3.136314, 1, 0.6352941, 0, 1,
-1.149105, 1.264654, -2.25007, 1, 0.6431373, 0, 1,
-1.147694, -0.5604138, -3.152224, 1, 0.6470588, 0, 1,
-1.147453, -1.835618, -2.698627, 1, 0.654902, 0, 1,
-1.1404, -1.331184, -1.852422, 1, 0.6588235, 0, 1,
-1.139483, -0.8119549, -3.914247, 1, 0.6666667, 0, 1,
-1.13884, 0.5194337, -0.199969, 1, 0.6705883, 0, 1,
-1.131797, 0.8743478, -1.628119, 1, 0.6784314, 0, 1,
-1.123421, 0.09784568, -2.23607, 1, 0.682353, 0, 1,
-1.12288, 0.5345469, 1.32551, 1, 0.6901961, 0, 1,
-1.120994, 0.5463547, -0.6944221, 1, 0.6941177, 0, 1,
-1.11847, 1.236621, 0.02840916, 1, 0.7019608, 0, 1,
-1.11566, 0.3276574, -0.4383763, 1, 0.7098039, 0, 1,
-1.109509, -0.1028647, -3.20566, 1, 0.7137255, 0, 1,
-1.108631, 1.123405, -2.353133, 1, 0.7215686, 0, 1,
-1.105362, -0.7884889, -2.377141, 1, 0.7254902, 0, 1,
-1.101397, 0.5221407, -0.8383236, 1, 0.7333333, 0, 1,
-1.10132, -0.7929128, -2.661246, 1, 0.7372549, 0, 1,
-1.099364, 0.02803098, -1.645903, 1, 0.7450981, 0, 1,
-1.095775, -0.2139254, -0.5026894, 1, 0.7490196, 0, 1,
-1.094715, 0.6932762, -1.438679, 1, 0.7568628, 0, 1,
-1.08929, 1.106078, -0.6236082, 1, 0.7607843, 0, 1,
-1.087894, 0.09364647, -2.827202, 1, 0.7686275, 0, 1,
-1.087635, 1.590618, -1.953389, 1, 0.772549, 0, 1,
-1.075881, -0.434784, -3.100899, 1, 0.7803922, 0, 1,
-1.07285, 0.3559086, -0.7437016, 1, 0.7843137, 0, 1,
-1.059033, 1.347235, -1.776189, 1, 0.7921569, 0, 1,
-1.058603, 0.2103588, -1.324188, 1, 0.7960784, 0, 1,
-1.04571, -0.9744569, -3.126319, 1, 0.8039216, 0, 1,
-1.045305, -0.4033316, -2.189146, 1, 0.8117647, 0, 1,
-1.042711, 0.4876681, -1.555483, 1, 0.8156863, 0, 1,
-1.039113, 0.264941, 1.097328, 1, 0.8235294, 0, 1,
-1.028939, -0.6254852, -1.286393, 1, 0.827451, 0, 1,
-1.025934, -0.1412362, -1.192038, 1, 0.8352941, 0, 1,
-1.019462, -0.2042286, -3.042009, 1, 0.8392157, 0, 1,
-1.018564, -0.7313133, 0.6832622, 1, 0.8470588, 0, 1,
-1.017805, -1.243862, -2.505363, 1, 0.8509804, 0, 1,
-1.013129, 0.153263, -0.3106947, 1, 0.8588235, 0, 1,
-1.006669, 1.544067, -1.485058, 1, 0.8627451, 0, 1,
-1.005913, -1.465302, -2.210498, 1, 0.8705882, 0, 1,
-1.001888, -1.127587, -2.601154, 1, 0.8745098, 0, 1,
-1.001077, 0.9771358, -0.8001409, 1, 0.8823529, 0, 1,
-0.9878832, -0.9743707, -2.044532, 1, 0.8862745, 0, 1,
-0.9856569, 1.358739, -0.1173484, 1, 0.8941177, 0, 1,
-0.9847814, -0.0007898763, -0.6443981, 1, 0.8980392, 0, 1,
-0.9813673, -0.4868396, -1.939192, 1, 0.9058824, 0, 1,
-0.9796438, -0.1764427, -1.788833, 1, 0.9137255, 0, 1,
-0.9754369, 1.031299, 0.2960698, 1, 0.9176471, 0, 1,
-0.9750782, -0.488916, -0.7146721, 1, 0.9254902, 0, 1,
-0.973538, -0.1239065, -3.02989, 1, 0.9294118, 0, 1,
-0.9726571, -0.9639419, -2.687759, 1, 0.9372549, 0, 1,
-0.9641995, 2.570798, -1.104954, 1, 0.9411765, 0, 1,
-0.9633685, 2.006888, -1.416991, 1, 0.9490196, 0, 1,
-0.9599841, -0.08417394, -0.9169319, 1, 0.9529412, 0, 1,
-0.9563709, 0.9152425, -1.71528, 1, 0.9607843, 0, 1,
-0.9550288, -0.01448289, -3.252441, 1, 0.9647059, 0, 1,
-0.9510705, 0.1462813, -0.7879528, 1, 0.972549, 0, 1,
-0.950676, -0.003779837, -1.620587, 1, 0.9764706, 0, 1,
-0.9466507, -1.130787, -1.622587, 1, 0.9843137, 0, 1,
-0.9430673, -1.106346, -5.007808, 1, 0.9882353, 0, 1,
-0.9394712, -2.230381, -1.802889, 1, 0.9960784, 0, 1,
-0.936811, -1.833912, -4.306949, 0.9960784, 1, 0, 1,
-0.9339846, -1.986076, -1.298499, 0.9921569, 1, 0, 1,
-0.93035, 1.555485, -0.5749946, 0.9843137, 1, 0, 1,
-0.9303255, 0.1712278, -1.599451, 0.9803922, 1, 0, 1,
-0.9270947, -1.736157, -1.469934, 0.972549, 1, 0, 1,
-0.9256759, 0.04400742, -1.093077, 0.9686275, 1, 0, 1,
-0.9229488, -1.801956, -2.014446, 0.9607843, 1, 0, 1,
-0.9178224, 0.3110105, -1.579441, 0.9568627, 1, 0, 1,
-0.9173313, -0.04033665, -1.513587, 0.9490196, 1, 0, 1,
-0.9137604, -0.9013494, -3.146636, 0.945098, 1, 0, 1,
-0.9124174, -0.2346358, -0.8910345, 0.9372549, 1, 0, 1,
-0.9117618, -1.061072, -2.978908, 0.9333333, 1, 0, 1,
-0.9104531, -0.15036, -2.200935, 0.9254902, 1, 0, 1,
-0.9078725, 0.4089259, -2.809412, 0.9215686, 1, 0, 1,
-0.9005697, -1.026041, -2.955845, 0.9137255, 1, 0, 1,
-0.8975182, 0.5416238, -0.6390505, 0.9098039, 1, 0, 1,
-0.89575, 0.9480862, 0.540581, 0.9019608, 1, 0, 1,
-0.8942769, -1.099206, -3.256564, 0.8941177, 1, 0, 1,
-0.8941745, -2.488654, -2.623432, 0.8901961, 1, 0, 1,
-0.8921278, -0.729261, -0.9428977, 0.8823529, 1, 0, 1,
-0.8864675, -1.120149, -2.972475, 0.8784314, 1, 0, 1,
-0.8782849, 0.2402358, 1.114293, 0.8705882, 1, 0, 1,
-0.8642155, -0.2487834, -2.459135, 0.8666667, 1, 0, 1,
-0.8584089, -0.146477, -1.41673, 0.8588235, 1, 0, 1,
-0.8536242, -0.232336, -2.294669, 0.854902, 1, 0, 1,
-0.8481176, -0.1152508, -1.216739, 0.8470588, 1, 0, 1,
-0.8463498, -0.2194511, -0.5300002, 0.8431373, 1, 0, 1,
-0.8462831, 1.317849, -1.235883, 0.8352941, 1, 0, 1,
-0.842346, 0.4723711, -1.045946, 0.8313726, 1, 0, 1,
-0.8383785, 0.1980303, -1.023075, 0.8235294, 1, 0, 1,
-0.8318855, -0.3379568, -2.268716, 0.8196079, 1, 0, 1,
-0.8311162, -0.462672, -1.079202, 0.8117647, 1, 0, 1,
-0.8270037, 0.2478382, -0.6975623, 0.8078431, 1, 0, 1,
-0.8248643, 1.213635, -0.3739317, 0.8, 1, 0, 1,
-0.8244134, 0.9720491, -1.719185, 0.7921569, 1, 0, 1,
-0.8198987, 0.7042961, 0.2510321, 0.7882353, 1, 0, 1,
-0.8166962, 1.244532, -1.901136, 0.7803922, 1, 0, 1,
-0.8095174, 0.6069909, 0.4596186, 0.7764706, 1, 0, 1,
-0.8073695, -1.496669, -2.522555, 0.7686275, 1, 0, 1,
-0.8041095, -1.150927, -1.891233, 0.7647059, 1, 0, 1,
-0.7985906, 0.132054, -1.62605, 0.7568628, 1, 0, 1,
-0.7960537, 0.2911332, -1.198837, 0.7529412, 1, 0, 1,
-0.7920356, 0.4578852, -2.453332, 0.7450981, 1, 0, 1,
-0.7902499, -1.213139, -0.998984, 0.7411765, 1, 0, 1,
-0.7882447, 0.1735417, -2.716479, 0.7333333, 1, 0, 1,
-0.7789859, -0.2609133, -2.296729, 0.7294118, 1, 0, 1,
-0.7782978, 0.9324733, -1.949644, 0.7215686, 1, 0, 1,
-0.7779246, 1.849783, -0.9954029, 0.7176471, 1, 0, 1,
-0.7749543, -0.4039273, -1.504833, 0.7098039, 1, 0, 1,
-0.769433, -1.517263, -3.287752, 0.7058824, 1, 0, 1,
-0.7662878, -0.8314167, -2.516854, 0.6980392, 1, 0, 1,
-0.7646651, 0.5729308, 0.1087103, 0.6901961, 1, 0, 1,
-0.7605627, 0.09592513, -0.5882639, 0.6862745, 1, 0, 1,
-0.7551086, -0.4408673, -2.516511, 0.6784314, 1, 0, 1,
-0.7512649, 1.496271, 0.9406949, 0.6745098, 1, 0, 1,
-0.7503117, 0.2020672, -2.436196, 0.6666667, 1, 0, 1,
-0.7496766, 0.5960325, -1.212622, 0.6627451, 1, 0, 1,
-0.7408088, -2.304887, -2.514177, 0.654902, 1, 0, 1,
-0.7403507, 0.6546792, 0.06540202, 0.6509804, 1, 0, 1,
-0.7355145, -2.08634, -2.606821, 0.6431373, 1, 0, 1,
-0.7335213, 1.067114, -1.865822, 0.6392157, 1, 0, 1,
-0.733087, -0.210377, -3.048872, 0.6313726, 1, 0, 1,
-0.7305838, -0.4609607, -3.183346, 0.627451, 1, 0, 1,
-0.7273919, -0.8185839, -3.603319, 0.6196079, 1, 0, 1,
-0.725866, -0.1018299, -0.5760894, 0.6156863, 1, 0, 1,
-0.7234287, -1.411586, -2.393736, 0.6078432, 1, 0, 1,
-0.7226877, -0.2540357, 0.04981684, 0.6039216, 1, 0, 1,
-0.7197196, 0.9779351, -0.7008374, 0.5960785, 1, 0, 1,
-0.7192661, 1.486711, -2.040822, 0.5882353, 1, 0, 1,
-0.7157088, -0.4777954, -4.461292, 0.5843138, 1, 0, 1,
-0.7124128, 0.7313026, -1.067336, 0.5764706, 1, 0, 1,
-0.7123281, -1.103631, -2.524215, 0.572549, 1, 0, 1,
-0.7049289, -0.09062699, -1.249233, 0.5647059, 1, 0, 1,
-0.6975738, 0.152985, -0.927634, 0.5607843, 1, 0, 1,
-0.6970291, -0.2616265, -1.38018, 0.5529412, 1, 0, 1,
-0.6895422, -0.6630028, -2.733757, 0.5490196, 1, 0, 1,
-0.6881605, 0.5578471, 1.378824, 0.5411765, 1, 0, 1,
-0.6880301, -0.7116825, -2.062134, 0.5372549, 1, 0, 1,
-0.6869887, -0.1631731, -2.432459, 0.5294118, 1, 0, 1,
-0.6865929, -0.2611842, -1.540868, 0.5254902, 1, 0, 1,
-0.6843784, -0.617573, -4.252776, 0.5176471, 1, 0, 1,
-0.6843193, 0.200399, -2.045028, 0.5137255, 1, 0, 1,
-0.67606, 0.2290998, -0.6981283, 0.5058824, 1, 0, 1,
-0.6681924, 0.6722289, -1.029435, 0.5019608, 1, 0, 1,
-0.6649195, 0.3522981, -2.736026, 0.4941176, 1, 0, 1,
-0.6557555, -0.4163726, -0.4938772, 0.4862745, 1, 0, 1,
-0.6545281, 0.6384593, -2.039618, 0.4823529, 1, 0, 1,
-0.6544577, 1.373627, -0.6920273, 0.4745098, 1, 0, 1,
-0.6544542, 0.01958634, -1.990047, 0.4705882, 1, 0, 1,
-0.6505452, 0.05331605, -0.2398524, 0.4627451, 1, 0, 1,
-0.6367484, -0.007247051, -1.375764, 0.4588235, 1, 0, 1,
-0.6338454, 0.4363724, -1.355311, 0.4509804, 1, 0, 1,
-0.633282, 0.2208162, -2.70197, 0.4470588, 1, 0, 1,
-0.6328328, -0.2219222, -2.371412, 0.4392157, 1, 0, 1,
-0.630895, -0.4677982, -1.663176, 0.4352941, 1, 0, 1,
-0.6293761, -1.160062, -2.082146, 0.427451, 1, 0, 1,
-0.6246036, -0.4506599, -0.3795455, 0.4235294, 1, 0, 1,
-0.6226558, -0.5631708, -0.8366547, 0.4156863, 1, 0, 1,
-0.6147289, -1.733317, -2.36958, 0.4117647, 1, 0, 1,
-0.5971756, 0.4451886, 0.2952597, 0.4039216, 1, 0, 1,
-0.593087, -0.6285177, -2.109322, 0.3960784, 1, 0, 1,
-0.5877362, -0.9351637, -0.8843148, 0.3921569, 1, 0, 1,
-0.58641, 0.5650413, -2.699214, 0.3843137, 1, 0, 1,
-0.5848879, -0.348677, -2.815771, 0.3803922, 1, 0, 1,
-0.5801879, 0.146902, -1.858842, 0.372549, 1, 0, 1,
-0.5799627, -1.473135, -3.000701, 0.3686275, 1, 0, 1,
-0.5798242, 1.451838, 0.3854705, 0.3607843, 1, 0, 1,
-0.5758336, 0.247893, -0.3606189, 0.3568628, 1, 0, 1,
-0.5734703, -0.6481534, -4.210924, 0.3490196, 1, 0, 1,
-0.5645031, 0.4790314, -2.771288, 0.345098, 1, 0, 1,
-0.5586733, 0.3348459, 0.2718484, 0.3372549, 1, 0, 1,
-0.5533006, 0.6659437, -1.282724, 0.3333333, 1, 0, 1,
-0.5467537, -0.016009, -1.808802, 0.3254902, 1, 0, 1,
-0.5458604, -0.9457347, -0.7155649, 0.3215686, 1, 0, 1,
-0.5440882, -1.061924, -1.479789, 0.3137255, 1, 0, 1,
-0.5428962, -0.2204511, -1.439602, 0.3098039, 1, 0, 1,
-0.5426921, -0.1803334, -0.3021208, 0.3019608, 1, 0, 1,
-0.5409224, -1.597399, -3.713537, 0.2941177, 1, 0, 1,
-0.525225, -0.05816574, -1.926143, 0.2901961, 1, 0, 1,
-0.522819, -0.8893903, -2.590422, 0.282353, 1, 0, 1,
-0.5136753, 1.797553, -0.1025136, 0.2784314, 1, 0, 1,
-0.5114004, 0.7624035, -1.208738, 0.2705882, 1, 0, 1,
-0.5105775, 1.77054, -1.128159, 0.2666667, 1, 0, 1,
-0.502263, -0.3217789, -1.214323, 0.2588235, 1, 0, 1,
-0.5014871, 1.085119, -1.17268, 0.254902, 1, 0, 1,
-0.5012178, 0.4101092, 0.01373786, 0.2470588, 1, 0, 1,
-0.4981262, 1.006731, 0.08020695, 0.2431373, 1, 0, 1,
-0.4953766, -0.531252, -1.910043, 0.2352941, 1, 0, 1,
-0.49527, 0.5405089, 0.7194753, 0.2313726, 1, 0, 1,
-0.4872532, -0.06904293, -1.426369, 0.2235294, 1, 0, 1,
-0.4865804, -0.2429339, -2.072278, 0.2196078, 1, 0, 1,
-0.4841643, -1.562752, -4.259805, 0.2117647, 1, 0, 1,
-0.4800432, 0.04221131, -0.1373746, 0.2078431, 1, 0, 1,
-0.4786302, 0.6589569, -0.8860056, 0.2, 1, 0, 1,
-0.4785444, -0.764484, -3.631518, 0.1921569, 1, 0, 1,
-0.4659011, -0.7059246, -4.994292, 0.1882353, 1, 0, 1,
-0.4618205, 0.3041019, 0.7500916, 0.1803922, 1, 0, 1,
-0.4567381, 1.662709, -0.6535873, 0.1764706, 1, 0, 1,
-0.4566007, -0.9441738, -1.697382, 0.1686275, 1, 0, 1,
-0.4555443, -0.2840744, -2.550581, 0.1647059, 1, 0, 1,
-0.454415, -0.2321546, -4.382257, 0.1568628, 1, 0, 1,
-0.4525961, -1.039123, -3.931192, 0.1529412, 1, 0, 1,
-0.4464785, 0.1684229, -1.322639, 0.145098, 1, 0, 1,
-0.4435733, -2.195469, -3.532588, 0.1411765, 1, 0, 1,
-0.4397492, 0.5573105, 1.304901, 0.1333333, 1, 0, 1,
-0.4397281, 0.4532505, 0.07632563, 0.1294118, 1, 0, 1,
-0.4394667, 1.551381, -0.431404, 0.1215686, 1, 0, 1,
-0.4392773, -1.072707, -3.385925, 0.1176471, 1, 0, 1,
-0.4385524, -0.2064169, -2.393681, 0.1098039, 1, 0, 1,
-0.4354793, 0.2015909, -1.519148, 0.1058824, 1, 0, 1,
-0.4334358, 0.01518359, -1.462645, 0.09803922, 1, 0, 1,
-0.4330838, 1.422404, -0.3135409, 0.09019608, 1, 0, 1,
-0.4323956, -0.3944521, -2.11059, 0.08627451, 1, 0, 1,
-0.4322415, -1.774183, -3.415299, 0.07843138, 1, 0, 1,
-0.4291901, 0.8288715, -1.479531, 0.07450981, 1, 0, 1,
-0.4233879, -0.3112538, -0.7850978, 0.06666667, 1, 0, 1,
-0.423205, 0.191107, -1.596322, 0.0627451, 1, 0, 1,
-0.4228218, -0.05736703, -2.624863, 0.05490196, 1, 0, 1,
-0.4225139, 0.02979698, -1.774289, 0.05098039, 1, 0, 1,
-0.4224214, -1.947037, -3.921788, 0.04313726, 1, 0, 1,
-0.421656, -0.5621643, -2.220428, 0.03921569, 1, 0, 1,
-0.4203975, 0.2980466, 0.5769786, 0.03137255, 1, 0, 1,
-0.420015, -0.735523, -2.185198, 0.02745098, 1, 0, 1,
-0.4184991, 1.819301, 1.642587, 0.01960784, 1, 0, 1,
-0.4098022, 1.137204, -0.4901882, 0.01568628, 1, 0, 1,
-0.4008967, 1.094994, -0.8110878, 0.007843138, 1, 0, 1,
-0.4008141, -0.7766612, -1.825966, 0.003921569, 1, 0, 1,
-0.3976236, -0.1356936, -3.166263, 0, 1, 0.003921569, 1,
-0.3961586, -1.027607, -3.548706, 0, 1, 0.01176471, 1,
-0.3894421, -1.17924, -3.153301, 0, 1, 0.01568628, 1,
-0.3881594, -3.099796, -2.304419, 0, 1, 0.02352941, 1,
-0.3877294, 0.6918864, -1.73168, 0, 1, 0.02745098, 1,
-0.3851309, -0.5020273, -3.46493, 0, 1, 0.03529412, 1,
-0.3851308, 1.083836, 1.024265, 0, 1, 0.03921569, 1,
-0.3840404, 0.4870794, -1.431687, 0, 1, 0.04705882, 1,
-0.3831253, 0.03417784, -1.001627, 0, 1, 0.05098039, 1,
-0.3830447, 1.450908, -1.108697, 0, 1, 0.05882353, 1,
-0.3774743, -0.6039047, -4.004303, 0, 1, 0.0627451, 1,
-0.375259, 0.522165, -0.6048024, 0, 1, 0.07058824, 1,
-0.3740531, 0.7050238, -2.147092, 0, 1, 0.07450981, 1,
-0.3667438, 0.2482189, 0.7390705, 0, 1, 0.08235294, 1,
-0.3656949, 1.146975, -0.1488666, 0, 1, 0.08627451, 1,
-0.3655537, 0.7588696, -0.04222459, 0, 1, 0.09411765, 1,
-0.3603871, 0.5744778, 0.2518426, 0, 1, 0.1019608, 1,
-0.3579188, 1.255689, -0.6709352, 0, 1, 0.1058824, 1,
-0.3571715, 0.3809554, -3.208758, 0, 1, 0.1137255, 1,
-0.3564817, -1.237852, -2.480263, 0, 1, 0.1176471, 1,
-0.3511204, 0.6670648, -0.6420965, 0, 1, 0.1254902, 1,
-0.3507674, 0.07915677, -0.3628137, 0, 1, 0.1294118, 1,
-0.3471862, -0.4807958, -1.479901, 0, 1, 0.1372549, 1,
-0.3460494, 0.6700139, -1.625194, 0, 1, 0.1411765, 1,
-0.3455546, 0.1776473, -0.6598704, 0, 1, 0.1490196, 1,
-0.3446107, -0.4926476, -2.89425, 0, 1, 0.1529412, 1,
-0.3429495, 0.2603594, -1.053979, 0, 1, 0.1607843, 1,
-0.3425674, -0.2175617, -2.207202, 0, 1, 0.1647059, 1,
-0.3420913, -2.006201, -2.009434, 0, 1, 0.172549, 1,
-0.3380449, -0.4003319, -3.510073, 0, 1, 0.1764706, 1,
-0.3374169, 0.1567752, 0.4527846, 0, 1, 0.1843137, 1,
-0.3366348, -1.061258, -3.337812, 0, 1, 0.1882353, 1,
-0.3353395, -1.155953, -4.202802, 0, 1, 0.1960784, 1,
-0.3330436, -0.5048743, -1.064855, 0, 1, 0.2039216, 1,
-0.3321626, 0.8363885, -0.3912118, 0, 1, 0.2078431, 1,
-0.3301486, -0.2456626, -3.015928, 0, 1, 0.2156863, 1,
-0.3246046, 0.4925127, -1.224181, 0, 1, 0.2196078, 1,
-0.323529, 1.977098, 0.2870109, 0, 1, 0.227451, 1,
-0.3230219, -0.2478416, -1.732863, 0, 1, 0.2313726, 1,
-0.3227013, -1.011412, -2.242827, 0, 1, 0.2392157, 1,
-0.3210135, 1.911587, 0.9914749, 0, 1, 0.2431373, 1,
-0.3204556, 0.07758283, -0.3051794, 0, 1, 0.2509804, 1,
-0.3177721, -0.1704462, -3.482474, 0, 1, 0.254902, 1,
-0.3130626, -2.088726, -1.448141, 0, 1, 0.2627451, 1,
-0.313062, -1.207716, -3.430637, 0, 1, 0.2666667, 1,
-0.3074374, -0.1078907, -1.434794, 0, 1, 0.2745098, 1,
-0.3061801, -0.1319119, -4.569831, 0, 1, 0.2784314, 1,
-0.3035027, 0.9960384, -0.4299636, 0, 1, 0.2862745, 1,
-0.3020786, -1.355853, -3.068339, 0, 1, 0.2901961, 1,
-0.2970975, -0.9830422, -1.586696, 0, 1, 0.2980392, 1,
-0.2951259, 0.4767566, -0.9360737, 0, 1, 0.3058824, 1,
-0.2943301, -1.921134, -3.728575, 0, 1, 0.3098039, 1,
-0.2921749, 0.07645623, 0.09478806, 0, 1, 0.3176471, 1,
-0.2921313, -0.467373, -3.968138, 0, 1, 0.3215686, 1,
-0.2914651, 0.5423617, -0.7225064, 0, 1, 0.3294118, 1,
-0.2903957, 1.355964, -0.231981, 0, 1, 0.3333333, 1,
-0.2895515, -0.1843699, -1.20318, 0, 1, 0.3411765, 1,
-0.2895301, 1.247427, 0.5780777, 0, 1, 0.345098, 1,
-0.2890592, 1.466349, 0.5424303, 0, 1, 0.3529412, 1,
-0.2871158, 1.033846, 1.050171, 0, 1, 0.3568628, 1,
-0.286781, -0.8376762, -2.713277, 0, 1, 0.3647059, 1,
-0.2861468, 0.5689177, 0.5078056, 0, 1, 0.3686275, 1,
-0.2836292, -1.347802, -4.494135, 0, 1, 0.3764706, 1,
-0.2756612, -0.3769042, -1.972711, 0, 1, 0.3803922, 1,
-0.2717021, 0.7936988, -0.4953986, 0, 1, 0.3882353, 1,
-0.2676813, 0.58272, -1.284617, 0, 1, 0.3921569, 1,
-0.2672027, -0.6061801, -3.132482, 0, 1, 0.4, 1,
-0.2621774, -0.2187517, -0.9154137, 0, 1, 0.4078431, 1,
-0.2617979, -1.685495, -2.891326, 0, 1, 0.4117647, 1,
-0.2614705, 1.157675, 0.4675389, 0, 1, 0.4196078, 1,
-0.2604302, 0.2317619, 0.2061725, 0, 1, 0.4235294, 1,
-0.2601649, -0.4730759, -3.66572, 0, 1, 0.4313726, 1,
-0.2601062, -0.7184498, -3.054714, 0, 1, 0.4352941, 1,
-0.2595137, 0.4637664, 0.4272279, 0, 1, 0.4431373, 1,
-0.2574324, -0.6908032, -3.135344, 0, 1, 0.4470588, 1,
-0.2530442, -0.3911599, -0.952025, 0, 1, 0.454902, 1,
-0.25055, -1.597474, -3.821461, 0, 1, 0.4588235, 1,
-0.2489771, -1.134887, -3.36253, 0, 1, 0.4666667, 1,
-0.2464073, -0.6773571, -2.357543, 0, 1, 0.4705882, 1,
-0.2449667, 0.313057, 0.7393811, 0, 1, 0.4784314, 1,
-0.2447846, 0.0007910567, -1.945663, 0, 1, 0.4823529, 1,
-0.2444869, -0.8572353, -4.850288, 0, 1, 0.4901961, 1,
-0.244078, 1.118881, -0.08736575, 0, 1, 0.4941176, 1,
-0.2403198, -1.631827, -3.979742, 0, 1, 0.5019608, 1,
-0.2393995, -0.9180198, -1.412878, 0, 1, 0.509804, 1,
-0.2365973, 0.5489357, 1.34769, 0, 1, 0.5137255, 1,
-0.2344978, 1.157122, 2.071737, 0, 1, 0.5215687, 1,
-0.2330095, -1.695382, -3.817046, 0, 1, 0.5254902, 1,
-0.2326165, 0.007413198, -0.9092136, 0, 1, 0.5333334, 1,
-0.2314527, -1.28288, -3.608683, 0, 1, 0.5372549, 1,
-0.230345, 1.485008, 0.173577, 0, 1, 0.5450981, 1,
-0.2301868, -0.5447394, -2.43267, 0, 1, 0.5490196, 1,
-0.2235951, 0.14763, -2.280428, 0, 1, 0.5568628, 1,
-0.2214458, 0.01581918, -2.250194, 0, 1, 0.5607843, 1,
-0.2119605, 0.8153276, -1.534592, 0, 1, 0.5686275, 1,
-0.2097157, 0.4256334, 1.109418, 0, 1, 0.572549, 1,
-0.2077764, -0.6926448, -5.365643, 0, 1, 0.5803922, 1,
-0.2017324, 0.1812793, -1.111544, 0, 1, 0.5843138, 1,
-0.1962791, -0.384176, -1.372083, 0, 1, 0.5921569, 1,
-0.1946252, 0.3794234, 1.06244, 0, 1, 0.5960785, 1,
-0.1909419, -0.2020621, -3.077107, 0, 1, 0.6039216, 1,
-0.190584, 0.2983522, 0.6923487, 0, 1, 0.6117647, 1,
-0.1895071, -0.6808773, -3.928608, 0, 1, 0.6156863, 1,
-0.1864924, -0.5507922, -2.978362, 0, 1, 0.6235294, 1,
-0.1836336, -0.06208471, -2.111074, 0, 1, 0.627451, 1,
-0.1822269, -0.5073159, -3.1907, 0, 1, 0.6352941, 1,
-0.1810665, -1.23936, -3.811651, 0, 1, 0.6392157, 1,
-0.1810228, 0.2029456, 0.7065993, 0, 1, 0.6470588, 1,
-0.1807821, -0.2110904, -2.252517, 0, 1, 0.6509804, 1,
-0.1754977, 1.237575, -1.087961, 0, 1, 0.6588235, 1,
-0.1742707, -0.2918059, -1.612666, 0, 1, 0.6627451, 1,
-0.1725751, -1.405854, -2.102896, 0, 1, 0.6705883, 1,
-0.1660431, 0.7251477, 0.4808366, 0, 1, 0.6745098, 1,
-0.165383, 1.121312, 0.8225516, 0, 1, 0.682353, 1,
-0.1551109, -1.720255, -2.14973, 0, 1, 0.6862745, 1,
-0.1456713, -2.076488, -3.340049, 0, 1, 0.6941177, 1,
-0.1440515, 0.5279456, -2.063577, 0, 1, 0.7019608, 1,
-0.1438377, -0.1961252, -1.992706, 0, 1, 0.7058824, 1,
-0.1428991, -0.5524483, -2.177548, 0, 1, 0.7137255, 1,
-0.1417429, -1.851134, -3.492018, 0, 1, 0.7176471, 1,
-0.1393114, -0.2438812, -2.988295, 0, 1, 0.7254902, 1,
-0.1388786, 0.1871578, -0.1534211, 0, 1, 0.7294118, 1,
-0.1366412, 0.3250473, -1.267348, 0, 1, 0.7372549, 1,
-0.1342666, -0.7817215, -2.971936, 0, 1, 0.7411765, 1,
-0.1339305, -0.8553438, -3.354072, 0, 1, 0.7490196, 1,
-0.1336904, -0.03049468, -2.38183, 0, 1, 0.7529412, 1,
-0.1327024, 0.3528418, -0.8793148, 0, 1, 0.7607843, 1,
-0.1312476, 0.0005744221, -1.367415, 0, 1, 0.7647059, 1,
-0.130804, 0.4939878, 0.6523758, 0, 1, 0.772549, 1,
-0.1251484, -2.183755, -2.702712, 0, 1, 0.7764706, 1,
-0.1178739, 0.2592024, -1.754886, 0, 1, 0.7843137, 1,
-0.1152574, -0.6644489, -1.333608, 0, 1, 0.7882353, 1,
-0.1146627, -0.4136575, -1.911246, 0, 1, 0.7960784, 1,
-0.112372, 1.064696, 0.2811808, 0, 1, 0.8039216, 1,
-0.103638, -1.338919, -4.562347, 0, 1, 0.8078431, 1,
-0.1012623, 0.179258, -1.336986, 0, 1, 0.8156863, 1,
-0.1003893, 0.1148778, -2.062472, 0, 1, 0.8196079, 1,
-0.09843357, 0.07938407, -0.5317031, 0, 1, 0.827451, 1,
-0.09618074, -0.518725, -4.028441, 0, 1, 0.8313726, 1,
-0.09593508, -0.9198585, -3.674668, 0, 1, 0.8392157, 1,
-0.09454251, 0.0163862, -2.632246, 0, 1, 0.8431373, 1,
-0.09123643, 0.3094601, -1.094185, 0, 1, 0.8509804, 1,
-0.08286987, -1.910878, -1.941762, 0, 1, 0.854902, 1,
-0.08216874, -1.080473, -3.241445, 0, 1, 0.8627451, 1,
-0.07762791, 0.6702214, -0.6674828, 0, 1, 0.8666667, 1,
-0.07731432, 0.5950942, 0.2603351, 0, 1, 0.8745098, 1,
-0.07688665, -1.364638, -2.740361, 0, 1, 0.8784314, 1,
-0.07546208, -0.07420775, -2.344001, 0, 1, 0.8862745, 1,
-0.07124024, -0.1806552, -3.628546, 0, 1, 0.8901961, 1,
-0.06644444, 0.3392123, 0.03446573, 0, 1, 0.8980392, 1,
-0.05992635, 0.3479998, -0.9771835, 0, 1, 0.9058824, 1,
-0.05809331, -0.832512, -4.217898, 0, 1, 0.9098039, 1,
-0.05647532, -0.2274146, -4.567771, 0, 1, 0.9176471, 1,
-0.05299681, 1.840486, -0.6413265, 0, 1, 0.9215686, 1,
-0.05281471, 0.4559723, 1.12135, 0, 1, 0.9294118, 1,
-0.05040246, -0.7731767, -4.088576, 0, 1, 0.9333333, 1,
-0.04821519, -0.7372242, -3.763062, 0, 1, 0.9411765, 1,
-0.04603315, 0.6419039, 0.3183742, 0, 1, 0.945098, 1,
-0.0435509, -0.05385788, -1.740715, 0, 1, 0.9529412, 1,
-0.03805688, 0.0891003, -0.1958825, 0, 1, 0.9568627, 1,
-0.03573688, 0.3734267, 1.798169, 0, 1, 0.9647059, 1,
-0.03482957, 1.380577, 0.8299074, 0, 1, 0.9686275, 1,
-0.03299521, -0.1808246, -2.315172, 0, 1, 0.9764706, 1,
-0.03131921, 0.5792171, 0.217446, 0, 1, 0.9803922, 1,
-0.03016611, 0.505242, 0.3662836, 0, 1, 0.9882353, 1,
-0.0227585, 0.3711324, -0.8152643, 0, 1, 0.9921569, 1,
-0.01859776, -0.1951928, -2.357377, 0, 1, 1, 1,
-0.01820526, -1.433663, -3.677774, 0, 0.9921569, 1, 1,
-0.01567091, -0.1255771, -4.082052, 0, 0.9882353, 1, 1,
-0.01536453, -1.291997, -3.252433, 0, 0.9803922, 1, 1,
-0.01401606, -0.4621025, -3.551695, 0, 0.9764706, 1, 1,
-0.01283851, -0.6575375, -3.469017, 0, 0.9686275, 1, 1,
-0.01263069, 0.6830667, 0.01933655, 0, 0.9647059, 1, 1,
-0.00660176, 1.332392, -0.2767727, 0, 0.9568627, 1, 1,
-0.001944824, -1.500803, -5.119544, 0, 0.9529412, 1, 1,
0.0006870283, -0.5555211, 5.287269, 0, 0.945098, 1, 1,
0.002684145, -0.8704094, 2.047254, 0, 0.9411765, 1, 1,
0.003720145, -0.7248979, 4.103832, 0, 0.9333333, 1, 1,
0.006415014, 0.1818103, -0.1733373, 0, 0.9294118, 1, 1,
0.006723757, -1.170332, 3.761831, 0, 0.9215686, 1, 1,
0.007613799, 0.09075485, 0.8595082, 0, 0.9176471, 1, 1,
0.008517295, 0.2810473, -1.264596, 0, 0.9098039, 1, 1,
0.01051114, -0.1002645, 3.877947, 0, 0.9058824, 1, 1,
0.01290987, 0.5380103, -0.968266, 0, 0.8980392, 1, 1,
0.01339068, 1.435178, -0.1587373, 0, 0.8901961, 1, 1,
0.01572576, -1.960067, 2.662547, 0, 0.8862745, 1, 1,
0.01920602, 0.4459625, 0.4318596, 0, 0.8784314, 1, 1,
0.02159573, 1.142717, 1.740333, 0, 0.8745098, 1, 1,
0.02319103, 0.5365072, 0.7748172, 0, 0.8666667, 1, 1,
0.02427336, -0.6889735, 3.977664, 0, 0.8627451, 1, 1,
0.02709766, -0.5630091, 2.70459, 0, 0.854902, 1, 1,
0.02749748, -0.1153937, 2.586797, 0, 0.8509804, 1, 1,
0.02923773, 0.1089931, -0.9845166, 0, 0.8431373, 1, 1,
0.032607, 1.203271, -0.2552676, 0, 0.8392157, 1, 1,
0.03364818, -0.911977, 2.295601, 0, 0.8313726, 1, 1,
0.04174133, 1.014713, 1.660078, 0, 0.827451, 1, 1,
0.04529973, 1.52184, 0.6171901, 0, 0.8196079, 1, 1,
0.04542276, -0.06318759, 1.391227, 0, 0.8156863, 1, 1,
0.04715298, 0.9079817, 2.593029, 0, 0.8078431, 1, 1,
0.04849078, -1.032083, 1.534519, 0, 0.8039216, 1, 1,
0.05817122, -1.581494, 2.700409, 0, 0.7960784, 1, 1,
0.05963585, 1.668221, -0.8834268, 0, 0.7882353, 1, 1,
0.06253202, -0.02642827, 2.289012, 0, 0.7843137, 1, 1,
0.06258748, 0.4220544, -1.71445, 0, 0.7764706, 1, 1,
0.06394943, -0.7478219, 3.230202, 0, 0.772549, 1, 1,
0.06529168, 0.3589221, 0.752493, 0, 0.7647059, 1, 1,
0.07242193, -0.05749815, 1.922104, 0, 0.7607843, 1, 1,
0.07596409, -0.02173787, 2.103186, 0, 0.7529412, 1, 1,
0.07841624, -1.08729, 2.145209, 0, 0.7490196, 1, 1,
0.07899077, -0.3853749, 3.541992, 0, 0.7411765, 1, 1,
0.07917037, 1.690131, -0.2198439, 0, 0.7372549, 1, 1,
0.0834668, -0.7205107, 4.563891, 0, 0.7294118, 1, 1,
0.08565634, 1.153228, 2.238215, 0, 0.7254902, 1, 1,
0.09129348, 0.02170104, 1.454207, 0, 0.7176471, 1, 1,
0.09262624, 0.01057102, 1.745614, 0, 0.7137255, 1, 1,
0.1014684, -1.041669, 3.304609, 0, 0.7058824, 1, 1,
0.1074098, -0.9630208, 2.883339, 0, 0.6980392, 1, 1,
0.1074755, 0.1481266, 0.3844549, 0, 0.6941177, 1, 1,
0.1076609, 0.7896041, 0.4013951, 0, 0.6862745, 1, 1,
0.1084573, 1.770599, 0.1043568, 0, 0.682353, 1, 1,
0.1166873, 0.4044651, 1.275794, 0, 0.6745098, 1, 1,
0.1170734, 0.3404911, 1.04937, 0, 0.6705883, 1, 1,
0.1179403, 0.7031822, 0.4234762, 0, 0.6627451, 1, 1,
0.122226, -0.2640201, 5.211634, 0, 0.6588235, 1, 1,
0.1260531, 1.286537, 0.3561522, 0, 0.6509804, 1, 1,
0.1271487, -1.048178, 4.318824, 0, 0.6470588, 1, 1,
0.135022, -2.505952, 2.473197, 0, 0.6392157, 1, 1,
0.1378011, -0.2922598, 2.427234, 0, 0.6352941, 1, 1,
0.1557465, -0.4128264, 0.5980331, 0, 0.627451, 1, 1,
0.1602246, 0.07206997, 2.335711, 0, 0.6235294, 1, 1,
0.1605404, 1.206667, -0.6724002, 0, 0.6156863, 1, 1,
0.1635678, 0.9853203, 0.4301061, 0, 0.6117647, 1, 1,
0.1645621, -0.506158, 3.477216, 0, 0.6039216, 1, 1,
0.1672572, 0.3534249, 1.072259, 0, 0.5960785, 1, 1,
0.1730482, 0.3980972, 1.149036, 0, 0.5921569, 1, 1,
0.1738897, 0.4385433, 0.8615596, 0, 0.5843138, 1, 1,
0.1747957, -0.3260791, 4.051181, 0, 0.5803922, 1, 1,
0.1797865, 0.3291087, -1.198505, 0, 0.572549, 1, 1,
0.1806435, 0.5067104, 0.178343, 0, 0.5686275, 1, 1,
0.1807684, -0.6995383, 2.773801, 0, 0.5607843, 1, 1,
0.1809853, -1.657248, 3.80031, 0, 0.5568628, 1, 1,
0.1866905, -0.6598452, 2.768939, 0, 0.5490196, 1, 1,
0.1889499, 1.623293, -0.6596545, 0, 0.5450981, 1, 1,
0.1899742, 0.3227639, 0.05820426, 0, 0.5372549, 1, 1,
0.1930519, -0.1341957, 2.579802, 0, 0.5333334, 1, 1,
0.196713, -1.677497, 1.8644, 0, 0.5254902, 1, 1,
0.1981487, -0.4320658, 0.8261102, 0, 0.5215687, 1, 1,
0.2024686, 1.502645, 0.8589884, 0, 0.5137255, 1, 1,
0.2040255, 1.018352, 0.9506326, 0, 0.509804, 1, 1,
0.2054817, -1.322736, 3.318375, 0, 0.5019608, 1, 1,
0.205685, 0.08499424, -1.274717, 0, 0.4941176, 1, 1,
0.2138104, 0.2500324, 2.30383, 0, 0.4901961, 1, 1,
0.2153054, -1.493134, 3.665699, 0, 0.4823529, 1, 1,
0.2156498, 0.01145049, 0.2844653, 0, 0.4784314, 1, 1,
0.2185123, 0.7007656, 0.003712668, 0, 0.4705882, 1, 1,
0.2242156, -1.640707, 2.924939, 0, 0.4666667, 1, 1,
0.2253738, -0.7554287, 4.367749, 0, 0.4588235, 1, 1,
0.2258338, 0.3264121, 0.1534267, 0, 0.454902, 1, 1,
0.2310969, 0.7474118, 0.3461376, 0, 0.4470588, 1, 1,
0.2311224, 0.3412745, -0.01938544, 0, 0.4431373, 1, 1,
0.2323073, 0.8447149, -1.445273, 0, 0.4352941, 1, 1,
0.2345151, -0.7389432, 4.17837, 0, 0.4313726, 1, 1,
0.2349967, -0.8341401, 3.96826, 0, 0.4235294, 1, 1,
0.2357612, 0.04886891, -0.9967064, 0, 0.4196078, 1, 1,
0.2426162, -1.416316, 2.443944, 0, 0.4117647, 1, 1,
0.2477039, 1.041931, -0.01766571, 0, 0.4078431, 1, 1,
0.2517965, -2.443045, 4.14779, 0, 0.4, 1, 1,
0.2554357, 0.1777525, -0.9995741, 0, 0.3921569, 1, 1,
0.2586837, 0.3897923, 1.341433, 0, 0.3882353, 1, 1,
0.2623129, -0.1016827, 2.585708, 0, 0.3803922, 1, 1,
0.264217, 0.1719681, 0.7218354, 0, 0.3764706, 1, 1,
0.2643608, -1.674564, 1.895222, 0, 0.3686275, 1, 1,
0.2669219, -0.4398926, 3.150893, 0, 0.3647059, 1, 1,
0.2684689, 0.6202348, 0.5010728, 0, 0.3568628, 1, 1,
0.2742193, 0.4041168, -0.6742824, 0, 0.3529412, 1, 1,
0.2802646, 0.2440636, -0.2960728, 0, 0.345098, 1, 1,
0.2802765, -0.6665446, 1.557296, 0, 0.3411765, 1, 1,
0.2809521, 1.593734, 0.4567809, 0, 0.3333333, 1, 1,
0.28381, 0.2257421, -0.7666686, 0, 0.3294118, 1, 1,
0.2838241, 0.6458635, 0.1956916, 0, 0.3215686, 1, 1,
0.2873397, 0.2345417, 1.108689, 0, 0.3176471, 1, 1,
0.2876352, 1.827283, -1.258549, 0, 0.3098039, 1, 1,
0.2898396, 0.4076929, 0.4062029, 0, 0.3058824, 1, 1,
0.2902685, 3.971409, 0.8278958, 0, 0.2980392, 1, 1,
0.2941354, -0.8232124, 3.239149, 0, 0.2901961, 1, 1,
0.2944079, -0.8545266, 2.580575, 0, 0.2862745, 1, 1,
0.298773, -0.04136502, 0.6861076, 0, 0.2784314, 1, 1,
0.3020473, -0.2646445, 1.650367, 0, 0.2745098, 1, 1,
0.3030397, -0.6516414, 2.185149, 0, 0.2666667, 1, 1,
0.3051102, -0.3329901, 2.347361, 0, 0.2627451, 1, 1,
0.3070112, -1.980022, 2.082988, 0, 0.254902, 1, 1,
0.311696, 2.335566, -1.770244, 0, 0.2509804, 1, 1,
0.313539, -0.2339818, 1.933322, 0, 0.2431373, 1, 1,
0.3139544, -0.7437027, 3.802292, 0, 0.2392157, 1, 1,
0.3150083, 0.04095642, 0.792135, 0, 0.2313726, 1, 1,
0.3183337, 0.5499714, 1.496676, 0, 0.227451, 1, 1,
0.3236699, 1.010852, 1.098938, 0, 0.2196078, 1, 1,
0.326978, -1.302765, 2.84037, 0, 0.2156863, 1, 1,
0.327893, 0.7104928, 1.796515, 0, 0.2078431, 1, 1,
0.3295677, 0.4691418, 2.446989, 0, 0.2039216, 1, 1,
0.3296867, 0.6049136, 0.9934734, 0, 0.1960784, 1, 1,
0.3328401, -0.07423339, 0.8614551, 0, 0.1882353, 1, 1,
0.3332579, -1.148491, 4.801962, 0, 0.1843137, 1, 1,
0.3350757, 0.5486373, 0.9255041, 0, 0.1764706, 1, 1,
0.336552, -0.4637695, 3.244385, 0, 0.172549, 1, 1,
0.3400993, 0.4889932, -1.076291, 0, 0.1647059, 1, 1,
0.3401918, -1.325359, 2.220882, 0, 0.1607843, 1, 1,
0.3418283, -1.091203, 4.079501, 0, 0.1529412, 1, 1,
0.3425542, 1.072167, -0.2244403, 0, 0.1490196, 1, 1,
0.3430629, -0.5439107, 1.403731, 0, 0.1411765, 1, 1,
0.3460175, 0.05005128, 0.5092064, 0, 0.1372549, 1, 1,
0.3464321, -0.2439512, -1.52596, 0, 0.1294118, 1, 1,
0.3487058, -0.8236843, 2.999519, 0, 0.1254902, 1, 1,
0.3518038, 0.4579248, 0.3153536, 0, 0.1176471, 1, 1,
0.3542647, 0.2300499, 1.776448, 0, 0.1137255, 1, 1,
0.3553433, 0.06295425, -0.6845132, 0, 0.1058824, 1, 1,
0.3553443, -0.3543031, 2.842818, 0, 0.09803922, 1, 1,
0.3571685, -0.7654067, 3.86362, 0, 0.09411765, 1, 1,
0.3591699, 0.6233237, 1.407305, 0, 0.08627451, 1, 1,
0.3614253, -0.6282111, 3.868753, 0, 0.08235294, 1, 1,
0.3661128, 0.5517768, 1.105247, 0, 0.07450981, 1, 1,
0.3665793, -1.329702, 2.969484, 0, 0.07058824, 1, 1,
0.3686913, 1.730892, 0.5433878, 0, 0.0627451, 1, 1,
0.3692786, 0.47956, 2.340182, 0, 0.05882353, 1, 1,
0.3711521, -0.9571105, 4.484436, 0, 0.05098039, 1, 1,
0.3729462, -2.476093, 4.807329, 0, 0.04705882, 1, 1,
0.3790517, 0.1414777, 1.008457, 0, 0.03921569, 1, 1,
0.3803554, 1.393253, 1.450946, 0, 0.03529412, 1, 1,
0.3824012, -0.607934, 4.648529, 0, 0.02745098, 1, 1,
0.3883039, 1.710592, -1.190246, 0, 0.02352941, 1, 1,
0.3939538, -1.205767, 2.004705, 0, 0.01568628, 1, 1,
0.3941776, 1.480366, 0.005473356, 0, 0.01176471, 1, 1,
0.3946353, -0.4235174, 1.234192, 0, 0.003921569, 1, 1,
0.3952001, -0.2836052, 1.913002, 0.003921569, 0, 1, 1,
0.3993298, 0.1012266, 1.525401, 0.007843138, 0, 1, 1,
0.3994021, -0.2198971, 2.830619, 0.01568628, 0, 1, 1,
0.4043654, 0.0009093285, -0.08438293, 0.01960784, 0, 1, 1,
0.4078229, 0.2585304, 0.1200567, 0.02745098, 0, 1, 1,
0.4105415, -0.4370259, 3.010362, 0.03137255, 0, 1, 1,
0.4186481, -0.05279604, 1.3109, 0.03921569, 0, 1, 1,
0.4193665, 0.5058644, 0.3149674, 0.04313726, 0, 1, 1,
0.4193839, 0.9733428, -0.5685172, 0.05098039, 0, 1, 1,
0.4249384, -0.1767468, 2.384377, 0.05490196, 0, 1, 1,
0.4275928, -0.248203, 2.766703, 0.0627451, 0, 1, 1,
0.4312307, -0.4505485, 3.360229, 0.06666667, 0, 1, 1,
0.4321137, 1.182117, 1.746162, 0.07450981, 0, 1, 1,
0.4340629, -0.6080312, 3.379037, 0.07843138, 0, 1, 1,
0.4398173, 0.3949134, -0.1827349, 0.08627451, 0, 1, 1,
0.4451251, 0.4264944, 0.2925664, 0.09019608, 0, 1, 1,
0.4527285, 0.7028444, 1.06171, 0.09803922, 0, 1, 1,
0.4591515, 0.5356875, 2.881448, 0.1058824, 0, 1, 1,
0.4609836, 0.6599851, 1.77161, 0.1098039, 0, 1, 1,
0.4633627, -0.7190925, 3.626582, 0.1176471, 0, 1, 1,
0.4669313, -0.06607981, 1.097222, 0.1215686, 0, 1, 1,
0.4670883, -0.6461388, 1.798764, 0.1294118, 0, 1, 1,
0.4674031, 0.9602036, -0.3409466, 0.1333333, 0, 1, 1,
0.4688108, -0.2151087, 2.08187, 0.1411765, 0, 1, 1,
0.4735883, -0.3828097, 2.081094, 0.145098, 0, 1, 1,
0.4778885, -0.6999053, 4.380813, 0.1529412, 0, 1, 1,
0.4822374, -0.9482396, 2.344184, 0.1568628, 0, 1, 1,
0.4829214, 0.8548446, 0.5318304, 0.1647059, 0, 1, 1,
0.4830185, -1.139936, 2.540288, 0.1686275, 0, 1, 1,
0.4832751, 0.2817084, 0.5379803, 0.1764706, 0, 1, 1,
0.4835774, 0.3492235, 0.5090269, 0.1803922, 0, 1, 1,
0.4835872, -2.161415, 0.624888, 0.1882353, 0, 1, 1,
0.4845592, 0.8089027, 0.7988362, 0.1921569, 0, 1, 1,
0.4847499, -0.8869718, 2.93771, 0.2, 0, 1, 1,
0.4900776, 0.08118551, 0.04467042, 0.2078431, 0, 1, 1,
0.4911503, 0.01596457, 1.328346, 0.2117647, 0, 1, 1,
0.4928123, 1.503598, -2.355569, 0.2196078, 0, 1, 1,
0.4946948, 0.4767502, 1.215808, 0.2235294, 0, 1, 1,
0.4955368, -1.176618, 2.851657, 0.2313726, 0, 1, 1,
0.4965397, 0.9640106, -1.090189, 0.2352941, 0, 1, 1,
0.4997385, -0.01392861, 2.222785, 0.2431373, 0, 1, 1,
0.4998473, -0.8315145, 1.103941, 0.2470588, 0, 1, 1,
0.5009578, -2.463413, 2.586928, 0.254902, 0, 1, 1,
0.5076264, 0.5529301, 2.366362, 0.2588235, 0, 1, 1,
0.5159425, 0.8984785, 1.008178, 0.2666667, 0, 1, 1,
0.5174123, 1.509562, 0.636681, 0.2705882, 0, 1, 1,
0.522415, 0.6339086, -0.2428606, 0.2784314, 0, 1, 1,
0.5257065, -0.9533394, 2.817438, 0.282353, 0, 1, 1,
0.5259336, -1.074072, 4.712517, 0.2901961, 0, 1, 1,
0.527327, 1.089223, 1.829824, 0.2941177, 0, 1, 1,
0.5276744, -1.29388, 2.14229, 0.3019608, 0, 1, 1,
0.5325443, -2.789931, 3.877022, 0.3098039, 0, 1, 1,
0.5353559, -0.7074175, 0.8576548, 0.3137255, 0, 1, 1,
0.5365697, 0.38908, 1.549674, 0.3215686, 0, 1, 1,
0.5369332, -0.982502, 3.034033, 0.3254902, 0, 1, 1,
0.538794, 0.05240276, -0.3659479, 0.3333333, 0, 1, 1,
0.5415384, -0.3039722, 0.3851043, 0.3372549, 0, 1, 1,
0.5482302, 0.09046369, 0.9920037, 0.345098, 0, 1, 1,
0.5501413, -1.464396, 3.863846, 0.3490196, 0, 1, 1,
0.5569463, -1.207369, 3.429176, 0.3568628, 0, 1, 1,
0.5571229, -0.2722758, 0.7227674, 0.3607843, 0, 1, 1,
0.5580812, -0.1861565, 4.931871, 0.3686275, 0, 1, 1,
0.5599182, 0.5422654, 0.764372, 0.372549, 0, 1, 1,
0.5608085, -0.2865511, 1.624735, 0.3803922, 0, 1, 1,
0.5614999, -0.781184, 2.362236, 0.3843137, 0, 1, 1,
0.562236, -0.1443949, 2.046916, 0.3921569, 0, 1, 1,
0.5629048, -0.5772279, 1.174068, 0.3960784, 0, 1, 1,
0.5688112, -1.460407, 3.81387, 0.4039216, 0, 1, 1,
0.5732839, -1.378165, 3.489199, 0.4117647, 0, 1, 1,
0.5830785, 0.9464743, 0.4235723, 0.4156863, 0, 1, 1,
0.5863287, 0.03562062, 1.51052, 0.4235294, 0, 1, 1,
0.589717, -0.5190701, 1.493028, 0.427451, 0, 1, 1,
0.5921411, -1.304668, 3.798181, 0.4352941, 0, 1, 1,
0.5927974, 0.3569736, 1.693713, 0.4392157, 0, 1, 1,
0.5952043, 0.4867831, -0.868355, 0.4470588, 0, 1, 1,
0.5969999, -0.3887753, 1.461729, 0.4509804, 0, 1, 1,
0.5991414, 1.119249, 0.5721063, 0.4588235, 0, 1, 1,
0.6001917, 0.3493266, 2.262199, 0.4627451, 0, 1, 1,
0.6039768, -0.8542005, 2.194843, 0.4705882, 0, 1, 1,
0.6060275, 1.382123, 1.029376, 0.4745098, 0, 1, 1,
0.606589, -0.6997819, 2.706355, 0.4823529, 0, 1, 1,
0.6104493, 1.157315, 0.5649906, 0.4862745, 0, 1, 1,
0.6110665, -0.3108929, 2.221161, 0.4941176, 0, 1, 1,
0.6123857, 0.3799798, 1.340179, 0.5019608, 0, 1, 1,
0.6150102, -1.709689, 3.401751, 0.5058824, 0, 1, 1,
0.6244418, -0.3092749, 2.919332, 0.5137255, 0, 1, 1,
0.6339066, -0.7809495, 1.315541, 0.5176471, 0, 1, 1,
0.6367812, 1.042176, 0.3504099, 0.5254902, 0, 1, 1,
0.6386363, -1.374311, 4.351594, 0.5294118, 0, 1, 1,
0.6419809, 0.4281009, 1.532241, 0.5372549, 0, 1, 1,
0.6487, 0.6549175, 2.77915, 0.5411765, 0, 1, 1,
0.6495242, 1.488366, 0.4669063, 0.5490196, 0, 1, 1,
0.6496669, 0.8586648, 2.03785, 0.5529412, 0, 1, 1,
0.6595683, 1.696465, 0.5185736, 0.5607843, 0, 1, 1,
0.6612273, 2.418954, 0.2683806, 0.5647059, 0, 1, 1,
0.6623948, 0.50754, 3.023985, 0.572549, 0, 1, 1,
0.6628101, -1.926507, 0.6622784, 0.5764706, 0, 1, 1,
0.6676226, 0.3492113, 0.8788285, 0.5843138, 0, 1, 1,
0.6707352, -0.8417611, 3.56851, 0.5882353, 0, 1, 1,
0.6716524, -1.268146, 2.505994, 0.5960785, 0, 1, 1,
0.672493, 1.568294, 0.6375186, 0.6039216, 0, 1, 1,
0.6732539, 0.539003, 0.2387625, 0.6078432, 0, 1, 1,
0.6769885, 2.230686, 1.260084, 0.6156863, 0, 1, 1,
0.6769974, 0.4800783, 1.550025, 0.6196079, 0, 1, 1,
0.6866, 1.270041, -0.3797863, 0.627451, 0, 1, 1,
0.6926003, 2.096375, 0.5039867, 0.6313726, 0, 1, 1,
0.6948495, -0.5432475, 2.647102, 0.6392157, 0, 1, 1,
0.6968957, 0.1793535, 2.376945, 0.6431373, 0, 1, 1,
0.6990197, 0.3147728, 0.9454818, 0.6509804, 0, 1, 1,
0.700846, -1.031173, 2.644276, 0.654902, 0, 1, 1,
0.7031965, -0.2939056, 3.027874, 0.6627451, 0, 1, 1,
0.7038236, 0.6657687, 2.282468, 0.6666667, 0, 1, 1,
0.7063695, 0.4565193, 2.135054, 0.6745098, 0, 1, 1,
0.7089268, 0.6315745, 0.153362, 0.6784314, 0, 1, 1,
0.7127765, -0.6253281, 2.367488, 0.6862745, 0, 1, 1,
0.7166011, -0.4126151, 1.594521, 0.6901961, 0, 1, 1,
0.720492, -0.05038121, 1.546089, 0.6980392, 0, 1, 1,
0.7213088, 0.2915589, 0.7994929, 0.7058824, 0, 1, 1,
0.7232295, 0.03012371, 1.223263, 0.7098039, 0, 1, 1,
0.725134, -1.0471, 1.860455, 0.7176471, 0, 1, 1,
0.7258724, -0.7772604, 3.286352, 0.7215686, 0, 1, 1,
0.7273523, -1.99604, 1.604341, 0.7294118, 0, 1, 1,
0.7293622, 0.4586451, -0.1040036, 0.7333333, 0, 1, 1,
0.7326913, -0.5528524, 1.28873, 0.7411765, 0, 1, 1,
0.7356058, 1.260584, 0.1777682, 0.7450981, 0, 1, 1,
0.7399611, 0.6482636, 1.412147, 0.7529412, 0, 1, 1,
0.7399666, 0.08134681, 1.19117, 0.7568628, 0, 1, 1,
0.7446322, 1.120609, 2.301311, 0.7647059, 0, 1, 1,
0.746607, 1.715617, 2.358994, 0.7686275, 0, 1, 1,
0.7484198, -0.1515971, 2.610498, 0.7764706, 0, 1, 1,
0.7486048, -0.4398847, 3.190668, 0.7803922, 0, 1, 1,
0.7541475, 0.3375706, 1.542087, 0.7882353, 0, 1, 1,
0.756579, 0.3827353, 1.017641, 0.7921569, 0, 1, 1,
0.7586809, -0.6940753, 2.139212, 0.8, 0, 1, 1,
0.7614802, 0.3993491, 0.9024634, 0.8078431, 0, 1, 1,
0.761563, 1.838654, -0.2131866, 0.8117647, 0, 1, 1,
0.7685567, -0.2850697, 2.718711, 0.8196079, 0, 1, 1,
0.7752544, -1.137159, 2.839172, 0.8235294, 0, 1, 1,
0.7759739, -0.03837038, 2.376439, 0.8313726, 0, 1, 1,
0.7788791, 0.7411383, 0.3946528, 0.8352941, 0, 1, 1,
0.7793064, -1.410347, 2.855353, 0.8431373, 0, 1, 1,
0.7817991, -0.8984792, 2.614404, 0.8470588, 0, 1, 1,
0.7881717, -0.3602635, 0.7691746, 0.854902, 0, 1, 1,
0.8031, 1.863836, 0.6429326, 0.8588235, 0, 1, 1,
0.8080943, -0.5957222, 1.71212, 0.8666667, 0, 1, 1,
0.8087461, 0.353758, 1.298527, 0.8705882, 0, 1, 1,
0.8119433, 0.3908333, 0.1101615, 0.8784314, 0, 1, 1,
0.8172033, -0.3391179, 2.781909, 0.8823529, 0, 1, 1,
0.8203272, 1.29236, 0.2009152, 0.8901961, 0, 1, 1,
0.8225019, 1.004327, 0.8640893, 0.8941177, 0, 1, 1,
0.8392752, -0.06326359, 1.58872, 0.9019608, 0, 1, 1,
0.8422444, 0.3161257, 0.4026155, 0.9098039, 0, 1, 1,
0.8444903, 0.5973968, 1.26125, 0.9137255, 0, 1, 1,
0.847436, 0.7254822, 0.7528812, 0.9215686, 0, 1, 1,
0.8485196, 1.115965, 0.6775765, 0.9254902, 0, 1, 1,
0.8503859, -0.09136503, 1.60079, 0.9333333, 0, 1, 1,
0.8594289, 2.330945, 0.6090354, 0.9372549, 0, 1, 1,
0.8637766, -0.1770255, 3.315674, 0.945098, 0, 1, 1,
0.8662279, -1.123997, 3.094304, 0.9490196, 0, 1, 1,
0.8668367, 0.2482737, 2.218148, 0.9568627, 0, 1, 1,
0.8674176, 0.115225, 0.7676483, 0.9607843, 0, 1, 1,
0.8699091, 1.143252, 1.509436, 0.9686275, 0, 1, 1,
0.8736216, -0.9390717, 1.714975, 0.972549, 0, 1, 1,
0.879459, -0.6646582, 3.164581, 0.9803922, 0, 1, 1,
0.8823852, -0.09573486, 0.8879732, 0.9843137, 0, 1, 1,
0.8917443, 0.05676413, 1.710785, 0.9921569, 0, 1, 1,
0.8997303, -0.4996746, 3.382346, 0.9960784, 0, 1, 1,
0.9105136, -0.09000544, 3.964602, 1, 0, 0.9960784, 1,
0.9108765, 0.008632322, 0.9103048, 1, 0, 0.9882353, 1,
0.9121974, -1.424782, 0.9692937, 1, 0, 0.9843137, 1,
0.9125166, 0.8466842, -0.05236095, 1, 0, 0.9764706, 1,
0.915659, 0.4947332, 2.775358, 1, 0, 0.972549, 1,
0.9178008, 0.513406, 0.8324711, 1, 0, 0.9647059, 1,
0.9334291, -0.8952389, 1.978883, 1, 0, 0.9607843, 1,
0.9430075, 1.512723, 0.1503732, 1, 0, 0.9529412, 1,
0.952464, -0.2500103, 1.917018, 1, 0, 0.9490196, 1,
0.9563382, 0.9144515, 1.371916, 1, 0, 0.9411765, 1,
0.9622514, 0.668716, 0.5536815, 1, 0, 0.9372549, 1,
0.9637831, -1.719891, 2.533459, 1, 0, 0.9294118, 1,
0.967182, 0.1304879, 3.612859, 1, 0, 0.9254902, 1,
0.9683574, 0.6536216, -0.3464615, 1, 0, 0.9176471, 1,
0.9716319, 1.478727, -1.659888, 1, 0, 0.9137255, 1,
0.9790884, -1.244991, 1.930081, 1, 0, 0.9058824, 1,
0.9799023, 1.42091, -0.5871693, 1, 0, 0.9019608, 1,
0.9815325, 0.6035753, 0.2128269, 1, 0, 0.8941177, 1,
0.9872876, -1.382817, 1.706238, 1, 0, 0.8862745, 1,
0.9897464, -1.552543, 3.638237, 1, 0, 0.8823529, 1,
1.003917, 0.3264555, -0.6958784, 1, 0, 0.8745098, 1,
1.012303, -1.446888, 2.593725, 1, 0, 0.8705882, 1,
1.013206, -0.6724397, 1.892074, 1, 0, 0.8627451, 1,
1.015668, 0.3596706, -0.3144587, 1, 0, 0.8588235, 1,
1.021276, -1.040109, 3.077842, 1, 0, 0.8509804, 1,
1.023998, -1.823146, 3.71621, 1, 0, 0.8470588, 1,
1.02767, 0.656926, 3.204282, 1, 0, 0.8392157, 1,
1.034972, 0.4823382, 1.719316, 1, 0, 0.8352941, 1,
1.043442, 0.8720768, 0.6239238, 1, 0, 0.827451, 1,
1.04836, -1.778605, 3.229726, 1, 0, 0.8235294, 1,
1.051011, -0.05555026, 1.615063, 1, 0, 0.8156863, 1,
1.05195, -0.3306374, 2.350568, 1, 0, 0.8117647, 1,
1.053674, 1.879837, -0.3564221, 1, 0, 0.8039216, 1,
1.065958, 1.507492, 0.7637762, 1, 0, 0.7960784, 1,
1.069521, 0.4871363, -0.1720586, 1, 0, 0.7921569, 1,
1.078282, -0.236693, 3.340837, 1, 0, 0.7843137, 1,
1.080139, -0.9681109, 2.815497, 1, 0, 0.7803922, 1,
1.082044, 0.6001641, -0.3171759, 1, 0, 0.772549, 1,
1.082757, 0.1781031, 0.4561386, 1, 0, 0.7686275, 1,
1.084168, 2.276586, -0.1410147, 1, 0, 0.7607843, 1,
1.08695, -0.08401683, 1.992926, 1, 0, 0.7568628, 1,
1.091771, 1.465627, 0.6275435, 1, 0, 0.7490196, 1,
1.092138, -0.2369442, 2.120441, 1, 0, 0.7450981, 1,
1.093276, 0.5860758, 1.337922, 1, 0, 0.7372549, 1,
1.095504, 0.089324, 2.793495, 1, 0, 0.7333333, 1,
1.09596, -0.2218329, 2.346726, 1, 0, 0.7254902, 1,
1.103716, -0.2076845, 2.659289, 1, 0, 0.7215686, 1,
1.11074, -0.2695794, 2.511647, 1, 0, 0.7137255, 1,
1.112908, 1.02549, 1.550029, 1, 0, 0.7098039, 1,
1.124595, -0.02696275, 1.099463, 1, 0, 0.7019608, 1,
1.132859, -0.9615327, 1.432004, 1, 0, 0.6941177, 1,
1.134367, -0.4059372, 1.20149, 1, 0, 0.6901961, 1,
1.135385, -0.02170435, 2.160742, 1, 0, 0.682353, 1,
1.138349, 0.5317241, -0.02012421, 1, 0, 0.6784314, 1,
1.140576, 0.497537, 0.06178562, 1, 0, 0.6705883, 1,
1.141986, 0.6157974, 2.639113, 1, 0, 0.6666667, 1,
1.148749, 1.096024, -0.3583224, 1, 0, 0.6588235, 1,
1.155932, -1.741354, 2.449601, 1, 0, 0.654902, 1,
1.158296, -0.414883, 0.437829, 1, 0, 0.6470588, 1,
1.162342, -1.197099, 1.685324, 1, 0, 0.6431373, 1,
1.168359, 1.074536, 2.016126, 1, 0, 0.6352941, 1,
1.170488, 1.036554, 0.06861539, 1, 0, 0.6313726, 1,
1.171689, -0.1180589, 2.506963, 1, 0, 0.6235294, 1,
1.173779, -0.1541693, 0.8448291, 1, 0, 0.6196079, 1,
1.177367, 0.259393, 3.193118, 1, 0, 0.6117647, 1,
1.179967, -0.5844099, -0.4309802, 1, 0, 0.6078432, 1,
1.180051, -1.120069, 2.028103, 1, 0, 0.6, 1,
1.192232, 0.3611378, 0.8561848, 1, 0, 0.5921569, 1,
1.195756, -0.3984011, 0.9681426, 1, 0, 0.5882353, 1,
1.212828, -1.065622, 2.36263, 1, 0, 0.5803922, 1,
1.21324, 1.622471, 1.95791, 1, 0, 0.5764706, 1,
1.218255, 0.7375184, 0.7774863, 1, 0, 0.5686275, 1,
1.218713, -2.118646, 1.229282, 1, 0, 0.5647059, 1,
1.222322, 1.576764, 0.5778917, 1, 0, 0.5568628, 1,
1.228198, -0.2102925, 2.148416, 1, 0, 0.5529412, 1,
1.23035, -0.05286351, 2.763325, 1, 0, 0.5450981, 1,
1.232901, -0.611425, 1.364209, 1, 0, 0.5411765, 1,
1.234831, -0.8291111, 1.139796, 1, 0, 0.5333334, 1,
1.247182, -1.808713, 3.403391, 1, 0, 0.5294118, 1,
1.258161, 0.2265554, -0.5047137, 1, 0, 0.5215687, 1,
1.262883, -0.6898043, 3.841224, 1, 0, 0.5176471, 1,
1.275443, -0.1960048, 1.48814, 1, 0, 0.509804, 1,
1.276383, 1.914156, 0.8448371, 1, 0, 0.5058824, 1,
1.280168, -0.398554, 2.059844, 1, 0, 0.4980392, 1,
1.286044, -0.1790454, 1.808148, 1, 0, 0.4901961, 1,
1.312546, -1.49194, 4.21909, 1, 0, 0.4862745, 1,
1.313613, 0.2606075, -0.5483644, 1, 0, 0.4784314, 1,
1.315359, 0.3002224, 3.104349, 1, 0, 0.4745098, 1,
1.321558, 1.013207, 0.8504108, 1, 0, 0.4666667, 1,
1.327348, -1.371245, 3.156669, 1, 0, 0.4627451, 1,
1.331479, 2.516628, -0.2009663, 1, 0, 0.454902, 1,
1.332357, 0.2833986, 0.6073363, 1, 0, 0.4509804, 1,
1.335348, 1.893394, 1.943357, 1, 0, 0.4431373, 1,
1.34413, -0.7257299, 1.671311, 1, 0, 0.4392157, 1,
1.348138, 0.7421641, 0.01636835, 1, 0, 0.4313726, 1,
1.34878, 1.70952, 1.182157, 1, 0, 0.427451, 1,
1.351771, -0.3563117, 1.472679, 1, 0, 0.4196078, 1,
1.359366, 1.919517, 0.6601046, 1, 0, 0.4156863, 1,
1.36238, -0.02036532, 1.535813, 1, 0, 0.4078431, 1,
1.373273, -0.1562185, 0.8988111, 1, 0, 0.4039216, 1,
1.378204, 0.3302006, -0.4300052, 1, 0, 0.3960784, 1,
1.389964, -0.3637535, 2.258587, 1, 0, 0.3882353, 1,
1.405555, 0.4268856, 0.180306, 1, 0, 0.3843137, 1,
1.410047, -1.187723, 2.171707, 1, 0, 0.3764706, 1,
1.427055, -0.7818617, 1.623531, 1, 0, 0.372549, 1,
1.443049, 0.6270303, 1.885627, 1, 0, 0.3647059, 1,
1.449937, -0.3233843, 1.066908, 1, 0, 0.3607843, 1,
1.463478, -0.6237404, 1.210469, 1, 0, 0.3529412, 1,
1.491197, -0.3872115, 0.5056558, 1, 0, 0.3490196, 1,
1.497756, 0.4023195, -1.139262, 1, 0, 0.3411765, 1,
1.506663, 0.2921169, 0.4795412, 1, 0, 0.3372549, 1,
1.507776, -0.5318587, 3.619541, 1, 0, 0.3294118, 1,
1.519152, -0.5871118, 2.109117, 1, 0, 0.3254902, 1,
1.525394, -0.1228036, 2.303085, 1, 0, 0.3176471, 1,
1.527463, 0.4163431, 0.9764346, 1, 0, 0.3137255, 1,
1.537955, 0.6294329, 1.454836, 1, 0, 0.3058824, 1,
1.544029, -1.101687, 3.778712, 1, 0, 0.2980392, 1,
1.558525, -1.890095, 1.329704, 1, 0, 0.2941177, 1,
1.558668, 0.2138863, 1.199824, 1, 0, 0.2862745, 1,
1.559574, 0.3581913, 0.7419265, 1, 0, 0.282353, 1,
1.563959, -0.5116376, 3.488513, 1, 0, 0.2745098, 1,
1.567389, -0.5886843, 2.381814, 1, 0, 0.2705882, 1,
1.572076, -1.43986, 2.425974, 1, 0, 0.2627451, 1,
1.599142, 0.06579906, 1.179036, 1, 0, 0.2588235, 1,
1.605311, -1.855262, 2.297058, 1, 0, 0.2509804, 1,
1.640056, -0.8949406, 1.956404, 1, 0, 0.2470588, 1,
1.648202, -1.314772, 2.114401, 1, 0, 0.2392157, 1,
1.657828, 0.5557726, -0.2605484, 1, 0, 0.2352941, 1,
1.663059, 0.6871058, 1.57124, 1, 0, 0.227451, 1,
1.713879, -1.104784, 2.768636, 1, 0, 0.2235294, 1,
1.720863, -0.525739, 4.209219, 1, 0, 0.2156863, 1,
1.750473, -0.3548824, 0.8172272, 1, 0, 0.2117647, 1,
1.773626, 1.154588, 2.582498, 1, 0, 0.2039216, 1,
1.794881, 0.7291028, 2.672636, 1, 0, 0.1960784, 1,
1.803956, 0.7382785, 1.134733, 1, 0, 0.1921569, 1,
1.807327, 0.2246117, 1.612935, 1, 0, 0.1843137, 1,
1.814358, -0.2099202, 0.7181652, 1, 0, 0.1803922, 1,
1.814811, 1.258961, 1.485027, 1, 0, 0.172549, 1,
1.839915, -0.1100954, 1.751697, 1, 0, 0.1686275, 1,
1.84544, -0.2736117, 2.689738, 1, 0, 0.1607843, 1,
1.901203, -1.518685, 1.89374, 1, 0, 0.1568628, 1,
1.906319, 0.6677977, 0.7236415, 1, 0, 0.1490196, 1,
1.914825, 0.6002632, 2.447671, 1, 0, 0.145098, 1,
1.921764, -0.461568, -0.1683401, 1, 0, 0.1372549, 1,
1.929336, -1.010824, 1.34822, 1, 0, 0.1333333, 1,
1.932621, 0.07495183, 2.180899, 1, 0, 0.1254902, 1,
1.991679, -0.1596165, 1.22734, 1, 0, 0.1215686, 1,
2.060523, 0.5647517, 1.908334, 1, 0, 0.1137255, 1,
2.060623, -0.9043215, 3.089573, 1, 0, 0.1098039, 1,
2.080793, 0.4862653, 1.110667, 1, 0, 0.1019608, 1,
2.107815, -0.03798647, 3.090091, 1, 0, 0.09411765, 1,
2.205165, -0.185765, 1.347852, 1, 0, 0.09019608, 1,
2.252177, -1.435771, 1.153227, 1, 0, 0.08235294, 1,
2.255028, -0.4662859, 2.025642, 1, 0, 0.07843138, 1,
2.36343, -0.1321515, 1.169596, 1, 0, 0.07058824, 1,
2.400079, -0.1083267, 3.009, 1, 0, 0.06666667, 1,
2.413137, -0.06144727, 2.687574, 1, 0, 0.05882353, 1,
2.452564, -0.1657593, 1.532549, 1, 0, 0.05490196, 1,
2.460228, -1.281369, 1.283932, 1, 0, 0.04705882, 1,
2.478243, -0.7695522, 3.002884, 1, 0, 0.04313726, 1,
2.499987, -1.308839, 3.502257, 1, 0, 0.03529412, 1,
2.614814, 0.04536274, 0.5119674, 1, 0, 0.03137255, 1,
2.689654, -0.4835013, 0.8350633, 1, 0, 0.02352941, 1,
2.798186, -0.174404, -0.06183609, 1, 0, 0.01960784, 1,
3.036648, -0.6120412, 1.147427, 1, 0, 0.01176471, 1,
4.000894, 0.4287359, 0.5791969, 1, 0, 0.007843138, 1
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
0.4280177, -4.598738, -7.171312, 0, -0.5, 0.5, 0.5,
0.4280177, -4.598738, -7.171312, 1, -0.5, 0.5, 0.5,
0.4280177, -4.598738, -7.171312, 1, 1.5, 0.5, 0.5,
0.4280177, -4.598738, -7.171312, 0, 1.5, 0.5, 0.5
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
-4.356063, 0.3073876, -7.171312, 0, -0.5, 0.5, 0.5,
-4.356063, 0.3073876, -7.171312, 1, -0.5, 0.5, 0.5,
-4.356063, 0.3073876, -7.171312, 1, 1.5, 0.5, 0.5,
-4.356063, 0.3073876, -7.171312, 0, 1.5, 0.5, 0.5
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
-4.356063, -4.598738, -0.03918695, 0, -0.5, 0.5, 0.5,
-4.356063, -4.598738, -0.03918695, 1, -0.5, 0.5, 0.5,
-4.356063, -4.598738, -0.03918695, 1, 1.5, 0.5, 0.5,
-4.356063, -4.598738, -0.03918695, 0, 1.5, 0.5, 0.5
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
-2, -3.466555, -5.525437,
4, -3.466555, -5.525437,
-2, -3.466555, -5.525437,
-2, -3.655252, -5.799749,
0, -3.466555, -5.525437,
0, -3.655252, -5.799749,
2, -3.466555, -5.525437,
2, -3.655252, -5.799749,
4, -3.466555, -5.525437,
4, -3.655252, -5.799749
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
"0",
"2",
"4"
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
-2, -4.032646, -6.348374, 0, -0.5, 0.5, 0.5,
-2, -4.032646, -6.348374, 1, -0.5, 0.5, 0.5,
-2, -4.032646, -6.348374, 1, 1.5, 0.5, 0.5,
-2, -4.032646, -6.348374, 0, 1.5, 0.5, 0.5,
0, -4.032646, -6.348374, 0, -0.5, 0.5, 0.5,
0, -4.032646, -6.348374, 1, -0.5, 0.5, 0.5,
0, -4.032646, -6.348374, 1, 1.5, 0.5, 0.5,
0, -4.032646, -6.348374, 0, 1.5, 0.5, 0.5,
2, -4.032646, -6.348374, 0, -0.5, 0.5, 0.5,
2, -4.032646, -6.348374, 1, -0.5, 0.5, 0.5,
2, -4.032646, -6.348374, 1, 1.5, 0.5, 0.5,
2, -4.032646, -6.348374, 0, 1.5, 0.5, 0.5,
4, -4.032646, -6.348374, 0, -0.5, 0.5, 0.5,
4, -4.032646, -6.348374, 1, -0.5, 0.5, 0.5,
4, -4.032646, -6.348374, 1, 1.5, 0.5, 0.5,
4, -4.032646, -6.348374, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.252044, -2, -5.525437,
-3.252044, 2, -5.525437,
-3.252044, -2, -5.525437,
-3.436048, -2, -5.799749,
-3.252044, 0, -5.525437,
-3.436048, 0, -5.799749,
-3.252044, 2, -5.525437,
-3.436048, 2, -5.799749
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
"0",
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
-3.804054, -2, -6.348374, 0, -0.5, 0.5, 0.5,
-3.804054, -2, -6.348374, 1, -0.5, 0.5, 0.5,
-3.804054, -2, -6.348374, 1, 1.5, 0.5, 0.5,
-3.804054, -2, -6.348374, 0, 1.5, 0.5, 0.5,
-3.804054, 0, -6.348374, 0, -0.5, 0.5, 0.5,
-3.804054, 0, -6.348374, 1, -0.5, 0.5, 0.5,
-3.804054, 0, -6.348374, 1, 1.5, 0.5, 0.5,
-3.804054, 0, -6.348374, 0, 1.5, 0.5, 0.5,
-3.804054, 2, -6.348374, 0, -0.5, 0.5, 0.5,
-3.804054, 2, -6.348374, 1, -0.5, 0.5, 0.5,
-3.804054, 2, -6.348374, 1, 1.5, 0.5, 0.5,
-3.804054, 2, -6.348374, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.252044, -3.466555, -4,
-3.252044, -3.466555, 4,
-3.252044, -3.466555, -4,
-3.436048, -3.655252, -4,
-3.252044, -3.466555, -2,
-3.436048, -3.655252, -2,
-3.252044, -3.466555, 0,
-3.436048, -3.655252, 0,
-3.252044, -3.466555, 2,
-3.436048, -3.655252, 2,
-3.252044, -3.466555, 4,
-3.436048, -3.655252, 4
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
-3.804054, -4.032646, -4, 0, -0.5, 0.5, 0.5,
-3.804054, -4.032646, -4, 1, -0.5, 0.5, 0.5,
-3.804054, -4.032646, -4, 1, 1.5, 0.5, 0.5,
-3.804054, -4.032646, -4, 0, 1.5, 0.5, 0.5,
-3.804054, -4.032646, -2, 0, -0.5, 0.5, 0.5,
-3.804054, -4.032646, -2, 1, -0.5, 0.5, 0.5,
-3.804054, -4.032646, -2, 1, 1.5, 0.5, 0.5,
-3.804054, -4.032646, -2, 0, 1.5, 0.5, 0.5,
-3.804054, -4.032646, 0, 0, -0.5, 0.5, 0.5,
-3.804054, -4.032646, 0, 1, -0.5, 0.5, 0.5,
-3.804054, -4.032646, 0, 1, 1.5, 0.5, 0.5,
-3.804054, -4.032646, 0, 0, 1.5, 0.5, 0.5,
-3.804054, -4.032646, 2, 0, -0.5, 0.5, 0.5,
-3.804054, -4.032646, 2, 1, -0.5, 0.5, 0.5,
-3.804054, -4.032646, 2, 1, 1.5, 0.5, 0.5,
-3.804054, -4.032646, 2, 0, 1.5, 0.5, 0.5,
-3.804054, -4.032646, 4, 0, -0.5, 0.5, 0.5,
-3.804054, -4.032646, 4, 1, -0.5, 0.5, 0.5,
-3.804054, -4.032646, 4, 1, 1.5, 0.5, 0.5,
-3.804054, -4.032646, 4, 0, 1.5, 0.5, 0.5
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
-3.252044, -3.466555, -5.525437,
-3.252044, 4.08133, -5.525437,
-3.252044, -3.466555, 5.447063,
-3.252044, 4.08133, 5.447063,
-3.252044, -3.466555, -5.525437,
-3.252044, -3.466555, 5.447063,
-3.252044, 4.08133, -5.525437,
-3.252044, 4.08133, 5.447063,
-3.252044, -3.466555, -5.525437,
4.10808, -3.466555, -5.525437,
-3.252044, -3.466555, 5.447063,
4.10808, -3.466555, 5.447063,
-3.252044, 4.08133, -5.525437,
4.10808, 4.08133, -5.525437,
-3.252044, 4.08133, 5.447063,
4.10808, 4.08133, 5.447063,
4.10808, -3.466555, -5.525437,
4.10808, 4.08133, -5.525437,
4.10808, -3.466555, 5.447063,
4.10808, 4.08133, 5.447063,
4.10808, -3.466555, -5.525437,
4.10808, -3.466555, 5.447063,
4.10808, 4.08133, -5.525437,
4.10808, 4.08133, 5.447063
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
var radius = 8.125243;
var distance = 36.15013;
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
mvMatrix.translate( -0.4280177, -0.3073876, 0.03918695 );
mvMatrix.scale( 1.193617, 1.163925, 0.8006537 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.15013);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
S-bioallethrin<-read.table("S-bioallethrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-S-bioallethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
y<-S-bioallethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
z<-S-bioallethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
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
-3.144858, 1.521819, -1.41449, 0, 0, 1, 1, 1,
-2.87793, -0.3754012, -0.8897645, 1, 0, 0, 1, 1,
-2.840907, -2.660652, -3.135887, 1, 0, 0, 1, 1,
-2.619148, 0.4229896, -0.8410537, 1, 0, 0, 1, 1,
-2.549079, 0.4675046, -1.248742, 1, 0, 0, 1, 1,
-2.535566, 0.06525024, -2.113999, 1, 0, 0, 1, 1,
-2.497772, -0.5448799, -0.9899126, 0, 0, 0, 1, 1,
-2.482068, 1.155692, -0.7426879, 0, 0, 0, 1, 1,
-2.458483, -0.5707353, -1.467874, 0, 0, 0, 1, 1,
-2.444327, 0.3073961, -2.020756, 0, 0, 0, 1, 1,
-2.386842, -0.5476435, -0.8040758, 0, 0, 0, 1, 1,
-2.322329, -0.4336304, -1.06306, 0, 0, 0, 1, 1,
-2.308947, -1.905295, -3.938923, 0, 0, 0, 1, 1,
-2.299597, -1.280894, -1.962088, 1, 1, 1, 1, 1,
-2.265236, 1.546394, -1.329082, 1, 1, 1, 1, 1,
-2.253921, 0.4680217, -1.551863, 1, 1, 1, 1, 1,
-2.18063, 0.5832918, -2.31767, 1, 1, 1, 1, 1,
-2.114531, 0.04698902, -1.357346, 1, 1, 1, 1, 1,
-2.107227, 0.7897589, -0.831857, 1, 1, 1, 1, 1,
-2.079433, 0.6288343, -0.9715072, 1, 1, 1, 1, 1,
-2.050015, -1.073842, -2.613185, 1, 1, 1, 1, 1,
-2.045933, -3.356634, -2.097413, 1, 1, 1, 1, 1,
-2.004936, 1.135177, -1.875491, 1, 1, 1, 1, 1,
-1.986867, -1.270085, -3.137296, 1, 1, 1, 1, 1,
-1.969163, 1.048575, -2.064051, 1, 1, 1, 1, 1,
-1.946991, -1.115031, -1.37761, 1, 1, 1, 1, 1,
-1.946348, -1.5598, -1.893391, 1, 1, 1, 1, 1,
-1.934249, -0.3484884, -1.84245, 1, 1, 1, 1, 1,
-1.929782, -0.2929468, -1.755332, 0, 0, 1, 1, 1,
-1.863279, 2.293272, -1.351292, 1, 0, 0, 1, 1,
-1.785595, 0.1934853, -2.005702, 1, 0, 0, 1, 1,
-1.770325, -0.6717207, -1.071905, 1, 0, 0, 1, 1,
-1.750771, 0.4398412, -1.043517, 1, 0, 0, 1, 1,
-1.74975, 1.631612, 0.3353944, 1, 0, 0, 1, 1,
-1.744186, 0.8681245, -1.855809, 0, 0, 0, 1, 1,
-1.734244, -0.6591473, -1.294328, 0, 0, 0, 1, 1,
-1.727043, 0.6375383, -2.735061, 0, 0, 0, 1, 1,
-1.722248, 0.2446684, -1.450405, 0, 0, 0, 1, 1,
-1.71904, 0.6256765, -1.237965, 0, 0, 0, 1, 1,
-1.716597, -1.032445, -2.043464, 0, 0, 0, 1, 1,
-1.711916, 0.5220553, -0.6995121, 0, 0, 0, 1, 1,
-1.70808, -1.079031, -0.7682267, 1, 1, 1, 1, 1,
-1.705239, -0.8405976, -2.234071, 1, 1, 1, 1, 1,
-1.70403, -2.047841, -3.06202, 1, 1, 1, 1, 1,
-1.681324, 0.4449402, -1.953876, 1, 1, 1, 1, 1,
-1.678339, 0.4151019, -2.639418, 1, 1, 1, 1, 1,
-1.666685, 0.1698304, -2.852941, 1, 1, 1, 1, 1,
-1.635633, 0.1396299, -3.462948, 1, 1, 1, 1, 1,
-1.630568, -0.7291615, -2.128871, 1, 1, 1, 1, 1,
-1.621624, 0.05161345, -1.02655, 1, 1, 1, 1, 1,
-1.618136, 0.05856163, -1.294132, 1, 1, 1, 1, 1,
-1.604733, 1.015668, -1.585159, 1, 1, 1, 1, 1,
-1.587637, 0.08759524, -0.0349134, 1, 1, 1, 1, 1,
-1.585773, -1.538825, -3.63311, 1, 1, 1, 1, 1,
-1.579606, 0.1011033, -1.371941, 1, 1, 1, 1, 1,
-1.563246, 0.6071222, 0.3284331, 1, 1, 1, 1, 1,
-1.563187, 0.1959317, -1.494216, 0, 0, 1, 1, 1,
-1.546582, -1.990295, -1.351377, 1, 0, 0, 1, 1,
-1.546223, 0.3591788, -1.066096, 1, 0, 0, 1, 1,
-1.542154, -0.2345687, -1.290883, 1, 0, 0, 1, 1,
-1.505785, 1.336484, -1.334856, 1, 0, 0, 1, 1,
-1.502287, -1.660817, -2.053897, 1, 0, 0, 1, 1,
-1.494202, 1.2004, -2.330926, 0, 0, 0, 1, 1,
-1.487328, 0.8607831, -0.4493892, 0, 0, 0, 1, 1,
-1.484378, 0.3731026, -3.102005, 0, 0, 0, 1, 1,
-1.479098, -0.0873346, -2.6031, 0, 0, 0, 1, 1,
-1.477773, 0.07782029, -1.861558, 0, 0, 0, 1, 1,
-1.475561, 0.6354387, 0.02445057, 0, 0, 0, 1, 1,
-1.463234, 1.420986, -2.388193, 0, 0, 0, 1, 1,
-1.462872, 0.6506397, -2.014758, 1, 1, 1, 1, 1,
-1.455096, -0.8269535, -2.393497, 1, 1, 1, 1, 1,
-1.453866, 0.4930849, -0.6836818, 1, 1, 1, 1, 1,
-1.447962, -1.082084, -2.372637, 1, 1, 1, 1, 1,
-1.445342, 0.09025766, -1.532036, 1, 1, 1, 1, 1,
-1.426107, 1.437946, -0.1302671, 1, 1, 1, 1, 1,
-1.423042, -1.476773, -1.661544, 1, 1, 1, 1, 1,
-1.416938, -0.3517417, -2.629763, 1, 1, 1, 1, 1,
-1.385586, 0.368843, -2.202415, 1, 1, 1, 1, 1,
-1.367105, 0.5601474, -0.9693254, 1, 1, 1, 1, 1,
-1.364766, -0.4281513, -0.9006516, 1, 1, 1, 1, 1,
-1.360263, -0.7093371, -3.769249, 1, 1, 1, 1, 1,
-1.356918, -0.4499418, -0.8645074, 1, 1, 1, 1, 1,
-1.351701, 0.06643343, -1.358465, 1, 1, 1, 1, 1,
-1.340672, -0.7445591, -3.138601, 1, 1, 1, 1, 1,
-1.33367, -0.7724851, -1.987552, 0, 0, 1, 1, 1,
-1.329709, -0.7720421, -3.092097, 1, 0, 0, 1, 1,
-1.326955, 1.426609, 0.4991698, 1, 0, 0, 1, 1,
-1.324298, -1.925887, -3.567117, 1, 0, 0, 1, 1,
-1.32025, -0.8905475, -0.6900417, 1, 0, 0, 1, 1,
-1.31946, -0.7100579, 0.1682599, 1, 0, 0, 1, 1,
-1.315217, 0.4624145, 0.2278568, 0, 0, 0, 1, 1,
-1.304831, 0.6451126, -0.3475685, 0, 0, 0, 1, 1,
-1.297926, 0.1871068, -2.587755, 0, 0, 0, 1, 1,
-1.287222, -1.075443, -2.669517, 0, 0, 0, 1, 1,
-1.285403, 0.733341, -1.315248, 0, 0, 0, 1, 1,
-1.273021, 1.093186, -0.3971996, 0, 0, 0, 1, 1,
-1.271852, -0.02196688, -1.474136, 0, 0, 0, 1, 1,
-1.248798, 0.8121822, -0.6220461, 1, 1, 1, 1, 1,
-1.245779, 0.04545409, -1.502898, 1, 1, 1, 1, 1,
-1.227599, -0.2975534, -2.170967, 1, 1, 1, 1, 1,
-1.208758, 0.3739419, -2.415062, 1, 1, 1, 1, 1,
-1.192613, -0.8106744, -2.948142, 1, 1, 1, 1, 1,
-1.172708, -1.683838, -2.367796, 1, 1, 1, 1, 1,
-1.164992, -1.606307, -4.072206, 1, 1, 1, 1, 1,
-1.163487, 0.8305464, -1.479439, 1, 1, 1, 1, 1,
-1.160532, 0.1942447, -0.9773486, 1, 1, 1, 1, 1,
-1.159049, -0.6977645, -3.136314, 1, 1, 1, 1, 1,
-1.149105, 1.264654, -2.25007, 1, 1, 1, 1, 1,
-1.147694, -0.5604138, -3.152224, 1, 1, 1, 1, 1,
-1.147453, -1.835618, -2.698627, 1, 1, 1, 1, 1,
-1.1404, -1.331184, -1.852422, 1, 1, 1, 1, 1,
-1.139483, -0.8119549, -3.914247, 1, 1, 1, 1, 1,
-1.13884, 0.5194337, -0.199969, 0, 0, 1, 1, 1,
-1.131797, 0.8743478, -1.628119, 1, 0, 0, 1, 1,
-1.123421, 0.09784568, -2.23607, 1, 0, 0, 1, 1,
-1.12288, 0.5345469, 1.32551, 1, 0, 0, 1, 1,
-1.120994, 0.5463547, -0.6944221, 1, 0, 0, 1, 1,
-1.11847, 1.236621, 0.02840916, 1, 0, 0, 1, 1,
-1.11566, 0.3276574, -0.4383763, 0, 0, 0, 1, 1,
-1.109509, -0.1028647, -3.20566, 0, 0, 0, 1, 1,
-1.108631, 1.123405, -2.353133, 0, 0, 0, 1, 1,
-1.105362, -0.7884889, -2.377141, 0, 0, 0, 1, 1,
-1.101397, 0.5221407, -0.8383236, 0, 0, 0, 1, 1,
-1.10132, -0.7929128, -2.661246, 0, 0, 0, 1, 1,
-1.099364, 0.02803098, -1.645903, 0, 0, 0, 1, 1,
-1.095775, -0.2139254, -0.5026894, 1, 1, 1, 1, 1,
-1.094715, 0.6932762, -1.438679, 1, 1, 1, 1, 1,
-1.08929, 1.106078, -0.6236082, 1, 1, 1, 1, 1,
-1.087894, 0.09364647, -2.827202, 1, 1, 1, 1, 1,
-1.087635, 1.590618, -1.953389, 1, 1, 1, 1, 1,
-1.075881, -0.434784, -3.100899, 1, 1, 1, 1, 1,
-1.07285, 0.3559086, -0.7437016, 1, 1, 1, 1, 1,
-1.059033, 1.347235, -1.776189, 1, 1, 1, 1, 1,
-1.058603, 0.2103588, -1.324188, 1, 1, 1, 1, 1,
-1.04571, -0.9744569, -3.126319, 1, 1, 1, 1, 1,
-1.045305, -0.4033316, -2.189146, 1, 1, 1, 1, 1,
-1.042711, 0.4876681, -1.555483, 1, 1, 1, 1, 1,
-1.039113, 0.264941, 1.097328, 1, 1, 1, 1, 1,
-1.028939, -0.6254852, -1.286393, 1, 1, 1, 1, 1,
-1.025934, -0.1412362, -1.192038, 1, 1, 1, 1, 1,
-1.019462, -0.2042286, -3.042009, 0, 0, 1, 1, 1,
-1.018564, -0.7313133, 0.6832622, 1, 0, 0, 1, 1,
-1.017805, -1.243862, -2.505363, 1, 0, 0, 1, 1,
-1.013129, 0.153263, -0.3106947, 1, 0, 0, 1, 1,
-1.006669, 1.544067, -1.485058, 1, 0, 0, 1, 1,
-1.005913, -1.465302, -2.210498, 1, 0, 0, 1, 1,
-1.001888, -1.127587, -2.601154, 0, 0, 0, 1, 1,
-1.001077, 0.9771358, -0.8001409, 0, 0, 0, 1, 1,
-0.9878832, -0.9743707, -2.044532, 0, 0, 0, 1, 1,
-0.9856569, 1.358739, -0.1173484, 0, 0, 0, 1, 1,
-0.9847814, -0.0007898763, -0.6443981, 0, 0, 0, 1, 1,
-0.9813673, -0.4868396, -1.939192, 0, 0, 0, 1, 1,
-0.9796438, -0.1764427, -1.788833, 0, 0, 0, 1, 1,
-0.9754369, 1.031299, 0.2960698, 1, 1, 1, 1, 1,
-0.9750782, -0.488916, -0.7146721, 1, 1, 1, 1, 1,
-0.973538, -0.1239065, -3.02989, 1, 1, 1, 1, 1,
-0.9726571, -0.9639419, -2.687759, 1, 1, 1, 1, 1,
-0.9641995, 2.570798, -1.104954, 1, 1, 1, 1, 1,
-0.9633685, 2.006888, -1.416991, 1, 1, 1, 1, 1,
-0.9599841, -0.08417394, -0.9169319, 1, 1, 1, 1, 1,
-0.9563709, 0.9152425, -1.71528, 1, 1, 1, 1, 1,
-0.9550288, -0.01448289, -3.252441, 1, 1, 1, 1, 1,
-0.9510705, 0.1462813, -0.7879528, 1, 1, 1, 1, 1,
-0.950676, -0.003779837, -1.620587, 1, 1, 1, 1, 1,
-0.9466507, -1.130787, -1.622587, 1, 1, 1, 1, 1,
-0.9430673, -1.106346, -5.007808, 1, 1, 1, 1, 1,
-0.9394712, -2.230381, -1.802889, 1, 1, 1, 1, 1,
-0.936811, -1.833912, -4.306949, 1, 1, 1, 1, 1,
-0.9339846, -1.986076, -1.298499, 0, 0, 1, 1, 1,
-0.93035, 1.555485, -0.5749946, 1, 0, 0, 1, 1,
-0.9303255, 0.1712278, -1.599451, 1, 0, 0, 1, 1,
-0.9270947, -1.736157, -1.469934, 1, 0, 0, 1, 1,
-0.9256759, 0.04400742, -1.093077, 1, 0, 0, 1, 1,
-0.9229488, -1.801956, -2.014446, 1, 0, 0, 1, 1,
-0.9178224, 0.3110105, -1.579441, 0, 0, 0, 1, 1,
-0.9173313, -0.04033665, -1.513587, 0, 0, 0, 1, 1,
-0.9137604, -0.9013494, -3.146636, 0, 0, 0, 1, 1,
-0.9124174, -0.2346358, -0.8910345, 0, 0, 0, 1, 1,
-0.9117618, -1.061072, -2.978908, 0, 0, 0, 1, 1,
-0.9104531, -0.15036, -2.200935, 0, 0, 0, 1, 1,
-0.9078725, 0.4089259, -2.809412, 0, 0, 0, 1, 1,
-0.9005697, -1.026041, -2.955845, 1, 1, 1, 1, 1,
-0.8975182, 0.5416238, -0.6390505, 1, 1, 1, 1, 1,
-0.89575, 0.9480862, 0.540581, 1, 1, 1, 1, 1,
-0.8942769, -1.099206, -3.256564, 1, 1, 1, 1, 1,
-0.8941745, -2.488654, -2.623432, 1, 1, 1, 1, 1,
-0.8921278, -0.729261, -0.9428977, 1, 1, 1, 1, 1,
-0.8864675, -1.120149, -2.972475, 1, 1, 1, 1, 1,
-0.8782849, 0.2402358, 1.114293, 1, 1, 1, 1, 1,
-0.8642155, -0.2487834, -2.459135, 1, 1, 1, 1, 1,
-0.8584089, -0.146477, -1.41673, 1, 1, 1, 1, 1,
-0.8536242, -0.232336, -2.294669, 1, 1, 1, 1, 1,
-0.8481176, -0.1152508, -1.216739, 1, 1, 1, 1, 1,
-0.8463498, -0.2194511, -0.5300002, 1, 1, 1, 1, 1,
-0.8462831, 1.317849, -1.235883, 1, 1, 1, 1, 1,
-0.842346, 0.4723711, -1.045946, 1, 1, 1, 1, 1,
-0.8383785, 0.1980303, -1.023075, 0, 0, 1, 1, 1,
-0.8318855, -0.3379568, -2.268716, 1, 0, 0, 1, 1,
-0.8311162, -0.462672, -1.079202, 1, 0, 0, 1, 1,
-0.8270037, 0.2478382, -0.6975623, 1, 0, 0, 1, 1,
-0.8248643, 1.213635, -0.3739317, 1, 0, 0, 1, 1,
-0.8244134, 0.9720491, -1.719185, 1, 0, 0, 1, 1,
-0.8198987, 0.7042961, 0.2510321, 0, 0, 0, 1, 1,
-0.8166962, 1.244532, -1.901136, 0, 0, 0, 1, 1,
-0.8095174, 0.6069909, 0.4596186, 0, 0, 0, 1, 1,
-0.8073695, -1.496669, -2.522555, 0, 0, 0, 1, 1,
-0.8041095, -1.150927, -1.891233, 0, 0, 0, 1, 1,
-0.7985906, 0.132054, -1.62605, 0, 0, 0, 1, 1,
-0.7960537, 0.2911332, -1.198837, 0, 0, 0, 1, 1,
-0.7920356, 0.4578852, -2.453332, 1, 1, 1, 1, 1,
-0.7902499, -1.213139, -0.998984, 1, 1, 1, 1, 1,
-0.7882447, 0.1735417, -2.716479, 1, 1, 1, 1, 1,
-0.7789859, -0.2609133, -2.296729, 1, 1, 1, 1, 1,
-0.7782978, 0.9324733, -1.949644, 1, 1, 1, 1, 1,
-0.7779246, 1.849783, -0.9954029, 1, 1, 1, 1, 1,
-0.7749543, -0.4039273, -1.504833, 1, 1, 1, 1, 1,
-0.769433, -1.517263, -3.287752, 1, 1, 1, 1, 1,
-0.7662878, -0.8314167, -2.516854, 1, 1, 1, 1, 1,
-0.7646651, 0.5729308, 0.1087103, 1, 1, 1, 1, 1,
-0.7605627, 0.09592513, -0.5882639, 1, 1, 1, 1, 1,
-0.7551086, -0.4408673, -2.516511, 1, 1, 1, 1, 1,
-0.7512649, 1.496271, 0.9406949, 1, 1, 1, 1, 1,
-0.7503117, 0.2020672, -2.436196, 1, 1, 1, 1, 1,
-0.7496766, 0.5960325, -1.212622, 1, 1, 1, 1, 1,
-0.7408088, -2.304887, -2.514177, 0, 0, 1, 1, 1,
-0.7403507, 0.6546792, 0.06540202, 1, 0, 0, 1, 1,
-0.7355145, -2.08634, -2.606821, 1, 0, 0, 1, 1,
-0.7335213, 1.067114, -1.865822, 1, 0, 0, 1, 1,
-0.733087, -0.210377, -3.048872, 1, 0, 0, 1, 1,
-0.7305838, -0.4609607, -3.183346, 1, 0, 0, 1, 1,
-0.7273919, -0.8185839, -3.603319, 0, 0, 0, 1, 1,
-0.725866, -0.1018299, -0.5760894, 0, 0, 0, 1, 1,
-0.7234287, -1.411586, -2.393736, 0, 0, 0, 1, 1,
-0.7226877, -0.2540357, 0.04981684, 0, 0, 0, 1, 1,
-0.7197196, 0.9779351, -0.7008374, 0, 0, 0, 1, 1,
-0.7192661, 1.486711, -2.040822, 0, 0, 0, 1, 1,
-0.7157088, -0.4777954, -4.461292, 0, 0, 0, 1, 1,
-0.7124128, 0.7313026, -1.067336, 1, 1, 1, 1, 1,
-0.7123281, -1.103631, -2.524215, 1, 1, 1, 1, 1,
-0.7049289, -0.09062699, -1.249233, 1, 1, 1, 1, 1,
-0.6975738, 0.152985, -0.927634, 1, 1, 1, 1, 1,
-0.6970291, -0.2616265, -1.38018, 1, 1, 1, 1, 1,
-0.6895422, -0.6630028, -2.733757, 1, 1, 1, 1, 1,
-0.6881605, 0.5578471, 1.378824, 1, 1, 1, 1, 1,
-0.6880301, -0.7116825, -2.062134, 1, 1, 1, 1, 1,
-0.6869887, -0.1631731, -2.432459, 1, 1, 1, 1, 1,
-0.6865929, -0.2611842, -1.540868, 1, 1, 1, 1, 1,
-0.6843784, -0.617573, -4.252776, 1, 1, 1, 1, 1,
-0.6843193, 0.200399, -2.045028, 1, 1, 1, 1, 1,
-0.67606, 0.2290998, -0.6981283, 1, 1, 1, 1, 1,
-0.6681924, 0.6722289, -1.029435, 1, 1, 1, 1, 1,
-0.6649195, 0.3522981, -2.736026, 1, 1, 1, 1, 1,
-0.6557555, -0.4163726, -0.4938772, 0, 0, 1, 1, 1,
-0.6545281, 0.6384593, -2.039618, 1, 0, 0, 1, 1,
-0.6544577, 1.373627, -0.6920273, 1, 0, 0, 1, 1,
-0.6544542, 0.01958634, -1.990047, 1, 0, 0, 1, 1,
-0.6505452, 0.05331605, -0.2398524, 1, 0, 0, 1, 1,
-0.6367484, -0.007247051, -1.375764, 1, 0, 0, 1, 1,
-0.6338454, 0.4363724, -1.355311, 0, 0, 0, 1, 1,
-0.633282, 0.2208162, -2.70197, 0, 0, 0, 1, 1,
-0.6328328, -0.2219222, -2.371412, 0, 0, 0, 1, 1,
-0.630895, -0.4677982, -1.663176, 0, 0, 0, 1, 1,
-0.6293761, -1.160062, -2.082146, 0, 0, 0, 1, 1,
-0.6246036, -0.4506599, -0.3795455, 0, 0, 0, 1, 1,
-0.6226558, -0.5631708, -0.8366547, 0, 0, 0, 1, 1,
-0.6147289, -1.733317, -2.36958, 1, 1, 1, 1, 1,
-0.5971756, 0.4451886, 0.2952597, 1, 1, 1, 1, 1,
-0.593087, -0.6285177, -2.109322, 1, 1, 1, 1, 1,
-0.5877362, -0.9351637, -0.8843148, 1, 1, 1, 1, 1,
-0.58641, 0.5650413, -2.699214, 1, 1, 1, 1, 1,
-0.5848879, -0.348677, -2.815771, 1, 1, 1, 1, 1,
-0.5801879, 0.146902, -1.858842, 1, 1, 1, 1, 1,
-0.5799627, -1.473135, -3.000701, 1, 1, 1, 1, 1,
-0.5798242, 1.451838, 0.3854705, 1, 1, 1, 1, 1,
-0.5758336, 0.247893, -0.3606189, 1, 1, 1, 1, 1,
-0.5734703, -0.6481534, -4.210924, 1, 1, 1, 1, 1,
-0.5645031, 0.4790314, -2.771288, 1, 1, 1, 1, 1,
-0.5586733, 0.3348459, 0.2718484, 1, 1, 1, 1, 1,
-0.5533006, 0.6659437, -1.282724, 1, 1, 1, 1, 1,
-0.5467537, -0.016009, -1.808802, 1, 1, 1, 1, 1,
-0.5458604, -0.9457347, -0.7155649, 0, 0, 1, 1, 1,
-0.5440882, -1.061924, -1.479789, 1, 0, 0, 1, 1,
-0.5428962, -0.2204511, -1.439602, 1, 0, 0, 1, 1,
-0.5426921, -0.1803334, -0.3021208, 1, 0, 0, 1, 1,
-0.5409224, -1.597399, -3.713537, 1, 0, 0, 1, 1,
-0.525225, -0.05816574, -1.926143, 1, 0, 0, 1, 1,
-0.522819, -0.8893903, -2.590422, 0, 0, 0, 1, 1,
-0.5136753, 1.797553, -0.1025136, 0, 0, 0, 1, 1,
-0.5114004, 0.7624035, -1.208738, 0, 0, 0, 1, 1,
-0.5105775, 1.77054, -1.128159, 0, 0, 0, 1, 1,
-0.502263, -0.3217789, -1.214323, 0, 0, 0, 1, 1,
-0.5014871, 1.085119, -1.17268, 0, 0, 0, 1, 1,
-0.5012178, 0.4101092, 0.01373786, 0, 0, 0, 1, 1,
-0.4981262, 1.006731, 0.08020695, 1, 1, 1, 1, 1,
-0.4953766, -0.531252, -1.910043, 1, 1, 1, 1, 1,
-0.49527, 0.5405089, 0.7194753, 1, 1, 1, 1, 1,
-0.4872532, -0.06904293, -1.426369, 1, 1, 1, 1, 1,
-0.4865804, -0.2429339, -2.072278, 1, 1, 1, 1, 1,
-0.4841643, -1.562752, -4.259805, 1, 1, 1, 1, 1,
-0.4800432, 0.04221131, -0.1373746, 1, 1, 1, 1, 1,
-0.4786302, 0.6589569, -0.8860056, 1, 1, 1, 1, 1,
-0.4785444, -0.764484, -3.631518, 1, 1, 1, 1, 1,
-0.4659011, -0.7059246, -4.994292, 1, 1, 1, 1, 1,
-0.4618205, 0.3041019, 0.7500916, 1, 1, 1, 1, 1,
-0.4567381, 1.662709, -0.6535873, 1, 1, 1, 1, 1,
-0.4566007, -0.9441738, -1.697382, 1, 1, 1, 1, 1,
-0.4555443, -0.2840744, -2.550581, 1, 1, 1, 1, 1,
-0.454415, -0.2321546, -4.382257, 1, 1, 1, 1, 1,
-0.4525961, -1.039123, -3.931192, 0, 0, 1, 1, 1,
-0.4464785, 0.1684229, -1.322639, 1, 0, 0, 1, 1,
-0.4435733, -2.195469, -3.532588, 1, 0, 0, 1, 1,
-0.4397492, 0.5573105, 1.304901, 1, 0, 0, 1, 1,
-0.4397281, 0.4532505, 0.07632563, 1, 0, 0, 1, 1,
-0.4394667, 1.551381, -0.431404, 1, 0, 0, 1, 1,
-0.4392773, -1.072707, -3.385925, 0, 0, 0, 1, 1,
-0.4385524, -0.2064169, -2.393681, 0, 0, 0, 1, 1,
-0.4354793, 0.2015909, -1.519148, 0, 0, 0, 1, 1,
-0.4334358, 0.01518359, -1.462645, 0, 0, 0, 1, 1,
-0.4330838, 1.422404, -0.3135409, 0, 0, 0, 1, 1,
-0.4323956, -0.3944521, -2.11059, 0, 0, 0, 1, 1,
-0.4322415, -1.774183, -3.415299, 0, 0, 0, 1, 1,
-0.4291901, 0.8288715, -1.479531, 1, 1, 1, 1, 1,
-0.4233879, -0.3112538, -0.7850978, 1, 1, 1, 1, 1,
-0.423205, 0.191107, -1.596322, 1, 1, 1, 1, 1,
-0.4228218, -0.05736703, -2.624863, 1, 1, 1, 1, 1,
-0.4225139, 0.02979698, -1.774289, 1, 1, 1, 1, 1,
-0.4224214, -1.947037, -3.921788, 1, 1, 1, 1, 1,
-0.421656, -0.5621643, -2.220428, 1, 1, 1, 1, 1,
-0.4203975, 0.2980466, 0.5769786, 1, 1, 1, 1, 1,
-0.420015, -0.735523, -2.185198, 1, 1, 1, 1, 1,
-0.4184991, 1.819301, 1.642587, 1, 1, 1, 1, 1,
-0.4098022, 1.137204, -0.4901882, 1, 1, 1, 1, 1,
-0.4008967, 1.094994, -0.8110878, 1, 1, 1, 1, 1,
-0.4008141, -0.7766612, -1.825966, 1, 1, 1, 1, 1,
-0.3976236, -0.1356936, -3.166263, 1, 1, 1, 1, 1,
-0.3961586, -1.027607, -3.548706, 1, 1, 1, 1, 1,
-0.3894421, -1.17924, -3.153301, 0, 0, 1, 1, 1,
-0.3881594, -3.099796, -2.304419, 1, 0, 0, 1, 1,
-0.3877294, 0.6918864, -1.73168, 1, 0, 0, 1, 1,
-0.3851309, -0.5020273, -3.46493, 1, 0, 0, 1, 1,
-0.3851308, 1.083836, 1.024265, 1, 0, 0, 1, 1,
-0.3840404, 0.4870794, -1.431687, 1, 0, 0, 1, 1,
-0.3831253, 0.03417784, -1.001627, 0, 0, 0, 1, 1,
-0.3830447, 1.450908, -1.108697, 0, 0, 0, 1, 1,
-0.3774743, -0.6039047, -4.004303, 0, 0, 0, 1, 1,
-0.375259, 0.522165, -0.6048024, 0, 0, 0, 1, 1,
-0.3740531, 0.7050238, -2.147092, 0, 0, 0, 1, 1,
-0.3667438, 0.2482189, 0.7390705, 0, 0, 0, 1, 1,
-0.3656949, 1.146975, -0.1488666, 0, 0, 0, 1, 1,
-0.3655537, 0.7588696, -0.04222459, 1, 1, 1, 1, 1,
-0.3603871, 0.5744778, 0.2518426, 1, 1, 1, 1, 1,
-0.3579188, 1.255689, -0.6709352, 1, 1, 1, 1, 1,
-0.3571715, 0.3809554, -3.208758, 1, 1, 1, 1, 1,
-0.3564817, -1.237852, -2.480263, 1, 1, 1, 1, 1,
-0.3511204, 0.6670648, -0.6420965, 1, 1, 1, 1, 1,
-0.3507674, 0.07915677, -0.3628137, 1, 1, 1, 1, 1,
-0.3471862, -0.4807958, -1.479901, 1, 1, 1, 1, 1,
-0.3460494, 0.6700139, -1.625194, 1, 1, 1, 1, 1,
-0.3455546, 0.1776473, -0.6598704, 1, 1, 1, 1, 1,
-0.3446107, -0.4926476, -2.89425, 1, 1, 1, 1, 1,
-0.3429495, 0.2603594, -1.053979, 1, 1, 1, 1, 1,
-0.3425674, -0.2175617, -2.207202, 1, 1, 1, 1, 1,
-0.3420913, -2.006201, -2.009434, 1, 1, 1, 1, 1,
-0.3380449, -0.4003319, -3.510073, 1, 1, 1, 1, 1,
-0.3374169, 0.1567752, 0.4527846, 0, 0, 1, 1, 1,
-0.3366348, -1.061258, -3.337812, 1, 0, 0, 1, 1,
-0.3353395, -1.155953, -4.202802, 1, 0, 0, 1, 1,
-0.3330436, -0.5048743, -1.064855, 1, 0, 0, 1, 1,
-0.3321626, 0.8363885, -0.3912118, 1, 0, 0, 1, 1,
-0.3301486, -0.2456626, -3.015928, 1, 0, 0, 1, 1,
-0.3246046, 0.4925127, -1.224181, 0, 0, 0, 1, 1,
-0.323529, 1.977098, 0.2870109, 0, 0, 0, 1, 1,
-0.3230219, -0.2478416, -1.732863, 0, 0, 0, 1, 1,
-0.3227013, -1.011412, -2.242827, 0, 0, 0, 1, 1,
-0.3210135, 1.911587, 0.9914749, 0, 0, 0, 1, 1,
-0.3204556, 0.07758283, -0.3051794, 0, 0, 0, 1, 1,
-0.3177721, -0.1704462, -3.482474, 0, 0, 0, 1, 1,
-0.3130626, -2.088726, -1.448141, 1, 1, 1, 1, 1,
-0.313062, -1.207716, -3.430637, 1, 1, 1, 1, 1,
-0.3074374, -0.1078907, -1.434794, 1, 1, 1, 1, 1,
-0.3061801, -0.1319119, -4.569831, 1, 1, 1, 1, 1,
-0.3035027, 0.9960384, -0.4299636, 1, 1, 1, 1, 1,
-0.3020786, -1.355853, -3.068339, 1, 1, 1, 1, 1,
-0.2970975, -0.9830422, -1.586696, 1, 1, 1, 1, 1,
-0.2951259, 0.4767566, -0.9360737, 1, 1, 1, 1, 1,
-0.2943301, -1.921134, -3.728575, 1, 1, 1, 1, 1,
-0.2921749, 0.07645623, 0.09478806, 1, 1, 1, 1, 1,
-0.2921313, -0.467373, -3.968138, 1, 1, 1, 1, 1,
-0.2914651, 0.5423617, -0.7225064, 1, 1, 1, 1, 1,
-0.2903957, 1.355964, -0.231981, 1, 1, 1, 1, 1,
-0.2895515, -0.1843699, -1.20318, 1, 1, 1, 1, 1,
-0.2895301, 1.247427, 0.5780777, 1, 1, 1, 1, 1,
-0.2890592, 1.466349, 0.5424303, 0, 0, 1, 1, 1,
-0.2871158, 1.033846, 1.050171, 1, 0, 0, 1, 1,
-0.286781, -0.8376762, -2.713277, 1, 0, 0, 1, 1,
-0.2861468, 0.5689177, 0.5078056, 1, 0, 0, 1, 1,
-0.2836292, -1.347802, -4.494135, 1, 0, 0, 1, 1,
-0.2756612, -0.3769042, -1.972711, 1, 0, 0, 1, 1,
-0.2717021, 0.7936988, -0.4953986, 0, 0, 0, 1, 1,
-0.2676813, 0.58272, -1.284617, 0, 0, 0, 1, 1,
-0.2672027, -0.6061801, -3.132482, 0, 0, 0, 1, 1,
-0.2621774, -0.2187517, -0.9154137, 0, 0, 0, 1, 1,
-0.2617979, -1.685495, -2.891326, 0, 0, 0, 1, 1,
-0.2614705, 1.157675, 0.4675389, 0, 0, 0, 1, 1,
-0.2604302, 0.2317619, 0.2061725, 0, 0, 0, 1, 1,
-0.2601649, -0.4730759, -3.66572, 1, 1, 1, 1, 1,
-0.2601062, -0.7184498, -3.054714, 1, 1, 1, 1, 1,
-0.2595137, 0.4637664, 0.4272279, 1, 1, 1, 1, 1,
-0.2574324, -0.6908032, -3.135344, 1, 1, 1, 1, 1,
-0.2530442, -0.3911599, -0.952025, 1, 1, 1, 1, 1,
-0.25055, -1.597474, -3.821461, 1, 1, 1, 1, 1,
-0.2489771, -1.134887, -3.36253, 1, 1, 1, 1, 1,
-0.2464073, -0.6773571, -2.357543, 1, 1, 1, 1, 1,
-0.2449667, 0.313057, 0.7393811, 1, 1, 1, 1, 1,
-0.2447846, 0.0007910567, -1.945663, 1, 1, 1, 1, 1,
-0.2444869, -0.8572353, -4.850288, 1, 1, 1, 1, 1,
-0.244078, 1.118881, -0.08736575, 1, 1, 1, 1, 1,
-0.2403198, -1.631827, -3.979742, 1, 1, 1, 1, 1,
-0.2393995, -0.9180198, -1.412878, 1, 1, 1, 1, 1,
-0.2365973, 0.5489357, 1.34769, 1, 1, 1, 1, 1,
-0.2344978, 1.157122, 2.071737, 0, 0, 1, 1, 1,
-0.2330095, -1.695382, -3.817046, 1, 0, 0, 1, 1,
-0.2326165, 0.007413198, -0.9092136, 1, 0, 0, 1, 1,
-0.2314527, -1.28288, -3.608683, 1, 0, 0, 1, 1,
-0.230345, 1.485008, 0.173577, 1, 0, 0, 1, 1,
-0.2301868, -0.5447394, -2.43267, 1, 0, 0, 1, 1,
-0.2235951, 0.14763, -2.280428, 0, 0, 0, 1, 1,
-0.2214458, 0.01581918, -2.250194, 0, 0, 0, 1, 1,
-0.2119605, 0.8153276, -1.534592, 0, 0, 0, 1, 1,
-0.2097157, 0.4256334, 1.109418, 0, 0, 0, 1, 1,
-0.2077764, -0.6926448, -5.365643, 0, 0, 0, 1, 1,
-0.2017324, 0.1812793, -1.111544, 0, 0, 0, 1, 1,
-0.1962791, -0.384176, -1.372083, 0, 0, 0, 1, 1,
-0.1946252, 0.3794234, 1.06244, 1, 1, 1, 1, 1,
-0.1909419, -0.2020621, -3.077107, 1, 1, 1, 1, 1,
-0.190584, 0.2983522, 0.6923487, 1, 1, 1, 1, 1,
-0.1895071, -0.6808773, -3.928608, 1, 1, 1, 1, 1,
-0.1864924, -0.5507922, -2.978362, 1, 1, 1, 1, 1,
-0.1836336, -0.06208471, -2.111074, 1, 1, 1, 1, 1,
-0.1822269, -0.5073159, -3.1907, 1, 1, 1, 1, 1,
-0.1810665, -1.23936, -3.811651, 1, 1, 1, 1, 1,
-0.1810228, 0.2029456, 0.7065993, 1, 1, 1, 1, 1,
-0.1807821, -0.2110904, -2.252517, 1, 1, 1, 1, 1,
-0.1754977, 1.237575, -1.087961, 1, 1, 1, 1, 1,
-0.1742707, -0.2918059, -1.612666, 1, 1, 1, 1, 1,
-0.1725751, -1.405854, -2.102896, 1, 1, 1, 1, 1,
-0.1660431, 0.7251477, 0.4808366, 1, 1, 1, 1, 1,
-0.165383, 1.121312, 0.8225516, 1, 1, 1, 1, 1,
-0.1551109, -1.720255, -2.14973, 0, 0, 1, 1, 1,
-0.1456713, -2.076488, -3.340049, 1, 0, 0, 1, 1,
-0.1440515, 0.5279456, -2.063577, 1, 0, 0, 1, 1,
-0.1438377, -0.1961252, -1.992706, 1, 0, 0, 1, 1,
-0.1428991, -0.5524483, -2.177548, 1, 0, 0, 1, 1,
-0.1417429, -1.851134, -3.492018, 1, 0, 0, 1, 1,
-0.1393114, -0.2438812, -2.988295, 0, 0, 0, 1, 1,
-0.1388786, 0.1871578, -0.1534211, 0, 0, 0, 1, 1,
-0.1366412, 0.3250473, -1.267348, 0, 0, 0, 1, 1,
-0.1342666, -0.7817215, -2.971936, 0, 0, 0, 1, 1,
-0.1339305, -0.8553438, -3.354072, 0, 0, 0, 1, 1,
-0.1336904, -0.03049468, -2.38183, 0, 0, 0, 1, 1,
-0.1327024, 0.3528418, -0.8793148, 0, 0, 0, 1, 1,
-0.1312476, 0.0005744221, -1.367415, 1, 1, 1, 1, 1,
-0.130804, 0.4939878, 0.6523758, 1, 1, 1, 1, 1,
-0.1251484, -2.183755, -2.702712, 1, 1, 1, 1, 1,
-0.1178739, 0.2592024, -1.754886, 1, 1, 1, 1, 1,
-0.1152574, -0.6644489, -1.333608, 1, 1, 1, 1, 1,
-0.1146627, -0.4136575, -1.911246, 1, 1, 1, 1, 1,
-0.112372, 1.064696, 0.2811808, 1, 1, 1, 1, 1,
-0.103638, -1.338919, -4.562347, 1, 1, 1, 1, 1,
-0.1012623, 0.179258, -1.336986, 1, 1, 1, 1, 1,
-0.1003893, 0.1148778, -2.062472, 1, 1, 1, 1, 1,
-0.09843357, 0.07938407, -0.5317031, 1, 1, 1, 1, 1,
-0.09618074, -0.518725, -4.028441, 1, 1, 1, 1, 1,
-0.09593508, -0.9198585, -3.674668, 1, 1, 1, 1, 1,
-0.09454251, 0.0163862, -2.632246, 1, 1, 1, 1, 1,
-0.09123643, 0.3094601, -1.094185, 1, 1, 1, 1, 1,
-0.08286987, -1.910878, -1.941762, 0, 0, 1, 1, 1,
-0.08216874, -1.080473, -3.241445, 1, 0, 0, 1, 1,
-0.07762791, 0.6702214, -0.6674828, 1, 0, 0, 1, 1,
-0.07731432, 0.5950942, 0.2603351, 1, 0, 0, 1, 1,
-0.07688665, -1.364638, -2.740361, 1, 0, 0, 1, 1,
-0.07546208, -0.07420775, -2.344001, 1, 0, 0, 1, 1,
-0.07124024, -0.1806552, -3.628546, 0, 0, 0, 1, 1,
-0.06644444, 0.3392123, 0.03446573, 0, 0, 0, 1, 1,
-0.05992635, 0.3479998, -0.9771835, 0, 0, 0, 1, 1,
-0.05809331, -0.832512, -4.217898, 0, 0, 0, 1, 1,
-0.05647532, -0.2274146, -4.567771, 0, 0, 0, 1, 1,
-0.05299681, 1.840486, -0.6413265, 0, 0, 0, 1, 1,
-0.05281471, 0.4559723, 1.12135, 0, 0, 0, 1, 1,
-0.05040246, -0.7731767, -4.088576, 1, 1, 1, 1, 1,
-0.04821519, -0.7372242, -3.763062, 1, 1, 1, 1, 1,
-0.04603315, 0.6419039, 0.3183742, 1, 1, 1, 1, 1,
-0.0435509, -0.05385788, -1.740715, 1, 1, 1, 1, 1,
-0.03805688, 0.0891003, -0.1958825, 1, 1, 1, 1, 1,
-0.03573688, 0.3734267, 1.798169, 1, 1, 1, 1, 1,
-0.03482957, 1.380577, 0.8299074, 1, 1, 1, 1, 1,
-0.03299521, -0.1808246, -2.315172, 1, 1, 1, 1, 1,
-0.03131921, 0.5792171, 0.217446, 1, 1, 1, 1, 1,
-0.03016611, 0.505242, 0.3662836, 1, 1, 1, 1, 1,
-0.0227585, 0.3711324, -0.8152643, 1, 1, 1, 1, 1,
-0.01859776, -0.1951928, -2.357377, 1, 1, 1, 1, 1,
-0.01820526, -1.433663, -3.677774, 1, 1, 1, 1, 1,
-0.01567091, -0.1255771, -4.082052, 1, 1, 1, 1, 1,
-0.01536453, -1.291997, -3.252433, 1, 1, 1, 1, 1,
-0.01401606, -0.4621025, -3.551695, 0, 0, 1, 1, 1,
-0.01283851, -0.6575375, -3.469017, 1, 0, 0, 1, 1,
-0.01263069, 0.6830667, 0.01933655, 1, 0, 0, 1, 1,
-0.00660176, 1.332392, -0.2767727, 1, 0, 0, 1, 1,
-0.001944824, -1.500803, -5.119544, 1, 0, 0, 1, 1,
0.0006870283, -0.5555211, 5.287269, 1, 0, 0, 1, 1,
0.002684145, -0.8704094, 2.047254, 0, 0, 0, 1, 1,
0.003720145, -0.7248979, 4.103832, 0, 0, 0, 1, 1,
0.006415014, 0.1818103, -0.1733373, 0, 0, 0, 1, 1,
0.006723757, -1.170332, 3.761831, 0, 0, 0, 1, 1,
0.007613799, 0.09075485, 0.8595082, 0, 0, 0, 1, 1,
0.008517295, 0.2810473, -1.264596, 0, 0, 0, 1, 1,
0.01051114, -0.1002645, 3.877947, 0, 0, 0, 1, 1,
0.01290987, 0.5380103, -0.968266, 1, 1, 1, 1, 1,
0.01339068, 1.435178, -0.1587373, 1, 1, 1, 1, 1,
0.01572576, -1.960067, 2.662547, 1, 1, 1, 1, 1,
0.01920602, 0.4459625, 0.4318596, 1, 1, 1, 1, 1,
0.02159573, 1.142717, 1.740333, 1, 1, 1, 1, 1,
0.02319103, 0.5365072, 0.7748172, 1, 1, 1, 1, 1,
0.02427336, -0.6889735, 3.977664, 1, 1, 1, 1, 1,
0.02709766, -0.5630091, 2.70459, 1, 1, 1, 1, 1,
0.02749748, -0.1153937, 2.586797, 1, 1, 1, 1, 1,
0.02923773, 0.1089931, -0.9845166, 1, 1, 1, 1, 1,
0.032607, 1.203271, -0.2552676, 1, 1, 1, 1, 1,
0.03364818, -0.911977, 2.295601, 1, 1, 1, 1, 1,
0.04174133, 1.014713, 1.660078, 1, 1, 1, 1, 1,
0.04529973, 1.52184, 0.6171901, 1, 1, 1, 1, 1,
0.04542276, -0.06318759, 1.391227, 1, 1, 1, 1, 1,
0.04715298, 0.9079817, 2.593029, 0, 0, 1, 1, 1,
0.04849078, -1.032083, 1.534519, 1, 0, 0, 1, 1,
0.05817122, -1.581494, 2.700409, 1, 0, 0, 1, 1,
0.05963585, 1.668221, -0.8834268, 1, 0, 0, 1, 1,
0.06253202, -0.02642827, 2.289012, 1, 0, 0, 1, 1,
0.06258748, 0.4220544, -1.71445, 1, 0, 0, 1, 1,
0.06394943, -0.7478219, 3.230202, 0, 0, 0, 1, 1,
0.06529168, 0.3589221, 0.752493, 0, 0, 0, 1, 1,
0.07242193, -0.05749815, 1.922104, 0, 0, 0, 1, 1,
0.07596409, -0.02173787, 2.103186, 0, 0, 0, 1, 1,
0.07841624, -1.08729, 2.145209, 0, 0, 0, 1, 1,
0.07899077, -0.3853749, 3.541992, 0, 0, 0, 1, 1,
0.07917037, 1.690131, -0.2198439, 0, 0, 0, 1, 1,
0.0834668, -0.7205107, 4.563891, 1, 1, 1, 1, 1,
0.08565634, 1.153228, 2.238215, 1, 1, 1, 1, 1,
0.09129348, 0.02170104, 1.454207, 1, 1, 1, 1, 1,
0.09262624, 0.01057102, 1.745614, 1, 1, 1, 1, 1,
0.1014684, -1.041669, 3.304609, 1, 1, 1, 1, 1,
0.1074098, -0.9630208, 2.883339, 1, 1, 1, 1, 1,
0.1074755, 0.1481266, 0.3844549, 1, 1, 1, 1, 1,
0.1076609, 0.7896041, 0.4013951, 1, 1, 1, 1, 1,
0.1084573, 1.770599, 0.1043568, 1, 1, 1, 1, 1,
0.1166873, 0.4044651, 1.275794, 1, 1, 1, 1, 1,
0.1170734, 0.3404911, 1.04937, 1, 1, 1, 1, 1,
0.1179403, 0.7031822, 0.4234762, 1, 1, 1, 1, 1,
0.122226, -0.2640201, 5.211634, 1, 1, 1, 1, 1,
0.1260531, 1.286537, 0.3561522, 1, 1, 1, 1, 1,
0.1271487, -1.048178, 4.318824, 1, 1, 1, 1, 1,
0.135022, -2.505952, 2.473197, 0, 0, 1, 1, 1,
0.1378011, -0.2922598, 2.427234, 1, 0, 0, 1, 1,
0.1557465, -0.4128264, 0.5980331, 1, 0, 0, 1, 1,
0.1602246, 0.07206997, 2.335711, 1, 0, 0, 1, 1,
0.1605404, 1.206667, -0.6724002, 1, 0, 0, 1, 1,
0.1635678, 0.9853203, 0.4301061, 1, 0, 0, 1, 1,
0.1645621, -0.506158, 3.477216, 0, 0, 0, 1, 1,
0.1672572, 0.3534249, 1.072259, 0, 0, 0, 1, 1,
0.1730482, 0.3980972, 1.149036, 0, 0, 0, 1, 1,
0.1738897, 0.4385433, 0.8615596, 0, 0, 0, 1, 1,
0.1747957, -0.3260791, 4.051181, 0, 0, 0, 1, 1,
0.1797865, 0.3291087, -1.198505, 0, 0, 0, 1, 1,
0.1806435, 0.5067104, 0.178343, 0, 0, 0, 1, 1,
0.1807684, -0.6995383, 2.773801, 1, 1, 1, 1, 1,
0.1809853, -1.657248, 3.80031, 1, 1, 1, 1, 1,
0.1866905, -0.6598452, 2.768939, 1, 1, 1, 1, 1,
0.1889499, 1.623293, -0.6596545, 1, 1, 1, 1, 1,
0.1899742, 0.3227639, 0.05820426, 1, 1, 1, 1, 1,
0.1930519, -0.1341957, 2.579802, 1, 1, 1, 1, 1,
0.196713, -1.677497, 1.8644, 1, 1, 1, 1, 1,
0.1981487, -0.4320658, 0.8261102, 1, 1, 1, 1, 1,
0.2024686, 1.502645, 0.8589884, 1, 1, 1, 1, 1,
0.2040255, 1.018352, 0.9506326, 1, 1, 1, 1, 1,
0.2054817, -1.322736, 3.318375, 1, 1, 1, 1, 1,
0.205685, 0.08499424, -1.274717, 1, 1, 1, 1, 1,
0.2138104, 0.2500324, 2.30383, 1, 1, 1, 1, 1,
0.2153054, -1.493134, 3.665699, 1, 1, 1, 1, 1,
0.2156498, 0.01145049, 0.2844653, 1, 1, 1, 1, 1,
0.2185123, 0.7007656, 0.003712668, 0, 0, 1, 1, 1,
0.2242156, -1.640707, 2.924939, 1, 0, 0, 1, 1,
0.2253738, -0.7554287, 4.367749, 1, 0, 0, 1, 1,
0.2258338, 0.3264121, 0.1534267, 1, 0, 0, 1, 1,
0.2310969, 0.7474118, 0.3461376, 1, 0, 0, 1, 1,
0.2311224, 0.3412745, -0.01938544, 1, 0, 0, 1, 1,
0.2323073, 0.8447149, -1.445273, 0, 0, 0, 1, 1,
0.2345151, -0.7389432, 4.17837, 0, 0, 0, 1, 1,
0.2349967, -0.8341401, 3.96826, 0, 0, 0, 1, 1,
0.2357612, 0.04886891, -0.9967064, 0, 0, 0, 1, 1,
0.2426162, -1.416316, 2.443944, 0, 0, 0, 1, 1,
0.2477039, 1.041931, -0.01766571, 0, 0, 0, 1, 1,
0.2517965, -2.443045, 4.14779, 0, 0, 0, 1, 1,
0.2554357, 0.1777525, -0.9995741, 1, 1, 1, 1, 1,
0.2586837, 0.3897923, 1.341433, 1, 1, 1, 1, 1,
0.2623129, -0.1016827, 2.585708, 1, 1, 1, 1, 1,
0.264217, 0.1719681, 0.7218354, 1, 1, 1, 1, 1,
0.2643608, -1.674564, 1.895222, 1, 1, 1, 1, 1,
0.2669219, -0.4398926, 3.150893, 1, 1, 1, 1, 1,
0.2684689, 0.6202348, 0.5010728, 1, 1, 1, 1, 1,
0.2742193, 0.4041168, -0.6742824, 1, 1, 1, 1, 1,
0.2802646, 0.2440636, -0.2960728, 1, 1, 1, 1, 1,
0.2802765, -0.6665446, 1.557296, 1, 1, 1, 1, 1,
0.2809521, 1.593734, 0.4567809, 1, 1, 1, 1, 1,
0.28381, 0.2257421, -0.7666686, 1, 1, 1, 1, 1,
0.2838241, 0.6458635, 0.1956916, 1, 1, 1, 1, 1,
0.2873397, 0.2345417, 1.108689, 1, 1, 1, 1, 1,
0.2876352, 1.827283, -1.258549, 1, 1, 1, 1, 1,
0.2898396, 0.4076929, 0.4062029, 0, 0, 1, 1, 1,
0.2902685, 3.971409, 0.8278958, 1, 0, 0, 1, 1,
0.2941354, -0.8232124, 3.239149, 1, 0, 0, 1, 1,
0.2944079, -0.8545266, 2.580575, 1, 0, 0, 1, 1,
0.298773, -0.04136502, 0.6861076, 1, 0, 0, 1, 1,
0.3020473, -0.2646445, 1.650367, 1, 0, 0, 1, 1,
0.3030397, -0.6516414, 2.185149, 0, 0, 0, 1, 1,
0.3051102, -0.3329901, 2.347361, 0, 0, 0, 1, 1,
0.3070112, -1.980022, 2.082988, 0, 0, 0, 1, 1,
0.311696, 2.335566, -1.770244, 0, 0, 0, 1, 1,
0.313539, -0.2339818, 1.933322, 0, 0, 0, 1, 1,
0.3139544, -0.7437027, 3.802292, 0, 0, 0, 1, 1,
0.3150083, 0.04095642, 0.792135, 0, 0, 0, 1, 1,
0.3183337, 0.5499714, 1.496676, 1, 1, 1, 1, 1,
0.3236699, 1.010852, 1.098938, 1, 1, 1, 1, 1,
0.326978, -1.302765, 2.84037, 1, 1, 1, 1, 1,
0.327893, 0.7104928, 1.796515, 1, 1, 1, 1, 1,
0.3295677, 0.4691418, 2.446989, 1, 1, 1, 1, 1,
0.3296867, 0.6049136, 0.9934734, 1, 1, 1, 1, 1,
0.3328401, -0.07423339, 0.8614551, 1, 1, 1, 1, 1,
0.3332579, -1.148491, 4.801962, 1, 1, 1, 1, 1,
0.3350757, 0.5486373, 0.9255041, 1, 1, 1, 1, 1,
0.336552, -0.4637695, 3.244385, 1, 1, 1, 1, 1,
0.3400993, 0.4889932, -1.076291, 1, 1, 1, 1, 1,
0.3401918, -1.325359, 2.220882, 1, 1, 1, 1, 1,
0.3418283, -1.091203, 4.079501, 1, 1, 1, 1, 1,
0.3425542, 1.072167, -0.2244403, 1, 1, 1, 1, 1,
0.3430629, -0.5439107, 1.403731, 1, 1, 1, 1, 1,
0.3460175, 0.05005128, 0.5092064, 0, 0, 1, 1, 1,
0.3464321, -0.2439512, -1.52596, 1, 0, 0, 1, 1,
0.3487058, -0.8236843, 2.999519, 1, 0, 0, 1, 1,
0.3518038, 0.4579248, 0.3153536, 1, 0, 0, 1, 1,
0.3542647, 0.2300499, 1.776448, 1, 0, 0, 1, 1,
0.3553433, 0.06295425, -0.6845132, 1, 0, 0, 1, 1,
0.3553443, -0.3543031, 2.842818, 0, 0, 0, 1, 1,
0.3571685, -0.7654067, 3.86362, 0, 0, 0, 1, 1,
0.3591699, 0.6233237, 1.407305, 0, 0, 0, 1, 1,
0.3614253, -0.6282111, 3.868753, 0, 0, 0, 1, 1,
0.3661128, 0.5517768, 1.105247, 0, 0, 0, 1, 1,
0.3665793, -1.329702, 2.969484, 0, 0, 0, 1, 1,
0.3686913, 1.730892, 0.5433878, 0, 0, 0, 1, 1,
0.3692786, 0.47956, 2.340182, 1, 1, 1, 1, 1,
0.3711521, -0.9571105, 4.484436, 1, 1, 1, 1, 1,
0.3729462, -2.476093, 4.807329, 1, 1, 1, 1, 1,
0.3790517, 0.1414777, 1.008457, 1, 1, 1, 1, 1,
0.3803554, 1.393253, 1.450946, 1, 1, 1, 1, 1,
0.3824012, -0.607934, 4.648529, 1, 1, 1, 1, 1,
0.3883039, 1.710592, -1.190246, 1, 1, 1, 1, 1,
0.3939538, -1.205767, 2.004705, 1, 1, 1, 1, 1,
0.3941776, 1.480366, 0.005473356, 1, 1, 1, 1, 1,
0.3946353, -0.4235174, 1.234192, 1, 1, 1, 1, 1,
0.3952001, -0.2836052, 1.913002, 1, 1, 1, 1, 1,
0.3993298, 0.1012266, 1.525401, 1, 1, 1, 1, 1,
0.3994021, -0.2198971, 2.830619, 1, 1, 1, 1, 1,
0.4043654, 0.0009093285, -0.08438293, 1, 1, 1, 1, 1,
0.4078229, 0.2585304, 0.1200567, 1, 1, 1, 1, 1,
0.4105415, -0.4370259, 3.010362, 0, 0, 1, 1, 1,
0.4186481, -0.05279604, 1.3109, 1, 0, 0, 1, 1,
0.4193665, 0.5058644, 0.3149674, 1, 0, 0, 1, 1,
0.4193839, 0.9733428, -0.5685172, 1, 0, 0, 1, 1,
0.4249384, -0.1767468, 2.384377, 1, 0, 0, 1, 1,
0.4275928, -0.248203, 2.766703, 1, 0, 0, 1, 1,
0.4312307, -0.4505485, 3.360229, 0, 0, 0, 1, 1,
0.4321137, 1.182117, 1.746162, 0, 0, 0, 1, 1,
0.4340629, -0.6080312, 3.379037, 0, 0, 0, 1, 1,
0.4398173, 0.3949134, -0.1827349, 0, 0, 0, 1, 1,
0.4451251, 0.4264944, 0.2925664, 0, 0, 0, 1, 1,
0.4527285, 0.7028444, 1.06171, 0, 0, 0, 1, 1,
0.4591515, 0.5356875, 2.881448, 0, 0, 0, 1, 1,
0.4609836, 0.6599851, 1.77161, 1, 1, 1, 1, 1,
0.4633627, -0.7190925, 3.626582, 1, 1, 1, 1, 1,
0.4669313, -0.06607981, 1.097222, 1, 1, 1, 1, 1,
0.4670883, -0.6461388, 1.798764, 1, 1, 1, 1, 1,
0.4674031, 0.9602036, -0.3409466, 1, 1, 1, 1, 1,
0.4688108, -0.2151087, 2.08187, 1, 1, 1, 1, 1,
0.4735883, -0.3828097, 2.081094, 1, 1, 1, 1, 1,
0.4778885, -0.6999053, 4.380813, 1, 1, 1, 1, 1,
0.4822374, -0.9482396, 2.344184, 1, 1, 1, 1, 1,
0.4829214, 0.8548446, 0.5318304, 1, 1, 1, 1, 1,
0.4830185, -1.139936, 2.540288, 1, 1, 1, 1, 1,
0.4832751, 0.2817084, 0.5379803, 1, 1, 1, 1, 1,
0.4835774, 0.3492235, 0.5090269, 1, 1, 1, 1, 1,
0.4835872, -2.161415, 0.624888, 1, 1, 1, 1, 1,
0.4845592, 0.8089027, 0.7988362, 1, 1, 1, 1, 1,
0.4847499, -0.8869718, 2.93771, 0, 0, 1, 1, 1,
0.4900776, 0.08118551, 0.04467042, 1, 0, 0, 1, 1,
0.4911503, 0.01596457, 1.328346, 1, 0, 0, 1, 1,
0.4928123, 1.503598, -2.355569, 1, 0, 0, 1, 1,
0.4946948, 0.4767502, 1.215808, 1, 0, 0, 1, 1,
0.4955368, -1.176618, 2.851657, 1, 0, 0, 1, 1,
0.4965397, 0.9640106, -1.090189, 0, 0, 0, 1, 1,
0.4997385, -0.01392861, 2.222785, 0, 0, 0, 1, 1,
0.4998473, -0.8315145, 1.103941, 0, 0, 0, 1, 1,
0.5009578, -2.463413, 2.586928, 0, 0, 0, 1, 1,
0.5076264, 0.5529301, 2.366362, 0, 0, 0, 1, 1,
0.5159425, 0.8984785, 1.008178, 0, 0, 0, 1, 1,
0.5174123, 1.509562, 0.636681, 0, 0, 0, 1, 1,
0.522415, 0.6339086, -0.2428606, 1, 1, 1, 1, 1,
0.5257065, -0.9533394, 2.817438, 1, 1, 1, 1, 1,
0.5259336, -1.074072, 4.712517, 1, 1, 1, 1, 1,
0.527327, 1.089223, 1.829824, 1, 1, 1, 1, 1,
0.5276744, -1.29388, 2.14229, 1, 1, 1, 1, 1,
0.5325443, -2.789931, 3.877022, 1, 1, 1, 1, 1,
0.5353559, -0.7074175, 0.8576548, 1, 1, 1, 1, 1,
0.5365697, 0.38908, 1.549674, 1, 1, 1, 1, 1,
0.5369332, -0.982502, 3.034033, 1, 1, 1, 1, 1,
0.538794, 0.05240276, -0.3659479, 1, 1, 1, 1, 1,
0.5415384, -0.3039722, 0.3851043, 1, 1, 1, 1, 1,
0.5482302, 0.09046369, 0.9920037, 1, 1, 1, 1, 1,
0.5501413, -1.464396, 3.863846, 1, 1, 1, 1, 1,
0.5569463, -1.207369, 3.429176, 1, 1, 1, 1, 1,
0.5571229, -0.2722758, 0.7227674, 1, 1, 1, 1, 1,
0.5580812, -0.1861565, 4.931871, 0, 0, 1, 1, 1,
0.5599182, 0.5422654, 0.764372, 1, 0, 0, 1, 1,
0.5608085, -0.2865511, 1.624735, 1, 0, 0, 1, 1,
0.5614999, -0.781184, 2.362236, 1, 0, 0, 1, 1,
0.562236, -0.1443949, 2.046916, 1, 0, 0, 1, 1,
0.5629048, -0.5772279, 1.174068, 1, 0, 0, 1, 1,
0.5688112, -1.460407, 3.81387, 0, 0, 0, 1, 1,
0.5732839, -1.378165, 3.489199, 0, 0, 0, 1, 1,
0.5830785, 0.9464743, 0.4235723, 0, 0, 0, 1, 1,
0.5863287, 0.03562062, 1.51052, 0, 0, 0, 1, 1,
0.589717, -0.5190701, 1.493028, 0, 0, 0, 1, 1,
0.5921411, -1.304668, 3.798181, 0, 0, 0, 1, 1,
0.5927974, 0.3569736, 1.693713, 0, 0, 0, 1, 1,
0.5952043, 0.4867831, -0.868355, 1, 1, 1, 1, 1,
0.5969999, -0.3887753, 1.461729, 1, 1, 1, 1, 1,
0.5991414, 1.119249, 0.5721063, 1, 1, 1, 1, 1,
0.6001917, 0.3493266, 2.262199, 1, 1, 1, 1, 1,
0.6039768, -0.8542005, 2.194843, 1, 1, 1, 1, 1,
0.6060275, 1.382123, 1.029376, 1, 1, 1, 1, 1,
0.606589, -0.6997819, 2.706355, 1, 1, 1, 1, 1,
0.6104493, 1.157315, 0.5649906, 1, 1, 1, 1, 1,
0.6110665, -0.3108929, 2.221161, 1, 1, 1, 1, 1,
0.6123857, 0.3799798, 1.340179, 1, 1, 1, 1, 1,
0.6150102, -1.709689, 3.401751, 1, 1, 1, 1, 1,
0.6244418, -0.3092749, 2.919332, 1, 1, 1, 1, 1,
0.6339066, -0.7809495, 1.315541, 1, 1, 1, 1, 1,
0.6367812, 1.042176, 0.3504099, 1, 1, 1, 1, 1,
0.6386363, -1.374311, 4.351594, 1, 1, 1, 1, 1,
0.6419809, 0.4281009, 1.532241, 0, 0, 1, 1, 1,
0.6487, 0.6549175, 2.77915, 1, 0, 0, 1, 1,
0.6495242, 1.488366, 0.4669063, 1, 0, 0, 1, 1,
0.6496669, 0.8586648, 2.03785, 1, 0, 0, 1, 1,
0.6595683, 1.696465, 0.5185736, 1, 0, 0, 1, 1,
0.6612273, 2.418954, 0.2683806, 1, 0, 0, 1, 1,
0.6623948, 0.50754, 3.023985, 0, 0, 0, 1, 1,
0.6628101, -1.926507, 0.6622784, 0, 0, 0, 1, 1,
0.6676226, 0.3492113, 0.8788285, 0, 0, 0, 1, 1,
0.6707352, -0.8417611, 3.56851, 0, 0, 0, 1, 1,
0.6716524, -1.268146, 2.505994, 0, 0, 0, 1, 1,
0.672493, 1.568294, 0.6375186, 0, 0, 0, 1, 1,
0.6732539, 0.539003, 0.2387625, 0, 0, 0, 1, 1,
0.6769885, 2.230686, 1.260084, 1, 1, 1, 1, 1,
0.6769974, 0.4800783, 1.550025, 1, 1, 1, 1, 1,
0.6866, 1.270041, -0.3797863, 1, 1, 1, 1, 1,
0.6926003, 2.096375, 0.5039867, 1, 1, 1, 1, 1,
0.6948495, -0.5432475, 2.647102, 1, 1, 1, 1, 1,
0.6968957, 0.1793535, 2.376945, 1, 1, 1, 1, 1,
0.6990197, 0.3147728, 0.9454818, 1, 1, 1, 1, 1,
0.700846, -1.031173, 2.644276, 1, 1, 1, 1, 1,
0.7031965, -0.2939056, 3.027874, 1, 1, 1, 1, 1,
0.7038236, 0.6657687, 2.282468, 1, 1, 1, 1, 1,
0.7063695, 0.4565193, 2.135054, 1, 1, 1, 1, 1,
0.7089268, 0.6315745, 0.153362, 1, 1, 1, 1, 1,
0.7127765, -0.6253281, 2.367488, 1, 1, 1, 1, 1,
0.7166011, -0.4126151, 1.594521, 1, 1, 1, 1, 1,
0.720492, -0.05038121, 1.546089, 1, 1, 1, 1, 1,
0.7213088, 0.2915589, 0.7994929, 0, 0, 1, 1, 1,
0.7232295, 0.03012371, 1.223263, 1, 0, 0, 1, 1,
0.725134, -1.0471, 1.860455, 1, 0, 0, 1, 1,
0.7258724, -0.7772604, 3.286352, 1, 0, 0, 1, 1,
0.7273523, -1.99604, 1.604341, 1, 0, 0, 1, 1,
0.7293622, 0.4586451, -0.1040036, 1, 0, 0, 1, 1,
0.7326913, -0.5528524, 1.28873, 0, 0, 0, 1, 1,
0.7356058, 1.260584, 0.1777682, 0, 0, 0, 1, 1,
0.7399611, 0.6482636, 1.412147, 0, 0, 0, 1, 1,
0.7399666, 0.08134681, 1.19117, 0, 0, 0, 1, 1,
0.7446322, 1.120609, 2.301311, 0, 0, 0, 1, 1,
0.746607, 1.715617, 2.358994, 0, 0, 0, 1, 1,
0.7484198, -0.1515971, 2.610498, 0, 0, 0, 1, 1,
0.7486048, -0.4398847, 3.190668, 1, 1, 1, 1, 1,
0.7541475, 0.3375706, 1.542087, 1, 1, 1, 1, 1,
0.756579, 0.3827353, 1.017641, 1, 1, 1, 1, 1,
0.7586809, -0.6940753, 2.139212, 1, 1, 1, 1, 1,
0.7614802, 0.3993491, 0.9024634, 1, 1, 1, 1, 1,
0.761563, 1.838654, -0.2131866, 1, 1, 1, 1, 1,
0.7685567, -0.2850697, 2.718711, 1, 1, 1, 1, 1,
0.7752544, -1.137159, 2.839172, 1, 1, 1, 1, 1,
0.7759739, -0.03837038, 2.376439, 1, 1, 1, 1, 1,
0.7788791, 0.7411383, 0.3946528, 1, 1, 1, 1, 1,
0.7793064, -1.410347, 2.855353, 1, 1, 1, 1, 1,
0.7817991, -0.8984792, 2.614404, 1, 1, 1, 1, 1,
0.7881717, -0.3602635, 0.7691746, 1, 1, 1, 1, 1,
0.8031, 1.863836, 0.6429326, 1, 1, 1, 1, 1,
0.8080943, -0.5957222, 1.71212, 1, 1, 1, 1, 1,
0.8087461, 0.353758, 1.298527, 0, 0, 1, 1, 1,
0.8119433, 0.3908333, 0.1101615, 1, 0, 0, 1, 1,
0.8172033, -0.3391179, 2.781909, 1, 0, 0, 1, 1,
0.8203272, 1.29236, 0.2009152, 1, 0, 0, 1, 1,
0.8225019, 1.004327, 0.8640893, 1, 0, 0, 1, 1,
0.8392752, -0.06326359, 1.58872, 1, 0, 0, 1, 1,
0.8422444, 0.3161257, 0.4026155, 0, 0, 0, 1, 1,
0.8444903, 0.5973968, 1.26125, 0, 0, 0, 1, 1,
0.847436, 0.7254822, 0.7528812, 0, 0, 0, 1, 1,
0.8485196, 1.115965, 0.6775765, 0, 0, 0, 1, 1,
0.8503859, -0.09136503, 1.60079, 0, 0, 0, 1, 1,
0.8594289, 2.330945, 0.6090354, 0, 0, 0, 1, 1,
0.8637766, -0.1770255, 3.315674, 0, 0, 0, 1, 1,
0.8662279, -1.123997, 3.094304, 1, 1, 1, 1, 1,
0.8668367, 0.2482737, 2.218148, 1, 1, 1, 1, 1,
0.8674176, 0.115225, 0.7676483, 1, 1, 1, 1, 1,
0.8699091, 1.143252, 1.509436, 1, 1, 1, 1, 1,
0.8736216, -0.9390717, 1.714975, 1, 1, 1, 1, 1,
0.879459, -0.6646582, 3.164581, 1, 1, 1, 1, 1,
0.8823852, -0.09573486, 0.8879732, 1, 1, 1, 1, 1,
0.8917443, 0.05676413, 1.710785, 1, 1, 1, 1, 1,
0.8997303, -0.4996746, 3.382346, 1, 1, 1, 1, 1,
0.9105136, -0.09000544, 3.964602, 1, 1, 1, 1, 1,
0.9108765, 0.008632322, 0.9103048, 1, 1, 1, 1, 1,
0.9121974, -1.424782, 0.9692937, 1, 1, 1, 1, 1,
0.9125166, 0.8466842, -0.05236095, 1, 1, 1, 1, 1,
0.915659, 0.4947332, 2.775358, 1, 1, 1, 1, 1,
0.9178008, 0.513406, 0.8324711, 1, 1, 1, 1, 1,
0.9334291, -0.8952389, 1.978883, 0, 0, 1, 1, 1,
0.9430075, 1.512723, 0.1503732, 1, 0, 0, 1, 1,
0.952464, -0.2500103, 1.917018, 1, 0, 0, 1, 1,
0.9563382, 0.9144515, 1.371916, 1, 0, 0, 1, 1,
0.9622514, 0.668716, 0.5536815, 1, 0, 0, 1, 1,
0.9637831, -1.719891, 2.533459, 1, 0, 0, 1, 1,
0.967182, 0.1304879, 3.612859, 0, 0, 0, 1, 1,
0.9683574, 0.6536216, -0.3464615, 0, 0, 0, 1, 1,
0.9716319, 1.478727, -1.659888, 0, 0, 0, 1, 1,
0.9790884, -1.244991, 1.930081, 0, 0, 0, 1, 1,
0.9799023, 1.42091, -0.5871693, 0, 0, 0, 1, 1,
0.9815325, 0.6035753, 0.2128269, 0, 0, 0, 1, 1,
0.9872876, -1.382817, 1.706238, 0, 0, 0, 1, 1,
0.9897464, -1.552543, 3.638237, 1, 1, 1, 1, 1,
1.003917, 0.3264555, -0.6958784, 1, 1, 1, 1, 1,
1.012303, -1.446888, 2.593725, 1, 1, 1, 1, 1,
1.013206, -0.6724397, 1.892074, 1, 1, 1, 1, 1,
1.015668, 0.3596706, -0.3144587, 1, 1, 1, 1, 1,
1.021276, -1.040109, 3.077842, 1, 1, 1, 1, 1,
1.023998, -1.823146, 3.71621, 1, 1, 1, 1, 1,
1.02767, 0.656926, 3.204282, 1, 1, 1, 1, 1,
1.034972, 0.4823382, 1.719316, 1, 1, 1, 1, 1,
1.043442, 0.8720768, 0.6239238, 1, 1, 1, 1, 1,
1.04836, -1.778605, 3.229726, 1, 1, 1, 1, 1,
1.051011, -0.05555026, 1.615063, 1, 1, 1, 1, 1,
1.05195, -0.3306374, 2.350568, 1, 1, 1, 1, 1,
1.053674, 1.879837, -0.3564221, 1, 1, 1, 1, 1,
1.065958, 1.507492, 0.7637762, 1, 1, 1, 1, 1,
1.069521, 0.4871363, -0.1720586, 0, 0, 1, 1, 1,
1.078282, -0.236693, 3.340837, 1, 0, 0, 1, 1,
1.080139, -0.9681109, 2.815497, 1, 0, 0, 1, 1,
1.082044, 0.6001641, -0.3171759, 1, 0, 0, 1, 1,
1.082757, 0.1781031, 0.4561386, 1, 0, 0, 1, 1,
1.084168, 2.276586, -0.1410147, 1, 0, 0, 1, 1,
1.08695, -0.08401683, 1.992926, 0, 0, 0, 1, 1,
1.091771, 1.465627, 0.6275435, 0, 0, 0, 1, 1,
1.092138, -0.2369442, 2.120441, 0, 0, 0, 1, 1,
1.093276, 0.5860758, 1.337922, 0, 0, 0, 1, 1,
1.095504, 0.089324, 2.793495, 0, 0, 0, 1, 1,
1.09596, -0.2218329, 2.346726, 0, 0, 0, 1, 1,
1.103716, -0.2076845, 2.659289, 0, 0, 0, 1, 1,
1.11074, -0.2695794, 2.511647, 1, 1, 1, 1, 1,
1.112908, 1.02549, 1.550029, 1, 1, 1, 1, 1,
1.124595, -0.02696275, 1.099463, 1, 1, 1, 1, 1,
1.132859, -0.9615327, 1.432004, 1, 1, 1, 1, 1,
1.134367, -0.4059372, 1.20149, 1, 1, 1, 1, 1,
1.135385, -0.02170435, 2.160742, 1, 1, 1, 1, 1,
1.138349, 0.5317241, -0.02012421, 1, 1, 1, 1, 1,
1.140576, 0.497537, 0.06178562, 1, 1, 1, 1, 1,
1.141986, 0.6157974, 2.639113, 1, 1, 1, 1, 1,
1.148749, 1.096024, -0.3583224, 1, 1, 1, 1, 1,
1.155932, -1.741354, 2.449601, 1, 1, 1, 1, 1,
1.158296, -0.414883, 0.437829, 1, 1, 1, 1, 1,
1.162342, -1.197099, 1.685324, 1, 1, 1, 1, 1,
1.168359, 1.074536, 2.016126, 1, 1, 1, 1, 1,
1.170488, 1.036554, 0.06861539, 1, 1, 1, 1, 1,
1.171689, -0.1180589, 2.506963, 0, 0, 1, 1, 1,
1.173779, -0.1541693, 0.8448291, 1, 0, 0, 1, 1,
1.177367, 0.259393, 3.193118, 1, 0, 0, 1, 1,
1.179967, -0.5844099, -0.4309802, 1, 0, 0, 1, 1,
1.180051, -1.120069, 2.028103, 1, 0, 0, 1, 1,
1.192232, 0.3611378, 0.8561848, 1, 0, 0, 1, 1,
1.195756, -0.3984011, 0.9681426, 0, 0, 0, 1, 1,
1.212828, -1.065622, 2.36263, 0, 0, 0, 1, 1,
1.21324, 1.622471, 1.95791, 0, 0, 0, 1, 1,
1.218255, 0.7375184, 0.7774863, 0, 0, 0, 1, 1,
1.218713, -2.118646, 1.229282, 0, 0, 0, 1, 1,
1.222322, 1.576764, 0.5778917, 0, 0, 0, 1, 1,
1.228198, -0.2102925, 2.148416, 0, 0, 0, 1, 1,
1.23035, -0.05286351, 2.763325, 1, 1, 1, 1, 1,
1.232901, -0.611425, 1.364209, 1, 1, 1, 1, 1,
1.234831, -0.8291111, 1.139796, 1, 1, 1, 1, 1,
1.247182, -1.808713, 3.403391, 1, 1, 1, 1, 1,
1.258161, 0.2265554, -0.5047137, 1, 1, 1, 1, 1,
1.262883, -0.6898043, 3.841224, 1, 1, 1, 1, 1,
1.275443, -0.1960048, 1.48814, 1, 1, 1, 1, 1,
1.276383, 1.914156, 0.8448371, 1, 1, 1, 1, 1,
1.280168, -0.398554, 2.059844, 1, 1, 1, 1, 1,
1.286044, -0.1790454, 1.808148, 1, 1, 1, 1, 1,
1.312546, -1.49194, 4.21909, 1, 1, 1, 1, 1,
1.313613, 0.2606075, -0.5483644, 1, 1, 1, 1, 1,
1.315359, 0.3002224, 3.104349, 1, 1, 1, 1, 1,
1.321558, 1.013207, 0.8504108, 1, 1, 1, 1, 1,
1.327348, -1.371245, 3.156669, 1, 1, 1, 1, 1,
1.331479, 2.516628, -0.2009663, 0, 0, 1, 1, 1,
1.332357, 0.2833986, 0.6073363, 1, 0, 0, 1, 1,
1.335348, 1.893394, 1.943357, 1, 0, 0, 1, 1,
1.34413, -0.7257299, 1.671311, 1, 0, 0, 1, 1,
1.348138, 0.7421641, 0.01636835, 1, 0, 0, 1, 1,
1.34878, 1.70952, 1.182157, 1, 0, 0, 1, 1,
1.351771, -0.3563117, 1.472679, 0, 0, 0, 1, 1,
1.359366, 1.919517, 0.6601046, 0, 0, 0, 1, 1,
1.36238, -0.02036532, 1.535813, 0, 0, 0, 1, 1,
1.373273, -0.1562185, 0.8988111, 0, 0, 0, 1, 1,
1.378204, 0.3302006, -0.4300052, 0, 0, 0, 1, 1,
1.389964, -0.3637535, 2.258587, 0, 0, 0, 1, 1,
1.405555, 0.4268856, 0.180306, 0, 0, 0, 1, 1,
1.410047, -1.187723, 2.171707, 1, 1, 1, 1, 1,
1.427055, -0.7818617, 1.623531, 1, 1, 1, 1, 1,
1.443049, 0.6270303, 1.885627, 1, 1, 1, 1, 1,
1.449937, -0.3233843, 1.066908, 1, 1, 1, 1, 1,
1.463478, -0.6237404, 1.210469, 1, 1, 1, 1, 1,
1.491197, -0.3872115, 0.5056558, 1, 1, 1, 1, 1,
1.497756, 0.4023195, -1.139262, 1, 1, 1, 1, 1,
1.506663, 0.2921169, 0.4795412, 1, 1, 1, 1, 1,
1.507776, -0.5318587, 3.619541, 1, 1, 1, 1, 1,
1.519152, -0.5871118, 2.109117, 1, 1, 1, 1, 1,
1.525394, -0.1228036, 2.303085, 1, 1, 1, 1, 1,
1.527463, 0.4163431, 0.9764346, 1, 1, 1, 1, 1,
1.537955, 0.6294329, 1.454836, 1, 1, 1, 1, 1,
1.544029, -1.101687, 3.778712, 1, 1, 1, 1, 1,
1.558525, -1.890095, 1.329704, 1, 1, 1, 1, 1,
1.558668, 0.2138863, 1.199824, 0, 0, 1, 1, 1,
1.559574, 0.3581913, 0.7419265, 1, 0, 0, 1, 1,
1.563959, -0.5116376, 3.488513, 1, 0, 0, 1, 1,
1.567389, -0.5886843, 2.381814, 1, 0, 0, 1, 1,
1.572076, -1.43986, 2.425974, 1, 0, 0, 1, 1,
1.599142, 0.06579906, 1.179036, 1, 0, 0, 1, 1,
1.605311, -1.855262, 2.297058, 0, 0, 0, 1, 1,
1.640056, -0.8949406, 1.956404, 0, 0, 0, 1, 1,
1.648202, -1.314772, 2.114401, 0, 0, 0, 1, 1,
1.657828, 0.5557726, -0.2605484, 0, 0, 0, 1, 1,
1.663059, 0.6871058, 1.57124, 0, 0, 0, 1, 1,
1.713879, -1.104784, 2.768636, 0, 0, 0, 1, 1,
1.720863, -0.525739, 4.209219, 0, 0, 0, 1, 1,
1.750473, -0.3548824, 0.8172272, 1, 1, 1, 1, 1,
1.773626, 1.154588, 2.582498, 1, 1, 1, 1, 1,
1.794881, 0.7291028, 2.672636, 1, 1, 1, 1, 1,
1.803956, 0.7382785, 1.134733, 1, 1, 1, 1, 1,
1.807327, 0.2246117, 1.612935, 1, 1, 1, 1, 1,
1.814358, -0.2099202, 0.7181652, 1, 1, 1, 1, 1,
1.814811, 1.258961, 1.485027, 1, 1, 1, 1, 1,
1.839915, -0.1100954, 1.751697, 1, 1, 1, 1, 1,
1.84544, -0.2736117, 2.689738, 1, 1, 1, 1, 1,
1.901203, -1.518685, 1.89374, 1, 1, 1, 1, 1,
1.906319, 0.6677977, 0.7236415, 1, 1, 1, 1, 1,
1.914825, 0.6002632, 2.447671, 1, 1, 1, 1, 1,
1.921764, -0.461568, -0.1683401, 1, 1, 1, 1, 1,
1.929336, -1.010824, 1.34822, 1, 1, 1, 1, 1,
1.932621, 0.07495183, 2.180899, 1, 1, 1, 1, 1,
1.991679, -0.1596165, 1.22734, 0, 0, 1, 1, 1,
2.060523, 0.5647517, 1.908334, 1, 0, 0, 1, 1,
2.060623, -0.9043215, 3.089573, 1, 0, 0, 1, 1,
2.080793, 0.4862653, 1.110667, 1, 0, 0, 1, 1,
2.107815, -0.03798647, 3.090091, 1, 0, 0, 1, 1,
2.205165, -0.185765, 1.347852, 1, 0, 0, 1, 1,
2.252177, -1.435771, 1.153227, 0, 0, 0, 1, 1,
2.255028, -0.4662859, 2.025642, 0, 0, 0, 1, 1,
2.36343, -0.1321515, 1.169596, 0, 0, 0, 1, 1,
2.400079, -0.1083267, 3.009, 0, 0, 0, 1, 1,
2.413137, -0.06144727, 2.687574, 0, 0, 0, 1, 1,
2.452564, -0.1657593, 1.532549, 0, 0, 0, 1, 1,
2.460228, -1.281369, 1.283932, 0, 0, 0, 1, 1,
2.478243, -0.7695522, 3.002884, 1, 1, 1, 1, 1,
2.499987, -1.308839, 3.502257, 1, 1, 1, 1, 1,
2.614814, 0.04536274, 0.5119674, 1, 1, 1, 1, 1,
2.689654, -0.4835013, 0.8350633, 1, 1, 1, 1, 1,
2.798186, -0.174404, -0.06183609, 1, 1, 1, 1, 1,
3.036648, -0.6120412, 1.147427, 1, 1, 1, 1, 1,
4.000894, 0.4287359, 0.5791969, 1, 1, 1, 1, 1
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
var radius = 10.00264;
var distance = 35.13387;
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
mvMatrix.translate( -0.4280176, -0.3073876, 0.03918695 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.13387);
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