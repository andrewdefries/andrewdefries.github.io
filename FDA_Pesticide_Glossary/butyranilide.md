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
-3.458331, -0.370812, -2.045367, 1, 0, 0, 1,
-2.88429, -1.927288, -2.190004, 1, 0.007843138, 0, 1,
-2.685856, 0.8378618, -1.412509, 1, 0.01176471, 0, 1,
-2.647955, -0.14986, -2.617275, 1, 0.01960784, 0, 1,
-2.54988, -1.133397, -3.064734, 1, 0.02352941, 0, 1,
-2.478174, -0.8332077, -2.417629, 1, 0.03137255, 0, 1,
-2.47512, -0.2148941, -2.321183, 1, 0.03529412, 0, 1,
-2.39091, 1.000519, 0.3172075, 1, 0.04313726, 0, 1,
-2.380632, 1.412065, -0.7696362, 1, 0.04705882, 0, 1,
-2.348281, -0.1976056, -2.577385, 1, 0.05490196, 0, 1,
-2.301198, 0.7433394, -1.76589, 1, 0.05882353, 0, 1,
-2.282844, -1.081199, -3.086341, 1, 0.06666667, 0, 1,
-2.278332, 0.8779138, -0.2694255, 1, 0.07058824, 0, 1,
-2.059128, 0.2754433, -1.809371, 1, 0.07843138, 0, 1,
-2.034561, -0.5995777, -1.596799, 1, 0.08235294, 0, 1,
-1.977589, 0.6954408, -0.2620389, 1, 0.09019608, 0, 1,
-1.974152, -0.1990535, -1.010067, 1, 0.09411765, 0, 1,
-1.960954, 0.7529061, -0.1085549, 1, 0.1019608, 0, 1,
-1.950115, 1.792677, 0.02975627, 1, 0.1098039, 0, 1,
-1.948291, 0.6698809, -0.3958181, 1, 0.1137255, 0, 1,
-1.882999, -1.379259, -1.507558, 1, 0.1215686, 0, 1,
-1.875007, 1.375744, -0.9347135, 1, 0.1254902, 0, 1,
-1.854609, -1.07115, -0.473954, 1, 0.1333333, 0, 1,
-1.841392, 1.218175, -1.232135, 1, 0.1372549, 0, 1,
-1.800457, -1.810906, -1.915023, 1, 0.145098, 0, 1,
-1.792253, -0.7386665, -3.515374, 1, 0.1490196, 0, 1,
-1.785916, 0.9525985, -0.5684658, 1, 0.1568628, 0, 1,
-1.784739, 0.2675381, -1.077312, 1, 0.1607843, 0, 1,
-1.782817, 1.301834, -1.506503, 1, 0.1686275, 0, 1,
-1.780884, 1.354444, -0.9246027, 1, 0.172549, 0, 1,
-1.779157, 1.69049, 0.02761339, 1, 0.1803922, 0, 1,
-1.768507, 0.248698, 0.03543147, 1, 0.1843137, 0, 1,
-1.766661, -0.2822795, -2.020167, 1, 0.1921569, 0, 1,
-1.764506, 0.2181367, -0.5226344, 1, 0.1960784, 0, 1,
-1.762544, 0.3971851, -0.9161479, 1, 0.2039216, 0, 1,
-1.75796, -0.533531, -2.436779, 1, 0.2117647, 0, 1,
-1.749577, 0.03753941, -1.751873, 1, 0.2156863, 0, 1,
-1.748117, -0.3751788, -1.444777, 1, 0.2235294, 0, 1,
-1.693071, -0.0805159, -1.875778, 1, 0.227451, 0, 1,
-1.683231, -0.5903991, -1.319425, 1, 0.2352941, 0, 1,
-1.682994, -0.4347033, -1.863956, 1, 0.2392157, 0, 1,
-1.682449, -1.28642, -4.740035, 1, 0.2470588, 0, 1,
-1.681858, -1.417578, -2.749716, 1, 0.2509804, 0, 1,
-1.67589, 1.58839, -0.4923604, 1, 0.2588235, 0, 1,
-1.675145, 1.018959, -3.022948, 1, 0.2627451, 0, 1,
-1.65551, 1.921002, -0.01925473, 1, 0.2705882, 0, 1,
-1.598189, -1.323306, -2.567306, 1, 0.2745098, 0, 1,
-1.572004, -2.16646, -4.032128, 1, 0.282353, 0, 1,
-1.547716, -0.4546073, -3.009593, 1, 0.2862745, 0, 1,
-1.528465, 1.190828, 0.7265006, 1, 0.2941177, 0, 1,
-1.522705, 0.4928082, -1.172908, 1, 0.3019608, 0, 1,
-1.51323, -1.450751, -4.15061, 1, 0.3058824, 0, 1,
-1.507833, 1.720172, 0.3056218, 1, 0.3137255, 0, 1,
-1.507516, 1.311931, -1.918917, 1, 0.3176471, 0, 1,
-1.490306, 0.2009443, -1.255191, 1, 0.3254902, 0, 1,
-1.489125, -0.1803575, -1.410971, 1, 0.3294118, 0, 1,
-1.477359, 0.8493094, -2.956848, 1, 0.3372549, 0, 1,
-1.477345, -1.50949, -0.5371662, 1, 0.3411765, 0, 1,
-1.46838, -0.1272567, -1.608522, 1, 0.3490196, 0, 1,
-1.462325, 0.6800688, -1.843037, 1, 0.3529412, 0, 1,
-1.460419, -1.088566, -2.633132, 1, 0.3607843, 0, 1,
-1.448213, 0.3935968, -1.594676, 1, 0.3647059, 0, 1,
-1.441978, 0.8899775, -0.5591988, 1, 0.372549, 0, 1,
-1.437549, 2.012704, 1.079013, 1, 0.3764706, 0, 1,
-1.419991, -0.8176332, -1.868481, 1, 0.3843137, 0, 1,
-1.41845, 0.4732281, -0.2351073, 1, 0.3882353, 0, 1,
-1.417353, -0.8795527, -1.855794, 1, 0.3960784, 0, 1,
-1.414184, 1.681984, -1.0899, 1, 0.4039216, 0, 1,
-1.407737, 1.946904, -2.391025, 1, 0.4078431, 0, 1,
-1.386025, 0.2591417, -2.271008, 1, 0.4156863, 0, 1,
-1.385853, -0.5888942, -2.839513, 1, 0.4196078, 0, 1,
-1.382891, 0.5738615, -1.085132, 1, 0.427451, 0, 1,
-1.379887, 1.27719, -1.59779, 1, 0.4313726, 0, 1,
-1.37655, 1.416909, -1.532572, 1, 0.4392157, 0, 1,
-1.375031, 0.5348684, -1.87957, 1, 0.4431373, 0, 1,
-1.370984, -1.153534, -2.815798, 1, 0.4509804, 0, 1,
-1.367582, -0.4020782, -2.314535, 1, 0.454902, 0, 1,
-1.35941, 0.5835791, -1.406728, 1, 0.4627451, 0, 1,
-1.35336, 0.4806315, -1.476702, 1, 0.4666667, 0, 1,
-1.352612, -0.7708185, -1.61446, 1, 0.4745098, 0, 1,
-1.352469, 2.854801, -1.375278, 1, 0.4784314, 0, 1,
-1.351144, 0.7982414, -0.6711798, 1, 0.4862745, 0, 1,
-1.333145, -0.8496897, -3.853237, 1, 0.4901961, 0, 1,
-1.332955, -0.7697862, -1.430492, 1, 0.4980392, 0, 1,
-1.329566, -0.2379545, -1.118735, 1, 0.5058824, 0, 1,
-1.294493, -1.034871, -3.20464, 1, 0.509804, 0, 1,
-1.281628, -0.3611293, -2.747418, 1, 0.5176471, 0, 1,
-1.272558, 0.0991838, 0.2030597, 1, 0.5215687, 0, 1,
-1.264177, -0.09514229, -0.08725946, 1, 0.5294118, 0, 1,
-1.256507, 0.09214349, 0.3465146, 1, 0.5333334, 0, 1,
-1.25192, -0.182636, -1.375291, 1, 0.5411765, 0, 1,
-1.248007, -0.9076241, -2.928192, 1, 0.5450981, 0, 1,
-1.245305, -0.8023331, -3.385483, 1, 0.5529412, 0, 1,
-1.240396, -1.657605, -2.928659, 1, 0.5568628, 0, 1,
-1.236043, 2.269117, -2.202195, 1, 0.5647059, 0, 1,
-1.226011, -0.2287968, -1.689419, 1, 0.5686275, 0, 1,
-1.219157, -2.378883, -2.614829, 1, 0.5764706, 0, 1,
-1.218822, -0.1071507, -1.334899, 1, 0.5803922, 0, 1,
-1.195295, 1.942383, -0.7896186, 1, 0.5882353, 0, 1,
-1.159721, -0.07626174, -1.672393, 1, 0.5921569, 0, 1,
-1.156166, -1.477865, -3.912661, 1, 0.6, 0, 1,
-1.15183, 0.6293022, -1.440317, 1, 0.6078432, 0, 1,
-1.151688, 0.1468351, -2.430961, 1, 0.6117647, 0, 1,
-1.143864, 1.062398, -1.804684, 1, 0.6196079, 0, 1,
-1.141321, -0.0370822, -2.692951, 1, 0.6235294, 0, 1,
-1.137784, -0.7005106, -1.079562, 1, 0.6313726, 0, 1,
-1.137245, 0.1998835, 0.2754582, 1, 0.6352941, 0, 1,
-1.134599, 2.530925, -0.5955806, 1, 0.6431373, 0, 1,
-1.128702, 0.2444194, -3.493638, 1, 0.6470588, 0, 1,
-1.128625, 0.3859384, -0.07657267, 1, 0.654902, 0, 1,
-1.127663, 0.1887814, -0.2641053, 1, 0.6588235, 0, 1,
-1.124414, -0.4117225, -1.422696, 1, 0.6666667, 0, 1,
-1.120946, 0.6313685, -1.246505, 1, 0.6705883, 0, 1,
-1.119839, -0.03843801, -2.264107, 1, 0.6784314, 0, 1,
-1.118041, 0.4982706, -1.948529, 1, 0.682353, 0, 1,
-1.115228, -0.2109873, -1.913196, 1, 0.6901961, 0, 1,
-1.102432, 0.6339273, -0.121296, 1, 0.6941177, 0, 1,
-1.101766, -0.6490425, -3.028097, 1, 0.7019608, 0, 1,
-1.098403, 1.23371, -0.4037005, 1, 0.7098039, 0, 1,
-1.097538, 0.307904, -2.03705, 1, 0.7137255, 0, 1,
-1.096133, 1.244968, -1.290493, 1, 0.7215686, 0, 1,
-1.094745, 0.1485496, -2.423541, 1, 0.7254902, 0, 1,
-1.093188, -0.1962403, -1.827549, 1, 0.7333333, 0, 1,
-1.088258, -1.103157, -1.969968, 1, 0.7372549, 0, 1,
-1.084962, 1.526991, -0.9773779, 1, 0.7450981, 0, 1,
-1.082522, -0.1486327, -1.353526, 1, 0.7490196, 0, 1,
-1.080455, 0.5710872, 0.1625091, 1, 0.7568628, 0, 1,
-1.07844, 0.01481915, -2.349604, 1, 0.7607843, 0, 1,
-1.06876, -0.2367724, -2.097636, 1, 0.7686275, 0, 1,
-1.063264, -0.900409, 0.1190755, 1, 0.772549, 0, 1,
-1.056441, 0.7698605, -1.605359, 1, 0.7803922, 0, 1,
-1.050525, -1.201836, -2.151009, 1, 0.7843137, 0, 1,
-1.041364, 1.066996, -0.6863433, 1, 0.7921569, 0, 1,
-1.03679, -0.846848, -2.961371, 1, 0.7960784, 0, 1,
-1.031261, 1.928759, -0.3106182, 1, 0.8039216, 0, 1,
-1.030473, 0.5010621, -3.075684, 1, 0.8117647, 0, 1,
-1.027284, -0.7239507, -2.561368, 1, 0.8156863, 0, 1,
-1.026185, -0.5982736, -1.144827, 1, 0.8235294, 0, 1,
-1.017948, -0.03911808, -1.680944, 1, 0.827451, 0, 1,
-1.017486, 0.1553365, -1.478101, 1, 0.8352941, 0, 1,
-1.004744, -0.3773123, -2.098533, 1, 0.8392157, 0, 1,
-1.004059, 0.4653382, -0.9235592, 1, 0.8470588, 0, 1,
-1.002548, -0.4096224, -2.359443, 1, 0.8509804, 0, 1,
-0.9957558, 1.644896, 0.2667224, 1, 0.8588235, 0, 1,
-0.9935735, 0.6667647, -2.312824, 1, 0.8627451, 0, 1,
-0.9902865, -0.9018717, -1.61011, 1, 0.8705882, 0, 1,
-0.9875119, -1.00373, -3.829588, 1, 0.8745098, 0, 1,
-0.9812503, -0.1761255, -0.6137611, 1, 0.8823529, 0, 1,
-0.9755426, 0.117925, -2.821069, 1, 0.8862745, 0, 1,
-0.9732684, -0.09793817, -2.250012, 1, 0.8941177, 0, 1,
-0.96972, -0.8903683, -2.0856, 1, 0.8980392, 0, 1,
-0.9668197, 0.5169595, 0.3992231, 1, 0.9058824, 0, 1,
-0.9633155, 0.5401635, -0.3416458, 1, 0.9137255, 0, 1,
-0.9559894, 1.129208, -0.2321801, 1, 0.9176471, 0, 1,
-0.9530942, -1.177698, -1.536346, 1, 0.9254902, 0, 1,
-0.9489776, 0.45532, -2.556522, 1, 0.9294118, 0, 1,
-0.948707, -0.9859189, -2.582913, 1, 0.9372549, 0, 1,
-0.9441976, -1.99568, -1.726126, 1, 0.9411765, 0, 1,
-0.9327449, 1.957192, -1.550581, 1, 0.9490196, 0, 1,
-0.9313931, 0.2289365, 1.45686, 1, 0.9529412, 0, 1,
-0.9251748, 0.4098643, -0.09034664, 1, 0.9607843, 0, 1,
-0.9206519, 0.141378, -0.8839543, 1, 0.9647059, 0, 1,
-0.9197976, 0.9429712, -0.5683156, 1, 0.972549, 0, 1,
-0.9184619, -0.4277571, -2.327145, 1, 0.9764706, 0, 1,
-0.890124, -0.3248547, -2.406423, 1, 0.9843137, 0, 1,
-0.8860453, -0.1692414, -2.35713, 1, 0.9882353, 0, 1,
-0.8849578, 0.1331984, -2.013145, 1, 0.9960784, 0, 1,
-0.8845788, 0.1807491, -2.250004, 0.9960784, 1, 0, 1,
-0.882659, -0.2664966, -1.216165, 0.9921569, 1, 0, 1,
-0.8812581, -0.7222444, -1.511746, 0.9843137, 1, 0, 1,
-0.8784763, -0.3751796, -0.7364724, 0.9803922, 1, 0, 1,
-0.8741261, -0.2174675, -2.785209, 0.972549, 1, 0, 1,
-0.8700669, 0.5623554, 0.3097845, 0.9686275, 1, 0, 1,
-0.8695951, 0.9563444, 1.478254, 0.9607843, 1, 0, 1,
-0.8665174, 0.4773648, -1.639517, 0.9568627, 1, 0, 1,
-0.8608847, 0.3417656, -3.411604, 0.9490196, 1, 0, 1,
-0.8566688, -0.2590167, -2.128514, 0.945098, 1, 0, 1,
-0.8533421, -1.081108, -3.89335, 0.9372549, 1, 0, 1,
-0.8504287, -1.685937, -4.135973, 0.9333333, 1, 0, 1,
-0.8497896, -0.5191666, -2.22647, 0.9254902, 1, 0, 1,
-0.8436095, -0.5196596, -2.021959, 0.9215686, 1, 0, 1,
-0.8386913, -0.1949242, -2.485574, 0.9137255, 1, 0, 1,
-0.8378516, 1.076723, -0.00331892, 0.9098039, 1, 0, 1,
-0.8350039, -0.01961387, -1.611146, 0.9019608, 1, 0, 1,
-0.8321479, 1.030489, -1.909301, 0.8941177, 1, 0, 1,
-0.8319292, 0.7215314, 0.8833066, 0.8901961, 1, 0, 1,
-0.8314984, 0.7182686, -3.048637, 0.8823529, 1, 0, 1,
-0.8291965, 0.2090407, -2.568051, 0.8784314, 1, 0, 1,
-0.8231973, -1.147004, -2.517637, 0.8705882, 1, 0, 1,
-0.8230718, -0.2819814, -2.630532, 0.8666667, 1, 0, 1,
-0.8181484, -0.3425294, -1.698808, 0.8588235, 1, 0, 1,
-0.8144937, 1.347747, -0.1777774, 0.854902, 1, 0, 1,
-0.8091388, 0.02532786, -1.233144, 0.8470588, 1, 0, 1,
-0.8085684, -0.3292068, -0.1583645, 0.8431373, 1, 0, 1,
-0.8076062, -0.4194867, -1.448655, 0.8352941, 1, 0, 1,
-0.7994889, -0.7844446, -2.967404, 0.8313726, 1, 0, 1,
-0.7905135, -0.3818148, -0.6621857, 0.8235294, 1, 0, 1,
-0.7886693, 0.0557321, -2.877391, 0.8196079, 1, 0, 1,
-0.7885373, -0.2043857, -1.427119, 0.8117647, 1, 0, 1,
-0.7872642, 0.3141417, -3.219261, 0.8078431, 1, 0, 1,
-0.781272, -0.01529995, -2.47412, 0.8, 1, 0, 1,
-0.7733039, 0.3845419, 0.4343129, 0.7921569, 1, 0, 1,
-0.7629487, -1.103262, -0.4534089, 0.7882353, 1, 0, 1,
-0.7628021, -0.3956464, -3.07178, 0.7803922, 1, 0, 1,
-0.7593893, -0.7663469, -2.978911, 0.7764706, 1, 0, 1,
-0.7512941, 0.02915079, -2.684717, 0.7686275, 1, 0, 1,
-0.7475839, -0.5940455, -2.237129, 0.7647059, 1, 0, 1,
-0.7471983, -0.6800877, -1.329594, 0.7568628, 1, 0, 1,
-0.7424905, -0.09442224, -2.518964, 0.7529412, 1, 0, 1,
-0.7391106, 0.176145, -0.04465421, 0.7450981, 1, 0, 1,
-0.7375764, 0.4274647, 0.01981257, 0.7411765, 1, 0, 1,
-0.7359049, -1.090153, -3.438787, 0.7333333, 1, 0, 1,
-0.7339712, 0.9897583, -2.065172, 0.7294118, 1, 0, 1,
-0.7324867, -0.4708021, -3.177866, 0.7215686, 1, 0, 1,
-0.7279094, 1.507998, -0.5933759, 0.7176471, 1, 0, 1,
-0.7266916, -0.1025203, -1.49963, 0.7098039, 1, 0, 1,
-0.7264577, 0.1525151, -1.417031, 0.7058824, 1, 0, 1,
-0.724616, 1.075929, -0.7026623, 0.6980392, 1, 0, 1,
-0.7200077, -0.6932474, -2.881237, 0.6901961, 1, 0, 1,
-0.7196424, 0.114344, -2.003403, 0.6862745, 1, 0, 1,
-0.714937, 0.375561, -0.3899768, 0.6784314, 1, 0, 1,
-0.7139381, -2.05674, -2.538872, 0.6745098, 1, 0, 1,
-0.7066148, 0.9186948, -0.5310972, 0.6666667, 1, 0, 1,
-0.7060905, -1.058762, -3.121801, 0.6627451, 1, 0, 1,
-0.7028313, 0.4207172, -2.555672, 0.654902, 1, 0, 1,
-0.6999331, -0.3757938, -1.538137, 0.6509804, 1, 0, 1,
-0.6991604, 1.448756, 0.1636515, 0.6431373, 1, 0, 1,
-0.6849776, 1.563567, 0.03345189, 0.6392157, 1, 0, 1,
-0.6792747, -1.836906, -1.109921, 0.6313726, 1, 0, 1,
-0.6734856, -0.1431766, -2.966572, 0.627451, 1, 0, 1,
-0.6728517, 0.9904297, 0.8042099, 0.6196079, 1, 0, 1,
-0.6703254, 0.429208, -1.566149, 0.6156863, 1, 0, 1,
-0.6672575, 0.05196199, -3.669444, 0.6078432, 1, 0, 1,
-0.6631967, -0.2240866, -1.152076, 0.6039216, 1, 0, 1,
-0.6598653, 1.775652, -0.3121044, 0.5960785, 1, 0, 1,
-0.6535728, -1.778816, -2.746535, 0.5882353, 1, 0, 1,
-0.6532747, 0.7459562, 1.923743, 0.5843138, 1, 0, 1,
-0.6514714, 0.7411534, 0.7267706, 0.5764706, 1, 0, 1,
-0.6511773, -0.2507894, -0.8275321, 0.572549, 1, 0, 1,
-0.650423, 0.372693, -1.174288, 0.5647059, 1, 0, 1,
-0.6436674, 1.765786, -2.189785, 0.5607843, 1, 0, 1,
-0.6422435, -0.2332912, -1.522129, 0.5529412, 1, 0, 1,
-0.6352296, 0.4680822, -1.325204, 0.5490196, 1, 0, 1,
-0.6347089, 0.367007, -1.960398, 0.5411765, 1, 0, 1,
-0.6303457, 0.1638926, -2.037581, 0.5372549, 1, 0, 1,
-0.6293975, -0.2738954, -2.65617, 0.5294118, 1, 0, 1,
-0.6272869, 1.414958, -0.2784235, 0.5254902, 1, 0, 1,
-0.6263317, -2.164058, -3.262446, 0.5176471, 1, 0, 1,
-0.6226237, -0.3647127, -2.204561, 0.5137255, 1, 0, 1,
-0.6197304, -1.431023, -1.991069, 0.5058824, 1, 0, 1,
-0.6195365, -0.6602256, -1.617622, 0.5019608, 1, 0, 1,
-0.6162923, 0.0913775, -0.8911796, 0.4941176, 1, 0, 1,
-0.6117776, -0.08871992, -0.9454741, 0.4862745, 1, 0, 1,
-0.6091291, -0.1220178, -2.199297, 0.4823529, 1, 0, 1,
-0.6072226, -0.001503194, -1.757697, 0.4745098, 1, 0, 1,
-0.6057618, 0.1733989, -0.1255849, 0.4705882, 1, 0, 1,
-0.5993922, -0.1072948, -1.568742, 0.4627451, 1, 0, 1,
-0.5930182, 0.02729351, -2.920913, 0.4588235, 1, 0, 1,
-0.5871661, -1.35541, -3.133527, 0.4509804, 1, 0, 1,
-0.5800614, -0.9626263, -1.974683, 0.4470588, 1, 0, 1,
-0.5784211, 1.811716, -0.07375459, 0.4392157, 1, 0, 1,
-0.5775707, -0.7406853, -2.918339, 0.4352941, 1, 0, 1,
-0.573433, -1.949131, -3.786945, 0.427451, 1, 0, 1,
-0.5688804, -0.9090208, -2.907682, 0.4235294, 1, 0, 1,
-0.5688226, -0.7468055, -2.60866, 0.4156863, 1, 0, 1,
-0.5665997, 1.172722, -0.857597, 0.4117647, 1, 0, 1,
-0.5661156, 0.01370422, -0.5688658, 0.4039216, 1, 0, 1,
-0.5655146, -0.8065578, -2.708574, 0.3960784, 1, 0, 1,
-0.5653933, 1.734287, -0.2953965, 0.3921569, 1, 0, 1,
-0.55579, 0.5821415, 0.8608417, 0.3843137, 1, 0, 1,
-0.5535254, 0.9323186, -1.258332, 0.3803922, 1, 0, 1,
-0.5502442, -0.3552728, -1.452461, 0.372549, 1, 0, 1,
-0.5486706, 0.1468728, -0.7685098, 0.3686275, 1, 0, 1,
-0.5486335, 1.302393, -0.8263782, 0.3607843, 1, 0, 1,
-0.5441138, 0.1783769, -1.162185, 0.3568628, 1, 0, 1,
-0.5414711, -1.166193, -3.14462, 0.3490196, 1, 0, 1,
-0.5345286, -0.1915686, -1.804958, 0.345098, 1, 0, 1,
-0.5344401, -0.6139485, -2.855438, 0.3372549, 1, 0, 1,
-0.5326987, 1.01927, -1.24832, 0.3333333, 1, 0, 1,
-0.5212169, -0.06144374, -2.231767, 0.3254902, 1, 0, 1,
-0.5167264, 0.9137291, -0.9338191, 0.3215686, 1, 0, 1,
-0.5104377, -0.3372889, -2.190217, 0.3137255, 1, 0, 1,
-0.5094912, 0.3699241, -1.214382, 0.3098039, 1, 0, 1,
-0.509073, -0.2266934, -2.27162, 0.3019608, 1, 0, 1,
-0.5067357, 0.9310115, -0.7579313, 0.2941177, 1, 0, 1,
-0.5061917, 0.5209156, -0.4800278, 0.2901961, 1, 0, 1,
-0.5005409, 0.9468863, 0.9137809, 0.282353, 1, 0, 1,
-0.5000378, 1.425538, 0.1171155, 0.2784314, 1, 0, 1,
-0.498732, 0.954511, 0.06898729, 0.2705882, 1, 0, 1,
-0.4962127, 0.04247762, -3.084231, 0.2666667, 1, 0, 1,
-0.4954643, 1.134708, 0.1958769, 0.2588235, 1, 0, 1,
-0.4885948, 0.8493323, -1.080446, 0.254902, 1, 0, 1,
-0.4853809, 0.2715821, 0.2907781, 0.2470588, 1, 0, 1,
-0.4837731, -0.3900749, -2.217646, 0.2431373, 1, 0, 1,
-0.4817905, -0.3165357, -3.119225, 0.2352941, 1, 0, 1,
-0.479413, 0.05442676, -1.55395, 0.2313726, 1, 0, 1,
-0.4725511, -0.9777999, -3.846851, 0.2235294, 1, 0, 1,
-0.4704674, -1.076518, -2.798584, 0.2196078, 1, 0, 1,
-0.4669174, -1.436554, -2.580295, 0.2117647, 1, 0, 1,
-0.4663821, 0.8328897, -1.138739, 0.2078431, 1, 0, 1,
-0.4662124, 0.7687262, -0.1192543, 0.2, 1, 0, 1,
-0.4661078, -0.1855936, -2.374006, 0.1921569, 1, 0, 1,
-0.4652484, 0.953602, -0.2436707, 0.1882353, 1, 0, 1,
-0.4633721, 0.4346104, -0.7076388, 0.1803922, 1, 0, 1,
-0.4627769, -0.2907472, -3.670263, 0.1764706, 1, 0, 1,
-0.4605048, 1.501592, -0.5964514, 0.1686275, 1, 0, 1,
-0.4561118, 0.02146579, -0.3272459, 0.1647059, 1, 0, 1,
-0.4502127, 0.1025363, -1.374108, 0.1568628, 1, 0, 1,
-0.4457505, 1.683152, 0.2313894, 0.1529412, 1, 0, 1,
-0.4408729, 1.540072, 0.6601513, 0.145098, 1, 0, 1,
-0.4326665, 0.2812138, -1.948146, 0.1411765, 1, 0, 1,
-0.4303242, 1.154502, -0.3481948, 0.1333333, 1, 0, 1,
-0.4277446, -0.1421525, -2.195873, 0.1294118, 1, 0, 1,
-0.4270088, -0.9074155, -2.201514, 0.1215686, 1, 0, 1,
-0.4265007, 0.5027506, -0.7703869, 0.1176471, 1, 0, 1,
-0.4235379, 0.9337105, 0.8458738, 0.1098039, 1, 0, 1,
-0.4119372, 1.535502, -0.2123261, 0.1058824, 1, 0, 1,
-0.4112906, 0.6036219, -0.8353574, 0.09803922, 1, 0, 1,
-0.4111004, -0.7827862, -1.502644, 0.09019608, 1, 0, 1,
-0.4059061, 1.401679, -0.4837896, 0.08627451, 1, 0, 1,
-0.4035563, -0.3903463, -2.942566, 0.07843138, 1, 0, 1,
-0.3995904, -0.3809438, 0.7860958, 0.07450981, 1, 0, 1,
-0.3937182, -0.05590219, -2.592792, 0.06666667, 1, 0, 1,
-0.3919188, 0.7430465, -0.8862373, 0.0627451, 1, 0, 1,
-0.3914502, -0.4515572, -2.280493, 0.05490196, 1, 0, 1,
-0.3851577, 0.5024242, -3.234562, 0.05098039, 1, 0, 1,
-0.384897, 0.4575028, -0.9559637, 0.04313726, 1, 0, 1,
-0.3789347, -0.4150947, -2.625926, 0.03921569, 1, 0, 1,
-0.3716392, 0.6104521, 1.546628, 0.03137255, 1, 0, 1,
-0.3713706, -0.7035077, -2.694285, 0.02745098, 1, 0, 1,
-0.3638756, -0.2095419, -1.470346, 0.01960784, 1, 0, 1,
-0.3635998, -0.5557673, -1.765894, 0.01568628, 1, 0, 1,
-0.3613511, 1.015191, 0.3377725, 0.007843138, 1, 0, 1,
-0.3603312, 1.917227, -2.347875, 0.003921569, 1, 0, 1,
-0.3601944, -0.06202094, -2.517073, 0, 1, 0.003921569, 1,
-0.356718, 1.753772, -1.353543, 0, 1, 0.01176471, 1,
-0.3546089, 0.4564157, -2.869076, 0, 1, 0.01568628, 1,
-0.3518504, -0.8563222, -3.357433, 0, 1, 0.02352941, 1,
-0.3510815, -0.7072588, -3.559752, 0, 1, 0.02745098, 1,
-0.3484068, 0.7480343, -0.6786726, 0, 1, 0.03529412, 1,
-0.347395, 1.512072, 0.8599283, 0, 1, 0.03921569, 1,
-0.3454106, 1.228165, -0.2982157, 0, 1, 0.04705882, 1,
-0.3435134, -0.5308986, -2.914611, 0, 1, 0.05098039, 1,
-0.3410684, -0.6035138, -3.040613, 0, 1, 0.05882353, 1,
-0.3399502, -0.7335146, -2.54337, 0, 1, 0.0627451, 1,
-0.3389606, -0.3698754, -0.05783902, 0, 1, 0.07058824, 1,
-0.3367534, -0.6458527, -2.122484, 0, 1, 0.07450981, 1,
-0.3358347, -0.2645678, -0.8061646, 0, 1, 0.08235294, 1,
-0.3333881, -1.974637, -2.15072, 0, 1, 0.08627451, 1,
-0.3308498, 0.8128988, 1.629239, 0, 1, 0.09411765, 1,
-0.3281195, -0.1204202, -2.434014, 0, 1, 0.1019608, 1,
-0.3180861, 0.3849277, 0.4471715, 0, 1, 0.1058824, 1,
-0.3173602, -0.8248923, -2.244981, 0, 1, 0.1137255, 1,
-0.3125012, 1.049432, 1.605226, 0, 1, 0.1176471, 1,
-0.311557, 1.239676, 0.1278744, 0, 1, 0.1254902, 1,
-0.3087495, 0.4851421, 1.274948, 0, 1, 0.1294118, 1,
-0.3060996, -2.467694, -3.506847, 0, 1, 0.1372549, 1,
-0.3056068, 1.546885, 0.7299354, 0, 1, 0.1411765, 1,
-0.3044839, 0.0457685, -1.54498, 0, 1, 0.1490196, 1,
-0.3028962, -0.05824153, -0.9922258, 0, 1, 0.1529412, 1,
-0.3028913, 0.9652976, -0.3185404, 0, 1, 0.1607843, 1,
-0.2954798, -0.2679917, -2.077933, 0, 1, 0.1647059, 1,
-0.2934492, 1.539171, 0.6758907, 0, 1, 0.172549, 1,
-0.289024, 0.09571288, -1.659716, 0, 1, 0.1764706, 1,
-0.2837006, 1.310748, -0.2689608, 0, 1, 0.1843137, 1,
-0.2823799, 0.5774081, -2.221784, 0, 1, 0.1882353, 1,
-0.2793758, -1.28471, -3.625619, 0, 1, 0.1960784, 1,
-0.2791966, -0.001699457, -1.213123, 0, 1, 0.2039216, 1,
-0.2781705, -0.5396084, -1.846097, 0, 1, 0.2078431, 1,
-0.2759999, 0.2974734, -1.282291, 0, 1, 0.2156863, 1,
-0.2758909, -1.731022, -2.877578, 0, 1, 0.2196078, 1,
-0.2749799, -0.732474, -2.249776, 0, 1, 0.227451, 1,
-0.2712614, 1.022864, 0.459507, 0, 1, 0.2313726, 1,
-0.2670815, -1.165622, -4.488273, 0, 1, 0.2392157, 1,
-0.2617292, 0.9599305, 0.09694616, 0, 1, 0.2431373, 1,
-0.2610221, 1.003321, -1.820778, 0, 1, 0.2509804, 1,
-0.2546455, -1.188151, -2.117478, 0, 1, 0.254902, 1,
-0.2531268, -0.7745728, -1.09762, 0, 1, 0.2627451, 1,
-0.2528185, -0.7199031, -2.567244, 0, 1, 0.2666667, 1,
-0.2519844, -0.8847443, -3.187766, 0, 1, 0.2745098, 1,
-0.2511595, -0.4263117, -3.902872, 0, 1, 0.2784314, 1,
-0.2454386, -0.6716146, -1.806317, 0, 1, 0.2862745, 1,
-0.2449892, -1.0299, -1.802196, 0, 1, 0.2901961, 1,
-0.2433683, -2.565855, -2.193687, 0, 1, 0.2980392, 1,
-0.2389719, 0.499268, -0.546571, 0, 1, 0.3058824, 1,
-0.2362147, 0.07093298, -3.981639, 0, 1, 0.3098039, 1,
-0.2265214, -0.9566242, -3.089616, 0, 1, 0.3176471, 1,
-0.2263991, 0.05877166, -0.9464058, 0, 1, 0.3215686, 1,
-0.2250791, -2.026749, -1.228009, 0, 1, 0.3294118, 1,
-0.2233799, -1.625299, -4.524027, 0, 1, 0.3333333, 1,
-0.2204571, -0.410771, -4.178312, 0, 1, 0.3411765, 1,
-0.2185591, -0.9002135, -2.045775, 0, 1, 0.345098, 1,
-0.2094765, -0.7914466, -4.77329, 0, 1, 0.3529412, 1,
-0.2045238, 1.850991, 0.6681417, 0, 1, 0.3568628, 1,
-0.2031302, 1.578118, -0.1148993, 0, 1, 0.3647059, 1,
-0.1977563, 1.026316, -1.02621, 0, 1, 0.3686275, 1,
-0.1956077, 0.6926962, 1.176707, 0, 1, 0.3764706, 1,
-0.1929556, -0.746371, 0.04450801, 0, 1, 0.3803922, 1,
-0.1921935, 0.06018661, -2.234525, 0, 1, 0.3882353, 1,
-0.1907417, -0.7886542, -3.576457, 0, 1, 0.3921569, 1,
-0.1885097, -0.5739452, -3.415556, 0, 1, 0.4, 1,
-0.1844593, 0.04308803, -2.070195, 0, 1, 0.4078431, 1,
-0.1823065, 0.3988895, 1.235486, 0, 1, 0.4117647, 1,
-0.1765309, -0.2779949, -3.030164, 0, 1, 0.4196078, 1,
-0.1738118, 1.136685, -1.336, 0, 1, 0.4235294, 1,
-0.1687174, -1.067026, -1.826983, 0, 1, 0.4313726, 1,
-0.1685647, -0.2418467, -2.312062, 0, 1, 0.4352941, 1,
-0.1671098, 1.382917, 0.1672851, 0, 1, 0.4431373, 1,
-0.1668505, -0.5540351, -3.396427, 0, 1, 0.4470588, 1,
-0.1606021, -1.666615, -4.437184, 0, 1, 0.454902, 1,
-0.1580061, -1.784508, -3.715331, 0, 1, 0.4588235, 1,
-0.1564145, -0.4256628, -2.101317, 0, 1, 0.4666667, 1,
-0.1557687, -0.2902419, -4.367136, 0, 1, 0.4705882, 1,
-0.1553021, 0.3700608, 0.5663792, 0, 1, 0.4784314, 1,
-0.152376, -0.06657659, 0.5380598, 0, 1, 0.4823529, 1,
-0.1497604, 0.3172984, -0.4378099, 0, 1, 0.4901961, 1,
-0.1442334, 0.08311206, -1.620062, 0, 1, 0.4941176, 1,
-0.1433748, 1.726848, 0.8331792, 0, 1, 0.5019608, 1,
-0.1417529, -0.9465359, -2.498054, 0, 1, 0.509804, 1,
-0.1339757, -0.2127594, -3.108104, 0, 1, 0.5137255, 1,
-0.1334893, 0.43145, 0.6420977, 0, 1, 0.5215687, 1,
-0.1325912, 0.1521055, 0.3087886, 0, 1, 0.5254902, 1,
-0.1261258, 0.5323283, -0.9456574, 0, 1, 0.5333334, 1,
-0.1257043, -0.8180267, -4.233619, 0, 1, 0.5372549, 1,
-0.1229149, 0.2459585, 0.3796115, 0, 1, 0.5450981, 1,
-0.1222393, 0.2566299, -0.1959682, 0, 1, 0.5490196, 1,
-0.1209087, 1.615332, -1.037446, 0, 1, 0.5568628, 1,
-0.1200098, 0.07422712, -1.619951, 0, 1, 0.5607843, 1,
-0.1183383, -0.6846326, -4.210832, 0, 1, 0.5686275, 1,
-0.1175145, -0.03060533, -0.7414809, 0, 1, 0.572549, 1,
-0.1122812, -0.1911703, -2.573995, 0, 1, 0.5803922, 1,
-0.1097, -0.5822104, -3.534772, 0, 1, 0.5843138, 1,
-0.107237, -0.07877279, -3.688685, 0, 1, 0.5921569, 1,
-0.1060413, -0.7857856, -2.857309, 0, 1, 0.5960785, 1,
-0.1056631, -0.4912453, -2.287667, 0, 1, 0.6039216, 1,
-0.1043072, 0.6228932, 0.1418494, 0, 1, 0.6117647, 1,
-0.1035669, 0.788066, -1.020454, 0, 1, 0.6156863, 1,
-0.1017229, -0.1315347, -2.080952, 0, 1, 0.6235294, 1,
-0.1013488, 1.003365, 0.2953366, 0, 1, 0.627451, 1,
-0.09800281, 0.4798345, -2.32794, 0, 1, 0.6352941, 1,
-0.09190807, -1.098529, -3.178951, 0, 1, 0.6392157, 1,
-0.07889875, 1.011334, 0.9324251, 0, 1, 0.6470588, 1,
-0.07791983, 0.5181587, 2.007683, 0, 1, 0.6509804, 1,
-0.07716492, 0.6454411, 1.008591, 0, 1, 0.6588235, 1,
-0.07149252, -0.2139819, -1.422844, 0, 1, 0.6627451, 1,
-0.06814101, 0.8788793, -0.5646172, 0, 1, 0.6705883, 1,
-0.06394503, 0.4545362, 0.7995132, 0, 1, 0.6745098, 1,
-0.06247927, 1.294987, 0.451427, 0, 1, 0.682353, 1,
-0.06232594, -1.074448, -4.84927, 0, 1, 0.6862745, 1,
-0.06055359, -0.8461174, -2.771053, 0, 1, 0.6941177, 1,
-0.0598802, -0.60317, -2.413544, 0, 1, 0.7019608, 1,
-0.05748736, 2.492625, -0.9506855, 0, 1, 0.7058824, 1,
-0.05658712, 0.2787639, 0.0994667, 0, 1, 0.7137255, 1,
-0.05644056, -2.005279, -2.710352, 0, 1, 0.7176471, 1,
-0.05639814, 1.390531, 0.00321346, 0, 1, 0.7254902, 1,
-0.05489677, -0.04470569, -2.984698, 0, 1, 0.7294118, 1,
-0.05313654, -0.580497, -3.504654, 0, 1, 0.7372549, 1,
-0.04975878, -0.9087899, -4.882479, 0, 1, 0.7411765, 1,
-0.03716388, -1.262071, -2.239116, 0, 1, 0.7490196, 1,
-0.03136563, -0.6661584, -4.404661, 0, 1, 0.7529412, 1,
-0.0294475, 0.5358962, -2.279663, 0, 1, 0.7607843, 1,
-0.02927827, -0.9775177, -2.683766, 0, 1, 0.7647059, 1,
-0.02915607, -0.05806847, -3.456161, 0, 1, 0.772549, 1,
-0.02872507, 0.1706802, -0.08223705, 0, 1, 0.7764706, 1,
-0.02839467, 1.557726, 0.7543133, 0, 1, 0.7843137, 1,
-0.02296099, -0.003066387, -2.759317, 0, 1, 0.7882353, 1,
-0.0173959, 0.1518483, -0.1378016, 0, 1, 0.7960784, 1,
-0.01690642, 0.2051819, -1.780765, 0, 1, 0.8039216, 1,
-0.01661426, -0.05782854, -1.750994, 0, 1, 0.8078431, 1,
-0.01648419, -1.316849, -1.270327, 0, 1, 0.8156863, 1,
-0.01366209, 2.080277, 0.8410463, 0, 1, 0.8196079, 1,
-0.008162045, 0.4487036, -0.5376476, 0, 1, 0.827451, 1,
-0.006259119, -0.1511325, -3.13535, 0, 1, 0.8313726, 1,
-0.005862643, -0.4189972, -2.680974, 0, 1, 0.8392157, 1,
-0.003798577, -0.8531764, -3.709201, 0, 1, 0.8431373, 1,
0.0003465984, 0.1217288, -0.9569327, 0, 1, 0.8509804, 1,
0.001908534, -2.170172, 2.273777, 0, 1, 0.854902, 1,
0.006122595, -0.1078998, 4.399837, 0, 1, 0.8627451, 1,
0.007004656, -1.680389, 3.557381, 0, 1, 0.8666667, 1,
0.007640413, 2.180028, 0.6227403, 0, 1, 0.8745098, 1,
0.0122427, 0.4789814, -1.973113, 0, 1, 0.8784314, 1,
0.01367217, -1.045699, 2.496239, 0, 1, 0.8862745, 1,
0.01647826, 3.726373, 1.818645, 0, 1, 0.8901961, 1,
0.01760056, 1.39888, -0.5940377, 0, 1, 0.8980392, 1,
0.02122309, -0.6094617, 3.639924, 0, 1, 0.9058824, 1,
0.02453243, 1.492592, 0.3281043, 0, 1, 0.9098039, 1,
0.02675801, 1.472274, -1.543964, 0, 1, 0.9176471, 1,
0.02766879, 2.210518, -0.002926106, 0, 1, 0.9215686, 1,
0.02926758, -1.321499, 1.981878, 0, 1, 0.9294118, 1,
0.03048864, -0.3033518, 3.980973, 0, 1, 0.9333333, 1,
0.03403974, -1.720793, 1.798669, 0, 1, 0.9411765, 1,
0.03891449, -1.586225, 3.377931, 0, 1, 0.945098, 1,
0.03979478, -0.5085021, 1.263755, 0, 1, 0.9529412, 1,
0.0412027, -0.200081, 2.263038, 0, 1, 0.9568627, 1,
0.04431519, -1.321992, 2.665923, 0, 1, 0.9647059, 1,
0.04847857, 1.429052, -0.8079923, 0, 1, 0.9686275, 1,
0.05004359, 0.6164552, 0.4378436, 0, 1, 0.9764706, 1,
0.05380346, 0.7157215, 1.662133, 0, 1, 0.9803922, 1,
0.05858447, 0.039072, 1.726047, 0, 1, 0.9882353, 1,
0.06298576, 1.184178, 0.3031308, 0, 1, 0.9921569, 1,
0.06384107, -0.7220349, -0.3135805, 0, 1, 1, 1,
0.06760737, 1.753193, 1.359457, 0, 0.9921569, 1, 1,
0.07127556, -0.6873937, 1.80058, 0, 0.9882353, 1, 1,
0.07413758, 0.2378896, 0.6410527, 0, 0.9803922, 1, 1,
0.07920586, 1.512955, -0.2195046, 0, 0.9764706, 1, 1,
0.08253156, -0.6098325, 2.852274, 0, 0.9686275, 1, 1,
0.08534393, 0.2678002, 0.8391885, 0, 0.9647059, 1, 1,
0.08659866, -2.504643, 1.264219, 0, 0.9568627, 1, 1,
0.08678106, 0.3930942, 1.012055, 0, 0.9529412, 1, 1,
0.0898952, -0.1275681, 4.504576, 0, 0.945098, 1, 1,
0.09103323, -1.144803, 1.674454, 0, 0.9411765, 1, 1,
0.09159186, 1.454772, 1.280931, 0, 0.9333333, 1, 1,
0.09802561, -0.6308945, 2.027915, 0, 0.9294118, 1, 1,
0.09856711, -0.4889051, 1.415492, 0, 0.9215686, 1, 1,
0.09954215, -0.04364692, 2.494565, 0, 0.9176471, 1, 1,
0.1000533, -0.265217, 3.593449, 0, 0.9098039, 1, 1,
0.1009631, -1.261274, 2.924875, 0, 0.9058824, 1, 1,
0.1023397, 2.280874, -0.9831757, 0, 0.8980392, 1, 1,
0.1048881, 1.885924, -0.09179791, 0, 0.8901961, 1, 1,
0.1071636, 2.706712, -1.140946, 0, 0.8862745, 1, 1,
0.1072221, -0.09251518, 2.747608, 0, 0.8784314, 1, 1,
0.1072834, -1.368746, 4.547434, 0, 0.8745098, 1, 1,
0.1075506, -0.6629966, 2.84818, 0, 0.8666667, 1, 1,
0.1095558, -0.5055338, 2.739677, 0, 0.8627451, 1, 1,
0.1118153, -1.682551, 3.793814, 0, 0.854902, 1, 1,
0.1126286, 0.254063, 0.9436797, 0, 0.8509804, 1, 1,
0.1169446, -0.5366788, 2.092735, 0, 0.8431373, 1, 1,
0.1173626, 0.5587716, 1.381097, 0, 0.8392157, 1, 1,
0.1179974, -0.3395126, 1.894015, 0, 0.8313726, 1, 1,
0.1298372, 0.503657, 0.2005775, 0, 0.827451, 1, 1,
0.1327886, -1.349486, 5.156984, 0, 0.8196079, 1, 1,
0.1335493, -1.461296, 4.18703, 0, 0.8156863, 1, 1,
0.1362171, -1.422254, 2.78594, 0, 0.8078431, 1, 1,
0.1401194, -1.570525, 4.192226, 0, 0.8039216, 1, 1,
0.1434586, 1.409046, 0.5256784, 0, 0.7960784, 1, 1,
0.1444732, 0.5661339, 0.389273, 0, 0.7882353, 1, 1,
0.1453757, -0.1530819, 3.032039, 0, 0.7843137, 1, 1,
0.1454123, 0.2858028, 0.1824513, 0, 0.7764706, 1, 1,
0.1458845, 1.788954, 0.4602059, 0, 0.772549, 1, 1,
0.1461307, 0.6601856, 2.257745, 0, 0.7647059, 1, 1,
0.1474207, -0.2731158, 2.648527, 0, 0.7607843, 1, 1,
0.1481968, 0.8292928, -0.6470939, 0, 0.7529412, 1, 1,
0.1495917, -0.07705723, 3.3363, 0, 0.7490196, 1, 1,
0.1495925, 0.04913894, 0.04648865, 0, 0.7411765, 1, 1,
0.1578903, -0.7870871, 3.681204, 0, 0.7372549, 1, 1,
0.1583959, -0.133167, 1.578035, 0, 0.7294118, 1, 1,
0.1636456, -1.11793, 1.144755, 0, 0.7254902, 1, 1,
0.167635, -0.8462378, 3.159139, 0, 0.7176471, 1, 1,
0.1697035, -0.6045792, 4.293767, 0, 0.7137255, 1, 1,
0.1730087, 0.4270478, 1.182181, 0, 0.7058824, 1, 1,
0.1756733, 0.9778227, -0.05328437, 0, 0.6980392, 1, 1,
0.1777544, -0.2608459, 2.778731, 0, 0.6941177, 1, 1,
0.1779298, -0.875958, 2.425381, 0, 0.6862745, 1, 1,
0.1786438, 1.043871, -0.7612315, 0, 0.682353, 1, 1,
0.1814922, 0.3024344, -0.2169248, 0, 0.6745098, 1, 1,
0.1823316, 0.8361564, -0.3963232, 0, 0.6705883, 1, 1,
0.2004557, 0.3603586, 0.803779, 0, 0.6627451, 1, 1,
0.204631, -0.2629912, 1.465524, 0, 0.6588235, 1, 1,
0.2048784, -1.457969, 4.103303, 0, 0.6509804, 1, 1,
0.2052392, 0.6201649, -0.6591424, 0, 0.6470588, 1, 1,
0.2062415, -2.360233, 1.353309, 0, 0.6392157, 1, 1,
0.2077883, 0.1876619, 1.233202, 0, 0.6352941, 1, 1,
0.2080717, 1.780472, -0.7213897, 0, 0.627451, 1, 1,
0.2086427, 0.4114219, -1.447559, 0, 0.6235294, 1, 1,
0.21048, -0.4491174, 3.099477, 0, 0.6156863, 1, 1,
0.2121369, 0.7211092, 0.7921516, 0, 0.6117647, 1, 1,
0.2162013, 0.552185, 0.9050464, 0, 0.6039216, 1, 1,
0.2234577, 0.9649689, 2.237786, 0, 0.5960785, 1, 1,
0.225169, -1.491408, 2.746467, 0, 0.5921569, 1, 1,
0.2260028, -0.6216309, 2.460682, 0, 0.5843138, 1, 1,
0.2263402, -0.4567084, 1.064951, 0, 0.5803922, 1, 1,
0.2271341, -0.5746942, 3.565878, 0, 0.572549, 1, 1,
0.2285788, -0.109296, 0.6553193, 0, 0.5686275, 1, 1,
0.2296768, -0.7660534, 3.705373, 0, 0.5607843, 1, 1,
0.2297157, 0.8804857, 1.46471, 0, 0.5568628, 1, 1,
0.2332159, 1.093958, -0.9162816, 0, 0.5490196, 1, 1,
0.2370245, -0.6895046, 3.448319, 0, 0.5450981, 1, 1,
0.2371854, 0.2902789, 0.8246629, 0, 0.5372549, 1, 1,
0.2403778, -0.02650726, 2.017594, 0, 0.5333334, 1, 1,
0.2420834, 0.6748947, 1.068738, 0, 0.5254902, 1, 1,
0.2421794, 0.4022402, 1.543224, 0, 0.5215687, 1, 1,
0.2470522, 0.3999591, -0.2772557, 0, 0.5137255, 1, 1,
0.2551719, 1.503976, -0.5151049, 0, 0.509804, 1, 1,
0.2592151, -0.4502906, 4.205297, 0, 0.5019608, 1, 1,
0.2681123, 0.828196, 0.4446447, 0, 0.4941176, 1, 1,
0.2749435, -0.2243382, 3.211756, 0, 0.4901961, 1, 1,
0.2749683, -1.157864, 3.300776, 0, 0.4823529, 1, 1,
0.2756344, 2.019926, 1.758063, 0, 0.4784314, 1, 1,
0.2770114, 0.03157768, 1.040826, 0, 0.4705882, 1, 1,
0.2825631, -0.5060596, 0.7656946, 0, 0.4666667, 1, 1,
0.2830972, -1.376822, 3.246545, 0, 0.4588235, 1, 1,
0.2834964, 1.143223, 0.1874988, 0, 0.454902, 1, 1,
0.2836927, -0.2290004, 2.32819, 0, 0.4470588, 1, 1,
0.2870269, 0.4350362, 0.4841093, 0, 0.4431373, 1, 1,
0.289097, -0.8141077, 3.264957, 0, 0.4352941, 1, 1,
0.2981678, 0.2098364, 0.009461491, 0, 0.4313726, 1, 1,
0.2987807, -0.9153486, 4.44098, 0, 0.4235294, 1, 1,
0.3104194, -0.410427, 2.190057, 0, 0.4196078, 1, 1,
0.3136894, 0.5811018, -0.09007808, 0, 0.4117647, 1, 1,
0.3138584, 1.600479, 0.8678969, 0, 0.4078431, 1, 1,
0.3143441, 0.4678918, 1.519648, 0, 0.4, 1, 1,
0.3152552, 0.06418505, 3.599743, 0, 0.3921569, 1, 1,
0.3177898, -0.2271471, 1.209389, 0, 0.3882353, 1, 1,
0.3184333, -1.02282, 2.158138, 0, 0.3803922, 1, 1,
0.3185782, -0.8735068, 4.12436, 0, 0.3764706, 1, 1,
0.3213103, 1.322747, 0.8028384, 0, 0.3686275, 1, 1,
0.3224131, 0.01255288, 0.9467365, 0, 0.3647059, 1, 1,
0.3230678, -1.739141, 4.794296, 0, 0.3568628, 1, 1,
0.3242991, 2.425502, -0.4427305, 0, 0.3529412, 1, 1,
0.3247268, 0.06256472, 2.309925, 0, 0.345098, 1, 1,
0.325971, -0.5440239, 3.009239, 0, 0.3411765, 1, 1,
0.3269973, -0.1234598, 1.783152, 0, 0.3333333, 1, 1,
0.3278596, 0.1615026, 0.4887958, 0, 0.3294118, 1, 1,
0.3336498, -1.991736, 3.046744, 0, 0.3215686, 1, 1,
0.3346996, 1.189535, 2.124521, 0, 0.3176471, 1, 1,
0.3373, 0.4522097, 1.002234, 0, 0.3098039, 1, 1,
0.3397636, 0.006707722, 0.5413082, 0, 0.3058824, 1, 1,
0.3409584, -0.4298093, 0.7958614, 0, 0.2980392, 1, 1,
0.3483582, 0.68457, -0.7416454, 0, 0.2901961, 1, 1,
0.3485815, -0.4751287, 2.606832, 0, 0.2862745, 1, 1,
0.3500585, -1.547331, 1.339672, 0, 0.2784314, 1, 1,
0.3503631, -0.6474574, 2.096174, 0, 0.2745098, 1, 1,
0.3504317, 1.192458, 1.118378, 0, 0.2666667, 1, 1,
0.3506973, -0.2168875, 0.6033494, 0, 0.2627451, 1, 1,
0.351163, 0.2487795, -0.9308925, 0, 0.254902, 1, 1,
0.3540982, -0.8757412, 1.96982, 0, 0.2509804, 1, 1,
0.3575663, 1.450892, -0.9988443, 0, 0.2431373, 1, 1,
0.3646992, -1.363884, 3.096738, 0, 0.2392157, 1, 1,
0.3664737, -0.1228409, 4.016246, 0, 0.2313726, 1, 1,
0.3669671, 1.008974, 2.104226, 0, 0.227451, 1, 1,
0.3787958, 0.8120403, 0.6830267, 0, 0.2196078, 1, 1,
0.3798419, -0.7077103, 2.235305, 0, 0.2156863, 1, 1,
0.3803379, 2.162513, 0.7874325, 0, 0.2078431, 1, 1,
0.3857983, 1.781092, 1.194472, 0, 0.2039216, 1, 1,
0.3871183, -0.709353, 2.812619, 0, 0.1960784, 1, 1,
0.3873516, 1.098383, -0.1509213, 0, 0.1882353, 1, 1,
0.3907528, 0.6452679, 1.104419, 0, 0.1843137, 1, 1,
0.3916347, -1.134398, 3.118444, 0, 0.1764706, 1, 1,
0.3952582, -0.3106222, 2.424839, 0, 0.172549, 1, 1,
0.395265, -0.5219521, 3.184914, 0, 0.1647059, 1, 1,
0.3978337, 0.9598852, -1.90849, 0, 0.1607843, 1, 1,
0.4045608, 0.1740863, 2.147635, 0, 0.1529412, 1, 1,
0.407144, -0.1400435, 2.264243, 0, 0.1490196, 1, 1,
0.4140936, 1.676026, 1.711593, 0, 0.1411765, 1, 1,
0.4142749, 0.5297248, 1.546056, 0, 0.1372549, 1, 1,
0.4153298, 1.133772, 0.6395984, 0, 0.1294118, 1, 1,
0.4155857, -1.103199, 1.87353, 0, 0.1254902, 1, 1,
0.4184147, -0.367099, 3.637609, 0, 0.1176471, 1, 1,
0.4187221, -1.075512, 2.630924, 0, 0.1137255, 1, 1,
0.4206651, -0.5453029, 2.624098, 0, 0.1058824, 1, 1,
0.4218722, -2.24519, 3.635694, 0, 0.09803922, 1, 1,
0.423898, -0.4937014, 2.669871, 0, 0.09411765, 1, 1,
0.4248236, -0.3464162, 1.992603, 0, 0.08627451, 1, 1,
0.4253052, -0.8771303, 1.819619, 0, 0.08235294, 1, 1,
0.4312657, -0.1915495, 1.385099, 0, 0.07450981, 1, 1,
0.4352834, 0.6509033, 0.437755, 0, 0.07058824, 1, 1,
0.4367607, 1.642362, 0.3690424, 0, 0.0627451, 1, 1,
0.4370149, 0.8103949, 0.1757781, 0, 0.05882353, 1, 1,
0.4372247, 3.030464, -0.6897411, 0, 0.05098039, 1, 1,
0.4374408, 1.0976, 1.164651, 0, 0.04705882, 1, 1,
0.4429922, -3.096789, 3.45384, 0, 0.03921569, 1, 1,
0.4434707, 0.2929466, 2.258883, 0, 0.03529412, 1, 1,
0.4473652, 0.06167421, 1.205586, 0, 0.02745098, 1, 1,
0.4575121, 0.2869492, 1.028567, 0, 0.02352941, 1, 1,
0.4576153, 1.00158, 0.5232689, 0, 0.01568628, 1, 1,
0.4576282, 2.193658, 1.378271, 0, 0.01176471, 1, 1,
0.4578724, 0.4979148, 0.4255575, 0, 0.003921569, 1, 1,
0.4681868, -1.302235, 3.42763, 0.003921569, 0, 1, 1,
0.4715964, 1.574588, 1.263983, 0.007843138, 0, 1, 1,
0.4724106, 1.309982, 1.255694, 0.01568628, 0, 1, 1,
0.4734124, -1.513287, 2.984636, 0.01960784, 0, 1, 1,
0.473945, 1.878012, -2.391886, 0.02745098, 0, 1, 1,
0.4753685, -0.3748359, 2.320814, 0.03137255, 0, 1, 1,
0.4759936, -1.234335, 2.001747, 0.03921569, 0, 1, 1,
0.4773663, -2.553911, 1.623053, 0.04313726, 0, 1, 1,
0.4779505, -1.145929, 1.623585, 0.05098039, 0, 1, 1,
0.4803884, -1.042015, 3.922998, 0.05490196, 0, 1, 1,
0.4818587, 0.9541286, -0.9213609, 0.0627451, 0, 1, 1,
0.4832524, 0.07026543, -0.2142501, 0.06666667, 0, 1, 1,
0.4897082, -2.202056, 2.897479, 0.07450981, 0, 1, 1,
0.4912197, 0.6707102, 1.530049, 0.07843138, 0, 1, 1,
0.4913635, 0.4750679, 0.1157428, 0.08627451, 0, 1, 1,
0.4914232, 0.891838, -0.7352374, 0.09019608, 0, 1, 1,
0.4931664, -1.211563, 1.22055, 0.09803922, 0, 1, 1,
0.4944007, -1.147344, 1.248057, 0.1058824, 0, 1, 1,
0.5004267, 0.3052469, 0.9264668, 0.1098039, 0, 1, 1,
0.500557, -1.714988, 3.485353, 0.1176471, 0, 1, 1,
0.5016093, 0.8008358, -1.110721, 0.1215686, 0, 1, 1,
0.5022948, 2.049255, 0.6981189, 0.1294118, 0, 1, 1,
0.5042891, -1.124873, 2.389187, 0.1333333, 0, 1, 1,
0.5063786, 1.045242, 0.8677725, 0.1411765, 0, 1, 1,
0.5085008, 1.101788, 0.5625733, 0.145098, 0, 1, 1,
0.509403, 0.6342924, 3.829021, 0.1529412, 0, 1, 1,
0.5148928, 2.309441, -0.449258, 0.1568628, 0, 1, 1,
0.5156179, 0.1908382, 1.442748, 0.1647059, 0, 1, 1,
0.515982, 1.565777, 0.4231517, 0.1686275, 0, 1, 1,
0.5180544, -0.5767693, 2.205456, 0.1764706, 0, 1, 1,
0.5230501, 0.9992656, -0.4831131, 0.1803922, 0, 1, 1,
0.5240588, -0.3003442, 2.32737, 0.1882353, 0, 1, 1,
0.5263615, -0.1879522, 1.255556, 0.1921569, 0, 1, 1,
0.527193, -0.888777, 3.958617, 0.2, 0, 1, 1,
0.5293573, 1.503189, -0.3948254, 0.2078431, 0, 1, 1,
0.5346538, 0.2711768, 1.773757, 0.2117647, 0, 1, 1,
0.5348611, -0.2544898, 1.145414, 0.2196078, 0, 1, 1,
0.5373504, 0.675036, 1.314737, 0.2235294, 0, 1, 1,
0.538621, -1.436602, 2.167167, 0.2313726, 0, 1, 1,
0.5424167, -0.8211489, 2.863457, 0.2352941, 0, 1, 1,
0.5432596, 0.2415139, 1.805242, 0.2431373, 0, 1, 1,
0.5460004, 0.7874218, 1.965346, 0.2470588, 0, 1, 1,
0.5540201, 0.09277394, 0.8537614, 0.254902, 0, 1, 1,
0.554947, -0.5201585, 4.232066, 0.2588235, 0, 1, 1,
0.560302, -1.156413, 3.231317, 0.2666667, 0, 1, 1,
0.5605617, -0.409519, 1.72659, 0.2705882, 0, 1, 1,
0.5648085, 2.180255, 1.430917, 0.2784314, 0, 1, 1,
0.5667099, -0.3044614, 1.535707, 0.282353, 0, 1, 1,
0.5761505, 1.194752, -0.0365359, 0.2901961, 0, 1, 1,
0.5766119, 0.5445827, 0.8483096, 0.2941177, 0, 1, 1,
0.5793866, -1.30135, 1.677966, 0.3019608, 0, 1, 1,
0.5918497, -0.5395198, 2.584904, 0.3098039, 0, 1, 1,
0.5927686, -0.7188048, 3.366812, 0.3137255, 0, 1, 1,
0.6002994, 0.01067286, 1.650502, 0.3215686, 0, 1, 1,
0.6057543, 1.355661, 1.513482, 0.3254902, 0, 1, 1,
0.6060333, 0.07910391, 3.129912, 0.3333333, 0, 1, 1,
0.6129197, 0.005387519, 1.593979, 0.3372549, 0, 1, 1,
0.6129863, 1.03973, 0.1778848, 0.345098, 0, 1, 1,
0.6191533, -0.04008953, 1.943258, 0.3490196, 0, 1, 1,
0.6237493, 1.41862, 0.5095786, 0.3568628, 0, 1, 1,
0.6248261, -0.3197426, 3.599132, 0.3607843, 0, 1, 1,
0.6248455, 1.168219, -0.1766093, 0.3686275, 0, 1, 1,
0.62651, -0.4504354, 3.097968, 0.372549, 0, 1, 1,
0.6332383, -1.233956, 3.135436, 0.3803922, 0, 1, 1,
0.6335244, -1.088311, 2.657232, 0.3843137, 0, 1, 1,
0.6423265, 0.003861197, 3.03847, 0.3921569, 0, 1, 1,
0.6476545, -0.5287376, 2.127905, 0.3960784, 0, 1, 1,
0.6476553, 0.002010133, 0.5782234, 0.4039216, 0, 1, 1,
0.648092, 0.233291, 0.8464277, 0.4117647, 0, 1, 1,
0.6497426, 0.6988211, 0.7630156, 0.4156863, 0, 1, 1,
0.6502342, 0.4562747, 2.304589, 0.4235294, 0, 1, 1,
0.6510839, -0.4524834, 0.6703251, 0.427451, 0, 1, 1,
0.6554085, 1.192785, -0.5578749, 0.4352941, 0, 1, 1,
0.6564312, -0.2673865, 2.044204, 0.4392157, 0, 1, 1,
0.6606622, 0.2571311, 1.626906, 0.4470588, 0, 1, 1,
0.6622108, 0.921243, -0.6277274, 0.4509804, 0, 1, 1,
0.6650831, 0.140944, 1.605476, 0.4588235, 0, 1, 1,
0.6667746, 0.3896047, 0.9471294, 0.4627451, 0, 1, 1,
0.667034, 1.329649, 1.910868, 0.4705882, 0, 1, 1,
0.6677492, -1.248781, 2.583754, 0.4745098, 0, 1, 1,
0.6730433, 0.4433805, 0.6946159, 0.4823529, 0, 1, 1,
0.6813057, 0.3703334, 0.267756, 0.4862745, 0, 1, 1,
0.6818594, 0.7639618, 0.3891656, 0.4941176, 0, 1, 1,
0.6830626, -1.516932, 3.505597, 0.5019608, 0, 1, 1,
0.6839473, -0.2179807, 1.460529, 0.5058824, 0, 1, 1,
0.6850065, -1.270055, 0.60152, 0.5137255, 0, 1, 1,
0.6866537, -1.034754, 2.987704, 0.5176471, 0, 1, 1,
0.68692, 0.4576901, 2.158882, 0.5254902, 0, 1, 1,
0.6876884, -1.145003, 3.365715, 0.5294118, 0, 1, 1,
0.6924945, -0.4920385, 4.20376, 0.5372549, 0, 1, 1,
0.6952974, -0.08101101, -0.02197852, 0.5411765, 0, 1, 1,
0.6962746, -0.8271056, 1.638608, 0.5490196, 0, 1, 1,
0.6967817, 0.1270215, 0.6326871, 0.5529412, 0, 1, 1,
0.7002413, -0.9894425, 2.738706, 0.5607843, 0, 1, 1,
0.7050844, 0.4504803, 1.711406, 0.5647059, 0, 1, 1,
0.712032, -0.63249, 3.89727, 0.572549, 0, 1, 1,
0.7144334, 0.4477527, 1.036634, 0.5764706, 0, 1, 1,
0.7148294, -1.107616, 0.5793466, 0.5843138, 0, 1, 1,
0.7266386, 1.127146, 1.82129, 0.5882353, 0, 1, 1,
0.7272085, 1.300362, -0.1384601, 0.5960785, 0, 1, 1,
0.7331585, -0.4816637, 3.073995, 0.6039216, 0, 1, 1,
0.7401918, 0.1188226, 1.423477, 0.6078432, 0, 1, 1,
0.7487709, 0.9188895, 0.8883604, 0.6156863, 0, 1, 1,
0.7547365, 1.363246, 0.1387209, 0.6196079, 0, 1, 1,
0.7559555, 0.9447903, 1.349529, 0.627451, 0, 1, 1,
0.7570245, 1.167754, 0.5335097, 0.6313726, 0, 1, 1,
0.7579427, 0.8065293, 2.289619, 0.6392157, 0, 1, 1,
0.7596477, 0.9688835, -1.27791, 0.6431373, 0, 1, 1,
0.7733061, 0.5292809, 1.576052, 0.6509804, 0, 1, 1,
0.7760626, 0.607718, 1.482823, 0.654902, 0, 1, 1,
0.7781492, -0.9853068, 1.418041, 0.6627451, 0, 1, 1,
0.7799397, -0.8271769, 2.297942, 0.6666667, 0, 1, 1,
0.7801158, 1.153933, -0.4466467, 0.6745098, 0, 1, 1,
0.7820139, -0.7900015, 4.863047, 0.6784314, 0, 1, 1,
0.7845129, 0.2910991, 1.741326, 0.6862745, 0, 1, 1,
0.7928987, 0.769056, 0.9078071, 0.6901961, 0, 1, 1,
0.7931013, 1.088846, 0.5177972, 0.6980392, 0, 1, 1,
0.7995996, 0.5190623, 3.321479, 0.7058824, 0, 1, 1,
0.8103981, 0.7042384, 2.542096, 0.7098039, 0, 1, 1,
0.811626, 0.8784915, 0.7680889, 0.7176471, 0, 1, 1,
0.8235149, -0.1389131, 3.170774, 0.7215686, 0, 1, 1,
0.8237139, -0.8825949, 2.171781, 0.7294118, 0, 1, 1,
0.8264719, 0.9283744, 0.8320466, 0.7333333, 0, 1, 1,
0.8283587, -0.9222247, 3.823097, 0.7411765, 0, 1, 1,
0.828876, 1.70555, -0.5803846, 0.7450981, 0, 1, 1,
0.832883, -0.1423718, 3.066697, 0.7529412, 0, 1, 1,
0.8333658, -0.6362704, 2.381734, 0.7568628, 0, 1, 1,
0.8340475, 1.785042, 0.4236458, 0.7647059, 0, 1, 1,
0.8405082, -0.3916394, 2.562977, 0.7686275, 0, 1, 1,
0.8467605, 0.2632466, 1.694995, 0.7764706, 0, 1, 1,
0.8495856, -0.03005935, 2.442853, 0.7803922, 0, 1, 1,
0.8513828, 0.4789158, -0.417423, 0.7882353, 0, 1, 1,
0.8539969, -0.4154496, 1.927993, 0.7921569, 0, 1, 1,
0.8547761, 0.4208319, 1.674714, 0.8, 0, 1, 1,
0.8556784, -0.4251662, 3.064308, 0.8078431, 0, 1, 1,
0.8559531, -0.8733959, 2.539385, 0.8117647, 0, 1, 1,
0.8568063, 0.351979, -0.1000636, 0.8196079, 0, 1, 1,
0.8576014, -0.3965706, 2.838488, 0.8235294, 0, 1, 1,
0.8593568, 0.7967572, -0.3955815, 0.8313726, 0, 1, 1,
0.8598363, 0.9640466, 2.029539, 0.8352941, 0, 1, 1,
0.8629924, -2.304836, 2.722579, 0.8431373, 0, 1, 1,
0.8648975, -0.04703779, 2.403111, 0.8470588, 0, 1, 1,
0.873836, 1.635615, 1.150465, 0.854902, 0, 1, 1,
0.8822483, 1.326299, 0.6489775, 0.8588235, 0, 1, 1,
0.8858322, 0.6071506, -0.02727412, 0.8666667, 0, 1, 1,
0.8860078, -0.6437656, 1.63789, 0.8705882, 0, 1, 1,
0.8868777, 1.483662, -0.662009, 0.8784314, 0, 1, 1,
0.889966, 0.880661, 1.471615, 0.8823529, 0, 1, 1,
0.8904603, -0.5404216, 4.293797, 0.8901961, 0, 1, 1,
0.8911618, 0.8405257, -0.009577259, 0.8941177, 0, 1, 1,
0.8941371, -0.2895968, 3.544286, 0.9019608, 0, 1, 1,
0.8982137, -0.7501762, 2.989605, 0.9098039, 0, 1, 1,
0.8992441, 0.3856415, -0.4412309, 0.9137255, 0, 1, 1,
0.9185392, 1.490846, 1.203767, 0.9215686, 0, 1, 1,
0.9226947, -0.02708782, 2.357354, 0.9254902, 0, 1, 1,
0.9300142, 0.7519225, -0.3154922, 0.9333333, 0, 1, 1,
0.9360924, 0.008005181, 2.542102, 0.9372549, 0, 1, 1,
0.9414896, 1.034158, 1.378705, 0.945098, 0, 1, 1,
0.9459834, -0.06985618, -0.4695552, 0.9490196, 0, 1, 1,
0.9466463, 1.431486, 0.7243229, 0.9568627, 0, 1, 1,
0.9510505, 0.7051158, -0.3905162, 0.9607843, 0, 1, 1,
0.9587321, -2.243378, 3.477368, 0.9686275, 0, 1, 1,
0.9631992, 2.316503, -0.4445559, 0.972549, 0, 1, 1,
0.9659417, -0.2673201, 2.419932, 0.9803922, 0, 1, 1,
0.9684203, 1.380396, 1.848892, 0.9843137, 0, 1, 1,
0.9690064, -0.143323, 1.529095, 0.9921569, 0, 1, 1,
0.9694079, 0.4018184, 3.032219, 0.9960784, 0, 1, 1,
0.9703296, 0.6102259, 0.470419, 1, 0, 0.9960784, 1,
0.9737549, 1.826542, 1.970676, 1, 0, 0.9882353, 1,
0.974812, 0.1637933, 1.99902, 1, 0, 0.9843137, 1,
0.9776994, -0.6240817, 2.917447, 1, 0, 0.9764706, 1,
0.9814339, -0.6059946, 2.407205, 1, 0, 0.972549, 1,
0.9821491, 2.20274, 0.6513906, 1, 0, 0.9647059, 1,
0.9837878, -1.61865, 2.906651, 1, 0, 0.9607843, 1,
0.9886571, 0.3210629, 1.539337, 1, 0, 0.9529412, 1,
0.9900236, 0.2194055, -0.05542755, 1, 0, 0.9490196, 1,
0.9914421, -1.314691, 4.231725, 1, 0, 0.9411765, 1,
0.991663, 1.227725, 1.065802, 1, 0, 0.9372549, 1,
0.9960194, -2.222268, 1.76924, 1, 0, 0.9294118, 1,
0.9964671, -2.234147, 3.604447, 1, 0, 0.9254902, 1,
0.9965262, -0.9028078, 1.677966, 1, 0, 0.9176471, 1,
0.9983333, 0.324687, 0.9606225, 1, 0, 0.9137255, 1,
1.00807, -0.8223547, 3.47211, 1, 0, 0.9058824, 1,
1.025573, 0.3091838, 0.621066, 1, 0, 0.9019608, 1,
1.026288, 0.4042292, 0.5233636, 1, 0, 0.8941177, 1,
1.033924, -0.8699616, 3.260794, 1, 0, 0.8862745, 1,
1.040239, -0.678259, 3.075767, 1, 0, 0.8823529, 1,
1.043522, 0.5448487, 0.7800209, 1, 0, 0.8745098, 1,
1.045361, -0.3115258, 0.9202541, 1, 0, 0.8705882, 1,
1.046551, -1.28449, 0.8221788, 1, 0, 0.8627451, 1,
1.047613, 0.1859951, 1.586866, 1, 0, 0.8588235, 1,
1.048972, 1.004308, 3.390418, 1, 0, 0.8509804, 1,
1.050489, 0.1996648, 2.458144, 1, 0, 0.8470588, 1,
1.053445, -0.1689754, 2.290647, 1, 0, 0.8392157, 1,
1.059993, -0.4158347, 1.523374, 1, 0, 0.8352941, 1,
1.060869, 0.5409951, 3.235286, 1, 0, 0.827451, 1,
1.06155, 0.4592166, 1.079163, 1, 0, 0.8235294, 1,
1.063405, 1.391346, -1.634243, 1, 0, 0.8156863, 1,
1.069832, -0.656774, 0.65053, 1, 0, 0.8117647, 1,
1.087752, 2.24436, -1.985739, 1, 0, 0.8039216, 1,
1.088345, 0.00680336, 2.443622, 1, 0, 0.7960784, 1,
1.089628, -0.9515474, 2.666391, 1, 0, 0.7921569, 1,
1.090622, -0.4708807, 1.579048, 1, 0, 0.7843137, 1,
1.096175, -0.6223928, 3.028588, 1, 0, 0.7803922, 1,
1.107079, -1.335483, 0.8604444, 1, 0, 0.772549, 1,
1.109319, 0.9879339, 1.509002, 1, 0, 0.7686275, 1,
1.115674, 0.4095752, 2.424287, 1, 0, 0.7607843, 1,
1.124182, 1.099213, 0.5935968, 1, 0, 0.7568628, 1,
1.136539, -0.2061129, 1.062821, 1, 0, 0.7490196, 1,
1.140418, 0.3221004, 1.768586, 1, 0, 0.7450981, 1,
1.1427, -1.275042, 3.23694, 1, 0, 0.7372549, 1,
1.148267, 0.1552698, 0.8387718, 1, 0, 0.7333333, 1,
1.155796, 0.4075805, 2.130632, 1, 0, 0.7254902, 1,
1.161115, 0.5840237, 2.862249, 1, 0, 0.7215686, 1,
1.165063, -0.3012615, -0.001349353, 1, 0, 0.7137255, 1,
1.167713, 0.2942752, 2.265357, 1, 0, 0.7098039, 1,
1.168237, 0.0783852, 2.386925, 1, 0, 0.7019608, 1,
1.169185, -0.5494283, 3.120445, 1, 0, 0.6941177, 1,
1.17458, -0.8789698, 1.29232, 1, 0, 0.6901961, 1,
1.17797, -0.09390318, -0.1159592, 1, 0, 0.682353, 1,
1.183906, -0.7081237, 1.881751, 1, 0, 0.6784314, 1,
1.185895, -2.360543, 2.659103, 1, 0, 0.6705883, 1,
1.193149, 0.7248975, 0.3787596, 1, 0, 0.6666667, 1,
1.193852, 0.451753, -0.3833724, 1, 0, 0.6588235, 1,
1.195381, 2.94835, 0.9970289, 1, 0, 0.654902, 1,
1.196303, -0.5522119, 2.696213, 1, 0, 0.6470588, 1,
1.199357, -1.923578, 2.378146, 1, 0, 0.6431373, 1,
1.202451, 0.5884939, 2.279942, 1, 0, 0.6352941, 1,
1.206451, -1.058565, 2.714519, 1, 0, 0.6313726, 1,
1.209487, 1.527528, 0.3067782, 1, 0, 0.6235294, 1,
1.214162, 0.6213936, 1.41432, 1, 0, 0.6196079, 1,
1.216625, -0.2867133, 1.713392, 1, 0, 0.6117647, 1,
1.218994, -1.541234, 2.382484, 1, 0, 0.6078432, 1,
1.235232, -0.5883623, 0.9272079, 1, 0, 0.6, 1,
1.239736, -2.421762, 2.51751, 1, 0, 0.5921569, 1,
1.249306, 0.8297605, -0.1388051, 1, 0, 0.5882353, 1,
1.260037, -0.4453343, 1.916569, 1, 0, 0.5803922, 1,
1.260165, 1.865711, 1.975957, 1, 0, 0.5764706, 1,
1.267598, -2.12245, 1.147835, 1, 0, 0.5686275, 1,
1.276472, -0.1017732, 3.473034, 1, 0, 0.5647059, 1,
1.280031, -0.4122378, 2.292275, 1, 0, 0.5568628, 1,
1.296156, -1.098678, 2.65878, 1, 0, 0.5529412, 1,
1.296255, -0.2316056, 1.779265, 1, 0, 0.5450981, 1,
1.30643, -0.5045383, 2.187002, 1, 0, 0.5411765, 1,
1.329267, 1.614601, 0.1573601, 1, 0, 0.5333334, 1,
1.344574, 0.9603215, 0.3035259, 1, 0, 0.5294118, 1,
1.353417, -1.025113, 3.556812, 1, 0, 0.5215687, 1,
1.362304, -1.516496, 0.8905228, 1, 0, 0.5176471, 1,
1.365418, 0.1788503, 2.04288, 1, 0, 0.509804, 1,
1.370667, -0.3467462, 3.445897, 1, 0, 0.5058824, 1,
1.376581, -0.1583188, 1.949543, 1, 0, 0.4980392, 1,
1.395465, 0.03815185, 1.001455, 1, 0, 0.4901961, 1,
1.401611, -0.7443296, 0.07999598, 1, 0, 0.4862745, 1,
1.421405, -0.274451, -1.278821, 1, 0, 0.4784314, 1,
1.424278, -0.9519238, 4.512393, 1, 0, 0.4745098, 1,
1.424598, 0.8433531, -0.07968695, 1, 0, 0.4666667, 1,
1.426665, 0.4760806, 0.2856484, 1, 0, 0.4627451, 1,
1.429897, -1.50268, 2.300925, 1, 0, 0.454902, 1,
1.435207, -1.368121, 2.781154, 1, 0, 0.4509804, 1,
1.440021, -0.7574522, 1.839301, 1, 0, 0.4431373, 1,
1.448707, -0.06254759, 1.116716, 1, 0, 0.4392157, 1,
1.455547, 0.2964909, 2.217103, 1, 0, 0.4313726, 1,
1.456658, -1.310614, 1.176225, 1, 0, 0.427451, 1,
1.461321, 0.08788644, 2.900995, 1, 0, 0.4196078, 1,
1.46866, 0.5260711, 1.156245, 1, 0, 0.4156863, 1,
1.472233, 0.01319482, 1.293866, 1, 0, 0.4078431, 1,
1.47256, 0.6526491, 2.016483, 1, 0, 0.4039216, 1,
1.481433, 0.421919, 0.834759, 1, 0, 0.3960784, 1,
1.498214, -1.790116, 3.15172, 1, 0, 0.3882353, 1,
1.501291, -1.468024, 2.772867, 1, 0, 0.3843137, 1,
1.523739, -0.6856802, 2.866297, 1, 0, 0.3764706, 1,
1.523757, -0.08759566, 3.074655, 1, 0, 0.372549, 1,
1.525905, 0.4763405, 2.226271, 1, 0, 0.3647059, 1,
1.527321, -0.6542001, 1.558339, 1, 0, 0.3607843, 1,
1.570663, -0.908679, 1.356796, 1, 0, 0.3529412, 1,
1.590752, 1.964237, 1.664125, 1, 0, 0.3490196, 1,
1.590933, 0.1243864, 0.9970494, 1, 0, 0.3411765, 1,
1.593921, 0.08417055, 2.320364, 1, 0, 0.3372549, 1,
1.601457, 0.8522179, 2.173164, 1, 0, 0.3294118, 1,
1.630648, 1.568382, 0.2542788, 1, 0, 0.3254902, 1,
1.631864, -0.07800373, 1.330911, 1, 0, 0.3176471, 1,
1.649699, 0.3416811, 1.07307, 1, 0, 0.3137255, 1,
1.663967, -2.154139, 2.896267, 1, 0, 0.3058824, 1,
1.675051, 1.147378, 0.4468469, 1, 0, 0.2980392, 1,
1.677131, -1.130867, 2.677974, 1, 0, 0.2941177, 1,
1.68741, 0.1542768, 1.937225, 1, 0, 0.2862745, 1,
1.689045, -0.1112192, 1.063531, 1, 0, 0.282353, 1,
1.694452, -1.845899, 3.715015, 1, 0, 0.2745098, 1,
1.701233, -0.5862404, 2.637395, 1, 0, 0.2705882, 1,
1.717268, -0.1227177, 1.116726, 1, 0, 0.2627451, 1,
1.724139, -2.069018, -0.01942405, 1, 0, 0.2588235, 1,
1.739529, -0.6044629, 2.634289, 1, 0, 0.2509804, 1,
1.740605, 1.100258, 1.102036, 1, 0, 0.2470588, 1,
1.745604, -0.0002825916, 0.1893481, 1, 0, 0.2392157, 1,
1.779564, -0.4257247, 0.9792774, 1, 0, 0.2352941, 1,
1.781498, 0.7866449, -0.799668, 1, 0, 0.227451, 1,
1.788344, 0.3304523, 1.596895, 1, 0, 0.2235294, 1,
1.796812, -1.486393, 2.961565, 1, 0, 0.2156863, 1,
1.820278, -0.02543881, 0.9432865, 1, 0, 0.2117647, 1,
1.851544, 0.490744, 2.106792, 1, 0, 0.2039216, 1,
1.86661, 0.06233896, 0.8158023, 1, 0, 0.1960784, 1,
1.874023, 0.4477246, 1.278024, 1, 0, 0.1921569, 1,
1.89177, -1.249951, 1.180036, 1, 0, 0.1843137, 1,
1.914347, 0.1692957, 1.591252, 1, 0, 0.1803922, 1,
1.935368, -0.5193856, 2.708094, 1, 0, 0.172549, 1,
1.944289, 1.328544, 1.969525, 1, 0, 0.1686275, 1,
1.950354, 0.5820334, 2.022249, 1, 0, 0.1607843, 1,
1.952426, 0.434414, 1.756756, 1, 0, 0.1568628, 1,
1.99211, 1.874641, 1.300253, 1, 0, 0.1490196, 1,
2.077579, 0.8872141, -0.02324728, 1, 0, 0.145098, 1,
2.116434, -0.3792473, 0.5096132, 1, 0, 0.1372549, 1,
2.129586, 0.6853323, -0.9898702, 1, 0, 0.1333333, 1,
2.153322, -1.145251, 2.529588, 1, 0, 0.1254902, 1,
2.164444, 1.93887, -0.6017541, 1, 0, 0.1215686, 1,
2.168369, -1.636716, -0.1697887, 1, 0, 0.1137255, 1,
2.168443, -0.3506528, 1.322827, 1, 0, 0.1098039, 1,
2.174109, -0.4155347, 0.3015675, 1, 0, 0.1019608, 1,
2.196569, 0.5279356, 1.603701, 1, 0, 0.09411765, 1,
2.209482, 0.1498005, 2.350041, 1, 0, 0.09019608, 1,
2.216851, 1.33826, -0.08136931, 1, 0, 0.08235294, 1,
2.239098, -0.218396, 1.282566, 1, 0, 0.07843138, 1,
2.243962, 0.358241, 1.883068, 1, 0, 0.07058824, 1,
2.299673, -0.3883992, 2.114343, 1, 0, 0.06666667, 1,
2.320414, 0.5513605, 1.161336, 1, 0, 0.05882353, 1,
2.320885, 1.714553, 1.511847, 1, 0, 0.05490196, 1,
2.334026, -1.470791, 2.922421, 1, 0, 0.04705882, 1,
2.37047, 0.7420273, 1.604399, 1, 0, 0.04313726, 1,
2.372378, -0.9536431, -0.4170816, 1, 0, 0.03529412, 1,
2.44993, 0.742254, 0.3999306, 1, 0, 0.03137255, 1,
2.464053, 1.550983, 1.585891, 1, 0, 0.02352941, 1,
2.648638, -0.6989336, 2.198068, 1, 0, 0.01960784, 1,
2.983968, -0.2649952, 1.473097, 1, 0, 0.01176471, 1,
3.773682, 0.124637, 1.106202, 1, 0, 0.007843138, 1
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
0.1576755, -4.253315, -6.584167, 0, -0.5, 0.5, 0.5,
0.1576755, -4.253315, -6.584167, 1, -0.5, 0.5, 0.5,
0.1576755, -4.253315, -6.584167, 1, 1.5, 0.5, 0.5,
0.1576755, -4.253315, -6.584167, 0, 1.5, 0.5, 0.5
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
-4.684158, 0.3147917, -6.584167, 0, -0.5, 0.5, 0.5,
-4.684158, 0.3147917, -6.584167, 1, -0.5, 0.5, 0.5,
-4.684158, 0.3147917, -6.584167, 1, 1.5, 0.5, 0.5,
-4.684158, 0.3147917, -6.584167, 0, 1.5, 0.5, 0.5
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
-4.684158, -4.253315, 0.1372526, 0, -0.5, 0.5, 0.5,
-4.684158, -4.253315, 0.1372526, 1, -0.5, 0.5, 0.5,
-4.684158, -4.253315, 0.1372526, 1, 1.5, 0.5, 0.5,
-4.684158, -4.253315, 0.1372526, 0, 1.5, 0.5, 0.5
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
-2, -3.199137, -5.033071,
2, -3.199137, -5.033071,
-2, -3.199137, -5.033071,
-2, -3.374833, -5.291587,
0, -3.199137, -5.033071,
0, -3.374833, -5.291587,
2, -3.199137, -5.033071,
2, -3.374833, -5.291587
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
-2, -3.726226, -5.808619, 0, -0.5, 0.5, 0.5,
-2, -3.726226, -5.808619, 1, -0.5, 0.5, 0.5,
-2, -3.726226, -5.808619, 1, 1.5, 0.5, 0.5,
-2, -3.726226, -5.808619, 0, 1.5, 0.5, 0.5,
0, -3.726226, -5.808619, 0, -0.5, 0.5, 0.5,
0, -3.726226, -5.808619, 1, -0.5, 0.5, 0.5,
0, -3.726226, -5.808619, 1, 1.5, 0.5, 0.5,
0, -3.726226, -5.808619, 0, 1.5, 0.5, 0.5,
2, -3.726226, -5.808619, 0, -0.5, 0.5, 0.5,
2, -3.726226, -5.808619, 1, -0.5, 0.5, 0.5,
2, -3.726226, -5.808619, 1, 1.5, 0.5, 0.5,
2, -3.726226, -5.808619, 0, 1.5, 0.5, 0.5
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
-3.566812, -3, -5.033071,
-3.566812, 3, -5.033071,
-3.566812, -3, -5.033071,
-3.753036, -3, -5.291587,
-3.566812, -2, -5.033071,
-3.753036, -2, -5.291587,
-3.566812, -1, -5.033071,
-3.753036, -1, -5.291587,
-3.566812, 0, -5.033071,
-3.753036, 0, -5.291587,
-3.566812, 1, -5.033071,
-3.753036, 1, -5.291587,
-3.566812, 2, -5.033071,
-3.753036, 2, -5.291587,
-3.566812, 3, -5.033071,
-3.753036, 3, -5.291587
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
-4.125484, -3, -5.808619, 0, -0.5, 0.5, 0.5,
-4.125484, -3, -5.808619, 1, -0.5, 0.5, 0.5,
-4.125484, -3, -5.808619, 1, 1.5, 0.5, 0.5,
-4.125484, -3, -5.808619, 0, 1.5, 0.5, 0.5,
-4.125484, -2, -5.808619, 0, -0.5, 0.5, 0.5,
-4.125484, -2, -5.808619, 1, -0.5, 0.5, 0.5,
-4.125484, -2, -5.808619, 1, 1.5, 0.5, 0.5,
-4.125484, -2, -5.808619, 0, 1.5, 0.5, 0.5,
-4.125484, -1, -5.808619, 0, -0.5, 0.5, 0.5,
-4.125484, -1, -5.808619, 1, -0.5, 0.5, 0.5,
-4.125484, -1, -5.808619, 1, 1.5, 0.5, 0.5,
-4.125484, -1, -5.808619, 0, 1.5, 0.5, 0.5,
-4.125484, 0, -5.808619, 0, -0.5, 0.5, 0.5,
-4.125484, 0, -5.808619, 1, -0.5, 0.5, 0.5,
-4.125484, 0, -5.808619, 1, 1.5, 0.5, 0.5,
-4.125484, 0, -5.808619, 0, 1.5, 0.5, 0.5,
-4.125484, 1, -5.808619, 0, -0.5, 0.5, 0.5,
-4.125484, 1, -5.808619, 1, -0.5, 0.5, 0.5,
-4.125484, 1, -5.808619, 1, 1.5, 0.5, 0.5,
-4.125484, 1, -5.808619, 0, 1.5, 0.5, 0.5,
-4.125484, 2, -5.808619, 0, -0.5, 0.5, 0.5,
-4.125484, 2, -5.808619, 1, -0.5, 0.5, 0.5,
-4.125484, 2, -5.808619, 1, 1.5, 0.5, 0.5,
-4.125484, 2, -5.808619, 0, 1.5, 0.5, 0.5,
-4.125484, 3, -5.808619, 0, -0.5, 0.5, 0.5,
-4.125484, 3, -5.808619, 1, -0.5, 0.5, 0.5,
-4.125484, 3, -5.808619, 1, 1.5, 0.5, 0.5,
-4.125484, 3, -5.808619, 0, 1.5, 0.5, 0.5
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
-3.566812, -3.199137, -4,
-3.566812, -3.199137, 4,
-3.566812, -3.199137, -4,
-3.753036, -3.374833, -4,
-3.566812, -3.199137, -2,
-3.753036, -3.374833, -2,
-3.566812, -3.199137, 0,
-3.753036, -3.374833, 0,
-3.566812, -3.199137, 2,
-3.753036, -3.374833, 2,
-3.566812, -3.199137, 4,
-3.753036, -3.374833, 4
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
-4.125484, -3.726226, -4, 0, -0.5, 0.5, 0.5,
-4.125484, -3.726226, -4, 1, -0.5, 0.5, 0.5,
-4.125484, -3.726226, -4, 1, 1.5, 0.5, 0.5,
-4.125484, -3.726226, -4, 0, 1.5, 0.5, 0.5,
-4.125484, -3.726226, -2, 0, -0.5, 0.5, 0.5,
-4.125484, -3.726226, -2, 1, -0.5, 0.5, 0.5,
-4.125484, -3.726226, -2, 1, 1.5, 0.5, 0.5,
-4.125484, -3.726226, -2, 0, 1.5, 0.5, 0.5,
-4.125484, -3.726226, 0, 0, -0.5, 0.5, 0.5,
-4.125484, -3.726226, 0, 1, -0.5, 0.5, 0.5,
-4.125484, -3.726226, 0, 1, 1.5, 0.5, 0.5,
-4.125484, -3.726226, 0, 0, 1.5, 0.5, 0.5,
-4.125484, -3.726226, 2, 0, -0.5, 0.5, 0.5,
-4.125484, -3.726226, 2, 1, -0.5, 0.5, 0.5,
-4.125484, -3.726226, 2, 1, 1.5, 0.5, 0.5,
-4.125484, -3.726226, 2, 0, 1.5, 0.5, 0.5,
-4.125484, -3.726226, 4, 0, -0.5, 0.5, 0.5,
-4.125484, -3.726226, 4, 1, -0.5, 0.5, 0.5,
-4.125484, -3.726226, 4, 1, 1.5, 0.5, 0.5,
-4.125484, -3.726226, 4, 0, 1.5, 0.5, 0.5
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
-3.566812, -3.199137, -5.033071,
-3.566812, 3.82872, -5.033071,
-3.566812, -3.199137, 5.307576,
-3.566812, 3.82872, 5.307576,
-3.566812, -3.199137, -5.033071,
-3.566812, -3.199137, 5.307576,
-3.566812, 3.82872, -5.033071,
-3.566812, 3.82872, 5.307576,
-3.566812, -3.199137, -5.033071,
3.882163, -3.199137, -5.033071,
-3.566812, -3.199137, 5.307576,
3.882163, -3.199137, 5.307576,
-3.566812, 3.82872, -5.033071,
3.882163, 3.82872, -5.033071,
-3.566812, 3.82872, 5.307576,
3.882163, 3.82872, 5.307576,
3.882163, -3.199137, -5.033071,
3.882163, 3.82872, -5.033071,
3.882163, -3.199137, 5.307576,
3.882163, 3.82872, 5.307576,
3.882163, -3.199137, -5.033071,
3.882163, -3.199137, 5.307576,
3.882163, 3.82872, -5.033071,
3.882163, 3.82872, 5.307576
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
var radius = 7.771334;
var distance = 34.57554;
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
mvMatrix.translate( -0.1576755, -0.3147917, -0.1372526 );
mvMatrix.scale( 1.12801, 1.195602, 0.8125719 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.57554);
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
butyranilide<-read.table("butyranilide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-butyranilide$V2
```

```
## Error in eval(expr, envir, enclos): object 'butyranilide' not found
```

```r
y<-butyranilide$V3
```

```
## Error in eval(expr, envir, enclos): object 'butyranilide' not found
```

```r
z<-butyranilide$V4
```

```
## Error in eval(expr, envir, enclos): object 'butyranilide' not found
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
-3.458331, -0.370812, -2.045367, 0, 0, 1, 1, 1,
-2.88429, -1.927288, -2.190004, 1, 0, 0, 1, 1,
-2.685856, 0.8378618, -1.412509, 1, 0, 0, 1, 1,
-2.647955, -0.14986, -2.617275, 1, 0, 0, 1, 1,
-2.54988, -1.133397, -3.064734, 1, 0, 0, 1, 1,
-2.478174, -0.8332077, -2.417629, 1, 0, 0, 1, 1,
-2.47512, -0.2148941, -2.321183, 0, 0, 0, 1, 1,
-2.39091, 1.000519, 0.3172075, 0, 0, 0, 1, 1,
-2.380632, 1.412065, -0.7696362, 0, 0, 0, 1, 1,
-2.348281, -0.1976056, -2.577385, 0, 0, 0, 1, 1,
-2.301198, 0.7433394, -1.76589, 0, 0, 0, 1, 1,
-2.282844, -1.081199, -3.086341, 0, 0, 0, 1, 1,
-2.278332, 0.8779138, -0.2694255, 0, 0, 0, 1, 1,
-2.059128, 0.2754433, -1.809371, 1, 1, 1, 1, 1,
-2.034561, -0.5995777, -1.596799, 1, 1, 1, 1, 1,
-1.977589, 0.6954408, -0.2620389, 1, 1, 1, 1, 1,
-1.974152, -0.1990535, -1.010067, 1, 1, 1, 1, 1,
-1.960954, 0.7529061, -0.1085549, 1, 1, 1, 1, 1,
-1.950115, 1.792677, 0.02975627, 1, 1, 1, 1, 1,
-1.948291, 0.6698809, -0.3958181, 1, 1, 1, 1, 1,
-1.882999, -1.379259, -1.507558, 1, 1, 1, 1, 1,
-1.875007, 1.375744, -0.9347135, 1, 1, 1, 1, 1,
-1.854609, -1.07115, -0.473954, 1, 1, 1, 1, 1,
-1.841392, 1.218175, -1.232135, 1, 1, 1, 1, 1,
-1.800457, -1.810906, -1.915023, 1, 1, 1, 1, 1,
-1.792253, -0.7386665, -3.515374, 1, 1, 1, 1, 1,
-1.785916, 0.9525985, -0.5684658, 1, 1, 1, 1, 1,
-1.784739, 0.2675381, -1.077312, 1, 1, 1, 1, 1,
-1.782817, 1.301834, -1.506503, 0, 0, 1, 1, 1,
-1.780884, 1.354444, -0.9246027, 1, 0, 0, 1, 1,
-1.779157, 1.69049, 0.02761339, 1, 0, 0, 1, 1,
-1.768507, 0.248698, 0.03543147, 1, 0, 0, 1, 1,
-1.766661, -0.2822795, -2.020167, 1, 0, 0, 1, 1,
-1.764506, 0.2181367, -0.5226344, 1, 0, 0, 1, 1,
-1.762544, 0.3971851, -0.9161479, 0, 0, 0, 1, 1,
-1.75796, -0.533531, -2.436779, 0, 0, 0, 1, 1,
-1.749577, 0.03753941, -1.751873, 0, 0, 0, 1, 1,
-1.748117, -0.3751788, -1.444777, 0, 0, 0, 1, 1,
-1.693071, -0.0805159, -1.875778, 0, 0, 0, 1, 1,
-1.683231, -0.5903991, -1.319425, 0, 0, 0, 1, 1,
-1.682994, -0.4347033, -1.863956, 0, 0, 0, 1, 1,
-1.682449, -1.28642, -4.740035, 1, 1, 1, 1, 1,
-1.681858, -1.417578, -2.749716, 1, 1, 1, 1, 1,
-1.67589, 1.58839, -0.4923604, 1, 1, 1, 1, 1,
-1.675145, 1.018959, -3.022948, 1, 1, 1, 1, 1,
-1.65551, 1.921002, -0.01925473, 1, 1, 1, 1, 1,
-1.598189, -1.323306, -2.567306, 1, 1, 1, 1, 1,
-1.572004, -2.16646, -4.032128, 1, 1, 1, 1, 1,
-1.547716, -0.4546073, -3.009593, 1, 1, 1, 1, 1,
-1.528465, 1.190828, 0.7265006, 1, 1, 1, 1, 1,
-1.522705, 0.4928082, -1.172908, 1, 1, 1, 1, 1,
-1.51323, -1.450751, -4.15061, 1, 1, 1, 1, 1,
-1.507833, 1.720172, 0.3056218, 1, 1, 1, 1, 1,
-1.507516, 1.311931, -1.918917, 1, 1, 1, 1, 1,
-1.490306, 0.2009443, -1.255191, 1, 1, 1, 1, 1,
-1.489125, -0.1803575, -1.410971, 1, 1, 1, 1, 1,
-1.477359, 0.8493094, -2.956848, 0, 0, 1, 1, 1,
-1.477345, -1.50949, -0.5371662, 1, 0, 0, 1, 1,
-1.46838, -0.1272567, -1.608522, 1, 0, 0, 1, 1,
-1.462325, 0.6800688, -1.843037, 1, 0, 0, 1, 1,
-1.460419, -1.088566, -2.633132, 1, 0, 0, 1, 1,
-1.448213, 0.3935968, -1.594676, 1, 0, 0, 1, 1,
-1.441978, 0.8899775, -0.5591988, 0, 0, 0, 1, 1,
-1.437549, 2.012704, 1.079013, 0, 0, 0, 1, 1,
-1.419991, -0.8176332, -1.868481, 0, 0, 0, 1, 1,
-1.41845, 0.4732281, -0.2351073, 0, 0, 0, 1, 1,
-1.417353, -0.8795527, -1.855794, 0, 0, 0, 1, 1,
-1.414184, 1.681984, -1.0899, 0, 0, 0, 1, 1,
-1.407737, 1.946904, -2.391025, 0, 0, 0, 1, 1,
-1.386025, 0.2591417, -2.271008, 1, 1, 1, 1, 1,
-1.385853, -0.5888942, -2.839513, 1, 1, 1, 1, 1,
-1.382891, 0.5738615, -1.085132, 1, 1, 1, 1, 1,
-1.379887, 1.27719, -1.59779, 1, 1, 1, 1, 1,
-1.37655, 1.416909, -1.532572, 1, 1, 1, 1, 1,
-1.375031, 0.5348684, -1.87957, 1, 1, 1, 1, 1,
-1.370984, -1.153534, -2.815798, 1, 1, 1, 1, 1,
-1.367582, -0.4020782, -2.314535, 1, 1, 1, 1, 1,
-1.35941, 0.5835791, -1.406728, 1, 1, 1, 1, 1,
-1.35336, 0.4806315, -1.476702, 1, 1, 1, 1, 1,
-1.352612, -0.7708185, -1.61446, 1, 1, 1, 1, 1,
-1.352469, 2.854801, -1.375278, 1, 1, 1, 1, 1,
-1.351144, 0.7982414, -0.6711798, 1, 1, 1, 1, 1,
-1.333145, -0.8496897, -3.853237, 1, 1, 1, 1, 1,
-1.332955, -0.7697862, -1.430492, 1, 1, 1, 1, 1,
-1.329566, -0.2379545, -1.118735, 0, 0, 1, 1, 1,
-1.294493, -1.034871, -3.20464, 1, 0, 0, 1, 1,
-1.281628, -0.3611293, -2.747418, 1, 0, 0, 1, 1,
-1.272558, 0.0991838, 0.2030597, 1, 0, 0, 1, 1,
-1.264177, -0.09514229, -0.08725946, 1, 0, 0, 1, 1,
-1.256507, 0.09214349, 0.3465146, 1, 0, 0, 1, 1,
-1.25192, -0.182636, -1.375291, 0, 0, 0, 1, 1,
-1.248007, -0.9076241, -2.928192, 0, 0, 0, 1, 1,
-1.245305, -0.8023331, -3.385483, 0, 0, 0, 1, 1,
-1.240396, -1.657605, -2.928659, 0, 0, 0, 1, 1,
-1.236043, 2.269117, -2.202195, 0, 0, 0, 1, 1,
-1.226011, -0.2287968, -1.689419, 0, 0, 0, 1, 1,
-1.219157, -2.378883, -2.614829, 0, 0, 0, 1, 1,
-1.218822, -0.1071507, -1.334899, 1, 1, 1, 1, 1,
-1.195295, 1.942383, -0.7896186, 1, 1, 1, 1, 1,
-1.159721, -0.07626174, -1.672393, 1, 1, 1, 1, 1,
-1.156166, -1.477865, -3.912661, 1, 1, 1, 1, 1,
-1.15183, 0.6293022, -1.440317, 1, 1, 1, 1, 1,
-1.151688, 0.1468351, -2.430961, 1, 1, 1, 1, 1,
-1.143864, 1.062398, -1.804684, 1, 1, 1, 1, 1,
-1.141321, -0.0370822, -2.692951, 1, 1, 1, 1, 1,
-1.137784, -0.7005106, -1.079562, 1, 1, 1, 1, 1,
-1.137245, 0.1998835, 0.2754582, 1, 1, 1, 1, 1,
-1.134599, 2.530925, -0.5955806, 1, 1, 1, 1, 1,
-1.128702, 0.2444194, -3.493638, 1, 1, 1, 1, 1,
-1.128625, 0.3859384, -0.07657267, 1, 1, 1, 1, 1,
-1.127663, 0.1887814, -0.2641053, 1, 1, 1, 1, 1,
-1.124414, -0.4117225, -1.422696, 1, 1, 1, 1, 1,
-1.120946, 0.6313685, -1.246505, 0, 0, 1, 1, 1,
-1.119839, -0.03843801, -2.264107, 1, 0, 0, 1, 1,
-1.118041, 0.4982706, -1.948529, 1, 0, 0, 1, 1,
-1.115228, -0.2109873, -1.913196, 1, 0, 0, 1, 1,
-1.102432, 0.6339273, -0.121296, 1, 0, 0, 1, 1,
-1.101766, -0.6490425, -3.028097, 1, 0, 0, 1, 1,
-1.098403, 1.23371, -0.4037005, 0, 0, 0, 1, 1,
-1.097538, 0.307904, -2.03705, 0, 0, 0, 1, 1,
-1.096133, 1.244968, -1.290493, 0, 0, 0, 1, 1,
-1.094745, 0.1485496, -2.423541, 0, 0, 0, 1, 1,
-1.093188, -0.1962403, -1.827549, 0, 0, 0, 1, 1,
-1.088258, -1.103157, -1.969968, 0, 0, 0, 1, 1,
-1.084962, 1.526991, -0.9773779, 0, 0, 0, 1, 1,
-1.082522, -0.1486327, -1.353526, 1, 1, 1, 1, 1,
-1.080455, 0.5710872, 0.1625091, 1, 1, 1, 1, 1,
-1.07844, 0.01481915, -2.349604, 1, 1, 1, 1, 1,
-1.06876, -0.2367724, -2.097636, 1, 1, 1, 1, 1,
-1.063264, -0.900409, 0.1190755, 1, 1, 1, 1, 1,
-1.056441, 0.7698605, -1.605359, 1, 1, 1, 1, 1,
-1.050525, -1.201836, -2.151009, 1, 1, 1, 1, 1,
-1.041364, 1.066996, -0.6863433, 1, 1, 1, 1, 1,
-1.03679, -0.846848, -2.961371, 1, 1, 1, 1, 1,
-1.031261, 1.928759, -0.3106182, 1, 1, 1, 1, 1,
-1.030473, 0.5010621, -3.075684, 1, 1, 1, 1, 1,
-1.027284, -0.7239507, -2.561368, 1, 1, 1, 1, 1,
-1.026185, -0.5982736, -1.144827, 1, 1, 1, 1, 1,
-1.017948, -0.03911808, -1.680944, 1, 1, 1, 1, 1,
-1.017486, 0.1553365, -1.478101, 1, 1, 1, 1, 1,
-1.004744, -0.3773123, -2.098533, 0, 0, 1, 1, 1,
-1.004059, 0.4653382, -0.9235592, 1, 0, 0, 1, 1,
-1.002548, -0.4096224, -2.359443, 1, 0, 0, 1, 1,
-0.9957558, 1.644896, 0.2667224, 1, 0, 0, 1, 1,
-0.9935735, 0.6667647, -2.312824, 1, 0, 0, 1, 1,
-0.9902865, -0.9018717, -1.61011, 1, 0, 0, 1, 1,
-0.9875119, -1.00373, -3.829588, 0, 0, 0, 1, 1,
-0.9812503, -0.1761255, -0.6137611, 0, 0, 0, 1, 1,
-0.9755426, 0.117925, -2.821069, 0, 0, 0, 1, 1,
-0.9732684, -0.09793817, -2.250012, 0, 0, 0, 1, 1,
-0.96972, -0.8903683, -2.0856, 0, 0, 0, 1, 1,
-0.9668197, 0.5169595, 0.3992231, 0, 0, 0, 1, 1,
-0.9633155, 0.5401635, -0.3416458, 0, 0, 0, 1, 1,
-0.9559894, 1.129208, -0.2321801, 1, 1, 1, 1, 1,
-0.9530942, -1.177698, -1.536346, 1, 1, 1, 1, 1,
-0.9489776, 0.45532, -2.556522, 1, 1, 1, 1, 1,
-0.948707, -0.9859189, -2.582913, 1, 1, 1, 1, 1,
-0.9441976, -1.99568, -1.726126, 1, 1, 1, 1, 1,
-0.9327449, 1.957192, -1.550581, 1, 1, 1, 1, 1,
-0.9313931, 0.2289365, 1.45686, 1, 1, 1, 1, 1,
-0.9251748, 0.4098643, -0.09034664, 1, 1, 1, 1, 1,
-0.9206519, 0.141378, -0.8839543, 1, 1, 1, 1, 1,
-0.9197976, 0.9429712, -0.5683156, 1, 1, 1, 1, 1,
-0.9184619, -0.4277571, -2.327145, 1, 1, 1, 1, 1,
-0.890124, -0.3248547, -2.406423, 1, 1, 1, 1, 1,
-0.8860453, -0.1692414, -2.35713, 1, 1, 1, 1, 1,
-0.8849578, 0.1331984, -2.013145, 1, 1, 1, 1, 1,
-0.8845788, 0.1807491, -2.250004, 1, 1, 1, 1, 1,
-0.882659, -0.2664966, -1.216165, 0, 0, 1, 1, 1,
-0.8812581, -0.7222444, -1.511746, 1, 0, 0, 1, 1,
-0.8784763, -0.3751796, -0.7364724, 1, 0, 0, 1, 1,
-0.8741261, -0.2174675, -2.785209, 1, 0, 0, 1, 1,
-0.8700669, 0.5623554, 0.3097845, 1, 0, 0, 1, 1,
-0.8695951, 0.9563444, 1.478254, 1, 0, 0, 1, 1,
-0.8665174, 0.4773648, -1.639517, 0, 0, 0, 1, 1,
-0.8608847, 0.3417656, -3.411604, 0, 0, 0, 1, 1,
-0.8566688, -0.2590167, -2.128514, 0, 0, 0, 1, 1,
-0.8533421, -1.081108, -3.89335, 0, 0, 0, 1, 1,
-0.8504287, -1.685937, -4.135973, 0, 0, 0, 1, 1,
-0.8497896, -0.5191666, -2.22647, 0, 0, 0, 1, 1,
-0.8436095, -0.5196596, -2.021959, 0, 0, 0, 1, 1,
-0.8386913, -0.1949242, -2.485574, 1, 1, 1, 1, 1,
-0.8378516, 1.076723, -0.00331892, 1, 1, 1, 1, 1,
-0.8350039, -0.01961387, -1.611146, 1, 1, 1, 1, 1,
-0.8321479, 1.030489, -1.909301, 1, 1, 1, 1, 1,
-0.8319292, 0.7215314, 0.8833066, 1, 1, 1, 1, 1,
-0.8314984, 0.7182686, -3.048637, 1, 1, 1, 1, 1,
-0.8291965, 0.2090407, -2.568051, 1, 1, 1, 1, 1,
-0.8231973, -1.147004, -2.517637, 1, 1, 1, 1, 1,
-0.8230718, -0.2819814, -2.630532, 1, 1, 1, 1, 1,
-0.8181484, -0.3425294, -1.698808, 1, 1, 1, 1, 1,
-0.8144937, 1.347747, -0.1777774, 1, 1, 1, 1, 1,
-0.8091388, 0.02532786, -1.233144, 1, 1, 1, 1, 1,
-0.8085684, -0.3292068, -0.1583645, 1, 1, 1, 1, 1,
-0.8076062, -0.4194867, -1.448655, 1, 1, 1, 1, 1,
-0.7994889, -0.7844446, -2.967404, 1, 1, 1, 1, 1,
-0.7905135, -0.3818148, -0.6621857, 0, 0, 1, 1, 1,
-0.7886693, 0.0557321, -2.877391, 1, 0, 0, 1, 1,
-0.7885373, -0.2043857, -1.427119, 1, 0, 0, 1, 1,
-0.7872642, 0.3141417, -3.219261, 1, 0, 0, 1, 1,
-0.781272, -0.01529995, -2.47412, 1, 0, 0, 1, 1,
-0.7733039, 0.3845419, 0.4343129, 1, 0, 0, 1, 1,
-0.7629487, -1.103262, -0.4534089, 0, 0, 0, 1, 1,
-0.7628021, -0.3956464, -3.07178, 0, 0, 0, 1, 1,
-0.7593893, -0.7663469, -2.978911, 0, 0, 0, 1, 1,
-0.7512941, 0.02915079, -2.684717, 0, 0, 0, 1, 1,
-0.7475839, -0.5940455, -2.237129, 0, 0, 0, 1, 1,
-0.7471983, -0.6800877, -1.329594, 0, 0, 0, 1, 1,
-0.7424905, -0.09442224, -2.518964, 0, 0, 0, 1, 1,
-0.7391106, 0.176145, -0.04465421, 1, 1, 1, 1, 1,
-0.7375764, 0.4274647, 0.01981257, 1, 1, 1, 1, 1,
-0.7359049, -1.090153, -3.438787, 1, 1, 1, 1, 1,
-0.7339712, 0.9897583, -2.065172, 1, 1, 1, 1, 1,
-0.7324867, -0.4708021, -3.177866, 1, 1, 1, 1, 1,
-0.7279094, 1.507998, -0.5933759, 1, 1, 1, 1, 1,
-0.7266916, -0.1025203, -1.49963, 1, 1, 1, 1, 1,
-0.7264577, 0.1525151, -1.417031, 1, 1, 1, 1, 1,
-0.724616, 1.075929, -0.7026623, 1, 1, 1, 1, 1,
-0.7200077, -0.6932474, -2.881237, 1, 1, 1, 1, 1,
-0.7196424, 0.114344, -2.003403, 1, 1, 1, 1, 1,
-0.714937, 0.375561, -0.3899768, 1, 1, 1, 1, 1,
-0.7139381, -2.05674, -2.538872, 1, 1, 1, 1, 1,
-0.7066148, 0.9186948, -0.5310972, 1, 1, 1, 1, 1,
-0.7060905, -1.058762, -3.121801, 1, 1, 1, 1, 1,
-0.7028313, 0.4207172, -2.555672, 0, 0, 1, 1, 1,
-0.6999331, -0.3757938, -1.538137, 1, 0, 0, 1, 1,
-0.6991604, 1.448756, 0.1636515, 1, 0, 0, 1, 1,
-0.6849776, 1.563567, 0.03345189, 1, 0, 0, 1, 1,
-0.6792747, -1.836906, -1.109921, 1, 0, 0, 1, 1,
-0.6734856, -0.1431766, -2.966572, 1, 0, 0, 1, 1,
-0.6728517, 0.9904297, 0.8042099, 0, 0, 0, 1, 1,
-0.6703254, 0.429208, -1.566149, 0, 0, 0, 1, 1,
-0.6672575, 0.05196199, -3.669444, 0, 0, 0, 1, 1,
-0.6631967, -0.2240866, -1.152076, 0, 0, 0, 1, 1,
-0.6598653, 1.775652, -0.3121044, 0, 0, 0, 1, 1,
-0.6535728, -1.778816, -2.746535, 0, 0, 0, 1, 1,
-0.6532747, 0.7459562, 1.923743, 0, 0, 0, 1, 1,
-0.6514714, 0.7411534, 0.7267706, 1, 1, 1, 1, 1,
-0.6511773, -0.2507894, -0.8275321, 1, 1, 1, 1, 1,
-0.650423, 0.372693, -1.174288, 1, 1, 1, 1, 1,
-0.6436674, 1.765786, -2.189785, 1, 1, 1, 1, 1,
-0.6422435, -0.2332912, -1.522129, 1, 1, 1, 1, 1,
-0.6352296, 0.4680822, -1.325204, 1, 1, 1, 1, 1,
-0.6347089, 0.367007, -1.960398, 1, 1, 1, 1, 1,
-0.6303457, 0.1638926, -2.037581, 1, 1, 1, 1, 1,
-0.6293975, -0.2738954, -2.65617, 1, 1, 1, 1, 1,
-0.6272869, 1.414958, -0.2784235, 1, 1, 1, 1, 1,
-0.6263317, -2.164058, -3.262446, 1, 1, 1, 1, 1,
-0.6226237, -0.3647127, -2.204561, 1, 1, 1, 1, 1,
-0.6197304, -1.431023, -1.991069, 1, 1, 1, 1, 1,
-0.6195365, -0.6602256, -1.617622, 1, 1, 1, 1, 1,
-0.6162923, 0.0913775, -0.8911796, 1, 1, 1, 1, 1,
-0.6117776, -0.08871992, -0.9454741, 0, 0, 1, 1, 1,
-0.6091291, -0.1220178, -2.199297, 1, 0, 0, 1, 1,
-0.6072226, -0.001503194, -1.757697, 1, 0, 0, 1, 1,
-0.6057618, 0.1733989, -0.1255849, 1, 0, 0, 1, 1,
-0.5993922, -0.1072948, -1.568742, 1, 0, 0, 1, 1,
-0.5930182, 0.02729351, -2.920913, 1, 0, 0, 1, 1,
-0.5871661, -1.35541, -3.133527, 0, 0, 0, 1, 1,
-0.5800614, -0.9626263, -1.974683, 0, 0, 0, 1, 1,
-0.5784211, 1.811716, -0.07375459, 0, 0, 0, 1, 1,
-0.5775707, -0.7406853, -2.918339, 0, 0, 0, 1, 1,
-0.573433, -1.949131, -3.786945, 0, 0, 0, 1, 1,
-0.5688804, -0.9090208, -2.907682, 0, 0, 0, 1, 1,
-0.5688226, -0.7468055, -2.60866, 0, 0, 0, 1, 1,
-0.5665997, 1.172722, -0.857597, 1, 1, 1, 1, 1,
-0.5661156, 0.01370422, -0.5688658, 1, 1, 1, 1, 1,
-0.5655146, -0.8065578, -2.708574, 1, 1, 1, 1, 1,
-0.5653933, 1.734287, -0.2953965, 1, 1, 1, 1, 1,
-0.55579, 0.5821415, 0.8608417, 1, 1, 1, 1, 1,
-0.5535254, 0.9323186, -1.258332, 1, 1, 1, 1, 1,
-0.5502442, -0.3552728, -1.452461, 1, 1, 1, 1, 1,
-0.5486706, 0.1468728, -0.7685098, 1, 1, 1, 1, 1,
-0.5486335, 1.302393, -0.8263782, 1, 1, 1, 1, 1,
-0.5441138, 0.1783769, -1.162185, 1, 1, 1, 1, 1,
-0.5414711, -1.166193, -3.14462, 1, 1, 1, 1, 1,
-0.5345286, -0.1915686, -1.804958, 1, 1, 1, 1, 1,
-0.5344401, -0.6139485, -2.855438, 1, 1, 1, 1, 1,
-0.5326987, 1.01927, -1.24832, 1, 1, 1, 1, 1,
-0.5212169, -0.06144374, -2.231767, 1, 1, 1, 1, 1,
-0.5167264, 0.9137291, -0.9338191, 0, 0, 1, 1, 1,
-0.5104377, -0.3372889, -2.190217, 1, 0, 0, 1, 1,
-0.5094912, 0.3699241, -1.214382, 1, 0, 0, 1, 1,
-0.509073, -0.2266934, -2.27162, 1, 0, 0, 1, 1,
-0.5067357, 0.9310115, -0.7579313, 1, 0, 0, 1, 1,
-0.5061917, 0.5209156, -0.4800278, 1, 0, 0, 1, 1,
-0.5005409, 0.9468863, 0.9137809, 0, 0, 0, 1, 1,
-0.5000378, 1.425538, 0.1171155, 0, 0, 0, 1, 1,
-0.498732, 0.954511, 0.06898729, 0, 0, 0, 1, 1,
-0.4962127, 0.04247762, -3.084231, 0, 0, 0, 1, 1,
-0.4954643, 1.134708, 0.1958769, 0, 0, 0, 1, 1,
-0.4885948, 0.8493323, -1.080446, 0, 0, 0, 1, 1,
-0.4853809, 0.2715821, 0.2907781, 0, 0, 0, 1, 1,
-0.4837731, -0.3900749, -2.217646, 1, 1, 1, 1, 1,
-0.4817905, -0.3165357, -3.119225, 1, 1, 1, 1, 1,
-0.479413, 0.05442676, -1.55395, 1, 1, 1, 1, 1,
-0.4725511, -0.9777999, -3.846851, 1, 1, 1, 1, 1,
-0.4704674, -1.076518, -2.798584, 1, 1, 1, 1, 1,
-0.4669174, -1.436554, -2.580295, 1, 1, 1, 1, 1,
-0.4663821, 0.8328897, -1.138739, 1, 1, 1, 1, 1,
-0.4662124, 0.7687262, -0.1192543, 1, 1, 1, 1, 1,
-0.4661078, -0.1855936, -2.374006, 1, 1, 1, 1, 1,
-0.4652484, 0.953602, -0.2436707, 1, 1, 1, 1, 1,
-0.4633721, 0.4346104, -0.7076388, 1, 1, 1, 1, 1,
-0.4627769, -0.2907472, -3.670263, 1, 1, 1, 1, 1,
-0.4605048, 1.501592, -0.5964514, 1, 1, 1, 1, 1,
-0.4561118, 0.02146579, -0.3272459, 1, 1, 1, 1, 1,
-0.4502127, 0.1025363, -1.374108, 1, 1, 1, 1, 1,
-0.4457505, 1.683152, 0.2313894, 0, 0, 1, 1, 1,
-0.4408729, 1.540072, 0.6601513, 1, 0, 0, 1, 1,
-0.4326665, 0.2812138, -1.948146, 1, 0, 0, 1, 1,
-0.4303242, 1.154502, -0.3481948, 1, 0, 0, 1, 1,
-0.4277446, -0.1421525, -2.195873, 1, 0, 0, 1, 1,
-0.4270088, -0.9074155, -2.201514, 1, 0, 0, 1, 1,
-0.4265007, 0.5027506, -0.7703869, 0, 0, 0, 1, 1,
-0.4235379, 0.9337105, 0.8458738, 0, 0, 0, 1, 1,
-0.4119372, 1.535502, -0.2123261, 0, 0, 0, 1, 1,
-0.4112906, 0.6036219, -0.8353574, 0, 0, 0, 1, 1,
-0.4111004, -0.7827862, -1.502644, 0, 0, 0, 1, 1,
-0.4059061, 1.401679, -0.4837896, 0, 0, 0, 1, 1,
-0.4035563, -0.3903463, -2.942566, 0, 0, 0, 1, 1,
-0.3995904, -0.3809438, 0.7860958, 1, 1, 1, 1, 1,
-0.3937182, -0.05590219, -2.592792, 1, 1, 1, 1, 1,
-0.3919188, 0.7430465, -0.8862373, 1, 1, 1, 1, 1,
-0.3914502, -0.4515572, -2.280493, 1, 1, 1, 1, 1,
-0.3851577, 0.5024242, -3.234562, 1, 1, 1, 1, 1,
-0.384897, 0.4575028, -0.9559637, 1, 1, 1, 1, 1,
-0.3789347, -0.4150947, -2.625926, 1, 1, 1, 1, 1,
-0.3716392, 0.6104521, 1.546628, 1, 1, 1, 1, 1,
-0.3713706, -0.7035077, -2.694285, 1, 1, 1, 1, 1,
-0.3638756, -0.2095419, -1.470346, 1, 1, 1, 1, 1,
-0.3635998, -0.5557673, -1.765894, 1, 1, 1, 1, 1,
-0.3613511, 1.015191, 0.3377725, 1, 1, 1, 1, 1,
-0.3603312, 1.917227, -2.347875, 1, 1, 1, 1, 1,
-0.3601944, -0.06202094, -2.517073, 1, 1, 1, 1, 1,
-0.356718, 1.753772, -1.353543, 1, 1, 1, 1, 1,
-0.3546089, 0.4564157, -2.869076, 0, 0, 1, 1, 1,
-0.3518504, -0.8563222, -3.357433, 1, 0, 0, 1, 1,
-0.3510815, -0.7072588, -3.559752, 1, 0, 0, 1, 1,
-0.3484068, 0.7480343, -0.6786726, 1, 0, 0, 1, 1,
-0.347395, 1.512072, 0.8599283, 1, 0, 0, 1, 1,
-0.3454106, 1.228165, -0.2982157, 1, 0, 0, 1, 1,
-0.3435134, -0.5308986, -2.914611, 0, 0, 0, 1, 1,
-0.3410684, -0.6035138, -3.040613, 0, 0, 0, 1, 1,
-0.3399502, -0.7335146, -2.54337, 0, 0, 0, 1, 1,
-0.3389606, -0.3698754, -0.05783902, 0, 0, 0, 1, 1,
-0.3367534, -0.6458527, -2.122484, 0, 0, 0, 1, 1,
-0.3358347, -0.2645678, -0.8061646, 0, 0, 0, 1, 1,
-0.3333881, -1.974637, -2.15072, 0, 0, 0, 1, 1,
-0.3308498, 0.8128988, 1.629239, 1, 1, 1, 1, 1,
-0.3281195, -0.1204202, -2.434014, 1, 1, 1, 1, 1,
-0.3180861, 0.3849277, 0.4471715, 1, 1, 1, 1, 1,
-0.3173602, -0.8248923, -2.244981, 1, 1, 1, 1, 1,
-0.3125012, 1.049432, 1.605226, 1, 1, 1, 1, 1,
-0.311557, 1.239676, 0.1278744, 1, 1, 1, 1, 1,
-0.3087495, 0.4851421, 1.274948, 1, 1, 1, 1, 1,
-0.3060996, -2.467694, -3.506847, 1, 1, 1, 1, 1,
-0.3056068, 1.546885, 0.7299354, 1, 1, 1, 1, 1,
-0.3044839, 0.0457685, -1.54498, 1, 1, 1, 1, 1,
-0.3028962, -0.05824153, -0.9922258, 1, 1, 1, 1, 1,
-0.3028913, 0.9652976, -0.3185404, 1, 1, 1, 1, 1,
-0.2954798, -0.2679917, -2.077933, 1, 1, 1, 1, 1,
-0.2934492, 1.539171, 0.6758907, 1, 1, 1, 1, 1,
-0.289024, 0.09571288, -1.659716, 1, 1, 1, 1, 1,
-0.2837006, 1.310748, -0.2689608, 0, 0, 1, 1, 1,
-0.2823799, 0.5774081, -2.221784, 1, 0, 0, 1, 1,
-0.2793758, -1.28471, -3.625619, 1, 0, 0, 1, 1,
-0.2791966, -0.001699457, -1.213123, 1, 0, 0, 1, 1,
-0.2781705, -0.5396084, -1.846097, 1, 0, 0, 1, 1,
-0.2759999, 0.2974734, -1.282291, 1, 0, 0, 1, 1,
-0.2758909, -1.731022, -2.877578, 0, 0, 0, 1, 1,
-0.2749799, -0.732474, -2.249776, 0, 0, 0, 1, 1,
-0.2712614, 1.022864, 0.459507, 0, 0, 0, 1, 1,
-0.2670815, -1.165622, -4.488273, 0, 0, 0, 1, 1,
-0.2617292, 0.9599305, 0.09694616, 0, 0, 0, 1, 1,
-0.2610221, 1.003321, -1.820778, 0, 0, 0, 1, 1,
-0.2546455, -1.188151, -2.117478, 0, 0, 0, 1, 1,
-0.2531268, -0.7745728, -1.09762, 1, 1, 1, 1, 1,
-0.2528185, -0.7199031, -2.567244, 1, 1, 1, 1, 1,
-0.2519844, -0.8847443, -3.187766, 1, 1, 1, 1, 1,
-0.2511595, -0.4263117, -3.902872, 1, 1, 1, 1, 1,
-0.2454386, -0.6716146, -1.806317, 1, 1, 1, 1, 1,
-0.2449892, -1.0299, -1.802196, 1, 1, 1, 1, 1,
-0.2433683, -2.565855, -2.193687, 1, 1, 1, 1, 1,
-0.2389719, 0.499268, -0.546571, 1, 1, 1, 1, 1,
-0.2362147, 0.07093298, -3.981639, 1, 1, 1, 1, 1,
-0.2265214, -0.9566242, -3.089616, 1, 1, 1, 1, 1,
-0.2263991, 0.05877166, -0.9464058, 1, 1, 1, 1, 1,
-0.2250791, -2.026749, -1.228009, 1, 1, 1, 1, 1,
-0.2233799, -1.625299, -4.524027, 1, 1, 1, 1, 1,
-0.2204571, -0.410771, -4.178312, 1, 1, 1, 1, 1,
-0.2185591, -0.9002135, -2.045775, 1, 1, 1, 1, 1,
-0.2094765, -0.7914466, -4.77329, 0, 0, 1, 1, 1,
-0.2045238, 1.850991, 0.6681417, 1, 0, 0, 1, 1,
-0.2031302, 1.578118, -0.1148993, 1, 0, 0, 1, 1,
-0.1977563, 1.026316, -1.02621, 1, 0, 0, 1, 1,
-0.1956077, 0.6926962, 1.176707, 1, 0, 0, 1, 1,
-0.1929556, -0.746371, 0.04450801, 1, 0, 0, 1, 1,
-0.1921935, 0.06018661, -2.234525, 0, 0, 0, 1, 1,
-0.1907417, -0.7886542, -3.576457, 0, 0, 0, 1, 1,
-0.1885097, -0.5739452, -3.415556, 0, 0, 0, 1, 1,
-0.1844593, 0.04308803, -2.070195, 0, 0, 0, 1, 1,
-0.1823065, 0.3988895, 1.235486, 0, 0, 0, 1, 1,
-0.1765309, -0.2779949, -3.030164, 0, 0, 0, 1, 1,
-0.1738118, 1.136685, -1.336, 0, 0, 0, 1, 1,
-0.1687174, -1.067026, -1.826983, 1, 1, 1, 1, 1,
-0.1685647, -0.2418467, -2.312062, 1, 1, 1, 1, 1,
-0.1671098, 1.382917, 0.1672851, 1, 1, 1, 1, 1,
-0.1668505, -0.5540351, -3.396427, 1, 1, 1, 1, 1,
-0.1606021, -1.666615, -4.437184, 1, 1, 1, 1, 1,
-0.1580061, -1.784508, -3.715331, 1, 1, 1, 1, 1,
-0.1564145, -0.4256628, -2.101317, 1, 1, 1, 1, 1,
-0.1557687, -0.2902419, -4.367136, 1, 1, 1, 1, 1,
-0.1553021, 0.3700608, 0.5663792, 1, 1, 1, 1, 1,
-0.152376, -0.06657659, 0.5380598, 1, 1, 1, 1, 1,
-0.1497604, 0.3172984, -0.4378099, 1, 1, 1, 1, 1,
-0.1442334, 0.08311206, -1.620062, 1, 1, 1, 1, 1,
-0.1433748, 1.726848, 0.8331792, 1, 1, 1, 1, 1,
-0.1417529, -0.9465359, -2.498054, 1, 1, 1, 1, 1,
-0.1339757, -0.2127594, -3.108104, 1, 1, 1, 1, 1,
-0.1334893, 0.43145, 0.6420977, 0, 0, 1, 1, 1,
-0.1325912, 0.1521055, 0.3087886, 1, 0, 0, 1, 1,
-0.1261258, 0.5323283, -0.9456574, 1, 0, 0, 1, 1,
-0.1257043, -0.8180267, -4.233619, 1, 0, 0, 1, 1,
-0.1229149, 0.2459585, 0.3796115, 1, 0, 0, 1, 1,
-0.1222393, 0.2566299, -0.1959682, 1, 0, 0, 1, 1,
-0.1209087, 1.615332, -1.037446, 0, 0, 0, 1, 1,
-0.1200098, 0.07422712, -1.619951, 0, 0, 0, 1, 1,
-0.1183383, -0.6846326, -4.210832, 0, 0, 0, 1, 1,
-0.1175145, -0.03060533, -0.7414809, 0, 0, 0, 1, 1,
-0.1122812, -0.1911703, -2.573995, 0, 0, 0, 1, 1,
-0.1097, -0.5822104, -3.534772, 0, 0, 0, 1, 1,
-0.107237, -0.07877279, -3.688685, 0, 0, 0, 1, 1,
-0.1060413, -0.7857856, -2.857309, 1, 1, 1, 1, 1,
-0.1056631, -0.4912453, -2.287667, 1, 1, 1, 1, 1,
-0.1043072, 0.6228932, 0.1418494, 1, 1, 1, 1, 1,
-0.1035669, 0.788066, -1.020454, 1, 1, 1, 1, 1,
-0.1017229, -0.1315347, -2.080952, 1, 1, 1, 1, 1,
-0.1013488, 1.003365, 0.2953366, 1, 1, 1, 1, 1,
-0.09800281, 0.4798345, -2.32794, 1, 1, 1, 1, 1,
-0.09190807, -1.098529, -3.178951, 1, 1, 1, 1, 1,
-0.07889875, 1.011334, 0.9324251, 1, 1, 1, 1, 1,
-0.07791983, 0.5181587, 2.007683, 1, 1, 1, 1, 1,
-0.07716492, 0.6454411, 1.008591, 1, 1, 1, 1, 1,
-0.07149252, -0.2139819, -1.422844, 1, 1, 1, 1, 1,
-0.06814101, 0.8788793, -0.5646172, 1, 1, 1, 1, 1,
-0.06394503, 0.4545362, 0.7995132, 1, 1, 1, 1, 1,
-0.06247927, 1.294987, 0.451427, 1, 1, 1, 1, 1,
-0.06232594, -1.074448, -4.84927, 0, 0, 1, 1, 1,
-0.06055359, -0.8461174, -2.771053, 1, 0, 0, 1, 1,
-0.0598802, -0.60317, -2.413544, 1, 0, 0, 1, 1,
-0.05748736, 2.492625, -0.9506855, 1, 0, 0, 1, 1,
-0.05658712, 0.2787639, 0.0994667, 1, 0, 0, 1, 1,
-0.05644056, -2.005279, -2.710352, 1, 0, 0, 1, 1,
-0.05639814, 1.390531, 0.00321346, 0, 0, 0, 1, 1,
-0.05489677, -0.04470569, -2.984698, 0, 0, 0, 1, 1,
-0.05313654, -0.580497, -3.504654, 0, 0, 0, 1, 1,
-0.04975878, -0.9087899, -4.882479, 0, 0, 0, 1, 1,
-0.03716388, -1.262071, -2.239116, 0, 0, 0, 1, 1,
-0.03136563, -0.6661584, -4.404661, 0, 0, 0, 1, 1,
-0.0294475, 0.5358962, -2.279663, 0, 0, 0, 1, 1,
-0.02927827, -0.9775177, -2.683766, 1, 1, 1, 1, 1,
-0.02915607, -0.05806847, -3.456161, 1, 1, 1, 1, 1,
-0.02872507, 0.1706802, -0.08223705, 1, 1, 1, 1, 1,
-0.02839467, 1.557726, 0.7543133, 1, 1, 1, 1, 1,
-0.02296099, -0.003066387, -2.759317, 1, 1, 1, 1, 1,
-0.0173959, 0.1518483, -0.1378016, 1, 1, 1, 1, 1,
-0.01690642, 0.2051819, -1.780765, 1, 1, 1, 1, 1,
-0.01661426, -0.05782854, -1.750994, 1, 1, 1, 1, 1,
-0.01648419, -1.316849, -1.270327, 1, 1, 1, 1, 1,
-0.01366209, 2.080277, 0.8410463, 1, 1, 1, 1, 1,
-0.008162045, 0.4487036, -0.5376476, 1, 1, 1, 1, 1,
-0.006259119, -0.1511325, -3.13535, 1, 1, 1, 1, 1,
-0.005862643, -0.4189972, -2.680974, 1, 1, 1, 1, 1,
-0.003798577, -0.8531764, -3.709201, 1, 1, 1, 1, 1,
0.0003465984, 0.1217288, -0.9569327, 1, 1, 1, 1, 1,
0.001908534, -2.170172, 2.273777, 0, 0, 1, 1, 1,
0.006122595, -0.1078998, 4.399837, 1, 0, 0, 1, 1,
0.007004656, -1.680389, 3.557381, 1, 0, 0, 1, 1,
0.007640413, 2.180028, 0.6227403, 1, 0, 0, 1, 1,
0.0122427, 0.4789814, -1.973113, 1, 0, 0, 1, 1,
0.01367217, -1.045699, 2.496239, 1, 0, 0, 1, 1,
0.01647826, 3.726373, 1.818645, 0, 0, 0, 1, 1,
0.01760056, 1.39888, -0.5940377, 0, 0, 0, 1, 1,
0.02122309, -0.6094617, 3.639924, 0, 0, 0, 1, 1,
0.02453243, 1.492592, 0.3281043, 0, 0, 0, 1, 1,
0.02675801, 1.472274, -1.543964, 0, 0, 0, 1, 1,
0.02766879, 2.210518, -0.002926106, 0, 0, 0, 1, 1,
0.02926758, -1.321499, 1.981878, 0, 0, 0, 1, 1,
0.03048864, -0.3033518, 3.980973, 1, 1, 1, 1, 1,
0.03403974, -1.720793, 1.798669, 1, 1, 1, 1, 1,
0.03891449, -1.586225, 3.377931, 1, 1, 1, 1, 1,
0.03979478, -0.5085021, 1.263755, 1, 1, 1, 1, 1,
0.0412027, -0.200081, 2.263038, 1, 1, 1, 1, 1,
0.04431519, -1.321992, 2.665923, 1, 1, 1, 1, 1,
0.04847857, 1.429052, -0.8079923, 1, 1, 1, 1, 1,
0.05004359, 0.6164552, 0.4378436, 1, 1, 1, 1, 1,
0.05380346, 0.7157215, 1.662133, 1, 1, 1, 1, 1,
0.05858447, 0.039072, 1.726047, 1, 1, 1, 1, 1,
0.06298576, 1.184178, 0.3031308, 1, 1, 1, 1, 1,
0.06384107, -0.7220349, -0.3135805, 1, 1, 1, 1, 1,
0.06760737, 1.753193, 1.359457, 1, 1, 1, 1, 1,
0.07127556, -0.6873937, 1.80058, 1, 1, 1, 1, 1,
0.07413758, 0.2378896, 0.6410527, 1, 1, 1, 1, 1,
0.07920586, 1.512955, -0.2195046, 0, 0, 1, 1, 1,
0.08253156, -0.6098325, 2.852274, 1, 0, 0, 1, 1,
0.08534393, 0.2678002, 0.8391885, 1, 0, 0, 1, 1,
0.08659866, -2.504643, 1.264219, 1, 0, 0, 1, 1,
0.08678106, 0.3930942, 1.012055, 1, 0, 0, 1, 1,
0.0898952, -0.1275681, 4.504576, 1, 0, 0, 1, 1,
0.09103323, -1.144803, 1.674454, 0, 0, 0, 1, 1,
0.09159186, 1.454772, 1.280931, 0, 0, 0, 1, 1,
0.09802561, -0.6308945, 2.027915, 0, 0, 0, 1, 1,
0.09856711, -0.4889051, 1.415492, 0, 0, 0, 1, 1,
0.09954215, -0.04364692, 2.494565, 0, 0, 0, 1, 1,
0.1000533, -0.265217, 3.593449, 0, 0, 0, 1, 1,
0.1009631, -1.261274, 2.924875, 0, 0, 0, 1, 1,
0.1023397, 2.280874, -0.9831757, 1, 1, 1, 1, 1,
0.1048881, 1.885924, -0.09179791, 1, 1, 1, 1, 1,
0.1071636, 2.706712, -1.140946, 1, 1, 1, 1, 1,
0.1072221, -0.09251518, 2.747608, 1, 1, 1, 1, 1,
0.1072834, -1.368746, 4.547434, 1, 1, 1, 1, 1,
0.1075506, -0.6629966, 2.84818, 1, 1, 1, 1, 1,
0.1095558, -0.5055338, 2.739677, 1, 1, 1, 1, 1,
0.1118153, -1.682551, 3.793814, 1, 1, 1, 1, 1,
0.1126286, 0.254063, 0.9436797, 1, 1, 1, 1, 1,
0.1169446, -0.5366788, 2.092735, 1, 1, 1, 1, 1,
0.1173626, 0.5587716, 1.381097, 1, 1, 1, 1, 1,
0.1179974, -0.3395126, 1.894015, 1, 1, 1, 1, 1,
0.1298372, 0.503657, 0.2005775, 1, 1, 1, 1, 1,
0.1327886, -1.349486, 5.156984, 1, 1, 1, 1, 1,
0.1335493, -1.461296, 4.18703, 1, 1, 1, 1, 1,
0.1362171, -1.422254, 2.78594, 0, 0, 1, 1, 1,
0.1401194, -1.570525, 4.192226, 1, 0, 0, 1, 1,
0.1434586, 1.409046, 0.5256784, 1, 0, 0, 1, 1,
0.1444732, 0.5661339, 0.389273, 1, 0, 0, 1, 1,
0.1453757, -0.1530819, 3.032039, 1, 0, 0, 1, 1,
0.1454123, 0.2858028, 0.1824513, 1, 0, 0, 1, 1,
0.1458845, 1.788954, 0.4602059, 0, 0, 0, 1, 1,
0.1461307, 0.6601856, 2.257745, 0, 0, 0, 1, 1,
0.1474207, -0.2731158, 2.648527, 0, 0, 0, 1, 1,
0.1481968, 0.8292928, -0.6470939, 0, 0, 0, 1, 1,
0.1495917, -0.07705723, 3.3363, 0, 0, 0, 1, 1,
0.1495925, 0.04913894, 0.04648865, 0, 0, 0, 1, 1,
0.1578903, -0.7870871, 3.681204, 0, 0, 0, 1, 1,
0.1583959, -0.133167, 1.578035, 1, 1, 1, 1, 1,
0.1636456, -1.11793, 1.144755, 1, 1, 1, 1, 1,
0.167635, -0.8462378, 3.159139, 1, 1, 1, 1, 1,
0.1697035, -0.6045792, 4.293767, 1, 1, 1, 1, 1,
0.1730087, 0.4270478, 1.182181, 1, 1, 1, 1, 1,
0.1756733, 0.9778227, -0.05328437, 1, 1, 1, 1, 1,
0.1777544, -0.2608459, 2.778731, 1, 1, 1, 1, 1,
0.1779298, -0.875958, 2.425381, 1, 1, 1, 1, 1,
0.1786438, 1.043871, -0.7612315, 1, 1, 1, 1, 1,
0.1814922, 0.3024344, -0.2169248, 1, 1, 1, 1, 1,
0.1823316, 0.8361564, -0.3963232, 1, 1, 1, 1, 1,
0.2004557, 0.3603586, 0.803779, 1, 1, 1, 1, 1,
0.204631, -0.2629912, 1.465524, 1, 1, 1, 1, 1,
0.2048784, -1.457969, 4.103303, 1, 1, 1, 1, 1,
0.2052392, 0.6201649, -0.6591424, 1, 1, 1, 1, 1,
0.2062415, -2.360233, 1.353309, 0, 0, 1, 1, 1,
0.2077883, 0.1876619, 1.233202, 1, 0, 0, 1, 1,
0.2080717, 1.780472, -0.7213897, 1, 0, 0, 1, 1,
0.2086427, 0.4114219, -1.447559, 1, 0, 0, 1, 1,
0.21048, -0.4491174, 3.099477, 1, 0, 0, 1, 1,
0.2121369, 0.7211092, 0.7921516, 1, 0, 0, 1, 1,
0.2162013, 0.552185, 0.9050464, 0, 0, 0, 1, 1,
0.2234577, 0.9649689, 2.237786, 0, 0, 0, 1, 1,
0.225169, -1.491408, 2.746467, 0, 0, 0, 1, 1,
0.2260028, -0.6216309, 2.460682, 0, 0, 0, 1, 1,
0.2263402, -0.4567084, 1.064951, 0, 0, 0, 1, 1,
0.2271341, -0.5746942, 3.565878, 0, 0, 0, 1, 1,
0.2285788, -0.109296, 0.6553193, 0, 0, 0, 1, 1,
0.2296768, -0.7660534, 3.705373, 1, 1, 1, 1, 1,
0.2297157, 0.8804857, 1.46471, 1, 1, 1, 1, 1,
0.2332159, 1.093958, -0.9162816, 1, 1, 1, 1, 1,
0.2370245, -0.6895046, 3.448319, 1, 1, 1, 1, 1,
0.2371854, 0.2902789, 0.8246629, 1, 1, 1, 1, 1,
0.2403778, -0.02650726, 2.017594, 1, 1, 1, 1, 1,
0.2420834, 0.6748947, 1.068738, 1, 1, 1, 1, 1,
0.2421794, 0.4022402, 1.543224, 1, 1, 1, 1, 1,
0.2470522, 0.3999591, -0.2772557, 1, 1, 1, 1, 1,
0.2551719, 1.503976, -0.5151049, 1, 1, 1, 1, 1,
0.2592151, -0.4502906, 4.205297, 1, 1, 1, 1, 1,
0.2681123, 0.828196, 0.4446447, 1, 1, 1, 1, 1,
0.2749435, -0.2243382, 3.211756, 1, 1, 1, 1, 1,
0.2749683, -1.157864, 3.300776, 1, 1, 1, 1, 1,
0.2756344, 2.019926, 1.758063, 1, 1, 1, 1, 1,
0.2770114, 0.03157768, 1.040826, 0, 0, 1, 1, 1,
0.2825631, -0.5060596, 0.7656946, 1, 0, 0, 1, 1,
0.2830972, -1.376822, 3.246545, 1, 0, 0, 1, 1,
0.2834964, 1.143223, 0.1874988, 1, 0, 0, 1, 1,
0.2836927, -0.2290004, 2.32819, 1, 0, 0, 1, 1,
0.2870269, 0.4350362, 0.4841093, 1, 0, 0, 1, 1,
0.289097, -0.8141077, 3.264957, 0, 0, 0, 1, 1,
0.2981678, 0.2098364, 0.009461491, 0, 0, 0, 1, 1,
0.2987807, -0.9153486, 4.44098, 0, 0, 0, 1, 1,
0.3104194, -0.410427, 2.190057, 0, 0, 0, 1, 1,
0.3136894, 0.5811018, -0.09007808, 0, 0, 0, 1, 1,
0.3138584, 1.600479, 0.8678969, 0, 0, 0, 1, 1,
0.3143441, 0.4678918, 1.519648, 0, 0, 0, 1, 1,
0.3152552, 0.06418505, 3.599743, 1, 1, 1, 1, 1,
0.3177898, -0.2271471, 1.209389, 1, 1, 1, 1, 1,
0.3184333, -1.02282, 2.158138, 1, 1, 1, 1, 1,
0.3185782, -0.8735068, 4.12436, 1, 1, 1, 1, 1,
0.3213103, 1.322747, 0.8028384, 1, 1, 1, 1, 1,
0.3224131, 0.01255288, 0.9467365, 1, 1, 1, 1, 1,
0.3230678, -1.739141, 4.794296, 1, 1, 1, 1, 1,
0.3242991, 2.425502, -0.4427305, 1, 1, 1, 1, 1,
0.3247268, 0.06256472, 2.309925, 1, 1, 1, 1, 1,
0.325971, -0.5440239, 3.009239, 1, 1, 1, 1, 1,
0.3269973, -0.1234598, 1.783152, 1, 1, 1, 1, 1,
0.3278596, 0.1615026, 0.4887958, 1, 1, 1, 1, 1,
0.3336498, -1.991736, 3.046744, 1, 1, 1, 1, 1,
0.3346996, 1.189535, 2.124521, 1, 1, 1, 1, 1,
0.3373, 0.4522097, 1.002234, 1, 1, 1, 1, 1,
0.3397636, 0.006707722, 0.5413082, 0, 0, 1, 1, 1,
0.3409584, -0.4298093, 0.7958614, 1, 0, 0, 1, 1,
0.3483582, 0.68457, -0.7416454, 1, 0, 0, 1, 1,
0.3485815, -0.4751287, 2.606832, 1, 0, 0, 1, 1,
0.3500585, -1.547331, 1.339672, 1, 0, 0, 1, 1,
0.3503631, -0.6474574, 2.096174, 1, 0, 0, 1, 1,
0.3504317, 1.192458, 1.118378, 0, 0, 0, 1, 1,
0.3506973, -0.2168875, 0.6033494, 0, 0, 0, 1, 1,
0.351163, 0.2487795, -0.9308925, 0, 0, 0, 1, 1,
0.3540982, -0.8757412, 1.96982, 0, 0, 0, 1, 1,
0.3575663, 1.450892, -0.9988443, 0, 0, 0, 1, 1,
0.3646992, -1.363884, 3.096738, 0, 0, 0, 1, 1,
0.3664737, -0.1228409, 4.016246, 0, 0, 0, 1, 1,
0.3669671, 1.008974, 2.104226, 1, 1, 1, 1, 1,
0.3787958, 0.8120403, 0.6830267, 1, 1, 1, 1, 1,
0.3798419, -0.7077103, 2.235305, 1, 1, 1, 1, 1,
0.3803379, 2.162513, 0.7874325, 1, 1, 1, 1, 1,
0.3857983, 1.781092, 1.194472, 1, 1, 1, 1, 1,
0.3871183, -0.709353, 2.812619, 1, 1, 1, 1, 1,
0.3873516, 1.098383, -0.1509213, 1, 1, 1, 1, 1,
0.3907528, 0.6452679, 1.104419, 1, 1, 1, 1, 1,
0.3916347, -1.134398, 3.118444, 1, 1, 1, 1, 1,
0.3952582, -0.3106222, 2.424839, 1, 1, 1, 1, 1,
0.395265, -0.5219521, 3.184914, 1, 1, 1, 1, 1,
0.3978337, 0.9598852, -1.90849, 1, 1, 1, 1, 1,
0.4045608, 0.1740863, 2.147635, 1, 1, 1, 1, 1,
0.407144, -0.1400435, 2.264243, 1, 1, 1, 1, 1,
0.4140936, 1.676026, 1.711593, 1, 1, 1, 1, 1,
0.4142749, 0.5297248, 1.546056, 0, 0, 1, 1, 1,
0.4153298, 1.133772, 0.6395984, 1, 0, 0, 1, 1,
0.4155857, -1.103199, 1.87353, 1, 0, 0, 1, 1,
0.4184147, -0.367099, 3.637609, 1, 0, 0, 1, 1,
0.4187221, -1.075512, 2.630924, 1, 0, 0, 1, 1,
0.4206651, -0.5453029, 2.624098, 1, 0, 0, 1, 1,
0.4218722, -2.24519, 3.635694, 0, 0, 0, 1, 1,
0.423898, -0.4937014, 2.669871, 0, 0, 0, 1, 1,
0.4248236, -0.3464162, 1.992603, 0, 0, 0, 1, 1,
0.4253052, -0.8771303, 1.819619, 0, 0, 0, 1, 1,
0.4312657, -0.1915495, 1.385099, 0, 0, 0, 1, 1,
0.4352834, 0.6509033, 0.437755, 0, 0, 0, 1, 1,
0.4367607, 1.642362, 0.3690424, 0, 0, 0, 1, 1,
0.4370149, 0.8103949, 0.1757781, 1, 1, 1, 1, 1,
0.4372247, 3.030464, -0.6897411, 1, 1, 1, 1, 1,
0.4374408, 1.0976, 1.164651, 1, 1, 1, 1, 1,
0.4429922, -3.096789, 3.45384, 1, 1, 1, 1, 1,
0.4434707, 0.2929466, 2.258883, 1, 1, 1, 1, 1,
0.4473652, 0.06167421, 1.205586, 1, 1, 1, 1, 1,
0.4575121, 0.2869492, 1.028567, 1, 1, 1, 1, 1,
0.4576153, 1.00158, 0.5232689, 1, 1, 1, 1, 1,
0.4576282, 2.193658, 1.378271, 1, 1, 1, 1, 1,
0.4578724, 0.4979148, 0.4255575, 1, 1, 1, 1, 1,
0.4681868, -1.302235, 3.42763, 1, 1, 1, 1, 1,
0.4715964, 1.574588, 1.263983, 1, 1, 1, 1, 1,
0.4724106, 1.309982, 1.255694, 1, 1, 1, 1, 1,
0.4734124, -1.513287, 2.984636, 1, 1, 1, 1, 1,
0.473945, 1.878012, -2.391886, 1, 1, 1, 1, 1,
0.4753685, -0.3748359, 2.320814, 0, 0, 1, 1, 1,
0.4759936, -1.234335, 2.001747, 1, 0, 0, 1, 1,
0.4773663, -2.553911, 1.623053, 1, 0, 0, 1, 1,
0.4779505, -1.145929, 1.623585, 1, 0, 0, 1, 1,
0.4803884, -1.042015, 3.922998, 1, 0, 0, 1, 1,
0.4818587, 0.9541286, -0.9213609, 1, 0, 0, 1, 1,
0.4832524, 0.07026543, -0.2142501, 0, 0, 0, 1, 1,
0.4897082, -2.202056, 2.897479, 0, 0, 0, 1, 1,
0.4912197, 0.6707102, 1.530049, 0, 0, 0, 1, 1,
0.4913635, 0.4750679, 0.1157428, 0, 0, 0, 1, 1,
0.4914232, 0.891838, -0.7352374, 0, 0, 0, 1, 1,
0.4931664, -1.211563, 1.22055, 0, 0, 0, 1, 1,
0.4944007, -1.147344, 1.248057, 0, 0, 0, 1, 1,
0.5004267, 0.3052469, 0.9264668, 1, 1, 1, 1, 1,
0.500557, -1.714988, 3.485353, 1, 1, 1, 1, 1,
0.5016093, 0.8008358, -1.110721, 1, 1, 1, 1, 1,
0.5022948, 2.049255, 0.6981189, 1, 1, 1, 1, 1,
0.5042891, -1.124873, 2.389187, 1, 1, 1, 1, 1,
0.5063786, 1.045242, 0.8677725, 1, 1, 1, 1, 1,
0.5085008, 1.101788, 0.5625733, 1, 1, 1, 1, 1,
0.509403, 0.6342924, 3.829021, 1, 1, 1, 1, 1,
0.5148928, 2.309441, -0.449258, 1, 1, 1, 1, 1,
0.5156179, 0.1908382, 1.442748, 1, 1, 1, 1, 1,
0.515982, 1.565777, 0.4231517, 1, 1, 1, 1, 1,
0.5180544, -0.5767693, 2.205456, 1, 1, 1, 1, 1,
0.5230501, 0.9992656, -0.4831131, 1, 1, 1, 1, 1,
0.5240588, -0.3003442, 2.32737, 1, 1, 1, 1, 1,
0.5263615, -0.1879522, 1.255556, 1, 1, 1, 1, 1,
0.527193, -0.888777, 3.958617, 0, 0, 1, 1, 1,
0.5293573, 1.503189, -0.3948254, 1, 0, 0, 1, 1,
0.5346538, 0.2711768, 1.773757, 1, 0, 0, 1, 1,
0.5348611, -0.2544898, 1.145414, 1, 0, 0, 1, 1,
0.5373504, 0.675036, 1.314737, 1, 0, 0, 1, 1,
0.538621, -1.436602, 2.167167, 1, 0, 0, 1, 1,
0.5424167, -0.8211489, 2.863457, 0, 0, 0, 1, 1,
0.5432596, 0.2415139, 1.805242, 0, 0, 0, 1, 1,
0.5460004, 0.7874218, 1.965346, 0, 0, 0, 1, 1,
0.5540201, 0.09277394, 0.8537614, 0, 0, 0, 1, 1,
0.554947, -0.5201585, 4.232066, 0, 0, 0, 1, 1,
0.560302, -1.156413, 3.231317, 0, 0, 0, 1, 1,
0.5605617, -0.409519, 1.72659, 0, 0, 0, 1, 1,
0.5648085, 2.180255, 1.430917, 1, 1, 1, 1, 1,
0.5667099, -0.3044614, 1.535707, 1, 1, 1, 1, 1,
0.5761505, 1.194752, -0.0365359, 1, 1, 1, 1, 1,
0.5766119, 0.5445827, 0.8483096, 1, 1, 1, 1, 1,
0.5793866, -1.30135, 1.677966, 1, 1, 1, 1, 1,
0.5918497, -0.5395198, 2.584904, 1, 1, 1, 1, 1,
0.5927686, -0.7188048, 3.366812, 1, 1, 1, 1, 1,
0.6002994, 0.01067286, 1.650502, 1, 1, 1, 1, 1,
0.6057543, 1.355661, 1.513482, 1, 1, 1, 1, 1,
0.6060333, 0.07910391, 3.129912, 1, 1, 1, 1, 1,
0.6129197, 0.005387519, 1.593979, 1, 1, 1, 1, 1,
0.6129863, 1.03973, 0.1778848, 1, 1, 1, 1, 1,
0.6191533, -0.04008953, 1.943258, 1, 1, 1, 1, 1,
0.6237493, 1.41862, 0.5095786, 1, 1, 1, 1, 1,
0.6248261, -0.3197426, 3.599132, 1, 1, 1, 1, 1,
0.6248455, 1.168219, -0.1766093, 0, 0, 1, 1, 1,
0.62651, -0.4504354, 3.097968, 1, 0, 0, 1, 1,
0.6332383, -1.233956, 3.135436, 1, 0, 0, 1, 1,
0.6335244, -1.088311, 2.657232, 1, 0, 0, 1, 1,
0.6423265, 0.003861197, 3.03847, 1, 0, 0, 1, 1,
0.6476545, -0.5287376, 2.127905, 1, 0, 0, 1, 1,
0.6476553, 0.002010133, 0.5782234, 0, 0, 0, 1, 1,
0.648092, 0.233291, 0.8464277, 0, 0, 0, 1, 1,
0.6497426, 0.6988211, 0.7630156, 0, 0, 0, 1, 1,
0.6502342, 0.4562747, 2.304589, 0, 0, 0, 1, 1,
0.6510839, -0.4524834, 0.6703251, 0, 0, 0, 1, 1,
0.6554085, 1.192785, -0.5578749, 0, 0, 0, 1, 1,
0.6564312, -0.2673865, 2.044204, 0, 0, 0, 1, 1,
0.6606622, 0.2571311, 1.626906, 1, 1, 1, 1, 1,
0.6622108, 0.921243, -0.6277274, 1, 1, 1, 1, 1,
0.6650831, 0.140944, 1.605476, 1, 1, 1, 1, 1,
0.6667746, 0.3896047, 0.9471294, 1, 1, 1, 1, 1,
0.667034, 1.329649, 1.910868, 1, 1, 1, 1, 1,
0.6677492, -1.248781, 2.583754, 1, 1, 1, 1, 1,
0.6730433, 0.4433805, 0.6946159, 1, 1, 1, 1, 1,
0.6813057, 0.3703334, 0.267756, 1, 1, 1, 1, 1,
0.6818594, 0.7639618, 0.3891656, 1, 1, 1, 1, 1,
0.6830626, -1.516932, 3.505597, 1, 1, 1, 1, 1,
0.6839473, -0.2179807, 1.460529, 1, 1, 1, 1, 1,
0.6850065, -1.270055, 0.60152, 1, 1, 1, 1, 1,
0.6866537, -1.034754, 2.987704, 1, 1, 1, 1, 1,
0.68692, 0.4576901, 2.158882, 1, 1, 1, 1, 1,
0.6876884, -1.145003, 3.365715, 1, 1, 1, 1, 1,
0.6924945, -0.4920385, 4.20376, 0, 0, 1, 1, 1,
0.6952974, -0.08101101, -0.02197852, 1, 0, 0, 1, 1,
0.6962746, -0.8271056, 1.638608, 1, 0, 0, 1, 1,
0.6967817, 0.1270215, 0.6326871, 1, 0, 0, 1, 1,
0.7002413, -0.9894425, 2.738706, 1, 0, 0, 1, 1,
0.7050844, 0.4504803, 1.711406, 1, 0, 0, 1, 1,
0.712032, -0.63249, 3.89727, 0, 0, 0, 1, 1,
0.7144334, 0.4477527, 1.036634, 0, 0, 0, 1, 1,
0.7148294, -1.107616, 0.5793466, 0, 0, 0, 1, 1,
0.7266386, 1.127146, 1.82129, 0, 0, 0, 1, 1,
0.7272085, 1.300362, -0.1384601, 0, 0, 0, 1, 1,
0.7331585, -0.4816637, 3.073995, 0, 0, 0, 1, 1,
0.7401918, 0.1188226, 1.423477, 0, 0, 0, 1, 1,
0.7487709, 0.9188895, 0.8883604, 1, 1, 1, 1, 1,
0.7547365, 1.363246, 0.1387209, 1, 1, 1, 1, 1,
0.7559555, 0.9447903, 1.349529, 1, 1, 1, 1, 1,
0.7570245, 1.167754, 0.5335097, 1, 1, 1, 1, 1,
0.7579427, 0.8065293, 2.289619, 1, 1, 1, 1, 1,
0.7596477, 0.9688835, -1.27791, 1, 1, 1, 1, 1,
0.7733061, 0.5292809, 1.576052, 1, 1, 1, 1, 1,
0.7760626, 0.607718, 1.482823, 1, 1, 1, 1, 1,
0.7781492, -0.9853068, 1.418041, 1, 1, 1, 1, 1,
0.7799397, -0.8271769, 2.297942, 1, 1, 1, 1, 1,
0.7801158, 1.153933, -0.4466467, 1, 1, 1, 1, 1,
0.7820139, -0.7900015, 4.863047, 1, 1, 1, 1, 1,
0.7845129, 0.2910991, 1.741326, 1, 1, 1, 1, 1,
0.7928987, 0.769056, 0.9078071, 1, 1, 1, 1, 1,
0.7931013, 1.088846, 0.5177972, 1, 1, 1, 1, 1,
0.7995996, 0.5190623, 3.321479, 0, 0, 1, 1, 1,
0.8103981, 0.7042384, 2.542096, 1, 0, 0, 1, 1,
0.811626, 0.8784915, 0.7680889, 1, 0, 0, 1, 1,
0.8235149, -0.1389131, 3.170774, 1, 0, 0, 1, 1,
0.8237139, -0.8825949, 2.171781, 1, 0, 0, 1, 1,
0.8264719, 0.9283744, 0.8320466, 1, 0, 0, 1, 1,
0.8283587, -0.9222247, 3.823097, 0, 0, 0, 1, 1,
0.828876, 1.70555, -0.5803846, 0, 0, 0, 1, 1,
0.832883, -0.1423718, 3.066697, 0, 0, 0, 1, 1,
0.8333658, -0.6362704, 2.381734, 0, 0, 0, 1, 1,
0.8340475, 1.785042, 0.4236458, 0, 0, 0, 1, 1,
0.8405082, -0.3916394, 2.562977, 0, 0, 0, 1, 1,
0.8467605, 0.2632466, 1.694995, 0, 0, 0, 1, 1,
0.8495856, -0.03005935, 2.442853, 1, 1, 1, 1, 1,
0.8513828, 0.4789158, -0.417423, 1, 1, 1, 1, 1,
0.8539969, -0.4154496, 1.927993, 1, 1, 1, 1, 1,
0.8547761, 0.4208319, 1.674714, 1, 1, 1, 1, 1,
0.8556784, -0.4251662, 3.064308, 1, 1, 1, 1, 1,
0.8559531, -0.8733959, 2.539385, 1, 1, 1, 1, 1,
0.8568063, 0.351979, -0.1000636, 1, 1, 1, 1, 1,
0.8576014, -0.3965706, 2.838488, 1, 1, 1, 1, 1,
0.8593568, 0.7967572, -0.3955815, 1, 1, 1, 1, 1,
0.8598363, 0.9640466, 2.029539, 1, 1, 1, 1, 1,
0.8629924, -2.304836, 2.722579, 1, 1, 1, 1, 1,
0.8648975, -0.04703779, 2.403111, 1, 1, 1, 1, 1,
0.873836, 1.635615, 1.150465, 1, 1, 1, 1, 1,
0.8822483, 1.326299, 0.6489775, 1, 1, 1, 1, 1,
0.8858322, 0.6071506, -0.02727412, 1, 1, 1, 1, 1,
0.8860078, -0.6437656, 1.63789, 0, 0, 1, 1, 1,
0.8868777, 1.483662, -0.662009, 1, 0, 0, 1, 1,
0.889966, 0.880661, 1.471615, 1, 0, 0, 1, 1,
0.8904603, -0.5404216, 4.293797, 1, 0, 0, 1, 1,
0.8911618, 0.8405257, -0.009577259, 1, 0, 0, 1, 1,
0.8941371, -0.2895968, 3.544286, 1, 0, 0, 1, 1,
0.8982137, -0.7501762, 2.989605, 0, 0, 0, 1, 1,
0.8992441, 0.3856415, -0.4412309, 0, 0, 0, 1, 1,
0.9185392, 1.490846, 1.203767, 0, 0, 0, 1, 1,
0.9226947, -0.02708782, 2.357354, 0, 0, 0, 1, 1,
0.9300142, 0.7519225, -0.3154922, 0, 0, 0, 1, 1,
0.9360924, 0.008005181, 2.542102, 0, 0, 0, 1, 1,
0.9414896, 1.034158, 1.378705, 0, 0, 0, 1, 1,
0.9459834, -0.06985618, -0.4695552, 1, 1, 1, 1, 1,
0.9466463, 1.431486, 0.7243229, 1, 1, 1, 1, 1,
0.9510505, 0.7051158, -0.3905162, 1, 1, 1, 1, 1,
0.9587321, -2.243378, 3.477368, 1, 1, 1, 1, 1,
0.9631992, 2.316503, -0.4445559, 1, 1, 1, 1, 1,
0.9659417, -0.2673201, 2.419932, 1, 1, 1, 1, 1,
0.9684203, 1.380396, 1.848892, 1, 1, 1, 1, 1,
0.9690064, -0.143323, 1.529095, 1, 1, 1, 1, 1,
0.9694079, 0.4018184, 3.032219, 1, 1, 1, 1, 1,
0.9703296, 0.6102259, 0.470419, 1, 1, 1, 1, 1,
0.9737549, 1.826542, 1.970676, 1, 1, 1, 1, 1,
0.974812, 0.1637933, 1.99902, 1, 1, 1, 1, 1,
0.9776994, -0.6240817, 2.917447, 1, 1, 1, 1, 1,
0.9814339, -0.6059946, 2.407205, 1, 1, 1, 1, 1,
0.9821491, 2.20274, 0.6513906, 1, 1, 1, 1, 1,
0.9837878, -1.61865, 2.906651, 0, 0, 1, 1, 1,
0.9886571, 0.3210629, 1.539337, 1, 0, 0, 1, 1,
0.9900236, 0.2194055, -0.05542755, 1, 0, 0, 1, 1,
0.9914421, -1.314691, 4.231725, 1, 0, 0, 1, 1,
0.991663, 1.227725, 1.065802, 1, 0, 0, 1, 1,
0.9960194, -2.222268, 1.76924, 1, 0, 0, 1, 1,
0.9964671, -2.234147, 3.604447, 0, 0, 0, 1, 1,
0.9965262, -0.9028078, 1.677966, 0, 0, 0, 1, 1,
0.9983333, 0.324687, 0.9606225, 0, 0, 0, 1, 1,
1.00807, -0.8223547, 3.47211, 0, 0, 0, 1, 1,
1.025573, 0.3091838, 0.621066, 0, 0, 0, 1, 1,
1.026288, 0.4042292, 0.5233636, 0, 0, 0, 1, 1,
1.033924, -0.8699616, 3.260794, 0, 0, 0, 1, 1,
1.040239, -0.678259, 3.075767, 1, 1, 1, 1, 1,
1.043522, 0.5448487, 0.7800209, 1, 1, 1, 1, 1,
1.045361, -0.3115258, 0.9202541, 1, 1, 1, 1, 1,
1.046551, -1.28449, 0.8221788, 1, 1, 1, 1, 1,
1.047613, 0.1859951, 1.586866, 1, 1, 1, 1, 1,
1.048972, 1.004308, 3.390418, 1, 1, 1, 1, 1,
1.050489, 0.1996648, 2.458144, 1, 1, 1, 1, 1,
1.053445, -0.1689754, 2.290647, 1, 1, 1, 1, 1,
1.059993, -0.4158347, 1.523374, 1, 1, 1, 1, 1,
1.060869, 0.5409951, 3.235286, 1, 1, 1, 1, 1,
1.06155, 0.4592166, 1.079163, 1, 1, 1, 1, 1,
1.063405, 1.391346, -1.634243, 1, 1, 1, 1, 1,
1.069832, -0.656774, 0.65053, 1, 1, 1, 1, 1,
1.087752, 2.24436, -1.985739, 1, 1, 1, 1, 1,
1.088345, 0.00680336, 2.443622, 1, 1, 1, 1, 1,
1.089628, -0.9515474, 2.666391, 0, 0, 1, 1, 1,
1.090622, -0.4708807, 1.579048, 1, 0, 0, 1, 1,
1.096175, -0.6223928, 3.028588, 1, 0, 0, 1, 1,
1.107079, -1.335483, 0.8604444, 1, 0, 0, 1, 1,
1.109319, 0.9879339, 1.509002, 1, 0, 0, 1, 1,
1.115674, 0.4095752, 2.424287, 1, 0, 0, 1, 1,
1.124182, 1.099213, 0.5935968, 0, 0, 0, 1, 1,
1.136539, -0.2061129, 1.062821, 0, 0, 0, 1, 1,
1.140418, 0.3221004, 1.768586, 0, 0, 0, 1, 1,
1.1427, -1.275042, 3.23694, 0, 0, 0, 1, 1,
1.148267, 0.1552698, 0.8387718, 0, 0, 0, 1, 1,
1.155796, 0.4075805, 2.130632, 0, 0, 0, 1, 1,
1.161115, 0.5840237, 2.862249, 0, 0, 0, 1, 1,
1.165063, -0.3012615, -0.001349353, 1, 1, 1, 1, 1,
1.167713, 0.2942752, 2.265357, 1, 1, 1, 1, 1,
1.168237, 0.0783852, 2.386925, 1, 1, 1, 1, 1,
1.169185, -0.5494283, 3.120445, 1, 1, 1, 1, 1,
1.17458, -0.8789698, 1.29232, 1, 1, 1, 1, 1,
1.17797, -0.09390318, -0.1159592, 1, 1, 1, 1, 1,
1.183906, -0.7081237, 1.881751, 1, 1, 1, 1, 1,
1.185895, -2.360543, 2.659103, 1, 1, 1, 1, 1,
1.193149, 0.7248975, 0.3787596, 1, 1, 1, 1, 1,
1.193852, 0.451753, -0.3833724, 1, 1, 1, 1, 1,
1.195381, 2.94835, 0.9970289, 1, 1, 1, 1, 1,
1.196303, -0.5522119, 2.696213, 1, 1, 1, 1, 1,
1.199357, -1.923578, 2.378146, 1, 1, 1, 1, 1,
1.202451, 0.5884939, 2.279942, 1, 1, 1, 1, 1,
1.206451, -1.058565, 2.714519, 1, 1, 1, 1, 1,
1.209487, 1.527528, 0.3067782, 0, 0, 1, 1, 1,
1.214162, 0.6213936, 1.41432, 1, 0, 0, 1, 1,
1.216625, -0.2867133, 1.713392, 1, 0, 0, 1, 1,
1.218994, -1.541234, 2.382484, 1, 0, 0, 1, 1,
1.235232, -0.5883623, 0.9272079, 1, 0, 0, 1, 1,
1.239736, -2.421762, 2.51751, 1, 0, 0, 1, 1,
1.249306, 0.8297605, -0.1388051, 0, 0, 0, 1, 1,
1.260037, -0.4453343, 1.916569, 0, 0, 0, 1, 1,
1.260165, 1.865711, 1.975957, 0, 0, 0, 1, 1,
1.267598, -2.12245, 1.147835, 0, 0, 0, 1, 1,
1.276472, -0.1017732, 3.473034, 0, 0, 0, 1, 1,
1.280031, -0.4122378, 2.292275, 0, 0, 0, 1, 1,
1.296156, -1.098678, 2.65878, 0, 0, 0, 1, 1,
1.296255, -0.2316056, 1.779265, 1, 1, 1, 1, 1,
1.30643, -0.5045383, 2.187002, 1, 1, 1, 1, 1,
1.329267, 1.614601, 0.1573601, 1, 1, 1, 1, 1,
1.344574, 0.9603215, 0.3035259, 1, 1, 1, 1, 1,
1.353417, -1.025113, 3.556812, 1, 1, 1, 1, 1,
1.362304, -1.516496, 0.8905228, 1, 1, 1, 1, 1,
1.365418, 0.1788503, 2.04288, 1, 1, 1, 1, 1,
1.370667, -0.3467462, 3.445897, 1, 1, 1, 1, 1,
1.376581, -0.1583188, 1.949543, 1, 1, 1, 1, 1,
1.395465, 0.03815185, 1.001455, 1, 1, 1, 1, 1,
1.401611, -0.7443296, 0.07999598, 1, 1, 1, 1, 1,
1.421405, -0.274451, -1.278821, 1, 1, 1, 1, 1,
1.424278, -0.9519238, 4.512393, 1, 1, 1, 1, 1,
1.424598, 0.8433531, -0.07968695, 1, 1, 1, 1, 1,
1.426665, 0.4760806, 0.2856484, 1, 1, 1, 1, 1,
1.429897, -1.50268, 2.300925, 0, 0, 1, 1, 1,
1.435207, -1.368121, 2.781154, 1, 0, 0, 1, 1,
1.440021, -0.7574522, 1.839301, 1, 0, 0, 1, 1,
1.448707, -0.06254759, 1.116716, 1, 0, 0, 1, 1,
1.455547, 0.2964909, 2.217103, 1, 0, 0, 1, 1,
1.456658, -1.310614, 1.176225, 1, 0, 0, 1, 1,
1.461321, 0.08788644, 2.900995, 0, 0, 0, 1, 1,
1.46866, 0.5260711, 1.156245, 0, 0, 0, 1, 1,
1.472233, 0.01319482, 1.293866, 0, 0, 0, 1, 1,
1.47256, 0.6526491, 2.016483, 0, 0, 0, 1, 1,
1.481433, 0.421919, 0.834759, 0, 0, 0, 1, 1,
1.498214, -1.790116, 3.15172, 0, 0, 0, 1, 1,
1.501291, -1.468024, 2.772867, 0, 0, 0, 1, 1,
1.523739, -0.6856802, 2.866297, 1, 1, 1, 1, 1,
1.523757, -0.08759566, 3.074655, 1, 1, 1, 1, 1,
1.525905, 0.4763405, 2.226271, 1, 1, 1, 1, 1,
1.527321, -0.6542001, 1.558339, 1, 1, 1, 1, 1,
1.570663, -0.908679, 1.356796, 1, 1, 1, 1, 1,
1.590752, 1.964237, 1.664125, 1, 1, 1, 1, 1,
1.590933, 0.1243864, 0.9970494, 1, 1, 1, 1, 1,
1.593921, 0.08417055, 2.320364, 1, 1, 1, 1, 1,
1.601457, 0.8522179, 2.173164, 1, 1, 1, 1, 1,
1.630648, 1.568382, 0.2542788, 1, 1, 1, 1, 1,
1.631864, -0.07800373, 1.330911, 1, 1, 1, 1, 1,
1.649699, 0.3416811, 1.07307, 1, 1, 1, 1, 1,
1.663967, -2.154139, 2.896267, 1, 1, 1, 1, 1,
1.675051, 1.147378, 0.4468469, 1, 1, 1, 1, 1,
1.677131, -1.130867, 2.677974, 1, 1, 1, 1, 1,
1.68741, 0.1542768, 1.937225, 0, 0, 1, 1, 1,
1.689045, -0.1112192, 1.063531, 1, 0, 0, 1, 1,
1.694452, -1.845899, 3.715015, 1, 0, 0, 1, 1,
1.701233, -0.5862404, 2.637395, 1, 0, 0, 1, 1,
1.717268, -0.1227177, 1.116726, 1, 0, 0, 1, 1,
1.724139, -2.069018, -0.01942405, 1, 0, 0, 1, 1,
1.739529, -0.6044629, 2.634289, 0, 0, 0, 1, 1,
1.740605, 1.100258, 1.102036, 0, 0, 0, 1, 1,
1.745604, -0.0002825916, 0.1893481, 0, 0, 0, 1, 1,
1.779564, -0.4257247, 0.9792774, 0, 0, 0, 1, 1,
1.781498, 0.7866449, -0.799668, 0, 0, 0, 1, 1,
1.788344, 0.3304523, 1.596895, 0, 0, 0, 1, 1,
1.796812, -1.486393, 2.961565, 0, 0, 0, 1, 1,
1.820278, -0.02543881, 0.9432865, 1, 1, 1, 1, 1,
1.851544, 0.490744, 2.106792, 1, 1, 1, 1, 1,
1.86661, 0.06233896, 0.8158023, 1, 1, 1, 1, 1,
1.874023, 0.4477246, 1.278024, 1, 1, 1, 1, 1,
1.89177, -1.249951, 1.180036, 1, 1, 1, 1, 1,
1.914347, 0.1692957, 1.591252, 1, 1, 1, 1, 1,
1.935368, -0.5193856, 2.708094, 1, 1, 1, 1, 1,
1.944289, 1.328544, 1.969525, 1, 1, 1, 1, 1,
1.950354, 0.5820334, 2.022249, 1, 1, 1, 1, 1,
1.952426, 0.434414, 1.756756, 1, 1, 1, 1, 1,
1.99211, 1.874641, 1.300253, 1, 1, 1, 1, 1,
2.077579, 0.8872141, -0.02324728, 1, 1, 1, 1, 1,
2.116434, -0.3792473, 0.5096132, 1, 1, 1, 1, 1,
2.129586, 0.6853323, -0.9898702, 1, 1, 1, 1, 1,
2.153322, -1.145251, 2.529588, 1, 1, 1, 1, 1,
2.164444, 1.93887, -0.6017541, 0, 0, 1, 1, 1,
2.168369, -1.636716, -0.1697887, 1, 0, 0, 1, 1,
2.168443, -0.3506528, 1.322827, 1, 0, 0, 1, 1,
2.174109, -0.4155347, 0.3015675, 1, 0, 0, 1, 1,
2.196569, 0.5279356, 1.603701, 1, 0, 0, 1, 1,
2.209482, 0.1498005, 2.350041, 1, 0, 0, 1, 1,
2.216851, 1.33826, -0.08136931, 0, 0, 0, 1, 1,
2.239098, -0.218396, 1.282566, 0, 0, 0, 1, 1,
2.243962, 0.358241, 1.883068, 0, 0, 0, 1, 1,
2.299673, -0.3883992, 2.114343, 0, 0, 0, 1, 1,
2.320414, 0.5513605, 1.161336, 0, 0, 0, 1, 1,
2.320885, 1.714553, 1.511847, 0, 0, 0, 1, 1,
2.334026, -1.470791, 2.922421, 0, 0, 0, 1, 1,
2.37047, 0.7420273, 1.604399, 1, 1, 1, 1, 1,
2.372378, -0.9536431, -0.4170816, 1, 1, 1, 1, 1,
2.44993, 0.742254, 0.3999306, 1, 1, 1, 1, 1,
2.464053, 1.550983, 1.585891, 1, 1, 1, 1, 1,
2.648638, -0.6989336, 2.198068, 1, 1, 1, 1, 1,
2.983968, -0.2649952, 1.473097, 1, 1, 1, 1, 1,
3.773682, 0.124637, 1.106202, 1, 1, 1, 1, 1
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
var radius = 9.652883;
var distance = 33.90534;
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
mvMatrix.translate( -0.1576757, -0.3147917, -0.1372526 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.90534);
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
