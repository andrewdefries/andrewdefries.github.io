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
-2.796962, -1.774456, -2.984973, 1, 0, 0, 1,
-2.713036, -2.138663, -2.964408, 1, 0.007843138, 0, 1,
-2.68672, -0.6515888, -1.198247, 1, 0.01176471, 0, 1,
-2.603713, -2.407352, -2.861274, 1, 0.01960784, 0, 1,
-2.490112, -0.9079172, -1.822905, 1, 0.02352941, 0, 1,
-2.429371, 0.326473, -2.489879, 1, 0.03137255, 0, 1,
-2.375773, 0.2757039, 0.08356261, 1, 0.03529412, 0, 1,
-2.254956, 0.9399593, -3.035586, 1, 0.04313726, 0, 1,
-2.242902, 0.2704845, -3.159226, 1, 0.04705882, 0, 1,
-2.216133, -0.2934227, -1.581677, 1, 0.05490196, 0, 1,
-2.196014, -1.276892, -3.26687, 1, 0.05882353, 0, 1,
-2.171248, 0.01474044, -2.424381, 1, 0.06666667, 0, 1,
-2.166313, 1.107203, -1.178216, 1, 0.07058824, 0, 1,
-2.140976, -0.3746018, -0.9844108, 1, 0.07843138, 0, 1,
-2.140911, -0.4411621, -2.166893, 1, 0.08235294, 0, 1,
-2.061689, -0.08056482, -0.9705505, 1, 0.09019608, 0, 1,
-2.059942, -0.3827745, -0.5670195, 1, 0.09411765, 0, 1,
-2.034269, 0.9224024, -1.470184, 1, 0.1019608, 0, 1,
-2.020651, 0.547755, -1.02206, 1, 0.1098039, 0, 1,
-1.983962, -1.349666, -1.319103, 1, 0.1137255, 0, 1,
-1.972999, -0.2261501, -0.2287587, 1, 0.1215686, 0, 1,
-1.962629, 0.874357, -2.307645, 1, 0.1254902, 0, 1,
-1.960995, -1.487386, -2.164204, 1, 0.1333333, 0, 1,
-1.957169, 0.808649, -1.836635, 1, 0.1372549, 0, 1,
-1.916728, -0.8069004, -2.28214, 1, 0.145098, 0, 1,
-1.897661, -1.536307, -2.92178, 1, 0.1490196, 0, 1,
-1.878295, 2.679219, -0.9065509, 1, 0.1568628, 0, 1,
-1.875314, -0.422278, -2.928628, 1, 0.1607843, 0, 1,
-1.869673, 1.869044, -0.6993508, 1, 0.1686275, 0, 1,
-1.825772, -0.4960391, -1.643124, 1, 0.172549, 0, 1,
-1.809071, 1.358994, 0.5604798, 1, 0.1803922, 0, 1,
-1.80714, -1.802704, -3.477488, 1, 0.1843137, 0, 1,
-1.800549, -0.6511101, -1.855626, 1, 0.1921569, 0, 1,
-1.79999, 0.334231, -1.509177, 1, 0.1960784, 0, 1,
-1.794511, -1.771528, -3.084633, 1, 0.2039216, 0, 1,
-1.786258, -1.131101, -3.444676, 1, 0.2117647, 0, 1,
-1.784311, -0.703808, -2.099605, 1, 0.2156863, 0, 1,
-1.770351, -0.1217223, -0.0844193, 1, 0.2235294, 0, 1,
-1.766235, 1.315731, -0.1463429, 1, 0.227451, 0, 1,
-1.755685, 0.4709538, 0.1367478, 1, 0.2352941, 0, 1,
-1.745009, -0.4806183, -1.363378, 1, 0.2392157, 0, 1,
-1.731108, 1.831676, -0.439763, 1, 0.2470588, 0, 1,
-1.716844, -0.2951532, -0.02518672, 1, 0.2509804, 0, 1,
-1.700096, 1.131612, -1.116836, 1, 0.2588235, 0, 1,
-1.687035, -0.8639691, 0.9217361, 1, 0.2627451, 0, 1,
-1.68124, -0.3267834, -0.9213043, 1, 0.2705882, 0, 1,
-1.666753, -0.6838182, -1.951404, 1, 0.2745098, 0, 1,
-1.666049, 0.7984416, 0.4507804, 1, 0.282353, 0, 1,
-1.661011, 0.6301296, -1.022251, 1, 0.2862745, 0, 1,
-1.659211, -0.1998037, -0.3774894, 1, 0.2941177, 0, 1,
-1.655637, -0.9449552, -0.7060268, 1, 0.3019608, 0, 1,
-1.643344, 0.1726834, -2.507439, 1, 0.3058824, 0, 1,
-1.642452, 0.7007605, -0.9611702, 1, 0.3137255, 0, 1,
-1.641585, 0.807799, -0.3192542, 1, 0.3176471, 0, 1,
-1.623463, 0.7567735, -0.5799662, 1, 0.3254902, 0, 1,
-1.610938, 1.567475, -1.806925, 1, 0.3294118, 0, 1,
-1.598561, 1.34085, -0.2563201, 1, 0.3372549, 0, 1,
-1.589357, -0.7102671, -3.549003, 1, 0.3411765, 0, 1,
-1.589331, 1.129303, -0.5601367, 1, 0.3490196, 0, 1,
-1.582299, -0.08602029, -3.861645, 1, 0.3529412, 0, 1,
-1.572281, -0.6020902, -2.091805, 1, 0.3607843, 0, 1,
-1.570409, 0.08779943, -2.033154, 1, 0.3647059, 0, 1,
-1.563019, -0.1387028, -2.616503, 1, 0.372549, 0, 1,
-1.560097, 1.204911, 0.3178608, 1, 0.3764706, 0, 1,
-1.550904, 1.156256, -0.6491796, 1, 0.3843137, 0, 1,
-1.547398, -0.954356, -3.222691, 1, 0.3882353, 0, 1,
-1.54046, -1.128115, -3.586822, 1, 0.3960784, 0, 1,
-1.530388, -1.415676, -1.973929, 1, 0.4039216, 0, 1,
-1.513475, -0.8248886, -3.508031, 1, 0.4078431, 0, 1,
-1.490546, -0.351799, -0.9212027, 1, 0.4156863, 0, 1,
-1.48215, -0.7535145, -1.947134, 1, 0.4196078, 0, 1,
-1.481409, -1.783411, -1.624366, 1, 0.427451, 0, 1,
-1.473808, -0.0352097, -0.4720263, 1, 0.4313726, 0, 1,
-1.468891, -0.02474592, -3.001827, 1, 0.4392157, 0, 1,
-1.463394, -0.6300873, -0.2814708, 1, 0.4431373, 0, 1,
-1.458255, -1.491445, -2.229753, 1, 0.4509804, 0, 1,
-1.454592, 0.6406378, -0.2267508, 1, 0.454902, 0, 1,
-1.448328, 0.5850771, -2.548491, 1, 0.4627451, 0, 1,
-1.448051, 0.447211, -2.53373, 1, 0.4666667, 0, 1,
-1.429874, -0.3181834, -0.38161, 1, 0.4745098, 0, 1,
-1.429675, -1.656813, -0.6465704, 1, 0.4784314, 0, 1,
-1.418387, 0.8828852, 0.9957415, 1, 0.4862745, 0, 1,
-1.417416, -0.8682878, -1.073702, 1, 0.4901961, 0, 1,
-1.41488, 0.1409695, -2.333204, 1, 0.4980392, 0, 1,
-1.406538, -1.913525, -1.879797, 1, 0.5058824, 0, 1,
-1.404701, -1.187774, -0.782122, 1, 0.509804, 0, 1,
-1.400354, -0.8572019, -1.025222, 1, 0.5176471, 0, 1,
-1.398484, -0.2784764, -0.946797, 1, 0.5215687, 0, 1,
-1.395536, 0.7931303, -1.654824, 1, 0.5294118, 0, 1,
-1.361577, -0.1608423, 0.3743728, 1, 0.5333334, 0, 1,
-1.356328, -1.708899, -3.653, 1, 0.5411765, 0, 1,
-1.354989, -0.3600509, -1.728526, 1, 0.5450981, 0, 1,
-1.348863, -0.5193757, -2.374571, 1, 0.5529412, 0, 1,
-1.334062, 0.3098415, -1.118173, 1, 0.5568628, 0, 1,
-1.32874, -0.9746498, -0.8975177, 1, 0.5647059, 0, 1,
-1.32163, -1.239777, -3.428054, 1, 0.5686275, 0, 1,
-1.31992, 0.572908, 0.2141498, 1, 0.5764706, 0, 1,
-1.316224, -1.368911, -3.477339, 1, 0.5803922, 0, 1,
-1.314337, 0.2052648, -2.284807, 1, 0.5882353, 0, 1,
-1.303266, -0.4644383, -3.02255, 1, 0.5921569, 0, 1,
-1.280448, -1.901512, -2.94949, 1, 0.6, 0, 1,
-1.274206, 1.156263, 0.4472815, 1, 0.6078432, 0, 1,
-1.273566, 1.173524, -0.1042065, 1, 0.6117647, 0, 1,
-1.263225, -1.555305, -4.146717, 1, 0.6196079, 0, 1,
-1.260671, 0.0004253201, -1.508973, 1, 0.6235294, 0, 1,
-1.25834, -1.475384, -2.377327, 1, 0.6313726, 0, 1,
-1.249302, 0.9460046, 0.7764161, 1, 0.6352941, 0, 1,
-1.24392, -0.1224853, -1.615327, 1, 0.6431373, 0, 1,
-1.230375, -0.2184626, -1.689097, 1, 0.6470588, 0, 1,
-1.217496, 0.9339858, 1.055994, 1, 0.654902, 0, 1,
-1.217365, -0.9979309, -2.802689, 1, 0.6588235, 0, 1,
-1.201497, 0.4035855, -1.295398, 1, 0.6666667, 0, 1,
-1.199472, 0.02316124, -3.032986, 1, 0.6705883, 0, 1,
-1.198474, -0.4294944, -0.5312117, 1, 0.6784314, 0, 1,
-1.19501, -1.137761, -3.082995, 1, 0.682353, 0, 1,
-1.19445, -0.3199527, -1.087936, 1, 0.6901961, 0, 1,
-1.194036, -0.9515042, -2.134041, 1, 0.6941177, 0, 1,
-1.188423, 0.956433, -1.335354, 1, 0.7019608, 0, 1,
-1.18028, 0.4827425, -0.8782899, 1, 0.7098039, 0, 1,
-1.166236, -0.9196345, -1.367949, 1, 0.7137255, 0, 1,
-1.165045, 1.304776, -1.349016, 1, 0.7215686, 0, 1,
-1.161138, -1.218027, -3.619184, 1, 0.7254902, 0, 1,
-1.151394, -1.466839, -2.876795, 1, 0.7333333, 0, 1,
-1.15008, -0.07837955, -0.591911, 1, 0.7372549, 0, 1,
-1.144619, 1.695676, -1.397045, 1, 0.7450981, 0, 1,
-1.142922, 0.03973452, -2.502198, 1, 0.7490196, 0, 1,
-1.13974, -1.426366, -2.987894, 1, 0.7568628, 0, 1,
-1.138673, 0.3784436, -1.374098, 1, 0.7607843, 0, 1,
-1.134884, -0.5746577, -1.169451, 1, 0.7686275, 0, 1,
-1.124536, -2.355259, -2.69888, 1, 0.772549, 0, 1,
-1.120352, -1.648763, -4.379778, 1, 0.7803922, 0, 1,
-1.118679, -0.4861133, -1.831747, 1, 0.7843137, 0, 1,
-1.115464, -0.5225035, -0.3000129, 1, 0.7921569, 0, 1,
-1.114961, -0.3419865, -2.550119, 1, 0.7960784, 0, 1,
-1.113354, -1.378082, -1.342279, 1, 0.8039216, 0, 1,
-1.109174, 2.299781, -1.035195, 1, 0.8117647, 0, 1,
-1.104375, -0.154785, -2.266805, 1, 0.8156863, 0, 1,
-1.102911, 1.114354, -1.581379, 1, 0.8235294, 0, 1,
-1.099031, -1.637388, -2.423534, 1, 0.827451, 0, 1,
-1.098629, 1.045989, -0.5474143, 1, 0.8352941, 0, 1,
-1.091207, -0.8858171, -1.092623, 1, 0.8392157, 0, 1,
-1.083807, -3.148839, -3.642855, 1, 0.8470588, 0, 1,
-1.080871, -0.7377975, -1.991578, 1, 0.8509804, 0, 1,
-1.076028, -0.0126533, 1.014001, 1, 0.8588235, 0, 1,
-1.07566, -0.6460392, -3.974872, 1, 0.8627451, 0, 1,
-1.069563, 1.728936, -0.9296017, 1, 0.8705882, 0, 1,
-1.061787, 1.275589, 0.127078, 1, 0.8745098, 0, 1,
-1.060682, 0.5987262, 0.3188105, 1, 0.8823529, 0, 1,
-1.057177, -1.564741, -3.722121, 1, 0.8862745, 0, 1,
-1.057026, -0.4693028, -3.256875, 1, 0.8941177, 0, 1,
-1.054487, -1.321915, -2.176462, 1, 0.8980392, 0, 1,
-1.047389, -2.076012, -1.221376, 1, 0.9058824, 0, 1,
-1.038963, 0.9747932, -0.02250312, 1, 0.9137255, 0, 1,
-1.037397, -0.6464489, -2.819205, 1, 0.9176471, 0, 1,
-1.02411, 0.582218, -0.9300672, 1, 0.9254902, 0, 1,
-1.012201, 0.8511428, 0.8525234, 1, 0.9294118, 0, 1,
-1.011213, -1.379814, -2.011968, 1, 0.9372549, 0, 1,
-1.009248, 0.4923391, -2.533652, 1, 0.9411765, 0, 1,
-1.005285, 0.8202263, -0.3134229, 1, 0.9490196, 0, 1,
-1.005158, -0.04047635, -2.050938, 1, 0.9529412, 0, 1,
-1.00106, -0.1265126, -2.551841, 1, 0.9607843, 0, 1,
-0.9945081, -0.616526, -3.007255, 1, 0.9647059, 0, 1,
-0.9932003, 0.2812117, 0.03625287, 1, 0.972549, 0, 1,
-0.9878512, -0.4741578, -3.333969, 1, 0.9764706, 0, 1,
-0.9875431, 0.6450849, 0.6707914, 1, 0.9843137, 0, 1,
-0.9806586, 0.2795361, -2.16102, 1, 0.9882353, 0, 1,
-0.97852, 0.03310416, -3.45573, 1, 0.9960784, 0, 1,
-0.9771487, -0.08920411, -1.415572, 0.9960784, 1, 0, 1,
-0.9741022, 0.5581776, -1.135109, 0.9921569, 1, 0, 1,
-0.9663721, 0.1183441, -2.172976, 0.9843137, 1, 0, 1,
-0.9622572, -1.494952, -2.526538, 0.9803922, 1, 0, 1,
-0.9621165, -0.6512601, -3.451693, 0.972549, 1, 0, 1,
-0.9582181, -0.7700449, -3.108443, 0.9686275, 1, 0, 1,
-0.9550926, -0.1575405, -1.346375, 0.9607843, 1, 0, 1,
-0.9538429, -0.3624609, -3.350207, 0.9568627, 1, 0, 1,
-0.9536469, -2.375919, -2.124832, 0.9490196, 1, 0, 1,
-0.9508475, -2.149387, -3.697749, 0.945098, 1, 0, 1,
-0.9507972, 1.247547, -0.6506116, 0.9372549, 1, 0, 1,
-0.9476057, -0.4841325, -1.597201, 0.9333333, 1, 0, 1,
-0.9417865, 0.1121254, -1.922571, 0.9254902, 1, 0, 1,
-0.9390665, 0.2103694, -1.720294, 0.9215686, 1, 0, 1,
-0.9339692, -0.1801399, -1.085704, 0.9137255, 1, 0, 1,
-0.9279687, 0.4930473, -0.6038731, 0.9098039, 1, 0, 1,
-0.9265009, 0.446985, -2.52514, 0.9019608, 1, 0, 1,
-0.9173214, 0.2089396, -0.5856537, 0.8941177, 1, 0, 1,
-0.9117578, 0.328172, -1.921521, 0.8901961, 1, 0, 1,
-0.9110383, 0.05920899, -0.007318812, 0.8823529, 1, 0, 1,
-0.8993607, -1.784907, -3.636748, 0.8784314, 1, 0, 1,
-0.8910064, 0.1399781, -0.0801037, 0.8705882, 1, 0, 1,
-0.8899423, -0.241426, -2.559093, 0.8666667, 1, 0, 1,
-0.8840374, -0.1882684, -1.262158, 0.8588235, 1, 0, 1,
-0.8834005, 0.1218662, -1.090291, 0.854902, 1, 0, 1,
-0.8732064, 0.991467, -1.57926, 0.8470588, 1, 0, 1,
-0.8661796, 0.2301128, -1.684048, 0.8431373, 1, 0, 1,
-0.8573436, -0.6689475, -2.118924, 0.8352941, 1, 0, 1,
-0.8477134, 0.7043756, -2.177838, 0.8313726, 1, 0, 1,
-0.833993, 1.051945, -0.7249662, 0.8235294, 1, 0, 1,
-0.8326756, 1.151881, 0.6494316, 0.8196079, 1, 0, 1,
-0.8302377, 1.241237, -1.340425, 0.8117647, 1, 0, 1,
-0.8210046, 0.1500556, -0.4266571, 0.8078431, 1, 0, 1,
-0.8209327, 1.425131, -1.430428, 0.8, 1, 0, 1,
-0.8185178, 0.2018015, -1.89426, 0.7921569, 1, 0, 1,
-0.8179356, 0.1950201, -0.7241328, 0.7882353, 1, 0, 1,
-0.8175663, 0.4044176, -0.6285155, 0.7803922, 1, 0, 1,
-0.8075323, 0.3347277, 2.138343, 0.7764706, 1, 0, 1,
-0.8068604, -1.031211, -1.361576, 0.7686275, 1, 0, 1,
-0.7968605, 1.324194, -1.068609, 0.7647059, 1, 0, 1,
-0.7912509, 1.208451, -2.595882, 0.7568628, 1, 0, 1,
-0.7899518, 0.917813, -1.159004, 0.7529412, 1, 0, 1,
-0.7878088, -0.1590012, -2.229192, 0.7450981, 1, 0, 1,
-0.7865778, -1.144512, -2.126915, 0.7411765, 1, 0, 1,
-0.785069, -1.421412, -2.900729, 0.7333333, 1, 0, 1,
-0.7850427, -0.9039916, -4.113795, 0.7294118, 1, 0, 1,
-0.7799997, -0.3249816, -0.9844269, 0.7215686, 1, 0, 1,
-0.7787806, -0.5606972, -1.147864, 0.7176471, 1, 0, 1,
-0.7775161, -2.08279, -3.221591, 0.7098039, 1, 0, 1,
-0.771278, 0.1510302, -0.1956115, 0.7058824, 1, 0, 1,
-0.769236, -1.20881, -3.039918, 0.6980392, 1, 0, 1,
-0.7651345, -1.40902, -2.127476, 0.6901961, 1, 0, 1,
-0.7600822, -0.003046799, -0.8503727, 0.6862745, 1, 0, 1,
-0.7592531, 1.571879, 0.2998946, 0.6784314, 1, 0, 1,
-0.7590939, -0.3099571, -1.435563, 0.6745098, 1, 0, 1,
-0.7553756, 2.493266, 0.3134715, 0.6666667, 1, 0, 1,
-0.7420993, 0.7008513, -1.655087, 0.6627451, 1, 0, 1,
-0.7408456, 0.1111002, -2.325721, 0.654902, 1, 0, 1,
-0.7400019, 0.7356707, 0.5658377, 0.6509804, 1, 0, 1,
-0.7386874, -0.9770275, -2.521078, 0.6431373, 1, 0, 1,
-0.7366861, -0.1913369, -1.977512, 0.6392157, 1, 0, 1,
-0.7366254, -0.04953652, -1.536759, 0.6313726, 1, 0, 1,
-0.7205411, 1.143747, 1.184551, 0.627451, 1, 0, 1,
-0.7189654, -1.095591, -3.547653, 0.6196079, 1, 0, 1,
-0.7137947, -2.412081, -4.33417, 0.6156863, 1, 0, 1,
-0.7124918, 0.3128834, -1.633133, 0.6078432, 1, 0, 1,
-0.6969783, -0.6410792, -0.5831895, 0.6039216, 1, 0, 1,
-0.6944599, -0.7338153, -1.102252, 0.5960785, 1, 0, 1,
-0.6939627, -0.09432281, -1.081513, 0.5882353, 1, 0, 1,
-0.6892458, 0.4378756, -0.900512, 0.5843138, 1, 0, 1,
-0.6863611, -1.174245, -2.432072, 0.5764706, 1, 0, 1,
-0.6799179, -0.06568027, -1.388928, 0.572549, 1, 0, 1,
-0.6651627, 0.8001463, -0.09495234, 0.5647059, 1, 0, 1,
-0.6616946, 1.178065, -1.19723, 0.5607843, 1, 0, 1,
-0.659577, -0.6911799, -0.719588, 0.5529412, 1, 0, 1,
-0.6578305, 1.579014, -0.9255727, 0.5490196, 1, 0, 1,
-0.6568708, 0.1098082, -2.141357, 0.5411765, 1, 0, 1,
-0.6559813, -0.06696685, -1.981435, 0.5372549, 1, 0, 1,
-0.6432702, -0.6495427, -3.579265, 0.5294118, 1, 0, 1,
-0.6377333, 0.9869227, -0.9085488, 0.5254902, 1, 0, 1,
-0.6301815, -1.489139, -3.927246, 0.5176471, 1, 0, 1,
-0.6287396, 0.06007259, -2.479265, 0.5137255, 1, 0, 1,
-0.6279253, -0.08741061, -0.9611725, 0.5058824, 1, 0, 1,
-0.623994, -0.9023141, -2.411197, 0.5019608, 1, 0, 1,
-0.62393, 0.6856398, 1.723781, 0.4941176, 1, 0, 1,
-0.6236438, -0.6408334, -4.357754, 0.4862745, 1, 0, 1,
-0.6230091, 1.159277, -2.230437, 0.4823529, 1, 0, 1,
-0.6216249, 0.7175815, -1.414065, 0.4745098, 1, 0, 1,
-0.6209168, -0.3466843, -2.047302, 0.4705882, 1, 0, 1,
-0.619363, 0.1221004, -1.203468, 0.4627451, 1, 0, 1,
-0.619191, 0.118949, -0.6232036, 0.4588235, 1, 0, 1,
-0.6186352, 0.1052382, -2.930402, 0.4509804, 1, 0, 1,
-0.6173955, 0.3736765, -1.628569, 0.4470588, 1, 0, 1,
-0.6156728, -0.1057625, -0.8820785, 0.4392157, 1, 0, 1,
-0.6132339, -0.5703245, -2.645027, 0.4352941, 1, 0, 1,
-0.6064577, -0.9808553, -2.82247, 0.427451, 1, 0, 1,
-0.6043364, 1.077465, 0.5155376, 0.4235294, 1, 0, 1,
-0.6037077, -1.872542, -2.997189, 0.4156863, 1, 0, 1,
-0.603273, -0.9626241, -3.962905, 0.4117647, 1, 0, 1,
-0.5999888, -0.01215646, -1.857508, 0.4039216, 1, 0, 1,
-0.5985824, -0.4263344, -0.8518116, 0.3960784, 1, 0, 1,
-0.590438, -2.305288, -2.959896, 0.3921569, 1, 0, 1,
-0.5885556, 0.5478973, 0.72285, 0.3843137, 1, 0, 1,
-0.5823349, 0.3599414, -2.522211, 0.3803922, 1, 0, 1,
-0.5797506, 0.2831001, 0.3295716, 0.372549, 1, 0, 1,
-0.5690451, -0.7394094, -3.083118, 0.3686275, 1, 0, 1,
-0.5665253, -0.9730102, -1.279951, 0.3607843, 1, 0, 1,
-0.5639487, 1.907319, -1.408354, 0.3568628, 1, 0, 1,
-0.5610558, -0.8459897, -4.876599, 0.3490196, 1, 0, 1,
-0.557757, 0.7079536, -2.317088, 0.345098, 1, 0, 1,
-0.557595, -0.6026136, -3.47699, 0.3372549, 1, 0, 1,
-0.5565925, 0.1932563, -0.1439141, 0.3333333, 1, 0, 1,
-0.5456404, -0.9192544, -5.455918, 0.3254902, 1, 0, 1,
-0.5415129, -0.1412897, -2.552566, 0.3215686, 1, 0, 1,
-0.5205227, -2.76826, -3.614599, 0.3137255, 1, 0, 1,
-0.5192878, 0.3986361, 1.141006, 0.3098039, 1, 0, 1,
-0.5104619, -0.2353691, -2.054847, 0.3019608, 1, 0, 1,
-0.5078294, -0.597385, -1.551958, 0.2941177, 1, 0, 1,
-0.5073282, -0.9931161, -2.935079, 0.2901961, 1, 0, 1,
-0.5045589, 1.385435, -0.3803363, 0.282353, 1, 0, 1,
-0.497823, -0.005739839, -1.283782, 0.2784314, 1, 0, 1,
-0.4939651, -1.1131, -1.408461, 0.2705882, 1, 0, 1,
-0.4884416, -0.7459874, -1.72773, 0.2666667, 1, 0, 1,
-0.4880404, 2.293974, 1.253583, 0.2588235, 1, 0, 1,
-0.4866097, 1.673041, 0.3883068, 0.254902, 1, 0, 1,
-0.4747397, -1.129374, -3.286577, 0.2470588, 1, 0, 1,
-0.4740167, -0.4507619, -2.353656, 0.2431373, 1, 0, 1,
-0.4707526, -0.7862881, -2.274742, 0.2352941, 1, 0, 1,
-0.4693984, 1.950006, -1.434405, 0.2313726, 1, 0, 1,
-0.4646587, -1.634761, -1.496705, 0.2235294, 1, 0, 1,
-0.4618452, -0.5004175, -3.366863, 0.2196078, 1, 0, 1,
-0.4602249, -0.5817322, -2.234288, 0.2117647, 1, 0, 1,
-0.4567378, 0.5386593, -2.073604, 0.2078431, 1, 0, 1,
-0.4559067, 3.035327, -1.521841, 0.2, 1, 0, 1,
-0.4542566, -0.3294339, -0.6742778, 0.1921569, 1, 0, 1,
-0.4534367, 0.7023821, 0.5557739, 0.1882353, 1, 0, 1,
-0.4481134, -1.439861, -3.517675, 0.1803922, 1, 0, 1,
-0.4422674, -0.2161811, -2.848435, 0.1764706, 1, 0, 1,
-0.4367406, 1.377629, -0.708749, 0.1686275, 1, 0, 1,
-0.425598, -0.003433647, -0.8414717, 0.1647059, 1, 0, 1,
-0.4241879, 0.8025368, -0.7168124, 0.1568628, 1, 0, 1,
-0.4212311, 0.1739875, -1.893868, 0.1529412, 1, 0, 1,
-0.4196043, -1.008163, -3.674619, 0.145098, 1, 0, 1,
-0.4166856, 0.4184995, -1.104609, 0.1411765, 1, 0, 1,
-0.4153523, -0.5739377, -1.637108, 0.1333333, 1, 0, 1,
-0.415323, 0.797987, -0.4561221, 0.1294118, 1, 0, 1,
-0.4126202, -0.1236204, -2.209358, 0.1215686, 1, 0, 1,
-0.4125085, -1.268439, -4.37688, 0.1176471, 1, 0, 1,
-0.4114298, 1.23093, -0.2573245, 0.1098039, 1, 0, 1,
-0.4114078, -1.119576, -3.656563, 0.1058824, 1, 0, 1,
-0.4095547, -1.248674, -2.596807, 0.09803922, 1, 0, 1,
-0.4072164, -1.399177, -1.934366, 0.09019608, 1, 0, 1,
-0.4063096, -0.6825203, -2.672891, 0.08627451, 1, 0, 1,
-0.4046376, 0.9877354, -0.4199127, 0.07843138, 1, 0, 1,
-0.3980476, -0.2205149, -2.172257, 0.07450981, 1, 0, 1,
-0.3969612, 0.247554, -0.6020263, 0.06666667, 1, 0, 1,
-0.3933403, -0.9651743, -2.411117, 0.0627451, 1, 0, 1,
-0.3927546, 0.1905904, -0.353349, 0.05490196, 1, 0, 1,
-0.3903554, -0.103532, -3.331172, 0.05098039, 1, 0, 1,
-0.3839467, -0.6592579, -2.950371, 0.04313726, 1, 0, 1,
-0.3838567, -1.017915, -1.665817, 0.03921569, 1, 0, 1,
-0.3822296, -0.9608585, -4.002133, 0.03137255, 1, 0, 1,
-0.3816948, 0.9096359, -1.731208, 0.02745098, 1, 0, 1,
-0.3816239, 0.9724281, -0.7701477, 0.01960784, 1, 0, 1,
-0.3793348, 0.2656256, -1.584601, 0.01568628, 1, 0, 1,
-0.377586, -0.91779, -1.35168, 0.007843138, 1, 0, 1,
-0.3763023, -0.4962743, -1.668214, 0.003921569, 1, 0, 1,
-0.3728563, -0.5783113, -2.24221, 0, 1, 0.003921569, 1,
-0.3708182, -0.2337372, -1.589155, 0, 1, 0.01176471, 1,
-0.3669771, -0.1456732, -3.102859, 0, 1, 0.01568628, 1,
-0.3640999, -1.013605, -2.218566, 0, 1, 0.02352941, 1,
-0.3615543, 2.063013, -1.512733, 0, 1, 0.02745098, 1,
-0.3610657, 0.8652912, -0.1567496, 0, 1, 0.03529412, 1,
-0.3606327, 1.332294, -1.455727, 0, 1, 0.03921569, 1,
-0.3599276, -0.1801204, -1.652453, 0, 1, 0.04705882, 1,
-0.3560345, -0.1128775, -1.549058, 0, 1, 0.05098039, 1,
-0.3515015, -2.042946, -3.479991, 0, 1, 0.05882353, 1,
-0.3511499, -0.8968313, -4.367784, 0, 1, 0.0627451, 1,
-0.3506358, -0.6712561, -2.736865, 0, 1, 0.07058824, 1,
-0.3483624, -2.517487, -1.942759, 0, 1, 0.07450981, 1,
-0.3459083, 1.379005, 0.7286807, 0, 1, 0.08235294, 1,
-0.3450651, 0.1093306, -1.147965, 0, 1, 0.08627451, 1,
-0.3351234, -2.359632, -3.398326, 0, 1, 0.09411765, 1,
-0.3311214, 1.706252, -1.396342, 0, 1, 0.1019608, 1,
-0.3278299, 0.015366, -2.085813, 0, 1, 0.1058824, 1,
-0.324842, -0.84449, -4.257965, 0, 1, 0.1137255, 1,
-0.3241195, -0.5918987, -1.776485, 0, 1, 0.1176471, 1,
-0.3184217, 0.7488415, -0.8291838, 0, 1, 0.1254902, 1,
-0.3172193, 0.4858409, -0.4323186, 0, 1, 0.1294118, 1,
-0.3119147, -1.223816, -2.362219, 0, 1, 0.1372549, 1,
-0.3104308, -1.201438, -0.8242305, 0, 1, 0.1411765, 1,
-0.3101144, 0.599174, 0.0306883, 0, 1, 0.1490196, 1,
-0.3064626, 1.27772, -0.05583483, 0, 1, 0.1529412, 1,
-0.3052754, 0.9192593, -0.4045361, 0, 1, 0.1607843, 1,
-0.3018872, 0.03296824, -1.464401, 0, 1, 0.1647059, 1,
-0.3004282, -0.4210295, -2.321808, 0, 1, 0.172549, 1,
-0.2930323, 1.557309, -1.646338, 0, 1, 0.1764706, 1,
-0.2917902, 0.09071229, -2.706576, 0, 1, 0.1843137, 1,
-0.2899375, -0.3742211, -2.486567, 0, 1, 0.1882353, 1,
-0.2868406, -2.027771, -1.530907, 0, 1, 0.1960784, 1,
-0.2837547, 0.2542353, -0.6338578, 0, 1, 0.2039216, 1,
-0.2829392, -0.7288637, -2.883157, 0, 1, 0.2078431, 1,
-0.2769398, 0.1098881, -1.742935, 0, 1, 0.2156863, 1,
-0.2724572, 0.9424288, 1.342751, 0, 1, 0.2196078, 1,
-0.271942, -0.8285855, -2.654472, 0, 1, 0.227451, 1,
-0.2689328, 0.3494785, -0.6641333, 0, 1, 0.2313726, 1,
-0.2677051, 0.1014367, -2.736708, 0, 1, 0.2392157, 1,
-0.261729, -0.2818274, -2.562099, 0, 1, 0.2431373, 1,
-0.2616253, 0.7058186, -0.5057913, 0, 1, 0.2509804, 1,
-0.2575595, -0.3827154, -2.725212, 0, 1, 0.254902, 1,
-0.2504193, -0.2109726, -2.638834, 0, 1, 0.2627451, 1,
-0.2447546, -0.9335948, -3.747082, 0, 1, 0.2666667, 1,
-0.2422775, 0.6152743, 0.8705667, 0, 1, 0.2745098, 1,
-0.2386163, -0.1679056, -2.372914, 0, 1, 0.2784314, 1,
-0.2370862, 2.212523, -0.161436, 0, 1, 0.2862745, 1,
-0.2367807, -1.323203, -1.928594, 0, 1, 0.2901961, 1,
-0.2357593, -0.6258306, -2.233584, 0, 1, 0.2980392, 1,
-0.2312073, 0.5987234, -1.104564, 0, 1, 0.3058824, 1,
-0.2308473, 0.2454383, -0.9725662, 0, 1, 0.3098039, 1,
-0.2287231, -0.5110424, -1.797456, 0, 1, 0.3176471, 1,
-0.2269317, 0.1802631, -2.624718, 0, 1, 0.3215686, 1,
-0.2250322, -0.4014343, -1.353147, 0, 1, 0.3294118, 1,
-0.2178841, -0.3193521, -2.041605, 0, 1, 0.3333333, 1,
-0.2141264, -1.664034, -1.652867, 0, 1, 0.3411765, 1,
-0.2139128, -0.3780554, -1.496344, 0, 1, 0.345098, 1,
-0.2128121, -0.3286761, -3.11302, 0, 1, 0.3529412, 1,
-0.1941569, -1.159227, -3.695497, 0, 1, 0.3568628, 1,
-0.192946, 1.632459, -1.265869, 0, 1, 0.3647059, 1,
-0.1909582, -0.7260007, -1.995716, 0, 1, 0.3686275, 1,
-0.189282, 0.3918654, -0.7066429, 0, 1, 0.3764706, 1,
-0.1880709, -0.7370928, -1.762191, 0, 1, 0.3803922, 1,
-0.1840624, 0.8158914, -0.7999725, 0, 1, 0.3882353, 1,
-0.1825916, 2.154466, 0.02226371, 0, 1, 0.3921569, 1,
-0.1789141, -0.8762013, -0.738898, 0, 1, 0.4, 1,
-0.1717851, -0.1716728, -2.087315, 0, 1, 0.4078431, 1,
-0.167509, 0.2953317, -0.4410638, 0, 1, 0.4117647, 1,
-0.1648382, -0.7907087, -3.308591, 0, 1, 0.4196078, 1,
-0.1568143, 0.389797, -0.5773597, 0, 1, 0.4235294, 1,
-0.1513876, -1.13684, -3.293246, 0, 1, 0.4313726, 1,
-0.1505047, 1.597172, 0.5404377, 0, 1, 0.4352941, 1,
-0.1491174, 0.5121927, -0.8635008, 0, 1, 0.4431373, 1,
-0.1488786, 0.8217143, 0.2441031, 0, 1, 0.4470588, 1,
-0.1470549, 0.4794734, 0.169186, 0, 1, 0.454902, 1,
-0.1449178, 0.2442918, -0.9873532, 0, 1, 0.4588235, 1,
-0.1445841, 1.33643, 1.041705, 0, 1, 0.4666667, 1,
-0.1440067, -1.82228, -3.983046, 0, 1, 0.4705882, 1,
-0.1435949, -0.1713127, -2.326012, 0, 1, 0.4784314, 1,
-0.1429856, 1.715045, 1.39586, 0, 1, 0.4823529, 1,
-0.1333909, -0.2128605, -2.057918, 0, 1, 0.4901961, 1,
-0.1324871, -0.2087588, -2.640911, 0, 1, 0.4941176, 1,
-0.1299163, 0.217692, 1.247488, 0, 1, 0.5019608, 1,
-0.1297727, -1.549827, -2.561071, 0, 1, 0.509804, 1,
-0.1277566, 0.1841131, -0.8220626, 0, 1, 0.5137255, 1,
-0.1241356, -0.5029286, -1.51489, 0, 1, 0.5215687, 1,
-0.1207901, 0.2874829, -0.2347119, 0, 1, 0.5254902, 1,
-0.119719, 0.09022961, -1.527136, 0, 1, 0.5333334, 1,
-0.1193844, -0.5285221, -2.628382, 0, 1, 0.5372549, 1,
-0.1163012, -0.2078892, -3.941816, 0, 1, 0.5450981, 1,
-0.1146371, 0.484311, 0.3506287, 0, 1, 0.5490196, 1,
-0.1139744, 0.2277963, -0.5479743, 0, 1, 0.5568628, 1,
-0.1039056, 0.7647107, -0.7928699, 0, 1, 0.5607843, 1,
-0.1026861, 0.3526049, -0.4431279, 0, 1, 0.5686275, 1,
-0.1022896, 0.8927703, -0.6648104, 0, 1, 0.572549, 1,
-0.1004251, 0.5137988, -0.2950928, 0, 1, 0.5803922, 1,
-0.09969968, -0.2801759, -2.462628, 0, 1, 0.5843138, 1,
-0.09901154, -1.186901, -0.9529474, 0, 1, 0.5921569, 1,
-0.09642152, -0.005222651, -2.27731, 0, 1, 0.5960785, 1,
-0.09390328, -1.342362, -2.812597, 0, 1, 0.6039216, 1,
-0.09188446, 0.4977101, 0.8151054, 0, 1, 0.6117647, 1,
-0.0906741, 1.134559, -0.7227002, 0, 1, 0.6156863, 1,
-0.08859696, -0.4141245, -3.021845, 0, 1, 0.6235294, 1,
-0.08828837, 0.549234, 0.4090826, 0, 1, 0.627451, 1,
-0.08266172, -0.302478, -3.580862, 0, 1, 0.6352941, 1,
-0.07874956, -0.03389475, 0.2695864, 0, 1, 0.6392157, 1,
-0.07268212, 0.6474841, -0.2237373, 0, 1, 0.6470588, 1,
-0.0704945, 1.638081, -1.423844, 0, 1, 0.6509804, 1,
-0.0682829, 0.4301771, -1.002437, 0, 1, 0.6588235, 1,
-0.06732623, 1.471153, -0.6753903, 0, 1, 0.6627451, 1,
-0.06728628, -0.4001419, -2.283162, 0, 1, 0.6705883, 1,
-0.06692698, 1.086745, 0.6952952, 0, 1, 0.6745098, 1,
-0.0660923, -0.2944902, -3.771905, 0, 1, 0.682353, 1,
-0.06241085, 0.3645441, -1.555865, 0, 1, 0.6862745, 1,
-0.05637131, -0.3462485, -3.070841, 0, 1, 0.6941177, 1,
-0.05482072, -0.5093576, -1.620554, 0, 1, 0.7019608, 1,
-0.05352909, 0.2847727, 0.1200751, 0, 1, 0.7058824, 1,
-0.04740484, -0.5768786, -2.178001, 0, 1, 0.7137255, 1,
-0.04684471, -1.056653, -1.799324, 0, 1, 0.7176471, 1,
-0.04674924, 0.6450921, -0.4340168, 0, 1, 0.7254902, 1,
-0.04372822, -1.400254, -2.719179, 0, 1, 0.7294118, 1,
-0.0359256, 0.7525771, -0.311221, 0, 1, 0.7372549, 1,
-0.03314495, 0.3393661, -0.4268725, 0, 1, 0.7411765, 1,
-0.03208842, 0.1981432, 0.4459232, 0, 1, 0.7490196, 1,
-0.03165692, 0.2325622, -0.8905806, 0, 1, 0.7529412, 1,
-0.03134754, -0.5812922, -4.061066, 0, 1, 0.7607843, 1,
-0.03096294, 0.2461506, 1.790932, 0, 1, 0.7647059, 1,
-0.02945632, 0.3174682, -0.1500514, 0, 1, 0.772549, 1,
-0.02825017, -0.9445226, -3.752718, 0, 1, 0.7764706, 1,
-0.02644661, -0.7346971, -3.125302, 0, 1, 0.7843137, 1,
-0.02555927, -0.5609601, -3.382526, 0, 1, 0.7882353, 1,
-0.0241161, 0.08991047, -0.9336058, 0, 1, 0.7960784, 1,
-0.02288339, -0.3301452, -2.379071, 0, 1, 0.8039216, 1,
-0.02144026, 0.7516668, -0.7775164, 0, 1, 0.8078431, 1,
-0.01863757, -0.3245001, -2.271103, 0, 1, 0.8156863, 1,
-0.01739682, -1.65953, -2.29822, 0, 1, 0.8196079, 1,
-0.0156125, 0.1909239, -0.383952, 0, 1, 0.827451, 1,
-0.01496397, -0.6509191, -1.89628, 0, 1, 0.8313726, 1,
-0.01403086, 0.4739606, -0.1463173, 0, 1, 0.8392157, 1,
-0.01356209, -0.2493334, -4.076215, 0, 1, 0.8431373, 1,
-0.01270563, -0.496057, -0.9409571, 0, 1, 0.8509804, 1,
-0.01258389, -0.2887329, -3.005319, 0, 1, 0.854902, 1,
-0.009273387, 0.4968405, 0.5412492, 0, 1, 0.8627451, 1,
-0.008135595, -1.068971, -2.079256, 0, 1, 0.8666667, 1,
-0.007965453, 0.1670125, -0.8190737, 0, 1, 0.8745098, 1,
-0.007902801, -0.6095114, -3.519666, 0, 1, 0.8784314, 1,
-0.007663797, 1.547303, -0.7875487, 0, 1, 0.8862745, 1,
-0.001736869, 0.1186176, -1.230837, 0, 1, 0.8901961, 1,
0.002451241, 1.537931, -0.2131208, 0, 1, 0.8980392, 1,
0.01039591, -0.0859312, 3.581242, 0, 1, 0.9058824, 1,
0.01237534, 0.138027, 1.271795, 0, 1, 0.9098039, 1,
0.01360948, -1.999967, 3.159606, 0, 1, 0.9176471, 1,
0.02189223, 0.8821991, -0.3464131, 0, 1, 0.9215686, 1,
0.02272639, -1.019758, 4.569599, 0, 1, 0.9294118, 1,
0.02378711, 1.428327, -0.4815437, 0, 1, 0.9333333, 1,
0.02397693, 2.004002, 0.3520738, 0, 1, 0.9411765, 1,
0.02438166, -0.4080116, 2.539549, 0, 1, 0.945098, 1,
0.02533637, -1.151849, 1.999465, 0, 1, 0.9529412, 1,
0.03652255, 1.463095, 1.857064, 0, 1, 0.9568627, 1,
0.04162649, -0.2728342, 2.850122, 0, 1, 0.9647059, 1,
0.04426866, -0.8593016, 3.449194, 0, 1, 0.9686275, 1,
0.04653703, -0.3956577, 3.263753, 0, 1, 0.9764706, 1,
0.04732658, -0.6620834, 4.343352, 0, 1, 0.9803922, 1,
0.05000437, 0.5980326, 0.4776748, 0, 1, 0.9882353, 1,
0.05026126, -0.8897091, 4.486687, 0, 1, 0.9921569, 1,
0.05090864, 0.6811441, -0.5070997, 0, 1, 1, 1,
0.05258704, 0.81577, -0.5986863, 0, 0.9921569, 1, 1,
0.06061112, 0.499536, 0.9956911, 0, 0.9882353, 1, 1,
0.06194964, -1.234419, 3.169761, 0, 0.9803922, 1, 1,
0.06396239, -1.141564, 3.648011, 0, 0.9764706, 1, 1,
0.06832937, 0.6340597, 2.701272, 0, 0.9686275, 1, 1,
0.06859175, -0.1483837, 1.756877, 0, 0.9647059, 1, 1,
0.06933004, -1.68383, 2.894587, 0, 0.9568627, 1, 1,
0.07386499, -0.5090935, 2.628603, 0, 0.9529412, 1, 1,
0.07636642, 0.1237242, -1.548703, 0, 0.945098, 1, 1,
0.07802533, 2.656211, -0.2390965, 0, 0.9411765, 1, 1,
0.07828553, 0.06390939, 2.070572, 0, 0.9333333, 1, 1,
0.07843703, -0.8982231, 1.291741, 0, 0.9294118, 1, 1,
0.08053669, -0.5883841, 3.708056, 0, 0.9215686, 1, 1,
0.08224585, -0.8020927, 2.544717, 0, 0.9176471, 1, 1,
0.08348988, 0.9286242, -0.8845052, 0, 0.9098039, 1, 1,
0.09525066, 0.7839965, 2.144674, 0, 0.9058824, 1, 1,
0.09670619, -0.5922663, 1.494879, 0, 0.8980392, 1, 1,
0.09834845, 0.9519224, -0.03818902, 0, 0.8901961, 1, 1,
0.09925843, -0.5790985, 3.088123, 0, 0.8862745, 1, 1,
0.105767, -0.8586722, 1.669402, 0, 0.8784314, 1, 1,
0.1063791, -0.877463, 2.517849, 0, 0.8745098, 1, 1,
0.108408, -0.02919977, 1.765258, 0, 0.8666667, 1, 1,
0.109943, 1.038043, 1.03668, 0, 0.8627451, 1, 1,
0.1101639, 0.6584828, -1.344174, 0, 0.854902, 1, 1,
0.1146084, -1.072282, 5.969504, 0, 0.8509804, 1, 1,
0.1148666, -0.01072657, 2.896499, 0, 0.8431373, 1, 1,
0.1179846, -0.4603637, 2.714243, 0, 0.8392157, 1, 1,
0.1227926, -2.033875, 3.203105, 0, 0.8313726, 1, 1,
0.1242962, 0.9020711, -0.9711158, 0, 0.827451, 1, 1,
0.1290221, 1.121276, 1.200505, 0, 0.8196079, 1, 1,
0.1292738, -0.1874907, 3.188187, 0, 0.8156863, 1, 1,
0.1294693, 0.2881443, 0.3615793, 0, 0.8078431, 1, 1,
0.1312982, -1.268277, 2.862107, 0, 0.8039216, 1, 1,
0.1319676, -0.3260616, 2.173599, 0, 0.7960784, 1, 1,
0.1347369, 1.072212, 2.259594, 0, 0.7882353, 1, 1,
0.1348173, -1.369718, 2.437256, 0, 0.7843137, 1, 1,
0.1349194, 0.5543545, 0.7263235, 0, 0.7764706, 1, 1,
0.1375384, -0.4883086, 4.130294, 0, 0.772549, 1, 1,
0.1388073, -1.078729, 3.163291, 0, 0.7647059, 1, 1,
0.1393897, -1.160675, 1.290091, 0, 0.7607843, 1, 1,
0.1419564, 0.7707009, -1.139946, 0, 0.7529412, 1, 1,
0.1473116, 1.50437, 0.361919, 0, 0.7490196, 1, 1,
0.1483396, 1.929329, -0.4804079, 0, 0.7411765, 1, 1,
0.1504797, 0.3030754, 1.89695, 0, 0.7372549, 1, 1,
0.1518075, 0.880296, 0.2181525, 0, 0.7294118, 1, 1,
0.1563001, 0.1846067, 0.8278456, 0, 0.7254902, 1, 1,
0.1563121, 1.632911, -2.485509, 0, 0.7176471, 1, 1,
0.1631459, -1.006552, 1.598715, 0, 0.7137255, 1, 1,
0.1646608, 0.8873566, -0.6638467, 0, 0.7058824, 1, 1,
0.1657494, 1.273633, -0.1202014, 0, 0.6980392, 1, 1,
0.1668384, -0.1931198, 2.657234, 0, 0.6941177, 1, 1,
0.1670454, -0.1775827, 1.082283, 0, 0.6862745, 1, 1,
0.1683048, -0.0242358, 1.988548, 0, 0.682353, 1, 1,
0.17419, 0.362855, 4.229321, 0, 0.6745098, 1, 1,
0.1744257, -1.967054, 1.76006, 0, 0.6705883, 1, 1,
0.176335, 1.607041, 2.512344, 0, 0.6627451, 1, 1,
0.181375, -1.674816, 1.484111, 0, 0.6588235, 1, 1,
0.1833967, -0.2269016, 1.345236, 0, 0.6509804, 1, 1,
0.1857224, -0.4616319, 2.888608, 0, 0.6470588, 1, 1,
0.1879677, -0.9076111, 2.89528, 0, 0.6392157, 1, 1,
0.1882409, 1.539006, 0.7912154, 0, 0.6352941, 1, 1,
0.189658, 0.3396112, 0.09589607, 0, 0.627451, 1, 1,
0.1897111, 0.2061935, 1.884589, 0, 0.6235294, 1, 1,
0.1908512, -0.2350644, 1.13242, 0, 0.6156863, 1, 1,
0.1909536, -1.067559, 0.7058347, 0, 0.6117647, 1, 1,
0.1928875, 1.702285, 0.526172, 0, 0.6039216, 1, 1,
0.1945149, 2.129483, -0.669566, 0, 0.5960785, 1, 1,
0.2046565, 0.9744555, 0.5043447, 0, 0.5921569, 1, 1,
0.2182721, -0.62858, 2.625112, 0, 0.5843138, 1, 1,
0.2221477, -1.999356, 2.265455, 0, 0.5803922, 1, 1,
0.2292861, 1.971568, 0.8837228, 0, 0.572549, 1, 1,
0.2334047, 0.6718433, 0.1860638, 0, 0.5686275, 1, 1,
0.234397, 1.075349, -0.4143827, 0, 0.5607843, 1, 1,
0.2350038, 1.238428, -0.2198797, 0, 0.5568628, 1, 1,
0.2362006, -1.011791, 2.380407, 0, 0.5490196, 1, 1,
0.2398973, -1.504038, 1.665087, 0, 0.5450981, 1, 1,
0.2417087, 0.4873783, -0.0996667, 0, 0.5372549, 1, 1,
0.2440767, 0.9460247, 1.311936, 0, 0.5333334, 1, 1,
0.245354, -0.9865568, 3.24403, 0, 0.5254902, 1, 1,
0.2480919, 0.4766479, 1.129499, 0, 0.5215687, 1, 1,
0.2535539, 0.1006569, 1.489778, 0, 0.5137255, 1, 1,
0.2620744, -0.4007943, 4.409367, 0, 0.509804, 1, 1,
0.2624591, -0.5150902, 2.174851, 0, 0.5019608, 1, 1,
0.2657746, -0.3651026, 4.254769, 0, 0.4941176, 1, 1,
0.2673199, -0.7964481, 2.236773, 0, 0.4901961, 1, 1,
0.2781257, 0.3902255, 0.1958714, 0, 0.4823529, 1, 1,
0.2806452, 0.1770781, 0.4027213, 0, 0.4784314, 1, 1,
0.2811386, -0.8347406, 1.824896, 0, 0.4705882, 1, 1,
0.2821354, 0.6663129, 0.7188252, 0, 0.4666667, 1, 1,
0.287217, -0.6540772, 3.648423, 0, 0.4588235, 1, 1,
0.2881579, 0.8330634, 0.7838778, 0, 0.454902, 1, 1,
0.2886571, 0.04412308, 3.52203, 0, 0.4470588, 1, 1,
0.2937176, 0.7022796, 2.108829, 0, 0.4431373, 1, 1,
0.2945716, 1.09244, 0.7668884, 0, 0.4352941, 1, 1,
0.2959392, -0.5425493, 3.95961, 0, 0.4313726, 1, 1,
0.297453, -1.225346, 1.696894, 0, 0.4235294, 1, 1,
0.3027277, 0.9037904, 0.3438857, 0, 0.4196078, 1, 1,
0.3059921, 0.7358919, 1.126689, 0, 0.4117647, 1, 1,
0.3082379, -0.9006485, 4.592189, 0, 0.4078431, 1, 1,
0.3204144, 0.4349153, -0.3696743, 0, 0.4, 1, 1,
0.32391, -0.7379429, 4.07661, 0, 0.3921569, 1, 1,
0.3298356, 1.325944, 1.074136, 0, 0.3882353, 1, 1,
0.3326364, -1.164865, 3.346105, 0, 0.3803922, 1, 1,
0.3380437, 1.469409, -0.914739, 0, 0.3764706, 1, 1,
0.3387599, -0.699478, 2.577006, 0, 0.3686275, 1, 1,
0.3395253, 0.4544783, 0.8230312, 0, 0.3647059, 1, 1,
0.3519673, -0.1502512, -1.300504, 0, 0.3568628, 1, 1,
0.3529464, -0.3633853, 3.878056, 0, 0.3529412, 1, 1,
0.3549366, -0.741374, 2.830043, 0, 0.345098, 1, 1,
0.3733252, -0.9658834, 1.461012, 0, 0.3411765, 1, 1,
0.3737296, 1.641075, -0.4888605, 0, 0.3333333, 1, 1,
0.3771622, -0.5319555, 2.784668, 0, 0.3294118, 1, 1,
0.3780128, -1.305471, 1.65865, 0, 0.3215686, 1, 1,
0.3784229, -0.5342861, 3.165776, 0, 0.3176471, 1, 1,
0.3811478, 0.2745095, -0.3473338, 0, 0.3098039, 1, 1,
0.3817175, 0.7214927, 0.03093525, 0, 0.3058824, 1, 1,
0.3821809, -1.071931, 2.758471, 0, 0.2980392, 1, 1,
0.3838318, -0.5677956, 3.169298, 0, 0.2901961, 1, 1,
0.3900694, -0.3551317, 2.393767, 0, 0.2862745, 1, 1,
0.3907971, -1.392957, 0.4158777, 0, 0.2784314, 1, 1,
0.3911752, 1.755051, -0.1751728, 0, 0.2745098, 1, 1,
0.3992076, -0.1157891, 2.022121, 0, 0.2666667, 1, 1,
0.3992877, 2.082454, 1.059624, 0, 0.2627451, 1, 1,
0.4022246, 0.9405365, 0.1341206, 0, 0.254902, 1, 1,
0.4035892, 0.6002349, -0.5539068, 0, 0.2509804, 1, 1,
0.4056398, -1.102781, 2.323267, 0, 0.2431373, 1, 1,
0.4061326, -0.09687194, 1.421867, 0, 0.2392157, 1, 1,
0.4068451, 0.1086431, 2.551527, 0, 0.2313726, 1, 1,
0.410143, -1.150885, 5.637371, 0, 0.227451, 1, 1,
0.4171845, 0.6740061, -0.5207, 0, 0.2196078, 1, 1,
0.4208753, -1.450204, 2.61714, 0, 0.2156863, 1, 1,
0.4211307, -1.551965, 3.8774, 0, 0.2078431, 1, 1,
0.4231403, 0.330568, 0.497948, 0, 0.2039216, 1, 1,
0.4292161, -0.07322151, 2.978873, 0, 0.1960784, 1, 1,
0.4312846, -2.082498, 4.901861, 0, 0.1882353, 1, 1,
0.4366497, -0.1023738, -0.08757985, 0, 0.1843137, 1, 1,
0.438721, -1.190059, 3.18352, 0, 0.1764706, 1, 1,
0.4403403, 0.4800661, -0.3269874, 0, 0.172549, 1, 1,
0.4506066, -0.1190152, 3.142853, 0, 0.1647059, 1, 1,
0.4507718, -0.7721086, 2.433927, 0, 0.1607843, 1, 1,
0.4537488, -2.073271, 4.910464, 0, 0.1529412, 1, 1,
0.457496, 0.2805115, -0.2520406, 0, 0.1490196, 1, 1,
0.4589673, 0.8103427, -1.429762, 0, 0.1411765, 1, 1,
0.4623483, -0.5223298, 0.9771442, 0, 0.1372549, 1, 1,
0.4643996, -0.8937165, 3.464556, 0, 0.1294118, 1, 1,
0.4648399, 1.324634, 0.05058879, 0, 0.1254902, 1, 1,
0.4685746, -2.3765, 2.351783, 0, 0.1176471, 1, 1,
0.4719092, -0.09660658, 0.2798418, 0, 0.1137255, 1, 1,
0.4759016, 1.907272, 0.948124, 0, 0.1058824, 1, 1,
0.4783499, 0.1795527, 0.1778807, 0, 0.09803922, 1, 1,
0.4798439, 0.9338291, 0.7045262, 0, 0.09411765, 1, 1,
0.4810116, 0.6360859, -0.2439699, 0, 0.08627451, 1, 1,
0.4839341, 1.257383, -0.6337276, 0, 0.08235294, 1, 1,
0.4839672, -0.5727778, 1.2508, 0, 0.07450981, 1, 1,
0.4885076, -0.08029838, 2.663013, 0, 0.07058824, 1, 1,
0.488574, -1.726345, 2.881128, 0, 0.0627451, 1, 1,
0.4932793, 1.135143, -0.1252642, 0, 0.05882353, 1, 1,
0.4973211, 0.5038813, 0.2743744, 0, 0.05098039, 1, 1,
0.501641, -0.3263539, 2.719254, 0, 0.04705882, 1, 1,
0.5044985, 0.2165025, 0.9749791, 0, 0.03921569, 1, 1,
0.5056754, 1.358724, 1.119135, 0, 0.03529412, 1, 1,
0.5078158, 0.461585, 1.215659, 0, 0.02745098, 1, 1,
0.5078731, 1.398036, 0.2945034, 0, 0.02352941, 1, 1,
0.5122303, 1.056216, 1.257043, 0, 0.01568628, 1, 1,
0.5138815, -0.5998805, 2.013963, 0, 0.01176471, 1, 1,
0.5147135, 0.3323134, 0.6024822, 0, 0.003921569, 1, 1,
0.5210978, -0.9530021, 2.475246, 0.003921569, 0, 1, 1,
0.5214278, 0.1338431, 2.019709, 0.007843138, 0, 1, 1,
0.5221576, 1.49664, 1.003985, 0.01568628, 0, 1, 1,
0.5247474, -0.355118, 3.24702, 0.01960784, 0, 1, 1,
0.5251472, 1.497614, -0.1311499, 0.02745098, 0, 1, 1,
0.5269758, -0.6159555, 0.3673171, 0.03137255, 0, 1, 1,
0.5279655, 0.9564955, 1.212626, 0.03921569, 0, 1, 1,
0.5311069, -1.75584, 4.360148, 0.04313726, 0, 1, 1,
0.538864, 1.837452, -0.4662654, 0.05098039, 0, 1, 1,
0.5437235, -0.6554307, 3.023112, 0.05490196, 0, 1, 1,
0.5445586, 1.357914, -0.09132265, 0.0627451, 0, 1, 1,
0.5445749, -1.511077, 2.678333, 0.06666667, 0, 1, 1,
0.5484556, -0.05580841, 3.18009, 0.07450981, 0, 1, 1,
0.5517154, -0.03235889, 3.311846, 0.07843138, 0, 1, 1,
0.566519, 0.2599064, 1.777724, 0.08627451, 0, 1, 1,
0.5671839, -0.2303773, 2.86146, 0.09019608, 0, 1, 1,
0.5696687, -1.0862, 1.928108, 0.09803922, 0, 1, 1,
0.5711324, -1.66746, 2.401872, 0.1058824, 0, 1, 1,
0.5721243, 0.282288, 2.29591, 0.1098039, 0, 1, 1,
0.5726885, -0.0145902, 2.066303, 0.1176471, 0, 1, 1,
0.5760903, 0.1648256, 0.9771107, 0.1215686, 0, 1, 1,
0.5762595, 0.4450781, 0.5169293, 0.1294118, 0, 1, 1,
0.5790871, 1.101111, 0.346459, 0.1333333, 0, 1, 1,
0.5825407, -0.4156575, 3.069154, 0.1411765, 0, 1, 1,
0.5826221, -1.744338, 2.850349, 0.145098, 0, 1, 1,
0.5845674, 0.1345886, 0.164802, 0.1529412, 0, 1, 1,
0.5852695, 0.1660669, 0.4118719, 0.1568628, 0, 1, 1,
0.5898638, 1.389108, 0.3014658, 0.1647059, 0, 1, 1,
0.5904983, -1.172457, 2.271873, 0.1686275, 0, 1, 1,
0.5941971, -1.352883, 2.955323, 0.1764706, 0, 1, 1,
0.5949545, 1.436108, -3.522482, 0.1803922, 0, 1, 1,
0.5976542, 0.456709, 1.53715, 0.1882353, 0, 1, 1,
0.6037949, 0.774247, -0.3124305, 0.1921569, 0, 1, 1,
0.6168976, 4.908906e-05, 2.203485, 0.2, 0, 1, 1,
0.6195961, 0.7111605, -0.4156338, 0.2078431, 0, 1, 1,
0.6206935, -1.144226, 2.1383, 0.2117647, 0, 1, 1,
0.623614, -0.6080735, 2.005939, 0.2196078, 0, 1, 1,
0.6238218, 0.5529187, -1.485834, 0.2235294, 0, 1, 1,
0.6273332, 0.4571081, 1.965467, 0.2313726, 0, 1, 1,
0.6283438, 0.4616638, -0.5353419, 0.2352941, 0, 1, 1,
0.6340892, 0.04334361, 1.227476, 0.2431373, 0, 1, 1,
0.6365858, -0.3040887, 2.715178, 0.2470588, 0, 1, 1,
0.6380421, -0.2269121, 2.550652, 0.254902, 0, 1, 1,
0.6381921, 0.5507478, 0.5151595, 0.2588235, 0, 1, 1,
0.6406525, -0.133168, 1.485001, 0.2666667, 0, 1, 1,
0.6419826, 0.7103512, 0.6399054, 0.2705882, 0, 1, 1,
0.6422811, -1.240124, 3.875809, 0.2784314, 0, 1, 1,
0.6476886, -0.4119723, 0.7393805, 0.282353, 0, 1, 1,
0.6491048, -0.3974241, 2.33168, 0.2901961, 0, 1, 1,
0.6496012, 0.7175633, 1.781267, 0.2941177, 0, 1, 1,
0.6524243, 2.981678, -0.7530458, 0.3019608, 0, 1, 1,
0.6558387, -2.561042, 4.213237, 0.3098039, 0, 1, 1,
0.6593615, 0.715688, 1.306544, 0.3137255, 0, 1, 1,
0.6650523, -1.141607, 2.720118, 0.3215686, 0, 1, 1,
0.6682476, 2.05686, 1.234719, 0.3254902, 0, 1, 1,
0.6722789, -0.04853408, 1.42472, 0.3333333, 0, 1, 1,
0.6742507, 0.8265112, -1.234433, 0.3372549, 0, 1, 1,
0.6772064, 0.3074017, 0.9046741, 0.345098, 0, 1, 1,
0.6800664, -0.002038141, 1.202081, 0.3490196, 0, 1, 1,
0.6828488, 0.1492868, 2.325537, 0.3568628, 0, 1, 1,
0.6854162, -1.775701, 2.5831, 0.3607843, 0, 1, 1,
0.6860399, 0.3520761, 1.200294, 0.3686275, 0, 1, 1,
0.6877259, -1.640872, 2.707639, 0.372549, 0, 1, 1,
0.6993878, -1.451316, 1.43637, 0.3803922, 0, 1, 1,
0.7008939, 0.5102246, -0.08189072, 0.3843137, 0, 1, 1,
0.7070078, 0.1843093, 2.058216, 0.3921569, 0, 1, 1,
0.7078575, 0.1486658, 1.166963, 0.3960784, 0, 1, 1,
0.7099015, 1.112829, 1.356497, 0.4039216, 0, 1, 1,
0.7104372, -0.1657117, 3.440357, 0.4117647, 0, 1, 1,
0.7147451, 0.4652646, 2.130786, 0.4156863, 0, 1, 1,
0.7230315, 0.7562223, -0.09229794, 0.4235294, 0, 1, 1,
0.7254514, -0.9302828, 1.021911, 0.427451, 0, 1, 1,
0.7256718, -1.342866, 3.7298, 0.4352941, 0, 1, 1,
0.7297818, 0.6074409, 0.7196137, 0.4392157, 0, 1, 1,
0.7346173, 0.1188179, 2.294925, 0.4470588, 0, 1, 1,
0.7356595, 1.492034, 1.500364, 0.4509804, 0, 1, 1,
0.7462919, 0.01898845, 0.7045987, 0.4588235, 0, 1, 1,
0.7467496, 0.8658221, 1.472545, 0.4627451, 0, 1, 1,
0.749142, 0.06819624, 1.525886, 0.4705882, 0, 1, 1,
0.7575952, -1.624482, 2.800385, 0.4745098, 0, 1, 1,
0.7626485, 1.17294, 3.137877, 0.4823529, 0, 1, 1,
0.7669953, -0.2495481, 1.515283, 0.4862745, 0, 1, 1,
0.7747415, 0.1970352, 1.597751, 0.4941176, 0, 1, 1,
0.7782075, 0.3899699, 1.491441, 0.5019608, 0, 1, 1,
0.7786487, -0.098786, 2.998157, 0.5058824, 0, 1, 1,
0.7812903, 0.1508314, 2.660488, 0.5137255, 0, 1, 1,
0.7819235, 0.7054949, 1.319443, 0.5176471, 0, 1, 1,
0.7827158, -1.587138, 3.056659, 0.5254902, 0, 1, 1,
0.7849354, -0.2882889, 0.738551, 0.5294118, 0, 1, 1,
0.785145, 0.2941475, 1.420365, 0.5372549, 0, 1, 1,
0.7862606, 1.539302, 0.7915052, 0.5411765, 0, 1, 1,
0.7882584, -0.2091544, 3.289353, 0.5490196, 0, 1, 1,
0.7887146, -1.424339, 3.108439, 0.5529412, 0, 1, 1,
0.7904626, 0.1626629, 0.8049971, 0.5607843, 0, 1, 1,
0.7967061, 0.1057443, 1.874406, 0.5647059, 0, 1, 1,
0.800563, 0.8304726, 0.4472447, 0.572549, 0, 1, 1,
0.8051358, 0.1259009, 2.763578, 0.5764706, 0, 1, 1,
0.8058234, -0.1592839, 1.522896, 0.5843138, 0, 1, 1,
0.8095276, 1.224271, 0.6815773, 0.5882353, 0, 1, 1,
0.8147412, 0.4784457, -0.4169441, 0.5960785, 0, 1, 1,
0.8185941, -0.06794012, 1.474515, 0.6039216, 0, 1, 1,
0.8190002, -1.089955, 3.354639, 0.6078432, 0, 1, 1,
0.8195913, -1.653134, 2.122882, 0.6156863, 0, 1, 1,
0.8213511, 0.7780547, 1.314215, 0.6196079, 0, 1, 1,
0.8296675, 0.2249935, 1.286748, 0.627451, 0, 1, 1,
0.8303499, 0.7084682, 2.361504, 0.6313726, 0, 1, 1,
0.8318302, -0.3821568, 3.841558, 0.6392157, 0, 1, 1,
0.8347214, 1.427028, 0.4385693, 0.6431373, 0, 1, 1,
0.8376133, 1.312699, 0.06144297, 0.6509804, 0, 1, 1,
0.8385687, -2.116112, 2.259284, 0.654902, 0, 1, 1,
0.8454113, -0.5792842, 4.262017, 0.6627451, 0, 1, 1,
0.84575, -0.5077783, 2.209319, 0.6666667, 0, 1, 1,
0.8537921, 0.4232177, 1.382167, 0.6745098, 0, 1, 1,
0.8539516, -0.4376864, 1.340311, 0.6784314, 0, 1, 1,
0.865105, -1.70198, 2.312665, 0.6862745, 0, 1, 1,
0.8701067, 0.8070734, 1.235548, 0.6901961, 0, 1, 1,
0.8760561, 0.1870479, 1.092997, 0.6980392, 0, 1, 1,
0.8763952, 0.7191921, 1.359509, 0.7058824, 0, 1, 1,
0.8803543, 2.324808, -0.9634547, 0.7098039, 0, 1, 1,
0.8809701, 0.1967802, 2.725941, 0.7176471, 0, 1, 1,
0.8880561, 0.3261058, -0.1932269, 0.7215686, 0, 1, 1,
0.8901637, 0.5490506, 1.546993, 0.7294118, 0, 1, 1,
0.8910981, -0.3436885, 1.19108, 0.7333333, 0, 1, 1,
0.8916689, 1.608856, 0.8329974, 0.7411765, 0, 1, 1,
0.897205, -0.1490413, 2.400352, 0.7450981, 0, 1, 1,
0.8976542, -1.704366, 2.8022, 0.7529412, 0, 1, 1,
0.9018888, 0.6540138, 1.897341, 0.7568628, 0, 1, 1,
0.9082297, 0.829744, -0.6346335, 0.7647059, 0, 1, 1,
0.9119315, -0.9791765, 2.815016, 0.7686275, 0, 1, 1,
0.9179469, 0.7854538, 1.558881, 0.7764706, 0, 1, 1,
0.9206282, -0.9013922, 0.1710072, 0.7803922, 0, 1, 1,
0.9210052, 0.2304399, 0.9133487, 0.7882353, 0, 1, 1,
0.9228514, -1.082564, 1.574667, 0.7921569, 0, 1, 1,
0.9259512, 0.2361792, 0.6639119, 0.8, 0, 1, 1,
0.9264095, -0.1973976, 2.937626, 0.8078431, 0, 1, 1,
0.9274237, 0.6997917, 1.721176, 0.8117647, 0, 1, 1,
0.9282805, 1.675414, 0.4197533, 0.8196079, 0, 1, 1,
0.9341433, 1.782845, -0.4536813, 0.8235294, 0, 1, 1,
0.9347604, -0.02506218, 1.03462, 0.8313726, 0, 1, 1,
0.9374976, -0.5173898, 2.493226, 0.8352941, 0, 1, 1,
0.9395398, 0.4386559, 0.6716884, 0.8431373, 0, 1, 1,
0.9451932, -0.953049, 0.6874029, 0.8470588, 0, 1, 1,
0.9467799, -0.8344801, 4.434514, 0.854902, 0, 1, 1,
0.9506672, 0.007322526, 2.119511, 0.8588235, 0, 1, 1,
0.9511102, -0.6640382, 1.663072, 0.8666667, 0, 1, 1,
0.9596919, -1.169951, 2.232179, 0.8705882, 0, 1, 1,
0.9636953, 1.112797, 0.7295772, 0.8784314, 0, 1, 1,
0.9649945, -0.2600203, 3.484108, 0.8823529, 0, 1, 1,
0.9702097, -0.3259501, 1.128884, 0.8901961, 0, 1, 1,
0.9707494, 0.03570524, 0.4075926, 0.8941177, 0, 1, 1,
0.9779043, -1.061765, 3.08613, 0.9019608, 0, 1, 1,
0.9788017, -0.8446854, 3.7217, 0.9098039, 0, 1, 1,
0.9794387, 0.3563488, 0.7820653, 0.9137255, 0, 1, 1,
0.9795889, -0.2348023, 1.204949, 0.9215686, 0, 1, 1,
0.9815804, -0.8306005, 2.613904, 0.9254902, 0, 1, 1,
0.9819668, -0.6154649, 1.827008, 0.9333333, 0, 1, 1,
0.9824837, -0.2190371, 1.43865, 0.9372549, 0, 1, 1,
0.9827178, -1.042687, 2.028409, 0.945098, 0, 1, 1,
0.9839894, -1.261897, 1.976994, 0.9490196, 0, 1, 1,
0.9917341, -0.3897222, 1.614995, 0.9568627, 0, 1, 1,
0.9929699, 1.818752, -0.5825484, 0.9607843, 0, 1, 1,
0.9978461, 0.3402924, 0.9408383, 0.9686275, 0, 1, 1,
1.00039, 0.4565555, -0.08803464, 0.972549, 0, 1, 1,
1.004565, -0.0825412, 1.864237, 0.9803922, 0, 1, 1,
1.006225, -0.2738052, 3.270294, 0.9843137, 0, 1, 1,
1.014677, 0.4834657, -0.34343, 0.9921569, 0, 1, 1,
1.015327, 1.050202, 1.253847, 0.9960784, 0, 1, 1,
1.01711, 0.9499162, 0.6536496, 1, 0, 0.9960784, 1,
1.020856, -1.28559, 2.712084, 1, 0, 0.9882353, 1,
1.022119, 1.073407, -0.1091571, 1, 0, 0.9843137, 1,
1.025815, 0.9524118, 1.351426, 1, 0, 0.9764706, 1,
1.027381, -0.7886332, 2.308172, 1, 0, 0.972549, 1,
1.029321, 1.438655, 1.286626, 1, 0, 0.9647059, 1,
1.03491, 3.101418, 0.536224, 1, 0, 0.9607843, 1,
1.036849, 1.280205, 1.479692, 1, 0, 0.9529412, 1,
1.038853, 1.243805, -0.2219001, 1, 0, 0.9490196, 1,
1.039529, 0.00810952, 1.141331, 1, 0, 0.9411765, 1,
1.046136, 0.2013629, 0.4385296, 1, 0, 0.9372549, 1,
1.053416, -0.3164988, 2.365321, 1, 0, 0.9294118, 1,
1.055113, 0.763441, 1.732611, 1, 0, 0.9254902, 1,
1.066985, 0.3196004, 1.059551, 1, 0, 0.9176471, 1,
1.071424, -0.3897075, 2.817447, 1, 0, 0.9137255, 1,
1.071779, -0.1160117, 1.555351, 1, 0, 0.9058824, 1,
1.077182, -1.66878, 1.847447, 1, 0, 0.9019608, 1,
1.08177, 1.008329, 0.3245418, 1, 0, 0.8941177, 1,
1.087888, 1.940749, 1.639035, 1, 0, 0.8862745, 1,
1.091768, 0.5224144, 0.391242, 1, 0, 0.8823529, 1,
1.092562, -1.318509, 3.134081, 1, 0, 0.8745098, 1,
1.103151, 1.441398, 0.8942766, 1, 0, 0.8705882, 1,
1.104981, 0.1471849, 1.023413, 1, 0, 0.8627451, 1,
1.10724, -0.6627513, 2.454363, 1, 0, 0.8588235, 1,
1.109859, 0.3748267, 3.093222, 1, 0, 0.8509804, 1,
1.113491, -1.206025, 1.62428, 1, 0, 0.8470588, 1,
1.118008, 0.007448994, 0.9170527, 1, 0, 0.8392157, 1,
1.123346, -1.985559, 3.265488, 1, 0, 0.8352941, 1,
1.126325, 1.416224, 2.539097, 1, 0, 0.827451, 1,
1.126757, -1.185044, 0.8885128, 1, 0, 0.8235294, 1,
1.128061, 0.4655286, 1.597475, 1, 0, 0.8156863, 1,
1.12947, 0.8376357, 0.05607562, 1, 0, 0.8117647, 1,
1.150662, -0.4860872, 0.7935105, 1, 0, 0.8039216, 1,
1.151662, -1.901309, 1.335043, 1, 0, 0.7960784, 1,
1.155075, 0.1127178, 0.00414163, 1, 0, 0.7921569, 1,
1.156869, -1.048118, 1.550099, 1, 0, 0.7843137, 1,
1.159613, -0.8172842, 2.900079, 1, 0, 0.7803922, 1,
1.160447, -0.1887525, 1.993299, 1, 0, 0.772549, 1,
1.164099, -1.558736, 2.735984, 1, 0, 0.7686275, 1,
1.16624, 0.1838601, -0.5824708, 1, 0, 0.7607843, 1,
1.169537, -1.15969, 1.38715, 1, 0, 0.7568628, 1,
1.187274, -0.5140712, 1.124189, 1, 0, 0.7490196, 1,
1.19323, 0.6590003, 1.640457, 1, 0, 0.7450981, 1,
1.195014, 0.9621841, 0.9477459, 1, 0, 0.7372549, 1,
1.197634, -0.881143, 2.061709, 1, 0, 0.7333333, 1,
1.218123, -0.4113263, 2.59427, 1, 0, 0.7254902, 1,
1.219054, -0.4230601, -0.1042011, 1, 0, 0.7215686, 1,
1.228456, 1.586282, 1.682658, 1, 0, 0.7137255, 1,
1.229668, -0.9161196, 3.619081, 1, 0, 0.7098039, 1,
1.232281, -0.7119309, 0.7017861, 1, 0, 0.7019608, 1,
1.242441, -1.413167, 2.576012, 1, 0, 0.6941177, 1,
1.244574, -0.8523989, 1.69029, 1, 0, 0.6901961, 1,
1.24582, 1.266125, 1.676796, 1, 0, 0.682353, 1,
1.246544, -0.3600014, 3.454892, 1, 0, 0.6784314, 1,
1.247233, 0.3072609, 2.059616, 1, 0, 0.6705883, 1,
1.247558, 0.03853399, 0.7206465, 1, 0, 0.6666667, 1,
1.259132, -0.3543684, 2.237975, 1, 0, 0.6588235, 1,
1.260315, 1.463503, -1.126057, 1, 0, 0.654902, 1,
1.266537, -0.4353411, 3.082708, 1, 0, 0.6470588, 1,
1.267137, 0.5990051, 1.194741, 1, 0, 0.6431373, 1,
1.271964, 0.3103607, 2.009308, 1, 0, 0.6352941, 1,
1.272878, -0.5505614, 2.465724, 1, 0, 0.6313726, 1,
1.273651, 1.387413, 1.48943, 1, 0, 0.6235294, 1,
1.275761, 0.706337, 1.406614, 1, 0, 0.6196079, 1,
1.277427, -0.09337033, 1.677598, 1, 0, 0.6117647, 1,
1.293939, -1.058064, 2.337119, 1, 0, 0.6078432, 1,
1.307961, 0.6601174, 1.575471, 1, 0, 0.6, 1,
1.310347, -0.3783143, 3.238419, 1, 0, 0.5921569, 1,
1.318373, 0.1220225, 0.5496187, 1, 0, 0.5882353, 1,
1.326139, 1.253253, 0.5101278, 1, 0, 0.5803922, 1,
1.329588, -0.303701, 1.185461, 1, 0, 0.5764706, 1,
1.338447, 0.9491708, 0.4796813, 1, 0, 0.5686275, 1,
1.338519, 0.7265134, 2.59781, 1, 0, 0.5647059, 1,
1.343386, 0.7377095, 1.248778, 1, 0, 0.5568628, 1,
1.348805, 0.5671582, 1.847957, 1, 0, 0.5529412, 1,
1.35186, 0.953066, 0.90233, 1, 0, 0.5450981, 1,
1.352194, -0.4876063, 1.682799, 1, 0, 0.5411765, 1,
1.356012, 0.4942216, 1.184715, 1, 0, 0.5333334, 1,
1.35649, 0.1919625, 1.306086, 1, 0, 0.5294118, 1,
1.35696, -0.05391859, 2.812542, 1, 0, 0.5215687, 1,
1.358035, -0.7608575, 2.18429, 1, 0, 0.5176471, 1,
1.361355, 1.201456, 1.465852, 1, 0, 0.509804, 1,
1.361915, -1.413506, 2.823457, 1, 0, 0.5058824, 1,
1.362823, 0.4846134, 1.334289, 1, 0, 0.4980392, 1,
1.384599, 0.02620601, 1.870747, 1, 0, 0.4901961, 1,
1.403585, 1.204257, -0.1455316, 1, 0, 0.4862745, 1,
1.45753, 0.3686144, -0.4576845, 1, 0, 0.4784314, 1,
1.464789, -1.765198, 2.30583, 1, 0, 0.4745098, 1,
1.466002, -2.209899, 1.312085, 1, 0, 0.4666667, 1,
1.469185, 0.2922642, 0.6730928, 1, 0, 0.4627451, 1,
1.469528, -1.290809, 1.930382, 1, 0, 0.454902, 1,
1.476772, -0.6791466, 2.670961, 1, 0, 0.4509804, 1,
1.493452, 0.7052533, 0.8063154, 1, 0, 0.4431373, 1,
1.497587, 0.8698818, 1.902946, 1, 0, 0.4392157, 1,
1.512928, -0.2151235, 1.525248, 1, 0, 0.4313726, 1,
1.531837, -0.7927913, 0.8912618, 1, 0, 0.427451, 1,
1.547156, -0.1872845, 1.346578, 1, 0, 0.4196078, 1,
1.556181, -2.07682, 1.467845, 1, 0, 0.4156863, 1,
1.557786, 1.704141, -0.3882089, 1, 0, 0.4078431, 1,
1.559117, 0.05413352, 2.570145, 1, 0, 0.4039216, 1,
1.56918, 1.254177, 0.9029602, 1, 0, 0.3960784, 1,
1.576864, 0.7154014, -2.199462, 1, 0, 0.3882353, 1,
1.578343, 0.4539202, 1.972805, 1, 0, 0.3843137, 1,
1.58185, -0.6741866, 1.229718, 1, 0, 0.3764706, 1,
1.592722, 0.2159765, 3.013668, 1, 0, 0.372549, 1,
1.594054, -1.376243, 2.216547, 1, 0, 0.3647059, 1,
1.608303, -0.005522064, 1.156076, 1, 0, 0.3607843, 1,
1.609393, -0.2169149, 2.371349, 1, 0, 0.3529412, 1,
1.612536, -0.02644244, 2.825651, 1, 0, 0.3490196, 1,
1.612555, -0.4697586, 1.162595, 1, 0, 0.3411765, 1,
1.61631, -1.126503, 3.052527, 1, 0, 0.3372549, 1,
1.62606, -0.6340166, 1.710082, 1, 0, 0.3294118, 1,
1.62956, 2.208774, 0.7806247, 1, 0, 0.3254902, 1,
1.632126, 0.176611, 1.020123, 1, 0, 0.3176471, 1,
1.638935, 0.968743, 2.440001, 1, 0, 0.3137255, 1,
1.670786, -0.1055991, 2.588186, 1, 0, 0.3058824, 1,
1.676966, 1.143858, 1.077635, 1, 0, 0.2980392, 1,
1.685501, 0.1088836, 2.597621, 1, 0, 0.2941177, 1,
1.691502, 1.990944, 1.741304, 1, 0, 0.2862745, 1,
1.699471, 0.9642077, 1.501714, 1, 0, 0.282353, 1,
1.708337, 1.372181, 1.242799, 1, 0, 0.2745098, 1,
1.761763, 0.1912399, 2.415166, 1, 0, 0.2705882, 1,
1.764568, -1.422641, 2.315738, 1, 0, 0.2627451, 1,
1.779447, 0.4945915, 0.813792, 1, 0, 0.2588235, 1,
1.803062, -0.1449662, -1.192508, 1, 0, 0.2509804, 1,
1.83534, 1.184853, 1.620609, 1, 0, 0.2470588, 1,
1.861759, 0.5764137, -0.06434771, 1, 0, 0.2392157, 1,
1.879958, 0.7866783, 2.433507, 1, 0, 0.2352941, 1,
1.886499, 0.3861132, 0.7645137, 1, 0, 0.227451, 1,
1.89239, 0.3257699, 3.428241, 1, 0, 0.2235294, 1,
1.894661, -0.7667412, 1.780523, 1, 0, 0.2156863, 1,
1.913089, 1.743254, 0.7759403, 1, 0, 0.2117647, 1,
1.93669, -0.3232496, 0.8604411, 1, 0, 0.2039216, 1,
1.94977, -0.08541638, 2.762123, 1, 0, 0.1960784, 1,
1.955716, -0.7538046, 1.201612, 1, 0, 0.1921569, 1,
1.96001, 0.8106094, -0.7985994, 1, 0, 0.1843137, 1,
1.970544, 1.440299, 1.813774, 1, 0, 0.1803922, 1,
1.974234, -0.7917917, 1.624765, 1, 0, 0.172549, 1,
1.975416, 1.034893, 0.2109155, 1, 0, 0.1686275, 1,
1.986857, 0.2650244, -1.181287, 1, 0, 0.1607843, 1,
2.009802, 1.524539, 2.16414, 1, 0, 0.1568628, 1,
2.050241, -2.560452, 1.835469, 1, 0, 0.1490196, 1,
2.060854, 1.35515, -0.0474125, 1, 0, 0.145098, 1,
2.103148, 0.5053661, 1.968143, 1, 0, 0.1372549, 1,
2.113763, 0.37171, 2.12308, 1, 0, 0.1333333, 1,
2.115538, -0.5252073, 2.438225, 1, 0, 0.1254902, 1,
2.121841, -0.6353782, 0.9607525, 1, 0, 0.1215686, 1,
2.153031, 1.356647, 1.366747, 1, 0, 0.1137255, 1,
2.189147, 0.1409584, 3.065316, 1, 0, 0.1098039, 1,
2.232044, -2.457105, 5.049597, 1, 0, 0.1019608, 1,
2.241542, 0.9244702, 1.577298, 1, 0, 0.09411765, 1,
2.341317, 0.2158204, 1.898849, 1, 0, 0.09019608, 1,
2.469854, -1.245381, 2.020708, 1, 0, 0.08235294, 1,
2.4792, 0.6509073, 1.941954, 1, 0, 0.07843138, 1,
2.479307, 0.5488024, 1.548533, 1, 0, 0.07058824, 1,
2.49214, -0.01247121, 2.254962, 1, 0, 0.06666667, 1,
2.492401, -1.254051, 2.07847, 1, 0, 0.05882353, 1,
2.499642, -0.3724762, 1.745321, 1, 0, 0.05490196, 1,
2.50519, 0.7070647, 0.5055927, 1, 0, 0.04705882, 1,
2.506008, 0.992838, 0.8412322, 1, 0, 0.04313726, 1,
2.545743, -0.01539819, 2.783552, 1, 0, 0.03529412, 1,
2.59956, -0.4781114, 2.227593, 1, 0, 0.03137255, 1,
2.621246, 1.241607, 0.4215448, 1, 0, 0.02352941, 1,
2.721174, -0.8292235, 1.513032, 1, 0, 0.01960784, 1,
2.759198, -0.153138, -0.1425094, 1, 0, 0.01176471, 1,
3.548411, 0.4505217, 0.6839559, 1, 0, 0.007843138, 1
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
0.3757248, -4.208257, -7.392528, 0, -0.5, 0.5, 0.5,
0.3757248, -4.208257, -7.392528, 1, -0.5, 0.5, 0.5,
0.3757248, -4.208257, -7.392528, 1, 1.5, 0.5, 0.5,
0.3757248, -4.208257, -7.392528, 0, 1.5, 0.5, 0.5
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
-3.872503, -0.02371013, -7.392528, 0, -0.5, 0.5, 0.5,
-3.872503, -0.02371013, -7.392528, 1, -0.5, 0.5, 0.5,
-3.872503, -0.02371013, -7.392528, 1, 1.5, 0.5, 0.5,
-3.872503, -0.02371013, -7.392528, 0, 1.5, 0.5, 0.5
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
-3.872503, -4.208257, 0.256793, 0, -0.5, 0.5, 0.5,
-3.872503, -4.208257, 0.256793, 1, -0.5, 0.5, 0.5,
-3.872503, -4.208257, 0.256793, 1, 1.5, 0.5, 0.5,
-3.872503, -4.208257, 0.256793, 0, 1.5, 0.5, 0.5
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
-2, -3.242593, -5.6273,
3, -3.242593, -5.6273,
-2, -3.242593, -5.6273,
-2, -3.403537, -5.921504,
-1, -3.242593, -5.6273,
-1, -3.403537, -5.921504,
0, -3.242593, -5.6273,
0, -3.403537, -5.921504,
1, -3.242593, -5.6273,
1, -3.403537, -5.921504,
2, -3.242593, -5.6273,
2, -3.403537, -5.921504,
3, -3.242593, -5.6273,
3, -3.403537, -5.921504
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
-2, -3.725425, -6.509913, 0, -0.5, 0.5, 0.5,
-2, -3.725425, -6.509913, 1, -0.5, 0.5, 0.5,
-2, -3.725425, -6.509913, 1, 1.5, 0.5, 0.5,
-2, -3.725425, -6.509913, 0, 1.5, 0.5, 0.5,
-1, -3.725425, -6.509913, 0, -0.5, 0.5, 0.5,
-1, -3.725425, -6.509913, 1, -0.5, 0.5, 0.5,
-1, -3.725425, -6.509913, 1, 1.5, 0.5, 0.5,
-1, -3.725425, -6.509913, 0, 1.5, 0.5, 0.5,
0, -3.725425, -6.509913, 0, -0.5, 0.5, 0.5,
0, -3.725425, -6.509913, 1, -0.5, 0.5, 0.5,
0, -3.725425, -6.509913, 1, 1.5, 0.5, 0.5,
0, -3.725425, -6.509913, 0, 1.5, 0.5, 0.5,
1, -3.725425, -6.509913, 0, -0.5, 0.5, 0.5,
1, -3.725425, -6.509913, 1, -0.5, 0.5, 0.5,
1, -3.725425, -6.509913, 1, 1.5, 0.5, 0.5,
1, -3.725425, -6.509913, 0, 1.5, 0.5, 0.5,
2, -3.725425, -6.509913, 0, -0.5, 0.5, 0.5,
2, -3.725425, -6.509913, 1, -0.5, 0.5, 0.5,
2, -3.725425, -6.509913, 1, 1.5, 0.5, 0.5,
2, -3.725425, -6.509913, 0, 1.5, 0.5, 0.5,
3, -3.725425, -6.509913, 0, -0.5, 0.5, 0.5,
3, -3.725425, -6.509913, 1, -0.5, 0.5, 0.5,
3, -3.725425, -6.509913, 1, 1.5, 0.5, 0.5,
3, -3.725425, -6.509913, 0, 1.5, 0.5, 0.5
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
-2.892142, -3, -5.6273,
-2.892142, 3, -5.6273,
-2.892142, -3, -5.6273,
-3.055536, -3, -5.921504,
-2.892142, -2, -5.6273,
-3.055536, -2, -5.921504,
-2.892142, -1, -5.6273,
-3.055536, -1, -5.921504,
-2.892142, 0, -5.6273,
-3.055536, 0, -5.921504,
-2.892142, 1, -5.6273,
-3.055536, 1, -5.921504,
-2.892142, 2, -5.6273,
-3.055536, 2, -5.921504,
-2.892142, 3, -5.6273,
-3.055536, 3, -5.921504
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
-3.382323, -3, -6.509913, 0, -0.5, 0.5, 0.5,
-3.382323, -3, -6.509913, 1, -0.5, 0.5, 0.5,
-3.382323, -3, -6.509913, 1, 1.5, 0.5, 0.5,
-3.382323, -3, -6.509913, 0, 1.5, 0.5, 0.5,
-3.382323, -2, -6.509913, 0, -0.5, 0.5, 0.5,
-3.382323, -2, -6.509913, 1, -0.5, 0.5, 0.5,
-3.382323, -2, -6.509913, 1, 1.5, 0.5, 0.5,
-3.382323, -2, -6.509913, 0, 1.5, 0.5, 0.5,
-3.382323, -1, -6.509913, 0, -0.5, 0.5, 0.5,
-3.382323, -1, -6.509913, 1, -0.5, 0.5, 0.5,
-3.382323, -1, -6.509913, 1, 1.5, 0.5, 0.5,
-3.382323, -1, -6.509913, 0, 1.5, 0.5, 0.5,
-3.382323, 0, -6.509913, 0, -0.5, 0.5, 0.5,
-3.382323, 0, -6.509913, 1, -0.5, 0.5, 0.5,
-3.382323, 0, -6.509913, 1, 1.5, 0.5, 0.5,
-3.382323, 0, -6.509913, 0, 1.5, 0.5, 0.5,
-3.382323, 1, -6.509913, 0, -0.5, 0.5, 0.5,
-3.382323, 1, -6.509913, 1, -0.5, 0.5, 0.5,
-3.382323, 1, -6.509913, 1, 1.5, 0.5, 0.5,
-3.382323, 1, -6.509913, 0, 1.5, 0.5, 0.5,
-3.382323, 2, -6.509913, 0, -0.5, 0.5, 0.5,
-3.382323, 2, -6.509913, 1, -0.5, 0.5, 0.5,
-3.382323, 2, -6.509913, 1, 1.5, 0.5, 0.5,
-3.382323, 2, -6.509913, 0, 1.5, 0.5, 0.5,
-3.382323, 3, -6.509913, 0, -0.5, 0.5, 0.5,
-3.382323, 3, -6.509913, 1, -0.5, 0.5, 0.5,
-3.382323, 3, -6.509913, 1, 1.5, 0.5, 0.5,
-3.382323, 3, -6.509913, 0, 1.5, 0.5, 0.5
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
-2.892142, -3.242593, -4,
-2.892142, -3.242593, 4,
-2.892142, -3.242593, -4,
-3.055536, -3.403537, -4,
-2.892142, -3.242593, -2,
-3.055536, -3.403537, -2,
-2.892142, -3.242593, 0,
-3.055536, -3.403537, 0,
-2.892142, -3.242593, 2,
-3.055536, -3.403537, 2,
-2.892142, -3.242593, 4,
-3.055536, -3.403537, 4
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
-3.382323, -3.725425, -4, 0, -0.5, 0.5, 0.5,
-3.382323, -3.725425, -4, 1, -0.5, 0.5, 0.5,
-3.382323, -3.725425, -4, 1, 1.5, 0.5, 0.5,
-3.382323, -3.725425, -4, 0, 1.5, 0.5, 0.5,
-3.382323, -3.725425, -2, 0, -0.5, 0.5, 0.5,
-3.382323, -3.725425, -2, 1, -0.5, 0.5, 0.5,
-3.382323, -3.725425, -2, 1, 1.5, 0.5, 0.5,
-3.382323, -3.725425, -2, 0, 1.5, 0.5, 0.5,
-3.382323, -3.725425, 0, 0, -0.5, 0.5, 0.5,
-3.382323, -3.725425, 0, 1, -0.5, 0.5, 0.5,
-3.382323, -3.725425, 0, 1, 1.5, 0.5, 0.5,
-3.382323, -3.725425, 0, 0, 1.5, 0.5, 0.5,
-3.382323, -3.725425, 2, 0, -0.5, 0.5, 0.5,
-3.382323, -3.725425, 2, 1, -0.5, 0.5, 0.5,
-3.382323, -3.725425, 2, 1, 1.5, 0.5, 0.5,
-3.382323, -3.725425, 2, 0, 1.5, 0.5, 0.5,
-3.382323, -3.725425, 4, 0, -0.5, 0.5, 0.5,
-3.382323, -3.725425, 4, 1, -0.5, 0.5, 0.5,
-3.382323, -3.725425, 4, 1, 1.5, 0.5, 0.5,
-3.382323, -3.725425, 4, 0, 1.5, 0.5, 0.5
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
-2.892142, -3.242593, -5.6273,
-2.892142, 3.195172, -5.6273,
-2.892142, -3.242593, 6.140886,
-2.892142, 3.195172, 6.140886,
-2.892142, -3.242593, -5.6273,
-2.892142, -3.242593, 6.140886,
-2.892142, 3.195172, -5.6273,
-2.892142, 3.195172, 6.140886,
-2.892142, -3.242593, -5.6273,
3.643592, -3.242593, -5.6273,
-2.892142, -3.242593, 6.140886,
3.643592, -3.242593, 6.140886,
-2.892142, 3.195172, -5.6273,
3.643592, 3.195172, -5.6273,
-2.892142, 3.195172, 6.140886,
3.643592, 3.195172, 6.140886,
3.643592, -3.242593, -5.6273,
3.643592, 3.195172, -5.6273,
3.643592, -3.242593, 6.140886,
3.643592, 3.195172, 6.140886,
3.643592, -3.242593, -5.6273,
3.643592, -3.242593, 6.140886,
3.643592, 3.195172, -5.6273,
3.643592, 3.195172, 6.140886
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
var radius = 7.967785;
var distance = 35.44958;
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
mvMatrix.translate( -0.3757248, 0.02371013, -0.256793 );
mvMatrix.scale( 1.318127, 1.338186, 0.7320521 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.44958);
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
Tiocarlide<-read.table("Tiocarlide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Tiocarlide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tiocarlide' not found
```

```r
y<-Tiocarlide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tiocarlide' not found
```

```r
z<-Tiocarlide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tiocarlide' not found
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
-2.796962, -1.774456, -2.984973, 0, 0, 1, 1, 1,
-2.713036, -2.138663, -2.964408, 1, 0, 0, 1, 1,
-2.68672, -0.6515888, -1.198247, 1, 0, 0, 1, 1,
-2.603713, -2.407352, -2.861274, 1, 0, 0, 1, 1,
-2.490112, -0.9079172, -1.822905, 1, 0, 0, 1, 1,
-2.429371, 0.326473, -2.489879, 1, 0, 0, 1, 1,
-2.375773, 0.2757039, 0.08356261, 0, 0, 0, 1, 1,
-2.254956, 0.9399593, -3.035586, 0, 0, 0, 1, 1,
-2.242902, 0.2704845, -3.159226, 0, 0, 0, 1, 1,
-2.216133, -0.2934227, -1.581677, 0, 0, 0, 1, 1,
-2.196014, -1.276892, -3.26687, 0, 0, 0, 1, 1,
-2.171248, 0.01474044, -2.424381, 0, 0, 0, 1, 1,
-2.166313, 1.107203, -1.178216, 0, 0, 0, 1, 1,
-2.140976, -0.3746018, -0.9844108, 1, 1, 1, 1, 1,
-2.140911, -0.4411621, -2.166893, 1, 1, 1, 1, 1,
-2.061689, -0.08056482, -0.9705505, 1, 1, 1, 1, 1,
-2.059942, -0.3827745, -0.5670195, 1, 1, 1, 1, 1,
-2.034269, 0.9224024, -1.470184, 1, 1, 1, 1, 1,
-2.020651, 0.547755, -1.02206, 1, 1, 1, 1, 1,
-1.983962, -1.349666, -1.319103, 1, 1, 1, 1, 1,
-1.972999, -0.2261501, -0.2287587, 1, 1, 1, 1, 1,
-1.962629, 0.874357, -2.307645, 1, 1, 1, 1, 1,
-1.960995, -1.487386, -2.164204, 1, 1, 1, 1, 1,
-1.957169, 0.808649, -1.836635, 1, 1, 1, 1, 1,
-1.916728, -0.8069004, -2.28214, 1, 1, 1, 1, 1,
-1.897661, -1.536307, -2.92178, 1, 1, 1, 1, 1,
-1.878295, 2.679219, -0.9065509, 1, 1, 1, 1, 1,
-1.875314, -0.422278, -2.928628, 1, 1, 1, 1, 1,
-1.869673, 1.869044, -0.6993508, 0, 0, 1, 1, 1,
-1.825772, -0.4960391, -1.643124, 1, 0, 0, 1, 1,
-1.809071, 1.358994, 0.5604798, 1, 0, 0, 1, 1,
-1.80714, -1.802704, -3.477488, 1, 0, 0, 1, 1,
-1.800549, -0.6511101, -1.855626, 1, 0, 0, 1, 1,
-1.79999, 0.334231, -1.509177, 1, 0, 0, 1, 1,
-1.794511, -1.771528, -3.084633, 0, 0, 0, 1, 1,
-1.786258, -1.131101, -3.444676, 0, 0, 0, 1, 1,
-1.784311, -0.703808, -2.099605, 0, 0, 0, 1, 1,
-1.770351, -0.1217223, -0.0844193, 0, 0, 0, 1, 1,
-1.766235, 1.315731, -0.1463429, 0, 0, 0, 1, 1,
-1.755685, 0.4709538, 0.1367478, 0, 0, 0, 1, 1,
-1.745009, -0.4806183, -1.363378, 0, 0, 0, 1, 1,
-1.731108, 1.831676, -0.439763, 1, 1, 1, 1, 1,
-1.716844, -0.2951532, -0.02518672, 1, 1, 1, 1, 1,
-1.700096, 1.131612, -1.116836, 1, 1, 1, 1, 1,
-1.687035, -0.8639691, 0.9217361, 1, 1, 1, 1, 1,
-1.68124, -0.3267834, -0.9213043, 1, 1, 1, 1, 1,
-1.666753, -0.6838182, -1.951404, 1, 1, 1, 1, 1,
-1.666049, 0.7984416, 0.4507804, 1, 1, 1, 1, 1,
-1.661011, 0.6301296, -1.022251, 1, 1, 1, 1, 1,
-1.659211, -0.1998037, -0.3774894, 1, 1, 1, 1, 1,
-1.655637, -0.9449552, -0.7060268, 1, 1, 1, 1, 1,
-1.643344, 0.1726834, -2.507439, 1, 1, 1, 1, 1,
-1.642452, 0.7007605, -0.9611702, 1, 1, 1, 1, 1,
-1.641585, 0.807799, -0.3192542, 1, 1, 1, 1, 1,
-1.623463, 0.7567735, -0.5799662, 1, 1, 1, 1, 1,
-1.610938, 1.567475, -1.806925, 1, 1, 1, 1, 1,
-1.598561, 1.34085, -0.2563201, 0, 0, 1, 1, 1,
-1.589357, -0.7102671, -3.549003, 1, 0, 0, 1, 1,
-1.589331, 1.129303, -0.5601367, 1, 0, 0, 1, 1,
-1.582299, -0.08602029, -3.861645, 1, 0, 0, 1, 1,
-1.572281, -0.6020902, -2.091805, 1, 0, 0, 1, 1,
-1.570409, 0.08779943, -2.033154, 1, 0, 0, 1, 1,
-1.563019, -0.1387028, -2.616503, 0, 0, 0, 1, 1,
-1.560097, 1.204911, 0.3178608, 0, 0, 0, 1, 1,
-1.550904, 1.156256, -0.6491796, 0, 0, 0, 1, 1,
-1.547398, -0.954356, -3.222691, 0, 0, 0, 1, 1,
-1.54046, -1.128115, -3.586822, 0, 0, 0, 1, 1,
-1.530388, -1.415676, -1.973929, 0, 0, 0, 1, 1,
-1.513475, -0.8248886, -3.508031, 0, 0, 0, 1, 1,
-1.490546, -0.351799, -0.9212027, 1, 1, 1, 1, 1,
-1.48215, -0.7535145, -1.947134, 1, 1, 1, 1, 1,
-1.481409, -1.783411, -1.624366, 1, 1, 1, 1, 1,
-1.473808, -0.0352097, -0.4720263, 1, 1, 1, 1, 1,
-1.468891, -0.02474592, -3.001827, 1, 1, 1, 1, 1,
-1.463394, -0.6300873, -0.2814708, 1, 1, 1, 1, 1,
-1.458255, -1.491445, -2.229753, 1, 1, 1, 1, 1,
-1.454592, 0.6406378, -0.2267508, 1, 1, 1, 1, 1,
-1.448328, 0.5850771, -2.548491, 1, 1, 1, 1, 1,
-1.448051, 0.447211, -2.53373, 1, 1, 1, 1, 1,
-1.429874, -0.3181834, -0.38161, 1, 1, 1, 1, 1,
-1.429675, -1.656813, -0.6465704, 1, 1, 1, 1, 1,
-1.418387, 0.8828852, 0.9957415, 1, 1, 1, 1, 1,
-1.417416, -0.8682878, -1.073702, 1, 1, 1, 1, 1,
-1.41488, 0.1409695, -2.333204, 1, 1, 1, 1, 1,
-1.406538, -1.913525, -1.879797, 0, 0, 1, 1, 1,
-1.404701, -1.187774, -0.782122, 1, 0, 0, 1, 1,
-1.400354, -0.8572019, -1.025222, 1, 0, 0, 1, 1,
-1.398484, -0.2784764, -0.946797, 1, 0, 0, 1, 1,
-1.395536, 0.7931303, -1.654824, 1, 0, 0, 1, 1,
-1.361577, -0.1608423, 0.3743728, 1, 0, 0, 1, 1,
-1.356328, -1.708899, -3.653, 0, 0, 0, 1, 1,
-1.354989, -0.3600509, -1.728526, 0, 0, 0, 1, 1,
-1.348863, -0.5193757, -2.374571, 0, 0, 0, 1, 1,
-1.334062, 0.3098415, -1.118173, 0, 0, 0, 1, 1,
-1.32874, -0.9746498, -0.8975177, 0, 0, 0, 1, 1,
-1.32163, -1.239777, -3.428054, 0, 0, 0, 1, 1,
-1.31992, 0.572908, 0.2141498, 0, 0, 0, 1, 1,
-1.316224, -1.368911, -3.477339, 1, 1, 1, 1, 1,
-1.314337, 0.2052648, -2.284807, 1, 1, 1, 1, 1,
-1.303266, -0.4644383, -3.02255, 1, 1, 1, 1, 1,
-1.280448, -1.901512, -2.94949, 1, 1, 1, 1, 1,
-1.274206, 1.156263, 0.4472815, 1, 1, 1, 1, 1,
-1.273566, 1.173524, -0.1042065, 1, 1, 1, 1, 1,
-1.263225, -1.555305, -4.146717, 1, 1, 1, 1, 1,
-1.260671, 0.0004253201, -1.508973, 1, 1, 1, 1, 1,
-1.25834, -1.475384, -2.377327, 1, 1, 1, 1, 1,
-1.249302, 0.9460046, 0.7764161, 1, 1, 1, 1, 1,
-1.24392, -0.1224853, -1.615327, 1, 1, 1, 1, 1,
-1.230375, -0.2184626, -1.689097, 1, 1, 1, 1, 1,
-1.217496, 0.9339858, 1.055994, 1, 1, 1, 1, 1,
-1.217365, -0.9979309, -2.802689, 1, 1, 1, 1, 1,
-1.201497, 0.4035855, -1.295398, 1, 1, 1, 1, 1,
-1.199472, 0.02316124, -3.032986, 0, 0, 1, 1, 1,
-1.198474, -0.4294944, -0.5312117, 1, 0, 0, 1, 1,
-1.19501, -1.137761, -3.082995, 1, 0, 0, 1, 1,
-1.19445, -0.3199527, -1.087936, 1, 0, 0, 1, 1,
-1.194036, -0.9515042, -2.134041, 1, 0, 0, 1, 1,
-1.188423, 0.956433, -1.335354, 1, 0, 0, 1, 1,
-1.18028, 0.4827425, -0.8782899, 0, 0, 0, 1, 1,
-1.166236, -0.9196345, -1.367949, 0, 0, 0, 1, 1,
-1.165045, 1.304776, -1.349016, 0, 0, 0, 1, 1,
-1.161138, -1.218027, -3.619184, 0, 0, 0, 1, 1,
-1.151394, -1.466839, -2.876795, 0, 0, 0, 1, 1,
-1.15008, -0.07837955, -0.591911, 0, 0, 0, 1, 1,
-1.144619, 1.695676, -1.397045, 0, 0, 0, 1, 1,
-1.142922, 0.03973452, -2.502198, 1, 1, 1, 1, 1,
-1.13974, -1.426366, -2.987894, 1, 1, 1, 1, 1,
-1.138673, 0.3784436, -1.374098, 1, 1, 1, 1, 1,
-1.134884, -0.5746577, -1.169451, 1, 1, 1, 1, 1,
-1.124536, -2.355259, -2.69888, 1, 1, 1, 1, 1,
-1.120352, -1.648763, -4.379778, 1, 1, 1, 1, 1,
-1.118679, -0.4861133, -1.831747, 1, 1, 1, 1, 1,
-1.115464, -0.5225035, -0.3000129, 1, 1, 1, 1, 1,
-1.114961, -0.3419865, -2.550119, 1, 1, 1, 1, 1,
-1.113354, -1.378082, -1.342279, 1, 1, 1, 1, 1,
-1.109174, 2.299781, -1.035195, 1, 1, 1, 1, 1,
-1.104375, -0.154785, -2.266805, 1, 1, 1, 1, 1,
-1.102911, 1.114354, -1.581379, 1, 1, 1, 1, 1,
-1.099031, -1.637388, -2.423534, 1, 1, 1, 1, 1,
-1.098629, 1.045989, -0.5474143, 1, 1, 1, 1, 1,
-1.091207, -0.8858171, -1.092623, 0, 0, 1, 1, 1,
-1.083807, -3.148839, -3.642855, 1, 0, 0, 1, 1,
-1.080871, -0.7377975, -1.991578, 1, 0, 0, 1, 1,
-1.076028, -0.0126533, 1.014001, 1, 0, 0, 1, 1,
-1.07566, -0.6460392, -3.974872, 1, 0, 0, 1, 1,
-1.069563, 1.728936, -0.9296017, 1, 0, 0, 1, 1,
-1.061787, 1.275589, 0.127078, 0, 0, 0, 1, 1,
-1.060682, 0.5987262, 0.3188105, 0, 0, 0, 1, 1,
-1.057177, -1.564741, -3.722121, 0, 0, 0, 1, 1,
-1.057026, -0.4693028, -3.256875, 0, 0, 0, 1, 1,
-1.054487, -1.321915, -2.176462, 0, 0, 0, 1, 1,
-1.047389, -2.076012, -1.221376, 0, 0, 0, 1, 1,
-1.038963, 0.9747932, -0.02250312, 0, 0, 0, 1, 1,
-1.037397, -0.6464489, -2.819205, 1, 1, 1, 1, 1,
-1.02411, 0.582218, -0.9300672, 1, 1, 1, 1, 1,
-1.012201, 0.8511428, 0.8525234, 1, 1, 1, 1, 1,
-1.011213, -1.379814, -2.011968, 1, 1, 1, 1, 1,
-1.009248, 0.4923391, -2.533652, 1, 1, 1, 1, 1,
-1.005285, 0.8202263, -0.3134229, 1, 1, 1, 1, 1,
-1.005158, -0.04047635, -2.050938, 1, 1, 1, 1, 1,
-1.00106, -0.1265126, -2.551841, 1, 1, 1, 1, 1,
-0.9945081, -0.616526, -3.007255, 1, 1, 1, 1, 1,
-0.9932003, 0.2812117, 0.03625287, 1, 1, 1, 1, 1,
-0.9878512, -0.4741578, -3.333969, 1, 1, 1, 1, 1,
-0.9875431, 0.6450849, 0.6707914, 1, 1, 1, 1, 1,
-0.9806586, 0.2795361, -2.16102, 1, 1, 1, 1, 1,
-0.97852, 0.03310416, -3.45573, 1, 1, 1, 1, 1,
-0.9771487, -0.08920411, -1.415572, 1, 1, 1, 1, 1,
-0.9741022, 0.5581776, -1.135109, 0, 0, 1, 1, 1,
-0.9663721, 0.1183441, -2.172976, 1, 0, 0, 1, 1,
-0.9622572, -1.494952, -2.526538, 1, 0, 0, 1, 1,
-0.9621165, -0.6512601, -3.451693, 1, 0, 0, 1, 1,
-0.9582181, -0.7700449, -3.108443, 1, 0, 0, 1, 1,
-0.9550926, -0.1575405, -1.346375, 1, 0, 0, 1, 1,
-0.9538429, -0.3624609, -3.350207, 0, 0, 0, 1, 1,
-0.9536469, -2.375919, -2.124832, 0, 0, 0, 1, 1,
-0.9508475, -2.149387, -3.697749, 0, 0, 0, 1, 1,
-0.9507972, 1.247547, -0.6506116, 0, 0, 0, 1, 1,
-0.9476057, -0.4841325, -1.597201, 0, 0, 0, 1, 1,
-0.9417865, 0.1121254, -1.922571, 0, 0, 0, 1, 1,
-0.9390665, 0.2103694, -1.720294, 0, 0, 0, 1, 1,
-0.9339692, -0.1801399, -1.085704, 1, 1, 1, 1, 1,
-0.9279687, 0.4930473, -0.6038731, 1, 1, 1, 1, 1,
-0.9265009, 0.446985, -2.52514, 1, 1, 1, 1, 1,
-0.9173214, 0.2089396, -0.5856537, 1, 1, 1, 1, 1,
-0.9117578, 0.328172, -1.921521, 1, 1, 1, 1, 1,
-0.9110383, 0.05920899, -0.007318812, 1, 1, 1, 1, 1,
-0.8993607, -1.784907, -3.636748, 1, 1, 1, 1, 1,
-0.8910064, 0.1399781, -0.0801037, 1, 1, 1, 1, 1,
-0.8899423, -0.241426, -2.559093, 1, 1, 1, 1, 1,
-0.8840374, -0.1882684, -1.262158, 1, 1, 1, 1, 1,
-0.8834005, 0.1218662, -1.090291, 1, 1, 1, 1, 1,
-0.8732064, 0.991467, -1.57926, 1, 1, 1, 1, 1,
-0.8661796, 0.2301128, -1.684048, 1, 1, 1, 1, 1,
-0.8573436, -0.6689475, -2.118924, 1, 1, 1, 1, 1,
-0.8477134, 0.7043756, -2.177838, 1, 1, 1, 1, 1,
-0.833993, 1.051945, -0.7249662, 0, 0, 1, 1, 1,
-0.8326756, 1.151881, 0.6494316, 1, 0, 0, 1, 1,
-0.8302377, 1.241237, -1.340425, 1, 0, 0, 1, 1,
-0.8210046, 0.1500556, -0.4266571, 1, 0, 0, 1, 1,
-0.8209327, 1.425131, -1.430428, 1, 0, 0, 1, 1,
-0.8185178, 0.2018015, -1.89426, 1, 0, 0, 1, 1,
-0.8179356, 0.1950201, -0.7241328, 0, 0, 0, 1, 1,
-0.8175663, 0.4044176, -0.6285155, 0, 0, 0, 1, 1,
-0.8075323, 0.3347277, 2.138343, 0, 0, 0, 1, 1,
-0.8068604, -1.031211, -1.361576, 0, 0, 0, 1, 1,
-0.7968605, 1.324194, -1.068609, 0, 0, 0, 1, 1,
-0.7912509, 1.208451, -2.595882, 0, 0, 0, 1, 1,
-0.7899518, 0.917813, -1.159004, 0, 0, 0, 1, 1,
-0.7878088, -0.1590012, -2.229192, 1, 1, 1, 1, 1,
-0.7865778, -1.144512, -2.126915, 1, 1, 1, 1, 1,
-0.785069, -1.421412, -2.900729, 1, 1, 1, 1, 1,
-0.7850427, -0.9039916, -4.113795, 1, 1, 1, 1, 1,
-0.7799997, -0.3249816, -0.9844269, 1, 1, 1, 1, 1,
-0.7787806, -0.5606972, -1.147864, 1, 1, 1, 1, 1,
-0.7775161, -2.08279, -3.221591, 1, 1, 1, 1, 1,
-0.771278, 0.1510302, -0.1956115, 1, 1, 1, 1, 1,
-0.769236, -1.20881, -3.039918, 1, 1, 1, 1, 1,
-0.7651345, -1.40902, -2.127476, 1, 1, 1, 1, 1,
-0.7600822, -0.003046799, -0.8503727, 1, 1, 1, 1, 1,
-0.7592531, 1.571879, 0.2998946, 1, 1, 1, 1, 1,
-0.7590939, -0.3099571, -1.435563, 1, 1, 1, 1, 1,
-0.7553756, 2.493266, 0.3134715, 1, 1, 1, 1, 1,
-0.7420993, 0.7008513, -1.655087, 1, 1, 1, 1, 1,
-0.7408456, 0.1111002, -2.325721, 0, 0, 1, 1, 1,
-0.7400019, 0.7356707, 0.5658377, 1, 0, 0, 1, 1,
-0.7386874, -0.9770275, -2.521078, 1, 0, 0, 1, 1,
-0.7366861, -0.1913369, -1.977512, 1, 0, 0, 1, 1,
-0.7366254, -0.04953652, -1.536759, 1, 0, 0, 1, 1,
-0.7205411, 1.143747, 1.184551, 1, 0, 0, 1, 1,
-0.7189654, -1.095591, -3.547653, 0, 0, 0, 1, 1,
-0.7137947, -2.412081, -4.33417, 0, 0, 0, 1, 1,
-0.7124918, 0.3128834, -1.633133, 0, 0, 0, 1, 1,
-0.6969783, -0.6410792, -0.5831895, 0, 0, 0, 1, 1,
-0.6944599, -0.7338153, -1.102252, 0, 0, 0, 1, 1,
-0.6939627, -0.09432281, -1.081513, 0, 0, 0, 1, 1,
-0.6892458, 0.4378756, -0.900512, 0, 0, 0, 1, 1,
-0.6863611, -1.174245, -2.432072, 1, 1, 1, 1, 1,
-0.6799179, -0.06568027, -1.388928, 1, 1, 1, 1, 1,
-0.6651627, 0.8001463, -0.09495234, 1, 1, 1, 1, 1,
-0.6616946, 1.178065, -1.19723, 1, 1, 1, 1, 1,
-0.659577, -0.6911799, -0.719588, 1, 1, 1, 1, 1,
-0.6578305, 1.579014, -0.9255727, 1, 1, 1, 1, 1,
-0.6568708, 0.1098082, -2.141357, 1, 1, 1, 1, 1,
-0.6559813, -0.06696685, -1.981435, 1, 1, 1, 1, 1,
-0.6432702, -0.6495427, -3.579265, 1, 1, 1, 1, 1,
-0.6377333, 0.9869227, -0.9085488, 1, 1, 1, 1, 1,
-0.6301815, -1.489139, -3.927246, 1, 1, 1, 1, 1,
-0.6287396, 0.06007259, -2.479265, 1, 1, 1, 1, 1,
-0.6279253, -0.08741061, -0.9611725, 1, 1, 1, 1, 1,
-0.623994, -0.9023141, -2.411197, 1, 1, 1, 1, 1,
-0.62393, 0.6856398, 1.723781, 1, 1, 1, 1, 1,
-0.6236438, -0.6408334, -4.357754, 0, 0, 1, 1, 1,
-0.6230091, 1.159277, -2.230437, 1, 0, 0, 1, 1,
-0.6216249, 0.7175815, -1.414065, 1, 0, 0, 1, 1,
-0.6209168, -0.3466843, -2.047302, 1, 0, 0, 1, 1,
-0.619363, 0.1221004, -1.203468, 1, 0, 0, 1, 1,
-0.619191, 0.118949, -0.6232036, 1, 0, 0, 1, 1,
-0.6186352, 0.1052382, -2.930402, 0, 0, 0, 1, 1,
-0.6173955, 0.3736765, -1.628569, 0, 0, 0, 1, 1,
-0.6156728, -0.1057625, -0.8820785, 0, 0, 0, 1, 1,
-0.6132339, -0.5703245, -2.645027, 0, 0, 0, 1, 1,
-0.6064577, -0.9808553, -2.82247, 0, 0, 0, 1, 1,
-0.6043364, 1.077465, 0.5155376, 0, 0, 0, 1, 1,
-0.6037077, -1.872542, -2.997189, 0, 0, 0, 1, 1,
-0.603273, -0.9626241, -3.962905, 1, 1, 1, 1, 1,
-0.5999888, -0.01215646, -1.857508, 1, 1, 1, 1, 1,
-0.5985824, -0.4263344, -0.8518116, 1, 1, 1, 1, 1,
-0.590438, -2.305288, -2.959896, 1, 1, 1, 1, 1,
-0.5885556, 0.5478973, 0.72285, 1, 1, 1, 1, 1,
-0.5823349, 0.3599414, -2.522211, 1, 1, 1, 1, 1,
-0.5797506, 0.2831001, 0.3295716, 1, 1, 1, 1, 1,
-0.5690451, -0.7394094, -3.083118, 1, 1, 1, 1, 1,
-0.5665253, -0.9730102, -1.279951, 1, 1, 1, 1, 1,
-0.5639487, 1.907319, -1.408354, 1, 1, 1, 1, 1,
-0.5610558, -0.8459897, -4.876599, 1, 1, 1, 1, 1,
-0.557757, 0.7079536, -2.317088, 1, 1, 1, 1, 1,
-0.557595, -0.6026136, -3.47699, 1, 1, 1, 1, 1,
-0.5565925, 0.1932563, -0.1439141, 1, 1, 1, 1, 1,
-0.5456404, -0.9192544, -5.455918, 1, 1, 1, 1, 1,
-0.5415129, -0.1412897, -2.552566, 0, 0, 1, 1, 1,
-0.5205227, -2.76826, -3.614599, 1, 0, 0, 1, 1,
-0.5192878, 0.3986361, 1.141006, 1, 0, 0, 1, 1,
-0.5104619, -0.2353691, -2.054847, 1, 0, 0, 1, 1,
-0.5078294, -0.597385, -1.551958, 1, 0, 0, 1, 1,
-0.5073282, -0.9931161, -2.935079, 1, 0, 0, 1, 1,
-0.5045589, 1.385435, -0.3803363, 0, 0, 0, 1, 1,
-0.497823, -0.005739839, -1.283782, 0, 0, 0, 1, 1,
-0.4939651, -1.1131, -1.408461, 0, 0, 0, 1, 1,
-0.4884416, -0.7459874, -1.72773, 0, 0, 0, 1, 1,
-0.4880404, 2.293974, 1.253583, 0, 0, 0, 1, 1,
-0.4866097, 1.673041, 0.3883068, 0, 0, 0, 1, 1,
-0.4747397, -1.129374, -3.286577, 0, 0, 0, 1, 1,
-0.4740167, -0.4507619, -2.353656, 1, 1, 1, 1, 1,
-0.4707526, -0.7862881, -2.274742, 1, 1, 1, 1, 1,
-0.4693984, 1.950006, -1.434405, 1, 1, 1, 1, 1,
-0.4646587, -1.634761, -1.496705, 1, 1, 1, 1, 1,
-0.4618452, -0.5004175, -3.366863, 1, 1, 1, 1, 1,
-0.4602249, -0.5817322, -2.234288, 1, 1, 1, 1, 1,
-0.4567378, 0.5386593, -2.073604, 1, 1, 1, 1, 1,
-0.4559067, 3.035327, -1.521841, 1, 1, 1, 1, 1,
-0.4542566, -0.3294339, -0.6742778, 1, 1, 1, 1, 1,
-0.4534367, 0.7023821, 0.5557739, 1, 1, 1, 1, 1,
-0.4481134, -1.439861, -3.517675, 1, 1, 1, 1, 1,
-0.4422674, -0.2161811, -2.848435, 1, 1, 1, 1, 1,
-0.4367406, 1.377629, -0.708749, 1, 1, 1, 1, 1,
-0.425598, -0.003433647, -0.8414717, 1, 1, 1, 1, 1,
-0.4241879, 0.8025368, -0.7168124, 1, 1, 1, 1, 1,
-0.4212311, 0.1739875, -1.893868, 0, 0, 1, 1, 1,
-0.4196043, -1.008163, -3.674619, 1, 0, 0, 1, 1,
-0.4166856, 0.4184995, -1.104609, 1, 0, 0, 1, 1,
-0.4153523, -0.5739377, -1.637108, 1, 0, 0, 1, 1,
-0.415323, 0.797987, -0.4561221, 1, 0, 0, 1, 1,
-0.4126202, -0.1236204, -2.209358, 1, 0, 0, 1, 1,
-0.4125085, -1.268439, -4.37688, 0, 0, 0, 1, 1,
-0.4114298, 1.23093, -0.2573245, 0, 0, 0, 1, 1,
-0.4114078, -1.119576, -3.656563, 0, 0, 0, 1, 1,
-0.4095547, -1.248674, -2.596807, 0, 0, 0, 1, 1,
-0.4072164, -1.399177, -1.934366, 0, 0, 0, 1, 1,
-0.4063096, -0.6825203, -2.672891, 0, 0, 0, 1, 1,
-0.4046376, 0.9877354, -0.4199127, 0, 0, 0, 1, 1,
-0.3980476, -0.2205149, -2.172257, 1, 1, 1, 1, 1,
-0.3969612, 0.247554, -0.6020263, 1, 1, 1, 1, 1,
-0.3933403, -0.9651743, -2.411117, 1, 1, 1, 1, 1,
-0.3927546, 0.1905904, -0.353349, 1, 1, 1, 1, 1,
-0.3903554, -0.103532, -3.331172, 1, 1, 1, 1, 1,
-0.3839467, -0.6592579, -2.950371, 1, 1, 1, 1, 1,
-0.3838567, -1.017915, -1.665817, 1, 1, 1, 1, 1,
-0.3822296, -0.9608585, -4.002133, 1, 1, 1, 1, 1,
-0.3816948, 0.9096359, -1.731208, 1, 1, 1, 1, 1,
-0.3816239, 0.9724281, -0.7701477, 1, 1, 1, 1, 1,
-0.3793348, 0.2656256, -1.584601, 1, 1, 1, 1, 1,
-0.377586, -0.91779, -1.35168, 1, 1, 1, 1, 1,
-0.3763023, -0.4962743, -1.668214, 1, 1, 1, 1, 1,
-0.3728563, -0.5783113, -2.24221, 1, 1, 1, 1, 1,
-0.3708182, -0.2337372, -1.589155, 1, 1, 1, 1, 1,
-0.3669771, -0.1456732, -3.102859, 0, 0, 1, 1, 1,
-0.3640999, -1.013605, -2.218566, 1, 0, 0, 1, 1,
-0.3615543, 2.063013, -1.512733, 1, 0, 0, 1, 1,
-0.3610657, 0.8652912, -0.1567496, 1, 0, 0, 1, 1,
-0.3606327, 1.332294, -1.455727, 1, 0, 0, 1, 1,
-0.3599276, -0.1801204, -1.652453, 1, 0, 0, 1, 1,
-0.3560345, -0.1128775, -1.549058, 0, 0, 0, 1, 1,
-0.3515015, -2.042946, -3.479991, 0, 0, 0, 1, 1,
-0.3511499, -0.8968313, -4.367784, 0, 0, 0, 1, 1,
-0.3506358, -0.6712561, -2.736865, 0, 0, 0, 1, 1,
-0.3483624, -2.517487, -1.942759, 0, 0, 0, 1, 1,
-0.3459083, 1.379005, 0.7286807, 0, 0, 0, 1, 1,
-0.3450651, 0.1093306, -1.147965, 0, 0, 0, 1, 1,
-0.3351234, -2.359632, -3.398326, 1, 1, 1, 1, 1,
-0.3311214, 1.706252, -1.396342, 1, 1, 1, 1, 1,
-0.3278299, 0.015366, -2.085813, 1, 1, 1, 1, 1,
-0.324842, -0.84449, -4.257965, 1, 1, 1, 1, 1,
-0.3241195, -0.5918987, -1.776485, 1, 1, 1, 1, 1,
-0.3184217, 0.7488415, -0.8291838, 1, 1, 1, 1, 1,
-0.3172193, 0.4858409, -0.4323186, 1, 1, 1, 1, 1,
-0.3119147, -1.223816, -2.362219, 1, 1, 1, 1, 1,
-0.3104308, -1.201438, -0.8242305, 1, 1, 1, 1, 1,
-0.3101144, 0.599174, 0.0306883, 1, 1, 1, 1, 1,
-0.3064626, 1.27772, -0.05583483, 1, 1, 1, 1, 1,
-0.3052754, 0.9192593, -0.4045361, 1, 1, 1, 1, 1,
-0.3018872, 0.03296824, -1.464401, 1, 1, 1, 1, 1,
-0.3004282, -0.4210295, -2.321808, 1, 1, 1, 1, 1,
-0.2930323, 1.557309, -1.646338, 1, 1, 1, 1, 1,
-0.2917902, 0.09071229, -2.706576, 0, 0, 1, 1, 1,
-0.2899375, -0.3742211, -2.486567, 1, 0, 0, 1, 1,
-0.2868406, -2.027771, -1.530907, 1, 0, 0, 1, 1,
-0.2837547, 0.2542353, -0.6338578, 1, 0, 0, 1, 1,
-0.2829392, -0.7288637, -2.883157, 1, 0, 0, 1, 1,
-0.2769398, 0.1098881, -1.742935, 1, 0, 0, 1, 1,
-0.2724572, 0.9424288, 1.342751, 0, 0, 0, 1, 1,
-0.271942, -0.8285855, -2.654472, 0, 0, 0, 1, 1,
-0.2689328, 0.3494785, -0.6641333, 0, 0, 0, 1, 1,
-0.2677051, 0.1014367, -2.736708, 0, 0, 0, 1, 1,
-0.261729, -0.2818274, -2.562099, 0, 0, 0, 1, 1,
-0.2616253, 0.7058186, -0.5057913, 0, 0, 0, 1, 1,
-0.2575595, -0.3827154, -2.725212, 0, 0, 0, 1, 1,
-0.2504193, -0.2109726, -2.638834, 1, 1, 1, 1, 1,
-0.2447546, -0.9335948, -3.747082, 1, 1, 1, 1, 1,
-0.2422775, 0.6152743, 0.8705667, 1, 1, 1, 1, 1,
-0.2386163, -0.1679056, -2.372914, 1, 1, 1, 1, 1,
-0.2370862, 2.212523, -0.161436, 1, 1, 1, 1, 1,
-0.2367807, -1.323203, -1.928594, 1, 1, 1, 1, 1,
-0.2357593, -0.6258306, -2.233584, 1, 1, 1, 1, 1,
-0.2312073, 0.5987234, -1.104564, 1, 1, 1, 1, 1,
-0.2308473, 0.2454383, -0.9725662, 1, 1, 1, 1, 1,
-0.2287231, -0.5110424, -1.797456, 1, 1, 1, 1, 1,
-0.2269317, 0.1802631, -2.624718, 1, 1, 1, 1, 1,
-0.2250322, -0.4014343, -1.353147, 1, 1, 1, 1, 1,
-0.2178841, -0.3193521, -2.041605, 1, 1, 1, 1, 1,
-0.2141264, -1.664034, -1.652867, 1, 1, 1, 1, 1,
-0.2139128, -0.3780554, -1.496344, 1, 1, 1, 1, 1,
-0.2128121, -0.3286761, -3.11302, 0, 0, 1, 1, 1,
-0.1941569, -1.159227, -3.695497, 1, 0, 0, 1, 1,
-0.192946, 1.632459, -1.265869, 1, 0, 0, 1, 1,
-0.1909582, -0.7260007, -1.995716, 1, 0, 0, 1, 1,
-0.189282, 0.3918654, -0.7066429, 1, 0, 0, 1, 1,
-0.1880709, -0.7370928, -1.762191, 1, 0, 0, 1, 1,
-0.1840624, 0.8158914, -0.7999725, 0, 0, 0, 1, 1,
-0.1825916, 2.154466, 0.02226371, 0, 0, 0, 1, 1,
-0.1789141, -0.8762013, -0.738898, 0, 0, 0, 1, 1,
-0.1717851, -0.1716728, -2.087315, 0, 0, 0, 1, 1,
-0.167509, 0.2953317, -0.4410638, 0, 0, 0, 1, 1,
-0.1648382, -0.7907087, -3.308591, 0, 0, 0, 1, 1,
-0.1568143, 0.389797, -0.5773597, 0, 0, 0, 1, 1,
-0.1513876, -1.13684, -3.293246, 1, 1, 1, 1, 1,
-0.1505047, 1.597172, 0.5404377, 1, 1, 1, 1, 1,
-0.1491174, 0.5121927, -0.8635008, 1, 1, 1, 1, 1,
-0.1488786, 0.8217143, 0.2441031, 1, 1, 1, 1, 1,
-0.1470549, 0.4794734, 0.169186, 1, 1, 1, 1, 1,
-0.1449178, 0.2442918, -0.9873532, 1, 1, 1, 1, 1,
-0.1445841, 1.33643, 1.041705, 1, 1, 1, 1, 1,
-0.1440067, -1.82228, -3.983046, 1, 1, 1, 1, 1,
-0.1435949, -0.1713127, -2.326012, 1, 1, 1, 1, 1,
-0.1429856, 1.715045, 1.39586, 1, 1, 1, 1, 1,
-0.1333909, -0.2128605, -2.057918, 1, 1, 1, 1, 1,
-0.1324871, -0.2087588, -2.640911, 1, 1, 1, 1, 1,
-0.1299163, 0.217692, 1.247488, 1, 1, 1, 1, 1,
-0.1297727, -1.549827, -2.561071, 1, 1, 1, 1, 1,
-0.1277566, 0.1841131, -0.8220626, 1, 1, 1, 1, 1,
-0.1241356, -0.5029286, -1.51489, 0, 0, 1, 1, 1,
-0.1207901, 0.2874829, -0.2347119, 1, 0, 0, 1, 1,
-0.119719, 0.09022961, -1.527136, 1, 0, 0, 1, 1,
-0.1193844, -0.5285221, -2.628382, 1, 0, 0, 1, 1,
-0.1163012, -0.2078892, -3.941816, 1, 0, 0, 1, 1,
-0.1146371, 0.484311, 0.3506287, 1, 0, 0, 1, 1,
-0.1139744, 0.2277963, -0.5479743, 0, 0, 0, 1, 1,
-0.1039056, 0.7647107, -0.7928699, 0, 0, 0, 1, 1,
-0.1026861, 0.3526049, -0.4431279, 0, 0, 0, 1, 1,
-0.1022896, 0.8927703, -0.6648104, 0, 0, 0, 1, 1,
-0.1004251, 0.5137988, -0.2950928, 0, 0, 0, 1, 1,
-0.09969968, -0.2801759, -2.462628, 0, 0, 0, 1, 1,
-0.09901154, -1.186901, -0.9529474, 0, 0, 0, 1, 1,
-0.09642152, -0.005222651, -2.27731, 1, 1, 1, 1, 1,
-0.09390328, -1.342362, -2.812597, 1, 1, 1, 1, 1,
-0.09188446, 0.4977101, 0.8151054, 1, 1, 1, 1, 1,
-0.0906741, 1.134559, -0.7227002, 1, 1, 1, 1, 1,
-0.08859696, -0.4141245, -3.021845, 1, 1, 1, 1, 1,
-0.08828837, 0.549234, 0.4090826, 1, 1, 1, 1, 1,
-0.08266172, -0.302478, -3.580862, 1, 1, 1, 1, 1,
-0.07874956, -0.03389475, 0.2695864, 1, 1, 1, 1, 1,
-0.07268212, 0.6474841, -0.2237373, 1, 1, 1, 1, 1,
-0.0704945, 1.638081, -1.423844, 1, 1, 1, 1, 1,
-0.0682829, 0.4301771, -1.002437, 1, 1, 1, 1, 1,
-0.06732623, 1.471153, -0.6753903, 1, 1, 1, 1, 1,
-0.06728628, -0.4001419, -2.283162, 1, 1, 1, 1, 1,
-0.06692698, 1.086745, 0.6952952, 1, 1, 1, 1, 1,
-0.0660923, -0.2944902, -3.771905, 1, 1, 1, 1, 1,
-0.06241085, 0.3645441, -1.555865, 0, 0, 1, 1, 1,
-0.05637131, -0.3462485, -3.070841, 1, 0, 0, 1, 1,
-0.05482072, -0.5093576, -1.620554, 1, 0, 0, 1, 1,
-0.05352909, 0.2847727, 0.1200751, 1, 0, 0, 1, 1,
-0.04740484, -0.5768786, -2.178001, 1, 0, 0, 1, 1,
-0.04684471, -1.056653, -1.799324, 1, 0, 0, 1, 1,
-0.04674924, 0.6450921, -0.4340168, 0, 0, 0, 1, 1,
-0.04372822, -1.400254, -2.719179, 0, 0, 0, 1, 1,
-0.0359256, 0.7525771, -0.311221, 0, 0, 0, 1, 1,
-0.03314495, 0.3393661, -0.4268725, 0, 0, 0, 1, 1,
-0.03208842, 0.1981432, 0.4459232, 0, 0, 0, 1, 1,
-0.03165692, 0.2325622, -0.8905806, 0, 0, 0, 1, 1,
-0.03134754, -0.5812922, -4.061066, 0, 0, 0, 1, 1,
-0.03096294, 0.2461506, 1.790932, 1, 1, 1, 1, 1,
-0.02945632, 0.3174682, -0.1500514, 1, 1, 1, 1, 1,
-0.02825017, -0.9445226, -3.752718, 1, 1, 1, 1, 1,
-0.02644661, -0.7346971, -3.125302, 1, 1, 1, 1, 1,
-0.02555927, -0.5609601, -3.382526, 1, 1, 1, 1, 1,
-0.0241161, 0.08991047, -0.9336058, 1, 1, 1, 1, 1,
-0.02288339, -0.3301452, -2.379071, 1, 1, 1, 1, 1,
-0.02144026, 0.7516668, -0.7775164, 1, 1, 1, 1, 1,
-0.01863757, -0.3245001, -2.271103, 1, 1, 1, 1, 1,
-0.01739682, -1.65953, -2.29822, 1, 1, 1, 1, 1,
-0.0156125, 0.1909239, -0.383952, 1, 1, 1, 1, 1,
-0.01496397, -0.6509191, -1.89628, 1, 1, 1, 1, 1,
-0.01403086, 0.4739606, -0.1463173, 1, 1, 1, 1, 1,
-0.01356209, -0.2493334, -4.076215, 1, 1, 1, 1, 1,
-0.01270563, -0.496057, -0.9409571, 1, 1, 1, 1, 1,
-0.01258389, -0.2887329, -3.005319, 0, 0, 1, 1, 1,
-0.009273387, 0.4968405, 0.5412492, 1, 0, 0, 1, 1,
-0.008135595, -1.068971, -2.079256, 1, 0, 0, 1, 1,
-0.007965453, 0.1670125, -0.8190737, 1, 0, 0, 1, 1,
-0.007902801, -0.6095114, -3.519666, 1, 0, 0, 1, 1,
-0.007663797, 1.547303, -0.7875487, 1, 0, 0, 1, 1,
-0.001736869, 0.1186176, -1.230837, 0, 0, 0, 1, 1,
0.002451241, 1.537931, -0.2131208, 0, 0, 0, 1, 1,
0.01039591, -0.0859312, 3.581242, 0, 0, 0, 1, 1,
0.01237534, 0.138027, 1.271795, 0, 0, 0, 1, 1,
0.01360948, -1.999967, 3.159606, 0, 0, 0, 1, 1,
0.02189223, 0.8821991, -0.3464131, 0, 0, 0, 1, 1,
0.02272639, -1.019758, 4.569599, 0, 0, 0, 1, 1,
0.02378711, 1.428327, -0.4815437, 1, 1, 1, 1, 1,
0.02397693, 2.004002, 0.3520738, 1, 1, 1, 1, 1,
0.02438166, -0.4080116, 2.539549, 1, 1, 1, 1, 1,
0.02533637, -1.151849, 1.999465, 1, 1, 1, 1, 1,
0.03652255, 1.463095, 1.857064, 1, 1, 1, 1, 1,
0.04162649, -0.2728342, 2.850122, 1, 1, 1, 1, 1,
0.04426866, -0.8593016, 3.449194, 1, 1, 1, 1, 1,
0.04653703, -0.3956577, 3.263753, 1, 1, 1, 1, 1,
0.04732658, -0.6620834, 4.343352, 1, 1, 1, 1, 1,
0.05000437, 0.5980326, 0.4776748, 1, 1, 1, 1, 1,
0.05026126, -0.8897091, 4.486687, 1, 1, 1, 1, 1,
0.05090864, 0.6811441, -0.5070997, 1, 1, 1, 1, 1,
0.05258704, 0.81577, -0.5986863, 1, 1, 1, 1, 1,
0.06061112, 0.499536, 0.9956911, 1, 1, 1, 1, 1,
0.06194964, -1.234419, 3.169761, 1, 1, 1, 1, 1,
0.06396239, -1.141564, 3.648011, 0, 0, 1, 1, 1,
0.06832937, 0.6340597, 2.701272, 1, 0, 0, 1, 1,
0.06859175, -0.1483837, 1.756877, 1, 0, 0, 1, 1,
0.06933004, -1.68383, 2.894587, 1, 0, 0, 1, 1,
0.07386499, -0.5090935, 2.628603, 1, 0, 0, 1, 1,
0.07636642, 0.1237242, -1.548703, 1, 0, 0, 1, 1,
0.07802533, 2.656211, -0.2390965, 0, 0, 0, 1, 1,
0.07828553, 0.06390939, 2.070572, 0, 0, 0, 1, 1,
0.07843703, -0.8982231, 1.291741, 0, 0, 0, 1, 1,
0.08053669, -0.5883841, 3.708056, 0, 0, 0, 1, 1,
0.08224585, -0.8020927, 2.544717, 0, 0, 0, 1, 1,
0.08348988, 0.9286242, -0.8845052, 0, 0, 0, 1, 1,
0.09525066, 0.7839965, 2.144674, 0, 0, 0, 1, 1,
0.09670619, -0.5922663, 1.494879, 1, 1, 1, 1, 1,
0.09834845, 0.9519224, -0.03818902, 1, 1, 1, 1, 1,
0.09925843, -0.5790985, 3.088123, 1, 1, 1, 1, 1,
0.105767, -0.8586722, 1.669402, 1, 1, 1, 1, 1,
0.1063791, -0.877463, 2.517849, 1, 1, 1, 1, 1,
0.108408, -0.02919977, 1.765258, 1, 1, 1, 1, 1,
0.109943, 1.038043, 1.03668, 1, 1, 1, 1, 1,
0.1101639, 0.6584828, -1.344174, 1, 1, 1, 1, 1,
0.1146084, -1.072282, 5.969504, 1, 1, 1, 1, 1,
0.1148666, -0.01072657, 2.896499, 1, 1, 1, 1, 1,
0.1179846, -0.4603637, 2.714243, 1, 1, 1, 1, 1,
0.1227926, -2.033875, 3.203105, 1, 1, 1, 1, 1,
0.1242962, 0.9020711, -0.9711158, 1, 1, 1, 1, 1,
0.1290221, 1.121276, 1.200505, 1, 1, 1, 1, 1,
0.1292738, -0.1874907, 3.188187, 1, 1, 1, 1, 1,
0.1294693, 0.2881443, 0.3615793, 0, 0, 1, 1, 1,
0.1312982, -1.268277, 2.862107, 1, 0, 0, 1, 1,
0.1319676, -0.3260616, 2.173599, 1, 0, 0, 1, 1,
0.1347369, 1.072212, 2.259594, 1, 0, 0, 1, 1,
0.1348173, -1.369718, 2.437256, 1, 0, 0, 1, 1,
0.1349194, 0.5543545, 0.7263235, 1, 0, 0, 1, 1,
0.1375384, -0.4883086, 4.130294, 0, 0, 0, 1, 1,
0.1388073, -1.078729, 3.163291, 0, 0, 0, 1, 1,
0.1393897, -1.160675, 1.290091, 0, 0, 0, 1, 1,
0.1419564, 0.7707009, -1.139946, 0, 0, 0, 1, 1,
0.1473116, 1.50437, 0.361919, 0, 0, 0, 1, 1,
0.1483396, 1.929329, -0.4804079, 0, 0, 0, 1, 1,
0.1504797, 0.3030754, 1.89695, 0, 0, 0, 1, 1,
0.1518075, 0.880296, 0.2181525, 1, 1, 1, 1, 1,
0.1563001, 0.1846067, 0.8278456, 1, 1, 1, 1, 1,
0.1563121, 1.632911, -2.485509, 1, 1, 1, 1, 1,
0.1631459, -1.006552, 1.598715, 1, 1, 1, 1, 1,
0.1646608, 0.8873566, -0.6638467, 1, 1, 1, 1, 1,
0.1657494, 1.273633, -0.1202014, 1, 1, 1, 1, 1,
0.1668384, -0.1931198, 2.657234, 1, 1, 1, 1, 1,
0.1670454, -0.1775827, 1.082283, 1, 1, 1, 1, 1,
0.1683048, -0.0242358, 1.988548, 1, 1, 1, 1, 1,
0.17419, 0.362855, 4.229321, 1, 1, 1, 1, 1,
0.1744257, -1.967054, 1.76006, 1, 1, 1, 1, 1,
0.176335, 1.607041, 2.512344, 1, 1, 1, 1, 1,
0.181375, -1.674816, 1.484111, 1, 1, 1, 1, 1,
0.1833967, -0.2269016, 1.345236, 1, 1, 1, 1, 1,
0.1857224, -0.4616319, 2.888608, 1, 1, 1, 1, 1,
0.1879677, -0.9076111, 2.89528, 0, 0, 1, 1, 1,
0.1882409, 1.539006, 0.7912154, 1, 0, 0, 1, 1,
0.189658, 0.3396112, 0.09589607, 1, 0, 0, 1, 1,
0.1897111, 0.2061935, 1.884589, 1, 0, 0, 1, 1,
0.1908512, -0.2350644, 1.13242, 1, 0, 0, 1, 1,
0.1909536, -1.067559, 0.7058347, 1, 0, 0, 1, 1,
0.1928875, 1.702285, 0.526172, 0, 0, 0, 1, 1,
0.1945149, 2.129483, -0.669566, 0, 0, 0, 1, 1,
0.2046565, 0.9744555, 0.5043447, 0, 0, 0, 1, 1,
0.2182721, -0.62858, 2.625112, 0, 0, 0, 1, 1,
0.2221477, -1.999356, 2.265455, 0, 0, 0, 1, 1,
0.2292861, 1.971568, 0.8837228, 0, 0, 0, 1, 1,
0.2334047, 0.6718433, 0.1860638, 0, 0, 0, 1, 1,
0.234397, 1.075349, -0.4143827, 1, 1, 1, 1, 1,
0.2350038, 1.238428, -0.2198797, 1, 1, 1, 1, 1,
0.2362006, -1.011791, 2.380407, 1, 1, 1, 1, 1,
0.2398973, -1.504038, 1.665087, 1, 1, 1, 1, 1,
0.2417087, 0.4873783, -0.0996667, 1, 1, 1, 1, 1,
0.2440767, 0.9460247, 1.311936, 1, 1, 1, 1, 1,
0.245354, -0.9865568, 3.24403, 1, 1, 1, 1, 1,
0.2480919, 0.4766479, 1.129499, 1, 1, 1, 1, 1,
0.2535539, 0.1006569, 1.489778, 1, 1, 1, 1, 1,
0.2620744, -0.4007943, 4.409367, 1, 1, 1, 1, 1,
0.2624591, -0.5150902, 2.174851, 1, 1, 1, 1, 1,
0.2657746, -0.3651026, 4.254769, 1, 1, 1, 1, 1,
0.2673199, -0.7964481, 2.236773, 1, 1, 1, 1, 1,
0.2781257, 0.3902255, 0.1958714, 1, 1, 1, 1, 1,
0.2806452, 0.1770781, 0.4027213, 1, 1, 1, 1, 1,
0.2811386, -0.8347406, 1.824896, 0, 0, 1, 1, 1,
0.2821354, 0.6663129, 0.7188252, 1, 0, 0, 1, 1,
0.287217, -0.6540772, 3.648423, 1, 0, 0, 1, 1,
0.2881579, 0.8330634, 0.7838778, 1, 0, 0, 1, 1,
0.2886571, 0.04412308, 3.52203, 1, 0, 0, 1, 1,
0.2937176, 0.7022796, 2.108829, 1, 0, 0, 1, 1,
0.2945716, 1.09244, 0.7668884, 0, 0, 0, 1, 1,
0.2959392, -0.5425493, 3.95961, 0, 0, 0, 1, 1,
0.297453, -1.225346, 1.696894, 0, 0, 0, 1, 1,
0.3027277, 0.9037904, 0.3438857, 0, 0, 0, 1, 1,
0.3059921, 0.7358919, 1.126689, 0, 0, 0, 1, 1,
0.3082379, -0.9006485, 4.592189, 0, 0, 0, 1, 1,
0.3204144, 0.4349153, -0.3696743, 0, 0, 0, 1, 1,
0.32391, -0.7379429, 4.07661, 1, 1, 1, 1, 1,
0.3298356, 1.325944, 1.074136, 1, 1, 1, 1, 1,
0.3326364, -1.164865, 3.346105, 1, 1, 1, 1, 1,
0.3380437, 1.469409, -0.914739, 1, 1, 1, 1, 1,
0.3387599, -0.699478, 2.577006, 1, 1, 1, 1, 1,
0.3395253, 0.4544783, 0.8230312, 1, 1, 1, 1, 1,
0.3519673, -0.1502512, -1.300504, 1, 1, 1, 1, 1,
0.3529464, -0.3633853, 3.878056, 1, 1, 1, 1, 1,
0.3549366, -0.741374, 2.830043, 1, 1, 1, 1, 1,
0.3733252, -0.9658834, 1.461012, 1, 1, 1, 1, 1,
0.3737296, 1.641075, -0.4888605, 1, 1, 1, 1, 1,
0.3771622, -0.5319555, 2.784668, 1, 1, 1, 1, 1,
0.3780128, -1.305471, 1.65865, 1, 1, 1, 1, 1,
0.3784229, -0.5342861, 3.165776, 1, 1, 1, 1, 1,
0.3811478, 0.2745095, -0.3473338, 1, 1, 1, 1, 1,
0.3817175, 0.7214927, 0.03093525, 0, 0, 1, 1, 1,
0.3821809, -1.071931, 2.758471, 1, 0, 0, 1, 1,
0.3838318, -0.5677956, 3.169298, 1, 0, 0, 1, 1,
0.3900694, -0.3551317, 2.393767, 1, 0, 0, 1, 1,
0.3907971, -1.392957, 0.4158777, 1, 0, 0, 1, 1,
0.3911752, 1.755051, -0.1751728, 1, 0, 0, 1, 1,
0.3992076, -0.1157891, 2.022121, 0, 0, 0, 1, 1,
0.3992877, 2.082454, 1.059624, 0, 0, 0, 1, 1,
0.4022246, 0.9405365, 0.1341206, 0, 0, 0, 1, 1,
0.4035892, 0.6002349, -0.5539068, 0, 0, 0, 1, 1,
0.4056398, -1.102781, 2.323267, 0, 0, 0, 1, 1,
0.4061326, -0.09687194, 1.421867, 0, 0, 0, 1, 1,
0.4068451, 0.1086431, 2.551527, 0, 0, 0, 1, 1,
0.410143, -1.150885, 5.637371, 1, 1, 1, 1, 1,
0.4171845, 0.6740061, -0.5207, 1, 1, 1, 1, 1,
0.4208753, -1.450204, 2.61714, 1, 1, 1, 1, 1,
0.4211307, -1.551965, 3.8774, 1, 1, 1, 1, 1,
0.4231403, 0.330568, 0.497948, 1, 1, 1, 1, 1,
0.4292161, -0.07322151, 2.978873, 1, 1, 1, 1, 1,
0.4312846, -2.082498, 4.901861, 1, 1, 1, 1, 1,
0.4366497, -0.1023738, -0.08757985, 1, 1, 1, 1, 1,
0.438721, -1.190059, 3.18352, 1, 1, 1, 1, 1,
0.4403403, 0.4800661, -0.3269874, 1, 1, 1, 1, 1,
0.4506066, -0.1190152, 3.142853, 1, 1, 1, 1, 1,
0.4507718, -0.7721086, 2.433927, 1, 1, 1, 1, 1,
0.4537488, -2.073271, 4.910464, 1, 1, 1, 1, 1,
0.457496, 0.2805115, -0.2520406, 1, 1, 1, 1, 1,
0.4589673, 0.8103427, -1.429762, 1, 1, 1, 1, 1,
0.4623483, -0.5223298, 0.9771442, 0, 0, 1, 1, 1,
0.4643996, -0.8937165, 3.464556, 1, 0, 0, 1, 1,
0.4648399, 1.324634, 0.05058879, 1, 0, 0, 1, 1,
0.4685746, -2.3765, 2.351783, 1, 0, 0, 1, 1,
0.4719092, -0.09660658, 0.2798418, 1, 0, 0, 1, 1,
0.4759016, 1.907272, 0.948124, 1, 0, 0, 1, 1,
0.4783499, 0.1795527, 0.1778807, 0, 0, 0, 1, 1,
0.4798439, 0.9338291, 0.7045262, 0, 0, 0, 1, 1,
0.4810116, 0.6360859, -0.2439699, 0, 0, 0, 1, 1,
0.4839341, 1.257383, -0.6337276, 0, 0, 0, 1, 1,
0.4839672, -0.5727778, 1.2508, 0, 0, 0, 1, 1,
0.4885076, -0.08029838, 2.663013, 0, 0, 0, 1, 1,
0.488574, -1.726345, 2.881128, 0, 0, 0, 1, 1,
0.4932793, 1.135143, -0.1252642, 1, 1, 1, 1, 1,
0.4973211, 0.5038813, 0.2743744, 1, 1, 1, 1, 1,
0.501641, -0.3263539, 2.719254, 1, 1, 1, 1, 1,
0.5044985, 0.2165025, 0.9749791, 1, 1, 1, 1, 1,
0.5056754, 1.358724, 1.119135, 1, 1, 1, 1, 1,
0.5078158, 0.461585, 1.215659, 1, 1, 1, 1, 1,
0.5078731, 1.398036, 0.2945034, 1, 1, 1, 1, 1,
0.5122303, 1.056216, 1.257043, 1, 1, 1, 1, 1,
0.5138815, -0.5998805, 2.013963, 1, 1, 1, 1, 1,
0.5147135, 0.3323134, 0.6024822, 1, 1, 1, 1, 1,
0.5210978, -0.9530021, 2.475246, 1, 1, 1, 1, 1,
0.5214278, 0.1338431, 2.019709, 1, 1, 1, 1, 1,
0.5221576, 1.49664, 1.003985, 1, 1, 1, 1, 1,
0.5247474, -0.355118, 3.24702, 1, 1, 1, 1, 1,
0.5251472, 1.497614, -0.1311499, 1, 1, 1, 1, 1,
0.5269758, -0.6159555, 0.3673171, 0, 0, 1, 1, 1,
0.5279655, 0.9564955, 1.212626, 1, 0, 0, 1, 1,
0.5311069, -1.75584, 4.360148, 1, 0, 0, 1, 1,
0.538864, 1.837452, -0.4662654, 1, 0, 0, 1, 1,
0.5437235, -0.6554307, 3.023112, 1, 0, 0, 1, 1,
0.5445586, 1.357914, -0.09132265, 1, 0, 0, 1, 1,
0.5445749, -1.511077, 2.678333, 0, 0, 0, 1, 1,
0.5484556, -0.05580841, 3.18009, 0, 0, 0, 1, 1,
0.5517154, -0.03235889, 3.311846, 0, 0, 0, 1, 1,
0.566519, 0.2599064, 1.777724, 0, 0, 0, 1, 1,
0.5671839, -0.2303773, 2.86146, 0, 0, 0, 1, 1,
0.5696687, -1.0862, 1.928108, 0, 0, 0, 1, 1,
0.5711324, -1.66746, 2.401872, 0, 0, 0, 1, 1,
0.5721243, 0.282288, 2.29591, 1, 1, 1, 1, 1,
0.5726885, -0.0145902, 2.066303, 1, 1, 1, 1, 1,
0.5760903, 0.1648256, 0.9771107, 1, 1, 1, 1, 1,
0.5762595, 0.4450781, 0.5169293, 1, 1, 1, 1, 1,
0.5790871, 1.101111, 0.346459, 1, 1, 1, 1, 1,
0.5825407, -0.4156575, 3.069154, 1, 1, 1, 1, 1,
0.5826221, -1.744338, 2.850349, 1, 1, 1, 1, 1,
0.5845674, 0.1345886, 0.164802, 1, 1, 1, 1, 1,
0.5852695, 0.1660669, 0.4118719, 1, 1, 1, 1, 1,
0.5898638, 1.389108, 0.3014658, 1, 1, 1, 1, 1,
0.5904983, -1.172457, 2.271873, 1, 1, 1, 1, 1,
0.5941971, -1.352883, 2.955323, 1, 1, 1, 1, 1,
0.5949545, 1.436108, -3.522482, 1, 1, 1, 1, 1,
0.5976542, 0.456709, 1.53715, 1, 1, 1, 1, 1,
0.6037949, 0.774247, -0.3124305, 1, 1, 1, 1, 1,
0.6168976, 4.908906e-05, 2.203485, 0, 0, 1, 1, 1,
0.6195961, 0.7111605, -0.4156338, 1, 0, 0, 1, 1,
0.6206935, -1.144226, 2.1383, 1, 0, 0, 1, 1,
0.623614, -0.6080735, 2.005939, 1, 0, 0, 1, 1,
0.6238218, 0.5529187, -1.485834, 1, 0, 0, 1, 1,
0.6273332, 0.4571081, 1.965467, 1, 0, 0, 1, 1,
0.6283438, 0.4616638, -0.5353419, 0, 0, 0, 1, 1,
0.6340892, 0.04334361, 1.227476, 0, 0, 0, 1, 1,
0.6365858, -0.3040887, 2.715178, 0, 0, 0, 1, 1,
0.6380421, -0.2269121, 2.550652, 0, 0, 0, 1, 1,
0.6381921, 0.5507478, 0.5151595, 0, 0, 0, 1, 1,
0.6406525, -0.133168, 1.485001, 0, 0, 0, 1, 1,
0.6419826, 0.7103512, 0.6399054, 0, 0, 0, 1, 1,
0.6422811, -1.240124, 3.875809, 1, 1, 1, 1, 1,
0.6476886, -0.4119723, 0.7393805, 1, 1, 1, 1, 1,
0.6491048, -0.3974241, 2.33168, 1, 1, 1, 1, 1,
0.6496012, 0.7175633, 1.781267, 1, 1, 1, 1, 1,
0.6524243, 2.981678, -0.7530458, 1, 1, 1, 1, 1,
0.6558387, -2.561042, 4.213237, 1, 1, 1, 1, 1,
0.6593615, 0.715688, 1.306544, 1, 1, 1, 1, 1,
0.6650523, -1.141607, 2.720118, 1, 1, 1, 1, 1,
0.6682476, 2.05686, 1.234719, 1, 1, 1, 1, 1,
0.6722789, -0.04853408, 1.42472, 1, 1, 1, 1, 1,
0.6742507, 0.8265112, -1.234433, 1, 1, 1, 1, 1,
0.6772064, 0.3074017, 0.9046741, 1, 1, 1, 1, 1,
0.6800664, -0.002038141, 1.202081, 1, 1, 1, 1, 1,
0.6828488, 0.1492868, 2.325537, 1, 1, 1, 1, 1,
0.6854162, -1.775701, 2.5831, 1, 1, 1, 1, 1,
0.6860399, 0.3520761, 1.200294, 0, 0, 1, 1, 1,
0.6877259, -1.640872, 2.707639, 1, 0, 0, 1, 1,
0.6993878, -1.451316, 1.43637, 1, 0, 0, 1, 1,
0.7008939, 0.5102246, -0.08189072, 1, 0, 0, 1, 1,
0.7070078, 0.1843093, 2.058216, 1, 0, 0, 1, 1,
0.7078575, 0.1486658, 1.166963, 1, 0, 0, 1, 1,
0.7099015, 1.112829, 1.356497, 0, 0, 0, 1, 1,
0.7104372, -0.1657117, 3.440357, 0, 0, 0, 1, 1,
0.7147451, 0.4652646, 2.130786, 0, 0, 0, 1, 1,
0.7230315, 0.7562223, -0.09229794, 0, 0, 0, 1, 1,
0.7254514, -0.9302828, 1.021911, 0, 0, 0, 1, 1,
0.7256718, -1.342866, 3.7298, 0, 0, 0, 1, 1,
0.7297818, 0.6074409, 0.7196137, 0, 0, 0, 1, 1,
0.7346173, 0.1188179, 2.294925, 1, 1, 1, 1, 1,
0.7356595, 1.492034, 1.500364, 1, 1, 1, 1, 1,
0.7462919, 0.01898845, 0.7045987, 1, 1, 1, 1, 1,
0.7467496, 0.8658221, 1.472545, 1, 1, 1, 1, 1,
0.749142, 0.06819624, 1.525886, 1, 1, 1, 1, 1,
0.7575952, -1.624482, 2.800385, 1, 1, 1, 1, 1,
0.7626485, 1.17294, 3.137877, 1, 1, 1, 1, 1,
0.7669953, -0.2495481, 1.515283, 1, 1, 1, 1, 1,
0.7747415, 0.1970352, 1.597751, 1, 1, 1, 1, 1,
0.7782075, 0.3899699, 1.491441, 1, 1, 1, 1, 1,
0.7786487, -0.098786, 2.998157, 1, 1, 1, 1, 1,
0.7812903, 0.1508314, 2.660488, 1, 1, 1, 1, 1,
0.7819235, 0.7054949, 1.319443, 1, 1, 1, 1, 1,
0.7827158, -1.587138, 3.056659, 1, 1, 1, 1, 1,
0.7849354, -0.2882889, 0.738551, 1, 1, 1, 1, 1,
0.785145, 0.2941475, 1.420365, 0, 0, 1, 1, 1,
0.7862606, 1.539302, 0.7915052, 1, 0, 0, 1, 1,
0.7882584, -0.2091544, 3.289353, 1, 0, 0, 1, 1,
0.7887146, -1.424339, 3.108439, 1, 0, 0, 1, 1,
0.7904626, 0.1626629, 0.8049971, 1, 0, 0, 1, 1,
0.7967061, 0.1057443, 1.874406, 1, 0, 0, 1, 1,
0.800563, 0.8304726, 0.4472447, 0, 0, 0, 1, 1,
0.8051358, 0.1259009, 2.763578, 0, 0, 0, 1, 1,
0.8058234, -0.1592839, 1.522896, 0, 0, 0, 1, 1,
0.8095276, 1.224271, 0.6815773, 0, 0, 0, 1, 1,
0.8147412, 0.4784457, -0.4169441, 0, 0, 0, 1, 1,
0.8185941, -0.06794012, 1.474515, 0, 0, 0, 1, 1,
0.8190002, -1.089955, 3.354639, 0, 0, 0, 1, 1,
0.8195913, -1.653134, 2.122882, 1, 1, 1, 1, 1,
0.8213511, 0.7780547, 1.314215, 1, 1, 1, 1, 1,
0.8296675, 0.2249935, 1.286748, 1, 1, 1, 1, 1,
0.8303499, 0.7084682, 2.361504, 1, 1, 1, 1, 1,
0.8318302, -0.3821568, 3.841558, 1, 1, 1, 1, 1,
0.8347214, 1.427028, 0.4385693, 1, 1, 1, 1, 1,
0.8376133, 1.312699, 0.06144297, 1, 1, 1, 1, 1,
0.8385687, -2.116112, 2.259284, 1, 1, 1, 1, 1,
0.8454113, -0.5792842, 4.262017, 1, 1, 1, 1, 1,
0.84575, -0.5077783, 2.209319, 1, 1, 1, 1, 1,
0.8537921, 0.4232177, 1.382167, 1, 1, 1, 1, 1,
0.8539516, -0.4376864, 1.340311, 1, 1, 1, 1, 1,
0.865105, -1.70198, 2.312665, 1, 1, 1, 1, 1,
0.8701067, 0.8070734, 1.235548, 1, 1, 1, 1, 1,
0.8760561, 0.1870479, 1.092997, 1, 1, 1, 1, 1,
0.8763952, 0.7191921, 1.359509, 0, 0, 1, 1, 1,
0.8803543, 2.324808, -0.9634547, 1, 0, 0, 1, 1,
0.8809701, 0.1967802, 2.725941, 1, 0, 0, 1, 1,
0.8880561, 0.3261058, -0.1932269, 1, 0, 0, 1, 1,
0.8901637, 0.5490506, 1.546993, 1, 0, 0, 1, 1,
0.8910981, -0.3436885, 1.19108, 1, 0, 0, 1, 1,
0.8916689, 1.608856, 0.8329974, 0, 0, 0, 1, 1,
0.897205, -0.1490413, 2.400352, 0, 0, 0, 1, 1,
0.8976542, -1.704366, 2.8022, 0, 0, 0, 1, 1,
0.9018888, 0.6540138, 1.897341, 0, 0, 0, 1, 1,
0.9082297, 0.829744, -0.6346335, 0, 0, 0, 1, 1,
0.9119315, -0.9791765, 2.815016, 0, 0, 0, 1, 1,
0.9179469, 0.7854538, 1.558881, 0, 0, 0, 1, 1,
0.9206282, -0.9013922, 0.1710072, 1, 1, 1, 1, 1,
0.9210052, 0.2304399, 0.9133487, 1, 1, 1, 1, 1,
0.9228514, -1.082564, 1.574667, 1, 1, 1, 1, 1,
0.9259512, 0.2361792, 0.6639119, 1, 1, 1, 1, 1,
0.9264095, -0.1973976, 2.937626, 1, 1, 1, 1, 1,
0.9274237, 0.6997917, 1.721176, 1, 1, 1, 1, 1,
0.9282805, 1.675414, 0.4197533, 1, 1, 1, 1, 1,
0.9341433, 1.782845, -0.4536813, 1, 1, 1, 1, 1,
0.9347604, -0.02506218, 1.03462, 1, 1, 1, 1, 1,
0.9374976, -0.5173898, 2.493226, 1, 1, 1, 1, 1,
0.9395398, 0.4386559, 0.6716884, 1, 1, 1, 1, 1,
0.9451932, -0.953049, 0.6874029, 1, 1, 1, 1, 1,
0.9467799, -0.8344801, 4.434514, 1, 1, 1, 1, 1,
0.9506672, 0.007322526, 2.119511, 1, 1, 1, 1, 1,
0.9511102, -0.6640382, 1.663072, 1, 1, 1, 1, 1,
0.9596919, -1.169951, 2.232179, 0, 0, 1, 1, 1,
0.9636953, 1.112797, 0.7295772, 1, 0, 0, 1, 1,
0.9649945, -0.2600203, 3.484108, 1, 0, 0, 1, 1,
0.9702097, -0.3259501, 1.128884, 1, 0, 0, 1, 1,
0.9707494, 0.03570524, 0.4075926, 1, 0, 0, 1, 1,
0.9779043, -1.061765, 3.08613, 1, 0, 0, 1, 1,
0.9788017, -0.8446854, 3.7217, 0, 0, 0, 1, 1,
0.9794387, 0.3563488, 0.7820653, 0, 0, 0, 1, 1,
0.9795889, -0.2348023, 1.204949, 0, 0, 0, 1, 1,
0.9815804, -0.8306005, 2.613904, 0, 0, 0, 1, 1,
0.9819668, -0.6154649, 1.827008, 0, 0, 0, 1, 1,
0.9824837, -0.2190371, 1.43865, 0, 0, 0, 1, 1,
0.9827178, -1.042687, 2.028409, 0, 0, 0, 1, 1,
0.9839894, -1.261897, 1.976994, 1, 1, 1, 1, 1,
0.9917341, -0.3897222, 1.614995, 1, 1, 1, 1, 1,
0.9929699, 1.818752, -0.5825484, 1, 1, 1, 1, 1,
0.9978461, 0.3402924, 0.9408383, 1, 1, 1, 1, 1,
1.00039, 0.4565555, -0.08803464, 1, 1, 1, 1, 1,
1.004565, -0.0825412, 1.864237, 1, 1, 1, 1, 1,
1.006225, -0.2738052, 3.270294, 1, 1, 1, 1, 1,
1.014677, 0.4834657, -0.34343, 1, 1, 1, 1, 1,
1.015327, 1.050202, 1.253847, 1, 1, 1, 1, 1,
1.01711, 0.9499162, 0.6536496, 1, 1, 1, 1, 1,
1.020856, -1.28559, 2.712084, 1, 1, 1, 1, 1,
1.022119, 1.073407, -0.1091571, 1, 1, 1, 1, 1,
1.025815, 0.9524118, 1.351426, 1, 1, 1, 1, 1,
1.027381, -0.7886332, 2.308172, 1, 1, 1, 1, 1,
1.029321, 1.438655, 1.286626, 1, 1, 1, 1, 1,
1.03491, 3.101418, 0.536224, 0, 0, 1, 1, 1,
1.036849, 1.280205, 1.479692, 1, 0, 0, 1, 1,
1.038853, 1.243805, -0.2219001, 1, 0, 0, 1, 1,
1.039529, 0.00810952, 1.141331, 1, 0, 0, 1, 1,
1.046136, 0.2013629, 0.4385296, 1, 0, 0, 1, 1,
1.053416, -0.3164988, 2.365321, 1, 0, 0, 1, 1,
1.055113, 0.763441, 1.732611, 0, 0, 0, 1, 1,
1.066985, 0.3196004, 1.059551, 0, 0, 0, 1, 1,
1.071424, -0.3897075, 2.817447, 0, 0, 0, 1, 1,
1.071779, -0.1160117, 1.555351, 0, 0, 0, 1, 1,
1.077182, -1.66878, 1.847447, 0, 0, 0, 1, 1,
1.08177, 1.008329, 0.3245418, 0, 0, 0, 1, 1,
1.087888, 1.940749, 1.639035, 0, 0, 0, 1, 1,
1.091768, 0.5224144, 0.391242, 1, 1, 1, 1, 1,
1.092562, -1.318509, 3.134081, 1, 1, 1, 1, 1,
1.103151, 1.441398, 0.8942766, 1, 1, 1, 1, 1,
1.104981, 0.1471849, 1.023413, 1, 1, 1, 1, 1,
1.10724, -0.6627513, 2.454363, 1, 1, 1, 1, 1,
1.109859, 0.3748267, 3.093222, 1, 1, 1, 1, 1,
1.113491, -1.206025, 1.62428, 1, 1, 1, 1, 1,
1.118008, 0.007448994, 0.9170527, 1, 1, 1, 1, 1,
1.123346, -1.985559, 3.265488, 1, 1, 1, 1, 1,
1.126325, 1.416224, 2.539097, 1, 1, 1, 1, 1,
1.126757, -1.185044, 0.8885128, 1, 1, 1, 1, 1,
1.128061, 0.4655286, 1.597475, 1, 1, 1, 1, 1,
1.12947, 0.8376357, 0.05607562, 1, 1, 1, 1, 1,
1.150662, -0.4860872, 0.7935105, 1, 1, 1, 1, 1,
1.151662, -1.901309, 1.335043, 1, 1, 1, 1, 1,
1.155075, 0.1127178, 0.00414163, 0, 0, 1, 1, 1,
1.156869, -1.048118, 1.550099, 1, 0, 0, 1, 1,
1.159613, -0.8172842, 2.900079, 1, 0, 0, 1, 1,
1.160447, -0.1887525, 1.993299, 1, 0, 0, 1, 1,
1.164099, -1.558736, 2.735984, 1, 0, 0, 1, 1,
1.16624, 0.1838601, -0.5824708, 1, 0, 0, 1, 1,
1.169537, -1.15969, 1.38715, 0, 0, 0, 1, 1,
1.187274, -0.5140712, 1.124189, 0, 0, 0, 1, 1,
1.19323, 0.6590003, 1.640457, 0, 0, 0, 1, 1,
1.195014, 0.9621841, 0.9477459, 0, 0, 0, 1, 1,
1.197634, -0.881143, 2.061709, 0, 0, 0, 1, 1,
1.218123, -0.4113263, 2.59427, 0, 0, 0, 1, 1,
1.219054, -0.4230601, -0.1042011, 0, 0, 0, 1, 1,
1.228456, 1.586282, 1.682658, 1, 1, 1, 1, 1,
1.229668, -0.9161196, 3.619081, 1, 1, 1, 1, 1,
1.232281, -0.7119309, 0.7017861, 1, 1, 1, 1, 1,
1.242441, -1.413167, 2.576012, 1, 1, 1, 1, 1,
1.244574, -0.8523989, 1.69029, 1, 1, 1, 1, 1,
1.24582, 1.266125, 1.676796, 1, 1, 1, 1, 1,
1.246544, -0.3600014, 3.454892, 1, 1, 1, 1, 1,
1.247233, 0.3072609, 2.059616, 1, 1, 1, 1, 1,
1.247558, 0.03853399, 0.7206465, 1, 1, 1, 1, 1,
1.259132, -0.3543684, 2.237975, 1, 1, 1, 1, 1,
1.260315, 1.463503, -1.126057, 1, 1, 1, 1, 1,
1.266537, -0.4353411, 3.082708, 1, 1, 1, 1, 1,
1.267137, 0.5990051, 1.194741, 1, 1, 1, 1, 1,
1.271964, 0.3103607, 2.009308, 1, 1, 1, 1, 1,
1.272878, -0.5505614, 2.465724, 1, 1, 1, 1, 1,
1.273651, 1.387413, 1.48943, 0, 0, 1, 1, 1,
1.275761, 0.706337, 1.406614, 1, 0, 0, 1, 1,
1.277427, -0.09337033, 1.677598, 1, 0, 0, 1, 1,
1.293939, -1.058064, 2.337119, 1, 0, 0, 1, 1,
1.307961, 0.6601174, 1.575471, 1, 0, 0, 1, 1,
1.310347, -0.3783143, 3.238419, 1, 0, 0, 1, 1,
1.318373, 0.1220225, 0.5496187, 0, 0, 0, 1, 1,
1.326139, 1.253253, 0.5101278, 0, 0, 0, 1, 1,
1.329588, -0.303701, 1.185461, 0, 0, 0, 1, 1,
1.338447, 0.9491708, 0.4796813, 0, 0, 0, 1, 1,
1.338519, 0.7265134, 2.59781, 0, 0, 0, 1, 1,
1.343386, 0.7377095, 1.248778, 0, 0, 0, 1, 1,
1.348805, 0.5671582, 1.847957, 0, 0, 0, 1, 1,
1.35186, 0.953066, 0.90233, 1, 1, 1, 1, 1,
1.352194, -0.4876063, 1.682799, 1, 1, 1, 1, 1,
1.356012, 0.4942216, 1.184715, 1, 1, 1, 1, 1,
1.35649, 0.1919625, 1.306086, 1, 1, 1, 1, 1,
1.35696, -0.05391859, 2.812542, 1, 1, 1, 1, 1,
1.358035, -0.7608575, 2.18429, 1, 1, 1, 1, 1,
1.361355, 1.201456, 1.465852, 1, 1, 1, 1, 1,
1.361915, -1.413506, 2.823457, 1, 1, 1, 1, 1,
1.362823, 0.4846134, 1.334289, 1, 1, 1, 1, 1,
1.384599, 0.02620601, 1.870747, 1, 1, 1, 1, 1,
1.403585, 1.204257, -0.1455316, 1, 1, 1, 1, 1,
1.45753, 0.3686144, -0.4576845, 1, 1, 1, 1, 1,
1.464789, -1.765198, 2.30583, 1, 1, 1, 1, 1,
1.466002, -2.209899, 1.312085, 1, 1, 1, 1, 1,
1.469185, 0.2922642, 0.6730928, 1, 1, 1, 1, 1,
1.469528, -1.290809, 1.930382, 0, 0, 1, 1, 1,
1.476772, -0.6791466, 2.670961, 1, 0, 0, 1, 1,
1.493452, 0.7052533, 0.8063154, 1, 0, 0, 1, 1,
1.497587, 0.8698818, 1.902946, 1, 0, 0, 1, 1,
1.512928, -0.2151235, 1.525248, 1, 0, 0, 1, 1,
1.531837, -0.7927913, 0.8912618, 1, 0, 0, 1, 1,
1.547156, -0.1872845, 1.346578, 0, 0, 0, 1, 1,
1.556181, -2.07682, 1.467845, 0, 0, 0, 1, 1,
1.557786, 1.704141, -0.3882089, 0, 0, 0, 1, 1,
1.559117, 0.05413352, 2.570145, 0, 0, 0, 1, 1,
1.56918, 1.254177, 0.9029602, 0, 0, 0, 1, 1,
1.576864, 0.7154014, -2.199462, 0, 0, 0, 1, 1,
1.578343, 0.4539202, 1.972805, 0, 0, 0, 1, 1,
1.58185, -0.6741866, 1.229718, 1, 1, 1, 1, 1,
1.592722, 0.2159765, 3.013668, 1, 1, 1, 1, 1,
1.594054, -1.376243, 2.216547, 1, 1, 1, 1, 1,
1.608303, -0.005522064, 1.156076, 1, 1, 1, 1, 1,
1.609393, -0.2169149, 2.371349, 1, 1, 1, 1, 1,
1.612536, -0.02644244, 2.825651, 1, 1, 1, 1, 1,
1.612555, -0.4697586, 1.162595, 1, 1, 1, 1, 1,
1.61631, -1.126503, 3.052527, 1, 1, 1, 1, 1,
1.62606, -0.6340166, 1.710082, 1, 1, 1, 1, 1,
1.62956, 2.208774, 0.7806247, 1, 1, 1, 1, 1,
1.632126, 0.176611, 1.020123, 1, 1, 1, 1, 1,
1.638935, 0.968743, 2.440001, 1, 1, 1, 1, 1,
1.670786, -0.1055991, 2.588186, 1, 1, 1, 1, 1,
1.676966, 1.143858, 1.077635, 1, 1, 1, 1, 1,
1.685501, 0.1088836, 2.597621, 1, 1, 1, 1, 1,
1.691502, 1.990944, 1.741304, 0, 0, 1, 1, 1,
1.699471, 0.9642077, 1.501714, 1, 0, 0, 1, 1,
1.708337, 1.372181, 1.242799, 1, 0, 0, 1, 1,
1.761763, 0.1912399, 2.415166, 1, 0, 0, 1, 1,
1.764568, -1.422641, 2.315738, 1, 0, 0, 1, 1,
1.779447, 0.4945915, 0.813792, 1, 0, 0, 1, 1,
1.803062, -0.1449662, -1.192508, 0, 0, 0, 1, 1,
1.83534, 1.184853, 1.620609, 0, 0, 0, 1, 1,
1.861759, 0.5764137, -0.06434771, 0, 0, 0, 1, 1,
1.879958, 0.7866783, 2.433507, 0, 0, 0, 1, 1,
1.886499, 0.3861132, 0.7645137, 0, 0, 0, 1, 1,
1.89239, 0.3257699, 3.428241, 0, 0, 0, 1, 1,
1.894661, -0.7667412, 1.780523, 0, 0, 0, 1, 1,
1.913089, 1.743254, 0.7759403, 1, 1, 1, 1, 1,
1.93669, -0.3232496, 0.8604411, 1, 1, 1, 1, 1,
1.94977, -0.08541638, 2.762123, 1, 1, 1, 1, 1,
1.955716, -0.7538046, 1.201612, 1, 1, 1, 1, 1,
1.96001, 0.8106094, -0.7985994, 1, 1, 1, 1, 1,
1.970544, 1.440299, 1.813774, 1, 1, 1, 1, 1,
1.974234, -0.7917917, 1.624765, 1, 1, 1, 1, 1,
1.975416, 1.034893, 0.2109155, 1, 1, 1, 1, 1,
1.986857, 0.2650244, -1.181287, 1, 1, 1, 1, 1,
2.009802, 1.524539, 2.16414, 1, 1, 1, 1, 1,
2.050241, -2.560452, 1.835469, 1, 1, 1, 1, 1,
2.060854, 1.35515, -0.0474125, 1, 1, 1, 1, 1,
2.103148, 0.5053661, 1.968143, 1, 1, 1, 1, 1,
2.113763, 0.37171, 2.12308, 1, 1, 1, 1, 1,
2.115538, -0.5252073, 2.438225, 1, 1, 1, 1, 1,
2.121841, -0.6353782, 0.9607525, 0, 0, 1, 1, 1,
2.153031, 1.356647, 1.366747, 1, 0, 0, 1, 1,
2.189147, 0.1409584, 3.065316, 1, 0, 0, 1, 1,
2.232044, -2.457105, 5.049597, 1, 0, 0, 1, 1,
2.241542, 0.9244702, 1.577298, 1, 0, 0, 1, 1,
2.341317, 0.2158204, 1.898849, 1, 0, 0, 1, 1,
2.469854, -1.245381, 2.020708, 0, 0, 0, 1, 1,
2.4792, 0.6509073, 1.941954, 0, 0, 0, 1, 1,
2.479307, 0.5488024, 1.548533, 0, 0, 0, 1, 1,
2.49214, -0.01247121, 2.254962, 0, 0, 0, 1, 1,
2.492401, -1.254051, 2.07847, 0, 0, 0, 1, 1,
2.499642, -0.3724762, 1.745321, 0, 0, 0, 1, 1,
2.50519, 0.7070647, 0.5055927, 0, 0, 0, 1, 1,
2.506008, 0.992838, 0.8412322, 1, 1, 1, 1, 1,
2.545743, -0.01539819, 2.783552, 1, 1, 1, 1, 1,
2.59956, -0.4781114, 2.227593, 1, 1, 1, 1, 1,
2.621246, 1.241607, 0.4215448, 1, 1, 1, 1, 1,
2.721174, -0.8292235, 1.513032, 1, 1, 1, 1, 1,
2.759198, -0.153138, -0.1425094, 1, 1, 1, 1, 1,
3.548411, 0.4505217, 0.6839559, 1, 1, 1, 1, 1
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
var radius = 9.807195;
var distance = 34.44736;
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
mvMatrix.translate( -0.3757248, 0.02371025, -0.256793 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.44736);
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
