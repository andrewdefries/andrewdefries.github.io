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
-2.802466, 1.769535, 0.8092463, 1, 0, 0, 1,
-2.63862, -1.46052, -2.648425, 1, 0.007843138, 0, 1,
-2.55775, -0.16995, -2.412715, 1, 0.01176471, 0, 1,
-2.547594, 1.149035, -2.533229, 1, 0.01960784, 0, 1,
-2.522499, 0.1121536, -1.04958, 1, 0.02352941, 0, 1,
-2.509605, 2.23384, 0.3533993, 1, 0.03137255, 0, 1,
-2.452586, 1.253351, -1.053837, 1, 0.03529412, 0, 1,
-2.36163, -0.1769301, -1.279301, 1, 0.04313726, 0, 1,
-2.305131, 0.03477167, -2.211539, 1, 0.04705882, 0, 1,
-2.305006, 0.2749471, -0.1252315, 1, 0.05490196, 0, 1,
-2.293569, -2.424186, -3.2608, 1, 0.05882353, 0, 1,
-2.267399, 0.1520563, -1.437959, 1, 0.06666667, 0, 1,
-2.205426, 1.141985, -1.907993, 1, 0.07058824, 0, 1,
-2.197846, -1.395584, -2.516337, 1, 0.07843138, 0, 1,
-2.189518, 0.8085998, -0.9009733, 1, 0.08235294, 0, 1,
-2.147213, 0.09230092, -1.800075, 1, 0.09019608, 0, 1,
-2.109367, -0.6433784, -1.66432, 1, 0.09411765, 0, 1,
-2.075857, 0.1622283, -2.926522, 1, 0.1019608, 0, 1,
-2.04074, -0.4016724, -1.013048, 1, 0.1098039, 0, 1,
-2.012738, 2.648289, -2.036255, 1, 0.1137255, 0, 1,
-1.982918, 1.941579, 0.1123052, 1, 0.1215686, 0, 1,
-1.978451, -0.4889984, -0.8304252, 1, 0.1254902, 0, 1,
-1.924658, -1.749731, -2.071903, 1, 0.1333333, 0, 1,
-1.905094, 2.813778, -0.8067598, 1, 0.1372549, 0, 1,
-1.891753, 1.817847, -1.7953, 1, 0.145098, 0, 1,
-1.891058, -0.8914796, -2.206537, 1, 0.1490196, 0, 1,
-1.890451, 1.601284, -0.116424, 1, 0.1568628, 0, 1,
-1.88782, 0.3381219, -0.7010843, 1, 0.1607843, 0, 1,
-1.88303, 0.4091713, -1.675655, 1, 0.1686275, 0, 1,
-1.879657, -0.158836, -1.121508, 1, 0.172549, 0, 1,
-1.879217, -0.184613, -0.8594106, 1, 0.1803922, 0, 1,
-1.876651, -0.6026778, -2.341968, 1, 0.1843137, 0, 1,
-1.867598, -0.1939752, -3.044915, 1, 0.1921569, 0, 1,
-1.862255, -0.4191218, -1.09944, 1, 0.1960784, 0, 1,
-1.853065, 0.4719243, -1.157909, 1, 0.2039216, 0, 1,
-1.846148, -0.3986963, -2.719075, 1, 0.2117647, 0, 1,
-1.827763, 1.551433, -0.2185806, 1, 0.2156863, 0, 1,
-1.800295, 1.721642, -0.8795816, 1, 0.2235294, 0, 1,
-1.755921, -0.1481392, -1.220243, 1, 0.227451, 0, 1,
-1.750688, -0.2989, -3.101045, 1, 0.2352941, 0, 1,
-1.725752, -0.07251538, -2.141266, 1, 0.2392157, 0, 1,
-1.720242, 0.957087, 0.8829563, 1, 0.2470588, 0, 1,
-1.713359, 0.6691884, -1.969957, 1, 0.2509804, 0, 1,
-1.709285, 0.7413971, -1.173774, 1, 0.2588235, 0, 1,
-1.69074, 0.1146277, -1.433208, 1, 0.2627451, 0, 1,
-1.681706, 0.9948959, -2.346699, 1, 0.2705882, 0, 1,
-1.676191, 0.2429291, -3.028402, 1, 0.2745098, 0, 1,
-1.67605, 0.2860633, -0.1167503, 1, 0.282353, 0, 1,
-1.623829, 0.8088765, -0.8374712, 1, 0.2862745, 0, 1,
-1.6206, 0.4065951, -0.5605579, 1, 0.2941177, 0, 1,
-1.618907, 1.047345, -2.021752, 1, 0.3019608, 0, 1,
-1.611165, 1.260443, -0.4914739, 1, 0.3058824, 0, 1,
-1.610463, -1.90449, -2.209851, 1, 0.3137255, 0, 1,
-1.608124, 0.3066246, -0.5310328, 1, 0.3176471, 0, 1,
-1.600452, 0.4113984, -1.167822, 1, 0.3254902, 0, 1,
-1.585073, 0.1959395, -2.083064, 1, 0.3294118, 0, 1,
-1.580488, 1.772201, 0.7939483, 1, 0.3372549, 0, 1,
-1.575006, -2.097202, -0.5149505, 1, 0.3411765, 0, 1,
-1.572803, -0.4574897, -0.8110402, 1, 0.3490196, 0, 1,
-1.567686, 2.198722, 1.584643, 1, 0.3529412, 0, 1,
-1.567066, -0.665123, -3.502433, 1, 0.3607843, 0, 1,
-1.556371, -0.2667856, -2.887938, 1, 0.3647059, 0, 1,
-1.550089, -0.7586161, -1.960708, 1, 0.372549, 0, 1,
-1.534671, 0.5427287, -0.2852998, 1, 0.3764706, 0, 1,
-1.519587, 0.8086962, -0.6312817, 1, 0.3843137, 0, 1,
-1.511355, 1.410919, -1.769733, 1, 0.3882353, 0, 1,
-1.494377, -0.4797631, -0.03282023, 1, 0.3960784, 0, 1,
-1.480679, 0.06092661, -1.653705, 1, 0.4039216, 0, 1,
-1.470327, 1.188127, -1.367953, 1, 0.4078431, 0, 1,
-1.46428, 2.745558, -1.203602, 1, 0.4156863, 0, 1,
-1.461507, -1.146811, -3.268206, 1, 0.4196078, 0, 1,
-1.461443, 1.762012, 0.04059182, 1, 0.427451, 0, 1,
-1.455504, -0.573417, -1.940854, 1, 0.4313726, 0, 1,
-1.445767, -0.6356277, -1.111987, 1, 0.4392157, 0, 1,
-1.440283, -0.4012024, -0.2161544, 1, 0.4431373, 0, 1,
-1.439482, 0.3598411, -0.2431393, 1, 0.4509804, 0, 1,
-1.427113, -1.347192, -1.9413, 1, 0.454902, 0, 1,
-1.420073, -1.417812, -2.802591, 1, 0.4627451, 0, 1,
-1.416719, -1.816106, -1.39866, 1, 0.4666667, 0, 1,
-1.399136, -1.144264, -1.097808, 1, 0.4745098, 0, 1,
-1.398831, 0.3884958, -2.108803, 1, 0.4784314, 0, 1,
-1.398015, -0.5064285, -3.919023, 1, 0.4862745, 0, 1,
-1.397312, 0.1430119, -1.378846, 1, 0.4901961, 0, 1,
-1.393707, -1.132225, -2.365984, 1, 0.4980392, 0, 1,
-1.388263, -0.215436, -2.017567, 1, 0.5058824, 0, 1,
-1.381892, 2.299175, -0.7557951, 1, 0.509804, 0, 1,
-1.379624, -0.7011039, -0.3846671, 1, 0.5176471, 0, 1,
-1.363583, 0.6548107, 0.08992243, 1, 0.5215687, 0, 1,
-1.362364, -0.2860507, -1.876355, 1, 0.5294118, 0, 1,
-1.358538, -0.2749434, 0.8489006, 1, 0.5333334, 0, 1,
-1.349389, 1.821643, 0.353762, 1, 0.5411765, 0, 1,
-1.345617, -1.58515, -3.153605, 1, 0.5450981, 0, 1,
-1.339565, -1.68129, -1.797053, 1, 0.5529412, 0, 1,
-1.322288, 0.5329911, -2.142431, 1, 0.5568628, 0, 1,
-1.320099, -0.1746453, -0.7249441, 1, 0.5647059, 0, 1,
-1.306405, -0.9477579, -2.631861, 1, 0.5686275, 0, 1,
-1.305548, 1.466327, -0.8179192, 1, 0.5764706, 0, 1,
-1.295507, -0.7331935, -1.599836, 1, 0.5803922, 0, 1,
-1.291359, -0.03765229, -2.051743, 1, 0.5882353, 0, 1,
-1.291092, 0.8651117, -0.05628491, 1, 0.5921569, 0, 1,
-1.288179, 0.4902284, -2.126569, 1, 0.6, 0, 1,
-1.285151, 1.078003, -0.9009109, 1, 0.6078432, 0, 1,
-1.284444, 0.1676456, -2.898826, 1, 0.6117647, 0, 1,
-1.277726, -0.4289053, -1.242418, 1, 0.6196079, 0, 1,
-1.270954, -0.5647473, -1.479788, 1, 0.6235294, 0, 1,
-1.264147, -2.4756, -2.981229, 1, 0.6313726, 0, 1,
-1.257835, 0.5211172, -2.285864, 1, 0.6352941, 0, 1,
-1.257199, 1.317227, -1.431265, 1, 0.6431373, 0, 1,
-1.256719, 1.035955, -1.357571, 1, 0.6470588, 0, 1,
-1.255899, -0.2029622, -2.209629, 1, 0.654902, 0, 1,
-1.253464, 1.951181, -1.211477, 1, 0.6588235, 0, 1,
-1.251982, 0.1431109, -1.535254, 1, 0.6666667, 0, 1,
-1.25096, -0.0002116539, -0.6655692, 1, 0.6705883, 0, 1,
-1.243245, 0.2792132, -1.137143, 1, 0.6784314, 0, 1,
-1.235806, -1.968488, -2.320293, 1, 0.682353, 0, 1,
-1.231821, 0.1406112, -1.460294, 1, 0.6901961, 0, 1,
-1.228312, 0.4978209, -2.487203, 1, 0.6941177, 0, 1,
-1.225615, 2.630984, -0.02620849, 1, 0.7019608, 0, 1,
-1.204809, 0.1503017, -1.941229, 1, 0.7098039, 0, 1,
-1.196165, 0.8395094, -0.649518, 1, 0.7137255, 0, 1,
-1.185245, 1.496447, -0.9139165, 1, 0.7215686, 0, 1,
-1.184601, -0.2751735, -2.488164, 1, 0.7254902, 0, 1,
-1.165406, 0.3916572, -1.93512, 1, 0.7333333, 0, 1,
-1.164999, -0.2591062, -0.686025, 1, 0.7372549, 0, 1,
-1.154458, 0.2568744, 0.1164924, 1, 0.7450981, 0, 1,
-1.153128, -0.3182189, -2.012893, 1, 0.7490196, 0, 1,
-1.147797, 0.4262781, -2.559618, 1, 0.7568628, 0, 1,
-1.144591, 0.506273, 0.5840327, 1, 0.7607843, 0, 1,
-1.141814, -0.2175369, -1.79387, 1, 0.7686275, 0, 1,
-1.137449, -0.7207666, -3.526365, 1, 0.772549, 0, 1,
-1.136541, 1.40181, -2.826517, 1, 0.7803922, 0, 1,
-1.135809, 0.6371862, -2.424402, 1, 0.7843137, 0, 1,
-1.129247, -0.6470351, -1.17652, 1, 0.7921569, 0, 1,
-1.122637, 1.562577, 0.5642915, 1, 0.7960784, 0, 1,
-1.115283, 0.7867758, -1.717409, 1, 0.8039216, 0, 1,
-1.111921, 0.2046004, -3.494227, 1, 0.8117647, 0, 1,
-1.110708, -0.5743547, -1.483527, 1, 0.8156863, 0, 1,
-1.104447, 1.898534, -1.704237, 1, 0.8235294, 0, 1,
-1.103522, 0.2192676, -0.3901777, 1, 0.827451, 0, 1,
-1.100281, 0.178429, -1.667271, 1, 0.8352941, 0, 1,
-1.099105, -1.536872, -2.496948, 1, 0.8392157, 0, 1,
-1.091747, 0.5071076, -1.367101, 1, 0.8470588, 0, 1,
-1.090817, -0.8078193, -2.87926, 1, 0.8509804, 0, 1,
-1.08373, 0.2785921, -2.085901, 1, 0.8588235, 0, 1,
-1.082578, -0.6238102, -1.568036, 1, 0.8627451, 0, 1,
-1.076876, 0.9768057, -1.291108, 1, 0.8705882, 0, 1,
-1.073023, -0.5467983, -0.2765038, 1, 0.8745098, 0, 1,
-1.072058, -0.9431641, -2.203398, 1, 0.8823529, 0, 1,
-1.063719, -2.382753, -2.420158, 1, 0.8862745, 0, 1,
-1.062892, -0.9375967, -2.833027, 1, 0.8941177, 0, 1,
-1.057022, 0.4800507, -0.360064, 1, 0.8980392, 0, 1,
-1.056134, 2.09086, 0.6886464, 1, 0.9058824, 0, 1,
-1.05262, -0.9392145, -0.7066017, 1, 0.9137255, 0, 1,
-1.038727, 0.2478214, -0.4488724, 1, 0.9176471, 0, 1,
-1.035363, -1.689554, -3.192584, 1, 0.9254902, 0, 1,
-1.032927, 1.861208, 1.101797, 1, 0.9294118, 0, 1,
-1.023118, 1.396794, 0.7659803, 1, 0.9372549, 0, 1,
-1.008479, -0.3134277, -1.24314, 1, 0.9411765, 0, 1,
-1.007734, -0.749722, -2.157687, 1, 0.9490196, 0, 1,
-1.002187, -1.399097, -3.478279, 1, 0.9529412, 0, 1,
-0.9968058, 0.1969417, -2.048282, 1, 0.9607843, 0, 1,
-0.9861203, -0.6370432, -2.311829, 1, 0.9647059, 0, 1,
-0.9805257, 0.01334813, -1.755964, 1, 0.972549, 0, 1,
-0.9788091, 1.448629, -0.7449637, 1, 0.9764706, 0, 1,
-0.9747332, 1.243515, -1.044415, 1, 0.9843137, 0, 1,
-0.9718754, -1.56059, -2.712964, 1, 0.9882353, 0, 1,
-0.9707249, -0.4521199, -1.157524, 1, 0.9960784, 0, 1,
-0.9701612, -0.655144, 0.5331668, 0.9960784, 1, 0, 1,
-0.9680523, 0.6933694, -0.3597676, 0.9921569, 1, 0, 1,
-0.9676319, 0.3151831, -1.510207, 0.9843137, 1, 0, 1,
-0.9675769, 0.8537672, -1.145358, 0.9803922, 1, 0, 1,
-0.9673643, 0.342764, -1.224479, 0.972549, 1, 0, 1,
-0.966571, -1.190063, -1.728006, 0.9686275, 1, 0, 1,
-0.963677, -0.1941417, -4.27054, 0.9607843, 1, 0, 1,
-0.9605793, -0.5946168, -0.126157, 0.9568627, 1, 0, 1,
-0.9585863, -1.425459, -3.540258, 0.9490196, 1, 0, 1,
-0.9582235, 0.1558564, -1.851333, 0.945098, 1, 0, 1,
-0.9577731, -0.7739902, -1.99119, 0.9372549, 1, 0, 1,
-0.9534094, -0.03987423, -3.394237, 0.9333333, 1, 0, 1,
-0.9506301, -0.4156705, -2.090535, 0.9254902, 1, 0, 1,
-0.9490689, -0.7122901, -1.561077, 0.9215686, 1, 0, 1,
-0.9447728, -0.2390167, -3.173693, 0.9137255, 1, 0, 1,
-0.9422862, -1.459809, -3.334866, 0.9098039, 1, 0, 1,
-0.9406494, -0.5347154, -0.9137253, 0.9019608, 1, 0, 1,
-0.939276, -2.011329, -3.295806, 0.8941177, 1, 0, 1,
-0.9267841, 0.8368027, -0.9048707, 0.8901961, 1, 0, 1,
-0.9238783, -1.26994, -2.155507, 0.8823529, 1, 0, 1,
-0.9218847, 1.441328, -0.8212217, 0.8784314, 1, 0, 1,
-0.9174402, -0.2757559, -2.161948, 0.8705882, 1, 0, 1,
-0.9162471, 0.3600705, -1.138223, 0.8666667, 1, 0, 1,
-0.9095131, 1.570115, -0.992124, 0.8588235, 1, 0, 1,
-0.9027518, -1.570961, -3.896515, 0.854902, 1, 0, 1,
-0.8940656, 1.159582, -1.581628, 0.8470588, 1, 0, 1,
-0.8917046, 2.117079, 1.531586, 0.8431373, 1, 0, 1,
-0.8885861, -1.850557, -2.836482, 0.8352941, 1, 0, 1,
-0.8849247, 0.6155903, -0.8682244, 0.8313726, 1, 0, 1,
-0.8846318, 0.1090269, -0.6854482, 0.8235294, 1, 0, 1,
-0.8766024, 2.990561, -1.362013, 0.8196079, 1, 0, 1,
-0.8749105, -2.254031, -3.228821, 0.8117647, 1, 0, 1,
-0.8743525, 2.027107, -0.4970969, 0.8078431, 1, 0, 1,
-0.8713577, 0.1450629, -1.831934, 0.8, 1, 0, 1,
-0.8701125, -1.131176, -2.085466, 0.7921569, 1, 0, 1,
-0.8579099, -0.06837242, -1.616063, 0.7882353, 1, 0, 1,
-0.8558825, -0.6909403, -2.431861, 0.7803922, 1, 0, 1,
-0.8443593, 0.066575, -1.89338, 0.7764706, 1, 0, 1,
-0.8433461, -0.3401921, -2.668224, 0.7686275, 1, 0, 1,
-0.8414909, 0.523267, -2.417618, 0.7647059, 1, 0, 1,
-0.8409598, 1.061827, 0.1018975, 0.7568628, 1, 0, 1,
-0.8390332, -0.05261829, -0.2833308, 0.7529412, 1, 0, 1,
-0.8383645, 0.3517836, -0.9543649, 0.7450981, 1, 0, 1,
-0.8372875, 1.504291, -0.5110091, 0.7411765, 1, 0, 1,
-0.834455, 0.4967187, -2.630813, 0.7333333, 1, 0, 1,
-0.8310099, -1.414015, -2.692719, 0.7294118, 1, 0, 1,
-0.8308032, -1.889973, -2.021619, 0.7215686, 1, 0, 1,
-0.8210207, -1.180491, -0.3810685, 0.7176471, 1, 0, 1,
-0.8169357, -0.9088559, -2.361927, 0.7098039, 1, 0, 1,
-0.813404, -0.5668528, -1.702732, 0.7058824, 1, 0, 1,
-0.8092096, -1.227957, -4.83297, 0.6980392, 1, 0, 1,
-0.8082255, -1.34773, -4.131649, 0.6901961, 1, 0, 1,
-0.8038182, -1.062453, -2.37706, 0.6862745, 1, 0, 1,
-0.801586, 0.8112249, -2.929216, 0.6784314, 1, 0, 1,
-0.8006549, 1.64364, -1.643609, 0.6745098, 1, 0, 1,
-0.7942703, -0.004612814, -1.014379, 0.6666667, 1, 0, 1,
-0.7904108, -0.6560771, -1.511125, 0.6627451, 1, 0, 1,
-0.7885879, 2.316943, -0.3017422, 0.654902, 1, 0, 1,
-0.7871239, 0.9597259, -0.3472864, 0.6509804, 1, 0, 1,
-0.7849672, 0.2589602, -2.457206, 0.6431373, 1, 0, 1,
-0.7795762, -0.05125229, -0.5686051, 0.6392157, 1, 0, 1,
-0.7758825, 1.816304, 1.455087, 0.6313726, 1, 0, 1,
-0.7724878, 0.05660944, -1.843121, 0.627451, 1, 0, 1,
-0.7693272, 0.783864, -0.9133326, 0.6196079, 1, 0, 1,
-0.7580376, -1.313523, -3.640892, 0.6156863, 1, 0, 1,
-0.7541322, 0.467867, 0.05296865, 0.6078432, 1, 0, 1,
-0.7501129, -0.8652703, -2.382561, 0.6039216, 1, 0, 1,
-0.7431539, 0.5700824, 1.144938, 0.5960785, 1, 0, 1,
-0.7345386, 0.1153427, -3.028571, 0.5882353, 1, 0, 1,
-0.7345263, -0.7658035, -2.441266, 0.5843138, 1, 0, 1,
-0.7331935, -1.456384, -2.230656, 0.5764706, 1, 0, 1,
-0.7310265, -0.2595527, 0.145657, 0.572549, 1, 0, 1,
-0.7291843, -0.07842714, -1.891224, 0.5647059, 1, 0, 1,
-0.7281458, -0.6451216, -1.060781, 0.5607843, 1, 0, 1,
-0.727226, -1.183345, -2.571709, 0.5529412, 1, 0, 1,
-0.7209772, 0.1263319, -2.181639, 0.5490196, 1, 0, 1,
-0.7173333, -2.011012, -2.832689, 0.5411765, 1, 0, 1,
-0.7169021, -0.2830662, -2.101099, 0.5372549, 1, 0, 1,
-0.716714, -0.4417235, -1.548631, 0.5294118, 1, 0, 1,
-0.7157535, -0.5532376, -0.4589631, 0.5254902, 1, 0, 1,
-0.7115833, -1.848692, -3.67035, 0.5176471, 1, 0, 1,
-0.7015694, -0.9068263, -2.918228, 0.5137255, 1, 0, 1,
-0.693601, 0.3111283, -1.253807, 0.5058824, 1, 0, 1,
-0.6929593, -0.7251345, -3.158773, 0.5019608, 1, 0, 1,
-0.6915442, -0.212393, -3.225771, 0.4941176, 1, 0, 1,
-0.6893478, -1.53414, -1.510957, 0.4862745, 1, 0, 1,
-0.6879484, 0.6115952, -1.424871, 0.4823529, 1, 0, 1,
-0.6872534, 1.058167, -1.270934, 0.4745098, 1, 0, 1,
-0.6795549, 0.5439256, -1.239602, 0.4705882, 1, 0, 1,
-0.6789432, 0.1240837, -1.050649, 0.4627451, 1, 0, 1,
-0.6771576, 0.1045058, -1.090551, 0.4588235, 1, 0, 1,
-0.6737514, 1.585035, -0.560577, 0.4509804, 1, 0, 1,
-0.6666442, 0.2549147, 0.2914869, 0.4470588, 1, 0, 1,
-0.6651487, -0.3094376, -1.048335, 0.4392157, 1, 0, 1,
-0.6632091, -1.780789, -2.19137, 0.4352941, 1, 0, 1,
-0.6630705, -0.09690525, -1.91502, 0.427451, 1, 0, 1,
-0.6577109, -0.9551668, -3.219285, 0.4235294, 1, 0, 1,
-0.654073, 0.3610042, -0.2455975, 0.4156863, 1, 0, 1,
-0.6462304, 1.478136, -0.3779498, 0.4117647, 1, 0, 1,
-0.6444188, 0.1154269, -1.969645, 0.4039216, 1, 0, 1,
-0.6418507, 0.4622136, -0.9791363, 0.3960784, 1, 0, 1,
-0.6407861, -0.894763, -2.594802, 0.3921569, 1, 0, 1,
-0.6310089, -1.559188, -2.656559, 0.3843137, 1, 0, 1,
-0.61449, 0.3337897, -2.341444, 0.3803922, 1, 0, 1,
-0.6081948, 0.8973258, -1.141966, 0.372549, 1, 0, 1,
-0.6054136, 0.2766822, -1.591336, 0.3686275, 1, 0, 1,
-0.602815, 1.069263, 0.7202285, 0.3607843, 1, 0, 1,
-0.5970361, -0.4907986, -3.796574, 0.3568628, 1, 0, 1,
-0.588203, 0.6540755, -0.6189448, 0.3490196, 1, 0, 1,
-0.5880526, 0.315246, -2.033507, 0.345098, 1, 0, 1,
-0.5879153, -0.5764308, -1.335577, 0.3372549, 1, 0, 1,
-0.5877722, 1.261777, -0.008560444, 0.3333333, 1, 0, 1,
-0.5839438, 1.462119, -1.292009, 0.3254902, 1, 0, 1,
-0.5813441, 0.2200263, -0.7069665, 0.3215686, 1, 0, 1,
-0.5791075, -0.613704, -2.562869, 0.3137255, 1, 0, 1,
-0.5782058, -1.070775, -0.69658, 0.3098039, 1, 0, 1,
-0.5755565, 0.2407183, -0.4230693, 0.3019608, 1, 0, 1,
-0.5749632, -0.3744717, -1.646166, 0.2941177, 1, 0, 1,
-0.5741291, -0.4918233, -1.132487, 0.2901961, 1, 0, 1,
-0.573436, -0.3160857, -0.1380336, 0.282353, 1, 0, 1,
-0.5680069, -0.4480249, -2.435769, 0.2784314, 1, 0, 1,
-0.5628449, 0.3467458, -0.1390457, 0.2705882, 1, 0, 1,
-0.5589817, 0.333541, -2.681442, 0.2666667, 1, 0, 1,
-0.5458716, -0.2868637, -2.282721, 0.2588235, 1, 0, 1,
-0.5434209, -0.471536, -1.984372, 0.254902, 1, 0, 1,
-0.5354692, -1.178669, -2.289519, 0.2470588, 1, 0, 1,
-0.5319568, 1.677361, -0.04396653, 0.2431373, 1, 0, 1,
-0.5267767, -1.562924, -3.527761, 0.2352941, 1, 0, 1,
-0.5244519, 0.8816758, -1.43194, 0.2313726, 1, 0, 1,
-0.5223797, -0.1707975, -2.311695, 0.2235294, 1, 0, 1,
-0.5196506, -0.7011606, -3.858567, 0.2196078, 1, 0, 1,
-0.513, -2.74932, -1.403817, 0.2117647, 1, 0, 1,
-0.5115141, -0.6530227, -2.160017, 0.2078431, 1, 0, 1,
-0.5065194, 0.05345737, -2.100529, 0.2, 1, 0, 1,
-0.5025132, 0.2114961, -0.2123237, 0.1921569, 1, 0, 1,
-0.5001807, 0.6875044, -0.644967, 0.1882353, 1, 0, 1,
-0.4978995, -0.360977, -1.937437, 0.1803922, 1, 0, 1,
-0.4976958, 1.601602, 0.7493089, 0.1764706, 1, 0, 1,
-0.49552, -0.1359006, -2.114142, 0.1686275, 1, 0, 1,
-0.4918973, 0.5816202, -0.4727994, 0.1647059, 1, 0, 1,
-0.4880379, -0.4874251, -1.685568, 0.1568628, 1, 0, 1,
-0.4878808, -0.2768724, -0.4175974, 0.1529412, 1, 0, 1,
-0.4874346, 0.45085, -2.512774, 0.145098, 1, 0, 1,
-0.4862893, 0.2047262, -3.768725, 0.1411765, 1, 0, 1,
-0.4843607, 0.3298739, -0.7593073, 0.1333333, 1, 0, 1,
-0.4812986, -1.711548, -3.140833, 0.1294118, 1, 0, 1,
-0.4766593, 0.1636592, -2.746346, 0.1215686, 1, 0, 1,
-0.4671184, -0.1567453, -0.7413529, 0.1176471, 1, 0, 1,
-0.4656681, -0.2626398, -2.510688, 0.1098039, 1, 0, 1,
-0.4651785, -0.905342, -1.156391, 0.1058824, 1, 0, 1,
-0.4580691, -0.02449715, -0.745162, 0.09803922, 1, 0, 1,
-0.4565632, -2.146097, -2.131308, 0.09019608, 1, 0, 1,
-0.4548422, 0.7804089, -1.273437, 0.08627451, 1, 0, 1,
-0.4544106, 1.203024, 0.1776367, 0.07843138, 1, 0, 1,
-0.4497451, 0.8821657, -0.6831237, 0.07450981, 1, 0, 1,
-0.449668, 0.1337121, -0.2204626, 0.06666667, 1, 0, 1,
-0.4477059, 0.4436206, -0.3498957, 0.0627451, 1, 0, 1,
-0.4456256, 1.375886, -1.616356, 0.05490196, 1, 0, 1,
-0.441686, -1.325962, -1.74112, 0.05098039, 1, 0, 1,
-0.4409145, 2.338261, 1.353023, 0.04313726, 1, 0, 1,
-0.4407776, -0.5143081, -2.905903, 0.03921569, 1, 0, 1,
-0.4330008, -0.8383246, -3.443175, 0.03137255, 1, 0, 1,
-0.4261751, 1.050577, -0.8633637, 0.02745098, 1, 0, 1,
-0.4187663, 1.788429, -0.01313096, 0.01960784, 1, 0, 1,
-0.4108787, 1.31979, -2.027138, 0.01568628, 1, 0, 1,
-0.4097037, 0.901495, -0.2853339, 0.007843138, 1, 0, 1,
-0.4060158, -2.004784, -2.448915, 0.003921569, 1, 0, 1,
-0.4041438, 0.9850885, -0.03683802, 0, 1, 0.003921569, 1,
-0.4025503, -0.7780659, -1.009302, 0, 1, 0.01176471, 1,
-0.394031, 1.755331, -1.077292, 0, 1, 0.01568628, 1,
-0.3886805, -0.6535043, -2.579398, 0, 1, 0.02352941, 1,
-0.3847484, -1.59114, -3.299967, 0, 1, 0.02745098, 1,
-0.3844987, 0.9898826, 2.945428, 0, 1, 0.03529412, 1,
-0.377223, -0.1421048, -2.251768, 0, 1, 0.03921569, 1,
-0.3721077, -1.126395, -3.700945, 0, 1, 0.04705882, 1,
-0.3657255, -1.606357, -3.095325, 0, 1, 0.05098039, 1,
-0.3620981, 0.9621481, -2.314561, 0, 1, 0.05882353, 1,
-0.3602771, -1.548288, -2.556123, 0, 1, 0.0627451, 1,
-0.3580681, 0.574382, 0.1698463, 0, 1, 0.07058824, 1,
-0.3566884, -1.493782, -1.973027, 0, 1, 0.07450981, 1,
-0.3486128, -0.5985781, -2.284085, 0, 1, 0.08235294, 1,
-0.3457201, -0.5983654, -3.068745, 0, 1, 0.08627451, 1,
-0.3431991, -0.02062764, -1.812457, 0, 1, 0.09411765, 1,
-0.3427229, -0.1920824, -0.9302038, 0, 1, 0.1019608, 1,
-0.3400911, -0.7938759, -4.567994, 0, 1, 0.1058824, 1,
-0.3345516, 0.9941576, 1.420667, 0, 1, 0.1137255, 1,
-0.3345234, 0.9866751, 0.8725308, 0, 1, 0.1176471, 1,
-0.3341606, 0.6979843, 1.474764, 0, 1, 0.1254902, 1,
-0.3334139, 1.386532, 1.525497, 0, 1, 0.1294118, 1,
-0.3333925, 0.7323354, -1.97296, 0, 1, 0.1372549, 1,
-0.3326639, 0.2185065, -0.4394338, 0, 1, 0.1411765, 1,
-0.3317898, 0.9016545, -1.12326, 0, 1, 0.1490196, 1,
-0.3304601, 0.1855552, -1.436418, 0, 1, 0.1529412, 1,
-0.3275432, 0.3248181, -1.345921, 0, 1, 0.1607843, 1,
-0.3232527, -2.2571, -3.933123, 0, 1, 0.1647059, 1,
-0.3228951, 0.9965754, 0.3453093, 0, 1, 0.172549, 1,
-0.3221425, -0.0659488, -1.663516, 0, 1, 0.1764706, 1,
-0.320232, -1.404317, -3.641, 0, 1, 0.1843137, 1,
-0.3192942, 1.578446, -0.8669906, 0, 1, 0.1882353, 1,
-0.2901706, 0.8288964, 0.6032503, 0, 1, 0.1960784, 1,
-0.2866412, 1.026613, 2.702286, 0, 1, 0.2039216, 1,
-0.286223, -0.7054269, -1.180328, 0, 1, 0.2078431, 1,
-0.2843097, 1.473594, 0.9096176, 0, 1, 0.2156863, 1,
-0.2667303, 0.4725235, -1.586842, 0, 1, 0.2196078, 1,
-0.2650872, 1.026079, -0.2222859, 0, 1, 0.227451, 1,
-0.2578883, -0.5077506, -2.096591, 0, 1, 0.2313726, 1,
-0.2504799, -0.2613336, -0.8524508, 0, 1, 0.2392157, 1,
-0.2483169, 0.6047623, -0.2154563, 0, 1, 0.2431373, 1,
-0.2371596, 0.8477849, -1.158633, 0, 1, 0.2509804, 1,
-0.2362248, -0.1061593, -1.009731, 0, 1, 0.254902, 1,
-0.2356358, -0.1461431, -1.763084, 0, 1, 0.2627451, 1,
-0.225648, -0.2873874, -1.725494, 0, 1, 0.2666667, 1,
-0.2255719, -1.562541, -2.186337, 0, 1, 0.2745098, 1,
-0.2233093, 0.04058185, -2.615309, 0, 1, 0.2784314, 1,
-0.2231441, -0.1259173, -3.393953, 0, 1, 0.2862745, 1,
-0.222973, -0.004264666, -1.081204, 0, 1, 0.2901961, 1,
-0.2165548, 1.089971, -0.3803672, 0, 1, 0.2980392, 1,
-0.2152172, 0.4053375, -0.333819, 0, 1, 0.3058824, 1,
-0.2149356, 0.1218918, -1.164611, 0, 1, 0.3098039, 1,
-0.2129015, -0.4487938, -2.858509, 0, 1, 0.3176471, 1,
-0.2034967, -0.04723042, -3.409389, 0, 1, 0.3215686, 1,
-0.2009526, -0.6391092, -1.490866, 0, 1, 0.3294118, 1,
-0.1941339, -0.0502331, 0.8322742, 0, 1, 0.3333333, 1,
-0.1919989, -0.5034354, -2.950478, 0, 1, 0.3411765, 1,
-0.1820483, 0.5996159, 0.2366842, 0, 1, 0.345098, 1,
-0.1744844, 0.1728552, 1.018657, 0, 1, 0.3529412, 1,
-0.1735285, 0.784049, 0.6737072, 0, 1, 0.3568628, 1,
-0.1695053, 0.2963144, -0.3684243, 0, 1, 0.3647059, 1,
-0.1631706, -1.420543, -3.057813, 0, 1, 0.3686275, 1,
-0.1605948, -0.3399276, -1.741894, 0, 1, 0.3764706, 1,
-0.1554699, -0.3747683, -1.463428, 0, 1, 0.3803922, 1,
-0.1551884, 0.5720776, -0.01218554, 0, 1, 0.3882353, 1,
-0.1537898, -0.3502957, -2.485111, 0, 1, 0.3921569, 1,
-0.1534921, 0.871272, -0.8160505, 0, 1, 0.4, 1,
-0.1528621, -1.665365, -1.645427, 0, 1, 0.4078431, 1,
-0.14957, -0.06086883, -1.000708, 0, 1, 0.4117647, 1,
-0.1457882, 1.314522, -0.3305498, 0, 1, 0.4196078, 1,
-0.1421722, -0.09834283, -4.333204, 0, 1, 0.4235294, 1,
-0.1407311, -1.409024, -3.070771, 0, 1, 0.4313726, 1,
-0.1361315, -2.645859, -4.432819, 0, 1, 0.4352941, 1,
-0.1338962, 0.1428593, -2.413752, 0, 1, 0.4431373, 1,
-0.1336499, 1.581939, -1.043258, 0, 1, 0.4470588, 1,
-0.1336418, 1.776503, -0.9749693, 0, 1, 0.454902, 1,
-0.1328579, 0.4173715, -0.9182326, 0, 1, 0.4588235, 1,
-0.1317218, 0.2858303, -0.3925816, 0, 1, 0.4666667, 1,
-0.1312808, 1.797282, -0.3294524, 0, 1, 0.4705882, 1,
-0.1286435, 0.1641153, -1.282255, 0, 1, 0.4784314, 1,
-0.1272266, -0.06972177, -2.143201, 0, 1, 0.4823529, 1,
-0.1262812, -0.4321724, -4.399268, 0, 1, 0.4901961, 1,
-0.1260903, -0.6461435, -3.923453, 0, 1, 0.4941176, 1,
-0.1239708, 1.281162, -0.5236294, 0, 1, 0.5019608, 1,
-0.1215859, -0.6141329, -3.679997, 0, 1, 0.509804, 1,
-0.1206216, -0.2926297, -2.099369, 0, 1, 0.5137255, 1,
-0.1190074, 0.03256428, -1.194515, 0, 1, 0.5215687, 1,
-0.1186474, -1.198321, -3.710017, 0, 1, 0.5254902, 1,
-0.1182228, -0.05011786, -1.95156, 0, 1, 0.5333334, 1,
-0.1178976, -0.1382316, -2.069609, 0, 1, 0.5372549, 1,
-0.1167826, 1.245297, -0.03861353, 0, 1, 0.5450981, 1,
-0.1124827, 0.9728865, 0.682757, 0, 1, 0.5490196, 1,
-0.1105466, 0.5687642, -0.0482696, 0, 1, 0.5568628, 1,
-0.110243, 0.586781, -0.2163172, 0, 1, 0.5607843, 1,
-0.1093454, -0.5963616, -1.460219, 0, 1, 0.5686275, 1,
-0.1090932, -0.3471789, -2.477899, 0, 1, 0.572549, 1,
-0.1074055, -1.391961, -3.984149, 0, 1, 0.5803922, 1,
-0.1055264, 0.1443234, -1.427128, 0, 1, 0.5843138, 1,
-0.1037018, -1.884885, -2.646764, 0, 1, 0.5921569, 1,
-0.1010558, 1.531033, 0.1378197, 0, 1, 0.5960785, 1,
-0.0991734, -0.03800399, -3.293859, 0, 1, 0.6039216, 1,
-0.0947792, -1.033764, -3.898151, 0, 1, 0.6117647, 1,
-0.09351223, -1.71465, -2.169297, 0, 1, 0.6156863, 1,
-0.09197541, 1.24476, 0.5970712, 0, 1, 0.6235294, 1,
-0.08875195, -0.6269676, -3.840878, 0, 1, 0.627451, 1,
-0.08676039, -0.6510409, -3.409338, 0, 1, 0.6352941, 1,
-0.08128832, 0.2989922, -0.343495, 0, 1, 0.6392157, 1,
-0.08026822, -0.450384, -3.595741, 0, 1, 0.6470588, 1,
-0.08009588, -0.458771, -3.959693, 0, 1, 0.6509804, 1,
-0.0769399, -0.4433952, -2.331145, 0, 1, 0.6588235, 1,
-0.07660092, 0.6760291, -0.6713659, 0, 1, 0.6627451, 1,
-0.07164591, 1.154818, -1.57066, 0, 1, 0.6705883, 1,
-0.07159469, -0.1674357, -2.758111, 0, 1, 0.6745098, 1,
-0.07128529, 0.9821069, -0.4920813, 0, 1, 0.682353, 1,
-0.06928131, 0.4348253, -0.7925734, 0, 1, 0.6862745, 1,
-0.06674476, 0.3470129, -0.4564492, 0, 1, 0.6941177, 1,
-0.06293627, 0.4252807, -0.9826006, 0, 1, 0.7019608, 1,
-0.06200852, -0.5116885, -2.810115, 0, 1, 0.7058824, 1,
-0.06025488, -0.8974682, -0.4544225, 0, 1, 0.7137255, 1,
-0.05864542, 0.7928674, -0.9969587, 0, 1, 0.7176471, 1,
-0.05796219, -1.89717, -5.003656, 0, 1, 0.7254902, 1,
-0.05580865, 1.081449, 0.1667409, 0, 1, 0.7294118, 1,
-0.05369824, -0.8311481, -1.720108, 0, 1, 0.7372549, 1,
-0.05041126, -0.6746913, -2.409142, 0, 1, 0.7411765, 1,
-0.050076, -0.6169753, -3.409611, 0, 1, 0.7490196, 1,
-0.04723242, -0.5205445, -3.016641, 0, 1, 0.7529412, 1,
-0.0457197, -1.666332, -5.354092, 0, 1, 0.7607843, 1,
-0.04501994, -0.2382107, -2.453913, 0, 1, 0.7647059, 1,
-0.0431093, 0.6531842, -1.367068, 0, 1, 0.772549, 1,
-0.03998503, 1.290316, -0.7584521, 0, 1, 0.7764706, 1,
-0.03916528, 0.2249048, 0.100931, 0, 1, 0.7843137, 1,
-0.03697301, 2.098685, 1.17285, 0, 1, 0.7882353, 1,
-0.03670149, -1.423295, -4.622484, 0, 1, 0.7960784, 1,
-0.03381856, 0.00824178, -2.42121, 0, 1, 0.8039216, 1,
-0.03308275, -1.973537, -1.982406, 0, 1, 0.8078431, 1,
-0.03214693, -0.3519523, -3.228341, 0, 1, 0.8156863, 1,
-0.03163801, 1.485522, -0.2477617, 0, 1, 0.8196079, 1,
-0.02899927, 0.06970423, -0.1957408, 0, 1, 0.827451, 1,
-0.02755153, -1.558364, -1.853637, 0, 1, 0.8313726, 1,
-0.02746277, 0.7228435, 0.2287424, 0, 1, 0.8392157, 1,
-0.02722853, -0.5500419, -3.067556, 0, 1, 0.8431373, 1,
-0.02607933, -0.9686154, -4.78583, 0, 1, 0.8509804, 1,
-0.02556707, -1.509114, -2.258558, 0, 1, 0.854902, 1,
-0.01611113, -0.738826, -2.705602, 0, 1, 0.8627451, 1,
-0.01516335, 0.002637607, -0.8214606, 0, 1, 0.8666667, 1,
-0.0126138, -1.456887, -2.846042, 0, 1, 0.8745098, 1,
-0.009208443, 0.01567078, -0.5678965, 0, 1, 0.8784314, 1,
-0.003134166, -1.154813, -2.686007, 0, 1, 0.8862745, 1,
0.003307014, 0.6617323, -0.3043835, 0, 1, 0.8901961, 1,
0.004051987, 0.603902, 0.03172894, 0, 1, 0.8980392, 1,
0.009013856, -1.166555, 2.580758, 0, 1, 0.9058824, 1,
0.01041629, -1.382285, 3.029675, 0, 1, 0.9098039, 1,
0.01327843, -0.6858635, 2.786777, 0, 1, 0.9176471, 1,
0.01634166, 0.4832345, 2.16524, 0, 1, 0.9215686, 1,
0.01828219, 1.515654, -0.04601156, 0, 1, 0.9294118, 1,
0.01958995, -1.71708, 3.331114, 0, 1, 0.9333333, 1,
0.02407084, 0.9154003, 0.3595935, 0, 1, 0.9411765, 1,
0.02925061, 1.187691, 0.6799225, 0, 1, 0.945098, 1,
0.03086491, -0.7886789, 2.377294, 0, 1, 0.9529412, 1,
0.03115589, -1.076784, 2.569307, 0, 1, 0.9568627, 1,
0.03501263, 0.5020143, 0.4020878, 0, 1, 0.9647059, 1,
0.03590801, -1.337321, 3.473204, 0, 1, 0.9686275, 1,
0.03956703, -1.143898, 3.344813, 0, 1, 0.9764706, 1,
0.04645644, 1.097091, -0.292788, 0, 1, 0.9803922, 1,
0.0467876, -0.5066057, 1.925738, 0, 1, 0.9882353, 1,
0.04899925, 0.07488225, 0.8178717, 0, 1, 0.9921569, 1,
0.04966617, -0.8171659, 2.760594, 0, 1, 1, 1,
0.0499659, -1.17386, 3.424934, 0, 0.9921569, 1, 1,
0.05016473, 0.08062395, -1.543249, 0, 0.9882353, 1, 1,
0.05343334, -1.438105, 2.200564, 0, 0.9803922, 1, 1,
0.05639811, 0.5181154, -0.8262506, 0, 0.9764706, 1, 1,
0.05829555, -0.6596904, 2.292981, 0, 0.9686275, 1, 1,
0.05842036, 0.8210237, -1.992053, 0, 0.9647059, 1, 1,
0.06060673, -0.5220965, 4.00829, 0, 0.9568627, 1, 1,
0.06062017, -1.202227, 2.621223, 0, 0.9529412, 1, 1,
0.06432961, -0.9610056, 3.173516, 0, 0.945098, 1, 1,
0.06509852, -1.87893, 3.232914, 0, 0.9411765, 1, 1,
0.06861916, 0.4400438, 0.2614817, 0, 0.9333333, 1, 1,
0.07765023, 0.3057335, 0.6274694, 0, 0.9294118, 1, 1,
0.07780125, 1.182215, 1.164284, 0, 0.9215686, 1, 1,
0.08078052, 0.4105985, 0.6110915, 0, 0.9176471, 1, 1,
0.08118858, -1.520565, 4.8568, 0, 0.9098039, 1, 1,
0.08252358, 0.8577855, -0.1203043, 0, 0.9058824, 1, 1,
0.08486166, -0.6989228, 1.920834, 0, 0.8980392, 1, 1,
0.08749007, 0.0427839, 1.333374, 0, 0.8901961, 1, 1,
0.08768222, -0.3002982, 2.980317, 0, 0.8862745, 1, 1,
0.09223101, 0.1244858, -0.3362057, 0, 0.8784314, 1, 1,
0.1001817, 0.9472957, -0.510839, 0, 0.8745098, 1, 1,
0.1046805, 1.834518, 1.565068, 0, 0.8666667, 1, 1,
0.105877, 0.1624516, 0.163356, 0, 0.8627451, 1, 1,
0.1065215, -0.4309543, 1.981125, 0, 0.854902, 1, 1,
0.1083464, 0.2055583, -0.5328995, 0, 0.8509804, 1, 1,
0.109293, -0.8222669, 1.735648, 0, 0.8431373, 1, 1,
0.1123088, 1.261505, -0.1162499, 0, 0.8392157, 1, 1,
0.1136017, -1.760031, 4.016796, 0, 0.8313726, 1, 1,
0.1142042, -0.3935469, 1.412567, 0, 0.827451, 1, 1,
0.1142604, -0.3143292, 2.783697, 0, 0.8196079, 1, 1,
0.1164406, -0.5878527, 2.409012, 0, 0.8156863, 1, 1,
0.1167509, 1.924644, -0.8068136, 0, 0.8078431, 1, 1,
0.1191975, 0.3211334, -0.1547534, 0, 0.8039216, 1, 1,
0.1210679, -0.05266142, 1.47112, 0, 0.7960784, 1, 1,
0.1265764, -1.47878, 4.521655, 0, 0.7882353, 1, 1,
0.1334644, 0.1397971, 1.497835, 0, 0.7843137, 1, 1,
0.1343721, 0.07301517, 1.791628, 0, 0.7764706, 1, 1,
0.1360007, -0.7726597, 3.073923, 0, 0.772549, 1, 1,
0.1362381, -0.4642716, 2.909023, 0, 0.7647059, 1, 1,
0.138745, 1.923089, 0.7025834, 0, 0.7607843, 1, 1,
0.1393778, -0.08169433, 2.03839, 0, 0.7529412, 1, 1,
0.1401592, -0.7084606, 1.857701, 0, 0.7490196, 1, 1,
0.1449617, -1.070527, 1.811381, 0, 0.7411765, 1, 1,
0.1464737, 0.7798088, -0.3973647, 0, 0.7372549, 1, 1,
0.148577, 0.6545665, 0.7047886, 0, 0.7294118, 1, 1,
0.1553584, 0.6121958, -0.4132949, 0, 0.7254902, 1, 1,
0.1612276, 1.453909, 0.2907255, 0, 0.7176471, 1, 1,
0.161731, 0.88213, -0.4789788, 0, 0.7137255, 1, 1,
0.1617878, -0.191845, 3.754007, 0, 0.7058824, 1, 1,
0.1623944, -2.430103, 3.245708, 0, 0.6980392, 1, 1,
0.1625898, 1.70158, 0.3505297, 0, 0.6941177, 1, 1,
0.1626265, 0.2701529, 1.336634, 0, 0.6862745, 1, 1,
0.163914, 2.306035, 0.07292587, 0, 0.682353, 1, 1,
0.164733, -0.007028932, 2.388305, 0, 0.6745098, 1, 1,
0.1655047, -1.078351, 2.344902, 0, 0.6705883, 1, 1,
0.1660214, 0.3698052, -0.9654167, 0, 0.6627451, 1, 1,
0.1698135, -1.82729, 2.694354, 0, 0.6588235, 1, 1,
0.1717782, 1.93879, 0.6660618, 0, 0.6509804, 1, 1,
0.1719082, -1.154902, 4.040601, 0, 0.6470588, 1, 1,
0.1720143, -0.6150839, 3.083332, 0, 0.6392157, 1, 1,
0.1733907, 0.9433421, 0.4112665, 0, 0.6352941, 1, 1,
0.1756174, 0.1336625, -0.01693799, 0, 0.627451, 1, 1,
0.1816882, -0.4501953, 3.759226, 0, 0.6235294, 1, 1,
0.1820226, -0.3347742, 2.540942, 0, 0.6156863, 1, 1,
0.1834081, -0.2045699, 3.35491, 0, 0.6117647, 1, 1,
0.1866158, -0.6912676, 1.809304, 0, 0.6039216, 1, 1,
0.1879838, 0.2940321, -0.5221945, 0, 0.5960785, 1, 1,
0.1882637, 1.112033, -0.1344611, 0, 0.5921569, 1, 1,
0.1908191, -1.000471, 3.948941, 0, 0.5843138, 1, 1,
0.1912788, 0.2580443, -0.585675, 0, 0.5803922, 1, 1,
0.1914509, -1.639701, 3.767883, 0, 0.572549, 1, 1,
0.1921117, 1.5633, 1.577266, 0, 0.5686275, 1, 1,
0.1926682, 0.5717865, 0.7782769, 0, 0.5607843, 1, 1,
0.193312, 1.689387, -0.8436102, 0, 0.5568628, 1, 1,
0.1948629, 1.708857, -0.1181173, 0, 0.5490196, 1, 1,
0.1973111, 0.6927418, -0.3250777, 0, 0.5450981, 1, 1,
0.2000804, 0.1705352, 0.7930731, 0, 0.5372549, 1, 1,
0.2032758, -1.142116, 1.172024, 0, 0.5333334, 1, 1,
0.2051234, 0.9373187, -0.4792681, 0, 0.5254902, 1, 1,
0.210367, 1.588737, -0.7200828, 0, 0.5215687, 1, 1,
0.2125974, -1.00152, 1.319761, 0, 0.5137255, 1, 1,
0.2136337, 0.8813513, -1.484416, 0, 0.509804, 1, 1,
0.2141983, -0.5271574, 1.6586, 0, 0.5019608, 1, 1,
0.215568, -0.4124624, 2.058795, 0, 0.4941176, 1, 1,
0.2196486, 0.1626297, 1.189479, 0, 0.4901961, 1, 1,
0.2258399, 0.9588464, 0.2128092, 0, 0.4823529, 1, 1,
0.230227, -0.8622546, 1.380926, 0, 0.4784314, 1, 1,
0.2311439, -1.661789, 2.727827, 0, 0.4705882, 1, 1,
0.2394482, -0.6378645, 2.208634, 0, 0.4666667, 1, 1,
0.241648, -1.230649, 3.24839, 0, 0.4588235, 1, 1,
0.2447802, 0.2121382, 0.7425698, 0, 0.454902, 1, 1,
0.2480081, 1.123236, 2.213296, 0, 0.4470588, 1, 1,
0.250508, -1.575847, 3.230807, 0, 0.4431373, 1, 1,
0.2505748, 0.5027351, 1.673926, 0, 0.4352941, 1, 1,
0.2510197, 0.005883284, 0.04282776, 0, 0.4313726, 1, 1,
0.2520914, 0.05192696, -0.1072839, 0, 0.4235294, 1, 1,
0.2529217, 0.2368617, 0.6175288, 0, 0.4196078, 1, 1,
0.2542151, 1.464049, -0.5554272, 0, 0.4117647, 1, 1,
0.2561795, 0.2132887, 1.096399, 0, 0.4078431, 1, 1,
0.2623441, 0.121751, 1.816983, 0, 0.4, 1, 1,
0.2702326, -0.4894981, 4.093345, 0, 0.3921569, 1, 1,
0.2734284, 1.312972, 1.952928, 0, 0.3882353, 1, 1,
0.2770077, 1.125975, -1.35107, 0, 0.3803922, 1, 1,
0.2784538, -0.3526825, 2.376088, 0, 0.3764706, 1, 1,
0.2797845, -0.6381239, 1.213727, 0, 0.3686275, 1, 1,
0.2805562, -0.689231, 3.287241, 0, 0.3647059, 1, 1,
0.2811396, -0.9330683, 3.541208, 0, 0.3568628, 1, 1,
0.2815181, -0.4340812, 3.610847, 0, 0.3529412, 1, 1,
0.2841699, -0.5355213, 4.323247, 0, 0.345098, 1, 1,
0.2869009, 2.258853, -0.231499, 0, 0.3411765, 1, 1,
0.2910172, 2.164779, 0.7436859, 0, 0.3333333, 1, 1,
0.2911681, -0.1828972, 3.045676, 0, 0.3294118, 1, 1,
0.2948084, -0.8836275, 3.816159, 0, 0.3215686, 1, 1,
0.2958816, 2.365052, 0.5670838, 0, 0.3176471, 1, 1,
0.2973742, 0.7031013, -0.6295669, 0, 0.3098039, 1, 1,
0.3000776, 0.6388807, 0.7909514, 0, 0.3058824, 1, 1,
0.3018531, 0.3668121, -0.8064892, 0, 0.2980392, 1, 1,
0.3023728, -0.5199134, 3.131377, 0, 0.2901961, 1, 1,
0.3053232, -0.3734059, 2.821285, 0, 0.2862745, 1, 1,
0.3064844, -0.01771493, 3.328005, 0, 0.2784314, 1, 1,
0.3073711, -0.4514508, 3.330324, 0, 0.2745098, 1, 1,
0.3099112, 1.208235, 0.1375276, 0, 0.2666667, 1, 1,
0.3115875, -0.7237524, 1.440168, 0, 0.2627451, 1, 1,
0.3158276, 0.7773131, 1.426614, 0, 0.254902, 1, 1,
0.3161527, 0.2397616, 1.126819, 0, 0.2509804, 1, 1,
0.3181697, -2.332202, 1.104823, 0, 0.2431373, 1, 1,
0.3199972, 0.05371945, 1.404212, 0, 0.2392157, 1, 1,
0.3203665, -1.135279, 1.646318, 0, 0.2313726, 1, 1,
0.3313915, 1.289572, -0.004276858, 0, 0.227451, 1, 1,
0.3323326, 0.1508136, 0.8768463, 0, 0.2196078, 1, 1,
0.3325611, -0.9692333, 2.397623, 0, 0.2156863, 1, 1,
0.3331034, 0.7238274, 1.416179, 0, 0.2078431, 1, 1,
0.3347865, -1.592974, 4.056417, 0, 0.2039216, 1, 1,
0.3390063, -0.6973034, 4.142822, 0, 0.1960784, 1, 1,
0.3489929, 1.18172, 0.1714643, 0, 0.1882353, 1, 1,
0.3490674, -1.229402, 2.344501, 0, 0.1843137, 1, 1,
0.3493794, -0.6458195, 1.359775, 0, 0.1764706, 1, 1,
0.3505504, -0.895676, 3.150723, 0, 0.172549, 1, 1,
0.3506003, 1.191128, 0.6722788, 0, 0.1647059, 1, 1,
0.3507198, 0.7077578, -1.406102, 0, 0.1607843, 1, 1,
0.3524005, 0.1880253, 1.486492, 0, 0.1529412, 1, 1,
0.3527949, -1.252268, 4.668142, 0, 0.1490196, 1, 1,
0.3547049, -1.53012, 2.913772, 0, 0.1411765, 1, 1,
0.3549875, -1.140308, 1.922982, 0, 0.1372549, 1, 1,
0.3555899, -1.661576, 4.213574, 0, 0.1294118, 1, 1,
0.3558437, 0.1844184, 1.726915, 0, 0.1254902, 1, 1,
0.3569074, -0.07735576, 0.4218121, 0, 0.1176471, 1, 1,
0.3571482, 1.146801, 0.5320676, 0, 0.1137255, 1, 1,
0.3653992, -0.964578, 1.315361, 0, 0.1058824, 1, 1,
0.3674545, 1.136771, 0.6480721, 0, 0.09803922, 1, 1,
0.3716785, -0.2422137, 0.8205244, 0, 0.09411765, 1, 1,
0.3720428, 0.3045732, 1.84646, 0, 0.08627451, 1, 1,
0.3724445, -0.01774496, 2.973749, 0, 0.08235294, 1, 1,
0.3739971, 1.071412, 0.7130302, 0, 0.07450981, 1, 1,
0.3772799, -0.476648, 1.809499, 0, 0.07058824, 1, 1,
0.3785172, 0.6138629, 0.7765111, 0, 0.0627451, 1, 1,
0.3786838, 1.701606, 2.847041, 0, 0.05882353, 1, 1,
0.3847745, 0.4417705, 1.846154, 0, 0.05098039, 1, 1,
0.387478, -0.8489681, 2.748101, 0, 0.04705882, 1, 1,
0.3897112, -0.05064713, 2.258642, 0, 0.03921569, 1, 1,
0.3900478, 1.954286, 0.6406205, 0, 0.03529412, 1, 1,
0.3903394, 0.5794684, 0.697446, 0, 0.02745098, 1, 1,
0.3910156, -0.6388735, 3.029974, 0, 0.02352941, 1, 1,
0.3945605, -0.1380702, 2.389434, 0, 0.01568628, 1, 1,
0.398028, 1.113779, -0.3067756, 0, 0.01176471, 1, 1,
0.3989733, 0.7992493, 0.3584248, 0, 0.003921569, 1, 1,
0.39993, 0.3644748, 0.5332749, 0.003921569, 0, 1, 1,
0.4026339, 1.60565, 0.8210954, 0.007843138, 0, 1, 1,
0.4042211, 0.4494539, -0.7348264, 0.01568628, 0, 1, 1,
0.4048516, -1.135393, 2.394429, 0.01960784, 0, 1, 1,
0.4062483, 0.7705646, -0.6794894, 0.02745098, 0, 1, 1,
0.4065781, 0.5682344, 2.077625, 0.03137255, 0, 1, 1,
0.4066092, -1.966465, 2.599296, 0.03921569, 0, 1, 1,
0.4192049, 0.474036, -1.38092, 0.04313726, 0, 1, 1,
0.4198777, 1.578749, 0.1001247, 0.05098039, 0, 1, 1,
0.4214522, 0.252502, 1.232878, 0.05490196, 0, 1, 1,
0.4231767, -1.109959, 2.763438, 0.0627451, 0, 1, 1,
0.427242, 0.9794942, 0.01394195, 0.06666667, 0, 1, 1,
0.4315533, 0.3346268, 0.4755166, 0.07450981, 0, 1, 1,
0.4329043, -1.050665, 2.841084, 0.07843138, 0, 1, 1,
0.4339667, -0.3345863, 2.089806, 0.08627451, 0, 1, 1,
0.4387598, -2.180546, 2.670494, 0.09019608, 0, 1, 1,
0.4397514, -1.130105, 2.641416, 0.09803922, 0, 1, 1,
0.440713, 0.6991369, -0.52991, 0.1058824, 0, 1, 1,
0.4464718, -1.815177, 3.464225, 0.1098039, 0, 1, 1,
0.4486926, -0.1602671, 1.088647, 0.1176471, 0, 1, 1,
0.4550816, -0.573433, 1.376519, 0.1215686, 0, 1, 1,
0.4614741, 1.129441, -1.435871, 0.1294118, 0, 1, 1,
0.4640823, 1.136356, 0.08051471, 0.1333333, 0, 1, 1,
0.46819, 1.335561, 0.7018012, 0.1411765, 0, 1, 1,
0.4690871, 0.2817088, 0.482202, 0.145098, 0, 1, 1,
0.4743424, -0.3751451, 2.137435, 0.1529412, 0, 1, 1,
0.4821795, -0.3898019, 1.39875, 0.1568628, 0, 1, 1,
0.4835534, -0.8889652, 2.521663, 0.1647059, 0, 1, 1,
0.4919425, -0.9736695, 4.09482, 0.1686275, 0, 1, 1,
0.4958332, 2.158627, 0.1676116, 0.1764706, 0, 1, 1,
0.4961834, 0.6088246, 0.08842532, 0.1803922, 0, 1, 1,
0.4969447, -0.6585532, 4.49067, 0.1882353, 0, 1, 1,
0.4972534, 1.162085, 1.363956, 0.1921569, 0, 1, 1,
0.5067784, -0.9774881, 1.379641, 0.2, 0, 1, 1,
0.5133125, -0.6913046, 2.478176, 0.2078431, 0, 1, 1,
0.5146227, 0.06980661, 0.3361284, 0.2117647, 0, 1, 1,
0.5150473, 1.045521, 1.064485, 0.2196078, 0, 1, 1,
0.516488, 0.1084742, 0.2278228, 0.2235294, 0, 1, 1,
0.5203947, 0.1456521, 2.430385, 0.2313726, 0, 1, 1,
0.5225964, 0.6375335, 0.1021601, 0.2352941, 0, 1, 1,
0.5238057, 0.6745378, 0.1374492, 0.2431373, 0, 1, 1,
0.5293794, 0.1406879, 1.318182, 0.2470588, 0, 1, 1,
0.5296994, 0.5318013, 0.05150046, 0.254902, 0, 1, 1,
0.5319822, 0.3662881, 2.648483, 0.2588235, 0, 1, 1,
0.5331988, -1.506841, 2.459379, 0.2666667, 0, 1, 1,
0.53964, 0.4460491, 0.9135448, 0.2705882, 0, 1, 1,
0.5473908, 1.07383, 1.248865, 0.2784314, 0, 1, 1,
0.5475031, -0.7136829, 3.116021, 0.282353, 0, 1, 1,
0.5485137, 2.723203, 0.7852837, 0.2901961, 0, 1, 1,
0.5491664, -1.740927, 3.312782, 0.2941177, 0, 1, 1,
0.5628511, 0.2243784, 0.8723781, 0.3019608, 0, 1, 1,
0.5653969, 0.3845666, 0.4643685, 0.3098039, 0, 1, 1,
0.5670837, 0.5510331, -0.4745725, 0.3137255, 0, 1, 1,
0.5739728, -0.1781802, 2.335073, 0.3215686, 0, 1, 1,
0.5760226, -0.653953, 2.132718, 0.3254902, 0, 1, 1,
0.5765622, -0.04582132, 0.4468067, 0.3333333, 0, 1, 1,
0.5808154, 0.1586211, 0.7507342, 0.3372549, 0, 1, 1,
0.5847046, 0.8513286, 2.016161, 0.345098, 0, 1, 1,
0.5916632, -0.8141075, 4.969515, 0.3490196, 0, 1, 1,
0.5934169, -0.3080084, 3.119444, 0.3568628, 0, 1, 1,
0.6065281, -2.984349, 3.739564, 0.3607843, 0, 1, 1,
0.6121135, 0.9029822, 0.3870655, 0.3686275, 0, 1, 1,
0.6137667, -0.1609405, 0.9864272, 0.372549, 0, 1, 1,
0.6152622, 0.7886208, 1.242555, 0.3803922, 0, 1, 1,
0.6163245, 0.3588508, 1.516199, 0.3843137, 0, 1, 1,
0.617022, 2.311461, 0.05713401, 0.3921569, 0, 1, 1,
0.6227559, 0.3463548, 1.48214, 0.3960784, 0, 1, 1,
0.6259539, -1.443147, 2.927576, 0.4039216, 0, 1, 1,
0.6284746, 1.404649, 0.01544159, 0.4117647, 0, 1, 1,
0.6310297, 0.4311143, 1.829588, 0.4156863, 0, 1, 1,
0.6371028, -0.4146938, 1.090415, 0.4235294, 0, 1, 1,
0.6378902, 1.4187, 0.5937503, 0.427451, 0, 1, 1,
0.6478993, 0.6787447, 1.373102, 0.4352941, 0, 1, 1,
0.6595756, 0.8413652, 1.412872, 0.4392157, 0, 1, 1,
0.6625272, -1.268673, 2.592795, 0.4470588, 0, 1, 1,
0.6657184, -0.8247088, 1.532413, 0.4509804, 0, 1, 1,
0.6664574, -1.74809, 2.940417, 0.4588235, 0, 1, 1,
0.6708304, 0.251764, 0.5935571, 0.4627451, 0, 1, 1,
0.6710204, -1.550326, 3.435441, 0.4705882, 0, 1, 1,
0.6725515, 1.578811, 1.425501, 0.4745098, 0, 1, 1,
0.680104, -1.15438, 1.240213, 0.4823529, 0, 1, 1,
0.6822334, 3.467552, -2.264417, 0.4862745, 0, 1, 1,
0.6900939, 0.8074883, 2.41652, 0.4941176, 0, 1, 1,
0.6924914, 1.813728, -0.1323909, 0.5019608, 0, 1, 1,
0.6959491, 2.053611, 1.464967, 0.5058824, 0, 1, 1,
0.6977009, -0.6746071, 3.104508, 0.5137255, 0, 1, 1,
0.6982132, 0.6255565, 1.451362, 0.5176471, 0, 1, 1,
0.7007576, 0.0808114, 0.6858056, 0.5254902, 0, 1, 1,
0.7021245, 1.422273, 0.4119151, 0.5294118, 0, 1, 1,
0.7049224, -0.6802928, 3.216465, 0.5372549, 0, 1, 1,
0.7090927, -1.036562, 2.789814, 0.5411765, 0, 1, 1,
0.7128816, -0.3861181, 2.87761, 0.5490196, 0, 1, 1,
0.7151454, 1.249876, 1.963573, 0.5529412, 0, 1, 1,
0.7200017, -2.367433, 1.445171, 0.5607843, 0, 1, 1,
0.7229413, -0.4730177, 2.60573, 0.5647059, 0, 1, 1,
0.7248639, -0.05596673, 0.1918693, 0.572549, 0, 1, 1,
0.7288014, -0.06022337, 2.470227, 0.5764706, 0, 1, 1,
0.736757, -1.454454, 4.14385, 0.5843138, 0, 1, 1,
0.7369059, 0.6228167, 1.53564, 0.5882353, 0, 1, 1,
0.7373632, 0.9214229, 1.517897, 0.5960785, 0, 1, 1,
0.739139, -0.2513447, 2.467047, 0.6039216, 0, 1, 1,
0.7407568, 1.045237, 1.015052, 0.6078432, 0, 1, 1,
0.7427104, -0.09941742, 1.980979, 0.6156863, 0, 1, 1,
0.7463958, -1.710438, 2.32978, 0.6196079, 0, 1, 1,
0.7514592, -0.7769752, 4.385002, 0.627451, 0, 1, 1,
0.7574336, -1.261208, 4.001027, 0.6313726, 0, 1, 1,
0.7620963, -2.894166, 1.90617, 0.6392157, 0, 1, 1,
0.7740118, 0.1994675, 0.6554429, 0.6431373, 0, 1, 1,
0.7775749, 0.04294199, 1.798863, 0.6509804, 0, 1, 1,
0.7796927, -0.846347, 1.901357, 0.654902, 0, 1, 1,
0.7820153, 0.8316652, -0.6636164, 0.6627451, 0, 1, 1,
0.7864919, 0.02053969, 3.354739, 0.6666667, 0, 1, 1,
0.7897084, 0.9391574, 1.724908, 0.6745098, 0, 1, 1,
0.7942156, 0.1709745, 0.07128925, 0.6784314, 0, 1, 1,
0.7962375, 1.119019, 0.8817915, 0.6862745, 0, 1, 1,
0.7972947, -0.4264121, 1.089056, 0.6901961, 0, 1, 1,
0.7980465, -0.9511023, 4.007, 0.6980392, 0, 1, 1,
0.8001643, -0.6144477, 5.73575, 0.7058824, 0, 1, 1,
0.8079472, -0.297438, 4.261035, 0.7098039, 0, 1, 1,
0.8146224, -0.4487584, 2.949388, 0.7176471, 0, 1, 1,
0.8169979, 0.3102383, 0.5977901, 0.7215686, 0, 1, 1,
0.8189226, 1.52434, 0.7654052, 0.7294118, 0, 1, 1,
0.8195511, 1.002617, 1.122769, 0.7333333, 0, 1, 1,
0.8274517, -0.3829014, 3.61974, 0.7411765, 0, 1, 1,
0.8278516, 0.3129606, 2.056074, 0.7450981, 0, 1, 1,
0.8348072, 1.295016, 0.2000856, 0.7529412, 0, 1, 1,
0.8352597, -2.158509, 3.311183, 0.7568628, 0, 1, 1,
0.8355321, -0.8588157, 2.332239, 0.7647059, 0, 1, 1,
0.8382124, -1.037078, 1.529213, 0.7686275, 0, 1, 1,
0.8394654, 0.2004334, 2.576438, 0.7764706, 0, 1, 1,
0.8440989, 0.7425041, 0.7453552, 0.7803922, 0, 1, 1,
0.8484374, -1.213917, 1.362826, 0.7882353, 0, 1, 1,
0.8487787, -1.285081, 2.59025, 0.7921569, 0, 1, 1,
0.8497166, -0.9867446, 3.337868, 0.8, 0, 1, 1,
0.8590472, -0.2975412, 4.129411, 0.8078431, 0, 1, 1,
0.8614559, 0.5235729, 1.414099, 0.8117647, 0, 1, 1,
0.8684836, 0.2360764, 0.3328733, 0.8196079, 0, 1, 1,
0.8705274, -0.3346182, 0.4771848, 0.8235294, 0, 1, 1,
0.8720603, 0.06272089, 1.663313, 0.8313726, 0, 1, 1,
0.8739644, -0.7605942, 1.973029, 0.8352941, 0, 1, 1,
0.8759692, -2.639908, 3.494554, 0.8431373, 0, 1, 1,
0.8765472, -1.247876, 2.518951, 0.8470588, 0, 1, 1,
0.879393, -0.6887292, 3.42504, 0.854902, 0, 1, 1,
0.881611, -1.73439, 2.365217, 0.8588235, 0, 1, 1,
0.883768, -0.1565209, 2.482525, 0.8666667, 0, 1, 1,
0.8874655, 0.5923056, 2.310903, 0.8705882, 0, 1, 1,
0.8878856, -0.5175408, 1.846209, 0.8784314, 0, 1, 1,
0.8892231, 0.614477, 0.829377, 0.8823529, 0, 1, 1,
0.889737, 1.42269, 0.2078161, 0.8901961, 0, 1, 1,
0.8947163, -0.9699711, 1.910064, 0.8941177, 0, 1, 1,
0.8959259, -0.7230991, 3.615471, 0.9019608, 0, 1, 1,
0.9056348, -0.6204116, 2.379169, 0.9098039, 0, 1, 1,
0.9085012, -1.463864, 2.094359, 0.9137255, 0, 1, 1,
0.9120265, 0.7256345, -0.8495748, 0.9215686, 0, 1, 1,
0.9164079, 1.002601, 0.3349634, 0.9254902, 0, 1, 1,
0.9168145, 0.0818973, 2.011329, 0.9333333, 0, 1, 1,
0.9207286, 0.7391772, -0.110568, 0.9372549, 0, 1, 1,
0.924467, -0.1871611, 2.35775, 0.945098, 0, 1, 1,
0.9267636, 0.2531752, 0.228752, 0.9490196, 0, 1, 1,
0.9278614, -0.7926255, 2.817849, 0.9568627, 0, 1, 1,
0.9354831, -0.6041368, 1.291739, 0.9607843, 0, 1, 1,
0.9404195, 0.2716602, -0.6146813, 0.9686275, 0, 1, 1,
0.9421825, -0.5051705, 2.766415, 0.972549, 0, 1, 1,
0.9442649, 0.50823, 0.6147644, 0.9803922, 0, 1, 1,
0.9476364, -0.7085552, 2.311745, 0.9843137, 0, 1, 1,
0.9485405, -1.067872, 1.787101, 0.9921569, 0, 1, 1,
0.9525067, -0.4677587, 0.8603821, 0.9960784, 0, 1, 1,
0.9560621, -0.7439997, 1.280455, 1, 0, 0.9960784, 1,
0.9590237, -0.2685234, 1.78189, 1, 0, 0.9882353, 1,
0.9637401, -1.811414, 1.795273, 1, 0, 0.9843137, 1,
0.9651114, 0.08274986, 0.6764218, 1, 0, 0.9764706, 1,
0.9790361, -0.1830131, 0.7447869, 1, 0, 0.972549, 1,
1.002188, -1.032708, 0.7522294, 1, 0, 0.9647059, 1,
1.004037, 0.4738132, -0.1689981, 1, 0, 0.9607843, 1,
1.007782, 0.1748227, 0.543547, 1, 0, 0.9529412, 1,
1.008437, 0.0870888, -0.6558735, 1, 0, 0.9490196, 1,
1.013115, -1.123913, 1.85477, 1, 0, 0.9411765, 1,
1.014347, 0.7969816, 3.605725, 1, 0, 0.9372549, 1,
1.030112, 0.06573939, -0.3673338, 1, 0, 0.9294118, 1,
1.031031, 0.5425926, 0.9266833, 1, 0, 0.9254902, 1,
1.035208, 1.224497, 2.052791, 1, 0, 0.9176471, 1,
1.04109, -1.692549, 1.703079, 1, 0, 0.9137255, 1,
1.042207, -0.2935634, 1.346892, 1, 0, 0.9058824, 1,
1.046052, -0.2288923, 3.351522, 1, 0, 0.9019608, 1,
1.050954, 0.4266693, 1.327698, 1, 0, 0.8941177, 1,
1.052677, 0.7127559, -0.06882381, 1, 0, 0.8862745, 1,
1.05426, -0.3998732, 1.586054, 1, 0, 0.8823529, 1,
1.059196, -0.7870702, 2.169612, 1, 0, 0.8745098, 1,
1.062142, -1.386363, 2.420126, 1, 0, 0.8705882, 1,
1.063029, -1.303119, 2.872211, 1, 0, 0.8627451, 1,
1.073815, 1.039124, 0.5106522, 1, 0, 0.8588235, 1,
1.077189, -0.5785469, 2.280629, 1, 0, 0.8509804, 1,
1.079035, -1.334988, 2.998353, 1, 0, 0.8470588, 1,
1.096308, -1.162474, 2.070093, 1, 0, 0.8392157, 1,
1.100285, -1.912918, 3.920872, 1, 0, 0.8352941, 1,
1.1007, -0.1272355, 1.103964, 1, 0, 0.827451, 1,
1.101856, 0.6075874, 1.597838, 1, 0, 0.8235294, 1,
1.125728, 1.008983, 1.242089, 1, 0, 0.8156863, 1,
1.127927, 0.5731447, -0.06701948, 1, 0, 0.8117647, 1,
1.132164, -0.1583796, 1.049105, 1, 0, 0.8039216, 1,
1.132518, 0.8382621, 2.030841, 1, 0, 0.7960784, 1,
1.133327, -1.38024, 1.973061, 1, 0, 0.7921569, 1,
1.138639, -0.305319, 0.5570618, 1, 0, 0.7843137, 1,
1.142393, 0.6478503, -1.153238, 1, 0, 0.7803922, 1,
1.157911, -0.4199489, 0.7586282, 1, 0, 0.772549, 1,
1.166822, 0.793003, 0.8111685, 1, 0, 0.7686275, 1,
1.18439, -0.0491623, 1.670449, 1, 0, 0.7607843, 1,
1.185743, 1.916881, 1.251757, 1, 0, 0.7568628, 1,
1.186488, -0.3539407, 2.836357, 1, 0, 0.7490196, 1,
1.199144, -1.100056, 3.494519, 1, 0, 0.7450981, 1,
1.204102, 1.106667, 0.8563853, 1, 0, 0.7372549, 1,
1.213391, 0.2476203, 2.053184, 1, 0, 0.7333333, 1,
1.217632, -0.7006277, 3.104854, 1, 0, 0.7254902, 1,
1.22001, -1.558668, 2.440369, 1, 0, 0.7215686, 1,
1.223612, -0.6407226, 1.607611, 1, 0, 0.7137255, 1,
1.225176, 0.8139937, 0.9803728, 1, 0, 0.7098039, 1,
1.226658, 1.496781, -1.622514, 1, 0, 0.7019608, 1,
1.236551, 1.657399, 0.7696902, 1, 0, 0.6941177, 1,
1.240729, 0.3823782, 1.848532, 1, 0, 0.6901961, 1,
1.242064, 0.07585651, 0.6701161, 1, 0, 0.682353, 1,
1.247191, 1.216834, 0.6511637, 1, 0, 0.6784314, 1,
1.258531, -0.8846499, 3.69724, 1, 0, 0.6705883, 1,
1.262008, 0.626435, -1.246677, 1, 0, 0.6666667, 1,
1.262354, 0.9655263, 0.3039333, 1, 0, 0.6588235, 1,
1.269187, 0.9167414, 0.8439007, 1, 0, 0.654902, 1,
1.273037, 0.009431696, 1.816777, 1, 0, 0.6470588, 1,
1.276672, -1.168756, 0.8275608, 1, 0, 0.6431373, 1,
1.27967, 0.0126839, 1.468598, 1, 0, 0.6352941, 1,
1.295614, -0.1823962, 2.16651, 1, 0, 0.6313726, 1,
1.296572, 1.545281, -0.2726363, 1, 0, 0.6235294, 1,
1.299673, 0.5817074, 0.4522225, 1, 0, 0.6196079, 1,
1.301548, -1.699145, 1.874691, 1, 0, 0.6117647, 1,
1.302688, -0.9944406, 1.721034, 1, 0, 0.6078432, 1,
1.317222, 0.5296397, 0.4620211, 1, 0, 0.6, 1,
1.327397, -1.296312, 2.894675, 1, 0, 0.5921569, 1,
1.336741, 1.852412, 3.045324, 1, 0, 0.5882353, 1,
1.34473, -1.369944, 1.362718, 1, 0, 0.5803922, 1,
1.348205, -0.4627131, 0.9098087, 1, 0, 0.5764706, 1,
1.354562, -0.02494983, 0.819573, 1, 0, 0.5686275, 1,
1.359241, -0.2224097, 2.223993, 1, 0, 0.5647059, 1,
1.3681, 0.5409419, 1.321182, 1, 0, 0.5568628, 1,
1.37206, -1.104022, 3.437265, 1, 0, 0.5529412, 1,
1.376606, -0.5000942, 1.898929, 1, 0, 0.5450981, 1,
1.378288, -1.135018, 2.615049, 1, 0, 0.5411765, 1,
1.378475, -0.732832, 2.460657, 1, 0, 0.5333334, 1,
1.379213, -0.1896228, 0.771989, 1, 0, 0.5294118, 1,
1.380546, -0.09333551, -0.6689016, 1, 0, 0.5215687, 1,
1.387144, -0.02944178, 1.893852, 1, 0, 0.5176471, 1,
1.390308, 1.118619, 1.158463, 1, 0, 0.509804, 1,
1.3908, 0.07496668, 1.110312, 1, 0, 0.5058824, 1,
1.39358, 0.818059, 1.825263, 1, 0, 0.4980392, 1,
1.395914, -0.6322891, 2.64068, 1, 0, 0.4901961, 1,
1.396386, -1.415907, 0.7151419, 1, 0, 0.4862745, 1,
1.397696, -0.07288434, 1.411051, 1, 0, 0.4784314, 1,
1.407362, 0.742608, 2.017244, 1, 0, 0.4745098, 1,
1.423801, 0.9214, 1.601238, 1, 0, 0.4666667, 1,
1.428327, 1.018647, 1.291668, 1, 0, 0.4627451, 1,
1.429853, -1.48507, 3.255258, 1, 0, 0.454902, 1,
1.435855, 0.320085, -0.6638796, 1, 0, 0.4509804, 1,
1.446283, 0.8806742, 0.007212636, 1, 0, 0.4431373, 1,
1.449063, -1.757545, 1.544993, 1, 0, 0.4392157, 1,
1.451643, 0.7315465, 0.8071485, 1, 0, 0.4313726, 1,
1.453249, 1.494745, -0.1501438, 1, 0, 0.427451, 1,
1.460546, 0.6202494, 1.812193, 1, 0, 0.4196078, 1,
1.465395, -0.03731532, -0.2452491, 1, 0, 0.4156863, 1,
1.478818, 0.3150872, 3.483199, 1, 0, 0.4078431, 1,
1.489595, 0.3214806, 1.035276, 1, 0, 0.4039216, 1,
1.491112, 0.1417695, 0.956604, 1, 0, 0.3960784, 1,
1.49616, 1.224938, 2.443794, 1, 0, 0.3882353, 1,
1.498738, 1.466313, 0.8672047, 1, 0, 0.3843137, 1,
1.507203, 0.08887448, 0.2687671, 1, 0, 0.3764706, 1,
1.514012, -0.06333094, 3.532794, 1, 0, 0.372549, 1,
1.517533, -0.5345111, 1.376127, 1, 0, 0.3647059, 1,
1.528454, -0.1911277, 0.6567726, 1, 0, 0.3607843, 1,
1.529399, -0.2860693, 2.469286, 1, 0, 0.3529412, 1,
1.535473, 1.242925, 0.7706282, 1, 0, 0.3490196, 1,
1.545382, -0.2169098, 1.679566, 1, 0, 0.3411765, 1,
1.548079, 1.125502, -0.2787659, 1, 0, 0.3372549, 1,
1.567824, 1.047912, 1.526315, 1, 0, 0.3294118, 1,
1.570963, -0.2316403, 1.190633, 1, 0, 0.3254902, 1,
1.572071, -0.5537157, 3.320935, 1, 0, 0.3176471, 1,
1.577336, -1.380743, 2.264441, 1, 0, 0.3137255, 1,
1.578528, -0.2131475, 1.110447, 1, 0, 0.3058824, 1,
1.578771, 1.290201, 0.9849298, 1, 0, 0.2980392, 1,
1.579242, -0.641308, 2.130625, 1, 0, 0.2941177, 1,
1.58468, -0.3990886, 2.766992, 1, 0, 0.2862745, 1,
1.589444, 0.1486709, 3.475409, 1, 0, 0.282353, 1,
1.595972, 0.5044017, 1.720716, 1, 0, 0.2745098, 1,
1.623403, 0.1744328, 3.947765, 1, 0, 0.2705882, 1,
1.626033, 0.17546, 1.891356, 1, 0, 0.2627451, 1,
1.630385, 1.305311, 1.40238, 1, 0, 0.2588235, 1,
1.634144, -0.1669696, -0.09672727, 1, 0, 0.2509804, 1,
1.638271, -0.4896106, 3.035482, 1, 0, 0.2470588, 1,
1.652172, 1.583908, 0.5225081, 1, 0, 0.2392157, 1,
1.654661, 1.128068, 0.6516958, 1, 0, 0.2352941, 1,
1.69734, -0.7453089, 1.549529, 1, 0, 0.227451, 1,
1.71026, -1.236787, 2.135254, 1, 0, 0.2235294, 1,
1.718728, 0.5754714, 1.459718, 1, 0, 0.2156863, 1,
1.744524, 3.316687, 0.5951775, 1, 0, 0.2117647, 1,
1.751544, -1.329821, 2.843264, 1, 0, 0.2039216, 1,
1.786173, 0.2208114, 0.4969785, 1, 0, 0.1960784, 1,
1.796158, 0.5740134, 2.044101, 1, 0, 0.1921569, 1,
1.8081, 0.4946693, 0.1259702, 1, 0, 0.1843137, 1,
1.810404, 0.2128689, 2.626653, 1, 0, 0.1803922, 1,
1.870295, 0.4082625, 2.632091, 1, 0, 0.172549, 1,
1.889202, -0.1893963, 2.554132, 1, 0, 0.1686275, 1,
1.898294, -0.6439451, 2.326116, 1, 0, 0.1607843, 1,
1.931511, -0.06017486, 1.593249, 1, 0, 0.1568628, 1,
1.942228, -0.5011221, 0.6669544, 1, 0, 0.1490196, 1,
1.950736, 0.2468594, 0.151415, 1, 0, 0.145098, 1,
1.989141, 1.051761, 2.77934, 1, 0, 0.1372549, 1,
2.000698, 0.2926916, 0.329795, 1, 0, 0.1333333, 1,
2.05748, -1.702836, 1.3949, 1, 0, 0.1254902, 1,
2.137642, -1.008265, 3.802599, 1, 0, 0.1215686, 1,
2.152537, -0.2799918, 2.557002, 1, 0, 0.1137255, 1,
2.153943, -1.023094, 2.241684, 1, 0, 0.1098039, 1,
2.15582, -0.1825441, 1.660214, 1, 0, 0.1019608, 1,
2.205654, 0.09380715, 2.764704, 1, 0, 0.09411765, 1,
2.255292, -0.3209401, 1.219965, 1, 0, 0.09019608, 1,
2.319676, -0.7157873, 1.112753, 1, 0, 0.08235294, 1,
2.342566, -0.7894567, 1.811281, 1, 0, 0.07843138, 1,
2.433872, -0.8806995, 2.516848, 1, 0, 0.07058824, 1,
2.459529, 0.8942197, -1.543761, 1, 0, 0.06666667, 1,
2.488294, -0.6436797, 3.960684, 1, 0, 0.05882353, 1,
2.498431, 1.317719, 0.9078156, 1, 0, 0.05490196, 1,
2.512884, 1.777305, 1.874399, 1, 0, 0.04705882, 1,
2.517233, -0.7184951, 1.049122, 1, 0, 0.04313726, 1,
2.598791, 0.4647385, 2.308135, 1, 0, 0.03529412, 1,
2.62837, 1.100923, 1.1571, 1, 0, 0.03137255, 1,
2.669519, 1.06447, 1.205928, 1, 0, 0.02352941, 1,
2.69057, 0.4676353, 2.10726, 1, 0, 0.01960784, 1,
2.713891, 1.089176, 0.5399879, 1, 0, 0.01176471, 1,
2.896312, -0.1049154, 0.8139611, 1, 0, 0.007843138, 1
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
0.04692256, -4.077946, -7.23382, 0, -0.5, 0.5, 0.5,
0.04692256, -4.077946, -7.23382, 1, -0.5, 0.5, 0.5,
0.04692256, -4.077946, -7.23382, 1, 1.5, 0.5, 0.5,
0.04692256, -4.077946, -7.23382, 0, 1.5, 0.5, 0.5
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
-3.768409, 0.2416017, -7.23382, 0, -0.5, 0.5, 0.5,
-3.768409, 0.2416017, -7.23382, 1, -0.5, 0.5, 0.5,
-3.768409, 0.2416017, -7.23382, 1, 1.5, 0.5, 0.5,
-3.768409, 0.2416017, -7.23382, 0, 1.5, 0.5, 0.5
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
-3.768409, -4.077946, 0.190829, 0, -0.5, 0.5, 0.5,
-3.768409, -4.077946, 0.190829, 1, -0.5, 0.5, 0.5,
-3.768409, -4.077946, 0.190829, 1, 1.5, 0.5, 0.5,
-3.768409, -4.077946, 0.190829, 0, 1.5, 0.5, 0.5
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
-2, -3.081127, -5.52044,
2, -3.081127, -5.52044,
-2, -3.081127, -5.52044,
-2, -3.247264, -5.806003,
-1, -3.081127, -5.52044,
-1, -3.247264, -5.806003,
0, -3.081127, -5.52044,
0, -3.247264, -5.806003,
1, -3.081127, -5.52044,
1, -3.247264, -5.806003,
2, -3.081127, -5.52044,
2, -3.247264, -5.806003
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
-2, -3.579537, -6.37713, 0, -0.5, 0.5, 0.5,
-2, -3.579537, -6.37713, 1, -0.5, 0.5, 0.5,
-2, -3.579537, -6.37713, 1, 1.5, 0.5, 0.5,
-2, -3.579537, -6.37713, 0, 1.5, 0.5, 0.5,
-1, -3.579537, -6.37713, 0, -0.5, 0.5, 0.5,
-1, -3.579537, -6.37713, 1, -0.5, 0.5, 0.5,
-1, -3.579537, -6.37713, 1, 1.5, 0.5, 0.5,
-1, -3.579537, -6.37713, 0, 1.5, 0.5, 0.5,
0, -3.579537, -6.37713, 0, -0.5, 0.5, 0.5,
0, -3.579537, -6.37713, 1, -0.5, 0.5, 0.5,
0, -3.579537, -6.37713, 1, 1.5, 0.5, 0.5,
0, -3.579537, -6.37713, 0, 1.5, 0.5, 0.5,
1, -3.579537, -6.37713, 0, -0.5, 0.5, 0.5,
1, -3.579537, -6.37713, 1, -0.5, 0.5, 0.5,
1, -3.579537, -6.37713, 1, 1.5, 0.5, 0.5,
1, -3.579537, -6.37713, 0, 1.5, 0.5, 0.5,
2, -3.579537, -6.37713, 0, -0.5, 0.5, 0.5,
2, -3.579537, -6.37713, 1, -0.5, 0.5, 0.5,
2, -3.579537, -6.37713, 1, 1.5, 0.5, 0.5,
2, -3.579537, -6.37713, 0, 1.5, 0.5, 0.5
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
-2.887948, -2, -5.52044,
-2.887948, 3, -5.52044,
-2.887948, -2, -5.52044,
-3.034692, -2, -5.806003,
-2.887948, -1, -5.52044,
-3.034692, -1, -5.806003,
-2.887948, 0, -5.52044,
-3.034692, 0, -5.806003,
-2.887948, 1, -5.52044,
-3.034692, 1, -5.806003,
-2.887948, 2, -5.52044,
-3.034692, 2, -5.806003,
-2.887948, 3, -5.52044,
-3.034692, 3, -5.806003
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
-3.328179, -2, -6.37713, 0, -0.5, 0.5, 0.5,
-3.328179, -2, -6.37713, 1, -0.5, 0.5, 0.5,
-3.328179, -2, -6.37713, 1, 1.5, 0.5, 0.5,
-3.328179, -2, -6.37713, 0, 1.5, 0.5, 0.5,
-3.328179, -1, -6.37713, 0, -0.5, 0.5, 0.5,
-3.328179, -1, -6.37713, 1, -0.5, 0.5, 0.5,
-3.328179, -1, -6.37713, 1, 1.5, 0.5, 0.5,
-3.328179, -1, -6.37713, 0, 1.5, 0.5, 0.5,
-3.328179, 0, -6.37713, 0, -0.5, 0.5, 0.5,
-3.328179, 0, -6.37713, 1, -0.5, 0.5, 0.5,
-3.328179, 0, -6.37713, 1, 1.5, 0.5, 0.5,
-3.328179, 0, -6.37713, 0, 1.5, 0.5, 0.5,
-3.328179, 1, -6.37713, 0, -0.5, 0.5, 0.5,
-3.328179, 1, -6.37713, 1, -0.5, 0.5, 0.5,
-3.328179, 1, -6.37713, 1, 1.5, 0.5, 0.5,
-3.328179, 1, -6.37713, 0, 1.5, 0.5, 0.5,
-3.328179, 2, -6.37713, 0, -0.5, 0.5, 0.5,
-3.328179, 2, -6.37713, 1, -0.5, 0.5, 0.5,
-3.328179, 2, -6.37713, 1, 1.5, 0.5, 0.5,
-3.328179, 2, -6.37713, 0, 1.5, 0.5, 0.5,
-3.328179, 3, -6.37713, 0, -0.5, 0.5, 0.5,
-3.328179, 3, -6.37713, 1, -0.5, 0.5, 0.5,
-3.328179, 3, -6.37713, 1, 1.5, 0.5, 0.5,
-3.328179, 3, -6.37713, 0, 1.5, 0.5, 0.5
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
-2.887948, -3.081127, -4,
-2.887948, -3.081127, 4,
-2.887948, -3.081127, -4,
-3.034692, -3.247264, -4,
-2.887948, -3.081127, -2,
-3.034692, -3.247264, -2,
-2.887948, -3.081127, 0,
-3.034692, -3.247264, 0,
-2.887948, -3.081127, 2,
-3.034692, -3.247264, 2,
-2.887948, -3.081127, 4,
-3.034692, -3.247264, 4
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
-3.328179, -3.579537, -4, 0, -0.5, 0.5, 0.5,
-3.328179, -3.579537, -4, 1, -0.5, 0.5, 0.5,
-3.328179, -3.579537, -4, 1, 1.5, 0.5, 0.5,
-3.328179, -3.579537, -4, 0, 1.5, 0.5, 0.5,
-3.328179, -3.579537, -2, 0, -0.5, 0.5, 0.5,
-3.328179, -3.579537, -2, 1, -0.5, 0.5, 0.5,
-3.328179, -3.579537, -2, 1, 1.5, 0.5, 0.5,
-3.328179, -3.579537, -2, 0, 1.5, 0.5, 0.5,
-3.328179, -3.579537, 0, 0, -0.5, 0.5, 0.5,
-3.328179, -3.579537, 0, 1, -0.5, 0.5, 0.5,
-3.328179, -3.579537, 0, 1, 1.5, 0.5, 0.5,
-3.328179, -3.579537, 0, 0, 1.5, 0.5, 0.5,
-3.328179, -3.579537, 2, 0, -0.5, 0.5, 0.5,
-3.328179, -3.579537, 2, 1, -0.5, 0.5, 0.5,
-3.328179, -3.579537, 2, 1, 1.5, 0.5, 0.5,
-3.328179, -3.579537, 2, 0, 1.5, 0.5, 0.5,
-3.328179, -3.579537, 4, 0, -0.5, 0.5, 0.5,
-3.328179, -3.579537, 4, 1, -0.5, 0.5, 0.5,
-3.328179, -3.579537, 4, 1, 1.5, 0.5, 0.5,
-3.328179, -3.579537, 4, 0, 1.5, 0.5, 0.5
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
-2.887948, -3.081127, -5.52044,
-2.887948, 3.564331, -5.52044,
-2.887948, -3.081127, 5.902098,
-2.887948, 3.564331, 5.902098,
-2.887948, -3.081127, -5.52044,
-2.887948, -3.081127, 5.902098,
-2.887948, 3.564331, -5.52044,
-2.887948, 3.564331, 5.902098,
-2.887948, -3.081127, -5.52044,
2.981793, -3.081127, -5.52044,
-2.887948, -3.081127, 5.902098,
2.981793, -3.081127, 5.902098,
-2.887948, 3.564331, -5.52044,
2.981793, 3.564331, -5.52044,
-2.887948, 3.564331, 5.902098,
2.981793, 3.564331, 5.902098,
2.981793, -3.081127, -5.52044,
2.981793, 3.564331, -5.52044,
2.981793, -3.081127, 5.902098,
2.981793, 3.564331, 5.902098,
2.981793, -3.081127, -5.52044,
2.981793, -3.081127, 5.902098,
2.981793, 3.564331, -5.52044,
2.981793, 3.564331, 5.902098
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
var radius = 7.721336;
var distance = 34.3531;
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
mvMatrix.translate( -0.04692256, -0.2416017, -0.190829 );
mvMatrix.scale( 1.422287, 1.256266, 0.7308761 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.3531);
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
blasticidin-S<-read.table("blasticidin-S.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-blasticidin-S$V2
```

```
## Error in eval(expr, envir, enclos): object 'blasticidin' not found
```

```r
y<-blasticidin-S$V3
```

```
## Error in eval(expr, envir, enclos): object 'blasticidin' not found
```

```r
z<-blasticidin-S$V4
```

```
## Error in eval(expr, envir, enclos): object 'blasticidin' not found
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
-2.802466, 1.769535, 0.8092463, 0, 0, 1, 1, 1,
-2.63862, -1.46052, -2.648425, 1, 0, 0, 1, 1,
-2.55775, -0.16995, -2.412715, 1, 0, 0, 1, 1,
-2.547594, 1.149035, -2.533229, 1, 0, 0, 1, 1,
-2.522499, 0.1121536, -1.04958, 1, 0, 0, 1, 1,
-2.509605, 2.23384, 0.3533993, 1, 0, 0, 1, 1,
-2.452586, 1.253351, -1.053837, 0, 0, 0, 1, 1,
-2.36163, -0.1769301, -1.279301, 0, 0, 0, 1, 1,
-2.305131, 0.03477167, -2.211539, 0, 0, 0, 1, 1,
-2.305006, 0.2749471, -0.1252315, 0, 0, 0, 1, 1,
-2.293569, -2.424186, -3.2608, 0, 0, 0, 1, 1,
-2.267399, 0.1520563, -1.437959, 0, 0, 0, 1, 1,
-2.205426, 1.141985, -1.907993, 0, 0, 0, 1, 1,
-2.197846, -1.395584, -2.516337, 1, 1, 1, 1, 1,
-2.189518, 0.8085998, -0.9009733, 1, 1, 1, 1, 1,
-2.147213, 0.09230092, -1.800075, 1, 1, 1, 1, 1,
-2.109367, -0.6433784, -1.66432, 1, 1, 1, 1, 1,
-2.075857, 0.1622283, -2.926522, 1, 1, 1, 1, 1,
-2.04074, -0.4016724, -1.013048, 1, 1, 1, 1, 1,
-2.012738, 2.648289, -2.036255, 1, 1, 1, 1, 1,
-1.982918, 1.941579, 0.1123052, 1, 1, 1, 1, 1,
-1.978451, -0.4889984, -0.8304252, 1, 1, 1, 1, 1,
-1.924658, -1.749731, -2.071903, 1, 1, 1, 1, 1,
-1.905094, 2.813778, -0.8067598, 1, 1, 1, 1, 1,
-1.891753, 1.817847, -1.7953, 1, 1, 1, 1, 1,
-1.891058, -0.8914796, -2.206537, 1, 1, 1, 1, 1,
-1.890451, 1.601284, -0.116424, 1, 1, 1, 1, 1,
-1.88782, 0.3381219, -0.7010843, 1, 1, 1, 1, 1,
-1.88303, 0.4091713, -1.675655, 0, 0, 1, 1, 1,
-1.879657, -0.158836, -1.121508, 1, 0, 0, 1, 1,
-1.879217, -0.184613, -0.8594106, 1, 0, 0, 1, 1,
-1.876651, -0.6026778, -2.341968, 1, 0, 0, 1, 1,
-1.867598, -0.1939752, -3.044915, 1, 0, 0, 1, 1,
-1.862255, -0.4191218, -1.09944, 1, 0, 0, 1, 1,
-1.853065, 0.4719243, -1.157909, 0, 0, 0, 1, 1,
-1.846148, -0.3986963, -2.719075, 0, 0, 0, 1, 1,
-1.827763, 1.551433, -0.2185806, 0, 0, 0, 1, 1,
-1.800295, 1.721642, -0.8795816, 0, 0, 0, 1, 1,
-1.755921, -0.1481392, -1.220243, 0, 0, 0, 1, 1,
-1.750688, -0.2989, -3.101045, 0, 0, 0, 1, 1,
-1.725752, -0.07251538, -2.141266, 0, 0, 0, 1, 1,
-1.720242, 0.957087, 0.8829563, 1, 1, 1, 1, 1,
-1.713359, 0.6691884, -1.969957, 1, 1, 1, 1, 1,
-1.709285, 0.7413971, -1.173774, 1, 1, 1, 1, 1,
-1.69074, 0.1146277, -1.433208, 1, 1, 1, 1, 1,
-1.681706, 0.9948959, -2.346699, 1, 1, 1, 1, 1,
-1.676191, 0.2429291, -3.028402, 1, 1, 1, 1, 1,
-1.67605, 0.2860633, -0.1167503, 1, 1, 1, 1, 1,
-1.623829, 0.8088765, -0.8374712, 1, 1, 1, 1, 1,
-1.6206, 0.4065951, -0.5605579, 1, 1, 1, 1, 1,
-1.618907, 1.047345, -2.021752, 1, 1, 1, 1, 1,
-1.611165, 1.260443, -0.4914739, 1, 1, 1, 1, 1,
-1.610463, -1.90449, -2.209851, 1, 1, 1, 1, 1,
-1.608124, 0.3066246, -0.5310328, 1, 1, 1, 1, 1,
-1.600452, 0.4113984, -1.167822, 1, 1, 1, 1, 1,
-1.585073, 0.1959395, -2.083064, 1, 1, 1, 1, 1,
-1.580488, 1.772201, 0.7939483, 0, 0, 1, 1, 1,
-1.575006, -2.097202, -0.5149505, 1, 0, 0, 1, 1,
-1.572803, -0.4574897, -0.8110402, 1, 0, 0, 1, 1,
-1.567686, 2.198722, 1.584643, 1, 0, 0, 1, 1,
-1.567066, -0.665123, -3.502433, 1, 0, 0, 1, 1,
-1.556371, -0.2667856, -2.887938, 1, 0, 0, 1, 1,
-1.550089, -0.7586161, -1.960708, 0, 0, 0, 1, 1,
-1.534671, 0.5427287, -0.2852998, 0, 0, 0, 1, 1,
-1.519587, 0.8086962, -0.6312817, 0, 0, 0, 1, 1,
-1.511355, 1.410919, -1.769733, 0, 0, 0, 1, 1,
-1.494377, -0.4797631, -0.03282023, 0, 0, 0, 1, 1,
-1.480679, 0.06092661, -1.653705, 0, 0, 0, 1, 1,
-1.470327, 1.188127, -1.367953, 0, 0, 0, 1, 1,
-1.46428, 2.745558, -1.203602, 1, 1, 1, 1, 1,
-1.461507, -1.146811, -3.268206, 1, 1, 1, 1, 1,
-1.461443, 1.762012, 0.04059182, 1, 1, 1, 1, 1,
-1.455504, -0.573417, -1.940854, 1, 1, 1, 1, 1,
-1.445767, -0.6356277, -1.111987, 1, 1, 1, 1, 1,
-1.440283, -0.4012024, -0.2161544, 1, 1, 1, 1, 1,
-1.439482, 0.3598411, -0.2431393, 1, 1, 1, 1, 1,
-1.427113, -1.347192, -1.9413, 1, 1, 1, 1, 1,
-1.420073, -1.417812, -2.802591, 1, 1, 1, 1, 1,
-1.416719, -1.816106, -1.39866, 1, 1, 1, 1, 1,
-1.399136, -1.144264, -1.097808, 1, 1, 1, 1, 1,
-1.398831, 0.3884958, -2.108803, 1, 1, 1, 1, 1,
-1.398015, -0.5064285, -3.919023, 1, 1, 1, 1, 1,
-1.397312, 0.1430119, -1.378846, 1, 1, 1, 1, 1,
-1.393707, -1.132225, -2.365984, 1, 1, 1, 1, 1,
-1.388263, -0.215436, -2.017567, 0, 0, 1, 1, 1,
-1.381892, 2.299175, -0.7557951, 1, 0, 0, 1, 1,
-1.379624, -0.7011039, -0.3846671, 1, 0, 0, 1, 1,
-1.363583, 0.6548107, 0.08992243, 1, 0, 0, 1, 1,
-1.362364, -0.2860507, -1.876355, 1, 0, 0, 1, 1,
-1.358538, -0.2749434, 0.8489006, 1, 0, 0, 1, 1,
-1.349389, 1.821643, 0.353762, 0, 0, 0, 1, 1,
-1.345617, -1.58515, -3.153605, 0, 0, 0, 1, 1,
-1.339565, -1.68129, -1.797053, 0, 0, 0, 1, 1,
-1.322288, 0.5329911, -2.142431, 0, 0, 0, 1, 1,
-1.320099, -0.1746453, -0.7249441, 0, 0, 0, 1, 1,
-1.306405, -0.9477579, -2.631861, 0, 0, 0, 1, 1,
-1.305548, 1.466327, -0.8179192, 0, 0, 0, 1, 1,
-1.295507, -0.7331935, -1.599836, 1, 1, 1, 1, 1,
-1.291359, -0.03765229, -2.051743, 1, 1, 1, 1, 1,
-1.291092, 0.8651117, -0.05628491, 1, 1, 1, 1, 1,
-1.288179, 0.4902284, -2.126569, 1, 1, 1, 1, 1,
-1.285151, 1.078003, -0.9009109, 1, 1, 1, 1, 1,
-1.284444, 0.1676456, -2.898826, 1, 1, 1, 1, 1,
-1.277726, -0.4289053, -1.242418, 1, 1, 1, 1, 1,
-1.270954, -0.5647473, -1.479788, 1, 1, 1, 1, 1,
-1.264147, -2.4756, -2.981229, 1, 1, 1, 1, 1,
-1.257835, 0.5211172, -2.285864, 1, 1, 1, 1, 1,
-1.257199, 1.317227, -1.431265, 1, 1, 1, 1, 1,
-1.256719, 1.035955, -1.357571, 1, 1, 1, 1, 1,
-1.255899, -0.2029622, -2.209629, 1, 1, 1, 1, 1,
-1.253464, 1.951181, -1.211477, 1, 1, 1, 1, 1,
-1.251982, 0.1431109, -1.535254, 1, 1, 1, 1, 1,
-1.25096, -0.0002116539, -0.6655692, 0, 0, 1, 1, 1,
-1.243245, 0.2792132, -1.137143, 1, 0, 0, 1, 1,
-1.235806, -1.968488, -2.320293, 1, 0, 0, 1, 1,
-1.231821, 0.1406112, -1.460294, 1, 0, 0, 1, 1,
-1.228312, 0.4978209, -2.487203, 1, 0, 0, 1, 1,
-1.225615, 2.630984, -0.02620849, 1, 0, 0, 1, 1,
-1.204809, 0.1503017, -1.941229, 0, 0, 0, 1, 1,
-1.196165, 0.8395094, -0.649518, 0, 0, 0, 1, 1,
-1.185245, 1.496447, -0.9139165, 0, 0, 0, 1, 1,
-1.184601, -0.2751735, -2.488164, 0, 0, 0, 1, 1,
-1.165406, 0.3916572, -1.93512, 0, 0, 0, 1, 1,
-1.164999, -0.2591062, -0.686025, 0, 0, 0, 1, 1,
-1.154458, 0.2568744, 0.1164924, 0, 0, 0, 1, 1,
-1.153128, -0.3182189, -2.012893, 1, 1, 1, 1, 1,
-1.147797, 0.4262781, -2.559618, 1, 1, 1, 1, 1,
-1.144591, 0.506273, 0.5840327, 1, 1, 1, 1, 1,
-1.141814, -0.2175369, -1.79387, 1, 1, 1, 1, 1,
-1.137449, -0.7207666, -3.526365, 1, 1, 1, 1, 1,
-1.136541, 1.40181, -2.826517, 1, 1, 1, 1, 1,
-1.135809, 0.6371862, -2.424402, 1, 1, 1, 1, 1,
-1.129247, -0.6470351, -1.17652, 1, 1, 1, 1, 1,
-1.122637, 1.562577, 0.5642915, 1, 1, 1, 1, 1,
-1.115283, 0.7867758, -1.717409, 1, 1, 1, 1, 1,
-1.111921, 0.2046004, -3.494227, 1, 1, 1, 1, 1,
-1.110708, -0.5743547, -1.483527, 1, 1, 1, 1, 1,
-1.104447, 1.898534, -1.704237, 1, 1, 1, 1, 1,
-1.103522, 0.2192676, -0.3901777, 1, 1, 1, 1, 1,
-1.100281, 0.178429, -1.667271, 1, 1, 1, 1, 1,
-1.099105, -1.536872, -2.496948, 0, 0, 1, 1, 1,
-1.091747, 0.5071076, -1.367101, 1, 0, 0, 1, 1,
-1.090817, -0.8078193, -2.87926, 1, 0, 0, 1, 1,
-1.08373, 0.2785921, -2.085901, 1, 0, 0, 1, 1,
-1.082578, -0.6238102, -1.568036, 1, 0, 0, 1, 1,
-1.076876, 0.9768057, -1.291108, 1, 0, 0, 1, 1,
-1.073023, -0.5467983, -0.2765038, 0, 0, 0, 1, 1,
-1.072058, -0.9431641, -2.203398, 0, 0, 0, 1, 1,
-1.063719, -2.382753, -2.420158, 0, 0, 0, 1, 1,
-1.062892, -0.9375967, -2.833027, 0, 0, 0, 1, 1,
-1.057022, 0.4800507, -0.360064, 0, 0, 0, 1, 1,
-1.056134, 2.09086, 0.6886464, 0, 0, 0, 1, 1,
-1.05262, -0.9392145, -0.7066017, 0, 0, 0, 1, 1,
-1.038727, 0.2478214, -0.4488724, 1, 1, 1, 1, 1,
-1.035363, -1.689554, -3.192584, 1, 1, 1, 1, 1,
-1.032927, 1.861208, 1.101797, 1, 1, 1, 1, 1,
-1.023118, 1.396794, 0.7659803, 1, 1, 1, 1, 1,
-1.008479, -0.3134277, -1.24314, 1, 1, 1, 1, 1,
-1.007734, -0.749722, -2.157687, 1, 1, 1, 1, 1,
-1.002187, -1.399097, -3.478279, 1, 1, 1, 1, 1,
-0.9968058, 0.1969417, -2.048282, 1, 1, 1, 1, 1,
-0.9861203, -0.6370432, -2.311829, 1, 1, 1, 1, 1,
-0.9805257, 0.01334813, -1.755964, 1, 1, 1, 1, 1,
-0.9788091, 1.448629, -0.7449637, 1, 1, 1, 1, 1,
-0.9747332, 1.243515, -1.044415, 1, 1, 1, 1, 1,
-0.9718754, -1.56059, -2.712964, 1, 1, 1, 1, 1,
-0.9707249, -0.4521199, -1.157524, 1, 1, 1, 1, 1,
-0.9701612, -0.655144, 0.5331668, 1, 1, 1, 1, 1,
-0.9680523, 0.6933694, -0.3597676, 0, 0, 1, 1, 1,
-0.9676319, 0.3151831, -1.510207, 1, 0, 0, 1, 1,
-0.9675769, 0.8537672, -1.145358, 1, 0, 0, 1, 1,
-0.9673643, 0.342764, -1.224479, 1, 0, 0, 1, 1,
-0.966571, -1.190063, -1.728006, 1, 0, 0, 1, 1,
-0.963677, -0.1941417, -4.27054, 1, 0, 0, 1, 1,
-0.9605793, -0.5946168, -0.126157, 0, 0, 0, 1, 1,
-0.9585863, -1.425459, -3.540258, 0, 0, 0, 1, 1,
-0.9582235, 0.1558564, -1.851333, 0, 0, 0, 1, 1,
-0.9577731, -0.7739902, -1.99119, 0, 0, 0, 1, 1,
-0.9534094, -0.03987423, -3.394237, 0, 0, 0, 1, 1,
-0.9506301, -0.4156705, -2.090535, 0, 0, 0, 1, 1,
-0.9490689, -0.7122901, -1.561077, 0, 0, 0, 1, 1,
-0.9447728, -0.2390167, -3.173693, 1, 1, 1, 1, 1,
-0.9422862, -1.459809, -3.334866, 1, 1, 1, 1, 1,
-0.9406494, -0.5347154, -0.9137253, 1, 1, 1, 1, 1,
-0.939276, -2.011329, -3.295806, 1, 1, 1, 1, 1,
-0.9267841, 0.8368027, -0.9048707, 1, 1, 1, 1, 1,
-0.9238783, -1.26994, -2.155507, 1, 1, 1, 1, 1,
-0.9218847, 1.441328, -0.8212217, 1, 1, 1, 1, 1,
-0.9174402, -0.2757559, -2.161948, 1, 1, 1, 1, 1,
-0.9162471, 0.3600705, -1.138223, 1, 1, 1, 1, 1,
-0.9095131, 1.570115, -0.992124, 1, 1, 1, 1, 1,
-0.9027518, -1.570961, -3.896515, 1, 1, 1, 1, 1,
-0.8940656, 1.159582, -1.581628, 1, 1, 1, 1, 1,
-0.8917046, 2.117079, 1.531586, 1, 1, 1, 1, 1,
-0.8885861, -1.850557, -2.836482, 1, 1, 1, 1, 1,
-0.8849247, 0.6155903, -0.8682244, 1, 1, 1, 1, 1,
-0.8846318, 0.1090269, -0.6854482, 0, 0, 1, 1, 1,
-0.8766024, 2.990561, -1.362013, 1, 0, 0, 1, 1,
-0.8749105, -2.254031, -3.228821, 1, 0, 0, 1, 1,
-0.8743525, 2.027107, -0.4970969, 1, 0, 0, 1, 1,
-0.8713577, 0.1450629, -1.831934, 1, 0, 0, 1, 1,
-0.8701125, -1.131176, -2.085466, 1, 0, 0, 1, 1,
-0.8579099, -0.06837242, -1.616063, 0, 0, 0, 1, 1,
-0.8558825, -0.6909403, -2.431861, 0, 0, 0, 1, 1,
-0.8443593, 0.066575, -1.89338, 0, 0, 0, 1, 1,
-0.8433461, -0.3401921, -2.668224, 0, 0, 0, 1, 1,
-0.8414909, 0.523267, -2.417618, 0, 0, 0, 1, 1,
-0.8409598, 1.061827, 0.1018975, 0, 0, 0, 1, 1,
-0.8390332, -0.05261829, -0.2833308, 0, 0, 0, 1, 1,
-0.8383645, 0.3517836, -0.9543649, 1, 1, 1, 1, 1,
-0.8372875, 1.504291, -0.5110091, 1, 1, 1, 1, 1,
-0.834455, 0.4967187, -2.630813, 1, 1, 1, 1, 1,
-0.8310099, -1.414015, -2.692719, 1, 1, 1, 1, 1,
-0.8308032, -1.889973, -2.021619, 1, 1, 1, 1, 1,
-0.8210207, -1.180491, -0.3810685, 1, 1, 1, 1, 1,
-0.8169357, -0.9088559, -2.361927, 1, 1, 1, 1, 1,
-0.813404, -0.5668528, -1.702732, 1, 1, 1, 1, 1,
-0.8092096, -1.227957, -4.83297, 1, 1, 1, 1, 1,
-0.8082255, -1.34773, -4.131649, 1, 1, 1, 1, 1,
-0.8038182, -1.062453, -2.37706, 1, 1, 1, 1, 1,
-0.801586, 0.8112249, -2.929216, 1, 1, 1, 1, 1,
-0.8006549, 1.64364, -1.643609, 1, 1, 1, 1, 1,
-0.7942703, -0.004612814, -1.014379, 1, 1, 1, 1, 1,
-0.7904108, -0.6560771, -1.511125, 1, 1, 1, 1, 1,
-0.7885879, 2.316943, -0.3017422, 0, 0, 1, 1, 1,
-0.7871239, 0.9597259, -0.3472864, 1, 0, 0, 1, 1,
-0.7849672, 0.2589602, -2.457206, 1, 0, 0, 1, 1,
-0.7795762, -0.05125229, -0.5686051, 1, 0, 0, 1, 1,
-0.7758825, 1.816304, 1.455087, 1, 0, 0, 1, 1,
-0.7724878, 0.05660944, -1.843121, 1, 0, 0, 1, 1,
-0.7693272, 0.783864, -0.9133326, 0, 0, 0, 1, 1,
-0.7580376, -1.313523, -3.640892, 0, 0, 0, 1, 1,
-0.7541322, 0.467867, 0.05296865, 0, 0, 0, 1, 1,
-0.7501129, -0.8652703, -2.382561, 0, 0, 0, 1, 1,
-0.7431539, 0.5700824, 1.144938, 0, 0, 0, 1, 1,
-0.7345386, 0.1153427, -3.028571, 0, 0, 0, 1, 1,
-0.7345263, -0.7658035, -2.441266, 0, 0, 0, 1, 1,
-0.7331935, -1.456384, -2.230656, 1, 1, 1, 1, 1,
-0.7310265, -0.2595527, 0.145657, 1, 1, 1, 1, 1,
-0.7291843, -0.07842714, -1.891224, 1, 1, 1, 1, 1,
-0.7281458, -0.6451216, -1.060781, 1, 1, 1, 1, 1,
-0.727226, -1.183345, -2.571709, 1, 1, 1, 1, 1,
-0.7209772, 0.1263319, -2.181639, 1, 1, 1, 1, 1,
-0.7173333, -2.011012, -2.832689, 1, 1, 1, 1, 1,
-0.7169021, -0.2830662, -2.101099, 1, 1, 1, 1, 1,
-0.716714, -0.4417235, -1.548631, 1, 1, 1, 1, 1,
-0.7157535, -0.5532376, -0.4589631, 1, 1, 1, 1, 1,
-0.7115833, -1.848692, -3.67035, 1, 1, 1, 1, 1,
-0.7015694, -0.9068263, -2.918228, 1, 1, 1, 1, 1,
-0.693601, 0.3111283, -1.253807, 1, 1, 1, 1, 1,
-0.6929593, -0.7251345, -3.158773, 1, 1, 1, 1, 1,
-0.6915442, -0.212393, -3.225771, 1, 1, 1, 1, 1,
-0.6893478, -1.53414, -1.510957, 0, 0, 1, 1, 1,
-0.6879484, 0.6115952, -1.424871, 1, 0, 0, 1, 1,
-0.6872534, 1.058167, -1.270934, 1, 0, 0, 1, 1,
-0.6795549, 0.5439256, -1.239602, 1, 0, 0, 1, 1,
-0.6789432, 0.1240837, -1.050649, 1, 0, 0, 1, 1,
-0.6771576, 0.1045058, -1.090551, 1, 0, 0, 1, 1,
-0.6737514, 1.585035, -0.560577, 0, 0, 0, 1, 1,
-0.6666442, 0.2549147, 0.2914869, 0, 0, 0, 1, 1,
-0.6651487, -0.3094376, -1.048335, 0, 0, 0, 1, 1,
-0.6632091, -1.780789, -2.19137, 0, 0, 0, 1, 1,
-0.6630705, -0.09690525, -1.91502, 0, 0, 0, 1, 1,
-0.6577109, -0.9551668, -3.219285, 0, 0, 0, 1, 1,
-0.654073, 0.3610042, -0.2455975, 0, 0, 0, 1, 1,
-0.6462304, 1.478136, -0.3779498, 1, 1, 1, 1, 1,
-0.6444188, 0.1154269, -1.969645, 1, 1, 1, 1, 1,
-0.6418507, 0.4622136, -0.9791363, 1, 1, 1, 1, 1,
-0.6407861, -0.894763, -2.594802, 1, 1, 1, 1, 1,
-0.6310089, -1.559188, -2.656559, 1, 1, 1, 1, 1,
-0.61449, 0.3337897, -2.341444, 1, 1, 1, 1, 1,
-0.6081948, 0.8973258, -1.141966, 1, 1, 1, 1, 1,
-0.6054136, 0.2766822, -1.591336, 1, 1, 1, 1, 1,
-0.602815, 1.069263, 0.7202285, 1, 1, 1, 1, 1,
-0.5970361, -0.4907986, -3.796574, 1, 1, 1, 1, 1,
-0.588203, 0.6540755, -0.6189448, 1, 1, 1, 1, 1,
-0.5880526, 0.315246, -2.033507, 1, 1, 1, 1, 1,
-0.5879153, -0.5764308, -1.335577, 1, 1, 1, 1, 1,
-0.5877722, 1.261777, -0.008560444, 1, 1, 1, 1, 1,
-0.5839438, 1.462119, -1.292009, 1, 1, 1, 1, 1,
-0.5813441, 0.2200263, -0.7069665, 0, 0, 1, 1, 1,
-0.5791075, -0.613704, -2.562869, 1, 0, 0, 1, 1,
-0.5782058, -1.070775, -0.69658, 1, 0, 0, 1, 1,
-0.5755565, 0.2407183, -0.4230693, 1, 0, 0, 1, 1,
-0.5749632, -0.3744717, -1.646166, 1, 0, 0, 1, 1,
-0.5741291, -0.4918233, -1.132487, 1, 0, 0, 1, 1,
-0.573436, -0.3160857, -0.1380336, 0, 0, 0, 1, 1,
-0.5680069, -0.4480249, -2.435769, 0, 0, 0, 1, 1,
-0.5628449, 0.3467458, -0.1390457, 0, 0, 0, 1, 1,
-0.5589817, 0.333541, -2.681442, 0, 0, 0, 1, 1,
-0.5458716, -0.2868637, -2.282721, 0, 0, 0, 1, 1,
-0.5434209, -0.471536, -1.984372, 0, 0, 0, 1, 1,
-0.5354692, -1.178669, -2.289519, 0, 0, 0, 1, 1,
-0.5319568, 1.677361, -0.04396653, 1, 1, 1, 1, 1,
-0.5267767, -1.562924, -3.527761, 1, 1, 1, 1, 1,
-0.5244519, 0.8816758, -1.43194, 1, 1, 1, 1, 1,
-0.5223797, -0.1707975, -2.311695, 1, 1, 1, 1, 1,
-0.5196506, -0.7011606, -3.858567, 1, 1, 1, 1, 1,
-0.513, -2.74932, -1.403817, 1, 1, 1, 1, 1,
-0.5115141, -0.6530227, -2.160017, 1, 1, 1, 1, 1,
-0.5065194, 0.05345737, -2.100529, 1, 1, 1, 1, 1,
-0.5025132, 0.2114961, -0.2123237, 1, 1, 1, 1, 1,
-0.5001807, 0.6875044, -0.644967, 1, 1, 1, 1, 1,
-0.4978995, -0.360977, -1.937437, 1, 1, 1, 1, 1,
-0.4976958, 1.601602, 0.7493089, 1, 1, 1, 1, 1,
-0.49552, -0.1359006, -2.114142, 1, 1, 1, 1, 1,
-0.4918973, 0.5816202, -0.4727994, 1, 1, 1, 1, 1,
-0.4880379, -0.4874251, -1.685568, 1, 1, 1, 1, 1,
-0.4878808, -0.2768724, -0.4175974, 0, 0, 1, 1, 1,
-0.4874346, 0.45085, -2.512774, 1, 0, 0, 1, 1,
-0.4862893, 0.2047262, -3.768725, 1, 0, 0, 1, 1,
-0.4843607, 0.3298739, -0.7593073, 1, 0, 0, 1, 1,
-0.4812986, -1.711548, -3.140833, 1, 0, 0, 1, 1,
-0.4766593, 0.1636592, -2.746346, 1, 0, 0, 1, 1,
-0.4671184, -0.1567453, -0.7413529, 0, 0, 0, 1, 1,
-0.4656681, -0.2626398, -2.510688, 0, 0, 0, 1, 1,
-0.4651785, -0.905342, -1.156391, 0, 0, 0, 1, 1,
-0.4580691, -0.02449715, -0.745162, 0, 0, 0, 1, 1,
-0.4565632, -2.146097, -2.131308, 0, 0, 0, 1, 1,
-0.4548422, 0.7804089, -1.273437, 0, 0, 0, 1, 1,
-0.4544106, 1.203024, 0.1776367, 0, 0, 0, 1, 1,
-0.4497451, 0.8821657, -0.6831237, 1, 1, 1, 1, 1,
-0.449668, 0.1337121, -0.2204626, 1, 1, 1, 1, 1,
-0.4477059, 0.4436206, -0.3498957, 1, 1, 1, 1, 1,
-0.4456256, 1.375886, -1.616356, 1, 1, 1, 1, 1,
-0.441686, -1.325962, -1.74112, 1, 1, 1, 1, 1,
-0.4409145, 2.338261, 1.353023, 1, 1, 1, 1, 1,
-0.4407776, -0.5143081, -2.905903, 1, 1, 1, 1, 1,
-0.4330008, -0.8383246, -3.443175, 1, 1, 1, 1, 1,
-0.4261751, 1.050577, -0.8633637, 1, 1, 1, 1, 1,
-0.4187663, 1.788429, -0.01313096, 1, 1, 1, 1, 1,
-0.4108787, 1.31979, -2.027138, 1, 1, 1, 1, 1,
-0.4097037, 0.901495, -0.2853339, 1, 1, 1, 1, 1,
-0.4060158, -2.004784, -2.448915, 1, 1, 1, 1, 1,
-0.4041438, 0.9850885, -0.03683802, 1, 1, 1, 1, 1,
-0.4025503, -0.7780659, -1.009302, 1, 1, 1, 1, 1,
-0.394031, 1.755331, -1.077292, 0, 0, 1, 1, 1,
-0.3886805, -0.6535043, -2.579398, 1, 0, 0, 1, 1,
-0.3847484, -1.59114, -3.299967, 1, 0, 0, 1, 1,
-0.3844987, 0.9898826, 2.945428, 1, 0, 0, 1, 1,
-0.377223, -0.1421048, -2.251768, 1, 0, 0, 1, 1,
-0.3721077, -1.126395, -3.700945, 1, 0, 0, 1, 1,
-0.3657255, -1.606357, -3.095325, 0, 0, 0, 1, 1,
-0.3620981, 0.9621481, -2.314561, 0, 0, 0, 1, 1,
-0.3602771, -1.548288, -2.556123, 0, 0, 0, 1, 1,
-0.3580681, 0.574382, 0.1698463, 0, 0, 0, 1, 1,
-0.3566884, -1.493782, -1.973027, 0, 0, 0, 1, 1,
-0.3486128, -0.5985781, -2.284085, 0, 0, 0, 1, 1,
-0.3457201, -0.5983654, -3.068745, 0, 0, 0, 1, 1,
-0.3431991, -0.02062764, -1.812457, 1, 1, 1, 1, 1,
-0.3427229, -0.1920824, -0.9302038, 1, 1, 1, 1, 1,
-0.3400911, -0.7938759, -4.567994, 1, 1, 1, 1, 1,
-0.3345516, 0.9941576, 1.420667, 1, 1, 1, 1, 1,
-0.3345234, 0.9866751, 0.8725308, 1, 1, 1, 1, 1,
-0.3341606, 0.6979843, 1.474764, 1, 1, 1, 1, 1,
-0.3334139, 1.386532, 1.525497, 1, 1, 1, 1, 1,
-0.3333925, 0.7323354, -1.97296, 1, 1, 1, 1, 1,
-0.3326639, 0.2185065, -0.4394338, 1, 1, 1, 1, 1,
-0.3317898, 0.9016545, -1.12326, 1, 1, 1, 1, 1,
-0.3304601, 0.1855552, -1.436418, 1, 1, 1, 1, 1,
-0.3275432, 0.3248181, -1.345921, 1, 1, 1, 1, 1,
-0.3232527, -2.2571, -3.933123, 1, 1, 1, 1, 1,
-0.3228951, 0.9965754, 0.3453093, 1, 1, 1, 1, 1,
-0.3221425, -0.0659488, -1.663516, 1, 1, 1, 1, 1,
-0.320232, -1.404317, -3.641, 0, 0, 1, 1, 1,
-0.3192942, 1.578446, -0.8669906, 1, 0, 0, 1, 1,
-0.2901706, 0.8288964, 0.6032503, 1, 0, 0, 1, 1,
-0.2866412, 1.026613, 2.702286, 1, 0, 0, 1, 1,
-0.286223, -0.7054269, -1.180328, 1, 0, 0, 1, 1,
-0.2843097, 1.473594, 0.9096176, 1, 0, 0, 1, 1,
-0.2667303, 0.4725235, -1.586842, 0, 0, 0, 1, 1,
-0.2650872, 1.026079, -0.2222859, 0, 0, 0, 1, 1,
-0.2578883, -0.5077506, -2.096591, 0, 0, 0, 1, 1,
-0.2504799, -0.2613336, -0.8524508, 0, 0, 0, 1, 1,
-0.2483169, 0.6047623, -0.2154563, 0, 0, 0, 1, 1,
-0.2371596, 0.8477849, -1.158633, 0, 0, 0, 1, 1,
-0.2362248, -0.1061593, -1.009731, 0, 0, 0, 1, 1,
-0.2356358, -0.1461431, -1.763084, 1, 1, 1, 1, 1,
-0.225648, -0.2873874, -1.725494, 1, 1, 1, 1, 1,
-0.2255719, -1.562541, -2.186337, 1, 1, 1, 1, 1,
-0.2233093, 0.04058185, -2.615309, 1, 1, 1, 1, 1,
-0.2231441, -0.1259173, -3.393953, 1, 1, 1, 1, 1,
-0.222973, -0.004264666, -1.081204, 1, 1, 1, 1, 1,
-0.2165548, 1.089971, -0.3803672, 1, 1, 1, 1, 1,
-0.2152172, 0.4053375, -0.333819, 1, 1, 1, 1, 1,
-0.2149356, 0.1218918, -1.164611, 1, 1, 1, 1, 1,
-0.2129015, -0.4487938, -2.858509, 1, 1, 1, 1, 1,
-0.2034967, -0.04723042, -3.409389, 1, 1, 1, 1, 1,
-0.2009526, -0.6391092, -1.490866, 1, 1, 1, 1, 1,
-0.1941339, -0.0502331, 0.8322742, 1, 1, 1, 1, 1,
-0.1919989, -0.5034354, -2.950478, 1, 1, 1, 1, 1,
-0.1820483, 0.5996159, 0.2366842, 1, 1, 1, 1, 1,
-0.1744844, 0.1728552, 1.018657, 0, 0, 1, 1, 1,
-0.1735285, 0.784049, 0.6737072, 1, 0, 0, 1, 1,
-0.1695053, 0.2963144, -0.3684243, 1, 0, 0, 1, 1,
-0.1631706, -1.420543, -3.057813, 1, 0, 0, 1, 1,
-0.1605948, -0.3399276, -1.741894, 1, 0, 0, 1, 1,
-0.1554699, -0.3747683, -1.463428, 1, 0, 0, 1, 1,
-0.1551884, 0.5720776, -0.01218554, 0, 0, 0, 1, 1,
-0.1537898, -0.3502957, -2.485111, 0, 0, 0, 1, 1,
-0.1534921, 0.871272, -0.8160505, 0, 0, 0, 1, 1,
-0.1528621, -1.665365, -1.645427, 0, 0, 0, 1, 1,
-0.14957, -0.06086883, -1.000708, 0, 0, 0, 1, 1,
-0.1457882, 1.314522, -0.3305498, 0, 0, 0, 1, 1,
-0.1421722, -0.09834283, -4.333204, 0, 0, 0, 1, 1,
-0.1407311, -1.409024, -3.070771, 1, 1, 1, 1, 1,
-0.1361315, -2.645859, -4.432819, 1, 1, 1, 1, 1,
-0.1338962, 0.1428593, -2.413752, 1, 1, 1, 1, 1,
-0.1336499, 1.581939, -1.043258, 1, 1, 1, 1, 1,
-0.1336418, 1.776503, -0.9749693, 1, 1, 1, 1, 1,
-0.1328579, 0.4173715, -0.9182326, 1, 1, 1, 1, 1,
-0.1317218, 0.2858303, -0.3925816, 1, 1, 1, 1, 1,
-0.1312808, 1.797282, -0.3294524, 1, 1, 1, 1, 1,
-0.1286435, 0.1641153, -1.282255, 1, 1, 1, 1, 1,
-0.1272266, -0.06972177, -2.143201, 1, 1, 1, 1, 1,
-0.1262812, -0.4321724, -4.399268, 1, 1, 1, 1, 1,
-0.1260903, -0.6461435, -3.923453, 1, 1, 1, 1, 1,
-0.1239708, 1.281162, -0.5236294, 1, 1, 1, 1, 1,
-0.1215859, -0.6141329, -3.679997, 1, 1, 1, 1, 1,
-0.1206216, -0.2926297, -2.099369, 1, 1, 1, 1, 1,
-0.1190074, 0.03256428, -1.194515, 0, 0, 1, 1, 1,
-0.1186474, -1.198321, -3.710017, 1, 0, 0, 1, 1,
-0.1182228, -0.05011786, -1.95156, 1, 0, 0, 1, 1,
-0.1178976, -0.1382316, -2.069609, 1, 0, 0, 1, 1,
-0.1167826, 1.245297, -0.03861353, 1, 0, 0, 1, 1,
-0.1124827, 0.9728865, 0.682757, 1, 0, 0, 1, 1,
-0.1105466, 0.5687642, -0.0482696, 0, 0, 0, 1, 1,
-0.110243, 0.586781, -0.2163172, 0, 0, 0, 1, 1,
-0.1093454, -0.5963616, -1.460219, 0, 0, 0, 1, 1,
-0.1090932, -0.3471789, -2.477899, 0, 0, 0, 1, 1,
-0.1074055, -1.391961, -3.984149, 0, 0, 0, 1, 1,
-0.1055264, 0.1443234, -1.427128, 0, 0, 0, 1, 1,
-0.1037018, -1.884885, -2.646764, 0, 0, 0, 1, 1,
-0.1010558, 1.531033, 0.1378197, 1, 1, 1, 1, 1,
-0.0991734, -0.03800399, -3.293859, 1, 1, 1, 1, 1,
-0.0947792, -1.033764, -3.898151, 1, 1, 1, 1, 1,
-0.09351223, -1.71465, -2.169297, 1, 1, 1, 1, 1,
-0.09197541, 1.24476, 0.5970712, 1, 1, 1, 1, 1,
-0.08875195, -0.6269676, -3.840878, 1, 1, 1, 1, 1,
-0.08676039, -0.6510409, -3.409338, 1, 1, 1, 1, 1,
-0.08128832, 0.2989922, -0.343495, 1, 1, 1, 1, 1,
-0.08026822, -0.450384, -3.595741, 1, 1, 1, 1, 1,
-0.08009588, -0.458771, -3.959693, 1, 1, 1, 1, 1,
-0.0769399, -0.4433952, -2.331145, 1, 1, 1, 1, 1,
-0.07660092, 0.6760291, -0.6713659, 1, 1, 1, 1, 1,
-0.07164591, 1.154818, -1.57066, 1, 1, 1, 1, 1,
-0.07159469, -0.1674357, -2.758111, 1, 1, 1, 1, 1,
-0.07128529, 0.9821069, -0.4920813, 1, 1, 1, 1, 1,
-0.06928131, 0.4348253, -0.7925734, 0, 0, 1, 1, 1,
-0.06674476, 0.3470129, -0.4564492, 1, 0, 0, 1, 1,
-0.06293627, 0.4252807, -0.9826006, 1, 0, 0, 1, 1,
-0.06200852, -0.5116885, -2.810115, 1, 0, 0, 1, 1,
-0.06025488, -0.8974682, -0.4544225, 1, 0, 0, 1, 1,
-0.05864542, 0.7928674, -0.9969587, 1, 0, 0, 1, 1,
-0.05796219, -1.89717, -5.003656, 0, 0, 0, 1, 1,
-0.05580865, 1.081449, 0.1667409, 0, 0, 0, 1, 1,
-0.05369824, -0.8311481, -1.720108, 0, 0, 0, 1, 1,
-0.05041126, -0.6746913, -2.409142, 0, 0, 0, 1, 1,
-0.050076, -0.6169753, -3.409611, 0, 0, 0, 1, 1,
-0.04723242, -0.5205445, -3.016641, 0, 0, 0, 1, 1,
-0.0457197, -1.666332, -5.354092, 0, 0, 0, 1, 1,
-0.04501994, -0.2382107, -2.453913, 1, 1, 1, 1, 1,
-0.0431093, 0.6531842, -1.367068, 1, 1, 1, 1, 1,
-0.03998503, 1.290316, -0.7584521, 1, 1, 1, 1, 1,
-0.03916528, 0.2249048, 0.100931, 1, 1, 1, 1, 1,
-0.03697301, 2.098685, 1.17285, 1, 1, 1, 1, 1,
-0.03670149, -1.423295, -4.622484, 1, 1, 1, 1, 1,
-0.03381856, 0.00824178, -2.42121, 1, 1, 1, 1, 1,
-0.03308275, -1.973537, -1.982406, 1, 1, 1, 1, 1,
-0.03214693, -0.3519523, -3.228341, 1, 1, 1, 1, 1,
-0.03163801, 1.485522, -0.2477617, 1, 1, 1, 1, 1,
-0.02899927, 0.06970423, -0.1957408, 1, 1, 1, 1, 1,
-0.02755153, -1.558364, -1.853637, 1, 1, 1, 1, 1,
-0.02746277, 0.7228435, 0.2287424, 1, 1, 1, 1, 1,
-0.02722853, -0.5500419, -3.067556, 1, 1, 1, 1, 1,
-0.02607933, -0.9686154, -4.78583, 1, 1, 1, 1, 1,
-0.02556707, -1.509114, -2.258558, 0, 0, 1, 1, 1,
-0.01611113, -0.738826, -2.705602, 1, 0, 0, 1, 1,
-0.01516335, 0.002637607, -0.8214606, 1, 0, 0, 1, 1,
-0.0126138, -1.456887, -2.846042, 1, 0, 0, 1, 1,
-0.009208443, 0.01567078, -0.5678965, 1, 0, 0, 1, 1,
-0.003134166, -1.154813, -2.686007, 1, 0, 0, 1, 1,
0.003307014, 0.6617323, -0.3043835, 0, 0, 0, 1, 1,
0.004051987, 0.603902, 0.03172894, 0, 0, 0, 1, 1,
0.009013856, -1.166555, 2.580758, 0, 0, 0, 1, 1,
0.01041629, -1.382285, 3.029675, 0, 0, 0, 1, 1,
0.01327843, -0.6858635, 2.786777, 0, 0, 0, 1, 1,
0.01634166, 0.4832345, 2.16524, 0, 0, 0, 1, 1,
0.01828219, 1.515654, -0.04601156, 0, 0, 0, 1, 1,
0.01958995, -1.71708, 3.331114, 1, 1, 1, 1, 1,
0.02407084, 0.9154003, 0.3595935, 1, 1, 1, 1, 1,
0.02925061, 1.187691, 0.6799225, 1, 1, 1, 1, 1,
0.03086491, -0.7886789, 2.377294, 1, 1, 1, 1, 1,
0.03115589, -1.076784, 2.569307, 1, 1, 1, 1, 1,
0.03501263, 0.5020143, 0.4020878, 1, 1, 1, 1, 1,
0.03590801, -1.337321, 3.473204, 1, 1, 1, 1, 1,
0.03956703, -1.143898, 3.344813, 1, 1, 1, 1, 1,
0.04645644, 1.097091, -0.292788, 1, 1, 1, 1, 1,
0.0467876, -0.5066057, 1.925738, 1, 1, 1, 1, 1,
0.04899925, 0.07488225, 0.8178717, 1, 1, 1, 1, 1,
0.04966617, -0.8171659, 2.760594, 1, 1, 1, 1, 1,
0.0499659, -1.17386, 3.424934, 1, 1, 1, 1, 1,
0.05016473, 0.08062395, -1.543249, 1, 1, 1, 1, 1,
0.05343334, -1.438105, 2.200564, 1, 1, 1, 1, 1,
0.05639811, 0.5181154, -0.8262506, 0, 0, 1, 1, 1,
0.05829555, -0.6596904, 2.292981, 1, 0, 0, 1, 1,
0.05842036, 0.8210237, -1.992053, 1, 0, 0, 1, 1,
0.06060673, -0.5220965, 4.00829, 1, 0, 0, 1, 1,
0.06062017, -1.202227, 2.621223, 1, 0, 0, 1, 1,
0.06432961, -0.9610056, 3.173516, 1, 0, 0, 1, 1,
0.06509852, -1.87893, 3.232914, 0, 0, 0, 1, 1,
0.06861916, 0.4400438, 0.2614817, 0, 0, 0, 1, 1,
0.07765023, 0.3057335, 0.6274694, 0, 0, 0, 1, 1,
0.07780125, 1.182215, 1.164284, 0, 0, 0, 1, 1,
0.08078052, 0.4105985, 0.6110915, 0, 0, 0, 1, 1,
0.08118858, -1.520565, 4.8568, 0, 0, 0, 1, 1,
0.08252358, 0.8577855, -0.1203043, 0, 0, 0, 1, 1,
0.08486166, -0.6989228, 1.920834, 1, 1, 1, 1, 1,
0.08749007, 0.0427839, 1.333374, 1, 1, 1, 1, 1,
0.08768222, -0.3002982, 2.980317, 1, 1, 1, 1, 1,
0.09223101, 0.1244858, -0.3362057, 1, 1, 1, 1, 1,
0.1001817, 0.9472957, -0.510839, 1, 1, 1, 1, 1,
0.1046805, 1.834518, 1.565068, 1, 1, 1, 1, 1,
0.105877, 0.1624516, 0.163356, 1, 1, 1, 1, 1,
0.1065215, -0.4309543, 1.981125, 1, 1, 1, 1, 1,
0.1083464, 0.2055583, -0.5328995, 1, 1, 1, 1, 1,
0.109293, -0.8222669, 1.735648, 1, 1, 1, 1, 1,
0.1123088, 1.261505, -0.1162499, 1, 1, 1, 1, 1,
0.1136017, -1.760031, 4.016796, 1, 1, 1, 1, 1,
0.1142042, -0.3935469, 1.412567, 1, 1, 1, 1, 1,
0.1142604, -0.3143292, 2.783697, 1, 1, 1, 1, 1,
0.1164406, -0.5878527, 2.409012, 1, 1, 1, 1, 1,
0.1167509, 1.924644, -0.8068136, 0, 0, 1, 1, 1,
0.1191975, 0.3211334, -0.1547534, 1, 0, 0, 1, 1,
0.1210679, -0.05266142, 1.47112, 1, 0, 0, 1, 1,
0.1265764, -1.47878, 4.521655, 1, 0, 0, 1, 1,
0.1334644, 0.1397971, 1.497835, 1, 0, 0, 1, 1,
0.1343721, 0.07301517, 1.791628, 1, 0, 0, 1, 1,
0.1360007, -0.7726597, 3.073923, 0, 0, 0, 1, 1,
0.1362381, -0.4642716, 2.909023, 0, 0, 0, 1, 1,
0.138745, 1.923089, 0.7025834, 0, 0, 0, 1, 1,
0.1393778, -0.08169433, 2.03839, 0, 0, 0, 1, 1,
0.1401592, -0.7084606, 1.857701, 0, 0, 0, 1, 1,
0.1449617, -1.070527, 1.811381, 0, 0, 0, 1, 1,
0.1464737, 0.7798088, -0.3973647, 0, 0, 0, 1, 1,
0.148577, 0.6545665, 0.7047886, 1, 1, 1, 1, 1,
0.1553584, 0.6121958, -0.4132949, 1, 1, 1, 1, 1,
0.1612276, 1.453909, 0.2907255, 1, 1, 1, 1, 1,
0.161731, 0.88213, -0.4789788, 1, 1, 1, 1, 1,
0.1617878, -0.191845, 3.754007, 1, 1, 1, 1, 1,
0.1623944, -2.430103, 3.245708, 1, 1, 1, 1, 1,
0.1625898, 1.70158, 0.3505297, 1, 1, 1, 1, 1,
0.1626265, 0.2701529, 1.336634, 1, 1, 1, 1, 1,
0.163914, 2.306035, 0.07292587, 1, 1, 1, 1, 1,
0.164733, -0.007028932, 2.388305, 1, 1, 1, 1, 1,
0.1655047, -1.078351, 2.344902, 1, 1, 1, 1, 1,
0.1660214, 0.3698052, -0.9654167, 1, 1, 1, 1, 1,
0.1698135, -1.82729, 2.694354, 1, 1, 1, 1, 1,
0.1717782, 1.93879, 0.6660618, 1, 1, 1, 1, 1,
0.1719082, -1.154902, 4.040601, 1, 1, 1, 1, 1,
0.1720143, -0.6150839, 3.083332, 0, 0, 1, 1, 1,
0.1733907, 0.9433421, 0.4112665, 1, 0, 0, 1, 1,
0.1756174, 0.1336625, -0.01693799, 1, 0, 0, 1, 1,
0.1816882, -0.4501953, 3.759226, 1, 0, 0, 1, 1,
0.1820226, -0.3347742, 2.540942, 1, 0, 0, 1, 1,
0.1834081, -0.2045699, 3.35491, 1, 0, 0, 1, 1,
0.1866158, -0.6912676, 1.809304, 0, 0, 0, 1, 1,
0.1879838, 0.2940321, -0.5221945, 0, 0, 0, 1, 1,
0.1882637, 1.112033, -0.1344611, 0, 0, 0, 1, 1,
0.1908191, -1.000471, 3.948941, 0, 0, 0, 1, 1,
0.1912788, 0.2580443, -0.585675, 0, 0, 0, 1, 1,
0.1914509, -1.639701, 3.767883, 0, 0, 0, 1, 1,
0.1921117, 1.5633, 1.577266, 0, 0, 0, 1, 1,
0.1926682, 0.5717865, 0.7782769, 1, 1, 1, 1, 1,
0.193312, 1.689387, -0.8436102, 1, 1, 1, 1, 1,
0.1948629, 1.708857, -0.1181173, 1, 1, 1, 1, 1,
0.1973111, 0.6927418, -0.3250777, 1, 1, 1, 1, 1,
0.2000804, 0.1705352, 0.7930731, 1, 1, 1, 1, 1,
0.2032758, -1.142116, 1.172024, 1, 1, 1, 1, 1,
0.2051234, 0.9373187, -0.4792681, 1, 1, 1, 1, 1,
0.210367, 1.588737, -0.7200828, 1, 1, 1, 1, 1,
0.2125974, -1.00152, 1.319761, 1, 1, 1, 1, 1,
0.2136337, 0.8813513, -1.484416, 1, 1, 1, 1, 1,
0.2141983, -0.5271574, 1.6586, 1, 1, 1, 1, 1,
0.215568, -0.4124624, 2.058795, 1, 1, 1, 1, 1,
0.2196486, 0.1626297, 1.189479, 1, 1, 1, 1, 1,
0.2258399, 0.9588464, 0.2128092, 1, 1, 1, 1, 1,
0.230227, -0.8622546, 1.380926, 1, 1, 1, 1, 1,
0.2311439, -1.661789, 2.727827, 0, 0, 1, 1, 1,
0.2394482, -0.6378645, 2.208634, 1, 0, 0, 1, 1,
0.241648, -1.230649, 3.24839, 1, 0, 0, 1, 1,
0.2447802, 0.2121382, 0.7425698, 1, 0, 0, 1, 1,
0.2480081, 1.123236, 2.213296, 1, 0, 0, 1, 1,
0.250508, -1.575847, 3.230807, 1, 0, 0, 1, 1,
0.2505748, 0.5027351, 1.673926, 0, 0, 0, 1, 1,
0.2510197, 0.005883284, 0.04282776, 0, 0, 0, 1, 1,
0.2520914, 0.05192696, -0.1072839, 0, 0, 0, 1, 1,
0.2529217, 0.2368617, 0.6175288, 0, 0, 0, 1, 1,
0.2542151, 1.464049, -0.5554272, 0, 0, 0, 1, 1,
0.2561795, 0.2132887, 1.096399, 0, 0, 0, 1, 1,
0.2623441, 0.121751, 1.816983, 0, 0, 0, 1, 1,
0.2702326, -0.4894981, 4.093345, 1, 1, 1, 1, 1,
0.2734284, 1.312972, 1.952928, 1, 1, 1, 1, 1,
0.2770077, 1.125975, -1.35107, 1, 1, 1, 1, 1,
0.2784538, -0.3526825, 2.376088, 1, 1, 1, 1, 1,
0.2797845, -0.6381239, 1.213727, 1, 1, 1, 1, 1,
0.2805562, -0.689231, 3.287241, 1, 1, 1, 1, 1,
0.2811396, -0.9330683, 3.541208, 1, 1, 1, 1, 1,
0.2815181, -0.4340812, 3.610847, 1, 1, 1, 1, 1,
0.2841699, -0.5355213, 4.323247, 1, 1, 1, 1, 1,
0.2869009, 2.258853, -0.231499, 1, 1, 1, 1, 1,
0.2910172, 2.164779, 0.7436859, 1, 1, 1, 1, 1,
0.2911681, -0.1828972, 3.045676, 1, 1, 1, 1, 1,
0.2948084, -0.8836275, 3.816159, 1, 1, 1, 1, 1,
0.2958816, 2.365052, 0.5670838, 1, 1, 1, 1, 1,
0.2973742, 0.7031013, -0.6295669, 1, 1, 1, 1, 1,
0.3000776, 0.6388807, 0.7909514, 0, 0, 1, 1, 1,
0.3018531, 0.3668121, -0.8064892, 1, 0, 0, 1, 1,
0.3023728, -0.5199134, 3.131377, 1, 0, 0, 1, 1,
0.3053232, -0.3734059, 2.821285, 1, 0, 0, 1, 1,
0.3064844, -0.01771493, 3.328005, 1, 0, 0, 1, 1,
0.3073711, -0.4514508, 3.330324, 1, 0, 0, 1, 1,
0.3099112, 1.208235, 0.1375276, 0, 0, 0, 1, 1,
0.3115875, -0.7237524, 1.440168, 0, 0, 0, 1, 1,
0.3158276, 0.7773131, 1.426614, 0, 0, 0, 1, 1,
0.3161527, 0.2397616, 1.126819, 0, 0, 0, 1, 1,
0.3181697, -2.332202, 1.104823, 0, 0, 0, 1, 1,
0.3199972, 0.05371945, 1.404212, 0, 0, 0, 1, 1,
0.3203665, -1.135279, 1.646318, 0, 0, 0, 1, 1,
0.3313915, 1.289572, -0.004276858, 1, 1, 1, 1, 1,
0.3323326, 0.1508136, 0.8768463, 1, 1, 1, 1, 1,
0.3325611, -0.9692333, 2.397623, 1, 1, 1, 1, 1,
0.3331034, 0.7238274, 1.416179, 1, 1, 1, 1, 1,
0.3347865, -1.592974, 4.056417, 1, 1, 1, 1, 1,
0.3390063, -0.6973034, 4.142822, 1, 1, 1, 1, 1,
0.3489929, 1.18172, 0.1714643, 1, 1, 1, 1, 1,
0.3490674, -1.229402, 2.344501, 1, 1, 1, 1, 1,
0.3493794, -0.6458195, 1.359775, 1, 1, 1, 1, 1,
0.3505504, -0.895676, 3.150723, 1, 1, 1, 1, 1,
0.3506003, 1.191128, 0.6722788, 1, 1, 1, 1, 1,
0.3507198, 0.7077578, -1.406102, 1, 1, 1, 1, 1,
0.3524005, 0.1880253, 1.486492, 1, 1, 1, 1, 1,
0.3527949, -1.252268, 4.668142, 1, 1, 1, 1, 1,
0.3547049, -1.53012, 2.913772, 1, 1, 1, 1, 1,
0.3549875, -1.140308, 1.922982, 0, 0, 1, 1, 1,
0.3555899, -1.661576, 4.213574, 1, 0, 0, 1, 1,
0.3558437, 0.1844184, 1.726915, 1, 0, 0, 1, 1,
0.3569074, -0.07735576, 0.4218121, 1, 0, 0, 1, 1,
0.3571482, 1.146801, 0.5320676, 1, 0, 0, 1, 1,
0.3653992, -0.964578, 1.315361, 1, 0, 0, 1, 1,
0.3674545, 1.136771, 0.6480721, 0, 0, 0, 1, 1,
0.3716785, -0.2422137, 0.8205244, 0, 0, 0, 1, 1,
0.3720428, 0.3045732, 1.84646, 0, 0, 0, 1, 1,
0.3724445, -0.01774496, 2.973749, 0, 0, 0, 1, 1,
0.3739971, 1.071412, 0.7130302, 0, 0, 0, 1, 1,
0.3772799, -0.476648, 1.809499, 0, 0, 0, 1, 1,
0.3785172, 0.6138629, 0.7765111, 0, 0, 0, 1, 1,
0.3786838, 1.701606, 2.847041, 1, 1, 1, 1, 1,
0.3847745, 0.4417705, 1.846154, 1, 1, 1, 1, 1,
0.387478, -0.8489681, 2.748101, 1, 1, 1, 1, 1,
0.3897112, -0.05064713, 2.258642, 1, 1, 1, 1, 1,
0.3900478, 1.954286, 0.6406205, 1, 1, 1, 1, 1,
0.3903394, 0.5794684, 0.697446, 1, 1, 1, 1, 1,
0.3910156, -0.6388735, 3.029974, 1, 1, 1, 1, 1,
0.3945605, -0.1380702, 2.389434, 1, 1, 1, 1, 1,
0.398028, 1.113779, -0.3067756, 1, 1, 1, 1, 1,
0.3989733, 0.7992493, 0.3584248, 1, 1, 1, 1, 1,
0.39993, 0.3644748, 0.5332749, 1, 1, 1, 1, 1,
0.4026339, 1.60565, 0.8210954, 1, 1, 1, 1, 1,
0.4042211, 0.4494539, -0.7348264, 1, 1, 1, 1, 1,
0.4048516, -1.135393, 2.394429, 1, 1, 1, 1, 1,
0.4062483, 0.7705646, -0.6794894, 1, 1, 1, 1, 1,
0.4065781, 0.5682344, 2.077625, 0, 0, 1, 1, 1,
0.4066092, -1.966465, 2.599296, 1, 0, 0, 1, 1,
0.4192049, 0.474036, -1.38092, 1, 0, 0, 1, 1,
0.4198777, 1.578749, 0.1001247, 1, 0, 0, 1, 1,
0.4214522, 0.252502, 1.232878, 1, 0, 0, 1, 1,
0.4231767, -1.109959, 2.763438, 1, 0, 0, 1, 1,
0.427242, 0.9794942, 0.01394195, 0, 0, 0, 1, 1,
0.4315533, 0.3346268, 0.4755166, 0, 0, 0, 1, 1,
0.4329043, -1.050665, 2.841084, 0, 0, 0, 1, 1,
0.4339667, -0.3345863, 2.089806, 0, 0, 0, 1, 1,
0.4387598, -2.180546, 2.670494, 0, 0, 0, 1, 1,
0.4397514, -1.130105, 2.641416, 0, 0, 0, 1, 1,
0.440713, 0.6991369, -0.52991, 0, 0, 0, 1, 1,
0.4464718, -1.815177, 3.464225, 1, 1, 1, 1, 1,
0.4486926, -0.1602671, 1.088647, 1, 1, 1, 1, 1,
0.4550816, -0.573433, 1.376519, 1, 1, 1, 1, 1,
0.4614741, 1.129441, -1.435871, 1, 1, 1, 1, 1,
0.4640823, 1.136356, 0.08051471, 1, 1, 1, 1, 1,
0.46819, 1.335561, 0.7018012, 1, 1, 1, 1, 1,
0.4690871, 0.2817088, 0.482202, 1, 1, 1, 1, 1,
0.4743424, -0.3751451, 2.137435, 1, 1, 1, 1, 1,
0.4821795, -0.3898019, 1.39875, 1, 1, 1, 1, 1,
0.4835534, -0.8889652, 2.521663, 1, 1, 1, 1, 1,
0.4919425, -0.9736695, 4.09482, 1, 1, 1, 1, 1,
0.4958332, 2.158627, 0.1676116, 1, 1, 1, 1, 1,
0.4961834, 0.6088246, 0.08842532, 1, 1, 1, 1, 1,
0.4969447, -0.6585532, 4.49067, 1, 1, 1, 1, 1,
0.4972534, 1.162085, 1.363956, 1, 1, 1, 1, 1,
0.5067784, -0.9774881, 1.379641, 0, 0, 1, 1, 1,
0.5133125, -0.6913046, 2.478176, 1, 0, 0, 1, 1,
0.5146227, 0.06980661, 0.3361284, 1, 0, 0, 1, 1,
0.5150473, 1.045521, 1.064485, 1, 0, 0, 1, 1,
0.516488, 0.1084742, 0.2278228, 1, 0, 0, 1, 1,
0.5203947, 0.1456521, 2.430385, 1, 0, 0, 1, 1,
0.5225964, 0.6375335, 0.1021601, 0, 0, 0, 1, 1,
0.5238057, 0.6745378, 0.1374492, 0, 0, 0, 1, 1,
0.5293794, 0.1406879, 1.318182, 0, 0, 0, 1, 1,
0.5296994, 0.5318013, 0.05150046, 0, 0, 0, 1, 1,
0.5319822, 0.3662881, 2.648483, 0, 0, 0, 1, 1,
0.5331988, -1.506841, 2.459379, 0, 0, 0, 1, 1,
0.53964, 0.4460491, 0.9135448, 0, 0, 0, 1, 1,
0.5473908, 1.07383, 1.248865, 1, 1, 1, 1, 1,
0.5475031, -0.7136829, 3.116021, 1, 1, 1, 1, 1,
0.5485137, 2.723203, 0.7852837, 1, 1, 1, 1, 1,
0.5491664, -1.740927, 3.312782, 1, 1, 1, 1, 1,
0.5628511, 0.2243784, 0.8723781, 1, 1, 1, 1, 1,
0.5653969, 0.3845666, 0.4643685, 1, 1, 1, 1, 1,
0.5670837, 0.5510331, -0.4745725, 1, 1, 1, 1, 1,
0.5739728, -0.1781802, 2.335073, 1, 1, 1, 1, 1,
0.5760226, -0.653953, 2.132718, 1, 1, 1, 1, 1,
0.5765622, -0.04582132, 0.4468067, 1, 1, 1, 1, 1,
0.5808154, 0.1586211, 0.7507342, 1, 1, 1, 1, 1,
0.5847046, 0.8513286, 2.016161, 1, 1, 1, 1, 1,
0.5916632, -0.8141075, 4.969515, 1, 1, 1, 1, 1,
0.5934169, -0.3080084, 3.119444, 1, 1, 1, 1, 1,
0.6065281, -2.984349, 3.739564, 1, 1, 1, 1, 1,
0.6121135, 0.9029822, 0.3870655, 0, 0, 1, 1, 1,
0.6137667, -0.1609405, 0.9864272, 1, 0, 0, 1, 1,
0.6152622, 0.7886208, 1.242555, 1, 0, 0, 1, 1,
0.6163245, 0.3588508, 1.516199, 1, 0, 0, 1, 1,
0.617022, 2.311461, 0.05713401, 1, 0, 0, 1, 1,
0.6227559, 0.3463548, 1.48214, 1, 0, 0, 1, 1,
0.6259539, -1.443147, 2.927576, 0, 0, 0, 1, 1,
0.6284746, 1.404649, 0.01544159, 0, 0, 0, 1, 1,
0.6310297, 0.4311143, 1.829588, 0, 0, 0, 1, 1,
0.6371028, -0.4146938, 1.090415, 0, 0, 0, 1, 1,
0.6378902, 1.4187, 0.5937503, 0, 0, 0, 1, 1,
0.6478993, 0.6787447, 1.373102, 0, 0, 0, 1, 1,
0.6595756, 0.8413652, 1.412872, 0, 0, 0, 1, 1,
0.6625272, -1.268673, 2.592795, 1, 1, 1, 1, 1,
0.6657184, -0.8247088, 1.532413, 1, 1, 1, 1, 1,
0.6664574, -1.74809, 2.940417, 1, 1, 1, 1, 1,
0.6708304, 0.251764, 0.5935571, 1, 1, 1, 1, 1,
0.6710204, -1.550326, 3.435441, 1, 1, 1, 1, 1,
0.6725515, 1.578811, 1.425501, 1, 1, 1, 1, 1,
0.680104, -1.15438, 1.240213, 1, 1, 1, 1, 1,
0.6822334, 3.467552, -2.264417, 1, 1, 1, 1, 1,
0.6900939, 0.8074883, 2.41652, 1, 1, 1, 1, 1,
0.6924914, 1.813728, -0.1323909, 1, 1, 1, 1, 1,
0.6959491, 2.053611, 1.464967, 1, 1, 1, 1, 1,
0.6977009, -0.6746071, 3.104508, 1, 1, 1, 1, 1,
0.6982132, 0.6255565, 1.451362, 1, 1, 1, 1, 1,
0.7007576, 0.0808114, 0.6858056, 1, 1, 1, 1, 1,
0.7021245, 1.422273, 0.4119151, 1, 1, 1, 1, 1,
0.7049224, -0.6802928, 3.216465, 0, 0, 1, 1, 1,
0.7090927, -1.036562, 2.789814, 1, 0, 0, 1, 1,
0.7128816, -0.3861181, 2.87761, 1, 0, 0, 1, 1,
0.7151454, 1.249876, 1.963573, 1, 0, 0, 1, 1,
0.7200017, -2.367433, 1.445171, 1, 0, 0, 1, 1,
0.7229413, -0.4730177, 2.60573, 1, 0, 0, 1, 1,
0.7248639, -0.05596673, 0.1918693, 0, 0, 0, 1, 1,
0.7288014, -0.06022337, 2.470227, 0, 0, 0, 1, 1,
0.736757, -1.454454, 4.14385, 0, 0, 0, 1, 1,
0.7369059, 0.6228167, 1.53564, 0, 0, 0, 1, 1,
0.7373632, 0.9214229, 1.517897, 0, 0, 0, 1, 1,
0.739139, -0.2513447, 2.467047, 0, 0, 0, 1, 1,
0.7407568, 1.045237, 1.015052, 0, 0, 0, 1, 1,
0.7427104, -0.09941742, 1.980979, 1, 1, 1, 1, 1,
0.7463958, -1.710438, 2.32978, 1, 1, 1, 1, 1,
0.7514592, -0.7769752, 4.385002, 1, 1, 1, 1, 1,
0.7574336, -1.261208, 4.001027, 1, 1, 1, 1, 1,
0.7620963, -2.894166, 1.90617, 1, 1, 1, 1, 1,
0.7740118, 0.1994675, 0.6554429, 1, 1, 1, 1, 1,
0.7775749, 0.04294199, 1.798863, 1, 1, 1, 1, 1,
0.7796927, -0.846347, 1.901357, 1, 1, 1, 1, 1,
0.7820153, 0.8316652, -0.6636164, 1, 1, 1, 1, 1,
0.7864919, 0.02053969, 3.354739, 1, 1, 1, 1, 1,
0.7897084, 0.9391574, 1.724908, 1, 1, 1, 1, 1,
0.7942156, 0.1709745, 0.07128925, 1, 1, 1, 1, 1,
0.7962375, 1.119019, 0.8817915, 1, 1, 1, 1, 1,
0.7972947, -0.4264121, 1.089056, 1, 1, 1, 1, 1,
0.7980465, -0.9511023, 4.007, 1, 1, 1, 1, 1,
0.8001643, -0.6144477, 5.73575, 0, 0, 1, 1, 1,
0.8079472, -0.297438, 4.261035, 1, 0, 0, 1, 1,
0.8146224, -0.4487584, 2.949388, 1, 0, 0, 1, 1,
0.8169979, 0.3102383, 0.5977901, 1, 0, 0, 1, 1,
0.8189226, 1.52434, 0.7654052, 1, 0, 0, 1, 1,
0.8195511, 1.002617, 1.122769, 1, 0, 0, 1, 1,
0.8274517, -0.3829014, 3.61974, 0, 0, 0, 1, 1,
0.8278516, 0.3129606, 2.056074, 0, 0, 0, 1, 1,
0.8348072, 1.295016, 0.2000856, 0, 0, 0, 1, 1,
0.8352597, -2.158509, 3.311183, 0, 0, 0, 1, 1,
0.8355321, -0.8588157, 2.332239, 0, 0, 0, 1, 1,
0.8382124, -1.037078, 1.529213, 0, 0, 0, 1, 1,
0.8394654, 0.2004334, 2.576438, 0, 0, 0, 1, 1,
0.8440989, 0.7425041, 0.7453552, 1, 1, 1, 1, 1,
0.8484374, -1.213917, 1.362826, 1, 1, 1, 1, 1,
0.8487787, -1.285081, 2.59025, 1, 1, 1, 1, 1,
0.8497166, -0.9867446, 3.337868, 1, 1, 1, 1, 1,
0.8590472, -0.2975412, 4.129411, 1, 1, 1, 1, 1,
0.8614559, 0.5235729, 1.414099, 1, 1, 1, 1, 1,
0.8684836, 0.2360764, 0.3328733, 1, 1, 1, 1, 1,
0.8705274, -0.3346182, 0.4771848, 1, 1, 1, 1, 1,
0.8720603, 0.06272089, 1.663313, 1, 1, 1, 1, 1,
0.8739644, -0.7605942, 1.973029, 1, 1, 1, 1, 1,
0.8759692, -2.639908, 3.494554, 1, 1, 1, 1, 1,
0.8765472, -1.247876, 2.518951, 1, 1, 1, 1, 1,
0.879393, -0.6887292, 3.42504, 1, 1, 1, 1, 1,
0.881611, -1.73439, 2.365217, 1, 1, 1, 1, 1,
0.883768, -0.1565209, 2.482525, 1, 1, 1, 1, 1,
0.8874655, 0.5923056, 2.310903, 0, 0, 1, 1, 1,
0.8878856, -0.5175408, 1.846209, 1, 0, 0, 1, 1,
0.8892231, 0.614477, 0.829377, 1, 0, 0, 1, 1,
0.889737, 1.42269, 0.2078161, 1, 0, 0, 1, 1,
0.8947163, -0.9699711, 1.910064, 1, 0, 0, 1, 1,
0.8959259, -0.7230991, 3.615471, 1, 0, 0, 1, 1,
0.9056348, -0.6204116, 2.379169, 0, 0, 0, 1, 1,
0.9085012, -1.463864, 2.094359, 0, 0, 0, 1, 1,
0.9120265, 0.7256345, -0.8495748, 0, 0, 0, 1, 1,
0.9164079, 1.002601, 0.3349634, 0, 0, 0, 1, 1,
0.9168145, 0.0818973, 2.011329, 0, 0, 0, 1, 1,
0.9207286, 0.7391772, -0.110568, 0, 0, 0, 1, 1,
0.924467, -0.1871611, 2.35775, 0, 0, 0, 1, 1,
0.9267636, 0.2531752, 0.228752, 1, 1, 1, 1, 1,
0.9278614, -0.7926255, 2.817849, 1, 1, 1, 1, 1,
0.9354831, -0.6041368, 1.291739, 1, 1, 1, 1, 1,
0.9404195, 0.2716602, -0.6146813, 1, 1, 1, 1, 1,
0.9421825, -0.5051705, 2.766415, 1, 1, 1, 1, 1,
0.9442649, 0.50823, 0.6147644, 1, 1, 1, 1, 1,
0.9476364, -0.7085552, 2.311745, 1, 1, 1, 1, 1,
0.9485405, -1.067872, 1.787101, 1, 1, 1, 1, 1,
0.9525067, -0.4677587, 0.8603821, 1, 1, 1, 1, 1,
0.9560621, -0.7439997, 1.280455, 1, 1, 1, 1, 1,
0.9590237, -0.2685234, 1.78189, 1, 1, 1, 1, 1,
0.9637401, -1.811414, 1.795273, 1, 1, 1, 1, 1,
0.9651114, 0.08274986, 0.6764218, 1, 1, 1, 1, 1,
0.9790361, -0.1830131, 0.7447869, 1, 1, 1, 1, 1,
1.002188, -1.032708, 0.7522294, 1, 1, 1, 1, 1,
1.004037, 0.4738132, -0.1689981, 0, 0, 1, 1, 1,
1.007782, 0.1748227, 0.543547, 1, 0, 0, 1, 1,
1.008437, 0.0870888, -0.6558735, 1, 0, 0, 1, 1,
1.013115, -1.123913, 1.85477, 1, 0, 0, 1, 1,
1.014347, 0.7969816, 3.605725, 1, 0, 0, 1, 1,
1.030112, 0.06573939, -0.3673338, 1, 0, 0, 1, 1,
1.031031, 0.5425926, 0.9266833, 0, 0, 0, 1, 1,
1.035208, 1.224497, 2.052791, 0, 0, 0, 1, 1,
1.04109, -1.692549, 1.703079, 0, 0, 0, 1, 1,
1.042207, -0.2935634, 1.346892, 0, 0, 0, 1, 1,
1.046052, -0.2288923, 3.351522, 0, 0, 0, 1, 1,
1.050954, 0.4266693, 1.327698, 0, 0, 0, 1, 1,
1.052677, 0.7127559, -0.06882381, 0, 0, 0, 1, 1,
1.05426, -0.3998732, 1.586054, 1, 1, 1, 1, 1,
1.059196, -0.7870702, 2.169612, 1, 1, 1, 1, 1,
1.062142, -1.386363, 2.420126, 1, 1, 1, 1, 1,
1.063029, -1.303119, 2.872211, 1, 1, 1, 1, 1,
1.073815, 1.039124, 0.5106522, 1, 1, 1, 1, 1,
1.077189, -0.5785469, 2.280629, 1, 1, 1, 1, 1,
1.079035, -1.334988, 2.998353, 1, 1, 1, 1, 1,
1.096308, -1.162474, 2.070093, 1, 1, 1, 1, 1,
1.100285, -1.912918, 3.920872, 1, 1, 1, 1, 1,
1.1007, -0.1272355, 1.103964, 1, 1, 1, 1, 1,
1.101856, 0.6075874, 1.597838, 1, 1, 1, 1, 1,
1.125728, 1.008983, 1.242089, 1, 1, 1, 1, 1,
1.127927, 0.5731447, -0.06701948, 1, 1, 1, 1, 1,
1.132164, -0.1583796, 1.049105, 1, 1, 1, 1, 1,
1.132518, 0.8382621, 2.030841, 1, 1, 1, 1, 1,
1.133327, -1.38024, 1.973061, 0, 0, 1, 1, 1,
1.138639, -0.305319, 0.5570618, 1, 0, 0, 1, 1,
1.142393, 0.6478503, -1.153238, 1, 0, 0, 1, 1,
1.157911, -0.4199489, 0.7586282, 1, 0, 0, 1, 1,
1.166822, 0.793003, 0.8111685, 1, 0, 0, 1, 1,
1.18439, -0.0491623, 1.670449, 1, 0, 0, 1, 1,
1.185743, 1.916881, 1.251757, 0, 0, 0, 1, 1,
1.186488, -0.3539407, 2.836357, 0, 0, 0, 1, 1,
1.199144, -1.100056, 3.494519, 0, 0, 0, 1, 1,
1.204102, 1.106667, 0.8563853, 0, 0, 0, 1, 1,
1.213391, 0.2476203, 2.053184, 0, 0, 0, 1, 1,
1.217632, -0.7006277, 3.104854, 0, 0, 0, 1, 1,
1.22001, -1.558668, 2.440369, 0, 0, 0, 1, 1,
1.223612, -0.6407226, 1.607611, 1, 1, 1, 1, 1,
1.225176, 0.8139937, 0.9803728, 1, 1, 1, 1, 1,
1.226658, 1.496781, -1.622514, 1, 1, 1, 1, 1,
1.236551, 1.657399, 0.7696902, 1, 1, 1, 1, 1,
1.240729, 0.3823782, 1.848532, 1, 1, 1, 1, 1,
1.242064, 0.07585651, 0.6701161, 1, 1, 1, 1, 1,
1.247191, 1.216834, 0.6511637, 1, 1, 1, 1, 1,
1.258531, -0.8846499, 3.69724, 1, 1, 1, 1, 1,
1.262008, 0.626435, -1.246677, 1, 1, 1, 1, 1,
1.262354, 0.9655263, 0.3039333, 1, 1, 1, 1, 1,
1.269187, 0.9167414, 0.8439007, 1, 1, 1, 1, 1,
1.273037, 0.009431696, 1.816777, 1, 1, 1, 1, 1,
1.276672, -1.168756, 0.8275608, 1, 1, 1, 1, 1,
1.27967, 0.0126839, 1.468598, 1, 1, 1, 1, 1,
1.295614, -0.1823962, 2.16651, 1, 1, 1, 1, 1,
1.296572, 1.545281, -0.2726363, 0, 0, 1, 1, 1,
1.299673, 0.5817074, 0.4522225, 1, 0, 0, 1, 1,
1.301548, -1.699145, 1.874691, 1, 0, 0, 1, 1,
1.302688, -0.9944406, 1.721034, 1, 0, 0, 1, 1,
1.317222, 0.5296397, 0.4620211, 1, 0, 0, 1, 1,
1.327397, -1.296312, 2.894675, 1, 0, 0, 1, 1,
1.336741, 1.852412, 3.045324, 0, 0, 0, 1, 1,
1.34473, -1.369944, 1.362718, 0, 0, 0, 1, 1,
1.348205, -0.4627131, 0.9098087, 0, 0, 0, 1, 1,
1.354562, -0.02494983, 0.819573, 0, 0, 0, 1, 1,
1.359241, -0.2224097, 2.223993, 0, 0, 0, 1, 1,
1.3681, 0.5409419, 1.321182, 0, 0, 0, 1, 1,
1.37206, -1.104022, 3.437265, 0, 0, 0, 1, 1,
1.376606, -0.5000942, 1.898929, 1, 1, 1, 1, 1,
1.378288, -1.135018, 2.615049, 1, 1, 1, 1, 1,
1.378475, -0.732832, 2.460657, 1, 1, 1, 1, 1,
1.379213, -0.1896228, 0.771989, 1, 1, 1, 1, 1,
1.380546, -0.09333551, -0.6689016, 1, 1, 1, 1, 1,
1.387144, -0.02944178, 1.893852, 1, 1, 1, 1, 1,
1.390308, 1.118619, 1.158463, 1, 1, 1, 1, 1,
1.3908, 0.07496668, 1.110312, 1, 1, 1, 1, 1,
1.39358, 0.818059, 1.825263, 1, 1, 1, 1, 1,
1.395914, -0.6322891, 2.64068, 1, 1, 1, 1, 1,
1.396386, -1.415907, 0.7151419, 1, 1, 1, 1, 1,
1.397696, -0.07288434, 1.411051, 1, 1, 1, 1, 1,
1.407362, 0.742608, 2.017244, 1, 1, 1, 1, 1,
1.423801, 0.9214, 1.601238, 1, 1, 1, 1, 1,
1.428327, 1.018647, 1.291668, 1, 1, 1, 1, 1,
1.429853, -1.48507, 3.255258, 0, 0, 1, 1, 1,
1.435855, 0.320085, -0.6638796, 1, 0, 0, 1, 1,
1.446283, 0.8806742, 0.007212636, 1, 0, 0, 1, 1,
1.449063, -1.757545, 1.544993, 1, 0, 0, 1, 1,
1.451643, 0.7315465, 0.8071485, 1, 0, 0, 1, 1,
1.453249, 1.494745, -0.1501438, 1, 0, 0, 1, 1,
1.460546, 0.6202494, 1.812193, 0, 0, 0, 1, 1,
1.465395, -0.03731532, -0.2452491, 0, 0, 0, 1, 1,
1.478818, 0.3150872, 3.483199, 0, 0, 0, 1, 1,
1.489595, 0.3214806, 1.035276, 0, 0, 0, 1, 1,
1.491112, 0.1417695, 0.956604, 0, 0, 0, 1, 1,
1.49616, 1.224938, 2.443794, 0, 0, 0, 1, 1,
1.498738, 1.466313, 0.8672047, 0, 0, 0, 1, 1,
1.507203, 0.08887448, 0.2687671, 1, 1, 1, 1, 1,
1.514012, -0.06333094, 3.532794, 1, 1, 1, 1, 1,
1.517533, -0.5345111, 1.376127, 1, 1, 1, 1, 1,
1.528454, -0.1911277, 0.6567726, 1, 1, 1, 1, 1,
1.529399, -0.2860693, 2.469286, 1, 1, 1, 1, 1,
1.535473, 1.242925, 0.7706282, 1, 1, 1, 1, 1,
1.545382, -0.2169098, 1.679566, 1, 1, 1, 1, 1,
1.548079, 1.125502, -0.2787659, 1, 1, 1, 1, 1,
1.567824, 1.047912, 1.526315, 1, 1, 1, 1, 1,
1.570963, -0.2316403, 1.190633, 1, 1, 1, 1, 1,
1.572071, -0.5537157, 3.320935, 1, 1, 1, 1, 1,
1.577336, -1.380743, 2.264441, 1, 1, 1, 1, 1,
1.578528, -0.2131475, 1.110447, 1, 1, 1, 1, 1,
1.578771, 1.290201, 0.9849298, 1, 1, 1, 1, 1,
1.579242, -0.641308, 2.130625, 1, 1, 1, 1, 1,
1.58468, -0.3990886, 2.766992, 0, 0, 1, 1, 1,
1.589444, 0.1486709, 3.475409, 1, 0, 0, 1, 1,
1.595972, 0.5044017, 1.720716, 1, 0, 0, 1, 1,
1.623403, 0.1744328, 3.947765, 1, 0, 0, 1, 1,
1.626033, 0.17546, 1.891356, 1, 0, 0, 1, 1,
1.630385, 1.305311, 1.40238, 1, 0, 0, 1, 1,
1.634144, -0.1669696, -0.09672727, 0, 0, 0, 1, 1,
1.638271, -0.4896106, 3.035482, 0, 0, 0, 1, 1,
1.652172, 1.583908, 0.5225081, 0, 0, 0, 1, 1,
1.654661, 1.128068, 0.6516958, 0, 0, 0, 1, 1,
1.69734, -0.7453089, 1.549529, 0, 0, 0, 1, 1,
1.71026, -1.236787, 2.135254, 0, 0, 0, 1, 1,
1.718728, 0.5754714, 1.459718, 0, 0, 0, 1, 1,
1.744524, 3.316687, 0.5951775, 1, 1, 1, 1, 1,
1.751544, -1.329821, 2.843264, 1, 1, 1, 1, 1,
1.786173, 0.2208114, 0.4969785, 1, 1, 1, 1, 1,
1.796158, 0.5740134, 2.044101, 1, 1, 1, 1, 1,
1.8081, 0.4946693, 0.1259702, 1, 1, 1, 1, 1,
1.810404, 0.2128689, 2.626653, 1, 1, 1, 1, 1,
1.870295, 0.4082625, 2.632091, 1, 1, 1, 1, 1,
1.889202, -0.1893963, 2.554132, 1, 1, 1, 1, 1,
1.898294, -0.6439451, 2.326116, 1, 1, 1, 1, 1,
1.931511, -0.06017486, 1.593249, 1, 1, 1, 1, 1,
1.942228, -0.5011221, 0.6669544, 1, 1, 1, 1, 1,
1.950736, 0.2468594, 0.151415, 1, 1, 1, 1, 1,
1.989141, 1.051761, 2.77934, 1, 1, 1, 1, 1,
2.000698, 0.2926916, 0.329795, 1, 1, 1, 1, 1,
2.05748, -1.702836, 1.3949, 1, 1, 1, 1, 1,
2.137642, -1.008265, 3.802599, 0, 0, 1, 1, 1,
2.152537, -0.2799918, 2.557002, 1, 0, 0, 1, 1,
2.153943, -1.023094, 2.241684, 1, 0, 0, 1, 1,
2.15582, -0.1825441, 1.660214, 1, 0, 0, 1, 1,
2.205654, 0.09380715, 2.764704, 1, 0, 0, 1, 1,
2.255292, -0.3209401, 1.219965, 1, 0, 0, 1, 1,
2.319676, -0.7157873, 1.112753, 0, 0, 0, 1, 1,
2.342566, -0.7894567, 1.811281, 0, 0, 0, 1, 1,
2.433872, -0.8806995, 2.516848, 0, 0, 0, 1, 1,
2.459529, 0.8942197, -1.543761, 0, 0, 0, 1, 1,
2.488294, -0.6436797, 3.960684, 0, 0, 0, 1, 1,
2.498431, 1.317719, 0.9078156, 0, 0, 0, 1, 1,
2.512884, 1.777305, 1.874399, 0, 0, 0, 1, 1,
2.517233, -0.7184951, 1.049122, 1, 1, 1, 1, 1,
2.598791, 0.4647385, 2.308135, 1, 1, 1, 1, 1,
2.62837, 1.100923, 1.1571, 1, 1, 1, 1, 1,
2.669519, 1.06447, 1.205928, 1, 1, 1, 1, 1,
2.69057, 0.4676353, 2.10726, 1, 1, 1, 1, 1,
2.713891, 1.089176, 0.5399879, 1, 1, 1, 1, 1,
2.896312, -0.1049154, 0.8139611, 1, 1, 1, 1, 1
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
var radius = 9.558769;
var distance = 33.57477;
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
mvMatrix.translate( -0.04692256, -0.2416017, -0.190829 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.57477);
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
