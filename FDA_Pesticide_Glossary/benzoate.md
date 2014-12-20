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
-2.915181, -0.5173862, -1.098947, 1, 0, 0, 1,
-2.70617, 0.5375566, -0.5463817, 1, 0.007843138, 0, 1,
-2.701937, 0.7360289, -1.277358, 1, 0.01176471, 0, 1,
-2.583776, -1.02174, -0.7687289, 1, 0.01960784, 0, 1,
-2.479195, 1.304329, -1.20364, 1, 0.02352941, 0, 1,
-2.446231, 0.01495169, -1.258165, 1, 0.03137255, 0, 1,
-2.420252, -0.2676074, -2.093554, 1, 0.03529412, 0, 1,
-2.322197, 0.7285324, -0.5381501, 1, 0.04313726, 0, 1,
-2.319111, -1.040927, -3.409327, 1, 0.04705882, 0, 1,
-2.299247, 2.088362, -1.003044, 1, 0.05490196, 0, 1,
-2.283146, -0.861269, -3.588247, 1, 0.05882353, 0, 1,
-2.282521, 1.911765, -2.278088, 1, 0.06666667, 0, 1,
-2.26058, -0.3328628, -1.944761, 1, 0.07058824, 0, 1,
-2.25562, -1.042454, -0.9029105, 1, 0.07843138, 0, 1,
-2.219651, 0.06366683, -1.606139, 1, 0.08235294, 0, 1,
-2.198258, -1.297588, -2.820931, 1, 0.09019608, 0, 1,
-2.193604, -1.72181, -1.110691, 1, 0.09411765, 0, 1,
-2.141276, 0.6704547, -0.2370207, 1, 0.1019608, 0, 1,
-2.049237, 2.104077, 0.40401, 1, 0.1098039, 0, 1,
-2.012502, -1.160454, -1.907636, 1, 0.1137255, 0, 1,
-2.003577, -2.583894, -1.676354, 1, 0.1215686, 0, 1,
-2.003027, -0.3546517, -3.033549, 1, 0.1254902, 0, 1,
-2.001507, 0.8575051, -2.069762, 1, 0.1333333, 0, 1,
-1.986521, 1.169031, -0.1103153, 1, 0.1372549, 0, 1,
-1.978595, 2.178771, -1.69273, 1, 0.145098, 0, 1,
-1.97783, 1.98655, -2.049612, 1, 0.1490196, 0, 1,
-1.951851, 0.5090637, -0.776808, 1, 0.1568628, 0, 1,
-1.923892, -0.04190001, -1.995427, 1, 0.1607843, 0, 1,
-1.89807, 1.281353, 0.2521518, 1, 0.1686275, 0, 1,
-1.879732, -0.9223086, -0.1232649, 1, 0.172549, 0, 1,
-1.867561, 1.047109, -0.7810057, 1, 0.1803922, 0, 1,
-1.864341, -0.06446113, -2.129868, 1, 0.1843137, 0, 1,
-1.85973, -0.2045067, -1.501874, 1, 0.1921569, 0, 1,
-1.851793, -1.509471, -1.384976, 1, 0.1960784, 0, 1,
-1.850066, 1.221669, -0.1570058, 1, 0.2039216, 0, 1,
-1.837418, -1.532527, -1.075095, 1, 0.2117647, 0, 1,
-1.807449, -0.9065393, 0.07373667, 1, 0.2156863, 0, 1,
-1.794506, -0.2905018, -1.83325, 1, 0.2235294, 0, 1,
-1.794253, 0.08507702, -2.728018, 1, 0.227451, 0, 1,
-1.793795, -0.5262714, -2.279516, 1, 0.2352941, 0, 1,
-1.782898, 0.3112787, -3.184113, 1, 0.2392157, 0, 1,
-1.780537, -0.1129832, -3.973807, 1, 0.2470588, 0, 1,
-1.757353, -1.022383, -1.568581, 1, 0.2509804, 0, 1,
-1.747404, 1.623157, -1.843505, 1, 0.2588235, 0, 1,
-1.737455, 0.5231345, -1.250148, 1, 0.2627451, 0, 1,
-1.712222, 0.8216507, -1.540909, 1, 0.2705882, 0, 1,
-1.702361, 0.6063573, -1.724379, 1, 0.2745098, 0, 1,
-1.693676, 1.648624, -1.981955, 1, 0.282353, 0, 1,
-1.683453, -0.2217952, -1.259564, 1, 0.2862745, 0, 1,
-1.674943, -0.08076689, -2.358252, 1, 0.2941177, 0, 1,
-1.673688, -1.939935, -2.061075, 1, 0.3019608, 0, 1,
-1.607917, -1.083323, -1.184886, 1, 0.3058824, 0, 1,
-1.606389, -0.7816549, -3.3473, 1, 0.3137255, 0, 1,
-1.605531, 0.8197671, -2.495536, 1, 0.3176471, 0, 1,
-1.596607, 0.5594504, 0.1980492, 1, 0.3254902, 0, 1,
-1.591, -0.6873986, -0.4777736, 1, 0.3294118, 0, 1,
-1.568934, 0.115376, -2.311732, 1, 0.3372549, 0, 1,
-1.549859, 0.4100283, -0.5875072, 1, 0.3411765, 0, 1,
-1.548556, -0.3075549, -1.551103, 1, 0.3490196, 0, 1,
-1.522842, -0.9738547, -3.550938, 1, 0.3529412, 0, 1,
-1.518785, 1.364797, 0.5592218, 1, 0.3607843, 0, 1,
-1.517355, 1.284993, -0.6783643, 1, 0.3647059, 0, 1,
-1.509642, 1.342015, 1.551649, 1, 0.372549, 0, 1,
-1.503718, 0.8258704, 0.8623342, 1, 0.3764706, 0, 1,
-1.492973, -1.050941, -2.427771, 1, 0.3843137, 0, 1,
-1.457224, -1.186347, -1.302883, 1, 0.3882353, 0, 1,
-1.42863, 0.4206376, -1.144261, 1, 0.3960784, 0, 1,
-1.428397, -1.255577, -3.661966, 1, 0.4039216, 0, 1,
-1.422788, 1.636533, -2.274408, 1, 0.4078431, 0, 1,
-1.420258, 0.6180728, -1.517089, 1, 0.4156863, 0, 1,
-1.418827, 0.4672045, -1.344538, 1, 0.4196078, 0, 1,
-1.403926, -0.5534601, -1.091583, 1, 0.427451, 0, 1,
-1.400633, 0.5721646, -0.3900527, 1, 0.4313726, 0, 1,
-1.386141, 0.0004179268, -2.062605, 1, 0.4392157, 0, 1,
-1.382589, 0.9174603, -1.335895, 1, 0.4431373, 0, 1,
-1.366975, -0.9284109, -2.709935, 1, 0.4509804, 0, 1,
-1.36594, -1.713291, -2.101749, 1, 0.454902, 0, 1,
-1.35691, -0.1131771, -1.228919, 1, 0.4627451, 0, 1,
-1.351149, -0.3149673, -1.582134, 1, 0.4666667, 0, 1,
-1.350122, 0.2164757, -1.803706, 1, 0.4745098, 0, 1,
-1.338307, 1.02613, -1.180712, 1, 0.4784314, 0, 1,
-1.332163, 0.85872, -2.628664, 1, 0.4862745, 0, 1,
-1.326268, -2.244275, -2.442991, 1, 0.4901961, 0, 1,
-1.317259, 1.16721, 0.3985082, 1, 0.4980392, 0, 1,
-1.309491, -0.8154889, -1.438577, 1, 0.5058824, 0, 1,
-1.302119, -0.6813688, -2.807802, 1, 0.509804, 0, 1,
-1.291348, 0.3135918, -0.9822417, 1, 0.5176471, 0, 1,
-1.290075, 1.000076, -3.768374, 1, 0.5215687, 0, 1,
-1.289402, -0.6776575, -2.502926, 1, 0.5294118, 0, 1,
-1.2832, -0.3291893, -2.12255, 1, 0.5333334, 0, 1,
-1.276477, -0.3897793, -2.684164, 1, 0.5411765, 0, 1,
-1.268573, 0.03426545, -2.549886, 1, 0.5450981, 0, 1,
-1.257204, 0.07123962, -0.7470745, 1, 0.5529412, 0, 1,
-1.25323, 0.3793428, 0.03290897, 1, 0.5568628, 0, 1,
-1.252966, -0.78519, -1.253311, 1, 0.5647059, 0, 1,
-1.24121, 0.3189704, -0.2939838, 1, 0.5686275, 0, 1,
-1.237916, 1.787023, 0.04838315, 1, 0.5764706, 0, 1,
-1.234047, 0.863273, 2.464928, 1, 0.5803922, 0, 1,
-1.216819, 0.08819929, -0.9423763, 1, 0.5882353, 0, 1,
-1.212929, -0.3153546, -1.175378, 1, 0.5921569, 0, 1,
-1.195369, -1.270767, -2.927822, 1, 0.6, 0, 1,
-1.188835, -1.23732, -1.959279, 1, 0.6078432, 0, 1,
-1.184222, -0.9598225, -1.906924, 1, 0.6117647, 0, 1,
-1.180742, 1.044074, -2.854187, 1, 0.6196079, 0, 1,
-1.174878, 0.6502016, 0.2207828, 1, 0.6235294, 0, 1,
-1.165358, -0.4944342, -2.350402, 1, 0.6313726, 0, 1,
-1.149477, -1.070162, -2.621939, 1, 0.6352941, 0, 1,
-1.144964, -0.1795838, 0.1277019, 1, 0.6431373, 0, 1,
-1.142967, 1.038307, -0.05085153, 1, 0.6470588, 0, 1,
-1.132725, 0.6126257, -0.6994443, 1, 0.654902, 0, 1,
-1.130648, 1.12446, -0.8383531, 1, 0.6588235, 0, 1,
-1.12976, -1.104316, -2.065374, 1, 0.6666667, 0, 1,
-1.125875, -1.2257, -1.875666, 1, 0.6705883, 0, 1,
-1.10453, -1.018991, -2.357803, 1, 0.6784314, 0, 1,
-1.104434, 0.5046191, -0.5689104, 1, 0.682353, 0, 1,
-1.100493, 1.359214, 0.3823183, 1, 0.6901961, 0, 1,
-1.091017, -1.149421, -2.421304, 1, 0.6941177, 0, 1,
-1.090165, -1.052336, -2.484304, 1, 0.7019608, 0, 1,
-1.089593, 1.956191, -0.4223649, 1, 0.7098039, 0, 1,
-1.087272, 0.303439, -0.7812792, 1, 0.7137255, 0, 1,
-1.080093, -0.2468637, -1.94638, 1, 0.7215686, 0, 1,
-1.079454, 0.4135172, 1.573594, 1, 0.7254902, 0, 1,
-1.072458, -1.068639, -3.053645, 1, 0.7333333, 0, 1,
-1.062818, -0.5028661, -1.679939, 1, 0.7372549, 0, 1,
-1.059858, 0.4600811, -0.5730338, 1, 0.7450981, 0, 1,
-1.049393, -1.063329, -1.35285, 1, 0.7490196, 0, 1,
-1.047913, -1.676871, -3.665488, 1, 0.7568628, 0, 1,
-1.046099, -0.3944452, -1.942861, 1, 0.7607843, 0, 1,
-1.04054, 1.18992, 0.1883879, 1, 0.7686275, 0, 1,
-1.039902, 0.7819415, -0.2432175, 1, 0.772549, 0, 1,
-1.03915, -0.1039013, -1.571904, 1, 0.7803922, 0, 1,
-1.0368, 0.1322056, -1.164549, 1, 0.7843137, 0, 1,
-1.034145, -0.745619, -1.537377, 1, 0.7921569, 0, 1,
-1.030821, 1.211923, -1.587613, 1, 0.7960784, 0, 1,
-1.027723, -0.4720276, -3.923559, 1, 0.8039216, 0, 1,
-1.026866, 1.724746, 0.6295788, 1, 0.8117647, 0, 1,
-1.026522, 0.8105918, -0.6701774, 1, 0.8156863, 0, 1,
-1.011209, 0.3402109, -0.504284, 1, 0.8235294, 0, 1,
-0.9967398, 0.244687, -1.618815, 1, 0.827451, 0, 1,
-0.994068, 1.288601, 0.3624, 1, 0.8352941, 0, 1,
-0.9891838, 1.008422, -1.53115, 1, 0.8392157, 0, 1,
-0.9850331, 1.802122, 1.13998, 1, 0.8470588, 0, 1,
-0.9849182, 0.5301104, -2.697278, 1, 0.8509804, 0, 1,
-0.9839474, -1.82063, -3.483027, 1, 0.8588235, 0, 1,
-0.9767829, -1.434647, -3.889039, 1, 0.8627451, 0, 1,
-0.9759713, -1.737382, -2.982408, 1, 0.8705882, 0, 1,
-0.9722597, -0.4183765, -2.635384, 1, 0.8745098, 0, 1,
-0.9663553, -0.08668292, -1.368072, 1, 0.8823529, 0, 1,
-0.9567116, -0.9370278, -0.7506866, 1, 0.8862745, 0, 1,
-0.9566703, 0.7588353, -0.2365419, 1, 0.8941177, 0, 1,
-0.9564296, 0.8127849, -1.042711, 1, 0.8980392, 0, 1,
-0.9537078, -0.4490976, -2.668066, 1, 0.9058824, 0, 1,
-0.9519346, 1.40665, -1.572677, 1, 0.9137255, 0, 1,
-0.9514381, 0.470928, -1.176702, 1, 0.9176471, 0, 1,
-0.9486709, -1.352462, -3.294746, 1, 0.9254902, 0, 1,
-0.9469522, -0.9886807, -1.624842, 1, 0.9294118, 0, 1,
-0.9300773, -1.689898, -2.860056, 1, 0.9372549, 0, 1,
-0.9291103, -0.7563071, -1.483864, 1, 0.9411765, 0, 1,
-0.9275939, 1.30578, -0.194647, 1, 0.9490196, 0, 1,
-0.9247301, -0.3674526, -1.528002, 1, 0.9529412, 0, 1,
-0.9221336, -0.2384814, -2.090696, 1, 0.9607843, 0, 1,
-0.9166288, 0.5333227, -1.850114, 1, 0.9647059, 0, 1,
-0.9134812, -0.2673981, -1.623948, 1, 0.972549, 0, 1,
-0.9127506, 0.312225, -2.829438, 1, 0.9764706, 0, 1,
-0.9106597, 0.197228, -2.383998, 1, 0.9843137, 0, 1,
-0.9079514, 0.2620369, -1.757141, 1, 0.9882353, 0, 1,
-0.9057864, 1.142847, -0.6774361, 1, 0.9960784, 0, 1,
-0.8988306, 1.729962, -1.79856, 0.9960784, 1, 0, 1,
-0.8935485, 0.899648, -0.6695306, 0.9921569, 1, 0, 1,
-0.8884468, 0.6903746, -1.931945, 0.9843137, 1, 0, 1,
-0.8845375, -0.2751974, -1.006876, 0.9803922, 1, 0, 1,
-0.8818749, -0.878933, -2.600008, 0.972549, 1, 0, 1,
-0.8800176, -1.258157, -3.176351, 0.9686275, 1, 0, 1,
-0.8724626, -0.05944498, -2.527476, 0.9607843, 1, 0, 1,
-0.8724521, -1.622448, -2.848068, 0.9568627, 1, 0, 1,
-0.8711953, -0.6001017, -1.43546, 0.9490196, 1, 0, 1,
-0.8557768, -0.8398385, 0.5829223, 0.945098, 1, 0, 1,
-0.8491411, -0.007539984, -0.7999826, 0.9372549, 1, 0, 1,
-0.8481804, 0.1690118, -2.071976, 0.9333333, 1, 0, 1,
-0.8478253, 0.7154082, -2.016032, 0.9254902, 1, 0, 1,
-0.8426011, -0.8122212, -2.234585, 0.9215686, 1, 0, 1,
-0.8404839, -0.7422549, -1.57651, 0.9137255, 1, 0, 1,
-0.8390713, 1.686156, 0.2585636, 0.9098039, 1, 0, 1,
-0.8360749, 1.639823, 0.02348797, 0.9019608, 1, 0, 1,
-0.8300713, -0.4913535, -1.414212, 0.8941177, 1, 0, 1,
-0.8263274, 0.1993556, -0.2641477, 0.8901961, 1, 0, 1,
-0.8180473, 0.631709, -1.037597, 0.8823529, 1, 0, 1,
-0.8152874, -0.9703674, -4.10775, 0.8784314, 1, 0, 1,
-0.8129429, -0.4636122, -2.753965, 0.8705882, 1, 0, 1,
-0.8116774, 0.2063931, -0.4021183, 0.8666667, 1, 0, 1,
-0.8079351, 2.140719, -1.065858, 0.8588235, 1, 0, 1,
-0.8005763, 0.1410746, 0.287232, 0.854902, 1, 0, 1,
-0.7994493, -0.04930365, -2.965162, 0.8470588, 1, 0, 1,
-0.7983301, -1.22213, -2.791985, 0.8431373, 1, 0, 1,
-0.7931395, 0.2059212, -0.583928, 0.8352941, 1, 0, 1,
-0.7928692, 2.573163, -0.4594111, 0.8313726, 1, 0, 1,
-0.7812918, -0.08519283, -2.377697, 0.8235294, 1, 0, 1,
-0.7713476, -1.283061, -3.785641, 0.8196079, 1, 0, 1,
-0.7695082, 1.250741, -0.07954357, 0.8117647, 1, 0, 1,
-0.7686031, -0.05775608, -1.33976, 0.8078431, 1, 0, 1,
-0.7645525, 1.688626, 0.02370456, 0.8, 1, 0, 1,
-0.7599096, 1.480312, -2.892194, 0.7921569, 1, 0, 1,
-0.7381509, 0.4829227, 0.6912538, 0.7882353, 1, 0, 1,
-0.7370426, -0.3041978, -2.451598, 0.7803922, 1, 0, 1,
-0.7368495, 0.6934313, -0.4319881, 0.7764706, 1, 0, 1,
-0.7347983, 0.6968209, -1.550916, 0.7686275, 1, 0, 1,
-0.7189921, -1.208414, -3.055594, 0.7647059, 1, 0, 1,
-0.7105487, 0.7308668, -0.5678045, 0.7568628, 1, 0, 1,
-0.7093386, 1.130845, -1.672741, 0.7529412, 1, 0, 1,
-0.7047896, 1.438538, -0.2806986, 0.7450981, 1, 0, 1,
-0.7032655, -0.5186715, -2.776675, 0.7411765, 1, 0, 1,
-0.7019904, 0.2041434, -1.264485, 0.7333333, 1, 0, 1,
-0.6932127, 0.6949652, -2.30777, 0.7294118, 1, 0, 1,
-0.6923553, -0.3304395, -1.119003, 0.7215686, 1, 0, 1,
-0.6919484, -0.7233093, -2.255238, 0.7176471, 1, 0, 1,
-0.690346, -0.1467176, -2.907551, 0.7098039, 1, 0, 1,
-0.6889403, 0.05183447, -3.299076, 0.7058824, 1, 0, 1,
-0.6760886, -0.4086069, -1.977154, 0.6980392, 1, 0, 1,
-0.6745141, 2.285898, -0.01151118, 0.6901961, 1, 0, 1,
-0.6736431, 1.55688, -1.177349, 0.6862745, 1, 0, 1,
-0.6697729, 0.2684985, -1.562828, 0.6784314, 1, 0, 1,
-0.668592, -1.497809, -2.223328, 0.6745098, 1, 0, 1,
-0.665378, 1.10117, -1.118335, 0.6666667, 1, 0, 1,
-0.6648865, -0.2309772, -1.710859, 0.6627451, 1, 0, 1,
-0.6647351, 0.1237329, -1.870151, 0.654902, 1, 0, 1,
-0.6580471, 2.35019, -1.208566, 0.6509804, 1, 0, 1,
-0.6548485, -0.4673932, -2.636701, 0.6431373, 1, 0, 1,
-0.6516158, -1.374916, -2.986112, 0.6392157, 1, 0, 1,
-0.6514952, -0.3046827, -1.578499, 0.6313726, 1, 0, 1,
-0.6389925, -0.1027999, -2.144371, 0.627451, 1, 0, 1,
-0.6361556, 0.1689194, -0.4646149, 0.6196079, 1, 0, 1,
-0.6360874, -0.7637415, -2.464974, 0.6156863, 1, 0, 1,
-0.6344802, 0.7269883, -1.368458, 0.6078432, 1, 0, 1,
-0.6314241, -0.08135303, -3.403018, 0.6039216, 1, 0, 1,
-0.6291199, 0.847721, 1.204941, 0.5960785, 1, 0, 1,
-0.6265855, -0.1108457, -1.805466, 0.5882353, 1, 0, 1,
-0.6249056, -0.3898934, -0.579021, 0.5843138, 1, 0, 1,
-0.6165642, 1.317993, 0.4781834, 0.5764706, 1, 0, 1,
-0.615728, 0.7984151, 0.8000367, 0.572549, 1, 0, 1,
-0.6070598, 0.3678062, -1.554306, 0.5647059, 1, 0, 1,
-0.6048894, 0.1611079, -1.79533, 0.5607843, 1, 0, 1,
-0.593156, 2.767589, 0.7689056, 0.5529412, 1, 0, 1,
-0.5878352, -0.9076387, -2.112995, 0.5490196, 1, 0, 1,
-0.5866591, 0.0001133493, -1.25757, 0.5411765, 1, 0, 1,
-0.5843538, -1.419918, -3.979862, 0.5372549, 1, 0, 1,
-0.5835961, 1.509324, -0.4976826, 0.5294118, 1, 0, 1,
-0.5831724, -0.4544398, -2.03291, 0.5254902, 1, 0, 1,
-0.5786674, 0.4565844, -0.5950835, 0.5176471, 1, 0, 1,
-0.5702847, 0.3362124, -0.9667248, 0.5137255, 1, 0, 1,
-0.5629076, 0.9956143, -2.172007, 0.5058824, 1, 0, 1,
-0.5604219, 1.051715, -1.633285, 0.5019608, 1, 0, 1,
-0.5580629, -0.1498258, -1.92325, 0.4941176, 1, 0, 1,
-0.5535356, 0.3360296, -0.8505732, 0.4862745, 1, 0, 1,
-0.5507277, 0.04898733, -2.716343, 0.4823529, 1, 0, 1,
-0.5501845, 0.7065173, 0.2930994, 0.4745098, 1, 0, 1,
-0.5500534, 0.6959754, 0.9687285, 0.4705882, 1, 0, 1,
-0.5465111, 1.72998, 0.1162109, 0.4627451, 1, 0, 1,
-0.5432513, 0.2839196, -0.2295924, 0.4588235, 1, 0, 1,
-0.5413923, 0.5914133, -1.496498, 0.4509804, 1, 0, 1,
-0.5388178, 0.2203514, -1.214614, 0.4470588, 1, 0, 1,
-0.5335953, -1.557586, -4.983394, 0.4392157, 1, 0, 1,
-0.5331925, 1.015165, -1.408796, 0.4352941, 1, 0, 1,
-0.5331631, -0.2053189, -1.683743, 0.427451, 1, 0, 1,
-0.5295121, -0.05891701, -0.1520016, 0.4235294, 1, 0, 1,
-0.5293047, -1.882515, -3.297098, 0.4156863, 1, 0, 1,
-0.5277458, -0.09021431, -0.758131, 0.4117647, 1, 0, 1,
-0.5266639, 1.194951, 0.1565163, 0.4039216, 1, 0, 1,
-0.5261761, -0.3099679, -2.619777, 0.3960784, 1, 0, 1,
-0.5208058, -0.495891, -1.717796, 0.3921569, 1, 0, 1,
-0.5179955, 0.5121919, -0.1359433, 0.3843137, 1, 0, 1,
-0.5123579, -0.5217434, -3.426818, 0.3803922, 1, 0, 1,
-0.5109973, 1.928934, 0.2320036, 0.372549, 1, 0, 1,
-0.5105671, 1.680356, 0.6187035, 0.3686275, 1, 0, 1,
-0.5068719, -0.7116982, -3.484048, 0.3607843, 1, 0, 1,
-0.5042428, 0.05831209, -2.723711, 0.3568628, 1, 0, 1,
-0.5032777, -1.552512, -1.864975, 0.3490196, 1, 0, 1,
-0.5014614, -0.3680321, -2.607938, 0.345098, 1, 0, 1,
-0.4962679, 0.6550316, 1.151886, 0.3372549, 1, 0, 1,
-0.4942736, -0.2169912, -1.808355, 0.3333333, 1, 0, 1,
-0.4856285, 0.2842317, -0.7281519, 0.3254902, 1, 0, 1,
-0.4830705, -0.6006739, -3.18374, 0.3215686, 1, 0, 1,
-0.4768335, 1.510517, 0.3746989, 0.3137255, 1, 0, 1,
-0.4685276, 0.4810096, -0.7455523, 0.3098039, 1, 0, 1,
-0.4661968, -0.5796506, -3.140668, 0.3019608, 1, 0, 1,
-0.4661156, 1.298217, -0.7108757, 0.2941177, 1, 0, 1,
-0.4657492, 2.662215, -0.1863012, 0.2901961, 1, 0, 1,
-0.4619988, 0.5216411, -3.176765, 0.282353, 1, 0, 1,
-0.4607475, -0.5084898, -1.645583, 0.2784314, 1, 0, 1,
-0.4598571, -1.278716, -4.581866, 0.2705882, 1, 0, 1,
-0.4584632, -0.7090849, -1.618747, 0.2666667, 1, 0, 1,
-0.4569919, -1.169573, -3.585199, 0.2588235, 1, 0, 1,
-0.4499668, 0.561224, -1.559647, 0.254902, 1, 0, 1,
-0.4482258, 0.6139029, -1.860968, 0.2470588, 1, 0, 1,
-0.4443082, 0.303963, -1.45337, 0.2431373, 1, 0, 1,
-0.4394366, 0.8626024, -1.976354, 0.2352941, 1, 0, 1,
-0.4250756, 0.01306684, -2.446321, 0.2313726, 1, 0, 1,
-0.4244525, 1.686361, -1.577743, 0.2235294, 1, 0, 1,
-0.4241831, -0.1514715, -0.7084882, 0.2196078, 1, 0, 1,
-0.4237783, 0.5648299, 0.3177818, 0.2117647, 1, 0, 1,
-0.4236993, -0.6137271, -2.223442, 0.2078431, 1, 0, 1,
-0.4188103, -0.7245802, -1.804661, 0.2, 1, 0, 1,
-0.4156174, -0.3195588, -2.20277, 0.1921569, 1, 0, 1,
-0.4152334, 0.1613166, -0.7097853, 0.1882353, 1, 0, 1,
-0.4152272, -0.05736024, -1.966769, 0.1803922, 1, 0, 1,
-0.4126445, 0.7907079, -0.4803515, 0.1764706, 1, 0, 1,
-0.4089136, 0.1757351, -1.883524, 0.1686275, 1, 0, 1,
-0.4042244, -0.04187657, -0.926695, 0.1647059, 1, 0, 1,
-0.4020102, -0.08134034, -2.089343, 0.1568628, 1, 0, 1,
-0.4005024, -1.009173, -3.125257, 0.1529412, 1, 0, 1,
-0.3995514, -0.3791143, -1.749968, 0.145098, 1, 0, 1,
-0.3945821, -0.7237588, -1.511015, 0.1411765, 1, 0, 1,
-0.3942071, -0.8419768, -2.05502, 0.1333333, 1, 0, 1,
-0.3894311, 0.315672, -0.7464669, 0.1294118, 1, 0, 1,
-0.3847352, 0.9098167, -0.7069407, 0.1215686, 1, 0, 1,
-0.3805887, -0.3776699, -1.842221, 0.1176471, 1, 0, 1,
-0.3760378, -0.00763652, -0.732267, 0.1098039, 1, 0, 1,
-0.373239, -0.26831, -0.1302143, 0.1058824, 1, 0, 1,
-0.3719433, 0.09551065, -2.018125, 0.09803922, 1, 0, 1,
-0.3701623, 1.658758, -0.7229326, 0.09019608, 1, 0, 1,
-0.3690096, -1.743014, -4.702702, 0.08627451, 1, 0, 1,
-0.3654504, -0.2465102, -2.921025, 0.07843138, 1, 0, 1,
-0.3652362, 0.2112092, -2.353936, 0.07450981, 1, 0, 1,
-0.3598295, 0.0007599869, -3.318174, 0.06666667, 1, 0, 1,
-0.3557231, 0.262787, -1.801053, 0.0627451, 1, 0, 1,
-0.3534631, -0.2647518, -1.581605, 0.05490196, 1, 0, 1,
-0.352941, -0.3661719, -2.536749, 0.05098039, 1, 0, 1,
-0.3500731, 1.57682, -1.300105, 0.04313726, 1, 0, 1,
-0.3500696, 0.0102158, -2.069514, 0.03921569, 1, 0, 1,
-0.3500463, 0.2714565, -2.069649, 0.03137255, 1, 0, 1,
-0.3481382, 1.51442, -0.1011799, 0.02745098, 1, 0, 1,
-0.3456486, 0.05245816, -1.462977, 0.01960784, 1, 0, 1,
-0.3450266, 2.022875, 1.734646, 0.01568628, 1, 0, 1,
-0.3413064, 0.3707142, 0.4716315, 0.007843138, 1, 0, 1,
-0.3364262, 0.5906621, -1.443164, 0.003921569, 1, 0, 1,
-0.3347902, 1.340585, 1.061406, 0, 1, 0.003921569, 1,
-0.3332518, -0.5974789, -2.975365, 0, 1, 0.01176471, 1,
-0.3326723, 1.439152, -1.829992, 0, 1, 0.01568628, 1,
-0.3304719, -1.095462, -1.896431, 0, 1, 0.02352941, 1,
-0.3286506, -0.8688228, -3.741205, 0, 1, 0.02745098, 1,
-0.3254565, -0.7318537, -1.371287, 0, 1, 0.03529412, 1,
-0.3252231, 0.01457995, -2.212823, 0, 1, 0.03921569, 1,
-0.3226474, -1.421066, -3.146905, 0, 1, 0.04705882, 1,
-0.3208968, 1.854017, -0.8247775, 0, 1, 0.05098039, 1,
-0.3203208, -2.500673, -2.835779, 0, 1, 0.05882353, 1,
-0.3189482, -0.4911106, -3.028064, 0, 1, 0.0627451, 1,
-0.3141753, 0.06556265, -1.936497, 0, 1, 0.07058824, 1,
-0.3131912, -1.027848, -2.929798, 0, 1, 0.07450981, 1,
-0.3119814, 0.5807218, 0.5144843, 0, 1, 0.08235294, 1,
-0.3082967, 0.3620279, -1.799274, 0, 1, 0.08627451, 1,
-0.3064286, 1.334426, 1.586239, 0, 1, 0.09411765, 1,
-0.2993537, -0.1727438, -3.269565, 0, 1, 0.1019608, 1,
-0.296508, -0.7802968, -2.823586, 0, 1, 0.1058824, 1,
-0.2900142, 0.1071731, -1.297412, 0, 1, 0.1137255, 1,
-0.2807832, 0.759585, -0.5072109, 0, 1, 0.1176471, 1,
-0.2789829, -0.5513574, -3.307165, 0, 1, 0.1254902, 1,
-0.2753673, -1.044488, -3.248447, 0, 1, 0.1294118, 1,
-0.2724634, -0.7943659, -1.504233, 0, 1, 0.1372549, 1,
-0.2688205, 0.1927013, -1.92668, 0, 1, 0.1411765, 1,
-0.263251, 0.6347533, -0.4554868, 0, 1, 0.1490196, 1,
-0.2615292, -1.116018, -3.515512, 0, 1, 0.1529412, 1,
-0.2614863, 0.321014, -0.08195093, 0, 1, 0.1607843, 1,
-0.2570484, 0.1206686, -2.074946, 0, 1, 0.1647059, 1,
-0.2567357, -0.9076834, -2.181355, 0, 1, 0.172549, 1,
-0.2566627, -0.1586509, -2.950829, 0, 1, 0.1764706, 1,
-0.2539657, 0.6581858, 0.286449, 0, 1, 0.1843137, 1,
-0.2539311, -0.8049806, -3.899857, 0, 1, 0.1882353, 1,
-0.2517501, -1.284553, -4.300075, 0, 1, 0.1960784, 1,
-0.2511972, 1.229271, -1.114434, 0, 1, 0.2039216, 1,
-0.2432747, 0.734935, 1.037625, 0, 1, 0.2078431, 1,
-0.234945, -0.7321391, -2.176838, 0, 1, 0.2156863, 1,
-0.2344563, -0.2988959, -2.388792, 0, 1, 0.2196078, 1,
-0.2342554, -0.207278, -3.171519, 0, 1, 0.227451, 1,
-0.2309702, 1.005064, -1.189736, 0, 1, 0.2313726, 1,
-0.2297053, -0.120877, -2.453849, 0, 1, 0.2392157, 1,
-0.2265651, -0.5284147, -2.937499, 0, 1, 0.2431373, 1,
-0.225734, -0.6784273, -2.370898, 0, 1, 0.2509804, 1,
-0.2245555, 1.663742, -1.318329, 0, 1, 0.254902, 1,
-0.2151469, -0.6600869, -1.638332, 0, 1, 0.2627451, 1,
-0.2137042, 0.7044114, 0.2904136, 0, 1, 0.2666667, 1,
-0.2121753, -0.5455221, -1.338957, 0, 1, 0.2745098, 1,
-0.2120157, 0.5214738, -0.2326884, 0, 1, 0.2784314, 1,
-0.2089674, -0.8368175, -3.059326, 0, 1, 0.2862745, 1,
-0.2012327, 0.03210828, 0.1661479, 0, 1, 0.2901961, 1,
-0.1998373, -0.9284475, -3.371018, 0, 1, 0.2980392, 1,
-0.1965644, -0.5479786, -3.474431, 0, 1, 0.3058824, 1,
-0.1950303, 1.103916, 0.3920895, 0, 1, 0.3098039, 1,
-0.1931125, -1.071572, -2.23356, 0, 1, 0.3176471, 1,
-0.1903873, -1.384855, -2.815434, 0, 1, 0.3215686, 1,
-0.1829141, 0.1325244, -1.190954, 0, 1, 0.3294118, 1,
-0.1827084, 0.5101372, -0.7595338, 0, 1, 0.3333333, 1,
-0.1811064, -1.569857, -3.189892, 0, 1, 0.3411765, 1,
-0.1752875, -1.061594, -3.228281, 0, 1, 0.345098, 1,
-0.1712402, -2.580964, -4.174113, 0, 1, 0.3529412, 1,
-0.1678493, 0.1519943, -0.6622512, 0, 1, 0.3568628, 1,
-0.1677616, 0.1274864, -0.4202394, 0, 1, 0.3647059, 1,
-0.1594707, -0.3933919, -3.494608, 0, 1, 0.3686275, 1,
-0.155058, -0.1327612, -1.159576, 0, 1, 0.3764706, 1,
-0.1546176, -0.2043515, -3.100834, 0, 1, 0.3803922, 1,
-0.1546114, 1.143743, 0.6669366, 0, 1, 0.3882353, 1,
-0.1537873, 0.6725185, 0.3930238, 0, 1, 0.3921569, 1,
-0.1510482, 1.986233, -0.08096419, 0, 1, 0.4, 1,
-0.1429805, 0.2870821, 0.4155437, 0, 1, 0.4078431, 1,
-0.1371142, 0.5303867, -0.7535525, 0, 1, 0.4117647, 1,
-0.1363107, 1.697911, -0.9045684, 0, 1, 0.4196078, 1,
-0.1331946, -0.1602724, -2.605739, 0, 1, 0.4235294, 1,
-0.1309202, 1.621645, 1.21926, 0, 1, 0.4313726, 1,
-0.1291506, 0.1763664, -1.194242, 0, 1, 0.4352941, 1,
-0.1285133, -0.3375017, -3.490798, 0, 1, 0.4431373, 1,
-0.1280466, 1.440902, -0.05226573, 0, 1, 0.4470588, 1,
-0.1278375, -0.2501309, -3.670753, 0, 1, 0.454902, 1,
-0.1274318, 0.0249004, -1.095978, 0, 1, 0.4588235, 1,
-0.1264178, 0.5425862, -0.8514196, 0, 1, 0.4666667, 1,
-0.1255938, 1.021333, -1.762463, 0, 1, 0.4705882, 1,
-0.1246656, -1.820063, -3.134994, 0, 1, 0.4784314, 1,
-0.1242081, 0.7232302, 0.5986992, 0, 1, 0.4823529, 1,
-0.1213342, 0.2521693, -0.4631323, 0, 1, 0.4901961, 1,
-0.1197211, -1.018049, -3.14405, 0, 1, 0.4941176, 1,
-0.1191023, -0.3102933, -2.185205, 0, 1, 0.5019608, 1,
-0.1188497, -0.4675504, -3.349993, 0, 1, 0.509804, 1,
-0.118029, 1.09569, -1.051833, 0, 1, 0.5137255, 1,
-0.1172926, -0.634355, -3.340395, 0, 1, 0.5215687, 1,
-0.1129304, -0.9121597, -2.6789, 0, 1, 0.5254902, 1,
-0.1127109, 1.19355, 0.5682837, 0, 1, 0.5333334, 1,
-0.1075187, 0.9609269, -0.8688244, 0, 1, 0.5372549, 1,
-0.1055894, -0.2465103, -3.751479, 0, 1, 0.5450981, 1,
-0.1031581, 1.403667, -1.829297, 0, 1, 0.5490196, 1,
-0.1029105, -1.231946, -2.992079, 0, 1, 0.5568628, 1,
-0.102724, -0.9825237, -2.423381, 0, 1, 0.5607843, 1,
-0.1014971, 0.2919776, -1.160571, 0, 1, 0.5686275, 1,
-0.1014883, -1.599242, -2.07196, 0, 1, 0.572549, 1,
-0.1001033, -1.825824, -2.890148, 0, 1, 0.5803922, 1,
-0.09833746, -1.1638, -2.077158, 0, 1, 0.5843138, 1,
-0.09721608, 0.3420909, -1.218801, 0, 1, 0.5921569, 1,
-0.09468783, -1.668325, -2.847231, 0, 1, 0.5960785, 1,
-0.09275578, 1.040675, 0.1545169, 0, 1, 0.6039216, 1,
-0.08518652, -0.1357238, -2.271259, 0, 1, 0.6117647, 1,
-0.08384118, -0.1511824, -3.663131, 0, 1, 0.6156863, 1,
-0.0829664, -0.3843447, -2.555591, 0, 1, 0.6235294, 1,
-0.0825996, 0.02032256, -3.225729, 0, 1, 0.627451, 1,
-0.08207262, 1.230913, 1.34033, 0, 1, 0.6352941, 1,
-0.07808443, 0.5437359, -1.213943, 0, 1, 0.6392157, 1,
-0.07240172, 0.3356801, 0.5595043, 0, 1, 0.6470588, 1,
-0.07141981, -0.8137144, -1.372126, 0, 1, 0.6509804, 1,
-0.07096817, -0.756119, -2.286093, 0, 1, 0.6588235, 1,
-0.07087556, -0.1938158, -4.166129, 0, 1, 0.6627451, 1,
-0.06997177, -1.611037, -3.733871, 0, 1, 0.6705883, 1,
-0.06298751, 1.346191, -0.7464824, 0, 1, 0.6745098, 1,
-0.06291699, 0.8672101, 0.1517513, 0, 1, 0.682353, 1,
-0.0593522, 0.3289899, 0.8988506, 0, 1, 0.6862745, 1,
-0.0585837, -1.081502, -2.309393, 0, 1, 0.6941177, 1,
-0.05853272, -1.819266, -3.480175, 0, 1, 0.7019608, 1,
-0.05818538, -0.6538669, -1.800521, 0, 1, 0.7058824, 1,
-0.04861817, -0.9811901, -2.71771, 0, 1, 0.7137255, 1,
-0.04688662, 1.39214, 0.2492273, 0, 1, 0.7176471, 1,
-0.04589886, 0.2526917, -1.137393, 0, 1, 0.7254902, 1,
-0.04450126, 0.3496124, -0.2610189, 0, 1, 0.7294118, 1,
-0.03796538, 0.1665614, 1.116684, 0, 1, 0.7372549, 1,
-0.03697962, 1.091731, 0.04400701, 0, 1, 0.7411765, 1,
-0.03609633, -0.1077626, -1.55619, 0, 1, 0.7490196, 1,
-0.03472852, 1.896929, 1.464039, 0, 1, 0.7529412, 1,
-0.03370022, -0.2796811, -3.31307, 0, 1, 0.7607843, 1,
-0.02746062, -0.9818877, -2.876833, 0, 1, 0.7647059, 1,
-0.02496102, 0.3488232, -1.061432, 0, 1, 0.772549, 1,
-0.02252232, -0.6208982, -2.171283, 0, 1, 0.7764706, 1,
-0.02206575, 0.798602, 0.4248137, 0, 1, 0.7843137, 1,
-0.01690792, -0.1713308, -2.910835, 0, 1, 0.7882353, 1,
-0.01247051, -0.2715588, -3.521572, 0, 1, 0.7960784, 1,
-0.01117224, -0.2778582, -2.209526, 0, 1, 0.8039216, 1,
-0.01076711, -1.017153, -2.583902, 0, 1, 0.8078431, 1,
-0.007266998, 1.338852, -0.7768462, 0, 1, 0.8156863, 1,
-0.002480012, 0.06777771, 0.6757943, 0, 1, 0.8196079, 1,
-0.0005062532, -1.775476, -3.925523, 0, 1, 0.827451, 1,
-0.0002356265, -0.09906664, -3.802212, 0, 1, 0.8313726, 1,
0.0002782899, -2.215345, 3.1804, 0, 1, 0.8392157, 1,
0.002022963, -1.983317, 2.776994, 0, 1, 0.8431373, 1,
0.00206519, 0.09651024, -0.9797249, 0, 1, 0.8509804, 1,
0.006556964, -1.955897, 3.866554, 0, 1, 0.854902, 1,
0.009035791, -0.655808, 2.360134, 0, 1, 0.8627451, 1,
0.009336813, 0.3357644, 1.390085, 0, 1, 0.8666667, 1,
0.01058006, 0.4845041, 0.2874358, 0, 1, 0.8745098, 1,
0.01144997, 2.181632, 0.1116617, 0, 1, 0.8784314, 1,
0.01314607, -1.879678, 1.8583, 0, 1, 0.8862745, 1,
0.0148338, -0.7258691, 4.023212, 0, 1, 0.8901961, 1,
0.01520457, 0.819234, -1.445258, 0, 1, 0.8980392, 1,
0.01912168, -1.466576, 3.025499, 0, 1, 0.9058824, 1,
0.01997103, -1.573715, 3.341717, 0, 1, 0.9098039, 1,
0.02013827, -0.2588702, 2.348395, 0, 1, 0.9176471, 1,
0.02419126, -0.1679257, 3.576156, 0, 1, 0.9215686, 1,
0.03141556, -1.415827, 1.611431, 0, 1, 0.9294118, 1,
0.0321794, 0.5074978, -0.8921469, 0, 1, 0.9333333, 1,
0.03318583, -0.4337074, 3.58102, 0, 1, 0.9411765, 1,
0.03348121, -0.3279614, 3.142953, 0, 1, 0.945098, 1,
0.03420861, -2.104592, 3.943323, 0, 1, 0.9529412, 1,
0.03812362, 1.079463, -1.037591, 0, 1, 0.9568627, 1,
0.04236915, 0.7945392, 2.647558, 0, 1, 0.9647059, 1,
0.0459708, 0.9875804, 1.860733, 0, 1, 0.9686275, 1,
0.04642215, 0.04871749, -1.12008, 0, 1, 0.9764706, 1,
0.04794142, -0.188776, 2.137502, 0, 1, 0.9803922, 1,
0.05265212, -0.6928484, 1.922948, 0, 1, 0.9882353, 1,
0.05318372, 0.8499643, 2.630239, 0, 1, 0.9921569, 1,
0.0579626, -1.247655, 3.299237, 0, 1, 1, 1,
0.05826194, -0.02110673, -0.8082758, 0, 0.9921569, 1, 1,
0.06012625, -1.470026, 1.755071, 0, 0.9882353, 1, 1,
0.06124693, -0.6055804, 3.715008, 0, 0.9803922, 1, 1,
0.06174558, 1.052525, 0.1369204, 0, 0.9764706, 1, 1,
0.0693981, -0.1838861, 1.959817, 0, 0.9686275, 1, 1,
0.07135688, 0.671564, -0.1127151, 0, 0.9647059, 1, 1,
0.07176413, -1.102359, 2.875608, 0, 0.9568627, 1, 1,
0.07422824, 1.172154, 3.244036, 0, 0.9529412, 1, 1,
0.07450272, 1.065461, 1.068313, 0, 0.945098, 1, 1,
0.0780459, 1.726381, -0.8276519, 0, 0.9411765, 1, 1,
0.08323544, -0.3795851, 3.209801, 0, 0.9333333, 1, 1,
0.08521783, -1.278714, 2.33563, 0, 0.9294118, 1, 1,
0.08629443, -0.7323094, 2.409689, 0, 0.9215686, 1, 1,
0.09013924, 1.076881, -0.004563039, 0, 0.9176471, 1, 1,
0.09015935, 0.9886894, 1.175592, 0, 0.9098039, 1, 1,
0.09068372, -0.4178118, 1.725323, 0, 0.9058824, 1, 1,
0.09098595, -1.188709, 1.750499, 0, 0.8980392, 1, 1,
0.09291741, -1.134947, 2.409851, 0, 0.8901961, 1, 1,
0.09350479, 0.6294637, -1.299692, 0, 0.8862745, 1, 1,
0.09360953, 0.5173375, -1.164766, 0, 0.8784314, 1, 1,
0.0938544, 0.4589438, -1.622838, 0, 0.8745098, 1, 1,
0.09843643, 0.7555632, -0.262133, 0, 0.8666667, 1, 1,
0.1003865, -0.0125451, -0.1494336, 0, 0.8627451, 1, 1,
0.1049464, 0.7386473, 1.096801, 0, 0.854902, 1, 1,
0.1070188, -0.7218186, 2.090667, 0, 0.8509804, 1, 1,
0.1138299, 0.5304232, -0.07183275, 0, 0.8431373, 1, 1,
0.114876, 0.2086774, 1.691863, 0, 0.8392157, 1, 1,
0.1169762, 1.075132, -0.2065608, 0, 0.8313726, 1, 1,
0.1176168, 0.8639315, -0.7564434, 0, 0.827451, 1, 1,
0.1180951, -0.06488582, 1.449732, 0, 0.8196079, 1, 1,
0.1184169, 1.033215, -0.07825304, 0, 0.8156863, 1, 1,
0.1211278, -1.521042, 2.5942, 0, 0.8078431, 1, 1,
0.1316454, 0.0126196, 2.763234, 0, 0.8039216, 1, 1,
0.132955, 1.053458, 0.09083663, 0, 0.7960784, 1, 1,
0.138068, -0.006933148, 0.8146676, 0, 0.7882353, 1, 1,
0.1435111, -0.116922, 2.372733, 0, 0.7843137, 1, 1,
0.1449144, -0.2630438, 1.643915, 0, 0.7764706, 1, 1,
0.1462186, -0.2622757, 1.193794, 0, 0.772549, 1, 1,
0.152385, -0.03725773, 2.744885, 0, 0.7647059, 1, 1,
0.1530116, -0.1601189, 4.409563, 0, 0.7607843, 1, 1,
0.1554578, -0.5781525, 1.810129, 0, 0.7529412, 1, 1,
0.160873, -2.378521, 2.105477, 0, 0.7490196, 1, 1,
0.1653346, 0.3958853, 0.05753338, 0, 0.7411765, 1, 1,
0.1683354, -2.148344, 2.502026, 0, 0.7372549, 1, 1,
0.171484, 0.7917055, -1.788895, 0, 0.7294118, 1, 1,
0.1714842, -0.281531, 1.639145, 0, 0.7254902, 1, 1,
0.1755749, 0.3216078, 1.127998, 0, 0.7176471, 1, 1,
0.1796501, -0.2367559, 0.635335, 0, 0.7137255, 1, 1,
0.1799455, 0.4346644, -1.258916, 0, 0.7058824, 1, 1,
0.1873427, -1.448846, 1.398391, 0, 0.6980392, 1, 1,
0.1988816, 0.5062298, -0.06349994, 0, 0.6941177, 1, 1,
0.1990345, -0.3012039, 2.88092, 0, 0.6862745, 1, 1,
0.1999957, 1.214463, 1.04879, 0, 0.682353, 1, 1,
0.2029952, -1.010759, 3.556309, 0, 0.6745098, 1, 1,
0.2071364, -0.5336503, 3.436379, 0, 0.6705883, 1, 1,
0.2073552, 0.7743083, -0.2910605, 0, 0.6627451, 1, 1,
0.2098586, -0.609985, 4.577535, 0, 0.6588235, 1, 1,
0.2099249, -0.5935782, 4.662085, 0, 0.6509804, 1, 1,
0.2156053, 0.6139233, 3.366557, 0, 0.6470588, 1, 1,
0.2165091, -0.8135886, 3.326223, 0, 0.6392157, 1, 1,
0.2181964, 0.08788841, 1.303731, 0, 0.6352941, 1, 1,
0.2182781, 2.227048, 0.3334452, 0, 0.627451, 1, 1,
0.2217163, -1.141321, 2.277557, 0, 0.6235294, 1, 1,
0.2228511, -0.7767493, 0.5600635, 0, 0.6156863, 1, 1,
0.2237005, -0.07459661, 3.689435, 0, 0.6117647, 1, 1,
0.226249, -0.6012323, 2.454019, 0, 0.6039216, 1, 1,
0.2263301, -0.9427379, 3.651115, 0, 0.5960785, 1, 1,
0.2268716, 0.6312618, -0.9091834, 0, 0.5921569, 1, 1,
0.2318011, 0.7554883, 0.6456333, 0, 0.5843138, 1, 1,
0.2331389, -0.3652423, 4.193604, 0, 0.5803922, 1, 1,
0.236643, 0.9648852, 0.3885062, 0, 0.572549, 1, 1,
0.2368674, -0.6440848, 2.925804, 0, 0.5686275, 1, 1,
0.2401053, 1.411453, -0.6496993, 0, 0.5607843, 1, 1,
0.2486162, 0.9495566, -1.806664, 0, 0.5568628, 1, 1,
0.2497693, -0.9987853, 0.8087799, 0, 0.5490196, 1, 1,
0.2530338, 0.2499032, 0.8115795, 0, 0.5450981, 1, 1,
0.2544829, -2.130802, 3.705497, 0, 0.5372549, 1, 1,
0.2547908, 0.2961977, 0.5714927, 0, 0.5333334, 1, 1,
0.2591601, 1.023777, -1.37251, 0, 0.5254902, 1, 1,
0.263163, -1.200765, 2.105591, 0, 0.5215687, 1, 1,
0.2696397, -1.244336, 3.105335, 0, 0.5137255, 1, 1,
0.2716459, 1.874581, 0.2384458, 0, 0.509804, 1, 1,
0.2776527, -1.209993, 3.370058, 0, 0.5019608, 1, 1,
0.2791172, 0.704142, -0.05985406, 0, 0.4941176, 1, 1,
0.2796742, -0.6836063, 3.070565, 0, 0.4901961, 1, 1,
0.280723, -1.567412, 2.772426, 0, 0.4823529, 1, 1,
0.2819173, -1.963052, 3.954696, 0, 0.4784314, 1, 1,
0.2821222, 0.4973706, 0.2942115, 0, 0.4705882, 1, 1,
0.2874554, 0.9499561, -0.04500915, 0, 0.4666667, 1, 1,
0.2891254, 0.614822, 0.5413208, 0, 0.4588235, 1, 1,
0.2911399, 1.421959, -1.221867, 0, 0.454902, 1, 1,
0.2952725, -0.5051131, 3.19299, 0, 0.4470588, 1, 1,
0.2960047, -0.8631537, 2.395943, 0, 0.4431373, 1, 1,
0.299045, 0.05525429, 0.4723912, 0, 0.4352941, 1, 1,
0.2990809, 1.404984, -0.8407015, 0, 0.4313726, 1, 1,
0.3040592, -0.4386023, 1.960112, 0, 0.4235294, 1, 1,
0.3050864, -0.2145983, 0.527366, 0, 0.4196078, 1, 1,
0.3051153, 1.091483, 0.1929245, 0, 0.4117647, 1, 1,
0.3075745, 0.3137391, 3.147781, 0, 0.4078431, 1, 1,
0.3116173, 0.4195736, -0.03683886, 0, 0.4, 1, 1,
0.3137191, -1.458925, 3.911458, 0, 0.3921569, 1, 1,
0.3155655, 0.04899479, 1.150787, 0, 0.3882353, 1, 1,
0.3184268, -0.5873874, 2.569888, 0, 0.3803922, 1, 1,
0.3195598, -0.3936281, 4.491705, 0, 0.3764706, 1, 1,
0.3199975, 0.1525495, 1.579534, 0, 0.3686275, 1, 1,
0.3227933, 0.1934039, 0.2885127, 0, 0.3647059, 1, 1,
0.3241912, 0.258037, 0.2882212, 0, 0.3568628, 1, 1,
0.3283351, 0.5916469, 0.2721226, 0, 0.3529412, 1, 1,
0.3316892, 0.3167267, 2.361585, 0, 0.345098, 1, 1,
0.3365354, -0.0009108002, 2.953691, 0, 0.3411765, 1, 1,
0.338845, -0.7843443, 3.993143, 0, 0.3333333, 1, 1,
0.3416817, -0.261091, 2.60083, 0, 0.3294118, 1, 1,
0.3466077, -1.160907, 2.310473, 0, 0.3215686, 1, 1,
0.3485849, 1.641094, -0.4720419, 0, 0.3176471, 1, 1,
0.3514793, -1.121191, 2.925584, 0, 0.3098039, 1, 1,
0.3630818, 0.9471659, -1.257078, 0, 0.3058824, 1, 1,
0.3698564, -0.7729617, 2.765301, 0, 0.2980392, 1, 1,
0.3738155, 0.07968558, 0.7241428, 0, 0.2901961, 1, 1,
0.3785191, -1.082329, 2.333836, 0, 0.2862745, 1, 1,
0.3795769, 0.4823441, 0.4313354, 0, 0.2784314, 1, 1,
0.3812064, 1.384335, 0.9861503, 0, 0.2745098, 1, 1,
0.3925933, -0.1564323, 0.6876214, 0, 0.2666667, 1, 1,
0.3931901, -1.250516, 1.545521, 0, 0.2627451, 1, 1,
0.3960722, -0.3357276, 2.244778, 0, 0.254902, 1, 1,
0.3975929, -1.398082, 4.747764, 0, 0.2509804, 1, 1,
0.4003337, 0.09493489, 1.83397, 0, 0.2431373, 1, 1,
0.4008669, -1.100621, 5.017093, 0, 0.2392157, 1, 1,
0.4013445, 1.31697, -0.3390976, 0, 0.2313726, 1, 1,
0.4013476, 0.7460271, -0.7507926, 0, 0.227451, 1, 1,
0.4022156, 0.2910829, 2.526731, 0, 0.2196078, 1, 1,
0.4037963, -0.8323939, 2.792514, 0, 0.2156863, 1, 1,
0.4076415, -0.2708711, 3.184839, 0, 0.2078431, 1, 1,
0.4093923, -0.5953214, 3.501956, 0, 0.2039216, 1, 1,
0.4153786, 0.9700956, 0.08136764, 0, 0.1960784, 1, 1,
0.416507, -0.8703132, 2.087602, 0, 0.1882353, 1, 1,
0.4179218, -1.400952, 1.982506, 0, 0.1843137, 1, 1,
0.4188577, 0.2699648, 1.798055, 0, 0.1764706, 1, 1,
0.4203923, -0.2584824, 2.566182, 0, 0.172549, 1, 1,
0.4238338, -0.7188058, 2.981398, 0, 0.1647059, 1, 1,
0.4263128, 0.3346708, 2.109868, 0, 0.1607843, 1, 1,
0.4286906, 0.2104157, -0.7864453, 0, 0.1529412, 1, 1,
0.4287852, 0.9782137, 0.6184269, 0, 0.1490196, 1, 1,
0.4360651, -0.128448, 1.697663, 0, 0.1411765, 1, 1,
0.4362921, -0.4901591, 2.141647, 0, 0.1372549, 1, 1,
0.4369284, -0.1798462, 1.69758, 0, 0.1294118, 1, 1,
0.4387387, 0.9920344, 0.8040685, 0, 0.1254902, 1, 1,
0.43929, 2.911043, 1.180883, 0, 0.1176471, 1, 1,
0.4405786, 0.6569544, -0.005646734, 0, 0.1137255, 1, 1,
0.4412123, 1.329259, 0.5252094, 0, 0.1058824, 1, 1,
0.443149, 0.5091401, 1.301881, 0, 0.09803922, 1, 1,
0.4434598, -0.01631701, 2.090625, 0, 0.09411765, 1, 1,
0.44534, -0.594124, 1.957986, 0, 0.08627451, 1, 1,
0.4465914, 1.921872, 0.1344273, 0, 0.08235294, 1, 1,
0.451308, 2.006371, 1.040845, 0, 0.07450981, 1, 1,
0.453862, 0.1774312, 0.9289933, 0, 0.07058824, 1, 1,
0.455146, 0.7564192, -0.550636, 0, 0.0627451, 1, 1,
0.4554127, 1.861753, -0.08384735, 0, 0.05882353, 1, 1,
0.456698, -0.4093183, 4.283934, 0, 0.05098039, 1, 1,
0.4598517, 0.09598619, 2.288453, 0, 0.04705882, 1, 1,
0.4651302, -1.846627, 2.132902, 0, 0.03921569, 1, 1,
0.466138, -0.6761175, 3.834045, 0, 0.03529412, 1, 1,
0.4663832, 0.1273147, 2.093192, 0, 0.02745098, 1, 1,
0.4664517, 0.9578755, 0.6691636, 0, 0.02352941, 1, 1,
0.4695257, 1.565828, -0.2254478, 0, 0.01568628, 1, 1,
0.4702145, 1.033725, -0.7868387, 0, 0.01176471, 1, 1,
0.471884, 0.5530634, 1.703298, 0, 0.003921569, 1, 1,
0.47288, -0.1643071, 1.653981, 0.003921569, 0, 1, 1,
0.474389, -3.187708, 2.467405, 0.007843138, 0, 1, 1,
0.4845878, -1.177858, 2.140333, 0.01568628, 0, 1, 1,
0.4852043, -1.741771, 3.531753, 0.01960784, 0, 1, 1,
0.4898145, 1.650585, 0.627576, 0.02745098, 0, 1, 1,
0.4964294, -1.514667, 2.229785, 0.03137255, 0, 1, 1,
0.4967032, 1.158923, -0.4402967, 0.03921569, 0, 1, 1,
0.499326, -0.3464706, 3.414822, 0.04313726, 0, 1, 1,
0.5092158, -0.2870398, 2.723585, 0.05098039, 0, 1, 1,
0.5239042, 1.490281, -0.1098332, 0.05490196, 0, 1, 1,
0.524243, -0.4210867, 1.365185, 0.0627451, 0, 1, 1,
0.5250861, 0.461058, 1.018248, 0.06666667, 0, 1, 1,
0.5314094, -1.636733, 2.212035, 0.07450981, 0, 1, 1,
0.5363769, -0.8649516, 2.988794, 0.07843138, 0, 1, 1,
0.5406794, 0.7264667, 0.6057089, 0.08627451, 0, 1, 1,
0.5572437, 0.2876701, -0.1139128, 0.09019608, 0, 1, 1,
0.5609931, -1.473566, 2.230941, 0.09803922, 0, 1, 1,
0.5631336, -0.7457131, 1.773647, 0.1058824, 0, 1, 1,
0.5635574, -0.7515099, 2.554172, 0.1098039, 0, 1, 1,
0.5700364, -0.6350315, 2.336314, 0.1176471, 0, 1, 1,
0.5703653, 0.06366224, 0.6144232, 0.1215686, 0, 1, 1,
0.5713041, -0.5522492, 1.197812, 0.1294118, 0, 1, 1,
0.5733452, -0.05968707, 1.976057, 0.1333333, 0, 1, 1,
0.5808846, -0.5680647, 2.600583, 0.1411765, 0, 1, 1,
0.5810654, 0.284838, 1.974049, 0.145098, 0, 1, 1,
0.5841992, 1.08518, -0.3621998, 0.1529412, 0, 1, 1,
0.5881059, -0.1976131, 1.053718, 0.1568628, 0, 1, 1,
0.589792, -0.5515826, 2.660584, 0.1647059, 0, 1, 1,
0.5900965, -0.7882104, 2.144606, 0.1686275, 0, 1, 1,
0.6019064, 0.09448099, 1.649447, 0.1764706, 0, 1, 1,
0.6063859, 0.07947012, 2.489126, 0.1803922, 0, 1, 1,
0.6098051, -0.5646961, 2.737093, 0.1882353, 0, 1, 1,
0.6131122, -0.3254309, 2.665429, 0.1921569, 0, 1, 1,
0.6151484, 0.07222626, 1.12957, 0.2, 0, 1, 1,
0.6198832, -1.398657, 3.225295, 0.2078431, 0, 1, 1,
0.6201272, 0.02739466, 2.477258, 0.2117647, 0, 1, 1,
0.6201621, -0.5220631, 1.88447, 0.2196078, 0, 1, 1,
0.6213334, 0.1575488, 0.9039367, 0.2235294, 0, 1, 1,
0.6213996, -1.06448, 1.484187, 0.2313726, 0, 1, 1,
0.6216395, 0.02144108, 1.699916, 0.2352941, 0, 1, 1,
0.6263953, 0.9800184, 2.349596, 0.2431373, 0, 1, 1,
0.6273873, 1.866243, 2.196384, 0.2470588, 0, 1, 1,
0.6291041, 1.027142, 0.1013751, 0.254902, 0, 1, 1,
0.6345016, -1.061207, 1.677647, 0.2588235, 0, 1, 1,
0.6373968, 1.017251, 2.796579, 0.2666667, 0, 1, 1,
0.6415592, 0.4561188, 1.649413, 0.2705882, 0, 1, 1,
0.644209, -0.6959543, 1.742487, 0.2784314, 0, 1, 1,
0.6469514, -0.9776663, 2.713927, 0.282353, 0, 1, 1,
0.6477614, -0.2240909, 1.532425, 0.2901961, 0, 1, 1,
0.6551021, -0.3357026, 1.633426, 0.2941177, 0, 1, 1,
0.6578113, 0.5161195, 1.980382, 0.3019608, 0, 1, 1,
0.6578977, -0.1107069, 0.9610611, 0.3098039, 0, 1, 1,
0.6650495, 1.139372, 0.3882479, 0.3137255, 0, 1, 1,
0.6703509, 0.6440669, -0.0922841, 0.3215686, 0, 1, 1,
0.6763902, -1.192199, 2.550788, 0.3254902, 0, 1, 1,
0.6788113, 0.9603181, -0.620073, 0.3333333, 0, 1, 1,
0.6824176, 0.3876683, 1.26531, 0.3372549, 0, 1, 1,
0.6845397, -0.1560141, 2.463904, 0.345098, 0, 1, 1,
0.6885673, -0.6007434, 1.26493, 0.3490196, 0, 1, 1,
0.6930165, 2.452921, 1.236174, 0.3568628, 0, 1, 1,
0.6959835, 1.262517, 1.367144, 0.3607843, 0, 1, 1,
0.6982389, -0.5667665, 1.397321, 0.3686275, 0, 1, 1,
0.7016223, 1.614742, -0.6650416, 0.372549, 0, 1, 1,
0.7045496, 1.215612, -0.4803539, 0.3803922, 0, 1, 1,
0.7058628, 0.3376358, 1.062768, 0.3843137, 0, 1, 1,
0.708137, -0.06478415, 0.8764122, 0.3921569, 0, 1, 1,
0.7194564, 0.09335284, -0.5637661, 0.3960784, 0, 1, 1,
0.720889, 0.7267229, 0.5117542, 0.4039216, 0, 1, 1,
0.7211254, 0.9685464, 2.046939, 0.4117647, 0, 1, 1,
0.7255119, -1.57648, 4.432777, 0.4156863, 0, 1, 1,
0.7267989, 2.216172, -1.049173, 0.4235294, 0, 1, 1,
0.7289665, -0.795992, 4.467441, 0.427451, 0, 1, 1,
0.731131, 0.2054337, 2.528395, 0.4352941, 0, 1, 1,
0.7316731, -2.964342, 3.709173, 0.4392157, 0, 1, 1,
0.7345636, 0.1293687, 2.847487, 0.4470588, 0, 1, 1,
0.7353519, -0.5265931, 3.734433, 0.4509804, 0, 1, 1,
0.7382429, 0.3418405, 1.616755, 0.4588235, 0, 1, 1,
0.7436642, -0.3347346, 2.755773, 0.4627451, 0, 1, 1,
0.744014, -0.5843004, 2.875057, 0.4705882, 0, 1, 1,
0.7524498, 0.294735, 4.549958, 0.4745098, 0, 1, 1,
0.7545928, -1.437998, 1.643973, 0.4823529, 0, 1, 1,
0.7618467, -0.5069803, 2.830888, 0.4862745, 0, 1, 1,
0.7620774, -0.06049057, -0.2828967, 0.4941176, 0, 1, 1,
0.7671348, -0.8418315, 1.502808, 0.5019608, 0, 1, 1,
0.7686355, 0.642234, 2.497382, 0.5058824, 0, 1, 1,
0.7691687, 0.1089163, 2.487946, 0.5137255, 0, 1, 1,
0.7709981, -0.240722, 3.633054, 0.5176471, 0, 1, 1,
0.7742835, 1.675996, -0.252239, 0.5254902, 0, 1, 1,
0.7778416, 0.3426957, 3.29139, 0.5294118, 0, 1, 1,
0.7799023, -0.5397381, 2.066019, 0.5372549, 0, 1, 1,
0.7811963, -0.6721513, 1.082381, 0.5411765, 0, 1, 1,
0.7829674, 1.232484, 2.613074, 0.5490196, 0, 1, 1,
0.7899733, 0.302916, 2.539332, 0.5529412, 0, 1, 1,
0.7942634, -1.169075, 2.665379, 0.5607843, 0, 1, 1,
0.7954935, 1.572803, 1.864323, 0.5647059, 0, 1, 1,
0.7963979, 0.3409645, 0.8917474, 0.572549, 0, 1, 1,
0.7970882, 0.5685524, 0.6648604, 0.5764706, 0, 1, 1,
0.8138983, 0.1357287, 1.183787, 0.5843138, 0, 1, 1,
0.8158831, -1.156571, 3.042042, 0.5882353, 0, 1, 1,
0.8173046, 0.1333278, 0.1345789, 0.5960785, 0, 1, 1,
0.8216722, -1.017549, 2.403423, 0.6039216, 0, 1, 1,
0.8241669, 0.1840062, 1.536163, 0.6078432, 0, 1, 1,
0.8244178, -0.09738018, 1.646461, 0.6156863, 0, 1, 1,
0.8247076, 0.6043847, 2.203957, 0.6196079, 0, 1, 1,
0.8285469, -1.627588, 4.180165, 0.627451, 0, 1, 1,
0.8318777, 2.28859, 0.2751896, 0.6313726, 0, 1, 1,
0.8331392, -1.193119, 2.758664, 0.6392157, 0, 1, 1,
0.8333685, 0.4391391, 1.201644, 0.6431373, 0, 1, 1,
0.8387302, -0.5692051, 1.601539, 0.6509804, 0, 1, 1,
0.8387889, -0.7700493, 2.517241, 0.654902, 0, 1, 1,
0.8435929, 1.815401, 1.111983, 0.6627451, 0, 1, 1,
0.8466358, -1.236237, 3.482464, 0.6666667, 0, 1, 1,
0.8475903, 0.2283796, 1.483629, 0.6745098, 0, 1, 1,
0.8476065, -0.07043563, -0.9022296, 0.6784314, 0, 1, 1,
0.8492463, 0.7309793, 0.1606726, 0.6862745, 0, 1, 1,
0.851293, 0.3241113, 2.820665, 0.6901961, 0, 1, 1,
0.8519596, 0.5830509, 0.06643273, 0.6980392, 0, 1, 1,
0.8533857, 0.832006, 0.921595, 0.7058824, 0, 1, 1,
0.8539316, 0.8936585, 0.1582382, 0.7098039, 0, 1, 1,
0.8555093, 1.293015, 0.2105783, 0.7176471, 0, 1, 1,
0.8646317, 1.15203, -0.2111444, 0.7215686, 0, 1, 1,
0.8646615, -0.1334495, 1.830665, 0.7294118, 0, 1, 1,
0.8678382, -0.7049987, 3.170417, 0.7333333, 0, 1, 1,
0.8687469, 0.3814161, 0.1956227, 0.7411765, 0, 1, 1,
0.8694075, -0.008350775, 2.751965, 0.7450981, 0, 1, 1,
0.875478, -0.9182041, 1.98417, 0.7529412, 0, 1, 1,
0.8759834, 0.1395604, 0.6794034, 0.7568628, 0, 1, 1,
0.8762046, -0.4431559, 2.040361, 0.7647059, 0, 1, 1,
0.8794262, 0.7577083, 1.731939, 0.7686275, 0, 1, 1,
0.8851005, 0.7726756, 1.669199, 0.7764706, 0, 1, 1,
0.8869035, -0.2094338, 2.776087, 0.7803922, 0, 1, 1,
0.89076, 0.1603147, 2.492593, 0.7882353, 0, 1, 1,
0.9018214, -1.55939, 2.771501, 0.7921569, 0, 1, 1,
0.906811, 0.313319, 1.154889, 0.8, 0, 1, 1,
0.9075978, 0.5480843, 1.059185, 0.8078431, 0, 1, 1,
0.9131778, 0.2444997, 0.7708833, 0.8117647, 0, 1, 1,
0.9132152, -1.114958, 0.9901642, 0.8196079, 0, 1, 1,
0.9159893, 0.2535815, 3.212497, 0.8235294, 0, 1, 1,
0.9186282, 1.075592, -0.3134205, 0.8313726, 0, 1, 1,
0.9206914, -1.5449, 2.743113, 0.8352941, 0, 1, 1,
0.9276814, 0.3573306, 3.125927, 0.8431373, 0, 1, 1,
0.9331702, -0.5286291, 2.807292, 0.8470588, 0, 1, 1,
0.9340009, 0.004688839, 1.977238, 0.854902, 0, 1, 1,
0.9345461, -1.324064, 4.477949, 0.8588235, 0, 1, 1,
0.9353178, 0.001771154, 0.9526265, 0.8666667, 0, 1, 1,
0.9412516, 0.6673312, 1.211077, 0.8705882, 0, 1, 1,
0.9424382, 0.2018001, 2.424051, 0.8784314, 0, 1, 1,
0.9471962, -0.7070037, 2.026788, 0.8823529, 0, 1, 1,
0.9515479, -1.765556, 2.86285, 0.8901961, 0, 1, 1,
0.9705993, 1.161233, 1.172033, 0.8941177, 0, 1, 1,
0.9722075, -0.04643264, 2.862239, 0.9019608, 0, 1, 1,
0.9762796, 0.3239798, 1.058455, 0.9098039, 0, 1, 1,
0.9804556, 1.787875, -1.833695, 0.9137255, 0, 1, 1,
0.9860867, 2.137631, 1.937936, 0.9215686, 0, 1, 1,
0.9884361, -0.5234301, 1.383126, 0.9254902, 0, 1, 1,
0.9899885, 1.077497, 0.3527698, 0.9333333, 0, 1, 1,
0.9912229, 1.059481, -0.3588161, 0.9372549, 0, 1, 1,
0.9918351, 0.3891886, 0.8388373, 0.945098, 0, 1, 1,
0.9928104, 1.403076, 1.790877, 0.9490196, 0, 1, 1,
1.003483, 1.369086, 0.9669378, 0.9568627, 0, 1, 1,
1.006969, 1.590576, 1.334584, 0.9607843, 0, 1, 1,
1.012194, 1.888563, 0.7059295, 0.9686275, 0, 1, 1,
1.027014, -0.8724189, 2.475002, 0.972549, 0, 1, 1,
1.035649, 0.6024267, 2.367626, 0.9803922, 0, 1, 1,
1.040451, -1.362695, 2.108912, 0.9843137, 0, 1, 1,
1.047604, 0.5296522, 2.18924, 0.9921569, 0, 1, 1,
1.066501, 0.1395257, 0.1558954, 0.9960784, 0, 1, 1,
1.069518, 0.01981007, 4.022348, 1, 0, 0.9960784, 1,
1.07709, 0.5754123, 1.634435, 1, 0, 0.9882353, 1,
1.078292, -0.8737419, 2.346463, 1, 0, 0.9843137, 1,
1.078342, -0.8927753, 2.178936, 1, 0, 0.9764706, 1,
1.081665, -0.00975992, 1.156094, 1, 0, 0.972549, 1,
1.088945, 1.465509, 1.237968, 1, 0, 0.9647059, 1,
1.09203, -0.7956825, 2.349999, 1, 0, 0.9607843, 1,
1.093312, -0.5447991, 1.559427, 1, 0, 0.9529412, 1,
1.094279, 1.94782, -0.4710958, 1, 0, 0.9490196, 1,
1.096787, 0.733093, 0.2934389, 1, 0, 0.9411765, 1,
1.097029, 1.123458, 0.5888757, 1, 0, 0.9372549, 1,
1.10276, -0.04136251, 2.467225, 1, 0, 0.9294118, 1,
1.104021, -0.4990806, 1.248788, 1, 0, 0.9254902, 1,
1.105977, -1.41524, 2.063965, 1, 0, 0.9176471, 1,
1.108845, 1.557774, 1.601287, 1, 0, 0.9137255, 1,
1.109603, -0.008525652, 0.7622994, 1, 0, 0.9058824, 1,
1.111782, -0.9814164, 0.7657548, 1, 0, 0.9019608, 1,
1.113027, 0.7817112, 0.6085481, 1, 0, 0.8941177, 1,
1.115036, -0.8321548, 2.33526, 1, 0, 0.8862745, 1,
1.124599, 0.09823608, 2.604975, 1, 0, 0.8823529, 1,
1.131621, 0.7109925, 0.1389044, 1, 0, 0.8745098, 1,
1.131772, 1.093996, -1.208256, 1, 0, 0.8705882, 1,
1.146848, 1.125265, 0.2728711, 1, 0, 0.8627451, 1,
1.148292, -1.057206, 3.948836, 1, 0, 0.8588235, 1,
1.150388, -0.497399, 1.256688, 1, 0, 0.8509804, 1,
1.151118, 0.6762663, 0.839261, 1, 0, 0.8470588, 1,
1.159275, -1.119676, 1.279204, 1, 0, 0.8392157, 1,
1.161048, -0.07617632, -0.7142174, 1, 0, 0.8352941, 1,
1.170214, 0.4633271, 2.704467, 1, 0, 0.827451, 1,
1.178053, 0.9416205, 0.465541, 1, 0, 0.8235294, 1,
1.183017, 0.9736993, 1.259829, 1, 0, 0.8156863, 1,
1.183681, -2.047834, 2.581556, 1, 0, 0.8117647, 1,
1.185931, -0.2773843, 2.551645, 1, 0, 0.8039216, 1,
1.187572, -1.495333, 2.983398, 1, 0, 0.7960784, 1,
1.194072, 0.9704639, 1.719759, 1, 0, 0.7921569, 1,
1.196873, 0.8179158, 2.165282, 1, 0, 0.7843137, 1,
1.204307, 0.400543, 2.491541, 1, 0, 0.7803922, 1,
1.206017, 1.300449, 0.618779, 1, 0, 0.772549, 1,
1.208379, 0.4409167, 0.4217631, 1, 0, 0.7686275, 1,
1.214144, 1.238008, 0.4918969, 1, 0, 0.7607843, 1,
1.214468, -2.316599, 1.242255, 1, 0, 0.7568628, 1,
1.217888, 0.5733349, 0.6072205, 1, 0, 0.7490196, 1,
1.218711, 0.7268117, 0.3759923, 1, 0, 0.7450981, 1,
1.227719, 0.1622576, 3.137933, 1, 0, 0.7372549, 1,
1.230064, 3.045078, -1.321709, 1, 0, 0.7333333, 1,
1.231488, 0.3242173, 0.8643045, 1, 0, 0.7254902, 1,
1.248467, -1.104465, 3.554642, 1, 0, 0.7215686, 1,
1.260477, 1.238441, -0.1855702, 1, 0, 0.7137255, 1,
1.260584, -0.2471586, 3.558457, 1, 0, 0.7098039, 1,
1.264591, -2.120616, 3.518697, 1, 0, 0.7019608, 1,
1.274401, -1.125085, 2.443514, 1, 0, 0.6941177, 1,
1.274742, -1.26274, 3.048856, 1, 0, 0.6901961, 1,
1.281507, 1.189495, 2.479473, 1, 0, 0.682353, 1,
1.282056, -0.07989059, 1.864085, 1, 0, 0.6784314, 1,
1.28484, -0.3701926, 1.506518, 1, 0, 0.6705883, 1,
1.28866, -0.1828126, 2.129392, 1, 0, 0.6666667, 1,
1.300753, -0.6245727, 0.9526744, 1, 0, 0.6588235, 1,
1.310751, -0.7002666, 3.933928, 1, 0, 0.654902, 1,
1.316197, -0.2562654, 2.306636, 1, 0, 0.6470588, 1,
1.324195, 0.1108415, 2.345648, 1, 0, 0.6431373, 1,
1.326181, 0.4554249, 3.004514, 1, 0, 0.6352941, 1,
1.330158, 1.591716, 0.6530181, 1, 0, 0.6313726, 1,
1.334415, -1.660317, 2.105062, 1, 0, 0.6235294, 1,
1.340032, 0.5168876, 0.371011, 1, 0, 0.6196079, 1,
1.343847, -1.186523, 3.026125, 1, 0, 0.6117647, 1,
1.348551, 0.9275082, 0.9091758, 1, 0, 0.6078432, 1,
1.349092, 1.494615, 0.5083417, 1, 0, 0.6, 1,
1.362146, -0.09656728, 1.917196, 1, 0, 0.5921569, 1,
1.365717, -0.8885627, 2.224, 1, 0, 0.5882353, 1,
1.369422, -1.276327, 2.475319, 1, 0, 0.5803922, 1,
1.370793, -0.07360674, 1.469002, 1, 0, 0.5764706, 1,
1.382056, 0.467371, 0.6790752, 1, 0, 0.5686275, 1,
1.38789, -0.1022093, 3.033193, 1, 0, 0.5647059, 1,
1.400071, 0.1143594, 0.9392896, 1, 0, 0.5568628, 1,
1.409445, 0.6160688, 2.729968, 1, 0, 0.5529412, 1,
1.418199, 0.786671, 0.7597787, 1, 0, 0.5450981, 1,
1.427795, -1.025134, 1.608238, 1, 0, 0.5411765, 1,
1.429735, 0.2456898, 0.7016444, 1, 0, 0.5333334, 1,
1.458721, -1.461318, 4.31242, 1, 0, 0.5294118, 1,
1.46497, -0.1468279, 3.224339, 1, 0, 0.5215687, 1,
1.470997, 0.2582764, 0.8937714, 1, 0, 0.5176471, 1,
1.474674, -1.24509, 1.961724, 1, 0, 0.509804, 1,
1.482084, 0.824213, 2.647573, 1, 0, 0.5058824, 1,
1.485869, 0.1988185, 1.622515, 1, 0, 0.4980392, 1,
1.497783, -0.3748959, 2.016147, 1, 0, 0.4901961, 1,
1.508829, -0.1424147, 1.921869, 1, 0, 0.4862745, 1,
1.509463, 0.5273349, 1.954555, 1, 0, 0.4784314, 1,
1.515505, -1.526175, 2.897051, 1, 0, 0.4745098, 1,
1.524671, 0.4980039, 0.6937647, 1, 0, 0.4666667, 1,
1.525502, 0.865216, 0.4778871, 1, 0, 0.4627451, 1,
1.534879, 0.6343854, 2.095548, 1, 0, 0.454902, 1,
1.560986, -0.5913935, 2.388103, 1, 0, 0.4509804, 1,
1.56508, -0.4589407, 1.788705, 1, 0, 0.4431373, 1,
1.570418, 0.1629317, 1.38213, 1, 0, 0.4392157, 1,
1.572284, 0.6720693, 0.3090617, 1, 0, 0.4313726, 1,
1.575695, 0.03612922, 2.634667, 1, 0, 0.427451, 1,
1.585708, 1.256427, 0.6618995, 1, 0, 0.4196078, 1,
1.588025, 1.545936, 0.1059575, 1, 0, 0.4156863, 1,
1.595995, 0.02132322, 0.92649, 1, 0, 0.4078431, 1,
1.60339, -0.8422233, 2.212237, 1, 0, 0.4039216, 1,
1.605244, -0.6028239, 1.964219, 1, 0, 0.3960784, 1,
1.610301, -1.06823, 0.06718552, 1, 0, 0.3882353, 1,
1.629516, -0.634151, 2.554133, 1, 0, 0.3843137, 1,
1.633483, -0.07200674, 1.621048, 1, 0, 0.3764706, 1,
1.653636, -0.3542639, 3.347717, 1, 0, 0.372549, 1,
1.705751, 1.085877, 1.231767, 1, 0, 0.3647059, 1,
1.711461, 1.338737, -0.6102431, 1, 0, 0.3607843, 1,
1.712115, 0.06019344, 2.584848, 1, 0, 0.3529412, 1,
1.713231, -0.2706704, 2.306417, 1, 0, 0.3490196, 1,
1.717417, -1.196459, 2.234168, 1, 0, 0.3411765, 1,
1.718256, -0.3426082, 1.863904, 1, 0, 0.3372549, 1,
1.736896, 0.1991953, 0.5647979, 1, 0, 0.3294118, 1,
1.742661, -1.1694, 3.047094, 1, 0, 0.3254902, 1,
1.760898, 1.012285, 1.004399, 1, 0, 0.3176471, 1,
1.765879, 0.3408827, -0.6481947, 1, 0, 0.3137255, 1,
1.780759, -0.5033914, 0.9869597, 1, 0, 0.3058824, 1,
1.794266, 0.1425932, 0.7053632, 1, 0, 0.2980392, 1,
1.801572, -0.01867726, 0.4554491, 1, 0, 0.2941177, 1,
1.806767, -0.6060287, 1.501452, 1, 0, 0.2862745, 1,
1.815772, 0.2832611, 1.879083, 1, 0, 0.282353, 1,
1.824787, 0.07047696, 1.010536, 1, 0, 0.2745098, 1,
1.832013, 0.9935386, 1.777005, 1, 0, 0.2705882, 1,
1.848742, -2.301265, 2.570601, 1, 0, 0.2627451, 1,
1.851313, -0.06938546, 1.97287, 1, 0, 0.2588235, 1,
1.852181, -0.3245919, 3.053077, 1, 0, 0.2509804, 1,
1.866226, -0.2314842, 1.222005, 1, 0, 0.2470588, 1,
1.867501, -0.6616322, 1.624205, 1, 0, 0.2392157, 1,
1.879697, 1.014784, 0.9566187, 1, 0, 0.2352941, 1,
1.915806, 0.3678281, 2.430717, 1, 0, 0.227451, 1,
1.922983, -0.3383987, 2.632669, 1, 0, 0.2235294, 1,
1.923014, -0.6349611, 2.760965, 1, 0, 0.2156863, 1,
1.942305, 0.5703447, 1.908404, 1, 0, 0.2117647, 1,
1.951533, -0.4224598, 2.18442, 1, 0, 0.2039216, 1,
1.957115, 0.2801136, -1.012068, 1, 0, 0.1960784, 1,
1.959221, -0.1684196, 3.15821, 1, 0, 0.1921569, 1,
1.99681, 0.05963214, 2.157081, 1, 0, 0.1843137, 1,
2.006259, -0.3182735, -0.4175804, 1, 0, 0.1803922, 1,
2.00763, -0.7275459, 2.206645, 1, 0, 0.172549, 1,
2.011837, 0.792148, 2.509048, 1, 0, 0.1686275, 1,
2.030359, 1.079471, 1.995905, 1, 0, 0.1607843, 1,
2.031888, 0.2320651, 0.4139479, 1, 0, 0.1568628, 1,
2.033604, 0.1074665, 1.628437, 1, 0, 0.1490196, 1,
2.045257, 1.843105, -1.107763, 1, 0, 0.145098, 1,
2.067198, -0.09025762, 1.920817, 1, 0, 0.1372549, 1,
2.081939, -1.016138, 1.618195, 1, 0, 0.1333333, 1,
2.090459, -0.1596455, 0.6990656, 1, 0, 0.1254902, 1,
2.097084, 0.4721518, 2.150694, 1, 0, 0.1215686, 1,
2.101562, -0.2316424, 0.7909566, 1, 0, 0.1137255, 1,
2.128826, 1.042364, 0.7603366, 1, 0, 0.1098039, 1,
2.146667, -0.9427871, 2.366657, 1, 0, 0.1019608, 1,
2.151468, -1.130385, 0.1515065, 1, 0, 0.09411765, 1,
2.163372, -0.8554011, 1.846363, 1, 0, 0.09019608, 1,
2.235966, -0.4466598, 1.724411, 1, 0, 0.08235294, 1,
2.266802, 0.07360132, 2.213232, 1, 0, 0.07843138, 1,
2.320556, -0.08456533, -0.9006484, 1, 0, 0.07058824, 1,
2.336753, -0.001341629, 1.960422, 1, 0, 0.06666667, 1,
2.346847, 0.9044495, 0.7630113, 1, 0, 0.05882353, 1,
2.376694, -0.8391502, 3.014039, 1, 0, 0.05490196, 1,
2.464315, -0.4961235, 1.327654, 1, 0, 0.04705882, 1,
2.470192, 0.2664306, 0.8779854, 1, 0, 0.04313726, 1,
2.476089, -0.07874744, 3.424024, 1, 0, 0.03529412, 1,
2.599306, -0.4691733, -0.1501582, 1, 0, 0.03137255, 1,
2.614983, 1.241379, 1.115103, 1, 0, 0.02352941, 1,
2.848122, -0.1585259, 0.9543603, 1, 0, 0.01960784, 1,
3.12048, 0.6963589, 2.237442, 1, 0, 0.01176471, 1,
3.634582, 0.511272, 0.8983381, 1, 0, 0.007843138, 1
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
0.3597002, -4.244165, -6.678476, 0, -0.5, 0.5, 0.5,
0.3597002, -4.244165, -6.678476, 1, -0.5, 0.5, 0.5,
0.3597002, -4.244165, -6.678476, 1, 1.5, 0.5, 0.5,
0.3597002, -4.244165, -6.678476, 0, 1.5, 0.5, 0.5
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
-4.025366, -0.07131505, -6.678476, 0, -0.5, 0.5, 0.5,
-4.025366, -0.07131505, -6.678476, 1, -0.5, 0.5, 0.5,
-4.025366, -0.07131505, -6.678476, 1, 1.5, 0.5, 0.5,
-4.025366, -0.07131505, -6.678476, 0, 1.5, 0.5, 0.5
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
-4.025366, -4.244165, 0.01684952, 0, -0.5, 0.5, 0.5,
-4.025366, -4.244165, 0.01684952, 1, -0.5, 0.5, 0.5,
-4.025366, -4.244165, 0.01684952, 1, 1.5, 0.5, 0.5,
-4.025366, -4.244165, 0.01684952, 0, 1.5, 0.5, 0.5
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
-2, -3.281199, -5.133401,
3, -3.281199, -5.133401,
-2, -3.281199, -5.133401,
-2, -3.441694, -5.390913,
-1, -3.281199, -5.133401,
-1, -3.441694, -5.390913,
0, -3.281199, -5.133401,
0, -3.441694, -5.390913,
1, -3.281199, -5.133401,
1, -3.441694, -5.390913,
2, -3.281199, -5.133401,
2, -3.441694, -5.390913,
3, -3.281199, -5.133401,
3, -3.441694, -5.390913
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
-2, -3.762682, -5.905939, 0, -0.5, 0.5, 0.5,
-2, -3.762682, -5.905939, 1, -0.5, 0.5, 0.5,
-2, -3.762682, -5.905939, 1, 1.5, 0.5, 0.5,
-2, -3.762682, -5.905939, 0, 1.5, 0.5, 0.5,
-1, -3.762682, -5.905939, 0, -0.5, 0.5, 0.5,
-1, -3.762682, -5.905939, 1, -0.5, 0.5, 0.5,
-1, -3.762682, -5.905939, 1, 1.5, 0.5, 0.5,
-1, -3.762682, -5.905939, 0, 1.5, 0.5, 0.5,
0, -3.762682, -5.905939, 0, -0.5, 0.5, 0.5,
0, -3.762682, -5.905939, 1, -0.5, 0.5, 0.5,
0, -3.762682, -5.905939, 1, 1.5, 0.5, 0.5,
0, -3.762682, -5.905939, 0, 1.5, 0.5, 0.5,
1, -3.762682, -5.905939, 0, -0.5, 0.5, 0.5,
1, -3.762682, -5.905939, 1, -0.5, 0.5, 0.5,
1, -3.762682, -5.905939, 1, 1.5, 0.5, 0.5,
1, -3.762682, -5.905939, 0, 1.5, 0.5, 0.5,
2, -3.762682, -5.905939, 0, -0.5, 0.5, 0.5,
2, -3.762682, -5.905939, 1, -0.5, 0.5, 0.5,
2, -3.762682, -5.905939, 1, 1.5, 0.5, 0.5,
2, -3.762682, -5.905939, 0, 1.5, 0.5, 0.5,
3, -3.762682, -5.905939, 0, -0.5, 0.5, 0.5,
3, -3.762682, -5.905939, 1, -0.5, 0.5, 0.5,
3, -3.762682, -5.905939, 1, 1.5, 0.5, 0.5,
3, -3.762682, -5.905939, 0, 1.5, 0.5, 0.5
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
-3.013427, -3, -5.133401,
-3.013427, 3, -5.133401,
-3.013427, -3, -5.133401,
-3.182084, -3, -5.390913,
-3.013427, -2, -5.133401,
-3.182084, -2, -5.390913,
-3.013427, -1, -5.133401,
-3.182084, -1, -5.390913,
-3.013427, 0, -5.133401,
-3.182084, 0, -5.390913,
-3.013427, 1, -5.133401,
-3.182084, 1, -5.390913,
-3.013427, 2, -5.133401,
-3.182084, 2, -5.390913,
-3.013427, 3, -5.133401,
-3.182084, 3, -5.390913
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
-3.519397, -3, -5.905939, 0, -0.5, 0.5, 0.5,
-3.519397, -3, -5.905939, 1, -0.5, 0.5, 0.5,
-3.519397, -3, -5.905939, 1, 1.5, 0.5, 0.5,
-3.519397, -3, -5.905939, 0, 1.5, 0.5, 0.5,
-3.519397, -2, -5.905939, 0, -0.5, 0.5, 0.5,
-3.519397, -2, -5.905939, 1, -0.5, 0.5, 0.5,
-3.519397, -2, -5.905939, 1, 1.5, 0.5, 0.5,
-3.519397, -2, -5.905939, 0, 1.5, 0.5, 0.5,
-3.519397, -1, -5.905939, 0, -0.5, 0.5, 0.5,
-3.519397, -1, -5.905939, 1, -0.5, 0.5, 0.5,
-3.519397, -1, -5.905939, 1, 1.5, 0.5, 0.5,
-3.519397, -1, -5.905939, 0, 1.5, 0.5, 0.5,
-3.519397, 0, -5.905939, 0, -0.5, 0.5, 0.5,
-3.519397, 0, -5.905939, 1, -0.5, 0.5, 0.5,
-3.519397, 0, -5.905939, 1, 1.5, 0.5, 0.5,
-3.519397, 0, -5.905939, 0, 1.5, 0.5, 0.5,
-3.519397, 1, -5.905939, 0, -0.5, 0.5, 0.5,
-3.519397, 1, -5.905939, 1, -0.5, 0.5, 0.5,
-3.519397, 1, -5.905939, 1, 1.5, 0.5, 0.5,
-3.519397, 1, -5.905939, 0, 1.5, 0.5, 0.5,
-3.519397, 2, -5.905939, 0, -0.5, 0.5, 0.5,
-3.519397, 2, -5.905939, 1, -0.5, 0.5, 0.5,
-3.519397, 2, -5.905939, 1, 1.5, 0.5, 0.5,
-3.519397, 2, -5.905939, 0, 1.5, 0.5, 0.5,
-3.519397, 3, -5.905939, 0, -0.5, 0.5, 0.5,
-3.519397, 3, -5.905939, 1, -0.5, 0.5, 0.5,
-3.519397, 3, -5.905939, 1, 1.5, 0.5, 0.5,
-3.519397, 3, -5.905939, 0, 1.5, 0.5, 0.5
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
-3.013427, -3.281199, -4,
-3.013427, -3.281199, 4,
-3.013427, -3.281199, -4,
-3.182084, -3.441694, -4,
-3.013427, -3.281199, -2,
-3.182084, -3.441694, -2,
-3.013427, -3.281199, 0,
-3.182084, -3.441694, 0,
-3.013427, -3.281199, 2,
-3.182084, -3.441694, 2,
-3.013427, -3.281199, 4,
-3.182084, -3.441694, 4
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
-3.519397, -3.762682, -4, 0, -0.5, 0.5, 0.5,
-3.519397, -3.762682, -4, 1, -0.5, 0.5, 0.5,
-3.519397, -3.762682, -4, 1, 1.5, 0.5, 0.5,
-3.519397, -3.762682, -4, 0, 1.5, 0.5, 0.5,
-3.519397, -3.762682, -2, 0, -0.5, 0.5, 0.5,
-3.519397, -3.762682, -2, 1, -0.5, 0.5, 0.5,
-3.519397, -3.762682, -2, 1, 1.5, 0.5, 0.5,
-3.519397, -3.762682, -2, 0, 1.5, 0.5, 0.5,
-3.519397, -3.762682, 0, 0, -0.5, 0.5, 0.5,
-3.519397, -3.762682, 0, 1, -0.5, 0.5, 0.5,
-3.519397, -3.762682, 0, 1, 1.5, 0.5, 0.5,
-3.519397, -3.762682, 0, 0, 1.5, 0.5, 0.5,
-3.519397, -3.762682, 2, 0, -0.5, 0.5, 0.5,
-3.519397, -3.762682, 2, 1, -0.5, 0.5, 0.5,
-3.519397, -3.762682, 2, 1, 1.5, 0.5, 0.5,
-3.519397, -3.762682, 2, 0, 1.5, 0.5, 0.5,
-3.519397, -3.762682, 4, 0, -0.5, 0.5, 0.5,
-3.519397, -3.762682, 4, 1, -0.5, 0.5, 0.5,
-3.519397, -3.762682, 4, 1, 1.5, 0.5, 0.5,
-3.519397, -3.762682, 4, 0, 1.5, 0.5, 0.5
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
-3.013427, -3.281199, -5.133401,
-3.013427, 3.138569, -5.133401,
-3.013427, -3.281199, 5.1671,
-3.013427, 3.138569, 5.1671,
-3.013427, -3.281199, -5.133401,
-3.013427, -3.281199, 5.1671,
-3.013427, 3.138569, -5.133401,
-3.013427, 3.138569, 5.1671,
-3.013427, -3.281199, -5.133401,
3.732828, -3.281199, -5.133401,
-3.013427, -3.281199, 5.1671,
3.732828, -3.281199, 5.1671,
-3.013427, 3.138569, -5.133401,
3.732828, 3.138569, -5.133401,
-3.013427, 3.138569, 5.1671,
3.732828, 3.138569, 5.1671,
3.732828, -3.281199, -5.133401,
3.732828, 3.138569, -5.133401,
3.732828, -3.281199, 5.1671,
3.732828, 3.138569, 5.1671,
3.732828, -3.281199, -5.133401,
3.732828, -3.281199, 5.1671,
3.732828, 3.138569, -5.133401,
3.732828, 3.138569, 5.1671
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
var radius = 7.414945;
var distance = 32.98993;
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
mvMatrix.translate( -0.3597002, 0.07131505, -0.01684952 );
mvMatrix.scale( 1.18839, 1.248828, 0.7783295 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.98993);
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
benzoate<-read.table("benzoate.xyz")
```

```
## Error in read.table("benzoate.xyz"): no lines available in input
```

```r
x<-benzoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzoate' not found
```

```r
y<-benzoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzoate' not found
```

```r
z<-benzoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzoate' not found
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
-2.915181, -0.5173862, -1.098947, 0, 0, 1, 1, 1,
-2.70617, 0.5375566, -0.5463817, 1, 0, 0, 1, 1,
-2.701937, 0.7360289, -1.277358, 1, 0, 0, 1, 1,
-2.583776, -1.02174, -0.7687289, 1, 0, 0, 1, 1,
-2.479195, 1.304329, -1.20364, 1, 0, 0, 1, 1,
-2.446231, 0.01495169, -1.258165, 1, 0, 0, 1, 1,
-2.420252, -0.2676074, -2.093554, 0, 0, 0, 1, 1,
-2.322197, 0.7285324, -0.5381501, 0, 0, 0, 1, 1,
-2.319111, -1.040927, -3.409327, 0, 0, 0, 1, 1,
-2.299247, 2.088362, -1.003044, 0, 0, 0, 1, 1,
-2.283146, -0.861269, -3.588247, 0, 0, 0, 1, 1,
-2.282521, 1.911765, -2.278088, 0, 0, 0, 1, 1,
-2.26058, -0.3328628, -1.944761, 0, 0, 0, 1, 1,
-2.25562, -1.042454, -0.9029105, 1, 1, 1, 1, 1,
-2.219651, 0.06366683, -1.606139, 1, 1, 1, 1, 1,
-2.198258, -1.297588, -2.820931, 1, 1, 1, 1, 1,
-2.193604, -1.72181, -1.110691, 1, 1, 1, 1, 1,
-2.141276, 0.6704547, -0.2370207, 1, 1, 1, 1, 1,
-2.049237, 2.104077, 0.40401, 1, 1, 1, 1, 1,
-2.012502, -1.160454, -1.907636, 1, 1, 1, 1, 1,
-2.003577, -2.583894, -1.676354, 1, 1, 1, 1, 1,
-2.003027, -0.3546517, -3.033549, 1, 1, 1, 1, 1,
-2.001507, 0.8575051, -2.069762, 1, 1, 1, 1, 1,
-1.986521, 1.169031, -0.1103153, 1, 1, 1, 1, 1,
-1.978595, 2.178771, -1.69273, 1, 1, 1, 1, 1,
-1.97783, 1.98655, -2.049612, 1, 1, 1, 1, 1,
-1.951851, 0.5090637, -0.776808, 1, 1, 1, 1, 1,
-1.923892, -0.04190001, -1.995427, 1, 1, 1, 1, 1,
-1.89807, 1.281353, 0.2521518, 0, 0, 1, 1, 1,
-1.879732, -0.9223086, -0.1232649, 1, 0, 0, 1, 1,
-1.867561, 1.047109, -0.7810057, 1, 0, 0, 1, 1,
-1.864341, -0.06446113, -2.129868, 1, 0, 0, 1, 1,
-1.85973, -0.2045067, -1.501874, 1, 0, 0, 1, 1,
-1.851793, -1.509471, -1.384976, 1, 0, 0, 1, 1,
-1.850066, 1.221669, -0.1570058, 0, 0, 0, 1, 1,
-1.837418, -1.532527, -1.075095, 0, 0, 0, 1, 1,
-1.807449, -0.9065393, 0.07373667, 0, 0, 0, 1, 1,
-1.794506, -0.2905018, -1.83325, 0, 0, 0, 1, 1,
-1.794253, 0.08507702, -2.728018, 0, 0, 0, 1, 1,
-1.793795, -0.5262714, -2.279516, 0, 0, 0, 1, 1,
-1.782898, 0.3112787, -3.184113, 0, 0, 0, 1, 1,
-1.780537, -0.1129832, -3.973807, 1, 1, 1, 1, 1,
-1.757353, -1.022383, -1.568581, 1, 1, 1, 1, 1,
-1.747404, 1.623157, -1.843505, 1, 1, 1, 1, 1,
-1.737455, 0.5231345, -1.250148, 1, 1, 1, 1, 1,
-1.712222, 0.8216507, -1.540909, 1, 1, 1, 1, 1,
-1.702361, 0.6063573, -1.724379, 1, 1, 1, 1, 1,
-1.693676, 1.648624, -1.981955, 1, 1, 1, 1, 1,
-1.683453, -0.2217952, -1.259564, 1, 1, 1, 1, 1,
-1.674943, -0.08076689, -2.358252, 1, 1, 1, 1, 1,
-1.673688, -1.939935, -2.061075, 1, 1, 1, 1, 1,
-1.607917, -1.083323, -1.184886, 1, 1, 1, 1, 1,
-1.606389, -0.7816549, -3.3473, 1, 1, 1, 1, 1,
-1.605531, 0.8197671, -2.495536, 1, 1, 1, 1, 1,
-1.596607, 0.5594504, 0.1980492, 1, 1, 1, 1, 1,
-1.591, -0.6873986, -0.4777736, 1, 1, 1, 1, 1,
-1.568934, 0.115376, -2.311732, 0, 0, 1, 1, 1,
-1.549859, 0.4100283, -0.5875072, 1, 0, 0, 1, 1,
-1.548556, -0.3075549, -1.551103, 1, 0, 0, 1, 1,
-1.522842, -0.9738547, -3.550938, 1, 0, 0, 1, 1,
-1.518785, 1.364797, 0.5592218, 1, 0, 0, 1, 1,
-1.517355, 1.284993, -0.6783643, 1, 0, 0, 1, 1,
-1.509642, 1.342015, 1.551649, 0, 0, 0, 1, 1,
-1.503718, 0.8258704, 0.8623342, 0, 0, 0, 1, 1,
-1.492973, -1.050941, -2.427771, 0, 0, 0, 1, 1,
-1.457224, -1.186347, -1.302883, 0, 0, 0, 1, 1,
-1.42863, 0.4206376, -1.144261, 0, 0, 0, 1, 1,
-1.428397, -1.255577, -3.661966, 0, 0, 0, 1, 1,
-1.422788, 1.636533, -2.274408, 0, 0, 0, 1, 1,
-1.420258, 0.6180728, -1.517089, 1, 1, 1, 1, 1,
-1.418827, 0.4672045, -1.344538, 1, 1, 1, 1, 1,
-1.403926, -0.5534601, -1.091583, 1, 1, 1, 1, 1,
-1.400633, 0.5721646, -0.3900527, 1, 1, 1, 1, 1,
-1.386141, 0.0004179268, -2.062605, 1, 1, 1, 1, 1,
-1.382589, 0.9174603, -1.335895, 1, 1, 1, 1, 1,
-1.366975, -0.9284109, -2.709935, 1, 1, 1, 1, 1,
-1.36594, -1.713291, -2.101749, 1, 1, 1, 1, 1,
-1.35691, -0.1131771, -1.228919, 1, 1, 1, 1, 1,
-1.351149, -0.3149673, -1.582134, 1, 1, 1, 1, 1,
-1.350122, 0.2164757, -1.803706, 1, 1, 1, 1, 1,
-1.338307, 1.02613, -1.180712, 1, 1, 1, 1, 1,
-1.332163, 0.85872, -2.628664, 1, 1, 1, 1, 1,
-1.326268, -2.244275, -2.442991, 1, 1, 1, 1, 1,
-1.317259, 1.16721, 0.3985082, 1, 1, 1, 1, 1,
-1.309491, -0.8154889, -1.438577, 0, 0, 1, 1, 1,
-1.302119, -0.6813688, -2.807802, 1, 0, 0, 1, 1,
-1.291348, 0.3135918, -0.9822417, 1, 0, 0, 1, 1,
-1.290075, 1.000076, -3.768374, 1, 0, 0, 1, 1,
-1.289402, -0.6776575, -2.502926, 1, 0, 0, 1, 1,
-1.2832, -0.3291893, -2.12255, 1, 0, 0, 1, 1,
-1.276477, -0.3897793, -2.684164, 0, 0, 0, 1, 1,
-1.268573, 0.03426545, -2.549886, 0, 0, 0, 1, 1,
-1.257204, 0.07123962, -0.7470745, 0, 0, 0, 1, 1,
-1.25323, 0.3793428, 0.03290897, 0, 0, 0, 1, 1,
-1.252966, -0.78519, -1.253311, 0, 0, 0, 1, 1,
-1.24121, 0.3189704, -0.2939838, 0, 0, 0, 1, 1,
-1.237916, 1.787023, 0.04838315, 0, 0, 0, 1, 1,
-1.234047, 0.863273, 2.464928, 1, 1, 1, 1, 1,
-1.216819, 0.08819929, -0.9423763, 1, 1, 1, 1, 1,
-1.212929, -0.3153546, -1.175378, 1, 1, 1, 1, 1,
-1.195369, -1.270767, -2.927822, 1, 1, 1, 1, 1,
-1.188835, -1.23732, -1.959279, 1, 1, 1, 1, 1,
-1.184222, -0.9598225, -1.906924, 1, 1, 1, 1, 1,
-1.180742, 1.044074, -2.854187, 1, 1, 1, 1, 1,
-1.174878, 0.6502016, 0.2207828, 1, 1, 1, 1, 1,
-1.165358, -0.4944342, -2.350402, 1, 1, 1, 1, 1,
-1.149477, -1.070162, -2.621939, 1, 1, 1, 1, 1,
-1.144964, -0.1795838, 0.1277019, 1, 1, 1, 1, 1,
-1.142967, 1.038307, -0.05085153, 1, 1, 1, 1, 1,
-1.132725, 0.6126257, -0.6994443, 1, 1, 1, 1, 1,
-1.130648, 1.12446, -0.8383531, 1, 1, 1, 1, 1,
-1.12976, -1.104316, -2.065374, 1, 1, 1, 1, 1,
-1.125875, -1.2257, -1.875666, 0, 0, 1, 1, 1,
-1.10453, -1.018991, -2.357803, 1, 0, 0, 1, 1,
-1.104434, 0.5046191, -0.5689104, 1, 0, 0, 1, 1,
-1.100493, 1.359214, 0.3823183, 1, 0, 0, 1, 1,
-1.091017, -1.149421, -2.421304, 1, 0, 0, 1, 1,
-1.090165, -1.052336, -2.484304, 1, 0, 0, 1, 1,
-1.089593, 1.956191, -0.4223649, 0, 0, 0, 1, 1,
-1.087272, 0.303439, -0.7812792, 0, 0, 0, 1, 1,
-1.080093, -0.2468637, -1.94638, 0, 0, 0, 1, 1,
-1.079454, 0.4135172, 1.573594, 0, 0, 0, 1, 1,
-1.072458, -1.068639, -3.053645, 0, 0, 0, 1, 1,
-1.062818, -0.5028661, -1.679939, 0, 0, 0, 1, 1,
-1.059858, 0.4600811, -0.5730338, 0, 0, 0, 1, 1,
-1.049393, -1.063329, -1.35285, 1, 1, 1, 1, 1,
-1.047913, -1.676871, -3.665488, 1, 1, 1, 1, 1,
-1.046099, -0.3944452, -1.942861, 1, 1, 1, 1, 1,
-1.04054, 1.18992, 0.1883879, 1, 1, 1, 1, 1,
-1.039902, 0.7819415, -0.2432175, 1, 1, 1, 1, 1,
-1.03915, -0.1039013, -1.571904, 1, 1, 1, 1, 1,
-1.0368, 0.1322056, -1.164549, 1, 1, 1, 1, 1,
-1.034145, -0.745619, -1.537377, 1, 1, 1, 1, 1,
-1.030821, 1.211923, -1.587613, 1, 1, 1, 1, 1,
-1.027723, -0.4720276, -3.923559, 1, 1, 1, 1, 1,
-1.026866, 1.724746, 0.6295788, 1, 1, 1, 1, 1,
-1.026522, 0.8105918, -0.6701774, 1, 1, 1, 1, 1,
-1.011209, 0.3402109, -0.504284, 1, 1, 1, 1, 1,
-0.9967398, 0.244687, -1.618815, 1, 1, 1, 1, 1,
-0.994068, 1.288601, 0.3624, 1, 1, 1, 1, 1,
-0.9891838, 1.008422, -1.53115, 0, 0, 1, 1, 1,
-0.9850331, 1.802122, 1.13998, 1, 0, 0, 1, 1,
-0.9849182, 0.5301104, -2.697278, 1, 0, 0, 1, 1,
-0.9839474, -1.82063, -3.483027, 1, 0, 0, 1, 1,
-0.9767829, -1.434647, -3.889039, 1, 0, 0, 1, 1,
-0.9759713, -1.737382, -2.982408, 1, 0, 0, 1, 1,
-0.9722597, -0.4183765, -2.635384, 0, 0, 0, 1, 1,
-0.9663553, -0.08668292, -1.368072, 0, 0, 0, 1, 1,
-0.9567116, -0.9370278, -0.7506866, 0, 0, 0, 1, 1,
-0.9566703, 0.7588353, -0.2365419, 0, 0, 0, 1, 1,
-0.9564296, 0.8127849, -1.042711, 0, 0, 0, 1, 1,
-0.9537078, -0.4490976, -2.668066, 0, 0, 0, 1, 1,
-0.9519346, 1.40665, -1.572677, 0, 0, 0, 1, 1,
-0.9514381, 0.470928, -1.176702, 1, 1, 1, 1, 1,
-0.9486709, -1.352462, -3.294746, 1, 1, 1, 1, 1,
-0.9469522, -0.9886807, -1.624842, 1, 1, 1, 1, 1,
-0.9300773, -1.689898, -2.860056, 1, 1, 1, 1, 1,
-0.9291103, -0.7563071, -1.483864, 1, 1, 1, 1, 1,
-0.9275939, 1.30578, -0.194647, 1, 1, 1, 1, 1,
-0.9247301, -0.3674526, -1.528002, 1, 1, 1, 1, 1,
-0.9221336, -0.2384814, -2.090696, 1, 1, 1, 1, 1,
-0.9166288, 0.5333227, -1.850114, 1, 1, 1, 1, 1,
-0.9134812, -0.2673981, -1.623948, 1, 1, 1, 1, 1,
-0.9127506, 0.312225, -2.829438, 1, 1, 1, 1, 1,
-0.9106597, 0.197228, -2.383998, 1, 1, 1, 1, 1,
-0.9079514, 0.2620369, -1.757141, 1, 1, 1, 1, 1,
-0.9057864, 1.142847, -0.6774361, 1, 1, 1, 1, 1,
-0.8988306, 1.729962, -1.79856, 1, 1, 1, 1, 1,
-0.8935485, 0.899648, -0.6695306, 0, 0, 1, 1, 1,
-0.8884468, 0.6903746, -1.931945, 1, 0, 0, 1, 1,
-0.8845375, -0.2751974, -1.006876, 1, 0, 0, 1, 1,
-0.8818749, -0.878933, -2.600008, 1, 0, 0, 1, 1,
-0.8800176, -1.258157, -3.176351, 1, 0, 0, 1, 1,
-0.8724626, -0.05944498, -2.527476, 1, 0, 0, 1, 1,
-0.8724521, -1.622448, -2.848068, 0, 0, 0, 1, 1,
-0.8711953, -0.6001017, -1.43546, 0, 0, 0, 1, 1,
-0.8557768, -0.8398385, 0.5829223, 0, 0, 0, 1, 1,
-0.8491411, -0.007539984, -0.7999826, 0, 0, 0, 1, 1,
-0.8481804, 0.1690118, -2.071976, 0, 0, 0, 1, 1,
-0.8478253, 0.7154082, -2.016032, 0, 0, 0, 1, 1,
-0.8426011, -0.8122212, -2.234585, 0, 0, 0, 1, 1,
-0.8404839, -0.7422549, -1.57651, 1, 1, 1, 1, 1,
-0.8390713, 1.686156, 0.2585636, 1, 1, 1, 1, 1,
-0.8360749, 1.639823, 0.02348797, 1, 1, 1, 1, 1,
-0.8300713, -0.4913535, -1.414212, 1, 1, 1, 1, 1,
-0.8263274, 0.1993556, -0.2641477, 1, 1, 1, 1, 1,
-0.8180473, 0.631709, -1.037597, 1, 1, 1, 1, 1,
-0.8152874, -0.9703674, -4.10775, 1, 1, 1, 1, 1,
-0.8129429, -0.4636122, -2.753965, 1, 1, 1, 1, 1,
-0.8116774, 0.2063931, -0.4021183, 1, 1, 1, 1, 1,
-0.8079351, 2.140719, -1.065858, 1, 1, 1, 1, 1,
-0.8005763, 0.1410746, 0.287232, 1, 1, 1, 1, 1,
-0.7994493, -0.04930365, -2.965162, 1, 1, 1, 1, 1,
-0.7983301, -1.22213, -2.791985, 1, 1, 1, 1, 1,
-0.7931395, 0.2059212, -0.583928, 1, 1, 1, 1, 1,
-0.7928692, 2.573163, -0.4594111, 1, 1, 1, 1, 1,
-0.7812918, -0.08519283, -2.377697, 0, 0, 1, 1, 1,
-0.7713476, -1.283061, -3.785641, 1, 0, 0, 1, 1,
-0.7695082, 1.250741, -0.07954357, 1, 0, 0, 1, 1,
-0.7686031, -0.05775608, -1.33976, 1, 0, 0, 1, 1,
-0.7645525, 1.688626, 0.02370456, 1, 0, 0, 1, 1,
-0.7599096, 1.480312, -2.892194, 1, 0, 0, 1, 1,
-0.7381509, 0.4829227, 0.6912538, 0, 0, 0, 1, 1,
-0.7370426, -0.3041978, -2.451598, 0, 0, 0, 1, 1,
-0.7368495, 0.6934313, -0.4319881, 0, 0, 0, 1, 1,
-0.7347983, 0.6968209, -1.550916, 0, 0, 0, 1, 1,
-0.7189921, -1.208414, -3.055594, 0, 0, 0, 1, 1,
-0.7105487, 0.7308668, -0.5678045, 0, 0, 0, 1, 1,
-0.7093386, 1.130845, -1.672741, 0, 0, 0, 1, 1,
-0.7047896, 1.438538, -0.2806986, 1, 1, 1, 1, 1,
-0.7032655, -0.5186715, -2.776675, 1, 1, 1, 1, 1,
-0.7019904, 0.2041434, -1.264485, 1, 1, 1, 1, 1,
-0.6932127, 0.6949652, -2.30777, 1, 1, 1, 1, 1,
-0.6923553, -0.3304395, -1.119003, 1, 1, 1, 1, 1,
-0.6919484, -0.7233093, -2.255238, 1, 1, 1, 1, 1,
-0.690346, -0.1467176, -2.907551, 1, 1, 1, 1, 1,
-0.6889403, 0.05183447, -3.299076, 1, 1, 1, 1, 1,
-0.6760886, -0.4086069, -1.977154, 1, 1, 1, 1, 1,
-0.6745141, 2.285898, -0.01151118, 1, 1, 1, 1, 1,
-0.6736431, 1.55688, -1.177349, 1, 1, 1, 1, 1,
-0.6697729, 0.2684985, -1.562828, 1, 1, 1, 1, 1,
-0.668592, -1.497809, -2.223328, 1, 1, 1, 1, 1,
-0.665378, 1.10117, -1.118335, 1, 1, 1, 1, 1,
-0.6648865, -0.2309772, -1.710859, 1, 1, 1, 1, 1,
-0.6647351, 0.1237329, -1.870151, 0, 0, 1, 1, 1,
-0.6580471, 2.35019, -1.208566, 1, 0, 0, 1, 1,
-0.6548485, -0.4673932, -2.636701, 1, 0, 0, 1, 1,
-0.6516158, -1.374916, -2.986112, 1, 0, 0, 1, 1,
-0.6514952, -0.3046827, -1.578499, 1, 0, 0, 1, 1,
-0.6389925, -0.1027999, -2.144371, 1, 0, 0, 1, 1,
-0.6361556, 0.1689194, -0.4646149, 0, 0, 0, 1, 1,
-0.6360874, -0.7637415, -2.464974, 0, 0, 0, 1, 1,
-0.6344802, 0.7269883, -1.368458, 0, 0, 0, 1, 1,
-0.6314241, -0.08135303, -3.403018, 0, 0, 0, 1, 1,
-0.6291199, 0.847721, 1.204941, 0, 0, 0, 1, 1,
-0.6265855, -0.1108457, -1.805466, 0, 0, 0, 1, 1,
-0.6249056, -0.3898934, -0.579021, 0, 0, 0, 1, 1,
-0.6165642, 1.317993, 0.4781834, 1, 1, 1, 1, 1,
-0.615728, 0.7984151, 0.8000367, 1, 1, 1, 1, 1,
-0.6070598, 0.3678062, -1.554306, 1, 1, 1, 1, 1,
-0.6048894, 0.1611079, -1.79533, 1, 1, 1, 1, 1,
-0.593156, 2.767589, 0.7689056, 1, 1, 1, 1, 1,
-0.5878352, -0.9076387, -2.112995, 1, 1, 1, 1, 1,
-0.5866591, 0.0001133493, -1.25757, 1, 1, 1, 1, 1,
-0.5843538, -1.419918, -3.979862, 1, 1, 1, 1, 1,
-0.5835961, 1.509324, -0.4976826, 1, 1, 1, 1, 1,
-0.5831724, -0.4544398, -2.03291, 1, 1, 1, 1, 1,
-0.5786674, 0.4565844, -0.5950835, 1, 1, 1, 1, 1,
-0.5702847, 0.3362124, -0.9667248, 1, 1, 1, 1, 1,
-0.5629076, 0.9956143, -2.172007, 1, 1, 1, 1, 1,
-0.5604219, 1.051715, -1.633285, 1, 1, 1, 1, 1,
-0.5580629, -0.1498258, -1.92325, 1, 1, 1, 1, 1,
-0.5535356, 0.3360296, -0.8505732, 0, 0, 1, 1, 1,
-0.5507277, 0.04898733, -2.716343, 1, 0, 0, 1, 1,
-0.5501845, 0.7065173, 0.2930994, 1, 0, 0, 1, 1,
-0.5500534, 0.6959754, 0.9687285, 1, 0, 0, 1, 1,
-0.5465111, 1.72998, 0.1162109, 1, 0, 0, 1, 1,
-0.5432513, 0.2839196, -0.2295924, 1, 0, 0, 1, 1,
-0.5413923, 0.5914133, -1.496498, 0, 0, 0, 1, 1,
-0.5388178, 0.2203514, -1.214614, 0, 0, 0, 1, 1,
-0.5335953, -1.557586, -4.983394, 0, 0, 0, 1, 1,
-0.5331925, 1.015165, -1.408796, 0, 0, 0, 1, 1,
-0.5331631, -0.2053189, -1.683743, 0, 0, 0, 1, 1,
-0.5295121, -0.05891701, -0.1520016, 0, 0, 0, 1, 1,
-0.5293047, -1.882515, -3.297098, 0, 0, 0, 1, 1,
-0.5277458, -0.09021431, -0.758131, 1, 1, 1, 1, 1,
-0.5266639, 1.194951, 0.1565163, 1, 1, 1, 1, 1,
-0.5261761, -0.3099679, -2.619777, 1, 1, 1, 1, 1,
-0.5208058, -0.495891, -1.717796, 1, 1, 1, 1, 1,
-0.5179955, 0.5121919, -0.1359433, 1, 1, 1, 1, 1,
-0.5123579, -0.5217434, -3.426818, 1, 1, 1, 1, 1,
-0.5109973, 1.928934, 0.2320036, 1, 1, 1, 1, 1,
-0.5105671, 1.680356, 0.6187035, 1, 1, 1, 1, 1,
-0.5068719, -0.7116982, -3.484048, 1, 1, 1, 1, 1,
-0.5042428, 0.05831209, -2.723711, 1, 1, 1, 1, 1,
-0.5032777, -1.552512, -1.864975, 1, 1, 1, 1, 1,
-0.5014614, -0.3680321, -2.607938, 1, 1, 1, 1, 1,
-0.4962679, 0.6550316, 1.151886, 1, 1, 1, 1, 1,
-0.4942736, -0.2169912, -1.808355, 1, 1, 1, 1, 1,
-0.4856285, 0.2842317, -0.7281519, 1, 1, 1, 1, 1,
-0.4830705, -0.6006739, -3.18374, 0, 0, 1, 1, 1,
-0.4768335, 1.510517, 0.3746989, 1, 0, 0, 1, 1,
-0.4685276, 0.4810096, -0.7455523, 1, 0, 0, 1, 1,
-0.4661968, -0.5796506, -3.140668, 1, 0, 0, 1, 1,
-0.4661156, 1.298217, -0.7108757, 1, 0, 0, 1, 1,
-0.4657492, 2.662215, -0.1863012, 1, 0, 0, 1, 1,
-0.4619988, 0.5216411, -3.176765, 0, 0, 0, 1, 1,
-0.4607475, -0.5084898, -1.645583, 0, 0, 0, 1, 1,
-0.4598571, -1.278716, -4.581866, 0, 0, 0, 1, 1,
-0.4584632, -0.7090849, -1.618747, 0, 0, 0, 1, 1,
-0.4569919, -1.169573, -3.585199, 0, 0, 0, 1, 1,
-0.4499668, 0.561224, -1.559647, 0, 0, 0, 1, 1,
-0.4482258, 0.6139029, -1.860968, 0, 0, 0, 1, 1,
-0.4443082, 0.303963, -1.45337, 1, 1, 1, 1, 1,
-0.4394366, 0.8626024, -1.976354, 1, 1, 1, 1, 1,
-0.4250756, 0.01306684, -2.446321, 1, 1, 1, 1, 1,
-0.4244525, 1.686361, -1.577743, 1, 1, 1, 1, 1,
-0.4241831, -0.1514715, -0.7084882, 1, 1, 1, 1, 1,
-0.4237783, 0.5648299, 0.3177818, 1, 1, 1, 1, 1,
-0.4236993, -0.6137271, -2.223442, 1, 1, 1, 1, 1,
-0.4188103, -0.7245802, -1.804661, 1, 1, 1, 1, 1,
-0.4156174, -0.3195588, -2.20277, 1, 1, 1, 1, 1,
-0.4152334, 0.1613166, -0.7097853, 1, 1, 1, 1, 1,
-0.4152272, -0.05736024, -1.966769, 1, 1, 1, 1, 1,
-0.4126445, 0.7907079, -0.4803515, 1, 1, 1, 1, 1,
-0.4089136, 0.1757351, -1.883524, 1, 1, 1, 1, 1,
-0.4042244, -0.04187657, -0.926695, 1, 1, 1, 1, 1,
-0.4020102, -0.08134034, -2.089343, 1, 1, 1, 1, 1,
-0.4005024, -1.009173, -3.125257, 0, 0, 1, 1, 1,
-0.3995514, -0.3791143, -1.749968, 1, 0, 0, 1, 1,
-0.3945821, -0.7237588, -1.511015, 1, 0, 0, 1, 1,
-0.3942071, -0.8419768, -2.05502, 1, 0, 0, 1, 1,
-0.3894311, 0.315672, -0.7464669, 1, 0, 0, 1, 1,
-0.3847352, 0.9098167, -0.7069407, 1, 0, 0, 1, 1,
-0.3805887, -0.3776699, -1.842221, 0, 0, 0, 1, 1,
-0.3760378, -0.00763652, -0.732267, 0, 0, 0, 1, 1,
-0.373239, -0.26831, -0.1302143, 0, 0, 0, 1, 1,
-0.3719433, 0.09551065, -2.018125, 0, 0, 0, 1, 1,
-0.3701623, 1.658758, -0.7229326, 0, 0, 0, 1, 1,
-0.3690096, -1.743014, -4.702702, 0, 0, 0, 1, 1,
-0.3654504, -0.2465102, -2.921025, 0, 0, 0, 1, 1,
-0.3652362, 0.2112092, -2.353936, 1, 1, 1, 1, 1,
-0.3598295, 0.0007599869, -3.318174, 1, 1, 1, 1, 1,
-0.3557231, 0.262787, -1.801053, 1, 1, 1, 1, 1,
-0.3534631, -0.2647518, -1.581605, 1, 1, 1, 1, 1,
-0.352941, -0.3661719, -2.536749, 1, 1, 1, 1, 1,
-0.3500731, 1.57682, -1.300105, 1, 1, 1, 1, 1,
-0.3500696, 0.0102158, -2.069514, 1, 1, 1, 1, 1,
-0.3500463, 0.2714565, -2.069649, 1, 1, 1, 1, 1,
-0.3481382, 1.51442, -0.1011799, 1, 1, 1, 1, 1,
-0.3456486, 0.05245816, -1.462977, 1, 1, 1, 1, 1,
-0.3450266, 2.022875, 1.734646, 1, 1, 1, 1, 1,
-0.3413064, 0.3707142, 0.4716315, 1, 1, 1, 1, 1,
-0.3364262, 0.5906621, -1.443164, 1, 1, 1, 1, 1,
-0.3347902, 1.340585, 1.061406, 1, 1, 1, 1, 1,
-0.3332518, -0.5974789, -2.975365, 1, 1, 1, 1, 1,
-0.3326723, 1.439152, -1.829992, 0, 0, 1, 1, 1,
-0.3304719, -1.095462, -1.896431, 1, 0, 0, 1, 1,
-0.3286506, -0.8688228, -3.741205, 1, 0, 0, 1, 1,
-0.3254565, -0.7318537, -1.371287, 1, 0, 0, 1, 1,
-0.3252231, 0.01457995, -2.212823, 1, 0, 0, 1, 1,
-0.3226474, -1.421066, -3.146905, 1, 0, 0, 1, 1,
-0.3208968, 1.854017, -0.8247775, 0, 0, 0, 1, 1,
-0.3203208, -2.500673, -2.835779, 0, 0, 0, 1, 1,
-0.3189482, -0.4911106, -3.028064, 0, 0, 0, 1, 1,
-0.3141753, 0.06556265, -1.936497, 0, 0, 0, 1, 1,
-0.3131912, -1.027848, -2.929798, 0, 0, 0, 1, 1,
-0.3119814, 0.5807218, 0.5144843, 0, 0, 0, 1, 1,
-0.3082967, 0.3620279, -1.799274, 0, 0, 0, 1, 1,
-0.3064286, 1.334426, 1.586239, 1, 1, 1, 1, 1,
-0.2993537, -0.1727438, -3.269565, 1, 1, 1, 1, 1,
-0.296508, -0.7802968, -2.823586, 1, 1, 1, 1, 1,
-0.2900142, 0.1071731, -1.297412, 1, 1, 1, 1, 1,
-0.2807832, 0.759585, -0.5072109, 1, 1, 1, 1, 1,
-0.2789829, -0.5513574, -3.307165, 1, 1, 1, 1, 1,
-0.2753673, -1.044488, -3.248447, 1, 1, 1, 1, 1,
-0.2724634, -0.7943659, -1.504233, 1, 1, 1, 1, 1,
-0.2688205, 0.1927013, -1.92668, 1, 1, 1, 1, 1,
-0.263251, 0.6347533, -0.4554868, 1, 1, 1, 1, 1,
-0.2615292, -1.116018, -3.515512, 1, 1, 1, 1, 1,
-0.2614863, 0.321014, -0.08195093, 1, 1, 1, 1, 1,
-0.2570484, 0.1206686, -2.074946, 1, 1, 1, 1, 1,
-0.2567357, -0.9076834, -2.181355, 1, 1, 1, 1, 1,
-0.2566627, -0.1586509, -2.950829, 1, 1, 1, 1, 1,
-0.2539657, 0.6581858, 0.286449, 0, 0, 1, 1, 1,
-0.2539311, -0.8049806, -3.899857, 1, 0, 0, 1, 1,
-0.2517501, -1.284553, -4.300075, 1, 0, 0, 1, 1,
-0.2511972, 1.229271, -1.114434, 1, 0, 0, 1, 1,
-0.2432747, 0.734935, 1.037625, 1, 0, 0, 1, 1,
-0.234945, -0.7321391, -2.176838, 1, 0, 0, 1, 1,
-0.2344563, -0.2988959, -2.388792, 0, 0, 0, 1, 1,
-0.2342554, -0.207278, -3.171519, 0, 0, 0, 1, 1,
-0.2309702, 1.005064, -1.189736, 0, 0, 0, 1, 1,
-0.2297053, -0.120877, -2.453849, 0, 0, 0, 1, 1,
-0.2265651, -0.5284147, -2.937499, 0, 0, 0, 1, 1,
-0.225734, -0.6784273, -2.370898, 0, 0, 0, 1, 1,
-0.2245555, 1.663742, -1.318329, 0, 0, 0, 1, 1,
-0.2151469, -0.6600869, -1.638332, 1, 1, 1, 1, 1,
-0.2137042, 0.7044114, 0.2904136, 1, 1, 1, 1, 1,
-0.2121753, -0.5455221, -1.338957, 1, 1, 1, 1, 1,
-0.2120157, 0.5214738, -0.2326884, 1, 1, 1, 1, 1,
-0.2089674, -0.8368175, -3.059326, 1, 1, 1, 1, 1,
-0.2012327, 0.03210828, 0.1661479, 1, 1, 1, 1, 1,
-0.1998373, -0.9284475, -3.371018, 1, 1, 1, 1, 1,
-0.1965644, -0.5479786, -3.474431, 1, 1, 1, 1, 1,
-0.1950303, 1.103916, 0.3920895, 1, 1, 1, 1, 1,
-0.1931125, -1.071572, -2.23356, 1, 1, 1, 1, 1,
-0.1903873, -1.384855, -2.815434, 1, 1, 1, 1, 1,
-0.1829141, 0.1325244, -1.190954, 1, 1, 1, 1, 1,
-0.1827084, 0.5101372, -0.7595338, 1, 1, 1, 1, 1,
-0.1811064, -1.569857, -3.189892, 1, 1, 1, 1, 1,
-0.1752875, -1.061594, -3.228281, 1, 1, 1, 1, 1,
-0.1712402, -2.580964, -4.174113, 0, 0, 1, 1, 1,
-0.1678493, 0.1519943, -0.6622512, 1, 0, 0, 1, 1,
-0.1677616, 0.1274864, -0.4202394, 1, 0, 0, 1, 1,
-0.1594707, -0.3933919, -3.494608, 1, 0, 0, 1, 1,
-0.155058, -0.1327612, -1.159576, 1, 0, 0, 1, 1,
-0.1546176, -0.2043515, -3.100834, 1, 0, 0, 1, 1,
-0.1546114, 1.143743, 0.6669366, 0, 0, 0, 1, 1,
-0.1537873, 0.6725185, 0.3930238, 0, 0, 0, 1, 1,
-0.1510482, 1.986233, -0.08096419, 0, 0, 0, 1, 1,
-0.1429805, 0.2870821, 0.4155437, 0, 0, 0, 1, 1,
-0.1371142, 0.5303867, -0.7535525, 0, 0, 0, 1, 1,
-0.1363107, 1.697911, -0.9045684, 0, 0, 0, 1, 1,
-0.1331946, -0.1602724, -2.605739, 0, 0, 0, 1, 1,
-0.1309202, 1.621645, 1.21926, 1, 1, 1, 1, 1,
-0.1291506, 0.1763664, -1.194242, 1, 1, 1, 1, 1,
-0.1285133, -0.3375017, -3.490798, 1, 1, 1, 1, 1,
-0.1280466, 1.440902, -0.05226573, 1, 1, 1, 1, 1,
-0.1278375, -0.2501309, -3.670753, 1, 1, 1, 1, 1,
-0.1274318, 0.0249004, -1.095978, 1, 1, 1, 1, 1,
-0.1264178, 0.5425862, -0.8514196, 1, 1, 1, 1, 1,
-0.1255938, 1.021333, -1.762463, 1, 1, 1, 1, 1,
-0.1246656, -1.820063, -3.134994, 1, 1, 1, 1, 1,
-0.1242081, 0.7232302, 0.5986992, 1, 1, 1, 1, 1,
-0.1213342, 0.2521693, -0.4631323, 1, 1, 1, 1, 1,
-0.1197211, -1.018049, -3.14405, 1, 1, 1, 1, 1,
-0.1191023, -0.3102933, -2.185205, 1, 1, 1, 1, 1,
-0.1188497, -0.4675504, -3.349993, 1, 1, 1, 1, 1,
-0.118029, 1.09569, -1.051833, 1, 1, 1, 1, 1,
-0.1172926, -0.634355, -3.340395, 0, 0, 1, 1, 1,
-0.1129304, -0.9121597, -2.6789, 1, 0, 0, 1, 1,
-0.1127109, 1.19355, 0.5682837, 1, 0, 0, 1, 1,
-0.1075187, 0.9609269, -0.8688244, 1, 0, 0, 1, 1,
-0.1055894, -0.2465103, -3.751479, 1, 0, 0, 1, 1,
-0.1031581, 1.403667, -1.829297, 1, 0, 0, 1, 1,
-0.1029105, -1.231946, -2.992079, 0, 0, 0, 1, 1,
-0.102724, -0.9825237, -2.423381, 0, 0, 0, 1, 1,
-0.1014971, 0.2919776, -1.160571, 0, 0, 0, 1, 1,
-0.1014883, -1.599242, -2.07196, 0, 0, 0, 1, 1,
-0.1001033, -1.825824, -2.890148, 0, 0, 0, 1, 1,
-0.09833746, -1.1638, -2.077158, 0, 0, 0, 1, 1,
-0.09721608, 0.3420909, -1.218801, 0, 0, 0, 1, 1,
-0.09468783, -1.668325, -2.847231, 1, 1, 1, 1, 1,
-0.09275578, 1.040675, 0.1545169, 1, 1, 1, 1, 1,
-0.08518652, -0.1357238, -2.271259, 1, 1, 1, 1, 1,
-0.08384118, -0.1511824, -3.663131, 1, 1, 1, 1, 1,
-0.0829664, -0.3843447, -2.555591, 1, 1, 1, 1, 1,
-0.0825996, 0.02032256, -3.225729, 1, 1, 1, 1, 1,
-0.08207262, 1.230913, 1.34033, 1, 1, 1, 1, 1,
-0.07808443, 0.5437359, -1.213943, 1, 1, 1, 1, 1,
-0.07240172, 0.3356801, 0.5595043, 1, 1, 1, 1, 1,
-0.07141981, -0.8137144, -1.372126, 1, 1, 1, 1, 1,
-0.07096817, -0.756119, -2.286093, 1, 1, 1, 1, 1,
-0.07087556, -0.1938158, -4.166129, 1, 1, 1, 1, 1,
-0.06997177, -1.611037, -3.733871, 1, 1, 1, 1, 1,
-0.06298751, 1.346191, -0.7464824, 1, 1, 1, 1, 1,
-0.06291699, 0.8672101, 0.1517513, 1, 1, 1, 1, 1,
-0.0593522, 0.3289899, 0.8988506, 0, 0, 1, 1, 1,
-0.0585837, -1.081502, -2.309393, 1, 0, 0, 1, 1,
-0.05853272, -1.819266, -3.480175, 1, 0, 0, 1, 1,
-0.05818538, -0.6538669, -1.800521, 1, 0, 0, 1, 1,
-0.04861817, -0.9811901, -2.71771, 1, 0, 0, 1, 1,
-0.04688662, 1.39214, 0.2492273, 1, 0, 0, 1, 1,
-0.04589886, 0.2526917, -1.137393, 0, 0, 0, 1, 1,
-0.04450126, 0.3496124, -0.2610189, 0, 0, 0, 1, 1,
-0.03796538, 0.1665614, 1.116684, 0, 0, 0, 1, 1,
-0.03697962, 1.091731, 0.04400701, 0, 0, 0, 1, 1,
-0.03609633, -0.1077626, -1.55619, 0, 0, 0, 1, 1,
-0.03472852, 1.896929, 1.464039, 0, 0, 0, 1, 1,
-0.03370022, -0.2796811, -3.31307, 0, 0, 0, 1, 1,
-0.02746062, -0.9818877, -2.876833, 1, 1, 1, 1, 1,
-0.02496102, 0.3488232, -1.061432, 1, 1, 1, 1, 1,
-0.02252232, -0.6208982, -2.171283, 1, 1, 1, 1, 1,
-0.02206575, 0.798602, 0.4248137, 1, 1, 1, 1, 1,
-0.01690792, -0.1713308, -2.910835, 1, 1, 1, 1, 1,
-0.01247051, -0.2715588, -3.521572, 1, 1, 1, 1, 1,
-0.01117224, -0.2778582, -2.209526, 1, 1, 1, 1, 1,
-0.01076711, -1.017153, -2.583902, 1, 1, 1, 1, 1,
-0.007266998, 1.338852, -0.7768462, 1, 1, 1, 1, 1,
-0.002480012, 0.06777771, 0.6757943, 1, 1, 1, 1, 1,
-0.0005062532, -1.775476, -3.925523, 1, 1, 1, 1, 1,
-0.0002356265, -0.09906664, -3.802212, 1, 1, 1, 1, 1,
0.0002782899, -2.215345, 3.1804, 1, 1, 1, 1, 1,
0.002022963, -1.983317, 2.776994, 1, 1, 1, 1, 1,
0.00206519, 0.09651024, -0.9797249, 1, 1, 1, 1, 1,
0.006556964, -1.955897, 3.866554, 0, 0, 1, 1, 1,
0.009035791, -0.655808, 2.360134, 1, 0, 0, 1, 1,
0.009336813, 0.3357644, 1.390085, 1, 0, 0, 1, 1,
0.01058006, 0.4845041, 0.2874358, 1, 0, 0, 1, 1,
0.01144997, 2.181632, 0.1116617, 1, 0, 0, 1, 1,
0.01314607, -1.879678, 1.8583, 1, 0, 0, 1, 1,
0.0148338, -0.7258691, 4.023212, 0, 0, 0, 1, 1,
0.01520457, 0.819234, -1.445258, 0, 0, 0, 1, 1,
0.01912168, -1.466576, 3.025499, 0, 0, 0, 1, 1,
0.01997103, -1.573715, 3.341717, 0, 0, 0, 1, 1,
0.02013827, -0.2588702, 2.348395, 0, 0, 0, 1, 1,
0.02419126, -0.1679257, 3.576156, 0, 0, 0, 1, 1,
0.03141556, -1.415827, 1.611431, 0, 0, 0, 1, 1,
0.0321794, 0.5074978, -0.8921469, 1, 1, 1, 1, 1,
0.03318583, -0.4337074, 3.58102, 1, 1, 1, 1, 1,
0.03348121, -0.3279614, 3.142953, 1, 1, 1, 1, 1,
0.03420861, -2.104592, 3.943323, 1, 1, 1, 1, 1,
0.03812362, 1.079463, -1.037591, 1, 1, 1, 1, 1,
0.04236915, 0.7945392, 2.647558, 1, 1, 1, 1, 1,
0.0459708, 0.9875804, 1.860733, 1, 1, 1, 1, 1,
0.04642215, 0.04871749, -1.12008, 1, 1, 1, 1, 1,
0.04794142, -0.188776, 2.137502, 1, 1, 1, 1, 1,
0.05265212, -0.6928484, 1.922948, 1, 1, 1, 1, 1,
0.05318372, 0.8499643, 2.630239, 1, 1, 1, 1, 1,
0.0579626, -1.247655, 3.299237, 1, 1, 1, 1, 1,
0.05826194, -0.02110673, -0.8082758, 1, 1, 1, 1, 1,
0.06012625, -1.470026, 1.755071, 1, 1, 1, 1, 1,
0.06124693, -0.6055804, 3.715008, 1, 1, 1, 1, 1,
0.06174558, 1.052525, 0.1369204, 0, 0, 1, 1, 1,
0.0693981, -0.1838861, 1.959817, 1, 0, 0, 1, 1,
0.07135688, 0.671564, -0.1127151, 1, 0, 0, 1, 1,
0.07176413, -1.102359, 2.875608, 1, 0, 0, 1, 1,
0.07422824, 1.172154, 3.244036, 1, 0, 0, 1, 1,
0.07450272, 1.065461, 1.068313, 1, 0, 0, 1, 1,
0.0780459, 1.726381, -0.8276519, 0, 0, 0, 1, 1,
0.08323544, -0.3795851, 3.209801, 0, 0, 0, 1, 1,
0.08521783, -1.278714, 2.33563, 0, 0, 0, 1, 1,
0.08629443, -0.7323094, 2.409689, 0, 0, 0, 1, 1,
0.09013924, 1.076881, -0.004563039, 0, 0, 0, 1, 1,
0.09015935, 0.9886894, 1.175592, 0, 0, 0, 1, 1,
0.09068372, -0.4178118, 1.725323, 0, 0, 0, 1, 1,
0.09098595, -1.188709, 1.750499, 1, 1, 1, 1, 1,
0.09291741, -1.134947, 2.409851, 1, 1, 1, 1, 1,
0.09350479, 0.6294637, -1.299692, 1, 1, 1, 1, 1,
0.09360953, 0.5173375, -1.164766, 1, 1, 1, 1, 1,
0.0938544, 0.4589438, -1.622838, 1, 1, 1, 1, 1,
0.09843643, 0.7555632, -0.262133, 1, 1, 1, 1, 1,
0.1003865, -0.0125451, -0.1494336, 1, 1, 1, 1, 1,
0.1049464, 0.7386473, 1.096801, 1, 1, 1, 1, 1,
0.1070188, -0.7218186, 2.090667, 1, 1, 1, 1, 1,
0.1138299, 0.5304232, -0.07183275, 1, 1, 1, 1, 1,
0.114876, 0.2086774, 1.691863, 1, 1, 1, 1, 1,
0.1169762, 1.075132, -0.2065608, 1, 1, 1, 1, 1,
0.1176168, 0.8639315, -0.7564434, 1, 1, 1, 1, 1,
0.1180951, -0.06488582, 1.449732, 1, 1, 1, 1, 1,
0.1184169, 1.033215, -0.07825304, 1, 1, 1, 1, 1,
0.1211278, -1.521042, 2.5942, 0, 0, 1, 1, 1,
0.1316454, 0.0126196, 2.763234, 1, 0, 0, 1, 1,
0.132955, 1.053458, 0.09083663, 1, 0, 0, 1, 1,
0.138068, -0.006933148, 0.8146676, 1, 0, 0, 1, 1,
0.1435111, -0.116922, 2.372733, 1, 0, 0, 1, 1,
0.1449144, -0.2630438, 1.643915, 1, 0, 0, 1, 1,
0.1462186, -0.2622757, 1.193794, 0, 0, 0, 1, 1,
0.152385, -0.03725773, 2.744885, 0, 0, 0, 1, 1,
0.1530116, -0.1601189, 4.409563, 0, 0, 0, 1, 1,
0.1554578, -0.5781525, 1.810129, 0, 0, 0, 1, 1,
0.160873, -2.378521, 2.105477, 0, 0, 0, 1, 1,
0.1653346, 0.3958853, 0.05753338, 0, 0, 0, 1, 1,
0.1683354, -2.148344, 2.502026, 0, 0, 0, 1, 1,
0.171484, 0.7917055, -1.788895, 1, 1, 1, 1, 1,
0.1714842, -0.281531, 1.639145, 1, 1, 1, 1, 1,
0.1755749, 0.3216078, 1.127998, 1, 1, 1, 1, 1,
0.1796501, -0.2367559, 0.635335, 1, 1, 1, 1, 1,
0.1799455, 0.4346644, -1.258916, 1, 1, 1, 1, 1,
0.1873427, -1.448846, 1.398391, 1, 1, 1, 1, 1,
0.1988816, 0.5062298, -0.06349994, 1, 1, 1, 1, 1,
0.1990345, -0.3012039, 2.88092, 1, 1, 1, 1, 1,
0.1999957, 1.214463, 1.04879, 1, 1, 1, 1, 1,
0.2029952, -1.010759, 3.556309, 1, 1, 1, 1, 1,
0.2071364, -0.5336503, 3.436379, 1, 1, 1, 1, 1,
0.2073552, 0.7743083, -0.2910605, 1, 1, 1, 1, 1,
0.2098586, -0.609985, 4.577535, 1, 1, 1, 1, 1,
0.2099249, -0.5935782, 4.662085, 1, 1, 1, 1, 1,
0.2156053, 0.6139233, 3.366557, 1, 1, 1, 1, 1,
0.2165091, -0.8135886, 3.326223, 0, 0, 1, 1, 1,
0.2181964, 0.08788841, 1.303731, 1, 0, 0, 1, 1,
0.2182781, 2.227048, 0.3334452, 1, 0, 0, 1, 1,
0.2217163, -1.141321, 2.277557, 1, 0, 0, 1, 1,
0.2228511, -0.7767493, 0.5600635, 1, 0, 0, 1, 1,
0.2237005, -0.07459661, 3.689435, 1, 0, 0, 1, 1,
0.226249, -0.6012323, 2.454019, 0, 0, 0, 1, 1,
0.2263301, -0.9427379, 3.651115, 0, 0, 0, 1, 1,
0.2268716, 0.6312618, -0.9091834, 0, 0, 0, 1, 1,
0.2318011, 0.7554883, 0.6456333, 0, 0, 0, 1, 1,
0.2331389, -0.3652423, 4.193604, 0, 0, 0, 1, 1,
0.236643, 0.9648852, 0.3885062, 0, 0, 0, 1, 1,
0.2368674, -0.6440848, 2.925804, 0, 0, 0, 1, 1,
0.2401053, 1.411453, -0.6496993, 1, 1, 1, 1, 1,
0.2486162, 0.9495566, -1.806664, 1, 1, 1, 1, 1,
0.2497693, -0.9987853, 0.8087799, 1, 1, 1, 1, 1,
0.2530338, 0.2499032, 0.8115795, 1, 1, 1, 1, 1,
0.2544829, -2.130802, 3.705497, 1, 1, 1, 1, 1,
0.2547908, 0.2961977, 0.5714927, 1, 1, 1, 1, 1,
0.2591601, 1.023777, -1.37251, 1, 1, 1, 1, 1,
0.263163, -1.200765, 2.105591, 1, 1, 1, 1, 1,
0.2696397, -1.244336, 3.105335, 1, 1, 1, 1, 1,
0.2716459, 1.874581, 0.2384458, 1, 1, 1, 1, 1,
0.2776527, -1.209993, 3.370058, 1, 1, 1, 1, 1,
0.2791172, 0.704142, -0.05985406, 1, 1, 1, 1, 1,
0.2796742, -0.6836063, 3.070565, 1, 1, 1, 1, 1,
0.280723, -1.567412, 2.772426, 1, 1, 1, 1, 1,
0.2819173, -1.963052, 3.954696, 1, 1, 1, 1, 1,
0.2821222, 0.4973706, 0.2942115, 0, 0, 1, 1, 1,
0.2874554, 0.9499561, -0.04500915, 1, 0, 0, 1, 1,
0.2891254, 0.614822, 0.5413208, 1, 0, 0, 1, 1,
0.2911399, 1.421959, -1.221867, 1, 0, 0, 1, 1,
0.2952725, -0.5051131, 3.19299, 1, 0, 0, 1, 1,
0.2960047, -0.8631537, 2.395943, 1, 0, 0, 1, 1,
0.299045, 0.05525429, 0.4723912, 0, 0, 0, 1, 1,
0.2990809, 1.404984, -0.8407015, 0, 0, 0, 1, 1,
0.3040592, -0.4386023, 1.960112, 0, 0, 0, 1, 1,
0.3050864, -0.2145983, 0.527366, 0, 0, 0, 1, 1,
0.3051153, 1.091483, 0.1929245, 0, 0, 0, 1, 1,
0.3075745, 0.3137391, 3.147781, 0, 0, 0, 1, 1,
0.3116173, 0.4195736, -0.03683886, 0, 0, 0, 1, 1,
0.3137191, -1.458925, 3.911458, 1, 1, 1, 1, 1,
0.3155655, 0.04899479, 1.150787, 1, 1, 1, 1, 1,
0.3184268, -0.5873874, 2.569888, 1, 1, 1, 1, 1,
0.3195598, -0.3936281, 4.491705, 1, 1, 1, 1, 1,
0.3199975, 0.1525495, 1.579534, 1, 1, 1, 1, 1,
0.3227933, 0.1934039, 0.2885127, 1, 1, 1, 1, 1,
0.3241912, 0.258037, 0.2882212, 1, 1, 1, 1, 1,
0.3283351, 0.5916469, 0.2721226, 1, 1, 1, 1, 1,
0.3316892, 0.3167267, 2.361585, 1, 1, 1, 1, 1,
0.3365354, -0.0009108002, 2.953691, 1, 1, 1, 1, 1,
0.338845, -0.7843443, 3.993143, 1, 1, 1, 1, 1,
0.3416817, -0.261091, 2.60083, 1, 1, 1, 1, 1,
0.3466077, -1.160907, 2.310473, 1, 1, 1, 1, 1,
0.3485849, 1.641094, -0.4720419, 1, 1, 1, 1, 1,
0.3514793, -1.121191, 2.925584, 1, 1, 1, 1, 1,
0.3630818, 0.9471659, -1.257078, 0, 0, 1, 1, 1,
0.3698564, -0.7729617, 2.765301, 1, 0, 0, 1, 1,
0.3738155, 0.07968558, 0.7241428, 1, 0, 0, 1, 1,
0.3785191, -1.082329, 2.333836, 1, 0, 0, 1, 1,
0.3795769, 0.4823441, 0.4313354, 1, 0, 0, 1, 1,
0.3812064, 1.384335, 0.9861503, 1, 0, 0, 1, 1,
0.3925933, -0.1564323, 0.6876214, 0, 0, 0, 1, 1,
0.3931901, -1.250516, 1.545521, 0, 0, 0, 1, 1,
0.3960722, -0.3357276, 2.244778, 0, 0, 0, 1, 1,
0.3975929, -1.398082, 4.747764, 0, 0, 0, 1, 1,
0.4003337, 0.09493489, 1.83397, 0, 0, 0, 1, 1,
0.4008669, -1.100621, 5.017093, 0, 0, 0, 1, 1,
0.4013445, 1.31697, -0.3390976, 0, 0, 0, 1, 1,
0.4013476, 0.7460271, -0.7507926, 1, 1, 1, 1, 1,
0.4022156, 0.2910829, 2.526731, 1, 1, 1, 1, 1,
0.4037963, -0.8323939, 2.792514, 1, 1, 1, 1, 1,
0.4076415, -0.2708711, 3.184839, 1, 1, 1, 1, 1,
0.4093923, -0.5953214, 3.501956, 1, 1, 1, 1, 1,
0.4153786, 0.9700956, 0.08136764, 1, 1, 1, 1, 1,
0.416507, -0.8703132, 2.087602, 1, 1, 1, 1, 1,
0.4179218, -1.400952, 1.982506, 1, 1, 1, 1, 1,
0.4188577, 0.2699648, 1.798055, 1, 1, 1, 1, 1,
0.4203923, -0.2584824, 2.566182, 1, 1, 1, 1, 1,
0.4238338, -0.7188058, 2.981398, 1, 1, 1, 1, 1,
0.4263128, 0.3346708, 2.109868, 1, 1, 1, 1, 1,
0.4286906, 0.2104157, -0.7864453, 1, 1, 1, 1, 1,
0.4287852, 0.9782137, 0.6184269, 1, 1, 1, 1, 1,
0.4360651, -0.128448, 1.697663, 1, 1, 1, 1, 1,
0.4362921, -0.4901591, 2.141647, 0, 0, 1, 1, 1,
0.4369284, -0.1798462, 1.69758, 1, 0, 0, 1, 1,
0.4387387, 0.9920344, 0.8040685, 1, 0, 0, 1, 1,
0.43929, 2.911043, 1.180883, 1, 0, 0, 1, 1,
0.4405786, 0.6569544, -0.005646734, 1, 0, 0, 1, 1,
0.4412123, 1.329259, 0.5252094, 1, 0, 0, 1, 1,
0.443149, 0.5091401, 1.301881, 0, 0, 0, 1, 1,
0.4434598, -0.01631701, 2.090625, 0, 0, 0, 1, 1,
0.44534, -0.594124, 1.957986, 0, 0, 0, 1, 1,
0.4465914, 1.921872, 0.1344273, 0, 0, 0, 1, 1,
0.451308, 2.006371, 1.040845, 0, 0, 0, 1, 1,
0.453862, 0.1774312, 0.9289933, 0, 0, 0, 1, 1,
0.455146, 0.7564192, -0.550636, 0, 0, 0, 1, 1,
0.4554127, 1.861753, -0.08384735, 1, 1, 1, 1, 1,
0.456698, -0.4093183, 4.283934, 1, 1, 1, 1, 1,
0.4598517, 0.09598619, 2.288453, 1, 1, 1, 1, 1,
0.4651302, -1.846627, 2.132902, 1, 1, 1, 1, 1,
0.466138, -0.6761175, 3.834045, 1, 1, 1, 1, 1,
0.4663832, 0.1273147, 2.093192, 1, 1, 1, 1, 1,
0.4664517, 0.9578755, 0.6691636, 1, 1, 1, 1, 1,
0.4695257, 1.565828, -0.2254478, 1, 1, 1, 1, 1,
0.4702145, 1.033725, -0.7868387, 1, 1, 1, 1, 1,
0.471884, 0.5530634, 1.703298, 1, 1, 1, 1, 1,
0.47288, -0.1643071, 1.653981, 1, 1, 1, 1, 1,
0.474389, -3.187708, 2.467405, 1, 1, 1, 1, 1,
0.4845878, -1.177858, 2.140333, 1, 1, 1, 1, 1,
0.4852043, -1.741771, 3.531753, 1, 1, 1, 1, 1,
0.4898145, 1.650585, 0.627576, 1, 1, 1, 1, 1,
0.4964294, -1.514667, 2.229785, 0, 0, 1, 1, 1,
0.4967032, 1.158923, -0.4402967, 1, 0, 0, 1, 1,
0.499326, -0.3464706, 3.414822, 1, 0, 0, 1, 1,
0.5092158, -0.2870398, 2.723585, 1, 0, 0, 1, 1,
0.5239042, 1.490281, -0.1098332, 1, 0, 0, 1, 1,
0.524243, -0.4210867, 1.365185, 1, 0, 0, 1, 1,
0.5250861, 0.461058, 1.018248, 0, 0, 0, 1, 1,
0.5314094, -1.636733, 2.212035, 0, 0, 0, 1, 1,
0.5363769, -0.8649516, 2.988794, 0, 0, 0, 1, 1,
0.5406794, 0.7264667, 0.6057089, 0, 0, 0, 1, 1,
0.5572437, 0.2876701, -0.1139128, 0, 0, 0, 1, 1,
0.5609931, -1.473566, 2.230941, 0, 0, 0, 1, 1,
0.5631336, -0.7457131, 1.773647, 0, 0, 0, 1, 1,
0.5635574, -0.7515099, 2.554172, 1, 1, 1, 1, 1,
0.5700364, -0.6350315, 2.336314, 1, 1, 1, 1, 1,
0.5703653, 0.06366224, 0.6144232, 1, 1, 1, 1, 1,
0.5713041, -0.5522492, 1.197812, 1, 1, 1, 1, 1,
0.5733452, -0.05968707, 1.976057, 1, 1, 1, 1, 1,
0.5808846, -0.5680647, 2.600583, 1, 1, 1, 1, 1,
0.5810654, 0.284838, 1.974049, 1, 1, 1, 1, 1,
0.5841992, 1.08518, -0.3621998, 1, 1, 1, 1, 1,
0.5881059, -0.1976131, 1.053718, 1, 1, 1, 1, 1,
0.589792, -0.5515826, 2.660584, 1, 1, 1, 1, 1,
0.5900965, -0.7882104, 2.144606, 1, 1, 1, 1, 1,
0.6019064, 0.09448099, 1.649447, 1, 1, 1, 1, 1,
0.6063859, 0.07947012, 2.489126, 1, 1, 1, 1, 1,
0.6098051, -0.5646961, 2.737093, 1, 1, 1, 1, 1,
0.6131122, -0.3254309, 2.665429, 1, 1, 1, 1, 1,
0.6151484, 0.07222626, 1.12957, 0, 0, 1, 1, 1,
0.6198832, -1.398657, 3.225295, 1, 0, 0, 1, 1,
0.6201272, 0.02739466, 2.477258, 1, 0, 0, 1, 1,
0.6201621, -0.5220631, 1.88447, 1, 0, 0, 1, 1,
0.6213334, 0.1575488, 0.9039367, 1, 0, 0, 1, 1,
0.6213996, -1.06448, 1.484187, 1, 0, 0, 1, 1,
0.6216395, 0.02144108, 1.699916, 0, 0, 0, 1, 1,
0.6263953, 0.9800184, 2.349596, 0, 0, 0, 1, 1,
0.6273873, 1.866243, 2.196384, 0, 0, 0, 1, 1,
0.6291041, 1.027142, 0.1013751, 0, 0, 0, 1, 1,
0.6345016, -1.061207, 1.677647, 0, 0, 0, 1, 1,
0.6373968, 1.017251, 2.796579, 0, 0, 0, 1, 1,
0.6415592, 0.4561188, 1.649413, 0, 0, 0, 1, 1,
0.644209, -0.6959543, 1.742487, 1, 1, 1, 1, 1,
0.6469514, -0.9776663, 2.713927, 1, 1, 1, 1, 1,
0.6477614, -0.2240909, 1.532425, 1, 1, 1, 1, 1,
0.6551021, -0.3357026, 1.633426, 1, 1, 1, 1, 1,
0.6578113, 0.5161195, 1.980382, 1, 1, 1, 1, 1,
0.6578977, -0.1107069, 0.9610611, 1, 1, 1, 1, 1,
0.6650495, 1.139372, 0.3882479, 1, 1, 1, 1, 1,
0.6703509, 0.6440669, -0.0922841, 1, 1, 1, 1, 1,
0.6763902, -1.192199, 2.550788, 1, 1, 1, 1, 1,
0.6788113, 0.9603181, -0.620073, 1, 1, 1, 1, 1,
0.6824176, 0.3876683, 1.26531, 1, 1, 1, 1, 1,
0.6845397, -0.1560141, 2.463904, 1, 1, 1, 1, 1,
0.6885673, -0.6007434, 1.26493, 1, 1, 1, 1, 1,
0.6930165, 2.452921, 1.236174, 1, 1, 1, 1, 1,
0.6959835, 1.262517, 1.367144, 1, 1, 1, 1, 1,
0.6982389, -0.5667665, 1.397321, 0, 0, 1, 1, 1,
0.7016223, 1.614742, -0.6650416, 1, 0, 0, 1, 1,
0.7045496, 1.215612, -0.4803539, 1, 0, 0, 1, 1,
0.7058628, 0.3376358, 1.062768, 1, 0, 0, 1, 1,
0.708137, -0.06478415, 0.8764122, 1, 0, 0, 1, 1,
0.7194564, 0.09335284, -0.5637661, 1, 0, 0, 1, 1,
0.720889, 0.7267229, 0.5117542, 0, 0, 0, 1, 1,
0.7211254, 0.9685464, 2.046939, 0, 0, 0, 1, 1,
0.7255119, -1.57648, 4.432777, 0, 0, 0, 1, 1,
0.7267989, 2.216172, -1.049173, 0, 0, 0, 1, 1,
0.7289665, -0.795992, 4.467441, 0, 0, 0, 1, 1,
0.731131, 0.2054337, 2.528395, 0, 0, 0, 1, 1,
0.7316731, -2.964342, 3.709173, 0, 0, 0, 1, 1,
0.7345636, 0.1293687, 2.847487, 1, 1, 1, 1, 1,
0.7353519, -0.5265931, 3.734433, 1, 1, 1, 1, 1,
0.7382429, 0.3418405, 1.616755, 1, 1, 1, 1, 1,
0.7436642, -0.3347346, 2.755773, 1, 1, 1, 1, 1,
0.744014, -0.5843004, 2.875057, 1, 1, 1, 1, 1,
0.7524498, 0.294735, 4.549958, 1, 1, 1, 1, 1,
0.7545928, -1.437998, 1.643973, 1, 1, 1, 1, 1,
0.7618467, -0.5069803, 2.830888, 1, 1, 1, 1, 1,
0.7620774, -0.06049057, -0.2828967, 1, 1, 1, 1, 1,
0.7671348, -0.8418315, 1.502808, 1, 1, 1, 1, 1,
0.7686355, 0.642234, 2.497382, 1, 1, 1, 1, 1,
0.7691687, 0.1089163, 2.487946, 1, 1, 1, 1, 1,
0.7709981, -0.240722, 3.633054, 1, 1, 1, 1, 1,
0.7742835, 1.675996, -0.252239, 1, 1, 1, 1, 1,
0.7778416, 0.3426957, 3.29139, 1, 1, 1, 1, 1,
0.7799023, -0.5397381, 2.066019, 0, 0, 1, 1, 1,
0.7811963, -0.6721513, 1.082381, 1, 0, 0, 1, 1,
0.7829674, 1.232484, 2.613074, 1, 0, 0, 1, 1,
0.7899733, 0.302916, 2.539332, 1, 0, 0, 1, 1,
0.7942634, -1.169075, 2.665379, 1, 0, 0, 1, 1,
0.7954935, 1.572803, 1.864323, 1, 0, 0, 1, 1,
0.7963979, 0.3409645, 0.8917474, 0, 0, 0, 1, 1,
0.7970882, 0.5685524, 0.6648604, 0, 0, 0, 1, 1,
0.8138983, 0.1357287, 1.183787, 0, 0, 0, 1, 1,
0.8158831, -1.156571, 3.042042, 0, 0, 0, 1, 1,
0.8173046, 0.1333278, 0.1345789, 0, 0, 0, 1, 1,
0.8216722, -1.017549, 2.403423, 0, 0, 0, 1, 1,
0.8241669, 0.1840062, 1.536163, 0, 0, 0, 1, 1,
0.8244178, -0.09738018, 1.646461, 1, 1, 1, 1, 1,
0.8247076, 0.6043847, 2.203957, 1, 1, 1, 1, 1,
0.8285469, -1.627588, 4.180165, 1, 1, 1, 1, 1,
0.8318777, 2.28859, 0.2751896, 1, 1, 1, 1, 1,
0.8331392, -1.193119, 2.758664, 1, 1, 1, 1, 1,
0.8333685, 0.4391391, 1.201644, 1, 1, 1, 1, 1,
0.8387302, -0.5692051, 1.601539, 1, 1, 1, 1, 1,
0.8387889, -0.7700493, 2.517241, 1, 1, 1, 1, 1,
0.8435929, 1.815401, 1.111983, 1, 1, 1, 1, 1,
0.8466358, -1.236237, 3.482464, 1, 1, 1, 1, 1,
0.8475903, 0.2283796, 1.483629, 1, 1, 1, 1, 1,
0.8476065, -0.07043563, -0.9022296, 1, 1, 1, 1, 1,
0.8492463, 0.7309793, 0.1606726, 1, 1, 1, 1, 1,
0.851293, 0.3241113, 2.820665, 1, 1, 1, 1, 1,
0.8519596, 0.5830509, 0.06643273, 1, 1, 1, 1, 1,
0.8533857, 0.832006, 0.921595, 0, 0, 1, 1, 1,
0.8539316, 0.8936585, 0.1582382, 1, 0, 0, 1, 1,
0.8555093, 1.293015, 0.2105783, 1, 0, 0, 1, 1,
0.8646317, 1.15203, -0.2111444, 1, 0, 0, 1, 1,
0.8646615, -0.1334495, 1.830665, 1, 0, 0, 1, 1,
0.8678382, -0.7049987, 3.170417, 1, 0, 0, 1, 1,
0.8687469, 0.3814161, 0.1956227, 0, 0, 0, 1, 1,
0.8694075, -0.008350775, 2.751965, 0, 0, 0, 1, 1,
0.875478, -0.9182041, 1.98417, 0, 0, 0, 1, 1,
0.8759834, 0.1395604, 0.6794034, 0, 0, 0, 1, 1,
0.8762046, -0.4431559, 2.040361, 0, 0, 0, 1, 1,
0.8794262, 0.7577083, 1.731939, 0, 0, 0, 1, 1,
0.8851005, 0.7726756, 1.669199, 0, 0, 0, 1, 1,
0.8869035, -0.2094338, 2.776087, 1, 1, 1, 1, 1,
0.89076, 0.1603147, 2.492593, 1, 1, 1, 1, 1,
0.9018214, -1.55939, 2.771501, 1, 1, 1, 1, 1,
0.906811, 0.313319, 1.154889, 1, 1, 1, 1, 1,
0.9075978, 0.5480843, 1.059185, 1, 1, 1, 1, 1,
0.9131778, 0.2444997, 0.7708833, 1, 1, 1, 1, 1,
0.9132152, -1.114958, 0.9901642, 1, 1, 1, 1, 1,
0.9159893, 0.2535815, 3.212497, 1, 1, 1, 1, 1,
0.9186282, 1.075592, -0.3134205, 1, 1, 1, 1, 1,
0.9206914, -1.5449, 2.743113, 1, 1, 1, 1, 1,
0.9276814, 0.3573306, 3.125927, 1, 1, 1, 1, 1,
0.9331702, -0.5286291, 2.807292, 1, 1, 1, 1, 1,
0.9340009, 0.004688839, 1.977238, 1, 1, 1, 1, 1,
0.9345461, -1.324064, 4.477949, 1, 1, 1, 1, 1,
0.9353178, 0.001771154, 0.9526265, 1, 1, 1, 1, 1,
0.9412516, 0.6673312, 1.211077, 0, 0, 1, 1, 1,
0.9424382, 0.2018001, 2.424051, 1, 0, 0, 1, 1,
0.9471962, -0.7070037, 2.026788, 1, 0, 0, 1, 1,
0.9515479, -1.765556, 2.86285, 1, 0, 0, 1, 1,
0.9705993, 1.161233, 1.172033, 1, 0, 0, 1, 1,
0.9722075, -0.04643264, 2.862239, 1, 0, 0, 1, 1,
0.9762796, 0.3239798, 1.058455, 0, 0, 0, 1, 1,
0.9804556, 1.787875, -1.833695, 0, 0, 0, 1, 1,
0.9860867, 2.137631, 1.937936, 0, 0, 0, 1, 1,
0.9884361, -0.5234301, 1.383126, 0, 0, 0, 1, 1,
0.9899885, 1.077497, 0.3527698, 0, 0, 0, 1, 1,
0.9912229, 1.059481, -0.3588161, 0, 0, 0, 1, 1,
0.9918351, 0.3891886, 0.8388373, 0, 0, 0, 1, 1,
0.9928104, 1.403076, 1.790877, 1, 1, 1, 1, 1,
1.003483, 1.369086, 0.9669378, 1, 1, 1, 1, 1,
1.006969, 1.590576, 1.334584, 1, 1, 1, 1, 1,
1.012194, 1.888563, 0.7059295, 1, 1, 1, 1, 1,
1.027014, -0.8724189, 2.475002, 1, 1, 1, 1, 1,
1.035649, 0.6024267, 2.367626, 1, 1, 1, 1, 1,
1.040451, -1.362695, 2.108912, 1, 1, 1, 1, 1,
1.047604, 0.5296522, 2.18924, 1, 1, 1, 1, 1,
1.066501, 0.1395257, 0.1558954, 1, 1, 1, 1, 1,
1.069518, 0.01981007, 4.022348, 1, 1, 1, 1, 1,
1.07709, 0.5754123, 1.634435, 1, 1, 1, 1, 1,
1.078292, -0.8737419, 2.346463, 1, 1, 1, 1, 1,
1.078342, -0.8927753, 2.178936, 1, 1, 1, 1, 1,
1.081665, -0.00975992, 1.156094, 1, 1, 1, 1, 1,
1.088945, 1.465509, 1.237968, 1, 1, 1, 1, 1,
1.09203, -0.7956825, 2.349999, 0, 0, 1, 1, 1,
1.093312, -0.5447991, 1.559427, 1, 0, 0, 1, 1,
1.094279, 1.94782, -0.4710958, 1, 0, 0, 1, 1,
1.096787, 0.733093, 0.2934389, 1, 0, 0, 1, 1,
1.097029, 1.123458, 0.5888757, 1, 0, 0, 1, 1,
1.10276, -0.04136251, 2.467225, 1, 0, 0, 1, 1,
1.104021, -0.4990806, 1.248788, 0, 0, 0, 1, 1,
1.105977, -1.41524, 2.063965, 0, 0, 0, 1, 1,
1.108845, 1.557774, 1.601287, 0, 0, 0, 1, 1,
1.109603, -0.008525652, 0.7622994, 0, 0, 0, 1, 1,
1.111782, -0.9814164, 0.7657548, 0, 0, 0, 1, 1,
1.113027, 0.7817112, 0.6085481, 0, 0, 0, 1, 1,
1.115036, -0.8321548, 2.33526, 0, 0, 0, 1, 1,
1.124599, 0.09823608, 2.604975, 1, 1, 1, 1, 1,
1.131621, 0.7109925, 0.1389044, 1, 1, 1, 1, 1,
1.131772, 1.093996, -1.208256, 1, 1, 1, 1, 1,
1.146848, 1.125265, 0.2728711, 1, 1, 1, 1, 1,
1.148292, -1.057206, 3.948836, 1, 1, 1, 1, 1,
1.150388, -0.497399, 1.256688, 1, 1, 1, 1, 1,
1.151118, 0.6762663, 0.839261, 1, 1, 1, 1, 1,
1.159275, -1.119676, 1.279204, 1, 1, 1, 1, 1,
1.161048, -0.07617632, -0.7142174, 1, 1, 1, 1, 1,
1.170214, 0.4633271, 2.704467, 1, 1, 1, 1, 1,
1.178053, 0.9416205, 0.465541, 1, 1, 1, 1, 1,
1.183017, 0.9736993, 1.259829, 1, 1, 1, 1, 1,
1.183681, -2.047834, 2.581556, 1, 1, 1, 1, 1,
1.185931, -0.2773843, 2.551645, 1, 1, 1, 1, 1,
1.187572, -1.495333, 2.983398, 1, 1, 1, 1, 1,
1.194072, 0.9704639, 1.719759, 0, 0, 1, 1, 1,
1.196873, 0.8179158, 2.165282, 1, 0, 0, 1, 1,
1.204307, 0.400543, 2.491541, 1, 0, 0, 1, 1,
1.206017, 1.300449, 0.618779, 1, 0, 0, 1, 1,
1.208379, 0.4409167, 0.4217631, 1, 0, 0, 1, 1,
1.214144, 1.238008, 0.4918969, 1, 0, 0, 1, 1,
1.214468, -2.316599, 1.242255, 0, 0, 0, 1, 1,
1.217888, 0.5733349, 0.6072205, 0, 0, 0, 1, 1,
1.218711, 0.7268117, 0.3759923, 0, 0, 0, 1, 1,
1.227719, 0.1622576, 3.137933, 0, 0, 0, 1, 1,
1.230064, 3.045078, -1.321709, 0, 0, 0, 1, 1,
1.231488, 0.3242173, 0.8643045, 0, 0, 0, 1, 1,
1.248467, -1.104465, 3.554642, 0, 0, 0, 1, 1,
1.260477, 1.238441, -0.1855702, 1, 1, 1, 1, 1,
1.260584, -0.2471586, 3.558457, 1, 1, 1, 1, 1,
1.264591, -2.120616, 3.518697, 1, 1, 1, 1, 1,
1.274401, -1.125085, 2.443514, 1, 1, 1, 1, 1,
1.274742, -1.26274, 3.048856, 1, 1, 1, 1, 1,
1.281507, 1.189495, 2.479473, 1, 1, 1, 1, 1,
1.282056, -0.07989059, 1.864085, 1, 1, 1, 1, 1,
1.28484, -0.3701926, 1.506518, 1, 1, 1, 1, 1,
1.28866, -0.1828126, 2.129392, 1, 1, 1, 1, 1,
1.300753, -0.6245727, 0.9526744, 1, 1, 1, 1, 1,
1.310751, -0.7002666, 3.933928, 1, 1, 1, 1, 1,
1.316197, -0.2562654, 2.306636, 1, 1, 1, 1, 1,
1.324195, 0.1108415, 2.345648, 1, 1, 1, 1, 1,
1.326181, 0.4554249, 3.004514, 1, 1, 1, 1, 1,
1.330158, 1.591716, 0.6530181, 1, 1, 1, 1, 1,
1.334415, -1.660317, 2.105062, 0, 0, 1, 1, 1,
1.340032, 0.5168876, 0.371011, 1, 0, 0, 1, 1,
1.343847, -1.186523, 3.026125, 1, 0, 0, 1, 1,
1.348551, 0.9275082, 0.9091758, 1, 0, 0, 1, 1,
1.349092, 1.494615, 0.5083417, 1, 0, 0, 1, 1,
1.362146, -0.09656728, 1.917196, 1, 0, 0, 1, 1,
1.365717, -0.8885627, 2.224, 0, 0, 0, 1, 1,
1.369422, -1.276327, 2.475319, 0, 0, 0, 1, 1,
1.370793, -0.07360674, 1.469002, 0, 0, 0, 1, 1,
1.382056, 0.467371, 0.6790752, 0, 0, 0, 1, 1,
1.38789, -0.1022093, 3.033193, 0, 0, 0, 1, 1,
1.400071, 0.1143594, 0.9392896, 0, 0, 0, 1, 1,
1.409445, 0.6160688, 2.729968, 0, 0, 0, 1, 1,
1.418199, 0.786671, 0.7597787, 1, 1, 1, 1, 1,
1.427795, -1.025134, 1.608238, 1, 1, 1, 1, 1,
1.429735, 0.2456898, 0.7016444, 1, 1, 1, 1, 1,
1.458721, -1.461318, 4.31242, 1, 1, 1, 1, 1,
1.46497, -0.1468279, 3.224339, 1, 1, 1, 1, 1,
1.470997, 0.2582764, 0.8937714, 1, 1, 1, 1, 1,
1.474674, -1.24509, 1.961724, 1, 1, 1, 1, 1,
1.482084, 0.824213, 2.647573, 1, 1, 1, 1, 1,
1.485869, 0.1988185, 1.622515, 1, 1, 1, 1, 1,
1.497783, -0.3748959, 2.016147, 1, 1, 1, 1, 1,
1.508829, -0.1424147, 1.921869, 1, 1, 1, 1, 1,
1.509463, 0.5273349, 1.954555, 1, 1, 1, 1, 1,
1.515505, -1.526175, 2.897051, 1, 1, 1, 1, 1,
1.524671, 0.4980039, 0.6937647, 1, 1, 1, 1, 1,
1.525502, 0.865216, 0.4778871, 1, 1, 1, 1, 1,
1.534879, 0.6343854, 2.095548, 0, 0, 1, 1, 1,
1.560986, -0.5913935, 2.388103, 1, 0, 0, 1, 1,
1.56508, -0.4589407, 1.788705, 1, 0, 0, 1, 1,
1.570418, 0.1629317, 1.38213, 1, 0, 0, 1, 1,
1.572284, 0.6720693, 0.3090617, 1, 0, 0, 1, 1,
1.575695, 0.03612922, 2.634667, 1, 0, 0, 1, 1,
1.585708, 1.256427, 0.6618995, 0, 0, 0, 1, 1,
1.588025, 1.545936, 0.1059575, 0, 0, 0, 1, 1,
1.595995, 0.02132322, 0.92649, 0, 0, 0, 1, 1,
1.60339, -0.8422233, 2.212237, 0, 0, 0, 1, 1,
1.605244, -0.6028239, 1.964219, 0, 0, 0, 1, 1,
1.610301, -1.06823, 0.06718552, 0, 0, 0, 1, 1,
1.629516, -0.634151, 2.554133, 0, 0, 0, 1, 1,
1.633483, -0.07200674, 1.621048, 1, 1, 1, 1, 1,
1.653636, -0.3542639, 3.347717, 1, 1, 1, 1, 1,
1.705751, 1.085877, 1.231767, 1, 1, 1, 1, 1,
1.711461, 1.338737, -0.6102431, 1, 1, 1, 1, 1,
1.712115, 0.06019344, 2.584848, 1, 1, 1, 1, 1,
1.713231, -0.2706704, 2.306417, 1, 1, 1, 1, 1,
1.717417, -1.196459, 2.234168, 1, 1, 1, 1, 1,
1.718256, -0.3426082, 1.863904, 1, 1, 1, 1, 1,
1.736896, 0.1991953, 0.5647979, 1, 1, 1, 1, 1,
1.742661, -1.1694, 3.047094, 1, 1, 1, 1, 1,
1.760898, 1.012285, 1.004399, 1, 1, 1, 1, 1,
1.765879, 0.3408827, -0.6481947, 1, 1, 1, 1, 1,
1.780759, -0.5033914, 0.9869597, 1, 1, 1, 1, 1,
1.794266, 0.1425932, 0.7053632, 1, 1, 1, 1, 1,
1.801572, -0.01867726, 0.4554491, 1, 1, 1, 1, 1,
1.806767, -0.6060287, 1.501452, 0, 0, 1, 1, 1,
1.815772, 0.2832611, 1.879083, 1, 0, 0, 1, 1,
1.824787, 0.07047696, 1.010536, 1, 0, 0, 1, 1,
1.832013, 0.9935386, 1.777005, 1, 0, 0, 1, 1,
1.848742, -2.301265, 2.570601, 1, 0, 0, 1, 1,
1.851313, -0.06938546, 1.97287, 1, 0, 0, 1, 1,
1.852181, -0.3245919, 3.053077, 0, 0, 0, 1, 1,
1.866226, -0.2314842, 1.222005, 0, 0, 0, 1, 1,
1.867501, -0.6616322, 1.624205, 0, 0, 0, 1, 1,
1.879697, 1.014784, 0.9566187, 0, 0, 0, 1, 1,
1.915806, 0.3678281, 2.430717, 0, 0, 0, 1, 1,
1.922983, -0.3383987, 2.632669, 0, 0, 0, 1, 1,
1.923014, -0.6349611, 2.760965, 0, 0, 0, 1, 1,
1.942305, 0.5703447, 1.908404, 1, 1, 1, 1, 1,
1.951533, -0.4224598, 2.18442, 1, 1, 1, 1, 1,
1.957115, 0.2801136, -1.012068, 1, 1, 1, 1, 1,
1.959221, -0.1684196, 3.15821, 1, 1, 1, 1, 1,
1.99681, 0.05963214, 2.157081, 1, 1, 1, 1, 1,
2.006259, -0.3182735, -0.4175804, 1, 1, 1, 1, 1,
2.00763, -0.7275459, 2.206645, 1, 1, 1, 1, 1,
2.011837, 0.792148, 2.509048, 1, 1, 1, 1, 1,
2.030359, 1.079471, 1.995905, 1, 1, 1, 1, 1,
2.031888, 0.2320651, 0.4139479, 1, 1, 1, 1, 1,
2.033604, 0.1074665, 1.628437, 1, 1, 1, 1, 1,
2.045257, 1.843105, -1.107763, 1, 1, 1, 1, 1,
2.067198, -0.09025762, 1.920817, 1, 1, 1, 1, 1,
2.081939, -1.016138, 1.618195, 1, 1, 1, 1, 1,
2.090459, -0.1596455, 0.6990656, 1, 1, 1, 1, 1,
2.097084, 0.4721518, 2.150694, 0, 0, 1, 1, 1,
2.101562, -0.2316424, 0.7909566, 1, 0, 0, 1, 1,
2.128826, 1.042364, 0.7603366, 1, 0, 0, 1, 1,
2.146667, -0.9427871, 2.366657, 1, 0, 0, 1, 1,
2.151468, -1.130385, 0.1515065, 1, 0, 0, 1, 1,
2.163372, -0.8554011, 1.846363, 1, 0, 0, 1, 1,
2.235966, -0.4466598, 1.724411, 0, 0, 0, 1, 1,
2.266802, 0.07360132, 2.213232, 0, 0, 0, 1, 1,
2.320556, -0.08456533, -0.9006484, 0, 0, 0, 1, 1,
2.336753, -0.001341629, 1.960422, 0, 0, 0, 1, 1,
2.346847, 0.9044495, 0.7630113, 0, 0, 0, 1, 1,
2.376694, -0.8391502, 3.014039, 0, 0, 0, 1, 1,
2.464315, -0.4961235, 1.327654, 0, 0, 0, 1, 1,
2.470192, 0.2664306, 0.8779854, 1, 1, 1, 1, 1,
2.476089, -0.07874744, 3.424024, 1, 1, 1, 1, 1,
2.599306, -0.4691733, -0.1501582, 1, 1, 1, 1, 1,
2.614983, 1.241379, 1.115103, 1, 1, 1, 1, 1,
2.848122, -0.1585259, 0.9543603, 1, 1, 1, 1, 1,
3.12048, 0.6963589, 2.237442, 1, 1, 1, 1, 1,
3.634582, 0.511272, 0.8983381, 1, 1, 1, 1, 1
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
var radius = 9.283258;
var distance = 32.60705;
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
mvMatrix.translate( -0.3597002, 0.07131529, -0.01684952 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.60705);
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
