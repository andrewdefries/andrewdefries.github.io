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
-3.203219, -0.8227495, -2.015043, 1, 0, 0, 1,
-2.97511, 0.9800377, 1.452741, 1, 0.007843138, 0, 1,
-2.734522, -0.8683627, -1.691791, 1, 0.01176471, 0, 1,
-2.577151, 0.8962288, -1.642773, 1, 0.01960784, 0, 1,
-2.551882, -1.052406, -2.555432, 1, 0.02352941, 0, 1,
-2.514747, -0.5775847, -2.169684, 1, 0.03137255, 0, 1,
-2.306026, -1.175088, -3.059133, 1, 0.03529412, 0, 1,
-2.210208, -2.087085, -1.943941, 1, 0.04313726, 0, 1,
-2.174073, 0.6370335, -1.916047, 1, 0.04705882, 0, 1,
-2.115185, 1.496075, -1.5578, 1, 0.05490196, 0, 1,
-2.104035, -0.6681298, -1.132274, 1, 0.05882353, 0, 1,
-2.080997, -0.326309, -4.78191, 1, 0.06666667, 0, 1,
-2.073792, 1.52725, 0.003387204, 1, 0.07058824, 0, 1,
-2.034404, 0.2904761, -0.3254216, 1, 0.07843138, 0, 1,
-2.028045, -0.008020174, -2.023049, 1, 0.08235294, 0, 1,
-1.973893, 3.153454, -0.9565223, 1, 0.09019608, 0, 1,
-1.971192, -1.392272, -1.52495, 1, 0.09411765, 0, 1,
-1.967212, 0.5364408, -1.403967, 1, 0.1019608, 0, 1,
-1.929731, 1.533239, 0.3296691, 1, 0.1098039, 0, 1,
-1.927454, 1.319047, -1.355852, 1, 0.1137255, 0, 1,
-1.919145, -0.09367151, -0.8689727, 1, 0.1215686, 0, 1,
-1.912891, 0.2635071, -1.682736, 1, 0.1254902, 0, 1,
-1.904914, 1.533424, -2.039431, 1, 0.1333333, 0, 1,
-1.893025, -0.2191932, -1.865289, 1, 0.1372549, 0, 1,
-1.888463, -1.058675, -1.127609, 1, 0.145098, 0, 1,
-1.883112, 0.3154486, -2.328079, 1, 0.1490196, 0, 1,
-1.833866, -0.7971757, -3.027729, 1, 0.1568628, 0, 1,
-1.795495, -1.24532, -2.24357, 1, 0.1607843, 0, 1,
-1.788502, -1.123697, -2.862378, 1, 0.1686275, 0, 1,
-1.786566, -1.459493, -2.23214, 1, 0.172549, 0, 1,
-1.782592, -0.2865505, -2.75673, 1, 0.1803922, 0, 1,
-1.772623, 1.05616, -1.54264, 1, 0.1843137, 0, 1,
-1.760043, -0.5847742, -3.122271, 1, 0.1921569, 0, 1,
-1.752755, -0.6647358, -1.713098, 1, 0.1960784, 0, 1,
-1.743611, 1.424336, -1.770438, 1, 0.2039216, 0, 1,
-1.718536, 0.2702504, 0.0009163555, 1, 0.2117647, 0, 1,
-1.714152, -0.382096, -1.276776, 1, 0.2156863, 0, 1,
-1.706615, -0.01287948, -0.9520366, 1, 0.2235294, 0, 1,
-1.698841, -1.191366, 0.04898369, 1, 0.227451, 0, 1,
-1.685461, 0.1779917, -0.9525987, 1, 0.2352941, 0, 1,
-1.670335, -0.284189, -3.404802, 1, 0.2392157, 0, 1,
-1.655184, -1.346618, -1.689238, 1, 0.2470588, 0, 1,
-1.651949, 1.663904, -0.6874207, 1, 0.2509804, 0, 1,
-1.647954, 0.7681977, -1.018324, 1, 0.2588235, 0, 1,
-1.609667, -0.2985036, -1.826455, 1, 0.2627451, 0, 1,
-1.608323, 1.083168, -1.647995, 1, 0.2705882, 0, 1,
-1.598241, 0.1004869, -1.870261, 1, 0.2745098, 0, 1,
-1.59436, -0.3613815, -1.717405, 1, 0.282353, 0, 1,
-1.588192, -0.3950269, -1.416133, 1, 0.2862745, 0, 1,
-1.577784, -0.2398005, -0.8173969, 1, 0.2941177, 0, 1,
-1.569988, 1.445412, -0.8010363, 1, 0.3019608, 0, 1,
-1.548169, -0.2580131, -2.756188, 1, 0.3058824, 0, 1,
-1.532918, 0.2252402, -0.8188436, 1, 0.3137255, 0, 1,
-1.53037, -0.8402786, -1.44113, 1, 0.3176471, 0, 1,
-1.525717, -0.4284232, -0.9036879, 1, 0.3254902, 0, 1,
-1.52272, -0.4716934, -2.062378, 1, 0.3294118, 0, 1,
-1.521678, 0.480736, -3.535739, 1, 0.3372549, 0, 1,
-1.509783, -0.4656051, -2.11286, 1, 0.3411765, 0, 1,
-1.496701, -0.3365589, -1.897021, 1, 0.3490196, 0, 1,
-1.494596, -0.6797745, 0.3823204, 1, 0.3529412, 0, 1,
-1.49332, 0.4491124, -1.796206, 1, 0.3607843, 0, 1,
-1.489819, 0.3166458, -4.397444, 1, 0.3647059, 0, 1,
-1.478263, -0.1016499, -2.388817, 1, 0.372549, 0, 1,
-1.47788, 0.3854309, -0.6397551, 1, 0.3764706, 0, 1,
-1.476842, 1.436409, -1.919301, 1, 0.3843137, 0, 1,
-1.465692, 0.798026, -1.378763, 1, 0.3882353, 0, 1,
-1.46516, 1.323827, -1.58106, 1, 0.3960784, 0, 1,
-1.461357, -1.369815, -1.751117, 1, 0.4039216, 0, 1,
-1.456346, -2.042613, -1.742332, 1, 0.4078431, 0, 1,
-1.451227, 0.5581782, -0.9432241, 1, 0.4156863, 0, 1,
-1.442223, -0.4789679, -1.758572, 1, 0.4196078, 0, 1,
-1.439489, -0.4729582, -2.55951, 1, 0.427451, 0, 1,
-1.409745, 1.587955, -1.44794, 1, 0.4313726, 0, 1,
-1.407224, 0.6093723, -2.777049, 1, 0.4392157, 0, 1,
-1.398184, 0.2153832, -2.557291, 1, 0.4431373, 0, 1,
-1.392348, -0.426951, -2.695086, 1, 0.4509804, 0, 1,
-1.377081, -1.458155, -2.201742, 1, 0.454902, 0, 1,
-1.372156, -1.29417, -1.685159, 1, 0.4627451, 0, 1,
-1.371175, 1.306922, -1.204081, 1, 0.4666667, 0, 1,
-1.360085, 0.0352753, 0.7444679, 1, 0.4745098, 0, 1,
-1.359235, -0.7220906, -2.474757, 1, 0.4784314, 0, 1,
-1.352508, -1.570304, -2.656769, 1, 0.4862745, 0, 1,
-1.336345, -0.1707483, -2.527648, 1, 0.4901961, 0, 1,
-1.331336, -1.342891, -1.539064, 1, 0.4980392, 0, 1,
-1.330482, -0.2805323, -1.102821, 1, 0.5058824, 0, 1,
-1.328255, -0.601879, -1.171003, 1, 0.509804, 0, 1,
-1.32554, -0.7411278, -1.123152, 1, 0.5176471, 0, 1,
-1.32419, -1.217458, -1.458244, 1, 0.5215687, 0, 1,
-1.318444, 0.9511315, -0.5276932, 1, 0.5294118, 0, 1,
-1.316062, -0.2915507, -1.644948, 1, 0.5333334, 0, 1,
-1.312014, 0.3638428, -1.684801, 1, 0.5411765, 0, 1,
-1.310728, -0.7501373, -2.875529, 1, 0.5450981, 0, 1,
-1.307977, 1.522376, 0.177393, 1, 0.5529412, 0, 1,
-1.307526, -1.508242, -2.430291, 1, 0.5568628, 0, 1,
-1.305589, 0.09128426, -3.225803, 1, 0.5647059, 0, 1,
-1.305024, -0.2235205, -3.073729, 1, 0.5686275, 0, 1,
-1.304303, 0.8215707, -2.066716, 1, 0.5764706, 0, 1,
-1.285721, 0.1158464, -0.8584475, 1, 0.5803922, 0, 1,
-1.276342, 0.1670033, -1.383318, 1, 0.5882353, 0, 1,
-1.27618, -0.2472844, -1.539855, 1, 0.5921569, 0, 1,
-1.263117, 0.5001578, -1.054985, 1, 0.6, 0, 1,
-1.261237, 1.104571, -1.376029, 1, 0.6078432, 0, 1,
-1.257488, 0.9228088, 0.330608, 1, 0.6117647, 0, 1,
-1.255719, 0.9555149, -1.937523, 1, 0.6196079, 0, 1,
-1.23533, -0.2927767, -2.191326, 1, 0.6235294, 0, 1,
-1.223083, 0.5111171, -1.185863, 1, 0.6313726, 0, 1,
-1.220258, 0.7233658, -1.103275, 1, 0.6352941, 0, 1,
-1.209822, 1.351426, -1.344965, 1, 0.6431373, 0, 1,
-1.205347, -0.3666417, -1.283688, 1, 0.6470588, 0, 1,
-1.204734, 0.06574215, -0.6853682, 1, 0.654902, 0, 1,
-1.203465, -0.464381, -1.606658, 1, 0.6588235, 0, 1,
-1.174135, 1.197754, -1.880605, 1, 0.6666667, 0, 1,
-1.17384, -0.746643, -2.581769, 1, 0.6705883, 0, 1,
-1.171829, -0.1640855, -3.943002, 1, 0.6784314, 0, 1,
-1.15424, 1.133074, -2.187057, 1, 0.682353, 0, 1,
-1.149729, -1.661171, -0.9597647, 1, 0.6901961, 0, 1,
-1.149023, 0.4551826, -0.8660963, 1, 0.6941177, 0, 1,
-1.145951, 0.3816664, -0.1425837, 1, 0.7019608, 0, 1,
-1.131825, -0.5323272, -0.8518972, 1, 0.7098039, 0, 1,
-1.129761, -0.5973209, -0.9626877, 1, 0.7137255, 0, 1,
-1.127808, 0.700213, -1.288674, 1, 0.7215686, 0, 1,
-1.120738, 1.012955, -1.174291, 1, 0.7254902, 0, 1,
-1.120654, -0.6016731, -2.303388, 1, 0.7333333, 0, 1,
-1.120161, 0.009355989, -3.088214, 1, 0.7372549, 0, 1,
-1.11828, 0.4363093, -1.921501, 1, 0.7450981, 0, 1,
-1.100818, -0.00170739, -1.708126, 1, 0.7490196, 0, 1,
-1.084903, 1.348516, -0.9986926, 1, 0.7568628, 0, 1,
-1.077747, -0.5821835, -1.122668, 1, 0.7607843, 0, 1,
-1.076135, -0.1882958, -0.3684719, 1, 0.7686275, 0, 1,
-1.069773, 0.8033988, -1.586171, 1, 0.772549, 0, 1,
-1.053673, -0.4668535, -2.267268, 1, 0.7803922, 0, 1,
-1.04804, -0.9793864, -2.993926, 1, 0.7843137, 0, 1,
-1.044929, 0.961073, -0.5961431, 1, 0.7921569, 0, 1,
-1.041576, 0.7032629, -0.3033097, 1, 0.7960784, 0, 1,
-1.03868, -2.312042, -3.347364, 1, 0.8039216, 0, 1,
-1.037723, 0.5718088, -1.50167, 1, 0.8117647, 0, 1,
-1.033872, 1.027844, 0.7793477, 1, 0.8156863, 0, 1,
-1.03363, -0.2768307, -2.809102, 1, 0.8235294, 0, 1,
-1.031642, 1.162084, -0.8573944, 1, 0.827451, 0, 1,
-1.029673, 0.2319741, -0.8023205, 1, 0.8352941, 0, 1,
-1.02927, 2.340716, -3.159491, 1, 0.8392157, 0, 1,
-1.028811, -0.3711914, -4.172116, 1, 0.8470588, 0, 1,
-1.02462, 0.8165981, -0.2746122, 1, 0.8509804, 0, 1,
-1.020553, 0.5611161, -1.442447, 1, 0.8588235, 0, 1,
-1.012725, -0.1330344, -0.3315007, 1, 0.8627451, 0, 1,
-1.012201, 0.8467003, 1.05902, 1, 0.8705882, 0, 1,
-1.012146, -0.5882202, -1.960515, 1, 0.8745098, 0, 1,
-1.010956, 0.4743606, -1.287158, 1, 0.8823529, 0, 1,
-0.9986215, -0.6058961, -1.826798, 1, 0.8862745, 0, 1,
-0.9848846, -0.5908884, -0.4048045, 1, 0.8941177, 0, 1,
-0.9673474, 0.5026787, -1.256849, 1, 0.8980392, 0, 1,
-0.9660794, 0.2084154, -1.451926, 1, 0.9058824, 0, 1,
-0.9622916, -1.328056, -3.968266, 1, 0.9137255, 0, 1,
-0.9554122, -0.5327539, -1.730335, 1, 0.9176471, 0, 1,
-0.9376079, -0.2349052, -1.957446, 1, 0.9254902, 0, 1,
-0.9354175, -0.4881386, -1.723141, 1, 0.9294118, 0, 1,
-0.9304752, 1.356091, -2.067307, 1, 0.9372549, 0, 1,
-0.9225863, -0.3834193, -0.607763, 1, 0.9411765, 0, 1,
-0.9161354, -0.2369384, -1.745068, 1, 0.9490196, 0, 1,
-0.911343, -1.864154, -2.895478, 1, 0.9529412, 0, 1,
-0.9090893, 0.7097065, -0.9492007, 1, 0.9607843, 0, 1,
-0.8971055, -0.3929666, -0.4996415, 1, 0.9647059, 0, 1,
-0.8911825, -1.503068, -2.811436, 1, 0.972549, 0, 1,
-0.8796917, -0.1419434, -3.249904, 1, 0.9764706, 0, 1,
-0.8784582, 0.08926798, -2.239675, 1, 0.9843137, 0, 1,
-0.8653613, 0.4128119, -3.120942, 1, 0.9882353, 0, 1,
-0.8653165, -1.069106, -2.425609, 1, 0.9960784, 0, 1,
-0.848788, -1.258355, -3.272887, 0.9960784, 1, 0, 1,
-0.8460034, -0.3770426, -2.912592, 0.9921569, 1, 0, 1,
-0.8411896, -0.786291, -1.582452, 0.9843137, 1, 0, 1,
-0.8406605, -0.2250456, -0.6124187, 0.9803922, 1, 0, 1,
-0.8382219, -1.167559, -1.732292, 0.972549, 1, 0, 1,
-0.8376287, 0.9721077, -0.1912446, 0.9686275, 1, 0, 1,
-0.8361278, 0.0924058, -2.455823, 0.9607843, 1, 0, 1,
-0.8268608, -2.321292, -3.074805, 0.9568627, 1, 0, 1,
-0.8263347, 0.06620852, -1.260184, 0.9490196, 1, 0, 1,
-0.8253867, -0.6096058, -2.657284, 0.945098, 1, 0, 1,
-0.814241, 0.6015962, -2.064316, 0.9372549, 1, 0, 1,
-0.811635, 1.060891, -1.343679, 0.9333333, 1, 0, 1,
-0.8103724, 0.3178283, -0.4465501, 0.9254902, 1, 0, 1,
-0.8093204, -0.9023556, -5.594485, 0.9215686, 1, 0, 1,
-0.8082192, -0.4089752, -3.193272, 0.9137255, 1, 0, 1,
-0.8074434, -0.5536914, -0.2544807, 0.9098039, 1, 0, 1,
-0.8038708, 0.7994926, -0.6213657, 0.9019608, 1, 0, 1,
-0.8027727, 1.786947, 1.478799, 0.8941177, 1, 0, 1,
-0.8018181, 0.2789658, -1.284817, 0.8901961, 1, 0, 1,
-0.7982643, 0.5686181, -1.775741, 0.8823529, 1, 0, 1,
-0.7900068, -0.1110964, -0.1491812, 0.8784314, 1, 0, 1,
-0.7866991, -0.8742471, -4.391436, 0.8705882, 1, 0, 1,
-0.7847529, -2.144675, -2.608513, 0.8666667, 1, 0, 1,
-0.7819508, -0.1480668, -0.9983541, 0.8588235, 1, 0, 1,
-0.7780293, 1.01601, -0.3532862, 0.854902, 1, 0, 1,
-0.7747241, 1.782659, -0.1156066, 0.8470588, 1, 0, 1,
-0.7735107, -1.710837, -3.646336, 0.8431373, 1, 0, 1,
-0.7729802, 1.275338, 1.306415, 0.8352941, 1, 0, 1,
-0.7709706, -0.9104198, -1.31473, 0.8313726, 1, 0, 1,
-0.7695011, -0.7621942, -2.059628, 0.8235294, 1, 0, 1,
-0.7684854, 0.6020451, -0.841374, 0.8196079, 1, 0, 1,
-0.7544423, -1.417861, -2.694553, 0.8117647, 1, 0, 1,
-0.7526561, -0.7887273, -1.548332, 0.8078431, 1, 0, 1,
-0.748144, -0.5914559, -3.095796, 0.8, 1, 0, 1,
-0.7479931, 0.7090114, -0.107708, 0.7921569, 1, 0, 1,
-0.7464396, -1.184333, -2.868095, 0.7882353, 1, 0, 1,
-0.7461238, 0.9988954, -0.1666322, 0.7803922, 1, 0, 1,
-0.7429424, -0.2107415, -2.749531, 0.7764706, 1, 0, 1,
-0.7380684, 0.7416527, 0.1049758, 0.7686275, 1, 0, 1,
-0.7362345, -0.5249012, -1.095553, 0.7647059, 1, 0, 1,
-0.7316865, 0.5842317, -2.600594, 0.7568628, 1, 0, 1,
-0.7279786, -0.8580745, -1.990231, 0.7529412, 1, 0, 1,
-0.7176112, 1.289448, 0.2247634, 0.7450981, 1, 0, 1,
-0.7172856, 0.2738538, -0.5028259, 0.7411765, 1, 0, 1,
-0.7165696, -0.09344754, -1.975941, 0.7333333, 1, 0, 1,
-0.7161225, -0.2931565, -0.8459929, 0.7294118, 1, 0, 1,
-0.7105765, 1.052378, -1.026557, 0.7215686, 1, 0, 1,
-0.7099882, -0.8595651, -2.520202, 0.7176471, 1, 0, 1,
-0.7082086, -0.1483694, -2.277034, 0.7098039, 1, 0, 1,
-0.7038023, 0.3088294, -1.860178, 0.7058824, 1, 0, 1,
-0.693913, -0.9726646, -1.779115, 0.6980392, 1, 0, 1,
-0.6920489, -1.25288, -2.883649, 0.6901961, 1, 0, 1,
-0.6759983, -0.3857285, -2.624026, 0.6862745, 1, 0, 1,
-0.6748919, 1.396526, -0.5085048, 0.6784314, 1, 0, 1,
-0.6702422, 0.3459542, -1.065191, 0.6745098, 1, 0, 1,
-0.6700598, 0.5433817, -1.29759, 0.6666667, 1, 0, 1,
-0.6686, -1.378206, -2.493212, 0.6627451, 1, 0, 1,
-0.6648418, 0.9159297, -1.570144, 0.654902, 1, 0, 1,
-0.6634439, -1.570772, -2.264431, 0.6509804, 1, 0, 1,
-0.662218, -0.9491538, -3.382003, 0.6431373, 1, 0, 1,
-0.659325, 1.336643, -0.5282841, 0.6392157, 1, 0, 1,
-0.6591579, 0.4267105, -1.490655, 0.6313726, 1, 0, 1,
-0.6583416, -0.4712244, -2.324338, 0.627451, 1, 0, 1,
-0.6583117, 1.700951, -1.341251, 0.6196079, 1, 0, 1,
-0.6578342, 0.2621799, -4.102036, 0.6156863, 1, 0, 1,
-0.6547711, -0.474399, -1.645, 0.6078432, 1, 0, 1,
-0.6527088, 0.3768636, -2.429733, 0.6039216, 1, 0, 1,
-0.6490357, -0.1055738, -2.174321, 0.5960785, 1, 0, 1,
-0.6483436, 0.4427008, -1.473173, 0.5882353, 1, 0, 1,
-0.6458903, 0.2624688, -2.114257, 0.5843138, 1, 0, 1,
-0.6445274, 0.0890332, -3.219521, 0.5764706, 1, 0, 1,
-0.6426274, -0.4070828, -1.701496, 0.572549, 1, 0, 1,
-0.6424255, 1.177228, 0.8563181, 0.5647059, 1, 0, 1,
-0.6420179, -0.315485, -1.832885, 0.5607843, 1, 0, 1,
-0.6328556, -0.3806709, -1.587777, 0.5529412, 1, 0, 1,
-0.6291981, -1.098379, -2.526755, 0.5490196, 1, 0, 1,
-0.6223468, -2.512267, -2.324417, 0.5411765, 1, 0, 1,
-0.6193831, -1.789065, -2.093129, 0.5372549, 1, 0, 1,
-0.616355, -0.2463334, -1.295226, 0.5294118, 1, 0, 1,
-0.6142376, -0.2252922, -3.340385, 0.5254902, 1, 0, 1,
-0.6118068, 0.5086956, 0.01725811, 0.5176471, 1, 0, 1,
-0.6055633, -0.2742308, -3.022166, 0.5137255, 1, 0, 1,
-0.5987583, 2.154557, -0.09275877, 0.5058824, 1, 0, 1,
-0.5964519, -0.0002899941, -2.153014, 0.5019608, 1, 0, 1,
-0.5958896, -0.6762102, -1.788265, 0.4941176, 1, 0, 1,
-0.5944535, -1.515725, -3.239223, 0.4862745, 1, 0, 1,
-0.5863032, 0.03246531, -2.830109, 0.4823529, 1, 0, 1,
-0.584392, -0.3406079, -1.079581, 0.4745098, 1, 0, 1,
-0.5781219, 1.465463, -2.167794, 0.4705882, 1, 0, 1,
-0.5764077, 1.139686, -1.662384, 0.4627451, 1, 0, 1,
-0.5683494, 0.8784064, 1.171683, 0.4588235, 1, 0, 1,
-0.5679449, 0.3580367, -1.626158, 0.4509804, 1, 0, 1,
-0.5633394, 0.4336008, -1.384348, 0.4470588, 1, 0, 1,
-0.5610036, 0.4172547, 0.6535199, 0.4392157, 1, 0, 1,
-0.5551727, -0.4427749, 0.1741331, 0.4352941, 1, 0, 1,
-0.5549971, 1.642376, -0.2235073, 0.427451, 1, 0, 1,
-0.5518045, 0.1977036, -0.9966457, 0.4235294, 1, 0, 1,
-0.5434331, -0.5138494, -3.589364, 0.4156863, 1, 0, 1,
-0.5407748, 0.5425934, -0.8561445, 0.4117647, 1, 0, 1,
-0.5376931, -1.743259, -2.180911, 0.4039216, 1, 0, 1,
-0.5375153, -0.7225163, -0.967414, 0.3960784, 1, 0, 1,
-0.5284036, -0.09552461, -2.882258, 0.3921569, 1, 0, 1,
-0.5280498, -0.07911627, -1.79255, 0.3843137, 1, 0, 1,
-0.5212345, 2.480674, 0.2334959, 0.3803922, 1, 0, 1,
-0.5199747, 0.1689916, -1.79353, 0.372549, 1, 0, 1,
-0.5165411, 0.772836, -1.104701, 0.3686275, 1, 0, 1,
-0.5130559, 0.7981024, 0.2815014, 0.3607843, 1, 0, 1,
-0.5108843, 0.3744952, -2.698861, 0.3568628, 1, 0, 1,
-0.5087609, -0.6675382, -2.595048, 0.3490196, 1, 0, 1,
-0.5072885, -0.7908112, -1.61476, 0.345098, 1, 0, 1,
-0.5032249, -0.2233597, -2.024088, 0.3372549, 1, 0, 1,
-0.499334, 0.9325187, -1.358896, 0.3333333, 1, 0, 1,
-0.4976625, -1.453245, -2.72618, 0.3254902, 1, 0, 1,
-0.4961673, -0.5840284, -2.823207, 0.3215686, 1, 0, 1,
-0.4847995, 1.169384, 0.8381743, 0.3137255, 1, 0, 1,
-0.4829929, 0.4877121, 1.165454, 0.3098039, 1, 0, 1,
-0.4773657, -0.6600933, -3.349934, 0.3019608, 1, 0, 1,
-0.474373, 1.245019, 0.1688795, 0.2941177, 1, 0, 1,
-0.4696626, -1.039408, -3.589469, 0.2901961, 1, 0, 1,
-0.4683021, -1.092361, -3.412, 0.282353, 1, 0, 1,
-0.4667536, 0.5344027, 0.03100278, 0.2784314, 1, 0, 1,
-0.4665093, -0.4808927, -3.894558, 0.2705882, 1, 0, 1,
-0.4643061, -1.12387, -3.78715, 0.2666667, 1, 0, 1,
-0.4573018, 0.07103335, 0.2868003, 0.2588235, 1, 0, 1,
-0.4544195, -1.687037, -1.187742, 0.254902, 1, 0, 1,
-0.4491158, -0.8466699, -6.179772, 0.2470588, 1, 0, 1,
-0.4488181, -0.9742976, -4.055194, 0.2431373, 1, 0, 1,
-0.4463195, -2.297886, -3.507049, 0.2352941, 1, 0, 1,
-0.445451, -0.851999, -3.97864, 0.2313726, 1, 0, 1,
-0.4452781, 1.419895, -0.4928334, 0.2235294, 1, 0, 1,
-0.4404761, 0.06339248, -1.05818, 0.2196078, 1, 0, 1,
-0.4386396, -0.6256281, -3.172734, 0.2117647, 1, 0, 1,
-0.4364771, 0.06451718, -0.6605374, 0.2078431, 1, 0, 1,
-0.4319223, 0.6097882, -1.189457, 0.2, 1, 0, 1,
-0.4315322, 0.2746463, -1.132027, 0.1921569, 1, 0, 1,
-0.4303074, -1.165393, -1.772774, 0.1882353, 1, 0, 1,
-0.4293216, -0.7232531, -2.608623, 0.1803922, 1, 0, 1,
-0.4252728, -0.2441966, -0.9441076, 0.1764706, 1, 0, 1,
-0.4200484, -1.62648, -1.451789, 0.1686275, 1, 0, 1,
-0.4125426, 0.2361288, -0.2695572, 0.1647059, 1, 0, 1,
-0.4084888, 0.7746648, -0.7396883, 0.1568628, 1, 0, 1,
-0.4076785, 0.6829749, -1.436208, 0.1529412, 1, 0, 1,
-0.406793, 1.524415, 0.9018044, 0.145098, 1, 0, 1,
-0.4062804, -0.01663556, -2.712546, 0.1411765, 1, 0, 1,
-0.4008673, -0.6678461, -3.670166, 0.1333333, 1, 0, 1,
-0.3985811, -0.2910024, -1.954702, 0.1294118, 1, 0, 1,
-0.3914876, -0.113515, -2.830165, 0.1215686, 1, 0, 1,
-0.3865657, 0.7778363, 0.07659593, 0.1176471, 1, 0, 1,
-0.3831134, 0.1438456, 0.3948255, 0.1098039, 1, 0, 1,
-0.3824699, -0.865102, -2.929011, 0.1058824, 1, 0, 1,
-0.3794565, 1.575505, 0.8248035, 0.09803922, 1, 0, 1,
-0.3792377, 0.5472246, 0.2221472, 0.09019608, 1, 0, 1,
-0.3789274, -0.4346572, -2.172545, 0.08627451, 1, 0, 1,
-0.3767503, -0.6515872, -1.913952, 0.07843138, 1, 0, 1,
-0.37421, -0.7481014, -2.373815, 0.07450981, 1, 0, 1,
-0.3731322, 0.2696056, 0.6041296, 0.06666667, 1, 0, 1,
-0.3728963, 1.946925, -1.134615, 0.0627451, 1, 0, 1,
-0.3720097, -0.3426257, -3.417162, 0.05490196, 1, 0, 1,
-0.3716206, -0.7055311, -3.675766, 0.05098039, 1, 0, 1,
-0.3707902, 0.4603789, 0.62919, 0.04313726, 1, 0, 1,
-0.3664901, -1.384503, -0.9888105, 0.03921569, 1, 0, 1,
-0.3661138, -1.170515, -3.795672, 0.03137255, 1, 0, 1,
-0.3652858, -0.9772429, -0.1565022, 0.02745098, 1, 0, 1,
-0.3643737, -0.3164605, -2.874587, 0.01960784, 1, 0, 1,
-0.3629054, -0.4083815, -2.251174, 0.01568628, 1, 0, 1,
-0.3614509, -0.1619743, -2.022475, 0.007843138, 1, 0, 1,
-0.3529583, -0.4521447, -1.037637, 0.003921569, 1, 0, 1,
-0.350118, 1.555845, 0.05448107, 0, 1, 0.003921569, 1,
-0.3501101, 0.4610592, -0.9591177, 0, 1, 0.01176471, 1,
-0.3500257, 1.613522, 1.161465, 0, 1, 0.01568628, 1,
-0.3495753, -0.7361857, -4.453875, 0, 1, 0.02352941, 1,
-0.3355317, -0.571533, -3.156116, 0, 1, 0.02745098, 1,
-0.3232107, 0.411088, 0.248595, 0, 1, 0.03529412, 1,
-0.3228486, -1.350297, -1.262138, 0, 1, 0.03921569, 1,
-0.3182473, -0.03524368, -1.893878, 0, 1, 0.04705882, 1,
-0.317932, -0.231342, -3.080997, 0, 1, 0.05098039, 1,
-0.3140881, 1.302372, -2.192178, 0, 1, 0.05882353, 1,
-0.3108674, -1.284146, -4.607636, 0, 1, 0.0627451, 1,
-0.3105718, -0.04194502, -1.324855, 0, 1, 0.07058824, 1,
-0.3021714, 2.090441, -0.8074076, 0, 1, 0.07450981, 1,
-0.2997055, 2.380952, -0.1125039, 0, 1, 0.08235294, 1,
-0.2960751, 0.2208973, -0.1614038, 0, 1, 0.08627451, 1,
-0.2941061, -1.132454, -1.942639, 0, 1, 0.09411765, 1,
-0.2931941, -0.3146871, -2.814138, 0, 1, 0.1019608, 1,
-0.2905213, 0.2527886, -2.52734, 0, 1, 0.1058824, 1,
-0.2900613, -0.05014719, -1.409422, 0, 1, 0.1137255, 1,
-0.2877464, 0.01334399, -1.562737, 0, 1, 0.1176471, 1,
-0.2847475, -0.05909024, -2.772103, 0, 1, 0.1254902, 1,
-0.2820868, 0.851828, 0.7125932, 0, 1, 0.1294118, 1,
-0.2811022, -2.20428, -4.56142, 0, 1, 0.1372549, 1,
-0.2771059, -0.9187952, -2.361854, 0, 1, 0.1411765, 1,
-0.2748224, -1.914208, -2.677878, 0, 1, 0.1490196, 1,
-0.2730034, 1.706216, -2.617818, 0, 1, 0.1529412, 1,
-0.2721188, 0.3809642, -0.8726049, 0, 1, 0.1607843, 1,
-0.2715034, 0.9270999, -1.102608, 0, 1, 0.1647059, 1,
-0.2692104, 0.1264236, -1.007764, 0, 1, 0.172549, 1,
-0.2687132, 0.5245463, 0.2661541, 0, 1, 0.1764706, 1,
-0.2655392, -0.6395414, -2.968983, 0, 1, 0.1843137, 1,
-0.2609304, 1.072116, 1.660553, 0, 1, 0.1882353, 1,
-0.2602029, -0.3545295, -2.559804, 0, 1, 0.1960784, 1,
-0.260114, -0.3999571, -3.387471, 0, 1, 0.2039216, 1,
-0.256319, -0.2343634, -1.839963, 0, 1, 0.2078431, 1,
-0.2556718, -0.6056436, -4.462022, 0, 1, 0.2156863, 1,
-0.2501997, -0.9435415, -2.82803, 0, 1, 0.2196078, 1,
-0.2442959, -2.831193, -3.187683, 0, 1, 0.227451, 1,
-0.2408762, 0.5320509, -0.7598246, 0, 1, 0.2313726, 1,
-0.2390654, 0.04998215, -1.124957, 0, 1, 0.2392157, 1,
-0.2378798, -0.4438678, -1.556169, 0, 1, 0.2431373, 1,
-0.2367118, 0.0508729, -3.528616, 0, 1, 0.2509804, 1,
-0.2366626, 0.5989667, -1.208965, 0, 1, 0.254902, 1,
-0.2335383, -0.02466121, 0.1503729, 0, 1, 0.2627451, 1,
-0.2301034, -0.9352252, -2.576167, 0, 1, 0.2666667, 1,
-0.2280475, -0.6981266, -4.402396, 0, 1, 0.2745098, 1,
-0.2266982, -0.4103583, -3.976349, 0, 1, 0.2784314, 1,
-0.2263391, -1.434484, -4.034951, 0, 1, 0.2862745, 1,
-0.224673, -0.1001874, -0.5514683, 0, 1, 0.2901961, 1,
-0.2215623, 2.993509, 0.5915917, 0, 1, 0.2980392, 1,
-0.2205206, -1.147671, -3.775246, 0, 1, 0.3058824, 1,
-0.2201974, 0.2213884, -0.1881278, 0, 1, 0.3098039, 1,
-0.2180143, 0.2486337, 0.2420729, 0, 1, 0.3176471, 1,
-0.2172198, -0.159844, -1.211051, 0, 1, 0.3215686, 1,
-0.2164601, -0.8239838, -2.009505, 0, 1, 0.3294118, 1,
-0.2161291, -0.9123765, -3.427749, 0, 1, 0.3333333, 1,
-0.2157057, -0.660543, -3.93366, 0, 1, 0.3411765, 1,
-0.2108852, -2.34938, -4.805189, 0, 1, 0.345098, 1,
-0.2073065, 0.04345334, -0.8054692, 0, 1, 0.3529412, 1,
-0.2056587, 1.056742, -1.489526, 0, 1, 0.3568628, 1,
-0.2010091, 2.317698, -0.3557805, 0, 1, 0.3647059, 1,
-0.2009832, -2.015186, -0.1300293, 0, 1, 0.3686275, 1,
-0.1977318, 0.4590665, -0.951281, 0, 1, 0.3764706, 1,
-0.1962655, -1.224371, -3.055055, 0, 1, 0.3803922, 1,
-0.1855897, -0.6255621, -3.239667, 0, 1, 0.3882353, 1,
-0.1848525, 0.8956616, 1.148075, 0, 1, 0.3921569, 1,
-0.1781315, 1.752888, -0.1042581, 0, 1, 0.4, 1,
-0.1737998, 0.0557634, -2.440089, 0, 1, 0.4078431, 1,
-0.1734145, -2.295413, -4.472152, 0, 1, 0.4117647, 1,
-0.1700845, -0.8344015, -2.398895, 0, 1, 0.4196078, 1,
-0.1626519, 0.3319565, -1.470736, 0, 1, 0.4235294, 1,
-0.1579396, -0.1352975, -3.515361, 0, 1, 0.4313726, 1,
-0.1565157, 0.3472862, -0.1626437, 0, 1, 0.4352941, 1,
-0.1563816, 0.5070359, -0.182385, 0, 1, 0.4431373, 1,
-0.1554151, -0.1259387, -1.828377, 0, 1, 0.4470588, 1,
-0.1525681, -0.9114574, -2.336117, 0, 1, 0.454902, 1,
-0.1494388, -1.023606, -2.89764, 0, 1, 0.4588235, 1,
-0.1463877, -0.797412, -3.633833, 0, 1, 0.4666667, 1,
-0.1430925, -0.1843121, -2.746957, 0, 1, 0.4705882, 1,
-0.1375135, -0.7711326, -2.908128, 0, 1, 0.4784314, 1,
-0.1366103, -0.4611286, -3.372409, 0, 1, 0.4823529, 1,
-0.1351391, -2.064383, -6.25154, 0, 1, 0.4901961, 1,
-0.1348428, -0.9648235, -2.22028, 0, 1, 0.4941176, 1,
-0.1325127, -0.386602, -3.689785, 0, 1, 0.5019608, 1,
-0.1299847, -1.547612, -1.214069, 0, 1, 0.509804, 1,
-0.12935, -1.28562, -4.441215, 0, 1, 0.5137255, 1,
-0.1289862, -0.2521401, -2.171567, 0, 1, 0.5215687, 1,
-0.1280107, 0.2867591, -1.079402, 0, 1, 0.5254902, 1,
-0.1264922, -1.658925, -2.240123, 0, 1, 0.5333334, 1,
-0.1244803, -2.251647, -3.58461, 0, 1, 0.5372549, 1,
-0.1225336, -0.5220261, -4.448966, 0, 1, 0.5450981, 1,
-0.1182383, 0.5039555, -0.5089031, 0, 1, 0.5490196, 1,
-0.1171856, -0.4706868, -4.084384, 0, 1, 0.5568628, 1,
-0.1143429, -0.3532591, -1.657466, 0, 1, 0.5607843, 1,
-0.1120155, -0.4201723, -2.956755, 0, 1, 0.5686275, 1,
-0.1100167, 0.1014522, 0.2658154, 0, 1, 0.572549, 1,
-0.1086617, 1.471514, -1.105583, 0, 1, 0.5803922, 1,
-0.1061908, 0.5157828, -0.4082936, 0, 1, 0.5843138, 1,
-0.1035232, 1.07229, -1.795438, 0, 1, 0.5921569, 1,
-0.10194, -0.2433288, -3.024945, 0, 1, 0.5960785, 1,
-0.09624214, -0.7113839, -3.633638, 0, 1, 0.6039216, 1,
-0.09599656, 0.054742, -0.7357389, 0, 1, 0.6117647, 1,
-0.09411648, 0.7602479, -1.63099, 0, 1, 0.6156863, 1,
-0.09109166, 0.3942555, -0.581972, 0, 1, 0.6235294, 1,
-0.07746842, 1.495426, 0.4592838, 0, 1, 0.627451, 1,
-0.07183197, -1.025277, -3.990188, 0, 1, 0.6352941, 1,
-0.06868025, 0.8184857, -0.1695087, 0, 1, 0.6392157, 1,
-0.06366495, -0.597114, -2.532219, 0, 1, 0.6470588, 1,
-0.06173356, -1.33369, -2.550027, 0, 1, 0.6509804, 1,
-0.05847537, -1.407981, -2.405902, 0, 1, 0.6588235, 1,
-0.05683662, 0.1707362, 0.8460597, 0, 1, 0.6627451, 1,
-0.05518197, -1.673975, -4.8899, 0, 1, 0.6705883, 1,
-0.05104152, 0.02005312, -1.274083, 0, 1, 0.6745098, 1,
-0.04900685, 1.079484, -0.899787, 0, 1, 0.682353, 1,
-0.04608558, -0.02534387, -4.662382, 0, 1, 0.6862745, 1,
-0.04154642, -0.7349796, -4.210981, 0, 1, 0.6941177, 1,
-0.04018451, 0.05605037, -0.6935367, 0, 1, 0.7019608, 1,
-0.03894299, 0.09674957, -0.1171016, 0, 1, 0.7058824, 1,
-0.03574358, 2.440049, 0.3726019, 0, 1, 0.7137255, 1,
-0.03524534, -0.267861, -2.908728, 0, 1, 0.7176471, 1,
-0.0348467, -0.6306003, -2.958414, 0, 1, 0.7254902, 1,
-0.0331533, -1.211266, -2.504628, 0, 1, 0.7294118, 1,
-0.02940479, 0.07306755, 0.1176159, 0, 1, 0.7372549, 1,
-0.02712149, 1.853416, 0.5070152, 0, 1, 0.7411765, 1,
-0.02302582, -0.7547331, -3.334473, 0, 1, 0.7490196, 1,
-0.02073816, -1.146163, -1.07656, 0, 1, 0.7529412, 1,
-0.020706, -1.073737, -3.312083, 0, 1, 0.7607843, 1,
-0.01906277, -1.041992, -3.515449, 0, 1, 0.7647059, 1,
-0.01883667, 0.3146366, -0.8677087, 0, 1, 0.772549, 1,
-0.01744324, -0.86366, -3.074474, 0, 1, 0.7764706, 1,
-0.01736705, -0.3274326, -2.352267, 0, 1, 0.7843137, 1,
-0.01532714, -0.4770955, -2.084514, 0, 1, 0.7882353, 1,
-0.01386142, 0.4206317, 0.4579986, 0, 1, 0.7960784, 1,
-0.0124276, 1.128654, 0.1628484, 0, 1, 0.8039216, 1,
-0.0107936, -1.495528, -4.197662, 0, 1, 0.8078431, 1,
-0.005252906, -0.5948991, -4.767134, 0, 1, 0.8156863, 1,
-0.001990619, -0.05063597, -3.407441, 0, 1, 0.8196079, 1,
0.001588351, -0.6303509, 3.311671, 0, 1, 0.827451, 1,
0.00333513, -0.8035681, 2.559837, 0, 1, 0.8313726, 1,
0.004259741, -1.103418, 3.874439, 0, 1, 0.8392157, 1,
0.00465226, -0.4156446, 1.26119, 0, 1, 0.8431373, 1,
0.01238495, -1.42093, 3.549492, 0, 1, 0.8509804, 1,
0.0188359, -1.192125, 2.308242, 0, 1, 0.854902, 1,
0.01906437, -0.3434708, 2.502883, 0, 1, 0.8627451, 1,
0.01925293, 0.5422528, -0.7251586, 0, 1, 0.8666667, 1,
0.01951658, -0.8658435, 3.851509, 0, 1, 0.8745098, 1,
0.02052002, -0.3859235, 2.027179, 0, 1, 0.8784314, 1,
0.02138728, 1.595953, 0.2962713, 0, 1, 0.8862745, 1,
0.02378857, 1.053009, 0.6169559, 0, 1, 0.8901961, 1,
0.02418697, 1.462618, -0.03374127, 0, 1, 0.8980392, 1,
0.02430542, 0.0469014, 0.4604381, 0, 1, 0.9058824, 1,
0.02603326, 0.3865736, 0.7245849, 0, 1, 0.9098039, 1,
0.02844183, 0.6456993, 0.4045103, 0, 1, 0.9176471, 1,
0.03025688, -0.3289286, 3.482404, 0, 1, 0.9215686, 1,
0.03028291, 0.385827, -0.06674621, 0, 1, 0.9294118, 1,
0.03262223, 0.6561702, 0.6083229, 0, 1, 0.9333333, 1,
0.03383328, -0.3806449, 0.03401077, 0, 1, 0.9411765, 1,
0.03793821, 0.07273655, 0.3775665, 0, 1, 0.945098, 1,
0.03894538, -2.047279, 4.155664, 0, 1, 0.9529412, 1,
0.04133329, -0.4027546, 3.806524, 0, 1, 0.9568627, 1,
0.04208181, 0.5134818, -0.04749197, 0, 1, 0.9647059, 1,
0.04459333, 0.2059944, 0.2856395, 0, 1, 0.9686275, 1,
0.04685439, -1.221052, 4.183624, 0, 1, 0.9764706, 1,
0.04840129, 0.04361916, 0.9707854, 0, 1, 0.9803922, 1,
0.0649989, 0.2744119, -0.2294688, 0, 1, 0.9882353, 1,
0.07545018, -0.6389068, 2.807769, 0, 1, 0.9921569, 1,
0.07605751, -0.08352453, 4.131969, 0, 1, 1, 1,
0.07772273, 1.34168, 0.3372181, 0, 0.9921569, 1, 1,
0.07946578, -0.2502012, 2.757993, 0, 0.9882353, 1, 1,
0.08001061, -1.180799, 2.009152, 0, 0.9803922, 1, 1,
0.0811802, -0.6742448, 2.126862, 0, 0.9764706, 1, 1,
0.08298247, 0.6538405, -0.7040966, 0, 0.9686275, 1, 1,
0.08545067, 0.8934472, -0.3574305, 0, 0.9647059, 1, 1,
0.08783911, 1.577601, -1.383018, 0, 0.9568627, 1, 1,
0.09054931, 0.3980356, -1.18146, 0, 0.9529412, 1, 1,
0.1023389, 2.627949, 0.3177161, 0, 0.945098, 1, 1,
0.1041692, -0.4519425, 2.391354, 0, 0.9411765, 1, 1,
0.1067344, 0.5285352, -0.9272138, 0, 0.9333333, 1, 1,
0.1089704, 0.3277331, -0.1357106, 0, 0.9294118, 1, 1,
0.1228239, 1.330709, 1.162697, 0, 0.9215686, 1, 1,
0.1229027, -0.9960465, 3.429127, 0, 0.9176471, 1, 1,
0.1246051, -0.3722552, 3.302424, 0, 0.9098039, 1, 1,
0.1253403, 0.9769108, 1.948279, 0, 0.9058824, 1, 1,
0.1336151, -0.4967128, 3.508433, 0, 0.8980392, 1, 1,
0.1338022, -0.8627075, 2.327889, 0, 0.8901961, 1, 1,
0.1375985, 1.356219, 2.766474, 0, 0.8862745, 1, 1,
0.139329, 0.3264232, 0.9229469, 0, 0.8784314, 1, 1,
0.139949, -0.2571579, 1.523033, 0, 0.8745098, 1, 1,
0.1417186, -1.58847, 0.9037093, 0, 0.8666667, 1, 1,
0.1437138, 1.431651, -0.3027928, 0, 0.8627451, 1, 1,
0.1450658, -0.09581074, 2.514185, 0, 0.854902, 1, 1,
0.146367, 2.191191, -0.1656986, 0, 0.8509804, 1, 1,
0.1473816, 1.020269, -1.780324, 0, 0.8431373, 1, 1,
0.1487558, -0.5563647, 2.083477, 0, 0.8392157, 1, 1,
0.1516635, -0.1414188, 2.947593, 0, 0.8313726, 1, 1,
0.1536295, 0.5626578, 0.2310284, 0, 0.827451, 1, 1,
0.1591226, -0.7230139, 3.447972, 0, 0.8196079, 1, 1,
0.1605786, 0.5256782, -0.5083655, 0, 0.8156863, 1, 1,
0.1659634, 1.205729, 0.40389, 0, 0.8078431, 1, 1,
0.1675364, 1.105128, -2.180746, 0, 0.8039216, 1, 1,
0.1676184, -0.8569224, 1.745465, 0, 0.7960784, 1, 1,
0.1694951, -0.7470918, 1.800765, 0, 0.7882353, 1, 1,
0.1697951, -1.293812, 4.308324, 0, 0.7843137, 1, 1,
0.1718311, 0.3485886, -0.09078607, 0, 0.7764706, 1, 1,
0.1730015, 1.142722, 0.1369416, 0, 0.772549, 1, 1,
0.1766703, -0.4267075, 2.241328, 0, 0.7647059, 1, 1,
0.1766898, -0.9713392, 4.805911, 0, 0.7607843, 1, 1,
0.177081, -3.091707, 3.181614, 0, 0.7529412, 1, 1,
0.1781591, -0.5604494, 2.756923, 0, 0.7490196, 1, 1,
0.180115, 0.7284063, -0.6525897, 0, 0.7411765, 1, 1,
0.1829444, -0.8695738, 0.5997441, 0, 0.7372549, 1, 1,
0.1832778, -0.9389203, 3.109068, 0, 0.7294118, 1, 1,
0.1882748, 0.3979826, -0.5219114, 0, 0.7254902, 1, 1,
0.1888683, -0.08447742, 2.050163, 0, 0.7176471, 1, 1,
0.192594, -1.023247, 4.289562, 0, 0.7137255, 1, 1,
0.1928211, 1.174158, -1.224202, 0, 0.7058824, 1, 1,
0.1939559, -0.873158, 2.341531, 0, 0.6980392, 1, 1,
0.1939696, -0.4459497, 3.016911, 0, 0.6941177, 1, 1,
0.1943258, 0.6010576, 0.4147884, 0, 0.6862745, 1, 1,
0.1993384, 0.8280399, 0.4416319, 0, 0.682353, 1, 1,
0.2000744, -0.190308, 2.337279, 0, 0.6745098, 1, 1,
0.2074358, 0.5276324, 0.9154857, 0, 0.6705883, 1, 1,
0.2079583, 0.1439736, 2.56678, 0, 0.6627451, 1, 1,
0.2083537, -0.04120313, 2.62912, 0, 0.6588235, 1, 1,
0.210783, 0.3456521, 1.907435, 0, 0.6509804, 1, 1,
0.2152804, 0.5716588, 2.188437, 0, 0.6470588, 1, 1,
0.2197129, -0.3274712, 0.9398344, 0, 0.6392157, 1, 1,
0.2200672, 0.7239698, -0.1360022, 0, 0.6352941, 1, 1,
0.2224117, -1.230501, 3.228117, 0, 0.627451, 1, 1,
0.2245013, -0.3065516, 3.314977, 0, 0.6235294, 1, 1,
0.2264645, 0.07214859, 0.7307873, 0, 0.6156863, 1, 1,
0.2265448, 1.735861, -0.1093234, 0, 0.6117647, 1, 1,
0.2276899, 0.5640039, 0.7927511, 0, 0.6039216, 1, 1,
0.231679, -0.8006067, 2.588095, 0, 0.5960785, 1, 1,
0.2363649, 0.2191718, 0.355997, 0, 0.5921569, 1, 1,
0.2380132, 0.6633299, -1.978684, 0, 0.5843138, 1, 1,
0.2428559, -0.6990081, 2.287521, 0, 0.5803922, 1, 1,
0.2439858, 0.06926989, 0.9822788, 0, 0.572549, 1, 1,
0.2465338, -0.7659576, 2.813116, 0, 0.5686275, 1, 1,
0.2468116, 0.02614173, 1.368366, 0, 0.5607843, 1, 1,
0.2500773, -1.610164, 2.96174, 0, 0.5568628, 1, 1,
0.2565039, -0.7865226, 2.583068, 0, 0.5490196, 1, 1,
0.2589405, -0.2232932, 2.338755, 0, 0.5450981, 1, 1,
0.2598543, 0.4193777, 0.8662997, 0, 0.5372549, 1, 1,
0.2608671, -1.031486, 3.822809, 0, 0.5333334, 1, 1,
0.2628517, 0.8766804, -0.1141828, 0, 0.5254902, 1, 1,
0.2704034, -0.8849264, 2.366148, 0, 0.5215687, 1, 1,
0.2708996, -2.371923, 3.138733, 0, 0.5137255, 1, 1,
0.2720915, -2.322822, 2.337344, 0, 0.509804, 1, 1,
0.2722254, 0.6968835, 0.03746282, 0, 0.5019608, 1, 1,
0.2722931, -0.5600201, 2.70213, 0, 0.4941176, 1, 1,
0.2736279, 0.04010328, 4.134335, 0, 0.4901961, 1, 1,
0.2760145, -2.10383, 2.903519, 0, 0.4823529, 1, 1,
0.2765307, -0.02915873, 2.080541, 0, 0.4784314, 1, 1,
0.2797936, -1.043224, 2.937854, 0, 0.4705882, 1, 1,
0.2806692, -0.3049718, 1.414709, 0, 0.4666667, 1, 1,
0.2809405, 0.2412892, 2.069562, 0, 0.4588235, 1, 1,
0.2830344, -2.747746, 2.638775, 0, 0.454902, 1, 1,
0.2902006, -0.08572567, 2.212493, 0, 0.4470588, 1, 1,
0.2918318, -1.354019, 3.788272, 0, 0.4431373, 1, 1,
0.2930867, -1.196353, 4.746481, 0, 0.4352941, 1, 1,
0.3017457, 0.4537356, 2.275848, 0, 0.4313726, 1, 1,
0.3019584, -0.1678721, 3.389471, 0, 0.4235294, 1, 1,
0.3041485, 0.1933504, 1.559995, 0, 0.4196078, 1, 1,
0.3060456, -0.2808147, 1.022486, 0, 0.4117647, 1, 1,
0.306379, -0.4669508, 2.920307, 0, 0.4078431, 1, 1,
0.3086971, -0.9389794, 3.897751, 0, 0.4, 1, 1,
0.3097259, -0.6453295, 2.643092, 0, 0.3921569, 1, 1,
0.3100333, -0.3185683, 0.6113956, 0, 0.3882353, 1, 1,
0.3124557, 0.01736653, 0.4851555, 0, 0.3803922, 1, 1,
0.3133347, -0.1465006, 1.051115, 0, 0.3764706, 1, 1,
0.3196089, 1.72282, 0.1171886, 0, 0.3686275, 1, 1,
0.3210964, -1.693053, 3.263138, 0, 0.3647059, 1, 1,
0.3217381, 0.8423959, 2.153478, 0, 0.3568628, 1, 1,
0.3241415, -0.1409177, 3.291484, 0, 0.3529412, 1, 1,
0.3315212, 0.9772515, 0.4325919, 0, 0.345098, 1, 1,
0.3336046, -0.5727006, 1.907266, 0, 0.3411765, 1, 1,
0.3359766, 0.5009961, 1.100768, 0, 0.3333333, 1, 1,
0.3361772, -0.5912855, 1.316834, 0, 0.3294118, 1, 1,
0.3382022, -0.3735716, 1.914953, 0, 0.3215686, 1, 1,
0.3422684, 0.270463, 2.261857, 0, 0.3176471, 1, 1,
0.3444178, 0.102181, 1.683706, 0, 0.3098039, 1, 1,
0.3455499, -1.252213, 2.32345, 0, 0.3058824, 1, 1,
0.3525209, -1.83125, 2.756483, 0, 0.2980392, 1, 1,
0.3525773, 0.7669529, 2.417683, 0, 0.2901961, 1, 1,
0.3539763, -0.2763962, 1.934788, 0, 0.2862745, 1, 1,
0.3548707, 0.03180418, 3.119547, 0, 0.2784314, 1, 1,
0.3591257, 1.493041, -0.5827168, 0, 0.2745098, 1, 1,
0.3603455, 1.227121, 1.537707, 0, 0.2666667, 1, 1,
0.3631942, -0.04943781, 1.136571, 0, 0.2627451, 1, 1,
0.3641531, -0.8296205, 3.639924, 0, 0.254902, 1, 1,
0.3642058, 3.007496, -0.5840631, 0, 0.2509804, 1, 1,
0.3662101, -1.264298, 2.806354, 0, 0.2431373, 1, 1,
0.366623, -0.8717147, 3.185682, 0, 0.2392157, 1, 1,
0.3688459, 0.1629269, 2.304785, 0, 0.2313726, 1, 1,
0.3698259, -0.6494506, 2.834877, 0, 0.227451, 1, 1,
0.3721026, -0.0006472571, 1.62529, 0, 0.2196078, 1, 1,
0.3741322, 0.4549546, 1.826371, 0, 0.2156863, 1, 1,
0.3741402, 1.423894, 1.606363, 0, 0.2078431, 1, 1,
0.3789349, 0.4889454, 0.2323161, 0, 0.2039216, 1, 1,
0.3824949, -0.9779915, 0.5962631, 0, 0.1960784, 1, 1,
0.3832212, 0.06564892, 1.596149, 0, 0.1882353, 1, 1,
0.3869309, -1.466171, 3.258073, 0, 0.1843137, 1, 1,
0.3880334, -1.231559, 2.880647, 0, 0.1764706, 1, 1,
0.3902971, -0.008125424, 2.824526, 0, 0.172549, 1, 1,
0.3953019, 0.7006804, 1.490545, 0, 0.1647059, 1, 1,
0.4081762, 1.628385, -0.9397643, 0, 0.1607843, 1, 1,
0.429917, -1.345883, 3.184726, 0, 0.1529412, 1, 1,
0.4302962, 0.2467228, 1.250441, 0, 0.1490196, 1, 1,
0.4304862, -1.269083, 5.382132, 0, 0.1411765, 1, 1,
0.4317434, 1.50994, -0.5194978, 0, 0.1372549, 1, 1,
0.4412119, 0.1094387, 2.368981, 0, 0.1294118, 1, 1,
0.4428575, 0.4788403, 0.3980775, 0, 0.1254902, 1, 1,
0.4436451, 0.2353145, -0.5643152, 0, 0.1176471, 1, 1,
0.4452193, -0.2290538, 2.177225, 0, 0.1137255, 1, 1,
0.4493252, -1.015278, 2.640496, 0, 0.1058824, 1, 1,
0.4496211, -0.01818163, 1.83599, 0, 0.09803922, 1, 1,
0.4528562, -0.8915977, 0.947214, 0, 0.09411765, 1, 1,
0.4537565, -0.6846529, 1.841088, 0, 0.08627451, 1, 1,
0.4541111, -0.6599499, 2.78145, 0, 0.08235294, 1, 1,
0.4556022, -0.1252086, 2.310293, 0, 0.07450981, 1, 1,
0.4564629, 0.4467236, 0.7694098, 0, 0.07058824, 1, 1,
0.4565632, -0.04704347, 2.345478, 0, 0.0627451, 1, 1,
0.4574284, -0.01879656, 1.267513, 0, 0.05882353, 1, 1,
0.4607584, 0.8425323, 1.667578, 0, 0.05098039, 1, 1,
0.462998, 1.287378, -0.8547043, 0, 0.04705882, 1, 1,
0.4642101, 0.1093484, 0.3833151, 0, 0.03921569, 1, 1,
0.4648274, 1.185663, 3.110363, 0, 0.03529412, 1, 1,
0.4656239, 0.3166386, 1.120118, 0, 0.02745098, 1, 1,
0.4678305, 0.107122, 0.8039901, 0, 0.02352941, 1, 1,
0.4698943, -1.139513, 2.83833, 0, 0.01568628, 1, 1,
0.4708727, 1.937504, 0.1719889, 0, 0.01176471, 1, 1,
0.4712014, 0.4095034, -0.5482265, 0, 0.003921569, 1, 1,
0.4715576, 0.3213796, 1.311918, 0.003921569, 0, 1, 1,
0.4718609, 0.3364761, 1.457363, 0.007843138, 0, 1, 1,
0.472364, -0.3850191, 1.654401, 0.01568628, 0, 1, 1,
0.4731496, 0.2626523, 1.03226, 0.01960784, 0, 1, 1,
0.4793453, -1.264452, 3.656279, 0.02745098, 0, 1, 1,
0.4796489, 0.8637323, 0.01796442, 0.03137255, 0, 1, 1,
0.4805836, -0.9175333, 2.577019, 0.03921569, 0, 1, 1,
0.4813628, -1.104445, 1.240959, 0.04313726, 0, 1, 1,
0.4860027, -0.15639, 3.183986, 0.05098039, 0, 1, 1,
0.4870046, -1.6627, 4.560822, 0.05490196, 0, 1, 1,
0.4874263, -0.9948477, 3.623262, 0.0627451, 0, 1, 1,
0.4898384, 0.8332675, -0.6787703, 0.06666667, 0, 1, 1,
0.4898959, -0.3336153, 1.353285, 0.07450981, 0, 1, 1,
0.4931672, -0.2668273, 2.919544, 0.07843138, 0, 1, 1,
0.4939762, 0.421558, 0.2770404, 0.08627451, 0, 1, 1,
0.4956631, -0.5649964, 1.795245, 0.09019608, 0, 1, 1,
0.4987352, -1.002353, 3.646221, 0.09803922, 0, 1, 1,
0.4991165, -1.047748, 2.522776, 0.1058824, 0, 1, 1,
0.4995062, -1.034027, 1.852347, 0.1098039, 0, 1, 1,
0.5027362, 0.8635069, -0.4227276, 0.1176471, 0, 1, 1,
0.5133235, 0.04829361, 0.8100471, 0.1215686, 0, 1, 1,
0.5156713, -0.5908439, 3.345783, 0.1294118, 0, 1, 1,
0.517116, -0.5417653, 1.986781, 0.1333333, 0, 1, 1,
0.521642, -0.661501, 2.506662, 0.1411765, 0, 1, 1,
0.5229815, -2.242277, 2.972893, 0.145098, 0, 1, 1,
0.5258025, 0.0572243, 1.275697, 0.1529412, 0, 1, 1,
0.526639, -0.08405621, 1.321401, 0.1568628, 0, 1, 1,
0.528139, 0.1469691, 0.02299927, 0.1647059, 0, 1, 1,
0.5281724, 0.3861888, 1.599566, 0.1686275, 0, 1, 1,
0.5321301, -0.4821082, 1.367132, 0.1764706, 0, 1, 1,
0.5321484, -0.8133376, 2.075138, 0.1803922, 0, 1, 1,
0.5335402, -0.4168395, 1.274129, 0.1882353, 0, 1, 1,
0.5362892, 0.09315807, 1.208299, 0.1921569, 0, 1, 1,
0.5421381, -1.465363, 2.322037, 0.2, 0, 1, 1,
0.5426631, -0.1637915, 1.211357, 0.2078431, 0, 1, 1,
0.5434907, -0.5496303, 2.313343, 0.2117647, 0, 1, 1,
0.5495243, -0.6367061, 3.325149, 0.2196078, 0, 1, 1,
0.5497509, 0.1586119, 0.5592691, 0.2235294, 0, 1, 1,
0.5517917, 0.3574588, 2.086916, 0.2313726, 0, 1, 1,
0.5530313, -0.2244784, 1.099029, 0.2352941, 0, 1, 1,
0.5568931, -0.4218909, 3.035122, 0.2431373, 0, 1, 1,
0.5592254, 0.9029401, 1.632437, 0.2470588, 0, 1, 1,
0.5625385, 0.8956406, -0.4994572, 0.254902, 0, 1, 1,
0.56906, -0.5975442, -0.0800155, 0.2588235, 0, 1, 1,
0.5712133, -0.6916367, 3.90076, 0.2666667, 0, 1, 1,
0.573009, -1.749501, 2.79186, 0.2705882, 0, 1, 1,
0.5838881, 1.394147, 0.9826291, 0.2784314, 0, 1, 1,
0.5849241, 0.1350011, 2.34576, 0.282353, 0, 1, 1,
0.5895896, -0.01029486, 2.320713, 0.2901961, 0, 1, 1,
0.5907643, 0.1866597, 1.413312, 0.2941177, 0, 1, 1,
0.6042844, 0.358564, 1.203653, 0.3019608, 0, 1, 1,
0.6054481, -1.464169, 3.693416, 0.3098039, 0, 1, 1,
0.6108533, 0.8855598, 0.03163199, 0.3137255, 0, 1, 1,
0.6149727, -0.3505101, 1.430704, 0.3215686, 0, 1, 1,
0.6168939, 1.765017, 2.658904, 0.3254902, 0, 1, 1,
0.6170745, 0.2764965, 0.8543528, 0.3333333, 0, 1, 1,
0.617963, -0.6796147, 1.343083, 0.3372549, 0, 1, 1,
0.6186553, -0.3807167, 2.776866, 0.345098, 0, 1, 1,
0.6208101, -0.605808, 2.523845, 0.3490196, 0, 1, 1,
0.6238534, 0.7789695, 0.1093486, 0.3568628, 0, 1, 1,
0.6249938, 1.301504, -0.3074591, 0.3607843, 0, 1, 1,
0.6251526, 1.181006, 1.579791, 0.3686275, 0, 1, 1,
0.6281675, -0.8537276, 1.109212, 0.372549, 0, 1, 1,
0.6474223, 1.698068, 0.01591401, 0.3803922, 0, 1, 1,
0.6478431, -1.93674, 3.52206, 0.3843137, 0, 1, 1,
0.65286, -1.766611, 3.501671, 0.3921569, 0, 1, 1,
0.6544281, -0.1520861, 0.9220013, 0.3960784, 0, 1, 1,
0.6628367, 0.5002908, 0.8723474, 0.4039216, 0, 1, 1,
0.6631137, 1.050594, 1.513341, 0.4117647, 0, 1, 1,
0.6717442, -0.3632072, 3.068398, 0.4156863, 0, 1, 1,
0.6736839, 0.07824714, 1.815807, 0.4235294, 0, 1, 1,
0.6744106, -0.2369443, 2.365971, 0.427451, 0, 1, 1,
0.6810772, 0.08382022, 1.887157, 0.4352941, 0, 1, 1,
0.6822039, -1.918802, 1.814011, 0.4392157, 0, 1, 1,
0.6917732, -1.215514, 1.42454, 0.4470588, 0, 1, 1,
0.6938219, 0.2696674, -0.6633356, 0.4509804, 0, 1, 1,
0.6947015, 0.264928, -0.116429, 0.4588235, 0, 1, 1,
0.6956593, 1.415873, 0.276302, 0.4627451, 0, 1, 1,
0.6978638, -0.3955751, 0.7734587, 0.4705882, 0, 1, 1,
0.7006845, 0.3956801, 0.3070694, 0.4745098, 0, 1, 1,
0.7075119, 0.6261705, -0.6984923, 0.4823529, 0, 1, 1,
0.7078609, -0.05621712, 0.7532831, 0.4862745, 0, 1, 1,
0.7201215, 0.6769249, 2.275013, 0.4941176, 0, 1, 1,
0.7245103, 0.9916995, 1.546671, 0.5019608, 0, 1, 1,
0.7247422, 0.3039179, 0.2811171, 0.5058824, 0, 1, 1,
0.731338, -1.371221, 1.510925, 0.5137255, 0, 1, 1,
0.738458, -1.743377, 2.586341, 0.5176471, 0, 1, 1,
0.7454596, -0.03381329, -0.05914454, 0.5254902, 0, 1, 1,
0.7511324, 0.5458805, 1.438968, 0.5294118, 0, 1, 1,
0.7521086, 1.938471, 1.623135, 0.5372549, 0, 1, 1,
0.7553172, 0.02823955, 1.544248, 0.5411765, 0, 1, 1,
0.759849, 0.6650478, 2.86402, 0.5490196, 0, 1, 1,
0.7602553, 0.07588374, 0.3616679, 0.5529412, 0, 1, 1,
0.760702, -0.1886068, 0.8830435, 0.5607843, 0, 1, 1,
0.7620452, 1.068074, 1.207313, 0.5647059, 0, 1, 1,
0.7640894, -0.9079931, 2.541744, 0.572549, 0, 1, 1,
0.7655327, 1.192279, 0.6828312, 0.5764706, 0, 1, 1,
0.768719, 1.995504, 0.2843756, 0.5843138, 0, 1, 1,
0.7709709, 1.63774, 1.908138, 0.5882353, 0, 1, 1,
0.7784773, -0.9631897, 4.083703, 0.5960785, 0, 1, 1,
0.7814814, 1.261885, 0.926357, 0.6039216, 0, 1, 1,
0.7816514, 0.533439, -0.2539087, 0.6078432, 0, 1, 1,
0.784471, -0.2507205, 0.8214963, 0.6156863, 0, 1, 1,
0.7867517, 1.399028, -0.2152085, 0.6196079, 0, 1, 1,
0.7878301, -0.8103445, 1.744775, 0.627451, 0, 1, 1,
0.7925943, 1.158829, 0.7267517, 0.6313726, 0, 1, 1,
0.7937194, -1.717857, 2.272073, 0.6392157, 0, 1, 1,
0.8010643, -0.411203, 0.8723933, 0.6431373, 0, 1, 1,
0.8021296, 0.6266513, 3.350012, 0.6509804, 0, 1, 1,
0.8025011, -0.1330629, 2.15521, 0.654902, 0, 1, 1,
0.8151488, -0.03344404, 0.7948309, 0.6627451, 0, 1, 1,
0.8174115, 0.357663, 1.842812, 0.6666667, 0, 1, 1,
0.8229781, 0.1386519, 1.492712, 0.6745098, 0, 1, 1,
0.8277842, -0.2037149, 1.73003, 0.6784314, 0, 1, 1,
0.8291412, -1.042689, 3.000267, 0.6862745, 0, 1, 1,
0.8302609, 0.293021, 1.354792, 0.6901961, 0, 1, 1,
0.8304384, -0.3857498, 1.104796, 0.6980392, 0, 1, 1,
0.8365211, 0.6263295, 1.390004, 0.7058824, 0, 1, 1,
0.8382899, -0.3149904, 1.88252, 0.7098039, 0, 1, 1,
0.840456, -1.209578, 3.424753, 0.7176471, 0, 1, 1,
0.8466209, -0.06559758, 1.633503, 0.7215686, 0, 1, 1,
0.8535286, 0.5171465, 0.2835131, 0.7294118, 0, 1, 1,
0.8548009, -0.5301857, 1.798651, 0.7333333, 0, 1, 1,
0.857899, 0.6873821, 3.444698, 0.7411765, 0, 1, 1,
0.860432, -1.286497, 3.000884, 0.7450981, 0, 1, 1,
0.8641408, -1.373639, 2.200033, 0.7529412, 0, 1, 1,
0.8645161, -0.3499165, 3.031979, 0.7568628, 0, 1, 1,
0.8685001, 0.7479536, -1.771921, 0.7647059, 0, 1, 1,
0.8701447, -1.674547, 2.928427, 0.7686275, 0, 1, 1,
0.873526, 1.905145, 0.4927795, 0.7764706, 0, 1, 1,
0.8736548, -0.05595979, 1.370653, 0.7803922, 0, 1, 1,
0.8746117, 2.268445, 1.332264, 0.7882353, 0, 1, 1,
0.875172, -0.2764899, 1.843133, 0.7921569, 0, 1, 1,
0.8780618, -0.5758774, 1.022882, 0.8, 0, 1, 1,
0.8950327, 0.1210376, 2.928817, 0.8078431, 0, 1, 1,
0.8978001, -0.6279713, 2.416189, 0.8117647, 0, 1, 1,
0.8980109, 0.4417834, 1.41513, 0.8196079, 0, 1, 1,
0.8989269, -0.8062324, 1.414799, 0.8235294, 0, 1, 1,
0.9006745, 0.6174073, 0.3204308, 0.8313726, 0, 1, 1,
0.9028199, 0.5231456, 0.8349205, 0.8352941, 0, 1, 1,
0.9146804, 1.146607, 2.337772, 0.8431373, 0, 1, 1,
0.9147233, 0.4990916, 0.7213235, 0.8470588, 0, 1, 1,
0.9184627, 0.3367815, 0.05687352, 0.854902, 0, 1, 1,
0.9249486, 0.7835774, 1.375402, 0.8588235, 0, 1, 1,
0.9260322, 0.4774514, 0.119591, 0.8666667, 0, 1, 1,
0.9312629, -0.7205682, 1.350726, 0.8705882, 0, 1, 1,
0.9408166, -0.1890958, 1.430966, 0.8784314, 0, 1, 1,
0.9413497, -1.376216, 1.795912, 0.8823529, 0, 1, 1,
0.9425374, -0.2430402, 2.131886, 0.8901961, 0, 1, 1,
0.9447193, -0.01780618, 1.164839, 0.8941177, 0, 1, 1,
0.9447256, 1.24627, 1.084065, 0.9019608, 0, 1, 1,
0.9612454, 0.2815644, -1.05927, 0.9098039, 0, 1, 1,
0.9627123, 0.4416443, 1.353962, 0.9137255, 0, 1, 1,
0.9645156, -0.9020641, 0.9529758, 0.9215686, 0, 1, 1,
0.965777, -0.5758708, 1.055925, 0.9254902, 0, 1, 1,
0.9665112, 0.2758094, 1.844441, 0.9333333, 0, 1, 1,
0.9671022, -0.8001477, 1.428813, 0.9372549, 0, 1, 1,
0.9698322, 2.01903, 1.352827, 0.945098, 0, 1, 1,
0.9708207, -0.3648522, 2.712324, 0.9490196, 0, 1, 1,
0.9813576, -0.05356713, 1.486115, 0.9568627, 0, 1, 1,
0.9817814, -0.9847431, 3.883152, 0.9607843, 0, 1, 1,
0.9835348, -1.287481, 3.203755, 0.9686275, 0, 1, 1,
0.9945896, 0.4204079, 1.037418, 0.972549, 0, 1, 1,
0.9953141, 1.358075, -1.171392, 0.9803922, 0, 1, 1,
0.9958223, 1.498188, 0.3070305, 0.9843137, 0, 1, 1,
0.9958243, 0.8244082, 1.233232, 0.9921569, 0, 1, 1,
0.9966012, -1.163372, 2.138437, 0.9960784, 0, 1, 1,
0.9986559, -0.6516808, 3.621196, 1, 0, 0.9960784, 1,
1.003399, -1.064993, 0.5794362, 1, 0, 0.9882353, 1,
1.01053, -2.068246, 2.925648, 1, 0, 0.9843137, 1,
1.012212, 1.697936, -0.8865662, 1, 0, 0.9764706, 1,
1.017704, -0.5423661, 0.7649693, 1, 0, 0.972549, 1,
1.025103, -1.557333, 1.969887, 1, 0, 0.9647059, 1,
1.028061, 0.6174002, 1.959238, 1, 0, 0.9607843, 1,
1.034854, 1.05257, 1.182021, 1, 0, 0.9529412, 1,
1.041466, -0.06440829, 1.163214, 1, 0, 0.9490196, 1,
1.046401, -1.134451, 1.79874, 1, 0, 0.9411765, 1,
1.04786, -2.357457, 2.094262, 1, 0, 0.9372549, 1,
1.049706, 0.8554798, 0.2978702, 1, 0, 0.9294118, 1,
1.059484, -0.9335865, 1.807347, 1, 0, 0.9254902, 1,
1.068649, 0.1632342, 1.747751, 1, 0, 0.9176471, 1,
1.068713, 0.0850191, 1.654115, 1, 0, 0.9137255, 1,
1.069375, -0.02744091, 2.170883, 1, 0, 0.9058824, 1,
1.072685, 0.965723, 1.769257, 1, 0, 0.9019608, 1,
1.076765, 0.4258149, 1.835412, 1, 0, 0.8941177, 1,
1.076816, -0.5173987, 3.733618, 1, 0, 0.8862745, 1,
1.083902, 0.9803842, 0.3028967, 1, 0, 0.8823529, 1,
1.085313, 0.862366, 2.556766, 1, 0, 0.8745098, 1,
1.09594, -0.1129959, 1.073682, 1, 0, 0.8705882, 1,
1.100307, 1.102566, 0.4000392, 1, 0, 0.8627451, 1,
1.109725, 0.3305735, 1.133929, 1, 0, 0.8588235, 1,
1.112778, 0.17142, 1.532019, 1, 0, 0.8509804, 1,
1.113076, 0.6033825, 2.870795, 1, 0, 0.8470588, 1,
1.119062, -0.9567593, 2.040278, 1, 0, 0.8392157, 1,
1.120076, -1.437266, 2.360764, 1, 0, 0.8352941, 1,
1.129436, -0.9488744, 2.585807, 1, 0, 0.827451, 1,
1.130239, 0.01169132, 3.333336, 1, 0, 0.8235294, 1,
1.132068, 0.3161032, 1.466757, 1, 0, 0.8156863, 1,
1.132439, -1.451673, 1.692827, 1, 0, 0.8117647, 1,
1.136087, -1.778958, 1.187753, 1, 0, 0.8039216, 1,
1.141854, 1.799203, 0.3343648, 1, 0, 0.7960784, 1,
1.143914, 0.1325017, 2.267745, 1, 0, 0.7921569, 1,
1.152478, -0.8452703, 0.7257199, 1, 0, 0.7843137, 1,
1.16537, -0.4915969, 3.12361, 1, 0, 0.7803922, 1,
1.165578, -0.926991, 1.432197, 1, 0, 0.772549, 1,
1.16625, 1.307081, 2.133951, 1, 0, 0.7686275, 1,
1.171048, 0.2436953, 0.3845776, 1, 0, 0.7607843, 1,
1.171653, -0.4311949, 1.412864, 1, 0, 0.7568628, 1,
1.190949, 0.2414021, 0.6679981, 1, 0, 0.7490196, 1,
1.194744, -1.209809, 3.407381, 1, 0, 0.7450981, 1,
1.198399, 0.192961, 2.200596, 1, 0, 0.7372549, 1,
1.2067, 0.1596997, 2.206046, 1, 0, 0.7333333, 1,
1.207578, 1.339687, -0.7766606, 1, 0, 0.7254902, 1,
1.213601, 0.5390574, 1.184854, 1, 0, 0.7215686, 1,
1.220149, 0.1359781, 1.147173, 1, 0, 0.7137255, 1,
1.225311, 0.1789867, 1.357199, 1, 0, 0.7098039, 1,
1.226766, 0.2917694, 1.605857, 1, 0, 0.7019608, 1,
1.229689, 0.1653091, 0.06889606, 1, 0, 0.6941177, 1,
1.232157, 0.2653409, 0.3565366, 1, 0, 0.6901961, 1,
1.247735, 0.535479, 0.4230783, 1, 0, 0.682353, 1,
1.254465, 1.478555, -0.8626473, 1, 0, 0.6784314, 1,
1.261591, 0.409662, 1.03153, 1, 0, 0.6705883, 1,
1.263497, -2.09695, 2.595327, 1, 0, 0.6666667, 1,
1.263587, 0.4461738, 1.219029, 1, 0, 0.6588235, 1,
1.268891, -1.106027, 2.545315, 1, 0, 0.654902, 1,
1.270199, -1.762912, 2.820478, 1, 0, 0.6470588, 1,
1.280644, 0.1272179, 2.6132, 1, 0, 0.6431373, 1,
1.28302, -0.2661614, 0.5731193, 1, 0, 0.6352941, 1,
1.305832, 1.02458, 2.848238, 1, 0, 0.6313726, 1,
1.30642, -0.2316879, 0.9588884, 1, 0, 0.6235294, 1,
1.307975, -0.9265112, 2.810668, 1, 0, 0.6196079, 1,
1.30964, -0.6351901, 0.07189972, 1, 0, 0.6117647, 1,
1.31501, -0.09004947, 2.170371, 1, 0, 0.6078432, 1,
1.315586, 0.5817826, 0.9339031, 1, 0, 0.6, 1,
1.315707, -0.0436857, 2.16595, 1, 0, 0.5921569, 1,
1.31697, -0.135244, 1.41843, 1, 0, 0.5882353, 1,
1.323479, -0.002607107, 1.018579, 1, 0, 0.5803922, 1,
1.331123, -1.592331, 2.699056, 1, 0, 0.5764706, 1,
1.348476, -0.4983626, 1.898102, 1, 0, 0.5686275, 1,
1.361724, -1.600956, 4.365767, 1, 0, 0.5647059, 1,
1.36657, -0.8914692, 0.8211893, 1, 0, 0.5568628, 1,
1.367709, -0.4812116, 1.937098, 1, 0, 0.5529412, 1,
1.386926, 0.1035635, 3.387398, 1, 0, 0.5450981, 1,
1.39834, 0.0907274, 2.996313, 1, 0, 0.5411765, 1,
1.403199, 1.772375, -0.2447414, 1, 0, 0.5333334, 1,
1.403654, -0.0537439, 2.640845, 1, 0, 0.5294118, 1,
1.404081, -0.1209224, 1.514799, 1, 0, 0.5215687, 1,
1.422411, 0.5590364, -0.4143881, 1, 0, 0.5176471, 1,
1.428012, 0.08433945, 0.6259102, 1, 0, 0.509804, 1,
1.4401, -0.08909294, 1.46573, 1, 0, 0.5058824, 1,
1.446647, -1.110278, 3.595033, 1, 0, 0.4980392, 1,
1.447562, -0.02374769, 1.365018, 1, 0, 0.4901961, 1,
1.451313, 0.5409558, -0.4206852, 1, 0, 0.4862745, 1,
1.451428, -1.605757, 4.245181, 1, 0, 0.4784314, 1,
1.463861, -0.09791397, 2.883545, 1, 0, 0.4745098, 1,
1.478086, -0.5760041, 0.8086453, 1, 0, 0.4666667, 1,
1.491974, -0.2950826, 2.565502, 1, 0, 0.4627451, 1,
1.503361, 0.7525328, 1.047193, 1, 0, 0.454902, 1,
1.511611, -0.2508948, 2.41209, 1, 0, 0.4509804, 1,
1.515496, 0.5322787, 2.687317, 1, 0, 0.4431373, 1,
1.518579, 0.07209459, 2.689108, 1, 0, 0.4392157, 1,
1.538466, -0.5976517, 1.284581, 1, 0, 0.4313726, 1,
1.539312, -0.3201033, 2.536869, 1, 0, 0.427451, 1,
1.540695, 1.617063, -0.02270908, 1, 0, 0.4196078, 1,
1.547811, 0.7891393, 1.642718, 1, 0, 0.4156863, 1,
1.558151, -0.4868084, 2.484158, 1, 0, 0.4078431, 1,
1.573783, 1.693048, 1.795713, 1, 0, 0.4039216, 1,
1.577273, 0.1759308, 0.545148, 1, 0, 0.3960784, 1,
1.577837, 0.006589576, 1.200386, 1, 0, 0.3882353, 1,
1.579936, 0.1938206, 3.323031, 1, 0, 0.3843137, 1,
1.582902, 0.8594658, 0.1310824, 1, 0, 0.3764706, 1,
1.593071, -1.424221, 1.952693, 1, 0, 0.372549, 1,
1.598186, -0.5562119, 1.579558, 1, 0, 0.3647059, 1,
1.602809, -0.9420367, 2.073943, 1, 0, 0.3607843, 1,
1.609161, 0.2295065, 0.9672012, 1, 0, 0.3529412, 1,
1.617087, 0.1676234, 1.093225, 1, 0, 0.3490196, 1,
1.626873, -0.785197, 1.800243, 1, 0, 0.3411765, 1,
1.634496, 0.7733442, 0.502054, 1, 0, 0.3372549, 1,
1.641204, -2.521706, 5.534655, 1, 0, 0.3294118, 1,
1.671103, -0.7471732, 2.147482, 1, 0, 0.3254902, 1,
1.717114, 2.272223, 1.320082, 1, 0, 0.3176471, 1,
1.722941, -0.6391085, 1.027828, 1, 0, 0.3137255, 1,
1.727051, 1.495135, 0.5832915, 1, 0, 0.3058824, 1,
1.735616, 0.9474577, 0.4241229, 1, 0, 0.2980392, 1,
1.754888, 0.03160277, 2.204872, 1, 0, 0.2941177, 1,
1.761775, 0.691819, 0.772483, 1, 0, 0.2862745, 1,
1.76604, -0.08113277, 2.298452, 1, 0, 0.282353, 1,
1.784789, -0.6840017, 1.925587, 1, 0, 0.2745098, 1,
1.789211, -0.7906536, 1.277057, 1, 0, 0.2705882, 1,
1.796808, 1.027235, -0.3390163, 1, 0, 0.2627451, 1,
1.83534, 1.102799, 0.8904277, 1, 0, 0.2588235, 1,
1.839311, -0.9370957, 2.810786, 1, 0, 0.2509804, 1,
1.839634, -0.9041834, 2.59503, 1, 0, 0.2470588, 1,
1.840632, -0.7934451, 1.258615, 1, 0, 0.2392157, 1,
1.843196, 0.4217128, 2.595259, 1, 0, 0.2352941, 1,
1.867618, 0.2002929, 2.274096, 1, 0, 0.227451, 1,
1.881792, 0.7526281, 1.658553, 1, 0, 0.2235294, 1,
1.888751, -0.2274322, 1.39365, 1, 0, 0.2156863, 1,
1.898578, 0.4475855, 1.079697, 1, 0, 0.2117647, 1,
1.907653, -0.5979211, 1.559567, 1, 0, 0.2039216, 1,
1.920973, 1.393278, 1.992078, 1, 0, 0.1960784, 1,
1.929174, -1.777887, 4.693286, 1, 0, 0.1921569, 1,
1.954945, -3.403497, 4.718451, 1, 0, 0.1843137, 1,
1.979148, -1.57051, 0.06255888, 1, 0, 0.1803922, 1,
1.979416, -0.1122056, 2.375586, 1, 0, 0.172549, 1,
1.991816, -0.6587104, 1.686559, 1, 0, 0.1686275, 1,
1.992359, -0.02920965, 1.8573, 1, 0, 0.1607843, 1,
2.017011, 0.3237563, 0.1643051, 1, 0, 0.1568628, 1,
2.029424, -0.4288781, 4.197093, 1, 0, 0.1490196, 1,
2.031047, 0.7966219, 1.005091, 1, 0, 0.145098, 1,
2.048811, 0.9057888, 1.294303, 1, 0, 0.1372549, 1,
2.073905, 0.8114544, 1.751396, 1, 0, 0.1333333, 1,
2.101217, -0.9548442, 3.128115, 1, 0, 0.1254902, 1,
2.103385, -0.278882, 1.095035, 1, 0, 0.1215686, 1,
2.108017, 0.4605978, 1.903802, 1, 0, 0.1137255, 1,
2.127849, 0.7522727, 0.4845057, 1, 0, 0.1098039, 1,
2.158553, -0.2505659, 2.970532, 1, 0, 0.1019608, 1,
2.186322, -1.52984, 1.281213, 1, 0, 0.09411765, 1,
2.214483, -0.1910973, 3.323718, 1, 0, 0.09019608, 1,
2.224887, 0.7877133, 0.9879303, 1, 0, 0.08235294, 1,
2.228932, 0.2618751, -0.2585451, 1, 0, 0.07843138, 1,
2.230598, -1.227829, 2.32386, 1, 0, 0.07058824, 1,
2.282977, 0.263498, 1.167019, 1, 0, 0.06666667, 1,
2.290803, 0.3027343, 2.377523, 1, 0, 0.05882353, 1,
2.310812, -0.367521, 2.779687, 1, 0, 0.05490196, 1,
2.410337, 0.3331408, 2.405641, 1, 0, 0.04705882, 1,
2.559747, 0.0424551, 4.274776, 1, 0, 0.04313726, 1,
2.623399, -2.052864, 1.761634, 1, 0, 0.03529412, 1,
2.700925, 2.07647, 1.483182, 1, 0, 0.03137255, 1,
2.701288, 1.384475, 2.719615, 1, 0, 0.02352941, 1,
2.845009, -1.067181, 1.066944, 1, 0, 0.01960784, 1,
2.998208, -3.135926, 0.6026472, 1, 0, 0.01176471, 1,
3.135105, 2.282303, 1.45545, 1, 0, 0.007843138, 1
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
-0.03405726, -4.5149, -8.2493, 0, -0.5, 0.5, 0.5,
-0.03405726, -4.5149, -8.2493, 1, -0.5, 0.5, 0.5,
-0.03405726, -4.5149, -8.2493, 1, 1.5, 0.5, 0.5,
-0.03405726, -4.5149, -8.2493, 0, 1.5, 0.5, 0.5
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
-4.277565, -0.1250213, -8.2493, 0, -0.5, 0.5, 0.5,
-4.277565, -0.1250213, -8.2493, 1, -0.5, 0.5, 0.5,
-4.277565, -0.1250213, -8.2493, 1, 1.5, 0.5, 0.5,
-4.277565, -0.1250213, -8.2493, 0, 1.5, 0.5, 0.5
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
-4.277565, -4.5149, -0.3584425, 0, -0.5, 0.5, 0.5,
-4.277565, -4.5149, -0.3584425, 1, -0.5, 0.5, 0.5,
-4.277565, -4.5149, -0.3584425, 1, 1.5, 0.5, 0.5,
-4.277565, -4.5149, -0.3584425, 0, 1.5, 0.5, 0.5
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
-3, -3.501851, -6.428333,
3, -3.501851, -6.428333,
-3, -3.501851, -6.428333,
-3, -3.670693, -6.731828,
-2, -3.501851, -6.428333,
-2, -3.670693, -6.731828,
-1, -3.501851, -6.428333,
-1, -3.670693, -6.731828,
0, -3.501851, -6.428333,
0, -3.670693, -6.731828,
1, -3.501851, -6.428333,
1, -3.670693, -6.731828,
2, -3.501851, -6.428333,
2, -3.670693, -6.731828,
3, -3.501851, -6.428333,
3, -3.670693, -6.731828
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
-3, -4.008376, -7.338817, 0, -0.5, 0.5, 0.5,
-3, -4.008376, -7.338817, 1, -0.5, 0.5, 0.5,
-3, -4.008376, -7.338817, 1, 1.5, 0.5, 0.5,
-3, -4.008376, -7.338817, 0, 1.5, 0.5, 0.5,
-2, -4.008376, -7.338817, 0, -0.5, 0.5, 0.5,
-2, -4.008376, -7.338817, 1, -0.5, 0.5, 0.5,
-2, -4.008376, -7.338817, 1, 1.5, 0.5, 0.5,
-2, -4.008376, -7.338817, 0, 1.5, 0.5, 0.5,
-1, -4.008376, -7.338817, 0, -0.5, 0.5, 0.5,
-1, -4.008376, -7.338817, 1, -0.5, 0.5, 0.5,
-1, -4.008376, -7.338817, 1, 1.5, 0.5, 0.5,
-1, -4.008376, -7.338817, 0, 1.5, 0.5, 0.5,
0, -4.008376, -7.338817, 0, -0.5, 0.5, 0.5,
0, -4.008376, -7.338817, 1, -0.5, 0.5, 0.5,
0, -4.008376, -7.338817, 1, 1.5, 0.5, 0.5,
0, -4.008376, -7.338817, 0, 1.5, 0.5, 0.5,
1, -4.008376, -7.338817, 0, -0.5, 0.5, 0.5,
1, -4.008376, -7.338817, 1, -0.5, 0.5, 0.5,
1, -4.008376, -7.338817, 1, 1.5, 0.5, 0.5,
1, -4.008376, -7.338817, 0, 1.5, 0.5, 0.5,
2, -4.008376, -7.338817, 0, -0.5, 0.5, 0.5,
2, -4.008376, -7.338817, 1, -0.5, 0.5, 0.5,
2, -4.008376, -7.338817, 1, 1.5, 0.5, 0.5,
2, -4.008376, -7.338817, 0, 1.5, 0.5, 0.5,
3, -4.008376, -7.338817, 0, -0.5, 0.5, 0.5,
3, -4.008376, -7.338817, 1, -0.5, 0.5, 0.5,
3, -4.008376, -7.338817, 1, 1.5, 0.5, 0.5,
3, -4.008376, -7.338817, 0, 1.5, 0.5, 0.5
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
-3.298294, -3, -6.428333,
-3.298294, 3, -6.428333,
-3.298294, -3, -6.428333,
-3.461506, -3, -6.731828,
-3.298294, -2, -6.428333,
-3.461506, -2, -6.731828,
-3.298294, -1, -6.428333,
-3.461506, -1, -6.731828,
-3.298294, 0, -6.428333,
-3.461506, 0, -6.731828,
-3.298294, 1, -6.428333,
-3.461506, 1, -6.731828,
-3.298294, 2, -6.428333,
-3.461506, 2, -6.731828,
-3.298294, 3, -6.428333,
-3.461506, 3, -6.731828
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
-3.78793, -3, -7.338817, 0, -0.5, 0.5, 0.5,
-3.78793, -3, -7.338817, 1, -0.5, 0.5, 0.5,
-3.78793, -3, -7.338817, 1, 1.5, 0.5, 0.5,
-3.78793, -3, -7.338817, 0, 1.5, 0.5, 0.5,
-3.78793, -2, -7.338817, 0, -0.5, 0.5, 0.5,
-3.78793, -2, -7.338817, 1, -0.5, 0.5, 0.5,
-3.78793, -2, -7.338817, 1, 1.5, 0.5, 0.5,
-3.78793, -2, -7.338817, 0, 1.5, 0.5, 0.5,
-3.78793, -1, -7.338817, 0, -0.5, 0.5, 0.5,
-3.78793, -1, -7.338817, 1, -0.5, 0.5, 0.5,
-3.78793, -1, -7.338817, 1, 1.5, 0.5, 0.5,
-3.78793, -1, -7.338817, 0, 1.5, 0.5, 0.5,
-3.78793, 0, -7.338817, 0, -0.5, 0.5, 0.5,
-3.78793, 0, -7.338817, 1, -0.5, 0.5, 0.5,
-3.78793, 0, -7.338817, 1, 1.5, 0.5, 0.5,
-3.78793, 0, -7.338817, 0, 1.5, 0.5, 0.5,
-3.78793, 1, -7.338817, 0, -0.5, 0.5, 0.5,
-3.78793, 1, -7.338817, 1, -0.5, 0.5, 0.5,
-3.78793, 1, -7.338817, 1, 1.5, 0.5, 0.5,
-3.78793, 1, -7.338817, 0, 1.5, 0.5, 0.5,
-3.78793, 2, -7.338817, 0, -0.5, 0.5, 0.5,
-3.78793, 2, -7.338817, 1, -0.5, 0.5, 0.5,
-3.78793, 2, -7.338817, 1, 1.5, 0.5, 0.5,
-3.78793, 2, -7.338817, 0, 1.5, 0.5, 0.5,
-3.78793, 3, -7.338817, 0, -0.5, 0.5, 0.5,
-3.78793, 3, -7.338817, 1, -0.5, 0.5, 0.5,
-3.78793, 3, -7.338817, 1, 1.5, 0.5, 0.5,
-3.78793, 3, -7.338817, 0, 1.5, 0.5, 0.5
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
-3.298294, -3.501851, -6,
-3.298294, -3.501851, 4,
-3.298294, -3.501851, -6,
-3.461506, -3.670693, -6,
-3.298294, -3.501851, -4,
-3.461506, -3.670693, -4,
-3.298294, -3.501851, -2,
-3.461506, -3.670693, -2,
-3.298294, -3.501851, 0,
-3.461506, -3.670693, 0,
-3.298294, -3.501851, 2,
-3.461506, -3.670693, 2,
-3.298294, -3.501851, 4,
-3.461506, -3.670693, 4
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
-3.78793, -4.008376, -6, 0, -0.5, 0.5, 0.5,
-3.78793, -4.008376, -6, 1, -0.5, 0.5, 0.5,
-3.78793, -4.008376, -6, 1, 1.5, 0.5, 0.5,
-3.78793, -4.008376, -6, 0, 1.5, 0.5, 0.5,
-3.78793, -4.008376, -4, 0, -0.5, 0.5, 0.5,
-3.78793, -4.008376, -4, 1, -0.5, 0.5, 0.5,
-3.78793, -4.008376, -4, 1, 1.5, 0.5, 0.5,
-3.78793, -4.008376, -4, 0, 1.5, 0.5, 0.5,
-3.78793, -4.008376, -2, 0, -0.5, 0.5, 0.5,
-3.78793, -4.008376, -2, 1, -0.5, 0.5, 0.5,
-3.78793, -4.008376, -2, 1, 1.5, 0.5, 0.5,
-3.78793, -4.008376, -2, 0, 1.5, 0.5, 0.5,
-3.78793, -4.008376, 0, 0, -0.5, 0.5, 0.5,
-3.78793, -4.008376, 0, 1, -0.5, 0.5, 0.5,
-3.78793, -4.008376, 0, 1, 1.5, 0.5, 0.5,
-3.78793, -4.008376, 0, 0, 1.5, 0.5, 0.5,
-3.78793, -4.008376, 2, 0, -0.5, 0.5, 0.5,
-3.78793, -4.008376, 2, 1, -0.5, 0.5, 0.5,
-3.78793, -4.008376, 2, 1, 1.5, 0.5, 0.5,
-3.78793, -4.008376, 2, 0, 1.5, 0.5, 0.5,
-3.78793, -4.008376, 4, 0, -0.5, 0.5, 0.5,
-3.78793, -4.008376, 4, 1, -0.5, 0.5, 0.5,
-3.78793, -4.008376, 4, 1, 1.5, 0.5, 0.5,
-3.78793, -4.008376, 4, 0, 1.5, 0.5, 0.5
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
-3.298294, -3.501851, -6.428333,
-3.298294, 3.251809, -6.428333,
-3.298294, -3.501851, 5.711448,
-3.298294, 3.251809, 5.711448,
-3.298294, -3.501851, -6.428333,
-3.298294, -3.501851, 5.711448,
-3.298294, 3.251809, -6.428333,
-3.298294, 3.251809, 5.711448,
-3.298294, -3.501851, -6.428333,
3.23018, -3.501851, -6.428333,
-3.298294, -3.501851, 5.711448,
3.23018, -3.501851, 5.711448,
-3.298294, 3.251809, -6.428333,
3.23018, 3.251809, -6.428333,
-3.298294, 3.251809, 5.711448,
3.23018, 3.251809, 5.711448,
3.23018, -3.501851, -6.428333,
3.23018, 3.251809, -6.428333,
3.23018, -3.501851, 5.711448,
3.23018, 3.251809, 5.711448,
3.23018, -3.501851, -6.428333,
3.23018, -3.501851, 5.711448,
3.23018, 3.251809, -6.428333,
3.23018, 3.251809, 5.711448
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
var radius = 8.196335;
var distance = 36.46642;
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
mvMatrix.translate( 0.03405726, 0.1250213, 0.3584425 );
mvMatrix.scale( 1.357444, 1.312183, 0.7299998 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.46642);
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

