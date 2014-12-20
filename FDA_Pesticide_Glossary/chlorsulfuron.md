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
-2.626916, -0.509867, -2.614334, 1, 0, 0, 1,
-2.575112, 0.5490093, -0.7351882, 1, 0.007843138, 0, 1,
-2.505338, -0.9296627, -3.928551, 1, 0.01176471, 0, 1,
-2.484751, -0.1187166, -1.247591, 1, 0.01960784, 0, 1,
-2.433374, 0.1393263, -1.973112, 1, 0.02352941, 0, 1,
-2.386424, 0.7741811, -1.49488, 1, 0.03137255, 0, 1,
-2.363536, -2.124141, -1.938642, 1, 0.03529412, 0, 1,
-2.300099, -1.614789, -2.057844, 1, 0.04313726, 0, 1,
-2.294175, -1.234869, -4.03485, 1, 0.04705882, 0, 1,
-2.245516, -2.372895, -1.492096, 1, 0.05490196, 0, 1,
-2.226882, 0.2237018, -3.49614, 1, 0.05882353, 0, 1,
-2.208342, 0.2827908, -2.91035, 1, 0.06666667, 0, 1,
-2.177653, -1.311352, -2.528396, 1, 0.07058824, 0, 1,
-2.142595, 1.734943, -2.165858, 1, 0.07843138, 0, 1,
-2.135979, -0.8135788, -1.876009, 1, 0.08235294, 0, 1,
-2.127617, 0.9090461, -1.830731, 1, 0.09019608, 0, 1,
-2.100567, 0.7522954, -0.7199255, 1, 0.09411765, 0, 1,
-2.09909, -0.01835266, -2.9132, 1, 0.1019608, 0, 1,
-2.096296, -0.1214358, -0.9738711, 1, 0.1098039, 0, 1,
-2.053192, -0.6266699, -1.780494, 1, 0.1137255, 0, 1,
-2.044746, 1.177151, -1.950656, 1, 0.1215686, 0, 1,
-2.044058, -1.295761, -2.820026, 1, 0.1254902, 0, 1,
-2.032287, -0.1876236, -1.265252, 1, 0.1333333, 0, 1,
-2.023012, 1.834884, -1.644484, 1, 0.1372549, 0, 1,
-1.996387, -0.2044605, -0.6424069, 1, 0.145098, 0, 1,
-1.987544, -0.1632438, -0.7420464, 1, 0.1490196, 0, 1,
-1.978815, 0.8565166, -0.7396669, 1, 0.1568628, 0, 1,
-1.959688, 0.6244562, -1.843862, 1, 0.1607843, 0, 1,
-1.958154, -1.245947, -2.102471, 1, 0.1686275, 0, 1,
-1.955776, -0.6450203, -1.921115, 1, 0.172549, 0, 1,
-1.917119, -1.063246, -2.70266, 1, 0.1803922, 0, 1,
-1.910297, 0.05401583, -1.428284, 1, 0.1843137, 0, 1,
-1.891931, 0.1562852, -1.175457, 1, 0.1921569, 0, 1,
-1.886147, -1.854327, -3.753041, 1, 0.1960784, 0, 1,
-1.859455, 0.05354446, -1.882211, 1, 0.2039216, 0, 1,
-1.850591, -1.059572, -1.979939, 1, 0.2117647, 0, 1,
-1.850361, 0.4057724, -2.145039, 1, 0.2156863, 0, 1,
-1.833421, -0.6527354, -2.537232, 1, 0.2235294, 0, 1,
-1.821249, 1.123541, -0.6640885, 1, 0.227451, 0, 1,
-1.817383, 0.5705439, -2.014539, 1, 0.2352941, 0, 1,
-1.81266, -0.4265893, -3.788815, 1, 0.2392157, 0, 1,
-1.80347, 0.7103357, -0.04320303, 1, 0.2470588, 0, 1,
-1.732885, -0.9700786, -2.128264, 1, 0.2509804, 0, 1,
-1.730327, -0.5180344, -0.05365, 1, 0.2588235, 0, 1,
-1.708823, 0.9439656, -2.991949, 1, 0.2627451, 0, 1,
-1.703359, -0.08387667, -3.371248, 1, 0.2705882, 0, 1,
-1.70151, 0.1650494, -1.8354, 1, 0.2745098, 0, 1,
-1.678705, -1.096017, -3.175176, 1, 0.282353, 0, 1,
-1.676582, 0.2154959, -0.5858126, 1, 0.2862745, 0, 1,
-1.656532, 0.4775426, -0.478271, 1, 0.2941177, 0, 1,
-1.65631, -1.231477, -1.0341, 1, 0.3019608, 0, 1,
-1.646061, -0.09641602, -2.511507, 1, 0.3058824, 0, 1,
-1.629497, 0.9100484, 2.529461, 1, 0.3137255, 0, 1,
-1.624736, -0.05341564, -2.051446, 1, 0.3176471, 0, 1,
-1.623076, -2.302852, -2.296036, 1, 0.3254902, 0, 1,
-1.61145, 1.079399, -1.6069, 1, 0.3294118, 0, 1,
-1.589616, -2.377827, -2.94557, 1, 0.3372549, 0, 1,
-1.587341, 1.228796, -1.908308, 1, 0.3411765, 0, 1,
-1.58134, 0.1984839, -2.756032, 1, 0.3490196, 0, 1,
-1.579496, 0.7899589, -0.7455393, 1, 0.3529412, 0, 1,
-1.577236, 0.8515158, -0.1138628, 1, 0.3607843, 0, 1,
-1.571661, 0.3448694, -0.4264857, 1, 0.3647059, 0, 1,
-1.564846, 1.385699, -2.13475, 1, 0.372549, 0, 1,
-1.558288, 0.111761, -2.577035, 1, 0.3764706, 0, 1,
-1.552151, -0.4694192, -1.129506, 1, 0.3843137, 0, 1,
-1.550031, 0.912165, -1.256425, 1, 0.3882353, 0, 1,
-1.533387, -2.503013, -2.896403, 1, 0.3960784, 0, 1,
-1.502892, 1.019086, 0.3015858, 1, 0.4039216, 0, 1,
-1.476753, 0.5138296, -0.5216651, 1, 0.4078431, 0, 1,
-1.472262, 0.001661936, -1.452477, 1, 0.4156863, 0, 1,
-1.468118, -0.1545778, -0.7020296, 1, 0.4196078, 0, 1,
-1.461527, -1.442485, -2.311281, 1, 0.427451, 0, 1,
-1.45829, -0.6029836, -1.272118, 1, 0.4313726, 0, 1,
-1.450813, 1.665436, 0.4486474, 1, 0.4392157, 0, 1,
-1.443289, 1.367198, -2.482443, 1, 0.4431373, 0, 1,
-1.44184, -0.3119049, -1.310605, 1, 0.4509804, 0, 1,
-1.434266, 0.3076485, -1.950283, 1, 0.454902, 0, 1,
-1.420487, -0.1896183, -0.2847134, 1, 0.4627451, 0, 1,
-1.409582, -0.5610005, -2.044397, 1, 0.4666667, 0, 1,
-1.396528, -0.3434492, -1.034053, 1, 0.4745098, 0, 1,
-1.385973, -0.8175993, -1.129266, 1, 0.4784314, 0, 1,
-1.385897, -0.9775445, -2.501792, 1, 0.4862745, 0, 1,
-1.384064, 0.5458394, -0.4647291, 1, 0.4901961, 0, 1,
-1.378432, -0.04473869, -0.5755848, 1, 0.4980392, 0, 1,
-1.373975, -0.9142327, -2.011683, 1, 0.5058824, 0, 1,
-1.369266, -0.6664051, -1.162436, 1, 0.509804, 0, 1,
-1.367097, 0.3424315, -1.660242, 1, 0.5176471, 0, 1,
-1.366855, 0.09491877, -1.74309, 1, 0.5215687, 0, 1,
-1.364472, 1.932117, -0.6094152, 1, 0.5294118, 0, 1,
-1.355754, 1.998627, -1.148494, 1, 0.5333334, 0, 1,
-1.354098, 0.9464757, -0.8874874, 1, 0.5411765, 0, 1,
-1.341656, -0.4550241, -0.8512446, 1, 0.5450981, 0, 1,
-1.333843, 0.5412857, -1.595962, 1, 0.5529412, 0, 1,
-1.3252, -0.2303293, -2.817394, 1, 0.5568628, 0, 1,
-1.315208, 1.062584, -1.166039, 1, 0.5647059, 0, 1,
-1.311748, -0.02059176, -0.6960298, 1, 0.5686275, 0, 1,
-1.305632, 2.422285, 0.1478197, 1, 0.5764706, 0, 1,
-1.29783, 0.5884406, -1.154542, 1, 0.5803922, 0, 1,
-1.297269, -0.7614221, -2.49186, 1, 0.5882353, 0, 1,
-1.292913, -1.311166, -3.365084, 1, 0.5921569, 0, 1,
-1.292716, 0.137725, -3.101379, 1, 0.6, 0, 1,
-1.29229, -0.09082199, -1.334896, 1, 0.6078432, 0, 1,
-1.290813, 1.431519, -0.3471966, 1, 0.6117647, 0, 1,
-1.285741, 1.221181, -1.238322, 1, 0.6196079, 0, 1,
-1.273579, -0.3721256, -3.660151, 1, 0.6235294, 0, 1,
-1.272726, 0.1389704, -0.537533, 1, 0.6313726, 0, 1,
-1.270264, -1.119832, -2.153715, 1, 0.6352941, 0, 1,
-1.268745, -0.2120425, -1.047379, 1, 0.6431373, 0, 1,
-1.26171, -0.9463475, -3.139243, 1, 0.6470588, 0, 1,
-1.260922, 0.5774307, -2.587487, 1, 0.654902, 0, 1,
-1.250701, 2.20476, 1.418073, 1, 0.6588235, 0, 1,
-1.249155, -0.9609666, -3.414377, 1, 0.6666667, 0, 1,
-1.245011, -0.692315, -2.489483, 1, 0.6705883, 0, 1,
-1.233495, -0.3766984, -1.988511, 1, 0.6784314, 0, 1,
-1.233144, -0.7393193, -2.645313, 1, 0.682353, 0, 1,
-1.23008, -0.3709841, -0.7990426, 1, 0.6901961, 0, 1,
-1.222056, 1.172012, -0.5829359, 1, 0.6941177, 0, 1,
-1.22157, -0.526161, 0.1704965, 1, 0.7019608, 0, 1,
-1.198699, 1.56928, 1.875292, 1, 0.7098039, 0, 1,
-1.183782, 0.5641796, -0.4400229, 1, 0.7137255, 0, 1,
-1.180627, -1.839022, -0.9664692, 1, 0.7215686, 0, 1,
-1.17944, 0.8440031, -1.675779, 1, 0.7254902, 0, 1,
-1.175323, -0.9581639, -3.676547, 1, 0.7333333, 0, 1,
-1.168433, -2.064949, -1.530605, 1, 0.7372549, 0, 1,
-1.167132, -0.7142676, -4.897681, 1, 0.7450981, 0, 1,
-1.166407, 1.672458, -1.179294, 1, 0.7490196, 0, 1,
-1.161823, -0.3454837, -1.055689, 1, 0.7568628, 0, 1,
-1.1608, -0.4067433, -1.493176, 1, 0.7607843, 0, 1,
-1.159917, 0.2801102, -0.2968606, 1, 0.7686275, 0, 1,
-1.158044, 0.1262814, -0.7571082, 1, 0.772549, 0, 1,
-1.137178, 0.630584, -1.050223, 1, 0.7803922, 0, 1,
-1.131906, -1.358053, -2.595944, 1, 0.7843137, 0, 1,
-1.131444, 0.2934726, -1.118959, 1, 0.7921569, 0, 1,
-1.120438, -2.347547, -2.366178, 1, 0.7960784, 0, 1,
-1.118413, 0.2260615, -1.440229, 1, 0.8039216, 0, 1,
-1.104008, -0.3052144, -0.9031885, 1, 0.8117647, 0, 1,
-1.099684, -2.611269, -2.701504, 1, 0.8156863, 0, 1,
-1.097618, -0.1982816, -3.404135, 1, 0.8235294, 0, 1,
-1.093765, -0.02675109, 0.01804776, 1, 0.827451, 0, 1,
-1.087018, -1.428462, -1.136475, 1, 0.8352941, 0, 1,
-1.081612, 1.857729, 0.2666893, 1, 0.8392157, 0, 1,
-1.081085, -0.06181037, -3.759614, 1, 0.8470588, 0, 1,
-1.075248, 0.5350862, -2.009772, 1, 0.8509804, 0, 1,
-1.074275, 0.778289, -3.309708, 1, 0.8588235, 0, 1,
-1.063724, 0.7435612, -1.031874, 1, 0.8627451, 0, 1,
-1.055808, 0.3547811, -1.291194, 1, 0.8705882, 0, 1,
-1.051085, -0.1457647, -2.419992, 1, 0.8745098, 0, 1,
-1.049588, 2.017958, -0.9219826, 1, 0.8823529, 0, 1,
-1.040956, -0.1248386, -1.534244, 1, 0.8862745, 0, 1,
-1.037378, -1.270531, -2.821955, 1, 0.8941177, 0, 1,
-1.034925, -0.1703774, -2.001993, 1, 0.8980392, 0, 1,
-1.031117, -0.8532113, -2.040733, 1, 0.9058824, 0, 1,
-1.024986, -0.003975638, -1.387172, 1, 0.9137255, 0, 1,
-1.020289, 0.1692493, 1.235144, 1, 0.9176471, 0, 1,
-1.020057, -0.1121157, -1.131267, 1, 0.9254902, 0, 1,
-1.014845, 0.9690799, 0.1581227, 1, 0.9294118, 0, 1,
-1.003226, 0.3407301, -2.534032, 1, 0.9372549, 0, 1,
-0.9957626, -1.383439, -2.380034, 1, 0.9411765, 0, 1,
-0.9952194, -0.6176974, -2.644985, 1, 0.9490196, 0, 1,
-0.9949908, -1.604793, -1.394637, 1, 0.9529412, 0, 1,
-0.9947135, -0.8641174, -4.073901, 1, 0.9607843, 0, 1,
-0.9836785, -0.9237069, -2.918074, 1, 0.9647059, 0, 1,
-0.9820216, -0.3031428, -1.041696, 1, 0.972549, 0, 1,
-0.9812585, -0.2338936, -1.413427, 1, 0.9764706, 0, 1,
-0.980775, 0.5234113, -1.795962, 1, 0.9843137, 0, 1,
-0.9767164, 0.1134662, -1.494626, 1, 0.9882353, 0, 1,
-0.9766496, -0.2966122, -1.889977, 1, 0.9960784, 0, 1,
-0.9755335, 0.1464608, -0.4170283, 0.9960784, 1, 0, 1,
-0.9755142, -1.571995, -2.654291, 0.9921569, 1, 0, 1,
-0.9752559, -0.5417066, -1.663711, 0.9843137, 1, 0, 1,
-0.9727473, -1.833237, -2.980018, 0.9803922, 1, 0, 1,
-0.968291, 0.5921994, -0.3826858, 0.972549, 1, 0, 1,
-0.9554976, 0.4452032, -2.202497, 0.9686275, 1, 0, 1,
-0.954883, -0.4409119, -2.399498, 0.9607843, 1, 0, 1,
-0.9499087, 0.5303893, -1.260864, 0.9568627, 1, 0, 1,
-0.9474068, -0.5512229, -2.814403, 0.9490196, 1, 0, 1,
-0.9469026, -0.2598764, 0.6622955, 0.945098, 1, 0, 1,
-0.9441144, 0.7267943, -1.856435, 0.9372549, 1, 0, 1,
-0.9440799, -0.3928535, -2.213274, 0.9333333, 1, 0, 1,
-0.9411985, -1.089701, -2.275214, 0.9254902, 1, 0, 1,
-0.9374325, -0.9527333, -3.176277, 0.9215686, 1, 0, 1,
-0.9313633, 2.635347, -0.7176614, 0.9137255, 1, 0, 1,
-0.9276167, -0.5712031, -2.888103, 0.9098039, 1, 0, 1,
-0.9247559, -1.62876, -2.751777, 0.9019608, 1, 0, 1,
-0.9200447, -0.2267504, -1.098518, 0.8941177, 1, 0, 1,
-0.9152138, 1.716649, -1.574602, 0.8901961, 1, 0, 1,
-0.9127727, -0.09141063, -0.7156929, 0.8823529, 1, 0, 1,
-0.9093812, -1.802091, -3.491129, 0.8784314, 1, 0, 1,
-0.9039063, 0.6526787, -3.195799, 0.8705882, 1, 0, 1,
-0.903574, -1.585431, -3.176078, 0.8666667, 1, 0, 1,
-0.9016256, 0.3491691, -1.556736, 0.8588235, 1, 0, 1,
-0.9010556, -0.8555219, -1.373152, 0.854902, 1, 0, 1,
-0.8989322, -1.783649, -0.950586, 0.8470588, 1, 0, 1,
-0.8970953, -1.301125, -2.096842, 0.8431373, 1, 0, 1,
-0.8944791, 2.098712, -1.662225, 0.8352941, 1, 0, 1,
-0.8896993, 0.06720147, -1.283268, 0.8313726, 1, 0, 1,
-0.8884484, 0.6411734, -3.131174, 0.8235294, 1, 0, 1,
-0.8866555, 0.7522575, -1.698547, 0.8196079, 1, 0, 1,
-0.8862118, -0.5496334, -1.000446, 0.8117647, 1, 0, 1,
-0.8844667, 1.198433, 0.9921157, 0.8078431, 1, 0, 1,
-0.8843326, 0.9818892, -1.786379, 0.8, 1, 0, 1,
-0.8833302, 1.103547, -1.357202, 0.7921569, 1, 0, 1,
-0.8822277, -0.4212022, -2.896935, 0.7882353, 1, 0, 1,
-0.8812001, -0.9418339, -2.272869, 0.7803922, 1, 0, 1,
-0.8746105, 0.02477372, -1.398732, 0.7764706, 1, 0, 1,
-0.8722079, -1.138333, -2.085086, 0.7686275, 1, 0, 1,
-0.8701403, -1.607594, -2.974714, 0.7647059, 1, 0, 1,
-0.8633449, -1.736678, -3.147939, 0.7568628, 1, 0, 1,
-0.857274, 2.329504, -0.2790656, 0.7529412, 1, 0, 1,
-0.8569543, 0.3111094, -2.515254, 0.7450981, 1, 0, 1,
-0.8504645, -0.3330394, -2.845806, 0.7411765, 1, 0, 1,
-0.8451675, 0.1727753, -0.004368335, 0.7333333, 1, 0, 1,
-0.8346002, 0.8000773, -0.1990738, 0.7294118, 1, 0, 1,
-0.8289711, -0.2823711, -1.1301, 0.7215686, 1, 0, 1,
-0.8266271, 0.9642205, -1.795224, 0.7176471, 1, 0, 1,
-0.8246336, -0.219196, -0.9170339, 0.7098039, 1, 0, 1,
-0.8241717, 1.237314, -0.4929201, 0.7058824, 1, 0, 1,
-0.8240453, 2.399276, -1.157176, 0.6980392, 1, 0, 1,
-0.8238327, -0.113596, -2.08333, 0.6901961, 1, 0, 1,
-0.8223721, -0.2586412, -3.631713, 0.6862745, 1, 0, 1,
-0.8133521, -0.8271822, -0.6895254, 0.6784314, 1, 0, 1,
-0.809278, 2.521282, -1.682074, 0.6745098, 1, 0, 1,
-0.8048187, -1.151262, -2.126286, 0.6666667, 1, 0, 1,
-0.8009394, 2.027389, -0.4797857, 0.6627451, 1, 0, 1,
-0.7979115, 1.356851, -1.7685, 0.654902, 1, 0, 1,
-0.7966452, -2.20213, -1.345976, 0.6509804, 1, 0, 1,
-0.7938135, -0.0735561, -0.4975808, 0.6431373, 1, 0, 1,
-0.7913822, 1.211171, -1.824897, 0.6392157, 1, 0, 1,
-0.789749, 0.6306143, 1.079834, 0.6313726, 1, 0, 1,
-0.788331, -1.117047, -4.017438, 0.627451, 1, 0, 1,
-0.7868589, 0.7293555, 0.2620439, 0.6196079, 1, 0, 1,
-0.7803438, 0.2709603, -3.337949, 0.6156863, 1, 0, 1,
-0.7687856, -0.1516324, -0.9041679, 0.6078432, 1, 0, 1,
-0.768428, -0.3811355, -1.358022, 0.6039216, 1, 0, 1,
-0.7643934, 0.5629594, -0.9075689, 0.5960785, 1, 0, 1,
-0.7639819, -0.5320449, -3.030491, 0.5882353, 1, 0, 1,
-0.7629982, 0.80842, -0.5219424, 0.5843138, 1, 0, 1,
-0.7576711, -0.07250078, -2.065578, 0.5764706, 1, 0, 1,
-0.7560764, 1.398336, -0.9408026, 0.572549, 1, 0, 1,
-0.7560076, 0.8634418, -0.942345, 0.5647059, 1, 0, 1,
-0.7550152, 0.5434134, -1.600437, 0.5607843, 1, 0, 1,
-0.751657, 0.7293376, -1.421052, 0.5529412, 1, 0, 1,
-0.7492965, 0.1998971, -0.9459726, 0.5490196, 1, 0, 1,
-0.7485085, -0.8701798, -1.381894, 0.5411765, 1, 0, 1,
-0.7484697, -0.4955485, -3.395519, 0.5372549, 1, 0, 1,
-0.7480519, -0.09169654, -1.699683, 0.5294118, 1, 0, 1,
-0.7439661, 0.4005928, -1.835838, 0.5254902, 1, 0, 1,
-0.7385224, -2.081938, -2.719247, 0.5176471, 1, 0, 1,
-0.7358134, -0.6167831, -2.761279, 0.5137255, 1, 0, 1,
-0.7172215, -0.3124669, -1.566729, 0.5058824, 1, 0, 1,
-0.7140943, -1.053306, -2.737234, 0.5019608, 1, 0, 1,
-0.713442, -0.03533132, -0.9972116, 0.4941176, 1, 0, 1,
-0.7113584, -0.5548834, -1.72649, 0.4862745, 1, 0, 1,
-0.7083976, 1.717453, -0.2172225, 0.4823529, 1, 0, 1,
-0.6939875, 0.3132786, -2.015017, 0.4745098, 1, 0, 1,
-0.6895316, -0.7450731, -2.044696, 0.4705882, 1, 0, 1,
-0.6878201, 0.8845102, 0.2732958, 0.4627451, 1, 0, 1,
-0.6867684, -0.6650681, -2.868973, 0.4588235, 1, 0, 1,
-0.6810058, 1.437165, -1.63489, 0.4509804, 1, 0, 1,
-0.6773594, 1.608124, -0.3926269, 0.4470588, 1, 0, 1,
-0.6756392, 1.164769, -2.464837, 0.4392157, 1, 0, 1,
-0.6733343, 0.1144056, -1.435358, 0.4352941, 1, 0, 1,
-0.671289, 0.702069, 0.2054649, 0.427451, 1, 0, 1,
-0.6705238, 1.546059, -0.2547047, 0.4235294, 1, 0, 1,
-0.6702207, -0.9901119, -2.054174, 0.4156863, 1, 0, 1,
-0.6661363, 0.3662611, -1.582852, 0.4117647, 1, 0, 1,
-0.6649025, -0.05490481, -0.05673493, 0.4039216, 1, 0, 1,
-0.664427, 0.1506139, -3.048826, 0.3960784, 1, 0, 1,
-0.6600894, -0.9022954, -2.975219, 0.3921569, 1, 0, 1,
-0.6545236, 1.083962, -0.7683926, 0.3843137, 1, 0, 1,
-0.6529912, 0.4910292, -1.505687, 0.3803922, 1, 0, 1,
-0.6455147, 1.569826, -1.335608, 0.372549, 1, 0, 1,
-0.6410015, 0.7936, 0.3086836, 0.3686275, 1, 0, 1,
-0.6355026, 0.2765401, -0.9012467, 0.3607843, 1, 0, 1,
-0.6282942, 0.1624885, 0.3499136, 0.3568628, 1, 0, 1,
-0.6281078, 1.292485, -2.136951, 0.3490196, 1, 0, 1,
-0.6278929, 1.271854, 0.2360502, 0.345098, 1, 0, 1,
-0.6267682, 0.09956554, -0.7858061, 0.3372549, 1, 0, 1,
-0.6256207, 0.5661723, -1.867207, 0.3333333, 1, 0, 1,
-0.6231512, 0.440802, -1.354576, 0.3254902, 1, 0, 1,
-0.6229722, -0.5380142, -0.2006224, 0.3215686, 1, 0, 1,
-0.6225125, 0.006899506, -0.3263873, 0.3137255, 1, 0, 1,
-0.621471, -0.3576542, -1.676473, 0.3098039, 1, 0, 1,
-0.6046596, 0.2399686, 0.9623731, 0.3019608, 1, 0, 1,
-0.6041162, 0.292369, -2.859188, 0.2941177, 1, 0, 1,
-0.6035589, 0.5057934, -0.6730229, 0.2901961, 1, 0, 1,
-0.6022193, 0.1381547, 0.05750985, 0.282353, 1, 0, 1,
-0.600048, -0.9851395, -3.029688, 0.2784314, 1, 0, 1,
-0.5982877, 0.09092751, -3.342374, 0.2705882, 1, 0, 1,
-0.5979486, 1.143731, -1.840108, 0.2666667, 1, 0, 1,
-0.5974739, 1.451235, -0.09079962, 0.2588235, 1, 0, 1,
-0.5959147, -1.482769, -3.664845, 0.254902, 1, 0, 1,
-0.5758125, 0.06701308, -2.344297, 0.2470588, 1, 0, 1,
-0.5669919, -1.326387, -0.8584308, 0.2431373, 1, 0, 1,
-0.5660509, -0.7341082, -1.181646, 0.2352941, 1, 0, 1,
-0.563603, 1.917287, 0.2221895, 0.2313726, 1, 0, 1,
-0.5593443, 1.390963, -0.7963277, 0.2235294, 1, 0, 1,
-0.5528527, 2.191442, -0.0004474577, 0.2196078, 1, 0, 1,
-0.5478064, -2.085217, -1.780648, 0.2117647, 1, 0, 1,
-0.5345113, 0.3022222, 1.267036, 0.2078431, 1, 0, 1,
-0.5339437, -0.1242725, -1.201916, 0.2, 1, 0, 1,
-0.5292274, 0.2298774, -2.285608, 0.1921569, 1, 0, 1,
-0.5258431, -0.1701702, -1.705487, 0.1882353, 1, 0, 1,
-0.5255674, 0.5992916, -1.51745, 0.1803922, 1, 0, 1,
-0.5215273, -0.7137725, -2.954131, 0.1764706, 1, 0, 1,
-0.5188699, 0.8657136, -0.9517177, 0.1686275, 1, 0, 1,
-0.515631, -1.556722, -4.491176, 0.1647059, 1, 0, 1,
-0.5123764, -0.3408829, -3.820981, 0.1568628, 1, 0, 1,
-0.5050725, -0.9701385, -2.520843, 0.1529412, 1, 0, 1,
-0.5043384, -0.232132, -0.9163526, 0.145098, 1, 0, 1,
-0.5011872, -0.7478566, -3.810536, 0.1411765, 1, 0, 1,
-0.4946751, 1.486382, -0.6555262, 0.1333333, 1, 0, 1,
-0.4942605, -2.823414, -2.618391, 0.1294118, 1, 0, 1,
-0.4904942, -0.9994097, -3.163872, 0.1215686, 1, 0, 1,
-0.4892734, 0.06994616, -1.513632, 0.1176471, 1, 0, 1,
-0.4878213, 0.768724, 0.7173362, 0.1098039, 1, 0, 1,
-0.4872393, 0.07011303, -2.03441, 0.1058824, 1, 0, 1,
-0.4866319, 0.7548618, -1.654617, 0.09803922, 1, 0, 1,
-0.4859809, -1.034407, -2.359259, 0.09019608, 1, 0, 1,
-0.4824357, -0.9797345, -3.597783, 0.08627451, 1, 0, 1,
-0.4789585, 0.5274853, -1.366287, 0.07843138, 1, 0, 1,
-0.4781889, -1.17259, -2.237284, 0.07450981, 1, 0, 1,
-0.4768186, 1.043422, -0.1586448, 0.06666667, 1, 0, 1,
-0.4754216, 1.198374, -0.0858359, 0.0627451, 1, 0, 1,
-0.4740871, 1.499794, 1.682009, 0.05490196, 1, 0, 1,
-0.4668303, 0.4904981, -1.186017, 0.05098039, 1, 0, 1,
-0.4667308, -0.6286426, -3.395548, 0.04313726, 1, 0, 1,
-0.4636031, -0.9505457, -4.182604, 0.03921569, 1, 0, 1,
-0.4602367, -1.083197, -4.379913, 0.03137255, 1, 0, 1,
-0.4592066, 0.8907735, -1.755674, 0.02745098, 1, 0, 1,
-0.4526649, 0.2798464, 0.1748638, 0.01960784, 1, 0, 1,
-0.4522644, -0.7622286, -1.948734, 0.01568628, 1, 0, 1,
-0.451927, -0.1452783, -0.272086, 0.007843138, 1, 0, 1,
-0.4469476, 1.309643, -0.8605794, 0.003921569, 1, 0, 1,
-0.4460762, 0.39955, -1.354247, 0, 1, 0.003921569, 1,
-0.442472, -1.463115, -2.452184, 0, 1, 0.01176471, 1,
-0.4417216, -1.69041, -2.913345, 0, 1, 0.01568628, 1,
-0.4387275, -0.8485249, -2.098554, 0, 1, 0.02352941, 1,
-0.438536, -2.44875, -2.389898, 0, 1, 0.02745098, 1,
-0.4383626, -0.7042583, -1.953312, 0, 1, 0.03529412, 1,
-0.4331432, -1.679722, -2.584753, 0, 1, 0.03921569, 1,
-0.4318915, 1.094898, 0.2071669, 0, 1, 0.04705882, 1,
-0.4283756, 2.037353, -0.2957821, 0, 1, 0.05098039, 1,
-0.4281841, 0.2189179, 0.1718796, 0, 1, 0.05882353, 1,
-0.4268489, -0.2831573, -3.230313, 0, 1, 0.0627451, 1,
-0.4243771, -0.5494795, -2.047638, 0, 1, 0.07058824, 1,
-0.4242842, -0.2917311, -2.05282, 0, 1, 0.07450981, 1,
-0.4237444, 0.6567838, -0.4295506, 0, 1, 0.08235294, 1,
-0.4154702, -0.8028584, -1.566471, 0, 1, 0.08627451, 1,
-0.415171, 0.3127671, -2.633621, 0, 1, 0.09411765, 1,
-0.4112082, -0.8278455, -1.637195, 0, 1, 0.1019608, 1,
-0.4099187, 1.482526, -0.2081205, 0, 1, 0.1058824, 1,
-0.409772, -2.39364, -2.46464, 0, 1, 0.1137255, 1,
-0.4070494, 0.5715772, -0.7545246, 0, 1, 0.1176471, 1,
-0.4066016, 1.004398, -0.4677822, 0, 1, 0.1254902, 1,
-0.4013289, 1.766539, 0.04163788, 0, 1, 0.1294118, 1,
-0.400823, -0.101177, 0.2085405, 0, 1, 0.1372549, 1,
-0.3955168, -0.4365567, -0.8136945, 0, 1, 0.1411765, 1,
-0.3942887, -2.042152, -1.884999, 0, 1, 0.1490196, 1,
-0.3903983, -1.232055, -2.692276, 0, 1, 0.1529412, 1,
-0.3844878, 0.8746488, -0.6774969, 0, 1, 0.1607843, 1,
-0.3841053, -1.638854, -2.617085, 0, 1, 0.1647059, 1,
-0.3799584, -0.02414135, -1.374425, 0, 1, 0.172549, 1,
-0.3775533, -1.108661, -2.394893, 0, 1, 0.1764706, 1,
-0.3768816, 0.824517, 0.449667, 0, 1, 0.1843137, 1,
-0.376852, 0.307323, -2.305911, 0, 1, 0.1882353, 1,
-0.3766776, -0.7741125, -3.03549, 0, 1, 0.1960784, 1,
-0.3752274, 1.012954, -0.6920084, 0, 1, 0.2039216, 1,
-0.3685212, -0.03334814, -0.8016168, 0, 1, 0.2078431, 1,
-0.3679024, -1.014005, -2.865074, 0, 1, 0.2156863, 1,
-0.3656381, 0.4733255, -0.2024094, 0, 1, 0.2196078, 1,
-0.3572861, -0.6228007, -1.342516, 0, 1, 0.227451, 1,
-0.3532001, -0.1050297, -1.45482, 0, 1, 0.2313726, 1,
-0.3531322, -0.5050281, -2.030831, 0, 1, 0.2392157, 1,
-0.3487971, 1.00593, 0.3231257, 0, 1, 0.2431373, 1,
-0.3448561, 1.252485, 0.3846431, 0, 1, 0.2509804, 1,
-0.3422266, -0.7591242, -2.067906, 0, 1, 0.254902, 1,
-0.340618, 0.7290887, 0.1206907, 0, 1, 0.2627451, 1,
-0.3299917, -1.38386, -3.71409, 0, 1, 0.2666667, 1,
-0.3298718, 0.4736511, -1.3177, 0, 1, 0.2745098, 1,
-0.3298174, 1.015805, -2.329848, 0, 1, 0.2784314, 1,
-0.3293221, -1.112363, -1.714407, 0, 1, 0.2862745, 1,
-0.3290416, -0.1509959, -1.234835, 0, 1, 0.2901961, 1,
-0.3250709, 0.1818487, -1.404636, 0, 1, 0.2980392, 1,
-0.3103498, 0.1842594, -1.342847, 0, 1, 0.3058824, 1,
-0.3064681, 0.5971135, -1.100072, 0, 1, 0.3098039, 1,
-0.3042796, -0.6344214, -0.8890747, 0, 1, 0.3176471, 1,
-0.3020046, 1.458015, 0.7909341, 0, 1, 0.3215686, 1,
-0.3009828, -1.387236, -3.376491, 0, 1, 0.3294118, 1,
-0.2991966, 0.5842168, -1.556097, 0, 1, 0.3333333, 1,
-0.2991478, -0.3139336, -2.370994, 0, 1, 0.3411765, 1,
-0.2921492, -1.309553, -3.941087, 0, 1, 0.345098, 1,
-0.2889762, -0.8736672, -4.910081, 0, 1, 0.3529412, 1,
-0.2885133, -0.742096, -2.288767, 0, 1, 0.3568628, 1,
-0.2860214, -1.374371, -3.545562, 0, 1, 0.3647059, 1,
-0.2841499, 1.391228, 0.1620908, 0, 1, 0.3686275, 1,
-0.2825482, -0.685179, -3.40119, 0, 1, 0.3764706, 1,
-0.281698, -0.5540514, -2.288492, 0, 1, 0.3803922, 1,
-0.2816277, 0.4839819, -1.237931, 0, 1, 0.3882353, 1,
-0.2805057, 0.4138855, -1.246566, 0, 1, 0.3921569, 1,
-0.2803657, -0.1329832, -1.384238, 0, 1, 0.4, 1,
-0.2800032, -0.314801, -0.8652862, 0, 1, 0.4078431, 1,
-0.2744451, -1.066745, -3.729324, 0, 1, 0.4117647, 1,
-0.2715552, 1.083442, -1.174135, 0, 1, 0.4196078, 1,
-0.2678851, 0.8669529, -0.5310066, 0, 1, 0.4235294, 1,
-0.2670188, -1.694993, -3.426083, 0, 1, 0.4313726, 1,
-0.2639918, -0.7390236, -3.54715, 0, 1, 0.4352941, 1,
-0.263481, 1.124488, 0.2587074, 0, 1, 0.4431373, 1,
-0.2606947, 1.010832, -0.8003048, 0, 1, 0.4470588, 1,
-0.2575655, -0.556713, -1.870758, 0, 1, 0.454902, 1,
-0.2558016, 0.9323366, -2.05417, 0, 1, 0.4588235, 1,
-0.2458015, -0.9243495, -2.242349, 0, 1, 0.4666667, 1,
-0.2436768, -0.3310475, -2.490823, 0, 1, 0.4705882, 1,
-0.2406944, 1.172057, -0.4194873, 0, 1, 0.4784314, 1,
-0.2404617, 0.6436867, 0.2945436, 0, 1, 0.4823529, 1,
-0.2403216, 0.119046, -1.420733, 0, 1, 0.4901961, 1,
-0.2390756, 0.01036558, -1.591516, 0, 1, 0.4941176, 1,
-0.2380646, 1.316043, -2.407376, 0, 1, 0.5019608, 1,
-0.2370571, 0.1910471, -0.5383896, 0, 1, 0.509804, 1,
-0.2355838, -1.044774, -3.845253, 0, 1, 0.5137255, 1,
-0.2328592, -0.1858467, -1.700956, 0, 1, 0.5215687, 1,
-0.2320876, 1.743886, 1.111571, 0, 1, 0.5254902, 1,
-0.2320698, 0.4993785, -1.450693, 0, 1, 0.5333334, 1,
-0.226963, -0.3351539, -1.820479, 0, 1, 0.5372549, 1,
-0.2255139, 1.187671, -1.40854, 0, 1, 0.5450981, 1,
-0.2189342, -0.2497184, -3.343717, 0, 1, 0.5490196, 1,
-0.2183881, -2.042602, -4.365115, 0, 1, 0.5568628, 1,
-0.2086323, 1.18763, 0.7645981, 0, 1, 0.5607843, 1,
-0.2070132, 0.2784516, -1.613228, 0, 1, 0.5686275, 1,
-0.2038635, -0.6017429, -3.384586, 0, 1, 0.572549, 1,
-0.2023773, -0.7357936, -2.480225, 0, 1, 0.5803922, 1,
-0.1979261, 0.5517824, -1.971154, 0, 1, 0.5843138, 1,
-0.1976259, 0.2246836, -2.919398, 0, 1, 0.5921569, 1,
-0.1902019, 0.2336545, 0.2473983, 0, 1, 0.5960785, 1,
-0.1896391, -0.5086079, -3.343142, 0, 1, 0.6039216, 1,
-0.1842271, 1.615587, -0.7102447, 0, 1, 0.6117647, 1,
-0.1810257, -1.224317, -2.446292, 0, 1, 0.6156863, 1,
-0.1800892, -1.552961, -3.925013, 0, 1, 0.6235294, 1,
-0.1752251, 0.02937124, -2.504567, 0, 1, 0.627451, 1,
-0.1710786, -0.4344302, -2.692142, 0, 1, 0.6352941, 1,
-0.1685068, -0.7955491, -5.474355, 0, 1, 0.6392157, 1,
-0.1669392, -1.545263, -3.676684, 0, 1, 0.6470588, 1,
-0.163498, -0.2181247, -1.650254, 0, 1, 0.6509804, 1,
-0.1545423, 0.560861, 0.9363127, 0, 1, 0.6588235, 1,
-0.1498379, -0.4740011, -2.145859, 0, 1, 0.6627451, 1,
-0.1470894, -0.3382511, -4.176095, 0, 1, 0.6705883, 1,
-0.1436641, 0.4196348, 0.6452101, 0, 1, 0.6745098, 1,
-0.1434842, -0.1210447, -1.720652, 0, 1, 0.682353, 1,
-0.1409652, -0.6944364, -2.691334, 0, 1, 0.6862745, 1,
-0.1387877, 0.4134099, -1.555686, 0, 1, 0.6941177, 1,
-0.1373897, 0.5057487, -0.982271, 0, 1, 0.7019608, 1,
-0.1353085, -0.3584835, -4.362875, 0, 1, 0.7058824, 1,
-0.1351821, -0.3615796, -1.195703, 0, 1, 0.7137255, 1,
-0.1343219, -1.280333, -3.264967, 0, 1, 0.7176471, 1,
-0.1323206, 0.4654439, 1.751028, 0, 1, 0.7254902, 1,
-0.1316033, -1.630063, -2.415545, 0, 1, 0.7294118, 1,
-0.1304216, -0.5531778, -4.473912, 0, 1, 0.7372549, 1,
-0.127828, 0.6000972, -0.498207, 0, 1, 0.7411765, 1,
-0.1184062, 1.091706, -0.1979551, 0, 1, 0.7490196, 1,
-0.1176833, -0.01640468, -1.209344, 0, 1, 0.7529412, 1,
-0.1175232, 2.132135, -0.7898713, 0, 1, 0.7607843, 1,
-0.1166703, 0.3164546, -0.2705548, 0, 1, 0.7647059, 1,
-0.114902, -1.593949, -4.636619, 0, 1, 0.772549, 1,
-0.1123766, 0.1918587, -0.3843878, 0, 1, 0.7764706, 1,
-0.1058769, -1.005344, -3.561797, 0, 1, 0.7843137, 1,
-0.1027608, 2.059291, -0.4874304, 0, 1, 0.7882353, 1,
-0.09864915, 1.182295, 0.943221, 0, 1, 0.7960784, 1,
-0.09605443, -0.1185874, -1.708926, 0, 1, 0.8039216, 1,
-0.08738449, -0.9058865, -2.411985, 0, 1, 0.8078431, 1,
-0.0862321, 1.407042, -1.518532, 0, 1, 0.8156863, 1,
-0.08559164, 1.054007, 0.2417858, 0, 1, 0.8196079, 1,
-0.07938398, -0.2944421, -1.699855, 0, 1, 0.827451, 1,
-0.07781537, 0.6371835, 0.9898943, 0, 1, 0.8313726, 1,
-0.07673273, -0.6196007, -2.66286, 0, 1, 0.8392157, 1,
-0.07668675, 0.778668, -0.6093033, 0, 1, 0.8431373, 1,
-0.07322305, 0.3470677, 1.413578, 0, 1, 0.8509804, 1,
-0.07203367, -0.5691794, -1.721177, 0, 1, 0.854902, 1,
-0.0694451, -1.103593, -2.98682, 0, 1, 0.8627451, 1,
-0.06101803, -0.339011, -3.778669, 0, 1, 0.8666667, 1,
-0.05862433, -1.156105, -5.160223, 0, 1, 0.8745098, 1,
-0.05736068, -0.6668423, -2.900172, 0, 1, 0.8784314, 1,
-0.05559689, -1.349614, -3.850963, 0, 1, 0.8862745, 1,
-0.05368124, -0.1036894, -1.303543, 0, 1, 0.8901961, 1,
-0.05341292, -1.269688, -3.508961, 0, 1, 0.8980392, 1,
-0.04798163, -1.021007, -1.076625, 0, 1, 0.9058824, 1,
-0.04791452, -0.1972809, -2.336121, 0, 1, 0.9098039, 1,
-0.04504152, 0.07859969, -2.51448, 0, 1, 0.9176471, 1,
-0.04201663, 1.377087, 0.1149985, 0, 1, 0.9215686, 1,
-0.04089241, -0.5977851, -2.873745, 0, 1, 0.9294118, 1,
-0.03874419, 0.103442, 0.6622466, 0, 1, 0.9333333, 1,
-0.03597311, -0.3598795, -2.683179, 0, 1, 0.9411765, 1,
-0.03290055, -1.586933, -1.96446, 0, 1, 0.945098, 1,
-0.03263076, -1.176407, -3.492755, 0, 1, 0.9529412, 1,
-0.03252243, -0.05142742, -4.405691, 0, 1, 0.9568627, 1,
-0.02583569, 1.73553, -0.2670473, 0, 1, 0.9647059, 1,
-0.02561204, -0.9256187, -2.797312, 0, 1, 0.9686275, 1,
-0.022204, -1.593786, -1.596076, 0, 1, 0.9764706, 1,
-0.01967809, 0.4724276, -1.451681, 0, 1, 0.9803922, 1,
-0.01828257, 1.781244, -1.99196, 0, 1, 0.9882353, 1,
-0.01711957, 0.3919785, -0.146379, 0, 1, 0.9921569, 1,
-0.01631115, -0.3822227, -2.497551, 0, 1, 1, 1,
-0.01622069, 0.1200151, -1.309588, 0, 0.9921569, 1, 1,
-0.01204769, -0.005276638, -0.9877917, 0, 0.9882353, 1, 1,
-0.007045687, -0.6593857, -4.042786, 0, 0.9803922, 1, 1,
-0.004316563, 0.1258322, 1.205528, 0, 0.9764706, 1, 1,
-0.001521738, -0.9063714, -4.001228, 0, 0.9686275, 1, 1,
0.001441413, 0.5183148, 1.55978, 0, 0.9647059, 1, 1,
0.00606965, -0.9638489, 3.103459, 0, 0.9568627, 1, 1,
0.01074657, 0.4622387, 0.3852727, 0, 0.9529412, 1, 1,
0.0139062, -1.724378, 4.369128, 0, 0.945098, 1, 1,
0.01641584, -1.088786, 3.012887, 0, 0.9411765, 1, 1,
0.0191812, 0.7806731, -0.9180698, 0, 0.9333333, 1, 1,
0.02540025, 1.575681, 1.260063, 0, 0.9294118, 1, 1,
0.02664243, -0.7976293, 3.588911, 0, 0.9215686, 1, 1,
0.02836197, 0.6654277, -0.02522914, 0, 0.9176471, 1, 1,
0.02878953, -0.1103523, 3.493839, 0, 0.9098039, 1, 1,
0.03251248, 0.6187421, 0.3528789, 0, 0.9058824, 1, 1,
0.03372627, -0.9072869, 1.770521, 0, 0.8980392, 1, 1,
0.04146631, -0.336169, 3.374856, 0, 0.8901961, 1, 1,
0.04294363, -0.9013109, 3.038951, 0, 0.8862745, 1, 1,
0.04433245, -1.852935, 1.610067, 0, 0.8784314, 1, 1,
0.05045871, 0.2404009, 1.941533, 0, 0.8745098, 1, 1,
0.05151249, 0.3569058, -1.582229, 0, 0.8666667, 1, 1,
0.05238219, 0.9647589, 0.6873863, 0, 0.8627451, 1, 1,
0.05272472, 0.2538447, 0.708591, 0, 0.854902, 1, 1,
0.05370741, 1.147774, 1.379672, 0, 0.8509804, 1, 1,
0.0581856, 0.3853916, -0.1453241, 0, 0.8431373, 1, 1,
0.06419205, -0.1171814, 1.768542, 0, 0.8392157, 1, 1,
0.06944748, 0.8140207, -0.506264, 0, 0.8313726, 1, 1,
0.0706397, 0.3962253, 0.1525249, 0, 0.827451, 1, 1,
0.07522352, 0.001254051, 0.9292664, 0, 0.8196079, 1, 1,
0.08923627, -1.486234, 4.341381, 0, 0.8156863, 1, 1,
0.09031609, 1.160211, -0.1984382, 0, 0.8078431, 1, 1,
0.09192167, -0.2515804, 2.777735, 0, 0.8039216, 1, 1,
0.09210918, 0.9789174, -0.009030215, 0, 0.7960784, 1, 1,
0.09460589, -0.0692623, 1.619165, 0, 0.7882353, 1, 1,
0.09583788, 0.43891, 1.561916, 0, 0.7843137, 1, 1,
0.09900197, 0.8065301, 1.681641, 0, 0.7764706, 1, 1,
0.1017849, 0.5964324, -1.259274, 0, 0.772549, 1, 1,
0.102031, -1.756457, 2.941099, 0, 0.7647059, 1, 1,
0.1041261, 1.381725, 0.1799889, 0, 0.7607843, 1, 1,
0.1083349, 1.345402, 2.040293, 0, 0.7529412, 1, 1,
0.109081, 0.8895271, -1.278158, 0, 0.7490196, 1, 1,
0.1127995, 1.105647, 1.000041, 0, 0.7411765, 1, 1,
0.1129379, -0.8096209, 4.500239, 0, 0.7372549, 1, 1,
0.1137339, -0.1011683, 3.664719, 0, 0.7294118, 1, 1,
0.1137365, -0.6485741, 3.888798, 0, 0.7254902, 1, 1,
0.116089, -1.245208, 3.362341, 0, 0.7176471, 1, 1,
0.1210829, -0.02088545, 0.974552, 0, 0.7137255, 1, 1,
0.1211437, 0.001369924, 1.173719, 0, 0.7058824, 1, 1,
0.1234211, -1.081522, 4.112242, 0, 0.6980392, 1, 1,
0.1249223, 0.9922032, -1.29443, 0, 0.6941177, 1, 1,
0.1254609, 0.9032082, 0.453851, 0, 0.6862745, 1, 1,
0.1274295, -1.413552, 2.771376, 0, 0.682353, 1, 1,
0.1282634, 1.69124, 0.1886073, 0, 0.6745098, 1, 1,
0.128286, 0.6728441, 0.2441195, 0, 0.6705883, 1, 1,
0.1286526, -0.5958321, 2.773111, 0, 0.6627451, 1, 1,
0.1303688, 0.007862319, 2.061123, 0, 0.6588235, 1, 1,
0.1317587, -0.8622711, 2.953328, 0, 0.6509804, 1, 1,
0.1382584, -0.8057182, 3.568725, 0, 0.6470588, 1, 1,
0.138731, -0.1687195, 2.52755, 0, 0.6392157, 1, 1,
0.1418446, -0.09838355, 1.707718, 0, 0.6352941, 1, 1,
0.1546955, 0.7454464, 0.7710549, 0, 0.627451, 1, 1,
0.1553165, 0.1354222, 0.7616886, 0, 0.6235294, 1, 1,
0.1610331, 0.5819091, 0.4942031, 0, 0.6156863, 1, 1,
0.1623868, 0.1153607, 1.316047, 0, 0.6117647, 1, 1,
0.1684893, 0.1028356, 3.544794, 0, 0.6039216, 1, 1,
0.1688382, -0.4406844, 1.195829, 0, 0.5960785, 1, 1,
0.1715441, -1.421122, 1.782035, 0, 0.5921569, 1, 1,
0.1743342, 0.6524545, 0.8489996, 0, 0.5843138, 1, 1,
0.1799242, 0.8387498, 1.381824, 0, 0.5803922, 1, 1,
0.1810276, 1.644084, 1.855611, 0, 0.572549, 1, 1,
0.1853378, 0.1571644, 1.169389, 0, 0.5686275, 1, 1,
0.1861609, -0.7311994, 2.035118, 0, 0.5607843, 1, 1,
0.1963603, -1.056317, 2.014187, 0, 0.5568628, 1, 1,
0.1970931, 0.7446732, 0.5802294, 0, 0.5490196, 1, 1,
0.2034815, -0.1464947, 1.456421, 0, 0.5450981, 1, 1,
0.2095323, 0.2558147, 1.803459, 0, 0.5372549, 1, 1,
0.2104792, -1.780976, 3.515047, 0, 0.5333334, 1, 1,
0.2151401, -1.991738, 3.22122, 0, 0.5254902, 1, 1,
0.2176642, -0.8202173, 4.129083, 0, 0.5215687, 1, 1,
0.218115, 1.810439, 1.340651, 0, 0.5137255, 1, 1,
0.2197212, -0.1513246, 1.935624, 0, 0.509804, 1, 1,
0.2201105, -0.6945745, 2.797189, 0, 0.5019608, 1, 1,
0.2202991, 1.549073, 0.9737781, 0, 0.4941176, 1, 1,
0.2256994, -1.242834, 2.907903, 0, 0.4901961, 1, 1,
0.2266168, -0.002493378, 1.639998, 0, 0.4823529, 1, 1,
0.2267526, -0.3516214, 3.289969, 0, 0.4784314, 1, 1,
0.2302167, 0.9139272, -0.7576368, 0, 0.4705882, 1, 1,
0.2338183, 1.128514, 0.4653608, 0, 0.4666667, 1, 1,
0.2343097, -0.00131771, 0.8714065, 0, 0.4588235, 1, 1,
0.2349702, -0.1806697, 3.831471, 0, 0.454902, 1, 1,
0.2404552, -0.3617775, 5.189458, 0, 0.4470588, 1, 1,
0.2430301, 0.5527396, 1.137298, 0, 0.4431373, 1, 1,
0.2455958, -1.502847, 4.302162, 0, 0.4352941, 1, 1,
0.2533078, 1.723643, -1.868982, 0, 0.4313726, 1, 1,
0.2540542, -1.746297, 2.474922, 0, 0.4235294, 1, 1,
0.2555118, -0.6411699, 1.603084, 0, 0.4196078, 1, 1,
0.2569638, -1.52617, 3.484864, 0, 0.4117647, 1, 1,
0.2644181, -0.5322258, 1.874425, 0, 0.4078431, 1, 1,
0.2647608, -1.157692, 2.753366, 0, 0.4, 1, 1,
0.2660453, -0.3747782, 1.973775, 0, 0.3921569, 1, 1,
0.2681939, 0.7672461, -0.7975561, 0, 0.3882353, 1, 1,
0.2693283, -0.9114643, 0.8561327, 0, 0.3803922, 1, 1,
0.272768, -0.02996072, 2.868441, 0, 0.3764706, 1, 1,
0.2739583, 0.1900583, -1.547525, 0, 0.3686275, 1, 1,
0.2791836, -1.784321, 2.639952, 0, 0.3647059, 1, 1,
0.2802259, 0.7043172, 0.4807528, 0, 0.3568628, 1, 1,
0.2802463, -1.30918, 2.045881, 0, 0.3529412, 1, 1,
0.2875879, -0.2115238, 2.822373, 0, 0.345098, 1, 1,
0.2879635, 2.427689, -0.0279264, 0, 0.3411765, 1, 1,
0.2954017, -0.4593572, 3.290677, 0, 0.3333333, 1, 1,
0.2959678, 0.6663149, 1.194153, 0, 0.3294118, 1, 1,
0.3005414, 0.4875228, 1.947696, 0, 0.3215686, 1, 1,
0.3040083, -0.4662332, 2.246819, 0, 0.3176471, 1, 1,
0.3055207, -2.609136, 2.41906, 0, 0.3098039, 1, 1,
0.308167, -2.15958, 3.941303, 0, 0.3058824, 1, 1,
0.3100688, 0.6257249, 1.004399, 0, 0.2980392, 1, 1,
0.3102986, 0.3128712, 1.322312, 0, 0.2901961, 1, 1,
0.3106285, 0.2529743, 1.576016, 0, 0.2862745, 1, 1,
0.3135707, -0.3308094, 1.838704, 0, 0.2784314, 1, 1,
0.3154965, 0.1786562, -0.5905764, 0, 0.2745098, 1, 1,
0.3174897, 1.087974, -0.1688965, 0, 0.2666667, 1, 1,
0.318202, -0.5220382, 3.268293, 0, 0.2627451, 1, 1,
0.3188706, -0.7535937, 3.253312, 0, 0.254902, 1, 1,
0.3225348, 0.5398785, 0.3672779, 0, 0.2509804, 1, 1,
0.322588, -0.6369402, 3.180271, 0, 0.2431373, 1, 1,
0.3242693, -1.018583, 3.300881, 0, 0.2392157, 1, 1,
0.3249832, 1.125735, 0.1807483, 0, 0.2313726, 1, 1,
0.3264035, -0.5148759, 2.125201, 0, 0.227451, 1, 1,
0.3279674, 0.3786663, 1.267077, 0, 0.2196078, 1, 1,
0.331719, -0.9944549, 1.42912, 0, 0.2156863, 1, 1,
0.3317679, -0.07055026, 1.599141, 0, 0.2078431, 1, 1,
0.3321662, -1.14221, 2.437751, 0, 0.2039216, 1, 1,
0.3321737, 0.539326, 0.1141352, 0, 0.1960784, 1, 1,
0.3327243, 1.421435, 0.806656, 0, 0.1882353, 1, 1,
0.3338681, 1.946002, 0.2283977, 0, 0.1843137, 1, 1,
0.3386677, 0.1855668, 1.269316, 0, 0.1764706, 1, 1,
0.3478054, 0.7063255, 0.4305178, 0, 0.172549, 1, 1,
0.3518243, -0.2768025, 3.115714, 0, 0.1647059, 1, 1,
0.3523726, -0.307559, 1.034795, 0, 0.1607843, 1, 1,
0.3554488, 0.5284888, 0.7032037, 0, 0.1529412, 1, 1,
0.3570511, 1.496077, 0.6190355, 0, 0.1490196, 1, 1,
0.3579111, -0.3781473, 2.841541, 0, 0.1411765, 1, 1,
0.3583846, 1.394724, 1.380914, 0, 0.1372549, 1, 1,
0.3623527, -0.06083776, 1.718877, 0, 0.1294118, 1, 1,
0.3626236, 1.047972, 0.7130596, 0, 0.1254902, 1, 1,
0.3627531, 0.8316302, -0.1863939, 0, 0.1176471, 1, 1,
0.3691678, -2.137467, 2.047805, 0, 0.1137255, 1, 1,
0.370878, -1.181347, 2.124616, 0, 0.1058824, 1, 1,
0.3722052, -0.3201256, 2.878147, 0, 0.09803922, 1, 1,
0.3736826, -0.3669995, 1.42514, 0, 0.09411765, 1, 1,
0.3755037, 0.7735987, -1.506024, 0, 0.08627451, 1, 1,
0.3809, 1.802904, -0.1464913, 0, 0.08235294, 1, 1,
0.3812899, 0.5763758, 1.926916, 0, 0.07450981, 1, 1,
0.3821581, 1.513275, -0.5527369, 0, 0.07058824, 1, 1,
0.3849126, 0.3854006, 0.9000196, 0, 0.0627451, 1, 1,
0.3855469, 0.9468794, 0.8957493, 0, 0.05882353, 1, 1,
0.3865553, 1.403969, 2.169283, 0, 0.05098039, 1, 1,
0.3867207, 1.271552, -0.857858, 0, 0.04705882, 1, 1,
0.3871455, 1.542996, 0.7354283, 0, 0.03921569, 1, 1,
0.3888082, -0.5763047, 2.08733, 0, 0.03529412, 1, 1,
0.3911801, 1.297211, 0.4397903, 0, 0.02745098, 1, 1,
0.3916571, -0.7018546, 2.660656, 0, 0.02352941, 1, 1,
0.39284, 0.4549851, -0.882765, 0, 0.01568628, 1, 1,
0.3969072, -0.03203087, 2.38452, 0, 0.01176471, 1, 1,
0.4060314, -0.5955972, 3.271559, 0, 0.003921569, 1, 1,
0.4066917, -1.311774, 2.386841, 0.003921569, 0, 1, 1,
0.4136501, 0.01880693, 2.560729, 0.007843138, 0, 1, 1,
0.4156412, -1.187965, 3.823681, 0.01568628, 0, 1, 1,
0.416128, 1.275344, 0.33984, 0.01960784, 0, 1, 1,
0.4171837, -0.02522915, 0.7808992, 0.02745098, 0, 1, 1,
0.4219854, -0.5825245, 3.149665, 0.03137255, 0, 1, 1,
0.4271223, 0.9698136, -0.2156307, 0.03921569, 0, 1, 1,
0.4387642, 0.5726336, 0.763379, 0.04313726, 0, 1, 1,
0.4394904, -0.5485517, 3.054923, 0.05098039, 0, 1, 1,
0.4408317, -1.767613, 4.553315, 0.05490196, 0, 1, 1,
0.4419257, -0.3593156, 2.972309, 0.0627451, 0, 1, 1,
0.4434803, 1.229295, 0.2390991, 0.06666667, 0, 1, 1,
0.4451543, 0.3525046, 1.685101, 0.07450981, 0, 1, 1,
0.4458931, 0.5311016, -0.2837981, 0.07843138, 0, 1, 1,
0.4479033, -0.06495783, 0.4259684, 0.08627451, 0, 1, 1,
0.4533733, -1.832047, 3.944568, 0.09019608, 0, 1, 1,
0.461333, -0.03423124, 0.4018186, 0.09803922, 0, 1, 1,
0.4686063, 0.6978989, -1.087511, 0.1058824, 0, 1, 1,
0.4773749, -0.1285465, 2.443802, 0.1098039, 0, 1, 1,
0.4810336, -0.8176787, 2.042497, 0.1176471, 0, 1, 1,
0.4811886, 0.2892894, 0.8142779, 0.1215686, 0, 1, 1,
0.4841867, -0.1477385, 1.254644, 0.1294118, 0, 1, 1,
0.4874125, -1.469182, 1.882725, 0.1333333, 0, 1, 1,
0.4879107, 1.945786, 2.182747, 0.1411765, 0, 1, 1,
0.4932501, 0.5706743, 2.657635, 0.145098, 0, 1, 1,
0.4941748, 0.3891326, 1.310029, 0.1529412, 0, 1, 1,
0.4964053, -0.4468988, 3.212315, 0.1568628, 0, 1, 1,
0.4973817, 0.2442708, 0.294578, 0.1647059, 0, 1, 1,
0.498444, 1.30751, 1.202633, 0.1686275, 0, 1, 1,
0.5003801, -0.9482486, 1.506793, 0.1764706, 0, 1, 1,
0.5025706, 0.160027, 0.2706413, 0.1803922, 0, 1, 1,
0.5063226, -1.371756, 4.055741, 0.1882353, 0, 1, 1,
0.5086371, -0.7387432, 3.295333, 0.1921569, 0, 1, 1,
0.5115151, 0.3626181, 3.863833, 0.2, 0, 1, 1,
0.5208876, 0.9696053, 1.815029, 0.2078431, 0, 1, 1,
0.5211929, 0.3035254, 1.492981, 0.2117647, 0, 1, 1,
0.5291795, 0.01073019, 2.939203, 0.2196078, 0, 1, 1,
0.5294663, -1.122735, 2.770831, 0.2235294, 0, 1, 1,
0.5384508, -2.328839, 1.666484, 0.2313726, 0, 1, 1,
0.5384955, -0.08751918, 0.9795477, 0.2352941, 0, 1, 1,
0.5419123, -1.222431, 2.564186, 0.2431373, 0, 1, 1,
0.54214, 0.2762717, 0.6907507, 0.2470588, 0, 1, 1,
0.5503861, 0.4737426, 0.8545595, 0.254902, 0, 1, 1,
0.5528371, -1.073836, 1.080593, 0.2588235, 0, 1, 1,
0.553009, -1.181765, 2.667345, 0.2666667, 0, 1, 1,
0.5534158, 0.1769533, 2.386344, 0.2705882, 0, 1, 1,
0.5601055, 0.5500345, 1.010669, 0.2784314, 0, 1, 1,
0.5636117, 1.333883, 2.571861, 0.282353, 0, 1, 1,
0.5699168, -0.7831951, 5.290601, 0.2901961, 0, 1, 1,
0.5709258, -0.5833674, 2.901899, 0.2941177, 0, 1, 1,
0.5766437, -2.13319, 2.707659, 0.3019608, 0, 1, 1,
0.5810294, 0.5677193, -1.109905, 0.3098039, 0, 1, 1,
0.5827506, 0.8559119, 1.222969, 0.3137255, 0, 1, 1,
0.5855027, -0.02486344, 1.671164, 0.3215686, 0, 1, 1,
0.5858268, 1.865223, -0.3411807, 0.3254902, 0, 1, 1,
0.5872855, 0.8001308, 2.655619, 0.3333333, 0, 1, 1,
0.5885018, -0.7396675, 1.710024, 0.3372549, 0, 1, 1,
0.5915136, 1.455537, 2.166122, 0.345098, 0, 1, 1,
0.5944902, -1.237395, 2.903612, 0.3490196, 0, 1, 1,
0.5945848, 1.916273, 1.194257, 0.3568628, 0, 1, 1,
0.5954564, -1.249739, 2.964522, 0.3607843, 0, 1, 1,
0.6057829, 0.567642, 0.04740025, 0.3686275, 0, 1, 1,
0.6113088, -0.9288554, 1.900046, 0.372549, 0, 1, 1,
0.6132159, 1.059209, 1.787449, 0.3803922, 0, 1, 1,
0.6148932, 0.3195432, 2.793505, 0.3843137, 0, 1, 1,
0.6150673, -1.56798, 3.698208, 0.3921569, 0, 1, 1,
0.6150954, 0.1079306, 2.043969, 0.3960784, 0, 1, 1,
0.6326795, -1.521658, 2.909094, 0.4039216, 0, 1, 1,
0.6348504, -0.1171291, 1.468179, 0.4117647, 0, 1, 1,
0.6372699, 2.125665, 0.02840408, 0.4156863, 0, 1, 1,
0.6385851, 0.32153, 2.086891, 0.4235294, 0, 1, 1,
0.6422446, -0.9808451, 1.766334, 0.427451, 0, 1, 1,
0.6449621, -1.173986, 1.807632, 0.4352941, 0, 1, 1,
0.6466403, -0.4872889, 0.9210425, 0.4392157, 0, 1, 1,
0.6486263, 0.2175506, 1.48257, 0.4470588, 0, 1, 1,
0.6508306, -1.996588, 2.608257, 0.4509804, 0, 1, 1,
0.6588303, 0.7002429, 0.4593206, 0.4588235, 0, 1, 1,
0.6595353, -2.2143, 1.755677, 0.4627451, 0, 1, 1,
0.6611164, 0.5307575, 0.4233747, 0.4705882, 0, 1, 1,
0.6619545, 0.2132962, 1.496231, 0.4745098, 0, 1, 1,
0.6667438, 0.08207732, 0.3876338, 0.4823529, 0, 1, 1,
0.6670702, -1.930076, 3.684876, 0.4862745, 0, 1, 1,
0.6690536, -0.04103652, 1.797651, 0.4941176, 0, 1, 1,
0.6703544, -0.5738842, 2.544363, 0.5019608, 0, 1, 1,
0.6738824, -0.01305722, 1.55874, 0.5058824, 0, 1, 1,
0.6782774, -1.059831, 1.555183, 0.5137255, 0, 1, 1,
0.6836716, -0.6249899, 1.9586, 0.5176471, 0, 1, 1,
0.6842294, 0.4070314, 1.235969, 0.5254902, 0, 1, 1,
0.6863527, -1.146288, 2.279705, 0.5294118, 0, 1, 1,
0.6870742, 0.002917314, 0.4891742, 0.5372549, 0, 1, 1,
0.6885494, 1.798511, -0.08730976, 0.5411765, 0, 1, 1,
0.6887192, 1.902963, 1.323964, 0.5490196, 0, 1, 1,
0.6940637, 1.175178, 1.148502, 0.5529412, 0, 1, 1,
0.6964398, -0.05900979, 3.491691, 0.5607843, 0, 1, 1,
0.7070015, -1.002007, 2.584413, 0.5647059, 0, 1, 1,
0.7074317, -0.1928524, 1.833073, 0.572549, 0, 1, 1,
0.7174074, -1.441063, 1.624327, 0.5764706, 0, 1, 1,
0.7208154, -0.2093415, 3.127032, 0.5843138, 0, 1, 1,
0.7229872, -1.797264, 3.533963, 0.5882353, 0, 1, 1,
0.7414155, 0.4283685, 0.3084329, 0.5960785, 0, 1, 1,
0.7419682, -0.482864, 2.071292, 0.6039216, 0, 1, 1,
0.7432788, -0.7635193, 3.346696, 0.6078432, 0, 1, 1,
0.7446508, -0.9856986, 1.20562, 0.6156863, 0, 1, 1,
0.7485588, -1.463016, 3.631416, 0.6196079, 0, 1, 1,
0.7487212, -1.684168, 2.726534, 0.627451, 0, 1, 1,
0.7526541, 0.7557512, 2.52046, 0.6313726, 0, 1, 1,
0.7554547, -0.810223, 1.896943, 0.6392157, 0, 1, 1,
0.7635633, 1.433398, 1.569833, 0.6431373, 0, 1, 1,
0.7654796, 0.7496225, 1.883299, 0.6509804, 0, 1, 1,
0.766601, 0.02737001, 2.277713, 0.654902, 0, 1, 1,
0.7745681, -1.069559, 2.486619, 0.6627451, 0, 1, 1,
0.7753777, -1.387818, 1.956881, 0.6666667, 0, 1, 1,
0.7769668, 2.440657, 2.064422, 0.6745098, 0, 1, 1,
0.7812092, 1.994943, 1.134714, 0.6784314, 0, 1, 1,
0.7821594, 0.99043, 0.6513842, 0.6862745, 0, 1, 1,
0.7838977, 0.7487511, 1.407819, 0.6901961, 0, 1, 1,
0.7855561, -0.6951357, 0.2995181, 0.6980392, 0, 1, 1,
0.7879689, -0.02899567, 0.8810313, 0.7058824, 0, 1, 1,
0.8018279, 1.313238, 1.370173, 0.7098039, 0, 1, 1,
0.8123786, -1.115624, 2.82929, 0.7176471, 0, 1, 1,
0.8148638, -0.1208483, 2.756643, 0.7215686, 0, 1, 1,
0.815457, -1.314284, 3.062883, 0.7294118, 0, 1, 1,
0.8162423, 1.287992, 0.3431245, 0.7333333, 0, 1, 1,
0.817265, 0.4928488, 1.8605, 0.7411765, 0, 1, 1,
0.8174707, -1.896052, 1.071983, 0.7450981, 0, 1, 1,
0.8233565, 0.5063264, 1.152164, 0.7529412, 0, 1, 1,
0.8240542, 0.279878, 1.042574, 0.7568628, 0, 1, 1,
0.8249194, -1.456228, 3.753183, 0.7647059, 0, 1, 1,
0.8273609, -2.402049, 1.728364, 0.7686275, 0, 1, 1,
0.8291736, -0.6777655, 4.726533, 0.7764706, 0, 1, 1,
0.8366777, 0.4186581, 2.588917, 0.7803922, 0, 1, 1,
0.8383446, 0.7456893, 0.2246723, 0.7882353, 0, 1, 1,
0.8410648, -3.46268, 1.814795, 0.7921569, 0, 1, 1,
0.8414974, 0.268527, 0.4884895, 0.8, 0, 1, 1,
0.8451936, 0.126578, 1.344007, 0.8078431, 0, 1, 1,
0.8557863, 1.074912, -0.1684771, 0.8117647, 0, 1, 1,
0.8564709, 0.9116396, 0.9063948, 0.8196079, 0, 1, 1,
0.8611147, 0.3275753, 0.7651789, 0.8235294, 0, 1, 1,
0.8630052, -0.5991285, 1.993008, 0.8313726, 0, 1, 1,
0.8678275, -0.1940594, 2.473974, 0.8352941, 0, 1, 1,
0.8707046, 0.1321035, 2.57084, 0.8431373, 0, 1, 1,
0.8714181, -0.5201168, 0.3417055, 0.8470588, 0, 1, 1,
0.8724223, 0.2172659, 1.106546, 0.854902, 0, 1, 1,
0.8746521, -0.7765303, 1.40188, 0.8588235, 0, 1, 1,
0.8771045, -0.6781895, 2.248192, 0.8666667, 0, 1, 1,
0.8860235, 0.4292611, -0.2866139, 0.8705882, 0, 1, 1,
0.8919164, -0.2191386, 1.70109, 0.8784314, 0, 1, 1,
0.8986332, -0.3468401, 1.521797, 0.8823529, 0, 1, 1,
0.9017316, 0.5511515, 0.2463169, 0.8901961, 0, 1, 1,
0.9026667, -1.499109, 3.164237, 0.8941177, 0, 1, 1,
0.9128128, -0.3769591, 0.06280912, 0.9019608, 0, 1, 1,
0.9152108, 0.1881635, 3.811243, 0.9098039, 0, 1, 1,
0.9279739, -0.8693331, 2.551441, 0.9137255, 0, 1, 1,
0.9302493, 0.4586869, -0.0008887955, 0.9215686, 0, 1, 1,
0.9303295, -0.1776456, -0.09074769, 0.9254902, 0, 1, 1,
0.930949, 1.28289, -0.3510737, 0.9333333, 0, 1, 1,
0.937005, -0.1262515, 2.194865, 0.9372549, 0, 1, 1,
0.9436439, 2.154543, -0.8413175, 0.945098, 0, 1, 1,
0.9599369, -0.2416583, 0.7280499, 0.9490196, 0, 1, 1,
0.9607415, 0.9580278, -0.06036352, 0.9568627, 0, 1, 1,
0.9626244, -0.7233722, 2.139837, 0.9607843, 0, 1, 1,
0.9785067, -0.5159076, 3.372913, 0.9686275, 0, 1, 1,
0.9787284, 0.9920936, 0.4401046, 0.972549, 0, 1, 1,
0.9833269, -0.08656428, 1.39433, 0.9803922, 0, 1, 1,
0.9839952, -0.2859275, 1.990161, 0.9843137, 0, 1, 1,
0.9855706, -0.5420911, 2.550884, 0.9921569, 0, 1, 1,
0.9859933, 0.2579685, 2.433205, 0.9960784, 0, 1, 1,
0.9920713, -0.1927086, 0.3591936, 1, 0, 0.9960784, 1,
0.9938934, -0.8732599, 2.67504, 1, 0, 0.9882353, 1,
0.9955947, 1.088282, -1.19061, 1, 0, 0.9843137, 1,
0.9960788, 0.50499, -0.1487362, 1, 0, 0.9764706, 1,
0.9964073, 0.5741255, 0.3602008, 1, 0, 0.972549, 1,
0.998046, -0.4865095, 1.875614, 1, 0, 0.9647059, 1,
1.000271, 0.9703218, 0.2172945, 1, 0, 0.9607843, 1,
1.000779, 0.5356725, 1.293131, 1, 0, 0.9529412, 1,
1.000926, -1.316671, 3.327828, 1, 0, 0.9490196, 1,
1.001507, -0.5662535, 2.292, 1, 0, 0.9411765, 1,
1.005814, 0.617623, 1.285161, 1, 0, 0.9372549, 1,
1.010746, -0.2736577, 1.975206, 1, 0, 0.9294118, 1,
1.011371, -0.2882479, -0.323238, 1, 0, 0.9254902, 1,
1.014276, 1.107446, 1.447008, 1, 0, 0.9176471, 1,
1.018472, -1.556311, 2.032443, 1, 0, 0.9137255, 1,
1.019573, -0.6306787, 2.030229, 1, 0, 0.9058824, 1,
1.019707, -0.531078, 3.082693, 1, 0, 0.9019608, 1,
1.021513, -0.973357, 1.600546, 1, 0, 0.8941177, 1,
1.023334, 0.1064085, 2.415987, 1, 0, 0.8862745, 1,
1.024164, 0.4778126, 0.6387292, 1, 0, 0.8823529, 1,
1.030267, 0.4426261, 2.91932, 1, 0, 0.8745098, 1,
1.037588, 1.340828, 1.498849, 1, 0, 0.8705882, 1,
1.049744, -0.2341996, 2.262722, 1, 0, 0.8627451, 1,
1.058944, 0.7242554, -0.8650361, 1, 0, 0.8588235, 1,
1.064949, 0.4870642, 2.23752, 1, 0, 0.8509804, 1,
1.067276, 1.263175, 0.27591, 1, 0, 0.8470588, 1,
1.069409, -0.7368018, 1.196078, 1, 0, 0.8392157, 1,
1.084863, -0.3582586, 1.786049, 1, 0, 0.8352941, 1,
1.094125, -0.2342893, 1.345597, 1, 0, 0.827451, 1,
1.095364, -0.03972754, 2.422463, 1, 0, 0.8235294, 1,
1.096477, 0.7532778, 0.3520461, 1, 0, 0.8156863, 1,
1.105515, -0.439475, 1.501241, 1, 0, 0.8117647, 1,
1.115605, -0.9920686, 0.153087, 1, 0, 0.8039216, 1,
1.115956, -0.7340659, 1.623582, 1, 0, 0.7960784, 1,
1.118305, 0.7633629, 0.4319531, 1, 0, 0.7921569, 1,
1.131563, 0.5324514, 3.644648, 1, 0, 0.7843137, 1,
1.133873, 1.005873, 2.133663, 1, 0, 0.7803922, 1,
1.138456, 0.5561554, -0.4411635, 1, 0, 0.772549, 1,
1.150304, -0.1398043, 1.599841, 1, 0, 0.7686275, 1,
1.176295, 1.585388, 2.005321, 1, 0, 0.7607843, 1,
1.187311, 1.630558, 2.785702, 1, 0, 0.7568628, 1,
1.190451, -0.8687561, 3.66567, 1, 0, 0.7490196, 1,
1.200365, -1.919567, 2.801027, 1, 0, 0.7450981, 1,
1.203978, -1.325581, 3.141582, 1, 0, 0.7372549, 1,
1.204639, 0.7177374, 0.5672004, 1, 0, 0.7333333, 1,
1.206242, 1.042899, 1.328685, 1, 0, 0.7254902, 1,
1.211148, 0.09745248, 1.335318, 1, 0, 0.7215686, 1,
1.211384, 0.4117634, 0.1819525, 1, 0, 0.7137255, 1,
1.219224, 0.713227, 1.480447, 1, 0, 0.7098039, 1,
1.221612, -2.590492, 4.87819, 1, 0, 0.7019608, 1,
1.226644, -1.286913, 1.975491, 1, 0, 0.6941177, 1,
1.227192, -1.454148, 3.605195, 1, 0, 0.6901961, 1,
1.237958, -0.5921703, 0.4362396, 1, 0, 0.682353, 1,
1.241879, 1.168466, -0.1291064, 1, 0, 0.6784314, 1,
1.243137, 0.6551397, 3.251551, 1, 0, 0.6705883, 1,
1.24391, -0.1445345, 2.363991, 1, 0, 0.6666667, 1,
1.248775, 0.7781914, 1.82238, 1, 0, 0.6588235, 1,
1.253642, 0.152176, 1.254205, 1, 0, 0.654902, 1,
1.261821, 0.2459631, 1.339706, 1, 0, 0.6470588, 1,
1.263706, 0.6023699, 0.7989725, 1, 0, 0.6431373, 1,
1.266876, -1.560246, 2.363778, 1, 0, 0.6352941, 1,
1.281929, 0.9684842, 0.7812126, 1, 0, 0.6313726, 1,
1.297592, -0.05016771, 3.113662, 1, 0, 0.6235294, 1,
1.299087, -0.6217335, 2.577672, 1, 0, 0.6196079, 1,
1.300497, -0.9903818, 3.443142, 1, 0, 0.6117647, 1,
1.301095, -1.310112, 1.576891, 1, 0, 0.6078432, 1,
1.301231, -1.22436, 1.096346, 1, 0, 0.6, 1,
1.310187, -0.2594245, 1.332161, 1, 0, 0.5921569, 1,
1.310756, -0.6751618, 0.4079859, 1, 0, 0.5882353, 1,
1.313027, -0.7325734, 2.354793, 1, 0, 0.5803922, 1,
1.332663, 0.763706, 0.6656914, 1, 0, 0.5764706, 1,
1.347048, -0.7308676, 2.017628, 1, 0, 0.5686275, 1,
1.352049, 0.02243367, 1.30664, 1, 0, 0.5647059, 1,
1.36174, 0.5411142, 3.272361, 1, 0, 0.5568628, 1,
1.361928, 0.1499931, 0.7966424, 1, 0, 0.5529412, 1,
1.36476, -0.9074363, 0.9082265, 1, 0, 0.5450981, 1,
1.389374, 0.5269941, 1.514766, 1, 0, 0.5411765, 1,
1.391384, 9.231595e-05, 2.082514, 1, 0, 0.5333334, 1,
1.398797, 0.5224165, 2.010569, 1, 0, 0.5294118, 1,
1.409306, -0.5612245, 0.4717124, 1, 0, 0.5215687, 1,
1.427492, 0.892096, 1.829536, 1, 0, 0.5176471, 1,
1.433583, -0.907054, 2.697609, 1, 0, 0.509804, 1,
1.439664, 0.4676533, 3.038965, 1, 0, 0.5058824, 1,
1.445873, 0.4072385, -0.9299951, 1, 0, 0.4980392, 1,
1.446306, 1.314921, 3.672848, 1, 0, 0.4901961, 1,
1.459798, 0.4373753, 0.5100964, 1, 0, 0.4862745, 1,
1.465636, -1.547821, 2.508905, 1, 0, 0.4784314, 1,
1.473129, -0.6652058, 0.6040539, 1, 0, 0.4745098, 1,
1.482092, -1.287842, 2.766842, 1, 0, 0.4666667, 1,
1.500678, -0.3973492, 2.839198, 1, 0, 0.4627451, 1,
1.501645, -0.7875998, 1.08418, 1, 0, 0.454902, 1,
1.511531, -0.6128632, 1.770903, 1, 0, 0.4509804, 1,
1.524793, 1.629292, 1.320153, 1, 0, 0.4431373, 1,
1.529874, -1.202578, 1.339066, 1, 0, 0.4392157, 1,
1.530814, -0.9837667, 1.561061, 1, 0, 0.4313726, 1,
1.540151, 1.499822, -1.756486, 1, 0, 0.427451, 1,
1.551515, 0.6505576, 2.027323, 1, 0, 0.4196078, 1,
1.558597, -0.3104714, 4.273849, 1, 0, 0.4156863, 1,
1.563941, 0.08239423, 1.779387, 1, 0, 0.4078431, 1,
1.571033, 0.6575984, 1.143577, 1, 0, 0.4039216, 1,
1.571137, -0.5641829, 2.603957, 1, 0, 0.3960784, 1,
1.572536, 1.724565, 1.196767, 1, 0, 0.3882353, 1,
1.576826, 0.3132448, 1.301476, 1, 0, 0.3843137, 1,
1.580878, 1.035351, -0.8555745, 1, 0, 0.3764706, 1,
1.583251, -0.5168281, 2.520785, 1, 0, 0.372549, 1,
1.583865, -0.3506905, 1.834765, 1, 0, 0.3647059, 1,
1.603375, 1.164332, 0.7069319, 1, 0, 0.3607843, 1,
1.610031, 0.1407683, 1.083328, 1, 0, 0.3529412, 1,
1.612156, -0.9880343, 3.199751, 1, 0, 0.3490196, 1,
1.618708, -0.01432629, -0.8340571, 1, 0, 0.3411765, 1,
1.626016, -0.4837985, 2.496917, 1, 0, 0.3372549, 1,
1.627258, 0.3342894, 1.047436, 1, 0, 0.3294118, 1,
1.638274, -2.074332, 3.176886, 1, 0, 0.3254902, 1,
1.649098, 0.7130144, 0.9623742, 1, 0, 0.3176471, 1,
1.676991, 0.6421201, 0.3890994, 1, 0, 0.3137255, 1,
1.710138, -1.043971, 3.731854, 1, 0, 0.3058824, 1,
1.710809, -0.3949772, 0.2711099, 1, 0, 0.2980392, 1,
1.717466, -0.4399432, 2.486458, 1, 0, 0.2941177, 1,
1.731207, 1.302841, 0.2245939, 1, 0, 0.2862745, 1,
1.748987, 1.608444, 2.142086, 1, 0, 0.282353, 1,
1.784117, 1.437029, -0.09588953, 1, 0, 0.2745098, 1,
1.838489, -0.1400407, 0.7913213, 1, 0, 0.2705882, 1,
1.839788, 0.867308, 3.248399, 1, 0, 0.2627451, 1,
1.870296, -2.300978, 2.184175, 1, 0, 0.2588235, 1,
1.87286, 0.1606192, 1.63273, 1, 0, 0.2509804, 1,
1.878143, 1.243098, 0.6863177, 1, 0, 0.2470588, 1,
1.898508, 0.710575, 0.08270217, 1, 0, 0.2392157, 1,
1.909738, -0.5377328, 2.757749, 1, 0, 0.2352941, 1,
1.917715, -2.650727, 0.3335209, 1, 0, 0.227451, 1,
1.923407, 2.150385, 1.621534, 1, 0, 0.2235294, 1,
1.945531, -0.7604405, 0.538429, 1, 0, 0.2156863, 1,
1.968763, -0.312676, 1.924518, 1, 0, 0.2117647, 1,
2.000406, -0.3900376, 1.990307, 1, 0, 0.2039216, 1,
2.002115, 0.1894255, 3.649039, 1, 0, 0.1960784, 1,
2.009755, 0.7651512, 1.03819, 1, 0, 0.1921569, 1,
2.02452, 1.000244, 0.9643451, 1, 0, 0.1843137, 1,
2.028168, 0.5828661, -0.4993266, 1, 0, 0.1803922, 1,
2.030155, 0.9833087, 1.664533, 1, 0, 0.172549, 1,
2.033613, -0.2446983, 2.178055, 1, 0, 0.1686275, 1,
2.03419, -1.722879, 0.848665, 1, 0, 0.1607843, 1,
2.038237, 1.237063, 0.8469229, 1, 0, 0.1568628, 1,
2.047036, 0.769428, 0.749438, 1, 0, 0.1490196, 1,
2.070994, -1.126089, 2.707644, 1, 0, 0.145098, 1,
2.148161, 0.1089545, 0.8961115, 1, 0, 0.1372549, 1,
2.16875, -0.2407721, 0.6190007, 1, 0, 0.1333333, 1,
2.172214, 0.6222574, 0.4264354, 1, 0, 0.1254902, 1,
2.172897, -0.5081366, 3.4647, 1, 0, 0.1215686, 1,
2.183505, 1.20187, 1.316797, 1, 0, 0.1137255, 1,
2.196702, -0.1907107, 2.217703, 1, 0, 0.1098039, 1,
2.225591, 0.7749128, 1.253796, 1, 0, 0.1019608, 1,
2.294886, -0.363269, 1.815771, 1, 0, 0.09411765, 1,
2.303047, -0.1182463, 0.8094113, 1, 0, 0.09019608, 1,
2.319114, 0.9122754, 1.258438, 1, 0, 0.08235294, 1,
2.360509, 1.927457, 2.452852, 1, 0, 0.07843138, 1,
2.369193, 1.969204, -0.01523217, 1, 0, 0.07058824, 1,
2.445555, -0.01034224, 2.632259, 1, 0, 0.06666667, 1,
2.49753, 1.966758, 2.390552, 1, 0, 0.05882353, 1,
2.530551, 0.546775, 1.089605, 1, 0, 0.05490196, 1,
2.533846, 2.374092, 0.1822002, 1, 0, 0.04705882, 1,
2.584463, -0.7726261, 1.724042, 1, 0, 0.04313726, 1,
2.623477, -0.42724, 1.415757, 1, 0, 0.03529412, 1,
2.73655, 0.650316, 0.6270585, 1, 0, 0.03137255, 1,
2.798352, -0.7034042, 1.596855, 1, 0, 0.02352941, 1,
2.824306, 0.8409517, 3.391728, 1, 0, 0.01960784, 1,
3.132696, 1.190047, 2.531568, 1, 0, 0.01176471, 1,
3.324869, -0.9977077, 1.153343, 1, 0, 0.007843138, 1
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
0.3489765, -4.496295, -7.299015, 0, -0.5, 0.5, 0.5,
0.3489765, -4.496295, -7.299015, 1, -0.5, 0.5, 0.5,
0.3489765, -4.496295, -7.299015, 1, 1.5, 0.5, 0.5,
0.3489765, -4.496295, -7.299015, 0, 1.5, 0.5, 0.5
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
-3.635743, -0.4136664, -7.299015, 0, -0.5, 0.5, 0.5,
-3.635743, -0.4136664, -7.299015, 1, -0.5, 0.5, 0.5,
-3.635743, -0.4136664, -7.299015, 1, 1.5, 0.5, 0.5,
-3.635743, -0.4136664, -7.299015, 0, 1.5, 0.5, 0.5
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
-3.635743, -4.496295, -0.09187675, 0, -0.5, 0.5, 0.5,
-3.635743, -4.496295, -0.09187675, 1, -0.5, 0.5, 0.5,
-3.635743, -4.496295, -0.09187675, 1, 1.5, 0.5, 0.5,
-3.635743, -4.496295, -0.09187675, 0, 1.5, 0.5, 0.5
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
-2, -3.55415, -5.635829,
3, -3.55415, -5.635829,
-2, -3.55415, -5.635829,
-2, -3.711174, -5.913027,
-1, -3.55415, -5.635829,
-1, -3.711174, -5.913027,
0, -3.55415, -5.635829,
0, -3.711174, -5.913027,
1, -3.55415, -5.635829,
1, -3.711174, -5.913027,
2, -3.55415, -5.635829,
2, -3.711174, -5.913027,
3, -3.55415, -5.635829,
3, -3.711174, -5.913027
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
-2, -4.025223, -6.467422, 0, -0.5, 0.5, 0.5,
-2, -4.025223, -6.467422, 1, -0.5, 0.5, 0.5,
-2, -4.025223, -6.467422, 1, 1.5, 0.5, 0.5,
-2, -4.025223, -6.467422, 0, 1.5, 0.5, 0.5,
-1, -4.025223, -6.467422, 0, -0.5, 0.5, 0.5,
-1, -4.025223, -6.467422, 1, -0.5, 0.5, 0.5,
-1, -4.025223, -6.467422, 1, 1.5, 0.5, 0.5,
-1, -4.025223, -6.467422, 0, 1.5, 0.5, 0.5,
0, -4.025223, -6.467422, 0, -0.5, 0.5, 0.5,
0, -4.025223, -6.467422, 1, -0.5, 0.5, 0.5,
0, -4.025223, -6.467422, 1, 1.5, 0.5, 0.5,
0, -4.025223, -6.467422, 0, 1.5, 0.5, 0.5,
1, -4.025223, -6.467422, 0, -0.5, 0.5, 0.5,
1, -4.025223, -6.467422, 1, -0.5, 0.5, 0.5,
1, -4.025223, -6.467422, 1, 1.5, 0.5, 0.5,
1, -4.025223, -6.467422, 0, 1.5, 0.5, 0.5,
2, -4.025223, -6.467422, 0, -0.5, 0.5, 0.5,
2, -4.025223, -6.467422, 1, -0.5, 0.5, 0.5,
2, -4.025223, -6.467422, 1, 1.5, 0.5, 0.5,
2, -4.025223, -6.467422, 0, 1.5, 0.5, 0.5,
3, -4.025223, -6.467422, 0, -0.5, 0.5, 0.5,
3, -4.025223, -6.467422, 1, -0.5, 0.5, 0.5,
3, -4.025223, -6.467422, 1, 1.5, 0.5, 0.5,
3, -4.025223, -6.467422, 0, 1.5, 0.5, 0.5
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
-2.716193, -3, -5.635829,
-2.716193, 2, -5.635829,
-2.716193, -3, -5.635829,
-2.869451, -3, -5.913027,
-2.716193, -2, -5.635829,
-2.869451, -2, -5.913027,
-2.716193, -1, -5.635829,
-2.869451, -1, -5.913027,
-2.716193, 0, -5.635829,
-2.869451, 0, -5.913027,
-2.716193, 1, -5.635829,
-2.869451, 1, -5.913027,
-2.716193, 2, -5.635829,
-2.869451, 2, -5.913027
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
"2"
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
-3.175968, -3, -6.467422, 0, -0.5, 0.5, 0.5,
-3.175968, -3, -6.467422, 1, -0.5, 0.5, 0.5,
-3.175968, -3, -6.467422, 1, 1.5, 0.5, 0.5,
-3.175968, -3, -6.467422, 0, 1.5, 0.5, 0.5,
-3.175968, -2, -6.467422, 0, -0.5, 0.5, 0.5,
-3.175968, -2, -6.467422, 1, -0.5, 0.5, 0.5,
-3.175968, -2, -6.467422, 1, 1.5, 0.5, 0.5,
-3.175968, -2, -6.467422, 0, 1.5, 0.5, 0.5,
-3.175968, -1, -6.467422, 0, -0.5, 0.5, 0.5,
-3.175968, -1, -6.467422, 1, -0.5, 0.5, 0.5,
-3.175968, -1, -6.467422, 1, 1.5, 0.5, 0.5,
-3.175968, -1, -6.467422, 0, 1.5, 0.5, 0.5,
-3.175968, 0, -6.467422, 0, -0.5, 0.5, 0.5,
-3.175968, 0, -6.467422, 1, -0.5, 0.5, 0.5,
-3.175968, 0, -6.467422, 1, 1.5, 0.5, 0.5,
-3.175968, 0, -6.467422, 0, 1.5, 0.5, 0.5,
-3.175968, 1, -6.467422, 0, -0.5, 0.5, 0.5,
-3.175968, 1, -6.467422, 1, -0.5, 0.5, 0.5,
-3.175968, 1, -6.467422, 1, 1.5, 0.5, 0.5,
-3.175968, 1, -6.467422, 0, 1.5, 0.5, 0.5,
-3.175968, 2, -6.467422, 0, -0.5, 0.5, 0.5,
-3.175968, 2, -6.467422, 1, -0.5, 0.5, 0.5,
-3.175968, 2, -6.467422, 1, 1.5, 0.5, 0.5,
-3.175968, 2, -6.467422, 0, 1.5, 0.5, 0.5
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
-2.716193, -3.55415, -4,
-2.716193, -3.55415, 4,
-2.716193, -3.55415, -4,
-2.869451, -3.711174, -4,
-2.716193, -3.55415, -2,
-2.869451, -3.711174, -2,
-2.716193, -3.55415, 0,
-2.869451, -3.711174, 0,
-2.716193, -3.55415, 2,
-2.869451, -3.711174, 2,
-2.716193, -3.55415, 4,
-2.869451, -3.711174, 4
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
-3.175968, -4.025223, -4, 0, -0.5, 0.5, 0.5,
-3.175968, -4.025223, -4, 1, -0.5, 0.5, 0.5,
-3.175968, -4.025223, -4, 1, 1.5, 0.5, 0.5,
-3.175968, -4.025223, -4, 0, 1.5, 0.5, 0.5,
-3.175968, -4.025223, -2, 0, -0.5, 0.5, 0.5,
-3.175968, -4.025223, -2, 1, -0.5, 0.5, 0.5,
-3.175968, -4.025223, -2, 1, 1.5, 0.5, 0.5,
-3.175968, -4.025223, -2, 0, 1.5, 0.5, 0.5,
-3.175968, -4.025223, 0, 0, -0.5, 0.5, 0.5,
-3.175968, -4.025223, 0, 1, -0.5, 0.5, 0.5,
-3.175968, -4.025223, 0, 1, 1.5, 0.5, 0.5,
-3.175968, -4.025223, 0, 0, 1.5, 0.5, 0.5,
-3.175968, -4.025223, 2, 0, -0.5, 0.5, 0.5,
-3.175968, -4.025223, 2, 1, -0.5, 0.5, 0.5,
-3.175968, -4.025223, 2, 1, 1.5, 0.5, 0.5,
-3.175968, -4.025223, 2, 0, 1.5, 0.5, 0.5,
-3.175968, -4.025223, 4, 0, -0.5, 0.5, 0.5,
-3.175968, -4.025223, 4, 1, -0.5, 0.5, 0.5,
-3.175968, -4.025223, 4, 1, 1.5, 0.5, 0.5,
-3.175968, -4.025223, 4, 0, 1.5, 0.5, 0.5
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
-2.716193, -3.55415, -5.635829,
-2.716193, 2.726818, -5.635829,
-2.716193, -3.55415, 5.452075,
-2.716193, 2.726818, 5.452075,
-2.716193, -3.55415, -5.635829,
-2.716193, -3.55415, 5.452075,
-2.716193, 2.726818, -5.635829,
-2.716193, 2.726818, 5.452075,
-2.716193, -3.55415, -5.635829,
3.414146, -3.55415, -5.635829,
-2.716193, -3.55415, 5.452075,
3.414146, -3.55415, 5.452075,
-2.716193, 2.726818, -5.635829,
3.414146, 2.726818, -5.635829,
-2.716193, 2.726818, 5.452075,
3.414146, 2.726818, 5.452075,
3.414146, -3.55415, -5.635829,
3.414146, 2.726818, -5.635829,
3.414146, -3.55415, 5.452075,
3.414146, 2.726818, 5.452075,
3.414146, -3.55415, -5.635829,
3.414146, -3.55415, 5.452075,
3.414146, 2.726818, -5.635829,
3.414146, 2.726818, 5.452075
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
var radius = 7.55112;
var distance = 33.59579;
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
mvMatrix.translate( -0.3489765, 0.4136664, 0.09187675 );
mvMatrix.scale( 1.331806, 1.299866, 0.7363356 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.59579);
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
chlorsulfuron<-read.table("chlorsulfuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorsulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorsulfuron' not found
```

```r
y<-chlorsulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorsulfuron' not found
```

```r
z<-chlorsulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorsulfuron' not found
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
-2.626916, -0.509867, -2.614334, 0, 0, 1, 1, 1,
-2.575112, 0.5490093, -0.7351882, 1, 0, 0, 1, 1,
-2.505338, -0.9296627, -3.928551, 1, 0, 0, 1, 1,
-2.484751, -0.1187166, -1.247591, 1, 0, 0, 1, 1,
-2.433374, 0.1393263, -1.973112, 1, 0, 0, 1, 1,
-2.386424, 0.7741811, -1.49488, 1, 0, 0, 1, 1,
-2.363536, -2.124141, -1.938642, 0, 0, 0, 1, 1,
-2.300099, -1.614789, -2.057844, 0, 0, 0, 1, 1,
-2.294175, -1.234869, -4.03485, 0, 0, 0, 1, 1,
-2.245516, -2.372895, -1.492096, 0, 0, 0, 1, 1,
-2.226882, 0.2237018, -3.49614, 0, 0, 0, 1, 1,
-2.208342, 0.2827908, -2.91035, 0, 0, 0, 1, 1,
-2.177653, -1.311352, -2.528396, 0, 0, 0, 1, 1,
-2.142595, 1.734943, -2.165858, 1, 1, 1, 1, 1,
-2.135979, -0.8135788, -1.876009, 1, 1, 1, 1, 1,
-2.127617, 0.9090461, -1.830731, 1, 1, 1, 1, 1,
-2.100567, 0.7522954, -0.7199255, 1, 1, 1, 1, 1,
-2.09909, -0.01835266, -2.9132, 1, 1, 1, 1, 1,
-2.096296, -0.1214358, -0.9738711, 1, 1, 1, 1, 1,
-2.053192, -0.6266699, -1.780494, 1, 1, 1, 1, 1,
-2.044746, 1.177151, -1.950656, 1, 1, 1, 1, 1,
-2.044058, -1.295761, -2.820026, 1, 1, 1, 1, 1,
-2.032287, -0.1876236, -1.265252, 1, 1, 1, 1, 1,
-2.023012, 1.834884, -1.644484, 1, 1, 1, 1, 1,
-1.996387, -0.2044605, -0.6424069, 1, 1, 1, 1, 1,
-1.987544, -0.1632438, -0.7420464, 1, 1, 1, 1, 1,
-1.978815, 0.8565166, -0.7396669, 1, 1, 1, 1, 1,
-1.959688, 0.6244562, -1.843862, 1, 1, 1, 1, 1,
-1.958154, -1.245947, -2.102471, 0, 0, 1, 1, 1,
-1.955776, -0.6450203, -1.921115, 1, 0, 0, 1, 1,
-1.917119, -1.063246, -2.70266, 1, 0, 0, 1, 1,
-1.910297, 0.05401583, -1.428284, 1, 0, 0, 1, 1,
-1.891931, 0.1562852, -1.175457, 1, 0, 0, 1, 1,
-1.886147, -1.854327, -3.753041, 1, 0, 0, 1, 1,
-1.859455, 0.05354446, -1.882211, 0, 0, 0, 1, 1,
-1.850591, -1.059572, -1.979939, 0, 0, 0, 1, 1,
-1.850361, 0.4057724, -2.145039, 0, 0, 0, 1, 1,
-1.833421, -0.6527354, -2.537232, 0, 0, 0, 1, 1,
-1.821249, 1.123541, -0.6640885, 0, 0, 0, 1, 1,
-1.817383, 0.5705439, -2.014539, 0, 0, 0, 1, 1,
-1.81266, -0.4265893, -3.788815, 0, 0, 0, 1, 1,
-1.80347, 0.7103357, -0.04320303, 1, 1, 1, 1, 1,
-1.732885, -0.9700786, -2.128264, 1, 1, 1, 1, 1,
-1.730327, -0.5180344, -0.05365, 1, 1, 1, 1, 1,
-1.708823, 0.9439656, -2.991949, 1, 1, 1, 1, 1,
-1.703359, -0.08387667, -3.371248, 1, 1, 1, 1, 1,
-1.70151, 0.1650494, -1.8354, 1, 1, 1, 1, 1,
-1.678705, -1.096017, -3.175176, 1, 1, 1, 1, 1,
-1.676582, 0.2154959, -0.5858126, 1, 1, 1, 1, 1,
-1.656532, 0.4775426, -0.478271, 1, 1, 1, 1, 1,
-1.65631, -1.231477, -1.0341, 1, 1, 1, 1, 1,
-1.646061, -0.09641602, -2.511507, 1, 1, 1, 1, 1,
-1.629497, 0.9100484, 2.529461, 1, 1, 1, 1, 1,
-1.624736, -0.05341564, -2.051446, 1, 1, 1, 1, 1,
-1.623076, -2.302852, -2.296036, 1, 1, 1, 1, 1,
-1.61145, 1.079399, -1.6069, 1, 1, 1, 1, 1,
-1.589616, -2.377827, -2.94557, 0, 0, 1, 1, 1,
-1.587341, 1.228796, -1.908308, 1, 0, 0, 1, 1,
-1.58134, 0.1984839, -2.756032, 1, 0, 0, 1, 1,
-1.579496, 0.7899589, -0.7455393, 1, 0, 0, 1, 1,
-1.577236, 0.8515158, -0.1138628, 1, 0, 0, 1, 1,
-1.571661, 0.3448694, -0.4264857, 1, 0, 0, 1, 1,
-1.564846, 1.385699, -2.13475, 0, 0, 0, 1, 1,
-1.558288, 0.111761, -2.577035, 0, 0, 0, 1, 1,
-1.552151, -0.4694192, -1.129506, 0, 0, 0, 1, 1,
-1.550031, 0.912165, -1.256425, 0, 0, 0, 1, 1,
-1.533387, -2.503013, -2.896403, 0, 0, 0, 1, 1,
-1.502892, 1.019086, 0.3015858, 0, 0, 0, 1, 1,
-1.476753, 0.5138296, -0.5216651, 0, 0, 0, 1, 1,
-1.472262, 0.001661936, -1.452477, 1, 1, 1, 1, 1,
-1.468118, -0.1545778, -0.7020296, 1, 1, 1, 1, 1,
-1.461527, -1.442485, -2.311281, 1, 1, 1, 1, 1,
-1.45829, -0.6029836, -1.272118, 1, 1, 1, 1, 1,
-1.450813, 1.665436, 0.4486474, 1, 1, 1, 1, 1,
-1.443289, 1.367198, -2.482443, 1, 1, 1, 1, 1,
-1.44184, -0.3119049, -1.310605, 1, 1, 1, 1, 1,
-1.434266, 0.3076485, -1.950283, 1, 1, 1, 1, 1,
-1.420487, -0.1896183, -0.2847134, 1, 1, 1, 1, 1,
-1.409582, -0.5610005, -2.044397, 1, 1, 1, 1, 1,
-1.396528, -0.3434492, -1.034053, 1, 1, 1, 1, 1,
-1.385973, -0.8175993, -1.129266, 1, 1, 1, 1, 1,
-1.385897, -0.9775445, -2.501792, 1, 1, 1, 1, 1,
-1.384064, 0.5458394, -0.4647291, 1, 1, 1, 1, 1,
-1.378432, -0.04473869, -0.5755848, 1, 1, 1, 1, 1,
-1.373975, -0.9142327, -2.011683, 0, 0, 1, 1, 1,
-1.369266, -0.6664051, -1.162436, 1, 0, 0, 1, 1,
-1.367097, 0.3424315, -1.660242, 1, 0, 0, 1, 1,
-1.366855, 0.09491877, -1.74309, 1, 0, 0, 1, 1,
-1.364472, 1.932117, -0.6094152, 1, 0, 0, 1, 1,
-1.355754, 1.998627, -1.148494, 1, 0, 0, 1, 1,
-1.354098, 0.9464757, -0.8874874, 0, 0, 0, 1, 1,
-1.341656, -0.4550241, -0.8512446, 0, 0, 0, 1, 1,
-1.333843, 0.5412857, -1.595962, 0, 0, 0, 1, 1,
-1.3252, -0.2303293, -2.817394, 0, 0, 0, 1, 1,
-1.315208, 1.062584, -1.166039, 0, 0, 0, 1, 1,
-1.311748, -0.02059176, -0.6960298, 0, 0, 0, 1, 1,
-1.305632, 2.422285, 0.1478197, 0, 0, 0, 1, 1,
-1.29783, 0.5884406, -1.154542, 1, 1, 1, 1, 1,
-1.297269, -0.7614221, -2.49186, 1, 1, 1, 1, 1,
-1.292913, -1.311166, -3.365084, 1, 1, 1, 1, 1,
-1.292716, 0.137725, -3.101379, 1, 1, 1, 1, 1,
-1.29229, -0.09082199, -1.334896, 1, 1, 1, 1, 1,
-1.290813, 1.431519, -0.3471966, 1, 1, 1, 1, 1,
-1.285741, 1.221181, -1.238322, 1, 1, 1, 1, 1,
-1.273579, -0.3721256, -3.660151, 1, 1, 1, 1, 1,
-1.272726, 0.1389704, -0.537533, 1, 1, 1, 1, 1,
-1.270264, -1.119832, -2.153715, 1, 1, 1, 1, 1,
-1.268745, -0.2120425, -1.047379, 1, 1, 1, 1, 1,
-1.26171, -0.9463475, -3.139243, 1, 1, 1, 1, 1,
-1.260922, 0.5774307, -2.587487, 1, 1, 1, 1, 1,
-1.250701, 2.20476, 1.418073, 1, 1, 1, 1, 1,
-1.249155, -0.9609666, -3.414377, 1, 1, 1, 1, 1,
-1.245011, -0.692315, -2.489483, 0, 0, 1, 1, 1,
-1.233495, -0.3766984, -1.988511, 1, 0, 0, 1, 1,
-1.233144, -0.7393193, -2.645313, 1, 0, 0, 1, 1,
-1.23008, -0.3709841, -0.7990426, 1, 0, 0, 1, 1,
-1.222056, 1.172012, -0.5829359, 1, 0, 0, 1, 1,
-1.22157, -0.526161, 0.1704965, 1, 0, 0, 1, 1,
-1.198699, 1.56928, 1.875292, 0, 0, 0, 1, 1,
-1.183782, 0.5641796, -0.4400229, 0, 0, 0, 1, 1,
-1.180627, -1.839022, -0.9664692, 0, 0, 0, 1, 1,
-1.17944, 0.8440031, -1.675779, 0, 0, 0, 1, 1,
-1.175323, -0.9581639, -3.676547, 0, 0, 0, 1, 1,
-1.168433, -2.064949, -1.530605, 0, 0, 0, 1, 1,
-1.167132, -0.7142676, -4.897681, 0, 0, 0, 1, 1,
-1.166407, 1.672458, -1.179294, 1, 1, 1, 1, 1,
-1.161823, -0.3454837, -1.055689, 1, 1, 1, 1, 1,
-1.1608, -0.4067433, -1.493176, 1, 1, 1, 1, 1,
-1.159917, 0.2801102, -0.2968606, 1, 1, 1, 1, 1,
-1.158044, 0.1262814, -0.7571082, 1, 1, 1, 1, 1,
-1.137178, 0.630584, -1.050223, 1, 1, 1, 1, 1,
-1.131906, -1.358053, -2.595944, 1, 1, 1, 1, 1,
-1.131444, 0.2934726, -1.118959, 1, 1, 1, 1, 1,
-1.120438, -2.347547, -2.366178, 1, 1, 1, 1, 1,
-1.118413, 0.2260615, -1.440229, 1, 1, 1, 1, 1,
-1.104008, -0.3052144, -0.9031885, 1, 1, 1, 1, 1,
-1.099684, -2.611269, -2.701504, 1, 1, 1, 1, 1,
-1.097618, -0.1982816, -3.404135, 1, 1, 1, 1, 1,
-1.093765, -0.02675109, 0.01804776, 1, 1, 1, 1, 1,
-1.087018, -1.428462, -1.136475, 1, 1, 1, 1, 1,
-1.081612, 1.857729, 0.2666893, 0, 0, 1, 1, 1,
-1.081085, -0.06181037, -3.759614, 1, 0, 0, 1, 1,
-1.075248, 0.5350862, -2.009772, 1, 0, 0, 1, 1,
-1.074275, 0.778289, -3.309708, 1, 0, 0, 1, 1,
-1.063724, 0.7435612, -1.031874, 1, 0, 0, 1, 1,
-1.055808, 0.3547811, -1.291194, 1, 0, 0, 1, 1,
-1.051085, -0.1457647, -2.419992, 0, 0, 0, 1, 1,
-1.049588, 2.017958, -0.9219826, 0, 0, 0, 1, 1,
-1.040956, -0.1248386, -1.534244, 0, 0, 0, 1, 1,
-1.037378, -1.270531, -2.821955, 0, 0, 0, 1, 1,
-1.034925, -0.1703774, -2.001993, 0, 0, 0, 1, 1,
-1.031117, -0.8532113, -2.040733, 0, 0, 0, 1, 1,
-1.024986, -0.003975638, -1.387172, 0, 0, 0, 1, 1,
-1.020289, 0.1692493, 1.235144, 1, 1, 1, 1, 1,
-1.020057, -0.1121157, -1.131267, 1, 1, 1, 1, 1,
-1.014845, 0.9690799, 0.1581227, 1, 1, 1, 1, 1,
-1.003226, 0.3407301, -2.534032, 1, 1, 1, 1, 1,
-0.9957626, -1.383439, -2.380034, 1, 1, 1, 1, 1,
-0.9952194, -0.6176974, -2.644985, 1, 1, 1, 1, 1,
-0.9949908, -1.604793, -1.394637, 1, 1, 1, 1, 1,
-0.9947135, -0.8641174, -4.073901, 1, 1, 1, 1, 1,
-0.9836785, -0.9237069, -2.918074, 1, 1, 1, 1, 1,
-0.9820216, -0.3031428, -1.041696, 1, 1, 1, 1, 1,
-0.9812585, -0.2338936, -1.413427, 1, 1, 1, 1, 1,
-0.980775, 0.5234113, -1.795962, 1, 1, 1, 1, 1,
-0.9767164, 0.1134662, -1.494626, 1, 1, 1, 1, 1,
-0.9766496, -0.2966122, -1.889977, 1, 1, 1, 1, 1,
-0.9755335, 0.1464608, -0.4170283, 1, 1, 1, 1, 1,
-0.9755142, -1.571995, -2.654291, 0, 0, 1, 1, 1,
-0.9752559, -0.5417066, -1.663711, 1, 0, 0, 1, 1,
-0.9727473, -1.833237, -2.980018, 1, 0, 0, 1, 1,
-0.968291, 0.5921994, -0.3826858, 1, 0, 0, 1, 1,
-0.9554976, 0.4452032, -2.202497, 1, 0, 0, 1, 1,
-0.954883, -0.4409119, -2.399498, 1, 0, 0, 1, 1,
-0.9499087, 0.5303893, -1.260864, 0, 0, 0, 1, 1,
-0.9474068, -0.5512229, -2.814403, 0, 0, 0, 1, 1,
-0.9469026, -0.2598764, 0.6622955, 0, 0, 0, 1, 1,
-0.9441144, 0.7267943, -1.856435, 0, 0, 0, 1, 1,
-0.9440799, -0.3928535, -2.213274, 0, 0, 0, 1, 1,
-0.9411985, -1.089701, -2.275214, 0, 0, 0, 1, 1,
-0.9374325, -0.9527333, -3.176277, 0, 0, 0, 1, 1,
-0.9313633, 2.635347, -0.7176614, 1, 1, 1, 1, 1,
-0.9276167, -0.5712031, -2.888103, 1, 1, 1, 1, 1,
-0.9247559, -1.62876, -2.751777, 1, 1, 1, 1, 1,
-0.9200447, -0.2267504, -1.098518, 1, 1, 1, 1, 1,
-0.9152138, 1.716649, -1.574602, 1, 1, 1, 1, 1,
-0.9127727, -0.09141063, -0.7156929, 1, 1, 1, 1, 1,
-0.9093812, -1.802091, -3.491129, 1, 1, 1, 1, 1,
-0.9039063, 0.6526787, -3.195799, 1, 1, 1, 1, 1,
-0.903574, -1.585431, -3.176078, 1, 1, 1, 1, 1,
-0.9016256, 0.3491691, -1.556736, 1, 1, 1, 1, 1,
-0.9010556, -0.8555219, -1.373152, 1, 1, 1, 1, 1,
-0.8989322, -1.783649, -0.950586, 1, 1, 1, 1, 1,
-0.8970953, -1.301125, -2.096842, 1, 1, 1, 1, 1,
-0.8944791, 2.098712, -1.662225, 1, 1, 1, 1, 1,
-0.8896993, 0.06720147, -1.283268, 1, 1, 1, 1, 1,
-0.8884484, 0.6411734, -3.131174, 0, 0, 1, 1, 1,
-0.8866555, 0.7522575, -1.698547, 1, 0, 0, 1, 1,
-0.8862118, -0.5496334, -1.000446, 1, 0, 0, 1, 1,
-0.8844667, 1.198433, 0.9921157, 1, 0, 0, 1, 1,
-0.8843326, 0.9818892, -1.786379, 1, 0, 0, 1, 1,
-0.8833302, 1.103547, -1.357202, 1, 0, 0, 1, 1,
-0.8822277, -0.4212022, -2.896935, 0, 0, 0, 1, 1,
-0.8812001, -0.9418339, -2.272869, 0, 0, 0, 1, 1,
-0.8746105, 0.02477372, -1.398732, 0, 0, 0, 1, 1,
-0.8722079, -1.138333, -2.085086, 0, 0, 0, 1, 1,
-0.8701403, -1.607594, -2.974714, 0, 0, 0, 1, 1,
-0.8633449, -1.736678, -3.147939, 0, 0, 0, 1, 1,
-0.857274, 2.329504, -0.2790656, 0, 0, 0, 1, 1,
-0.8569543, 0.3111094, -2.515254, 1, 1, 1, 1, 1,
-0.8504645, -0.3330394, -2.845806, 1, 1, 1, 1, 1,
-0.8451675, 0.1727753, -0.004368335, 1, 1, 1, 1, 1,
-0.8346002, 0.8000773, -0.1990738, 1, 1, 1, 1, 1,
-0.8289711, -0.2823711, -1.1301, 1, 1, 1, 1, 1,
-0.8266271, 0.9642205, -1.795224, 1, 1, 1, 1, 1,
-0.8246336, -0.219196, -0.9170339, 1, 1, 1, 1, 1,
-0.8241717, 1.237314, -0.4929201, 1, 1, 1, 1, 1,
-0.8240453, 2.399276, -1.157176, 1, 1, 1, 1, 1,
-0.8238327, -0.113596, -2.08333, 1, 1, 1, 1, 1,
-0.8223721, -0.2586412, -3.631713, 1, 1, 1, 1, 1,
-0.8133521, -0.8271822, -0.6895254, 1, 1, 1, 1, 1,
-0.809278, 2.521282, -1.682074, 1, 1, 1, 1, 1,
-0.8048187, -1.151262, -2.126286, 1, 1, 1, 1, 1,
-0.8009394, 2.027389, -0.4797857, 1, 1, 1, 1, 1,
-0.7979115, 1.356851, -1.7685, 0, 0, 1, 1, 1,
-0.7966452, -2.20213, -1.345976, 1, 0, 0, 1, 1,
-0.7938135, -0.0735561, -0.4975808, 1, 0, 0, 1, 1,
-0.7913822, 1.211171, -1.824897, 1, 0, 0, 1, 1,
-0.789749, 0.6306143, 1.079834, 1, 0, 0, 1, 1,
-0.788331, -1.117047, -4.017438, 1, 0, 0, 1, 1,
-0.7868589, 0.7293555, 0.2620439, 0, 0, 0, 1, 1,
-0.7803438, 0.2709603, -3.337949, 0, 0, 0, 1, 1,
-0.7687856, -0.1516324, -0.9041679, 0, 0, 0, 1, 1,
-0.768428, -0.3811355, -1.358022, 0, 0, 0, 1, 1,
-0.7643934, 0.5629594, -0.9075689, 0, 0, 0, 1, 1,
-0.7639819, -0.5320449, -3.030491, 0, 0, 0, 1, 1,
-0.7629982, 0.80842, -0.5219424, 0, 0, 0, 1, 1,
-0.7576711, -0.07250078, -2.065578, 1, 1, 1, 1, 1,
-0.7560764, 1.398336, -0.9408026, 1, 1, 1, 1, 1,
-0.7560076, 0.8634418, -0.942345, 1, 1, 1, 1, 1,
-0.7550152, 0.5434134, -1.600437, 1, 1, 1, 1, 1,
-0.751657, 0.7293376, -1.421052, 1, 1, 1, 1, 1,
-0.7492965, 0.1998971, -0.9459726, 1, 1, 1, 1, 1,
-0.7485085, -0.8701798, -1.381894, 1, 1, 1, 1, 1,
-0.7484697, -0.4955485, -3.395519, 1, 1, 1, 1, 1,
-0.7480519, -0.09169654, -1.699683, 1, 1, 1, 1, 1,
-0.7439661, 0.4005928, -1.835838, 1, 1, 1, 1, 1,
-0.7385224, -2.081938, -2.719247, 1, 1, 1, 1, 1,
-0.7358134, -0.6167831, -2.761279, 1, 1, 1, 1, 1,
-0.7172215, -0.3124669, -1.566729, 1, 1, 1, 1, 1,
-0.7140943, -1.053306, -2.737234, 1, 1, 1, 1, 1,
-0.713442, -0.03533132, -0.9972116, 1, 1, 1, 1, 1,
-0.7113584, -0.5548834, -1.72649, 0, 0, 1, 1, 1,
-0.7083976, 1.717453, -0.2172225, 1, 0, 0, 1, 1,
-0.6939875, 0.3132786, -2.015017, 1, 0, 0, 1, 1,
-0.6895316, -0.7450731, -2.044696, 1, 0, 0, 1, 1,
-0.6878201, 0.8845102, 0.2732958, 1, 0, 0, 1, 1,
-0.6867684, -0.6650681, -2.868973, 1, 0, 0, 1, 1,
-0.6810058, 1.437165, -1.63489, 0, 0, 0, 1, 1,
-0.6773594, 1.608124, -0.3926269, 0, 0, 0, 1, 1,
-0.6756392, 1.164769, -2.464837, 0, 0, 0, 1, 1,
-0.6733343, 0.1144056, -1.435358, 0, 0, 0, 1, 1,
-0.671289, 0.702069, 0.2054649, 0, 0, 0, 1, 1,
-0.6705238, 1.546059, -0.2547047, 0, 0, 0, 1, 1,
-0.6702207, -0.9901119, -2.054174, 0, 0, 0, 1, 1,
-0.6661363, 0.3662611, -1.582852, 1, 1, 1, 1, 1,
-0.6649025, -0.05490481, -0.05673493, 1, 1, 1, 1, 1,
-0.664427, 0.1506139, -3.048826, 1, 1, 1, 1, 1,
-0.6600894, -0.9022954, -2.975219, 1, 1, 1, 1, 1,
-0.6545236, 1.083962, -0.7683926, 1, 1, 1, 1, 1,
-0.6529912, 0.4910292, -1.505687, 1, 1, 1, 1, 1,
-0.6455147, 1.569826, -1.335608, 1, 1, 1, 1, 1,
-0.6410015, 0.7936, 0.3086836, 1, 1, 1, 1, 1,
-0.6355026, 0.2765401, -0.9012467, 1, 1, 1, 1, 1,
-0.6282942, 0.1624885, 0.3499136, 1, 1, 1, 1, 1,
-0.6281078, 1.292485, -2.136951, 1, 1, 1, 1, 1,
-0.6278929, 1.271854, 0.2360502, 1, 1, 1, 1, 1,
-0.6267682, 0.09956554, -0.7858061, 1, 1, 1, 1, 1,
-0.6256207, 0.5661723, -1.867207, 1, 1, 1, 1, 1,
-0.6231512, 0.440802, -1.354576, 1, 1, 1, 1, 1,
-0.6229722, -0.5380142, -0.2006224, 0, 0, 1, 1, 1,
-0.6225125, 0.006899506, -0.3263873, 1, 0, 0, 1, 1,
-0.621471, -0.3576542, -1.676473, 1, 0, 0, 1, 1,
-0.6046596, 0.2399686, 0.9623731, 1, 0, 0, 1, 1,
-0.6041162, 0.292369, -2.859188, 1, 0, 0, 1, 1,
-0.6035589, 0.5057934, -0.6730229, 1, 0, 0, 1, 1,
-0.6022193, 0.1381547, 0.05750985, 0, 0, 0, 1, 1,
-0.600048, -0.9851395, -3.029688, 0, 0, 0, 1, 1,
-0.5982877, 0.09092751, -3.342374, 0, 0, 0, 1, 1,
-0.5979486, 1.143731, -1.840108, 0, 0, 0, 1, 1,
-0.5974739, 1.451235, -0.09079962, 0, 0, 0, 1, 1,
-0.5959147, -1.482769, -3.664845, 0, 0, 0, 1, 1,
-0.5758125, 0.06701308, -2.344297, 0, 0, 0, 1, 1,
-0.5669919, -1.326387, -0.8584308, 1, 1, 1, 1, 1,
-0.5660509, -0.7341082, -1.181646, 1, 1, 1, 1, 1,
-0.563603, 1.917287, 0.2221895, 1, 1, 1, 1, 1,
-0.5593443, 1.390963, -0.7963277, 1, 1, 1, 1, 1,
-0.5528527, 2.191442, -0.0004474577, 1, 1, 1, 1, 1,
-0.5478064, -2.085217, -1.780648, 1, 1, 1, 1, 1,
-0.5345113, 0.3022222, 1.267036, 1, 1, 1, 1, 1,
-0.5339437, -0.1242725, -1.201916, 1, 1, 1, 1, 1,
-0.5292274, 0.2298774, -2.285608, 1, 1, 1, 1, 1,
-0.5258431, -0.1701702, -1.705487, 1, 1, 1, 1, 1,
-0.5255674, 0.5992916, -1.51745, 1, 1, 1, 1, 1,
-0.5215273, -0.7137725, -2.954131, 1, 1, 1, 1, 1,
-0.5188699, 0.8657136, -0.9517177, 1, 1, 1, 1, 1,
-0.515631, -1.556722, -4.491176, 1, 1, 1, 1, 1,
-0.5123764, -0.3408829, -3.820981, 1, 1, 1, 1, 1,
-0.5050725, -0.9701385, -2.520843, 0, 0, 1, 1, 1,
-0.5043384, -0.232132, -0.9163526, 1, 0, 0, 1, 1,
-0.5011872, -0.7478566, -3.810536, 1, 0, 0, 1, 1,
-0.4946751, 1.486382, -0.6555262, 1, 0, 0, 1, 1,
-0.4942605, -2.823414, -2.618391, 1, 0, 0, 1, 1,
-0.4904942, -0.9994097, -3.163872, 1, 0, 0, 1, 1,
-0.4892734, 0.06994616, -1.513632, 0, 0, 0, 1, 1,
-0.4878213, 0.768724, 0.7173362, 0, 0, 0, 1, 1,
-0.4872393, 0.07011303, -2.03441, 0, 0, 0, 1, 1,
-0.4866319, 0.7548618, -1.654617, 0, 0, 0, 1, 1,
-0.4859809, -1.034407, -2.359259, 0, 0, 0, 1, 1,
-0.4824357, -0.9797345, -3.597783, 0, 0, 0, 1, 1,
-0.4789585, 0.5274853, -1.366287, 0, 0, 0, 1, 1,
-0.4781889, -1.17259, -2.237284, 1, 1, 1, 1, 1,
-0.4768186, 1.043422, -0.1586448, 1, 1, 1, 1, 1,
-0.4754216, 1.198374, -0.0858359, 1, 1, 1, 1, 1,
-0.4740871, 1.499794, 1.682009, 1, 1, 1, 1, 1,
-0.4668303, 0.4904981, -1.186017, 1, 1, 1, 1, 1,
-0.4667308, -0.6286426, -3.395548, 1, 1, 1, 1, 1,
-0.4636031, -0.9505457, -4.182604, 1, 1, 1, 1, 1,
-0.4602367, -1.083197, -4.379913, 1, 1, 1, 1, 1,
-0.4592066, 0.8907735, -1.755674, 1, 1, 1, 1, 1,
-0.4526649, 0.2798464, 0.1748638, 1, 1, 1, 1, 1,
-0.4522644, -0.7622286, -1.948734, 1, 1, 1, 1, 1,
-0.451927, -0.1452783, -0.272086, 1, 1, 1, 1, 1,
-0.4469476, 1.309643, -0.8605794, 1, 1, 1, 1, 1,
-0.4460762, 0.39955, -1.354247, 1, 1, 1, 1, 1,
-0.442472, -1.463115, -2.452184, 1, 1, 1, 1, 1,
-0.4417216, -1.69041, -2.913345, 0, 0, 1, 1, 1,
-0.4387275, -0.8485249, -2.098554, 1, 0, 0, 1, 1,
-0.438536, -2.44875, -2.389898, 1, 0, 0, 1, 1,
-0.4383626, -0.7042583, -1.953312, 1, 0, 0, 1, 1,
-0.4331432, -1.679722, -2.584753, 1, 0, 0, 1, 1,
-0.4318915, 1.094898, 0.2071669, 1, 0, 0, 1, 1,
-0.4283756, 2.037353, -0.2957821, 0, 0, 0, 1, 1,
-0.4281841, 0.2189179, 0.1718796, 0, 0, 0, 1, 1,
-0.4268489, -0.2831573, -3.230313, 0, 0, 0, 1, 1,
-0.4243771, -0.5494795, -2.047638, 0, 0, 0, 1, 1,
-0.4242842, -0.2917311, -2.05282, 0, 0, 0, 1, 1,
-0.4237444, 0.6567838, -0.4295506, 0, 0, 0, 1, 1,
-0.4154702, -0.8028584, -1.566471, 0, 0, 0, 1, 1,
-0.415171, 0.3127671, -2.633621, 1, 1, 1, 1, 1,
-0.4112082, -0.8278455, -1.637195, 1, 1, 1, 1, 1,
-0.4099187, 1.482526, -0.2081205, 1, 1, 1, 1, 1,
-0.409772, -2.39364, -2.46464, 1, 1, 1, 1, 1,
-0.4070494, 0.5715772, -0.7545246, 1, 1, 1, 1, 1,
-0.4066016, 1.004398, -0.4677822, 1, 1, 1, 1, 1,
-0.4013289, 1.766539, 0.04163788, 1, 1, 1, 1, 1,
-0.400823, -0.101177, 0.2085405, 1, 1, 1, 1, 1,
-0.3955168, -0.4365567, -0.8136945, 1, 1, 1, 1, 1,
-0.3942887, -2.042152, -1.884999, 1, 1, 1, 1, 1,
-0.3903983, -1.232055, -2.692276, 1, 1, 1, 1, 1,
-0.3844878, 0.8746488, -0.6774969, 1, 1, 1, 1, 1,
-0.3841053, -1.638854, -2.617085, 1, 1, 1, 1, 1,
-0.3799584, -0.02414135, -1.374425, 1, 1, 1, 1, 1,
-0.3775533, -1.108661, -2.394893, 1, 1, 1, 1, 1,
-0.3768816, 0.824517, 0.449667, 0, 0, 1, 1, 1,
-0.376852, 0.307323, -2.305911, 1, 0, 0, 1, 1,
-0.3766776, -0.7741125, -3.03549, 1, 0, 0, 1, 1,
-0.3752274, 1.012954, -0.6920084, 1, 0, 0, 1, 1,
-0.3685212, -0.03334814, -0.8016168, 1, 0, 0, 1, 1,
-0.3679024, -1.014005, -2.865074, 1, 0, 0, 1, 1,
-0.3656381, 0.4733255, -0.2024094, 0, 0, 0, 1, 1,
-0.3572861, -0.6228007, -1.342516, 0, 0, 0, 1, 1,
-0.3532001, -0.1050297, -1.45482, 0, 0, 0, 1, 1,
-0.3531322, -0.5050281, -2.030831, 0, 0, 0, 1, 1,
-0.3487971, 1.00593, 0.3231257, 0, 0, 0, 1, 1,
-0.3448561, 1.252485, 0.3846431, 0, 0, 0, 1, 1,
-0.3422266, -0.7591242, -2.067906, 0, 0, 0, 1, 1,
-0.340618, 0.7290887, 0.1206907, 1, 1, 1, 1, 1,
-0.3299917, -1.38386, -3.71409, 1, 1, 1, 1, 1,
-0.3298718, 0.4736511, -1.3177, 1, 1, 1, 1, 1,
-0.3298174, 1.015805, -2.329848, 1, 1, 1, 1, 1,
-0.3293221, -1.112363, -1.714407, 1, 1, 1, 1, 1,
-0.3290416, -0.1509959, -1.234835, 1, 1, 1, 1, 1,
-0.3250709, 0.1818487, -1.404636, 1, 1, 1, 1, 1,
-0.3103498, 0.1842594, -1.342847, 1, 1, 1, 1, 1,
-0.3064681, 0.5971135, -1.100072, 1, 1, 1, 1, 1,
-0.3042796, -0.6344214, -0.8890747, 1, 1, 1, 1, 1,
-0.3020046, 1.458015, 0.7909341, 1, 1, 1, 1, 1,
-0.3009828, -1.387236, -3.376491, 1, 1, 1, 1, 1,
-0.2991966, 0.5842168, -1.556097, 1, 1, 1, 1, 1,
-0.2991478, -0.3139336, -2.370994, 1, 1, 1, 1, 1,
-0.2921492, -1.309553, -3.941087, 1, 1, 1, 1, 1,
-0.2889762, -0.8736672, -4.910081, 0, 0, 1, 1, 1,
-0.2885133, -0.742096, -2.288767, 1, 0, 0, 1, 1,
-0.2860214, -1.374371, -3.545562, 1, 0, 0, 1, 1,
-0.2841499, 1.391228, 0.1620908, 1, 0, 0, 1, 1,
-0.2825482, -0.685179, -3.40119, 1, 0, 0, 1, 1,
-0.281698, -0.5540514, -2.288492, 1, 0, 0, 1, 1,
-0.2816277, 0.4839819, -1.237931, 0, 0, 0, 1, 1,
-0.2805057, 0.4138855, -1.246566, 0, 0, 0, 1, 1,
-0.2803657, -0.1329832, -1.384238, 0, 0, 0, 1, 1,
-0.2800032, -0.314801, -0.8652862, 0, 0, 0, 1, 1,
-0.2744451, -1.066745, -3.729324, 0, 0, 0, 1, 1,
-0.2715552, 1.083442, -1.174135, 0, 0, 0, 1, 1,
-0.2678851, 0.8669529, -0.5310066, 0, 0, 0, 1, 1,
-0.2670188, -1.694993, -3.426083, 1, 1, 1, 1, 1,
-0.2639918, -0.7390236, -3.54715, 1, 1, 1, 1, 1,
-0.263481, 1.124488, 0.2587074, 1, 1, 1, 1, 1,
-0.2606947, 1.010832, -0.8003048, 1, 1, 1, 1, 1,
-0.2575655, -0.556713, -1.870758, 1, 1, 1, 1, 1,
-0.2558016, 0.9323366, -2.05417, 1, 1, 1, 1, 1,
-0.2458015, -0.9243495, -2.242349, 1, 1, 1, 1, 1,
-0.2436768, -0.3310475, -2.490823, 1, 1, 1, 1, 1,
-0.2406944, 1.172057, -0.4194873, 1, 1, 1, 1, 1,
-0.2404617, 0.6436867, 0.2945436, 1, 1, 1, 1, 1,
-0.2403216, 0.119046, -1.420733, 1, 1, 1, 1, 1,
-0.2390756, 0.01036558, -1.591516, 1, 1, 1, 1, 1,
-0.2380646, 1.316043, -2.407376, 1, 1, 1, 1, 1,
-0.2370571, 0.1910471, -0.5383896, 1, 1, 1, 1, 1,
-0.2355838, -1.044774, -3.845253, 1, 1, 1, 1, 1,
-0.2328592, -0.1858467, -1.700956, 0, 0, 1, 1, 1,
-0.2320876, 1.743886, 1.111571, 1, 0, 0, 1, 1,
-0.2320698, 0.4993785, -1.450693, 1, 0, 0, 1, 1,
-0.226963, -0.3351539, -1.820479, 1, 0, 0, 1, 1,
-0.2255139, 1.187671, -1.40854, 1, 0, 0, 1, 1,
-0.2189342, -0.2497184, -3.343717, 1, 0, 0, 1, 1,
-0.2183881, -2.042602, -4.365115, 0, 0, 0, 1, 1,
-0.2086323, 1.18763, 0.7645981, 0, 0, 0, 1, 1,
-0.2070132, 0.2784516, -1.613228, 0, 0, 0, 1, 1,
-0.2038635, -0.6017429, -3.384586, 0, 0, 0, 1, 1,
-0.2023773, -0.7357936, -2.480225, 0, 0, 0, 1, 1,
-0.1979261, 0.5517824, -1.971154, 0, 0, 0, 1, 1,
-0.1976259, 0.2246836, -2.919398, 0, 0, 0, 1, 1,
-0.1902019, 0.2336545, 0.2473983, 1, 1, 1, 1, 1,
-0.1896391, -0.5086079, -3.343142, 1, 1, 1, 1, 1,
-0.1842271, 1.615587, -0.7102447, 1, 1, 1, 1, 1,
-0.1810257, -1.224317, -2.446292, 1, 1, 1, 1, 1,
-0.1800892, -1.552961, -3.925013, 1, 1, 1, 1, 1,
-0.1752251, 0.02937124, -2.504567, 1, 1, 1, 1, 1,
-0.1710786, -0.4344302, -2.692142, 1, 1, 1, 1, 1,
-0.1685068, -0.7955491, -5.474355, 1, 1, 1, 1, 1,
-0.1669392, -1.545263, -3.676684, 1, 1, 1, 1, 1,
-0.163498, -0.2181247, -1.650254, 1, 1, 1, 1, 1,
-0.1545423, 0.560861, 0.9363127, 1, 1, 1, 1, 1,
-0.1498379, -0.4740011, -2.145859, 1, 1, 1, 1, 1,
-0.1470894, -0.3382511, -4.176095, 1, 1, 1, 1, 1,
-0.1436641, 0.4196348, 0.6452101, 1, 1, 1, 1, 1,
-0.1434842, -0.1210447, -1.720652, 1, 1, 1, 1, 1,
-0.1409652, -0.6944364, -2.691334, 0, 0, 1, 1, 1,
-0.1387877, 0.4134099, -1.555686, 1, 0, 0, 1, 1,
-0.1373897, 0.5057487, -0.982271, 1, 0, 0, 1, 1,
-0.1353085, -0.3584835, -4.362875, 1, 0, 0, 1, 1,
-0.1351821, -0.3615796, -1.195703, 1, 0, 0, 1, 1,
-0.1343219, -1.280333, -3.264967, 1, 0, 0, 1, 1,
-0.1323206, 0.4654439, 1.751028, 0, 0, 0, 1, 1,
-0.1316033, -1.630063, -2.415545, 0, 0, 0, 1, 1,
-0.1304216, -0.5531778, -4.473912, 0, 0, 0, 1, 1,
-0.127828, 0.6000972, -0.498207, 0, 0, 0, 1, 1,
-0.1184062, 1.091706, -0.1979551, 0, 0, 0, 1, 1,
-0.1176833, -0.01640468, -1.209344, 0, 0, 0, 1, 1,
-0.1175232, 2.132135, -0.7898713, 0, 0, 0, 1, 1,
-0.1166703, 0.3164546, -0.2705548, 1, 1, 1, 1, 1,
-0.114902, -1.593949, -4.636619, 1, 1, 1, 1, 1,
-0.1123766, 0.1918587, -0.3843878, 1, 1, 1, 1, 1,
-0.1058769, -1.005344, -3.561797, 1, 1, 1, 1, 1,
-0.1027608, 2.059291, -0.4874304, 1, 1, 1, 1, 1,
-0.09864915, 1.182295, 0.943221, 1, 1, 1, 1, 1,
-0.09605443, -0.1185874, -1.708926, 1, 1, 1, 1, 1,
-0.08738449, -0.9058865, -2.411985, 1, 1, 1, 1, 1,
-0.0862321, 1.407042, -1.518532, 1, 1, 1, 1, 1,
-0.08559164, 1.054007, 0.2417858, 1, 1, 1, 1, 1,
-0.07938398, -0.2944421, -1.699855, 1, 1, 1, 1, 1,
-0.07781537, 0.6371835, 0.9898943, 1, 1, 1, 1, 1,
-0.07673273, -0.6196007, -2.66286, 1, 1, 1, 1, 1,
-0.07668675, 0.778668, -0.6093033, 1, 1, 1, 1, 1,
-0.07322305, 0.3470677, 1.413578, 1, 1, 1, 1, 1,
-0.07203367, -0.5691794, -1.721177, 0, 0, 1, 1, 1,
-0.0694451, -1.103593, -2.98682, 1, 0, 0, 1, 1,
-0.06101803, -0.339011, -3.778669, 1, 0, 0, 1, 1,
-0.05862433, -1.156105, -5.160223, 1, 0, 0, 1, 1,
-0.05736068, -0.6668423, -2.900172, 1, 0, 0, 1, 1,
-0.05559689, -1.349614, -3.850963, 1, 0, 0, 1, 1,
-0.05368124, -0.1036894, -1.303543, 0, 0, 0, 1, 1,
-0.05341292, -1.269688, -3.508961, 0, 0, 0, 1, 1,
-0.04798163, -1.021007, -1.076625, 0, 0, 0, 1, 1,
-0.04791452, -0.1972809, -2.336121, 0, 0, 0, 1, 1,
-0.04504152, 0.07859969, -2.51448, 0, 0, 0, 1, 1,
-0.04201663, 1.377087, 0.1149985, 0, 0, 0, 1, 1,
-0.04089241, -0.5977851, -2.873745, 0, 0, 0, 1, 1,
-0.03874419, 0.103442, 0.6622466, 1, 1, 1, 1, 1,
-0.03597311, -0.3598795, -2.683179, 1, 1, 1, 1, 1,
-0.03290055, -1.586933, -1.96446, 1, 1, 1, 1, 1,
-0.03263076, -1.176407, -3.492755, 1, 1, 1, 1, 1,
-0.03252243, -0.05142742, -4.405691, 1, 1, 1, 1, 1,
-0.02583569, 1.73553, -0.2670473, 1, 1, 1, 1, 1,
-0.02561204, -0.9256187, -2.797312, 1, 1, 1, 1, 1,
-0.022204, -1.593786, -1.596076, 1, 1, 1, 1, 1,
-0.01967809, 0.4724276, -1.451681, 1, 1, 1, 1, 1,
-0.01828257, 1.781244, -1.99196, 1, 1, 1, 1, 1,
-0.01711957, 0.3919785, -0.146379, 1, 1, 1, 1, 1,
-0.01631115, -0.3822227, -2.497551, 1, 1, 1, 1, 1,
-0.01622069, 0.1200151, -1.309588, 1, 1, 1, 1, 1,
-0.01204769, -0.005276638, -0.9877917, 1, 1, 1, 1, 1,
-0.007045687, -0.6593857, -4.042786, 1, 1, 1, 1, 1,
-0.004316563, 0.1258322, 1.205528, 0, 0, 1, 1, 1,
-0.001521738, -0.9063714, -4.001228, 1, 0, 0, 1, 1,
0.001441413, 0.5183148, 1.55978, 1, 0, 0, 1, 1,
0.00606965, -0.9638489, 3.103459, 1, 0, 0, 1, 1,
0.01074657, 0.4622387, 0.3852727, 1, 0, 0, 1, 1,
0.0139062, -1.724378, 4.369128, 1, 0, 0, 1, 1,
0.01641584, -1.088786, 3.012887, 0, 0, 0, 1, 1,
0.0191812, 0.7806731, -0.9180698, 0, 0, 0, 1, 1,
0.02540025, 1.575681, 1.260063, 0, 0, 0, 1, 1,
0.02664243, -0.7976293, 3.588911, 0, 0, 0, 1, 1,
0.02836197, 0.6654277, -0.02522914, 0, 0, 0, 1, 1,
0.02878953, -0.1103523, 3.493839, 0, 0, 0, 1, 1,
0.03251248, 0.6187421, 0.3528789, 0, 0, 0, 1, 1,
0.03372627, -0.9072869, 1.770521, 1, 1, 1, 1, 1,
0.04146631, -0.336169, 3.374856, 1, 1, 1, 1, 1,
0.04294363, -0.9013109, 3.038951, 1, 1, 1, 1, 1,
0.04433245, -1.852935, 1.610067, 1, 1, 1, 1, 1,
0.05045871, 0.2404009, 1.941533, 1, 1, 1, 1, 1,
0.05151249, 0.3569058, -1.582229, 1, 1, 1, 1, 1,
0.05238219, 0.9647589, 0.6873863, 1, 1, 1, 1, 1,
0.05272472, 0.2538447, 0.708591, 1, 1, 1, 1, 1,
0.05370741, 1.147774, 1.379672, 1, 1, 1, 1, 1,
0.0581856, 0.3853916, -0.1453241, 1, 1, 1, 1, 1,
0.06419205, -0.1171814, 1.768542, 1, 1, 1, 1, 1,
0.06944748, 0.8140207, -0.506264, 1, 1, 1, 1, 1,
0.0706397, 0.3962253, 0.1525249, 1, 1, 1, 1, 1,
0.07522352, 0.001254051, 0.9292664, 1, 1, 1, 1, 1,
0.08923627, -1.486234, 4.341381, 1, 1, 1, 1, 1,
0.09031609, 1.160211, -0.1984382, 0, 0, 1, 1, 1,
0.09192167, -0.2515804, 2.777735, 1, 0, 0, 1, 1,
0.09210918, 0.9789174, -0.009030215, 1, 0, 0, 1, 1,
0.09460589, -0.0692623, 1.619165, 1, 0, 0, 1, 1,
0.09583788, 0.43891, 1.561916, 1, 0, 0, 1, 1,
0.09900197, 0.8065301, 1.681641, 1, 0, 0, 1, 1,
0.1017849, 0.5964324, -1.259274, 0, 0, 0, 1, 1,
0.102031, -1.756457, 2.941099, 0, 0, 0, 1, 1,
0.1041261, 1.381725, 0.1799889, 0, 0, 0, 1, 1,
0.1083349, 1.345402, 2.040293, 0, 0, 0, 1, 1,
0.109081, 0.8895271, -1.278158, 0, 0, 0, 1, 1,
0.1127995, 1.105647, 1.000041, 0, 0, 0, 1, 1,
0.1129379, -0.8096209, 4.500239, 0, 0, 0, 1, 1,
0.1137339, -0.1011683, 3.664719, 1, 1, 1, 1, 1,
0.1137365, -0.6485741, 3.888798, 1, 1, 1, 1, 1,
0.116089, -1.245208, 3.362341, 1, 1, 1, 1, 1,
0.1210829, -0.02088545, 0.974552, 1, 1, 1, 1, 1,
0.1211437, 0.001369924, 1.173719, 1, 1, 1, 1, 1,
0.1234211, -1.081522, 4.112242, 1, 1, 1, 1, 1,
0.1249223, 0.9922032, -1.29443, 1, 1, 1, 1, 1,
0.1254609, 0.9032082, 0.453851, 1, 1, 1, 1, 1,
0.1274295, -1.413552, 2.771376, 1, 1, 1, 1, 1,
0.1282634, 1.69124, 0.1886073, 1, 1, 1, 1, 1,
0.128286, 0.6728441, 0.2441195, 1, 1, 1, 1, 1,
0.1286526, -0.5958321, 2.773111, 1, 1, 1, 1, 1,
0.1303688, 0.007862319, 2.061123, 1, 1, 1, 1, 1,
0.1317587, -0.8622711, 2.953328, 1, 1, 1, 1, 1,
0.1382584, -0.8057182, 3.568725, 1, 1, 1, 1, 1,
0.138731, -0.1687195, 2.52755, 0, 0, 1, 1, 1,
0.1418446, -0.09838355, 1.707718, 1, 0, 0, 1, 1,
0.1546955, 0.7454464, 0.7710549, 1, 0, 0, 1, 1,
0.1553165, 0.1354222, 0.7616886, 1, 0, 0, 1, 1,
0.1610331, 0.5819091, 0.4942031, 1, 0, 0, 1, 1,
0.1623868, 0.1153607, 1.316047, 1, 0, 0, 1, 1,
0.1684893, 0.1028356, 3.544794, 0, 0, 0, 1, 1,
0.1688382, -0.4406844, 1.195829, 0, 0, 0, 1, 1,
0.1715441, -1.421122, 1.782035, 0, 0, 0, 1, 1,
0.1743342, 0.6524545, 0.8489996, 0, 0, 0, 1, 1,
0.1799242, 0.8387498, 1.381824, 0, 0, 0, 1, 1,
0.1810276, 1.644084, 1.855611, 0, 0, 0, 1, 1,
0.1853378, 0.1571644, 1.169389, 0, 0, 0, 1, 1,
0.1861609, -0.7311994, 2.035118, 1, 1, 1, 1, 1,
0.1963603, -1.056317, 2.014187, 1, 1, 1, 1, 1,
0.1970931, 0.7446732, 0.5802294, 1, 1, 1, 1, 1,
0.2034815, -0.1464947, 1.456421, 1, 1, 1, 1, 1,
0.2095323, 0.2558147, 1.803459, 1, 1, 1, 1, 1,
0.2104792, -1.780976, 3.515047, 1, 1, 1, 1, 1,
0.2151401, -1.991738, 3.22122, 1, 1, 1, 1, 1,
0.2176642, -0.8202173, 4.129083, 1, 1, 1, 1, 1,
0.218115, 1.810439, 1.340651, 1, 1, 1, 1, 1,
0.2197212, -0.1513246, 1.935624, 1, 1, 1, 1, 1,
0.2201105, -0.6945745, 2.797189, 1, 1, 1, 1, 1,
0.2202991, 1.549073, 0.9737781, 1, 1, 1, 1, 1,
0.2256994, -1.242834, 2.907903, 1, 1, 1, 1, 1,
0.2266168, -0.002493378, 1.639998, 1, 1, 1, 1, 1,
0.2267526, -0.3516214, 3.289969, 1, 1, 1, 1, 1,
0.2302167, 0.9139272, -0.7576368, 0, 0, 1, 1, 1,
0.2338183, 1.128514, 0.4653608, 1, 0, 0, 1, 1,
0.2343097, -0.00131771, 0.8714065, 1, 0, 0, 1, 1,
0.2349702, -0.1806697, 3.831471, 1, 0, 0, 1, 1,
0.2404552, -0.3617775, 5.189458, 1, 0, 0, 1, 1,
0.2430301, 0.5527396, 1.137298, 1, 0, 0, 1, 1,
0.2455958, -1.502847, 4.302162, 0, 0, 0, 1, 1,
0.2533078, 1.723643, -1.868982, 0, 0, 0, 1, 1,
0.2540542, -1.746297, 2.474922, 0, 0, 0, 1, 1,
0.2555118, -0.6411699, 1.603084, 0, 0, 0, 1, 1,
0.2569638, -1.52617, 3.484864, 0, 0, 0, 1, 1,
0.2644181, -0.5322258, 1.874425, 0, 0, 0, 1, 1,
0.2647608, -1.157692, 2.753366, 0, 0, 0, 1, 1,
0.2660453, -0.3747782, 1.973775, 1, 1, 1, 1, 1,
0.2681939, 0.7672461, -0.7975561, 1, 1, 1, 1, 1,
0.2693283, -0.9114643, 0.8561327, 1, 1, 1, 1, 1,
0.272768, -0.02996072, 2.868441, 1, 1, 1, 1, 1,
0.2739583, 0.1900583, -1.547525, 1, 1, 1, 1, 1,
0.2791836, -1.784321, 2.639952, 1, 1, 1, 1, 1,
0.2802259, 0.7043172, 0.4807528, 1, 1, 1, 1, 1,
0.2802463, -1.30918, 2.045881, 1, 1, 1, 1, 1,
0.2875879, -0.2115238, 2.822373, 1, 1, 1, 1, 1,
0.2879635, 2.427689, -0.0279264, 1, 1, 1, 1, 1,
0.2954017, -0.4593572, 3.290677, 1, 1, 1, 1, 1,
0.2959678, 0.6663149, 1.194153, 1, 1, 1, 1, 1,
0.3005414, 0.4875228, 1.947696, 1, 1, 1, 1, 1,
0.3040083, -0.4662332, 2.246819, 1, 1, 1, 1, 1,
0.3055207, -2.609136, 2.41906, 1, 1, 1, 1, 1,
0.308167, -2.15958, 3.941303, 0, 0, 1, 1, 1,
0.3100688, 0.6257249, 1.004399, 1, 0, 0, 1, 1,
0.3102986, 0.3128712, 1.322312, 1, 0, 0, 1, 1,
0.3106285, 0.2529743, 1.576016, 1, 0, 0, 1, 1,
0.3135707, -0.3308094, 1.838704, 1, 0, 0, 1, 1,
0.3154965, 0.1786562, -0.5905764, 1, 0, 0, 1, 1,
0.3174897, 1.087974, -0.1688965, 0, 0, 0, 1, 1,
0.318202, -0.5220382, 3.268293, 0, 0, 0, 1, 1,
0.3188706, -0.7535937, 3.253312, 0, 0, 0, 1, 1,
0.3225348, 0.5398785, 0.3672779, 0, 0, 0, 1, 1,
0.322588, -0.6369402, 3.180271, 0, 0, 0, 1, 1,
0.3242693, -1.018583, 3.300881, 0, 0, 0, 1, 1,
0.3249832, 1.125735, 0.1807483, 0, 0, 0, 1, 1,
0.3264035, -0.5148759, 2.125201, 1, 1, 1, 1, 1,
0.3279674, 0.3786663, 1.267077, 1, 1, 1, 1, 1,
0.331719, -0.9944549, 1.42912, 1, 1, 1, 1, 1,
0.3317679, -0.07055026, 1.599141, 1, 1, 1, 1, 1,
0.3321662, -1.14221, 2.437751, 1, 1, 1, 1, 1,
0.3321737, 0.539326, 0.1141352, 1, 1, 1, 1, 1,
0.3327243, 1.421435, 0.806656, 1, 1, 1, 1, 1,
0.3338681, 1.946002, 0.2283977, 1, 1, 1, 1, 1,
0.3386677, 0.1855668, 1.269316, 1, 1, 1, 1, 1,
0.3478054, 0.7063255, 0.4305178, 1, 1, 1, 1, 1,
0.3518243, -0.2768025, 3.115714, 1, 1, 1, 1, 1,
0.3523726, -0.307559, 1.034795, 1, 1, 1, 1, 1,
0.3554488, 0.5284888, 0.7032037, 1, 1, 1, 1, 1,
0.3570511, 1.496077, 0.6190355, 1, 1, 1, 1, 1,
0.3579111, -0.3781473, 2.841541, 1, 1, 1, 1, 1,
0.3583846, 1.394724, 1.380914, 0, 0, 1, 1, 1,
0.3623527, -0.06083776, 1.718877, 1, 0, 0, 1, 1,
0.3626236, 1.047972, 0.7130596, 1, 0, 0, 1, 1,
0.3627531, 0.8316302, -0.1863939, 1, 0, 0, 1, 1,
0.3691678, -2.137467, 2.047805, 1, 0, 0, 1, 1,
0.370878, -1.181347, 2.124616, 1, 0, 0, 1, 1,
0.3722052, -0.3201256, 2.878147, 0, 0, 0, 1, 1,
0.3736826, -0.3669995, 1.42514, 0, 0, 0, 1, 1,
0.3755037, 0.7735987, -1.506024, 0, 0, 0, 1, 1,
0.3809, 1.802904, -0.1464913, 0, 0, 0, 1, 1,
0.3812899, 0.5763758, 1.926916, 0, 0, 0, 1, 1,
0.3821581, 1.513275, -0.5527369, 0, 0, 0, 1, 1,
0.3849126, 0.3854006, 0.9000196, 0, 0, 0, 1, 1,
0.3855469, 0.9468794, 0.8957493, 1, 1, 1, 1, 1,
0.3865553, 1.403969, 2.169283, 1, 1, 1, 1, 1,
0.3867207, 1.271552, -0.857858, 1, 1, 1, 1, 1,
0.3871455, 1.542996, 0.7354283, 1, 1, 1, 1, 1,
0.3888082, -0.5763047, 2.08733, 1, 1, 1, 1, 1,
0.3911801, 1.297211, 0.4397903, 1, 1, 1, 1, 1,
0.3916571, -0.7018546, 2.660656, 1, 1, 1, 1, 1,
0.39284, 0.4549851, -0.882765, 1, 1, 1, 1, 1,
0.3969072, -0.03203087, 2.38452, 1, 1, 1, 1, 1,
0.4060314, -0.5955972, 3.271559, 1, 1, 1, 1, 1,
0.4066917, -1.311774, 2.386841, 1, 1, 1, 1, 1,
0.4136501, 0.01880693, 2.560729, 1, 1, 1, 1, 1,
0.4156412, -1.187965, 3.823681, 1, 1, 1, 1, 1,
0.416128, 1.275344, 0.33984, 1, 1, 1, 1, 1,
0.4171837, -0.02522915, 0.7808992, 1, 1, 1, 1, 1,
0.4219854, -0.5825245, 3.149665, 0, 0, 1, 1, 1,
0.4271223, 0.9698136, -0.2156307, 1, 0, 0, 1, 1,
0.4387642, 0.5726336, 0.763379, 1, 0, 0, 1, 1,
0.4394904, -0.5485517, 3.054923, 1, 0, 0, 1, 1,
0.4408317, -1.767613, 4.553315, 1, 0, 0, 1, 1,
0.4419257, -0.3593156, 2.972309, 1, 0, 0, 1, 1,
0.4434803, 1.229295, 0.2390991, 0, 0, 0, 1, 1,
0.4451543, 0.3525046, 1.685101, 0, 0, 0, 1, 1,
0.4458931, 0.5311016, -0.2837981, 0, 0, 0, 1, 1,
0.4479033, -0.06495783, 0.4259684, 0, 0, 0, 1, 1,
0.4533733, -1.832047, 3.944568, 0, 0, 0, 1, 1,
0.461333, -0.03423124, 0.4018186, 0, 0, 0, 1, 1,
0.4686063, 0.6978989, -1.087511, 0, 0, 0, 1, 1,
0.4773749, -0.1285465, 2.443802, 1, 1, 1, 1, 1,
0.4810336, -0.8176787, 2.042497, 1, 1, 1, 1, 1,
0.4811886, 0.2892894, 0.8142779, 1, 1, 1, 1, 1,
0.4841867, -0.1477385, 1.254644, 1, 1, 1, 1, 1,
0.4874125, -1.469182, 1.882725, 1, 1, 1, 1, 1,
0.4879107, 1.945786, 2.182747, 1, 1, 1, 1, 1,
0.4932501, 0.5706743, 2.657635, 1, 1, 1, 1, 1,
0.4941748, 0.3891326, 1.310029, 1, 1, 1, 1, 1,
0.4964053, -0.4468988, 3.212315, 1, 1, 1, 1, 1,
0.4973817, 0.2442708, 0.294578, 1, 1, 1, 1, 1,
0.498444, 1.30751, 1.202633, 1, 1, 1, 1, 1,
0.5003801, -0.9482486, 1.506793, 1, 1, 1, 1, 1,
0.5025706, 0.160027, 0.2706413, 1, 1, 1, 1, 1,
0.5063226, -1.371756, 4.055741, 1, 1, 1, 1, 1,
0.5086371, -0.7387432, 3.295333, 1, 1, 1, 1, 1,
0.5115151, 0.3626181, 3.863833, 0, 0, 1, 1, 1,
0.5208876, 0.9696053, 1.815029, 1, 0, 0, 1, 1,
0.5211929, 0.3035254, 1.492981, 1, 0, 0, 1, 1,
0.5291795, 0.01073019, 2.939203, 1, 0, 0, 1, 1,
0.5294663, -1.122735, 2.770831, 1, 0, 0, 1, 1,
0.5384508, -2.328839, 1.666484, 1, 0, 0, 1, 1,
0.5384955, -0.08751918, 0.9795477, 0, 0, 0, 1, 1,
0.5419123, -1.222431, 2.564186, 0, 0, 0, 1, 1,
0.54214, 0.2762717, 0.6907507, 0, 0, 0, 1, 1,
0.5503861, 0.4737426, 0.8545595, 0, 0, 0, 1, 1,
0.5528371, -1.073836, 1.080593, 0, 0, 0, 1, 1,
0.553009, -1.181765, 2.667345, 0, 0, 0, 1, 1,
0.5534158, 0.1769533, 2.386344, 0, 0, 0, 1, 1,
0.5601055, 0.5500345, 1.010669, 1, 1, 1, 1, 1,
0.5636117, 1.333883, 2.571861, 1, 1, 1, 1, 1,
0.5699168, -0.7831951, 5.290601, 1, 1, 1, 1, 1,
0.5709258, -0.5833674, 2.901899, 1, 1, 1, 1, 1,
0.5766437, -2.13319, 2.707659, 1, 1, 1, 1, 1,
0.5810294, 0.5677193, -1.109905, 1, 1, 1, 1, 1,
0.5827506, 0.8559119, 1.222969, 1, 1, 1, 1, 1,
0.5855027, -0.02486344, 1.671164, 1, 1, 1, 1, 1,
0.5858268, 1.865223, -0.3411807, 1, 1, 1, 1, 1,
0.5872855, 0.8001308, 2.655619, 1, 1, 1, 1, 1,
0.5885018, -0.7396675, 1.710024, 1, 1, 1, 1, 1,
0.5915136, 1.455537, 2.166122, 1, 1, 1, 1, 1,
0.5944902, -1.237395, 2.903612, 1, 1, 1, 1, 1,
0.5945848, 1.916273, 1.194257, 1, 1, 1, 1, 1,
0.5954564, -1.249739, 2.964522, 1, 1, 1, 1, 1,
0.6057829, 0.567642, 0.04740025, 0, 0, 1, 1, 1,
0.6113088, -0.9288554, 1.900046, 1, 0, 0, 1, 1,
0.6132159, 1.059209, 1.787449, 1, 0, 0, 1, 1,
0.6148932, 0.3195432, 2.793505, 1, 0, 0, 1, 1,
0.6150673, -1.56798, 3.698208, 1, 0, 0, 1, 1,
0.6150954, 0.1079306, 2.043969, 1, 0, 0, 1, 1,
0.6326795, -1.521658, 2.909094, 0, 0, 0, 1, 1,
0.6348504, -0.1171291, 1.468179, 0, 0, 0, 1, 1,
0.6372699, 2.125665, 0.02840408, 0, 0, 0, 1, 1,
0.6385851, 0.32153, 2.086891, 0, 0, 0, 1, 1,
0.6422446, -0.9808451, 1.766334, 0, 0, 0, 1, 1,
0.6449621, -1.173986, 1.807632, 0, 0, 0, 1, 1,
0.6466403, -0.4872889, 0.9210425, 0, 0, 0, 1, 1,
0.6486263, 0.2175506, 1.48257, 1, 1, 1, 1, 1,
0.6508306, -1.996588, 2.608257, 1, 1, 1, 1, 1,
0.6588303, 0.7002429, 0.4593206, 1, 1, 1, 1, 1,
0.6595353, -2.2143, 1.755677, 1, 1, 1, 1, 1,
0.6611164, 0.5307575, 0.4233747, 1, 1, 1, 1, 1,
0.6619545, 0.2132962, 1.496231, 1, 1, 1, 1, 1,
0.6667438, 0.08207732, 0.3876338, 1, 1, 1, 1, 1,
0.6670702, -1.930076, 3.684876, 1, 1, 1, 1, 1,
0.6690536, -0.04103652, 1.797651, 1, 1, 1, 1, 1,
0.6703544, -0.5738842, 2.544363, 1, 1, 1, 1, 1,
0.6738824, -0.01305722, 1.55874, 1, 1, 1, 1, 1,
0.6782774, -1.059831, 1.555183, 1, 1, 1, 1, 1,
0.6836716, -0.6249899, 1.9586, 1, 1, 1, 1, 1,
0.6842294, 0.4070314, 1.235969, 1, 1, 1, 1, 1,
0.6863527, -1.146288, 2.279705, 1, 1, 1, 1, 1,
0.6870742, 0.002917314, 0.4891742, 0, 0, 1, 1, 1,
0.6885494, 1.798511, -0.08730976, 1, 0, 0, 1, 1,
0.6887192, 1.902963, 1.323964, 1, 0, 0, 1, 1,
0.6940637, 1.175178, 1.148502, 1, 0, 0, 1, 1,
0.6964398, -0.05900979, 3.491691, 1, 0, 0, 1, 1,
0.7070015, -1.002007, 2.584413, 1, 0, 0, 1, 1,
0.7074317, -0.1928524, 1.833073, 0, 0, 0, 1, 1,
0.7174074, -1.441063, 1.624327, 0, 0, 0, 1, 1,
0.7208154, -0.2093415, 3.127032, 0, 0, 0, 1, 1,
0.7229872, -1.797264, 3.533963, 0, 0, 0, 1, 1,
0.7414155, 0.4283685, 0.3084329, 0, 0, 0, 1, 1,
0.7419682, -0.482864, 2.071292, 0, 0, 0, 1, 1,
0.7432788, -0.7635193, 3.346696, 0, 0, 0, 1, 1,
0.7446508, -0.9856986, 1.20562, 1, 1, 1, 1, 1,
0.7485588, -1.463016, 3.631416, 1, 1, 1, 1, 1,
0.7487212, -1.684168, 2.726534, 1, 1, 1, 1, 1,
0.7526541, 0.7557512, 2.52046, 1, 1, 1, 1, 1,
0.7554547, -0.810223, 1.896943, 1, 1, 1, 1, 1,
0.7635633, 1.433398, 1.569833, 1, 1, 1, 1, 1,
0.7654796, 0.7496225, 1.883299, 1, 1, 1, 1, 1,
0.766601, 0.02737001, 2.277713, 1, 1, 1, 1, 1,
0.7745681, -1.069559, 2.486619, 1, 1, 1, 1, 1,
0.7753777, -1.387818, 1.956881, 1, 1, 1, 1, 1,
0.7769668, 2.440657, 2.064422, 1, 1, 1, 1, 1,
0.7812092, 1.994943, 1.134714, 1, 1, 1, 1, 1,
0.7821594, 0.99043, 0.6513842, 1, 1, 1, 1, 1,
0.7838977, 0.7487511, 1.407819, 1, 1, 1, 1, 1,
0.7855561, -0.6951357, 0.2995181, 1, 1, 1, 1, 1,
0.7879689, -0.02899567, 0.8810313, 0, 0, 1, 1, 1,
0.8018279, 1.313238, 1.370173, 1, 0, 0, 1, 1,
0.8123786, -1.115624, 2.82929, 1, 0, 0, 1, 1,
0.8148638, -0.1208483, 2.756643, 1, 0, 0, 1, 1,
0.815457, -1.314284, 3.062883, 1, 0, 0, 1, 1,
0.8162423, 1.287992, 0.3431245, 1, 0, 0, 1, 1,
0.817265, 0.4928488, 1.8605, 0, 0, 0, 1, 1,
0.8174707, -1.896052, 1.071983, 0, 0, 0, 1, 1,
0.8233565, 0.5063264, 1.152164, 0, 0, 0, 1, 1,
0.8240542, 0.279878, 1.042574, 0, 0, 0, 1, 1,
0.8249194, -1.456228, 3.753183, 0, 0, 0, 1, 1,
0.8273609, -2.402049, 1.728364, 0, 0, 0, 1, 1,
0.8291736, -0.6777655, 4.726533, 0, 0, 0, 1, 1,
0.8366777, 0.4186581, 2.588917, 1, 1, 1, 1, 1,
0.8383446, 0.7456893, 0.2246723, 1, 1, 1, 1, 1,
0.8410648, -3.46268, 1.814795, 1, 1, 1, 1, 1,
0.8414974, 0.268527, 0.4884895, 1, 1, 1, 1, 1,
0.8451936, 0.126578, 1.344007, 1, 1, 1, 1, 1,
0.8557863, 1.074912, -0.1684771, 1, 1, 1, 1, 1,
0.8564709, 0.9116396, 0.9063948, 1, 1, 1, 1, 1,
0.8611147, 0.3275753, 0.7651789, 1, 1, 1, 1, 1,
0.8630052, -0.5991285, 1.993008, 1, 1, 1, 1, 1,
0.8678275, -0.1940594, 2.473974, 1, 1, 1, 1, 1,
0.8707046, 0.1321035, 2.57084, 1, 1, 1, 1, 1,
0.8714181, -0.5201168, 0.3417055, 1, 1, 1, 1, 1,
0.8724223, 0.2172659, 1.106546, 1, 1, 1, 1, 1,
0.8746521, -0.7765303, 1.40188, 1, 1, 1, 1, 1,
0.8771045, -0.6781895, 2.248192, 1, 1, 1, 1, 1,
0.8860235, 0.4292611, -0.2866139, 0, 0, 1, 1, 1,
0.8919164, -0.2191386, 1.70109, 1, 0, 0, 1, 1,
0.8986332, -0.3468401, 1.521797, 1, 0, 0, 1, 1,
0.9017316, 0.5511515, 0.2463169, 1, 0, 0, 1, 1,
0.9026667, -1.499109, 3.164237, 1, 0, 0, 1, 1,
0.9128128, -0.3769591, 0.06280912, 1, 0, 0, 1, 1,
0.9152108, 0.1881635, 3.811243, 0, 0, 0, 1, 1,
0.9279739, -0.8693331, 2.551441, 0, 0, 0, 1, 1,
0.9302493, 0.4586869, -0.0008887955, 0, 0, 0, 1, 1,
0.9303295, -0.1776456, -0.09074769, 0, 0, 0, 1, 1,
0.930949, 1.28289, -0.3510737, 0, 0, 0, 1, 1,
0.937005, -0.1262515, 2.194865, 0, 0, 0, 1, 1,
0.9436439, 2.154543, -0.8413175, 0, 0, 0, 1, 1,
0.9599369, -0.2416583, 0.7280499, 1, 1, 1, 1, 1,
0.9607415, 0.9580278, -0.06036352, 1, 1, 1, 1, 1,
0.9626244, -0.7233722, 2.139837, 1, 1, 1, 1, 1,
0.9785067, -0.5159076, 3.372913, 1, 1, 1, 1, 1,
0.9787284, 0.9920936, 0.4401046, 1, 1, 1, 1, 1,
0.9833269, -0.08656428, 1.39433, 1, 1, 1, 1, 1,
0.9839952, -0.2859275, 1.990161, 1, 1, 1, 1, 1,
0.9855706, -0.5420911, 2.550884, 1, 1, 1, 1, 1,
0.9859933, 0.2579685, 2.433205, 1, 1, 1, 1, 1,
0.9920713, -0.1927086, 0.3591936, 1, 1, 1, 1, 1,
0.9938934, -0.8732599, 2.67504, 1, 1, 1, 1, 1,
0.9955947, 1.088282, -1.19061, 1, 1, 1, 1, 1,
0.9960788, 0.50499, -0.1487362, 1, 1, 1, 1, 1,
0.9964073, 0.5741255, 0.3602008, 1, 1, 1, 1, 1,
0.998046, -0.4865095, 1.875614, 1, 1, 1, 1, 1,
1.000271, 0.9703218, 0.2172945, 0, 0, 1, 1, 1,
1.000779, 0.5356725, 1.293131, 1, 0, 0, 1, 1,
1.000926, -1.316671, 3.327828, 1, 0, 0, 1, 1,
1.001507, -0.5662535, 2.292, 1, 0, 0, 1, 1,
1.005814, 0.617623, 1.285161, 1, 0, 0, 1, 1,
1.010746, -0.2736577, 1.975206, 1, 0, 0, 1, 1,
1.011371, -0.2882479, -0.323238, 0, 0, 0, 1, 1,
1.014276, 1.107446, 1.447008, 0, 0, 0, 1, 1,
1.018472, -1.556311, 2.032443, 0, 0, 0, 1, 1,
1.019573, -0.6306787, 2.030229, 0, 0, 0, 1, 1,
1.019707, -0.531078, 3.082693, 0, 0, 0, 1, 1,
1.021513, -0.973357, 1.600546, 0, 0, 0, 1, 1,
1.023334, 0.1064085, 2.415987, 0, 0, 0, 1, 1,
1.024164, 0.4778126, 0.6387292, 1, 1, 1, 1, 1,
1.030267, 0.4426261, 2.91932, 1, 1, 1, 1, 1,
1.037588, 1.340828, 1.498849, 1, 1, 1, 1, 1,
1.049744, -0.2341996, 2.262722, 1, 1, 1, 1, 1,
1.058944, 0.7242554, -0.8650361, 1, 1, 1, 1, 1,
1.064949, 0.4870642, 2.23752, 1, 1, 1, 1, 1,
1.067276, 1.263175, 0.27591, 1, 1, 1, 1, 1,
1.069409, -0.7368018, 1.196078, 1, 1, 1, 1, 1,
1.084863, -0.3582586, 1.786049, 1, 1, 1, 1, 1,
1.094125, -0.2342893, 1.345597, 1, 1, 1, 1, 1,
1.095364, -0.03972754, 2.422463, 1, 1, 1, 1, 1,
1.096477, 0.7532778, 0.3520461, 1, 1, 1, 1, 1,
1.105515, -0.439475, 1.501241, 1, 1, 1, 1, 1,
1.115605, -0.9920686, 0.153087, 1, 1, 1, 1, 1,
1.115956, -0.7340659, 1.623582, 1, 1, 1, 1, 1,
1.118305, 0.7633629, 0.4319531, 0, 0, 1, 1, 1,
1.131563, 0.5324514, 3.644648, 1, 0, 0, 1, 1,
1.133873, 1.005873, 2.133663, 1, 0, 0, 1, 1,
1.138456, 0.5561554, -0.4411635, 1, 0, 0, 1, 1,
1.150304, -0.1398043, 1.599841, 1, 0, 0, 1, 1,
1.176295, 1.585388, 2.005321, 1, 0, 0, 1, 1,
1.187311, 1.630558, 2.785702, 0, 0, 0, 1, 1,
1.190451, -0.8687561, 3.66567, 0, 0, 0, 1, 1,
1.200365, -1.919567, 2.801027, 0, 0, 0, 1, 1,
1.203978, -1.325581, 3.141582, 0, 0, 0, 1, 1,
1.204639, 0.7177374, 0.5672004, 0, 0, 0, 1, 1,
1.206242, 1.042899, 1.328685, 0, 0, 0, 1, 1,
1.211148, 0.09745248, 1.335318, 0, 0, 0, 1, 1,
1.211384, 0.4117634, 0.1819525, 1, 1, 1, 1, 1,
1.219224, 0.713227, 1.480447, 1, 1, 1, 1, 1,
1.221612, -2.590492, 4.87819, 1, 1, 1, 1, 1,
1.226644, -1.286913, 1.975491, 1, 1, 1, 1, 1,
1.227192, -1.454148, 3.605195, 1, 1, 1, 1, 1,
1.237958, -0.5921703, 0.4362396, 1, 1, 1, 1, 1,
1.241879, 1.168466, -0.1291064, 1, 1, 1, 1, 1,
1.243137, 0.6551397, 3.251551, 1, 1, 1, 1, 1,
1.24391, -0.1445345, 2.363991, 1, 1, 1, 1, 1,
1.248775, 0.7781914, 1.82238, 1, 1, 1, 1, 1,
1.253642, 0.152176, 1.254205, 1, 1, 1, 1, 1,
1.261821, 0.2459631, 1.339706, 1, 1, 1, 1, 1,
1.263706, 0.6023699, 0.7989725, 1, 1, 1, 1, 1,
1.266876, -1.560246, 2.363778, 1, 1, 1, 1, 1,
1.281929, 0.9684842, 0.7812126, 1, 1, 1, 1, 1,
1.297592, -0.05016771, 3.113662, 0, 0, 1, 1, 1,
1.299087, -0.6217335, 2.577672, 1, 0, 0, 1, 1,
1.300497, -0.9903818, 3.443142, 1, 0, 0, 1, 1,
1.301095, -1.310112, 1.576891, 1, 0, 0, 1, 1,
1.301231, -1.22436, 1.096346, 1, 0, 0, 1, 1,
1.310187, -0.2594245, 1.332161, 1, 0, 0, 1, 1,
1.310756, -0.6751618, 0.4079859, 0, 0, 0, 1, 1,
1.313027, -0.7325734, 2.354793, 0, 0, 0, 1, 1,
1.332663, 0.763706, 0.6656914, 0, 0, 0, 1, 1,
1.347048, -0.7308676, 2.017628, 0, 0, 0, 1, 1,
1.352049, 0.02243367, 1.30664, 0, 0, 0, 1, 1,
1.36174, 0.5411142, 3.272361, 0, 0, 0, 1, 1,
1.361928, 0.1499931, 0.7966424, 0, 0, 0, 1, 1,
1.36476, -0.9074363, 0.9082265, 1, 1, 1, 1, 1,
1.389374, 0.5269941, 1.514766, 1, 1, 1, 1, 1,
1.391384, 9.231595e-05, 2.082514, 1, 1, 1, 1, 1,
1.398797, 0.5224165, 2.010569, 1, 1, 1, 1, 1,
1.409306, -0.5612245, 0.4717124, 1, 1, 1, 1, 1,
1.427492, 0.892096, 1.829536, 1, 1, 1, 1, 1,
1.433583, -0.907054, 2.697609, 1, 1, 1, 1, 1,
1.439664, 0.4676533, 3.038965, 1, 1, 1, 1, 1,
1.445873, 0.4072385, -0.9299951, 1, 1, 1, 1, 1,
1.446306, 1.314921, 3.672848, 1, 1, 1, 1, 1,
1.459798, 0.4373753, 0.5100964, 1, 1, 1, 1, 1,
1.465636, -1.547821, 2.508905, 1, 1, 1, 1, 1,
1.473129, -0.6652058, 0.6040539, 1, 1, 1, 1, 1,
1.482092, -1.287842, 2.766842, 1, 1, 1, 1, 1,
1.500678, -0.3973492, 2.839198, 1, 1, 1, 1, 1,
1.501645, -0.7875998, 1.08418, 0, 0, 1, 1, 1,
1.511531, -0.6128632, 1.770903, 1, 0, 0, 1, 1,
1.524793, 1.629292, 1.320153, 1, 0, 0, 1, 1,
1.529874, -1.202578, 1.339066, 1, 0, 0, 1, 1,
1.530814, -0.9837667, 1.561061, 1, 0, 0, 1, 1,
1.540151, 1.499822, -1.756486, 1, 0, 0, 1, 1,
1.551515, 0.6505576, 2.027323, 0, 0, 0, 1, 1,
1.558597, -0.3104714, 4.273849, 0, 0, 0, 1, 1,
1.563941, 0.08239423, 1.779387, 0, 0, 0, 1, 1,
1.571033, 0.6575984, 1.143577, 0, 0, 0, 1, 1,
1.571137, -0.5641829, 2.603957, 0, 0, 0, 1, 1,
1.572536, 1.724565, 1.196767, 0, 0, 0, 1, 1,
1.576826, 0.3132448, 1.301476, 0, 0, 0, 1, 1,
1.580878, 1.035351, -0.8555745, 1, 1, 1, 1, 1,
1.583251, -0.5168281, 2.520785, 1, 1, 1, 1, 1,
1.583865, -0.3506905, 1.834765, 1, 1, 1, 1, 1,
1.603375, 1.164332, 0.7069319, 1, 1, 1, 1, 1,
1.610031, 0.1407683, 1.083328, 1, 1, 1, 1, 1,
1.612156, -0.9880343, 3.199751, 1, 1, 1, 1, 1,
1.618708, -0.01432629, -0.8340571, 1, 1, 1, 1, 1,
1.626016, -0.4837985, 2.496917, 1, 1, 1, 1, 1,
1.627258, 0.3342894, 1.047436, 1, 1, 1, 1, 1,
1.638274, -2.074332, 3.176886, 1, 1, 1, 1, 1,
1.649098, 0.7130144, 0.9623742, 1, 1, 1, 1, 1,
1.676991, 0.6421201, 0.3890994, 1, 1, 1, 1, 1,
1.710138, -1.043971, 3.731854, 1, 1, 1, 1, 1,
1.710809, -0.3949772, 0.2711099, 1, 1, 1, 1, 1,
1.717466, -0.4399432, 2.486458, 1, 1, 1, 1, 1,
1.731207, 1.302841, 0.2245939, 0, 0, 1, 1, 1,
1.748987, 1.608444, 2.142086, 1, 0, 0, 1, 1,
1.784117, 1.437029, -0.09588953, 1, 0, 0, 1, 1,
1.838489, -0.1400407, 0.7913213, 1, 0, 0, 1, 1,
1.839788, 0.867308, 3.248399, 1, 0, 0, 1, 1,
1.870296, -2.300978, 2.184175, 1, 0, 0, 1, 1,
1.87286, 0.1606192, 1.63273, 0, 0, 0, 1, 1,
1.878143, 1.243098, 0.6863177, 0, 0, 0, 1, 1,
1.898508, 0.710575, 0.08270217, 0, 0, 0, 1, 1,
1.909738, -0.5377328, 2.757749, 0, 0, 0, 1, 1,
1.917715, -2.650727, 0.3335209, 0, 0, 0, 1, 1,
1.923407, 2.150385, 1.621534, 0, 0, 0, 1, 1,
1.945531, -0.7604405, 0.538429, 0, 0, 0, 1, 1,
1.968763, -0.312676, 1.924518, 1, 1, 1, 1, 1,
2.000406, -0.3900376, 1.990307, 1, 1, 1, 1, 1,
2.002115, 0.1894255, 3.649039, 1, 1, 1, 1, 1,
2.009755, 0.7651512, 1.03819, 1, 1, 1, 1, 1,
2.02452, 1.000244, 0.9643451, 1, 1, 1, 1, 1,
2.028168, 0.5828661, -0.4993266, 1, 1, 1, 1, 1,
2.030155, 0.9833087, 1.664533, 1, 1, 1, 1, 1,
2.033613, -0.2446983, 2.178055, 1, 1, 1, 1, 1,
2.03419, -1.722879, 0.848665, 1, 1, 1, 1, 1,
2.038237, 1.237063, 0.8469229, 1, 1, 1, 1, 1,
2.047036, 0.769428, 0.749438, 1, 1, 1, 1, 1,
2.070994, -1.126089, 2.707644, 1, 1, 1, 1, 1,
2.148161, 0.1089545, 0.8961115, 1, 1, 1, 1, 1,
2.16875, -0.2407721, 0.6190007, 1, 1, 1, 1, 1,
2.172214, 0.6222574, 0.4264354, 1, 1, 1, 1, 1,
2.172897, -0.5081366, 3.4647, 0, 0, 1, 1, 1,
2.183505, 1.20187, 1.316797, 1, 0, 0, 1, 1,
2.196702, -0.1907107, 2.217703, 1, 0, 0, 1, 1,
2.225591, 0.7749128, 1.253796, 1, 0, 0, 1, 1,
2.294886, -0.363269, 1.815771, 1, 0, 0, 1, 1,
2.303047, -0.1182463, 0.8094113, 1, 0, 0, 1, 1,
2.319114, 0.9122754, 1.258438, 0, 0, 0, 1, 1,
2.360509, 1.927457, 2.452852, 0, 0, 0, 1, 1,
2.369193, 1.969204, -0.01523217, 0, 0, 0, 1, 1,
2.445555, -0.01034224, 2.632259, 0, 0, 0, 1, 1,
2.49753, 1.966758, 2.390552, 0, 0, 0, 1, 1,
2.530551, 0.546775, 1.089605, 0, 0, 0, 1, 1,
2.533846, 2.374092, 0.1822002, 0, 0, 0, 1, 1,
2.584463, -0.7726261, 1.724042, 1, 1, 1, 1, 1,
2.623477, -0.42724, 1.415757, 1, 1, 1, 1, 1,
2.73655, 0.650316, 0.6270585, 1, 1, 1, 1, 1,
2.798352, -0.7034042, 1.596855, 1, 1, 1, 1, 1,
2.824306, 0.8409517, 3.391728, 1, 1, 1, 1, 1,
3.132696, 1.190047, 2.531568, 1, 1, 1, 1, 1,
3.324869, -0.9977077, 1.153343, 1, 1, 1, 1, 1
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
var radius = 9.394429;
var distance = 32.99753;
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
mvMatrix.translate( -0.3489766, 0.4136664, 0.09187675 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.99753);
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
