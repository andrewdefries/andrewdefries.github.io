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
-3.632348, 0.552103, -2.177983, 1, 0, 0, 1,
-3.204797, -0.04173012, 1.467729, 1, 0.007843138, 0, 1,
-2.748239, 0.218179, -1.41636, 1, 0.01176471, 0, 1,
-2.72023, 0.2580683, 0.1245207, 1, 0.01960784, 0, 1,
-2.668746, 0.6402228, -2.289814, 1, 0.02352941, 0, 1,
-2.652466, -1.702035, -2.057582, 1, 0.03137255, 0, 1,
-2.548836, -1.06651, -2.141442, 1, 0.03529412, 0, 1,
-2.394569, 1.381175, 0.2910502, 1, 0.04313726, 0, 1,
-2.382154, 1.092418, -2.597371, 1, 0.04705882, 0, 1,
-2.338544, 0.5219061, -1.097605, 1, 0.05490196, 0, 1,
-2.240544, 1.446521, -1.198676, 1, 0.05882353, 0, 1,
-2.230664, -0.7902442, -1.695384, 1, 0.06666667, 0, 1,
-2.224305, 0.5956783, -1.532007, 1, 0.07058824, 0, 1,
-2.222389, -1.635545, -1.712973, 1, 0.07843138, 0, 1,
-2.201069, 0.4439014, -1.647054, 1, 0.08235294, 0, 1,
-2.167325, -0.2387625, -1.932629, 1, 0.09019608, 0, 1,
-2.161103, 0.3294402, -2.699517, 1, 0.09411765, 0, 1,
-2.15877, 1.045594, -1.522222, 1, 0.1019608, 0, 1,
-2.151575, -0.4807642, 0.3797106, 1, 0.1098039, 0, 1,
-2.102315, 0.9644585, -1.582724, 1, 0.1137255, 0, 1,
-2.092526, -1.495219, -2.360184, 1, 0.1215686, 0, 1,
-2.084491, -1.273189, -1.681998, 1, 0.1254902, 0, 1,
-2.075858, -0.3768341, -1.224739, 1, 0.1333333, 0, 1,
-2.069867, -0.3963078, -2.587882, 1, 0.1372549, 0, 1,
-2.064083, -1.89907, -1.016563, 1, 0.145098, 0, 1,
-2.049795, 0.6743556, -1.920448, 1, 0.1490196, 0, 1,
-2.048831, 0.5984484, -1.143386, 1, 0.1568628, 0, 1,
-2.045553, 0.3796887, -1.500537, 1, 0.1607843, 0, 1,
-2.038456, -0.308156, -2.378452, 1, 0.1686275, 0, 1,
-2.024102, -0.2564768, -3.072758, 1, 0.172549, 0, 1,
-2.005021, -1.516082, -1.733063, 1, 0.1803922, 0, 1,
-1.999542, -0.5337746, -1.320032, 1, 0.1843137, 0, 1,
-1.990891, 1.313787, -1.682058, 1, 0.1921569, 0, 1,
-1.988928, 0.8415606, -2.399802, 1, 0.1960784, 0, 1,
-1.986198, 1.034465, -0.08710831, 1, 0.2039216, 0, 1,
-1.967515, -0.08935904, -3.232144, 1, 0.2117647, 0, 1,
-1.918911, -2.110871, -1.516573, 1, 0.2156863, 0, 1,
-1.905519, -1.310442, -1.200731, 1, 0.2235294, 0, 1,
-1.891077, 1.433649, -0.3535437, 1, 0.227451, 0, 1,
-1.878651, -0.1479353, -0.07862524, 1, 0.2352941, 0, 1,
-1.863867, -0.3705759, -0.2829921, 1, 0.2392157, 0, 1,
-1.862809, 0.09744897, -2.782912, 1, 0.2470588, 0, 1,
-1.859511, 1.27364, -0.1199954, 1, 0.2509804, 0, 1,
-1.84478, -1.345811, -4.648189, 1, 0.2588235, 0, 1,
-1.840772, -0.7080203, -0.4857229, 1, 0.2627451, 0, 1,
-1.82724, -1.565947, -2.027764, 1, 0.2705882, 0, 1,
-1.82328, 0.8374348, -0.4893523, 1, 0.2745098, 0, 1,
-1.821557, 1.384816, -0.9232605, 1, 0.282353, 0, 1,
-1.813984, 0.5686455, -2.494729, 1, 0.2862745, 0, 1,
-1.798, -1.723937, -1.782576, 1, 0.2941177, 0, 1,
-1.789187, 0.2580558, -1.525952, 1, 0.3019608, 0, 1,
-1.780388, 0.4912339, -0.2291224, 1, 0.3058824, 0, 1,
-1.780246, 0.7412234, -2.24027, 1, 0.3137255, 0, 1,
-1.758557, 0.4848265, -0.05261027, 1, 0.3176471, 0, 1,
-1.750939, 0.3865149, -0.09422064, 1, 0.3254902, 0, 1,
-1.750203, -0.06041312, -1.495054, 1, 0.3294118, 0, 1,
-1.74642, 0.1049976, -0.9200962, 1, 0.3372549, 0, 1,
-1.73713, 0.9919026, -1.366991, 1, 0.3411765, 0, 1,
-1.730935, -1.280479, -0.4826273, 1, 0.3490196, 0, 1,
-1.708219, 0.6492965, -0.5213419, 1, 0.3529412, 0, 1,
-1.695412, 2.364385, 0.5132459, 1, 0.3607843, 0, 1,
-1.692026, -0.2141596, -0.2208263, 1, 0.3647059, 0, 1,
-1.691778, 1.000499, -1.240644, 1, 0.372549, 0, 1,
-1.677601, -0.04295926, -1.26198, 1, 0.3764706, 0, 1,
-1.674291, -1.51928, -1.971012, 1, 0.3843137, 0, 1,
-1.671766, -1.256021, -1.205864, 1, 0.3882353, 0, 1,
-1.648206, 0.577925, -1.370591, 1, 0.3960784, 0, 1,
-1.646989, -0.3022065, -2.002457, 1, 0.4039216, 0, 1,
-1.616802, 1.034394, -2.413927, 1, 0.4078431, 0, 1,
-1.616526, 2.428422, -0.6738288, 1, 0.4156863, 0, 1,
-1.613776, -0.5424716, -1.454536, 1, 0.4196078, 0, 1,
-1.610532, 0.1632297, -1.863001, 1, 0.427451, 0, 1,
-1.605299, 0.1983069, -2.479182, 1, 0.4313726, 0, 1,
-1.601081, -1.007049, -3.309362, 1, 0.4392157, 0, 1,
-1.592395, -1.541782, -3.001454, 1, 0.4431373, 0, 1,
-1.590888, -0.1385018, -0.3658145, 1, 0.4509804, 0, 1,
-1.587054, -0.787317, -3.398065, 1, 0.454902, 0, 1,
-1.548149, -1.043909, -3.36362, 1, 0.4627451, 0, 1,
-1.54096, -1.833512, -1.237869, 1, 0.4666667, 0, 1,
-1.537467, 0.5007188, -1.241371, 1, 0.4745098, 0, 1,
-1.520849, -0.7715104, -1.999049, 1, 0.4784314, 0, 1,
-1.509426, -0.03763209, -1.751129, 1, 0.4862745, 0, 1,
-1.507496, -1.650944, -3.892184, 1, 0.4901961, 0, 1,
-1.496633, 0.3357925, -0.01216153, 1, 0.4980392, 0, 1,
-1.494959, 0.1409349, -0.2693632, 1, 0.5058824, 0, 1,
-1.492053, -1.376422, -1.611947, 1, 0.509804, 0, 1,
-1.48892, -0.6967949, -1.89325, 1, 0.5176471, 0, 1,
-1.488518, -0.7887033, -2.32189, 1, 0.5215687, 0, 1,
-1.484603, 0.52049, -0.586287, 1, 0.5294118, 0, 1,
-1.477661, 1.112645, -1.453883, 1, 0.5333334, 0, 1,
-1.471515, -0.1945658, -0.9152355, 1, 0.5411765, 0, 1,
-1.462539, 0.2776901, -2.308051, 1, 0.5450981, 0, 1,
-1.458945, -0.2155097, -3.444536, 1, 0.5529412, 0, 1,
-1.452187, -0.5075287, -2.724621, 1, 0.5568628, 0, 1,
-1.437947, -0.2392221, 0.8613861, 1, 0.5647059, 0, 1,
-1.433885, 0.6904604, -1.024643, 1, 0.5686275, 0, 1,
-1.422684, -1.919911, -1.931347, 1, 0.5764706, 0, 1,
-1.422563, 0.9385617, -1.769269, 1, 0.5803922, 0, 1,
-1.417395, 0.0296234, -4.659056, 1, 0.5882353, 0, 1,
-1.404709, -1.507224, -3.70029, 1, 0.5921569, 0, 1,
-1.353903, 1.400982, -1.764276, 1, 0.6, 0, 1,
-1.343209, -0.4594901, -1.741651, 1, 0.6078432, 0, 1,
-1.340245, -1.067565, -2.59235, 1, 0.6117647, 0, 1,
-1.339207, 0.7118228, -1.507826, 1, 0.6196079, 0, 1,
-1.335449, -0.9426495, -3.003274, 1, 0.6235294, 0, 1,
-1.334229, 0.5628405, 0.208541, 1, 0.6313726, 0, 1,
-1.326399, 0.5841033, -1.797783, 1, 0.6352941, 0, 1,
-1.321824, -0.5982592, -1.234091, 1, 0.6431373, 0, 1,
-1.321454, 1.438513, -0.7933696, 1, 0.6470588, 0, 1,
-1.320733, 2.060318, 0.3567587, 1, 0.654902, 0, 1,
-1.317354, -0.3641664, -2.783545, 1, 0.6588235, 0, 1,
-1.305746, 0.7504283, -0.4654461, 1, 0.6666667, 0, 1,
-1.302679, 1.421628, -0.3593094, 1, 0.6705883, 0, 1,
-1.301413, -0.04132353, -1.202683, 1, 0.6784314, 0, 1,
-1.287832, -0.02107826, -1.205301, 1, 0.682353, 0, 1,
-1.263044, 0.5418698, 0.5824742, 1, 0.6901961, 0, 1,
-1.259122, -0.5520863, -2.581451, 1, 0.6941177, 0, 1,
-1.242122, 0.3733704, -2.168959, 1, 0.7019608, 0, 1,
-1.226011, -0.6121934, -2.510927, 1, 0.7098039, 0, 1,
-1.225137, -1.12354, -1.653989, 1, 0.7137255, 0, 1,
-1.219122, 0.2647311, -1.80143, 1, 0.7215686, 0, 1,
-1.20861, 0.01974368, -1.118989, 1, 0.7254902, 0, 1,
-1.205717, -0.4725957, -0.8201865, 1, 0.7333333, 0, 1,
-1.205231, 1.020302, -1.314075, 1, 0.7372549, 0, 1,
-1.198284, 0.4449885, -0.3783901, 1, 0.7450981, 0, 1,
-1.187091, -0.2205781, -1.405792, 1, 0.7490196, 0, 1,
-1.18402, -0.7452947, -2.502608, 1, 0.7568628, 0, 1,
-1.172844, -1.380145, -2.301129, 1, 0.7607843, 0, 1,
-1.171252, -0.9159603, -2.451238, 1, 0.7686275, 0, 1,
-1.168268, -0.06761493, -1.351088, 1, 0.772549, 0, 1,
-1.159904, 0.4736683, 1.448702, 1, 0.7803922, 0, 1,
-1.152429, -1.032806, -2.233736, 1, 0.7843137, 0, 1,
-1.14622, 1.278406, -0.6766888, 1, 0.7921569, 0, 1,
-1.14588, 0.3010323, -0.0877756, 1, 0.7960784, 0, 1,
-1.141488, -0.6568151, -0.7266074, 1, 0.8039216, 0, 1,
-1.140097, -0.05424976, -1.48208, 1, 0.8117647, 0, 1,
-1.136665, 0.05838711, -0.2520916, 1, 0.8156863, 0, 1,
-1.135948, -0.0407789, -1.359629, 1, 0.8235294, 0, 1,
-1.13516, -0.8869293, -2.396467, 1, 0.827451, 0, 1,
-1.134924, 0.1327718, -1.721075, 1, 0.8352941, 0, 1,
-1.134628, -0.5738841, -0.7959456, 1, 0.8392157, 0, 1,
-1.130792, 0.8624538, -0.0499259, 1, 0.8470588, 0, 1,
-1.127522, -0.9020547, -2.564675, 1, 0.8509804, 0, 1,
-1.123409, -0.5033379, -1.348486, 1, 0.8588235, 0, 1,
-1.120084, -1.598361, -3.526238, 1, 0.8627451, 0, 1,
-1.10682, -0.888922, -1.384731, 1, 0.8705882, 0, 1,
-1.100952, -0.7428269, -2.700686, 1, 0.8745098, 0, 1,
-1.088818, 1.151568, -0.552227, 1, 0.8823529, 0, 1,
-1.085691, -0.2516799, -2.168934, 1, 0.8862745, 0, 1,
-1.085558, 0.2675262, -0.3010882, 1, 0.8941177, 0, 1,
-1.082046, -0.5726484, -2.388747, 1, 0.8980392, 0, 1,
-1.07837, -0.3620723, -3.633021, 1, 0.9058824, 0, 1,
-1.077356, -0.2232435, -1.553154, 1, 0.9137255, 0, 1,
-1.07295, 0.07593872, -2.89416, 1, 0.9176471, 0, 1,
-1.068481, -0.04367293, -0.5461038, 1, 0.9254902, 0, 1,
-1.068399, 0.9620716, -1.839359, 1, 0.9294118, 0, 1,
-1.066737, -0.3208024, -1.149256, 1, 0.9372549, 0, 1,
-1.055662, -0.3297728, -2.798656, 1, 0.9411765, 0, 1,
-1.054189, -0.1852743, -0.9397468, 1, 0.9490196, 0, 1,
-1.052616, 0.3348544, -0.4439012, 1, 0.9529412, 0, 1,
-1.049377, 0.01849503, -3.147175, 1, 0.9607843, 0, 1,
-1.048805, -0.2183075, -1.584839, 1, 0.9647059, 0, 1,
-1.047086, -0.07039203, -2.011578, 1, 0.972549, 0, 1,
-1.041675, -0.812799, -3.825046, 1, 0.9764706, 0, 1,
-1.036867, -1.290065, -2.379349, 1, 0.9843137, 0, 1,
-1.032506, -1.149116, -3.091736, 1, 0.9882353, 0, 1,
-1.031842, -0.0513486, -1.371568, 1, 0.9960784, 0, 1,
-1.027808, -0.420113, -1.821665, 0.9960784, 1, 0, 1,
-1.025898, 1.472516, -0.03489052, 0.9921569, 1, 0, 1,
-1.007707, 1.524355, 0.4167881, 0.9843137, 1, 0, 1,
-1.002231, 1.467263, -0.4878112, 0.9803922, 1, 0, 1,
-0.9991174, 0.325101, 0.6046982, 0.972549, 1, 0, 1,
-0.9973117, -0.2142015, -1.179636, 0.9686275, 1, 0, 1,
-0.9968742, 1.209613, -0.7019301, 0.9607843, 1, 0, 1,
-0.9964736, -0.6318148, 0.7580402, 0.9568627, 1, 0, 1,
-0.9922734, -0.8261157, -3.611012, 0.9490196, 1, 0, 1,
-0.991157, 0.516138, -2.147678, 0.945098, 1, 0, 1,
-0.9859144, -0.6641724, -1.45101, 0.9372549, 1, 0, 1,
-0.9842457, -0.1644297, -2.903176, 0.9333333, 1, 0, 1,
-0.9826797, 0.9482957, -1.481416, 0.9254902, 1, 0, 1,
-0.9767926, 0.06407019, -2.085947, 0.9215686, 1, 0, 1,
-0.973072, 1.266363, -0.7470298, 0.9137255, 1, 0, 1,
-0.9717301, 0.7214525, -2.000779, 0.9098039, 1, 0, 1,
-0.9677172, 1.663918, 0.09697815, 0.9019608, 1, 0, 1,
-0.9670256, -0.7305029, -1.875838, 0.8941177, 1, 0, 1,
-0.9665296, 0.7888154, -0.6319988, 0.8901961, 1, 0, 1,
-0.9616778, -0.4883453, -1.499745, 0.8823529, 1, 0, 1,
-0.9586173, -0.496076, -2.765393, 0.8784314, 1, 0, 1,
-0.9558438, 2.041752, -1.155905, 0.8705882, 1, 0, 1,
-0.9532684, -1.499006, -2.966736, 0.8666667, 1, 0, 1,
-0.9485617, -0.3378748, -3.409266, 0.8588235, 1, 0, 1,
-0.943455, -1.22268, -1.616889, 0.854902, 1, 0, 1,
-0.9427387, 1.258581, 0.146617, 0.8470588, 1, 0, 1,
-0.942055, -1.003095, -1.308945, 0.8431373, 1, 0, 1,
-0.9400917, 0.01814646, -1.74363, 0.8352941, 1, 0, 1,
-0.9174949, -1.532056, -0.6395727, 0.8313726, 1, 0, 1,
-0.9158015, 1.980709, -0.03539501, 0.8235294, 1, 0, 1,
-0.915028, -0.8864375, -0.4286136, 0.8196079, 1, 0, 1,
-0.9102082, -0.04617018, -1.203423, 0.8117647, 1, 0, 1,
-0.9097968, 0.9210454, -0.7418348, 0.8078431, 1, 0, 1,
-0.9076779, -2.923091, -3.424152, 0.8, 1, 0, 1,
-0.9035767, -0.5850555, -0.3881565, 0.7921569, 1, 0, 1,
-0.9035712, -0.6460587, -1.779206, 0.7882353, 1, 0, 1,
-0.8992795, -0.9274541, -3.150538, 0.7803922, 1, 0, 1,
-0.8774385, 1.316772, 0.7427219, 0.7764706, 1, 0, 1,
-0.8762679, -0.5302822, -1.732956, 0.7686275, 1, 0, 1,
-0.8756727, 1.113155, 1.236566, 0.7647059, 1, 0, 1,
-0.8730233, -0.4508742, -1.48575, 0.7568628, 1, 0, 1,
-0.872554, -1.386239, -2.347383, 0.7529412, 1, 0, 1,
-0.868266, -0.2743215, -1.406891, 0.7450981, 1, 0, 1,
-0.8670484, 0.3234189, -1.793527, 0.7411765, 1, 0, 1,
-0.8642634, 0.6997384, -0.06436279, 0.7333333, 1, 0, 1,
-0.8608533, -1.614823, -3.397643, 0.7294118, 1, 0, 1,
-0.8602983, 0.5630913, -0.5424945, 0.7215686, 1, 0, 1,
-0.8566608, 0.06717854, -2.546117, 0.7176471, 1, 0, 1,
-0.8564162, 0.8875966, -1.20315, 0.7098039, 1, 0, 1,
-0.8493484, -0.3410324, -1.413872, 0.7058824, 1, 0, 1,
-0.84801, -1.15431, -2.069788, 0.6980392, 1, 0, 1,
-0.8354733, 0.1614232, -2.035631, 0.6901961, 1, 0, 1,
-0.831993, -1.321775, -2.284815, 0.6862745, 1, 0, 1,
-0.8319319, 0.556883, -1.522972, 0.6784314, 1, 0, 1,
-0.8297189, 1.003015, -1.452267, 0.6745098, 1, 0, 1,
-0.8280143, -0.2735263, 0.1875924, 0.6666667, 1, 0, 1,
-0.8271186, -0.1069775, -3.074467, 0.6627451, 1, 0, 1,
-0.8163541, -0.03862973, -0.8120419, 0.654902, 1, 0, 1,
-0.8149099, -1.012545, -3.297746, 0.6509804, 1, 0, 1,
-0.811402, 1.29166, -1.271357, 0.6431373, 1, 0, 1,
-0.8096098, 0.2917656, -1.469502, 0.6392157, 1, 0, 1,
-0.8012647, 0.2106846, -0.7071109, 0.6313726, 1, 0, 1,
-0.8000038, 0.8508421, -1.3293, 0.627451, 1, 0, 1,
-0.7954341, -0.1080105, -4.179574, 0.6196079, 1, 0, 1,
-0.7944538, 0.3560188, -1.29678, 0.6156863, 1, 0, 1,
-0.7941903, 0.3058822, -2.582331, 0.6078432, 1, 0, 1,
-0.7903032, 0.3679744, -2.14343, 0.6039216, 1, 0, 1,
-0.7880731, -0.1240913, -2.616025, 0.5960785, 1, 0, 1,
-0.7842099, -0.08598849, -0.9365326, 0.5882353, 1, 0, 1,
-0.7827675, -0.107981, -1.088926, 0.5843138, 1, 0, 1,
-0.7732278, -0.4650527, -1.155455, 0.5764706, 1, 0, 1,
-0.7642582, 1.35701, -0.5326039, 0.572549, 1, 0, 1,
-0.7615354, -0.9292683, -3.168966, 0.5647059, 1, 0, 1,
-0.7593194, -0.7301478, -1.705616, 0.5607843, 1, 0, 1,
-0.7574545, 1.010786, -0.005006897, 0.5529412, 1, 0, 1,
-0.7521221, -2.040967, -5.027227, 0.5490196, 1, 0, 1,
-0.7463008, 0.402255, -1.438569, 0.5411765, 1, 0, 1,
-0.7389051, -0.7394843, -3.893009, 0.5372549, 1, 0, 1,
-0.7382901, -1.958477, -3.323298, 0.5294118, 1, 0, 1,
-0.73357, 0.1603865, -0.5040223, 0.5254902, 1, 0, 1,
-0.7329208, -0.2227206, -0.9808487, 0.5176471, 1, 0, 1,
-0.7253252, 0.5114023, -0.5955744, 0.5137255, 1, 0, 1,
-0.714401, -0.8963018, -1.811994, 0.5058824, 1, 0, 1,
-0.7085536, -1.598898, -4.922307, 0.5019608, 1, 0, 1,
-0.706361, -0.5210491, -0.9987146, 0.4941176, 1, 0, 1,
-0.7015614, -0.1661162, 0.2603639, 0.4862745, 1, 0, 1,
-0.701377, -1.873475, -1.830422, 0.4823529, 1, 0, 1,
-0.7011001, 0.8213997, 0.9257134, 0.4745098, 1, 0, 1,
-0.6987349, -1.50255, -1.988977, 0.4705882, 1, 0, 1,
-0.6900175, 1.598195, -0.4483094, 0.4627451, 1, 0, 1,
-0.6889049, -0.6691363, -3.573114, 0.4588235, 1, 0, 1,
-0.677759, 0.9866676, -0.4845016, 0.4509804, 1, 0, 1,
-0.6750129, -0.1880161, -1.47081, 0.4470588, 1, 0, 1,
-0.6718835, -1.77116, -2.20096, 0.4392157, 1, 0, 1,
-0.6676196, -1.432068, -4.19606, 0.4352941, 1, 0, 1,
-0.6655641, 0.6549892, -1.551904, 0.427451, 1, 0, 1,
-0.6635622, 0.05406391, -1.819298, 0.4235294, 1, 0, 1,
-0.6554822, 0.5666964, 0.5579879, 0.4156863, 1, 0, 1,
-0.6536809, -0.4316756, -1.360535, 0.4117647, 1, 0, 1,
-0.6508356, 1.3644, -0.9028645, 0.4039216, 1, 0, 1,
-0.6489221, 0.1752447, -2.334322, 0.3960784, 1, 0, 1,
-0.6472358, 0.4167722, -1.684716, 0.3921569, 1, 0, 1,
-0.6469889, 0.4956819, -1.416762, 0.3843137, 1, 0, 1,
-0.6456615, 0.7649444, -2.316914, 0.3803922, 1, 0, 1,
-0.644882, -1.085152, -3.011154, 0.372549, 1, 0, 1,
-0.6422564, 1.608706, 1.87857, 0.3686275, 1, 0, 1,
-0.6408466, -0.001075444, -1.621823, 0.3607843, 1, 0, 1,
-0.6384022, 1.869286, 0.7263546, 0.3568628, 1, 0, 1,
-0.6367612, 0.09754867, -0.6880656, 0.3490196, 1, 0, 1,
-0.6332455, -0.9987393, -2.300109, 0.345098, 1, 0, 1,
-0.6319126, -1.450376, -4.097982, 0.3372549, 1, 0, 1,
-0.6280968, 2.315938, -0.1849656, 0.3333333, 1, 0, 1,
-0.6272285, 0.2163099, -1.482976, 0.3254902, 1, 0, 1,
-0.6244044, 0.2317939, -1.544847, 0.3215686, 1, 0, 1,
-0.6208685, 0.3084285, -1.74864, 0.3137255, 1, 0, 1,
-0.6129928, -0.2942057, -0.325947, 0.3098039, 1, 0, 1,
-0.6054198, -1.333226, -1.876579, 0.3019608, 1, 0, 1,
-0.6053095, -0.3372852, -0.9504364, 0.2941177, 1, 0, 1,
-0.6039336, 0.06437016, -2.33198, 0.2901961, 1, 0, 1,
-0.5932752, -0.8726541, -4.255777, 0.282353, 1, 0, 1,
-0.5924988, -0.08302982, -0.6734082, 0.2784314, 1, 0, 1,
-0.5923774, -0.05883616, -1.627784, 0.2705882, 1, 0, 1,
-0.5908564, -0.0558705, -3.079687, 0.2666667, 1, 0, 1,
-0.5861795, 0.4424064, -2.592332, 0.2588235, 1, 0, 1,
-0.5850909, 0.3352905, -2.036055, 0.254902, 1, 0, 1,
-0.5826095, -0.6899515, -2.444722, 0.2470588, 1, 0, 1,
-0.5762229, -0.6827375, -2.086525, 0.2431373, 1, 0, 1,
-0.5728377, 0.4580612, -1.888148, 0.2352941, 1, 0, 1,
-0.5707399, -0.4206703, -3.245927, 0.2313726, 1, 0, 1,
-0.5696047, -0.3790326, -3.857943, 0.2235294, 1, 0, 1,
-0.5594788, 2.821914, -0.7113842, 0.2196078, 1, 0, 1,
-0.5568686, 1.272144, -0.3838662, 0.2117647, 1, 0, 1,
-0.5554782, 2.521772, 0.3531812, 0.2078431, 1, 0, 1,
-0.5544461, -0.7587199, -2.842403, 0.2, 1, 0, 1,
-0.5536914, 0.06857111, -2.100487, 0.1921569, 1, 0, 1,
-0.5535717, -0.0236342, -0.732438, 0.1882353, 1, 0, 1,
-0.549524, 0.07884325, -0.177407, 0.1803922, 1, 0, 1,
-0.5492718, 1.331961, 0.2191417, 0.1764706, 1, 0, 1,
-0.547288, 0.5852901, -0.01615004, 0.1686275, 1, 0, 1,
-0.5451784, 0.5734073, 0.3712453, 0.1647059, 1, 0, 1,
-0.5416699, 0.495324, -0.4752824, 0.1568628, 1, 0, 1,
-0.5414178, 0.4457304, -0.9400603, 0.1529412, 1, 0, 1,
-0.5378563, 0.4313553, -1.105682, 0.145098, 1, 0, 1,
-0.5374108, -0.5850435, -1.434356, 0.1411765, 1, 0, 1,
-0.5287113, -0.1560936, -1.324003, 0.1333333, 1, 0, 1,
-0.5286793, -0.4007206, -2.256671, 0.1294118, 1, 0, 1,
-0.5154426, -0.5888788, -2.246473, 0.1215686, 1, 0, 1,
-0.5145589, -0.1657284, -0.04039271, 0.1176471, 1, 0, 1,
-0.5138327, 0.996322, -0.1741001, 0.1098039, 1, 0, 1,
-0.5136917, -1.306885, -3.026141, 0.1058824, 1, 0, 1,
-0.5044988, 0.6589555, -1.988887, 0.09803922, 1, 0, 1,
-0.5034061, 0.09782244, -1.99167, 0.09019608, 1, 0, 1,
-0.5012401, -0.2107749, -1.156813, 0.08627451, 1, 0, 1,
-0.5010853, -1.571145, -2.096797, 0.07843138, 1, 0, 1,
-0.5005248, -0.3473058, -2.344196, 0.07450981, 1, 0, 1,
-0.4974601, 0.05548035, -0.8101923, 0.06666667, 1, 0, 1,
-0.4945997, 1.915224, 0.03174851, 0.0627451, 1, 0, 1,
-0.4935251, -0.04803027, -1.971212, 0.05490196, 1, 0, 1,
-0.4934389, -0.301557, -2.041371, 0.05098039, 1, 0, 1,
-0.4900684, 1.454901, -2.107627, 0.04313726, 1, 0, 1,
-0.4875544, 0.5439839, -1.121103, 0.03921569, 1, 0, 1,
-0.4848808, 0.2850366, -2.482641, 0.03137255, 1, 0, 1,
-0.4824278, -2.877201, -4.102117, 0.02745098, 1, 0, 1,
-0.4805483, 1.366227, 0.4637524, 0.01960784, 1, 0, 1,
-0.4782797, 0.3549496, -0.8920217, 0.01568628, 1, 0, 1,
-0.4755307, -0.4199409, -2.418966, 0.007843138, 1, 0, 1,
-0.4680103, 0.9822918, -0.03765885, 0.003921569, 1, 0, 1,
-0.4678562, 1.168474, -2.283142, 0, 1, 0.003921569, 1,
-0.4655415, -1.746152, -2.527141, 0, 1, 0.01176471, 1,
-0.4644066, -0.4029676, -2.23183, 0, 1, 0.01568628, 1,
-0.463384, -0.7205198, -2.465256, 0, 1, 0.02352941, 1,
-0.4622914, -0.3255696, -0.5272183, 0, 1, 0.02745098, 1,
-0.45804, -0.1130615, -2.042054, 0, 1, 0.03529412, 1,
-0.4565858, 0.3904647, 1.172291, 0, 1, 0.03921569, 1,
-0.4563431, 0.6719376, 0.102978, 0, 1, 0.04705882, 1,
-0.4557946, 1.111684, -0.6160532, 0, 1, 0.05098039, 1,
-0.448655, 0.8316249, -1.023095, 0, 1, 0.05882353, 1,
-0.4480438, -0.5053094, -1.129994, 0, 1, 0.0627451, 1,
-0.4468631, -0.03337913, -1.256448, 0, 1, 0.07058824, 1,
-0.4454756, -1.116351, -1.855185, 0, 1, 0.07450981, 1,
-0.4441773, -0.3360056, -3.224389, 0, 1, 0.08235294, 1,
-0.4377656, 0.9704866, 0.4642312, 0, 1, 0.08627451, 1,
-0.4303127, 0.08920034, -1.936996, 0, 1, 0.09411765, 1,
-0.4245903, -0.1630671, -3.035283, 0, 1, 0.1019608, 1,
-0.4228735, 0.3022281, -1.312349, 0, 1, 0.1058824, 1,
-0.4214656, -0.2022481, -0.5538353, 0, 1, 0.1137255, 1,
-0.4153617, 0.4326046, -1.61873, 0, 1, 0.1176471, 1,
-0.412532, 1.641949, 0.4218458, 0, 1, 0.1254902, 1,
-0.4121696, -0.071043, -2.362389, 0, 1, 0.1294118, 1,
-0.4116686, -1.001948, -5.092456, 0, 1, 0.1372549, 1,
-0.4087257, 0.09943286, -0.8719454, 0, 1, 0.1411765, 1,
-0.403301, 0.6141902, -0.06497697, 0, 1, 0.1490196, 1,
-0.4032645, 0.9491897, 0.500438, 0, 1, 0.1529412, 1,
-0.4016937, -0.1622258, -2.950904, 0, 1, 0.1607843, 1,
-0.3985676, -0.5446829, -3.785614, 0, 1, 0.1647059, 1,
-0.3960981, 0.8069459, -0.6518433, 0, 1, 0.172549, 1,
-0.3865702, 1.265165, -1.623496, 0, 1, 0.1764706, 1,
-0.3815576, 1.602626, 0.2076385, 0, 1, 0.1843137, 1,
-0.3801831, -1.672863, -2.892776, 0, 1, 0.1882353, 1,
-0.3747043, -0.4098473, -1.71438, 0, 1, 0.1960784, 1,
-0.3730611, -0.4793661, -1.450475, 0, 1, 0.2039216, 1,
-0.3682454, 1.054676, 0.3253013, 0, 1, 0.2078431, 1,
-0.365282, 0.5911943, -0.7277131, 0, 1, 0.2156863, 1,
-0.356906, -0.2719589, -2.201101, 0, 1, 0.2196078, 1,
-0.3550161, -0.4050179, -2.850377, 0, 1, 0.227451, 1,
-0.3500916, 0.4977324, 0.290669, 0, 1, 0.2313726, 1,
-0.3499133, -0.7855195, -2.464766, 0, 1, 0.2392157, 1,
-0.3479294, -0.6640426, -2.014011, 0, 1, 0.2431373, 1,
-0.3464061, -1.793524, -2.882198, 0, 1, 0.2509804, 1,
-0.3455574, -1.248491, -2.668138, 0, 1, 0.254902, 1,
-0.34321, 1.047617, -1.164013, 0, 1, 0.2627451, 1,
-0.3416193, -0.03156495, -2.601401, 0, 1, 0.2666667, 1,
-0.3407498, 0.7830458, -0.9786884, 0, 1, 0.2745098, 1,
-0.3405006, -1.420962, -2.803884, 0, 1, 0.2784314, 1,
-0.3404764, 0.2838711, 0.3740828, 0, 1, 0.2862745, 1,
-0.3375224, 0.9219283, -1.073161, 0, 1, 0.2901961, 1,
-0.3366931, 0.1119004, -0.1602484, 0, 1, 0.2980392, 1,
-0.3340001, -0.04861464, -1.060002, 0, 1, 0.3058824, 1,
-0.3329737, 0.6543857, -0.08809891, 0, 1, 0.3098039, 1,
-0.3316799, 1.030306, -0.2225047, 0, 1, 0.3176471, 1,
-0.3294183, -0.8331219, -3.51919, 0, 1, 0.3215686, 1,
-0.326936, -0.3989612, -2.436738, 0, 1, 0.3294118, 1,
-0.3257221, 0.2798302, -0.7157856, 0, 1, 0.3333333, 1,
-0.3251742, -1.031412, -2.114264, 0, 1, 0.3411765, 1,
-0.3248432, 1.102694, 0.4831944, 0, 1, 0.345098, 1,
-0.3230305, -1.407969, -2.233594, 0, 1, 0.3529412, 1,
-0.3221727, -0.236652, 0.1018622, 0, 1, 0.3568628, 1,
-0.3143297, 0.2381366, -1.301724, 0, 1, 0.3647059, 1,
-0.3136007, 0.4739432, -0.8156288, 0, 1, 0.3686275, 1,
-0.3123466, -0.4807507, -3.023589, 0, 1, 0.3764706, 1,
-0.3119805, 0.5788324, -0.2797199, 0, 1, 0.3803922, 1,
-0.3107163, -1.711001, -3.306625, 0, 1, 0.3882353, 1,
-0.3098769, 0.07124034, -1.105587, 0, 1, 0.3921569, 1,
-0.3087852, -0.3285866, -2.855165, 0, 1, 0.4, 1,
-0.3062356, -0.4386877, -2.346147, 0, 1, 0.4078431, 1,
-0.3050072, -1.147745, -3.920786, 0, 1, 0.4117647, 1,
-0.3046871, -2.422256, -4.237347, 0, 1, 0.4196078, 1,
-0.2993694, 0.1793845, -1.844744, 0, 1, 0.4235294, 1,
-0.2926299, 0.06996365, -1.541533, 0, 1, 0.4313726, 1,
-0.2877877, 0.3119034, 0.7833393, 0, 1, 0.4352941, 1,
-0.2877087, -1.729975, -2.03324, 0, 1, 0.4431373, 1,
-0.283531, 1.014449, 0.1534418, 0, 1, 0.4470588, 1,
-0.2813503, 0.6001136, -0.4238045, 0, 1, 0.454902, 1,
-0.280481, 0.2594546, 0.7107064, 0, 1, 0.4588235, 1,
-0.2768818, -0.6877792, -2.625021, 0, 1, 0.4666667, 1,
-0.2766701, -1.016878, -4.19042, 0, 1, 0.4705882, 1,
-0.2722365, 0.02956298, -3.367036, 0, 1, 0.4784314, 1,
-0.2703235, 0.6589047, 0.9470645, 0, 1, 0.4823529, 1,
-0.2700352, 0.7297524, -0.8689559, 0, 1, 0.4901961, 1,
-0.2652143, -0.04941213, -1.755224, 0, 1, 0.4941176, 1,
-0.2619318, -0.0514215, -0.836813, 0, 1, 0.5019608, 1,
-0.2600619, 0.9089843, -0.3449464, 0, 1, 0.509804, 1,
-0.2592114, -0.53167, -1.47113, 0, 1, 0.5137255, 1,
-0.2527544, -0.7831431, -1.816582, 0, 1, 0.5215687, 1,
-0.2505471, 0.892287, 0.05289188, 0, 1, 0.5254902, 1,
-0.2485878, -0.8999535, -2.43112, 0, 1, 0.5333334, 1,
-0.2452221, -0.6094203, -3.073645, 0, 1, 0.5372549, 1,
-0.2432367, 0.6827559, -0.4118657, 0, 1, 0.5450981, 1,
-0.2421243, -1.164148, -3.027617, 0, 1, 0.5490196, 1,
-0.2371004, -0.3678242, -4.014461, 0, 1, 0.5568628, 1,
-0.2300483, -0.1548025, -3.013253, 0, 1, 0.5607843, 1,
-0.2272041, -0.8790998, -1.412079, 0, 1, 0.5686275, 1,
-0.2188997, 0.002321593, -1.582875, 0, 1, 0.572549, 1,
-0.2182915, -0.4521052, -3.101261, 0, 1, 0.5803922, 1,
-0.2180984, 0.01927541, -2.040872, 0, 1, 0.5843138, 1,
-0.2149034, 0.09545657, -0.9516225, 0, 1, 0.5921569, 1,
-0.2136631, 1.194958, -0.2530125, 0, 1, 0.5960785, 1,
-0.2060464, -0.7564999, -2.606115, 0, 1, 0.6039216, 1,
-0.2012241, -1.060525, -1.792743, 0, 1, 0.6117647, 1,
-0.2003782, -0.5554119, -4.599559, 0, 1, 0.6156863, 1,
-0.1979167, -0.9515443, -1.673147, 0, 1, 0.6235294, 1,
-0.1964086, 0.7570105, -0.3870184, 0, 1, 0.627451, 1,
-0.196293, -1.879717, -3.338046, 0, 1, 0.6352941, 1,
-0.1938417, -0.01110495, -1.658498, 0, 1, 0.6392157, 1,
-0.1929173, -0.5863871, -3.369462, 0, 1, 0.6470588, 1,
-0.190449, 0.929413, -1.248593, 0, 1, 0.6509804, 1,
-0.1869334, -0.1118409, -2.466981, 0, 1, 0.6588235, 1,
-0.1820405, 0.6284715, -1.685227, 0, 1, 0.6627451, 1,
-0.1782668, -0.553951, -2.286838, 0, 1, 0.6705883, 1,
-0.174058, 0.4243048, -1.246879, 0, 1, 0.6745098, 1,
-0.1679547, 1.356393, 0.008523336, 0, 1, 0.682353, 1,
-0.1669827, 0.4276942, -0.1959425, 0, 1, 0.6862745, 1,
-0.1623682, 0.1244793, -0.7930935, 0, 1, 0.6941177, 1,
-0.1619647, 0.4885022, 0.684735, 0, 1, 0.7019608, 1,
-0.1578495, 0.5237957, -1.004836, 0, 1, 0.7058824, 1,
-0.1533823, 0.1231663, 0.4610552, 0, 1, 0.7137255, 1,
-0.1524888, -1.021468, -3.986063, 0, 1, 0.7176471, 1,
-0.1518175, -2.345334, -1.804792, 0, 1, 0.7254902, 1,
-0.1461555, 0.7348318, 0.04699514, 0, 1, 0.7294118, 1,
-0.1388861, -1.327738, -4.535863, 0, 1, 0.7372549, 1,
-0.1359628, -1.660634, -2.615893, 0, 1, 0.7411765, 1,
-0.1329131, -0.5300453, -1.901559, 0, 1, 0.7490196, 1,
-0.1294195, -0.05871828, -3.046081, 0, 1, 0.7529412, 1,
-0.1292456, -0.510466, -3.581727, 0, 1, 0.7607843, 1,
-0.1291314, -0.6996377, -2.5709, 0, 1, 0.7647059, 1,
-0.128927, 1.307239, 0.4512935, 0, 1, 0.772549, 1,
-0.1287611, -1.252299, -1.28385, 0, 1, 0.7764706, 1,
-0.1277809, -1.242482, -2.536124, 0, 1, 0.7843137, 1,
-0.1268414, 0.4354242, -1.043255, 0, 1, 0.7882353, 1,
-0.1253038, 0.9921766, -0.9406235, 0, 1, 0.7960784, 1,
-0.1247357, -0.2349873, -3.997589, 0, 1, 0.8039216, 1,
-0.1240525, 0.5413094, 1.011629, 0, 1, 0.8078431, 1,
-0.1234467, 0.5193604, 0.08355317, 0, 1, 0.8156863, 1,
-0.1203346, -0.3305226, -1.78083, 0, 1, 0.8196079, 1,
-0.1199997, 1.017727, -0.5226204, 0, 1, 0.827451, 1,
-0.1173918, 1.430802, 1.564827, 0, 1, 0.8313726, 1,
-0.1159341, 0.2589775, -0.4210807, 0, 1, 0.8392157, 1,
-0.1142168, -1.172586, -2.216593, 0, 1, 0.8431373, 1,
-0.1126569, 0.5264219, -2.939687, 0, 1, 0.8509804, 1,
-0.1097863, -0.2182418, -2.697013, 0, 1, 0.854902, 1,
-0.1093734, -0.9876286, -2.092725, 0, 1, 0.8627451, 1,
-0.1036743, 0.5723455, 0.3180009, 0, 1, 0.8666667, 1,
-0.1011251, -0.1469615, -2.340276, 0, 1, 0.8745098, 1,
-0.100172, -0.3771517, -3.72761, 0, 1, 0.8784314, 1,
-0.09944184, 2.150643, 0.8923639, 0, 1, 0.8862745, 1,
-0.0946063, -0.6462624, -2.647956, 0, 1, 0.8901961, 1,
-0.09184808, 0.1282977, -0.3253088, 0, 1, 0.8980392, 1,
-0.09053582, -0.1215508, -3.002272, 0, 1, 0.9058824, 1,
-0.08581265, -0.5671471, -2.027993, 0, 1, 0.9098039, 1,
-0.07959552, -0.6198102, -2.270691, 0, 1, 0.9176471, 1,
-0.07767931, -0.9741499, -5.209488, 0, 1, 0.9215686, 1,
-0.07340587, -0.6333217, -4.620458, 0, 1, 0.9294118, 1,
-0.07212401, 1.958282, 0.5775877, 0, 1, 0.9333333, 1,
-0.06939477, -1.459519, -4.372407, 0, 1, 0.9411765, 1,
-0.06779252, 1.038464, 1.736761, 0, 1, 0.945098, 1,
-0.06601276, 1.570197, -1.052383, 0, 1, 0.9529412, 1,
-0.06196394, -0.2558424, -2.596023, 0, 1, 0.9568627, 1,
-0.06128256, -1.349985, -4.2774, 0, 1, 0.9647059, 1,
-0.06122772, 1.118941, -0.4163876, 0, 1, 0.9686275, 1,
-0.05911025, -0.5086998, -2.441434, 0, 1, 0.9764706, 1,
-0.05835544, -0.2903129, -3.071471, 0, 1, 0.9803922, 1,
-0.05713776, 0.2492056, -0.6055613, 0, 1, 0.9882353, 1,
-0.05663273, -0.4096444, -4.597075, 0, 1, 0.9921569, 1,
-0.05097185, 0.9823726, 0.1900681, 0, 1, 1, 1,
-0.05068509, -0.3152741, -2.6101, 0, 0.9921569, 1, 1,
-0.05005001, 0.6466288, -0.7717979, 0, 0.9882353, 1, 1,
-0.04752681, 0.07757714, -1.253479, 0, 0.9803922, 1, 1,
-0.04318815, -0.5450378, -2.791082, 0, 0.9764706, 1, 1,
-0.04128307, -1.069085, -2.697799, 0, 0.9686275, 1, 1,
-0.04122522, -1.099743, -4.656361, 0, 0.9647059, 1, 1,
-0.0402811, 0.5255064, 0.2208312, 0, 0.9568627, 1, 1,
-0.03718458, 0.6385763, -0.8927774, 0, 0.9529412, 1, 1,
-0.02409582, -0.3654772, -1.919823, 0, 0.945098, 1, 1,
-0.02215123, 0.137865, -1.520259, 0, 0.9411765, 1, 1,
-0.01991738, 0.6313996, -0.8988226, 0, 0.9333333, 1, 1,
-0.01766786, -0.347766, -3.049529, 0, 0.9294118, 1, 1,
-0.01706565, 0.7377982, 0.05551996, 0, 0.9215686, 1, 1,
-0.01697209, -0.1826946, -3.729203, 0, 0.9176471, 1, 1,
-0.01458346, 0.3767465, -1.148125, 0, 0.9098039, 1, 1,
-0.01345992, -0.1256435, -3.215197, 0, 0.9058824, 1, 1,
-0.01035304, 1.239094, -0.8065237, 0, 0.8980392, 1, 1,
-0.01026321, -1.073608, -4.418444, 0, 0.8901961, 1, 1,
-0.01013338, -0.7620124, -1.723387, 0, 0.8862745, 1, 1,
-0.009826078, -0.3363902, -3.516917, 0, 0.8784314, 1, 1,
-0.008614965, -0.554117, -5.362637, 0, 0.8745098, 1, 1,
-0.008236805, 0.7050411, 0.4767227, 0, 0.8666667, 1, 1,
-0.005005997, -0.2857467, -2.080328, 0, 0.8627451, 1, 1,
-0.003736706, -0.1567886, -2.485288, 0, 0.854902, 1, 1,
-0.001987281, 0.7605296, -1.371765, 0, 0.8509804, 1, 1,
-0.0002297085, 0.8397356, -0.01241201, 0, 0.8431373, 1, 1,
0.0009446465, -1.00524, 3.551614, 0, 0.8392157, 1, 1,
0.01142075, -0.09641057, 0.7168832, 0, 0.8313726, 1, 1,
0.01433896, -0.6893792, 3.130161, 0, 0.827451, 1, 1,
0.01446093, 0.3805448, -0.2203057, 0, 0.8196079, 1, 1,
0.01470874, 1.117438, -0.698533, 0, 0.8156863, 1, 1,
0.01548643, -0.558375, 4.602873, 0, 0.8078431, 1, 1,
0.01793201, 0.218699, -0.5303992, 0, 0.8039216, 1, 1,
0.0189542, -0.5900676, 3.034668, 0, 0.7960784, 1, 1,
0.02232581, 0.1063374, -0.6063563, 0, 0.7882353, 1, 1,
0.02960468, 0.7247649, 0.03286325, 0, 0.7843137, 1, 1,
0.0308779, -0.1346339, 3.154444, 0, 0.7764706, 1, 1,
0.0390519, -1.255279, 3.194725, 0, 0.772549, 1, 1,
0.04319448, 1.082645, 0.1417494, 0, 0.7647059, 1, 1,
0.04423762, -0.2754734, 1.166283, 0, 0.7607843, 1, 1,
0.04656846, -1.35717, 3.418587, 0, 0.7529412, 1, 1,
0.05159181, 0.5686191, -1.512229, 0, 0.7490196, 1, 1,
0.05169252, 0.1650625, 0.2918302, 0, 0.7411765, 1, 1,
0.05377245, 0.1992437, 1.926952, 0, 0.7372549, 1, 1,
0.05571663, -1.976333, 2.934999, 0, 0.7294118, 1, 1,
0.06035934, 0.4937565, 0.3603545, 0, 0.7254902, 1, 1,
0.06108397, -0.3543963, 4.388805, 0, 0.7176471, 1, 1,
0.06156963, 1.613282, 0.7245604, 0, 0.7137255, 1, 1,
0.06342494, 1.176093, 0.7169772, 0, 0.7058824, 1, 1,
0.06375045, -1.512937, 2.148636, 0, 0.6980392, 1, 1,
0.06513556, -1.258003, 3.520343, 0, 0.6941177, 1, 1,
0.06697193, 0.07553568, -0.09754568, 0, 0.6862745, 1, 1,
0.07305284, 0.5541857, -0.8712395, 0, 0.682353, 1, 1,
0.0874012, -1.689304, 1.887996, 0, 0.6745098, 1, 1,
0.09293582, 1.896887, -0.2447463, 0, 0.6705883, 1, 1,
0.09869947, 0.5775261, -0.09016414, 0, 0.6627451, 1, 1,
0.09924048, -1.317114, 4.304728, 0, 0.6588235, 1, 1,
0.09955879, -2.372798, 3.424829, 0, 0.6509804, 1, 1,
0.1008015, 0.02199382, 1.511367, 0, 0.6470588, 1, 1,
0.1032946, 1.043832, 0.276609, 0, 0.6392157, 1, 1,
0.1070557, 1.269084, -1.174643, 0, 0.6352941, 1, 1,
0.1073302, -0.6756303, 2.518401, 0, 0.627451, 1, 1,
0.1098015, 0.9306325, 1.381491, 0, 0.6235294, 1, 1,
0.1115231, -0.3755946, 2.245021, 0, 0.6156863, 1, 1,
0.1132939, 0.516246, 1.380272, 0, 0.6117647, 1, 1,
0.1140339, -0.6437939, 5.76953, 0, 0.6039216, 1, 1,
0.1184682, 0.4234259, 1.331463, 0, 0.5960785, 1, 1,
0.1238468, 0.1253461, 1.128917, 0, 0.5921569, 1, 1,
0.125496, -0.1000525, 2.891441, 0, 0.5843138, 1, 1,
0.1274074, -0.1616191, 2.577374, 0, 0.5803922, 1, 1,
0.1295405, 0.3938619, 0.2608881, 0, 0.572549, 1, 1,
0.1317342, -0.592308, 2.821698, 0, 0.5686275, 1, 1,
0.1333751, 0.1892476, 1.472221, 0, 0.5607843, 1, 1,
0.1346494, -0.1659545, 0.5492552, 0, 0.5568628, 1, 1,
0.1396596, -0.8752785, 3.583878, 0, 0.5490196, 1, 1,
0.140095, -1.449432, 3.205145, 0, 0.5450981, 1, 1,
0.1488086, -2.02589, 3.010849, 0, 0.5372549, 1, 1,
0.1511347, 0.01349751, 3.936187, 0, 0.5333334, 1, 1,
0.1544374, 1.251931, -0.8228133, 0, 0.5254902, 1, 1,
0.1546518, 1.79628, 0.5743464, 0, 0.5215687, 1, 1,
0.1652378, -1.099723, 3.911383, 0, 0.5137255, 1, 1,
0.1662422, -0.8180295, 1.237151, 0, 0.509804, 1, 1,
0.1678172, -0.4483505, 3.187406, 0, 0.5019608, 1, 1,
0.1699086, -0.05424544, 2.576858, 0, 0.4941176, 1, 1,
0.1755608, -0.9020452, 2.5111, 0, 0.4901961, 1, 1,
0.1763982, 1.111639, 0.6063931, 0, 0.4823529, 1, 1,
0.1774869, -0.07346221, 2.402624, 0, 0.4784314, 1, 1,
0.1850961, -1.312491, 2.742138, 0, 0.4705882, 1, 1,
0.1862136, 0.6729826, 0.5574435, 0, 0.4666667, 1, 1,
0.1892374, -1.699352, 3.42316, 0, 0.4588235, 1, 1,
0.1932226, 0.1172856, -0.1301178, 0, 0.454902, 1, 1,
0.19529, 0.3640071, -1.015057, 0, 0.4470588, 1, 1,
0.1967886, 0.5472075, -0.5017114, 0, 0.4431373, 1, 1,
0.1981006, -1.169385, 2.925493, 0, 0.4352941, 1, 1,
0.2022817, 0.7695019, 0.2294499, 0, 0.4313726, 1, 1,
0.204473, 1.559144, 1.192195, 0, 0.4235294, 1, 1,
0.2095745, -0.3337384, 1.258583, 0, 0.4196078, 1, 1,
0.2109676, -0.5664813, 3.665547, 0, 0.4117647, 1, 1,
0.2133101, -1.166948, 3.910566, 0, 0.4078431, 1, 1,
0.2275251, 1.318769, -0.8574069, 0, 0.4, 1, 1,
0.2367659, -0.01859288, 1.00773, 0, 0.3921569, 1, 1,
0.2375978, 0.8771433, -0.9892809, 0, 0.3882353, 1, 1,
0.2391156, 0.1469271, 1.336652, 0, 0.3803922, 1, 1,
0.246022, -0.9679768, 3.932198, 0, 0.3764706, 1, 1,
0.246611, 0.004055591, 1.628803, 0, 0.3686275, 1, 1,
0.2466961, 0.4151469, 0.1684736, 0, 0.3647059, 1, 1,
0.2474688, -0.350345, 3.055232, 0, 0.3568628, 1, 1,
0.25669, -0.09874874, 1.980062, 0, 0.3529412, 1, 1,
0.2593139, -1.214468, 3.134951, 0, 0.345098, 1, 1,
0.2643132, -0.8749664, 2.990777, 0, 0.3411765, 1, 1,
0.2659959, 0.2018028, 1.121964, 0, 0.3333333, 1, 1,
0.2676939, 1.045958, 0.7503886, 0, 0.3294118, 1, 1,
0.2733686, 0.750774, 0.8204022, 0, 0.3215686, 1, 1,
0.2756639, -1.266742, 2.060438, 0, 0.3176471, 1, 1,
0.2761556, -1.585968, 2.818467, 0, 0.3098039, 1, 1,
0.279265, -0.1064238, 1.400714, 0, 0.3058824, 1, 1,
0.2859163, 0.2054381, -0.03059831, 0, 0.2980392, 1, 1,
0.2876125, 0.1763869, 0.235856, 0, 0.2901961, 1, 1,
0.2903453, -0.6977987, 2.539645, 0, 0.2862745, 1, 1,
0.2905081, 0.8917549, -0.0133387, 0, 0.2784314, 1, 1,
0.2973329, -2.041902, 2.02111, 0, 0.2745098, 1, 1,
0.2980911, -0.9296292, 3.145672, 0, 0.2666667, 1, 1,
0.3032257, 0.4085238, 0.09677857, 0, 0.2627451, 1, 1,
0.3071731, -1.312409, 2.277681, 0, 0.254902, 1, 1,
0.308731, -2.033628, 2.341322, 0, 0.2509804, 1, 1,
0.3121235, 1.295603, 1.19387, 0, 0.2431373, 1, 1,
0.3160083, -1.201735, 3.858263, 0, 0.2392157, 1, 1,
0.3192629, 0.1480185, 1.132741, 0, 0.2313726, 1, 1,
0.3216906, -1.947482, 3.522054, 0, 0.227451, 1, 1,
0.3338171, 0.9570563, 2.018304, 0, 0.2196078, 1, 1,
0.3359008, 0.6908043, -0.03973381, 0, 0.2156863, 1, 1,
0.3359394, 0.1389478, 0.07874469, 0, 0.2078431, 1, 1,
0.3368187, -0.1281707, 1.283917, 0, 0.2039216, 1, 1,
0.3370838, 1.028955, 1.254484, 0, 0.1960784, 1, 1,
0.3376904, 1.029679, 0.8092339, 0, 0.1882353, 1, 1,
0.3390706, 0.05998453, -0.333845, 0, 0.1843137, 1, 1,
0.339623, -1.122765, 2.330348, 0, 0.1764706, 1, 1,
0.3400633, 0.6392295, 0.1744341, 0, 0.172549, 1, 1,
0.3407621, 0.0001600212, 0.1815739, 0, 0.1647059, 1, 1,
0.3418615, 0.4070432, 1.347969, 0, 0.1607843, 1, 1,
0.3480033, 0.6738165, 0.8851413, 0, 0.1529412, 1, 1,
0.3480773, -0.5991755, 3.083891, 0, 0.1490196, 1, 1,
0.3501807, -1.238151, 1.828346, 0, 0.1411765, 1, 1,
0.351213, 0.5009028, -0.6225222, 0, 0.1372549, 1, 1,
0.3513407, -0.2179437, 2.363209, 0, 0.1294118, 1, 1,
0.3520125, 1.067226, -0.7667448, 0, 0.1254902, 1, 1,
0.3532663, -0.2832135, 2.316987, 0, 0.1176471, 1, 1,
0.3545438, -0.9531022, 1.663417, 0, 0.1137255, 1, 1,
0.3591019, 0.3495263, 0.8358575, 0, 0.1058824, 1, 1,
0.3670814, 0.1438598, 1.870295, 0, 0.09803922, 1, 1,
0.3684621, -0.4715554, 1.032264, 0, 0.09411765, 1, 1,
0.3703152, -0.8144831, 1.607797, 0, 0.08627451, 1, 1,
0.3703564, -0.1659626, 2.018185, 0, 0.08235294, 1, 1,
0.3708521, -1.201736, 2.84989, 0, 0.07450981, 1, 1,
0.3722083, -0.06938002, -1.263355, 0, 0.07058824, 1, 1,
0.3729801, -1.861601, 4.553156, 0, 0.0627451, 1, 1,
0.3751647, 0.1413629, -0.2851635, 0, 0.05882353, 1, 1,
0.378562, -0.4061937, 3.775831, 0, 0.05098039, 1, 1,
0.3827027, 0.8075809, 0.7823015, 0, 0.04705882, 1, 1,
0.3853227, 1.11483, -0.895772, 0, 0.03921569, 1, 1,
0.3890894, 0.3697588, 0.7829397, 0, 0.03529412, 1, 1,
0.3899484, -0.3013103, 1.301908, 0, 0.02745098, 1, 1,
0.3900818, -0.5986892, 1.710791, 0, 0.02352941, 1, 1,
0.3916032, 0.2246506, 2.826345, 0, 0.01568628, 1, 1,
0.3932477, 0.05252241, 2.179572, 0, 0.01176471, 1, 1,
0.3939553, 0.6609932, 1.042121, 0, 0.003921569, 1, 1,
0.3941169, -0.3982176, 1.470147, 0.003921569, 0, 1, 1,
0.3961415, 0.2766032, 0.9601226, 0.007843138, 0, 1, 1,
0.3971817, -0.3955465, 2.292109, 0.01568628, 0, 1, 1,
0.3991106, 1.135754, 3.520117, 0.01960784, 0, 1, 1,
0.4090433, -0.1741578, 0.540098, 0.02745098, 0, 1, 1,
0.4130946, 0.01277002, 2.308059, 0.03137255, 0, 1, 1,
0.4158014, 1.672153, -0.4877961, 0.03921569, 0, 1, 1,
0.4161316, -0.4836431, 2.569066, 0.04313726, 0, 1, 1,
0.420633, 1.116057, -0.6934435, 0.05098039, 0, 1, 1,
0.4237959, 0.02203765, 2.554284, 0.05490196, 0, 1, 1,
0.4314133, 0.3076322, -0.7475001, 0.0627451, 0, 1, 1,
0.432053, 0.5146812, 1.377827, 0.06666667, 0, 1, 1,
0.434018, 0.3836488, 1.977765, 0.07450981, 0, 1, 1,
0.4353429, 0.7184833, -0.4248157, 0.07843138, 0, 1, 1,
0.4384365, 0.5551496, 0.875903, 0.08627451, 0, 1, 1,
0.4392339, -1.285361, 3.794254, 0.09019608, 0, 1, 1,
0.4469631, 1.602543, -0.5032498, 0.09803922, 0, 1, 1,
0.4532242, -0.3487041, 1.732085, 0.1058824, 0, 1, 1,
0.4551562, 0.5025898, 1.858465, 0.1098039, 0, 1, 1,
0.4614508, -0.2610739, 3.237402, 0.1176471, 0, 1, 1,
0.4639225, 0.9384453, -0.4039207, 0.1215686, 0, 1, 1,
0.4641264, 0.8719343, -1.290968, 0.1294118, 0, 1, 1,
0.4699123, 2.469282, -0.09911375, 0.1333333, 0, 1, 1,
0.4724921, -1.98039, 0.04783686, 0.1411765, 0, 1, 1,
0.4752748, 0.2843212, 1.956098, 0.145098, 0, 1, 1,
0.487353, 0.02033833, 4.746666, 0.1529412, 0, 1, 1,
0.4887309, 0.0650541, 0.6851144, 0.1568628, 0, 1, 1,
0.4902017, 1.803983, 0.8982646, 0.1647059, 0, 1, 1,
0.4924135, -0.8623047, 2.855366, 0.1686275, 0, 1, 1,
0.4940972, -1.164503, 2.297988, 0.1764706, 0, 1, 1,
0.4949901, -0.9318063, 3.122703, 0.1803922, 0, 1, 1,
0.4959173, -1.545211, 4.40204, 0.1882353, 0, 1, 1,
0.4973535, 1.231764, -1.359897, 0.1921569, 0, 1, 1,
0.4990654, 0.3593408, 0.3817905, 0.2, 0, 1, 1,
0.5117244, 0.09634106, 0.4275472, 0.2078431, 0, 1, 1,
0.51352, 0.3122529, -0.4613934, 0.2117647, 0, 1, 1,
0.5144081, -0.3771771, 3.095764, 0.2196078, 0, 1, 1,
0.5217218, -1.381478, 3.503569, 0.2235294, 0, 1, 1,
0.5220259, -0.76661, 3.582027, 0.2313726, 0, 1, 1,
0.5245988, 0.1240063, 0.2843929, 0.2352941, 0, 1, 1,
0.5262644, -1.908483, 4.078747, 0.2431373, 0, 1, 1,
0.5314083, 1.32248, 0.4207582, 0.2470588, 0, 1, 1,
0.5319561, -0.7671943, 1.526237, 0.254902, 0, 1, 1,
0.5320755, -0.7949098, 3.583686, 0.2588235, 0, 1, 1,
0.5323494, 2.002649, -0.3852338, 0.2666667, 0, 1, 1,
0.5336745, 0.04382912, 1.759396, 0.2705882, 0, 1, 1,
0.5437165, -0.7723898, 3.160893, 0.2784314, 0, 1, 1,
0.5443425, -0.1447197, 1.31216, 0.282353, 0, 1, 1,
0.5443723, -0.1120758, 2.690724, 0.2901961, 0, 1, 1,
0.554743, 0.5298005, 2.163971, 0.2941177, 0, 1, 1,
0.5593939, -0.01118733, 1.782475, 0.3019608, 0, 1, 1,
0.5594137, -0.7264532, 3.464544, 0.3098039, 0, 1, 1,
0.560342, 1.09378, 1.375239, 0.3137255, 0, 1, 1,
0.560934, -0.6510771, 1.221293, 0.3215686, 0, 1, 1,
0.5623531, 0.2315384, -0.2357708, 0.3254902, 0, 1, 1,
0.5667006, 1.025513, -0.6073841, 0.3333333, 0, 1, 1,
0.5673248, 1.453242, -0.5398476, 0.3372549, 0, 1, 1,
0.5704281, 0.6827462, 1.26619, 0.345098, 0, 1, 1,
0.5707409, 0.1647194, -0.06570154, 0.3490196, 0, 1, 1,
0.5752432, 0.8739001, -0.8448481, 0.3568628, 0, 1, 1,
0.5814804, 0.345437, 1.778032, 0.3607843, 0, 1, 1,
0.5819978, 0.1078987, 2.783091, 0.3686275, 0, 1, 1,
0.5836247, -0.7191373, 1.779774, 0.372549, 0, 1, 1,
0.5838772, 0.9026714, 2.052374, 0.3803922, 0, 1, 1,
0.5868841, 0.8694667, 1.015657, 0.3843137, 0, 1, 1,
0.5881908, -0.7247073, 3.476397, 0.3921569, 0, 1, 1,
0.5896197, -0.9214613, 4.573196, 0.3960784, 0, 1, 1,
0.593448, -0.4907988, 4.236213, 0.4039216, 0, 1, 1,
0.5941438, 0.5434521, -0.2693323, 0.4117647, 0, 1, 1,
0.5948609, 1.045455, 1.571529, 0.4156863, 0, 1, 1,
0.600327, -0.2417736, 1.793354, 0.4235294, 0, 1, 1,
0.6013469, -0.1928084, 3.369473, 0.427451, 0, 1, 1,
0.6025654, 0.5910639, 0.9981394, 0.4352941, 0, 1, 1,
0.6051428, -1.031265, 3.065418, 0.4392157, 0, 1, 1,
0.6060327, -0.9304713, 1.747423, 0.4470588, 0, 1, 1,
0.6103991, -0.1111742, 1.346486, 0.4509804, 0, 1, 1,
0.6115484, -0.477991, 2.667512, 0.4588235, 0, 1, 1,
0.6177429, 0.2664276, 2.621282, 0.4627451, 0, 1, 1,
0.6275336, -0.6001611, 2.753926, 0.4705882, 0, 1, 1,
0.6280032, -0.2322746, 2.27054, 0.4745098, 0, 1, 1,
0.6292269, 0.1323825, 1.101173, 0.4823529, 0, 1, 1,
0.6394247, 0.09313131, 1.073321, 0.4862745, 0, 1, 1,
0.6536938, 1.334265, 0.2842051, 0.4941176, 0, 1, 1,
0.6588585, 2.183586, 1.205573, 0.5019608, 0, 1, 1,
0.6628938, -0.5744135, 2.055079, 0.5058824, 0, 1, 1,
0.6667098, 0.4792956, -1.905597, 0.5137255, 0, 1, 1,
0.673052, -0.5320495, 2.728892, 0.5176471, 0, 1, 1,
0.6741022, -0.3053716, 2.551283, 0.5254902, 0, 1, 1,
0.6742271, -0.5091596, 2.459971, 0.5294118, 0, 1, 1,
0.6745303, -0.1630935, 2.985863, 0.5372549, 0, 1, 1,
0.675122, 0.2515187, 1.912863, 0.5411765, 0, 1, 1,
0.6771964, 0.8716784, 0.273201, 0.5490196, 0, 1, 1,
0.6827367, -1.219232, 1.606837, 0.5529412, 0, 1, 1,
0.6835597, 0.1363605, 1.46432, 0.5607843, 0, 1, 1,
0.6879461, -0.4824979, 1.194998, 0.5647059, 0, 1, 1,
0.6883464, 1.494072, 2.310961, 0.572549, 0, 1, 1,
0.6923716, -0.2979928, 3.41132, 0.5764706, 0, 1, 1,
0.6938066, 0.8617809, -0.3713961, 0.5843138, 0, 1, 1,
0.6961178, 1.292965, 1.668564, 0.5882353, 0, 1, 1,
0.7029744, 0.4049577, 0.2832713, 0.5960785, 0, 1, 1,
0.7035893, 0.3701546, 3.432606, 0.6039216, 0, 1, 1,
0.704161, -0.3042811, 0.8372685, 0.6078432, 0, 1, 1,
0.7068449, -0.04779484, 1.227215, 0.6156863, 0, 1, 1,
0.7071095, 0.9409635, -0.0479218, 0.6196079, 0, 1, 1,
0.710785, -0.3132455, 1.440671, 0.627451, 0, 1, 1,
0.7115339, -1.334391, 2.681067, 0.6313726, 0, 1, 1,
0.7117628, 0.4055633, 1.386538, 0.6392157, 0, 1, 1,
0.7130712, 1.03517, 1.261626, 0.6431373, 0, 1, 1,
0.7158136, -0.08175592, 0.9603074, 0.6509804, 0, 1, 1,
0.7229071, -0.2604803, 2.385882, 0.654902, 0, 1, 1,
0.727841, -0.6074221, 1.781836, 0.6627451, 0, 1, 1,
0.7321389, 1.245147, 0.7900915, 0.6666667, 0, 1, 1,
0.7338511, 0.4832808, -1.590573, 0.6745098, 0, 1, 1,
0.7349559, -0.1516661, 0.6603523, 0.6784314, 0, 1, 1,
0.7353661, -0.7104819, 3.093242, 0.6862745, 0, 1, 1,
0.7358544, -0.3675465, 1.61469, 0.6901961, 0, 1, 1,
0.7370835, 0.2220247, 0.5501981, 0.6980392, 0, 1, 1,
0.7398565, 0.4634431, 1.608724, 0.7058824, 0, 1, 1,
0.7427009, -1.527676, 4.965051, 0.7098039, 0, 1, 1,
0.7484564, 0.6017835, 1.091626, 0.7176471, 0, 1, 1,
0.7667927, 0.6143088, 0.3969815, 0.7215686, 0, 1, 1,
0.7683628, 1.240739, 0.39972, 0.7294118, 0, 1, 1,
0.769311, -0.231205, 1.570706, 0.7333333, 0, 1, 1,
0.7706921, -0.384412, 2.85729, 0.7411765, 0, 1, 1,
0.7826599, 1.222133, -0.6829095, 0.7450981, 0, 1, 1,
0.7893828, -0.381284, 2.488958, 0.7529412, 0, 1, 1,
0.7931265, -0.1609918, 2.355558, 0.7568628, 0, 1, 1,
0.8031092, 3.110879, 0.8800141, 0.7647059, 0, 1, 1,
0.803931, -0.8079912, 1.021086, 0.7686275, 0, 1, 1,
0.8102905, -0.6958115, 3.40872, 0.7764706, 0, 1, 1,
0.8114551, -0.128614, 1.332259, 0.7803922, 0, 1, 1,
0.8176324, 0.9862502, -1.772372, 0.7882353, 0, 1, 1,
0.8192775, -0.7825937, 2.428835, 0.7921569, 0, 1, 1,
0.8222982, -0.7497082, -1.360331, 0.8, 0, 1, 1,
0.8226768, -0.25858, 1.239345, 0.8078431, 0, 1, 1,
0.8251655, -0.1414451, 1.073096, 0.8117647, 0, 1, 1,
0.8294812, 0.2180304, 0.7412158, 0.8196079, 0, 1, 1,
0.8305605, 0.301908, 2.786561, 0.8235294, 0, 1, 1,
0.8351861, -2.234204, 3.126588, 0.8313726, 0, 1, 1,
0.8404162, -0.205429, 3.402478, 0.8352941, 0, 1, 1,
0.8432688, -1.0002, 2.316867, 0.8431373, 0, 1, 1,
0.8440833, -0.724337, 2.064071, 0.8470588, 0, 1, 1,
0.8510747, 0.4219214, -0.2656902, 0.854902, 0, 1, 1,
0.8533003, 0.1807579, 1.822939, 0.8588235, 0, 1, 1,
0.854275, -0.3162556, 1.969922, 0.8666667, 0, 1, 1,
0.8573689, 0.5751405, 1.334166, 0.8705882, 0, 1, 1,
0.8703712, 0.6579951, 0.3623907, 0.8784314, 0, 1, 1,
0.8778479, 0.2191338, 1.771227, 0.8823529, 0, 1, 1,
0.8840746, -0.6340014, 2.457623, 0.8901961, 0, 1, 1,
0.8941608, 0.8508758, 1.394639, 0.8941177, 0, 1, 1,
0.8966552, -0.1425658, 2.805866, 0.9019608, 0, 1, 1,
0.9016291, 0.4162682, 0.8148992, 0.9098039, 0, 1, 1,
0.902226, -0.4586079, 2.477994, 0.9137255, 0, 1, 1,
0.9053261, -1.238173, 2.776109, 0.9215686, 0, 1, 1,
0.9067456, -2.548332, 3.867266, 0.9254902, 0, 1, 1,
0.9161654, 0.8295798, 1.629747, 0.9333333, 0, 1, 1,
0.9173992, 0.6317148, 3.824702, 0.9372549, 0, 1, 1,
0.9179285, 0.4263414, 0.6038441, 0.945098, 0, 1, 1,
0.9194865, -1.047347, 2.506333, 0.9490196, 0, 1, 1,
0.9295584, -1.145391, 0.9392924, 0.9568627, 0, 1, 1,
0.9317974, -1.238873, 2.246862, 0.9607843, 0, 1, 1,
0.9526395, 1.044442, 2.368804, 0.9686275, 0, 1, 1,
0.9543065, -1.115567, 2.364183, 0.972549, 0, 1, 1,
0.9582838, -0.5157279, 4.315559, 0.9803922, 0, 1, 1,
0.9590377, 0.3561254, 2.526312, 0.9843137, 0, 1, 1,
0.959163, 0.1279987, 1.046413, 0.9921569, 0, 1, 1,
0.9613167, 0.5864981, 0.1586671, 0.9960784, 0, 1, 1,
0.9679846, 0.1212469, 0.1692693, 1, 0, 0.9960784, 1,
0.9696031, -0.5833064, 1.72786, 1, 0, 0.9882353, 1,
0.9735014, 1.264083, 1.87796, 1, 0, 0.9843137, 1,
0.9774496, 0.3848162, 1.259688, 1, 0, 0.9764706, 1,
0.9841446, 0.8253865, 1.28155, 1, 0, 0.972549, 1,
0.9869328, -0.8588364, 1.979023, 1, 0, 0.9647059, 1,
1.004557, 1.147067, -0.5405855, 1, 0, 0.9607843, 1,
1.012993, 0.1780412, 1.895408, 1, 0, 0.9529412, 1,
1.020713, 1.328099, 2.188461, 1, 0, 0.9490196, 1,
1.026202, -0.5728386, 3.033666, 1, 0, 0.9411765, 1,
1.031815, -0.7820378, 2.431121, 1, 0, 0.9372549, 1,
1.036734, -0.4548393, 2.473063, 1, 0, 0.9294118, 1,
1.037432, 1.360392, 1.839281, 1, 0, 0.9254902, 1,
1.039654, 0.6198448, 1.025576, 1, 0, 0.9176471, 1,
1.041158, 0.07826857, 2.024114, 1, 0, 0.9137255, 1,
1.046117, 1.27069, 1.807137, 1, 0, 0.9058824, 1,
1.054962, 1.73038, 2.04124, 1, 0, 0.9019608, 1,
1.056054, -0.1800134, 2.810419, 1, 0, 0.8941177, 1,
1.059229, -2.475565, 2.851047, 1, 0, 0.8862745, 1,
1.059369, 0.7064427, 2.277672, 1, 0, 0.8823529, 1,
1.060575, -0.4005195, 1.55718, 1, 0, 0.8745098, 1,
1.066314, 0.935235, -1.63661, 1, 0, 0.8705882, 1,
1.068493, -0.0578176, 2.581427, 1, 0, 0.8627451, 1,
1.072956, 0.7352694, 0.2553366, 1, 0, 0.8588235, 1,
1.074637, 1.026209, 0.7657313, 1, 0, 0.8509804, 1,
1.075702, -0.2801051, 0.8956326, 1, 0, 0.8470588, 1,
1.08063, -0.9292983, 2.298142, 1, 0, 0.8392157, 1,
1.085891, -0.329201, 2.846219, 1, 0, 0.8352941, 1,
1.088235, 1.778426, 0.6228676, 1, 0, 0.827451, 1,
1.090153, -0.6448746, 2.125237, 1, 0, 0.8235294, 1,
1.090334, 2.20887, 0.7665874, 1, 0, 0.8156863, 1,
1.102721, 0.1673468, 1.483084, 1, 0, 0.8117647, 1,
1.104399, 0.5878943, 1.133916, 1, 0, 0.8039216, 1,
1.10591, -0.2095674, 0.9089499, 1, 0, 0.7960784, 1,
1.110902, -0.4929939, 1.320535, 1, 0, 0.7921569, 1,
1.11342, -1.315168, 3.019911, 1, 0, 0.7843137, 1,
1.131196, -0.08619039, 0.9809515, 1, 0, 0.7803922, 1,
1.142625, -1.45877, 2.725131, 1, 0, 0.772549, 1,
1.143697, -1.248726, 3.528839, 1, 0, 0.7686275, 1,
1.150785, -0.2769949, 0.8310711, 1, 0, 0.7607843, 1,
1.152511, -0.04495712, 3.932426, 1, 0, 0.7568628, 1,
1.153046, -1.599565, 1.668972, 1, 0, 0.7490196, 1,
1.165923, -1.253569, 2.211136, 1, 0, 0.7450981, 1,
1.173772, -1.694198, 2.29601, 1, 0, 0.7372549, 1,
1.190353, 0.8588277, 1.394151, 1, 0, 0.7333333, 1,
1.206391, 0.8377281, 2.489733, 1, 0, 0.7254902, 1,
1.211349, 0.4319747, 0.05288615, 1, 0, 0.7215686, 1,
1.216378, -0.5638947, 0.3115056, 1, 0, 0.7137255, 1,
1.216611, -0.3764812, 2.034949, 1, 0, 0.7098039, 1,
1.21818, -0.5389801, 3.322122, 1, 0, 0.7019608, 1,
1.220078, -0.8105637, 2.789705, 1, 0, 0.6941177, 1,
1.220554, -0.2629646, 1.432313, 1, 0, 0.6901961, 1,
1.225901, -0.4989708, 1.399248, 1, 0, 0.682353, 1,
1.228042, 0.517292, -0.8020694, 1, 0, 0.6784314, 1,
1.229777, -0.5475816, 2.629826, 1, 0, 0.6705883, 1,
1.232742, -1.641423, -0.5636385, 1, 0, 0.6666667, 1,
1.240619, -0.4295651, 2.276472, 1, 0, 0.6588235, 1,
1.242114, 1.321638, -0.08748847, 1, 0, 0.654902, 1,
1.242212, -0.9431595, 1.759695, 1, 0, 0.6470588, 1,
1.250217, -2.475221, 2.022882, 1, 0, 0.6431373, 1,
1.250831, -0.2560319, 1.041064, 1, 0, 0.6352941, 1,
1.251918, 0.7358804, 0.2335443, 1, 0, 0.6313726, 1,
1.257734, -0.5505694, 0.6276559, 1, 0, 0.6235294, 1,
1.260362, 1.106655, 0.9069015, 1, 0, 0.6196079, 1,
1.267042, -1.070993, 3.588265, 1, 0, 0.6117647, 1,
1.277151, -0.2653845, 1.733236, 1, 0, 0.6078432, 1,
1.280582, -2.482117, 0.8159668, 1, 0, 0.6, 1,
1.281123, 1.722652, 0.153275, 1, 0, 0.5921569, 1,
1.287443, 1.003487, 0.08174098, 1, 0, 0.5882353, 1,
1.288448, -0.5293677, 2.15138, 1, 0, 0.5803922, 1,
1.297388, -0.5733202, 0.3947463, 1, 0, 0.5764706, 1,
1.301144, 1.257677, -0.4376004, 1, 0, 0.5686275, 1,
1.301467, -0.1832892, 0.2151821, 1, 0, 0.5647059, 1,
1.313269, -0.02725308, 2.027464, 1, 0, 0.5568628, 1,
1.315079, -3.088234, 5.078758, 1, 0, 0.5529412, 1,
1.322307, 0.5041355, 1.505648, 1, 0, 0.5450981, 1,
1.336855, -1.557451, 3.130501, 1, 0, 0.5411765, 1,
1.343558, 0.4089081, 2.09862, 1, 0, 0.5333334, 1,
1.347586, 1.046352, 3.29162, 1, 0, 0.5294118, 1,
1.348616, 0.08373725, 0.8855045, 1, 0, 0.5215687, 1,
1.349536, 0.1544752, 1.723471, 1, 0, 0.5176471, 1,
1.355043, 1.051978, 1.470762, 1, 0, 0.509804, 1,
1.360817, -0.1858856, 2.069638, 1, 0, 0.5058824, 1,
1.369685, -0.1827204, 1.24842, 1, 0, 0.4980392, 1,
1.377667, 0.8644013, 0.8886167, 1, 0, 0.4901961, 1,
1.394661, -0.2344583, 0.7431832, 1, 0, 0.4862745, 1,
1.397712, 0.7164856, 4.255622, 1, 0, 0.4784314, 1,
1.404747, -0.6358064, 2.289964, 1, 0, 0.4745098, 1,
1.423658, -1.228349, 2.412061, 1, 0, 0.4666667, 1,
1.424125, 0.315737, 3.665586, 1, 0, 0.4627451, 1,
1.424466, -1.028011, 2.890613, 1, 0, 0.454902, 1,
1.437264, -1.750847, 1.300732, 1, 0, 0.4509804, 1,
1.44746, 0.2106124, 2.708582, 1, 0, 0.4431373, 1,
1.460642, -1.112048, 3.355635, 1, 0, 0.4392157, 1,
1.492484, 0.07675403, 0.8967577, 1, 0, 0.4313726, 1,
1.509593, -0.9264765, 2.871261, 1, 0, 0.427451, 1,
1.514477, 0.5756007, 0.9375843, 1, 0, 0.4196078, 1,
1.531529, -1.399483, 3.979798, 1, 0, 0.4156863, 1,
1.540379, -0.8411515, 1.043808, 1, 0, 0.4078431, 1,
1.545431, -0.5686536, 1.302653, 1, 0, 0.4039216, 1,
1.548046, -0.9573403, 4.993371, 1, 0, 0.3960784, 1,
1.551929, -0.2009673, 0.2659826, 1, 0, 0.3882353, 1,
1.557757, -0.1750983, 2.229987, 1, 0, 0.3843137, 1,
1.567069, 2.161813, -2.149263, 1, 0, 0.3764706, 1,
1.572185, 0.01284579, 0.9010705, 1, 0, 0.372549, 1,
1.576486, -0.04040099, 2.201378, 1, 0, 0.3647059, 1,
1.593259, 0.05056946, -0.3268645, 1, 0, 0.3607843, 1,
1.606311, -0.8708755, 2.67391, 1, 0, 0.3529412, 1,
1.607395, 1.230142, 1.527058, 1, 0, 0.3490196, 1,
1.625562, -0.3079604, 2.713329, 1, 0, 0.3411765, 1,
1.629889, -0.5694848, 0.8768356, 1, 0, 0.3372549, 1,
1.63966, 1.179357, 2.165056, 1, 0, 0.3294118, 1,
1.642658, -1.576932, 1.717317, 1, 0, 0.3254902, 1,
1.646704, 0.3379699, 0.8231311, 1, 0, 0.3176471, 1,
1.656064, 1.372482, 0.85852, 1, 0, 0.3137255, 1,
1.669967, 0.7954453, -0.7915724, 1, 0, 0.3058824, 1,
1.689665, -1.017225, 1.700524, 1, 0, 0.2980392, 1,
1.696729, -0.4256418, 2.971422, 1, 0, 0.2941177, 1,
1.70904, -0.5789844, 2.089089, 1, 0, 0.2862745, 1,
1.730619, -0.5757407, 1.255801, 1, 0, 0.282353, 1,
1.769417, -0.5539597, 2.187835, 1, 0, 0.2745098, 1,
1.806977, -0.5916938, 1.35762, 1, 0, 0.2705882, 1,
1.827431, 0.6042938, 0.7136638, 1, 0, 0.2627451, 1,
1.835329, -1.143412, 1.558022, 1, 0, 0.2588235, 1,
1.875652, 0.8734056, 1.355376, 1, 0, 0.2509804, 1,
1.938784, 0.1590753, 1.972509, 1, 0, 0.2470588, 1,
1.953902, -0.325573, 2.440763, 1, 0, 0.2392157, 1,
1.962727, 1.051157, 2.500828, 1, 0, 0.2352941, 1,
1.964403, 1.173196, 0.1611059, 1, 0, 0.227451, 1,
1.97867, -1.647469, 3.198829, 1, 0, 0.2235294, 1,
1.995994, -0.3315276, 3.092268, 1, 0, 0.2156863, 1,
2.01332, -1.299803, 2.856027, 1, 0, 0.2117647, 1,
2.042417, -0.01657306, 1.961055, 1, 0, 0.2039216, 1,
2.051601, 0.9486274, 0.9519152, 1, 0, 0.1960784, 1,
2.065228, -0.2007912, 0.09513332, 1, 0, 0.1921569, 1,
2.06727, 0.8656719, -0.2094614, 1, 0, 0.1843137, 1,
2.075555, 0.2854891, 1.880297, 1, 0, 0.1803922, 1,
2.120991, 0.1717385, 0.6031102, 1, 0, 0.172549, 1,
2.139098, -0.6563321, 3.118815, 1, 0, 0.1686275, 1,
2.139471, 1.373726, 2.322783, 1, 0, 0.1607843, 1,
2.216973, 0.4813047, 1.726756, 1, 0, 0.1568628, 1,
2.226613, -1.062816, 0.5832182, 1, 0, 0.1490196, 1,
2.253704, 0.5221296, 1.144813, 1, 0, 0.145098, 1,
2.288839, 1.883691, 0.6472838, 1, 0, 0.1372549, 1,
2.364053, -0.06917046, 2.34297, 1, 0, 0.1333333, 1,
2.371752, -0.3187889, 1.001659, 1, 0, 0.1254902, 1,
2.374213, 0.9211755, 0.7981104, 1, 0, 0.1215686, 1,
2.401988, -1.0271, 1.793059, 1, 0, 0.1137255, 1,
2.408228, 0.6898767, 2.892548, 1, 0, 0.1098039, 1,
2.44501, -0.6935322, 1.701887, 1, 0, 0.1019608, 1,
2.455189, -0.02269309, 1.092062, 1, 0, 0.09411765, 1,
2.465821, 0.449282, 1.337661, 1, 0, 0.09019608, 1,
2.507634, 1.187098, 2.402337, 1, 0, 0.08235294, 1,
2.545199, 0.3604887, 2.46548, 1, 0, 0.07843138, 1,
2.552257, 0.3611887, 0.9166271, 1, 0, 0.07058824, 1,
2.587827, 2.278053, 1.017433, 1, 0, 0.06666667, 1,
2.591337, -0.1016164, 2.71616, 1, 0, 0.05882353, 1,
2.739358, 0.775065, 0.9419357, 1, 0, 0.05490196, 1,
2.760796, -0.1794949, 1.303291, 1, 0, 0.04705882, 1,
2.793529, -1.791383, 1.929999, 1, 0, 0.04313726, 1,
2.793711, 0.2385398, 0.6692258, 1, 0, 0.03529412, 1,
2.860015, -1.778524, 1.664195, 1, 0, 0.03137255, 1,
2.920856, 0.7158598, 0.4620551, 1, 0, 0.02352941, 1,
2.97097, -0.3174351, 1.204191, 1, 0, 0.01960784, 1,
3.424499, 0.7606245, 2.534914, 1, 0, 0.01176471, 1,
3.466832, 0.03200025, 1.571115, 1, 0, 0.007843138, 1
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
-0.08275795, -4.138983, -7.249539, 0, -0.5, 0.5, 0.5,
-0.08275795, -4.138983, -7.249539, 1, -0.5, 0.5, 0.5,
-0.08275795, -4.138983, -7.249539, 1, 1.5, 0.5, 0.5,
-0.08275795, -4.138983, -7.249539, 0, 1.5, 0.5, 0.5
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
-4.835659, 0.01132262, -7.249539, 0, -0.5, 0.5, 0.5,
-4.835659, 0.01132262, -7.249539, 1, -0.5, 0.5, 0.5,
-4.835659, 0.01132262, -7.249539, 1, 1.5, 0.5, 0.5,
-4.835659, 0.01132262, -7.249539, 0, 1.5, 0.5, 0.5
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
-4.835659, -4.138983, 0.2034466, 0, -0.5, 0.5, 0.5,
-4.835659, -4.138983, 0.2034466, 1, -0.5, 0.5, 0.5,
-4.835659, -4.138983, 0.2034466, 1, 1.5, 0.5, 0.5,
-4.835659, -4.138983, 0.2034466, 0, 1.5, 0.5, 0.5
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
-2, -3.18122, -5.52962,
2, -3.18122, -5.52962,
-2, -3.18122, -5.52962,
-2, -3.340847, -5.816273,
0, -3.18122, -5.52962,
0, -3.340847, -5.816273,
2, -3.18122, -5.52962,
2, -3.340847, -5.816273
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
-2, -3.660102, -6.389579, 0, -0.5, 0.5, 0.5,
-2, -3.660102, -6.389579, 1, -0.5, 0.5, 0.5,
-2, -3.660102, -6.389579, 1, 1.5, 0.5, 0.5,
-2, -3.660102, -6.389579, 0, 1.5, 0.5, 0.5,
0, -3.660102, -6.389579, 0, -0.5, 0.5, 0.5,
0, -3.660102, -6.389579, 1, -0.5, 0.5, 0.5,
0, -3.660102, -6.389579, 1, 1.5, 0.5, 0.5,
0, -3.660102, -6.389579, 0, 1.5, 0.5, 0.5,
2, -3.660102, -6.389579, 0, -0.5, 0.5, 0.5,
2, -3.660102, -6.389579, 1, -0.5, 0.5, 0.5,
2, -3.660102, -6.389579, 1, 1.5, 0.5, 0.5,
2, -3.660102, -6.389579, 0, 1.5, 0.5, 0.5
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
-3.738835, -3, -5.52962,
-3.738835, 3, -5.52962,
-3.738835, -3, -5.52962,
-3.921639, -3, -5.816273,
-3.738835, -2, -5.52962,
-3.921639, -2, -5.816273,
-3.738835, -1, -5.52962,
-3.921639, -1, -5.816273,
-3.738835, 0, -5.52962,
-3.921639, 0, -5.816273,
-3.738835, 1, -5.52962,
-3.921639, 1, -5.816273,
-3.738835, 2, -5.52962,
-3.921639, 2, -5.816273,
-3.738835, 3, -5.52962,
-3.921639, 3, -5.816273
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
-4.287247, -3, -6.389579, 0, -0.5, 0.5, 0.5,
-4.287247, -3, -6.389579, 1, -0.5, 0.5, 0.5,
-4.287247, -3, -6.389579, 1, 1.5, 0.5, 0.5,
-4.287247, -3, -6.389579, 0, 1.5, 0.5, 0.5,
-4.287247, -2, -6.389579, 0, -0.5, 0.5, 0.5,
-4.287247, -2, -6.389579, 1, -0.5, 0.5, 0.5,
-4.287247, -2, -6.389579, 1, 1.5, 0.5, 0.5,
-4.287247, -2, -6.389579, 0, 1.5, 0.5, 0.5,
-4.287247, -1, -6.389579, 0, -0.5, 0.5, 0.5,
-4.287247, -1, -6.389579, 1, -0.5, 0.5, 0.5,
-4.287247, -1, -6.389579, 1, 1.5, 0.5, 0.5,
-4.287247, -1, -6.389579, 0, 1.5, 0.5, 0.5,
-4.287247, 0, -6.389579, 0, -0.5, 0.5, 0.5,
-4.287247, 0, -6.389579, 1, -0.5, 0.5, 0.5,
-4.287247, 0, -6.389579, 1, 1.5, 0.5, 0.5,
-4.287247, 0, -6.389579, 0, 1.5, 0.5, 0.5,
-4.287247, 1, -6.389579, 0, -0.5, 0.5, 0.5,
-4.287247, 1, -6.389579, 1, -0.5, 0.5, 0.5,
-4.287247, 1, -6.389579, 1, 1.5, 0.5, 0.5,
-4.287247, 1, -6.389579, 0, 1.5, 0.5, 0.5,
-4.287247, 2, -6.389579, 0, -0.5, 0.5, 0.5,
-4.287247, 2, -6.389579, 1, -0.5, 0.5, 0.5,
-4.287247, 2, -6.389579, 1, 1.5, 0.5, 0.5,
-4.287247, 2, -6.389579, 0, 1.5, 0.5, 0.5,
-4.287247, 3, -6.389579, 0, -0.5, 0.5, 0.5,
-4.287247, 3, -6.389579, 1, -0.5, 0.5, 0.5,
-4.287247, 3, -6.389579, 1, 1.5, 0.5, 0.5,
-4.287247, 3, -6.389579, 0, 1.5, 0.5, 0.5
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
-3.738835, -3.18122, -4,
-3.738835, -3.18122, 4,
-3.738835, -3.18122, -4,
-3.921639, -3.340847, -4,
-3.738835, -3.18122, -2,
-3.921639, -3.340847, -2,
-3.738835, -3.18122, 0,
-3.921639, -3.340847, 0,
-3.738835, -3.18122, 2,
-3.921639, -3.340847, 2,
-3.738835, -3.18122, 4,
-3.921639, -3.340847, 4
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
-4.287247, -3.660102, -4, 0, -0.5, 0.5, 0.5,
-4.287247, -3.660102, -4, 1, -0.5, 0.5, 0.5,
-4.287247, -3.660102, -4, 1, 1.5, 0.5, 0.5,
-4.287247, -3.660102, -4, 0, 1.5, 0.5, 0.5,
-4.287247, -3.660102, -2, 0, -0.5, 0.5, 0.5,
-4.287247, -3.660102, -2, 1, -0.5, 0.5, 0.5,
-4.287247, -3.660102, -2, 1, 1.5, 0.5, 0.5,
-4.287247, -3.660102, -2, 0, 1.5, 0.5, 0.5,
-4.287247, -3.660102, 0, 0, -0.5, 0.5, 0.5,
-4.287247, -3.660102, 0, 1, -0.5, 0.5, 0.5,
-4.287247, -3.660102, 0, 1, 1.5, 0.5, 0.5,
-4.287247, -3.660102, 0, 0, 1.5, 0.5, 0.5,
-4.287247, -3.660102, 2, 0, -0.5, 0.5, 0.5,
-4.287247, -3.660102, 2, 1, -0.5, 0.5, 0.5,
-4.287247, -3.660102, 2, 1, 1.5, 0.5, 0.5,
-4.287247, -3.660102, 2, 0, 1.5, 0.5, 0.5,
-4.287247, -3.660102, 4, 0, -0.5, 0.5, 0.5,
-4.287247, -3.660102, 4, 1, -0.5, 0.5, 0.5,
-4.287247, -3.660102, 4, 1, 1.5, 0.5, 0.5,
-4.287247, -3.660102, 4, 0, 1.5, 0.5, 0.5
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
-3.738835, -3.18122, -5.52962,
-3.738835, 3.203866, -5.52962,
-3.738835, -3.18122, 5.936513,
-3.738835, 3.203866, 5.936513,
-3.738835, -3.18122, -5.52962,
-3.738835, -3.18122, 5.936513,
-3.738835, 3.203866, -5.52962,
-3.738835, 3.203866, 5.936513,
-3.738835, -3.18122, -5.52962,
3.573319, -3.18122, -5.52962,
-3.738835, -3.18122, 5.936513,
3.573319, -3.18122, 5.936513,
-3.738835, 3.203866, -5.52962,
3.573319, 3.203866, -5.52962,
-3.738835, 3.203866, 5.936513,
3.573319, 3.203866, 5.936513,
3.573319, -3.18122, -5.52962,
3.573319, 3.203866, -5.52962,
3.573319, -3.18122, 5.936513,
3.573319, 3.203866, 5.936513,
3.573319, -3.18122, -5.52962,
3.573319, -3.18122, 5.936513,
3.573319, 3.203866, -5.52962,
3.573319, 3.203866, 5.936513
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
var radius = 8.022321;
var distance = 35.69221;
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
mvMatrix.translate( 0.08275795, -0.01132262, -0.2034466 );
mvMatrix.scale( 1.186229, 1.358461, 0.7564791 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.69221);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
aminoethyl_phosphoro<-read.table("aminoethyl_phosphoro.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-aminoethyl_phosphoro$V2
```

```
## Error in eval(expr, envir, enclos): object 'aminoethyl_phosphoro' not found
```

```r
y<-aminoethyl_phosphoro$V3
```

```
## Error in eval(expr, envir, enclos): object 'aminoethyl_phosphoro' not found
```

```r
z<-aminoethyl_phosphoro$V4
```

```
## Error in eval(expr, envir, enclos): object 'aminoethyl_phosphoro' not found
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
-3.632348, 0.552103, -2.177983, 0, 0, 1, 1, 1,
-3.204797, -0.04173012, 1.467729, 1, 0, 0, 1, 1,
-2.748239, 0.218179, -1.41636, 1, 0, 0, 1, 1,
-2.72023, 0.2580683, 0.1245207, 1, 0, 0, 1, 1,
-2.668746, 0.6402228, -2.289814, 1, 0, 0, 1, 1,
-2.652466, -1.702035, -2.057582, 1, 0, 0, 1, 1,
-2.548836, -1.06651, -2.141442, 0, 0, 0, 1, 1,
-2.394569, 1.381175, 0.2910502, 0, 0, 0, 1, 1,
-2.382154, 1.092418, -2.597371, 0, 0, 0, 1, 1,
-2.338544, 0.5219061, -1.097605, 0, 0, 0, 1, 1,
-2.240544, 1.446521, -1.198676, 0, 0, 0, 1, 1,
-2.230664, -0.7902442, -1.695384, 0, 0, 0, 1, 1,
-2.224305, 0.5956783, -1.532007, 0, 0, 0, 1, 1,
-2.222389, -1.635545, -1.712973, 1, 1, 1, 1, 1,
-2.201069, 0.4439014, -1.647054, 1, 1, 1, 1, 1,
-2.167325, -0.2387625, -1.932629, 1, 1, 1, 1, 1,
-2.161103, 0.3294402, -2.699517, 1, 1, 1, 1, 1,
-2.15877, 1.045594, -1.522222, 1, 1, 1, 1, 1,
-2.151575, -0.4807642, 0.3797106, 1, 1, 1, 1, 1,
-2.102315, 0.9644585, -1.582724, 1, 1, 1, 1, 1,
-2.092526, -1.495219, -2.360184, 1, 1, 1, 1, 1,
-2.084491, -1.273189, -1.681998, 1, 1, 1, 1, 1,
-2.075858, -0.3768341, -1.224739, 1, 1, 1, 1, 1,
-2.069867, -0.3963078, -2.587882, 1, 1, 1, 1, 1,
-2.064083, -1.89907, -1.016563, 1, 1, 1, 1, 1,
-2.049795, 0.6743556, -1.920448, 1, 1, 1, 1, 1,
-2.048831, 0.5984484, -1.143386, 1, 1, 1, 1, 1,
-2.045553, 0.3796887, -1.500537, 1, 1, 1, 1, 1,
-2.038456, -0.308156, -2.378452, 0, 0, 1, 1, 1,
-2.024102, -0.2564768, -3.072758, 1, 0, 0, 1, 1,
-2.005021, -1.516082, -1.733063, 1, 0, 0, 1, 1,
-1.999542, -0.5337746, -1.320032, 1, 0, 0, 1, 1,
-1.990891, 1.313787, -1.682058, 1, 0, 0, 1, 1,
-1.988928, 0.8415606, -2.399802, 1, 0, 0, 1, 1,
-1.986198, 1.034465, -0.08710831, 0, 0, 0, 1, 1,
-1.967515, -0.08935904, -3.232144, 0, 0, 0, 1, 1,
-1.918911, -2.110871, -1.516573, 0, 0, 0, 1, 1,
-1.905519, -1.310442, -1.200731, 0, 0, 0, 1, 1,
-1.891077, 1.433649, -0.3535437, 0, 0, 0, 1, 1,
-1.878651, -0.1479353, -0.07862524, 0, 0, 0, 1, 1,
-1.863867, -0.3705759, -0.2829921, 0, 0, 0, 1, 1,
-1.862809, 0.09744897, -2.782912, 1, 1, 1, 1, 1,
-1.859511, 1.27364, -0.1199954, 1, 1, 1, 1, 1,
-1.84478, -1.345811, -4.648189, 1, 1, 1, 1, 1,
-1.840772, -0.7080203, -0.4857229, 1, 1, 1, 1, 1,
-1.82724, -1.565947, -2.027764, 1, 1, 1, 1, 1,
-1.82328, 0.8374348, -0.4893523, 1, 1, 1, 1, 1,
-1.821557, 1.384816, -0.9232605, 1, 1, 1, 1, 1,
-1.813984, 0.5686455, -2.494729, 1, 1, 1, 1, 1,
-1.798, -1.723937, -1.782576, 1, 1, 1, 1, 1,
-1.789187, 0.2580558, -1.525952, 1, 1, 1, 1, 1,
-1.780388, 0.4912339, -0.2291224, 1, 1, 1, 1, 1,
-1.780246, 0.7412234, -2.24027, 1, 1, 1, 1, 1,
-1.758557, 0.4848265, -0.05261027, 1, 1, 1, 1, 1,
-1.750939, 0.3865149, -0.09422064, 1, 1, 1, 1, 1,
-1.750203, -0.06041312, -1.495054, 1, 1, 1, 1, 1,
-1.74642, 0.1049976, -0.9200962, 0, 0, 1, 1, 1,
-1.73713, 0.9919026, -1.366991, 1, 0, 0, 1, 1,
-1.730935, -1.280479, -0.4826273, 1, 0, 0, 1, 1,
-1.708219, 0.6492965, -0.5213419, 1, 0, 0, 1, 1,
-1.695412, 2.364385, 0.5132459, 1, 0, 0, 1, 1,
-1.692026, -0.2141596, -0.2208263, 1, 0, 0, 1, 1,
-1.691778, 1.000499, -1.240644, 0, 0, 0, 1, 1,
-1.677601, -0.04295926, -1.26198, 0, 0, 0, 1, 1,
-1.674291, -1.51928, -1.971012, 0, 0, 0, 1, 1,
-1.671766, -1.256021, -1.205864, 0, 0, 0, 1, 1,
-1.648206, 0.577925, -1.370591, 0, 0, 0, 1, 1,
-1.646989, -0.3022065, -2.002457, 0, 0, 0, 1, 1,
-1.616802, 1.034394, -2.413927, 0, 0, 0, 1, 1,
-1.616526, 2.428422, -0.6738288, 1, 1, 1, 1, 1,
-1.613776, -0.5424716, -1.454536, 1, 1, 1, 1, 1,
-1.610532, 0.1632297, -1.863001, 1, 1, 1, 1, 1,
-1.605299, 0.1983069, -2.479182, 1, 1, 1, 1, 1,
-1.601081, -1.007049, -3.309362, 1, 1, 1, 1, 1,
-1.592395, -1.541782, -3.001454, 1, 1, 1, 1, 1,
-1.590888, -0.1385018, -0.3658145, 1, 1, 1, 1, 1,
-1.587054, -0.787317, -3.398065, 1, 1, 1, 1, 1,
-1.548149, -1.043909, -3.36362, 1, 1, 1, 1, 1,
-1.54096, -1.833512, -1.237869, 1, 1, 1, 1, 1,
-1.537467, 0.5007188, -1.241371, 1, 1, 1, 1, 1,
-1.520849, -0.7715104, -1.999049, 1, 1, 1, 1, 1,
-1.509426, -0.03763209, -1.751129, 1, 1, 1, 1, 1,
-1.507496, -1.650944, -3.892184, 1, 1, 1, 1, 1,
-1.496633, 0.3357925, -0.01216153, 1, 1, 1, 1, 1,
-1.494959, 0.1409349, -0.2693632, 0, 0, 1, 1, 1,
-1.492053, -1.376422, -1.611947, 1, 0, 0, 1, 1,
-1.48892, -0.6967949, -1.89325, 1, 0, 0, 1, 1,
-1.488518, -0.7887033, -2.32189, 1, 0, 0, 1, 1,
-1.484603, 0.52049, -0.586287, 1, 0, 0, 1, 1,
-1.477661, 1.112645, -1.453883, 1, 0, 0, 1, 1,
-1.471515, -0.1945658, -0.9152355, 0, 0, 0, 1, 1,
-1.462539, 0.2776901, -2.308051, 0, 0, 0, 1, 1,
-1.458945, -0.2155097, -3.444536, 0, 0, 0, 1, 1,
-1.452187, -0.5075287, -2.724621, 0, 0, 0, 1, 1,
-1.437947, -0.2392221, 0.8613861, 0, 0, 0, 1, 1,
-1.433885, 0.6904604, -1.024643, 0, 0, 0, 1, 1,
-1.422684, -1.919911, -1.931347, 0, 0, 0, 1, 1,
-1.422563, 0.9385617, -1.769269, 1, 1, 1, 1, 1,
-1.417395, 0.0296234, -4.659056, 1, 1, 1, 1, 1,
-1.404709, -1.507224, -3.70029, 1, 1, 1, 1, 1,
-1.353903, 1.400982, -1.764276, 1, 1, 1, 1, 1,
-1.343209, -0.4594901, -1.741651, 1, 1, 1, 1, 1,
-1.340245, -1.067565, -2.59235, 1, 1, 1, 1, 1,
-1.339207, 0.7118228, -1.507826, 1, 1, 1, 1, 1,
-1.335449, -0.9426495, -3.003274, 1, 1, 1, 1, 1,
-1.334229, 0.5628405, 0.208541, 1, 1, 1, 1, 1,
-1.326399, 0.5841033, -1.797783, 1, 1, 1, 1, 1,
-1.321824, -0.5982592, -1.234091, 1, 1, 1, 1, 1,
-1.321454, 1.438513, -0.7933696, 1, 1, 1, 1, 1,
-1.320733, 2.060318, 0.3567587, 1, 1, 1, 1, 1,
-1.317354, -0.3641664, -2.783545, 1, 1, 1, 1, 1,
-1.305746, 0.7504283, -0.4654461, 1, 1, 1, 1, 1,
-1.302679, 1.421628, -0.3593094, 0, 0, 1, 1, 1,
-1.301413, -0.04132353, -1.202683, 1, 0, 0, 1, 1,
-1.287832, -0.02107826, -1.205301, 1, 0, 0, 1, 1,
-1.263044, 0.5418698, 0.5824742, 1, 0, 0, 1, 1,
-1.259122, -0.5520863, -2.581451, 1, 0, 0, 1, 1,
-1.242122, 0.3733704, -2.168959, 1, 0, 0, 1, 1,
-1.226011, -0.6121934, -2.510927, 0, 0, 0, 1, 1,
-1.225137, -1.12354, -1.653989, 0, 0, 0, 1, 1,
-1.219122, 0.2647311, -1.80143, 0, 0, 0, 1, 1,
-1.20861, 0.01974368, -1.118989, 0, 0, 0, 1, 1,
-1.205717, -0.4725957, -0.8201865, 0, 0, 0, 1, 1,
-1.205231, 1.020302, -1.314075, 0, 0, 0, 1, 1,
-1.198284, 0.4449885, -0.3783901, 0, 0, 0, 1, 1,
-1.187091, -0.2205781, -1.405792, 1, 1, 1, 1, 1,
-1.18402, -0.7452947, -2.502608, 1, 1, 1, 1, 1,
-1.172844, -1.380145, -2.301129, 1, 1, 1, 1, 1,
-1.171252, -0.9159603, -2.451238, 1, 1, 1, 1, 1,
-1.168268, -0.06761493, -1.351088, 1, 1, 1, 1, 1,
-1.159904, 0.4736683, 1.448702, 1, 1, 1, 1, 1,
-1.152429, -1.032806, -2.233736, 1, 1, 1, 1, 1,
-1.14622, 1.278406, -0.6766888, 1, 1, 1, 1, 1,
-1.14588, 0.3010323, -0.0877756, 1, 1, 1, 1, 1,
-1.141488, -0.6568151, -0.7266074, 1, 1, 1, 1, 1,
-1.140097, -0.05424976, -1.48208, 1, 1, 1, 1, 1,
-1.136665, 0.05838711, -0.2520916, 1, 1, 1, 1, 1,
-1.135948, -0.0407789, -1.359629, 1, 1, 1, 1, 1,
-1.13516, -0.8869293, -2.396467, 1, 1, 1, 1, 1,
-1.134924, 0.1327718, -1.721075, 1, 1, 1, 1, 1,
-1.134628, -0.5738841, -0.7959456, 0, 0, 1, 1, 1,
-1.130792, 0.8624538, -0.0499259, 1, 0, 0, 1, 1,
-1.127522, -0.9020547, -2.564675, 1, 0, 0, 1, 1,
-1.123409, -0.5033379, -1.348486, 1, 0, 0, 1, 1,
-1.120084, -1.598361, -3.526238, 1, 0, 0, 1, 1,
-1.10682, -0.888922, -1.384731, 1, 0, 0, 1, 1,
-1.100952, -0.7428269, -2.700686, 0, 0, 0, 1, 1,
-1.088818, 1.151568, -0.552227, 0, 0, 0, 1, 1,
-1.085691, -0.2516799, -2.168934, 0, 0, 0, 1, 1,
-1.085558, 0.2675262, -0.3010882, 0, 0, 0, 1, 1,
-1.082046, -0.5726484, -2.388747, 0, 0, 0, 1, 1,
-1.07837, -0.3620723, -3.633021, 0, 0, 0, 1, 1,
-1.077356, -0.2232435, -1.553154, 0, 0, 0, 1, 1,
-1.07295, 0.07593872, -2.89416, 1, 1, 1, 1, 1,
-1.068481, -0.04367293, -0.5461038, 1, 1, 1, 1, 1,
-1.068399, 0.9620716, -1.839359, 1, 1, 1, 1, 1,
-1.066737, -0.3208024, -1.149256, 1, 1, 1, 1, 1,
-1.055662, -0.3297728, -2.798656, 1, 1, 1, 1, 1,
-1.054189, -0.1852743, -0.9397468, 1, 1, 1, 1, 1,
-1.052616, 0.3348544, -0.4439012, 1, 1, 1, 1, 1,
-1.049377, 0.01849503, -3.147175, 1, 1, 1, 1, 1,
-1.048805, -0.2183075, -1.584839, 1, 1, 1, 1, 1,
-1.047086, -0.07039203, -2.011578, 1, 1, 1, 1, 1,
-1.041675, -0.812799, -3.825046, 1, 1, 1, 1, 1,
-1.036867, -1.290065, -2.379349, 1, 1, 1, 1, 1,
-1.032506, -1.149116, -3.091736, 1, 1, 1, 1, 1,
-1.031842, -0.0513486, -1.371568, 1, 1, 1, 1, 1,
-1.027808, -0.420113, -1.821665, 1, 1, 1, 1, 1,
-1.025898, 1.472516, -0.03489052, 0, 0, 1, 1, 1,
-1.007707, 1.524355, 0.4167881, 1, 0, 0, 1, 1,
-1.002231, 1.467263, -0.4878112, 1, 0, 0, 1, 1,
-0.9991174, 0.325101, 0.6046982, 1, 0, 0, 1, 1,
-0.9973117, -0.2142015, -1.179636, 1, 0, 0, 1, 1,
-0.9968742, 1.209613, -0.7019301, 1, 0, 0, 1, 1,
-0.9964736, -0.6318148, 0.7580402, 0, 0, 0, 1, 1,
-0.9922734, -0.8261157, -3.611012, 0, 0, 0, 1, 1,
-0.991157, 0.516138, -2.147678, 0, 0, 0, 1, 1,
-0.9859144, -0.6641724, -1.45101, 0, 0, 0, 1, 1,
-0.9842457, -0.1644297, -2.903176, 0, 0, 0, 1, 1,
-0.9826797, 0.9482957, -1.481416, 0, 0, 0, 1, 1,
-0.9767926, 0.06407019, -2.085947, 0, 0, 0, 1, 1,
-0.973072, 1.266363, -0.7470298, 1, 1, 1, 1, 1,
-0.9717301, 0.7214525, -2.000779, 1, 1, 1, 1, 1,
-0.9677172, 1.663918, 0.09697815, 1, 1, 1, 1, 1,
-0.9670256, -0.7305029, -1.875838, 1, 1, 1, 1, 1,
-0.9665296, 0.7888154, -0.6319988, 1, 1, 1, 1, 1,
-0.9616778, -0.4883453, -1.499745, 1, 1, 1, 1, 1,
-0.9586173, -0.496076, -2.765393, 1, 1, 1, 1, 1,
-0.9558438, 2.041752, -1.155905, 1, 1, 1, 1, 1,
-0.9532684, -1.499006, -2.966736, 1, 1, 1, 1, 1,
-0.9485617, -0.3378748, -3.409266, 1, 1, 1, 1, 1,
-0.943455, -1.22268, -1.616889, 1, 1, 1, 1, 1,
-0.9427387, 1.258581, 0.146617, 1, 1, 1, 1, 1,
-0.942055, -1.003095, -1.308945, 1, 1, 1, 1, 1,
-0.9400917, 0.01814646, -1.74363, 1, 1, 1, 1, 1,
-0.9174949, -1.532056, -0.6395727, 1, 1, 1, 1, 1,
-0.9158015, 1.980709, -0.03539501, 0, 0, 1, 1, 1,
-0.915028, -0.8864375, -0.4286136, 1, 0, 0, 1, 1,
-0.9102082, -0.04617018, -1.203423, 1, 0, 0, 1, 1,
-0.9097968, 0.9210454, -0.7418348, 1, 0, 0, 1, 1,
-0.9076779, -2.923091, -3.424152, 1, 0, 0, 1, 1,
-0.9035767, -0.5850555, -0.3881565, 1, 0, 0, 1, 1,
-0.9035712, -0.6460587, -1.779206, 0, 0, 0, 1, 1,
-0.8992795, -0.9274541, -3.150538, 0, 0, 0, 1, 1,
-0.8774385, 1.316772, 0.7427219, 0, 0, 0, 1, 1,
-0.8762679, -0.5302822, -1.732956, 0, 0, 0, 1, 1,
-0.8756727, 1.113155, 1.236566, 0, 0, 0, 1, 1,
-0.8730233, -0.4508742, -1.48575, 0, 0, 0, 1, 1,
-0.872554, -1.386239, -2.347383, 0, 0, 0, 1, 1,
-0.868266, -0.2743215, -1.406891, 1, 1, 1, 1, 1,
-0.8670484, 0.3234189, -1.793527, 1, 1, 1, 1, 1,
-0.8642634, 0.6997384, -0.06436279, 1, 1, 1, 1, 1,
-0.8608533, -1.614823, -3.397643, 1, 1, 1, 1, 1,
-0.8602983, 0.5630913, -0.5424945, 1, 1, 1, 1, 1,
-0.8566608, 0.06717854, -2.546117, 1, 1, 1, 1, 1,
-0.8564162, 0.8875966, -1.20315, 1, 1, 1, 1, 1,
-0.8493484, -0.3410324, -1.413872, 1, 1, 1, 1, 1,
-0.84801, -1.15431, -2.069788, 1, 1, 1, 1, 1,
-0.8354733, 0.1614232, -2.035631, 1, 1, 1, 1, 1,
-0.831993, -1.321775, -2.284815, 1, 1, 1, 1, 1,
-0.8319319, 0.556883, -1.522972, 1, 1, 1, 1, 1,
-0.8297189, 1.003015, -1.452267, 1, 1, 1, 1, 1,
-0.8280143, -0.2735263, 0.1875924, 1, 1, 1, 1, 1,
-0.8271186, -0.1069775, -3.074467, 1, 1, 1, 1, 1,
-0.8163541, -0.03862973, -0.8120419, 0, 0, 1, 1, 1,
-0.8149099, -1.012545, -3.297746, 1, 0, 0, 1, 1,
-0.811402, 1.29166, -1.271357, 1, 0, 0, 1, 1,
-0.8096098, 0.2917656, -1.469502, 1, 0, 0, 1, 1,
-0.8012647, 0.2106846, -0.7071109, 1, 0, 0, 1, 1,
-0.8000038, 0.8508421, -1.3293, 1, 0, 0, 1, 1,
-0.7954341, -0.1080105, -4.179574, 0, 0, 0, 1, 1,
-0.7944538, 0.3560188, -1.29678, 0, 0, 0, 1, 1,
-0.7941903, 0.3058822, -2.582331, 0, 0, 0, 1, 1,
-0.7903032, 0.3679744, -2.14343, 0, 0, 0, 1, 1,
-0.7880731, -0.1240913, -2.616025, 0, 0, 0, 1, 1,
-0.7842099, -0.08598849, -0.9365326, 0, 0, 0, 1, 1,
-0.7827675, -0.107981, -1.088926, 0, 0, 0, 1, 1,
-0.7732278, -0.4650527, -1.155455, 1, 1, 1, 1, 1,
-0.7642582, 1.35701, -0.5326039, 1, 1, 1, 1, 1,
-0.7615354, -0.9292683, -3.168966, 1, 1, 1, 1, 1,
-0.7593194, -0.7301478, -1.705616, 1, 1, 1, 1, 1,
-0.7574545, 1.010786, -0.005006897, 1, 1, 1, 1, 1,
-0.7521221, -2.040967, -5.027227, 1, 1, 1, 1, 1,
-0.7463008, 0.402255, -1.438569, 1, 1, 1, 1, 1,
-0.7389051, -0.7394843, -3.893009, 1, 1, 1, 1, 1,
-0.7382901, -1.958477, -3.323298, 1, 1, 1, 1, 1,
-0.73357, 0.1603865, -0.5040223, 1, 1, 1, 1, 1,
-0.7329208, -0.2227206, -0.9808487, 1, 1, 1, 1, 1,
-0.7253252, 0.5114023, -0.5955744, 1, 1, 1, 1, 1,
-0.714401, -0.8963018, -1.811994, 1, 1, 1, 1, 1,
-0.7085536, -1.598898, -4.922307, 1, 1, 1, 1, 1,
-0.706361, -0.5210491, -0.9987146, 1, 1, 1, 1, 1,
-0.7015614, -0.1661162, 0.2603639, 0, 0, 1, 1, 1,
-0.701377, -1.873475, -1.830422, 1, 0, 0, 1, 1,
-0.7011001, 0.8213997, 0.9257134, 1, 0, 0, 1, 1,
-0.6987349, -1.50255, -1.988977, 1, 0, 0, 1, 1,
-0.6900175, 1.598195, -0.4483094, 1, 0, 0, 1, 1,
-0.6889049, -0.6691363, -3.573114, 1, 0, 0, 1, 1,
-0.677759, 0.9866676, -0.4845016, 0, 0, 0, 1, 1,
-0.6750129, -0.1880161, -1.47081, 0, 0, 0, 1, 1,
-0.6718835, -1.77116, -2.20096, 0, 0, 0, 1, 1,
-0.6676196, -1.432068, -4.19606, 0, 0, 0, 1, 1,
-0.6655641, 0.6549892, -1.551904, 0, 0, 0, 1, 1,
-0.6635622, 0.05406391, -1.819298, 0, 0, 0, 1, 1,
-0.6554822, 0.5666964, 0.5579879, 0, 0, 0, 1, 1,
-0.6536809, -0.4316756, -1.360535, 1, 1, 1, 1, 1,
-0.6508356, 1.3644, -0.9028645, 1, 1, 1, 1, 1,
-0.6489221, 0.1752447, -2.334322, 1, 1, 1, 1, 1,
-0.6472358, 0.4167722, -1.684716, 1, 1, 1, 1, 1,
-0.6469889, 0.4956819, -1.416762, 1, 1, 1, 1, 1,
-0.6456615, 0.7649444, -2.316914, 1, 1, 1, 1, 1,
-0.644882, -1.085152, -3.011154, 1, 1, 1, 1, 1,
-0.6422564, 1.608706, 1.87857, 1, 1, 1, 1, 1,
-0.6408466, -0.001075444, -1.621823, 1, 1, 1, 1, 1,
-0.6384022, 1.869286, 0.7263546, 1, 1, 1, 1, 1,
-0.6367612, 0.09754867, -0.6880656, 1, 1, 1, 1, 1,
-0.6332455, -0.9987393, -2.300109, 1, 1, 1, 1, 1,
-0.6319126, -1.450376, -4.097982, 1, 1, 1, 1, 1,
-0.6280968, 2.315938, -0.1849656, 1, 1, 1, 1, 1,
-0.6272285, 0.2163099, -1.482976, 1, 1, 1, 1, 1,
-0.6244044, 0.2317939, -1.544847, 0, 0, 1, 1, 1,
-0.6208685, 0.3084285, -1.74864, 1, 0, 0, 1, 1,
-0.6129928, -0.2942057, -0.325947, 1, 0, 0, 1, 1,
-0.6054198, -1.333226, -1.876579, 1, 0, 0, 1, 1,
-0.6053095, -0.3372852, -0.9504364, 1, 0, 0, 1, 1,
-0.6039336, 0.06437016, -2.33198, 1, 0, 0, 1, 1,
-0.5932752, -0.8726541, -4.255777, 0, 0, 0, 1, 1,
-0.5924988, -0.08302982, -0.6734082, 0, 0, 0, 1, 1,
-0.5923774, -0.05883616, -1.627784, 0, 0, 0, 1, 1,
-0.5908564, -0.0558705, -3.079687, 0, 0, 0, 1, 1,
-0.5861795, 0.4424064, -2.592332, 0, 0, 0, 1, 1,
-0.5850909, 0.3352905, -2.036055, 0, 0, 0, 1, 1,
-0.5826095, -0.6899515, -2.444722, 0, 0, 0, 1, 1,
-0.5762229, -0.6827375, -2.086525, 1, 1, 1, 1, 1,
-0.5728377, 0.4580612, -1.888148, 1, 1, 1, 1, 1,
-0.5707399, -0.4206703, -3.245927, 1, 1, 1, 1, 1,
-0.5696047, -0.3790326, -3.857943, 1, 1, 1, 1, 1,
-0.5594788, 2.821914, -0.7113842, 1, 1, 1, 1, 1,
-0.5568686, 1.272144, -0.3838662, 1, 1, 1, 1, 1,
-0.5554782, 2.521772, 0.3531812, 1, 1, 1, 1, 1,
-0.5544461, -0.7587199, -2.842403, 1, 1, 1, 1, 1,
-0.5536914, 0.06857111, -2.100487, 1, 1, 1, 1, 1,
-0.5535717, -0.0236342, -0.732438, 1, 1, 1, 1, 1,
-0.549524, 0.07884325, -0.177407, 1, 1, 1, 1, 1,
-0.5492718, 1.331961, 0.2191417, 1, 1, 1, 1, 1,
-0.547288, 0.5852901, -0.01615004, 1, 1, 1, 1, 1,
-0.5451784, 0.5734073, 0.3712453, 1, 1, 1, 1, 1,
-0.5416699, 0.495324, -0.4752824, 1, 1, 1, 1, 1,
-0.5414178, 0.4457304, -0.9400603, 0, 0, 1, 1, 1,
-0.5378563, 0.4313553, -1.105682, 1, 0, 0, 1, 1,
-0.5374108, -0.5850435, -1.434356, 1, 0, 0, 1, 1,
-0.5287113, -0.1560936, -1.324003, 1, 0, 0, 1, 1,
-0.5286793, -0.4007206, -2.256671, 1, 0, 0, 1, 1,
-0.5154426, -0.5888788, -2.246473, 1, 0, 0, 1, 1,
-0.5145589, -0.1657284, -0.04039271, 0, 0, 0, 1, 1,
-0.5138327, 0.996322, -0.1741001, 0, 0, 0, 1, 1,
-0.5136917, -1.306885, -3.026141, 0, 0, 0, 1, 1,
-0.5044988, 0.6589555, -1.988887, 0, 0, 0, 1, 1,
-0.5034061, 0.09782244, -1.99167, 0, 0, 0, 1, 1,
-0.5012401, -0.2107749, -1.156813, 0, 0, 0, 1, 1,
-0.5010853, -1.571145, -2.096797, 0, 0, 0, 1, 1,
-0.5005248, -0.3473058, -2.344196, 1, 1, 1, 1, 1,
-0.4974601, 0.05548035, -0.8101923, 1, 1, 1, 1, 1,
-0.4945997, 1.915224, 0.03174851, 1, 1, 1, 1, 1,
-0.4935251, -0.04803027, -1.971212, 1, 1, 1, 1, 1,
-0.4934389, -0.301557, -2.041371, 1, 1, 1, 1, 1,
-0.4900684, 1.454901, -2.107627, 1, 1, 1, 1, 1,
-0.4875544, 0.5439839, -1.121103, 1, 1, 1, 1, 1,
-0.4848808, 0.2850366, -2.482641, 1, 1, 1, 1, 1,
-0.4824278, -2.877201, -4.102117, 1, 1, 1, 1, 1,
-0.4805483, 1.366227, 0.4637524, 1, 1, 1, 1, 1,
-0.4782797, 0.3549496, -0.8920217, 1, 1, 1, 1, 1,
-0.4755307, -0.4199409, -2.418966, 1, 1, 1, 1, 1,
-0.4680103, 0.9822918, -0.03765885, 1, 1, 1, 1, 1,
-0.4678562, 1.168474, -2.283142, 1, 1, 1, 1, 1,
-0.4655415, -1.746152, -2.527141, 1, 1, 1, 1, 1,
-0.4644066, -0.4029676, -2.23183, 0, 0, 1, 1, 1,
-0.463384, -0.7205198, -2.465256, 1, 0, 0, 1, 1,
-0.4622914, -0.3255696, -0.5272183, 1, 0, 0, 1, 1,
-0.45804, -0.1130615, -2.042054, 1, 0, 0, 1, 1,
-0.4565858, 0.3904647, 1.172291, 1, 0, 0, 1, 1,
-0.4563431, 0.6719376, 0.102978, 1, 0, 0, 1, 1,
-0.4557946, 1.111684, -0.6160532, 0, 0, 0, 1, 1,
-0.448655, 0.8316249, -1.023095, 0, 0, 0, 1, 1,
-0.4480438, -0.5053094, -1.129994, 0, 0, 0, 1, 1,
-0.4468631, -0.03337913, -1.256448, 0, 0, 0, 1, 1,
-0.4454756, -1.116351, -1.855185, 0, 0, 0, 1, 1,
-0.4441773, -0.3360056, -3.224389, 0, 0, 0, 1, 1,
-0.4377656, 0.9704866, 0.4642312, 0, 0, 0, 1, 1,
-0.4303127, 0.08920034, -1.936996, 1, 1, 1, 1, 1,
-0.4245903, -0.1630671, -3.035283, 1, 1, 1, 1, 1,
-0.4228735, 0.3022281, -1.312349, 1, 1, 1, 1, 1,
-0.4214656, -0.2022481, -0.5538353, 1, 1, 1, 1, 1,
-0.4153617, 0.4326046, -1.61873, 1, 1, 1, 1, 1,
-0.412532, 1.641949, 0.4218458, 1, 1, 1, 1, 1,
-0.4121696, -0.071043, -2.362389, 1, 1, 1, 1, 1,
-0.4116686, -1.001948, -5.092456, 1, 1, 1, 1, 1,
-0.4087257, 0.09943286, -0.8719454, 1, 1, 1, 1, 1,
-0.403301, 0.6141902, -0.06497697, 1, 1, 1, 1, 1,
-0.4032645, 0.9491897, 0.500438, 1, 1, 1, 1, 1,
-0.4016937, -0.1622258, -2.950904, 1, 1, 1, 1, 1,
-0.3985676, -0.5446829, -3.785614, 1, 1, 1, 1, 1,
-0.3960981, 0.8069459, -0.6518433, 1, 1, 1, 1, 1,
-0.3865702, 1.265165, -1.623496, 1, 1, 1, 1, 1,
-0.3815576, 1.602626, 0.2076385, 0, 0, 1, 1, 1,
-0.3801831, -1.672863, -2.892776, 1, 0, 0, 1, 1,
-0.3747043, -0.4098473, -1.71438, 1, 0, 0, 1, 1,
-0.3730611, -0.4793661, -1.450475, 1, 0, 0, 1, 1,
-0.3682454, 1.054676, 0.3253013, 1, 0, 0, 1, 1,
-0.365282, 0.5911943, -0.7277131, 1, 0, 0, 1, 1,
-0.356906, -0.2719589, -2.201101, 0, 0, 0, 1, 1,
-0.3550161, -0.4050179, -2.850377, 0, 0, 0, 1, 1,
-0.3500916, 0.4977324, 0.290669, 0, 0, 0, 1, 1,
-0.3499133, -0.7855195, -2.464766, 0, 0, 0, 1, 1,
-0.3479294, -0.6640426, -2.014011, 0, 0, 0, 1, 1,
-0.3464061, -1.793524, -2.882198, 0, 0, 0, 1, 1,
-0.3455574, -1.248491, -2.668138, 0, 0, 0, 1, 1,
-0.34321, 1.047617, -1.164013, 1, 1, 1, 1, 1,
-0.3416193, -0.03156495, -2.601401, 1, 1, 1, 1, 1,
-0.3407498, 0.7830458, -0.9786884, 1, 1, 1, 1, 1,
-0.3405006, -1.420962, -2.803884, 1, 1, 1, 1, 1,
-0.3404764, 0.2838711, 0.3740828, 1, 1, 1, 1, 1,
-0.3375224, 0.9219283, -1.073161, 1, 1, 1, 1, 1,
-0.3366931, 0.1119004, -0.1602484, 1, 1, 1, 1, 1,
-0.3340001, -0.04861464, -1.060002, 1, 1, 1, 1, 1,
-0.3329737, 0.6543857, -0.08809891, 1, 1, 1, 1, 1,
-0.3316799, 1.030306, -0.2225047, 1, 1, 1, 1, 1,
-0.3294183, -0.8331219, -3.51919, 1, 1, 1, 1, 1,
-0.326936, -0.3989612, -2.436738, 1, 1, 1, 1, 1,
-0.3257221, 0.2798302, -0.7157856, 1, 1, 1, 1, 1,
-0.3251742, -1.031412, -2.114264, 1, 1, 1, 1, 1,
-0.3248432, 1.102694, 0.4831944, 1, 1, 1, 1, 1,
-0.3230305, -1.407969, -2.233594, 0, 0, 1, 1, 1,
-0.3221727, -0.236652, 0.1018622, 1, 0, 0, 1, 1,
-0.3143297, 0.2381366, -1.301724, 1, 0, 0, 1, 1,
-0.3136007, 0.4739432, -0.8156288, 1, 0, 0, 1, 1,
-0.3123466, -0.4807507, -3.023589, 1, 0, 0, 1, 1,
-0.3119805, 0.5788324, -0.2797199, 1, 0, 0, 1, 1,
-0.3107163, -1.711001, -3.306625, 0, 0, 0, 1, 1,
-0.3098769, 0.07124034, -1.105587, 0, 0, 0, 1, 1,
-0.3087852, -0.3285866, -2.855165, 0, 0, 0, 1, 1,
-0.3062356, -0.4386877, -2.346147, 0, 0, 0, 1, 1,
-0.3050072, -1.147745, -3.920786, 0, 0, 0, 1, 1,
-0.3046871, -2.422256, -4.237347, 0, 0, 0, 1, 1,
-0.2993694, 0.1793845, -1.844744, 0, 0, 0, 1, 1,
-0.2926299, 0.06996365, -1.541533, 1, 1, 1, 1, 1,
-0.2877877, 0.3119034, 0.7833393, 1, 1, 1, 1, 1,
-0.2877087, -1.729975, -2.03324, 1, 1, 1, 1, 1,
-0.283531, 1.014449, 0.1534418, 1, 1, 1, 1, 1,
-0.2813503, 0.6001136, -0.4238045, 1, 1, 1, 1, 1,
-0.280481, 0.2594546, 0.7107064, 1, 1, 1, 1, 1,
-0.2768818, -0.6877792, -2.625021, 1, 1, 1, 1, 1,
-0.2766701, -1.016878, -4.19042, 1, 1, 1, 1, 1,
-0.2722365, 0.02956298, -3.367036, 1, 1, 1, 1, 1,
-0.2703235, 0.6589047, 0.9470645, 1, 1, 1, 1, 1,
-0.2700352, 0.7297524, -0.8689559, 1, 1, 1, 1, 1,
-0.2652143, -0.04941213, -1.755224, 1, 1, 1, 1, 1,
-0.2619318, -0.0514215, -0.836813, 1, 1, 1, 1, 1,
-0.2600619, 0.9089843, -0.3449464, 1, 1, 1, 1, 1,
-0.2592114, -0.53167, -1.47113, 1, 1, 1, 1, 1,
-0.2527544, -0.7831431, -1.816582, 0, 0, 1, 1, 1,
-0.2505471, 0.892287, 0.05289188, 1, 0, 0, 1, 1,
-0.2485878, -0.8999535, -2.43112, 1, 0, 0, 1, 1,
-0.2452221, -0.6094203, -3.073645, 1, 0, 0, 1, 1,
-0.2432367, 0.6827559, -0.4118657, 1, 0, 0, 1, 1,
-0.2421243, -1.164148, -3.027617, 1, 0, 0, 1, 1,
-0.2371004, -0.3678242, -4.014461, 0, 0, 0, 1, 1,
-0.2300483, -0.1548025, -3.013253, 0, 0, 0, 1, 1,
-0.2272041, -0.8790998, -1.412079, 0, 0, 0, 1, 1,
-0.2188997, 0.002321593, -1.582875, 0, 0, 0, 1, 1,
-0.2182915, -0.4521052, -3.101261, 0, 0, 0, 1, 1,
-0.2180984, 0.01927541, -2.040872, 0, 0, 0, 1, 1,
-0.2149034, 0.09545657, -0.9516225, 0, 0, 0, 1, 1,
-0.2136631, 1.194958, -0.2530125, 1, 1, 1, 1, 1,
-0.2060464, -0.7564999, -2.606115, 1, 1, 1, 1, 1,
-0.2012241, -1.060525, -1.792743, 1, 1, 1, 1, 1,
-0.2003782, -0.5554119, -4.599559, 1, 1, 1, 1, 1,
-0.1979167, -0.9515443, -1.673147, 1, 1, 1, 1, 1,
-0.1964086, 0.7570105, -0.3870184, 1, 1, 1, 1, 1,
-0.196293, -1.879717, -3.338046, 1, 1, 1, 1, 1,
-0.1938417, -0.01110495, -1.658498, 1, 1, 1, 1, 1,
-0.1929173, -0.5863871, -3.369462, 1, 1, 1, 1, 1,
-0.190449, 0.929413, -1.248593, 1, 1, 1, 1, 1,
-0.1869334, -0.1118409, -2.466981, 1, 1, 1, 1, 1,
-0.1820405, 0.6284715, -1.685227, 1, 1, 1, 1, 1,
-0.1782668, -0.553951, -2.286838, 1, 1, 1, 1, 1,
-0.174058, 0.4243048, -1.246879, 1, 1, 1, 1, 1,
-0.1679547, 1.356393, 0.008523336, 1, 1, 1, 1, 1,
-0.1669827, 0.4276942, -0.1959425, 0, 0, 1, 1, 1,
-0.1623682, 0.1244793, -0.7930935, 1, 0, 0, 1, 1,
-0.1619647, 0.4885022, 0.684735, 1, 0, 0, 1, 1,
-0.1578495, 0.5237957, -1.004836, 1, 0, 0, 1, 1,
-0.1533823, 0.1231663, 0.4610552, 1, 0, 0, 1, 1,
-0.1524888, -1.021468, -3.986063, 1, 0, 0, 1, 1,
-0.1518175, -2.345334, -1.804792, 0, 0, 0, 1, 1,
-0.1461555, 0.7348318, 0.04699514, 0, 0, 0, 1, 1,
-0.1388861, -1.327738, -4.535863, 0, 0, 0, 1, 1,
-0.1359628, -1.660634, -2.615893, 0, 0, 0, 1, 1,
-0.1329131, -0.5300453, -1.901559, 0, 0, 0, 1, 1,
-0.1294195, -0.05871828, -3.046081, 0, 0, 0, 1, 1,
-0.1292456, -0.510466, -3.581727, 0, 0, 0, 1, 1,
-0.1291314, -0.6996377, -2.5709, 1, 1, 1, 1, 1,
-0.128927, 1.307239, 0.4512935, 1, 1, 1, 1, 1,
-0.1287611, -1.252299, -1.28385, 1, 1, 1, 1, 1,
-0.1277809, -1.242482, -2.536124, 1, 1, 1, 1, 1,
-0.1268414, 0.4354242, -1.043255, 1, 1, 1, 1, 1,
-0.1253038, 0.9921766, -0.9406235, 1, 1, 1, 1, 1,
-0.1247357, -0.2349873, -3.997589, 1, 1, 1, 1, 1,
-0.1240525, 0.5413094, 1.011629, 1, 1, 1, 1, 1,
-0.1234467, 0.5193604, 0.08355317, 1, 1, 1, 1, 1,
-0.1203346, -0.3305226, -1.78083, 1, 1, 1, 1, 1,
-0.1199997, 1.017727, -0.5226204, 1, 1, 1, 1, 1,
-0.1173918, 1.430802, 1.564827, 1, 1, 1, 1, 1,
-0.1159341, 0.2589775, -0.4210807, 1, 1, 1, 1, 1,
-0.1142168, -1.172586, -2.216593, 1, 1, 1, 1, 1,
-0.1126569, 0.5264219, -2.939687, 1, 1, 1, 1, 1,
-0.1097863, -0.2182418, -2.697013, 0, 0, 1, 1, 1,
-0.1093734, -0.9876286, -2.092725, 1, 0, 0, 1, 1,
-0.1036743, 0.5723455, 0.3180009, 1, 0, 0, 1, 1,
-0.1011251, -0.1469615, -2.340276, 1, 0, 0, 1, 1,
-0.100172, -0.3771517, -3.72761, 1, 0, 0, 1, 1,
-0.09944184, 2.150643, 0.8923639, 1, 0, 0, 1, 1,
-0.0946063, -0.6462624, -2.647956, 0, 0, 0, 1, 1,
-0.09184808, 0.1282977, -0.3253088, 0, 0, 0, 1, 1,
-0.09053582, -0.1215508, -3.002272, 0, 0, 0, 1, 1,
-0.08581265, -0.5671471, -2.027993, 0, 0, 0, 1, 1,
-0.07959552, -0.6198102, -2.270691, 0, 0, 0, 1, 1,
-0.07767931, -0.9741499, -5.209488, 0, 0, 0, 1, 1,
-0.07340587, -0.6333217, -4.620458, 0, 0, 0, 1, 1,
-0.07212401, 1.958282, 0.5775877, 1, 1, 1, 1, 1,
-0.06939477, -1.459519, -4.372407, 1, 1, 1, 1, 1,
-0.06779252, 1.038464, 1.736761, 1, 1, 1, 1, 1,
-0.06601276, 1.570197, -1.052383, 1, 1, 1, 1, 1,
-0.06196394, -0.2558424, -2.596023, 1, 1, 1, 1, 1,
-0.06128256, -1.349985, -4.2774, 1, 1, 1, 1, 1,
-0.06122772, 1.118941, -0.4163876, 1, 1, 1, 1, 1,
-0.05911025, -0.5086998, -2.441434, 1, 1, 1, 1, 1,
-0.05835544, -0.2903129, -3.071471, 1, 1, 1, 1, 1,
-0.05713776, 0.2492056, -0.6055613, 1, 1, 1, 1, 1,
-0.05663273, -0.4096444, -4.597075, 1, 1, 1, 1, 1,
-0.05097185, 0.9823726, 0.1900681, 1, 1, 1, 1, 1,
-0.05068509, -0.3152741, -2.6101, 1, 1, 1, 1, 1,
-0.05005001, 0.6466288, -0.7717979, 1, 1, 1, 1, 1,
-0.04752681, 0.07757714, -1.253479, 1, 1, 1, 1, 1,
-0.04318815, -0.5450378, -2.791082, 0, 0, 1, 1, 1,
-0.04128307, -1.069085, -2.697799, 1, 0, 0, 1, 1,
-0.04122522, -1.099743, -4.656361, 1, 0, 0, 1, 1,
-0.0402811, 0.5255064, 0.2208312, 1, 0, 0, 1, 1,
-0.03718458, 0.6385763, -0.8927774, 1, 0, 0, 1, 1,
-0.02409582, -0.3654772, -1.919823, 1, 0, 0, 1, 1,
-0.02215123, 0.137865, -1.520259, 0, 0, 0, 1, 1,
-0.01991738, 0.6313996, -0.8988226, 0, 0, 0, 1, 1,
-0.01766786, -0.347766, -3.049529, 0, 0, 0, 1, 1,
-0.01706565, 0.7377982, 0.05551996, 0, 0, 0, 1, 1,
-0.01697209, -0.1826946, -3.729203, 0, 0, 0, 1, 1,
-0.01458346, 0.3767465, -1.148125, 0, 0, 0, 1, 1,
-0.01345992, -0.1256435, -3.215197, 0, 0, 0, 1, 1,
-0.01035304, 1.239094, -0.8065237, 1, 1, 1, 1, 1,
-0.01026321, -1.073608, -4.418444, 1, 1, 1, 1, 1,
-0.01013338, -0.7620124, -1.723387, 1, 1, 1, 1, 1,
-0.009826078, -0.3363902, -3.516917, 1, 1, 1, 1, 1,
-0.008614965, -0.554117, -5.362637, 1, 1, 1, 1, 1,
-0.008236805, 0.7050411, 0.4767227, 1, 1, 1, 1, 1,
-0.005005997, -0.2857467, -2.080328, 1, 1, 1, 1, 1,
-0.003736706, -0.1567886, -2.485288, 1, 1, 1, 1, 1,
-0.001987281, 0.7605296, -1.371765, 1, 1, 1, 1, 1,
-0.0002297085, 0.8397356, -0.01241201, 1, 1, 1, 1, 1,
0.0009446465, -1.00524, 3.551614, 1, 1, 1, 1, 1,
0.01142075, -0.09641057, 0.7168832, 1, 1, 1, 1, 1,
0.01433896, -0.6893792, 3.130161, 1, 1, 1, 1, 1,
0.01446093, 0.3805448, -0.2203057, 1, 1, 1, 1, 1,
0.01470874, 1.117438, -0.698533, 1, 1, 1, 1, 1,
0.01548643, -0.558375, 4.602873, 0, 0, 1, 1, 1,
0.01793201, 0.218699, -0.5303992, 1, 0, 0, 1, 1,
0.0189542, -0.5900676, 3.034668, 1, 0, 0, 1, 1,
0.02232581, 0.1063374, -0.6063563, 1, 0, 0, 1, 1,
0.02960468, 0.7247649, 0.03286325, 1, 0, 0, 1, 1,
0.0308779, -0.1346339, 3.154444, 1, 0, 0, 1, 1,
0.0390519, -1.255279, 3.194725, 0, 0, 0, 1, 1,
0.04319448, 1.082645, 0.1417494, 0, 0, 0, 1, 1,
0.04423762, -0.2754734, 1.166283, 0, 0, 0, 1, 1,
0.04656846, -1.35717, 3.418587, 0, 0, 0, 1, 1,
0.05159181, 0.5686191, -1.512229, 0, 0, 0, 1, 1,
0.05169252, 0.1650625, 0.2918302, 0, 0, 0, 1, 1,
0.05377245, 0.1992437, 1.926952, 0, 0, 0, 1, 1,
0.05571663, -1.976333, 2.934999, 1, 1, 1, 1, 1,
0.06035934, 0.4937565, 0.3603545, 1, 1, 1, 1, 1,
0.06108397, -0.3543963, 4.388805, 1, 1, 1, 1, 1,
0.06156963, 1.613282, 0.7245604, 1, 1, 1, 1, 1,
0.06342494, 1.176093, 0.7169772, 1, 1, 1, 1, 1,
0.06375045, -1.512937, 2.148636, 1, 1, 1, 1, 1,
0.06513556, -1.258003, 3.520343, 1, 1, 1, 1, 1,
0.06697193, 0.07553568, -0.09754568, 1, 1, 1, 1, 1,
0.07305284, 0.5541857, -0.8712395, 1, 1, 1, 1, 1,
0.0874012, -1.689304, 1.887996, 1, 1, 1, 1, 1,
0.09293582, 1.896887, -0.2447463, 1, 1, 1, 1, 1,
0.09869947, 0.5775261, -0.09016414, 1, 1, 1, 1, 1,
0.09924048, -1.317114, 4.304728, 1, 1, 1, 1, 1,
0.09955879, -2.372798, 3.424829, 1, 1, 1, 1, 1,
0.1008015, 0.02199382, 1.511367, 1, 1, 1, 1, 1,
0.1032946, 1.043832, 0.276609, 0, 0, 1, 1, 1,
0.1070557, 1.269084, -1.174643, 1, 0, 0, 1, 1,
0.1073302, -0.6756303, 2.518401, 1, 0, 0, 1, 1,
0.1098015, 0.9306325, 1.381491, 1, 0, 0, 1, 1,
0.1115231, -0.3755946, 2.245021, 1, 0, 0, 1, 1,
0.1132939, 0.516246, 1.380272, 1, 0, 0, 1, 1,
0.1140339, -0.6437939, 5.76953, 0, 0, 0, 1, 1,
0.1184682, 0.4234259, 1.331463, 0, 0, 0, 1, 1,
0.1238468, 0.1253461, 1.128917, 0, 0, 0, 1, 1,
0.125496, -0.1000525, 2.891441, 0, 0, 0, 1, 1,
0.1274074, -0.1616191, 2.577374, 0, 0, 0, 1, 1,
0.1295405, 0.3938619, 0.2608881, 0, 0, 0, 1, 1,
0.1317342, -0.592308, 2.821698, 0, 0, 0, 1, 1,
0.1333751, 0.1892476, 1.472221, 1, 1, 1, 1, 1,
0.1346494, -0.1659545, 0.5492552, 1, 1, 1, 1, 1,
0.1396596, -0.8752785, 3.583878, 1, 1, 1, 1, 1,
0.140095, -1.449432, 3.205145, 1, 1, 1, 1, 1,
0.1488086, -2.02589, 3.010849, 1, 1, 1, 1, 1,
0.1511347, 0.01349751, 3.936187, 1, 1, 1, 1, 1,
0.1544374, 1.251931, -0.8228133, 1, 1, 1, 1, 1,
0.1546518, 1.79628, 0.5743464, 1, 1, 1, 1, 1,
0.1652378, -1.099723, 3.911383, 1, 1, 1, 1, 1,
0.1662422, -0.8180295, 1.237151, 1, 1, 1, 1, 1,
0.1678172, -0.4483505, 3.187406, 1, 1, 1, 1, 1,
0.1699086, -0.05424544, 2.576858, 1, 1, 1, 1, 1,
0.1755608, -0.9020452, 2.5111, 1, 1, 1, 1, 1,
0.1763982, 1.111639, 0.6063931, 1, 1, 1, 1, 1,
0.1774869, -0.07346221, 2.402624, 1, 1, 1, 1, 1,
0.1850961, -1.312491, 2.742138, 0, 0, 1, 1, 1,
0.1862136, 0.6729826, 0.5574435, 1, 0, 0, 1, 1,
0.1892374, -1.699352, 3.42316, 1, 0, 0, 1, 1,
0.1932226, 0.1172856, -0.1301178, 1, 0, 0, 1, 1,
0.19529, 0.3640071, -1.015057, 1, 0, 0, 1, 1,
0.1967886, 0.5472075, -0.5017114, 1, 0, 0, 1, 1,
0.1981006, -1.169385, 2.925493, 0, 0, 0, 1, 1,
0.2022817, 0.7695019, 0.2294499, 0, 0, 0, 1, 1,
0.204473, 1.559144, 1.192195, 0, 0, 0, 1, 1,
0.2095745, -0.3337384, 1.258583, 0, 0, 0, 1, 1,
0.2109676, -0.5664813, 3.665547, 0, 0, 0, 1, 1,
0.2133101, -1.166948, 3.910566, 0, 0, 0, 1, 1,
0.2275251, 1.318769, -0.8574069, 0, 0, 0, 1, 1,
0.2367659, -0.01859288, 1.00773, 1, 1, 1, 1, 1,
0.2375978, 0.8771433, -0.9892809, 1, 1, 1, 1, 1,
0.2391156, 0.1469271, 1.336652, 1, 1, 1, 1, 1,
0.246022, -0.9679768, 3.932198, 1, 1, 1, 1, 1,
0.246611, 0.004055591, 1.628803, 1, 1, 1, 1, 1,
0.2466961, 0.4151469, 0.1684736, 1, 1, 1, 1, 1,
0.2474688, -0.350345, 3.055232, 1, 1, 1, 1, 1,
0.25669, -0.09874874, 1.980062, 1, 1, 1, 1, 1,
0.2593139, -1.214468, 3.134951, 1, 1, 1, 1, 1,
0.2643132, -0.8749664, 2.990777, 1, 1, 1, 1, 1,
0.2659959, 0.2018028, 1.121964, 1, 1, 1, 1, 1,
0.2676939, 1.045958, 0.7503886, 1, 1, 1, 1, 1,
0.2733686, 0.750774, 0.8204022, 1, 1, 1, 1, 1,
0.2756639, -1.266742, 2.060438, 1, 1, 1, 1, 1,
0.2761556, -1.585968, 2.818467, 1, 1, 1, 1, 1,
0.279265, -0.1064238, 1.400714, 0, 0, 1, 1, 1,
0.2859163, 0.2054381, -0.03059831, 1, 0, 0, 1, 1,
0.2876125, 0.1763869, 0.235856, 1, 0, 0, 1, 1,
0.2903453, -0.6977987, 2.539645, 1, 0, 0, 1, 1,
0.2905081, 0.8917549, -0.0133387, 1, 0, 0, 1, 1,
0.2973329, -2.041902, 2.02111, 1, 0, 0, 1, 1,
0.2980911, -0.9296292, 3.145672, 0, 0, 0, 1, 1,
0.3032257, 0.4085238, 0.09677857, 0, 0, 0, 1, 1,
0.3071731, -1.312409, 2.277681, 0, 0, 0, 1, 1,
0.308731, -2.033628, 2.341322, 0, 0, 0, 1, 1,
0.3121235, 1.295603, 1.19387, 0, 0, 0, 1, 1,
0.3160083, -1.201735, 3.858263, 0, 0, 0, 1, 1,
0.3192629, 0.1480185, 1.132741, 0, 0, 0, 1, 1,
0.3216906, -1.947482, 3.522054, 1, 1, 1, 1, 1,
0.3338171, 0.9570563, 2.018304, 1, 1, 1, 1, 1,
0.3359008, 0.6908043, -0.03973381, 1, 1, 1, 1, 1,
0.3359394, 0.1389478, 0.07874469, 1, 1, 1, 1, 1,
0.3368187, -0.1281707, 1.283917, 1, 1, 1, 1, 1,
0.3370838, 1.028955, 1.254484, 1, 1, 1, 1, 1,
0.3376904, 1.029679, 0.8092339, 1, 1, 1, 1, 1,
0.3390706, 0.05998453, -0.333845, 1, 1, 1, 1, 1,
0.339623, -1.122765, 2.330348, 1, 1, 1, 1, 1,
0.3400633, 0.6392295, 0.1744341, 1, 1, 1, 1, 1,
0.3407621, 0.0001600212, 0.1815739, 1, 1, 1, 1, 1,
0.3418615, 0.4070432, 1.347969, 1, 1, 1, 1, 1,
0.3480033, 0.6738165, 0.8851413, 1, 1, 1, 1, 1,
0.3480773, -0.5991755, 3.083891, 1, 1, 1, 1, 1,
0.3501807, -1.238151, 1.828346, 1, 1, 1, 1, 1,
0.351213, 0.5009028, -0.6225222, 0, 0, 1, 1, 1,
0.3513407, -0.2179437, 2.363209, 1, 0, 0, 1, 1,
0.3520125, 1.067226, -0.7667448, 1, 0, 0, 1, 1,
0.3532663, -0.2832135, 2.316987, 1, 0, 0, 1, 1,
0.3545438, -0.9531022, 1.663417, 1, 0, 0, 1, 1,
0.3591019, 0.3495263, 0.8358575, 1, 0, 0, 1, 1,
0.3670814, 0.1438598, 1.870295, 0, 0, 0, 1, 1,
0.3684621, -0.4715554, 1.032264, 0, 0, 0, 1, 1,
0.3703152, -0.8144831, 1.607797, 0, 0, 0, 1, 1,
0.3703564, -0.1659626, 2.018185, 0, 0, 0, 1, 1,
0.3708521, -1.201736, 2.84989, 0, 0, 0, 1, 1,
0.3722083, -0.06938002, -1.263355, 0, 0, 0, 1, 1,
0.3729801, -1.861601, 4.553156, 0, 0, 0, 1, 1,
0.3751647, 0.1413629, -0.2851635, 1, 1, 1, 1, 1,
0.378562, -0.4061937, 3.775831, 1, 1, 1, 1, 1,
0.3827027, 0.8075809, 0.7823015, 1, 1, 1, 1, 1,
0.3853227, 1.11483, -0.895772, 1, 1, 1, 1, 1,
0.3890894, 0.3697588, 0.7829397, 1, 1, 1, 1, 1,
0.3899484, -0.3013103, 1.301908, 1, 1, 1, 1, 1,
0.3900818, -0.5986892, 1.710791, 1, 1, 1, 1, 1,
0.3916032, 0.2246506, 2.826345, 1, 1, 1, 1, 1,
0.3932477, 0.05252241, 2.179572, 1, 1, 1, 1, 1,
0.3939553, 0.6609932, 1.042121, 1, 1, 1, 1, 1,
0.3941169, -0.3982176, 1.470147, 1, 1, 1, 1, 1,
0.3961415, 0.2766032, 0.9601226, 1, 1, 1, 1, 1,
0.3971817, -0.3955465, 2.292109, 1, 1, 1, 1, 1,
0.3991106, 1.135754, 3.520117, 1, 1, 1, 1, 1,
0.4090433, -0.1741578, 0.540098, 1, 1, 1, 1, 1,
0.4130946, 0.01277002, 2.308059, 0, 0, 1, 1, 1,
0.4158014, 1.672153, -0.4877961, 1, 0, 0, 1, 1,
0.4161316, -0.4836431, 2.569066, 1, 0, 0, 1, 1,
0.420633, 1.116057, -0.6934435, 1, 0, 0, 1, 1,
0.4237959, 0.02203765, 2.554284, 1, 0, 0, 1, 1,
0.4314133, 0.3076322, -0.7475001, 1, 0, 0, 1, 1,
0.432053, 0.5146812, 1.377827, 0, 0, 0, 1, 1,
0.434018, 0.3836488, 1.977765, 0, 0, 0, 1, 1,
0.4353429, 0.7184833, -0.4248157, 0, 0, 0, 1, 1,
0.4384365, 0.5551496, 0.875903, 0, 0, 0, 1, 1,
0.4392339, -1.285361, 3.794254, 0, 0, 0, 1, 1,
0.4469631, 1.602543, -0.5032498, 0, 0, 0, 1, 1,
0.4532242, -0.3487041, 1.732085, 0, 0, 0, 1, 1,
0.4551562, 0.5025898, 1.858465, 1, 1, 1, 1, 1,
0.4614508, -0.2610739, 3.237402, 1, 1, 1, 1, 1,
0.4639225, 0.9384453, -0.4039207, 1, 1, 1, 1, 1,
0.4641264, 0.8719343, -1.290968, 1, 1, 1, 1, 1,
0.4699123, 2.469282, -0.09911375, 1, 1, 1, 1, 1,
0.4724921, -1.98039, 0.04783686, 1, 1, 1, 1, 1,
0.4752748, 0.2843212, 1.956098, 1, 1, 1, 1, 1,
0.487353, 0.02033833, 4.746666, 1, 1, 1, 1, 1,
0.4887309, 0.0650541, 0.6851144, 1, 1, 1, 1, 1,
0.4902017, 1.803983, 0.8982646, 1, 1, 1, 1, 1,
0.4924135, -0.8623047, 2.855366, 1, 1, 1, 1, 1,
0.4940972, -1.164503, 2.297988, 1, 1, 1, 1, 1,
0.4949901, -0.9318063, 3.122703, 1, 1, 1, 1, 1,
0.4959173, -1.545211, 4.40204, 1, 1, 1, 1, 1,
0.4973535, 1.231764, -1.359897, 1, 1, 1, 1, 1,
0.4990654, 0.3593408, 0.3817905, 0, 0, 1, 1, 1,
0.5117244, 0.09634106, 0.4275472, 1, 0, 0, 1, 1,
0.51352, 0.3122529, -0.4613934, 1, 0, 0, 1, 1,
0.5144081, -0.3771771, 3.095764, 1, 0, 0, 1, 1,
0.5217218, -1.381478, 3.503569, 1, 0, 0, 1, 1,
0.5220259, -0.76661, 3.582027, 1, 0, 0, 1, 1,
0.5245988, 0.1240063, 0.2843929, 0, 0, 0, 1, 1,
0.5262644, -1.908483, 4.078747, 0, 0, 0, 1, 1,
0.5314083, 1.32248, 0.4207582, 0, 0, 0, 1, 1,
0.5319561, -0.7671943, 1.526237, 0, 0, 0, 1, 1,
0.5320755, -0.7949098, 3.583686, 0, 0, 0, 1, 1,
0.5323494, 2.002649, -0.3852338, 0, 0, 0, 1, 1,
0.5336745, 0.04382912, 1.759396, 0, 0, 0, 1, 1,
0.5437165, -0.7723898, 3.160893, 1, 1, 1, 1, 1,
0.5443425, -0.1447197, 1.31216, 1, 1, 1, 1, 1,
0.5443723, -0.1120758, 2.690724, 1, 1, 1, 1, 1,
0.554743, 0.5298005, 2.163971, 1, 1, 1, 1, 1,
0.5593939, -0.01118733, 1.782475, 1, 1, 1, 1, 1,
0.5594137, -0.7264532, 3.464544, 1, 1, 1, 1, 1,
0.560342, 1.09378, 1.375239, 1, 1, 1, 1, 1,
0.560934, -0.6510771, 1.221293, 1, 1, 1, 1, 1,
0.5623531, 0.2315384, -0.2357708, 1, 1, 1, 1, 1,
0.5667006, 1.025513, -0.6073841, 1, 1, 1, 1, 1,
0.5673248, 1.453242, -0.5398476, 1, 1, 1, 1, 1,
0.5704281, 0.6827462, 1.26619, 1, 1, 1, 1, 1,
0.5707409, 0.1647194, -0.06570154, 1, 1, 1, 1, 1,
0.5752432, 0.8739001, -0.8448481, 1, 1, 1, 1, 1,
0.5814804, 0.345437, 1.778032, 1, 1, 1, 1, 1,
0.5819978, 0.1078987, 2.783091, 0, 0, 1, 1, 1,
0.5836247, -0.7191373, 1.779774, 1, 0, 0, 1, 1,
0.5838772, 0.9026714, 2.052374, 1, 0, 0, 1, 1,
0.5868841, 0.8694667, 1.015657, 1, 0, 0, 1, 1,
0.5881908, -0.7247073, 3.476397, 1, 0, 0, 1, 1,
0.5896197, -0.9214613, 4.573196, 1, 0, 0, 1, 1,
0.593448, -0.4907988, 4.236213, 0, 0, 0, 1, 1,
0.5941438, 0.5434521, -0.2693323, 0, 0, 0, 1, 1,
0.5948609, 1.045455, 1.571529, 0, 0, 0, 1, 1,
0.600327, -0.2417736, 1.793354, 0, 0, 0, 1, 1,
0.6013469, -0.1928084, 3.369473, 0, 0, 0, 1, 1,
0.6025654, 0.5910639, 0.9981394, 0, 0, 0, 1, 1,
0.6051428, -1.031265, 3.065418, 0, 0, 0, 1, 1,
0.6060327, -0.9304713, 1.747423, 1, 1, 1, 1, 1,
0.6103991, -0.1111742, 1.346486, 1, 1, 1, 1, 1,
0.6115484, -0.477991, 2.667512, 1, 1, 1, 1, 1,
0.6177429, 0.2664276, 2.621282, 1, 1, 1, 1, 1,
0.6275336, -0.6001611, 2.753926, 1, 1, 1, 1, 1,
0.6280032, -0.2322746, 2.27054, 1, 1, 1, 1, 1,
0.6292269, 0.1323825, 1.101173, 1, 1, 1, 1, 1,
0.6394247, 0.09313131, 1.073321, 1, 1, 1, 1, 1,
0.6536938, 1.334265, 0.2842051, 1, 1, 1, 1, 1,
0.6588585, 2.183586, 1.205573, 1, 1, 1, 1, 1,
0.6628938, -0.5744135, 2.055079, 1, 1, 1, 1, 1,
0.6667098, 0.4792956, -1.905597, 1, 1, 1, 1, 1,
0.673052, -0.5320495, 2.728892, 1, 1, 1, 1, 1,
0.6741022, -0.3053716, 2.551283, 1, 1, 1, 1, 1,
0.6742271, -0.5091596, 2.459971, 1, 1, 1, 1, 1,
0.6745303, -0.1630935, 2.985863, 0, 0, 1, 1, 1,
0.675122, 0.2515187, 1.912863, 1, 0, 0, 1, 1,
0.6771964, 0.8716784, 0.273201, 1, 0, 0, 1, 1,
0.6827367, -1.219232, 1.606837, 1, 0, 0, 1, 1,
0.6835597, 0.1363605, 1.46432, 1, 0, 0, 1, 1,
0.6879461, -0.4824979, 1.194998, 1, 0, 0, 1, 1,
0.6883464, 1.494072, 2.310961, 0, 0, 0, 1, 1,
0.6923716, -0.2979928, 3.41132, 0, 0, 0, 1, 1,
0.6938066, 0.8617809, -0.3713961, 0, 0, 0, 1, 1,
0.6961178, 1.292965, 1.668564, 0, 0, 0, 1, 1,
0.7029744, 0.4049577, 0.2832713, 0, 0, 0, 1, 1,
0.7035893, 0.3701546, 3.432606, 0, 0, 0, 1, 1,
0.704161, -0.3042811, 0.8372685, 0, 0, 0, 1, 1,
0.7068449, -0.04779484, 1.227215, 1, 1, 1, 1, 1,
0.7071095, 0.9409635, -0.0479218, 1, 1, 1, 1, 1,
0.710785, -0.3132455, 1.440671, 1, 1, 1, 1, 1,
0.7115339, -1.334391, 2.681067, 1, 1, 1, 1, 1,
0.7117628, 0.4055633, 1.386538, 1, 1, 1, 1, 1,
0.7130712, 1.03517, 1.261626, 1, 1, 1, 1, 1,
0.7158136, -0.08175592, 0.9603074, 1, 1, 1, 1, 1,
0.7229071, -0.2604803, 2.385882, 1, 1, 1, 1, 1,
0.727841, -0.6074221, 1.781836, 1, 1, 1, 1, 1,
0.7321389, 1.245147, 0.7900915, 1, 1, 1, 1, 1,
0.7338511, 0.4832808, -1.590573, 1, 1, 1, 1, 1,
0.7349559, -0.1516661, 0.6603523, 1, 1, 1, 1, 1,
0.7353661, -0.7104819, 3.093242, 1, 1, 1, 1, 1,
0.7358544, -0.3675465, 1.61469, 1, 1, 1, 1, 1,
0.7370835, 0.2220247, 0.5501981, 1, 1, 1, 1, 1,
0.7398565, 0.4634431, 1.608724, 0, 0, 1, 1, 1,
0.7427009, -1.527676, 4.965051, 1, 0, 0, 1, 1,
0.7484564, 0.6017835, 1.091626, 1, 0, 0, 1, 1,
0.7667927, 0.6143088, 0.3969815, 1, 0, 0, 1, 1,
0.7683628, 1.240739, 0.39972, 1, 0, 0, 1, 1,
0.769311, -0.231205, 1.570706, 1, 0, 0, 1, 1,
0.7706921, -0.384412, 2.85729, 0, 0, 0, 1, 1,
0.7826599, 1.222133, -0.6829095, 0, 0, 0, 1, 1,
0.7893828, -0.381284, 2.488958, 0, 0, 0, 1, 1,
0.7931265, -0.1609918, 2.355558, 0, 0, 0, 1, 1,
0.8031092, 3.110879, 0.8800141, 0, 0, 0, 1, 1,
0.803931, -0.8079912, 1.021086, 0, 0, 0, 1, 1,
0.8102905, -0.6958115, 3.40872, 0, 0, 0, 1, 1,
0.8114551, -0.128614, 1.332259, 1, 1, 1, 1, 1,
0.8176324, 0.9862502, -1.772372, 1, 1, 1, 1, 1,
0.8192775, -0.7825937, 2.428835, 1, 1, 1, 1, 1,
0.8222982, -0.7497082, -1.360331, 1, 1, 1, 1, 1,
0.8226768, -0.25858, 1.239345, 1, 1, 1, 1, 1,
0.8251655, -0.1414451, 1.073096, 1, 1, 1, 1, 1,
0.8294812, 0.2180304, 0.7412158, 1, 1, 1, 1, 1,
0.8305605, 0.301908, 2.786561, 1, 1, 1, 1, 1,
0.8351861, -2.234204, 3.126588, 1, 1, 1, 1, 1,
0.8404162, -0.205429, 3.402478, 1, 1, 1, 1, 1,
0.8432688, -1.0002, 2.316867, 1, 1, 1, 1, 1,
0.8440833, -0.724337, 2.064071, 1, 1, 1, 1, 1,
0.8510747, 0.4219214, -0.2656902, 1, 1, 1, 1, 1,
0.8533003, 0.1807579, 1.822939, 1, 1, 1, 1, 1,
0.854275, -0.3162556, 1.969922, 1, 1, 1, 1, 1,
0.8573689, 0.5751405, 1.334166, 0, 0, 1, 1, 1,
0.8703712, 0.6579951, 0.3623907, 1, 0, 0, 1, 1,
0.8778479, 0.2191338, 1.771227, 1, 0, 0, 1, 1,
0.8840746, -0.6340014, 2.457623, 1, 0, 0, 1, 1,
0.8941608, 0.8508758, 1.394639, 1, 0, 0, 1, 1,
0.8966552, -0.1425658, 2.805866, 1, 0, 0, 1, 1,
0.9016291, 0.4162682, 0.8148992, 0, 0, 0, 1, 1,
0.902226, -0.4586079, 2.477994, 0, 0, 0, 1, 1,
0.9053261, -1.238173, 2.776109, 0, 0, 0, 1, 1,
0.9067456, -2.548332, 3.867266, 0, 0, 0, 1, 1,
0.9161654, 0.8295798, 1.629747, 0, 0, 0, 1, 1,
0.9173992, 0.6317148, 3.824702, 0, 0, 0, 1, 1,
0.9179285, 0.4263414, 0.6038441, 0, 0, 0, 1, 1,
0.9194865, -1.047347, 2.506333, 1, 1, 1, 1, 1,
0.9295584, -1.145391, 0.9392924, 1, 1, 1, 1, 1,
0.9317974, -1.238873, 2.246862, 1, 1, 1, 1, 1,
0.9526395, 1.044442, 2.368804, 1, 1, 1, 1, 1,
0.9543065, -1.115567, 2.364183, 1, 1, 1, 1, 1,
0.9582838, -0.5157279, 4.315559, 1, 1, 1, 1, 1,
0.9590377, 0.3561254, 2.526312, 1, 1, 1, 1, 1,
0.959163, 0.1279987, 1.046413, 1, 1, 1, 1, 1,
0.9613167, 0.5864981, 0.1586671, 1, 1, 1, 1, 1,
0.9679846, 0.1212469, 0.1692693, 1, 1, 1, 1, 1,
0.9696031, -0.5833064, 1.72786, 1, 1, 1, 1, 1,
0.9735014, 1.264083, 1.87796, 1, 1, 1, 1, 1,
0.9774496, 0.3848162, 1.259688, 1, 1, 1, 1, 1,
0.9841446, 0.8253865, 1.28155, 1, 1, 1, 1, 1,
0.9869328, -0.8588364, 1.979023, 1, 1, 1, 1, 1,
1.004557, 1.147067, -0.5405855, 0, 0, 1, 1, 1,
1.012993, 0.1780412, 1.895408, 1, 0, 0, 1, 1,
1.020713, 1.328099, 2.188461, 1, 0, 0, 1, 1,
1.026202, -0.5728386, 3.033666, 1, 0, 0, 1, 1,
1.031815, -0.7820378, 2.431121, 1, 0, 0, 1, 1,
1.036734, -0.4548393, 2.473063, 1, 0, 0, 1, 1,
1.037432, 1.360392, 1.839281, 0, 0, 0, 1, 1,
1.039654, 0.6198448, 1.025576, 0, 0, 0, 1, 1,
1.041158, 0.07826857, 2.024114, 0, 0, 0, 1, 1,
1.046117, 1.27069, 1.807137, 0, 0, 0, 1, 1,
1.054962, 1.73038, 2.04124, 0, 0, 0, 1, 1,
1.056054, -0.1800134, 2.810419, 0, 0, 0, 1, 1,
1.059229, -2.475565, 2.851047, 0, 0, 0, 1, 1,
1.059369, 0.7064427, 2.277672, 1, 1, 1, 1, 1,
1.060575, -0.4005195, 1.55718, 1, 1, 1, 1, 1,
1.066314, 0.935235, -1.63661, 1, 1, 1, 1, 1,
1.068493, -0.0578176, 2.581427, 1, 1, 1, 1, 1,
1.072956, 0.7352694, 0.2553366, 1, 1, 1, 1, 1,
1.074637, 1.026209, 0.7657313, 1, 1, 1, 1, 1,
1.075702, -0.2801051, 0.8956326, 1, 1, 1, 1, 1,
1.08063, -0.9292983, 2.298142, 1, 1, 1, 1, 1,
1.085891, -0.329201, 2.846219, 1, 1, 1, 1, 1,
1.088235, 1.778426, 0.6228676, 1, 1, 1, 1, 1,
1.090153, -0.6448746, 2.125237, 1, 1, 1, 1, 1,
1.090334, 2.20887, 0.7665874, 1, 1, 1, 1, 1,
1.102721, 0.1673468, 1.483084, 1, 1, 1, 1, 1,
1.104399, 0.5878943, 1.133916, 1, 1, 1, 1, 1,
1.10591, -0.2095674, 0.9089499, 1, 1, 1, 1, 1,
1.110902, -0.4929939, 1.320535, 0, 0, 1, 1, 1,
1.11342, -1.315168, 3.019911, 1, 0, 0, 1, 1,
1.131196, -0.08619039, 0.9809515, 1, 0, 0, 1, 1,
1.142625, -1.45877, 2.725131, 1, 0, 0, 1, 1,
1.143697, -1.248726, 3.528839, 1, 0, 0, 1, 1,
1.150785, -0.2769949, 0.8310711, 1, 0, 0, 1, 1,
1.152511, -0.04495712, 3.932426, 0, 0, 0, 1, 1,
1.153046, -1.599565, 1.668972, 0, 0, 0, 1, 1,
1.165923, -1.253569, 2.211136, 0, 0, 0, 1, 1,
1.173772, -1.694198, 2.29601, 0, 0, 0, 1, 1,
1.190353, 0.8588277, 1.394151, 0, 0, 0, 1, 1,
1.206391, 0.8377281, 2.489733, 0, 0, 0, 1, 1,
1.211349, 0.4319747, 0.05288615, 0, 0, 0, 1, 1,
1.216378, -0.5638947, 0.3115056, 1, 1, 1, 1, 1,
1.216611, -0.3764812, 2.034949, 1, 1, 1, 1, 1,
1.21818, -0.5389801, 3.322122, 1, 1, 1, 1, 1,
1.220078, -0.8105637, 2.789705, 1, 1, 1, 1, 1,
1.220554, -0.2629646, 1.432313, 1, 1, 1, 1, 1,
1.225901, -0.4989708, 1.399248, 1, 1, 1, 1, 1,
1.228042, 0.517292, -0.8020694, 1, 1, 1, 1, 1,
1.229777, -0.5475816, 2.629826, 1, 1, 1, 1, 1,
1.232742, -1.641423, -0.5636385, 1, 1, 1, 1, 1,
1.240619, -0.4295651, 2.276472, 1, 1, 1, 1, 1,
1.242114, 1.321638, -0.08748847, 1, 1, 1, 1, 1,
1.242212, -0.9431595, 1.759695, 1, 1, 1, 1, 1,
1.250217, -2.475221, 2.022882, 1, 1, 1, 1, 1,
1.250831, -0.2560319, 1.041064, 1, 1, 1, 1, 1,
1.251918, 0.7358804, 0.2335443, 1, 1, 1, 1, 1,
1.257734, -0.5505694, 0.6276559, 0, 0, 1, 1, 1,
1.260362, 1.106655, 0.9069015, 1, 0, 0, 1, 1,
1.267042, -1.070993, 3.588265, 1, 0, 0, 1, 1,
1.277151, -0.2653845, 1.733236, 1, 0, 0, 1, 1,
1.280582, -2.482117, 0.8159668, 1, 0, 0, 1, 1,
1.281123, 1.722652, 0.153275, 1, 0, 0, 1, 1,
1.287443, 1.003487, 0.08174098, 0, 0, 0, 1, 1,
1.288448, -0.5293677, 2.15138, 0, 0, 0, 1, 1,
1.297388, -0.5733202, 0.3947463, 0, 0, 0, 1, 1,
1.301144, 1.257677, -0.4376004, 0, 0, 0, 1, 1,
1.301467, -0.1832892, 0.2151821, 0, 0, 0, 1, 1,
1.313269, -0.02725308, 2.027464, 0, 0, 0, 1, 1,
1.315079, -3.088234, 5.078758, 0, 0, 0, 1, 1,
1.322307, 0.5041355, 1.505648, 1, 1, 1, 1, 1,
1.336855, -1.557451, 3.130501, 1, 1, 1, 1, 1,
1.343558, 0.4089081, 2.09862, 1, 1, 1, 1, 1,
1.347586, 1.046352, 3.29162, 1, 1, 1, 1, 1,
1.348616, 0.08373725, 0.8855045, 1, 1, 1, 1, 1,
1.349536, 0.1544752, 1.723471, 1, 1, 1, 1, 1,
1.355043, 1.051978, 1.470762, 1, 1, 1, 1, 1,
1.360817, -0.1858856, 2.069638, 1, 1, 1, 1, 1,
1.369685, -0.1827204, 1.24842, 1, 1, 1, 1, 1,
1.377667, 0.8644013, 0.8886167, 1, 1, 1, 1, 1,
1.394661, -0.2344583, 0.7431832, 1, 1, 1, 1, 1,
1.397712, 0.7164856, 4.255622, 1, 1, 1, 1, 1,
1.404747, -0.6358064, 2.289964, 1, 1, 1, 1, 1,
1.423658, -1.228349, 2.412061, 1, 1, 1, 1, 1,
1.424125, 0.315737, 3.665586, 1, 1, 1, 1, 1,
1.424466, -1.028011, 2.890613, 0, 0, 1, 1, 1,
1.437264, -1.750847, 1.300732, 1, 0, 0, 1, 1,
1.44746, 0.2106124, 2.708582, 1, 0, 0, 1, 1,
1.460642, -1.112048, 3.355635, 1, 0, 0, 1, 1,
1.492484, 0.07675403, 0.8967577, 1, 0, 0, 1, 1,
1.509593, -0.9264765, 2.871261, 1, 0, 0, 1, 1,
1.514477, 0.5756007, 0.9375843, 0, 0, 0, 1, 1,
1.531529, -1.399483, 3.979798, 0, 0, 0, 1, 1,
1.540379, -0.8411515, 1.043808, 0, 0, 0, 1, 1,
1.545431, -0.5686536, 1.302653, 0, 0, 0, 1, 1,
1.548046, -0.9573403, 4.993371, 0, 0, 0, 1, 1,
1.551929, -0.2009673, 0.2659826, 0, 0, 0, 1, 1,
1.557757, -0.1750983, 2.229987, 0, 0, 0, 1, 1,
1.567069, 2.161813, -2.149263, 1, 1, 1, 1, 1,
1.572185, 0.01284579, 0.9010705, 1, 1, 1, 1, 1,
1.576486, -0.04040099, 2.201378, 1, 1, 1, 1, 1,
1.593259, 0.05056946, -0.3268645, 1, 1, 1, 1, 1,
1.606311, -0.8708755, 2.67391, 1, 1, 1, 1, 1,
1.607395, 1.230142, 1.527058, 1, 1, 1, 1, 1,
1.625562, -0.3079604, 2.713329, 1, 1, 1, 1, 1,
1.629889, -0.5694848, 0.8768356, 1, 1, 1, 1, 1,
1.63966, 1.179357, 2.165056, 1, 1, 1, 1, 1,
1.642658, -1.576932, 1.717317, 1, 1, 1, 1, 1,
1.646704, 0.3379699, 0.8231311, 1, 1, 1, 1, 1,
1.656064, 1.372482, 0.85852, 1, 1, 1, 1, 1,
1.669967, 0.7954453, -0.7915724, 1, 1, 1, 1, 1,
1.689665, -1.017225, 1.700524, 1, 1, 1, 1, 1,
1.696729, -0.4256418, 2.971422, 1, 1, 1, 1, 1,
1.70904, -0.5789844, 2.089089, 0, 0, 1, 1, 1,
1.730619, -0.5757407, 1.255801, 1, 0, 0, 1, 1,
1.769417, -0.5539597, 2.187835, 1, 0, 0, 1, 1,
1.806977, -0.5916938, 1.35762, 1, 0, 0, 1, 1,
1.827431, 0.6042938, 0.7136638, 1, 0, 0, 1, 1,
1.835329, -1.143412, 1.558022, 1, 0, 0, 1, 1,
1.875652, 0.8734056, 1.355376, 0, 0, 0, 1, 1,
1.938784, 0.1590753, 1.972509, 0, 0, 0, 1, 1,
1.953902, -0.325573, 2.440763, 0, 0, 0, 1, 1,
1.962727, 1.051157, 2.500828, 0, 0, 0, 1, 1,
1.964403, 1.173196, 0.1611059, 0, 0, 0, 1, 1,
1.97867, -1.647469, 3.198829, 0, 0, 0, 1, 1,
1.995994, -0.3315276, 3.092268, 0, 0, 0, 1, 1,
2.01332, -1.299803, 2.856027, 1, 1, 1, 1, 1,
2.042417, -0.01657306, 1.961055, 1, 1, 1, 1, 1,
2.051601, 0.9486274, 0.9519152, 1, 1, 1, 1, 1,
2.065228, -0.2007912, 0.09513332, 1, 1, 1, 1, 1,
2.06727, 0.8656719, -0.2094614, 1, 1, 1, 1, 1,
2.075555, 0.2854891, 1.880297, 1, 1, 1, 1, 1,
2.120991, 0.1717385, 0.6031102, 1, 1, 1, 1, 1,
2.139098, -0.6563321, 3.118815, 1, 1, 1, 1, 1,
2.139471, 1.373726, 2.322783, 1, 1, 1, 1, 1,
2.216973, 0.4813047, 1.726756, 1, 1, 1, 1, 1,
2.226613, -1.062816, 0.5832182, 1, 1, 1, 1, 1,
2.253704, 0.5221296, 1.144813, 1, 1, 1, 1, 1,
2.288839, 1.883691, 0.6472838, 1, 1, 1, 1, 1,
2.364053, -0.06917046, 2.34297, 1, 1, 1, 1, 1,
2.371752, -0.3187889, 1.001659, 1, 1, 1, 1, 1,
2.374213, 0.9211755, 0.7981104, 0, 0, 1, 1, 1,
2.401988, -1.0271, 1.793059, 1, 0, 0, 1, 1,
2.408228, 0.6898767, 2.892548, 1, 0, 0, 1, 1,
2.44501, -0.6935322, 1.701887, 1, 0, 0, 1, 1,
2.455189, -0.02269309, 1.092062, 1, 0, 0, 1, 1,
2.465821, 0.449282, 1.337661, 1, 0, 0, 1, 1,
2.507634, 1.187098, 2.402337, 0, 0, 0, 1, 1,
2.545199, 0.3604887, 2.46548, 0, 0, 0, 1, 1,
2.552257, 0.3611887, 0.9166271, 0, 0, 0, 1, 1,
2.587827, 2.278053, 1.017433, 0, 0, 0, 1, 1,
2.591337, -0.1016164, 2.71616, 0, 0, 0, 1, 1,
2.739358, 0.775065, 0.9419357, 0, 0, 0, 1, 1,
2.760796, -0.1794949, 1.303291, 0, 0, 0, 1, 1,
2.793529, -1.791383, 1.929999, 1, 1, 1, 1, 1,
2.793711, 0.2385398, 0.6692258, 1, 1, 1, 1, 1,
2.860015, -1.778524, 1.664195, 1, 1, 1, 1, 1,
2.920856, 0.7158598, 0.4620551, 1, 1, 1, 1, 1,
2.97097, -0.3174351, 1.204191, 1, 1, 1, 1, 1,
3.424499, 0.7606245, 2.534914, 1, 1, 1, 1, 1,
3.466832, 0.03200025, 1.571115, 1, 1, 1, 1, 1
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
var radius = 9.876664;
var distance = 34.69136;
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
mvMatrix.translate( 0.08275795, -0.0113225, -0.2034466 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.69136);
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
