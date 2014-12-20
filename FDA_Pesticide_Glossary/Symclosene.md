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
-2.852054, 0.3371359, -2.15471, 1, 0, 0, 1,
-2.746574, 0.03898815, -3.597437, 1, 0.007843138, 0, 1,
-2.672657, 0.582772, -1.151404, 1, 0.01176471, 0, 1,
-2.558569, 0.7938092, -3.524811, 1, 0.01960784, 0, 1,
-2.505395, 0.7915485, -1.785453, 1, 0.02352941, 0, 1,
-2.49868, 0.317034, 0.05626243, 1, 0.03137255, 0, 1,
-2.394095, 0.2356977, -2.558813, 1, 0.03529412, 0, 1,
-2.37759, 0.1565849, -2.467806, 1, 0.04313726, 0, 1,
-2.33457, -1.126464, 0.4105162, 1, 0.04705882, 0, 1,
-2.297803, -1.958098, -2.321434, 1, 0.05490196, 0, 1,
-2.283455, -1.188811, 0.3205272, 1, 0.05882353, 0, 1,
-2.262466, -0.7195582, -0.3386199, 1, 0.06666667, 0, 1,
-2.212436, -0.5948177, -0.8362976, 1, 0.07058824, 0, 1,
-2.112031, -1.296589, 0.2589436, 1, 0.07843138, 0, 1,
-2.097346, 0.4215453, 0.49238, 1, 0.08235294, 0, 1,
-2.073872, 2.419365, -1.703007, 1, 0.09019608, 0, 1,
-2.072742, -0.8777753, -1.520749, 1, 0.09411765, 0, 1,
-2.02519, 0.07080429, -1.084659, 1, 0.1019608, 0, 1,
-2.022653, 1.083452, -0.4575331, 1, 0.1098039, 0, 1,
-2.010316, 1.026536, 0.7850305, 1, 0.1137255, 0, 1,
-1.973673, 0.605308, 0.01391191, 1, 0.1215686, 0, 1,
-1.962336, -0.4317641, -3.06094, 1, 0.1254902, 0, 1,
-1.96046, 0.8911464, -0.9876851, 1, 0.1333333, 0, 1,
-1.949072, -0.8420568, -1.376988, 1, 0.1372549, 0, 1,
-1.935377, -0.5386922, -1.914757, 1, 0.145098, 0, 1,
-1.93209, 0.1886148, -1.130542, 1, 0.1490196, 0, 1,
-1.926423, 0.4912034, -0.4170276, 1, 0.1568628, 0, 1,
-1.918036, 0.6661722, 0.3727841, 1, 0.1607843, 0, 1,
-1.907295, 1.20679, -3.229442, 1, 0.1686275, 0, 1,
-1.898211, -0.4680559, -2.486874, 1, 0.172549, 0, 1,
-1.841611, 0.924626, -1.171812, 1, 0.1803922, 0, 1,
-1.828242, -0.08182234, -2.033879, 1, 0.1843137, 0, 1,
-1.814226, -0.5558624, -1.964261, 1, 0.1921569, 0, 1,
-1.805739, -0.6896149, -3.150309, 1, 0.1960784, 0, 1,
-1.746123, -0.464171, -2.24157, 1, 0.2039216, 0, 1,
-1.67548, 1.25979, 0.3241248, 1, 0.2117647, 0, 1,
-1.673836, 1.068877, -1.093526, 1, 0.2156863, 0, 1,
-1.654517, -0.8823901, -2.848799, 1, 0.2235294, 0, 1,
-1.618842, -0.8613363, -3.105392, 1, 0.227451, 0, 1,
-1.613439, -1.207884, -2.570454, 1, 0.2352941, 0, 1,
-1.612852, 0.09155215, -2.948648, 1, 0.2392157, 0, 1,
-1.589205, 1.034465, -2.186192, 1, 0.2470588, 0, 1,
-1.578747, 0.4465071, -0.471429, 1, 0.2509804, 0, 1,
-1.576862, -0.5959933, -2.401958, 1, 0.2588235, 0, 1,
-1.570644, 1.440991, 0.008886758, 1, 0.2627451, 0, 1,
-1.558287, 0.8283263, -2.75682, 1, 0.2705882, 0, 1,
-1.55427, -1.515111, -2.760404, 1, 0.2745098, 0, 1,
-1.551001, -0.978227, -0.7523934, 1, 0.282353, 0, 1,
-1.546781, -0.6375174, -1.718178, 1, 0.2862745, 0, 1,
-1.545096, -1.694691, -0.7414395, 1, 0.2941177, 0, 1,
-1.53673, 0.2667665, -2.500907, 1, 0.3019608, 0, 1,
-1.53238, -0.620798, -0.9945229, 1, 0.3058824, 0, 1,
-1.51367, -0.2976614, -2.213749, 1, 0.3137255, 0, 1,
-1.50533, 1.897045, -0.1492525, 1, 0.3176471, 0, 1,
-1.492402, -0.4851376, -2.437144, 1, 0.3254902, 0, 1,
-1.472117, -0.08669491, -3.311274, 1, 0.3294118, 0, 1,
-1.459534, 1.578943, -1.493476, 1, 0.3372549, 0, 1,
-1.455998, -1.034917, -2.100008, 1, 0.3411765, 0, 1,
-1.455901, -0.9777281, -1.479073, 1, 0.3490196, 0, 1,
-1.454843, -1.869631, -1.905147, 1, 0.3529412, 0, 1,
-1.453113, 0.4671057, -0.09273101, 1, 0.3607843, 0, 1,
-1.449714, 1.254097, -1.941414, 1, 0.3647059, 0, 1,
-1.432179, 0.4105032, -1.26838, 1, 0.372549, 0, 1,
-1.426782, -1.784466, -2.037463, 1, 0.3764706, 0, 1,
-1.426295, 0.4233575, -0.6856847, 1, 0.3843137, 0, 1,
-1.424347, 1.013947, -1.47336, 1, 0.3882353, 0, 1,
-1.392412, -1.504964, -2.238961, 1, 0.3960784, 0, 1,
-1.383895, 1.318838, 0.2784384, 1, 0.4039216, 0, 1,
-1.378647, -0.2537885, -1.910891, 1, 0.4078431, 0, 1,
-1.372101, 1.783278, 0.5426733, 1, 0.4156863, 0, 1,
-1.366196, -0.3321686, -2.675026, 1, 0.4196078, 0, 1,
-1.363517, 0.4614035, -3.708616, 1, 0.427451, 0, 1,
-1.344931, -0.04058116, -0.9198636, 1, 0.4313726, 0, 1,
-1.341847, -0.4854984, -1.050095, 1, 0.4392157, 0, 1,
-1.334751, 0.08017492, -1.056117, 1, 0.4431373, 0, 1,
-1.328788, 2.495661, -2.381474, 1, 0.4509804, 0, 1,
-1.318572, -2.997482, -2.995967, 1, 0.454902, 0, 1,
-1.308483, 0.1621229, -3.645408, 1, 0.4627451, 0, 1,
-1.302559, 0.6209459, -2.726748, 1, 0.4666667, 0, 1,
-1.287454, 1.226898, -0.9708248, 1, 0.4745098, 0, 1,
-1.274516, -1.773844, -2.395188, 1, 0.4784314, 0, 1,
-1.270179, 1.546302, 0.06303019, 1, 0.4862745, 0, 1,
-1.26039, 1.570771, -1.592263, 1, 0.4901961, 0, 1,
-1.258862, 0.1639055, -1.990731, 1, 0.4980392, 0, 1,
-1.255976, -0.3059448, -0.2274424, 1, 0.5058824, 0, 1,
-1.252282, -0.214697, -2.086386, 1, 0.509804, 0, 1,
-1.250446, -0.2403908, -0.08699544, 1, 0.5176471, 0, 1,
-1.246706, -0.04815343, -1.752849, 1, 0.5215687, 0, 1,
-1.24056, 2.050383, -1.175706, 1, 0.5294118, 0, 1,
-1.233936, -0.5507442, -1.757736, 1, 0.5333334, 0, 1,
-1.210674, -0.9322427, -2.811159, 1, 0.5411765, 0, 1,
-1.208799, -0.013936, -2.153419, 1, 0.5450981, 0, 1,
-1.207076, -0.08987892, -0.9325249, 1, 0.5529412, 0, 1,
-1.207025, -0.09853864, -1.105432, 1, 0.5568628, 0, 1,
-1.198998, 0.3584945, -4.312837, 1, 0.5647059, 0, 1,
-1.191291, 1.604447, 0.8612037, 1, 0.5686275, 0, 1,
-1.189016, -0.9031014, -2.969191, 1, 0.5764706, 0, 1,
-1.188469, 2.726492, 0.06966961, 1, 0.5803922, 0, 1,
-1.186702, -0.1007915, -2.87002, 1, 0.5882353, 0, 1,
-1.185262, -0.2444052, -0.7674959, 1, 0.5921569, 0, 1,
-1.171533, 0.2222943, -1.695757, 1, 0.6, 0, 1,
-1.171414, -1.030563, -2.070995, 1, 0.6078432, 0, 1,
-1.17019, 0.05366902, -2.424014, 1, 0.6117647, 0, 1,
-1.151156, 0.7668592, 0.7835827, 1, 0.6196079, 0, 1,
-1.148974, -0.05071967, -1.95181, 1, 0.6235294, 0, 1,
-1.13818, -1.505608, -2.048204, 1, 0.6313726, 0, 1,
-1.114839, -0.3380157, -2.219619, 1, 0.6352941, 0, 1,
-1.110918, 0.4096813, -0.958513, 1, 0.6431373, 0, 1,
-1.101241, -0.3285942, -4.618918, 1, 0.6470588, 0, 1,
-1.096639, 0.6762323, -2.385648, 1, 0.654902, 0, 1,
-1.086273, -1.324585, -2.586383, 1, 0.6588235, 0, 1,
-1.08075, 1.099854, -1.072951, 1, 0.6666667, 0, 1,
-1.077292, -0.4333935, -2.056389, 1, 0.6705883, 0, 1,
-1.074459, -0.1241893, -2.218711, 1, 0.6784314, 0, 1,
-1.073524, 1.982721, 0.1627124, 1, 0.682353, 0, 1,
-1.070218, -1.18736, -0.8021368, 1, 0.6901961, 0, 1,
-1.06808, 1.633085, -0.1012624, 1, 0.6941177, 0, 1,
-1.060984, 1.897116, 0.4892777, 1, 0.7019608, 0, 1,
-1.059224, -0.1799367, -3.605588, 1, 0.7098039, 0, 1,
-1.059093, -0.0745802, -3.563648, 1, 0.7137255, 0, 1,
-1.056469, 0.1406515, -2.423882, 1, 0.7215686, 0, 1,
-1.055341, -1.46373, -1.828407, 1, 0.7254902, 0, 1,
-1.047679, 0.07123753, -1.316058, 1, 0.7333333, 0, 1,
-1.043095, 0.7271736, -1.154659, 1, 0.7372549, 0, 1,
-1.042765, 0.03197525, -0.650928, 1, 0.7450981, 0, 1,
-1.041498, -0.8522359, -2.702039, 1, 0.7490196, 0, 1,
-1.031156, -1.16216, -2.338085, 1, 0.7568628, 0, 1,
-1.030092, 0.6088333, -1.349742, 1, 0.7607843, 0, 1,
-1.02675, 2.014255, 0.05409082, 1, 0.7686275, 0, 1,
-1.026504, -0.6683624, -3.073828, 1, 0.772549, 0, 1,
-1.019461, -0.02775797, -0.0574322, 1, 0.7803922, 0, 1,
-1.01885, 0.5888138, -1.372697, 1, 0.7843137, 0, 1,
-1.017613, 1.875021, -0.982161, 1, 0.7921569, 0, 1,
-1.004741, -0.4902684, -1.78422, 1, 0.7960784, 0, 1,
-1.001086, 0.5275854, -0.6652151, 1, 0.8039216, 0, 1,
-0.9987118, -0.4467467, -0.6579641, 1, 0.8117647, 0, 1,
-0.9980395, 1.06256, 0.09631174, 1, 0.8156863, 0, 1,
-0.9946777, 0.1163212, -2.493612, 1, 0.8235294, 0, 1,
-0.9943554, 0.438636, -2.362533, 1, 0.827451, 0, 1,
-0.9877509, 0.299718, -1.337888, 1, 0.8352941, 0, 1,
-0.9871246, 0.5910636, -0.5704415, 1, 0.8392157, 0, 1,
-0.984688, -0.3273229, -3.340676, 1, 0.8470588, 0, 1,
-0.9845499, 0.1631965, 0.1697319, 1, 0.8509804, 0, 1,
-0.9831252, -2.651299, -2.229478, 1, 0.8588235, 0, 1,
-0.9790691, -1.142091, -0.3759723, 1, 0.8627451, 0, 1,
-0.9790539, 0.07329519, -1.23738, 1, 0.8705882, 0, 1,
-0.9777017, -0.3998286, -0.9200157, 1, 0.8745098, 0, 1,
-0.9769933, 1.195112, -0.4740202, 1, 0.8823529, 0, 1,
-0.9763655, 0.5502262, -0.2858864, 1, 0.8862745, 0, 1,
-0.9708462, 0.04700411, -0.06084581, 1, 0.8941177, 0, 1,
-0.9705179, 0.6452457, -0.09488468, 1, 0.8980392, 0, 1,
-0.9696606, 2.294666, 0.2399722, 1, 0.9058824, 0, 1,
-0.9673464, -0.5429507, -1.764284, 1, 0.9137255, 0, 1,
-0.9672801, -1.022047, -1.998961, 1, 0.9176471, 0, 1,
-0.9590045, -2.011992, -2.997109, 1, 0.9254902, 0, 1,
-0.954538, 1.018769, -0.09629637, 1, 0.9294118, 0, 1,
-0.9488543, 0.6159525, -2.910628, 1, 0.9372549, 0, 1,
-0.9342279, 0.5386862, 0.110619, 1, 0.9411765, 0, 1,
-0.9288177, -0.3381723, -3.253528, 1, 0.9490196, 0, 1,
-0.9200994, 1.90246, -2.314975, 1, 0.9529412, 0, 1,
-0.9166501, 0.847368, 1.774941, 1, 0.9607843, 0, 1,
-0.9156561, -1.330933, -2.540723, 1, 0.9647059, 0, 1,
-0.908147, 1.633748, 1.763293, 1, 0.972549, 0, 1,
-0.9076203, -1.399432, -1.871416, 1, 0.9764706, 0, 1,
-0.9056008, 0.02164227, -3.096592, 1, 0.9843137, 0, 1,
-0.9043499, 0.4086743, -0.3114359, 1, 0.9882353, 0, 1,
-0.9037063, -1.47659, -3.315145, 1, 0.9960784, 0, 1,
-0.903121, -1.377824, -1.442488, 0.9960784, 1, 0, 1,
-0.8983218, 0.3478787, -0.2117357, 0.9921569, 1, 0, 1,
-0.8947518, -0.6530544, -1.637641, 0.9843137, 1, 0, 1,
-0.8844385, 0.5613278, -1.062454, 0.9803922, 1, 0, 1,
-0.8753265, 1.304406, 1.332109, 0.972549, 1, 0, 1,
-0.874862, -1.300477, -3.506002, 0.9686275, 1, 0, 1,
-0.8693814, 1.034952, -2.704268, 0.9607843, 1, 0, 1,
-0.8649154, 0.7649719, -2.719997, 0.9568627, 1, 0, 1,
-0.857657, 1.062807, 0.7602224, 0.9490196, 1, 0, 1,
-0.8546145, -0.5309357, -3.137167, 0.945098, 1, 0, 1,
-0.8539614, 0.1351785, -2.801706, 0.9372549, 1, 0, 1,
-0.8533507, -0.01719806, -2.592788, 0.9333333, 1, 0, 1,
-0.8523487, -0.3317345, -3.341574, 0.9254902, 1, 0, 1,
-0.8511478, -1.217295, -2.856095, 0.9215686, 1, 0, 1,
-0.8500084, 0.6470224, -0.6972374, 0.9137255, 1, 0, 1,
-0.8479055, -1.386649, -3.505631, 0.9098039, 1, 0, 1,
-0.8471549, -1.029091, -1.759498, 0.9019608, 1, 0, 1,
-0.8429971, 0.1681624, -2.687253, 0.8941177, 1, 0, 1,
-0.8403696, -0.2090953, -1.669371, 0.8901961, 1, 0, 1,
-0.8346602, -0.1123645, -2.372131, 0.8823529, 1, 0, 1,
-0.8264486, 1.710416, 0.6397631, 0.8784314, 1, 0, 1,
-0.8195292, 1.574736, -0.0906675, 0.8705882, 1, 0, 1,
-0.8191429, 0.3542028, -1.700339, 0.8666667, 1, 0, 1,
-0.8185439, -0.6136596, -3.004948, 0.8588235, 1, 0, 1,
-0.8174344, -0.7404357, -1.972378, 0.854902, 1, 0, 1,
-0.8163878, -0.6850479, -4.464539, 0.8470588, 1, 0, 1,
-0.8157895, 0.4387245, -2.446085, 0.8431373, 1, 0, 1,
-0.8135862, -0.3063096, -0.9352999, 0.8352941, 1, 0, 1,
-0.8107958, -0.5189114, -2.250882, 0.8313726, 1, 0, 1,
-0.8087258, -1.520584, -3.788697, 0.8235294, 1, 0, 1,
-0.8087115, -0.3931236, -3.045636, 0.8196079, 1, 0, 1,
-0.8074757, -0.5803418, -0.3780846, 0.8117647, 1, 0, 1,
-0.8064219, -0.09249039, -0.7539273, 0.8078431, 1, 0, 1,
-0.8052061, -0.09873488, -2.926879, 0.8, 1, 0, 1,
-0.8040608, -0.9137832, -2.641721, 0.7921569, 1, 0, 1,
-0.8026459, -0.1047182, -1.649511, 0.7882353, 1, 0, 1,
-0.7988578, -0.09441088, -2.639635, 0.7803922, 1, 0, 1,
-0.7985224, -0.05470189, -2.157781, 0.7764706, 1, 0, 1,
-0.7946715, 0.4676219, -1.897452, 0.7686275, 1, 0, 1,
-0.7895603, -1.057903, -3.990288, 0.7647059, 1, 0, 1,
-0.7892926, -1.365952, -1.442287, 0.7568628, 1, 0, 1,
-0.7864317, 0.7828909, -1.325737, 0.7529412, 1, 0, 1,
-0.7857452, -1.004977, -1.80951, 0.7450981, 1, 0, 1,
-0.7840328, 1.587637, 0.1878921, 0.7411765, 1, 0, 1,
-0.7829484, -0.08315337, -0.954636, 0.7333333, 1, 0, 1,
-0.7822591, -0.5329394, -0.8118874, 0.7294118, 1, 0, 1,
-0.7738129, -1.281287, -1.397426, 0.7215686, 1, 0, 1,
-0.7693585, 1.195812, -1.382435, 0.7176471, 1, 0, 1,
-0.7659059, 2.066286, 0.733137, 0.7098039, 1, 0, 1,
-0.7650335, -1.11088, -2.929804, 0.7058824, 1, 0, 1,
-0.7613737, 1.176182, -0.1196752, 0.6980392, 1, 0, 1,
-0.7613286, -1.245539, -3.01504, 0.6901961, 1, 0, 1,
-0.7605936, -0.6313063, -2.202644, 0.6862745, 1, 0, 1,
-0.758132, -0.7118207, -1.805961, 0.6784314, 1, 0, 1,
-0.7554195, -1.381651, -3.654277, 0.6745098, 1, 0, 1,
-0.7550917, 0.4485867, -1.425764, 0.6666667, 1, 0, 1,
-0.754797, -0.9862077, -1.448499, 0.6627451, 1, 0, 1,
-0.7542062, 0.1740021, -1.660912, 0.654902, 1, 0, 1,
-0.7490997, 0.6314113, -1.448302, 0.6509804, 1, 0, 1,
-0.7439449, 0.5408657, -2.461736, 0.6431373, 1, 0, 1,
-0.7438461, 0.8575235, -1.526921, 0.6392157, 1, 0, 1,
-0.7414272, 0.8319806, 0.704901, 0.6313726, 1, 0, 1,
-0.732776, 1.078743, -0.3517498, 0.627451, 1, 0, 1,
-0.7311679, 0.3902047, -2.604729, 0.6196079, 1, 0, 1,
-0.7298852, 0.3508469, -1.103523, 0.6156863, 1, 0, 1,
-0.7281768, -0.9841047, -1.456874, 0.6078432, 1, 0, 1,
-0.7257886, 0.5870572, -1.251814, 0.6039216, 1, 0, 1,
-0.7186765, -0.01413886, -1.531713, 0.5960785, 1, 0, 1,
-0.7183946, -0.5560225, -1.556336, 0.5882353, 1, 0, 1,
-0.7158691, 0.5027164, 0.1146981, 0.5843138, 1, 0, 1,
-0.6890603, -0.437036, -1.452722, 0.5764706, 1, 0, 1,
-0.6889334, -0.3943779, -2.437233, 0.572549, 1, 0, 1,
-0.6856763, 1.075116, 0.2166023, 0.5647059, 1, 0, 1,
-0.6843849, 0.02858035, -3.835178, 0.5607843, 1, 0, 1,
-0.682858, 0.2366447, -2.350658, 0.5529412, 1, 0, 1,
-0.6827034, -0.3390787, -2.546396, 0.5490196, 1, 0, 1,
-0.6766, 0.6243706, -1.812022, 0.5411765, 1, 0, 1,
-0.6725896, 1.224048, 0.8651057, 0.5372549, 1, 0, 1,
-0.6714176, 1.161877, -0.5513883, 0.5294118, 1, 0, 1,
-0.6636361, 0.7421968, -0.2402965, 0.5254902, 1, 0, 1,
-0.6595802, 2.354509, 0.3072114, 0.5176471, 1, 0, 1,
-0.6576358, -0.4822454, -3.147194, 0.5137255, 1, 0, 1,
-0.6491586, -0.8137729, -1.420456, 0.5058824, 1, 0, 1,
-0.6390895, -2.241403, -3.804146, 0.5019608, 1, 0, 1,
-0.6384708, 1.328526, 1.855113, 0.4941176, 1, 0, 1,
-0.6359898, -0.8068277, -2.425565, 0.4862745, 1, 0, 1,
-0.6355389, 1.2982, -0.7173792, 0.4823529, 1, 0, 1,
-0.63428, 0.1919726, -1.941911, 0.4745098, 1, 0, 1,
-0.631172, 0.07585986, 0.114999, 0.4705882, 1, 0, 1,
-0.6206741, -0.4557515, -0.8029045, 0.4627451, 1, 0, 1,
-0.6205288, -0.4513788, -1.031512, 0.4588235, 1, 0, 1,
-0.6168469, -0.3523506, -2.780672, 0.4509804, 1, 0, 1,
-0.6127551, -0.9003838, -3.62486, 0.4470588, 1, 0, 1,
-0.6104972, 0.8125688, -1.826823, 0.4392157, 1, 0, 1,
-0.6096061, -0.7305219, -1.385536, 0.4352941, 1, 0, 1,
-0.6088415, -0.3125115, -2.762223, 0.427451, 1, 0, 1,
-0.6086837, 0.6121875, -1.100402, 0.4235294, 1, 0, 1,
-0.6083984, -0.7503671, -2.553698, 0.4156863, 1, 0, 1,
-0.607895, -0.190845, -4.752693, 0.4117647, 1, 0, 1,
-0.5961005, 2.447511, -1.969241, 0.4039216, 1, 0, 1,
-0.5950089, 0.8258657, 0.4465902, 0.3960784, 1, 0, 1,
-0.5947801, -0.5310811, -1.06968, 0.3921569, 1, 0, 1,
-0.5925509, -1.180991, -4.109115, 0.3843137, 1, 0, 1,
-0.591586, 0.8363352, -1.758837, 0.3803922, 1, 0, 1,
-0.5870157, -0.4892337, -4.461247, 0.372549, 1, 0, 1,
-0.5721073, -0.4562986, -1.791038, 0.3686275, 1, 0, 1,
-0.570924, -0.1714421, -1.979005, 0.3607843, 1, 0, 1,
-0.5647801, -0.8203237, -2.551269, 0.3568628, 1, 0, 1,
-0.5641612, -1.056609, -3.470461, 0.3490196, 1, 0, 1,
-0.560331, 0.5812568, 0.4441915, 0.345098, 1, 0, 1,
-0.5585962, -0.3216043, -2.974546, 0.3372549, 1, 0, 1,
-0.5584074, 0.8369658, -0.1400113, 0.3333333, 1, 0, 1,
-0.5563403, 0.1542532, -1.820676, 0.3254902, 1, 0, 1,
-0.5539141, -0.7679356, -2.460226, 0.3215686, 1, 0, 1,
-0.553663, -0.840672, -3.492113, 0.3137255, 1, 0, 1,
-0.5533233, 0.4231152, -0.7769731, 0.3098039, 1, 0, 1,
-0.5446874, -2.011369, -3.338814, 0.3019608, 1, 0, 1,
-0.5435356, -0.2331795, -2.919855, 0.2941177, 1, 0, 1,
-0.5423428, -0.1824886, -1.718827, 0.2901961, 1, 0, 1,
-0.5422169, 0.9339712, -1.085186, 0.282353, 1, 0, 1,
-0.5340374, 0.6541469, -0.7483854, 0.2784314, 1, 0, 1,
-0.5313717, 0.4268124, 0.8686867, 0.2705882, 1, 0, 1,
-0.5290571, 0.5487255, 1.645324, 0.2666667, 1, 0, 1,
-0.5287043, -0.4970041, -1.550271, 0.2588235, 1, 0, 1,
-0.5239272, 0.534431, -1.229859, 0.254902, 1, 0, 1,
-0.5212626, -0.1555022, -2.513486, 0.2470588, 1, 0, 1,
-0.5211348, -0.08793204, -0.7554725, 0.2431373, 1, 0, 1,
-0.5154329, -0.8865829, -1.708573, 0.2352941, 1, 0, 1,
-0.5148893, -0.3498304, -1.755836, 0.2313726, 1, 0, 1,
-0.5148772, 2.198032, 0.8667358, 0.2235294, 1, 0, 1,
-0.5094906, 1.049285, -1.051725, 0.2196078, 1, 0, 1,
-0.5030749, -0.0271927, -1.609944, 0.2117647, 1, 0, 1,
-0.5016794, 1.443997, 0.7381064, 0.2078431, 1, 0, 1,
-0.5000414, -0.08011957, -1.237665, 0.2, 1, 0, 1,
-0.4994883, -0.474094, -3.352101, 0.1921569, 1, 0, 1,
-0.4974718, 0.1355871, -0.378938, 0.1882353, 1, 0, 1,
-0.4971234, -0.1857188, -1.387414, 0.1803922, 1, 0, 1,
-0.4956477, 0.8557898, -2.636466, 0.1764706, 1, 0, 1,
-0.4910747, -1.072358, -3.787013, 0.1686275, 1, 0, 1,
-0.4770159, 0.8375638, -1.037467, 0.1647059, 1, 0, 1,
-0.4753613, 1.095484, -1.684609, 0.1568628, 1, 0, 1,
-0.4753508, 0.5725244, 0.7725434, 0.1529412, 1, 0, 1,
-0.4647827, 0.1833213, -1.081087, 0.145098, 1, 0, 1,
-0.4599157, 0.8269615, -0.4550605, 0.1411765, 1, 0, 1,
-0.4589239, 0.5242311, 0.05495642, 0.1333333, 1, 0, 1,
-0.4565006, -1.695832, -4.724415, 0.1294118, 1, 0, 1,
-0.4542207, 1.168549, -0.6177582, 0.1215686, 1, 0, 1,
-0.4539833, 0.8255031, -0.7902359, 0.1176471, 1, 0, 1,
-0.4526779, -0.6759576, -1.652378, 0.1098039, 1, 0, 1,
-0.4465964, -0.4707074, -1.790254, 0.1058824, 1, 0, 1,
-0.4455362, 1.004945, -0.9883956, 0.09803922, 1, 0, 1,
-0.4430908, -0.05176375, -2.501068, 0.09019608, 1, 0, 1,
-0.4426409, -1.461645, -2.55076, 0.08627451, 1, 0, 1,
-0.4381697, -0.001709572, 0.07151876, 0.07843138, 1, 0, 1,
-0.4306979, 0.8203256, -1.645293, 0.07450981, 1, 0, 1,
-0.424421, 0.6425781, -0.312642, 0.06666667, 1, 0, 1,
-0.4243428, 2.054368, 1.746021, 0.0627451, 1, 0, 1,
-0.4177959, 0.6230347, -1.309976, 0.05490196, 1, 0, 1,
-0.4156895, 0.1892072, -1.333847, 0.05098039, 1, 0, 1,
-0.4136525, 1.376018, -0.5758842, 0.04313726, 1, 0, 1,
-0.4129347, 0.03032606, -0.7945097, 0.03921569, 1, 0, 1,
-0.4009223, 0.03727102, -2.780929, 0.03137255, 1, 0, 1,
-0.3994205, -0.09670065, -1.596245, 0.02745098, 1, 0, 1,
-0.3981911, -0.0997417, -2.587361, 0.01960784, 1, 0, 1,
-0.3955569, 0.06927487, -0.6647843, 0.01568628, 1, 0, 1,
-0.395185, 0.9516233, -0.3293125, 0.007843138, 1, 0, 1,
-0.3841408, 0.1870851, -2.085641, 0.003921569, 1, 0, 1,
-0.380838, 0.1664823, -0.6495256, 0, 1, 0.003921569, 1,
-0.3783802, 0.1865575, -3.144468, 0, 1, 0.01176471, 1,
-0.3755256, 1.17039, 0.4950851, 0, 1, 0.01568628, 1,
-0.3711544, 2.371306, 1.904421, 0, 1, 0.02352941, 1,
-0.3694486, 0.709554, 0.2915184, 0, 1, 0.02745098, 1,
-0.3693317, -0.9795411, -3.002229, 0, 1, 0.03529412, 1,
-0.3664325, -0.4218047, -1.554096, 0, 1, 0.03921569, 1,
-0.3659454, -0.4095351, -1.500167, 0, 1, 0.04705882, 1,
-0.3636435, 0.1862115, 0.17387, 0, 1, 0.05098039, 1,
-0.3633153, -0.02683194, -1.163895, 0, 1, 0.05882353, 1,
-0.359048, 0.6084425, -1.510064, 0, 1, 0.0627451, 1,
-0.3569152, -0.2938277, 0.3144718, 0, 1, 0.07058824, 1,
-0.3526172, -1.42453, -3.135241, 0, 1, 0.07450981, 1,
-0.352079, -0.4686963, -2.875695, 0, 1, 0.08235294, 1,
-0.3456921, 1.492993, 1.699177, 0, 1, 0.08627451, 1,
-0.3452345, -0.4799702, -1.937788, 0, 1, 0.09411765, 1,
-0.3396289, -0.1408561, -2.411993, 0, 1, 0.1019608, 1,
-0.3380928, -0.4875816, -2.477166, 0, 1, 0.1058824, 1,
-0.3340782, 0.3186131, -1.356361, 0, 1, 0.1137255, 1,
-0.3274226, -0.6554283, -0.6922284, 0, 1, 0.1176471, 1,
-0.3270764, 0.2058247, -1.849693, 0, 1, 0.1254902, 1,
-0.3266752, 0.6507239, -0.1599739, 0, 1, 0.1294118, 1,
-0.325679, -0.07004318, -2.319202, 0, 1, 0.1372549, 1,
-0.3213298, -0.419526, -2.351784, 0, 1, 0.1411765, 1,
-0.3211875, -1.370964, -1.795482, 0, 1, 0.1490196, 1,
-0.319237, -0.22455, -3.630522, 0, 1, 0.1529412, 1,
-0.318182, -0.09147871, -1.26939, 0, 1, 0.1607843, 1,
-0.3159809, 0.225677, -0.241449, 0, 1, 0.1647059, 1,
-0.3132431, 1.246193, -1.465083, 0, 1, 0.172549, 1,
-0.3125546, 0.6760226, -1.615018, 0, 1, 0.1764706, 1,
-0.3120462, 0.4331987, -1.855338, 0, 1, 0.1843137, 1,
-0.3110597, 0.2827142, -3.21738, 0, 1, 0.1882353, 1,
-0.3056796, -1.252822, -4.36902, 0, 1, 0.1960784, 1,
-0.3049106, 0.4452174, -0.4937281, 0, 1, 0.2039216, 1,
-0.3034599, -0.821146, -3.488085, 0, 1, 0.2078431, 1,
-0.3023715, -0.6099394, -3.723663, 0, 1, 0.2156863, 1,
-0.2966621, 0.1535316, -1.583289, 0, 1, 0.2196078, 1,
-0.2962047, -0.4599782, -1.458249, 0, 1, 0.227451, 1,
-0.2939831, 0.6665502, 0.6081068, 0, 1, 0.2313726, 1,
-0.292832, -1.202546, -3.133071, 0, 1, 0.2392157, 1,
-0.2926002, 1.024024, -0.3847264, 0, 1, 0.2431373, 1,
-0.2916549, -1.532287, -1.228306, 0, 1, 0.2509804, 1,
-0.2875794, 0.148652, -2.485048, 0, 1, 0.254902, 1,
-0.2826275, -0.5473248, -1.797512, 0, 1, 0.2627451, 1,
-0.2821036, 0.4589937, -1.106676, 0, 1, 0.2666667, 1,
-0.2810051, -1.218096, -1.445411, 0, 1, 0.2745098, 1,
-0.2781551, -1.178366, -3.389828, 0, 1, 0.2784314, 1,
-0.268708, 0.3959307, -1.80522, 0, 1, 0.2862745, 1,
-0.2678862, 0.213169, -1.570088, 0, 1, 0.2901961, 1,
-0.2639295, 1.102779, -1.412551, 0, 1, 0.2980392, 1,
-0.2622886, 2.19483, -0.05528705, 0, 1, 0.3058824, 1,
-0.2598047, -0.2480966, -2.115512, 0, 1, 0.3098039, 1,
-0.2558811, -1.094187, -2.294824, 0, 1, 0.3176471, 1,
-0.2536673, -0.5063106, -2.867549, 0, 1, 0.3215686, 1,
-0.2521006, -0.1276135, -3.515288, 0, 1, 0.3294118, 1,
-0.2492547, 1.961198, 0.9603295, 0, 1, 0.3333333, 1,
-0.2488007, 0.2020889, -0.3331055, 0, 1, 0.3411765, 1,
-0.2403539, -0.3026123, -3.261096, 0, 1, 0.345098, 1,
-0.2364623, 1.283011, -0.1624098, 0, 1, 0.3529412, 1,
-0.2362965, -0.8733526, -2.622389, 0, 1, 0.3568628, 1,
-0.2349684, 0.6443681, 0.6016595, 0, 1, 0.3647059, 1,
-0.2320421, -1.361856, -2.860985, 0, 1, 0.3686275, 1,
-0.2295308, 0.1060695, -2.530903, 0, 1, 0.3764706, 1,
-0.229284, 0.4046317, -0.9857603, 0, 1, 0.3803922, 1,
-0.2256035, -0.3010936, -2.73511, 0, 1, 0.3882353, 1,
-0.2254556, -1.516782, -4.08301, 0, 1, 0.3921569, 1,
-0.2233023, 1.565833, -1.331889, 0, 1, 0.4, 1,
-0.2224252, 0.4514568, -0.565538, 0, 1, 0.4078431, 1,
-0.2214878, 0.136269, -2.081976, 0, 1, 0.4117647, 1,
-0.2212694, 0.8853583, -0.9119814, 0, 1, 0.4196078, 1,
-0.2207702, 0.05517686, -2.531675, 0, 1, 0.4235294, 1,
-0.218995, -1.1368, -2.983201, 0, 1, 0.4313726, 1,
-0.2174034, -0.3037676, -1.709479, 0, 1, 0.4352941, 1,
-0.2106583, -2.023669, -2.122006, 0, 1, 0.4431373, 1,
-0.2092759, 0.2601463, -1.211741, 0, 1, 0.4470588, 1,
-0.2088546, -0.8077281, -2.499571, 0, 1, 0.454902, 1,
-0.2082384, -1.720451, -3.553677, 0, 1, 0.4588235, 1,
-0.2070433, -0.968882, -2.028665, 0, 1, 0.4666667, 1,
-0.2055107, 0.1894018, -0.5947509, 0, 1, 0.4705882, 1,
-0.202714, 3.111292, -1.057521, 0, 1, 0.4784314, 1,
-0.199641, -1.524357, -3.7426, 0, 1, 0.4823529, 1,
-0.1983978, 0.3471012, -0.9840446, 0, 1, 0.4901961, 1,
-0.1954333, -0.06666409, -2.361019, 0, 1, 0.4941176, 1,
-0.1936836, 0.7348207, -0.5702079, 0, 1, 0.5019608, 1,
-0.1929509, 0.838439, -1.194606, 0, 1, 0.509804, 1,
-0.1924322, -0.7465494, -2.097056, 0, 1, 0.5137255, 1,
-0.1914861, -0.2207814, -1.768498, 0, 1, 0.5215687, 1,
-0.1904947, 0.807178, -0.2241825, 0, 1, 0.5254902, 1,
-0.1899564, -0.4874381, -4.792767, 0, 1, 0.5333334, 1,
-0.1878707, -1.360312, -2.586828, 0, 1, 0.5372549, 1,
-0.1870133, 0.109389, 0.3731458, 0, 1, 0.5450981, 1,
-0.1856086, -0.6606728, -2.532153, 0, 1, 0.5490196, 1,
-0.1754124, 0.8752009, -0.1638208, 0, 1, 0.5568628, 1,
-0.1730255, 0.4318119, -0.2837278, 0, 1, 0.5607843, 1,
-0.1727938, -0.533516, -1.318469, 0, 1, 0.5686275, 1,
-0.1726732, 0.2176215, -0.4740606, 0, 1, 0.572549, 1,
-0.1722949, 0.2306758, -1.593575, 0, 1, 0.5803922, 1,
-0.1708639, 0.4868942, -1.150459, 0, 1, 0.5843138, 1,
-0.1699175, 1.195917, -1.496347, 0, 1, 0.5921569, 1,
-0.1687959, -0.06471759, -1.525075, 0, 1, 0.5960785, 1,
-0.1668228, -0.5537311, -3.766215, 0, 1, 0.6039216, 1,
-0.1667518, -0.5469081, -3.631828, 0, 1, 0.6117647, 1,
-0.1660394, 1.117602, -0.4659383, 0, 1, 0.6156863, 1,
-0.1642722, -0.2668525, -1.474888, 0, 1, 0.6235294, 1,
-0.1639345, -0.6485745, -1.558788, 0, 1, 0.627451, 1,
-0.1637162, -1.428559, -2.114309, 0, 1, 0.6352941, 1,
-0.1602218, -0.8411163, -1.747399, 0, 1, 0.6392157, 1,
-0.1549424, 1.051672, -0.8338436, 0, 1, 0.6470588, 1,
-0.1536237, -0.98377, -3.783573, 0, 1, 0.6509804, 1,
-0.1531076, 0.3547709, -0.548149, 0, 1, 0.6588235, 1,
-0.1469789, 1.468245, 1.203448, 0, 1, 0.6627451, 1,
-0.1455733, -1.469154, -4.389632, 0, 1, 0.6705883, 1,
-0.145043, -1.11872, -1.342314, 0, 1, 0.6745098, 1,
-0.14498, 1.002262, -1.194431, 0, 1, 0.682353, 1,
-0.1439547, 0.7580687, -0.8619903, 0, 1, 0.6862745, 1,
-0.1432934, 0.0496002, -0.4279732, 0, 1, 0.6941177, 1,
-0.1422053, 1.801374, 0.2784715, 0, 1, 0.7019608, 1,
-0.1384024, -0.921119, -3.747947, 0, 1, 0.7058824, 1,
-0.1371749, 0.02437242, -3.046903, 0, 1, 0.7137255, 1,
-0.1363827, 0.920581, -1.412365, 0, 1, 0.7176471, 1,
-0.1301072, 0.9842838, -0.9587346, 0, 1, 0.7254902, 1,
-0.1286021, -0.1360339, -3.200553, 0, 1, 0.7294118, 1,
-0.1279196, 0.1561648, 0.8187917, 0, 1, 0.7372549, 1,
-0.1244173, -0.1323353, -4.661107, 0, 1, 0.7411765, 1,
-0.1220432, -0.4042774, -2.871182, 0, 1, 0.7490196, 1,
-0.1154191, -0.5101845, -1.286513, 0, 1, 0.7529412, 1,
-0.1142888, -1.053301, -3.589526, 0, 1, 0.7607843, 1,
-0.1110749, 0.3805949, -1.647537, 0, 1, 0.7647059, 1,
-0.1095954, -1.556438, -3.442363, 0, 1, 0.772549, 1,
-0.1082777, 2.305763, 0.8391235, 0, 1, 0.7764706, 1,
-0.1073081, 0.5277101, -0.2351827, 0, 1, 0.7843137, 1,
-0.1058946, 0.6715603, 0.373521, 0, 1, 0.7882353, 1,
-0.1056382, -1.776618, -3.709633, 0, 1, 0.7960784, 1,
-0.1029896, -0.1345319, -2.505467, 0, 1, 0.8039216, 1,
-0.1002686, -1.806229, -2.040789, 0, 1, 0.8078431, 1,
-0.09846623, 0.6260433, -0.7291395, 0, 1, 0.8156863, 1,
-0.09774488, 0.3388176, 0.5344012, 0, 1, 0.8196079, 1,
-0.08588352, 0.8060879, 1.642146, 0, 1, 0.827451, 1,
-0.08575111, 0.2215252, -0.8582243, 0, 1, 0.8313726, 1,
-0.08503908, -1.839383, -4.330759, 0, 1, 0.8392157, 1,
-0.07996397, -0.1286432, -2.530548, 0, 1, 0.8431373, 1,
-0.0794265, -2.566672, -2.129998, 0, 1, 0.8509804, 1,
-0.06932931, 1.477462, -0.4910902, 0, 1, 0.854902, 1,
-0.06889184, 0.5614445, -0.6819485, 0, 1, 0.8627451, 1,
-0.06739987, 0.9597347, 1.119067, 0, 1, 0.8666667, 1,
-0.06617972, 1.236426, -1.494469, 0, 1, 0.8745098, 1,
-0.06132197, 1.134559, -1.218767, 0, 1, 0.8784314, 1,
-0.05983276, -3.026599, -2.638158, 0, 1, 0.8862745, 1,
-0.05718066, 0.271277, 0.4796957, 0, 1, 0.8901961, 1,
-0.05428622, -0.04960058, -0.1987558, 0, 1, 0.8980392, 1,
-0.05263823, 0.9182897, 1.395643, 0, 1, 0.9058824, 1,
-0.0524208, 0.6602784, 1.669989, 0, 1, 0.9098039, 1,
-0.04732674, -0.6193079, -2.656176, 0, 1, 0.9176471, 1,
-0.04537059, -0.3625668, -5.101699, 0, 1, 0.9215686, 1,
-0.04021167, 0.02708608, 0.7713913, 0, 1, 0.9294118, 1,
-0.03761727, -0.8946303, -2.752699, 0, 1, 0.9333333, 1,
-0.03630152, 1.664925, 0.3345046, 0, 1, 0.9411765, 1,
-0.03630102, -0.7464256, -3.706882, 0, 1, 0.945098, 1,
-0.03338328, 0.8070982, 0.347223, 0, 1, 0.9529412, 1,
-0.03318119, -1.087827, -5.060755, 0, 1, 0.9568627, 1,
-0.03162031, 1.52735, 0.3067531, 0, 1, 0.9647059, 1,
-0.03093637, -0.1180193, -3.564903, 0, 1, 0.9686275, 1,
-0.03000077, 0.283106, 0.5321035, 0, 1, 0.9764706, 1,
-0.02937998, -1.235551, -3.26364, 0, 1, 0.9803922, 1,
-0.02364465, 0.250735, 0.09644365, 0, 1, 0.9882353, 1,
-0.01659958, -1.601335, -2.449724, 0, 1, 0.9921569, 1,
-0.01277434, -0.443812, -1.941445, 0, 1, 1, 1,
-0.009623204, -0.9211549, -4.814492, 0, 0.9921569, 1, 1,
-0.003124798, -0.6241307, -2.232602, 0, 0.9882353, 1, 1,
-0.002363513, -1.034507, -2.495664, 0, 0.9803922, 1, 1,
-0.002039693, 0.1889956, 0.3274713, 0, 0.9764706, 1, 1,
-0.00150126, 1.045252, 0.1990147, 0, 0.9686275, 1, 1,
0.0004267959, 1.24524, -0.1743193, 0, 0.9647059, 1, 1,
0.001932531, 1.081614, 0.9892728, 0, 0.9568627, 1, 1,
0.004583936, -0.9097608, 5.209106, 0, 0.9529412, 1, 1,
0.009699686, 1.401285, -0.524996, 0, 0.945098, 1, 1,
0.02922037, 0.2494462, 0.9945558, 0, 0.9411765, 1, 1,
0.02961004, -1.153035, 2.685225, 0, 0.9333333, 1, 1,
0.02972594, -0.7986125, 4.658128, 0, 0.9294118, 1, 1,
0.03109006, -0.09413057, 1.849892, 0, 0.9215686, 1, 1,
0.03373899, 1.0104, -0.123305, 0, 0.9176471, 1, 1,
0.03395547, -0.5565121, 2.759051, 0, 0.9098039, 1, 1,
0.03457879, 0.08652741, -1.186131, 0, 0.9058824, 1, 1,
0.03529313, 0.8287203, -1.335646, 0, 0.8980392, 1, 1,
0.03612523, -0.1779006, 2.42022, 0, 0.8901961, 1, 1,
0.03626022, -1.832133, 3.860705, 0, 0.8862745, 1, 1,
0.03689821, 0.5572824, 0.6270365, 0, 0.8784314, 1, 1,
0.03894548, -1.211253, 2.316678, 0, 0.8745098, 1, 1,
0.03926496, 0.3714065, 0.5807734, 0, 0.8666667, 1, 1,
0.0420744, 0.8316036, 0.4520444, 0, 0.8627451, 1, 1,
0.04325112, 1.445383, 0.5956584, 0, 0.854902, 1, 1,
0.04827852, 0.6996691, 0.3495522, 0, 0.8509804, 1, 1,
0.0568826, 0.1470314, 0.6851006, 0, 0.8431373, 1, 1,
0.05943878, -0.8608536, 4.049129, 0, 0.8392157, 1, 1,
0.05961819, 0.1536078, 0.7403707, 0, 0.8313726, 1, 1,
0.06592419, -0.445171, 2.535477, 0, 0.827451, 1, 1,
0.06734184, -0.04580266, 4.173574, 0, 0.8196079, 1, 1,
0.0693619, -0.08095743, 2.67027, 0, 0.8156863, 1, 1,
0.06992387, 1.359302, -0.5432437, 0, 0.8078431, 1, 1,
0.07000589, 0.5786564, 1.532027, 0, 0.8039216, 1, 1,
0.07139575, -0.09655514, 2.763602, 0, 0.7960784, 1, 1,
0.07375199, -0.5569563, 4.078054, 0, 0.7882353, 1, 1,
0.07608144, 0.3311537, 0.4321641, 0, 0.7843137, 1, 1,
0.07631662, 0.1077522, 0.5187202, 0, 0.7764706, 1, 1,
0.07829997, -0.7354871, 2.343695, 0, 0.772549, 1, 1,
0.07945956, -0.06106382, 1.460015, 0, 0.7647059, 1, 1,
0.08201423, -0.3264422, 1.738391, 0, 0.7607843, 1, 1,
0.08721618, 1.242017, 0.2674888, 0, 0.7529412, 1, 1,
0.08833881, 1.156288, -0.1057591, 0, 0.7490196, 1, 1,
0.08849753, 1.779933, 1.213631, 0, 0.7411765, 1, 1,
0.09245943, -0.9159343, 2.792484, 0, 0.7372549, 1, 1,
0.09247721, -0.3904338, 2.65587, 0, 0.7294118, 1, 1,
0.09800041, -0.2269572, 2.135176, 0, 0.7254902, 1, 1,
0.1009823, 2.29897, 0.7382874, 0, 0.7176471, 1, 1,
0.1035374, 0.3186429, 0.586387, 0, 0.7137255, 1, 1,
0.1077548, -0.9819326, 4.077879, 0, 0.7058824, 1, 1,
0.1077777, -0.3762614, 1.088695, 0, 0.6980392, 1, 1,
0.1078358, -0.3483597, 4.030566, 0, 0.6941177, 1, 1,
0.1080438, -0.257455, 2.410649, 0, 0.6862745, 1, 1,
0.1109854, -0.4611172, 3.427591, 0, 0.682353, 1, 1,
0.1124545, 0.3387545, 2.223965, 0, 0.6745098, 1, 1,
0.1133911, 1.037714, 0.1019625, 0, 0.6705883, 1, 1,
0.1156686, -0.328006, 1.799137, 0, 0.6627451, 1, 1,
0.1206003, 1.076086, 2.070493, 0, 0.6588235, 1, 1,
0.1216822, 1.820906, 3.289633, 0, 0.6509804, 1, 1,
0.1263398, 0.2995541, -0.7784378, 0, 0.6470588, 1, 1,
0.1296644, 0.2624392, 0.4097154, 0, 0.6392157, 1, 1,
0.1305467, -0.1872475, 1.949104, 0, 0.6352941, 1, 1,
0.1309291, 0.7778111, 1.072934, 0, 0.627451, 1, 1,
0.1343734, 0.07430822, 1.600682, 0, 0.6235294, 1, 1,
0.1344828, 0.6835742, 0.6117557, 0, 0.6156863, 1, 1,
0.1363996, 0.7330872, 0.3142394, 0, 0.6117647, 1, 1,
0.1379358, 0.5722741, 1.034477, 0, 0.6039216, 1, 1,
0.1387021, -0.5579503, 1.551279, 0, 0.5960785, 1, 1,
0.1387929, 0.4752798, -0.1893505, 0, 0.5921569, 1, 1,
0.1390136, 0.5115839, 0.449838, 0, 0.5843138, 1, 1,
0.1393742, -0.02680787, -0.04021209, 0, 0.5803922, 1, 1,
0.1433165, -0.2143551, 2.375322, 0, 0.572549, 1, 1,
0.1500631, -0.4355255, 3.54989, 0, 0.5686275, 1, 1,
0.1518306, 1.163925, -1.554867, 0, 0.5607843, 1, 1,
0.1523645, 0.3457571, 0.3420468, 0, 0.5568628, 1, 1,
0.1533427, 0.9440354, -1.491305, 0, 0.5490196, 1, 1,
0.1567136, 0.7477587, 0.4673176, 0, 0.5450981, 1, 1,
0.1583744, -2.964779, 4.510355, 0, 0.5372549, 1, 1,
0.1643206, -0.5337752, 2.452217, 0, 0.5333334, 1, 1,
0.1689074, 1.223401, 0.08646897, 0, 0.5254902, 1, 1,
0.1711793, 0.4955749, -0.06043881, 0, 0.5215687, 1, 1,
0.1826773, 0.6182493, 2.63108, 0, 0.5137255, 1, 1,
0.1911356, 0.1846124, 1.831149, 0, 0.509804, 1, 1,
0.1939217, -0.6297924, 3.921572, 0, 0.5019608, 1, 1,
0.2008673, -0.8259498, 2.27581, 0, 0.4941176, 1, 1,
0.2056914, -1.297193, 1.889926, 0, 0.4901961, 1, 1,
0.2070164, -0.4192985, 1.8944, 0, 0.4823529, 1, 1,
0.2100431, 0.03244447, 2.298023, 0, 0.4784314, 1, 1,
0.2102533, -0.8788935, 3.423162, 0, 0.4705882, 1, 1,
0.2108686, 0.3742296, 1.006458, 0, 0.4666667, 1, 1,
0.2114618, 1.743194, -0.0296477, 0, 0.4588235, 1, 1,
0.213262, -1.132115, 3.173593, 0, 0.454902, 1, 1,
0.2138064, -0.2908005, 0.687779, 0, 0.4470588, 1, 1,
0.2139117, -1.262155, 3.460933, 0, 0.4431373, 1, 1,
0.2196703, -0.3529615, 2.596125, 0, 0.4352941, 1, 1,
0.2197097, 1.292503, -0.5048053, 0, 0.4313726, 1, 1,
0.2227111, 0.2994921, 1.694248, 0, 0.4235294, 1, 1,
0.2255045, -0.5427474, 2.463733, 0, 0.4196078, 1, 1,
0.229302, 0.1183256, 0.1665639, 0, 0.4117647, 1, 1,
0.2296396, -0.2853281, 3.050495, 0, 0.4078431, 1, 1,
0.2299947, 0.5693749, -0.1485079, 0, 0.4, 1, 1,
0.2347832, -0.2878638, 1.850901, 0, 0.3921569, 1, 1,
0.2350687, 1.130796, -1.110759, 0, 0.3882353, 1, 1,
0.2433394, -0.8239284, 2.367013, 0, 0.3803922, 1, 1,
0.2433889, -0.7047995, 2.954595, 0, 0.3764706, 1, 1,
0.2464285, -0.9402828, 3.598243, 0, 0.3686275, 1, 1,
0.2464604, -0.7160473, 4.274105, 0, 0.3647059, 1, 1,
0.2475491, -0.5088895, 2.706913, 0, 0.3568628, 1, 1,
0.249012, 0.030803, 0.5128375, 0, 0.3529412, 1, 1,
0.2499043, -1.247736, 0.1730028, 0, 0.345098, 1, 1,
0.2505131, 1.288232, 2.529167, 0, 0.3411765, 1, 1,
0.2527616, 1.387781, 0.465996, 0, 0.3333333, 1, 1,
0.2541523, 1.491392, 0.7231227, 0, 0.3294118, 1, 1,
0.2553425, -0.4137762, 3.621038, 0, 0.3215686, 1, 1,
0.2561031, -0.2342473, 2.242507, 0, 0.3176471, 1, 1,
0.2570419, 1.539456, -0.3281466, 0, 0.3098039, 1, 1,
0.2585089, 3.065489, -1.128405, 0, 0.3058824, 1, 1,
0.2613585, -0.6515065, 3.889639, 0, 0.2980392, 1, 1,
0.2619036, -0.4278436, 0.737619, 0, 0.2901961, 1, 1,
0.2719774, -1.076065, 1.558397, 0, 0.2862745, 1, 1,
0.2735225, 0.4070208, 0.6325257, 0, 0.2784314, 1, 1,
0.2742262, 0.3434158, 0.9208145, 0, 0.2745098, 1, 1,
0.2753597, 0.7516056, -0.9887387, 0, 0.2666667, 1, 1,
0.2758367, 1.094015, -0.2151605, 0, 0.2627451, 1, 1,
0.2826868, -0.544764, 1.93864, 0, 0.254902, 1, 1,
0.2829112, -1.468965, 2.342072, 0, 0.2509804, 1, 1,
0.2868336, -0.6649153, 1.741031, 0, 0.2431373, 1, 1,
0.2908485, -0.6000149, 2.720048, 0, 0.2392157, 1, 1,
0.292747, -0.9417023, 3.104159, 0, 0.2313726, 1, 1,
0.293415, 0.3043011, -0.7132779, 0, 0.227451, 1, 1,
0.2968836, 0.1671787, 0.07594279, 0, 0.2196078, 1, 1,
0.303648, 0.5206837, 0.446217, 0, 0.2156863, 1, 1,
0.314309, 0.1354153, -1.119224, 0, 0.2078431, 1, 1,
0.3172728, -0.3312896, 3.0553, 0, 0.2039216, 1, 1,
0.3199433, -2.238199, 2.840742, 0, 0.1960784, 1, 1,
0.3216878, -1.169229, 2.993645, 0, 0.1882353, 1, 1,
0.3222857, 1.66622, 0.4135089, 0, 0.1843137, 1, 1,
0.3225845, -1.528983, 2.94337, 0, 0.1764706, 1, 1,
0.3239702, 1.581758, 0.5655224, 0, 0.172549, 1, 1,
0.3244162, -0.07476179, 0.2053172, 0, 0.1647059, 1, 1,
0.3269539, 0.005797165, 3.873551, 0, 0.1607843, 1, 1,
0.3295075, 0.6136708, 0.3941267, 0, 0.1529412, 1, 1,
0.3295673, -1.103519, 2.749232, 0, 0.1490196, 1, 1,
0.3350653, -0.259261, 2.652473, 0, 0.1411765, 1, 1,
0.3361967, -1.468938, 4.793986, 0, 0.1372549, 1, 1,
0.3365569, -0.488716, 2.624134, 0, 0.1294118, 1, 1,
0.3397755, -2.191466, 2.399437, 0, 0.1254902, 1, 1,
0.3441475, 0.4654933, 1.488364, 0, 0.1176471, 1, 1,
0.3498617, 0.5826602, 0.8478338, 0, 0.1137255, 1, 1,
0.3540744, 3.736854, 0.8066314, 0, 0.1058824, 1, 1,
0.3579913, -0.1189031, 1.366384, 0, 0.09803922, 1, 1,
0.3603412, 1.129033, 0.8084322, 0, 0.09411765, 1, 1,
0.364079, -1.249403, 3.529106, 0, 0.08627451, 1, 1,
0.3648171, 0.2676143, 0.1082482, 0, 0.08235294, 1, 1,
0.3712555, -0.04050117, 2.426175, 0, 0.07450981, 1, 1,
0.3718089, -0.9701288, 2.94889, 0, 0.07058824, 1, 1,
0.3773104, 0.6217663, 0.5239321, 0, 0.0627451, 1, 1,
0.3809036, 1.345223, 0.1580198, 0, 0.05882353, 1, 1,
0.3849882, -0.2754052, 3.32846, 0, 0.05098039, 1, 1,
0.3864819, -2.565854, 3.288858, 0, 0.04705882, 1, 1,
0.3930344, 2.484901, 1.626055, 0, 0.03921569, 1, 1,
0.3959951, 0.5987786, 1.350438, 0, 0.03529412, 1, 1,
0.398225, 0.1303662, 1.476733, 0, 0.02745098, 1, 1,
0.4005854, 0.8479075, 0.9103567, 0, 0.02352941, 1, 1,
0.4039288, -0.2934449, 1.239823, 0, 0.01568628, 1, 1,
0.4122533, 0.7205677, 2.388881, 0, 0.01176471, 1, 1,
0.4142634, 0.216832, -0.8690404, 0, 0.003921569, 1, 1,
0.415112, -0.4084916, 1.399725, 0.003921569, 0, 1, 1,
0.4155984, -0.4040533, 0.150022, 0.007843138, 0, 1, 1,
0.4174667, 0.3125551, 2.343412, 0.01568628, 0, 1, 1,
0.4217919, -0.5668696, 2.169102, 0.01960784, 0, 1, 1,
0.4235707, 0.327884, 1.304951, 0.02745098, 0, 1, 1,
0.4242269, 0.9669278, 0.6524609, 0.03137255, 0, 1, 1,
0.4247721, 1.722076, 0.3322355, 0.03921569, 0, 1, 1,
0.4404375, 0.2598034, 1.615675, 0.04313726, 0, 1, 1,
0.4419258, 0.2146316, 0.6644969, 0.05098039, 0, 1, 1,
0.4482643, -0.5114148, 1.428331, 0.05490196, 0, 1, 1,
0.4526607, 1.758794, 0.502165, 0.0627451, 0, 1, 1,
0.4546111, 1.166205, 0.6026801, 0.06666667, 0, 1, 1,
0.4584555, 0.7389857, 0.4334471, 0.07450981, 0, 1, 1,
0.4612547, 1.041676, 0.7540313, 0.07843138, 0, 1, 1,
0.4628081, 0.1132751, 0.4146328, 0.08627451, 0, 1, 1,
0.4628627, -0.7889163, 1.424551, 0.09019608, 0, 1, 1,
0.4674625, -1.564032, 2.42756, 0.09803922, 0, 1, 1,
0.4697759, -0.9295318, 2.177643, 0.1058824, 0, 1, 1,
0.4713268, 0.04024617, 1.383543, 0.1098039, 0, 1, 1,
0.4718585, -0.9760509, 3.485549, 0.1176471, 0, 1, 1,
0.475466, -0.186833, 1.523038, 0.1215686, 0, 1, 1,
0.4783124, 0.7919432, 0.1151703, 0.1294118, 0, 1, 1,
0.4793724, -1.705206, 1.056647, 0.1333333, 0, 1, 1,
0.4812011, 0.486777, 1.633574, 0.1411765, 0, 1, 1,
0.4861962, -3.254745, 5.112096, 0.145098, 0, 1, 1,
0.4884746, 0.4990561, 1.684134, 0.1529412, 0, 1, 1,
0.488737, 0.9421098, -0.1022812, 0.1568628, 0, 1, 1,
0.4888831, -0.1629942, 1.484341, 0.1647059, 0, 1, 1,
0.4918558, -0.8953738, 4.042041, 0.1686275, 0, 1, 1,
0.4949151, -1.430647, 1.522488, 0.1764706, 0, 1, 1,
0.4975237, 1.484507, 0.2146027, 0.1803922, 0, 1, 1,
0.5003235, -0.05262336, 1.498593, 0.1882353, 0, 1, 1,
0.5033306, -0.09376316, 1.376706, 0.1921569, 0, 1, 1,
0.5033698, -1.485422, 3.353986, 0.2, 0, 1, 1,
0.5038904, 1.027094, 1.748134, 0.2078431, 0, 1, 1,
0.5063685, -0.4013163, 2.44996, 0.2117647, 0, 1, 1,
0.5091974, -1.78907, 2.961413, 0.2196078, 0, 1, 1,
0.5118356, 0.4887313, 1.379926, 0.2235294, 0, 1, 1,
0.5120999, 1.859147, -1.953221, 0.2313726, 0, 1, 1,
0.5147948, -1.586749, 2.460607, 0.2352941, 0, 1, 1,
0.5161141, 0.7606891, -0.6866378, 0.2431373, 0, 1, 1,
0.5175784, -1.785369, 1.80985, 0.2470588, 0, 1, 1,
0.5181772, -1.208124, 3.099915, 0.254902, 0, 1, 1,
0.5245484, -0.5735497, 3.331908, 0.2588235, 0, 1, 1,
0.5262922, -1.812523, 2.45641, 0.2666667, 0, 1, 1,
0.5276404, -0.0197634, 1.472728, 0.2705882, 0, 1, 1,
0.5292293, -0.6539229, 3.646716, 0.2784314, 0, 1, 1,
0.530816, -0.1443264, 2.519651, 0.282353, 0, 1, 1,
0.5326082, 0.9162855, -0.3237328, 0.2901961, 0, 1, 1,
0.5402606, -0.6775032, -0.2237067, 0.2941177, 0, 1, 1,
0.542302, 2.344857, 0.4033362, 0.3019608, 0, 1, 1,
0.5425034, 2.353994, 1.172705, 0.3098039, 0, 1, 1,
0.545433, 0.4011953, 0.9467315, 0.3137255, 0, 1, 1,
0.5454867, 0.9054091, 2.206632, 0.3215686, 0, 1, 1,
0.5497666, -1.296035, 1.228974, 0.3254902, 0, 1, 1,
0.5507869, 0.314332, 0.3825856, 0.3333333, 0, 1, 1,
0.5566723, -0.1157168, 2.436613, 0.3372549, 0, 1, 1,
0.5572443, -1.311165, 4.986979, 0.345098, 0, 1, 1,
0.5657867, 0.8264323, 0.5645256, 0.3490196, 0, 1, 1,
0.5696042, -0.2336974, 2.346944, 0.3568628, 0, 1, 1,
0.5725184, 0.334213, 0.7153699, 0.3607843, 0, 1, 1,
0.5763521, -0.5354255, 3.300538, 0.3686275, 0, 1, 1,
0.5797556, 0.162502, 1.554866, 0.372549, 0, 1, 1,
0.5844565, -0.4349037, 0.08167055, 0.3803922, 0, 1, 1,
0.5857618, 1.229087, -2.064694, 0.3843137, 0, 1, 1,
0.5916471, 0.2928681, 2.16779, 0.3921569, 0, 1, 1,
0.5919906, 1.211184, 1.129838, 0.3960784, 0, 1, 1,
0.5973989, 0.3943715, 0.4549872, 0.4039216, 0, 1, 1,
0.5987006, 1.108169, -0.3062029, 0.4117647, 0, 1, 1,
0.6024061, 0.3003007, 2.385682, 0.4156863, 0, 1, 1,
0.6072807, 0.1294341, 1.820894, 0.4235294, 0, 1, 1,
0.6215416, 1.103949, 1.82814, 0.427451, 0, 1, 1,
0.6269248, -0.5363482, 2.370382, 0.4352941, 0, 1, 1,
0.6289067, 0.349683, 1.187925, 0.4392157, 0, 1, 1,
0.6333116, 0.415422, 1.306701, 0.4470588, 0, 1, 1,
0.6373563, 0.5966952, 2.242751, 0.4509804, 0, 1, 1,
0.6383982, -1.047114, 3.602517, 0.4588235, 0, 1, 1,
0.6403192, -1.126452, 2.661584, 0.4627451, 0, 1, 1,
0.6465445, 0.206809, 0.4699388, 0.4705882, 0, 1, 1,
0.6470215, -2.389912, 2.748428, 0.4745098, 0, 1, 1,
0.6483442, -1.215911, 2.52057, 0.4823529, 0, 1, 1,
0.6534746, -1.284525, 0.597535, 0.4862745, 0, 1, 1,
0.6557914, 1.18857, 0.3586386, 0.4941176, 0, 1, 1,
0.6572769, 0.1707366, 1.612543, 0.5019608, 0, 1, 1,
0.6613746, -0.6005659, 2.942979, 0.5058824, 0, 1, 1,
0.6728926, 0.01404771, 2.047104, 0.5137255, 0, 1, 1,
0.6776471, -0.3871194, 0.8446847, 0.5176471, 0, 1, 1,
0.6810459, 2.960187, -0.7462815, 0.5254902, 0, 1, 1,
0.6838283, -0.4408174, 0.6161047, 0.5294118, 0, 1, 1,
0.6938662, 0.3701072, -0.3055121, 0.5372549, 0, 1, 1,
0.7000861, -0.06598755, 1.567222, 0.5411765, 0, 1, 1,
0.701191, -0.01215245, 0.05395337, 0.5490196, 0, 1, 1,
0.7030914, -0.5933676, 1.192346, 0.5529412, 0, 1, 1,
0.7058732, 2.111549, 0.574339, 0.5607843, 0, 1, 1,
0.7085758, 0.6721383, 0.5426158, 0.5647059, 0, 1, 1,
0.718662, 1.204102, 1.739521, 0.572549, 0, 1, 1,
0.7194056, -0.1262537, 0.4803336, 0.5764706, 0, 1, 1,
0.7260222, -1.337481, 2.034743, 0.5843138, 0, 1, 1,
0.7273885, -0.3456864, 0.3533334, 0.5882353, 0, 1, 1,
0.7417234, 0.08372375, 2.22664, 0.5960785, 0, 1, 1,
0.7425343, -0.7814762, 3.156906, 0.6039216, 0, 1, 1,
0.7443228, -1.084179, 2.70504, 0.6078432, 0, 1, 1,
0.7500739, -1.927874, 1.578965, 0.6156863, 0, 1, 1,
0.753698, 0.1538662, 2.263695, 0.6196079, 0, 1, 1,
0.7540833, 1.849548, -0.03740117, 0.627451, 0, 1, 1,
0.7679577, -2.022604, 2.254154, 0.6313726, 0, 1, 1,
0.772168, 0.4999709, 1.40633, 0.6392157, 0, 1, 1,
0.7783992, 0.7709153, 0.4178686, 0.6431373, 0, 1, 1,
0.7803529, 0.5166337, 0.06373638, 0.6509804, 0, 1, 1,
0.7806352, 1.442226, -0.2349509, 0.654902, 0, 1, 1,
0.7809236, -0.6841421, 3.586983, 0.6627451, 0, 1, 1,
0.7849102, -0.4765901, 1.903419, 0.6666667, 0, 1, 1,
0.7918674, -0.4314892, 2.269033, 0.6745098, 0, 1, 1,
0.7977353, 0.07305028, 0.2399232, 0.6784314, 0, 1, 1,
0.8007544, 0.4455905, 1.787549, 0.6862745, 0, 1, 1,
0.8012741, 1.315674, -0.6771006, 0.6901961, 0, 1, 1,
0.8022453, 0.5565395, -0.009923328, 0.6980392, 0, 1, 1,
0.80352, 0.940975, 0.9887314, 0.7058824, 0, 1, 1,
0.8035441, -0.3785541, 1.442706, 0.7098039, 0, 1, 1,
0.8065188, -0.01797875, 0.9496483, 0.7176471, 0, 1, 1,
0.8094938, 0.2048232, 0.8229868, 0.7215686, 0, 1, 1,
0.8125544, 0.2082786, 3.375074, 0.7294118, 0, 1, 1,
0.8140056, -0.1601873, 2.273149, 0.7333333, 0, 1, 1,
0.8159532, 1.819938, 0.2604325, 0.7411765, 0, 1, 1,
0.8174879, -0.3893767, 2.981289, 0.7450981, 0, 1, 1,
0.8279182, -0.3549173, 2.863688, 0.7529412, 0, 1, 1,
0.8335285, 0.3401221, 1.040497, 0.7568628, 0, 1, 1,
0.8399246, 0.5702787, 1.640049, 0.7647059, 0, 1, 1,
0.8404819, -1.815704, 2.456944, 0.7686275, 0, 1, 1,
0.8411844, -0.2510176, 1.497138, 0.7764706, 0, 1, 1,
0.8446875, 0.7127168, -0.558692, 0.7803922, 0, 1, 1,
0.8511571, -0.950554, 1.885691, 0.7882353, 0, 1, 1,
0.8553056, 0.3947437, 0.9698845, 0.7921569, 0, 1, 1,
0.8564073, -0.9212456, 1.889035, 0.8, 0, 1, 1,
0.8609622, -0.4437405, -1.510798, 0.8078431, 0, 1, 1,
0.8615835, -0.07793756, 3.777479, 0.8117647, 0, 1, 1,
0.8641403, -0.636179, 0.7407479, 0.8196079, 0, 1, 1,
0.8656784, 0.7209764, -0.05263352, 0.8235294, 0, 1, 1,
0.8664237, 0.5208364, -0.4268429, 0.8313726, 0, 1, 1,
0.86667, -0.6433254, 3.13782, 0.8352941, 0, 1, 1,
0.8741526, -0.2448914, 3.492225, 0.8431373, 0, 1, 1,
0.8754397, -1.373004, 3.805792, 0.8470588, 0, 1, 1,
0.8761486, 0.9551938, -0.1249833, 0.854902, 0, 1, 1,
0.8775176, -1.150533, 2.556361, 0.8588235, 0, 1, 1,
0.8781828, -0.4828194, 3.639688, 0.8666667, 0, 1, 1,
0.8790058, -1.264967, 2.925188, 0.8705882, 0, 1, 1,
0.8807617, 0.3217548, 0.3182892, 0.8784314, 0, 1, 1,
0.892042, 0.09266166, 0.7516714, 0.8823529, 0, 1, 1,
0.893187, -0.6435048, 4.449907, 0.8901961, 0, 1, 1,
0.8972943, 0.56364, -0.2419214, 0.8941177, 0, 1, 1,
0.9029548, 0.1615404, -0.3668221, 0.9019608, 0, 1, 1,
0.9067392, 0.5076342, 1.2192, 0.9098039, 0, 1, 1,
0.9100178, -0.7534325, -0.3896827, 0.9137255, 0, 1, 1,
0.9135822, 0.5142385, 1.134972, 0.9215686, 0, 1, 1,
0.9243745, 0.9049805, 1.099551, 0.9254902, 0, 1, 1,
0.9267343, 0.1035843, 0.2272264, 0.9333333, 0, 1, 1,
0.9285086, 0.7535065, 1.652439, 0.9372549, 0, 1, 1,
0.9366846, 1.326178, 0.5865938, 0.945098, 0, 1, 1,
0.9367815, 0.6620775, 2.102954, 0.9490196, 0, 1, 1,
0.9390508, -0.9890588, 2.724064, 0.9568627, 0, 1, 1,
0.9509211, -1.35693, 1.60589, 0.9607843, 0, 1, 1,
0.9525639, 0.01465538, 2.254117, 0.9686275, 0, 1, 1,
0.9549087, -0.5118622, 0.9595463, 0.972549, 0, 1, 1,
0.9634721, -0.9658264, 3.175827, 0.9803922, 0, 1, 1,
0.9672629, 0.06825321, 1.981021, 0.9843137, 0, 1, 1,
0.9683609, -0.214663, 1.526972, 0.9921569, 0, 1, 1,
0.9731604, 0.5254287, 2.061582, 0.9960784, 0, 1, 1,
0.9773316, -1.307112, 2.853053, 1, 0, 0.9960784, 1,
0.9779819, 1.036804, 0.7021884, 1, 0, 0.9882353, 1,
0.979634, 0.02765383, 2.465129, 1, 0, 0.9843137, 1,
0.9904622, -0.6108508, 1.665216, 1, 0, 0.9764706, 1,
0.9922703, 0.06960598, 1.048565, 1, 0, 0.972549, 1,
0.9961991, 0.3755215, 2.681179, 1, 0, 0.9647059, 1,
0.9993007, 0.214154, 1.61849, 1, 0, 0.9607843, 1,
1.000395, -1.024932, 2.052605, 1, 0, 0.9529412, 1,
1.008675, 0.1735503, 1.633161, 1, 0, 0.9490196, 1,
1.009058, -0.5081155, 0.001102374, 1, 0, 0.9411765, 1,
1.009836, -0.9907878, 1.301644, 1, 0, 0.9372549, 1,
1.017505, -0.3958972, 2.344238, 1, 0, 0.9294118, 1,
1.01862, 0.721782, 1.70845, 1, 0, 0.9254902, 1,
1.020519, -0.03553791, 2.863532, 1, 0, 0.9176471, 1,
1.02916, -2.379779, 4.227268, 1, 0, 0.9137255, 1,
1.029805, 0.2559836, 1.333104, 1, 0, 0.9058824, 1,
1.032941, -0.6732057, 2.667706, 1, 0, 0.9019608, 1,
1.035648, -0.6888043, 3.616024, 1, 0, 0.8941177, 1,
1.038185, -0.4873402, 2.124847, 1, 0, 0.8862745, 1,
1.040183, -1.70573, 2.454665, 1, 0, 0.8823529, 1,
1.043547, 0.03931126, 0.2135495, 1, 0, 0.8745098, 1,
1.049216, 0.5672005, 1.264574, 1, 0, 0.8705882, 1,
1.053913, 0.5412564, 0.7856937, 1, 0, 0.8627451, 1,
1.060582, 0.7392083, 1.895676, 1, 0, 0.8588235, 1,
1.064561, -1.050245, 1.015543, 1, 0, 0.8509804, 1,
1.064987, -0.3082838, 0.08054215, 1, 0, 0.8470588, 1,
1.072851, 0.03778596, 1.0391, 1, 0, 0.8392157, 1,
1.07508, -0.8996838, 2.258777, 1, 0, 0.8352941, 1,
1.08333, 0.7276163, 0.8227051, 1, 0, 0.827451, 1,
1.103241, 0.5918154, 1.642105, 1, 0, 0.8235294, 1,
1.103835, 1.282085, 0.5771151, 1, 0, 0.8156863, 1,
1.103963, 0.1303249, 1.536816, 1, 0, 0.8117647, 1,
1.106525, 1.784037, 1.520288, 1, 0, 0.8039216, 1,
1.10987, 1.757365, -0.2807969, 1, 0, 0.7960784, 1,
1.115461, -0.04231827, 0.7872148, 1, 0, 0.7921569, 1,
1.119523, -1.022264, 1.211952, 1, 0, 0.7843137, 1,
1.120157, -0.4648823, 4.03188, 1, 0, 0.7803922, 1,
1.129332, -0.08550216, 0.4968365, 1, 0, 0.772549, 1,
1.139872, 0.2128942, 2.417902, 1, 0, 0.7686275, 1,
1.141803, 0.390439, 1.767992, 1, 0, 0.7607843, 1,
1.14428, -1.244053, 3.219095, 1, 0, 0.7568628, 1,
1.146703, 0.1039108, 1.607298, 1, 0, 0.7490196, 1,
1.156023, 2.251893, 1.401772, 1, 0, 0.7450981, 1,
1.157348, -0.7184573, 2.240306, 1, 0, 0.7372549, 1,
1.162066, 0.1098855, 1.344496, 1, 0, 0.7333333, 1,
1.163816, 0.4012295, 0.7509689, 1, 0, 0.7254902, 1,
1.169137, 1.900105, -0.564156, 1, 0, 0.7215686, 1,
1.173157, -2.08227, 2.3687, 1, 0, 0.7137255, 1,
1.174373, -1.425042, 1.549816, 1, 0, 0.7098039, 1,
1.176028, 0.1429047, 0.4314611, 1, 0, 0.7019608, 1,
1.177004, 0.6225494, 1.680958, 1, 0, 0.6941177, 1,
1.179358, 0.4840807, 0.6849728, 1, 0, 0.6901961, 1,
1.179431, 1.2274, -0.1527637, 1, 0, 0.682353, 1,
1.194633, -0.995416, 1.610134, 1, 0, 0.6784314, 1,
1.200103, -0.1369744, 1.20654, 1, 0, 0.6705883, 1,
1.216707, 0.08272885, 0.9578384, 1, 0, 0.6666667, 1,
1.218838, -0.4328929, 0.964378, 1, 0, 0.6588235, 1,
1.218845, -0.7564688, 1.165992, 1, 0, 0.654902, 1,
1.220566, -1.20906, 1.552441, 1, 0, 0.6470588, 1,
1.227908, -1.050192, 2.777912, 1, 0, 0.6431373, 1,
1.235489, 0.7183908, 2.289714, 1, 0, 0.6352941, 1,
1.240904, 0.2043284, 2.50103, 1, 0, 0.6313726, 1,
1.243453, 0.3866407, 2.111479, 1, 0, 0.6235294, 1,
1.244808, -2.005507, 2.772397, 1, 0, 0.6196079, 1,
1.251698, -0.2281111, 2.845942, 1, 0, 0.6117647, 1,
1.252948, -1.641591, 2.283694, 1, 0, 0.6078432, 1,
1.261704, -1.333731, 3.337543, 1, 0, 0.6, 1,
1.264143, 0.861786, 0.876553, 1, 0, 0.5921569, 1,
1.267108, -0.8864107, 3.253441, 1, 0, 0.5882353, 1,
1.270866, -0.3469771, 2.267798, 1, 0, 0.5803922, 1,
1.282655, -2.277302, 3.642668, 1, 0, 0.5764706, 1,
1.296766, -0.07125068, 0.5938007, 1, 0, 0.5686275, 1,
1.300146, 0.7264382, 1.668393, 1, 0, 0.5647059, 1,
1.307846, 1.365514, 1.402297, 1, 0, 0.5568628, 1,
1.308098, 0.8026729, 1.557942, 1, 0, 0.5529412, 1,
1.325804, 0.2150361, 0.06125424, 1, 0, 0.5450981, 1,
1.334568, 0.4588772, 1.155118, 1, 0, 0.5411765, 1,
1.338485, 0.2110817, 1.577293, 1, 0, 0.5333334, 1,
1.339437, 0.2624086, 0.9620729, 1, 0, 0.5294118, 1,
1.347853, 0.8910959, 2.170971, 1, 0, 0.5215687, 1,
1.354706, -0.06260397, 2.691949, 1, 0, 0.5176471, 1,
1.357612, 0.4787482, 0.5031853, 1, 0, 0.509804, 1,
1.366963, -2.867973, 3.497749, 1, 0, 0.5058824, 1,
1.368559, 0.4361376, 1.330535, 1, 0, 0.4980392, 1,
1.382799, -0.4048496, -0.4704657, 1, 0, 0.4901961, 1,
1.388714, 0.7100143, 0.8918805, 1, 0, 0.4862745, 1,
1.403971, -0.5631106, 1.682851, 1, 0, 0.4784314, 1,
1.435833, 0.004959897, 2.012339, 1, 0, 0.4745098, 1,
1.436726, -0.07729309, 2.297565, 1, 0, 0.4666667, 1,
1.444048, -1.26967, 3.81822, 1, 0, 0.4627451, 1,
1.470112, 0.8260376, 1.390036, 1, 0, 0.454902, 1,
1.474158, -0.243617, 1.998456, 1, 0, 0.4509804, 1,
1.482062, -0.7941266, 2.177837, 1, 0, 0.4431373, 1,
1.48573, 0.6758949, 0.4408495, 1, 0, 0.4392157, 1,
1.495617, -0.6750085, 3.305014, 1, 0, 0.4313726, 1,
1.497157, -0.02480589, 2.731209, 1, 0, 0.427451, 1,
1.499244, -0.6441138, 1.705095, 1, 0, 0.4196078, 1,
1.500542, 0.3126896, 1.181564, 1, 0, 0.4156863, 1,
1.504361, 0.2874117, 2.639772, 1, 0, 0.4078431, 1,
1.5072, -2.358408, 3.779759, 1, 0, 0.4039216, 1,
1.512086, 0.4861068, 1.644756, 1, 0, 0.3960784, 1,
1.522531, 0.9681397, 1.29544, 1, 0, 0.3882353, 1,
1.535451, -1.506371, 1.440816, 1, 0, 0.3843137, 1,
1.56036, 0.3645667, 1.534828, 1, 0, 0.3764706, 1,
1.561471, 0.2959749, 2.289985, 1, 0, 0.372549, 1,
1.567481, 0.2336582, -0.4898898, 1, 0, 0.3647059, 1,
1.572909, 2.020276, -0.1976846, 1, 0, 0.3607843, 1,
1.582727, 0.3846051, 2.445489, 1, 0, 0.3529412, 1,
1.614763, 1.305759, 0.7603893, 1, 0, 0.3490196, 1,
1.614933, -1.152813, 1.112923, 1, 0, 0.3411765, 1,
1.61934, -2.249291, 1.457491, 1, 0, 0.3372549, 1,
1.630555, 0.3599023, 0.6954641, 1, 0, 0.3294118, 1,
1.636943, -0.4497469, 2.676372, 1, 0, 0.3254902, 1,
1.651582, 1.11681, -0.2390049, 1, 0, 0.3176471, 1,
1.651915, 0.7341819, 2.003448, 1, 0, 0.3137255, 1,
1.667989, 0.3611783, 1.367054, 1, 0, 0.3058824, 1,
1.675574, -0.2240546, 1.363216, 1, 0, 0.2980392, 1,
1.700744, -0.41028, 1.230651, 1, 0, 0.2941177, 1,
1.717684, -0.6660365, 1.110501, 1, 0, 0.2862745, 1,
1.740852, 0.9796382, 2.942675, 1, 0, 0.282353, 1,
1.75315, -1.791406, 1.033442, 1, 0, 0.2745098, 1,
1.765361, -1.479481, 1.867919, 1, 0, 0.2705882, 1,
1.776748, -0.787411, 2.179748, 1, 0, 0.2627451, 1,
1.779805, 0.8325857, 2.769107, 1, 0, 0.2588235, 1,
1.787586, 0.5685729, -0.05726343, 1, 0, 0.2509804, 1,
1.795265, -0.5498408, 2.137315, 1, 0, 0.2470588, 1,
1.800542, -1.510539, 1.2584, 1, 0, 0.2392157, 1,
1.804925, 0.06861498, -0.0136762, 1, 0, 0.2352941, 1,
1.811486, -0.1818649, 2.55428, 1, 0, 0.227451, 1,
1.821754, 1.133245, 1.796473, 1, 0, 0.2235294, 1,
1.824003, 0.6327439, 0.7806631, 1, 0, 0.2156863, 1,
1.826385, -0.2915823, 2.382523, 1, 0, 0.2117647, 1,
1.829733, 0.6191764, 0.567162, 1, 0, 0.2039216, 1,
1.84404, -0.2900655, 1.549992, 1, 0, 0.1960784, 1,
1.85425, -0.2158145, 1.678725, 1, 0, 0.1921569, 1,
1.867959, -0.5855088, 0.9904744, 1, 0, 0.1843137, 1,
1.898265, 1.430707, 0.9048332, 1, 0, 0.1803922, 1,
1.900234, 1.293835, -0.4361418, 1, 0, 0.172549, 1,
1.906897, 0.7547875, 0.1751661, 1, 0, 0.1686275, 1,
1.919014, 1.021136, 2.2149, 1, 0, 0.1607843, 1,
1.936404, 0.2027721, 1.022027, 1, 0, 0.1568628, 1,
1.957001, -0.1662669, 1.262033, 1, 0, 0.1490196, 1,
1.975459, -0.1414795, 2.257505, 1, 0, 0.145098, 1,
1.977727, -0.8995405, 1.986173, 1, 0, 0.1372549, 1,
1.99971, -1.640458, 1.725565, 1, 0, 0.1333333, 1,
2.013199, -2.527466, 1.591523, 1, 0, 0.1254902, 1,
2.015614, 0.3417696, 1.80478, 1, 0, 0.1215686, 1,
2.020723, 0.2238021, 0.8093185, 1, 0, 0.1137255, 1,
2.094187, 0.2805662, 0.7574053, 1, 0, 0.1098039, 1,
2.118122, -0.8809246, -0.06845476, 1, 0, 0.1019608, 1,
2.147933, 0.5333245, 0.09460214, 1, 0, 0.09411765, 1,
2.152043, -1.889678, 3.39235, 1, 0, 0.09019608, 1,
2.170634, -1.241398, 1.398567, 1, 0, 0.08235294, 1,
2.173947, -0.9110746, 1.805023, 1, 0, 0.07843138, 1,
2.306251, -0.3661142, 3.147699, 1, 0, 0.07058824, 1,
2.309238, -0.3177972, 2.801506, 1, 0, 0.06666667, 1,
2.361977, -1.395761, 2.207959, 1, 0, 0.05882353, 1,
2.36251, -0.03297669, 2.701047, 1, 0, 0.05490196, 1,
2.420932, -0.392664, 1.496468, 1, 0, 0.04705882, 1,
2.431937, -0.7529523, 2.441755, 1, 0, 0.04313726, 1,
2.511532, 0.1302344, 1.743648, 1, 0, 0.03529412, 1,
2.553648, 0.6478456, 1.878872, 1, 0, 0.03137255, 1,
2.558969, -0.4341204, 2.989998, 1, 0, 0.02352941, 1,
2.659482, -0.6867204, 2.686418, 1, 0, 0.01960784, 1,
2.707553, -0.6586379, 1.519709, 1, 0, 0.01176471, 1,
2.831562, -0.4500395, 1.820905, 1, 0, 0.007843138, 1
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
-0.01024592, -4.43982, -6.84938, 0, -0.5, 0.5, 0.5,
-0.01024592, -4.43982, -6.84938, 1, -0.5, 0.5, 0.5,
-0.01024592, -4.43982, -6.84938, 1, 1.5, 0.5, 0.5,
-0.01024592, -4.43982, -6.84938, 0, 1.5, 0.5, 0.5
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
-3.815426, 0.2410545, -6.84938, 0, -0.5, 0.5, 0.5,
-3.815426, 0.2410545, -6.84938, 1, -0.5, 0.5, 0.5,
-3.815426, 0.2410545, -6.84938, 1, 1.5, 0.5, 0.5,
-3.815426, 0.2410545, -6.84938, 0, 1.5, 0.5, 0.5
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
-3.815426, -4.43982, 0.05370355, 0, -0.5, 0.5, 0.5,
-3.815426, -4.43982, 0.05370355, 1, -0.5, 0.5, 0.5,
-3.815426, -4.43982, 0.05370355, 1, 1.5, 0.5, 0.5,
-3.815426, -4.43982, 0.05370355, 0, 1.5, 0.5, 0.5
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
-2, -3.359618, -5.256361,
2, -3.359618, -5.256361,
-2, -3.359618, -5.256361,
-2, -3.539652, -5.521864,
-1, -3.359618, -5.256361,
-1, -3.539652, -5.521864,
0, -3.359618, -5.256361,
0, -3.539652, -5.521864,
1, -3.359618, -5.256361,
1, -3.539652, -5.521864,
2, -3.359618, -5.256361,
2, -3.539652, -5.521864
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
-2, -3.899719, -6.052871, 0, -0.5, 0.5, 0.5,
-2, -3.899719, -6.052871, 1, -0.5, 0.5, 0.5,
-2, -3.899719, -6.052871, 1, 1.5, 0.5, 0.5,
-2, -3.899719, -6.052871, 0, 1.5, 0.5, 0.5,
-1, -3.899719, -6.052871, 0, -0.5, 0.5, 0.5,
-1, -3.899719, -6.052871, 1, -0.5, 0.5, 0.5,
-1, -3.899719, -6.052871, 1, 1.5, 0.5, 0.5,
-1, -3.899719, -6.052871, 0, 1.5, 0.5, 0.5,
0, -3.899719, -6.052871, 0, -0.5, 0.5, 0.5,
0, -3.899719, -6.052871, 1, -0.5, 0.5, 0.5,
0, -3.899719, -6.052871, 1, 1.5, 0.5, 0.5,
0, -3.899719, -6.052871, 0, 1.5, 0.5, 0.5,
1, -3.899719, -6.052871, 0, -0.5, 0.5, 0.5,
1, -3.899719, -6.052871, 1, -0.5, 0.5, 0.5,
1, -3.899719, -6.052871, 1, 1.5, 0.5, 0.5,
1, -3.899719, -6.052871, 0, 1.5, 0.5, 0.5,
2, -3.899719, -6.052871, 0, -0.5, 0.5, 0.5,
2, -3.899719, -6.052871, 1, -0.5, 0.5, 0.5,
2, -3.899719, -6.052871, 1, 1.5, 0.5, 0.5,
2, -3.899719, -6.052871, 0, 1.5, 0.5, 0.5
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
-2.937308, -3, -5.256361,
-2.937308, 3, -5.256361,
-2.937308, -3, -5.256361,
-3.083661, -3, -5.521864,
-2.937308, -2, -5.256361,
-3.083661, -2, -5.521864,
-2.937308, -1, -5.256361,
-3.083661, -1, -5.521864,
-2.937308, 0, -5.256361,
-3.083661, 0, -5.521864,
-2.937308, 1, -5.256361,
-3.083661, 1, -5.521864,
-2.937308, 2, -5.256361,
-3.083661, 2, -5.521864,
-2.937308, 3, -5.256361,
-3.083661, 3, -5.521864
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
-3.376367, -3, -6.052871, 0, -0.5, 0.5, 0.5,
-3.376367, -3, -6.052871, 1, -0.5, 0.5, 0.5,
-3.376367, -3, -6.052871, 1, 1.5, 0.5, 0.5,
-3.376367, -3, -6.052871, 0, 1.5, 0.5, 0.5,
-3.376367, -2, -6.052871, 0, -0.5, 0.5, 0.5,
-3.376367, -2, -6.052871, 1, -0.5, 0.5, 0.5,
-3.376367, -2, -6.052871, 1, 1.5, 0.5, 0.5,
-3.376367, -2, -6.052871, 0, 1.5, 0.5, 0.5,
-3.376367, -1, -6.052871, 0, -0.5, 0.5, 0.5,
-3.376367, -1, -6.052871, 1, -0.5, 0.5, 0.5,
-3.376367, -1, -6.052871, 1, 1.5, 0.5, 0.5,
-3.376367, -1, -6.052871, 0, 1.5, 0.5, 0.5,
-3.376367, 0, -6.052871, 0, -0.5, 0.5, 0.5,
-3.376367, 0, -6.052871, 1, -0.5, 0.5, 0.5,
-3.376367, 0, -6.052871, 1, 1.5, 0.5, 0.5,
-3.376367, 0, -6.052871, 0, 1.5, 0.5, 0.5,
-3.376367, 1, -6.052871, 0, -0.5, 0.5, 0.5,
-3.376367, 1, -6.052871, 1, -0.5, 0.5, 0.5,
-3.376367, 1, -6.052871, 1, 1.5, 0.5, 0.5,
-3.376367, 1, -6.052871, 0, 1.5, 0.5, 0.5,
-3.376367, 2, -6.052871, 0, -0.5, 0.5, 0.5,
-3.376367, 2, -6.052871, 1, -0.5, 0.5, 0.5,
-3.376367, 2, -6.052871, 1, 1.5, 0.5, 0.5,
-3.376367, 2, -6.052871, 0, 1.5, 0.5, 0.5,
-3.376367, 3, -6.052871, 0, -0.5, 0.5, 0.5,
-3.376367, 3, -6.052871, 1, -0.5, 0.5, 0.5,
-3.376367, 3, -6.052871, 1, 1.5, 0.5, 0.5,
-3.376367, 3, -6.052871, 0, 1.5, 0.5, 0.5
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
-2.937308, -3.359618, -4,
-2.937308, -3.359618, 4,
-2.937308, -3.359618, -4,
-3.083661, -3.539652, -4,
-2.937308, -3.359618, -2,
-3.083661, -3.539652, -2,
-2.937308, -3.359618, 0,
-3.083661, -3.539652, 0,
-2.937308, -3.359618, 2,
-3.083661, -3.539652, 2,
-2.937308, -3.359618, 4,
-3.083661, -3.539652, 4
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
-3.376367, -3.899719, -4, 0, -0.5, 0.5, 0.5,
-3.376367, -3.899719, -4, 1, -0.5, 0.5, 0.5,
-3.376367, -3.899719, -4, 1, 1.5, 0.5, 0.5,
-3.376367, -3.899719, -4, 0, 1.5, 0.5, 0.5,
-3.376367, -3.899719, -2, 0, -0.5, 0.5, 0.5,
-3.376367, -3.899719, -2, 1, -0.5, 0.5, 0.5,
-3.376367, -3.899719, -2, 1, 1.5, 0.5, 0.5,
-3.376367, -3.899719, -2, 0, 1.5, 0.5, 0.5,
-3.376367, -3.899719, 0, 0, -0.5, 0.5, 0.5,
-3.376367, -3.899719, 0, 1, -0.5, 0.5, 0.5,
-3.376367, -3.899719, 0, 1, 1.5, 0.5, 0.5,
-3.376367, -3.899719, 0, 0, 1.5, 0.5, 0.5,
-3.376367, -3.899719, 2, 0, -0.5, 0.5, 0.5,
-3.376367, -3.899719, 2, 1, -0.5, 0.5, 0.5,
-3.376367, -3.899719, 2, 1, 1.5, 0.5, 0.5,
-3.376367, -3.899719, 2, 0, 1.5, 0.5, 0.5,
-3.376367, -3.899719, 4, 0, -0.5, 0.5, 0.5,
-3.376367, -3.899719, 4, 1, -0.5, 0.5, 0.5,
-3.376367, -3.899719, 4, 1, 1.5, 0.5, 0.5,
-3.376367, -3.899719, 4, 0, 1.5, 0.5, 0.5
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
-2.937308, -3.359618, -5.256361,
-2.937308, 3.841727, -5.256361,
-2.937308, -3.359618, 5.363768,
-2.937308, 3.841727, 5.363768,
-2.937308, -3.359618, -5.256361,
-2.937308, -3.359618, 5.363768,
-2.937308, 3.841727, -5.256361,
-2.937308, 3.841727, 5.363768,
-2.937308, -3.359618, -5.256361,
2.916816, -3.359618, -5.256361,
-2.937308, -3.359618, 5.363768,
2.916816, -3.359618, 5.363768,
-2.937308, 3.841727, -5.256361,
2.916816, 3.841727, -5.256361,
-2.937308, 3.841727, 5.363768,
2.916816, 3.841727, 5.363768,
2.916816, -3.359618, -5.256361,
2.916816, 3.841727, -5.256361,
2.916816, -3.359618, 5.363768,
2.916816, 3.841727, 5.363768,
2.916816, -3.359618, -5.256361,
2.916816, -3.359618, 5.363768,
2.916816, 3.841727, -5.256361,
2.916816, 3.841727, 5.363768
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
var radius = 7.531157;
var distance = 33.50697;
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
mvMatrix.translate( 0.01024592, -0.2410545, -0.05370355 );
mvMatrix.scale( 1.390957, 1.130738, 0.766736 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.50697);
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
Symclosene<-read.table("Symclosene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Symclosene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Symclosene' not found
```

```r
y<-Symclosene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Symclosene' not found
```

```r
z<-Symclosene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Symclosene' not found
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
-2.852054, 0.3371359, -2.15471, 0, 0, 1, 1, 1,
-2.746574, 0.03898815, -3.597437, 1, 0, 0, 1, 1,
-2.672657, 0.582772, -1.151404, 1, 0, 0, 1, 1,
-2.558569, 0.7938092, -3.524811, 1, 0, 0, 1, 1,
-2.505395, 0.7915485, -1.785453, 1, 0, 0, 1, 1,
-2.49868, 0.317034, 0.05626243, 1, 0, 0, 1, 1,
-2.394095, 0.2356977, -2.558813, 0, 0, 0, 1, 1,
-2.37759, 0.1565849, -2.467806, 0, 0, 0, 1, 1,
-2.33457, -1.126464, 0.4105162, 0, 0, 0, 1, 1,
-2.297803, -1.958098, -2.321434, 0, 0, 0, 1, 1,
-2.283455, -1.188811, 0.3205272, 0, 0, 0, 1, 1,
-2.262466, -0.7195582, -0.3386199, 0, 0, 0, 1, 1,
-2.212436, -0.5948177, -0.8362976, 0, 0, 0, 1, 1,
-2.112031, -1.296589, 0.2589436, 1, 1, 1, 1, 1,
-2.097346, 0.4215453, 0.49238, 1, 1, 1, 1, 1,
-2.073872, 2.419365, -1.703007, 1, 1, 1, 1, 1,
-2.072742, -0.8777753, -1.520749, 1, 1, 1, 1, 1,
-2.02519, 0.07080429, -1.084659, 1, 1, 1, 1, 1,
-2.022653, 1.083452, -0.4575331, 1, 1, 1, 1, 1,
-2.010316, 1.026536, 0.7850305, 1, 1, 1, 1, 1,
-1.973673, 0.605308, 0.01391191, 1, 1, 1, 1, 1,
-1.962336, -0.4317641, -3.06094, 1, 1, 1, 1, 1,
-1.96046, 0.8911464, -0.9876851, 1, 1, 1, 1, 1,
-1.949072, -0.8420568, -1.376988, 1, 1, 1, 1, 1,
-1.935377, -0.5386922, -1.914757, 1, 1, 1, 1, 1,
-1.93209, 0.1886148, -1.130542, 1, 1, 1, 1, 1,
-1.926423, 0.4912034, -0.4170276, 1, 1, 1, 1, 1,
-1.918036, 0.6661722, 0.3727841, 1, 1, 1, 1, 1,
-1.907295, 1.20679, -3.229442, 0, 0, 1, 1, 1,
-1.898211, -0.4680559, -2.486874, 1, 0, 0, 1, 1,
-1.841611, 0.924626, -1.171812, 1, 0, 0, 1, 1,
-1.828242, -0.08182234, -2.033879, 1, 0, 0, 1, 1,
-1.814226, -0.5558624, -1.964261, 1, 0, 0, 1, 1,
-1.805739, -0.6896149, -3.150309, 1, 0, 0, 1, 1,
-1.746123, -0.464171, -2.24157, 0, 0, 0, 1, 1,
-1.67548, 1.25979, 0.3241248, 0, 0, 0, 1, 1,
-1.673836, 1.068877, -1.093526, 0, 0, 0, 1, 1,
-1.654517, -0.8823901, -2.848799, 0, 0, 0, 1, 1,
-1.618842, -0.8613363, -3.105392, 0, 0, 0, 1, 1,
-1.613439, -1.207884, -2.570454, 0, 0, 0, 1, 1,
-1.612852, 0.09155215, -2.948648, 0, 0, 0, 1, 1,
-1.589205, 1.034465, -2.186192, 1, 1, 1, 1, 1,
-1.578747, 0.4465071, -0.471429, 1, 1, 1, 1, 1,
-1.576862, -0.5959933, -2.401958, 1, 1, 1, 1, 1,
-1.570644, 1.440991, 0.008886758, 1, 1, 1, 1, 1,
-1.558287, 0.8283263, -2.75682, 1, 1, 1, 1, 1,
-1.55427, -1.515111, -2.760404, 1, 1, 1, 1, 1,
-1.551001, -0.978227, -0.7523934, 1, 1, 1, 1, 1,
-1.546781, -0.6375174, -1.718178, 1, 1, 1, 1, 1,
-1.545096, -1.694691, -0.7414395, 1, 1, 1, 1, 1,
-1.53673, 0.2667665, -2.500907, 1, 1, 1, 1, 1,
-1.53238, -0.620798, -0.9945229, 1, 1, 1, 1, 1,
-1.51367, -0.2976614, -2.213749, 1, 1, 1, 1, 1,
-1.50533, 1.897045, -0.1492525, 1, 1, 1, 1, 1,
-1.492402, -0.4851376, -2.437144, 1, 1, 1, 1, 1,
-1.472117, -0.08669491, -3.311274, 1, 1, 1, 1, 1,
-1.459534, 1.578943, -1.493476, 0, 0, 1, 1, 1,
-1.455998, -1.034917, -2.100008, 1, 0, 0, 1, 1,
-1.455901, -0.9777281, -1.479073, 1, 0, 0, 1, 1,
-1.454843, -1.869631, -1.905147, 1, 0, 0, 1, 1,
-1.453113, 0.4671057, -0.09273101, 1, 0, 0, 1, 1,
-1.449714, 1.254097, -1.941414, 1, 0, 0, 1, 1,
-1.432179, 0.4105032, -1.26838, 0, 0, 0, 1, 1,
-1.426782, -1.784466, -2.037463, 0, 0, 0, 1, 1,
-1.426295, 0.4233575, -0.6856847, 0, 0, 0, 1, 1,
-1.424347, 1.013947, -1.47336, 0, 0, 0, 1, 1,
-1.392412, -1.504964, -2.238961, 0, 0, 0, 1, 1,
-1.383895, 1.318838, 0.2784384, 0, 0, 0, 1, 1,
-1.378647, -0.2537885, -1.910891, 0, 0, 0, 1, 1,
-1.372101, 1.783278, 0.5426733, 1, 1, 1, 1, 1,
-1.366196, -0.3321686, -2.675026, 1, 1, 1, 1, 1,
-1.363517, 0.4614035, -3.708616, 1, 1, 1, 1, 1,
-1.344931, -0.04058116, -0.9198636, 1, 1, 1, 1, 1,
-1.341847, -0.4854984, -1.050095, 1, 1, 1, 1, 1,
-1.334751, 0.08017492, -1.056117, 1, 1, 1, 1, 1,
-1.328788, 2.495661, -2.381474, 1, 1, 1, 1, 1,
-1.318572, -2.997482, -2.995967, 1, 1, 1, 1, 1,
-1.308483, 0.1621229, -3.645408, 1, 1, 1, 1, 1,
-1.302559, 0.6209459, -2.726748, 1, 1, 1, 1, 1,
-1.287454, 1.226898, -0.9708248, 1, 1, 1, 1, 1,
-1.274516, -1.773844, -2.395188, 1, 1, 1, 1, 1,
-1.270179, 1.546302, 0.06303019, 1, 1, 1, 1, 1,
-1.26039, 1.570771, -1.592263, 1, 1, 1, 1, 1,
-1.258862, 0.1639055, -1.990731, 1, 1, 1, 1, 1,
-1.255976, -0.3059448, -0.2274424, 0, 0, 1, 1, 1,
-1.252282, -0.214697, -2.086386, 1, 0, 0, 1, 1,
-1.250446, -0.2403908, -0.08699544, 1, 0, 0, 1, 1,
-1.246706, -0.04815343, -1.752849, 1, 0, 0, 1, 1,
-1.24056, 2.050383, -1.175706, 1, 0, 0, 1, 1,
-1.233936, -0.5507442, -1.757736, 1, 0, 0, 1, 1,
-1.210674, -0.9322427, -2.811159, 0, 0, 0, 1, 1,
-1.208799, -0.013936, -2.153419, 0, 0, 0, 1, 1,
-1.207076, -0.08987892, -0.9325249, 0, 0, 0, 1, 1,
-1.207025, -0.09853864, -1.105432, 0, 0, 0, 1, 1,
-1.198998, 0.3584945, -4.312837, 0, 0, 0, 1, 1,
-1.191291, 1.604447, 0.8612037, 0, 0, 0, 1, 1,
-1.189016, -0.9031014, -2.969191, 0, 0, 0, 1, 1,
-1.188469, 2.726492, 0.06966961, 1, 1, 1, 1, 1,
-1.186702, -0.1007915, -2.87002, 1, 1, 1, 1, 1,
-1.185262, -0.2444052, -0.7674959, 1, 1, 1, 1, 1,
-1.171533, 0.2222943, -1.695757, 1, 1, 1, 1, 1,
-1.171414, -1.030563, -2.070995, 1, 1, 1, 1, 1,
-1.17019, 0.05366902, -2.424014, 1, 1, 1, 1, 1,
-1.151156, 0.7668592, 0.7835827, 1, 1, 1, 1, 1,
-1.148974, -0.05071967, -1.95181, 1, 1, 1, 1, 1,
-1.13818, -1.505608, -2.048204, 1, 1, 1, 1, 1,
-1.114839, -0.3380157, -2.219619, 1, 1, 1, 1, 1,
-1.110918, 0.4096813, -0.958513, 1, 1, 1, 1, 1,
-1.101241, -0.3285942, -4.618918, 1, 1, 1, 1, 1,
-1.096639, 0.6762323, -2.385648, 1, 1, 1, 1, 1,
-1.086273, -1.324585, -2.586383, 1, 1, 1, 1, 1,
-1.08075, 1.099854, -1.072951, 1, 1, 1, 1, 1,
-1.077292, -0.4333935, -2.056389, 0, 0, 1, 1, 1,
-1.074459, -0.1241893, -2.218711, 1, 0, 0, 1, 1,
-1.073524, 1.982721, 0.1627124, 1, 0, 0, 1, 1,
-1.070218, -1.18736, -0.8021368, 1, 0, 0, 1, 1,
-1.06808, 1.633085, -0.1012624, 1, 0, 0, 1, 1,
-1.060984, 1.897116, 0.4892777, 1, 0, 0, 1, 1,
-1.059224, -0.1799367, -3.605588, 0, 0, 0, 1, 1,
-1.059093, -0.0745802, -3.563648, 0, 0, 0, 1, 1,
-1.056469, 0.1406515, -2.423882, 0, 0, 0, 1, 1,
-1.055341, -1.46373, -1.828407, 0, 0, 0, 1, 1,
-1.047679, 0.07123753, -1.316058, 0, 0, 0, 1, 1,
-1.043095, 0.7271736, -1.154659, 0, 0, 0, 1, 1,
-1.042765, 0.03197525, -0.650928, 0, 0, 0, 1, 1,
-1.041498, -0.8522359, -2.702039, 1, 1, 1, 1, 1,
-1.031156, -1.16216, -2.338085, 1, 1, 1, 1, 1,
-1.030092, 0.6088333, -1.349742, 1, 1, 1, 1, 1,
-1.02675, 2.014255, 0.05409082, 1, 1, 1, 1, 1,
-1.026504, -0.6683624, -3.073828, 1, 1, 1, 1, 1,
-1.019461, -0.02775797, -0.0574322, 1, 1, 1, 1, 1,
-1.01885, 0.5888138, -1.372697, 1, 1, 1, 1, 1,
-1.017613, 1.875021, -0.982161, 1, 1, 1, 1, 1,
-1.004741, -0.4902684, -1.78422, 1, 1, 1, 1, 1,
-1.001086, 0.5275854, -0.6652151, 1, 1, 1, 1, 1,
-0.9987118, -0.4467467, -0.6579641, 1, 1, 1, 1, 1,
-0.9980395, 1.06256, 0.09631174, 1, 1, 1, 1, 1,
-0.9946777, 0.1163212, -2.493612, 1, 1, 1, 1, 1,
-0.9943554, 0.438636, -2.362533, 1, 1, 1, 1, 1,
-0.9877509, 0.299718, -1.337888, 1, 1, 1, 1, 1,
-0.9871246, 0.5910636, -0.5704415, 0, 0, 1, 1, 1,
-0.984688, -0.3273229, -3.340676, 1, 0, 0, 1, 1,
-0.9845499, 0.1631965, 0.1697319, 1, 0, 0, 1, 1,
-0.9831252, -2.651299, -2.229478, 1, 0, 0, 1, 1,
-0.9790691, -1.142091, -0.3759723, 1, 0, 0, 1, 1,
-0.9790539, 0.07329519, -1.23738, 1, 0, 0, 1, 1,
-0.9777017, -0.3998286, -0.9200157, 0, 0, 0, 1, 1,
-0.9769933, 1.195112, -0.4740202, 0, 0, 0, 1, 1,
-0.9763655, 0.5502262, -0.2858864, 0, 0, 0, 1, 1,
-0.9708462, 0.04700411, -0.06084581, 0, 0, 0, 1, 1,
-0.9705179, 0.6452457, -0.09488468, 0, 0, 0, 1, 1,
-0.9696606, 2.294666, 0.2399722, 0, 0, 0, 1, 1,
-0.9673464, -0.5429507, -1.764284, 0, 0, 0, 1, 1,
-0.9672801, -1.022047, -1.998961, 1, 1, 1, 1, 1,
-0.9590045, -2.011992, -2.997109, 1, 1, 1, 1, 1,
-0.954538, 1.018769, -0.09629637, 1, 1, 1, 1, 1,
-0.9488543, 0.6159525, -2.910628, 1, 1, 1, 1, 1,
-0.9342279, 0.5386862, 0.110619, 1, 1, 1, 1, 1,
-0.9288177, -0.3381723, -3.253528, 1, 1, 1, 1, 1,
-0.9200994, 1.90246, -2.314975, 1, 1, 1, 1, 1,
-0.9166501, 0.847368, 1.774941, 1, 1, 1, 1, 1,
-0.9156561, -1.330933, -2.540723, 1, 1, 1, 1, 1,
-0.908147, 1.633748, 1.763293, 1, 1, 1, 1, 1,
-0.9076203, -1.399432, -1.871416, 1, 1, 1, 1, 1,
-0.9056008, 0.02164227, -3.096592, 1, 1, 1, 1, 1,
-0.9043499, 0.4086743, -0.3114359, 1, 1, 1, 1, 1,
-0.9037063, -1.47659, -3.315145, 1, 1, 1, 1, 1,
-0.903121, -1.377824, -1.442488, 1, 1, 1, 1, 1,
-0.8983218, 0.3478787, -0.2117357, 0, 0, 1, 1, 1,
-0.8947518, -0.6530544, -1.637641, 1, 0, 0, 1, 1,
-0.8844385, 0.5613278, -1.062454, 1, 0, 0, 1, 1,
-0.8753265, 1.304406, 1.332109, 1, 0, 0, 1, 1,
-0.874862, -1.300477, -3.506002, 1, 0, 0, 1, 1,
-0.8693814, 1.034952, -2.704268, 1, 0, 0, 1, 1,
-0.8649154, 0.7649719, -2.719997, 0, 0, 0, 1, 1,
-0.857657, 1.062807, 0.7602224, 0, 0, 0, 1, 1,
-0.8546145, -0.5309357, -3.137167, 0, 0, 0, 1, 1,
-0.8539614, 0.1351785, -2.801706, 0, 0, 0, 1, 1,
-0.8533507, -0.01719806, -2.592788, 0, 0, 0, 1, 1,
-0.8523487, -0.3317345, -3.341574, 0, 0, 0, 1, 1,
-0.8511478, -1.217295, -2.856095, 0, 0, 0, 1, 1,
-0.8500084, 0.6470224, -0.6972374, 1, 1, 1, 1, 1,
-0.8479055, -1.386649, -3.505631, 1, 1, 1, 1, 1,
-0.8471549, -1.029091, -1.759498, 1, 1, 1, 1, 1,
-0.8429971, 0.1681624, -2.687253, 1, 1, 1, 1, 1,
-0.8403696, -0.2090953, -1.669371, 1, 1, 1, 1, 1,
-0.8346602, -0.1123645, -2.372131, 1, 1, 1, 1, 1,
-0.8264486, 1.710416, 0.6397631, 1, 1, 1, 1, 1,
-0.8195292, 1.574736, -0.0906675, 1, 1, 1, 1, 1,
-0.8191429, 0.3542028, -1.700339, 1, 1, 1, 1, 1,
-0.8185439, -0.6136596, -3.004948, 1, 1, 1, 1, 1,
-0.8174344, -0.7404357, -1.972378, 1, 1, 1, 1, 1,
-0.8163878, -0.6850479, -4.464539, 1, 1, 1, 1, 1,
-0.8157895, 0.4387245, -2.446085, 1, 1, 1, 1, 1,
-0.8135862, -0.3063096, -0.9352999, 1, 1, 1, 1, 1,
-0.8107958, -0.5189114, -2.250882, 1, 1, 1, 1, 1,
-0.8087258, -1.520584, -3.788697, 0, 0, 1, 1, 1,
-0.8087115, -0.3931236, -3.045636, 1, 0, 0, 1, 1,
-0.8074757, -0.5803418, -0.3780846, 1, 0, 0, 1, 1,
-0.8064219, -0.09249039, -0.7539273, 1, 0, 0, 1, 1,
-0.8052061, -0.09873488, -2.926879, 1, 0, 0, 1, 1,
-0.8040608, -0.9137832, -2.641721, 1, 0, 0, 1, 1,
-0.8026459, -0.1047182, -1.649511, 0, 0, 0, 1, 1,
-0.7988578, -0.09441088, -2.639635, 0, 0, 0, 1, 1,
-0.7985224, -0.05470189, -2.157781, 0, 0, 0, 1, 1,
-0.7946715, 0.4676219, -1.897452, 0, 0, 0, 1, 1,
-0.7895603, -1.057903, -3.990288, 0, 0, 0, 1, 1,
-0.7892926, -1.365952, -1.442287, 0, 0, 0, 1, 1,
-0.7864317, 0.7828909, -1.325737, 0, 0, 0, 1, 1,
-0.7857452, -1.004977, -1.80951, 1, 1, 1, 1, 1,
-0.7840328, 1.587637, 0.1878921, 1, 1, 1, 1, 1,
-0.7829484, -0.08315337, -0.954636, 1, 1, 1, 1, 1,
-0.7822591, -0.5329394, -0.8118874, 1, 1, 1, 1, 1,
-0.7738129, -1.281287, -1.397426, 1, 1, 1, 1, 1,
-0.7693585, 1.195812, -1.382435, 1, 1, 1, 1, 1,
-0.7659059, 2.066286, 0.733137, 1, 1, 1, 1, 1,
-0.7650335, -1.11088, -2.929804, 1, 1, 1, 1, 1,
-0.7613737, 1.176182, -0.1196752, 1, 1, 1, 1, 1,
-0.7613286, -1.245539, -3.01504, 1, 1, 1, 1, 1,
-0.7605936, -0.6313063, -2.202644, 1, 1, 1, 1, 1,
-0.758132, -0.7118207, -1.805961, 1, 1, 1, 1, 1,
-0.7554195, -1.381651, -3.654277, 1, 1, 1, 1, 1,
-0.7550917, 0.4485867, -1.425764, 1, 1, 1, 1, 1,
-0.754797, -0.9862077, -1.448499, 1, 1, 1, 1, 1,
-0.7542062, 0.1740021, -1.660912, 0, 0, 1, 1, 1,
-0.7490997, 0.6314113, -1.448302, 1, 0, 0, 1, 1,
-0.7439449, 0.5408657, -2.461736, 1, 0, 0, 1, 1,
-0.7438461, 0.8575235, -1.526921, 1, 0, 0, 1, 1,
-0.7414272, 0.8319806, 0.704901, 1, 0, 0, 1, 1,
-0.732776, 1.078743, -0.3517498, 1, 0, 0, 1, 1,
-0.7311679, 0.3902047, -2.604729, 0, 0, 0, 1, 1,
-0.7298852, 0.3508469, -1.103523, 0, 0, 0, 1, 1,
-0.7281768, -0.9841047, -1.456874, 0, 0, 0, 1, 1,
-0.7257886, 0.5870572, -1.251814, 0, 0, 0, 1, 1,
-0.7186765, -0.01413886, -1.531713, 0, 0, 0, 1, 1,
-0.7183946, -0.5560225, -1.556336, 0, 0, 0, 1, 1,
-0.7158691, 0.5027164, 0.1146981, 0, 0, 0, 1, 1,
-0.6890603, -0.437036, -1.452722, 1, 1, 1, 1, 1,
-0.6889334, -0.3943779, -2.437233, 1, 1, 1, 1, 1,
-0.6856763, 1.075116, 0.2166023, 1, 1, 1, 1, 1,
-0.6843849, 0.02858035, -3.835178, 1, 1, 1, 1, 1,
-0.682858, 0.2366447, -2.350658, 1, 1, 1, 1, 1,
-0.6827034, -0.3390787, -2.546396, 1, 1, 1, 1, 1,
-0.6766, 0.6243706, -1.812022, 1, 1, 1, 1, 1,
-0.6725896, 1.224048, 0.8651057, 1, 1, 1, 1, 1,
-0.6714176, 1.161877, -0.5513883, 1, 1, 1, 1, 1,
-0.6636361, 0.7421968, -0.2402965, 1, 1, 1, 1, 1,
-0.6595802, 2.354509, 0.3072114, 1, 1, 1, 1, 1,
-0.6576358, -0.4822454, -3.147194, 1, 1, 1, 1, 1,
-0.6491586, -0.8137729, -1.420456, 1, 1, 1, 1, 1,
-0.6390895, -2.241403, -3.804146, 1, 1, 1, 1, 1,
-0.6384708, 1.328526, 1.855113, 1, 1, 1, 1, 1,
-0.6359898, -0.8068277, -2.425565, 0, 0, 1, 1, 1,
-0.6355389, 1.2982, -0.7173792, 1, 0, 0, 1, 1,
-0.63428, 0.1919726, -1.941911, 1, 0, 0, 1, 1,
-0.631172, 0.07585986, 0.114999, 1, 0, 0, 1, 1,
-0.6206741, -0.4557515, -0.8029045, 1, 0, 0, 1, 1,
-0.6205288, -0.4513788, -1.031512, 1, 0, 0, 1, 1,
-0.6168469, -0.3523506, -2.780672, 0, 0, 0, 1, 1,
-0.6127551, -0.9003838, -3.62486, 0, 0, 0, 1, 1,
-0.6104972, 0.8125688, -1.826823, 0, 0, 0, 1, 1,
-0.6096061, -0.7305219, -1.385536, 0, 0, 0, 1, 1,
-0.6088415, -0.3125115, -2.762223, 0, 0, 0, 1, 1,
-0.6086837, 0.6121875, -1.100402, 0, 0, 0, 1, 1,
-0.6083984, -0.7503671, -2.553698, 0, 0, 0, 1, 1,
-0.607895, -0.190845, -4.752693, 1, 1, 1, 1, 1,
-0.5961005, 2.447511, -1.969241, 1, 1, 1, 1, 1,
-0.5950089, 0.8258657, 0.4465902, 1, 1, 1, 1, 1,
-0.5947801, -0.5310811, -1.06968, 1, 1, 1, 1, 1,
-0.5925509, -1.180991, -4.109115, 1, 1, 1, 1, 1,
-0.591586, 0.8363352, -1.758837, 1, 1, 1, 1, 1,
-0.5870157, -0.4892337, -4.461247, 1, 1, 1, 1, 1,
-0.5721073, -0.4562986, -1.791038, 1, 1, 1, 1, 1,
-0.570924, -0.1714421, -1.979005, 1, 1, 1, 1, 1,
-0.5647801, -0.8203237, -2.551269, 1, 1, 1, 1, 1,
-0.5641612, -1.056609, -3.470461, 1, 1, 1, 1, 1,
-0.560331, 0.5812568, 0.4441915, 1, 1, 1, 1, 1,
-0.5585962, -0.3216043, -2.974546, 1, 1, 1, 1, 1,
-0.5584074, 0.8369658, -0.1400113, 1, 1, 1, 1, 1,
-0.5563403, 0.1542532, -1.820676, 1, 1, 1, 1, 1,
-0.5539141, -0.7679356, -2.460226, 0, 0, 1, 1, 1,
-0.553663, -0.840672, -3.492113, 1, 0, 0, 1, 1,
-0.5533233, 0.4231152, -0.7769731, 1, 0, 0, 1, 1,
-0.5446874, -2.011369, -3.338814, 1, 0, 0, 1, 1,
-0.5435356, -0.2331795, -2.919855, 1, 0, 0, 1, 1,
-0.5423428, -0.1824886, -1.718827, 1, 0, 0, 1, 1,
-0.5422169, 0.9339712, -1.085186, 0, 0, 0, 1, 1,
-0.5340374, 0.6541469, -0.7483854, 0, 0, 0, 1, 1,
-0.5313717, 0.4268124, 0.8686867, 0, 0, 0, 1, 1,
-0.5290571, 0.5487255, 1.645324, 0, 0, 0, 1, 1,
-0.5287043, -0.4970041, -1.550271, 0, 0, 0, 1, 1,
-0.5239272, 0.534431, -1.229859, 0, 0, 0, 1, 1,
-0.5212626, -0.1555022, -2.513486, 0, 0, 0, 1, 1,
-0.5211348, -0.08793204, -0.7554725, 1, 1, 1, 1, 1,
-0.5154329, -0.8865829, -1.708573, 1, 1, 1, 1, 1,
-0.5148893, -0.3498304, -1.755836, 1, 1, 1, 1, 1,
-0.5148772, 2.198032, 0.8667358, 1, 1, 1, 1, 1,
-0.5094906, 1.049285, -1.051725, 1, 1, 1, 1, 1,
-0.5030749, -0.0271927, -1.609944, 1, 1, 1, 1, 1,
-0.5016794, 1.443997, 0.7381064, 1, 1, 1, 1, 1,
-0.5000414, -0.08011957, -1.237665, 1, 1, 1, 1, 1,
-0.4994883, -0.474094, -3.352101, 1, 1, 1, 1, 1,
-0.4974718, 0.1355871, -0.378938, 1, 1, 1, 1, 1,
-0.4971234, -0.1857188, -1.387414, 1, 1, 1, 1, 1,
-0.4956477, 0.8557898, -2.636466, 1, 1, 1, 1, 1,
-0.4910747, -1.072358, -3.787013, 1, 1, 1, 1, 1,
-0.4770159, 0.8375638, -1.037467, 1, 1, 1, 1, 1,
-0.4753613, 1.095484, -1.684609, 1, 1, 1, 1, 1,
-0.4753508, 0.5725244, 0.7725434, 0, 0, 1, 1, 1,
-0.4647827, 0.1833213, -1.081087, 1, 0, 0, 1, 1,
-0.4599157, 0.8269615, -0.4550605, 1, 0, 0, 1, 1,
-0.4589239, 0.5242311, 0.05495642, 1, 0, 0, 1, 1,
-0.4565006, -1.695832, -4.724415, 1, 0, 0, 1, 1,
-0.4542207, 1.168549, -0.6177582, 1, 0, 0, 1, 1,
-0.4539833, 0.8255031, -0.7902359, 0, 0, 0, 1, 1,
-0.4526779, -0.6759576, -1.652378, 0, 0, 0, 1, 1,
-0.4465964, -0.4707074, -1.790254, 0, 0, 0, 1, 1,
-0.4455362, 1.004945, -0.9883956, 0, 0, 0, 1, 1,
-0.4430908, -0.05176375, -2.501068, 0, 0, 0, 1, 1,
-0.4426409, -1.461645, -2.55076, 0, 0, 0, 1, 1,
-0.4381697, -0.001709572, 0.07151876, 0, 0, 0, 1, 1,
-0.4306979, 0.8203256, -1.645293, 1, 1, 1, 1, 1,
-0.424421, 0.6425781, -0.312642, 1, 1, 1, 1, 1,
-0.4243428, 2.054368, 1.746021, 1, 1, 1, 1, 1,
-0.4177959, 0.6230347, -1.309976, 1, 1, 1, 1, 1,
-0.4156895, 0.1892072, -1.333847, 1, 1, 1, 1, 1,
-0.4136525, 1.376018, -0.5758842, 1, 1, 1, 1, 1,
-0.4129347, 0.03032606, -0.7945097, 1, 1, 1, 1, 1,
-0.4009223, 0.03727102, -2.780929, 1, 1, 1, 1, 1,
-0.3994205, -0.09670065, -1.596245, 1, 1, 1, 1, 1,
-0.3981911, -0.0997417, -2.587361, 1, 1, 1, 1, 1,
-0.3955569, 0.06927487, -0.6647843, 1, 1, 1, 1, 1,
-0.395185, 0.9516233, -0.3293125, 1, 1, 1, 1, 1,
-0.3841408, 0.1870851, -2.085641, 1, 1, 1, 1, 1,
-0.380838, 0.1664823, -0.6495256, 1, 1, 1, 1, 1,
-0.3783802, 0.1865575, -3.144468, 1, 1, 1, 1, 1,
-0.3755256, 1.17039, 0.4950851, 0, 0, 1, 1, 1,
-0.3711544, 2.371306, 1.904421, 1, 0, 0, 1, 1,
-0.3694486, 0.709554, 0.2915184, 1, 0, 0, 1, 1,
-0.3693317, -0.9795411, -3.002229, 1, 0, 0, 1, 1,
-0.3664325, -0.4218047, -1.554096, 1, 0, 0, 1, 1,
-0.3659454, -0.4095351, -1.500167, 1, 0, 0, 1, 1,
-0.3636435, 0.1862115, 0.17387, 0, 0, 0, 1, 1,
-0.3633153, -0.02683194, -1.163895, 0, 0, 0, 1, 1,
-0.359048, 0.6084425, -1.510064, 0, 0, 0, 1, 1,
-0.3569152, -0.2938277, 0.3144718, 0, 0, 0, 1, 1,
-0.3526172, -1.42453, -3.135241, 0, 0, 0, 1, 1,
-0.352079, -0.4686963, -2.875695, 0, 0, 0, 1, 1,
-0.3456921, 1.492993, 1.699177, 0, 0, 0, 1, 1,
-0.3452345, -0.4799702, -1.937788, 1, 1, 1, 1, 1,
-0.3396289, -0.1408561, -2.411993, 1, 1, 1, 1, 1,
-0.3380928, -0.4875816, -2.477166, 1, 1, 1, 1, 1,
-0.3340782, 0.3186131, -1.356361, 1, 1, 1, 1, 1,
-0.3274226, -0.6554283, -0.6922284, 1, 1, 1, 1, 1,
-0.3270764, 0.2058247, -1.849693, 1, 1, 1, 1, 1,
-0.3266752, 0.6507239, -0.1599739, 1, 1, 1, 1, 1,
-0.325679, -0.07004318, -2.319202, 1, 1, 1, 1, 1,
-0.3213298, -0.419526, -2.351784, 1, 1, 1, 1, 1,
-0.3211875, -1.370964, -1.795482, 1, 1, 1, 1, 1,
-0.319237, -0.22455, -3.630522, 1, 1, 1, 1, 1,
-0.318182, -0.09147871, -1.26939, 1, 1, 1, 1, 1,
-0.3159809, 0.225677, -0.241449, 1, 1, 1, 1, 1,
-0.3132431, 1.246193, -1.465083, 1, 1, 1, 1, 1,
-0.3125546, 0.6760226, -1.615018, 1, 1, 1, 1, 1,
-0.3120462, 0.4331987, -1.855338, 0, 0, 1, 1, 1,
-0.3110597, 0.2827142, -3.21738, 1, 0, 0, 1, 1,
-0.3056796, -1.252822, -4.36902, 1, 0, 0, 1, 1,
-0.3049106, 0.4452174, -0.4937281, 1, 0, 0, 1, 1,
-0.3034599, -0.821146, -3.488085, 1, 0, 0, 1, 1,
-0.3023715, -0.6099394, -3.723663, 1, 0, 0, 1, 1,
-0.2966621, 0.1535316, -1.583289, 0, 0, 0, 1, 1,
-0.2962047, -0.4599782, -1.458249, 0, 0, 0, 1, 1,
-0.2939831, 0.6665502, 0.6081068, 0, 0, 0, 1, 1,
-0.292832, -1.202546, -3.133071, 0, 0, 0, 1, 1,
-0.2926002, 1.024024, -0.3847264, 0, 0, 0, 1, 1,
-0.2916549, -1.532287, -1.228306, 0, 0, 0, 1, 1,
-0.2875794, 0.148652, -2.485048, 0, 0, 0, 1, 1,
-0.2826275, -0.5473248, -1.797512, 1, 1, 1, 1, 1,
-0.2821036, 0.4589937, -1.106676, 1, 1, 1, 1, 1,
-0.2810051, -1.218096, -1.445411, 1, 1, 1, 1, 1,
-0.2781551, -1.178366, -3.389828, 1, 1, 1, 1, 1,
-0.268708, 0.3959307, -1.80522, 1, 1, 1, 1, 1,
-0.2678862, 0.213169, -1.570088, 1, 1, 1, 1, 1,
-0.2639295, 1.102779, -1.412551, 1, 1, 1, 1, 1,
-0.2622886, 2.19483, -0.05528705, 1, 1, 1, 1, 1,
-0.2598047, -0.2480966, -2.115512, 1, 1, 1, 1, 1,
-0.2558811, -1.094187, -2.294824, 1, 1, 1, 1, 1,
-0.2536673, -0.5063106, -2.867549, 1, 1, 1, 1, 1,
-0.2521006, -0.1276135, -3.515288, 1, 1, 1, 1, 1,
-0.2492547, 1.961198, 0.9603295, 1, 1, 1, 1, 1,
-0.2488007, 0.2020889, -0.3331055, 1, 1, 1, 1, 1,
-0.2403539, -0.3026123, -3.261096, 1, 1, 1, 1, 1,
-0.2364623, 1.283011, -0.1624098, 0, 0, 1, 1, 1,
-0.2362965, -0.8733526, -2.622389, 1, 0, 0, 1, 1,
-0.2349684, 0.6443681, 0.6016595, 1, 0, 0, 1, 1,
-0.2320421, -1.361856, -2.860985, 1, 0, 0, 1, 1,
-0.2295308, 0.1060695, -2.530903, 1, 0, 0, 1, 1,
-0.229284, 0.4046317, -0.9857603, 1, 0, 0, 1, 1,
-0.2256035, -0.3010936, -2.73511, 0, 0, 0, 1, 1,
-0.2254556, -1.516782, -4.08301, 0, 0, 0, 1, 1,
-0.2233023, 1.565833, -1.331889, 0, 0, 0, 1, 1,
-0.2224252, 0.4514568, -0.565538, 0, 0, 0, 1, 1,
-0.2214878, 0.136269, -2.081976, 0, 0, 0, 1, 1,
-0.2212694, 0.8853583, -0.9119814, 0, 0, 0, 1, 1,
-0.2207702, 0.05517686, -2.531675, 0, 0, 0, 1, 1,
-0.218995, -1.1368, -2.983201, 1, 1, 1, 1, 1,
-0.2174034, -0.3037676, -1.709479, 1, 1, 1, 1, 1,
-0.2106583, -2.023669, -2.122006, 1, 1, 1, 1, 1,
-0.2092759, 0.2601463, -1.211741, 1, 1, 1, 1, 1,
-0.2088546, -0.8077281, -2.499571, 1, 1, 1, 1, 1,
-0.2082384, -1.720451, -3.553677, 1, 1, 1, 1, 1,
-0.2070433, -0.968882, -2.028665, 1, 1, 1, 1, 1,
-0.2055107, 0.1894018, -0.5947509, 1, 1, 1, 1, 1,
-0.202714, 3.111292, -1.057521, 1, 1, 1, 1, 1,
-0.199641, -1.524357, -3.7426, 1, 1, 1, 1, 1,
-0.1983978, 0.3471012, -0.9840446, 1, 1, 1, 1, 1,
-0.1954333, -0.06666409, -2.361019, 1, 1, 1, 1, 1,
-0.1936836, 0.7348207, -0.5702079, 1, 1, 1, 1, 1,
-0.1929509, 0.838439, -1.194606, 1, 1, 1, 1, 1,
-0.1924322, -0.7465494, -2.097056, 1, 1, 1, 1, 1,
-0.1914861, -0.2207814, -1.768498, 0, 0, 1, 1, 1,
-0.1904947, 0.807178, -0.2241825, 1, 0, 0, 1, 1,
-0.1899564, -0.4874381, -4.792767, 1, 0, 0, 1, 1,
-0.1878707, -1.360312, -2.586828, 1, 0, 0, 1, 1,
-0.1870133, 0.109389, 0.3731458, 1, 0, 0, 1, 1,
-0.1856086, -0.6606728, -2.532153, 1, 0, 0, 1, 1,
-0.1754124, 0.8752009, -0.1638208, 0, 0, 0, 1, 1,
-0.1730255, 0.4318119, -0.2837278, 0, 0, 0, 1, 1,
-0.1727938, -0.533516, -1.318469, 0, 0, 0, 1, 1,
-0.1726732, 0.2176215, -0.4740606, 0, 0, 0, 1, 1,
-0.1722949, 0.2306758, -1.593575, 0, 0, 0, 1, 1,
-0.1708639, 0.4868942, -1.150459, 0, 0, 0, 1, 1,
-0.1699175, 1.195917, -1.496347, 0, 0, 0, 1, 1,
-0.1687959, -0.06471759, -1.525075, 1, 1, 1, 1, 1,
-0.1668228, -0.5537311, -3.766215, 1, 1, 1, 1, 1,
-0.1667518, -0.5469081, -3.631828, 1, 1, 1, 1, 1,
-0.1660394, 1.117602, -0.4659383, 1, 1, 1, 1, 1,
-0.1642722, -0.2668525, -1.474888, 1, 1, 1, 1, 1,
-0.1639345, -0.6485745, -1.558788, 1, 1, 1, 1, 1,
-0.1637162, -1.428559, -2.114309, 1, 1, 1, 1, 1,
-0.1602218, -0.8411163, -1.747399, 1, 1, 1, 1, 1,
-0.1549424, 1.051672, -0.8338436, 1, 1, 1, 1, 1,
-0.1536237, -0.98377, -3.783573, 1, 1, 1, 1, 1,
-0.1531076, 0.3547709, -0.548149, 1, 1, 1, 1, 1,
-0.1469789, 1.468245, 1.203448, 1, 1, 1, 1, 1,
-0.1455733, -1.469154, -4.389632, 1, 1, 1, 1, 1,
-0.145043, -1.11872, -1.342314, 1, 1, 1, 1, 1,
-0.14498, 1.002262, -1.194431, 1, 1, 1, 1, 1,
-0.1439547, 0.7580687, -0.8619903, 0, 0, 1, 1, 1,
-0.1432934, 0.0496002, -0.4279732, 1, 0, 0, 1, 1,
-0.1422053, 1.801374, 0.2784715, 1, 0, 0, 1, 1,
-0.1384024, -0.921119, -3.747947, 1, 0, 0, 1, 1,
-0.1371749, 0.02437242, -3.046903, 1, 0, 0, 1, 1,
-0.1363827, 0.920581, -1.412365, 1, 0, 0, 1, 1,
-0.1301072, 0.9842838, -0.9587346, 0, 0, 0, 1, 1,
-0.1286021, -0.1360339, -3.200553, 0, 0, 0, 1, 1,
-0.1279196, 0.1561648, 0.8187917, 0, 0, 0, 1, 1,
-0.1244173, -0.1323353, -4.661107, 0, 0, 0, 1, 1,
-0.1220432, -0.4042774, -2.871182, 0, 0, 0, 1, 1,
-0.1154191, -0.5101845, -1.286513, 0, 0, 0, 1, 1,
-0.1142888, -1.053301, -3.589526, 0, 0, 0, 1, 1,
-0.1110749, 0.3805949, -1.647537, 1, 1, 1, 1, 1,
-0.1095954, -1.556438, -3.442363, 1, 1, 1, 1, 1,
-0.1082777, 2.305763, 0.8391235, 1, 1, 1, 1, 1,
-0.1073081, 0.5277101, -0.2351827, 1, 1, 1, 1, 1,
-0.1058946, 0.6715603, 0.373521, 1, 1, 1, 1, 1,
-0.1056382, -1.776618, -3.709633, 1, 1, 1, 1, 1,
-0.1029896, -0.1345319, -2.505467, 1, 1, 1, 1, 1,
-0.1002686, -1.806229, -2.040789, 1, 1, 1, 1, 1,
-0.09846623, 0.6260433, -0.7291395, 1, 1, 1, 1, 1,
-0.09774488, 0.3388176, 0.5344012, 1, 1, 1, 1, 1,
-0.08588352, 0.8060879, 1.642146, 1, 1, 1, 1, 1,
-0.08575111, 0.2215252, -0.8582243, 1, 1, 1, 1, 1,
-0.08503908, -1.839383, -4.330759, 1, 1, 1, 1, 1,
-0.07996397, -0.1286432, -2.530548, 1, 1, 1, 1, 1,
-0.0794265, -2.566672, -2.129998, 1, 1, 1, 1, 1,
-0.06932931, 1.477462, -0.4910902, 0, 0, 1, 1, 1,
-0.06889184, 0.5614445, -0.6819485, 1, 0, 0, 1, 1,
-0.06739987, 0.9597347, 1.119067, 1, 0, 0, 1, 1,
-0.06617972, 1.236426, -1.494469, 1, 0, 0, 1, 1,
-0.06132197, 1.134559, -1.218767, 1, 0, 0, 1, 1,
-0.05983276, -3.026599, -2.638158, 1, 0, 0, 1, 1,
-0.05718066, 0.271277, 0.4796957, 0, 0, 0, 1, 1,
-0.05428622, -0.04960058, -0.1987558, 0, 0, 0, 1, 1,
-0.05263823, 0.9182897, 1.395643, 0, 0, 0, 1, 1,
-0.0524208, 0.6602784, 1.669989, 0, 0, 0, 1, 1,
-0.04732674, -0.6193079, -2.656176, 0, 0, 0, 1, 1,
-0.04537059, -0.3625668, -5.101699, 0, 0, 0, 1, 1,
-0.04021167, 0.02708608, 0.7713913, 0, 0, 0, 1, 1,
-0.03761727, -0.8946303, -2.752699, 1, 1, 1, 1, 1,
-0.03630152, 1.664925, 0.3345046, 1, 1, 1, 1, 1,
-0.03630102, -0.7464256, -3.706882, 1, 1, 1, 1, 1,
-0.03338328, 0.8070982, 0.347223, 1, 1, 1, 1, 1,
-0.03318119, -1.087827, -5.060755, 1, 1, 1, 1, 1,
-0.03162031, 1.52735, 0.3067531, 1, 1, 1, 1, 1,
-0.03093637, -0.1180193, -3.564903, 1, 1, 1, 1, 1,
-0.03000077, 0.283106, 0.5321035, 1, 1, 1, 1, 1,
-0.02937998, -1.235551, -3.26364, 1, 1, 1, 1, 1,
-0.02364465, 0.250735, 0.09644365, 1, 1, 1, 1, 1,
-0.01659958, -1.601335, -2.449724, 1, 1, 1, 1, 1,
-0.01277434, -0.443812, -1.941445, 1, 1, 1, 1, 1,
-0.009623204, -0.9211549, -4.814492, 1, 1, 1, 1, 1,
-0.003124798, -0.6241307, -2.232602, 1, 1, 1, 1, 1,
-0.002363513, -1.034507, -2.495664, 1, 1, 1, 1, 1,
-0.002039693, 0.1889956, 0.3274713, 0, 0, 1, 1, 1,
-0.00150126, 1.045252, 0.1990147, 1, 0, 0, 1, 1,
0.0004267959, 1.24524, -0.1743193, 1, 0, 0, 1, 1,
0.001932531, 1.081614, 0.9892728, 1, 0, 0, 1, 1,
0.004583936, -0.9097608, 5.209106, 1, 0, 0, 1, 1,
0.009699686, 1.401285, -0.524996, 1, 0, 0, 1, 1,
0.02922037, 0.2494462, 0.9945558, 0, 0, 0, 1, 1,
0.02961004, -1.153035, 2.685225, 0, 0, 0, 1, 1,
0.02972594, -0.7986125, 4.658128, 0, 0, 0, 1, 1,
0.03109006, -0.09413057, 1.849892, 0, 0, 0, 1, 1,
0.03373899, 1.0104, -0.123305, 0, 0, 0, 1, 1,
0.03395547, -0.5565121, 2.759051, 0, 0, 0, 1, 1,
0.03457879, 0.08652741, -1.186131, 0, 0, 0, 1, 1,
0.03529313, 0.8287203, -1.335646, 1, 1, 1, 1, 1,
0.03612523, -0.1779006, 2.42022, 1, 1, 1, 1, 1,
0.03626022, -1.832133, 3.860705, 1, 1, 1, 1, 1,
0.03689821, 0.5572824, 0.6270365, 1, 1, 1, 1, 1,
0.03894548, -1.211253, 2.316678, 1, 1, 1, 1, 1,
0.03926496, 0.3714065, 0.5807734, 1, 1, 1, 1, 1,
0.0420744, 0.8316036, 0.4520444, 1, 1, 1, 1, 1,
0.04325112, 1.445383, 0.5956584, 1, 1, 1, 1, 1,
0.04827852, 0.6996691, 0.3495522, 1, 1, 1, 1, 1,
0.0568826, 0.1470314, 0.6851006, 1, 1, 1, 1, 1,
0.05943878, -0.8608536, 4.049129, 1, 1, 1, 1, 1,
0.05961819, 0.1536078, 0.7403707, 1, 1, 1, 1, 1,
0.06592419, -0.445171, 2.535477, 1, 1, 1, 1, 1,
0.06734184, -0.04580266, 4.173574, 1, 1, 1, 1, 1,
0.0693619, -0.08095743, 2.67027, 1, 1, 1, 1, 1,
0.06992387, 1.359302, -0.5432437, 0, 0, 1, 1, 1,
0.07000589, 0.5786564, 1.532027, 1, 0, 0, 1, 1,
0.07139575, -0.09655514, 2.763602, 1, 0, 0, 1, 1,
0.07375199, -0.5569563, 4.078054, 1, 0, 0, 1, 1,
0.07608144, 0.3311537, 0.4321641, 1, 0, 0, 1, 1,
0.07631662, 0.1077522, 0.5187202, 1, 0, 0, 1, 1,
0.07829997, -0.7354871, 2.343695, 0, 0, 0, 1, 1,
0.07945956, -0.06106382, 1.460015, 0, 0, 0, 1, 1,
0.08201423, -0.3264422, 1.738391, 0, 0, 0, 1, 1,
0.08721618, 1.242017, 0.2674888, 0, 0, 0, 1, 1,
0.08833881, 1.156288, -0.1057591, 0, 0, 0, 1, 1,
0.08849753, 1.779933, 1.213631, 0, 0, 0, 1, 1,
0.09245943, -0.9159343, 2.792484, 0, 0, 0, 1, 1,
0.09247721, -0.3904338, 2.65587, 1, 1, 1, 1, 1,
0.09800041, -0.2269572, 2.135176, 1, 1, 1, 1, 1,
0.1009823, 2.29897, 0.7382874, 1, 1, 1, 1, 1,
0.1035374, 0.3186429, 0.586387, 1, 1, 1, 1, 1,
0.1077548, -0.9819326, 4.077879, 1, 1, 1, 1, 1,
0.1077777, -0.3762614, 1.088695, 1, 1, 1, 1, 1,
0.1078358, -0.3483597, 4.030566, 1, 1, 1, 1, 1,
0.1080438, -0.257455, 2.410649, 1, 1, 1, 1, 1,
0.1109854, -0.4611172, 3.427591, 1, 1, 1, 1, 1,
0.1124545, 0.3387545, 2.223965, 1, 1, 1, 1, 1,
0.1133911, 1.037714, 0.1019625, 1, 1, 1, 1, 1,
0.1156686, -0.328006, 1.799137, 1, 1, 1, 1, 1,
0.1206003, 1.076086, 2.070493, 1, 1, 1, 1, 1,
0.1216822, 1.820906, 3.289633, 1, 1, 1, 1, 1,
0.1263398, 0.2995541, -0.7784378, 1, 1, 1, 1, 1,
0.1296644, 0.2624392, 0.4097154, 0, 0, 1, 1, 1,
0.1305467, -0.1872475, 1.949104, 1, 0, 0, 1, 1,
0.1309291, 0.7778111, 1.072934, 1, 0, 0, 1, 1,
0.1343734, 0.07430822, 1.600682, 1, 0, 0, 1, 1,
0.1344828, 0.6835742, 0.6117557, 1, 0, 0, 1, 1,
0.1363996, 0.7330872, 0.3142394, 1, 0, 0, 1, 1,
0.1379358, 0.5722741, 1.034477, 0, 0, 0, 1, 1,
0.1387021, -0.5579503, 1.551279, 0, 0, 0, 1, 1,
0.1387929, 0.4752798, -0.1893505, 0, 0, 0, 1, 1,
0.1390136, 0.5115839, 0.449838, 0, 0, 0, 1, 1,
0.1393742, -0.02680787, -0.04021209, 0, 0, 0, 1, 1,
0.1433165, -0.2143551, 2.375322, 0, 0, 0, 1, 1,
0.1500631, -0.4355255, 3.54989, 0, 0, 0, 1, 1,
0.1518306, 1.163925, -1.554867, 1, 1, 1, 1, 1,
0.1523645, 0.3457571, 0.3420468, 1, 1, 1, 1, 1,
0.1533427, 0.9440354, -1.491305, 1, 1, 1, 1, 1,
0.1567136, 0.7477587, 0.4673176, 1, 1, 1, 1, 1,
0.1583744, -2.964779, 4.510355, 1, 1, 1, 1, 1,
0.1643206, -0.5337752, 2.452217, 1, 1, 1, 1, 1,
0.1689074, 1.223401, 0.08646897, 1, 1, 1, 1, 1,
0.1711793, 0.4955749, -0.06043881, 1, 1, 1, 1, 1,
0.1826773, 0.6182493, 2.63108, 1, 1, 1, 1, 1,
0.1911356, 0.1846124, 1.831149, 1, 1, 1, 1, 1,
0.1939217, -0.6297924, 3.921572, 1, 1, 1, 1, 1,
0.2008673, -0.8259498, 2.27581, 1, 1, 1, 1, 1,
0.2056914, -1.297193, 1.889926, 1, 1, 1, 1, 1,
0.2070164, -0.4192985, 1.8944, 1, 1, 1, 1, 1,
0.2100431, 0.03244447, 2.298023, 1, 1, 1, 1, 1,
0.2102533, -0.8788935, 3.423162, 0, 0, 1, 1, 1,
0.2108686, 0.3742296, 1.006458, 1, 0, 0, 1, 1,
0.2114618, 1.743194, -0.0296477, 1, 0, 0, 1, 1,
0.213262, -1.132115, 3.173593, 1, 0, 0, 1, 1,
0.2138064, -0.2908005, 0.687779, 1, 0, 0, 1, 1,
0.2139117, -1.262155, 3.460933, 1, 0, 0, 1, 1,
0.2196703, -0.3529615, 2.596125, 0, 0, 0, 1, 1,
0.2197097, 1.292503, -0.5048053, 0, 0, 0, 1, 1,
0.2227111, 0.2994921, 1.694248, 0, 0, 0, 1, 1,
0.2255045, -0.5427474, 2.463733, 0, 0, 0, 1, 1,
0.229302, 0.1183256, 0.1665639, 0, 0, 0, 1, 1,
0.2296396, -0.2853281, 3.050495, 0, 0, 0, 1, 1,
0.2299947, 0.5693749, -0.1485079, 0, 0, 0, 1, 1,
0.2347832, -0.2878638, 1.850901, 1, 1, 1, 1, 1,
0.2350687, 1.130796, -1.110759, 1, 1, 1, 1, 1,
0.2433394, -0.8239284, 2.367013, 1, 1, 1, 1, 1,
0.2433889, -0.7047995, 2.954595, 1, 1, 1, 1, 1,
0.2464285, -0.9402828, 3.598243, 1, 1, 1, 1, 1,
0.2464604, -0.7160473, 4.274105, 1, 1, 1, 1, 1,
0.2475491, -0.5088895, 2.706913, 1, 1, 1, 1, 1,
0.249012, 0.030803, 0.5128375, 1, 1, 1, 1, 1,
0.2499043, -1.247736, 0.1730028, 1, 1, 1, 1, 1,
0.2505131, 1.288232, 2.529167, 1, 1, 1, 1, 1,
0.2527616, 1.387781, 0.465996, 1, 1, 1, 1, 1,
0.2541523, 1.491392, 0.7231227, 1, 1, 1, 1, 1,
0.2553425, -0.4137762, 3.621038, 1, 1, 1, 1, 1,
0.2561031, -0.2342473, 2.242507, 1, 1, 1, 1, 1,
0.2570419, 1.539456, -0.3281466, 1, 1, 1, 1, 1,
0.2585089, 3.065489, -1.128405, 0, 0, 1, 1, 1,
0.2613585, -0.6515065, 3.889639, 1, 0, 0, 1, 1,
0.2619036, -0.4278436, 0.737619, 1, 0, 0, 1, 1,
0.2719774, -1.076065, 1.558397, 1, 0, 0, 1, 1,
0.2735225, 0.4070208, 0.6325257, 1, 0, 0, 1, 1,
0.2742262, 0.3434158, 0.9208145, 1, 0, 0, 1, 1,
0.2753597, 0.7516056, -0.9887387, 0, 0, 0, 1, 1,
0.2758367, 1.094015, -0.2151605, 0, 0, 0, 1, 1,
0.2826868, -0.544764, 1.93864, 0, 0, 0, 1, 1,
0.2829112, -1.468965, 2.342072, 0, 0, 0, 1, 1,
0.2868336, -0.6649153, 1.741031, 0, 0, 0, 1, 1,
0.2908485, -0.6000149, 2.720048, 0, 0, 0, 1, 1,
0.292747, -0.9417023, 3.104159, 0, 0, 0, 1, 1,
0.293415, 0.3043011, -0.7132779, 1, 1, 1, 1, 1,
0.2968836, 0.1671787, 0.07594279, 1, 1, 1, 1, 1,
0.303648, 0.5206837, 0.446217, 1, 1, 1, 1, 1,
0.314309, 0.1354153, -1.119224, 1, 1, 1, 1, 1,
0.3172728, -0.3312896, 3.0553, 1, 1, 1, 1, 1,
0.3199433, -2.238199, 2.840742, 1, 1, 1, 1, 1,
0.3216878, -1.169229, 2.993645, 1, 1, 1, 1, 1,
0.3222857, 1.66622, 0.4135089, 1, 1, 1, 1, 1,
0.3225845, -1.528983, 2.94337, 1, 1, 1, 1, 1,
0.3239702, 1.581758, 0.5655224, 1, 1, 1, 1, 1,
0.3244162, -0.07476179, 0.2053172, 1, 1, 1, 1, 1,
0.3269539, 0.005797165, 3.873551, 1, 1, 1, 1, 1,
0.3295075, 0.6136708, 0.3941267, 1, 1, 1, 1, 1,
0.3295673, -1.103519, 2.749232, 1, 1, 1, 1, 1,
0.3350653, -0.259261, 2.652473, 1, 1, 1, 1, 1,
0.3361967, -1.468938, 4.793986, 0, 0, 1, 1, 1,
0.3365569, -0.488716, 2.624134, 1, 0, 0, 1, 1,
0.3397755, -2.191466, 2.399437, 1, 0, 0, 1, 1,
0.3441475, 0.4654933, 1.488364, 1, 0, 0, 1, 1,
0.3498617, 0.5826602, 0.8478338, 1, 0, 0, 1, 1,
0.3540744, 3.736854, 0.8066314, 1, 0, 0, 1, 1,
0.3579913, -0.1189031, 1.366384, 0, 0, 0, 1, 1,
0.3603412, 1.129033, 0.8084322, 0, 0, 0, 1, 1,
0.364079, -1.249403, 3.529106, 0, 0, 0, 1, 1,
0.3648171, 0.2676143, 0.1082482, 0, 0, 0, 1, 1,
0.3712555, -0.04050117, 2.426175, 0, 0, 0, 1, 1,
0.3718089, -0.9701288, 2.94889, 0, 0, 0, 1, 1,
0.3773104, 0.6217663, 0.5239321, 0, 0, 0, 1, 1,
0.3809036, 1.345223, 0.1580198, 1, 1, 1, 1, 1,
0.3849882, -0.2754052, 3.32846, 1, 1, 1, 1, 1,
0.3864819, -2.565854, 3.288858, 1, 1, 1, 1, 1,
0.3930344, 2.484901, 1.626055, 1, 1, 1, 1, 1,
0.3959951, 0.5987786, 1.350438, 1, 1, 1, 1, 1,
0.398225, 0.1303662, 1.476733, 1, 1, 1, 1, 1,
0.4005854, 0.8479075, 0.9103567, 1, 1, 1, 1, 1,
0.4039288, -0.2934449, 1.239823, 1, 1, 1, 1, 1,
0.4122533, 0.7205677, 2.388881, 1, 1, 1, 1, 1,
0.4142634, 0.216832, -0.8690404, 1, 1, 1, 1, 1,
0.415112, -0.4084916, 1.399725, 1, 1, 1, 1, 1,
0.4155984, -0.4040533, 0.150022, 1, 1, 1, 1, 1,
0.4174667, 0.3125551, 2.343412, 1, 1, 1, 1, 1,
0.4217919, -0.5668696, 2.169102, 1, 1, 1, 1, 1,
0.4235707, 0.327884, 1.304951, 1, 1, 1, 1, 1,
0.4242269, 0.9669278, 0.6524609, 0, 0, 1, 1, 1,
0.4247721, 1.722076, 0.3322355, 1, 0, 0, 1, 1,
0.4404375, 0.2598034, 1.615675, 1, 0, 0, 1, 1,
0.4419258, 0.2146316, 0.6644969, 1, 0, 0, 1, 1,
0.4482643, -0.5114148, 1.428331, 1, 0, 0, 1, 1,
0.4526607, 1.758794, 0.502165, 1, 0, 0, 1, 1,
0.4546111, 1.166205, 0.6026801, 0, 0, 0, 1, 1,
0.4584555, 0.7389857, 0.4334471, 0, 0, 0, 1, 1,
0.4612547, 1.041676, 0.7540313, 0, 0, 0, 1, 1,
0.4628081, 0.1132751, 0.4146328, 0, 0, 0, 1, 1,
0.4628627, -0.7889163, 1.424551, 0, 0, 0, 1, 1,
0.4674625, -1.564032, 2.42756, 0, 0, 0, 1, 1,
0.4697759, -0.9295318, 2.177643, 0, 0, 0, 1, 1,
0.4713268, 0.04024617, 1.383543, 1, 1, 1, 1, 1,
0.4718585, -0.9760509, 3.485549, 1, 1, 1, 1, 1,
0.475466, -0.186833, 1.523038, 1, 1, 1, 1, 1,
0.4783124, 0.7919432, 0.1151703, 1, 1, 1, 1, 1,
0.4793724, -1.705206, 1.056647, 1, 1, 1, 1, 1,
0.4812011, 0.486777, 1.633574, 1, 1, 1, 1, 1,
0.4861962, -3.254745, 5.112096, 1, 1, 1, 1, 1,
0.4884746, 0.4990561, 1.684134, 1, 1, 1, 1, 1,
0.488737, 0.9421098, -0.1022812, 1, 1, 1, 1, 1,
0.4888831, -0.1629942, 1.484341, 1, 1, 1, 1, 1,
0.4918558, -0.8953738, 4.042041, 1, 1, 1, 1, 1,
0.4949151, -1.430647, 1.522488, 1, 1, 1, 1, 1,
0.4975237, 1.484507, 0.2146027, 1, 1, 1, 1, 1,
0.5003235, -0.05262336, 1.498593, 1, 1, 1, 1, 1,
0.5033306, -0.09376316, 1.376706, 1, 1, 1, 1, 1,
0.5033698, -1.485422, 3.353986, 0, 0, 1, 1, 1,
0.5038904, 1.027094, 1.748134, 1, 0, 0, 1, 1,
0.5063685, -0.4013163, 2.44996, 1, 0, 0, 1, 1,
0.5091974, -1.78907, 2.961413, 1, 0, 0, 1, 1,
0.5118356, 0.4887313, 1.379926, 1, 0, 0, 1, 1,
0.5120999, 1.859147, -1.953221, 1, 0, 0, 1, 1,
0.5147948, -1.586749, 2.460607, 0, 0, 0, 1, 1,
0.5161141, 0.7606891, -0.6866378, 0, 0, 0, 1, 1,
0.5175784, -1.785369, 1.80985, 0, 0, 0, 1, 1,
0.5181772, -1.208124, 3.099915, 0, 0, 0, 1, 1,
0.5245484, -0.5735497, 3.331908, 0, 0, 0, 1, 1,
0.5262922, -1.812523, 2.45641, 0, 0, 0, 1, 1,
0.5276404, -0.0197634, 1.472728, 0, 0, 0, 1, 1,
0.5292293, -0.6539229, 3.646716, 1, 1, 1, 1, 1,
0.530816, -0.1443264, 2.519651, 1, 1, 1, 1, 1,
0.5326082, 0.9162855, -0.3237328, 1, 1, 1, 1, 1,
0.5402606, -0.6775032, -0.2237067, 1, 1, 1, 1, 1,
0.542302, 2.344857, 0.4033362, 1, 1, 1, 1, 1,
0.5425034, 2.353994, 1.172705, 1, 1, 1, 1, 1,
0.545433, 0.4011953, 0.9467315, 1, 1, 1, 1, 1,
0.5454867, 0.9054091, 2.206632, 1, 1, 1, 1, 1,
0.5497666, -1.296035, 1.228974, 1, 1, 1, 1, 1,
0.5507869, 0.314332, 0.3825856, 1, 1, 1, 1, 1,
0.5566723, -0.1157168, 2.436613, 1, 1, 1, 1, 1,
0.5572443, -1.311165, 4.986979, 1, 1, 1, 1, 1,
0.5657867, 0.8264323, 0.5645256, 1, 1, 1, 1, 1,
0.5696042, -0.2336974, 2.346944, 1, 1, 1, 1, 1,
0.5725184, 0.334213, 0.7153699, 1, 1, 1, 1, 1,
0.5763521, -0.5354255, 3.300538, 0, 0, 1, 1, 1,
0.5797556, 0.162502, 1.554866, 1, 0, 0, 1, 1,
0.5844565, -0.4349037, 0.08167055, 1, 0, 0, 1, 1,
0.5857618, 1.229087, -2.064694, 1, 0, 0, 1, 1,
0.5916471, 0.2928681, 2.16779, 1, 0, 0, 1, 1,
0.5919906, 1.211184, 1.129838, 1, 0, 0, 1, 1,
0.5973989, 0.3943715, 0.4549872, 0, 0, 0, 1, 1,
0.5987006, 1.108169, -0.3062029, 0, 0, 0, 1, 1,
0.6024061, 0.3003007, 2.385682, 0, 0, 0, 1, 1,
0.6072807, 0.1294341, 1.820894, 0, 0, 0, 1, 1,
0.6215416, 1.103949, 1.82814, 0, 0, 0, 1, 1,
0.6269248, -0.5363482, 2.370382, 0, 0, 0, 1, 1,
0.6289067, 0.349683, 1.187925, 0, 0, 0, 1, 1,
0.6333116, 0.415422, 1.306701, 1, 1, 1, 1, 1,
0.6373563, 0.5966952, 2.242751, 1, 1, 1, 1, 1,
0.6383982, -1.047114, 3.602517, 1, 1, 1, 1, 1,
0.6403192, -1.126452, 2.661584, 1, 1, 1, 1, 1,
0.6465445, 0.206809, 0.4699388, 1, 1, 1, 1, 1,
0.6470215, -2.389912, 2.748428, 1, 1, 1, 1, 1,
0.6483442, -1.215911, 2.52057, 1, 1, 1, 1, 1,
0.6534746, -1.284525, 0.597535, 1, 1, 1, 1, 1,
0.6557914, 1.18857, 0.3586386, 1, 1, 1, 1, 1,
0.6572769, 0.1707366, 1.612543, 1, 1, 1, 1, 1,
0.6613746, -0.6005659, 2.942979, 1, 1, 1, 1, 1,
0.6728926, 0.01404771, 2.047104, 1, 1, 1, 1, 1,
0.6776471, -0.3871194, 0.8446847, 1, 1, 1, 1, 1,
0.6810459, 2.960187, -0.7462815, 1, 1, 1, 1, 1,
0.6838283, -0.4408174, 0.6161047, 1, 1, 1, 1, 1,
0.6938662, 0.3701072, -0.3055121, 0, 0, 1, 1, 1,
0.7000861, -0.06598755, 1.567222, 1, 0, 0, 1, 1,
0.701191, -0.01215245, 0.05395337, 1, 0, 0, 1, 1,
0.7030914, -0.5933676, 1.192346, 1, 0, 0, 1, 1,
0.7058732, 2.111549, 0.574339, 1, 0, 0, 1, 1,
0.7085758, 0.6721383, 0.5426158, 1, 0, 0, 1, 1,
0.718662, 1.204102, 1.739521, 0, 0, 0, 1, 1,
0.7194056, -0.1262537, 0.4803336, 0, 0, 0, 1, 1,
0.7260222, -1.337481, 2.034743, 0, 0, 0, 1, 1,
0.7273885, -0.3456864, 0.3533334, 0, 0, 0, 1, 1,
0.7417234, 0.08372375, 2.22664, 0, 0, 0, 1, 1,
0.7425343, -0.7814762, 3.156906, 0, 0, 0, 1, 1,
0.7443228, -1.084179, 2.70504, 0, 0, 0, 1, 1,
0.7500739, -1.927874, 1.578965, 1, 1, 1, 1, 1,
0.753698, 0.1538662, 2.263695, 1, 1, 1, 1, 1,
0.7540833, 1.849548, -0.03740117, 1, 1, 1, 1, 1,
0.7679577, -2.022604, 2.254154, 1, 1, 1, 1, 1,
0.772168, 0.4999709, 1.40633, 1, 1, 1, 1, 1,
0.7783992, 0.7709153, 0.4178686, 1, 1, 1, 1, 1,
0.7803529, 0.5166337, 0.06373638, 1, 1, 1, 1, 1,
0.7806352, 1.442226, -0.2349509, 1, 1, 1, 1, 1,
0.7809236, -0.6841421, 3.586983, 1, 1, 1, 1, 1,
0.7849102, -0.4765901, 1.903419, 1, 1, 1, 1, 1,
0.7918674, -0.4314892, 2.269033, 1, 1, 1, 1, 1,
0.7977353, 0.07305028, 0.2399232, 1, 1, 1, 1, 1,
0.8007544, 0.4455905, 1.787549, 1, 1, 1, 1, 1,
0.8012741, 1.315674, -0.6771006, 1, 1, 1, 1, 1,
0.8022453, 0.5565395, -0.009923328, 1, 1, 1, 1, 1,
0.80352, 0.940975, 0.9887314, 0, 0, 1, 1, 1,
0.8035441, -0.3785541, 1.442706, 1, 0, 0, 1, 1,
0.8065188, -0.01797875, 0.9496483, 1, 0, 0, 1, 1,
0.8094938, 0.2048232, 0.8229868, 1, 0, 0, 1, 1,
0.8125544, 0.2082786, 3.375074, 1, 0, 0, 1, 1,
0.8140056, -0.1601873, 2.273149, 1, 0, 0, 1, 1,
0.8159532, 1.819938, 0.2604325, 0, 0, 0, 1, 1,
0.8174879, -0.3893767, 2.981289, 0, 0, 0, 1, 1,
0.8279182, -0.3549173, 2.863688, 0, 0, 0, 1, 1,
0.8335285, 0.3401221, 1.040497, 0, 0, 0, 1, 1,
0.8399246, 0.5702787, 1.640049, 0, 0, 0, 1, 1,
0.8404819, -1.815704, 2.456944, 0, 0, 0, 1, 1,
0.8411844, -0.2510176, 1.497138, 0, 0, 0, 1, 1,
0.8446875, 0.7127168, -0.558692, 1, 1, 1, 1, 1,
0.8511571, -0.950554, 1.885691, 1, 1, 1, 1, 1,
0.8553056, 0.3947437, 0.9698845, 1, 1, 1, 1, 1,
0.8564073, -0.9212456, 1.889035, 1, 1, 1, 1, 1,
0.8609622, -0.4437405, -1.510798, 1, 1, 1, 1, 1,
0.8615835, -0.07793756, 3.777479, 1, 1, 1, 1, 1,
0.8641403, -0.636179, 0.7407479, 1, 1, 1, 1, 1,
0.8656784, 0.7209764, -0.05263352, 1, 1, 1, 1, 1,
0.8664237, 0.5208364, -0.4268429, 1, 1, 1, 1, 1,
0.86667, -0.6433254, 3.13782, 1, 1, 1, 1, 1,
0.8741526, -0.2448914, 3.492225, 1, 1, 1, 1, 1,
0.8754397, -1.373004, 3.805792, 1, 1, 1, 1, 1,
0.8761486, 0.9551938, -0.1249833, 1, 1, 1, 1, 1,
0.8775176, -1.150533, 2.556361, 1, 1, 1, 1, 1,
0.8781828, -0.4828194, 3.639688, 1, 1, 1, 1, 1,
0.8790058, -1.264967, 2.925188, 0, 0, 1, 1, 1,
0.8807617, 0.3217548, 0.3182892, 1, 0, 0, 1, 1,
0.892042, 0.09266166, 0.7516714, 1, 0, 0, 1, 1,
0.893187, -0.6435048, 4.449907, 1, 0, 0, 1, 1,
0.8972943, 0.56364, -0.2419214, 1, 0, 0, 1, 1,
0.9029548, 0.1615404, -0.3668221, 1, 0, 0, 1, 1,
0.9067392, 0.5076342, 1.2192, 0, 0, 0, 1, 1,
0.9100178, -0.7534325, -0.3896827, 0, 0, 0, 1, 1,
0.9135822, 0.5142385, 1.134972, 0, 0, 0, 1, 1,
0.9243745, 0.9049805, 1.099551, 0, 0, 0, 1, 1,
0.9267343, 0.1035843, 0.2272264, 0, 0, 0, 1, 1,
0.9285086, 0.7535065, 1.652439, 0, 0, 0, 1, 1,
0.9366846, 1.326178, 0.5865938, 0, 0, 0, 1, 1,
0.9367815, 0.6620775, 2.102954, 1, 1, 1, 1, 1,
0.9390508, -0.9890588, 2.724064, 1, 1, 1, 1, 1,
0.9509211, -1.35693, 1.60589, 1, 1, 1, 1, 1,
0.9525639, 0.01465538, 2.254117, 1, 1, 1, 1, 1,
0.9549087, -0.5118622, 0.9595463, 1, 1, 1, 1, 1,
0.9634721, -0.9658264, 3.175827, 1, 1, 1, 1, 1,
0.9672629, 0.06825321, 1.981021, 1, 1, 1, 1, 1,
0.9683609, -0.214663, 1.526972, 1, 1, 1, 1, 1,
0.9731604, 0.5254287, 2.061582, 1, 1, 1, 1, 1,
0.9773316, -1.307112, 2.853053, 1, 1, 1, 1, 1,
0.9779819, 1.036804, 0.7021884, 1, 1, 1, 1, 1,
0.979634, 0.02765383, 2.465129, 1, 1, 1, 1, 1,
0.9904622, -0.6108508, 1.665216, 1, 1, 1, 1, 1,
0.9922703, 0.06960598, 1.048565, 1, 1, 1, 1, 1,
0.9961991, 0.3755215, 2.681179, 1, 1, 1, 1, 1,
0.9993007, 0.214154, 1.61849, 0, 0, 1, 1, 1,
1.000395, -1.024932, 2.052605, 1, 0, 0, 1, 1,
1.008675, 0.1735503, 1.633161, 1, 0, 0, 1, 1,
1.009058, -0.5081155, 0.001102374, 1, 0, 0, 1, 1,
1.009836, -0.9907878, 1.301644, 1, 0, 0, 1, 1,
1.017505, -0.3958972, 2.344238, 1, 0, 0, 1, 1,
1.01862, 0.721782, 1.70845, 0, 0, 0, 1, 1,
1.020519, -0.03553791, 2.863532, 0, 0, 0, 1, 1,
1.02916, -2.379779, 4.227268, 0, 0, 0, 1, 1,
1.029805, 0.2559836, 1.333104, 0, 0, 0, 1, 1,
1.032941, -0.6732057, 2.667706, 0, 0, 0, 1, 1,
1.035648, -0.6888043, 3.616024, 0, 0, 0, 1, 1,
1.038185, -0.4873402, 2.124847, 0, 0, 0, 1, 1,
1.040183, -1.70573, 2.454665, 1, 1, 1, 1, 1,
1.043547, 0.03931126, 0.2135495, 1, 1, 1, 1, 1,
1.049216, 0.5672005, 1.264574, 1, 1, 1, 1, 1,
1.053913, 0.5412564, 0.7856937, 1, 1, 1, 1, 1,
1.060582, 0.7392083, 1.895676, 1, 1, 1, 1, 1,
1.064561, -1.050245, 1.015543, 1, 1, 1, 1, 1,
1.064987, -0.3082838, 0.08054215, 1, 1, 1, 1, 1,
1.072851, 0.03778596, 1.0391, 1, 1, 1, 1, 1,
1.07508, -0.8996838, 2.258777, 1, 1, 1, 1, 1,
1.08333, 0.7276163, 0.8227051, 1, 1, 1, 1, 1,
1.103241, 0.5918154, 1.642105, 1, 1, 1, 1, 1,
1.103835, 1.282085, 0.5771151, 1, 1, 1, 1, 1,
1.103963, 0.1303249, 1.536816, 1, 1, 1, 1, 1,
1.106525, 1.784037, 1.520288, 1, 1, 1, 1, 1,
1.10987, 1.757365, -0.2807969, 1, 1, 1, 1, 1,
1.115461, -0.04231827, 0.7872148, 0, 0, 1, 1, 1,
1.119523, -1.022264, 1.211952, 1, 0, 0, 1, 1,
1.120157, -0.4648823, 4.03188, 1, 0, 0, 1, 1,
1.129332, -0.08550216, 0.4968365, 1, 0, 0, 1, 1,
1.139872, 0.2128942, 2.417902, 1, 0, 0, 1, 1,
1.141803, 0.390439, 1.767992, 1, 0, 0, 1, 1,
1.14428, -1.244053, 3.219095, 0, 0, 0, 1, 1,
1.146703, 0.1039108, 1.607298, 0, 0, 0, 1, 1,
1.156023, 2.251893, 1.401772, 0, 0, 0, 1, 1,
1.157348, -0.7184573, 2.240306, 0, 0, 0, 1, 1,
1.162066, 0.1098855, 1.344496, 0, 0, 0, 1, 1,
1.163816, 0.4012295, 0.7509689, 0, 0, 0, 1, 1,
1.169137, 1.900105, -0.564156, 0, 0, 0, 1, 1,
1.173157, -2.08227, 2.3687, 1, 1, 1, 1, 1,
1.174373, -1.425042, 1.549816, 1, 1, 1, 1, 1,
1.176028, 0.1429047, 0.4314611, 1, 1, 1, 1, 1,
1.177004, 0.6225494, 1.680958, 1, 1, 1, 1, 1,
1.179358, 0.4840807, 0.6849728, 1, 1, 1, 1, 1,
1.179431, 1.2274, -0.1527637, 1, 1, 1, 1, 1,
1.194633, -0.995416, 1.610134, 1, 1, 1, 1, 1,
1.200103, -0.1369744, 1.20654, 1, 1, 1, 1, 1,
1.216707, 0.08272885, 0.9578384, 1, 1, 1, 1, 1,
1.218838, -0.4328929, 0.964378, 1, 1, 1, 1, 1,
1.218845, -0.7564688, 1.165992, 1, 1, 1, 1, 1,
1.220566, -1.20906, 1.552441, 1, 1, 1, 1, 1,
1.227908, -1.050192, 2.777912, 1, 1, 1, 1, 1,
1.235489, 0.7183908, 2.289714, 1, 1, 1, 1, 1,
1.240904, 0.2043284, 2.50103, 1, 1, 1, 1, 1,
1.243453, 0.3866407, 2.111479, 0, 0, 1, 1, 1,
1.244808, -2.005507, 2.772397, 1, 0, 0, 1, 1,
1.251698, -0.2281111, 2.845942, 1, 0, 0, 1, 1,
1.252948, -1.641591, 2.283694, 1, 0, 0, 1, 1,
1.261704, -1.333731, 3.337543, 1, 0, 0, 1, 1,
1.264143, 0.861786, 0.876553, 1, 0, 0, 1, 1,
1.267108, -0.8864107, 3.253441, 0, 0, 0, 1, 1,
1.270866, -0.3469771, 2.267798, 0, 0, 0, 1, 1,
1.282655, -2.277302, 3.642668, 0, 0, 0, 1, 1,
1.296766, -0.07125068, 0.5938007, 0, 0, 0, 1, 1,
1.300146, 0.7264382, 1.668393, 0, 0, 0, 1, 1,
1.307846, 1.365514, 1.402297, 0, 0, 0, 1, 1,
1.308098, 0.8026729, 1.557942, 0, 0, 0, 1, 1,
1.325804, 0.2150361, 0.06125424, 1, 1, 1, 1, 1,
1.334568, 0.4588772, 1.155118, 1, 1, 1, 1, 1,
1.338485, 0.2110817, 1.577293, 1, 1, 1, 1, 1,
1.339437, 0.2624086, 0.9620729, 1, 1, 1, 1, 1,
1.347853, 0.8910959, 2.170971, 1, 1, 1, 1, 1,
1.354706, -0.06260397, 2.691949, 1, 1, 1, 1, 1,
1.357612, 0.4787482, 0.5031853, 1, 1, 1, 1, 1,
1.366963, -2.867973, 3.497749, 1, 1, 1, 1, 1,
1.368559, 0.4361376, 1.330535, 1, 1, 1, 1, 1,
1.382799, -0.4048496, -0.4704657, 1, 1, 1, 1, 1,
1.388714, 0.7100143, 0.8918805, 1, 1, 1, 1, 1,
1.403971, -0.5631106, 1.682851, 1, 1, 1, 1, 1,
1.435833, 0.004959897, 2.012339, 1, 1, 1, 1, 1,
1.436726, -0.07729309, 2.297565, 1, 1, 1, 1, 1,
1.444048, -1.26967, 3.81822, 1, 1, 1, 1, 1,
1.470112, 0.8260376, 1.390036, 0, 0, 1, 1, 1,
1.474158, -0.243617, 1.998456, 1, 0, 0, 1, 1,
1.482062, -0.7941266, 2.177837, 1, 0, 0, 1, 1,
1.48573, 0.6758949, 0.4408495, 1, 0, 0, 1, 1,
1.495617, -0.6750085, 3.305014, 1, 0, 0, 1, 1,
1.497157, -0.02480589, 2.731209, 1, 0, 0, 1, 1,
1.499244, -0.6441138, 1.705095, 0, 0, 0, 1, 1,
1.500542, 0.3126896, 1.181564, 0, 0, 0, 1, 1,
1.504361, 0.2874117, 2.639772, 0, 0, 0, 1, 1,
1.5072, -2.358408, 3.779759, 0, 0, 0, 1, 1,
1.512086, 0.4861068, 1.644756, 0, 0, 0, 1, 1,
1.522531, 0.9681397, 1.29544, 0, 0, 0, 1, 1,
1.535451, -1.506371, 1.440816, 0, 0, 0, 1, 1,
1.56036, 0.3645667, 1.534828, 1, 1, 1, 1, 1,
1.561471, 0.2959749, 2.289985, 1, 1, 1, 1, 1,
1.567481, 0.2336582, -0.4898898, 1, 1, 1, 1, 1,
1.572909, 2.020276, -0.1976846, 1, 1, 1, 1, 1,
1.582727, 0.3846051, 2.445489, 1, 1, 1, 1, 1,
1.614763, 1.305759, 0.7603893, 1, 1, 1, 1, 1,
1.614933, -1.152813, 1.112923, 1, 1, 1, 1, 1,
1.61934, -2.249291, 1.457491, 1, 1, 1, 1, 1,
1.630555, 0.3599023, 0.6954641, 1, 1, 1, 1, 1,
1.636943, -0.4497469, 2.676372, 1, 1, 1, 1, 1,
1.651582, 1.11681, -0.2390049, 1, 1, 1, 1, 1,
1.651915, 0.7341819, 2.003448, 1, 1, 1, 1, 1,
1.667989, 0.3611783, 1.367054, 1, 1, 1, 1, 1,
1.675574, -0.2240546, 1.363216, 1, 1, 1, 1, 1,
1.700744, -0.41028, 1.230651, 1, 1, 1, 1, 1,
1.717684, -0.6660365, 1.110501, 0, 0, 1, 1, 1,
1.740852, 0.9796382, 2.942675, 1, 0, 0, 1, 1,
1.75315, -1.791406, 1.033442, 1, 0, 0, 1, 1,
1.765361, -1.479481, 1.867919, 1, 0, 0, 1, 1,
1.776748, -0.787411, 2.179748, 1, 0, 0, 1, 1,
1.779805, 0.8325857, 2.769107, 1, 0, 0, 1, 1,
1.787586, 0.5685729, -0.05726343, 0, 0, 0, 1, 1,
1.795265, -0.5498408, 2.137315, 0, 0, 0, 1, 1,
1.800542, -1.510539, 1.2584, 0, 0, 0, 1, 1,
1.804925, 0.06861498, -0.0136762, 0, 0, 0, 1, 1,
1.811486, -0.1818649, 2.55428, 0, 0, 0, 1, 1,
1.821754, 1.133245, 1.796473, 0, 0, 0, 1, 1,
1.824003, 0.6327439, 0.7806631, 0, 0, 0, 1, 1,
1.826385, -0.2915823, 2.382523, 1, 1, 1, 1, 1,
1.829733, 0.6191764, 0.567162, 1, 1, 1, 1, 1,
1.84404, -0.2900655, 1.549992, 1, 1, 1, 1, 1,
1.85425, -0.2158145, 1.678725, 1, 1, 1, 1, 1,
1.867959, -0.5855088, 0.9904744, 1, 1, 1, 1, 1,
1.898265, 1.430707, 0.9048332, 1, 1, 1, 1, 1,
1.900234, 1.293835, -0.4361418, 1, 1, 1, 1, 1,
1.906897, 0.7547875, 0.1751661, 1, 1, 1, 1, 1,
1.919014, 1.021136, 2.2149, 1, 1, 1, 1, 1,
1.936404, 0.2027721, 1.022027, 1, 1, 1, 1, 1,
1.957001, -0.1662669, 1.262033, 1, 1, 1, 1, 1,
1.975459, -0.1414795, 2.257505, 1, 1, 1, 1, 1,
1.977727, -0.8995405, 1.986173, 1, 1, 1, 1, 1,
1.99971, -1.640458, 1.725565, 1, 1, 1, 1, 1,
2.013199, -2.527466, 1.591523, 1, 1, 1, 1, 1,
2.015614, 0.3417696, 1.80478, 0, 0, 1, 1, 1,
2.020723, 0.2238021, 0.8093185, 1, 0, 0, 1, 1,
2.094187, 0.2805662, 0.7574053, 1, 0, 0, 1, 1,
2.118122, -0.8809246, -0.06845476, 1, 0, 0, 1, 1,
2.147933, 0.5333245, 0.09460214, 1, 0, 0, 1, 1,
2.152043, -1.889678, 3.39235, 1, 0, 0, 1, 1,
2.170634, -1.241398, 1.398567, 0, 0, 0, 1, 1,
2.173947, -0.9110746, 1.805023, 0, 0, 0, 1, 1,
2.306251, -0.3661142, 3.147699, 0, 0, 0, 1, 1,
2.309238, -0.3177972, 2.801506, 0, 0, 0, 1, 1,
2.361977, -1.395761, 2.207959, 0, 0, 0, 1, 1,
2.36251, -0.03297669, 2.701047, 0, 0, 0, 1, 1,
2.420932, -0.392664, 1.496468, 0, 0, 0, 1, 1,
2.431937, -0.7529523, 2.441755, 1, 1, 1, 1, 1,
2.511532, 0.1302344, 1.743648, 1, 1, 1, 1, 1,
2.553648, 0.6478456, 1.878872, 1, 1, 1, 1, 1,
2.558969, -0.4341204, 2.989998, 1, 1, 1, 1, 1,
2.659482, -0.6867204, 2.686418, 1, 1, 1, 1, 1,
2.707553, -0.6586379, 1.519709, 1, 1, 1, 1, 1,
2.831562, -0.4500395, 1.820905, 1, 1, 1, 1, 1
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
var radius = 9.389431;
var distance = 32.97998;
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
mvMatrix.translate( 0.01024592, -0.2410545, -0.05370355 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.97998);
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
