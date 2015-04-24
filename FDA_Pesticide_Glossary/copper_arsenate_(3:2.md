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
-2.697925, -1.158568, -2.741155, 1, 0, 0, 1,
-2.596278, 0.1052787, -1.694578, 1, 0.007843138, 0, 1,
-2.593704, -0.6071965, -1.853877, 1, 0.01176471, 0, 1,
-2.585953, 1.293673, -2.173317, 1, 0.01960784, 0, 1,
-2.578264, -0.2425104, -1.570153, 1, 0.02352941, 0, 1,
-2.500523, 0.6038296, -1.917427, 1, 0.03137255, 0, 1,
-2.496861, 0.6975742, -1.369238, 1, 0.03529412, 0, 1,
-2.42618, 0.1394779, -2.239644, 1, 0.04313726, 0, 1,
-2.425844, -0.9371655, -3.757662, 1, 0.04705882, 0, 1,
-2.371545, 0.02989651, -2.26333, 1, 0.05490196, 0, 1,
-2.324605, -0.5511697, -3.602029, 1, 0.05882353, 0, 1,
-2.306597, -0.1676956, -1.093252, 1, 0.06666667, 0, 1,
-2.288491, 0.01865288, -2.521212, 1, 0.07058824, 0, 1,
-2.239693, 1.184443, -1.439882, 1, 0.07843138, 0, 1,
-2.238881, 0.364826, -1.28697, 1, 0.08235294, 0, 1,
-2.237158, -0.3514649, -2.22954, 1, 0.09019608, 0, 1,
-2.212584, 0.1787575, -1.316951, 1, 0.09411765, 0, 1,
-2.197404, -2.117816, -0.720251, 1, 0.1019608, 0, 1,
-2.192268, -1.931637, -1.456012, 1, 0.1098039, 0, 1,
-2.172626, 0.2134545, -0.2334942, 1, 0.1137255, 0, 1,
-2.161523, 1.438795, -0.3686987, 1, 0.1215686, 0, 1,
-2.136163, 0.5145033, -1.659853, 1, 0.1254902, 0, 1,
-2.097482, -0.4368432, -2.08164, 1, 0.1333333, 0, 1,
-2.086724, -1.446857, -1.683626, 1, 0.1372549, 0, 1,
-2.086677, 2.833843, -2.575106, 1, 0.145098, 0, 1,
-2.06085, 0.3366553, -0.007531315, 1, 0.1490196, 0, 1,
-1.993044, 0.4945493, -1.782181, 1, 0.1568628, 0, 1,
-1.991247, -0.7275507, -2.306566, 1, 0.1607843, 0, 1,
-1.964483, 1.193594, -2.482083, 1, 0.1686275, 0, 1,
-1.955927, 0.6878498, -1.097891, 1, 0.172549, 0, 1,
-1.955854, -0.9769959, -1.990361, 1, 0.1803922, 0, 1,
-1.954822, -0.6713271, -1.13083, 1, 0.1843137, 0, 1,
-1.913859, -0.06947014, -0.865849, 1, 0.1921569, 0, 1,
-1.912727, 0.7401665, -0.2233628, 1, 0.1960784, 0, 1,
-1.884552, 0.05287095, -0.8672203, 1, 0.2039216, 0, 1,
-1.869, 1.020188, 2.132004, 1, 0.2117647, 0, 1,
-1.860904, -0.178539, -1.025629, 1, 0.2156863, 0, 1,
-1.833913, -1.408134, -1.879281, 1, 0.2235294, 0, 1,
-1.831974, 0.04538009, -2.342425, 1, 0.227451, 0, 1,
-1.819278, 0.6062472, -2.837512, 1, 0.2352941, 0, 1,
-1.803423, -1.905967, -1.856434, 1, 0.2392157, 0, 1,
-1.797942, 0.05518061, -2.79221, 1, 0.2470588, 0, 1,
-1.788115, -1.532026, -3.164526, 1, 0.2509804, 0, 1,
-1.784405, 1.66124, -0.1005107, 1, 0.2588235, 0, 1,
-1.758388, 0.3497595, -0.8432945, 1, 0.2627451, 0, 1,
-1.753266, 0.3935975, -1.423612, 1, 0.2705882, 0, 1,
-1.75183, -0.5632232, -1.748187, 1, 0.2745098, 0, 1,
-1.733127, 0.7754108, -3.106792, 1, 0.282353, 0, 1,
-1.731921, -0.3996473, -2.717021, 1, 0.2862745, 0, 1,
-1.714308, -0.04648446, -1.494145, 1, 0.2941177, 0, 1,
-1.71357, -1.735892, -2.893842, 1, 0.3019608, 0, 1,
-1.702663, -0.66083, -1.831343, 1, 0.3058824, 0, 1,
-1.68491, -0.2004546, -2.047295, 1, 0.3137255, 0, 1,
-1.665425, 0.7971204, 0.3194593, 1, 0.3176471, 0, 1,
-1.650535, 0.8327025, 1.232307, 1, 0.3254902, 0, 1,
-1.638843, 0.4030071, -2.345335, 1, 0.3294118, 0, 1,
-1.637634, -0.9275106, -1.721586, 1, 0.3372549, 0, 1,
-1.624044, -0.3139683, -0.8526624, 1, 0.3411765, 0, 1,
-1.618779, -0.3817917, -2.272517, 1, 0.3490196, 0, 1,
-1.609464, 0.5992295, -1.016513, 1, 0.3529412, 0, 1,
-1.588035, 1.535695, -0.8823342, 1, 0.3607843, 0, 1,
-1.566501, -0.009358007, -2.087028, 1, 0.3647059, 0, 1,
-1.561668, -0.5283629, -1.122742, 1, 0.372549, 0, 1,
-1.559814, 1.004625, 0.2218217, 1, 0.3764706, 0, 1,
-1.552627, -0.2720882, -1.506521, 1, 0.3843137, 0, 1,
-1.551023, -0.134593, -1.742632, 1, 0.3882353, 0, 1,
-1.534906, 0.1616177, -2.019634, 1, 0.3960784, 0, 1,
-1.53389, 0.4886897, 0.1404539, 1, 0.4039216, 0, 1,
-1.505566, -0.8185388, -1.466615, 1, 0.4078431, 0, 1,
-1.505052, -0.2857099, -1.933163, 1, 0.4156863, 0, 1,
-1.496133, -0.7243655, -2.074692, 1, 0.4196078, 0, 1,
-1.477752, 0.1019886, -5.125487, 1, 0.427451, 0, 1,
-1.472488, 0.7902784, 1.417467, 1, 0.4313726, 0, 1,
-1.471761, 2.495508, 0.2085508, 1, 0.4392157, 0, 1,
-1.471526, -1.066692, -2.052305, 1, 0.4431373, 0, 1,
-1.470667, 0.1574675, -1.996023, 1, 0.4509804, 0, 1,
-1.46351, -1.361333, -2.503812, 1, 0.454902, 0, 1,
-1.452592, 0.7945541, 1.63697, 1, 0.4627451, 0, 1,
-1.445044, -0.9219831, -0.1655818, 1, 0.4666667, 0, 1,
-1.442183, 0.6097543, -0.2173948, 1, 0.4745098, 0, 1,
-1.440486, -0.7758499, -0.7026711, 1, 0.4784314, 0, 1,
-1.437948, 0.2001595, -0.5713966, 1, 0.4862745, 0, 1,
-1.434264, 0.3725061, -0.4561876, 1, 0.4901961, 0, 1,
-1.409865, 1.104203, -0.6016272, 1, 0.4980392, 0, 1,
-1.407533, -0.5122205, -3.48129, 1, 0.5058824, 0, 1,
-1.406873, 0.2623489, 0.3971268, 1, 0.509804, 0, 1,
-1.400196, 1.137053, -2.846336, 1, 0.5176471, 0, 1,
-1.399817, -0.6843458, -1.720001, 1, 0.5215687, 0, 1,
-1.39756, 1.132546, -1.191413, 1, 0.5294118, 0, 1,
-1.397324, 0.9369393, -0.6980793, 1, 0.5333334, 0, 1,
-1.377794, 0.746808, -1.338735, 1, 0.5411765, 0, 1,
-1.361455, -0.4202362, -0.4763952, 1, 0.5450981, 0, 1,
-1.328637, -0.735769, -0.9301491, 1, 0.5529412, 0, 1,
-1.324308, 0.5420953, -0.5807765, 1, 0.5568628, 0, 1,
-1.324018, 0.8707148, -1.298536, 1, 0.5647059, 0, 1,
-1.323431, -0.2924868, -2.362275, 1, 0.5686275, 0, 1,
-1.319113, 1.984849, -0.02232786, 1, 0.5764706, 0, 1,
-1.303936, -0.05670675, -2.551198, 1, 0.5803922, 0, 1,
-1.295408, 0.8710241, -0.7426808, 1, 0.5882353, 0, 1,
-1.288811, 1.07414, -0.8359071, 1, 0.5921569, 0, 1,
-1.284778, 0.1411992, -1.272351, 1, 0.6, 0, 1,
-1.276546, 0.1378203, -0.4535525, 1, 0.6078432, 0, 1,
-1.275389, -0.7459393, -1.121585, 1, 0.6117647, 0, 1,
-1.266246, 0.5458716, -0.2761497, 1, 0.6196079, 0, 1,
-1.265634, 0.394969, -2.631347, 1, 0.6235294, 0, 1,
-1.263546, -1.565703, -3.702842, 1, 0.6313726, 0, 1,
-1.256451, 0.1661168, -0.7079909, 1, 0.6352941, 0, 1,
-1.254326, 0.3681839, -0.5059135, 1, 0.6431373, 0, 1,
-1.254294, 1.191028, -0.8116381, 1, 0.6470588, 0, 1,
-1.249778, -1.413404, -3.905866, 1, 0.654902, 0, 1,
-1.24539, -1.434704, -2.030332, 1, 0.6588235, 0, 1,
-1.239889, -0.7092944, -0.91914, 1, 0.6666667, 0, 1,
-1.23618, -0.4746836, -1.216438, 1, 0.6705883, 0, 1,
-1.227344, -0.1058967, -1.232024, 1, 0.6784314, 0, 1,
-1.225344, 0.5519102, -0.6126106, 1, 0.682353, 0, 1,
-1.221892, 0.3406456, -2.60673, 1, 0.6901961, 0, 1,
-1.208669, 0.855723, -1.771881, 1, 0.6941177, 0, 1,
-1.208573, -0.6017315, -2.785348, 1, 0.7019608, 0, 1,
-1.195279, -0.03226335, -1.88911, 1, 0.7098039, 0, 1,
-1.192839, 0.2033782, -1.130352, 1, 0.7137255, 0, 1,
-1.187078, -0.3934336, -0.1623321, 1, 0.7215686, 0, 1,
-1.186663, -2.528202, -3.018034, 1, 0.7254902, 0, 1,
-1.178429, -0.05852807, -2.104093, 1, 0.7333333, 0, 1,
-1.178383, -2.450418, -3.412853, 1, 0.7372549, 0, 1,
-1.173607, 1.011606, -0.5629526, 1, 0.7450981, 0, 1,
-1.170053, 0.3698959, -1.631283, 1, 0.7490196, 0, 1,
-1.163066, 0.02122535, -1.46348, 1, 0.7568628, 0, 1,
-1.15629, 0.5814708, -1.620799, 1, 0.7607843, 0, 1,
-1.140142, 1.41028, 0.3292562, 1, 0.7686275, 0, 1,
-1.140011, 0.8177873, -0.05948106, 1, 0.772549, 0, 1,
-1.139059, 0.006663893, -2.154898, 1, 0.7803922, 0, 1,
-1.137356, 0.2738298, -1.984439, 1, 0.7843137, 0, 1,
-1.133511, -0.001196523, -1.130977, 1, 0.7921569, 0, 1,
-1.131214, -2.075166, -1.402725, 1, 0.7960784, 0, 1,
-1.130717, 0.5549747, -1.498431, 1, 0.8039216, 0, 1,
-1.126668, -0.7086933, -1.878075, 1, 0.8117647, 0, 1,
-1.120464, 1.341618, 1.729667, 1, 0.8156863, 0, 1,
-1.118978, 0.3291736, -2.390587, 1, 0.8235294, 0, 1,
-1.117932, -2.107347, -4.411026, 1, 0.827451, 0, 1,
-1.117518, -1.352257, -2.459962, 1, 0.8352941, 0, 1,
-1.117515, 1.372624, 1.713147, 1, 0.8392157, 0, 1,
-1.11691, 0.3773131, -0.1914424, 1, 0.8470588, 0, 1,
-1.114244, 0.2215183, -0.8780397, 1, 0.8509804, 0, 1,
-1.111692, -1.565029, -4.18693, 1, 0.8588235, 0, 1,
-1.111605, 0.8677793, -2.35941, 1, 0.8627451, 0, 1,
-1.093129, -1.821201, -3.176753, 1, 0.8705882, 0, 1,
-1.089458, -0.1307373, 0.4358042, 1, 0.8745098, 0, 1,
-1.088127, 0.7056117, -0.8599061, 1, 0.8823529, 0, 1,
-1.083008, -0.3887568, -3.075035, 1, 0.8862745, 0, 1,
-1.078243, 1.359618, -0.5773563, 1, 0.8941177, 0, 1,
-1.077553, 2.184062, 2.115197, 1, 0.8980392, 0, 1,
-1.072668, 0.572899, -1.580343, 1, 0.9058824, 0, 1,
-1.061806, -0.7801297, -2.397845, 1, 0.9137255, 0, 1,
-1.056281, 0.1621624, -2.235173, 1, 0.9176471, 0, 1,
-1.053394, 0.2528723, -1.074454, 1, 0.9254902, 0, 1,
-1.050257, -1.031974, -1.826983, 1, 0.9294118, 0, 1,
-1.042751, 0.7508466, -0.3142182, 1, 0.9372549, 0, 1,
-1.039517, 0.8863663, -1.511528, 1, 0.9411765, 0, 1,
-1.026094, -0.560692, -2.241436, 1, 0.9490196, 0, 1,
-1.018961, -0.2230284, -1.740951, 1, 0.9529412, 0, 1,
-1.013677, 0.4581317, -2.149592, 1, 0.9607843, 0, 1,
-1.006066, -0.7086467, -1.34562, 1, 0.9647059, 0, 1,
-1.005689, -1.469465, -4.279337, 1, 0.972549, 0, 1,
-1.000278, -2.597551, -3.232339, 1, 0.9764706, 0, 1,
-0.9952274, -2.62524, -4.038789, 1, 0.9843137, 0, 1,
-0.9919002, -0.4999043, -3.370465, 1, 0.9882353, 0, 1,
-0.9914038, 0.8297154, -0.1543034, 1, 0.9960784, 0, 1,
-0.9909073, -0.9564214, -3.84206, 0.9960784, 1, 0, 1,
-0.9788666, 0.167904, -1.104019, 0.9921569, 1, 0, 1,
-0.9774719, -0.333497, -2.439834, 0.9843137, 1, 0, 1,
-0.9760655, -0.5572481, -3.425747, 0.9803922, 1, 0, 1,
-0.9728483, 1.828648, -2.085689, 0.972549, 1, 0, 1,
-0.9610217, 1.022668, -1.152045, 0.9686275, 1, 0, 1,
-0.9579138, 0.2307652, -1.089745, 0.9607843, 1, 0, 1,
-0.9493815, -0.1404252, -2.532217, 0.9568627, 1, 0, 1,
-0.9484721, -1.525325, -3.288204, 0.9490196, 1, 0, 1,
-0.9464822, 0.001607731, -2.47488, 0.945098, 1, 0, 1,
-0.9443245, 1.567717, -1.225738, 0.9372549, 1, 0, 1,
-0.9370419, -1.574496, -2.404989, 0.9333333, 1, 0, 1,
-0.9329988, -0.9131459, -3.791871, 0.9254902, 1, 0, 1,
-0.9320363, 1.97148, -1.057538, 0.9215686, 1, 0, 1,
-0.9191535, 0.1923185, -2.762565, 0.9137255, 1, 0, 1,
-0.9103677, -1.760953, -3.496758, 0.9098039, 1, 0, 1,
-0.9101795, 1.798002, -0.7746753, 0.9019608, 1, 0, 1,
-0.9086364, -1.045058, -1.925316, 0.8941177, 1, 0, 1,
-0.9065875, 0.09674706, -2.741898, 0.8901961, 1, 0, 1,
-0.9060792, -0.2218417, -3.385805, 0.8823529, 1, 0, 1,
-0.9025558, 0.0503728, -0.4384523, 0.8784314, 1, 0, 1,
-0.9004371, -0.7590541, -3.923512, 0.8705882, 1, 0, 1,
-0.8986993, -1.975025, -2.680173, 0.8666667, 1, 0, 1,
-0.8969943, -0.2687122, -1.774526, 0.8588235, 1, 0, 1,
-0.8938372, -1.351189, -2.614103, 0.854902, 1, 0, 1,
-0.8925264, 2.086945, -0.1506444, 0.8470588, 1, 0, 1,
-0.8771152, -0.01369777, -2.875186, 0.8431373, 1, 0, 1,
-0.870849, 1.897179, -0.6176074, 0.8352941, 1, 0, 1,
-0.8491915, -0.247613, -1.269121, 0.8313726, 1, 0, 1,
-0.8338866, -0.06738085, -1.499504, 0.8235294, 1, 0, 1,
-0.8333052, -0.750112, -3.655652, 0.8196079, 1, 0, 1,
-0.8280645, 2.846551, 0.04534736, 0.8117647, 1, 0, 1,
-0.8256723, -0.9153427, -2.57438, 0.8078431, 1, 0, 1,
-0.8247244, -1.637533, -0.8449933, 0.8, 1, 0, 1,
-0.8241254, -0.01264962, -1.245985, 0.7921569, 1, 0, 1,
-0.8201823, -0.1200656, -1.961165, 0.7882353, 1, 0, 1,
-0.8191045, -0.6116032, -4.166481, 0.7803922, 1, 0, 1,
-0.8171226, 1.559733, -0.6546571, 0.7764706, 1, 0, 1,
-0.8126062, -1.124483, -2.843663, 0.7686275, 1, 0, 1,
-0.8028486, 2.079482, -1.389096, 0.7647059, 1, 0, 1,
-0.8024152, -0.2012963, -2.192958, 0.7568628, 1, 0, 1,
-0.7992411, 0.6659798, -0.840655, 0.7529412, 1, 0, 1,
-0.7955967, 0.4165255, -2.491386, 0.7450981, 1, 0, 1,
-0.7913159, -0.9582956, -3.016714, 0.7411765, 1, 0, 1,
-0.7900333, 1.238719, -0.2217076, 0.7333333, 1, 0, 1,
-0.7867346, -0.4840571, -3.213975, 0.7294118, 1, 0, 1,
-0.7845789, 1.05118, -2.267701, 0.7215686, 1, 0, 1,
-0.7775952, 1.215128, 0.488154, 0.7176471, 1, 0, 1,
-0.7706196, -0.7337819, -0.05554978, 0.7098039, 1, 0, 1,
-0.767949, 0.2131259, -0.2353392, 0.7058824, 1, 0, 1,
-0.7651802, -1.133616, -1.773541, 0.6980392, 1, 0, 1,
-0.753792, -0.5738153, -1.736441, 0.6901961, 1, 0, 1,
-0.7497887, 0.2043018, -0.9109764, 0.6862745, 1, 0, 1,
-0.7490842, 0.5110298, 0.06975807, 0.6784314, 1, 0, 1,
-0.7483351, 0.9837296, 1.077499, 0.6745098, 1, 0, 1,
-0.7473878, -0.7069253, -3.074582, 0.6666667, 1, 0, 1,
-0.7473358, -0.4210414, -4.560116, 0.6627451, 1, 0, 1,
-0.7458014, 0.7658364, -0.172217, 0.654902, 1, 0, 1,
-0.745434, 1.087503, -0.2665933, 0.6509804, 1, 0, 1,
-0.7415107, 0.1521978, -2.315234, 0.6431373, 1, 0, 1,
-0.7365098, 0.7822793, -1.602955, 0.6392157, 1, 0, 1,
-0.7329396, 1.215695, -1.913115, 0.6313726, 1, 0, 1,
-0.7325674, 0.4124178, -1.428604, 0.627451, 1, 0, 1,
-0.7232829, -0.003500978, -1.013977, 0.6196079, 1, 0, 1,
-0.7140179, 2.544585, -1.487868, 0.6156863, 1, 0, 1,
-0.7133146, -1.109244, -1.755336, 0.6078432, 1, 0, 1,
-0.7120196, 1.265346, -1.19438, 0.6039216, 1, 0, 1,
-0.7109249, 0.04492193, -1.74428, 0.5960785, 1, 0, 1,
-0.7070317, -1.311896, -3.53306, 0.5882353, 1, 0, 1,
-0.7063348, -1.402982, -1.237275, 0.5843138, 1, 0, 1,
-0.6877297, 1.935888, -1.084512, 0.5764706, 1, 0, 1,
-0.6852226, -0.5616568, -2.637134, 0.572549, 1, 0, 1,
-0.684288, -0.6668867, -1.552559, 0.5647059, 1, 0, 1,
-0.6815931, -1.935217, -2.853003, 0.5607843, 1, 0, 1,
-0.6809533, 0.05837432, -1.806878, 0.5529412, 1, 0, 1,
-0.6802069, -1.777928, -1.19902, 0.5490196, 1, 0, 1,
-0.6797506, 0.7053157, -2.088326, 0.5411765, 1, 0, 1,
-0.6769474, -0.4248825, -4.223993, 0.5372549, 1, 0, 1,
-0.6713634, -0.9083389, -1.259532, 0.5294118, 1, 0, 1,
-0.667944, -0.6068069, -2.437079, 0.5254902, 1, 0, 1,
-0.6669729, -0.5055323, -1.988738, 0.5176471, 1, 0, 1,
-0.6604741, -0.2574419, -2.414368, 0.5137255, 1, 0, 1,
-0.6596525, -1.4488, -1.188025, 0.5058824, 1, 0, 1,
-0.6537307, -0.5312532, -1.475627, 0.5019608, 1, 0, 1,
-0.6520345, 1.039456, 0.9339291, 0.4941176, 1, 0, 1,
-0.6480126, -0.3662875, -2.832251, 0.4862745, 1, 0, 1,
-0.6471303, -0.5687234, -2.767763, 0.4823529, 1, 0, 1,
-0.6470361, 0.1239145, -0.2875108, 0.4745098, 1, 0, 1,
-0.644541, -0.7488636, -0.7745655, 0.4705882, 1, 0, 1,
-0.6418979, -1.107162, -3.82389, 0.4627451, 1, 0, 1,
-0.6363988, 0.3095286, -0.2985938, 0.4588235, 1, 0, 1,
-0.6350604, 0.8217349, -0.7142024, 0.4509804, 1, 0, 1,
-0.6345684, -0.05492688, -1.000359, 0.4470588, 1, 0, 1,
-0.6287124, 1.858418, -0.01678893, 0.4392157, 1, 0, 1,
-0.6238461, 0.5793537, -2.003903, 0.4352941, 1, 0, 1,
-0.6215081, 1.813737, -0.7984986, 0.427451, 1, 0, 1,
-0.6117245, -1.140772, -3.241114, 0.4235294, 1, 0, 1,
-0.6092457, 1.478144, -0.3664303, 0.4156863, 1, 0, 1,
-0.606846, 0.711006, -0.2584159, 0.4117647, 1, 0, 1,
-0.6065897, -0.0969643, -4.117253, 0.4039216, 1, 0, 1,
-0.6042923, -0.3895517, -2.422873, 0.3960784, 1, 0, 1,
-0.6038173, 0.1931142, -1.167192, 0.3921569, 1, 0, 1,
-0.6013461, 0.5249867, 0.01487281, 0.3843137, 1, 0, 1,
-0.5998927, 0.3300333, -1.072302, 0.3803922, 1, 0, 1,
-0.5932975, -0.1179292, -2.047547, 0.372549, 1, 0, 1,
-0.592425, 0.4001889, 0.5118902, 0.3686275, 1, 0, 1,
-0.5903179, -0.6755932, -1.986342, 0.3607843, 1, 0, 1,
-0.5871216, -1.217051, -3.767349, 0.3568628, 1, 0, 1,
-0.585018, -0.6769036, -2.0242, 0.3490196, 1, 0, 1,
-0.5843199, 1.280401, 0.8045124, 0.345098, 1, 0, 1,
-0.5815807, 0.5950646, -0.7824433, 0.3372549, 1, 0, 1,
-0.5798862, 1.350675, -1.309598, 0.3333333, 1, 0, 1,
-0.5792686, -0.6147131, -1.780049, 0.3254902, 1, 0, 1,
-0.5778742, -1.10897, -0.6981131, 0.3215686, 1, 0, 1,
-0.57716, -0.01287418, -1.651066, 0.3137255, 1, 0, 1,
-0.5709692, -0.347031, -2.366349, 0.3098039, 1, 0, 1,
-0.5679832, -1.072147, -2.103176, 0.3019608, 1, 0, 1,
-0.564051, -0.5369845, -1.870366, 0.2941177, 1, 0, 1,
-0.5595434, 0.4358128, -1.320122, 0.2901961, 1, 0, 1,
-0.5546633, 0.8160024, 0.4197051, 0.282353, 1, 0, 1,
-0.5537, -2.316805, -3.629048, 0.2784314, 1, 0, 1,
-0.5489828, 1.096999, -0.9081608, 0.2705882, 1, 0, 1,
-0.5479023, -1.080646, -1.719944, 0.2666667, 1, 0, 1,
-0.5473648, 1.048001, 0.4662384, 0.2588235, 1, 0, 1,
-0.5437567, 0.3917565, -1.648115, 0.254902, 1, 0, 1,
-0.5415299, -0.2616846, -2.153591, 0.2470588, 1, 0, 1,
-0.5401326, 0.494018, -2.34046, 0.2431373, 1, 0, 1,
-0.53855, -1.396904, -3.381739, 0.2352941, 1, 0, 1,
-0.538504, -0.4458084, 0.2144899, 0.2313726, 1, 0, 1,
-0.5355361, 1.458936, -0.1204112, 0.2235294, 1, 0, 1,
-0.5351662, -0.7285674, -2.413701, 0.2196078, 1, 0, 1,
-0.5318511, -0.2703851, -3.256922, 0.2117647, 1, 0, 1,
-0.5303126, -1.081994, -3.990036, 0.2078431, 1, 0, 1,
-0.52527, 0.9771453, -1.635433, 0.2, 1, 0, 1,
-0.521364, 0.3369744, -2.762675, 0.1921569, 1, 0, 1,
-0.5158205, 1.533044, 1.303609, 0.1882353, 1, 0, 1,
-0.5145012, -0.2094651, -3.508498, 0.1803922, 1, 0, 1,
-0.5138084, 0.4815753, -1.167977, 0.1764706, 1, 0, 1,
-0.5126634, -1.047826, -1.608019, 0.1686275, 1, 0, 1,
-0.5119976, -0.2258536, -1.938944, 0.1647059, 1, 0, 1,
-0.5090098, -0.5980451, -2.442443, 0.1568628, 1, 0, 1,
-0.5087031, -0.1421014, -2.814731, 0.1529412, 1, 0, 1,
-0.5060588, 0.07016601, -1.116956, 0.145098, 1, 0, 1,
-0.5034804, -1.683643, -3.301724, 0.1411765, 1, 0, 1,
-0.4961613, 0.7052955, -1.234609, 0.1333333, 1, 0, 1,
-0.4942878, 1.448875, -0.3934062, 0.1294118, 1, 0, 1,
-0.4924259, 1.448414, -0.676887, 0.1215686, 1, 0, 1,
-0.4911062, 1.879776, 0.2482467, 0.1176471, 1, 0, 1,
-0.491063, -0.542424, -1.996445, 0.1098039, 1, 0, 1,
-0.4897496, -1.264202, -3.039574, 0.1058824, 1, 0, 1,
-0.486169, -2.101144, -4.440825, 0.09803922, 1, 0, 1,
-0.4855557, -0.2543732, -2.624818, 0.09019608, 1, 0, 1,
-0.484746, 0.453618, -0.1428371, 0.08627451, 1, 0, 1,
-0.4839124, 0.6395639, 0.6060653, 0.07843138, 1, 0, 1,
-0.4772015, -0.7136335, -2.294987, 0.07450981, 1, 0, 1,
-0.4769596, 1.171224, -0.4326941, 0.06666667, 1, 0, 1,
-0.4763241, 0.4644129, -0.4878443, 0.0627451, 1, 0, 1,
-0.4722744, 1.309521, -0.6548542, 0.05490196, 1, 0, 1,
-0.4693493, -0.3010444, -0.8023812, 0.05098039, 1, 0, 1,
-0.4692127, -1.347637, -3.173629, 0.04313726, 1, 0, 1,
-0.4671277, -0.4375215, -0.604002, 0.03921569, 1, 0, 1,
-0.4657141, 0.4046782, -0.3852557, 0.03137255, 1, 0, 1,
-0.4601743, -1.00967, -3.096823, 0.02745098, 1, 0, 1,
-0.4549507, 2.125183, -1.902978, 0.01960784, 1, 0, 1,
-0.4478678, 0.02871, -1.819898, 0.01568628, 1, 0, 1,
-0.4470249, 0.05557637, -0.9387535, 0.007843138, 1, 0, 1,
-0.4442752, 0.9644259, -0.1104962, 0.003921569, 1, 0, 1,
-0.4435228, 0.6711915, 1.172221, 0, 1, 0.003921569, 1,
-0.4310949, 0.2646629, -2.043613, 0, 1, 0.01176471, 1,
-0.4245473, -0.8221698, 0.6108561, 0, 1, 0.01568628, 1,
-0.4221831, -0.2038216, -2.960872, 0, 1, 0.02352941, 1,
-0.4157116, -0.9016148, -3.180978, 0, 1, 0.02745098, 1,
-0.4151744, 1.053378, 1.088616, 0, 1, 0.03529412, 1,
-0.41019, -0.313338, -3.827518, 0, 1, 0.03921569, 1,
-0.4057876, -0.156015, -2.849407, 0, 1, 0.04705882, 1,
-0.4053268, -0.1999931, -1.982568, 0, 1, 0.05098039, 1,
-0.4005854, 0.3957967, -1.068704, 0, 1, 0.05882353, 1,
-0.3952565, 0.2724712, 2.390782, 0, 1, 0.0627451, 1,
-0.3949831, 0.8506527, -0.3332955, 0, 1, 0.07058824, 1,
-0.3941585, 1.515711, -0.529047, 0, 1, 0.07450981, 1,
-0.3920599, 0.3377786, -0.7446554, 0, 1, 0.08235294, 1,
-0.3915578, 0.6267346, -2.370502, 0, 1, 0.08627451, 1,
-0.3908433, -0.5138685, -3.736632, 0, 1, 0.09411765, 1,
-0.3891573, 0.3994312, -0.114293, 0, 1, 0.1019608, 1,
-0.3890136, 0.2110185, -0.6117994, 0, 1, 0.1058824, 1,
-0.3860882, 1.333359, -0.2907777, 0, 1, 0.1137255, 1,
-0.3835258, -1.549249, -4.505443, 0, 1, 0.1176471, 1,
-0.3831842, -1.537711, -2.074767, 0, 1, 0.1254902, 1,
-0.3774695, 0.8050963, -1.265558, 0, 1, 0.1294118, 1,
-0.3753547, 0.1724258, -1.316918, 0, 1, 0.1372549, 1,
-0.3739085, 0.6444689, 0.2066562, 0, 1, 0.1411765, 1,
-0.3729765, -1.652098, -2.690026, 0, 1, 0.1490196, 1,
-0.3715943, -0.9618989, -2.958324, 0, 1, 0.1529412, 1,
-0.3674553, 1.104297, 0.148956, 0, 1, 0.1607843, 1,
-0.3666674, 0.6971964, -2.067143, 0, 1, 0.1647059, 1,
-0.3621323, -0.1459318, -3.059384, 0, 1, 0.172549, 1,
-0.3599895, 0.6344736, -0.6233038, 0, 1, 0.1764706, 1,
-0.3583683, -0.3227707, -3.851624, 0, 1, 0.1843137, 1,
-0.3577227, 0.61176, -1.005098, 0, 1, 0.1882353, 1,
-0.3563137, -0.3251746, -1.605599, 0, 1, 0.1960784, 1,
-0.3493845, 0.325041, -0.8534549, 0, 1, 0.2039216, 1,
-0.3486026, 1.848698, -0.5815871, 0, 1, 0.2078431, 1,
-0.3473339, 0.3574606, -0.4504459, 0, 1, 0.2156863, 1,
-0.343344, 0.05696582, 0.5103079, 0, 1, 0.2196078, 1,
-0.3356107, -0.6552221, -3.430839, 0, 1, 0.227451, 1,
-0.331997, -0.8174526, -2.349376, 0, 1, 0.2313726, 1,
-0.3315392, 1.149635, 0.2863638, 0, 1, 0.2392157, 1,
-0.3308162, -0.1752791, -2.2243, 0, 1, 0.2431373, 1,
-0.3272357, -0.5660672, -1.134776, 0, 1, 0.2509804, 1,
-0.3176626, -1.850166, -3.073144, 0, 1, 0.254902, 1,
-0.316448, -0.3795603, -3.174629, 0, 1, 0.2627451, 1,
-0.3151424, 1.867355, -0.4911723, 0, 1, 0.2666667, 1,
-0.3070084, 0.1923681, -0.2696672, 0, 1, 0.2745098, 1,
-0.3060169, -3.391922, -3.944187, 0, 1, 0.2784314, 1,
-0.3036451, -2.274004, -2.967655, 0, 1, 0.2862745, 1,
-0.3012256, 0.2245599, -0.8542906, 0, 1, 0.2901961, 1,
-0.2962486, -0.43506, -2.781356, 0, 1, 0.2980392, 1,
-0.2958622, 0.2716522, -0.8297557, 0, 1, 0.3058824, 1,
-0.2958228, 0.7287925, -0.3196107, 0, 1, 0.3098039, 1,
-0.295671, 0.3723605, -0.768849, 0, 1, 0.3176471, 1,
-0.2862995, -1.780845, -5.296752, 0, 1, 0.3215686, 1,
-0.2862568, 1.724972, -0.5619159, 0, 1, 0.3294118, 1,
-0.2857884, 0.5315374, 0.8009275, 0, 1, 0.3333333, 1,
-0.2843016, -0.5310829, -2.635457, 0, 1, 0.3411765, 1,
-0.2765974, -1.045722, -4.044139, 0, 1, 0.345098, 1,
-0.2763244, -0.1194241, -2.585307, 0, 1, 0.3529412, 1,
-0.2714559, 1.278379, 1.015969, 0, 1, 0.3568628, 1,
-0.2660638, -0.4126537, -1.618137, 0, 1, 0.3647059, 1,
-0.2654, -0.6509483, -2.417719, 0, 1, 0.3686275, 1,
-0.2650408, 1.103733, 0.2280795, 0, 1, 0.3764706, 1,
-0.2647696, 0.09778342, -2.240648, 0, 1, 0.3803922, 1,
-0.2640073, -0.5941641, -2.827416, 0, 1, 0.3882353, 1,
-0.2627802, -2.7515, -5.35326, 0, 1, 0.3921569, 1,
-0.2605293, -2.677999, -3.299735, 0, 1, 0.4, 1,
-0.2533477, -0.5477479, -3.522796, 0, 1, 0.4078431, 1,
-0.2531925, -1.590959, -0.958284, 0, 1, 0.4117647, 1,
-0.2528367, 1.168896, -0.4940205, 0, 1, 0.4196078, 1,
-0.2518143, -0.857724, -0.9386038, 0, 1, 0.4235294, 1,
-0.2502718, 0.3931262, -0.419901, 0, 1, 0.4313726, 1,
-0.2470146, -0.01525337, -1.003708, 0, 1, 0.4352941, 1,
-0.2397039, 0.6880488, -1.381905, 0, 1, 0.4431373, 1,
-0.2300525, 0.9034718, -1.812388, 0, 1, 0.4470588, 1,
-0.2300396, -1.074457, -3.400746, 0, 1, 0.454902, 1,
-0.2285741, 1.199138, 0.2363787, 0, 1, 0.4588235, 1,
-0.2275196, 1.781874, 0.5677263, 0, 1, 0.4666667, 1,
-0.22452, 0.7986991, 1.08895, 0, 1, 0.4705882, 1,
-0.2240427, -0.548209, -4.294099, 0, 1, 0.4784314, 1,
-0.2209836, -0.03078731, -2.684255, 0, 1, 0.4823529, 1,
-0.2208359, 0.109998, -2.573727, 0, 1, 0.4901961, 1,
-0.2193571, -3.3995, -4.382153, 0, 1, 0.4941176, 1,
-0.2193303, 0.5969262, -1.16224, 0, 1, 0.5019608, 1,
-0.2175321, -0.2905355, -1.220947, 0, 1, 0.509804, 1,
-0.2152678, 2.002583, 1.102116, 0, 1, 0.5137255, 1,
-0.2150861, -2.075898, -3.17382, 0, 1, 0.5215687, 1,
-0.2132421, 0.3558414, -0.5028686, 0, 1, 0.5254902, 1,
-0.2122768, 0.1342768, -1.992368, 0, 1, 0.5333334, 1,
-0.2107063, -0.09973836, -0.8941094, 0, 1, 0.5372549, 1,
-0.2096682, -0.5672516, -1.804725, 0, 1, 0.5450981, 1,
-0.2072921, 0.218312, -0.9747382, 0, 1, 0.5490196, 1,
-0.2061268, -0.2731389, -2.118145, 0, 1, 0.5568628, 1,
-0.2056441, 1.014985, -1.138564, 0, 1, 0.5607843, 1,
-0.2050964, -1.698801, -3.765306, 0, 1, 0.5686275, 1,
-0.1999612, -1.281718, -3.119157, 0, 1, 0.572549, 1,
-0.1984896, 0.2223034, 1.162631, 0, 1, 0.5803922, 1,
-0.1951249, 0.5738596, -1.872901, 0, 1, 0.5843138, 1,
-0.1938647, -1.685499, -2.680448, 0, 1, 0.5921569, 1,
-0.1856541, -1.152348, -3.282764, 0, 1, 0.5960785, 1,
-0.1813751, 0.08174542, -1.543996, 0, 1, 0.6039216, 1,
-0.1806544, -0.3700877, -2.104808, 0, 1, 0.6117647, 1,
-0.1786098, 0.8746601, 2.63453, 0, 1, 0.6156863, 1,
-0.1715433, 0.1403634, -1.811646, 0, 1, 0.6235294, 1,
-0.168238, -1.131972, -3.686715, 0, 1, 0.627451, 1,
-0.1636463, 0.3747824, 0.3769037, 0, 1, 0.6352941, 1,
-0.1612417, -0.05398187, -1.043123, 0, 1, 0.6392157, 1,
-0.158711, -0.0733707, -0.8044566, 0, 1, 0.6470588, 1,
-0.1579159, -2.644405, -4.601856, 0, 1, 0.6509804, 1,
-0.1534804, 0.2113501, 0.9833459, 0, 1, 0.6588235, 1,
-0.1514472, 0.5033483, -0.8955735, 0, 1, 0.6627451, 1,
-0.1431234, -0.5871455, -4.122981, 0, 1, 0.6705883, 1,
-0.1394988, -0.2033443, -2.222944, 0, 1, 0.6745098, 1,
-0.1389688, -0.7470337, -2.403564, 0, 1, 0.682353, 1,
-0.1361302, 0.5405168, -1.118597, 0, 1, 0.6862745, 1,
-0.1348379, 1.055924, 2.315868, 0, 1, 0.6941177, 1,
-0.1318211, -1.326534, -2.709882, 0, 1, 0.7019608, 1,
-0.1317779, 1.388962, -0.6621782, 0, 1, 0.7058824, 1,
-0.1310585, 1.563361, 0.3534499, 0, 1, 0.7137255, 1,
-0.1298237, 1.917936, 0.1503969, 0, 1, 0.7176471, 1,
-0.1284581, -0.2376045, -1.669463, 0, 1, 0.7254902, 1,
-0.1267614, 0.816797, 0.3553196, 0, 1, 0.7294118, 1,
-0.1201313, 1.049373, -0.885644, 0, 1, 0.7372549, 1,
-0.1158264, -0.3445387, -1.401001, 0, 1, 0.7411765, 1,
-0.1146671, -1.606521, -3.116248, 0, 1, 0.7490196, 1,
-0.1139259, 1.336091, -0.08394186, 0, 1, 0.7529412, 1,
-0.1117269, -0.1578051, -3.334391, 0, 1, 0.7607843, 1,
-0.1115453, 0.7971882, 0.6936279, 0, 1, 0.7647059, 1,
-0.1102031, -0.4212241, -0.3011459, 0, 1, 0.772549, 1,
-0.107617, -0.5472803, -3.984438, 0, 1, 0.7764706, 1,
-0.09918229, -0.2827713, -1.709463, 0, 1, 0.7843137, 1,
-0.09267811, -0.4826328, -1.755332, 0, 1, 0.7882353, 1,
-0.09221217, -1.634612, -2.035324, 0, 1, 0.7960784, 1,
-0.09110287, -0.8141972, -2.260506, 0, 1, 0.8039216, 1,
-0.08957552, 0.1286358, -2.283734, 0, 1, 0.8078431, 1,
-0.08691929, -0.1141605, -1.994505, 0, 1, 0.8156863, 1,
-0.08379936, -0.6346064, -2.854877, 0, 1, 0.8196079, 1,
-0.08125915, 0.7296878, -0.3283416, 0, 1, 0.827451, 1,
-0.08115318, -0.04010873, -2.445088, 0, 1, 0.8313726, 1,
-0.07880554, -0.2043211, -2.58147, 0, 1, 0.8392157, 1,
-0.07753529, 0.6256225, -0.2341958, 0, 1, 0.8431373, 1,
-0.07336269, -0.7421167, -1.722651, 0, 1, 0.8509804, 1,
-0.0716773, -0.6091259, -2.698491, 0, 1, 0.854902, 1,
-0.06832885, -0.3584147, -3.038044, 0, 1, 0.8627451, 1,
-0.06427988, -0.7181323, -3.523756, 0, 1, 0.8666667, 1,
-0.06402523, -0.6579295, -2.776884, 0, 1, 0.8745098, 1,
-0.05877833, 0.03704961, -1.954108, 0, 1, 0.8784314, 1,
-0.0585371, 0.1144804, 1.224289, 0, 1, 0.8862745, 1,
-0.05467704, 0.7560589, -0.7001144, 0, 1, 0.8901961, 1,
-0.05464356, 0.6759602, 1.764771, 0, 1, 0.8980392, 1,
-0.04966851, 0.05786012, -0.7006963, 0, 1, 0.9058824, 1,
-0.04669393, -0.83768, -3.88686, 0, 1, 0.9098039, 1,
-0.04539679, 0.365215, -0.4727038, 0, 1, 0.9176471, 1,
-0.03905458, 0.2009941, -0.8245817, 0, 1, 0.9215686, 1,
-0.03712794, -1.674133, -2.453196, 0, 1, 0.9294118, 1,
-0.03478847, 0.3148781, -0.6137249, 0, 1, 0.9333333, 1,
-0.03268713, 0.5846555, -1.260188, 0, 1, 0.9411765, 1,
-0.03125113, 0.02038444, -1.63107, 0, 1, 0.945098, 1,
-0.0281383, -0.529716, -3.797393, 0, 1, 0.9529412, 1,
-0.0279105, 0.2988478, 2.049077, 0, 1, 0.9568627, 1,
-0.01970897, -0.01996635, -1.493669, 0, 1, 0.9647059, 1,
-0.01627019, -0.6770502, -2.750082, 0, 1, 0.9686275, 1,
-0.01604688, -0.7060314, -2.914106, 0, 1, 0.9764706, 1,
-0.01196876, -1.356379, -4.795111, 0, 1, 0.9803922, 1,
-0.009024615, -0.1993404, -1.962629, 0, 1, 0.9882353, 1,
-0.006857278, 0.0587975, -1.199013, 0, 1, 0.9921569, 1,
0.001207751, 0.2607313, -0.4827998, 0, 1, 1, 1,
0.00123178, 0.7797633, -0.8132759, 0, 0.9921569, 1, 1,
0.01127052, -0.429677, 3.338226, 0, 0.9882353, 1, 1,
0.01286727, -0.5147242, 4.230441, 0, 0.9803922, 1, 1,
0.01439802, 0.7290147, -0.7523373, 0, 0.9764706, 1, 1,
0.01723795, -1.18096, 2.794109, 0, 0.9686275, 1, 1,
0.02181584, -0.6949241, 1.641804, 0, 0.9647059, 1, 1,
0.02445087, -0.04067519, 3.042066, 0, 0.9568627, 1, 1,
0.02860264, 0.5815842, 1.736973, 0, 0.9529412, 1, 1,
0.03377839, 0.8017797, -1.897372, 0, 0.945098, 1, 1,
0.03455649, -0.1203565, 1.620565, 0, 0.9411765, 1, 1,
0.03505452, 1.281545, -0.3624004, 0, 0.9333333, 1, 1,
0.03870072, -0.971681, 2.531719, 0, 0.9294118, 1, 1,
0.04143647, 1.338531, 0.1260093, 0, 0.9215686, 1, 1,
0.0415229, 1.974653, -1.836553, 0, 0.9176471, 1, 1,
0.0457642, 0.4889728, -0.2131519, 0, 0.9098039, 1, 1,
0.04712918, -0.187593, 4.043855, 0, 0.9058824, 1, 1,
0.04911043, -0.5004447, 4.04829, 0, 0.8980392, 1, 1,
0.05366987, 0.8093026, 0.370797, 0, 0.8901961, 1, 1,
0.06340414, 0.1235071, -1.031032, 0, 0.8862745, 1, 1,
0.06665582, 1.052454, 0.6332677, 0, 0.8784314, 1, 1,
0.06717748, -0.3647029, 2.718883, 0, 0.8745098, 1, 1,
0.07141321, -2.439249, 6.235445, 0, 0.8666667, 1, 1,
0.07238527, 0.2888362, 0.01979155, 0, 0.8627451, 1, 1,
0.07651136, 0.4737806, -2.478777, 0, 0.854902, 1, 1,
0.0771175, -0.2807195, 3.643119, 0, 0.8509804, 1, 1,
0.07766233, 0.5287598, 0.6657484, 0, 0.8431373, 1, 1,
0.07931199, -1.239241, 3.16747, 0, 0.8392157, 1, 1,
0.08407567, -1.504393, 2.139567, 0, 0.8313726, 1, 1,
0.08422326, 0.5598051, -0.7789527, 0, 0.827451, 1, 1,
0.09126064, -0.3188109, 3.101843, 0, 0.8196079, 1, 1,
0.09296104, 1.134398, -0.9135331, 0, 0.8156863, 1, 1,
0.093338, -0.7322541, 3.381532, 0, 0.8078431, 1, 1,
0.09629459, -0.6240103, 1.917829, 0, 0.8039216, 1, 1,
0.100094, -0.8083718, 0.8724205, 0, 0.7960784, 1, 1,
0.1004051, -0.1189115, 2.521037, 0, 0.7882353, 1, 1,
0.1103783, 0.7381927, -0.6413186, 0, 0.7843137, 1, 1,
0.111895, 0.8436701, 0.4442701, 0, 0.7764706, 1, 1,
0.1151963, -0.3470563, 3.155188, 0, 0.772549, 1, 1,
0.1166517, -0.1837644, 2.068971, 0, 0.7647059, 1, 1,
0.1183119, 0.2619145, 0.5360624, 0, 0.7607843, 1, 1,
0.1207199, -0.1584337, 1.48593, 0, 0.7529412, 1, 1,
0.1209119, 1.269234, -0.1109237, 0, 0.7490196, 1, 1,
0.1237028, 0.1821584, 1.474071, 0, 0.7411765, 1, 1,
0.1237532, -0.4435523, 3.931345, 0, 0.7372549, 1, 1,
0.126202, -1.684087, 3.365237, 0, 0.7294118, 1, 1,
0.1275149, -0.6064728, 2.218087, 0, 0.7254902, 1, 1,
0.1318646, 0.3023979, 0.734126, 0, 0.7176471, 1, 1,
0.1367231, -0.7082776, 4.633673, 0, 0.7137255, 1, 1,
0.1389127, 0.3105325, -1.790015, 0, 0.7058824, 1, 1,
0.1422938, 1.010859, -0.6186773, 0, 0.6980392, 1, 1,
0.1431446, -1.238351, 3.712498, 0, 0.6941177, 1, 1,
0.1435482, -0.2292435, 2.442475, 0, 0.6862745, 1, 1,
0.14924, -0.2420128, 3.192018, 0, 0.682353, 1, 1,
0.1575965, 0.4312199, 0.4727444, 0, 0.6745098, 1, 1,
0.1600599, 0.431824, 0.1268368, 0, 0.6705883, 1, 1,
0.1607495, 0.6834942, 0.7554765, 0, 0.6627451, 1, 1,
0.1620148, -0.09612261, 2.525323, 0, 0.6588235, 1, 1,
0.1647818, -0.335308, 5.758196, 0, 0.6509804, 1, 1,
0.1657727, 0.08332175, 2.088689, 0, 0.6470588, 1, 1,
0.1678029, 0.5485983, -1.337193, 0, 0.6392157, 1, 1,
0.1747524, 0.252565, -0.1814864, 0, 0.6352941, 1, 1,
0.1751741, -1.126475, 2.24023, 0, 0.627451, 1, 1,
0.1756213, 1.874451, 0.8367186, 0, 0.6235294, 1, 1,
0.1796092, 1.207121, 0.3203759, 0, 0.6156863, 1, 1,
0.1798474, 0.9522073, -0.1827445, 0, 0.6117647, 1, 1,
0.1814776, 0.302386, 0.3972191, 0, 0.6039216, 1, 1,
0.1835302, -2.282866, 3.220165, 0, 0.5960785, 1, 1,
0.1913378, -1.042691, 4.165675, 0, 0.5921569, 1, 1,
0.1932766, -0.3851998, 3.266726, 0, 0.5843138, 1, 1,
0.1971615, -0.2396635, 4.854917, 0, 0.5803922, 1, 1,
0.2014136, -0.5062892, 2.91645, 0, 0.572549, 1, 1,
0.2018102, -1.524321, 3.411843, 0, 0.5686275, 1, 1,
0.2054389, 0.5172166, 0.330703, 0, 0.5607843, 1, 1,
0.2094879, 1.025705, -0.8877513, 0, 0.5568628, 1, 1,
0.2134144, 0.7878386, 0.4161864, 0, 0.5490196, 1, 1,
0.2163807, 0.1048957, 0.8394706, 0, 0.5450981, 1, 1,
0.2169959, -1.017105, 3.581573, 0, 0.5372549, 1, 1,
0.2193018, -0.3831741, 3.315644, 0, 0.5333334, 1, 1,
0.2211621, -0.2570783, 2.774955, 0, 0.5254902, 1, 1,
0.2214328, -0.6898373, 2.328851, 0, 0.5215687, 1, 1,
0.2242663, -0.5829253, 2.472662, 0, 0.5137255, 1, 1,
0.2261285, -1.250209, 3.717461, 0, 0.509804, 1, 1,
0.2296852, -0.5246229, 0.843454, 0, 0.5019608, 1, 1,
0.2343878, -3.484253, 2.987051, 0, 0.4941176, 1, 1,
0.2356784, -1.40704, 1.970151, 0, 0.4901961, 1, 1,
0.2360669, 0.7782407, 0.5977535, 0, 0.4823529, 1, 1,
0.2368403, -0.1526505, 0.5551349, 0, 0.4784314, 1, 1,
0.2386473, -0.07366797, 2.315324, 0, 0.4705882, 1, 1,
0.2393416, 0.7732053, 1.084206, 0, 0.4666667, 1, 1,
0.243847, 0.9689519, 1.768016, 0, 0.4588235, 1, 1,
0.2539815, -0.1658422, 2.426322, 0, 0.454902, 1, 1,
0.2563375, -0.5705422, 1.970024, 0, 0.4470588, 1, 1,
0.2567154, 1.177585, 1.073867, 0, 0.4431373, 1, 1,
0.2570603, -0.3604181, 3.047114, 0, 0.4352941, 1, 1,
0.2581788, -0.7973982, 3.332977, 0, 0.4313726, 1, 1,
0.2595889, -0.2975087, 1.64952, 0, 0.4235294, 1, 1,
0.2646902, -0.153088, 1.73746, 0, 0.4196078, 1, 1,
0.2718382, -0.06554224, 1.704057, 0, 0.4117647, 1, 1,
0.2760477, -0.9705051, 1.513894, 0, 0.4078431, 1, 1,
0.2771717, 0.4295822, 0.2903598, 0, 0.4, 1, 1,
0.2782484, 0.8710479, 0.6825291, 0, 0.3921569, 1, 1,
0.279436, 0.1387609, 0.8299856, 0, 0.3882353, 1, 1,
0.2821839, 0.1702262, 0.8225633, 0, 0.3803922, 1, 1,
0.2859833, -0.02964943, 2.048828, 0, 0.3764706, 1, 1,
0.2884748, -1.502966, 2.348362, 0, 0.3686275, 1, 1,
0.2910394, -0.1374772, 1.853756, 0, 0.3647059, 1, 1,
0.2929158, 2.461575, 0.2017777, 0, 0.3568628, 1, 1,
0.2932679, 0.9570321, -0.5059571, 0, 0.3529412, 1, 1,
0.2956155, 1.990888, 1.634496, 0, 0.345098, 1, 1,
0.2962344, -0.6176046, 2.368182, 0, 0.3411765, 1, 1,
0.3017291, 0.4224896, 0.6852196, 0, 0.3333333, 1, 1,
0.3051507, 0.555088, -1.203432, 0, 0.3294118, 1, 1,
0.3226807, 0.5118229, -0.694493, 0, 0.3215686, 1, 1,
0.3257015, -0.1896753, 1.113467, 0, 0.3176471, 1, 1,
0.3265796, -0.5456005, 3.537496, 0, 0.3098039, 1, 1,
0.3295777, -1.214502, -0.1144017, 0, 0.3058824, 1, 1,
0.3366949, 2.142385, 1.574334, 0, 0.2980392, 1, 1,
0.3400637, -0.4310616, 4.022777, 0, 0.2901961, 1, 1,
0.3510118, -1.528139, 1.123206, 0, 0.2862745, 1, 1,
0.3523327, 1.045848, -0.4684612, 0, 0.2784314, 1, 1,
0.353983, -0.1051571, 1.590346, 0, 0.2745098, 1, 1,
0.3588175, 0.5242821, 1.733076, 0, 0.2666667, 1, 1,
0.3606229, 0.369809, 1.081688, 0, 0.2627451, 1, 1,
0.3655011, -1.667191, 1.898534, 0, 0.254902, 1, 1,
0.366143, 0.3009343, 0.6062384, 0, 0.2509804, 1, 1,
0.366742, -0.03123303, -0.5898488, 0, 0.2431373, 1, 1,
0.3683518, -0.4869891, 1.76162, 0, 0.2392157, 1, 1,
0.3707547, 2.466537, -0.180291, 0, 0.2313726, 1, 1,
0.3729556, 0.5402465, 0.6729726, 0, 0.227451, 1, 1,
0.3736552, -1.075875, 3.26238, 0, 0.2196078, 1, 1,
0.3796182, 1.595452, -0.2107725, 0, 0.2156863, 1, 1,
0.3823482, 0.3974505, 1.246842, 0, 0.2078431, 1, 1,
0.3857138, -2.205199, 1.978166, 0, 0.2039216, 1, 1,
0.3872518, -0.2533151, 2.313279, 0, 0.1960784, 1, 1,
0.3872711, -0.4573271, 3.277236, 0, 0.1882353, 1, 1,
0.3872881, -0.01943201, 2.378603, 0, 0.1843137, 1, 1,
0.3884057, 0.1520236, 1.919267, 0, 0.1764706, 1, 1,
0.3884748, 0.8367926, 0.6523427, 0, 0.172549, 1, 1,
0.3897679, 1.853123, 1.652347, 0, 0.1647059, 1, 1,
0.3898257, 0.8251553, -0.2896681, 0, 0.1607843, 1, 1,
0.3928915, -1.567822, 1.571043, 0, 0.1529412, 1, 1,
0.395556, 0.3962097, 2.233248, 0, 0.1490196, 1, 1,
0.3965011, 0.3080967, 0.1740839, 0, 0.1411765, 1, 1,
0.3969757, 0.7828028, 0.2690082, 0, 0.1372549, 1, 1,
0.3994084, 0.1081947, 0.7112288, 0, 0.1294118, 1, 1,
0.4031376, 2.17355, -0.552862, 0, 0.1254902, 1, 1,
0.4138084, 0.01725859, 1.971789, 0, 0.1176471, 1, 1,
0.4172362, 2.487977, -0.5358886, 0, 0.1137255, 1, 1,
0.420633, 2.230454, -1.947004, 0, 0.1058824, 1, 1,
0.4264503, 1.7127, -0.1851447, 0, 0.09803922, 1, 1,
0.4270604, -0.7245951, 3.754318, 0, 0.09411765, 1, 1,
0.4297713, -1.062766, 3.672119, 0, 0.08627451, 1, 1,
0.434387, -1.253867, 5.277586, 0, 0.08235294, 1, 1,
0.435928, 1.623182, 1.162206, 0, 0.07450981, 1, 1,
0.4425636, 1.428352, -1.208984, 0, 0.07058824, 1, 1,
0.4453067, 0.5341146, -0.5680226, 0, 0.0627451, 1, 1,
0.4476741, 0.5921165, -0.4345728, 0, 0.05882353, 1, 1,
0.4487339, 1.56793, 1.03296, 0, 0.05098039, 1, 1,
0.4530444, 0.08059517, -0.6559696, 0, 0.04705882, 1, 1,
0.4534395, 0.3324477, 2.374769, 0, 0.03921569, 1, 1,
0.4593255, 1.215262, 1.238852, 0, 0.03529412, 1, 1,
0.4680853, 0.3510521, 1.125174, 0, 0.02745098, 1, 1,
0.4710838, -1.665516, 4.003446, 0, 0.02352941, 1, 1,
0.4735971, 2.82776, -0.8661951, 0, 0.01568628, 1, 1,
0.4737667, 0.4980218, -0.1625192, 0, 0.01176471, 1, 1,
0.4831028, 0.2390529, 2.218376, 0, 0.003921569, 1, 1,
0.4858843, 0.09711871, 2.054068, 0.003921569, 0, 1, 1,
0.4866232, 0.6797901, 1.119157, 0.007843138, 0, 1, 1,
0.4880986, -0.1456108, 0.69189, 0.01568628, 0, 1, 1,
0.4896048, -0.3644063, 2.174797, 0.01960784, 0, 1, 1,
0.4912065, -0.2714537, 4.297198, 0.02745098, 0, 1, 1,
0.4926158, -0.8278068, 2.767577, 0.03137255, 0, 1, 1,
0.4939847, -1.534031, 4.184224, 0.03921569, 0, 1, 1,
0.4939976, 0.7359401, 0.2839524, 0.04313726, 0, 1, 1,
0.4948294, -0.1501985, 2.255913, 0.05098039, 0, 1, 1,
0.5017384, 0.4345491, 0.01467496, 0.05490196, 0, 1, 1,
0.5022805, -0.05072312, 2.25879, 0.0627451, 0, 1, 1,
0.511382, 1.516793, -0.6312961, 0.06666667, 0, 1, 1,
0.516948, -0.1500089, 0.7477366, 0.07450981, 0, 1, 1,
0.5182117, 0.8032261, 1.080666, 0.07843138, 0, 1, 1,
0.5226865, -1.01636, 3.031107, 0.08627451, 0, 1, 1,
0.5247922, 0.2276729, 1.457162, 0.09019608, 0, 1, 1,
0.5252606, -0.1462936, 1.801254, 0.09803922, 0, 1, 1,
0.5301202, 2.591346, 0.4144042, 0.1058824, 0, 1, 1,
0.5357636, 0.6905416, 0.7797883, 0.1098039, 0, 1, 1,
0.5362957, 1.120653, 0.6100875, 0.1176471, 0, 1, 1,
0.5376573, 0.7354359, -0.5354483, 0.1215686, 0, 1, 1,
0.5404248, -0.9782096, 1.664097, 0.1294118, 0, 1, 1,
0.5435445, 0.9771138, 0.7359677, 0.1333333, 0, 1, 1,
0.5442348, -0.6905808, 2.730227, 0.1411765, 0, 1, 1,
0.544856, 0.3301738, -0.2351367, 0.145098, 0, 1, 1,
0.5459881, 0.3587694, 1.240177, 0.1529412, 0, 1, 1,
0.5485809, -0.3454399, 3.896382, 0.1568628, 0, 1, 1,
0.5556932, 0.5839438, 1.115063, 0.1647059, 0, 1, 1,
0.562081, -0.2633902, 0.5470828, 0.1686275, 0, 1, 1,
0.5666969, -1.273983, 3.297881, 0.1764706, 0, 1, 1,
0.5680865, -0.0230603, 1.176956, 0.1803922, 0, 1, 1,
0.568962, 0.08695527, 2.021322, 0.1882353, 0, 1, 1,
0.5694146, 0.4006367, 2.528049, 0.1921569, 0, 1, 1,
0.5699367, 0.1288798, 0.5026362, 0.2, 0, 1, 1,
0.5706981, 0.2103485, 1.018927, 0.2078431, 0, 1, 1,
0.5747072, -0.2633226, 2.180653, 0.2117647, 0, 1, 1,
0.5773712, 0.5559589, -0.05016364, 0.2196078, 0, 1, 1,
0.5783298, -0.3260003, 0.8037453, 0.2235294, 0, 1, 1,
0.5824146, 0.1284598, 1.667329, 0.2313726, 0, 1, 1,
0.5901604, 1.052199, 0.4301352, 0.2352941, 0, 1, 1,
0.5932522, 1.019942, 0.006934298, 0.2431373, 0, 1, 1,
0.6070344, -0.5148733, 2.902215, 0.2470588, 0, 1, 1,
0.6086012, 0.3444653, 0.8350351, 0.254902, 0, 1, 1,
0.6103576, 2.176737, -0.7113727, 0.2588235, 0, 1, 1,
0.6108146, -0.5293648, 2.703768, 0.2666667, 0, 1, 1,
0.6153709, 0.2690047, -0.4706292, 0.2705882, 0, 1, 1,
0.6219697, 2.494637, -0.008116859, 0.2784314, 0, 1, 1,
0.6225043, 0.1258218, 0.7002503, 0.282353, 0, 1, 1,
0.6249084, 0.1797765, 2.643556, 0.2901961, 0, 1, 1,
0.625706, 0.9396217, -1.444168, 0.2941177, 0, 1, 1,
0.6259038, -0.1246146, 1.829259, 0.3019608, 0, 1, 1,
0.6282932, 0.9967407, 1.533813, 0.3098039, 0, 1, 1,
0.6307402, -0.3835257, 2.233987, 0.3137255, 0, 1, 1,
0.6314833, -0.002140242, 1.776632, 0.3215686, 0, 1, 1,
0.632531, 0.4422105, 0.5882103, 0.3254902, 0, 1, 1,
0.6444467, 0.7831969, 2.11404, 0.3333333, 0, 1, 1,
0.6493234, 0.3999614, -0.3661151, 0.3372549, 0, 1, 1,
0.6496001, 0.9489067, -0.2126653, 0.345098, 0, 1, 1,
0.6509092, -0.732657, 2.490132, 0.3490196, 0, 1, 1,
0.6509479, -1.233968, 1.916241, 0.3568628, 0, 1, 1,
0.6542533, -0.4627718, 2.590632, 0.3607843, 0, 1, 1,
0.6556143, -0.2386869, 0.6332269, 0.3686275, 0, 1, 1,
0.6631153, -1.235245, 2.817122, 0.372549, 0, 1, 1,
0.6633882, -0.57793, 1.496976, 0.3803922, 0, 1, 1,
0.6654481, 1.008682, -0.2807746, 0.3843137, 0, 1, 1,
0.6665054, -2.772866, 1.661555, 0.3921569, 0, 1, 1,
0.6666297, -0.07949106, 0.3678202, 0.3960784, 0, 1, 1,
0.6717494, 0.9311548, 1.011695, 0.4039216, 0, 1, 1,
0.6804959, -0.08150961, 3.618205, 0.4117647, 0, 1, 1,
0.6809384, 0.4177072, -0.9999357, 0.4156863, 0, 1, 1,
0.6818366, 1.011052, 1.457515, 0.4235294, 0, 1, 1,
0.6835889, 0.3823376, 0.9787328, 0.427451, 0, 1, 1,
0.685313, -0.9403362, 2.865846, 0.4352941, 0, 1, 1,
0.6855634, 0.2138832, 3.208143, 0.4392157, 0, 1, 1,
0.6893366, 0.1377123, 3.2143, 0.4470588, 0, 1, 1,
0.692151, 0.092661, 1.426224, 0.4509804, 0, 1, 1,
0.6979182, 1.656726, -0.3482797, 0.4588235, 0, 1, 1,
0.7005425, 1.426374, 0.1139727, 0.4627451, 0, 1, 1,
0.7050264, -1.13952, 3.104849, 0.4705882, 0, 1, 1,
0.7148839, -0.4233506, 0.5863856, 0.4745098, 0, 1, 1,
0.7213117, -0.8203121, 3.274091, 0.4823529, 0, 1, 1,
0.7236169, -0.02049323, 3.474704, 0.4862745, 0, 1, 1,
0.7335867, 0.03928436, 2.641948, 0.4941176, 0, 1, 1,
0.7343537, -0.06069228, 0.6069698, 0.5019608, 0, 1, 1,
0.7385081, 0.6727959, 0.8633039, 0.5058824, 0, 1, 1,
0.7419083, -0.2500338, 2.145981, 0.5137255, 0, 1, 1,
0.7432175, -2.236687, 2.101984, 0.5176471, 0, 1, 1,
0.7555116, -1.459487, 1.311645, 0.5254902, 0, 1, 1,
0.7566787, -1.316291, 2.888566, 0.5294118, 0, 1, 1,
0.7570885, 0.5206579, 0.8242453, 0.5372549, 0, 1, 1,
0.7599088, 1.346082, -0.964343, 0.5411765, 0, 1, 1,
0.7622734, 1.27923, 0.8399583, 0.5490196, 0, 1, 1,
0.7695583, -1.350189, 2.278215, 0.5529412, 0, 1, 1,
0.7698103, 1.016946, 1.543756, 0.5607843, 0, 1, 1,
0.7720593, -1.695615, 3.839092, 0.5647059, 0, 1, 1,
0.7724521, 0.1247761, 0.1439858, 0.572549, 0, 1, 1,
0.7795903, 0.1002443, -0.2984504, 0.5764706, 0, 1, 1,
0.7816285, 1.544874, -0.08621296, 0.5843138, 0, 1, 1,
0.7822539, -2.057953, 1.512823, 0.5882353, 0, 1, 1,
0.7826546, 0.2720439, 0.5242473, 0.5960785, 0, 1, 1,
0.78934, 0.3229198, 2.470498, 0.6039216, 0, 1, 1,
0.7918273, -0.1893435, 1.905815, 0.6078432, 0, 1, 1,
0.7938701, 0.6433948, 1.847247, 0.6156863, 0, 1, 1,
0.8006487, -0.04184005, 1.761277, 0.6196079, 0, 1, 1,
0.8039743, 1.856251, 1.892045, 0.627451, 0, 1, 1,
0.8043678, 1.985253, 2.93696, 0.6313726, 0, 1, 1,
0.8066974, 2.425612, -0.1573975, 0.6392157, 0, 1, 1,
0.8092306, -0.80436, 1.734722, 0.6431373, 0, 1, 1,
0.8099606, 0.9511169, 0.05052228, 0.6509804, 0, 1, 1,
0.8164285, -0.4585885, 1.183729, 0.654902, 0, 1, 1,
0.8169975, 0.5806142, 0.9478387, 0.6627451, 0, 1, 1,
0.8251035, -1.398551, 3.071398, 0.6666667, 0, 1, 1,
0.8268465, 0.5867708, 0.3905593, 0.6745098, 0, 1, 1,
0.8375893, 0.02328383, 0.9415808, 0.6784314, 0, 1, 1,
0.8377647, -0.4189608, 1.965255, 0.6862745, 0, 1, 1,
0.842627, 0.04567084, 2.856217, 0.6901961, 0, 1, 1,
0.8473461, -1.090307, 1.070406, 0.6980392, 0, 1, 1,
0.8481535, 1.468726, 0.270669, 0.7058824, 0, 1, 1,
0.8487257, -0.0944715, 0.376974, 0.7098039, 0, 1, 1,
0.8518733, -0.6299212, 2.71373, 0.7176471, 0, 1, 1,
0.8545352, 0.4588415, 1.239541, 0.7215686, 0, 1, 1,
0.8557621, 0.6354043, 0.5162211, 0.7294118, 0, 1, 1,
0.8572956, -0.163839, 2.151781, 0.7333333, 0, 1, 1,
0.8664717, -1.363345, 1.556388, 0.7411765, 0, 1, 1,
0.8768387, -0.8526148, 0.0822101, 0.7450981, 0, 1, 1,
0.8771693, 0.7905244, 0.9350967, 0.7529412, 0, 1, 1,
0.8830619, -0.2156256, -0.4856588, 0.7568628, 0, 1, 1,
0.8904414, -0.4034477, 0.2555016, 0.7647059, 0, 1, 1,
0.8948808, 2.802941, 0.8692287, 0.7686275, 0, 1, 1,
0.9070666, 0.4260619, -0.5255606, 0.7764706, 0, 1, 1,
0.9088796, 1.149031, 0.9970393, 0.7803922, 0, 1, 1,
0.9122361, -1.346014, 2.312845, 0.7882353, 0, 1, 1,
0.9123293, -1.28142, 1.305802, 0.7921569, 0, 1, 1,
0.9133195, -0.2278533, 0.9409581, 0.8, 0, 1, 1,
0.9143691, 1.350236, 1.125642, 0.8078431, 0, 1, 1,
0.9165143, 0.5702761, 2.481532, 0.8117647, 0, 1, 1,
0.9204572, -1.221569, 2.965223, 0.8196079, 0, 1, 1,
0.9234902, 0.6372756, 2.709727, 0.8235294, 0, 1, 1,
0.9235833, -0.01535397, 1.402281, 0.8313726, 0, 1, 1,
0.9236455, 0.4982779, 2.953622, 0.8352941, 0, 1, 1,
0.9252557, -1.315953, 1.686835, 0.8431373, 0, 1, 1,
0.927289, -1.301501, 1.6753, 0.8470588, 0, 1, 1,
0.9290435, 1.817716, -0.3581949, 0.854902, 0, 1, 1,
0.9333372, -1.237043, 1.821947, 0.8588235, 0, 1, 1,
0.9376265, -0.7310625, 1.875666, 0.8666667, 0, 1, 1,
0.9410134, 1.088461, 0.245583, 0.8705882, 0, 1, 1,
0.9537161, 0.8078494, -1.105598, 0.8784314, 0, 1, 1,
0.955906, -1.466872, 1.576764, 0.8823529, 0, 1, 1,
0.9600998, -0.7048923, 2.497649, 0.8901961, 0, 1, 1,
0.9604939, -2.447452, 3.570392, 0.8941177, 0, 1, 1,
0.9625449, -0.1504281, 4.100898, 0.9019608, 0, 1, 1,
0.9679058, -0.369772, 2.857397, 0.9098039, 0, 1, 1,
0.9689516, -0.8173889, 3.708706, 0.9137255, 0, 1, 1,
0.9702848, -1.04116, 2.916201, 0.9215686, 0, 1, 1,
0.9789355, -0.8244145, 2.581707, 0.9254902, 0, 1, 1,
0.9811848, 0.6485975, 2.29789, 0.9333333, 0, 1, 1,
0.9830382, -2.279181, 1.516216, 0.9372549, 0, 1, 1,
0.9833031, -1.814185, 3.640711, 0.945098, 0, 1, 1,
0.9912481, -0.8612914, 1.081953, 0.9490196, 0, 1, 1,
0.9950114, 0.7296212, 1.245079, 0.9568627, 0, 1, 1,
1.001653, -1.579677, 3.885555, 0.9607843, 0, 1, 1,
1.001695, -0.3499266, 0.1249047, 0.9686275, 0, 1, 1,
1.002324, -1.083783, 2.164674, 0.972549, 0, 1, 1,
1.009193, 0.3232967, 1.096377, 0.9803922, 0, 1, 1,
1.009606, -0.3992282, 1.862932, 0.9843137, 0, 1, 1,
1.019358, -0.4236917, 2.939599, 0.9921569, 0, 1, 1,
1.021902, -0.2130236, 1.928745, 0.9960784, 0, 1, 1,
1.028224, 1.338873, 0.2617612, 1, 0, 0.9960784, 1,
1.029061, 0.4517037, 0.8358929, 1, 0, 0.9882353, 1,
1.030971, -0.8255539, 1.232563, 1, 0, 0.9843137, 1,
1.035457, 0.09908583, 1.600571, 1, 0, 0.9764706, 1,
1.042336, 0.8129969, 0.9780369, 1, 0, 0.972549, 1,
1.04687, 0.8110004, 0.7150123, 1, 0, 0.9647059, 1,
1.051391, -0.0519269, 1.560987, 1, 0, 0.9607843, 1,
1.051929, 0.3225555, 1.865937, 1, 0, 0.9529412, 1,
1.057305, 0.1794388, 0.1269411, 1, 0, 0.9490196, 1,
1.058007, -0.05505329, 2.895267, 1, 0, 0.9411765, 1,
1.061976, -1.931889, 3.722153, 1, 0, 0.9372549, 1,
1.063509, -0.7366906, 3.535151, 1, 0, 0.9294118, 1,
1.067656, 0.9994656, 1.798769, 1, 0, 0.9254902, 1,
1.067964, -0.5838588, 1.982064, 1, 0, 0.9176471, 1,
1.069165, -1.272984, 1.248246, 1, 0, 0.9137255, 1,
1.074822, -0.2206494, 3.181718, 1, 0, 0.9058824, 1,
1.083882, -0.07951821, 2.993659, 1, 0, 0.9019608, 1,
1.084468, -0.5894194, 1.663365, 1, 0, 0.8941177, 1,
1.089378, 0.04174561, 0.4096997, 1, 0, 0.8862745, 1,
1.100624, 0.2211582, 0.1227521, 1, 0, 0.8823529, 1,
1.102101, -0.6961547, 1.022525, 1, 0, 0.8745098, 1,
1.11658, -0.003950893, -0.3161092, 1, 0, 0.8705882, 1,
1.120756, -0.3029347, 2.142133, 1, 0, 0.8627451, 1,
1.127784, 0.002140269, 0.619783, 1, 0, 0.8588235, 1,
1.132442, -0.03022942, 1.128058, 1, 0, 0.8509804, 1,
1.132638, -0.719832, 3.505718, 1, 0, 0.8470588, 1,
1.133735, 0.07880577, 2.828373, 1, 0, 0.8392157, 1,
1.149037, 0.6968693, -0.03913749, 1, 0, 0.8352941, 1,
1.154054, 0.6562325, 2.293944, 1, 0, 0.827451, 1,
1.159453, 1.415319, 0.07679439, 1, 0, 0.8235294, 1,
1.163525, -0.7665792, 3.747693, 1, 0, 0.8156863, 1,
1.16715, 1.472714, 0.4222884, 1, 0, 0.8117647, 1,
1.169351, 0.1605691, 1.67601, 1, 0, 0.8039216, 1,
1.171553, -0.5059672, 1.635057, 1, 0, 0.7960784, 1,
1.174177, 1.183484, 1.071745, 1, 0, 0.7921569, 1,
1.177546, -0.2862432, 1.453963, 1, 0, 0.7843137, 1,
1.184654, -1.100888, 3.214443, 1, 0, 0.7803922, 1,
1.185676, -0.7055192, 3.515786, 1, 0, 0.772549, 1,
1.185852, -0.1414076, 3.023607, 1, 0, 0.7686275, 1,
1.193072, 0.6404331, 0.3692801, 1, 0, 0.7607843, 1,
1.19308, 0.6288838, 0.04732753, 1, 0, 0.7568628, 1,
1.195226, 0.6408403, 1.113469, 1, 0, 0.7490196, 1,
1.209295, 0.7042702, 0.5652571, 1, 0, 0.7450981, 1,
1.227442, -1.78566, 5.449955, 1, 0, 0.7372549, 1,
1.231343, 0.08227528, 1.046479, 1, 0, 0.7333333, 1,
1.233438, 0.3328522, 1.428081, 1, 0, 0.7254902, 1,
1.234752, 0.4148925, 1.642114, 1, 0, 0.7215686, 1,
1.240698, -0.070797, 0.7368531, 1, 0, 0.7137255, 1,
1.241496, -0.513018, 3.19145, 1, 0, 0.7098039, 1,
1.244693, -1.010052, 4.071081, 1, 0, 0.7019608, 1,
1.256731, -0.6221038, 0.5446781, 1, 0, 0.6941177, 1,
1.258399, -0.4018784, 1.032319, 1, 0, 0.6901961, 1,
1.260058, 0.372998, 1.946558, 1, 0, 0.682353, 1,
1.261973, 1.758385, -0.01958811, 1, 0, 0.6784314, 1,
1.268735, -0.8144475, 1.411287, 1, 0, 0.6705883, 1,
1.270321, 0.5160417, 0.7581282, 1, 0, 0.6666667, 1,
1.275753, 1.279797, 2.219319, 1, 0, 0.6588235, 1,
1.294882, -1.332977, 2.012809, 1, 0, 0.654902, 1,
1.294889, -0.889685, 1.934842, 1, 0, 0.6470588, 1,
1.298449, 0.9998593, 0.143038, 1, 0, 0.6431373, 1,
1.301212, -0.379, 2.55199, 1, 0, 0.6352941, 1,
1.306954, 0.0778142, 0.2653633, 1, 0, 0.6313726, 1,
1.309342, -0.8678813, 2.611918, 1, 0, 0.6235294, 1,
1.310815, -0.216323, 3.209009, 1, 0, 0.6196079, 1,
1.315632, -1.535304, 3.067433, 1, 0, 0.6117647, 1,
1.320629, -1.563803, 1.23416, 1, 0, 0.6078432, 1,
1.321669, -1.024906, 1.666575, 1, 0, 0.6, 1,
1.324076, 1.28624, 1.060537, 1, 0, 0.5921569, 1,
1.324872, -1.878854, 2.259859, 1, 0, 0.5882353, 1,
1.325512, -0.3605894, 1.199182, 1, 0, 0.5803922, 1,
1.328918, 1.600225, 2.315339, 1, 0, 0.5764706, 1,
1.32968, 0.7944821, 1.292687, 1, 0, 0.5686275, 1,
1.340951, -1.413853, 2.755576, 1, 0, 0.5647059, 1,
1.346942, -0.7675217, 2.293706, 1, 0, 0.5568628, 1,
1.354329, 0.3799566, 1.19193, 1, 0, 0.5529412, 1,
1.360643, -1.098693, 2.239204, 1, 0, 0.5450981, 1,
1.370785, -0.03279715, 0.7381895, 1, 0, 0.5411765, 1,
1.378384, 0.9465558, 1.937249, 1, 0, 0.5333334, 1,
1.384541, -0.7955365, 1.0643, 1, 0, 0.5294118, 1,
1.405326, 0.1807593, 2.304194, 1, 0, 0.5215687, 1,
1.412035, -1.359336, 0.3320937, 1, 0, 0.5176471, 1,
1.431236, 1.971077, 2.25457, 1, 0, 0.509804, 1,
1.432834, 1.420416, 0.3060921, 1, 0, 0.5058824, 1,
1.44425, 1.019413, 0.4885947, 1, 0, 0.4980392, 1,
1.44814, -0.1516691, 2.707128, 1, 0, 0.4901961, 1,
1.453985, 2.032366, 0.05580375, 1, 0, 0.4862745, 1,
1.456728, -1.034138, 3.127601, 1, 0, 0.4784314, 1,
1.466692, 0.5931243, 0.3468369, 1, 0, 0.4745098, 1,
1.474377, 0.1708481, 1.144635, 1, 0, 0.4666667, 1,
1.478345, -0.4976213, 1.604564, 1, 0, 0.4627451, 1,
1.478762, 0.9705684, 2.456519, 1, 0, 0.454902, 1,
1.485479, 0.2932103, 0.7919472, 1, 0, 0.4509804, 1,
1.494279, -1.572339, 1.164795, 1, 0, 0.4431373, 1,
1.502012, -0.04458022, 1.607017, 1, 0, 0.4392157, 1,
1.506082, -0.05203551, 2.985734, 1, 0, 0.4313726, 1,
1.533202, 1.749818, 0.5627775, 1, 0, 0.427451, 1,
1.534832, -0.9287385, 1.869831, 1, 0, 0.4196078, 1,
1.537614, -0.3671375, 2.082267, 1, 0, 0.4156863, 1,
1.558101, 1.025534, 0.494785, 1, 0, 0.4078431, 1,
1.558614, -0.1377511, 0.4943385, 1, 0, 0.4039216, 1,
1.561943, -0.6330044, 2.840977, 1, 0, 0.3960784, 1,
1.564671, 1.013702, 0.9647258, 1, 0, 0.3882353, 1,
1.581405, 1.64893, 2.118808, 1, 0, 0.3843137, 1,
1.581945, 1.1616, 0.3579836, 1, 0, 0.3764706, 1,
1.602358, 2.367324, 1.275695, 1, 0, 0.372549, 1,
1.60255, 0.133044, 0.2888586, 1, 0, 0.3647059, 1,
1.617292, -0.7482712, 2.067458, 1, 0, 0.3607843, 1,
1.632897, -0.04722493, 2.073139, 1, 0, 0.3529412, 1,
1.635831, -0.8805661, 0.6800211, 1, 0, 0.3490196, 1,
1.652674, -0.2057494, 0.8194016, 1, 0, 0.3411765, 1,
1.654344, 1.188067, 1.498161, 1, 0, 0.3372549, 1,
1.666699, -0.2375868, 2.015328, 1, 0, 0.3294118, 1,
1.670287, -0.5015428, 2.008895, 1, 0, 0.3254902, 1,
1.671936, -0.30283, 1.311244, 1, 0, 0.3176471, 1,
1.674068, -0.8573257, 2.936389, 1, 0, 0.3137255, 1,
1.678581, 0.6308581, 1.58932, 1, 0, 0.3058824, 1,
1.680799, 2.150445, 0.9808959, 1, 0, 0.2980392, 1,
1.683353, -0.9157008, 3.033067, 1, 0, 0.2941177, 1,
1.690526, 0.3237344, 2.338716, 1, 0, 0.2862745, 1,
1.693257, -1.026074, 1.642792, 1, 0, 0.282353, 1,
1.694205, 0.1981648, 0.5451306, 1, 0, 0.2745098, 1,
1.700422, 0.228291, 1.983315, 1, 0, 0.2705882, 1,
1.715459, 0.763493, 2.05591, 1, 0, 0.2627451, 1,
1.717471, -0.9580163, 0.6275811, 1, 0, 0.2588235, 1,
1.718179, -0.9093354, 1.50517, 1, 0, 0.2509804, 1,
1.729684, -0.4312842, 0.8337497, 1, 0, 0.2470588, 1,
1.76926, 0.05093899, 0.2106659, 1, 0, 0.2392157, 1,
1.770867, -0.5337521, 2.68148, 1, 0, 0.2352941, 1,
1.771541, -0.6693563, 2.370994, 1, 0, 0.227451, 1,
1.783237, -1.880193, 2.751046, 1, 0, 0.2235294, 1,
1.817138, 0.4066265, 1.96918, 1, 0, 0.2156863, 1,
1.824133, -0.5407482, 1.253103, 1, 0, 0.2117647, 1,
1.825255, 0.8265913, 1.739285, 1, 0, 0.2039216, 1,
1.866695, -1.083763, 1.642316, 1, 0, 0.1960784, 1,
1.87352, -0.4824441, 1.847186, 1, 0, 0.1921569, 1,
1.899109, 0.003558623, 1.451959, 1, 0, 0.1843137, 1,
1.910483, -1.659865, 0.9505672, 1, 0, 0.1803922, 1,
1.926043, 0.7647122, 0.822755, 1, 0, 0.172549, 1,
1.930558, 0.5772746, 0.6390091, 1, 0, 0.1686275, 1,
1.953393, 0.02428717, 0.6014069, 1, 0, 0.1607843, 1,
1.958152, 1.604965, 0.1546748, 1, 0, 0.1568628, 1,
2.009857, -0.3786568, 1.710689, 1, 0, 0.1490196, 1,
2.026134, 0.3988625, 1.456423, 1, 0, 0.145098, 1,
2.034507, 1.209072, 1.407246, 1, 0, 0.1372549, 1,
2.044609, -1.643707, 2.465141, 1, 0, 0.1333333, 1,
2.067224, -1.748919, 1.105417, 1, 0, 0.1254902, 1,
2.097122, -0.677895, 0.2982777, 1, 0, 0.1215686, 1,
2.111097, -2.588488, 0.9039766, 1, 0, 0.1137255, 1,
2.115211, -0.6547924, 0.770759, 1, 0, 0.1098039, 1,
2.125503, 0.1807667, 3.050068, 1, 0, 0.1019608, 1,
2.203969, -1.16181, 2.472069, 1, 0, 0.09411765, 1,
2.215377, 0.7192388, 0.7119532, 1, 0, 0.09019608, 1,
2.271152, -0.9739218, 1.803116, 1, 0, 0.08235294, 1,
2.277188, -1.44671, 2.491502, 1, 0, 0.07843138, 1,
2.277194, 0.7541072, 0.2928904, 1, 0, 0.07058824, 1,
2.295309, -0.6680064, 3.047318, 1, 0, 0.06666667, 1,
2.338646, 0.2690934, 2.386911, 1, 0, 0.05882353, 1,
2.36438, -0.3436857, 2.012529, 1, 0, 0.05490196, 1,
2.399127, -1.126397, 0.315715, 1, 0, 0.04705882, 1,
2.488952, 0.2708578, 1.776517, 1, 0, 0.04313726, 1,
2.551305, 0.1361323, 1.266525, 1, 0, 0.03529412, 1,
2.61733, 0.7863045, -0.7856849, 1, 0, 0.03137255, 1,
2.617601, -0.6313652, 3.351064, 1, 0, 0.02352941, 1,
2.74865, -0.8860834, 1.438799, 1, 0, 0.01960784, 1,
2.914292, -1.123674, 2.068183, 1, 0, 0.01176471, 1,
3.23564, -0.3737945, 2.687997, 1, 0, 0.007843138, 1
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
0.2688575, -4.557324, -7.317545, 0, -0.5, 0.5, 0.5,
0.2688575, -4.557324, -7.317545, 1, -0.5, 0.5, 0.5,
0.2688575, -4.557324, -7.317545, 1, 1.5, 0.5, 0.5,
0.2688575, -4.557324, -7.317545, 0, 1.5, 0.5, 0.5
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
-3.703664, -0.3188506, -7.317545, 0, -0.5, 0.5, 0.5,
-3.703664, -0.3188506, -7.317545, 1, -0.5, 0.5, 0.5,
-3.703664, -0.3188506, -7.317545, 1, 1.5, 0.5, 0.5,
-3.703664, -0.3188506, -7.317545, 0, 1.5, 0.5, 0.5
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
-3.703664, -4.557324, 0.441093, 0, -0.5, 0.5, 0.5,
-3.703664, -4.557324, 0.441093, 1, -0.5, 0.5, 0.5,
-3.703664, -4.557324, 0.441093, 1, 1.5, 0.5, 0.5,
-3.703664, -4.557324, 0.441093, 0, 1.5, 0.5, 0.5
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
-2, -3.579215, -5.52709,
3, -3.579215, -5.52709,
-2, -3.579215, -5.52709,
-2, -3.742233, -5.825499,
-1, -3.579215, -5.52709,
-1, -3.742233, -5.825499,
0, -3.579215, -5.52709,
0, -3.742233, -5.825499,
1, -3.579215, -5.52709,
1, -3.742233, -5.825499,
2, -3.579215, -5.52709,
2, -3.742233, -5.825499,
3, -3.579215, -5.52709,
3, -3.742233, -5.825499
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
-2, -4.068269, -6.422318, 0, -0.5, 0.5, 0.5,
-2, -4.068269, -6.422318, 1, -0.5, 0.5, 0.5,
-2, -4.068269, -6.422318, 1, 1.5, 0.5, 0.5,
-2, -4.068269, -6.422318, 0, 1.5, 0.5, 0.5,
-1, -4.068269, -6.422318, 0, -0.5, 0.5, 0.5,
-1, -4.068269, -6.422318, 1, -0.5, 0.5, 0.5,
-1, -4.068269, -6.422318, 1, 1.5, 0.5, 0.5,
-1, -4.068269, -6.422318, 0, 1.5, 0.5, 0.5,
0, -4.068269, -6.422318, 0, -0.5, 0.5, 0.5,
0, -4.068269, -6.422318, 1, -0.5, 0.5, 0.5,
0, -4.068269, -6.422318, 1, 1.5, 0.5, 0.5,
0, -4.068269, -6.422318, 0, 1.5, 0.5, 0.5,
1, -4.068269, -6.422318, 0, -0.5, 0.5, 0.5,
1, -4.068269, -6.422318, 1, -0.5, 0.5, 0.5,
1, -4.068269, -6.422318, 1, 1.5, 0.5, 0.5,
1, -4.068269, -6.422318, 0, 1.5, 0.5, 0.5,
2, -4.068269, -6.422318, 0, -0.5, 0.5, 0.5,
2, -4.068269, -6.422318, 1, -0.5, 0.5, 0.5,
2, -4.068269, -6.422318, 1, 1.5, 0.5, 0.5,
2, -4.068269, -6.422318, 0, 1.5, 0.5, 0.5,
3, -4.068269, -6.422318, 0, -0.5, 0.5, 0.5,
3, -4.068269, -6.422318, 1, -0.5, 0.5, 0.5,
3, -4.068269, -6.422318, 1, 1.5, 0.5, 0.5,
3, -4.068269, -6.422318, 0, 1.5, 0.5, 0.5
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
-2.786928, -3, -5.52709,
-2.786928, 2, -5.52709,
-2.786928, -3, -5.52709,
-2.939717, -3, -5.825499,
-2.786928, -2, -5.52709,
-2.939717, -2, -5.825499,
-2.786928, -1, -5.52709,
-2.939717, -1, -5.825499,
-2.786928, 0, -5.52709,
-2.939717, 0, -5.825499,
-2.786928, 1, -5.52709,
-2.939717, 1, -5.825499,
-2.786928, 2, -5.52709,
-2.939717, 2, -5.825499
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
-3.245296, -3, -6.422318, 0, -0.5, 0.5, 0.5,
-3.245296, -3, -6.422318, 1, -0.5, 0.5, 0.5,
-3.245296, -3, -6.422318, 1, 1.5, 0.5, 0.5,
-3.245296, -3, -6.422318, 0, 1.5, 0.5, 0.5,
-3.245296, -2, -6.422318, 0, -0.5, 0.5, 0.5,
-3.245296, -2, -6.422318, 1, -0.5, 0.5, 0.5,
-3.245296, -2, -6.422318, 1, 1.5, 0.5, 0.5,
-3.245296, -2, -6.422318, 0, 1.5, 0.5, 0.5,
-3.245296, -1, -6.422318, 0, -0.5, 0.5, 0.5,
-3.245296, -1, -6.422318, 1, -0.5, 0.5, 0.5,
-3.245296, -1, -6.422318, 1, 1.5, 0.5, 0.5,
-3.245296, -1, -6.422318, 0, 1.5, 0.5, 0.5,
-3.245296, 0, -6.422318, 0, -0.5, 0.5, 0.5,
-3.245296, 0, -6.422318, 1, -0.5, 0.5, 0.5,
-3.245296, 0, -6.422318, 1, 1.5, 0.5, 0.5,
-3.245296, 0, -6.422318, 0, 1.5, 0.5, 0.5,
-3.245296, 1, -6.422318, 0, -0.5, 0.5, 0.5,
-3.245296, 1, -6.422318, 1, -0.5, 0.5, 0.5,
-3.245296, 1, -6.422318, 1, 1.5, 0.5, 0.5,
-3.245296, 1, -6.422318, 0, 1.5, 0.5, 0.5,
-3.245296, 2, -6.422318, 0, -0.5, 0.5, 0.5,
-3.245296, 2, -6.422318, 1, -0.5, 0.5, 0.5,
-3.245296, 2, -6.422318, 1, 1.5, 0.5, 0.5,
-3.245296, 2, -6.422318, 0, 1.5, 0.5, 0.5
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
-2.786928, -3.579215, -4,
-2.786928, -3.579215, 6,
-2.786928, -3.579215, -4,
-2.939717, -3.742233, -4,
-2.786928, -3.579215, -2,
-2.939717, -3.742233, -2,
-2.786928, -3.579215, 0,
-2.939717, -3.742233, 0,
-2.786928, -3.579215, 2,
-2.939717, -3.742233, 2,
-2.786928, -3.579215, 4,
-2.939717, -3.742233, 4,
-2.786928, -3.579215, 6,
-2.939717, -3.742233, 6
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
"4",
"6"
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
-3.245296, -4.068269, -4, 0, -0.5, 0.5, 0.5,
-3.245296, -4.068269, -4, 1, -0.5, 0.5, 0.5,
-3.245296, -4.068269, -4, 1, 1.5, 0.5, 0.5,
-3.245296, -4.068269, -4, 0, 1.5, 0.5, 0.5,
-3.245296, -4.068269, -2, 0, -0.5, 0.5, 0.5,
-3.245296, -4.068269, -2, 1, -0.5, 0.5, 0.5,
-3.245296, -4.068269, -2, 1, 1.5, 0.5, 0.5,
-3.245296, -4.068269, -2, 0, 1.5, 0.5, 0.5,
-3.245296, -4.068269, 0, 0, -0.5, 0.5, 0.5,
-3.245296, -4.068269, 0, 1, -0.5, 0.5, 0.5,
-3.245296, -4.068269, 0, 1, 1.5, 0.5, 0.5,
-3.245296, -4.068269, 0, 0, 1.5, 0.5, 0.5,
-3.245296, -4.068269, 2, 0, -0.5, 0.5, 0.5,
-3.245296, -4.068269, 2, 1, -0.5, 0.5, 0.5,
-3.245296, -4.068269, 2, 1, 1.5, 0.5, 0.5,
-3.245296, -4.068269, 2, 0, 1.5, 0.5, 0.5,
-3.245296, -4.068269, 4, 0, -0.5, 0.5, 0.5,
-3.245296, -4.068269, 4, 1, -0.5, 0.5, 0.5,
-3.245296, -4.068269, 4, 1, 1.5, 0.5, 0.5,
-3.245296, -4.068269, 4, 0, 1.5, 0.5, 0.5,
-3.245296, -4.068269, 6, 0, -0.5, 0.5, 0.5,
-3.245296, -4.068269, 6, 1, -0.5, 0.5, 0.5,
-3.245296, -4.068269, 6, 1, 1.5, 0.5, 0.5,
-3.245296, -4.068269, 6, 0, 1.5, 0.5, 0.5
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
-2.786928, -3.579215, -5.52709,
-2.786928, 2.941514, -5.52709,
-2.786928, -3.579215, 6.409276,
-2.786928, 2.941514, 6.409276,
-2.786928, -3.579215, -5.52709,
-2.786928, -3.579215, 6.409276,
-2.786928, 2.941514, -5.52709,
-2.786928, 2.941514, 6.409276,
-2.786928, -3.579215, -5.52709,
3.324643, -3.579215, -5.52709,
-2.786928, -3.579215, 6.409276,
3.324643, -3.579215, 6.409276,
-2.786928, 2.941514, -5.52709,
3.324643, 2.941514, -5.52709,
-2.786928, 2.941514, 6.409276,
3.324643, 2.941514, 6.409276,
3.324643, -3.579215, -5.52709,
3.324643, 2.941514, -5.52709,
3.324643, -3.579215, 6.409276,
3.324643, 2.941514, 6.409276,
3.324643, -3.579215, -5.52709,
3.324643, -3.579215, 6.409276,
3.324643, 2.941514, -5.52709,
3.324643, 2.941514, 6.409276
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
var radius = 7.962366;
var distance = 35.42546;
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
mvMatrix.translate( -0.2688575, 0.3188506, -0.441093 );
mvMatrix.scale( 1.40865, 1.320261, 0.7212468 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.42546);
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

