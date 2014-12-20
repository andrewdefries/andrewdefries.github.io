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
-3.741464, -0.8995904, -1.747306, 1, 0, 0, 1,
-2.978672, 0.5419745, -0.4803592, 1, 0.007843138, 0, 1,
-2.942522, -1.248096, -2.554964, 1, 0.01176471, 0, 1,
-2.82032, 0.3321157, -1.227666, 1, 0.01960784, 0, 1,
-2.682309, -0.2920403, -1.266034, 1, 0.02352941, 0, 1,
-2.651562, -2.010999, -0.7722957, 1, 0.03137255, 0, 1,
-2.647286, -1.091984, -0.6819946, 1, 0.03529412, 0, 1,
-2.490879, 1.957645, -0.4743731, 1, 0.04313726, 0, 1,
-2.444584, -0.1134719, -0.9787534, 1, 0.04705882, 0, 1,
-2.43571, -0.8599226, -2.83364, 1, 0.05490196, 0, 1,
-2.370364, -0.5558289, -0.5661749, 1, 0.05882353, 0, 1,
-2.35906, 0.6919872, -0.8751283, 1, 0.06666667, 0, 1,
-2.351027, -0.845237, -2.945002, 1, 0.07058824, 0, 1,
-2.330555, -0.928559, -2.9681, 1, 0.07843138, 0, 1,
-2.302383, 0.07169622, -1.068263, 1, 0.08235294, 0, 1,
-2.295324, -2.37877, -1.310878, 1, 0.09019608, 0, 1,
-2.244818, -1.343539, -1.509898, 1, 0.09411765, 0, 1,
-2.233396, 0.10485, -2.130635, 1, 0.1019608, 0, 1,
-2.199215, 0.5143287, 0.2008614, 1, 0.1098039, 0, 1,
-2.191935, 0.6181696, -0.2576131, 1, 0.1137255, 0, 1,
-2.1468, 0.3391768, -2.088452, 1, 0.1215686, 0, 1,
-2.112296, -1.055203, -2.061971, 1, 0.1254902, 0, 1,
-2.107183, -0.8727201, -2.939495, 1, 0.1333333, 0, 1,
-2.035084, -2.74707, -3.333601, 1, 0.1372549, 0, 1,
-2.02525, 1.134082, -0.7854137, 1, 0.145098, 0, 1,
-2.019477, -1.155321, -2.855014, 1, 0.1490196, 0, 1,
-1.993808, -0.4149987, -2.297751, 1, 0.1568628, 0, 1,
-1.988511, -0.2122075, -1.963952, 1, 0.1607843, 0, 1,
-1.984538, 0.8821051, -1.190253, 1, 0.1686275, 0, 1,
-1.966364, -0.5837907, -2.250323, 1, 0.172549, 0, 1,
-1.960727, 0.2178804, -2.168616, 1, 0.1803922, 0, 1,
-1.930085, 0.6941674, -0.3064624, 1, 0.1843137, 0, 1,
-1.921171, 0.7279465, -2.287153, 1, 0.1921569, 0, 1,
-1.914891, 0.09082931, -2.467694, 1, 0.1960784, 0, 1,
-1.872023, -0.9943334, -1.743013, 1, 0.2039216, 0, 1,
-1.850786, 0.08905035, -1.38146, 1, 0.2117647, 0, 1,
-1.832519, -1.066557, -3.209331, 1, 0.2156863, 0, 1,
-1.832404, 0.325262, 0.3825282, 1, 0.2235294, 0, 1,
-1.826262, 1.246098, -1.454252, 1, 0.227451, 0, 1,
-1.824113, 0.4808371, -1.387004, 1, 0.2352941, 0, 1,
-1.816232, 1.331499, -0.512154, 1, 0.2392157, 0, 1,
-1.786104, 0.9017999, -0.9303924, 1, 0.2470588, 0, 1,
-1.752238, 0.5392552, -0.3392629, 1, 0.2509804, 0, 1,
-1.74701, -0.1034847, -0.9732454, 1, 0.2588235, 0, 1,
-1.74226, -0.1641436, -0.8496875, 1, 0.2627451, 0, 1,
-1.736565, -0.08974341, -0.5179667, 1, 0.2705882, 0, 1,
-1.725924, -0.165311, -2.525518, 1, 0.2745098, 0, 1,
-1.724093, -0.09085603, 0.02241408, 1, 0.282353, 0, 1,
-1.70472, -0.1831017, -2.106294, 1, 0.2862745, 0, 1,
-1.682715, -1.122345, -2.251114, 1, 0.2941177, 0, 1,
-1.674224, -0.319504, -1.97709, 1, 0.3019608, 0, 1,
-1.652416, -0.7894536, -3.002817, 1, 0.3058824, 0, 1,
-1.651394, -1.383545, -2.169368, 1, 0.3137255, 0, 1,
-1.649438, -0.1741068, -1.012634, 1, 0.3176471, 0, 1,
-1.64201, 1.367134, -0.5236053, 1, 0.3254902, 0, 1,
-1.639885, 0.6956789, -1.552154, 1, 0.3294118, 0, 1,
-1.62748, 0.4819316, -1.972881, 1, 0.3372549, 0, 1,
-1.611633, 0.06035351, -2.140978, 1, 0.3411765, 0, 1,
-1.608805, -0.8092016, 0.2364406, 1, 0.3490196, 0, 1,
-1.606218, 0.7390147, -0.2195815, 1, 0.3529412, 0, 1,
-1.598019, -0.5648076, -0.5191391, 1, 0.3607843, 0, 1,
-1.592547, 1.466801, -1.370501, 1, 0.3647059, 0, 1,
-1.578036, -0.3586709, -2.74383, 1, 0.372549, 0, 1,
-1.576463, 1.491557, 0.5657411, 1, 0.3764706, 0, 1,
-1.572132, 0.7374115, -1.150051, 1, 0.3843137, 0, 1,
-1.571175, 0.6593862, -2.848198, 1, 0.3882353, 0, 1,
-1.533912, 0.3730446, 0.3905253, 1, 0.3960784, 0, 1,
-1.52896, 1.034742, -1.756506, 1, 0.4039216, 0, 1,
-1.525148, -0.5941344, -1.369432, 1, 0.4078431, 0, 1,
-1.51447, -0.2955354, -1.510857, 1, 0.4156863, 0, 1,
-1.506097, -1.386774, -1.895013, 1, 0.4196078, 0, 1,
-1.485337, 1.319558, -1.655697, 1, 0.427451, 0, 1,
-1.482954, 0.1719949, -0.7685748, 1, 0.4313726, 0, 1,
-1.445359, 0.7458211, -1.806519, 1, 0.4392157, 0, 1,
-1.444478, -0.5846918, -4.045269, 1, 0.4431373, 0, 1,
-1.44301, -0.02468911, -1.624737, 1, 0.4509804, 0, 1,
-1.439206, -0.7619797, -2.01808, 1, 0.454902, 0, 1,
-1.439119, -0.2153099, -0.5339553, 1, 0.4627451, 0, 1,
-1.434322, -2.074882, -3.92211, 1, 0.4666667, 0, 1,
-1.43166, 0.05854765, -1.876509, 1, 0.4745098, 0, 1,
-1.428306, 0.6100261, -1.286215, 1, 0.4784314, 0, 1,
-1.425886, -0.1360211, -2.265122, 1, 0.4862745, 0, 1,
-1.421214, 0.1146026, 0.2642278, 1, 0.4901961, 0, 1,
-1.417139, -1.19938, -3.269747, 1, 0.4980392, 0, 1,
-1.415139, 0.5384196, -1.010633, 1, 0.5058824, 0, 1,
-1.412329, 2.017324, -2.061876, 1, 0.509804, 0, 1,
-1.408858, 0.1626095, -1.519106, 1, 0.5176471, 0, 1,
-1.39697, -0.06146443, -1.235362, 1, 0.5215687, 0, 1,
-1.394092, 1.37002, -1.802244, 1, 0.5294118, 0, 1,
-1.385079, -0.7608199, -1.78253, 1, 0.5333334, 0, 1,
-1.370003, -0.5525044, -1.015533, 1, 0.5411765, 0, 1,
-1.368938, 0.4726807, -1.51923, 1, 0.5450981, 0, 1,
-1.361891, -0.8568057, -2.530627, 1, 0.5529412, 0, 1,
-1.358237, 0.2109097, -0.2288325, 1, 0.5568628, 0, 1,
-1.357612, 1.817692, -1.015913, 1, 0.5647059, 0, 1,
-1.347488, -0.2293989, -3.787082, 1, 0.5686275, 0, 1,
-1.346599, -0.1012984, -2.784688, 1, 0.5764706, 0, 1,
-1.31493, 0.2343441, -1.314063, 1, 0.5803922, 0, 1,
-1.312699, -0.4917327, -3.505157, 1, 0.5882353, 0, 1,
-1.306113, -1.218527, -2.162865, 1, 0.5921569, 0, 1,
-1.304257, 2.099997, -0.5807413, 1, 0.6, 0, 1,
-1.295303, 0.1022341, -1.225801, 1, 0.6078432, 0, 1,
-1.294516, 1.426704, -0.942001, 1, 0.6117647, 0, 1,
-1.2922, 0.7468958, -0.3260209, 1, 0.6196079, 0, 1,
-1.287265, 0.6004831, -1.744047, 1, 0.6235294, 0, 1,
-1.286359, -0.8108597, -0.4555922, 1, 0.6313726, 0, 1,
-1.279847, -0.7903174, -2.51388, 1, 0.6352941, 0, 1,
-1.276651, 0.5992699, -0.8768811, 1, 0.6431373, 0, 1,
-1.255385, -0.09196535, -2.207591, 1, 0.6470588, 0, 1,
-1.254041, -0.4422151, -2.907073, 1, 0.654902, 0, 1,
-1.254029, -2.336593, -4.132347, 1, 0.6588235, 0, 1,
-1.249102, 0.2356577, -0.6911279, 1, 0.6666667, 0, 1,
-1.240057, -0.7652102, -1.979755, 1, 0.6705883, 0, 1,
-1.237245, -1.403428, -2.161746, 1, 0.6784314, 0, 1,
-1.222681, -1.141086, 1.959542, 1, 0.682353, 0, 1,
-1.219163, -0.8986222, -1.927141, 1, 0.6901961, 0, 1,
-1.216104, -0.1193066, -1.629358, 1, 0.6941177, 0, 1,
-1.208912, -0.8552581, -1.680454, 1, 0.7019608, 0, 1,
-1.20307, -0.4802827, -1.987163, 1, 0.7098039, 0, 1,
-1.195079, -0.1881832, -2.299859, 1, 0.7137255, 0, 1,
-1.188947, 1.91373, -2.496145, 1, 0.7215686, 0, 1,
-1.184115, 1.3761, 1.088565, 1, 0.7254902, 0, 1,
-1.18342, 1.7135, -1.490207, 1, 0.7333333, 0, 1,
-1.180818, -0.1792235, -1.648546, 1, 0.7372549, 0, 1,
-1.177734, -0.6713543, -0.5601241, 1, 0.7450981, 0, 1,
-1.175977, 0.3058232, -0.7896197, 1, 0.7490196, 0, 1,
-1.170078, -0.8490947, -1.595508, 1, 0.7568628, 0, 1,
-1.166549, 1.096968, -2.526047, 1, 0.7607843, 0, 1,
-1.159088, 0.384543, -0.3604043, 1, 0.7686275, 0, 1,
-1.15649, 0.9201267, -0.8828806, 1, 0.772549, 0, 1,
-1.153297, -1.587787, -2.517033, 1, 0.7803922, 0, 1,
-1.151743, 1.221442, -1.959487, 1, 0.7843137, 0, 1,
-1.149353, 0.7873443, -1.986575, 1, 0.7921569, 0, 1,
-1.148769, -1.574251, -3.258862, 1, 0.7960784, 0, 1,
-1.14599, 0.07090671, 0.02496316, 1, 0.8039216, 0, 1,
-1.139366, 0.7507027, 0.1204833, 1, 0.8117647, 0, 1,
-1.133997, 0.6228172, 0.2001365, 1, 0.8156863, 0, 1,
-1.131392, -0.3626561, -2.925103, 1, 0.8235294, 0, 1,
-1.128527, -1.649459, -2.856908, 1, 0.827451, 0, 1,
-1.111061, -0.7249042, -1.87567, 1, 0.8352941, 0, 1,
-1.110678, -0.3425018, -1.393342, 1, 0.8392157, 0, 1,
-1.103918, -1.406345, -2.072997, 1, 0.8470588, 0, 1,
-1.096774, 0.1281407, -2.825366, 1, 0.8509804, 0, 1,
-1.090565, 1.200059, -1.298663, 1, 0.8588235, 0, 1,
-1.087703, 1.569914, -1.074445, 1, 0.8627451, 0, 1,
-1.083094, 1.869773, -1.191825, 1, 0.8705882, 0, 1,
-1.081113, 0.9092432, -0.5446454, 1, 0.8745098, 0, 1,
-1.074674, 1.063811, -1.908137, 1, 0.8823529, 0, 1,
-1.070041, -2.021207, -2.058075, 1, 0.8862745, 0, 1,
-1.06718, -1.349323, -1.146381, 1, 0.8941177, 0, 1,
-1.06587, -0.6702115, -1.721244, 1, 0.8980392, 0, 1,
-1.064286, -0.5172949, -3.779516, 1, 0.9058824, 0, 1,
-1.060471, -2.205525, -2.697994, 1, 0.9137255, 0, 1,
-1.054087, -0.7326774, -4.206329, 1, 0.9176471, 0, 1,
-1.049682, -0.142984, -2.482892, 1, 0.9254902, 0, 1,
-1.042953, -0.5474105, -3.213316, 1, 0.9294118, 0, 1,
-1.039742, -0.8997947, -2.022383, 1, 0.9372549, 0, 1,
-1.039099, -0.8459532, -3.073188, 1, 0.9411765, 0, 1,
-1.037706, 1.349265, 1.307216, 1, 0.9490196, 0, 1,
-1.02719, 1.282674, -0.5820886, 1, 0.9529412, 0, 1,
-1.020283, -0.04160435, -1.375474, 1, 0.9607843, 0, 1,
-1.011802, 0.7198103, -0.8943751, 1, 0.9647059, 0, 1,
-1.010381, -0.9829056, -2.543179, 1, 0.972549, 0, 1,
-0.9928977, 0.3574215, 1.067803, 1, 0.9764706, 0, 1,
-0.9897411, -0.9007822, -3.401911, 1, 0.9843137, 0, 1,
-0.9830493, 0.4400149, -1.798317, 1, 0.9882353, 0, 1,
-0.9818252, 0.4560519, -1.561223, 1, 0.9960784, 0, 1,
-0.9810095, -0.5561123, -1.253618, 0.9960784, 1, 0, 1,
-0.9787815, -0.8267767, -2.132408, 0.9921569, 1, 0, 1,
-0.9747085, 0.2277213, -0.8275771, 0.9843137, 1, 0, 1,
-0.9737266, -1.262242, -2.883523, 0.9803922, 1, 0, 1,
-0.9636923, 2.716855, 1.131239, 0.972549, 1, 0, 1,
-0.9620526, 0.6837786, -0.2513278, 0.9686275, 1, 0, 1,
-0.9578431, -1.370183, -2.122746, 0.9607843, 1, 0, 1,
-0.9559216, -0.8186777, -1.401511, 0.9568627, 1, 0, 1,
-0.9384667, -2.364525, -3.616638, 0.9490196, 1, 0, 1,
-0.937431, 0.2878296, -1.333678, 0.945098, 1, 0, 1,
-0.9369549, 0.06465373, -3.283119, 0.9372549, 1, 0, 1,
-0.9295827, 0.07455481, -2.645805, 0.9333333, 1, 0, 1,
-0.9129679, -0.5267894, -1.034273, 0.9254902, 1, 0, 1,
-0.9088055, 1.166303, 0.2838749, 0.9215686, 1, 0, 1,
-0.906808, 0.9297353, -0.2878111, 0.9137255, 1, 0, 1,
-0.9057994, -0.539643, -0.4006551, 0.9098039, 1, 0, 1,
-0.9049761, -2.208098, -1.586428, 0.9019608, 1, 0, 1,
-0.9037413, 0.2664646, -1.333071, 0.8941177, 1, 0, 1,
-0.9031587, -0.4077412, -1.860404, 0.8901961, 1, 0, 1,
-0.8962872, -0.8932218, -1.94694, 0.8823529, 1, 0, 1,
-0.8946934, 0.3338678, 0.0949753, 0.8784314, 1, 0, 1,
-0.8930773, 0.2108937, -3.336944, 0.8705882, 1, 0, 1,
-0.8914102, 0.9985409, -0.5771104, 0.8666667, 1, 0, 1,
-0.8886071, -2.601368, -2.53309, 0.8588235, 1, 0, 1,
-0.8848585, -0.5343497, -3.071051, 0.854902, 1, 0, 1,
-0.8780827, 0.02201118, -2.016459, 0.8470588, 1, 0, 1,
-0.8766207, 0.7447748, -0.6669393, 0.8431373, 1, 0, 1,
-0.8764929, 0.5367927, -2.064284, 0.8352941, 1, 0, 1,
-0.8649798, 0.4328164, -1.942448, 0.8313726, 1, 0, 1,
-0.8503144, -0.07189631, -3.215131, 0.8235294, 1, 0, 1,
-0.8415461, -2.741835, -2.5871, 0.8196079, 1, 0, 1,
-0.8397153, -1.507792, -2.30718, 0.8117647, 1, 0, 1,
-0.8396226, -0.3849442, -0.8702205, 0.8078431, 1, 0, 1,
-0.8388444, -1.835019, -2.61921, 0.8, 1, 0, 1,
-0.8361547, 1.561612, 0.9255502, 0.7921569, 1, 0, 1,
-0.8330259, -0.3962366, -2.938558, 0.7882353, 1, 0, 1,
-0.8308609, -1.589486, -3.72702, 0.7803922, 1, 0, 1,
-0.8253325, 0.9358786, 0.5194077, 0.7764706, 1, 0, 1,
-0.8251202, 1.396364, -1.294264, 0.7686275, 1, 0, 1,
-0.8194568, 0.1695721, -0.5970004, 0.7647059, 1, 0, 1,
-0.818745, -2.547923, -2.812891, 0.7568628, 1, 0, 1,
-0.8124779, 1.318802, -0.6315535, 0.7529412, 1, 0, 1,
-0.8087265, 0.1406715, 0.2264962, 0.7450981, 1, 0, 1,
-0.8072789, -1.376337, -2.627296, 0.7411765, 1, 0, 1,
-0.7943602, 0.6413648, -1.237916, 0.7333333, 1, 0, 1,
-0.7897893, -0.1046273, -2.124846, 0.7294118, 1, 0, 1,
-0.7870118, 0.1423071, -0.7402706, 0.7215686, 1, 0, 1,
-0.7834792, -0.7746166, -3.183525, 0.7176471, 1, 0, 1,
-0.774035, -0.8651297, -3.460981, 0.7098039, 1, 0, 1,
-0.7716038, 1.129207, -0.8259845, 0.7058824, 1, 0, 1,
-0.7715266, 0.9393062, -0.00378494, 0.6980392, 1, 0, 1,
-0.7712208, 0.6910176, -1.191356, 0.6901961, 1, 0, 1,
-0.7630159, 0.37772, 0.177471, 0.6862745, 1, 0, 1,
-0.7629104, -0.00840751, -1.192682, 0.6784314, 1, 0, 1,
-0.7594194, 1.206365, 0.8234701, 0.6745098, 1, 0, 1,
-0.7587932, 0.1217052, -1.315754, 0.6666667, 1, 0, 1,
-0.7577834, 0.1915808, -1.689717, 0.6627451, 1, 0, 1,
-0.7540179, -0.8772451, -2.070168, 0.654902, 1, 0, 1,
-0.7529937, 0.4652728, -0.6263896, 0.6509804, 1, 0, 1,
-0.7451668, 0.3248018, -0.6136796, 0.6431373, 1, 0, 1,
-0.7396933, -0.1390541, -2.825711, 0.6392157, 1, 0, 1,
-0.7327831, 0.2014408, -0.5091929, 0.6313726, 1, 0, 1,
-0.7309818, -0.1953185, -2.663226, 0.627451, 1, 0, 1,
-0.7299583, 1.30998, 0.5975445, 0.6196079, 1, 0, 1,
-0.7290587, 1.991293, -0.4966261, 0.6156863, 1, 0, 1,
-0.7254131, -0.2128221, -1.521127, 0.6078432, 1, 0, 1,
-0.7243459, -0.1248171, -1.311311, 0.6039216, 1, 0, 1,
-0.7239661, -0.9826974, -2.507135, 0.5960785, 1, 0, 1,
-0.7227618, 0.1075293, -1.463724, 0.5882353, 1, 0, 1,
-0.7173997, 0.6471324, -2.746798, 0.5843138, 1, 0, 1,
-0.7173572, 1.256096, 0.7644792, 0.5764706, 1, 0, 1,
-0.7156761, 0.9140988, -0.3669223, 0.572549, 1, 0, 1,
-0.7100361, 0.8953193, -0.2108348, 0.5647059, 1, 0, 1,
-0.7093726, 0.6706201, -0.2452412, 0.5607843, 1, 0, 1,
-0.7092418, 0.2886916, -0.9092902, 0.5529412, 1, 0, 1,
-0.707545, -0.6510772, -1.823486, 0.5490196, 1, 0, 1,
-0.7042629, -0.3180811, -3.322789, 0.5411765, 1, 0, 1,
-0.7033322, -0.0774588, -1.94257, 0.5372549, 1, 0, 1,
-0.6997283, -0.3974711, -3.442618, 0.5294118, 1, 0, 1,
-0.6957793, -0.5059045, -1.144188, 0.5254902, 1, 0, 1,
-0.6955004, -2.75302, -3.772947, 0.5176471, 1, 0, 1,
-0.6937096, -0.0882727, -1.729462, 0.5137255, 1, 0, 1,
-0.6912179, 0.003022268, -0.3899373, 0.5058824, 1, 0, 1,
-0.6899027, 0.756817, -0.3375069, 0.5019608, 1, 0, 1,
-0.6883705, 0.5394431, -2.062186, 0.4941176, 1, 0, 1,
-0.6878078, 2.432289, 1.479145, 0.4862745, 1, 0, 1,
-0.6867439, 0.3169766, -0.08807623, 0.4823529, 1, 0, 1,
-0.6787708, 0.5138761, -1.838562, 0.4745098, 1, 0, 1,
-0.6755807, -0.3213331, -1.749416, 0.4705882, 1, 0, 1,
-0.6740314, -0.1735805, -3.141948, 0.4627451, 1, 0, 1,
-0.6714253, 0.8297374, -0.279536, 0.4588235, 1, 0, 1,
-0.6710293, 0.4302062, -2.126967, 0.4509804, 1, 0, 1,
-0.67001, -0.7266084, -3.686248, 0.4470588, 1, 0, 1,
-0.6662825, -2.160496, -4.347529, 0.4392157, 1, 0, 1,
-0.6404697, 0.5342456, -1.373183, 0.4352941, 1, 0, 1,
-0.6389445, 0.1956477, -1.306954, 0.427451, 1, 0, 1,
-0.6374686, -1.491059, -3.566375, 0.4235294, 1, 0, 1,
-0.6324602, 1.472461, -0.419631, 0.4156863, 1, 0, 1,
-0.6311867, -0.4809816, -2.531653, 0.4117647, 1, 0, 1,
-0.6309921, -0.4703815, -2.556994, 0.4039216, 1, 0, 1,
-0.6300976, -1.919931, -1.619312, 0.3960784, 1, 0, 1,
-0.6270964, 1.132034, -0.2190239, 0.3921569, 1, 0, 1,
-0.6211814, -0.5711902, -1.753959, 0.3843137, 1, 0, 1,
-0.6175321, 0.7353699, -0.1661734, 0.3803922, 1, 0, 1,
-0.6160827, -0.6740218, -2.105288, 0.372549, 1, 0, 1,
-0.609385, 0.7356149, -0.1775871, 0.3686275, 1, 0, 1,
-0.6090544, 0.3294662, -2.166442, 0.3607843, 1, 0, 1,
-0.6050199, -0.3067882, -0.6086919, 0.3568628, 1, 0, 1,
-0.6049643, -0.4338109, -4.150702, 0.3490196, 1, 0, 1,
-0.6025184, -0.6963421, -1.226961, 0.345098, 1, 0, 1,
-0.5988715, -1.01163, -3.590487, 0.3372549, 1, 0, 1,
-0.5983725, -0.265413, -2.793676, 0.3333333, 1, 0, 1,
-0.5947316, -0.7083233, -2.754622, 0.3254902, 1, 0, 1,
-0.5947195, -1.071797, -2.120178, 0.3215686, 1, 0, 1,
-0.5918989, 0.6866507, -1.924698, 0.3137255, 1, 0, 1,
-0.5914568, 0.9281979, -1.727985, 0.3098039, 1, 0, 1,
-0.5905007, -1.166213, -2.529734, 0.3019608, 1, 0, 1,
-0.5860002, 1.016644, -2.016009, 0.2941177, 1, 0, 1,
-0.5829796, 0.5615246, -3.326983, 0.2901961, 1, 0, 1,
-0.5795116, -0.6823086, -2.766081, 0.282353, 1, 0, 1,
-0.5678518, -0.7134436, -2.19888, 0.2784314, 1, 0, 1,
-0.5636495, 0.3756261, -0.713365, 0.2705882, 1, 0, 1,
-0.562989, -0.2074598, -1.722607, 0.2666667, 1, 0, 1,
-0.5587415, -0.319497, -2.700749, 0.2588235, 1, 0, 1,
-0.55807, -0.08426791, -1.808857, 0.254902, 1, 0, 1,
-0.5530213, 0.7588303, -1.626567, 0.2470588, 1, 0, 1,
-0.5518788, 0.1366652, -0.2918096, 0.2431373, 1, 0, 1,
-0.5513923, -0.5653377, -1.78461, 0.2352941, 1, 0, 1,
-0.5500668, -1.292062, -3.934602, 0.2313726, 1, 0, 1,
-0.5443633, -0.1699369, 0.5202388, 0.2235294, 1, 0, 1,
-0.5442296, 0.180022, 0.1729247, 0.2196078, 1, 0, 1,
-0.541646, 1.774148, -0.1800791, 0.2117647, 1, 0, 1,
-0.5368704, 1.173734, -0.072593, 0.2078431, 1, 0, 1,
-0.5354034, -0.07655834, -2.725489, 0.2, 1, 0, 1,
-0.5342138, -0.2721899, -1.884873, 0.1921569, 1, 0, 1,
-0.5329863, -0.1327871, -1.059725, 0.1882353, 1, 0, 1,
-0.5245969, 1.634344, -0.4752946, 0.1803922, 1, 0, 1,
-0.524403, -0.733031, -3.5305, 0.1764706, 1, 0, 1,
-0.5240232, 1.29829, 0.4313174, 0.1686275, 1, 0, 1,
-0.5233118, 1.788648, -1.170683, 0.1647059, 1, 0, 1,
-0.5229539, 1.265413, -0.0551162, 0.1568628, 1, 0, 1,
-0.5206189, -0.0159978, -2.733863, 0.1529412, 1, 0, 1,
-0.5179869, -0.8650602, -2.063549, 0.145098, 1, 0, 1,
-0.5151927, -0.9309587, -2.069149, 0.1411765, 1, 0, 1,
-0.5133944, 1.374366, 0.006981872, 0.1333333, 1, 0, 1,
-0.5126368, -0.763863, -1.83095, 0.1294118, 1, 0, 1,
-0.5120802, -0.6794312, -3.471887, 0.1215686, 1, 0, 1,
-0.5105535, 0.2911931, -0.2118861, 0.1176471, 1, 0, 1,
-0.5081588, 0.0376438, -1.938878, 0.1098039, 1, 0, 1,
-0.5076004, 0.4070701, -0.7615621, 0.1058824, 1, 0, 1,
-0.5061991, -0.1854971, -1.771136, 0.09803922, 1, 0, 1,
-0.5027224, 0.8991393, -2.25825, 0.09019608, 1, 0, 1,
-0.5022706, 0.13883, -1.473387, 0.08627451, 1, 0, 1,
-0.5019127, 0.2282332, 0.3232566, 0.07843138, 1, 0, 1,
-0.5002004, 0.5425301, 0.4720652, 0.07450981, 1, 0, 1,
-0.4895651, 1.287094, -1.156593, 0.06666667, 1, 0, 1,
-0.4895349, 0.9978189, -1.627301, 0.0627451, 1, 0, 1,
-0.4857593, 1.007375, 0.09885129, 0.05490196, 1, 0, 1,
-0.4807746, 0.7113358, 1.031769, 0.05098039, 1, 0, 1,
-0.4791986, -0.1927612, -1.595498, 0.04313726, 1, 0, 1,
-0.4783526, 0.6333289, -1.398522, 0.03921569, 1, 0, 1,
-0.4765463, -1.432432, -2.37259, 0.03137255, 1, 0, 1,
-0.4752766, 0.4456421, -1.655834, 0.02745098, 1, 0, 1,
-0.473586, -0.2960116, -2.879253, 0.01960784, 1, 0, 1,
-0.4666863, -0.1509441, -2.776203, 0.01568628, 1, 0, 1,
-0.4662299, 0.6924527, -0.1452166, 0.007843138, 1, 0, 1,
-0.4659982, -0.4058666, -1.71908, 0.003921569, 1, 0, 1,
-0.4627452, -2.55814, -3.068377, 0, 1, 0.003921569, 1,
-0.4622566, 1.21155, -0.9374091, 0, 1, 0.01176471, 1,
-0.4615318, 0.5559309, -1.021573, 0, 1, 0.01568628, 1,
-0.4599301, -1.123826, -2.910871, 0, 1, 0.02352941, 1,
-0.4575913, 2.053214, -0.4564024, 0, 1, 0.02745098, 1,
-0.4568349, -0.8002586, -3.132813, 0, 1, 0.03529412, 1,
-0.4554919, -1.727381, -0.7974502, 0, 1, 0.03921569, 1,
-0.4517422, 1.998667, -0.6099715, 0, 1, 0.04705882, 1,
-0.4454857, 0.2459911, -2.409052, 0, 1, 0.05098039, 1,
-0.4428345, 0.1562725, -0.7229149, 0, 1, 0.05882353, 1,
-0.4407162, -0.7125357, -4.865665, 0, 1, 0.0627451, 1,
-0.4346474, -0.3511654, -0.3779802, 0, 1, 0.07058824, 1,
-0.4280495, -0.2038546, -3.795165, 0, 1, 0.07450981, 1,
-0.4205996, 0.6738415, 0.4783643, 0, 1, 0.08235294, 1,
-0.4192297, 1.787729, 0.4336469, 0, 1, 0.08627451, 1,
-0.4186944, 1.236137, -1.034799, 0, 1, 0.09411765, 1,
-0.4168309, 0.5619207, 0.6394784, 0, 1, 0.1019608, 1,
-0.4151488, -0.7953415, -1.750419, 0, 1, 0.1058824, 1,
-0.4147007, 0.1708573, -1.507668, 0, 1, 0.1137255, 1,
-0.4136484, 1.025566, -0.6389316, 0, 1, 0.1176471, 1,
-0.4129254, 0.4865388, 0.2369113, 0, 1, 0.1254902, 1,
-0.4117871, 0.4298948, -0.08880198, 0, 1, 0.1294118, 1,
-0.408745, -0.185427, -2.25266, 0, 1, 0.1372549, 1,
-0.4085943, 0.5578243, -1.261285, 0, 1, 0.1411765, 1,
-0.4078175, -0.771075, -3.476393, 0, 1, 0.1490196, 1,
-0.4069259, -1.00124, -2.028035, 0, 1, 0.1529412, 1,
-0.404327, -0.5327274, -3.267107, 0, 1, 0.1607843, 1,
-0.3974049, -2.235595, -1.176902, 0, 1, 0.1647059, 1,
-0.3909734, 1.088009, 0.3952993, 0, 1, 0.172549, 1,
-0.3879651, 0.2370244, -0.7320169, 0, 1, 0.1764706, 1,
-0.3808952, -1.111069, -2.698189, 0, 1, 0.1843137, 1,
-0.3806081, 0.3068733, -0.7478256, 0, 1, 0.1882353, 1,
-0.3788297, 0.7562826, -0.658844, 0, 1, 0.1960784, 1,
-0.3780972, -1.291728, -2.713907, 0, 1, 0.2039216, 1,
-0.3779444, 0.722236, -0.7964116, 0, 1, 0.2078431, 1,
-0.3762902, -1.482018, -2.047348, 0, 1, 0.2156863, 1,
-0.3720616, -0.5944157, -2.045274, 0, 1, 0.2196078, 1,
-0.3703068, -1.615654, -3.175887, 0, 1, 0.227451, 1,
-0.3665313, -1.131692, -1.354643, 0, 1, 0.2313726, 1,
-0.3653655, -0.5207133, -2.877193, 0, 1, 0.2392157, 1,
-0.361206, 0.041631, -1.484924, 0, 1, 0.2431373, 1,
-0.358713, -0.09528463, -1.31675, 0, 1, 0.2509804, 1,
-0.3581397, -0.7221208, -1.862107, 0, 1, 0.254902, 1,
-0.3580299, -0.05294151, -1.787026, 0, 1, 0.2627451, 1,
-0.3568125, 0.08196346, -1.237298, 0, 1, 0.2666667, 1,
-0.3556899, 0.1574681, -2.807349, 0, 1, 0.2745098, 1,
-0.3513287, 0.4935166, -0.566297, 0, 1, 0.2784314, 1,
-0.3512888, -1.241178, -3.23938, 0, 1, 0.2862745, 1,
-0.3372063, -0.6311153, -0.8888429, 0, 1, 0.2901961, 1,
-0.3366542, 1.664525, 0.1502276, 0, 1, 0.2980392, 1,
-0.3352854, -0.2854315, -2.611312, 0, 1, 0.3058824, 1,
-0.3335716, 0.6822466, -0.9918671, 0, 1, 0.3098039, 1,
-0.3326479, 0.5875754, 0.9882132, 0, 1, 0.3176471, 1,
-0.3304672, 0.9145659, 0.9226421, 0, 1, 0.3215686, 1,
-0.3283829, -0.2981388, -1.959653, 0, 1, 0.3294118, 1,
-0.3280121, 1.369694, -0.0898562, 0, 1, 0.3333333, 1,
-0.3208866, -0.05540649, -0.1798639, 0, 1, 0.3411765, 1,
-0.3207473, 1.856754, 1.375081, 0, 1, 0.345098, 1,
-0.3203723, 0.9372217, 1.517215, 0, 1, 0.3529412, 1,
-0.3195798, -0.7102927, -4.250056, 0, 1, 0.3568628, 1,
-0.3063034, -1.436575, -2.549292, 0, 1, 0.3647059, 1,
-0.3059337, 1.069315, -1.10304, 0, 1, 0.3686275, 1,
-0.3056629, 0.7484427, -1.69945, 0, 1, 0.3764706, 1,
-0.3041913, -0.0198876, -3.018216, 0, 1, 0.3803922, 1,
-0.3036549, 1.110108, 1.027391, 0, 1, 0.3882353, 1,
-0.3009502, 0.9994028, 0.2253322, 0, 1, 0.3921569, 1,
-0.2998889, 0.6458599, 0.4234538, 0, 1, 0.4, 1,
-0.2973664, 0.4911383, -0.1737102, 0, 1, 0.4078431, 1,
-0.2959443, -0.2751382, -4.748555, 0, 1, 0.4117647, 1,
-0.2938316, 1.591582, 1.805215, 0, 1, 0.4196078, 1,
-0.2909861, -1.220437, -2.808022, 0, 1, 0.4235294, 1,
-0.2878552, 0.3697284, -0.8113107, 0, 1, 0.4313726, 1,
-0.2860833, 0.105686, 0.4913963, 0, 1, 0.4352941, 1,
-0.2836414, -0.8160492, -2.967049, 0, 1, 0.4431373, 1,
-0.2765063, -2.303351, -2.307701, 0, 1, 0.4470588, 1,
-0.2754793, 1.842103, -0.1688371, 0, 1, 0.454902, 1,
-0.2748821, -1.022629, -4.003152, 0, 1, 0.4588235, 1,
-0.2714981, 1.099285, -1.313804, 0, 1, 0.4666667, 1,
-0.2685027, 0.6026198, 0.5184517, 0, 1, 0.4705882, 1,
-0.2675639, 0.9159585, -2.707712, 0, 1, 0.4784314, 1,
-0.2673045, -1.205868, -2.197091, 0, 1, 0.4823529, 1,
-0.2630478, -0.1784603, -2.135834, 0, 1, 0.4901961, 1,
-0.2628225, 0.9296051, 0.7983392, 0, 1, 0.4941176, 1,
-0.2621781, 1.08768, 1.606207, 0, 1, 0.5019608, 1,
-0.2597854, 1.373805, -0.01536146, 0, 1, 0.509804, 1,
-0.2597475, -1.398168, -2.569761, 0, 1, 0.5137255, 1,
-0.2594886, 0.5029403, -0.2697859, 0, 1, 0.5215687, 1,
-0.2589484, -2.012443, -2.890257, 0, 1, 0.5254902, 1,
-0.2589166, 0.2218917, -0.7450735, 0, 1, 0.5333334, 1,
-0.2568271, 1.907493, -0.4899197, 0, 1, 0.5372549, 1,
-0.2538844, -0.6807837, -3.702999, 0, 1, 0.5450981, 1,
-0.2533372, -0.2136815, -1.401142, 0, 1, 0.5490196, 1,
-0.242809, -0.2669461, -2.651896, 0, 1, 0.5568628, 1,
-0.2409824, -1.125463, -4.015561, 0, 1, 0.5607843, 1,
-0.2400136, -0.08345703, -3.055659, 0, 1, 0.5686275, 1,
-0.2388701, 0.0380497, -1.342932, 0, 1, 0.572549, 1,
-0.237158, -0.6150967, -4.765495, 0, 1, 0.5803922, 1,
-0.2303759, -1.304978, -2.111652, 0, 1, 0.5843138, 1,
-0.2249542, 0.2509606, 0.6911758, 0, 1, 0.5921569, 1,
-0.224928, -0.4053453, -4.077601, 0, 1, 0.5960785, 1,
-0.2229295, -0.550697, -4.39369, 0, 1, 0.6039216, 1,
-0.2198544, -0.2119131, -3.537283, 0, 1, 0.6117647, 1,
-0.2181563, 0.5547196, 0.1197107, 0, 1, 0.6156863, 1,
-0.2154107, -1.143517, -3.207009, 0, 1, 0.6235294, 1,
-0.2136017, -0.5449817, -3.401422, 0, 1, 0.627451, 1,
-0.2103968, -0.008679679, -1.810108, 0, 1, 0.6352941, 1,
-0.2067512, 1.10502, 0.0201546, 0, 1, 0.6392157, 1,
-0.2036677, 0.2258868, 1.334901, 0, 1, 0.6470588, 1,
-0.2001515, 1.257995, 0.6316217, 0, 1, 0.6509804, 1,
-0.1968488, -0.356232, -2.885417, 0, 1, 0.6588235, 1,
-0.1912181, -0.8405983, -3.157678, 0, 1, 0.6627451, 1,
-0.1900854, 0.9915709, 0.6995766, 0, 1, 0.6705883, 1,
-0.1868763, 0.5570759, 0.9719926, 0, 1, 0.6745098, 1,
-0.1848349, -0.6896713, -2.966461, 0, 1, 0.682353, 1,
-0.182706, 0.06623179, -1.547177, 0, 1, 0.6862745, 1,
-0.1820735, -1.018096, -4.211997, 0, 1, 0.6941177, 1,
-0.181928, 0.6746247, 0.5105535, 0, 1, 0.7019608, 1,
-0.1780796, -1.114422, -0.8706051, 0, 1, 0.7058824, 1,
-0.1778173, -0.1358444, -1.12712, 0, 1, 0.7137255, 1,
-0.1764128, -0.6931021, -4.563347, 0, 1, 0.7176471, 1,
-0.1753622, 0.387854, -0.4816101, 0, 1, 0.7254902, 1,
-0.1645747, 1.148197, -0.7653348, 0, 1, 0.7294118, 1,
-0.1642902, -1.572346, -1.721808, 0, 1, 0.7372549, 1,
-0.1614555, -1.178546, -4.596213, 0, 1, 0.7411765, 1,
-0.1602751, 0.4924664, 0.7866198, 0, 1, 0.7490196, 1,
-0.1593626, -0.2967402, -3.265485, 0, 1, 0.7529412, 1,
-0.1585326, -0.4783553, -3.405613, 0, 1, 0.7607843, 1,
-0.1583006, 0.1488267, 0.1857246, 0, 1, 0.7647059, 1,
-0.1580147, -0.1887771, -3.26527, 0, 1, 0.772549, 1,
-0.1539722, -0.2247813, -3.4018, 0, 1, 0.7764706, 1,
-0.1535289, -0.2971911, -2.964782, 0, 1, 0.7843137, 1,
-0.1528077, 0.2085862, -1.159888, 0, 1, 0.7882353, 1,
-0.1522161, 0.3572838, -1.536448, 0, 1, 0.7960784, 1,
-0.1502075, -0.5210218, -3.67625, 0, 1, 0.8039216, 1,
-0.1381241, -0.1173273, -2.393082, 0, 1, 0.8078431, 1,
-0.1378025, 0.5341106, -1.63732, 0, 1, 0.8156863, 1,
-0.1363063, -2.972235, -4.237753, 0, 1, 0.8196079, 1,
-0.1328835, -0.9972746, -3.61596, 0, 1, 0.827451, 1,
-0.1301678, -0.1083463, -2.454706, 0, 1, 0.8313726, 1,
-0.1289336, -0.6098231, -1.551406, 0, 1, 0.8392157, 1,
-0.1240115, 1.041327, -0.1951881, 0, 1, 0.8431373, 1,
-0.1158703, 0.1298864, -3.274775, 0, 1, 0.8509804, 1,
-0.1148736, -0.3545333, -2.285545, 0, 1, 0.854902, 1,
-0.1060568, -0.03166589, -1.556696, 0, 1, 0.8627451, 1,
-0.1008569, 0.6294528, 1.156401, 0, 1, 0.8666667, 1,
-0.09656496, -1.092228, -1.229366, 0, 1, 0.8745098, 1,
-0.09600388, 0.8864779, -0.9795452, 0, 1, 0.8784314, 1,
-0.09389826, -0.7763432, -2.607993, 0, 1, 0.8862745, 1,
-0.08927952, -1.265838, -2.455684, 0, 1, 0.8901961, 1,
-0.08369981, -0.4382172, -2.775241, 0, 1, 0.8980392, 1,
-0.07598949, 1.994056, -1.966291, 0, 1, 0.9058824, 1,
-0.07556498, 0.29837, -0.7004275, 0, 1, 0.9098039, 1,
-0.07307432, -0.2923111, -2.191033, 0, 1, 0.9176471, 1,
-0.07029435, 1.091279, -0.6824421, 0, 1, 0.9215686, 1,
-0.07011089, -0.4151331, -4.263241, 0, 1, 0.9294118, 1,
-0.06942983, -1.039071, -3.383249, 0, 1, 0.9333333, 1,
-0.06942834, -0.02309606, 0.3592384, 0, 1, 0.9411765, 1,
-0.0676271, -0.02785837, -1.912621, 0, 1, 0.945098, 1,
-0.06662348, 0.534142, -1.561345, 0, 1, 0.9529412, 1,
-0.06479573, 0.08464545, -1.987441, 0, 1, 0.9568627, 1,
-0.06462191, -0.01243826, -3.333374, 0, 1, 0.9647059, 1,
-0.06136224, 1.090876, -1.153302, 0, 1, 0.9686275, 1,
-0.05563533, 1.098648, 0.2985562, 0, 1, 0.9764706, 1,
-0.05393278, -1.527002, -3.868543, 0, 1, 0.9803922, 1,
-0.05366945, 1.079723, -0.1355798, 0, 1, 0.9882353, 1,
-0.05335971, 1.188797, 0.6099665, 0, 1, 0.9921569, 1,
-0.03997983, -0.7959864, -2.835141, 0, 1, 1, 1,
-0.03929554, 0.173467, -0.25965, 0, 0.9921569, 1, 1,
-0.02967712, -0.00636045, -1.593357, 0, 0.9882353, 1, 1,
-0.0266213, -0.4305732, -2.799302, 0, 0.9803922, 1, 1,
-0.0231952, -0.9145175, -3.517036, 0, 0.9764706, 1, 1,
-0.02260372, 0.8458301, -0.3216898, 0, 0.9686275, 1, 1,
-0.02072708, -1.60115, -3.938769, 0, 0.9647059, 1, 1,
-0.01780255, 2.23764, 0.1931974, 0, 0.9568627, 1, 1,
-0.01654953, 0.1753717, -0.6292476, 0, 0.9529412, 1, 1,
-0.01483432, -0.28542, -2.806191, 0, 0.945098, 1, 1,
-0.01412766, 0.6416628, 0.1367265, 0, 0.9411765, 1, 1,
-0.01224024, 0.2267763, 0.9407836, 0, 0.9333333, 1, 1,
-0.009702718, -0.08396569, -4.139828, 0, 0.9294118, 1, 1,
-0.007989116, 0.4647285, 1.939061, 0, 0.9215686, 1, 1,
-0.003429477, -2.527969, -3.822131, 0, 0.9176471, 1, 1,
-0.001531554, 0.1809323, 0.04921243, 0, 0.9098039, 1, 1,
-0.0002931499, 0.3925994, 1.136266, 0, 0.9058824, 1, 1,
0.002714402, -0.5633905, 2.130751, 0, 0.8980392, 1, 1,
0.004057734, -0.5103212, 2.075835, 0, 0.8901961, 1, 1,
0.004579972, -0.1936634, 4.44913, 0, 0.8862745, 1, 1,
0.006794534, -0.7939889, 2.99191, 0, 0.8784314, 1, 1,
0.007687951, 0.4542054, 0.09766964, 0, 0.8745098, 1, 1,
0.01411112, -0.03098916, 2.250533, 0, 0.8666667, 1, 1,
0.02054834, -0.4841001, 4.099078, 0, 0.8627451, 1, 1,
0.02635607, -0.09722366, 1.474648, 0, 0.854902, 1, 1,
0.02653496, -0.9686534, 2.817962, 0, 0.8509804, 1, 1,
0.02732969, -0.2311688, 3.512697, 0, 0.8431373, 1, 1,
0.03056309, 0.2882685, -0.9425799, 0, 0.8392157, 1, 1,
0.030765, 1.42223, -0.3576785, 0, 0.8313726, 1, 1,
0.03145214, -1.716132, 3.585464, 0, 0.827451, 1, 1,
0.03165222, 1.086016, -0.1355686, 0, 0.8196079, 1, 1,
0.04334803, 0.07068407, 0.6637052, 0, 0.8156863, 1, 1,
0.04486211, -0.2767471, 2.999052, 0, 0.8078431, 1, 1,
0.04638235, -2.058244, 2.853732, 0, 0.8039216, 1, 1,
0.04802958, 0.6845782, -1.244212, 0, 0.7960784, 1, 1,
0.05007076, 0.8703915, -2.509036, 0, 0.7882353, 1, 1,
0.05058903, 0.3038838, 0.07238245, 0, 0.7843137, 1, 1,
0.05073734, 0.4130804, 1.843477, 0, 0.7764706, 1, 1,
0.05895952, 0.751417, -0.514446, 0, 0.772549, 1, 1,
0.06132702, 0.3079463, 0.6914594, 0, 0.7647059, 1, 1,
0.06170559, 2.633969, -0.294021, 0, 0.7607843, 1, 1,
0.06316364, 0.5056483, -0.5929371, 0, 0.7529412, 1, 1,
0.06467916, 3.091689, -2.694363, 0, 0.7490196, 1, 1,
0.06772459, -1.862764, 4.005109, 0, 0.7411765, 1, 1,
0.06870575, 0.4165777, 0.2365503, 0, 0.7372549, 1, 1,
0.07008737, 0.2464202, 2.423065, 0, 0.7294118, 1, 1,
0.07171188, -1.960762, 1.485621, 0, 0.7254902, 1, 1,
0.07493043, 0.2829329, 1.08652, 0, 0.7176471, 1, 1,
0.07584176, 0.5481403, -0.4284702, 0, 0.7137255, 1, 1,
0.08455878, -0.0188255, 0.6106907, 0, 0.7058824, 1, 1,
0.08785459, 0.137192, 1.29087, 0, 0.6980392, 1, 1,
0.09042075, -1.103063, 5.437187, 0, 0.6941177, 1, 1,
0.09287953, 0.3061384, -0.4863623, 0, 0.6862745, 1, 1,
0.09550785, -0.2906694, 4.110244, 0, 0.682353, 1, 1,
0.09565578, -1.260146, 2.880412, 0, 0.6745098, 1, 1,
0.09596487, 0.02403929, 1.576536, 0, 0.6705883, 1, 1,
0.09633711, 1.533659, 0.4851584, 0, 0.6627451, 1, 1,
0.09967524, 0.1713157, 1.901873, 0, 0.6588235, 1, 1,
0.09999187, -0.1820337, 4.766774, 0, 0.6509804, 1, 1,
0.1027711, 2.201828, 0.5731807, 0, 0.6470588, 1, 1,
0.1034994, -1.57762, 2.732655, 0, 0.6392157, 1, 1,
0.1083242, 0.159091, 1.750663, 0, 0.6352941, 1, 1,
0.1096391, -1.007359, 2.518279, 0, 0.627451, 1, 1,
0.1139875, -0.0564179, 1.295407, 0, 0.6235294, 1, 1,
0.1145263, 1.133301, -0.4541108, 0, 0.6156863, 1, 1,
0.1149442, 2.432389, -1.129428, 0, 0.6117647, 1, 1,
0.1184466, 0.7630066, 1.476029, 0, 0.6039216, 1, 1,
0.119694, 0.9669837, -1.343015, 0, 0.5960785, 1, 1,
0.1239586, -0.2309706, 1.502559, 0, 0.5921569, 1, 1,
0.1247631, 0.939702, -0.0004876899, 0, 0.5843138, 1, 1,
0.1277543, -0.2839009, 2.54473, 0, 0.5803922, 1, 1,
0.1281998, 2.16159, 0.59137, 0, 0.572549, 1, 1,
0.1341439, -0.2721291, 1.40696, 0, 0.5686275, 1, 1,
0.1376283, 0.8326405, -1.280592, 0, 0.5607843, 1, 1,
0.1390066, -0.534945, 2.561612, 0, 0.5568628, 1, 1,
0.1441955, 1.831785, -2.557447, 0, 0.5490196, 1, 1,
0.1467842, 2.208562, -1.53615, 0, 0.5450981, 1, 1,
0.1485484, -0.8476273, 2.168489, 0, 0.5372549, 1, 1,
0.1489444, -0.1899281, 1.875237, 0, 0.5333334, 1, 1,
0.1561846, -0.07271349, 2.507754, 0, 0.5254902, 1, 1,
0.1579443, -1.593017, 2.017975, 0, 0.5215687, 1, 1,
0.1586871, 0.1554988, 1.105183, 0, 0.5137255, 1, 1,
0.1633765, 0.5307548, 1.035683, 0, 0.509804, 1, 1,
0.163478, -0.3961141, 2.597061, 0, 0.5019608, 1, 1,
0.1636589, -2.607206, 2.519462, 0, 0.4941176, 1, 1,
0.1656973, -0.6950523, 2.346413, 0, 0.4901961, 1, 1,
0.1659726, 1.024213, 0.6157618, 0, 0.4823529, 1, 1,
0.1660261, 1.805613, -0.8117595, 0, 0.4784314, 1, 1,
0.1680738, -1.402389, 3.045792, 0, 0.4705882, 1, 1,
0.1695701, -1.315507, 2.017387, 0, 0.4666667, 1, 1,
0.1743239, 0.4727984, 0.1283888, 0, 0.4588235, 1, 1,
0.180864, -0.1613147, 3.693319, 0, 0.454902, 1, 1,
0.1830261, -0.8451928, 2.710932, 0, 0.4470588, 1, 1,
0.1912803, -0.4649365, 2.244805, 0, 0.4431373, 1, 1,
0.1918986, 0.004524705, 1.950144, 0, 0.4352941, 1, 1,
0.1947211, -0.3134204, 3.070981, 0, 0.4313726, 1, 1,
0.1979333, -1.833991, 2.399553, 0, 0.4235294, 1, 1,
0.2002246, -1.1377, 0.4852885, 0, 0.4196078, 1, 1,
0.2023962, 1.24084, 0.1448857, 0, 0.4117647, 1, 1,
0.2073411, -0.2289976, 3.171571, 0, 0.4078431, 1, 1,
0.2143397, 1.440542, -1.341501, 0, 0.4, 1, 1,
0.2175754, 0.839425, 0.07379995, 0, 0.3921569, 1, 1,
0.2198862, 1.498818, -0.4726775, 0, 0.3882353, 1, 1,
0.2212009, 0.5083314, 1.483561, 0, 0.3803922, 1, 1,
0.2238925, 0.8698235, 0.6524141, 0, 0.3764706, 1, 1,
0.2239215, -0.6287397, 3.249961, 0, 0.3686275, 1, 1,
0.2246237, 1.65456, 2.247227, 0, 0.3647059, 1, 1,
0.2299794, 0.9681149, -0.3610551, 0, 0.3568628, 1, 1,
0.2387566, -0.6746261, 2.609592, 0, 0.3529412, 1, 1,
0.2394325, -0.2512973, 1.397942, 0, 0.345098, 1, 1,
0.2440475, -0.05687496, 2.12327, 0, 0.3411765, 1, 1,
0.2441887, -0.1475749, 1.709567, 0, 0.3333333, 1, 1,
0.250972, -0.7813329, 2.730645, 0, 0.3294118, 1, 1,
0.2519702, 1.680203, -0.7588935, 0, 0.3215686, 1, 1,
0.2534483, 1.069658, 1.429029, 0, 0.3176471, 1, 1,
0.2535287, -0.4751832, 2.828781, 0, 0.3098039, 1, 1,
0.2547005, 0.5475183, 1.694502, 0, 0.3058824, 1, 1,
0.2576305, -0.3845888, 1.582102, 0, 0.2980392, 1, 1,
0.2592153, -0.9360675, 2.295854, 0, 0.2901961, 1, 1,
0.2621999, -1.206849, 2.630384, 0, 0.2862745, 1, 1,
0.2627643, -0.4359846, 3.036757, 0, 0.2784314, 1, 1,
0.2637892, 0.726799, 0.4355394, 0, 0.2745098, 1, 1,
0.2647663, -2.031466, 2.190855, 0, 0.2666667, 1, 1,
0.2658211, 0.2671725, 1.647126, 0, 0.2627451, 1, 1,
0.2689469, 0.5530303, 0.7772184, 0, 0.254902, 1, 1,
0.2708864, 1.251648, -0.8057266, 0, 0.2509804, 1, 1,
0.2763683, 0.4256676, -0.4870574, 0, 0.2431373, 1, 1,
0.2811939, -0.5619687, 2.507199, 0, 0.2392157, 1, 1,
0.2828591, 0.7798268, 0.8148582, 0, 0.2313726, 1, 1,
0.2847806, 0.275313, 1.377623, 0, 0.227451, 1, 1,
0.2880267, 0.3105773, 0.646488, 0, 0.2196078, 1, 1,
0.3039559, 0.03372306, 3.036996, 0, 0.2156863, 1, 1,
0.3047977, -1.164555, 2.621482, 0, 0.2078431, 1, 1,
0.3049009, 1.699883, -0.2695859, 0, 0.2039216, 1, 1,
0.306499, -0.3383336, 2.995296, 0, 0.1960784, 1, 1,
0.3069713, -0.4378989, 2.903612, 0, 0.1882353, 1, 1,
0.3091413, 1.295905, 1.087121, 0, 0.1843137, 1, 1,
0.3111247, -1.127722, 2.645567, 0, 0.1764706, 1, 1,
0.3154472, 0.1910699, 0.2565783, 0, 0.172549, 1, 1,
0.3174708, 0.4807042, 0.319737, 0, 0.1647059, 1, 1,
0.3238506, -0.460274, 2.89853, 0, 0.1607843, 1, 1,
0.325395, -0.7639142, 3.930486, 0, 0.1529412, 1, 1,
0.326098, 1.090882, -0.03240369, 0, 0.1490196, 1, 1,
0.3364716, -0.9470351, 3.674756, 0, 0.1411765, 1, 1,
0.3454608, -0.446773, 3.820535, 0, 0.1372549, 1, 1,
0.3472707, 0.1589795, 1.58793, 0, 0.1294118, 1, 1,
0.3486536, -0.3849542, 2.729026, 0, 0.1254902, 1, 1,
0.3487019, 1.969215, -0.430514, 0, 0.1176471, 1, 1,
0.3524562, -0.8285848, 2.64077, 0, 0.1137255, 1, 1,
0.3531992, -0.8052866, 2.344461, 0, 0.1058824, 1, 1,
0.3552545, -1.240715, 1.923231, 0, 0.09803922, 1, 1,
0.3580992, -2.029723, 4.468544, 0, 0.09411765, 1, 1,
0.36059, 0.9944561, 0.7230081, 0, 0.08627451, 1, 1,
0.3635787, -0.4208012, 3.801905, 0, 0.08235294, 1, 1,
0.3666759, 1.154018, 0.7154495, 0, 0.07450981, 1, 1,
0.368665, -0.7593579, 3.581961, 0, 0.07058824, 1, 1,
0.3764842, -0.9412621, 4.388679, 0, 0.0627451, 1, 1,
0.3819291, -0.855206, 2.125126, 0, 0.05882353, 1, 1,
0.382164, -1.133381, 1.581354, 0, 0.05098039, 1, 1,
0.382264, -1.231522, 2.904914, 0, 0.04705882, 1, 1,
0.3852346, 0.05645605, 2.340341, 0, 0.03921569, 1, 1,
0.3892837, -0.740482, 2.393766, 0, 0.03529412, 1, 1,
0.3939368, -0.3602428, 3.276884, 0, 0.02745098, 1, 1,
0.3997015, 0.7818159, 2.077188, 0, 0.02352941, 1, 1,
0.4007941, -0.04507418, 1.8097, 0, 0.01568628, 1, 1,
0.4065409, 0.4091145, 1.138572, 0, 0.01176471, 1, 1,
0.410291, -1.564855, 2.418474, 0, 0.003921569, 1, 1,
0.4137613, -2.491157, 2.769783, 0.003921569, 0, 1, 1,
0.4157382, -1.017475, 1.167848, 0.007843138, 0, 1, 1,
0.4217402, -0.06542759, 1.641167, 0.01568628, 0, 1, 1,
0.4264708, 0.1684646, -1.775502, 0.01960784, 0, 1, 1,
0.427336, -0.1129884, 2.66535, 0.02745098, 0, 1, 1,
0.4313456, 0.7789767, 1.452242, 0.03137255, 0, 1, 1,
0.4347534, 0.5358353, -0.5528642, 0.03921569, 0, 1, 1,
0.4403115, 0.4217074, -0.364634, 0.04313726, 0, 1, 1,
0.4438334, -1.55022, 2.284341, 0.05098039, 0, 1, 1,
0.446198, -0.7931934, 2.64063, 0.05490196, 0, 1, 1,
0.4507611, -0.106723, 2.858524, 0.0627451, 0, 1, 1,
0.4535714, -0.06793474, 2.778975, 0.06666667, 0, 1, 1,
0.4558467, 0.9296712, 1.210992, 0.07450981, 0, 1, 1,
0.4585883, -0.07022426, 1.578081, 0.07843138, 0, 1, 1,
0.4620778, 2.181638, 1.048832, 0.08627451, 0, 1, 1,
0.4636492, -0.9481533, 2.236351, 0.09019608, 0, 1, 1,
0.4637974, -1.174435, 1.398873, 0.09803922, 0, 1, 1,
0.4679119, -0.001398543, 0.8112285, 0.1058824, 0, 1, 1,
0.4723031, 0.5009528, -0.4885243, 0.1098039, 0, 1, 1,
0.4754852, -0.623454, 1.057856, 0.1176471, 0, 1, 1,
0.4901129, -0.9656221, 1.396034, 0.1215686, 0, 1, 1,
0.4913901, -0.8826577, 1.796381, 0.1294118, 0, 1, 1,
0.5007818, 0.3954175, 0.8727493, 0.1333333, 0, 1, 1,
0.5013379, 1.359974, 1.090847, 0.1411765, 0, 1, 1,
0.5013841, -0.8746639, 3.85811, 0.145098, 0, 1, 1,
0.5037317, 0.7387828, -0.6600385, 0.1529412, 0, 1, 1,
0.5070155, -1.087126, 2.79841, 0.1568628, 0, 1, 1,
0.5093185, -1.130076, 1.643546, 0.1647059, 0, 1, 1,
0.5131015, 1.652488, 0.3798628, 0.1686275, 0, 1, 1,
0.5141912, 1.227598, 0.05477314, 0.1764706, 0, 1, 1,
0.5216748, 0.6439273, 0.428131, 0.1803922, 0, 1, 1,
0.522103, 0.1797716, 0.8911874, 0.1882353, 0, 1, 1,
0.5299575, -1.798084, 4.349057, 0.1921569, 0, 1, 1,
0.533744, -2.609699, 1.596975, 0.2, 0, 1, 1,
0.5339345, -0.4524106, 3.122154, 0.2078431, 0, 1, 1,
0.5362539, 0.4736149, 3.008045, 0.2117647, 0, 1, 1,
0.5441231, 0.8387913, -1.022467, 0.2196078, 0, 1, 1,
0.5499764, -0.8334556, 1.926317, 0.2235294, 0, 1, 1,
0.5531654, -0.2065834, 1.541026, 0.2313726, 0, 1, 1,
0.5616708, -0.9243485, 1.342937, 0.2352941, 0, 1, 1,
0.5641438, 0.07840782, 2.670007, 0.2431373, 0, 1, 1,
0.5694593, 0.5764757, 3.503332, 0.2470588, 0, 1, 1,
0.5711036, -0.4881585, 2.895402, 0.254902, 0, 1, 1,
0.5742802, 1.704759, 0.7876784, 0.2588235, 0, 1, 1,
0.5795529, 0.8254123, -0.7698543, 0.2666667, 0, 1, 1,
0.580834, -1.108645, 3.295791, 0.2705882, 0, 1, 1,
0.5809588, 0.7052691, 0.5976143, 0.2784314, 0, 1, 1,
0.5815369, 1.048708, 0.6513234, 0.282353, 0, 1, 1,
0.5824352, -0.8940139, 1.980436, 0.2901961, 0, 1, 1,
0.5829104, -0.1579563, 1.722736, 0.2941177, 0, 1, 1,
0.5858054, 0.4476109, 2.185071, 0.3019608, 0, 1, 1,
0.5862075, 1.186969, 0.5024574, 0.3098039, 0, 1, 1,
0.5886254, -1.032041, 3.699446, 0.3137255, 0, 1, 1,
0.5899075, -0.6659632, 2.077849, 0.3215686, 0, 1, 1,
0.5900284, -0.6511771, 1.274431, 0.3254902, 0, 1, 1,
0.5909085, 0.7382584, 0.8243498, 0.3333333, 0, 1, 1,
0.5911915, -0.8857995, 2.793993, 0.3372549, 0, 1, 1,
0.5980129, -0.2855027, 2.183639, 0.345098, 0, 1, 1,
0.6001576, -0.0651122, 0.3066495, 0.3490196, 0, 1, 1,
0.6091526, -1.348389, 4.160424, 0.3568628, 0, 1, 1,
0.6135748, -0.2043433, 0.7230678, 0.3607843, 0, 1, 1,
0.615781, 0.3981392, 0.5003136, 0.3686275, 0, 1, 1,
0.6179234, 0.2042557, 0.6760359, 0.372549, 0, 1, 1,
0.6181468, -0.8493019, 2.59139, 0.3803922, 0, 1, 1,
0.6185325, 0.8060678, 0.4537697, 0.3843137, 0, 1, 1,
0.6350835, -1.142211, 4.497038, 0.3921569, 0, 1, 1,
0.6375203, -0.9055888, 3.26062, 0.3960784, 0, 1, 1,
0.6413462, 0.8860406, 1.301789, 0.4039216, 0, 1, 1,
0.6443837, -0.1444284, 1.000201, 0.4117647, 0, 1, 1,
0.6462817, 0.04627108, 0.5406287, 0.4156863, 0, 1, 1,
0.6472721, -1.07529, 2.085025, 0.4235294, 0, 1, 1,
0.6485828, 2.08038, -0.1049692, 0.427451, 0, 1, 1,
0.6487446, -0.4806313, 2.712242, 0.4352941, 0, 1, 1,
0.6501386, -0.01766199, 1.594179, 0.4392157, 0, 1, 1,
0.6501958, -0.6365703, 2.48806, 0.4470588, 0, 1, 1,
0.6503602, 0.4850686, 2.081305, 0.4509804, 0, 1, 1,
0.6564953, -1.67179, 3.296261, 0.4588235, 0, 1, 1,
0.6566371, 0.9620542, 0.3780939, 0.4627451, 0, 1, 1,
0.6601607, 0.9883075, 0.4684911, 0.4705882, 0, 1, 1,
0.6608711, -0.2218619, 0.4619912, 0.4745098, 0, 1, 1,
0.6627188, 1.686744, 0.2882084, 0.4823529, 0, 1, 1,
0.6634476, -0.2186794, 2.807188, 0.4862745, 0, 1, 1,
0.6695843, -0.8883354, 3.855867, 0.4941176, 0, 1, 1,
0.6707836, -1.378672, 2.981445, 0.5019608, 0, 1, 1,
0.6712698, 0.645542, 0.7917745, 0.5058824, 0, 1, 1,
0.6727937, 0.0864396, 0.6655575, 0.5137255, 0, 1, 1,
0.6729512, 0.3999255, 1.136781, 0.5176471, 0, 1, 1,
0.6781121, 0.8211994, 0.06530889, 0.5254902, 0, 1, 1,
0.680821, 0.7549539, 0.5086721, 0.5294118, 0, 1, 1,
0.6824904, 0.4997168, 1.064255, 0.5372549, 0, 1, 1,
0.6858279, -0.4652608, 1.400283, 0.5411765, 0, 1, 1,
0.6868626, -0.9522082, 2.658875, 0.5490196, 0, 1, 1,
0.6964023, -0.8353445, 4.128896, 0.5529412, 0, 1, 1,
0.7009374, 0.4807743, 2.704278, 0.5607843, 0, 1, 1,
0.7057012, 0.08474796, 0.164482, 0.5647059, 0, 1, 1,
0.7070675, -1.899766, 2.046839, 0.572549, 0, 1, 1,
0.7120575, 0.3539509, 2.389247, 0.5764706, 0, 1, 1,
0.7166942, -0.2948767, 3.638957, 0.5843138, 0, 1, 1,
0.7191575, -0.07086349, 1.929513, 0.5882353, 0, 1, 1,
0.7193898, -1.503809, 2.539855, 0.5960785, 0, 1, 1,
0.7197033, 1.39644, 0.3356471, 0.6039216, 0, 1, 1,
0.7205874, -0.04973383, -0.2632643, 0.6078432, 0, 1, 1,
0.729188, -1.083546, 2.057138, 0.6156863, 0, 1, 1,
0.7298872, -1.917287, 3.518473, 0.6196079, 0, 1, 1,
0.7376371, 1.092744, -1.374631, 0.627451, 0, 1, 1,
0.7381114, 0.536995, 0.9278258, 0.6313726, 0, 1, 1,
0.7491657, 0.06860949, 0.8444058, 0.6392157, 0, 1, 1,
0.7493132, 1.077896, 0.5140406, 0.6431373, 0, 1, 1,
0.7534881, -0.05880972, 0.7296099, 0.6509804, 0, 1, 1,
0.7555475, 0.6597589, 2.542403, 0.654902, 0, 1, 1,
0.7605973, 0.8276753, -0.4824696, 0.6627451, 0, 1, 1,
0.7618066, -0.6373653, 2.533789, 0.6666667, 0, 1, 1,
0.7643817, -1.036734, 2.771215, 0.6745098, 0, 1, 1,
0.7652967, 1.132884, 0.8649679, 0.6784314, 0, 1, 1,
0.7671671, 0.6428683, 1.128908, 0.6862745, 0, 1, 1,
0.7730915, 0.5777176, 0.2603541, 0.6901961, 0, 1, 1,
0.7820082, 1.018702, -0.7215529, 0.6980392, 0, 1, 1,
0.7823192, 1.125836, 0.8502507, 0.7058824, 0, 1, 1,
0.7823572, -1.155379, 3.338585, 0.7098039, 0, 1, 1,
0.7830788, 0.6194096, 1.677901, 0.7176471, 0, 1, 1,
0.7837096, 0.5633457, 0.4599862, 0.7215686, 0, 1, 1,
0.7886369, 0.331281, -1.108813, 0.7294118, 0, 1, 1,
0.7896912, -1.249429, 1.921757, 0.7333333, 0, 1, 1,
0.7922073, -0.2393768, 1.431023, 0.7411765, 0, 1, 1,
0.7922413, 0.4331418, 2.092626, 0.7450981, 0, 1, 1,
0.7936199, -0.2026734, 0.08163191, 0.7529412, 0, 1, 1,
0.7942759, 0.1011173, -0.08647277, 0.7568628, 0, 1, 1,
0.7945326, 0.5654648, 0.7706702, 0.7647059, 0, 1, 1,
0.7951112, 0.2636487, 1.567013, 0.7686275, 0, 1, 1,
0.7951427, 0.1836252, 1.634597, 0.7764706, 0, 1, 1,
0.7962123, -0.01320615, 0.7914904, 0.7803922, 0, 1, 1,
0.7964706, 0.07643764, 2.239617, 0.7882353, 0, 1, 1,
0.7965448, 0.2322419, 2.21031, 0.7921569, 0, 1, 1,
0.7989108, -0.2345273, 2.284816, 0.8, 0, 1, 1,
0.8154866, 0.06544599, 1.225419, 0.8078431, 0, 1, 1,
0.8174267, 0.3891392, 0.9446505, 0.8117647, 0, 1, 1,
0.8206726, -1.542749, 3.562187, 0.8196079, 0, 1, 1,
0.8241286, 0.7536218, 1.059388, 0.8235294, 0, 1, 1,
0.8249459, -0.4179979, 1.703853, 0.8313726, 0, 1, 1,
0.8350903, -0.9604385, 2.474351, 0.8352941, 0, 1, 1,
0.8388578, -1.100843, 1.621469, 0.8431373, 0, 1, 1,
0.839085, -1.718323, 1.775827, 0.8470588, 0, 1, 1,
0.8408283, 0.5554878, 1.987761, 0.854902, 0, 1, 1,
0.846646, 0.8886445, -0.9768772, 0.8588235, 0, 1, 1,
0.8469123, -1.3349, 0.400858, 0.8666667, 0, 1, 1,
0.847714, 0.9225767, 0.793094, 0.8705882, 0, 1, 1,
0.847788, -0.5184404, 2.02498, 0.8784314, 0, 1, 1,
0.848479, -0.6842817, 3.578513, 0.8823529, 0, 1, 1,
0.8490813, 1.043187, 1.125559, 0.8901961, 0, 1, 1,
0.8493211, 0.25199, 1.648046, 0.8941177, 0, 1, 1,
0.8575034, 2.233309, -0.2915737, 0.9019608, 0, 1, 1,
0.8600733, -1.214285, 4.506352, 0.9098039, 0, 1, 1,
0.8600974, -1.328939, 1.235472, 0.9137255, 0, 1, 1,
0.8610849, 0.7878169, 0.5520685, 0.9215686, 0, 1, 1,
0.8629718, 0.5787426, 1.136379, 0.9254902, 0, 1, 1,
0.868241, -0.5140634, 3.117881, 0.9333333, 0, 1, 1,
0.8871225, 0.3714525, 1.17712, 0.9372549, 0, 1, 1,
0.9015194, 0.1190493, 1.947612, 0.945098, 0, 1, 1,
0.9059538, 1.985802, 0.7386529, 0.9490196, 0, 1, 1,
0.9145707, -1.524317, 0.9684111, 0.9568627, 0, 1, 1,
0.9490168, 0.2088232, 0.8389155, 0.9607843, 0, 1, 1,
0.9536657, -0.186184, 0.9186001, 0.9686275, 0, 1, 1,
0.9567323, 0.4312226, 3.199837, 0.972549, 0, 1, 1,
0.9574156, 1.310416, 0.161789, 0.9803922, 0, 1, 1,
0.9636746, 0.8894001, 1.958717, 0.9843137, 0, 1, 1,
0.9677429, -0.7311226, 2.535565, 0.9921569, 0, 1, 1,
0.9696033, 1.325221, -0.06271295, 0.9960784, 0, 1, 1,
0.9736004, -0.8497817, 2.53249, 1, 0, 0.9960784, 1,
0.9740949, -0.496922, -0.2990511, 1, 0, 0.9882353, 1,
0.9744728, -0.01665752, 1.685267, 1, 0, 0.9843137, 1,
0.9780868, -0.697028, 0.8918089, 1, 0, 0.9764706, 1,
0.9799602, 0.7183836, 2.224161, 1, 0, 0.972549, 1,
0.9815237, 1.384348, 0.1980483, 1, 0, 0.9647059, 1,
0.9829072, -0.9047577, 0.294175, 1, 0, 0.9607843, 1,
0.9860096, -0.1452982, 2.361208, 1, 0, 0.9529412, 1,
0.9920001, 0.7825482, 1.49803, 1, 0, 0.9490196, 1,
0.9974237, 0.9859608, -0.06763583, 1, 0, 0.9411765, 1,
1.001228, 1.292613, 0.004667468, 1, 0, 0.9372549, 1,
1.003306, 0.6451128, 0.09769614, 1, 0, 0.9294118, 1,
1.008103, -0.6962266, 1.821611, 1, 0, 0.9254902, 1,
1.008639, 0.799776, 0.7436848, 1, 0, 0.9176471, 1,
1.012211, -1.272639, 3.071532, 1, 0, 0.9137255, 1,
1.012269, 1.348483, 1.983948, 1, 0, 0.9058824, 1,
1.018284, -0.5851927, 3.327906, 1, 0, 0.9019608, 1,
1.026574, 1.136949, 0.7992557, 1, 0, 0.8941177, 1,
1.028402, -1.463543, 2.772269, 1, 0, 0.8862745, 1,
1.031183, -1.478323, 0.7480727, 1, 0, 0.8823529, 1,
1.040223, 1.924598, -1.587433, 1, 0, 0.8745098, 1,
1.041174, 0.1295583, 1.565926, 1, 0, 0.8705882, 1,
1.046038, 2.081937, -0.001592996, 1, 0, 0.8627451, 1,
1.054886, 0.2131597, 2.821148, 1, 0, 0.8588235, 1,
1.060592, -0.3570691, 3.130338, 1, 0, 0.8509804, 1,
1.067955, -0.7826155, 1.426969, 1, 0, 0.8470588, 1,
1.074108, 0.6038731, 1.340946, 1, 0, 0.8392157, 1,
1.074751, -0.9669091, 2.345698, 1, 0, 0.8352941, 1,
1.077306, 2.657028, -2.329839, 1, 0, 0.827451, 1,
1.088461, 0.1338936, 1.282909, 1, 0, 0.8235294, 1,
1.093696, -1.388429, 3.190426, 1, 0, 0.8156863, 1,
1.100083, -0.9054855, 1.581581, 1, 0, 0.8117647, 1,
1.106456, 1.20198, 0.7791844, 1, 0, 0.8039216, 1,
1.114934, -0.4840864, 1.818835, 1, 0, 0.7960784, 1,
1.117187, 1.325657, 0.3917837, 1, 0, 0.7921569, 1,
1.117239, 0.5360866, 2.438617, 1, 0, 0.7843137, 1,
1.120374, 0.2384465, 2.506169, 1, 0, 0.7803922, 1,
1.138113, 0.7343045, -1.073148, 1, 0, 0.772549, 1,
1.15168, 1.958771, 2.087373, 1, 0, 0.7686275, 1,
1.152908, -0.6598665, 2.413502, 1, 0, 0.7607843, 1,
1.155132, 1.007866, 0.4684919, 1, 0, 0.7568628, 1,
1.159362, -1.446519, 2.740872, 1, 0, 0.7490196, 1,
1.165545, 0.436053, 0.329895, 1, 0, 0.7450981, 1,
1.165771, 0.1552194, 1.407057, 1, 0, 0.7372549, 1,
1.167646, -0.7624055, 3.210656, 1, 0, 0.7333333, 1,
1.17334, 0.2549997, 1.658643, 1, 0, 0.7254902, 1,
1.176274, -2.414421, 2.606675, 1, 0, 0.7215686, 1,
1.178853, -0.5125968, 2.877286, 1, 0, 0.7137255, 1,
1.182062, 1.48061, 2.727449, 1, 0, 0.7098039, 1,
1.183354, -0.666137, 1.80559, 1, 0, 0.7019608, 1,
1.184121, -0.2201133, 1.82969, 1, 0, 0.6941177, 1,
1.188898, 1.419851, 0.7644958, 1, 0, 0.6901961, 1,
1.194977, 0.8083599, 1.039494, 1, 0, 0.682353, 1,
1.195186, 0.00605441, 1.642442, 1, 0, 0.6784314, 1,
1.200762, -0.05244076, 2.442931, 1, 0, 0.6705883, 1,
1.202743, 1.008826, -0.01318505, 1, 0, 0.6666667, 1,
1.208688, 0.05109204, 1.858049, 1, 0, 0.6588235, 1,
1.217057, 0.0402706, 0.9776626, 1, 0, 0.654902, 1,
1.224825, 0.1904987, 1.266424, 1, 0, 0.6470588, 1,
1.225909, 1.405568, 1.756583, 1, 0, 0.6431373, 1,
1.22763, -0.1140035, 1.113929, 1, 0, 0.6352941, 1,
1.230125, -0.3265313, 2.129104, 1, 0, 0.6313726, 1,
1.232517, 0.3314869, 1.184167, 1, 0, 0.6235294, 1,
1.233858, -1.697488, 2.596632, 1, 0, 0.6196079, 1,
1.236015, -1.010816, 1.313401, 1, 0, 0.6117647, 1,
1.236684, -0.6834366, 2.077346, 1, 0, 0.6078432, 1,
1.239322, 0.04686699, 1.628541, 1, 0, 0.6, 1,
1.243547, 1.651488, 2.02639, 1, 0, 0.5921569, 1,
1.243876, -0.4157876, 2.426575, 1, 0, 0.5882353, 1,
1.254626, 0.7896821, -0.3803256, 1, 0, 0.5803922, 1,
1.258528, 0.2591821, 2.478615, 1, 0, 0.5764706, 1,
1.259168, 0.3510735, 1.376467, 1, 0, 0.5686275, 1,
1.265201, 0.2831209, 1.859034, 1, 0, 0.5647059, 1,
1.275372, 0.1776976, -0.2927, 1, 0, 0.5568628, 1,
1.28342, 1.323631, -0.0496413, 1, 0, 0.5529412, 1,
1.284987, -0.8594161, 0.645771, 1, 0, 0.5450981, 1,
1.292352, -0.5883552, 3.333978, 1, 0, 0.5411765, 1,
1.295186, 1.796842, 1.194396, 1, 0, 0.5333334, 1,
1.305036, -2.030238, 4.067129, 1, 0, 0.5294118, 1,
1.313153, 1.921758, 1.241062, 1, 0, 0.5215687, 1,
1.352827, -0.6068125, 1.978122, 1, 0, 0.5176471, 1,
1.353047, -0.0150413, 1.963921, 1, 0, 0.509804, 1,
1.353445, -0.1708531, 0.7280858, 1, 0, 0.5058824, 1,
1.353804, 2.245757, -0.6307011, 1, 0, 0.4980392, 1,
1.359198, -1.186504, 2.419866, 1, 0, 0.4901961, 1,
1.368364, 1.168243, -0.08513144, 1, 0, 0.4862745, 1,
1.369462, 2.211153, 1.066905, 1, 0, 0.4784314, 1,
1.374994, 1.225596, 0.7946156, 1, 0, 0.4745098, 1,
1.376763, -0.5373603, 2.328541, 1, 0, 0.4666667, 1,
1.390622, 0.3051361, 3.198718, 1, 0, 0.4627451, 1,
1.395433, -1.324406, 0.9344302, 1, 0, 0.454902, 1,
1.397065, 0.9178919, 1.000276, 1, 0, 0.4509804, 1,
1.415424, -0.6189108, 1.827929, 1, 0, 0.4431373, 1,
1.42237, -1.75419, 1.831526, 1, 0, 0.4392157, 1,
1.42596, -0.06379513, 0.6278771, 1, 0, 0.4313726, 1,
1.430752, -0.1280252, 3.213898, 1, 0, 0.427451, 1,
1.432145, -0.07574148, 0.1598584, 1, 0, 0.4196078, 1,
1.452941, -2.122563, 0.6179423, 1, 0, 0.4156863, 1,
1.463058, 1.015272, 0.4528785, 1, 0, 0.4078431, 1,
1.46564, 0.7402235, 2.732098, 1, 0, 0.4039216, 1,
1.476553, 1.197009, 2.152346, 1, 0, 0.3960784, 1,
1.48386, 2.307304, 0.5872177, 1, 0, 0.3882353, 1,
1.48972, -0.3647423, 1.65538, 1, 0, 0.3843137, 1,
1.491716, 0.1392816, 1.02844, 1, 0, 0.3764706, 1,
1.505891, 1.373907, 1.2697, 1, 0, 0.372549, 1,
1.506334, -1.379959, 0.2550831, 1, 0, 0.3647059, 1,
1.507168, 0.2725718, 1.099142, 1, 0, 0.3607843, 1,
1.507189, -0.5721347, 1.660892, 1, 0, 0.3529412, 1,
1.535353, -1.870717, 2.819008, 1, 0, 0.3490196, 1,
1.565387, 0.3910808, 0.3579989, 1, 0, 0.3411765, 1,
1.588972, -0.9164747, 2.675466, 1, 0, 0.3372549, 1,
1.589278, 0.164489, 1.751513, 1, 0, 0.3294118, 1,
1.589978, -0.7229571, 0.5952712, 1, 0, 0.3254902, 1,
1.597653, -1.462991, 2.237162, 1, 0, 0.3176471, 1,
1.618003, 0.2594442, 1.192586, 1, 0, 0.3137255, 1,
1.629639, -1.047228, 2.596895, 1, 0, 0.3058824, 1,
1.644461, -0.6195136, 3.194623, 1, 0, 0.2980392, 1,
1.664517, -0.1527452, 2.288779, 1, 0, 0.2941177, 1,
1.670522, 0.04267215, 1.229958, 1, 0, 0.2862745, 1,
1.680763, -1.116636, 3.538239, 1, 0, 0.282353, 1,
1.695972, -0.2669163, 1.413829, 1, 0, 0.2745098, 1,
1.707011, -0.3555796, 1.488866, 1, 0, 0.2705882, 1,
1.709577, -1.76576, 2.505331, 1, 0, 0.2627451, 1,
1.710936, 0.4624875, 4.245004, 1, 0, 0.2588235, 1,
1.715735, -1.143438, -0.04043585, 1, 0, 0.2509804, 1,
1.722551, -0.07819314, 3.901508, 1, 0, 0.2470588, 1,
1.734787, 0.02553876, 1.036596, 1, 0, 0.2392157, 1,
1.749269, -1.114759, 1.66264, 1, 0, 0.2352941, 1,
1.755066, 0.5118421, 0.3825586, 1, 0, 0.227451, 1,
1.783813, -0.6208451, 1.527858, 1, 0, 0.2235294, 1,
1.783992, 0.6772981, 1.118065, 1, 0, 0.2156863, 1,
1.795009, 2.105624, -1.443268, 1, 0, 0.2117647, 1,
1.798415, 0.5615016, 2.699062, 1, 0, 0.2039216, 1,
1.801337, 0.7804814, 0.8592244, 1, 0, 0.1960784, 1,
1.803333, 0.4770562, 2.065624, 1, 0, 0.1921569, 1,
1.81676, -0.3842353, 1.858804, 1, 0, 0.1843137, 1,
1.825354, -1.699257, 2.202304, 1, 0, 0.1803922, 1,
1.826175, 1.358719, 1.408435, 1, 0, 0.172549, 1,
1.827338, 2.181525, 1.226558, 1, 0, 0.1686275, 1,
1.870704, -0.4720519, 2.740727, 1, 0, 0.1607843, 1,
1.932864, -0.0908428, 0.7112518, 1, 0, 0.1568628, 1,
1.966259, -1.036762, 2.956923, 1, 0, 0.1490196, 1,
1.976561, 0.0352272, 0.02421812, 1, 0, 0.145098, 1,
1.988156, 0.3288892, 0.5748067, 1, 0, 0.1372549, 1,
2.002743, 0.4494791, 1.702281, 1, 0, 0.1333333, 1,
2.029222, -0.6986408, 3.352205, 1, 0, 0.1254902, 1,
2.046099, -0.9333751, 1.839426, 1, 0, 0.1215686, 1,
2.073535, 0.1584731, 1.399003, 1, 0, 0.1137255, 1,
2.107827, -0.6346939, 1.733246, 1, 0, 0.1098039, 1,
2.127823, 0.9146774, 1.53427, 1, 0, 0.1019608, 1,
2.141708, 0.6783217, 3.008554, 1, 0, 0.09411765, 1,
2.152268, 1.237213, 1.430656, 1, 0, 0.09019608, 1,
2.155136, -0.3383527, 2.633806, 1, 0, 0.08235294, 1,
2.17034, -0.6860248, 1.846036, 1, 0, 0.07843138, 1,
2.222647, -0.7744481, 1.179908, 1, 0, 0.07058824, 1,
2.253062, -1.129375, 2.559541, 1, 0, 0.06666667, 1,
2.290946, -0.9001564, 1.975538, 1, 0, 0.05882353, 1,
2.383795, 0.1717073, 1.760494, 1, 0, 0.05490196, 1,
2.409059, 0.3285764, -0.3539637, 1, 0, 0.04705882, 1,
2.468394, 1.641154, -0.4379089, 1, 0, 0.04313726, 1,
2.522184, -0.4774387, 1.03333, 1, 0, 0.03529412, 1,
2.535963, -0.6539862, 2.057565, 1, 0, 0.03137255, 1,
2.545968, -0.4273986, 1.557253, 1, 0, 0.02352941, 1,
2.564279, -2.209947, 2.346891, 1, 0, 0.01960784, 1,
2.753405, -0.3769785, 1.963367, 1, 0, 0.01176471, 1,
3.182393, -0.7422258, 1.93589, 1, 0, 0.007843138, 1
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
-0.2795357, -4.00007, -6.611999, 0, -0.5, 0.5, 0.5,
-0.2795357, -4.00007, -6.611999, 1, -0.5, 0.5, 0.5,
-0.2795357, -4.00007, -6.611999, 1, 1.5, 0.5, 0.5,
-0.2795357, -4.00007, -6.611999, 0, 1.5, 0.5, 0.5
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
-4.915058, 0.05972719, -6.611999, 0, -0.5, 0.5, 0.5,
-4.915058, 0.05972719, -6.611999, 1, -0.5, 0.5, 0.5,
-4.915058, 0.05972719, -6.611999, 1, 1.5, 0.5, 0.5,
-4.915058, 0.05972719, -6.611999, 0, 1.5, 0.5, 0.5
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
-4.915058, -4.00007, 0.2857611, 0, -0.5, 0.5, 0.5,
-4.915058, -4.00007, 0.2857611, 1, -0.5, 0.5, 0.5,
-4.915058, -4.00007, 0.2857611, 1, 1.5, 0.5, 0.5,
-4.915058, -4.00007, 0.2857611, 0, 1.5, 0.5, 0.5
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
-3, -3.063194, -5.020208,
3, -3.063194, -5.020208,
-3, -3.063194, -5.020208,
-3, -3.21934, -5.285506,
-2, -3.063194, -5.020208,
-2, -3.21934, -5.285506,
-1, -3.063194, -5.020208,
-1, -3.21934, -5.285506,
0, -3.063194, -5.020208,
0, -3.21934, -5.285506,
1, -3.063194, -5.020208,
1, -3.21934, -5.285506,
2, -3.063194, -5.020208,
2, -3.21934, -5.285506,
3, -3.063194, -5.020208,
3, -3.21934, -5.285506
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
-3, -3.531632, -5.816103, 0, -0.5, 0.5, 0.5,
-3, -3.531632, -5.816103, 1, -0.5, 0.5, 0.5,
-3, -3.531632, -5.816103, 1, 1.5, 0.5, 0.5,
-3, -3.531632, -5.816103, 0, 1.5, 0.5, 0.5,
-2, -3.531632, -5.816103, 0, -0.5, 0.5, 0.5,
-2, -3.531632, -5.816103, 1, -0.5, 0.5, 0.5,
-2, -3.531632, -5.816103, 1, 1.5, 0.5, 0.5,
-2, -3.531632, -5.816103, 0, 1.5, 0.5, 0.5,
-1, -3.531632, -5.816103, 0, -0.5, 0.5, 0.5,
-1, -3.531632, -5.816103, 1, -0.5, 0.5, 0.5,
-1, -3.531632, -5.816103, 1, 1.5, 0.5, 0.5,
-1, -3.531632, -5.816103, 0, 1.5, 0.5, 0.5,
0, -3.531632, -5.816103, 0, -0.5, 0.5, 0.5,
0, -3.531632, -5.816103, 1, -0.5, 0.5, 0.5,
0, -3.531632, -5.816103, 1, 1.5, 0.5, 0.5,
0, -3.531632, -5.816103, 0, 1.5, 0.5, 0.5,
1, -3.531632, -5.816103, 0, -0.5, 0.5, 0.5,
1, -3.531632, -5.816103, 1, -0.5, 0.5, 0.5,
1, -3.531632, -5.816103, 1, 1.5, 0.5, 0.5,
1, -3.531632, -5.816103, 0, 1.5, 0.5, 0.5,
2, -3.531632, -5.816103, 0, -0.5, 0.5, 0.5,
2, -3.531632, -5.816103, 1, -0.5, 0.5, 0.5,
2, -3.531632, -5.816103, 1, 1.5, 0.5, 0.5,
2, -3.531632, -5.816103, 0, 1.5, 0.5, 0.5,
3, -3.531632, -5.816103, 0, -0.5, 0.5, 0.5,
3, -3.531632, -5.816103, 1, -0.5, 0.5, 0.5,
3, -3.531632, -5.816103, 1, 1.5, 0.5, 0.5,
3, -3.531632, -5.816103, 0, 1.5, 0.5, 0.5
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
-3.845322, -2, -5.020208,
-3.845322, 3, -5.020208,
-3.845322, -2, -5.020208,
-4.023612, -2, -5.285506,
-3.845322, -1, -5.020208,
-4.023612, -1, -5.285506,
-3.845322, 0, -5.020208,
-4.023612, 0, -5.285506,
-3.845322, 1, -5.020208,
-4.023612, 1, -5.285506,
-3.845322, 2, -5.020208,
-4.023612, 2, -5.285506,
-3.845322, 3, -5.020208,
-4.023612, 3, -5.285506
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
-4.38019, -2, -5.816103, 0, -0.5, 0.5, 0.5,
-4.38019, -2, -5.816103, 1, -0.5, 0.5, 0.5,
-4.38019, -2, -5.816103, 1, 1.5, 0.5, 0.5,
-4.38019, -2, -5.816103, 0, 1.5, 0.5, 0.5,
-4.38019, -1, -5.816103, 0, -0.5, 0.5, 0.5,
-4.38019, -1, -5.816103, 1, -0.5, 0.5, 0.5,
-4.38019, -1, -5.816103, 1, 1.5, 0.5, 0.5,
-4.38019, -1, -5.816103, 0, 1.5, 0.5, 0.5,
-4.38019, 0, -5.816103, 0, -0.5, 0.5, 0.5,
-4.38019, 0, -5.816103, 1, -0.5, 0.5, 0.5,
-4.38019, 0, -5.816103, 1, 1.5, 0.5, 0.5,
-4.38019, 0, -5.816103, 0, 1.5, 0.5, 0.5,
-4.38019, 1, -5.816103, 0, -0.5, 0.5, 0.5,
-4.38019, 1, -5.816103, 1, -0.5, 0.5, 0.5,
-4.38019, 1, -5.816103, 1, 1.5, 0.5, 0.5,
-4.38019, 1, -5.816103, 0, 1.5, 0.5, 0.5,
-4.38019, 2, -5.816103, 0, -0.5, 0.5, 0.5,
-4.38019, 2, -5.816103, 1, -0.5, 0.5, 0.5,
-4.38019, 2, -5.816103, 1, 1.5, 0.5, 0.5,
-4.38019, 2, -5.816103, 0, 1.5, 0.5, 0.5,
-4.38019, 3, -5.816103, 0, -0.5, 0.5, 0.5,
-4.38019, 3, -5.816103, 1, -0.5, 0.5, 0.5,
-4.38019, 3, -5.816103, 1, 1.5, 0.5, 0.5,
-4.38019, 3, -5.816103, 0, 1.5, 0.5, 0.5
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
-3.845322, -3.063194, -4,
-3.845322, -3.063194, 4,
-3.845322, -3.063194, -4,
-4.023612, -3.21934, -4,
-3.845322, -3.063194, -2,
-4.023612, -3.21934, -2,
-3.845322, -3.063194, 0,
-4.023612, -3.21934, 0,
-3.845322, -3.063194, 2,
-4.023612, -3.21934, 2,
-3.845322, -3.063194, 4,
-4.023612, -3.21934, 4
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
-4.38019, -3.531632, -4, 0, -0.5, 0.5, 0.5,
-4.38019, -3.531632, -4, 1, -0.5, 0.5, 0.5,
-4.38019, -3.531632, -4, 1, 1.5, 0.5, 0.5,
-4.38019, -3.531632, -4, 0, 1.5, 0.5, 0.5,
-4.38019, -3.531632, -2, 0, -0.5, 0.5, 0.5,
-4.38019, -3.531632, -2, 1, -0.5, 0.5, 0.5,
-4.38019, -3.531632, -2, 1, 1.5, 0.5, 0.5,
-4.38019, -3.531632, -2, 0, 1.5, 0.5, 0.5,
-4.38019, -3.531632, 0, 0, -0.5, 0.5, 0.5,
-4.38019, -3.531632, 0, 1, -0.5, 0.5, 0.5,
-4.38019, -3.531632, 0, 1, 1.5, 0.5, 0.5,
-4.38019, -3.531632, 0, 0, 1.5, 0.5, 0.5,
-4.38019, -3.531632, 2, 0, -0.5, 0.5, 0.5,
-4.38019, -3.531632, 2, 1, -0.5, 0.5, 0.5,
-4.38019, -3.531632, 2, 1, 1.5, 0.5, 0.5,
-4.38019, -3.531632, 2, 0, 1.5, 0.5, 0.5,
-4.38019, -3.531632, 4, 0, -0.5, 0.5, 0.5,
-4.38019, -3.531632, 4, 1, -0.5, 0.5, 0.5,
-4.38019, -3.531632, 4, 1, 1.5, 0.5, 0.5,
-4.38019, -3.531632, 4, 0, 1.5, 0.5, 0.5
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
-3.845322, -3.063194, -5.020208,
-3.845322, 3.182648, -5.020208,
-3.845322, -3.063194, 5.59173,
-3.845322, 3.182648, 5.59173,
-3.845322, -3.063194, -5.020208,
-3.845322, -3.063194, 5.59173,
-3.845322, 3.182648, -5.020208,
-3.845322, 3.182648, 5.59173,
-3.845322, -3.063194, -5.020208,
3.286251, -3.063194, -5.020208,
-3.845322, -3.063194, 5.59173,
3.286251, -3.063194, 5.59173,
-3.845322, 3.182648, -5.020208,
3.286251, 3.182648, -5.020208,
-3.845322, 3.182648, 5.59173,
3.286251, 3.182648, 5.59173,
3.286251, -3.063194, -5.020208,
3.286251, 3.182648, -5.020208,
3.286251, -3.063194, 5.59173,
3.286251, 3.182648, 5.59173,
3.286251, -3.063194, -5.020208,
3.286251, -3.063194, 5.59173,
3.286251, 3.182648, -5.020208,
3.286251, 3.182648, 5.59173
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
var radius = 7.59836;
var distance = 33.80596;
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
mvMatrix.translate( 0.2795357, -0.05972719, -0.2857611 );
mvMatrix.scale( 1.151989, 1.315354, 0.7741749 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.80596);
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
carfentrazone-ethyl<-read.table("carfentrazone-ethyl.xyz")
```

```
## Error in read.table("carfentrazone-ethyl.xyz"): no lines available in input
```

```r
x<-carfentrazone-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'carfentrazone' not found
```

```r
y<-carfentrazone-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'carfentrazone' not found
```

```r
z<-carfentrazone-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'carfentrazone' not found
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
-3.741464, -0.8995904, -1.747306, 0, 0, 1, 1, 1,
-2.978672, 0.5419745, -0.4803592, 1, 0, 0, 1, 1,
-2.942522, -1.248096, -2.554964, 1, 0, 0, 1, 1,
-2.82032, 0.3321157, -1.227666, 1, 0, 0, 1, 1,
-2.682309, -0.2920403, -1.266034, 1, 0, 0, 1, 1,
-2.651562, -2.010999, -0.7722957, 1, 0, 0, 1, 1,
-2.647286, -1.091984, -0.6819946, 0, 0, 0, 1, 1,
-2.490879, 1.957645, -0.4743731, 0, 0, 0, 1, 1,
-2.444584, -0.1134719, -0.9787534, 0, 0, 0, 1, 1,
-2.43571, -0.8599226, -2.83364, 0, 0, 0, 1, 1,
-2.370364, -0.5558289, -0.5661749, 0, 0, 0, 1, 1,
-2.35906, 0.6919872, -0.8751283, 0, 0, 0, 1, 1,
-2.351027, -0.845237, -2.945002, 0, 0, 0, 1, 1,
-2.330555, -0.928559, -2.9681, 1, 1, 1, 1, 1,
-2.302383, 0.07169622, -1.068263, 1, 1, 1, 1, 1,
-2.295324, -2.37877, -1.310878, 1, 1, 1, 1, 1,
-2.244818, -1.343539, -1.509898, 1, 1, 1, 1, 1,
-2.233396, 0.10485, -2.130635, 1, 1, 1, 1, 1,
-2.199215, 0.5143287, 0.2008614, 1, 1, 1, 1, 1,
-2.191935, 0.6181696, -0.2576131, 1, 1, 1, 1, 1,
-2.1468, 0.3391768, -2.088452, 1, 1, 1, 1, 1,
-2.112296, -1.055203, -2.061971, 1, 1, 1, 1, 1,
-2.107183, -0.8727201, -2.939495, 1, 1, 1, 1, 1,
-2.035084, -2.74707, -3.333601, 1, 1, 1, 1, 1,
-2.02525, 1.134082, -0.7854137, 1, 1, 1, 1, 1,
-2.019477, -1.155321, -2.855014, 1, 1, 1, 1, 1,
-1.993808, -0.4149987, -2.297751, 1, 1, 1, 1, 1,
-1.988511, -0.2122075, -1.963952, 1, 1, 1, 1, 1,
-1.984538, 0.8821051, -1.190253, 0, 0, 1, 1, 1,
-1.966364, -0.5837907, -2.250323, 1, 0, 0, 1, 1,
-1.960727, 0.2178804, -2.168616, 1, 0, 0, 1, 1,
-1.930085, 0.6941674, -0.3064624, 1, 0, 0, 1, 1,
-1.921171, 0.7279465, -2.287153, 1, 0, 0, 1, 1,
-1.914891, 0.09082931, -2.467694, 1, 0, 0, 1, 1,
-1.872023, -0.9943334, -1.743013, 0, 0, 0, 1, 1,
-1.850786, 0.08905035, -1.38146, 0, 0, 0, 1, 1,
-1.832519, -1.066557, -3.209331, 0, 0, 0, 1, 1,
-1.832404, 0.325262, 0.3825282, 0, 0, 0, 1, 1,
-1.826262, 1.246098, -1.454252, 0, 0, 0, 1, 1,
-1.824113, 0.4808371, -1.387004, 0, 0, 0, 1, 1,
-1.816232, 1.331499, -0.512154, 0, 0, 0, 1, 1,
-1.786104, 0.9017999, -0.9303924, 1, 1, 1, 1, 1,
-1.752238, 0.5392552, -0.3392629, 1, 1, 1, 1, 1,
-1.74701, -0.1034847, -0.9732454, 1, 1, 1, 1, 1,
-1.74226, -0.1641436, -0.8496875, 1, 1, 1, 1, 1,
-1.736565, -0.08974341, -0.5179667, 1, 1, 1, 1, 1,
-1.725924, -0.165311, -2.525518, 1, 1, 1, 1, 1,
-1.724093, -0.09085603, 0.02241408, 1, 1, 1, 1, 1,
-1.70472, -0.1831017, -2.106294, 1, 1, 1, 1, 1,
-1.682715, -1.122345, -2.251114, 1, 1, 1, 1, 1,
-1.674224, -0.319504, -1.97709, 1, 1, 1, 1, 1,
-1.652416, -0.7894536, -3.002817, 1, 1, 1, 1, 1,
-1.651394, -1.383545, -2.169368, 1, 1, 1, 1, 1,
-1.649438, -0.1741068, -1.012634, 1, 1, 1, 1, 1,
-1.64201, 1.367134, -0.5236053, 1, 1, 1, 1, 1,
-1.639885, 0.6956789, -1.552154, 1, 1, 1, 1, 1,
-1.62748, 0.4819316, -1.972881, 0, 0, 1, 1, 1,
-1.611633, 0.06035351, -2.140978, 1, 0, 0, 1, 1,
-1.608805, -0.8092016, 0.2364406, 1, 0, 0, 1, 1,
-1.606218, 0.7390147, -0.2195815, 1, 0, 0, 1, 1,
-1.598019, -0.5648076, -0.5191391, 1, 0, 0, 1, 1,
-1.592547, 1.466801, -1.370501, 1, 0, 0, 1, 1,
-1.578036, -0.3586709, -2.74383, 0, 0, 0, 1, 1,
-1.576463, 1.491557, 0.5657411, 0, 0, 0, 1, 1,
-1.572132, 0.7374115, -1.150051, 0, 0, 0, 1, 1,
-1.571175, 0.6593862, -2.848198, 0, 0, 0, 1, 1,
-1.533912, 0.3730446, 0.3905253, 0, 0, 0, 1, 1,
-1.52896, 1.034742, -1.756506, 0, 0, 0, 1, 1,
-1.525148, -0.5941344, -1.369432, 0, 0, 0, 1, 1,
-1.51447, -0.2955354, -1.510857, 1, 1, 1, 1, 1,
-1.506097, -1.386774, -1.895013, 1, 1, 1, 1, 1,
-1.485337, 1.319558, -1.655697, 1, 1, 1, 1, 1,
-1.482954, 0.1719949, -0.7685748, 1, 1, 1, 1, 1,
-1.445359, 0.7458211, -1.806519, 1, 1, 1, 1, 1,
-1.444478, -0.5846918, -4.045269, 1, 1, 1, 1, 1,
-1.44301, -0.02468911, -1.624737, 1, 1, 1, 1, 1,
-1.439206, -0.7619797, -2.01808, 1, 1, 1, 1, 1,
-1.439119, -0.2153099, -0.5339553, 1, 1, 1, 1, 1,
-1.434322, -2.074882, -3.92211, 1, 1, 1, 1, 1,
-1.43166, 0.05854765, -1.876509, 1, 1, 1, 1, 1,
-1.428306, 0.6100261, -1.286215, 1, 1, 1, 1, 1,
-1.425886, -0.1360211, -2.265122, 1, 1, 1, 1, 1,
-1.421214, 0.1146026, 0.2642278, 1, 1, 1, 1, 1,
-1.417139, -1.19938, -3.269747, 1, 1, 1, 1, 1,
-1.415139, 0.5384196, -1.010633, 0, 0, 1, 1, 1,
-1.412329, 2.017324, -2.061876, 1, 0, 0, 1, 1,
-1.408858, 0.1626095, -1.519106, 1, 0, 0, 1, 1,
-1.39697, -0.06146443, -1.235362, 1, 0, 0, 1, 1,
-1.394092, 1.37002, -1.802244, 1, 0, 0, 1, 1,
-1.385079, -0.7608199, -1.78253, 1, 0, 0, 1, 1,
-1.370003, -0.5525044, -1.015533, 0, 0, 0, 1, 1,
-1.368938, 0.4726807, -1.51923, 0, 0, 0, 1, 1,
-1.361891, -0.8568057, -2.530627, 0, 0, 0, 1, 1,
-1.358237, 0.2109097, -0.2288325, 0, 0, 0, 1, 1,
-1.357612, 1.817692, -1.015913, 0, 0, 0, 1, 1,
-1.347488, -0.2293989, -3.787082, 0, 0, 0, 1, 1,
-1.346599, -0.1012984, -2.784688, 0, 0, 0, 1, 1,
-1.31493, 0.2343441, -1.314063, 1, 1, 1, 1, 1,
-1.312699, -0.4917327, -3.505157, 1, 1, 1, 1, 1,
-1.306113, -1.218527, -2.162865, 1, 1, 1, 1, 1,
-1.304257, 2.099997, -0.5807413, 1, 1, 1, 1, 1,
-1.295303, 0.1022341, -1.225801, 1, 1, 1, 1, 1,
-1.294516, 1.426704, -0.942001, 1, 1, 1, 1, 1,
-1.2922, 0.7468958, -0.3260209, 1, 1, 1, 1, 1,
-1.287265, 0.6004831, -1.744047, 1, 1, 1, 1, 1,
-1.286359, -0.8108597, -0.4555922, 1, 1, 1, 1, 1,
-1.279847, -0.7903174, -2.51388, 1, 1, 1, 1, 1,
-1.276651, 0.5992699, -0.8768811, 1, 1, 1, 1, 1,
-1.255385, -0.09196535, -2.207591, 1, 1, 1, 1, 1,
-1.254041, -0.4422151, -2.907073, 1, 1, 1, 1, 1,
-1.254029, -2.336593, -4.132347, 1, 1, 1, 1, 1,
-1.249102, 0.2356577, -0.6911279, 1, 1, 1, 1, 1,
-1.240057, -0.7652102, -1.979755, 0, 0, 1, 1, 1,
-1.237245, -1.403428, -2.161746, 1, 0, 0, 1, 1,
-1.222681, -1.141086, 1.959542, 1, 0, 0, 1, 1,
-1.219163, -0.8986222, -1.927141, 1, 0, 0, 1, 1,
-1.216104, -0.1193066, -1.629358, 1, 0, 0, 1, 1,
-1.208912, -0.8552581, -1.680454, 1, 0, 0, 1, 1,
-1.20307, -0.4802827, -1.987163, 0, 0, 0, 1, 1,
-1.195079, -0.1881832, -2.299859, 0, 0, 0, 1, 1,
-1.188947, 1.91373, -2.496145, 0, 0, 0, 1, 1,
-1.184115, 1.3761, 1.088565, 0, 0, 0, 1, 1,
-1.18342, 1.7135, -1.490207, 0, 0, 0, 1, 1,
-1.180818, -0.1792235, -1.648546, 0, 0, 0, 1, 1,
-1.177734, -0.6713543, -0.5601241, 0, 0, 0, 1, 1,
-1.175977, 0.3058232, -0.7896197, 1, 1, 1, 1, 1,
-1.170078, -0.8490947, -1.595508, 1, 1, 1, 1, 1,
-1.166549, 1.096968, -2.526047, 1, 1, 1, 1, 1,
-1.159088, 0.384543, -0.3604043, 1, 1, 1, 1, 1,
-1.15649, 0.9201267, -0.8828806, 1, 1, 1, 1, 1,
-1.153297, -1.587787, -2.517033, 1, 1, 1, 1, 1,
-1.151743, 1.221442, -1.959487, 1, 1, 1, 1, 1,
-1.149353, 0.7873443, -1.986575, 1, 1, 1, 1, 1,
-1.148769, -1.574251, -3.258862, 1, 1, 1, 1, 1,
-1.14599, 0.07090671, 0.02496316, 1, 1, 1, 1, 1,
-1.139366, 0.7507027, 0.1204833, 1, 1, 1, 1, 1,
-1.133997, 0.6228172, 0.2001365, 1, 1, 1, 1, 1,
-1.131392, -0.3626561, -2.925103, 1, 1, 1, 1, 1,
-1.128527, -1.649459, -2.856908, 1, 1, 1, 1, 1,
-1.111061, -0.7249042, -1.87567, 1, 1, 1, 1, 1,
-1.110678, -0.3425018, -1.393342, 0, 0, 1, 1, 1,
-1.103918, -1.406345, -2.072997, 1, 0, 0, 1, 1,
-1.096774, 0.1281407, -2.825366, 1, 0, 0, 1, 1,
-1.090565, 1.200059, -1.298663, 1, 0, 0, 1, 1,
-1.087703, 1.569914, -1.074445, 1, 0, 0, 1, 1,
-1.083094, 1.869773, -1.191825, 1, 0, 0, 1, 1,
-1.081113, 0.9092432, -0.5446454, 0, 0, 0, 1, 1,
-1.074674, 1.063811, -1.908137, 0, 0, 0, 1, 1,
-1.070041, -2.021207, -2.058075, 0, 0, 0, 1, 1,
-1.06718, -1.349323, -1.146381, 0, 0, 0, 1, 1,
-1.06587, -0.6702115, -1.721244, 0, 0, 0, 1, 1,
-1.064286, -0.5172949, -3.779516, 0, 0, 0, 1, 1,
-1.060471, -2.205525, -2.697994, 0, 0, 0, 1, 1,
-1.054087, -0.7326774, -4.206329, 1, 1, 1, 1, 1,
-1.049682, -0.142984, -2.482892, 1, 1, 1, 1, 1,
-1.042953, -0.5474105, -3.213316, 1, 1, 1, 1, 1,
-1.039742, -0.8997947, -2.022383, 1, 1, 1, 1, 1,
-1.039099, -0.8459532, -3.073188, 1, 1, 1, 1, 1,
-1.037706, 1.349265, 1.307216, 1, 1, 1, 1, 1,
-1.02719, 1.282674, -0.5820886, 1, 1, 1, 1, 1,
-1.020283, -0.04160435, -1.375474, 1, 1, 1, 1, 1,
-1.011802, 0.7198103, -0.8943751, 1, 1, 1, 1, 1,
-1.010381, -0.9829056, -2.543179, 1, 1, 1, 1, 1,
-0.9928977, 0.3574215, 1.067803, 1, 1, 1, 1, 1,
-0.9897411, -0.9007822, -3.401911, 1, 1, 1, 1, 1,
-0.9830493, 0.4400149, -1.798317, 1, 1, 1, 1, 1,
-0.9818252, 0.4560519, -1.561223, 1, 1, 1, 1, 1,
-0.9810095, -0.5561123, -1.253618, 1, 1, 1, 1, 1,
-0.9787815, -0.8267767, -2.132408, 0, 0, 1, 1, 1,
-0.9747085, 0.2277213, -0.8275771, 1, 0, 0, 1, 1,
-0.9737266, -1.262242, -2.883523, 1, 0, 0, 1, 1,
-0.9636923, 2.716855, 1.131239, 1, 0, 0, 1, 1,
-0.9620526, 0.6837786, -0.2513278, 1, 0, 0, 1, 1,
-0.9578431, -1.370183, -2.122746, 1, 0, 0, 1, 1,
-0.9559216, -0.8186777, -1.401511, 0, 0, 0, 1, 1,
-0.9384667, -2.364525, -3.616638, 0, 0, 0, 1, 1,
-0.937431, 0.2878296, -1.333678, 0, 0, 0, 1, 1,
-0.9369549, 0.06465373, -3.283119, 0, 0, 0, 1, 1,
-0.9295827, 0.07455481, -2.645805, 0, 0, 0, 1, 1,
-0.9129679, -0.5267894, -1.034273, 0, 0, 0, 1, 1,
-0.9088055, 1.166303, 0.2838749, 0, 0, 0, 1, 1,
-0.906808, 0.9297353, -0.2878111, 1, 1, 1, 1, 1,
-0.9057994, -0.539643, -0.4006551, 1, 1, 1, 1, 1,
-0.9049761, -2.208098, -1.586428, 1, 1, 1, 1, 1,
-0.9037413, 0.2664646, -1.333071, 1, 1, 1, 1, 1,
-0.9031587, -0.4077412, -1.860404, 1, 1, 1, 1, 1,
-0.8962872, -0.8932218, -1.94694, 1, 1, 1, 1, 1,
-0.8946934, 0.3338678, 0.0949753, 1, 1, 1, 1, 1,
-0.8930773, 0.2108937, -3.336944, 1, 1, 1, 1, 1,
-0.8914102, 0.9985409, -0.5771104, 1, 1, 1, 1, 1,
-0.8886071, -2.601368, -2.53309, 1, 1, 1, 1, 1,
-0.8848585, -0.5343497, -3.071051, 1, 1, 1, 1, 1,
-0.8780827, 0.02201118, -2.016459, 1, 1, 1, 1, 1,
-0.8766207, 0.7447748, -0.6669393, 1, 1, 1, 1, 1,
-0.8764929, 0.5367927, -2.064284, 1, 1, 1, 1, 1,
-0.8649798, 0.4328164, -1.942448, 1, 1, 1, 1, 1,
-0.8503144, -0.07189631, -3.215131, 0, 0, 1, 1, 1,
-0.8415461, -2.741835, -2.5871, 1, 0, 0, 1, 1,
-0.8397153, -1.507792, -2.30718, 1, 0, 0, 1, 1,
-0.8396226, -0.3849442, -0.8702205, 1, 0, 0, 1, 1,
-0.8388444, -1.835019, -2.61921, 1, 0, 0, 1, 1,
-0.8361547, 1.561612, 0.9255502, 1, 0, 0, 1, 1,
-0.8330259, -0.3962366, -2.938558, 0, 0, 0, 1, 1,
-0.8308609, -1.589486, -3.72702, 0, 0, 0, 1, 1,
-0.8253325, 0.9358786, 0.5194077, 0, 0, 0, 1, 1,
-0.8251202, 1.396364, -1.294264, 0, 0, 0, 1, 1,
-0.8194568, 0.1695721, -0.5970004, 0, 0, 0, 1, 1,
-0.818745, -2.547923, -2.812891, 0, 0, 0, 1, 1,
-0.8124779, 1.318802, -0.6315535, 0, 0, 0, 1, 1,
-0.8087265, 0.1406715, 0.2264962, 1, 1, 1, 1, 1,
-0.8072789, -1.376337, -2.627296, 1, 1, 1, 1, 1,
-0.7943602, 0.6413648, -1.237916, 1, 1, 1, 1, 1,
-0.7897893, -0.1046273, -2.124846, 1, 1, 1, 1, 1,
-0.7870118, 0.1423071, -0.7402706, 1, 1, 1, 1, 1,
-0.7834792, -0.7746166, -3.183525, 1, 1, 1, 1, 1,
-0.774035, -0.8651297, -3.460981, 1, 1, 1, 1, 1,
-0.7716038, 1.129207, -0.8259845, 1, 1, 1, 1, 1,
-0.7715266, 0.9393062, -0.00378494, 1, 1, 1, 1, 1,
-0.7712208, 0.6910176, -1.191356, 1, 1, 1, 1, 1,
-0.7630159, 0.37772, 0.177471, 1, 1, 1, 1, 1,
-0.7629104, -0.00840751, -1.192682, 1, 1, 1, 1, 1,
-0.7594194, 1.206365, 0.8234701, 1, 1, 1, 1, 1,
-0.7587932, 0.1217052, -1.315754, 1, 1, 1, 1, 1,
-0.7577834, 0.1915808, -1.689717, 1, 1, 1, 1, 1,
-0.7540179, -0.8772451, -2.070168, 0, 0, 1, 1, 1,
-0.7529937, 0.4652728, -0.6263896, 1, 0, 0, 1, 1,
-0.7451668, 0.3248018, -0.6136796, 1, 0, 0, 1, 1,
-0.7396933, -0.1390541, -2.825711, 1, 0, 0, 1, 1,
-0.7327831, 0.2014408, -0.5091929, 1, 0, 0, 1, 1,
-0.7309818, -0.1953185, -2.663226, 1, 0, 0, 1, 1,
-0.7299583, 1.30998, 0.5975445, 0, 0, 0, 1, 1,
-0.7290587, 1.991293, -0.4966261, 0, 0, 0, 1, 1,
-0.7254131, -0.2128221, -1.521127, 0, 0, 0, 1, 1,
-0.7243459, -0.1248171, -1.311311, 0, 0, 0, 1, 1,
-0.7239661, -0.9826974, -2.507135, 0, 0, 0, 1, 1,
-0.7227618, 0.1075293, -1.463724, 0, 0, 0, 1, 1,
-0.7173997, 0.6471324, -2.746798, 0, 0, 0, 1, 1,
-0.7173572, 1.256096, 0.7644792, 1, 1, 1, 1, 1,
-0.7156761, 0.9140988, -0.3669223, 1, 1, 1, 1, 1,
-0.7100361, 0.8953193, -0.2108348, 1, 1, 1, 1, 1,
-0.7093726, 0.6706201, -0.2452412, 1, 1, 1, 1, 1,
-0.7092418, 0.2886916, -0.9092902, 1, 1, 1, 1, 1,
-0.707545, -0.6510772, -1.823486, 1, 1, 1, 1, 1,
-0.7042629, -0.3180811, -3.322789, 1, 1, 1, 1, 1,
-0.7033322, -0.0774588, -1.94257, 1, 1, 1, 1, 1,
-0.6997283, -0.3974711, -3.442618, 1, 1, 1, 1, 1,
-0.6957793, -0.5059045, -1.144188, 1, 1, 1, 1, 1,
-0.6955004, -2.75302, -3.772947, 1, 1, 1, 1, 1,
-0.6937096, -0.0882727, -1.729462, 1, 1, 1, 1, 1,
-0.6912179, 0.003022268, -0.3899373, 1, 1, 1, 1, 1,
-0.6899027, 0.756817, -0.3375069, 1, 1, 1, 1, 1,
-0.6883705, 0.5394431, -2.062186, 1, 1, 1, 1, 1,
-0.6878078, 2.432289, 1.479145, 0, 0, 1, 1, 1,
-0.6867439, 0.3169766, -0.08807623, 1, 0, 0, 1, 1,
-0.6787708, 0.5138761, -1.838562, 1, 0, 0, 1, 1,
-0.6755807, -0.3213331, -1.749416, 1, 0, 0, 1, 1,
-0.6740314, -0.1735805, -3.141948, 1, 0, 0, 1, 1,
-0.6714253, 0.8297374, -0.279536, 1, 0, 0, 1, 1,
-0.6710293, 0.4302062, -2.126967, 0, 0, 0, 1, 1,
-0.67001, -0.7266084, -3.686248, 0, 0, 0, 1, 1,
-0.6662825, -2.160496, -4.347529, 0, 0, 0, 1, 1,
-0.6404697, 0.5342456, -1.373183, 0, 0, 0, 1, 1,
-0.6389445, 0.1956477, -1.306954, 0, 0, 0, 1, 1,
-0.6374686, -1.491059, -3.566375, 0, 0, 0, 1, 1,
-0.6324602, 1.472461, -0.419631, 0, 0, 0, 1, 1,
-0.6311867, -0.4809816, -2.531653, 1, 1, 1, 1, 1,
-0.6309921, -0.4703815, -2.556994, 1, 1, 1, 1, 1,
-0.6300976, -1.919931, -1.619312, 1, 1, 1, 1, 1,
-0.6270964, 1.132034, -0.2190239, 1, 1, 1, 1, 1,
-0.6211814, -0.5711902, -1.753959, 1, 1, 1, 1, 1,
-0.6175321, 0.7353699, -0.1661734, 1, 1, 1, 1, 1,
-0.6160827, -0.6740218, -2.105288, 1, 1, 1, 1, 1,
-0.609385, 0.7356149, -0.1775871, 1, 1, 1, 1, 1,
-0.6090544, 0.3294662, -2.166442, 1, 1, 1, 1, 1,
-0.6050199, -0.3067882, -0.6086919, 1, 1, 1, 1, 1,
-0.6049643, -0.4338109, -4.150702, 1, 1, 1, 1, 1,
-0.6025184, -0.6963421, -1.226961, 1, 1, 1, 1, 1,
-0.5988715, -1.01163, -3.590487, 1, 1, 1, 1, 1,
-0.5983725, -0.265413, -2.793676, 1, 1, 1, 1, 1,
-0.5947316, -0.7083233, -2.754622, 1, 1, 1, 1, 1,
-0.5947195, -1.071797, -2.120178, 0, 0, 1, 1, 1,
-0.5918989, 0.6866507, -1.924698, 1, 0, 0, 1, 1,
-0.5914568, 0.9281979, -1.727985, 1, 0, 0, 1, 1,
-0.5905007, -1.166213, -2.529734, 1, 0, 0, 1, 1,
-0.5860002, 1.016644, -2.016009, 1, 0, 0, 1, 1,
-0.5829796, 0.5615246, -3.326983, 1, 0, 0, 1, 1,
-0.5795116, -0.6823086, -2.766081, 0, 0, 0, 1, 1,
-0.5678518, -0.7134436, -2.19888, 0, 0, 0, 1, 1,
-0.5636495, 0.3756261, -0.713365, 0, 0, 0, 1, 1,
-0.562989, -0.2074598, -1.722607, 0, 0, 0, 1, 1,
-0.5587415, -0.319497, -2.700749, 0, 0, 0, 1, 1,
-0.55807, -0.08426791, -1.808857, 0, 0, 0, 1, 1,
-0.5530213, 0.7588303, -1.626567, 0, 0, 0, 1, 1,
-0.5518788, 0.1366652, -0.2918096, 1, 1, 1, 1, 1,
-0.5513923, -0.5653377, -1.78461, 1, 1, 1, 1, 1,
-0.5500668, -1.292062, -3.934602, 1, 1, 1, 1, 1,
-0.5443633, -0.1699369, 0.5202388, 1, 1, 1, 1, 1,
-0.5442296, 0.180022, 0.1729247, 1, 1, 1, 1, 1,
-0.541646, 1.774148, -0.1800791, 1, 1, 1, 1, 1,
-0.5368704, 1.173734, -0.072593, 1, 1, 1, 1, 1,
-0.5354034, -0.07655834, -2.725489, 1, 1, 1, 1, 1,
-0.5342138, -0.2721899, -1.884873, 1, 1, 1, 1, 1,
-0.5329863, -0.1327871, -1.059725, 1, 1, 1, 1, 1,
-0.5245969, 1.634344, -0.4752946, 1, 1, 1, 1, 1,
-0.524403, -0.733031, -3.5305, 1, 1, 1, 1, 1,
-0.5240232, 1.29829, 0.4313174, 1, 1, 1, 1, 1,
-0.5233118, 1.788648, -1.170683, 1, 1, 1, 1, 1,
-0.5229539, 1.265413, -0.0551162, 1, 1, 1, 1, 1,
-0.5206189, -0.0159978, -2.733863, 0, 0, 1, 1, 1,
-0.5179869, -0.8650602, -2.063549, 1, 0, 0, 1, 1,
-0.5151927, -0.9309587, -2.069149, 1, 0, 0, 1, 1,
-0.5133944, 1.374366, 0.006981872, 1, 0, 0, 1, 1,
-0.5126368, -0.763863, -1.83095, 1, 0, 0, 1, 1,
-0.5120802, -0.6794312, -3.471887, 1, 0, 0, 1, 1,
-0.5105535, 0.2911931, -0.2118861, 0, 0, 0, 1, 1,
-0.5081588, 0.0376438, -1.938878, 0, 0, 0, 1, 1,
-0.5076004, 0.4070701, -0.7615621, 0, 0, 0, 1, 1,
-0.5061991, -0.1854971, -1.771136, 0, 0, 0, 1, 1,
-0.5027224, 0.8991393, -2.25825, 0, 0, 0, 1, 1,
-0.5022706, 0.13883, -1.473387, 0, 0, 0, 1, 1,
-0.5019127, 0.2282332, 0.3232566, 0, 0, 0, 1, 1,
-0.5002004, 0.5425301, 0.4720652, 1, 1, 1, 1, 1,
-0.4895651, 1.287094, -1.156593, 1, 1, 1, 1, 1,
-0.4895349, 0.9978189, -1.627301, 1, 1, 1, 1, 1,
-0.4857593, 1.007375, 0.09885129, 1, 1, 1, 1, 1,
-0.4807746, 0.7113358, 1.031769, 1, 1, 1, 1, 1,
-0.4791986, -0.1927612, -1.595498, 1, 1, 1, 1, 1,
-0.4783526, 0.6333289, -1.398522, 1, 1, 1, 1, 1,
-0.4765463, -1.432432, -2.37259, 1, 1, 1, 1, 1,
-0.4752766, 0.4456421, -1.655834, 1, 1, 1, 1, 1,
-0.473586, -0.2960116, -2.879253, 1, 1, 1, 1, 1,
-0.4666863, -0.1509441, -2.776203, 1, 1, 1, 1, 1,
-0.4662299, 0.6924527, -0.1452166, 1, 1, 1, 1, 1,
-0.4659982, -0.4058666, -1.71908, 1, 1, 1, 1, 1,
-0.4627452, -2.55814, -3.068377, 1, 1, 1, 1, 1,
-0.4622566, 1.21155, -0.9374091, 1, 1, 1, 1, 1,
-0.4615318, 0.5559309, -1.021573, 0, 0, 1, 1, 1,
-0.4599301, -1.123826, -2.910871, 1, 0, 0, 1, 1,
-0.4575913, 2.053214, -0.4564024, 1, 0, 0, 1, 1,
-0.4568349, -0.8002586, -3.132813, 1, 0, 0, 1, 1,
-0.4554919, -1.727381, -0.7974502, 1, 0, 0, 1, 1,
-0.4517422, 1.998667, -0.6099715, 1, 0, 0, 1, 1,
-0.4454857, 0.2459911, -2.409052, 0, 0, 0, 1, 1,
-0.4428345, 0.1562725, -0.7229149, 0, 0, 0, 1, 1,
-0.4407162, -0.7125357, -4.865665, 0, 0, 0, 1, 1,
-0.4346474, -0.3511654, -0.3779802, 0, 0, 0, 1, 1,
-0.4280495, -0.2038546, -3.795165, 0, 0, 0, 1, 1,
-0.4205996, 0.6738415, 0.4783643, 0, 0, 0, 1, 1,
-0.4192297, 1.787729, 0.4336469, 0, 0, 0, 1, 1,
-0.4186944, 1.236137, -1.034799, 1, 1, 1, 1, 1,
-0.4168309, 0.5619207, 0.6394784, 1, 1, 1, 1, 1,
-0.4151488, -0.7953415, -1.750419, 1, 1, 1, 1, 1,
-0.4147007, 0.1708573, -1.507668, 1, 1, 1, 1, 1,
-0.4136484, 1.025566, -0.6389316, 1, 1, 1, 1, 1,
-0.4129254, 0.4865388, 0.2369113, 1, 1, 1, 1, 1,
-0.4117871, 0.4298948, -0.08880198, 1, 1, 1, 1, 1,
-0.408745, -0.185427, -2.25266, 1, 1, 1, 1, 1,
-0.4085943, 0.5578243, -1.261285, 1, 1, 1, 1, 1,
-0.4078175, -0.771075, -3.476393, 1, 1, 1, 1, 1,
-0.4069259, -1.00124, -2.028035, 1, 1, 1, 1, 1,
-0.404327, -0.5327274, -3.267107, 1, 1, 1, 1, 1,
-0.3974049, -2.235595, -1.176902, 1, 1, 1, 1, 1,
-0.3909734, 1.088009, 0.3952993, 1, 1, 1, 1, 1,
-0.3879651, 0.2370244, -0.7320169, 1, 1, 1, 1, 1,
-0.3808952, -1.111069, -2.698189, 0, 0, 1, 1, 1,
-0.3806081, 0.3068733, -0.7478256, 1, 0, 0, 1, 1,
-0.3788297, 0.7562826, -0.658844, 1, 0, 0, 1, 1,
-0.3780972, -1.291728, -2.713907, 1, 0, 0, 1, 1,
-0.3779444, 0.722236, -0.7964116, 1, 0, 0, 1, 1,
-0.3762902, -1.482018, -2.047348, 1, 0, 0, 1, 1,
-0.3720616, -0.5944157, -2.045274, 0, 0, 0, 1, 1,
-0.3703068, -1.615654, -3.175887, 0, 0, 0, 1, 1,
-0.3665313, -1.131692, -1.354643, 0, 0, 0, 1, 1,
-0.3653655, -0.5207133, -2.877193, 0, 0, 0, 1, 1,
-0.361206, 0.041631, -1.484924, 0, 0, 0, 1, 1,
-0.358713, -0.09528463, -1.31675, 0, 0, 0, 1, 1,
-0.3581397, -0.7221208, -1.862107, 0, 0, 0, 1, 1,
-0.3580299, -0.05294151, -1.787026, 1, 1, 1, 1, 1,
-0.3568125, 0.08196346, -1.237298, 1, 1, 1, 1, 1,
-0.3556899, 0.1574681, -2.807349, 1, 1, 1, 1, 1,
-0.3513287, 0.4935166, -0.566297, 1, 1, 1, 1, 1,
-0.3512888, -1.241178, -3.23938, 1, 1, 1, 1, 1,
-0.3372063, -0.6311153, -0.8888429, 1, 1, 1, 1, 1,
-0.3366542, 1.664525, 0.1502276, 1, 1, 1, 1, 1,
-0.3352854, -0.2854315, -2.611312, 1, 1, 1, 1, 1,
-0.3335716, 0.6822466, -0.9918671, 1, 1, 1, 1, 1,
-0.3326479, 0.5875754, 0.9882132, 1, 1, 1, 1, 1,
-0.3304672, 0.9145659, 0.9226421, 1, 1, 1, 1, 1,
-0.3283829, -0.2981388, -1.959653, 1, 1, 1, 1, 1,
-0.3280121, 1.369694, -0.0898562, 1, 1, 1, 1, 1,
-0.3208866, -0.05540649, -0.1798639, 1, 1, 1, 1, 1,
-0.3207473, 1.856754, 1.375081, 1, 1, 1, 1, 1,
-0.3203723, 0.9372217, 1.517215, 0, 0, 1, 1, 1,
-0.3195798, -0.7102927, -4.250056, 1, 0, 0, 1, 1,
-0.3063034, -1.436575, -2.549292, 1, 0, 0, 1, 1,
-0.3059337, 1.069315, -1.10304, 1, 0, 0, 1, 1,
-0.3056629, 0.7484427, -1.69945, 1, 0, 0, 1, 1,
-0.3041913, -0.0198876, -3.018216, 1, 0, 0, 1, 1,
-0.3036549, 1.110108, 1.027391, 0, 0, 0, 1, 1,
-0.3009502, 0.9994028, 0.2253322, 0, 0, 0, 1, 1,
-0.2998889, 0.6458599, 0.4234538, 0, 0, 0, 1, 1,
-0.2973664, 0.4911383, -0.1737102, 0, 0, 0, 1, 1,
-0.2959443, -0.2751382, -4.748555, 0, 0, 0, 1, 1,
-0.2938316, 1.591582, 1.805215, 0, 0, 0, 1, 1,
-0.2909861, -1.220437, -2.808022, 0, 0, 0, 1, 1,
-0.2878552, 0.3697284, -0.8113107, 1, 1, 1, 1, 1,
-0.2860833, 0.105686, 0.4913963, 1, 1, 1, 1, 1,
-0.2836414, -0.8160492, -2.967049, 1, 1, 1, 1, 1,
-0.2765063, -2.303351, -2.307701, 1, 1, 1, 1, 1,
-0.2754793, 1.842103, -0.1688371, 1, 1, 1, 1, 1,
-0.2748821, -1.022629, -4.003152, 1, 1, 1, 1, 1,
-0.2714981, 1.099285, -1.313804, 1, 1, 1, 1, 1,
-0.2685027, 0.6026198, 0.5184517, 1, 1, 1, 1, 1,
-0.2675639, 0.9159585, -2.707712, 1, 1, 1, 1, 1,
-0.2673045, -1.205868, -2.197091, 1, 1, 1, 1, 1,
-0.2630478, -0.1784603, -2.135834, 1, 1, 1, 1, 1,
-0.2628225, 0.9296051, 0.7983392, 1, 1, 1, 1, 1,
-0.2621781, 1.08768, 1.606207, 1, 1, 1, 1, 1,
-0.2597854, 1.373805, -0.01536146, 1, 1, 1, 1, 1,
-0.2597475, -1.398168, -2.569761, 1, 1, 1, 1, 1,
-0.2594886, 0.5029403, -0.2697859, 0, 0, 1, 1, 1,
-0.2589484, -2.012443, -2.890257, 1, 0, 0, 1, 1,
-0.2589166, 0.2218917, -0.7450735, 1, 0, 0, 1, 1,
-0.2568271, 1.907493, -0.4899197, 1, 0, 0, 1, 1,
-0.2538844, -0.6807837, -3.702999, 1, 0, 0, 1, 1,
-0.2533372, -0.2136815, -1.401142, 1, 0, 0, 1, 1,
-0.242809, -0.2669461, -2.651896, 0, 0, 0, 1, 1,
-0.2409824, -1.125463, -4.015561, 0, 0, 0, 1, 1,
-0.2400136, -0.08345703, -3.055659, 0, 0, 0, 1, 1,
-0.2388701, 0.0380497, -1.342932, 0, 0, 0, 1, 1,
-0.237158, -0.6150967, -4.765495, 0, 0, 0, 1, 1,
-0.2303759, -1.304978, -2.111652, 0, 0, 0, 1, 1,
-0.2249542, 0.2509606, 0.6911758, 0, 0, 0, 1, 1,
-0.224928, -0.4053453, -4.077601, 1, 1, 1, 1, 1,
-0.2229295, -0.550697, -4.39369, 1, 1, 1, 1, 1,
-0.2198544, -0.2119131, -3.537283, 1, 1, 1, 1, 1,
-0.2181563, 0.5547196, 0.1197107, 1, 1, 1, 1, 1,
-0.2154107, -1.143517, -3.207009, 1, 1, 1, 1, 1,
-0.2136017, -0.5449817, -3.401422, 1, 1, 1, 1, 1,
-0.2103968, -0.008679679, -1.810108, 1, 1, 1, 1, 1,
-0.2067512, 1.10502, 0.0201546, 1, 1, 1, 1, 1,
-0.2036677, 0.2258868, 1.334901, 1, 1, 1, 1, 1,
-0.2001515, 1.257995, 0.6316217, 1, 1, 1, 1, 1,
-0.1968488, -0.356232, -2.885417, 1, 1, 1, 1, 1,
-0.1912181, -0.8405983, -3.157678, 1, 1, 1, 1, 1,
-0.1900854, 0.9915709, 0.6995766, 1, 1, 1, 1, 1,
-0.1868763, 0.5570759, 0.9719926, 1, 1, 1, 1, 1,
-0.1848349, -0.6896713, -2.966461, 1, 1, 1, 1, 1,
-0.182706, 0.06623179, -1.547177, 0, 0, 1, 1, 1,
-0.1820735, -1.018096, -4.211997, 1, 0, 0, 1, 1,
-0.181928, 0.6746247, 0.5105535, 1, 0, 0, 1, 1,
-0.1780796, -1.114422, -0.8706051, 1, 0, 0, 1, 1,
-0.1778173, -0.1358444, -1.12712, 1, 0, 0, 1, 1,
-0.1764128, -0.6931021, -4.563347, 1, 0, 0, 1, 1,
-0.1753622, 0.387854, -0.4816101, 0, 0, 0, 1, 1,
-0.1645747, 1.148197, -0.7653348, 0, 0, 0, 1, 1,
-0.1642902, -1.572346, -1.721808, 0, 0, 0, 1, 1,
-0.1614555, -1.178546, -4.596213, 0, 0, 0, 1, 1,
-0.1602751, 0.4924664, 0.7866198, 0, 0, 0, 1, 1,
-0.1593626, -0.2967402, -3.265485, 0, 0, 0, 1, 1,
-0.1585326, -0.4783553, -3.405613, 0, 0, 0, 1, 1,
-0.1583006, 0.1488267, 0.1857246, 1, 1, 1, 1, 1,
-0.1580147, -0.1887771, -3.26527, 1, 1, 1, 1, 1,
-0.1539722, -0.2247813, -3.4018, 1, 1, 1, 1, 1,
-0.1535289, -0.2971911, -2.964782, 1, 1, 1, 1, 1,
-0.1528077, 0.2085862, -1.159888, 1, 1, 1, 1, 1,
-0.1522161, 0.3572838, -1.536448, 1, 1, 1, 1, 1,
-0.1502075, -0.5210218, -3.67625, 1, 1, 1, 1, 1,
-0.1381241, -0.1173273, -2.393082, 1, 1, 1, 1, 1,
-0.1378025, 0.5341106, -1.63732, 1, 1, 1, 1, 1,
-0.1363063, -2.972235, -4.237753, 1, 1, 1, 1, 1,
-0.1328835, -0.9972746, -3.61596, 1, 1, 1, 1, 1,
-0.1301678, -0.1083463, -2.454706, 1, 1, 1, 1, 1,
-0.1289336, -0.6098231, -1.551406, 1, 1, 1, 1, 1,
-0.1240115, 1.041327, -0.1951881, 1, 1, 1, 1, 1,
-0.1158703, 0.1298864, -3.274775, 1, 1, 1, 1, 1,
-0.1148736, -0.3545333, -2.285545, 0, 0, 1, 1, 1,
-0.1060568, -0.03166589, -1.556696, 1, 0, 0, 1, 1,
-0.1008569, 0.6294528, 1.156401, 1, 0, 0, 1, 1,
-0.09656496, -1.092228, -1.229366, 1, 0, 0, 1, 1,
-0.09600388, 0.8864779, -0.9795452, 1, 0, 0, 1, 1,
-0.09389826, -0.7763432, -2.607993, 1, 0, 0, 1, 1,
-0.08927952, -1.265838, -2.455684, 0, 0, 0, 1, 1,
-0.08369981, -0.4382172, -2.775241, 0, 0, 0, 1, 1,
-0.07598949, 1.994056, -1.966291, 0, 0, 0, 1, 1,
-0.07556498, 0.29837, -0.7004275, 0, 0, 0, 1, 1,
-0.07307432, -0.2923111, -2.191033, 0, 0, 0, 1, 1,
-0.07029435, 1.091279, -0.6824421, 0, 0, 0, 1, 1,
-0.07011089, -0.4151331, -4.263241, 0, 0, 0, 1, 1,
-0.06942983, -1.039071, -3.383249, 1, 1, 1, 1, 1,
-0.06942834, -0.02309606, 0.3592384, 1, 1, 1, 1, 1,
-0.0676271, -0.02785837, -1.912621, 1, 1, 1, 1, 1,
-0.06662348, 0.534142, -1.561345, 1, 1, 1, 1, 1,
-0.06479573, 0.08464545, -1.987441, 1, 1, 1, 1, 1,
-0.06462191, -0.01243826, -3.333374, 1, 1, 1, 1, 1,
-0.06136224, 1.090876, -1.153302, 1, 1, 1, 1, 1,
-0.05563533, 1.098648, 0.2985562, 1, 1, 1, 1, 1,
-0.05393278, -1.527002, -3.868543, 1, 1, 1, 1, 1,
-0.05366945, 1.079723, -0.1355798, 1, 1, 1, 1, 1,
-0.05335971, 1.188797, 0.6099665, 1, 1, 1, 1, 1,
-0.03997983, -0.7959864, -2.835141, 1, 1, 1, 1, 1,
-0.03929554, 0.173467, -0.25965, 1, 1, 1, 1, 1,
-0.02967712, -0.00636045, -1.593357, 1, 1, 1, 1, 1,
-0.0266213, -0.4305732, -2.799302, 1, 1, 1, 1, 1,
-0.0231952, -0.9145175, -3.517036, 0, 0, 1, 1, 1,
-0.02260372, 0.8458301, -0.3216898, 1, 0, 0, 1, 1,
-0.02072708, -1.60115, -3.938769, 1, 0, 0, 1, 1,
-0.01780255, 2.23764, 0.1931974, 1, 0, 0, 1, 1,
-0.01654953, 0.1753717, -0.6292476, 1, 0, 0, 1, 1,
-0.01483432, -0.28542, -2.806191, 1, 0, 0, 1, 1,
-0.01412766, 0.6416628, 0.1367265, 0, 0, 0, 1, 1,
-0.01224024, 0.2267763, 0.9407836, 0, 0, 0, 1, 1,
-0.009702718, -0.08396569, -4.139828, 0, 0, 0, 1, 1,
-0.007989116, 0.4647285, 1.939061, 0, 0, 0, 1, 1,
-0.003429477, -2.527969, -3.822131, 0, 0, 0, 1, 1,
-0.001531554, 0.1809323, 0.04921243, 0, 0, 0, 1, 1,
-0.0002931499, 0.3925994, 1.136266, 0, 0, 0, 1, 1,
0.002714402, -0.5633905, 2.130751, 1, 1, 1, 1, 1,
0.004057734, -0.5103212, 2.075835, 1, 1, 1, 1, 1,
0.004579972, -0.1936634, 4.44913, 1, 1, 1, 1, 1,
0.006794534, -0.7939889, 2.99191, 1, 1, 1, 1, 1,
0.007687951, 0.4542054, 0.09766964, 1, 1, 1, 1, 1,
0.01411112, -0.03098916, 2.250533, 1, 1, 1, 1, 1,
0.02054834, -0.4841001, 4.099078, 1, 1, 1, 1, 1,
0.02635607, -0.09722366, 1.474648, 1, 1, 1, 1, 1,
0.02653496, -0.9686534, 2.817962, 1, 1, 1, 1, 1,
0.02732969, -0.2311688, 3.512697, 1, 1, 1, 1, 1,
0.03056309, 0.2882685, -0.9425799, 1, 1, 1, 1, 1,
0.030765, 1.42223, -0.3576785, 1, 1, 1, 1, 1,
0.03145214, -1.716132, 3.585464, 1, 1, 1, 1, 1,
0.03165222, 1.086016, -0.1355686, 1, 1, 1, 1, 1,
0.04334803, 0.07068407, 0.6637052, 1, 1, 1, 1, 1,
0.04486211, -0.2767471, 2.999052, 0, 0, 1, 1, 1,
0.04638235, -2.058244, 2.853732, 1, 0, 0, 1, 1,
0.04802958, 0.6845782, -1.244212, 1, 0, 0, 1, 1,
0.05007076, 0.8703915, -2.509036, 1, 0, 0, 1, 1,
0.05058903, 0.3038838, 0.07238245, 1, 0, 0, 1, 1,
0.05073734, 0.4130804, 1.843477, 1, 0, 0, 1, 1,
0.05895952, 0.751417, -0.514446, 0, 0, 0, 1, 1,
0.06132702, 0.3079463, 0.6914594, 0, 0, 0, 1, 1,
0.06170559, 2.633969, -0.294021, 0, 0, 0, 1, 1,
0.06316364, 0.5056483, -0.5929371, 0, 0, 0, 1, 1,
0.06467916, 3.091689, -2.694363, 0, 0, 0, 1, 1,
0.06772459, -1.862764, 4.005109, 0, 0, 0, 1, 1,
0.06870575, 0.4165777, 0.2365503, 0, 0, 0, 1, 1,
0.07008737, 0.2464202, 2.423065, 1, 1, 1, 1, 1,
0.07171188, -1.960762, 1.485621, 1, 1, 1, 1, 1,
0.07493043, 0.2829329, 1.08652, 1, 1, 1, 1, 1,
0.07584176, 0.5481403, -0.4284702, 1, 1, 1, 1, 1,
0.08455878, -0.0188255, 0.6106907, 1, 1, 1, 1, 1,
0.08785459, 0.137192, 1.29087, 1, 1, 1, 1, 1,
0.09042075, -1.103063, 5.437187, 1, 1, 1, 1, 1,
0.09287953, 0.3061384, -0.4863623, 1, 1, 1, 1, 1,
0.09550785, -0.2906694, 4.110244, 1, 1, 1, 1, 1,
0.09565578, -1.260146, 2.880412, 1, 1, 1, 1, 1,
0.09596487, 0.02403929, 1.576536, 1, 1, 1, 1, 1,
0.09633711, 1.533659, 0.4851584, 1, 1, 1, 1, 1,
0.09967524, 0.1713157, 1.901873, 1, 1, 1, 1, 1,
0.09999187, -0.1820337, 4.766774, 1, 1, 1, 1, 1,
0.1027711, 2.201828, 0.5731807, 1, 1, 1, 1, 1,
0.1034994, -1.57762, 2.732655, 0, 0, 1, 1, 1,
0.1083242, 0.159091, 1.750663, 1, 0, 0, 1, 1,
0.1096391, -1.007359, 2.518279, 1, 0, 0, 1, 1,
0.1139875, -0.0564179, 1.295407, 1, 0, 0, 1, 1,
0.1145263, 1.133301, -0.4541108, 1, 0, 0, 1, 1,
0.1149442, 2.432389, -1.129428, 1, 0, 0, 1, 1,
0.1184466, 0.7630066, 1.476029, 0, 0, 0, 1, 1,
0.119694, 0.9669837, -1.343015, 0, 0, 0, 1, 1,
0.1239586, -0.2309706, 1.502559, 0, 0, 0, 1, 1,
0.1247631, 0.939702, -0.0004876899, 0, 0, 0, 1, 1,
0.1277543, -0.2839009, 2.54473, 0, 0, 0, 1, 1,
0.1281998, 2.16159, 0.59137, 0, 0, 0, 1, 1,
0.1341439, -0.2721291, 1.40696, 0, 0, 0, 1, 1,
0.1376283, 0.8326405, -1.280592, 1, 1, 1, 1, 1,
0.1390066, -0.534945, 2.561612, 1, 1, 1, 1, 1,
0.1441955, 1.831785, -2.557447, 1, 1, 1, 1, 1,
0.1467842, 2.208562, -1.53615, 1, 1, 1, 1, 1,
0.1485484, -0.8476273, 2.168489, 1, 1, 1, 1, 1,
0.1489444, -0.1899281, 1.875237, 1, 1, 1, 1, 1,
0.1561846, -0.07271349, 2.507754, 1, 1, 1, 1, 1,
0.1579443, -1.593017, 2.017975, 1, 1, 1, 1, 1,
0.1586871, 0.1554988, 1.105183, 1, 1, 1, 1, 1,
0.1633765, 0.5307548, 1.035683, 1, 1, 1, 1, 1,
0.163478, -0.3961141, 2.597061, 1, 1, 1, 1, 1,
0.1636589, -2.607206, 2.519462, 1, 1, 1, 1, 1,
0.1656973, -0.6950523, 2.346413, 1, 1, 1, 1, 1,
0.1659726, 1.024213, 0.6157618, 1, 1, 1, 1, 1,
0.1660261, 1.805613, -0.8117595, 1, 1, 1, 1, 1,
0.1680738, -1.402389, 3.045792, 0, 0, 1, 1, 1,
0.1695701, -1.315507, 2.017387, 1, 0, 0, 1, 1,
0.1743239, 0.4727984, 0.1283888, 1, 0, 0, 1, 1,
0.180864, -0.1613147, 3.693319, 1, 0, 0, 1, 1,
0.1830261, -0.8451928, 2.710932, 1, 0, 0, 1, 1,
0.1912803, -0.4649365, 2.244805, 1, 0, 0, 1, 1,
0.1918986, 0.004524705, 1.950144, 0, 0, 0, 1, 1,
0.1947211, -0.3134204, 3.070981, 0, 0, 0, 1, 1,
0.1979333, -1.833991, 2.399553, 0, 0, 0, 1, 1,
0.2002246, -1.1377, 0.4852885, 0, 0, 0, 1, 1,
0.2023962, 1.24084, 0.1448857, 0, 0, 0, 1, 1,
0.2073411, -0.2289976, 3.171571, 0, 0, 0, 1, 1,
0.2143397, 1.440542, -1.341501, 0, 0, 0, 1, 1,
0.2175754, 0.839425, 0.07379995, 1, 1, 1, 1, 1,
0.2198862, 1.498818, -0.4726775, 1, 1, 1, 1, 1,
0.2212009, 0.5083314, 1.483561, 1, 1, 1, 1, 1,
0.2238925, 0.8698235, 0.6524141, 1, 1, 1, 1, 1,
0.2239215, -0.6287397, 3.249961, 1, 1, 1, 1, 1,
0.2246237, 1.65456, 2.247227, 1, 1, 1, 1, 1,
0.2299794, 0.9681149, -0.3610551, 1, 1, 1, 1, 1,
0.2387566, -0.6746261, 2.609592, 1, 1, 1, 1, 1,
0.2394325, -0.2512973, 1.397942, 1, 1, 1, 1, 1,
0.2440475, -0.05687496, 2.12327, 1, 1, 1, 1, 1,
0.2441887, -0.1475749, 1.709567, 1, 1, 1, 1, 1,
0.250972, -0.7813329, 2.730645, 1, 1, 1, 1, 1,
0.2519702, 1.680203, -0.7588935, 1, 1, 1, 1, 1,
0.2534483, 1.069658, 1.429029, 1, 1, 1, 1, 1,
0.2535287, -0.4751832, 2.828781, 1, 1, 1, 1, 1,
0.2547005, 0.5475183, 1.694502, 0, 0, 1, 1, 1,
0.2576305, -0.3845888, 1.582102, 1, 0, 0, 1, 1,
0.2592153, -0.9360675, 2.295854, 1, 0, 0, 1, 1,
0.2621999, -1.206849, 2.630384, 1, 0, 0, 1, 1,
0.2627643, -0.4359846, 3.036757, 1, 0, 0, 1, 1,
0.2637892, 0.726799, 0.4355394, 1, 0, 0, 1, 1,
0.2647663, -2.031466, 2.190855, 0, 0, 0, 1, 1,
0.2658211, 0.2671725, 1.647126, 0, 0, 0, 1, 1,
0.2689469, 0.5530303, 0.7772184, 0, 0, 0, 1, 1,
0.2708864, 1.251648, -0.8057266, 0, 0, 0, 1, 1,
0.2763683, 0.4256676, -0.4870574, 0, 0, 0, 1, 1,
0.2811939, -0.5619687, 2.507199, 0, 0, 0, 1, 1,
0.2828591, 0.7798268, 0.8148582, 0, 0, 0, 1, 1,
0.2847806, 0.275313, 1.377623, 1, 1, 1, 1, 1,
0.2880267, 0.3105773, 0.646488, 1, 1, 1, 1, 1,
0.3039559, 0.03372306, 3.036996, 1, 1, 1, 1, 1,
0.3047977, -1.164555, 2.621482, 1, 1, 1, 1, 1,
0.3049009, 1.699883, -0.2695859, 1, 1, 1, 1, 1,
0.306499, -0.3383336, 2.995296, 1, 1, 1, 1, 1,
0.3069713, -0.4378989, 2.903612, 1, 1, 1, 1, 1,
0.3091413, 1.295905, 1.087121, 1, 1, 1, 1, 1,
0.3111247, -1.127722, 2.645567, 1, 1, 1, 1, 1,
0.3154472, 0.1910699, 0.2565783, 1, 1, 1, 1, 1,
0.3174708, 0.4807042, 0.319737, 1, 1, 1, 1, 1,
0.3238506, -0.460274, 2.89853, 1, 1, 1, 1, 1,
0.325395, -0.7639142, 3.930486, 1, 1, 1, 1, 1,
0.326098, 1.090882, -0.03240369, 1, 1, 1, 1, 1,
0.3364716, -0.9470351, 3.674756, 1, 1, 1, 1, 1,
0.3454608, -0.446773, 3.820535, 0, 0, 1, 1, 1,
0.3472707, 0.1589795, 1.58793, 1, 0, 0, 1, 1,
0.3486536, -0.3849542, 2.729026, 1, 0, 0, 1, 1,
0.3487019, 1.969215, -0.430514, 1, 0, 0, 1, 1,
0.3524562, -0.8285848, 2.64077, 1, 0, 0, 1, 1,
0.3531992, -0.8052866, 2.344461, 1, 0, 0, 1, 1,
0.3552545, -1.240715, 1.923231, 0, 0, 0, 1, 1,
0.3580992, -2.029723, 4.468544, 0, 0, 0, 1, 1,
0.36059, 0.9944561, 0.7230081, 0, 0, 0, 1, 1,
0.3635787, -0.4208012, 3.801905, 0, 0, 0, 1, 1,
0.3666759, 1.154018, 0.7154495, 0, 0, 0, 1, 1,
0.368665, -0.7593579, 3.581961, 0, 0, 0, 1, 1,
0.3764842, -0.9412621, 4.388679, 0, 0, 0, 1, 1,
0.3819291, -0.855206, 2.125126, 1, 1, 1, 1, 1,
0.382164, -1.133381, 1.581354, 1, 1, 1, 1, 1,
0.382264, -1.231522, 2.904914, 1, 1, 1, 1, 1,
0.3852346, 0.05645605, 2.340341, 1, 1, 1, 1, 1,
0.3892837, -0.740482, 2.393766, 1, 1, 1, 1, 1,
0.3939368, -0.3602428, 3.276884, 1, 1, 1, 1, 1,
0.3997015, 0.7818159, 2.077188, 1, 1, 1, 1, 1,
0.4007941, -0.04507418, 1.8097, 1, 1, 1, 1, 1,
0.4065409, 0.4091145, 1.138572, 1, 1, 1, 1, 1,
0.410291, -1.564855, 2.418474, 1, 1, 1, 1, 1,
0.4137613, -2.491157, 2.769783, 1, 1, 1, 1, 1,
0.4157382, -1.017475, 1.167848, 1, 1, 1, 1, 1,
0.4217402, -0.06542759, 1.641167, 1, 1, 1, 1, 1,
0.4264708, 0.1684646, -1.775502, 1, 1, 1, 1, 1,
0.427336, -0.1129884, 2.66535, 1, 1, 1, 1, 1,
0.4313456, 0.7789767, 1.452242, 0, 0, 1, 1, 1,
0.4347534, 0.5358353, -0.5528642, 1, 0, 0, 1, 1,
0.4403115, 0.4217074, -0.364634, 1, 0, 0, 1, 1,
0.4438334, -1.55022, 2.284341, 1, 0, 0, 1, 1,
0.446198, -0.7931934, 2.64063, 1, 0, 0, 1, 1,
0.4507611, -0.106723, 2.858524, 1, 0, 0, 1, 1,
0.4535714, -0.06793474, 2.778975, 0, 0, 0, 1, 1,
0.4558467, 0.9296712, 1.210992, 0, 0, 0, 1, 1,
0.4585883, -0.07022426, 1.578081, 0, 0, 0, 1, 1,
0.4620778, 2.181638, 1.048832, 0, 0, 0, 1, 1,
0.4636492, -0.9481533, 2.236351, 0, 0, 0, 1, 1,
0.4637974, -1.174435, 1.398873, 0, 0, 0, 1, 1,
0.4679119, -0.001398543, 0.8112285, 0, 0, 0, 1, 1,
0.4723031, 0.5009528, -0.4885243, 1, 1, 1, 1, 1,
0.4754852, -0.623454, 1.057856, 1, 1, 1, 1, 1,
0.4901129, -0.9656221, 1.396034, 1, 1, 1, 1, 1,
0.4913901, -0.8826577, 1.796381, 1, 1, 1, 1, 1,
0.5007818, 0.3954175, 0.8727493, 1, 1, 1, 1, 1,
0.5013379, 1.359974, 1.090847, 1, 1, 1, 1, 1,
0.5013841, -0.8746639, 3.85811, 1, 1, 1, 1, 1,
0.5037317, 0.7387828, -0.6600385, 1, 1, 1, 1, 1,
0.5070155, -1.087126, 2.79841, 1, 1, 1, 1, 1,
0.5093185, -1.130076, 1.643546, 1, 1, 1, 1, 1,
0.5131015, 1.652488, 0.3798628, 1, 1, 1, 1, 1,
0.5141912, 1.227598, 0.05477314, 1, 1, 1, 1, 1,
0.5216748, 0.6439273, 0.428131, 1, 1, 1, 1, 1,
0.522103, 0.1797716, 0.8911874, 1, 1, 1, 1, 1,
0.5299575, -1.798084, 4.349057, 1, 1, 1, 1, 1,
0.533744, -2.609699, 1.596975, 0, 0, 1, 1, 1,
0.5339345, -0.4524106, 3.122154, 1, 0, 0, 1, 1,
0.5362539, 0.4736149, 3.008045, 1, 0, 0, 1, 1,
0.5441231, 0.8387913, -1.022467, 1, 0, 0, 1, 1,
0.5499764, -0.8334556, 1.926317, 1, 0, 0, 1, 1,
0.5531654, -0.2065834, 1.541026, 1, 0, 0, 1, 1,
0.5616708, -0.9243485, 1.342937, 0, 0, 0, 1, 1,
0.5641438, 0.07840782, 2.670007, 0, 0, 0, 1, 1,
0.5694593, 0.5764757, 3.503332, 0, 0, 0, 1, 1,
0.5711036, -0.4881585, 2.895402, 0, 0, 0, 1, 1,
0.5742802, 1.704759, 0.7876784, 0, 0, 0, 1, 1,
0.5795529, 0.8254123, -0.7698543, 0, 0, 0, 1, 1,
0.580834, -1.108645, 3.295791, 0, 0, 0, 1, 1,
0.5809588, 0.7052691, 0.5976143, 1, 1, 1, 1, 1,
0.5815369, 1.048708, 0.6513234, 1, 1, 1, 1, 1,
0.5824352, -0.8940139, 1.980436, 1, 1, 1, 1, 1,
0.5829104, -0.1579563, 1.722736, 1, 1, 1, 1, 1,
0.5858054, 0.4476109, 2.185071, 1, 1, 1, 1, 1,
0.5862075, 1.186969, 0.5024574, 1, 1, 1, 1, 1,
0.5886254, -1.032041, 3.699446, 1, 1, 1, 1, 1,
0.5899075, -0.6659632, 2.077849, 1, 1, 1, 1, 1,
0.5900284, -0.6511771, 1.274431, 1, 1, 1, 1, 1,
0.5909085, 0.7382584, 0.8243498, 1, 1, 1, 1, 1,
0.5911915, -0.8857995, 2.793993, 1, 1, 1, 1, 1,
0.5980129, -0.2855027, 2.183639, 1, 1, 1, 1, 1,
0.6001576, -0.0651122, 0.3066495, 1, 1, 1, 1, 1,
0.6091526, -1.348389, 4.160424, 1, 1, 1, 1, 1,
0.6135748, -0.2043433, 0.7230678, 1, 1, 1, 1, 1,
0.615781, 0.3981392, 0.5003136, 0, 0, 1, 1, 1,
0.6179234, 0.2042557, 0.6760359, 1, 0, 0, 1, 1,
0.6181468, -0.8493019, 2.59139, 1, 0, 0, 1, 1,
0.6185325, 0.8060678, 0.4537697, 1, 0, 0, 1, 1,
0.6350835, -1.142211, 4.497038, 1, 0, 0, 1, 1,
0.6375203, -0.9055888, 3.26062, 1, 0, 0, 1, 1,
0.6413462, 0.8860406, 1.301789, 0, 0, 0, 1, 1,
0.6443837, -0.1444284, 1.000201, 0, 0, 0, 1, 1,
0.6462817, 0.04627108, 0.5406287, 0, 0, 0, 1, 1,
0.6472721, -1.07529, 2.085025, 0, 0, 0, 1, 1,
0.6485828, 2.08038, -0.1049692, 0, 0, 0, 1, 1,
0.6487446, -0.4806313, 2.712242, 0, 0, 0, 1, 1,
0.6501386, -0.01766199, 1.594179, 0, 0, 0, 1, 1,
0.6501958, -0.6365703, 2.48806, 1, 1, 1, 1, 1,
0.6503602, 0.4850686, 2.081305, 1, 1, 1, 1, 1,
0.6564953, -1.67179, 3.296261, 1, 1, 1, 1, 1,
0.6566371, 0.9620542, 0.3780939, 1, 1, 1, 1, 1,
0.6601607, 0.9883075, 0.4684911, 1, 1, 1, 1, 1,
0.6608711, -0.2218619, 0.4619912, 1, 1, 1, 1, 1,
0.6627188, 1.686744, 0.2882084, 1, 1, 1, 1, 1,
0.6634476, -0.2186794, 2.807188, 1, 1, 1, 1, 1,
0.6695843, -0.8883354, 3.855867, 1, 1, 1, 1, 1,
0.6707836, -1.378672, 2.981445, 1, 1, 1, 1, 1,
0.6712698, 0.645542, 0.7917745, 1, 1, 1, 1, 1,
0.6727937, 0.0864396, 0.6655575, 1, 1, 1, 1, 1,
0.6729512, 0.3999255, 1.136781, 1, 1, 1, 1, 1,
0.6781121, 0.8211994, 0.06530889, 1, 1, 1, 1, 1,
0.680821, 0.7549539, 0.5086721, 1, 1, 1, 1, 1,
0.6824904, 0.4997168, 1.064255, 0, 0, 1, 1, 1,
0.6858279, -0.4652608, 1.400283, 1, 0, 0, 1, 1,
0.6868626, -0.9522082, 2.658875, 1, 0, 0, 1, 1,
0.6964023, -0.8353445, 4.128896, 1, 0, 0, 1, 1,
0.7009374, 0.4807743, 2.704278, 1, 0, 0, 1, 1,
0.7057012, 0.08474796, 0.164482, 1, 0, 0, 1, 1,
0.7070675, -1.899766, 2.046839, 0, 0, 0, 1, 1,
0.7120575, 0.3539509, 2.389247, 0, 0, 0, 1, 1,
0.7166942, -0.2948767, 3.638957, 0, 0, 0, 1, 1,
0.7191575, -0.07086349, 1.929513, 0, 0, 0, 1, 1,
0.7193898, -1.503809, 2.539855, 0, 0, 0, 1, 1,
0.7197033, 1.39644, 0.3356471, 0, 0, 0, 1, 1,
0.7205874, -0.04973383, -0.2632643, 0, 0, 0, 1, 1,
0.729188, -1.083546, 2.057138, 1, 1, 1, 1, 1,
0.7298872, -1.917287, 3.518473, 1, 1, 1, 1, 1,
0.7376371, 1.092744, -1.374631, 1, 1, 1, 1, 1,
0.7381114, 0.536995, 0.9278258, 1, 1, 1, 1, 1,
0.7491657, 0.06860949, 0.8444058, 1, 1, 1, 1, 1,
0.7493132, 1.077896, 0.5140406, 1, 1, 1, 1, 1,
0.7534881, -0.05880972, 0.7296099, 1, 1, 1, 1, 1,
0.7555475, 0.6597589, 2.542403, 1, 1, 1, 1, 1,
0.7605973, 0.8276753, -0.4824696, 1, 1, 1, 1, 1,
0.7618066, -0.6373653, 2.533789, 1, 1, 1, 1, 1,
0.7643817, -1.036734, 2.771215, 1, 1, 1, 1, 1,
0.7652967, 1.132884, 0.8649679, 1, 1, 1, 1, 1,
0.7671671, 0.6428683, 1.128908, 1, 1, 1, 1, 1,
0.7730915, 0.5777176, 0.2603541, 1, 1, 1, 1, 1,
0.7820082, 1.018702, -0.7215529, 1, 1, 1, 1, 1,
0.7823192, 1.125836, 0.8502507, 0, 0, 1, 1, 1,
0.7823572, -1.155379, 3.338585, 1, 0, 0, 1, 1,
0.7830788, 0.6194096, 1.677901, 1, 0, 0, 1, 1,
0.7837096, 0.5633457, 0.4599862, 1, 0, 0, 1, 1,
0.7886369, 0.331281, -1.108813, 1, 0, 0, 1, 1,
0.7896912, -1.249429, 1.921757, 1, 0, 0, 1, 1,
0.7922073, -0.2393768, 1.431023, 0, 0, 0, 1, 1,
0.7922413, 0.4331418, 2.092626, 0, 0, 0, 1, 1,
0.7936199, -0.2026734, 0.08163191, 0, 0, 0, 1, 1,
0.7942759, 0.1011173, -0.08647277, 0, 0, 0, 1, 1,
0.7945326, 0.5654648, 0.7706702, 0, 0, 0, 1, 1,
0.7951112, 0.2636487, 1.567013, 0, 0, 0, 1, 1,
0.7951427, 0.1836252, 1.634597, 0, 0, 0, 1, 1,
0.7962123, -0.01320615, 0.7914904, 1, 1, 1, 1, 1,
0.7964706, 0.07643764, 2.239617, 1, 1, 1, 1, 1,
0.7965448, 0.2322419, 2.21031, 1, 1, 1, 1, 1,
0.7989108, -0.2345273, 2.284816, 1, 1, 1, 1, 1,
0.8154866, 0.06544599, 1.225419, 1, 1, 1, 1, 1,
0.8174267, 0.3891392, 0.9446505, 1, 1, 1, 1, 1,
0.8206726, -1.542749, 3.562187, 1, 1, 1, 1, 1,
0.8241286, 0.7536218, 1.059388, 1, 1, 1, 1, 1,
0.8249459, -0.4179979, 1.703853, 1, 1, 1, 1, 1,
0.8350903, -0.9604385, 2.474351, 1, 1, 1, 1, 1,
0.8388578, -1.100843, 1.621469, 1, 1, 1, 1, 1,
0.839085, -1.718323, 1.775827, 1, 1, 1, 1, 1,
0.8408283, 0.5554878, 1.987761, 1, 1, 1, 1, 1,
0.846646, 0.8886445, -0.9768772, 1, 1, 1, 1, 1,
0.8469123, -1.3349, 0.400858, 1, 1, 1, 1, 1,
0.847714, 0.9225767, 0.793094, 0, 0, 1, 1, 1,
0.847788, -0.5184404, 2.02498, 1, 0, 0, 1, 1,
0.848479, -0.6842817, 3.578513, 1, 0, 0, 1, 1,
0.8490813, 1.043187, 1.125559, 1, 0, 0, 1, 1,
0.8493211, 0.25199, 1.648046, 1, 0, 0, 1, 1,
0.8575034, 2.233309, -0.2915737, 1, 0, 0, 1, 1,
0.8600733, -1.214285, 4.506352, 0, 0, 0, 1, 1,
0.8600974, -1.328939, 1.235472, 0, 0, 0, 1, 1,
0.8610849, 0.7878169, 0.5520685, 0, 0, 0, 1, 1,
0.8629718, 0.5787426, 1.136379, 0, 0, 0, 1, 1,
0.868241, -0.5140634, 3.117881, 0, 0, 0, 1, 1,
0.8871225, 0.3714525, 1.17712, 0, 0, 0, 1, 1,
0.9015194, 0.1190493, 1.947612, 0, 0, 0, 1, 1,
0.9059538, 1.985802, 0.7386529, 1, 1, 1, 1, 1,
0.9145707, -1.524317, 0.9684111, 1, 1, 1, 1, 1,
0.9490168, 0.2088232, 0.8389155, 1, 1, 1, 1, 1,
0.9536657, -0.186184, 0.9186001, 1, 1, 1, 1, 1,
0.9567323, 0.4312226, 3.199837, 1, 1, 1, 1, 1,
0.9574156, 1.310416, 0.161789, 1, 1, 1, 1, 1,
0.9636746, 0.8894001, 1.958717, 1, 1, 1, 1, 1,
0.9677429, -0.7311226, 2.535565, 1, 1, 1, 1, 1,
0.9696033, 1.325221, -0.06271295, 1, 1, 1, 1, 1,
0.9736004, -0.8497817, 2.53249, 1, 1, 1, 1, 1,
0.9740949, -0.496922, -0.2990511, 1, 1, 1, 1, 1,
0.9744728, -0.01665752, 1.685267, 1, 1, 1, 1, 1,
0.9780868, -0.697028, 0.8918089, 1, 1, 1, 1, 1,
0.9799602, 0.7183836, 2.224161, 1, 1, 1, 1, 1,
0.9815237, 1.384348, 0.1980483, 1, 1, 1, 1, 1,
0.9829072, -0.9047577, 0.294175, 0, 0, 1, 1, 1,
0.9860096, -0.1452982, 2.361208, 1, 0, 0, 1, 1,
0.9920001, 0.7825482, 1.49803, 1, 0, 0, 1, 1,
0.9974237, 0.9859608, -0.06763583, 1, 0, 0, 1, 1,
1.001228, 1.292613, 0.004667468, 1, 0, 0, 1, 1,
1.003306, 0.6451128, 0.09769614, 1, 0, 0, 1, 1,
1.008103, -0.6962266, 1.821611, 0, 0, 0, 1, 1,
1.008639, 0.799776, 0.7436848, 0, 0, 0, 1, 1,
1.012211, -1.272639, 3.071532, 0, 0, 0, 1, 1,
1.012269, 1.348483, 1.983948, 0, 0, 0, 1, 1,
1.018284, -0.5851927, 3.327906, 0, 0, 0, 1, 1,
1.026574, 1.136949, 0.7992557, 0, 0, 0, 1, 1,
1.028402, -1.463543, 2.772269, 0, 0, 0, 1, 1,
1.031183, -1.478323, 0.7480727, 1, 1, 1, 1, 1,
1.040223, 1.924598, -1.587433, 1, 1, 1, 1, 1,
1.041174, 0.1295583, 1.565926, 1, 1, 1, 1, 1,
1.046038, 2.081937, -0.001592996, 1, 1, 1, 1, 1,
1.054886, 0.2131597, 2.821148, 1, 1, 1, 1, 1,
1.060592, -0.3570691, 3.130338, 1, 1, 1, 1, 1,
1.067955, -0.7826155, 1.426969, 1, 1, 1, 1, 1,
1.074108, 0.6038731, 1.340946, 1, 1, 1, 1, 1,
1.074751, -0.9669091, 2.345698, 1, 1, 1, 1, 1,
1.077306, 2.657028, -2.329839, 1, 1, 1, 1, 1,
1.088461, 0.1338936, 1.282909, 1, 1, 1, 1, 1,
1.093696, -1.388429, 3.190426, 1, 1, 1, 1, 1,
1.100083, -0.9054855, 1.581581, 1, 1, 1, 1, 1,
1.106456, 1.20198, 0.7791844, 1, 1, 1, 1, 1,
1.114934, -0.4840864, 1.818835, 1, 1, 1, 1, 1,
1.117187, 1.325657, 0.3917837, 0, 0, 1, 1, 1,
1.117239, 0.5360866, 2.438617, 1, 0, 0, 1, 1,
1.120374, 0.2384465, 2.506169, 1, 0, 0, 1, 1,
1.138113, 0.7343045, -1.073148, 1, 0, 0, 1, 1,
1.15168, 1.958771, 2.087373, 1, 0, 0, 1, 1,
1.152908, -0.6598665, 2.413502, 1, 0, 0, 1, 1,
1.155132, 1.007866, 0.4684919, 0, 0, 0, 1, 1,
1.159362, -1.446519, 2.740872, 0, 0, 0, 1, 1,
1.165545, 0.436053, 0.329895, 0, 0, 0, 1, 1,
1.165771, 0.1552194, 1.407057, 0, 0, 0, 1, 1,
1.167646, -0.7624055, 3.210656, 0, 0, 0, 1, 1,
1.17334, 0.2549997, 1.658643, 0, 0, 0, 1, 1,
1.176274, -2.414421, 2.606675, 0, 0, 0, 1, 1,
1.178853, -0.5125968, 2.877286, 1, 1, 1, 1, 1,
1.182062, 1.48061, 2.727449, 1, 1, 1, 1, 1,
1.183354, -0.666137, 1.80559, 1, 1, 1, 1, 1,
1.184121, -0.2201133, 1.82969, 1, 1, 1, 1, 1,
1.188898, 1.419851, 0.7644958, 1, 1, 1, 1, 1,
1.194977, 0.8083599, 1.039494, 1, 1, 1, 1, 1,
1.195186, 0.00605441, 1.642442, 1, 1, 1, 1, 1,
1.200762, -0.05244076, 2.442931, 1, 1, 1, 1, 1,
1.202743, 1.008826, -0.01318505, 1, 1, 1, 1, 1,
1.208688, 0.05109204, 1.858049, 1, 1, 1, 1, 1,
1.217057, 0.0402706, 0.9776626, 1, 1, 1, 1, 1,
1.224825, 0.1904987, 1.266424, 1, 1, 1, 1, 1,
1.225909, 1.405568, 1.756583, 1, 1, 1, 1, 1,
1.22763, -0.1140035, 1.113929, 1, 1, 1, 1, 1,
1.230125, -0.3265313, 2.129104, 1, 1, 1, 1, 1,
1.232517, 0.3314869, 1.184167, 0, 0, 1, 1, 1,
1.233858, -1.697488, 2.596632, 1, 0, 0, 1, 1,
1.236015, -1.010816, 1.313401, 1, 0, 0, 1, 1,
1.236684, -0.6834366, 2.077346, 1, 0, 0, 1, 1,
1.239322, 0.04686699, 1.628541, 1, 0, 0, 1, 1,
1.243547, 1.651488, 2.02639, 1, 0, 0, 1, 1,
1.243876, -0.4157876, 2.426575, 0, 0, 0, 1, 1,
1.254626, 0.7896821, -0.3803256, 0, 0, 0, 1, 1,
1.258528, 0.2591821, 2.478615, 0, 0, 0, 1, 1,
1.259168, 0.3510735, 1.376467, 0, 0, 0, 1, 1,
1.265201, 0.2831209, 1.859034, 0, 0, 0, 1, 1,
1.275372, 0.1776976, -0.2927, 0, 0, 0, 1, 1,
1.28342, 1.323631, -0.0496413, 0, 0, 0, 1, 1,
1.284987, -0.8594161, 0.645771, 1, 1, 1, 1, 1,
1.292352, -0.5883552, 3.333978, 1, 1, 1, 1, 1,
1.295186, 1.796842, 1.194396, 1, 1, 1, 1, 1,
1.305036, -2.030238, 4.067129, 1, 1, 1, 1, 1,
1.313153, 1.921758, 1.241062, 1, 1, 1, 1, 1,
1.352827, -0.6068125, 1.978122, 1, 1, 1, 1, 1,
1.353047, -0.0150413, 1.963921, 1, 1, 1, 1, 1,
1.353445, -0.1708531, 0.7280858, 1, 1, 1, 1, 1,
1.353804, 2.245757, -0.6307011, 1, 1, 1, 1, 1,
1.359198, -1.186504, 2.419866, 1, 1, 1, 1, 1,
1.368364, 1.168243, -0.08513144, 1, 1, 1, 1, 1,
1.369462, 2.211153, 1.066905, 1, 1, 1, 1, 1,
1.374994, 1.225596, 0.7946156, 1, 1, 1, 1, 1,
1.376763, -0.5373603, 2.328541, 1, 1, 1, 1, 1,
1.390622, 0.3051361, 3.198718, 1, 1, 1, 1, 1,
1.395433, -1.324406, 0.9344302, 0, 0, 1, 1, 1,
1.397065, 0.9178919, 1.000276, 1, 0, 0, 1, 1,
1.415424, -0.6189108, 1.827929, 1, 0, 0, 1, 1,
1.42237, -1.75419, 1.831526, 1, 0, 0, 1, 1,
1.42596, -0.06379513, 0.6278771, 1, 0, 0, 1, 1,
1.430752, -0.1280252, 3.213898, 1, 0, 0, 1, 1,
1.432145, -0.07574148, 0.1598584, 0, 0, 0, 1, 1,
1.452941, -2.122563, 0.6179423, 0, 0, 0, 1, 1,
1.463058, 1.015272, 0.4528785, 0, 0, 0, 1, 1,
1.46564, 0.7402235, 2.732098, 0, 0, 0, 1, 1,
1.476553, 1.197009, 2.152346, 0, 0, 0, 1, 1,
1.48386, 2.307304, 0.5872177, 0, 0, 0, 1, 1,
1.48972, -0.3647423, 1.65538, 0, 0, 0, 1, 1,
1.491716, 0.1392816, 1.02844, 1, 1, 1, 1, 1,
1.505891, 1.373907, 1.2697, 1, 1, 1, 1, 1,
1.506334, -1.379959, 0.2550831, 1, 1, 1, 1, 1,
1.507168, 0.2725718, 1.099142, 1, 1, 1, 1, 1,
1.507189, -0.5721347, 1.660892, 1, 1, 1, 1, 1,
1.535353, -1.870717, 2.819008, 1, 1, 1, 1, 1,
1.565387, 0.3910808, 0.3579989, 1, 1, 1, 1, 1,
1.588972, -0.9164747, 2.675466, 1, 1, 1, 1, 1,
1.589278, 0.164489, 1.751513, 1, 1, 1, 1, 1,
1.589978, -0.7229571, 0.5952712, 1, 1, 1, 1, 1,
1.597653, -1.462991, 2.237162, 1, 1, 1, 1, 1,
1.618003, 0.2594442, 1.192586, 1, 1, 1, 1, 1,
1.629639, -1.047228, 2.596895, 1, 1, 1, 1, 1,
1.644461, -0.6195136, 3.194623, 1, 1, 1, 1, 1,
1.664517, -0.1527452, 2.288779, 1, 1, 1, 1, 1,
1.670522, 0.04267215, 1.229958, 0, 0, 1, 1, 1,
1.680763, -1.116636, 3.538239, 1, 0, 0, 1, 1,
1.695972, -0.2669163, 1.413829, 1, 0, 0, 1, 1,
1.707011, -0.3555796, 1.488866, 1, 0, 0, 1, 1,
1.709577, -1.76576, 2.505331, 1, 0, 0, 1, 1,
1.710936, 0.4624875, 4.245004, 1, 0, 0, 1, 1,
1.715735, -1.143438, -0.04043585, 0, 0, 0, 1, 1,
1.722551, -0.07819314, 3.901508, 0, 0, 0, 1, 1,
1.734787, 0.02553876, 1.036596, 0, 0, 0, 1, 1,
1.749269, -1.114759, 1.66264, 0, 0, 0, 1, 1,
1.755066, 0.5118421, 0.3825586, 0, 0, 0, 1, 1,
1.783813, -0.6208451, 1.527858, 0, 0, 0, 1, 1,
1.783992, 0.6772981, 1.118065, 0, 0, 0, 1, 1,
1.795009, 2.105624, -1.443268, 1, 1, 1, 1, 1,
1.798415, 0.5615016, 2.699062, 1, 1, 1, 1, 1,
1.801337, 0.7804814, 0.8592244, 1, 1, 1, 1, 1,
1.803333, 0.4770562, 2.065624, 1, 1, 1, 1, 1,
1.81676, -0.3842353, 1.858804, 1, 1, 1, 1, 1,
1.825354, -1.699257, 2.202304, 1, 1, 1, 1, 1,
1.826175, 1.358719, 1.408435, 1, 1, 1, 1, 1,
1.827338, 2.181525, 1.226558, 1, 1, 1, 1, 1,
1.870704, -0.4720519, 2.740727, 1, 1, 1, 1, 1,
1.932864, -0.0908428, 0.7112518, 1, 1, 1, 1, 1,
1.966259, -1.036762, 2.956923, 1, 1, 1, 1, 1,
1.976561, 0.0352272, 0.02421812, 1, 1, 1, 1, 1,
1.988156, 0.3288892, 0.5748067, 1, 1, 1, 1, 1,
2.002743, 0.4494791, 1.702281, 1, 1, 1, 1, 1,
2.029222, -0.6986408, 3.352205, 1, 1, 1, 1, 1,
2.046099, -0.9333751, 1.839426, 0, 0, 1, 1, 1,
2.073535, 0.1584731, 1.399003, 1, 0, 0, 1, 1,
2.107827, -0.6346939, 1.733246, 1, 0, 0, 1, 1,
2.127823, 0.9146774, 1.53427, 1, 0, 0, 1, 1,
2.141708, 0.6783217, 3.008554, 1, 0, 0, 1, 1,
2.152268, 1.237213, 1.430656, 1, 0, 0, 1, 1,
2.155136, -0.3383527, 2.633806, 0, 0, 0, 1, 1,
2.17034, -0.6860248, 1.846036, 0, 0, 0, 1, 1,
2.222647, -0.7744481, 1.179908, 0, 0, 0, 1, 1,
2.253062, -1.129375, 2.559541, 0, 0, 0, 1, 1,
2.290946, -0.9001564, 1.975538, 0, 0, 0, 1, 1,
2.383795, 0.1717073, 1.760494, 0, 0, 0, 1, 1,
2.409059, 0.3285764, -0.3539637, 0, 0, 0, 1, 1,
2.468394, 1.641154, -0.4379089, 1, 1, 1, 1, 1,
2.522184, -0.4774387, 1.03333, 1, 1, 1, 1, 1,
2.535963, -0.6539862, 2.057565, 1, 1, 1, 1, 1,
2.545968, -0.4273986, 1.557253, 1, 1, 1, 1, 1,
2.564279, -2.209947, 2.346891, 1, 1, 1, 1, 1,
2.753405, -0.3769785, 1.963367, 1, 1, 1, 1, 1,
3.182393, -0.7422258, 1.93589, 1, 1, 1, 1, 1
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
var radius = 9.462914;
var distance = 33.23808;
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
mvMatrix.translate( 0.2795358, -0.05972719, -0.2857611 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.23808);
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
