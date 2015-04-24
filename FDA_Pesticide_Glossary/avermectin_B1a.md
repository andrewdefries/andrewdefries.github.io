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
-3.581152, -1.638682, -0.3984995, 1, 0, 0, 1,
-3.21508, 1.445953, -1.945269, 1, 0.007843138, 0, 1,
-3.13924, 1.9518, -1.689104, 1, 0.01176471, 0, 1,
-3.021502, -0.08829825, -2.024457, 1, 0.01960784, 0, 1,
-2.987578, -0.1017928, -1.152452, 1, 0.02352941, 0, 1,
-2.797778, 1.347968, -2.212389, 1, 0.03137255, 0, 1,
-2.509417, 1.492166, -0.7738856, 1, 0.03529412, 0, 1,
-2.473545, -0.8041459, -1.355059, 1, 0.04313726, 0, 1,
-2.436883, -0.7327032, -1.344219, 1, 0.04705882, 0, 1,
-2.435833, 1.154819, -2.134257, 1, 0.05490196, 0, 1,
-2.400232, -0.2589374, -1.426999, 1, 0.05882353, 0, 1,
-2.388808, 1.052196, -0.3658414, 1, 0.06666667, 0, 1,
-2.384819, 0.9568458, -0.3630048, 1, 0.07058824, 0, 1,
-2.36083, 0.1973862, -1.431526, 1, 0.07843138, 0, 1,
-2.331617, -1.430627, -1.073365, 1, 0.08235294, 0, 1,
-2.276912, -1.450311, -2.650006, 1, 0.09019608, 0, 1,
-2.206368, -0.5779976, -1.317654, 1, 0.09411765, 0, 1,
-2.141948, -1.210089, -1.711975, 1, 0.1019608, 0, 1,
-2.085375, -0.04497832, -1.919453, 1, 0.1098039, 0, 1,
-2.083407, 0.6870822, -0.7677939, 1, 0.1137255, 0, 1,
-2.071661, 1.413608, -0.2386213, 1, 0.1215686, 0, 1,
-2.046517, 0.8400571, -1.302969, 1, 0.1254902, 0, 1,
-2.037795, -0.4423302, -1.472116, 1, 0.1333333, 0, 1,
-2.000492, -2.805312, -2.501177, 1, 0.1372549, 0, 1,
-1.990246, 0.708364, -1.492911, 1, 0.145098, 0, 1,
-1.97965, -1.239954, 0.2079975, 1, 0.1490196, 0, 1,
-1.966267, -0.2660351, -2.196119, 1, 0.1568628, 0, 1,
-1.950635, -0.4236145, -1.850597, 1, 0.1607843, 0, 1,
-1.945837, 0.8635824, -0.4800877, 1, 0.1686275, 0, 1,
-1.945718, -0.02861767, -1.167045, 1, 0.172549, 0, 1,
-1.93696, -0.2391533, -0.3838041, 1, 0.1803922, 0, 1,
-1.920729, -0.6379724, -2.839077, 1, 0.1843137, 0, 1,
-1.914865, -0.8126958, -3.197785, 1, 0.1921569, 0, 1,
-1.90648, -1.259005, -0.8996384, 1, 0.1960784, 0, 1,
-1.903682, -0.3286563, 0.2033755, 1, 0.2039216, 0, 1,
-1.887251, 1.568508, -1.831186, 1, 0.2117647, 0, 1,
-1.881521, 1.632964, -1.017727, 1, 0.2156863, 0, 1,
-1.873827, 1.011469, -1.207541, 1, 0.2235294, 0, 1,
-1.86494, 0.6340979, -0.7255034, 1, 0.227451, 0, 1,
-1.859703, 0.3905817, -3.790797, 1, 0.2352941, 0, 1,
-1.818154, -1.274001, -3.89435, 1, 0.2392157, 0, 1,
-1.807012, 0.1403701, -0.9782586, 1, 0.2470588, 0, 1,
-1.806025, -0.1324369, -1.205279, 1, 0.2509804, 0, 1,
-1.74501, 0.6135674, -0.2299371, 1, 0.2588235, 0, 1,
-1.704026, -1.375614, -2.120811, 1, 0.2627451, 0, 1,
-1.701758, 0.4965533, -1.423742, 1, 0.2705882, 0, 1,
-1.700487, -1.237546, -1.043355, 1, 0.2745098, 0, 1,
-1.698653, 0.3527166, -4.960675, 1, 0.282353, 0, 1,
-1.695609, 0.5492451, -1.459883, 1, 0.2862745, 0, 1,
-1.691444, -0.09654341, -1.830985, 1, 0.2941177, 0, 1,
-1.681682, -0.4367546, -2.003645, 1, 0.3019608, 0, 1,
-1.679159, 1.350152, 0.6548619, 1, 0.3058824, 0, 1,
-1.670133, 0.2986907, 1.278832, 1, 0.3137255, 0, 1,
-1.645285, -0.2668232, -0.341459, 1, 0.3176471, 0, 1,
-1.636954, -0.7278546, -0.9224977, 1, 0.3254902, 0, 1,
-1.617667, 0.6944782, -1.719508, 1, 0.3294118, 0, 1,
-1.614571, -0.9863548, -0.5708491, 1, 0.3372549, 0, 1,
-1.604714, 0.008334761, -3.071455, 1, 0.3411765, 0, 1,
-1.596784, -0.9701183, -3.587963, 1, 0.3490196, 0, 1,
-1.577004, 0.1932167, 0.8594981, 1, 0.3529412, 0, 1,
-1.569698, -0.2022281, -2.488439, 1, 0.3607843, 0, 1,
-1.569035, -0.2299291, -2.389353, 1, 0.3647059, 0, 1,
-1.56811, -0.2435222, -2.590164, 1, 0.372549, 0, 1,
-1.56673, 0.3470878, -2.375571, 1, 0.3764706, 0, 1,
-1.564174, 1.201611, -2.518977, 1, 0.3843137, 0, 1,
-1.563569, 0.6689085, -0.637566, 1, 0.3882353, 0, 1,
-1.540985, -0.5942439, -1.662656, 1, 0.3960784, 0, 1,
-1.540448, 1.070495, -1.30117, 1, 0.4039216, 0, 1,
-1.533485, -0.4924335, -2.004714, 1, 0.4078431, 0, 1,
-1.525865, -0.520268, -3.17488, 1, 0.4156863, 0, 1,
-1.518207, 1.486903, -1.513462, 1, 0.4196078, 0, 1,
-1.516908, -2.156163, -0.591858, 1, 0.427451, 0, 1,
-1.511704, 0.9851478, -0.4221675, 1, 0.4313726, 0, 1,
-1.510969, -1.014103, -1.776449, 1, 0.4392157, 0, 1,
-1.510872, -1.058887, -3.325279, 1, 0.4431373, 0, 1,
-1.510292, -1.895759, -3.352089, 1, 0.4509804, 0, 1,
-1.501743, 1.084939, -2.313517, 1, 0.454902, 0, 1,
-1.49382, -1.21035, -1.408676, 1, 0.4627451, 0, 1,
-1.481929, -0.2857347, -1.333665, 1, 0.4666667, 0, 1,
-1.474942, -0.8413548, -2.822275, 1, 0.4745098, 0, 1,
-1.466784, -0.6744974, -2.69022, 1, 0.4784314, 0, 1,
-1.464219, -1.194906, -1.592993, 1, 0.4862745, 0, 1,
-1.459233, -1.490863, -2.365427, 1, 0.4901961, 0, 1,
-1.45271, 1.404416, -1.894581, 1, 0.4980392, 0, 1,
-1.438932, -0.005238307, -0.6009293, 1, 0.5058824, 0, 1,
-1.428554, 0.7144997, -2.298133, 1, 0.509804, 0, 1,
-1.424823, -0.2841728, -1.369319, 1, 0.5176471, 0, 1,
-1.410531, 0.8810009, -1.2349, 1, 0.5215687, 0, 1,
-1.406179, 1.468417, -0.7394493, 1, 0.5294118, 0, 1,
-1.399041, -0.461828, -2.070158, 1, 0.5333334, 0, 1,
-1.393505, -0.3359465, -0.2612976, 1, 0.5411765, 0, 1,
-1.388809, 0.5246097, -0.412424, 1, 0.5450981, 0, 1,
-1.385908, 0.6370661, -2.003887, 1, 0.5529412, 0, 1,
-1.384253, 0.8559271, -3.104857, 1, 0.5568628, 0, 1,
-1.383728, -0.4460936, -1.155269, 1, 0.5647059, 0, 1,
-1.372743, 0.3429952, -1.935645, 1, 0.5686275, 0, 1,
-1.365971, -0.8187652, -1.350999, 1, 0.5764706, 0, 1,
-1.362519, 0.7326965, -2.000525, 1, 0.5803922, 0, 1,
-1.358386, 1.451941, -1.128637, 1, 0.5882353, 0, 1,
-1.355812, -0.3801126, -2.673025, 1, 0.5921569, 0, 1,
-1.332619, 0.4909622, -1.141885, 1, 0.6, 0, 1,
-1.32695, 0.4760837, -1.672269, 1, 0.6078432, 0, 1,
-1.321658, 0.4208993, -1.301717, 1, 0.6117647, 0, 1,
-1.299876, -0.6814045, -1.776608, 1, 0.6196079, 0, 1,
-1.277404, -0.8355875, -1.726751, 1, 0.6235294, 0, 1,
-1.273421, 1.19187, -0.5314897, 1, 0.6313726, 0, 1,
-1.273252, -0.4532006, -2.405112, 1, 0.6352941, 0, 1,
-1.267594, -0.5016857, -2.08024, 1, 0.6431373, 0, 1,
-1.262516, -1.664655, -3.84333, 1, 0.6470588, 0, 1,
-1.257005, 1.1978, -2.002073, 1, 0.654902, 0, 1,
-1.252611, -0.4129343, -3.435084, 1, 0.6588235, 0, 1,
-1.251397, -0.03292577, -0.7936039, 1, 0.6666667, 0, 1,
-1.237178, 1.689867, -0.773563, 1, 0.6705883, 0, 1,
-1.215068, -0.887744, -3.630424, 1, 0.6784314, 0, 1,
-1.209982, 0.3575167, -2.066708, 1, 0.682353, 0, 1,
-1.208254, 0.08629224, -2.1348, 1, 0.6901961, 0, 1,
-1.208253, -1.757197, -2.088908, 1, 0.6941177, 0, 1,
-1.206004, 2.586221, -0.4335313, 1, 0.7019608, 0, 1,
-1.202052, 0.1323945, -1.850974, 1, 0.7098039, 0, 1,
-1.202048, -0.06437762, -3.318818, 1, 0.7137255, 0, 1,
-1.201909, -0.3115222, -2.547712, 1, 0.7215686, 0, 1,
-1.191586, -0.8953024, -4.403618, 1, 0.7254902, 0, 1,
-1.189339, -0.4157277, -0.7886961, 1, 0.7333333, 0, 1,
-1.186129, 0.7439218, -0.8466938, 1, 0.7372549, 0, 1,
-1.185949, 1.070051, -0.9746798, 1, 0.7450981, 0, 1,
-1.17988, -0.01735494, -4.181135, 1, 0.7490196, 0, 1,
-1.179473, -1.495197, -2.215579, 1, 0.7568628, 0, 1,
-1.174531, -0.1184021, -0.3973086, 1, 0.7607843, 0, 1,
-1.168783, 0.8400165, -0.4113478, 1, 0.7686275, 0, 1,
-1.167179, -0.4831499, -2.23983, 1, 0.772549, 0, 1,
-1.160194, -0.9299101, -0.4712152, 1, 0.7803922, 0, 1,
-1.15818, 1.561527, -1.122401, 1, 0.7843137, 0, 1,
-1.148823, 0.5754607, -0.121291, 1, 0.7921569, 0, 1,
-1.148698, -0.4738611, -2.513511, 1, 0.7960784, 0, 1,
-1.144932, 0.8000077, -1.783883, 1, 0.8039216, 0, 1,
-1.138489, 0.8731858, -1.79968, 1, 0.8117647, 0, 1,
-1.13783, -1.551764, -0.8287083, 1, 0.8156863, 0, 1,
-1.135567, 0.6898111, -2.17342, 1, 0.8235294, 0, 1,
-1.135466, 0.2842243, 0.3549904, 1, 0.827451, 0, 1,
-1.117777, -1.618798, -3.141724, 1, 0.8352941, 0, 1,
-1.102425, 0.8349193, -3.455907, 1, 0.8392157, 0, 1,
-1.101141, -1.982976, -2.719472, 1, 0.8470588, 0, 1,
-1.098195, -1.734756, -1.168616, 1, 0.8509804, 0, 1,
-1.096977, -0.3640463, -2.074713, 1, 0.8588235, 0, 1,
-1.096674, 0.3216483, 0.5526851, 1, 0.8627451, 0, 1,
-1.092843, 0.1724045, -1.642141, 1, 0.8705882, 0, 1,
-1.091338, -1.037581, -4.448627, 1, 0.8745098, 0, 1,
-1.085336, 1.288567, -1.797238, 1, 0.8823529, 0, 1,
-1.083288, -0.2145883, -0.9322044, 1, 0.8862745, 0, 1,
-1.066403, 0.3512617, -1.206809, 1, 0.8941177, 0, 1,
-1.065888, 0.4729602, -1.377818, 1, 0.8980392, 0, 1,
-1.064848, -0.5581818, -1.727025, 1, 0.9058824, 0, 1,
-1.054271, 0.9785671, -1.70055, 1, 0.9137255, 0, 1,
-1.050486, 0.1920461, -1.666659, 1, 0.9176471, 0, 1,
-1.040761, -0.4755957, -1.718436, 1, 0.9254902, 0, 1,
-1.037626, -0.2615166, -2.719263, 1, 0.9294118, 0, 1,
-1.036771, 0.1838725, -1.645704, 1, 0.9372549, 0, 1,
-1.031815, 0.8872368, -1.739136, 1, 0.9411765, 0, 1,
-1.029078, -0.7605219, -2.355177, 1, 0.9490196, 0, 1,
-1.028955, 0.709728, -1.101622, 1, 0.9529412, 0, 1,
-1.023321, -2.226219, -2.678774, 1, 0.9607843, 0, 1,
-1.01535, 0.2777047, -0.3868276, 1, 0.9647059, 0, 1,
-1.008731, 1.439408, 0.503163, 1, 0.972549, 0, 1,
-1.006425, -1.007548, -2.461627, 1, 0.9764706, 0, 1,
-1.000765, 0.4746836, -1.109874, 1, 0.9843137, 0, 1,
-1.000755, 1.843858, 0.9312461, 1, 0.9882353, 0, 1,
-0.9988342, -0.7584388, -3.216572, 1, 0.9960784, 0, 1,
-0.9977947, 0.3313943, -0.5863199, 0.9960784, 1, 0, 1,
-0.992066, -0.3524958, -1.382234, 0.9921569, 1, 0, 1,
-0.9884092, 0.2661429, -1.475844, 0.9843137, 1, 0, 1,
-0.9877027, 1.063851, -1.230197, 0.9803922, 1, 0, 1,
-0.9868042, 0.9025866, -2.812343, 0.972549, 1, 0, 1,
-0.9830651, -0.352438, -1.837867, 0.9686275, 1, 0, 1,
-0.9792491, -0.03475993, -0.5259957, 0.9607843, 1, 0, 1,
-0.9632555, -0.04995979, -0.6077385, 0.9568627, 1, 0, 1,
-0.9401971, -0.511681, -1.040247, 0.9490196, 1, 0, 1,
-0.9377319, 0.7699649, -0.1615979, 0.945098, 1, 0, 1,
-0.9323542, -0.1915272, -1.500478, 0.9372549, 1, 0, 1,
-0.9321221, 0.217829, -1.125358, 0.9333333, 1, 0, 1,
-0.9305264, -1.016523, -2.899107, 0.9254902, 1, 0, 1,
-0.9291297, -1.015185, -1.873302, 0.9215686, 1, 0, 1,
-0.9123991, 0.3096774, -2.796828, 0.9137255, 1, 0, 1,
-0.9122328, 2.48814, 0.9849548, 0.9098039, 1, 0, 1,
-0.9003943, -0.6537933, -2.14851, 0.9019608, 1, 0, 1,
-0.8977316, 0.1969267, -1.682642, 0.8941177, 1, 0, 1,
-0.8934278, 0.4384693, -0.03542557, 0.8901961, 1, 0, 1,
-0.8901023, -0.9945987, -1.02831, 0.8823529, 1, 0, 1,
-0.8865713, -1.283681, -1.372947, 0.8784314, 1, 0, 1,
-0.8863738, -2.443529, -1.854125, 0.8705882, 1, 0, 1,
-0.8825228, 0.7768445, -2.013717, 0.8666667, 1, 0, 1,
-0.8803063, -0.2914527, -1.621114, 0.8588235, 1, 0, 1,
-0.8755768, 0.2160559, -0.5514326, 0.854902, 1, 0, 1,
-0.8716137, 1.917631, -1.701858, 0.8470588, 1, 0, 1,
-0.8650119, -1.25167, -1.383978, 0.8431373, 1, 0, 1,
-0.861551, -1.157175, -2.889874, 0.8352941, 1, 0, 1,
-0.8614275, -0.02274854, -0.9746805, 0.8313726, 1, 0, 1,
-0.8591815, -0.5407618, -1.525285, 0.8235294, 1, 0, 1,
-0.8545728, -0.5111073, -3.033872, 0.8196079, 1, 0, 1,
-0.854013, -0.5757768, -0.4333682, 0.8117647, 1, 0, 1,
-0.8519957, -0.4035863, -3.688354, 0.8078431, 1, 0, 1,
-0.8483378, 1.032995, -1.789532, 0.8, 1, 0, 1,
-0.8465807, 0.291405, -0.9304506, 0.7921569, 1, 0, 1,
-0.8453039, 2.270159, -2.421099, 0.7882353, 1, 0, 1,
-0.8402419, 0.04917656, -0.8300549, 0.7803922, 1, 0, 1,
-0.8354724, -0.05167174, -0.2925642, 0.7764706, 1, 0, 1,
-0.828844, 1.410312, -0.0966626, 0.7686275, 1, 0, 1,
-0.8141223, 0.2425623, -0.1228239, 0.7647059, 1, 0, 1,
-0.8117611, -0.07376997, -1.593324, 0.7568628, 1, 0, 1,
-0.8102379, 0.163301, -1.690924, 0.7529412, 1, 0, 1,
-0.8071989, -0.3883385, -2.026369, 0.7450981, 1, 0, 1,
-0.8040468, -0.02475936, -2.106889, 0.7411765, 1, 0, 1,
-0.8038712, 0.1655233, -1.690807, 0.7333333, 1, 0, 1,
-0.8038247, 2.368073, -0.8631845, 0.7294118, 1, 0, 1,
-0.7994111, -0.0824903, -2.174008, 0.7215686, 1, 0, 1,
-0.7982496, -0.6626485, -2.201139, 0.7176471, 1, 0, 1,
-0.7968038, -0.2394896, -1.333062, 0.7098039, 1, 0, 1,
-0.7938014, -0.3898357, -2.049093, 0.7058824, 1, 0, 1,
-0.7935681, -1.550398, -2.876998, 0.6980392, 1, 0, 1,
-0.7914366, -0.5213085, -1.292584, 0.6901961, 1, 0, 1,
-0.7907597, -1.03291, -2.624863, 0.6862745, 1, 0, 1,
-0.7900467, -0.06322021, -2.639207, 0.6784314, 1, 0, 1,
-0.7875049, 0.4990252, -1.064406, 0.6745098, 1, 0, 1,
-0.7788513, 1.014659, 0.7658057, 0.6666667, 1, 0, 1,
-0.7782647, -1.005565, -3.429196, 0.6627451, 1, 0, 1,
-0.7748336, 0.3939051, -0.4797641, 0.654902, 1, 0, 1,
-0.7729082, -0.5404584, -1.200289, 0.6509804, 1, 0, 1,
-0.7725185, -2.074671, -2.17945, 0.6431373, 1, 0, 1,
-0.7708113, -0.4167374, -0.4268101, 0.6392157, 1, 0, 1,
-0.7684367, -1.31021, -3.55606, 0.6313726, 1, 0, 1,
-0.7659025, -1.134634, -3.059321, 0.627451, 1, 0, 1,
-0.7589309, 2.629283, -0.319348, 0.6196079, 1, 0, 1,
-0.749476, 0.4794455, -1.194184, 0.6156863, 1, 0, 1,
-0.7491951, 1.247303, 1.327738, 0.6078432, 1, 0, 1,
-0.7473292, 1.234861, -0.7170664, 0.6039216, 1, 0, 1,
-0.7457842, -0.2949725, -1.807497, 0.5960785, 1, 0, 1,
-0.7417944, 0.1306283, -0.6521214, 0.5882353, 1, 0, 1,
-0.7411956, 1.014427, 0.2036611, 0.5843138, 1, 0, 1,
-0.7406583, 1.183073, -0.9687585, 0.5764706, 1, 0, 1,
-0.7374129, -1.119264, -1.056245, 0.572549, 1, 0, 1,
-0.7328193, -1.56782, -3.469356, 0.5647059, 1, 0, 1,
-0.7298947, -1.236947, -2.506849, 0.5607843, 1, 0, 1,
-0.7225376, 0.1911959, -1.281936, 0.5529412, 1, 0, 1,
-0.7214648, -0.8867434, -4.056336, 0.5490196, 1, 0, 1,
-0.7177993, 0.399123, -0.2099586, 0.5411765, 1, 0, 1,
-0.7089354, -0.8109074, -3.389059, 0.5372549, 1, 0, 1,
-0.7080936, -0.8204709, -3.404411, 0.5294118, 1, 0, 1,
-0.6972497, -0.3407546, -2.647839, 0.5254902, 1, 0, 1,
-0.6962602, -0.3148373, -1.730857, 0.5176471, 1, 0, 1,
-0.6948162, -1.344842, -3.843178, 0.5137255, 1, 0, 1,
-0.6898911, 1.562768, 0.3292092, 0.5058824, 1, 0, 1,
-0.6880792, -0.1634981, -1.363103, 0.5019608, 1, 0, 1,
-0.6873307, -0.7339739, -3.135554, 0.4941176, 1, 0, 1,
-0.6843987, -1.139396, -4.010275, 0.4862745, 1, 0, 1,
-0.6787055, -0.7370505, -2.796674, 0.4823529, 1, 0, 1,
-0.675745, -1.314244, -3.062409, 0.4745098, 1, 0, 1,
-0.6701068, -0.7041785, -2.691792, 0.4705882, 1, 0, 1,
-0.6664344, -0.9715333, -2.372052, 0.4627451, 1, 0, 1,
-0.6655625, -0.8267245, -2.008152, 0.4588235, 1, 0, 1,
-0.663322, 0.426759, -1.241093, 0.4509804, 1, 0, 1,
-0.662347, 0.3716115, 1.027654, 0.4470588, 1, 0, 1,
-0.6608498, -1.340574, -0.9206231, 0.4392157, 1, 0, 1,
-0.6600811, -0.6886578, -1.442242, 0.4352941, 1, 0, 1,
-0.6571032, 1.630843, 0.3024374, 0.427451, 1, 0, 1,
-0.6538862, 1.093925, 1.980064, 0.4235294, 1, 0, 1,
-0.6496287, -1.482224, -3.804079, 0.4156863, 1, 0, 1,
-0.6461713, 1.539966, 0.8508378, 0.4117647, 1, 0, 1,
-0.6452736, 0.4951102, -1.804301, 0.4039216, 1, 0, 1,
-0.641821, 0.8586973, 1.174574, 0.3960784, 1, 0, 1,
-0.6407778, -0.2484493, -1.412495, 0.3921569, 1, 0, 1,
-0.6367267, -2.270382, -2.774834, 0.3843137, 1, 0, 1,
-0.6361272, -1.32462, -3.187602, 0.3803922, 1, 0, 1,
-0.6351367, -0.2117016, -3.496791, 0.372549, 1, 0, 1,
-0.628589, -1.116121, -2.623322, 0.3686275, 1, 0, 1,
-0.6280762, 0.6246606, 0.1777083, 0.3607843, 1, 0, 1,
-0.624059, -2.859008, -3.403116, 0.3568628, 1, 0, 1,
-0.6238009, -0.6052693, -3.609534, 0.3490196, 1, 0, 1,
-0.6236917, 1.47708, 0.8401417, 0.345098, 1, 0, 1,
-0.6147238, 0.6853722, -1.74543, 0.3372549, 1, 0, 1,
-0.6130907, -0.8054618, -3.70455, 0.3333333, 1, 0, 1,
-0.6108957, -0.1797129, -1.469702, 0.3254902, 1, 0, 1,
-0.6055866, -1.277247, -4.309941, 0.3215686, 1, 0, 1,
-0.6055695, 0.6740883, -0.9801329, 0.3137255, 1, 0, 1,
-0.6031733, 0.8951929, -2.025352, 0.3098039, 1, 0, 1,
-0.6006207, 0.1746207, -1.933258, 0.3019608, 1, 0, 1,
-0.5962517, -0.910162, -1.049467, 0.2941177, 1, 0, 1,
-0.5943789, -0.03370509, 0.4858764, 0.2901961, 1, 0, 1,
-0.5888802, -0.9297484, -1.795662, 0.282353, 1, 0, 1,
-0.5879794, -1.27792, -3.900175, 0.2784314, 1, 0, 1,
-0.5845287, -1.262331, -1.258382, 0.2705882, 1, 0, 1,
-0.5752944, 0.08729179, -1.719245, 0.2666667, 1, 0, 1,
-0.5648872, 0.2044449, -2.678735, 0.2588235, 1, 0, 1,
-0.5645329, 1.040755, 1.356854, 0.254902, 1, 0, 1,
-0.5612248, -0.7580144, -2.238762, 0.2470588, 1, 0, 1,
-0.5602705, 0.3776235, -1.426307, 0.2431373, 1, 0, 1,
-0.5600503, 2.003389, 1.023041, 0.2352941, 1, 0, 1,
-0.558355, -0.7155476, -2.115919, 0.2313726, 1, 0, 1,
-0.548433, 0.3250839, -2.219922, 0.2235294, 1, 0, 1,
-0.5399449, 0.7000861, 0.2338809, 0.2196078, 1, 0, 1,
-0.5389682, -1.218788, -2.041081, 0.2117647, 1, 0, 1,
-0.5387062, 2.088652, -0.7069135, 0.2078431, 1, 0, 1,
-0.5339946, 0.3063466, -2.385757, 0.2, 1, 0, 1,
-0.5329486, -0.7831401, -1.602857, 0.1921569, 1, 0, 1,
-0.5301951, -0.4265687, -0.9200427, 0.1882353, 1, 0, 1,
-0.5230185, 0.01342628, -0.9914408, 0.1803922, 1, 0, 1,
-0.5222076, -2.042391, -3.486203, 0.1764706, 1, 0, 1,
-0.5210432, -0.2107086, -1.596904, 0.1686275, 1, 0, 1,
-0.5128614, -0.6334998, -2.227876, 0.1647059, 1, 0, 1,
-0.5083293, 0.8074982, -0.6306139, 0.1568628, 1, 0, 1,
-0.5045971, 1.625298, -0.8905126, 0.1529412, 1, 0, 1,
-0.5044062, -0.574442, -2.19419, 0.145098, 1, 0, 1,
-0.5042618, -0.4155657, -5.028092, 0.1411765, 1, 0, 1,
-0.4999781, 1.39159, 1.495791, 0.1333333, 1, 0, 1,
-0.4967862, 1.28392, -2.159516, 0.1294118, 1, 0, 1,
-0.492946, -0.3870455, -1.039479, 0.1215686, 1, 0, 1,
-0.4903119, -0.5642106, -1.602843, 0.1176471, 1, 0, 1,
-0.4896397, 0.5553901, -1.076882, 0.1098039, 1, 0, 1,
-0.4890147, -0.8129369, -3.175862, 0.1058824, 1, 0, 1,
-0.4869528, 1.008891, 1.05108, 0.09803922, 1, 0, 1,
-0.4854257, -0.7231385, -2.428321, 0.09019608, 1, 0, 1,
-0.4842714, 1.772497, 0.5834171, 0.08627451, 1, 0, 1,
-0.4819824, 0.1281829, -1.075491, 0.07843138, 1, 0, 1,
-0.4795563, 0.8959054, 0.3882456, 0.07450981, 1, 0, 1,
-0.4787029, -0.1658198, -2.091948, 0.06666667, 1, 0, 1,
-0.4732217, -1.418597, -3.666411, 0.0627451, 1, 0, 1,
-0.4653871, 0.670513, -2.057315, 0.05490196, 1, 0, 1,
-0.4590296, 1.976441, -2.45286, 0.05098039, 1, 0, 1,
-0.458944, 1.08135, -0.7123266, 0.04313726, 1, 0, 1,
-0.4589139, -0.5554717, -2.820925, 0.03921569, 1, 0, 1,
-0.4578115, -2.281891, -3.283464, 0.03137255, 1, 0, 1,
-0.4567495, 0.7717456, -0.4813327, 0.02745098, 1, 0, 1,
-0.4554204, -0.6967295, -2.629561, 0.01960784, 1, 0, 1,
-0.4533766, 0.2155477, -2.424097, 0.01568628, 1, 0, 1,
-0.4523003, 0.9261202, -0.4195281, 0.007843138, 1, 0, 1,
-0.4518819, -1.21721, -3.224495, 0.003921569, 1, 0, 1,
-0.4437778, 2.081589, 0.5661289, 0, 1, 0.003921569, 1,
-0.4423354, 0.5571038, 1.593933, 0, 1, 0.01176471, 1,
-0.441723, 0.8681547, 0.006574632, 0, 1, 0.01568628, 1,
-0.4414391, 1.056801, -1.700636, 0, 1, 0.02352941, 1,
-0.4354472, 0.3750345, 1.427321, 0, 1, 0.02745098, 1,
-0.434667, -0.1750968, -2.383247, 0, 1, 0.03529412, 1,
-0.4263737, 0.00858481, -0.8889357, 0, 1, 0.03921569, 1,
-0.4235049, 1.159357, 1.186661, 0, 1, 0.04705882, 1,
-0.4208167, 0.5928884, -2.0924, 0, 1, 0.05098039, 1,
-0.4190784, -1.637517, -1.714975, 0, 1, 0.05882353, 1,
-0.4139902, -1.531838, -2.274129, 0, 1, 0.0627451, 1,
-0.4102352, -0.1842057, -2.308604, 0, 1, 0.07058824, 1,
-0.4090995, 1.110273, 0.7236516, 0, 1, 0.07450981, 1,
-0.407657, -0.9958889, -1.478123, 0, 1, 0.08235294, 1,
-0.404629, -0.5518563, -2.36546, 0, 1, 0.08627451, 1,
-0.4041789, -0.280617, -2.33513, 0, 1, 0.09411765, 1,
-0.4037044, -0.8965288, -3.042939, 0, 1, 0.1019608, 1,
-0.4024535, -0.236353, -1.740755, 0, 1, 0.1058824, 1,
-0.3985809, 0.6590395, 0.0131484, 0, 1, 0.1137255, 1,
-0.3981857, 1.216798, -0.2931631, 0, 1, 0.1176471, 1,
-0.3927025, 0.7393876, 0.3915394, 0, 1, 0.1254902, 1,
-0.3887239, 1.123396, 0.927449, 0, 1, 0.1294118, 1,
-0.3847903, 0.3015136, 1.120481, 0, 1, 0.1372549, 1,
-0.3831886, 1.479431, 1.187948, 0, 1, 0.1411765, 1,
-0.3827758, -2.360512, -2.723118, 0, 1, 0.1490196, 1,
-0.3770556, 2.435588, 0.03459891, 0, 1, 0.1529412, 1,
-0.3735806, -0.4818088, -1.132712, 0, 1, 0.1607843, 1,
-0.3734601, -1.271554, -2.380492, 0, 1, 0.1647059, 1,
-0.3729691, -0.6804651, -2.157139, 0, 1, 0.172549, 1,
-0.3697198, -1.131869, -3.584744, 0, 1, 0.1764706, 1,
-0.3685001, -0.9635465, -5.577925, 0, 1, 0.1843137, 1,
-0.3660088, 0.6192771, 0.6535982, 0, 1, 0.1882353, 1,
-0.3657924, 0.2433448, -1.099034, 0, 1, 0.1960784, 1,
-0.3619883, -0.4851614, -1.021812, 0, 1, 0.2039216, 1,
-0.3593785, -0.300699, -3.133823, 0, 1, 0.2078431, 1,
-0.3562266, -0.716318, -0.6130451, 0, 1, 0.2156863, 1,
-0.3540498, 0.3585951, 0.3945835, 0, 1, 0.2196078, 1,
-0.3504929, 0.1357307, -1.175621, 0, 1, 0.227451, 1,
-0.3436422, 1.32989, -0.3875232, 0, 1, 0.2313726, 1,
-0.3432757, 0.4947816, -1.88591, 0, 1, 0.2392157, 1,
-0.3424151, 0.3970092, 0.04149561, 0, 1, 0.2431373, 1,
-0.3420529, 0.117457, -2.318218, 0, 1, 0.2509804, 1,
-0.3392622, -0.009087586, -2.371348, 0, 1, 0.254902, 1,
-0.3389955, -0.1767775, -1.937197, 0, 1, 0.2627451, 1,
-0.3372505, -1.66535, -3.965648, 0, 1, 0.2666667, 1,
-0.3368947, 0.3964931, 0.1147635, 0, 1, 0.2745098, 1,
-0.3358504, 0.2522373, -0.7061568, 0, 1, 0.2784314, 1,
-0.3358076, -0.7900232, -4.150789, 0, 1, 0.2862745, 1,
-0.3349617, -0.5852459, -3.265264, 0, 1, 0.2901961, 1,
-0.3291804, -1.483765, -1.933425, 0, 1, 0.2980392, 1,
-0.3289613, 0.3530905, -0.7090273, 0, 1, 0.3058824, 1,
-0.3278921, 0.08466541, -0.7661065, 0, 1, 0.3098039, 1,
-0.3200763, 0.4541804, -1.366451, 0, 1, 0.3176471, 1,
-0.31807, 0.7578447, 0.3386965, 0, 1, 0.3215686, 1,
-0.3142809, -0.5565983, -2.844526, 0, 1, 0.3294118, 1,
-0.3124263, -0.9822447, -3.289611, 0, 1, 0.3333333, 1,
-0.3076292, -0.2968669, -3.52634, 0, 1, 0.3411765, 1,
-0.3071366, 0.590613, 0.05510432, 0, 1, 0.345098, 1,
-0.2989946, -0.1581563, -2.926886, 0, 1, 0.3529412, 1,
-0.2984107, -0.3100201, -2.314472, 0, 1, 0.3568628, 1,
-0.2982639, 0.3423142, -1.655152, 0, 1, 0.3647059, 1,
-0.2973073, -0.2109974, -3.107263, 0, 1, 0.3686275, 1,
-0.2967362, -0.8571548, -2.402737, 0, 1, 0.3764706, 1,
-0.2958347, -1.423568, -4.632917, 0, 1, 0.3803922, 1,
-0.2957538, 0.2527564, -0.6707337, 0, 1, 0.3882353, 1,
-0.295645, -3.170065, -4.224308, 0, 1, 0.3921569, 1,
-0.2946277, 0.9965928, 0.9370053, 0, 1, 0.4, 1,
-0.2946148, 0.5256538, -1.16573, 0, 1, 0.4078431, 1,
-0.2924829, 0.04003728, -1.643377, 0, 1, 0.4117647, 1,
-0.292082, -0.1819772, -2.134219, 0, 1, 0.4196078, 1,
-0.2865919, 1.569512, -1.968543, 0, 1, 0.4235294, 1,
-0.2834563, -0.7869625, -4.051541, 0, 1, 0.4313726, 1,
-0.2833574, 0.03003932, -0.7171746, 0, 1, 0.4352941, 1,
-0.2825314, 0.5392882, -0.4206338, 0, 1, 0.4431373, 1,
-0.2792953, -0.1929386, -0.8985104, 0, 1, 0.4470588, 1,
-0.2783922, 1.06555, 0.1394521, 0, 1, 0.454902, 1,
-0.2772141, 0.3855979, 0.1477632, 0, 1, 0.4588235, 1,
-0.2754696, 1.345108, -3.981179, 0, 1, 0.4666667, 1,
-0.2744903, -0.0825874, -0.0153615, 0, 1, 0.4705882, 1,
-0.2742871, -1.783907, -2.188856, 0, 1, 0.4784314, 1,
-0.2706833, -0.5482364, -3.724974, 0, 1, 0.4823529, 1,
-0.2701721, -0.474653, -3.523079, 0, 1, 0.4901961, 1,
-0.2691552, 1.337364, -0.4830486, 0, 1, 0.4941176, 1,
-0.2684916, -0.5360211, -4.206381, 0, 1, 0.5019608, 1,
-0.2674678, -0.1373283, -2.487758, 0, 1, 0.509804, 1,
-0.2642278, -0.5390198, -1.100427, 0, 1, 0.5137255, 1,
-0.2629898, 0.003420211, -2.435078, 0, 1, 0.5215687, 1,
-0.2559521, 2.327968, -0.4612468, 0, 1, 0.5254902, 1,
-0.250635, -1.041459, -2.350704, 0, 1, 0.5333334, 1,
-0.2506077, 0.2365489, -2.785265, 0, 1, 0.5372549, 1,
-0.2471913, -0.3673333, -3.017526, 0, 1, 0.5450981, 1,
-0.2423126, 0.522674, 0.3810444, 0, 1, 0.5490196, 1,
-0.2400725, 2.865573, 1.084505, 0, 1, 0.5568628, 1,
-0.2395055, -0.2231207, -2.6457, 0, 1, 0.5607843, 1,
-0.2389034, -0.3543076, -3.347898, 0, 1, 0.5686275, 1,
-0.2379784, 0.9741655, 1.205491, 0, 1, 0.572549, 1,
-0.2367623, 0.08847087, -2.890396, 0, 1, 0.5803922, 1,
-0.2366757, 1.803651, -0.4349676, 0, 1, 0.5843138, 1,
-0.2315424, -2.013417, -2.749137, 0, 1, 0.5921569, 1,
-0.2213928, 1.303056, -0.8779686, 0, 1, 0.5960785, 1,
-0.2182523, 0.3667025, -1.389017, 0, 1, 0.6039216, 1,
-0.2139442, -1.105958, -4.267901, 0, 1, 0.6117647, 1,
-0.2114469, -0.5714443, -2.578721, 0, 1, 0.6156863, 1,
-0.2098092, 0.3781244, -2.296015, 0, 1, 0.6235294, 1,
-0.2083467, -1.345317, -3.615694, 0, 1, 0.627451, 1,
-0.2077503, -0.3202375, -4.327466, 0, 1, 0.6352941, 1,
-0.2035241, -0.4181108, -3.031095, 0, 1, 0.6392157, 1,
-0.2020551, -0.4686402, -1.187806, 0, 1, 0.6470588, 1,
-0.2008958, 0.1711656, -2.473978, 0, 1, 0.6509804, 1,
-0.1952898, 0.3281992, 1.10411, 0, 1, 0.6588235, 1,
-0.1952488, 0.5545051, -2.026829, 0, 1, 0.6627451, 1,
-0.1914237, -0.9566399, -2.174689, 0, 1, 0.6705883, 1,
-0.1910767, -0.152711, -4.429096, 0, 1, 0.6745098, 1,
-0.1878172, 1.343, -0.9643219, 0, 1, 0.682353, 1,
-0.1845687, -0.3072602, -0.07015042, 0, 1, 0.6862745, 1,
-0.1837578, 0.7857556, -1.466355, 0, 1, 0.6941177, 1,
-0.1828188, -1.529917, -3.265376, 0, 1, 0.7019608, 1,
-0.1823064, -1.87732, -3.230065, 0, 1, 0.7058824, 1,
-0.1754117, -0.6357886, -4.682969, 0, 1, 0.7137255, 1,
-0.1712286, 0.2709338, -1.359955, 0, 1, 0.7176471, 1,
-0.1678257, 0.7313154, -0.3457233, 0, 1, 0.7254902, 1,
-0.1646184, -0.4358458, -2.508029, 0, 1, 0.7294118, 1,
-0.1627869, -0.8206639, -3.139925, 0, 1, 0.7372549, 1,
-0.1623082, 1.373206, 0.009443362, 0, 1, 0.7411765, 1,
-0.1620581, 1.206913, -2.021836, 0, 1, 0.7490196, 1,
-0.1574547, 1.049687, -1.019273, 0, 1, 0.7529412, 1,
-0.1569414, 2.218079, -0.8622095, 0, 1, 0.7607843, 1,
-0.1558279, -1.469069, -2.868563, 0, 1, 0.7647059, 1,
-0.1423029, 0.6458699, -1.457039, 0, 1, 0.772549, 1,
-0.1359072, -0.4538879, -4.428467, 0, 1, 0.7764706, 1,
-0.1335585, 1.232246, -0.5244695, 0, 1, 0.7843137, 1,
-0.1329335, -2.256107, -4.374597, 0, 1, 0.7882353, 1,
-0.1316339, -1.846314, -2.950017, 0, 1, 0.7960784, 1,
-0.130671, -0.3357274, -1.85176, 0, 1, 0.8039216, 1,
-0.130587, 0.5524213, -1.146612, 0, 1, 0.8078431, 1,
-0.1291557, -0.2659353, -3.870816, 0, 1, 0.8156863, 1,
-0.124484, 0.5369796, 0.08944162, 0, 1, 0.8196079, 1,
-0.1244787, 0.4847878, 0.04579654, 0, 1, 0.827451, 1,
-0.1222778, -0.3205041, -1.704955, 0, 1, 0.8313726, 1,
-0.1209234, 0.6411763, 0.4544252, 0, 1, 0.8392157, 1,
-0.1201694, 0.4872222, -1.186174, 0, 1, 0.8431373, 1,
-0.1165853, -1.414526, -3.327966, 0, 1, 0.8509804, 1,
-0.1158516, 1.015115, 0.1788953, 0, 1, 0.854902, 1,
-0.1156157, -0.11581, -2.593181, 0, 1, 0.8627451, 1,
-0.1099243, -0.3296701, -1.383249, 0, 1, 0.8666667, 1,
-0.1093725, 0.3818041, -0.4238164, 0, 1, 0.8745098, 1,
-0.1083986, 0.3082181, 1.04073, 0, 1, 0.8784314, 1,
-0.1048803, 0.2589615, -2.487163, 0, 1, 0.8862745, 1,
-0.09842964, -0.2169171, -3.148049, 0, 1, 0.8901961, 1,
-0.09746572, -0.7491667, -3.318114, 0, 1, 0.8980392, 1,
-0.09570722, 0.5220729, 0.7700727, 0, 1, 0.9058824, 1,
-0.09404248, -0.4359154, -3.440899, 0, 1, 0.9098039, 1,
-0.09097158, 1.872528, 0.3483336, 0, 1, 0.9176471, 1,
-0.08965521, 1.221021, 0.5264925, 0, 1, 0.9215686, 1,
-0.08875611, -0.811456, -2.02311, 0, 1, 0.9294118, 1,
-0.084852, -0.8194848, -3.173161, 0, 1, 0.9333333, 1,
-0.08084045, 0.7259645, -0.7072808, 0, 1, 0.9411765, 1,
-0.0793087, 0.9639732, -1.066463, 0, 1, 0.945098, 1,
-0.07728709, 2.110868, -1.170605, 0, 1, 0.9529412, 1,
-0.07386847, 0.2793919, -1.627871, 0, 1, 0.9568627, 1,
-0.07198946, -0.9879357, -3.611998, 0, 1, 0.9647059, 1,
-0.06660117, 0.3510287, -1.353907, 0, 1, 0.9686275, 1,
-0.06426992, 1.43049, -0.7724957, 0, 1, 0.9764706, 1,
-0.05429015, 2.397082, 0.09815753, 0, 1, 0.9803922, 1,
-0.05414622, -1.056317, -4.793548, 0, 1, 0.9882353, 1,
-0.0471086, -0.4647554, -2.562557, 0, 1, 0.9921569, 1,
-0.04657311, 0.5090265, -0.4982192, 0, 1, 1, 1,
-0.04535376, -0.3497405, -4.184302, 0, 0.9921569, 1, 1,
-0.04350076, 0.5872743, 1.380322, 0, 0.9882353, 1, 1,
-0.04255105, -1.329426, -1.627572, 0, 0.9803922, 1, 1,
-0.04194045, 0.5111267, 1.341693, 0, 0.9764706, 1, 1,
-0.04132554, 0.4130347, 1.074289, 0, 0.9686275, 1, 1,
-0.03969494, -0.1425467, -3.123267, 0, 0.9647059, 1, 1,
-0.03905285, -0.161157, -2.769406, 0, 0.9568627, 1, 1,
-0.03856575, 0.2119507, 0.4798821, 0, 0.9529412, 1, 1,
-0.03755387, 0.1183823, 0.4475138, 0, 0.945098, 1, 1,
-0.03675812, -0.3028796, -2.568358, 0, 0.9411765, 1, 1,
-0.03462322, -0.04688214, -1.020009, 0, 0.9333333, 1, 1,
-0.03375814, 0.2689755, 1.235482, 0, 0.9294118, 1, 1,
-0.03292803, 0.4392992, -0.2229267, 0, 0.9215686, 1, 1,
-0.0313694, 0.5579517, 0.740607, 0, 0.9176471, 1, 1,
-0.02398815, -0.8192566, -4.00737, 0, 0.9098039, 1, 1,
-0.02365148, -0.5949795, -2.652827, 0, 0.9058824, 1, 1,
-0.01792062, 0.3297869, -0.3082664, 0, 0.8980392, 1, 1,
-0.01753164, 0.1385836, -0.2105405, 0, 0.8901961, 1, 1,
-0.01576018, 0.3915732, -1.030116, 0, 0.8862745, 1, 1,
-0.01406511, 0.2150801, 1.119613, 0, 0.8784314, 1, 1,
-0.004594633, 0.9091731, -0.6558644, 0, 0.8745098, 1, 1,
0.000130595, 0.5157486, -0.1500237, 0, 0.8666667, 1, 1,
0.001150088, -2.088867, 2.399099, 0, 0.8627451, 1, 1,
0.00366383, 0.1389982, 0.6698651, 0, 0.854902, 1, 1,
0.01011466, -0.1457272, 1.882875, 0, 0.8509804, 1, 1,
0.01046113, -0.02212524, 3.026953, 0, 0.8431373, 1, 1,
0.01280497, 0.4514021, 0.2562865, 0, 0.8392157, 1, 1,
0.0174251, -0.762221, 4.193851, 0, 0.8313726, 1, 1,
0.01821807, -0.2871886, 4.422593, 0, 0.827451, 1, 1,
0.02266372, -1.069958, 0.8849744, 0, 0.8196079, 1, 1,
0.02342659, 1.795653, 0.9767665, 0, 0.8156863, 1, 1,
0.02528076, -0.2446439, 4.482458, 0, 0.8078431, 1, 1,
0.02601106, -0.7116277, 5.6256, 0, 0.8039216, 1, 1,
0.02889191, -0.3500947, 1.402199, 0, 0.7960784, 1, 1,
0.02894302, -0.1302794, 3.484668, 0, 0.7882353, 1, 1,
0.03260869, -0.1296965, 2.546227, 0, 0.7843137, 1, 1,
0.03956631, 0.7792037, -0.5345672, 0, 0.7764706, 1, 1,
0.03971718, -1.538437, 2.445065, 0, 0.772549, 1, 1,
0.04099685, 0.01888629, 2.588211, 0, 0.7647059, 1, 1,
0.04339631, 0.9148082, -0.9840227, 0, 0.7607843, 1, 1,
0.04413606, 2.728405, -1.304698, 0, 0.7529412, 1, 1,
0.04729352, -0.6039297, 2.813855, 0, 0.7490196, 1, 1,
0.04905339, 0.2622351, -0.1812064, 0, 0.7411765, 1, 1,
0.05129619, -2.047234, 2.773394, 0, 0.7372549, 1, 1,
0.05393238, -0.6372684, 2.277535, 0, 0.7294118, 1, 1,
0.05859922, -0.2965237, 5.23238, 0, 0.7254902, 1, 1,
0.06199754, -0.1541451, 3.099334, 0, 0.7176471, 1, 1,
0.06539529, -0.5455362, 3.826086, 0, 0.7137255, 1, 1,
0.06584641, -0.5448115, 2.919672, 0, 0.7058824, 1, 1,
0.06662162, -0.01756706, 0.6456383, 0, 0.6980392, 1, 1,
0.06677447, 1.499827, 0.2349725, 0, 0.6941177, 1, 1,
0.0674763, -1.12099, 3.681777, 0, 0.6862745, 1, 1,
0.06828601, -0.3826281, 3.162083, 0, 0.682353, 1, 1,
0.07000525, 1.06912, -0.9340586, 0, 0.6745098, 1, 1,
0.07207993, -0.3469605, 2.000005, 0, 0.6705883, 1, 1,
0.07599568, 1.050234, -2.964698, 0, 0.6627451, 1, 1,
0.07745191, 0.7768884, -0.003747399, 0, 0.6588235, 1, 1,
0.08133291, 0.5621111, 0.6519485, 0, 0.6509804, 1, 1,
0.08193653, 0.8039901, -0.6135935, 0, 0.6470588, 1, 1,
0.08201955, 0.3096569, 1.217405, 0, 0.6392157, 1, 1,
0.08468865, -0.6805607, 2.159178, 0, 0.6352941, 1, 1,
0.08624563, -0.6970601, 5.078138, 0, 0.627451, 1, 1,
0.08867235, -0.1669715, 2.383422, 0, 0.6235294, 1, 1,
0.09132747, 1.140369, 1.691243, 0, 0.6156863, 1, 1,
0.09188288, -0.5878462, 4.321697, 0, 0.6117647, 1, 1,
0.09928758, -1.084648, 2.899509, 0, 0.6039216, 1, 1,
0.09966648, 0.4942861, 0.3991108, 0, 0.5960785, 1, 1,
0.1038645, 0.927334, -1.451356, 0, 0.5921569, 1, 1,
0.1061152, -1.162017, 3.298145, 0, 0.5843138, 1, 1,
0.1069549, -0.1807835, 4.036573, 0, 0.5803922, 1, 1,
0.113537, -0.1353108, 3.400125, 0, 0.572549, 1, 1,
0.115231, -0.7496537, 2.118999, 0, 0.5686275, 1, 1,
0.1159792, -0.789939, 3.084785, 0, 0.5607843, 1, 1,
0.1179338, 0.8025648, 0.5887104, 0, 0.5568628, 1, 1,
0.1215262, 0.1749993, 1.658023, 0, 0.5490196, 1, 1,
0.1238606, 0.1789968, 0.8057907, 0, 0.5450981, 1, 1,
0.1245589, 0.5426931, 1.811829, 0, 0.5372549, 1, 1,
0.1247718, -0.4242138, 1.890598, 0, 0.5333334, 1, 1,
0.1256582, 0.4052641, 1.154313, 0, 0.5254902, 1, 1,
0.1283042, -1.036913, 4.641259, 0, 0.5215687, 1, 1,
0.1284965, -0.7095248, 3.221153, 0, 0.5137255, 1, 1,
0.1313213, 0.06624091, 1.886589, 0, 0.509804, 1, 1,
0.1326455, -1.272268, 4.008747, 0, 0.5019608, 1, 1,
0.1352646, 0.3713214, 0.580282, 0, 0.4941176, 1, 1,
0.136253, -0.1983973, 2.938748, 0, 0.4901961, 1, 1,
0.1407714, -0.08112946, 0.5236291, 0, 0.4823529, 1, 1,
0.1410786, 0.7947466, 0.2337565, 0, 0.4784314, 1, 1,
0.142699, -0.6215309, 1.065101, 0, 0.4705882, 1, 1,
0.1429334, -0.1078485, 1.207833, 0, 0.4666667, 1, 1,
0.1444299, -1.124475, 3.069521, 0, 0.4588235, 1, 1,
0.1450666, -0.4415621, 3.668909, 0, 0.454902, 1, 1,
0.1466814, -0.04732449, 1.786018, 0, 0.4470588, 1, 1,
0.1492874, -0.4162259, 2.425367, 0, 0.4431373, 1, 1,
0.1514176, -0.6592203, 3.18715, 0, 0.4352941, 1, 1,
0.1518415, 0.8183258, -0.2106405, 0, 0.4313726, 1, 1,
0.1525079, -0.5884586, 4.303078, 0, 0.4235294, 1, 1,
0.1550534, -0.9994164, 3.271703, 0, 0.4196078, 1, 1,
0.167191, 0.1183998, -0.4591956, 0, 0.4117647, 1, 1,
0.174194, 0.2238395, 1.700202, 0, 0.4078431, 1, 1,
0.1837882, -0.6326391, 2.656428, 0, 0.4, 1, 1,
0.1902123, -0.698263, 2.384908, 0, 0.3921569, 1, 1,
0.190263, -1.491535, 3.382235, 0, 0.3882353, 1, 1,
0.1927329, -0.4315922, 3.950981, 0, 0.3803922, 1, 1,
0.193627, -0.4311064, 0.9458238, 0, 0.3764706, 1, 1,
0.1944703, -1.101639, 4.00757, 0, 0.3686275, 1, 1,
0.1965859, -1.479281, 3.090439, 0, 0.3647059, 1, 1,
0.1973213, 0.9996487, 0.5784134, 0, 0.3568628, 1, 1,
0.2016512, -0.02043431, 0.9671282, 0, 0.3529412, 1, 1,
0.2020546, 0.1012198, 1.234382, 0, 0.345098, 1, 1,
0.2032412, 0.6821884, -1.009843, 0, 0.3411765, 1, 1,
0.212055, -0.9700324, 1.211519, 0, 0.3333333, 1, 1,
0.2213324, 0.8483887, -0.1756361, 0, 0.3294118, 1, 1,
0.2238142, 1.787458, -0.2342105, 0, 0.3215686, 1, 1,
0.225191, -1.374216, 4.314499, 0, 0.3176471, 1, 1,
0.2261638, -0.2763765, 1.867342, 0, 0.3098039, 1, 1,
0.2286899, 0.1929635, 1.591178, 0, 0.3058824, 1, 1,
0.2300943, 0.6002932, 1.594753, 0, 0.2980392, 1, 1,
0.2313381, 0.8266329, 0.239206, 0, 0.2901961, 1, 1,
0.2338841, 0.4322591, 0.8399081, 0, 0.2862745, 1, 1,
0.2365963, -0.6025611, 0.303985, 0, 0.2784314, 1, 1,
0.2394618, 1.094661, 1.32769, 0, 0.2745098, 1, 1,
0.240123, -0.16515, 2.898244, 0, 0.2666667, 1, 1,
0.2443382, -2.155466, 0.624024, 0, 0.2627451, 1, 1,
0.2570114, -0.9306347, 3.721795, 0, 0.254902, 1, 1,
0.2610011, 0.2322373, 1.568479, 0, 0.2509804, 1, 1,
0.2627309, 0.6903032, -1.345707, 0, 0.2431373, 1, 1,
0.2653662, 0.02305313, 1.170896, 0, 0.2392157, 1, 1,
0.2657726, -0.3663989, 2.863846, 0, 0.2313726, 1, 1,
0.2679928, 0.5128971, 1.73545, 0, 0.227451, 1, 1,
0.2700748, 1.717861, -0.9107834, 0, 0.2196078, 1, 1,
0.2715824, 0.6516042, -0.3680939, 0, 0.2156863, 1, 1,
0.2759959, -0.7232872, 2.847259, 0, 0.2078431, 1, 1,
0.2761134, -0.5027301, 2.707812, 0, 0.2039216, 1, 1,
0.2767605, -0.4229836, 1.705047, 0, 0.1960784, 1, 1,
0.2828114, 0.7853487, 0.04660946, 0, 0.1882353, 1, 1,
0.2842954, 1.196321, 0.7247741, 0, 0.1843137, 1, 1,
0.286311, 0.2928757, 0.3984955, 0, 0.1764706, 1, 1,
0.2917709, 0.4118527, 0.03946504, 0, 0.172549, 1, 1,
0.2935296, 0.4129132, 0.5795094, 0, 0.1647059, 1, 1,
0.3024918, -0.151656, 2.283994, 0, 0.1607843, 1, 1,
0.3036587, -0.3219284, 0.7634366, 0, 0.1529412, 1, 1,
0.306272, 0.2457271, 1.786626, 0, 0.1490196, 1, 1,
0.306797, 0.4601914, -0.1744332, 0, 0.1411765, 1, 1,
0.3083205, -0.4766656, 4.257718, 0, 0.1372549, 1, 1,
0.315144, 1.157634, -0.07721502, 0, 0.1294118, 1, 1,
0.3155742, -0.5149319, 0.5084776, 0, 0.1254902, 1, 1,
0.3181978, 1.326882, 0.9142036, 0, 0.1176471, 1, 1,
0.319209, 0.9043341, 0.6202273, 0, 0.1137255, 1, 1,
0.3213341, 2.069463, 0.9001417, 0, 0.1058824, 1, 1,
0.3239559, 0.2698245, 1.799061, 0, 0.09803922, 1, 1,
0.3248955, 1.161885, -0.293586, 0, 0.09411765, 1, 1,
0.3260833, -1.725723, 3.670074, 0, 0.08627451, 1, 1,
0.3270589, 1.062571, 0.7549013, 0, 0.08235294, 1, 1,
0.3367966, 1.171329, -1.442799, 0, 0.07450981, 1, 1,
0.3395687, 1.043009, 0.7687177, 0, 0.07058824, 1, 1,
0.3396688, -1.843836, 4.302919, 0, 0.0627451, 1, 1,
0.3430154, -1.749629, 2.524403, 0, 0.05882353, 1, 1,
0.3517607, -0.7659518, 2.614856, 0, 0.05098039, 1, 1,
0.3530181, -0.3452822, 3.887282, 0, 0.04705882, 1, 1,
0.3599202, 1.415925, 0.04532921, 0, 0.03921569, 1, 1,
0.3629718, -0.1622313, 1.377076, 0, 0.03529412, 1, 1,
0.3652948, 0.6325049, -0.5925729, 0, 0.02745098, 1, 1,
0.3660803, -0.3692695, 2.491369, 0, 0.02352941, 1, 1,
0.3715957, 0.107282, 3.29295, 0, 0.01568628, 1, 1,
0.3724426, -1.155913, 3.004782, 0, 0.01176471, 1, 1,
0.3740427, -0.5429196, 2.993341, 0, 0.003921569, 1, 1,
0.3770557, 2.093061, 0.04569433, 0.003921569, 0, 1, 1,
0.3783911, -0.3668215, -0.1550131, 0.007843138, 0, 1, 1,
0.3784882, -2.176799, 3.137953, 0.01568628, 0, 1, 1,
0.3799193, -0.4768708, 2.053125, 0.01960784, 0, 1, 1,
0.3809429, -0.244343, 0.3936217, 0.02745098, 0, 1, 1,
0.3878593, 0.6476012, -1.725789, 0.03137255, 0, 1, 1,
0.3906071, 1.650773, 1.875439, 0.03921569, 0, 1, 1,
0.3928427, -0.06495647, 2.094935, 0.04313726, 0, 1, 1,
0.4028204, -0.4455622, 1.07197, 0.05098039, 0, 1, 1,
0.4119408, -0.6264799, 3.565954, 0.05490196, 0, 1, 1,
0.4124203, -1.048426, 2.507801, 0.0627451, 0, 1, 1,
0.4139086, -1.330594, 2.918028, 0.06666667, 0, 1, 1,
0.4168891, -0.1889652, 2.941038, 0.07450981, 0, 1, 1,
0.4179713, -0.3629252, 1.006648, 0.07843138, 0, 1, 1,
0.4213238, -0.8641679, 1.303881, 0.08627451, 0, 1, 1,
0.4215558, -1.159851, 3.693859, 0.09019608, 0, 1, 1,
0.4268309, 0.4828606, 0.2924799, 0.09803922, 0, 1, 1,
0.4285021, 1.144618, 0.7238068, 0.1058824, 0, 1, 1,
0.4358136, -1.313798, 2.155354, 0.1098039, 0, 1, 1,
0.4378955, 1.307293, 1.235927, 0.1176471, 0, 1, 1,
0.4379515, 1.777154, -0.7960925, 0.1215686, 0, 1, 1,
0.4392716, 0.309957, 1.064709, 0.1294118, 0, 1, 1,
0.4429836, 0.08267298, 3.638589, 0.1333333, 0, 1, 1,
0.4448777, 0.2192903, 1.489522, 0.1411765, 0, 1, 1,
0.4458745, 0.6928303, -0.1761905, 0.145098, 0, 1, 1,
0.4462504, 0.2232969, 2.009636, 0.1529412, 0, 1, 1,
0.447752, 0.9841671, 0.2458097, 0.1568628, 0, 1, 1,
0.4505095, -0.5435295, 2.573517, 0.1647059, 0, 1, 1,
0.4580168, 0.6947695, 0.1689779, 0.1686275, 0, 1, 1,
0.4601528, 0.9620368, 0.3810767, 0.1764706, 0, 1, 1,
0.461447, -1.526129, 2.800245, 0.1803922, 0, 1, 1,
0.4640932, 1.277776, 1.072961, 0.1882353, 0, 1, 1,
0.4673246, 1.124179, 1.10971, 0.1921569, 0, 1, 1,
0.4678824, 0.6960118, 0.5955722, 0.2, 0, 1, 1,
0.4708903, 1.211039, -0.1840455, 0.2078431, 0, 1, 1,
0.4720265, -0.3239783, 2.257462, 0.2117647, 0, 1, 1,
0.472855, -0.5397972, 3.581778, 0.2196078, 0, 1, 1,
0.476107, 0.6516564, 0.05801876, 0.2235294, 0, 1, 1,
0.4791779, -0.5864497, 3.394592, 0.2313726, 0, 1, 1,
0.4796758, -1.7977, 3.512041, 0.2352941, 0, 1, 1,
0.4906479, 0.03143613, 1.500847, 0.2431373, 0, 1, 1,
0.4914023, 0.3928039, 2.150965, 0.2470588, 0, 1, 1,
0.4917149, 1.164773, -1.974956, 0.254902, 0, 1, 1,
0.4928779, 0.2393595, 0.7412412, 0.2588235, 0, 1, 1,
0.4953174, 0.07242712, 1.227939, 0.2666667, 0, 1, 1,
0.5013385, 0.1467369, 1.877707, 0.2705882, 0, 1, 1,
0.5016177, 0.136867, 2.278838, 0.2784314, 0, 1, 1,
0.5033475, 1.638873, -1.623805, 0.282353, 0, 1, 1,
0.5073327, -0.5132738, 3.261945, 0.2901961, 0, 1, 1,
0.5074776, 0.01735873, 1.305148, 0.2941177, 0, 1, 1,
0.5107016, -0.1270049, 1.906391, 0.3019608, 0, 1, 1,
0.5124471, -0.3512245, 1.960295, 0.3098039, 0, 1, 1,
0.513644, -2.188616, 4.765323, 0.3137255, 0, 1, 1,
0.520405, -1.053998, 3.285244, 0.3215686, 0, 1, 1,
0.522733, 0.3174848, 1.043158, 0.3254902, 0, 1, 1,
0.5230972, -0.9592143, 1.326642, 0.3333333, 0, 1, 1,
0.5241734, -0.8261645, 2.273763, 0.3372549, 0, 1, 1,
0.526323, -0.7779896, 2.827565, 0.345098, 0, 1, 1,
0.5295604, -0.5397672, 3.38202, 0.3490196, 0, 1, 1,
0.5333471, -0.01999128, 0.7788941, 0.3568628, 0, 1, 1,
0.5376883, 0.4961236, -1.297924, 0.3607843, 0, 1, 1,
0.5403711, 0.759217, 0.6722104, 0.3686275, 0, 1, 1,
0.5407308, 0.3141575, 1.073021, 0.372549, 0, 1, 1,
0.5437214, 0.3896369, 0.9982151, 0.3803922, 0, 1, 1,
0.5450607, 0.9493553, 2.419774, 0.3843137, 0, 1, 1,
0.545149, -0.9355102, 1.262164, 0.3921569, 0, 1, 1,
0.5466562, -0.5820591, 1.543519, 0.3960784, 0, 1, 1,
0.5487286, 0.2399969, 3.492261, 0.4039216, 0, 1, 1,
0.5527337, -0.1531701, 0.8723608, 0.4117647, 0, 1, 1,
0.556304, 0.9922799, -0.2677671, 0.4156863, 0, 1, 1,
0.5566255, 0.6553977, 0.5318489, 0.4235294, 0, 1, 1,
0.5574155, 1.165479, -0.5313206, 0.427451, 0, 1, 1,
0.56177, -1.22652, 3.857509, 0.4352941, 0, 1, 1,
0.564189, -0.0009853834, 1.704791, 0.4392157, 0, 1, 1,
0.565528, -1.109907, 3.031151, 0.4470588, 0, 1, 1,
0.5688887, -0.1614386, 2.602857, 0.4509804, 0, 1, 1,
0.5704065, -0.004799747, 2.348912, 0.4588235, 0, 1, 1,
0.5704623, -1.707488, 3.866709, 0.4627451, 0, 1, 1,
0.5720975, 0.1285061, 2.006148, 0.4705882, 0, 1, 1,
0.5724994, 1.048335, 0.2687725, 0.4745098, 0, 1, 1,
0.5800298, -0.2547328, 2.426255, 0.4823529, 0, 1, 1,
0.5821074, 1.274197, -0.8899597, 0.4862745, 0, 1, 1,
0.5840588, -0.07405135, 2.312772, 0.4941176, 0, 1, 1,
0.5884629, 0.2887545, 2.056621, 0.5019608, 0, 1, 1,
0.5916708, 0.4357378, 1.482019, 0.5058824, 0, 1, 1,
0.6012215, 0.9681283, -0.7843758, 0.5137255, 0, 1, 1,
0.602999, 0.9600163, 2.186193, 0.5176471, 0, 1, 1,
0.6089762, -0.7870919, 1.817572, 0.5254902, 0, 1, 1,
0.6112541, -0.5315343, 1.239862, 0.5294118, 0, 1, 1,
0.6155604, -0.2119609, 3.770599, 0.5372549, 0, 1, 1,
0.6170034, 0.7754831, 2.093018, 0.5411765, 0, 1, 1,
0.6176731, 0.1903235, 1.611836, 0.5490196, 0, 1, 1,
0.6223883, 0.6259317, -0.3468431, 0.5529412, 0, 1, 1,
0.6243094, -0.895452, 2.575895, 0.5607843, 0, 1, 1,
0.6290603, -0.160263, -0.0597337, 0.5647059, 0, 1, 1,
0.6297498, -0.6914849, 4.588512, 0.572549, 0, 1, 1,
0.6303095, -1.514374, 1.706847, 0.5764706, 0, 1, 1,
0.633181, 0.2163511, 2.336411, 0.5843138, 0, 1, 1,
0.6416739, -0.1997662, -0.4901451, 0.5882353, 0, 1, 1,
0.6496412, 1.458963, -0.7099786, 0.5960785, 0, 1, 1,
0.6511585, -0.8498972, 3.169216, 0.6039216, 0, 1, 1,
0.6597056, 0.1068461, -0.2412792, 0.6078432, 0, 1, 1,
0.6597749, 0.1282882, 0.5132, 0.6156863, 0, 1, 1,
0.6612175, -0.2440945, -0.2234811, 0.6196079, 0, 1, 1,
0.6633415, 0.1433454, 0.7474882, 0.627451, 0, 1, 1,
0.6635627, -0.1685559, 2.579739, 0.6313726, 0, 1, 1,
0.6663221, 1.191235, 0.2009949, 0.6392157, 0, 1, 1,
0.6677412, 0.1892386, 1.776358, 0.6431373, 0, 1, 1,
0.6769352, 0.7708055, 0.7998295, 0.6509804, 0, 1, 1,
0.6769413, -1.739326, 0.998578, 0.654902, 0, 1, 1,
0.6818256, -1.903934, 2.079535, 0.6627451, 0, 1, 1,
0.6829571, -0.4162723, 3.036661, 0.6666667, 0, 1, 1,
0.6905208, -0.2207281, 1.901708, 0.6745098, 0, 1, 1,
0.6971447, 0.9805985, 1.370116, 0.6784314, 0, 1, 1,
0.7057238, -0.6828375, 3.879019, 0.6862745, 0, 1, 1,
0.7127332, 0.3261448, 2.266279, 0.6901961, 0, 1, 1,
0.7244638, 0.4242071, 0.8312284, 0.6980392, 0, 1, 1,
0.726724, -2.269381, 2.83758, 0.7058824, 0, 1, 1,
0.728351, -0.7117052, 2.540974, 0.7098039, 0, 1, 1,
0.7385756, -2.084369, 4.167418, 0.7176471, 0, 1, 1,
0.7398648, 2.113385, -0.9363657, 0.7215686, 0, 1, 1,
0.7459767, -1.377697, 4.114214, 0.7294118, 0, 1, 1,
0.747822, -0.002473832, 0.05448475, 0.7333333, 0, 1, 1,
0.7516397, 0.00670437, 2.074981, 0.7411765, 0, 1, 1,
0.7581204, -0.5845171, 1.318874, 0.7450981, 0, 1, 1,
0.7630025, 0.1890297, 2.287291, 0.7529412, 0, 1, 1,
0.764156, 1.737391, 2.008438, 0.7568628, 0, 1, 1,
0.7655495, 1.367296, 1.125586, 0.7647059, 0, 1, 1,
0.7664986, -0.0006611458, 1.002099, 0.7686275, 0, 1, 1,
0.7722473, -1.013182, 2.657178, 0.7764706, 0, 1, 1,
0.7753736, -0.5113018, 3.390305, 0.7803922, 0, 1, 1,
0.7799104, 1.819438, 0.8175459, 0.7882353, 0, 1, 1,
0.7830998, 0.8805223, 1.316028, 0.7921569, 0, 1, 1,
0.797612, -0.364639, 0.6342552, 0.8, 0, 1, 1,
0.7980617, 0.4690321, 1.355887, 0.8078431, 0, 1, 1,
0.8055611, -0.842915, 1.782321, 0.8117647, 0, 1, 1,
0.8070168, 0.4896895, 0.09914175, 0.8196079, 0, 1, 1,
0.8070855, -0.6568577, 5.41411, 0.8235294, 0, 1, 1,
0.8073198, 0.5169424, 0.1089402, 0.8313726, 0, 1, 1,
0.8073969, -0.3483075, 0.3909166, 0.8352941, 0, 1, 1,
0.811272, 0.6897594, 0.2889031, 0.8431373, 0, 1, 1,
0.813926, 1.513963, -0.4064713, 0.8470588, 0, 1, 1,
0.814655, 0.6974849, 0.9396974, 0.854902, 0, 1, 1,
0.8162612, -0.1079805, 2.031672, 0.8588235, 0, 1, 1,
0.819315, -3.154477, 2.273489, 0.8666667, 0, 1, 1,
0.8198826, 1.377412, 0.0914313, 0.8705882, 0, 1, 1,
0.8211602, 1.267566, 0.08682984, 0.8784314, 0, 1, 1,
0.8328201, -1.21252, 2.469512, 0.8823529, 0, 1, 1,
0.8376055, -0.7159386, 0.8751099, 0.8901961, 0, 1, 1,
0.8413324, 1.077155, 1.050102, 0.8941177, 0, 1, 1,
0.8441914, -1.254714, 2.943738, 0.9019608, 0, 1, 1,
0.8450128, -1.67127, 3.496511, 0.9098039, 0, 1, 1,
0.8457228, -0.9771871, 0.5315539, 0.9137255, 0, 1, 1,
0.8509483, 0.8650262, -0.3087548, 0.9215686, 0, 1, 1,
0.8511021, -0.5370762, 2.265628, 0.9254902, 0, 1, 1,
0.8531484, -1.387252, 2.294413, 0.9333333, 0, 1, 1,
0.8639916, -2.40261, 2.371745, 0.9372549, 0, 1, 1,
0.8701524, 0.6191837, 1.652404, 0.945098, 0, 1, 1,
0.8760545, 0.2819043, 0.36665, 0.9490196, 0, 1, 1,
0.879495, -0.7923081, 1.211179, 0.9568627, 0, 1, 1,
0.8815447, 0.09903865, 1.882753, 0.9607843, 0, 1, 1,
0.8858356, -1.500176, 1.816675, 0.9686275, 0, 1, 1,
0.8862361, -1.393544, 1.109977, 0.972549, 0, 1, 1,
0.8923346, -0.1292365, 0.6559127, 0.9803922, 0, 1, 1,
0.8982704, 0.8708259, -0.3180737, 0.9843137, 0, 1, 1,
0.9062544, 0.7199157, 0.3709665, 0.9921569, 0, 1, 1,
0.9100018, -0.803364, 1.915994, 0.9960784, 0, 1, 1,
0.9230286, 0.7112238, 1.606953, 1, 0, 0.9960784, 1,
0.9348423, 0.9643512, -0.6365773, 1, 0, 0.9882353, 1,
0.9352341, 0.7797999, 0.2113284, 1, 0, 0.9843137, 1,
0.9369083, -1.274169, 2.947589, 1, 0, 0.9764706, 1,
0.9393323, 0.7225368, 1.686889, 1, 0, 0.972549, 1,
0.9454125, 1.865148, 1.568241, 1, 0, 0.9647059, 1,
0.9487975, 0.7042111, 0.5091785, 1, 0, 0.9607843, 1,
0.9509727, -0.1347034, 1.892604, 1, 0, 0.9529412, 1,
0.9572729, -0.127644, 0.8832759, 1, 0, 0.9490196, 1,
0.9583763, 1.268241, 0.5274363, 1, 0, 0.9411765, 1,
0.9646075, -1.759766, 2.763757, 1, 0, 0.9372549, 1,
0.974904, -3.034501, 4.360481, 1, 0, 0.9294118, 1,
0.9758599, 0.369833, 3.092072, 1, 0, 0.9254902, 1,
0.9765948, 0.3631481, 2.388539, 1, 0, 0.9176471, 1,
0.9932105, 0.004084683, 0.2201536, 1, 0, 0.9137255, 1,
0.9932371, 0.1863062, 2.101364, 1, 0, 0.9058824, 1,
0.9941827, -2.132643, 2.706677, 1, 0, 0.9019608, 1,
0.9986119, -0.04641223, 2.447935, 1, 0, 0.8941177, 1,
1.002201, 0.3744132, 1.616658, 1, 0, 0.8862745, 1,
1.00881, -0.2504288, 3.073295, 1, 0, 0.8823529, 1,
1.014079, -1.177126, 1.447077, 1, 0, 0.8745098, 1,
1.017243, 2.124313, 1.377607, 1, 0, 0.8705882, 1,
1.026093, 0.8520521, 0.9080631, 1, 0, 0.8627451, 1,
1.028088, -1.569441, 3.477641, 1, 0, 0.8588235, 1,
1.029276, 0.2621132, 1.292211, 1, 0, 0.8509804, 1,
1.029436, 0.7461329, 0.3742433, 1, 0, 0.8470588, 1,
1.029894, -0.4361039, 2.65444, 1, 0, 0.8392157, 1,
1.036678, 0.8290096, 0.5555785, 1, 0, 0.8352941, 1,
1.049123, 3.300344, 2.115463, 1, 0, 0.827451, 1,
1.051027, -0.395388, 1.717498, 1, 0, 0.8235294, 1,
1.052358, -0.7266977, 2.462145, 1, 0, 0.8156863, 1,
1.058223, -1.4073, 1.636675, 1, 0, 0.8117647, 1,
1.059535, 0.2299975, 0.7815547, 1, 0, 0.8039216, 1,
1.066257, 0.7571798, -0.06783122, 1, 0, 0.7960784, 1,
1.067051, -0.04095989, 1.125025, 1, 0, 0.7921569, 1,
1.07023, -0.5256084, 1.012885, 1, 0, 0.7843137, 1,
1.072953, -1.019897, 1.309901, 1, 0, 0.7803922, 1,
1.074783, -0.2550635, 3.112135, 1, 0, 0.772549, 1,
1.084486, -0.1619285, 2.010732, 1, 0, 0.7686275, 1,
1.088181, 0.03795776, 1.422479, 1, 0, 0.7607843, 1,
1.104528, -0.4557838, 1.886051, 1, 0, 0.7568628, 1,
1.113367, -0.05016422, 1.09026, 1, 0, 0.7490196, 1,
1.113955, 0.5512153, -0.9372886, 1, 0, 0.7450981, 1,
1.117196, -0.6829244, 2.03051, 1, 0, 0.7372549, 1,
1.129266, -0.4973029, 1.845582, 1, 0, 0.7333333, 1,
1.131309, 0.2008694, 0.2393086, 1, 0, 0.7254902, 1,
1.131963, -1.217768, 2.426001, 1, 0, 0.7215686, 1,
1.146832, -0.2509965, 1.574266, 1, 0, 0.7137255, 1,
1.147899, 0.1265895, 2.484014, 1, 0, 0.7098039, 1,
1.15257, -0.03232996, 3.058067, 1, 0, 0.7019608, 1,
1.157054, 1.023579, -0.01230887, 1, 0, 0.6941177, 1,
1.161954, -0.7410428, 2.754244, 1, 0, 0.6901961, 1,
1.168581, -0.6578655, 1.815732, 1, 0, 0.682353, 1,
1.178913, 1.154072, 1.791588, 1, 0, 0.6784314, 1,
1.179733, -0.5936668, 2.400955, 1, 0, 0.6705883, 1,
1.18829, 1.204969, 0.3402645, 1, 0, 0.6666667, 1,
1.193096, -1.485234, 4.419018, 1, 0, 0.6588235, 1,
1.198595, -1.140566, 0.9951664, 1, 0, 0.654902, 1,
1.208129, 1.491799, 2.356803, 1, 0, 0.6470588, 1,
1.209168, -1.599278, 1.882918, 1, 0, 0.6431373, 1,
1.211933, -0.8713419, 2.835113, 1, 0, 0.6352941, 1,
1.212327, 0.02068296, 2.591101, 1, 0, 0.6313726, 1,
1.22105, -0.8838856, 3.31643, 1, 0, 0.6235294, 1,
1.22826, 0.1819668, 0.4144093, 1, 0, 0.6196079, 1,
1.240086, -0.1016362, 2.400624, 1, 0, 0.6117647, 1,
1.244322, 1.857791, -1.463335, 1, 0, 0.6078432, 1,
1.245704, 0.294872, 2.458965, 1, 0, 0.6, 1,
1.259536, 1.037077, 2.292901, 1, 0, 0.5921569, 1,
1.267136, 0.7619807, 0.1055302, 1, 0, 0.5882353, 1,
1.279849, -0.9975818, 0.5610564, 1, 0, 0.5803922, 1,
1.282814, 0.8562219, 0.7812219, 1, 0, 0.5764706, 1,
1.294223, 1.012746, 0.6043695, 1, 0, 0.5686275, 1,
1.294945, -0.001780045, 0.6520216, 1, 0, 0.5647059, 1,
1.295842, 1.38852, 1.532369, 1, 0, 0.5568628, 1,
1.297942, 0.3398058, 2.72081, 1, 0, 0.5529412, 1,
1.306045, -0.1547847, 2.512797, 1, 0, 0.5450981, 1,
1.306882, 0.7540101, 0.6873271, 1, 0, 0.5411765, 1,
1.31131, -2.393897, 5.020828, 1, 0, 0.5333334, 1,
1.328545, -0.4040092, 1.931072, 1, 0, 0.5294118, 1,
1.330564, 0.6332722, -0.1536675, 1, 0, 0.5215687, 1,
1.333653, -0.4710761, 1.704154, 1, 0, 0.5176471, 1,
1.334455, 1.172902, 0.7058631, 1, 0, 0.509804, 1,
1.346453, -0.4085029, 1.258482, 1, 0, 0.5058824, 1,
1.35338, -0.9760091, 3.026974, 1, 0, 0.4980392, 1,
1.361861, 0.2310384, 1.072446, 1, 0, 0.4901961, 1,
1.365321, 1.487147, 0.7704814, 1, 0, 0.4862745, 1,
1.367465, 0.7978254, 1.060189, 1, 0, 0.4784314, 1,
1.391202, -2.388265, 3.662535, 1, 0, 0.4745098, 1,
1.395173, -0.00244784, 1.219932, 1, 0, 0.4666667, 1,
1.402425, -1.154662, 2.984731, 1, 0, 0.4627451, 1,
1.40483, -1.438605, 0.9393558, 1, 0, 0.454902, 1,
1.417787, 0.6221017, 0.9905224, 1, 0, 0.4509804, 1,
1.420429, 1.143152, 0.7443249, 1, 0, 0.4431373, 1,
1.424163, -0.1843012, 0.1524793, 1, 0, 0.4392157, 1,
1.425409, -0.1421059, 2.211887, 1, 0, 0.4313726, 1,
1.429042, -0.8968892, 1.90697, 1, 0, 0.427451, 1,
1.430806, 0.7835347, 0.8460917, 1, 0, 0.4196078, 1,
1.440597, 1.785765, 0.9808777, 1, 0, 0.4156863, 1,
1.440883, 0.4928214, 2.385879, 1, 0, 0.4078431, 1,
1.446181, -0.5653756, 0.9355257, 1, 0, 0.4039216, 1,
1.447079, -0.3228035, 0.6000135, 1, 0, 0.3960784, 1,
1.463953, 0.3905466, 1.574484, 1, 0, 0.3882353, 1,
1.464742, 0.6763679, 1.822664, 1, 0, 0.3843137, 1,
1.474853, -0.0002678936, 2.975343, 1, 0, 0.3764706, 1,
1.488573, -0.6310992, 4.490564, 1, 0, 0.372549, 1,
1.489365, 0.9961846, 2.894447, 1, 0, 0.3647059, 1,
1.495746, -0.6338755, 2.629784, 1, 0, 0.3607843, 1,
1.502088, -1.421645, 1.026244, 1, 0, 0.3529412, 1,
1.551066, -0.1128371, 0.7960915, 1, 0, 0.3490196, 1,
1.552189, -0.2660431, 1.515579, 1, 0, 0.3411765, 1,
1.599097, 0.8005089, 2.132569, 1, 0, 0.3372549, 1,
1.637048, -0.2538716, 3.545715, 1, 0, 0.3294118, 1,
1.641879, 1.042731, -0.07416794, 1, 0, 0.3254902, 1,
1.656666, -0.3695578, 2.286122, 1, 0, 0.3176471, 1,
1.66336, -1.289504, 2.535126, 1, 0, 0.3137255, 1,
1.676104, -0.5873277, 2.941375, 1, 0, 0.3058824, 1,
1.678751, 0.08636464, 2.088397, 1, 0, 0.2980392, 1,
1.678871, 0.06377622, 1.698763, 1, 0, 0.2941177, 1,
1.681358, -1.251177, 1.519669, 1, 0, 0.2862745, 1,
1.693394, 0.5796585, 1.878661, 1, 0, 0.282353, 1,
1.693509, -0.4689683, 0.7760445, 1, 0, 0.2745098, 1,
1.695102, 0.4714752, 0.8796034, 1, 0, 0.2705882, 1,
1.696734, 0.2507018, 1.300552, 1, 0, 0.2627451, 1,
1.699152, 0.1553206, 1.265802, 1, 0, 0.2588235, 1,
1.700616, -0.02039827, 3.012311, 1, 0, 0.2509804, 1,
1.721826, 1.850003, -0.2547002, 1, 0, 0.2470588, 1,
1.725293, -1.192995, 3.111223, 1, 0, 0.2392157, 1,
1.737214, 0.06300899, 0.9970812, 1, 0, 0.2352941, 1,
1.738309, 1.133939, 1.85804, 1, 0, 0.227451, 1,
1.780257, 0.0220413, 1.860058, 1, 0, 0.2235294, 1,
1.805134, -1.427526, 2.453093, 1, 0, 0.2156863, 1,
1.806691, -1.029299, 2.144383, 1, 0, 0.2117647, 1,
1.809432, 0.6372513, 0.2504092, 1, 0, 0.2039216, 1,
1.812654, 0.1817885, 0.6383955, 1, 0, 0.1960784, 1,
1.816985, 0.6703846, 0.7492208, 1, 0, 0.1921569, 1,
1.821664, 1.482722, -0.773846, 1, 0, 0.1843137, 1,
1.869578, -0.08519907, 1.6039, 1, 0, 0.1803922, 1,
1.873651, -0.7809448, 2.937204, 1, 0, 0.172549, 1,
1.876024, -0.6486683, 0.745222, 1, 0, 0.1686275, 1,
1.87873, -0.4328527, 2.069597, 1, 0, 0.1607843, 1,
1.922531, -0.8273187, 1.97748, 1, 0, 0.1568628, 1,
1.924333, 1.165685, 1.540179, 1, 0, 0.1490196, 1,
1.934807, 0.2281483, 2.212722, 1, 0, 0.145098, 1,
1.966825, 1.040256, 1.169885, 1, 0, 0.1372549, 1,
1.967841, 1.294985, -0.1235533, 1, 0, 0.1333333, 1,
1.980618, 0.2520583, 2.582358, 1, 0, 0.1254902, 1,
1.981026, 1.235172, 1.202513, 1, 0, 0.1215686, 1,
2.004849, -0.844991, 2.770023, 1, 0, 0.1137255, 1,
2.05915, 0.07928003, 1.421957, 1, 0, 0.1098039, 1,
2.132096, 0.04154736, 2.073376, 1, 0, 0.1019608, 1,
2.133986, -0.3475722, -0.08349673, 1, 0, 0.09411765, 1,
2.141293, -1.390811, 3.143908, 1, 0, 0.09019608, 1,
2.144575, 1.504645, 0.6372393, 1, 0, 0.08235294, 1,
2.169946, -0.02088257, 0.458545, 1, 0, 0.07843138, 1,
2.310669, -0.9291452, 4.101887, 1, 0, 0.07058824, 1,
2.322883, 1.733403, 0.1593765, 1, 0, 0.06666667, 1,
2.334333, -0.2724812, 1.426911, 1, 0, 0.05882353, 1,
2.351646, -1.169268, 2.513016, 1, 0, 0.05490196, 1,
2.428554, 0.2358498, 2.627786, 1, 0, 0.04705882, 1,
2.436755, -1.665028, 1.654, 1, 0, 0.04313726, 1,
2.445191, 0.7663473, 0.7248384, 1, 0, 0.03529412, 1,
2.482172, -1.714378, -0.06927941, 1, 0, 0.03137255, 1,
2.527049, -0.4197784, 2.345145, 1, 0, 0.02352941, 1,
2.823889, -0.07504871, 3.60231, 1, 0, 0.01960784, 1,
3.933213, 1.68218, 2.000112, 1, 0, 0.01176471, 1,
4.047114, -1.380168, 2.08883, 1, 0, 0.007843138, 1
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
0.232981, -4.266799, -7.476923, 0, -0.5, 0.5, 0.5,
0.232981, -4.266799, -7.476923, 1, -0.5, 0.5, 0.5,
0.232981, -4.266799, -7.476923, 1, 1.5, 0.5, 0.5,
0.232981, -4.266799, -7.476923, 0, 1.5, 0.5, 0.5
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
-4.874143, 0.06513965, -7.476923, 0, -0.5, 0.5, 0.5,
-4.874143, 0.06513965, -7.476923, 1, -0.5, 0.5, 0.5,
-4.874143, 0.06513965, -7.476923, 1, 1.5, 0.5, 0.5,
-4.874143, 0.06513965, -7.476923, 0, 1.5, 0.5, 0.5
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
-4.874143, -4.266799, 0.02383757, 0, -0.5, 0.5, 0.5,
-4.874143, -4.266799, 0.02383757, 1, -0.5, 0.5, 0.5,
-4.874143, -4.266799, 0.02383757, 1, 1.5, 0.5, 0.5,
-4.874143, -4.266799, 0.02383757, 0, 1.5, 0.5, 0.5
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
-2, -3.267121, -5.745978,
4, -3.267121, -5.745978,
-2, -3.267121, -5.745978,
-2, -3.433734, -6.034469,
0, -3.267121, -5.745978,
0, -3.433734, -6.034469,
2, -3.267121, -5.745978,
2, -3.433734, -6.034469,
4, -3.267121, -5.745978,
4, -3.433734, -6.034469
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
-2, -3.76696, -6.611451, 0, -0.5, 0.5, 0.5,
-2, -3.76696, -6.611451, 1, -0.5, 0.5, 0.5,
-2, -3.76696, -6.611451, 1, 1.5, 0.5, 0.5,
-2, -3.76696, -6.611451, 0, 1.5, 0.5, 0.5,
0, -3.76696, -6.611451, 0, -0.5, 0.5, 0.5,
0, -3.76696, -6.611451, 1, -0.5, 0.5, 0.5,
0, -3.76696, -6.611451, 1, 1.5, 0.5, 0.5,
0, -3.76696, -6.611451, 0, 1.5, 0.5, 0.5,
2, -3.76696, -6.611451, 0, -0.5, 0.5, 0.5,
2, -3.76696, -6.611451, 1, -0.5, 0.5, 0.5,
2, -3.76696, -6.611451, 1, 1.5, 0.5, 0.5,
2, -3.76696, -6.611451, 0, 1.5, 0.5, 0.5,
4, -3.76696, -6.611451, 0, -0.5, 0.5, 0.5,
4, -3.76696, -6.611451, 1, -0.5, 0.5, 0.5,
4, -3.76696, -6.611451, 1, 1.5, 0.5, 0.5,
4, -3.76696, -6.611451, 0, 1.5, 0.5, 0.5
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
-3.695576, -3, -5.745978,
-3.695576, 3, -5.745978,
-3.695576, -3, -5.745978,
-3.892004, -3, -6.034469,
-3.695576, -2, -5.745978,
-3.892004, -2, -6.034469,
-3.695576, -1, -5.745978,
-3.892004, -1, -6.034469,
-3.695576, 0, -5.745978,
-3.892004, 0, -6.034469,
-3.695576, 1, -5.745978,
-3.892004, 1, -6.034469,
-3.695576, 2, -5.745978,
-3.892004, 2, -6.034469,
-3.695576, 3, -5.745978,
-3.892004, 3, -6.034469
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
-4.28486, -3, -6.611451, 0, -0.5, 0.5, 0.5,
-4.28486, -3, -6.611451, 1, -0.5, 0.5, 0.5,
-4.28486, -3, -6.611451, 1, 1.5, 0.5, 0.5,
-4.28486, -3, -6.611451, 0, 1.5, 0.5, 0.5,
-4.28486, -2, -6.611451, 0, -0.5, 0.5, 0.5,
-4.28486, -2, -6.611451, 1, -0.5, 0.5, 0.5,
-4.28486, -2, -6.611451, 1, 1.5, 0.5, 0.5,
-4.28486, -2, -6.611451, 0, 1.5, 0.5, 0.5,
-4.28486, -1, -6.611451, 0, -0.5, 0.5, 0.5,
-4.28486, -1, -6.611451, 1, -0.5, 0.5, 0.5,
-4.28486, -1, -6.611451, 1, 1.5, 0.5, 0.5,
-4.28486, -1, -6.611451, 0, 1.5, 0.5, 0.5,
-4.28486, 0, -6.611451, 0, -0.5, 0.5, 0.5,
-4.28486, 0, -6.611451, 1, -0.5, 0.5, 0.5,
-4.28486, 0, -6.611451, 1, 1.5, 0.5, 0.5,
-4.28486, 0, -6.611451, 0, 1.5, 0.5, 0.5,
-4.28486, 1, -6.611451, 0, -0.5, 0.5, 0.5,
-4.28486, 1, -6.611451, 1, -0.5, 0.5, 0.5,
-4.28486, 1, -6.611451, 1, 1.5, 0.5, 0.5,
-4.28486, 1, -6.611451, 0, 1.5, 0.5, 0.5,
-4.28486, 2, -6.611451, 0, -0.5, 0.5, 0.5,
-4.28486, 2, -6.611451, 1, -0.5, 0.5, 0.5,
-4.28486, 2, -6.611451, 1, 1.5, 0.5, 0.5,
-4.28486, 2, -6.611451, 0, 1.5, 0.5, 0.5,
-4.28486, 3, -6.611451, 0, -0.5, 0.5, 0.5,
-4.28486, 3, -6.611451, 1, -0.5, 0.5, 0.5,
-4.28486, 3, -6.611451, 1, 1.5, 0.5, 0.5,
-4.28486, 3, -6.611451, 0, 1.5, 0.5, 0.5
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
-3.695576, -3.267121, -4,
-3.695576, -3.267121, 4,
-3.695576, -3.267121, -4,
-3.892004, -3.433734, -4,
-3.695576, -3.267121, -2,
-3.892004, -3.433734, -2,
-3.695576, -3.267121, 0,
-3.892004, -3.433734, 0,
-3.695576, -3.267121, 2,
-3.892004, -3.433734, 2,
-3.695576, -3.267121, 4,
-3.892004, -3.433734, 4
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
-4.28486, -3.76696, -4, 0, -0.5, 0.5, 0.5,
-4.28486, -3.76696, -4, 1, -0.5, 0.5, 0.5,
-4.28486, -3.76696, -4, 1, 1.5, 0.5, 0.5,
-4.28486, -3.76696, -4, 0, 1.5, 0.5, 0.5,
-4.28486, -3.76696, -2, 0, -0.5, 0.5, 0.5,
-4.28486, -3.76696, -2, 1, -0.5, 0.5, 0.5,
-4.28486, -3.76696, -2, 1, 1.5, 0.5, 0.5,
-4.28486, -3.76696, -2, 0, 1.5, 0.5, 0.5,
-4.28486, -3.76696, 0, 0, -0.5, 0.5, 0.5,
-4.28486, -3.76696, 0, 1, -0.5, 0.5, 0.5,
-4.28486, -3.76696, 0, 1, 1.5, 0.5, 0.5,
-4.28486, -3.76696, 0, 0, 1.5, 0.5, 0.5,
-4.28486, -3.76696, 2, 0, -0.5, 0.5, 0.5,
-4.28486, -3.76696, 2, 1, -0.5, 0.5, 0.5,
-4.28486, -3.76696, 2, 1, 1.5, 0.5, 0.5,
-4.28486, -3.76696, 2, 0, 1.5, 0.5, 0.5,
-4.28486, -3.76696, 4, 0, -0.5, 0.5, 0.5,
-4.28486, -3.76696, 4, 1, -0.5, 0.5, 0.5,
-4.28486, -3.76696, 4, 1, 1.5, 0.5, 0.5,
-4.28486, -3.76696, 4, 0, 1.5, 0.5, 0.5
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
-3.695576, -3.267121, -5.745978,
-3.695576, 3.397401, -5.745978,
-3.695576, -3.267121, 5.793653,
-3.695576, 3.397401, 5.793653,
-3.695576, -3.267121, -5.745978,
-3.695576, -3.267121, 5.793653,
-3.695576, 3.397401, -5.745978,
-3.695576, 3.397401, 5.793653,
-3.695576, -3.267121, -5.745978,
4.161538, -3.267121, -5.745978,
-3.695576, -3.267121, 5.793653,
4.161538, -3.267121, 5.793653,
-3.695576, 3.397401, -5.745978,
4.161538, 3.397401, -5.745978,
-3.695576, 3.397401, 5.793653,
4.161538, 3.397401, 5.793653,
4.161538, -3.267121, -5.745978,
4.161538, 3.397401, -5.745978,
4.161538, -3.267121, 5.793653,
4.161538, 3.397401, 5.793653,
4.161538, -3.267121, -5.745978,
4.161538, -3.267121, 5.793653,
4.161538, 3.397401, -5.745978,
4.161538, 3.397401, 5.793653
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
var radius = 8.260546;
var distance = 36.7521;
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
mvMatrix.translate( -0.232981, -0.06513965, -0.02383757 );
mvMatrix.scale( 1.136736, 1.340151, 0.7739818 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.7521);
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
avermectin_B1a<-read.table("avermectin_B1a.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-avermectin_B1a$V2
```

```
## Error in eval(expr, envir, enclos): object 'avermectin_B1a' not found
```

```r
y<-avermectin_B1a$V3
```

```
## Error in eval(expr, envir, enclos): object 'avermectin_B1a' not found
```

```r
z<-avermectin_B1a$V4
```

```
## Error in eval(expr, envir, enclos): object 'avermectin_B1a' not found
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
-3.581152, -1.638682, -0.3984995, 0, 0, 1, 1, 1,
-3.21508, 1.445953, -1.945269, 1, 0, 0, 1, 1,
-3.13924, 1.9518, -1.689104, 1, 0, 0, 1, 1,
-3.021502, -0.08829825, -2.024457, 1, 0, 0, 1, 1,
-2.987578, -0.1017928, -1.152452, 1, 0, 0, 1, 1,
-2.797778, 1.347968, -2.212389, 1, 0, 0, 1, 1,
-2.509417, 1.492166, -0.7738856, 0, 0, 0, 1, 1,
-2.473545, -0.8041459, -1.355059, 0, 0, 0, 1, 1,
-2.436883, -0.7327032, -1.344219, 0, 0, 0, 1, 1,
-2.435833, 1.154819, -2.134257, 0, 0, 0, 1, 1,
-2.400232, -0.2589374, -1.426999, 0, 0, 0, 1, 1,
-2.388808, 1.052196, -0.3658414, 0, 0, 0, 1, 1,
-2.384819, 0.9568458, -0.3630048, 0, 0, 0, 1, 1,
-2.36083, 0.1973862, -1.431526, 1, 1, 1, 1, 1,
-2.331617, -1.430627, -1.073365, 1, 1, 1, 1, 1,
-2.276912, -1.450311, -2.650006, 1, 1, 1, 1, 1,
-2.206368, -0.5779976, -1.317654, 1, 1, 1, 1, 1,
-2.141948, -1.210089, -1.711975, 1, 1, 1, 1, 1,
-2.085375, -0.04497832, -1.919453, 1, 1, 1, 1, 1,
-2.083407, 0.6870822, -0.7677939, 1, 1, 1, 1, 1,
-2.071661, 1.413608, -0.2386213, 1, 1, 1, 1, 1,
-2.046517, 0.8400571, -1.302969, 1, 1, 1, 1, 1,
-2.037795, -0.4423302, -1.472116, 1, 1, 1, 1, 1,
-2.000492, -2.805312, -2.501177, 1, 1, 1, 1, 1,
-1.990246, 0.708364, -1.492911, 1, 1, 1, 1, 1,
-1.97965, -1.239954, 0.2079975, 1, 1, 1, 1, 1,
-1.966267, -0.2660351, -2.196119, 1, 1, 1, 1, 1,
-1.950635, -0.4236145, -1.850597, 1, 1, 1, 1, 1,
-1.945837, 0.8635824, -0.4800877, 0, 0, 1, 1, 1,
-1.945718, -0.02861767, -1.167045, 1, 0, 0, 1, 1,
-1.93696, -0.2391533, -0.3838041, 1, 0, 0, 1, 1,
-1.920729, -0.6379724, -2.839077, 1, 0, 0, 1, 1,
-1.914865, -0.8126958, -3.197785, 1, 0, 0, 1, 1,
-1.90648, -1.259005, -0.8996384, 1, 0, 0, 1, 1,
-1.903682, -0.3286563, 0.2033755, 0, 0, 0, 1, 1,
-1.887251, 1.568508, -1.831186, 0, 0, 0, 1, 1,
-1.881521, 1.632964, -1.017727, 0, 0, 0, 1, 1,
-1.873827, 1.011469, -1.207541, 0, 0, 0, 1, 1,
-1.86494, 0.6340979, -0.7255034, 0, 0, 0, 1, 1,
-1.859703, 0.3905817, -3.790797, 0, 0, 0, 1, 1,
-1.818154, -1.274001, -3.89435, 0, 0, 0, 1, 1,
-1.807012, 0.1403701, -0.9782586, 1, 1, 1, 1, 1,
-1.806025, -0.1324369, -1.205279, 1, 1, 1, 1, 1,
-1.74501, 0.6135674, -0.2299371, 1, 1, 1, 1, 1,
-1.704026, -1.375614, -2.120811, 1, 1, 1, 1, 1,
-1.701758, 0.4965533, -1.423742, 1, 1, 1, 1, 1,
-1.700487, -1.237546, -1.043355, 1, 1, 1, 1, 1,
-1.698653, 0.3527166, -4.960675, 1, 1, 1, 1, 1,
-1.695609, 0.5492451, -1.459883, 1, 1, 1, 1, 1,
-1.691444, -0.09654341, -1.830985, 1, 1, 1, 1, 1,
-1.681682, -0.4367546, -2.003645, 1, 1, 1, 1, 1,
-1.679159, 1.350152, 0.6548619, 1, 1, 1, 1, 1,
-1.670133, 0.2986907, 1.278832, 1, 1, 1, 1, 1,
-1.645285, -0.2668232, -0.341459, 1, 1, 1, 1, 1,
-1.636954, -0.7278546, -0.9224977, 1, 1, 1, 1, 1,
-1.617667, 0.6944782, -1.719508, 1, 1, 1, 1, 1,
-1.614571, -0.9863548, -0.5708491, 0, 0, 1, 1, 1,
-1.604714, 0.008334761, -3.071455, 1, 0, 0, 1, 1,
-1.596784, -0.9701183, -3.587963, 1, 0, 0, 1, 1,
-1.577004, 0.1932167, 0.8594981, 1, 0, 0, 1, 1,
-1.569698, -0.2022281, -2.488439, 1, 0, 0, 1, 1,
-1.569035, -0.2299291, -2.389353, 1, 0, 0, 1, 1,
-1.56811, -0.2435222, -2.590164, 0, 0, 0, 1, 1,
-1.56673, 0.3470878, -2.375571, 0, 0, 0, 1, 1,
-1.564174, 1.201611, -2.518977, 0, 0, 0, 1, 1,
-1.563569, 0.6689085, -0.637566, 0, 0, 0, 1, 1,
-1.540985, -0.5942439, -1.662656, 0, 0, 0, 1, 1,
-1.540448, 1.070495, -1.30117, 0, 0, 0, 1, 1,
-1.533485, -0.4924335, -2.004714, 0, 0, 0, 1, 1,
-1.525865, -0.520268, -3.17488, 1, 1, 1, 1, 1,
-1.518207, 1.486903, -1.513462, 1, 1, 1, 1, 1,
-1.516908, -2.156163, -0.591858, 1, 1, 1, 1, 1,
-1.511704, 0.9851478, -0.4221675, 1, 1, 1, 1, 1,
-1.510969, -1.014103, -1.776449, 1, 1, 1, 1, 1,
-1.510872, -1.058887, -3.325279, 1, 1, 1, 1, 1,
-1.510292, -1.895759, -3.352089, 1, 1, 1, 1, 1,
-1.501743, 1.084939, -2.313517, 1, 1, 1, 1, 1,
-1.49382, -1.21035, -1.408676, 1, 1, 1, 1, 1,
-1.481929, -0.2857347, -1.333665, 1, 1, 1, 1, 1,
-1.474942, -0.8413548, -2.822275, 1, 1, 1, 1, 1,
-1.466784, -0.6744974, -2.69022, 1, 1, 1, 1, 1,
-1.464219, -1.194906, -1.592993, 1, 1, 1, 1, 1,
-1.459233, -1.490863, -2.365427, 1, 1, 1, 1, 1,
-1.45271, 1.404416, -1.894581, 1, 1, 1, 1, 1,
-1.438932, -0.005238307, -0.6009293, 0, 0, 1, 1, 1,
-1.428554, 0.7144997, -2.298133, 1, 0, 0, 1, 1,
-1.424823, -0.2841728, -1.369319, 1, 0, 0, 1, 1,
-1.410531, 0.8810009, -1.2349, 1, 0, 0, 1, 1,
-1.406179, 1.468417, -0.7394493, 1, 0, 0, 1, 1,
-1.399041, -0.461828, -2.070158, 1, 0, 0, 1, 1,
-1.393505, -0.3359465, -0.2612976, 0, 0, 0, 1, 1,
-1.388809, 0.5246097, -0.412424, 0, 0, 0, 1, 1,
-1.385908, 0.6370661, -2.003887, 0, 0, 0, 1, 1,
-1.384253, 0.8559271, -3.104857, 0, 0, 0, 1, 1,
-1.383728, -0.4460936, -1.155269, 0, 0, 0, 1, 1,
-1.372743, 0.3429952, -1.935645, 0, 0, 0, 1, 1,
-1.365971, -0.8187652, -1.350999, 0, 0, 0, 1, 1,
-1.362519, 0.7326965, -2.000525, 1, 1, 1, 1, 1,
-1.358386, 1.451941, -1.128637, 1, 1, 1, 1, 1,
-1.355812, -0.3801126, -2.673025, 1, 1, 1, 1, 1,
-1.332619, 0.4909622, -1.141885, 1, 1, 1, 1, 1,
-1.32695, 0.4760837, -1.672269, 1, 1, 1, 1, 1,
-1.321658, 0.4208993, -1.301717, 1, 1, 1, 1, 1,
-1.299876, -0.6814045, -1.776608, 1, 1, 1, 1, 1,
-1.277404, -0.8355875, -1.726751, 1, 1, 1, 1, 1,
-1.273421, 1.19187, -0.5314897, 1, 1, 1, 1, 1,
-1.273252, -0.4532006, -2.405112, 1, 1, 1, 1, 1,
-1.267594, -0.5016857, -2.08024, 1, 1, 1, 1, 1,
-1.262516, -1.664655, -3.84333, 1, 1, 1, 1, 1,
-1.257005, 1.1978, -2.002073, 1, 1, 1, 1, 1,
-1.252611, -0.4129343, -3.435084, 1, 1, 1, 1, 1,
-1.251397, -0.03292577, -0.7936039, 1, 1, 1, 1, 1,
-1.237178, 1.689867, -0.773563, 0, 0, 1, 1, 1,
-1.215068, -0.887744, -3.630424, 1, 0, 0, 1, 1,
-1.209982, 0.3575167, -2.066708, 1, 0, 0, 1, 1,
-1.208254, 0.08629224, -2.1348, 1, 0, 0, 1, 1,
-1.208253, -1.757197, -2.088908, 1, 0, 0, 1, 1,
-1.206004, 2.586221, -0.4335313, 1, 0, 0, 1, 1,
-1.202052, 0.1323945, -1.850974, 0, 0, 0, 1, 1,
-1.202048, -0.06437762, -3.318818, 0, 0, 0, 1, 1,
-1.201909, -0.3115222, -2.547712, 0, 0, 0, 1, 1,
-1.191586, -0.8953024, -4.403618, 0, 0, 0, 1, 1,
-1.189339, -0.4157277, -0.7886961, 0, 0, 0, 1, 1,
-1.186129, 0.7439218, -0.8466938, 0, 0, 0, 1, 1,
-1.185949, 1.070051, -0.9746798, 0, 0, 0, 1, 1,
-1.17988, -0.01735494, -4.181135, 1, 1, 1, 1, 1,
-1.179473, -1.495197, -2.215579, 1, 1, 1, 1, 1,
-1.174531, -0.1184021, -0.3973086, 1, 1, 1, 1, 1,
-1.168783, 0.8400165, -0.4113478, 1, 1, 1, 1, 1,
-1.167179, -0.4831499, -2.23983, 1, 1, 1, 1, 1,
-1.160194, -0.9299101, -0.4712152, 1, 1, 1, 1, 1,
-1.15818, 1.561527, -1.122401, 1, 1, 1, 1, 1,
-1.148823, 0.5754607, -0.121291, 1, 1, 1, 1, 1,
-1.148698, -0.4738611, -2.513511, 1, 1, 1, 1, 1,
-1.144932, 0.8000077, -1.783883, 1, 1, 1, 1, 1,
-1.138489, 0.8731858, -1.79968, 1, 1, 1, 1, 1,
-1.13783, -1.551764, -0.8287083, 1, 1, 1, 1, 1,
-1.135567, 0.6898111, -2.17342, 1, 1, 1, 1, 1,
-1.135466, 0.2842243, 0.3549904, 1, 1, 1, 1, 1,
-1.117777, -1.618798, -3.141724, 1, 1, 1, 1, 1,
-1.102425, 0.8349193, -3.455907, 0, 0, 1, 1, 1,
-1.101141, -1.982976, -2.719472, 1, 0, 0, 1, 1,
-1.098195, -1.734756, -1.168616, 1, 0, 0, 1, 1,
-1.096977, -0.3640463, -2.074713, 1, 0, 0, 1, 1,
-1.096674, 0.3216483, 0.5526851, 1, 0, 0, 1, 1,
-1.092843, 0.1724045, -1.642141, 1, 0, 0, 1, 1,
-1.091338, -1.037581, -4.448627, 0, 0, 0, 1, 1,
-1.085336, 1.288567, -1.797238, 0, 0, 0, 1, 1,
-1.083288, -0.2145883, -0.9322044, 0, 0, 0, 1, 1,
-1.066403, 0.3512617, -1.206809, 0, 0, 0, 1, 1,
-1.065888, 0.4729602, -1.377818, 0, 0, 0, 1, 1,
-1.064848, -0.5581818, -1.727025, 0, 0, 0, 1, 1,
-1.054271, 0.9785671, -1.70055, 0, 0, 0, 1, 1,
-1.050486, 0.1920461, -1.666659, 1, 1, 1, 1, 1,
-1.040761, -0.4755957, -1.718436, 1, 1, 1, 1, 1,
-1.037626, -0.2615166, -2.719263, 1, 1, 1, 1, 1,
-1.036771, 0.1838725, -1.645704, 1, 1, 1, 1, 1,
-1.031815, 0.8872368, -1.739136, 1, 1, 1, 1, 1,
-1.029078, -0.7605219, -2.355177, 1, 1, 1, 1, 1,
-1.028955, 0.709728, -1.101622, 1, 1, 1, 1, 1,
-1.023321, -2.226219, -2.678774, 1, 1, 1, 1, 1,
-1.01535, 0.2777047, -0.3868276, 1, 1, 1, 1, 1,
-1.008731, 1.439408, 0.503163, 1, 1, 1, 1, 1,
-1.006425, -1.007548, -2.461627, 1, 1, 1, 1, 1,
-1.000765, 0.4746836, -1.109874, 1, 1, 1, 1, 1,
-1.000755, 1.843858, 0.9312461, 1, 1, 1, 1, 1,
-0.9988342, -0.7584388, -3.216572, 1, 1, 1, 1, 1,
-0.9977947, 0.3313943, -0.5863199, 1, 1, 1, 1, 1,
-0.992066, -0.3524958, -1.382234, 0, 0, 1, 1, 1,
-0.9884092, 0.2661429, -1.475844, 1, 0, 0, 1, 1,
-0.9877027, 1.063851, -1.230197, 1, 0, 0, 1, 1,
-0.9868042, 0.9025866, -2.812343, 1, 0, 0, 1, 1,
-0.9830651, -0.352438, -1.837867, 1, 0, 0, 1, 1,
-0.9792491, -0.03475993, -0.5259957, 1, 0, 0, 1, 1,
-0.9632555, -0.04995979, -0.6077385, 0, 0, 0, 1, 1,
-0.9401971, -0.511681, -1.040247, 0, 0, 0, 1, 1,
-0.9377319, 0.7699649, -0.1615979, 0, 0, 0, 1, 1,
-0.9323542, -0.1915272, -1.500478, 0, 0, 0, 1, 1,
-0.9321221, 0.217829, -1.125358, 0, 0, 0, 1, 1,
-0.9305264, -1.016523, -2.899107, 0, 0, 0, 1, 1,
-0.9291297, -1.015185, -1.873302, 0, 0, 0, 1, 1,
-0.9123991, 0.3096774, -2.796828, 1, 1, 1, 1, 1,
-0.9122328, 2.48814, 0.9849548, 1, 1, 1, 1, 1,
-0.9003943, -0.6537933, -2.14851, 1, 1, 1, 1, 1,
-0.8977316, 0.1969267, -1.682642, 1, 1, 1, 1, 1,
-0.8934278, 0.4384693, -0.03542557, 1, 1, 1, 1, 1,
-0.8901023, -0.9945987, -1.02831, 1, 1, 1, 1, 1,
-0.8865713, -1.283681, -1.372947, 1, 1, 1, 1, 1,
-0.8863738, -2.443529, -1.854125, 1, 1, 1, 1, 1,
-0.8825228, 0.7768445, -2.013717, 1, 1, 1, 1, 1,
-0.8803063, -0.2914527, -1.621114, 1, 1, 1, 1, 1,
-0.8755768, 0.2160559, -0.5514326, 1, 1, 1, 1, 1,
-0.8716137, 1.917631, -1.701858, 1, 1, 1, 1, 1,
-0.8650119, -1.25167, -1.383978, 1, 1, 1, 1, 1,
-0.861551, -1.157175, -2.889874, 1, 1, 1, 1, 1,
-0.8614275, -0.02274854, -0.9746805, 1, 1, 1, 1, 1,
-0.8591815, -0.5407618, -1.525285, 0, 0, 1, 1, 1,
-0.8545728, -0.5111073, -3.033872, 1, 0, 0, 1, 1,
-0.854013, -0.5757768, -0.4333682, 1, 0, 0, 1, 1,
-0.8519957, -0.4035863, -3.688354, 1, 0, 0, 1, 1,
-0.8483378, 1.032995, -1.789532, 1, 0, 0, 1, 1,
-0.8465807, 0.291405, -0.9304506, 1, 0, 0, 1, 1,
-0.8453039, 2.270159, -2.421099, 0, 0, 0, 1, 1,
-0.8402419, 0.04917656, -0.8300549, 0, 0, 0, 1, 1,
-0.8354724, -0.05167174, -0.2925642, 0, 0, 0, 1, 1,
-0.828844, 1.410312, -0.0966626, 0, 0, 0, 1, 1,
-0.8141223, 0.2425623, -0.1228239, 0, 0, 0, 1, 1,
-0.8117611, -0.07376997, -1.593324, 0, 0, 0, 1, 1,
-0.8102379, 0.163301, -1.690924, 0, 0, 0, 1, 1,
-0.8071989, -0.3883385, -2.026369, 1, 1, 1, 1, 1,
-0.8040468, -0.02475936, -2.106889, 1, 1, 1, 1, 1,
-0.8038712, 0.1655233, -1.690807, 1, 1, 1, 1, 1,
-0.8038247, 2.368073, -0.8631845, 1, 1, 1, 1, 1,
-0.7994111, -0.0824903, -2.174008, 1, 1, 1, 1, 1,
-0.7982496, -0.6626485, -2.201139, 1, 1, 1, 1, 1,
-0.7968038, -0.2394896, -1.333062, 1, 1, 1, 1, 1,
-0.7938014, -0.3898357, -2.049093, 1, 1, 1, 1, 1,
-0.7935681, -1.550398, -2.876998, 1, 1, 1, 1, 1,
-0.7914366, -0.5213085, -1.292584, 1, 1, 1, 1, 1,
-0.7907597, -1.03291, -2.624863, 1, 1, 1, 1, 1,
-0.7900467, -0.06322021, -2.639207, 1, 1, 1, 1, 1,
-0.7875049, 0.4990252, -1.064406, 1, 1, 1, 1, 1,
-0.7788513, 1.014659, 0.7658057, 1, 1, 1, 1, 1,
-0.7782647, -1.005565, -3.429196, 1, 1, 1, 1, 1,
-0.7748336, 0.3939051, -0.4797641, 0, 0, 1, 1, 1,
-0.7729082, -0.5404584, -1.200289, 1, 0, 0, 1, 1,
-0.7725185, -2.074671, -2.17945, 1, 0, 0, 1, 1,
-0.7708113, -0.4167374, -0.4268101, 1, 0, 0, 1, 1,
-0.7684367, -1.31021, -3.55606, 1, 0, 0, 1, 1,
-0.7659025, -1.134634, -3.059321, 1, 0, 0, 1, 1,
-0.7589309, 2.629283, -0.319348, 0, 0, 0, 1, 1,
-0.749476, 0.4794455, -1.194184, 0, 0, 0, 1, 1,
-0.7491951, 1.247303, 1.327738, 0, 0, 0, 1, 1,
-0.7473292, 1.234861, -0.7170664, 0, 0, 0, 1, 1,
-0.7457842, -0.2949725, -1.807497, 0, 0, 0, 1, 1,
-0.7417944, 0.1306283, -0.6521214, 0, 0, 0, 1, 1,
-0.7411956, 1.014427, 0.2036611, 0, 0, 0, 1, 1,
-0.7406583, 1.183073, -0.9687585, 1, 1, 1, 1, 1,
-0.7374129, -1.119264, -1.056245, 1, 1, 1, 1, 1,
-0.7328193, -1.56782, -3.469356, 1, 1, 1, 1, 1,
-0.7298947, -1.236947, -2.506849, 1, 1, 1, 1, 1,
-0.7225376, 0.1911959, -1.281936, 1, 1, 1, 1, 1,
-0.7214648, -0.8867434, -4.056336, 1, 1, 1, 1, 1,
-0.7177993, 0.399123, -0.2099586, 1, 1, 1, 1, 1,
-0.7089354, -0.8109074, -3.389059, 1, 1, 1, 1, 1,
-0.7080936, -0.8204709, -3.404411, 1, 1, 1, 1, 1,
-0.6972497, -0.3407546, -2.647839, 1, 1, 1, 1, 1,
-0.6962602, -0.3148373, -1.730857, 1, 1, 1, 1, 1,
-0.6948162, -1.344842, -3.843178, 1, 1, 1, 1, 1,
-0.6898911, 1.562768, 0.3292092, 1, 1, 1, 1, 1,
-0.6880792, -0.1634981, -1.363103, 1, 1, 1, 1, 1,
-0.6873307, -0.7339739, -3.135554, 1, 1, 1, 1, 1,
-0.6843987, -1.139396, -4.010275, 0, 0, 1, 1, 1,
-0.6787055, -0.7370505, -2.796674, 1, 0, 0, 1, 1,
-0.675745, -1.314244, -3.062409, 1, 0, 0, 1, 1,
-0.6701068, -0.7041785, -2.691792, 1, 0, 0, 1, 1,
-0.6664344, -0.9715333, -2.372052, 1, 0, 0, 1, 1,
-0.6655625, -0.8267245, -2.008152, 1, 0, 0, 1, 1,
-0.663322, 0.426759, -1.241093, 0, 0, 0, 1, 1,
-0.662347, 0.3716115, 1.027654, 0, 0, 0, 1, 1,
-0.6608498, -1.340574, -0.9206231, 0, 0, 0, 1, 1,
-0.6600811, -0.6886578, -1.442242, 0, 0, 0, 1, 1,
-0.6571032, 1.630843, 0.3024374, 0, 0, 0, 1, 1,
-0.6538862, 1.093925, 1.980064, 0, 0, 0, 1, 1,
-0.6496287, -1.482224, -3.804079, 0, 0, 0, 1, 1,
-0.6461713, 1.539966, 0.8508378, 1, 1, 1, 1, 1,
-0.6452736, 0.4951102, -1.804301, 1, 1, 1, 1, 1,
-0.641821, 0.8586973, 1.174574, 1, 1, 1, 1, 1,
-0.6407778, -0.2484493, -1.412495, 1, 1, 1, 1, 1,
-0.6367267, -2.270382, -2.774834, 1, 1, 1, 1, 1,
-0.6361272, -1.32462, -3.187602, 1, 1, 1, 1, 1,
-0.6351367, -0.2117016, -3.496791, 1, 1, 1, 1, 1,
-0.628589, -1.116121, -2.623322, 1, 1, 1, 1, 1,
-0.6280762, 0.6246606, 0.1777083, 1, 1, 1, 1, 1,
-0.624059, -2.859008, -3.403116, 1, 1, 1, 1, 1,
-0.6238009, -0.6052693, -3.609534, 1, 1, 1, 1, 1,
-0.6236917, 1.47708, 0.8401417, 1, 1, 1, 1, 1,
-0.6147238, 0.6853722, -1.74543, 1, 1, 1, 1, 1,
-0.6130907, -0.8054618, -3.70455, 1, 1, 1, 1, 1,
-0.6108957, -0.1797129, -1.469702, 1, 1, 1, 1, 1,
-0.6055866, -1.277247, -4.309941, 0, 0, 1, 1, 1,
-0.6055695, 0.6740883, -0.9801329, 1, 0, 0, 1, 1,
-0.6031733, 0.8951929, -2.025352, 1, 0, 0, 1, 1,
-0.6006207, 0.1746207, -1.933258, 1, 0, 0, 1, 1,
-0.5962517, -0.910162, -1.049467, 1, 0, 0, 1, 1,
-0.5943789, -0.03370509, 0.4858764, 1, 0, 0, 1, 1,
-0.5888802, -0.9297484, -1.795662, 0, 0, 0, 1, 1,
-0.5879794, -1.27792, -3.900175, 0, 0, 0, 1, 1,
-0.5845287, -1.262331, -1.258382, 0, 0, 0, 1, 1,
-0.5752944, 0.08729179, -1.719245, 0, 0, 0, 1, 1,
-0.5648872, 0.2044449, -2.678735, 0, 0, 0, 1, 1,
-0.5645329, 1.040755, 1.356854, 0, 0, 0, 1, 1,
-0.5612248, -0.7580144, -2.238762, 0, 0, 0, 1, 1,
-0.5602705, 0.3776235, -1.426307, 1, 1, 1, 1, 1,
-0.5600503, 2.003389, 1.023041, 1, 1, 1, 1, 1,
-0.558355, -0.7155476, -2.115919, 1, 1, 1, 1, 1,
-0.548433, 0.3250839, -2.219922, 1, 1, 1, 1, 1,
-0.5399449, 0.7000861, 0.2338809, 1, 1, 1, 1, 1,
-0.5389682, -1.218788, -2.041081, 1, 1, 1, 1, 1,
-0.5387062, 2.088652, -0.7069135, 1, 1, 1, 1, 1,
-0.5339946, 0.3063466, -2.385757, 1, 1, 1, 1, 1,
-0.5329486, -0.7831401, -1.602857, 1, 1, 1, 1, 1,
-0.5301951, -0.4265687, -0.9200427, 1, 1, 1, 1, 1,
-0.5230185, 0.01342628, -0.9914408, 1, 1, 1, 1, 1,
-0.5222076, -2.042391, -3.486203, 1, 1, 1, 1, 1,
-0.5210432, -0.2107086, -1.596904, 1, 1, 1, 1, 1,
-0.5128614, -0.6334998, -2.227876, 1, 1, 1, 1, 1,
-0.5083293, 0.8074982, -0.6306139, 1, 1, 1, 1, 1,
-0.5045971, 1.625298, -0.8905126, 0, 0, 1, 1, 1,
-0.5044062, -0.574442, -2.19419, 1, 0, 0, 1, 1,
-0.5042618, -0.4155657, -5.028092, 1, 0, 0, 1, 1,
-0.4999781, 1.39159, 1.495791, 1, 0, 0, 1, 1,
-0.4967862, 1.28392, -2.159516, 1, 0, 0, 1, 1,
-0.492946, -0.3870455, -1.039479, 1, 0, 0, 1, 1,
-0.4903119, -0.5642106, -1.602843, 0, 0, 0, 1, 1,
-0.4896397, 0.5553901, -1.076882, 0, 0, 0, 1, 1,
-0.4890147, -0.8129369, -3.175862, 0, 0, 0, 1, 1,
-0.4869528, 1.008891, 1.05108, 0, 0, 0, 1, 1,
-0.4854257, -0.7231385, -2.428321, 0, 0, 0, 1, 1,
-0.4842714, 1.772497, 0.5834171, 0, 0, 0, 1, 1,
-0.4819824, 0.1281829, -1.075491, 0, 0, 0, 1, 1,
-0.4795563, 0.8959054, 0.3882456, 1, 1, 1, 1, 1,
-0.4787029, -0.1658198, -2.091948, 1, 1, 1, 1, 1,
-0.4732217, -1.418597, -3.666411, 1, 1, 1, 1, 1,
-0.4653871, 0.670513, -2.057315, 1, 1, 1, 1, 1,
-0.4590296, 1.976441, -2.45286, 1, 1, 1, 1, 1,
-0.458944, 1.08135, -0.7123266, 1, 1, 1, 1, 1,
-0.4589139, -0.5554717, -2.820925, 1, 1, 1, 1, 1,
-0.4578115, -2.281891, -3.283464, 1, 1, 1, 1, 1,
-0.4567495, 0.7717456, -0.4813327, 1, 1, 1, 1, 1,
-0.4554204, -0.6967295, -2.629561, 1, 1, 1, 1, 1,
-0.4533766, 0.2155477, -2.424097, 1, 1, 1, 1, 1,
-0.4523003, 0.9261202, -0.4195281, 1, 1, 1, 1, 1,
-0.4518819, -1.21721, -3.224495, 1, 1, 1, 1, 1,
-0.4437778, 2.081589, 0.5661289, 1, 1, 1, 1, 1,
-0.4423354, 0.5571038, 1.593933, 1, 1, 1, 1, 1,
-0.441723, 0.8681547, 0.006574632, 0, 0, 1, 1, 1,
-0.4414391, 1.056801, -1.700636, 1, 0, 0, 1, 1,
-0.4354472, 0.3750345, 1.427321, 1, 0, 0, 1, 1,
-0.434667, -0.1750968, -2.383247, 1, 0, 0, 1, 1,
-0.4263737, 0.00858481, -0.8889357, 1, 0, 0, 1, 1,
-0.4235049, 1.159357, 1.186661, 1, 0, 0, 1, 1,
-0.4208167, 0.5928884, -2.0924, 0, 0, 0, 1, 1,
-0.4190784, -1.637517, -1.714975, 0, 0, 0, 1, 1,
-0.4139902, -1.531838, -2.274129, 0, 0, 0, 1, 1,
-0.4102352, -0.1842057, -2.308604, 0, 0, 0, 1, 1,
-0.4090995, 1.110273, 0.7236516, 0, 0, 0, 1, 1,
-0.407657, -0.9958889, -1.478123, 0, 0, 0, 1, 1,
-0.404629, -0.5518563, -2.36546, 0, 0, 0, 1, 1,
-0.4041789, -0.280617, -2.33513, 1, 1, 1, 1, 1,
-0.4037044, -0.8965288, -3.042939, 1, 1, 1, 1, 1,
-0.4024535, -0.236353, -1.740755, 1, 1, 1, 1, 1,
-0.3985809, 0.6590395, 0.0131484, 1, 1, 1, 1, 1,
-0.3981857, 1.216798, -0.2931631, 1, 1, 1, 1, 1,
-0.3927025, 0.7393876, 0.3915394, 1, 1, 1, 1, 1,
-0.3887239, 1.123396, 0.927449, 1, 1, 1, 1, 1,
-0.3847903, 0.3015136, 1.120481, 1, 1, 1, 1, 1,
-0.3831886, 1.479431, 1.187948, 1, 1, 1, 1, 1,
-0.3827758, -2.360512, -2.723118, 1, 1, 1, 1, 1,
-0.3770556, 2.435588, 0.03459891, 1, 1, 1, 1, 1,
-0.3735806, -0.4818088, -1.132712, 1, 1, 1, 1, 1,
-0.3734601, -1.271554, -2.380492, 1, 1, 1, 1, 1,
-0.3729691, -0.6804651, -2.157139, 1, 1, 1, 1, 1,
-0.3697198, -1.131869, -3.584744, 1, 1, 1, 1, 1,
-0.3685001, -0.9635465, -5.577925, 0, 0, 1, 1, 1,
-0.3660088, 0.6192771, 0.6535982, 1, 0, 0, 1, 1,
-0.3657924, 0.2433448, -1.099034, 1, 0, 0, 1, 1,
-0.3619883, -0.4851614, -1.021812, 1, 0, 0, 1, 1,
-0.3593785, -0.300699, -3.133823, 1, 0, 0, 1, 1,
-0.3562266, -0.716318, -0.6130451, 1, 0, 0, 1, 1,
-0.3540498, 0.3585951, 0.3945835, 0, 0, 0, 1, 1,
-0.3504929, 0.1357307, -1.175621, 0, 0, 0, 1, 1,
-0.3436422, 1.32989, -0.3875232, 0, 0, 0, 1, 1,
-0.3432757, 0.4947816, -1.88591, 0, 0, 0, 1, 1,
-0.3424151, 0.3970092, 0.04149561, 0, 0, 0, 1, 1,
-0.3420529, 0.117457, -2.318218, 0, 0, 0, 1, 1,
-0.3392622, -0.009087586, -2.371348, 0, 0, 0, 1, 1,
-0.3389955, -0.1767775, -1.937197, 1, 1, 1, 1, 1,
-0.3372505, -1.66535, -3.965648, 1, 1, 1, 1, 1,
-0.3368947, 0.3964931, 0.1147635, 1, 1, 1, 1, 1,
-0.3358504, 0.2522373, -0.7061568, 1, 1, 1, 1, 1,
-0.3358076, -0.7900232, -4.150789, 1, 1, 1, 1, 1,
-0.3349617, -0.5852459, -3.265264, 1, 1, 1, 1, 1,
-0.3291804, -1.483765, -1.933425, 1, 1, 1, 1, 1,
-0.3289613, 0.3530905, -0.7090273, 1, 1, 1, 1, 1,
-0.3278921, 0.08466541, -0.7661065, 1, 1, 1, 1, 1,
-0.3200763, 0.4541804, -1.366451, 1, 1, 1, 1, 1,
-0.31807, 0.7578447, 0.3386965, 1, 1, 1, 1, 1,
-0.3142809, -0.5565983, -2.844526, 1, 1, 1, 1, 1,
-0.3124263, -0.9822447, -3.289611, 1, 1, 1, 1, 1,
-0.3076292, -0.2968669, -3.52634, 1, 1, 1, 1, 1,
-0.3071366, 0.590613, 0.05510432, 1, 1, 1, 1, 1,
-0.2989946, -0.1581563, -2.926886, 0, 0, 1, 1, 1,
-0.2984107, -0.3100201, -2.314472, 1, 0, 0, 1, 1,
-0.2982639, 0.3423142, -1.655152, 1, 0, 0, 1, 1,
-0.2973073, -0.2109974, -3.107263, 1, 0, 0, 1, 1,
-0.2967362, -0.8571548, -2.402737, 1, 0, 0, 1, 1,
-0.2958347, -1.423568, -4.632917, 1, 0, 0, 1, 1,
-0.2957538, 0.2527564, -0.6707337, 0, 0, 0, 1, 1,
-0.295645, -3.170065, -4.224308, 0, 0, 0, 1, 1,
-0.2946277, 0.9965928, 0.9370053, 0, 0, 0, 1, 1,
-0.2946148, 0.5256538, -1.16573, 0, 0, 0, 1, 1,
-0.2924829, 0.04003728, -1.643377, 0, 0, 0, 1, 1,
-0.292082, -0.1819772, -2.134219, 0, 0, 0, 1, 1,
-0.2865919, 1.569512, -1.968543, 0, 0, 0, 1, 1,
-0.2834563, -0.7869625, -4.051541, 1, 1, 1, 1, 1,
-0.2833574, 0.03003932, -0.7171746, 1, 1, 1, 1, 1,
-0.2825314, 0.5392882, -0.4206338, 1, 1, 1, 1, 1,
-0.2792953, -0.1929386, -0.8985104, 1, 1, 1, 1, 1,
-0.2783922, 1.06555, 0.1394521, 1, 1, 1, 1, 1,
-0.2772141, 0.3855979, 0.1477632, 1, 1, 1, 1, 1,
-0.2754696, 1.345108, -3.981179, 1, 1, 1, 1, 1,
-0.2744903, -0.0825874, -0.0153615, 1, 1, 1, 1, 1,
-0.2742871, -1.783907, -2.188856, 1, 1, 1, 1, 1,
-0.2706833, -0.5482364, -3.724974, 1, 1, 1, 1, 1,
-0.2701721, -0.474653, -3.523079, 1, 1, 1, 1, 1,
-0.2691552, 1.337364, -0.4830486, 1, 1, 1, 1, 1,
-0.2684916, -0.5360211, -4.206381, 1, 1, 1, 1, 1,
-0.2674678, -0.1373283, -2.487758, 1, 1, 1, 1, 1,
-0.2642278, -0.5390198, -1.100427, 1, 1, 1, 1, 1,
-0.2629898, 0.003420211, -2.435078, 0, 0, 1, 1, 1,
-0.2559521, 2.327968, -0.4612468, 1, 0, 0, 1, 1,
-0.250635, -1.041459, -2.350704, 1, 0, 0, 1, 1,
-0.2506077, 0.2365489, -2.785265, 1, 0, 0, 1, 1,
-0.2471913, -0.3673333, -3.017526, 1, 0, 0, 1, 1,
-0.2423126, 0.522674, 0.3810444, 1, 0, 0, 1, 1,
-0.2400725, 2.865573, 1.084505, 0, 0, 0, 1, 1,
-0.2395055, -0.2231207, -2.6457, 0, 0, 0, 1, 1,
-0.2389034, -0.3543076, -3.347898, 0, 0, 0, 1, 1,
-0.2379784, 0.9741655, 1.205491, 0, 0, 0, 1, 1,
-0.2367623, 0.08847087, -2.890396, 0, 0, 0, 1, 1,
-0.2366757, 1.803651, -0.4349676, 0, 0, 0, 1, 1,
-0.2315424, -2.013417, -2.749137, 0, 0, 0, 1, 1,
-0.2213928, 1.303056, -0.8779686, 1, 1, 1, 1, 1,
-0.2182523, 0.3667025, -1.389017, 1, 1, 1, 1, 1,
-0.2139442, -1.105958, -4.267901, 1, 1, 1, 1, 1,
-0.2114469, -0.5714443, -2.578721, 1, 1, 1, 1, 1,
-0.2098092, 0.3781244, -2.296015, 1, 1, 1, 1, 1,
-0.2083467, -1.345317, -3.615694, 1, 1, 1, 1, 1,
-0.2077503, -0.3202375, -4.327466, 1, 1, 1, 1, 1,
-0.2035241, -0.4181108, -3.031095, 1, 1, 1, 1, 1,
-0.2020551, -0.4686402, -1.187806, 1, 1, 1, 1, 1,
-0.2008958, 0.1711656, -2.473978, 1, 1, 1, 1, 1,
-0.1952898, 0.3281992, 1.10411, 1, 1, 1, 1, 1,
-0.1952488, 0.5545051, -2.026829, 1, 1, 1, 1, 1,
-0.1914237, -0.9566399, -2.174689, 1, 1, 1, 1, 1,
-0.1910767, -0.152711, -4.429096, 1, 1, 1, 1, 1,
-0.1878172, 1.343, -0.9643219, 1, 1, 1, 1, 1,
-0.1845687, -0.3072602, -0.07015042, 0, 0, 1, 1, 1,
-0.1837578, 0.7857556, -1.466355, 1, 0, 0, 1, 1,
-0.1828188, -1.529917, -3.265376, 1, 0, 0, 1, 1,
-0.1823064, -1.87732, -3.230065, 1, 0, 0, 1, 1,
-0.1754117, -0.6357886, -4.682969, 1, 0, 0, 1, 1,
-0.1712286, 0.2709338, -1.359955, 1, 0, 0, 1, 1,
-0.1678257, 0.7313154, -0.3457233, 0, 0, 0, 1, 1,
-0.1646184, -0.4358458, -2.508029, 0, 0, 0, 1, 1,
-0.1627869, -0.8206639, -3.139925, 0, 0, 0, 1, 1,
-0.1623082, 1.373206, 0.009443362, 0, 0, 0, 1, 1,
-0.1620581, 1.206913, -2.021836, 0, 0, 0, 1, 1,
-0.1574547, 1.049687, -1.019273, 0, 0, 0, 1, 1,
-0.1569414, 2.218079, -0.8622095, 0, 0, 0, 1, 1,
-0.1558279, -1.469069, -2.868563, 1, 1, 1, 1, 1,
-0.1423029, 0.6458699, -1.457039, 1, 1, 1, 1, 1,
-0.1359072, -0.4538879, -4.428467, 1, 1, 1, 1, 1,
-0.1335585, 1.232246, -0.5244695, 1, 1, 1, 1, 1,
-0.1329335, -2.256107, -4.374597, 1, 1, 1, 1, 1,
-0.1316339, -1.846314, -2.950017, 1, 1, 1, 1, 1,
-0.130671, -0.3357274, -1.85176, 1, 1, 1, 1, 1,
-0.130587, 0.5524213, -1.146612, 1, 1, 1, 1, 1,
-0.1291557, -0.2659353, -3.870816, 1, 1, 1, 1, 1,
-0.124484, 0.5369796, 0.08944162, 1, 1, 1, 1, 1,
-0.1244787, 0.4847878, 0.04579654, 1, 1, 1, 1, 1,
-0.1222778, -0.3205041, -1.704955, 1, 1, 1, 1, 1,
-0.1209234, 0.6411763, 0.4544252, 1, 1, 1, 1, 1,
-0.1201694, 0.4872222, -1.186174, 1, 1, 1, 1, 1,
-0.1165853, -1.414526, -3.327966, 1, 1, 1, 1, 1,
-0.1158516, 1.015115, 0.1788953, 0, 0, 1, 1, 1,
-0.1156157, -0.11581, -2.593181, 1, 0, 0, 1, 1,
-0.1099243, -0.3296701, -1.383249, 1, 0, 0, 1, 1,
-0.1093725, 0.3818041, -0.4238164, 1, 0, 0, 1, 1,
-0.1083986, 0.3082181, 1.04073, 1, 0, 0, 1, 1,
-0.1048803, 0.2589615, -2.487163, 1, 0, 0, 1, 1,
-0.09842964, -0.2169171, -3.148049, 0, 0, 0, 1, 1,
-0.09746572, -0.7491667, -3.318114, 0, 0, 0, 1, 1,
-0.09570722, 0.5220729, 0.7700727, 0, 0, 0, 1, 1,
-0.09404248, -0.4359154, -3.440899, 0, 0, 0, 1, 1,
-0.09097158, 1.872528, 0.3483336, 0, 0, 0, 1, 1,
-0.08965521, 1.221021, 0.5264925, 0, 0, 0, 1, 1,
-0.08875611, -0.811456, -2.02311, 0, 0, 0, 1, 1,
-0.084852, -0.8194848, -3.173161, 1, 1, 1, 1, 1,
-0.08084045, 0.7259645, -0.7072808, 1, 1, 1, 1, 1,
-0.0793087, 0.9639732, -1.066463, 1, 1, 1, 1, 1,
-0.07728709, 2.110868, -1.170605, 1, 1, 1, 1, 1,
-0.07386847, 0.2793919, -1.627871, 1, 1, 1, 1, 1,
-0.07198946, -0.9879357, -3.611998, 1, 1, 1, 1, 1,
-0.06660117, 0.3510287, -1.353907, 1, 1, 1, 1, 1,
-0.06426992, 1.43049, -0.7724957, 1, 1, 1, 1, 1,
-0.05429015, 2.397082, 0.09815753, 1, 1, 1, 1, 1,
-0.05414622, -1.056317, -4.793548, 1, 1, 1, 1, 1,
-0.0471086, -0.4647554, -2.562557, 1, 1, 1, 1, 1,
-0.04657311, 0.5090265, -0.4982192, 1, 1, 1, 1, 1,
-0.04535376, -0.3497405, -4.184302, 1, 1, 1, 1, 1,
-0.04350076, 0.5872743, 1.380322, 1, 1, 1, 1, 1,
-0.04255105, -1.329426, -1.627572, 1, 1, 1, 1, 1,
-0.04194045, 0.5111267, 1.341693, 0, 0, 1, 1, 1,
-0.04132554, 0.4130347, 1.074289, 1, 0, 0, 1, 1,
-0.03969494, -0.1425467, -3.123267, 1, 0, 0, 1, 1,
-0.03905285, -0.161157, -2.769406, 1, 0, 0, 1, 1,
-0.03856575, 0.2119507, 0.4798821, 1, 0, 0, 1, 1,
-0.03755387, 0.1183823, 0.4475138, 1, 0, 0, 1, 1,
-0.03675812, -0.3028796, -2.568358, 0, 0, 0, 1, 1,
-0.03462322, -0.04688214, -1.020009, 0, 0, 0, 1, 1,
-0.03375814, 0.2689755, 1.235482, 0, 0, 0, 1, 1,
-0.03292803, 0.4392992, -0.2229267, 0, 0, 0, 1, 1,
-0.0313694, 0.5579517, 0.740607, 0, 0, 0, 1, 1,
-0.02398815, -0.8192566, -4.00737, 0, 0, 0, 1, 1,
-0.02365148, -0.5949795, -2.652827, 0, 0, 0, 1, 1,
-0.01792062, 0.3297869, -0.3082664, 1, 1, 1, 1, 1,
-0.01753164, 0.1385836, -0.2105405, 1, 1, 1, 1, 1,
-0.01576018, 0.3915732, -1.030116, 1, 1, 1, 1, 1,
-0.01406511, 0.2150801, 1.119613, 1, 1, 1, 1, 1,
-0.004594633, 0.9091731, -0.6558644, 1, 1, 1, 1, 1,
0.000130595, 0.5157486, -0.1500237, 1, 1, 1, 1, 1,
0.001150088, -2.088867, 2.399099, 1, 1, 1, 1, 1,
0.00366383, 0.1389982, 0.6698651, 1, 1, 1, 1, 1,
0.01011466, -0.1457272, 1.882875, 1, 1, 1, 1, 1,
0.01046113, -0.02212524, 3.026953, 1, 1, 1, 1, 1,
0.01280497, 0.4514021, 0.2562865, 1, 1, 1, 1, 1,
0.0174251, -0.762221, 4.193851, 1, 1, 1, 1, 1,
0.01821807, -0.2871886, 4.422593, 1, 1, 1, 1, 1,
0.02266372, -1.069958, 0.8849744, 1, 1, 1, 1, 1,
0.02342659, 1.795653, 0.9767665, 1, 1, 1, 1, 1,
0.02528076, -0.2446439, 4.482458, 0, 0, 1, 1, 1,
0.02601106, -0.7116277, 5.6256, 1, 0, 0, 1, 1,
0.02889191, -0.3500947, 1.402199, 1, 0, 0, 1, 1,
0.02894302, -0.1302794, 3.484668, 1, 0, 0, 1, 1,
0.03260869, -0.1296965, 2.546227, 1, 0, 0, 1, 1,
0.03956631, 0.7792037, -0.5345672, 1, 0, 0, 1, 1,
0.03971718, -1.538437, 2.445065, 0, 0, 0, 1, 1,
0.04099685, 0.01888629, 2.588211, 0, 0, 0, 1, 1,
0.04339631, 0.9148082, -0.9840227, 0, 0, 0, 1, 1,
0.04413606, 2.728405, -1.304698, 0, 0, 0, 1, 1,
0.04729352, -0.6039297, 2.813855, 0, 0, 0, 1, 1,
0.04905339, 0.2622351, -0.1812064, 0, 0, 0, 1, 1,
0.05129619, -2.047234, 2.773394, 0, 0, 0, 1, 1,
0.05393238, -0.6372684, 2.277535, 1, 1, 1, 1, 1,
0.05859922, -0.2965237, 5.23238, 1, 1, 1, 1, 1,
0.06199754, -0.1541451, 3.099334, 1, 1, 1, 1, 1,
0.06539529, -0.5455362, 3.826086, 1, 1, 1, 1, 1,
0.06584641, -0.5448115, 2.919672, 1, 1, 1, 1, 1,
0.06662162, -0.01756706, 0.6456383, 1, 1, 1, 1, 1,
0.06677447, 1.499827, 0.2349725, 1, 1, 1, 1, 1,
0.0674763, -1.12099, 3.681777, 1, 1, 1, 1, 1,
0.06828601, -0.3826281, 3.162083, 1, 1, 1, 1, 1,
0.07000525, 1.06912, -0.9340586, 1, 1, 1, 1, 1,
0.07207993, -0.3469605, 2.000005, 1, 1, 1, 1, 1,
0.07599568, 1.050234, -2.964698, 1, 1, 1, 1, 1,
0.07745191, 0.7768884, -0.003747399, 1, 1, 1, 1, 1,
0.08133291, 0.5621111, 0.6519485, 1, 1, 1, 1, 1,
0.08193653, 0.8039901, -0.6135935, 1, 1, 1, 1, 1,
0.08201955, 0.3096569, 1.217405, 0, 0, 1, 1, 1,
0.08468865, -0.6805607, 2.159178, 1, 0, 0, 1, 1,
0.08624563, -0.6970601, 5.078138, 1, 0, 0, 1, 1,
0.08867235, -0.1669715, 2.383422, 1, 0, 0, 1, 1,
0.09132747, 1.140369, 1.691243, 1, 0, 0, 1, 1,
0.09188288, -0.5878462, 4.321697, 1, 0, 0, 1, 1,
0.09928758, -1.084648, 2.899509, 0, 0, 0, 1, 1,
0.09966648, 0.4942861, 0.3991108, 0, 0, 0, 1, 1,
0.1038645, 0.927334, -1.451356, 0, 0, 0, 1, 1,
0.1061152, -1.162017, 3.298145, 0, 0, 0, 1, 1,
0.1069549, -0.1807835, 4.036573, 0, 0, 0, 1, 1,
0.113537, -0.1353108, 3.400125, 0, 0, 0, 1, 1,
0.115231, -0.7496537, 2.118999, 0, 0, 0, 1, 1,
0.1159792, -0.789939, 3.084785, 1, 1, 1, 1, 1,
0.1179338, 0.8025648, 0.5887104, 1, 1, 1, 1, 1,
0.1215262, 0.1749993, 1.658023, 1, 1, 1, 1, 1,
0.1238606, 0.1789968, 0.8057907, 1, 1, 1, 1, 1,
0.1245589, 0.5426931, 1.811829, 1, 1, 1, 1, 1,
0.1247718, -0.4242138, 1.890598, 1, 1, 1, 1, 1,
0.1256582, 0.4052641, 1.154313, 1, 1, 1, 1, 1,
0.1283042, -1.036913, 4.641259, 1, 1, 1, 1, 1,
0.1284965, -0.7095248, 3.221153, 1, 1, 1, 1, 1,
0.1313213, 0.06624091, 1.886589, 1, 1, 1, 1, 1,
0.1326455, -1.272268, 4.008747, 1, 1, 1, 1, 1,
0.1352646, 0.3713214, 0.580282, 1, 1, 1, 1, 1,
0.136253, -0.1983973, 2.938748, 1, 1, 1, 1, 1,
0.1407714, -0.08112946, 0.5236291, 1, 1, 1, 1, 1,
0.1410786, 0.7947466, 0.2337565, 1, 1, 1, 1, 1,
0.142699, -0.6215309, 1.065101, 0, 0, 1, 1, 1,
0.1429334, -0.1078485, 1.207833, 1, 0, 0, 1, 1,
0.1444299, -1.124475, 3.069521, 1, 0, 0, 1, 1,
0.1450666, -0.4415621, 3.668909, 1, 0, 0, 1, 1,
0.1466814, -0.04732449, 1.786018, 1, 0, 0, 1, 1,
0.1492874, -0.4162259, 2.425367, 1, 0, 0, 1, 1,
0.1514176, -0.6592203, 3.18715, 0, 0, 0, 1, 1,
0.1518415, 0.8183258, -0.2106405, 0, 0, 0, 1, 1,
0.1525079, -0.5884586, 4.303078, 0, 0, 0, 1, 1,
0.1550534, -0.9994164, 3.271703, 0, 0, 0, 1, 1,
0.167191, 0.1183998, -0.4591956, 0, 0, 0, 1, 1,
0.174194, 0.2238395, 1.700202, 0, 0, 0, 1, 1,
0.1837882, -0.6326391, 2.656428, 0, 0, 0, 1, 1,
0.1902123, -0.698263, 2.384908, 1, 1, 1, 1, 1,
0.190263, -1.491535, 3.382235, 1, 1, 1, 1, 1,
0.1927329, -0.4315922, 3.950981, 1, 1, 1, 1, 1,
0.193627, -0.4311064, 0.9458238, 1, 1, 1, 1, 1,
0.1944703, -1.101639, 4.00757, 1, 1, 1, 1, 1,
0.1965859, -1.479281, 3.090439, 1, 1, 1, 1, 1,
0.1973213, 0.9996487, 0.5784134, 1, 1, 1, 1, 1,
0.2016512, -0.02043431, 0.9671282, 1, 1, 1, 1, 1,
0.2020546, 0.1012198, 1.234382, 1, 1, 1, 1, 1,
0.2032412, 0.6821884, -1.009843, 1, 1, 1, 1, 1,
0.212055, -0.9700324, 1.211519, 1, 1, 1, 1, 1,
0.2213324, 0.8483887, -0.1756361, 1, 1, 1, 1, 1,
0.2238142, 1.787458, -0.2342105, 1, 1, 1, 1, 1,
0.225191, -1.374216, 4.314499, 1, 1, 1, 1, 1,
0.2261638, -0.2763765, 1.867342, 1, 1, 1, 1, 1,
0.2286899, 0.1929635, 1.591178, 0, 0, 1, 1, 1,
0.2300943, 0.6002932, 1.594753, 1, 0, 0, 1, 1,
0.2313381, 0.8266329, 0.239206, 1, 0, 0, 1, 1,
0.2338841, 0.4322591, 0.8399081, 1, 0, 0, 1, 1,
0.2365963, -0.6025611, 0.303985, 1, 0, 0, 1, 1,
0.2394618, 1.094661, 1.32769, 1, 0, 0, 1, 1,
0.240123, -0.16515, 2.898244, 0, 0, 0, 1, 1,
0.2443382, -2.155466, 0.624024, 0, 0, 0, 1, 1,
0.2570114, -0.9306347, 3.721795, 0, 0, 0, 1, 1,
0.2610011, 0.2322373, 1.568479, 0, 0, 0, 1, 1,
0.2627309, 0.6903032, -1.345707, 0, 0, 0, 1, 1,
0.2653662, 0.02305313, 1.170896, 0, 0, 0, 1, 1,
0.2657726, -0.3663989, 2.863846, 0, 0, 0, 1, 1,
0.2679928, 0.5128971, 1.73545, 1, 1, 1, 1, 1,
0.2700748, 1.717861, -0.9107834, 1, 1, 1, 1, 1,
0.2715824, 0.6516042, -0.3680939, 1, 1, 1, 1, 1,
0.2759959, -0.7232872, 2.847259, 1, 1, 1, 1, 1,
0.2761134, -0.5027301, 2.707812, 1, 1, 1, 1, 1,
0.2767605, -0.4229836, 1.705047, 1, 1, 1, 1, 1,
0.2828114, 0.7853487, 0.04660946, 1, 1, 1, 1, 1,
0.2842954, 1.196321, 0.7247741, 1, 1, 1, 1, 1,
0.286311, 0.2928757, 0.3984955, 1, 1, 1, 1, 1,
0.2917709, 0.4118527, 0.03946504, 1, 1, 1, 1, 1,
0.2935296, 0.4129132, 0.5795094, 1, 1, 1, 1, 1,
0.3024918, -0.151656, 2.283994, 1, 1, 1, 1, 1,
0.3036587, -0.3219284, 0.7634366, 1, 1, 1, 1, 1,
0.306272, 0.2457271, 1.786626, 1, 1, 1, 1, 1,
0.306797, 0.4601914, -0.1744332, 1, 1, 1, 1, 1,
0.3083205, -0.4766656, 4.257718, 0, 0, 1, 1, 1,
0.315144, 1.157634, -0.07721502, 1, 0, 0, 1, 1,
0.3155742, -0.5149319, 0.5084776, 1, 0, 0, 1, 1,
0.3181978, 1.326882, 0.9142036, 1, 0, 0, 1, 1,
0.319209, 0.9043341, 0.6202273, 1, 0, 0, 1, 1,
0.3213341, 2.069463, 0.9001417, 1, 0, 0, 1, 1,
0.3239559, 0.2698245, 1.799061, 0, 0, 0, 1, 1,
0.3248955, 1.161885, -0.293586, 0, 0, 0, 1, 1,
0.3260833, -1.725723, 3.670074, 0, 0, 0, 1, 1,
0.3270589, 1.062571, 0.7549013, 0, 0, 0, 1, 1,
0.3367966, 1.171329, -1.442799, 0, 0, 0, 1, 1,
0.3395687, 1.043009, 0.7687177, 0, 0, 0, 1, 1,
0.3396688, -1.843836, 4.302919, 0, 0, 0, 1, 1,
0.3430154, -1.749629, 2.524403, 1, 1, 1, 1, 1,
0.3517607, -0.7659518, 2.614856, 1, 1, 1, 1, 1,
0.3530181, -0.3452822, 3.887282, 1, 1, 1, 1, 1,
0.3599202, 1.415925, 0.04532921, 1, 1, 1, 1, 1,
0.3629718, -0.1622313, 1.377076, 1, 1, 1, 1, 1,
0.3652948, 0.6325049, -0.5925729, 1, 1, 1, 1, 1,
0.3660803, -0.3692695, 2.491369, 1, 1, 1, 1, 1,
0.3715957, 0.107282, 3.29295, 1, 1, 1, 1, 1,
0.3724426, -1.155913, 3.004782, 1, 1, 1, 1, 1,
0.3740427, -0.5429196, 2.993341, 1, 1, 1, 1, 1,
0.3770557, 2.093061, 0.04569433, 1, 1, 1, 1, 1,
0.3783911, -0.3668215, -0.1550131, 1, 1, 1, 1, 1,
0.3784882, -2.176799, 3.137953, 1, 1, 1, 1, 1,
0.3799193, -0.4768708, 2.053125, 1, 1, 1, 1, 1,
0.3809429, -0.244343, 0.3936217, 1, 1, 1, 1, 1,
0.3878593, 0.6476012, -1.725789, 0, 0, 1, 1, 1,
0.3906071, 1.650773, 1.875439, 1, 0, 0, 1, 1,
0.3928427, -0.06495647, 2.094935, 1, 0, 0, 1, 1,
0.4028204, -0.4455622, 1.07197, 1, 0, 0, 1, 1,
0.4119408, -0.6264799, 3.565954, 1, 0, 0, 1, 1,
0.4124203, -1.048426, 2.507801, 1, 0, 0, 1, 1,
0.4139086, -1.330594, 2.918028, 0, 0, 0, 1, 1,
0.4168891, -0.1889652, 2.941038, 0, 0, 0, 1, 1,
0.4179713, -0.3629252, 1.006648, 0, 0, 0, 1, 1,
0.4213238, -0.8641679, 1.303881, 0, 0, 0, 1, 1,
0.4215558, -1.159851, 3.693859, 0, 0, 0, 1, 1,
0.4268309, 0.4828606, 0.2924799, 0, 0, 0, 1, 1,
0.4285021, 1.144618, 0.7238068, 0, 0, 0, 1, 1,
0.4358136, -1.313798, 2.155354, 1, 1, 1, 1, 1,
0.4378955, 1.307293, 1.235927, 1, 1, 1, 1, 1,
0.4379515, 1.777154, -0.7960925, 1, 1, 1, 1, 1,
0.4392716, 0.309957, 1.064709, 1, 1, 1, 1, 1,
0.4429836, 0.08267298, 3.638589, 1, 1, 1, 1, 1,
0.4448777, 0.2192903, 1.489522, 1, 1, 1, 1, 1,
0.4458745, 0.6928303, -0.1761905, 1, 1, 1, 1, 1,
0.4462504, 0.2232969, 2.009636, 1, 1, 1, 1, 1,
0.447752, 0.9841671, 0.2458097, 1, 1, 1, 1, 1,
0.4505095, -0.5435295, 2.573517, 1, 1, 1, 1, 1,
0.4580168, 0.6947695, 0.1689779, 1, 1, 1, 1, 1,
0.4601528, 0.9620368, 0.3810767, 1, 1, 1, 1, 1,
0.461447, -1.526129, 2.800245, 1, 1, 1, 1, 1,
0.4640932, 1.277776, 1.072961, 1, 1, 1, 1, 1,
0.4673246, 1.124179, 1.10971, 1, 1, 1, 1, 1,
0.4678824, 0.6960118, 0.5955722, 0, 0, 1, 1, 1,
0.4708903, 1.211039, -0.1840455, 1, 0, 0, 1, 1,
0.4720265, -0.3239783, 2.257462, 1, 0, 0, 1, 1,
0.472855, -0.5397972, 3.581778, 1, 0, 0, 1, 1,
0.476107, 0.6516564, 0.05801876, 1, 0, 0, 1, 1,
0.4791779, -0.5864497, 3.394592, 1, 0, 0, 1, 1,
0.4796758, -1.7977, 3.512041, 0, 0, 0, 1, 1,
0.4906479, 0.03143613, 1.500847, 0, 0, 0, 1, 1,
0.4914023, 0.3928039, 2.150965, 0, 0, 0, 1, 1,
0.4917149, 1.164773, -1.974956, 0, 0, 0, 1, 1,
0.4928779, 0.2393595, 0.7412412, 0, 0, 0, 1, 1,
0.4953174, 0.07242712, 1.227939, 0, 0, 0, 1, 1,
0.5013385, 0.1467369, 1.877707, 0, 0, 0, 1, 1,
0.5016177, 0.136867, 2.278838, 1, 1, 1, 1, 1,
0.5033475, 1.638873, -1.623805, 1, 1, 1, 1, 1,
0.5073327, -0.5132738, 3.261945, 1, 1, 1, 1, 1,
0.5074776, 0.01735873, 1.305148, 1, 1, 1, 1, 1,
0.5107016, -0.1270049, 1.906391, 1, 1, 1, 1, 1,
0.5124471, -0.3512245, 1.960295, 1, 1, 1, 1, 1,
0.513644, -2.188616, 4.765323, 1, 1, 1, 1, 1,
0.520405, -1.053998, 3.285244, 1, 1, 1, 1, 1,
0.522733, 0.3174848, 1.043158, 1, 1, 1, 1, 1,
0.5230972, -0.9592143, 1.326642, 1, 1, 1, 1, 1,
0.5241734, -0.8261645, 2.273763, 1, 1, 1, 1, 1,
0.526323, -0.7779896, 2.827565, 1, 1, 1, 1, 1,
0.5295604, -0.5397672, 3.38202, 1, 1, 1, 1, 1,
0.5333471, -0.01999128, 0.7788941, 1, 1, 1, 1, 1,
0.5376883, 0.4961236, -1.297924, 1, 1, 1, 1, 1,
0.5403711, 0.759217, 0.6722104, 0, 0, 1, 1, 1,
0.5407308, 0.3141575, 1.073021, 1, 0, 0, 1, 1,
0.5437214, 0.3896369, 0.9982151, 1, 0, 0, 1, 1,
0.5450607, 0.9493553, 2.419774, 1, 0, 0, 1, 1,
0.545149, -0.9355102, 1.262164, 1, 0, 0, 1, 1,
0.5466562, -0.5820591, 1.543519, 1, 0, 0, 1, 1,
0.5487286, 0.2399969, 3.492261, 0, 0, 0, 1, 1,
0.5527337, -0.1531701, 0.8723608, 0, 0, 0, 1, 1,
0.556304, 0.9922799, -0.2677671, 0, 0, 0, 1, 1,
0.5566255, 0.6553977, 0.5318489, 0, 0, 0, 1, 1,
0.5574155, 1.165479, -0.5313206, 0, 0, 0, 1, 1,
0.56177, -1.22652, 3.857509, 0, 0, 0, 1, 1,
0.564189, -0.0009853834, 1.704791, 0, 0, 0, 1, 1,
0.565528, -1.109907, 3.031151, 1, 1, 1, 1, 1,
0.5688887, -0.1614386, 2.602857, 1, 1, 1, 1, 1,
0.5704065, -0.004799747, 2.348912, 1, 1, 1, 1, 1,
0.5704623, -1.707488, 3.866709, 1, 1, 1, 1, 1,
0.5720975, 0.1285061, 2.006148, 1, 1, 1, 1, 1,
0.5724994, 1.048335, 0.2687725, 1, 1, 1, 1, 1,
0.5800298, -0.2547328, 2.426255, 1, 1, 1, 1, 1,
0.5821074, 1.274197, -0.8899597, 1, 1, 1, 1, 1,
0.5840588, -0.07405135, 2.312772, 1, 1, 1, 1, 1,
0.5884629, 0.2887545, 2.056621, 1, 1, 1, 1, 1,
0.5916708, 0.4357378, 1.482019, 1, 1, 1, 1, 1,
0.6012215, 0.9681283, -0.7843758, 1, 1, 1, 1, 1,
0.602999, 0.9600163, 2.186193, 1, 1, 1, 1, 1,
0.6089762, -0.7870919, 1.817572, 1, 1, 1, 1, 1,
0.6112541, -0.5315343, 1.239862, 1, 1, 1, 1, 1,
0.6155604, -0.2119609, 3.770599, 0, 0, 1, 1, 1,
0.6170034, 0.7754831, 2.093018, 1, 0, 0, 1, 1,
0.6176731, 0.1903235, 1.611836, 1, 0, 0, 1, 1,
0.6223883, 0.6259317, -0.3468431, 1, 0, 0, 1, 1,
0.6243094, -0.895452, 2.575895, 1, 0, 0, 1, 1,
0.6290603, -0.160263, -0.0597337, 1, 0, 0, 1, 1,
0.6297498, -0.6914849, 4.588512, 0, 0, 0, 1, 1,
0.6303095, -1.514374, 1.706847, 0, 0, 0, 1, 1,
0.633181, 0.2163511, 2.336411, 0, 0, 0, 1, 1,
0.6416739, -0.1997662, -0.4901451, 0, 0, 0, 1, 1,
0.6496412, 1.458963, -0.7099786, 0, 0, 0, 1, 1,
0.6511585, -0.8498972, 3.169216, 0, 0, 0, 1, 1,
0.6597056, 0.1068461, -0.2412792, 0, 0, 0, 1, 1,
0.6597749, 0.1282882, 0.5132, 1, 1, 1, 1, 1,
0.6612175, -0.2440945, -0.2234811, 1, 1, 1, 1, 1,
0.6633415, 0.1433454, 0.7474882, 1, 1, 1, 1, 1,
0.6635627, -0.1685559, 2.579739, 1, 1, 1, 1, 1,
0.6663221, 1.191235, 0.2009949, 1, 1, 1, 1, 1,
0.6677412, 0.1892386, 1.776358, 1, 1, 1, 1, 1,
0.6769352, 0.7708055, 0.7998295, 1, 1, 1, 1, 1,
0.6769413, -1.739326, 0.998578, 1, 1, 1, 1, 1,
0.6818256, -1.903934, 2.079535, 1, 1, 1, 1, 1,
0.6829571, -0.4162723, 3.036661, 1, 1, 1, 1, 1,
0.6905208, -0.2207281, 1.901708, 1, 1, 1, 1, 1,
0.6971447, 0.9805985, 1.370116, 1, 1, 1, 1, 1,
0.7057238, -0.6828375, 3.879019, 1, 1, 1, 1, 1,
0.7127332, 0.3261448, 2.266279, 1, 1, 1, 1, 1,
0.7244638, 0.4242071, 0.8312284, 1, 1, 1, 1, 1,
0.726724, -2.269381, 2.83758, 0, 0, 1, 1, 1,
0.728351, -0.7117052, 2.540974, 1, 0, 0, 1, 1,
0.7385756, -2.084369, 4.167418, 1, 0, 0, 1, 1,
0.7398648, 2.113385, -0.9363657, 1, 0, 0, 1, 1,
0.7459767, -1.377697, 4.114214, 1, 0, 0, 1, 1,
0.747822, -0.002473832, 0.05448475, 1, 0, 0, 1, 1,
0.7516397, 0.00670437, 2.074981, 0, 0, 0, 1, 1,
0.7581204, -0.5845171, 1.318874, 0, 0, 0, 1, 1,
0.7630025, 0.1890297, 2.287291, 0, 0, 0, 1, 1,
0.764156, 1.737391, 2.008438, 0, 0, 0, 1, 1,
0.7655495, 1.367296, 1.125586, 0, 0, 0, 1, 1,
0.7664986, -0.0006611458, 1.002099, 0, 0, 0, 1, 1,
0.7722473, -1.013182, 2.657178, 0, 0, 0, 1, 1,
0.7753736, -0.5113018, 3.390305, 1, 1, 1, 1, 1,
0.7799104, 1.819438, 0.8175459, 1, 1, 1, 1, 1,
0.7830998, 0.8805223, 1.316028, 1, 1, 1, 1, 1,
0.797612, -0.364639, 0.6342552, 1, 1, 1, 1, 1,
0.7980617, 0.4690321, 1.355887, 1, 1, 1, 1, 1,
0.8055611, -0.842915, 1.782321, 1, 1, 1, 1, 1,
0.8070168, 0.4896895, 0.09914175, 1, 1, 1, 1, 1,
0.8070855, -0.6568577, 5.41411, 1, 1, 1, 1, 1,
0.8073198, 0.5169424, 0.1089402, 1, 1, 1, 1, 1,
0.8073969, -0.3483075, 0.3909166, 1, 1, 1, 1, 1,
0.811272, 0.6897594, 0.2889031, 1, 1, 1, 1, 1,
0.813926, 1.513963, -0.4064713, 1, 1, 1, 1, 1,
0.814655, 0.6974849, 0.9396974, 1, 1, 1, 1, 1,
0.8162612, -0.1079805, 2.031672, 1, 1, 1, 1, 1,
0.819315, -3.154477, 2.273489, 1, 1, 1, 1, 1,
0.8198826, 1.377412, 0.0914313, 0, 0, 1, 1, 1,
0.8211602, 1.267566, 0.08682984, 1, 0, 0, 1, 1,
0.8328201, -1.21252, 2.469512, 1, 0, 0, 1, 1,
0.8376055, -0.7159386, 0.8751099, 1, 0, 0, 1, 1,
0.8413324, 1.077155, 1.050102, 1, 0, 0, 1, 1,
0.8441914, -1.254714, 2.943738, 1, 0, 0, 1, 1,
0.8450128, -1.67127, 3.496511, 0, 0, 0, 1, 1,
0.8457228, -0.9771871, 0.5315539, 0, 0, 0, 1, 1,
0.8509483, 0.8650262, -0.3087548, 0, 0, 0, 1, 1,
0.8511021, -0.5370762, 2.265628, 0, 0, 0, 1, 1,
0.8531484, -1.387252, 2.294413, 0, 0, 0, 1, 1,
0.8639916, -2.40261, 2.371745, 0, 0, 0, 1, 1,
0.8701524, 0.6191837, 1.652404, 0, 0, 0, 1, 1,
0.8760545, 0.2819043, 0.36665, 1, 1, 1, 1, 1,
0.879495, -0.7923081, 1.211179, 1, 1, 1, 1, 1,
0.8815447, 0.09903865, 1.882753, 1, 1, 1, 1, 1,
0.8858356, -1.500176, 1.816675, 1, 1, 1, 1, 1,
0.8862361, -1.393544, 1.109977, 1, 1, 1, 1, 1,
0.8923346, -0.1292365, 0.6559127, 1, 1, 1, 1, 1,
0.8982704, 0.8708259, -0.3180737, 1, 1, 1, 1, 1,
0.9062544, 0.7199157, 0.3709665, 1, 1, 1, 1, 1,
0.9100018, -0.803364, 1.915994, 1, 1, 1, 1, 1,
0.9230286, 0.7112238, 1.606953, 1, 1, 1, 1, 1,
0.9348423, 0.9643512, -0.6365773, 1, 1, 1, 1, 1,
0.9352341, 0.7797999, 0.2113284, 1, 1, 1, 1, 1,
0.9369083, -1.274169, 2.947589, 1, 1, 1, 1, 1,
0.9393323, 0.7225368, 1.686889, 1, 1, 1, 1, 1,
0.9454125, 1.865148, 1.568241, 1, 1, 1, 1, 1,
0.9487975, 0.7042111, 0.5091785, 0, 0, 1, 1, 1,
0.9509727, -0.1347034, 1.892604, 1, 0, 0, 1, 1,
0.9572729, -0.127644, 0.8832759, 1, 0, 0, 1, 1,
0.9583763, 1.268241, 0.5274363, 1, 0, 0, 1, 1,
0.9646075, -1.759766, 2.763757, 1, 0, 0, 1, 1,
0.974904, -3.034501, 4.360481, 1, 0, 0, 1, 1,
0.9758599, 0.369833, 3.092072, 0, 0, 0, 1, 1,
0.9765948, 0.3631481, 2.388539, 0, 0, 0, 1, 1,
0.9932105, 0.004084683, 0.2201536, 0, 0, 0, 1, 1,
0.9932371, 0.1863062, 2.101364, 0, 0, 0, 1, 1,
0.9941827, -2.132643, 2.706677, 0, 0, 0, 1, 1,
0.9986119, -0.04641223, 2.447935, 0, 0, 0, 1, 1,
1.002201, 0.3744132, 1.616658, 0, 0, 0, 1, 1,
1.00881, -0.2504288, 3.073295, 1, 1, 1, 1, 1,
1.014079, -1.177126, 1.447077, 1, 1, 1, 1, 1,
1.017243, 2.124313, 1.377607, 1, 1, 1, 1, 1,
1.026093, 0.8520521, 0.9080631, 1, 1, 1, 1, 1,
1.028088, -1.569441, 3.477641, 1, 1, 1, 1, 1,
1.029276, 0.2621132, 1.292211, 1, 1, 1, 1, 1,
1.029436, 0.7461329, 0.3742433, 1, 1, 1, 1, 1,
1.029894, -0.4361039, 2.65444, 1, 1, 1, 1, 1,
1.036678, 0.8290096, 0.5555785, 1, 1, 1, 1, 1,
1.049123, 3.300344, 2.115463, 1, 1, 1, 1, 1,
1.051027, -0.395388, 1.717498, 1, 1, 1, 1, 1,
1.052358, -0.7266977, 2.462145, 1, 1, 1, 1, 1,
1.058223, -1.4073, 1.636675, 1, 1, 1, 1, 1,
1.059535, 0.2299975, 0.7815547, 1, 1, 1, 1, 1,
1.066257, 0.7571798, -0.06783122, 1, 1, 1, 1, 1,
1.067051, -0.04095989, 1.125025, 0, 0, 1, 1, 1,
1.07023, -0.5256084, 1.012885, 1, 0, 0, 1, 1,
1.072953, -1.019897, 1.309901, 1, 0, 0, 1, 1,
1.074783, -0.2550635, 3.112135, 1, 0, 0, 1, 1,
1.084486, -0.1619285, 2.010732, 1, 0, 0, 1, 1,
1.088181, 0.03795776, 1.422479, 1, 0, 0, 1, 1,
1.104528, -0.4557838, 1.886051, 0, 0, 0, 1, 1,
1.113367, -0.05016422, 1.09026, 0, 0, 0, 1, 1,
1.113955, 0.5512153, -0.9372886, 0, 0, 0, 1, 1,
1.117196, -0.6829244, 2.03051, 0, 0, 0, 1, 1,
1.129266, -0.4973029, 1.845582, 0, 0, 0, 1, 1,
1.131309, 0.2008694, 0.2393086, 0, 0, 0, 1, 1,
1.131963, -1.217768, 2.426001, 0, 0, 0, 1, 1,
1.146832, -0.2509965, 1.574266, 1, 1, 1, 1, 1,
1.147899, 0.1265895, 2.484014, 1, 1, 1, 1, 1,
1.15257, -0.03232996, 3.058067, 1, 1, 1, 1, 1,
1.157054, 1.023579, -0.01230887, 1, 1, 1, 1, 1,
1.161954, -0.7410428, 2.754244, 1, 1, 1, 1, 1,
1.168581, -0.6578655, 1.815732, 1, 1, 1, 1, 1,
1.178913, 1.154072, 1.791588, 1, 1, 1, 1, 1,
1.179733, -0.5936668, 2.400955, 1, 1, 1, 1, 1,
1.18829, 1.204969, 0.3402645, 1, 1, 1, 1, 1,
1.193096, -1.485234, 4.419018, 1, 1, 1, 1, 1,
1.198595, -1.140566, 0.9951664, 1, 1, 1, 1, 1,
1.208129, 1.491799, 2.356803, 1, 1, 1, 1, 1,
1.209168, -1.599278, 1.882918, 1, 1, 1, 1, 1,
1.211933, -0.8713419, 2.835113, 1, 1, 1, 1, 1,
1.212327, 0.02068296, 2.591101, 1, 1, 1, 1, 1,
1.22105, -0.8838856, 3.31643, 0, 0, 1, 1, 1,
1.22826, 0.1819668, 0.4144093, 1, 0, 0, 1, 1,
1.240086, -0.1016362, 2.400624, 1, 0, 0, 1, 1,
1.244322, 1.857791, -1.463335, 1, 0, 0, 1, 1,
1.245704, 0.294872, 2.458965, 1, 0, 0, 1, 1,
1.259536, 1.037077, 2.292901, 1, 0, 0, 1, 1,
1.267136, 0.7619807, 0.1055302, 0, 0, 0, 1, 1,
1.279849, -0.9975818, 0.5610564, 0, 0, 0, 1, 1,
1.282814, 0.8562219, 0.7812219, 0, 0, 0, 1, 1,
1.294223, 1.012746, 0.6043695, 0, 0, 0, 1, 1,
1.294945, -0.001780045, 0.6520216, 0, 0, 0, 1, 1,
1.295842, 1.38852, 1.532369, 0, 0, 0, 1, 1,
1.297942, 0.3398058, 2.72081, 0, 0, 0, 1, 1,
1.306045, -0.1547847, 2.512797, 1, 1, 1, 1, 1,
1.306882, 0.7540101, 0.6873271, 1, 1, 1, 1, 1,
1.31131, -2.393897, 5.020828, 1, 1, 1, 1, 1,
1.328545, -0.4040092, 1.931072, 1, 1, 1, 1, 1,
1.330564, 0.6332722, -0.1536675, 1, 1, 1, 1, 1,
1.333653, -0.4710761, 1.704154, 1, 1, 1, 1, 1,
1.334455, 1.172902, 0.7058631, 1, 1, 1, 1, 1,
1.346453, -0.4085029, 1.258482, 1, 1, 1, 1, 1,
1.35338, -0.9760091, 3.026974, 1, 1, 1, 1, 1,
1.361861, 0.2310384, 1.072446, 1, 1, 1, 1, 1,
1.365321, 1.487147, 0.7704814, 1, 1, 1, 1, 1,
1.367465, 0.7978254, 1.060189, 1, 1, 1, 1, 1,
1.391202, -2.388265, 3.662535, 1, 1, 1, 1, 1,
1.395173, -0.00244784, 1.219932, 1, 1, 1, 1, 1,
1.402425, -1.154662, 2.984731, 1, 1, 1, 1, 1,
1.40483, -1.438605, 0.9393558, 0, 0, 1, 1, 1,
1.417787, 0.6221017, 0.9905224, 1, 0, 0, 1, 1,
1.420429, 1.143152, 0.7443249, 1, 0, 0, 1, 1,
1.424163, -0.1843012, 0.1524793, 1, 0, 0, 1, 1,
1.425409, -0.1421059, 2.211887, 1, 0, 0, 1, 1,
1.429042, -0.8968892, 1.90697, 1, 0, 0, 1, 1,
1.430806, 0.7835347, 0.8460917, 0, 0, 0, 1, 1,
1.440597, 1.785765, 0.9808777, 0, 0, 0, 1, 1,
1.440883, 0.4928214, 2.385879, 0, 0, 0, 1, 1,
1.446181, -0.5653756, 0.9355257, 0, 0, 0, 1, 1,
1.447079, -0.3228035, 0.6000135, 0, 0, 0, 1, 1,
1.463953, 0.3905466, 1.574484, 0, 0, 0, 1, 1,
1.464742, 0.6763679, 1.822664, 0, 0, 0, 1, 1,
1.474853, -0.0002678936, 2.975343, 1, 1, 1, 1, 1,
1.488573, -0.6310992, 4.490564, 1, 1, 1, 1, 1,
1.489365, 0.9961846, 2.894447, 1, 1, 1, 1, 1,
1.495746, -0.6338755, 2.629784, 1, 1, 1, 1, 1,
1.502088, -1.421645, 1.026244, 1, 1, 1, 1, 1,
1.551066, -0.1128371, 0.7960915, 1, 1, 1, 1, 1,
1.552189, -0.2660431, 1.515579, 1, 1, 1, 1, 1,
1.599097, 0.8005089, 2.132569, 1, 1, 1, 1, 1,
1.637048, -0.2538716, 3.545715, 1, 1, 1, 1, 1,
1.641879, 1.042731, -0.07416794, 1, 1, 1, 1, 1,
1.656666, -0.3695578, 2.286122, 1, 1, 1, 1, 1,
1.66336, -1.289504, 2.535126, 1, 1, 1, 1, 1,
1.676104, -0.5873277, 2.941375, 1, 1, 1, 1, 1,
1.678751, 0.08636464, 2.088397, 1, 1, 1, 1, 1,
1.678871, 0.06377622, 1.698763, 1, 1, 1, 1, 1,
1.681358, -1.251177, 1.519669, 0, 0, 1, 1, 1,
1.693394, 0.5796585, 1.878661, 1, 0, 0, 1, 1,
1.693509, -0.4689683, 0.7760445, 1, 0, 0, 1, 1,
1.695102, 0.4714752, 0.8796034, 1, 0, 0, 1, 1,
1.696734, 0.2507018, 1.300552, 1, 0, 0, 1, 1,
1.699152, 0.1553206, 1.265802, 1, 0, 0, 1, 1,
1.700616, -0.02039827, 3.012311, 0, 0, 0, 1, 1,
1.721826, 1.850003, -0.2547002, 0, 0, 0, 1, 1,
1.725293, -1.192995, 3.111223, 0, 0, 0, 1, 1,
1.737214, 0.06300899, 0.9970812, 0, 0, 0, 1, 1,
1.738309, 1.133939, 1.85804, 0, 0, 0, 1, 1,
1.780257, 0.0220413, 1.860058, 0, 0, 0, 1, 1,
1.805134, -1.427526, 2.453093, 0, 0, 0, 1, 1,
1.806691, -1.029299, 2.144383, 1, 1, 1, 1, 1,
1.809432, 0.6372513, 0.2504092, 1, 1, 1, 1, 1,
1.812654, 0.1817885, 0.6383955, 1, 1, 1, 1, 1,
1.816985, 0.6703846, 0.7492208, 1, 1, 1, 1, 1,
1.821664, 1.482722, -0.773846, 1, 1, 1, 1, 1,
1.869578, -0.08519907, 1.6039, 1, 1, 1, 1, 1,
1.873651, -0.7809448, 2.937204, 1, 1, 1, 1, 1,
1.876024, -0.6486683, 0.745222, 1, 1, 1, 1, 1,
1.87873, -0.4328527, 2.069597, 1, 1, 1, 1, 1,
1.922531, -0.8273187, 1.97748, 1, 1, 1, 1, 1,
1.924333, 1.165685, 1.540179, 1, 1, 1, 1, 1,
1.934807, 0.2281483, 2.212722, 1, 1, 1, 1, 1,
1.966825, 1.040256, 1.169885, 1, 1, 1, 1, 1,
1.967841, 1.294985, -0.1235533, 1, 1, 1, 1, 1,
1.980618, 0.2520583, 2.582358, 1, 1, 1, 1, 1,
1.981026, 1.235172, 1.202513, 0, 0, 1, 1, 1,
2.004849, -0.844991, 2.770023, 1, 0, 0, 1, 1,
2.05915, 0.07928003, 1.421957, 1, 0, 0, 1, 1,
2.132096, 0.04154736, 2.073376, 1, 0, 0, 1, 1,
2.133986, -0.3475722, -0.08349673, 1, 0, 0, 1, 1,
2.141293, -1.390811, 3.143908, 1, 0, 0, 1, 1,
2.144575, 1.504645, 0.6372393, 0, 0, 0, 1, 1,
2.169946, -0.02088257, 0.458545, 0, 0, 0, 1, 1,
2.310669, -0.9291452, 4.101887, 0, 0, 0, 1, 1,
2.322883, 1.733403, 0.1593765, 0, 0, 0, 1, 1,
2.334333, -0.2724812, 1.426911, 0, 0, 0, 1, 1,
2.351646, -1.169268, 2.513016, 0, 0, 0, 1, 1,
2.428554, 0.2358498, 2.627786, 0, 0, 0, 1, 1,
2.436755, -1.665028, 1.654, 1, 1, 1, 1, 1,
2.445191, 0.7663473, 0.7248384, 1, 1, 1, 1, 1,
2.482172, -1.714378, -0.06927941, 1, 1, 1, 1, 1,
2.527049, -0.4197784, 2.345145, 1, 1, 1, 1, 1,
2.823889, -0.07504871, 3.60231, 1, 1, 1, 1, 1,
3.933213, 1.68218, 2.000112, 1, 1, 1, 1, 1,
4.047114, -1.380168, 2.08883, 1, 1, 1, 1, 1
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
var radius = 10.12335;
var distance = 35.55785;
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
mvMatrix.translate( -0.232981, -0.06513977, -0.02383757 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.55785);
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