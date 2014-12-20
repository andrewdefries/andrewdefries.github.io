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
-3.201959, 0.3696006, -1.748896, 1, 0, 0, 1,
-3.029079, 0.4148709, -0.6209938, 1, 0.007843138, 0, 1,
-2.787304, 3.045724, -1.043098, 1, 0.01176471, 0, 1,
-2.743646, 1.983563, -0.8708996, 1, 0.01960784, 0, 1,
-2.691869, 0.3322732, -1.227531, 1, 0.02352941, 0, 1,
-2.648618, -0.109238, -2.626049, 1, 0.03137255, 0, 1,
-2.599964, 0.4449493, -1.455838, 1, 0.03529412, 0, 1,
-2.56693, -0.206059, -1.591421, 1, 0.04313726, 0, 1,
-2.559142, 0.4286993, -1.833117, 1, 0.04705882, 0, 1,
-2.555109, -1.735221, -1.81652, 1, 0.05490196, 0, 1,
-2.523829, 1.269049, -0.252421, 1, 0.05882353, 0, 1,
-2.500571, 1.66799, -0.6245428, 1, 0.06666667, 0, 1,
-2.425563, -0.2981476, -2.961791, 1, 0.07058824, 0, 1,
-2.320988, 1.406672, -0.05970327, 1, 0.07843138, 0, 1,
-2.292024, -2.258944, -1.923616, 1, 0.08235294, 0, 1,
-2.239048, -1.759242, -3.238982, 1, 0.09019608, 0, 1,
-2.119092, -0.8339281, -1.557658, 1, 0.09411765, 0, 1,
-2.10784, 0.7960564, -0.7651129, 1, 0.1019608, 0, 1,
-2.087509, 0.6318935, -1.433491, 1, 0.1098039, 0, 1,
-2.085397, 0.01616806, -0.5533258, 1, 0.1137255, 0, 1,
-2.06802, -0.59144, -3.223828, 1, 0.1215686, 0, 1,
-2.039647, 1.365077, -2.581629, 1, 0.1254902, 0, 1,
-2.033222, -1.764677, -2.593675, 1, 0.1333333, 0, 1,
-2.016328, 1.577753, -0.6354333, 1, 0.1372549, 0, 1,
-1.966833, 0.01972585, -1.097377, 1, 0.145098, 0, 1,
-1.952241, -0.5799671, -2.72298, 1, 0.1490196, 0, 1,
-1.948035, 0.05740045, -1.181092, 1, 0.1568628, 0, 1,
-1.935307, -0.6202467, -2.226727, 1, 0.1607843, 0, 1,
-1.902785, 2.400735, -0.5288038, 1, 0.1686275, 0, 1,
-1.900318, 0.7356024, -2.006922, 1, 0.172549, 0, 1,
-1.892579, 2.054487, -0.5324966, 1, 0.1803922, 0, 1,
-1.891906, -0.1582807, -0.9031098, 1, 0.1843137, 0, 1,
-1.885513, 1.193393, -1.343104, 1, 0.1921569, 0, 1,
-1.871843, 1.290535, -1.931947, 1, 0.1960784, 0, 1,
-1.850017, 0.2350636, -0.5178431, 1, 0.2039216, 0, 1,
-1.841515, 1.979375, -1.443172, 1, 0.2117647, 0, 1,
-1.836974, 0.5454937, -1.318786, 1, 0.2156863, 0, 1,
-1.824084, 0.5791513, -3.357874, 1, 0.2235294, 0, 1,
-1.823586, -1.014768, -2.874764, 1, 0.227451, 0, 1,
-1.818023, -1.327499, -1.287066, 1, 0.2352941, 0, 1,
-1.80351, -1.617194, -2.958379, 1, 0.2392157, 0, 1,
-1.771534, -1.748861, -3.467791, 1, 0.2470588, 0, 1,
-1.764389, -1.3123, -1.586333, 1, 0.2509804, 0, 1,
-1.760353, 1.36781, 0.1714899, 1, 0.2588235, 0, 1,
-1.756033, -0.7569114, -2.124733, 1, 0.2627451, 0, 1,
-1.748594, -0.6426259, -3.352943, 1, 0.2705882, 0, 1,
-1.744648, -0.7225802, -2.179631, 1, 0.2745098, 0, 1,
-1.73857, 0.5230649, -1.125416, 1, 0.282353, 0, 1,
-1.736808, -1.435621, -1.019071, 1, 0.2862745, 0, 1,
-1.728561, 0.2469287, -0.7244379, 1, 0.2941177, 0, 1,
-1.721017, 1.030948, -2.170562, 1, 0.3019608, 0, 1,
-1.705368, -1.021195, -0.714267, 1, 0.3058824, 0, 1,
-1.702517, 0.004192048, -2.574487, 1, 0.3137255, 0, 1,
-1.702131, 0.0849037, -1.596007, 1, 0.3176471, 0, 1,
-1.69787, -0.2536621, -2.836786, 1, 0.3254902, 0, 1,
-1.685838, -0.2079318, -2.046673, 1, 0.3294118, 0, 1,
-1.679586, 0.3480944, 0.6227901, 1, 0.3372549, 0, 1,
-1.676234, -2.927618, -3.086041, 1, 0.3411765, 0, 1,
-1.672504, -1.625471, -2.5783, 1, 0.3490196, 0, 1,
-1.659894, 0.4697728, -1.301113, 1, 0.3529412, 0, 1,
-1.656147, 1.727141, -0.7817346, 1, 0.3607843, 0, 1,
-1.636715, -0.2034475, -0.9819741, 1, 0.3647059, 0, 1,
-1.629938, -0.4141507, -1.026916, 1, 0.372549, 0, 1,
-1.627908, 0.7052313, -1.622126, 1, 0.3764706, 0, 1,
-1.62041, 0.609814, -0.6583387, 1, 0.3843137, 0, 1,
-1.620025, 0.465812, -1.178968, 1, 0.3882353, 0, 1,
-1.619051, -0.1108008, -0.6718476, 1, 0.3960784, 0, 1,
-1.612831, -0.5368012, -2.367201, 1, 0.4039216, 0, 1,
-1.610007, 5.018612e-05, -1.530888, 1, 0.4078431, 0, 1,
-1.609602, -0.03908126, -2.275467, 1, 0.4156863, 0, 1,
-1.605044, -0.01917557, -2.578485, 1, 0.4196078, 0, 1,
-1.588047, 0.9513037, 0.06956701, 1, 0.427451, 0, 1,
-1.585267, 1.576516, -0.6364897, 1, 0.4313726, 0, 1,
-1.556885, 0.5990595, -0.7301753, 1, 0.4392157, 0, 1,
-1.542053, -0.8275782, -2.623625, 1, 0.4431373, 0, 1,
-1.538149, 1.162678, -0.9411818, 1, 0.4509804, 0, 1,
-1.490247, 1.381781, -0.2418058, 1, 0.454902, 0, 1,
-1.489829, -0.1417259, -1.275029, 1, 0.4627451, 0, 1,
-1.485072, -0.365902, -1.242826, 1, 0.4666667, 0, 1,
-1.475919, -0.1700119, -3.846387, 1, 0.4745098, 0, 1,
-1.472031, -0.1674266, -1.062625, 1, 0.4784314, 0, 1,
-1.465707, -0.6046399, 0.264191, 1, 0.4862745, 0, 1,
-1.459419, 1.229724, -0.5084429, 1, 0.4901961, 0, 1,
-1.4489, 0.6776313, 0.8588424, 1, 0.4980392, 0, 1,
-1.445908, 0.7790315, -0.980956, 1, 0.5058824, 0, 1,
-1.435152, 0.6924365, -1.170296, 1, 0.509804, 0, 1,
-1.423184, -1.361298, -4.996257, 1, 0.5176471, 0, 1,
-1.417134, -0.7199105, -2.054187, 1, 0.5215687, 0, 1,
-1.409659, -0.1744672, -1.122943, 1, 0.5294118, 0, 1,
-1.399981, 1.713639, -0.2253467, 1, 0.5333334, 0, 1,
-1.395213, 0.3062863, -2.224032, 1, 0.5411765, 0, 1,
-1.377204, 0.3425092, -1.855899, 1, 0.5450981, 0, 1,
-1.371895, -0.03240678, -2.808764, 1, 0.5529412, 0, 1,
-1.368887, 0.4188091, -3.569646, 1, 0.5568628, 0, 1,
-1.364375, -0.5579443, -2.451924, 1, 0.5647059, 0, 1,
-1.362916, -0.5814633, -0.473501, 1, 0.5686275, 0, 1,
-1.354072, -0.5151864, -2.826863, 1, 0.5764706, 0, 1,
-1.353608, 0.1764912, -1.266903, 1, 0.5803922, 0, 1,
-1.348508, 0.5908203, -2.544945, 1, 0.5882353, 0, 1,
-1.344465, 1.395037, -1.181011, 1, 0.5921569, 0, 1,
-1.311828, -1.896544, -2.369215, 1, 0.6, 0, 1,
-1.31035, -0.5535698, -2.585486, 1, 0.6078432, 0, 1,
-1.303652, -0.4258801, -2.187992, 1, 0.6117647, 0, 1,
-1.300698, -0.8640505, -2.985197, 1, 0.6196079, 0, 1,
-1.283181, -0.2721448, -1.142357, 1, 0.6235294, 0, 1,
-1.28037, -2.120614, -3.260974, 1, 0.6313726, 0, 1,
-1.277283, 0.7363139, -0.33834, 1, 0.6352941, 0, 1,
-1.255963, -1.025886, -2.136412, 1, 0.6431373, 0, 1,
-1.245413, 0.4675626, 0.6717526, 1, 0.6470588, 0, 1,
-1.242422, -0.755685, -1.571257, 1, 0.654902, 0, 1,
-1.23768, -1.97827, -3.117183, 1, 0.6588235, 0, 1,
-1.23667, -0.3660532, -2.514624, 1, 0.6666667, 0, 1,
-1.22063, -1.250242, -4.59417, 1, 0.6705883, 0, 1,
-1.218415, 0.3190965, -2.634117, 1, 0.6784314, 0, 1,
-1.209296, 1.511605, -1.195829, 1, 0.682353, 0, 1,
-1.199179, -0.1734031, -2.191165, 1, 0.6901961, 0, 1,
-1.197823, -1.043086, -3.374504, 1, 0.6941177, 0, 1,
-1.192796, 0.4610969, -0.3609321, 1, 0.7019608, 0, 1,
-1.189912, -0.6979523, -3.650687, 1, 0.7098039, 0, 1,
-1.185901, -0.3374257, -0.6474708, 1, 0.7137255, 0, 1,
-1.181563, -0.7040048, -2.297863, 1, 0.7215686, 0, 1,
-1.177882, -0.09274127, -2.238841, 1, 0.7254902, 0, 1,
-1.17759, 0.6060275, 0.9594905, 1, 0.7333333, 0, 1,
-1.175908, 0.3565939, -0.4214244, 1, 0.7372549, 0, 1,
-1.172248, 0.6277349, -2.635408, 1, 0.7450981, 0, 1,
-1.161931, -0.0691952, -2.191968, 1, 0.7490196, 0, 1,
-1.159646, 1.08329, 0.08433992, 1, 0.7568628, 0, 1,
-1.156633, -0.2655004, -1.562572, 1, 0.7607843, 0, 1,
-1.148352, -2.164034, -0.137535, 1, 0.7686275, 0, 1,
-1.144098, -1.047481, -0.8026108, 1, 0.772549, 0, 1,
-1.143311, 0.4314189, -1.42821, 1, 0.7803922, 0, 1,
-1.13997, 0.2166792, -1.919379, 1, 0.7843137, 0, 1,
-1.137351, 1.078596, -0.9121051, 1, 0.7921569, 0, 1,
-1.134944, 0.9819574, -1.626319, 1, 0.7960784, 0, 1,
-1.130896, -0.5666248, -2.325197, 1, 0.8039216, 0, 1,
-1.130364, -0.8897972, -0.6252869, 1, 0.8117647, 0, 1,
-1.127725, -0.7615002, -3.521643, 1, 0.8156863, 0, 1,
-1.120261, 0.9516627, -0.7407305, 1, 0.8235294, 0, 1,
-1.119889, -1.836092, -2.875421, 1, 0.827451, 0, 1,
-1.117158, -0.9820625, -2.427904, 1, 0.8352941, 0, 1,
-1.113, 1.013983, -2.223952, 1, 0.8392157, 0, 1,
-1.110229, -0.2040817, -1.066749, 1, 0.8470588, 0, 1,
-1.105166, 0.2518242, -2.381715, 1, 0.8509804, 0, 1,
-1.105056, 1.477398, 1.039444, 1, 0.8588235, 0, 1,
-1.098927, 0.5254, -2.935819, 1, 0.8627451, 0, 1,
-1.094994, -0.2237634, -0.3004711, 1, 0.8705882, 0, 1,
-1.091932, 0.903581, 0.06781284, 1, 0.8745098, 0, 1,
-1.090049, -0.622476, -2.562632, 1, 0.8823529, 0, 1,
-1.080344, 0.5395094, -0.3169337, 1, 0.8862745, 0, 1,
-1.078794, -0.4223386, -1.866083, 1, 0.8941177, 0, 1,
-1.07695, 0.226552, 0.4632429, 1, 0.8980392, 0, 1,
-1.075876, 1.253825, -2.512216, 1, 0.9058824, 0, 1,
-1.070562, 0.198858, -3.873331, 1, 0.9137255, 0, 1,
-1.060283, 0.275427, -3.241167, 1, 0.9176471, 0, 1,
-1.055993, 1.088096, -0.9851105, 1, 0.9254902, 0, 1,
-1.049881, -0.1891614, -1.088584, 1, 0.9294118, 0, 1,
-1.038244, -0.6859919, -2.742994, 1, 0.9372549, 0, 1,
-1.037949, -0.2980973, -1.167604, 1, 0.9411765, 0, 1,
-1.031909, -1.45091, -2.507968, 1, 0.9490196, 0, 1,
-1.026941, -0.2562448, 0.2471844, 1, 0.9529412, 0, 1,
-1.025698, -0.2940941, -3.87519, 1, 0.9607843, 0, 1,
-1.018004, 0.5527121, -1.184586, 1, 0.9647059, 0, 1,
-1.00561, 0.3178567, -0.6389218, 1, 0.972549, 0, 1,
-1.002756, 0.8093993, -0.1320442, 1, 0.9764706, 0, 1,
-1.002351, 0.1814132, -1.503093, 1, 0.9843137, 0, 1,
-1.002141, -0.9589834, -3.436454, 1, 0.9882353, 0, 1,
-0.9931944, 0.0115349, -1.837931, 1, 0.9960784, 0, 1,
-0.9927759, 1.273926, -1.273396, 0.9960784, 1, 0, 1,
-0.9895518, -0.5799895, -1.892203, 0.9921569, 1, 0, 1,
-0.9886988, 0.05719719, -2.70929, 0.9843137, 1, 0, 1,
-0.988445, 1.401471, 0.08033295, 0.9803922, 1, 0, 1,
-0.9856008, -0.6541458, -2.273266, 0.972549, 1, 0, 1,
-0.9835603, -0.1982688, -2.071494, 0.9686275, 1, 0, 1,
-0.9829968, 0.683715, -1.754691, 0.9607843, 1, 0, 1,
-0.9819359, -0.7010813, -1.788069, 0.9568627, 1, 0, 1,
-0.9734575, -0.4374039, -4.352185, 0.9490196, 1, 0, 1,
-0.9642185, -1.122398, -1.869009, 0.945098, 1, 0, 1,
-0.9639495, 0.08705428, -2.41347, 0.9372549, 1, 0, 1,
-0.9611406, -0.8244892, -1.944029, 0.9333333, 1, 0, 1,
-0.9515938, -0.523463, -3.022982, 0.9254902, 1, 0, 1,
-0.9503478, -1.054561, -3.278129, 0.9215686, 1, 0, 1,
-0.9479988, 1.517637, -0.5189165, 0.9137255, 1, 0, 1,
-0.9469498, 0.3290419, -2.332896, 0.9098039, 1, 0, 1,
-0.9414755, 0.6632153, 0.128219, 0.9019608, 1, 0, 1,
-0.9398393, -1.989599, -3.494343, 0.8941177, 1, 0, 1,
-0.9335417, 0.07701399, 0.1996079, 0.8901961, 1, 0, 1,
-0.9318494, -1.841609, -2.717212, 0.8823529, 1, 0, 1,
-0.931611, 0.02269817, 0.08093648, 0.8784314, 1, 0, 1,
-0.9263632, -1.544935, -2.651153, 0.8705882, 1, 0, 1,
-0.9152002, 0.6587293, -0.6239647, 0.8666667, 1, 0, 1,
-0.9125003, 2.363613, 1.280212, 0.8588235, 1, 0, 1,
-0.9063365, -0.4110664, -2.180342, 0.854902, 1, 0, 1,
-0.898087, 0.2923288, -1.562279, 0.8470588, 1, 0, 1,
-0.8956144, 0.3199883, -0.8716876, 0.8431373, 1, 0, 1,
-0.8948851, -0.3076442, -1.634128, 0.8352941, 1, 0, 1,
-0.8910983, 0.9687872, -1.004899, 0.8313726, 1, 0, 1,
-0.8888137, 0.2073016, -3.309271, 0.8235294, 1, 0, 1,
-0.8835376, -1.420812, -1.992972, 0.8196079, 1, 0, 1,
-0.8824158, 0.6246316, 0.005336281, 0.8117647, 1, 0, 1,
-0.878638, -0.3920872, -1.85154, 0.8078431, 1, 0, 1,
-0.8769928, 0.4780238, -0.7612153, 0.8, 1, 0, 1,
-0.8683, -0.2948814, -1.847689, 0.7921569, 1, 0, 1,
-0.8654951, 3.141636, 0.5699305, 0.7882353, 1, 0, 1,
-0.8616539, 1.150409, -2.094609, 0.7803922, 1, 0, 1,
-0.8590606, 0.4346088, -0.08361082, 0.7764706, 1, 0, 1,
-0.8556247, -1.057709, -3.527854, 0.7686275, 1, 0, 1,
-0.8453797, 0.01558259, -1.913379, 0.7647059, 1, 0, 1,
-0.8414975, -0.2431222, -1.050928, 0.7568628, 1, 0, 1,
-0.8409694, 0.7967731, 0.06292349, 0.7529412, 1, 0, 1,
-0.8360012, -1.062559, -1.953655, 0.7450981, 1, 0, 1,
-0.8280877, -0.3998496, -2.568146, 0.7411765, 1, 0, 1,
-0.8271115, 0.2837592, -1.128416, 0.7333333, 1, 0, 1,
-0.8270714, 1.320715, 0.1412369, 0.7294118, 1, 0, 1,
-0.8264901, 1.259189, -1.096969, 0.7215686, 1, 0, 1,
-0.8181689, -0.9388249, -2.905735, 0.7176471, 1, 0, 1,
-0.81501, -1.313622, -3.674023, 0.7098039, 1, 0, 1,
-0.8139749, 1.357285, -1.441997, 0.7058824, 1, 0, 1,
-0.7959033, -0.9743836, -2.275515, 0.6980392, 1, 0, 1,
-0.7932205, -0.4994251, -0.6607349, 0.6901961, 1, 0, 1,
-0.790776, 1.421206, -0.8771657, 0.6862745, 1, 0, 1,
-0.7862968, 0.2030814, -0.5546693, 0.6784314, 1, 0, 1,
-0.77986, 2.164746, 0.09184123, 0.6745098, 1, 0, 1,
-0.7794751, 0.1607803, -1.610318, 0.6666667, 1, 0, 1,
-0.7638751, 0.04288353, 0.6522296, 0.6627451, 1, 0, 1,
-0.763809, -0.01676318, -2.564323, 0.654902, 1, 0, 1,
-0.763732, -1.654773, -1.496776, 0.6509804, 1, 0, 1,
-0.7546019, 0.4685896, -1.257968, 0.6431373, 1, 0, 1,
-0.7499987, -0.3811112, -0.6871582, 0.6392157, 1, 0, 1,
-0.747211, 1.454831, 1.120381, 0.6313726, 1, 0, 1,
-0.741298, -1.131546, -2.434696, 0.627451, 1, 0, 1,
-0.7396699, 0.9723715, -0.7284552, 0.6196079, 1, 0, 1,
-0.7267016, 0.2339466, -0.8355751, 0.6156863, 1, 0, 1,
-0.7243149, -0.9414603, -5.144432, 0.6078432, 1, 0, 1,
-0.7210526, 0.1394832, -1.043561, 0.6039216, 1, 0, 1,
-0.7205188, -0.5962191, -2.687102, 0.5960785, 1, 0, 1,
-0.7200008, -0.2375108, -0.7759427, 0.5882353, 1, 0, 1,
-0.7163657, -0.7483174, -1.812605, 0.5843138, 1, 0, 1,
-0.7129679, 0.614097, -1.572655, 0.5764706, 1, 0, 1,
-0.7123411, -1.283847, -1.583001, 0.572549, 1, 0, 1,
-0.7113172, 0.8732601, -1.031255, 0.5647059, 1, 0, 1,
-0.7100282, -0.2609353, -2.203614, 0.5607843, 1, 0, 1,
-0.7017703, 0.32377, -0.2249957, 0.5529412, 1, 0, 1,
-0.7007099, 1.288045, -1.62639, 0.5490196, 1, 0, 1,
-0.699286, -0.3213335, -0.9625491, 0.5411765, 1, 0, 1,
-0.6945822, -0.20159, -2.714267, 0.5372549, 1, 0, 1,
-0.6908752, 1.318775, -0.8585004, 0.5294118, 1, 0, 1,
-0.6882964, -0.3351069, -0.4176556, 0.5254902, 1, 0, 1,
-0.6846443, 1.216955, 0.001882601, 0.5176471, 1, 0, 1,
-0.6822257, -2.34777, -3.08304, 0.5137255, 1, 0, 1,
-0.6820346, 0.7468408, 1.274632, 0.5058824, 1, 0, 1,
-0.677583, 0.3342501, -1.056304, 0.5019608, 1, 0, 1,
-0.6751008, -2.343401, -1.332286, 0.4941176, 1, 0, 1,
-0.6747138, 0.6289437, -0.4739681, 0.4862745, 1, 0, 1,
-0.6725506, 0.0233718, -0.7134951, 0.4823529, 1, 0, 1,
-0.6703419, -0.719552, -3.378126, 0.4745098, 1, 0, 1,
-0.6691011, 0.10332, -2.14762, 0.4705882, 1, 0, 1,
-0.6688417, -1.911514, -4.033554, 0.4627451, 1, 0, 1,
-0.6677887, 0.2479493, -1.13686, 0.4588235, 1, 0, 1,
-0.6667475, 0.6520716, -0.4989997, 0.4509804, 1, 0, 1,
-0.6651494, 0.9560828, -0.1325637, 0.4470588, 1, 0, 1,
-0.6625653, 0.2273707, -2.02347, 0.4392157, 1, 0, 1,
-0.6618673, 0.601661, -1.101864, 0.4352941, 1, 0, 1,
-0.6598259, -0.156656, -0.9025841, 0.427451, 1, 0, 1,
-0.6541754, -1.3922, -3.562484, 0.4235294, 1, 0, 1,
-0.6510125, -0.6212553, -2.150748, 0.4156863, 1, 0, 1,
-0.649542, -0.07134016, -3.186921, 0.4117647, 1, 0, 1,
-0.6389368, 1.889528, -0.3289916, 0.4039216, 1, 0, 1,
-0.6380367, -1.14755, -3.80689, 0.3960784, 1, 0, 1,
-0.6355482, 1.323593, -2.084252, 0.3921569, 1, 0, 1,
-0.6312667, -0.600032, -3.688676, 0.3843137, 1, 0, 1,
-0.6309243, -0.9247508, -2.689575, 0.3803922, 1, 0, 1,
-0.6253109, 0.54118, -0.7563074, 0.372549, 1, 0, 1,
-0.6232434, -0.5040184, -3.571576, 0.3686275, 1, 0, 1,
-0.6169765, -0.1303881, -2.36775, 0.3607843, 1, 0, 1,
-0.6168061, -0.4654261, -1.010828, 0.3568628, 1, 0, 1,
-0.6141319, -0.4908523, -1.992444, 0.3490196, 1, 0, 1,
-0.6134094, -0.7641003, -3.767433, 0.345098, 1, 0, 1,
-0.6076097, -0.9011835, -2.381273, 0.3372549, 1, 0, 1,
-0.607207, 2.014343, -0.3078552, 0.3333333, 1, 0, 1,
-0.6017314, -0.2175157, -2.460698, 0.3254902, 1, 0, 1,
-0.6009493, 0.1434491, -2.106149, 0.3215686, 1, 0, 1,
-0.5984919, -0.6615054, -2.703664, 0.3137255, 1, 0, 1,
-0.5971734, -0.3178677, -3.711043, 0.3098039, 1, 0, 1,
-0.5932761, 1.181421, -1.009102, 0.3019608, 1, 0, 1,
-0.5846837, -0.4367872, -1.060433, 0.2941177, 1, 0, 1,
-0.5842708, 0.3572975, 0.3333969, 0.2901961, 1, 0, 1,
-0.583201, -0.6930961, -1.862914, 0.282353, 1, 0, 1,
-0.582264, -1.58554, -3.976595, 0.2784314, 1, 0, 1,
-0.5819802, 0.3107165, -2.14717, 0.2705882, 1, 0, 1,
-0.5797299, 0.311774, -1.963666, 0.2666667, 1, 0, 1,
-0.579012, 1.853012, -0.05588849, 0.2588235, 1, 0, 1,
-0.5785149, 0.1198325, -3.061057, 0.254902, 1, 0, 1,
-0.5778458, -0.3390357, -2.533173, 0.2470588, 1, 0, 1,
-0.5773712, -0.4336071, -0.8092558, 0.2431373, 1, 0, 1,
-0.5767117, -0.3670541, -2.62858, 0.2352941, 1, 0, 1,
-0.5748353, 0.8997802, -1.000475, 0.2313726, 1, 0, 1,
-0.5727482, -0.6893932, -3.351154, 0.2235294, 1, 0, 1,
-0.5717208, 0.08340061, -0.7872597, 0.2196078, 1, 0, 1,
-0.5708023, 1.027208, -1.299305, 0.2117647, 1, 0, 1,
-0.5706695, 0.07876763, -1.532793, 0.2078431, 1, 0, 1,
-0.566158, -0.4813742, -1.286171, 0.2, 1, 0, 1,
-0.5642115, 0.6320742, -0.004660992, 0.1921569, 1, 0, 1,
-0.5625835, -0.4350158, -1.529078, 0.1882353, 1, 0, 1,
-0.5570827, -0.01224245, -1.441083, 0.1803922, 1, 0, 1,
-0.5527255, -0.6431094, -1.196711, 0.1764706, 1, 0, 1,
-0.5452923, -1.161532, -1.764013, 0.1686275, 1, 0, 1,
-0.5440553, 0.5540136, -0.2830652, 0.1647059, 1, 0, 1,
-0.5436719, 1.046632, 0.3785164, 0.1568628, 1, 0, 1,
-0.5406352, 0.01425237, -1.703314, 0.1529412, 1, 0, 1,
-0.5393625, -0.6198243, -1.076501, 0.145098, 1, 0, 1,
-0.5391126, -0.5137898, -2.212864, 0.1411765, 1, 0, 1,
-0.5368151, -0.3465281, -2.179431, 0.1333333, 1, 0, 1,
-0.5351772, -1.924468, -2.934198, 0.1294118, 1, 0, 1,
-0.5301281, 1.229552, 1.376391, 0.1215686, 1, 0, 1,
-0.5294298, 0.6679195, -0.698552, 0.1176471, 1, 0, 1,
-0.5217757, -0.7307916, -2.087214, 0.1098039, 1, 0, 1,
-0.5174596, -0.7285362, -2.345479, 0.1058824, 1, 0, 1,
-0.5113125, -0.5451639, -1.474308, 0.09803922, 1, 0, 1,
-0.5103778, -0.8781503, -3.988218, 0.09019608, 1, 0, 1,
-0.5038686, 1.745926, -0.6456749, 0.08627451, 1, 0, 1,
-0.495031, -0.7012345, -2.378172, 0.07843138, 1, 0, 1,
-0.4935138, -0.8301067, -2.597525, 0.07450981, 1, 0, 1,
-0.4920027, 0.250842, -0.7187784, 0.06666667, 1, 0, 1,
-0.4801928, -2.409324, -2.148837, 0.0627451, 1, 0, 1,
-0.4784239, -0.5034554, -1.192067, 0.05490196, 1, 0, 1,
-0.4732804, -0.3926585, -0.5077978, 0.05098039, 1, 0, 1,
-0.4716449, -1.239504, -3.804465, 0.04313726, 1, 0, 1,
-0.4622373, 0.02829455, -0.9231488, 0.03921569, 1, 0, 1,
-0.4618319, -2.545194, -1.539275, 0.03137255, 1, 0, 1,
-0.461621, 0.3749083, -1.099919, 0.02745098, 1, 0, 1,
-0.46025, 2.030961, 1.061739, 0.01960784, 1, 0, 1,
-0.459025, 0.5023206, 1.978238, 0.01568628, 1, 0, 1,
-0.4572072, -1.599307, -5.091515, 0.007843138, 1, 0, 1,
-0.4554374, -0.2479566, -2.296195, 0.003921569, 1, 0, 1,
-0.4535382, -1.311788, -4.28157, 0, 1, 0.003921569, 1,
-0.4533978, 1.815827, 0.01088333, 0, 1, 0.01176471, 1,
-0.4447734, 0.04559264, 0.01061544, 0, 1, 0.01568628, 1,
-0.4438548, 0.5502696, 0.2082394, 0, 1, 0.02352941, 1,
-0.4405164, -0.1090957, -1.766909, 0, 1, 0.02745098, 1,
-0.4366774, 0.07694542, -0.7038929, 0, 1, 0.03529412, 1,
-0.4322013, -1.489439, -1.223055, 0, 1, 0.03921569, 1,
-0.4286139, 0.5956028, 0.1298166, 0, 1, 0.04705882, 1,
-0.4285046, 2.087682, -1.283763, 0, 1, 0.05098039, 1,
-0.42813, 0.4991302, -0.7304659, 0, 1, 0.05882353, 1,
-0.427278, -2.9396, -3.009405, 0, 1, 0.0627451, 1,
-0.4253865, -0.4678267, -2.697256, 0, 1, 0.07058824, 1,
-0.4182559, 1.284836, 0.0452469, 0, 1, 0.07450981, 1,
-0.4158496, -1.577797, -2.730733, 0, 1, 0.08235294, 1,
-0.414761, -2.007668, -1.384115, 0, 1, 0.08627451, 1,
-0.414396, 0.4369333, -2.980543, 0, 1, 0.09411765, 1,
-0.4136298, 1.808994, 1.345613, 0, 1, 0.1019608, 1,
-0.411386, 0.0173002, -1.123863, 0, 1, 0.1058824, 1,
-0.406184, -0.1295596, -3.75931, 0, 1, 0.1137255, 1,
-0.4037187, 0.07391014, -2.526062, 0, 1, 0.1176471, 1,
-0.4030943, -0.7540429, -2.460135, 0, 1, 0.1254902, 1,
-0.403058, 0.4608947, 0.2370605, 0, 1, 0.1294118, 1,
-0.4025995, -0.1139366, -3.485937, 0, 1, 0.1372549, 1,
-0.4024192, -0.6123667, -0.8553094, 0, 1, 0.1411765, 1,
-0.4015977, -1.425708, -0.9227993, 0, 1, 0.1490196, 1,
-0.4014587, 0.2070074, -1.564839, 0, 1, 0.1529412, 1,
-0.4013374, 1.187875, 0.7409135, 0, 1, 0.1607843, 1,
-0.4006662, -2.313545, -3.123066, 0, 1, 0.1647059, 1,
-0.4004443, 0.385698, 0.2973888, 0, 1, 0.172549, 1,
-0.399377, 1.852231, -1.432288, 0, 1, 0.1764706, 1,
-0.3990476, 0.4974346, -0.1334887, 0, 1, 0.1843137, 1,
-0.3984395, -0.9237056, -3.813083, 0, 1, 0.1882353, 1,
-0.3978435, -1.289392, 0.06545776, 0, 1, 0.1960784, 1,
-0.396399, 0.5332079, -1.653729, 0, 1, 0.2039216, 1,
-0.3941402, 0.7735795, -1.523945, 0, 1, 0.2078431, 1,
-0.3907011, -2.743958, -2.501118, 0, 1, 0.2156863, 1,
-0.3893057, 0.1853201, -0.8164492, 0, 1, 0.2196078, 1,
-0.3860904, -0.4155234, -2.323035, 0, 1, 0.227451, 1,
-0.3830386, -1.56979, -2.853529, 0, 1, 0.2313726, 1,
-0.3825739, 1.054365, -0.124328, 0, 1, 0.2392157, 1,
-0.3792523, 1.059916, -0.6328204, 0, 1, 0.2431373, 1,
-0.3777505, -0.5350031, -1.418101, 0, 1, 0.2509804, 1,
-0.3729469, 1.469954, -0.8601685, 0, 1, 0.254902, 1,
-0.3677671, 0.00708147, -0.4982863, 0, 1, 0.2627451, 1,
-0.3670021, 0.85236, -0.9998198, 0, 1, 0.2666667, 1,
-0.3667764, 0.1481988, -3.458289, 0, 1, 0.2745098, 1,
-0.3665976, 0.4770069, 0.09865142, 0, 1, 0.2784314, 1,
-0.3664362, 2.173773, -0.1567347, 0, 1, 0.2862745, 1,
-0.3658063, 1.902466, 0.7251376, 0, 1, 0.2901961, 1,
-0.365254, 1.10402, 0.3279425, 0, 1, 0.2980392, 1,
-0.360954, 0.2051844, 0.8948895, 0, 1, 0.3058824, 1,
-0.3557468, -1.820954, -2.355316, 0, 1, 0.3098039, 1,
-0.3536773, 0.7516874, 0.960206, 0, 1, 0.3176471, 1,
-0.350487, 0.3578759, -2.296265, 0, 1, 0.3215686, 1,
-0.3325376, -1.859809, -0.5806915, 0, 1, 0.3294118, 1,
-0.3300281, 0.1548617, -0.9073064, 0, 1, 0.3333333, 1,
-0.3284009, 0.2553992, -0.2972803, 0, 1, 0.3411765, 1,
-0.324147, -0.2610526, -4.013416, 0, 1, 0.345098, 1,
-0.3240175, -0.1627733, -1.884406, 0, 1, 0.3529412, 1,
-0.3224701, 1.299485, 1.064299, 0, 1, 0.3568628, 1,
-0.3154943, -0.9632539, -0.6922689, 0, 1, 0.3647059, 1,
-0.3144091, 0.5905739, 0.689155, 0, 1, 0.3686275, 1,
-0.3130077, 0.6294951, 0.2993868, 0, 1, 0.3764706, 1,
-0.3120146, 0.02417398, -1.036973, 0, 1, 0.3803922, 1,
-0.3091771, -0.648756, -4.536694, 0, 1, 0.3882353, 1,
-0.3085769, -0.01770162, -1.809082, 0, 1, 0.3921569, 1,
-0.3012652, -1.850882, -2.821932, 0, 1, 0.4, 1,
-0.2981349, -0.9312329, -1.733899, 0, 1, 0.4078431, 1,
-0.2977682, -0.9316233, -2.79717, 0, 1, 0.4117647, 1,
-0.2891624, -0.690111, -1.91271, 0, 1, 0.4196078, 1,
-0.2874493, 0.2867375, -1.234546, 0, 1, 0.4235294, 1,
-0.2850008, -1.47011, -1.743629, 0, 1, 0.4313726, 1,
-0.2762717, 1.813729, -0.6793806, 0, 1, 0.4352941, 1,
-0.2742016, -1.497653, -3.556861, 0, 1, 0.4431373, 1,
-0.2685415, -1.666702, -3.705359, 0, 1, 0.4470588, 1,
-0.2678014, -0.7954757, -2.832262, 0, 1, 0.454902, 1,
-0.2659982, 1.459026, -2.952576, 0, 1, 0.4588235, 1,
-0.2617806, 1.693437, 2.035032, 0, 1, 0.4666667, 1,
-0.2589284, 0.3885783, -0.8686197, 0, 1, 0.4705882, 1,
-0.2557999, -0.4778768, -1.501456, 0, 1, 0.4784314, 1,
-0.2528775, 0.9299246, -0.8273665, 0, 1, 0.4823529, 1,
-0.2471533, -0.6743994, -1.7206, 0, 1, 0.4901961, 1,
-0.2469565, -1.400776, -1.065697, 0, 1, 0.4941176, 1,
-0.2467705, 1.479283, -0.1480404, 0, 1, 0.5019608, 1,
-0.2421321, 1.207516, -0.1244709, 0, 1, 0.509804, 1,
-0.2410169, 0.09598375, -1.865086, 0, 1, 0.5137255, 1,
-0.2393525, 0.02418637, -1.231924, 0, 1, 0.5215687, 1,
-0.2296447, 0.2678041, -1.246406, 0, 1, 0.5254902, 1,
-0.228195, 0.1143812, -0.8327073, 0, 1, 0.5333334, 1,
-0.2271613, 0.04421122, -0.9445388, 0, 1, 0.5372549, 1,
-0.2230431, 0.08794365, -0.2312699, 0, 1, 0.5450981, 1,
-0.2173149, -0.06106134, -0.8786789, 0, 1, 0.5490196, 1,
-0.2160724, 1.414194, -2.494637, 0, 1, 0.5568628, 1,
-0.2155369, -2.801644, -2.64801, 0, 1, 0.5607843, 1,
-0.2146396, 1.024124, -0.6872008, 0, 1, 0.5686275, 1,
-0.2133516, 0.04800024, -2.239314, 0, 1, 0.572549, 1,
-0.212269, -0.5976918, -2.123322, 0, 1, 0.5803922, 1,
-0.2061342, -0.1303144, -2.079159, 0, 1, 0.5843138, 1,
-0.2059143, 0.9316048, -1.162019, 0, 1, 0.5921569, 1,
-0.2056346, 1.725337, -0.3413523, 0, 1, 0.5960785, 1,
-0.2054424, -0.02039926, -3.240585, 0, 1, 0.6039216, 1,
-0.20519, -0.3148347, -2.765635, 0, 1, 0.6117647, 1,
-0.2029646, -0.6325024, -2.136651, 0, 1, 0.6156863, 1,
-0.200985, 0.003432216, -1.331003, 0, 1, 0.6235294, 1,
-0.2006546, 0.9739241, -2.298063, 0, 1, 0.627451, 1,
-0.1991526, 0.05955431, -0.2816121, 0, 1, 0.6352941, 1,
-0.1955175, 1.379392, 1.530168, 0, 1, 0.6392157, 1,
-0.1895839, 0.2146556, -2.746842, 0, 1, 0.6470588, 1,
-0.1884513, -3.162428, -1.77358, 0, 1, 0.6509804, 1,
-0.1845806, 0.005798148, -2.665683, 0, 1, 0.6588235, 1,
-0.1815358, -0.2895294, -3.642842, 0, 1, 0.6627451, 1,
-0.1812791, 0.2247, -2.284618, 0, 1, 0.6705883, 1,
-0.1778761, 1.104191, 0.3072779, 0, 1, 0.6745098, 1,
-0.1774831, -0.2295647, -2.845359, 0, 1, 0.682353, 1,
-0.1766486, -0.914472, -2.892872, 0, 1, 0.6862745, 1,
-0.1732361, -0.227744, -2.719611, 0, 1, 0.6941177, 1,
-0.169861, 0.7129495, -1.541625, 0, 1, 0.7019608, 1,
-0.1693019, 1.424849, 0.02764199, 0, 1, 0.7058824, 1,
-0.1668423, -0.6748382, -1.662457, 0, 1, 0.7137255, 1,
-0.1657604, -1.375473, -1.954994, 0, 1, 0.7176471, 1,
-0.164138, -1.638928, -3.911299, 0, 1, 0.7254902, 1,
-0.1563205, 1.643621, -0.8329557, 0, 1, 0.7294118, 1,
-0.1544841, -0.1254074, -2.199376, 0, 1, 0.7372549, 1,
-0.1542298, -1.042911, -2.089795, 0, 1, 0.7411765, 1,
-0.1516671, 0.8472512, 0.03480102, 0, 1, 0.7490196, 1,
-0.1508762, 0.9092537, -0.7319694, 0, 1, 0.7529412, 1,
-0.1454474, -0.8742155, -2.194834, 0, 1, 0.7607843, 1,
-0.139601, 0.09357001, -3.694893, 0, 1, 0.7647059, 1,
-0.1350014, 1.877491, -0.4868329, 0, 1, 0.772549, 1,
-0.1345961, 1.411351, -1.131351, 0, 1, 0.7764706, 1,
-0.1341958, -0.6315135, -2.726518, 0, 1, 0.7843137, 1,
-0.1324985, -0.09691489, -3.835914, 0, 1, 0.7882353, 1,
-0.1287926, 2.967742, 0.2549812, 0, 1, 0.7960784, 1,
-0.1266262, -0.6085156, -2.802217, 0, 1, 0.8039216, 1,
-0.1223293, 0.7903813, 0.2783005, 0, 1, 0.8078431, 1,
-0.121561, -0.5129706, -3.226256, 0, 1, 0.8156863, 1,
-0.1168998, 0.3137394, -0.8011196, 0, 1, 0.8196079, 1,
-0.1114132, 0.7777118, -0.537574, 0, 1, 0.827451, 1,
-0.109205, -1.009418, -2.115145, 0, 1, 0.8313726, 1,
-0.1089829, 1.321983, -1.055894, 0, 1, 0.8392157, 1,
-0.1059879, 0.2756813, -1.221432, 0, 1, 0.8431373, 1,
-0.1017357, -0.1347746, -4.244639, 0, 1, 0.8509804, 1,
-0.09961516, -2.5157, -3.34129, 0, 1, 0.854902, 1,
-0.09934782, 1.190765, 0.892883, 0, 1, 0.8627451, 1,
-0.09715226, 1.441666, 0.181427, 0, 1, 0.8666667, 1,
-0.09681781, -1.951046, -2.707974, 0, 1, 0.8745098, 1,
-0.09575517, -0.2292353, -1.831928, 0, 1, 0.8784314, 1,
-0.08928035, -0.856932, -2.454288, 0, 1, 0.8862745, 1,
-0.08896275, 0.1752304, 0.1995948, 0, 1, 0.8901961, 1,
-0.08251607, 0.788739, -0.4659742, 0, 1, 0.8980392, 1,
-0.08193278, 0.8183457, 0.5539755, 0, 1, 0.9058824, 1,
-0.08039606, 0.2129064, -0.3982142, 0, 1, 0.9098039, 1,
-0.07973676, -1.449303, -2.621366, 0, 1, 0.9176471, 1,
-0.07597084, 0.2711405, -0.2017867, 0, 1, 0.9215686, 1,
-0.07521012, 1.240389, 0.6737526, 0, 1, 0.9294118, 1,
-0.07517077, -0.6159416, -3.813044, 0, 1, 0.9333333, 1,
-0.0721348, -0.3743963, -3.150818, 0, 1, 0.9411765, 1,
-0.06587794, 0.8416621, 0.3455135, 0, 1, 0.945098, 1,
-0.0629278, -0.486495, -3.761268, 0, 1, 0.9529412, 1,
-0.06046108, 1.27399, 3.170367, 0, 1, 0.9568627, 1,
-0.05911698, -0.6950651, -3.024107, 0, 1, 0.9647059, 1,
-0.05734016, 1.167493, -0.4274308, 0, 1, 0.9686275, 1,
-0.05267227, -1.573125, -2.720813, 0, 1, 0.9764706, 1,
-0.05266654, 1.299526, -0.5775768, 0, 1, 0.9803922, 1,
-0.05006817, 0.07031288, 0.1613412, 0, 1, 0.9882353, 1,
-0.04699217, -0.899677, -2.658818, 0, 1, 0.9921569, 1,
-0.0463129, 0.5356213, 0.8005946, 0, 1, 1, 1,
-0.04589566, -2.962157, -3.353515, 0, 0.9921569, 1, 1,
-0.04423245, 0.3138839, -1.942996, 0, 0.9882353, 1, 1,
-0.04392958, -1.113123, -3.651211, 0, 0.9803922, 1, 1,
-0.04168664, -1.355425, -4.81228, 0, 0.9764706, 1, 1,
-0.03277589, -0.7059609, -2.908239, 0, 0.9686275, 1, 1,
-0.03068237, 0.1953288, -0.3485596, 0, 0.9647059, 1, 1,
-0.02560425, 0.5111654, 0.5823102, 0, 0.9568627, 1, 1,
-0.02438804, 0.7221227, -0.5815846, 0, 0.9529412, 1, 1,
-0.02039104, -1.09274, -2.786969, 0, 0.945098, 1, 1,
-0.01902636, 0.6907729, 1.177368, 0, 0.9411765, 1, 1,
-0.01740659, -1.275978, -3.44927, 0, 0.9333333, 1, 1,
-0.01605173, -1.368559, -1.626797, 0, 0.9294118, 1, 1,
-0.01561952, 0.1054992, 0.1401152, 0, 0.9215686, 1, 1,
-0.01418181, -1.369397, -3.947713, 0, 0.9176471, 1, 1,
-0.01384174, 0.9730939, 1.459142, 0, 0.9098039, 1, 1,
-0.01017776, 0.1291167, 0.1175385, 0, 0.9058824, 1, 1,
-0.009651659, -1.987676, -3.379181, 0, 0.8980392, 1, 1,
-0.00872917, 1.512697, 1.379251, 0, 0.8901961, 1, 1,
-0.006749101, -0.2952204, -2.920164, 0, 0.8862745, 1, 1,
-0.006332437, 1.111456, 1.007445, 0, 0.8784314, 1, 1,
-0.004596275, -0.06673016, -3.189759, 0, 0.8745098, 1, 1,
-0.002783132, -1.756521, -4.08629, 0, 0.8666667, 1, 1,
-0.002009354, 0.5126712, -0.02961806, 0, 0.8627451, 1, 1,
-0.001059117, 0.2911597, -1.026133, 0, 0.854902, 1, 1,
-0.0002733802, -0.7603205, -2.644672, 0, 0.8509804, 1, 1,
0.0004021117, 1.22176, -1.516372, 0, 0.8431373, 1, 1,
0.003223111, 0.7573541, 0.4506096, 0, 0.8392157, 1, 1,
0.006063419, 0.2455328, -0.2635376, 0, 0.8313726, 1, 1,
0.006367486, -0.1475174, 2.337817, 0, 0.827451, 1, 1,
0.008381275, 1.026494, -0.2416346, 0, 0.8196079, 1, 1,
0.008492791, 0.9040108, -0.2295141, 0, 0.8156863, 1, 1,
0.009399528, -0.7797972, 2.458586, 0, 0.8078431, 1, 1,
0.01114257, -0.1818845, 1.645003, 0, 0.8039216, 1, 1,
0.01123056, 1.473158, 1.157519, 0, 0.7960784, 1, 1,
0.01279065, -2.261077, 3.150559, 0, 0.7882353, 1, 1,
0.01316892, 1.09097, -0.3422686, 0, 0.7843137, 1, 1,
0.02311894, -0.0412135, 4.068956, 0, 0.7764706, 1, 1,
0.02320025, 0.6341944, 1.713314, 0, 0.772549, 1, 1,
0.02341943, 1.297323, 1.639213, 0, 0.7647059, 1, 1,
0.02367212, -1.382766, 2.021151, 0, 0.7607843, 1, 1,
0.02561891, -0.1081522, 2.19468, 0, 0.7529412, 1, 1,
0.02786898, -0.212822, 2.952488, 0, 0.7490196, 1, 1,
0.0318464, 0.500426, -1.260309, 0, 0.7411765, 1, 1,
0.03700695, 0.1510221, 0.2637915, 0, 0.7372549, 1, 1,
0.03896257, 0.7101809, 0.4966622, 0, 0.7294118, 1, 1,
0.04302715, 0.483952, 0.4691573, 0, 0.7254902, 1, 1,
0.04439275, 0.7541403, 0.2972159, 0, 0.7176471, 1, 1,
0.04792232, -1.208973, 5.082401, 0, 0.7137255, 1, 1,
0.04982324, 2.087806, -0.2114487, 0, 0.7058824, 1, 1,
0.05002308, -0.5435995, 3.977582, 0, 0.6980392, 1, 1,
0.05003465, -0.1569913, 2.659678, 0, 0.6941177, 1, 1,
0.05274373, 0.2533924, 0.09947775, 0, 0.6862745, 1, 1,
0.05751376, -1.745029, 2.17591, 0, 0.682353, 1, 1,
0.05907293, -1.61059, 4.334778, 0, 0.6745098, 1, 1,
0.05934167, -0.2981013, 3.946675, 0, 0.6705883, 1, 1,
0.06352555, 2.266017, -2.838004, 0, 0.6627451, 1, 1,
0.06440234, 0.09711063, 1.195021, 0, 0.6588235, 1, 1,
0.07019319, 0.4702139, -0.7503204, 0, 0.6509804, 1, 1,
0.07086198, 0.0275201, 2.264719, 0, 0.6470588, 1, 1,
0.07617982, 0.1236724, 0.9790156, 0, 0.6392157, 1, 1,
0.07816345, 0.3615546, 1.172005, 0, 0.6352941, 1, 1,
0.08383695, -1.704406, 2.525883, 0, 0.627451, 1, 1,
0.08435352, 0.9940479, 1.392501, 0, 0.6235294, 1, 1,
0.08602504, -0.03690675, 2.774679, 0, 0.6156863, 1, 1,
0.08665413, -1.257577, 2.667447, 0, 0.6117647, 1, 1,
0.08730158, -0.5216299, 4.722476, 0, 0.6039216, 1, 1,
0.09326129, 0.3950068, 1.016747, 0, 0.5960785, 1, 1,
0.09360217, 1.413472, -1.291158, 0, 0.5921569, 1, 1,
0.09672075, 1.523306, 1.068882, 0, 0.5843138, 1, 1,
0.09891375, 1.512588, -0.688872, 0, 0.5803922, 1, 1,
0.09969129, 1.60934, -1.398542, 0, 0.572549, 1, 1,
0.09997959, -0.02484753, 1.659965, 0, 0.5686275, 1, 1,
0.1081057, -1.61837, 1.720205, 0, 0.5607843, 1, 1,
0.1127046, -0.2876459, 2.873122, 0, 0.5568628, 1, 1,
0.1130207, 0.5097563, 0.2923805, 0, 0.5490196, 1, 1,
0.1275709, -0.7863265, 2.493417, 0, 0.5450981, 1, 1,
0.1277217, -1.48061, 3.300857, 0, 0.5372549, 1, 1,
0.1304326, 0.1981311, 0.1868315, 0, 0.5333334, 1, 1,
0.1323423, 0.1321381, 0.2932843, 0, 0.5254902, 1, 1,
0.1329632, -0.3220828, 1.947839, 0, 0.5215687, 1, 1,
0.1351428, 0.6359465, 1.244883, 0, 0.5137255, 1, 1,
0.1374608, -0.2566261, 1.950776, 0, 0.509804, 1, 1,
0.1376752, 0.5662572, 1.258948, 0, 0.5019608, 1, 1,
0.1397046, 1.100881, 0.3719871, 0, 0.4941176, 1, 1,
0.1417381, -0.2383939, 2.654483, 0, 0.4901961, 1, 1,
0.1441144, -1.456166, 2.969571, 0, 0.4823529, 1, 1,
0.1452061, 1.42696, -0.05187744, 0, 0.4784314, 1, 1,
0.1467021, 0.2212259, -0.0958335, 0, 0.4705882, 1, 1,
0.1501963, 0.400748, 0.6580546, 0, 0.4666667, 1, 1,
0.1512965, 0.1757613, 0.2401981, 0, 0.4588235, 1, 1,
0.1513432, 0.3436078, 1.521572, 0, 0.454902, 1, 1,
0.1574724, 0.376371, 0.4734074, 0, 0.4470588, 1, 1,
0.1609454, 0.6636293, -0.01529615, 0, 0.4431373, 1, 1,
0.1635182, 1.10433, -0.7504587, 0, 0.4352941, 1, 1,
0.1661606, -0.3611, 2.987775, 0, 0.4313726, 1, 1,
0.1686204, -0.7925514, 4.151512, 0, 0.4235294, 1, 1,
0.1707435, -1.49016, 3.525248, 0, 0.4196078, 1, 1,
0.1754027, -0.2231945, 2.181989, 0, 0.4117647, 1, 1,
0.1790255, -0.5164584, 3.724398, 0, 0.4078431, 1, 1,
0.1808961, -2.204823, 1.91091, 0, 0.4, 1, 1,
0.1814251, -0.3155182, 1.452505, 0, 0.3921569, 1, 1,
0.1815438, -0.3104552, 1.931134, 0, 0.3882353, 1, 1,
0.1876124, -0.5188657, 1.281565, 0, 0.3803922, 1, 1,
0.1878252, -0.2317557, 3.309189, 0, 0.3764706, 1, 1,
0.1911442, 0.3143867, 1.137116, 0, 0.3686275, 1, 1,
0.1963454, -0.4177843, 3.201916, 0, 0.3647059, 1, 1,
0.2018985, -0.2876271, 1.156131, 0, 0.3568628, 1, 1,
0.2027989, 0.7175332, 1.673856, 0, 0.3529412, 1, 1,
0.2076047, -0.5514175, 3.000716, 0, 0.345098, 1, 1,
0.209199, -0.433543, 2.207793, 0, 0.3411765, 1, 1,
0.2116658, 1.031313, 0.4517286, 0, 0.3333333, 1, 1,
0.2170432, -0.6778545, 2.455866, 0, 0.3294118, 1, 1,
0.228794, -1.062709, 2.913616, 0, 0.3215686, 1, 1,
0.2297746, 0.5629594, -0.4633562, 0, 0.3176471, 1, 1,
0.2313667, -0.7976179, 1.782127, 0, 0.3098039, 1, 1,
0.2318618, 1.486618, 0.7566825, 0, 0.3058824, 1, 1,
0.2328034, 0.3587428, 1.384168, 0, 0.2980392, 1, 1,
0.238385, 1.322945, -1.272174, 0, 0.2901961, 1, 1,
0.2388175, 1.147556, 1.404357, 0, 0.2862745, 1, 1,
0.2502305, 0.4427935, 2.331119, 0, 0.2784314, 1, 1,
0.255586, 0.5205382, 1.722993, 0, 0.2745098, 1, 1,
0.2588298, -0.751271, 1.998137, 0, 0.2666667, 1, 1,
0.2599404, -1.128142, 1.777421, 0, 0.2627451, 1, 1,
0.2664093, 0.1599574, 1.449654, 0, 0.254902, 1, 1,
0.2687436, 0.6996867, -1.208394, 0, 0.2509804, 1, 1,
0.2713836, 0.3559983, -0.3188592, 0, 0.2431373, 1, 1,
0.2733369, -0.4452968, 2.140233, 0, 0.2392157, 1, 1,
0.2750621, 1.620719, 1.915332, 0, 0.2313726, 1, 1,
0.2751145, 0.507829, 0.5350443, 0, 0.227451, 1, 1,
0.276637, -0.1682243, 2.409594, 0, 0.2196078, 1, 1,
0.2798219, -0.9304572, 3.369822, 0, 0.2156863, 1, 1,
0.2815135, 0.6706522, -0.455565, 0, 0.2078431, 1, 1,
0.2817575, 0.4988204, 1.691954, 0, 0.2039216, 1, 1,
0.2836956, 0.1268788, 1.480297, 0, 0.1960784, 1, 1,
0.2875252, -0.9175199, 2.610198, 0, 0.1882353, 1, 1,
0.2894366, 0.7154163, -0.459995, 0, 0.1843137, 1, 1,
0.2931356, 1.781178, 1.029979, 0, 0.1764706, 1, 1,
0.294981, -0.8043301, 2.436644, 0, 0.172549, 1, 1,
0.2950224, 1.0919, -0.4375117, 0, 0.1647059, 1, 1,
0.297793, 1.613189, 0.2136492, 0, 0.1607843, 1, 1,
0.2982024, -0.7548179, 3.622075, 0, 0.1529412, 1, 1,
0.3066519, 0.3131773, 0.98899, 0, 0.1490196, 1, 1,
0.3162662, -0.226153, 3.986314, 0, 0.1411765, 1, 1,
0.3219782, -1.131662, 1.295629, 0, 0.1372549, 1, 1,
0.3235751, -0.5253393, 2.779408, 0, 0.1294118, 1, 1,
0.3243223, -0.1171882, 2.422486, 0, 0.1254902, 1, 1,
0.3265793, 1.515193, -0.8446053, 0, 0.1176471, 1, 1,
0.3314286, -0.8996084, 3.908201, 0, 0.1137255, 1, 1,
0.3328049, 0.9620265, 0.6085928, 0, 0.1058824, 1, 1,
0.3371533, -1.157727, 2.317383, 0, 0.09803922, 1, 1,
0.3391121, -0.888303, 3.069924, 0, 0.09411765, 1, 1,
0.3404008, -0.3413736, 1.207773, 0, 0.08627451, 1, 1,
0.3409808, -0.07575094, 1.953992, 0, 0.08235294, 1, 1,
0.3417192, -0.4524163, 1.234704, 0, 0.07450981, 1, 1,
0.3417999, 1.684154, -0.3819397, 0, 0.07058824, 1, 1,
0.3432581, -0.09195221, 0.7893392, 0, 0.0627451, 1, 1,
0.3522656, -0.870656, 3.872905, 0, 0.05882353, 1, 1,
0.3591398, 0.7956869, 1.154103, 0, 0.05098039, 1, 1,
0.3611615, -0.4003707, 2.437093, 0, 0.04705882, 1, 1,
0.3687003, 1.160783, 1.734777, 0, 0.03921569, 1, 1,
0.3696207, 0.1159258, 1.310303, 0, 0.03529412, 1, 1,
0.3744565, 0.4822805, -0.4444892, 0, 0.02745098, 1, 1,
0.3773879, -1.822352, 3.392085, 0, 0.02352941, 1, 1,
0.3818207, -0.5024098, 1.965479, 0, 0.01568628, 1, 1,
0.3860326, -0.7482947, 1.042413, 0, 0.01176471, 1, 1,
0.3867739, 0.7475935, -0.9675618, 0, 0.003921569, 1, 1,
0.3869249, 0.598989, -0.1546912, 0.003921569, 0, 1, 1,
0.3878266, -1.031831, 1.881598, 0.007843138, 0, 1, 1,
0.3888448, -1.757267, 1.390128, 0.01568628, 0, 1, 1,
0.3892759, 0.2885948, 0.4057755, 0.01960784, 0, 1, 1,
0.4032563, -2.764975, 4.025464, 0.02745098, 0, 1, 1,
0.4075894, -0.3409154, 1.958115, 0.03137255, 0, 1, 1,
0.4144573, -1.47868, 3.181383, 0.03921569, 0, 1, 1,
0.4227747, 0.1910166, 0.6587359, 0.04313726, 0, 1, 1,
0.4237758, 0.1449317, 1.689193, 0.05098039, 0, 1, 1,
0.4275961, 0.3697816, -0.6001037, 0.05490196, 0, 1, 1,
0.4287685, -1.121528, 3.524603, 0.0627451, 0, 1, 1,
0.4322245, 0.6810356, -0.5701979, 0.06666667, 0, 1, 1,
0.4322997, -0.5758915, 1.272786, 0.07450981, 0, 1, 1,
0.4329184, -0.01740769, 0.1958815, 0.07843138, 0, 1, 1,
0.4334499, -0.7929454, 2.76715, 0.08627451, 0, 1, 1,
0.4362845, 0.6669136, 0.574233, 0.09019608, 0, 1, 1,
0.4451801, 0.03471721, -0.6585419, 0.09803922, 0, 1, 1,
0.4455193, -1.608029, 4.364467, 0.1058824, 0, 1, 1,
0.4476954, 0.3554161, 0.5425661, 0.1098039, 0, 1, 1,
0.4567594, 0.3170917, -0.2754878, 0.1176471, 0, 1, 1,
0.4609523, 0.6040783, 0.8158079, 0.1215686, 0, 1, 1,
0.4629892, 0.09173746, 2.739679, 0.1294118, 0, 1, 1,
0.4673631, -1.741216, 2.201693, 0.1333333, 0, 1, 1,
0.4686246, 0.8923384, 1.289417, 0.1411765, 0, 1, 1,
0.4721574, 0.3680126, 0.3047914, 0.145098, 0, 1, 1,
0.4771062, 0.3890657, 0.6305397, 0.1529412, 0, 1, 1,
0.4772538, -0.6338462, 4.392358, 0.1568628, 0, 1, 1,
0.4793707, -0.4824326, 2.319125, 0.1647059, 0, 1, 1,
0.4851463, -0.3257158, 1.523293, 0.1686275, 0, 1, 1,
0.4885988, 0.2819854, 1.7908, 0.1764706, 0, 1, 1,
0.4898175, -0.6856784, 0.9537141, 0.1803922, 0, 1, 1,
0.4945987, -2.425183, 5.216795, 0.1882353, 0, 1, 1,
0.4952311, -0.3827328, 3.685694, 0.1921569, 0, 1, 1,
0.4997613, -0.7845575, 1.836875, 0.2, 0, 1, 1,
0.5015184, -0.3086591, 4.590401, 0.2078431, 0, 1, 1,
0.5020807, 0.3507324, -0.2105615, 0.2117647, 0, 1, 1,
0.5039969, -0.168388, 1.130698, 0.2196078, 0, 1, 1,
0.5082159, -0.07461606, 1.510804, 0.2235294, 0, 1, 1,
0.5093634, 2.072891, 0.7716665, 0.2313726, 0, 1, 1,
0.5098481, -0.532159, 1.548023, 0.2352941, 0, 1, 1,
0.5142372, -1.382455, 3.793391, 0.2431373, 0, 1, 1,
0.5143701, -1.031628, 1.604259, 0.2470588, 0, 1, 1,
0.5235915, -0.2835359, 1.316315, 0.254902, 0, 1, 1,
0.5246214, 0.2200736, 0.2893428, 0.2588235, 0, 1, 1,
0.5287054, -0.9871911, 2.701763, 0.2666667, 0, 1, 1,
0.5307923, 0.2251776, 2.328709, 0.2705882, 0, 1, 1,
0.5372, -0.7003369, 0.8562846, 0.2784314, 0, 1, 1,
0.5420324, 0.6501494, 1.619547, 0.282353, 0, 1, 1,
0.5461343, -0.6206225, 2.219027, 0.2901961, 0, 1, 1,
0.5472972, 0.920608, 1.01679, 0.2941177, 0, 1, 1,
0.5508463, -3.373156, 4.723826, 0.3019608, 0, 1, 1,
0.5515078, 0.1228791, 1.559152, 0.3098039, 0, 1, 1,
0.5528738, -0.8171408, 0.8896154, 0.3137255, 0, 1, 1,
0.5590212, 1.101467, -0.6007568, 0.3215686, 0, 1, 1,
0.5632634, -1.599108, 4.735264, 0.3254902, 0, 1, 1,
0.5663447, 0.26684, 2.037029, 0.3333333, 0, 1, 1,
0.5671324, -0.6402434, 2.77509, 0.3372549, 0, 1, 1,
0.5695733, -0.3483936, 2.935589, 0.345098, 0, 1, 1,
0.5738205, -0.3917784, 1.813123, 0.3490196, 0, 1, 1,
0.5743999, -1.18753, 4.193322, 0.3568628, 0, 1, 1,
0.5747366, 1.4721, 0.3172967, 0.3607843, 0, 1, 1,
0.5817593, -0.3788891, 3.426736, 0.3686275, 0, 1, 1,
0.5871745, 0.7051154, -0.3832008, 0.372549, 0, 1, 1,
0.5895624, 0.5136687, 0.2265396, 0.3803922, 0, 1, 1,
0.5928933, 0.4156519, -0.09896728, 0.3843137, 0, 1, 1,
0.5997421, 1.680456, 0.08819968, 0.3921569, 0, 1, 1,
0.6000705, 0.3147942, 1.58186, 0.3960784, 0, 1, 1,
0.6023788, -2.202375, 3.141419, 0.4039216, 0, 1, 1,
0.6035526, -1.786568, 2.963948, 0.4117647, 0, 1, 1,
0.6102708, -0.1880478, 2.461459, 0.4156863, 0, 1, 1,
0.6156693, -0.2709846, 1.541792, 0.4235294, 0, 1, 1,
0.6167131, 0.4253014, 3.716592, 0.427451, 0, 1, 1,
0.6193377, 1.565868, 0.2535384, 0.4352941, 0, 1, 1,
0.6230198, 1.019898, 0.3612488, 0.4392157, 0, 1, 1,
0.6283312, 0.9605905, 0.7765929, 0.4470588, 0, 1, 1,
0.6338651, -0.9578475, 3.745123, 0.4509804, 0, 1, 1,
0.6363618, 0.6314695, -0.1591503, 0.4588235, 0, 1, 1,
0.6388983, 0.0001353336, 0.3310636, 0.4627451, 0, 1, 1,
0.6400474, -0.3942083, 2.3296, 0.4705882, 0, 1, 1,
0.6436843, -0.2828815, 2.326032, 0.4745098, 0, 1, 1,
0.6483542, -0.2757871, 1.379935, 0.4823529, 0, 1, 1,
0.6540414, -0.5825531, 4.09931, 0.4862745, 0, 1, 1,
0.6553918, -2.373808e-05, 1.675177, 0.4941176, 0, 1, 1,
0.6571964, 0.9950301, 1.126913, 0.5019608, 0, 1, 1,
0.6613006, 0.09899114, 2.722923, 0.5058824, 0, 1, 1,
0.664402, 1.802283, 0.704771, 0.5137255, 0, 1, 1,
0.6657208, 0.2796614, 2.304739, 0.5176471, 0, 1, 1,
0.6789129, 0.5044484, 0.2746401, 0.5254902, 0, 1, 1,
0.6801137, -0.1827634, 1.34638, 0.5294118, 0, 1, 1,
0.6806625, 0.3832571, 0.894864, 0.5372549, 0, 1, 1,
0.6856733, 2.340092, 2.524427, 0.5411765, 0, 1, 1,
0.6863431, 0.1501481, 2.139908, 0.5490196, 0, 1, 1,
0.6892951, 1.006379, 2.139775, 0.5529412, 0, 1, 1,
0.6927811, 0.2858395, 1.412327, 0.5607843, 0, 1, 1,
0.6988384, -0.03188504, 1.77439, 0.5647059, 0, 1, 1,
0.699102, -0.04498302, 2.238574, 0.572549, 0, 1, 1,
0.7041227, 1.010165, 1.054084, 0.5764706, 0, 1, 1,
0.7052035, 0.5394034, 2.155378, 0.5843138, 0, 1, 1,
0.7075868, 1.286118, 0.7520252, 0.5882353, 0, 1, 1,
0.7097069, 0.003676346, 0.2940235, 0.5960785, 0, 1, 1,
0.711403, 0.4204814, -0.0873258, 0.6039216, 0, 1, 1,
0.7209309, 1.356893, 0.5573343, 0.6078432, 0, 1, 1,
0.7214975, 0.4121789, 3.660886, 0.6156863, 0, 1, 1,
0.7221225, -0.4297657, 1.812212, 0.6196079, 0, 1, 1,
0.726382, -1.526733, 1.977201, 0.627451, 0, 1, 1,
0.7282484, 0.3388352, 0.6182998, 0.6313726, 0, 1, 1,
0.7299469, -0.3545483, 3.570426, 0.6392157, 0, 1, 1,
0.7321364, 0.1006043, 2.055786, 0.6431373, 0, 1, 1,
0.7354635, 0.4170333, 1.472349, 0.6509804, 0, 1, 1,
0.7381804, -1.267, 2.575555, 0.654902, 0, 1, 1,
0.7458262, -1.270732, 3.88674, 0.6627451, 0, 1, 1,
0.7485758, 0.7887955, 2.335442, 0.6666667, 0, 1, 1,
0.7497609, 0.8239808, 0.7350249, 0.6745098, 0, 1, 1,
0.756986, -0.09686702, 1.776903, 0.6784314, 0, 1, 1,
0.7650988, -0.3581498, 2.943432, 0.6862745, 0, 1, 1,
0.7669626, 0.547406, 1.207971, 0.6901961, 0, 1, 1,
0.7724867, 0.8167977, 0.9144962, 0.6980392, 0, 1, 1,
0.7744512, -1.108585, 2.306492, 0.7058824, 0, 1, 1,
0.7752609, 0.2792161, 2.040884, 0.7098039, 0, 1, 1,
0.7767443, -0.1985655, 2.070588, 0.7176471, 0, 1, 1,
0.7775822, 0.6539449, 0.03528227, 0.7215686, 0, 1, 1,
0.7777542, 0.7302943, 0.2934298, 0.7294118, 0, 1, 1,
0.7806874, -0.8220422, 0.2860416, 0.7333333, 0, 1, 1,
0.7826048, 0.2077342, 1.843656, 0.7411765, 0, 1, 1,
0.7848733, -0.2637121, 0.5086949, 0.7450981, 0, 1, 1,
0.7849285, -0.3278015, 2.600644, 0.7529412, 0, 1, 1,
0.7998429, -0.2976488, 1.525924, 0.7568628, 0, 1, 1,
0.8028198, 0.825672, 1.193345, 0.7647059, 0, 1, 1,
0.8038488, 1.802943, 0.2503385, 0.7686275, 0, 1, 1,
0.8121938, -0.6488368, 3.969568, 0.7764706, 0, 1, 1,
0.8206883, 0.5607889, -0.3263732, 0.7803922, 0, 1, 1,
0.8224524, 0.2946786, 2.247216, 0.7882353, 0, 1, 1,
0.8228678, 1.224358, 1.297127, 0.7921569, 0, 1, 1,
0.8239477, -1.198802, 2.273635, 0.8, 0, 1, 1,
0.824292, 0.08011851, 2.345234, 0.8078431, 0, 1, 1,
0.8311808, -2.508508, 2.91961, 0.8117647, 0, 1, 1,
0.8329713, -0.6031504, 2.716758, 0.8196079, 0, 1, 1,
0.8331865, 0.8590766, 1.832935, 0.8235294, 0, 1, 1,
0.8350703, -0.9147535, 1.617037, 0.8313726, 0, 1, 1,
0.8370124, 0.6773117, 2.076677, 0.8352941, 0, 1, 1,
0.8399484, -0.8889207, 2.759641, 0.8431373, 0, 1, 1,
0.84288, 1.676766, 0.7100203, 0.8470588, 0, 1, 1,
0.850714, 0.3951312, 1.54162, 0.854902, 0, 1, 1,
0.8583877, 0.6360466, 0.362171, 0.8588235, 0, 1, 1,
0.8697376, 0.5478285, 0.09090089, 0.8666667, 0, 1, 1,
0.8702619, -1.198864, 1.779853, 0.8705882, 0, 1, 1,
0.8740695, 2.091408, 1.771235, 0.8784314, 0, 1, 1,
0.8751146, -0.2012885, 0.6395353, 0.8823529, 0, 1, 1,
0.8761132, 1.816965, -0.5902427, 0.8901961, 0, 1, 1,
0.8769732, 0.5450874, 0.9169587, 0.8941177, 0, 1, 1,
0.8771152, -1.352814, 1.019801, 0.9019608, 0, 1, 1,
0.8951445, -0.01505516, 0.5553868, 0.9098039, 0, 1, 1,
0.9017334, 0.3905867, 1.492166, 0.9137255, 0, 1, 1,
0.902217, -2.200351, 1.488836, 0.9215686, 0, 1, 1,
0.9033173, 0.1150135, 1.173812, 0.9254902, 0, 1, 1,
0.9066681, 0.8240954, -0.02509958, 0.9333333, 0, 1, 1,
0.9102786, 1.159625, 0.8603091, 0.9372549, 0, 1, 1,
0.9133697, 0.8107996, 0.9645174, 0.945098, 0, 1, 1,
0.9154266, 0.4868485, 0.3399742, 0.9490196, 0, 1, 1,
0.9232581, 0.3776625, 1.315448, 0.9568627, 0, 1, 1,
0.9241958, 1.704326, 1.576608, 0.9607843, 0, 1, 1,
0.9318529, -0.2293327, 1.075172, 0.9686275, 0, 1, 1,
0.9323431, -0.2200753, 1.719807, 0.972549, 0, 1, 1,
0.9352216, 1.717576, 2.206232, 0.9803922, 0, 1, 1,
0.9393738, 0.6520102, -1.100572, 0.9843137, 0, 1, 1,
0.9400814, -2.287581, 2.740275, 0.9921569, 0, 1, 1,
0.9434798, -0.3759938, 1.106602, 0.9960784, 0, 1, 1,
0.9502172, -1.207546, 3.546547, 1, 0, 0.9960784, 1,
0.9506203, 0.8718973, 2.006916, 1, 0, 0.9882353, 1,
0.9560975, -0.737803, 2.076451, 1, 0, 0.9843137, 1,
0.9567305, 0.9022664, 0.6925355, 1, 0, 0.9764706, 1,
0.9572964, 0.271522, 2.563282, 1, 0, 0.972549, 1,
0.958365, -0.9104223, 1.59511, 1, 0, 0.9647059, 1,
0.9601008, -1.381532, 1.877064, 1, 0, 0.9607843, 1,
0.9618735, -1.924482, 2.496502, 1, 0, 0.9529412, 1,
0.9623266, 0.5277706, 1.15486, 1, 0, 0.9490196, 1,
0.9644762, -0.2812371, 2.767531, 1, 0, 0.9411765, 1,
0.9721966, -0.3694572, 1.196562, 1, 0, 0.9372549, 1,
0.9797761, -1.066483, 2.246174, 1, 0, 0.9294118, 1,
0.9882855, -0.4450002, 2.005661, 1, 0, 0.9254902, 1,
0.9944091, 0.5889354, -0.09835907, 1, 0, 0.9176471, 1,
0.9998397, -0.5851257, 2.185703, 1, 0, 0.9137255, 1,
1.004307, 0.1455498, 1.133029, 1, 0, 0.9058824, 1,
1.004791, 1.204241, 0.1822854, 1, 0, 0.9019608, 1,
1.00589, 0.1132846, 0.9773967, 1, 0, 0.8941177, 1,
1.008461, 0.1719079, 1.33081, 1, 0, 0.8862745, 1,
1.009614, -0.2650487, 2.203142, 1, 0, 0.8823529, 1,
1.011754, -0.2295233, 1.321756, 1, 0, 0.8745098, 1,
1.014206, 0.5104686, 0.1594065, 1, 0, 0.8705882, 1,
1.014478, -0.07899376, 1.423999, 1, 0, 0.8627451, 1,
1.020344, -0.6306359, 1.92927, 1, 0, 0.8588235, 1,
1.025937, -0.07699504, 1.5894, 1, 0, 0.8509804, 1,
1.028106, -1.217602, 1.465397, 1, 0, 0.8470588, 1,
1.03291, -0.4866827, 2.297884, 1, 0, 0.8392157, 1,
1.035899, -0.3899593, 3.438002, 1, 0, 0.8352941, 1,
1.037349, -3.165285, 1.518433, 1, 0, 0.827451, 1,
1.040084, -0.8052155, 1.704455, 1, 0, 0.8235294, 1,
1.055226, -0.7815334, 2.1141, 1, 0, 0.8156863, 1,
1.059555, -0.05377847, 2.67238, 1, 0, 0.8117647, 1,
1.061455, 1.301736, 0.800395, 1, 0, 0.8039216, 1,
1.067886, 1.416309, -0.697118, 1, 0, 0.7960784, 1,
1.070776, 0.2432906, 1.984269, 1, 0, 0.7921569, 1,
1.070943, 0.6468247, 1.368271, 1, 0, 0.7843137, 1,
1.076009, -0.5759917, 1.778671, 1, 0, 0.7803922, 1,
1.083934, 1.194105, -0.1804153, 1, 0, 0.772549, 1,
1.08817, 1.133017, 0.05506968, 1, 0, 0.7686275, 1,
1.094837, -0.3847315, 3.453666, 1, 0, 0.7607843, 1,
1.097597, -1.641979, 2.509241, 1, 0, 0.7568628, 1,
1.098576, 0.6828935, 0.5517028, 1, 0, 0.7490196, 1,
1.10589, -1.082057, 2.109975, 1, 0, 0.7450981, 1,
1.107862, -0.4895195, 1.689404, 1, 0, 0.7372549, 1,
1.122409, -0.1783749, 0.1001279, 1, 0, 0.7333333, 1,
1.123987, -1.297354, 2.146333, 1, 0, 0.7254902, 1,
1.125108, 1.180711, 1.064941, 1, 0, 0.7215686, 1,
1.128822, -0.1949512, 1.505403, 1, 0, 0.7137255, 1,
1.134332, 0.6175113, 0.08195387, 1, 0, 0.7098039, 1,
1.136688, -0.487421, 1.827842, 1, 0, 0.7019608, 1,
1.140541, -0.5009175, 3.269336, 1, 0, 0.6941177, 1,
1.14488, -1.204086, 3.461794, 1, 0, 0.6901961, 1,
1.150291, -0.08948482, 3.508835, 1, 0, 0.682353, 1,
1.160694, 0.2025572, 0.2923687, 1, 0, 0.6784314, 1,
1.17031, 1.641264, 1.008866, 1, 0, 0.6705883, 1,
1.170997, -0.03932719, 0.507922, 1, 0, 0.6666667, 1,
1.192615, 0.08690259, 1.70338, 1, 0, 0.6588235, 1,
1.195093, 0.9783334, 0.3824244, 1, 0, 0.654902, 1,
1.20014, 1.493027, 1.248516, 1, 0, 0.6470588, 1,
1.20282, 0.8153419, 1.048323, 1, 0, 0.6431373, 1,
1.209028, 0.5797689, 2.460907, 1, 0, 0.6352941, 1,
1.210348, 1.447817, 0.2580459, 1, 0, 0.6313726, 1,
1.224976, -0.1104823, 2.37618, 1, 0, 0.6235294, 1,
1.240556, 1.416912, -0.08100777, 1, 0, 0.6196079, 1,
1.242497, -0.3849074, 1.157802, 1, 0, 0.6117647, 1,
1.243806, -1.814895, 3.135283, 1, 0, 0.6078432, 1,
1.252738, 0.1612003, 2.011016, 1, 0, 0.6, 1,
1.258059, 0.2515646, 2.61413, 1, 0, 0.5921569, 1,
1.258705, 0.7057039, 0.392837, 1, 0, 0.5882353, 1,
1.260038, 0.2878068, 1.441166, 1, 0, 0.5803922, 1,
1.260054, -0.2347648, 0.7128179, 1, 0, 0.5764706, 1,
1.26029, -0.634126, 1.273191, 1, 0, 0.5686275, 1,
1.286213, -0.5664229, 1.597359, 1, 0, 0.5647059, 1,
1.288755, 0.5269862, 1.43982, 1, 0, 0.5568628, 1,
1.290123, 0.8022215, -0.03308795, 1, 0, 0.5529412, 1,
1.29363, -0.8046861, 1.766146, 1, 0, 0.5450981, 1,
1.308504, 1.192325, -0.001866847, 1, 0, 0.5411765, 1,
1.30929, -1.564768, 3.453649, 1, 0, 0.5333334, 1,
1.311759, -0.2126028, 3.963478, 1, 0, 0.5294118, 1,
1.323733, 0.251236, 0.2855154, 1, 0, 0.5215687, 1,
1.325966, 0.3140143, 0.858402, 1, 0, 0.5176471, 1,
1.329264, 0.4001515, 1.81737, 1, 0, 0.509804, 1,
1.339356, 0.1387345, 3.220962, 1, 0, 0.5058824, 1,
1.345487, 1.351278, 0.007705483, 1, 0, 0.4980392, 1,
1.345772, 0.6602869, -0.02499886, 1, 0, 0.4901961, 1,
1.346429, 2.676428, 1.628846, 1, 0, 0.4862745, 1,
1.355413, -0.342916, 0.9751409, 1, 0, 0.4784314, 1,
1.360272, 0.5640732, 1.683405, 1, 0, 0.4745098, 1,
1.370149, -0.2836251, 3.002212, 1, 0, 0.4666667, 1,
1.373697, 0.817513, 1.160623, 1, 0, 0.4627451, 1,
1.374654, -0.06974105, 3.437865, 1, 0, 0.454902, 1,
1.375751, 1.527666, 0.517095, 1, 0, 0.4509804, 1,
1.393264, -0.01823442, 0.8004038, 1, 0, 0.4431373, 1,
1.400641, 0.3866242, 0.4794421, 1, 0, 0.4392157, 1,
1.40084, 0.6594334, 1.18832, 1, 0, 0.4313726, 1,
1.400908, -0.5638617, 0.955595, 1, 0, 0.427451, 1,
1.401183, -0.5784981, 2.051137, 1, 0, 0.4196078, 1,
1.406767, 1.064498, 1.019531, 1, 0, 0.4156863, 1,
1.420887, 0.1914213, 1.631418, 1, 0, 0.4078431, 1,
1.429479, 0.7442343, 2.46763, 1, 0, 0.4039216, 1,
1.430368, 0.8936709, 0.513385, 1, 0, 0.3960784, 1,
1.441447, 1.908171, 1.903181, 1, 0, 0.3882353, 1,
1.446265, 0.02445198, 3.002865, 1, 0, 0.3843137, 1,
1.460544, -0.7727184, 2.540633, 1, 0, 0.3764706, 1,
1.465375, -0.3956805, 3.456335, 1, 0, 0.372549, 1,
1.474088, -0.5006411, 0.9693519, 1, 0, 0.3647059, 1,
1.47895, -0.4925548, 1.763103, 1, 0, 0.3607843, 1,
1.485198, -0.933496, 2.556689, 1, 0, 0.3529412, 1,
1.485836, 1.167303, 0.6239557, 1, 0, 0.3490196, 1,
1.501258, 0.5544809, 1.717271, 1, 0, 0.3411765, 1,
1.503359, 0.8759761, 0.9596587, 1, 0, 0.3372549, 1,
1.514859, 1.484551, 0.3950486, 1, 0, 0.3294118, 1,
1.515203, 1.392235, 2.500932, 1, 0, 0.3254902, 1,
1.517391, 0.6666653, 1.412267, 1, 0, 0.3176471, 1,
1.523583, -1.764856, 1.621431, 1, 0, 0.3137255, 1,
1.527738, -0.0436512, 1.30141, 1, 0, 0.3058824, 1,
1.52865, -2.316964, 2.633709, 1, 0, 0.2980392, 1,
1.529071, 0.2867812, 0.8005824, 1, 0, 0.2941177, 1,
1.538413, 0.970027, -0.4991096, 1, 0, 0.2862745, 1,
1.585191, 0.5743952, 0.9631551, 1, 0, 0.282353, 1,
1.590689, 0.02445957, -0.6470566, 1, 0, 0.2745098, 1,
1.592942, 0.6259848, 0.6103755, 1, 0, 0.2705882, 1,
1.605571, -0.5706388, 2.258215, 1, 0, 0.2627451, 1,
1.608677, -1.669439, 1.638547, 1, 0, 0.2588235, 1,
1.62022, -2.606574, 3.904408, 1, 0, 0.2509804, 1,
1.636706, -0.6203339, 2.080996, 1, 0, 0.2470588, 1,
1.68143, 0.650074, 2.428791, 1, 0, 0.2392157, 1,
1.68952, -1.033523, 3.156747, 1, 0, 0.2352941, 1,
1.704044, -1.434001, 2.838586, 1, 0, 0.227451, 1,
1.735153, -0.4559481, 0.0835999, 1, 0, 0.2235294, 1,
1.752746, 0.5243651, 1.554794, 1, 0, 0.2156863, 1,
1.775807, -0.0615213, 1.153447, 1, 0, 0.2117647, 1,
1.781404, 1.404268, -0.5136734, 1, 0, 0.2039216, 1,
1.811939, -0.3592093, 3.551808, 1, 0, 0.1960784, 1,
1.820642, -0.214963, 1.058797, 1, 0, 0.1921569, 1,
1.824005, -0.7536049, 0.4238974, 1, 0, 0.1843137, 1,
1.827137, 1.287502, 1.695415, 1, 0, 0.1803922, 1,
1.844051, 0.8063056, 1.878932, 1, 0, 0.172549, 1,
1.882139, -0.3228808, 2.079623, 1, 0, 0.1686275, 1,
1.887601, -0.5551084, 1.482362, 1, 0, 0.1607843, 1,
1.891382, -0.9514091, 2.453893, 1, 0, 0.1568628, 1,
1.896668, -0.7252763, 1.530648, 1, 0, 0.1490196, 1,
1.909003, 0.1472882, 0.8589796, 1, 0, 0.145098, 1,
1.909343, -0.8195002, 0.9792411, 1, 0, 0.1372549, 1,
1.922419, -0.08231956, 1.581756, 1, 0, 0.1333333, 1,
1.952583, 0.5167984, 0.99884, 1, 0, 0.1254902, 1,
1.977824, 1.517596, 1.167313, 1, 0, 0.1215686, 1,
1.977919, -1.128123, 2.371168, 1, 0, 0.1137255, 1,
1.978386, -0.750487, 0.6732944, 1, 0, 0.1098039, 1,
2.119673, -1.883797, 1.854579, 1, 0, 0.1019608, 1,
2.120629, 0.5188925, 1.382344, 1, 0, 0.09411765, 1,
2.137138, 0.4855174, 2.316404, 1, 0, 0.09019608, 1,
2.147969, -1.018979, 3.133111, 1, 0, 0.08235294, 1,
2.152287, 1.800387, 0.4928856, 1, 0, 0.07843138, 1,
2.204564, -0.1368092, 2.625108, 1, 0, 0.07058824, 1,
2.257184, -2.596394, 2.127645, 1, 0, 0.06666667, 1,
2.306754, 0.2508002, 0.6905667, 1, 0, 0.05882353, 1,
2.386815, 0.08441103, 1.817834, 1, 0, 0.05490196, 1,
2.39466, 0.5274757, 3.002056, 1, 0, 0.04705882, 1,
2.44724, 0.07394993, -0.256527, 1, 0, 0.04313726, 1,
2.503075, -2.400978e-06, -0.7935166, 1, 0, 0.03529412, 1,
2.540209, 1.825538, 1.567407, 1, 0, 0.03137255, 1,
2.572564, 0.7126988, -0.2173244, 1, 0, 0.02352941, 1,
2.692649, 0.9739831, 1.016879, 1, 0, 0.01960784, 1,
2.719155, 0.1048373, 1.367456, 1, 0, 0.01176471, 1,
2.966044, 0.1575639, 0.9394333, 1, 0, 0.007843138, 1
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
-0.1179575, -4.477413, -6.90066, 0, -0.5, 0.5, 0.5,
-0.1179575, -4.477413, -6.90066, 1, -0.5, 0.5, 0.5,
-0.1179575, -4.477413, -6.90066, 1, 1.5, 0.5, 0.5,
-0.1179575, -4.477413, -6.90066, 0, 1.5, 0.5, 0.5
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
-4.247436, -0.1157597, -6.90066, 0, -0.5, 0.5, 0.5,
-4.247436, -0.1157597, -6.90066, 1, -0.5, 0.5, 0.5,
-4.247436, -0.1157597, -6.90066, 1, 1.5, 0.5, 0.5,
-4.247436, -0.1157597, -6.90066, 0, 1.5, 0.5, 0.5
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
-4.247436, -4.477413, 0.03618193, 0, -0.5, 0.5, 0.5,
-4.247436, -4.477413, 0.03618193, 1, -0.5, 0.5, 0.5,
-4.247436, -4.477413, 0.03618193, 1, 1.5, 0.5, 0.5,
-4.247436, -4.477413, 0.03618193, 0, 1.5, 0.5, 0.5
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
-3, -3.470877, -5.29985,
2, -3.470877, -5.29985,
-3, -3.470877, -5.29985,
-3, -3.638633, -5.566652,
-2, -3.470877, -5.29985,
-2, -3.638633, -5.566652,
-1, -3.470877, -5.29985,
-1, -3.638633, -5.566652,
0, -3.470877, -5.29985,
0, -3.638633, -5.566652,
1, -3.470877, -5.29985,
1, -3.638633, -5.566652,
2, -3.470877, -5.29985,
2, -3.638633, -5.566652
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
-3, -3.974145, -6.100255, 0, -0.5, 0.5, 0.5,
-3, -3.974145, -6.100255, 1, -0.5, 0.5, 0.5,
-3, -3.974145, -6.100255, 1, 1.5, 0.5, 0.5,
-3, -3.974145, -6.100255, 0, 1.5, 0.5, 0.5,
-2, -3.974145, -6.100255, 0, -0.5, 0.5, 0.5,
-2, -3.974145, -6.100255, 1, -0.5, 0.5, 0.5,
-2, -3.974145, -6.100255, 1, 1.5, 0.5, 0.5,
-2, -3.974145, -6.100255, 0, 1.5, 0.5, 0.5,
-1, -3.974145, -6.100255, 0, -0.5, 0.5, 0.5,
-1, -3.974145, -6.100255, 1, -0.5, 0.5, 0.5,
-1, -3.974145, -6.100255, 1, 1.5, 0.5, 0.5,
-1, -3.974145, -6.100255, 0, 1.5, 0.5, 0.5,
0, -3.974145, -6.100255, 0, -0.5, 0.5, 0.5,
0, -3.974145, -6.100255, 1, -0.5, 0.5, 0.5,
0, -3.974145, -6.100255, 1, 1.5, 0.5, 0.5,
0, -3.974145, -6.100255, 0, 1.5, 0.5, 0.5,
1, -3.974145, -6.100255, 0, -0.5, 0.5, 0.5,
1, -3.974145, -6.100255, 1, -0.5, 0.5, 0.5,
1, -3.974145, -6.100255, 1, 1.5, 0.5, 0.5,
1, -3.974145, -6.100255, 0, 1.5, 0.5, 0.5,
2, -3.974145, -6.100255, 0, -0.5, 0.5, 0.5,
2, -3.974145, -6.100255, 1, -0.5, 0.5, 0.5,
2, -3.974145, -6.100255, 1, 1.5, 0.5, 0.5,
2, -3.974145, -6.100255, 0, 1.5, 0.5, 0.5
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
-3.294479, -3, -5.29985,
-3.294479, 3, -5.29985,
-3.294479, -3, -5.29985,
-3.453305, -3, -5.566652,
-3.294479, -2, -5.29985,
-3.453305, -2, -5.566652,
-3.294479, -1, -5.29985,
-3.453305, -1, -5.566652,
-3.294479, 0, -5.29985,
-3.453305, 0, -5.566652,
-3.294479, 1, -5.29985,
-3.453305, 1, -5.566652,
-3.294479, 2, -5.29985,
-3.453305, 2, -5.566652,
-3.294479, 3, -5.29985,
-3.453305, 3, -5.566652
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
-3.770957, -3, -6.100255, 0, -0.5, 0.5, 0.5,
-3.770957, -3, -6.100255, 1, -0.5, 0.5, 0.5,
-3.770957, -3, -6.100255, 1, 1.5, 0.5, 0.5,
-3.770957, -3, -6.100255, 0, 1.5, 0.5, 0.5,
-3.770957, -2, -6.100255, 0, -0.5, 0.5, 0.5,
-3.770957, -2, -6.100255, 1, -0.5, 0.5, 0.5,
-3.770957, -2, -6.100255, 1, 1.5, 0.5, 0.5,
-3.770957, -2, -6.100255, 0, 1.5, 0.5, 0.5,
-3.770957, -1, -6.100255, 0, -0.5, 0.5, 0.5,
-3.770957, -1, -6.100255, 1, -0.5, 0.5, 0.5,
-3.770957, -1, -6.100255, 1, 1.5, 0.5, 0.5,
-3.770957, -1, -6.100255, 0, 1.5, 0.5, 0.5,
-3.770957, 0, -6.100255, 0, -0.5, 0.5, 0.5,
-3.770957, 0, -6.100255, 1, -0.5, 0.5, 0.5,
-3.770957, 0, -6.100255, 1, 1.5, 0.5, 0.5,
-3.770957, 0, -6.100255, 0, 1.5, 0.5, 0.5,
-3.770957, 1, -6.100255, 0, -0.5, 0.5, 0.5,
-3.770957, 1, -6.100255, 1, -0.5, 0.5, 0.5,
-3.770957, 1, -6.100255, 1, 1.5, 0.5, 0.5,
-3.770957, 1, -6.100255, 0, 1.5, 0.5, 0.5,
-3.770957, 2, -6.100255, 0, -0.5, 0.5, 0.5,
-3.770957, 2, -6.100255, 1, -0.5, 0.5, 0.5,
-3.770957, 2, -6.100255, 1, 1.5, 0.5, 0.5,
-3.770957, 2, -6.100255, 0, 1.5, 0.5, 0.5,
-3.770957, 3, -6.100255, 0, -0.5, 0.5, 0.5,
-3.770957, 3, -6.100255, 1, -0.5, 0.5, 0.5,
-3.770957, 3, -6.100255, 1, 1.5, 0.5, 0.5,
-3.770957, 3, -6.100255, 0, 1.5, 0.5, 0.5
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
-3.294479, -3.470877, -4,
-3.294479, -3.470877, 4,
-3.294479, -3.470877, -4,
-3.453305, -3.638633, -4,
-3.294479, -3.470877, -2,
-3.453305, -3.638633, -2,
-3.294479, -3.470877, 0,
-3.453305, -3.638633, 0,
-3.294479, -3.470877, 2,
-3.453305, -3.638633, 2,
-3.294479, -3.470877, 4,
-3.453305, -3.638633, 4
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
-3.770957, -3.974145, -4, 0, -0.5, 0.5, 0.5,
-3.770957, -3.974145, -4, 1, -0.5, 0.5, 0.5,
-3.770957, -3.974145, -4, 1, 1.5, 0.5, 0.5,
-3.770957, -3.974145, -4, 0, 1.5, 0.5, 0.5,
-3.770957, -3.974145, -2, 0, -0.5, 0.5, 0.5,
-3.770957, -3.974145, -2, 1, -0.5, 0.5, 0.5,
-3.770957, -3.974145, -2, 1, 1.5, 0.5, 0.5,
-3.770957, -3.974145, -2, 0, 1.5, 0.5, 0.5,
-3.770957, -3.974145, 0, 0, -0.5, 0.5, 0.5,
-3.770957, -3.974145, 0, 1, -0.5, 0.5, 0.5,
-3.770957, -3.974145, 0, 1, 1.5, 0.5, 0.5,
-3.770957, -3.974145, 0, 0, 1.5, 0.5, 0.5,
-3.770957, -3.974145, 2, 0, -0.5, 0.5, 0.5,
-3.770957, -3.974145, 2, 1, -0.5, 0.5, 0.5,
-3.770957, -3.974145, 2, 1, 1.5, 0.5, 0.5,
-3.770957, -3.974145, 2, 0, 1.5, 0.5, 0.5,
-3.770957, -3.974145, 4, 0, -0.5, 0.5, 0.5,
-3.770957, -3.974145, 4, 1, -0.5, 0.5, 0.5,
-3.770957, -3.974145, 4, 1, 1.5, 0.5, 0.5,
-3.770957, -3.974145, 4, 0, 1.5, 0.5, 0.5
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
-3.294479, -3.470877, -5.29985,
-3.294479, 3.239358, -5.29985,
-3.294479, -3.470877, 5.372214,
-3.294479, 3.239358, 5.372214,
-3.294479, -3.470877, -5.29985,
-3.294479, -3.470877, 5.372214,
-3.294479, 3.239358, -5.29985,
-3.294479, 3.239358, 5.372214,
-3.294479, -3.470877, -5.29985,
3.058564, -3.470877, -5.29985,
-3.294479, -3.470877, 5.372214,
3.058564, -3.470877, 5.372214,
-3.294479, 3.239358, -5.29985,
3.058564, 3.239358, -5.29985,
-3.294479, 3.239358, 5.372214,
3.058564, 3.239358, 5.372214,
3.058564, -3.470877, -5.29985,
3.058564, 3.239358, -5.29985,
3.058564, -3.470877, 5.372214,
3.058564, 3.239358, 5.372214,
3.058564, -3.470877, -5.29985,
3.058564, -3.470877, 5.372214,
3.058564, 3.239358, -5.29985,
3.058564, 3.239358, 5.372214
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
var radius = 7.538047;
var distance = 33.53762;
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
mvMatrix.translate( 0.1179575, 0.1157597, -0.03618193 );
mvMatrix.scale( 1.282894, 1.214605, 0.7637026 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.53762);
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
Zeldox<-read.table("Zeldox.xyz")
```

```
## Error in read.table("Zeldox.xyz"): no lines available in input
```

```r
x<-Zeldox$V2
```

```
## Error in eval(expr, envir, enclos): object 'Zeldox' not found
```

```r
y<-Zeldox$V3
```

```
## Error in eval(expr, envir, enclos): object 'Zeldox' not found
```

```r
z<-Zeldox$V4
```

```
## Error in eval(expr, envir, enclos): object 'Zeldox' not found
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
-3.201959, 0.3696006, -1.748896, 0, 0, 1, 1, 1,
-3.029079, 0.4148709, -0.6209938, 1, 0, 0, 1, 1,
-2.787304, 3.045724, -1.043098, 1, 0, 0, 1, 1,
-2.743646, 1.983563, -0.8708996, 1, 0, 0, 1, 1,
-2.691869, 0.3322732, -1.227531, 1, 0, 0, 1, 1,
-2.648618, -0.109238, -2.626049, 1, 0, 0, 1, 1,
-2.599964, 0.4449493, -1.455838, 0, 0, 0, 1, 1,
-2.56693, -0.206059, -1.591421, 0, 0, 0, 1, 1,
-2.559142, 0.4286993, -1.833117, 0, 0, 0, 1, 1,
-2.555109, -1.735221, -1.81652, 0, 0, 0, 1, 1,
-2.523829, 1.269049, -0.252421, 0, 0, 0, 1, 1,
-2.500571, 1.66799, -0.6245428, 0, 0, 0, 1, 1,
-2.425563, -0.2981476, -2.961791, 0, 0, 0, 1, 1,
-2.320988, 1.406672, -0.05970327, 1, 1, 1, 1, 1,
-2.292024, -2.258944, -1.923616, 1, 1, 1, 1, 1,
-2.239048, -1.759242, -3.238982, 1, 1, 1, 1, 1,
-2.119092, -0.8339281, -1.557658, 1, 1, 1, 1, 1,
-2.10784, 0.7960564, -0.7651129, 1, 1, 1, 1, 1,
-2.087509, 0.6318935, -1.433491, 1, 1, 1, 1, 1,
-2.085397, 0.01616806, -0.5533258, 1, 1, 1, 1, 1,
-2.06802, -0.59144, -3.223828, 1, 1, 1, 1, 1,
-2.039647, 1.365077, -2.581629, 1, 1, 1, 1, 1,
-2.033222, -1.764677, -2.593675, 1, 1, 1, 1, 1,
-2.016328, 1.577753, -0.6354333, 1, 1, 1, 1, 1,
-1.966833, 0.01972585, -1.097377, 1, 1, 1, 1, 1,
-1.952241, -0.5799671, -2.72298, 1, 1, 1, 1, 1,
-1.948035, 0.05740045, -1.181092, 1, 1, 1, 1, 1,
-1.935307, -0.6202467, -2.226727, 1, 1, 1, 1, 1,
-1.902785, 2.400735, -0.5288038, 0, 0, 1, 1, 1,
-1.900318, 0.7356024, -2.006922, 1, 0, 0, 1, 1,
-1.892579, 2.054487, -0.5324966, 1, 0, 0, 1, 1,
-1.891906, -0.1582807, -0.9031098, 1, 0, 0, 1, 1,
-1.885513, 1.193393, -1.343104, 1, 0, 0, 1, 1,
-1.871843, 1.290535, -1.931947, 1, 0, 0, 1, 1,
-1.850017, 0.2350636, -0.5178431, 0, 0, 0, 1, 1,
-1.841515, 1.979375, -1.443172, 0, 0, 0, 1, 1,
-1.836974, 0.5454937, -1.318786, 0, 0, 0, 1, 1,
-1.824084, 0.5791513, -3.357874, 0, 0, 0, 1, 1,
-1.823586, -1.014768, -2.874764, 0, 0, 0, 1, 1,
-1.818023, -1.327499, -1.287066, 0, 0, 0, 1, 1,
-1.80351, -1.617194, -2.958379, 0, 0, 0, 1, 1,
-1.771534, -1.748861, -3.467791, 1, 1, 1, 1, 1,
-1.764389, -1.3123, -1.586333, 1, 1, 1, 1, 1,
-1.760353, 1.36781, 0.1714899, 1, 1, 1, 1, 1,
-1.756033, -0.7569114, -2.124733, 1, 1, 1, 1, 1,
-1.748594, -0.6426259, -3.352943, 1, 1, 1, 1, 1,
-1.744648, -0.7225802, -2.179631, 1, 1, 1, 1, 1,
-1.73857, 0.5230649, -1.125416, 1, 1, 1, 1, 1,
-1.736808, -1.435621, -1.019071, 1, 1, 1, 1, 1,
-1.728561, 0.2469287, -0.7244379, 1, 1, 1, 1, 1,
-1.721017, 1.030948, -2.170562, 1, 1, 1, 1, 1,
-1.705368, -1.021195, -0.714267, 1, 1, 1, 1, 1,
-1.702517, 0.004192048, -2.574487, 1, 1, 1, 1, 1,
-1.702131, 0.0849037, -1.596007, 1, 1, 1, 1, 1,
-1.69787, -0.2536621, -2.836786, 1, 1, 1, 1, 1,
-1.685838, -0.2079318, -2.046673, 1, 1, 1, 1, 1,
-1.679586, 0.3480944, 0.6227901, 0, 0, 1, 1, 1,
-1.676234, -2.927618, -3.086041, 1, 0, 0, 1, 1,
-1.672504, -1.625471, -2.5783, 1, 0, 0, 1, 1,
-1.659894, 0.4697728, -1.301113, 1, 0, 0, 1, 1,
-1.656147, 1.727141, -0.7817346, 1, 0, 0, 1, 1,
-1.636715, -0.2034475, -0.9819741, 1, 0, 0, 1, 1,
-1.629938, -0.4141507, -1.026916, 0, 0, 0, 1, 1,
-1.627908, 0.7052313, -1.622126, 0, 0, 0, 1, 1,
-1.62041, 0.609814, -0.6583387, 0, 0, 0, 1, 1,
-1.620025, 0.465812, -1.178968, 0, 0, 0, 1, 1,
-1.619051, -0.1108008, -0.6718476, 0, 0, 0, 1, 1,
-1.612831, -0.5368012, -2.367201, 0, 0, 0, 1, 1,
-1.610007, 5.018612e-05, -1.530888, 0, 0, 0, 1, 1,
-1.609602, -0.03908126, -2.275467, 1, 1, 1, 1, 1,
-1.605044, -0.01917557, -2.578485, 1, 1, 1, 1, 1,
-1.588047, 0.9513037, 0.06956701, 1, 1, 1, 1, 1,
-1.585267, 1.576516, -0.6364897, 1, 1, 1, 1, 1,
-1.556885, 0.5990595, -0.7301753, 1, 1, 1, 1, 1,
-1.542053, -0.8275782, -2.623625, 1, 1, 1, 1, 1,
-1.538149, 1.162678, -0.9411818, 1, 1, 1, 1, 1,
-1.490247, 1.381781, -0.2418058, 1, 1, 1, 1, 1,
-1.489829, -0.1417259, -1.275029, 1, 1, 1, 1, 1,
-1.485072, -0.365902, -1.242826, 1, 1, 1, 1, 1,
-1.475919, -0.1700119, -3.846387, 1, 1, 1, 1, 1,
-1.472031, -0.1674266, -1.062625, 1, 1, 1, 1, 1,
-1.465707, -0.6046399, 0.264191, 1, 1, 1, 1, 1,
-1.459419, 1.229724, -0.5084429, 1, 1, 1, 1, 1,
-1.4489, 0.6776313, 0.8588424, 1, 1, 1, 1, 1,
-1.445908, 0.7790315, -0.980956, 0, 0, 1, 1, 1,
-1.435152, 0.6924365, -1.170296, 1, 0, 0, 1, 1,
-1.423184, -1.361298, -4.996257, 1, 0, 0, 1, 1,
-1.417134, -0.7199105, -2.054187, 1, 0, 0, 1, 1,
-1.409659, -0.1744672, -1.122943, 1, 0, 0, 1, 1,
-1.399981, 1.713639, -0.2253467, 1, 0, 0, 1, 1,
-1.395213, 0.3062863, -2.224032, 0, 0, 0, 1, 1,
-1.377204, 0.3425092, -1.855899, 0, 0, 0, 1, 1,
-1.371895, -0.03240678, -2.808764, 0, 0, 0, 1, 1,
-1.368887, 0.4188091, -3.569646, 0, 0, 0, 1, 1,
-1.364375, -0.5579443, -2.451924, 0, 0, 0, 1, 1,
-1.362916, -0.5814633, -0.473501, 0, 0, 0, 1, 1,
-1.354072, -0.5151864, -2.826863, 0, 0, 0, 1, 1,
-1.353608, 0.1764912, -1.266903, 1, 1, 1, 1, 1,
-1.348508, 0.5908203, -2.544945, 1, 1, 1, 1, 1,
-1.344465, 1.395037, -1.181011, 1, 1, 1, 1, 1,
-1.311828, -1.896544, -2.369215, 1, 1, 1, 1, 1,
-1.31035, -0.5535698, -2.585486, 1, 1, 1, 1, 1,
-1.303652, -0.4258801, -2.187992, 1, 1, 1, 1, 1,
-1.300698, -0.8640505, -2.985197, 1, 1, 1, 1, 1,
-1.283181, -0.2721448, -1.142357, 1, 1, 1, 1, 1,
-1.28037, -2.120614, -3.260974, 1, 1, 1, 1, 1,
-1.277283, 0.7363139, -0.33834, 1, 1, 1, 1, 1,
-1.255963, -1.025886, -2.136412, 1, 1, 1, 1, 1,
-1.245413, 0.4675626, 0.6717526, 1, 1, 1, 1, 1,
-1.242422, -0.755685, -1.571257, 1, 1, 1, 1, 1,
-1.23768, -1.97827, -3.117183, 1, 1, 1, 1, 1,
-1.23667, -0.3660532, -2.514624, 1, 1, 1, 1, 1,
-1.22063, -1.250242, -4.59417, 0, 0, 1, 1, 1,
-1.218415, 0.3190965, -2.634117, 1, 0, 0, 1, 1,
-1.209296, 1.511605, -1.195829, 1, 0, 0, 1, 1,
-1.199179, -0.1734031, -2.191165, 1, 0, 0, 1, 1,
-1.197823, -1.043086, -3.374504, 1, 0, 0, 1, 1,
-1.192796, 0.4610969, -0.3609321, 1, 0, 0, 1, 1,
-1.189912, -0.6979523, -3.650687, 0, 0, 0, 1, 1,
-1.185901, -0.3374257, -0.6474708, 0, 0, 0, 1, 1,
-1.181563, -0.7040048, -2.297863, 0, 0, 0, 1, 1,
-1.177882, -0.09274127, -2.238841, 0, 0, 0, 1, 1,
-1.17759, 0.6060275, 0.9594905, 0, 0, 0, 1, 1,
-1.175908, 0.3565939, -0.4214244, 0, 0, 0, 1, 1,
-1.172248, 0.6277349, -2.635408, 0, 0, 0, 1, 1,
-1.161931, -0.0691952, -2.191968, 1, 1, 1, 1, 1,
-1.159646, 1.08329, 0.08433992, 1, 1, 1, 1, 1,
-1.156633, -0.2655004, -1.562572, 1, 1, 1, 1, 1,
-1.148352, -2.164034, -0.137535, 1, 1, 1, 1, 1,
-1.144098, -1.047481, -0.8026108, 1, 1, 1, 1, 1,
-1.143311, 0.4314189, -1.42821, 1, 1, 1, 1, 1,
-1.13997, 0.2166792, -1.919379, 1, 1, 1, 1, 1,
-1.137351, 1.078596, -0.9121051, 1, 1, 1, 1, 1,
-1.134944, 0.9819574, -1.626319, 1, 1, 1, 1, 1,
-1.130896, -0.5666248, -2.325197, 1, 1, 1, 1, 1,
-1.130364, -0.8897972, -0.6252869, 1, 1, 1, 1, 1,
-1.127725, -0.7615002, -3.521643, 1, 1, 1, 1, 1,
-1.120261, 0.9516627, -0.7407305, 1, 1, 1, 1, 1,
-1.119889, -1.836092, -2.875421, 1, 1, 1, 1, 1,
-1.117158, -0.9820625, -2.427904, 1, 1, 1, 1, 1,
-1.113, 1.013983, -2.223952, 0, 0, 1, 1, 1,
-1.110229, -0.2040817, -1.066749, 1, 0, 0, 1, 1,
-1.105166, 0.2518242, -2.381715, 1, 0, 0, 1, 1,
-1.105056, 1.477398, 1.039444, 1, 0, 0, 1, 1,
-1.098927, 0.5254, -2.935819, 1, 0, 0, 1, 1,
-1.094994, -0.2237634, -0.3004711, 1, 0, 0, 1, 1,
-1.091932, 0.903581, 0.06781284, 0, 0, 0, 1, 1,
-1.090049, -0.622476, -2.562632, 0, 0, 0, 1, 1,
-1.080344, 0.5395094, -0.3169337, 0, 0, 0, 1, 1,
-1.078794, -0.4223386, -1.866083, 0, 0, 0, 1, 1,
-1.07695, 0.226552, 0.4632429, 0, 0, 0, 1, 1,
-1.075876, 1.253825, -2.512216, 0, 0, 0, 1, 1,
-1.070562, 0.198858, -3.873331, 0, 0, 0, 1, 1,
-1.060283, 0.275427, -3.241167, 1, 1, 1, 1, 1,
-1.055993, 1.088096, -0.9851105, 1, 1, 1, 1, 1,
-1.049881, -0.1891614, -1.088584, 1, 1, 1, 1, 1,
-1.038244, -0.6859919, -2.742994, 1, 1, 1, 1, 1,
-1.037949, -0.2980973, -1.167604, 1, 1, 1, 1, 1,
-1.031909, -1.45091, -2.507968, 1, 1, 1, 1, 1,
-1.026941, -0.2562448, 0.2471844, 1, 1, 1, 1, 1,
-1.025698, -0.2940941, -3.87519, 1, 1, 1, 1, 1,
-1.018004, 0.5527121, -1.184586, 1, 1, 1, 1, 1,
-1.00561, 0.3178567, -0.6389218, 1, 1, 1, 1, 1,
-1.002756, 0.8093993, -0.1320442, 1, 1, 1, 1, 1,
-1.002351, 0.1814132, -1.503093, 1, 1, 1, 1, 1,
-1.002141, -0.9589834, -3.436454, 1, 1, 1, 1, 1,
-0.9931944, 0.0115349, -1.837931, 1, 1, 1, 1, 1,
-0.9927759, 1.273926, -1.273396, 1, 1, 1, 1, 1,
-0.9895518, -0.5799895, -1.892203, 0, 0, 1, 1, 1,
-0.9886988, 0.05719719, -2.70929, 1, 0, 0, 1, 1,
-0.988445, 1.401471, 0.08033295, 1, 0, 0, 1, 1,
-0.9856008, -0.6541458, -2.273266, 1, 0, 0, 1, 1,
-0.9835603, -0.1982688, -2.071494, 1, 0, 0, 1, 1,
-0.9829968, 0.683715, -1.754691, 1, 0, 0, 1, 1,
-0.9819359, -0.7010813, -1.788069, 0, 0, 0, 1, 1,
-0.9734575, -0.4374039, -4.352185, 0, 0, 0, 1, 1,
-0.9642185, -1.122398, -1.869009, 0, 0, 0, 1, 1,
-0.9639495, 0.08705428, -2.41347, 0, 0, 0, 1, 1,
-0.9611406, -0.8244892, -1.944029, 0, 0, 0, 1, 1,
-0.9515938, -0.523463, -3.022982, 0, 0, 0, 1, 1,
-0.9503478, -1.054561, -3.278129, 0, 0, 0, 1, 1,
-0.9479988, 1.517637, -0.5189165, 1, 1, 1, 1, 1,
-0.9469498, 0.3290419, -2.332896, 1, 1, 1, 1, 1,
-0.9414755, 0.6632153, 0.128219, 1, 1, 1, 1, 1,
-0.9398393, -1.989599, -3.494343, 1, 1, 1, 1, 1,
-0.9335417, 0.07701399, 0.1996079, 1, 1, 1, 1, 1,
-0.9318494, -1.841609, -2.717212, 1, 1, 1, 1, 1,
-0.931611, 0.02269817, 0.08093648, 1, 1, 1, 1, 1,
-0.9263632, -1.544935, -2.651153, 1, 1, 1, 1, 1,
-0.9152002, 0.6587293, -0.6239647, 1, 1, 1, 1, 1,
-0.9125003, 2.363613, 1.280212, 1, 1, 1, 1, 1,
-0.9063365, -0.4110664, -2.180342, 1, 1, 1, 1, 1,
-0.898087, 0.2923288, -1.562279, 1, 1, 1, 1, 1,
-0.8956144, 0.3199883, -0.8716876, 1, 1, 1, 1, 1,
-0.8948851, -0.3076442, -1.634128, 1, 1, 1, 1, 1,
-0.8910983, 0.9687872, -1.004899, 1, 1, 1, 1, 1,
-0.8888137, 0.2073016, -3.309271, 0, 0, 1, 1, 1,
-0.8835376, -1.420812, -1.992972, 1, 0, 0, 1, 1,
-0.8824158, 0.6246316, 0.005336281, 1, 0, 0, 1, 1,
-0.878638, -0.3920872, -1.85154, 1, 0, 0, 1, 1,
-0.8769928, 0.4780238, -0.7612153, 1, 0, 0, 1, 1,
-0.8683, -0.2948814, -1.847689, 1, 0, 0, 1, 1,
-0.8654951, 3.141636, 0.5699305, 0, 0, 0, 1, 1,
-0.8616539, 1.150409, -2.094609, 0, 0, 0, 1, 1,
-0.8590606, 0.4346088, -0.08361082, 0, 0, 0, 1, 1,
-0.8556247, -1.057709, -3.527854, 0, 0, 0, 1, 1,
-0.8453797, 0.01558259, -1.913379, 0, 0, 0, 1, 1,
-0.8414975, -0.2431222, -1.050928, 0, 0, 0, 1, 1,
-0.8409694, 0.7967731, 0.06292349, 0, 0, 0, 1, 1,
-0.8360012, -1.062559, -1.953655, 1, 1, 1, 1, 1,
-0.8280877, -0.3998496, -2.568146, 1, 1, 1, 1, 1,
-0.8271115, 0.2837592, -1.128416, 1, 1, 1, 1, 1,
-0.8270714, 1.320715, 0.1412369, 1, 1, 1, 1, 1,
-0.8264901, 1.259189, -1.096969, 1, 1, 1, 1, 1,
-0.8181689, -0.9388249, -2.905735, 1, 1, 1, 1, 1,
-0.81501, -1.313622, -3.674023, 1, 1, 1, 1, 1,
-0.8139749, 1.357285, -1.441997, 1, 1, 1, 1, 1,
-0.7959033, -0.9743836, -2.275515, 1, 1, 1, 1, 1,
-0.7932205, -0.4994251, -0.6607349, 1, 1, 1, 1, 1,
-0.790776, 1.421206, -0.8771657, 1, 1, 1, 1, 1,
-0.7862968, 0.2030814, -0.5546693, 1, 1, 1, 1, 1,
-0.77986, 2.164746, 0.09184123, 1, 1, 1, 1, 1,
-0.7794751, 0.1607803, -1.610318, 1, 1, 1, 1, 1,
-0.7638751, 0.04288353, 0.6522296, 1, 1, 1, 1, 1,
-0.763809, -0.01676318, -2.564323, 0, 0, 1, 1, 1,
-0.763732, -1.654773, -1.496776, 1, 0, 0, 1, 1,
-0.7546019, 0.4685896, -1.257968, 1, 0, 0, 1, 1,
-0.7499987, -0.3811112, -0.6871582, 1, 0, 0, 1, 1,
-0.747211, 1.454831, 1.120381, 1, 0, 0, 1, 1,
-0.741298, -1.131546, -2.434696, 1, 0, 0, 1, 1,
-0.7396699, 0.9723715, -0.7284552, 0, 0, 0, 1, 1,
-0.7267016, 0.2339466, -0.8355751, 0, 0, 0, 1, 1,
-0.7243149, -0.9414603, -5.144432, 0, 0, 0, 1, 1,
-0.7210526, 0.1394832, -1.043561, 0, 0, 0, 1, 1,
-0.7205188, -0.5962191, -2.687102, 0, 0, 0, 1, 1,
-0.7200008, -0.2375108, -0.7759427, 0, 0, 0, 1, 1,
-0.7163657, -0.7483174, -1.812605, 0, 0, 0, 1, 1,
-0.7129679, 0.614097, -1.572655, 1, 1, 1, 1, 1,
-0.7123411, -1.283847, -1.583001, 1, 1, 1, 1, 1,
-0.7113172, 0.8732601, -1.031255, 1, 1, 1, 1, 1,
-0.7100282, -0.2609353, -2.203614, 1, 1, 1, 1, 1,
-0.7017703, 0.32377, -0.2249957, 1, 1, 1, 1, 1,
-0.7007099, 1.288045, -1.62639, 1, 1, 1, 1, 1,
-0.699286, -0.3213335, -0.9625491, 1, 1, 1, 1, 1,
-0.6945822, -0.20159, -2.714267, 1, 1, 1, 1, 1,
-0.6908752, 1.318775, -0.8585004, 1, 1, 1, 1, 1,
-0.6882964, -0.3351069, -0.4176556, 1, 1, 1, 1, 1,
-0.6846443, 1.216955, 0.001882601, 1, 1, 1, 1, 1,
-0.6822257, -2.34777, -3.08304, 1, 1, 1, 1, 1,
-0.6820346, 0.7468408, 1.274632, 1, 1, 1, 1, 1,
-0.677583, 0.3342501, -1.056304, 1, 1, 1, 1, 1,
-0.6751008, -2.343401, -1.332286, 1, 1, 1, 1, 1,
-0.6747138, 0.6289437, -0.4739681, 0, 0, 1, 1, 1,
-0.6725506, 0.0233718, -0.7134951, 1, 0, 0, 1, 1,
-0.6703419, -0.719552, -3.378126, 1, 0, 0, 1, 1,
-0.6691011, 0.10332, -2.14762, 1, 0, 0, 1, 1,
-0.6688417, -1.911514, -4.033554, 1, 0, 0, 1, 1,
-0.6677887, 0.2479493, -1.13686, 1, 0, 0, 1, 1,
-0.6667475, 0.6520716, -0.4989997, 0, 0, 0, 1, 1,
-0.6651494, 0.9560828, -0.1325637, 0, 0, 0, 1, 1,
-0.6625653, 0.2273707, -2.02347, 0, 0, 0, 1, 1,
-0.6618673, 0.601661, -1.101864, 0, 0, 0, 1, 1,
-0.6598259, -0.156656, -0.9025841, 0, 0, 0, 1, 1,
-0.6541754, -1.3922, -3.562484, 0, 0, 0, 1, 1,
-0.6510125, -0.6212553, -2.150748, 0, 0, 0, 1, 1,
-0.649542, -0.07134016, -3.186921, 1, 1, 1, 1, 1,
-0.6389368, 1.889528, -0.3289916, 1, 1, 1, 1, 1,
-0.6380367, -1.14755, -3.80689, 1, 1, 1, 1, 1,
-0.6355482, 1.323593, -2.084252, 1, 1, 1, 1, 1,
-0.6312667, -0.600032, -3.688676, 1, 1, 1, 1, 1,
-0.6309243, -0.9247508, -2.689575, 1, 1, 1, 1, 1,
-0.6253109, 0.54118, -0.7563074, 1, 1, 1, 1, 1,
-0.6232434, -0.5040184, -3.571576, 1, 1, 1, 1, 1,
-0.6169765, -0.1303881, -2.36775, 1, 1, 1, 1, 1,
-0.6168061, -0.4654261, -1.010828, 1, 1, 1, 1, 1,
-0.6141319, -0.4908523, -1.992444, 1, 1, 1, 1, 1,
-0.6134094, -0.7641003, -3.767433, 1, 1, 1, 1, 1,
-0.6076097, -0.9011835, -2.381273, 1, 1, 1, 1, 1,
-0.607207, 2.014343, -0.3078552, 1, 1, 1, 1, 1,
-0.6017314, -0.2175157, -2.460698, 1, 1, 1, 1, 1,
-0.6009493, 0.1434491, -2.106149, 0, 0, 1, 1, 1,
-0.5984919, -0.6615054, -2.703664, 1, 0, 0, 1, 1,
-0.5971734, -0.3178677, -3.711043, 1, 0, 0, 1, 1,
-0.5932761, 1.181421, -1.009102, 1, 0, 0, 1, 1,
-0.5846837, -0.4367872, -1.060433, 1, 0, 0, 1, 1,
-0.5842708, 0.3572975, 0.3333969, 1, 0, 0, 1, 1,
-0.583201, -0.6930961, -1.862914, 0, 0, 0, 1, 1,
-0.582264, -1.58554, -3.976595, 0, 0, 0, 1, 1,
-0.5819802, 0.3107165, -2.14717, 0, 0, 0, 1, 1,
-0.5797299, 0.311774, -1.963666, 0, 0, 0, 1, 1,
-0.579012, 1.853012, -0.05588849, 0, 0, 0, 1, 1,
-0.5785149, 0.1198325, -3.061057, 0, 0, 0, 1, 1,
-0.5778458, -0.3390357, -2.533173, 0, 0, 0, 1, 1,
-0.5773712, -0.4336071, -0.8092558, 1, 1, 1, 1, 1,
-0.5767117, -0.3670541, -2.62858, 1, 1, 1, 1, 1,
-0.5748353, 0.8997802, -1.000475, 1, 1, 1, 1, 1,
-0.5727482, -0.6893932, -3.351154, 1, 1, 1, 1, 1,
-0.5717208, 0.08340061, -0.7872597, 1, 1, 1, 1, 1,
-0.5708023, 1.027208, -1.299305, 1, 1, 1, 1, 1,
-0.5706695, 0.07876763, -1.532793, 1, 1, 1, 1, 1,
-0.566158, -0.4813742, -1.286171, 1, 1, 1, 1, 1,
-0.5642115, 0.6320742, -0.004660992, 1, 1, 1, 1, 1,
-0.5625835, -0.4350158, -1.529078, 1, 1, 1, 1, 1,
-0.5570827, -0.01224245, -1.441083, 1, 1, 1, 1, 1,
-0.5527255, -0.6431094, -1.196711, 1, 1, 1, 1, 1,
-0.5452923, -1.161532, -1.764013, 1, 1, 1, 1, 1,
-0.5440553, 0.5540136, -0.2830652, 1, 1, 1, 1, 1,
-0.5436719, 1.046632, 0.3785164, 1, 1, 1, 1, 1,
-0.5406352, 0.01425237, -1.703314, 0, 0, 1, 1, 1,
-0.5393625, -0.6198243, -1.076501, 1, 0, 0, 1, 1,
-0.5391126, -0.5137898, -2.212864, 1, 0, 0, 1, 1,
-0.5368151, -0.3465281, -2.179431, 1, 0, 0, 1, 1,
-0.5351772, -1.924468, -2.934198, 1, 0, 0, 1, 1,
-0.5301281, 1.229552, 1.376391, 1, 0, 0, 1, 1,
-0.5294298, 0.6679195, -0.698552, 0, 0, 0, 1, 1,
-0.5217757, -0.7307916, -2.087214, 0, 0, 0, 1, 1,
-0.5174596, -0.7285362, -2.345479, 0, 0, 0, 1, 1,
-0.5113125, -0.5451639, -1.474308, 0, 0, 0, 1, 1,
-0.5103778, -0.8781503, -3.988218, 0, 0, 0, 1, 1,
-0.5038686, 1.745926, -0.6456749, 0, 0, 0, 1, 1,
-0.495031, -0.7012345, -2.378172, 0, 0, 0, 1, 1,
-0.4935138, -0.8301067, -2.597525, 1, 1, 1, 1, 1,
-0.4920027, 0.250842, -0.7187784, 1, 1, 1, 1, 1,
-0.4801928, -2.409324, -2.148837, 1, 1, 1, 1, 1,
-0.4784239, -0.5034554, -1.192067, 1, 1, 1, 1, 1,
-0.4732804, -0.3926585, -0.5077978, 1, 1, 1, 1, 1,
-0.4716449, -1.239504, -3.804465, 1, 1, 1, 1, 1,
-0.4622373, 0.02829455, -0.9231488, 1, 1, 1, 1, 1,
-0.4618319, -2.545194, -1.539275, 1, 1, 1, 1, 1,
-0.461621, 0.3749083, -1.099919, 1, 1, 1, 1, 1,
-0.46025, 2.030961, 1.061739, 1, 1, 1, 1, 1,
-0.459025, 0.5023206, 1.978238, 1, 1, 1, 1, 1,
-0.4572072, -1.599307, -5.091515, 1, 1, 1, 1, 1,
-0.4554374, -0.2479566, -2.296195, 1, 1, 1, 1, 1,
-0.4535382, -1.311788, -4.28157, 1, 1, 1, 1, 1,
-0.4533978, 1.815827, 0.01088333, 1, 1, 1, 1, 1,
-0.4447734, 0.04559264, 0.01061544, 0, 0, 1, 1, 1,
-0.4438548, 0.5502696, 0.2082394, 1, 0, 0, 1, 1,
-0.4405164, -0.1090957, -1.766909, 1, 0, 0, 1, 1,
-0.4366774, 0.07694542, -0.7038929, 1, 0, 0, 1, 1,
-0.4322013, -1.489439, -1.223055, 1, 0, 0, 1, 1,
-0.4286139, 0.5956028, 0.1298166, 1, 0, 0, 1, 1,
-0.4285046, 2.087682, -1.283763, 0, 0, 0, 1, 1,
-0.42813, 0.4991302, -0.7304659, 0, 0, 0, 1, 1,
-0.427278, -2.9396, -3.009405, 0, 0, 0, 1, 1,
-0.4253865, -0.4678267, -2.697256, 0, 0, 0, 1, 1,
-0.4182559, 1.284836, 0.0452469, 0, 0, 0, 1, 1,
-0.4158496, -1.577797, -2.730733, 0, 0, 0, 1, 1,
-0.414761, -2.007668, -1.384115, 0, 0, 0, 1, 1,
-0.414396, 0.4369333, -2.980543, 1, 1, 1, 1, 1,
-0.4136298, 1.808994, 1.345613, 1, 1, 1, 1, 1,
-0.411386, 0.0173002, -1.123863, 1, 1, 1, 1, 1,
-0.406184, -0.1295596, -3.75931, 1, 1, 1, 1, 1,
-0.4037187, 0.07391014, -2.526062, 1, 1, 1, 1, 1,
-0.4030943, -0.7540429, -2.460135, 1, 1, 1, 1, 1,
-0.403058, 0.4608947, 0.2370605, 1, 1, 1, 1, 1,
-0.4025995, -0.1139366, -3.485937, 1, 1, 1, 1, 1,
-0.4024192, -0.6123667, -0.8553094, 1, 1, 1, 1, 1,
-0.4015977, -1.425708, -0.9227993, 1, 1, 1, 1, 1,
-0.4014587, 0.2070074, -1.564839, 1, 1, 1, 1, 1,
-0.4013374, 1.187875, 0.7409135, 1, 1, 1, 1, 1,
-0.4006662, -2.313545, -3.123066, 1, 1, 1, 1, 1,
-0.4004443, 0.385698, 0.2973888, 1, 1, 1, 1, 1,
-0.399377, 1.852231, -1.432288, 1, 1, 1, 1, 1,
-0.3990476, 0.4974346, -0.1334887, 0, 0, 1, 1, 1,
-0.3984395, -0.9237056, -3.813083, 1, 0, 0, 1, 1,
-0.3978435, -1.289392, 0.06545776, 1, 0, 0, 1, 1,
-0.396399, 0.5332079, -1.653729, 1, 0, 0, 1, 1,
-0.3941402, 0.7735795, -1.523945, 1, 0, 0, 1, 1,
-0.3907011, -2.743958, -2.501118, 1, 0, 0, 1, 1,
-0.3893057, 0.1853201, -0.8164492, 0, 0, 0, 1, 1,
-0.3860904, -0.4155234, -2.323035, 0, 0, 0, 1, 1,
-0.3830386, -1.56979, -2.853529, 0, 0, 0, 1, 1,
-0.3825739, 1.054365, -0.124328, 0, 0, 0, 1, 1,
-0.3792523, 1.059916, -0.6328204, 0, 0, 0, 1, 1,
-0.3777505, -0.5350031, -1.418101, 0, 0, 0, 1, 1,
-0.3729469, 1.469954, -0.8601685, 0, 0, 0, 1, 1,
-0.3677671, 0.00708147, -0.4982863, 1, 1, 1, 1, 1,
-0.3670021, 0.85236, -0.9998198, 1, 1, 1, 1, 1,
-0.3667764, 0.1481988, -3.458289, 1, 1, 1, 1, 1,
-0.3665976, 0.4770069, 0.09865142, 1, 1, 1, 1, 1,
-0.3664362, 2.173773, -0.1567347, 1, 1, 1, 1, 1,
-0.3658063, 1.902466, 0.7251376, 1, 1, 1, 1, 1,
-0.365254, 1.10402, 0.3279425, 1, 1, 1, 1, 1,
-0.360954, 0.2051844, 0.8948895, 1, 1, 1, 1, 1,
-0.3557468, -1.820954, -2.355316, 1, 1, 1, 1, 1,
-0.3536773, 0.7516874, 0.960206, 1, 1, 1, 1, 1,
-0.350487, 0.3578759, -2.296265, 1, 1, 1, 1, 1,
-0.3325376, -1.859809, -0.5806915, 1, 1, 1, 1, 1,
-0.3300281, 0.1548617, -0.9073064, 1, 1, 1, 1, 1,
-0.3284009, 0.2553992, -0.2972803, 1, 1, 1, 1, 1,
-0.324147, -0.2610526, -4.013416, 1, 1, 1, 1, 1,
-0.3240175, -0.1627733, -1.884406, 0, 0, 1, 1, 1,
-0.3224701, 1.299485, 1.064299, 1, 0, 0, 1, 1,
-0.3154943, -0.9632539, -0.6922689, 1, 0, 0, 1, 1,
-0.3144091, 0.5905739, 0.689155, 1, 0, 0, 1, 1,
-0.3130077, 0.6294951, 0.2993868, 1, 0, 0, 1, 1,
-0.3120146, 0.02417398, -1.036973, 1, 0, 0, 1, 1,
-0.3091771, -0.648756, -4.536694, 0, 0, 0, 1, 1,
-0.3085769, -0.01770162, -1.809082, 0, 0, 0, 1, 1,
-0.3012652, -1.850882, -2.821932, 0, 0, 0, 1, 1,
-0.2981349, -0.9312329, -1.733899, 0, 0, 0, 1, 1,
-0.2977682, -0.9316233, -2.79717, 0, 0, 0, 1, 1,
-0.2891624, -0.690111, -1.91271, 0, 0, 0, 1, 1,
-0.2874493, 0.2867375, -1.234546, 0, 0, 0, 1, 1,
-0.2850008, -1.47011, -1.743629, 1, 1, 1, 1, 1,
-0.2762717, 1.813729, -0.6793806, 1, 1, 1, 1, 1,
-0.2742016, -1.497653, -3.556861, 1, 1, 1, 1, 1,
-0.2685415, -1.666702, -3.705359, 1, 1, 1, 1, 1,
-0.2678014, -0.7954757, -2.832262, 1, 1, 1, 1, 1,
-0.2659982, 1.459026, -2.952576, 1, 1, 1, 1, 1,
-0.2617806, 1.693437, 2.035032, 1, 1, 1, 1, 1,
-0.2589284, 0.3885783, -0.8686197, 1, 1, 1, 1, 1,
-0.2557999, -0.4778768, -1.501456, 1, 1, 1, 1, 1,
-0.2528775, 0.9299246, -0.8273665, 1, 1, 1, 1, 1,
-0.2471533, -0.6743994, -1.7206, 1, 1, 1, 1, 1,
-0.2469565, -1.400776, -1.065697, 1, 1, 1, 1, 1,
-0.2467705, 1.479283, -0.1480404, 1, 1, 1, 1, 1,
-0.2421321, 1.207516, -0.1244709, 1, 1, 1, 1, 1,
-0.2410169, 0.09598375, -1.865086, 1, 1, 1, 1, 1,
-0.2393525, 0.02418637, -1.231924, 0, 0, 1, 1, 1,
-0.2296447, 0.2678041, -1.246406, 1, 0, 0, 1, 1,
-0.228195, 0.1143812, -0.8327073, 1, 0, 0, 1, 1,
-0.2271613, 0.04421122, -0.9445388, 1, 0, 0, 1, 1,
-0.2230431, 0.08794365, -0.2312699, 1, 0, 0, 1, 1,
-0.2173149, -0.06106134, -0.8786789, 1, 0, 0, 1, 1,
-0.2160724, 1.414194, -2.494637, 0, 0, 0, 1, 1,
-0.2155369, -2.801644, -2.64801, 0, 0, 0, 1, 1,
-0.2146396, 1.024124, -0.6872008, 0, 0, 0, 1, 1,
-0.2133516, 0.04800024, -2.239314, 0, 0, 0, 1, 1,
-0.212269, -0.5976918, -2.123322, 0, 0, 0, 1, 1,
-0.2061342, -0.1303144, -2.079159, 0, 0, 0, 1, 1,
-0.2059143, 0.9316048, -1.162019, 0, 0, 0, 1, 1,
-0.2056346, 1.725337, -0.3413523, 1, 1, 1, 1, 1,
-0.2054424, -0.02039926, -3.240585, 1, 1, 1, 1, 1,
-0.20519, -0.3148347, -2.765635, 1, 1, 1, 1, 1,
-0.2029646, -0.6325024, -2.136651, 1, 1, 1, 1, 1,
-0.200985, 0.003432216, -1.331003, 1, 1, 1, 1, 1,
-0.2006546, 0.9739241, -2.298063, 1, 1, 1, 1, 1,
-0.1991526, 0.05955431, -0.2816121, 1, 1, 1, 1, 1,
-0.1955175, 1.379392, 1.530168, 1, 1, 1, 1, 1,
-0.1895839, 0.2146556, -2.746842, 1, 1, 1, 1, 1,
-0.1884513, -3.162428, -1.77358, 1, 1, 1, 1, 1,
-0.1845806, 0.005798148, -2.665683, 1, 1, 1, 1, 1,
-0.1815358, -0.2895294, -3.642842, 1, 1, 1, 1, 1,
-0.1812791, 0.2247, -2.284618, 1, 1, 1, 1, 1,
-0.1778761, 1.104191, 0.3072779, 1, 1, 1, 1, 1,
-0.1774831, -0.2295647, -2.845359, 1, 1, 1, 1, 1,
-0.1766486, -0.914472, -2.892872, 0, 0, 1, 1, 1,
-0.1732361, -0.227744, -2.719611, 1, 0, 0, 1, 1,
-0.169861, 0.7129495, -1.541625, 1, 0, 0, 1, 1,
-0.1693019, 1.424849, 0.02764199, 1, 0, 0, 1, 1,
-0.1668423, -0.6748382, -1.662457, 1, 0, 0, 1, 1,
-0.1657604, -1.375473, -1.954994, 1, 0, 0, 1, 1,
-0.164138, -1.638928, -3.911299, 0, 0, 0, 1, 1,
-0.1563205, 1.643621, -0.8329557, 0, 0, 0, 1, 1,
-0.1544841, -0.1254074, -2.199376, 0, 0, 0, 1, 1,
-0.1542298, -1.042911, -2.089795, 0, 0, 0, 1, 1,
-0.1516671, 0.8472512, 0.03480102, 0, 0, 0, 1, 1,
-0.1508762, 0.9092537, -0.7319694, 0, 0, 0, 1, 1,
-0.1454474, -0.8742155, -2.194834, 0, 0, 0, 1, 1,
-0.139601, 0.09357001, -3.694893, 1, 1, 1, 1, 1,
-0.1350014, 1.877491, -0.4868329, 1, 1, 1, 1, 1,
-0.1345961, 1.411351, -1.131351, 1, 1, 1, 1, 1,
-0.1341958, -0.6315135, -2.726518, 1, 1, 1, 1, 1,
-0.1324985, -0.09691489, -3.835914, 1, 1, 1, 1, 1,
-0.1287926, 2.967742, 0.2549812, 1, 1, 1, 1, 1,
-0.1266262, -0.6085156, -2.802217, 1, 1, 1, 1, 1,
-0.1223293, 0.7903813, 0.2783005, 1, 1, 1, 1, 1,
-0.121561, -0.5129706, -3.226256, 1, 1, 1, 1, 1,
-0.1168998, 0.3137394, -0.8011196, 1, 1, 1, 1, 1,
-0.1114132, 0.7777118, -0.537574, 1, 1, 1, 1, 1,
-0.109205, -1.009418, -2.115145, 1, 1, 1, 1, 1,
-0.1089829, 1.321983, -1.055894, 1, 1, 1, 1, 1,
-0.1059879, 0.2756813, -1.221432, 1, 1, 1, 1, 1,
-0.1017357, -0.1347746, -4.244639, 1, 1, 1, 1, 1,
-0.09961516, -2.5157, -3.34129, 0, 0, 1, 1, 1,
-0.09934782, 1.190765, 0.892883, 1, 0, 0, 1, 1,
-0.09715226, 1.441666, 0.181427, 1, 0, 0, 1, 1,
-0.09681781, -1.951046, -2.707974, 1, 0, 0, 1, 1,
-0.09575517, -0.2292353, -1.831928, 1, 0, 0, 1, 1,
-0.08928035, -0.856932, -2.454288, 1, 0, 0, 1, 1,
-0.08896275, 0.1752304, 0.1995948, 0, 0, 0, 1, 1,
-0.08251607, 0.788739, -0.4659742, 0, 0, 0, 1, 1,
-0.08193278, 0.8183457, 0.5539755, 0, 0, 0, 1, 1,
-0.08039606, 0.2129064, -0.3982142, 0, 0, 0, 1, 1,
-0.07973676, -1.449303, -2.621366, 0, 0, 0, 1, 1,
-0.07597084, 0.2711405, -0.2017867, 0, 0, 0, 1, 1,
-0.07521012, 1.240389, 0.6737526, 0, 0, 0, 1, 1,
-0.07517077, -0.6159416, -3.813044, 1, 1, 1, 1, 1,
-0.0721348, -0.3743963, -3.150818, 1, 1, 1, 1, 1,
-0.06587794, 0.8416621, 0.3455135, 1, 1, 1, 1, 1,
-0.0629278, -0.486495, -3.761268, 1, 1, 1, 1, 1,
-0.06046108, 1.27399, 3.170367, 1, 1, 1, 1, 1,
-0.05911698, -0.6950651, -3.024107, 1, 1, 1, 1, 1,
-0.05734016, 1.167493, -0.4274308, 1, 1, 1, 1, 1,
-0.05267227, -1.573125, -2.720813, 1, 1, 1, 1, 1,
-0.05266654, 1.299526, -0.5775768, 1, 1, 1, 1, 1,
-0.05006817, 0.07031288, 0.1613412, 1, 1, 1, 1, 1,
-0.04699217, -0.899677, -2.658818, 1, 1, 1, 1, 1,
-0.0463129, 0.5356213, 0.8005946, 1, 1, 1, 1, 1,
-0.04589566, -2.962157, -3.353515, 1, 1, 1, 1, 1,
-0.04423245, 0.3138839, -1.942996, 1, 1, 1, 1, 1,
-0.04392958, -1.113123, -3.651211, 1, 1, 1, 1, 1,
-0.04168664, -1.355425, -4.81228, 0, 0, 1, 1, 1,
-0.03277589, -0.7059609, -2.908239, 1, 0, 0, 1, 1,
-0.03068237, 0.1953288, -0.3485596, 1, 0, 0, 1, 1,
-0.02560425, 0.5111654, 0.5823102, 1, 0, 0, 1, 1,
-0.02438804, 0.7221227, -0.5815846, 1, 0, 0, 1, 1,
-0.02039104, -1.09274, -2.786969, 1, 0, 0, 1, 1,
-0.01902636, 0.6907729, 1.177368, 0, 0, 0, 1, 1,
-0.01740659, -1.275978, -3.44927, 0, 0, 0, 1, 1,
-0.01605173, -1.368559, -1.626797, 0, 0, 0, 1, 1,
-0.01561952, 0.1054992, 0.1401152, 0, 0, 0, 1, 1,
-0.01418181, -1.369397, -3.947713, 0, 0, 0, 1, 1,
-0.01384174, 0.9730939, 1.459142, 0, 0, 0, 1, 1,
-0.01017776, 0.1291167, 0.1175385, 0, 0, 0, 1, 1,
-0.009651659, -1.987676, -3.379181, 1, 1, 1, 1, 1,
-0.00872917, 1.512697, 1.379251, 1, 1, 1, 1, 1,
-0.006749101, -0.2952204, -2.920164, 1, 1, 1, 1, 1,
-0.006332437, 1.111456, 1.007445, 1, 1, 1, 1, 1,
-0.004596275, -0.06673016, -3.189759, 1, 1, 1, 1, 1,
-0.002783132, -1.756521, -4.08629, 1, 1, 1, 1, 1,
-0.002009354, 0.5126712, -0.02961806, 1, 1, 1, 1, 1,
-0.001059117, 0.2911597, -1.026133, 1, 1, 1, 1, 1,
-0.0002733802, -0.7603205, -2.644672, 1, 1, 1, 1, 1,
0.0004021117, 1.22176, -1.516372, 1, 1, 1, 1, 1,
0.003223111, 0.7573541, 0.4506096, 1, 1, 1, 1, 1,
0.006063419, 0.2455328, -0.2635376, 1, 1, 1, 1, 1,
0.006367486, -0.1475174, 2.337817, 1, 1, 1, 1, 1,
0.008381275, 1.026494, -0.2416346, 1, 1, 1, 1, 1,
0.008492791, 0.9040108, -0.2295141, 1, 1, 1, 1, 1,
0.009399528, -0.7797972, 2.458586, 0, 0, 1, 1, 1,
0.01114257, -0.1818845, 1.645003, 1, 0, 0, 1, 1,
0.01123056, 1.473158, 1.157519, 1, 0, 0, 1, 1,
0.01279065, -2.261077, 3.150559, 1, 0, 0, 1, 1,
0.01316892, 1.09097, -0.3422686, 1, 0, 0, 1, 1,
0.02311894, -0.0412135, 4.068956, 1, 0, 0, 1, 1,
0.02320025, 0.6341944, 1.713314, 0, 0, 0, 1, 1,
0.02341943, 1.297323, 1.639213, 0, 0, 0, 1, 1,
0.02367212, -1.382766, 2.021151, 0, 0, 0, 1, 1,
0.02561891, -0.1081522, 2.19468, 0, 0, 0, 1, 1,
0.02786898, -0.212822, 2.952488, 0, 0, 0, 1, 1,
0.0318464, 0.500426, -1.260309, 0, 0, 0, 1, 1,
0.03700695, 0.1510221, 0.2637915, 0, 0, 0, 1, 1,
0.03896257, 0.7101809, 0.4966622, 1, 1, 1, 1, 1,
0.04302715, 0.483952, 0.4691573, 1, 1, 1, 1, 1,
0.04439275, 0.7541403, 0.2972159, 1, 1, 1, 1, 1,
0.04792232, -1.208973, 5.082401, 1, 1, 1, 1, 1,
0.04982324, 2.087806, -0.2114487, 1, 1, 1, 1, 1,
0.05002308, -0.5435995, 3.977582, 1, 1, 1, 1, 1,
0.05003465, -0.1569913, 2.659678, 1, 1, 1, 1, 1,
0.05274373, 0.2533924, 0.09947775, 1, 1, 1, 1, 1,
0.05751376, -1.745029, 2.17591, 1, 1, 1, 1, 1,
0.05907293, -1.61059, 4.334778, 1, 1, 1, 1, 1,
0.05934167, -0.2981013, 3.946675, 1, 1, 1, 1, 1,
0.06352555, 2.266017, -2.838004, 1, 1, 1, 1, 1,
0.06440234, 0.09711063, 1.195021, 1, 1, 1, 1, 1,
0.07019319, 0.4702139, -0.7503204, 1, 1, 1, 1, 1,
0.07086198, 0.0275201, 2.264719, 1, 1, 1, 1, 1,
0.07617982, 0.1236724, 0.9790156, 0, 0, 1, 1, 1,
0.07816345, 0.3615546, 1.172005, 1, 0, 0, 1, 1,
0.08383695, -1.704406, 2.525883, 1, 0, 0, 1, 1,
0.08435352, 0.9940479, 1.392501, 1, 0, 0, 1, 1,
0.08602504, -0.03690675, 2.774679, 1, 0, 0, 1, 1,
0.08665413, -1.257577, 2.667447, 1, 0, 0, 1, 1,
0.08730158, -0.5216299, 4.722476, 0, 0, 0, 1, 1,
0.09326129, 0.3950068, 1.016747, 0, 0, 0, 1, 1,
0.09360217, 1.413472, -1.291158, 0, 0, 0, 1, 1,
0.09672075, 1.523306, 1.068882, 0, 0, 0, 1, 1,
0.09891375, 1.512588, -0.688872, 0, 0, 0, 1, 1,
0.09969129, 1.60934, -1.398542, 0, 0, 0, 1, 1,
0.09997959, -0.02484753, 1.659965, 0, 0, 0, 1, 1,
0.1081057, -1.61837, 1.720205, 1, 1, 1, 1, 1,
0.1127046, -0.2876459, 2.873122, 1, 1, 1, 1, 1,
0.1130207, 0.5097563, 0.2923805, 1, 1, 1, 1, 1,
0.1275709, -0.7863265, 2.493417, 1, 1, 1, 1, 1,
0.1277217, -1.48061, 3.300857, 1, 1, 1, 1, 1,
0.1304326, 0.1981311, 0.1868315, 1, 1, 1, 1, 1,
0.1323423, 0.1321381, 0.2932843, 1, 1, 1, 1, 1,
0.1329632, -0.3220828, 1.947839, 1, 1, 1, 1, 1,
0.1351428, 0.6359465, 1.244883, 1, 1, 1, 1, 1,
0.1374608, -0.2566261, 1.950776, 1, 1, 1, 1, 1,
0.1376752, 0.5662572, 1.258948, 1, 1, 1, 1, 1,
0.1397046, 1.100881, 0.3719871, 1, 1, 1, 1, 1,
0.1417381, -0.2383939, 2.654483, 1, 1, 1, 1, 1,
0.1441144, -1.456166, 2.969571, 1, 1, 1, 1, 1,
0.1452061, 1.42696, -0.05187744, 1, 1, 1, 1, 1,
0.1467021, 0.2212259, -0.0958335, 0, 0, 1, 1, 1,
0.1501963, 0.400748, 0.6580546, 1, 0, 0, 1, 1,
0.1512965, 0.1757613, 0.2401981, 1, 0, 0, 1, 1,
0.1513432, 0.3436078, 1.521572, 1, 0, 0, 1, 1,
0.1574724, 0.376371, 0.4734074, 1, 0, 0, 1, 1,
0.1609454, 0.6636293, -0.01529615, 1, 0, 0, 1, 1,
0.1635182, 1.10433, -0.7504587, 0, 0, 0, 1, 1,
0.1661606, -0.3611, 2.987775, 0, 0, 0, 1, 1,
0.1686204, -0.7925514, 4.151512, 0, 0, 0, 1, 1,
0.1707435, -1.49016, 3.525248, 0, 0, 0, 1, 1,
0.1754027, -0.2231945, 2.181989, 0, 0, 0, 1, 1,
0.1790255, -0.5164584, 3.724398, 0, 0, 0, 1, 1,
0.1808961, -2.204823, 1.91091, 0, 0, 0, 1, 1,
0.1814251, -0.3155182, 1.452505, 1, 1, 1, 1, 1,
0.1815438, -0.3104552, 1.931134, 1, 1, 1, 1, 1,
0.1876124, -0.5188657, 1.281565, 1, 1, 1, 1, 1,
0.1878252, -0.2317557, 3.309189, 1, 1, 1, 1, 1,
0.1911442, 0.3143867, 1.137116, 1, 1, 1, 1, 1,
0.1963454, -0.4177843, 3.201916, 1, 1, 1, 1, 1,
0.2018985, -0.2876271, 1.156131, 1, 1, 1, 1, 1,
0.2027989, 0.7175332, 1.673856, 1, 1, 1, 1, 1,
0.2076047, -0.5514175, 3.000716, 1, 1, 1, 1, 1,
0.209199, -0.433543, 2.207793, 1, 1, 1, 1, 1,
0.2116658, 1.031313, 0.4517286, 1, 1, 1, 1, 1,
0.2170432, -0.6778545, 2.455866, 1, 1, 1, 1, 1,
0.228794, -1.062709, 2.913616, 1, 1, 1, 1, 1,
0.2297746, 0.5629594, -0.4633562, 1, 1, 1, 1, 1,
0.2313667, -0.7976179, 1.782127, 1, 1, 1, 1, 1,
0.2318618, 1.486618, 0.7566825, 0, 0, 1, 1, 1,
0.2328034, 0.3587428, 1.384168, 1, 0, 0, 1, 1,
0.238385, 1.322945, -1.272174, 1, 0, 0, 1, 1,
0.2388175, 1.147556, 1.404357, 1, 0, 0, 1, 1,
0.2502305, 0.4427935, 2.331119, 1, 0, 0, 1, 1,
0.255586, 0.5205382, 1.722993, 1, 0, 0, 1, 1,
0.2588298, -0.751271, 1.998137, 0, 0, 0, 1, 1,
0.2599404, -1.128142, 1.777421, 0, 0, 0, 1, 1,
0.2664093, 0.1599574, 1.449654, 0, 0, 0, 1, 1,
0.2687436, 0.6996867, -1.208394, 0, 0, 0, 1, 1,
0.2713836, 0.3559983, -0.3188592, 0, 0, 0, 1, 1,
0.2733369, -0.4452968, 2.140233, 0, 0, 0, 1, 1,
0.2750621, 1.620719, 1.915332, 0, 0, 0, 1, 1,
0.2751145, 0.507829, 0.5350443, 1, 1, 1, 1, 1,
0.276637, -0.1682243, 2.409594, 1, 1, 1, 1, 1,
0.2798219, -0.9304572, 3.369822, 1, 1, 1, 1, 1,
0.2815135, 0.6706522, -0.455565, 1, 1, 1, 1, 1,
0.2817575, 0.4988204, 1.691954, 1, 1, 1, 1, 1,
0.2836956, 0.1268788, 1.480297, 1, 1, 1, 1, 1,
0.2875252, -0.9175199, 2.610198, 1, 1, 1, 1, 1,
0.2894366, 0.7154163, -0.459995, 1, 1, 1, 1, 1,
0.2931356, 1.781178, 1.029979, 1, 1, 1, 1, 1,
0.294981, -0.8043301, 2.436644, 1, 1, 1, 1, 1,
0.2950224, 1.0919, -0.4375117, 1, 1, 1, 1, 1,
0.297793, 1.613189, 0.2136492, 1, 1, 1, 1, 1,
0.2982024, -0.7548179, 3.622075, 1, 1, 1, 1, 1,
0.3066519, 0.3131773, 0.98899, 1, 1, 1, 1, 1,
0.3162662, -0.226153, 3.986314, 1, 1, 1, 1, 1,
0.3219782, -1.131662, 1.295629, 0, 0, 1, 1, 1,
0.3235751, -0.5253393, 2.779408, 1, 0, 0, 1, 1,
0.3243223, -0.1171882, 2.422486, 1, 0, 0, 1, 1,
0.3265793, 1.515193, -0.8446053, 1, 0, 0, 1, 1,
0.3314286, -0.8996084, 3.908201, 1, 0, 0, 1, 1,
0.3328049, 0.9620265, 0.6085928, 1, 0, 0, 1, 1,
0.3371533, -1.157727, 2.317383, 0, 0, 0, 1, 1,
0.3391121, -0.888303, 3.069924, 0, 0, 0, 1, 1,
0.3404008, -0.3413736, 1.207773, 0, 0, 0, 1, 1,
0.3409808, -0.07575094, 1.953992, 0, 0, 0, 1, 1,
0.3417192, -0.4524163, 1.234704, 0, 0, 0, 1, 1,
0.3417999, 1.684154, -0.3819397, 0, 0, 0, 1, 1,
0.3432581, -0.09195221, 0.7893392, 0, 0, 0, 1, 1,
0.3522656, -0.870656, 3.872905, 1, 1, 1, 1, 1,
0.3591398, 0.7956869, 1.154103, 1, 1, 1, 1, 1,
0.3611615, -0.4003707, 2.437093, 1, 1, 1, 1, 1,
0.3687003, 1.160783, 1.734777, 1, 1, 1, 1, 1,
0.3696207, 0.1159258, 1.310303, 1, 1, 1, 1, 1,
0.3744565, 0.4822805, -0.4444892, 1, 1, 1, 1, 1,
0.3773879, -1.822352, 3.392085, 1, 1, 1, 1, 1,
0.3818207, -0.5024098, 1.965479, 1, 1, 1, 1, 1,
0.3860326, -0.7482947, 1.042413, 1, 1, 1, 1, 1,
0.3867739, 0.7475935, -0.9675618, 1, 1, 1, 1, 1,
0.3869249, 0.598989, -0.1546912, 1, 1, 1, 1, 1,
0.3878266, -1.031831, 1.881598, 1, 1, 1, 1, 1,
0.3888448, -1.757267, 1.390128, 1, 1, 1, 1, 1,
0.3892759, 0.2885948, 0.4057755, 1, 1, 1, 1, 1,
0.4032563, -2.764975, 4.025464, 1, 1, 1, 1, 1,
0.4075894, -0.3409154, 1.958115, 0, 0, 1, 1, 1,
0.4144573, -1.47868, 3.181383, 1, 0, 0, 1, 1,
0.4227747, 0.1910166, 0.6587359, 1, 0, 0, 1, 1,
0.4237758, 0.1449317, 1.689193, 1, 0, 0, 1, 1,
0.4275961, 0.3697816, -0.6001037, 1, 0, 0, 1, 1,
0.4287685, -1.121528, 3.524603, 1, 0, 0, 1, 1,
0.4322245, 0.6810356, -0.5701979, 0, 0, 0, 1, 1,
0.4322997, -0.5758915, 1.272786, 0, 0, 0, 1, 1,
0.4329184, -0.01740769, 0.1958815, 0, 0, 0, 1, 1,
0.4334499, -0.7929454, 2.76715, 0, 0, 0, 1, 1,
0.4362845, 0.6669136, 0.574233, 0, 0, 0, 1, 1,
0.4451801, 0.03471721, -0.6585419, 0, 0, 0, 1, 1,
0.4455193, -1.608029, 4.364467, 0, 0, 0, 1, 1,
0.4476954, 0.3554161, 0.5425661, 1, 1, 1, 1, 1,
0.4567594, 0.3170917, -0.2754878, 1, 1, 1, 1, 1,
0.4609523, 0.6040783, 0.8158079, 1, 1, 1, 1, 1,
0.4629892, 0.09173746, 2.739679, 1, 1, 1, 1, 1,
0.4673631, -1.741216, 2.201693, 1, 1, 1, 1, 1,
0.4686246, 0.8923384, 1.289417, 1, 1, 1, 1, 1,
0.4721574, 0.3680126, 0.3047914, 1, 1, 1, 1, 1,
0.4771062, 0.3890657, 0.6305397, 1, 1, 1, 1, 1,
0.4772538, -0.6338462, 4.392358, 1, 1, 1, 1, 1,
0.4793707, -0.4824326, 2.319125, 1, 1, 1, 1, 1,
0.4851463, -0.3257158, 1.523293, 1, 1, 1, 1, 1,
0.4885988, 0.2819854, 1.7908, 1, 1, 1, 1, 1,
0.4898175, -0.6856784, 0.9537141, 1, 1, 1, 1, 1,
0.4945987, -2.425183, 5.216795, 1, 1, 1, 1, 1,
0.4952311, -0.3827328, 3.685694, 1, 1, 1, 1, 1,
0.4997613, -0.7845575, 1.836875, 0, 0, 1, 1, 1,
0.5015184, -0.3086591, 4.590401, 1, 0, 0, 1, 1,
0.5020807, 0.3507324, -0.2105615, 1, 0, 0, 1, 1,
0.5039969, -0.168388, 1.130698, 1, 0, 0, 1, 1,
0.5082159, -0.07461606, 1.510804, 1, 0, 0, 1, 1,
0.5093634, 2.072891, 0.7716665, 1, 0, 0, 1, 1,
0.5098481, -0.532159, 1.548023, 0, 0, 0, 1, 1,
0.5142372, -1.382455, 3.793391, 0, 0, 0, 1, 1,
0.5143701, -1.031628, 1.604259, 0, 0, 0, 1, 1,
0.5235915, -0.2835359, 1.316315, 0, 0, 0, 1, 1,
0.5246214, 0.2200736, 0.2893428, 0, 0, 0, 1, 1,
0.5287054, -0.9871911, 2.701763, 0, 0, 0, 1, 1,
0.5307923, 0.2251776, 2.328709, 0, 0, 0, 1, 1,
0.5372, -0.7003369, 0.8562846, 1, 1, 1, 1, 1,
0.5420324, 0.6501494, 1.619547, 1, 1, 1, 1, 1,
0.5461343, -0.6206225, 2.219027, 1, 1, 1, 1, 1,
0.5472972, 0.920608, 1.01679, 1, 1, 1, 1, 1,
0.5508463, -3.373156, 4.723826, 1, 1, 1, 1, 1,
0.5515078, 0.1228791, 1.559152, 1, 1, 1, 1, 1,
0.5528738, -0.8171408, 0.8896154, 1, 1, 1, 1, 1,
0.5590212, 1.101467, -0.6007568, 1, 1, 1, 1, 1,
0.5632634, -1.599108, 4.735264, 1, 1, 1, 1, 1,
0.5663447, 0.26684, 2.037029, 1, 1, 1, 1, 1,
0.5671324, -0.6402434, 2.77509, 1, 1, 1, 1, 1,
0.5695733, -0.3483936, 2.935589, 1, 1, 1, 1, 1,
0.5738205, -0.3917784, 1.813123, 1, 1, 1, 1, 1,
0.5743999, -1.18753, 4.193322, 1, 1, 1, 1, 1,
0.5747366, 1.4721, 0.3172967, 1, 1, 1, 1, 1,
0.5817593, -0.3788891, 3.426736, 0, 0, 1, 1, 1,
0.5871745, 0.7051154, -0.3832008, 1, 0, 0, 1, 1,
0.5895624, 0.5136687, 0.2265396, 1, 0, 0, 1, 1,
0.5928933, 0.4156519, -0.09896728, 1, 0, 0, 1, 1,
0.5997421, 1.680456, 0.08819968, 1, 0, 0, 1, 1,
0.6000705, 0.3147942, 1.58186, 1, 0, 0, 1, 1,
0.6023788, -2.202375, 3.141419, 0, 0, 0, 1, 1,
0.6035526, -1.786568, 2.963948, 0, 0, 0, 1, 1,
0.6102708, -0.1880478, 2.461459, 0, 0, 0, 1, 1,
0.6156693, -0.2709846, 1.541792, 0, 0, 0, 1, 1,
0.6167131, 0.4253014, 3.716592, 0, 0, 0, 1, 1,
0.6193377, 1.565868, 0.2535384, 0, 0, 0, 1, 1,
0.6230198, 1.019898, 0.3612488, 0, 0, 0, 1, 1,
0.6283312, 0.9605905, 0.7765929, 1, 1, 1, 1, 1,
0.6338651, -0.9578475, 3.745123, 1, 1, 1, 1, 1,
0.6363618, 0.6314695, -0.1591503, 1, 1, 1, 1, 1,
0.6388983, 0.0001353336, 0.3310636, 1, 1, 1, 1, 1,
0.6400474, -0.3942083, 2.3296, 1, 1, 1, 1, 1,
0.6436843, -0.2828815, 2.326032, 1, 1, 1, 1, 1,
0.6483542, -0.2757871, 1.379935, 1, 1, 1, 1, 1,
0.6540414, -0.5825531, 4.09931, 1, 1, 1, 1, 1,
0.6553918, -2.373808e-05, 1.675177, 1, 1, 1, 1, 1,
0.6571964, 0.9950301, 1.126913, 1, 1, 1, 1, 1,
0.6613006, 0.09899114, 2.722923, 1, 1, 1, 1, 1,
0.664402, 1.802283, 0.704771, 1, 1, 1, 1, 1,
0.6657208, 0.2796614, 2.304739, 1, 1, 1, 1, 1,
0.6789129, 0.5044484, 0.2746401, 1, 1, 1, 1, 1,
0.6801137, -0.1827634, 1.34638, 1, 1, 1, 1, 1,
0.6806625, 0.3832571, 0.894864, 0, 0, 1, 1, 1,
0.6856733, 2.340092, 2.524427, 1, 0, 0, 1, 1,
0.6863431, 0.1501481, 2.139908, 1, 0, 0, 1, 1,
0.6892951, 1.006379, 2.139775, 1, 0, 0, 1, 1,
0.6927811, 0.2858395, 1.412327, 1, 0, 0, 1, 1,
0.6988384, -0.03188504, 1.77439, 1, 0, 0, 1, 1,
0.699102, -0.04498302, 2.238574, 0, 0, 0, 1, 1,
0.7041227, 1.010165, 1.054084, 0, 0, 0, 1, 1,
0.7052035, 0.5394034, 2.155378, 0, 0, 0, 1, 1,
0.7075868, 1.286118, 0.7520252, 0, 0, 0, 1, 1,
0.7097069, 0.003676346, 0.2940235, 0, 0, 0, 1, 1,
0.711403, 0.4204814, -0.0873258, 0, 0, 0, 1, 1,
0.7209309, 1.356893, 0.5573343, 0, 0, 0, 1, 1,
0.7214975, 0.4121789, 3.660886, 1, 1, 1, 1, 1,
0.7221225, -0.4297657, 1.812212, 1, 1, 1, 1, 1,
0.726382, -1.526733, 1.977201, 1, 1, 1, 1, 1,
0.7282484, 0.3388352, 0.6182998, 1, 1, 1, 1, 1,
0.7299469, -0.3545483, 3.570426, 1, 1, 1, 1, 1,
0.7321364, 0.1006043, 2.055786, 1, 1, 1, 1, 1,
0.7354635, 0.4170333, 1.472349, 1, 1, 1, 1, 1,
0.7381804, -1.267, 2.575555, 1, 1, 1, 1, 1,
0.7458262, -1.270732, 3.88674, 1, 1, 1, 1, 1,
0.7485758, 0.7887955, 2.335442, 1, 1, 1, 1, 1,
0.7497609, 0.8239808, 0.7350249, 1, 1, 1, 1, 1,
0.756986, -0.09686702, 1.776903, 1, 1, 1, 1, 1,
0.7650988, -0.3581498, 2.943432, 1, 1, 1, 1, 1,
0.7669626, 0.547406, 1.207971, 1, 1, 1, 1, 1,
0.7724867, 0.8167977, 0.9144962, 1, 1, 1, 1, 1,
0.7744512, -1.108585, 2.306492, 0, 0, 1, 1, 1,
0.7752609, 0.2792161, 2.040884, 1, 0, 0, 1, 1,
0.7767443, -0.1985655, 2.070588, 1, 0, 0, 1, 1,
0.7775822, 0.6539449, 0.03528227, 1, 0, 0, 1, 1,
0.7777542, 0.7302943, 0.2934298, 1, 0, 0, 1, 1,
0.7806874, -0.8220422, 0.2860416, 1, 0, 0, 1, 1,
0.7826048, 0.2077342, 1.843656, 0, 0, 0, 1, 1,
0.7848733, -0.2637121, 0.5086949, 0, 0, 0, 1, 1,
0.7849285, -0.3278015, 2.600644, 0, 0, 0, 1, 1,
0.7998429, -0.2976488, 1.525924, 0, 0, 0, 1, 1,
0.8028198, 0.825672, 1.193345, 0, 0, 0, 1, 1,
0.8038488, 1.802943, 0.2503385, 0, 0, 0, 1, 1,
0.8121938, -0.6488368, 3.969568, 0, 0, 0, 1, 1,
0.8206883, 0.5607889, -0.3263732, 1, 1, 1, 1, 1,
0.8224524, 0.2946786, 2.247216, 1, 1, 1, 1, 1,
0.8228678, 1.224358, 1.297127, 1, 1, 1, 1, 1,
0.8239477, -1.198802, 2.273635, 1, 1, 1, 1, 1,
0.824292, 0.08011851, 2.345234, 1, 1, 1, 1, 1,
0.8311808, -2.508508, 2.91961, 1, 1, 1, 1, 1,
0.8329713, -0.6031504, 2.716758, 1, 1, 1, 1, 1,
0.8331865, 0.8590766, 1.832935, 1, 1, 1, 1, 1,
0.8350703, -0.9147535, 1.617037, 1, 1, 1, 1, 1,
0.8370124, 0.6773117, 2.076677, 1, 1, 1, 1, 1,
0.8399484, -0.8889207, 2.759641, 1, 1, 1, 1, 1,
0.84288, 1.676766, 0.7100203, 1, 1, 1, 1, 1,
0.850714, 0.3951312, 1.54162, 1, 1, 1, 1, 1,
0.8583877, 0.6360466, 0.362171, 1, 1, 1, 1, 1,
0.8697376, 0.5478285, 0.09090089, 1, 1, 1, 1, 1,
0.8702619, -1.198864, 1.779853, 0, 0, 1, 1, 1,
0.8740695, 2.091408, 1.771235, 1, 0, 0, 1, 1,
0.8751146, -0.2012885, 0.6395353, 1, 0, 0, 1, 1,
0.8761132, 1.816965, -0.5902427, 1, 0, 0, 1, 1,
0.8769732, 0.5450874, 0.9169587, 1, 0, 0, 1, 1,
0.8771152, -1.352814, 1.019801, 1, 0, 0, 1, 1,
0.8951445, -0.01505516, 0.5553868, 0, 0, 0, 1, 1,
0.9017334, 0.3905867, 1.492166, 0, 0, 0, 1, 1,
0.902217, -2.200351, 1.488836, 0, 0, 0, 1, 1,
0.9033173, 0.1150135, 1.173812, 0, 0, 0, 1, 1,
0.9066681, 0.8240954, -0.02509958, 0, 0, 0, 1, 1,
0.9102786, 1.159625, 0.8603091, 0, 0, 0, 1, 1,
0.9133697, 0.8107996, 0.9645174, 0, 0, 0, 1, 1,
0.9154266, 0.4868485, 0.3399742, 1, 1, 1, 1, 1,
0.9232581, 0.3776625, 1.315448, 1, 1, 1, 1, 1,
0.9241958, 1.704326, 1.576608, 1, 1, 1, 1, 1,
0.9318529, -0.2293327, 1.075172, 1, 1, 1, 1, 1,
0.9323431, -0.2200753, 1.719807, 1, 1, 1, 1, 1,
0.9352216, 1.717576, 2.206232, 1, 1, 1, 1, 1,
0.9393738, 0.6520102, -1.100572, 1, 1, 1, 1, 1,
0.9400814, -2.287581, 2.740275, 1, 1, 1, 1, 1,
0.9434798, -0.3759938, 1.106602, 1, 1, 1, 1, 1,
0.9502172, -1.207546, 3.546547, 1, 1, 1, 1, 1,
0.9506203, 0.8718973, 2.006916, 1, 1, 1, 1, 1,
0.9560975, -0.737803, 2.076451, 1, 1, 1, 1, 1,
0.9567305, 0.9022664, 0.6925355, 1, 1, 1, 1, 1,
0.9572964, 0.271522, 2.563282, 1, 1, 1, 1, 1,
0.958365, -0.9104223, 1.59511, 1, 1, 1, 1, 1,
0.9601008, -1.381532, 1.877064, 0, 0, 1, 1, 1,
0.9618735, -1.924482, 2.496502, 1, 0, 0, 1, 1,
0.9623266, 0.5277706, 1.15486, 1, 0, 0, 1, 1,
0.9644762, -0.2812371, 2.767531, 1, 0, 0, 1, 1,
0.9721966, -0.3694572, 1.196562, 1, 0, 0, 1, 1,
0.9797761, -1.066483, 2.246174, 1, 0, 0, 1, 1,
0.9882855, -0.4450002, 2.005661, 0, 0, 0, 1, 1,
0.9944091, 0.5889354, -0.09835907, 0, 0, 0, 1, 1,
0.9998397, -0.5851257, 2.185703, 0, 0, 0, 1, 1,
1.004307, 0.1455498, 1.133029, 0, 0, 0, 1, 1,
1.004791, 1.204241, 0.1822854, 0, 0, 0, 1, 1,
1.00589, 0.1132846, 0.9773967, 0, 0, 0, 1, 1,
1.008461, 0.1719079, 1.33081, 0, 0, 0, 1, 1,
1.009614, -0.2650487, 2.203142, 1, 1, 1, 1, 1,
1.011754, -0.2295233, 1.321756, 1, 1, 1, 1, 1,
1.014206, 0.5104686, 0.1594065, 1, 1, 1, 1, 1,
1.014478, -0.07899376, 1.423999, 1, 1, 1, 1, 1,
1.020344, -0.6306359, 1.92927, 1, 1, 1, 1, 1,
1.025937, -0.07699504, 1.5894, 1, 1, 1, 1, 1,
1.028106, -1.217602, 1.465397, 1, 1, 1, 1, 1,
1.03291, -0.4866827, 2.297884, 1, 1, 1, 1, 1,
1.035899, -0.3899593, 3.438002, 1, 1, 1, 1, 1,
1.037349, -3.165285, 1.518433, 1, 1, 1, 1, 1,
1.040084, -0.8052155, 1.704455, 1, 1, 1, 1, 1,
1.055226, -0.7815334, 2.1141, 1, 1, 1, 1, 1,
1.059555, -0.05377847, 2.67238, 1, 1, 1, 1, 1,
1.061455, 1.301736, 0.800395, 1, 1, 1, 1, 1,
1.067886, 1.416309, -0.697118, 1, 1, 1, 1, 1,
1.070776, 0.2432906, 1.984269, 0, 0, 1, 1, 1,
1.070943, 0.6468247, 1.368271, 1, 0, 0, 1, 1,
1.076009, -0.5759917, 1.778671, 1, 0, 0, 1, 1,
1.083934, 1.194105, -0.1804153, 1, 0, 0, 1, 1,
1.08817, 1.133017, 0.05506968, 1, 0, 0, 1, 1,
1.094837, -0.3847315, 3.453666, 1, 0, 0, 1, 1,
1.097597, -1.641979, 2.509241, 0, 0, 0, 1, 1,
1.098576, 0.6828935, 0.5517028, 0, 0, 0, 1, 1,
1.10589, -1.082057, 2.109975, 0, 0, 0, 1, 1,
1.107862, -0.4895195, 1.689404, 0, 0, 0, 1, 1,
1.122409, -0.1783749, 0.1001279, 0, 0, 0, 1, 1,
1.123987, -1.297354, 2.146333, 0, 0, 0, 1, 1,
1.125108, 1.180711, 1.064941, 0, 0, 0, 1, 1,
1.128822, -0.1949512, 1.505403, 1, 1, 1, 1, 1,
1.134332, 0.6175113, 0.08195387, 1, 1, 1, 1, 1,
1.136688, -0.487421, 1.827842, 1, 1, 1, 1, 1,
1.140541, -0.5009175, 3.269336, 1, 1, 1, 1, 1,
1.14488, -1.204086, 3.461794, 1, 1, 1, 1, 1,
1.150291, -0.08948482, 3.508835, 1, 1, 1, 1, 1,
1.160694, 0.2025572, 0.2923687, 1, 1, 1, 1, 1,
1.17031, 1.641264, 1.008866, 1, 1, 1, 1, 1,
1.170997, -0.03932719, 0.507922, 1, 1, 1, 1, 1,
1.192615, 0.08690259, 1.70338, 1, 1, 1, 1, 1,
1.195093, 0.9783334, 0.3824244, 1, 1, 1, 1, 1,
1.20014, 1.493027, 1.248516, 1, 1, 1, 1, 1,
1.20282, 0.8153419, 1.048323, 1, 1, 1, 1, 1,
1.209028, 0.5797689, 2.460907, 1, 1, 1, 1, 1,
1.210348, 1.447817, 0.2580459, 1, 1, 1, 1, 1,
1.224976, -0.1104823, 2.37618, 0, 0, 1, 1, 1,
1.240556, 1.416912, -0.08100777, 1, 0, 0, 1, 1,
1.242497, -0.3849074, 1.157802, 1, 0, 0, 1, 1,
1.243806, -1.814895, 3.135283, 1, 0, 0, 1, 1,
1.252738, 0.1612003, 2.011016, 1, 0, 0, 1, 1,
1.258059, 0.2515646, 2.61413, 1, 0, 0, 1, 1,
1.258705, 0.7057039, 0.392837, 0, 0, 0, 1, 1,
1.260038, 0.2878068, 1.441166, 0, 0, 0, 1, 1,
1.260054, -0.2347648, 0.7128179, 0, 0, 0, 1, 1,
1.26029, -0.634126, 1.273191, 0, 0, 0, 1, 1,
1.286213, -0.5664229, 1.597359, 0, 0, 0, 1, 1,
1.288755, 0.5269862, 1.43982, 0, 0, 0, 1, 1,
1.290123, 0.8022215, -0.03308795, 0, 0, 0, 1, 1,
1.29363, -0.8046861, 1.766146, 1, 1, 1, 1, 1,
1.308504, 1.192325, -0.001866847, 1, 1, 1, 1, 1,
1.30929, -1.564768, 3.453649, 1, 1, 1, 1, 1,
1.311759, -0.2126028, 3.963478, 1, 1, 1, 1, 1,
1.323733, 0.251236, 0.2855154, 1, 1, 1, 1, 1,
1.325966, 0.3140143, 0.858402, 1, 1, 1, 1, 1,
1.329264, 0.4001515, 1.81737, 1, 1, 1, 1, 1,
1.339356, 0.1387345, 3.220962, 1, 1, 1, 1, 1,
1.345487, 1.351278, 0.007705483, 1, 1, 1, 1, 1,
1.345772, 0.6602869, -0.02499886, 1, 1, 1, 1, 1,
1.346429, 2.676428, 1.628846, 1, 1, 1, 1, 1,
1.355413, -0.342916, 0.9751409, 1, 1, 1, 1, 1,
1.360272, 0.5640732, 1.683405, 1, 1, 1, 1, 1,
1.370149, -0.2836251, 3.002212, 1, 1, 1, 1, 1,
1.373697, 0.817513, 1.160623, 1, 1, 1, 1, 1,
1.374654, -0.06974105, 3.437865, 0, 0, 1, 1, 1,
1.375751, 1.527666, 0.517095, 1, 0, 0, 1, 1,
1.393264, -0.01823442, 0.8004038, 1, 0, 0, 1, 1,
1.400641, 0.3866242, 0.4794421, 1, 0, 0, 1, 1,
1.40084, 0.6594334, 1.18832, 1, 0, 0, 1, 1,
1.400908, -0.5638617, 0.955595, 1, 0, 0, 1, 1,
1.401183, -0.5784981, 2.051137, 0, 0, 0, 1, 1,
1.406767, 1.064498, 1.019531, 0, 0, 0, 1, 1,
1.420887, 0.1914213, 1.631418, 0, 0, 0, 1, 1,
1.429479, 0.7442343, 2.46763, 0, 0, 0, 1, 1,
1.430368, 0.8936709, 0.513385, 0, 0, 0, 1, 1,
1.441447, 1.908171, 1.903181, 0, 0, 0, 1, 1,
1.446265, 0.02445198, 3.002865, 0, 0, 0, 1, 1,
1.460544, -0.7727184, 2.540633, 1, 1, 1, 1, 1,
1.465375, -0.3956805, 3.456335, 1, 1, 1, 1, 1,
1.474088, -0.5006411, 0.9693519, 1, 1, 1, 1, 1,
1.47895, -0.4925548, 1.763103, 1, 1, 1, 1, 1,
1.485198, -0.933496, 2.556689, 1, 1, 1, 1, 1,
1.485836, 1.167303, 0.6239557, 1, 1, 1, 1, 1,
1.501258, 0.5544809, 1.717271, 1, 1, 1, 1, 1,
1.503359, 0.8759761, 0.9596587, 1, 1, 1, 1, 1,
1.514859, 1.484551, 0.3950486, 1, 1, 1, 1, 1,
1.515203, 1.392235, 2.500932, 1, 1, 1, 1, 1,
1.517391, 0.6666653, 1.412267, 1, 1, 1, 1, 1,
1.523583, -1.764856, 1.621431, 1, 1, 1, 1, 1,
1.527738, -0.0436512, 1.30141, 1, 1, 1, 1, 1,
1.52865, -2.316964, 2.633709, 1, 1, 1, 1, 1,
1.529071, 0.2867812, 0.8005824, 1, 1, 1, 1, 1,
1.538413, 0.970027, -0.4991096, 0, 0, 1, 1, 1,
1.585191, 0.5743952, 0.9631551, 1, 0, 0, 1, 1,
1.590689, 0.02445957, -0.6470566, 1, 0, 0, 1, 1,
1.592942, 0.6259848, 0.6103755, 1, 0, 0, 1, 1,
1.605571, -0.5706388, 2.258215, 1, 0, 0, 1, 1,
1.608677, -1.669439, 1.638547, 1, 0, 0, 1, 1,
1.62022, -2.606574, 3.904408, 0, 0, 0, 1, 1,
1.636706, -0.6203339, 2.080996, 0, 0, 0, 1, 1,
1.68143, 0.650074, 2.428791, 0, 0, 0, 1, 1,
1.68952, -1.033523, 3.156747, 0, 0, 0, 1, 1,
1.704044, -1.434001, 2.838586, 0, 0, 0, 1, 1,
1.735153, -0.4559481, 0.0835999, 0, 0, 0, 1, 1,
1.752746, 0.5243651, 1.554794, 0, 0, 0, 1, 1,
1.775807, -0.0615213, 1.153447, 1, 1, 1, 1, 1,
1.781404, 1.404268, -0.5136734, 1, 1, 1, 1, 1,
1.811939, -0.3592093, 3.551808, 1, 1, 1, 1, 1,
1.820642, -0.214963, 1.058797, 1, 1, 1, 1, 1,
1.824005, -0.7536049, 0.4238974, 1, 1, 1, 1, 1,
1.827137, 1.287502, 1.695415, 1, 1, 1, 1, 1,
1.844051, 0.8063056, 1.878932, 1, 1, 1, 1, 1,
1.882139, -0.3228808, 2.079623, 1, 1, 1, 1, 1,
1.887601, -0.5551084, 1.482362, 1, 1, 1, 1, 1,
1.891382, -0.9514091, 2.453893, 1, 1, 1, 1, 1,
1.896668, -0.7252763, 1.530648, 1, 1, 1, 1, 1,
1.909003, 0.1472882, 0.8589796, 1, 1, 1, 1, 1,
1.909343, -0.8195002, 0.9792411, 1, 1, 1, 1, 1,
1.922419, -0.08231956, 1.581756, 1, 1, 1, 1, 1,
1.952583, 0.5167984, 0.99884, 1, 1, 1, 1, 1,
1.977824, 1.517596, 1.167313, 0, 0, 1, 1, 1,
1.977919, -1.128123, 2.371168, 1, 0, 0, 1, 1,
1.978386, -0.750487, 0.6732944, 1, 0, 0, 1, 1,
2.119673, -1.883797, 1.854579, 1, 0, 0, 1, 1,
2.120629, 0.5188925, 1.382344, 1, 0, 0, 1, 1,
2.137138, 0.4855174, 2.316404, 1, 0, 0, 1, 1,
2.147969, -1.018979, 3.133111, 0, 0, 0, 1, 1,
2.152287, 1.800387, 0.4928856, 0, 0, 0, 1, 1,
2.204564, -0.1368092, 2.625108, 0, 0, 0, 1, 1,
2.257184, -2.596394, 2.127645, 0, 0, 0, 1, 1,
2.306754, 0.2508002, 0.6905667, 0, 0, 0, 1, 1,
2.386815, 0.08441103, 1.817834, 0, 0, 0, 1, 1,
2.39466, 0.5274757, 3.002056, 0, 0, 0, 1, 1,
2.44724, 0.07394993, -0.256527, 1, 1, 1, 1, 1,
2.503075, -2.400978e-06, -0.7935166, 1, 1, 1, 1, 1,
2.540209, 1.825538, 1.567407, 1, 1, 1, 1, 1,
2.572564, 0.7126988, -0.2173244, 1, 1, 1, 1, 1,
2.692649, 0.9739831, 1.016879, 1, 1, 1, 1, 1,
2.719155, 0.1048373, 1.367456, 1, 1, 1, 1, 1,
2.966044, 0.1575639, 0.9394333, 1, 1, 1, 1, 1
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
var radius = 9.398692;
var distance = 33.01251;
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
mvMatrix.translate( 0.1179574, 0.1157598, -0.03618193 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.01251);
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
