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
-3.344364, 0.3772027, -3.009867, 1, 0, 0, 1,
-2.969511, 0.5048726, -2.342297, 1, 0.007843138, 0, 1,
-2.755339, 1.512087, -2.375796, 1, 0.01176471, 0, 1,
-2.743713, 0.531935, -1.86039, 1, 0.01960784, 0, 1,
-2.724922, -1.406466, -2.013742, 1, 0.02352941, 0, 1,
-2.601304, 0.1358865, -3.833579, 1, 0.03137255, 0, 1,
-2.552955, -0.04145322, -3.269749, 1, 0.03529412, 0, 1,
-2.366162, 0.1845931, -0.4721662, 1, 0.04313726, 0, 1,
-2.32455, 0.9809135, -0.4320675, 1, 0.04705882, 0, 1,
-2.314245, 0.5990669, -0.5020481, 1, 0.05490196, 0, 1,
-2.288826, 0.8412471, -1.392781, 1, 0.05882353, 0, 1,
-2.266227, -1.716317, -2.96654, 1, 0.06666667, 0, 1,
-2.257324, 2.286198, -0.8242962, 1, 0.07058824, 0, 1,
-2.210486, 1.244275, -3.292426, 1, 0.07843138, 0, 1,
-2.179156, 0.3942461, -1.708618, 1, 0.08235294, 0, 1,
-2.170651, -0.08663071, -2.72612, 1, 0.09019608, 0, 1,
-2.163442, 0.1125983, -1.285301, 1, 0.09411765, 0, 1,
-2.131761, -0.5281082, -3.303566, 1, 0.1019608, 0, 1,
-2.127722, -0.007143998, -1.01633, 1, 0.1098039, 0, 1,
-2.100349, -0.3699056, -1.677171, 1, 0.1137255, 0, 1,
-2.095313, -0.6059463, -0.9602221, 1, 0.1215686, 0, 1,
-2.09256, -1.922968, -3.508653, 1, 0.1254902, 0, 1,
-2.075536, -0.2564425, -1.962293, 1, 0.1333333, 0, 1,
-2.065909, 0.01099708, -2.097757, 1, 0.1372549, 0, 1,
-2.063203, -2.45741, -2.659368, 1, 0.145098, 0, 1,
-2.040774, 2.293208, -2.508796, 1, 0.1490196, 0, 1,
-2.033948, 1.249413, -0.3974806, 1, 0.1568628, 0, 1,
-2.011044, -0.09470282, -0.2346011, 1, 0.1607843, 0, 1,
-1.975831, 1.259867, -0.3137968, 1, 0.1686275, 0, 1,
-1.973593, 0.07410841, -2.070966, 1, 0.172549, 0, 1,
-1.951609, -0.1386563, -2.182712, 1, 0.1803922, 0, 1,
-1.941493, 0.7276634, 0.611365, 1, 0.1843137, 0, 1,
-1.908939, 1.521416, -2.778476, 1, 0.1921569, 0, 1,
-1.908223, 0.8800746, -1.408338, 1, 0.1960784, 0, 1,
-1.905889, 0.3290688, 0.7060888, 1, 0.2039216, 0, 1,
-1.87166, 2.601911, -0.4506671, 1, 0.2117647, 0, 1,
-1.867752, 1.08421, -0.6757819, 1, 0.2156863, 0, 1,
-1.865247, 2.073874, 1.799826, 1, 0.2235294, 0, 1,
-1.832206, -1.210796, -2.86223, 1, 0.227451, 0, 1,
-1.821092, -1.219168, -1.929844, 1, 0.2352941, 0, 1,
-1.819578, 1.36806, -2.376792, 1, 0.2392157, 0, 1,
-1.801486, 0.3897548, -3.407314, 1, 0.2470588, 0, 1,
-1.795838, 0.6191208, 1.494751, 1, 0.2509804, 0, 1,
-1.795456, -1.130712, -1.636729, 1, 0.2588235, 0, 1,
-1.7906, -0.4834984, -2.168051, 1, 0.2627451, 0, 1,
-1.789129, 0.9018475, 0.3443215, 1, 0.2705882, 0, 1,
-1.782633, 0.3495477, -0.3135326, 1, 0.2745098, 0, 1,
-1.761429, -0.3412176, -1.59609, 1, 0.282353, 0, 1,
-1.723433, 0.5520988, -1.386787, 1, 0.2862745, 0, 1,
-1.720955, -0.0966877, -1.694819, 1, 0.2941177, 0, 1,
-1.700989, 0.9913542, -0.3365915, 1, 0.3019608, 0, 1,
-1.666103, -0.2843111, -2.538225, 1, 0.3058824, 0, 1,
-1.660242, 1.727913, -0.1580216, 1, 0.3137255, 0, 1,
-1.647716, -1.156583, -2.357478, 1, 0.3176471, 0, 1,
-1.635732, 0.2765117, 1.31107, 1, 0.3254902, 0, 1,
-1.634543, 0.9723658, -0.4752405, 1, 0.3294118, 0, 1,
-1.625358, -0.4294611, -2.195304, 1, 0.3372549, 0, 1,
-1.610736, 1.236667, -0.2809307, 1, 0.3411765, 0, 1,
-1.602003, -0.6607215, -1.741374, 1, 0.3490196, 0, 1,
-1.587003, 1.179578, -1.674043, 1, 0.3529412, 0, 1,
-1.586715, 1.43946, -1.044529, 1, 0.3607843, 0, 1,
-1.56524, 0.6388666, -1.273031, 1, 0.3647059, 0, 1,
-1.552121, -0.9280912, -3.435357, 1, 0.372549, 0, 1,
-1.547945, 0.7631307, -0.828905, 1, 0.3764706, 0, 1,
-1.524902, -1.594252, -1.47269, 1, 0.3843137, 0, 1,
-1.519851, -1.554119, -1.34859, 1, 0.3882353, 0, 1,
-1.518946, -0.9515671, -0.7158259, 1, 0.3960784, 0, 1,
-1.504158, 0.03964542, -2.540055, 1, 0.4039216, 0, 1,
-1.487733, 0.7681125, -2.233468, 1, 0.4078431, 0, 1,
-1.481658, 0.8772652, -0.3256785, 1, 0.4156863, 0, 1,
-1.466299, -0.6900567, -0.3624807, 1, 0.4196078, 0, 1,
-1.46307, -0.5205147, -1.977677, 1, 0.427451, 0, 1,
-1.452411, 0.6237812, -1.395042, 1, 0.4313726, 0, 1,
-1.449396, 0.2464551, -1.149027, 1, 0.4392157, 0, 1,
-1.447167, -0.07614835, -1.467784, 1, 0.4431373, 0, 1,
-1.447124, -0.873248, -2.025391, 1, 0.4509804, 0, 1,
-1.442246, 0.06644545, -1.798853, 1, 0.454902, 0, 1,
-1.441361, -0.8009806, -1.704877, 1, 0.4627451, 0, 1,
-1.437116, -0.6209114, -2.296981, 1, 0.4666667, 0, 1,
-1.431474, 0.9788964, -0.4638928, 1, 0.4745098, 0, 1,
-1.424687, -0.6908925, -2.739384, 1, 0.4784314, 0, 1,
-1.423366, -1.949145, -1.849887, 1, 0.4862745, 0, 1,
-1.420849, 0.1557024, -1.271015, 1, 0.4901961, 0, 1,
-1.41281, -1.152371, -2.595534, 1, 0.4980392, 0, 1,
-1.397001, -1.230013, -3.087436, 1, 0.5058824, 0, 1,
-1.385296, 0.9773627, -1.729459, 1, 0.509804, 0, 1,
-1.383933, -0.3941332, -2.111506, 1, 0.5176471, 0, 1,
-1.382509, -1.576675, -3.135267, 1, 0.5215687, 0, 1,
-1.381932, -0.4904619, -3.01762, 1, 0.5294118, 0, 1,
-1.373978, 1.076913, -2.261325, 1, 0.5333334, 0, 1,
-1.37297, -1.473324, -1.457945, 1, 0.5411765, 0, 1,
-1.358302, 0.4996831, -0.9952488, 1, 0.5450981, 0, 1,
-1.35604, -0.2663908, -1.980664, 1, 0.5529412, 0, 1,
-1.353248, 1.006065, -1.351425, 1, 0.5568628, 0, 1,
-1.352596, 1.102007, -1.162547, 1, 0.5647059, 0, 1,
-1.344653, -1.71219, -3.206861, 1, 0.5686275, 0, 1,
-1.337899, -0.471181, -0.2454403, 1, 0.5764706, 0, 1,
-1.337094, 0.03124113, -1.332137, 1, 0.5803922, 0, 1,
-1.331425, -1.134227, -3.783086, 1, 0.5882353, 0, 1,
-1.321436, 1.184736, 0.1525011, 1, 0.5921569, 0, 1,
-1.315211, -0.148764, -2.500699, 1, 0.6, 0, 1,
-1.311277, 1.025687, -0.3843813, 1, 0.6078432, 0, 1,
-1.306136, 1.672746, -2.608004, 1, 0.6117647, 0, 1,
-1.29336, 0.9299286, -1.29234, 1, 0.6196079, 0, 1,
-1.273388, -0.2389084, -1.196849, 1, 0.6235294, 0, 1,
-1.271986, -0.2776382, -1.150932, 1, 0.6313726, 0, 1,
-1.270721, 0.2213461, -1.922533, 1, 0.6352941, 0, 1,
-1.265963, 0.02318116, -4.043354, 1, 0.6431373, 0, 1,
-1.253124, -0.7272783, -3.09009, 1, 0.6470588, 0, 1,
-1.251567, -0.4928836, -1.688402, 1, 0.654902, 0, 1,
-1.247257, 0.678035, -0.1657602, 1, 0.6588235, 0, 1,
-1.245144, -1.174594, -0.842754, 1, 0.6666667, 0, 1,
-1.226161, -0.8478391, -1.813872, 1, 0.6705883, 0, 1,
-1.21966, 1.355664, -1.757491, 1, 0.6784314, 0, 1,
-1.218524, -0.5584444, -2.381377, 1, 0.682353, 0, 1,
-1.203302, 0.06650386, -1.97084, 1, 0.6901961, 0, 1,
-1.19515, -0.2923335, -0.2691807, 1, 0.6941177, 0, 1,
-1.187765, -0.8239421, -3.298531, 1, 0.7019608, 0, 1,
-1.186899, 0.34571, -0.7855722, 1, 0.7098039, 0, 1,
-1.183012, 1.144366, -1.08991, 1, 0.7137255, 0, 1,
-1.171637, -0.4368146, -0.552662, 1, 0.7215686, 0, 1,
-1.170701, -0.03375262, -1.853204, 1, 0.7254902, 0, 1,
-1.166212, 1.260725, -1.277981, 1, 0.7333333, 0, 1,
-1.161232, -0.1881498, -2.355115, 1, 0.7372549, 0, 1,
-1.159839, -0.4381475, -0.8502922, 1, 0.7450981, 0, 1,
-1.159454, -0.2062323, -1.731554, 1, 0.7490196, 0, 1,
-1.156188, -0.4338134, -3.60824, 1, 0.7568628, 0, 1,
-1.151928, -0.3240926, -1.508819, 1, 0.7607843, 0, 1,
-1.149384, 0.8480364, -1.971195, 1, 0.7686275, 0, 1,
-1.146882, -1.13422, -1.84666, 1, 0.772549, 0, 1,
-1.127124, 1.033788, -1.235406, 1, 0.7803922, 0, 1,
-1.124746, -0.1656249, -1.17652, 1, 0.7843137, 0, 1,
-1.122142, 1.355796, -2.026702, 1, 0.7921569, 0, 1,
-1.119853, -0.3263964, -2.190126, 1, 0.7960784, 0, 1,
-1.112164, 0.7378128, -0.1101648, 1, 0.8039216, 0, 1,
-1.11175, -0.5372409, -2.90072, 1, 0.8117647, 0, 1,
-1.110073, -1.366359, -2.168061, 1, 0.8156863, 0, 1,
-1.096461, -0.1640025, -0.4129433, 1, 0.8235294, 0, 1,
-1.088112, -1.218005, -4.43538, 1, 0.827451, 0, 1,
-1.082659, 0.08443842, -3.315238, 1, 0.8352941, 0, 1,
-1.077399, -0.5292953, -3.312952, 1, 0.8392157, 0, 1,
-1.071202, -1.103093, -2.912839, 1, 0.8470588, 0, 1,
-1.061312, -0.1665921, -0.4483929, 1, 0.8509804, 0, 1,
-1.056003, 2.264521, -1.387407, 1, 0.8588235, 0, 1,
-1.053557, 1.042482, -2.244216, 1, 0.8627451, 0, 1,
-1.053525, 0.9762768, -1.064124, 1, 0.8705882, 0, 1,
-1.051894, -0.7301311, -0.6859739, 1, 0.8745098, 0, 1,
-1.041001, -0.6896057, -1.065131, 1, 0.8823529, 0, 1,
-1.034732, 1.219084, -2.046465, 1, 0.8862745, 0, 1,
-1.032889, -0.5598538, -2.070541, 1, 0.8941177, 0, 1,
-1.026386, 2.236587, 0.4069127, 1, 0.8980392, 0, 1,
-1.025392, -2.40306, -3.987858, 1, 0.9058824, 0, 1,
-1.02031, -0.7928912, -1.703734, 1, 0.9137255, 0, 1,
-1.019036, 1.473257, -0.7498556, 1, 0.9176471, 0, 1,
-1.016295, -0.01204603, 0.3292537, 1, 0.9254902, 0, 1,
-1.015588, 0.05551296, -2.332724, 1, 0.9294118, 0, 1,
-1.012666, 2.534972, -0.3667461, 1, 0.9372549, 0, 1,
-1.011523, -1.077276, -2.113785, 1, 0.9411765, 0, 1,
-1.009197, 1.478901, -0.4413125, 1, 0.9490196, 0, 1,
-1.001925, -0.4107993, -2.209815, 1, 0.9529412, 0, 1,
-0.9977915, -0.4187361, -3.164345, 1, 0.9607843, 0, 1,
-0.9966036, 1.171321, -1.945845, 1, 0.9647059, 0, 1,
-0.9920809, -0.7779827, -0.8875265, 1, 0.972549, 0, 1,
-0.9910432, -0.5944875, -0.7178074, 1, 0.9764706, 0, 1,
-0.9866489, -1.160696, -2.657887, 1, 0.9843137, 0, 1,
-0.9814907, 0.8909229, -1.151095, 1, 0.9882353, 0, 1,
-0.9807788, -0.4821717, -2.181865, 1, 0.9960784, 0, 1,
-0.9773564, -1.158232, -3.491412, 0.9960784, 1, 0, 1,
-0.9750722, 0.9235761, -0.299733, 0.9921569, 1, 0, 1,
-0.9682686, -0.2746063, -1.316776, 0.9843137, 1, 0, 1,
-0.9618174, 0.3310814, -2.638422, 0.9803922, 1, 0, 1,
-0.9590951, 0.7437087, -2.276976, 0.972549, 1, 0, 1,
-0.9520119, 0.5319804, -0.453956, 0.9686275, 1, 0, 1,
-0.95032, 0.4517623, -1.100936, 0.9607843, 1, 0, 1,
-0.944478, -0.3753469, -1.635828, 0.9568627, 1, 0, 1,
-0.9429344, -0.1994134, -1.516042, 0.9490196, 1, 0, 1,
-0.9340679, -0.05365784, -2.670254, 0.945098, 1, 0, 1,
-0.9304957, 2.029929, 0.2761801, 0.9372549, 1, 0, 1,
-0.9271121, 0.9850784, -1.985605, 0.9333333, 1, 0, 1,
-0.9232885, -0.04467253, 0.3859386, 0.9254902, 1, 0, 1,
-0.922464, 1.351254, -0.3176361, 0.9215686, 1, 0, 1,
-0.9138069, 1.078375, -1.15097, 0.9137255, 1, 0, 1,
-0.911135, -0.6072054, -0.6684526, 0.9098039, 1, 0, 1,
-0.9066173, -0.5724504, -0.3696283, 0.9019608, 1, 0, 1,
-0.9030746, 0.4348642, -1.630431, 0.8941177, 1, 0, 1,
-0.9026397, -0.3015851, -1.448331, 0.8901961, 1, 0, 1,
-0.9009377, 0.8311069, -0.1193706, 0.8823529, 1, 0, 1,
-0.893627, 0.2051474, -2.375156, 0.8784314, 1, 0, 1,
-0.8915172, -0.6627801, -3.837147, 0.8705882, 1, 0, 1,
-0.8906223, -0.8278596, -2.470905, 0.8666667, 1, 0, 1,
-0.889038, 1.006723, -0.5573663, 0.8588235, 1, 0, 1,
-0.8859125, -0.8559965, -2.553819, 0.854902, 1, 0, 1,
-0.8833554, 0.1389549, -0.2129549, 0.8470588, 1, 0, 1,
-0.8820018, 1.659608, -0.9733599, 0.8431373, 1, 0, 1,
-0.8809047, 0.2773623, -1.741527, 0.8352941, 1, 0, 1,
-0.8739709, -0.9920764, -2.868572, 0.8313726, 1, 0, 1,
-0.8725363, -0.2159778, -1.408083, 0.8235294, 1, 0, 1,
-0.8679568, 1.320734, -0.9667405, 0.8196079, 1, 0, 1,
-0.8676204, 0.600578, -1.039974, 0.8117647, 1, 0, 1,
-0.8655379, -1.358613, -3.560262, 0.8078431, 1, 0, 1,
-0.8639132, -0.1002925, -2.467244, 0.8, 1, 0, 1,
-0.8623328, 1.39807, -1.586615, 0.7921569, 1, 0, 1,
-0.8599038, -0.05190264, -0.9539695, 0.7882353, 1, 0, 1,
-0.8593674, -1.163214, -2.171259, 0.7803922, 1, 0, 1,
-0.8590155, 0.1082232, -1.633213, 0.7764706, 1, 0, 1,
-0.8572571, -0.7446525, -3.536812, 0.7686275, 1, 0, 1,
-0.8568904, -0.4080518, -2.848341, 0.7647059, 1, 0, 1,
-0.854533, -0.7239763, -1.931476, 0.7568628, 1, 0, 1,
-0.8492502, 1.103528, -0.06495839, 0.7529412, 1, 0, 1,
-0.8449175, -0.1918714, -1.014982, 0.7450981, 1, 0, 1,
-0.8386778, -1.040894, -1.420383, 0.7411765, 1, 0, 1,
-0.8381749, -0.6491688, -1.732733, 0.7333333, 1, 0, 1,
-0.8353329, -0.6927935, -0.3644808, 0.7294118, 1, 0, 1,
-0.8347741, 0.02700975, -2.444576, 0.7215686, 1, 0, 1,
-0.8335145, 2.366288, -1.383552, 0.7176471, 1, 0, 1,
-0.8325371, 1.527571, -2.075049, 0.7098039, 1, 0, 1,
-0.8305696, 0.9813733, 0.2451134, 0.7058824, 1, 0, 1,
-0.8290412, 0.4660715, -2.451057, 0.6980392, 1, 0, 1,
-0.8262323, 0.7601009, -1.713833, 0.6901961, 1, 0, 1,
-0.8241345, 1.180489, -1.820027, 0.6862745, 1, 0, 1,
-0.8204604, 0.1833045, -1.571381, 0.6784314, 1, 0, 1,
-0.8096685, -1.108441, -1.114553, 0.6745098, 1, 0, 1,
-0.8067597, 0.9426739, -0.8573868, 0.6666667, 1, 0, 1,
-0.7995861, -0.5858728, -4.353303, 0.6627451, 1, 0, 1,
-0.7975755, 0.05607594, -0.3536843, 0.654902, 1, 0, 1,
-0.7948106, 1.872917, -0.3069434, 0.6509804, 1, 0, 1,
-0.7940446, 0.1937794, -0.4701861, 0.6431373, 1, 0, 1,
-0.7939858, -0.6077908, -1.925934, 0.6392157, 1, 0, 1,
-0.7922149, 1.366264, -1.519723, 0.6313726, 1, 0, 1,
-0.7912563, -0.4728191, -2.099293, 0.627451, 1, 0, 1,
-0.7909124, -1.083591, -2.902265, 0.6196079, 1, 0, 1,
-0.7906712, -0.4301948, -3.181921, 0.6156863, 1, 0, 1,
-0.7887325, -0.6232143, -1.289392, 0.6078432, 1, 0, 1,
-0.7870292, 0.8545067, -0.8671481, 0.6039216, 1, 0, 1,
-0.7706801, -0.4734916, -2.777337, 0.5960785, 1, 0, 1,
-0.7703862, 0.6194124, -2.391074, 0.5882353, 1, 0, 1,
-0.7500786, 1.063214, -0.5899338, 0.5843138, 1, 0, 1,
-0.7468144, -0.2641907, 0.07048481, 0.5764706, 1, 0, 1,
-0.7455444, 0.6810931, -1.442837, 0.572549, 1, 0, 1,
-0.7415999, 0.3315695, -1.338557, 0.5647059, 1, 0, 1,
-0.7388027, 1.908678, 0.2955791, 0.5607843, 1, 0, 1,
-0.7314535, -0.9332874, -1.826616, 0.5529412, 1, 0, 1,
-0.7298594, -0.6194984, -3.158434, 0.5490196, 1, 0, 1,
-0.7249348, 1.570673, -0.5527884, 0.5411765, 1, 0, 1,
-0.7240042, -1.386312, -1.755893, 0.5372549, 1, 0, 1,
-0.712306, 0.3396409, -1.650001, 0.5294118, 1, 0, 1,
-0.7011668, -0.4802628, -2.59273, 0.5254902, 1, 0, 1,
-0.7003707, 1.172245, -1.67724, 0.5176471, 1, 0, 1,
-0.6974699, 0.3547402, -2.03674, 0.5137255, 1, 0, 1,
-0.6960021, 0.3027983, -0.399722, 0.5058824, 1, 0, 1,
-0.6949846, 1.383826, -0.7097585, 0.5019608, 1, 0, 1,
-0.6921188, 0.7579125, -2.299498, 0.4941176, 1, 0, 1,
-0.6917402, 0.3874678, -0.06610852, 0.4862745, 1, 0, 1,
-0.6909274, -1.593493, -5.31062, 0.4823529, 1, 0, 1,
-0.6896044, -0.229561, 0.1759979, 0.4745098, 1, 0, 1,
-0.6872901, 0.1794777, -0.368223, 0.4705882, 1, 0, 1,
-0.6870562, -0.2281934, -1.634293, 0.4627451, 1, 0, 1,
-0.6864848, 0.3370013, -1.229188, 0.4588235, 1, 0, 1,
-0.6855395, -0.9213359, -3.839512, 0.4509804, 1, 0, 1,
-0.6821502, 0.3287432, -0.9092361, 0.4470588, 1, 0, 1,
-0.6668456, 0.06088965, -1.952607, 0.4392157, 1, 0, 1,
-0.6564608, 1.257951, -2.867432, 0.4352941, 1, 0, 1,
-0.6506725, -0.2576249, -0.9936486, 0.427451, 1, 0, 1,
-0.6444024, -0.453297, -2.582847, 0.4235294, 1, 0, 1,
-0.6416025, 0.2349859, -0.4082799, 0.4156863, 1, 0, 1,
-0.6388892, -0.9970567, -1.618039, 0.4117647, 1, 0, 1,
-0.6373209, 0.5852051, -0.4114926, 0.4039216, 1, 0, 1,
-0.6348633, -0.8137269, -3.398689, 0.3960784, 1, 0, 1,
-0.6333118, 0.2786913, 0.6972906, 0.3921569, 1, 0, 1,
-0.6324263, 0.09698108, -1.656064, 0.3843137, 1, 0, 1,
-0.62988, -0.00730193, -1.965708, 0.3803922, 1, 0, 1,
-0.6297694, 1.08655, -1.461665, 0.372549, 1, 0, 1,
-0.6297398, 1.129161, -1.434947, 0.3686275, 1, 0, 1,
-0.6294594, 0.4856209, -1.923366, 0.3607843, 1, 0, 1,
-0.6269436, 1.56573, 1.632056, 0.3568628, 1, 0, 1,
-0.6265842, -1.045953, -2.480637, 0.3490196, 1, 0, 1,
-0.6257013, -2.059793, -2.435249, 0.345098, 1, 0, 1,
-0.6239583, 1.958584, -0.5318087, 0.3372549, 1, 0, 1,
-0.6233749, -0.0535325, -0.07028374, 0.3333333, 1, 0, 1,
-0.6191908, 1.959965, -0.08284032, 0.3254902, 1, 0, 1,
-0.616712, -1.308825, -0.8067673, 0.3215686, 1, 0, 1,
-0.6051225, 1.051995, -0.8386299, 0.3137255, 1, 0, 1,
-0.59512, -0.7325987, -2.839951, 0.3098039, 1, 0, 1,
-0.5950506, 0.04118747, -0.6419454, 0.3019608, 1, 0, 1,
-0.5880525, -1.003918, -4.005588, 0.2941177, 1, 0, 1,
-0.5874753, -0.1390135, -2.945835, 0.2901961, 1, 0, 1,
-0.5845925, -0.5447161, -3.398055, 0.282353, 1, 0, 1,
-0.5832872, 0.394217, -1.857641, 0.2784314, 1, 0, 1,
-0.5825241, -1.627307, -2.577309, 0.2705882, 1, 0, 1,
-0.579043, -0.7471349, -3.470982, 0.2666667, 1, 0, 1,
-0.5765576, 0.0135221, -0.7256878, 0.2588235, 1, 0, 1,
-0.5679488, -1.355987, -2.934134, 0.254902, 1, 0, 1,
-0.5675393, 0.7616765, -0.4417777, 0.2470588, 1, 0, 1,
-0.5675146, -0.3803366, 0.3410822, 0.2431373, 1, 0, 1,
-0.5655098, -0.956776, -3.412563, 0.2352941, 1, 0, 1,
-0.5619695, 0.757329, -1.483365, 0.2313726, 1, 0, 1,
-0.5586241, -0.5832072, -2.258403, 0.2235294, 1, 0, 1,
-0.5550836, 1.928423, 0.9131832, 0.2196078, 1, 0, 1,
-0.5534921, -0.05649978, -0.2754042, 0.2117647, 1, 0, 1,
-0.5519778, -1.169585, -1.01871, 0.2078431, 1, 0, 1,
-0.5494161, 0.5223638, -0.1178923, 0.2, 1, 0, 1,
-0.5446886, -1.308224, -3.263507, 0.1921569, 1, 0, 1,
-0.5370256, -2.78452, -5.016692, 0.1882353, 1, 0, 1,
-0.5322596, 1.624914, 0.04193257, 0.1803922, 1, 0, 1,
-0.5288824, 0.5362062, -0.3856293, 0.1764706, 1, 0, 1,
-0.527913, 2.023043, 0.7748855, 0.1686275, 1, 0, 1,
-0.5268041, 1.413533, -0.8014641, 0.1647059, 1, 0, 1,
-0.5192505, 0.2586523, -0.5091176, 0.1568628, 1, 0, 1,
-0.5188506, -0.07101636, -1.282531, 0.1529412, 1, 0, 1,
-0.5168585, 2.201328, 0.4817743, 0.145098, 1, 0, 1,
-0.5154069, 1.237332, 0.7356181, 0.1411765, 1, 0, 1,
-0.5133694, -0.6868845, -2.419141, 0.1333333, 1, 0, 1,
-0.5132353, 0.5387359, -0.4203275, 0.1294118, 1, 0, 1,
-0.5105488, 0.01965269, -3.983026, 0.1215686, 1, 0, 1,
-0.5094568, -0.4621066, -4.510897, 0.1176471, 1, 0, 1,
-0.5077949, 1.879966, 0.4036416, 0.1098039, 1, 0, 1,
-0.5073936, -0.120103, -0.2153642, 0.1058824, 1, 0, 1,
-0.5040334, 0.5815263, -1.709674, 0.09803922, 1, 0, 1,
-0.5035441, -0.3384488, -1.998393, 0.09019608, 1, 0, 1,
-0.5016305, 0.9913532, 0.5811211, 0.08627451, 1, 0, 1,
-0.5013389, -0.1457196, -3.148275, 0.07843138, 1, 0, 1,
-0.4990329, 1.829788, -0.6890886, 0.07450981, 1, 0, 1,
-0.4955803, 0.3192145, -0.5599132, 0.06666667, 1, 0, 1,
-0.4929895, -0.2850423, -3.640268, 0.0627451, 1, 0, 1,
-0.4917908, -1.504224, -2.987989, 0.05490196, 1, 0, 1,
-0.4906697, 1.287787, -0.9878079, 0.05098039, 1, 0, 1,
-0.4886084, -0.2071784, -1.060502, 0.04313726, 1, 0, 1,
-0.4885934, -0.5931592, -1.577348, 0.03921569, 1, 0, 1,
-0.4880683, -0.9783415, -2.257917, 0.03137255, 1, 0, 1,
-0.4880143, 0.6468372, 0.3364771, 0.02745098, 1, 0, 1,
-0.4876536, 2.455872, 0.4545931, 0.01960784, 1, 0, 1,
-0.4867322, 0.8383566, 0.2044981, 0.01568628, 1, 0, 1,
-0.4851913, 2.179395, -0.01963905, 0.007843138, 1, 0, 1,
-0.4848084, 0.3818087, 0.2221559, 0.003921569, 1, 0, 1,
-0.4823545, 0.3802272, -2.121604, 0, 1, 0.003921569, 1,
-0.4801, -0.4860333, -0.4097196, 0, 1, 0.01176471, 1,
-0.475824, -0.5819734, -2.356853, 0, 1, 0.01568628, 1,
-0.4752369, 2.775164, -2.942536, 0, 1, 0.02352941, 1,
-0.4743741, -1.825492, -2.672178, 0, 1, 0.02745098, 1,
-0.46971, -0.5193589, -2.768702, 0, 1, 0.03529412, 1,
-0.4685084, -0.5339977, -1.684843, 0, 1, 0.03921569, 1,
-0.4672059, -1.491305, -3.969895, 0, 1, 0.04705882, 1,
-0.4601191, 0.01830234, -0.7306295, 0, 1, 0.05098039, 1,
-0.4587494, -1.137912, -3.03062, 0, 1, 0.05882353, 1,
-0.4507363, -1.489876, -2.790104, 0, 1, 0.0627451, 1,
-0.4483296, 1.273023, -1.122938, 0, 1, 0.07058824, 1,
-0.4397904, -0.5908786, -3.506161, 0, 1, 0.07450981, 1,
-0.4386002, -0.2492313, -2.962071, 0, 1, 0.08235294, 1,
-0.4359924, -0.5961462, -4.25052, 0, 1, 0.08627451, 1,
-0.4352813, 0.7503337, -0.05100935, 0, 1, 0.09411765, 1,
-0.4342805, -1.388659, -3.935319, 0, 1, 0.1019608, 1,
-0.4334905, -0.6677235, -3.013927, 0, 1, 0.1058824, 1,
-0.4314926, -0.452948, -2.681962, 0, 1, 0.1137255, 1,
-0.4293511, 1.155631, -0.2511097, 0, 1, 0.1176471, 1,
-0.4269349, -1.111741, -3.84428, 0, 1, 0.1254902, 1,
-0.4233349, 0.5712696, -0.4413689, 0, 1, 0.1294118, 1,
-0.4201634, -0.1403975, -2.309311, 0, 1, 0.1372549, 1,
-0.4175518, -1.183001, -0.7501183, 0, 1, 0.1411765, 1,
-0.4156714, 0.3555208, 1.516178, 0, 1, 0.1490196, 1,
-0.4126833, 0.571303, -0.2409868, 0, 1, 0.1529412, 1,
-0.4109197, 0.2887886, -1.141584, 0, 1, 0.1607843, 1,
-0.4010265, 0.4358634, -1.171357, 0, 1, 0.1647059, 1,
-0.3981815, 0.9835171, 0.05230649, 0, 1, 0.172549, 1,
-0.3878242, -1.360098, -3.041708, 0, 1, 0.1764706, 1,
-0.3848795, -1.114399, -4.266327, 0, 1, 0.1843137, 1,
-0.3790296, -0.9670883, -3.667205, 0, 1, 0.1882353, 1,
-0.3769445, -0.6329861, -2.311949, 0, 1, 0.1960784, 1,
-0.3750431, 0.4513071, 0.418865, 0, 1, 0.2039216, 1,
-0.3749872, 1.201817, 0.3028073, 0, 1, 0.2078431, 1,
-0.364682, 0.02268764, -1.836429, 0, 1, 0.2156863, 1,
-0.3609974, -0.4035325, -2.969465, 0, 1, 0.2196078, 1,
-0.3593008, 0.1121516, -1.086631, 0, 1, 0.227451, 1,
-0.3583965, -0.4093331, -1.722667, 0, 1, 0.2313726, 1,
-0.3558883, 0.4886174, -0.08491708, 0, 1, 0.2392157, 1,
-0.3540503, 0.1042959, -0.7842669, 0, 1, 0.2431373, 1,
-0.3524657, 1.386002, -1.471474, 0, 1, 0.2509804, 1,
-0.3475235, -0.1614079, -1.646878, 0, 1, 0.254902, 1,
-0.3429813, 0.5328483, 0.2337042, 0, 1, 0.2627451, 1,
-0.342676, -0.2700684, -1.827617, 0, 1, 0.2666667, 1,
-0.3422465, 0.0864354, -0.5445885, 0, 1, 0.2745098, 1,
-0.3333672, 0.5973713, 0.3518928, 0, 1, 0.2784314, 1,
-0.3311098, 0.4184455, -0.4046599, 0, 1, 0.2862745, 1,
-0.3262518, -1.275561, -1.999376, 0, 1, 0.2901961, 1,
-0.3233573, -1.754993, -2.128732, 0, 1, 0.2980392, 1,
-0.3230655, 0.2614745, -1.064106, 0, 1, 0.3058824, 1,
-0.3171223, -0.6998312, -1.428906, 0, 1, 0.3098039, 1,
-0.3154553, -0.8952113, -2.907697, 0, 1, 0.3176471, 1,
-0.315447, 0.6789783, -1.987818, 0, 1, 0.3215686, 1,
-0.3153846, -1.21377, -2.172122, 0, 1, 0.3294118, 1,
-0.3121183, 0.5040103, -0.2921256, 0, 1, 0.3333333, 1,
-0.3115672, 0.5036317, 0.079447, 0, 1, 0.3411765, 1,
-0.3052878, 1.246226, 0.4937612, 0, 1, 0.345098, 1,
-0.3048655, -0.2891573, -0.8574266, 0, 1, 0.3529412, 1,
-0.3015336, -0.6671015, -2.355275, 0, 1, 0.3568628, 1,
-0.2998784, -0.978698, -3.154694, 0, 1, 0.3647059, 1,
-0.2989673, 0.5311931, -0.3726076, 0, 1, 0.3686275, 1,
-0.298484, -0.6253145, -3.590612, 0, 1, 0.3764706, 1,
-0.2980946, 0.446453, 1.195562, 0, 1, 0.3803922, 1,
-0.2974788, 1.007671, -2.466838, 0, 1, 0.3882353, 1,
-0.2962293, -0.710747, -3.297939, 0, 1, 0.3921569, 1,
-0.2946452, 0.7831671, 0.6882523, 0, 1, 0.4, 1,
-0.2939082, -0.3796135, -1.766151, 0, 1, 0.4078431, 1,
-0.2848586, 0.8886716, -0.6632355, 0, 1, 0.4117647, 1,
-0.2826835, -0.8362991, -3.145348, 0, 1, 0.4196078, 1,
-0.2807715, 2.277752, 1.260785, 0, 1, 0.4235294, 1,
-0.2758213, -0.912221, -3.485858, 0, 1, 0.4313726, 1,
-0.2708833, 1.060372, 0.7594541, 0, 1, 0.4352941, 1,
-0.2707457, -0.3210888, -2.254807, 0, 1, 0.4431373, 1,
-0.268884, 0.1150884, -3.088558, 0, 1, 0.4470588, 1,
-0.2671486, 0.7254314, -1.041391, 0, 1, 0.454902, 1,
-0.2653756, 0.004970099, -0.7585184, 0, 1, 0.4588235, 1,
-0.2653752, -1.097971, -3.534363, 0, 1, 0.4666667, 1,
-0.2551867, 1.366358, -0.2898585, 0, 1, 0.4705882, 1,
-0.254622, -0.8085921, -2.731339, 0, 1, 0.4784314, 1,
-0.2463187, -0.8865395, -1.109967, 0, 1, 0.4823529, 1,
-0.2450627, -0.6622673, -3.665109, 0, 1, 0.4901961, 1,
-0.2445723, 2.389735, 0.610773, 0, 1, 0.4941176, 1,
-0.2443702, -0.4607325, -3.262097, 0, 1, 0.5019608, 1,
-0.2428372, -0.2227254, -2.245312, 0, 1, 0.509804, 1,
-0.2423006, 0.2310417, -1.231681, 0, 1, 0.5137255, 1,
-0.2417617, 0.3827729, -3.172192, 0, 1, 0.5215687, 1,
-0.2388924, 0.516452, -0.1899022, 0, 1, 0.5254902, 1,
-0.2351726, 0.2411459, -0.1200949, 0, 1, 0.5333334, 1,
-0.2316501, -1.907583, -2.708374, 0, 1, 0.5372549, 1,
-0.2283282, 1.758821, 0.4057898, 0, 1, 0.5450981, 1,
-0.2258432, -1.50446, -5.165926, 0, 1, 0.5490196, 1,
-0.2207988, -1.640243, -3.699944, 0, 1, 0.5568628, 1,
-0.2199854, 2.427678, -0.163877, 0, 1, 0.5607843, 1,
-0.2161854, -1.083889, -2.585646, 0, 1, 0.5686275, 1,
-0.2143189, 0.8160386, -2.818609, 0, 1, 0.572549, 1,
-0.2113512, -1.26567, -1.622521, 0, 1, 0.5803922, 1,
-0.2097061, -1.322699, -4.396429, 0, 1, 0.5843138, 1,
-0.2074991, -0.8304784, -1.721679, 0, 1, 0.5921569, 1,
-0.2018152, 0.3962234, -1.039368, 0, 1, 0.5960785, 1,
-0.2010096, 0.4894467, -1.72598, 0, 1, 0.6039216, 1,
-0.1987782, -4.092475, -3.59207, 0, 1, 0.6117647, 1,
-0.1940578, 0.7373519, -1.225751, 0, 1, 0.6156863, 1,
-0.1927137, 1.841434, 1.079807, 0, 1, 0.6235294, 1,
-0.1914625, -0.1986695, -2.350784, 0, 1, 0.627451, 1,
-0.1886698, -1.266487, -4.574523, 0, 1, 0.6352941, 1,
-0.1874344, -0.325975, -3.052217, 0, 1, 0.6392157, 1,
-0.1855618, 0.2885559, 1.850217, 0, 1, 0.6470588, 1,
-0.1843736, 0.3168612, -1.186633, 0, 1, 0.6509804, 1,
-0.1809891, 0.1465526, -0.3292881, 0, 1, 0.6588235, 1,
-0.1794994, -1.090957, -2.470863, 0, 1, 0.6627451, 1,
-0.1780592, -1.335323, -3.708116, 0, 1, 0.6705883, 1,
-0.1759691, 0.1893998, -1.109259, 0, 1, 0.6745098, 1,
-0.1755161, 2.373681, 0.3347717, 0, 1, 0.682353, 1,
-0.173926, 0.4145909, 0.2556545, 0, 1, 0.6862745, 1,
-0.1720774, -0.6982041, -2.950892, 0, 1, 0.6941177, 1,
-0.1705239, -1.165964, -2.646232, 0, 1, 0.7019608, 1,
-0.1705047, 0.2071706, -1.643546, 0, 1, 0.7058824, 1,
-0.1697725, -0.7505001, -1.719637, 0, 1, 0.7137255, 1,
-0.1680359, -0.3636895, -3.122216, 0, 1, 0.7176471, 1,
-0.1656922, -0.2057431, -1.308673, 0, 1, 0.7254902, 1,
-0.1653637, -0.7040825, -3.735527, 0, 1, 0.7294118, 1,
-0.1646587, -0.4499621, -2.19244, 0, 1, 0.7372549, 1,
-0.1632274, -1.697012, -3.651087, 0, 1, 0.7411765, 1,
-0.1627556, -3.124852, -1.5527, 0, 1, 0.7490196, 1,
-0.1584845, -0.3503728, -3.685675, 0, 1, 0.7529412, 1,
-0.153498, 2.104738, 0.6288278, 0, 1, 0.7607843, 1,
-0.1492377, -1.019777, -2.688176, 0, 1, 0.7647059, 1,
-0.1480148, 0.09246245, -0.5018276, 0, 1, 0.772549, 1,
-0.1465985, -0.4457542, -3.178758, 0, 1, 0.7764706, 1,
-0.1435644, -1.513111, -1.648255, 0, 1, 0.7843137, 1,
-0.143394, -0.8388942, -3.11176, 0, 1, 0.7882353, 1,
-0.1388982, 1.696098, -1.251684, 0, 1, 0.7960784, 1,
-0.1356579, 1.366612, -0.7586436, 0, 1, 0.8039216, 1,
-0.1339234, 2.63131, 1.927082, 0, 1, 0.8078431, 1,
-0.1326638, 0.7679659, 1.017063, 0, 1, 0.8156863, 1,
-0.1310361, -1.111144, -4.773306, 0, 1, 0.8196079, 1,
-0.1306885, -1.780536, -4.259492, 0, 1, 0.827451, 1,
-0.1265405, -0.4996358, -3.774941, 0, 1, 0.8313726, 1,
-0.1262557, -0.5014293, -2.33667, 0, 1, 0.8392157, 1,
-0.1222344, 0.05542691, -2.557351, 0, 1, 0.8431373, 1,
-0.1188403, -0.8287714, -7.023935, 0, 1, 0.8509804, 1,
-0.1181439, -0.9210273, -2.531097, 0, 1, 0.854902, 1,
-0.1175292, 0.23076, -0.5657526, 0, 1, 0.8627451, 1,
-0.1174462, 0.9027251, -0.2876267, 0, 1, 0.8666667, 1,
-0.11596, 0.4415925, 0.6495403, 0, 1, 0.8745098, 1,
-0.1135036, -1.206858, -4.579422, 0, 1, 0.8784314, 1,
-0.1131169, 1.634636, 0.5354528, 0, 1, 0.8862745, 1,
-0.1101109, 0.09441193, -0.7913176, 0, 1, 0.8901961, 1,
-0.1094705, 1.144742, -0.08971899, 0, 1, 0.8980392, 1,
-0.1065789, 0.4822682, 0.005787489, 0, 1, 0.9058824, 1,
-0.1065749, 1.826902, 0.9290471, 0, 1, 0.9098039, 1,
-0.09766325, -0.7870234, -2.502881, 0, 1, 0.9176471, 1,
-0.09022168, -0.3014577, -2.841171, 0, 1, 0.9215686, 1,
-0.08861779, -0.373382, -3.536349, 0, 1, 0.9294118, 1,
-0.08413552, -0.3855263, -2.685237, 0, 1, 0.9333333, 1,
-0.08390698, 1.468331, -0.3386077, 0, 1, 0.9411765, 1,
-0.08214304, -2.091964, -3.225105, 0, 1, 0.945098, 1,
-0.08032758, 0.9030196, 0.01016978, 0, 1, 0.9529412, 1,
-0.0751068, -0.5297263, -3.113315, 0, 1, 0.9568627, 1,
-0.07404752, -0.6524266, -3.052776, 0, 1, 0.9647059, 1,
-0.07333828, -1.244246, -3.313699, 0, 1, 0.9686275, 1,
-0.07319226, -0.3595704, -2.924858, 0, 1, 0.9764706, 1,
-0.06481051, 2.193866, 0.7275344, 0, 1, 0.9803922, 1,
-0.06457219, 1.844427, 0.1700669, 0, 1, 0.9882353, 1,
-0.05056954, 1.656121, -1.20223, 0, 1, 0.9921569, 1,
-0.04935893, 2.28319, -0.374634, 0, 1, 1, 1,
-0.04782401, 0.8513498, -0.1270428, 0, 0.9921569, 1, 1,
-0.04770878, -0.1813298, -2.506839, 0, 0.9882353, 1, 1,
-0.04714425, -1.362674, -4.131307, 0, 0.9803922, 1, 1,
-0.04278632, -0.278476, -2.993403, 0, 0.9764706, 1, 1,
-0.04140538, -0.6258161, -3.50561, 0, 0.9686275, 1, 1,
-0.0411467, -1.496285, -3.038664, 0, 0.9647059, 1, 1,
-0.03768752, -0.01798712, -1.475944, 0, 0.9568627, 1, 1,
-0.03359999, 0.4946586, 1.426258, 0, 0.9529412, 1, 1,
-0.03162025, -0.1247939, -2.708496, 0, 0.945098, 1, 1,
-0.03103511, -1.32374, -2.805054, 0, 0.9411765, 1, 1,
-0.0304228, 1.120521, 0.5343661, 0, 0.9333333, 1, 1,
-0.03039888, -1.229962, -2.41734, 0, 0.9294118, 1, 1,
-0.02787546, -0.04032701, -2.096114, 0, 0.9215686, 1, 1,
-0.02762425, 0.5760505, -0.7687366, 0, 0.9176471, 1, 1,
-0.02488664, 1.453584, -0.1774084, 0, 0.9098039, 1, 1,
-0.02363513, -1.443435, -3.327564, 0, 0.9058824, 1, 1,
-0.02256117, -0.5375924, -2.658307, 0, 0.8980392, 1, 1,
-0.02249152, 0.01417194, -0.8117403, 0, 0.8901961, 1, 1,
-0.02070748, 1.396311, 0.8011534, 0, 0.8862745, 1, 1,
-0.01292424, -1.527034, -2.110197, 0, 0.8784314, 1, 1,
-0.007296993, -0.2011956, -3.310309, 0, 0.8745098, 1, 1,
-0.004024417, -0.3672056, -3.625035, 0, 0.8666667, 1, 1,
-0.00389643, -0.3303995, -2.113206, 0, 0.8627451, 1, 1,
-0.003723604, 1.052555, -1.809219, 0, 0.854902, 1, 1,
0.0006632874, -1.05886, 3.092862, 0, 0.8509804, 1, 1,
0.0039697, -1.207508, 1.805771, 0, 0.8431373, 1, 1,
0.005720176, -0.3188582, 2.678072, 0, 0.8392157, 1, 1,
0.01059046, 1.024963, -2.878366, 0, 0.8313726, 1, 1,
0.01191787, -1.3054, 3.037602, 0, 0.827451, 1, 1,
0.02389036, -0.3202907, 2.744614, 0, 0.8196079, 1, 1,
0.03124837, 0.9041686, -0.8497084, 0, 0.8156863, 1, 1,
0.0314693, -0.158378, 2.783551, 0, 0.8078431, 1, 1,
0.03240605, 1.034943, 0.06985161, 0, 0.8039216, 1, 1,
0.03385387, 1.04192, -0.9129674, 0, 0.7960784, 1, 1,
0.03885163, 0.8626952, 0.2299103, 0, 0.7882353, 1, 1,
0.03967253, -0.2133426, 1.931122, 0, 0.7843137, 1, 1,
0.04049566, 2.243157, 1.302888, 0, 0.7764706, 1, 1,
0.0474356, 0.4691677, 0.0428087, 0, 0.772549, 1, 1,
0.04835507, -0.3551423, 4.759708, 0, 0.7647059, 1, 1,
0.0508904, 0.5555167, -1.526299, 0, 0.7607843, 1, 1,
0.05189679, -0.1610524, 0.2902646, 0, 0.7529412, 1, 1,
0.0554419, 2.234375, -0.2837913, 0, 0.7490196, 1, 1,
0.05615699, -0.7816282, 0.541973, 0, 0.7411765, 1, 1,
0.05713442, -0.4775851, 3.073039, 0, 0.7372549, 1, 1,
0.0582488, -0.8485948, 2.897574, 0, 0.7294118, 1, 1,
0.05857764, 0.1186236, 0.6334194, 0, 0.7254902, 1, 1,
0.05870762, 0.7904458, -0.6449515, 0, 0.7176471, 1, 1,
0.06107264, 0.5037296, 0.3706295, 0, 0.7137255, 1, 1,
0.06231171, 1.062698, 0.2644607, 0, 0.7058824, 1, 1,
0.06424234, 0.06429024, 0.5304289, 0, 0.6980392, 1, 1,
0.06670883, -0.5067905, 3.093672, 0, 0.6941177, 1, 1,
0.06805374, -1.45304, 2.031103, 0, 0.6862745, 1, 1,
0.06885032, -0.9187617, 3.946455, 0, 0.682353, 1, 1,
0.07098107, -1.6537, 2.788454, 0, 0.6745098, 1, 1,
0.07171059, 0.09186167, 0.04860004, 0, 0.6705883, 1, 1,
0.07337902, 0.2844594, 1.013021, 0, 0.6627451, 1, 1,
0.07430547, 0.2678561, 1.202825, 0, 0.6588235, 1, 1,
0.07500017, -0.08861309, 2.253832, 0, 0.6509804, 1, 1,
0.07962681, -1.56567, 3.073451, 0, 0.6470588, 1, 1,
0.08008396, -0.1267272, 3.475783, 0, 0.6392157, 1, 1,
0.08034066, -0.3173828, 3.080406, 0, 0.6352941, 1, 1,
0.08563642, 0.543382, 0.05914776, 0, 0.627451, 1, 1,
0.09712083, -0.5367141, 2.850554, 0, 0.6235294, 1, 1,
0.09789397, -1.193282, 3.381323, 0, 0.6156863, 1, 1,
0.1037946, 0.07192469, 2.188336, 0, 0.6117647, 1, 1,
0.1059624, -0.4145569, 2.226523, 0, 0.6039216, 1, 1,
0.1080958, 0.4758442, 0.830999, 0, 0.5960785, 1, 1,
0.1106149, -1.296334, 1.628714, 0, 0.5921569, 1, 1,
0.1108675, -0.1920143, 1.80169, 0, 0.5843138, 1, 1,
0.1152273, -0.8514129, 3.027172, 0, 0.5803922, 1, 1,
0.1155302, 0.8123874, 0.2863226, 0, 0.572549, 1, 1,
0.1196407, 1.112494, 0.3161952, 0, 0.5686275, 1, 1,
0.1237339, 0.8206722, 1.21507, 0, 0.5607843, 1, 1,
0.1273722, 1.571948, 0.3339324, 0, 0.5568628, 1, 1,
0.128263, 1.395606, 2.538854, 0, 0.5490196, 1, 1,
0.1326966, -1.23913, 2.955023, 0, 0.5450981, 1, 1,
0.1356893, 0.7122006, 0.9504534, 0, 0.5372549, 1, 1,
0.136983, 2.191023, -0.4200448, 0, 0.5333334, 1, 1,
0.1384573, 0.8132941, 0.8119888, 0, 0.5254902, 1, 1,
0.1393728, 0.7602354, 0.09931812, 0, 0.5215687, 1, 1,
0.1396761, -1.041684, 4.730183, 0, 0.5137255, 1, 1,
0.1421592, -0.9471673, 2.941198, 0, 0.509804, 1, 1,
0.1441908, 1.823287, 0.5156079, 0, 0.5019608, 1, 1,
0.1447677, 1.017208, 0.08976295, 0, 0.4941176, 1, 1,
0.153238, 1.854545, -1.031361, 0, 0.4901961, 1, 1,
0.1626491, -1.040004, 3.792387, 0, 0.4823529, 1, 1,
0.1647695, -0.8165899, 2.199472, 0, 0.4784314, 1, 1,
0.1706803, 0.875805, 1.042216, 0, 0.4705882, 1, 1,
0.1707152, -0.1311172, 2.039428, 0, 0.4666667, 1, 1,
0.1748507, 0.6526375, 0.4404838, 0, 0.4588235, 1, 1,
0.1807503, 0.368848, 0.2802476, 0, 0.454902, 1, 1,
0.1826693, -0.5460747, 2.538123, 0, 0.4470588, 1, 1,
0.1851068, 2.012337, 2.458468, 0, 0.4431373, 1, 1,
0.1865143, 1.168663, 1.431991, 0, 0.4352941, 1, 1,
0.1875771, 0.818437, -1.11989, 0, 0.4313726, 1, 1,
0.1913536, -0.4263639, 1.573979, 0, 0.4235294, 1, 1,
0.1931182, 0.7418417, 0.8138499, 0, 0.4196078, 1, 1,
0.1946656, 0.8159441, -0.9336032, 0, 0.4117647, 1, 1,
0.1973843, 0.6861827, 0.7409331, 0, 0.4078431, 1, 1,
0.2019694, -1.261113, 1.523551, 0, 0.4, 1, 1,
0.2036877, 0.9238248, 0.8259349, 0, 0.3921569, 1, 1,
0.2084465, -0.7362523, 2.773687, 0, 0.3882353, 1, 1,
0.2139584, 1.090743, -1.052982, 0, 0.3803922, 1, 1,
0.2249673, -0.7435796, 3.336409, 0, 0.3764706, 1, 1,
0.2253052, -0.5247329, 3.780401, 0, 0.3686275, 1, 1,
0.2296269, 0.8340026, 0.9236268, 0, 0.3647059, 1, 1,
0.2302901, 0.7471063, -0.7814429, 0, 0.3568628, 1, 1,
0.2325176, 0.7387828, -0.3652379, 0, 0.3529412, 1, 1,
0.2325935, 0.4177902, 2.007084, 0, 0.345098, 1, 1,
0.2328056, -0.6767991, 4.061211, 0, 0.3411765, 1, 1,
0.2348265, 3.526108, -0.3118064, 0, 0.3333333, 1, 1,
0.2370027, 0.1182295, 0.41549, 0, 0.3294118, 1, 1,
0.2388229, 0.894054, -0.4124916, 0, 0.3215686, 1, 1,
0.2427886, -0.3399836, 1.66333, 0, 0.3176471, 1, 1,
0.249265, -1.665359, 5.019035, 0, 0.3098039, 1, 1,
0.2500332, 0.005960023, 1.088472, 0, 0.3058824, 1, 1,
0.25277, 1.125991, 1.122089, 0, 0.2980392, 1, 1,
0.2583443, 0.5206007, 0.6020624, 0, 0.2901961, 1, 1,
0.2621617, -0.7198336, 3.575549, 0, 0.2862745, 1, 1,
0.2654185, 0.4009567, 0.7912965, 0, 0.2784314, 1, 1,
0.2686826, 1.280535, 0.2363297, 0, 0.2745098, 1, 1,
0.2712778, 1.122813, -0.08212195, 0, 0.2666667, 1, 1,
0.2779094, 0.5709372, -0.8987488, 0, 0.2627451, 1, 1,
0.2787209, 0.1200203, 2.707302, 0, 0.254902, 1, 1,
0.2790502, 1.881276, 1.447535, 0, 0.2509804, 1, 1,
0.2833901, 0.2523829, -0.9453277, 0, 0.2431373, 1, 1,
0.2887146, -1.283761, 2.769159, 0, 0.2392157, 1, 1,
0.2897931, 0.2831532, 0.4955949, 0, 0.2313726, 1, 1,
0.2947853, -1.265344, 3.9882, 0, 0.227451, 1, 1,
0.2964363, -1.741936, 4.604785, 0, 0.2196078, 1, 1,
0.2983187, 0.00548777, 1.590049, 0, 0.2156863, 1, 1,
0.2995898, -0.8702007, 2.427165, 0, 0.2078431, 1, 1,
0.3007268, 0.7355688, -0.4591625, 0, 0.2039216, 1, 1,
0.3012219, -0.3916399, 2.831462, 0, 0.1960784, 1, 1,
0.3056774, 0.9287776, -0.1280375, 0, 0.1882353, 1, 1,
0.3087479, -0.6212764, 3.199786, 0, 0.1843137, 1, 1,
0.3103375, 0.5529389, -1.068525, 0, 0.1764706, 1, 1,
0.310693, 0.05077076, 1.384545, 0, 0.172549, 1, 1,
0.3157175, -1.45621, 3.085023, 0, 0.1647059, 1, 1,
0.3193688, -1.247299, 4.140341, 0, 0.1607843, 1, 1,
0.3202347, -0.944093, 3.780705, 0, 0.1529412, 1, 1,
0.3210301, 1.164286, 1.322784, 0, 0.1490196, 1, 1,
0.3212313, -1.011433, 2.370765, 0, 0.1411765, 1, 1,
0.3218923, -0.8526902, 3.182003, 0, 0.1372549, 1, 1,
0.3245266, 1.244903, 0.2914805, 0, 0.1294118, 1, 1,
0.3271619, 0.630325, -0.5063589, 0, 0.1254902, 1, 1,
0.3301867, 1.987285, 1.009488, 0, 0.1176471, 1, 1,
0.33026, 0.07487984, 1.743784, 0, 0.1137255, 1, 1,
0.3328064, 0.9456235, 1.185134, 0, 0.1058824, 1, 1,
0.3346424, -0.2109087, 1.154791, 0, 0.09803922, 1, 1,
0.336286, -1.835932, 4.298676, 0, 0.09411765, 1, 1,
0.3389258, -1.81993, 4.516006, 0, 0.08627451, 1, 1,
0.340677, 0.2936852, 0.3170428, 0, 0.08235294, 1, 1,
0.3443159, 1.495585, -0.2734103, 0, 0.07450981, 1, 1,
0.348763, 0.2157209, 0.3157271, 0, 0.07058824, 1, 1,
0.3500373, -0.4625892, 1.879617, 0, 0.0627451, 1, 1,
0.3512989, 0.103113, 0.3953176, 0, 0.05882353, 1, 1,
0.3519088, -1.274983, 3.950492, 0, 0.05098039, 1, 1,
0.352174, -2.063142, 2.156712, 0, 0.04705882, 1, 1,
0.356794, 1.42875, 0.3728427, 0, 0.03921569, 1, 1,
0.3572408, 1.243448, 0.9370192, 0, 0.03529412, 1, 1,
0.3572469, 0.4058202, -1.003336, 0, 0.02745098, 1, 1,
0.3575071, 1.054591, -0.6281617, 0, 0.02352941, 1, 1,
0.3577078, 1.157513, -0.540072, 0, 0.01568628, 1, 1,
0.3582902, 0.05737034, 1.480929, 0, 0.01176471, 1, 1,
0.3588746, 1.021979, 2.027332, 0, 0.003921569, 1, 1,
0.360946, 0.01172317, 0.4008264, 0.003921569, 0, 1, 1,
0.363528, 1.50207, -2.460968, 0.007843138, 0, 1, 1,
0.3645956, -0.1527556, 0.9527653, 0.01568628, 0, 1, 1,
0.3663035, 1.110962, 0.3334434, 0.01960784, 0, 1, 1,
0.3713288, -0.2520433, 3.534891, 0.02745098, 0, 1, 1,
0.3772838, 0.1818787, 0.9144329, 0.03137255, 0, 1, 1,
0.3782193, 0.473813, 1.172741, 0.03921569, 0, 1, 1,
0.3794161, 0.5687642, 0.4087972, 0.04313726, 0, 1, 1,
0.3807066, 0.227732, -0.4352546, 0.05098039, 0, 1, 1,
0.3821044, -0.5848698, 4.160997, 0.05490196, 0, 1, 1,
0.3825179, 0.4344793, 1.929956, 0.0627451, 0, 1, 1,
0.3826369, -0.8726683, 1.628121, 0.06666667, 0, 1, 1,
0.3837655, -1.240555, 6.397436, 0.07450981, 0, 1, 1,
0.3864472, 0.06550686, 1.140797, 0.07843138, 0, 1, 1,
0.3939429, 0.7577446, 0.4243381, 0.08627451, 0, 1, 1,
0.3944482, -0.360862, 1.355589, 0.09019608, 0, 1, 1,
0.3961611, 0.2843297, -0.9196944, 0.09803922, 0, 1, 1,
0.4003448, 1.196622, -0.7022469, 0.1058824, 0, 1, 1,
0.4047199, 1.18524, 0.6314467, 0.1098039, 0, 1, 1,
0.4102085, -0.2551169, 0.968552, 0.1176471, 0, 1, 1,
0.4117247, -0.6275107, 2.899513, 0.1215686, 0, 1, 1,
0.4161945, -0.6605194, 3.148855, 0.1294118, 0, 1, 1,
0.4162595, 1.697989, 0.08179121, 0.1333333, 0, 1, 1,
0.4178462, 0.53598, 0.7785921, 0.1411765, 0, 1, 1,
0.4182979, -1.35583, 3.729312, 0.145098, 0, 1, 1,
0.4214551, 1.723234, -0.3712459, 0.1529412, 0, 1, 1,
0.4218703, -1.969312, 3.463513, 0.1568628, 0, 1, 1,
0.4244177, -0.02515889, 2.649873, 0.1647059, 0, 1, 1,
0.4289191, 0.2326716, 2.035216, 0.1686275, 0, 1, 1,
0.4296768, -0.7367054, 3.162065, 0.1764706, 0, 1, 1,
0.4311861, -1.43695, 4.893682, 0.1803922, 0, 1, 1,
0.4333651, -0.3444705, 3.368153, 0.1882353, 0, 1, 1,
0.4389832, -1.037747, 2.446886, 0.1921569, 0, 1, 1,
0.4407842, -1.622921, 2.779464, 0.2, 0, 1, 1,
0.4415534, 0.3698026, 0.235912, 0.2078431, 0, 1, 1,
0.449355, 0.403351, 1.508413, 0.2117647, 0, 1, 1,
0.4521479, -1.318754, 2.856132, 0.2196078, 0, 1, 1,
0.4542751, -0.376599, 1.861801, 0.2235294, 0, 1, 1,
0.4563676, -0.9515975, 3.222946, 0.2313726, 0, 1, 1,
0.4586037, -2.591403, 4.11791, 0.2352941, 0, 1, 1,
0.4617704, 1.498227, -0.65012, 0.2431373, 0, 1, 1,
0.4665364, -0.1259685, 1.559808, 0.2470588, 0, 1, 1,
0.4680927, 0.4280642, -0.5867192, 0.254902, 0, 1, 1,
0.4700557, 1.136167, 0.1391348, 0.2588235, 0, 1, 1,
0.4702459, 2.523869, 1.320134, 0.2666667, 0, 1, 1,
0.4787292, 1.191201, 0.1383529, 0.2705882, 0, 1, 1,
0.4811654, -1.250944, 1.964547, 0.2784314, 0, 1, 1,
0.4843133, 0.07082853, 0.4828768, 0.282353, 0, 1, 1,
0.4876489, -0.672092, 2.3016, 0.2901961, 0, 1, 1,
0.4908566, 1.529451, -0.08078066, 0.2941177, 0, 1, 1,
0.4933103, -0.5142826, 1.422502, 0.3019608, 0, 1, 1,
0.4962725, -0.569602, 1.829876, 0.3098039, 0, 1, 1,
0.4993384, -0.3546649, 0.07953533, 0.3137255, 0, 1, 1,
0.5051399, -0.2903369, 3.10553, 0.3215686, 0, 1, 1,
0.506315, 0.839942, 0.35212, 0.3254902, 0, 1, 1,
0.5064617, 0.08593211, 2.802916, 0.3333333, 0, 1, 1,
0.508249, 1.805037, 1.80647, 0.3372549, 0, 1, 1,
0.5090824, 1.886785, 2.065225, 0.345098, 0, 1, 1,
0.5115421, 0.01090529, 1.51589, 0.3490196, 0, 1, 1,
0.5169705, 2.045526, 0.6927585, 0.3568628, 0, 1, 1,
0.5183359, 0.3748179, 1.302326, 0.3607843, 0, 1, 1,
0.5265312, -0.7270805, 1.161072, 0.3686275, 0, 1, 1,
0.5270354, -1.328803, 0.6938207, 0.372549, 0, 1, 1,
0.5283889, 0.02130012, 1.788594, 0.3803922, 0, 1, 1,
0.5285631, -1.347795, 1.917902, 0.3843137, 0, 1, 1,
0.5325302, 0.08700454, -1.171704, 0.3921569, 0, 1, 1,
0.5331505, 0.1080776, 1.444996, 0.3960784, 0, 1, 1,
0.5356732, -0.9674291, 4.264486, 0.4039216, 0, 1, 1,
0.5371613, 1.445757, -1.566194, 0.4117647, 0, 1, 1,
0.5374456, -1.069582, 2.211456, 0.4156863, 0, 1, 1,
0.5401207, -0.01601109, 3.586864, 0.4235294, 0, 1, 1,
0.5403408, -0.297021, 2.758346, 0.427451, 0, 1, 1,
0.5451823, -1.997175, 3.7272, 0.4352941, 0, 1, 1,
0.5509614, -0.07501582, 1.811833, 0.4392157, 0, 1, 1,
0.5537993, -0.557899, 2.232465, 0.4470588, 0, 1, 1,
0.5570566, 2.555522, -0.03061958, 0.4509804, 0, 1, 1,
0.5579454, 1.558923, 0.4865165, 0.4588235, 0, 1, 1,
0.5591645, -0.7654208, 2.576004, 0.4627451, 0, 1, 1,
0.562494, -1.344615, -0.3575022, 0.4705882, 0, 1, 1,
0.5650082, 0.4893959, -0.856851, 0.4745098, 0, 1, 1,
0.5672309, 0.2766653, -0.1776567, 0.4823529, 0, 1, 1,
0.568127, 0.8535402, 1.181746, 0.4862745, 0, 1, 1,
0.5703114, -0.5507106, 0.9224362, 0.4941176, 0, 1, 1,
0.5714818, -0.8009865, 3.589783, 0.5019608, 0, 1, 1,
0.5734857, 1.186582, -0.07850391, 0.5058824, 0, 1, 1,
0.5748914, 0.476121, 1.067181, 0.5137255, 0, 1, 1,
0.5754917, 0.6320391, 0.1007214, 0.5176471, 0, 1, 1,
0.5779282, 0.3886221, 1.474589, 0.5254902, 0, 1, 1,
0.5779382, -0.9706903, 2.909252, 0.5294118, 0, 1, 1,
0.582693, 0.7691833, 0.8441598, 0.5372549, 0, 1, 1,
0.5845758, 1.174524, -0.1313719, 0.5411765, 0, 1, 1,
0.591103, -1.666536, 2.123967, 0.5490196, 0, 1, 1,
0.5934883, -1.137384, 2.038484, 0.5529412, 0, 1, 1,
0.5957885, -1.281737, 1.757999, 0.5607843, 0, 1, 1,
0.5961188, -0.1405011, 1.532733, 0.5647059, 0, 1, 1,
0.5987768, -1.557471, 2.882323, 0.572549, 0, 1, 1,
0.5989439, -0.08515889, 3.107584, 0.5764706, 0, 1, 1,
0.6011656, 0.07316487, 1.245999, 0.5843138, 0, 1, 1,
0.6025043, -2.109321, 1.884057, 0.5882353, 0, 1, 1,
0.6027135, 0.5528922, 2.119049, 0.5960785, 0, 1, 1,
0.6038477, 0.8305913, -1.155042, 0.6039216, 0, 1, 1,
0.6039103, 0.9805968, 1.543549, 0.6078432, 0, 1, 1,
0.604008, 1.636239, 0.305676, 0.6156863, 0, 1, 1,
0.6085425, -0.707689, 3.857584, 0.6196079, 0, 1, 1,
0.6091221, -0.3621942, 1.994631, 0.627451, 0, 1, 1,
0.6122779, 2.107574, 1.97074, 0.6313726, 0, 1, 1,
0.6123894, 0.2145056, -0.5663412, 0.6392157, 0, 1, 1,
0.6164579, -0.4494681, 2.117141, 0.6431373, 0, 1, 1,
0.6225072, -0.08808617, -2.241654, 0.6509804, 0, 1, 1,
0.6230649, -1.180266, 2.823088, 0.654902, 0, 1, 1,
0.6243129, -0.02437324, 3.968196, 0.6627451, 0, 1, 1,
0.6244891, -1.734045, 2.809329, 0.6666667, 0, 1, 1,
0.6253743, 1.225663, 0.82546, 0.6745098, 0, 1, 1,
0.6278815, -0.5329434, 4.087451, 0.6784314, 0, 1, 1,
0.6368479, -1.027176, 3.799997, 0.6862745, 0, 1, 1,
0.6376746, -1.550715, 3.161687, 0.6901961, 0, 1, 1,
0.6438785, -0.7765973, 3.72056, 0.6980392, 0, 1, 1,
0.6455544, -2.200936, 2.548098, 0.7058824, 0, 1, 1,
0.6590716, 0.1852059, 1.795937, 0.7098039, 0, 1, 1,
0.6634672, -1.820699, 2.901645, 0.7176471, 0, 1, 1,
0.6672193, -1.146595, 3.024646, 0.7215686, 0, 1, 1,
0.6762064, -1.460785, 2.531913, 0.7294118, 0, 1, 1,
0.6800743, 0.9301948, 0.7622924, 0.7333333, 0, 1, 1,
0.6804543, -0.362031, 1.732788, 0.7411765, 0, 1, 1,
0.6907175, 1.314573, 1.01367, 0.7450981, 0, 1, 1,
0.6959272, 1.167299, 0.5177568, 0.7529412, 0, 1, 1,
0.6969568, 0.7604915, 0.5256779, 0.7568628, 0, 1, 1,
0.7013018, -1.160453, 2.001592, 0.7647059, 0, 1, 1,
0.7036751, -0.6579187, 2.870103, 0.7686275, 0, 1, 1,
0.7105888, -0.6903479, -0.4685983, 0.7764706, 0, 1, 1,
0.7179203, -0.7059154, 2.646939, 0.7803922, 0, 1, 1,
0.7216883, -0.5667691, 2.500798, 0.7882353, 0, 1, 1,
0.7233652, -0.0753544, 2.54336, 0.7921569, 0, 1, 1,
0.7246402, -0.4976819, 4.534116, 0.8, 0, 1, 1,
0.7256913, 0.9553086, 1.284009, 0.8078431, 0, 1, 1,
0.7313129, -0.9019729, 2.843222, 0.8117647, 0, 1, 1,
0.7403665, 0.7976046, 1.319734, 0.8196079, 0, 1, 1,
0.7429515, -0.6619474, 1.108623, 0.8235294, 0, 1, 1,
0.7450515, 0.6998532, 2.10401, 0.8313726, 0, 1, 1,
0.7455192, 0.8701053, 0.6004936, 0.8352941, 0, 1, 1,
0.7517377, -0.07548434, 1.722401, 0.8431373, 0, 1, 1,
0.7545377, -0.6780058, 3.401918, 0.8470588, 0, 1, 1,
0.7622429, -0.002954309, 2.418022, 0.854902, 0, 1, 1,
0.7740152, 0.2913342, -0.1811493, 0.8588235, 0, 1, 1,
0.7866399, -0.1497096, 2.728985, 0.8666667, 0, 1, 1,
0.7875947, 2.409793, 0.6109946, 0.8705882, 0, 1, 1,
0.7884722, -0.3762208, 2.383021, 0.8784314, 0, 1, 1,
0.8082684, 1.54559, 1.023913, 0.8823529, 0, 1, 1,
0.8159205, 0.8246654, 1.657614, 0.8901961, 0, 1, 1,
0.818157, -0.1220234, 1.25351, 0.8941177, 0, 1, 1,
0.8227814, -0.5608741, 2.235718, 0.9019608, 0, 1, 1,
0.8254156, -0.3118031, 3.289515, 0.9098039, 0, 1, 1,
0.8270143, -1.013136, 3.028099, 0.9137255, 0, 1, 1,
0.8297907, 0.7496977, 2.52327, 0.9215686, 0, 1, 1,
0.8418886, 0.2964215, 1.669749, 0.9254902, 0, 1, 1,
0.842067, 0.4529164, 2.136606, 0.9333333, 0, 1, 1,
0.8465942, -0.05658976, 0.5756248, 0.9372549, 0, 1, 1,
0.8522647, -0.8282129, 1.774741, 0.945098, 0, 1, 1,
0.8528592, 0.361055, 3.230212, 0.9490196, 0, 1, 1,
0.8548321, -0.1031816, 1.888857, 0.9568627, 0, 1, 1,
0.8550553, 0.06439807, -0.5851993, 0.9607843, 0, 1, 1,
0.860877, -1.896992, 2.937319, 0.9686275, 0, 1, 1,
0.8632215, 2.153534, 1.031252, 0.972549, 0, 1, 1,
0.866093, 0.6664476, 0.4368967, 0.9803922, 0, 1, 1,
0.8672745, -0.5243223, 3.036026, 0.9843137, 0, 1, 1,
0.8691074, -1.386997, 1.90561, 0.9921569, 0, 1, 1,
0.8727594, 1.461262, 1.158941, 0.9960784, 0, 1, 1,
0.8733635, 0.6407613, -0.007544864, 1, 0, 0.9960784, 1,
0.8747241, -0.8201854, 2.020969, 1, 0, 0.9882353, 1,
0.8755302, 0.6361586, 3.76319, 1, 0, 0.9843137, 1,
0.8790541, 2.349079, 0.7460428, 1, 0, 0.9764706, 1,
0.8835642, 0.1890535, 0.6827939, 1, 0, 0.972549, 1,
0.8882315, -0.09098227, 0.7907372, 1, 0, 0.9647059, 1,
0.9055889, -1.775833, 3.224327, 1, 0, 0.9607843, 1,
0.907003, -1.609856, 1.831673, 1, 0, 0.9529412, 1,
0.9099047, 0.7444266, 2.477317, 1, 0, 0.9490196, 1,
0.910866, -0.7761593, 1.283008, 1, 0, 0.9411765, 1,
0.9116264, -0.147947, 1.422492, 1, 0, 0.9372549, 1,
0.9165899, 1.477358, 0.4055271, 1, 0, 0.9294118, 1,
0.9222517, -2.683372, 1.831106, 1, 0, 0.9254902, 1,
0.9277201, 0.7214609, 1.520358, 1, 0, 0.9176471, 1,
0.9292545, -0.7520944, 3.208264, 1, 0, 0.9137255, 1,
0.931643, -0.3844575, -0.142973, 1, 0, 0.9058824, 1,
0.9340714, -0.06420751, 0.9592566, 1, 0, 0.9019608, 1,
0.9375568, 0.2741983, 1.326084, 1, 0, 0.8941177, 1,
0.9376355, 1.210154, 0.6102377, 1, 0, 0.8862745, 1,
0.9440042, 0.03605298, 2.511987, 1, 0, 0.8823529, 1,
0.9477667, 1.685959, 0.3566025, 1, 0, 0.8745098, 1,
0.9483106, -0.1503582, 2.365942, 1, 0, 0.8705882, 1,
0.9496032, -1.323285, 2.74888, 1, 0, 0.8627451, 1,
0.9521844, 0.566096, 0.3553491, 1, 0, 0.8588235, 1,
0.9555185, -2.832935, 3.149908, 1, 0, 0.8509804, 1,
0.9571885, -0.03938685, 3.0185, 1, 0, 0.8470588, 1,
0.9620252, -0.8832232, 3.305013, 1, 0, 0.8392157, 1,
0.9671779, -0.2004584, 2.23443, 1, 0, 0.8352941, 1,
0.9689027, 0.5892454, 0.5067781, 1, 0, 0.827451, 1,
0.9707377, 0.8693012, 0.7076539, 1, 0, 0.8235294, 1,
0.9771551, 1.092722, 0.3513611, 1, 0, 0.8156863, 1,
0.9838653, -0.03834361, 1.759178, 1, 0, 0.8117647, 1,
0.9882213, 0.72675, 1.978441, 1, 0, 0.8039216, 1,
0.9995459, 0.8447401, 2.254014, 1, 0, 0.7960784, 1,
1.008479, -1.074584, 2.298826, 1, 0, 0.7921569, 1,
1.013414, 1.271852, 1.021715, 1, 0, 0.7843137, 1,
1.013745, 0.2130953, -0.9483537, 1, 0, 0.7803922, 1,
1.020785, -0.4661118, 3.072502, 1, 0, 0.772549, 1,
1.028263, 2.985503, 0.6441745, 1, 0, 0.7686275, 1,
1.038517, -1.088651, 0.9654928, 1, 0, 0.7607843, 1,
1.053231, 1.647969, 0.7556689, 1, 0, 0.7568628, 1,
1.061948, 0.6731346, 1.331469, 1, 0, 0.7490196, 1,
1.067625, -0.1370709, 3.671522, 1, 0, 0.7450981, 1,
1.071291, 0.2641439, 1.175122, 1, 0, 0.7372549, 1,
1.073167, 0.420433, 1.368587, 1, 0, 0.7333333, 1,
1.076126, -0.426993, 1.514645, 1, 0, 0.7254902, 1,
1.076133, 0.7175083, 0.9042522, 1, 0, 0.7215686, 1,
1.07663, 0.1088989, 0.1427046, 1, 0, 0.7137255, 1,
1.079238, 0.4504824, 1.202777, 1, 0, 0.7098039, 1,
1.08072, -0.5734264, 1.999269, 1, 0, 0.7019608, 1,
1.084938, -0.5155509, 2.939839, 1, 0, 0.6941177, 1,
1.0952, -0.2099698, 1.45527, 1, 0, 0.6901961, 1,
1.100901, 0.378783, 0.3642656, 1, 0, 0.682353, 1,
1.104972, 0.0378198, 0.8788651, 1, 0, 0.6784314, 1,
1.10935, 0.555878, -0.575103, 1, 0, 0.6705883, 1,
1.118181, -0.352157, 2.379375, 1, 0, 0.6666667, 1,
1.143722, 0.7331336, -0.6935681, 1, 0, 0.6588235, 1,
1.146654, 0.3536882, 0.211799, 1, 0, 0.654902, 1,
1.152226, 0.5618381, 2.92502, 1, 0, 0.6470588, 1,
1.155685, 0.810246, 0.459798, 1, 0, 0.6431373, 1,
1.160792, 2.045486, -0.1593156, 1, 0, 0.6352941, 1,
1.165432, -1.289795, 2.634919, 1, 0, 0.6313726, 1,
1.174126, 0.9529966, -0.1794982, 1, 0, 0.6235294, 1,
1.179666, 0.737951, 0.2859809, 1, 0, 0.6196079, 1,
1.199524, -0.6115742, 1.913791, 1, 0, 0.6117647, 1,
1.201575, -1.124752, 2.462468, 1, 0, 0.6078432, 1,
1.204512, 0.9707974, 0.7459231, 1, 0, 0.6, 1,
1.217416, -0.1065604, 3.878812, 1, 0, 0.5921569, 1,
1.22016, 0.7270736, 1.44393, 1, 0, 0.5882353, 1,
1.220873, 0.6829246, 1.433594, 1, 0, 0.5803922, 1,
1.222978, -1.883969, 2.442095, 1, 0, 0.5764706, 1,
1.223073, 0.7005703, 0.2281826, 1, 0, 0.5686275, 1,
1.235625, 0.3170429, -0.5829501, 1, 0, 0.5647059, 1,
1.243961, 0.5051797, 2.787835, 1, 0, 0.5568628, 1,
1.249321, 0.1651148, 2.377548, 1, 0, 0.5529412, 1,
1.252534, 1.531692, 0.937528, 1, 0, 0.5450981, 1,
1.259682, 0.2593477, 0.6095712, 1, 0, 0.5411765, 1,
1.260091, 1.496615, 0.7694824, 1, 0, 0.5333334, 1,
1.26587, -2.159436, 3.663009, 1, 0, 0.5294118, 1,
1.267262, -1.006942, 2.326345, 1, 0, 0.5215687, 1,
1.270937, 1.356915, -0.4559301, 1, 0, 0.5176471, 1,
1.272353, -1.616458, 3.109548, 1, 0, 0.509804, 1,
1.283191, -0.7073939, 3.023306, 1, 0, 0.5058824, 1,
1.288625, 0.7847026, 1.296469, 1, 0, 0.4980392, 1,
1.291228, 0.05157793, 1.858479, 1, 0, 0.4901961, 1,
1.29471, -0.4418919, 1.554611, 1, 0, 0.4862745, 1,
1.300727, -1.250362, 2.021948, 1, 0, 0.4784314, 1,
1.301984, 2.220216, 0.2475506, 1, 0, 0.4745098, 1,
1.307877, 0.8012618, -0.724364, 1, 0, 0.4666667, 1,
1.317173, 1.70913, 1.134948, 1, 0, 0.4627451, 1,
1.320871, 0.1578361, 2.228493, 1, 0, 0.454902, 1,
1.333728, 0.1056388, 1.703496, 1, 0, 0.4509804, 1,
1.334771, 1.469142, -0.2384728, 1, 0, 0.4431373, 1,
1.335948, 0.580347, 0.1745795, 1, 0, 0.4392157, 1,
1.33653, 0.7543371, 1.233249, 1, 0, 0.4313726, 1,
1.342107, -0.1854451, 2.926956, 1, 0, 0.427451, 1,
1.342764, 0.2628974, 1.802211, 1, 0, 0.4196078, 1,
1.343708, -1.243324, 4.023309, 1, 0, 0.4156863, 1,
1.343749, 1.200313, 1.224125, 1, 0, 0.4078431, 1,
1.403104, 0.01889642, 3.240311, 1, 0, 0.4039216, 1,
1.428655, 1.688904, -1.240121, 1, 0, 0.3960784, 1,
1.436364, -0.4148763, 1.257921, 1, 0, 0.3882353, 1,
1.444157, -0.8054466, 0.1676095, 1, 0, 0.3843137, 1,
1.457938, 0.6063945, 2.075502, 1, 0, 0.3764706, 1,
1.475483, -1.593441, 3.104749, 1, 0, 0.372549, 1,
1.483858, -0.08307062, 2.010496, 1, 0, 0.3647059, 1,
1.488922, -0.5648912, 1.696185, 1, 0, 0.3607843, 1,
1.49086, 0.3470339, 1.604623, 1, 0, 0.3529412, 1,
1.49569, -0.279189, 3.502397, 1, 0, 0.3490196, 1,
1.500301, 0.5401133, 0.7972094, 1, 0, 0.3411765, 1,
1.506124, -0.7448464, 2.701228, 1, 0, 0.3372549, 1,
1.538312, 0.4574618, 0.8325785, 1, 0, 0.3294118, 1,
1.543679, -0.8795418, 2.970993, 1, 0, 0.3254902, 1,
1.562305, 0.2284538, 1.73189, 1, 0, 0.3176471, 1,
1.572264, -1.026337, 1.586165, 1, 0, 0.3137255, 1,
1.585599, 1.589135, 0.1116086, 1, 0, 0.3058824, 1,
1.590146, -1.021309, 1.613112, 1, 0, 0.2980392, 1,
1.596952, 0.6407785, 1.648758, 1, 0, 0.2941177, 1,
1.598301, -0.1628287, 1.712033, 1, 0, 0.2862745, 1,
1.608272, -1.040456, 2.024907, 1, 0, 0.282353, 1,
1.609499, 0.2416449, 1.997157, 1, 0, 0.2745098, 1,
1.610401, -0.5916595, 1.087262, 1, 0, 0.2705882, 1,
1.617193, -1.330098, 3.52128, 1, 0, 0.2627451, 1,
1.636071, -1.131702, 3.201424, 1, 0, 0.2588235, 1,
1.644084, 0.9327725, 0.6284878, 1, 0, 0.2509804, 1,
1.648899, -0.292464, 1.346138, 1, 0, 0.2470588, 1,
1.649174, 0.4542158, 2.772857, 1, 0, 0.2392157, 1,
1.693941, -0.6192185, 2.371504, 1, 0, 0.2352941, 1,
1.714685, -0.5554547, 0.8490416, 1, 0, 0.227451, 1,
1.715085, 2.084734, 1.622925, 1, 0, 0.2235294, 1,
1.74074, 0.2992789, 2.624627, 1, 0, 0.2156863, 1,
1.754584, 1.463449, 2.902247, 1, 0, 0.2117647, 1,
1.754675, 1.110848, 0.6526567, 1, 0, 0.2039216, 1,
1.757754, 0.3397894, 0.6760306, 1, 0, 0.1960784, 1,
1.759089, -0.4967381, 1.284741, 1, 0, 0.1921569, 1,
1.771224, -1.25328, 1.743411, 1, 0, 0.1843137, 1,
1.79013, -0.3559911, 0.8840005, 1, 0, 0.1803922, 1,
1.820377, -0.6139036, 2.922106, 1, 0, 0.172549, 1,
1.837966, -0.8164786, 0.8785563, 1, 0, 0.1686275, 1,
1.844115, 0.4058917, 1.22351, 1, 0, 0.1607843, 1,
1.848071, -1.28062, 2.939574, 1, 0, 0.1568628, 1,
1.899915, 0.6397856, -0.4376881, 1, 0, 0.1490196, 1,
1.91698, -1.327217, 1.901652, 1, 0, 0.145098, 1,
1.968435, 0.8135266, 1.138545, 1, 0, 0.1372549, 1,
1.972711, -0.9471273, 1.928585, 1, 0, 0.1333333, 1,
1.983114, 1.206521, 1.646288, 1, 0, 0.1254902, 1,
1.987982, 0.5993823, -0.8286193, 1, 0, 0.1215686, 1,
1.993394, 0.6737841, 0.08599126, 1, 0, 0.1137255, 1,
2.066186, -1.069093, 1.509099, 1, 0, 0.1098039, 1,
2.072392, 0.7164016, 3.143462, 1, 0, 0.1019608, 1,
2.146141, -0.6352675, 1.534757, 1, 0, 0.09411765, 1,
2.157166, -0.957056, 2.853048, 1, 0, 0.09019608, 1,
2.18171, 0.3675591, 1.672298, 1, 0, 0.08235294, 1,
2.263545, 0.22836, 1.66837, 1, 0, 0.07843138, 1,
2.284785, 1.960555, -0.0581231, 1, 0, 0.07058824, 1,
2.344909, -0.3161095, 2.344255, 1, 0, 0.06666667, 1,
2.351625, -0.1187211, 2.48398, 1, 0, 0.05882353, 1,
2.436359, 0.4013517, 1.642936, 1, 0, 0.05490196, 1,
2.446494, -0.1454531, 1.244023, 1, 0, 0.04705882, 1,
2.521982, 0.1068422, 2.775196, 1, 0, 0.04313726, 1,
2.579814, -0.2232275, 0.7646307, 1, 0, 0.03529412, 1,
2.696502, 0.6808626, -0.4551288, 1, 0, 0.03137255, 1,
2.828068, -0.8851552, 3.188103, 1, 0, 0.02352941, 1,
2.969453, 0.5802845, 1.69936, 1, 0, 0.01960784, 1,
3.165086, -2.101708, 2.253217, 1, 0, 0.01176471, 1,
4.000479, 0.6586557, 2.959861, 1, 0, 0.007843138, 1
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
0.3280574, -5.383825, -9.298858, 0, -0.5, 0.5, 0.5,
0.3280574, -5.383825, -9.298858, 1, -0.5, 0.5, 0.5,
0.3280574, -5.383825, -9.298858, 1, 1.5, 0.5, 0.5,
0.3280574, -5.383825, -9.298858, 0, 1.5, 0.5, 0.5
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
-4.589315, -0.2831838, -9.298858, 0, -0.5, 0.5, 0.5,
-4.589315, -0.2831838, -9.298858, 1, -0.5, 0.5, 0.5,
-4.589315, -0.2831838, -9.298858, 1, 1.5, 0.5, 0.5,
-4.589315, -0.2831838, -9.298858, 0, 1.5, 0.5, 0.5
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
-4.589315, -5.383825, -0.3132493, 0, -0.5, 0.5, 0.5,
-4.589315, -5.383825, -0.3132493, 1, -0.5, 0.5, 0.5,
-4.589315, -5.383825, -0.3132493, 1, 1.5, 0.5, 0.5,
-4.589315, -5.383825, -0.3132493, 0, 1.5, 0.5, 0.5
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
-2, -4.206754, -7.225255,
4, -4.206754, -7.225255,
-2, -4.206754, -7.225255,
-2, -4.402933, -7.570856,
0, -4.206754, -7.225255,
0, -4.402933, -7.570856,
2, -4.206754, -7.225255,
2, -4.402933, -7.570856,
4, -4.206754, -7.225255,
4, -4.402933, -7.570856
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
-2, -4.79529, -8.262056, 0, -0.5, 0.5, 0.5,
-2, -4.79529, -8.262056, 1, -0.5, 0.5, 0.5,
-2, -4.79529, -8.262056, 1, 1.5, 0.5, 0.5,
-2, -4.79529, -8.262056, 0, 1.5, 0.5, 0.5,
0, -4.79529, -8.262056, 0, -0.5, 0.5, 0.5,
0, -4.79529, -8.262056, 1, -0.5, 0.5, 0.5,
0, -4.79529, -8.262056, 1, 1.5, 0.5, 0.5,
0, -4.79529, -8.262056, 0, 1.5, 0.5, 0.5,
2, -4.79529, -8.262056, 0, -0.5, 0.5, 0.5,
2, -4.79529, -8.262056, 1, -0.5, 0.5, 0.5,
2, -4.79529, -8.262056, 1, 1.5, 0.5, 0.5,
2, -4.79529, -8.262056, 0, 1.5, 0.5, 0.5,
4, -4.79529, -8.262056, 0, -0.5, 0.5, 0.5,
4, -4.79529, -8.262056, 1, -0.5, 0.5, 0.5,
4, -4.79529, -8.262056, 1, 1.5, 0.5, 0.5,
4, -4.79529, -8.262056, 0, 1.5, 0.5, 0.5
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
-3.454537, -4, -7.225255,
-3.454537, 2, -7.225255,
-3.454537, -4, -7.225255,
-3.643667, -4, -7.570856,
-3.454537, -2, -7.225255,
-3.643667, -2, -7.570856,
-3.454537, 0, -7.225255,
-3.643667, 0, -7.570856,
-3.454537, 2, -7.225255,
-3.643667, 2, -7.570856
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
"-4",
"-2",
"0",
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
-4.021926, -4, -8.262056, 0, -0.5, 0.5, 0.5,
-4.021926, -4, -8.262056, 1, -0.5, 0.5, 0.5,
-4.021926, -4, -8.262056, 1, 1.5, 0.5, 0.5,
-4.021926, -4, -8.262056, 0, 1.5, 0.5, 0.5,
-4.021926, -2, -8.262056, 0, -0.5, 0.5, 0.5,
-4.021926, -2, -8.262056, 1, -0.5, 0.5, 0.5,
-4.021926, -2, -8.262056, 1, 1.5, 0.5, 0.5,
-4.021926, -2, -8.262056, 0, 1.5, 0.5, 0.5,
-4.021926, 0, -8.262056, 0, -0.5, 0.5, 0.5,
-4.021926, 0, -8.262056, 1, -0.5, 0.5, 0.5,
-4.021926, 0, -8.262056, 1, 1.5, 0.5, 0.5,
-4.021926, 0, -8.262056, 0, 1.5, 0.5, 0.5,
-4.021926, 2, -8.262056, 0, -0.5, 0.5, 0.5,
-4.021926, 2, -8.262056, 1, -0.5, 0.5, 0.5,
-4.021926, 2, -8.262056, 1, 1.5, 0.5, 0.5,
-4.021926, 2, -8.262056, 0, 1.5, 0.5, 0.5
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
-3.454537, -4.206754, -6,
-3.454537, -4.206754, 6,
-3.454537, -4.206754, -6,
-3.643667, -4.402933, -6,
-3.454537, -4.206754, -4,
-3.643667, -4.402933, -4,
-3.454537, -4.206754, -2,
-3.643667, -4.402933, -2,
-3.454537, -4.206754, 0,
-3.643667, -4.402933, 0,
-3.454537, -4.206754, 2,
-3.643667, -4.402933, 2,
-3.454537, -4.206754, 4,
-3.643667, -4.402933, 4,
-3.454537, -4.206754, 6,
-3.643667, -4.402933, 6
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
-4.021926, -4.79529, -6, 0, -0.5, 0.5, 0.5,
-4.021926, -4.79529, -6, 1, -0.5, 0.5, 0.5,
-4.021926, -4.79529, -6, 1, 1.5, 0.5, 0.5,
-4.021926, -4.79529, -6, 0, 1.5, 0.5, 0.5,
-4.021926, -4.79529, -4, 0, -0.5, 0.5, 0.5,
-4.021926, -4.79529, -4, 1, -0.5, 0.5, 0.5,
-4.021926, -4.79529, -4, 1, 1.5, 0.5, 0.5,
-4.021926, -4.79529, -4, 0, 1.5, 0.5, 0.5,
-4.021926, -4.79529, -2, 0, -0.5, 0.5, 0.5,
-4.021926, -4.79529, -2, 1, -0.5, 0.5, 0.5,
-4.021926, -4.79529, -2, 1, 1.5, 0.5, 0.5,
-4.021926, -4.79529, -2, 0, 1.5, 0.5, 0.5,
-4.021926, -4.79529, 0, 0, -0.5, 0.5, 0.5,
-4.021926, -4.79529, 0, 1, -0.5, 0.5, 0.5,
-4.021926, -4.79529, 0, 1, 1.5, 0.5, 0.5,
-4.021926, -4.79529, 0, 0, 1.5, 0.5, 0.5,
-4.021926, -4.79529, 2, 0, -0.5, 0.5, 0.5,
-4.021926, -4.79529, 2, 1, -0.5, 0.5, 0.5,
-4.021926, -4.79529, 2, 1, 1.5, 0.5, 0.5,
-4.021926, -4.79529, 2, 0, 1.5, 0.5, 0.5,
-4.021926, -4.79529, 4, 0, -0.5, 0.5, 0.5,
-4.021926, -4.79529, 4, 1, -0.5, 0.5, 0.5,
-4.021926, -4.79529, 4, 1, 1.5, 0.5, 0.5,
-4.021926, -4.79529, 4, 0, 1.5, 0.5, 0.5,
-4.021926, -4.79529, 6, 0, -0.5, 0.5, 0.5,
-4.021926, -4.79529, 6, 1, -0.5, 0.5, 0.5,
-4.021926, -4.79529, 6, 1, 1.5, 0.5, 0.5,
-4.021926, -4.79529, 6, 0, 1.5, 0.5, 0.5
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
-3.454537, -4.206754, -7.225255,
-3.454537, 3.640387, -7.225255,
-3.454537, -4.206754, 6.598757,
-3.454537, 3.640387, 6.598757,
-3.454537, -4.206754, -7.225255,
-3.454537, -4.206754, 6.598757,
-3.454537, 3.640387, -7.225255,
-3.454537, 3.640387, 6.598757,
-3.454537, -4.206754, -7.225255,
4.110652, -4.206754, -7.225255,
-3.454537, -4.206754, 6.598757,
4.110652, -4.206754, 6.598757,
-3.454537, 3.640387, -7.225255,
4.110652, 3.640387, -7.225255,
-3.454537, 3.640387, 6.598757,
4.110652, 3.640387, 6.598757,
4.110652, -4.206754, -7.225255,
4.110652, 3.640387, -7.225255,
4.110652, -4.206754, 6.598757,
4.110652, 3.640387, 6.598757,
4.110652, -4.206754, -7.225255,
4.110652, -4.206754, 6.598757,
4.110652, 3.640387, -7.225255,
4.110652, 3.640387, 6.598757
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
var radius = 9.400379;
var distance = 41.82335;
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
mvMatrix.translate( -0.3280574, 0.2831838, 0.3132493 );
mvMatrix.scale( 1.343506, 1.295233, 0.7352333 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -41.82335);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
dicumarol<-read.table("dicumarol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dicumarol$V2
```

```
## Error in eval(expr, envir, enclos): object 'dicumarol' not found
```

```r
y<-dicumarol$V3
```

```
## Error in eval(expr, envir, enclos): object 'dicumarol' not found
```

```r
z<-dicumarol$V4
```

```
## Error in eval(expr, envir, enclos): object 'dicumarol' not found
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
-3.344364, 0.3772027, -3.009867, 0, 0, 1, 1, 1,
-2.969511, 0.5048726, -2.342297, 1, 0, 0, 1, 1,
-2.755339, 1.512087, -2.375796, 1, 0, 0, 1, 1,
-2.743713, 0.531935, -1.86039, 1, 0, 0, 1, 1,
-2.724922, -1.406466, -2.013742, 1, 0, 0, 1, 1,
-2.601304, 0.1358865, -3.833579, 1, 0, 0, 1, 1,
-2.552955, -0.04145322, -3.269749, 0, 0, 0, 1, 1,
-2.366162, 0.1845931, -0.4721662, 0, 0, 0, 1, 1,
-2.32455, 0.9809135, -0.4320675, 0, 0, 0, 1, 1,
-2.314245, 0.5990669, -0.5020481, 0, 0, 0, 1, 1,
-2.288826, 0.8412471, -1.392781, 0, 0, 0, 1, 1,
-2.266227, -1.716317, -2.96654, 0, 0, 0, 1, 1,
-2.257324, 2.286198, -0.8242962, 0, 0, 0, 1, 1,
-2.210486, 1.244275, -3.292426, 1, 1, 1, 1, 1,
-2.179156, 0.3942461, -1.708618, 1, 1, 1, 1, 1,
-2.170651, -0.08663071, -2.72612, 1, 1, 1, 1, 1,
-2.163442, 0.1125983, -1.285301, 1, 1, 1, 1, 1,
-2.131761, -0.5281082, -3.303566, 1, 1, 1, 1, 1,
-2.127722, -0.007143998, -1.01633, 1, 1, 1, 1, 1,
-2.100349, -0.3699056, -1.677171, 1, 1, 1, 1, 1,
-2.095313, -0.6059463, -0.9602221, 1, 1, 1, 1, 1,
-2.09256, -1.922968, -3.508653, 1, 1, 1, 1, 1,
-2.075536, -0.2564425, -1.962293, 1, 1, 1, 1, 1,
-2.065909, 0.01099708, -2.097757, 1, 1, 1, 1, 1,
-2.063203, -2.45741, -2.659368, 1, 1, 1, 1, 1,
-2.040774, 2.293208, -2.508796, 1, 1, 1, 1, 1,
-2.033948, 1.249413, -0.3974806, 1, 1, 1, 1, 1,
-2.011044, -0.09470282, -0.2346011, 1, 1, 1, 1, 1,
-1.975831, 1.259867, -0.3137968, 0, 0, 1, 1, 1,
-1.973593, 0.07410841, -2.070966, 1, 0, 0, 1, 1,
-1.951609, -0.1386563, -2.182712, 1, 0, 0, 1, 1,
-1.941493, 0.7276634, 0.611365, 1, 0, 0, 1, 1,
-1.908939, 1.521416, -2.778476, 1, 0, 0, 1, 1,
-1.908223, 0.8800746, -1.408338, 1, 0, 0, 1, 1,
-1.905889, 0.3290688, 0.7060888, 0, 0, 0, 1, 1,
-1.87166, 2.601911, -0.4506671, 0, 0, 0, 1, 1,
-1.867752, 1.08421, -0.6757819, 0, 0, 0, 1, 1,
-1.865247, 2.073874, 1.799826, 0, 0, 0, 1, 1,
-1.832206, -1.210796, -2.86223, 0, 0, 0, 1, 1,
-1.821092, -1.219168, -1.929844, 0, 0, 0, 1, 1,
-1.819578, 1.36806, -2.376792, 0, 0, 0, 1, 1,
-1.801486, 0.3897548, -3.407314, 1, 1, 1, 1, 1,
-1.795838, 0.6191208, 1.494751, 1, 1, 1, 1, 1,
-1.795456, -1.130712, -1.636729, 1, 1, 1, 1, 1,
-1.7906, -0.4834984, -2.168051, 1, 1, 1, 1, 1,
-1.789129, 0.9018475, 0.3443215, 1, 1, 1, 1, 1,
-1.782633, 0.3495477, -0.3135326, 1, 1, 1, 1, 1,
-1.761429, -0.3412176, -1.59609, 1, 1, 1, 1, 1,
-1.723433, 0.5520988, -1.386787, 1, 1, 1, 1, 1,
-1.720955, -0.0966877, -1.694819, 1, 1, 1, 1, 1,
-1.700989, 0.9913542, -0.3365915, 1, 1, 1, 1, 1,
-1.666103, -0.2843111, -2.538225, 1, 1, 1, 1, 1,
-1.660242, 1.727913, -0.1580216, 1, 1, 1, 1, 1,
-1.647716, -1.156583, -2.357478, 1, 1, 1, 1, 1,
-1.635732, 0.2765117, 1.31107, 1, 1, 1, 1, 1,
-1.634543, 0.9723658, -0.4752405, 1, 1, 1, 1, 1,
-1.625358, -0.4294611, -2.195304, 0, 0, 1, 1, 1,
-1.610736, 1.236667, -0.2809307, 1, 0, 0, 1, 1,
-1.602003, -0.6607215, -1.741374, 1, 0, 0, 1, 1,
-1.587003, 1.179578, -1.674043, 1, 0, 0, 1, 1,
-1.586715, 1.43946, -1.044529, 1, 0, 0, 1, 1,
-1.56524, 0.6388666, -1.273031, 1, 0, 0, 1, 1,
-1.552121, -0.9280912, -3.435357, 0, 0, 0, 1, 1,
-1.547945, 0.7631307, -0.828905, 0, 0, 0, 1, 1,
-1.524902, -1.594252, -1.47269, 0, 0, 0, 1, 1,
-1.519851, -1.554119, -1.34859, 0, 0, 0, 1, 1,
-1.518946, -0.9515671, -0.7158259, 0, 0, 0, 1, 1,
-1.504158, 0.03964542, -2.540055, 0, 0, 0, 1, 1,
-1.487733, 0.7681125, -2.233468, 0, 0, 0, 1, 1,
-1.481658, 0.8772652, -0.3256785, 1, 1, 1, 1, 1,
-1.466299, -0.6900567, -0.3624807, 1, 1, 1, 1, 1,
-1.46307, -0.5205147, -1.977677, 1, 1, 1, 1, 1,
-1.452411, 0.6237812, -1.395042, 1, 1, 1, 1, 1,
-1.449396, 0.2464551, -1.149027, 1, 1, 1, 1, 1,
-1.447167, -0.07614835, -1.467784, 1, 1, 1, 1, 1,
-1.447124, -0.873248, -2.025391, 1, 1, 1, 1, 1,
-1.442246, 0.06644545, -1.798853, 1, 1, 1, 1, 1,
-1.441361, -0.8009806, -1.704877, 1, 1, 1, 1, 1,
-1.437116, -0.6209114, -2.296981, 1, 1, 1, 1, 1,
-1.431474, 0.9788964, -0.4638928, 1, 1, 1, 1, 1,
-1.424687, -0.6908925, -2.739384, 1, 1, 1, 1, 1,
-1.423366, -1.949145, -1.849887, 1, 1, 1, 1, 1,
-1.420849, 0.1557024, -1.271015, 1, 1, 1, 1, 1,
-1.41281, -1.152371, -2.595534, 1, 1, 1, 1, 1,
-1.397001, -1.230013, -3.087436, 0, 0, 1, 1, 1,
-1.385296, 0.9773627, -1.729459, 1, 0, 0, 1, 1,
-1.383933, -0.3941332, -2.111506, 1, 0, 0, 1, 1,
-1.382509, -1.576675, -3.135267, 1, 0, 0, 1, 1,
-1.381932, -0.4904619, -3.01762, 1, 0, 0, 1, 1,
-1.373978, 1.076913, -2.261325, 1, 0, 0, 1, 1,
-1.37297, -1.473324, -1.457945, 0, 0, 0, 1, 1,
-1.358302, 0.4996831, -0.9952488, 0, 0, 0, 1, 1,
-1.35604, -0.2663908, -1.980664, 0, 0, 0, 1, 1,
-1.353248, 1.006065, -1.351425, 0, 0, 0, 1, 1,
-1.352596, 1.102007, -1.162547, 0, 0, 0, 1, 1,
-1.344653, -1.71219, -3.206861, 0, 0, 0, 1, 1,
-1.337899, -0.471181, -0.2454403, 0, 0, 0, 1, 1,
-1.337094, 0.03124113, -1.332137, 1, 1, 1, 1, 1,
-1.331425, -1.134227, -3.783086, 1, 1, 1, 1, 1,
-1.321436, 1.184736, 0.1525011, 1, 1, 1, 1, 1,
-1.315211, -0.148764, -2.500699, 1, 1, 1, 1, 1,
-1.311277, 1.025687, -0.3843813, 1, 1, 1, 1, 1,
-1.306136, 1.672746, -2.608004, 1, 1, 1, 1, 1,
-1.29336, 0.9299286, -1.29234, 1, 1, 1, 1, 1,
-1.273388, -0.2389084, -1.196849, 1, 1, 1, 1, 1,
-1.271986, -0.2776382, -1.150932, 1, 1, 1, 1, 1,
-1.270721, 0.2213461, -1.922533, 1, 1, 1, 1, 1,
-1.265963, 0.02318116, -4.043354, 1, 1, 1, 1, 1,
-1.253124, -0.7272783, -3.09009, 1, 1, 1, 1, 1,
-1.251567, -0.4928836, -1.688402, 1, 1, 1, 1, 1,
-1.247257, 0.678035, -0.1657602, 1, 1, 1, 1, 1,
-1.245144, -1.174594, -0.842754, 1, 1, 1, 1, 1,
-1.226161, -0.8478391, -1.813872, 0, 0, 1, 1, 1,
-1.21966, 1.355664, -1.757491, 1, 0, 0, 1, 1,
-1.218524, -0.5584444, -2.381377, 1, 0, 0, 1, 1,
-1.203302, 0.06650386, -1.97084, 1, 0, 0, 1, 1,
-1.19515, -0.2923335, -0.2691807, 1, 0, 0, 1, 1,
-1.187765, -0.8239421, -3.298531, 1, 0, 0, 1, 1,
-1.186899, 0.34571, -0.7855722, 0, 0, 0, 1, 1,
-1.183012, 1.144366, -1.08991, 0, 0, 0, 1, 1,
-1.171637, -0.4368146, -0.552662, 0, 0, 0, 1, 1,
-1.170701, -0.03375262, -1.853204, 0, 0, 0, 1, 1,
-1.166212, 1.260725, -1.277981, 0, 0, 0, 1, 1,
-1.161232, -0.1881498, -2.355115, 0, 0, 0, 1, 1,
-1.159839, -0.4381475, -0.8502922, 0, 0, 0, 1, 1,
-1.159454, -0.2062323, -1.731554, 1, 1, 1, 1, 1,
-1.156188, -0.4338134, -3.60824, 1, 1, 1, 1, 1,
-1.151928, -0.3240926, -1.508819, 1, 1, 1, 1, 1,
-1.149384, 0.8480364, -1.971195, 1, 1, 1, 1, 1,
-1.146882, -1.13422, -1.84666, 1, 1, 1, 1, 1,
-1.127124, 1.033788, -1.235406, 1, 1, 1, 1, 1,
-1.124746, -0.1656249, -1.17652, 1, 1, 1, 1, 1,
-1.122142, 1.355796, -2.026702, 1, 1, 1, 1, 1,
-1.119853, -0.3263964, -2.190126, 1, 1, 1, 1, 1,
-1.112164, 0.7378128, -0.1101648, 1, 1, 1, 1, 1,
-1.11175, -0.5372409, -2.90072, 1, 1, 1, 1, 1,
-1.110073, -1.366359, -2.168061, 1, 1, 1, 1, 1,
-1.096461, -0.1640025, -0.4129433, 1, 1, 1, 1, 1,
-1.088112, -1.218005, -4.43538, 1, 1, 1, 1, 1,
-1.082659, 0.08443842, -3.315238, 1, 1, 1, 1, 1,
-1.077399, -0.5292953, -3.312952, 0, 0, 1, 1, 1,
-1.071202, -1.103093, -2.912839, 1, 0, 0, 1, 1,
-1.061312, -0.1665921, -0.4483929, 1, 0, 0, 1, 1,
-1.056003, 2.264521, -1.387407, 1, 0, 0, 1, 1,
-1.053557, 1.042482, -2.244216, 1, 0, 0, 1, 1,
-1.053525, 0.9762768, -1.064124, 1, 0, 0, 1, 1,
-1.051894, -0.7301311, -0.6859739, 0, 0, 0, 1, 1,
-1.041001, -0.6896057, -1.065131, 0, 0, 0, 1, 1,
-1.034732, 1.219084, -2.046465, 0, 0, 0, 1, 1,
-1.032889, -0.5598538, -2.070541, 0, 0, 0, 1, 1,
-1.026386, 2.236587, 0.4069127, 0, 0, 0, 1, 1,
-1.025392, -2.40306, -3.987858, 0, 0, 0, 1, 1,
-1.02031, -0.7928912, -1.703734, 0, 0, 0, 1, 1,
-1.019036, 1.473257, -0.7498556, 1, 1, 1, 1, 1,
-1.016295, -0.01204603, 0.3292537, 1, 1, 1, 1, 1,
-1.015588, 0.05551296, -2.332724, 1, 1, 1, 1, 1,
-1.012666, 2.534972, -0.3667461, 1, 1, 1, 1, 1,
-1.011523, -1.077276, -2.113785, 1, 1, 1, 1, 1,
-1.009197, 1.478901, -0.4413125, 1, 1, 1, 1, 1,
-1.001925, -0.4107993, -2.209815, 1, 1, 1, 1, 1,
-0.9977915, -0.4187361, -3.164345, 1, 1, 1, 1, 1,
-0.9966036, 1.171321, -1.945845, 1, 1, 1, 1, 1,
-0.9920809, -0.7779827, -0.8875265, 1, 1, 1, 1, 1,
-0.9910432, -0.5944875, -0.7178074, 1, 1, 1, 1, 1,
-0.9866489, -1.160696, -2.657887, 1, 1, 1, 1, 1,
-0.9814907, 0.8909229, -1.151095, 1, 1, 1, 1, 1,
-0.9807788, -0.4821717, -2.181865, 1, 1, 1, 1, 1,
-0.9773564, -1.158232, -3.491412, 1, 1, 1, 1, 1,
-0.9750722, 0.9235761, -0.299733, 0, 0, 1, 1, 1,
-0.9682686, -0.2746063, -1.316776, 1, 0, 0, 1, 1,
-0.9618174, 0.3310814, -2.638422, 1, 0, 0, 1, 1,
-0.9590951, 0.7437087, -2.276976, 1, 0, 0, 1, 1,
-0.9520119, 0.5319804, -0.453956, 1, 0, 0, 1, 1,
-0.95032, 0.4517623, -1.100936, 1, 0, 0, 1, 1,
-0.944478, -0.3753469, -1.635828, 0, 0, 0, 1, 1,
-0.9429344, -0.1994134, -1.516042, 0, 0, 0, 1, 1,
-0.9340679, -0.05365784, -2.670254, 0, 0, 0, 1, 1,
-0.9304957, 2.029929, 0.2761801, 0, 0, 0, 1, 1,
-0.9271121, 0.9850784, -1.985605, 0, 0, 0, 1, 1,
-0.9232885, -0.04467253, 0.3859386, 0, 0, 0, 1, 1,
-0.922464, 1.351254, -0.3176361, 0, 0, 0, 1, 1,
-0.9138069, 1.078375, -1.15097, 1, 1, 1, 1, 1,
-0.911135, -0.6072054, -0.6684526, 1, 1, 1, 1, 1,
-0.9066173, -0.5724504, -0.3696283, 1, 1, 1, 1, 1,
-0.9030746, 0.4348642, -1.630431, 1, 1, 1, 1, 1,
-0.9026397, -0.3015851, -1.448331, 1, 1, 1, 1, 1,
-0.9009377, 0.8311069, -0.1193706, 1, 1, 1, 1, 1,
-0.893627, 0.2051474, -2.375156, 1, 1, 1, 1, 1,
-0.8915172, -0.6627801, -3.837147, 1, 1, 1, 1, 1,
-0.8906223, -0.8278596, -2.470905, 1, 1, 1, 1, 1,
-0.889038, 1.006723, -0.5573663, 1, 1, 1, 1, 1,
-0.8859125, -0.8559965, -2.553819, 1, 1, 1, 1, 1,
-0.8833554, 0.1389549, -0.2129549, 1, 1, 1, 1, 1,
-0.8820018, 1.659608, -0.9733599, 1, 1, 1, 1, 1,
-0.8809047, 0.2773623, -1.741527, 1, 1, 1, 1, 1,
-0.8739709, -0.9920764, -2.868572, 1, 1, 1, 1, 1,
-0.8725363, -0.2159778, -1.408083, 0, 0, 1, 1, 1,
-0.8679568, 1.320734, -0.9667405, 1, 0, 0, 1, 1,
-0.8676204, 0.600578, -1.039974, 1, 0, 0, 1, 1,
-0.8655379, -1.358613, -3.560262, 1, 0, 0, 1, 1,
-0.8639132, -0.1002925, -2.467244, 1, 0, 0, 1, 1,
-0.8623328, 1.39807, -1.586615, 1, 0, 0, 1, 1,
-0.8599038, -0.05190264, -0.9539695, 0, 0, 0, 1, 1,
-0.8593674, -1.163214, -2.171259, 0, 0, 0, 1, 1,
-0.8590155, 0.1082232, -1.633213, 0, 0, 0, 1, 1,
-0.8572571, -0.7446525, -3.536812, 0, 0, 0, 1, 1,
-0.8568904, -0.4080518, -2.848341, 0, 0, 0, 1, 1,
-0.854533, -0.7239763, -1.931476, 0, 0, 0, 1, 1,
-0.8492502, 1.103528, -0.06495839, 0, 0, 0, 1, 1,
-0.8449175, -0.1918714, -1.014982, 1, 1, 1, 1, 1,
-0.8386778, -1.040894, -1.420383, 1, 1, 1, 1, 1,
-0.8381749, -0.6491688, -1.732733, 1, 1, 1, 1, 1,
-0.8353329, -0.6927935, -0.3644808, 1, 1, 1, 1, 1,
-0.8347741, 0.02700975, -2.444576, 1, 1, 1, 1, 1,
-0.8335145, 2.366288, -1.383552, 1, 1, 1, 1, 1,
-0.8325371, 1.527571, -2.075049, 1, 1, 1, 1, 1,
-0.8305696, 0.9813733, 0.2451134, 1, 1, 1, 1, 1,
-0.8290412, 0.4660715, -2.451057, 1, 1, 1, 1, 1,
-0.8262323, 0.7601009, -1.713833, 1, 1, 1, 1, 1,
-0.8241345, 1.180489, -1.820027, 1, 1, 1, 1, 1,
-0.8204604, 0.1833045, -1.571381, 1, 1, 1, 1, 1,
-0.8096685, -1.108441, -1.114553, 1, 1, 1, 1, 1,
-0.8067597, 0.9426739, -0.8573868, 1, 1, 1, 1, 1,
-0.7995861, -0.5858728, -4.353303, 1, 1, 1, 1, 1,
-0.7975755, 0.05607594, -0.3536843, 0, 0, 1, 1, 1,
-0.7948106, 1.872917, -0.3069434, 1, 0, 0, 1, 1,
-0.7940446, 0.1937794, -0.4701861, 1, 0, 0, 1, 1,
-0.7939858, -0.6077908, -1.925934, 1, 0, 0, 1, 1,
-0.7922149, 1.366264, -1.519723, 1, 0, 0, 1, 1,
-0.7912563, -0.4728191, -2.099293, 1, 0, 0, 1, 1,
-0.7909124, -1.083591, -2.902265, 0, 0, 0, 1, 1,
-0.7906712, -0.4301948, -3.181921, 0, 0, 0, 1, 1,
-0.7887325, -0.6232143, -1.289392, 0, 0, 0, 1, 1,
-0.7870292, 0.8545067, -0.8671481, 0, 0, 0, 1, 1,
-0.7706801, -0.4734916, -2.777337, 0, 0, 0, 1, 1,
-0.7703862, 0.6194124, -2.391074, 0, 0, 0, 1, 1,
-0.7500786, 1.063214, -0.5899338, 0, 0, 0, 1, 1,
-0.7468144, -0.2641907, 0.07048481, 1, 1, 1, 1, 1,
-0.7455444, 0.6810931, -1.442837, 1, 1, 1, 1, 1,
-0.7415999, 0.3315695, -1.338557, 1, 1, 1, 1, 1,
-0.7388027, 1.908678, 0.2955791, 1, 1, 1, 1, 1,
-0.7314535, -0.9332874, -1.826616, 1, 1, 1, 1, 1,
-0.7298594, -0.6194984, -3.158434, 1, 1, 1, 1, 1,
-0.7249348, 1.570673, -0.5527884, 1, 1, 1, 1, 1,
-0.7240042, -1.386312, -1.755893, 1, 1, 1, 1, 1,
-0.712306, 0.3396409, -1.650001, 1, 1, 1, 1, 1,
-0.7011668, -0.4802628, -2.59273, 1, 1, 1, 1, 1,
-0.7003707, 1.172245, -1.67724, 1, 1, 1, 1, 1,
-0.6974699, 0.3547402, -2.03674, 1, 1, 1, 1, 1,
-0.6960021, 0.3027983, -0.399722, 1, 1, 1, 1, 1,
-0.6949846, 1.383826, -0.7097585, 1, 1, 1, 1, 1,
-0.6921188, 0.7579125, -2.299498, 1, 1, 1, 1, 1,
-0.6917402, 0.3874678, -0.06610852, 0, 0, 1, 1, 1,
-0.6909274, -1.593493, -5.31062, 1, 0, 0, 1, 1,
-0.6896044, -0.229561, 0.1759979, 1, 0, 0, 1, 1,
-0.6872901, 0.1794777, -0.368223, 1, 0, 0, 1, 1,
-0.6870562, -0.2281934, -1.634293, 1, 0, 0, 1, 1,
-0.6864848, 0.3370013, -1.229188, 1, 0, 0, 1, 1,
-0.6855395, -0.9213359, -3.839512, 0, 0, 0, 1, 1,
-0.6821502, 0.3287432, -0.9092361, 0, 0, 0, 1, 1,
-0.6668456, 0.06088965, -1.952607, 0, 0, 0, 1, 1,
-0.6564608, 1.257951, -2.867432, 0, 0, 0, 1, 1,
-0.6506725, -0.2576249, -0.9936486, 0, 0, 0, 1, 1,
-0.6444024, -0.453297, -2.582847, 0, 0, 0, 1, 1,
-0.6416025, 0.2349859, -0.4082799, 0, 0, 0, 1, 1,
-0.6388892, -0.9970567, -1.618039, 1, 1, 1, 1, 1,
-0.6373209, 0.5852051, -0.4114926, 1, 1, 1, 1, 1,
-0.6348633, -0.8137269, -3.398689, 1, 1, 1, 1, 1,
-0.6333118, 0.2786913, 0.6972906, 1, 1, 1, 1, 1,
-0.6324263, 0.09698108, -1.656064, 1, 1, 1, 1, 1,
-0.62988, -0.00730193, -1.965708, 1, 1, 1, 1, 1,
-0.6297694, 1.08655, -1.461665, 1, 1, 1, 1, 1,
-0.6297398, 1.129161, -1.434947, 1, 1, 1, 1, 1,
-0.6294594, 0.4856209, -1.923366, 1, 1, 1, 1, 1,
-0.6269436, 1.56573, 1.632056, 1, 1, 1, 1, 1,
-0.6265842, -1.045953, -2.480637, 1, 1, 1, 1, 1,
-0.6257013, -2.059793, -2.435249, 1, 1, 1, 1, 1,
-0.6239583, 1.958584, -0.5318087, 1, 1, 1, 1, 1,
-0.6233749, -0.0535325, -0.07028374, 1, 1, 1, 1, 1,
-0.6191908, 1.959965, -0.08284032, 1, 1, 1, 1, 1,
-0.616712, -1.308825, -0.8067673, 0, 0, 1, 1, 1,
-0.6051225, 1.051995, -0.8386299, 1, 0, 0, 1, 1,
-0.59512, -0.7325987, -2.839951, 1, 0, 0, 1, 1,
-0.5950506, 0.04118747, -0.6419454, 1, 0, 0, 1, 1,
-0.5880525, -1.003918, -4.005588, 1, 0, 0, 1, 1,
-0.5874753, -0.1390135, -2.945835, 1, 0, 0, 1, 1,
-0.5845925, -0.5447161, -3.398055, 0, 0, 0, 1, 1,
-0.5832872, 0.394217, -1.857641, 0, 0, 0, 1, 1,
-0.5825241, -1.627307, -2.577309, 0, 0, 0, 1, 1,
-0.579043, -0.7471349, -3.470982, 0, 0, 0, 1, 1,
-0.5765576, 0.0135221, -0.7256878, 0, 0, 0, 1, 1,
-0.5679488, -1.355987, -2.934134, 0, 0, 0, 1, 1,
-0.5675393, 0.7616765, -0.4417777, 0, 0, 0, 1, 1,
-0.5675146, -0.3803366, 0.3410822, 1, 1, 1, 1, 1,
-0.5655098, -0.956776, -3.412563, 1, 1, 1, 1, 1,
-0.5619695, 0.757329, -1.483365, 1, 1, 1, 1, 1,
-0.5586241, -0.5832072, -2.258403, 1, 1, 1, 1, 1,
-0.5550836, 1.928423, 0.9131832, 1, 1, 1, 1, 1,
-0.5534921, -0.05649978, -0.2754042, 1, 1, 1, 1, 1,
-0.5519778, -1.169585, -1.01871, 1, 1, 1, 1, 1,
-0.5494161, 0.5223638, -0.1178923, 1, 1, 1, 1, 1,
-0.5446886, -1.308224, -3.263507, 1, 1, 1, 1, 1,
-0.5370256, -2.78452, -5.016692, 1, 1, 1, 1, 1,
-0.5322596, 1.624914, 0.04193257, 1, 1, 1, 1, 1,
-0.5288824, 0.5362062, -0.3856293, 1, 1, 1, 1, 1,
-0.527913, 2.023043, 0.7748855, 1, 1, 1, 1, 1,
-0.5268041, 1.413533, -0.8014641, 1, 1, 1, 1, 1,
-0.5192505, 0.2586523, -0.5091176, 1, 1, 1, 1, 1,
-0.5188506, -0.07101636, -1.282531, 0, 0, 1, 1, 1,
-0.5168585, 2.201328, 0.4817743, 1, 0, 0, 1, 1,
-0.5154069, 1.237332, 0.7356181, 1, 0, 0, 1, 1,
-0.5133694, -0.6868845, -2.419141, 1, 0, 0, 1, 1,
-0.5132353, 0.5387359, -0.4203275, 1, 0, 0, 1, 1,
-0.5105488, 0.01965269, -3.983026, 1, 0, 0, 1, 1,
-0.5094568, -0.4621066, -4.510897, 0, 0, 0, 1, 1,
-0.5077949, 1.879966, 0.4036416, 0, 0, 0, 1, 1,
-0.5073936, -0.120103, -0.2153642, 0, 0, 0, 1, 1,
-0.5040334, 0.5815263, -1.709674, 0, 0, 0, 1, 1,
-0.5035441, -0.3384488, -1.998393, 0, 0, 0, 1, 1,
-0.5016305, 0.9913532, 0.5811211, 0, 0, 0, 1, 1,
-0.5013389, -0.1457196, -3.148275, 0, 0, 0, 1, 1,
-0.4990329, 1.829788, -0.6890886, 1, 1, 1, 1, 1,
-0.4955803, 0.3192145, -0.5599132, 1, 1, 1, 1, 1,
-0.4929895, -0.2850423, -3.640268, 1, 1, 1, 1, 1,
-0.4917908, -1.504224, -2.987989, 1, 1, 1, 1, 1,
-0.4906697, 1.287787, -0.9878079, 1, 1, 1, 1, 1,
-0.4886084, -0.2071784, -1.060502, 1, 1, 1, 1, 1,
-0.4885934, -0.5931592, -1.577348, 1, 1, 1, 1, 1,
-0.4880683, -0.9783415, -2.257917, 1, 1, 1, 1, 1,
-0.4880143, 0.6468372, 0.3364771, 1, 1, 1, 1, 1,
-0.4876536, 2.455872, 0.4545931, 1, 1, 1, 1, 1,
-0.4867322, 0.8383566, 0.2044981, 1, 1, 1, 1, 1,
-0.4851913, 2.179395, -0.01963905, 1, 1, 1, 1, 1,
-0.4848084, 0.3818087, 0.2221559, 1, 1, 1, 1, 1,
-0.4823545, 0.3802272, -2.121604, 1, 1, 1, 1, 1,
-0.4801, -0.4860333, -0.4097196, 1, 1, 1, 1, 1,
-0.475824, -0.5819734, -2.356853, 0, 0, 1, 1, 1,
-0.4752369, 2.775164, -2.942536, 1, 0, 0, 1, 1,
-0.4743741, -1.825492, -2.672178, 1, 0, 0, 1, 1,
-0.46971, -0.5193589, -2.768702, 1, 0, 0, 1, 1,
-0.4685084, -0.5339977, -1.684843, 1, 0, 0, 1, 1,
-0.4672059, -1.491305, -3.969895, 1, 0, 0, 1, 1,
-0.4601191, 0.01830234, -0.7306295, 0, 0, 0, 1, 1,
-0.4587494, -1.137912, -3.03062, 0, 0, 0, 1, 1,
-0.4507363, -1.489876, -2.790104, 0, 0, 0, 1, 1,
-0.4483296, 1.273023, -1.122938, 0, 0, 0, 1, 1,
-0.4397904, -0.5908786, -3.506161, 0, 0, 0, 1, 1,
-0.4386002, -0.2492313, -2.962071, 0, 0, 0, 1, 1,
-0.4359924, -0.5961462, -4.25052, 0, 0, 0, 1, 1,
-0.4352813, 0.7503337, -0.05100935, 1, 1, 1, 1, 1,
-0.4342805, -1.388659, -3.935319, 1, 1, 1, 1, 1,
-0.4334905, -0.6677235, -3.013927, 1, 1, 1, 1, 1,
-0.4314926, -0.452948, -2.681962, 1, 1, 1, 1, 1,
-0.4293511, 1.155631, -0.2511097, 1, 1, 1, 1, 1,
-0.4269349, -1.111741, -3.84428, 1, 1, 1, 1, 1,
-0.4233349, 0.5712696, -0.4413689, 1, 1, 1, 1, 1,
-0.4201634, -0.1403975, -2.309311, 1, 1, 1, 1, 1,
-0.4175518, -1.183001, -0.7501183, 1, 1, 1, 1, 1,
-0.4156714, 0.3555208, 1.516178, 1, 1, 1, 1, 1,
-0.4126833, 0.571303, -0.2409868, 1, 1, 1, 1, 1,
-0.4109197, 0.2887886, -1.141584, 1, 1, 1, 1, 1,
-0.4010265, 0.4358634, -1.171357, 1, 1, 1, 1, 1,
-0.3981815, 0.9835171, 0.05230649, 1, 1, 1, 1, 1,
-0.3878242, -1.360098, -3.041708, 1, 1, 1, 1, 1,
-0.3848795, -1.114399, -4.266327, 0, 0, 1, 1, 1,
-0.3790296, -0.9670883, -3.667205, 1, 0, 0, 1, 1,
-0.3769445, -0.6329861, -2.311949, 1, 0, 0, 1, 1,
-0.3750431, 0.4513071, 0.418865, 1, 0, 0, 1, 1,
-0.3749872, 1.201817, 0.3028073, 1, 0, 0, 1, 1,
-0.364682, 0.02268764, -1.836429, 1, 0, 0, 1, 1,
-0.3609974, -0.4035325, -2.969465, 0, 0, 0, 1, 1,
-0.3593008, 0.1121516, -1.086631, 0, 0, 0, 1, 1,
-0.3583965, -0.4093331, -1.722667, 0, 0, 0, 1, 1,
-0.3558883, 0.4886174, -0.08491708, 0, 0, 0, 1, 1,
-0.3540503, 0.1042959, -0.7842669, 0, 0, 0, 1, 1,
-0.3524657, 1.386002, -1.471474, 0, 0, 0, 1, 1,
-0.3475235, -0.1614079, -1.646878, 0, 0, 0, 1, 1,
-0.3429813, 0.5328483, 0.2337042, 1, 1, 1, 1, 1,
-0.342676, -0.2700684, -1.827617, 1, 1, 1, 1, 1,
-0.3422465, 0.0864354, -0.5445885, 1, 1, 1, 1, 1,
-0.3333672, 0.5973713, 0.3518928, 1, 1, 1, 1, 1,
-0.3311098, 0.4184455, -0.4046599, 1, 1, 1, 1, 1,
-0.3262518, -1.275561, -1.999376, 1, 1, 1, 1, 1,
-0.3233573, -1.754993, -2.128732, 1, 1, 1, 1, 1,
-0.3230655, 0.2614745, -1.064106, 1, 1, 1, 1, 1,
-0.3171223, -0.6998312, -1.428906, 1, 1, 1, 1, 1,
-0.3154553, -0.8952113, -2.907697, 1, 1, 1, 1, 1,
-0.315447, 0.6789783, -1.987818, 1, 1, 1, 1, 1,
-0.3153846, -1.21377, -2.172122, 1, 1, 1, 1, 1,
-0.3121183, 0.5040103, -0.2921256, 1, 1, 1, 1, 1,
-0.3115672, 0.5036317, 0.079447, 1, 1, 1, 1, 1,
-0.3052878, 1.246226, 0.4937612, 1, 1, 1, 1, 1,
-0.3048655, -0.2891573, -0.8574266, 0, 0, 1, 1, 1,
-0.3015336, -0.6671015, -2.355275, 1, 0, 0, 1, 1,
-0.2998784, -0.978698, -3.154694, 1, 0, 0, 1, 1,
-0.2989673, 0.5311931, -0.3726076, 1, 0, 0, 1, 1,
-0.298484, -0.6253145, -3.590612, 1, 0, 0, 1, 1,
-0.2980946, 0.446453, 1.195562, 1, 0, 0, 1, 1,
-0.2974788, 1.007671, -2.466838, 0, 0, 0, 1, 1,
-0.2962293, -0.710747, -3.297939, 0, 0, 0, 1, 1,
-0.2946452, 0.7831671, 0.6882523, 0, 0, 0, 1, 1,
-0.2939082, -0.3796135, -1.766151, 0, 0, 0, 1, 1,
-0.2848586, 0.8886716, -0.6632355, 0, 0, 0, 1, 1,
-0.2826835, -0.8362991, -3.145348, 0, 0, 0, 1, 1,
-0.2807715, 2.277752, 1.260785, 0, 0, 0, 1, 1,
-0.2758213, -0.912221, -3.485858, 1, 1, 1, 1, 1,
-0.2708833, 1.060372, 0.7594541, 1, 1, 1, 1, 1,
-0.2707457, -0.3210888, -2.254807, 1, 1, 1, 1, 1,
-0.268884, 0.1150884, -3.088558, 1, 1, 1, 1, 1,
-0.2671486, 0.7254314, -1.041391, 1, 1, 1, 1, 1,
-0.2653756, 0.004970099, -0.7585184, 1, 1, 1, 1, 1,
-0.2653752, -1.097971, -3.534363, 1, 1, 1, 1, 1,
-0.2551867, 1.366358, -0.2898585, 1, 1, 1, 1, 1,
-0.254622, -0.8085921, -2.731339, 1, 1, 1, 1, 1,
-0.2463187, -0.8865395, -1.109967, 1, 1, 1, 1, 1,
-0.2450627, -0.6622673, -3.665109, 1, 1, 1, 1, 1,
-0.2445723, 2.389735, 0.610773, 1, 1, 1, 1, 1,
-0.2443702, -0.4607325, -3.262097, 1, 1, 1, 1, 1,
-0.2428372, -0.2227254, -2.245312, 1, 1, 1, 1, 1,
-0.2423006, 0.2310417, -1.231681, 1, 1, 1, 1, 1,
-0.2417617, 0.3827729, -3.172192, 0, 0, 1, 1, 1,
-0.2388924, 0.516452, -0.1899022, 1, 0, 0, 1, 1,
-0.2351726, 0.2411459, -0.1200949, 1, 0, 0, 1, 1,
-0.2316501, -1.907583, -2.708374, 1, 0, 0, 1, 1,
-0.2283282, 1.758821, 0.4057898, 1, 0, 0, 1, 1,
-0.2258432, -1.50446, -5.165926, 1, 0, 0, 1, 1,
-0.2207988, -1.640243, -3.699944, 0, 0, 0, 1, 1,
-0.2199854, 2.427678, -0.163877, 0, 0, 0, 1, 1,
-0.2161854, -1.083889, -2.585646, 0, 0, 0, 1, 1,
-0.2143189, 0.8160386, -2.818609, 0, 0, 0, 1, 1,
-0.2113512, -1.26567, -1.622521, 0, 0, 0, 1, 1,
-0.2097061, -1.322699, -4.396429, 0, 0, 0, 1, 1,
-0.2074991, -0.8304784, -1.721679, 0, 0, 0, 1, 1,
-0.2018152, 0.3962234, -1.039368, 1, 1, 1, 1, 1,
-0.2010096, 0.4894467, -1.72598, 1, 1, 1, 1, 1,
-0.1987782, -4.092475, -3.59207, 1, 1, 1, 1, 1,
-0.1940578, 0.7373519, -1.225751, 1, 1, 1, 1, 1,
-0.1927137, 1.841434, 1.079807, 1, 1, 1, 1, 1,
-0.1914625, -0.1986695, -2.350784, 1, 1, 1, 1, 1,
-0.1886698, -1.266487, -4.574523, 1, 1, 1, 1, 1,
-0.1874344, -0.325975, -3.052217, 1, 1, 1, 1, 1,
-0.1855618, 0.2885559, 1.850217, 1, 1, 1, 1, 1,
-0.1843736, 0.3168612, -1.186633, 1, 1, 1, 1, 1,
-0.1809891, 0.1465526, -0.3292881, 1, 1, 1, 1, 1,
-0.1794994, -1.090957, -2.470863, 1, 1, 1, 1, 1,
-0.1780592, -1.335323, -3.708116, 1, 1, 1, 1, 1,
-0.1759691, 0.1893998, -1.109259, 1, 1, 1, 1, 1,
-0.1755161, 2.373681, 0.3347717, 1, 1, 1, 1, 1,
-0.173926, 0.4145909, 0.2556545, 0, 0, 1, 1, 1,
-0.1720774, -0.6982041, -2.950892, 1, 0, 0, 1, 1,
-0.1705239, -1.165964, -2.646232, 1, 0, 0, 1, 1,
-0.1705047, 0.2071706, -1.643546, 1, 0, 0, 1, 1,
-0.1697725, -0.7505001, -1.719637, 1, 0, 0, 1, 1,
-0.1680359, -0.3636895, -3.122216, 1, 0, 0, 1, 1,
-0.1656922, -0.2057431, -1.308673, 0, 0, 0, 1, 1,
-0.1653637, -0.7040825, -3.735527, 0, 0, 0, 1, 1,
-0.1646587, -0.4499621, -2.19244, 0, 0, 0, 1, 1,
-0.1632274, -1.697012, -3.651087, 0, 0, 0, 1, 1,
-0.1627556, -3.124852, -1.5527, 0, 0, 0, 1, 1,
-0.1584845, -0.3503728, -3.685675, 0, 0, 0, 1, 1,
-0.153498, 2.104738, 0.6288278, 0, 0, 0, 1, 1,
-0.1492377, -1.019777, -2.688176, 1, 1, 1, 1, 1,
-0.1480148, 0.09246245, -0.5018276, 1, 1, 1, 1, 1,
-0.1465985, -0.4457542, -3.178758, 1, 1, 1, 1, 1,
-0.1435644, -1.513111, -1.648255, 1, 1, 1, 1, 1,
-0.143394, -0.8388942, -3.11176, 1, 1, 1, 1, 1,
-0.1388982, 1.696098, -1.251684, 1, 1, 1, 1, 1,
-0.1356579, 1.366612, -0.7586436, 1, 1, 1, 1, 1,
-0.1339234, 2.63131, 1.927082, 1, 1, 1, 1, 1,
-0.1326638, 0.7679659, 1.017063, 1, 1, 1, 1, 1,
-0.1310361, -1.111144, -4.773306, 1, 1, 1, 1, 1,
-0.1306885, -1.780536, -4.259492, 1, 1, 1, 1, 1,
-0.1265405, -0.4996358, -3.774941, 1, 1, 1, 1, 1,
-0.1262557, -0.5014293, -2.33667, 1, 1, 1, 1, 1,
-0.1222344, 0.05542691, -2.557351, 1, 1, 1, 1, 1,
-0.1188403, -0.8287714, -7.023935, 1, 1, 1, 1, 1,
-0.1181439, -0.9210273, -2.531097, 0, 0, 1, 1, 1,
-0.1175292, 0.23076, -0.5657526, 1, 0, 0, 1, 1,
-0.1174462, 0.9027251, -0.2876267, 1, 0, 0, 1, 1,
-0.11596, 0.4415925, 0.6495403, 1, 0, 0, 1, 1,
-0.1135036, -1.206858, -4.579422, 1, 0, 0, 1, 1,
-0.1131169, 1.634636, 0.5354528, 1, 0, 0, 1, 1,
-0.1101109, 0.09441193, -0.7913176, 0, 0, 0, 1, 1,
-0.1094705, 1.144742, -0.08971899, 0, 0, 0, 1, 1,
-0.1065789, 0.4822682, 0.005787489, 0, 0, 0, 1, 1,
-0.1065749, 1.826902, 0.9290471, 0, 0, 0, 1, 1,
-0.09766325, -0.7870234, -2.502881, 0, 0, 0, 1, 1,
-0.09022168, -0.3014577, -2.841171, 0, 0, 0, 1, 1,
-0.08861779, -0.373382, -3.536349, 0, 0, 0, 1, 1,
-0.08413552, -0.3855263, -2.685237, 1, 1, 1, 1, 1,
-0.08390698, 1.468331, -0.3386077, 1, 1, 1, 1, 1,
-0.08214304, -2.091964, -3.225105, 1, 1, 1, 1, 1,
-0.08032758, 0.9030196, 0.01016978, 1, 1, 1, 1, 1,
-0.0751068, -0.5297263, -3.113315, 1, 1, 1, 1, 1,
-0.07404752, -0.6524266, -3.052776, 1, 1, 1, 1, 1,
-0.07333828, -1.244246, -3.313699, 1, 1, 1, 1, 1,
-0.07319226, -0.3595704, -2.924858, 1, 1, 1, 1, 1,
-0.06481051, 2.193866, 0.7275344, 1, 1, 1, 1, 1,
-0.06457219, 1.844427, 0.1700669, 1, 1, 1, 1, 1,
-0.05056954, 1.656121, -1.20223, 1, 1, 1, 1, 1,
-0.04935893, 2.28319, -0.374634, 1, 1, 1, 1, 1,
-0.04782401, 0.8513498, -0.1270428, 1, 1, 1, 1, 1,
-0.04770878, -0.1813298, -2.506839, 1, 1, 1, 1, 1,
-0.04714425, -1.362674, -4.131307, 1, 1, 1, 1, 1,
-0.04278632, -0.278476, -2.993403, 0, 0, 1, 1, 1,
-0.04140538, -0.6258161, -3.50561, 1, 0, 0, 1, 1,
-0.0411467, -1.496285, -3.038664, 1, 0, 0, 1, 1,
-0.03768752, -0.01798712, -1.475944, 1, 0, 0, 1, 1,
-0.03359999, 0.4946586, 1.426258, 1, 0, 0, 1, 1,
-0.03162025, -0.1247939, -2.708496, 1, 0, 0, 1, 1,
-0.03103511, -1.32374, -2.805054, 0, 0, 0, 1, 1,
-0.0304228, 1.120521, 0.5343661, 0, 0, 0, 1, 1,
-0.03039888, -1.229962, -2.41734, 0, 0, 0, 1, 1,
-0.02787546, -0.04032701, -2.096114, 0, 0, 0, 1, 1,
-0.02762425, 0.5760505, -0.7687366, 0, 0, 0, 1, 1,
-0.02488664, 1.453584, -0.1774084, 0, 0, 0, 1, 1,
-0.02363513, -1.443435, -3.327564, 0, 0, 0, 1, 1,
-0.02256117, -0.5375924, -2.658307, 1, 1, 1, 1, 1,
-0.02249152, 0.01417194, -0.8117403, 1, 1, 1, 1, 1,
-0.02070748, 1.396311, 0.8011534, 1, 1, 1, 1, 1,
-0.01292424, -1.527034, -2.110197, 1, 1, 1, 1, 1,
-0.007296993, -0.2011956, -3.310309, 1, 1, 1, 1, 1,
-0.004024417, -0.3672056, -3.625035, 1, 1, 1, 1, 1,
-0.00389643, -0.3303995, -2.113206, 1, 1, 1, 1, 1,
-0.003723604, 1.052555, -1.809219, 1, 1, 1, 1, 1,
0.0006632874, -1.05886, 3.092862, 1, 1, 1, 1, 1,
0.0039697, -1.207508, 1.805771, 1, 1, 1, 1, 1,
0.005720176, -0.3188582, 2.678072, 1, 1, 1, 1, 1,
0.01059046, 1.024963, -2.878366, 1, 1, 1, 1, 1,
0.01191787, -1.3054, 3.037602, 1, 1, 1, 1, 1,
0.02389036, -0.3202907, 2.744614, 1, 1, 1, 1, 1,
0.03124837, 0.9041686, -0.8497084, 1, 1, 1, 1, 1,
0.0314693, -0.158378, 2.783551, 0, 0, 1, 1, 1,
0.03240605, 1.034943, 0.06985161, 1, 0, 0, 1, 1,
0.03385387, 1.04192, -0.9129674, 1, 0, 0, 1, 1,
0.03885163, 0.8626952, 0.2299103, 1, 0, 0, 1, 1,
0.03967253, -0.2133426, 1.931122, 1, 0, 0, 1, 1,
0.04049566, 2.243157, 1.302888, 1, 0, 0, 1, 1,
0.0474356, 0.4691677, 0.0428087, 0, 0, 0, 1, 1,
0.04835507, -0.3551423, 4.759708, 0, 0, 0, 1, 1,
0.0508904, 0.5555167, -1.526299, 0, 0, 0, 1, 1,
0.05189679, -0.1610524, 0.2902646, 0, 0, 0, 1, 1,
0.0554419, 2.234375, -0.2837913, 0, 0, 0, 1, 1,
0.05615699, -0.7816282, 0.541973, 0, 0, 0, 1, 1,
0.05713442, -0.4775851, 3.073039, 0, 0, 0, 1, 1,
0.0582488, -0.8485948, 2.897574, 1, 1, 1, 1, 1,
0.05857764, 0.1186236, 0.6334194, 1, 1, 1, 1, 1,
0.05870762, 0.7904458, -0.6449515, 1, 1, 1, 1, 1,
0.06107264, 0.5037296, 0.3706295, 1, 1, 1, 1, 1,
0.06231171, 1.062698, 0.2644607, 1, 1, 1, 1, 1,
0.06424234, 0.06429024, 0.5304289, 1, 1, 1, 1, 1,
0.06670883, -0.5067905, 3.093672, 1, 1, 1, 1, 1,
0.06805374, -1.45304, 2.031103, 1, 1, 1, 1, 1,
0.06885032, -0.9187617, 3.946455, 1, 1, 1, 1, 1,
0.07098107, -1.6537, 2.788454, 1, 1, 1, 1, 1,
0.07171059, 0.09186167, 0.04860004, 1, 1, 1, 1, 1,
0.07337902, 0.2844594, 1.013021, 1, 1, 1, 1, 1,
0.07430547, 0.2678561, 1.202825, 1, 1, 1, 1, 1,
0.07500017, -0.08861309, 2.253832, 1, 1, 1, 1, 1,
0.07962681, -1.56567, 3.073451, 1, 1, 1, 1, 1,
0.08008396, -0.1267272, 3.475783, 0, 0, 1, 1, 1,
0.08034066, -0.3173828, 3.080406, 1, 0, 0, 1, 1,
0.08563642, 0.543382, 0.05914776, 1, 0, 0, 1, 1,
0.09712083, -0.5367141, 2.850554, 1, 0, 0, 1, 1,
0.09789397, -1.193282, 3.381323, 1, 0, 0, 1, 1,
0.1037946, 0.07192469, 2.188336, 1, 0, 0, 1, 1,
0.1059624, -0.4145569, 2.226523, 0, 0, 0, 1, 1,
0.1080958, 0.4758442, 0.830999, 0, 0, 0, 1, 1,
0.1106149, -1.296334, 1.628714, 0, 0, 0, 1, 1,
0.1108675, -0.1920143, 1.80169, 0, 0, 0, 1, 1,
0.1152273, -0.8514129, 3.027172, 0, 0, 0, 1, 1,
0.1155302, 0.8123874, 0.2863226, 0, 0, 0, 1, 1,
0.1196407, 1.112494, 0.3161952, 0, 0, 0, 1, 1,
0.1237339, 0.8206722, 1.21507, 1, 1, 1, 1, 1,
0.1273722, 1.571948, 0.3339324, 1, 1, 1, 1, 1,
0.128263, 1.395606, 2.538854, 1, 1, 1, 1, 1,
0.1326966, -1.23913, 2.955023, 1, 1, 1, 1, 1,
0.1356893, 0.7122006, 0.9504534, 1, 1, 1, 1, 1,
0.136983, 2.191023, -0.4200448, 1, 1, 1, 1, 1,
0.1384573, 0.8132941, 0.8119888, 1, 1, 1, 1, 1,
0.1393728, 0.7602354, 0.09931812, 1, 1, 1, 1, 1,
0.1396761, -1.041684, 4.730183, 1, 1, 1, 1, 1,
0.1421592, -0.9471673, 2.941198, 1, 1, 1, 1, 1,
0.1441908, 1.823287, 0.5156079, 1, 1, 1, 1, 1,
0.1447677, 1.017208, 0.08976295, 1, 1, 1, 1, 1,
0.153238, 1.854545, -1.031361, 1, 1, 1, 1, 1,
0.1626491, -1.040004, 3.792387, 1, 1, 1, 1, 1,
0.1647695, -0.8165899, 2.199472, 1, 1, 1, 1, 1,
0.1706803, 0.875805, 1.042216, 0, 0, 1, 1, 1,
0.1707152, -0.1311172, 2.039428, 1, 0, 0, 1, 1,
0.1748507, 0.6526375, 0.4404838, 1, 0, 0, 1, 1,
0.1807503, 0.368848, 0.2802476, 1, 0, 0, 1, 1,
0.1826693, -0.5460747, 2.538123, 1, 0, 0, 1, 1,
0.1851068, 2.012337, 2.458468, 1, 0, 0, 1, 1,
0.1865143, 1.168663, 1.431991, 0, 0, 0, 1, 1,
0.1875771, 0.818437, -1.11989, 0, 0, 0, 1, 1,
0.1913536, -0.4263639, 1.573979, 0, 0, 0, 1, 1,
0.1931182, 0.7418417, 0.8138499, 0, 0, 0, 1, 1,
0.1946656, 0.8159441, -0.9336032, 0, 0, 0, 1, 1,
0.1973843, 0.6861827, 0.7409331, 0, 0, 0, 1, 1,
0.2019694, -1.261113, 1.523551, 0, 0, 0, 1, 1,
0.2036877, 0.9238248, 0.8259349, 1, 1, 1, 1, 1,
0.2084465, -0.7362523, 2.773687, 1, 1, 1, 1, 1,
0.2139584, 1.090743, -1.052982, 1, 1, 1, 1, 1,
0.2249673, -0.7435796, 3.336409, 1, 1, 1, 1, 1,
0.2253052, -0.5247329, 3.780401, 1, 1, 1, 1, 1,
0.2296269, 0.8340026, 0.9236268, 1, 1, 1, 1, 1,
0.2302901, 0.7471063, -0.7814429, 1, 1, 1, 1, 1,
0.2325176, 0.7387828, -0.3652379, 1, 1, 1, 1, 1,
0.2325935, 0.4177902, 2.007084, 1, 1, 1, 1, 1,
0.2328056, -0.6767991, 4.061211, 1, 1, 1, 1, 1,
0.2348265, 3.526108, -0.3118064, 1, 1, 1, 1, 1,
0.2370027, 0.1182295, 0.41549, 1, 1, 1, 1, 1,
0.2388229, 0.894054, -0.4124916, 1, 1, 1, 1, 1,
0.2427886, -0.3399836, 1.66333, 1, 1, 1, 1, 1,
0.249265, -1.665359, 5.019035, 1, 1, 1, 1, 1,
0.2500332, 0.005960023, 1.088472, 0, 0, 1, 1, 1,
0.25277, 1.125991, 1.122089, 1, 0, 0, 1, 1,
0.2583443, 0.5206007, 0.6020624, 1, 0, 0, 1, 1,
0.2621617, -0.7198336, 3.575549, 1, 0, 0, 1, 1,
0.2654185, 0.4009567, 0.7912965, 1, 0, 0, 1, 1,
0.2686826, 1.280535, 0.2363297, 1, 0, 0, 1, 1,
0.2712778, 1.122813, -0.08212195, 0, 0, 0, 1, 1,
0.2779094, 0.5709372, -0.8987488, 0, 0, 0, 1, 1,
0.2787209, 0.1200203, 2.707302, 0, 0, 0, 1, 1,
0.2790502, 1.881276, 1.447535, 0, 0, 0, 1, 1,
0.2833901, 0.2523829, -0.9453277, 0, 0, 0, 1, 1,
0.2887146, -1.283761, 2.769159, 0, 0, 0, 1, 1,
0.2897931, 0.2831532, 0.4955949, 0, 0, 0, 1, 1,
0.2947853, -1.265344, 3.9882, 1, 1, 1, 1, 1,
0.2964363, -1.741936, 4.604785, 1, 1, 1, 1, 1,
0.2983187, 0.00548777, 1.590049, 1, 1, 1, 1, 1,
0.2995898, -0.8702007, 2.427165, 1, 1, 1, 1, 1,
0.3007268, 0.7355688, -0.4591625, 1, 1, 1, 1, 1,
0.3012219, -0.3916399, 2.831462, 1, 1, 1, 1, 1,
0.3056774, 0.9287776, -0.1280375, 1, 1, 1, 1, 1,
0.3087479, -0.6212764, 3.199786, 1, 1, 1, 1, 1,
0.3103375, 0.5529389, -1.068525, 1, 1, 1, 1, 1,
0.310693, 0.05077076, 1.384545, 1, 1, 1, 1, 1,
0.3157175, -1.45621, 3.085023, 1, 1, 1, 1, 1,
0.3193688, -1.247299, 4.140341, 1, 1, 1, 1, 1,
0.3202347, -0.944093, 3.780705, 1, 1, 1, 1, 1,
0.3210301, 1.164286, 1.322784, 1, 1, 1, 1, 1,
0.3212313, -1.011433, 2.370765, 1, 1, 1, 1, 1,
0.3218923, -0.8526902, 3.182003, 0, 0, 1, 1, 1,
0.3245266, 1.244903, 0.2914805, 1, 0, 0, 1, 1,
0.3271619, 0.630325, -0.5063589, 1, 0, 0, 1, 1,
0.3301867, 1.987285, 1.009488, 1, 0, 0, 1, 1,
0.33026, 0.07487984, 1.743784, 1, 0, 0, 1, 1,
0.3328064, 0.9456235, 1.185134, 1, 0, 0, 1, 1,
0.3346424, -0.2109087, 1.154791, 0, 0, 0, 1, 1,
0.336286, -1.835932, 4.298676, 0, 0, 0, 1, 1,
0.3389258, -1.81993, 4.516006, 0, 0, 0, 1, 1,
0.340677, 0.2936852, 0.3170428, 0, 0, 0, 1, 1,
0.3443159, 1.495585, -0.2734103, 0, 0, 0, 1, 1,
0.348763, 0.2157209, 0.3157271, 0, 0, 0, 1, 1,
0.3500373, -0.4625892, 1.879617, 0, 0, 0, 1, 1,
0.3512989, 0.103113, 0.3953176, 1, 1, 1, 1, 1,
0.3519088, -1.274983, 3.950492, 1, 1, 1, 1, 1,
0.352174, -2.063142, 2.156712, 1, 1, 1, 1, 1,
0.356794, 1.42875, 0.3728427, 1, 1, 1, 1, 1,
0.3572408, 1.243448, 0.9370192, 1, 1, 1, 1, 1,
0.3572469, 0.4058202, -1.003336, 1, 1, 1, 1, 1,
0.3575071, 1.054591, -0.6281617, 1, 1, 1, 1, 1,
0.3577078, 1.157513, -0.540072, 1, 1, 1, 1, 1,
0.3582902, 0.05737034, 1.480929, 1, 1, 1, 1, 1,
0.3588746, 1.021979, 2.027332, 1, 1, 1, 1, 1,
0.360946, 0.01172317, 0.4008264, 1, 1, 1, 1, 1,
0.363528, 1.50207, -2.460968, 1, 1, 1, 1, 1,
0.3645956, -0.1527556, 0.9527653, 1, 1, 1, 1, 1,
0.3663035, 1.110962, 0.3334434, 1, 1, 1, 1, 1,
0.3713288, -0.2520433, 3.534891, 1, 1, 1, 1, 1,
0.3772838, 0.1818787, 0.9144329, 0, 0, 1, 1, 1,
0.3782193, 0.473813, 1.172741, 1, 0, 0, 1, 1,
0.3794161, 0.5687642, 0.4087972, 1, 0, 0, 1, 1,
0.3807066, 0.227732, -0.4352546, 1, 0, 0, 1, 1,
0.3821044, -0.5848698, 4.160997, 1, 0, 0, 1, 1,
0.3825179, 0.4344793, 1.929956, 1, 0, 0, 1, 1,
0.3826369, -0.8726683, 1.628121, 0, 0, 0, 1, 1,
0.3837655, -1.240555, 6.397436, 0, 0, 0, 1, 1,
0.3864472, 0.06550686, 1.140797, 0, 0, 0, 1, 1,
0.3939429, 0.7577446, 0.4243381, 0, 0, 0, 1, 1,
0.3944482, -0.360862, 1.355589, 0, 0, 0, 1, 1,
0.3961611, 0.2843297, -0.9196944, 0, 0, 0, 1, 1,
0.4003448, 1.196622, -0.7022469, 0, 0, 0, 1, 1,
0.4047199, 1.18524, 0.6314467, 1, 1, 1, 1, 1,
0.4102085, -0.2551169, 0.968552, 1, 1, 1, 1, 1,
0.4117247, -0.6275107, 2.899513, 1, 1, 1, 1, 1,
0.4161945, -0.6605194, 3.148855, 1, 1, 1, 1, 1,
0.4162595, 1.697989, 0.08179121, 1, 1, 1, 1, 1,
0.4178462, 0.53598, 0.7785921, 1, 1, 1, 1, 1,
0.4182979, -1.35583, 3.729312, 1, 1, 1, 1, 1,
0.4214551, 1.723234, -0.3712459, 1, 1, 1, 1, 1,
0.4218703, -1.969312, 3.463513, 1, 1, 1, 1, 1,
0.4244177, -0.02515889, 2.649873, 1, 1, 1, 1, 1,
0.4289191, 0.2326716, 2.035216, 1, 1, 1, 1, 1,
0.4296768, -0.7367054, 3.162065, 1, 1, 1, 1, 1,
0.4311861, -1.43695, 4.893682, 1, 1, 1, 1, 1,
0.4333651, -0.3444705, 3.368153, 1, 1, 1, 1, 1,
0.4389832, -1.037747, 2.446886, 1, 1, 1, 1, 1,
0.4407842, -1.622921, 2.779464, 0, 0, 1, 1, 1,
0.4415534, 0.3698026, 0.235912, 1, 0, 0, 1, 1,
0.449355, 0.403351, 1.508413, 1, 0, 0, 1, 1,
0.4521479, -1.318754, 2.856132, 1, 0, 0, 1, 1,
0.4542751, -0.376599, 1.861801, 1, 0, 0, 1, 1,
0.4563676, -0.9515975, 3.222946, 1, 0, 0, 1, 1,
0.4586037, -2.591403, 4.11791, 0, 0, 0, 1, 1,
0.4617704, 1.498227, -0.65012, 0, 0, 0, 1, 1,
0.4665364, -0.1259685, 1.559808, 0, 0, 0, 1, 1,
0.4680927, 0.4280642, -0.5867192, 0, 0, 0, 1, 1,
0.4700557, 1.136167, 0.1391348, 0, 0, 0, 1, 1,
0.4702459, 2.523869, 1.320134, 0, 0, 0, 1, 1,
0.4787292, 1.191201, 0.1383529, 0, 0, 0, 1, 1,
0.4811654, -1.250944, 1.964547, 1, 1, 1, 1, 1,
0.4843133, 0.07082853, 0.4828768, 1, 1, 1, 1, 1,
0.4876489, -0.672092, 2.3016, 1, 1, 1, 1, 1,
0.4908566, 1.529451, -0.08078066, 1, 1, 1, 1, 1,
0.4933103, -0.5142826, 1.422502, 1, 1, 1, 1, 1,
0.4962725, -0.569602, 1.829876, 1, 1, 1, 1, 1,
0.4993384, -0.3546649, 0.07953533, 1, 1, 1, 1, 1,
0.5051399, -0.2903369, 3.10553, 1, 1, 1, 1, 1,
0.506315, 0.839942, 0.35212, 1, 1, 1, 1, 1,
0.5064617, 0.08593211, 2.802916, 1, 1, 1, 1, 1,
0.508249, 1.805037, 1.80647, 1, 1, 1, 1, 1,
0.5090824, 1.886785, 2.065225, 1, 1, 1, 1, 1,
0.5115421, 0.01090529, 1.51589, 1, 1, 1, 1, 1,
0.5169705, 2.045526, 0.6927585, 1, 1, 1, 1, 1,
0.5183359, 0.3748179, 1.302326, 1, 1, 1, 1, 1,
0.5265312, -0.7270805, 1.161072, 0, 0, 1, 1, 1,
0.5270354, -1.328803, 0.6938207, 1, 0, 0, 1, 1,
0.5283889, 0.02130012, 1.788594, 1, 0, 0, 1, 1,
0.5285631, -1.347795, 1.917902, 1, 0, 0, 1, 1,
0.5325302, 0.08700454, -1.171704, 1, 0, 0, 1, 1,
0.5331505, 0.1080776, 1.444996, 1, 0, 0, 1, 1,
0.5356732, -0.9674291, 4.264486, 0, 0, 0, 1, 1,
0.5371613, 1.445757, -1.566194, 0, 0, 0, 1, 1,
0.5374456, -1.069582, 2.211456, 0, 0, 0, 1, 1,
0.5401207, -0.01601109, 3.586864, 0, 0, 0, 1, 1,
0.5403408, -0.297021, 2.758346, 0, 0, 0, 1, 1,
0.5451823, -1.997175, 3.7272, 0, 0, 0, 1, 1,
0.5509614, -0.07501582, 1.811833, 0, 0, 0, 1, 1,
0.5537993, -0.557899, 2.232465, 1, 1, 1, 1, 1,
0.5570566, 2.555522, -0.03061958, 1, 1, 1, 1, 1,
0.5579454, 1.558923, 0.4865165, 1, 1, 1, 1, 1,
0.5591645, -0.7654208, 2.576004, 1, 1, 1, 1, 1,
0.562494, -1.344615, -0.3575022, 1, 1, 1, 1, 1,
0.5650082, 0.4893959, -0.856851, 1, 1, 1, 1, 1,
0.5672309, 0.2766653, -0.1776567, 1, 1, 1, 1, 1,
0.568127, 0.8535402, 1.181746, 1, 1, 1, 1, 1,
0.5703114, -0.5507106, 0.9224362, 1, 1, 1, 1, 1,
0.5714818, -0.8009865, 3.589783, 1, 1, 1, 1, 1,
0.5734857, 1.186582, -0.07850391, 1, 1, 1, 1, 1,
0.5748914, 0.476121, 1.067181, 1, 1, 1, 1, 1,
0.5754917, 0.6320391, 0.1007214, 1, 1, 1, 1, 1,
0.5779282, 0.3886221, 1.474589, 1, 1, 1, 1, 1,
0.5779382, -0.9706903, 2.909252, 1, 1, 1, 1, 1,
0.582693, 0.7691833, 0.8441598, 0, 0, 1, 1, 1,
0.5845758, 1.174524, -0.1313719, 1, 0, 0, 1, 1,
0.591103, -1.666536, 2.123967, 1, 0, 0, 1, 1,
0.5934883, -1.137384, 2.038484, 1, 0, 0, 1, 1,
0.5957885, -1.281737, 1.757999, 1, 0, 0, 1, 1,
0.5961188, -0.1405011, 1.532733, 1, 0, 0, 1, 1,
0.5987768, -1.557471, 2.882323, 0, 0, 0, 1, 1,
0.5989439, -0.08515889, 3.107584, 0, 0, 0, 1, 1,
0.6011656, 0.07316487, 1.245999, 0, 0, 0, 1, 1,
0.6025043, -2.109321, 1.884057, 0, 0, 0, 1, 1,
0.6027135, 0.5528922, 2.119049, 0, 0, 0, 1, 1,
0.6038477, 0.8305913, -1.155042, 0, 0, 0, 1, 1,
0.6039103, 0.9805968, 1.543549, 0, 0, 0, 1, 1,
0.604008, 1.636239, 0.305676, 1, 1, 1, 1, 1,
0.6085425, -0.707689, 3.857584, 1, 1, 1, 1, 1,
0.6091221, -0.3621942, 1.994631, 1, 1, 1, 1, 1,
0.6122779, 2.107574, 1.97074, 1, 1, 1, 1, 1,
0.6123894, 0.2145056, -0.5663412, 1, 1, 1, 1, 1,
0.6164579, -0.4494681, 2.117141, 1, 1, 1, 1, 1,
0.6225072, -0.08808617, -2.241654, 1, 1, 1, 1, 1,
0.6230649, -1.180266, 2.823088, 1, 1, 1, 1, 1,
0.6243129, -0.02437324, 3.968196, 1, 1, 1, 1, 1,
0.6244891, -1.734045, 2.809329, 1, 1, 1, 1, 1,
0.6253743, 1.225663, 0.82546, 1, 1, 1, 1, 1,
0.6278815, -0.5329434, 4.087451, 1, 1, 1, 1, 1,
0.6368479, -1.027176, 3.799997, 1, 1, 1, 1, 1,
0.6376746, -1.550715, 3.161687, 1, 1, 1, 1, 1,
0.6438785, -0.7765973, 3.72056, 1, 1, 1, 1, 1,
0.6455544, -2.200936, 2.548098, 0, 0, 1, 1, 1,
0.6590716, 0.1852059, 1.795937, 1, 0, 0, 1, 1,
0.6634672, -1.820699, 2.901645, 1, 0, 0, 1, 1,
0.6672193, -1.146595, 3.024646, 1, 0, 0, 1, 1,
0.6762064, -1.460785, 2.531913, 1, 0, 0, 1, 1,
0.6800743, 0.9301948, 0.7622924, 1, 0, 0, 1, 1,
0.6804543, -0.362031, 1.732788, 0, 0, 0, 1, 1,
0.6907175, 1.314573, 1.01367, 0, 0, 0, 1, 1,
0.6959272, 1.167299, 0.5177568, 0, 0, 0, 1, 1,
0.6969568, 0.7604915, 0.5256779, 0, 0, 0, 1, 1,
0.7013018, -1.160453, 2.001592, 0, 0, 0, 1, 1,
0.7036751, -0.6579187, 2.870103, 0, 0, 0, 1, 1,
0.7105888, -0.6903479, -0.4685983, 0, 0, 0, 1, 1,
0.7179203, -0.7059154, 2.646939, 1, 1, 1, 1, 1,
0.7216883, -0.5667691, 2.500798, 1, 1, 1, 1, 1,
0.7233652, -0.0753544, 2.54336, 1, 1, 1, 1, 1,
0.7246402, -0.4976819, 4.534116, 1, 1, 1, 1, 1,
0.7256913, 0.9553086, 1.284009, 1, 1, 1, 1, 1,
0.7313129, -0.9019729, 2.843222, 1, 1, 1, 1, 1,
0.7403665, 0.7976046, 1.319734, 1, 1, 1, 1, 1,
0.7429515, -0.6619474, 1.108623, 1, 1, 1, 1, 1,
0.7450515, 0.6998532, 2.10401, 1, 1, 1, 1, 1,
0.7455192, 0.8701053, 0.6004936, 1, 1, 1, 1, 1,
0.7517377, -0.07548434, 1.722401, 1, 1, 1, 1, 1,
0.7545377, -0.6780058, 3.401918, 1, 1, 1, 1, 1,
0.7622429, -0.002954309, 2.418022, 1, 1, 1, 1, 1,
0.7740152, 0.2913342, -0.1811493, 1, 1, 1, 1, 1,
0.7866399, -0.1497096, 2.728985, 1, 1, 1, 1, 1,
0.7875947, 2.409793, 0.6109946, 0, 0, 1, 1, 1,
0.7884722, -0.3762208, 2.383021, 1, 0, 0, 1, 1,
0.8082684, 1.54559, 1.023913, 1, 0, 0, 1, 1,
0.8159205, 0.8246654, 1.657614, 1, 0, 0, 1, 1,
0.818157, -0.1220234, 1.25351, 1, 0, 0, 1, 1,
0.8227814, -0.5608741, 2.235718, 1, 0, 0, 1, 1,
0.8254156, -0.3118031, 3.289515, 0, 0, 0, 1, 1,
0.8270143, -1.013136, 3.028099, 0, 0, 0, 1, 1,
0.8297907, 0.7496977, 2.52327, 0, 0, 0, 1, 1,
0.8418886, 0.2964215, 1.669749, 0, 0, 0, 1, 1,
0.842067, 0.4529164, 2.136606, 0, 0, 0, 1, 1,
0.8465942, -0.05658976, 0.5756248, 0, 0, 0, 1, 1,
0.8522647, -0.8282129, 1.774741, 0, 0, 0, 1, 1,
0.8528592, 0.361055, 3.230212, 1, 1, 1, 1, 1,
0.8548321, -0.1031816, 1.888857, 1, 1, 1, 1, 1,
0.8550553, 0.06439807, -0.5851993, 1, 1, 1, 1, 1,
0.860877, -1.896992, 2.937319, 1, 1, 1, 1, 1,
0.8632215, 2.153534, 1.031252, 1, 1, 1, 1, 1,
0.866093, 0.6664476, 0.4368967, 1, 1, 1, 1, 1,
0.8672745, -0.5243223, 3.036026, 1, 1, 1, 1, 1,
0.8691074, -1.386997, 1.90561, 1, 1, 1, 1, 1,
0.8727594, 1.461262, 1.158941, 1, 1, 1, 1, 1,
0.8733635, 0.6407613, -0.007544864, 1, 1, 1, 1, 1,
0.8747241, -0.8201854, 2.020969, 1, 1, 1, 1, 1,
0.8755302, 0.6361586, 3.76319, 1, 1, 1, 1, 1,
0.8790541, 2.349079, 0.7460428, 1, 1, 1, 1, 1,
0.8835642, 0.1890535, 0.6827939, 1, 1, 1, 1, 1,
0.8882315, -0.09098227, 0.7907372, 1, 1, 1, 1, 1,
0.9055889, -1.775833, 3.224327, 0, 0, 1, 1, 1,
0.907003, -1.609856, 1.831673, 1, 0, 0, 1, 1,
0.9099047, 0.7444266, 2.477317, 1, 0, 0, 1, 1,
0.910866, -0.7761593, 1.283008, 1, 0, 0, 1, 1,
0.9116264, -0.147947, 1.422492, 1, 0, 0, 1, 1,
0.9165899, 1.477358, 0.4055271, 1, 0, 0, 1, 1,
0.9222517, -2.683372, 1.831106, 0, 0, 0, 1, 1,
0.9277201, 0.7214609, 1.520358, 0, 0, 0, 1, 1,
0.9292545, -0.7520944, 3.208264, 0, 0, 0, 1, 1,
0.931643, -0.3844575, -0.142973, 0, 0, 0, 1, 1,
0.9340714, -0.06420751, 0.9592566, 0, 0, 0, 1, 1,
0.9375568, 0.2741983, 1.326084, 0, 0, 0, 1, 1,
0.9376355, 1.210154, 0.6102377, 0, 0, 0, 1, 1,
0.9440042, 0.03605298, 2.511987, 1, 1, 1, 1, 1,
0.9477667, 1.685959, 0.3566025, 1, 1, 1, 1, 1,
0.9483106, -0.1503582, 2.365942, 1, 1, 1, 1, 1,
0.9496032, -1.323285, 2.74888, 1, 1, 1, 1, 1,
0.9521844, 0.566096, 0.3553491, 1, 1, 1, 1, 1,
0.9555185, -2.832935, 3.149908, 1, 1, 1, 1, 1,
0.9571885, -0.03938685, 3.0185, 1, 1, 1, 1, 1,
0.9620252, -0.8832232, 3.305013, 1, 1, 1, 1, 1,
0.9671779, -0.2004584, 2.23443, 1, 1, 1, 1, 1,
0.9689027, 0.5892454, 0.5067781, 1, 1, 1, 1, 1,
0.9707377, 0.8693012, 0.7076539, 1, 1, 1, 1, 1,
0.9771551, 1.092722, 0.3513611, 1, 1, 1, 1, 1,
0.9838653, -0.03834361, 1.759178, 1, 1, 1, 1, 1,
0.9882213, 0.72675, 1.978441, 1, 1, 1, 1, 1,
0.9995459, 0.8447401, 2.254014, 1, 1, 1, 1, 1,
1.008479, -1.074584, 2.298826, 0, 0, 1, 1, 1,
1.013414, 1.271852, 1.021715, 1, 0, 0, 1, 1,
1.013745, 0.2130953, -0.9483537, 1, 0, 0, 1, 1,
1.020785, -0.4661118, 3.072502, 1, 0, 0, 1, 1,
1.028263, 2.985503, 0.6441745, 1, 0, 0, 1, 1,
1.038517, -1.088651, 0.9654928, 1, 0, 0, 1, 1,
1.053231, 1.647969, 0.7556689, 0, 0, 0, 1, 1,
1.061948, 0.6731346, 1.331469, 0, 0, 0, 1, 1,
1.067625, -0.1370709, 3.671522, 0, 0, 0, 1, 1,
1.071291, 0.2641439, 1.175122, 0, 0, 0, 1, 1,
1.073167, 0.420433, 1.368587, 0, 0, 0, 1, 1,
1.076126, -0.426993, 1.514645, 0, 0, 0, 1, 1,
1.076133, 0.7175083, 0.9042522, 0, 0, 0, 1, 1,
1.07663, 0.1088989, 0.1427046, 1, 1, 1, 1, 1,
1.079238, 0.4504824, 1.202777, 1, 1, 1, 1, 1,
1.08072, -0.5734264, 1.999269, 1, 1, 1, 1, 1,
1.084938, -0.5155509, 2.939839, 1, 1, 1, 1, 1,
1.0952, -0.2099698, 1.45527, 1, 1, 1, 1, 1,
1.100901, 0.378783, 0.3642656, 1, 1, 1, 1, 1,
1.104972, 0.0378198, 0.8788651, 1, 1, 1, 1, 1,
1.10935, 0.555878, -0.575103, 1, 1, 1, 1, 1,
1.118181, -0.352157, 2.379375, 1, 1, 1, 1, 1,
1.143722, 0.7331336, -0.6935681, 1, 1, 1, 1, 1,
1.146654, 0.3536882, 0.211799, 1, 1, 1, 1, 1,
1.152226, 0.5618381, 2.92502, 1, 1, 1, 1, 1,
1.155685, 0.810246, 0.459798, 1, 1, 1, 1, 1,
1.160792, 2.045486, -0.1593156, 1, 1, 1, 1, 1,
1.165432, -1.289795, 2.634919, 1, 1, 1, 1, 1,
1.174126, 0.9529966, -0.1794982, 0, 0, 1, 1, 1,
1.179666, 0.737951, 0.2859809, 1, 0, 0, 1, 1,
1.199524, -0.6115742, 1.913791, 1, 0, 0, 1, 1,
1.201575, -1.124752, 2.462468, 1, 0, 0, 1, 1,
1.204512, 0.9707974, 0.7459231, 1, 0, 0, 1, 1,
1.217416, -0.1065604, 3.878812, 1, 0, 0, 1, 1,
1.22016, 0.7270736, 1.44393, 0, 0, 0, 1, 1,
1.220873, 0.6829246, 1.433594, 0, 0, 0, 1, 1,
1.222978, -1.883969, 2.442095, 0, 0, 0, 1, 1,
1.223073, 0.7005703, 0.2281826, 0, 0, 0, 1, 1,
1.235625, 0.3170429, -0.5829501, 0, 0, 0, 1, 1,
1.243961, 0.5051797, 2.787835, 0, 0, 0, 1, 1,
1.249321, 0.1651148, 2.377548, 0, 0, 0, 1, 1,
1.252534, 1.531692, 0.937528, 1, 1, 1, 1, 1,
1.259682, 0.2593477, 0.6095712, 1, 1, 1, 1, 1,
1.260091, 1.496615, 0.7694824, 1, 1, 1, 1, 1,
1.26587, -2.159436, 3.663009, 1, 1, 1, 1, 1,
1.267262, -1.006942, 2.326345, 1, 1, 1, 1, 1,
1.270937, 1.356915, -0.4559301, 1, 1, 1, 1, 1,
1.272353, -1.616458, 3.109548, 1, 1, 1, 1, 1,
1.283191, -0.7073939, 3.023306, 1, 1, 1, 1, 1,
1.288625, 0.7847026, 1.296469, 1, 1, 1, 1, 1,
1.291228, 0.05157793, 1.858479, 1, 1, 1, 1, 1,
1.29471, -0.4418919, 1.554611, 1, 1, 1, 1, 1,
1.300727, -1.250362, 2.021948, 1, 1, 1, 1, 1,
1.301984, 2.220216, 0.2475506, 1, 1, 1, 1, 1,
1.307877, 0.8012618, -0.724364, 1, 1, 1, 1, 1,
1.317173, 1.70913, 1.134948, 1, 1, 1, 1, 1,
1.320871, 0.1578361, 2.228493, 0, 0, 1, 1, 1,
1.333728, 0.1056388, 1.703496, 1, 0, 0, 1, 1,
1.334771, 1.469142, -0.2384728, 1, 0, 0, 1, 1,
1.335948, 0.580347, 0.1745795, 1, 0, 0, 1, 1,
1.33653, 0.7543371, 1.233249, 1, 0, 0, 1, 1,
1.342107, -0.1854451, 2.926956, 1, 0, 0, 1, 1,
1.342764, 0.2628974, 1.802211, 0, 0, 0, 1, 1,
1.343708, -1.243324, 4.023309, 0, 0, 0, 1, 1,
1.343749, 1.200313, 1.224125, 0, 0, 0, 1, 1,
1.403104, 0.01889642, 3.240311, 0, 0, 0, 1, 1,
1.428655, 1.688904, -1.240121, 0, 0, 0, 1, 1,
1.436364, -0.4148763, 1.257921, 0, 0, 0, 1, 1,
1.444157, -0.8054466, 0.1676095, 0, 0, 0, 1, 1,
1.457938, 0.6063945, 2.075502, 1, 1, 1, 1, 1,
1.475483, -1.593441, 3.104749, 1, 1, 1, 1, 1,
1.483858, -0.08307062, 2.010496, 1, 1, 1, 1, 1,
1.488922, -0.5648912, 1.696185, 1, 1, 1, 1, 1,
1.49086, 0.3470339, 1.604623, 1, 1, 1, 1, 1,
1.49569, -0.279189, 3.502397, 1, 1, 1, 1, 1,
1.500301, 0.5401133, 0.7972094, 1, 1, 1, 1, 1,
1.506124, -0.7448464, 2.701228, 1, 1, 1, 1, 1,
1.538312, 0.4574618, 0.8325785, 1, 1, 1, 1, 1,
1.543679, -0.8795418, 2.970993, 1, 1, 1, 1, 1,
1.562305, 0.2284538, 1.73189, 1, 1, 1, 1, 1,
1.572264, -1.026337, 1.586165, 1, 1, 1, 1, 1,
1.585599, 1.589135, 0.1116086, 1, 1, 1, 1, 1,
1.590146, -1.021309, 1.613112, 1, 1, 1, 1, 1,
1.596952, 0.6407785, 1.648758, 1, 1, 1, 1, 1,
1.598301, -0.1628287, 1.712033, 0, 0, 1, 1, 1,
1.608272, -1.040456, 2.024907, 1, 0, 0, 1, 1,
1.609499, 0.2416449, 1.997157, 1, 0, 0, 1, 1,
1.610401, -0.5916595, 1.087262, 1, 0, 0, 1, 1,
1.617193, -1.330098, 3.52128, 1, 0, 0, 1, 1,
1.636071, -1.131702, 3.201424, 1, 0, 0, 1, 1,
1.644084, 0.9327725, 0.6284878, 0, 0, 0, 1, 1,
1.648899, -0.292464, 1.346138, 0, 0, 0, 1, 1,
1.649174, 0.4542158, 2.772857, 0, 0, 0, 1, 1,
1.693941, -0.6192185, 2.371504, 0, 0, 0, 1, 1,
1.714685, -0.5554547, 0.8490416, 0, 0, 0, 1, 1,
1.715085, 2.084734, 1.622925, 0, 0, 0, 1, 1,
1.74074, 0.2992789, 2.624627, 0, 0, 0, 1, 1,
1.754584, 1.463449, 2.902247, 1, 1, 1, 1, 1,
1.754675, 1.110848, 0.6526567, 1, 1, 1, 1, 1,
1.757754, 0.3397894, 0.6760306, 1, 1, 1, 1, 1,
1.759089, -0.4967381, 1.284741, 1, 1, 1, 1, 1,
1.771224, -1.25328, 1.743411, 1, 1, 1, 1, 1,
1.79013, -0.3559911, 0.8840005, 1, 1, 1, 1, 1,
1.820377, -0.6139036, 2.922106, 1, 1, 1, 1, 1,
1.837966, -0.8164786, 0.8785563, 1, 1, 1, 1, 1,
1.844115, 0.4058917, 1.22351, 1, 1, 1, 1, 1,
1.848071, -1.28062, 2.939574, 1, 1, 1, 1, 1,
1.899915, 0.6397856, -0.4376881, 1, 1, 1, 1, 1,
1.91698, -1.327217, 1.901652, 1, 1, 1, 1, 1,
1.968435, 0.8135266, 1.138545, 1, 1, 1, 1, 1,
1.972711, -0.9471273, 1.928585, 1, 1, 1, 1, 1,
1.983114, 1.206521, 1.646288, 1, 1, 1, 1, 1,
1.987982, 0.5993823, -0.8286193, 0, 0, 1, 1, 1,
1.993394, 0.6737841, 0.08599126, 1, 0, 0, 1, 1,
2.066186, -1.069093, 1.509099, 1, 0, 0, 1, 1,
2.072392, 0.7164016, 3.143462, 1, 0, 0, 1, 1,
2.146141, -0.6352675, 1.534757, 1, 0, 0, 1, 1,
2.157166, -0.957056, 2.853048, 1, 0, 0, 1, 1,
2.18171, 0.3675591, 1.672298, 0, 0, 0, 1, 1,
2.263545, 0.22836, 1.66837, 0, 0, 0, 1, 1,
2.284785, 1.960555, -0.0581231, 0, 0, 0, 1, 1,
2.344909, -0.3161095, 2.344255, 0, 0, 0, 1, 1,
2.351625, -0.1187211, 2.48398, 0, 0, 0, 1, 1,
2.436359, 0.4013517, 1.642936, 0, 0, 0, 1, 1,
2.446494, -0.1454531, 1.244023, 0, 0, 0, 1, 1,
2.521982, 0.1068422, 2.775196, 1, 1, 1, 1, 1,
2.579814, -0.2232275, 0.7646307, 1, 1, 1, 1, 1,
2.696502, 0.6808626, -0.4551288, 1, 1, 1, 1, 1,
2.828068, -0.8851552, 3.188103, 1, 1, 1, 1, 1,
2.969453, 0.5802845, 1.69936, 1, 1, 1, 1, 1,
3.165086, -2.101708, 2.253217, 1, 1, 1, 1, 1,
4.000479, 0.6586557, 2.959861, 1, 1, 1, 1, 1
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
var radius = 11.24023;
var distance = 39.48083;
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
mvMatrix.translate( -0.3280575, 0.2831838, 0.3132496 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -39.48083);
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