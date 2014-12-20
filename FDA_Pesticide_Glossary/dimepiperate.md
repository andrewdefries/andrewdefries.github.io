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
-3.624029, -0.6913193, -1.245838, 1, 0, 0, 1,
-3.193678, -1.477568, -2.157823, 1, 0.007843138, 0, 1,
-2.867969, -0.3643684, -2.762083, 1, 0.01176471, 0, 1,
-2.756659, -0.8784918, -1.236992, 1, 0.01960784, 0, 1,
-2.721727, -0.283594, -2.090708, 1, 0.02352941, 0, 1,
-2.676211, 1.00607, -1.249846, 1, 0.03137255, 0, 1,
-2.665257, 0.1832089, -0.1846475, 1, 0.03529412, 0, 1,
-2.634087, -0.6089014, -3.405989, 1, 0.04313726, 0, 1,
-2.595945, 0.5299231, 0.3688661, 1, 0.04705882, 0, 1,
-2.551826, 1.176607, -2.10811, 1, 0.05490196, 0, 1,
-2.534596, -0.5617211, -2.552256, 1, 0.05882353, 0, 1,
-2.47333, -0.7975093, -3.830789, 1, 0.06666667, 0, 1,
-2.432855, 0.9308385, -0.07684989, 1, 0.07058824, 0, 1,
-2.419051, 1.561867, -0.9545961, 1, 0.07843138, 0, 1,
-2.406596, -0.11645, -0.8550268, 1, 0.08235294, 0, 1,
-2.321635, -0.6451593, -1.788409, 1, 0.09019608, 0, 1,
-2.269293, 0.1822413, -1.796687, 1, 0.09411765, 0, 1,
-2.168025, 0.06906346, -1.879628, 1, 0.1019608, 0, 1,
-2.130702, 0.8937113, 0.3481217, 1, 0.1098039, 0, 1,
-2.127319, 0.8695496, -1.786302, 1, 0.1137255, 0, 1,
-2.05726, 0.7414197, -0.7494754, 1, 0.1215686, 0, 1,
-1.943121, -0.03980746, -1.756668, 1, 0.1254902, 0, 1,
-1.934683, -0.1024723, -1.602364, 1, 0.1333333, 0, 1,
-1.929206, -1.161917, -1.193258, 1, 0.1372549, 0, 1,
-1.926013, 0.4034121, -0.9845827, 1, 0.145098, 0, 1,
-1.90001, -2.18774, -2.100586, 1, 0.1490196, 0, 1,
-1.887763, -0.5003006, -2.241929, 1, 0.1568628, 0, 1,
-1.877022, -0.3733209, -0.206097, 1, 0.1607843, 0, 1,
-1.845746, -0.8880772, -0.9870434, 1, 0.1686275, 0, 1,
-1.829343, 0.896606, -1.567197, 1, 0.172549, 0, 1,
-1.82276, -0.2428907, -0.5810425, 1, 0.1803922, 0, 1,
-1.804301, -0.4325171, -1.302945, 1, 0.1843137, 0, 1,
-1.792596, -0.2446968, -3.038608, 1, 0.1921569, 0, 1,
-1.786468, 0.1502321, -1.898804, 1, 0.1960784, 0, 1,
-1.786239, -1.109608, -2.135243, 1, 0.2039216, 0, 1,
-1.765248, -0.1146573, -0.9745971, 1, 0.2117647, 0, 1,
-1.762918, 1.215296, -0.09282569, 1, 0.2156863, 0, 1,
-1.760254, 1.092843, -0.06790135, 1, 0.2235294, 0, 1,
-1.759077, -0.9545103, -3.006589, 1, 0.227451, 0, 1,
-1.745556, 0.168231, -2.473243, 1, 0.2352941, 0, 1,
-1.740546, -1.242834, -2.138873, 1, 0.2392157, 0, 1,
-1.731261, -0.007163679, -0.5566648, 1, 0.2470588, 0, 1,
-1.727333, -0.4953373, -0.6111659, 1, 0.2509804, 0, 1,
-1.701535, 0.9842261, -0.03498207, 1, 0.2588235, 0, 1,
-1.694722, 2.260182, -0.1169832, 1, 0.2627451, 0, 1,
-1.684548, -1.3923, -2.202288, 1, 0.2705882, 0, 1,
-1.670618, -0.454722, -1.449615, 1, 0.2745098, 0, 1,
-1.667499, -0.008425605, -1.09476, 1, 0.282353, 0, 1,
-1.612625, -1.073945, -2.023574, 1, 0.2862745, 0, 1,
-1.601863, -0.2215067, -1.864436, 1, 0.2941177, 0, 1,
-1.597057, 0.8171318, -1.39083, 1, 0.3019608, 0, 1,
-1.595513, 0.8151501, -2.439134, 1, 0.3058824, 0, 1,
-1.588498, -1.293384, -1.103718, 1, 0.3137255, 0, 1,
-1.556476, 1.137117, -0.3437513, 1, 0.3176471, 0, 1,
-1.543686, -0.9790681, -2.179401, 1, 0.3254902, 0, 1,
-1.530119, -2.205131, -2.945994, 1, 0.3294118, 0, 1,
-1.511407, 1.099066, -0.06910715, 1, 0.3372549, 0, 1,
-1.494863, -0.5234647, -1.226978, 1, 0.3411765, 0, 1,
-1.492803, 0.2742355, -1.98782, 1, 0.3490196, 0, 1,
-1.482538, -2.3975, -2.78185, 1, 0.3529412, 0, 1,
-1.476484, 0.4002177, -1.178811, 1, 0.3607843, 0, 1,
-1.474245, 0.1066014, -2.355703, 1, 0.3647059, 0, 1,
-1.471191, -1.191899, -2.185273, 1, 0.372549, 0, 1,
-1.460411, 0.101563, -1.72204, 1, 0.3764706, 0, 1,
-1.450841, 0.6871361, -1.256548, 1, 0.3843137, 0, 1,
-1.449093, -1.559431, -2.772829, 1, 0.3882353, 0, 1,
-1.448094, 1.463173, 0.6002381, 1, 0.3960784, 0, 1,
-1.446752, 1.440311, 0.3784995, 1, 0.4039216, 0, 1,
-1.442643, -1.131478, -1.882463, 1, 0.4078431, 0, 1,
-1.439249, 1.417484, 0.5801071, 1, 0.4156863, 0, 1,
-1.438823, -0.8911208, -1.168023, 1, 0.4196078, 0, 1,
-1.432877, -0.8746776, -1.812348, 1, 0.427451, 0, 1,
-1.403976, 0.9342011, -0.7327777, 1, 0.4313726, 0, 1,
-1.397555, -2.363136, -4.39754, 1, 0.4392157, 0, 1,
-1.383755, 0.9228705, 0.5769907, 1, 0.4431373, 0, 1,
-1.383731, -0.4116995, -2.61559, 1, 0.4509804, 0, 1,
-1.382624, -0.04788774, -1.14661, 1, 0.454902, 0, 1,
-1.38221, -1.003721, -1.258699, 1, 0.4627451, 0, 1,
-1.381403, 0.1726997, -0.430885, 1, 0.4666667, 0, 1,
-1.3668, 1.551564, 0.09465691, 1, 0.4745098, 0, 1,
-1.365219, -0.7628627, -2.295972, 1, 0.4784314, 0, 1,
-1.358477, -0.4577138, -2.033667, 1, 0.4862745, 0, 1,
-1.356256, 1.441094, -1.206767, 1, 0.4901961, 0, 1,
-1.35585, -0.3259256, -1.848122, 1, 0.4980392, 0, 1,
-1.344566, 1.967101, -0.6943401, 1, 0.5058824, 0, 1,
-1.336876, 0.1734836, -3.548958, 1, 0.509804, 0, 1,
-1.331087, -0.7615413, -2.366061, 1, 0.5176471, 0, 1,
-1.325628, -0.02287133, -0.4882618, 1, 0.5215687, 0, 1,
-1.324826, -1.510496, -2.488632, 1, 0.5294118, 0, 1,
-1.315621, -1.029151, -1.841416, 1, 0.5333334, 0, 1,
-1.305315, 0.823683, 0.6183919, 1, 0.5411765, 0, 1,
-1.301881, -1.846287, -2.035398, 1, 0.5450981, 0, 1,
-1.300891, 0.05505137, -0.9773585, 1, 0.5529412, 0, 1,
-1.298362, -0.3102088, -2.823682, 1, 0.5568628, 0, 1,
-1.295528, 0.5258752, -1.201099, 1, 0.5647059, 0, 1,
-1.292514, 0.1074905, 0.9935057, 1, 0.5686275, 0, 1,
-1.291862, 0.4720287, -2.200694, 1, 0.5764706, 0, 1,
-1.271205, 1.640435, 0.1531741, 1, 0.5803922, 0, 1,
-1.270535, 0.7548428, -1.224744, 1, 0.5882353, 0, 1,
-1.270344, -0.02286775, -1.980313, 1, 0.5921569, 0, 1,
-1.254084, 0.2535486, -0.8279335, 1, 0.6, 0, 1,
-1.244809, 0.9748796, 0.5629538, 1, 0.6078432, 0, 1,
-1.242557, -0.009562174, -1.174865, 1, 0.6117647, 0, 1,
-1.235937, -0.5293403, -1.554648, 1, 0.6196079, 0, 1,
-1.231146, 0.839123, -2.406496, 1, 0.6235294, 0, 1,
-1.225426, 0.8391299, -1.672986, 1, 0.6313726, 0, 1,
-1.220347, 1.264959, -2.174222, 1, 0.6352941, 0, 1,
-1.217883, 0.6692067, -1.994403, 1, 0.6431373, 0, 1,
-1.205538, 0.6677354, -1.618201, 1, 0.6470588, 0, 1,
-1.195762, 0.4601314, -2.312083, 1, 0.654902, 0, 1,
-1.194025, 0.7032992, -2.243729, 1, 0.6588235, 0, 1,
-1.192588, 0.04047988, -1.557734, 1, 0.6666667, 0, 1,
-1.190789, 0.4707415, -0.1550893, 1, 0.6705883, 0, 1,
-1.190173, 0.8495479, -1.369947, 1, 0.6784314, 0, 1,
-1.189274, 0.372553, -0.4476728, 1, 0.682353, 0, 1,
-1.188746, -1.176713, -2.477815, 1, 0.6901961, 0, 1,
-1.176544, -0.08473963, -1.135098, 1, 0.6941177, 0, 1,
-1.176079, 2.027298, -0.2810961, 1, 0.7019608, 0, 1,
-1.165793, 0.2799363, -0.5541289, 1, 0.7098039, 0, 1,
-1.161097, 2.766345, -2.464224, 1, 0.7137255, 0, 1,
-1.158563, -0.1586976, -2.508939, 1, 0.7215686, 0, 1,
-1.148604, 0.13319, -1.722767, 1, 0.7254902, 0, 1,
-1.133898, -1.466239, -2.085675, 1, 0.7333333, 0, 1,
-1.127723, 0.9074259, -0.907632, 1, 0.7372549, 0, 1,
-1.127591, -1.468664, -2.276556, 1, 0.7450981, 0, 1,
-1.118123, 0.4865498, -2.427375, 1, 0.7490196, 0, 1,
-1.11004, -1.115906, -3.084318, 1, 0.7568628, 0, 1,
-1.10622, 0.662137, -1.01779, 1, 0.7607843, 0, 1,
-1.103745, -0.3717678, -2.335528, 1, 0.7686275, 0, 1,
-1.10358, -1.090527, -1.83463, 1, 0.772549, 0, 1,
-1.095464, -0.4895204, -1.683064, 1, 0.7803922, 0, 1,
-1.086921, -1.07457, -3.812584, 1, 0.7843137, 0, 1,
-1.079836, -0.3585748, -2.079953, 1, 0.7921569, 0, 1,
-1.077463, 2.647632, -1.525536, 1, 0.7960784, 0, 1,
-1.076889, 1.045094, -1.781855, 1, 0.8039216, 0, 1,
-1.070964, 0.2715422, -3.682625, 1, 0.8117647, 0, 1,
-1.068943, -0.5599205, -0.9792145, 1, 0.8156863, 0, 1,
-1.060951, -0.1031187, -0.9143515, 1, 0.8235294, 0, 1,
-1.059512, -1.433327, -1.238381, 1, 0.827451, 0, 1,
-1.046293, 1.173643, -0.5750658, 1, 0.8352941, 0, 1,
-1.039249, -0.7655546, -1.06162, 1, 0.8392157, 0, 1,
-1.039243, 0.6588724, -1.708159, 1, 0.8470588, 0, 1,
-1.031001, -0.4412875, -2.742683, 1, 0.8509804, 0, 1,
-1.02831, 1.830008, 0.8816609, 1, 0.8588235, 0, 1,
-1.017026, 1.394017, -0.8759944, 1, 0.8627451, 0, 1,
-1.016283, -0.09817169, -1.512256, 1, 0.8705882, 0, 1,
-1.0127, -0.6577597, -0.1574448, 1, 0.8745098, 0, 1,
-1.010743, 0.5353293, -0.4155799, 1, 0.8823529, 0, 1,
-1.007667, 1.600331, -0.1764537, 1, 0.8862745, 0, 1,
-1.006016, -0.0897358, -2.584342, 1, 0.8941177, 0, 1,
-1.00581, -0.01333758, -1.462024, 1, 0.8980392, 0, 1,
-1.005228, -1.585593, -2.604493, 1, 0.9058824, 0, 1,
-0.999657, -0.9360331, -1.874788, 1, 0.9137255, 0, 1,
-0.9975851, 1.573282, -0.5163893, 1, 0.9176471, 0, 1,
-0.9950336, 0.5640129, -0.8795414, 1, 0.9254902, 0, 1,
-0.9925979, 0.7344707, 0.7332852, 1, 0.9294118, 0, 1,
-0.9893724, 1.496053, -2.220061, 1, 0.9372549, 0, 1,
-0.9883779, -0.1325151, -0.834675, 1, 0.9411765, 0, 1,
-0.9876052, -0.5903331, -0.7252647, 1, 0.9490196, 0, 1,
-0.9865078, -0.1661287, 1.232575, 1, 0.9529412, 0, 1,
-0.9822373, 0.03190881, -2.939917, 1, 0.9607843, 0, 1,
-0.9797535, -0.9582341, -2.277321, 1, 0.9647059, 0, 1,
-0.9765835, 0.4383951, -1.938558, 1, 0.972549, 0, 1,
-0.9711238, 0.1959026, -0.6550696, 1, 0.9764706, 0, 1,
-0.9701502, -0.3906152, -0.9951009, 1, 0.9843137, 0, 1,
-0.96935, -0.6743426, -1.421649, 1, 0.9882353, 0, 1,
-0.9688991, 1.171603, -0.443254, 1, 0.9960784, 0, 1,
-0.962034, 0.4998357, -0.9908737, 0.9960784, 1, 0, 1,
-0.9613259, -0.2615047, -2.109372, 0.9921569, 1, 0, 1,
-0.9553054, 0.2310029, -0.9097512, 0.9843137, 1, 0, 1,
-0.9550081, 1.247794, 0.05821434, 0.9803922, 1, 0, 1,
-0.9412137, -0.8715193, -2.351728, 0.972549, 1, 0, 1,
-0.9313243, -0.06896313, -3.218471, 0.9686275, 1, 0, 1,
-0.9294432, 0.4554307, -1.010314, 0.9607843, 1, 0, 1,
-0.9262776, 0.4658865, -0.6392772, 0.9568627, 1, 0, 1,
-0.925047, -2.223477, -1.893649, 0.9490196, 1, 0, 1,
-0.9228337, 0.1555815, -2.539198, 0.945098, 1, 0, 1,
-0.9223714, -0.3467283, 0.1397054, 0.9372549, 1, 0, 1,
-0.9221773, -0.4587711, -2.203677, 0.9333333, 1, 0, 1,
-0.9215382, 1.801605, -3.307753, 0.9254902, 1, 0, 1,
-0.9214936, -1.998633, -0.9355827, 0.9215686, 1, 0, 1,
-0.9190784, 0.5028179, -1.727214, 0.9137255, 1, 0, 1,
-0.9130707, 2.376789, -1.236559, 0.9098039, 1, 0, 1,
-0.9062746, -0.8743771, -1.63029, 0.9019608, 1, 0, 1,
-0.9045834, 1.761121, -0.2199276, 0.8941177, 1, 0, 1,
-0.899371, 1.454507, -2.481561, 0.8901961, 1, 0, 1,
-0.8931429, 1.869508, 1.030801, 0.8823529, 1, 0, 1,
-0.8927583, -1.346133, -1.800547, 0.8784314, 1, 0, 1,
-0.8905566, 0.7206545, -0.64363, 0.8705882, 1, 0, 1,
-0.8899313, -0.4516355, -2.800877, 0.8666667, 1, 0, 1,
-0.8827469, 0.5854606, -1.099388, 0.8588235, 1, 0, 1,
-0.8827158, -0.3104626, -1.762351, 0.854902, 1, 0, 1,
-0.8709899, -1.644984, -2.357827, 0.8470588, 1, 0, 1,
-0.8696061, 0.7658864, -2.293109, 0.8431373, 1, 0, 1,
-0.8657063, 0.6897772, 0.1789095, 0.8352941, 1, 0, 1,
-0.8643697, -0.9676718, -2.866032, 0.8313726, 1, 0, 1,
-0.8630683, -1.025196, -3.769422, 0.8235294, 1, 0, 1,
-0.8601427, -0.7024169, -1.220903, 0.8196079, 1, 0, 1,
-0.8600498, 0.2914643, -1.91094, 0.8117647, 1, 0, 1,
-0.8591038, 1.657095, 0.03683335, 0.8078431, 1, 0, 1,
-0.8575635, -0.9476866, -0.07092483, 0.8, 1, 0, 1,
-0.8483332, 0.3349659, 0.48079, 0.7921569, 1, 0, 1,
-0.8436835, -0.569507, -1.68948, 0.7882353, 1, 0, 1,
-0.8427521, -0.01872102, -1.810476, 0.7803922, 1, 0, 1,
-0.8386273, 0.344705, -2.656137, 0.7764706, 1, 0, 1,
-0.8333547, -1.033165, -2.96729, 0.7686275, 1, 0, 1,
-0.8273525, -0.5032609, -3.157642, 0.7647059, 1, 0, 1,
-0.825527, -2.565626, -1.469997, 0.7568628, 1, 0, 1,
-0.8253429, -1.387356, -1.448357, 0.7529412, 1, 0, 1,
-0.8247065, -0.4671177, -3.694754, 0.7450981, 1, 0, 1,
-0.822799, 0.2232838, 0.5286637, 0.7411765, 1, 0, 1,
-0.8202804, 0.8772954, -1.365012, 0.7333333, 1, 0, 1,
-0.8171949, 0.5887764, -0.956239, 0.7294118, 1, 0, 1,
-0.8092809, 1.278212, -1.272695, 0.7215686, 1, 0, 1,
-0.8066744, 0.6964026, -1.204594, 0.7176471, 1, 0, 1,
-0.8022171, 0.7852125, -1.986945, 0.7098039, 1, 0, 1,
-0.7854208, 0.03848794, -1.756646, 0.7058824, 1, 0, 1,
-0.784874, -0.01530791, -1.418397, 0.6980392, 1, 0, 1,
-0.7730434, 0.9593208, -0.5309017, 0.6901961, 1, 0, 1,
-0.7691818, 2.294533, -0.8784997, 0.6862745, 1, 0, 1,
-0.7654463, -0.5029851, -4.300709, 0.6784314, 1, 0, 1,
-0.7623876, 1.279386, -1.828774, 0.6745098, 1, 0, 1,
-0.7535588, -0.7108741, -2.548558, 0.6666667, 1, 0, 1,
-0.7524228, -0.2332584, -1.476692, 0.6627451, 1, 0, 1,
-0.7508644, 0.09877227, -1.493139, 0.654902, 1, 0, 1,
-0.7483829, -0.1842469, -1.162254, 0.6509804, 1, 0, 1,
-0.7478116, 0.6123637, -1.09819, 0.6431373, 1, 0, 1,
-0.7473992, 1.490967, -0.4914205, 0.6392157, 1, 0, 1,
-0.7457554, -0.7814998, -2.304603, 0.6313726, 1, 0, 1,
-0.7411302, 0.4623008, -1.880091, 0.627451, 1, 0, 1,
-0.7316551, 1.513297, 0.8751381, 0.6196079, 1, 0, 1,
-0.7287107, 0.7880942, -1.435997, 0.6156863, 1, 0, 1,
-0.7236041, -0.01188093, -1.704826, 0.6078432, 1, 0, 1,
-0.7183351, 0.1794294, -2.424359, 0.6039216, 1, 0, 1,
-0.7110369, -0.8548247, -2.619416, 0.5960785, 1, 0, 1,
-0.7047022, 1.263458, 0.3297028, 0.5882353, 1, 0, 1,
-0.703802, 0.8762558, 0.4701458, 0.5843138, 1, 0, 1,
-0.6995724, 0.4211505, 0.1409253, 0.5764706, 1, 0, 1,
-0.6991888, 1.481455, -1.183351, 0.572549, 1, 0, 1,
-0.6912429, 0.4750861, -1.330998, 0.5647059, 1, 0, 1,
-0.6898525, -2.298283, -2.086254, 0.5607843, 1, 0, 1,
-0.6887259, -0.2251526, -2.109497, 0.5529412, 1, 0, 1,
-0.6854675, -0.1149763, -0.812782, 0.5490196, 1, 0, 1,
-0.683695, 1.850528, 0.2820445, 0.5411765, 1, 0, 1,
-0.6818581, -0.5624894, -2.204207, 0.5372549, 1, 0, 1,
-0.6816134, 2.642934, 0.6557462, 0.5294118, 1, 0, 1,
-0.6796204, -1.515503, -2.008612, 0.5254902, 1, 0, 1,
-0.6787035, -1.837164, -2.804932, 0.5176471, 1, 0, 1,
-0.6779597, 0.1685559, -0.09878451, 0.5137255, 1, 0, 1,
-0.6712066, -0.4718504, -3.580334, 0.5058824, 1, 0, 1,
-0.6685154, -0.2772341, -3.290707, 0.5019608, 1, 0, 1,
-0.663552, 1.959877, 1.41967, 0.4941176, 1, 0, 1,
-0.652485, -1.059013, -2.592893, 0.4862745, 1, 0, 1,
-0.6518673, -0.7610232, -0.8855512, 0.4823529, 1, 0, 1,
-0.6504537, 0.1106003, 0.2686015, 0.4745098, 1, 0, 1,
-0.6462692, -0.8846221, -1.811545, 0.4705882, 1, 0, 1,
-0.6335679, 0.3449399, -0.9072576, 0.4627451, 1, 0, 1,
-0.6318079, 1.15252, -1.542823, 0.4588235, 1, 0, 1,
-0.6303683, 0.4000777, -0.3989975, 0.4509804, 1, 0, 1,
-0.6286396, 0.3417465, -2.425226, 0.4470588, 1, 0, 1,
-0.6280892, -1.504006, -1.152759, 0.4392157, 1, 0, 1,
-0.6262417, 0.3007613, -0.8183705, 0.4352941, 1, 0, 1,
-0.6247188, 0.3722653, -1.811915, 0.427451, 1, 0, 1,
-0.6206287, 0.6146445, -1.87947, 0.4235294, 1, 0, 1,
-0.620312, 1.092181, -1.444986, 0.4156863, 1, 0, 1,
-0.6193584, 0.06869482, -1.876367, 0.4117647, 1, 0, 1,
-0.6077588, -1.571931, -2.444965, 0.4039216, 1, 0, 1,
-0.6013513, -2.481096, -2.472032, 0.3960784, 1, 0, 1,
-0.5981227, -0.9933134, -2.053705, 0.3921569, 1, 0, 1,
-0.5974241, 0.6087569, 0.1451426, 0.3843137, 1, 0, 1,
-0.5948095, 0.282093, -0.8121341, 0.3803922, 1, 0, 1,
-0.5932508, 0.8367659, -0.8198962, 0.372549, 1, 0, 1,
-0.5932059, -1.038355, -4.760579, 0.3686275, 1, 0, 1,
-0.5926802, 1.070799, -0.6350484, 0.3607843, 1, 0, 1,
-0.5897064, -0.9731323, -2.711759, 0.3568628, 1, 0, 1,
-0.5857898, -0.8315665, -2.781514, 0.3490196, 1, 0, 1,
-0.5843238, 0.4237102, -1.78461, 0.345098, 1, 0, 1,
-0.5822022, 0.6135057, -1.514628, 0.3372549, 1, 0, 1,
-0.5821433, -0.889869, -2.826145, 0.3333333, 1, 0, 1,
-0.5814651, -1.095946, -1.462996, 0.3254902, 1, 0, 1,
-0.5808844, 0.399695, 0.5101683, 0.3215686, 1, 0, 1,
-0.5806315, 0.1072686, -0.1310925, 0.3137255, 1, 0, 1,
-0.5771258, -0.1114293, -1.241009, 0.3098039, 1, 0, 1,
-0.5760549, -1.514895, -1.659167, 0.3019608, 1, 0, 1,
-0.5742679, 1.017191, 1.291362, 0.2941177, 1, 0, 1,
-0.5741585, 0.1614333, -2.633639, 0.2901961, 1, 0, 1,
-0.5703205, 1.585016, 0.06331018, 0.282353, 1, 0, 1,
-0.5702509, 2.019793, 0.5573047, 0.2784314, 1, 0, 1,
-0.5668982, -0.3661637, -1.694661, 0.2705882, 1, 0, 1,
-0.5664943, 0.1184163, -2.759268, 0.2666667, 1, 0, 1,
-0.566028, 0.1086518, -2.545698, 0.2588235, 1, 0, 1,
-0.5638024, -2.002769, -1.794424, 0.254902, 1, 0, 1,
-0.5636668, -2.190739, -1.489929, 0.2470588, 1, 0, 1,
-0.561746, 0.8666553, 0.4518763, 0.2431373, 1, 0, 1,
-0.554864, 1.331678, -2.168269, 0.2352941, 1, 0, 1,
-0.5547821, -1.194878, -1.966948, 0.2313726, 1, 0, 1,
-0.5456874, -0.4716485, -3.007968, 0.2235294, 1, 0, 1,
-0.5383611, -0.9582556, -1.019545, 0.2196078, 1, 0, 1,
-0.5334545, 0.9144458, 1.129526, 0.2117647, 1, 0, 1,
-0.5323836, -0.5595317, -2.550739, 0.2078431, 1, 0, 1,
-0.5316132, -1.066993, -2.070604, 0.2, 1, 0, 1,
-0.530804, -0.3593714, -2.219735, 0.1921569, 1, 0, 1,
-0.5254105, 0.0861321, -3.720664, 0.1882353, 1, 0, 1,
-0.5247505, 0.6388506, -1.98617, 0.1803922, 1, 0, 1,
-0.5243483, -0.3207896, -3.381311, 0.1764706, 1, 0, 1,
-0.5234795, -0.489202, -2.843185, 0.1686275, 1, 0, 1,
-0.5220873, 0.7073449, -0.05253746, 0.1647059, 1, 0, 1,
-0.5218536, 1.004626, -1.124647, 0.1568628, 1, 0, 1,
-0.520397, -0.006643285, -1.110379, 0.1529412, 1, 0, 1,
-0.5156993, 1.251529, 0.01676416, 0.145098, 1, 0, 1,
-0.5111107, 0.6079216, -1.007418, 0.1411765, 1, 0, 1,
-0.5078195, -0.3978167, -1.581717, 0.1333333, 1, 0, 1,
-0.5050408, -0.2352908, -2.70686, 0.1294118, 1, 0, 1,
-0.4975928, -1.024735, -2.129778, 0.1215686, 1, 0, 1,
-0.4972145, 1.684247, -1.916988, 0.1176471, 1, 0, 1,
-0.4908584, -0.8360738, -2.333279, 0.1098039, 1, 0, 1,
-0.4883183, -0.008412116, -1.628131, 0.1058824, 1, 0, 1,
-0.4861653, 1.955446, 0.229306, 0.09803922, 1, 0, 1,
-0.4850583, -1.007611, -2.192132, 0.09019608, 1, 0, 1,
-0.484849, 0.3010996, -1.222152, 0.08627451, 1, 0, 1,
-0.477046, 1.253024, 0.5884205, 0.07843138, 1, 0, 1,
-0.4753801, -0.04993358, -2.372731, 0.07450981, 1, 0, 1,
-0.4747277, -1.014564, -5.19796, 0.06666667, 1, 0, 1,
-0.4719636, 0.07105884, -1.398227, 0.0627451, 1, 0, 1,
-0.4673147, -1.661675, -1.978276, 0.05490196, 1, 0, 1,
-0.4647521, -1.953849, -2.658316, 0.05098039, 1, 0, 1,
-0.4634261, 1.087474, -0.1455716, 0.04313726, 1, 0, 1,
-0.4626616, 0.05004458, -3.178296, 0.03921569, 1, 0, 1,
-0.4596921, -0.2846271, -2.730061, 0.03137255, 1, 0, 1,
-0.4572499, 1.491735, 0.5207767, 0.02745098, 1, 0, 1,
-0.4550527, 0.1011399, -1.371125, 0.01960784, 1, 0, 1,
-0.4546203, 0.8861439, 2.261078, 0.01568628, 1, 0, 1,
-0.4514071, -0.92075, -3.497672, 0.007843138, 1, 0, 1,
-0.446871, -1.827443, -1.698834, 0.003921569, 1, 0, 1,
-0.4421158, 0.004842935, -1.488155, 0, 1, 0.003921569, 1,
-0.4415774, -0.3321932, -2.431059, 0, 1, 0.01176471, 1,
-0.4408874, -1.851382, -3.87088, 0, 1, 0.01568628, 1,
-0.438259, 0.1293563, 0.7629338, 0, 1, 0.02352941, 1,
-0.4361723, -0.7067043, -1.019496, 0, 1, 0.02745098, 1,
-0.4297147, 0.7732887, -1.016683, 0, 1, 0.03529412, 1,
-0.4237316, -0.7515099, -2.694818, 0, 1, 0.03921569, 1,
-0.4202102, 0.2972006, -0.4798833, 0, 1, 0.04705882, 1,
-0.4201125, -2.056549, -2.697754, 0, 1, 0.05098039, 1,
-0.4170901, -0.6117441, -0.3968762, 0, 1, 0.05882353, 1,
-0.4096646, 2.182679, -1.143306, 0, 1, 0.0627451, 1,
-0.4085604, -1.784415, -2.425447, 0, 1, 0.07058824, 1,
-0.4057366, 0.6059738, -0.5190696, 0, 1, 0.07450981, 1,
-0.4020679, 1.45285, 0.1575433, 0, 1, 0.08235294, 1,
-0.4017048, -0.85911, -2.450206, 0, 1, 0.08627451, 1,
-0.4015441, -1.604466, -3.965837, 0, 1, 0.09411765, 1,
-0.4001251, 0.5925217, -1.402052, 0, 1, 0.1019608, 1,
-0.3995444, -1.382798, -2.061077, 0, 1, 0.1058824, 1,
-0.3983487, 0.2519682, -0.5124683, 0, 1, 0.1137255, 1,
-0.3982956, -1.72828, -1.263122, 0, 1, 0.1176471, 1,
-0.3956191, -1.807664, -2.163899, 0, 1, 0.1254902, 1,
-0.3925723, -1.062619, -2.772569, 0, 1, 0.1294118, 1,
-0.3830505, -0.5186899, -0.734957, 0, 1, 0.1372549, 1,
-0.3822045, -0.8087962, -4.102715, 0, 1, 0.1411765, 1,
-0.381677, -0.04338195, -0.7938133, 0, 1, 0.1490196, 1,
-0.381464, 1.883454, -0.2364543, 0, 1, 0.1529412, 1,
-0.3766328, -0.5054061, -1.812967, 0, 1, 0.1607843, 1,
-0.3748751, -1.303137, -3.110433, 0, 1, 0.1647059, 1,
-0.3700977, -0.01920958, -1.450372, 0, 1, 0.172549, 1,
-0.3690403, 1.227194, 1.757821, 0, 1, 0.1764706, 1,
-0.3679154, 1.500833, 0.2837667, 0, 1, 0.1843137, 1,
-0.3678002, -1.05868, -2.807043, 0, 1, 0.1882353, 1,
-0.3637209, -0.6601589, -4.337797, 0, 1, 0.1960784, 1,
-0.362321, 0.5323619, -0.5571998, 0, 1, 0.2039216, 1,
-0.362108, -1.453907, -2.28616, 0, 1, 0.2078431, 1,
-0.3516894, -0.4038989, -4.593384, 0, 1, 0.2156863, 1,
-0.3488427, -0.283208, -0.04877115, 0, 1, 0.2196078, 1,
-0.3464865, 1.01445, -0.6474479, 0, 1, 0.227451, 1,
-0.3425824, -0.9169964, -5.18817, 0, 1, 0.2313726, 1,
-0.3422946, 0.2987319, 1.661316, 0, 1, 0.2392157, 1,
-0.3386949, 0.1932034, -0.1549487, 0, 1, 0.2431373, 1,
-0.3353709, 2.067258, -0.3862913, 0, 1, 0.2509804, 1,
-0.3332857, -0.7819542, -2.571038, 0, 1, 0.254902, 1,
-0.3325997, 0.7128376, -0.033345, 0, 1, 0.2627451, 1,
-0.3304331, 0.4949386, -0.4579191, 0, 1, 0.2666667, 1,
-0.3213226, 1.201241, -0.277227, 0, 1, 0.2745098, 1,
-0.3207881, -0.2548753, -3.680766, 0, 1, 0.2784314, 1,
-0.3195709, 0.1185202, -1.902403, 0, 1, 0.2862745, 1,
-0.3160233, 0.9536165, -0.8354867, 0, 1, 0.2901961, 1,
-0.3144388, 1.239828, -1.139977, 0, 1, 0.2980392, 1,
-0.3136222, -1.194612, -4.241948, 0, 1, 0.3058824, 1,
-0.3129341, -1.049195, -3.034348, 0, 1, 0.3098039, 1,
-0.3128912, -0.1728577, -1.283994, 0, 1, 0.3176471, 1,
-0.312648, 2.780314, -0.2194667, 0, 1, 0.3215686, 1,
-0.3111786, -0.3149331, -2.95946, 0, 1, 0.3294118, 1,
-0.3074639, 1.322797, -2.414468, 0, 1, 0.3333333, 1,
-0.3073595, -0.6294433, -2.918188, 0, 1, 0.3411765, 1,
-0.3056584, 0.2987836, -1.023077, 0, 1, 0.345098, 1,
-0.3016382, 1.389381, -1.391096, 0, 1, 0.3529412, 1,
-0.300738, 0.3422931, -1.501753, 0, 1, 0.3568628, 1,
-0.2973793, -1.063414, -4.777266, 0, 1, 0.3647059, 1,
-0.2942668, -0.3165835, -0.4343069, 0, 1, 0.3686275, 1,
-0.2941594, -1.605249, -2.219789, 0, 1, 0.3764706, 1,
-0.2914831, 0.486425, 0.633929, 0, 1, 0.3803922, 1,
-0.2875931, 0.1092686, -1.68942, 0, 1, 0.3882353, 1,
-0.286756, 1.399179, -1.84581, 0, 1, 0.3921569, 1,
-0.2855792, -1.834158, -1.973253, 0, 1, 0.4, 1,
-0.2847597, -0.7715037, -2.166368, 0, 1, 0.4078431, 1,
-0.2827738, -0.852596, -3.245003, 0, 1, 0.4117647, 1,
-0.2825411, -0.004394154, -2.269098, 0, 1, 0.4196078, 1,
-0.2816895, -0.4696354, -3.959766, 0, 1, 0.4235294, 1,
-0.2816249, -0.2314659, -2.681657, 0, 1, 0.4313726, 1,
-0.2808369, 1.22727, 0.3846287, 0, 1, 0.4352941, 1,
-0.2767836, -0.906318, -0.416893, 0, 1, 0.4431373, 1,
-0.2691927, -1.77516, -4.570967, 0, 1, 0.4470588, 1,
-0.2641973, 0.8654464, 0.2599852, 0, 1, 0.454902, 1,
-0.2630833, -0.3367662, -1.541428, 0, 1, 0.4588235, 1,
-0.2609292, -1.648174, -2.885504, 0, 1, 0.4666667, 1,
-0.259947, -0.06512608, -0.5397844, 0, 1, 0.4705882, 1,
-0.2586639, 0.3587299, -1.386229, 0, 1, 0.4784314, 1,
-0.2585389, -0.4557314, -3.140371, 0, 1, 0.4823529, 1,
-0.2571083, -0.657305, -2.365636, 0, 1, 0.4901961, 1,
-0.25438, 0.7057089, 0.09070763, 0, 1, 0.4941176, 1,
-0.2447272, 0.6271055, -0.6333659, 0, 1, 0.5019608, 1,
-0.2418681, 0.795735, -1.035357, 0, 1, 0.509804, 1,
-0.2418347, -0.4276207, -2.310042, 0, 1, 0.5137255, 1,
-0.2402025, -1.451211, -4.772041, 0, 1, 0.5215687, 1,
-0.2382708, -1.154873, -3.816114, 0, 1, 0.5254902, 1,
-0.236551, -0.8788527, -2.869665, 0, 1, 0.5333334, 1,
-0.2349997, -0.7271565, -1.250096, 0, 1, 0.5372549, 1,
-0.2316831, 0.9675087, -1.599566, 0, 1, 0.5450981, 1,
-0.2312188, -1.364743, -3.376578, 0, 1, 0.5490196, 1,
-0.2306143, -0.6225053, -1.209729, 0, 1, 0.5568628, 1,
-0.228478, 0.5610222, -2.319167, 0, 1, 0.5607843, 1,
-0.2216184, -0.0373335, -4.231847, 0, 1, 0.5686275, 1,
-0.2211816, 0.2833529, -0.6798372, 0, 1, 0.572549, 1,
-0.2180354, -0.1489022, -3.210437, 0, 1, 0.5803922, 1,
-0.2151748, 0.2776808, -0.02434509, 0, 1, 0.5843138, 1,
-0.2148331, 0.8598838, -0.08336806, 0, 1, 0.5921569, 1,
-0.2141899, -1.508133, -1.185163, 0, 1, 0.5960785, 1,
-0.211504, 0.3319815, -1.263417, 0, 1, 0.6039216, 1,
-0.2112848, 1.649281, -0.01359326, 0, 1, 0.6117647, 1,
-0.2089129, 0.5638992, 0.4127049, 0, 1, 0.6156863, 1,
-0.20728, -0.2206059, -2.27458, 0, 1, 0.6235294, 1,
-0.2033743, 0.6783733, 0.008366712, 0, 1, 0.627451, 1,
-0.2029957, 1.34056, -0.6219377, 0, 1, 0.6352941, 1,
-0.2000171, 0.3218351, -2.438372, 0, 1, 0.6392157, 1,
-0.1997832, -0.2929299, -2.289739, 0, 1, 0.6470588, 1,
-0.1975857, 0.03676311, -0.2835116, 0, 1, 0.6509804, 1,
-0.1957536, 0.0167755, -0.4809215, 0, 1, 0.6588235, 1,
-0.1950027, -0.9584392, -4.104136, 0, 1, 0.6627451, 1,
-0.1923258, 0.6135706, -0.3968666, 0, 1, 0.6705883, 1,
-0.1890964, -0.3175396, -2.468985, 0, 1, 0.6745098, 1,
-0.1880552, 0.2960042, -2.670525, 0, 1, 0.682353, 1,
-0.1854676, -0.6790267, -2.807466, 0, 1, 0.6862745, 1,
-0.185421, -0.1273955, -2.01401, 0, 1, 0.6941177, 1,
-0.1839732, 0.2553416, 0.7908, 0, 1, 0.7019608, 1,
-0.1824554, 0.5175647, -0.1033644, 0, 1, 0.7058824, 1,
-0.1728788, -1.869256, -4.155109, 0, 1, 0.7137255, 1,
-0.171584, 0.8382148, 0.5762424, 0, 1, 0.7176471, 1,
-0.1713941, 0.0565956, -4.56473, 0, 1, 0.7254902, 1,
-0.170076, -0.4432834, -2.836699, 0, 1, 0.7294118, 1,
-0.1597217, 2.17611, 0.2095563, 0, 1, 0.7372549, 1,
-0.1576635, -0.3951435, -2.228467, 0, 1, 0.7411765, 1,
-0.1551022, -0.7414985, -1.973645, 0, 1, 0.7490196, 1,
-0.1502076, 0.5601745, 1.064907, 0, 1, 0.7529412, 1,
-0.1462091, -1.017492, -4.903582, 0, 1, 0.7607843, 1,
-0.1445246, 1.908831, -0.663045, 0, 1, 0.7647059, 1,
-0.1441295, 0.942973, -0.9796923, 0, 1, 0.772549, 1,
-0.1433549, -1.231067, -3.698444, 0, 1, 0.7764706, 1,
-0.1350054, -0.5371024, -2.62545, 0, 1, 0.7843137, 1,
-0.1339502, 1.151564, -1.571024, 0, 1, 0.7882353, 1,
-0.133888, 0.6173655, -0.7331047, 0, 1, 0.7960784, 1,
-0.1270593, -0.5827044, -3.236055, 0, 1, 0.8039216, 1,
-0.1254646, -0.3913334, -1.944286, 0, 1, 0.8078431, 1,
-0.1228271, 0.9660783, -0.8128611, 0, 1, 0.8156863, 1,
-0.1175656, -1.740346, -2.647838, 0, 1, 0.8196079, 1,
-0.1162502, 0.858753, 0.9730074, 0, 1, 0.827451, 1,
-0.1090851, -0.8948041, -2.601816, 0, 1, 0.8313726, 1,
-0.1048358, -1.245263, -2.412183, 0, 1, 0.8392157, 1,
-0.1036898, 1.571487, -0.8472306, 0, 1, 0.8431373, 1,
-0.1028141, -0.02655002, -2.33357, 0, 1, 0.8509804, 1,
-0.1026262, -1.267343, -3.173169, 0, 1, 0.854902, 1,
-0.1003364, 0.06556426, -0.7901739, 0, 1, 0.8627451, 1,
-0.09873786, 0.2809961, -0.2923446, 0, 1, 0.8666667, 1,
-0.08866108, 0.57262, 0.2272895, 0, 1, 0.8745098, 1,
-0.08795411, -0.421619, -1.609763, 0, 1, 0.8784314, 1,
-0.08601455, 0.3674979, -0.2662195, 0, 1, 0.8862745, 1,
-0.08170611, 0.5881363, 0.08395206, 0, 1, 0.8901961, 1,
-0.08109764, 1.93182, 0.2342218, 0, 1, 0.8980392, 1,
-0.08087458, -2.271714, -3.348138, 0, 1, 0.9058824, 1,
-0.0803296, -1.863813, -4.764872, 0, 1, 0.9098039, 1,
-0.07728154, 0.09076641, 0.3640843, 0, 1, 0.9176471, 1,
-0.07701276, -0.1379036, -2.24147, 0, 1, 0.9215686, 1,
-0.07438547, 1.029508, 1.041643, 0, 1, 0.9294118, 1,
-0.07176602, 0.3299556, -0.8077517, 0, 1, 0.9333333, 1,
-0.06879799, -1.611166, -2.944779, 0, 1, 0.9411765, 1,
-0.06600205, -0.1049983, -1.96667, 0, 1, 0.945098, 1,
-0.06535099, -0.5094265, -2.02068, 0, 1, 0.9529412, 1,
-0.06516524, 0.856374, 0.6729156, 0, 1, 0.9568627, 1,
-0.05834841, 0.1687292, -0.9050128, 0, 1, 0.9647059, 1,
-0.05669968, 2.214151, -0.4990768, 0, 1, 0.9686275, 1,
-0.04515754, 1.474466, -1.144914, 0, 1, 0.9764706, 1,
-0.04101319, 1.436272, -0.1798913, 0, 1, 0.9803922, 1,
-0.03284856, -0.2146588, -1.812914, 0, 1, 0.9882353, 1,
-0.03261384, 0.789411, -0.1171625, 0, 1, 0.9921569, 1,
-0.02954853, -0.3147897, -1.487559, 0, 1, 1, 1,
-0.02148483, 0.003160661, -1.728062, 0, 0.9921569, 1, 1,
-0.02132501, 1.549289, -0.6963304, 0, 0.9882353, 1, 1,
-0.01747792, -0.2288997, -0.8906932, 0, 0.9803922, 1, 1,
-0.01572552, 0.2279372, 0.6195794, 0, 0.9764706, 1, 1,
-0.01548389, -1.054268, -3.406126, 0, 0.9686275, 1, 1,
-0.01258524, 0.943071, 0.6394203, 0, 0.9647059, 1, 1,
-0.0118215, -0.2510453, -4.077622, 0, 0.9568627, 1, 1,
-0.01126354, -1.46253, -4.330714, 0, 0.9529412, 1, 1,
-0.009692034, 0.9766174, 0.9563985, 0, 0.945098, 1, 1,
-0.00949845, 0.6272715, -0.3197244, 0, 0.9411765, 1, 1,
-0.006665751, 0.06625728, -1.520974, 0, 0.9333333, 1, 1,
-0.006376639, -0.9263637, -1.717385, 0, 0.9294118, 1, 1,
-0.0006669745, 0.9280799, -1.039136, 0, 0.9215686, 1, 1,
-0.0005615635, 1.441709, 0.02589393, 0, 0.9176471, 1, 1,
0.001447821, -0.361526, 2.917908, 0, 0.9098039, 1, 1,
0.002212166, -0.7167187, 3.851329, 0, 0.9058824, 1, 1,
0.002531898, 0.2205855, 1.238744, 0, 0.8980392, 1, 1,
0.005416665, 1.678908, -0.228532, 0, 0.8901961, 1, 1,
0.006769108, -0.4704721, 2.90967, 0, 0.8862745, 1, 1,
0.008016544, -0.9200519, 2.821021, 0, 0.8784314, 1, 1,
0.01030706, -0.4501279, 3.99396, 0, 0.8745098, 1, 1,
0.01052245, -0.2378756, 3.409759, 0, 0.8666667, 1, 1,
0.01806922, -0.1501347, 2.926171, 0, 0.8627451, 1, 1,
0.01912089, 1.471179, -0.2007068, 0, 0.854902, 1, 1,
0.02451041, -0.4675474, 2.470167, 0, 0.8509804, 1, 1,
0.03235788, 0.4149665, 0.550452, 0, 0.8431373, 1, 1,
0.03708316, 0.5857873, -0.467916, 0, 0.8392157, 1, 1,
0.03826429, 2.092354, -0.2823121, 0, 0.8313726, 1, 1,
0.0423996, 1.581105, 0.3684269, 0, 0.827451, 1, 1,
0.04410287, 0.4724032, 2.449104, 0, 0.8196079, 1, 1,
0.04752826, -1.00131, 3.132044, 0, 0.8156863, 1, 1,
0.05229333, -0.3310761, 2.961619, 0, 0.8078431, 1, 1,
0.05386503, -0.2209785, 3.898142, 0, 0.8039216, 1, 1,
0.05594885, -0.4690695, 2.408276, 0, 0.7960784, 1, 1,
0.05808643, -1.30669, 3.863279, 0, 0.7882353, 1, 1,
0.0650096, 0.2684655, -0.7627585, 0, 0.7843137, 1, 1,
0.06758428, -0.464998, 1.363071, 0, 0.7764706, 1, 1,
0.07394481, 0.3802215, -1.923342, 0, 0.772549, 1, 1,
0.07404326, -0.5808727, 3.281153, 0, 0.7647059, 1, 1,
0.07757594, -0.09234055, 1.639373, 0, 0.7607843, 1, 1,
0.08332975, -0.2395899, 3.801771, 0, 0.7529412, 1, 1,
0.08734202, 0.05237678, 2.547279, 0, 0.7490196, 1, 1,
0.0905527, -0.3739121, 2.14332, 0, 0.7411765, 1, 1,
0.09072639, 0.4899403, 0.8894902, 0, 0.7372549, 1, 1,
0.09422268, -0.05992202, -0.06213, 0, 0.7294118, 1, 1,
0.0952414, 0.2052117, 1.344826, 0, 0.7254902, 1, 1,
0.09631291, -0.4636431, 2.983985, 0, 0.7176471, 1, 1,
0.09854201, -0.7595893, 3.229228, 0, 0.7137255, 1, 1,
0.1057836, -0.6408936, 2.124143, 0, 0.7058824, 1, 1,
0.1064574, -1.656371, 2.370718, 0, 0.6980392, 1, 1,
0.1143635, 0.6971878, -1.270296, 0, 0.6941177, 1, 1,
0.1187442, -0.7758783, 3.100079, 0, 0.6862745, 1, 1,
0.1242866, -0.2814367, 2.691756, 0, 0.682353, 1, 1,
0.1246336, 2.188583, 1.567141, 0, 0.6745098, 1, 1,
0.1307958, -0.6236382, 1.743316, 0, 0.6705883, 1, 1,
0.1358205, -0.0595737, 1.673793, 0, 0.6627451, 1, 1,
0.1400832, -0.5600092, 2.290992, 0, 0.6588235, 1, 1,
0.1434379, -0.7973412, 1.383473, 0, 0.6509804, 1, 1,
0.1452149, 0.6344024, -0.08296559, 0, 0.6470588, 1, 1,
0.1462999, 0.5532659, 0.2436087, 0, 0.6392157, 1, 1,
0.1486855, 0.5394307, 0.2226194, 0, 0.6352941, 1, 1,
0.1528148, 0.6958861, 0.3015663, 0, 0.627451, 1, 1,
0.155032, -0.5667363, 2.2135, 0, 0.6235294, 1, 1,
0.1552081, 0.9767202, 1.244878, 0, 0.6156863, 1, 1,
0.1561751, -0.2013581, 3.134806, 0, 0.6117647, 1, 1,
0.158371, -0.1783637, 3.029294, 0, 0.6039216, 1, 1,
0.1591411, 1.149925, 0.6036043, 0, 0.5960785, 1, 1,
0.1632461, -0.3641196, 3.086421, 0, 0.5921569, 1, 1,
0.1656386, 0.7928079, 0.6673204, 0, 0.5843138, 1, 1,
0.1706606, -0.2616111, 1.863659, 0, 0.5803922, 1, 1,
0.1707976, 0.7991526, -0.3346503, 0, 0.572549, 1, 1,
0.1762674, -0.3813077, 2.607286, 0, 0.5686275, 1, 1,
0.1776605, 0.3558262, 1.555906, 0, 0.5607843, 1, 1,
0.179085, 0.869201, -1.277776, 0, 0.5568628, 1, 1,
0.1797097, -0.1466247, 1.037397, 0, 0.5490196, 1, 1,
0.1874257, -0.51177, 0.785154, 0, 0.5450981, 1, 1,
0.1874491, 1.302172, 0.943527, 0, 0.5372549, 1, 1,
0.1900374, 0.1194286, -1.123014, 0, 0.5333334, 1, 1,
0.1944549, 1.066445, 0.2308865, 0, 0.5254902, 1, 1,
0.1954812, 0.5626822, 0.07886715, 0, 0.5215687, 1, 1,
0.2081332, 0.882101, -1.090699, 0, 0.5137255, 1, 1,
0.2116346, -0.4885338, 3.7756, 0, 0.509804, 1, 1,
0.211962, 1.880721, -0.2089422, 0, 0.5019608, 1, 1,
0.2214052, -1.978765, 3.47101, 0, 0.4941176, 1, 1,
0.2258727, 1.43396, 1.223176, 0, 0.4901961, 1, 1,
0.2267079, 0.7014129, -1.057215, 0, 0.4823529, 1, 1,
0.2267475, -0.4961645, 2.176234, 0, 0.4784314, 1, 1,
0.2276701, 0.8707342, 0.9816453, 0, 0.4705882, 1, 1,
0.2361697, 0.5948471, -0.6870586, 0, 0.4666667, 1, 1,
0.2375482, -0.9224754, 0.668021, 0, 0.4588235, 1, 1,
0.2451432, 0.3019279, 1.163318, 0, 0.454902, 1, 1,
0.2494457, 0.7185287, -0.412201, 0, 0.4470588, 1, 1,
0.2539869, -0.2467561, 3.369148, 0, 0.4431373, 1, 1,
0.2562937, -0.1674017, 3.707427, 0, 0.4352941, 1, 1,
0.2575046, -0.176133, 1.861647, 0, 0.4313726, 1, 1,
0.2598504, 0.08652795, 3.878448, 0, 0.4235294, 1, 1,
0.2610686, 1.353403, 1.923492, 0, 0.4196078, 1, 1,
0.2645334, 1.401229, -0.4911256, 0, 0.4117647, 1, 1,
0.2652973, 1.320684, 0.1421568, 0, 0.4078431, 1, 1,
0.2653294, -0.9953196, 4.299265, 0, 0.4, 1, 1,
0.2677166, -0.5897126, 1.711316, 0, 0.3921569, 1, 1,
0.2688319, 0.6001896, 1.488995, 0, 0.3882353, 1, 1,
0.2730547, 1.271775, -0.8788693, 0, 0.3803922, 1, 1,
0.2747904, 1.072796, -0.6870912, 0, 0.3764706, 1, 1,
0.2829163, -0.1259404, 4.347731, 0, 0.3686275, 1, 1,
0.2867129, -0.09956699, 2.810273, 0, 0.3647059, 1, 1,
0.2920575, 1.141088, 0.7418789, 0, 0.3568628, 1, 1,
0.2949892, -1.236253, 1.299558, 0, 0.3529412, 1, 1,
0.2961436, 0.5530669, 0.2146459, 0, 0.345098, 1, 1,
0.3002042, -1.172772, 2.973039, 0, 0.3411765, 1, 1,
0.3005477, -0.5506646, 2.954945, 0, 0.3333333, 1, 1,
0.3022939, 0.3425246, 1.472789, 0, 0.3294118, 1, 1,
0.3026975, 0.472958, 2.455872, 0, 0.3215686, 1, 1,
0.305742, -0.537649, 1.113652, 0, 0.3176471, 1, 1,
0.3062808, 0.6294755, 1.078371, 0, 0.3098039, 1, 1,
0.3083298, -1.101508, 4.23508, 0, 0.3058824, 1, 1,
0.3091042, -1.273807, 3.276564, 0, 0.2980392, 1, 1,
0.3116885, 2.407713, 2.326739, 0, 0.2901961, 1, 1,
0.3218713, -0.9921547, 4.29489, 0, 0.2862745, 1, 1,
0.3237171, -0.05370266, 1.712609, 0, 0.2784314, 1, 1,
0.3246105, 0.08265732, 2.341604, 0, 0.2745098, 1, 1,
0.3247284, -0.6514658, 2.921185, 0, 0.2666667, 1, 1,
0.3275954, 0.5325724, 1.121713, 0, 0.2627451, 1, 1,
0.3300466, -0.2017155, 1.229751, 0, 0.254902, 1, 1,
0.3341234, -0.140214, 2.735825, 0, 0.2509804, 1, 1,
0.3350143, 0.2519583, -0.03999289, 0, 0.2431373, 1, 1,
0.340106, -0.93027, 3.013709, 0, 0.2392157, 1, 1,
0.344569, 2.368748, 0.003738965, 0, 0.2313726, 1, 1,
0.3462991, -1.205275, 3.355119, 0, 0.227451, 1, 1,
0.3485398, 0.4850351, 1.109801, 0, 0.2196078, 1, 1,
0.3494309, 0.1459055, 0.9017565, 0, 0.2156863, 1, 1,
0.3510136, -1.109501, 3.897666, 0, 0.2078431, 1, 1,
0.3529859, 1.384478, -1.255358, 0, 0.2039216, 1, 1,
0.353264, 2.19317, -1.747011, 0, 0.1960784, 1, 1,
0.3544613, 0.6996353, -0.9218929, 0, 0.1882353, 1, 1,
0.3544646, -1.696086, 2.954393, 0, 0.1843137, 1, 1,
0.3563205, 1.501022, 0.9347515, 0, 0.1764706, 1, 1,
0.3599488, -0.6982774, 2.47841, 0, 0.172549, 1, 1,
0.3606155, -1.610456, 3.726344, 0, 0.1647059, 1, 1,
0.3614369, -1.043381, 1.567772, 0, 0.1607843, 1, 1,
0.3630833, -0.6123587, 3.003747, 0, 0.1529412, 1, 1,
0.3697681, 0.2963854, 3.156961, 0, 0.1490196, 1, 1,
0.3730128, -0.4867183, 1.17575, 0, 0.1411765, 1, 1,
0.3735147, -0.1842354, 1.241314, 0, 0.1372549, 1, 1,
0.378797, 0.1504805, 1.703203, 0, 0.1294118, 1, 1,
0.3806448, 0.01907589, 2.732814, 0, 0.1254902, 1, 1,
0.382088, -1.200557, 2.047373, 0, 0.1176471, 1, 1,
0.3826903, -0.9971276, 4.511733, 0, 0.1137255, 1, 1,
0.3896667, -1.948179, 3.678447, 0, 0.1058824, 1, 1,
0.3957805, 0.1499912, 1.942858, 0, 0.09803922, 1, 1,
0.3974852, -0.7492086, 2.951178, 0, 0.09411765, 1, 1,
0.4013487, 0.3642737, -0.129626, 0, 0.08627451, 1, 1,
0.4021858, -0.3793165, 1.741026, 0, 0.08235294, 1, 1,
0.4024036, -2.059985, 1.545484, 0, 0.07450981, 1, 1,
0.4036158, 0.6161455, 0.6042698, 0, 0.07058824, 1, 1,
0.4043296, 2.588737, -0.1399595, 0, 0.0627451, 1, 1,
0.4079022, 1.33867, 1.496827, 0, 0.05882353, 1, 1,
0.4080463, 1.06524, -0.7099206, 0, 0.05098039, 1, 1,
0.4083717, -0.9808784, 3.883017, 0, 0.04705882, 1, 1,
0.4099287, -0.2290713, 1.406855, 0, 0.03921569, 1, 1,
0.4159483, 0.9915982, -0.08399408, 0, 0.03529412, 1, 1,
0.4176585, 0.1906746, 1.344167, 0, 0.02745098, 1, 1,
0.4177269, -0.01647242, 3.342315, 0, 0.02352941, 1, 1,
0.4197921, 0.3190776, 2.905993, 0, 0.01568628, 1, 1,
0.4204412, -0.6100932, 2.564288, 0, 0.01176471, 1, 1,
0.4227762, -1.502122, 1.116857, 0, 0.003921569, 1, 1,
0.4241049, -0.4289699, 2.587514, 0.003921569, 0, 1, 1,
0.4264495, 1.279195, -1.056051, 0.007843138, 0, 1, 1,
0.4273049, -1.950629, 2.715135, 0.01568628, 0, 1, 1,
0.4279981, -0.724784, 3.268998, 0.01960784, 0, 1, 1,
0.4320838, -0.1979797, 1.380935, 0.02745098, 0, 1, 1,
0.4360971, 0.1708916, -0.7937118, 0.03137255, 0, 1, 1,
0.4373563, 0.1719217, 2.275787, 0.03921569, 0, 1, 1,
0.4395607, -1.591875, 3.216987, 0.04313726, 0, 1, 1,
0.4403253, 0.951673, 1.454105, 0.05098039, 0, 1, 1,
0.4420791, -0.2878728, 1.470601, 0.05490196, 0, 1, 1,
0.4437091, -0.4124525, 3.521884, 0.0627451, 0, 1, 1,
0.4466277, 0.4852724, -1.491867, 0.06666667, 0, 1, 1,
0.4470777, -1.172598, 0.6387914, 0.07450981, 0, 1, 1,
0.4478264, -0.2859254, 2.706455, 0.07843138, 0, 1, 1,
0.4492887, -1.91897, 3.859859, 0.08627451, 0, 1, 1,
0.4591302, -1.597741, 2.78848, 0.09019608, 0, 1, 1,
0.4614992, -0.09973998, 0.133517, 0.09803922, 0, 1, 1,
0.4624469, 0.4023581, -0.6047466, 0.1058824, 0, 1, 1,
0.4643935, 1.166984, -1.270465, 0.1098039, 0, 1, 1,
0.4659076, 1.738536, 1.62461, 0.1176471, 0, 1, 1,
0.4673763, 1.580815, -0.1270006, 0.1215686, 0, 1, 1,
0.4744118, -0.3496353, 0.5033278, 0.1294118, 0, 1, 1,
0.4824602, 0.1815252, -0.6749096, 0.1333333, 0, 1, 1,
0.4866354, -0.417478, 3.063608, 0.1411765, 0, 1, 1,
0.4960991, 0.6438775, -2.050595, 0.145098, 0, 1, 1,
0.5016569, 0.4217465, -0.2419749, 0.1529412, 0, 1, 1,
0.5073538, -0.8109069, 3.655275, 0.1568628, 0, 1, 1,
0.512357, -0.08779484, -0.1864501, 0.1647059, 0, 1, 1,
0.5143281, 1.442526, -0.2593569, 0.1686275, 0, 1, 1,
0.515854, -2.304744, 2.946756, 0.1764706, 0, 1, 1,
0.5223597, -0.5566783, 3.930975, 0.1803922, 0, 1, 1,
0.5223994, -0.5528993, 3.064734, 0.1882353, 0, 1, 1,
0.523981, 1.369721, -1.576386, 0.1921569, 0, 1, 1,
0.5278049, -0.04065524, 2.976725, 0.2, 0, 1, 1,
0.5290058, -1.015312, 2.851318, 0.2078431, 0, 1, 1,
0.5290145, -1.319812, 2.977899, 0.2117647, 0, 1, 1,
0.5305453, -0.9295288, 0.4755694, 0.2196078, 0, 1, 1,
0.5341271, 0.3457378, 1.18271, 0.2235294, 0, 1, 1,
0.5347931, -0.4587728, 2.270909, 0.2313726, 0, 1, 1,
0.5362804, -0.9062721, 1.837147, 0.2352941, 0, 1, 1,
0.5394939, 1.263174, 1.10399, 0.2431373, 0, 1, 1,
0.5446128, -1.500893, 2.093029, 0.2470588, 0, 1, 1,
0.5485777, 0.3462698, 0.2197844, 0.254902, 0, 1, 1,
0.5525649, -0.2545595, 3.536855, 0.2588235, 0, 1, 1,
0.5549305, -0.09337781, 2.580827, 0.2666667, 0, 1, 1,
0.5602278, 0.1775743, 0.3715373, 0.2705882, 0, 1, 1,
0.5637122, 0.1129027, 1.425792, 0.2784314, 0, 1, 1,
0.5645396, -0.75607, 0.904627, 0.282353, 0, 1, 1,
0.5695118, -1.024642, 2.121857, 0.2901961, 0, 1, 1,
0.5727938, 0.2000837, 1.154846, 0.2941177, 0, 1, 1,
0.5740591, 0.8139347, -0.2635541, 0.3019608, 0, 1, 1,
0.5757751, 1.440366, -2.175689, 0.3098039, 0, 1, 1,
0.5769243, 0.2126281, 1.983211, 0.3137255, 0, 1, 1,
0.5841296, -0.4134963, 1.771741, 0.3215686, 0, 1, 1,
0.5861442, 0.3629723, -0.6111546, 0.3254902, 0, 1, 1,
0.5986047, -1.041525, 2.569669, 0.3333333, 0, 1, 1,
0.6010694, 0.220386, 2.535599, 0.3372549, 0, 1, 1,
0.6015864, 2.760236, -1.443387, 0.345098, 0, 1, 1,
0.6021154, 0.6611666, -0.1803636, 0.3490196, 0, 1, 1,
0.603914, 0.8514116, 1.34639, 0.3568628, 0, 1, 1,
0.6056551, -1.120322, 3.143204, 0.3607843, 0, 1, 1,
0.6068401, -0.774239, 1.62576, 0.3686275, 0, 1, 1,
0.6117401, -0.2455379, 3.395995, 0.372549, 0, 1, 1,
0.6153581, -0.00710767, 1.941903, 0.3803922, 0, 1, 1,
0.6204061, -0.5311148, 2.260133, 0.3843137, 0, 1, 1,
0.6216543, 1.403693, -0.9331034, 0.3921569, 0, 1, 1,
0.6235964, -0.2064476, 2.099005, 0.3960784, 0, 1, 1,
0.6309713, 0.47331, 1.496662, 0.4039216, 0, 1, 1,
0.6315945, 1.345877, 0.4845551, 0.4117647, 0, 1, 1,
0.6319119, -0.9303007, 2.396877, 0.4156863, 0, 1, 1,
0.6327239, 0.2488834, 2.04787, 0.4235294, 0, 1, 1,
0.6330504, -2.869356, 1.405525, 0.427451, 0, 1, 1,
0.6337793, 0.6101801, 0.1225792, 0.4352941, 0, 1, 1,
0.6350702, 0.3691201, -0.1451913, 0.4392157, 0, 1, 1,
0.6390535, -0.9774788, 1.935706, 0.4470588, 0, 1, 1,
0.6398221, 1.477154, -1.2395, 0.4509804, 0, 1, 1,
0.6404134, -1.058724, 1.380073, 0.4588235, 0, 1, 1,
0.6494019, -0.4133121, 2.354511, 0.4627451, 0, 1, 1,
0.6502544, 0.005892205, 0.2569508, 0.4705882, 0, 1, 1,
0.6510729, 0.2656753, 0.5617025, 0.4745098, 0, 1, 1,
0.6527873, -2.046893, 2.69413, 0.4823529, 0, 1, 1,
0.6545316, 0.1908376, 1.244431, 0.4862745, 0, 1, 1,
0.6587461, -0.5784745, 1.849554, 0.4941176, 0, 1, 1,
0.6690168, 2.743654, -0.7893757, 0.5019608, 0, 1, 1,
0.6702641, 1.240218, 0.6131479, 0.5058824, 0, 1, 1,
0.6754997, 0.5559274, -0.04224029, 0.5137255, 0, 1, 1,
0.6786443, 0.9963557, 0.02759417, 0.5176471, 0, 1, 1,
0.6792583, 1.526569, 1.500071, 0.5254902, 0, 1, 1,
0.6902788, 0.3777573, 0.2406362, 0.5294118, 0, 1, 1,
0.6931854, -0.8801375, 2.841609, 0.5372549, 0, 1, 1,
0.6999329, -0.5385762, 1.408487, 0.5411765, 0, 1, 1,
0.7013642, 0.9236681, -0.5824033, 0.5490196, 0, 1, 1,
0.7071323, -0.3482856, 2.764396, 0.5529412, 0, 1, 1,
0.7089386, -0.1704673, 2.528969, 0.5607843, 0, 1, 1,
0.7134019, 0.005471981, 1.517294, 0.5647059, 0, 1, 1,
0.7156801, -1.435488, 2.557518, 0.572549, 0, 1, 1,
0.7158197, 0.521943, 1.01596, 0.5764706, 0, 1, 1,
0.7168394, 0.6567766, 1.185032, 0.5843138, 0, 1, 1,
0.7186221, 0.5690781, 1.217494, 0.5882353, 0, 1, 1,
0.7187502, -0.8755953, 2.157847, 0.5960785, 0, 1, 1,
0.7245551, 0.5112584, 2.629564, 0.6039216, 0, 1, 1,
0.7257365, -0.6399188, 3.627633, 0.6078432, 0, 1, 1,
0.7271832, -1.492447, 4.55418, 0.6156863, 0, 1, 1,
0.7293189, -0.05180108, 3.223981, 0.6196079, 0, 1, 1,
0.7325544, -0.6155125, 0.923017, 0.627451, 0, 1, 1,
0.7331737, -0.2621624, 2.708608, 0.6313726, 0, 1, 1,
0.7382916, -0.2538404, 2.513859, 0.6392157, 0, 1, 1,
0.7411767, 1.002755, 0.5323897, 0.6431373, 0, 1, 1,
0.743333, 0.3463539, 1.94926, 0.6509804, 0, 1, 1,
0.7517924, -0.7528518, 3.479562, 0.654902, 0, 1, 1,
0.7571461, -1.644951, 1.680877, 0.6627451, 0, 1, 1,
0.7575088, -1.512194, 3.713446, 0.6666667, 0, 1, 1,
0.759498, 0.02998778, 0.6946114, 0.6745098, 0, 1, 1,
0.7616107, 0.1622688, 1.599394, 0.6784314, 0, 1, 1,
0.7624139, 0.3776081, 1.514716, 0.6862745, 0, 1, 1,
0.7731146, -0.4180226, 1.255385, 0.6901961, 0, 1, 1,
0.7759121, -0.2752938, 1.281534, 0.6980392, 0, 1, 1,
0.7821822, -0.8110719, 3.646685, 0.7058824, 0, 1, 1,
0.7834858, 0.06704295, 0.5954508, 0.7098039, 0, 1, 1,
0.7842597, 2.06237, 0.3484933, 0.7176471, 0, 1, 1,
0.7908346, 0.1795275, 2.390193, 0.7215686, 0, 1, 1,
0.7952349, -0.3294226, 2.745656, 0.7294118, 0, 1, 1,
0.7969776, 0.3078859, 0.9223198, 0.7333333, 0, 1, 1,
0.7992414, -0.2780618, 1.711335, 0.7411765, 0, 1, 1,
0.8040764, 0.413395, 1.28684, 0.7450981, 0, 1, 1,
0.8065644, -1.712679, 1.39889, 0.7529412, 0, 1, 1,
0.8073218, 0.2788456, 0.5163594, 0.7568628, 0, 1, 1,
0.8081645, -0.4820484, 2.144369, 0.7647059, 0, 1, 1,
0.8129848, -0.3965945, 1.894501, 0.7686275, 0, 1, 1,
0.8270994, -0.5540606, 1.56648, 0.7764706, 0, 1, 1,
0.8314954, -0.07602923, 2.707609, 0.7803922, 0, 1, 1,
0.8341085, -0.5221959, 2.373276, 0.7882353, 0, 1, 1,
0.8387143, 1.390974, 0.7118878, 0.7921569, 0, 1, 1,
0.8429266, 0.7131456, 1.217878, 0.8, 0, 1, 1,
0.8453233, -0.07702934, 2.21653, 0.8078431, 0, 1, 1,
0.8473276, 0.2277375, 2.080464, 0.8117647, 0, 1, 1,
0.8512876, 1.578891, 0.2714334, 0.8196079, 0, 1, 1,
0.8533003, -0.1469903, 1.798386, 0.8235294, 0, 1, 1,
0.8543688, 1.027693, 1.817634, 0.8313726, 0, 1, 1,
0.8621554, -2.207447, 1.779386, 0.8352941, 0, 1, 1,
0.8631937, 0.2784626, 2.597101, 0.8431373, 0, 1, 1,
0.8638481, -1.63282, 1.459963, 0.8470588, 0, 1, 1,
0.8752697, -0.6474537, 2.94331, 0.854902, 0, 1, 1,
0.8781405, 0.3255516, 1.285502, 0.8588235, 0, 1, 1,
0.8789527, 0.6447753, -0.5877104, 0.8666667, 0, 1, 1,
0.8807881, -0.1409093, 0.8230823, 0.8705882, 0, 1, 1,
0.8830667, 0.8293235, 2.002023, 0.8784314, 0, 1, 1,
0.8892835, 0.489966, 1.088396, 0.8823529, 0, 1, 1,
0.889834, -0.6708221, 2.208621, 0.8901961, 0, 1, 1,
0.897458, 1.420132, -0.3342809, 0.8941177, 0, 1, 1,
0.8980618, -0.786184, 3.470532, 0.9019608, 0, 1, 1,
0.8991603, -0.3770768, 2.426208, 0.9098039, 0, 1, 1,
0.9045706, 0.5966254, 1.250299, 0.9137255, 0, 1, 1,
0.9093816, 1.012059, 1.580237, 0.9215686, 0, 1, 1,
0.9161534, 1.844741, -0.4493404, 0.9254902, 0, 1, 1,
0.9212599, 0.277961, 0.2259569, 0.9333333, 0, 1, 1,
0.9234067, 1.318222, 0.4509648, 0.9372549, 0, 1, 1,
0.9295648, -0.5795998, 4.11265, 0.945098, 0, 1, 1,
0.9367851, -0.7445021, 2.005225, 0.9490196, 0, 1, 1,
0.9420004, 0.4346887, 2.400308, 0.9568627, 0, 1, 1,
0.9427592, 0.6499821, 1.217113, 0.9607843, 0, 1, 1,
0.9526453, 0.458469, 0.9412293, 0.9686275, 0, 1, 1,
0.9683629, -1.316732, 2.383318, 0.972549, 0, 1, 1,
0.9825484, 1.531734, 0.5328267, 0.9803922, 0, 1, 1,
0.9939662, 0.287341, 1.740239, 0.9843137, 0, 1, 1,
0.9970149, 0.244142, 1.127552, 0.9921569, 0, 1, 1,
0.9971217, 0.6357958, 2.097812, 0.9960784, 0, 1, 1,
0.9994276, 1.120126, 0.5539401, 1, 0, 0.9960784, 1,
1.001959, 0.8308946, -0.06721807, 1, 0, 0.9882353, 1,
1.003299, 0.5211256, 3.165597, 1, 0, 0.9843137, 1,
1.003675, -0.07271606, 3.129819, 1, 0, 0.9764706, 1,
1.0058, -0.8196754, -0.03911039, 1, 0, 0.972549, 1,
1.008919, -1.580657, 0.5682791, 1, 0, 0.9647059, 1,
1.0148, 0.2361, 1.853018, 1, 0, 0.9607843, 1,
1.016161, 0.7267845, 1.009627, 1, 0, 0.9529412, 1,
1.028354, -0.5638251, 1.035978, 1, 0, 0.9490196, 1,
1.038339, -0.03096712, 3.436182, 1, 0, 0.9411765, 1,
1.039538, 1.069513, -0.2341256, 1, 0, 0.9372549, 1,
1.044889, 0.04366807, -0.2294945, 1, 0, 0.9294118, 1,
1.046621, -0.1022224, 1.960795, 1, 0, 0.9254902, 1,
1.054928, -0.03176719, 1.440388, 1, 0, 0.9176471, 1,
1.059967, -1.579504, 3.800346, 1, 0, 0.9137255, 1,
1.065998, -0.2567601, 2.627874, 1, 0, 0.9058824, 1,
1.067528, -0.1158321, 1.528328, 1, 0, 0.9019608, 1,
1.068825, 0.2860464, 0.975913, 1, 0, 0.8941177, 1,
1.07147, 0.2405883, -0.08667599, 1, 0, 0.8862745, 1,
1.071613, 0.9370797, 0.1694426, 1, 0, 0.8823529, 1,
1.072129, -0.7940414, 1.787132, 1, 0, 0.8745098, 1,
1.07233, 0.09344818, 1.413001, 1, 0, 0.8705882, 1,
1.073197, -1.199209, 2.387382, 1, 0, 0.8627451, 1,
1.077254, -0.6063646, 3.607636, 1, 0, 0.8588235, 1,
1.078846, 1.008972, 0.7680796, 1, 0, 0.8509804, 1,
1.08118, -1.797301, 3.063158, 1, 0, 0.8470588, 1,
1.083933, -0.6683655, 2.751735, 1, 0, 0.8392157, 1,
1.091123, -0.0225709, 2.369234, 1, 0, 0.8352941, 1,
1.096181, -0.466833, 0.7712693, 1, 0, 0.827451, 1,
1.097294, 0.6675056, 1.604828, 1, 0, 0.8235294, 1,
1.098098, -0.3555141, 3.664907, 1, 0, 0.8156863, 1,
1.100591, -2.766805, 3.657755, 1, 0, 0.8117647, 1,
1.10072, -0.04008726, -0.6718317, 1, 0, 0.8039216, 1,
1.110441, -0.494036, 2.19645, 1, 0, 0.7960784, 1,
1.12225, -1.297306, 2.16862, 1, 0, 0.7921569, 1,
1.130533, 0.8078314, 2.044485, 1, 0, 0.7843137, 1,
1.131749, -0.5379835, 2.429681, 1, 0, 0.7803922, 1,
1.1344, -0.2955908, 1.658858, 1, 0, 0.772549, 1,
1.140818, -1.111231, 1.679244, 1, 0, 0.7686275, 1,
1.146724, -0.7186785, 1.787253, 1, 0, 0.7607843, 1,
1.147264, -0.2109796, 0.4836199, 1, 0, 0.7568628, 1,
1.150015, -1.509149, 2.700086, 1, 0, 0.7490196, 1,
1.151104, -0.7826315, 1.768698, 1, 0, 0.7450981, 1,
1.160833, -0.4384464, 2.594629, 1, 0, 0.7372549, 1,
1.16122, 1.203291, 1.021682, 1, 0, 0.7333333, 1,
1.162607, 0.6013054, 1.279092, 1, 0, 0.7254902, 1,
1.168817, 1.424059, 1.494043, 1, 0, 0.7215686, 1,
1.172558, -0.3259059, 1.019897, 1, 0, 0.7137255, 1,
1.175677, 0.9263626, 1.502153, 1, 0, 0.7098039, 1,
1.185473, 1.308689, 1.806291, 1, 0, 0.7019608, 1,
1.187848, -0.6096011, 3.967289, 1, 0, 0.6941177, 1,
1.19751, 0.8245497, 2.676494, 1, 0, 0.6901961, 1,
1.20785, 1.905917, 1.528246, 1, 0, 0.682353, 1,
1.209264, 1.807778, 0.2774271, 1, 0, 0.6784314, 1,
1.215901, -0.5229198, 0.4242142, 1, 0, 0.6705883, 1,
1.216992, -1.009199, 0.9678791, 1, 0, 0.6666667, 1,
1.22774, -0.6227365, 2.413549, 1, 0, 0.6588235, 1,
1.228935, -0.2691096, 1.630267, 1, 0, 0.654902, 1,
1.230708, -0.7568637, 1.620843, 1, 0, 0.6470588, 1,
1.239012, -0.1221841, 2.246921, 1, 0, 0.6431373, 1,
1.240967, 0.3195631, 1.507737, 1, 0, 0.6352941, 1,
1.244519, -0.0317251, 1.122787, 1, 0, 0.6313726, 1,
1.250394, -1.296005, 3.929488, 1, 0, 0.6235294, 1,
1.254066, 1.20898, 2.844577, 1, 0, 0.6196079, 1,
1.259156, -0.898119, 2.068745, 1, 0, 0.6117647, 1,
1.267169, 0.01249276, 0.9265966, 1, 0, 0.6078432, 1,
1.275112, 0.1444893, 2.087054, 1, 0, 0.6, 1,
1.292084, 0.2089364, 0.4172998, 1, 0, 0.5921569, 1,
1.300977, 1.45745, 0.5213169, 1, 0, 0.5882353, 1,
1.303651, -1.186534, 2.50507, 1, 0, 0.5803922, 1,
1.304743, 1.701419, 0.269304, 1, 0, 0.5764706, 1,
1.313642, 2.333796, -0.7773885, 1, 0, 0.5686275, 1,
1.323818, -0.280993, 0.5439384, 1, 0, 0.5647059, 1,
1.337978, -0.256161, 0.8862783, 1, 0, 0.5568628, 1,
1.338403, -1.303979, 3.175658, 1, 0, 0.5529412, 1,
1.33876, -0.4711884, 1.292641, 1, 0, 0.5450981, 1,
1.343466, -0.3092813, 1.452669, 1, 0, 0.5411765, 1,
1.343917, -0.7611181, 0.5795779, 1, 0, 0.5333334, 1,
1.350493, 1.261281, 1.362732, 1, 0, 0.5294118, 1,
1.351292, 3.000368, 1.429472, 1, 0, 0.5215687, 1,
1.354268, 0.9802972, 1.563273, 1, 0, 0.5176471, 1,
1.356291, -1.069427, 1.233309, 1, 0, 0.509804, 1,
1.358382, 0.995171, -1.088787, 1, 0, 0.5058824, 1,
1.361379, 0.1184043, 0.5643378, 1, 0, 0.4980392, 1,
1.361972, 0.3240275, -0.1897585, 1, 0, 0.4901961, 1,
1.362939, 0.857961, 1.218849, 1, 0, 0.4862745, 1,
1.371143, -0.8571222, 0.2123107, 1, 0, 0.4784314, 1,
1.377277, -0.7973138, 2.719033, 1, 0, 0.4745098, 1,
1.389547, -1.425995, 1.101939, 1, 0, 0.4666667, 1,
1.397589, -2.201387, 2.157024, 1, 0, 0.4627451, 1,
1.402725, 0.9760184, 1.327729, 1, 0, 0.454902, 1,
1.402948, -1.711858, 0.3694555, 1, 0, 0.4509804, 1,
1.402995, -0.3294406, 1.817647, 1, 0, 0.4431373, 1,
1.404321, 0.9939334, -1.185424, 1, 0, 0.4392157, 1,
1.409225, 0.421905, 1.728892, 1, 0, 0.4313726, 1,
1.415162, 0.1985529, 1.719489, 1, 0, 0.427451, 1,
1.416406, 0.6089007, -0.4854205, 1, 0, 0.4196078, 1,
1.417798, 0.576923, 0.2145238, 1, 0, 0.4156863, 1,
1.435739, 1.273002, -0.4913004, 1, 0, 0.4078431, 1,
1.437159, -1.854581, 1.916223, 1, 0, 0.4039216, 1,
1.440813, -0.3273087, 2.215998, 1, 0, 0.3960784, 1,
1.442798, -1.687999, 2.724391, 1, 0, 0.3882353, 1,
1.443855, 1.277342, 0.07852538, 1, 0, 0.3843137, 1,
1.447809, 1.493549, 0.6600044, 1, 0, 0.3764706, 1,
1.453467, 1.116728, 0.76809, 1, 0, 0.372549, 1,
1.492538, -0.7435379, 1.928845, 1, 0, 0.3647059, 1,
1.498605, 1.299081, 2.187067, 1, 0, 0.3607843, 1,
1.49999, -1.786823, 3.295688, 1, 0, 0.3529412, 1,
1.505504, -0.003351828, 1.314172, 1, 0, 0.3490196, 1,
1.509563, 1.669758, 1.223029, 1, 0, 0.3411765, 1,
1.511602, 0.659095, 1.204413, 1, 0, 0.3372549, 1,
1.515788, 1.039706, 1.161203, 1, 0, 0.3294118, 1,
1.521714, 0.5196276, 0.5718767, 1, 0, 0.3254902, 1,
1.532499, -0.1766719, 4.01897, 1, 0, 0.3176471, 1,
1.54511, -0.03082308, 0.7242786, 1, 0, 0.3137255, 1,
1.547596, -0.1991208, 0.2920491, 1, 0, 0.3058824, 1,
1.548729, -0.9834719, 3.429796, 1, 0, 0.2980392, 1,
1.558308, -1.076857, 2.905165, 1, 0, 0.2941177, 1,
1.559121, -0.8062004, 1.921718, 1, 0, 0.2862745, 1,
1.562075, -0.1172722, -0.8896787, 1, 0, 0.282353, 1,
1.569954, 1.449678, 1.328556, 1, 0, 0.2745098, 1,
1.575667, 3.231345, 0.4426925, 1, 0, 0.2705882, 1,
1.592251, 0.1610576, 2.872437, 1, 0, 0.2627451, 1,
1.624052, -0.3234276, 1.502341, 1, 0, 0.2588235, 1,
1.62972, 0.9431249, 0.04123603, 1, 0, 0.2509804, 1,
1.630952, 0.7994184, 3.518906, 1, 0, 0.2470588, 1,
1.639716, 0.1077273, 0.7811207, 1, 0, 0.2392157, 1,
1.69351, -0.9671737, 2.05314, 1, 0, 0.2352941, 1,
1.699405, -1.208154, 2.976484, 1, 0, 0.227451, 1,
1.728189, -0.3884387, 1.64027, 1, 0, 0.2235294, 1,
1.735583, -0.8771183, 1.187917, 1, 0, 0.2156863, 1,
1.735758, 0.812826, 1.599843, 1, 0, 0.2117647, 1,
1.739243, -0.8107781, 1.691108, 1, 0, 0.2039216, 1,
1.76546, -0.9685983, 2.999732, 1, 0, 0.1960784, 1,
1.769415, -0.4912604, 2.13759, 1, 0, 0.1921569, 1,
1.800993, 0.6152386, 3.284714, 1, 0, 0.1843137, 1,
1.814903, 1.125864, 1.35875, 1, 0, 0.1803922, 1,
1.857465, 0.2012488, 1.242146, 1, 0, 0.172549, 1,
1.868444, 1.351177, 0.9628815, 1, 0, 0.1686275, 1,
1.876764, -1.467836, 2.592496, 1, 0, 0.1607843, 1,
1.926428, 0.3326073, 1.128975, 1, 0, 0.1568628, 1,
1.927423, 0.8037632, 1.092604, 1, 0, 0.1490196, 1,
1.93149, 0.02632549, 3.20697, 1, 0, 0.145098, 1,
2.025415, 0.4163071, 0.9021293, 1, 0, 0.1372549, 1,
2.030696, -1.070196, 2.019865, 1, 0, 0.1333333, 1,
2.051234, 1.438782, 0.4031925, 1, 0, 0.1254902, 1,
2.054837, -0.5985109, 3.794183, 1, 0, 0.1215686, 1,
2.058759, 0.2310403, -0.3159471, 1, 0, 0.1137255, 1,
2.065368, -0.8679759, 1.087116, 1, 0, 0.1098039, 1,
2.070235, 0.6891866, 0.2655829, 1, 0, 0.1019608, 1,
2.099185, 1.07545, 0.360576, 1, 0, 0.09411765, 1,
2.120851, 0.8965497, 1.319601, 1, 0, 0.09019608, 1,
2.124547, 0.4476629, 0.7292047, 1, 0, 0.08235294, 1,
2.151103, -1.18534, 1.370344, 1, 0, 0.07843138, 1,
2.169997, 0.4899974, 1.293241, 1, 0, 0.07058824, 1,
2.185234, 0.3535369, 1.703466, 1, 0, 0.06666667, 1,
2.191049, 0.01374908, 1.647239, 1, 0, 0.05882353, 1,
2.209529, 0.3430161, 0.6485088, 1, 0, 0.05490196, 1,
2.237425, 0.4437388, 2.751317, 1, 0, 0.04705882, 1,
2.295631, 0.7237266, 0.7296423, 1, 0, 0.04313726, 1,
2.295946, -1.619968, 1.850468, 1, 0, 0.03529412, 1,
2.444948, -0.06422143, -0.5883988, 1, 0, 0.03137255, 1,
2.461199, -0.02423051, 1.123636, 1, 0, 0.02352941, 1,
2.467474, -1.692028, 1.344071, 1, 0, 0.01960784, 1,
2.472215, -0.2829821, 2.54739, 1, 0, 0.01176471, 1,
3.10945, 0.1293438, 0.8040364, 1, 0, 0.007843138, 1
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
-0.2572895, -3.903425, -6.850948, 0, -0.5, 0.5, 0.5,
-0.2572895, -3.903425, -6.850948, 1, -0.5, 0.5, 0.5,
-0.2572895, -3.903425, -6.850948, 1, 1.5, 0.5, 0.5,
-0.2572895, -3.903425, -6.850948, 0, 1.5, 0.5, 0.5
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
-4.765354, 0.1809946, -6.850948, 0, -0.5, 0.5, 0.5,
-4.765354, 0.1809946, -6.850948, 1, -0.5, 0.5, 0.5,
-4.765354, 0.1809946, -6.850948, 1, 1.5, 0.5, 0.5,
-4.765354, 0.1809946, -6.850948, 0, 1.5, 0.5, 0.5
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
-4.765354, -3.903425, -0.3218904, 0, -0.5, 0.5, 0.5,
-4.765354, -3.903425, -0.3218904, 1, -0.5, 0.5, 0.5,
-4.765354, -3.903425, -0.3218904, 1, 1.5, 0.5, 0.5,
-4.765354, -3.903425, -0.3218904, 0, 1.5, 0.5, 0.5
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
-3, -2.960866, -5.344243,
3, -2.960866, -5.344243,
-3, -2.960866, -5.344243,
-3, -3.117959, -5.59536,
-2, -2.960866, -5.344243,
-2, -3.117959, -5.59536,
-1, -2.960866, -5.344243,
-1, -3.117959, -5.59536,
0, -2.960866, -5.344243,
0, -3.117959, -5.59536,
1, -2.960866, -5.344243,
1, -3.117959, -5.59536,
2, -2.960866, -5.344243,
2, -3.117959, -5.59536,
3, -2.960866, -5.344243,
3, -3.117959, -5.59536
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
-3, -3.432145, -6.097595, 0, -0.5, 0.5, 0.5,
-3, -3.432145, -6.097595, 1, -0.5, 0.5, 0.5,
-3, -3.432145, -6.097595, 1, 1.5, 0.5, 0.5,
-3, -3.432145, -6.097595, 0, 1.5, 0.5, 0.5,
-2, -3.432145, -6.097595, 0, -0.5, 0.5, 0.5,
-2, -3.432145, -6.097595, 1, -0.5, 0.5, 0.5,
-2, -3.432145, -6.097595, 1, 1.5, 0.5, 0.5,
-2, -3.432145, -6.097595, 0, 1.5, 0.5, 0.5,
-1, -3.432145, -6.097595, 0, -0.5, 0.5, 0.5,
-1, -3.432145, -6.097595, 1, -0.5, 0.5, 0.5,
-1, -3.432145, -6.097595, 1, 1.5, 0.5, 0.5,
-1, -3.432145, -6.097595, 0, 1.5, 0.5, 0.5,
0, -3.432145, -6.097595, 0, -0.5, 0.5, 0.5,
0, -3.432145, -6.097595, 1, -0.5, 0.5, 0.5,
0, -3.432145, -6.097595, 1, 1.5, 0.5, 0.5,
0, -3.432145, -6.097595, 0, 1.5, 0.5, 0.5,
1, -3.432145, -6.097595, 0, -0.5, 0.5, 0.5,
1, -3.432145, -6.097595, 1, -0.5, 0.5, 0.5,
1, -3.432145, -6.097595, 1, 1.5, 0.5, 0.5,
1, -3.432145, -6.097595, 0, 1.5, 0.5, 0.5,
2, -3.432145, -6.097595, 0, -0.5, 0.5, 0.5,
2, -3.432145, -6.097595, 1, -0.5, 0.5, 0.5,
2, -3.432145, -6.097595, 1, 1.5, 0.5, 0.5,
2, -3.432145, -6.097595, 0, 1.5, 0.5, 0.5,
3, -3.432145, -6.097595, 0, -0.5, 0.5, 0.5,
3, -3.432145, -6.097595, 1, -0.5, 0.5, 0.5,
3, -3.432145, -6.097595, 1, 1.5, 0.5, 0.5,
3, -3.432145, -6.097595, 0, 1.5, 0.5, 0.5
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
-3.725031, -2, -5.344243,
-3.725031, 3, -5.344243,
-3.725031, -2, -5.344243,
-3.898418, -2, -5.59536,
-3.725031, -1, -5.344243,
-3.898418, -1, -5.59536,
-3.725031, 0, -5.344243,
-3.898418, 0, -5.59536,
-3.725031, 1, -5.344243,
-3.898418, 1, -5.59536,
-3.725031, 2, -5.344243,
-3.898418, 2, -5.59536,
-3.725031, 3, -5.344243,
-3.898418, 3, -5.59536
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
-4.245193, -2, -6.097595, 0, -0.5, 0.5, 0.5,
-4.245193, -2, -6.097595, 1, -0.5, 0.5, 0.5,
-4.245193, -2, -6.097595, 1, 1.5, 0.5, 0.5,
-4.245193, -2, -6.097595, 0, 1.5, 0.5, 0.5,
-4.245193, -1, -6.097595, 0, -0.5, 0.5, 0.5,
-4.245193, -1, -6.097595, 1, -0.5, 0.5, 0.5,
-4.245193, -1, -6.097595, 1, 1.5, 0.5, 0.5,
-4.245193, -1, -6.097595, 0, 1.5, 0.5, 0.5,
-4.245193, 0, -6.097595, 0, -0.5, 0.5, 0.5,
-4.245193, 0, -6.097595, 1, -0.5, 0.5, 0.5,
-4.245193, 0, -6.097595, 1, 1.5, 0.5, 0.5,
-4.245193, 0, -6.097595, 0, 1.5, 0.5, 0.5,
-4.245193, 1, -6.097595, 0, -0.5, 0.5, 0.5,
-4.245193, 1, -6.097595, 1, -0.5, 0.5, 0.5,
-4.245193, 1, -6.097595, 1, 1.5, 0.5, 0.5,
-4.245193, 1, -6.097595, 0, 1.5, 0.5, 0.5,
-4.245193, 2, -6.097595, 0, -0.5, 0.5, 0.5,
-4.245193, 2, -6.097595, 1, -0.5, 0.5, 0.5,
-4.245193, 2, -6.097595, 1, 1.5, 0.5, 0.5,
-4.245193, 2, -6.097595, 0, 1.5, 0.5, 0.5,
-4.245193, 3, -6.097595, 0, -0.5, 0.5, 0.5,
-4.245193, 3, -6.097595, 1, -0.5, 0.5, 0.5,
-4.245193, 3, -6.097595, 1, 1.5, 0.5, 0.5,
-4.245193, 3, -6.097595, 0, 1.5, 0.5, 0.5
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
-3.725031, -2.960866, -4,
-3.725031, -2.960866, 4,
-3.725031, -2.960866, -4,
-3.898418, -3.117959, -4,
-3.725031, -2.960866, -2,
-3.898418, -3.117959, -2,
-3.725031, -2.960866, 0,
-3.898418, -3.117959, 0,
-3.725031, -2.960866, 2,
-3.898418, -3.117959, 2,
-3.725031, -2.960866, 4,
-3.898418, -3.117959, 4
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
-4.245193, -3.432145, -4, 0, -0.5, 0.5, 0.5,
-4.245193, -3.432145, -4, 1, -0.5, 0.5, 0.5,
-4.245193, -3.432145, -4, 1, 1.5, 0.5, 0.5,
-4.245193, -3.432145, -4, 0, 1.5, 0.5, 0.5,
-4.245193, -3.432145, -2, 0, -0.5, 0.5, 0.5,
-4.245193, -3.432145, -2, 1, -0.5, 0.5, 0.5,
-4.245193, -3.432145, -2, 1, 1.5, 0.5, 0.5,
-4.245193, -3.432145, -2, 0, 1.5, 0.5, 0.5,
-4.245193, -3.432145, 0, 0, -0.5, 0.5, 0.5,
-4.245193, -3.432145, 0, 1, -0.5, 0.5, 0.5,
-4.245193, -3.432145, 0, 1, 1.5, 0.5, 0.5,
-4.245193, -3.432145, 0, 0, 1.5, 0.5, 0.5,
-4.245193, -3.432145, 2, 0, -0.5, 0.5, 0.5,
-4.245193, -3.432145, 2, 1, -0.5, 0.5, 0.5,
-4.245193, -3.432145, 2, 1, 1.5, 0.5, 0.5,
-4.245193, -3.432145, 2, 0, 1.5, 0.5, 0.5,
-4.245193, -3.432145, 4, 0, -0.5, 0.5, 0.5,
-4.245193, -3.432145, 4, 1, -0.5, 0.5, 0.5,
-4.245193, -3.432145, 4, 1, 1.5, 0.5, 0.5,
-4.245193, -3.432145, 4, 0, 1.5, 0.5, 0.5
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
-3.725031, -2.960866, -5.344243,
-3.725031, 3.322855, -5.344243,
-3.725031, -2.960866, 4.700462,
-3.725031, 3.322855, 4.700462,
-3.725031, -2.960866, -5.344243,
-3.725031, -2.960866, 4.700462,
-3.725031, 3.322855, -5.344243,
-3.725031, 3.322855, 4.700462,
-3.725031, -2.960866, -5.344243,
3.210452, -2.960866, -5.344243,
-3.725031, -2.960866, 4.700462,
3.210452, -2.960866, 4.700462,
-3.725031, 3.322855, -5.344243,
3.210452, 3.322855, -5.344243,
-3.725031, 3.322855, 4.700462,
3.210452, 3.322855, 4.700462,
3.210452, -2.960866, -5.344243,
3.210452, 3.322855, -5.344243,
3.210452, -2.960866, 4.700462,
3.210452, 3.322855, 4.700462,
3.210452, -2.960866, -5.344243,
3.210452, -2.960866, 4.700462,
3.210452, 3.322855, -5.344243,
3.210452, 3.322855, 4.700462
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
var radius = 7.330956;
var distance = 32.61625;
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
mvMatrix.translate( 0.2572895, -0.1809946, 0.3218904 );
mvMatrix.scale( 1.142872, 1.261414, 0.7891096 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.61625);
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
dimepiperate<-read.table("dimepiperate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimepiperate$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimepiperate' not found
```

```r
y<-dimepiperate$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimepiperate' not found
```

```r
z<-dimepiperate$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimepiperate' not found
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
-3.624029, -0.6913193, -1.245838, 0, 0, 1, 1, 1,
-3.193678, -1.477568, -2.157823, 1, 0, 0, 1, 1,
-2.867969, -0.3643684, -2.762083, 1, 0, 0, 1, 1,
-2.756659, -0.8784918, -1.236992, 1, 0, 0, 1, 1,
-2.721727, -0.283594, -2.090708, 1, 0, 0, 1, 1,
-2.676211, 1.00607, -1.249846, 1, 0, 0, 1, 1,
-2.665257, 0.1832089, -0.1846475, 0, 0, 0, 1, 1,
-2.634087, -0.6089014, -3.405989, 0, 0, 0, 1, 1,
-2.595945, 0.5299231, 0.3688661, 0, 0, 0, 1, 1,
-2.551826, 1.176607, -2.10811, 0, 0, 0, 1, 1,
-2.534596, -0.5617211, -2.552256, 0, 0, 0, 1, 1,
-2.47333, -0.7975093, -3.830789, 0, 0, 0, 1, 1,
-2.432855, 0.9308385, -0.07684989, 0, 0, 0, 1, 1,
-2.419051, 1.561867, -0.9545961, 1, 1, 1, 1, 1,
-2.406596, -0.11645, -0.8550268, 1, 1, 1, 1, 1,
-2.321635, -0.6451593, -1.788409, 1, 1, 1, 1, 1,
-2.269293, 0.1822413, -1.796687, 1, 1, 1, 1, 1,
-2.168025, 0.06906346, -1.879628, 1, 1, 1, 1, 1,
-2.130702, 0.8937113, 0.3481217, 1, 1, 1, 1, 1,
-2.127319, 0.8695496, -1.786302, 1, 1, 1, 1, 1,
-2.05726, 0.7414197, -0.7494754, 1, 1, 1, 1, 1,
-1.943121, -0.03980746, -1.756668, 1, 1, 1, 1, 1,
-1.934683, -0.1024723, -1.602364, 1, 1, 1, 1, 1,
-1.929206, -1.161917, -1.193258, 1, 1, 1, 1, 1,
-1.926013, 0.4034121, -0.9845827, 1, 1, 1, 1, 1,
-1.90001, -2.18774, -2.100586, 1, 1, 1, 1, 1,
-1.887763, -0.5003006, -2.241929, 1, 1, 1, 1, 1,
-1.877022, -0.3733209, -0.206097, 1, 1, 1, 1, 1,
-1.845746, -0.8880772, -0.9870434, 0, 0, 1, 1, 1,
-1.829343, 0.896606, -1.567197, 1, 0, 0, 1, 1,
-1.82276, -0.2428907, -0.5810425, 1, 0, 0, 1, 1,
-1.804301, -0.4325171, -1.302945, 1, 0, 0, 1, 1,
-1.792596, -0.2446968, -3.038608, 1, 0, 0, 1, 1,
-1.786468, 0.1502321, -1.898804, 1, 0, 0, 1, 1,
-1.786239, -1.109608, -2.135243, 0, 0, 0, 1, 1,
-1.765248, -0.1146573, -0.9745971, 0, 0, 0, 1, 1,
-1.762918, 1.215296, -0.09282569, 0, 0, 0, 1, 1,
-1.760254, 1.092843, -0.06790135, 0, 0, 0, 1, 1,
-1.759077, -0.9545103, -3.006589, 0, 0, 0, 1, 1,
-1.745556, 0.168231, -2.473243, 0, 0, 0, 1, 1,
-1.740546, -1.242834, -2.138873, 0, 0, 0, 1, 1,
-1.731261, -0.007163679, -0.5566648, 1, 1, 1, 1, 1,
-1.727333, -0.4953373, -0.6111659, 1, 1, 1, 1, 1,
-1.701535, 0.9842261, -0.03498207, 1, 1, 1, 1, 1,
-1.694722, 2.260182, -0.1169832, 1, 1, 1, 1, 1,
-1.684548, -1.3923, -2.202288, 1, 1, 1, 1, 1,
-1.670618, -0.454722, -1.449615, 1, 1, 1, 1, 1,
-1.667499, -0.008425605, -1.09476, 1, 1, 1, 1, 1,
-1.612625, -1.073945, -2.023574, 1, 1, 1, 1, 1,
-1.601863, -0.2215067, -1.864436, 1, 1, 1, 1, 1,
-1.597057, 0.8171318, -1.39083, 1, 1, 1, 1, 1,
-1.595513, 0.8151501, -2.439134, 1, 1, 1, 1, 1,
-1.588498, -1.293384, -1.103718, 1, 1, 1, 1, 1,
-1.556476, 1.137117, -0.3437513, 1, 1, 1, 1, 1,
-1.543686, -0.9790681, -2.179401, 1, 1, 1, 1, 1,
-1.530119, -2.205131, -2.945994, 1, 1, 1, 1, 1,
-1.511407, 1.099066, -0.06910715, 0, 0, 1, 1, 1,
-1.494863, -0.5234647, -1.226978, 1, 0, 0, 1, 1,
-1.492803, 0.2742355, -1.98782, 1, 0, 0, 1, 1,
-1.482538, -2.3975, -2.78185, 1, 0, 0, 1, 1,
-1.476484, 0.4002177, -1.178811, 1, 0, 0, 1, 1,
-1.474245, 0.1066014, -2.355703, 1, 0, 0, 1, 1,
-1.471191, -1.191899, -2.185273, 0, 0, 0, 1, 1,
-1.460411, 0.101563, -1.72204, 0, 0, 0, 1, 1,
-1.450841, 0.6871361, -1.256548, 0, 0, 0, 1, 1,
-1.449093, -1.559431, -2.772829, 0, 0, 0, 1, 1,
-1.448094, 1.463173, 0.6002381, 0, 0, 0, 1, 1,
-1.446752, 1.440311, 0.3784995, 0, 0, 0, 1, 1,
-1.442643, -1.131478, -1.882463, 0, 0, 0, 1, 1,
-1.439249, 1.417484, 0.5801071, 1, 1, 1, 1, 1,
-1.438823, -0.8911208, -1.168023, 1, 1, 1, 1, 1,
-1.432877, -0.8746776, -1.812348, 1, 1, 1, 1, 1,
-1.403976, 0.9342011, -0.7327777, 1, 1, 1, 1, 1,
-1.397555, -2.363136, -4.39754, 1, 1, 1, 1, 1,
-1.383755, 0.9228705, 0.5769907, 1, 1, 1, 1, 1,
-1.383731, -0.4116995, -2.61559, 1, 1, 1, 1, 1,
-1.382624, -0.04788774, -1.14661, 1, 1, 1, 1, 1,
-1.38221, -1.003721, -1.258699, 1, 1, 1, 1, 1,
-1.381403, 0.1726997, -0.430885, 1, 1, 1, 1, 1,
-1.3668, 1.551564, 0.09465691, 1, 1, 1, 1, 1,
-1.365219, -0.7628627, -2.295972, 1, 1, 1, 1, 1,
-1.358477, -0.4577138, -2.033667, 1, 1, 1, 1, 1,
-1.356256, 1.441094, -1.206767, 1, 1, 1, 1, 1,
-1.35585, -0.3259256, -1.848122, 1, 1, 1, 1, 1,
-1.344566, 1.967101, -0.6943401, 0, 0, 1, 1, 1,
-1.336876, 0.1734836, -3.548958, 1, 0, 0, 1, 1,
-1.331087, -0.7615413, -2.366061, 1, 0, 0, 1, 1,
-1.325628, -0.02287133, -0.4882618, 1, 0, 0, 1, 1,
-1.324826, -1.510496, -2.488632, 1, 0, 0, 1, 1,
-1.315621, -1.029151, -1.841416, 1, 0, 0, 1, 1,
-1.305315, 0.823683, 0.6183919, 0, 0, 0, 1, 1,
-1.301881, -1.846287, -2.035398, 0, 0, 0, 1, 1,
-1.300891, 0.05505137, -0.9773585, 0, 0, 0, 1, 1,
-1.298362, -0.3102088, -2.823682, 0, 0, 0, 1, 1,
-1.295528, 0.5258752, -1.201099, 0, 0, 0, 1, 1,
-1.292514, 0.1074905, 0.9935057, 0, 0, 0, 1, 1,
-1.291862, 0.4720287, -2.200694, 0, 0, 0, 1, 1,
-1.271205, 1.640435, 0.1531741, 1, 1, 1, 1, 1,
-1.270535, 0.7548428, -1.224744, 1, 1, 1, 1, 1,
-1.270344, -0.02286775, -1.980313, 1, 1, 1, 1, 1,
-1.254084, 0.2535486, -0.8279335, 1, 1, 1, 1, 1,
-1.244809, 0.9748796, 0.5629538, 1, 1, 1, 1, 1,
-1.242557, -0.009562174, -1.174865, 1, 1, 1, 1, 1,
-1.235937, -0.5293403, -1.554648, 1, 1, 1, 1, 1,
-1.231146, 0.839123, -2.406496, 1, 1, 1, 1, 1,
-1.225426, 0.8391299, -1.672986, 1, 1, 1, 1, 1,
-1.220347, 1.264959, -2.174222, 1, 1, 1, 1, 1,
-1.217883, 0.6692067, -1.994403, 1, 1, 1, 1, 1,
-1.205538, 0.6677354, -1.618201, 1, 1, 1, 1, 1,
-1.195762, 0.4601314, -2.312083, 1, 1, 1, 1, 1,
-1.194025, 0.7032992, -2.243729, 1, 1, 1, 1, 1,
-1.192588, 0.04047988, -1.557734, 1, 1, 1, 1, 1,
-1.190789, 0.4707415, -0.1550893, 0, 0, 1, 1, 1,
-1.190173, 0.8495479, -1.369947, 1, 0, 0, 1, 1,
-1.189274, 0.372553, -0.4476728, 1, 0, 0, 1, 1,
-1.188746, -1.176713, -2.477815, 1, 0, 0, 1, 1,
-1.176544, -0.08473963, -1.135098, 1, 0, 0, 1, 1,
-1.176079, 2.027298, -0.2810961, 1, 0, 0, 1, 1,
-1.165793, 0.2799363, -0.5541289, 0, 0, 0, 1, 1,
-1.161097, 2.766345, -2.464224, 0, 0, 0, 1, 1,
-1.158563, -0.1586976, -2.508939, 0, 0, 0, 1, 1,
-1.148604, 0.13319, -1.722767, 0, 0, 0, 1, 1,
-1.133898, -1.466239, -2.085675, 0, 0, 0, 1, 1,
-1.127723, 0.9074259, -0.907632, 0, 0, 0, 1, 1,
-1.127591, -1.468664, -2.276556, 0, 0, 0, 1, 1,
-1.118123, 0.4865498, -2.427375, 1, 1, 1, 1, 1,
-1.11004, -1.115906, -3.084318, 1, 1, 1, 1, 1,
-1.10622, 0.662137, -1.01779, 1, 1, 1, 1, 1,
-1.103745, -0.3717678, -2.335528, 1, 1, 1, 1, 1,
-1.10358, -1.090527, -1.83463, 1, 1, 1, 1, 1,
-1.095464, -0.4895204, -1.683064, 1, 1, 1, 1, 1,
-1.086921, -1.07457, -3.812584, 1, 1, 1, 1, 1,
-1.079836, -0.3585748, -2.079953, 1, 1, 1, 1, 1,
-1.077463, 2.647632, -1.525536, 1, 1, 1, 1, 1,
-1.076889, 1.045094, -1.781855, 1, 1, 1, 1, 1,
-1.070964, 0.2715422, -3.682625, 1, 1, 1, 1, 1,
-1.068943, -0.5599205, -0.9792145, 1, 1, 1, 1, 1,
-1.060951, -0.1031187, -0.9143515, 1, 1, 1, 1, 1,
-1.059512, -1.433327, -1.238381, 1, 1, 1, 1, 1,
-1.046293, 1.173643, -0.5750658, 1, 1, 1, 1, 1,
-1.039249, -0.7655546, -1.06162, 0, 0, 1, 1, 1,
-1.039243, 0.6588724, -1.708159, 1, 0, 0, 1, 1,
-1.031001, -0.4412875, -2.742683, 1, 0, 0, 1, 1,
-1.02831, 1.830008, 0.8816609, 1, 0, 0, 1, 1,
-1.017026, 1.394017, -0.8759944, 1, 0, 0, 1, 1,
-1.016283, -0.09817169, -1.512256, 1, 0, 0, 1, 1,
-1.0127, -0.6577597, -0.1574448, 0, 0, 0, 1, 1,
-1.010743, 0.5353293, -0.4155799, 0, 0, 0, 1, 1,
-1.007667, 1.600331, -0.1764537, 0, 0, 0, 1, 1,
-1.006016, -0.0897358, -2.584342, 0, 0, 0, 1, 1,
-1.00581, -0.01333758, -1.462024, 0, 0, 0, 1, 1,
-1.005228, -1.585593, -2.604493, 0, 0, 0, 1, 1,
-0.999657, -0.9360331, -1.874788, 0, 0, 0, 1, 1,
-0.9975851, 1.573282, -0.5163893, 1, 1, 1, 1, 1,
-0.9950336, 0.5640129, -0.8795414, 1, 1, 1, 1, 1,
-0.9925979, 0.7344707, 0.7332852, 1, 1, 1, 1, 1,
-0.9893724, 1.496053, -2.220061, 1, 1, 1, 1, 1,
-0.9883779, -0.1325151, -0.834675, 1, 1, 1, 1, 1,
-0.9876052, -0.5903331, -0.7252647, 1, 1, 1, 1, 1,
-0.9865078, -0.1661287, 1.232575, 1, 1, 1, 1, 1,
-0.9822373, 0.03190881, -2.939917, 1, 1, 1, 1, 1,
-0.9797535, -0.9582341, -2.277321, 1, 1, 1, 1, 1,
-0.9765835, 0.4383951, -1.938558, 1, 1, 1, 1, 1,
-0.9711238, 0.1959026, -0.6550696, 1, 1, 1, 1, 1,
-0.9701502, -0.3906152, -0.9951009, 1, 1, 1, 1, 1,
-0.96935, -0.6743426, -1.421649, 1, 1, 1, 1, 1,
-0.9688991, 1.171603, -0.443254, 1, 1, 1, 1, 1,
-0.962034, 0.4998357, -0.9908737, 1, 1, 1, 1, 1,
-0.9613259, -0.2615047, -2.109372, 0, 0, 1, 1, 1,
-0.9553054, 0.2310029, -0.9097512, 1, 0, 0, 1, 1,
-0.9550081, 1.247794, 0.05821434, 1, 0, 0, 1, 1,
-0.9412137, -0.8715193, -2.351728, 1, 0, 0, 1, 1,
-0.9313243, -0.06896313, -3.218471, 1, 0, 0, 1, 1,
-0.9294432, 0.4554307, -1.010314, 1, 0, 0, 1, 1,
-0.9262776, 0.4658865, -0.6392772, 0, 0, 0, 1, 1,
-0.925047, -2.223477, -1.893649, 0, 0, 0, 1, 1,
-0.9228337, 0.1555815, -2.539198, 0, 0, 0, 1, 1,
-0.9223714, -0.3467283, 0.1397054, 0, 0, 0, 1, 1,
-0.9221773, -0.4587711, -2.203677, 0, 0, 0, 1, 1,
-0.9215382, 1.801605, -3.307753, 0, 0, 0, 1, 1,
-0.9214936, -1.998633, -0.9355827, 0, 0, 0, 1, 1,
-0.9190784, 0.5028179, -1.727214, 1, 1, 1, 1, 1,
-0.9130707, 2.376789, -1.236559, 1, 1, 1, 1, 1,
-0.9062746, -0.8743771, -1.63029, 1, 1, 1, 1, 1,
-0.9045834, 1.761121, -0.2199276, 1, 1, 1, 1, 1,
-0.899371, 1.454507, -2.481561, 1, 1, 1, 1, 1,
-0.8931429, 1.869508, 1.030801, 1, 1, 1, 1, 1,
-0.8927583, -1.346133, -1.800547, 1, 1, 1, 1, 1,
-0.8905566, 0.7206545, -0.64363, 1, 1, 1, 1, 1,
-0.8899313, -0.4516355, -2.800877, 1, 1, 1, 1, 1,
-0.8827469, 0.5854606, -1.099388, 1, 1, 1, 1, 1,
-0.8827158, -0.3104626, -1.762351, 1, 1, 1, 1, 1,
-0.8709899, -1.644984, -2.357827, 1, 1, 1, 1, 1,
-0.8696061, 0.7658864, -2.293109, 1, 1, 1, 1, 1,
-0.8657063, 0.6897772, 0.1789095, 1, 1, 1, 1, 1,
-0.8643697, -0.9676718, -2.866032, 1, 1, 1, 1, 1,
-0.8630683, -1.025196, -3.769422, 0, 0, 1, 1, 1,
-0.8601427, -0.7024169, -1.220903, 1, 0, 0, 1, 1,
-0.8600498, 0.2914643, -1.91094, 1, 0, 0, 1, 1,
-0.8591038, 1.657095, 0.03683335, 1, 0, 0, 1, 1,
-0.8575635, -0.9476866, -0.07092483, 1, 0, 0, 1, 1,
-0.8483332, 0.3349659, 0.48079, 1, 0, 0, 1, 1,
-0.8436835, -0.569507, -1.68948, 0, 0, 0, 1, 1,
-0.8427521, -0.01872102, -1.810476, 0, 0, 0, 1, 1,
-0.8386273, 0.344705, -2.656137, 0, 0, 0, 1, 1,
-0.8333547, -1.033165, -2.96729, 0, 0, 0, 1, 1,
-0.8273525, -0.5032609, -3.157642, 0, 0, 0, 1, 1,
-0.825527, -2.565626, -1.469997, 0, 0, 0, 1, 1,
-0.8253429, -1.387356, -1.448357, 0, 0, 0, 1, 1,
-0.8247065, -0.4671177, -3.694754, 1, 1, 1, 1, 1,
-0.822799, 0.2232838, 0.5286637, 1, 1, 1, 1, 1,
-0.8202804, 0.8772954, -1.365012, 1, 1, 1, 1, 1,
-0.8171949, 0.5887764, -0.956239, 1, 1, 1, 1, 1,
-0.8092809, 1.278212, -1.272695, 1, 1, 1, 1, 1,
-0.8066744, 0.6964026, -1.204594, 1, 1, 1, 1, 1,
-0.8022171, 0.7852125, -1.986945, 1, 1, 1, 1, 1,
-0.7854208, 0.03848794, -1.756646, 1, 1, 1, 1, 1,
-0.784874, -0.01530791, -1.418397, 1, 1, 1, 1, 1,
-0.7730434, 0.9593208, -0.5309017, 1, 1, 1, 1, 1,
-0.7691818, 2.294533, -0.8784997, 1, 1, 1, 1, 1,
-0.7654463, -0.5029851, -4.300709, 1, 1, 1, 1, 1,
-0.7623876, 1.279386, -1.828774, 1, 1, 1, 1, 1,
-0.7535588, -0.7108741, -2.548558, 1, 1, 1, 1, 1,
-0.7524228, -0.2332584, -1.476692, 1, 1, 1, 1, 1,
-0.7508644, 0.09877227, -1.493139, 0, 0, 1, 1, 1,
-0.7483829, -0.1842469, -1.162254, 1, 0, 0, 1, 1,
-0.7478116, 0.6123637, -1.09819, 1, 0, 0, 1, 1,
-0.7473992, 1.490967, -0.4914205, 1, 0, 0, 1, 1,
-0.7457554, -0.7814998, -2.304603, 1, 0, 0, 1, 1,
-0.7411302, 0.4623008, -1.880091, 1, 0, 0, 1, 1,
-0.7316551, 1.513297, 0.8751381, 0, 0, 0, 1, 1,
-0.7287107, 0.7880942, -1.435997, 0, 0, 0, 1, 1,
-0.7236041, -0.01188093, -1.704826, 0, 0, 0, 1, 1,
-0.7183351, 0.1794294, -2.424359, 0, 0, 0, 1, 1,
-0.7110369, -0.8548247, -2.619416, 0, 0, 0, 1, 1,
-0.7047022, 1.263458, 0.3297028, 0, 0, 0, 1, 1,
-0.703802, 0.8762558, 0.4701458, 0, 0, 0, 1, 1,
-0.6995724, 0.4211505, 0.1409253, 1, 1, 1, 1, 1,
-0.6991888, 1.481455, -1.183351, 1, 1, 1, 1, 1,
-0.6912429, 0.4750861, -1.330998, 1, 1, 1, 1, 1,
-0.6898525, -2.298283, -2.086254, 1, 1, 1, 1, 1,
-0.6887259, -0.2251526, -2.109497, 1, 1, 1, 1, 1,
-0.6854675, -0.1149763, -0.812782, 1, 1, 1, 1, 1,
-0.683695, 1.850528, 0.2820445, 1, 1, 1, 1, 1,
-0.6818581, -0.5624894, -2.204207, 1, 1, 1, 1, 1,
-0.6816134, 2.642934, 0.6557462, 1, 1, 1, 1, 1,
-0.6796204, -1.515503, -2.008612, 1, 1, 1, 1, 1,
-0.6787035, -1.837164, -2.804932, 1, 1, 1, 1, 1,
-0.6779597, 0.1685559, -0.09878451, 1, 1, 1, 1, 1,
-0.6712066, -0.4718504, -3.580334, 1, 1, 1, 1, 1,
-0.6685154, -0.2772341, -3.290707, 1, 1, 1, 1, 1,
-0.663552, 1.959877, 1.41967, 1, 1, 1, 1, 1,
-0.652485, -1.059013, -2.592893, 0, 0, 1, 1, 1,
-0.6518673, -0.7610232, -0.8855512, 1, 0, 0, 1, 1,
-0.6504537, 0.1106003, 0.2686015, 1, 0, 0, 1, 1,
-0.6462692, -0.8846221, -1.811545, 1, 0, 0, 1, 1,
-0.6335679, 0.3449399, -0.9072576, 1, 0, 0, 1, 1,
-0.6318079, 1.15252, -1.542823, 1, 0, 0, 1, 1,
-0.6303683, 0.4000777, -0.3989975, 0, 0, 0, 1, 1,
-0.6286396, 0.3417465, -2.425226, 0, 0, 0, 1, 1,
-0.6280892, -1.504006, -1.152759, 0, 0, 0, 1, 1,
-0.6262417, 0.3007613, -0.8183705, 0, 0, 0, 1, 1,
-0.6247188, 0.3722653, -1.811915, 0, 0, 0, 1, 1,
-0.6206287, 0.6146445, -1.87947, 0, 0, 0, 1, 1,
-0.620312, 1.092181, -1.444986, 0, 0, 0, 1, 1,
-0.6193584, 0.06869482, -1.876367, 1, 1, 1, 1, 1,
-0.6077588, -1.571931, -2.444965, 1, 1, 1, 1, 1,
-0.6013513, -2.481096, -2.472032, 1, 1, 1, 1, 1,
-0.5981227, -0.9933134, -2.053705, 1, 1, 1, 1, 1,
-0.5974241, 0.6087569, 0.1451426, 1, 1, 1, 1, 1,
-0.5948095, 0.282093, -0.8121341, 1, 1, 1, 1, 1,
-0.5932508, 0.8367659, -0.8198962, 1, 1, 1, 1, 1,
-0.5932059, -1.038355, -4.760579, 1, 1, 1, 1, 1,
-0.5926802, 1.070799, -0.6350484, 1, 1, 1, 1, 1,
-0.5897064, -0.9731323, -2.711759, 1, 1, 1, 1, 1,
-0.5857898, -0.8315665, -2.781514, 1, 1, 1, 1, 1,
-0.5843238, 0.4237102, -1.78461, 1, 1, 1, 1, 1,
-0.5822022, 0.6135057, -1.514628, 1, 1, 1, 1, 1,
-0.5821433, -0.889869, -2.826145, 1, 1, 1, 1, 1,
-0.5814651, -1.095946, -1.462996, 1, 1, 1, 1, 1,
-0.5808844, 0.399695, 0.5101683, 0, 0, 1, 1, 1,
-0.5806315, 0.1072686, -0.1310925, 1, 0, 0, 1, 1,
-0.5771258, -0.1114293, -1.241009, 1, 0, 0, 1, 1,
-0.5760549, -1.514895, -1.659167, 1, 0, 0, 1, 1,
-0.5742679, 1.017191, 1.291362, 1, 0, 0, 1, 1,
-0.5741585, 0.1614333, -2.633639, 1, 0, 0, 1, 1,
-0.5703205, 1.585016, 0.06331018, 0, 0, 0, 1, 1,
-0.5702509, 2.019793, 0.5573047, 0, 0, 0, 1, 1,
-0.5668982, -0.3661637, -1.694661, 0, 0, 0, 1, 1,
-0.5664943, 0.1184163, -2.759268, 0, 0, 0, 1, 1,
-0.566028, 0.1086518, -2.545698, 0, 0, 0, 1, 1,
-0.5638024, -2.002769, -1.794424, 0, 0, 0, 1, 1,
-0.5636668, -2.190739, -1.489929, 0, 0, 0, 1, 1,
-0.561746, 0.8666553, 0.4518763, 1, 1, 1, 1, 1,
-0.554864, 1.331678, -2.168269, 1, 1, 1, 1, 1,
-0.5547821, -1.194878, -1.966948, 1, 1, 1, 1, 1,
-0.5456874, -0.4716485, -3.007968, 1, 1, 1, 1, 1,
-0.5383611, -0.9582556, -1.019545, 1, 1, 1, 1, 1,
-0.5334545, 0.9144458, 1.129526, 1, 1, 1, 1, 1,
-0.5323836, -0.5595317, -2.550739, 1, 1, 1, 1, 1,
-0.5316132, -1.066993, -2.070604, 1, 1, 1, 1, 1,
-0.530804, -0.3593714, -2.219735, 1, 1, 1, 1, 1,
-0.5254105, 0.0861321, -3.720664, 1, 1, 1, 1, 1,
-0.5247505, 0.6388506, -1.98617, 1, 1, 1, 1, 1,
-0.5243483, -0.3207896, -3.381311, 1, 1, 1, 1, 1,
-0.5234795, -0.489202, -2.843185, 1, 1, 1, 1, 1,
-0.5220873, 0.7073449, -0.05253746, 1, 1, 1, 1, 1,
-0.5218536, 1.004626, -1.124647, 1, 1, 1, 1, 1,
-0.520397, -0.006643285, -1.110379, 0, 0, 1, 1, 1,
-0.5156993, 1.251529, 0.01676416, 1, 0, 0, 1, 1,
-0.5111107, 0.6079216, -1.007418, 1, 0, 0, 1, 1,
-0.5078195, -0.3978167, -1.581717, 1, 0, 0, 1, 1,
-0.5050408, -0.2352908, -2.70686, 1, 0, 0, 1, 1,
-0.4975928, -1.024735, -2.129778, 1, 0, 0, 1, 1,
-0.4972145, 1.684247, -1.916988, 0, 0, 0, 1, 1,
-0.4908584, -0.8360738, -2.333279, 0, 0, 0, 1, 1,
-0.4883183, -0.008412116, -1.628131, 0, 0, 0, 1, 1,
-0.4861653, 1.955446, 0.229306, 0, 0, 0, 1, 1,
-0.4850583, -1.007611, -2.192132, 0, 0, 0, 1, 1,
-0.484849, 0.3010996, -1.222152, 0, 0, 0, 1, 1,
-0.477046, 1.253024, 0.5884205, 0, 0, 0, 1, 1,
-0.4753801, -0.04993358, -2.372731, 1, 1, 1, 1, 1,
-0.4747277, -1.014564, -5.19796, 1, 1, 1, 1, 1,
-0.4719636, 0.07105884, -1.398227, 1, 1, 1, 1, 1,
-0.4673147, -1.661675, -1.978276, 1, 1, 1, 1, 1,
-0.4647521, -1.953849, -2.658316, 1, 1, 1, 1, 1,
-0.4634261, 1.087474, -0.1455716, 1, 1, 1, 1, 1,
-0.4626616, 0.05004458, -3.178296, 1, 1, 1, 1, 1,
-0.4596921, -0.2846271, -2.730061, 1, 1, 1, 1, 1,
-0.4572499, 1.491735, 0.5207767, 1, 1, 1, 1, 1,
-0.4550527, 0.1011399, -1.371125, 1, 1, 1, 1, 1,
-0.4546203, 0.8861439, 2.261078, 1, 1, 1, 1, 1,
-0.4514071, -0.92075, -3.497672, 1, 1, 1, 1, 1,
-0.446871, -1.827443, -1.698834, 1, 1, 1, 1, 1,
-0.4421158, 0.004842935, -1.488155, 1, 1, 1, 1, 1,
-0.4415774, -0.3321932, -2.431059, 1, 1, 1, 1, 1,
-0.4408874, -1.851382, -3.87088, 0, 0, 1, 1, 1,
-0.438259, 0.1293563, 0.7629338, 1, 0, 0, 1, 1,
-0.4361723, -0.7067043, -1.019496, 1, 0, 0, 1, 1,
-0.4297147, 0.7732887, -1.016683, 1, 0, 0, 1, 1,
-0.4237316, -0.7515099, -2.694818, 1, 0, 0, 1, 1,
-0.4202102, 0.2972006, -0.4798833, 1, 0, 0, 1, 1,
-0.4201125, -2.056549, -2.697754, 0, 0, 0, 1, 1,
-0.4170901, -0.6117441, -0.3968762, 0, 0, 0, 1, 1,
-0.4096646, 2.182679, -1.143306, 0, 0, 0, 1, 1,
-0.4085604, -1.784415, -2.425447, 0, 0, 0, 1, 1,
-0.4057366, 0.6059738, -0.5190696, 0, 0, 0, 1, 1,
-0.4020679, 1.45285, 0.1575433, 0, 0, 0, 1, 1,
-0.4017048, -0.85911, -2.450206, 0, 0, 0, 1, 1,
-0.4015441, -1.604466, -3.965837, 1, 1, 1, 1, 1,
-0.4001251, 0.5925217, -1.402052, 1, 1, 1, 1, 1,
-0.3995444, -1.382798, -2.061077, 1, 1, 1, 1, 1,
-0.3983487, 0.2519682, -0.5124683, 1, 1, 1, 1, 1,
-0.3982956, -1.72828, -1.263122, 1, 1, 1, 1, 1,
-0.3956191, -1.807664, -2.163899, 1, 1, 1, 1, 1,
-0.3925723, -1.062619, -2.772569, 1, 1, 1, 1, 1,
-0.3830505, -0.5186899, -0.734957, 1, 1, 1, 1, 1,
-0.3822045, -0.8087962, -4.102715, 1, 1, 1, 1, 1,
-0.381677, -0.04338195, -0.7938133, 1, 1, 1, 1, 1,
-0.381464, 1.883454, -0.2364543, 1, 1, 1, 1, 1,
-0.3766328, -0.5054061, -1.812967, 1, 1, 1, 1, 1,
-0.3748751, -1.303137, -3.110433, 1, 1, 1, 1, 1,
-0.3700977, -0.01920958, -1.450372, 1, 1, 1, 1, 1,
-0.3690403, 1.227194, 1.757821, 1, 1, 1, 1, 1,
-0.3679154, 1.500833, 0.2837667, 0, 0, 1, 1, 1,
-0.3678002, -1.05868, -2.807043, 1, 0, 0, 1, 1,
-0.3637209, -0.6601589, -4.337797, 1, 0, 0, 1, 1,
-0.362321, 0.5323619, -0.5571998, 1, 0, 0, 1, 1,
-0.362108, -1.453907, -2.28616, 1, 0, 0, 1, 1,
-0.3516894, -0.4038989, -4.593384, 1, 0, 0, 1, 1,
-0.3488427, -0.283208, -0.04877115, 0, 0, 0, 1, 1,
-0.3464865, 1.01445, -0.6474479, 0, 0, 0, 1, 1,
-0.3425824, -0.9169964, -5.18817, 0, 0, 0, 1, 1,
-0.3422946, 0.2987319, 1.661316, 0, 0, 0, 1, 1,
-0.3386949, 0.1932034, -0.1549487, 0, 0, 0, 1, 1,
-0.3353709, 2.067258, -0.3862913, 0, 0, 0, 1, 1,
-0.3332857, -0.7819542, -2.571038, 0, 0, 0, 1, 1,
-0.3325997, 0.7128376, -0.033345, 1, 1, 1, 1, 1,
-0.3304331, 0.4949386, -0.4579191, 1, 1, 1, 1, 1,
-0.3213226, 1.201241, -0.277227, 1, 1, 1, 1, 1,
-0.3207881, -0.2548753, -3.680766, 1, 1, 1, 1, 1,
-0.3195709, 0.1185202, -1.902403, 1, 1, 1, 1, 1,
-0.3160233, 0.9536165, -0.8354867, 1, 1, 1, 1, 1,
-0.3144388, 1.239828, -1.139977, 1, 1, 1, 1, 1,
-0.3136222, -1.194612, -4.241948, 1, 1, 1, 1, 1,
-0.3129341, -1.049195, -3.034348, 1, 1, 1, 1, 1,
-0.3128912, -0.1728577, -1.283994, 1, 1, 1, 1, 1,
-0.312648, 2.780314, -0.2194667, 1, 1, 1, 1, 1,
-0.3111786, -0.3149331, -2.95946, 1, 1, 1, 1, 1,
-0.3074639, 1.322797, -2.414468, 1, 1, 1, 1, 1,
-0.3073595, -0.6294433, -2.918188, 1, 1, 1, 1, 1,
-0.3056584, 0.2987836, -1.023077, 1, 1, 1, 1, 1,
-0.3016382, 1.389381, -1.391096, 0, 0, 1, 1, 1,
-0.300738, 0.3422931, -1.501753, 1, 0, 0, 1, 1,
-0.2973793, -1.063414, -4.777266, 1, 0, 0, 1, 1,
-0.2942668, -0.3165835, -0.4343069, 1, 0, 0, 1, 1,
-0.2941594, -1.605249, -2.219789, 1, 0, 0, 1, 1,
-0.2914831, 0.486425, 0.633929, 1, 0, 0, 1, 1,
-0.2875931, 0.1092686, -1.68942, 0, 0, 0, 1, 1,
-0.286756, 1.399179, -1.84581, 0, 0, 0, 1, 1,
-0.2855792, -1.834158, -1.973253, 0, 0, 0, 1, 1,
-0.2847597, -0.7715037, -2.166368, 0, 0, 0, 1, 1,
-0.2827738, -0.852596, -3.245003, 0, 0, 0, 1, 1,
-0.2825411, -0.004394154, -2.269098, 0, 0, 0, 1, 1,
-0.2816895, -0.4696354, -3.959766, 0, 0, 0, 1, 1,
-0.2816249, -0.2314659, -2.681657, 1, 1, 1, 1, 1,
-0.2808369, 1.22727, 0.3846287, 1, 1, 1, 1, 1,
-0.2767836, -0.906318, -0.416893, 1, 1, 1, 1, 1,
-0.2691927, -1.77516, -4.570967, 1, 1, 1, 1, 1,
-0.2641973, 0.8654464, 0.2599852, 1, 1, 1, 1, 1,
-0.2630833, -0.3367662, -1.541428, 1, 1, 1, 1, 1,
-0.2609292, -1.648174, -2.885504, 1, 1, 1, 1, 1,
-0.259947, -0.06512608, -0.5397844, 1, 1, 1, 1, 1,
-0.2586639, 0.3587299, -1.386229, 1, 1, 1, 1, 1,
-0.2585389, -0.4557314, -3.140371, 1, 1, 1, 1, 1,
-0.2571083, -0.657305, -2.365636, 1, 1, 1, 1, 1,
-0.25438, 0.7057089, 0.09070763, 1, 1, 1, 1, 1,
-0.2447272, 0.6271055, -0.6333659, 1, 1, 1, 1, 1,
-0.2418681, 0.795735, -1.035357, 1, 1, 1, 1, 1,
-0.2418347, -0.4276207, -2.310042, 1, 1, 1, 1, 1,
-0.2402025, -1.451211, -4.772041, 0, 0, 1, 1, 1,
-0.2382708, -1.154873, -3.816114, 1, 0, 0, 1, 1,
-0.236551, -0.8788527, -2.869665, 1, 0, 0, 1, 1,
-0.2349997, -0.7271565, -1.250096, 1, 0, 0, 1, 1,
-0.2316831, 0.9675087, -1.599566, 1, 0, 0, 1, 1,
-0.2312188, -1.364743, -3.376578, 1, 0, 0, 1, 1,
-0.2306143, -0.6225053, -1.209729, 0, 0, 0, 1, 1,
-0.228478, 0.5610222, -2.319167, 0, 0, 0, 1, 1,
-0.2216184, -0.0373335, -4.231847, 0, 0, 0, 1, 1,
-0.2211816, 0.2833529, -0.6798372, 0, 0, 0, 1, 1,
-0.2180354, -0.1489022, -3.210437, 0, 0, 0, 1, 1,
-0.2151748, 0.2776808, -0.02434509, 0, 0, 0, 1, 1,
-0.2148331, 0.8598838, -0.08336806, 0, 0, 0, 1, 1,
-0.2141899, -1.508133, -1.185163, 1, 1, 1, 1, 1,
-0.211504, 0.3319815, -1.263417, 1, 1, 1, 1, 1,
-0.2112848, 1.649281, -0.01359326, 1, 1, 1, 1, 1,
-0.2089129, 0.5638992, 0.4127049, 1, 1, 1, 1, 1,
-0.20728, -0.2206059, -2.27458, 1, 1, 1, 1, 1,
-0.2033743, 0.6783733, 0.008366712, 1, 1, 1, 1, 1,
-0.2029957, 1.34056, -0.6219377, 1, 1, 1, 1, 1,
-0.2000171, 0.3218351, -2.438372, 1, 1, 1, 1, 1,
-0.1997832, -0.2929299, -2.289739, 1, 1, 1, 1, 1,
-0.1975857, 0.03676311, -0.2835116, 1, 1, 1, 1, 1,
-0.1957536, 0.0167755, -0.4809215, 1, 1, 1, 1, 1,
-0.1950027, -0.9584392, -4.104136, 1, 1, 1, 1, 1,
-0.1923258, 0.6135706, -0.3968666, 1, 1, 1, 1, 1,
-0.1890964, -0.3175396, -2.468985, 1, 1, 1, 1, 1,
-0.1880552, 0.2960042, -2.670525, 1, 1, 1, 1, 1,
-0.1854676, -0.6790267, -2.807466, 0, 0, 1, 1, 1,
-0.185421, -0.1273955, -2.01401, 1, 0, 0, 1, 1,
-0.1839732, 0.2553416, 0.7908, 1, 0, 0, 1, 1,
-0.1824554, 0.5175647, -0.1033644, 1, 0, 0, 1, 1,
-0.1728788, -1.869256, -4.155109, 1, 0, 0, 1, 1,
-0.171584, 0.8382148, 0.5762424, 1, 0, 0, 1, 1,
-0.1713941, 0.0565956, -4.56473, 0, 0, 0, 1, 1,
-0.170076, -0.4432834, -2.836699, 0, 0, 0, 1, 1,
-0.1597217, 2.17611, 0.2095563, 0, 0, 0, 1, 1,
-0.1576635, -0.3951435, -2.228467, 0, 0, 0, 1, 1,
-0.1551022, -0.7414985, -1.973645, 0, 0, 0, 1, 1,
-0.1502076, 0.5601745, 1.064907, 0, 0, 0, 1, 1,
-0.1462091, -1.017492, -4.903582, 0, 0, 0, 1, 1,
-0.1445246, 1.908831, -0.663045, 1, 1, 1, 1, 1,
-0.1441295, 0.942973, -0.9796923, 1, 1, 1, 1, 1,
-0.1433549, -1.231067, -3.698444, 1, 1, 1, 1, 1,
-0.1350054, -0.5371024, -2.62545, 1, 1, 1, 1, 1,
-0.1339502, 1.151564, -1.571024, 1, 1, 1, 1, 1,
-0.133888, 0.6173655, -0.7331047, 1, 1, 1, 1, 1,
-0.1270593, -0.5827044, -3.236055, 1, 1, 1, 1, 1,
-0.1254646, -0.3913334, -1.944286, 1, 1, 1, 1, 1,
-0.1228271, 0.9660783, -0.8128611, 1, 1, 1, 1, 1,
-0.1175656, -1.740346, -2.647838, 1, 1, 1, 1, 1,
-0.1162502, 0.858753, 0.9730074, 1, 1, 1, 1, 1,
-0.1090851, -0.8948041, -2.601816, 1, 1, 1, 1, 1,
-0.1048358, -1.245263, -2.412183, 1, 1, 1, 1, 1,
-0.1036898, 1.571487, -0.8472306, 1, 1, 1, 1, 1,
-0.1028141, -0.02655002, -2.33357, 1, 1, 1, 1, 1,
-0.1026262, -1.267343, -3.173169, 0, 0, 1, 1, 1,
-0.1003364, 0.06556426, -0.7901739, 1, 0, 0, 1, 1,
-0.09873786, 0.2809961, -0.2923446, 1, 0, 0, 1, 1,
-0.08866108, 0.57262, 0.2272895, 1, 0, 0, 1, 1,
-0.08795411, -0.421619, -1.609763, 1, 0, 0, 1, 1,
-0.08601455, 0.3674979, -0.2662195, 1, 0, 0, 1, 1,
-0.08170611, 0.5881363, 0.08395206, 0, 0, 0, 1, 1,
-0.08109764, 1.93182, 0.2342218, 0, 0, 0, 1, 1,
-0.08087458, -2.271714, -3.348138, 0, 0, 0, 1, 1,
-0.0803296, -1.863813, -4.764872, 0, 0, 0, 1, 1,
-0.07728154, 0.09076641, 0.3640843, 0, 0, 0, 1, 1,
-0.07701276, -0.1379036, -2.24147, 0, 0, 0, 1, 1,
-0.07438547, 1.029508, 1.041643, 0, 0, 0, 1, 1,
-0.07176602, 0.3299556, -0.8077517, 1, 1, 1, 1, 1,
-0.06879799, -1.611166, -2.944779, 1, 1, 1, 1, 1,
-0.06600205, -0.1049983, -1.96667, 1, 1, 1, 1, 1,
-0.06535099, -0.5094265, -2.02068, 1, 1, 1, 1, 1,
-0.06516524, 0.856374, 0.6729156, 1, 1, 1, 1, 1,
-0.05834841, 0.1687292, -0.9050128, 1, 1, 1, 1, 1,
-0.05669968, 2.214151, -0.4990768, 1, 1, 1, 1, 1,
-0.04515754, 1.474466, -1.144914, 1, 1, 1, 1, 1,
-0.04101319, 1.436272, -0.1798913, 1, 1, 1, 1, 1,
-0.03284856, -0.2146588, -1.812914, 1, 1, 1, 1, 1,
-0.03261384, 0.789411, -0.1171625, 1, 1, 1, 1, 1,
-0.02954853, -0.3147897, -1.487559, 1, 1, 1, 1, 1,
-0.02148483, 0.003160661, -1.728062, 1, 1, 1, 1, 1,
-0.02132501, 1.549289, -0.6963304, 1, 1, 1, 1, 1,
-0.01747792, -0.2288997, -0.8906932, 1, 1, 1, 1, 1,
-0.01572552, 0.2279372, 0.6195794, 0, 0, 1, 1, 1,
-0.01548389, -1.054268, -3.406126, 1, 0, 0, 1, 1,
-0.01258524, 0.943071, 0.6394203, 1, 0, 0, 1, 1,
-0.0118215, -0.2510453, -4.077622, 1, 0, 0, 1, 1,
-0.01126354, -1.46253, -4.330714, 1, 0, 0, 1, 1,
-0.009692034, 0.9766174, 0.9563985, 1, 0, 0, 1, 1,
-0.00949845, 0.6272715, -0.3197244, 0, 0, 0, 1, 1,
-0.006665751, 0.06625728, -1.520974, 0, 0, 0, 1, 1,
-0.006376639, -0.9263637, -1.717385, 0, 0, 0, 1, 1,
-0.0006669745, 0.9280799, -1.039136, 0, 0, 0, 1, 1,
-0.0005615635, 1.441709, 0.02589393, 0, 0, 0, 1, 1,
0.001447821, -0.361526, 2.917908, 0, 0, 0, 1, 1,
0.002212166, -0.7167187, 3.851329, 0, 0, 0, 1, 1,
0.002531898, 0.2205855, 1.238744, 1, 1, 1, 1, 1,
0.005416665, 1.678908, -0.228532, 1, 1, 1, 1, 1,
0.006769108, -0.4704721, 2.90967, 1, 1, 1, 1, 1,
0.008016544, -0.9200519, 2.821021, 1, 1, 1, 1, 1,
0.01030706, -0.4501279, 3.99396, 1, 1, 1, 1, 1,
0.01052245, -0.2378756, 3.409759, 1, 1, 1, 1, 1,
0.01806922, -0.1501347, 2.926171, 1, 1, 1, 1, 1,
0.01912089, 1.471179, -0.2007068, 1, 1, 1, 1, 1,
0.02451041, -0.4675474, 2.470167, 1, 1, 1, 1, 1,
0.03235788, 0.4149665, 0.550452, 1, 1, 1, 1, 1,
0.03708316, 0.5857873, -0.467916, 1, 1, 1, 1, 1,
0.03826429, 2.092354, -0.2823121, 1, 1, 1, 1, 1,
0.0423996, 1.581105, 0.3684269, 1, 1, 1, 1, 1,
0.04410287, 0.4724032, 2.449104, 1, 1, 1, 1, 1,
0.04752826, -1.00131, 3.132044, 1, 1, 1, 1, 1,
0.05229333, -0.3310761, 2.961619, 0, 0, 1, 1, 1,
0.05386503, -0.2209785, 3.898142, 1, 0, 0, 1, 1,
0.05594885, -0.4690695, 2.408276, 1, 0, 0, 1, 1,
0.05808643, -1.30669, 3.863279, 1, 0, 0, 1, 1,
0.0650096, 0.2684655, -0.7627585, 1, 0, 0, 1, 1,
0.06758428, -0.464998, 1.363071, 1, 0, 0, 1, 1,
0.07394481, 0.3802215, -1.923342, 0, 0, 0, 1, 1,
0.07404326, -0.5808727, 3.281153, 0, 0, 0, 1, 1,
0.07757594, -0.09234055, 1.639373, 0, 0, 0, 1, 1,
0.08332975, -0.2395899, 3.801771, 0, 0, 0, 1, 1,
0.08734202, 0.05237678, 2.547279, 0, 0, 0, 1, 1,
0.0905527, -0.3739121, 2.14332, 0, 0, 0, 1, 1,
0.09072639, 0.4899403, 0.8894902, 0, 0, 0, 1, 1,
0.09422268, -0.05992202, -0.06213, 1, 1, 1, 1, 1,
0.0952414, 0.2052117, 1.344826, 1, 1, 1, 1, 1,
0.09631291, -0.4636431, 2.983985, 1, 1, 1, 1, 1,
0.09854201, -0.7595893, 3.229228, 1, 1, 1, 1, 1,
0.1057836, -0.6408936, 2.124143, 1, 1, 1, 1, 1,
0.1064574, -1.656371, 2.370718, 1, 1, 1, 1, 1,
0.1143635, 0.6971878, -1.270296, 1, 1, 1, 1, 1,
0.1187442, -0.7758783, 3.100079, 1, 1, 1, 1, 1,
0.1242866, -0.2814367, 2.691756, 1, 1, 1, 1, 1,
0.1246336, 2.188583, 1.567141, 1, 1, 1, 1, 1,
0.1307958, -0.6236382, 1.743316, 1, 1, 1, 1, 1,
0.1358205, -0.0595737, 1.673793, 1, 1, 1, 1, 1,
0.1400832, -0.5600092, 2.290992, 1, 1, 1, 1, 1,
0.1434379, -0.7973412, 1.383473, 1, 1, 1, 1, 1,
0.1452149, 0.6344024, -0.08296559, 1, 1, 1, 1, 1,
0.1462999, 0.5532659, 0.2436087, 0, 0, 1, 1, 1,
0.1486855, 0.5394307, 0.2226194, 1, 0, 0, 1, 1,
0.1528148, 0.6958861, 0.3015663, 1, 0, 0, 1, 1,
0.155032, -0.5667363, 2.2135, 1, 0, 0, 1, 1,
0.1552081, 0.9767202, 1.244878, 1, 0, 0, 1, 1,
0.1561751, -0.2013581, 3.134806, 1, 0, 0, 1, 1,
0.158371, -0.1783637, 3.029294, 0, 0, 0, 1, 1,
0.1591411, 1.149925, 0.6036043, 0, 0, 0, 1, 1,
0.1632461, -0.3641196, 3.086421, 0, 0, 0, 1, 1,
0.1656386, 0.7928079, 0.6673204, 0, 0, 0, 1, 1,
0.1706606, -0.2616111, 1.863659, 0, 0, 0, 1, 1,
0.1707976, 0.7991526, -0.3346503, 0, 0, 0, 1, 1,
0.1762674, -0.3813077, 2.607286, 0, 0, 0, 1, 1,
0.1776605, 0.3558262, 1.555906, 1, 1, 1, 1, 1,
0.179085, 0.869201, -1.277776, 1, 1, 1, 1, 1,
0.1797097, -0.1466247, 1.037397, 1, 1, 1, 1, 1,
0.1874257, -0.51177, 0.785154, 1, 1, 1, 1, 1,
0.1874491, 1.302172, 0.943527, 1, 1, 1, 1, 1,
0.1900374, 0.1194286, -1.123014, 1, 1, 1, 1, 1,
0.1944549, 1.066445, 0.2308865, 1, 1, 1, 1, 1,
0.1954812, 0.5626822, 0.07886715, 1, 1, 1, 1, 1,
0.2081332, 0.882101, -1.090699, 1, 1, 1, 1, 1,
0.2116346, -0.4885338, 3.7756, 1, 1, 1, 1, 1,
0.211962, 1.880721, -0.2089422, 1, 1, 1, 1, 1,
0.2214052, -1.978765, 3.47101, 1, 1, 1, 1, 1,
0.2258727, 1.43396, 1.223176, 1, 1, 1, 1, 1,
0.2267079, 0.7014129, -1.057215, 1, 1, 1, 1, 1,
0.2267475, -0.4961645, 2.176234, 1, 1, 1, 1, 1,
0.2276701, 0.8707342, 0.9816453, 0, 0, 1, 1, 1,
0.2361697, 0.5948471, -0.6870586, 1, 0, 0, 1, 1,
0.2375482, -0.9224754, 0.668021, 1, 0, 0, 1, 1,
0.2451432, 0.3019279, 1.163318, 1, 0, 0, 1, 1,
0.2494457, 0.7185287, -0.412201, 1, 0, 0, 1, 1,
0.2539869, -0.2467561, 3.369148, 1, 0, 0, 1, 1,
0.2562937, -0.1674017, 3.707427, 0, 0, 0, 1, 1,
0.2575046, -0.176133, 1.861647, 0, 0, 0, 1, 1,
0.2598504, 0.08652795, 3.878448, 0, 0, 0, 1, 1,
0.2610686, 1.353403, 1.923492, 0, 0, 0, 1, 1,
0.2645334, 1.401229, -0.4911256, 0, 0, 0, 1, 1,
0.2652973, 1.320684, 0.1421568, 0, 0, 0, 1, 1,
0.2653294, -0.9953196, 4.299265, 0, 0, 0, 1, 1,
0.2677166, -0.5897126, 1.711316, 1, 1, 1, 1, 1,
0.2688319, 0.6001896, 1.488995, 1, 1, 1, 1, 1,
0.2730547, 1.271775, -0.8788693, 1, 1, 1, 1, 1,
0.2747904, 1.072796, -0.6870912, 1, 1, 1, 1, 1,
0.2829163, -0.1259404, 4.347731, 1, 1, 1, 1, 1,
0.2867129, -0.09956699, 2.810273, 1, 1, 1, 1, 1,
0.2920575, 1.141088, 0.7418789, 1, 1, 1, 1, 1,
0.2949892, -1.236253, 1.299558, 1, 1, 1, 1, 1,
0.2961436, 0.5530669, 0.2146459, 1, 1, 1, 1, 1,
0.3002042, -1.172772, 2.973039, 1, 1, 1, 1, 1,
0.3005477, -0.5506646, 2.954945, 1, 1, 1, 1, 1,
0.3022939, 0.3425246, 1.472789, 1, 1, 1, 1, 1,
0.3026975, 0.472958, 2.455872, 1, 1, 1, 1, 1,
0.305742, -0.537649, 1.113652, 1, 1, 1, 1, 1,
0.3062808, 0.6294755, 1.078371, 1, 1, 1, 1, 1,
0.3083298, -1.101508, 4.23508, 0, 0, 1, 1, 1,
0.3091042, -1.273807, 3.276564, 1, 0, 0, 1, 1,
0.3116885, 2.407713, 2.326739, 1, 0, 0, 1, 1,
0.3218713, -0.9921547, 4.29489, 1, 0, 0, 1, 1,
0.3237171, -0.05370266, 1.712609, 1, 0, 0, 1, 1,
0.3246105, 0.08265732, 2.341604, 1, 0, 0, 1, 1,
0.3247284, -0.6514658, 2.921185, 0, 0, 0, 1, 1,
0.3275954, 0.5325724, 1.121713, 0, 0, 0, 1, 1,
0.3300466, -0.2017155, 1.229751, 0, 0, 0, 1, 1,
0.3341234, -0.140214, 2.735825, 0, 0, 0, 1, 1,
0.3350143, 0.2519583, -0.03999289, 0, 0, 0, 1, 1,
0.340106, -0.93027, 3.013709, 0, 0, 0, 1, 1,
0.344569, 2.368748, 0.003738965, 0, 0, 0, 1, 1,
0.3462991, -1.205275, 3.355119, 1, 1, 1, 1, 1,
0.3485398, 0.4850351, 1.109801, 1, 1, 1, 1, 1,
0.3494309, 0.1459055, 0.9017565, 1, 1, 1, 1, 1,
0.3510136, -1.109501, 3.897666, 1, 1, 1, 1, 1,
0.3529859, 1.384478, -1.255358, 1, 1, 1, 1, 1,
0.353264, 2.19317, -1.747011, 1, 1, 1, 1, 1,
0.3544613, 0.6996353, -0.9218929, 1, 1, 1, 1, 1,
0.3544646, -1.696086, 2.954393, 1, 1, 1, 1, 1,
0.3563205, 1.501022, 0.9347515, 1, 1, 1, 1, 1,
0.3599488, -0.6982774, 2.47841, 1, 1, 1, 1, 1,
0.3606155, -1.610456, 3.726344, 1, 1, 1, 1, 1,
0.3614369, -1.043381, 1.567772, 1, 1, 1, 1, 1,
0.3630833, -0.6123587, 3.003747, 1, 1, 1, 1, 1,
0.3697681, 0.2963854, 3.156961, 1, 1, 1, 1, 1,
0.3730128, -0.4867183, 1.17575, 1, 1, 1, 1, 1,
0.3735147, -0.1842354, 1.241314, 0, 0, 1, 1, 1,
0.378797, 0.1504805, 1.703203, 1, 0, 0, 1, 1,
0.3806448, 0.01907589, 2.732814, 1, 0, 0, 1, 1,
0.382088, -1.200557, 2.047373, 1, 0, 0, 1, 1,
0.3826903, -0.9971276, 4.511733, 1, 0, 0, 1, 1,
0.3896667, -1.948179, 3.678447, 1, 0, 0, 1, 1,
0.3957805, 0.1499912, 1.942858, 0, 0, 0, 1, 1,
0.3974852, -0.7492086, 2.951178, 0, 0, 0, 1, 1,
0.4013487, 0.3642737, -0.129626, 0, 0, 0, 1, 1,
0.4021858, -0.3793165, 1.741026, 0, 0, 0, 1, 1,
0.4024036, -2.059985, 1.545484, 0, 0, 0, 1, 1,
0.4036158, 0.6161455, 0.6042698, 0, 0, 0, 1, 1,
0.4043296, 2.588737, -0.1399595, 0, 0, 0, 1, 1,
0.4079022, 1.33867, 1.496827, 1, 1, 1, 1, 1,
0.4080463, 1.06524, -0.7099206, 1, 1, 1, 1, 1,
0.4083717, -0.9808784, 3.883017, 1, 1, 1, 1, 1,
0.4099287, -0.2290713, 1.406855, 1, 1, 1, 1, 1,
0.4159483, 0.9915982, -0.08399408, 1, 1, 1, 1, 1,
0.4176585, 0.1906746, 1.344167, 1, 1, 1, 1, 1,
0.4177269, -0.01647242, 3.342315, 1, 1, 1, 1, 1,
0.4197921, 0.3190776, 2.905993, 1, 1, 1, 1, 1,
0.4204412, -0.6100932, 2.564288, 1, 1, 1, 1, 1,
0.4227762, -1.502122, 1.116857, 1, 1, 1, 1, 1,
0.4241049, -0.4289699, 2.587514, 1, 1, 1, 1, 1,
0.4264495, 1.279195, -1.056051, 1, 1, 1, 1, 1,
0.4273049, -1.950629, 2.715135, 1, 1, 1, 1, 1,
0.4279981, -0.724784, 3.268998, 1, 1, 1, 1, 1,
0.4320838, -0.1979797, 1.380935, 1, 1, 1, 1, 1,
0.4360971, 0.1708916, -0.7937118, 0, 0, 1, 1, 1,
0.4373563, 0.1719217, 2.275787, 1, 0, 0, 1, 1,
0.4395607, -1.591875, 3.216987, 1, 0, 0, 1, 1,
0.4403253, 0.951673, 1.454105, 1, 0, 0, 1, 1,
0.4420791, -0.2878728, 1.470601, 1, 0, 0, 1, 1,
0.4437091, -0.4124525, 3.521884, 1, 0, 0, 1, 1,
0.4466277, 0.4852724, -1.491867, 0, 0, 0, 1, 1,
0.4470777, -1.172598, 0.6387914, 0, 0, 0, 1, 1,
0.4478264, -0.2859254, 2.706455, 0, 0, 0, 1, 1,
0.4492887, -1.91897, 3.859859, 0, 0, 0, 1, 1,
0.4591302, -1.597741, 2.78848, 0, 0, 0, 1, 1,
0.4614992, -0.09973998, 0.133517, 0, 0, 0, 1, 1,
0.4624469, 0.4023581, -0.6047466, 0, 0, 0, 1, 1,
0.4643935, 1.166984, -1.270465, 1, 1, 1, 1, 1,
0.4659076, 1.738536, 1.62461, 1, 1, 1, 1, 1,
0.4673763, 1.580815, -0.1270006, 1, 1, 1, 1, 1,
0.4744118, -0.3496353, 0.5033278, 1, 1, 1, 1, 1,
0.4824602, 0.1815252, -0.6749096, 1, 1, 1, 1, 1,
0.4866354, -0.417478, 3.063608, 1, 1, 1, 1, 1,
0.4960991, 0.6438775, -2.050595, 1, 1, 1, 1, 1,
0.5016569, 0.4217465, -0.2419749, 1, 1, 1, 1, 1,
0.5073538, -0.8109069, 3.655275, 1, 1, 1, 1, 1,
0.512357, -0.08779484, -0.1864501, 1, 1, 1, 1, 1,
0.5143281, 1.442526, -0.2593569, 1, 1, 1, 1, 1,
0.515854, -2.304744, 2.946756, 1, 1, 1, 1, 1,
0.5223597, -0.5566783, 3.930975, 1, 1, 1, 1, 1,
0.5223994, -0.5528993, 3.064734, 1, 1, 1, 1, 1,
0.523981, 1.369721, -1.576386, 1, 1, 1, 1, 1,
0.5278049, -0.04065524, 2.976725, 0, 0, 1, 1, 1,
0.5290058, -1.015312, 2.851318, 1, 0, 0, 1, 1,
0.5290145, -1.319812, 2.977899, 1, 0, 0, 1, 1,
0.5305453, -0.9295288, 0.4755694, 1, 0, 0, 1, 1,
0.5341271, 0.3457378, 1.18271, 1, 0, 0, 1, 1,
0.5347931, -0.4587728, 2.270909, 1, 0, 0, 1, 1,
0.5362804, -0.9062721, 1.837147, 0, 0, 0, 1, 1,
0.5394939, 1.263174, 1.10399, 0, 0, 0, 1, 1,
0.5446128, -1.500893, 2.093029, 0, 0, 0, 1, 1,
0.5485777, 0.3462698, 0.2197844, 0, 0, 0, 1, 1,
0.5525649, -0.2545595, 3.536855, 0, 0, 0, 1, 1,
0.5549305, -0.09337781, 2.580827, 0, 0, 0, 1, 1,
0.5602278, 0.1775743, 0.3715373, 0, 0, 0, 1, 1,
0.5637122, 0.1129027, 1.425792, 1, 1, 1, 1, 1,
0.5645396, -0.75607, 0.904627, 1, 1, 1, 1, 1,
0.5695118, -1.024642, 2.121857, 1, 1, 1, 1, 1,
0.5727938, 0.2000837, 1.154846, 1, 1, 1, 1, 1,
0.5740591, 0.8139347, -0.2635541, 1, 1, 1, 1, 1,
0.5757751, 1.440366, -2.175689, 1, 1, 1, 1, 1,
0.5769243, 0.2126281, 1.983211, 1, 1, 1, 1, 1,
0.5841296, -0.4134963, 1.771741, 1, 1, 1, 1, 1,
0.5861442, 0.3629723, -0.6111546, 1, 1, 1, 1, 1,
0.5986047, -1.041525, 2.569669, 1, 1, 1, 1, 1,
0.6010694, 0.220386, 2.535599, 1, 1, 1, 1, 1,
0.6015864, 2.760236, -1.443387, 1, 1, 1, 1, 1,
0.6021154, 0.6611666, -0.1803636, 1, 1, 1, 1, 1,
0.603914, 0.8514116, 1.34639, 1, 1, 1, 1, 1,
0.6056551, -1.120322, 3.143204, 1, 1, 1, 1, 1,
0.6068401, -0.774239, 1.62576, 0, 0, 1, 1, 1,
0.6117401, -0.2455379, 3.395995, 1, 0, 0, 1, 1,
0.6153581, -0.00710767, 1.941903, 1, 0, 0, 1, 1,
0.6204061, -0.5311148, 2.260133, 1, 0, 0, 1, 1,
0.6216543, 1.403693, -0.9331034, 1, 0, 0, 1, 1,
0.6235964, -0.2064476, 2.099005, 1, 0, 0, 1, 1,
0.6309713, 0.47331, 1.496662, 0, 0, 0, 1, 1,
0.6315945, 1.345877, 0.4845551, 0, 0, 0, 1, 1,
0.6319119, -0.9303007, 2.396877, 0, 0, 0, 1, 1,
0.6327239, 0.2488834, 2.04787, 0, 0, 0, 1, 1,
0.6330504, -2.869356, 1.405525, 0, 0, 0, 1, 1,
0.6337793, 0.6101801, 0.1225792, 0, 0, 0, 1, 1,
0.6350702, 0.3691201, -0.1451913, 0, 0, 0, 1, 1,
0.6390535, -0.9774788, 1.935706, 1, 1, 1, 1, 1,
0.6398221, 1.477154, -1.2395, 1, 1, 1, 1, 1,
0.6404134, -1.058724, 1.380073, 1, 1, 1, 1, 1,
0.6494019, -0.4133121, 2.354511, 1, 1, 1, 1, 1,
0.6502544, 0.005892205, 0.2569508, 1, 1, 1, 1, 1,
0.6510729, 0.2656753, 0.5617025, 1, 1, 1, 1, 1,
0.6527873, -2.046893, 2.69413, 1, 1, 1, 1, 1,
0.6545316, 0.1908376, 1.244431, 1, 1, 1, 1, 1,
0.6587461, -0.5784745, 1.849554, 1, 1, 1, 1, 1,
0.6690168, 2.743654, -0.7893757, 1, 1, 1, 1, 1,
0.6702641, 1.240218, 0.6131479, 1, 1, 1, 1, 1,
0.6754997, 0.5559274, -0.04224029, 1, 1, 1, 1, 1,
0.6786443, 0.9963557, 0.02759417, 1, 1, 1, 1, 1,
0.6792583, 1.526569, 1.500071, 1, 1, 1, 1, 1,
0.6902788, 0.3777573, 0.2406362, 1, 1, 1, 1, 1,
0.6931854, -0.8801375, 2.841609, 0, 0, 1, 1, 1,
0.6999329, -0.5385762, 1.408487, 1, 0, 0, 1, 1,
0.7013642, 0.9236681, -0.5824033, 1, 0, 0, 1, 1,
0.7071323, -0.3482856, 2.764396, 1, 0, 0, 1, 1,
0.7089386, -0.1704673, 2.528969, 1, 0, 0, 1, 1,
0.7134019, 0.005471981, 1.517294, 1, 0, 0, 1, 1,
0.7156801, -1.435488, 2.557518, 0, 0, 0, 1, 1,
0.7158197, 0.521943, 1.01596, 0, 0, 0, 1, 1,
0.7168394, 0.6567766, 1.185032, 0, 0, 0, 1, 1,
0.7186221, 0.5690781, 1.217494, 0, 0, 0, 1, 1,
0.7187502, -0.8755953, 2.157847, 0, 0, 0, 1, 1,
0.7245551, 0.5112584, 2.629564, 0, 0, 0, 1, 1,
0.7257365, -0.6399188, 3.627633, 0, 0, 0, 1, 1,
0.7271832, -1.492447, 4.55418, 1, 1, 1, 1, 1,
0.7293189, -0.05180108, 3.223981, 1, 1, 1, 1, 1,
0.7325544, -0.6155125, 0.923017, 1, 1, 1, 1, 1,
0.7331737, -0.2621624, 2.708608, 1, 1, 1, 1, 1,
0.7382916, -0.2538404, 2.513859, 1, 1, 1, 1, 1,
0.7411767, 1.002755, 0.5323897, 1, 1, 1, 1, 1,
0.743333, 0.3463539, 1.94926, 1, 1, 1, 1, 1,
0.7517924, -0.7528518, 3.479562, 1, 1, 1, 1, 1,
0.7571461, -1.644951, 1.680877, 1, 1, 1, 1, 1,
0.7575088, -1.512194, 3.713446, 1, 1, 1, 1, 1,
0.759498, 0.02998778, 0.6946114, 1, 1, 1, 1, 1,
0.7616107, 0.1622688, 1.599394, 1, 1, 1, 1, 1,
0.7624139, 0.3776081, 1.514716, 1, 1, 1, 1, 1,
0.7731146, -0.4180226, 1.255385, 1, 1, 1, 1, 1,
0.7759121, -0.2752938, 1.281534, 1, 1, 1, 1, 1,
0.7821822, -0.8110719, 3.646685, 0, 0, 1, 1, 1,
0.7834858, 0.06704295, 0.5954508, 1, 0, 0, 1, 1,
0.7842597, 2.06237, 0.3484933, 1, 0, 0, 1, 1,
0.7908346, 0.1795275, 2.390193, 1, 0, 0, 1, 1,
0.7952349, -0.3294226, 2.745656, 1, 0, 0, 1, 1,
0.7969776, 0.3078859, 0.9223198, 1, 0, 0, 1, 1,
0.7992414, -0.2780618, 1.711335, 0, 0, 0, 1, 1,
0.8040764, 0.413395, 1.28684, 0, 0, 0, 1, 1,
0.8065644, -1.712679, 1.39889, 0, 0, 0, 1, 1,
0.8073218, 0.2788456, 0.5163594, 0, 0, 0, 1, 1,
0.8081645, -0.4820484, 2.144369, 0, 0, 0, 1, 1,
0.8129848, -0.3965945, 1.894501, 0, 0, 0, 1, 1,
0.8270994, -0.5540606, 1.56648, 0, 0, 0, 1, 1,
0.8314954, -0.07602923, 2.707609, 1, 1, 1, 1, 1,
0.8341085, -0.5221959, 2.373276, 1, 1, 1, 1, 1,
0.8387143, 1.390974, 0.7118878, 1, 1, 1, 1, 1,
0.8429266, 0.7131456, 1.217878, 1, 1, 1, 1, 1,
0.8453233, -0.07702934, 2.21653, 1, 1, 1, 1, 1,
0.8473276, 0.2277375, 2.080464, 1, 1, 1, 1, 1,
0.8512876, 1.578891, 0.2714334, 1, 1, 1, 1, 1,
0.8533003, -0.1469903, 1.798386, 1, 1, 1, 1, 1,
0.8543688, 1.027693, 1.817634, 1, 1, 1, 1, 1,
0.8621554, -2.207447, 1.779386, 1, 1, 1, 1, 1,
0.8631937, 0.2784626, 2.597101, 1, 1, 1, 1, 1,
0.8638481, -1.63282, 1.459963, 1, 1, 1, 1, 1,
0.8752697, -0.6474537, 2.94331, 1, 1, 1, 1, 1,
0.8781405, 0.3255516, 1.285502, 1, 1, 1, 1, 1,
0.8789527, 0.6447753, -0.5877104, 1, 1, 1, 1, 1,
0.8807881, -0.1409093, 0.8230823, 0, 0, 1, 1, 1,
0.8830667, 0.8293235, 2.002023, 1, 0, 0, 1, 1,
0.8892835, 0.489966, 1.088396, 1, 0, 0, 1, 1,
0.889834, -0.6708221, 2.208621, 1, 0, 0, 1, 1,
0.897458, 1.420132, -0.3342809, 1, 0, 0, 1, 1,
0.8980618, -0.786184, 3.470532, 1, 0, 0, 1, 1,
0.8991603, -0.3770768, 2.426208, 0, 0, 0, 1, 1,
0.9045706, 0.5966254, 1.250299, 0, 0, 0, 1, 1,
0.9093816, 1.012059, 1.580237, 0, 0, 0, 1, 1,
0.9161534, 1.844741, -0.4493404, 0, 0, 0, 1, 1,
0.9212599, 0.277961, 0.2259569, 0, 0, 0, 1, 1,
0.9234067, 1.318222, 0.4509648, 0, 0, 0, 1, 1,
0.9295648, -0.5795998, 4.11265, 0, 0, 0, 1, 1,
0.9367851, -0.7445021, 2.005225, 1, 1, 1, 1, 1,
0.9420004, 0.4346887, 2.400308, 1, 1, 1, 1, 1,
0.9427592, 0.6499821, 1.217113, 1, 1, 1, 1, 1,
0.9526453, 0.458469, 0.9412293, 1, 1, 1, 1, 1,
0.9683629, -1.316732, 2.383318, 1, 1, 1, 1, 1,
0.9825484, 1.531734, 0.5328267, 1, 1, 1, 1, 1,
0.9939662, 0.287341, 1.740239, 1, 1, 1, 1, 1,
0.9970149, 0.244142, 1.127552, 1, 1, 1, 1, 1,
0.9971217, 0.6357958, 2.097812, 1, 1, 1, 1, 1,
0.9994276, 1.120126, 0.5539401, 1, 1, 1, 1, 1,
1.001959, 0.8308946, -0.06721807, 1, 1, 1, 1, 1,
1.003299, 0.5211256, 3.165597, 1, 1, 1, 1, 1,
1.003675, -0.07271606, 3.129819, 1, 1, 1, 1, 1,
1.0058, -0.8196754, -0.03911039, 1, 1, 1, 1, 1,
1.008919, -1.580657, 0.5682791, 1, 1, 1, 1, 1,
1.0148, 0.2361, 1.853018, 0, 0, 1, 1, 1,
1.016161, 0.7267845, 1.009627, 1, 0, 0, 1, 1,
1.028354, -0.5638251, 1.035978, 1, 0, 0, 1, 1,
1.038339, -0.03096712, 3.436182, 1, 0, 0, 1, 1,
1.039538, 1.069513, -0.2341256, 1, 0, 0, 1, 1,
1.044889, 0.04366807, -0.2294945, 1, 0, 0, 1, 1,
1.046621, -0.1022224, 1.960795, 0, 0, 0, 1, 1,
1.054928, -0.03176719, 1.440388, 0, 0, 0, 1, 1,
1.059967, -1.579504, 3.800346, 0, 0, 0, 1, 1,
1.065998, -0.2567601, 2.627874, 0, 0, 0, 1, 1,
1.067528, -0.1158321, 1.528328, 0, 0, 0, 1, 1,
1.068825, 0.2860464, 0.975913, 0, 0, 0, 1, 1,
1.07147, 0.2405883, -0.08667599, 0, 0, 0, 1, 1,
1.071613, 0.9370797, 0.1694426, 1, 1, 1, 1, 1,
1.072129, -0.7940414, 1.787132, 1, 1, 1, 1, 1,
1.07233, 0.09344818, 1.413001, 1, 1, 1, 1, 1,
1.073197, -1.199209, 2.387382, 1, 1, 1, 1, 1,
1.077254, -0.6063646, 3.607636, 1, 1, 1, 1, 1,
1.078846, 1.008972, 0.7680796, 1, 1, 1, 1, 1,
1.08118, -1.797301, 3.063158, 1, 1, 1, 1, 1,
1.083933, -0.6683655, 2.751735, 1, 1, 1, 1, 1,
1.091123, -0.0225709, 2.369234, 1, 1, 1, 1, 1,
1.096181, -0.466833, 0.7712693, 1, 1, 1, 1, 1,
1.097294, 0.6675056, 1.604828, 1, 1, 1, 1, 1,
1.098098, -0.3555141, 3.664907, 1, 1, 1, 1, 1,
1.100591, -2.766805, 3.657755, 1, 1, 1, 1, 1,
1.10072, -0.04008726, -0.6718317, 1, 1, 1, 1, 1,
1.110441, -0.494036, 2.19645, 1, 1, 1, 1, 1,
1.12225, -1.297306, 2.16862, 0, 0, 1, 1, 1,
1.130533, 0.8078314, 2.044485, 1, 0, 0, 1, 1,
1.131749, -0.5379835, 2.429681, 1, 0, 0, 1, 1,
1.1344, -0.2955908, 1.658858, 1, 0, 0, 1, 1,
1.140818, -1.111231, 1.679244, 1, 0, 0, 1, 1,
1.146724, -0.7186785, 1.787253, 1, 0, 0, 1, 1,
1.147264, -0.2109796, 0.4836199, 0, 0, 0, 1, 1,
1.150015, -1.509149, 2.700086, 0, 0, 0, 1, 1,
1.151104, -0.7826315, 1.768698, 0, 0, 0, 1, 1,
1.160833, -0.4384464, 2.594629, 0, 0, 0, 1, 1,
1.16122, 1.203291, 1.021682, 0, 0, 0, 1, 1,
1.162607, 0.6013054, 1.279092, 0, 0, 0, 1, 1,
1.168817, 1.424059, 1.494043, 0, 0, 0, 1, 1,
1.172558, -0.3259059, 1.019897, 1, 1, 1, 1, 1,
1.175677, 0.9263626, 1.502153, 1, 1, 1, 1, 1,
1.185473, 1.308689, 1.806291, 1, 1, 1, 1, 1,
1.187848, -0.6096011, 3.967289, 1, 1, 1, 1, 1,
1.19751, 0.8245497, 2.676494, 1, 1, 1, 1, 1,
1.20785, 1.905917, 1.528246, 1, 1, 1, 1, 1,
1.209264, 1.807778, 0.2774271, 1, 1, 1, 1, 1,
1.215901, -0.5229198, 0.4242142, 1, 1, 1, 1, 1,
1.216992, -1.009199, 0.9678791, 1, 1, 1, 1, 1,
1.22774, -0.6227365, 2.413549, 1, 1, 1, 1, 1,
1.228935, -0.2691096, 1.630267, 1, 1, 1, 1, 1,
1.230708, -0.7568637, 1.620843, 1, 1, 1, 1, 1,
1.239012, -0.1221841, 2.246921, 1, 1, 1, 1, 1,
1.240967, 0.3195631, 1.507737, 1, 1, 1, 1, 1,
1.244519, -0.0317251, 1.122787, 1, 1, 1, 1, 1,
1.250394, -1.296005, 3.929488, 0, 0, 1, 1, 1,
1.254066, 1.20898, 2.844577, 1, 0, 0, 1, 1,
1.259156, -0.898119, 2.068745, 1, 0, 0, 1, 1,
1.267169, 0.01249276, 0.9265966, 1, 0, 0, 1, 1,
1.275112, 0.1444893, 2.087054, 1, 0, 0, 1, 1,
1.292084, 0.2089364, 0.4172998, 1, 0, 0, 1, 1,
1.300977, 1.45745, 0.5213169, 0, 0, 0, 1, 1,
1.303651, -1.186534, 2.50507, 0, 0, 0, 1, 1,
1.304743, 1.701419, 0.269304, 0, 0, 0, 1, 1,
1.313642, 2.333796, -0.7773885, 0, 0, 0, 1, 1,
1.323818, -0.280993, 0.5439384, 0, 0, 0, 1, 1,
1.337978, -0.256161, 0.8862783, 0, 0, 0, 1, 1,
1.338403, -1.303979, 3.175658, 0, 0, 0, 1, 1,
1.33876, -0.4711884, 1.292641, 1, 1, 1, 1, 1,
1.343466, -0.3092813, 1.452669, 1, 1, 1, 1, 1,
1.343917, -0.7611181, 0.5795779, 1, 1, 1, 1, 1,
1.350493, 1.261281, 1.362732, 1, 1, 1, 1, 1,
1.351292, 3.000368, 1.429472, 1, 1, 1, 1, 1,
1.354268, 0.9802972, 1.563273, 1, 1, 1, 1, 1,
1.356291, -1.069427, 1.233309, 1, 1, 1, 1, 1,
1.358382, 0.995171, -1.088787, 1, 1, 1, 1, 1,
1.361379, 0.1184043, 0.5643378, 1, 1, 1, 1, 1,
1.361972, 0.3240275, -0.1897585, 1, 1, 1, 1, 1,
1.362939, 0.857961, 1.218849, 1, 1, 1, 1, 1,
1.371143, -0.8571222, 0.2123107, 1, 1, 1, 1, 1,
1.377277, -0.7973138, 2.719033, 1, 1, 1, 1, 1,
1.389547, -1.425995, 1.101939, 1, 1, 1, 1, 1,
1.397589, -2.201387, 2.157024, 1, 1, 1, 1, 1,
1.402725, 0.9760184, 1.327729, 0, 0, 1, 1, 1,
1.402948, -1.711858, 0.3694555, 1, 0, 0, 1, 1,
1.402995, -0.3294406, 1.817647, 1, 0, 0, 1, 1,
1.404321, 0.9939334, -1.185424, 1, 0, 0, 1, 1,
1.409225, 0.421905, 1.728892, 1, 0, 0, 1, 1,
1.415162, 0.1985529, 1.719489, 1, 0, 0, 1, 1,
1.416406, 0.6089007, -0.4854205, 0, 0, 0, 1, 1,
1.417798, 0.576923, 0.2145238, 0, 0, 0, 1, 1,
1.435739, 1.273002, -0.4913004, 0, 0, 0, 1, 1,
1.437159, -1.854581, 1.916223, 0, 0, 0, 1, 1,
1.440813, -0.3273087, 2.215998, 0, 0, 0, 1, 1,
1.442798, -1.687999, 2.724391, 0, 0, 0, 1, 1,
1.443855, 1.277342, 0.07852538, 0, 0, 0, 1, 1,
1.447809, 1.493549, 0.6600044, 1, 1, 1, 1, 1,
1.453467, 1.116728, 0.76809, 1, 1, 1, 1, 1,
1.492538, -0.7435379, 1.928845, 1, 1, 1, 1, 1,
1.498605, 1.299081, 2.187067, 1, 1, 1, 1, 1,
1.49999, -1.786823, 3.295688, 1, 1, 1, 1, 1,
1.505504, -0.003351828, 1.314172, 1, 1, 1, 1, 1,
1.509563, 1.669758, 1.223029, 1, 1, 1, 1, 1,
1.511602, 0.659095, 1.204413, 1, 1, 1, 1, 1,
1.515788, 1.039706, 1.161203, 1, 1, 1, 1, 1,
1.521714, 0.5196276, 0.5718767, 1, 1, 1, 1, 1,
1.532499, -0.1766719, 4.01897, 1, 1, 1, 1, 1,
1.54511, -0.03082308, 0.7242786, 1, 1, 1, 1, 1,
1.547596, -0.1991208, 0.2920491, 1, 1, 1, 1, 1,
1.548729, -0.9834719, 3.429796, 1, 1, 1, 1, 1,
1.558308, -1.076857, 2.905165, 1, 1, 1, 1, 1,
1.559121, -0.8062004, 1.921718, 0, 0, 1, 1, 1,
1.562075, -0.1172722, -0.8896787, 1, 0, 0, 1, 1,
1.569954, 1.449678, 1.328556, 1, 0, 0, 1, 1,
1.575667, 3.231345, 0.4426925, 1, 0, 0, 1, 1,
1.592251, 0.1610576, 2.872437, 1, 0, 0, 1, 1,
1.624052, -0.3234276, 1.502341, 1, 0, 0, 1, 1,
1.62972, 0.9431249, 0.04123603, 0, 0, 0, 1, 1,
1.630952, 0.7994184, 3.518906, 0, 0, 0, 1, 1,
1.639716, 0.1077273, 0.7811207, 0, 0, 0, 1, 1,
1.69351, -0.9671737, 2.05314, 0, 0, 0, 1, 1,
1.699405, -1.208154, 2.976484, 0, 0, 0, 1, 1,
1.728189, -0.3884387, 1.64027, 0, 0, 0, 1, 1,
1.735583, -0.8771183, 1.187917, 0, 0, 0, 1, 1,
1.735758, 0.812826, 1.599843, 1, 1, 1, 1, 1,
1.739243, -0.8107781, 1.691108, 1, 1, 1, 1, 1,
1.76546, -0.9685983, 2.999732, 1, 1, 1, 1, 1,
1.769415, -0.4912604, 2.13759, 1, 1, 1, 1, 1,
1.800993, 0.6152386, 3.284714, 1, 1, 1, 1, 1,
1.814903, 1.125864, 1.35875, 1, 1, 1, 1, 1,
1.857465, 0.2012488, 1.242146, 1, 1, 1, 1, 1,
1.868444, 1.351177, 0.9628815, 1, 1, 1, 1, 1,
1.876764, -1.467836, 2.592496, 1, 1, 1, 1, 1,
1.926428, 0.3326073, 1.128975, 1, 1, 1, 1, 1,
1.927423, 0.8037632, 1.092604, 1, 1, 1, 1, 1,
1.93149, 0.02632549, 3.20697, 1, 1, 1, 1, 1,
2.025415, 0.4163071, 0.9021293, 1, 1, 1, 1, 1,
2.030696, -1.070196, 2.019865, 1, 1, 1, 1, 1,
2.051234, 1.438782, 0.4031925, 1, 1, 1, 1, 1,
2.054837, -0.5985109, 3.794183, 0, 0, 1, 1, 1,
2.058759, 0.2310403, -0.3159471, 1, 0, 0, 1, 1,
2.065368, -0.8679759, 1.087116, 1, 0, 0, 1, 1,
2.070235, 0.6891866, 0.2655829, 1, 0, 0, 1, 1,
2.099185, 1.07545, 0.360576, 1, 0, 0, 1, 1,
2.120851, 0.8965497, 1.319601, 1, 0, 0, 1, 1,
2.124547, 0.4476629, 0.7292047, 0, 0, 0, 1, 1,
2.151103, -1.18534, 1.370344, 0, 0, 0, 1, 1,
2.169997, 0.4899974, 1.293241, 0, 0, 0, 1, 1,
2.185234, 0.3535369, 1.703466, 0, 0, 0, 1, 1,
2.191049, 0.01374908, 1.647239, 0, 0, 0, 1, 1,
2.209529, 0.3430161, 0.6485088, 0, 0, 0, 1, 1,
2.237425, 0.4437388, 2.751317, 0, 0, 0, 1, 1,
2.295631, 0.7237266, 0.7296423, 1, 1, 1, 1, 1,
2.295946, -1.619968, 1.850468, 1, 1, 1, 1, 1,
2.444948, -0.06422143, -0.5883988, 1, 1, 1, 1, 1,
2.461199, -0.02423051, 1.123636, 1, 1, 1, 1, 1,
2.467474, -1.692028, 1.344071, 1, 1, 1, 1, 1,
2.472215, -0.2829821, 2.54739, 1, 1, 1, 1, 1,
3.10945, 0.1293438, 0.8040364, 1, 1, 1, 1, 1
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
var radius = 9.203389;
var distance = 32.32652;
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
mvMatrix.translate( 0.2572894, -0.1809947, 0.3218904 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.32652);
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
