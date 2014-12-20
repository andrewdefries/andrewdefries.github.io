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
-3.673002, -0.1034152, -2.088676, 1, 0, 0, 1,
-3.113151, -1.035412, -0.6052661, 1, 0.007843138, 0, 1,
-2.992001, 0.2121103, -2.800059, 1, 0.01176471, 0, 1,
-2.789751, 1.098374, -2.914326, 1, 0.01960784, 0, 1,
-2.72133, 1.241895, -1.021597, 1, 0.02352941, 0, 1,
-2.684153, -0.1031981, -1.499485, 1, 0.03137255, 0, 1,
-2.640778, 0.7706099, -0.4645256, 1, 0.03529412, 0, 1,
-2.600639, 1.132405, -0.9106105, 1, 0.04313726, 0, 1,
-2.579675, 1.022824, -2.612561, 1, 0.04705882, 0, 1,
-2.574335, -0.5934719, -1.998005, 1, 0.05490196, 0, 1,
-2.451849, -1.121243, -1.653512, 1, 0.05882353, 0, 1,
-2.435321, 0.9064645, -0.4929098, 1, 0.06666667, 0, 1,
-2.407343, -0.5213408, -2.224446, 1, 0.07058824, 0, 1,
-2.366838, -0.9729566, -0.5013903, 1, 0.07843138, 0, 1,
-2.347021, -0.2292759, -3.656808, 1, 0.08235294, 0, 1,
-2.315754, 1.023271, 0.4354397, 1, 0.09019608, 0, 1,
-2.315634, 1.346834, -0.04586134, 1, 0.09411765, 0, 1,
-2.302111, -0.5927822, -1.922272, 1, 0.1019608, 0, 1,
-2.287083, -0.1459901, -1.699037, 1, 0.1098039, 0, 1,
-2.27285, -0.2565117, -1.57131, 1, 0.1137255, 0, 1,
-2.13594, -0.1726722, -0.5533487, 1, 0.1215686, 0, 1,
-2.132537, -0.555353, -1.172842, 1, 0.1254902, 0, 1,
-2.117044, 0.8861473, -1.647983, 1, 0.1333333, 0, 1,
-2.114971, 1.585081, -2.011808, 1, 0.1372549, 0, 1,
-2.10089, -0.1304349, -1.131237, 1, 0.145098, 0, 1,
-2.092605, -0.3141035, -1.05047, 1, 0.1490196, 0, 1,
-2.083904, 1.173745, -1.900445, 1, 0.1568628, 0, 1,
-2.064789, -0.03140261, -2.183189, 1, 0.1607843, 0, 1,
-2.060544, -2.233005, -3.139639, 1, 0.1686275, 0, 1,
-2.031463, 0.0998556, -1.023814, 1, 0.172549, 0, 1,
-2.01245, -0.835228, -2.48877, 1, 0.1803922, 0, 1,
-1.999986, -1.807745, -5.278134, 1, 0.1843137, 0, 1,
-1.980096, -0.599998, -2.1592, 1, 0.1921569, 0, 1,
-1.972617, 0.003962994, -2.262032, 1, 0.1960784, 0, 1,
-1.954309, -0.7048921, -3.106411, 1, 0.2039216, 0, 1,
-1.934425, 0.491171, -2.960812, 1, 0.2117647, 0, 1,
-1.917088, -1.043685, 0.9185399, 1, 0.2156863, 0, 1,
-1.90439, -0.7579995, -1.852897, 1, 0.2235294, 0, 1,
-1.893268, 0.6637637, -1.989379, 1, 0.227451, 0, 1,
-1.892456, -0.7296174, -2.773128, 1, 0.2352941, 0, 1,
-1.890734, 0.8229938, -0.4570701, 1, 0.2392157, 0, 1,
-1.88796, -1.092439, -2.860119, 1, 0.2470588, 0, 1,
-1.882589, 0.3226207, 0.6585706, 1, 0.2509804, 0, 1,
-1.876497, -0.09175858, -1.122929, 1, 0.2588235, 0, 1,
-1.871202, -0.8257686, -2.235096, 1, 0.2627451, 0, 1,
-1.86149, -1.194953, -0.1846458, 1, 0.2705882, 0, 1,
-1.856187, 0.992408, -1.949614, 1, 0.2745098, 0, 1,
-1.835448, -0.08674921, -1.79927, 1, 0.282353, 0, 1,
-1.831112, -0.2601101, -2.015855, 1, 0.2862745, 0, 1,
-1.819455, 0.09848966, -0.7471143, 1, 0.2941177, 0, 1,
-1.81652, -0.6749058, -2.382305, 1, 0.3019608, 0, 1,
-1.790095, 0.1594771, -1.421098, 1, 0.3058824, 0, 1,
-1.789844, -0.7001932, -2.656242, 1, 0.3137255, 0, 1,
-1.768879, -1.634014, -0.9467883, 1, 0.3176471, 0, 1,
-1.753654, 0.9260389, -2.05948, 1, 0.3254902, 0, 1,
-1.744474, 0.908591, -0.7325648, 1, 0.3294118, 0, 1,
-1.677002, -1.666867, -0.9734936, 1, 0.3372549, 0, 1,
-1.670174, 1.764677, -1.700498, 1, 0.3411765, 0, 1,
-1.665374, 1.990373, -0.765525, 1, 0.3490196, 0, 1,
-1.660163, 1.526545, -0.08133456, 1, 0.3529412, 0, 1,
-1.645962, 0.658521, -1.201007, 1, 0.3607843, 0, 1,
-1.640163, 0.7252269, 0.101151, 1, 0.3647059, 0, 1,
-1.638342, -2.80909, -3.11095, 1, 0.372549, 0, 1,
-1.637767, -0.2500959, -0.2009707, 1, 0.3764706, 0, 1,
-1.635305, 0.07674295, -2.837307, 1, 0.3843137, 0, 1,
-1.624572, 0.1267202, -2.50497, 1, 0.3882353, 0, 1,
-1.623864, 0.1144485, -1.470773, 1, 0.3960784, 0, 1,
-1.620844, -0.1271186, -1.890839, 1, 0.4039216, 0, 1,
-1.61992, -0.9518203, -2.978605, 1, 0.4078431, 0, 1,
-1.616584, 0.4656979, 0.2358529, 1, 0.4156863, 0, 1,
-1.601934, -0.9082514, -1.597179, 1, 0.4196078, 0, 1,
-1.601235, 0.22524, -1.023738, 1, 0.427451, 0, 1,
-1.600852, -1.027534, -1.771374, 1, 0.4313726, 0, 1,
-1.590895, 0.2931658, -0.6963924, 1, 0.4392157, 0, 1,
-1.582808, -0.4138847, -1.73208, 1, 0.4431373, 0, 1,
-1.579628, -0.5638077, -4.017237, 1, 0.4509804, 0, 1,
-1.57672, 1.838738, -1.933638, 1, 0.454902, 0, 1,
-1.563812, -0.9663386, -1.10548, 1, 0.4627451, 0, 1,
-1.563536, 0.5346721, 0.1701601, 1, 0.4666667, 0, 1,
-1.559935, -0.5878134, -3.890962, 1, 0.4745098, 0, 1,
-1.559194, -1.029487, -3.210932, 1, 0.4784314, 0, 1,
-1.557631, -0.07757929, -1.264502, 1, 0.4862745, 0, 1,
-1.556228, 0.3579894, -1.155706, 1, 0.4901961, 0, 1,
-1.554955, -0.9940662, -1.828637, 1, 0.4980392, 0, 1,
-1.536753, -1.762491, -1.462609, 1, 0.5058824, 0, 1,
-1.533643, -0.239036, -2.503546, 1, 0.509804, 0, 1,
-1.529755, 0.007770323, -0.3142992, 1, 0.5176471, 0, 1,
-1.507909, -0.847207, -1.091523, 1, 0.5215687, 0, 1,
-1.504265, -0.2483122, -2.750866, 1, 0.5294118, 0, 1,
-1.486557, 0.5504288, -1.703671, 1, 0.5333334, 0, 1,
-1.483417, -0.4262337, -2.992295, 1, 0.5411765, 0, 1,
-1.473686, -0.7086737, -2.876574, 1, 0.5450981, 0, 1,
-1.473325, -0.3854011, -1.260842, 1, 0.5529412, 0, 1,
-1.472546, -2.442929, -1.084384, 1, 0.5568628, 0, 1,
-1.469139, -0.2806986, -2.036775, 1, 0.5647059, 0, 1,
-1.453739, 0.4647177, -0.9350047, 1, 0.5686275, 0, 1,
-1.449152, 0.6006157, -0.3347513, 1, 0.5764706, 0, 1,
-1.446917, 0.05707106, -1.741686, 1, 0.5803922, 0, 1,
-1.444757, 0.2213414, -3.199814, 1, 0.5882353, 0, 1,
-1.440355, 0.3880875, -0.4387956, 1, 0.5921569, 0, 1,
-1.425556, 0.1837574, -1.526816, 1, 0.6, 0, 1,
-1.412913, -0.7211916, -3.261724, 1, 0.6078432, 0, 1,
-1.412832, -0.7865646, -3.760727, 1, 0.6117647, 0, 1,
-1.41009, 0.3676573, -0.6973506, 1, 0.6196079, 0, 1,
-1.406361, -0.8434629, -1.255478, 1, 0.6235294, 0, 1,
-1.403018, 0.09763008, -0.4757286, 1, 0.6313726, 0, 1,
-1.387719, -0.8250396, -1.963693, 1, 0.6352941, 0, 1,
-1.385852, -0.2062859, -1.013555, 1, 0.6431373, 0, 1,
-1.383617, -0.05904402, -1.602398, 1, 0.6470588, 0, 1,
-1.382512, 1.495998, -1.476961, 1, 0.654902, 0, 1,
-1.375515, -1.647436, -2.641382, 1, 0.6588235, 0, 1,
-1.372451, -0.4550707, -1.251672, 1, 0.6666667, 0, 1,
-1.364806, -0.004476074, -1.159475, 1, 0.6705883, 0, 1,
-1.361591, -0.3273304, -2.428387, 1, 0.6784314, 0, 1,
-1.35833, 0.3666755, -0.7506282, 1, 0.682353, 0, 1,
-1.348281, -0.3902822, -2.284276, 1, 0.6901961, 0, 1,
-1.341363, -2.099084, -2.215507, 1, 0.6941177, 0, 1,
-1.340335, -0.09748147, -1.41388, 1, 0.7019608, 0, 1,
-1.330908, 1.853157, -0.8480121, 1, 0.7098039, 0, 1,
-1.326499, -0.5271735, -1.814527, 1, 0.7137255, 0, 1,
-1.326382, 2.221324, 0.149114, 1, 0.7215686, 0, 1,
-1.321322, 0.137672, -0.5305552, 1, 0.7254902, 0, 1,
-1.318222, -0.1361955, -2.409776, 1, 0.7333333, 0, 1,
-1.314954, -0.1912308, -1.856832, 1, 0.7372549, 0, 1,
-1.310519, -0.264167, -2.036037, 1, 0.7450981, 0, 1,
-1.306418, -0.554866, -2.207104, 1, 0.7490196, 0, 1,
-1.306027, 0.912132, -2.037049, 1, 0.7568628, 0, 1,
-1.304644, -0.09263664, -2.477699, 1, 0.7607843, 0, 1,
-1.303299, 1.909953, -0.6371913, 1, 0.7686275, 0, 1,
-1.2977, -0.8080049, -0.5464388, 1, 0.772549, 0, 1,
-1.29324, 1.305677, -3.353364, 1, 0.7803922, 0, 1,
-1.283611, -1.76819, -1.863816, 1, 0.7843137, 0, 1,
-1.274221, -0.4641301, -1.721538, 1, 0.7921569, 0, 1,
-1.272779, -1.885434, -0.6847543, 1, 0.7960784, 0, 1,
-1.266729, -0.7541903, -4.257673, 1, 0.8039216, 0, 1,
-1.264534, 0.6524023, -1.370746, 1, 0.8117647, 0, 1,
-1.261218, 2.0755, -0.5541008, 1, 0.8156863, 0, 1,
-1.257243, 0.7601004, -0.7483478, 1, 0.8235294, 0, 1,
-1.254718, -0.6777316, -2.47331, 1, 0.827451, 0, 1,
-1.25376, -1.096742, -2.291533, 1, 0.8352941, 0, 1,
-1.253031, -0.148204, -2.311066, 1, 0.8392157, 0, 1,
-1.252118, 0.03664398, -0.4096372, 1, 0.8470588, 0, 1,
-1.24613, 1.886399, 0.01753294, 1, 0.8509804, 0, 1,
-1.241584, -1.330861, -3.119987, 1, 0.8588235, 0, 1,
-1.241435, 0.4404273, 1.39596, 1, 0.8627451, 0, 1,
-1.216522, -2.196833, -1.307486, 1, 0.8705882, 0, 1,
-1.21414, 1.187764, -1.002069, 1, 0.8745098, 0, 1,
-1.197193, -1.600626, -2.483529, 1, 0.8823529, 0, 1,
-1.196841, 0.2965763, -1.40745, 1, 0.8862745, 0, 1,
-1.196184, 0.9289358, 0.3338859, 1, 0.8941177, 0, 1,
-1.185987, 0.2267322, -1.24607, 1, 0.8980392, 0, 1,
-1.180836, 0.4566143, -0.9204083, 1, 0.9058824, 0, 1,
-1.177894, 0.899888, -1.059297, 1, 0.9137255, 0, 1,
-1.168592, -0.1852062, -1.999499, 1, 0.9176471, 0, 1,
-1.168244, -0.8700969, -0.01245167, 1, 0.9254902, 0, 1,
-1.166456, -1.287311, -1.965145, 1, 0.9294118, 0, 1,
-1.163275, -1.995808, -2.871661, 1, 0.9372549, 0, 1,
-1.160462, 0.2797287, -0.4524885, 1, 0.9411765, 0, 1,
-1.148474, 0.429745, -0.1992956, 1, 0.9490196, 0, 1,
-1.143255, -1.030735, -2.181821, 1, 0.9529412, 0, 1,
-1.142662, 0.9537761, -1.114195, 1, 0.9607843, 0, 1,
-1.131634, 1.694251, -0.2855816, 1, 0.9647059, 0, 1,
-1.127029, -2.407366, -1.252858, 1, 0.972549, 0, 1,
-1.125878, -0.3944915, -1.691128, 1, 0.9764706, 0, 1,
-1.118991, -0.8432816, -3.141514, 1, 0.9843137, 0, 1,
-1.117464, 0.4618209, -0.4397172, 1, 0.9882353, 0, 1,
-1.11658, -0.01703773, -1.984112, 1, 0.9960784, 0, 1,
-1.112742, -0.9999515, -3.503445, 0.9960784, 1, 0, 1,
-1.097456, -1.588852, -1.636413, 0.9921569, 1, 0, 1,
-1.082126, 1.386682, 0.1422786, 0.9843137, 1, 0, 1,
-1.081463, 0.5820842, -1.827449, 0.9803922, 1, 0, 1,
-1.075619, -1.063345, 0.8131136, 0.972549, 1, 0, 1,
-1.069886, 1.293527, 0.3665445, 0.9686275, 1, 0, 1,
-1.069585, -0.8337283, -3.362106, 0.9607843, 1, 0, 1,
-1.067841, 1.04903, -0.7617304, 0.9568627, 1, 0, 1,
-1.06305, 1.356411, -1.424176, 0.9490196, 1, 0, 1,
-1.04608, 0.5933637, -3.231529, 0.945098, 1, 0, 1,
-1.041332, -0.7232497, -0.9199891, 0.9372549, 1, 0, 1,
-1.028659, -1.006875, -2.671875, 0.9333333, 1, 0, 1,
-1.026776, -0.2223689, -2.094634, 0.9254902, 1, 0, 1,
-1.022109, 2.098741, 0.1814028, 0.9215686, 1, 0, 1,
-1.018146, -0.7119238, -3.398064, 0.9137255, 1, 0, 1,
-1.015483, -0.5351198, -1.322064, 0.9098039, 1, 0, 1,
-1.013682, 0.4940538, -0.005210583, 0.9019608, 1, 0, 1,
-1.011707, -0.71516, -3.072986, 0.8941177, 1, 0, 1,
-0.9983184, -0.4601967, -3.291205, 0.8901961, 1, 0, 1,
-0.9957271, -1.225236, -1.833285, 0.8823529, 1, 0, 1,
-0.9920442, 0.2547244, -0.7141384, 0.8784314, 1, 0, 1,
-0.9917816, -0.6944569, -2.891471, 0.8705882, 1, 0, 1,
-0.9782345, -0.8685186, -1.811617, 0.8666667, 1, 0, 1,
-0.977967, -1.64269, -2.539799, 0.8588235, 1, 0, 1,
-0.970278, -0.4773182, -2.162513, 0.854902, 1, 0, 1,
-0.9697059, -1.486399, -3.413212, 0.8470588, 1, 0, 1,
-0.9663441, -0.1153838, -0.3956009, 0.8431373, 1, 0, 1,
-0.9659556, -0.0400511, -0.8285455, 0.8352941, 1, 0, 1,
-0.964078, 1.031728, -1.623252, 0.8313726, 1, 0, 1,
-0.9562699, -2.242321, -2.617407, 0.8235294, 1, 0, 1,
-0.9524313, -1.746762, -2.129273, 0.8196079, 1, 0, 1,
-0.9515637, 0.2361646, -2.683544, 0.8117647, 1, 0, 1,
-0.947614, -0.9051566, -1.265576, 0.8078431, 1, 0, 1,
-0.9471763, 0.6039842, -0.8745387, 0.8, 1, 0, 1,
-0.9461047, -1.090358, -3.310399, 0.7921569, 1, 0, 1,
-0.9460781, -0.956766, -2.848536, 0.7882353, 1, 0, 1,
-0.9423434, -1.827404, -4.344229, 0.7803922, 1, 0, 1,
-0.9396011, -0.9529538, -0.8604363, 0.7764706, 1, 0, 1,
-0.9319966, -0.167596, -1.607732, 0.7686275, 1, 0, 1,
-0.9291512, -1.185795, -1.980822, 0.7647059, 1, 0, 1,
-0.9140474, 0.2955866, -1.734979, 0.7568628, 1, 0, 1,
-0.9104648, 0.2805234, -0.7113948, 0.7529412, 1, 0, 1,
-0.9095147, -1.656506, -2.387717, 0.7450981, 1, 0, 1,
-0.9045447, -1.22569, -0.3264485, 0.7411765, 1, 0, 1,
-0.8981278, -1.061764, -1.442083, 0.7333333, 1, 0, 1,
-0.887711, -0.07908758, 0.2497517, 0.7294118, 1, 0, 1,
-0.8820647, -0.3543877, -1.459598, 0.7215686, 1, 0, 1,
-0.8787782, 0.02912271, -3.111669, 0.7176471, 1, 0, 1,
-0.8714731, 0.2683226, -2.652876, 0.7098039, 1, 0, 1,
-0.8694021, -0.6350832, -1.469534, 0.7058824, 1, 0, 1,
-0.8576558, 0.9889082, -1.550005, 0.6980392, 1, 0, 1,
-0.8546852, 1.313759, -1.918645, 0.6901961, 1, 0, 1,
-0.8460674, 0.7751008, -1.177966, 0.6862745, 1, 0, 1,
-0.8384253, -1.134022, -0.4770842, 0.6784314, 1, 0, 1,
-0.836138, -1.353946, -0.8374094, 0.6745098, 1, 0, 1,
-0.834649, 0.3804922, -0.5829415, 0.6666667, 1, 0, 1,
-0.8327976, -0.673617, -2.734063, 0.6627451, 1, 0, 1,
-0.8324603, -1.044867, -1.013762, 0.654902, 1, 0, 1,
-0.8297495, 0.2353581, -1.222515, 0.6509804, 1, 0, 1,
-0.8245849, -0.4796617, -2.376687, 0.6431373, 1, 0, 1,
-0.8166546, -1.883715, -2.67565, 0.6392157, 1, 0, 1,
-0.8146989, 0.4609081, -2.20902, 0.6313726, 1, 0, 1,
-0.809912, -0.4573201, -2.297538, 0.627451, 1, 0, 1,
-0.8078282, -0.1597415, -0.3765683, 0.6196079, 1, 0, 1,
-0.8070774, 1.940525, 0.08692004, 0.6156863, 1, 0, 1,
-0.8042251, -2.479947, -1.926187, 0.6078432, 1, 0, 1,
-0.8023013, 0.03427772, -1.845013, 0.6039216, 1, 0, 1,
-0.7966166, -0.3643071, -3.7367, 0.5960785, 1, 0, 1,
-0.7896132, -0.355232, -1.424237, 0.5882353, 1, 0, 1,
-0.7852134, -0.05608511, -3.291201, 0.5843138, 1, 0, 1,
-0.7827097, 1.434327, -0.640515, 0.5764706, 1, 0, 1,
-0.7788136, 1.707152, -1.256321, 0.572549, 1, 0, 1,
-0.7730753, -0.5388497, -1.734596, 0.5647059, 1, 0, 1,
-0.7719805, -1.842511, -4.061936, 0.5607843, 1, 0, 1,
-0.7654556, 0.02173251, -1.463243, 0.5529412, 1, 0, 1,
-0.7654044, 0.4259954, -2.118605, 0.5490196, 1, 0, 1,
-0.7640908, 0.08429845, -2.875762, 0.5411765, 1, 0, 1,
-0.7639312, -0.06590745, -2.042979, 0.5372549, 1, 0, 1,
-0.7619252, 0.3333694, -2.294106, 0.5294118, 1, 0, 1,
-0.7615636, -0.4646093, -2.621024, 0.5254902, 1, 0, 1,
-0.7594064, -0.7013582, -3.234553, 0.5176471, 1, 0, 1,
-0.7492301, -0.2908275, -0.8621575, 0.5137255, 1, 0, 1,
-0.7480497, -0.5893244, -1.165838, 0.5058824, 1, 0, 1,
-0.7414352, 0.77762, -1.209939, 0.5019608, 1, 0, 1,
-0.7410706, -0.05051006, -2.963372, 0.4941176, 1, 0, 1,
-0.7404977, 0.6943931, -0.3083594, 0.4862745, 1, 0, 1,
-0.739971, -1.579913, -4.452531, 0.4823529, 1, 0, 1,
-0.7395998, -0.09462129, -2.257583, 0.4745098, 1, 0, 1,
-0.7383952, -0.3939399, -1.51312, 0.4705882, 1, 0, 1,
-0.7377561, 2.249765, -0.1638681, 0.4627451, 1, 0, 1,
-0.7370728, -0.6862622, -3.370264, 0.4588235, 1, 0, 1,
-0.7304651, -1.689394, -2.969219, 0.4509804, 1, 0, 1,
-0.7279023, 0.7268976, -1.367449, 0.4470588, 1, 0, 1,
-0.7248779, -0.1386509, -1.19797, 0.4392157, 1, 0, 1,
-0.7241588, -0.1167406, -0.5666726, 0.4352941, 1, 0, 1,
-0.7193958, -0.1975973, -2.349219, 0.427451, 1, 0, 1,
-0.7150748, -0.08884601, -1.548997, 0.4235294, 1, 0, 1,
-0.7145125, -0.9373744, -3.695984, 0.4156863, 1, 0, 1,
-0.712113, -0.6341211, -4.027423, 0.4117647, 1, 0, 1,
-0.7111982, 0.0697296, -2.696115, 0.4039216, 1, 0, 1,
-0.7089894, 0.738737, -2.143186, 0.3960784, 1, 0, 1,
-0.7074654, 0.2288208, -1.700605, 0.3921569, 1, 0, 1,
-0.6906435, -0.3559603, -3.726916, 0.3843137, 1, 0, 1,
-0.6860626, 0.5110636, -2.133827, 0.3803922, 1, 0, 1,
-0.6843757, 0.331242, -1.66365, 0.372549, 1, 0, 1,
-0.6839813, 0.1358861, -1.867929, 0.3686275, 1, 0, 1,
-0.6804473, 0.0799808, -2.585494, 0.3607843, 1, 0, 1,
-0.6764807, -0.392726, -2.773356, 0.3568628, 1, 0, 1,
-0.6743001, -2.252016, -2.018993, 0.3490196, 1, 0, 1,
-0.6741403, 0.7037301, 0.6486452, 0.345098, 1, 0, 1,
-0.6700141, -0.5074771, -2.462626, 0.3372549, 1, 0, 1,
-0.6699381, -0.3597956, -2.126408, 0.3333333, 1, 0, 1,
-0.6637039, -1.109446, -2.939949, 0.3254902, 1, 0, 1,
-0.6628566, 0.2088835, -1.903511, 0.3215686, 1, 0, 1,
-0.6624139, 0.3794271, 0.2921652, 0.3137255, 1, 0, 1,
-0.6621411, -0.8542587, -2.086419, 0.3098039, 1, 0, 1,
-0.6617708, 0.3440674, 0.3706526, 0.3019608, 1, 0, 1,
-0.6567588, -0.4278109, -2.975966, 0.2941177, 1, 0, 1,
-0.6563695, -0.05213565, -2.476069, 0.2901961, 1, 0, 1,
-0.655126, 0.7919919, 0.6200072, 0.282353, 1, 0, 1,
-0.653845, -0.1402638, -2.798114, 0.2784314, 1, 0, 1,
-0.6443567, -0.5085495, -3.475634, 0.2705882, 1, 0, 1,
-0.644354, 0.6234307, -0.9690086, 0.2666667, 1, 0, 1,
-0.6439731, -2.222813, -3.506524, 0.2588235, 1, 0, 1,
-0.6423606, 0.367486, -1.118111, 0.254902, 1, 0, 1,
-0.6353297, 1.058037, 0.5292401, 0.2470588, 1, 0, 1,
-0.6303613, -0.08334222, -1.975543, 0.2431373, 1, 0, 1,
-0.6294438, 1.37362, -1.069114, 0.2352941, 1, 0, 1,
-0.6286246, 0.4433405, -2.131259, 0.2313726, 1, 0, 1,
-0.6257622, -0.2739589, -0.626801, 0.2235294, 1, 0, 1,
-0.6249501, -0.1054137, -0.8543066, 0.2196078, 1, 0, 1,
-0.6245708, -1.364061, -2.316742, 0.2117647, 1, 0, 1,
-0.6221882, 0.4720545, -1.397052, 0.2078431, 1, 0, 1,
-0.6128079, 0.1253659, -0.8213969, 0.2, 1, 0, 1,
-0.610109, -0.1563985, -1.347268, 0.1921569, 1, 0, 1,
-0.6087588, 0.8357407, -0.2323703, 0.1882353, 1, 0, 1,
-0.6014288, 0.2266738, -1.212786, 0.1803922, 1, 0, 1,
-0.599021, 2.01915, -0.8263766, 0.1764706, 1, 0, 1,
-0.5983859, -0.9606681, -2.19817, 0.1686275, 1, 0, 1,
-0.5960101, -0.1721443, -1.206842, 0.1647059, 1, 0, 1,
-0.5946831, 0.5907027, 1.140504, 0.1568628, 1, 0, 1,
-0.5940439, 0.858793, -1.151762, 0.1529412, 1, 0, 1,
-0.5935098, -2.544547, -2.453093, 0.145098, 1, 0, 1,
-0.5897778, -1.202772, -1.682031, 0.1411765, 1, 0, 1,
-0.5895371, -1.453966, -2.5119, 0.1333333, 1, 0, 1,
-0.5885057, -0.3078336, -2.782317, 0.1294118, 1, 0, 1,
-0.5882069, 1.0702, -1.338124, 0.1215686, 1, 0, 1,
-0.5859246, 2.609061, 0.6318733, 0.1176471, 1, 0, 1,
-0.5852531, 0.3961979, -0.4987398, 0.1098039, 1, 0, 1,
-0.5821438, -0.09426817, -1.168848, 0.1058824, 1, 0, 1,
-0.5816891, 0.6023458, -0.5072924, 0.09803922, 1, 0, 1,
-0.5796621, -0.1041487, 0.5039798, 0.09019608, 1, 0, 1,
-0.5757585, 1.328251, -1.75563, 0.08627451, 1, 0, 1,
-0.5721188, -0.6539018, -2.405769, 0.07843138, 1, 0, 1,
-0.5705309, -0.4942252, -1.562109, 0.07450981, 1, 0, 1,
-0.5704775, 2.331841, -0.9321552, 0.06666667, 1, 0, 1,
-0.5637888, -1.510403, -2.066276, 0.0627451, 1, 0, 1,
-0.5613719, -0.7848948, -1.85613, 0.05490196, 1, 0, 1,
-0.5564803, 0.7775771, 0.1532836, 0.05098039, 1, 0, 1,
-0.5561112, -1.931535, -3.834924, 0.04313726, 1, 0, 1,
-0.5545789, 0.2655888, -3.008076, 0.03921569, 1, 0, 1,
-0.5496694, -0.08422728, -1.33446, 0.03137255, 1, 0, 1,
-0.5496457, -0.9865807, -1.397678, 0.02745098, 1, 0, 1,
-0.5478963, -0.2877628, -1.951368, 0.01960784, 1, 0, 1,
-0.5461864, -0.2260973, -1.572803, 0.01568628, 1, 0, 1,
-0.5453466, 0.09056841, -1.258327, 0.007843138, 1, 0, 1,
-0.5403881, -0.5187457, -3.093524, 0.003921569, 1, 0, 1,
-0.5385591, -0.2697396, -1.34835, 0, 1, 0.003921569, 1,
-0.5377845, 0.6434847, -1.228297, 0, 1, 0.01176471, 1,
-0.5344027, 3.065782, 0.1862633, 0, 1, 0.01568628, 1,
-0.5330703, -0.7233315, -2.199898, 0, 1, 0.02352941, 1,
-0.5293751, 0.05958871, -1.25828, 0, 1, 0.02745098, 1,
-0.5291981, 0.1897333, -1.615661, 0, 1, 0.03529412, 1,
-0.5208076, 0.3778205, -0.3911808, 0, 1, 0.03921569, 1,
-0.5206941, 0.7583789, -0.9121843, 0, 1, 0.04705882, 1,
-0.5136427, -0.2434297, -2.954355, 0, 1, 0.05098039, 1,
-0.5136036, 0.1658694, -2.143213, 0, 1, 0.05882353, 1,
-0.5117316, -0.9385493, -4.286395, 0, 1, 0.0627451, 1,
-0.5093723, 0.1480172, -0.2935166, 0, 1, 0.07058824, 1,
-0.5057334, -1.323166, -3.545034, 0, 1, 0.07450981, 1,
-0.50427, -0.1031081, -2.861434, 0, 1, 0.08235294, 1,
-0.5040545, -0.2249023, -2.897991, 0, 1, 0.08627451, 1,
-0.5039534, -1.258188, -2.725239, 0, 1, 0.09411765, 1,
-0.5035902, 1.223659, -0.175721, 0, 1, 0.1019608, 1,
-0.4990787, -0.9226677, -1.977211, 0, 1, 0.1058824, 1,
-0.4964907, 0.6167305, -0.3718591, 0, 1, 0.1137255, 1,
-0.4936958, 0.5755767, -1.199904, 0, 1, 0.1176471, 1,
-0.4922872, -2.250242, -5.838457, 0, 1, 0.1254902, 1,
-0.492247, 0.1827782, -1.218248, 0, 1, 0.1294118, 1,
-0.4918027, 1.147154, -0.5910952, 0, 1, 0.1372549, 1,
-0.4825385, 0.1401978, -0.597881, 0, 1, 0.1411765, 1,
-0.481017, 1.672729, -1.316876, 0, 1, 0.1490196, 1,
-0.4805315, 0.5561864, -1.574702, 0, 1, 0.1529412, 1,
-0.4758366, -0.1189282, -2.504931, 0, 1, 0.1607843, 1,
-0.4758252, -0.8951524, -1.647136, 0, 1, 0.1647059, 1,
-0.4721084, -0.7632188, -2.001242, 0, 1, 0.172549, 1,
-0.4720826, -0.5636787, -3.077877, 0, 1, 0.1764706, 1,
-0.4688632, -1.462584, -3.189287, 0, 1, 0.1843137, 1,
-0.4578174, 0.5852835, -0.6188456, 0, 1, 0.1882353, 1,
-0.4448656, -0.1658502, -1.390161, 0, 1, 0.1960784, 1,
-0.4444686, 1.663318, 0.5051672, 0, 1, 0.2039216, 1,
-0.4339775, 0.3332052, -0.6727317, 0, 1, 0.2078431, 1,
-0.4328058, -0.0216692, -3.500448, 0, 1, 0.2156863, 1,
-0.4325287, -0.6075109, -2.710624, 0, 1, 0.2196078, 1,
-0.4313486, 0.8036075, -0.2434683, 0, 1, 0.227451, 1,
-0.4304748, 2.344794, 0.4138303, 0, 1, 0.2313726, 1,
-0.4260583, 0.1852264, 0.9381821, 0, 1, 0.2392157, 1,
-0.4242551, 1.421351, 1.48046, 0, 1, 0.2431373, 1,
-0.4199077, -1.7216, -3.582305, 0, 1, 0.2509804, 1,
-0.4191615, -0.3040022, -2.188234, 0, 1, 0.254902, 1,
-0.4185446, 1.777004, -0.3301555, 0, 1, 0.2627451, 1,
-0.4162113, -0.5144282, -2.434602, 0, 1, 0.2666667, 1,
-0.4144024, -0.3498648, -3.581299, 0, 1, 0.2745098, 1,
-0.4135474, 0.6499594, 0.2259542, 0, 1, 0.2784314, 1,
-0.4048115, 0.8810903, 0.4009064, 0, 1, 0.2862745, 1,
-0.4017709, -0.1075822, -0.5406729, 0, 1, 0.2901961, 1,
-0.398671, -1.267594, -2.534484, 0, 1, 0.2980392, 1,
-0.3984244, 1.093405, -0.5861972, 0, 1, 0.3058824, 1,
-0.3982155, -0.2890952, -3.993659, 0, 1, 0.3098039, 1,
-0.3977321, 0.1723468, -0.1045404, 0, 1, 0.3176471, 1,
-0.3928435, 1.234034, 0.7544159, 0, 1, 0.3215686, 1,
-0.3903191, 0.9003007, -0.07358325, 0, 1, 0.3294118, 1,
-0.3896175, -1.377966, -2.716522, 0, 1, 0.3333333, 1,
-0.3888255, -1.178794, -1.400676, 0, 1, 0.3411765, 1,
-0.3857131, 0.1708081, 0.5277643, 0, 1, 0.345098, 1,
-0.3815694, 1.35814, -0.5281149, 0, 1, 0.3529412, 1,
-0.381386, 1.141275, -0.8192511, 0, 1, 0.3568628, 1,
-0.3786886, -0.5864033, -3.119031, 0, 1, 0.3647059, 1,
-0.3778977, -0.2581459, -1.961625, 0, 1, 0.3686275, 1,
-0.3738797, -0.1284381, -3.230908, 0, 1, 0.3764706, 1,
-0.3704072, 0.8744096, -0.368722, 0, 1, 0.3803922, 1,
-0.3698863, -0.8235643, -1.945035, 0, 1, 0.3882353, 1,
-0.3667743, -1.833329, -3.88302, 0, 1, 0.3921569, 1,
-0.362673, 0.3167429, -1.721055, 0, 1, 0.4, 1,
-0.3626236, -0.3722617, -1.642744, 0, 1, 0.4078431, 1,
-0.3572695, -0.9738069, -1.278691, 0, 1, 0.4117647, 1,
-0.3558333, -0.8384737, -3.381067, 0, 1, 0.4196078, 1,
-0.3545913, 0.6159177, -0.3110026, 0, 1, 0.4235294, 1,
-0.3538079, 0.6608688, -1.612879, 0, 1, 0.4313726, 1,
-0.3510861, 1.124719, 0.4452879, 0, 1, 0.4352941, 1,
-0.3449033, 2.051913, -1.465309, 0, 1, 0.4431373, 1,
-0.3377933, 0.03920496, -0.9185889, 0, 1, 0.4470588, 1,
-0.3330627, -0.3065573, -2.143827, 0, 1, 0.454902, 1,
-0.3317477, -0.1746748, -1.925108, 0, 1, 0.4588235, 1,
-0.3298934, 0.9226547, 0.1093342, 0, 1, 0.4666667, 1,
-0.3238349, 1.641111, 0.1291686, 0, 1, 0.4705882, 1,
-0.3218445, -0.09487683, -2.142937, 0, 1, 0.4784314, 1,
-0.3076225, -1.58677, -3.375705, 0, 1, 0.4823529, 1,
-0.3041138, 0.4926816, 0.7047396, 0, 1, 0.4901961, 1,
-0.3037131, -0.1673908, -1.651475, 0, 1, 0.4941176, 1,
-0.3026442, -0.4326257, -3.264856, 0, 1, 0.5019608, 1,
-0.3009602, -0.8403931, -1.590855, 0, 1, 0.509804, 1,
-0.293319, 0.09826776, 0.9153301, 0, 1, 0.5137255, 1,
-0.2895322, 0.6424732, -0.8597867, 0, 1, 0.5215687, 1,
-0.2849067, -0.07178114, -2.965768, 0, 1, 0.5254902, 1,
-0.2837534, -0.3589215, -1.967169, 0, 1, 0.5333334, 1,
-0.2819022, 0.2377681, -0.8027685, 0, 1, 0.5372549, 1,
-0.2797985, 1.419908, 0.4375941, 0, 1, 0.5450981, 1,
-0.2767423, -2.276876, -3.187661, 0, 1, 0.5490196, 1,
-0.2726393, 0.007884909, -1.857472, 0, 1, 0.5568628, 1,
-0.2695046, 0.851868, 0.3765467, 0, 1, 0.5607843, 1,
-0.2639027, -1.134762, -2.634603, 0, 1, 0.5686275, 1,
-0.2632606, -0.9455975, -1.49181, 0, 1, 0.572549, 1,
-0.2628002, 1.418688, -1.040191, 0, 1, 0.5803922, 1,
-0.2591398, -1.11183, -4.746844, 0, 1, 0.5843138, 1,
-0.2483133, 1.407, -0.7333168, 0, 1, 0.5921569, 1,
-0.2444846, 0.4586806, -0.5394133, 0, 1, 0.5960785, 1,
-0.2425204, 1.749936, 0.4284211, 0, 1, 0.6039216, 1,
-0.241088, 0.4185578, 0.8591043, 0, 1, 0.6117647, 1,
-0.2410796, 1.128507, 0.2259702, 0, 1, 0.6156863, 1,
-0.2396396, 0.5753797, -0.1941593, 0, 1, 0.6235294, 1,
-0.2378028, -0.7948279, -2.654085, 0, 1, 0.627451, 1,
-0.2371364, 0.01782162, -1.493753, 0, 1, 0.6352941, 1,
-0.235037, 1.258918, 0.0690582, 0, 1, 0.6392157, 1,
-0.2295025, -0.1122015, -1.269834, 0, 1, 0.6470588, 1,
-0.2289371, 0.2383768, -0.1353974, 0, 1, 0.6509804, 1,
-0.2282318, 1.969769, -0.4248346, 0, 1, 0.6588235, 1,
-0.2253705, 1.753464, -0.4076405, 0, 1, 0.6627451, 1,
-0.2221358, -0.6752672, -1.486269, 0, 1, 0.6705883, 1,
-0.2179554, -0.2865548, -2.085329, 0, 1, 0.6745098, 1,
-0.2129056, -1.673422, -2.181974, 0, 1, 0.682353, 1,
-0.2124476, 0.3517462, -0.907768, 0, 1, 0.6862745, 1,
-0.211867, -0.5091767, -3.416265, 0, 1, 0.6941177, 1,
-0.211605, 0.1585603, -0.3153604, 0, 1, 0.7019608, 1,
-0.2094067, 0.7727649, -0.4529421, 0, 1, 0.7058824, 1,
-0.2091745, 0.06334826, -2.406308, 0, 1, 0.7137255, 1,
-0.2056218, 0.9005033, -0.6786459, 0, 1, 0.7176471, 1,
-0.2040006, -0.6164374, -1.738326, 0, 1, 0.7254902, 1,
-0.1904848, 0.6276475, -1.490088, 0, 1, 0.7294118, 1,
-0.1882368, 0.3087578, -0.3943388, 0, 1, 0.7372549, 1,
-0.186957, -0.2883192, -2.892522, 0, 1, 0.7411765, 1,
-0.1867945, -1.086179, -3.587469, 0, 1, 0.7490196, 1,
-0.186164, -0.2606192, -2.995017, 0, 1, 0.7529412, 1,
-0.1854832, 0.9440191, 0.2050081, 0, 1, 0.7607843, 1,
-0.1804638, -0.9802526, -5.173512, 0, 1, 0.7647059, 1,
-0.1745534, 0.8938326, 0.1178714, 0, 1, 0.772549, 1,
-0.1707019, -1.427683, -3.632701, 0, 1, 0.7764706, 1,
-0.168237, -1.720832, -6.020288, 0, 1, 0.7843137, 1,
-0.1682184, 0.9477232, -1.393114, 0, 1, 0.7882353, 1,
-0.1626581, 1.36182, -1.176647, 0, 1, 0.7960784, 1,
-0.1601758, 0.1076807, -2.419048, 0, 1, 0.8039216, 1,
-0.1575249, 0.3608006, -1.677435, 0, 1, 0.8078431, 1,
-0.1572856, -1.573851, -1.598742, 0, 1, 0.8156863, 1,
-0.1471964, 1.241539, -0.2096844, 0, 1, 0.8196079, 1,
-0.144826, 0.2129165, -0.8730485, 0, 1, 0.827451, 1,
-0.1422711, 0.3449669, -0.6007109, 0, 1, 0.8313726, 1,
-0.1404951, 1.290318, 0.486194, 0, 1, 0.8392157, 1,
-0.1374208, -0.865886, -1.667142, 0, 1, 0.8431373, 1,
-0.1323464, 1.302346, -0.03914171, 0, 1, 0.8509804, 1,
-0.1309898, 0.02528077, -1.769208, 0, 1, 0.854902, 1,
-0.1252965, -0.5908681, -3.056397, 0, 1, 0.8627451, 1,
-0.1225708, 0.6338501, -1.236576, 0, 1, 0.8666667, 1,
-0.1200212, -0.4437844, -2.075235, 0, 1, 0.8745098, 1,
-0.1197723, 1.326309, 0.2560179, 0, 1, 0.8784314, 1,
-0.1160577, 0.7932134, 1.536853, 0, 1, 0.8862745, 1,
-0.1121154, -0.6426894, -2.114012, 0, 1, 0.8901961, 1,
-0.1097954, 1.691853, -0.4997079, 0, 1, 0.8980392, 1,
-0.109774, 1.892862, 0.1843634, 0, 1, 0.9058824, 1,
-0.1090111, 1.720003, 0.1614802, 0, 1, 0.9098039, 1,
-0.1081289, 0.542892, -0.1240367, 0, 1, 0.9176471, 1,
-0.1079051, -0.575908, -2.601964, 0, 1, 0.9215686, 1,
-0.1026275, 1.732281, -0.07837261, 0, 1, 0.9294118, 1,
-0.09928091, 1.077086, -0.7798506, 0, 1, 0.9333333, 1,
-0.09722203, 0.4058967, 1.850252, 0, 1, 0.9411765, 1,
-0.09688608, -0.9852785, -1.502703, 0, 1, 0.945098, 1,
-0.0944282, -0.04490424, -2.067469, 0, 1, 0.9529412, 1,
-0.09431332, 0.4655606, 1.579271, 0, 1, 0.9568627, 1,
-0.09406691, -0.2671664, -3.256105, 0, 1, 0.9647059, 1,
-0.09021526, -0.8021493, -4.176109, 0, 1, 0.9686275, 1,
-0.08738288, 1.10562, -0.6381562, 0, 1, 0.9764706, 1,
-0.07920603, 1.172464, 1.148632, 0, 1, 0.9803922, 1,
-0.0766754, -1.364789, -3.666579, 0, 1, 0.9882353, 1,
-0.07654192, -0.7171229, -1.831073, 0, 1, 0.9921569, 1,
-0.0738498, -0.8748381, -3.587916, 0, 1, 1, 1,
-0.06903379, -1.499136, -3.55935, 0, 0.9921569, 1, 1,
-0.06788424, -0.3036779, -2.663117, 0, 0.9882353, 1, 1,
-0.06706811, -0.5880107, -2.619906, 0, 0.9803922, 1, 1,
-0.06500833, 0.9276295, -2.134252, 0, 0.9764706, 1, 1,
-0.06500445, -1.898899, -2.197931, 0, 0.9686275, 1, 1,
-0.06243907, 0.4508194, 0.0708671, 0, 0.9647059, 1, 1,
-0.06098334, 1.294181, -1.094989, 0, 0.9568627, 1, 1,
-0.05970196, -0.9986969, -2.962976, 0, 0.9529412, 1, 1,
-0.05798707, 0.2131594, 0.6343457, 0, 0.945098, 1, 1,
-0.05443633, -0.2810462, -4.557226, 0, 0.9411765, 1, 1,
-0.05391739, -0.0280319, 1.663845, 0, 0.9333333, 1, 1,
-0.05085646, -0.7193735, -0.888173, 0, 0.9294118, 1, 1,
-0.05004338, 0.5159713, -0.6154732, 0, 0.9215686, 1, 1,
-0.04966925, 1.196706, 0.2360154, 0, 0.9176471, 1, 1,
-0.04752557, -0.2456706, -1.842148, 0, 0.9098039, 1, 1,
-0.04554012, 0.3182552, 0.2006594, 0, 0.9058824, 1, 1,
-0.04532726, -0.2115039, -0.6484918, 0, 0.8980392, 1, 1,
-0.04524062, -0.05349882, -1.393791, 0, 0.8901961, 1, 1,
-0.04086382, -1.075642, -2.821088, 0, 0.8862745, 1, 1,
-0.03987502, -0.8621868, -2.218235, 0, 0.8784314, 1, 1,
-0.03871403, -0.8791208, -2.132087, 0, 0.8745098, 1, 1,
-0.03334274, 1.752454, 0.09006111, 0, 0.8666667, 1, 1,
-0.03193664, -1.149766, -4.940379, 0, 0.8627451, 1, 1,
-0.03184424, 0.5878143, 0.01130341, 0, 0.854902, 1, 1,
-0.02782542, -1.604525, -2.909188, 0, 0.8509804, 1, 1,
-0.02531645, 0.9661365, -0.3016305, 0, 0.8431373, 1, 1,
-0.02495734, 0.3361863, 0.6911858, 0, 0.8392157, 1, 1,
-0.02403889, -0.1753221, -1.918065, 0, 0.8313726, 1, 1,
-0.02324376, -0.7912515, -4.726732, 0, 0.827451, 1, 1,
-0.01985602, -1.238713, -1.831535, 0, 0.8196079, 1, 1,
-0.01733173, -1.060287, -2.101978, 0, 0.8156863, 1, 1,
-0.01652478, 0.1300407, -0.8673179, 0, 0.8078431, 1, 1,
-0.01530305, -0.214137, -3.039088, 0, 0.8039216, 1, 1,
-0.01350863, -0.6318133, -2.848963, 0, 0.7960784, 1, 1,
-0.007932722, -1.49182, -3.766042, 0, 0.7882353, 1, 1,
-0.007250554, -0.6506982, -1.297706, 0, 0.7843137, 1, 1,
-0.005074548, -0.06434793, -3.726436, 0, 0.7764706, 1, 1,
0.00464166, 0.5680006, -1.713333, 0, 0.772549, 1, 1,
0.005392208, -0.08654727, 2.112808, 0, 0.7647059, 1, 1,
0.00659035, -0.3313342, 3.130933, 0, 0.7607843, 1, 1,
0.006789576, -0.4228574, 1.695047, 0, 0.7529412, 1, 1,
0.007304032, 1.648515, -0.4664772, 0, 0.7490196, 1, 1,
0.008634688, -2.287371, 2.595715, 0, 0.7411765, 1, 1,
0.008661187, 1.377143, 0.3583016, 0, 0.7372549, 1, 1,
0.01399082, -0.9746069, 1.674418, 0, 0.7294118, 1, 1,
0.01539368, -0.1458773, 3.366839, 0, 0.7254902, 1, 1,
0.01576122, -0.3650127, 3.85445, 0, 0.7176471, 1, 1,
0.01666964, -1.258689, 2.196698, 0, 0.7137255, 1, 1,
0.02404392, -0.2938318, 4.970831, 0, 0.7058824, 1, 1,
0.02589027, 0.7762194, -1.123725, 0, 0.6980392, 1, 1,
0.02762823, -0.1877346, 3.910427, 0, 0.6941177, 1, 1,
0.02807865, 2.28505, 0.1353379, 0, 0.6862745, 1, 1,
0.03203021, -0.5813239, 2.289352, 0, 0.682353, 1, 1,
0.03209353, 1.947401, -0.7439009, 0, 0.6745098, 1, 1,
0.0332849, 0.01224388, 0.4709881, 0, 0.6705883, 1, 1,
0.03377583, -0.3491211, 2.859494, 0, 0.6627451, 1, 1,
0.03471768, 0.09462645, -0.539149, 0, 0.6588235, 1, 1,
0.03672094, -1.068678, 2.533022, 0, 0.6509804, 1, 1,
0.03998126, -0.7133245, 3.046438, 0, 0.6470588, 1, 1,
0.04030543, 0.01000014, 1.838441, 0, 0.6392157, 1, 1,
0.04923129, 0.6147522, 0.8000727, 0, 0.6352941, 1, 1,
0.0541788, -1.553623, 2.691073, 0, 0.627451, 1, 1,
0.05535549, 1.40705, -2.15556, 0, 0.6235294, 1, 1,
0.05559849, -1.170027, 2.214986, 0, 0.6156863, 1, 1,
0.06318076, 0.2373291, -1.278578, 0, 0.6117647, 1, 1,
0.06326322, 0.1484333, 0.8306476, 0, 0.6039216, 1, 1,
0.06444741, 0.3759711, 1.926954, 0, 0.5960785, 1, 1,
0.06622087, -0.7287042, 1.981517, 0, 0.5921569, 1, 1,
0.06656592, 0.8685537, -1.152174, 0, 0.5843138, 1, 1,
0.0667845, -0.3215742, 1.210073, 0, 0.5803922, 1, 1,
0.06810823, -0.4648103, 2.917641, 0, 0.572549, 1, 1,
0.07194536, -1.400183, 2.15255, 0, 0.5686275, 1, 1,
0.07883364, 0.06970847, 0.6054941, 0, 0.5607843, 1, 1,
0.08366916, -1.141764, 2.572701, 0, 0.5568628, 1, 1,
0.09304429, -0.3459441, 1.260373, 0, 0.5490196, 1, 1,
0.09330251, 1.466681, -1.038754, 0, 0.5450981, 1, 1,
0.0953382, 0.4438307, 2.385224, 0, 0.5372549, 1, 1,
0.09673354, -0.2118654, 3.773966, 0, 0.5333334, 1, 1,
0.1009796, 0.4337047, 2.219272, 0, 0.5254902, 1, 1,
0.1018384, -0.6312169, 3.392684, 0, 0.5215687, 1, 1,
0.1121352, -0.7998896, 2.015949, 0, 0.5137255, 1, 1,
0.1126141, 0.3645538, -0.1370122, 0, 0.509804, 1, 1,
0.1162976, 0.2799078, 0.822069, 0, 0.5019608, 1, 1,
0.1178423, 0.9224777, 2.07254, 0, 0.4941176, 1, 1,
0.1207895, 0.8034445, -1.699883, 0, 0.4901961, 1, 1,
0.1208241, 0.9506633, 1.06469, 0, 0.4823529, 1, 1,
0.1223038, -0.8945363, 3.557412, 0, 0.4784314, 1, 1,
0.1230089, -0.2786485, 4.794303, 0, 0.4705882, 1, 1,
0.123728, 0.03757693, 1.121814, 0, 0.4666667, 1, 1,
0.1297697, -0.06090986, 1.725441, 0, 0.4588235, 1, 1,
0.1302624, 1.045831, 1.550965, 0, 0.454902, 1, 1,
0.1307065, -0.3779484, 4.88082, 0, 0.4470588, 1, 1,
0.1317876, 0.4980524, -0.04308765, 0, 0.4431373, 1, 1,
0.1336257, 0.3189593, -1.200763, 0, 0.4352941, 1, 1,
0.135501, -0.04285894, 2.193074, 0, 0.4313726, 1, 1,
0.1395201, -1.36375, 0.8557994, 0, 0.4235294, 1, 1,
0.1395344, -0.9428557, 2.354052, 0, 0.4196078, 1, 1,
0.141674, 0.9741059, -0.7162389, 0, 0.4117647, 1, 1,
0.1452873, 1.259901, 0.6864922, 0, 0.4078431, 1, 1,
0.1508352, 3.195696, -0.2657473, 0, 0.4, 1, 1,
0.1541484, -1.896297, 3.26007, 0, 0.3921569, 1, 1,
0.1556882, 0.6763858, -0.06853073, 0, 0.3882353, 1, 1,
0.1579468, 1.13543, -1.408823, 0, 0.3803922, 1, 1,
0.1581814, 0.449748, 0.2917589, 0, 0.3764706, 1, 1,
0.1589687, -0.6080791, 3.252524, 0, 0.3686275, 1, 1,
0.1594416, 0.6096137, -0.5379658, 0, 0.3647059, 1, 1,
0.1609482, -0.2548937, 2.453805, 0, 0.3568628, 1, 1,
0.1661555, -0.2133054, 2.907761, 0, 0.3529412, 1, 1,
0.1662303, -0.9159379, 2.734557, 0, 0.345098, 1, 1,
0.1719908, -0.8004684, 3.005993, 0, 0.3411765, 1, 1,
0.1733339, 0.46888, -0.09290852, 0, 0.3333333, 1, 1,
0.1763354, -0.2538349, 2.786795, 0, 0.3294118, 1, 1,
0.1788437, 1.549727, 0.4480031, 0, 0.3215686, 1, 1,
0.1878286, 0.2345083, 1.823184, 0, 0.3176471, 1, 1,
0.1885655, -1.333447, 3.310548, 0, 0.3098039, 1, 1,
0.1899441, 0.004826676, 2.542183, 0, 0.3058824, 1, 1,
0.1941471, 0.01590396, 2.216664, 0, 0.2980392, 1, 1,
0.1947724, 0.4205148, 0.118519, 0, 0.2901961, 1, 1,
0.1947946, 1.441236, 0.8741402, 0, 0.2862745, 1, 1,
0.2044332, 0.5723556, -0.8358392, 0, 0.2784314, 1, 1,
0.207704, 0.7229516, -0.226784, 0, 0.2745098, 1, 1,
0.2105519, 2.214335, 1.471248, 0, 0.2666667, 1, 1,
0.2122993, 0.3010634, 1.26811, 0, 0.2627451, 1, 1,
0.2133665, -0.5150464, 2.442652, 0, 0.254902, 1, 1,
0.2138578, 0.1573102, -1.53189, 0, 0.2509804, 1, 1,
0.2181248, -0.6044297, 1.734393, 0, 0.2431373, 1, 1,
0.2186082, -1.445722, 2.878588, 0, 0.2392157, 1, 1,
0.2196818, -0.7452579, 3.82986, 0, 0.2313726, 1, 1,
0.219917, -0.1352689, 0.9190275, 0, 0.227451, 1, 1,
0.2226848, -1.080932, 2.622895, 0, 0.2196078, 1, 1,
0.2229995, 0.5037435, 0.5980282, 0, 0.2156863, 1, 1,
0.2230222, -0.05589323, 2.328457, 0, 0.2078431, 1, 1,
0.2261141, 0.393084, -1.201113, 0, 0.2039216, 1, 1,
0.2265554, -0.4881631, 2.136509, 0, 0.1960784, 1, 1,
0.228926, 1.194629, 0.380626, 0, 0.1882353, 1, 1,
0.2300291, -1.188365, 2.94743, 0, 0.1843137, 1, 1,
0.2306981, -0.002934688, 1.355145, 0, 0.1764706, 1, 1,
0.2326329, -0.3052149, 3.10607, 0, 0.172549, 1, 1,
0.2370905, 0.630156, 2.317935, 0, 0.1647059, 1, 1,
0.2375458, -0.5629483, 3.36218, 0, 0.1607843, 1, 1,
0.2401361, -1.121675, 2.216227, 0, 0.1529412, 1, 1,
0.240635, -0.4208602, 0.5763544, 0, 0.1490196, 1, 1,
0.2449114, -0.1254344, 1.993759, 0, 0.1411765, 1, 1,
0.2487847, -1.868992, 3.687202, 0, 0.1372549, 1, 1,
0.2510211, -0.3462827, 2.306872, 0, 0.1294118, 1, 1,
0.2530859, -0.1333691, 1.032617, 0, 0.1254902, 1, 1,
0.2540089, -0.656592, 3.518927, 0, 0.1176471, 1, 1,
0.2543096, -0.1926638, -0.2117264, 0, 0.1137255, 1, 1,
0.2543211, 1.173614, -1.400763, 0, 0.1058824, 1, 1,
0.2551292, -0.5368924, 3.452477, 0, 0.09803922, 1, 1,
0.2596842, -1.192088, 4.407037, 0, 0.09411765, 1, 1,
0.2612885, -2.547321, 2.441334, 0, 0.08627451, 1, 1,
0.2620258, -1.389204, 2.326781, 0, 0.08235294, 1, 1,
0.2661152, 0.4641096, 1.799085, 0, 0.07450981, 1, 1,
0.2701948, -1.12708, 2.246693, 0, 0.07058824, 1, 1,
0.2727594, -0.2455058, 2.869808, 0, 0.0627451, 1, 1,
0.2729247, -0.2637068, 3.012311, 0, 0.05882353, 1, 1,
0.2738384, -0.7732534, 2.635839, 0, 0.05098039, 1, 1,
0.2768163, 0.0582801, -0.969864, 0, 0.04705882, 1, 1,
0.2798664, -1.109808, 2.197094, 0, 0.03921569, 1, 1,
0.284182, 1.086178, 1.531505, 0, 0.03529412, 1, 1,
0.2858865, 1.676606, 0.136193, 0, 0.02745098, 1, 1,
0.2942242, 0.556473, -2.708151, 0, 0.02352941, 1, 1,
0.2965641, 0.4687531, -0.1085406, 0, 0.01568628, 1, 1,
0.2971165, 0.8253254, 0.556855, 0, 0.01176471, 1, 1,
0.2983056, -0.189762, 3.717411, 0, 0.003921569, 1, 1,
0.2987013, 0.2521642, 1.715025, 0.003921569, 0, 1, 1,
0.2987565, -0.9497024, 3.285001, 0.007843138, 0, 1, 1,
0.3063411, 0.1825879, 0.8346233, 0.01568628, 0, 1, 1,
0.3082348, -1.175808, 1.568543, 0.01960784, 0, 1, 1,
0.3089064, 0.2313008, -0.1112786, 0.02745098, 0, 1, 1,
0.3094316, -0.1205467, 1.194758, 0.03137255, 0, 1, 1,
0.3115368, 0.8254423, 0.508023, 0.03921569, 0, 1, 1,
0.3131609, -0.07030889, 0.802587, 0.04313726, 0, 1, 1,
0.3203827, -0.2349622, 4.125242, 0.05098039, 0, 1, 1,
0.322392, -0.5472077, 3.159913, 0.05490196, 0, 1, 1,
0.3230385, -0.4893162, 2.199338, 0.0627451, 0, 1, 1,
0.3237429, -0.72874, 2.989527, 0.06666667, 0, 1, 1,
0.3237507, -0.4187073, 3.192605, 0.07450981, 0, 1, 1,
0.3249058, -0.1478019, 2.30284, 0.07843138, 0, 1, 1,
0.3250969, 1.793761, -0.1294821, 0.08627451, 0, 1, 1,
0.3352322, -0.6739448, 2.908073, 0.09019608, 0, 1, 1,
0.3361287, -0.6066813, 3.230936, 0.09803922, 0, 1, 1,
0.3368689, -1.655076, 3.124765, 0.1058824, 0, 1, 1,
0.3385756, -0.7737638, 2.263256, 0.1098039, 0, 1, 1,
0.3411067, -1.59201, 3.779734, 0.1176471, 0, 1, 1,
0.3412302, 0.1857544, 1.546514, 0.1215686, 0, 1, 1,
0.3417892, 0.3803323, 1.462923, 0.1294118, 0, 1, 1,
0.3445362, 1.73897, 0.5927891, 0.1333333, 0, 1, 1,
0.3531473, 0.9326687, -1.630528, 0.1411765, 0, 1, 1,
0.3548058, -1.00686, 3.051991, 0.145098, 0, 1, 1,
0.3556462, -1.738291, 2.367911, 0.1529412, 0, 1, 1,
0.3556951, -0.9308172, 3.367401, 0.1568628, 0, 1, 1,
0.3613032, -0.05662115, 3.008733, 0.1647059, 0, 1, 1,
0.3648551, -1.412892, 2.977274, 0.1686275, 0, 1, 1,
0.3749702, -0.8973274, 3.363676, 0.1764706, 0, 1, 1,
0.3761195, -0.3242208, 2.59263, 0.1803922, 0, 1, 1,
0.3823647, 0.4304053, 2.044675, 0.1882353, 0, 1, 1,
0.3838729, 1.020515, 0.5340099, 0.1921569, 0, 1, 1,
0.3847153, 0.3012113, -1.271016, 0.2, 0, 1, 1,
0.387269, -0.2249562, 2.760337, 0.2078431, 0, 1, 1,
0.3898629, -0.1392341, 0.5593182, 0.2117647, 0, 1, 1,
0.4004459, 1.637954, 0.05415612, 0.2196078, 0, 1, 1,
0.4043204, 0.009175427, 2.310597, 0.2235294, 0, 1, 1,
0.4046836, 0.1287743, 1.103316, 0.2313726, 0, 1, 1,
0.4072903, -2.392857, 2.30901, 0.2352941, 0, 1, 1,
0.4110924, 0.4033523, -0.8195467, 0.2431373, 0, 1, 1,
0.4112976, -0.7405319, 2.830301, 0.2470588, 0, 1, 1,
0.420534, 0.5361856, 1.14738, 0.254902, 0, 1, 1,
0.4214321, 1.587409, 2.846713, 0.2588235, 0, 1, 1,
0.4254589, -0.4975931, 2.953819, 0.2666667, 0, 1, 1,
0.429187, 1.114746, 0.1576782, 0.2705882, 0, 1, 1,
0.4354655, 0.2254306, -0.2337977, 0.2784314, 0, 1, 1,
0.4385364, -0.2571062, 0.5839756, 0.282353, 0, 1, 1,
0.440924, 0.4091776, 1.651373, 0.2901961, 0, 1, 1,
0.4423313, 2.56968, 0.5114177, 0.2941177, 0, 1, 1,
0.4456598, 0.3808076, 0.7025814, 0.3019608, 0, 1, 1,
0.4483539, 0.9947639, -1.215653, 0.3098039, 0, 1, 1,
0.4587086, -1.40727, 2.713847, 0.3137255, 0, 1, 1,
0.4626341, -0.8573112, 2.786622, 0.3215686, 0, 1, 1,
0.4658433, 2.695744, -0.3937033, 0.3254902, 0, 1, 1,
0.4734622, 0.1151185, 1.533986, 0.3333333, 0, 1, 1,
0.4739102, 0.9605935, 0.2195636, 0.3372549, 0, 1, 1,
0.4750809, 0.5051208, -0.09036337, 0.345098, 0, 1, 1,
0.4766863, 2.123696, 1.283542, 0.3490196, 0, 1, 1,
0.4900234, -0.2353995, 0.4553746, 0.3568628, 0, 1, 1,
0.4925346, -0.8797161, 2.852962, 0.3607843, 0, 1, 1,
0.495698, -0.3553344, 3.379978, 0.3686275, 0, 1, 1,
0.5010742, 0.1016519, 1.288715, 0.372549, 0, 1, 1,
0.5049275, 0.7807555, 1.672032, 0.3803922, 0, 1, 1,
0.5060269, 0.1509784, 0.6366755, 0.3843137, 0, 1, 1,
0.5085244, 0.06741546, 2.847899, 0.3921569, 0, 1, 1,
0.5111845, 0.7398326, 1.51743, 0.3960784, 0, 1, 1,
0.5186406, -0.6368003, 3.018604, 0.4039216, 0, 1, 1,
0.5204078, -0.05381702, 3.019789, 0.4117647, 0, 1, 1,
0.5401745, 0.3596453, 3.230295, 0.4156863, 0, 1, 1,
0.5496454, 1.120719, 1.041393, 0.4235294, 0, 1, 1,
0.5501784, 1.422524, -0.7486548, 0.427451, 0, 1, 1,
0.5536405, -2.270474, 3.257698, 0.4352941, 0, 1, 1,
0.5549582, 0.3239428, 0.0686676, 0.4392157, 0, 1, 1,
0.5572491, 0.1043501, -0.7694483, 0.4470588, 0, 1, 1,
0.5638369, 1.774991, 1.691395, 0.4509804, 0, 1, 1,
0.5669081, 0.7385457, 1.968777, 0.4588235, 0, 1, 1,
0.5673304, -0.270126, 3.233084, 0.4627451, 0, 1, 1,
0.5760415, -0.2442047, 1.282972, 0.4705882, 0, 1, 1,
0.5799621, -1.723052, 3.531359, 0.4745098, 0, 1, 1,
0.5836127, 1.257452, -0.2154257, 0.4823529, 0, 1, 1,
0.5863746, 0.7141453, 0.05896445, 0.4862745, 0, 1, 1,
0.5931454, -0.09669404, 2.559729, 0.4941176, 0, 1, 1,
0.5948142, 0.7931923, -0.2964802, 0.5019608, 0, 1, 1,
0.59785, -0.4480628, 1.794209, 0.5058824, 0, 1, 1,
0.6019918, -0.7639102, 1.216423, 0.5137255, 0, 1, 1,
0.6026602, -0.001002963, 0.5248425, 0.5176471, 0, 1, 1,
0.6084875, -1.233987, 4.46734, 0.5254902, 0, 1, 1,
0.6109844, -0.1754472, 1.766758, 0.5294118, 0, 1, 1,
0.6189132, -0.4734334, 2.996313, 0.5372549, 0, 1, 1,
0.6203066, -0.2576672, 1.705646, 0.5411765, 0, 1, 1,
0.6211311, -0.7993454, 1.722373, 0.5490196, 0, 1, 1,
0.6215395, -1.784494, 3.251937, 0.5529412, 0, 1, 1,
0.6253392, -0.336374, 0.9892492, 0.5607843, 0, 1, 1,
0.6345506, 0.7128748, -0.04649997, 0.5647059, 0, 1, 1,
0.6349519, -0.2921765, 1.997167, 0.572549, 0, 1, 1,
0.637201, 0.8772991, -1.193784, 0.5764706, 0, 1, 1,
0.6420435, 0.09439545, 2.582834, 0.5843138, 0, 1, 1,
0.657858, -0.7178655, 4.883605, 0.5882353, 0, 1, 1,
0.6654848, 0.2225993, 1.523483, 0.5960785, 0, 1, 1,
0.6698375, -1.400668, 4.039065, 0.6039216, 0, 1, 1,
0.6717855, -1.477555, 1.929533, 0.6078432, 0, 1, 1,
0.6724015, 1.181223, 1.628691, 0.6156863, 0, 1, 1,
0.6733354, -1.275135, 4.223352, 0.6196079, 0, 1, 1,
0.6765751, 2.183425, 0.06786072, 0.627451, 0, 1, 1,
0.6774673, -0.6661878, 3.291657, 0.6313726, 0, 1, 1,
0.6879808, 2.042304, 1.964308, 0.6392157, 0, 1, 1,
0.7012078, -0.6035521, 2.915482, 0.6431373, 0, 1, 1,
0.7021047, -1.446762, 1.264685, 0.6509804, 0, 1, 1,
0.7044765, 1.258112, 1.410297, 0.654902, 0, 1, 1,
0.7098807, -0.04329585, 3.148785, 0.6627451, 0, 1, 1,
0.713594, -0.8076036, 2.976565, 0.6666667, 0, 1, 1,
0.7146875, -0.4413005, 2.543164, 0.6745098, 0, 1, 1,
0.7231196, -1.615286, 1.309361, 0.6784314, 0, 1, 1,
0.725231, 0.3775476, 0.8731448, 0.6862745, 0, 1, 1,
0.7267378, 0.8610714, 0.5772851, 0.6901961, 0, 1, 1,
0.7281897, -1.122457, 2.77857, 0.6980392, 0, 1, 1,
0.728621, -1.975091, 2.515725, 0.7058824, 0, 1, 1,
0.7295543, 0.1615034, -0.3559663, 0.7098039, 0, 1, 1,
0.7337817, 1.146657, -0.2893947, 0.7176471, 0, 1, 1,
0.7361124, -0.9347556, 1.444417, 0.7215686, 0, 1, 1,
0.7392016, 0.9783529, 2.3352, 0.7294118, 0, 1, 1,
0.7407336, -0.09532126, 1.690518, 0.7333333, 0, 1, 1,
0.7522788, 1.252628, 0.3477878, 0.7411765, 0, 1, 1,
0.7560801, -0.4435862, 1.926251, 0.7450981, 0, 1, 1,
0.7567512, -1.447364, 1.297092, 0.7529412, 0, 1, 1,
0.7593894, -0.819093, 2.536077, 0.7568628, 0, 1, 1,
0.761255, -0.6399519, 2.69246, 0.7647059, 0, 1, 1,
0.7670202, 0.2505169, 1.65291, 0.7686275, 0, 1, 1,
0.7682549, 0.7195292, -1.214926, 0.7764706, 0, 1, 1,
0.7771833, 1.228137, -0.4630736, 0.7803922, 0, 1, 1,
0.778556, 0.00570322, 1.53365, 0.7882353, 0, 1, 1,
0.7830434, 2.562642, 0.4399907, 0.7921569, 0, 1, 1,
0.7879329, -0.2430711, 0.5350623, 0.8, 0, 1, 1,
0.7905619, -0.6344587, 3.024965, 0.8078431, 0, 1, 1,
0.7923474, 0.4509503, -0.2869824, 0.8117647, 0, 1, 1,
0.7942023, -0.1076458, 0.2982103, 0.8196079, 0, 1, 1,
0.7985611, 0.108628, 1.575163, 0.8235294, 0, 1, 1,
0.805347, -0.5370529, 2.680464, 0.8313726, 0, 1, 1,
0.8091771, 0.288042, 1.565229, 0.8352941, 0, 1, 1,
0.8094482, -0.5875388, 2.945187, 0.8431373, 0, 1, 1,
0.8236949, -0.0849575, -0.3597153, 0.8470588, 0, 1, 1,
0.8333716, -0.04581646, 1.370639, 0.854902, 0, 1, 1,
0.8376743, -0.7698725, 1.574188, 0.8588235, 0, 1, 1,
0.8523132, -0.6685375, 3.112033, 0.8666667, 0, 1, 1,
0.8525895, 1.013254, 0.8496877, 0.8705882, 0, 1, 1,
0.8615724, -1.472047, 1.669667, 0.8784314, 0, 1, 1,
0.8646321, -0.1861632, 2.443427, 0.8823529, 0, 1, 1,
0.8646827, 0.7199435, -0.2937685, 0.8901961, 0, 1, 1,
0.8728601, 0.06909579, 0.769725, 0.8941177, 0, 1, 1,
0.8737239, 1.502491, -0.2854533, 0.9019608, 0, 1, 1,
0.8739691, 0.5373926, 0.2581621, 0.9098039, 0, 1, 1,
0.8769917, 2.758334, -0.5295724, 0.9137255, 0, 1, 1,
0.8865287, -0.9542997, 1.868526, 0.9215686, 0, 1, 1,
0.891237, -1.792278, 4.038931, 0.9254902, 0, 1, 1,
0.8923005, -0.05877654, 2.494931, 0.9333333, 0, 1, 1,
0.9014467, 0.8529768, -0.0585621, 0.9372549, 0, 1, 1,
0.9042701, 0.704402, 1.278169, 0.945098, 0, 1, 1,
0.9110392, 0.8681255, 1.404944, 0.9490196, 0, 1, 1,
0.9194632, -0.4689554, 2.542025, 0.9568627, 0, 1, 1,
0.9266582, -1.877876, 4.202672, 0.9607843, 0, 1, 1,
0.9350006, 0.3640171, 0.9089075, 0.9686275, 0, 1, 1,
0.940457, -0.3369558, 3.96632, 0.972549, 0, 1, 1,
0.9442025, -0.01471472, 1.112838, 0.9803922, 0, 1, 1,
0.9446545, 0.2512605, 1.864624, 0.9843137, 0, 1, 1,
0.9509161, 2.537009, 0.690149, 0.9921569, 0, 1, 1,
0.9511028, -0.3359379, 1.777789, 0.9960784, 0, 1, 1,
0.9518915, -2.689564, 3.32136, 1, 0, 0.9960784, 1,
0.9520697, -0.655997, 1.892866, 1, 0, 0.9882353, 1,
0.9550292, 0.6368001, 1.169735, 1, 0, 0.9843137, 1,
0.9660215, -0.08107461, 0.9532106, 1, 0, 0.9764706, 1,
0.9722072, -0.746985, 4.269999, 1, 0, 0.972549, 1,
0.9845332, -0.3688533, 1.719725, 1, 0, 0.9647059, 1,
0.9850771, 1.325152, 0.2088996, 1, 0, 0.9607843, 1,
0.9941132, -0.8851407, 1.851129, 1, 0, 0.9529412, 1,
0.9962351, -1.186111, 2.377777, 1, 0, 0.9490196, 1,
0.9967408, 1.006251, 1.09079, 1, 0, 0.9411765, 1,
0.9999706, 2.468234, -0.2695328, 1, 0, 0.9372549, 1,
1.004268, -0.4739948, -0.1162108, 1, 0, 0.9294118, 1,
1.007738, 0.3686059, 0.7377105, 1, 0, 0.9254902, 1,
1.009941, -0.8825178, 2.198734, 1, 0, 0.9176471, 1,
1.01484, 0.6997378, 2.025414, 1, 0, 0.9137255, 1,
1.015028, 0.4029139, 1.456374, 1, 0, 0.9058824, 1,
1.018789, -0.1791735, 1.290801, 1, 0, 0.9019608, 1,
1.025335, 1.136183, 1.777383, 1, 0, 0.8941177, 1,
1.030655, 1.43002, 1.600449, 1, 0, 0.8862745, 1,
1.032552, 0.06414302, -0.1062572, 1, 0, 0.8823529, 1,
1.035084, 0.469205, 2.59272, 1, 0, 0.8745098, 1,
1.037896, 1.096266, -0.682108, 1, 0, 0.8705882, 1,
1.038326, 0.02399558, 2.526213, 1, 0, 0.8627451, 1,
1.042174, -0.9320064, 1.730864, 1, 0, 0.8588235, 1,
1.043612, -0.4992967, 2.097068, 1, 0, 0.8509804, 1,
1.046624, 0.9565787, -0.4945413, 1, 0, 0.8470588, 1,
1.049575, -1.018277, 1.116615, 1, 0, 0.8392157, 1,
1.049917, 0.2973761, 1.67817, 1, 0, 0.8352941, 1,
1.050104, 0.6633793, 1.484199, 1, 0, 0.827451, 1,
1.058463, 1.084388, 0.4680071, 1, 0, 0.8235294, 1,
1.059893, -0.652904, 2.609245, 1, 0, 0.8156863, 1,
1.063789, 0.8357791, 1.739714, 1, 0, 0.8117647, 1,
1.065643, -0.4798993, 2.673197, 1, 0, 0.8039216, 1,
1.072226, 0.9477262, 1.134384, 1, 0, 0.7960784, 1,
1.074352, -1.797169, 2.942708, 1, 0, 0.7921569, 1,
1.082019, 0.2468015, 0.1460561, 1, 0, 0.7843137, 1,
1.085008, 1.487925, 0.6267094, 1, 0, 0.7803922, 1,
1.092627, 0.7142654, -0.5437711, 1, 0, 0.772549, 1,
1.103221, 1.023416, 0.6768938, 1, 0, 0.7686275, 1,
1.110707, 2.104178, 1.777344, 1, 0, 0.7607843, 1,
1.113217, 0.9057236, 0.1078742, 1, 0, 0.7568628, 1,
1.11327, -0.09304939, 1.871118, 1, 0, 0.7490196, 1,
1.119322, -0.933382, 1.304109, 1, 0, 0.7450981, 1,
1.133445, -1.716604, 3.317704, 1, 0, 0.7372549, 1,
1.136769, 0.259363, 0.6631244, 1, 0, 0.7333333, 1,
1.138879, -0.5602759, 1.63218, 1, 0, 0.7254902, 1,
1.14011, -0.4042796, 1.580417, 1, 0, 0.7215686, 1,
1.140578, -1.548629, 3.946213, 1, 0, 0.7137255, 1,
1.14247, -0.47291, 2.817034, 1, 0, 0.7098039, 1,
1.147941, -0.2833786, 0.6333137, 1, 0, 0.7019608, 1,
1.16384, -0.2491287, 2.847833, 1, 0, 0.6941177, 1,
1.168726, -0.3097579, 1.769933, 1, 0, 0.6901961, 1,
1.177163, -0.5749725, 1.336229, 1, 0, 0.682353, 1,
1.178705, 1.041175, -1.5736, 1, 0, 0.6784314, 1,
1.187787, 1.204346, 1.391068, 1, 0, 0.6705883, 1,
1.215935, 0.01631258, 1.869761, 1, 0, 0.6666667, 1,
1.217086, -1.362533, 1.400836, 1, 0, 0.6588235, 1,
1.218457, 0.1279074, 0.9634929, 1, 0, 0.654902, 1,
1.220455, -0.09557763, 3.680927, 1, 0, 0.6470588, 1,
1.221724, 0.7413728, 0.1990709, 1, 0, 0.6431373, 1,
1.241003, -1.631053, 1.197734, 1, 0, 0.6352941, 1,
1.241447, -1.402326, 0.9241917, 1, 0, 0.6313726, 1,
1.251209, 0.7808121, 0.9220875, 1, 0, 0.6235294, 1,
1.258924, -0.934734, 3.545051, 1, 0, 0.6196079, 1,
1.264087, 1.559941, 0.8816976, 1, 0, 0.6117647, 1,
1.280928, -0.3955062, 1.727628, 1, 0, 0.6078432, 1,
1.299754, 0.6113428, 2.365499, 1, 0, 0.6, 1,
1.30563, 1.577077, 0.8051214, 1, 0, 0.5921569, 1,
1.306726, 1.759092, 1.065656, 1, 0, 0.5882353, 1,
1.307701, -1.637198, 4.325049, 1, 0, 0.5803922, 1,
1.310732, -1.622357, 2.259468, 1, 0, 0.5764706, 1,
1.317408, 0.3319147, 3.0077, 1, 0, 0.5686275, 1,
1.323421, -0.633518, 2.948087, 1, 0, 0.5647059, 1,
1.335657, 0.2729597, 1.548232, 1, 0, 0.5568628, 1,
1.341468, 1.782397, -0.05754634, 1, 0, 0.5529412, 1,
1.345513, -0.7896336, 2.812552, 1, 0, 0.5450981, 1,
1.347747, 0.7527143, 2.520302, 1, 0, 0.5411765, 1,
1.347789, -1.14665, 2.382275, 1, 0, 0.5333334, 1,
1.364671, -0.2423563, 0.9574796, 1, 0, 0.5294118, 1,
1.366081, -0.1990658, -0.2205314, 1, 0, 0.5215687, 1,
1.371466, -0.1613141, 2.266142, 1, 0, 0.5176471, 1,
1.373719, -0.2237788, 2.255526, 1, 0, 0.509804, 1,
1.373994, -1.611937, 1.49129, 1, 0, 0.5058824, 1,
1.376563, 1.671713, 0.5309927, 1, 0, 0.4980392, 1,
1.37858, -1.218558, 3.337383, 1, 0, 0.4901961, 1,
1.378694, 1.18292, -0.9629607, 1, 0, 0.4862745, 1,
1.378959, -1.520533, 2.612865, 1, 0, 0.4784314, 1,
1.393764, 2.295779, 1.807836, 1, 0, 0.4745098, 1,
1.397108, -2.227444, 1.743644, 1, 0, 0.4666667, 1,
1.402776, 0.131659, -0.02129254, 1, 0, 0.4627451, 1,
1.409055, 0.03038035, 1.600309, 1, 0, 0.454902, 1,
1.411779, -0.1523862, 1.547, 1, 0, 0.4509804, 1,
1.412456, 0.8417603, -0.6537903, 1, 0, 0.4431373, 1,
1.422402, -1.249076, 2.819211, 1, 0, 0.4392157, 1,
1.44357, 0.765762, 1.896712, 1, 0, 0.4313726, 1,
1.45515, 0.8563767, 0.2084063, 1, 0, 0.427451, 1,
1.463971, 0.9231513, 1.556451, 1, 0, 0.4196078, 1,
1.464051, -1.235814, 3.068578, 1, 0, 0.4156863, 1,
1.469074, -0.1864618, 1.163162, 1, 0, 0.4078431, 1,
1.482131, -0.9131578, 1.90113, 1, 0, 0.4039216, 1,
1.483021, 1.252159, 0.2958063, 1, 0, 0.3960784, 1,
1.494177, -1.091747, 1.604412, 1, 0, 0.3882353, 1,
1.510475, 0.9736076, 0.2123711, 1, 0, 0.3843137, 1,
1.524425, 0.3180841, 1.244542, 1, 0, 0.3764706, 1,
1.525375, -0.8731118, 4.055947, 1, 0, 0.372549, 1,
1.526275, -1.009098, 0.1113092, 1, 0, 0.3647059, 1,
1.526855, -0.2783452, 0.6167185, 1, 0, 0.3607843, 1,
1.536183, -1.450184, 2.98995, 1, 0, 0.3529412, 1,
1.537794, 1.38044, 0.8393501, 1, 0, 0.3490196, 1,
1.539332, -0.8949154, 1.507047, 1, 0, 0.3411765, 1,
1.542937, 0.1758464, 3.021256, 1, 0, 0.3372549, 1,
1.543781, 2.451485, 0.6603197, 1, 0, 0.3294118, 1,
1.546213, 0.1628103, 2.343767, 1, 0, 0.3254902, 1,
1.559479, -0.1640703, 1.560288, 1, 0, 0.3176471, 1,
1.579058, -0.1220943, 1.710731, 1, 0, 0.3137255, 1,
1.588079, 0.1579092, 1.82834, 1, 0, 0.3058824, 1,
1.591394, 0.3866176, 2.615997, 1, 0, 0.2980392, 1,
1.599316, -0.2123788, -0.9498734, 1, 0, 0.2941177, 1,
1.599368, 1.580694, 0.4781668, 1, 0, 0.2862745, 1,
1.624933, -0.5421205, 0.3945611, 1, 0, 0.282353, 1,
1.625187, 0.7161366, -0.8548613, 1, 0, 0.2745098, 1,
1.651878, 1.081746, -0.3349357, 1, 0, 0.2705882, 1,
1.652496, -0.5253404, 2.010143, 1, 0, 0.2627451, 1,
1.65429, -1.076063, 4.11053, 1, 0, 0.2588235, 1,
1.664484, -0.6977143, 1.199737, 1, 0, 0.2509804, 1,
1.669097, 0.02271619, 0.6870432, 1, 0, 0.2470588, 1,
1.67143, -1.610997, 2.288125, 1, 0, 0.2392157, 1,
1.683725, 1.168715, -0.651457, 1, 0, 0.2352941, 1,
1.701307, 0.5262247, 0.4157026, 1, 0, 0.227451, 1,
1.704951, -1.165692, 0.3737619, 1, 0, 0.2235294, 1,
1.705775, -0.3234017, 1.465784, 1, 0, 0.2156863, 1,
1.756205, 0.1603759, -0.1324281, 1, 0, 0.2117647, 1,
1.75923, 1.395636, 1.820277, 1, 0, 0.2039216, 1,
1.765721, -0.2513541, 0.8233652, 1, 0, 0.1960784, 1,
1.767577, -2.239911, 3.737495, 1, 0, 0.1921569, 1,
1.802588, 0.3947256, 1.335738, 1, 0, 0.1843137, 1,
1.804574, 1.730257, 0.8261917, 1, 0, 0.1803922, 1,
1.834086, -0.6793767, 1.9815, 1, 0, 0.172549, 1,
1.845999, 0.7107487, 0.9294001, 1, 0, 0.1686275, 1,
1.852863, -0.449551, 2.769063, 1, 0, 0.1607843, 1,
1.870627, 0.1592084, 2.523452, 1, 0, 0.1568628, 1,
1.87365, 0.802022, 0.7767332, 1, 0, 0.1490196, 1,
1.889262, -0.434361, 1.75773, 1, 0, 0.145098, 1,
1.967727, -0.8714302, 2.171149, 1, 0, 0.1372549, 1,
1.977329, -0.414452, 0.6833318, 1, 0, 0.1333333, 1,
1.983694, -0.3370933, 1.338955, 1, 0, 0.1254902, 1,
1.992231, 0.8675647, -1.050513, 1, 0, 0.1215686, 1,
1.994214, 1.81828, 0.6723534, 1, 0, 0.1137255, 1,
2.004485, -1.803706, 2.040006, 1, 0, 0.1098039, 1,
2.005833, 1.317402, -0.4006428, 1, 0, 0.1019608, 1,
2.007501, -0.3763277, 3.401386, 1, 0, 0.09411765, 1,
2.06624, -1.104517, 3.508505, 1, 0, 0.09019608, 1,
2.078055, 0.5443092, 1.185302, 1, 0, 0.08235294, 1,
2.109863, 0.4657735, 1.163442, 1, 0, 0.07843138, 1,
2.118037, -1.243443, 1.324303, 1, 0, 0.07058824, 1,
2.134931, -1.240526, 1.740102, 1, 0, 0.06666667, 1,
2.152243, 0.04368802, 3.464428, 1, 0, 0.05882353, 1,
2.225391, 1.509443, 1.507024, 1, 0, 0.05490196, 1,
2.275078, -1.231069, 3.588105, 1, 0, 0.04705882, 1,
2.371725, 0.1684971, 1.284917, 1, 0, 0.04313726, 1,
2.417447, -0.5111537, 0.5484375, 1, 0, 0.03529412, 1,
2.479883, 0.6394258, 1.865195, 1, 0, 0.03137255, 1,
2.487366, -1.355003, 3.310063, 1, 0, 0.02352941, 1,
2.577772, -0.6679972, 1.056859, 1, 0, 0.01960784, 1,
2.677774, 0.561699, 0.8240212, 1, 0, 0.01176471, 1,
2.96123, 0.6369846, 1.053704, 1, 0, 0.007843138, 1
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
-0.3558863, -3.826901, -7.883283, 0, -0.5, 0.5, 0.5,
-0.3558863, -3.826901, -7.883283, 1, -0.5, 0.5, 0.5,
-0.3558863, -3.826901, -7.883283, 1, 1.5, 0.5, 0.5,
-0.3558863, -3.826901, -7.883283, 0, 1.5, 0.5, 0.5
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
-4.797505, 0.1933031, -7.883283, 0, -0.5, 0.5, 0.5,
-4.797505, 0.1933031, -7.883283, 1, -0.5, 0.5, 0.5,
-4.797505, 0.1933031, -7.883283, 1, 1.5, 0.5, 0.5,
-4.797505, 0.1933031, -7.883283, 0, 1.5, 0.5, 0.5
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
-4.797505, -3.826901, -0.5247288, 0, -0.5, 0.5, 0.5,
-4.797505, -3.826901, -0.5247288, 1, -0.5, 0.5, 0.5,
-4.797505, -3.826901, -0.5247288, 1, 1.5, 0.5, 0.5,
-4.797505, -3.826901, -0.5247288, 0, 1.5, 0.5, 0.5
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
-3, -2.899162, -6.185155,
2, -2.899162, -6.185155,
-3, -2.899162, -6.185155,
-3, -3.053785, -6.468176,
-2, -2.899162, -6.185155,
-2, -3.053785, -6.468176,
-1, -2.899162, -6.185155,
-1, -3.053785, -6.468176,
0, -2.899162, -6.185155,
0, -3.053785, -6.468176,
1, -2.899162, -6.185155,
1, -3.053785, -6.468176,
2, -2.899162, -6.185155,
2, -3.053785, -6.468176
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
-3, -3.363032, -7.034219, 0, -0.5, 0.5, 0.5,
-3, -3.363032, -7.034219, 1, -0.5, 0.5, 0.5,
-3, -3.363032, -7.034219, 1, 1.5, 0.5, 0.5,
-3, -3.363032, -7.034219, 0, 1.5, 0.5, 0.5,
-2, -3.363032, -7.034219, 0, -0.5, 0.5, 0.5,
-2, -3.363032, -7.034219, 1, -0.5, 0.5, 0.5,
-2, -3.363032, -7.034219, 1, 1.5, 0.5, 0.5,
-2, -3.363032, -7.034219, 0, 1.5, 0.5, 0.5,
-1, -3.363032, -7.034219, 0, -0.5, 0.5, 0.5,
-1, -3.363032, -7.034219, 1, -0.5, 0.5, 0.5,
-1, -3.363032, -7.034219, 1, 1.5, 0.5, 0.5,
-1, -3.363032, -7.034219, 0, 1.5, 0.5, 0.5,
0, -3.363032, -7.034219, 0, -0.5, 0.5, 0.5,
0, -3.363032, -7.034219, 1, -0.5, 0.5, 0.5,
0, -3.363032, -7.034219, 1, 1.5, 0.5, 0.5,
0, -3.363032, -7.034219, 0, 1.5, 0.5, 0.5,
1, -3.363032, -7.034219, 0, -0.5, 0.5, 0.5,
1, -3.363032, -7.034219, 1, -0.5, 0.5, 0.5,
1, -3.363032, -7.034219, 1, 1.5, 0.5, 0.5,
1, -3.363032, -7.034219, 0, 1.5, 0.5, 0.5,
2, -3.363032, -7.034219, 0, -0.5, 0.5, 0.5,
2, -3.363032, -7.034219, 1, -0.5, 0.5, 0.5,
2, -3.363032, -7.034219, 1, 1.5, 0.5, 0.5,
2, -3.363032, -7.034219, 0, 1.5, 0.5, 0.5
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
-3.772516, -2, -6.185155,
-3.772516, 3, -6.185155,
-3.772516, -2, -6.185155,
-3.943347, -2, -6.468176,
-3.772516, -1, -6.185155,
-3.943347, -1, -6.468176,
-3.772516, 0, -6.185155,
-3.943347, 0, -6.468176,
-3.772516, 1, -6.185155,
-3.943347, 1, -6.468176,
-3.772516, 2, -6.185155,
-3.943347, 2, -6.468176,
-3.772516, 3, -6.185155,
-3.943347, 3, -6.468176
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
-4.28501, -2, -7.034219, 0, -0.5, 0.5, 0.5,
-4.28501, -2, -7.034219, 1, -0.5, 0.5, 0.5,
-4.28501, -2, -7.034219, 1, 1.5, 0.5, 0.5,
-4.28501, -2, -7.034219, 0, 1.5, 0.5, 0.5,
-4.28501, -1, -7.034219, 0, -0.5, 0.5, 0.5,
-4.28501, -1, -7.034219, 1, -0.5, 0.5, 0.5,
-4.28501, -1, -7.034219, 1, 1.5, 0.5, 0.5,
-4.28501, -1, -7.034219, 0, 1.5, 0.5, 0.5,
-4.28501, 0, -7.034219, 0, -0.5, 0.5, 0.5,
-4.28501, 0, -7.034219, 1, -0.5, 0.5, 0.5,
-4.28501, 0, -7.034219, 1, 1.5, 0.5, 0.5,
-4.28501, 0, -7.034219, 0, 1.5, 0.5, 0.5,
-4.28501, 1, -7.034219, 0, -0.5, 0.5, 0.5,
-4.28501, 1, -7.034219, 1, -0.5, 0.5, 0.5,
-4.28501, 1, -7.034219, 1, 1.5, 0.5, 0.5,
-4.28501, 1, -7.034219, 0, 1.5, 0.5, 0.5,
-4.28501, 2, -7.034219, 0, -0.5, 0.5, 0.5,
-4.28501, 2, -7.034219, 1, -0.5, 0.5, 0.5,
-4.28501, 2, -7.034219, 1, 1.5, 0.5, 0.5,
-4.28501, 2, -7.034219, 0, 1.5, 0.5, 0.5,
-4.28501, 3, -7.034219, 0, -0.5, 0.5, 0.5,
-4.28501, 3, -7.034219, 1, -0.5, 0.5, 0.5,
-4.28501, 3, -7.034219, 1, 1.5, 0.5, 0.5,
-4.28501, 3, -7.034219, 0, 1.5, 0.5, 0.5
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
-3.772516, -2.899162, -6,
-3.772516, -2.899162, 4,
-3.772516, -2.899162, -6,
-3.943347, -3.053785, -6,
-3.772516, -2.899162, -4,
-3.943347, -3.053785, -4,
-3.772516, -2.899162, -2,
-3.943347, -3.053785, -2,
-3.772516, -2.899162, 0,
-3.943347, -3.053785, 0,
-3.772516, -2.899162, 2,
-3.943347, -3.053785, 2,
-3.772516, -2.899162, 4,
-3.943347, -3.053785, 4
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
-4.28501, -3.363032, -6, 0, -0.5, 0.5, 0.5,
-4.28501, -3.363032, -6, 1, -0.5, 0.5, 0.5,
-4.28501, -3.363032, -6, 1, 1.5, 0.5, 0.5,
-4.28501, -3.363032, -6, 0, 1.5, 0.5, 0.5,
-4.28501, -3.363032, -4, 0, -0.5, 0.5, 0.5,
-4.28501, -3.363032, -4, 1, -0.5, 0.5, 0.5,
-4.28501, -3.363032, -4, 1, 1.5, 0.5, 0.5,
-4.28501, -3.363032, -4, 0, 1.5, 0.5, 0.5,
-4.28501, -3.363032, -2, 0, -0.5, 0.5, 0.5,
-4.28501, -3.363032, -2, 1, -0.5, 0.5, 0.5,
-4.28501, -3.363032, -2, 1, 1.5, 0.5, 0.5,
-4.28501, -3.363032, -2, 0, 1.5, 0.5, 0.5,
-4.28501, -3.363032, 0, 0, -0.5, 0.5, 0.5,
-4.28501, -3.363032, 0, 1, -0.5, 0.5, 0.5,
-4.28501, -3.363032, 0, 1, 1.5, 0.5, 0.5,
-4.28501, -3.363032, 0, 0, 1.5, 0.5, 0.5,
-4.28501, -3.363032, 2, 0, -0.5, 0.5, 0.5,
-4.28501, -3.363032, 2, 1, -0.5, 0.5, 0.5,
-4.28501, -3.363032, 2, 1, 1.5, 0.5, 0.5,
-4.28501, -3.363032, 2, 0, 1.5, 0.5, 0.5,
-4.28501, -3.363032, 4, 0, -0.5, 0.5, 0.5,
-4.28501, -3.363032, 4, 1, -0.5, 0.5, 0.5,
-4.28501, -3.363032, 4, 1, 1.5, 0.5, 0.5,
-4.28501, -3.363032, 4, 0, 1.5, 0.5, 0.5
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
-3.772516, -2.899162, -6.185155,
-3.772516, 3.285768, -6.185155,
-3.772516, -2.899162, 5.135698,
-3.772516, 3.285768, 5.135698,
-3.772516, -2.899162, -6.185155,
-3.772516, -2.899162, 5.135698,
-3.772516, 3.285768, -6.185155,
-3.772516, 3.285768, 5.135698,
-3.772516, -2.899162, -6.185155,
3.060743, -2.899162, -6.185155,
-3.772516, -2.899162, 5.135698,
3.060743, -2.899162, 5.135698,
-3.772516, 3.285768, -6.185155,
3.060743, 3.285768, -6.185155,
-3.772516, 3.285768, 5.135698,
3.060743, 3.285768, 5.135698,
3.060743, -2.899162, -6.185155,
3.060743, 3.285768, -6.185155,
3.060743, -2.899162, 5.135698,
3.060743, 3.285768, 5.135698,
3.060743, -2.899162, -6.185155,
3.060743, -2.899162, 5.135698,
3.060743, 3.285768, -6.185155,
3.060743, 3.285768, 5.135698
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
var radius = 7.795175;
var distance = 34.68161;
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
mvMatrix.translate( 0.3558863, -0.1933031, 0.5247288 );
mvMatrix.scale( 1.233423, 1.362715, 0.744493 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.68161);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
depen<-read.table("depen.xyz")
```

```
## Error in read.table("depen.xyz"): no lines available in input
```

```r
x<-depen$V2
```

```
## Error in eval(expr, envir, enclos): object 'depen' not found
```

```r
y<-depen$V3
```

```
## Error in eval(expr, envir, enclos): object 'depen' not found
```

```r
z<-depen$V4
```

```
## Error in eval(expr, envir, enclos): object 'depen' not found
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
-3.673002, -0.1034152, -2.088676, 0, 0, 1, 1, 1,
-3.113151, -1.035412, -0.6052661, 1, 0, 0, 1, 1,
-2.992001, 0.2121103, -2.800059, 1, 0, 0, 1, 1,
-2.789751, 1.098374, -2.914326, 1, 0, 0, 1, 1,
-2.72133, 1.241895, -1.021597, 1, 0, 0, 1, 1,
-2.684153, -0.1031981, -1.499485, 1, 0, 0, 1, 1,
-2.640778, 0.7706099, -0.4645256, 0, 0, 0, 1, 1,
-2.600639, 1.132405, -0.9106105, 0, 0, 0, 1, 1,
-2.579675, 1.022824, -2.612561, 0, 0, 0, 1, 1,
-2.574335, -0.5934719, -1.998005, 0, 0, 0, 1, 1,
-2.451849, -1.121243, -1.653512, 0, 0, 0, 1, 1,
-2.435321, 0.9064645, -0.4929098, 0, 0, 0, 1, 1,
-2.407343, -0.5213408, -2.224446, 0, 0, 0, 1, 1,
-2.366838, -0.9729566, -0.5013903, 1, 1, 1, 1, 1,
-2.347021, -0.2292759, -3.656808, 1, 1, 1, 1, 1,
-2.315754, 1.023271, 0.4354397, 1, 1, 1, 1, 1,
-2.315634, 1.346834, -0.04586134, 1, 1, 1, 1, 1,
-2.302111, -0.5927822, -1.922272, 1, 1, 1, 1, 1,
-2.287083, -0.1459901, -1.699037, 1, 1, 1, 1, 1,
-2.27285, -0.2565117, -1.57131, 1, 1, 1, 1, 1,
-2.13594, -0.1726722, -0.5533487, 1, 1, 1, 1, 1,
-2.132537, -0.555353, -1.172842, 1, 1, 1, 1, 1,
-2.117044, 0.8861473, -1.647983, 1, 1, 1, 1, 1,
-2.114971, 1.585081, -2.011808, 1, 1, 1, 1, 1,
-2.10089, -0.1304349, -1.131237, 1, 1, 1, 1, 1,
-2.092605, -0.3141035, -1.05047, 1, 1, 1, 1, 1,
-2.083904, 1.173745, -1.900445, 1, 1, 1, 1, 1,
-2.064789, -0.03140261, -2.183189, 1, 1, 1, 1, 1,
-2.060544, -2.233005, -3.139639, 0, 0, 1, 1, 1,
-2.031463, 0.0998556, -1.023814, 1, 0, 0, 1, 1,
-2.01245, -0.835228, -2.48877, 1, 0, 0, 1, 1,
-1.999986, -1.807745, -5.278134, 1, 0, 0, 1, 1,
-1.980096, -0.599998, -2.1592, 1, 0, 0, 1, 1,
-1.972617, 0.003962994, -2.262032, 1, 0, 0, 1, 1,
-1.954309, -0.7048921, -3.106411, 0, 0, 0, 1, 1,
-1.934425, 0.491171, -2.960812, 0, 0, 0, 1, 1,
-1.917088, -1.043685, 0.9185399, 0, 0, 0, 1, 1,
-1.90439, -0.7579995, -1.852897, 0, 0, 0, 1, 1,
-1.893268, 0.6637637, -1.989379, 0, 0, 0, 1, 1,
-1.892456, -0.7296174, -2.773128, 0, 0, 0, 1, 1,
-1.890734, 0.8229938, -0.4570701, 0, 0, 0, 1, 1,
-1.88796, -1.092439, -2.860119, 1, 1, 1, 1, 1,
-1.882589, 0.3226207, 0.6585706, 1, 1, 1, 1, 1,
-1.876497, -0.09175858, -1.122929, 1, 1, 1, 1, 1,
-1.871202, -0.8257686, -2.235096, 1, 1, 1, 1, 1,
-1.86149, -1.194953, -0.1846458, 1, 1, 1, 1, 1,
-1.856187, 0.992408, -1.949614, 1, 1, 1, 1, 1,
-1.835448, -0.08674921, -1.79927, 1, 1, 1, 1, 1,
-1.831112, -0.2601101, -2.015855, 1, 1, 1, 1, 1,
-1.819455, 0.09848966, -0.7471143, 1, 1, 1, 1, 1,
-1.81652, -0.6749058, -2.382305, 1, 1, 1, 1, 1,
-1.790095, 0.1594771, -1.421098, 1, 1, 1, 1, 1,
-1.789844, -0.7001932, -2.656242, 1, 1, 1, 1, 1,
-1.768879, -1.634014, -0.9467883, 1, 1, 1, 1, 1,
-1.753654, 0.9260389, -2.05948, 1, 1, 1, 1, 1,
-1.744474, 0.908591, -0.7325648, 1, 1, 1, 1, 1,
-1.677002, -1.666867, -0.9734936, 0, 0, 1, 1, 1,
-1.670174, 1.764677, -1.700498, 1, 0, 0, 1, 1,
-1.665374, 1.990373, -0.765525, 1, 0, 0, 1, 1,
-1.660163, 1.526545, -0.08133456, 1, 0, 0, 1, 1,
-1.645962, 0.658521, -1.201007, 1, 0, 0, 1, 1,
-1.640163, 0.7252269, 0.101151, 1, 0, 0, 1, 1,
-1.638342, -2.80909, -3.11095, 0, 0, 0, 1, 1,
-1.637767, -0.2500959, -0.2009707, 0, 0, 0, 1, 1,
-1.635305, 0.07674295, -2.837307, 0, 0, 0, 1, 1,
-1.624572, 0.1267202, -2.50497, 0, 0, 0, 1, 1,
-1.623864, 0.1144485, -1.470773, 0, 0, 0, 1, 1,
-1.620844, -0.1271186, -1.890839, 0, 0, 0, 1, 1,
-1.61992, -0.9518203, -2.978605, 0, 0, 0, 1, 1,
-1.616584, 0.4656979, 0.2358529, 1, 1, 1, 1, 1,
-1.601934, -0.9082514, -1.597179, 1, 1, 1, 1, 1,
-1.601235, 0.22524, -1.023738, 1, 1, 1, 1, 1,
-1.600852, -1.027534, -1.771374, 1, 1, 1, 1, 1,
-1.590895, 0.2931658, -0.6963924, 1, 1, 1, 1, 1,
-1.582808, -0.4138847, -1.73208, 1, 1, 1, 1, 1,
-1.579628, -0.5638077, -4.017237, 1, 1, 1, 1, 1,
-1.57672, 1.838738, -1.933638, 1, 1, 1, 1, 1,
-1.563812, -0.9663386, -1.10548, 1, 1, 1, 1, 1,
-1.563536, 0.5346721, 0.1701601, 1, 1, 1, 1, 1,
-1.559935, -0.5878134, -3.890962, 1, 1, 1, 1, 1,
-1.559194, -1.029487, -3.210932, 1, 1, 1, 1, 1,
-1.557631, -0.07757929, -1.264502, 1, 1, 1, 1, 1,
-1.556228, 0.3579894, -1.155706, 1, 1, 1, 1, 1,
-1.554955, -0.9940662, -1.828637, 1, 1, 1, 1, 1,
-1.536753, -1.762491, -1.462609, 0, 0, 1, 1, 1,
-1.533643, -0.239036, -2.503546, 1, 0, 0, 1, 1,
-1.529755, 0.007770323, -0.3142992, 1, 0, 0, 1, 1,
-1.507909, -0.847207, -1.091523, 1, 0, 0, 1, 1,
-1.504265, -0.2483122, -2.750866, 1, 0, 0, 1, 1,
-1.486557, 0.5504288, -1.703671, 1, 0, 0, 1, 1,
-1.483417, -0.4262337, -2.992295, 0, 0, 0, 1, 1,
-1.473686, -0.7086737, -2.876574, 0, 0, 0, 1, 1,
-1.473325, -0.3854011, -1.260842, 0, 0, 0, 1, 1,
-1.472546, -2.442929, -1.084384, 0, 0, 0, 1, 1,
-1.469139, -0.2806986, -2.036775, 0, 0, 0, 1, 1,
-1.453739, 0.4647177, -0.9350047, 0, 0, 0, 1, 1,
-1.449152, 0.6006157, -0.3347513, 0, 0, 0, 1, 1,
-1.446917, 0.05707106, -1.741686, 1, 1, 1, 1, 1,
-1.444757, 0.2213414, -3.199814, 1, 1, 1, 1, 1,
-1.440355, 0.3880875, -0.4387956, 1, 1, 1, 1, 1,
-1.425556, 0.1837574, -1.526816, 1, 1, 1, 1, 1,
-1.412913, -0.7211916, -3.261724, 1, 1, 1, 1, 1,
-1.412832, -0.7865646, -3.760727, 1, 1, 1, 1, 1,
-1.41009, 0.3676573, -0.6973506, 1, 1, 1, 1, 1,
-1.406361, -0.8434629, -1.255478, 1, 1, 1, 1, 1,
-1.403018, 0.09763008, -0.4757286, 1, 1, 1, 1, 1,
-1.387719, -0.8250396, -1.963693, 1, 1, 1, 1, 1,
-1.385852, -0.2062859, -1.013555, 1, 1, 1, 1, 1,
-1.383617, -0.05904402, -1.602398, 1, 1, 1, 1, 1,
-1.382512, 1.495998, -1.476961, 1, 1, 1, 1, 1,
-1.375515, -1.647436, -2.641382, 1, 1, 1, 1, 1,
-1.372451, -0.4550707, -1.251672, 1, 1, 1, 1, 1,
-1.364806, -0.004476074, -1.159475, 0, 0, 1, 1, 1,
-1.361591, -0.3273304, -2.428387, 1, 0, 0, 1, 1,
-1.35833, 0.3666755, -0.7506282, 1, 0, 0, 1, 1,
-1.348281, -0.3902822, -2.284276, 1, 0, 0, 1, 1,
-1.341363, -2.099084, -2.215507, 1, 0, 0, 1, 1,
-1.340335, -0.09748147, -1.41388, 1, 0, 0, 1, 1,
-1.330908, 1.853157, -0.8480121, 0, 0, 0, 1, 1,
-1.326499, -0.5271735, -1.814527, 0, 0, 0, 1, 1,
-1.326382, 2.221324, 0.149114, 0, 0, 0, 1, 1,
-1.321322, 0.137672, -0.5305552, 0, 0, 0, 1, 1,
-1.318222, -0.1361955, -2.409776, 0, 0, 0, 1, 1,
-1.314954, -0.1912308, -1.856832, 0, 0, 0, 1, 1,
-1.310519, -0.264167, -2.036037, 0, 0, 0, 1, 1,
-1.306418, -0.554866, -2.207104, 1, 1, 1, 1, 1,
-1.306027, 0.912132, -2.037049, 1, 1, 1, 1, 1,
-1.304644, -0.09263664, -2.477699, 1, 1, 1, 1, 1,
-1.303299, 1.909953, -0.6371913, 1, 1, 1, 1, 1,
-1.2977, -0.8080049, -0.5464388, 1, 1, 1, 1, 1,
-1.29324, 1.305677, -3.353364, 1, 1, 1, 1, 1,
-1.283611, -1.76819, -1.863816, 1, 1, 1, 1, 1,
-1.274221, -0.4641301, -1.721538, 1, 1, 1, 1, 1,
-1.272779, -1.885434, -0.6847543, 1, 1, 1, 1, 1,
-1.266729, -0.7541903, -4.257673, 1, 1, 1, 1, 1,
-1.264534, 0.6524023, -1.370746, 1, 1, 1, 1, 1,
-1.261218, 2.0755, -0.5541008, 1, 1, 1, 1, 1,
-1.257243, 0.7601004, -0.7483478, 1, 1, 1, 1, 1,
-1.254718, -0.6777316, -2.47331, 1, 1, 1, 1, 1,
-1.25376, -1.096742, -2.291533, 1, 1, 1, 1, 1,
-1.253031, -0.148204, -2.311066, 0, 0, 1, 1, 1,
-1.252118, 0.03664398, -0.4096372, 1, 0, 0, 1, 1,
-1.24613, 1.886399, 0.01753294, 1, 0, 0, 1, 1,
-1.241584, -1.330861, -3.119987, 1, 0, 0, 1, 1,
-1.241435, 0.4404273, 1.39596, 1, 0, 0, 1, 1,
-1.216522, -2.196833, -1.307486, 1, 0, 0, 1, 1,
-1.21414, 1.187764, -1.002069, 0, 0, 0, 1, 1,
-1.197193, -1.600626, -2.483529, 0, 0, 0, 1, 1,
-1.196841, 0.2965763, -1.40745, 0, 0, 0, 1, 1,
-1.196184, 0.9289358, 0.3338859, 0, 0, 0, 1, 1,
-1.185987, 0.2267322, -1.24607, 0, 0, 0, 1, 1,
-1.180836, 0.4566143, -0.9204083, 0, 0, 0, 1, 1,
-1.177894, 0.899888, -1.059297, 0, 0, 0, 1, 1,
-1.168592, -0.1852062, -1.999499, 1, 1, 1, 1, 1,
-1.168244, -0.8700969, -0.01245167, 1, 1, 1, 1, 1,
-1.166456, -1.287311, -1.965145, 1, 1, 1, 1, 1,
-1.163275, -1.995808, -2.871661, 1, 1, 1, 1, 1,
-1.160462, 0.2797287, -0.4524885, 1, 1, 1, 1, 1,
-1.148474, 0.429745, -0.1992956, 1, 1, 1, 1, 1,
-1.143255, -1.030735, -2.181821, 1, 1, 1, 1, 1,
-1.142662, 0.9537761, -1.114195, 1, 1, 1, 1, 1,
-1.131634, 1.694251, -0.2855816, 1, 1, 1, 1, 1,
-1.127029, -2.407366, -1.252858, 1, 1, 1, 1, 1,
-1.125878, -0.3944915, -1.691128, 1, 1, 1, 1, 1,
-1.118991, -0.8432816, -3.141514, 1, 1, 1, 1, 1,
-1.117464, 0.4618209, -0.4397172, 1, 1, 1, 1, 1,
-1.11658, -0.01703773, -1.984112, 1, 1, 1, 1, 1,
-1.112742, -0.9999515, -3.503445, 1, 1, 1, 1, 1,
-1.097456, -1.588852, -1.636413, 0, 0, 1, 1, 1,
-1.082126, 1.386682, 0.1422786, 1, 0, 0, 1, 1,
-1.081463, 0.5820842, -1.827449, 1, 0, 0, 1, 1,
-1.075619, -1.063345, 0.8131136, 1, 0, 0, 1, 1,
-1.069886, 1.293527, 0.3665445, 1, 0, 0, 1, 1,
-1.069585, -0.8337283, -3.362106, 1, 0, 0, 1, 1,
-1.067841, 1.04903, -0.7617304, 0, 0, 0, 1, 1,
-1.06305, 1.356411, -1.424176, 0, 0, 0, 1, 1,
-1.04608, 0.5933637, -3.231529, 0, 0, 0, 1, 1,
-1.041332, -0.7232497, -0.9199891, 0, 0, 0, 1, 1,
-1.028659, -1.006875, -2.671875, 0, 0, 0, 1, 1,
-1.026776, -0.2223689, -2.094634, 0, 0, 0, 1, 1,
-1.022109, 2.098741, 0.1814028, 0, 0, 0, 1, 1,
-1.018146, -0.7119238, -3.398064, 1, 1, 1, 1, 1,
-1.015483, -0.5351198, -1.322064, 1, 1, 1, 1, 1,
-1.013682, 0.4940538, -0.005210583, 1, 1, 1, 1, 1,
-1.011707, -0.71516, -3.072986, 1, 1, 1, 1, 1,
-0.9983184, -0.4601967, -3.291205, 1, 1, 1, 1, 1,
-0.9957271, -1.225236, -1.833285, 1, 1, 1, 1, 1,
-0.9920442, 0.2547244, -0.7141384, 1, 1, 1, 1, 1,
-0.9917816, -0.6944569, -2.891471, 1, 1, 1, 1, 1,
-0.9782345, -0.8685186, -1.811617, 1, 1, 1, 1, 1,
-0.977967, -1.64269, -2.539799, 1, 1, 1, 1, 1,
-0.970278, -0.4773182, -2.162513, 1, 1, 1, 1, 1,
-0.9697059, -1.486399, -3.413212, 1, 1, 1, 1, 1,
-0.9663441, -0.1153838, -0.3956009, 1, 1, 1, 1, 1,
-0.9659556, -0.0400511, -0.8285455, 1, 1, 1, 1, 1,
-0.964078, 1.031728, -1.623252, 1, 1, 1, 1, 1,
-0.9562699, -2.242321, -2.617407, 0, 0, 1, 1, 1,
-0.9524313, -1.746762, -2.129273, 1, 0, 0, 1, 1,
-0.9515637, 0.2361646, -2.683544, 1, 0, 0, 1, 1,
-0.947614, -0.9051566, -1.265576, 1, 0, 0, 1, 1,
-0.9471763, 0.6039842, -0.8745387, 1, 0, 0, 1, 1,
-0.9461047, -1.090358, -3.310399, 1, 0, 0, 1, 1,
-0.9460781, -0.956766, -2.848536, 0, 0, 0, 1, 1,
-0.9423434, -1.827404, -4.344229, 0, 0, 0, 1, 1,
-0.9396011, -0.9529538, -0.8604363, 0, 0, 0, 1, 1,
-0.9319966, -0.167596, -1.607732, 0, 0, 0, 1, 1,
-0.9291512, -1.185795, -1.980822, 0, 0, 0, 1, 1,
-0.9140474, 0.2955866, -1.734979, 0, 0, 0, 1, 1,
-0.9104648, 0.2805234, -0.7113948, 0, 0, 0, 1, 1,
-0.9095147, -1.656506, -2.387717, 1, 1, 1, 1, 1,
-0.9045447, -1.22569, -0.3264485, 1, 1, 1, 1, 1,
-0.8981278, -1.061764, -1.442083, 1, 1, 1, 1, 1,
-0.887711, -0.07908758, 0.2497517, 1, 1, 1, 1, 1,
-0.8820647, -0.3543877, -1.459598, 1, 1, 1, 1, 1,
-0.8787782, 0.02912271, -3.111669, 1, 1, 1, 1, 1,
-0.8714731, 0.2683226, -2.652876, 1, 1, 1, 1, 1,
-0.8694021, -0.6350832, -1.469534, 1, 1, 1, 1, 1,
-0.8576558, 0.9889082, -1.550005, 1, 1, 1, 1, 1,
-0.8546852, 1.313759, -1.918645, 1, 1, 1, 1, 1,
-0.8460674, 0.7751008, -1.177966, 1, 1, 1, 1, 1,
-0.8384253, -1.134022, -0.4770842, 1, 1, 1, 1, 1,
-0.836138, -1.353946, -0.8374094, 1, 1, 1, 1, 1,
-0.834649, 0.3804922, -0.5829415, 1, 1, 1, 1, 1,
-0.8327976, -0.673617, -2.734063, 1, 1, 1, 1, 1,
-0.8324603, -1.044867, -1.013762, 0, 0, 1, 1, 1,
-0.8297495, 0.2353581, -1.222515, 1, 0, 0, 1, 1,
-0.8245849, -0.4796617, -2.376687, 1, 0, 0, 1, 1,
-0.8166546, -1.883715, -2.67565, 1, 0, 0, 1, 1,
-0.8146989, 0.4609081, -2.20902, 1, 0, 0, 1, 1,
-0.809912, -0.4573201, -2.297538, 1, 0, 0, 1, 1,
-0.8078282, -0.1597415, -0.3765683, 0, 0, 0, 1, 1,
-0.8070774, 1.940525, 0.08692004, 0, 0, 0, 1, 1,
-0.8042251, -2.479947, -1.926187, 0, 0, 0, 1, 1,
-0.8023013, 0.03427772, -1.845013, 0, 0, 0, 1, 1,
-0.7966166, -0.3643071, -3.7367, 0, 0, 0, 1, 1,
-0.7896132, -0.355232, -1.424237, 0, 0, 0, 1, 1,
-0.7852134, -0.05608511, -3.291201, 0, 0, 0, 1, 1,
-0.7827097, 1.434327, -0.640515, 1, 1, 1, 1, 1,
-0.7788136, 1.707152, -1.256321, 1, 1, 1, 1, 1,
-0.7730753, -0.5388497, -1.734596, 1, 1, 1, 1, 1,
-0.7719805, -1.842511, -4.061936, 1, 1, 1, 1, 1,
-0.7654556, 0.02173251, -1.463243, 1, 1, 1, 1, 1,
-0.7654044, 0.4259954, -2.118605, 1, 1, 1, 1, 1,
-0.7640908, 0.08429845, -2.875762, 1, 1, 1, 1, 1,
-0.7639312, -0.06590745, -2.042979, 1, 1, 1, 1, 1,
-0.7619252, 0.3333694, -2.294106, 1, 1, 1, 1, 1,
-0.7615636, -0.4646093, -2.621024, 1, 1, 1, 1, 1,
-0.7594064, -0.7013582, -3.234553, 1, 1, 1, 1, 1,
-0.7492301, -0.2908275, -0.8621575, 1, 1, 1, 1, 1,
-0.7480497, -0.5893244, -1.165838, 1, 1, 1, 1, 1,
-0.7414352, 0.77762, -1.209939, 1, 1, 1, 1, 1,
-0.7410706, -0.05051006, -2.963372, 1, 1, 1, 1, 1,
-0.7404977, 0.6943931, -0.3083594, 0, 0, 1, 1, 1,
-0.739971, -1.579913, -4.452531, 1, 0, 0, 1, 1,
-0.7395998, -0.09462129, -2.257583, 1, 0, 0, 1, 1,
-0.7383952, -0.3939399, -1.51312, 1, 0, 0, 1, 1,
-0.7377561, 2.249765, -0.1638681, 1, 0, 0, 1, 1,
-0.7370728, -0.6862622, -3.370264, 1, 0, 0, 1, 1,
-0.7304651, -1.689394, -2.969219, 0, 0, 0, 1, 1,
-0.7279023, 0.7268976, -1.367449, 0, 0, 0, 1, 1,
-0.7248779, -0.1386509, -1.19797, 0, 0, 0, 1, 1,
-0.7241588, -0.1167406, -0.5666726, 0, 0, 0, 1, 1,
-0.7193958, -0.1975973, -2.349219, 0, 0, 0, 1, 1,
-0.7150748, -0.08884601, -1.548997, 0, 0, 0, 1, 1,
-0.7145125, -0.9373744, -3.695984, 0, 0, 0, 1, 1,
-0.712113, -0.6341211, -4.027423, 1, 1, 1, 1, 1,
-0.7111982, 0.0697296, -2.696115, 1, 1, 1, 1, 1,
-0.7089894, 0.738737, -2.143186, 1, 1, 1, 1, 1,
-0.7074654, 0.2288208, -1.700605, 1, 1, 1, 1, 1,
-0.6906435, -0.3559603, -3.726916, 1, 1, 1, 1, 1,
-0.6860626, 0.5110636, -2.133827, 1, 1, 1, 1, 1,
-0.6843757, 0.331242, -1.66365, 1, 1, 1, 1, 1,
-0.6839813, 0.1358861, -1.867929, 1, 1, 1, 1, 1,
-0.6804473, 0.0799808, -2.585494, 1, 1, 1, 1, 1,
-0.6764807, -0.392726, -2.773356, 1, 1, 1, 1, 1,
-0.6743001, -2.252016, -2.018993, 1, 1, 1, 1, 1,
-0.6741403, 0.7037301, 0.6486452, 1, 1, 1, 1, 1,
-0.6700141, -0.5074771, -2.462626, 1, 1, 1, 1, 1,
-0.6699381, -0.3597956, -2.126408, 1, 1, 1, 1, 1,
-0.6637039, -1.109446, -2.939949, 1, 1, 1, 1, 1,
-0.6628566, 0.2088835, -1.903511, 0, 0, 1, 1, 1,
-0.6624139, 0.3794271, 0.2921652, 1, 0, 0, 1, 1,
-0.6621411, -0.8542587, -2.086419, 1, 0, 0, 1, 1,
-0.6617708, 0.3440674, 0.3706526, 1, 0, 0, 1, 1,
-0.6567588, -0.4278109, -2.975966, 1, 0, 0, 1, 1,
-0.6563695, -0.05213565, -2.476069, 1, 0, 0, 1, 1,
-0.655126, 0.7919919, 0.6200072, 0, 0, 0, 1, 1,
-0.653845, -0.1402638, -2.798114, 0, 0, 0, 1, 1,
-0.6443567, -0.5085495, -3.475634, 0, 0, 0, 1, 1,
-0.644354, 0.6234307, -0.9690086, 0, 0, 0, 1, 1,
-0.6439731, -2.222813, -3.506524, 0, 0, 0, 1, 1,
-0.6423606, 0.367486, -1.118111, 0, 0, 0, 1, 1,
-0.6353297, 1.058037, 0.5292401, 0, 0, 0, 1, 1,
-0.6303613, -0.08334222, -1.975543, 1, 1, 1, 1, 1,
-0.6294438, 1.37362, -1.069114, 1, 1, 1, 1, 1,
-0.6286246, 0.4433405, -2.131259, 1, 1, 1, 1, 1,
-0.6257622, -0.2739589, -0.626801, 1, 1, 1, 1, 1,
-0.6249501, -0.1054137, -0.8543066, 1, 1, 1, 1, 1,
-0.6245708, -1.364061, -2.316742, 1, 1, 1, 1, 1,
-0.6221882, 0.4720545, -1.397052, 1, 1, 1, 1, 1,
-0.6128079, 0.1253659, -0.8213969, 1, 1, 1, 1, 1,
-0.610109, -0.1563985, -1.347268, 1, 1, 1, 1, 1,
-0.6087588, 0.8357407, -0.2323703, 1, 1, 1, 1, 1,
-0.6014288, 0.2266738, -1.212786, 1, 1, 1, 1, 1,
-0.599021, 2.01915, -0.8263766, 1, 1, 1, 1, 1,
-0.5983859, -0.9606681, -2.19817, 1, 1, 1, 1, 1,
-0.5960101, -0.1721443, -1.206842, 1, 1, 1, 1, 1,
-0.5946831, 0.5907027, 1.140504, 1, 1, 1, 1, 1,
-0.5940439, 0.858793, -1.151762, 0, 0, 1, 1, 1,
-0.5935098, -2.544547, -2.453093, 1, 0, 0, 1, 1,
-0.5897778, -1.202772, -1.682031, 1, 0, 0, 1, 1,
-0.5895371, -1.453966, -2.5119, 1, 0, 0, 1, 1,
-0.5885057, -0.3078336, -2.782317, 1, 0, 0, 1, 1,
-0.5882069, 1.0702, -1.338124, 1, 0, 0, 1, 1,
-0.5859246, 2.609061, 0.6318733, 0, 0, 0, 1, 1,
-0.5852531, 0.3961979, -0.4987398, 0, 0, 0, 1, 1,
-0.5821438, -0.09426817, -1.168848, 0, 0, 0, 1, 1,
-0.5816891, 0.6023458, -0.5072924, 0, 0, 0, 1, 1,
-0.5796621, -0.1041487, 0.5039798, 0, 0, 0, 1, 1,
-0.5757585, 1.328251, -1.75563, 0, 0, 0, 1, 1,
-0.5721188, -0.6539018, -2.405769, 0, 0, 0, 1, 1,
-0.5705309, -0.4942252, -1.562109, 1, 1, 1, 1, 1,
-0.5704775, 2.331841, -0.9321552, 1, 1, 1, 1, 1,
-0.5637888, -1.510403, -2.066276, 1, 1, 1, 1, 1,
-0.5613719, -0.7848948, -1.85613, 1, 1, 1, 1, 1,
-0.5564803, 0.7775771, 0.1532836, 1, 1, 1, 1, 1,
-0.5561112, -1.931535, -3.834924, 1, 1, 1, 1, 1,
-0.5545789, 0.2655888, -3.008076, 1, 1, 1, 1, 1,
-0.5496694, -0.08422728, -1.33446, 1, 1, 1, 1, 1,
-0.5496457, -0.9865807, -1.397678, 1, 1, 1, 1, 1,
-0.5478963, -0.2877628, -1.951368, 1, 1, 1, 1, 1,
-0.5461864, -0.2260973, -1.572803, 1, 1, 1, 1, 1,
-0.5453466, 0.09056841, -1.258327, 1, 1, 1, 1, 1,
-0.5403881, -0.5187457, -3.093524, 1, 1, 1, 1, 1,
-0.5385591, -0.2697396, -1.34835, 1, 1, 1, 1, 1,
-0.5377845, 0.6434847, -1.228297, 1, 1, 1, 1, 1,
-0.5344027, 3.065782, 0.1862633, 0, 0, 1, 1, 1,
-0.5330703, -0.7233315, -2.199898, 1, 0, 0, 1, 1,
-0.5293751, 0.05958871, -1.25828, 1, 0, 0, 1, 1,
-0.5291981, 0.1897333, -1.615661, 1, 0, 0, 1, 1,
-0.5208076, 0.3778205, -0.3911808, 1, 0, 0, 1, 1,
-0.5206941, 0.7583789, -0.9121843, 1, 0, 0, 1, 1,
-0.5136427, -0.2434297, -2.954355, 0, 0, 0, 1, 1,
-0.5136036, 0.1658694, -2.143213, 0, 0, 0, 1, 1,
-0.5117316, -0.9385493, -4.286395, 0, 0, 0, 1, 1,
-0.5093723, 0.1480172, -0.2935166, 0, 0, 0, 1, 1,
-0.5057334, -1.323166, -3.545034, 0, 0, 0, 1, 1,
-0.50427, -0.1031081, -2.861434, 0, 0, 0, 1, 1,
-0.5040545, -0.2249023, -2.897991, 0, 0, 0, 1, 1,
-0.5039534, -1.258188, -2.725239, 1, 1, 1, 1, 1,
-0.5035902, 1.223659, -0.175721, 1, 1, 1, 1, 1,
-0.4990787, -0.9226677, -1.977211, 1, 1, 1, 1, 1,
-0.4964907, 0.6167305, -0.3718591, 1, 1, 1, 1, 1,
-0.4936958, 0.5755767, -1.199904, 1, 1, 1, 1, 1,
-0.4922872, -2.250242, -5.838457, 1, 1, 1, 1, 1,
-0.492247, 0.1827782, -1.218248, 1, 1, 1, 1, 1,
-0.4918027, 1.147154, -0.5910952, 1, 1, 1, 1, 1,
-0.4825385, 0.1401978, -0.597881, 1, 1, 1, 1, 1,
-0.481017, 1.672729, -1.316876, 1, 1, 1, 1, 1,
-0.4805315, 0.5561864, -1.574702, 1, 1, 1, 1, 1,
-0.4758366, -0.1189282, -2.504931, 1, 1, 1, 1, 1,
-0.4758252, -0.8951524, -1.647136, 1, 1, 1, 1, 1,
-0.4721084, -0.7632188, -2.001242, 1, 1, 1, 1, 1,
-0.4720826, -0.5636787, -3.077877, 1, 1, 1, 1, 1,
-0.4688632, -1.462584, -3.189287, 0, 0, 1, 1, 1,
-0.4578174, 0.5852835, -0.6188456, 1, 0, 0, 1, 1,
-0.4448656, -0.1658502, -1.390161, 1, 0, 0, 1, 1,
-0.4444686, 1.663318, 0.5051672, 1, 0, 0, 1, 1,
-0.4339775, 0.3332052, -0.6727317, 1, 0, 0, 1, 1,
-0.4328058, -0.0216692, -3.500448, 1, 0, 0, 1, 1,
-0.4325287, -0.6075109, -2.710624, 0, 0, 0, 1, 1,
-0.4313486, 0.8036075, -0.2434683, 0, 0, 0, 1, 1,
-0.4304748, 2.344794, 0.4138303, 0, 0, 0, 1, 1,
-0.4260583, 0.1852264, 0.9381821, 0, 0, 0, 1, 1,
-0.4242551, 1.421351, 1.48046, 0, 0, 0, 1, 1,
-0.4199077, -1.7216, -3.582305, 0, 0, 0, 1, 1,
-0.4191615, -0.3040022, -2.188234, 0, 0, 0, 1, 1,
-0.4185446, 1.777004, -0.3301555, 1, 1, 1, 1, 1,
-0.4162113, -0.5144282, -2.434602, 1, 1, 1, 1, 1,
-0.4144024, -0.3498648, -3.581299, 1, 1, 1, 1, 1,
-0.4135474, 0.6499594, 0.2259542, 1, 1, 1, 1, 1,
-0.4048115, 0.8810903, 0.4009064, 1, 1, 1, 1, 1,
-0.4017709, -0.1075822, -0.5406729, 1, 1, 1, 1, 1,
-0.398671, -1.267594, -2.534484, 1, 1, 1, 1, 1,
-0.3984244, 1.093405, -0.5861972, 1, 1, 1, 1, 1,
-0.3982155, -0.2890952, -3.993659, 1, 1, 1, 1, 1,
-0.3977321, 0.1723468, -0.1045404, 1, 1, 1, 1, 1,
-0.3928435, 1.234034, 0.7544159, 1, 1, 1, 1, 1,
-0.3903191, 0.9003007, -0.07358325, 1, 1, 1, 1, 1,
-0.3896175, -1.377966, -2.716522, 1, 1, 1, 1, 1,
-0.3888255, -1.178794, -1.400676, 1, 1, 1, 1, 1,
-0.3857131, 0.1708081, 0.5277643, 1, 1, 1, 1, 1,
-0.3815694, 1.35814, -0.5281149, 0, 0, 1, 1, 1,
-0.381386, 1.141275, -0.8192511, 1, 0, 0, 1, 1,
-0.3786886, -0.5864033, -3.119031, 1, 0, 0, 1, 1,
-0.3778977, -0.2581459, -1.961625, 1, 0, 0, 1, 1,
-0.3738797, -0.1284381, -3.230908, 1, 0, 0, 1, 1,
-0.3704072, 0.8744096, -0.368722, 1, 0, 0, 1, 1,
-0.3698863, -0.8235643, -1.945035, 0, 0, 0, 1, 1,
-0.3667743, -1.833329, -3.88302, 0, 0, 0, 1, 1,
-0.362673, 0.3167429, -1.721055, 0, 0, 0, 1, 1,
-0.3626236, -0.3722617, -1.642744, 0, 0, 0, 1, 1,
-0.3572695, -0.9738069, -1.278691, 0, 0, 0, 1, 1,
-0.3558333, -0.8384737, -3.381067, 0, 0, 0, 1, 1,
-0.3545913, 0.6159177, -0.3110026, 0, 0, 0, 1, 1,
-0.3538079, 0.6608688, -1.612879, 1, 1, 1, 1, 1,
-0.3510861, 1.124719, 0.4452879, 1, 1, 1, 1, 1,
-0.3449033, 2.051913, -1.465309, 1, 1, 1, 1, 1,
-0.3377933, 0.03920496, -0.9185889, 1, 1, 1, 1, 1,
-0.3330627, -0.3065573, -2.143827, 1, 1, 1, 1, 1,
-0.3317477, -0.1746748, -1.925108, 1, 1, 1, 1, 1,
-0.3298934, 0.9226547, 0.1093342, 1, 1, 1, 1, 1,
-0.3238349, 1.641111, 0.1291686, 1, 1, 1, 1, 1,
-0.3218445, -0.09487683, -2.142937, 1, 1, 1, 1, 1,
-0.3076225, -1.58677, -3.375705, 1, 1, 1, 1, 1,
-0.3041138, 0.4926816, 0.7047396, 1, 1, 1, 1, 1,
-0.3037131, -0.1673908, -1.651475, 1, 1, 1, 1, 1,
-0.3026442, -0.4326257, -3.264856, 1, 1, 1, 1, 1,
-0.3009602, -0.8403931, -1.590855, 1, 1, 1, 1, 1,
-0.293319, 0.09826776, 0.9153301, 1, 1, 1, 1, 1,
-0.2895322, 0.6424732, -0.8597867, 0, 0, 1, 1, 1,
-0.2849067, -0.07178114, -2.965768, 1, 0, 0, 1, 1,
-0.2837534, -0.3589215, -1.967169, 1, 0, 0, 1, 1,
-0.2819022, 0.2377681, -0.8027685, 1, 0, 0, 1, 1,
-0.2797985, 1.419908, 0.4375941, 1, 0, 0, 1, 1,
-0.2767423, -2.276876, -3.187661, 1, 0, 0, 1, 1,
-0.2726393, 0.007884909, -1.857472, 0, 0, 0, 1, 1,
-0.2695046, 0.851868, 0.3765467, 0, 0, 0, 1, 1,
-0.2639027, -1.134762, -2.634603, 0, 0, 0, 1, 1,
-0.2632606, -0.9455975, -1.49181, 0, 0, 0, 1, 1,
-0.2628002, 1.418688, -1.040191, 0, 0, 0, 1, 1,
-0.2591398, -1.11183, -4.746844, 0, 0, 0, 1, 1,
-0.2483133, 1.407, -0.7333168, 0, 0, 0, 1, 1,
-0.2444846, 0.4586806, -0.5394133, 1, 1, 1, 1, 1,
-0.2425204, 1.749936, 0.4284211, 1, 1, 1, 1, 1,
-0.241088, 0.4185578, 0.8591043, 1, 1, 1, 1, 1,
-0.2410796, 1.128507, 0.2259702, 1, 1, 1, 1, 1,
-0.2396396, 0.5753797, -0.1941593, 1, 1, 1, 1, 1,
-0.2378028, -0.7948279, -2.654085, 1, 1, 1, 1, 1,
-0.2371364, 0.01782162, -1.493753, 1, 1, 1, 1, 1,
-0.235037, 1.258918, 0.0690582, 1, 1, 1, 1, 1,
-0.2295025, -0.1122015, -1.269834, 1, 1, 1, 1, 1,
-0.2289371, 0.2383768, -0.1353974, 1, 1, 1, 1, 1,
-0.2282318, 1.969769, -0.4248346, 1, 1, 1, 1, 1,
-0.2253705, 1.753464, -0.4076405, 1, 1, 1, 1, 1,
-0.2221358, -0.6752672, -1.486269, 1, 1, 1, 1, 1,
-0.2179554, -0.2865548, -2.085329, 1, 1, 1, 1, 1,
-0.2129056, -1.673422, -2.181974, 1, 1, 1, 1, 1,
-0.2124476, 0.3517462, -0.907768, 0, 0, 1, 1, 1,
-0.211867, -0.5091767, -3.416265, 1, 0, 0, 1, 1,
-0.211605, 0.1585603, -0.3153604, 1, 0, 0, 1, 1,
-0.2094067, 0.7727649, -0.4529421, 1, 0, 0, 1, 1,
-0.2091745, 0.06334826, -2.406308, 1, 0, 0, 1, 1,
-0.2056218, 0.9005033, -0.6786459, 1, 0, 0, 1, 1,
-0.2040006, -0.6164374, -1.738326, 0, 0, 0, 1, 1,
-0.1904848, 0.6276475, -1.490088, 0, 0, 0, 1, 1,
-0.1882368, 0.3087578, -0.3943388, 0, 0, 0, 1, 1,
-0.186957, -0.2883192, -2.892522, 0, 0, 0, 1, 1,
-0.1867945, -1.086179, -3.587469, 0, 0, 0, 1, 1,
-0.186164, -0.2606192, -2.995017, 0, 0, 0, 1, 1,
-0.1854832, 0.9440191, 0.2050081, 0, 0, 0, 1, 1,
-0.1804638, -0.9802526, -5.173512, 1, 1, 1, 1, 1,
-0.1745534, 0.8938326, 0.1178714, 1, 1, 1, 1, 1,
-0.1707019, -1.427683, -3.632701, 1, 1, 1, 1, 1,
-0.168237, -1.720832, -6.020288, 1, 1, 1, 1, 1,
-0.1682184, 0.9477232, -1.393114, 1, 1, 1, 1, 1,
-0.1626581, 1.36182, -1.176647, 1, 1, 1, 1, 1,
-0.1601758, 0.1076807, -2.419048, 1, 1, 1, 1, 1,
-0.1575249, 0.3608006, -1.677435, 1, 1, 1, 1, 1,
-0.1572856, -1.573851, -1.598742, 1, 1, 1, 1, 1,
-0.1471964, 1.241539, -0.2096844, 1, 1, 1, 1, 1,
-0.144826, 0.2129165, -0.8730485, 1, 1, 1, 1, 1,
-0.1422711, 0.3449669, -0.6007109, 1, 1, 1, 1, 1,
-0.1404951, 1.290318, 0.486194, 1, 1, 1, 1, 1,
-0.1374208, -0.865886, -1.667142, 1, 1, 1, 1, 1,
-0.1323464, 1.302346, -0.03914171, 1, 1, 1, 1, 1,
-0.1309898, 0.02528077, -1.769208, 0, 0, 1, 1, 1,
-0.1252965, -0.5908681, -3.056397, 1, 0, 0, 1, 1,
-0.1225708, 0.6338501, -1.236576, 1, 0, 0, 1, 1,
-0.1200212, -0.4437844, -2.075235, 1, 0, 0, 1, 1,
-0.1197723, 1.326309, 0.2560179, 1, 0, 0, 1, 1,
-0.1160577, 0.7932134, 1.536853, 1, 0, 0, 1, 1,
-0.1121154, -0.6426894, -2.114012, 0, 0, 0, 1, 1,
-0.1097954, 1.691853, -0.4997079, 0, 0, 0, 1, 1,
-0.109774, 1.892862, 0.1843634, 0, 0, 0, 1, 1,
-0.1090111, 1.720003, 0.1614802, 0, 0, 0, 1, 1,
-0.1081289, 0.542892, -0.1240367, 0, 0, 0, 1, 1,
-0.1079051, -0.575908, -2.601964, 0, 0, 0, 1, 1,
-0.1026275, 1.732281, -0.07837261, 0, 0, 0, 1, 1,
-0.09928091, 1.077086, -0.7798506, 1, 1, 1, 1, 1,
-0.09722203, 0.4058967, 1.850252, 1, 1, 1, 1, 1,
-0.09688608, -0.9852785, -1.502703, 1, 1, 1, 1, 1,
-0.0944282, -0.04490424, -2.067469, 1, 1, 1, 1, 1,
-0.09431332, 0.4655606, 1.579271, 1, 1, 1, 1, 1,
-0.09406691, -0.2671664, -3.256105, 1, 1, 1, 1, 1,
-0.09021526, -0.8021493, -4.176109, 1, 1, 1, 1, 1,
-0.08738288, 1.10562, -0.6381562, 1, 1, 1, 1, 1,
-0.07920603, 1.172464, 1.148632, 1, 1, 1, 1, 1,
-0.0766754, -1.364789, -3.666579, 1, 1, 1, 1, 1,
-0.07654192, -0.7171229, -1.831073, 1, 1, 1, 1, 1,
-0.0738498, -0.8748381, -3.587916, 1, 1, 1, 1, 1,
-0.06903379, -1.499136, -3.55935, 1, 1, 1, 1, 1,
-0.06788424, -0.3036779, -2.663117, 1, 1, 1, 1, 1,
-0.06706811, -0.5880107, -2.619906, 1, 1, 1, 1, 1,
-0.06500833, 0.9276295, -2.134252, 0, 0, 1, 1, 1,
-0.06500445, -1.898899, -2.197931, 1, 0, 0, 1, 1,
-0.06243907, 0.4508194, 0.0708671, 1, 0, 0, 1, 1,
-0.06098334, 1.294181, -1.094989, 1, 0, 0, 1, 1,
-0.05970196, -0.9986969, -2.962976, 1, 0, 0, 1, 1,
-0.05798707, 0.2131594, 0.6343457, 1, 0, 0, 1, 1,
-0.05443633, -0.2810462, -4.557226, 0, 0, 0, 1, 1,
-0.05391739, -0.0280319, 1.663845, 0, 0, 0, 1, 1,
-0.05085646, -0.7193735, -0.888173, 0, 0, 0, 1, 1,
-0.05004338, 0.5159713, -0.6154732, 0, 0, 0, 1, 1,
-0.04966925, 1.196706, 0.2360154, 0, 0, 0, 1, 1,
-0.04752557, -0.2456706, -1.842148, 0, 0, 0, 1, 1,
-0.04554012, 0.3182552, 0.2006594, 0, 0, 0, 1, 1,
-0.04532726, -0.2115039, -0.6484918, 1, 1, 1, 1, 1,
-0.04524062, -0.05349882, -1.393791, 1, 1, 1, 1, 1,
-0.04086382, -1.075642, -2.821088, 1, 1, 1, 1, 1,
-0.03987502, -0.8621868, -2.218235, 1, 1, 1, 1, 1,
-0.03871403, -0.8791208, -2.132087, 1, 1, 1, 1, 1,
-0.03334274, 1.752454, 0.09006111, 1, 1, 1, 1, 1,
-0.03193664, -1.149766, -4.940379, 1, 1, 1, 1, 1,
-0.03184424, 0.5878143, 0.01130341, 1, 1, 1, 1, 1,
-0.02782542, -1.604525, -2.909188, 1, 1, 1, 1, 1,
-0.02531645, 0.9661365, -0.3016305, 1, 1, 1, 1, 1,
-0.02495734, 0.3361863, 0.6911858, 1, 1, 1, 1, 1,
-0.02403889, -0.1753221, -1.918065, 1, 1, 1, 1, 1,
-0.02324376, -0.7912515, -4.726732, 1, 1, 1, 1, 1,
-0.01985602, -1.238713, -1.831535, 1, 1, 1, 1, 1,
-0.01733173, -1.060287, -2.101978, 1, 1, 1, 1, 1,
-0.01652478, 0.1300407, -0.8673179, 0, 0, 1, 1, 1,
-0.01530305, -0.214137, -3.039088, 1, 0, 0, 1, 1,
-0.01350863, -0.6318133, -2.848963, 1, 0, 0, 1, 1,
-0.007932722, -1.49182, -3.766042, 1, 0, 0, 1, 1,
-0.007250554, -0.6506982, -1.297706, 1, 0, 0, 1, 1,
-0.005074548, -0.06434793, -3.726436, 1, 0, 0, 1, 1,
0.00464166, 0.5680006, -1.713333, 0, 0, 0, 1, 1,
0.005392208, -0.08654727, 2.112808, 0, 0, 0, 1, 1,
0.00659035, -0.3313342, 3.130933, 0, 0, 0, 1, 1,
0.006789576, -0.4228574, 1.695047, 0, 0, 0, 1, 1,
0.007304032, 1.648515, -0.4664772, 0, 0, 0, 1, 1,
0.008634688, -2.287371, 2.595715, 0, 0, 0, 1, 1,
0.008661187, 1.377143, 0.3583016, 0, 0, 0, 1, 1,
0.01399082, -0.9746069, 1.674418, 1, 1, 1, 1, 1,
0.01539368, -0.1458773, 3.366839, 1, 1, 1, 1, 1,
0.01576122, -0.3650127, 3.85445, 1, 1, 1, 1, 1,
0.01666964, -1.258689, 2.196698, 1, 1, 1, 1, 1,
0.02404392, -0.2938318, 4.970831, 1, 1, 1, 1, 1,
0.02589027, 0.7762194, -1.123725, 1, 1, 1, 1, 1,
0.02762823, -0.1877346, 3.910427, 1, 1, 1, 1, 1,
0.02807865, 2.28505, 0.1353379, 1, 1, 1, 1, 1,
0.03203021, -0.5813239, 2.289352, 1, 1, 1, 1, 1,
0.03209353, 1.947401, -0.7439009, 1, 1, 1, 1, 1,
0.0332849, 0.01224388, 0.4709881, 1, 1, 1, 1, 1,
0.03377583, -0.3491211, 2.859494, 1, 1, 1, 1, 1,
0.03471768, 0.09462645, -0.539149, 1, 1, 1, 1, 1,
0.03672094, -1.068678, 2.533022, 1, 1, 1, 1, 1,
0.03998126, -0.7133245, 3.046438, 1, 1, 1, 1, 1,
0.04030543, 0.01000014, 1.838441, 0, 0, 1, 1, 1,
0.04923129, 0.6147522, 0.8000727, 1, 0, 0, 1, 1,
0.0541788, -1.553623, 2.691073, 1, 0, 0, 1, 1,
0.05535549, 1.40705, -2.15556, 1, 0, 0, 1, 1,
0.05559849, -1.170027, 2.214986, 1, 0, 0, 1, 1,
0.06318076, 0.2373291, -1.278578, 1, 0, 0, 1, 1,
0.06326322, 0.1484333, 0.8306476, 0, 0, 0, 1, 1,
0.06444741, 0.3759711, 1.926954, 0, 0, 0, 1, 1,
0.06622087, -0.7287042, 1.981517, 0, 0, 0, 1, 1,
0.06656592, 0.8685537, -1.152174, 0, 0, 0, 1, 1,
0.0667845, -0.3215742, 1.210073, 0, 0, 0, 1, 1,
0.06810823, -0.4648103, 2.917641, 0, 0, 0, 1, 1,
0.07194536, -1.400183, 2.15255, 0, 0, 0, 1, 1,
0.07883364, 0.06970847, 0.6054941, 1, 1, 1, 1, 1,
0.08366916, -1.141764, 2.572701, 1, 1, 1, 1, 1,
0.09304429, -0.3459441, 1.260373, 1, 1, 1, 1, 1,
0.09330251, 1.466681, -1.038754, 1, 1, 1, 1, 1,
0.0953382, 0.4438307, 2.385224, 1, 1, 1, 1, 1,
0.09673354, -0.2118654, 3.773966, 1, 1, 1, 1, 1,
0.1009796, 0.4337047, 2.219272, 1, 1, 1, 1, 1,
0.1018384, -0.6312169, 3.392684, 1, 1, 1, 1, 1,
0.1121352, -0.7998896, 2.015949, 1, 1, 1, 1, 1,
0.1126141, 0.3645538, -0.1370122, 1, 1, 1, 1, 1,
0.1162976, 0.2799078, 0.822069, 1, 1, 1, 1, 1,
0.1178423, 0.9224777, 2.07254, 1, 1, 1, 1, 1,
0.1207895, 0.8034445, -1.699883, 1, 1, 1, 1, 1,
0.1208241, 0.9506633, 1.06469, 1, 1, 1, 1, 1,
0.1223038, -0.8945363, 3.557412, 1, 1, 1, 1, 1,
0.1230089, -0.2786485, 4.794303, 0, 0, 1, 1, 1,
0.123728, 0.03757693, 1.121814, 1, 0, 0, 1, 1,
0.1297697, -0.06090986, 1.725441, 1, 0, 0, 1, 1,
0.1302624, 1.045831, 1.550965, 1, 0, 0, 1, 1,
0.1307065, -0.3779484, 4.88082, 1, 0, 0, 1, 1,
0.1317876, 0.4980524, -0.04308765, 1, 0, 0, 1, 1,
0.1336257, 0.3189593, -1.200763, 0, 0, 0, 1, 1,
0.135501, -0.04285894, 2.193074, 0, 0, 0, 1, 1,
0.1395201, -1.36375, 0.8557994, 0, 0, 0, 1, 1,
0.1395344, -0.9428557, 2.354052, 0, 0, 0, 1, 1,
0.141674, 0.9741059, -0.7162389, 0, 0, 0, 1, 1,
0.1452873, 1.259901, 0.6864922, 0, 0, 0, 1, 1,
0.1508352, 3.195696, -0.2657473, 0, 0, 0, 1, 1,
0.1541484, -1.896297, 3.26007, 1, 1, 1, 1, 1,
0.1556882, 0.6763858, -0.06853073, 1, 1, 1, 1, 1,
0.1579468, 1.13543, -1.408823, 1, 1, 1, 1, 1,
0.1581814, 0.449748, 0.2917589, 1, 1, 1, 1, 1,
0.1589687, -0.6080791, 3.252524, 1, 1, 1, 1, 1,
0.1594416, 0.6096137, -0.5379658, 1, 1, 1, 1, 1,
0.1609482, -0.2548937, 2.453805, 1, 1, 1, 1, 1,
0.1661555, -0.2133054, 2.907761, 1, 1, 1, 1, 1,
0.1662303, -0.9159379, 2.734557, 1, 1, 1, 1, 1,
0.1719908, -0.8004684, 3.005993, 1, 1, 1, 1, 1,
0.1733339, 0.46888, -0.09290852, 1, 1, 1, 1, 1,
0.1763354, -0.2538349, 2.786795, 1, 1, 1, 1, 1,
0.1788437, 1.549727, 0.4480031, 1, 1, 1, 1, 1,
0.1878286, 0.2345083, 1.823184, 1, 1, 1, 1, 1,
0.1885655, -1.333447, 3.310548, 1, 1, 1, 1, 1,
0.1899441, 0.004826676, 2.542183, 0, 0, 1, 1, 1,
0.1941471, 0.01590396, 2.216664, 1, 0, 0, 1, 1,
0.1947724, 0.4205148, 0.118519, 1, 0, 0, 1, 1,
0.1947946, 1.441236, 0.8741402, 1, 0, 0, 1, 1,
0.2044332, 0.5723556, -0.8358392, 1, 0, 0, 1, 1,
0.207704, 0.7229516, -0.226784, 1, 0, 0, 1, 1,
0.2105519, 2.214335, 1.471248, 0, 0, 0, 1, 1,
0.2122993, 0.3010634, 1.26811, 0, 0, 0, 1, 1,
0.2133665, -0.5150464, 2.442652, 0, 0, 0, 1, 1,
0.2138578, 0.1573102, -1.53189, 0, 0, 0, 1, 1,
0.2181248, -0.6044297, 1.734393, 0, 0, 0, 1, 1,
0.2186082, -1.445722, 2.878588, 0, 0, 0, 1, 1,
0.2196818, -0.7452579, 3.82986, 0, 0, 0, 1, 1,
0.219917, -0.1352689, 0.9190275, 1, 1, 1, 1, 1,
0.2226848, -1.080932, 2.622895, 1, 1, 1, 1, 1,
0.2229995, 0.5037435, 0.5980282, 1, 1, 1, 1, 1,
0.2230222, -0.05589323, 2.328457, 1, 1, 1, 1, 1,
0.2261141, 0.393084, -1.201113, 1, 1, 1, 1, 1,
0.2265554, -0.4881631, 2.136509, 1, 1, 1, 1, 1,
0.228926, 1.194629, 0.380626, 1, 1, 1, 1, 1,
0.2300291, -1.188365, 2.94743, 1, 1, 1, 1, 1,
0.2306981, -0.002934688, 1.355145, 1, 1, 1, 1, 1,
0.2326329, -0.3052149, 3.10607, 1, 1, 1, 1, 1,
0.2370905, 0.630156, 2.317935, 1, 1, 1, 1, 1,
0.2375458, -0.5629483, 3.36218, 1, 1, 1, 1, 1,
0.2401361, -1.121675, 2.216227, 1, 1, 1, 1, 1,
0.240635, -0.4208602, 0.5763544, 1, 1, 1, 1, 1,
0.2449114, -0.1254344, 1.993759, 1, 1, 1, 1, 1,
0.2487847, -1.868992, 3.687202, 0, 0, 1, 1, 1,
0.2510211, -0.3462827, 2.306872, 1, 0, 0, 1, 1,
0.2530859, -0.1333691, 1.032617, 1, 0, 0, 1, 1,
0.2540089, -0.656592, 3.518927, 1, 0, 0, 1, 1,
0.2543096, -0.1926638, -0.2117264, 1, 0, 0, 1, 1,
0.2543211, 1.173614, -1.400763, 1, 0, 0, 1, 1,
0.2551292, -0.5368924, 3.452477, 0, 0, 0, 1, 1,
0.2596842, -1.192088, 4.407037, 0, 0, 0, 1, 1,
0.2612885, -2.547321, 2.441334, 0, 0, 0, 1, 1,
0.2620258, -1.389204, 2.326781, 0, 0, 0, 1, 1,
0.2661152, 0.4641096, 1.799085, 0, 0, 0, 1, 1,
0.2701948, -1.12708, 2.246693, 0, 0, 0, 1, 1,
0.2727594, -0.2455058, 2.869808, 0, 0, 0, 1, 1,
0.2729247, -0.2637068, 3.012311, 1, 1, 1, 1, 1,
0.2738384, -0.7732534, 2.635839, 1, 1, 1, 1, 1,
0.2768163, 0.0582801, -0.969864, 1, 1, 1, 1, 1,
0.2798664, -1.109808, 2.197094, 1, 1, 1, 1, 1,
0.284182, 1.086178, 1.531505, 1, 1, 1, 1, 1,
0.2858865, 1.676606, 0.136193, 1, 1, 1, 1, 1,
0.2942242, 0.556473, -2.708151, 1, 1, 1, 1, 1,
0.2965641, 0.4687531, -0.1085406, 1, 1, 1, 1, 1,
0.2971165, 0.8253254, 0.556855, 1, 1, 1, 1, 1,
0.2983056, -0.189762, 3.717411, 1, 1, 1, 1, 1,
0.2987013, 0.2521642, 1.715025, 1, 1, 1, 1, 1,
0.2987565, -0.9497024, 3.285001, 1, 1, 1, 1, 1,
0.3063411, 0.1825879, 0.8346233, 1, 1, 1, 1, 1,
0.3082348, -1.175808, 1.568543, 1, 1, 1, 1, 1,
0.3089064, 0.2313008, -0.1112786, 1, 1, 1, 1, 1,
0.3094316, -0.1205467, 1.194758, 0, 0, 1, 1, 1,
0.3115368, 0.8254423, 0.508023, 1, 0, 0, 1, 1,
0.3131609, -0.07030889, 0.802587, 1, 0, 0, 1, 1,
0.3203827, -0.2349622, 4.125242, 1, 0, 0, 1, 1,
0.322392, -0.5472077, 3.159913, 1, 0, 0, 1, 1,
0.3230385, -0.4893162, 2.199338, 1, 0, 0, 1, 1,
0.3237429, -0.72874, 2.989527, 0, 0, 0, 1, 1,
0.3237507, -0.4187073, 3.192605, 0, 0, 0, 1, 1,
0.3249058, -0.1478019, 2.30284, 0, 0, 0, 1, 1,
0.3250969, 1.793761, -0.1294821, 0, 0, 0, 1, 1,
0.3352322, -0.6739448, 2.908073, 0, 0, 0, 1, 1,
0.3361287, -0.6066813, 3.230936, 0, 0, 0, 1, 1,
0.3368689, -1.655076, 3.124765, 0, 0, 0, 1, 1,
0.3385756, -0.7737638, 2.263256, 1, 1, 1, 1, 1,
0.3411067, -1.59201, 3.779734, 1, 1, 1, 1, 1,
0.3412302, 0.1857544, 1.546514, 1, 1, 1, 1, 1,
0.3417892, 0.3803323, 1.462923, 1, 1, 1, 1, 1,
0.3445362, 1.73897, 0.5927891, 1, 1, 1, 1, 1,
0.3531473, 0.9326687, -1.630528, 1, 1, 1, 1, 1,
0.3548058, -1.00686, 3.051991, 1, 1, 1, 1, 1,
0.3556462, -1.738291, 2.367911, 1, 1, 1, 1, 1,
0.3556951, -0.9308172, 3.367401, 1, 1, 1, 1, 1,
0.3613032, -0.05662115, 3.008733, 1, 1, 1, 1, 1,
0.3648551, -1.412892, 2.977274, 1, 1, 1, 1, 1,
0.3749702, -0.8973274, 3.363676, 1, 1, 1, 1, 1,
0.3761195, -0.3242208, 2.59263, 1, 1, 1, 1, 1,
0.3823647, 0.4304053, 2.044675, 1, 1, 1, 1, 1,
0.3838729, 1.020515, 0.5340099, 1, 1, 1, 1, 1,
0.3847153, 0.3012113, -1.271016, 0, 0, 1, 1, 1,
0.387269, -0.2249562, 2.760337, 1, 0, 0, 1, 1,
0.3898629, -0.1392341, 0.5593182, 1, 0, 0, 1, 1,
0.4004459, 1.637954, 0.05415612, 1, 0, 0, 1, 1,
0.4043204, 0.009175427, 2.310597, 1, 0, 0, 1, 1,
0.4046836, 0.1287743, 1.103316, 1, 0, 0, 1, 1,
0.4072903, -2.392857, 2.30901, 0, 0, 0, 1, 1,
0.4110924, 0.4033523, -0.8195467, 0, 0, 0, 1, 1,
0.4112976, -0.7405319, 2.830301, 0, 0, 0, 1, 1,
0.420534, 0.5361856, 1.14738, 0, 0, 0, 1, 1,
0.4214321, 1.587409, 2.846713, 0, 0, 0, 1, 1,
0.4254589, -0.4975931, 2.953819, 0, 0, 0, 1, 1,
0.429187, 1.114746, 0.1576782, 0, 0, 0, 1, 1,
0.4354655, 0.2254306, -0.2337977, 1, 1, 1, 1, 1,
0.4385364, -0.2571062, 0.5839756, 1, 1, 1, 1, 1,
0.440924, 0.4091776, 1.651373, 1, 1, 1, 1, 1,
0.4423313, 2.56968, 0.5114177, 1, 1, 1, 1, 1,
0.4456598, 0.3808076, 0.7025814, 1, 1, 1, 1, 1,
0.4483539, 0.9947639, -1.215653, 1, 1, 1, 1, 1,
0.4587086, -1.40727, 2.713847, 1, 1, 1, 1, 1,
0.4626341, -0.8573112, 2.786622, 1, 1, 1, 1, 1,
0.4658433, 2.695744, -0.3937033, 1, 1, 1, 1, 1,
0.4734622, 0.1151185, 1.533986, 1, 1, 1, 1, 1,
0.4739102, 0.9605935, 0.2195636, 1, 1, 1, 1, 1,
0.4750809, 0.5051208, -0.09036337, 1, 1, 1, 1, 1,
0.4766863, 2.123696, 1.283542, 1, 1, 1, 1, 1,
0.4900234, -0.2353995, 0.4553746, 1, 1, 1, 1, 1,
0.4925346, -0.8797161, 2.852962, 1, 1, 1, 1, 1,
0.495698, -0.3553344, 3.379978, 0, 0, 1, 1, 1,
0.5010742, 0.1016519, 1.288715, 1, 0, 0, 1, 1,
0.5049275, 0.7807555, 1.672032, 1, 0, 0, 1, 1,
0.5060269, 0.1509784, 0.6366755, 1, 0, 0, 1, 1,
0.5085244, 0.06741546, 2.847899, 1, 0, 0, 1, 1,
0.5111845, 0.7398326, 1.51743, 1, 0, 0, 1, 1,
0.5186406, -0.6368003, 3.018604, 0, 0, 0, 1, 1,
0.5204078, -0.05381702, 3.019789, 0, 0, 0, 1, 1,
0.5401745, 0.3596453, 3.230295, 0, 0, 0, 1, 1,
0.5496454, 1.120719, 1.041393, 0, 0, 0, 1, 1,
0.5501784, 1.422524, -0.7486548, 0, 0, 0, 1, 1,
0.5536405, -2.270474, 3.257698, 0, 0, 0, 1, 1,
0.5549582, 0.3239428, 0.0686676, 0, 0, 0, 1, 1,
0.5572491, 0.1043501, -0.7694483, 1, 1, 1, 1, 1,
0.5638369, 1.774991, 1.691395, 1, 1, 1, 1, 1,
0.5669081, 0.7385457, 1.968777, 1, 1, 1, 1, 1,
0.5673304, -0.270126, 3.233084, 1, 1, 1, 1, 1,
0.5760415, -0.2442047, 1.282972, 1, 1, 1, 1, 1,
0.5799621, -1.723052, 3.531359, 1, 1, 1, 1, 1,
0.5836127, 1.257452, -0.2154257, 1, 1, 1, 1, 1,
0.5863746, 0.7141453, 0.05896445, 1, 1, 1, 1, 1,
0.5931454, -0.09669404, 2.559729, 1, 1, 1, 1, 1,
0.5948142, 0.7931923, -0.2964802, 1, 1, 1, 1, 1,
0.59785, -0.4480628, 1.794209, 1, 1, 1, 1, 1,
0.6019918, -0.7639102, 1.216423, 1, 1, 1, 1, 1,
0.6026602, -0.001002963, 0.5248425, 1, 1, 1, 1, 1,
0.6084875, -1.233987, 4.46734, 1, 1, 1, 1, 1,
0.6109844, -0.1754472, 1.766758, 1, 1, 1, 1, 1,
0.6189132, -0.4734334, 2.996313, 0, 0, 1, 1, 1,
0.6203066, -0.2576672, 1.705646, 1, 0, 0, 1, 1,
0.6211311, -0.7993454, 1.722373, 1, 0, 0, 1, 1,
0.6215395, -1.784494, 3.251937, 1, 0, 0, 1, 1,
0.6253392, -0.336374, 0.9892492, 1, 0, 0, 1, 1,
0.6345506, 0.7128748, -0.04649997, 1, 0, 0, 1, 1,
0.6349519, -0.2921765, 1.997167, 0, 0, 0, 1, 1,
0.637201, 0.8772991, -1.193784, 0, 0, 0, 1, 1,
0.6420435, 0.09439545, 2.582834, 0, 0, 0, 1, 1,
0.657858, -0.7178655, 4.883605, 0, 0, 0, 1, 1,
0.6654848, 0.2225993, 1.523483, 0, 0, 0, 1, 1,
0.6698375, -1.400668, 4.039065, 0, 0, 0, 1, 1,
0.6717855, -1.477555, 1.929533, 0, 0, 0, 1, 1,
0.6724015, 1.181223, 1.628691, 1, 1, 1, 1, 1,
0.6733354, -1.275135, 4.223352, 1, 1, 1, 1, 1,
0.6765751, 2.183425, 0.06786072, 1, 1, 1, 1, 1,
0.6774673, -0.6661878, 3.291657, 1, 1, 1, 1, 1,
0.6879808, 2.042304, 1.964308, 1, 1, 1, 1, 1,
0.7012078, -0.6035521, 2.915482, 1, 1, 1, 1, 1,
0.7021047, -1.446762, 1.264685, 1, 1, 1, 1, 1,
0.7044765, 1.258112, 1.410297, 1, 1, 1, 1, 1,
0.7098807, -0.04329585, 3.148785, 1, 1, 1, 1, 1,
0.713594, -0.8076036, 2.976565, 1, 1, 1, 1, 1,
0.7146875, -0.4413005, 2.543164, 1, 1, 1, 1, 1,
0.7231196, -1.615286, 1.309361, 1, 1, 1, 1, 1,
0.725231, 0.3775476, 0.8731448, 1, 1, 1, 1, 1,
0.7267378, 0.8610714, 0.5772851, 1, 1, 1, 1, 1,
0.7281897, -1.122457, 2.77857, 1, 1, 1, 1, 1,
0.728621, -1.975091, 2.515725, 0, 0, 1, 1, 1,
0.7295543, 0.1615034, -0.3559663, 1, 0, 0, 1, 1,
0.7337817, 1.146657, -0.2893947, 1, 0, 0, 1, 1,
0.7361124, -0.9347556, 1.444417, 1, 0, 0, 1, 1,
0.7392016, 0.9783529, 2.3352, 1, 0, 0, 1, 1,
0.7407336, -0.09532126, 1.690518, 1, 0, 0, 1, 1,
0.7522788, 1.252628, 0.3477878, 0, 0, 0, 1, 1,
0.7560801, -0.4435862, 1.926251, 0, 0, 0, 1, 1,
0.7567512, -1.447364, 1.297092, 0, 0, 0, 1, 1,
0.7593894, -0.819093, 2.536077, 0, 0, 0, 1, 1,
0.761255, -0.6399519, 2.69246, 0, 0, 0, 1, 1,
0.7670202, 0.2505169, 1.65291, 0, 0, 0, 1, 1,
0.7682549, 0.7195292, -1.214926, 0, 0, 0, 1, 1,
0.7771833, 1.228137, -0.4630736, 1, 1, 1, 1, 1,
0.778556, 0.00570322, 1.53365, 1, 1, 1, 1, 1,
0.7830434, 2.562642, 0.4399907, 1, 1, 1, 1, 1,
0.7879329, -0.2430711, 0.5350623, 1, 1, 1, 1, 1,
0.7905619, -0.6344587, 3.024965, 1, 1, 1, 1, 1,
0.7923474, 0.4509503, -0.2869824, 1, 1, 1, 1, 1,
0.7942023, -0.1076458, 0.2982103, 1, 1, 1, 1, 1,
0.7985611, 0.108628, 1.575163, 1, 1, 1, 1, 1,
0.805347, -0.5370529, 2.680464, 1, 1, 1, 1, 1,
0.8091771, 0.288042, 1.565229, 1, 1, 1, 1, 1,
0.8094482, -0.5875388, 2.945187, 1, 1, 1, 1, 1,
0.8236949, -0.0849575, -0.3597153, 1, 1, 1, 1, 1,
0.8333716, -0.04581646, 1.370639, 1, 1, 1, 1, 1,
0.8376743, -0.7698725, 1.574188, 1, 1, 1, 1, 1,
0.8523132, -0.6685375, 3.112033, 1, 1, 1, 1, 1,
0.8525895, 1.013254, 0.8496877, 0, 0, 1, 1, 1,
0.8615724, -1.472047, 1.669667, 1, 0, 0, 1, 1,
0.8646321, -0.1861632, 2.443427, 1, 0, 0, 1, 1,
0.8646827, 0.7199435, -0.2937685, 1, 0, 0, 1, 1,
0.8728601, 0.06909579, 0.769725, 1, 0, 0, 1, 1,
0.8737239, 1.502491, -0.2854533, 1, 0, 0, 1, 1,
0.8739691, 0.5373926, 0.2581621, 0, 0, 0, 1, 1,
0.8769917, 2.758334, -0.5295724, 0, 0, 0, 1, 1,
0.8865287, -0.9542997, 1.868526, 0, 0, 0, 1, 1,
0.891237, -1.792278, 4.038931, 0, 0, 0, 1, 1,
0.8923005, -0.05877654, 2.494931, 0, 0, 0, 1, 1,
0.9014467, 0.8529768, -0.0585621, 0, 0, 0, 1, 1,
0.9042701, 0.704402, 1.278169, 0, 0, 0, 1, 1,
0.9110392, 0.8681255, 1.404944, 1, 1, 1, 1, 1,
0.9194632, -0.4689554, 2.542025, 1, 1, 1, 1, 1,
0.9266582, -1.877876, 4.202672, 1, 1, 1, 1, 1,
0.9350006, 0.3640171, 0.9089075, 1, 1, 1, 1, 1,
0.940457, -0.3369558, 3.96632, 1, 1, 1, 1, 1,
0.9442025, -0.01471472, 1.112838, 1, 1, 1, 1, 1,
0.9446545, 0.2512605, 1.864624, 1, 1, 1, 1, 1,
0.9509161, 2.537009, 0.690149, 1, 1, 1, 1, 1,
0.9511028, -0.3359379, 1.777789, 1, 1, 1, 1, 1,
0.9518915, -2.689564, 3.32136, 1, 1, 1, 1, 1,
0.9520697, -0.655997, 1.892866, 1, 1, 1, 1, 1,
0.9550292, 0.6368001, 1.169735, 1, 1, 1, 1, 1,
0.9660215, -0.08107461, 0.9532106, 1, 1, 1, 1, 1,
0.9722072, -0.746985, 4.269999, 1, 1, 1, 1, 1,
0.9845332, -0.3688533, 1.719725, 1, 1, 1, 1, 1,
0.9850771, 1.325152, 0.2088996, 0, 0, 1, 1, 1,
0.9941132, -0.8851407, 1.851129, 1, 0, 0, 1, 1,
0.9962351, -1.186111, 2.377777, 1, 0, 0, 1, 1,
0.9967408, 1.006251, 1.09079, 1, 0, 0, 1, 1,
0.9999706, 2.468234, -0.2695328, 1, 0, 0, 1, 1,
1.004268, -0.4739948, -0.1162108, 1, 0, 0, 1, 1,
1.007738, 0.3686059, 0.7377105, 0, 0, 0, 1, 1,
1.009941, -0.8825178, 2.198734, 0, 0, 0, 1, 1,
1.01484, 0.6997378, 2.025414, 0, 0, 0, 1, 1,
1.015028, 0.4029139, 1.456374, 0, 0, 0, 1, 1,
1.018789, -0.1791735, 1.290801, 0, 0, 0, 1, 1,
1.025335, 1.136183, 1.777383, 0, 0, 0, 1, 1,
1.030655, 1.43002, 1.600449, 0, 0, 0, 1, 1,
1.032552, 0.06414302, -0.1062572, 1, 1, 1, 1, 1,
1.035084, 0.469205, 2.59272, 1, 1, 1, 1, 1,
1.037896, 1.096266, -0.682108, 1, 1, 1, 1, 1,
1.038326, 0.02399558, 2.526213, 1, 1, 1, 1, 1,
1.042174, -0.9320064, 1.730864, 1, 1, 1, 1, 1,
1.043612, -0.4992967, 2.097068, 1, 1, 1, 1, 1,
1.046624, 0.9565787, -0.4945413, 1, 1, 1, 1, 1,
1.049575, -1.018277, 1.116615, 1, 1, 1, 1, 1,
1.049917, 0.2973761, 1.67817, 1, 1, 1, 1, 1,
1.050104, 0.6633793, 1.484199, 1, 1, 1, 1, 1,
1.058463, 1.084388, 0.4680071, 1, 1, 1, 1, 1,
1.059893, -0.652904, 2.609245, 1, 1, 1, 1, 1,
1.063789, 0.8357791, 1.739714, 1, 1, 1, 1, 1,
1.065643, -0.4798993, 2.673197, 1, 1, 1, 1, 1,
1.072226, 0.9477262, 1.134384, 1, 1, 1, 1, 1,
1.074352, -1.797169, 2.942708, 0, 0, 1, 1, 1,
1.082019, 0.2468015, 0.1460561, 1, 0, 0, 1, 1,
1.085008, 1.487925, 0.6267094, 1, 0, 0, 1, 1,
1.092627, 0.7142654, -0.5437711, 1, 0, 0, 1, 1,
1.103221, 1.023416, 0.6768938, 1, 0, 0, 1, 1,
1.110707, 2.104178, 1.777344, 1, 0, 0, 1, 1,
1.113217, 0.9057236, 0.1078742, 0, 0, 0, 1, 1,
1.11327, -0.09304939, 1.871118, 0, 0, 0, 1, 1,
1.119322, -0.933382, 1.304109, 0, 0, 0, 1, 1,
1.133445, -1.716604, 3.317704, 0, 0, 0, 1, 1,
1.136769, 0.259363, 0.6631244, 0, 0, 0, 1, 1,
1.138879, -0.5602759, 1.63218, 0, 0, 0, 1, 1,
1.14011, -0.4042796, 1.580417, 0, 0, 0, 1, 1,
1.140578, -1.548629, 3.946213, 1, 1, 1, 1, 1,
1.14247, -0.47291, 2.817034, 1, 1, 1, 1, 1,
1.147941, -0.2833786, 0.6333137, 1, 1, 1, 1, 1,
1.16384, -0.2491287, 2.847833, 1, 1, 1, 1, 1,
1.168726, -0.3097579, 1.769933, 1, 1, 1, 1, 1,
1.177163, -0.5749725, 1.336229, 1, 1, 1, 1, 1,
1.178705, 1.041175, -1.5736, 1, 1, 1, 1, 1,
1.187787, 1.204346, 1.391068, 1, 1, 1, 1, 1,
1.215935, 0.01631258, 1.869761, 1, 1, 1, 1, 1,
1.217086, -1.362533, 1.400836, 1, 1, 1, 1, 1,
1.218457, 0.1279074, 0.9634929, 1, 1, 1, 1, 1,
1.220455, -0.09557763, 3.680927, 1, 1, 1, 1, 1,
1.221724, 0.7413728, 0.1990709, 1, 1, 1, 1, 1,
1.241003, -1.631053, 1.197734, 1, 1, 1, 1, 1,
1.241447, -1.402326, 0.9241917, 1, 1, 1, 1, 1,
1.251209, 0.7808121, 0.9220875, 0, 0, 1, 1, 1,
1.258924, -0.934734, 3.545051, 1, 0, 0, 1, 1,
1.264087, 1.559941, 0.8816976, 1, 0, 0, 1, 1,
1.280928, -0.3955062, 1.727628, 1, 0, 0, 1, 1,
1.299754, 0.6113428, 2.365499, 1, 0, 0, 1, 1,
1.30563, 1.577077, 0.8051214, 1, 0, 0, 1, 1,
1.306726, 1.759092, 1.065656, 0, 0, 0, 1, 1,
1.307701, -1.637198, 4.325049, 0, 0, 0, 1, 1,
1.310732, -1.622357, 2.259468, 0, 0, 0, 1, 1,
1.317408, 0.3319147, 3.0077, 0, 0, 0, 1, 1,
1.323421, -0.633518, 2.948087, 0, 0, 0, 1, 1,
1.335657, 0.2729597, 1.548232, 0, 0, 0, 1, 1,
1.341468, 1.782397, -0.05754634, 0, 0, 0, 1, 1,
1.345513, -0.7896336, 2.812552, 1, 1, 1, 1, 1,
1.347747, 0.7527143, 2.520302, 1, 1, 1, 1, 1,
1.347789, -1.14665, 2.382275, 1, 1, 1, 1, 1,
1.364671, -0.2423563, 0.9574796, 1, 1, 1, 1, 1,
1.366081, -0.1990658, -0.2205314, 1, 1, 1, 1, 1,
1.371466, -0.1613141, 2.266142, 1, 1, 1, 1, 1,
1.373719, -0.2237788, 2.255526, 1, 1, 1, 1, 1,
1.373994, -1.611937, 1.49129, 1, 1, 1, 1, 1,
1.376563, 1.671713, 0.5309927, 1, 1, 1, 1, 1,
1.37858, -1.218558, 3.337383, 1, 1, 1, 1, 1,
1.378694, 1.18292, -0.9629607, 1, 1, 1, 1, 1,
1.378959, -1.520533, 2.612865, 1, 1, 1, 1, 1,
1.393764, 2.295779, 1.807836, 1, 1, 1, 1, 1,
1.397108, -2.227444, 1.743644, 1, 1, 1, 1, 1,
1.402776, 0.131659, -0.02129254, 1, 1, 1, 1, 1,
1.409055, 0.03038035, 1.600309, 0, 0, 1, 1, 1,
1.411779, -0.1523862, 1.547, 1, 0, 0, 1, 1,
1.412456, 0.8417603, -0.6537903, 1, 0, 0, 1, 1,
1.422402, -1.249076, 2.819211, 1, 0, 0, 1, 1,
1.44357, 0.765762, 1.896712, 1, 0, 0, 1, 1,
1.45515, 0.8563767, 0.2084063, 1, 0, 0, 1, 1,
1.463971, 0.9231513, 1.556451, 0, 0, 0, 1, 1,
1.464051, -1.235814, 3.068578, 0, 0, 0, 1, 1,
1.469074, -0.1864618, 1.163162, 0, 0, 0, 1, 1,
1.482131, -0.9131578, 1.90113, 0, 0, 0, 1, 1,
1.483021, 1.252159, 0.2958063, 0, 0, 0, 1, 1,
1.494177, -1.091747, 1.604412, 0, 0, 0, 1, 1,
1.510475, 0.9736076, 0.2123711, 0, 0, 0, 1, 1,
1.524425, 0.3180841, 1.244542, 1, 1, 1, 1, 1,
1.525375, -0.8731118, 4.055947, 1, 1, 1, 1, 1,
1.526275, -1.009098, 0.1113092, 1, 1, 1, 1, 1,
1.526855, -0.2783452, 0.6167185, 1, 1, 1, 1, 1,
1.536183, -1.450184, 2.98995, 1, 1, 1, 1, 1,
1.537794, 1.38044, 0.8393501, 1, 1, 1, 1, 1,
1.539332, -0.8949154, 1.507047, 1, 1, 1, 1, 1,
1.542937, 0.1758464, 3.021256, 1, 1, 1, 1, 1,
1.543781, 2.451485, 0.6603197, 1, 1, 1, 1, 1,
1.546213, 0.1628103, 2.343767, 1, 1, 1, 1, 1,
1.559479, -0.1640703, 1.560288, 1, 1, 1, 1, 1,
1.579058, -0.1220943, 1.710731, 1, 1, 1, 1, 1,
1.588079, 0.1579092, 1.82834, 1, 1, 1, 1, 1,
1.591394, 0.3866176, 2.615997, 1, 1, 1, 1, 1,
1.599316, -0.2123788, -0.9498734, 1, 1, 1, 1, 1,
1.599368, 1.580694, 0.4781668, 0, 0, 1, 1, 1,
1.624933, -0.5421205, 0.3945611, 1, 0, 0, 1, 1,
1.625187, 0.7161366, -0.8548613, 1, 0, 0, 1, 1,
1.651878, 1.081746, -0.3349357, 1, 0, 0, 1, 1,
1.652496, -0.5253404, 2.010143, 1, 0, 0, 1, 1,
1.65429, -1.076063, 4.11053, 1, 0, 0, 1, 1,
1.664484, -0.6977143, 1.199737, 0, 0, 0, 1, 1,
1.669097, 0.02271619, 0.6870432, 0, 0, 0, 1, 1,
1.67143, -1.610997, 2.288125, 0, 0, 0, 1, 1,
1.683725, 1.168715, -0.651457, 0, 0, 0, 1, 1,
1.701307, 0.5262247, 0.4157026, 0, 0, 0, 1, 1,
1.704951, -1.165692, 0.3737619, 0, 0, 0, 1, 1,
1.705775, -0.3234017, 1.465784, 0, 0, 0, 1, 1,
1.756205, 0.1603759, -0.1324281, 1, 1, 1, 1, 1,
1.75923, 1.395636, 1.820277, 1, 1, 1, 1, 1,
1.765721, -0.2513541, 0.8233652, 1, 1, 1, 1, 1,
1.767577, -2.239911, 3.737495, 1, 1, 1, 1, 1,
1.802588, 0.3947256, 1.335738, 1, 1, 1, 1, 1,
1.804574, 1.730257, 0.8261917, 1, 1, 1, 1, 1,
1.834086, -0.6793767, 1.9815, 1, 1, 1, 1, 1,
1.845999, 0.7107487, 0.9294001, 1, 1, 1, 1, 1,
1.852863, -0.449551, 2.769063, 1, 1, 1, 1, 1,
1.870627, 0.1592084, 2.523452, 1, 1, 1, 1, 1,
1.87365, 0.802022, 0.7767332, 1, 1, 1, 1, 1,
1.889262, -0.434361, 1.75773, 1, 1, 1, 1, 1,
1.967727, -0.8714302, 2.171149, 1, 1, 1, 1, 1,
1.977329, -0.414452, 0.6833318, 1, 1, 1, 1, 1,
1.983694, -0.3370933, 1.338955, 1, 1, 1, 1, 1,
1.992231, 0.8675647, -1.050513, 0, 0, 1, 1, 1,
1.994214, 1.81828, 0.6723534, 1, 0, 0, 1, 1,
2.004485, -1.803706, 2.040006, 1, 0, 0, 1, 1,
2.005833, 1.317402, -0.4006428, 1, 0, 0, 1, 1,
2.007501, -0.3763277, 3.401386, 1, 0, 0, 1, 1,
2.06624, -1.104517, 3.508505, 1, 0, 0, 1, 1,
2.078055, 0.5443092, 1.185302, 0, 0, 0, 1, 1,
2.109863, 0.4657735, 1.163442, 0, 0, 0, 1, 1,
2.118037, -1.243443, 1.324303, 0, 0, 0, 1, 1,
2.134931, -1.240526, 1.740102, 0, 0, 0, 1, 1,
2.152243, 0.04368802, 3.464428, 0, 0, 0, 1, 1,
2.225391, 1.509443, 1.507024, 0, 0, 0, 1, 1,
2.275078, -1.231069, 3.588105, 0, 0, 0, 1, 1,
2.371725, 0.1684971, 1.284917, 1, 1, 1, 1, 1,
2.417447, -0.5111537, 0.5484375, 1, 1, 1, 1, 1,
2.479883, 0.6394258, 1.865195, 1, 1, 1, 1, 1,
2.487366, -1.355003, 3.310063, 1, 1, 1, 1, 1,
2.577772, -0.6679972, 1.056859, 1, 1, 1, 1, 1,
2.677774, 0.561699, 0.8240212, 1, 1, 1, 1, 1,
2.96123, 0.6369846, 1.053704, 1, 1, 1, 1, 1
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
var radius = 9.642988;
var distance = 33.87059;
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
mvMatrix.translate( 0.3558862, -0.1933031, 0.5247288 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.87059);
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
