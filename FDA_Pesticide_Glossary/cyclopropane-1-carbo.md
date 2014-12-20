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
-3.059602, -2.0973, -1.526558, 1, 0, 0, 1,
-2.805062, -1.367189, -1.52267, 1, 0.007843138, 0, 1,
-2.722755, 2.587755, -1.539668, 1, 0.01176471, 0, 1,
-2.702473, 0.8090692, -0.9474963, 1, 0.01960784, 0, 1,
-2.685883, 1.466152, -2.755108, 1, 0.02352941, 0, 1,
-2.50608, 0.2798821, -2.283259, 1, 0.03137255, 0, 1,
-2.35828, -0.1449073, -2.711904, 1, 0.03529412, 0, 1,
-2.333961, -1.015375, -1.440149, 1, 0.04313726, 0, 1,
-2.328816, -0.009784542, -2.283321, 1, 0.04705882, 0, 1,
-2.247392, -0.3586803, -3.568873, 1, 0.05490196, 0, 1,
-2.179295, 0.4226336, -1.500336, 1, 0.05882353, 0, 1,
-2.147696, -0.9879988, -0.4901779, 1, 0.06666667, 0, 1,
-2.131365, 0.4565573, -0.2727585, 1, 0.07058824, 0, 1,
-2.120697, -0.3327499, -1.678479, 1, 0.07843138, 0, 1,
-2.119006, -0.2442186, -3.77343, 1, 0.08235294, 0, 1,
-2.109934, -0.3126596, -0.6973147, 1, 0.09019608, 0, 1,
-2.080108, 1.150923, -2.759959, 1, 0.09411765, 0, 1,
-2.069633, -1.106464, -0.8257559, 1, 0.1019608, 0, 1,
-2.06274, 0.203078, -0.1342949, 1, 0.1098039, 0, 1,
-2.056585, -0.2513666, -1.81805, 1, 0.1137255, 0, 1,
-2.021696, 0.3514659, -0.5014073, 1, 0.1215686, 0, 1,
-1.997943, -1.781707, -2.447917, 1, 0.1254902, 0, 1,
-1.994145, 0.5366942, -1.812654, 1, 0.1333333, 0, 1,
-1.976926, 0.166305, 0.05412722, 1, 0.1372549, 0, 1,
-1.96911, 1.067423, -2.302727, 1, 0.145098, 0, 1,
-1.968046, 0.5799772, -0.7197706, 1, 0.1490196, 0, 1,
-1.881458, 0.6932649, -1.597388, 1, 0.1568628, 0, 1,
-1.857937, 0.7215812, -0.2766708, 1, 0.1607843, 0, 1,
-1.856204, -0.9926777, -2.947847, 1, 0.1686275, 0, 1,
-1.845122, 1.040984, -1.018714, 1, 0.172549, 0, 1,
-1.841383, -0.560711, -2.73698, 1, 0.1803922, 0, 1,
-1.836585, 0.9798089, -2.472177, 1, 0.1843137, 0, 1,
-1.82711, -1.245274, -2.958076, 1, 0.1921569, 0, 1,
-1.804642, -1.989695, -2.87389, 1, 0.1960784, 0, 1,
-1.802468, -0.4143373, -2.210395, 1, 0.2039216, 0, 1,
-1.800466, 0.7560384, -0.4738018, 1, 0.2117647, 0, 1,
-1.706854, 0.7258072, -1.094179, 1, 0.2156863, 0, 1,
-1.696347, -0.556889, -2.390442, 1, 0.2235294, 0, 1,
-1.658351, -1.350474, -2.808703, 1, 0.227451, 0, 1,
-1.656284, 0.343373, -0.117414, 1, 0.2352941, 0, 1,
-1.651357, 0.7877539, -1.030819, 1, 0.2392157, 0, 1,
-1.645838, 1.059199, -0.7290152, 1, 0.2470588, 0, 1,
-1.635363, 0.9725725, -0.5099249, 1, 0.2509804, 0, 1,
-1.616191, -1.243267, -1.693803, 1, 0.2588235, 0, 1,
-1.612306, 0.8222114, -0.172221, 1, 0.2627451, 0, 1,
-1.609302, 0.6253552, -0.366763, 1, 0.2705882, 0, 1,
-1.604224, -0.9747669, -0.7024105, 1, 0.2745098, 0, 1,
-1.577517, -1.870038, -3.566704, 1, 0.282353, 0, 1,
-1.562436, 1.397481, -0.9911206, 1, 0.2862745, 0, 1,
-1.544862, -0.2274359, -2.708105, 1, 0.2941177, 0, 1,
-1.544186, -0.8659753, -1.974888, 1, 0.3019608, 0, 1,
-1.53057, -0.7622819, -2.785018, 1, 0.3058824, 0, 1,
-1.522648, 1.033035, -1.8219, 1, 0.3137255, 0, 1,
-1.512629, -0.05202522, -1.934614, 1, 0.3176471, 0, 1,
-1.50085, 2.120447, -0.09413129, 1, 0.3254902, 0, 1,
-1.494772, -1.398096, -2.158364, 1, 0.3294118, 0, 1,
-1.491897, -3.278497, -3.485306, 1, 0.3372549, 0, 1,
-1.487738, -1.033272, -1.821293, 1, 0.3411765, 0, 1,
-1.487222, -0.6204316, -2.584919, 1, 0.3490196, 0, 1,
-1.482642, 0.935392, -1.225559, 1, 0.3529412, 0, 1,
-1.443409, -1.216292, -1.887758, 1, 0.3607843, 0, 1,
-1.443208, -0.8766812, -2.886509, 1, 0.3647059, 0, 1,
-1.436549, 0.3701975, 0.7636194, 1, 0.372549, 0, 1,
-1.428514, 0.2676192, -0.8881789, 1, 0.3764706, 0, 1,
-1.422575, 0.6777905, -0.3240826, 1, 0.3843137, 0, 1,
-1.422204, -1.486614, -0.3579901, 1, 0.3882353, 0, 1,
-1.420872, -1.703267, -2.083709, 1, 0.3960784, 0, 1,
-1.412204, -2.087488, -1.533036, 1, 0.4039216, 0, 1,
-1.399635, -1.178151, -1.791592, 1, 0.4078431, 0, 1,
-1.397942, -0.1386716, -0.8856714, 1, 0.4156863, 0, 1,
-1.397624, 1.141307, -0.4849535, 1, 0.4196078, 0, 1,
-1.391725, 0.6688545, -1.319348, 1, 0.427451, 0, 1,
-1.388941, 1.590039, -0.4795441, 1, 0.4313726, 0, 1,
-1.365563, 0.4810573, -1.330523, 1, 0.4392157, 0, 1,
-1.354207, 1.986967, 0.6684361, 1, 0.4431373, 0, 1,
-1.333515, -0.7449144, -0.7155792, 1, 0.4509804, 0, 1,
-1.332092, -0.4584648, -1.47831, 1, 0.454902, 0, 1,
-1.331382, 0.5470912, -0.3500979, 1, 0.4627451, 0, 1,
-1.330575, -1.898642, -2.18884, 1, 0.4666667, 0, 1,
-1.330558, -0.7820249, -1.076976, 1, 0.4745098, 0, 1,
-1.325716, -0.2330331, -2.049709, 1, 0.4784314, 0, 1,
-1.310496, 0.7278786, -2.409909, 1, 0.4862745, 0, 1,
-1.28509, -1.389981, -4.612413, 1, 0.4901961, 0, 1,
-1.285053, 0.2574827, 0.08490282, 1, 0.4980392, 0, 1,
-1.282017, -0.6051732, -3.56638, 1, 0.5058824, 0, 1,
-1.280128, 1.024013, -1.324545, 1, 0.509804, 0, 1,
-1.274124, -0.4139573, -2.531063, 1, 0.5176471, 0, 1,
-1.272959, 0.007978249, -0.1903663, 1, 0.5215687, 0, 1,
-1.271857, 0.5757679, -1.213177, 1, 0.5294118, 0, 1,
-1.270362, 0.4339487, -1.116555, 1, 0.5333334, 0, 1,
-1.270327, 1.06251, 0.2029304, 1, 0.5411765, 0, 1,
-1.268951, 0.2562298, -1.805288, 1, 0.5450981, 0, 1,
-1.267772, 1.011806, -0.915527, 1, 0.5529412, 0, 1,
-1.26274, -0.975909, -1.030282, 1, 0.5568628, 0, 1,
-1.26246, 2.038481, -0.3979568, 1, 0.5647059, 0, 1,
-1.262051, -0.3321073, -0.9352641, 1, 0.5686275, 0, 1,
-1.253729, 1.443893, -1.067235, 1, 0.5764706, 0, 1,
-1.251959, 0.6274936, -0.4670831, 1, 0.5803922, 0, 1,
-1.250768, 1.054607, -0.6914719, 1, 0.5882353, 0, 1,
-1.243652, -0.1967512, -2.659794, 1, 0.5921569, 0, 1,
-1.241409, -0.7842653, -2.088939, 1, 0.6, 0, 1,
-1.229237, 1.123053, -2.246899, 1, 0.6078432, 0, 1,
-1.214107, 0.03264461, -1.973156, 1, 0.6117647, 0, 1,
-1.20913, -1.13735, -2.442326, 1, 0.6196079, 0, 1,
-1.201115, -1.301835, -3.966812, 1, 0.6235294, 0, 1,
-1.19309, 0.4637356, -1.668829, 1, 0.6313726, 0, 1,
-1.19214, 1.980392, -0.3397078, 1, 0.6352941, 0, 1,
-1.189137, -1.771615, -1.626026, 1, 0.6431373, 0, 1,
-1.185053, -0.2948093, -1.403587, 1, 0.6470588, 0, 1,
-1.176216, -1.2437, -3.049493, 1, 0.654902, 0, 1,
-1.171315, 0.09224366, -3.468569, 1, 0.6588235, 0, 1,
-1.169654, -0.6787754, -4.335764, 1, 0.6666667, 0, 1,
-1.168819, -1.52391, -2.354693, 1, 0.6705883, 0, 1,
-1.165598, 0.8974846, -2.003556, 1, 0.6784314, 0, 1,
-1.151063, -0.4725998, -2.65437, 1, 0.682353, 0, 1,
-1.140267, 0.3859082, -0.6694229, 1, 0.6901961, 0, 1,
-1.137072, 0.543932, 1.084082, 1, 0.6941177, 0, 1,
-1.129762, -1.661538, -2.576411, 1, 0.7019608, 0, 1,
-1.127457, -0.5484425, -4.861095, 1, 0.7098039, 0, 1,
-1.114668, -0.4538961, -2.783021, 1, 0.7137255, 0, 1,
-1.107517, 0.6273201, -1.693479, 1, 0.7215686, 0, 1,
-1.105847, 1.4065, -1.892403, 1, 0.7254902, 0, 1,
-1.100102, 0.2234274, -1.508697, 1, 0.7333333, 0, 1,
-1.081692, -0.8278608, -3.513026, 1, 0.7372549, 0, 1,
-1.081393, -1.695238, -1.551779, 1, 0.7450981, 0, 1,
-1.081061, -1.162795, -4.111276, 1, 0.7490196, 0, 1,
-1.067934, 0.02962904, -1.517604, 1, 0.7568628, 0, 1,
-1.058201, 0.02738851, -0.5182816, 1, 0.7607843, 0, 1,
-1.052133, -0.9268, -2.055426, 1, 0.7686275, 0, 1,
-1.050025, -0.8327601, -3.006948, 1, 0.772549, 0, 1,
-1.049054, 0.3576067, -0.2494192, 1, 0.7803922, 0, 1,
-1.046995, 0.5970922, 0.2657109, 1, 0.7843137, 0, 1,
-1.044191, 1.319244, -0.2251854, 1, 0.7921569, 0, 1,
-1.040517, -2.059539, -5.66988, 1, 0.7960784, 0, 1,
-1.027041, 1.755118, -0.3988628, 1, 0.8039216, 0, 1,
-1.024979, -0.1002101, -2.209466, 1, 0.8117647, 0, 1,
-1.008095, -0.3832403, -1.360047, 1, 0.8156863, 0, 1,
-1.006607, 0.4618382, -2.501144, 1, 0.8235294, 0, 1,
-1.00015, -1.423439, -3.556127, 1, 0.827451, 0, 1,
-0.9915124, 0.2460117, -1.116796, 1, 0.8352941, 0, 1,
-0.9911957, 1.194515, -1.402248, 1, 0.8392157, 0, 1,
-0.9885811, 0.106005, 0.7684789, 1, 0.8470588, 0, 1,
-0.9885074, -0.8143489, -4.166875, 1, 0.8509804, 0, 1,
-0.98698, -0.5836149, -2.172167, 1, 0.8588235, 0, 1,
-0.9842875, 0.9115241, -1.133883, 1, 0.8627451, 0, 1,
-0.9730971, -0.09207325, 0.3964859, 1, 0.8705882, 0, 1,
-0.9721427, 0.4795909, -1.035835, 1, 0.8745098, 0, 1,
-0.9718645, 1.518542, 0.237054, 1, 0.8823529, 0, 1,
-0.9698124, 0.9417148, 0.8024284, 1, 0.8862745, 0, 1,
-0.9683915, 0.9107143, -2.667655, 1, 0.8941177, 0, 1,
-0.9660156, 0.6321774, 0.03101086, 1, 0.8980392, 0, 1,
-0.9640432, -1.013809, -2.889024, 1, 0.9058824, 0, 1,
-0.9610572, -0.8988329, -2.664209, 1, 0.9137255, 0, 1,
-0.960943, 0.1253665, -1.490138, 1, 0.9176471, 0, 1,
-0.9599113, 0.9263148, 0.001312061, 1, 0.9254902, 0, 1,
-0.9573905, 0.9804701, -1.751109, 1, 0.9294118, 0, 1,
-0.9531459, 1.410694, -0.8855252, 1, 0.9372549, 0, 1,
-0.9528179, -0.9160026, -3.211047, 1, 0.9411765, 0, 1,
-0.9527563, -1.72024, -2.300287, 1, 0.9490196, 0, 1,
-0.9472479, 0.1046397, -2.04433, 1, 0.9529412, 0, 1,
-0.9388939, 0.3362072, 0.9234933, 1, 0.9607843, 0, 1,
-0.9346529, 0.1433972, -3.96853, 1, 0.9647059, 0, 1,
-0.9158481, -1.530756, -2.102273, 1, 0.972549, 0, 1,
-0.9151357, 0.8262509, -1.085837, 1, 0.9764706, 0, 1,
-0.9100303, -1.341509, -3.76406, 1, 0.9843137, 0, 1,
-0.9089653, 0.9740306, 1.623741, 1, 0.9882353, 0, 1,
-0.90316, -0.3208212, -1.843492, 1, 0.9960784, 0, 1,
-0.8989467, 0.491542, 0.1808607, 0.9960784, 1, 0, 1,
-0.8983029, 0.5793844, -1.161368, 0.9921569, 1, 0, 1,
-0.8950958, 1.895858, -0.5315908, 0.9843137, 1, 0, 1,
-0.8946223, 0.4853778, -0.9634669, 0.9803922, 1, 0, 1,
-0.8935885, -2.072864, -1.029386, 0.972549, 1, 0, 1,
-0.8867216, -1.003551, -0.3113364, 0.9686275, 1, 0, 1,
-0.872032, 0.4589535, -1.297105, 0.9607843, 1, 0, 1,
-0.8700551, 0.6565544, -1.792112, 0.9568627, 1, 0, 1,
-0.8680328, 1.317875, -1.327363, 0.9490196, 1, 0, 1,
-0.8679128, -2.479912, -5.40421, 0.945098, 1, 0, 1,
-0.8617088, 0.7148957, -1.077043, 0.9372549, 1, 0, 1,
-0.8520189, 0.4996395, -0.4226507, 0.9333333, 1, 0, 1,
-0.8502218, 1.186485, 0.4907875, 0.9254902, 1, 0, 1,
-0.8466814, 0.2267989, -3.414001, 0.9215686, 1, 0, 1,
-0.8434802, -0.1754932, -1.625714, 0.9137255, 1, 0, 1,
-0.8420846, 0.8612845, -0.8866989, 0.9098039, 1, 0, 1,
-0.8412557, 0.06505368, -2.237257, 0.9019608, 1, 0, 1,
-0.8355707, -0.2931395, -2.10339, 0.8941177, 1, 0, 1,
-0.8353842, -1.535082, -2.462599, 0.8901961, 1, 0, 1,
-0.832455, 0.8607903, -1.796277, 0.8823529, 1, 0, 1,
-0.8296009, -0.04951889, 0.6499861, 0.8784314, 1, 0, 1,
-0.8261279, 0.09353787, -2.14066, 0.8705882, 1, 0, 1,
-0.8256598, -0.9473571, -3.905012, 0.8666667, 1, 0, 1,
-0.8203762, 0.5292152, -0.08878722, 0.8588235, 1, 0, 1,
-0.8195211, -0.1200977, -0.7198431, 0.854902, 1, 0, 1,
-0.8138008, 0.3847819, -0.755248, 0.8470588, 1, 0, 1,
-0.813759, 0.909873, -0.02988862, 0.8431373, 1, 0, 1,
-0.8124043, 0.5464637, 0.02790812, 0.8352941, 1, 0, 1,
-0.8118626, -0.4109125, -1.895381, 0.8313726, 1, 0, 1,
-0.8105077, -0.9790599, -2.659516, 0.8235294, 1, 0, 1,
-0.8095182, 0.3421699, 0.1323563, 0.8196079, 1, 0, 1,
-0.8072039, -1.276691, -3.484721, 0.8117647, 1, 0, 1,
-0.8062965, 1.509768, 0.7480924, 0.8078431, 1, 0, 1,
-0.8049182, -0.01399349, -4.209788, 0.8, 1, 0, 1,
-0.8004951, -0.922596, -1.642818, 0.7921569, 1, 0, 1,
-0.7987143, 0.3664735, -3.487475, 0.7882353, 1, 0, 1,
-0.7955598, 2.870617, -0.1970715, 0.7803922, 1, 0, 1,
-0.7888528, -1.211054, -2.12231, 0.7764706, 1, 0, 1,
-0.7885845, -0.189633, -1.185287, 0.7686275, 1, 0, 1,
-0.7859189, 0.2835871, -1.425833, 0.7647059, 1, 0, 1,
-0.785578, -1.919648, -1.498287, 0.7568628, 1, 0, 1,
-0.7827412, 1.298247, 1.735705, 0.7529412, 1, 0, 1,
-0.7739489, -1.883316, -4.675182, 0.7450981, 1, 0, 1,
-0.770564, 1.952749, -0.1718745, 0.7411765, 1, 0, 1,
-0.7703183, -0.733011, -3.514797, 0.7333333, 1, 0, 1,
-0.7681977, 0.6970105, -0.5793003, 0.7294118, 1, 0, 1,
-0.7642794, 0.6245486, 0.2742941, 0.7215686, 1, 0, 1,
-0.7436219, 0.7973771, -1.123823, 0.7176471, 1, 0, 1,
-0.7418493, -0.0773259, -1.789279, 0.7098039, 1, 0, 1,
-0.7385937, -1.122155, -1.485536, 0.7058824, 1, 0, 1,
-0.73728, -0.3706899, -2.810635, 0.6980392, 1, 0, 1,
-0.7363795, 0.2741507, -0.1703084, 0.6901961, 1, 0, 1,
-0.7319771, 1.223776, -0.4791974, 0.6862745, 1, 0, 1,
-0.7310733, -0.1711798, -1.421974, 0.6784314, 1, 0, 1,
-0.7240484, 0.1245088, -1.956126, 0.6745098, 1, 0, 1,
-0.7203028, -0.4436113, -2.155857, 0.6666667, 1, 0, 1,
-0.7199813, 0.4024996, -0.4531869, 0.6627451, 1, 0, 1,
-0.7185226, -0.2990327, -2.065137, 0.654902, 1, 0, 1,
-0.717495, -0.9349265, -3.860012, 0.6509804, 1, 0, 1,
-0.7082725, 0.08310391, -1.818576, 0.6431373, 1, 0, 1,
-0.7031571, -0.6501988, -1.17574, 0.6392157, 1, 0, 1,
-0.6992074, 0.9030373, -0.03546035, 0.6313726, 1, 0, 1,
-0.6983483, 0.2008903, -1.07378, 0.627451, 1, 0, 1,
-0.6935207, 0.6467007, -0.4226326, 0.6196079, 1, 0, 1,
-0.6927438, -1.275978, -3.825438, 0.6156863, 1, 0, 1,
-0.6924108, 1.550375, -0.6340277, 0.6078432, 1, 0, 1,
-0.692318, 1.834765, 1.556982, 0.6039216, 1, 0, 1,
-0.6891029, 0.610741, -2.123096, 0.5960785, 1, 0, 1,
-0.6881263, -0.0821359, -3.153667, 0.5882353, 1, 0, 1,
-0.6870481, -1.292909, -1.908778, 0.5843138, 1, 0, 1,
-0.6803524, -0.8198273, -1.732122, 0.5764706, 1, 0, 1,
-0.6770803, -0.1471399, -1.793862, 0.572549, 1, 0, 1,
-0.6751029, 0.9175108, -1.345282, 0.5647059, 1, 0, 1,
-0.6728079, 0.720705, -2.919048, 0.5607843, 1, 0, 1,
-0.6718729, 1.338189, -1.481655, 0.5529412, 1, 0, 1,
-0.6708792, -0.5890288, -1.590719, 0.5490196, 1, 0, 1,
-0.6705677, 1.189086, -0.8408186, 0.5411765, 1, 0, 1,
-0.6699699, -1.152031, -1.542691, 0.5372549, 1, 0, 1,
-0.6693001, 2.814875, -1.452229, 0.5294118, 1, 0, 1,
-0.6658249, 0.7728667, -0.2227362, 0.5254902, 1, 0, 1,
-0.6641784, 1.737387, -0.9835833, 0.5176471, 1, 0, 1,
-0.6631285, 1.567969, -0.432036, 0.5137255, 1, 0, 1,
-0.6614257, 0.1779044, -1.282043, 0.5058824, 1, 0, 1,
-0.6594751, 0.2480649, -1.527261, 0.5019608, 1, 0, 1,
-0.6567827, 0.1526959, -1.272288, 0.4941176, 1, 0, 1,
-0.6529413, -0.6662894, -1.55715, 0.4862745, 1, 0, 1,
-0.6493695, 0.1227729, -3.017297, 0.4823529, 1, 0, 1,
-0.6487359, 0.7386283, -0.9207651, 0.4745098, 1, 0, 1,
-0.6449124, -0.1222296, -1.513752, 0.4705882, 1, 0, 1,
-0.6383616, 0.5083861, -0.9848441, 0.4627451, 1, 0, 1,
-0.6321868, 2.350052, 1.434613, 0.4588235, 1, 0, 1,
-0.6289352, -0.4707772, -2.637201, 0.4509804, 1, 0, 1,
-0.6259392, -1.330125, -1.855795, 0.4470588, 1, 0, 1,
-0.6218975, -1.38235, -3.127004, 0.4392157, 1, 0, 1,
-0.6184192, 0.3471037, -2.329416, 0.4352941, 1, 0, 1,
-0.6158926, 0.2110038, 0.3430571, 0.427451, 1, 0, 1,
-0.609414, -0.16559, -3.008535, 0.4235294, 1, 0, 1,
-0.6078665, -2.378783, -3.190454, 0.4156863, 1, 0, 1,
-0.6069722, 0.6213535, -1.986318, 0.4117647, 1, 0, 1,
-0.5972431, 0.378754, -1.216229, 0.4039216, 1, 0, 1,
-0.5942711, 0.3261322, -1.610547, 0.3960784, 1, 0, 1,
-0.5940081, -1.044626, -3.94878, 0.3921569, 1, 0, 1,
-0.593271, 0.0702807, -0.8466492, 0.3843137, 1, 0, 1,
-0.5926777, -1.541495, -2.633353, 0.3803922, 1, 0, 1,
-0.5926214, 1.591337, -2.832587, 0.372549, 1, 0, 1,
-0.5923073, -2.278035, -2.422014, 0.3686275, 1, 0, 1,
-0.5885208, -0.5294588, -0.123118, 0.3607843, 1, 0, 1,
-0.5737099, -1.704362, -3.062808, 0.3568628, 1, 0, 1,
-0.5637143, -0.01542072, -0.8899055, 0.3490196, 1, 0, 1,
-0.5574073, -0.1394361, -3.387787, 0.345098, 1, 0, 1,
-0.5573918, 0.5343061, -1.667301, 0.3372549, 1, 0, 1,
-0.5527204, -1.123622, -0.2224604, 0.3333333, 1, 0, 1,
-0.549318, 0.1953843, 0.4119617, 0.3254902, 1, 0, 1,
-0.5446001, -1.348144, -2.932759, 0.3215686, 1, 0, 1,
-0.5442967, -2.104346, -3.004738, 0.3137255, 1, 0, 1,
-0.539263, 0.2068047, -3.048012, 0.3098039, 1, 0, 1,
-0.537926, 1.157356, -1.497709, 0.3019608, 1, 0, 1,
-0.5342734, 1.948226, -0.2477183, 0.2941177, 1, 0, 1,
-0.5323765, 0.3121651, -1.100316, 0.2901961, 1, 0, 1,
-0.5313106, 2.976629, -0.05471577, 0.282353, 1, 0, 1,
-0.5290821, -0.02309735, -0.7891461, 0.2784314, 1, 0, 1,
-0.5251067, -0.001714088, -1.399303, 0.2705882, 1, 0, 1,
-0.5243549, -1.084202, -1.570061, 0.2666667, 1, 0, 1,
-0.5199942, -0.7723997, -3.68008, 0.2588235, 1, 0, 1,
-0.5151059, -1.729512, -2.667438, 0.254902, 1, 0, 1,
-0.5107083, -1.7879, -2.779057, 0.2470588, 1, 0, 1,
-0.5043592, -0.8561648, -1.075278, 0.2431373, 1, 0, 1,
-0.5026092, -0.04155906, -2.282829, 0.2352941, 1, 0, 1,
-0.4991121, -0.5682757, -3.037898, 0.2313726, 1, 0, 1,
-0.4983217, -0.5675439, -1.052901, 0.2235294, 1, 0, 1,
-0.4966505, -1.070839, -4.20151, 0.2196078, 1, 0, 1,
-0.4962486, 0.5405528, 0.3286406, 0.2117647, 1, 0, 1,
-0.4956936, 0.8999167, -1.455146, 0.2078431, 1, 0, 1,
-0.4890302, -0.1585327, -1.688738, 0.2, 1, 0, 1,
-0.4884523, 0.2662583, -1.338471, 0.1921569, 1, 0, 1,
-0.4864511, -0.486184, -3.502805, 0.1882353, 1, 0, 1,
-0.4849534, -1.360126, -3.271379, 0.1803922, 1, 0, 1,
-0.4829804, -0.2195473, -2.178363, 0.1764706, 1, 0, 1,
-0.4821806, -0.2504095, -1.853124, 0.1686275, 1, 0, 1,
-0.4813616, 0.2514902, -0.6424308, 0.1647059, 1, 0, 1,
-0.476476, -1.20221, -4.682959, 0.1568628, 1, 0, 1,
-0.4679779, -0.6906837, -2.255756, 0.1529412, 1, 0, 1,
-0.4650328, 1.472832, 1.045327, 0.145098, 1, 0, 1,
-0.4639883, -0.9496921, -3.86609, 0.1411765, 1, 0, 1,
-0.4639187, -0.3232138, -2.189282, 0.1333333, 1, 0, 1,
-0.4609505, -0.6450517, -2.485717, 0.1294118, 1, 0, 1,
-0.460745, -0.2836189, -1.10847, 0.1215686, 1, 0, 1,
-0.4603314, 0.1412273, -2.224776, 0.1176471, 1, 0, 1,
-0.4594317, 0.8555419, -2.459185, 0.1098039, 1, 0, 1,
-0.4557266, -0.10146, -0.7032622, 0.1058824, 1, 0, 1,
-0.4532472, -1.134508, -2.013052, 0.09803922, 1, 0, 1,
-0.4522435, 1.339177, -0.42374, 0.09019608, 1, 0, 1,
-0.4478624, 0.7658572, -0.7300891, 0.08627451, 1, 0, 1,
-0.4451706, 1.275096, 0.39952, 0.07843138, 1, 0, 1,
-0.444837, 0.6465589, -1.312743, 0.07450981, 1, 0, 1,
-0.442179, 0.5014707, -0.4534303, 0.06666667, 1, 0, 1,
-0.4384563, -0.867492, -1.019248, 0.0627451, 1, 0, 1,
-0.437434, -0.2024254, -1.797636, 0.05490196, 1, 0, 1,
-0.4353237, 0.1698465, -0.6016922, 0.05098039, 1, 0, 1,
-0.4327117, 0.4956317, 0.8213686, 0.04313726, 1, 0, 1,
-0.4298613, 0.02149359, -2.21089, 0.03921569, 1, 0, 1,
-0.4240257, 0.5020624, 1.022999, 0.03137255, 1, 0, 1,
-0.4240049, 0.6321707, -1.475499, 0.02745098, 1, 0, 1,
-0.4113397, 0.0286801, -0.118073, 0.01960784, 1, 0, 1,
-0.4020732, 0.9015461, 0.4360853, 0.01568628, 1, 0, 1,
-0.4001766, -0.3098916, -1.313307, 0.007843138, 1, 0, 1,
-0.3966883, 0.8473004, -0.3058837, 0.003921569, 1, 0, 1,
-0.3880074, 1.351692, -0.5120346, 0, 1, 0.003921569, 1,
-0.3825967, 1.286945, 0.5629638, 0, 1, 0.01176471, 1,
-0.3822163, 0.6927834, -0.298902, 0, 1, 0.01568628, 1,
-0.3808525, -0.5484018, -1.047347, 0, 1, 0.02352941, 1,
-0.3807044, 1.04478, -0.6288953, 0, 1, 0.02745098, 1,
-0.3738697, -0.3514954, -2.883964, 0, 1, 0.03529412, 1,
-0.3721418, 0.4199656, 0.4419415, 0, 1, 0.03921569, 1,
-0.3709999, -0.8709766, -3.836059, 0, 1, 0.04705882, 1,
-0.3589575, 0.6689283, -0.6504299, 0, 1, 0.05098039, 1,
-0.3589496, -0.6287302, -2.018178, 0, 1, 0.05882353, 1,
-0.3565302, 0.9721119, -0.05061434, 0, 1, 0.0627451, 1,
-0.3553391, 1.468845, -1.703606, 0, 1, 0.07058824, 1,
-0.3515225, 0.2488051, -0.8828685, 0, 1, 0.07450981, 1,
-0.347432, 1.41745, -1.017738, 0, 1, 0.08235294, 1,
-0.3471577, -0.5094432, -2.348427, 0, 1, 0.08627451, 1,
-0.3365707, 1.737702, 0.2677325, 0, 1, 0.09411765, 1,
-0.3362539, -0.2655492, -1.672309, 0, 1, 0.1019608, 1,
-0.3349673, 1.343432, -1.20288, 0, 1, 0.1058824, 1,
-0.3349182, 0.5723978, -1.963176, 0, 1, 0.1137255, 1,
-0.3290448, -0.4301198, -2.552874, 0, 1, 0.1176471, 1,
-0.3289404, -0.9438678, -2.643886, 0, 1, 0.1254902, 1,
-0.326642, -0.7145277, -2.121972, 0, 1, 0.1294118, 1,
-0.3252482, -0.9489276, -3.104722, 0, 1, 0.1372549, 1,
-0.3209671, 0.08724369, 0.1576427, 0, 1, 0.1411765, 1,
-0.3200288, -0.1179996, -0.9608374, 0, 1, 0.1490196, 1,
-0.319736, -1.06248, -2.266241, 0, 1, 0.1529412, 1,
-0.3189554, 0.8649393, -0.3773626, 0, 1, 0.1607843, 1,
-0.3187236, 1.026185, 1.175758, 0, 1, 0.1647059, 1,
-0.3173955, 0.3328047, -0.9595588, 0, 1, 0.172549, 1,
-0.3120777, 0.05296504, -3.210649, 0, 1, 0.1764706, 1,
-0.3119459, -0.7005084, -3.127596, 0, 1, 0.1843137, 1,
-0.3117788, -0.07066246, -1.931191, 0, 1, 0.1882353, 1,
-0.3068706, -0.3291953, -1.762851, 0, 1, 0.1960784, 1,
-0.3061331, -2.308019, -3.667188, 0, 1, 0.2039216, 1,
-0.2884654, 0.3456566, -1.563845, 0, 1, 0.2078431, 1,
-0.2879186, -0.1379832, -1.491399, 0, 1, 0.2156863, 1,
-0.2821388, 1.388394, -1.711092, 0, 1, 0.2196078, 1,
-0.2805705, -1.065222, -2.026257, 0, 1, 0.227451, 1,
-0.2797555, 1.301581, -1.055747, 0, 1, 0.2313726, 1,
-0.2772901, 0.2748406, -0.06230822, 0, 1, 0.2392157, 1,
-0.2745726, 0.4505822, -0.1025172, 0, 1, 0.2431373, 1,
-0.2740977, 0.900919, -2.570544, 0, 1, 0.2509804, 1,
-0.2737271, -0.4316757, -2.513085, 0, 1, 0.254902, 1,
-0.2718888, 0.4745983, 0.4785434, 0, 1, 0.2627451, 1,
-0.2698276, 1.966736, 2.317337, 0, 1, 0.2666667, 1,
-0.2674432, 0.09326107, -1.276727, 0, 1, 0.2745098, 1,
-0.266627, -0.07501331, -2.2271, 0, 1, 0.2784314, 1,
-0.2662441, -0.9931517, -3.230655, 0, 1, 0.2862745, 1,
-0.2640131, -1.850972, -2.78448, 0, 1, 0.2901961, 1,
-0.2616371, 1.660639, -0.7487956, 0, 1, 0.2980392, 1,
-0.2610151, -1.796136, -5.081618, 0, 1, 0.3058824, 1,
-0.2580777, 0.3072957, -0.8339378, 0, 1, 0.3098039, 1,
-0.2540177, 0.7559561, 0.1415742, 0, 1, 0.3176471, 1,
-0.2532351, -0.6669668, -3.192534, 0, 1, 0.3215686, 1,
-0.2526785, 0.4022991, -0.5986754, 0, 1, 0.3294118, 1,
-0.250911, 0.7358758, -1.589891, 0, 1, 0.3333333, 1,
-0.2508136, 0.4679176, -2.494904, 0, 1, 0.3411765, 1,
-0.2423005, -0.04796066, -1.31967, 0, 1, 0.345098, 1,
-0.2420797, 0.7514423, -0.7179671, 0, 1, 0.3529412, 1,
-0.2406397, -1.983515, -3.278731, 0, 1, 0.3568628, 1,
-0.239832, -0.655154, -3.333317, 0, 1, 0.3647059, 1,
-0.237185, 0.424682, 0.1186953, 0, 1, 0.3686275, 1,
-0.2351537, 0.8677867, 0.6095382, 0, 1, 0.3764706, 1,
-0.234038, 0.2621697, -1.298232, 0, 1, 0.3803922, 1,
-0.2339054, 1.164335, -1.47987, 0, 1, 0.3882353, 1,
-0.2309987, -0.629985, -3.635526, 0, 1, 0.3921569, 1,
-0.2300524, -0.4898686, -1.723175, 0, 1, 0.4, 1,
-0.2277668, -1.689883, -4.140162, 0, 1, 0.4078431, 1,
-0.2260846, -1.313446, -2.771889, 0, 1, 0.4117647, 1,
-0.2226335, -0.9336709, -3.404351, 0, 1, 0.4196078, 1,
-0.2183509, -0.4961889, -3.912941, 0, 1, 0.4235294, 1,
-0.2163938, 0.9816933, 0.7588533, 0, 1, 0.4313726, 1,
-0.2161768, 0.6024736, 0.9626175, 0, 1, 0.4352941, 1,
-0.2144206, 0.473316, -0.1299101, 0, 1, 0.4431373, 1,
-0.2135805, -0.08356314, -1.60914, 0, 1, 0.4470588, 1,
-0.2121495, -0.07391234, -2.587535, 0, 1, 0.454902, 1,
-0.211785, -0.5086331, -2.014732, 0, 1, 0.4588235, 1,
-0.206891, 1.132835, -0.7961746, 0, 1, 0.4666667, 1,
-0.2030607, -0.4039892, -3.034391, 0, 1, 0.4705882, 1,
-0.2015819, 0.9511266, -1.519694, 0, 1, 0.4784314, 1,
-0.20112, -0.2023696, -3.379841, 0, 1, 0.4823529, 1,
-0.1999678, -0.5966146, -3.135879, 0, 1, 0.4901961, 1,
-0.1982056, -0.3295139, -2.301811, 0, 1, 0.4941176, 1,
-0.1962748, 0.1882338, -1.968791, 0, 1, 0.5019608, 1,
-0.1917918, -0.2202501, -2.924389, 0, 1, 0.509804, 1,
-0.1877674, 1.032858, 0.3718887, 0, 1, 0.5137255, 1,
-0.1845398, -1.395182, -4.794178, 0, 1, 0.5215687, 1,
-0.18034, -0.4206557, -3.706578, 0, 1, 0.5254902, 1,
-0.1776662, -1.213477, -4.204434, 0, 1, 0.5333334, 1,
-0.1770543, 0.7957736, -0.8714421, 0, 1, 0.5372549, 1,
-0.1744837, -0.49209, -1.733374, 0, 1, 0.5450981, 1,
-0.1725442, 0.04234129, -2.703251, 0, 1, 0.5490196, 1,
-0.1711325, 1.834993, -0.8096114, 0, 1, 0.5568628, 1,
-0.1677863, -0.6623923, -3.413805, 0, 1, 0.5607843, 1,
-0.1656016, 0.02491437, -1.594497, 0, 1, 0.5686275, 1,
-0.1654551, 2.001547, 2.277952, 0, 1, 0.572549, 1,
-0.1637973, 1.894815, 0.6558694, 0, 1, 0.5803922, 1,
-0.1633184, 0.8360943, -0.8810049, 0, 1, 0.5843138, 1,
-0.1609288, 2.480441, -1.260038, 0, 1, 0.5921569, 1,
-0.1531195, -0.6547332, -2.560833, 0, 1, 0.5960785, 1,
-0.1425368, -1.03336, -4.665771, 0, 1, 0.6039216, 1,
-0.1399464, 0.9313852, -0.8578469, 0, 1, 0.6117647, 1,
-0.135192, 0.5305432, 0.08670348, 0, 1, 0.6156863, 1,
-0.1338678, 1.319628, -1.081042, 0, 1, 0.6235294, 1,
-0.1323819, -0.4913347, -0.984673, 0, 1, 0.627451, 1,
-0.1288124, 1.053114, 1.272593, 0, 1, 0.6352941, 1,
-0.1184227, -1.156788, -3.511893, 0, 1, 0.6392157, 1,
-0.1164315, -0.2348614, -2.039828, 0, 1, 0.6470588, 1,
-0.1161039, 0.7706726, -0.09966703, 0, 1, 0.6509804, 1,
-0.1138393, -0.06854887, -3.685766, 0, 1, 0.6588235, 1,
-0.1136444, -0.1266697, -1.998368, 0, 1, 0.6627451, 1,
-0.1112702, 1.214858, 1.134549, 0, 1, 0.6705883, 1,
-0.1089444, 0.8960897, -0.2684757, 0, 1, 0.6745098, 1,
-0.1051211, 1.543543, -0.1236557, 0, 1, 0.682353, 1,
-0.1025975, -0.9146075, -3.79755, 0, 1, 0.6862745, 1,
-0.1020548, 0.01654974, -0.7942979, 0, 1, 0.6941177, 1,
-0.0991751, -2.659143, -3.836702, 0, 1, 0.7019608, 1,
-0.09286043, -2.06351, -0.9004182, 0, 1, 0.7058824, 1,
-0.09066563, 0.1260875, -1.101462, 0, 1, 0.7137255, 1,
-0.08561264, -1.115618, -2.241542, 0, 1, 0.7176471, 1,
-0.08357169, 0.1486426, -2.194952, 0, 1, 0.7254902, 1,
-0.08281302, 0.5710989, -0.8583452, 0, 1, 0.7294118, 1,
-0.07858726, 0.4076285, -1.478268, 0, 1, 0.7372549, 1,
-0.07659232, 0.03869662, -1.161291, 0, 1, 0.7411765, 1,
-0.07234618, 1.509865, 0.6036485, 0, 1, 0.7490196, 1,
-0.07194832, 0.03875954, -2.088138, 0, 1, 0.7529412, 1,
-0.0677904, -1.187794, -2.913748, 0, 1, 0.7607843, 1,
-0.06592717, -2.131098, -2.055511, 0, 1, 0.7647059, 1,
-0.06384655, -0.4502802, -4.014201, 0, 1, 0.772549, 1,
-0.05993985, 0.3167348, -1.716269, 0, 1, 0.7764706, 1,
-0.05821374, -0.01269849, -0.8799791, 0, 1, 0.7843137, 1,
-0.05526792, -2.935143, -1.502313, 0, 1, 0.7882353, 1,
-0.05393331, 0.7339572, 1.209611, 0, 1, 0.7960784, 1,
-0.05064654, 1.041687, 0.9885144, 0, 1, 0.8039216, 1,
-0.04881275, 0.758961, 1.202686, 0, 1, 0.8078431, 1,
-0.04877933, 0.2341724, 0.8382106, 0, 1, 0.8156863, 1,
-0.04739686, -1.710172, -3.536353, 0, 1, 0.8196079, 1,
-0.04457857, 0.03275557, -1.625624, 0, 1, 0.827451, 1,
-0.04429672, -0.8001979, -3.374938, 0, 1, 0.8313726, 1,
-0.04365729, 0.4704261, 0.1828754, 0, 1, 0.8392157, 1,
-0.04304478, 0.1297734, -1.390379, 0, 1, 0.8431373, 1,
-0.04093406, -0.4523933, -3.122599, 0, 1, 0.8509804, 1,
-0.03244916, 0.09552554, 0.3567248, 0, 1, 0.854902, 1,
-0.02928793, -1.291749, -3.450081, 0, 1, 0.8627451, 1,
-0.02892567, 0.453957, -0.5644367, 0, 1, 0.8666667, 1,
-0.02772645, -1.759562, -4.906, 0, 1, 0.8745098, 1,
-0.02769085, -1.595568, -2.71421, 0, 1, 0.8784314, 1,
-0.02503296, -1.071984, -2.639144, 0, 1, 0.8862745, 1,
-0.019894, 1.548479, 0.1316253, 0, 1, 0.8901961, 1,
-0.01930029, 0.905516, -0.2330997, 0, 1, 0.8980392, 1,
-0.01663956, -1.827279, -4.330037, 0, 1, 0.9058824, 1,
-0.01482534, -0.139514, -3.413193, 0, 1, 0.9098039, 1,
-0.0120277, 1.461429, -0.8178183, 0, 1, 0.9176471, 1,
-0.01030427, 0.9161367, -0.3866321, 0, 1, 0.9215686, 1,
-0.008701024, -0.282719, -1.897379, 0, 1, 0.9294118, 1,
-0.002624889, -0.6384225, -3.809021, 0, 1, 0.9333333, 1,
0.002961988, 1.103305, 2.334032, 0, 1, 0.9411765, 1,
0.003133323, -1.756499, 2.207701, 0, 1, 0.945098, 1,
0.01272122, 1.149505, 0.4682984, 0, 1, 0.9529412, 1,
0.01358682, 0.9361421, 0.2844864, 0, 1, 0.9568627, 1,
0.01454838, -1.24453, 2.601317, 0, 1, 0.9647059, 1,
0.02343441, -0.5113537, 3.371079, 0, 1, 0.9686275, 1,
0.02412702, -1.436511, 2.465181, 0, 1, 0.9764706, 1,
0.02614255, 0.8623135, -0.9825025, 0, 1, 0.9803922, 1,
0.0356664, -0.8166109, 3.726846, 0, 1, 0.9882353, 1,
0.03618679, -0.2472995, 3.802424, 0, 1, 0.9921569, 1,
0.03695683, -0.1939509, 5.106386, 0, 1, 1, 1,
0.04031616, -0.25584, 3.172108, 0, 0.9921569, 1, 1,
0.04113452, -0.1422566, 1.269383, 0, 0.9882353, 1, 1,
0.04501947, -0.2147287, 2.709928, 0, 0.9803922, 1, 1,
0.0507646, -1.792508, 3.312833, 0, 0.9764706, 1, 1,
0.05189168, -0.03154605, 1.740338, 0, 0.9686275, 1, 1,
0.05422764, -0.06501947, 1.971359, 0, 0.9647059, 1, 1,
0.05593883, -1.128313, 1.921314, 0, 0.9568627, 1, 1,
0.05714221, -1.81605, 1.43574, 0, 0.9529412, 1, 1,
0.05724146, -0.2325335, 3.40493, 0, 0.945098, 1, 1,
0.05905569, 0.909456, -0.8752677, 0, 0.9411765, 1, 1,
0.06084307, -1.289312, 3.746472, 0, 0.9333333, 1, 1,
0.06224528, 0.9309724, 0.4302782, 0, 0.9294118, 1, 1,
0.06274252, 0.635078, 1.127031, 0, 0.9215686, 1, 1,
0.06297106, 1.443355, -0.445956, 0, 0.9176471, 1, 1,
0.06419861, -1.286943, 2.156436, 0, 0.9098039, 1, 1,
0.06611791, 0.4167434, 0.08028014, 0, 0.9058824, 1, 1,
0.06634109, -0.1504006, 3.76595, 0, 0.8980392, 1, 1,
0.06657585, -1.619557, 2.948621, 0, 0.8901961, 1, 1,
0.06687929, 0.3072572, 0.1432445, 0, 0.8862745, 1, 1,
0.07305086, 0.2669612, 2.128589, 0, 0.8784314, 1, 1,
0.07939459, 0.8353952, -0.7193945, 0, 0.8745098, 1, 1,
0.08277243, 0.7228675, 0.1065338, 0, 0.8666667, 1, 1,
0.08828314, 0.0695667, -0.4440777, 0, 0.8627451, 1, 1,
0.08847281, -0.4973093, 4.402487, 0, 0.854902, 1, 1,
0.08945051, -0.02307356, 2.085658, 0, 0.8509804, 1, 1,
0.08953097, 0.6743386, -0.07155135, 0, 0.8431373, 1, 1,
0.09386497, 0.2726168, -0.570013, 0, 0.8392157, 1, 1,
0.09437538, 0.5215592, -0.2518952, 0, 0.8313726, 1, 1,
0.09916078, 2.406743, -1.534061, 0, 0.827451, 1, 1,
0.1010542, 1.770406, -2.16235, 0, 0.8196079, 1, 1,
0.1014408, -0.3895027, 4.866833, 0, 0.8156863, 1, 1,
0.10247, -1.390301, 2.494114, 0, 0.8078431, 1, 1,
0.1042355, -0.3502529, 2.918499, 0, 0.8039216, 1, 1,
0.1074236, -1.706544, 4.200068, 0, 0.7960784, 1, 1,
0.1089234, -0.4316407, 3.381333, 0, 0.7882353, 1, 1,
0.1094749, 0.8091657, 1.025516, 0, 0.7843137, 1, 1,
0.1112165, -0.3771439, 2.062, 0, 0.7764706, 1, 1,
0.1126865, 0.645575, 1.89009, 0, 0.772549, 1, 1,
0.1148856, 1.533763, 1.998018, 0, 0.7647059, 1, 1,
0.1219647, -0.3219579, 4.66692, 0, 0.7607843, 1, 1,
0.1245599, -0.3014737, 2.367668, 0, 0.7529412, 1, 1,
0.1293893, 1.265229, 0.7266129, 0, 0.7490196, 1, 1,
0.1335571, -0.525295, 2.909513, 0, 0.7411765, 1, 1,
0.1346437, -0.7115965, 2.761582, 0, 0.7372549, 1, 1,
0.1361164, -0.8808621, 2.356852, 0, 0.7294118, 1, 1,
0.1388024, -1.222455, 4.01851, 0, 0.7254902, 1, 1,
0.1424645, 0.4073604, 0.601423, 0, 0.7176471, 1, 1,
0.1445735, 0.5425335, -0.6579511, 0, 0.7137255, 1, 1,
0.151267, -2.799912, 4.105149, 0, 0.7058824, 1, 1,
0.1543382, 1.672454, 0.6781866, 0, 0.6980392, 1, 1,
0.1551098, -0.273139, 2.875984, 0, 0.6941177, 1, 1,
0.1556405, -2.006163, 2.404681, 0, 0.6862745, 1, 1,
0.160242, -0.1903546, 2.507389, 0, 0.682353, 1, 1,
0.1603162, 0.630673, 0.1263823, 0, 0.6745098, 1, 1,
0.1650329, -0.3072181, 5.418251, 0, 0.6705883, 1, 1,
0.1699535, 1.379886, -0.08128672, 0, 0.6627451, 1, 1,
0.1718927, -1.16265, 3.730336, 0, 0.6588235, 1, 1,
0.1755007, -1.016232, 3.414055, 0, 0.6509804, 1, 1,
0.1759139, -1.826171, 2.98139, 0, 0.6470588, 1, 1,
0.1762078, -2.114725, 3.350666, 0, 0.6392157, 1, 1,
0.1781876, -0.8662806, 0.2840614, 0, 0.6352941, 1, 1,
0.179023, 1.29994, 0.8561213, 0, 0.627451, 1, 1,
0.1840987, -1.102709, 2.850246, 0, 0.6235294, 1, 1,
0.1864556, -2.489551, 2.832466, 0, 0.6156863, 1, 1,
0.1881255, 1.897366, 0.9825695, 0, 0.6117647, 1, 1,
0.1888389, 0.611272, 0.4600027, 0, 0.6039216, 1, 1,
0.188941, 0.2175258, 0.4266846, 0, 0.5960785, 1, 1,
0.1894448, -0.2556165, 2.826117, 0, 0.5921569, 1, 1,
0.1916383, 0.8349372, -0.01647274, 0, 0.5843138, 1, 1,
0.1935109, -1.29858, 2.619251, 0, 0.5803922, 1, 1,
0.1961381, -0.07625378, 1.32363, 0, 0.572549, 1, 1,
0.2042366, 0.7458985, -1.49114, 0, 0.5686275, 1, 1,
0.2064471, -0.8787754, 2.818614, 0, 0.5607843, 1, 1,
0.2070473, -0.07231566, 1.370325, 0, 0.5568628, 1, 1,
0.2125631, 0.4043978, 1.872512, 0, 0.5490196, 1, 1,
0.2196966, 1.481997, 0.8623053, 0, 0.5450981, 1, 1,
0.2217524, -0.3265516, 3.006166, 0, 0.5372549, 1, 1,
0.2223962, 0.56877, -0.1557109, 0, 0.5333334, 1, 1,
0.2224024, 1.944782, -0.5657513, 0, 0.5254902, 1, 1,
0.2237364, -0.3791961, 3.261506, 0, 0.5215687, 1, 1,
0.2244004, 0.09925106, 0.6456063, 0, 0.5137255, 1, 1,
0.2256008, -0.4454192, 2.919779, 0, 0.509804, 1, 1,
0.2276186, -0.266571, 2.92453, 0, 0.5019608, 1, 1,
0.2359618, 0.3676079, 0.8450439, 0, 0.4941176, 1, 1,
0.2361608, 0.5330897, 1.33065, 0, 0.4901961, 1, 1,
0.2413946, -1.298752, 3.510228, 0, 0.4823529, 1, 1,
0.2461768, 0.5043601, 0.6896716, 0, 0.4784314, 1, 1,
0.2491517, -0.1852138, 0.1729563, 0, 0.4705882, 1, 1,
0.2505653, -1.759031, 3.281353, 0, 0.4666667, 1, 1,
0.2535368, -1.3259, 2.834463, 0, 0.4588235, 1, 1,
0.2597274, -0.4233091, 2.083822, 0, 0.454902, 1, 1,
0.2607076, 1.900426, -0.3451385, 0, 0.4470588, 1, 1,
0.2610605, -0.5824962, 2.556031, 0, 0.4431373, 1, 1,
0.2625614, 0.2642469, 0.4081433, 0, 0.4352941, 1, 1,
0.2631643, 0.5134867, 0.8599128, 0, 0.4313726, 1, 1,
0.2643184, 0.1873734, 0.08510574, 0, 0.4235294, 1, 1,
0.2644565, -0.9439385, 1.643894, 0, 0.4196078, 1, 1,
0.2715221, 1.177808, -0.818405, 0, 0.4117647, 1, 1,
0.2732251, 0.04712029, 2.152512, 0, 0.4078431, 1, 1,
0.2752137, 0.4979763, -0.7367892, 0, 0.4, 1, 1,
0.2757188, -2.068282, 2.074966, 0, 0.3921569, 1, 1,
0.2769549, -0.4671681, 1.942195, 0, 0.3882353, 1, 1,
0.281964, 0.8017541, 1.17823, 0, 0.3803922, 1, 1,
0.2822962, 0.4458297, 0.2276705, 0, 0.3764706, 1, 1,
0.284481, -0.08379512, 3.077185, 0, 0.3686275, 1, 1,
0.284676, 0.126546, 1.057417, 0, 0.3647059, 1, 1,
0.2866626, -3.112285, 2.813714, 0, 0.3568628, 1, 1,
0.286814, -1.407365, 2.652145, 0, 0.3529412, 1, 1,
0.2888272, -0.5838581, 1.925506, 0, 0.345098, 1, 1,
0.2923496, -1.032285, 1.720971, 0, 0.3411765, 1, 1,
0.292709, -0.8069401, 3.365808, 0, 0.3333333, 1, 1,
0.3045919, -0.5852249, 2.470828, 0, 0.3294118, 1, 1,
0.3071099, 0.4565024, 0.5280271, 0, 0.3215686, 1, 1,
0.3099253, 0.7529979, -1.376552, 0, 0.3176471, 1, 1,
0.3167602, -0.9330869, 1.726012, 0, 0.3098039, 1, 1,
0.3194256, 0.3604181, 0.3903731, 0, 0.3058824, 1, 1,
0.319566, -0.7344871, 5.20988, 0, 0.2980392, 1, 1,
0.3302112, -0.374759, 1.80133, 0, 0.2901961, 1, 1,
0.3332558, -0.4679104, 1.91054, 0, 0.2862745, 1, 1,
0.3355479, -1.717473, 1.363892, 0, 0.2784314, 1, 1,
0.3377088, 1.055098, -0.1962802, 0, 0.2745098, 1, 1,
0.3384859, -0.8298209, 3.780256, 0, 0.2666667, 1, 1,
0.3405608, 1.263637, -0.02777643, 0, 0.2627451, 1, 1,
0.3491995, -0.2494157, 1.731773, 0, 0.254902, 1, 1,
0.3513405, -0.7858248, 3.162595, 0, 0.2509804, 1, 1,
0.3562294, -0.9081884, 3.382069, 0, 0.2431373, 1, 1,
0.3585103, 0.3001341, 2.558867, 0, 0.2392157, 1, 1,
0.3667666, -1.069174, 2.03598, 0, 0.2313726, 1, 1,
0.3805779, 0.4824343, 0.6780006, 0, 0.227451, 1, 1,
0.38106, 0.4144005, -0.2653727, 0, 0.2196078, 1, 1,
0.3817028, 1.704696, 0.4788319, 0, 0.2156863, 1, 1,
0.3831954, 0.3585905, 0.1098955, 0, 0.2078431, 1, 1,
0.3832813, -1.374988, 2.859057, 0, 0.2039216, 1, 1,
0.384622, -0.4505692, 2.729801, 0, 0.1960784, 1, 1,
0.3865246, -1.01389, 3.535799, 0, 0.1882353, 1, 1,
0.3875972, 0.05298627, 1.480885, 0, 0.1843137, 1, 1,
0.3903313, -0.04854884, 3.084363, 0, 0.1764706, 1, 1,
0.3910497, -0.3794281, 3.444415, 0, 0.172549, 1, 1,
0.3920531, 0.7410545, 1.220296, 0, 0.1647059, 1, 1,
0.401681, 1.317782, -1.13101, 0, 0.1607843, 1, 1,
0.4043256, 0.3659455, 0.230235, 0, 0.1529412, 1, 1,
0.4067027, -0.8011618, 2.238081, 0, 0.1490196, 1, 1,
0.4083759, -0.8805664, 2.665833, 0, 0.1411765, 1, 1,
0.4136669, 1.125635, 2.472388, 0, 0.1372549, 1, 1,
0.4163519, 0.335501, 0.1858134, 0, 0.1294118, 1, 1,
0.4174796, 1.336736, 1.186193, 0, 0.1254902, 1, 1,
0.4174998, -0.1093195, 1.795418, 0, 0.1176471, 1, 1,
0.418824, 0.1264828, 1.078801, 0, 0.1137255, 1, 1,
0.4208764, -0.338921, 1.06209, 0, 0.1058824, 1, 1,
0.4249709, -0.005385816, 1.92705, 0, 0.09803922, 1, 1,
0.4256305, -0.6177838, 2.549889, 0, 0.09411765, 1, 1,
0.4256853, 0.221606, 1.566525, 0, 0.08627451, 1, 1,
0.4260639, -1.003417, 4.495306, 0, 0.08235294, 1, 1,
0.4358091, 0.975336, 2.22209, 0, 0.07450981, 1, 1,
0.4374192, -0.6345046, 4.700996, 0, 0.07058824, 1, 1,
0.4390865, -0.934058, 3.552598, 0, 0.0627451, 1, 1,
0.4432964, -1.291302, 3.20894, 0, 0.05882353, 1, 1,
0.4461905, -0.680073, 1.26599, 0, 0.05098039, 1, 1,
0.4496619, -1.114895, 3.802785, 0, 0.04705882, 1, 1,
0.4506246, -0.5442635, 3.315582, 0, 0.03921569, 1, 1,
0.4530117, 0.7905035, 0.3415331, 0, 0.03529412, 1, 1,
0.458086, 0.2314599, 0.2297798, 0, 0.02745098, 1, 1,
0.4600374, -0.08733564, 1.881614, 0, 0.02352941, 1, 1,
0.465409, 2.080266, 1.70771, 0, 0.01568628, 1, 1,
0.466996, -1.699584, 3.774188, 0, 0.01176471, 1, 1,
0.4691367, -0.1725751, 0.1441584, 0, 0.003921569, 1, 1,
0.4827684, 0.06929334, 2.189189, 0.003921569, 0, 1, 1,
0.4832447, -0.03388324, -0.718177, 0.007843138, 0, 1, 1,
0.4835044, -1.441216, 0.7574847, 0.01568628, 0, 1, 1,
0.4853112, -0.2341534, 2.882556, 0.01960784, 0, 1, 1,
0.485424, -0.1823884, 1.35476, 0.02745098, 0, 1, 1,
0.485683, -0.4939665, 1.197952, 0.03137255, 0, 1, 1,
0.4927803, -1.220491, 2.563694, 0.03921569, 0, 1, 1,
0.4937423, 1.099758, 0.5747957, 0.04313726, 0, 1, 1,
0.502807, -1.239556, 2.342124, 0.05098039, 0, 1, 1,
0.5054202, -0.08777355, 1.99515, 0.05490196, 0, 1, 1,
0.5080919, 0.3127959, 1.150079, 0.0627451, 0, 1, 1,
0.5133719, 0.02821712, 1.009783, 0.06666667, 0, 1, 1,
0.5165985, 1.359748, 1.49878, 0.07450981, 0, 1, 1,
0.5198565, 1.257224, -0.7378468, 0.07843138, 0, 1, 1,
0.5206615, 2.466018, 0.3109502, 0.08627451, 0, 1, 1,
0.5263718, 1.110042, 1.266261, 0.09019608, 0, 1, 1,
0.5273737, -0.5357902, 2.701616, 0.09803922, 0, 1, 1,
0.5318169, -0.7651956, 1.97758, 0.1058824, 0, 1, 1,
0.5352331, 1.748256, 0.8617634, 0.1098039, 0, 1, 1,
0.5370314, -0.86285, 1.653822, 0.1176471, 0, 1, 1,
0.5371758, -0.1923591, 1.666844, 0.1215686, 0, 1, 1,
0.5373841, -0.3574256, 0.1029264, 0.1294118, 0, 1, 1,
0.5451986, -0.05880094, 2.972301, 0.1333333, 0, 1, 1,
0.5455782, 0.06265897, 0.66412, 0.1411765, 0, 1, 1,
0.5458521, 0.6049559, 3.32669, 0.145098, 0, 1, 1,
0.5489481, 0.1769997, 2.326759, 0.1529412, 0, 1, 1,
0.5517411, 1.694571, 1.185204, 0.1568628, 0, 1, 1,
0.5554846, 0.4001843, 0.6954483, 0.1647059, 0, 1, 1,
0.556524, 0.9146791, -0.0964964, 0.1686275, 0, 1, 1,
0.5569083, -0.06303101, 1.660995, 0.1764706, 0, 1, 1,
0.5569938, 0.1960464, 2.376988, 0.1803922, 0, 1, 1,
0.5607343, -0.5508787, 3.705614, 0.1882353, 0, 1, 1,
0.5622556, 0.4996371, -1.21093, 0.1921569, 0, 1, 1,
0.5638246, 0.9458883, 1.198641, 0.2, 0, 1, 1,
0.564018, 1.207852, 1.517455, 0.2078431, 0, 1, 1,
0.5769416, -0.81311, 4.382991, 0.2117647, 0, 1, 1,
0.5785238, -0.5163663, 3.4661, 0.2196078, 0, 1, 1,
0.5793558, 0.6057143, 0.934966, 0.2235294, 0, 1, 1,
0.5812344, 1.131011, 0.36295, 0.2313726, 0, 1, 1,
0.5885867, -0.8709923, 3.699418, 0.2352941, 0, 1, 1,
0.5893236, 0.01933238, 2.019279, 0.2431373, 0, 1, 1,
0.5904436, -0.4443459, -0.6325697, 0.2470588, 0, 1, 1,
0.5906734, 0.1717777, 1.584608, 0.254902, 0, 1, 1,
0.5929947, 0.232426, 1.69473, 0.2588235, 0, 1, 1,
0.6002313, -0.6676185, 2.822636, 0.2666667, 0, 1, 1,
0.6050645, -0.9422132, 1.826777, 0.2705882, 0, 1, 1,
0.6102649, 0.9572912, -1.167206, 0.2784314, 0, 1, 1,
0.6132092, -1.168488, 3.374852, 0.282353, 0, 1, 1,
0.6142173, 0.2150695, -2.625469, 0.2901961, 0, 1, 1,
0.614792, -1.585276, 1.566627, 0.2941177, 0, 1, 1,
0.6168262, 0.2329167, 1.149252, 0.3019608, 0, 1, 1,
0.6200238, 0.5843407, -0.7867069, 0.3098039, 0, 1, 1,
0.6240594, -0.329645, 3.125444, 0.3137255, 0, 1, 1,
0.6242687, 0.4782799, -0.5681211, 0.3215686, 0, 1, 1,
0.6274384, -0.7967898, 1.597391, 0.3254902, 0, 1, 1,
0.6285435, 1.478104, -0.02775434, 0.3333333, 0, 1, 1,
0.6304693, -1.265883, 3.948287, 0.3372549, 0, 1, 1,
0.6331044, 0.997206, -0.5833077, 0.345098, 0, 1, 1,
0.6332382, -0.09507713, 1.990768, 0.3490196, 0, 1, 1,
0.6347286, 1.378412, 1.957962, 0.3568628, 0, 1, 1,
0.635103, 0.287311, 2.713828, 0.3607843, 0, 1, 1,
0.6360596, 0.1679726, 3.446226, 0.3686275, 0, 1, 1,
0.6379635, -1.306216, 1.907054, 0.372549, 0, 1, 1,
0.6424278, 0.8773252, -0.1961966, 0.3803922, 0, 1, 1,
0.6425945, -0.7984381, -0.4951427, 0.3843137, 0, 1, 1,
0.6453432, 0.03404886, 2.064993, 0.3921569, 0, 1, 1,
0.6480063, -0.2784909, 0.3081745, 0.3960784, 0, 1, 1,
0.6521261, -0.6208511, 2.306949, 0.4039216, 0, 1, 1,
0.6549346, -0.580827, 2.871953, 0.4117647, 0, 1, 1,
0.6594341, 2.299217, -1.525155, 0.4156863, 0, 1, 1,
0.6608251, -1.23094, 4.53004, 0.4235294, 0, 1, 1,
0.6677756, 1.804328, -1.234705, 0.427451, 0, 1, 1,
0.6745429, 0.768938, 0.222354, 0.4352941, 0, 1, 1,
0.676308, -0.7292222, 1.711194, 0.4392157, 0, 1, 1,
0.6767581, -0.375955, 1.817393, 0.4470588, 0, 1, 1,
0.6787453, 0.9092707, 0.9695253, 0.4509804, 0, 1, 1,
0.6791707, 0.5191539, 0.3454674, 0.4588235, 0, 1, 1,
0.6824598, 0.5905098, 1.863126, 0.4627451, 0, 1, 1,
0.6868423, 0.03558564, 1.818904, 0.4705882, 0, 1, 1,
0.6891539, 0.7045895, 1.031676, 0.4745098, 0, 1, 1,
0.6896845, 1.375393, -0.2450137, 0.4823529, 0, 1, 1,
0.692932, 0.6714138, -0.6924383, 0.4862745, 0, 1, 1,
0.697139, -1.161214, 3.178632, 0.4941176, 0, 1, 1,
0.6998497, -1.971404, 4.18839, 0.5019608, 0, 1, 1,
0.7030761, 0.7787086, -1.652398, 0.5058824, 0, 1, 1,
0.7057375, -0.5072706, 3.619499, 0.5137255, 0, 1, 1,
0.7099728, 0.4383928, 1.761985, 0.5176471, 0, 1, 1,
0.7113988, 0.5112898, -0.5509734, 0.5254902, 0, 1, 1,
0.7132362, -0.7346363, 1.341289, 0.5294118, 0, 1, 1,
0.7133188, 0.3156278, 0.08646492, 0.5372549, 0, 1, 1,
0.7138757, 2.572443, 0.6310398, 0.5411765, 0, 1, 1,
0.71606, 1.449853, -0.801941, 0.5490196, 0, 1, 1,
0.7185826, -1.491774, 3.825242, 0.5529412, 0, 1, 1,
0.7311815, -0.2294446, 2.738626, 0.5607843, 0, 1, 1,
0.7323634, -0.1342703, 0.9483148, 0.5647059, 0, 1, 1,
0.7329189, -1.131781, 1.87802, 0.572549, 0, 1, 1,
0.7396764, 0.2412476, 0.8074226, 0.5764706, 0, 1, 1,
0.7434648, 0.810339, 0.6752801, 0.5843138, 0, 1, 1,
0.7523533, 0.6197266, 0.2810026, 0.5882353, 0, 1, 1,
0.7558645, -0.01772262, 0.6063864, 0.5960785, 0, 1, 1,
0.7578056, -0.6040087, 0.9456922, 0.6039216, 0, 1, 1,
0.7653558, 0.1292204, 2.924892, 0.6078432, 0, 1, 1,
0.7663893, -1.766913, 1.993667, 0.6156863, 0, 1, 1,
0.7751127, -0.9390804, 2.51367, 0.6196079, 0, 1, 1,
0.7798432, 0.3834333, 2.421219, 0.627451, 0, 1, 1,
0.7829111, 1.088075, 0.655828, 0.6313726, 0, 1, 1,
0.7854991, -0.6042001, 2.323023, 0.6392157, 0, 1, 1,
0.7857097, -1.252967, 5.170602, 0.6431373, 0, 1, 1,
0.7904781, 2.058097, -0.6028391, 0.6509804, 0, 1, 1,
0.7935873, -1.021654, 2.732402, 0.654902, 0, 1, 1,
0.7943819, 0.9864568, 0.3825064, 0.6627451, 0, 1, 1,
0.7978441, 0.1094492, 2.296604, 0.6666667, 0, 1, 1,
0.7984738, -1.343729, 1.597127, 0.6745098, 0, 1, 1,
0.8057451, 0.04788008, 0.6806383, 0.6784314, 0, 1, 1,
0.8073919, 0.3571811, 0.9189496, 0.6862745, 0, 1, 1,
0.8084581, 0.8209288, 1.308008, 0.6901961, 0, 1, 1,
0.8137712, -0.4032157, 2.541276, 0.6980392, 0, 1, 1,
0.8177094, 0.2236753, 2.143014, 0.7058824, 0, 1, 1,
0.8207862, 1.754838, 0.1011206, 0.7098039, 0, 1, 1,
0.825213, -0.9143867, 3.593267, 0.7176471, 0, 1, 1,
0.8294431, -0.5877141, 1.874481, 0.7215686, 0, 1, 1,
0.8330628, -1.166382, 1.396429, 0.7294118, 0, 1, 1,
0.8361927, 0.2681363, -0.2967331, 0.7333333, 0, 1, 1,
0.8363646, 0.570991, 2.490265, 0.7411765, 0, 1, 1,
0.8430958, 0.6292692, 2.559329, 0.7450981, 0, 1, 1,
0.8433744, -0.03370965, 1.260928, 0.7529412, 0, 1, 1,
0.8494164, 0.5614253, 1.642497, 0.7568628, 0, 1, 1,
0.8529422, 1.844592, -1.305906, 0.7647059, 0, 1, 1,
0.8531682, 1.557205, 1.37705, 0.7686275, 0, 1, 1,
0.8544742, 0.08745124, 0.1324763, 0.7764706, 0, 1, 1,
0.8557541, 2.289674, 0.2785775, 0.7803922, 0, 1, 1,
0.8571752, -0.001054839, 1.04618, 0.7882353, 0, 1, 1,
0.8644049, 0.2175589, 1.537611, 0.7921569, 0, 1, 1,
0.8740162, -0.04367238, 3.313896, 0.8, 0, 1, 1,
0.8796999, 0.9326034, -0.09414648, 0.8078431, 0, 1, 1,
0.8806381, -0.4005095, 3.758831, 0.8117647, 0, 1, 1,
0.8820747, -1.872692, 2.948144, 0.8196079, 0, 1, 1,
0.8838728, 0.1058258, 0.8752245, 0.8235294, 0, 1, 1,
0.886138, 0.635356, -0.01858981, 0.8313726, 0, 1, 1,
0.8877817, -0.1860627, 2.804745, 0.8352941, 0, 1, 1,
0.8885316, 0.908192, 1.233356, 0.8431373, 0, 1, 1,
0.889691, -0.9629033, 2.175682, 0.8470588, 0, 1, 1,
0.8905954, -0.4276496, 2.630249, 0.854902, 0, 1, 1,
0.894065, 0.7667081, 2.11345, 0.8588235, 0, 1, 1,
0.896066, -1.302875, 2.033184, 0.8666667, 0, 1, 1,
0.899136, -0.4014089, 1.700604, 0.8705882, 0, 1, 1,
0.8997929, -1.499965, 2.047465, 0.8784314, 0, 1, 1,
0.9040799, -0.2815908, 2.047065, 0.8823529, 0, 1, 1,
0.9058455, 1.018883, 3.678093, 0.8901961, 0, 1, 1,
0.9082379, 0.3045156, 1.183282, 0.8941177, 0, 1, 1,
0.9119837, -0.9752988, 2.879485, 0.9019608, 0, 1, 1,
0.917402, -0.1225972, -0.3378199, 0.9098039, 0, 1, 1,
0.9181852, 0.9240556, -0.4292794, 0.9137255, 0, 1, 1,
0.9258865, -0.7502765, 0.3235696, 0.9215686, 0, 1, 1,
0.9270976, -0.598731, 3.076395, 0.9254902, 0, 1, 1,
0.9285497, -0.02345791, 2.180696, 0.9333333, 0, 1, 1,
0.9294547, -1.55293, 1.925979, 0.9372549, 0, 1, 1,
0.9295956, -2.040403, 2.118761, 0.945098, 0, 1, 1,
0.9304258, -1.277341, 4.635919, 0.9490196, 0, 1, 1,
0.931482, -0.7101411, 0.4222922, 0.9568627, 0, 1, 1,
0.9366019, 1.294019, -0.04938714, 0.9607843, 0, 1, 1,
0.9387081, -0.1160385, 0.09838551, 0.9686275, 0, 1, 1,
0.9458137, 0.3088293, 2.445314, 0.972549, 0, 1, 1,
0.9499347, -1.939409, 4.114896, 0.9803922, 0, 1, 1,
0.9542891, -0.0998324, 1.194391, 0.9843137, 0, 1, 1,
0.9543265, -0.522009, 3.128928, 0.9921569, 0, 1, 1,
0.9573893, -0.7328575, 0.3356281, 0.9960784, 0, 1, 1,
0.9654322, -2.013087, 2.275106, 1, 0, 0.9960784, 1,
0.965916, -0.05779576, 1.617512, 1, 0, 0.9882353, 1,
0.9706687, -0.008863075, -0.4034657, 1, 0, 0.9843137, 1,
0.9723589, -1.044723, 0.6688927, 1, 0, 0.9764706, 1,
0.9727719, 1.671432, -0.6947472, 1, 0, 0.972549, 1,
0.9778314, -1.027978, 4.476503, 1, 0, 0.9647059, 1,
0.9866683, 0.7903569, -1.284096, 1, 0, 0.9607843, 1,
0.9887027, -0.6193182, 1.702502, 1, 0, 0.9529412, 1,
0.9897738, 0.0625697, 0.750362, 1, 0, 0.9490196, 1,
1.005092, -0.7243535, 3.529652, 1, 0, 0.9411765, 1,
1.010724, -0.3269569, 1.249646, 1, 0, 0.9372549, 1,
1.016045, 0.8348389, 1.286775, 1, 0, 0.9294118, 1,
1.019286, -2.722779, 4.135637, 1, 0, 0.9254902, 1,
1.022697, 0.1474767, 1.800789, 1, 0, 0.9176471, 1,
1.029442, 0.1009183, 3.002862, 1, 0, 0.9137255, 1,
1.037697, -0.1483682, 0.9331588, 1, 0, 0.9058824, 1,
1.040121, -0.9326566, 1.655914, 1, 0, 0.9019608, 1,
1.044661, -1.78139, 2.818545, 1, 0, 0.8941177, 1,
1.04674, 0.7488173, 1.200987, 1, 0, 0.8862745, 1,
1.049076, -0.3504775, 1.533998, 1, 0, 0.8823529, 1,
1.061588, 0.2360994, 1.685844, 1, 0, 0.8745098, 1,
1.069189, 0.5085663, 1.572085, 1, 0, 0.8705882, 1,
1.072586, 1.119721, -0.1244936, 1, 0, 0.8627451, 1,
1.080658, 0.7024285, 2.079677, 1, 0, 0.8588235, 1,
1.085011, 0.9822425, 0.3945972, 1, 0, 0.8509804, 1,
1.088259, 0.8227593, 0.2545859, 1, 0, 0.8470588, 1,
1.105687, 1.689598, -0.2192083, 1, 0, 0.8392157, 1,
1.109037, -2.786874, 2.187406, 1, 0, 0.8352941, 1,
1.119207, 0.6455429, 0.7837537, 1, 0, 0.827451, 1,
1.130923, 0.8297087, 0.9573252, 1, 0, 0.8235294, 1,
1.142677, -0.6032692, 1.980541, 1, 0, 0.8156863, 1,
1.154706, 1.720389, 0.08395346, 1, 0, 0.8117647, 1,
1.172894, 2.100052, -0.9323514, 1, 0, 0.8039216, 1,
1.179363, 0.1331203, 2.064556, 1, 0, 0.7960784, 1,
1.189497, -0.3979935, 1.431481, 1, 0, 0.7921569, 1,
1.20083, -0.5832038, 1.961003, 1, 0, 0.7843137, 1,
1.201526, -0.1601363, 0.9853597, 1, 0, 0.7803922, 1,
1.203261, -0.4011397, 1.909839, 1, 0, 0.772549, 1,
1.206024, 0.01356139, 0.2263375, 1, 0, 0.7686275, 1,
1.228641, -0.8587984, 3.06466, 1, 0, 0.7607843, 1,
1.232256, -1.047832, 2.802957, 1, 0, 0.7568628, 1,
1.237983, 1.846087, 0.02103568, 1, 0, 0.7490196, 1,
1.239996, 0.8481442, 2.031201, 1, 0, 0.7450981, 1,
1.240429, -0.9152231, 3.05794, 1, 0, 0.7372549, 1,
1.249651, 0.5694936, 1.613674, 1, 0, 0.7333333, 1,
1.250088, 1.130953, 1.238692, 1, 0, 0.7254902, 1,
1.252035, -0.4759732, 0.140188, 1, 0, 0.7215686, 1,
1.258364, -0.5999358, 2.132327, 1, 0, 0.7137255, 1,
1.259616, -0.2534904, 1.318926, 1, 0, 0.7098039, 1,
1.265646, -1.394064, 2.746221, 1, 0, 0.7019608, 1,
1.26814, -0.3800903, -0.06948217, 1, 0, 0.6941177, 1,
1.274624, 1.277359, 0.8068976, 1, 0, 0.6901961, 1,
1.276094, -0.1717194, 0.9953108, 1, 0, 0.682353, 1,
1.277032, 0.1732057, 3.688017, 1, 0, 0.6784314, 1,
1.285945, 1.365687, 0.6781257, 1, 0, 0.6705883, 1,
1.290112, 0.1832182, 0.5751759, 1, 0, 0.6666667, 1,
1.290377, 0.2150047, 2.596933, 1, 0, 0.6588235, 1,
1.291915, -0.05863962, 1.052845, 1, 0, 0.654902, 1,
1.299153, 0.3741021, 1.323282, 1, 0, 0.6470588, 1,
1.301669, 1.085795, 1.299664, 1, 0, 0.6431373, 1,
1.30472, -0.06038208, 2.252653, 1, 0, 0.6352941, 1,
1.306305, -0.5386364, 3.409904, 1, 0, 0.6313726, 1,
1.310495, 0.08773257, 2.043776, 1, 0, 0.6235294, 1,
1.314469, 0.5640801, 2.14417, 1, 0, 0.6196079, 1,
1.318636, -2.380622, 2.844212, 1, 0, 0.6117647, 1,
1.324983, -0.4048252, 2.386058, 1, 0, 0.6078432, 1,
1.325753, 0.7816604, 0.6500915, 1, 0, 0.6, 1,
1.333712, 1.036379, -0.01430457, 1, 0, 0.5921569, 1,
1.337692, 1.516257, 1.01491, 1, 0, 0.5882353, 1,
1.34539, -1.092902, 1.436776, 1, 0, 0.5803922, 1,
1.364719, 0.8153766, 1.157415, 1, 0, 0.5764706, 1,
1.37148, -1.824398, 2.311675, 1, 0, 0.5686275, 1,
1.388385, 0.040268, 1.188843, 1, 0, 0.5647059, 1,
1.392633, -1.330551, 1.18475, 1, 0, 0.5568628, 1,
1.393748, -0.1413156, 1.792621, 1, 0, 0.5529412, 1,
1.3943, -0.1329472, 1.038993, 1, 0, 0.5450981, 1,
1.398487, -0.9297781, 3.255513, 1, 0, 0.5411765, 1,
1.399207, 0.9733108, 1.035872, 1, 0, 0.5333334, 1,
1.406785, -1.251197, 1.865791, 1, 0, 0.5294118, 1,
1.409201, 0.3241425, -0.5832006, 1, 0, 0.5215687, 1,
1.412775, -0.07622375, 0.1464147, 1, 0, 0.5176471, 1,
1.414642, 0.7244718, 0.02169752, 1, 0, 0.509804, 1,
1.415376, -2.395473, 0.5237786, 1, 0, 0.5058824, 1,
1.417297, -0.4658578, 1.881986, 1, 0, 0.4980392, 1,
1.420746, -1.320842, 0.5581125, 1, 0, 0.4901961, 1,
1.438932, -0.2893906, 1.942598, 1, 0, 0.4862745, 1,
1.444743, 0.9112262, 1.696948, 1, 0, 0.4784314, 1,
1.45835, 0.985769, 0.8562147, 1, 0, 0.4745098, 1,
1.475438, -0.5726455, 2.097059, 1, 0, 0.4666667, 1,
1.477105, -1.412754, 2.578675, 1, 0, 0.4627451, 1,
1.493423, -0.4749201, 0.5015796, 1, 0, 0.454902, 1,
1.513858, -1.849993, 1.82582, 1, 0, 0.4509804, 1,
1.51395, 0.5545058, 1.201471, 1, 0, 0.4431373, 1,
1.520375, -0.7776459, 1.148533, 1, 0, 0.4392157, 1,
1.522073, -1.010769, 1.125396, 1, 0, 0.4313726, 1,
1.533955, 0.735791, 0.1381417, 1, 0, 0.427451, 1,
1.540178, 0.02050746, 2.254449, 1, 0, 0.4196078, 1,
1.554045, 1.067887, -0.1979056, 1, 0, 0.4156863, 1,
1.554563, -0.9616156, 1.130129, 1, 0, 0.4078431, 1,
1.575414, -0.4230266, 2.019799, 1, 0, 0.4039216, 1,
1.584355, 0.2106948, 0.9917501, 1, 0, 0.3960784, 1,
1.58734, 1.208697, 1.54605, 1, 0, 0.3882353, 1,
1.59769, -1.090023, 2.279276, 1, 0, 0.3843137, 1,
1.602581, 1.529029, 0.09274907, 1, 0, 0.3764706, 1,
1.622918, -1.589523, 2.589925, 1, 0, 0.372549, 1,
1.639362, 0.8023673, 1.757858, 1, 0, 0.3647059, 1,
1.64391, -0.2958252, 1.192073, 1, 0, 0.3607843, 1,
1.65328, 0.550545, -0.1155168, 1, 0, 0.3529412, 1,
1.65428, 1.107971, 0.3000817, 1, 0, 0.3490196, 1,
1.655401, -0.01701876, 0.7734672, 1, 0, 0.3411765, 1,
1.658992, -3.075575, 2.212529, 1, 0, 0.3372549, 1,
1.659933, -0.2242738, 2.482607, 1, 0, 0.3294118, 1,
1.691656, -1.209578, 3.446984, 1, 0, 0.3254902, 1,
1.693274, 2.805842, 0.1460478, 1, 0, 0.3176471, 1,
1.703764, -1.120979, 1.663874, 1, 0, 0.3137255, 1,
1.708658, 0.08907064, 1.481345, 1, 0, 0.3058824, 1,
1.718284, -0.5243208, 1.523176, 1, 0, 0.2980392, 1,
1.734344, -0.5466987, 1.138152, 1, 0, 0.2941177, 1,
1.750252, 0.6720089, 2.131691, 1, 0, 0.2862745, 1,
1.752246, -0.7973008, 1.45256, 1, 0, 0.282353, 1,
1.758341, -1.067818, 2.178079, 1, 0, 0.2745098, 1,
1.760131, 0.9172678, 1.804999, 1, 0, 0.2705882, 1,
1.772658, -0.4766758, 2.916423, 1, 0, 0.2627451, 1,
1.800127, 0.5701343, 1.386051, 1, 0, 0.2588235, 1,
1.807641, -1.290362, 1.638217, 1, 0, 0.2509804, 1,
1.813726, 1.785105, -0.1398003, 1, 0, 0.2470588, 1,
1.824607, -1.424378, -0.09667164, 1, 0, 0.2392157, 1,
1.828296, 0.7352307, 0.6154145, 1, 0, 0.2352941, 1,
1.829563, 1.257822, 1.21756, 1, 0, 0.227451, 1,
1.847179, 0.01787396, 0.4918113, 1, 0, 0.2235294, 1,
1.84741, 0.9539479, 2.251044, 1, 0, 0.2156863, 1,
1.850617, -0.002311315, 2.822337, 1, 0, 0.2117647, 1,
1.867069, -1.124352, 3.406596, 1, 0, 0.2039216, 1,
1.877514, -1.92256, 1.938228, 1, 0, 0.1960784, 1,
1.878984, -0.1616745, 0.9181721, 1, 0, 0.1921569, 1,
1.884533, 1.592606, -0.07853408, 1, 0, 0.1843137, 1,
1.896895, -0.8478411, 1.271064, 1, 0, 0.1803922, 1,
1.901861, -1.006747, 2.956685, 1, 0, 0.172549, 1,
1.909899, 1.299473, 1.826138, 1, 0, 0.1686275, 1,
1.911431, -0.9198381, 0.914224, 1, 0, 0.1607843, 1,
1.924443, 0.5163845, 1.082316, 1, 0, 0.1568628, 1,
1.947878, -2.474251, 4.061353, 1, 0, 0.1490196, 1,
1.949336, -1.870163, 2.972038, 1, 0, 0.145098, 1,
1.95199, 1.65208, 1.945493, 1, 0, 0.1372549, 1,
1.953001, -0.3812235, 1.202087, 1, 0, 0.1333333, 1,
2.005407, 0.3779913, 2.374504, 1, 0, 0.1254902, 1,
2.016833, 1.412234, 1.714463, 1, 0, 0.1215686, 1,
2.055569, -0.4574718, 1.49584, 1, 0, 0.1137255, 1,
2.062326, -0.3530338, 2.031028, 1, 0, 0.1098039, 1,
2.097585, -0.7108727, 2.546194, 1, 0, 0.1019608, 1,
2.195904, -1.143252, 2.400034, 1, 0, 0.09411765, 1,
2.214297, 0.7793982, 0.9939087, 1, 0, 0.09019608, 1,
2.247446, -0.3278979, 2.677498, 1, 0, 0.08235294, 1,
2.267817, 0.4915852, 1.300807, 1, 0, 0.07843138, 1,
2.281123, -2.938679, 0.6442855, 1, 0, 0.07058824, 1,
2.299684, -0.7083884, 1.857571, 1, 0, 0.06666667, 1,
2.359349, 1.864415, 1.96887, 1, 0, 0.05882353, 1,
2.40983, -0.9804466, 2.979388, 1, 0, 0.05490196, 1,
2.478498, 2.242041, 0.2754046, 1, 0, 0.04705882, 1,
2.504901, 0.03153623, 1.474176, 1, 0, 0.04313726, 1,
2.561902, -0.3016523, 1.19056, 1, 0, 0.03529412, 1,
2.633919, 1.993855, 1.62456, 1, 0, 0.03137255, 1,
2.711925, -0.6753499, 3.114391, 1, 0, 0.02352941, 1,
2.747889, 0.6468759, -0.6348059, 1, 0, 0.01960784, 1,
2.772607, 1.360517, 0.6603726, 1, 0, 0.01176471, 1,
2.785001, -0.2581313, 1.1562, 1, 0, 0.007843138, 1
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
-0.1373003, -4.338741, -7.549319, 0, -0.5, 0.5, 0.5,
-0.1373003, -4.338741, -7.549319, 1, -0.5, 0.5, 0.5,
-0.1373003, -4.338741, -7.549319, 1, 1.5, 0.5, 0.5,
-0.1373003, -4.338741, -7.549319, 0, 1.5, 0.5, 0.5
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
-4.050262, -0.1509339, -7.549319, 0, -0.5, 0.5, 0.5,
-4.050262, -0.1509339, -7.549319, 1, -0.5, 0.5, 0.5,
-4.050262, -0.1509339, -7.549319, 1, 1.5, 0.5, 0.5,
-4.050262, -0.1509339, -7.549319, 0, 1.5, 0.5, 0.5
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
-4.050262, -4.338741, -0.1258147, 0, -0.5, 0.5, 0.5,
-4.050262, -4.338741, -0.1258147, 1, -0.5, 0.5, 0.5,
-4.050262, -4.338741, -0.1258147, 1, 1.5, 0.5, 0.5,
-4.050262, -4.338741, -0.1258147, 0, 1.5, 0.5, 0.5
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
-3, -3.372324, -5.836202,
2, -3.372324, -5.836202,
-3, -3.372324, -5.836202,
-3, -3.533393, -6.121722,
-2, -3.372324, -5.836202,
-2, -3.533393, -6.121722,
-1, -3.372324, -5.836202,
-1, -3.533393, -6.121722,
0, -3.372324, -5.836202,
0, -3.533393, -6.121722,
1, -3.372324, -5.836202,
1, -3.533393, -6.121722,
2, -3.372324, -5.836202,
2, -3.533393, -6.121722
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
-3, -3.855532, -6.69276, 0, -0.5, 0.5, 0.5,
-3, -3.855532, -6.69276, 1, -0.5, 0.5, 0.5,
-3, -3.855532, -6.69276, 1, 1.5, 0.5, 0.5,
-3, -3.855532, -6.69276, 0, 1.5, 0.5, 0.5,
-2, -3.855532, -6.69276, 0, -0.5, 0.5, 0.5,
-2, -3.855532, -6.69276, 1, -0.5, 0.5, 0.5,
-2, -3.855532, -6.69276, 1, 1.5, 0.5, 0.5,
-2, -3.855532, -6.69276, 0, 1.5, 0.5, 0.5,
-1, -3.855532, -6.69276, 0, -0.5, 0.5, 0.5,
-1, -3.855532, -6.69276, 1, -0.5, 0.5, 0.5,
-1, -3.855532, -6.69276, 1, 1.5, 0.5, 0.5,
-1, -3.855532, -6.69276, 0, 1.5, 0.5, 0.5,
0, -3.855532, -6.69276, 0, -0.5, 0.5, 0.5,
0, -3.855532, -6.69276, 1, -0.5, 0.5, 0.5,
0, -3.855532, -6.69276, 1, 1.5, 0.5, 0.5,
0, -3.855532, -6.69276, 0, 1.5, 0.5, 0.5,
1, -3.855532, -6.69276, 0, -0.5, 0.5, 0.5,
1, -3.855532, -6.69276, 1, -0.5, 0.5, 0.5,
1, -3.855532, -6.69276, 1, 1.5, 0.5, 0.5,
1, -3.855532, -6.69276, 0, 1.5, 0.5, 0.5,
2, -3.855532, -6.69276, 0, -0.5, 0.5, 0.5,
2, -3.855532, -6.69276, 1, -0.5, 0.5, 0.5,
2, -3.855532, -6.69276, 1, 1.5, 0.5, 0.5,
2, -3.855532, -6.69276, 0, 1.5, 0.5, 0.5
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
-3.147271, -3, -5.836202,
-3.147271, 2, -5.836202,
-3.147271, -3, -5.836202,
-3.297769, -3, -6.121722,
-3.147271, -2, -5.836202,
-3.297769, -2, -6.121722,
-3.147271, -1, -5.836202,
-3.297769, -1, -6.121722,
-3.147271, 0, -5.836202,
-3.297769, 0, -6.121722,
-3.147271, 1, -5.836202,
-3.297769, 1, -6.121722,
-3.147271, 2, -5.836202,
-3.297769, 2, -6.121722
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
-3.598766, -3, -6.69276, 0, -0.5, 0.5, 0.5,
-3.598766, -3, -6.69276, 1, -0.5, 0.5, 0.5,
-3.598766, -3, -6.69276, 1, 1.5, 0.5, 0.5,
-3.598766, -3, -6.69276, 0, 1.5, 0.5, 0.5,
-3.598766, -2, -6.69276, 0, -0.5, 0.5, 0.5,
-3.598766, -2, -6.69276, 1, -0.5, 0.5, 0.5,
-3.598766, -2, -6.69276, 1, 1.5, 0.5, 0.5,
-3.598766, -2, -6.69276, 0, 1.5, 0.5, 0.5,
-3.598766, -1, -6.69276, 0, -0.5, 0.5, 0.5,
-3.598766, -1, -6.69276, 1, -0.5, 0.5, 0.5,
-3.598766, -1, -6.69276, 1, 1.5, 0.5, 0.5,
-3.598766, -1, -6.69276, 0, 1.5, 0.5, 0.5,
-3.598766, 0, -6.69276, 0, -0.5, 0.5, 0.5,
-3.598766, 0, -6.69276, 1, -0.5, 0.5, 0.5,
-3.598766, 0, -6.69276, 1, 1.5, 0.5, 0.5,
-3.598766, 0, -6.69276, 0, 1.5, 0.5, 0.5,
-3.598766, 1, -6.69276, 0, -0.5, 0.5, 0.5,
-3.598766, 1, -6.69276, 1, -0.5, 0.5, 0.5,
-3.598766, 1, -6.69276, 1, 1.5, 0.5, 0.5,
-3.598766, 1, -6.69276, 0, 1.5, 0.5, 0.5,
-3.598766, 2, -6.69276, 0, -0.5, 0.5, 0.5,
-3.598766, 2, -6.69276, 1, -0.5, 0.5, 0.5,
-3.598766, 2, -6.69276, 1, 1.5, 0.5, 0.5,
-3.598766, 2, -6.69276, 0, 1.5, 0.5, 0.5
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
-3.147271, -3.372324, -4,
-3.147271, -3.372324, 4,
-3.147271, -3.372324, -4,
-3.297769, -3.533393, -4,
-3.147271, -3.372324, -2,
-3.297769, -3.533393, -2,
-3.147271, -3.372324, 0,
-3.297769, -3.533393, 0,
-3.147271, -3.372324, 2,
-3.297769, -3.533393, 2,
-3.147271, -3.372324, 4,
-3.297769, -3.533393, 4
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
-3.598766, -3.855532, -4, 0, -0.5, 0.5, 0.5,
-3.598766, -3.855532, -4, 1, -0.5, 0.5, 0.5,
-3.598766, -3.855532, -4, 1, 1.5, 0.5, 0.5,
-3.598766, -3.855532, -4, 0, 1.5, 0.5, 0.5,
-3.598766, -3.855532, -2, 0, -0.5, 0.5, 0.5,
-3.598766, -3.855532, -2, 1, -0.5, 0.5, 0.5,
-3.598766, -3.855532, -2, 1, 1.5, 0.5, 0.5,
-3.598766, -3.855532, -2, 0, 1.5, 0.5, 0.5,
-3.598766, -3.855532, 0, 0, -0.5, 0.5, 0.5,
-3.598766, -3.855532, 0, 1, -0.5, 0.5, 0.5,
-3.598766, -3.855532, 0, 1, 1.5, 0.5, 0.5,
-3.598766, -3.855532, 0, 0, 1.5, 0.5, 0.5,
-3.598766, -3.855532, 2, 0, -0.5, 0.5, 0.5,
-3.598766, -3.855532, 2, 1, -0.5, 0.5, 0.5,
-3.598766, -3.855532, 2, 1, 1.5, 0.5, 0.5,
-3.598766, -3.855532, 2, 0, 1.5, 0.5, 0.5,
-3.598766, -3.855532, 4, 0, -0.5, 0.5, 0.5,
-3.598766, -3.855532, 4, 1, -0.5, 0.5, 0.5,
-3.598766, -3.855532, 4, 1, 1.5, 0.5, 0.5,
-3.598766, -3.855532, 4, 0, 1.5, 0.5, 0.5
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
-3.147271, -3.372324, -5.836202,
-3.147271, 3.070456, -5.836202,
-3.147271, -3.372324, 5.584573,
-3.147271, 3.070456, 5.584573,
-3.147271, -3.372324, -5.836202,
-3.147271, -3.372324, 5.584573,
-3.147271, 3.070456, -5.836202,
-3.147271, 3.070456, 5.584573,
-3.147271, -3.372324, -5.836202,
2.87267, -3.372324, -5.836202,
-3.147271, -3.372324, 5.584573,
2.87267, -3.372324, 5.584573,
-3.147271, 3.070456, -5.836202,
2.87267, 3.070456, -5.836202,
-3.147271, 3.070456, 5.584573,
2.87267, 3.070456, 5.584573,
2.87267, -3.372324, -5.836202,
2.87267, 3.070456, -5.836202,
2.87267, -3.372324, 5.584573,
2.87267, 3.070456, 5.584573,
2.87267, -3.372324, -5.836202,
2.87267, -3.372324, 5.584573,
2.87267, 3.070456, -5.836202,
2.87267, 3.070456, 5.584573
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
var radius = 7.704568;
var distance = 34.2785;
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
mvMatrix.translate( 0.1373003, 0.1509339, 0.1258147 );
mvMatrix.scale( 1.383789, 1.292971, 0.7294015 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.2785);
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
cyclopropane-1-carbo<-read.table("cyclopropane-1-carbo.xyz")
```

```
## Error in read.table("cyclopropane-1-carbo.xyz"): no lines available in input
```

```r
x<-cyclopropane-1-carbo$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropane' not found
```

```r
y<-cyclopropane-1-carbo$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropane' not found
```

```r
z<-cyclopropane-1-carbo$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclopropane' not found
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
-3.059602, -2.0973, -1.526558, 0, 0, 1, 1, 1,
-2.805062, -1.367189, -1.52267, 1, 0, 0, 1, 1,
-2.722755, 2.587755, -1.539668, 1, 0, 0, 1, 1,
-2.702473, 0.8090692, -0.9474963, 1, 0, 0, 1, 1,
-2.685883, 1.466152, -2.755108, 1, 0, 0, 1, 1,
-2.50608, 0.2798821, -2.283259, 1, 0, 0, 1, 1,
-2.35828, -0.1449073, -2.711904, 0, 0, 0, 1, 1,
-2.333961, -1.015375, -1.440149, 0, 0, 0, 1, 1,
-2.328816, -0.009784542, -2.283321, 0, 0, 0, 1, 1,
-2.247392, -0.3586803, -3.568873, 0, 0, 0, 1, 1,
-2.179295, 0.4226336, -1.500336, 0, 0, 0, 1, 1,
-2.147696, -0.9879988, -0.4901779, 0, 0, 0, 1, 1,
-2.131365, 0.4565573, -0.2727585, 0, 0, 0, 1, 1,
-2.120697, -0.3327499, -1.678479, 1, 1, 1, 1, 1,
-2.119006, -0.2442186, -3.77343, 1, 1, 1, 1, 1,
-2.109934, -0.3126596, -0.6973147, 1, 1, 1, 1, 1,
-2.080108, 1.150923, -2.759959, 1, 1, 1, 1, 1,
-2.069633, -1.106464, -0.8257559, 1, 1, 1, 1, 1,
-2.06274, 0.203078, -0.1342949, 1, 1, 1, 1, 1,
-2.056585, -0.2513666, -1.81805, 1, 1, 1, 1, 1,
-2.021696, 0.3514659, -0.5014073, 1, 1, 1, 1, 1,
-1.997943, -1.781707, -2.447917, 1, 1, 1, 1, 1,
-1.994145, 0.5366942, -1.812654, 1, 1, 1, 1, 1,
-1.976926, 0.166305, 0.05412722, 1, 1, 1, 1, 1,
-1.96911, 1.067423, -2.302727, 1, 1, 1, 1, 1,
-1.968046, 0.5799772, -0.7197706, 1, 1, 1, 1, 1,
-1.881458, 0.6932649, -1.597388, 1, 1, 1, 1, 1,
-1.857937, 0.7215812, -0.2766708, 1, 1, 1, 1, 1,
-1.856204, -0.9926777, -2.947847, 0, 0, 1, 1, 1,
-1.845122, 1.040984, -1.018714, 1, 0, 0, 1, 1,
-1.841383, -0.560711, -2.73698, 1, 0, 0, 1, 1,
-1.836585, 0.9798089, -2.472177, 1, 0, 0, 1, 1,
-1.82711, -1.245274, -2.958076, 1, 0, 0, 1, 1,
-1.804642, -1.989695, -2.87389, 1, 0, 0, 1, 1,
-1.802468, -0.4143373, -2.210395, 0, 0, 0, 1, 1,
-1.800466, 0.7560384, -0.4738018, 0, 0, 0, 1, 1,
-1.706854, 0.7258072, -1.094179, 0, 0, 0, 1, 1,
-1.696347, -0.556889, -2.390442, 0, 0, 0, 1, 1,
-1.658351, -1.350474, -2.808703, 0, 0, 0, 1, 1,
-1.656284, 0.343373, -0.117414, 0, 0, 0, 1, 1,
-1.651357, 0.7877539, -1.030819, 0, 0, 0, 1, 1,
-1.645838, 1.059199, -0.7290152, 1, 1, 1, 1, 1,
-1.635363, 0.9725725, -0.5099249, 1, 1, 1, 1, 1,
-1.616191, -1.243267, -1.693803, 1, 1, 1, 1, 1,
-1.612306, 0.8222114, -0.172221, 1, 1, 1, 1, 1,
-1.609302, 0.6253552, -0.366763, 1, 1, 1, 1, 1,
-1.604224, -0.9747669, -0.7024105, 1, 1, 1, 1, 1,
-1.577517, -1.870038, -3.566704, 1, 1, 1, 1, 1,
-1.562436, 1.397481, -0.9911206, 1, 1, 1, 1, 1,
-1.544862, -0.2274359, -2.708105, 1, 1, 1, 1, 1,
-1.544186, -0.8659753, -1.974888, 1, 1, 1, 1, 1,
-1.53057, -0.7622819, -2.785018, 1, 1, 1, 1, 1,
-1.522648, 1.033035, -1.8219, 1, 1, 1, 1, 1,
-1.512629, -0.05202522, -1.934614, 1, 1, 1, 1, 1,
-1.50085, 2.120447, -0.09413129, 1, 1, 1, 1, 1,
-1.494772, -1.398096, -2.158364, 1, 1, 1, 1, 1,
-1.491897, -3.278497, -3.485306, 0, 0, 1, 1, 1,
-1.487738, -1.033272, -1.821293, 1, 0, 0, 1, 1,
-1.487222, -0.6204316, -2.584919, 1, 0, 0, 1, 1,
-1.482642, 0.935392, -1.225559, 1, 0, 0, 1, 1,
-1.443409, -1.216292, -1.887758, 1, 0, 0, 1, 1,
-1.443208, -0.8766812, -2.886509, 1, 0, 0, 1, 1,
-1.436549, 0.3701975, 0.7636194, 0, 0, 0, 1, 1,
-1.428514, 0.2676192, -0.8881789, 0, 0, 0, 1, 1,
-1.422575, 0.6777905, -0.3240826, 0, 0, 0, 1, 1,
-1.422204, -1.486614, -0.3579901, 0, 0, 0, 1, 1,
-1.420872, -1.703267, -2.083709, 0, 0, 0, 1, 1,
-1.412204, -2.087488, -1.533036, 0, 0, 0, 1, 1,
-1.399635, -1.178151, -1.791592, 0, 0, 0, 1, 1,
-1.397942, -0.1386716, -0.8856714, 1, 1, 1, 1, 1,
-1.397624, 1.141307, -0.4849535, 1, 1, 1, 1, 1,
-1.391725, 0.6688545, -1.319348, 1, 1, 1, 1, 1,
-1.388941, 1.590039, -0.4795441, 1, 1, 1, 1, 1,
-1.365563, 0.4810573, -1.330523, 1, 1, 1, 1, 1,
-1.354207, 1.986967, 0.6684361, 1, 1, 1, 1, 1,
-1.333515, -0.7449144, -0.7155792, 1, 1, 1, 1, 1,
-1.332092, -0.4584648, -1.47831, 1, 1, 1, 1, 1,
-1.331382, 0.5470912, -0.3500979, 1, 1, 1, 1, 1,
-1.330575, -1.898642, -2.18884, 1, 1, 1, 1, 1,
-1.330558, -0.7820249, -1.076976, 1, 1, 1, 1, 1,
-1.325716, -0.2330331, -2.049709, 1, 1, 1, 1, 1,
-1.310496, 0.7278786, -2.409909, 1, 1, 1, 1, 1,
-1.28509, -1.389981, -4.612413, 1, 1, 1, 1, 1,
-1.285053, 0.2574827, 0.08490282, 1, 1, 1, 1, 1,
-1.282017, -0.6051732, -3.56638, 0, 0, 1, 1, 1,
-1.280128, 1.024013, -1.324545, 1, 0, 0, 1, 1,
-1.274124, -0.4139573, -2.531063, 1, 0, 0, 1, 1,
-1.272959, 0.007978249, -0.1903663, 1, 0, 0, 1, 1,
-1.271857, 0.5757679, -1.213177, 1, 0, 0, 1, 1,
-1.270362, 0.4339487, -1.116555, 1, 0, 0, 1, 1,
-1.270327, 1.06251, 0.2029304, 0, 0, 0, 1, 1,
-1.268951, 0.2562298, -1.805288, 0, 0, 0, 1, 1,
-1.267772, 1.011806, -0.915527, 0, 0, 0, 1, 1,
-1.26274, -0.975909, -1.030282, 0, 0, 0, 1, 1,
-1.26246, 2.038481, -0.3979568, 0, 0, 0, 1, 1,
-1.262051, -0.3321073, -0.9352641, 0, 0, 0, 1, 1,
-1.253729, 1.443893, -1.067235, 0, 0, 0, 1, 1,
-1.251959, 0.6274936, -0.4670831, 1, 1, 1, 1, 1,
-1.250768, 1.054607, -0.6914719, 1, 1, 1, 1, 1,
-1.243652, -0.1967512, -2.659794, 1, 1, 1, 1, 1,
-1.241409, -0.7842653, -2.088939, 1, 1, 1, 1, 1,
-1.229237, 1.123053, -2.246899, 1, 1, 1, 1, 1,
-1.214107, 0.03264461, -1.973156, 1, 1, 1, 1, 1,
-1.20913, -1.13735, -2.442326, 1, 1, 1, 1, 1,
-1.201115, -1.301835, -3.966812, 1, 1, 1, 1, 1,
-1.19309, 0.4637356, -1.668829, 1, 1, 1, 1, 1,
-1.19214, 1.980392, -0.3397078, 1, 1, 1, 1, 1,
-1.189137, -1.771615, -1.626026, 1, 1, 1, 1, 1,
-1.185053, -0.2948093, -1.403587, 1, 1, 1, 1, 1,
-1.176216, -1.2437, -3.049493, 1, 1, 1, 1, 1,
-1.171315, 0.09224366, -3.468569, 1, 1, 1, 1, 1,
-1.169654, -0.6787754, -4.335764, 1, 1, 1, 1, 1,
-1.168819, -1.52391, -2.354693, 0, 0, 1, 1, 1,
-1.165598, 0.8974846, -2.003556, 1, 0, 0, 1, 1,
-1.151063, -0.4725998, -2.65437, 1, 0, 0, 1, 1,
-1.140267, 0.3859082, -0.6694229, 1, 0, 0, 1, 1,
-1.137072, 0.543932, 1.084082, 1, 0, 0, 1, 1,
-1.129762, -1.661538, -2.576411, 1, 0, 0, 1, 1,
-1.127457, -0.5484425, -4.861095, 0, 0, 0, 1, 1,
-1.114668, -0.4538961, -2.783021, 0, 0, 0, 1, 1,
-1.107517, 0.6273201, -1.693479, 0, 0, 0, 1, 1,
-1.105847, 1.4065, -1.892403, 0, 0, 0, 1, 1,
-1.100102, 0.2234274, -1.508697, 0, 0, 0, 1, 1,
-1.081692, -0.8278608, -3.513026, 0, 0, 0, 1, 1,
-1.081393, -1.695238, -1.551779, 0, 0, 0, 1, 1,
-1.081061, -1.162795, -4.111276, 1, 1, 1, 1, 1,
-1.067934, 0.02962904, -1.517604, 1, 1, 1, 1, 1,
-1.058201, 0.02738851, -0.5182816, 1, 1, 1, 1, 1,
-1.052133, -0.9268, -2.055426, 1, 1, 1, 1, 1,
-1.050025, -0.8327601, -3.006948, 1, 1, 1, 1, 1,
-1.049054, 0.3576067, -0.2494192, 1, 1, 1, 1, 1,
-1.046995, 0.5970922, 0.2657109, 1, 1, 1, 1, 1,
-1.044191, 1.319244, -0.2251854, 1, 1, 1, 1, 1,
-1.040517, -2.059539, -5.66988, 1, 1, 1, 1, 1,
-1.027041, 1.755118, -0.3988628, 1, 1, 1, 1, 1,
-1.024979, -0.1002101, -2.209466, 1, 1, 1, 1, 1,
-1.008095, -0.3832403, -1.360047, 1, 1, 1, 1, 1,
-1.006607, 0.4618382, -2.501144, 1, 1, 1, 1, 1,
-1.00015, -1.423439, -3.556127, 1, 1, 1, 1, 1,
-0.9915124, 0.2460117, -1.116796, 1, 1, 1, 1, 1,
-0.9911957, 1.194515, -1.402248, 0, 0, 1, 1, 1,
-0.9885811, 0.106005, 0.7684789, 1, 0, 0, 1, 1,
-0.9885074, -0.8143489, -4.166875, 1, 0, 0, 1, 1,
-0.98698, -0.5836149, -2.172167, 1, 0, 0, 1, 1,
-0.9842875, 0.9115241, -1.133883, 1, 0, 0, 1, 1,
-0.9730971, -0.09207325, 0.3964859, 1, 0, 0, 1, 1,
-0.9721427, 0.4795909, -1.035835, 0, 0, 0, 1, 1,
-0.9718645, 1.518542, 0.237054, 0, 0, 0, 1, 1,
-0.9698124, 0.9417148, 0.8024284, 0, 0, 0, 1, 1,
-0.9683915, 0.9107143, -2.667655, 0, 0, 0, 1, 1,
-0.9660156, 0.6321774, 0.03101086, 0, 0, 0, 1, 1,
-0.9640432, -1.013809, -2.889024, 0, 0, 0, 1, 1,
-0.9610572, -0.8988329, -2.664209, 0, 0, 0, 1, 1,
-0.960943, 0.1253665, -1.490138, 1, 1, 1, 1, 1,
-0.9599113, 0.9263148, 0.001312061, 1, 1, 1, 1, 1,
-0.9573905, 0.9804701, -1.751109, 1, 1, 1, 1, 1,
-0.9531459, 1.410694, -0.8855252, 1, 1, 1, 1, 1,
-0.9528179, -0.9160026, -3.211047, 1, 1, 1, 1, 1,
-0.9527563, -1.72024, -2.300287, 1, 1, 1, 1, 1,
-0.9472479, 0.1046397, -2.04433, 1, 1, 1, 1, 1,
-0.9388939, 0.3362072, 0.9234933, 1, 1, 1, 1, 1,
-0.9346529, 0.1433972, -3.96853, 1, 1, 1, 1, 1,
-0.9158481, -1.530756, -2.102273, 1, 1, 1, 1, 1,
-0.9151357, 0.8262509, -1.085837, 1, 1, 1, 1, 1,
-0.9100303, -1.341509, -3.76406, 1, 1, 1, 1, 1,
-0.9089653, 0.9740306, 1.623741, 1, 1, 1, 1, 1,
-0.90316, -0.3208212, -1.843492, 1, 1, 1, 1, 1,
-0.8989467, 0.491542, 0.1808607, 1, 1, 1, 1, 1,
-0.8983029, 0.5793844, -1.161368, 0, 0, 1, 1, 1,
-0.8950958, 1.895858, -0.5315908, 1, 0, 0, 1, 1,
-0.8946223, 0.4853778, -0.9634669, 1, 0, 0, 1, 1,
-0.8935885, -2.072864, -1.029386, 1, 0, 0, 1, 1,
-0.8867216, -1.003551, -0.3113364, 1, 0, 0, 1, 1,
-0.872032, 0.4589535, -1.297105, 1, 0, 0, 1, 1,
-0.8700551, 0.6565544, -1.792112, 0, 0, 0, 1, 1,
-0.8680328, 1.317875, -1.327363, 0, 0, 0, 1, 1,
-0.8679128, -2.479912, -5.40421, 0, 0, 0, 1, 1,
-0.8617088, 0.7148957, -1.077043, 0, 0, 0, 1, 1,
-0.8520189, 0.4996395, -0.4226507, 0, 0, 0, 1, 1,
-0.8502218, 1.186485, 0.4907875, 0, 0, 0, 1, 1,
-0.8466814, 0.2267989, -3.414001, 0, 0, 0, 1, 1,
-0.8434802, -0.1754932, -1.625714, 1, 1, 1, 1, 1,
-0.8420846, 0.8612845, -0.8866989, 1, 1, 1, 1, 1,
-0.8412557, 0.06505368, -2.237257, 1, 1, 1, 1, 1,
-0.8355707, -0.2931395, -2.10339, 1, 1, 1, 1, 1,
-0.8353842, -1.535082, -2.462599, 1, 1, 1, 1, 1,
-0.832455, 0.8607903, -1.796277, 1, 1, 1, 1, 1,
-0.8296009, -0.04951889, 0.6499861, 1, 1, 1, 1, 1,
-0.8261279, 0.09353787, -2.14066, 1, 1, 1, 1, 1,
-0.8256598, -0.9473571, -3.905012, 1, 1, 1, 1, 1,
-0.8203762, 0.5292152, -0.08878722, 1, 1, 1, 1, 1,
-0.8195211, -0.1200977, -0.7198431, 1, 1, 1, 1, 1,
-0.8138008, 0.3847819, -0.755248, 1, 1, 1, 1, 1,
-0.813759, 0.909873, -0.02988862, 1, 1, 1, 1, 1,
-0.8124043, 0.5464637, 0.02790812, 1, 1, 1, 1, 1,
-0.8118626, -0.4109125, -1.895381, 1, 1, 1, 1, 1,
-0.8105077, -0.9790599, -2.659516, 0, 0, 1, 1, 1,
-0.8095182, 0.3421699, 0.1323563, 1, 0, 0, 1, 1,
-0.8072039, -1.276691, -3.484721, 1, 0, 0, 1, 1,
-0.8062965, 1.509768, 0.7480924, 1, 0, 0, 1, 1,
-0.8049182, -0.01399349, -4.209788, 1, 0, 0, 1, 1,
-0.8004951, -0.922596, -1.642818, 1, 0, 0, 1, 1,
-0.7987143, 0.3664735, -3.487475, 0, 0, 0, 1, 1,
-0.7955598, 2.870617, -0.1970715, 0, 0, 0, 1, 1,
-0.7888528, -1.211054, -2.12231, 0, 0, 0, 1, 1,
-0.7885845, -0.189633, -1.185287, 0, 0, 0, 1, 1,
-0.7859189, 0.2835871, -1.425833, 0, 0, 0, 1, 1,
-0.785578, -1.919648, -1.498287, 0, 0, 0, 1, 1,
-0.7827412, 1.298247, 1.735705, 0, 0, 0, 1, 1,
-0.7739489, -1.883316, -4.675182, 1, 1, 1, 1, 1,
-0.770564, 1.952749, -0.1718745, 1, 1, 1, 1, 1,
-0.7703183, -0.733011, -3.514797, 1, 1, 1, 1, 1,
-0.7681977, 0.6970105, -0.5793003, 1, 1, 1, 1, 1,
-0.7642794, 0.6245486, 0.2742941, 1, 1, 1, 1, 1,
-0.7436219, 0.7973771, -1.123823, 1, 1, 1, 1, 1,
-0.7418493, -0.0773259, -1.789279, 1, 1, 1, 1, 1,
-0.7385937, -1.122155, -1.485536, 1, 1, 1, 1, 1,
-0.73728, -0.3706899, -2.810635, 1, 1, 1, 1, 1,
-0.7363795, 0.2741507, -0.1703084, 1, 1, 1, 1, 1,
-0.7319771, 1.223776, -0.4791974, 1, 1, 1, 1, 1,
-0.7310733, -0.1711798, -1.421974, 1, 1, 1, 1, 1,
-0.7240484, 0.1245088, -1.956126, 1, 1, 1, 1, 1,
-0.7203028, -0.4436113, -2.155857, 1, 1, 1, 1, 1,
-0.7199813, 0.4024996, -0.4531869, 1, 1, 1, 1, 1,
-0.7185226, -0.2990327, -2.065137, 0, 0, 1, 1, 1,
-0.717495, -0.9349265, -3.860012, 1, 0, 0, 1, 1,
-0.7082725, 0.08310391, -1.818576, 1, 0, 0, 1, 1,
-0.7031571, -0.6501988, -1.17574, 1, 0, 0, 1, 1,
-0.6992074, 0.9030373, -0.03546035, 1, 0, 0, 1, 1,
-0.6983483, 0.2008903, -1.07378, 1, 0, 0, 1, 1,
-0.6935207, 0.6467007, -0.4226326, 0, 0, 0, 1, 1,
-0.6927438, -1.275978, -3.825438, 0, 0, 0, 1, 1,
-0.6924108, 1.550375, -0.6340277, 0, 0, 0, 1, 1,
-0.692318, 1.834765, 1.556982, 0, 0, 0, 1, 1,
-0.6891029, 0.610741, -2.123096, 0, 0, 0, 1, 1,
-0.6881263, -0.0821359, -3.153667, 0, 0, 0, 1, 1,
-0.6870481, -1.292909, -1.908778, 0, 0, 0, 1, 1,
-0.6803524, -0.8198273, -1.732122, 1, 1, 1, 1, 1,
-0.6770803, -0.1471399, -1.793862, 1, 1, 1, 1, 1,
-0.6751029, 0.9175108, -1.345282, 1, 1, 1, 1, 1,
-0.6728079, 0.720705, -2.919048, 1, 1, 1, 1, 1,
-0.6718729, 1.338189, -1.481655, 1, 1, 1, 1, 1,
-0.6708792, -0.5890288, -1.590719, 1, 1, 1, 1, 1,
-0.6705677, 1.189086, -0.8408186, 1, 1, 1, 1, 1,
-0.6699699, -1.152031, -1.542691, 1, 1, 1, 1, 1,
-0.6693001, 2.814875, -1.452229, 1, 1, 1, 1, 1,
-0.6658249, 0.7728667, -0.2227362, 1, 1, 1, 1, 1,
-0.6641784, 1.737387, -0.9835833, 1, 1, 1, 1, 1,
-0.6631285, 1.567969, -0.432036, 1, 1, 1, 1, 1,
-0.6614257, 0.1779044, -1.282043, 1, 1, 1, 1, 1,
-0.6594751, 0.2480649, -1.527261, 1, 1, 1, 1, 1,
-0.6567827, 0.1526959, -1.272288, 1, 1, 1, 1, 1,
-0.6529413, -0.6662894, -1.55715, 0, 0, 1, 1, 1,
-0.6493695, 0.1227729, -3.017297, 1, 0, 0, 1, 1,
-0.6487359, 0.7386283, -0.9207651, 1, 0, 0, 1, 1,
-0.6449124, -0.1222296, -1.513752, 1, 0, 0, 1, 1,
-0.6383616, 0.5083861, -0.9848441, 1, 0, 0, 1, 1,
-0.6321868, 2.350052, 1.434613, 1, 0, 0, 1, 1,
-0.6289352, -0.4707772, -2.637201, 0, 0, 0, 1, 1,
-0.6259392, -1.330125, -1.855795, 0, 0, 0, 1, 1,
-0.6218975, -1.38235, -3.127004, 0, 0, 0, 1, 1,
-0.6184192, 0.3471037, -2.329416, 0, 0, 0, 1, 1,
-0.6158926, 0.2110038, 0.3430571, 0, 0, 0, 1, 1,
-0.609414, -0.16559, -3.008535, 0, 0, 0, 1, 1,
-0.6078665, -2.378783, -3.190454, 0, 0, 0, 1, 1,
-0.6069722, 0.6213535, -1.986318, 1, 1, 1, 1, 1,
-0.5972431, 0.378754, -1.216229, 1, 1, 1, 1, 1,
-0.5942711, 0.3261322, -1.610547, 1, 1, 1, 1, 1,
-0.5940081, -1.044626, -3.94878, 1, 1, 1, 1, 1,
-0.593271, 0.0702807, -0.8466492, 1, 1, 1, 1, 1,
-0.5926777, -1.541495, -2.633353, 1, 1, 1, 1, 1,
-0.5926214, 1.591337, -2.832587, 1, 1, 1, 1, 1,
-0.5923073, -2.278035, -2.422014, 1, 1, 1, 1, 1,
-0.5885208, -0.5294588, -0.123118, 1, 1, 1, 1, 1,
-0.5737099, -1.704362, -3.062808, 1, 1, 1, 1, 1,
-0.5637143, -0.01542072, -0.8899055, 1, 1, 1, 1, 1,
-0.5574073, -0.1394361, -3.387787, 1, 1, 1, 1, 1,
-0.5573918, 0.5343061, -1.667301, 1, 1, 1, 1, 1,
-0.5527204, -1.123622, -0.2224604, 1, 1, 1, 1, 1,
-0.549318, 0.1953843, 0.4119617, 1, 1, 1, 1, 1,
-0.5446001, -1.348144, -2.932759, 0, 0, 1, 1, 1,
-0.5442967, -2.104346, -3.004738, 1, 0, 0, 1, 1,
-0.539263, 0.2068047, -3.048012, 1, 0, 0, 1, 1,
-0.537926, 1.157356, -1.497709, 1, 0, 0, 1, 1,
-0.5342734, 1.948226, -0.2477183, 1, 0, 0, 1, 1,
-0.5323765, 0.3121651, -1.100316, 1, 0, 0, 1, 1,
-0.5313106, 2.976629, -0.05471577, 0, 0, 0, 1, 1,
-0.5290821, -0.02309735, -0.7891461, 0, 0, 0, 1, 1,
-0.5251067, -0.001714088, -1.399303, 0, 0, 0, 1, 1,
-0.5243549, -1.084202, -1.570061, 0, 0, 0, 1, 1,
-0.5199942, -0.7723997, -3.68008, 0, 0, 0, 1, 1,
-0.5151059, -1.729512, -2.667438, 0, 0, 0, 1, 1,
-0.5107083, -1.7879, -2.779057, 0, 0, 0, 1, 1,
-0.5043592, -0.8561648, -1.075278, 1, 1, 1, 1, 1,
-0.5026092, -0.04155906, -2.282829, 1, 1, 1, 1, 1,
-0.4991121, -0.5682757, -3.037898, 1, 1, 1, 1, 1,
-0.4983217, -0.5675439, -1.052901, 1, 1, 1, 1, 1,
-0.4966505, -1.070839, -4.20151, 1, 1, 1, 1, 1,
-0.4962486, 0.5405528, 0.3286406, 1, 1, 1, 1, 1,
-0.4956936, 0.8999167, -1.455146, 1, 1, 1, 1, 1,
-0.4890302, -0.1585327, -1.688738, 1, 1, 1, 1, 1,
-0.4884523, 0.2662583, -1.338471, 1, 1, 1, 1, 1,
-0.4864511, -0.486184, -3.502805, 1, 1, 1, 1, 1,
-0.4849534, -1.360126, -3.271379, 1, 1, 1, 1, 1,
-0.4829804, -0.2195473, -2.178363, 1, 1, 1, 1, 1,
-0.4821806, -0.2504095, -1.853124, 1, 1, 1, 1, 1,
-0.4813616, 0.2514902, -0.6424308, 1, 1, 1, 1, 1,
-0.476476, -1.20221, -4.682959, 1, 1, 1, 1, 1,
-0.4679779, -0.6906837, -2.255756, 0, 0, 1, 1, 1,
-0.4650328, 1.472832, 1.045327, 1, 0, 0, 1, 1,
-0.4639883, -0.9496921, -3.86609, 1, 0, 0, 1, 1,
-0.4639187, -0.3232138, -2.189282, 1, 0, 0, 1, 1,
-0.4609505, -0.6450517, -2.485717, 1, 0, 0, 1, 1,
-0.460745, -0.2836189, -1.10847, 1, 0, 0, 1, 1,
-0.4603314, 0.1412273, -2.224776, 0, 0, 0, 1, 1,
-0.4594317, 0.8555419, -2.459185, 0, 0, 0, 1, 1,
-0.4557266, -0.10146, -0.7032622, 0, 0, 0, 1, 1,
-0.4532472, -1.134508, -2.013052, 0, 0, 0, 1, 1,
-0.4522435, 1.339177, -0.42374, 0, 0, 0, 1, 1,
-0.4478624, 0.7658572, -0.7300891, 0, 0, 0, 1, 1,
-0.4451706, 1.275096, 0.39952, 0, 0, 0, 1, 1,
-0.444837, 0.6465589, -1.312743, 1, 1, 1, 1, 1,
-0.442179, 0.5014707, -0.4534303, 1, 1, 1, 1, 1,
-0.4384563, -0.867492, -1.019248, 1, 1, 1, 1, 1,
-0.437434, -0.2024254, -1.797636, 1, 1, 1, 1, 1,
-0.4353237, 0.1698465, -0.6016922, 1, 1, 1, 1, 1,
-0.4327117, 0.4956317, 0.8213686, 1, 1, 1, 1, 1,
-0.4298613, 0.02149359, -2.21089, 1, 1, 1, 1, 1,
-0.4240257, 0.5020624, 1.022999, 1, 1, 1, 1, 1,
-0.4240049, 0.6321707, -1.475499, 1, 1, 1, 1, 1,
-0.4113397, 0.0286801, -0.118073, 1, 1, 1, 1, 1,
-0.4020732, 0.9015461, 0.4360853, 1, 1, 1, 1, 1,
-0.4001766, -0.3098916, -1.313307, 1, 1, 1, 1, 1,
-0.3966883, 0.8473004, -0.3058837, 1, 1, 1, 1, 1,
-0.3880074, 1.351692, -0.5120346, 1, 1, 1, 1, 1,
-0.3825967, 1.286945, 0.5629638, 1, 1, 1, 1, 1,
-0.3822163, 0.6927834, -0.298902, 0, 0, 1, 1, 1,
-0.3808525, -0.5484018, -1.047347, 1, 0, 0, 1, 1,
-0.3807044, 1.04478, -0.6288953, 1, 0, 0, 1, 1,
-0.3738697, -0.3514954, -2.883964, 1, 0, 0, 1, 1,
-0.3721418, 0.4199656, 0.4419415, 1, 0, 0, 1, 1,
-0.3709999, -0.8709766, -3.836059, 1, 0, 0, 1, 1,
-0.3589575, 0.6689283, -0.6504299, 0, 0, 0, 1, 1,
-0.3589496, -0.6287302, -2.018178, 0, 0, 0, 1, 1,
-0.3565302, 0.9721119, -0.05061434, 0, 0, 0, 1, 1,
-0.3553391, 1.468845, -1.703606, 0, 0, 0, 1, 1,
-0.3515225, 0.2488051, -0.8828685, 0, 0, 0, 1, 1,
-0.347432, 1.41745, -1.017738, 0, 0, 0, 1, 1,
-0.3471577, -0.5094432, -2.348427, 0, 0, 0, 1, 1,
-0.3365707, 1.737702, 0.2677325, 1, 1, 1, 1, 1,
-0.3362539, -0.2655492, -1.672309, 1, 1, 1, 1, 1,
-0.3349673, 1.343432, -1.20288, 1, 1, 1, 1, 1,
-0.3349182, 0.5723978, -1.963176, 1, 1, 1, 1, 1,
-0.3290448, -0.4301198, -2.552874, 1, 1, 1, 1, 1,
-0.3289404, -0.9438678, -2.643886, 1, 1, 1, 1, 1,
-0.326642, -0.7145277, -2.121972, 1, 1, 1, 1, 1,
-0.3252482, -0.9489276, -3.104722, 1, 1, 1, 1, 1,
-0.3209671, 0.08724369, 0.1576427, 1, 1, 1, 1, 1,
-0.3200288, -0.1179996, -0.9608374, 1, 1, 1, 1, 1,
-0.319736, -1.06248, -2.266241, 1, 1, 1, 1, 1,
-0.3189554, 0.8649393, -0.3773626, 1, 1, 1, 1, 1,
-0.3187236, 1.026185, 1.175758, 1, 1, 1, 1, 1,
-0.3173955, 0.3328047, -0.9595588, 1, 1, 1, 1, 1,
-0.3120777, 0.05296504, -3.210649, 1, 1, 1, 1, 1,
-0.3119459, -0.7005084, -3.127596, 0, 0, 1, 1, 1,
-0.3117788, -0.07066246, -1.931191, 1, 0, 0, 1, 1,
-0.3068706, -0.3291953, -1.762851, 1, 0, 0, 1, 1,
-0.3061331, -2.308019, -3.667188, 1, 0, 0, 1, 1,
-0.2884654, 0.3456566, -1.563845, 1, 0, 0, 1, 1,
-0.2879186, -0.1379832, -1.491399, 1, 0, 0, 1, 1,
-0.2821388, 1.388394, -1.711092, 0, 0, 0, 1, 1,
-0.2805705, -1.065222, -2.026257, 0, 0, 0, 1, 1,
-0.2797555, 1.301581, -1.055747, 0, 0, 0, 1, 1,
-0.2772901, 0.2748406, -0.06230822, 0, 0, 0, 1, 1,
-0.2745726, 0.4505822, -0.1025172, 0, 0, 0, 1, 1,
-0.2740977, 0.900919, -2.570544, 0, 0, 0, 1, 1,
-0.2737271, -0.4316757, -2.513085, 0, 0, 0, 1, 1,
-0.2718888, 0.4745983, 0.4785434, 1, 1, 1, 1, 1,
-0.2698276, 1.966736, 2.317337, 1, 1, 1, 1, 1,
-0.2674432, 0.09326107, -1.276727, 1, 1, 1, 1, 1,
-0.266627, -0.07501331, -2.2271, 1, 1, 1, 1, 1,
-0.2662441, -0.9931517, -3.230655, 1, 1, 1, 1, 1,
-0.2640131, -1.850972, -2.78448, 1, 1, 1, 1, 1,
-0.2616371, 1.660639, -0.7487956, 1, 1, 1, 1, 1,
-0.2610151, -1.796136, -5.081618, 1, 1, 1, 1, 1,
-0.2580777, 0.3072957, -0.8339378, 1, 1, 1, 1, 1,
-0.2540177, 0.7559561, 0.1415742, 1, 1, 1, 1, 1,
-0.2532351, -0.6669668, -3.192534, 1, 1, 1, 1, 1,
-0.2526785, 0.4022991, -0.5986754, 1, 1, 1, 1, 1,
-0.250911, 0.7358758, -1.589891, 1, 1, 1, 1, 1,
-0.2508136, 0.4679176, -2.494904, 1, 1, 1, 1, 1,
-0.2423005, -0.04796066, -1.31967, 1, 1, 1, 1, 1,
-0.2420797, 0.7514423, -0.7179671, 0, 0, 1, 1, 1,
-0.2406397, -1.983515, -3.278731, 1, 0, 0, 1, 1,
-0.239832, -0.655154, -3.333317, 1, 0, 0, 1, 1,
-0.237185, 0.424682, 0.1186953, 1, 0, 0, 1, 1,
-0.2351537, 0.8677867, 0.6095382, 1, 0, 0, 1, 1,
-0.234038, 0.2621697, -1.298232, 1, 0, 0, 1, 1,
-0.2339054, 1.164335, -1.47987, 0, 0, 0, 1, 1,
-0.2309987, -0.629985, -3.635526, 0, 0, 0, 1, 1,
-0.2300524, -0.4898686, -1.723175, 0, 0, 0, 1, 1,
-0.2277668, -1.689883, -4.140162, 0, 0, 0, 1, 1,
-0.2260846, -1.313446, -2.771889, 0, 0, 0, 1, 1,
-0.2226335, -0.9336709, -3.404351, 0, 0, 0, 1, 1,
-0.2183509, -0.4961889, -3.912941, 0, 0, 0, 1, 1,
-0.2163938, 0.9816933, 0.7588533, 1, 1, 1, 1, 1,
-0.2161768, 0.6024736, 0.9626175, 1, 1, 1, 1, 1,
-0.2144206, 0.473316, -0.1299101, 1, 1, 1, 1, 1,
-0.2135805, -0.08356314, -1.60914, 1, 1, 1, 1, 1,
-0.2121495, -0.07391234, -2.587535, 1, 1, 1, 1, 1,
-0.211785, -0.5086331, -2.014732, 1, 1, 1, 1, 1,
-0.206891, 1.132835, -0.7961746, 1, 1, 1, 1, 1,
-0.2030607, -0.4039892, -3.034391, 1, 1, 1, 1, 1,
-0.2015819, 0.9511266, -1.519694, 1, 1, 1, 1, 1,
-0.20112, -0.2023696, -3.379841, 1, 1, 1, 1, 1,
-0.1999678, -0.5966146, -3.135879, 1, 1, 1, 1, 1,
-0.1982056, -0.3295139, -2.301811, 1, 1, 1, 1, 1,
-0.1962748, 0.1882338, -1.968791, 1, 1, 1, 1, 1,
-0.1917918, -0.2202501, -2.924389, 1, 1, 1, 1, 1,
-0.1877674, 1.032858, 0.3718887, 1, 1, 1, 1, 1,
-0.1845398, -1.395182, -4.794178, 0, 0, 1, 1, 1,
-0.18034, -0.4206557, -3.706578, 1, 0, 0, 1, 1,
-0.1776662, -1.213477, -4.204434, 1, 0, 0, 1, 1,
-0.1770543, 0.7957736, -0.8714421, 1, 0, 0, 1, 1,
-0.1744837, -0.49209, -1.733374, 1, 0, 0, 1, 1,
-0.1725442, 0.04234129, -2.703251, 1, 0, 0, 1, 1,
-0.1711325, 1.834993, -0.8096114, 0, 0, 0, 1, 1,
-0.1677863, -0.6623923, -3.413805, 0, 0, 0, 1, 1,
-0.1656016, 0.02491437, -1.594497, 0, 0, 0, 1, 1,
-0.1654551, 2.001547, 2.277952, 0, 0, 0, 1, 1,
-0.1637973, 1.894815, 0.6558694, 0, 0, 0, 1, 1,
-0.1633184, 0.8360943, -0.8810049, 0, 0, 0, 1, 1,
-0.1609288, 2.480441, -1.260038, 0, 0, 0, 1, 1,
-0.1531195, -0.6547332, -2.560833, 1, 1, 1, 1, 1,
-0.1425368, -1.03336, -4.665771, 1, 1, 1, 1, 1,
-0.1399464, 0.9313852, -0.8578469, 1, 1, 1, 1, 1,
-0.135192, 0.5305432, 0.08670348, 1, 1, 1, 1, 1,
-0.1338678, 1.319628, -1.081042, 1, 1, 1, 1, 1,
-0.1323819, -0.4913347, -0.984673, 1, 1, 1, 1, 1,
-0.1288124, 1.053114, 1.272593, 1, 1, 1, 1, 1,
-0.1184227, -1.156788, -3.511893, 1, 1, 1, 1, 1,
-0.1164315, -0.2348614, -2.039828, 1, 1, 1, 1, 1,
-0.1161039, 0.7706726, -0.09966703, 1, 1, 1, 1, 1,
-0.1138393, -0.06854887, -3.685766, 1, 1, 1, 1, 1,
-0.1136444, -0.1266697, -1.998368, 1, 1, 1, 1, 1,
-0.1112702, 1.214858, 1.134549, 1, 1, 1, 1, 1,
-0.1089444, 0.8960897, -0.2684757, 1, 1, 1, 1, 1,
-0.1051211, 1.543543, -0.1236557, 1, 1, 1, 1, 1,
-0.1025975, -0.9146075, -3.79755, 0, 0, 1, 1, 1,
-0.1020548, 0.01654974, -0.7942979, 1, 0, 0, 1, 1,
-0.0991751, -2.659143, -3.836702, 1, 0, 0, 1, 1,
-0.09286043, -2.06351, -0.9004182, 1, 0, 0, 1, 1,
-0.09066563, 0.1260875, -1.101462, 1, 0, 0, 1, 1,
-0.08561264, -1.115618, -2.241542, 1, 0, 0, 1, 1,
-0.08357169, 0.1486426, -2.194952, 0, 0, 0, 1, 1,
-0.08281302, 0.5710989, -0.8583452, 0, 0, 0, 1, 1,
-0.07858726, 0.4076285, -1.478268, 0, 0, 0, 1, 1,
-0.07659232, 0.03869662, -1.161291, 0, 0, 0, 1, 1,
-0.07234618, 1.509865, 0.6036485, 0, 0, 0, 1, 1,
-0.07194832, 0.03875954, -2.088138, 0, 0, 0, 1, 1,
-0.0677904, -1.187794, -2.913748, 0, 0, 0, 1, 1,
-0.06592717, -2.131098, -2.055511, 1, 1, 1, 1, 1,
-0.06384655, -0.4502802, -4.014201, 1, 1, 1, 1, 1,
-0.05993985, 0.3167348, -1.716269, 1, 1, 1, 1, 1,
-0.05821374, -0.01269849, -0.8799791, 1, 1, 1, 1, 1,
-0.05526792, -2.935143, -1.502313, 1, 1, 1, 1, 1,
-0.05393331, 0.7339572, 1.209611, 1, 1, 1, 1, 1,
-0.05064654, 1.041687, 0.9885144, 1, 1, 1, 1, 1,
-0.04881275, 0.758961, 1.202686, 1, 1, 1, 1, 1,
-0.04877933, 0.2341724, 0.8382106, 1, 1, 1, 1, 1,
-0.04739686, -1.710172, -3.536353, 1, 1, 1, 1, 1,
-0.04457857, 0.03275557, -1.625624, 1, 1, 1, 1, 1,
-0.04429672, -0.8001979, -3.374938, 1, 1, 1, 1, 1,
-0.04365729, 0.4704261, 0.1828754, 1, 1, 1, 1, 1,
-0.04304478, 0.1297734, -1.390379, 1, 1, 1, 1, 1,
-0.04093406, -0.4523933, -3.122599, 1, 1, 1, 1, 1,
-0.03244916, 0.09552554, 0.3567248, 0, 0, 1, 1, 1,
-0.02928793, -1.291749, -3.450081, 1, 0, 0, 1, 1,
-0.02892567, 0.453957, -0.5644367, 1, 0, 0, 1, 1,
-0.02772645, -1.759562, -4.906, 1, 0, 0, 1, 1,
-0.02769085, -1.595568, -2.71421, 1, 0, 0, 1, 1,
-0.02503296, -1.071984, -2.639144, 1, 0, 0, 1, 1,
-0.019894, 1.548479, 0.1316253, 0, 0, 0, 1, 1,
-0.01930029, 0.905516, -0.2330997, 0, 0, 0, 1, 1,
-0.01663956, -1.827279, -4.330037, 0, 0, 0, 1, 1,
-0.01482534, -0.139514, -3.413193, 0, 0, 0, 1, 1,
-0.0120277, 1.461429, -0.8178183, 0, 0, 0, 1, 1,
-0.01030427, 0.9161367, -0.3866321, 0, 0, 0, 1, 1,
-0.008701024, -0.282719, -1.897379, 0, 0, 0, 1, 1,
-0.002624889, -0.6384225, -3.809021, 1, 1, 1, 1, 1,
0.002961988, 1.103305, 2.334032, 1, 1, 1, 1, 1,
0.003133323, -1.756499, 2.207701, 1, 1, 1, 1, 1,
0.01272122, 1.149505, 0.4682984, 1, 1, 1, 1, 1,
0.01358682, 0.9361421, 0.2844864, 1, 1, 1, 1, 1,
0.01454838, -1.24453, 2.601317, 1, 1, 1, 1, 1,
0.02343441, -0.5113537, 3.371079, 1, 1, 1, 1, 1,
0.02412702, -1.436511, 2.465181, 1, 1, 1, 1, 1,
0.02614255, 0.8623135, -0.9825025, 1, 1, 1, 1, 1,
0.0356664, -0.8166109, 3.726846, 1, 1, 1, 1, 1,
0.03618679, -0.2472995, 3.802424, 1, 1, 1, 1, 1,
0.03695683, -0.1939509, 5.106386, 1, 1, 1, 1, 1,
0.04031616, -0.25584, 3.172108, 1, 1, 1, 1, 1,
0.04113452, -0.1422566, 1.269383, 1, 1, 1, 1, 1,
0.04501947, -0.2147287, 2.709928, 1, 1, 1, 1, 1,
0.0507646, -1.792508, 3.312833, 0, 0, 1, 1, 1,
0.05189168, -0.03154605, 1.740338, 1, 0, 0, 1, 1,
0.05422764, -0.06501947, 1.971359, 1, 0, 0, 1, 1,
0.05593883, -1.128313, 1.921314, 1, 0, 0, 1, 1,
0.05714221, -1.81605, 1.43574, 1, 0, 0, 1, 1,
0.05724146, -0.2325335, 3.40493, 1, 0, 0, 1, 1,
0.05905569, 0.909456, -0.8752677, 0, 0, 0, 1, 1,
0.06084307, -1.289312, 3.746472, 0, 0, 0, 1, 1,
0.06224528, 0.9309724, 0.4302782, 0, 0, 0, 1, 1,
0.06274252, 0.635078, 1.127031, 0, 0, 0, 1, 1,
0.06297106, 1.443355, -0.445956, 0, 0, 0, 1, 1,
0.06419861, -1.286943, 2.156436, 0, 0, 0, 1, 1,
0.06611791, 0.4167434, 0.08028014, 0, 0, 0, 1, 1,
0.06634109, -0.1504006, 3.76595, 1, 1, 1, 1, 1,
0.06657585, -1.619557, 2.948621, 1, 1, 1, 1, 1,
0.06687929, 0.3072572, 0.1432445, 1, 1, 1, 1, 1,
0.07305086, 0.2669612, 2.128589, 1, 1, 1, 1, 1,
0.07939459, 0.8353952, -0.7193945, 1, 1, 1, 1, 1,
0.08277243, 0.7228675, 0.1065338, 1, 1, 1, 1, 1,
0.08828314, 0.0695667, -0.4440777, 1, 1, 1, 1, 1,
0.08847281, -0.4973093, 4.402487, 1, 1, 1, 1, 1,
0.08945051, -0.02307356, 2.085658, 1, 1, 1, 1, 1,
0.08953097, 0.6743386, -0.07155135, 1, 1, 1, 1, 1,
0.09386497, 0.2726168, -0.570013, 1, 1, 1, 1, 1,
0.09437538, 0.5215592, -0.2518952, 1, 1, 1, 1, 1,
0.09916078, 2.406743, -1.534061, 1, 1, 1, 1, 1,
0.1010542, 1.770406, -2.16235, 1, 1, 1, 1, 1,
0.1014408, -0.3895027, 4.866833, 1, 1, 1, 1, 1,
0.10247, -1.390301, 2.494114, 0, 0, 1, 1, 1,
0.1042355, -0.3502529, 2.918499, 1, 0, 0, 1, 1,
0.1074236, -1.706544, 4.200068, 1, 0, 0, 1, 1,
0.1089234, -0.4316407, 3.381333, 1, 0, 0, 1, 1,
0.1094749, 0.8091657, 1.025516, 1, 0, 0, 1, 1,
0.1112165, -0.3771439, 2.062, 1, 0, 0, 1, 1,
0.1126865, 0.645575, 1.89009, 0, 0, 0, 1, 1,
0.1148856, 1.533763, 1.998018, 0, 0, 0, 1, 1,
0.1219647, -0.3219579, 4.66692, 0, 0, 0, 1, 1,
0.1245599, -0.3014737, 2.367668, 0, 0, 0, 1, 1,
0.1293893, 1.265229, 0.7266129, 0, 0, 0, 1, 1,
0.1335571, -0.525295, 2.909513, 0, 0, 0, 1, 1,
0.1346437, -0.7115965, 2.761582, 0, 0, 0, 1, 1,
0.1361164, -0.8808621, 2.356852, 1, 1, 1, 1, 1,
0.1388024, -1.222455, 4.01851, 1, 1, 1, 1, 1,
0.1424645, 0.4073604, 0.601423, 1, 1, 1, 1, 1,
0.1445735, 0.5425335, -0.6579511, 1, 1, 1, 1, 1,
0.151267, -2.799912, 4.105149, 1, 1, 1, 1, 1,
0.1543382, 1.672454, 0.6781866, 1, 1, 1, 1, 1,
0.1551098, -0.273139, 2.875984, 1, 1, 1, 1, 1,
0.1556405, -2.006163, 2.404681, 1, 1, 1, 1, 1,
0.160242, -0.1903546, 2.507389, 1, 1, 1, 1, 1,
0.1603162, 0.630673, 0.1263823, 1, 1, 1, 1, 1,
0.1650329, -0.3072181, 5.418251, 1, 1, 1, 1, 1,
0.1699535, 1.379886, -0.08128672, 1, 1, 1, 1, 1,
0.1718927, -1.16265, 3.730336, 1, 1, 1, 1, 1,
0.1755007, -1.016232, 3.414055, 1, 1, 1, 1, 1,
0.1759139, -1.826171, 2.98139, 1, 1, 1, 1, 1,
0.1762078, -2.114725, 3.350666, 0, 0, 1, 1, 1,
0.1781876, -0.8662806, 0.2840614, 1, 0, 0, 1, 1,
0.179023, 1.29994, 0.8561213, 1, 0, 0, 1, 1,
0.1840987, -1.102709, 2.850246, 1, 0, 0, 1, 1,
0.1864556, -2.489551, 2.832466, 1, 0, 0, 1, 1,
0.1881255, 1.897366, 0.9825695, 1, 0, 0, 1, 1,
0.1888389, 0.611272, 0.4600027, 0, 0, 0, 1, 1,
0.188941, 0.2175258, 0.4266846, 0, 0, 0, 1, 1,
0.1894448, -0.2556165, 2.826117, 0, 0, 0, 1, 1,
0.1916383, 0.8349372, -0.01647274, 0, 0, 0, 1, 1,
0.1935109, -1.29858, 2.619251, 0, 0, 0, 1, 1,
0.1961381, -0.07625378, 1.32363, 0, 0, 0, 1, 1,
0.2042366, 0.7458985, -1.49114, 0, 0, 0, 1, 1,
0.2064471, -0.8787754, 2.818614, 1, 1, 1, 1, 1,
0.2070473, -0.07231566, 1.370325, 1, 1, 1, 1, 1,
0.2125631, 0.4043978, 1.872512, 1, 1, 1, 1, 1,
0.2196966, 1.481997, 0.8623053, 1, 1, 1, 1, 1,
0.2217524, -0.3265516, 3.006166, 1, 1, 1, 1, 1,
0.2223962, 0.56877, -0.1557109, 1, 1, 1, 1, 1,
0.2224024, 1.944782, -0.5657513, 1, 1, 1, 1, 1,
0.2237364, -0.3791961, 3.261506, 1, 1, 1, 1, 1,
0.2244004, 0.09925106, 0.6456063, 1, 1, 1, 1, 1,
0.2256008, -0.4454192, 2.919779, 1, 1, 1, 1, 1,
0.2276186, -0.266571, 2.92453, 1, 1, 1, 1, 1,
0.2359618, 0.3676079, 0.8450439, 1, 1, 1, 1, 1,
0.2361608, 0.5330897, 1.33065, 1, 1, 1, 1, 1,
0.2413946, -1.298752, 3.510228, 1, 1, 1, 1, 1,
0.2461768, 0.5043601, 0.6896716, 1, 1, 1, 1, 1,
0.2491517, -0.1852138, 0.1729563, 0, 0, 1, 1, 1,
0.2505653, -1.759031, 3.281353, 1, 0, 0, 1, 1,
0.2535368, -1.3259, 2.834463, 1, 0, 0, 1, 1,
0.2597274, -0.4233091, 2.083822, 1, 0, 0, 1, 1,
0.2607076, 1.900426, -0.3451385, 1, 0, 0, 1, 1,
0.2610605, -0.5824962, 2.556031, 1, 0, 0, 1, 1,
0.2625614, 0.2642469, 0.4081433, 0, 0, 0, 1, 1,
0.2631643, 0.5134867, 0.8599128, 0, 0, 0, 1, 1,
0.2643184, 0.1873734, 0.08510574, 0, 0, 0, 1, 1,
0.2644565, -0.9439385, 1.643894, 0, 0, 0, 1, 1,
0.2715221, 1.177808, -0.818405, 0, 0, 0, 1, 1,
0.2732251, 0.04712029, 2.152512, 0, 0, 0, 1, 1,
0.2752137, 0.4979763, -0.7367892, 0, 0, 0, 1, 1,
0.2757188, -2.068282, 2.074966, 1, 1, 1, 1, 1,
0.2769549, -0.4671681, 1.942195, 1, 1, 1, 1, 1,
0.281964, 0.8017541, 1.17823, 1, 1, 1, 1, 1,
0.2822962, 0.4458297, 0.2276705, 1, 1, 1, 1, 1,
0.284481, -0.08379512, 3.077185, 1, 1, 1, 1, 1,
0.284676, 0.126546, 1.057417, 1, 1, 1, 1, 1,
0.2866626, -3.112285, 2.813714, 1, 1, 1, 1, 1,
0.286814, -1.407365, 2.652145, 1, 1, 1, 1, 1,
0.2888272, -0.5838581, 1.925506, 1, 1, 1, 1, 1,
0.2923496, -1.032285, 1.720971, 1, 1, 1, 1, 1,
0.292709, -0.8069401, 3.365808, 1, 1, 1, 1, 1,
0.3045919, -0.5852249, 2.470828, 1, 1, 1, 1, 1,
0.3071099, 0.4565024, 0.5280271, 1, 1, 1, 1, 1,
0.3099253, 0.7529979, -1.376552, 1, 1, 1, 1, 1,
0.3167602, -0.9330869, 1.726012, 1, 1, 1, 1, 1,
0.3194256, 0.3604181, 0.3903731, 0, 0, 1, 1, 1,
0.319566, -0.7344871, 5.20988, 1, 0, 0, 1, 1,
0.3302112, -0.374759, 1.80133, 1, 0, 0, 1, 1,
0.3332558, -0.4679104, 1.91054, 1, 0, 0, 1, 1,
0.3355479, -1.717473, 1.363892, 1, 0, 0, 1, 1,
0.3377088, 1.055098, -0.1962802, 1, 0, 0, 1, 1,
0.3384859, -0.8298209, 3.780256, 0, 0, 0, 1, 1,
0.3405608, 1.263637, -0.02777643, 0, 0, 0, 1, 1,
0.3491995, -0.2494157, 1.731773, 0, 0, 0, 1, 1,
0.3513405, -0.7858248, 3.162595, 0, 0, 0, 1, 1,
0.3562294, -0.9081884, 3.382069, 0, 0, 0, 1, 1,
0.3585103, 0.3001341, 2.558867, 0, 0, 0, 1, 1,
0.3667666, -1.069174, 2.03598, 0, 0, 0, 1, 1,
0.3805779, 0.4824343, 0.6780006, 1, 1, 1, 1, 1,
0.38106, 0.4144005, -0.2653727, 1, 1, 1, 1, 1,
0.3817028, 1.704696, 0.4788319, 1, 1, 1, 1, 1,
0.3831954, 0.3585905, 0.1098955, 1, 1, 1, 1, 1,
0.3832813, -1.374988, 2.859057, 1, 1, 1, 1, 1,
0.384622, -0.4505692, 2.729801, 1, 1, 1, 1, 1,
0.3865246, -1.01389, 3.535799, 1, 1, 1, 1, 1,
0.3875972, 0.05298627, 1.480885, 1, 1, 1, 1, 1,
0.3903313, -0.04854884, 3.084363, 1, 1, 1, 1, 1,
0.3910497, -0.3794281, 3.444415, 1, 1, 1, 1, 1,
0.3920531, 0.7410545, 1.220296, 1, 1, 1, 1, 1,
0.401681, 1.317782, -1.13101, 1, 1, 1, 1, 1,
0.4043256, 0.3659455, 0.230235, 1, 1, 1, 1, 1,
0.4067027, -0.8011618, 2.238081, 1, 1, 1, 1, 1,
0.4083759, -0.8805664, 2.665833, 1, 1, 1, 1, 1,
0.4136669, 1.125635, 2.472388, 0, 0, 1, 1, 1,
0.4163519, 0.335501, 0.1858134, 1, 0, 0, 1, 1,
0.4174796, 1.336736, 1.186193, 1, 0, 0, 1, 1,
0.4174998, -0.1093195, 1.795418, 1, 0, 0, 1, 1,
0.418824, 0.1264828, 1.078801, 1, 0, 0, 1, 1,
0.4208764, -0.338921, 1.06209, 1, 0, 0, 1, 1,
0.4249709, -0.005385816, 1.92705, 0, 0, 0, 1, 1,
0.4256305, -0.6177838, 2.549889, 0, 0, 0, 1, 1,
0.4256853, 0.221606, 1.566525, 0, 0, 0, 1, 1,
0.4260639, -1.003417, 4.495306, 0, 0, 0, 1, 1,
0.4358091, 0.975336, 2.22209, 0, 0, 0, 1, 1,
0.4374192, -0.6345046, 4.700996, 0, 0, 0, 1, 1,
0.4390865, -0.934058, 3.552598, 0, 0, 0, 1, 1,
0.4432964, -1.291302, 3.20894, 1, 1, 1, 1, 1,
0.4461905, -0.680073, 1.26599, 1, 1, 1, 1, 1,
0.4496619, -1.114895, 3.802785, 1, 1, 1, 1, 1,
0.4506246, -0.5442635, 3.315582, 1, 1, 1, 1, 1,
0.4530117, 0.7905035, 0.3415331, 1, 1, 1, 1, 1,
0.458086, 0.2314599, 0.2297798, 1, 1, 1, 1, 1,
0.4600374, -0.08733564, 1.881614, 1, 1, 1, 1, 1,
0.465409, 2.080266, 1.70771, 1, 1, 1, 1, 1,
0.466996, -1.699584, 3.774188, 1, 1, 1, 1, 1,
0.4691367, -0.1725751, 0.1441584, 1, 1, 1, 1, 1,
0.4827684, 0.06929334, 2.189189, 1, 1, 1, 1, 1,
0.4832447, -0.03388324, -0.718177, 1, 1, 1, 1, 1,
0.4835044, -1.441216, 0.7574847, 1, 1, 1, 1, 1,
0.4853112, -0.2341534, 2.882556, 1, 1, 1, 1, 1,
0.485424, -0.1823884, 1.35476, 1, 1, 1, 1, 1,
0.485683, -0.4939665, 1.197952, 0, 0, 1, 1, 1,
0.4927803, -1.220491, 2.563694, 1, 0, 0, 1, 1,
0.4937423, 1.099758, 0.5747957, 1, 0, 0, 1, 1,
0.502807, -1.239556, 2.342124, 1, 0, 0, 1, 1,
0.5054202, -0.08777355, 1.99515, 1, 0, 0, 1, 1,
0.5080919, 0.3127959, 1.150079, 1, 0, 0, 1, 1,
0.5133719, 0.02821712, 1.009783, 0, 0, 0, 1, 1,
0.5165985, 1.359748, 1.49878, 0, 0, 0, 1, 1,
0.5198565, 1.257224, -0.7378468, 0, 0, 0, 1, 1,
0.5206615, 2.466018, 0.3109502, 0, 0, 0, 1, 1,
0.5263718, 1.110042, 1.266261, 0, 0, 0, 1, 1,
0.5273737, -0.5357902, 2.701616, 0, 0, 0, 1, 1,
0.5318169, -0.7651956, 1.97758, 0, 0, 0, 1, 1,
0.5352331, 1.748256, 0.8617634, 1, 1, 1, 1, 1,
0.5370314, -0.86285, 1.653822, 1, 1, 1, 1, 1,
0.5371758, -0.1923591, 1.666844, 1, 1, 1, 1, 1,
0.5373841, -0.3574256, 0.1029264, 1, 1, 1, 1, 1,
0.5451986, -0.05880094, 2.972301, 1, 1, 1, 1, 1,
0.5455782, 0.06265897, 0.66412, 1, 1, 1, 1, 1,
0.5458521, 0.6049559, 3.32669, 1, 1, 1, 1, 1,
0.5489481, 0.1769997, 2.326759, 1, 1, 1, 1, 1,
0.5517411, 1.694571, 1.185204, 1, 1, 1, 1, 1,
0.5554846, 0.4001843, 0.6954483, 1, 1, 1, 1, 1,
0.556524, 0.9146791, -0.0964964, 1, 1, 1, 1, 1,
0.5569083, -0.06303101, 1.660995, 1, 1, 1, 1, 1,
0.5569938, 0.1960464, 2.376988, 1, 1, 1, 1, 1,
0.5607343, -0.5508787, 3.705614, 1, 1, 1, 1, 1,
0.5622556, 0.4996371, -1.21093, 1, 1, 1, 1, 1,
0.5638246, 0.9458883, 1.198641, 0, 0, 1, 1, 1,
0.564018, 1.207852, 1.517455, 1, 0, 0, 1, 1,
0.5769416, -0.81311, 4.382991, 1, 0, 0, 1, 1,
0.5785238, -0.5163663, 3.4661, 1, 0, 0, 1, 1,
0.5793558, 0.6057143, 0.934966, 1, 0, 0, 1, 1,
0.5812344, 1.131011, 0.36295, 1, 0, 0, 1, 1,
0.5885867, -0.8709923, 3.699418, 0, 0, 0, 1, 1,
0.5893236, 0.01933238, 2.019279, 0, 0, 0, 1, 1,
0.5904436, -0.4443459, -0.6325697, 0, 0, 0, 1, 1,
0.5906734, 0.1717777, 1.584608, 0, 0, 0, 1, 1,
0.5929947, 0.232426, 1.69473, 0, 0, 0, 1, 1,
0.6002313, -0.6676185, 2.822636, 0, 0, 0, 1, 1,
0.6050645, -0.9422132, 1.826777, 0, 0, 0, 1, 1,
0.6102649, 0.9572912, -1.167206, 1, 1, 1, 1, 1,
0.6132092, -1.168488, 3.374852, 1, 1, 1, 1, 1,
0.6142173, 0.2150695, -2.625469, 1, 1, 1, 1, 1,
0.614792, -1.585276, 1.566627, 1, 1, 1, 1, 1,
0.6168262, 0.2329167, 1.149252, 1, 1, 1, 1, 1,
0.6200238, 0.5843407, -0.7867069, 1, 1, 1, 1, 1,
0.6240594, -0.329645, 3.125444, 1, 1, 1, 1, 1,
0.6242687, 0.4782799, -0.5681211, 1, 1, 1, 1, 1,
0.6274384, -0.7967898, 1.597391, 1, 1, 1, 1, 1,
0.6285435, 1.478104, -0.02775434, 1, 1, 1, 1, 1,
0.6304693, -1.265883, 3.948287, 1, 1, 1, 1, 1,
0.6331044, 0.997206, -0.5833077, 1, 1, 1, 1, 1,
0.6332382, -0.09507713, 1.990768, 1, 1, 1, 1, 1,
0.6347286, 1.378412, 1.957962, 1, 1, 1, 1, 1,
0.635103, 0.287311, 2.713828, 1, 1, 1, 1, 1,
0.6360596, 0.1679726, 3.446226, 0, 0, 1, 1, 1,
0.6379635, -1.306216, 1.907054, 1, 0, 0, 1, 1,
0.6424278, 0.8773252, -0.1961966, 1, 0, 0, 1, 1,
0.6425945, -0.7984381, -0.4951427, 1, 0, 0, 1, 1,
0.6453432, 0.03404886, 2.064993, 1, 0, 0, 1, 1,
0.6480063, -0.2784909, 0.3081745, 1, 0, 0, 1, 1,
0.6521261, -0.6208511, 2.306949, 0, 0, 0, 1, 1,
0.6549346, -0.580827, 2.871953, 0, 0, 0, 1, 1,
0.6594341, 2.299217, -1.525155, 0, 0, 0, 1, 1,
0.6608251, -1.23094, 4.53004, 0, 0, 0, 1, 1,
0.6677756, 1.804328, -1.234705, 0, 0, 0, 1, 1,
0.6745429, 0.768938, 0.222354, 0, 0, 0, 1, 1,
0.676308, -0.7292222, 1.711194, 0, 0, 0, 1, 1,
0.6767581, -0.375955, 1.817393, 1, 1, 1, 1, 1,
0.6787453, 0.9092707, 0.9695253, 1, 1, 1, 1, 1,
0.6791707, 0.5191539, 0.3454674, 1, 1, 1, 1, 1,
0.6824598, 0.5905098, 1.863126, 1, 1, 1, 1, 1,
0.6868423, 0.03558564, 1.818904, 1, 1, 1, 1, 1,
0.6891539, 0.7045895, 1.031676, 1, 1, 1, 1, 1,
0.6896845, 1.375393, -0.2450137, 1, 1, 1, 1, 1,
0.692932, 0.6714138, -0.6924383, 1, 1, 1, 1, 1,
0.697139, -1.161214, 3.178632, 1, 1, 1, 1, 1,
0.6998497, -1.971404, 4.18839, 1, 1, 1, 1, 1,
0.7030761, 0.7787086, -1.652398, 1, 1, 1, 1, 1,
0.7057375, -0.5072706, 3.619499, 1, 1, 1, 1, 1,
0.7099728, 0.4383928, 1.761985, 1, 1, 1, 1, 1,
0.7113988, 0.5112898, -0.5509734, 1, 1, 1, 1, 1,
0.7132362, -0.7346363, 1.341289, 1, 1, 1, 1, 1,
0.7133188, 0.3156278, 0.08646492, 0, 0, 1, 1, 1,
0.7138757, 2.572443, 0.6310398, 1, 0, 0, 1, 1,
0.71606, 1.449853, -0.801941, 1, 0, 0, 1, 1,
0.7185826, -1.491774, 3.825242, 1, 0, 0, 1, 1,
0.7311815, -0.2294446, 2.738626, 1, 0, 0, 1, 1,
0.7323634, -0.1342703, 0.9483148, 1, 0, 0, 1, 1,
0.7329189, -1.131781, 1.87802, 0, 0, 0, 1, 1,
0.7396764, 0.2412476, 0.8074226, 0, 0, 0, 1, 1,
0.7434648, 0.810339, 0.6752801, 0, 0, 0, 1, 1,
0.7523533, 0.6197266, 0.2810026, 0, 0, 0, 1, 1,
0.7558645, -0.01772262, 0.6063864, 0, 0, 0, 1, 1,
0.7578056, -0.6040087, 0.9456922, 0, 0, 0, 1, 1,
0.7653558, 0.1292204, 2.924892, 0, 0, 0, 1, 1,
0.7663893, -1.766913, 1.993667, 1, 1, 1, 1, 1,
0.7751127, -0.9390804, 2.51367, 1, 1, 1, 1, 1,
0.7798432, 0.3834333, 2.421219, 1, 1, 1, 1, 1,
0.7829111, 1.088075, 0.655828, 1, 1, 1, 1, 1,
0.7854991, -0.6042001, 2.323023, 1, 1, 1, 1, 1,
0.7857097, -1.252967, 5.170602, 1, 1, 1, 1, 1,
0.7904781, 2.058097, -0.6028391, 1, 1, 1, 1, 1,
0.7935873, -1.021654, 2.732402, 1, 1, 1, 1, 1,
0.7943819, 0.9864568, 0.3825064, 1, 1, 1, 1, 1,
0.7978441, 0.1094492, 2.296604, 1, 1, 1, 1, 1,
0.7984738, -1.343729, 1.597127, 1, 1, 1, 1, 1,
0.8057451, 0.04788008, 0.6806383, 1, 1, 1, 1, 1,
0.8073919, 0.3571811, 0.9189496, 1, 1, 1, 1, 1,
0.8084581, 0.8209288, 1.308008, 1, 1, 1, 1, 1,
0.8137712, -0.4032157, 2.541276, 1, 1, 1, 1, 1,
0.8177094, 0.2236753, 2.143014, 0, 0, 1, 1, 1,
0.8207862, 1.754838, 0.1011206, 1, 0, 0, 1, 1,
0.825213, -0.9143867, 3.593267, 1, 0, 0, 1, 1,
0.8294431, -0.5877141, 1.874481, 1, 0, 0, 1, 1,
0.8330628, -1.166382, 1.396429, 1, 0, 0, 1, 1,
0.8361927, 0.2681363, -0.2967331, 1, 0, 0, 1, 1,
0.8363646, 0.570991, 2.490265, 0, 0, 0, 1, 1,
0.8430958, 0.6292692, 2.559329, 0, 0, 0, 1, 1,
0.8433744, -0.03370965, 1.260928, 0, 0, 0, 1, 1,
0.8494164, 0.5614253, 1.642497, 0, 0, 0, 1, 1,
0.8529422, 1.844592, -1.305906, 0, 0, 0, 1, 1,
0.8531682, 1.557205, 1.37705, 0, 0, 0, 1, 1,
0.8544742, 0.08745124, 0.1324763, 0, 0, 0, 1, 1,
0.8557541, 2.289674, 0.2785775, 1, 1, 1, 1, 1,
0.8571752, -0.001054839, 1.04618, 1, 1, 1, 1, 1,
0.8644049, 0.2175589, 1.537611, 1, 1, 1, 1, 1,
0.8740162, -0.04367238, 3.313896, 1, 1, 1, 1, 1,
0.8796999, 0.9326034, -0.09414648, 1, 1, 1, 1, 1,
0.8806381, -0.4005095, 3.758831, 1, 1, 1, 1, 1,
0.8820747, -1.872692, 2.948144, 1, 1, 1, 1, 1,
0.8838728, 0.1058258, 0.8752245, 1, 1, 1, 1, 1,
0.886138, 0.635356, -0.01858981, 1, 1, 1, 1, 1,
0.8877817, -0.1860627, 2.804745, 1, 1, 1, 1, 1,
0.8885316, 0.908192, 1.233356, 1, 1, 1, 1, 1,
0.889691, -0.9629033, 2.175682, 1, 1, 1, 1, 1,
0.8905954, -0.4276496, 2.630249, 1, 1, 1, 1, 1,
0.894065, 0.7667081, 2.11345, 1, 1, 1, 1, 1,
0.896066, -1.302875, 2.033184, 1, 1, 1, 1, 1,
0.899136, -0.4014089, 1.700604, 0, 0, 1, 1, 1,
0.8997929, -1.499965, 2.047465, 1, 0, 0, 1, 1,
0.9040799, -0.2815908, 2.047065, 1, 0, 0, 1, 1,
0.9058455, 1.018883, 3.678093, 1, 0, 0, 1, 1,
0.9082379, 0.3045156, 1.183282, 1, 0, 0, 1, 1,
0.9119837, -0.9752988, 2.879485, 1, 0, 0, 1, 1,
0.917402, -0.1225972, -0.3378199, 0, 0, 0, 1, 1,
0.9181852, 0.9240556, -0.4292794, 0, 0, 0, 1, 1,
0.9258865, -0.7502765, 0.3235696, 0, 0, 0, 1, 1,
0.9270976, -0.598731, 3.076395, 0, 0, 0, 1, 1,
0.9285497, -0.02345791, 2.180696, 0, 0, 0, 1, 1,
0.9294547, -1.55293, 1.925979, 0, 0, 0, 1, 1,
0.9295956, -2.040403, 2.118761, 0, 0, 0, 1, 1,
0.9304258, -1.277341, 4.635919, 1, 1, 1, 1, 1,
0.931482, -0.7101411, 0.4222922, 1, 1, 1, 1, 1,
0.9366019, 1.294019, -0.04938714, 1, 1, 1, 1, 1,
0.9387081, -0.1160385, 0.09838551, 1, 1, 1, 1, 1,
0.9458137, 0.3088293, 2.445314, 1, 1, 1, 1, 1,
0.9499347, -1.939409, 4.114896, 1, 1, 1, 1, 1,
0.9542891, -0.0998324, 1.194391, 1, 1, 1, 1, 1,
0.9543265, -0.522009, 3.128928, 1, 1, 1, 1, 1,
0.9573893, -0.7328575, 0.3356281, 1, 1, 1, 1, 1,
0.9654322, -2.013087, 2.275106, 1, 1, 1, 1, 1,
0.965916, -0.05779576, 1.617512, 1, 1, 1, 1, 1,
0.9706687, -0.008863075, -0.4034657, 1, 1, 1, 1, 1,
0.9723589, -1.044723, 0.6688927, 1, 1, 1, 1, 1,
0.9727719, 1.671432, -0.6947472, 1, 1, 1, 1, 1,
0.9778314, -1.027978, 4.476503, 1, 1, 1, 1, 1,
0.9866683, 0.7903569, -1.284096, 0, 0, 1, 1, 1,
0.9887027, -0.6193182, 1.702502, 1, 0, 0, 1, 1,
0.9897738, 0.0625697, 0.750362, 1, 0, 0, 1, 1,
1.005092, -0.7243535, 3.529652, 1, 0, 0, 1, 1,
1.010724, -0.3269569, 1.249646, 1, 0, 0, 1, 1,
1.016045, 0.8348389, 1.286775, 1, 0, 0, 1, 1,
1.019286, -2.722779, 4.135637, 0, 0, 0, 1, 1,
1.022697, 0.1474767, 1.800789, 0, 0, 0, 1, 1,
1.029442, 0.1009183, 3.002862, 0, 0, 0, 1, 1,
1.037697, -0.1483682, 0.9331588, 0, 0, 0, 1, 1,
1.040121, -0.9326566, 1.655914, 0, 0, 0, 1, 1,
1.044661, -1.78139, 2.818545, 0, 0, 0, 1, 1,
1.04674, 0.7488173, 1.200987, 0, 0, 0, 1, 1,
1.049076, -0.3504775, 1.533998, 1, 1, 1, 1, 1,
1.061588, 0.2360994, 1.685844, 1, 1, 1, 1, 1,
1.069189, 0.5085663, 1.572085, 1, 1, 1, 1, 1,
1.072586, 1.119721, -0.1244936, 1, 1, 1, 1, 1,
1.080658, 0.7024285, 2.079677, 1, 1, 1, 1, 1,
1.085011, 0.9822425, 0.3945972, 1, 1, 1, 1, 1,
1.088259, 0.8227593, 0.2545859, 1, 1, 1, 1, 1,
1.105687, 1.689598, -0.2192083, 1, 1, 1, 1, 1,
1.109037, -2.786874, 2.187406, 1, 1, 1, 1, 1,
1.119207, 0.6455429, 0.7837537, 1, 1, 1, 1, 1,
1.130923, 0.8297087, 0.9573252, 1, 1, 1, 1, 1,
1.142677, -0.6032692, 1.980541, 1, 1, 1, 1, 1,
1.154706, 1.720389, 0.08395346, 1, 1, 1, 1, 1,
1.172894, 2.100052, -0.9323514, 1, 1, 1, 1, 1,
1.179363, 0.1331203, 2.064556, 1, 1, 1, 1, 1,
1.189497, -0.3979935, 1.431481, 0, 0, 1, 1, 1,
1.20083, -0.5832038, 1.961003, 1, 0, 0, 1, 1,
1.201526, -0.1601363, 0.9853597, 1, 0, 0, 1, 1,
1.203261, -0.4011397, 1.909839, 1, 0, 0, 1, 1,
1.206024, 0.01356139, 0.2263375, 1, 0, 0, 1, 1,
1.228641, -0.8587984, 3.06466, 1, 0, 0, 1, 1,
1.232256, -1.047832, 2.802957, 0, 0, 0, 1, 1,
1.237983, 1.846087, 0.02103568, 0, 0, 0, 1, 1,
1.239996, 0.8481442, 2.031201, 0, 0, 0, 1, 1,
1.240429, -0.9152231, 3.05794, 0, 0, 0, 1, 1,
1.249651, 0.5694936, 1.613674, 0, 0, 0, 1, 1,
1.250088, 1.130953, 1.238692, 0, 0, 0, 1, 1,
1.252035, -0.4759732, 0.140188, 0, 0, 0, 1, 1,
1.258364, -0.5999358, 2.132327, 1, 1, 1, 1, 1,
1.259616, -0.2534904, 1.318926, 1, 1, 1, 1, 1,
1.265646, -1.394064, 2.746221, 1, 1, 1, 1, 1,
1.26814, -0.3800903, -0.06948217, 1, 1, 1, 1, 1,
1.274624, 1.277359, 0.8068976, 1, 1, 1, 1, 1,
1.276094, -0.1717194, 0.9953108, 1, 1, 1, 1, 1,
1.277032, 0.1732057, 3.688017, 1, 1, 1, 1, 1,
1.285945, 1.365687, 0.6781257, 1, 1, 1, 1, 1,
1.290112, 0.1832182, 0.5751759, 1, 1, 1, 1, 1,
1.290377, 0.2150047, 2.596933, 1, 1, 1, 1, 1,
1.291915, -0.05863962, 1.052845, 1, 1, 1, 1, 1,
1.299153, 0.3741021, 1.323282, 1, 1, 1, 1, 1,
1.301669, 1.085795, 1.299664, 1, 1, 1, 1, 1,
1.30472, -0.06038208, 2.252653, 1, 1, 1, 1, 1,
1.306305, -0.5386364, 3.409904, 1, 1, 1, 1, 1,
1.310495, 0.08773257, 2.043776, 0, 0, 1, 1, 1,
1.314469, 0.5640801, 2.14417, 1, 0, 0, 1, 1,
1.318636, -2.380622, 2.844212, 1, 0, 0, 1, 1,
1.324983, -0.4048252, 2.386058, 1, 0, 0, 1, 1,
1.325753, 0.7816604, 0.6500915, 1, 0, 0, 1, 1,
1.333712, 1.036379, -0.01430457, 1, 0, 0, 1, 1,
1.337692, 1.516257, 1.01491, 0, 0, 0, 1, 1,
1.34539, -1.092902, 1.436776, 0, 0, 0, 1, 1,
1.364719, 0.8153766, 1.157415, 0, 0, 0, 1, 1,
1.37148, -1.824398, 2.311675, 0, 0, 0, 1, 1,
1.388385, 0.040268, 1.188843, 0, 0, 0, 1, 1,
1.392633, -1.330551, 1.18475, 0, 0, 0, 1, 1,
1.393748, -0.1413156, 1.792621, 0, 0, 0, 1, 1,
1.3943, -0.1329472, 1.038993, 1, 1, 1, 1, 1,
1.398487, -0.9297781, 3.255513, 1, 1, 1, 1, 1,
1.399207, 0.9733108, 1.035872, 1, 1, 1, 1, 1,
1.406785, -1.251197, 1.865791, 1, 1, 1, 1, 1,
1.409201, 0.3241425, -0.5832006, 1, 1, 1, 1, 1,
1.412775, -0.07622375, 0.1464147, 1, 1, 1, 1, 1,
1.414642, 0.7244718, 0.02169752, 1, 1, 1, 1, 1,
1.415376, -2.395473, 0.5237786, 1, 1, 1, 1, 1,
1.417297, -0.4658578, 1.881986, 1, 1, 1, 1, 1,
1.420746, -1.320842, 0.5581125, 1, 1, 1, 1, 1,
1.438932, -0.2893906, 1.942598, 1, 1, 1, 1, 1,
1.444743, 0.9112262, 1.696948, 1, 1, 1, 1, 1,
1.45835, 0.985769, 0.8562147, 1, 1, 1, 1, 1,
1.475438, -0.5726455, 2.097059, 1, 1, 1, 1, 1,
1.477105, -1.412754, 2.578675, 1, 1, 1, 1, 1,
1.493423, -0.4749201, 0.5015796, 0, 0, 1, 1, 1,
1.513858, -1.849993, 1.82582, 1, 0, 0, 1, 1,
1.51395, 0.5545058, 1.201471, 1, 0, 0, 1, 1,
1.520375, -0.7776459, 1.148533, 1, 0, 0, 1, 1,
1.522073, -1.010769, 1.125396, 1, 0, 0, 1, 1,
1.533955, 0.735791, 0.1381417, 1, 0, 0, 1, 1,
1.540178, 0.02050746, 2.254449, 0, 0, 0, 1, 1,
1.554045, 1.067887, -0.1979056, 0, 0, 0, 1, 1,
1.554563, -0.9616156, 1.130129, 0, 0, 0, 1, 1,
1.575414, -0.4230266, 2.019799, 0, 0, 0, 1, 1,
1.584355, 0.2106948, 0.9917501, 0, 0, 0, 1, 1,
1.58734, 1.208697, 1.54605, 0, 0, 0, 1, 1,
1.59769, -1.090023, 2.279276, 0, 0, 0, 1, 1,
1.602581, 1.529029, 0.09274907, 1, 1, 1, 1, 1,
1.622918, -1.589523, 2.589925, 1, 1, 1, 1, 1,
1.639362, 0.8023673, 1.757858, 1, 1, 1, 1, 1,
1.64391, -0.2958252, 1.192073, 1, 1, 1, 1, 1,
1.65328, 0.550545, -0.1155168, 1, 1, 1, 1, 1,
1.65428, 1.107971, 0.3000817, 1, 1, 1, 1, 1,
1.655401, -0.01701876, 0.7734672, 1, 1, 1, 1, 1,
1.658992, -3.075575, 2.212529, 1, 1, 1, 1, 1,
1.659933, -0.2242738, 2.482607, 1, 1, 1, 1, 1,
1.691656, -1.209578, 3.446984, 1, 1, 1, 1, 1,
1.693274, 2.805842, 0.1460478, 1, 1, 1, 1, 1,
1.703764, -1.120979, 1.663874, 1, 1, 1, 1, 1,
1.708658, 0.08907064, 1.481345, 1, 1, 1, 1, 1,
1.718284, -0.5243208, 1.523176, 1, 1, 1, 1, 1,
1.734344, -0.5466987, 1.138152, 1, 1, 1, 1, 1,
1.750252, 0.6720089, 2.131691, 0, 0, 1, 1, 1,
1.752246, -0.7973008, 1.45256, 1, 0, 0, 1, 1,
1.758341, -1.067818, 2.178079, 1, 0, 0, 1, 1,
1.760131, 0.9172678, 1.804999, 1, 0, 0, 1, 1,
1.772658, -0.4766758, 2.916423, 1, 0, 0, 1, 1,
1.800127, 0.5701343, 1.386051, 1, 0, 0, 1, 1,
1.807641, -1.290362, 1.638217, 0, 0, 0, 1, 1,
1.813726, 1.785105, -0.1398003, 0, 0, 0, 1, 1,
1.824607, -1.424378, -0.09667164, 0, 0, 0, 1, 1,
1.828296, 0.7352307, 0.6154145, 0, 0, 0, 1, 1,
1.829563, 1.257822, 1.21756, 0, 0, 0, 1, 1,
1.847179, 0.01787396, 0.4918113, 0, 0, 0, 1, 1,
1.84741, 0.9539479, 2.251044, 0, 0, 0, 1, 1,
1.850617, -0.002311315, 2.822337, 1, 1, 1, 1, 1,
1.867069, -1.124352, 3.406596, 1, 1, 1, 1, 1,
1.877514, -1.92256, 1.938228, 1, 1, 1, 1, 1,
1.878984, -0.1616745, 0.9181721, 1, 1, 1, 1, 1,
1.884533, 1.592606, -0.07853408, 1, 1, 1, 1, 1,
1.896895, -0.8478411, 1.271064, 1, 1, 1, 1, 1,
1.901861, -1.006747, 2.956685, 1, 1, 1, 1, 1,
1.909899, 1.299473, 1.826138, 1, 1, 1, 1, 1,
1.911431, -0.9198381, 0.914224, 1, 1, 1, 1, 1,
1.924443, 0.5163845, 1.082316, 1, 1, 1, 1, 1,
1.947878, -2.474251, 4.061353, 1, 1, 1, 1, 1,
1.949336, -1.870163, 2.972038, 1, 1, 1, 1, 1,
1.95199, 1.65208, 1.945493, 1, 1, 1, 1, 1,
1.953001, -0.3812235, 1.202087, 1, 1, 1, 1, 1,
2.005407, 0.3779913, 2.374504, 1, 1, 1, 1, 1,
2.016833, 1.412234, 1.714463, 0, 0, 1, 1, 1,
2.055569, -0.4574718, 1.49584, 1, 0, 0, 1, 1,
2.062326, -0.3530338, 2.031028, 1, 0, 0, 1, 1,
2.097585, -0.7108727, 2.546194, 1, 0, 0, 1, 1,
2.195904, -1.143252, 2.400034, 1, 0, 0, 1, 1,
2.214297, 0.7793982, 0.9939087, 1, 0, 0, 1, 1,
2.247446, -0.3278979, 2.677498, 0, 0, 0, 1, 1,
2.267817, 0.4915852, 1.300807, 0, 0, 0, 1, 1,
2.281123, -2.938679, 0.6442855, 0, 0, 0, 1, 1,
2.299684, -0.7083884, 1.857571, 0, 0, 0, 1, 1,
2.359349, 1.864415, 1.96887, 0, 0, 0, 1, 1,
2.40983, -0.9804466, 2.979388, 0, 0, 0, 1, 1,
2.478498, 2.242041, 0.2754046, 0, 0, 0, 1, 1,
2.504901, 0.03153623, 1.474176, 1, 1, 1, 1, 1,
2.561902, -0.3016523, 1.19056, 1, 1, 1, 1, 1,
2.633919, 1.993855, 1.62456, 1, 1, 1, 1, 1,
2.711925, -0.6753499, 3.114391, 1, 1, 1, 1, 1,
2.747889, 0.6468759, -0.6348059, 1, 1, 1, 1, 1,
2.772607, 1.360517, 0.6603726, 1, 1, 1, 1, 1,
2.785001, -0.2581313, 1.1562, 1, 1, 1, 1, 1
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
var radius = 9.541891;
var distance = 33.51549;
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
mvMatrix.translate( 0.1373003, 0.1509337, 0.1258147 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.51549);
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
