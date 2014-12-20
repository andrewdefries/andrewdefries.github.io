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
-4.154515, 0.6739298, -1.224486, 1, 0, 0, 1,
-3.552152, -0.01211005, -3.411227, 1, 0.007843138, 0, 1,
-2.513093, 0.5295293, -1.462207, 1, 0.01176471, 0, 1,
-2.504644, 0.8901614, -1.638, 1, 0.01960784, 0, 1,
-2.421228, -1.071562, -3.272371, 1, 0.02352941, 0, 1,
-2.404069, 0.365399, -1.156978, 1, 0.03137255, 0, 1,
-2.402309, 0.3669415, -0.316048, 1, 0.03529412, 0, 1,
-2.345493, 1.768209, -0.2101185, 1, 0.04313726, 0, 1,
-2.33164, 0.9039227, -2.001636, 1, 0.04705882, 0, 1,
-2.254132, 0.5369948, -1.739478, 1, 0.05490196, 0, 1,
-2.139483, 0.3568861, -1.766068, 1, 0.05882353, 0, 1,
-2.123703, -1.827899, -1.983406, 1, 0.06666667, 0, 1,
-2.11787, 0.5283991, -1.539535, 1, 0.07058824, 0, 1,
-2.037577, -0.5088096, -3.191055, 1, 0.07843138, 0, 1,
-2.033789, 0.2854877, -0.3441501, 1, 0.08235294, 0, 1,
-2.000344, 0.4522693, -0.8813416, 1, 0.09019608, 0, 1,
-1.979493, 1.363971, -0.3530741, 1, 0.09411765, 0, 1,
-1.977098, -0.4339129, -1.602497, 1, 0.1019608, 0, 1,
-1.969412, 0.4392199, 1.432826, 1, 0.1098039, 0, 1,
-1.959819, 1.226828, -0.6508422, 1, 0.1137255, 0, 1,
-1.950082, 0.3964224, -1.554611, 1, 0.1215686, 0, 1,
-1.943505, 1.786312, -0.4098656, 1, 0.1254902, 0, 1,
-1.907634, 1.596403, -0.2425625, 1, 0.1333333, 0, 1,
-1.898456, -1.238534, -2.056795, 1, 0.1372549, 0, 1,
-1.888368, -0.5276816, -3.175259, 1, 0.145098, 0, 1,
-1.881605, -0.6070239, -2.234475, 1, 0.1490196, 0, 1,
-1.876824, -2.142024, -4.014516, 1, 0.1568628, 0, 1,
-1.862197, 0.08686554, -0.432627, 1, 0.1607843, 0, 1,
-1.853017, -0.9718159, -1.702398, 1, 0.1686275, 0, 1,
-1.849773, 0.3125823, -1.173861, 1, 0.172549, 0, 1,
-1.824901, -1.25155, -0.8221717, 1, 0.1803922, 0, 1,
-1.818131, -0.3827932, -1.139519, 1, 0.1843137, 0, 1,
-1.801021, 1.031822, -0.3882539, 1, 0.1921569, 0, 1,
-1.784232, 0.2092573, -1.028008, 1, 0.1960784, 0, 1,
-1.7628, 0.1833889, -1.966279, 1, 0.2039216, 0, 1,
-1.756679, 1.47328, -0.05299973, 1, 0.2117647, 0, 1,
-1.756669, -0.07578088, -2.044453, 1, 0.2156863, 0, 1,
-1.75455, 0.73726, -2.239718, 1, 0.2235294, 0, 1,
-1.743645, -1.468997, -1.671185, 1, 0.227451, 0, 1,
-1.740827, -0.3710492, -2.305196, 1, 0.2352941, 0, 1,
-1.725004, -2.858871, -2.469639, 1, 0.2392157, 0, 1,
-1.706406, 0.07307021, -1.771114, 1, 0.2470588, 0, 1,
-1.699569, -0.01093734, -1.036599, 1, 0.2509804, 0, 1,
-1.692837, -0.4965047, -1.204344, 1, 0.2588235, 0, 1,
-1.690722, -0.2517196, -2.02544, 1, 0.2627451, 0, 1,
-1.676052, -1.822237, -1.273963, 1, 0.2705882, 0, 1,
-1.672495, 0.9182677, -1.961338, 1, 0.2745098, 0, 1,
-1.659248, -0.02475942, -0.267318, 1, 0.282353, 0, 1,
-1.657866, 0.6739783, -1.223498, 1, 0.2862745, 0, 1,
-1.650473, 0.4326851, -2.680825, 1, 0.2941177, 0, 1,
-1.649992, 1.8071, -1.987288, 1, 0.3019608, 0, 1,
-1.649569, 0.04205589, -3.034131, 1, 0.3058824, 0, 1,
-1.635771, -0.04413971, -0.8430938, 1, 0.3137255, 0, 1,
-1.62292, 1.746948, -0.9584006, 1, 0.3176471, 0, 1,
-1.618096, 1.40102, 0.3877182, 1, 0.3254902, 0, 1,
-1.612307, -0.06455787, -1.194432, 1, 0.3294118, 0, 1,
-1.610516, -0.06882983, -1.48454, 1, 0.3372549, 0, 1,
-1.579208, -2.742452, -1.479433, 1, 0.3411765, 0, 1,
-1.578875, 0.8823075, -1.443214, 1, 0.3490196, 0, 1,
-1.574824, -0.6820417, -1.512762, 1, 0.3529412, 0, 1,
-1.560943, 2.156119, -1.075433, 1, 0.3607843, 0, 1,
-1.553864, 0.8932954, -0.6400568, 1, 0.3647059, 0, 1,
-1.553845, 0.5278195, -0.6520627, 1, 0.372549, 0, 1,
-1.552075, -0.9994463, -1.997061, 1, 0.3764706, 0, 1,
-1.545392, 0.5412282, 0.5282375, 1, 0.3843137, 0, 1,
-1.544946, -0.68657, -1.40533, 1, 0.3882353, 0, 1,
-1.544671, -0.07875562, -1.960169, 1, 0.3960784, 0, 1,
-1.53234, 0.4022892, -2.410267, 1, 0.4039216, 0, 1,
-1.506955, -1.544142, -2.337826, 1, 0.4078431, 0, 1,
-1.503093, -1.078722, -2.397983, 1, 0.4156863, 0, 1,
-1.49365, 1.063774, 0.1627635, 1, 0.4196078, 0, 1,
-1.491996, 0.6106293, -1.536078, 1, 0.427451, 0, 1,
-1.48912, -0.9196025, -2.909473, 1, 0.4313726, 0, 1,
-1.485447, -0.2381656, -3.545429, 1, 0.4392157, 0, 1,
-1.462692, 1.209538, 0.007826944, 1, 0.4431373, 0, 1,
-1.447505, 1.292293, -1.789994, 1, 0.4509804, 0, 1,
-1.438555, 0.7975564, -1.001158, 1, 0.454902, 0, 1,
-1.436628, 1.760373, 0.658008, 1, 0.4627451, 0, 1,
-1.434711, 1.02899, -2.273772, 1, 0.4666667, 0, 1,
-1.429636, -1.361929, -3.316235, 1, 0.4745098, 0, 1,
-1.413279, -2.387323, -2.099383, 1, 0.4784314, 0, 1,
-1.403803, 1.389471, -1.253276, 1, 0.4862745, 0, 1,
-1.402322, 0.1654435, -1.61196, 1, 0.4901961, 0, 1,
-1.389113, 0.7617892, -1.331594, 1, 0.4980392, 0, 1,
-1.381742, 0.653796, -1.186565, 1, 0.5058824, 0, 1,
-1.377965, 1.461362, -0.9576202, 1, 0.509804, 0, 1,
-1.373286, -0.1961289, -0.6636882, 1, 0.5176471, 0, 1,
-1.373189, 0.8977506, -2.193547, 1, 0.5215687, 0, 1,
-1.366842, 1.373265, -0.7754101, 1, 0.5294118, 0, 1,
-1.362465, -0.4392031, -2.305333, 1, 0.5333334, 0, 1,
-1.360622, -1.333796, -4.763617, 1, 0.5411765, 0, 1,
-1.357027, 1.491328, -0.858393, 1, 0.5450981, 0, 1,
-1.355659, 0.2851712, -1.554663, 1, 0.5529412, 0, 1,
-1.355202, 0.3781469, -2.102444, 1, 0.5568628, 0, 1,
-1.350032, 0.02808688, -1.408787, 1, 0.5647059, 0, 1,
-1.347844, 0.4778356, -0.8675905, 1, 0.5686275, 0, 1,
-1.34186, -0.3172001, -3.137344, 1, 0.5764706, 0, 1,
-1.339475, 0.05369464, -1.312189, 1, 0.5803922, 0, 1,
-1.33799, -0.1443058, -1.071033, 1, 0.5882353, 0, 1,
-1.329136, -0.3956455, -3.237916, 1, 0.5921569, 0, 1,
-1.321244, -0.99143, -2.174561, 1, 0.6, 0, 1,
-1.308157, 1.012427, -0.6641235, 1, 0.6078432, 0, 1,
-1.294205, -0.2006668, -1.706724, 1, 0.6117647, 0, 1,
-1.289384, -1.006874, -2.711458, 1, 0.6196079, 0, 1,
-1.289241, -1.004698, -1.126656, 1, 0.6235294, 0, 1,
-1.275873, -0.4243587, -1.413764, 1, 0.6313726, 0, 1,
-1.270071, 0.9464513, 0.07487168, 1, 0.6352941, 0, 1,
-1.269725, -1.208203, -2.549312, 1, 0.6431373, 0, 1,
-1.267814, -0.7332214, -1.57915, 1, 0.6470588, 0, 1,
-1.267647, 2.291883, -1.439603, 1, 0.654902, 0, 1,
-1.26322, -0.3165512, -1.27117, 1, 0.6588235, 0, 1,
-1.258776, 0.4867812, -1.173151, 1, 0.6666667, 0, 1,
-1.25321, -0.2966539, -0.8658566, 1, 0.6705883, 0, 1,
-1.251871, 0.7685041, -1.021187, 1, 0.6784314, 0, 1,
-1.251682, -1.188478, -2.323084, 1, 0.682353, 0, 1,
-1.235733, 0.3048881, -2.559107, 1, 0.6901961, 0, 1,
-1.228962, -0.1496775, -1.553934, 1, 0.6941177, 0, 1,
-1.227966, -0.4659343, -0.7202558, 1, 0.7019608, 0, 1,
-1.226965, 1.560534, -0.8878666, 1, 0.7098039, 0, 1,
-1.225398, 0.06073746, -2.025697, 1, 0.7137255, 0, 1,
-1.218043, -0.4510267, -2.450095, 1, 0.7215686, 0, 1,
-1.213835, 0.460086, 0.4350569, 1, 0.7254902, 0, 1,
-1.212635, 1.782521, 0.1824306, 1, 0.7333333, 0, 1,
-1.200461, -0.898018, -1.451907, 1, 0.7372549, 0, 1,
-1.199169, 0.01578714, -1.455172, 1, 0.7450981, 0, 1,
-1.198058, -0.2362208, -0.3400325, 1, 0.7490196, 0, 1,
-1.192342, 2.422724, -0.1746522, 1, 0.7568628, 0, 1,
-1.189798, 1.208877, -1.384812, 1, 0.7607843, 0, 1,
-1.183297, 0.6915708, -2.276284, 1, 0.7686275, 0, 1,
-1.18013, -1.085348, -1.396098, 1, 0.772549, 0, 1,
-1.173081, 0.6890969, -0.2895754, 1, 0.7803922, 0, 1,
-1.172364, 1.569739, -0.305741, 1, 0.7843137, 0, 1,
-1.161169, 0.002786117, -1.482383, 1, 0.7921569, 0, 1,
-1.154433, -0.2403268, -3.30051, 1, 0.7960784, 0, 1,
-1.146445, -0.2926371, -0.832435, 1, 0.8039216, 0, 1,
-1.144806, 0.1081448, -1.238037, 1, 0.8117647, 0, 1,
-1.137936, 1.174107, -1.051188, 1, 0.8156863, 0, 1,
-1.136077, 0.4612999, -1.960357, 1, 0.8235294, 0, 1,
-1.13334, 0.7132471, -0.3715605, 1, 0.827451, 0, 1,
-1.130183, 0.6710457, -0.9600524, 1, 0.8352941, 0, 1,
-1.127613, 0.5365738, -0.416021, 1, 0.8392157, 0, 1,
-1.125001, -2.285912, -2.633553, 1, 0.8470588, 0, 1,
-1.121909, -1.167536, -2.650865, 1, 0.8509804, 0, 1,
-1.119153, 1.364423, -0.9150814, 1, 0.8588235, 0, 1,
-1.115906, 2.182513, 0.155975, 1, 0.8627451, 0, 1,
-1.104903, 0.1454193, -0.7752195, 1, 0.8705882, 0, 1,
-1.099729, -0.1754034, -2.509104, 1, 0.8745098, 0, 1,
-1.09795, -0.4729762, -1.940412, 1, 0.8823529, 0, 1,
-1.086126, -1.782108, -3.67116, 1, 0.8862745, 0, 1,
-1.084122, 1.02801, -1.252668, 1, 0.8941177, 0, 1,
-1.075312, -1.272565, -3.433766, 1, 0.8980392, 0, 1,
-1.074666, -0.5722045, -3.251519, 1, 0.9058824, 0, 1,
-1.065623, -1.473265, -3.585742, 1, 0.9137255, 0, 1,
-1.064515, -1.361312, -1.482501, 1, 0.9176471, 0, 1,
-1.060903, -0.3510133, -2.288074, 1, 0.9254902, 0, 1,
-1.059603, 1.274832, 0.129943, 1, 0.9294118, 0, 1,
-1.05766, 0.9790226, -1.175292, 1, 0.9372549, 0, 1,
-1.054484, 0.5754624, -0.3514013, 1, 0.9411765, 0, 1,
-1.052428, -1.870595, -0.9952484, 1, 0.9490196, 0, 1,
-1.047184, 2.933798, 0.504355, 1, 0.9529412, 0, 1,
-1.045659, 0.4227106, -2.100124, 1, 0.9607843, 0, 1,
-1.045396, -0.395698, -2.810158, 1, 0.9647059, 0, 1,
-1.044251, 0.2615693, -2.201344, 1, 0.972549, 0, 1,
-1.038152, -0.8337138, -2.199531, 1, 0.9764706, 0, 1,
-1.036823, -1.78471, -2.122612, 1, 0.9843137, 0, 1,
-1.030053, 0.3141109, -1.41168, 1, 0.9882353, 0, 1,
-1.020154, 0.9574975, -0.6066248, 1, 0.9960784, 0, 1,
-1.017768, 0.518901, -1.113571, 0.9960784, 1, 0, 1,
-1.015616, -0.3845062, -3.153988, 0.9921569, 1, 0, 1,
-1.013434, -2.515363, -2.258915, 0.9843137, 1, 0, 1,
-1.013146, 0.3632203, -1.354267, 0.9803922, 1, 0, 1,
-1.003513, 0.5066347, -1.828139, 0.972549, 1, 0, 1,
-0.9971009, -0.9322228, -2.779037, 0.9686275, 1, 0, 1,
-0.9935475, -0.6328096, -0.7897706, 0.9607843, 1, 0, 1,
-0.9923444, -0.08061089, -1.135878, 0.9568627, 1, 0, 1,
-0.9906371, 0.163586, -2.434738, 0.9490196, 1, 0, 1,
-0.9891912, 0.9528933, -2.209013, 0.945098, 1, 0, 1,
-0.982796, 0.1685581, 0.002622005, 0.9372549, 1, 0, 1,
-0.981389, 0.9930406, 0.08705335, 0.9333333, 1, 0, 1,
-0.980269, -0.0426256, -0.8541028, 0.9254902, 1, 0, 1,
-0.9798923, -2.37201, -3.383627, 0.9215686, 1, 0, 1,
-0.978414, 1.027254, -0.7144213, 0.9137255, 1, 0, 1,
-0.977283, 0.09286584, -3.223052, 0.9098039, 1, 0, 1,
-0.9676869, 0.07067419, -1.511853, 0.9019608, 1, 0, 1,
-0.9595436, -0.4839663, 0.07992011, 0.8941177, 1, 0, 1,
-0.9579262, 0.5088763, -0.6928425, 0.8901961, 1, 0, 1,
-0.9578774, -0.06169606, -4.087527, 0.8823529, 1, 0, 1,
-0.9572128, 0.1997811, -1.473105, 0.8784314, 1, 0, 1,
-0.9565825, 0.2679378, -0.05355393, 0.8705882, 1, 0, 1,
-0.9422935, -0.6812648, -1.995376, 0.8666667, 1, 0, 1,
-0.9418253, 0.8097511, -1.564324, 0.8588235, 1, 0, 1,
-0.9415683, 0.5627117, -1.061285, 0.854902, 1, 0, 1,
-0.9373373, -1.439101, -1.065469, 0.8470588, 1, 0, 1,
-0.9363167, -0.2183404, -1.68533, 0.8431373, 1, 0, 1,
-0.9358853, -0.5558014, -2.35337, 0.8352941, 1, 0, 1,
-0.9346307, 0.2508138, -2.947085, 0.8313726, 1, 0, 1,
-0.9322217, 0.09524141, -0.4186724, 0.8235294, 1, 0, 1,
-0.9315745, -0.6178272, -2.332028, 0.8196079, 1, 0, 1,
-0.9237599, 0.7638504, -1.188515, 0.8117647, 1, 0, 1,
-0.9100922, 1.199057, -0.9021785, 0.8078431, 1, 0, 1,
-0.9061398, -0.6770696, -2.127584, 0.8, 1, 0, 1,
-0.9030468, -1.016813, -1.864214, 0.7921569, 1, 0, 1,
-0.8985453, 0.4672206, -0.7534286, 0.7882353, 1, 0, 1,
-0.8948371, -0.7622527, -4.196878, 0.7803922, 1, 0, 1,
-0.8935664, -1.204149, -0.7159396, 0.7764706, 1, 0, 1,
-0.8916033, -1.233917, -2.656402, 0.7686275, 1, 0, 1,
-0.888164, -0.1018323, 0.2920995, 0.7647059, 1, 0, 1,
-0.8869712, 1.624921, 0.6370766, 0.7568628, 1, 0, 1,
-0.8809412, 0.3380438, -1.327556, 0.7529412, 1, 0, 1,
-0.8781034, -0.6669587, -3.917267, 0.7450981, 1, 0, 1,
-0.875972, 0.1686745, -0.630536, 0.7411765, 1, 0, 1,
-0.8721882, 0.1735288, -2.160714, 0.7333333, 1, 0, 1,
-0.8640849, 2.156134, -0.4098862, 0.7294118, 1, 0, 1,
-0.860986, 2.146034, 0.03088912, 0.7215686, 1, 0, 1,
-0.8596861, 0.3377102, -1.163955, 0.7176471, 1, 0, 1,
-0.8574391, 0.01379219, -0.7478421, 0.7098039, 1, 0, 1,
-0.8460801, -1.261889, -3.877175, 0.7058824, 1, 0, 1,
-0.8394899, 0.6738235, -0.7251368, 0.6980392, 1, 0, 1,
-0.8368745, -1.350857, -1.789071, 0.6901961, 1, 0, 1,
-0.8351822, 0.297394, -1.362077, 0.6862745, 1, 0, 1,
-0.8350241, -0.5268249, -4.0271, 0.6784314, 1, 0, 1,
-0.8342267, 1.529462, 0.7041685, 0.6745098, 1, 0, 1,
-0.8339208, 0.3976456, -1.326634, 0.6666667, 1, 0, 1,
-0.8306372, -0.8614841, -1.843786, 0.6627451, 1, 0, 1,
-0.8294129, 2.173838, -1.019646, 0.654902, 1, 0, 1,
-0.8289597, -0.8595981, -2.446269, 0.6509804, 1, 0, 1,
-0.8284386, 0.6952932, -1.06979, 0.6431373, 1, 0, 1,
-0.8256033, 3.035954, 0.4893219, 0.6392157, 1, 0, 1,
-0.8143225, 0.2352298, -0.6933117, 0.6313726, 1, 0, 1,
-0.8115465, 1.401976, -0.2917226, 0.627451, 1, 0, 1,
-0.811074, -0.4888142, -2.342627, 0.6196079, 1, 0, 1,
-0.8079085, -0.1222384, 0.1012175, 0.6156863, 1, 0, 1,
-0.8045456, -1.570872, -2.044643, 0.6078432, 1, 0, 1,
-0.801617, 0.04025391, -0.8331761, 0.6039216, 1, 0, 1,
-0.8005767, 0.2046086, -2.686623, 0.5960785, 1, 0, 1,
-0.79833, -0.4503104, -1.272346, 0.5882353, 1, 0, 1,
-0.7959276, -0.3039078, -4.092804, 0.5843138, 1, 0, 1,
-0.7915754, 0.3649887, -1.013397, 0.5764706, 1, 0, 1,
-0.7849324, 1.662858, -1.316814, 0.572549, 1, 0, 1,
-0.7846125, -1.878663, -2.650106, 0.5647059, 1, 0, 1,
-0.7826444, -2.432185, -4.121744, 0.5607843, 1, 0, 1,
-0.7818106, -0.8505852, -4.27108, 0.5529412, 1, 0, 1,
-0.7817839, 0.08190354, -1.579733, 0.5490196, 1, 0, 1,
-0.7738008, 1.853081, -0.03712187, 0.5411765, 1, 0, 1,
-0.7734559, -1.516072, -1.905106, 0.5372549, 1, 0, 1,
-0.7687619, 0.4148953, -2.359429, 0.5294118, 1, 0, 1,
-0.7681878, -0.460986, -0.2514463, 0.5254902, 1, 0, 1,
-0.7671993, 1.978596, -0.4822893, 0.5176471, 1, 0, 1,
-0.7660457, -0.3423194, -1.480603, 0.5137255, 1, 0, 1,
-0.7609837, -1.684923, -1.981914, 0.5058824, 1, 0, 1,
-0.7600555, 0.4481162, -2.925661, 0.5019608, 1, 0, 1,
-0.7550353, -1.404919, -1.853626, 0.4941176, 1, 0, 1,
-0.7541358, -0.6276398, -2.271188, 0.4862745, 1, 0, 1,
-0.7442842, -0.2251418, 0.7783064, 0.4823529, 1, 0, 1,
-0.7397469, -0.4030504, -2.427578, 0.4745098, 1, 0, 1,
-0.7385046, 1.066554, 1.005815, 0.4705882, 1, 0, 1,
-0.7376192, -0.1180991, -0.4458973, 0.4627451, 1, 0, 1,
-0.7350727, -0.8159414, -2.406418, 0.4588235, 1, 0, 1,
-0.7323661, -0.2813368, -0.5860158, 0.4509804, 1, 0, 1,
-0.7320794, -1.538145, -2.794802, 0.4470588, 1, 0, 1,
-0.7291966, 1.204684, 0.3626711, 0.4392157, 1, 0, 1,
-0.7273629, -0.3585345, -2.193296, 0.4352941, 1, 0, 1,
-0.7220392, -0.7289802, -3.571393, 0.427451, 1, 0, 1,
-0.7070826, 0.6282063, 0.8452401, 0.4235294, 1, 0, 1,
-0.7003532, 2.044585, 0.06048097, 0.4156863, 1, 0, 1,
-0.6946673, 0.3832841, -0.8170457, 0.4117647, 1, 0, 1,
-0.690838, 1.058816, -1.465575, 0.4039216, 1, 0, 1,
-0.6898082, 0.8873634, -0.6677656, 0.3960784, 1, 0, 1,
-0.6896207, 0.2253582, -0.3425762, 0.3921569, 1, 0, 1,
-0.688131, -2.00807, -2.640409, 0.3843137, 1, 0, 1,
-0.6867429, 0.363334, -0.8077487, 0.3803922, 1, 0, 1,
-0.686157, -2.095631, -2.973851, 0.372549, 1, 0, 1,
-0.6814633, 2.442565, -0.6756841, 0.3686275, 1, 0, 1,
-0.6788979, 1.98298, -1.258367, 0.3607843, 1, 0, 1,
-0.6671863, -0.05082416, -2.323917, 0.3568628, 1, 0, 1,
-0.6583759, 1.006368, 0.9397423, 0.3490196, 1, 0, 1,
-0.6565714, 1.274406, -0.9192972, 0.345098, 1, 0, 1,
-0.6499436, 0.625391, -2.134834, 0.3372549, 1, 0, 1,
-0.6458996, -1.077274, -1.174304, 0.3333333, 1, 0, 1,
-0.6399585, 0.9923162, -0.5299567, 0.3254902, 1, 0, 1,
-0.6303772, -0.3473147, -2.282072, 0.3215686, 1, 0, 1,
-0.6230564, 0.4185437, 0.6412357, 0.3137255, 1, 0, 1,
-0.6179464, -0.8343118, -3.984785, 0.3098039, 1, 0, 1,
-0.6108868, 1.869771, 0.6869669, 0.3019608, 1, 0, 1,
-0.6082605, -0.2999732, -1.474614, 0.2941177, 1, 0, 1,
-0.6016033, -1.034958, -1.938559, 0.2901961, 1, 0, 1,
-0.6015031, 2.31458, 0.5243509, 0.282353, 1, 0, 1,
-0.5924903, 1.469496, -0.1000626, 0.2784314, 1, 0, 1,
-0.5882165, 0.521024, -2.428387, 0.2705882, 1, 0, 1,
-0.584765, 0.7385083, -0.9768828, 0.2666667, 1, 0, 1,
-0.5844945, 0.08891509, -0.8760823, 0.2588235, 1, 0, 1,
-0.583977, -0.4559539, -1.944637, 0.254902, 1, 0, 1,
-0.5824941, 0.6265162, -0.5374975, 0.2470588, 1, 0, 1,
-0.5817055, 0.4362155, 0.2016411, 0.2431373, 1, 0, 1,
-0.5768318, -1.322633, -3.237798, 0.2352941, 1, 0, 1,
-0.5762365, -0.3625521, -1.015382, 0.2313726, 1, 0, 1,
-0.5718679, 0.8368334, -0.3665835, 0.2235294, 1, 0, 1,
-0.5667521, -0.3188162, -3.71183, 0.2196078, 1, 0, 1,
-0.558932, 0.02854513, -0.8848742, 0.2117647, 1, 0, 1,
-0.5576496, -0.6591387, -2.973184, 0.2078431, 1, 0, 1,
-0.5538266, 0.6906945, -0.3531498, 0.2, 1, 0, 1,
-0.5534399, 0.3589309, -0.9975323, 0.1921569, 1, 0, 1,
-0.5520311, 2.091454, -1.822511, 0.1882353, 1, 0, 1,
-0.5496085, -0.6530368, -2.886272, 0.1803922, 1, 0, 1,
-0.5480657, -1.728881, -2.929994, 0.1764706, 1, 0, 1,
-0.5468985, 1.215132, 2.018809, 0.1686275, 1, 0, 1,
-0.5442159, -1.178108, -1.710678, 0.1647059, 1, 0, 1,
-0.5440168, -0.86331, -2.613879, 0.1568628, 1, 0, 1,
-0.5423485, 0.184981, -0.9917462, 0.1529412, 1, 0, 1,
-0.541776, -0.6516758, -1.823919, 0.145098, 1, 0, 1,
-0.5410599, -0.7504051, -3.196129, 0.1411765, 1, 0, 1,
-0.5407027, -0.4000811, -1.131354, 0.1333333, 1, 0, 1,
-0.537692, -0.3313304, -1.665478, 0.1294118, 1, 0, 1,
-0.5334846, 1.431141, 1.135034, 0.1215686, 1, 0, 1,
-0.533399, -0.002794469, -1.923091, 0.1176471, 1, 0, 1,
-0.5323198, -2.041627, -3.059373, 0.1098039, 1, 0, 1,
-0.5321624, 0.434373, -1.072207, 0.1058824, 1, 0, 1,
-0.5291923, 0.988628, -3.232086, 0.09803922, 1, 0, 1,
-0.5277526, -0.1506791, -1.55054, 0.09019608, 1, 0, 1,
-0.5274187, -1.142784, -1.148119, 0.08627451, 1, 0, 1,
-0.5227085, -0.8650081, -3.449412, 0.07843138, 1, 0, 1,
-0.522637, -2.520252, -2.628145, 0.07450981, 1, 0, 1,
-0.5198991, -0.4156827, -2.553059, 0.06666667, 1, 0, 1,
-0.5196874, -0.7761701, -2.108491, 0.0627451, 1, 0, 1,
-0.5191034, -0.4447809, -0.3787763, 0.05490196, 1, 0, 1,
-0.5187078, 1.767872, -1.317341, 0.05098039, 1, 0, 1,
-0.5159605, 1.715215, 0.2172648, 0.04313726, 1, 0, 1,
-0.5154529, 1.967913, -1.781382, 0.03921569, 1, 0, 1,
-0.5146543, -0.3898022, -2.620765, 0.03137255, 1, 0, 1,
-0.513652, -0.7885476, -3.644906, 0.02745098, 1, 0, 1,
-0.5131941, -0.7257241, -3.451283, 0.01960784, 1, 0, 1,
-0.5115265, 0.9581082, -0.002636724, 0.01568628, 1, 0, 1,
-0.5100564, -0.3776346, -2.742759, 0.007843138, 1, 0, 1,
-0.5098312, -0.3287809, -3.497895, 0.003921569, 1, 0, 1,
-0.5066352, 0.6203437, 1.740686, 0, 1, 0.003921569, 1,
-0.5044314, -1.480569, -0.8442965, 0, 1, 0.01176471, 1,
-0.5039778, 0.6832827, 0.219091, 0, 1, 0.01568628, 1,
-0.502734, 1.146855, -0.5294013, 0, 1, 0.02352941, 1,
-0.4992706, 0.6952872, -0.2929198, 0, 1, 0.02745098, 1,
-0.4946655, -1.69362, -3.44523, 0, 1, 0.03529412, 1,
-0.4934152, 0.09337404, -2.03012, 0, 1, 0.03921569, 1,
-0.4930394, 1.656407, 0.646161, 0, 1, 0.04705882, 1,
-0.4897577, -0.009084177, -3.011481, 0, 1, 0.05098039, 1,
-0.4880816, -0.2413028, -3.140633, 0, 1, 0.05882353, 1,
-0.487958, 0.1380393, -0.7226166, 0, 1, 0.0627451, 1,
-0.4821874, -0.9872553, -1.364626, 0, 1, 0.07058824, 1,
-0.4711971, -0.9913889, -2.42916, 0, 1, 0.07450981, 1,
-0.4677076, 0.3121238, -1.55543, 0, 1, 0.08235294, 1,
-0.4655735, -0.2070938, -1.354247, 0, 1, 0.08627451, 1,
-0.4625793, -0.232583, -1.454266, 0, 1, 0.09411765, 1,
-0.4572756, -1.794122, -1.894288, 0, 1, 0.1019608, 1,
-0.4551948, -0.1422472, -2.24803, 0, 1, 0.1058824, 1,
-0.4449702, -0.7257425, -3.65367, 0, 1, 0.1137255, 1,
-0.4432274, 0.4813722, -1.620631, 0, 1, 0.1176471, 1,
-0.4422927, 0.5785762, -1.3265, 0, 1, 0.1254902, 1,
-0.4414878, 0.9462606, -0.06435207, 0, 1, 0.1294118, 1,
-0.4347842, 0.9621029, 0.1073206, 0, 1, 0.1372549, 1,
-0.4285806, -0.2051802, -1.790298, 0, 1, 0.1411765, 1,
-0.4275255, -0.2997539, -2.689716, 0, 1, 0.1490196, 1,
-0.421869, -0.2790574, 0.4458355, 0, 1, 0.1529412, 1,
-0.4217899, -0.877481, -3.923953, 0, 1, 0.1607843, 1,
-0.4204452, 0.5981745, -0.7440321, 0, 1, 0.1647059, 1,
-0.4185357, -0.6267459, -2.559928, 0, 1, 0.172549, 1,
-0.4165373, -1.364656, -2.261795, 0, 1, 0.1764706, 1,
-0.4163879, 1.607949, -0.7567457, 0, 1, 0.1843137, 1,
-0.4134767, -0.3822428, -3.842609, 0, 1, 0.1882353, 1,
-0.4117203, -1.338292, -4.486212, 0, 1, 0.1960784, 1,
-0.4098975, 1.062661, -1.06152, 0, 1, 0.2039216, 1,
-0.3986093, -0.5161631, -3.947825, 0, 1, 0.2078431, 1,
-0.3979073, 0.2922763, -1.575312, 0, 1, 0.2156863, 1,
-0.3931679, 0.1522309, -2.464806, 0, 1, 0.2196078, 1,
-0.3914138, -0.009501419, -2.680559, 0, 1, 0.227451, 1,
-0.3846882, 0.5132878, 0.4364366, 0, 1, 0.2313726, 1,
-0.3831671, -2.63523, -4.499638, 0, 1, 0.2392157, 1,
-0.382809, 0.5162708, -1.775306, 0, 1, 0.2431373, 1,
-0.3827431, -0.5493667, -2.56068, 0, 1, 0.2509804, 1,
-0.382157, 1.598879, -0.4285979, 0, 1, 0.254902, 1,
-0.3820995, 1.041305, -0.7785693, 0, 1, 0.2627451, 1,
-0.3785317, 1.196079, -0.8401781, 0, 1, 0.2666667, 1,
-0.3784355, 1.246847, 0.2800679, 0, 1, 0.2745098, 1,
-0.3774686, -0.0321666, -2.227082, 0, 1, 0.2784314, 1,
-0.3770974, -0.02330572, -1.834281, 0, 1, 0.2862745, 1,
-0.3704774, 0.7557245, -1.000251, 0, 1, 0.2901961, 1,
-0.3704455, 0.2771084, -0.616666, 0, 1, 0.2980392, 1,
-0.3670562, 1.17317, 0.1500581, 0, 1, 0.3058824, 1,
-0.3628399, -1.298594, -2.759273, 0, 1, 0.3098039, 1,
-0.3618173, 0.5980265, 0.3660137, 0, 1, 0.3176471, 1,
-0.3595861, 0.003680927, -1.741995, 0, 1, 0.3215686, 1,
-0.3591647, -0.3694007, -1.503715, 0, 1, 0.3294118, 1,
-0.357847, -0.7145985, -1.940882, 0, 1, 0.3333333, 1,
-0.35761, 0.9700763, -2.144817, 0, 1, 0.3411765, 1,
-0.3573023, -0.9127676, -1.856733, 0, 1, 0.345098, 1,
-0.3555884, -1.085475, -3.565795, 0, 1, 0.3529412, 1,
-0.354431, 1.360873, 0.184314, 0, 1, 0.3568628, 1,
-0.3541098, -0.7976393, -1.704641, 0, 1, 0.3647059, 1,
-0.3505671, 1.614339, 1.152566, 0, 1, 0.3686275, 1,
-0.3492071, -1.014899, -2.602768, 0, 1, 0.3764706, 1,
-0.3464758, 0.0967005, -1.478622, 0, 1, 0.3803922, 1,
-0.3464236, 0.1236761, -0.7227964, 0, 1, 0.3882353, 1,
-0.3443063, -0.49923, -2.780931, 0, 1, 0.3921569, 1,
-0.3417546, -1.217892, -2.272227, 0, 1, 0.4, 1,
-0.3378011, -0.9789051, -2.814726, 0, 1, 0.4078431, 1,
-0.3368074, 0.2910842, -0.465358, 0, 1, 0.4117647, 1,
-0.3346241, -0.2427868, -0.6366644, 0, 1, 0.4196078, 1,
-0.3319325, -0.000646067, -1.89249, 0, 1, 0.4235294, 1,
-0.3233156, -0.8804935, -1.793103, 0, 1, 0.4313726, 1,
-0.3215812, 0.5072184, -0.6628833, 0, 1, 0.4352941, 1,
-0.3206908, -0.7387754, -1.508395, 0, 1, 0.4431373, 1,
-0.3174424, 0.006745894, -2.294208, 0, 1, 0.4470588, 1,
-0.3137619, -0.1739524, -1.996849, 0, 1, 0.454902, 1,
-0.313244, -1.043515, -3.126804, 0, 1, 0.4588235, 1,
-0.3122515, 1.349578, 1.203333, 0, 1, 0.4666667, 1,
-0.310324, -0.8264886, -2.542762, 0, 1, 0.4705882, 1,
-0.3080501, 2.070552, -2.601127, 0, 1, 0.4784314, 1,
-0.3076291, 0.7288419, -0.4290525, 0, 1, 0.4823529, 1,
-0.3067963, 0.8651269, -0.4748966, 0, 1, 0.4901961, 1,
-0.3040574, 1.472974, -0.2887809, 0, 1, 0.4941176, 1,
-0.3024636, 0.5168399, 0.4282643, 0, 1, 0.5019608, 1,
-0.3024189, 1.834742, -1.135595, 0, 1, 0.509804, 1,
-0.2974431, 1.5701, 0.4842255, 0, 1, 0.5137255, 1,
-0.2963383, -1.24385, -3.031675, 0, 1, 0.5215687, 1,
-0.2879795, 1.658476, -0.2274261, 0, 1, 0.5254902, 1,
-0.2833179, -1.809156, -3.529289, 0, 1, 0.5333334, 1,
-0.2758931, -1.00937, -1.88095, 0, 1, 0.5372549, 1,
-0.2738162, 0.06961601, -2.008983, 0, 1, 0.5450981, 1,
-0.270174, 0.2497212, 0.1455066, 0, 1, 0.5490196, 1,
-0.2641336, -0.6206105, -2.26757, 0, 1, 0.5568628, 1,
-0.261225, 1.205367, 0.8738691, 0, 1, 0.5607843, 1,
-0.2585402, -0.7392616, -3.664001, 0, 1, 0.5686275, 1,
-0.2556135, -0.0671473, -1.823253, 0, 1, 0.572549, 1,
-0.2555234, 0.1295272, -1.730852, 0, 1, 0.5803922, 1,
-0.2520555, 0.2973455, 0.7542728, 0, 1, 0.5843138, 1,
-0.2513146, -0.2184153, -1.994386, 0, 1, 0.5921569, 1,
-0.250466, 0.52343, 2.447281, 0, 1, 0.5960785, 1,
-0.2484222, -0.1701289, -1.258654, 0, 1, 0.6039216, 1,
-0.2453539, -0.5014173, -2.041521, 0, 1, 0.6117647, 1,
-0.2453128, -0.8738226, -1.909461, 0, 1, 0.6156863, 1,
-0.2427694, 0.1190507, -1.325786, 0, 1, 0.6235294, 1,
-0.241972, 1.000758, -0.434857, 0, 1, 0.627451, 1,
-0.2377408, 0.8646009, -1.278654, 0, 1, 0.6352941, 1,
-0.2350907, 0.5264289, -2.116677, 0, 1, 0.6392157, 1,
-0.2335232, 0.8563638, -1.171484, 0, 1, 0.6470588, 1,
-0.2315574, 0.4058197, 2.192798, 0, 1, 0.6509804, 1,
-0.2310928, -0.2251851, -3.129688, 0, 1, 0.6588235, 1,
-0.2260888, 1.658571, -0.8990886, 0, 1, 0.6627451, 1,
-0.2251431, -1.208252, -2.496433, 0, 1, 0.6705883, 1,
-0.2218308, -0.1167258, -0.9215189, 0, 1, 0.6745098, 1,
-0.2215924, -0.4388853, -2.523921, 0, 1, 0.682353, 1,
-0.2199894, 0.5358246, -0.2573577, 0, 1, 0.6862745, 1,
-0.2139761, -2.364724, -2.93404, 0, 1, 0.6941177, 1,
-0.2118587, -0.8247497, -1.985387, 0, 1, 0.7019608, 1,
-0.2086377, 1.389594, 0.1333343, 0, 1, 0.7058824, 1,
-0.2077309, 0.2604267, -0.5934417, 0, 1, 0.7137255, 1,
-0.2075339, -0.5021885, -0.8970885, 0, 1, 0.7176471, 1,
-0.2041446, 0.9630774, -0.220024, 0, 1, 0.7254902, 1,
-0.1962274, 0.7184438, 0.9903659, 0, 1, 0.7294118, 1,
-0.1920637, 1.00525, 1.149297, 0, 1, 0.7372549, 1,
-0.1867334, -1.185062, -4.229933, 0, 1, 0.7411765, 1,
-0.1814639, -0.8608078, -4.816741, 0, 1, 0.7490196, 1,
-0.1781689, -1.548423, -2.631475, 0, 1, 0.7529412, 1,
-0.1749858, -0.9040214, -2.404796, 0, 1, 0.7607843, 1,
-0.1740821, -0.399711, -3.632212, 0, 1, 0.7647059, 1,
-0.1695578, -0.5363064, -4.352612, 0, 1, 0.772549, 1,
-0.1597401, -0.7328527, -3.106563, 0, 1, 0.7764706, 1,
-0.1592337, 0.1155435, -0.6543714, 0, 1, 0.7843137, 1,
-0.1558058, -0.3782726, -2.155839, 0, 1, 0.7882353, 1,
-0.1546748, 1.246345, -1.978358, 0, 1, 0.7960784, 1,
-0.1533592, 0.9982887, -0.5509712, 0, 1, 0.8039216, 1,
-0.1523654, -2.247966, -4.23569, 0, 1, 0.8078431, 1,
-0.1462053, 1.311723, 0.9800565, 0, 1, 0.8156863, 1,
-0.1445305, -1.14026, -2.281334, 0, 1, 0.8196079, 1,
-0.1359558, 0.7581523, 1.888766, 0, 1, 0.827451, 1,
-0.1341727, -2.237553, -3.973812, 0, 1, 0.8313726, 1,
-0.1306343, -0.3185591, -2.723282, 0, 1, 0.8392157, 1,
-0.1301766, -1.380683, -2.643447, 0, 1, 0.8431373, 1,
-0.1250758, -1.322677, -3.116925, 0, 1, 0.8509804, 1,
-0.1209524, 1.040285, 0.4926518, 0, 1, 0.854902, 1,
-0.1193492, -0.04982964, -2.366545, 0, 1, 0.8627451, 1,
-0.1169198, -0.3426013, -1.551263, 0, 1, 0.8666667, 1,
-0.116437, -0.7967652, -3.137003, 0, 1, 0.8745098, 1,
-0.116203, 0.7017761, -2.260722, 0, 1, 0.8784314, 1,
-0.113195, 0.3594783, -1.138022, 0, 1, 0.8862745, 1,
-0.1108801, 0.5177898, -0.08568891, 0, 1, 0.8901961, 1,
-0.1048126, 0.7402453, -0.05233236, 0, 1, 0.8980392, 1,
-0.1038279, 0.5499895, 0.6095126, 0, 1, 0.9058824, 1,
-0.1030226, 0.1271659, -2.104725, 0, 1, 0.9098039, 1,
-0.09478312, 0.7274048, -1.495862, 0, 1, 0.9176471, 1,
-0.09229007, 0.6794862, -1.334634, 0, 1, 0.9215686, 1,
-0.08911268, 0.1390734, -1.218644, 0, 1, 0.9294118, 1,
-0.08858025, -0.1816793, -2.387951, 0, 1, 0.9333333, 1,
-0.08551282, -0.6958974, -3.431955, 0, 1, 0.9411765, 1,
-0.08509399, 0.6000301, -2.173767, 0, 1, 0.945098, 1,
-0.08408803, -0.2836323, -1.385869, 0, 1, 0.9529412, 1,
-0.08388277, -1.029291, -1.718812, 0, 1, 0.9568627, 1,
-0.08338282, 1.611891, 0.5250521, 0, 1, 0.9647059, 1,
-0.08262932, 0.1792737, -0.8947399, 0, 1, 0.9686275, 1,
-0.08246718, -0.9831147, -1.538257, 0, 1, 0.9764706, 1,
-0.08096831, 0.609559, -0.2687661, 0, 1, 0.9803922, 1,
-0.07587084, -0.03310515, -2.490512, 0, 1, 0.9882353, 1,
-0.07170446, 0.06572098, -1.183553, 0, 1, 0.9921569, 1,
-0.06813981, 0.9613117, 0.2694198, 0, 1, 1, 1,
-0.06655043, -2.478793, -3.5369, 0, 0.9921569, 1, 1,
-0.0653195, -0.3612914, -2.534323, 0, 0.9882353, 1, 1,
-0.06325353, 1.314884, -0.6021411, 0, 0.9803922, 1, 1,
-0.06185239, 0.1332245, 1.270044, 0, 0.9764706, 1, 1,
-0.05989283, -0.1476935, -1.381449, 0, 0.9686275, 1, 1,
-0.05255237, 1.482635, 2.092739, 0, 0.9647059, 1, 1,
-0.05186553, -1.558246, -1.824148, 0, 0.9568627, 1, 1,
-0.05047711, -1.179639, -3.625942, 0, 0.9529412, 1, 1,
-0.05027551, 0.7433582, 1.121409, 0, 0.945098, 1, 1,
-0.04967821, -0.8558175, -2.360108, 0, 0.9411765, 1, 1,
-0.04444302, -0.458331, -3.79567, 0, 0.9333333, 1, 1,
-0.04258765, 0.246753, -1.766287, 0, 0.9294118, 1, 1,
-0.04211428, -0.5647528, -1.984629, 0, 0.9215686, 1, 1,
-0.04095152, -0.07421415, -1.945198, 0, 0.9176471, 1, 1,
-0.04033805, -0.1066697, -3.218826, 0, 0.9098039, 1, 1,
-0.03931312, -1.329305, -3.348132, 0, 0.9058824, 1, 1,
-0.03642289, -0.3305729, -2.460949, 0, 0.8980392, 1, 1,
-0.02727111, 2.301848, 0.6016005, 0, 0.8901961, 1, 1,
-0.0239959, 0.1753633, 0.4845192, 0, 0.8862745, 1, 1,
-0.01705776, -0.8488333, -4.165463, 0, 0.8784314, 1, 1,
-0.01437414, 0.5453996, -0.8615877, 0, 0.8745098, 1, 1,
-0.0125452, -0.7882326, -2.602847, 0, 0.8666667, 1, 1,
-0.01253888, 1.492315, -1.665912, 0, 0.8627451, 1, 1,
-0.008574901, 0.9827542, 0.684706, 0, 0.854902, 1, 1,
-0.00727597, -0.04683654, -3.647783, 0, 0.8509804, 1, 1,
-0.005122317, -0.808789, -4.10405, 0, 0.8431373, 1, 1,
-0.003077263, 0.3889647, -1.518992, 0, 0.8392157, 1, 1,
-0.002654235, -0.6823166, -4.182262, 0, 0.8313726, 1, 1,
0.00194246, 0.5284498, -0.8310625, 0, 0.827451, 1, 1,
0.002349311, -1.682871, 3.795871, 0, 0.8196079, 1, 1,
0.002413989, -1.337249, 1.554289, 0, 0.8156863, 1, 1,
0.006501373, 1.995962, 2.14181, 0, 0.8078431, 1, 1,
0.006519388, -1.187294, 3.12546, 0, 0.8039216, 1, 1,
0.009517396, -1.074473, 3.395065, 0, 0.7960784, 1, 1,
0.01265243, 0.8388867, 0.4821157, 0, 0.7882353, 1, 1,
0.01340408, -0.7742174, 1.950828, 0, 0.7843137, 1, 1,
0.01441774, -1.184348, 2.317259, 0, 0.7764706, 1, 1,
0.0147189, -1.151789, 2.766261, 0, 0.772549, 1, 1,
0.01928487, -2.009332, 2.108488, 0, 0.7647059, 1, 1,
0.01931144, -1.14461, 2.36961, 0, 0.7607843, 1, 1,
0.0227986, 1.509457, 0.4718893, 0, 0.7529412, 1, 1,
0.02557321, -0.03150354, 2.760806, 0, 0.7490196, 1, 1,
0.0261128, -0.485825, 3.588197, 0, 0.7411765, 1, 1,
0.02653017, 0.9621763, -1.097788, 0, 0.7372549, 1, 1,
0.02721863, 0.4101465, -0.28879, 0, 0.7294118, 1, 1,
0.02986781, 0.5037497, -0.2900097, 0, 0.7254902, 1, 1,
0.03182271, -1.376355, 3.210747, 0, 0.7176471, 1, 1,
0.03185306, 0.3876826, -0.1356484, 0, 0.7137255, 1, 1,
0.0326285, 1.424987, -1.182372, 0, 0.7058824, 1, 1,
0.03642252, 0.3286869, -1.522309, 0, 0.6980392, 1, 1,
0.03811852, -1.361843, 3.547593, 0, 0.6941177, 1, 1,
0.03823466, -1.722967, 2.747966, 0, 0.6862745, 1, 1,
0.03908883, -0.07561839, 3.167678, 0, 0.682353, 1, 1,
0.04171609, 1.192233, -0.28267, 0, 0.6745098, 1, 1,
0.0456546, 0.1692001, -0.961597, 0, 0.6705883, 1, 1,
0.04720846, 1.025194, 0.3517335, 0, 0.6627451, 1, 1,
0.05396011, 0.1700247, 0.6374162, 0, 0.6588235, 1, 1,
0.05602727, -1.479009, 4.78737, 0, 0.6509804, 1, 1,
0.05902692, 0.8787826, -1.537484, 0, 0.6470588, 1, 1,
0.06075411, -0.04657586, 3.876001, 0, 0.6392157, 1, 1,
0.06406173, -1.806359, 4.014228, 0, 0.6352941, 1, 1,
0.07470145, -1.059489, 1.425987, 0, 0.627451, 1, 1,
0.07473841, -0.6830239, 2.762493, 0, 0.6235294, 1, 1,
0.07597549, -1.214185, 2.766424, 0, 0.6156863, 1, 1,
0.07597871, -0.3783816, 4.756707, 0, 0.6117647, 1, 1,
0.07606772, 1.334961, -0.6517379, 0, 0.6039216, 1, 1,
0.08125671, -0.5602837, 3.15871, 0, 0.5960785, 1, 1,
0.08195985, -0.9010403, 3.203787, 0, 0.5921569, 1, 1,
0.08356029, 1.308139, -0.9142665, 0, 0.5843138, 1, 1,
0.08378568, 1.693369, 0.3552939, 0, 0.5803922, 1, 1,
0.08434773, 0.1985155, -1.57777, 0, 0.572549, 1, 1,
0.08691448, 1.989552, 0.1726751, 0, 0.5686275, 1, 1,
0.08773857, -1.49009, 4.706888, 0, 0.5607843, 1, 1,
0.0883382, -0.1007771, 2.705305, 0, 0.5568628, 1, 1,
0.08958543, -0.06433178, 0.1599199, 0, 0.5490196, 1, 1,
0.08986825, 0.09614413, 0.08260467, 0, 0.5450981, 1, 1,
0.09103053, -0.07060075, 2.470342, 0, 0.5372549, 1, 1,
0.09377488, -0.3877301, 3.013335, 0, 0.5333334, 1, 1,
0.09452868, 2.556627, -1.571393, 0, 0.5254902, 1, 1,
0.09856874, -0.6895902, 1.527994, 0, 0.5215687, 1, 1,
0.09868204, 1.62016, -1.314565, 0, 0.5137255, 1, 1,
0.1016087, 2.443654, -0.5384839, 0, 0.509804, 1, 1,
0.1024275, 0.5313841, 1.01784, 0, 0.5019608, 1, 1,
0.1169736, -1.0872, 1.457458, 0, 0.4941176, 1, 1,
0.1171801, 0.2767542, -0.06284168, 0, 0.4901961, 1, 1,
0.1186402, 1.358841, -2.887423, 0, 0.4823529, 1, 1,
0.1193044, -0.9706216, 1.975069, 0, 0.4784314, 1, 1,
0.1220133, 1.082861, 1.152331, 0, 0.4705882, 1, 1,
0.122037, -1.758161, 3.471153, 0, 0.4666667, 1, 1,
0.1251109, -0.2208444, 2.49679, 0, 0.4588235, 1, 1,
0.1280386, -0.08641183, 0.6633916, 0, 0.454902, 1, 1,
0.1325309, -0.7289826, 2.753975, 0, 0.4470588, 1, 1,
0.13292, 0.6013148, 0.1060354, 0, 0.4431373, 1, 1,
0.1340405, -0.1329569, 1.297523, 0, 0.4352941, 1, 1,
0.1428469, -0.4527795, 2.485337, 0, 0.4313726, 1, 1,
0.1498669, 1.256192, -0.4633299, 0, 0.4235294, 1, 1,
0.1502599, -0.1561413, 0.4374966, 0, 0.4196078, 1, 1,
0.1513481, -0.125219, 3.104875, 0, 0.4117647, 1, 1,
0.1516534, -0.5560991, 3.818924, 0, 0.4078431, 1, 1,
0.1526738, -1.242543, 1.867832, 0, 0.4, 1, 1,
0.1537376, -0.4053884, 3.72549, 0, 0.3921569, 1, 1,
0.1573572, -1.412311, 4.987117, 0, 0.3882353, 1, 1,
0.1583067, 2.146977, -0.2334469, 0, 0.3803922, 1, 1,
0.1583267, 0.804493, -0.6200902, 0, 0.3764706, 1, 1,
0.1653965, 0.3088027, -0.5620985, 0, 0.3686275, 1, 1,
0.1696681, -0.9532385, 2.98312, 0, 0.3647059, 1, 1,
0.1704246, 0.4265516, 0.2470993, 0, 0.3568628, 1, 1,
0.1706438, -0.07730526, 3.200101, 0, 0.3529412, 1, 1,
0.1727085, 1.117749, -0.9687573, 0, 0.345098, 1, 1,
0.1759315, 0.1525528, 1.316895, 0, 0.3411765, 1, 1,
0.1766481, -1.11283, 4.005734, 0, 0.3333333, 1, 1,
0.1811108, 1.342434, -0.5501444, 0, 0.3294118, 1, 1,
0.1814065, 0.119356, 2.334228, 0, 0.3215686, 1, 1,
0.1825161, 1.853904, 0.2889506, 0, 0.3176471, 1, 1,
0.1836065, -0.42514, 2.988206, 0, 0.3098039, 1, 1,
0.188251, -0.5596396, 2.889118, 0, 0.3058824, 1, 1,
0.1900625, 1.394255, 0.7895179, 0, 0.2980392, 1, 1,
0.1940593, 0.9760771, -0.009309025, 0, 0.2901961, 1, 1,
0.1963394, 0.7355056, -0.640188, 0, 0.2862745, 1, 1,
0.1982233, 0.06777177, 0.03377875, 0, 0.2784314, 1, 1,
0.1990618, -1.960431, 1.146057, 0, 0.2745098, 1, 1,
0.2041054, 2.593769, 0.8008942, 0, 0.2666667, 1, 1,
0.2052935, -1.000208, 2.247412, 0, 0.2627451, 1, 1,
0.2059794, -0.9635529, 2.239485, 0, 0.254902, 1, 1,
0.2147898, 0.4522843, -1.743741, 0, 0.2509804, 1, 1,
0.2155865, -1.012219, 3.57073, 0, 0.2431373, 1, 1,
0.2198554, -0.1488006, 1.026066, 0, 0.2392157, 1, 1,
0.2201124, -1.066575, 3.778604, 0, 0.2313726, 1, 1,
0.2211849, -1.2831, 3.492432, 0, 0.227451, 1, 1,
0.2272089, -1.61632, 3.334532, 0, 0.2196078, 1, 1,
0.2323191, -1.14105, 3.423545, 0, 0.2156863, 1, 1,
0.2326045, -0.5565547, 1.605281, 0, 0.2078431, 1, 1,
0.2476062, 0.7079294, 1.043911, 0, 0.2039216, 1, 1,
0.2485969, -0.02906225, 1.921741, 0, 0.1960784, 1, 1,
0.2518378, -0.3671222, 1.839085, 0, 0.1882353, 1, 1,
0.2550792, -0.5707971, 2.283842, 0, 0.1843137, 1, 1,
0.260611, 0.4846979, 0.3149582, 0, 0.1764706, 1, 1,
0.2634212, -1.022756, 2.042812, 0, 0.172549, 1, 1,
0.2662412, -1.258682, 5.557222, 0, 0.1647059, 1, 1,
0.2683259, -3.189015, 3.197457, 0, 0.1607843, 1, 1,
0.2714568, 0.385246, 0.2115743, 0, 0.1529412, 1, 1,
0.2724785, 1.549244, -0.2749044, 0, 0.1490196, 1, 1,
0.2735174, 0.4838219, -0.3644312, 0, 0.1411765, 1, 1,
0.2747665, -0.4737104, 4.542152, 0, 0.1372549, 1, 1,
0.2778319, 1.757124, 1.221854, 0, 0.1294118, 1, 1,
0.2782018, -1.300333, 4.326506, 0, 0.1254902, 1, 1,
0.2788462, -0.867321, 3.253351, 0, 0.1176471, 1, 1,
0.2809716, -0.876031, 2.83987, 0, 0.1137255, 1, 1,
0.2871542, -0.7194729, 3.996009, 0, 0.1058824, 1, 1,
0.2881265, -0.586989, 0.4537014, 0, 0.09803922, 1, 1,
0.2898328, 0.3108931, 0.9433272, 0, 0.09411765, 1, 1,
0.2981284, -2.218525, 3.610129, 0, 0.08627451, 1, 1,
0.3018497, 1.523293, 0.4433417, 0, 0.08235294, 1, 1,
0.3083292, -1.17542, 3.090228, 0, 0.07450981, 1, 1,
0.3099143, 0.4845155, 0.534202, 0, 0.07058824, 1, 1,
0.3117421, 0.7836593, 0.425584, 0, 0.0627451, 1, 1,
0.3152395, -2.249422, 3.078981, 0, 0.05882353, 1, 1,
0.3198703, -1.00045, 4.087057, 0, 0.05098039, 1, 1,
0.3228707, -0.5806731, 1.767674, 0, 0.04705882, 1, 1,
0.3332986, 1.379217, -0.48451, 0, 0.03921569, 1, 1,
0.336051, 1.113072, 1.352886, 0, 0.03529412, 1, 1,
0.3375463, 0.412308, 2.357683, 0, 0.02745098, 1, 1,
0.3450257, 0.3269404, 0.09549706, 0, 0.02352941, 1, 1,
0.3467861, 1.37564, -0.4049667, 0, 0.01568628, 1, 1,
0.3487716, -0.4160438, 2.929103, 0, 0.01176471, 1, 1,
0.3487774, -0.5761536, 3.801707, 0, 0.003921569, 1, 1,
0.3555225, -1.412024, 4.38412, 0.003921569, 0, 1, 1,
0.3559684, 0.880894, 0.9497195, 0.007843138, 0, 1, 1,
0.3591978, 0.7777306, -0.09421292, 0.01568628, 0, 1, 1,
0.36654, 0.9499886, 1.802053, 0.01960784, 0, 1, 1,
0.3676204, -0.1342039, 1.897619, 0.02745098, 0, 1, 1,
0.3790298, 0.5168283, 2.476087, 0.03137255, 0, 1, 1,
0.3795947, -0.8796517, 3.168147, 0.03921569, 0, 1, 1,
0.3814641, -1.224536, 1.850155, 0.04313726, 0, 1, 1,
0.3840835, 0.6937471, 0.6679586, 0.05098039, 0, 1, 1,
0.3861375, -0.2855237, 4.416786, 0.05490196, 0, 1, 1,
0.3898771, 0.4547134, -0.06465416, 0.0627451, 0, 1, 1,
0.3977538, -0.1964068, 1.417825, 0.06666667, 0, 1, 1,
0.4029999, -0.1344778, 1.372412, 0.07450981, 0, 1, 1,
0.4062095, -1.175738, 1.177106, 0.07843138, 0, 1, 1,
0.4179033, 0.3369043, -0.1586194, 0.08627451, 0, 1, 1,
0.425947, 1.086386, 0.9237919, 0.09019608, 0, 1, 1,
0.4295717, 1.145144, -0.07775935, 0.09803922, 0, 1, 1,
0.4306368, -0.1483986, -0.2126045, 0.1058824, 0, 1, 1,
0.4349327, 0.1152175, 0.9637296, 0.1098039, 0, 1, 1,
0.4351373, -0.5567319, 2.272828, 0.1176471, 0, 1, 1,
0.4397349, 0.8344869, 0.8793612, 0.1215686, 0, 1, 1,
0.441854, 0.9012899, 0.7062633, 0.1294118, 0, 1, 1,
0.4422047, -0.4025597, 0.9776297, 0.1333333, 0, 1, 1,
0.4468784, 1.317489, 1.957152, 0.1411765, 0, 1, 1,
0.4470409, -0.2549149, 2.771796, 0.145098, 0, 1, 1,
0.4491332, 0.3970965, 0.08890649, 0.1529412, 0, 1, 1,
0.450662, -0.7453979, 3.14807, 0.1568628, 0, 1, 1,
0.4507094, -1.663812, 1.322005, 0.1647059, 0, 1, 1,
0.4576081, 0.3534829, 1.107833, 0.1686275, 0, 1, 1,
0.45792, -0.7216015, 3.685145, 0.1764706, 0, 1, 1,
0.4656136, 0.3927644, 2.168534, 0.1803922, 0, 1, 1,
0.4723501, 1.623939, 1.009607, 0.1882353, 0, 1, 1,
0.4801039, -0.03634837, 1.161165, 0.1921569, 0, 1, 1,
0.4870307, -1.987963, 3.408769, 0.2, 0, 1, 1,
0.487626, 1.15816, 1.088185, 0.2078431, 0, 1, 1,
0.4880634, 1.518158, -0.6655203, 0.2117647, 0, 1, 1,
0.4885339, -0.9189196, 1.373898, 0.2196078, 0, 1, 1,
0.4887468, 0.5858974, 0.217828, 0.2235294, 0, 1, 1,
0.4923363, -1.104201, 3.566022, 0.2313726, 0, 1, 1,
0.4950036, 0.03646892, 1.566323, 0.2352941, 0, 1, 1,
0.5010815, 0.42187, 3.186301, 0.2431373, 0, 1, 1,
0.5019329, -0.7667051, 1.921431, 0.2470588, 0, 1, 1,
0.5025378, 0.2850093, -0.299734, 0.254902, 0, 1, 1,
0.5064924, -0.3362664, -0.1103473, 0.2588235, 0, 1, 1,
0.5072277, 0.1123799, 1.180155, 0.2666667, 0, 1, 1,
0.5163966, -0.1962017, 0.4930016, 0.2705882, 0, 1, 1,
0.5200662, 1.111345, 0.2095375, 0.2784314, 0, 1, 1,
0.5217174, -1.369844, 2.896042, 0.282353, 0, 1, 1,
0.5240246, 1.74791, -0.1282846, 0.2901961, 0, 1, 1,
0.5285431, 0.9721645, -0.6743832, 0.2941177, 0, 1, 1,
0.5317462, -0.04526671, 0.7165166, 0.3019608, 0, 1, 1,
0.5347424, -0.1234117, 0.8181435, 0.3098039, 0, 1, 1,
0.5360489, -0.8621095, 3.633491, 0.3137255, 0, 1, 1,
0.5371963, 1.860315, -0.3554217, 0.3215686, 0, 1, 1,
0.5375212, -0.08361563, 2.181398, 0.3254902, 0, 1, 1,
0.5446381, 0.3401714, 0.7646868, 0.3333333, 0, 1, 1,
0.5494351, -1.611163, 3.633619, 0.3372549, 0, 1, 1,
0.5529726, -0.5704765, 3.03754, 0.345098, 0, 1, 1,
0.5536565, 0.349409, -1.456445, 0.3490196, 0, 1, 1,
0.5547752, 0.05935897, 1.338598, 0.3568628, 0, 1, 1,
0.556282, -1.629903, 4.79246, 0.3607843, 0, 1, 1,
0.5566059, -0.2456698, 1.15712, 0.3686275, 0, 1, 1,
0.5568441, 0.4645759, -0.3393377, 0.372549, 0, 1, 1,
0.5573996, 0.6398252, 0.7855619, 0.3803922, 0, 1, 1,
0.5630558, -0.8261008, 2.77697, 0.3843137, 0, 1, 1,
0.5630756, 0.49058, 1.979176, 0.3921569, 0, 1, 1,
0.5720793, 0.9234774, 0.5958747, 0.3960784, 0, 1, 1,
0.5727433, 0.7602649, 1.245045, 0.4039216, 0, 1, 1,
0.5752547, -1.748966, 3.889183, 0.4117647, 0, 1, 1,
0.5781903, -0.3335642, 1.277651, 0.4156863, 0, 1, 1,
0.5792735, 0.1340035, 0.8589786, 0.4235294, 0, 1, 1,
0.5827624, 1.206744, 1.072603, 0.427451, 0, 1, 1,
0.5920194, 1.148061, -0.6532021, 0.4352941, 0, 1, 1,
0.5965932, -0.7042453, 3.272623, 0.4392157, 0, 1, 1,
0.5974071, 1.276137, 1.579382, 0.4470588, 0, 1, 1,
0.6017253, 0.02740952, 2.548213, 0.4509804, 0, 1, 1,
0.6024785, -0.3202209, 1.583104, 0.4588235, 0, 1, 1,
0.6093796, -0.558494, 3.913474, 0.4627451, 0, 1, 1,
0.6202858, 1.563188, 0.6916884, 0.4705882, 0, 1, 1,
0.6206044, -1.594289, 4.485119, 0.4745098, 0, 1, 1,
0.6209562, -2.931818, 2.337226, 0.4823529, 0, 1, 1,
0.6244271, -0.4993704, 1.978582, 0.4862745, 0, 1, 1,
0.6308689, -0.3919296, 0.9443868, 0.4941176, 0, 1, 1,
0.6345949, 1.49065, -0.3596056, 0.5019608, 0, 1, 1,
0.6352795, -0.8851595, 1.501114, 0.5058824, 0, 1, 1,
0.6375211, -0.1634028, 2.845654, 0.5137255, 0, 1, 1,
0.6433295, -0.1180773, 1.214103, 0.5176471, 0, 1, 1,
0.6441455, 0.8808491, 0.2341814, 0.5254902, 0, 1, 1,
0.6442701, 0.3671637, 0.5620477, 0.5294118, 0, 1, 1,
0.6463779, -0.6974635, 1.916369, 0.5372549, 0, 1, 1,
0.6496919, 0.1917042, 2.052455, 0.5411765, 0, 1, 1,
0.6613665, -1.359692, 4.532434, 0.5490196, 0, 1, 1,
0.6644303, 1.460171, 0.8928264, 0.5529412, 0, 1, 1,
0.666113, -1.58189, 1.872206, 0.5607843, 0, 1, 1,
0.6666018, 0.5181343, -0.8272031, 0.5647059, 0, 1, 1,
0.6689196, 1.014301, 0.8292039, 0.572549, 0, 1, 1,
0.6746675, -0.2861255, 0.7479654, 0.5764706, 0, 1, 1,
0.6807458, -1.212857, 1.547514, 0.5843138, 0, 1, 1,
0.6873788, -1.820466, 3.615844, 0.5882353, 0, 1, 1,
0.6907726, 0.8601808, 0.2227864, 0.5960785, 0, 1, 1,
0.6938265, 0.9461094, 0.8694081, 0.6039216, 0, 1, 1,
0.6963167, -0.11756, 1.619995, 0.6078432, 0, 1, 1,
0.6982684, 1.165346, 0.2180014, 0.6156863, 0, 1, 1,
0.6986511, -0.782566, 1.525139, 0.6196079, 0, 1, 1,
0.70226, -2.319787, 2.102211, 0.627451, 0, 1, 1,
0.719505, 0.228753, 2.508918, 0.6313726, 0, 1, 1,
0.7212825, -0.8620821, 3.649769, 0.6392157, 0, 1, 1,
0.730087, 0.5731374, 0.5149953, 0.6431373, 0, 1, 1,
0.7343051, 0.3521678, 2.631684, 0.6509804, 0, 1, 1,
0.741205, -0.854014, 4.996985, 0.654902, 0, 1, 1,
0.7444692, 0.08839036, 1.599799, 0.6627451, 0, 1, 1,
0.7559059, 1.474766, 0.1782481, 0.6666667, 0, 1, 1,
0.7592112, 1.520581, 0.4341697, 0.6745098, 0, 1, 1,
0.761197, 0.1661497, 0.1480374, 0.6784314, 0, 1, 1,
0.7614437, -0.3129815, 2.619464, 0.6862745, 0, 1, 1,
0.7629206, -0.477511, 1.17341, 0.6901961, 0, 1, 1,
0.7685095, 0.2687113, 0.9058521, 0.6980392, 0, 1, 1,
0.7703435, -0.4831338, 3.325744, 0.7058824, 0, 1, 1,
0.7703891, 0.6256973, 0.6048264, 0.7098039, 0, 1, 1,
0.7710096, 0.6631464, 2.733206, 0.7176471, 0, 1, 1,
0.7735662, -0.7896449, 2.440172, 0.7215686, 0, 1, 1,
0.7803861, -0.3217853, 2.11109, 0.7294118, 0, 1, 1,
0.783703, 0.08153497, 1.930019, 0.7333333, 0, 1, 1,
0.7842964, 0.5354878, 0.214549, 0.7411765, 0, 1, 1,
0.786401, -0.7905123, 2.836671, 0.7450981, 0, 1, 1,
0.7956278, 1.771751, 1.005461, 0.7529412, 0, 1, 1,
0.7979221, -0.5810552, 2.448468, 0.7568628, 0, 1, 1,
0.8001111, -1.469259, 3.904632, 0.7647059, 0, 1, 1,
0.800597, -0.9786943, 1.691523, 0.7686275, 0, 1, 1,
0.8006683, 0.6623124, 1.865056, 0.7764706, 0, 1, 1,
0.8018503, 0.2731077, 2.652296, 0.7803922, 0, 1, 1,
0.801966, -0.432921, 4.398106, 0.7882353, 0, 1, 1,
0.8032991, -0.7111322, 1.146503, 0.7921569, 0, 1, 1,
0.8042935, 2.872223, 0.7091959, 0.8, 0, 1, 1,
0.812208, -0.8100141, 2.260785, 0.8078431, 0, 1, 1,
0.8188404, -1.135263, 2.840441, 0.8117647, 0, 1, 1,
0.8240874, -1.051911, 2.421168, 0.8196079, 0, 1, 1,
0.8255333, 0.7583349, -1.455299, 0.8235294, 0, 1, 1,
0.8295547, 0.09272207, 2.051035, 0.8313726, 0, 1, 1,
0.8366021, -0.5790751, 3.010215, 0.8352941, 0, 1, 1,
0.8373031, -0.06071602, 1.333775, 0.8431373, 0, 1, 1,
0.8531852, 1.042089, 0.9076756, 0.8470588, 0, 1, 1,
0.8665758, -1.352516, -0.3573805, 0.854902, 0, 1, 1,
0.86743, 1.496877, -1.29386, 0.8588235, 0, 1, 1,
0.8693851, -0.639599, 1.510488, 0.8666667, 0, 1, 1,
0.8759882, -1.013193, 1.389479, 0.8705882, 0, 1, 1,
0.8781204, -0.4558882, 2.133164, 0.8784314, 0, 1, 1,
0.8824201, 0.6176853, 0.455025, 0.8823529, 0, 1, 1,
0.8872889, -1.66394, 4.0216, 0.8901961, 0, 1, 1,
0.891162, 0.3621168, 1.701695, 0.8941177, 0, 1, 1,
0.8975449, -0.34163, 1.38234, 0.9019608, 0, 1, 1,
0.9061897, -2.613304, 2.708455, 0.9098039, 0, 1, 1,
0.9083518, -1.318251, 3.609245, 0.9137255, 0, 1, 1,
0.9126824, -0.2719673, 1.065197, 0.9215686, 0, 1, 1,
0.9140939, 1.164381, 0.9912146, 0.9254902, 0, 1, 1,
0.9151101, -1.464187, 2.83866, 0.9333333, 0, 1, 1,
0.915241, -1.851237, 3.607988, 0.9372549, 0, 1, 1,
0.9170222, -1.31606, 2.495011, 0.945098, 0, 1, 1,
0.9215292, 0.5917768, -0.0257153, 0.9490196, 0, 1, 1,
0.9261518, 0.627443, -1.230205, 0.9568627, 0, 1, 1,
0.9272526, 0.3340504, 2.925841, 0.9607843, 0, 1, 1,
0.9298812, 0.6369871, 1.225754, 0.9686275, 0, 1, 1,
0.9475037, -0.551847, 1.460612, 0.972549, 0, 1, 1,
0.9504195, 0.5410607, -0.4796177, 0.9803922, 0, 1, 1,
0.9512075, 2.055495, 1.323871, 0.9843137, 0, 1, 1,
0.9528551, -1.370837, 2.323437, 0.9921569, 0, 1, 1,
0.958486, -0.1913897, 0.5857391, 0.9960784, 0, 1, 1,
0.9618536, 0.06692678, 1.566836, 1, 0, 0.9960784, 1,
0.968019, 1.733077, 0.9842898, 1, 0, 0.9882353, 1,
0.9746835, 0.1268491, 1.207052, 1, 0, 0.9843137, 1,
0.9755215, -1.084066, 1.620545, 1, 0, 0.9764706, 1,
0.9772083, -0.7425994, 1.880814, 1, 0, 0.972549, 1,
0.9805011, 1.363218, 2.797816, 1, 0, 0.9647059, 1,
0.9928693, 0.8146129, 2.061947, 1, 0, 0.9607843, 1,
1.000242, 1.60349, -0.3659901, 1, 0, 0.9529412, 1,
1.001184, 0.7388753, 0.2832516, 1, 0, 0.9490196, 1,
1.003445, 0.8650845, 0.301838, 1, 0, 0.9411765, 1,
1.004613, -0.006776796, 1.96635, 1, 0, 0.9372549, 1,
1.007676, -1.399239, 3.20949, 1, 0, 0.9294118, 1,
1.016159, 0.1973376, 0.08646173, 1, 0, 0.9254902, 1,
1.017964, -0.05727089, -0.3741419, 1, 0, 0.9176471, 1,
1.022281, 0.7527949, 2.360126, 1, 0, 0.9137255, 1,
1.025831, 0.8939081, 2.420701, 1, 0, 0.9058824, 1,
1.035229, -0.3441966, 2.359563, 1, 0, 0.9019608, 1,
1.036691, -0.6818783, 2.875451, 1, 0, 0.8941177, 1,
1.045792, 0.296667, 0.3486325, 1, 0, 0.8862745, 1,
1.048301, 0.8901964, 0.1740567, 1, 0, 0.8823529, 1,
1.054196, 0.1556387, 1.395577, 1, 0, 0.8745098, 1,
1.055086, 0.0539557, 1.716402, 1, 0, 0.8705882, 1,
1.058543, -0.9123572, 4.377812, 1, 0, 0.8627451, 1,
1.060252, -0.01894814, 0.8118178, 1, 0, 0.8588235, 1,
1.067799, 1.218626, 0.4278216, 1, 0, 0.8509804, 1,
1.073324, -0.04495666, 3.393291, 1, 0, 0.8470588, 1,
1.075578, -0.3632075, 1.787867, 1, 0, 0.8392157, 1,
1.080746, 1.92865, 0.1409936, 1, 0, 0.8352941, 1,
1.081366, -1.079665, 3.609366, 1, 0, 0.827451, 1,
1.081461, 0.1888631, 2.081261, 1, 0, 0.8235294, 1,
1.081701, 0.6622398, -0.1916716, 1, 0, 0.8156863, 1,
1.088995, -0.3507195, 0.6226484, 1, 0, 0.8117647, 1,
1.090229, 0.5408497, 2.198187, 1, 0, 0.8039216, 1,
1.098282, -0.2991986, 3.198638, 1, 0, 0.7960784, 1,
1.101853, 0.1165515, 0.09562372, 1, 0, 0.7921569, 1,
1.113892, 0.4619965, 1.552897, 1, 0, 0.7843137, 1,
1.113958, -1.610462, 1.282113, 1, 0, 0.7803922, 1,
1.125087, -0.8038462, 1.887591, 1, 0, 0.772549, 1,
1.127764, -0.5962726, 2.98053, 1, 0, 0.7686275, 1,
1.128376, -0.2112111, 2.675578, 1, 0, 0.7607843, 1,
1.131977, -0.1395467, 1.358104, 1, 0, 0.7568628, 1,
1.139218, 0.4177414, 0.06475244, 1, 0, 0.7490196, 1,
1.146013, -0.5182122, 2.643781, 1, 0, 0.7450981, 1,
1.146805, -0.7210094, 2.056969, 1, 0, 0.7372549, 1,
1.156066, 0.3824503, 0.180352, 1, 0, 0.7333333, 1,
1.15936, -0.1704051, 2.003834, 1, 0, 0.7254902, 1,
1.164106, 1.858867, 0.6350348, 1, 0, 0.7215686, 1,
1.164309, 0.2867359, 2.118206, 1, 0, 0.7137255, 1,
1.168428, -0.4350335, 3.500424, 1, 0, 0.7098039, 1,
1.169957, -0.8614092, 0.6999797, 1, 0, 0.7019608, 1,
1.171465, 0.008863271, 0.9742875, 1, 0, 0.6941177, 1,
1.175161, 0.4535386, 2.132414, 1, 0, 0.6901961, 1,
1.183228, 0.596535, 1.653295, 1, 0, 0.682353, 1,
1.183408, -1.249458, 3.620294, 1, 0, 0.6784314, 1,
1.184469, 0.5150732, 0.6183219, 1, 0, 0.6705883, 1,
1.189567, 1.204626, 0.6286713, 1, 0, 0.6666667, 1,
1.207153, -1.494012, 3.490793, 1, 0, 0.6588235, 1,
1.209169, 0.6716381, 0.1075108, 1, 0, 0.654902, 1,
1.211745, 0.8135546, 0.7428494, 1, 0, 0.6470588, 1,
1.231246, 1.187038, -0.9525341, 1, 0, 0.6431373, 1,
1.242744, -0.438982, 2.814759, 1, 0, 0.6352941, 1,
1.245308, -0.1880679, 1.666154, 1, 0, 0.6313726, 1,
1.254332, 0.9956168, 1.156054, 1, 0, 0.6235294, 1,
1.264485, -0.7265067, 2.370339, 1, 0, 0.6196079, 1,
1.270167, -2.364132, 2.114512, 1, 0, 0.6117647, 1,
1.277457, -0.6146096, 1.334845, 1, 0, 0.6078432, 1,
1.280688, 0.3338827, 1.95064, 1, 0, 0.6, 1,
1.293725, -2.481724, 3.776442, 1, 0, 0.5921569, 1,
1.318022, -1.837413, 1.60415, 1, 0, 0.5882353, 1,
1.318369, -0.4737991, 0.5874144, 1, 0, 0.5803922, 1,
1.326104, -0.1433769, 2.080735, 1, 0, 0.5764706, 1,
1.334662, -0.7527806, 1.591784, 1, 0, 0.5686275, 1,
1.342612, -0.31399, 1.348504, 1, 0, 0.5647059, 1,
1.344708, 0.3575526, 1.413517, 1, 0, 0.5568628, 1,
1.344763, 0.7662463, 1.857067, 1, 0, 0.5529412, 1,
1.344992, -0.07608235, 1.767588, 1, 0, 0.5450981, 1,
1.35451, 1.336043, 0.6146446, 1, 0, 0.5411765, 1,
1.357167, -0.4713681, 2.099928, 1, 0, 0.5333334, 1,
1.371493, 0.9927744, 2.551432, 1, 0, 0.5294118, 1,
1.37271, -0.7438827, 3.081377, 1, 0, 0.5215687, 1,
1.374949, -0.1980818, 3.261562, 1, 0, 0.5176471, 1,
1.375268, -0.8542952, 0.04490267, 1, 0, 0.509804, 1,
1.380957, -0.9154456, 2.644908, 1, 0, 0.5058824, 1,
1.381027, 0.4201009, 0.8175039, 1, 0, 0.4980392, 1,
1.386134, 0.4685169, 1.737986, 1, 0, 0.4901961, 1,
1.392509, 0.8530895, -0.03759812, 1, 0, 0.4862745, 1,
1.409723, 0.139654, 0.7989051, 1, 0, 0.4784314, 1,
1.414962, -0.8191723, 2.514074, 1, 0, 0.4745098, 1,
1.416441, 1.326972, 1.012684, 1, 0, 0.4666667, 1,
1.42023, -1.337512, 3.607622, 1, 0, 0.4627451, 1,
1.428747, -1.051461, 2.412995, 1, 0, 0.454902, 1,
1.43201, -0.05217284, 0.5712945, 1, 0, 0.4509804, 1,
1.444784, 0.1191177, 0.5856433, 1, 0, 0.4431373, 1,
1.44805, -0.6025649, 2.204, 1, 0, 0.4392157, 1,
1.450575, -0.2254564, 1.822829, 1, 0, 0.4313726, 1,
1.470579, 0.5465205, -0.4979095, 1, 0, 0.427451, 1,
1.47157, -0.8609869, 2.234336, 1, 0, 0.4196078, 1,
1.473749, -0.2112149, 0.170764, 1, 0, 0.4156863, 1,
1.477863, -0.9048998, 2.168581, 1, 0, 0.4078431, 1,
1.484717, 0.4883935, 1.940707, 1, 0, 0.4039216, 1,
1.495785, -0.4283146, 3.109648, 1, 0, 0.3960784, 1,
1.503222, 1.019985, -0.4217203, 1, 0, 0.3882353, 1,
1.509394, -0.4715835, 1.746566, 1, 0, 0.3843137, 1,
1.522829, 1.0663, 0.2152585, 1, 0, 0.3764706, 1,
1.528129, -0.8142682, 2.488551, 1, 0, 0.372549, 1,
1.534942, -0.9500583, 1.618897, 1, 0, 0.3647059, 1,
1.551099, 2.112171, 1.080019, 1, 0, 0.3607843, 1,
1.562262, -0.781089, 2.86711, 1, 0, 0.3529412, 1,
1.564047, -3.680904, 4.071033, 1, 0, 0.3490196, 1,
1.573992, 0.3912864, 1.084305, 1, 0, 0.3411765, 1,
1.580041, -1.819489, 2.487816, 1, 0, 0.3372549, 1,
1.60113, -0.8369036, 3.084396, 1, 0, 0.3294118, 1,
1.601274, 0.4975803, 1.512965, 1, 0, 0.3254902, 1,
1.605293, -0.2853522, 3.232426, 1, 0, 0.3176471, 1,
1.613807, -0.7855802, 0.1728883, 1, 0, 0.3137255, 1,
1.617, -0.7213603, 3.588292, 1, 0, 0.3058824, 1,
1.620553, 0.7385173, -0.5790477, 1, 0, 0.2980392, 1,
1.653478, -0.7476113, 2.426115, 1, 0, 0.2941177, 1,
1.66957, -0.5919455, 1.702139, 1, 0, 0.2862745, 1,
1.682008, -1.899166, 1.452365, 1, 0, 0.282353, 1,
1.690553, -1.99261, 2.379065, 1, 0, 0.2745098, 1,
1.69612, 0.4762, 1.879445, 1, 0, 0.2705882, 1,
1.702028, -0.2920582, 1.536806, 1, 0, 0.2627451, 1,
1.716056, 1.033854, 0.3609882, 1, 0, 0.2588235, 1,
1.73216, -0.5389546, 2.805648, 1, 0, 0.2509804, 1,
1.744766, -0.5781245, 0.6878065, 1, 0, 0.2470588, 1,
1.747664, -1.885194, 3.219132, 1, 0, 0.2392157, 1,
1.749141, 1.150875, -0.6340355, 1, 0, 0.2352941, 1,
1.769479, 1.660297, 0.3701971, 1, 0, 0.227451, 1,
1.807209, 1.367044, 3.111938, 1, 0, 0.2235294, 1,
1.863698, -1.873509, 2.811948, 1, 0, 0.2156863, 1,
1.891632, 1.425184, 1.484499, 1, 0, 0.2117647, 1,
1.895777, 1.27646, -0.6649106, 1, 0, 0.2039216, 1,
1.916555, -0.6651108, 2.345191, 1, 0, 0.1960784, 1,
1.936515, -1.205606, 2.051435, 1, 0, 0.1921569, 1,
1.984654, -0.298652, 1.413034, 1, 0, 0.1843137, 1,
2.001497, 0.003852916, 0.5406094, 1, 0, 0.1803922, 1,
2.025787, 0.6406435, 0.6316848, 1, 0, 0.172549, 1,
2.02963, 0.9181513, 0.9608452, 1, 0, 0.1686275, 1,
2.03766, -0.712145, 0.9373714, 1, 0, 0.1607843, 1,
2.045375, 0.3011573, 1.607858, 1, 0, 0.1568628, 1,
2.062409, 1.54307, 0.2535615, 1, 0, 0.1490196, 1,
2.067428, 0.7413529, 1.850316, 1, 0, 0.145098, 1,
2.071648, -0.6235719, 2.423945, 1, 0, 0.1372549, 1,
2.090602, 0.9769099, 1.107069, 1, 0, 0.1333333, 1,
2.130249, -0.3792223, 3.218476, 1, 0, 0.1254902, 1,
2.149215, -0.895015, 3.301022, 1, 0, 0.1215686, 1,
2.163501, -1.054042, 2.290268, 1, 0, 0.1137255, 1,
2.212158, -0.7967913, 1.131038, 1, 0, 0.1098039, 1,
2.214269, -0.06622685, 1.215752, 1, 0, 0.1019608, 1,
2.240869, 0.1114422, 3.501395, 1, 0, 0.09411765, 1,
2.276223, 0.08642934, 1.979519, 1, 0, 0.09019608, 1,
2.415642, 1.939051, 2.141312, 1, 0, 0.08235294, 1,
2.428908, 1.619234, 2.262175, 1, 0, 0.07843138, 1,
2.490193, -0.283438, 1.095616, 1, 0, 0.07058824, 1,
2.502137, -1.208733, 3.775718, 1, 0, 0.06666667, 1,
2.552153, 0.7422857, 1.322286, 1, 0, 0.05882353, 1,
2.553773, -0.7060406, 1.889209, 1, 0, 0.05490196, 1,
2.603994, 0.2132888, 1.454363, 1, 0, 0.04705882, 1,
2.624652, 0.3627476, 1.094354, 1, 0, 0.04313726, 1,
2.937443, 0.8474175, 1.498826, 1, 0, 0.03529412, 1,
2.977621, 0.5837083, -0.6569771, 1, 0, 0.03137255, 1,
3.029204, 1.397368, 1.689701, 1, 0, 0.02352941, 1,
3.18188, 0.7564717, -0.07512101, 1, 0, 0.01960784, 1,
3.214951, 0.767774, 1.150905, 1, 0, 0.01176471, 1,
3.611683, -1.536125, 1.326808, 1, 0, 0.007843138, 1
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
-0.2714159, -4.819411, -6.575127, 0, -0.5, 0.5, 0.5,
-0.2714159, -4.819411, -6.575127, 1, -0.5, 0.5, 0.5,
-0.2714159, -4.819411, -6.575127, 1, 1.5, 0.5, 0.5,
-0.2714159, -4.819411, -6.575127, 0, 1.5, 0.5, 0.5
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
-5.470886, -0.3224751, -6.575127, 0, -0.5, 0.5, 0.5,
-5.470886, -0.3224751, -6.575127, 1, -0.5, 0.5, 0.5,
-5.470886, -0.3224751, -6.575127, 1, 1.5, 0.5, 0.5,
-5.470886, -0.3224751, -6.575127, 0, 1.5, 0.5, 0.5
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
-5.470886, -4.819411, 0.3702407, 0, -0.5, 0.5, 0.5,
-5.470886, -4.819411, 0.3702407, 1, -0.5, 0.5, 0.5,
-5.470886, -4.819411, 0.3702407, 1, 1.5, 0.5, 0.5,
-5.470886, -4.819411, 0.3702407, 0, 1.5, 0.5, 0.5
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
-4, -3.781657, -4.97235,
2, -3.781657, -4.97235,
-4, -3.781657, -4.97235,
-4, -3.954616, -5.23948,
-2, -3.781657, -4.97235,
-2, -3.954616, -5.23948,
0, -3.781657, -4.97235,
0, -3.954616, -5.23948,
2, -3.781657, -4.97235,
2, -3.954616, -5.23948
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
"-4",
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
-4, -4.300534, -5.773738, 0, -0.5, 0.5, 0.5,
-4, -4.300534, -5.773738, 1, -0.5, 0.5, 0.5,
-4, -4.300534, -5.773738, 1, 1.5, 0.5, 0.5,
-4, -4.300534, -5.773738, 0, 1.5, 0.5, 0.5,
-2, -4.300534, -5.773738, 0, -0.5, 0.5, 0.5,
-2, -4.300534, -5.773738, 1, -0.5, 0.5, 0.5,
-2, -4.300534, -5.773738, 1, 1.5, 0.5, 0.5,
-2, -4.300534, -5.773738, 0, 1.5, 0.5, 0.5,
0, -4.300534, -5.773738, 0, -0.5, 0.5, 0.5,
0, -4.300534, -5.773738, 1, -0.5, 0.5, 0.5,
0, -4.300534, -5.773738, 1, 1.5, 0.5, 0.5,
0, -4.300534, -5.773738, 0, 1.5, 0.5, 0.5,
2, -4.300534, -5.773738, 0, -0.5, 0.5, 0.5,
2, -4.300534, -5.773738, 1, -0.5, 0.5, 0.5,
2, -4.300534, -5.773738, 1, 1.5, 0.5, 0.5,
2, -4.300534, -5.773738, 0, 1.5, 0.5, 0.5
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
-4.271008, -3, -4.97235,
-4.271008, 3, -4.97235,
-4.271008, -3, -4.97235,
-4.470988, -3, -5.23948,
-4.271008, -2, -4.97235,
-4.470988, -2, -5.23948,
-4.271008, -1, -4.97235,
-4.470988, -1, -5.23948,
-4.271008, 0, -4.97235,
-4.470988, 0, -5.23948,
-4.271008, 1, -4.97235,
-4.470988, 1, -5.23948,
-4.271008, 2, -4.97235,
-4.470988, 2, -5.23948,
-4.271008, 3, -4.97235,
-4.470988, 3, -5.23948
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
-4.870947, -3, -5.773738, 0, -0.5, 0.5, 0.5,
-4.870947, -3, -5.773738, 1, -0.5, 0.5, 0.5,
-4.870947, -3, -5.773738, 1, 1.5, 0.5, 0.5,
-4.870947, -3, -5.773738, 0, 1.5, 0.5, 0.5,
-4.870947, -2, -5.773738, 0, -0.5, 0.5, 0.5,
-4.870947, -2, -5.773738, 1, -0.5, 0.5, 0.5,
-4.870947, -2, -5.773738, 1, 1.5, 0.5, 0.5,
-4.870947, -2, -5.773738, 0, 1.5, 0.5, 0.5,
-4.870947, -1, -5.773738, 0, -0.5, 0.5, 0.5,
-4.870947, -1, -5.773738, 1, -0.5, 0.5, 0.5,
-4.870947, -1, -5.773738, 1, 1.5, 0.5, 0.5,
-4.870947, -1, -5.773738, 0, 1.5, 0.5, 0.5,
-4.870947, 0, -5.773738, 0, -0.5, 0.5, 0.5,
-4.870947, 0, -5.773738, 1, -0.5, 0.5, 0.5,
-4.870947, 0, -5.773738, 1, 1.5, 0.5, 0.5,
-4.870947, 0, -5.773738, 0, 1.5, 0.5, 0.5,
-4.870947, 1, -5.773738, 0, -0.5, 0.5, 0.5,
-4.870947, 1, -5.773738, 1, -0.5, 0.5, 0.5,
-4.870947, 1, -5.773738, 1, 1.5, 0.5, 0.5,
-4.870947, 1, -5.773738, 0, 1.5, 0.5, 0.5,
-4.870947, 2, -5.773738, 0, -0.5, 0.5, 0.5,
-4.870947, 2, -5.773738, 1, -0.5, 0.5, 0.5,
-4.870947, 2, -5.773738, 1, 1.5, 0.5, 0.5,
-4.870947, 2, -5.773738, 0, 1.5, 0.5, 0.5,
-4.870947, 3, -5.773738, 0, -0.5, 0.5, 0.5,
-4.870947, 3, -5.773738, 1, -0.5, 0.5, 0.5,
-4.870947, 3, -5.773738, 1, 1.5, 0.5, 0.5,
-4.870947, 3, -5.773738, 0, 1.5, 0.5, 0.5
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
-4.271008, -3.781657, -4,
-4.271008, -3.781657, 4,
-4.271008, -3.781657, -4,
-4.470988, -3.954616, -4,
-4.271008, -3.781657, -2,
-4.470988, -3.954616, -2,
-4.271008, -3.781657, 0,
-4.470988, -3.954616, 0,
-4.271008, -3.781657, 2,
-4.470988, -3.954616, 2,
-4.271008, -3.781657, 4,
-4.470988, -3.954616, 4
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
-4.870947, -4.300534, -4, 0, -0.5, 0.5, 0.5,
-4.870947, -4.300534, -4, 1, -0.5, 0.5, 0.5,
-4.870947, -4.300534, -4, 1, 1.5, 0.5, 0.5,
-4.870947, -4.300534, -4, 0, 1.5, 0.5, 0.5,
-4.870947, -4.300534, -2, 0, -0.5, 0.5, 0.5,
-4.870947, -4.300534, -2, 1, -0.5, 0.5, 0.5,
-4.870947, -4.300534, -2, 1, 1.5, 0.5, 0.5,
-4.870947, -4.300534, -2, 0, 1.5, 0.5, 0.5,
-4.870947, -4.300534, 0, 0, -0.5, 0.5, 0.5,
-4.870947, -4.300534, 0, 1, -0.5, 0.5, 0.5,
-4.870947, -4.300534, 0, 1, 1.5, 0.5, 0.5,
-4.870947, -4.300534, 0, 0, 1.5, 0.5, 0.5,
-4.870947, -4.300534, 2, 0, -0.5, 0.5, 0.5,
-4.870947, -4.300534, 2, 1, -0.5, 0.5, 0.5,
-4.870947, -4.300534, 2, 1, 1.5, 0.5, 0.5,
-4.870947, -4.300534, 2, 0, 1.5, 0.5, 0.5,
-4.870947, -4.300534, 4, 0, -0.5, 0.5, 0.5,
-4.870947, -4.300534, 4, 1, -0.5, 0.5, 0.5,
-4.870947, -4.300534, 4, 1, 1.5, 0.5, 0.5,
-4.870947, -4.300534, 4, 0, 1.5, 0.5, 0.5
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
-4.271008, -3.781657, -4.97235,
-4.271008, 3.136706, -4.97235,
-4.271008, -3.781657, 5.712831,
-4.271008, 3.136706, 5.712831,
-4.271008, -3.781657, -4.97235,
-4.271008, -3.781657, 5.712831,
-4.271008, 3.136706, -4.97235,
-4.271008, 3.136706, 5.712831,
-4.271008, -3.781657, -4.97235,
3.728176, -3.781657, -4.97235,
-4.271008, -3.781657, 5.712831,
3.728176, -3.781657, 5.712831,
-4.271008, 3.136706, -4.97235,
3.728176, 3.136706, -4.97235,
-4.271008, 3.136706, 5.712831,
3.728176, 3.136706, 5.712831,
3.728176, -3.781657, -4.97235,
3.728176, 3.136706, -4.97235,
3.728176, -3.781657, 5.712831,
3.728176, 3.136706, 5.712831,
3.728176, -3.781657, -4.97235,
3.728176, -3.781657, 5.712831,
3.728176, 3.136706, -4.97235,
3.728176, 3.136706, 5.712831
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
var radius = 8.027911;
var distance = 35.71708;
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
mvMatrix.translate( 0.2714159, 0.3224751, -0.3702407 );
mvMatrix.scale( 1.085102, 1.254623, 0.8123339 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.71708);
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
diphenylamine_N-phos<-read.table("diphenylamine_N-phos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diphenylamine_N-phos$V2
```

```
## Error in eval(expr, envir, enclos): object 'diphenylamine_N' not found
```

```r
y<-diphenylamine_N-phos$V3
```

```
## Error in eval(expr, envir, enclos): object 'diphenylamine_N' not found
```

```r
z<-diphenylamine_N-phos$V4
```

```
## Error in eval(expr, envir, enclos): object 'diphenylamine_N' not found
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
-4.154515, 0.6739298, -1.224486, 0, 0, 1, 1, 1,
-3.552152, -0.01211005, -3.411227, 1, 0, 0, 1, 1,
-2.513093, 0.5295293, -1.462207, 1, 0, 0, 1, 1,
-2.504644, 0.8901614, -1.638, 1, 0, 0, 1, 1,
-2.421228, -1.071562, -3.272371, 1, 0, 0, 1, 1,
-2.404069, 0.365399, -1.156978, 1, 0, 0, 1, 1,
-2.402309, 0.3669415, -0.316048, 0, 0, 0, 1, 1,
-2.345493, 1.768209, -0.2101185, 0, 0, 0, 1, 1,
-2.33164, 0.9039227, -2.001636, 0, 0, 0, 1, 1,
-2.254132, 0.5369948, -1.739478, 0, 0, 0, 1, 1,
-2.139483, 0.3568861, -1.766068, 0, 0, 0, 1, 1,
-2.123703, -1.827899, -1.983406, 0, 0, 0, 1, 1,
-2.11787, 0.5283991, -1.539535, 0, 0, 0, 1, 1,
-2.037577, -0.5088096, -3.191055, 1, 1, 1, 1, 1,
-2.033789, 0.2854877, -0.3441501, 1, 1, 1, 1, 1,
-2.000344, 0.4522693, -0.8813416, 1, 1, 1, 1, 1,
-1.979493, 1.363971, -0.3530741, 1, 1, 1, 1, 1,
-1.977098, -0.4339129, -1.602497, 1, 1, 1, 1, 1,
-1.969412, 0.4392199, 1.432826, 1, 1, 1, 1, 1,
-1.959819, 1.226828, -0.6508422, 1, 1, 1, 1, 1,
-1.950082, 0.3964224, -1.554611, 1, 1, 1, 1, 1,
-1.943505, 1.786312, -0.4098656, 1, 1, 1, 1, 1,
-1.907634, 1.596403, -0.2425625, 1, 1, 1, 1, 1,
-1.898456, -1.238534, -2.056795, 1, 1, 1, 1, 1,
-1.888368, -0.5276816, -3.175259, 1, 1, 1, 1, 1,
-1.881605, -0.6070239, -2.234475, 1, 1, 1, 1, 1,
-1.876824, -2.142024, -4.014516, 1, 1, 1, 1, 1,
-1.862197, 0.08686554, -0.432627, 1, 1, 1, 1, 1,
-1.853017, -0.9718159, -1.702398, 0, 0, 1, 1, 1,
-1.849773, 0.3125823, -1.173861, 1, 0, 0, 1, 1,
-1.824901, -1.25155, -0.8221717, 1, 0, 0, 1, 1,
-1.818131, -0.3827932, -1.139519, 1, 0, 0, 1, 1,
-1.801021, 1.031822, -0.3882539, 1, 0, 0, 1, 1,
-1.784232, 0.2092573, -1.028008, 1, 0, 0, 1, 1,
-1.7628, 0.1833889, -1.966279, 0, 0, 0, 1, 1,
-1.756679, 1.47328, -0.05299973, 0, 0, 0, 1, 1,
-1.756669, -0.07578088, -2.044453, 0, 0, 0, 1, 1,
-1.75455, 0.73726, -2.239718, 0, 0, 0, 1, 1,
-1.743645, -1.468997, -1.671185, 0, 0, 0, 1, 1,
-1.740827, -0.3710492, -2.305196, 0, 0, 0, 1, 1,
-1.725004, -2.858871, -2.469639, 0, 0, 0, 1, 1,
-1.706406, 0.07307021, -1.771114, 1, 1, 1, 1, 1,
-1.699569, -0.01093734, -1.036599, 1, 1, 1, 1, 1,
-1.692837, -0.4965047, -1.204344, 1, 1, 1, 1, 1,
-1.690722, -0.2517196, -2.02544, 1, 1, 1, 1, 1,
-1.676052, -1.822237, -1.273963, 1, 1, 1, 1, 1,
-1.672495, 0.9182677, -1.961338, 1, 1, 1, 1, 1,
-1.659248, -0.02475942, -0.267318, 1, 1, 1, 1, 1,
-1.657866, 0.6739783, -1.223498, 1, 1, 1, 1, 1,
-1.650473, 0.4326851, -2.680825, 1, 1, 1, 1, 1,
-1.649992, 1.8071, -1.987288, 1, 1, 1, 1, 1,
-1.649569, 0.04205589, -3.034131, 1, 1, 1, 1, 1,
-1.635771, -0.04413971, -0.8430938, 1, 1, 1, 1, 1,
-1.62292, 1.746948, -0.9584006, 1, 1, 1, 1, 1,
-1.618096, 1.40102, 0.3877182, 1, 1, 1, 1, 1,
-1.612307, -0.06455787, -1.194432, 1, 1, 1, 1, 1,
-1.610516, -0.06882983, -1.48454, 0, 0, 1, 1, 1,
-1.579208, -2.742452, -1.479433, 1, 0, 0, 1, 1,
-1.578875, 0.8823075, -1.443214, 1, 0, 0, 1, 1,
-1.574824, -0.6820417, -1.512762, 1, 0, 0, 1, 1,
-1.560943, 2.156119, -1.075433, 1, 0, 0, 1, 1,
-1.553864, 0.8932954, -0.6400568, 1, 0, 0, 1, 1,
-1.553845, 0.5278195, -0.6520627, 0, 0, 0, 1, 1,
-1.552075, -0.9994463, -1.997061, 0, 0, 0, 1, 1,
-1.545392, 0.5412282, 0.5282375, 0, 0, 0, 1, 1,
-1.544946, -0.68657, -1.40533, 0, 0, 0, 1, 1,
-1.544671, -0.07875562, -1.960169, 0, 0, 0, 1, 1,
-1.53234, 0.4022892, -2.410267, 0, 0, 0, 1, 1,
-1.506955, -1.544142, -2.337826, 0, 0, 0, 1, 1,
-1.503093, -1.078722, -2.397983, 1, 1, 1, 1, 1,
-1.49365, 1.063774, 0.1627635, 1, 1, 1, 1, 1,
-1.491996, 0.6106293, -1.536078, 1, 1, 1, 1, 1,
-1.48912, -0.9196025, -2.909473, 1, 1, 1, 1, 1,
-1.485447, -0.2381656, -3.545429, 1, 1, 1, 1, 1,
-1.462692, 1.209538, 0.007826944, 1, 1, 1, 1, 1,
-1.447505, 1.292293, -1.789994, 1, 1, 1, 1, 1,
-1.438555, 0.7975564, -1.001158, 1, 1, 1, 1, 1,
-1.436628, 1.760373, 0.658008, 1, 1, 1, 1, 1,
-1.434711, 1.02899, -2.273772, 1, 1, 1, 1, 1,
-1.429636, -1.361929, -3.316235, 1, 1, 1, 1, 1,
-1.413279, -2.387323, -2.099383, 1, 1, 1, 1, 1,
-1.403803, 1.389471, -1.253276, 1, 1, 1, 1, 1,
-1.402322, 0.1654435, -1.61196, 1, 1, 1, 1, 1,
-1.389113, 0.7617892, -1.331594, 1, 1, 1, 1, 1,
-1.381742, 0.653796, -1.186565, 0, 0, 1, 1, 1,
-1.377965, 1.461362, -0.9576202, 1, 0, 0, 1, 1,
-1.373286, -0.1961289, -0.6636882, 1, 0, 0, 1, 1,
-1.373189, 0.8977506, -2.193547, 1, 0, 0, 1, 1,
-1.366842, 1.373265, -0.7754101, 1, 0, 0, 1, 1,
-1.362465, -0.4392031, -2.305333, 1, 0, 0, 1, 1,
-1.360622, -1.333796, -4.763617, 0, 0, 0, 1, 1,
-1.357027, 1.491328, -0.858393, 0, 0, 0, 1, 1,
-1.355659, 0.2851712, -1.554663, 0, 0, 0, 1, 1,
-1.355202, 0.3781469, -2.102444, 0, 0, 0, 1, 1,
-1.350032, 0.02808688, -1.408787, 0, 0, 0, 1, 1,
-1.347844, 0.4778356, -0.8675905, 0, 0, 0, 1, 1,
-1.34186, -0.3172001, -3.137344, 0, 0, 0, 1, 1,
-1.339475, 0.05369464, -1.312189, 1, 1, 1, 1, 1,
-1.33799, -0.1443058, -1.071033, 1, 1, 1, 1, 1,
-1.329136, -0.3956455, -3.237916, 1, 1, 1, 1, 1,
-1.321244, -0.99143, -2.174561, 1, 1, 1, 1, 1,
-1.308157, 1.012427, -0.6641235, 1, 1, 1, 1, 1,
-1.294205, -0.2006668, -1.706724, 1, 1, 1, 1, 1,
-1.289384, -1.006874, -2.711458, 1, 1, 1, 1, 1,
-1.289241, -1.004698, -1.126656, 1, 1, 1, 1, 1,
-1.275873, -0.4243587, -1.413764, 1, 1, 1, 1, 1,
-1.270071, 0.9464513, 0.07487168, 1, 1, 1, 1, 1,
-1.269725, -1.208203, -2.549312, 1, 1, 1, 1, 1,
-1.267814, -0.7332214, -1.57915, 1, 1, 1, 1, 1,
-1.267647, 2.291883, -1.439603, 1, 1, 1, 1, 1,
-1.26322, -0.3165512, -1.27117, 1, 1, 1, 1, 1,
-1.258776, 0.4867812, -1.173151, 1, 1, 1, 1, 1,
-1.25321, -0.2966539, -0.8658566, 0, 0, 1, 1, 1,
-1.251871, 0.7685041, -1.021187, 1, 0, 0, 1, 1,
-1.251682, -1.188478, -2.323084, 1, 0, 0, 1, 1,
-1.235733, 0.3048881, -2.559107, 1, 0, 0, 1, 1,
-1.228962, -0.1496775, -1.553934, 1, 0, 0, 1, 1,
-1.227966, -0.4659343, -0.7202558, 1, 0, 0, 1, 1,
-1.226965, 1.560534, -0.8878666, 0, 0, 0, 1, 1,
-1.225398, 0.06073746, -2.025697, 0, 0, 0, 1, 1,
-1.218043, -0.4510267, -2.450095, 0, 0, 0, 1, 1,
-1.213835, 0.460086, 0.4350569, 0, 0, 0, 1, 1,
-1.212635, 1.782521, 0.1824306, 0, 0, 0, 1, 1,
-1.200461, -0.898018, -1.451907, 0, 0, 0, 1, 1,
-1.199169, 0.01578714, -1.455172, 0, 0, 0, 1, 1,
-1.198058, -0.2362208, -0.3400325, 1, 1, 1, 1, 1,
-1.192342, 2.422724, -0.1746522, 1, 1, 1, 1, 1,
-1.189798, 1.208877, -1.384812, 1, 1, 1, 1, 1,
-1.183297, 0.6915708, -2.276284, 1, 1, 1, 1, 1,
-1.18013, -1.085348, -1.396098, 1, 1, 1, 1, 1,
-1.173081, 0.6890969, -0.2895754, 1, 1, 1, 1, 1,
-1.172364, 1.569739, -0.305741, 1, 1, 1, 1, 1,
-1.161169, 0.002786117, -1.482383, 1, 1, 1, 1, 1,
-1.154433, -0.2403268, -3.30051, 1, 1, 1, 1, 1,
-1.146445, -0.2926371, -0.832435, 1, 1, 1, 1, 1,
-1.144806, 0.1081448, -1.238037, 1, 1, 1, 1, 1,
-1.137936, 1.174107, -1.051188, 1, 1, 1, 1, 1,
-1.136077, 0.4612999, -1.960357, 1, 1, 1, 1, 1,
-1.13334, 0.7132471, -0.3715605, 1, 1, 1, 1, 1,
-1.130183, 0.6710457, -0.9600524, 1, 1, 1, 1, 1,
-1.127613, 0.5365738, -0.416021, 0, 0, 1, 1, 1,
-1.125001, -2.285912, -2.633553, 1, 0, 0, 1, 1,
-1.121909, -1.167536, -2.650865, 1, 0, 0, 1, 1,
-1.119153, 1.364423, -0.9150814, 1, 0, 0, 1, 1,
-1.115906, 2.182513, 0.155975, 1, 0, 0, 1, 1,
-1.104903, 0.1454193, -0.7752195, 1, 0, 0, 1, 1,
-1.099729, -0.1754034, -2.509104, 0, 0, 0, 1, 1,
-1.09795, -0.4729762, -1.940412, 0, 0, 0, 1, 1,
-1.086126, -1.782108, -3.67116, 0, 0, 0, 1, 1,
-1.084122, 1.02801, -1.252668, 0, 0, 0, 1, 1,
-1.075312, -1.272565, -3.433766, 0, 0, 0, 1, 1,
-1.074666, -0.5722045, -3.251519, 0, 0, 0, 1, 1,
-1.065623, -1.473265, -3.585742, 0, 0, 0, 1, 1,
-1.064515, -1.361312, -1.482501, 1, 1, 1, 1, 1,
-1.060903, -0.3510133, -2.288074, 1, 1, 1, 1, 1,
-1.059603, 1.274832, 0.129943, 1, 1, 1, 1, 1,
-1.05766, 0.9790226, -1.175292, 1, 1, 1, 1, 1,
-1.054484, 0.5754624, -0.3514013, 1, 1, 1, 1, 1,
-1.052428, -1.870595, -0.9952484, 1, 1, 1, 1, 1,
-1.047184, 2.933798, 0.504355, 1, 1, 1, 1, 1,
-1.045659, 0.4227106, -2.100124, 1, 1, 1, 1, 1,
-1.045396, -0.395698, -2.810158, 1, 1, 1, 1, 1,
-1.044251, 0.2615693, -2.201344, 1, 1, 1, 1, 1,
-1.038152, -0.8337138, -2.199531, 1, 1, 1, 1, 1,
-1.036823, -1.78471, -2.122612, 1, 1, 1, 1, 1,
-1.030053, 0.3141109, -1.41168, 1, 1, 1, 1, 1,
-1.020154, 0.9574975, -0.6066248, 1, 1, 1, 1, 1,
-1.017768, 0.518901, -1.113571, 1, 1, 1, 1, 1,
-1.015616, -0.3845062, -3.153988, 0, 0, 1, 1, 1,
-1.013434, -2.515363, -2.258915, 1, 0, 0, 1, 1,
-1.013146, 0.3632203, -1.354267, 1, 0, 0, 1, 1,
-1.003513, 0.5066347, -1.828139, 1, 0, 0, 1, 1,
-0.9971009, -0.9322228, -2.779037, 1, 0, 0, 1, 1,
-0.9935475, -0.6328096, -0.7897706, 1, 0, 0, 1, 1,
-0.9923444, -0.08061089, -1.135878, 0, 0, 0, 1, 1,
-0.9906371, 0.163586, -2.434738, 0, 0, 0, 1, 1,
-0.9891912, 0.9528933, -2.209013, 0, 0, 0, 1, 1,
-0.982796, 0.1685581, 0.002622005, 0, 0, 0, 1, 1,
-0.981389, 0.9930406, 0.08705335, 0, 0, 0, 1, 1,
-0.980269, -0.0426256, -0.8541028, 0, 0, 0, 1, 1,
-0.9798923, -2.37201, -3.383627, 0, 0, 0, 1, 1,
-0.978414, 1.027254, -0.7144213, 1, 1, 1, 1, 1,
-0.977283, 0.09286584, -3.223052, 1, 1, 1, 1, 1,
-0.9676869, 0.07067419, -1.511853, 1, 1, 1, 1, 1,
-0.9595436, -0.4839663, 0.07992011, 1, 1, 1, 1, 1,
-0.9579262, 0.5088763, -0.6928425, 1, 1, 1, 1, 1,
-0.9578774, -0.06169606, -4.087527, 1, 1, 1, 1, 1,
-0.9572128, 0.1997811, -1.473105, 1, 1, 1, 1, 1,
-0.9565825, 0.2679378, -0.05355393, 1, 1, 1, 1, 1,
-0.9422935, -0.6812648, -1.995376, 1, 1, 1, 1, 1,
-0.9418253, 0.8097511, -1.564324, 1, 1, 1, 1, 1,
-0.9415683, 0.5627117, -1.061285, 1, 1, 1, 1, 1,
-0.9373373, -1.439101, -1.065469, 1, 1, 1, 1, 1,
-0.9363167, -0.2183404, -1.68533, 1, 1, 1, 1, 1,
-0.9358853, -0.5558014, -2.35337, 1, 1, 1, 1, 1,
-0.9346307, 0.2508138, -2.947085, 1, 1, 1, 1, 1,
-0.9322217, 0.09524141, -0.4186724, 0, 0, 1, 1, 1,
-0.9315745, -0.6178272, -2.332028, 1, 0, 0, 1, 1,
-0.9237599, 0.7638504, -1.188515, 1, 0, 0, 1, 1,
-0.9100922, 1.199057, -0.9021785, 1, 0, 0, 1, 1,
-0.9061398, -0.6770696, -2.127584, 1, 0, 0, 1, 1,
-0.9030468, -1.016813, -1.864214, 1, 0, 0, 1, 1,
-0.8985453, 0.4672206, -0.7534286, 0, 0, 0, 1, 1,
-0.8948371, -0.7622527, -4.196878, 0, 0, 0, 1, 1,
-0.8935664, -1.204149, -0.7159396, 0, 0, 0, 1, 1,
-0.8916033, -1.233917, -2.656402, 0, 0, 0, 1, 1,
-0.888164, -0.1018323, 0.2920995, 0, 0, 0, 1, 1,
-0.8869712, 1.624921, 0.6370766, 0, 0, 0, 1, 1,
-0.8809412, 0.3380438, -1.327556, 0, 0, 0, 1, 1,
-0.8781034, -0.6669587, -3.917267, 1, 1, 1, 1, 1,
-0.875972, 0.1686745, -0.630536, 1, 1, 1, 1, 1,
-0.8721882, 0.1735288, -2.160714, 1, 1, 1, 1, 1,
-0.8640849, 2.156134, -0.4098862, 1, 1, 1, 1, 1,
-0.860986, 2.146034, 0.03088912, 1, 1, 1, 1, 1,
-0.8596861, 0.3377102, -1.163955, 1, 1, 1, 1, 1,
-0.8574391, 0.01379219, -0.7478421, 1, 1, 1, 1, 1,
-0.8460801, -1.261889, -3.877175, 1, 1, 1, 1, 1,
-0.8394899, 0.6738235, -0.7251368, 1, 1, 1, 1, 1,
-0.8368745, -1.350857, -1.789071, 1, 1, 1, 1, 1,
-0.8351822, 0.297394, -1.362077, 1, 1, 1, 1, 1,
-0.8350241, -0.5268249, -4.0271, 1, 1, 1, 1, 1,
-0.8342267, 1.529462, 0.7041685, 1, 1, 1, 1, 1,
-0.8339208, 0.3976456, -1.326634, 1, 1, 1, 1, 1,
-0.8306372, -0.8614841, -1.843786, 1, 1, 1, 1, 1,
-0.8294129, 2.173838, -1.019646, 0, 0, 1, 1, 1,
-0.8289597, -0.8595981, -2.446269, 1, 0, 0, 1, 1,
-0.8284386, 0.6952932, -1.06979, 1, 0, 0, 1, 1,
-0.8256033, 3.035954, 0.4893219, 1, 0, 0, 1, 1,
-0.8143225, 0.2352298, -0.6933117, 1, 0, 0, 1, 1,
-0.8115465, 1.401976, -0.2917226, 1, 0, 0, 1, 1,
-0.811074, -0.4888142, -2.342627, 0, 0, 0, 1, 1,
-0.8079085, -0.1222384, 0.1012175, 0, 0, 0, 1, 1,
-0.8045456, -1.570872, -2.044643, 0, 0, 0, 1, 1,
-0.801617, 0.04025391, -0.8331761, 0, 0, 0, 1, 1,
-0.8005767, 0.2046086, -2.686623, 0, 0, 0, 1, 1,
-0.79833, -0.4503104, -1.272346, 0, 0, 0, 1, 1,
-0.7959276, -0.3039078, -4.092804, 0, 0, 0, 1, 1,
-0.7915754, 0.3649887, -1.013397, 1, 1, 1, 1, 1,
-0.7849324, 1.662858, -1.316814, 1, 1, 1, 1, 1,
-0.7846125, -1.878663, -2.650106, 1, 1, 1, 1, 1,
-0.7826444, -2.432185, -4.121744, 1, 1, 1, 1, 1,
-0.7818106, -0.8505852, -4.27108, 1, 1, 1, 1, 1,
-0.7817839, 0.08190354, -1.579733, 1, 1, 1, 1, 1,
-0.7738008, 1.853081, -0.03712187, 1, 1, 1, 1, 1,
-0.7734559, -1.516072, -1.905106, 1, 1, 1, 1, 1,
-0.7687619, 0.4148953, -2.359429, 1, 1, 1, 1, 1,
-0.7681878, -0.460986, -0.2514463, 1, 1, 1, 1, 1,
-0.7671993, 1.978596, -0.4822893, 1, 1, 1, 1, 1,
-0.7660457, -0.3423194, -1.480603, 1, 1, 1, 1, 1,
-0.7609837, -1.684923, -1.981914, 1, 1, 1, 1, 1,
-0.7600555, 0.4481162, -2.925661, 1, 1, 1, 1, 1,
-0.7550353, -1.404919, -1.853626, 1, 1, 1, 1, 1,
-0.7541358, -0.6276398, -2.271188, 0, 0, 1, 1, 1,
-0.7442842, -0.2251418, 0.7783064, 1, 0, 0, 1, 1,
-0.7397469, -0.4030504, -2.427578, 1, 0, 0, 1, 1,
-0.7385046, 1.066554, 1.005815, 1, 0, 0, 1, 1,
-0.7376192, -0.1180991, -0.4458973, 1, 0, 0, 1, 1,
-0.7350727, -0.8159414, -2.406418, 1, 0, 0, 1, 1,
-0.7323661, -0.2813368, -0.5860158, 0, 0, 0, 1, 1,
-0.7320794, -1.538145, -2.794802, 0, 0, 0, 1, 1,
-0.7291966, 1.204684, 0.3626711, 0, 0, 0, 1, 1,
-0.7273629, -0.3585345, -2.193296, 0, 0, 0, 1, 1,
-0.7220392, -0.7289802, -3.571393, 0, 0, 0, 1, 1,
-0.7070826, 0.6282063, 0.8452401, 0, 0, 0, 1, 1,
-0.7003532, 2.044585, 0.06048097, 0, 0, 0, 1, 1,
-0.6946673, 0.3832841, -0.8170457, 1, 1, 1, 1, 1,
-0.690838, 1.058816, -1.465575, 1, 1, 1, 1, 1,
-0.6898082, 0.8873634, -0.6677656, 1, 1, 1, 1, 1,
-0.6896207, 0.2253582, -0.3425762, 1, 1, 1, 1, 1,
-0.688131, -2.00807, -2.640409, 1, 1, 1, 1, 1,
-0.6867429, 0.363334, -0.8077487, 1, 1, 1, 1, 1,
-0.686157, -2.095631, -2.973851, 1, 1, 1, 1, 1,
-0.6814633, 2.442565, -0.6756841, 1, 1, 1, 1, 1,
-0.6788979, 1.98298, -1.258367, 1, 1, 1, 1, 1,
-0.6671863, -0.05082416, -2.323917, 1, 1, 1, 1, 1,
-0.6583759, 1.006368, 0.9397423, 1, 1, 1, 1, 1,
-0.6565714, 1.274406, -0.9192972, 1, 1, 1, 1, 1,
-0.6499436, 0.625391, -2.134834, 1, 1, 1, 1, 1,
-0.6458996, -1.077274, -1.174304, 1, 1, 1, 1, 1,
-0.6399585, 0.9923162, -0.5299567, 1, 1, 1, 1, 1,
-0.6303772, -0.3473147, -2.282072, 0, 0, 1, 1, 1,
-0.6230564, 0.4185437, 0.6412357, 1, 0, 0, 1, 1,
-0.6179464, -0.8343118, -3.984785, 1, 0, 0, 1, 1,
-0.6108868, 1.869771, 0.6869669, 1, 0, 0, 1, 1,
-0.6082605, -0.2999732, -1.474614, 1, 0, 0, 1, 1,
-0.6016033, -1.034958, -1.938559, 1, 0, 0, 1, 1,
-0.6015031, 2.31458, 0.5243509, 0, 0, 0, 1, 1,
-0.5924903, 1.469496, -0.1000626, 0, 0, 0, 1, 1,
-0.5882165, 0.521024, -2.428387, 0, 0, 0, 1, 1,
-0.584765, 0.7385083, -0.9768828, 0, 0, 0, 1, 1,
-0.5844945, 0.08891509, -0.8760823, 0, 0, 0, 1, 1,
-0.583977, -0.4559539, -1.944637, 0, 0, 0, 1, 1,
-0.5824941, 0.6265162, -0.5374975, 0, 0, 0, 1, 1,
-0.5817055, 0.4362155, 0.2016411, 1, 1, 1, 1, 1,
-0.5768318, -1.322633, -3.237798, 1, 1, 1, 1, 1,
-0.5762365, -0.3625521, -1.015382, 1, 1, 1, 1, 1,
-0.5718679, 0.8368334, -0.3665835, 1, 1, 1, 1, 1,
-0.5667521, -0.3188162, -3.71183, 1, 1, 1, 1, 1,
-0.558932, 0.02854513, -0.8848742, 1, 1, 1, 1, 1,
-0.5576496, -0.6591387, -2.973184, 1, 1, 1, 1, 1,
-0.5538266, 0.6906945, -0.3531498, 1, 1, 1, 1, 1,
-0.5534399, 0.3589309, -0.9975323, 1, 1, 1, 1, 1,
-0.5520311, 2.091454, -1.822511, 1, 1, 1, 1, 1,
-0.5496085, -0.6530368, -2.886272, 1, 1, 1, 1, 1,
-0.5480657, -1.728881, -2.929994, 1, 1, 1, 1, 1,
-0.5468985, 1.215132, 2.018809, 1, 1, 1, 1, 1,
-0.5442159, -1.178108, -1.710678, 1, 1, 1, 1, 1,
-0.5440168, -0.86331, -2.613879, 1, 1, 1, 1, 1,
-0.5423485, 0.184981, -0.9917462, 0, 0, 1, 1, 1,
-0.541776, -0.6516758, -1.823919, 1, 0, 0, 1, 1,
-0.5410599, -0.7504051, -3.196129, 1, 0, 0, 1, 1,
-0.5407027, -0.4000811, -1.131354, 1, 0, 0, 1, 1,
-0.537692, -0.3313304, -1.665478, 1, 0, 0, 1, 1,
-0.5334846, 1.431141, 1.135034, 1, 0, 0, 1, 1,
-0.533399, -0.002794469, -1.923091, 0, 0, 0, 1, 1,
-0.5323198, -2.041627, -3.059373, 0, 0, 0, 1, 1,
-0.5321624, 0.434373, -1.072207, 0, 0, 0, 1, 1,
-0.5291923, 0.988628, -3.232086, 0, 0, 0, 1, 1,
-0.5277526, -0.1506791, -1.55054, 0, 0, 0, 1, 1,
-0.5274187, -1.142784, -1.148119, 0, 0, 0, 1, 1,
-0.5227085, -0.8650081, -3.449412, 0, 0, 0, 1, 1,
-0.522637, -2.520252, -2.628145, 1, 1, 1, 1, 1,
-0.5198991, -0.4156827, -2.553059, 1, 1, 1, 1, 1,
-0.5196874, -0.7761701, -2.108491, 1, 1, 1, 1, 1,
-0.5191034, -0.4447809, -0.3787763, 1, 1, 1, 1, 1,
-0.5187078, 1.767872, -1.317341, 1, 1, 1, 1, 1,
-0.5159605, 1.715215, 0.2172648, 1, 1, 1, 1, 1,
-0.5154529, 1.967913, -1.781382, 1, 1, 1, 1, 1,
-0.5146543, -0.3898022, -2.620765, 1, 1, 1, 1, 1,
-0.513652, -0.7885476, -3.644906, 1, 1, 1, 1, 1,
-0.5131941, -0.7257241, -3.451283, 1, 1, 1, 1, 1,
-0.5115265, 0.9581082, -0.002636724, 1, 1, 1, 1, 1,
-0.5100564, -0.3776346, -2.742759, 1, 1, 1, 1, 1,
-0.5098312, -0.3287809, -3.497895, 1, 1, 1, 1, 1,
-0.5066352, 0.6203437, 1.740686, 1, 1, 1, 1, 1,
-0.5044314, -1.480569, -0.8442965, 1, 1, 1, 1, 1,
-0.5039778, 0.6832827, 0.219091, 0, 0, 1, 1, 1,
-0.502734, 1.146855, -0.5294013, 1, 0, 0, 1, 1,
-0.4992706, 0.6952872, -0.2929198, 1, 0, 0, 1, 1,
-0.4946655, -1.69362, -3.44523, 1, 0, 0, 1, 1,
-0.4934152, 0.09337404, -2.03012, 1, 0, 0, 1, 1,
-0.4930394, 1.656407, 0.646161, 1, 0, 0, 1, 1,
-0.4897577, -0.009084177, -3.011481, 0, 0, 0, 1, 1,
-0.4880816, -0.2413028, -3.140633, 0, 0, 0, 1, 1,
-0.487958, 0.1380393, -0.7226166, 0, 0, 0, 1, 1,
-0.4821874, -0.9872553, -1.364626, 0, 0, 0, 1, 1,
-0.4711971, -0.9913889, -2.42916, 0, 0, 0, 1, 1,
-0.4677076, 0.3121238, -1.55543, 0, 0, 0, 1, 1,
-0.4655735, -0.2070938, -1.354247, 0, 0, 0, 1, 1,
-0.4625793, -0.232583, -1.454266, 1, 1, 1, 1, 1,
-0.4572756, -1.794122, -1.894288, 1, 1, 1, 1, 1,
-0.4551948, -0.1422472, -2.24803, 1, 1, 1, 1, 1,
-0.4449702, -0.7257425, -3.65367, 1, 1, 1, 1, 1,
-0.4432274, 0.4813722, -1.620631, 1, 1, 1, 1, 1,
-0.4422927, 0.5785762, -1.3265, 1, 1, 1, 1, 1,
-0.4414878, 0.9462606, -0.06435207, 1, 1, 1, 1, 1,
-0.4347842, 0.9621029, 0.1073206, 1, 1, 1, 1, 1,
-0.4285806, -0.2051802, -1.790298, 1, 1, 1, 1, 1,
-0.4275255, -0.2997539, -2.689716, 1, 1, 1, 1, 1,
-0.421869, -0.2790574, 0.4458355, 1, 1, 1, 1, 1,
-0.4217899, -0.877481, -3.923953, 1, 1, 1, 1, 1,
-0.4204452, 0.5981745, -0.7440321, 1, 1, 1, 1, 1,
-0.4185357, -0.6267459, -2.559928, 1, 1, 1, 1, 1,
-0.4165373, -1.364656, -2.261795, 1, 1, 1, 1, 1,
-0.4163879, 1.607949, -0.7567457, 0, 0, 1, 1, 1,
-0.4134767, -0.3822428, -3.842609, 1, 0, 0, 1, 1,
-0.4117203, -1.338292, -4.486212, 1, 0, 0, 1, 1,
-0.4098975, 1.062661, -1.06152, 1, 0, 0, 1, 1,
-0.3986093, -0.5161631, -3.947825, 1, 0, 0, 1, 1,
-0.3979073, 0.2922763, -1.575312, 1, 0, 0, 1, 1,
-0.3931679, 0.1522309, -2.464806, 0, 0, 0, 1, 1,
-0.3914138, -0.009501419, -2.680559, 0, 0, 0, 1, 1,
-0.3846882, 0.5132878, 0.4364366, 0, 0, 0, 1, 1,
-0.3831671, -2.63523, -4.499638, 0, 0, 0, 1, 1,
-0.382809, 0.5162708, -1.775306, 0, 0, 0, 1, 1,
-0.3827431, -0.5493667, -2.56068, 0, 0, 0, 1, 1,
-0.382157, 1.598879, -0.4285979, 0, 0, 0, 1, 1,
-0.3820995, 1.041305, -0.7785693, 1, 1, 1, 1, 1,
-0.3785317, 1.196079, -0.8401781, 1, 1, 1, 1, 1,
-0.3784355, 1.246847, 0.2800679, 1, 1, 1, 1, 1,
-0.3774686, -0.0321666, -2.227082, 1, 1, 1, 1, 1,
-0.3770974, -0.02330572, -1.834281, 1, 1, 1, 1, 1,
-0.3704774, 0.7557245, -1.000251, 1, 1, 1, 1, 1,
-0.3704455, 0.2771084, -0.616666, 1, 1, 1, 1, 1,
-0.3670562, 1.17317, 0.1500581, 1, 1, 1, 1, 1,
-0.3628399, -1.298594, -2.759273, 1, 1, 1, 1, 1,
-0.3618173, 0.5980265, 0.3660137, 1, 1, 1, 1, 1,
-0.3595861, 0.003680927, -1.741995, 1, 1, 1, 1, 1,
-0.3591647, -0.3694007, -1.503715, 1, 1, 1, 1, 1,
-0.357847, -0.7145985, -1.940882, 1, 1, 1, 1, 1,
-0.35761, 0.9700763, -2.144817, 1, 1, 1, 1, 1,
-0.3573023, -0.9127676, -1.856733, 1, 1, 1, 1, 1,
-0.3555884, -1.085475, -3.565795, 0, 0, 1, 1, 1,
-0.354431, 1.360873, 0.184314, 1, 0, 0, 1, 1,
-0.3541098, -0.7976393, -1.704641, 1, 0, 0, 1, 1,
-0.3505671, 1.614339, 1.152566, 1, 0, 0, 1, 1,
-0.3492071, -1.014899, -2.602768, 1, 0, 0, 1, 1,
-0.3464758, 0.0967005, -1.478622, 1, 0, 0, 1, 1,
-0.3464236, 0.1236761, -0.7227964, 0, 0, 0, 1, 1,
-0.3443063, -0.49923, -2.780931, 0, 0, 0, 1, 1,
-0.3417546, -1.217892, -2.272227, 0, 0, 0, 1, 1,
-0.3378011, -0.9789051, -2.814726, 0, 0, 0, 1, 1,
-0.3368074, 0.2910842, -0.465358, 0, 0, 0, 1, 1,
-0.3346241, -0.2427868, -0.6366644, 0, 0, 0, 1, 1,
-0.3319325, -0.000646067, -1.89249, 0, 0, 0, 1, 1,
-0.3233156, -0.8804935, -1.793103, 1, 1, 1, 1, 1,
-0.3215812, 0.5072184, -0.6628833, 1, 1, 1, 1, 1,
-0.3206908, -0.7387754, -1.508395, 1, 1, 1, 1, 1,
-0.3174424, 0.006745894, -2.294208, 1, 1, 1, 1, 1,
-0.3137619, -0.1739524, -1.996849, 1, 1, 1, 1, 1,
-0.313244, -1.043515, -3.126804, 1, 1, 1, 1, 1,
-0.3122515, 1.349578, 1.203333, 1, 1, 1, 1, 1,
-0.310324, -0.8264886, -2.542762, 1, 1, 1, 1, 1,
-0.3080501, 2.070552, -2.601127, 1, 1, 1, 1, 1,
-0.3076291, 0.7288419, -0.4290525, 1, 1, 1, 1, 1,
-0.3067963, 0.8651269, -0.4748966, 1, 1, 1, 1, 1,
-0.3040574, 1.472974, -0.2887809, 1, 1, 1, 1, 1,
-0.3024636, 0.5168399, 0.4282643, 1, 1, 1, 1, 1,
-0.3024189, 1.834742, -1.135595, 1, 1, 1, 1, 1,
-0.2974431, 1.5701, 0.4842255, 1, 1, 1, 1, 1,
-0.2963383, -1.24385, -3.031675, 0, 0, 1, 1, 1,
-0.2879795, 1.658476, -0.2274261, 1, 0, 0, 1, 1,
-0.2833179, -1.809156, -3.529289, 1, 0, 0, 1, 1,
-0.2758931, -1.00937, -1.88095, 1, 0, 0, 1, 1,
-0.2738162, 0.06961601, -2.008983, 1, 0, 0, 1, 1,
-0.270174, 0.2497212, 0.1455066, 1, 0, 0, 1, 1,
-0.2641336, -0.6206105, -2.26757, 0, 0, 0, 1, 1,
-0.261225, 1.205367, 0.8738691, 0, 0, 0, 1, 1,
-0.2585402, -0.7392616, -3.664001, 0, 0, 0, 1, 1,
-0.2556135, -0.0671473, -1.823253, 0, 0, 0, 1, 1,
-0.2555234, 0.1295272, -1.730852, 0, 0, 0, 1, 1,
-0.2520555, 0.2973455, 0.7542728, 0, 0, 0, 1, 1,
-0.2513146, -0.2184153, -1.994386, 0, 0, 0, 1, 1,
-0.250466, 0.52343, 2.447281, 1, 1, 1, 1, 1,
-0.2484222, -0.1701289, -1.258654, 1, 1, 1, 1, 1,
-0.2453539, -0.5014173, -2.041521, 1, 1, 1, 1, 1,
-0.2453128, -0.8738226, -1.909461, 1, 1, 1, 1, 1,
-0.2427694, 0.1190507, -1.325786, 1, 1, 1, 1, 1,
-0.241972, 1.000758, -0.434857, 1, 1, 1, 1, 1,
-0.2377408, 0.8646009, -1.278654, 1, 1, 1, 1, 1,
-0.2350907, 0.5264289, -2.116677, 1, 1, 1, 1, 1,
-0.2335232, 0.8563638, -1.171484, 1, 1, 1, 1, 1,
-0.2315574, 0.4058197, 2.192798, 1, 1, 1, 1, 1,
-0.2310928, -0.2251851, -3.129688, 1, 1, 1, 1, 1,
-0.2260888, 1.658571, -0.8990886, 1, 1, 1, 1, 1,
-0.2251431, -1.208252, -2.496433, 1, 1, 1, 1, 1,
-0.2218308, -0.1167258, -0.9215189, 1, 1, 1, 1, 1,
-0.2215924, -0.4388853, -2.523921, 1, 1, 1, 1, 1,
-0.2199894, 0.5358246, -0.2573577, 0, 0, 1, 1, 1,
-0.2139761, -2.364724, -2.93404, 1, 0, 0, 1, 1,
-0.2118587, -0.8247497, -1.985387, 1, 0, 0, 1, 1,
-0.2086377, 1.389594, 0.1333343, 1, 0, 0, 1, 1,
-0.2077309, 0.2604267, -0.5934417, 1, 0, 0, 1, 1,
-0.2075339, -0.5021885, -0.8970885, 1, 0, 0, 1, 1,
-0.2041446, 0.9630774, -0.220024, 0, 0, 0, 1, 1,
-0.1962274, 0.7184438, 0.9903659, 0, 0, 0, 1, 1,
-0.1920637, 1.00525, 1.149297, 0, 0, 0, 1, 1,
-0.1867334, -1.185062, -4.229933, 0, 0, 0, 1, 1,
-0.1814639, -0.8608078, -4.816741, 0, 0, 0, 1, 1,
-0.1781689, -1.548423, -2.631475, 0, 0, 0, 1, 1,
-0.1749858, -0.9040214, -2.404796, 0, 0, 0, 1, 1,
-0.1740821, -0.399711, -3.632212, 1, 1, 1, 1, 1,
-0.1695578, -0.5363064, -4.352612, 1, 1, 1, 1, 1,
-0.1597401, -0.7328527, -3.106563, 1, 1, 1, 1, 1,
-0.1592337, 0.1155435, -0.6543714, 1, 1, 1, 1, 1,
-0.1558058, -0.3782726, -2.155839, 1, 1, 1, 1, 1,
-0.1546748, 1.246345, -1.978358, 1, 1, 1, 1, 1,
-0.1533592, 0.9982887, -0.5509712, 1, 1, 1, 1, 1,
-0.1523654, -2.247966, -4.23569, 1, 1, 1, 1, 1,
-0.1462053, 1.311723, 0.9800565, 1, 1, 1, 1, 1,
-0.1445305, -1.14026, -2.281334, 1, 1, 1, 1, 1,
-0.1359558, 0.7581523, 1.888766, 1, 1, 1, 1, 1,
-0.1341727, -2.237553, -3.973812, 1, 1, 1, 1, 1,
-0.1306343, -0.3185591, -2.723282, 1, 1, 1, 1, 1,
-0.1301766, -1.380683, -2.643447, 1, 1, 1, 1, 1,
-0.1250758, -1.322677, -3.116925, 1, 1, 1, 1, 1,
-0.1209524, 1.040285, 0.4926518, 0, 0, 1, 1, 1,
-0.1193492, -0.04982964, -2.366545, 1, 0, 0, 1, 1,
-0.1169198, -0.3426013, -1.551263, 1, 0, 0, 1, 1,
-0.116437, -0.7967652, -3.137003, 1, 0, 0, 1, 1,
-0.116203, 0.7017761, -2.260722, 1, 0, 0, 1, 1,
-0.113195, 0.3594783, -1.138022, 1, 0, 0, 1, 1,
-0.1108801, 0.5177898, -0.08568891, 0, 0, 0, 1, 1,
-0.1048126, 0.7402453, -0.05233236, 0, 0, 0, 1, 1,
-0.1038279, 0.5499895, 0.6095126, 0, 0, 0, 1, 1,
-0.1030226, 0.1271659, -2.104725, 0, 0, 0, 1, 1,
-0.09478312, 0.7274048, -1.495862, 0, 0, 0, 1, 1,
-0.09229007, 0.6794862, -1.334634, 0, 0, 0, 1, 1,
-0.08911268, 0.1390734, -1.218644, 0, 0, 0, 1, 1,
-0.08858025, -0.1816793, -2.387951, 1, 1, 1, 1, 1,
-0.08551282, -0.6958974, -3.431955, 1, 1, 1, 1, 1,
-0.08509399, 0.6000301, -2.173767, 1, 1, 1, 1, 1,
-0.08408803, -0.2836323, -1.385869, 1, 1, 1, 1, 1,
-0.08388277, -1.029291, -1.718812, 1, 1, 1, 1, 1,
-0.08338282, 1.611891, 0.5250521, 1, 1, 1, 1, 1,
-0.08262932, 0.1792737, -0.8947399, 1, 1, 1, 1, 1,
-0.08246718, -0.9831147, -1.538257, 1, 1, 1, 1, 1,
-0.08096831, 0.609559, -0.2687661, 1, 1, 1, 1, 1,
-0.07587084, -0.03310515, -2.490512, 1, 1, 1, 1, 1,
-0.07170446, 0.06572098, -1.183553, 1, 1, 1, 1, 1,
-0.06813981, 0.9613117, 0.2694198, 1, 1, 1, 1, 1,
-0.06655043, -2.478793, -3.5369, 1, 1, 1, 1, 1,
-0.0653195, -0.3612914, -2.534323, 1, 1, 1, 1, 1,
-0.06325353, 1.314884, -0.6021411, 1, 1, 1, 1, 1,
-0.06185239, 0.1332245, 1.270044, 0, 0, 1, 1, 1,
-0.05989283, -0.1476935, -1.381449, 1, 0, 0, 1, 1,
-0.05255237, 1.482635, 2.092739, 1, 0, 0, 1, 1,
-0.05186553, -1.558246, -1.824148, 1, 0, 0, 1, 1,
-0.05047711, -1.179639, -3.625942, 1, 0, 0, 1, 1,
-0.05027551, 0.7433582, 1.121409, 1, 0, 0, 1, 1,
-0.04967821, -0.8558175, -2.360108, 0, 0, 0, 1, 1,
-0.04444302, -0.458331, -3.79567, 0, 0, 0, 1, 1,
-0.04258765, 0.246753, -1.766287, 0, 0, 0, 1, 1,
-0.04211428, -0.5647528, -1.984629, 0, 0, 0, 1, 1,
-0.04095152, -0.07421415, -1.945198, 0, 0, 0, 1, 1,
-0.04033805, -0.1066697, -3.218826, 0, 0, 0, 1, 1,
-0.03931312, -1.329305, -3.348132, 0, 0, 0, 1, 1,
-0.03642289, -0.3305729, -2.460949, 1, 1, 1, 1, 1,
-0.02727111, 2.301848, 0.6016005, 1, 1, 1, 1, 1,
-0.0239959, 0.1753633, 0.4845192, 1, 1, 1, 1, 1,
-0.01705776, -0.8488333, -4.165463, 1, 1, 1, 1, 1,
-0.01437414, 0.5453996, -0.8615877, 1, 1, 1, 1, 1,
-0.0125452, -0.7882326, -2.602847, 1, 1, 1, 1, 1,
-0.01253888, 1.492315, -1.665912, 1, 1, 1, 1, 1,
-0.008574901, 0.9827542, 0.684706, 1, 1, 1, 1, 1,
-0.00727597, -0.04683654, -3.647783, 1, 1, 1, 1, 1,
-0.005122317, -0.808789, -4.10405, 1, 1, 1, 1, 1,
-0.003077263, 0.3889647, -1.518992, 1, 1, 1, 1, 1,
-0.002654235, -0.6823166, -4.182262, 1, 1, 1, 1, 1,
0.00194246, 0.5284498, -0.8310625, 1, 1, 1, 1, 1,
0.002349311, -1.682871, 3.795871, 1, 1, 1, 1, 1,
0.002413989, -1.337249, 1.554289, 1, 1, 1, 1, 1,
0.006501373, 1.995962, 2.14181, 0, 0, 1, 1, 1,
0.006519388, -1.187294, 3.12546, 1, 0, 0, 1, 1,
0.009517396, -1.074473, 3.395065, 1, 0, 0, 1, 1,
0.01265243, 0.8388867, 0.4821157, 1, 0, 0, 1, 1,
0.01340408, -0.7742174, 1.950828, 1, 0, 0, 1, 1,
0.01441774, -1.184348, 2.317259, 1, 0, 0, 1, 1,
0.0147189, -1.151789, 2.766261, 0, 0, 0, 1, 1,
0.01928487, -2.009332, 2.108488, 0, 0, 0, 1, 1,
0.01931144, -1.14461, 2.36961, 0, 0, 0, 1, 1,
0.0227986, 1.509457, 0.4718893, 0, 0, 0, 1, 1,
0.02557321, -0.03150354, 2.760806, 0, 0, 0, 1, 1,
0.0261128, -0.485825, 3.588197, 0, 0, 0, 1, 1,
0.02653017, 0.9621763, -1.097788, 0, 0, 0, 1, 1,
0.02721863, 0.4101465, -0.28879, 1, 1, 1, 1, 1,
0.02986781, 0.5037497, -0.2900097, 1, 1, 1, 1, 1,
0.03182271, -1.376355, 3.210747, 1, 1, 1, 1, 1,
0.03185306, 0.3876826, -0.1356484, 1, 1, 1, 1, 1,
0.0326285, 1.424987, -1.182372, 1, 1, 1, 1, 1,
0.03642252, 0.3286869, -1.522309, 1, 1, 1, 1, 1,
0.03811852, -1.361843, 3.547593, 1, 1, 1, 1, 1,
0.03823466, -1.722967, 2.747966, 1, 1, 1, 1, 1,
0.03908883, -0.07561839, 3.167678, 1, 1, 1, 1, 1,
0.04171609, 1.192233, -0.28267, 1, 1, 1, 1, 1,
0.0456546, 0.1692001, -0.961597, 1, 1, 1, 1, 1,
0.04720846, 1.025194, 0.3517335, 1, 1, 1, 1, 1,
0.05396011, 0.1700247, 0.6374162, 1, 1, 1, 1, 1,
0.05602727, -1.479009, 4.78737, 1, 1, 1, 1, 1,
0.05902692, 0.8787826, -1.537484, 1, 1, 1, 1, 1,
0.06075411, -0.04657586, 3.876001, 0, 0, 1, 1, 1,
0.06406173, -1.806359, 4.014228, 1, 0, 0, 1, 1,
0.07470145, -1.059489, 1.425987, 1, 0, 0, 1, 1,
0.07473841, -0.6830239, 2.762493, 1, 0, 0, 1, 1,
0.07597549, -1.214185, 2.766424, 1, 0, 0, 1, 1,
0.07597871, -0.3783816, 4.756707, 1, 0, 0, 1, 1,
0.07606772, 1.334961, -0.6517379, 0, 0, 0, 1, 1,
0.08125671, -0.5602837, 3.15871, 0, 0, 0, 1, 1,
0.08195985, -0.9010403, 3.203787, 0, 0, 0, 1, 1,
0.08356029, 1.308139, -0.9142665, 0, 0, 0, 1, 1,
0.08378568, 1.693369, 0.3552939, 0, 0, 0, 1, 1,
0.08434773, 0.1985155, -1.57777, 0, 0, 0, 1, 1,
0.08691448, 1.989552, 0.1726751, 0, 0, 0, 1, 1,
0.08773857, -1.49009, 4.706888, 1, 1, 1, 1, 1,
0.0883382, -0.1007771, 2.705305, 1, 1, 1, 1, 1,
0.08958543, -0.06433178, 0.1599199, 1, 1, 1, 1, 1,
0.08986825, 0.09614413, 0.08260467, 1, 1, 1, 1, 1,
0.09103053, -0.07060075, 2.470342, 1, 1, 1, 1, 1,
0.09377488, -0.3877301, 3.013335, 1, 1, 1, 1, 1,
0.09452868, 2.556627, -1.571393, 1, 1, 1, 1, 1,
0.09856874, -0.6895902, 1.527994, 1, 1, 1, 1, 1,
0.09868204, 1.62016, -1.314565, 1, 1, 1, 1, 1,
0.1016087, 2.443654, -0.5384839, 1, 1, 1, 1, 1,
0.1024275, 0.5313841, 1.01784, 1, 1, 1, 1, 1,
0.1169736, -1.0872, 1.457458, 1, 1, 1, 1, 1,
0.1171801, 0.2767542, -0.06284168, 1, 1, 1, 1, 1,
0.1186402, 1.358841, -2.887423, 1, 1, 1, 1, 1,
0.1193044, -0.9706216, 1.975069, 1, 1, 1, 1, 1,
0.1220133, 1.082861, 1.152331, 0, 0, 1, 1, 1,
0.122037, -1.758161, 3.471153, 1, 0, 0, 1, 1,
0.1251109, -0.2208444, 2.49679, 1, 0, 0, 1, 1,
0.1280386, -0.08641183, 0.6633916, 1, 0, 0, 1, 1,
0.1325309, -0.7289826, 2.753975, 1, 0, 0, 1, 1,
0.13292, 0.6013148, 0.1060354, 1, 0, 0, 1, 1,
0.1340405, -0.1329569, 1.297523, 0, 0, 0, 1, 1,
0.1428469, -0.4527795, 2.485337, 0, 0, 0, 1, 1,
0.1498669, 1.256192, -0.4633299, 0, 0, 0, 1, 1,
0.1502599, -0.1561413, 0.4374966, 0, 0, 0, 1, 1,
0.1513481, -0.125219, 3.104875, 0, 0, 0, 1, 1,
0.1516534, -0.5560991, 3.818924, 0, 0, 0, 1, 1,
0.1526738, -1.242543, 1.867832, 0, 0, 0, 1, 1,
0.1537376, -0.4053884, 3.72549, 1, 1, 1, 1, 1,
0.1573572, -1.412311, 4.987117, 1, 1, 1, 1, 1,
0.1583067, 2.146977, -0.2334469, 1, 1, 1, 1, 1,
0.1583267, 0.804493, -0.6200902, 1, 1, 1, 1, 1,
0.1653965, 0.3088027, -0.5620985, 1, 1, 1, 1, 1,
0.1696681, -0.9532385, 2.98312, 1, 1, 1, 1, 1,
0.1704246, 0.4265516, 0.2470993, 1, 1, 1, 1, 1,
0.1706438, -0.07730526, 3.200101, 1, 1, 1, 1, 1,
0.1727085, 1.117749, -0.9687573, 1, 1, 1, 1, 1,
0.1759315, 0.1525528, 1.316895, 1, 1, 1, 1, 1,
0.1766481, -1.11283, 4.005734, 1, 1, 1, 1, 1,
0.1811108, 1.342434, -0.5501444, 1, 1, 1, 1, 1,
0.1814065, 0.119356, 2.334228, 1, 1, 1, 1, 1,
0.1825161, 1.853904, 0.2889506, 1, 1, 1, 1, 1,
0.1836065, -0.42514, 2.988206, 1, 1, 1, 1, 1,
0.188251, -0.5596396, 2.889118, 0, 0, 1, 1, 1,
0.1900625, 1.394255, 0.7895179, 1, 0, 0, 1, 1,
0.1940593, 0.9760771, -0.009309025, 1, 0, 0, 1, 1,
0.1963394, 0.7355056, -0.640188, 1, 0, 0, 1, 1,
0.1982233, 0.06777177, 0.03377875, 1, 0, 0, 1, 1,
0.1990618, -1.960431, 1.146057, 1, 0, 0, 1, 1,
0.2041054, 2.593769, 0.8008942, 0, 0, 0, 1, 1,
0.2052935, -1.000208, 2.247412, 0, 0, 0, 1, 1,
0.2059794, -0.9635529, 2.239485, 0, 0, 0, 1, 1,
0.2147898, 0.4522843, -1.743741, 0, 0, 0, 1, 1,
0.2155865, -1.012219, 3.57073, 0, 0, 0, 1, 1,
0.2198554, -0.1488006, 1.026066, 0, 0, 0, 1, 1,
0.2201124, -1.066575, 3.778604, 0, 0, 0, 1, 1,
0.2211849, -1.2831, 3.492432, 1, 1, 1, 1, 1,
0.2272089, -1.61632, 3.334532, 1, 1, 1, 1, 1,
0.2323191, -1.14105, 3.423545, 1, 1, 1, 1, 1,
0.2326045, -0.5565547, 1.605281, 1, 1, 1, 1, 1,
0.2476062, 0.7079294, 1.043911, 1, 1, 1, 1, 1,
0.2485969, -0.02906225, 1.921741, 1, 1, 1, 1, 1,
0.2518378, -0.3671222, 1.839085, 1, 1, 1, 1, 1,
0.2550792, -0.5707971, 2.283842, 1, 1, 1, 1, 1,
0.260611, 0.4846979, 0.3149582, 1, 1, 1, 1, 1,
0.2634212, -1.022756, 2.042812, 1, 1, 1, 1, 1,
0.2662412, -1.258682, 5.557222, 1, 1, 1, 1, 1,
0.2683259, -3.189015, 3.197457, 1, 1, 1, 1, 1,
0.2714568, 0.385246, 0.2115743, 1, 1, 1, 1, 1,
0.2724785, 1.549244, -0.2749044, 1, 1, 1, 1, 1,
0.2735174, 0.4838219, -0.3644312, 1, 1, 1, 1, 1,
0.2747665, -0.4737104, 4.542152, 0, 0, 1, 1, 1,
0.2778319, 1.757124, 1.221854, 1, 0, 0, 1, 1,
0.2782018, -1.300333, 4.326506, 1, 0, 0, 1, 1,
0.2788462, -0.867321, 3.253351, 1, 0, 0, 1, 1,
0.2809716, -0.876031, 2.83987, 1, 0, 0, 1, 1,
0.2871542, -0.7194729, 3.996009, 1, 0, 0, 1, 1,
0.2881265, -0.586989, 0.4537014, 0, 0, 0, 1, 1,
0.2898328, 0.3108931, 0.9433272, 0, 0, 0, 1, 1,
0.2981284, -2.218525, 3.610129, 0, 0, 0, 1, 1,
0.3018497, 1.523293, 0.4433417, 0, 0, 0, 1, 1,
0.3083292, -1.17542, 3.090228, 0, 0, 0, 1, 1,
0.3099143, 0.4845155, 0.534202, 0, 0, 0, 1, 1,
0.3117421, 0.7836593, 0.425584, 0, 0, 0, 1, 1,
0.3152395, -2.249422, 3.078981, 1, 1, 1, 1, 1,
0.3198703, -1.00045, 4.087057, 1, 1, 1, 1, 1,
0.3228707, -0.5806731, 1.767674, 1, 1, 1, 1, 1,
0.3332986, 1.379217, -0.48451, 1, 1, 1, 1, 1,
0.336051, 1.113072, 1.352886, 1, 1, 1, 1, 1,
0.3375463, 0.412308, 2.357683, 1, 1, 1, 1, 1,
0.3450257, 0.3269404, 0.09549706, 1, 1, 1, 1, 1,
0.3467861, 1.37564, -0.4049667, 1, 1, 1, 1, 1,
0.3487716, -0.4160438, 2.929103, 1, 1, 1, 1, 1,
0.3487774, -0.5761536, 3.801707, 1, 1, 1, 1, 1,
0.3555225, -1.412024, 4.38412, 1, 1, 1, 1, 1,
0.3559684, 0.880894, 0.9497195, 1, 1, 1, 1, 1,
0.3591978, 0.7777306, -0.09421292, 1, 1, 1, 1, 1,
0.36654, 0.9499886, 1.802053, 1, 1, 1, 1, 1,
0.3676204, -0.1342039, 1.897619, 1, 1, 1, 1, 1,
0.3790298, 0.5168283, 2.476087, 0, 0, 1, 1, 1,
0.3795947, -0.8796517, 3.168147, 1, 0, 0, 1, 1,
0.3814641, -1.224536, 1.850155, 1, 0, 0, 1, 1,
0.3840835, 0.6937471, 0.6679586, 1, 0, 0, 1, 1,
0.3861375, -0.2855237, 4.416786, 1, 0, 0, 1, 1,
0.3898771, 0.4547134, -0.06465416, 1, 0, 0, 1, 1,
0.3977538, -0.1964068, 1.417825, 0, 0, 0, 1, 1,
0.4029999, -0.1344778, 1.372412, 0, 0, 0, 1, 1,
0.4062095, -1.175738, 1.177106, 0, 0, 0, 1, 1,
0.4179033, 0.3369043, -0.1586194, 0, 0, 0, 1, 1,
0.425947, 1.086386, 0.9237919, 0, 0, 0, 1, 1,
0.4295717, 1.145144, -0.07775935, 0, 0, 0, 1, 1,
0.4306368, -0.1483986, -0.2126045, 0, 0, 0, 1, 1,
0.4349327, 0.1152175, 0.9637296, 1, 1, 1, 1, 1,
0.4351373, -0.5567319, 2.272828, 1, 1, 1, 1, 1,
0.4397349, 0.8344869, 0.8793612, 1, 1, 1, 1, 1,
0.441854, 0.9012899, 0.7062633, 1, 1, 1, 1, 1,
0.4422047, -0.4025597, 0.9776297, 1, 1, 1, 1, 1,
0.4468784, 1.317489, 1.957152, 1, 1, 1, 1, 1,
0.4470409, -0.2549149, 2.771796, 1, 1, 1, 1, 1,
0.4491332, 0.3970965, 0.08890649, 1, 1, 1, 1, 1,
0.450662, -0.7453979, 3.14807, 1, 1, 1, 1, 1,
0.4507094, -1.663812, 1.322005, 1, 1, 1, 1, 1,
0.4576081, 0.3534829, 1.107833, 1, 1, 1, 1, 1,
0.45792, -0.7216015, 3.685145, 1, 1, 1, 1, 1,
0.4656136, 0.3927644, 2.168534, 1, 1, 1, 1, 1,
0.4723501, 1.623939, 1.009607, 1, 1, 1, 1, 1,
0.4801039, -0.03634837, 1.161165, 1, 1, 1, 1, 1,
0.4870307, -1.987963, 3.408769, 0, 0, 1, 1, 1,
0.487626, 1.15816, 1.088185, 1, 0, 0, 1, 1,
0.4880634, 1.518158, -0.6655203, 1, 0, 0, 1, 1,
0.4885339, -0.9189196, 1.373898, 1, 0, 0, 1, 1,
0.4887468, 0.5858974, 0.217828, 1, 0, 0, 1, 1,
0.4923363, -1.104201, 3.566022, 1, 0, 0, 1, 1,
0.4950036, 0.03646892, 1.566323, 0, 0, 0, 1, 1,
0.5010815, 0.42187, 3.186301, 0, 0, 0, 1, 1,
0.5019329, -0.7667051, 1.921431, 0, 0, 0, 1, 1,
0.5025378, 0.2850093, -0.299734, 0, 0, 0, 1, 1,
0.5064924, -0.3362664, -0.1103473, 0, 0, 0, 1, 1,
0.5072277, 0.1123799, 1.180155, 0, 0, 0, 1, 1,
0.5163966, -0.1962017, 0.4930016, 0, 0, 0, 1, 1,
0.5200662, 1.111345, 0.2095375, 1, 1, 1, 1, 1,
0.5217174, -1.369844, 2.896042, 1, 1, 1, 1, 1,
0.5240246, 1.74791, -0.1282846, 1, 1, 1, 1, 1,
0.5285431, 0.9721645, -0.6743832, 1, 1, 1, 1, 1,
0.5317462, -0.04526671, 0.7165166, 1, 1, 1, 1, 1,
0.5347424, -0.1234117, 0.8181435, 1, 1, 1, 1, 1,
0.5360489, -0.8621095, 3.633491, 1, 1, 1, 1, 1,
0.5371963, 1.860315, -0.3554217, 1, 1, 1, 1, 1,
0.5375212, -0.08361563, 2.181398, 1, 1, 1, 1, 1,
0.5446381, 0.3401714, 0.7646868, 1, 1, 1, 1, 1,
0.5494351, -1.611163, 3.633619, 1, 1, 1, 1, 1,
0.5529726, -0.5704765, 3.03754, 1, 1, 1, 1, 1,
0.5536565, 0.349409, -1.456445, 1, 1, 1, 1, 1,
0.5547752, 0.05935897, 1.338598, 1, 1, 1, 1, 1,
0.556282, -1.629903, 4.79246, 1, 1, 1, 1, 1,
0.5566059, -0.2456698, 1.15712, 0, 0, 1, 1, 1,
0.5568441, 0.4645759, -0.3393377, 1, 0, 0, 1, 1,
0.5573996, 0.6398252, 0.7855619, 1, 0, 0, 1, 1,
0.5630558, -0.8261008, 2.77697, 1, 0, 0, 1, 1,
0.5630756, 0.49058, 1.979176, 1, 0, 0, 1, 1,
0.5720793, 0.9234774, 0.5958747, 1, 0, 0, 1, 1,
0.5727433, 0.7602649, 1.245045, 0, 0, 0, 1, 1,
0.5752547, -1.748966, 3.889183, 0, 0, 0, 1, 1,
0.5781903, -0.3335642, 1.277651, 0, 0, 0, 1, 1,
0.5792735, 0.1340035, 0.8589786, 0, 0, 0, 1, 1,
0.5827624, 1.206744, 1.072603, 0, 0, 0, 1, 1,
0.5920194, 1.148061, -0.6532021, 0, 0, 0, 1, 1,
0.5965932, -0.7042453, 3.272623, 0, 0, 0, 1, 1,
0.5974071, 1.276137, 1.579382, 1, 1, 1, 1, 1,
0.6017253, 0.02740952, 2.548213, 1, 1, 1, 1, 1,
0.6024785, -0.3202209, 1.583104, 1, 1, 1, 1, 1,
0.6093796, -0.558494, 3.913474, 1, 1, 1, 1, 1,
0.6202858, 1.563188, 0.6916884, 1, 1, 1, 1, 1,
0.6206044, -1.594289, 4.485119, 1, 1, 1, 1, 1,
0.6209562, -2.931818, 2.337226, 1, 1, 1, 1, 1,
0.6244271, -0.4993704, 1.978582, 1, 1, 1, 1, 1,
0.6308689, -0.3919296, 0.9443868, 1, 1, 1, 1, 1,
0.6345949, 1.49065, -0.3596056, 1, 1, 1, 1, 1,
0.6352795, -0.8851595, 1.501114, 1, 1, 1, 1, 1,
0.6375211, -0.1634028, 2.845654, 1, 1, 1, 1, 1,
0.6433295, -0.1180773, 1.214103, 1, 1, 1, 1, 1,
0.6441455, 0.8808491, 0.2341814, 1, 1, 1, 1, 1,
0.6442701, 0.3671637, 0.5620477, 1, 1, 1, 1, 1,
0.6463779, -0.6974635, 1.916369, 0, 0, 1, 1, 1,
0.6496919, 0.1917042, 2.052455, 1, 0, 0, 1, 1,
0.6613665, -1.359692, 4.532434, 1, 0, 0, 1, 1,
0.6644303, 1.460171, 0.8928264, 1, 0, 0, 1, 1,
0.666113, -1.58189, 1.872206, 1, 0, 0, 1, 1,
0.6666018, 0.5181343, -0.8272031, 1, 0, 0, 1, 1,
0.6689196, 1.014301, 0.8292039, 0, 0, 0, 1, 1,
0.6746675, -0.2861255, 0.7479654, 0, 0, 0, 1, 1,
0.6807458, -1.212857, 1.547514, 0, 0, 0, 1, 1,
0.6873788, -1.820466, 3.615844, 0, 0, 0, 1, 1,
0.6907726, 0.8601808, 0.2227864, 0, 0, 0, 1, 1,
0.6938265, 0.9461094, 0.8694081, 0, 0, 0, 1, 1,
0.6963167, -0.11756, 1.619995, 0, 0, 0, 1, 1,
0.6982684, 1.165346, 0.2180014, 1, 1, 1, 1, 1,
0.6986511, -0.782566, 1.525139, 1, 1, 1, 1, 1,
0.70226, -2.319787, 2.102211, 1, 1, 1, 1, 1,
0.719505, 0.228753, 2.508918, 1, 1, 1, 1, 1,
0.7212825, -0.8620821, 3.649769, 1, 1, 1, 1, 1,
0.730087, 0.5731374, 0.5149953, 1, 1, 1, 1, 1,
0.7343051, 0.3521678, 2.631684, 1, 1, 1, 1, 1,
0.741205, -0.854014, 4.996985, 1, 1, 1, 1, 1,
0.7444692, 0.08839036, 1.599799, 1, 1, 1, 1, 1,
0.7559059, 1.474766, 0.1782481, 1, 1, 1, 1, 1,
0.7592112, 1.520581, 0.4341697, 1, 1, 1, 1, 1,
0.761197, 0.1661497, 0.1480374, 1, 1, 1, 1, 1,
0.7614437, -0.3129815, 2.619464, 1, 1, 1, 1, 1,
0.7629206, -0.477511, 1.17341, 1, 1, 1, 1, 1,
0.7685095, 0.2687113, 0.9058521, 1, 1, 1, 1, 1,
0.7703435, -0.4831338, 3.325744, 0, 0, 1, 1, 1,
0.7703891, 0.6256973, 0.6048264, 1, 0, 0, 1, 1,
0.7710096, 0.6631464, 2.733206, 1, 0, 0, 1, 1,
0.7735662, -0.7896449, 2.440172, 1, 0, 0, 1, 1,
0.7803861, -0.3217853, 2.11109, 1, 0, 0, 1, 1,
0.783703, 0.08153497, 1.930019, 1, 0, 0, 1, 1,
0.7842964, 0.5354878, 0.214549, 0, 0, 0, 1, 1,
0.786401, -0.7905123, 2.836671, 0, 0, 0, 1, 1,
0.7956278, 1.771751, 1.005461, 0, 0, 0, 1, 1,
0.7979221, -0.5810552, 2.448468, 0, 0, 0, 1, 1,
0.8001111, -1.469259, 3.904632, 0, 0, 0, 1, 1,
0.800597, -0.9786943, 1.691523, 0, 0, 0, 1, 1,
0.8006683, 0.6623124, 1.865056, 0, 0, 0, 1, 1,
0.8018503, 0.2731077, 2.652296, 1, 1, 1, 1, 1,
0.801966, -0.432921, 4.398106, 1, 1, 1, 1, 1,
0.8032991, -0.7111322, 1.146503, 1, 1, 1, 1, 1,
0.8042935, 2.872223, 0.7091959, 1, 1, 1, 1, 1,
0.812208, -0.8100141, 2.260785, 1, 1, 1, 1, 1,
0.8188404, -1.135263, 2.840441, 1, 1, 1, 1, 1,
0.8240874, -1.051911, 2.421168, 1, 1, 1, 1, 1,
0.8255333, 0.7583349, -1.455299, 1, 1, 1, 1, 1,
0.8295547, 0.09272207, 2.051035, 1, 1, 1, 1, 1,
0.8366021, -0.5790751, 3.010215, 1, 1, 1, 1, 1,
0.8373031, -0.06071602, 1.333775, 1, 1, 1, 1, 1,
0.8531852, 1.042089, 0.9076756, 1, 1, 1, 1, 1,
0.8665758, -1.352516, -0.3573805, 1, 1, 1, 1, 1,
0.86743, 1.496877, -1.29386, 1, 1, 1, 1, 1,
0.8693851, -0.639599, 1.510488, 1, 1, 1, 1, 1,
0.8759882, -1.013193, 1.389479, 0, 0, 1, 1, 1,
0.8781204, -0.4558882, 2.133164, 1, 0, 0, 1, 1,
0.8824201, 0.6176853, 0.455025, 1, 0, 0, 1, 1,
0.8872889, -1.66394, 4.0216, 1, 0, 0, 1, 1,
0.891162, 0.3621168, 1.701695, 1, 0, 0, 1, 1,
0.8975449, -0.34163, 1.38234, 1, 0, 0, 1, 1,
0.9061897, -2.613304, 2.708455, 0, 0, 0, 1, 1,
0.9083518, -1.318251, 3.609245, 0, 0, 0, 1, 1,
0.9126824, -0.2719673, 1.065197, 0, 0, 0, 1, 1,
0.9140939, 1.164381, 0.9912146, 0, 0, 0, 1, 1,
0.9151101, -1.464187, 2.83866, 0, 0, 0, 1, 1,
0.915241, -1.851237, 3.607988, 0, 0, 0, 1, 1,
0.9170222, -1.31606, 2.495011, 0, 0, 0, 1, 1,
0.9215292, 0.5917768, -0.0257153, 1, 1, 1, 1, 1,
0.9261518, 0.627443, -1.230205, 1, 1, 1, 1, 1,
0.9272526, 0.3340504, 2.925841, 1, 1, 1, 1, 1,
0.9298812, 0.6369871, 1.225754, 1, 1, 1, 1, 1,
0.9475037, -0.551847, 1.460612, 1, 1, 1, 1, 1,
0.9504195, 0.5410607, -0.4796177, 1, 1, 1, 1, 1,
0.9512075, 2.055495, 1.323871, 1, 1, 1, 1, 1,
0.9528551, -1.370837, 2.323437, 1, 1, 1, 1, 1,
0.958486, -0.1913897, 0.5857391, 1, 1, 1, 1, 1,
0.9618536, 0.06692678, 1.566836, 1, 1, 1, 1, 1,
0.968019, 1.733077, 0.9842898, 1, 1, 1, 1, 1,
0.9746835, 0.1268491, 1.207052, 1, 1, 1, 1, 1,
0.9755215, -1.084066, 1.620545, 1, 1, 1, 1, 1,
0.9772083, -0.7425994, 1.880814, 1, 1, 1, 1, 1,
0.9805011, 1.363218, 2.797816, 1, 1, 1, 1, 1,
0.9928693, 0.8146129, 2.061947, 0, 0, 1, 1, 1,
1.000242, 1.60349, -0.3659901, 1, 0, 0, 1, 1,
1.001184, 0.7388753, 0.2832516, 1, 0, 0, 1, 1,
1.003445, 0.8650845, 0.301838, 1, 0, 0, 1, 1,
1.004613, -0.006776796, 1.96635, 1, 0, 0, 1, 1,
1.007676, -1.399239, 3.20949, 1, 0, 0, 1, 1,
1.016159, 0.1973376, 0.08646173, 0, 0, 0, 1, 1,
1.017964, -0.05727089, -0.3741419, 0, 0, 0, 1, 1,
1.022281, 0.7527949, 2.360126, 0, 0, 0, 1, 1,
1.025831, 0.8939081, 2.420701, 0, 0, 0, 1, 1,
1.035229, -0.3441966, 2.359563, 0, 0, 0, 1, 1,
1.036691, -0.6818783, 2.875451, 0, 0, 0, 1, 1,
1.045792, 0.296667, 0.3486325, 0, 0, 0, 1, 1,
1.048301, 0.8901964, 0.1740567, 1, 1, 1, 1, 1,
1.054196, 0.1556387, 1.395577, 1, 1, 1, 1, 1,
1.055086, 0.0539557, 1.716402, 1, 1, 1, 1, 1,
1.058543, -0.9123572, 4.377812, 1, 1, 1, 1, 1,
1.060252, -0.01894814, 0.8118178, 1, 1, 1, 1, 1,
1.067799, 1.218626, 0.4278216, 1, 1, 1, 1, 1,
1.073324, -0.04495666, 3.393291, 1, 1, 1, 1, 1,
1.075578, -0.3632075, 1.787867, 1, 1, 1, 1, 1,
1.080746, 1.92865, 0.1409936, 1, 1, 1, 1, 1,
1.081366, -1.079665, 3.609366, 1, 1, 1, 1, 1,
1.081461, 0.1888631, 2.081261, 1, 1, 1, 1, 1,
1.081701, 0.6622398, -0.1916716, 1, 1, 1, 1, 1,
1.088995, -0.3507195, 0.6226484, 1, 1, 1, 1, 1,
1.090229, 0.5408497, 2.198187, 1, 1, 1, 1, 1,
1.098282, -0.2991986, 3.198638, 1, 1, 1, 1, 1,
1.101853, 0.1165515, 0.09562372, 0, 0, 1, 1, 1,
1.113892, 0.4619965, 1.552897, 1, 0, 0, 1, 1,
1.113958, -1.610462, 1.282113, 1, 0, 0, 1, 1,
1.125087, -0.8038462, 1.887591, 1, 0, 0, 1, 1,
1.127764, -0.5962726, 2.98053, 1, 0, 0, 1, 1,
1.128376, -0.2112111, 2.675578, 1, 0, 0, 1, 1,
1.131977, -0.1395467, 1.358104, 0, 0, 0, 1, 1,
1.139218, 0.4177414, 0.06475244, 0, 0, 0, 1, 1,
1.146013, -0.5182122, 2.643781, 0, 0, 0, 1, 1,
1.146805, -0.7210094, 2.056969, 0, 0, 0, 1, 1,
1.156066, 0.3824503, 0.180352, 0, 0, 0, 1, 1,
1.15936, -0.1704051, 2.003834, 0, 0, 0, 1, 1,
1.164106, 1.858867, 0.6350348, 0, 0, 0, 1, 1,
1.164309, 0.2867359, 2.118206, 1, 1, 1, 1, 1,
1.168428, -0.4350335, 3.500424, 1, 1, 1, 1, 1,
1.169957, -0.8614092, 0.6999797, 1, 1, 1, 1, 1,
1.171465, 0.008863271, 0.9742875, 1, 1, 1, 1, 1,
1.175161, 0.4535386, 2.132414, 1, 1, 1, 1, 1,
1.183228, 0.596535, 1.653295, 1, 1, 1, 1, 1,
1.183408, -1.249458, 3.620294, 1, 1, 1, 1, 1,
1.184469, 0.5150732, 0.6183219, 1, 1, 1, 1, 1,
1.189567, 1.204626, 0.6286713, 1, 1, 1, 1, 1,
1.207153, -1.494012, 3.490793, 1, 1, 1, 1, 1,
1.209169, 0.6716381, 0.1075108, 1, 1, 1, 1, 1,
1.211745, 0.8135546, 0.7428494, 1, 1, 1, 1, 1,
1.231246, 1.187038, -0.9525341, 1, 1, 1, 1, 1,
1.242744, -0.438982, 2.814759, 1, 1, 1, 1, 1,
1.245308, -0.1880679, 1.666154, 1, 1, 1, 1, 1,
1.254332, 0.9956168, 1.156054, 0, 0, 1, 1, 1,
1.264485, -0.7265067, 2.370339, 1, 0, 0, 1, 1,
1.270167, -2.364132, 2.114512, 1, 0, 0, 1, 1,
1.277457, -0.6146096, 1.334845, 1, 0, 0, 1, 1,
1.280688, 0.3338827, 1.95064, 1, 0, 0, 1, 1,
1.293725, -2.481724, 3.776442, 1, 0, 0, 1, 1,
1.318022, -1.837413, 1.60415, 0, 0, 0, 1, 1,
1.318369, -0.4737991, 0.5874144, 0, 0, 0, 1, 1,
1.326104, -0.1433769, 2.080735, 0, 0, 0, 1, 1,
1.334662, -0.7527806, 1.591784, 0, 0, 0, 1, 1,
1.342612, -0.31399, 1.348504, 0, 0, 0, 1, 1,
1.344708, 0.3575526, 1.413517, 0, 0, 0, 1, 1,
1.344763, 0.7662463, 1.857067, 0, 0, 0, 1, 1,
1.344992, -0.07608235, 1.767588, 1, 1, 1, 1, 1,
1.35451, 1.336043, 0.6146446, 1, 1, 1, 1, 1,
1.357167, -0.4713681, 2.099928, 1, 1, 1, 1, 1,
1.371493, 0.9927744, 2.551432, 1, 1, 1, 1, 1,
1.37271, -0.7438827, 3.081377, 1, 1, 1, 1, 1,
1.374949, -0.1980818, 3.261562, 1, 1, 1, 1, 1,
1.375268, -0.8542952, 0.04490267, 1, 1, 1, 1, 1,
1.380957, -0.9154456, 2.644908, 1, 1, 1, 1, 1,
1.381027, 0.4201009, 0.8175039, 1, 1, 1, 1, 1,
1.386134, 0.4685169, 1.737986, 1, 1, 1, 1, 1,
1.392509, 0.8530895, -0.03759812, 1, 1, 1, 1, 1,
1.409723, 0.139654, 0.7989051, 1, 1, 1, 1, 1,
1.414962, -0.8191723, 2.514074, 1, 1, 1, 1, 1,
1.416441, 1.326972, 1.012684, 1, 1, 1, 1, 1,
1.42023, -1.337512, 3.607622, 1, 1, 1, 1, 1,
1.428747, -1.051461, 2.412995, 0, 0, 1, 1, 1,
1.43201, -0.05217284, 0.5712945, 1, 0, 0, 1, 1,
1.444784, 0.1191177, 0.5856433, 1, 0, 0, 1, 1,
1.44805, -0.6025649, 2.204, 1, 0, 0, 1, 1,
1.450575, -0.2254564, 1.822829, 1, 0, 0, 1, 1,
1.470579, 0.5465205, -0.4979095, 1, 0, 0, 1, 1,
1.47157, -0.8609869, 2.234336, 0, 0, 0, 1, 1,
1.473749, -0.2112149, 0.170764, 0, 0, 0, 1, 1,
1.477863, -0.9048998, 2.168581, 0, 0, 0, 1, 1,
1.484717, 0.4883935, 1.940707, 0, 0, 0, 1, 1,
1.495785, -0.4283146, 3.109648, 0, 0, 0, 1, 1,
1.503222, 1.019985, -0.4217203, 0, 0, 0, 1, 1,
1.509394, -0.4715835, 1.746566, 0, 0, 0, 1, 1,
1.522829, 1.0663, 0.2152585, 1, 1, 1, 1, 1,
1.528129, -0.8142682, 2.488551, 1, 1, 1, 1, 1,
1.534942, -0.9500583, 1.618897, 1, 1, 1, 1, 1,
1.551099, 2.112171, 1.080019, 1, 1, 1, 1, 1,
1.562262, -0.781089, 2.86711, 1, 1, 1, 1, 1,
1.564047, -3.680904, 4.071033, 1, 1, 1, 1, 1,
1.573992, 0.3912864, 1.084305, 1, 1, 1, 1, 1,
1.580041, -1.819489, 2.487816, 1, 1, 1, 1, 1,
1.60113, -0.8369036, 3.084396, 1, 1, 1, 1, 1,
1.601274, 0.4975803, 1.512965, 1, 1, 1, 1, 1,
1.605293, -0.2853522, 3.232426, 1, 1, 1, 1, 1,
1.613807, -0.7855802, 0.1728883, 1, 1, 1, 1, 1,
1.617, -0.7213603, 3.588292, 1, 1, 1, 1, 1,
1.620553, 0.7385173, -0.5790477, 1, 1, 1, 1, 1,
1.653478, -0.7476113, 2.426115, 1, 1, 1, 1, 1,
1.66957, -0.5919455, 1.702139, 0, 0, 1, 1, 1,
1.682008, -1.899166, 1.452365, 1, 0, 0, 1, 1,
1.690553, -1.99261, 2.379065, 1, 0, 0, 1, 1,
1.69612, 0.4762, 1.879445, 1, 0, 0, 1, 1,
1.702028, -0.2920582, 1.536806, 1, 0, 0, 1, 1,
1.716056, 1.033854, 0.3609882, 1, 0, 0, 1, 1,
1.73216, -0.5389546, 2.805648, 0, 0, 0, 1, 1,
1.744766, -0.5781245, 0.6878065, 0, 0, 0, 1, 1,
1.747664, -1.885194, 3.219132, 0, 0, 0, 1, 1,
1.749141, 1.150875, -0.6340355, 0, 0, 0, 1, 1,
1.769479, 1.660297, 0.3701971, 0, 0, 0, 1, 1,
1.807209, 1.367044, 3.111938, 0, 0, 0, 1, 1,
1.863698, -1.873509, 2.811948, 0, 0, 0, 1, 1,
1.891632, 1.425184, 1.484499, 1, 1, 1, 1, 1,
1.895777, 1.27646, -0.6649106, 1, 1, 1, 1, 1,
1.916555, -0.6651108, 2.345191, 1, 1, 1, 1, 1,
1.936515, -1.205606, 2.051435, 1, 1, 1, 1, 1,
1.984654, -0.298652, 1.413034, 1, 1, 1, 1, 1,
2.001497, 0.003852916, 0.5406094, 1, 1, 1, 1, 1,
2.025787, 0.6406435, 0.6316848, 1, 1, 1, 1, 1,
2.02963, 0.9181513, 0.9608452, 1, 1, 1, 1, 1,
2.03766, -0.712145, 0.9373714, 1, 1, 1, 1, 1,
2.045375, 0.3011573, 1.607858, 1, 1, 1, 1, 1,
2.062409, 1.54307, 0.2535615, 1, 1, 1, 1, 1,
2.067428, 0.7413529, 1.850316, 1, 1, 1, 1, 1,
2.071648, -0.6235719, 2.423945, 1, 1, 1, 1, 1,
2.090602, 0.9769099, 1.107069, 1, 1, 1, 1, 1,
2.130249, -0.3792223, 3.218476, 1, 1, 1, 1, 1,
2.149215, -0.895015, 3.301022, 0, 0, 1, 1, 1,
2.163501, -1.054042, 2.290268, 1, 0, 0, 1, 1,
2.212158, -0.7967913, 1.131038, 1, 0, 0, 1, 1,
2.214269, -0.06622685, 1.215752, 1, 0, 0, 1, 1,
2.240869, 0.1114422, 3.501395, 1, 0, 0, 1, 1,
2.276223, 0.08642934, 1.979519, 1, 0, 0, 1, 1,
2.415642, 1.939051, 2.141312, 0, 0, 0, 1, 1,
2.428908, 1.619234, 2.262175, 0, 0, 0, 1, 1,
2.490193, -0.283438, 1.095616, 0, 0, 0, 1, 1,
2.502137, -1.208733, 3.775718, 0, 0, 0, 1, 1,
2.552153, 0.7422857, 1.322286, 0, 0, 0, 1, 1,
2.553773, -0.7060406, 1.889209, 0, 0, 0, 1, 1,
2.603994, 0.2132888, 1.454363, 0, 0, 0, 1, 1,
2.624652, 0.3627476, 1.094354, 1, 1, 1, 1, 1,
2.937443, 0.8474175, 1.498826, 1, 1, 1, 1, 1,
2.977621, 0.5837083, -0.6569771, 1, 1, 1, 1, 1,
3.029204, 1.397368, 1.689701, 1, 1, 1, 1, 1,
3.18188, 0.7564717, -0.07512101, 1, 1, 1, 1, 1,
3.214951, 0.767774, 1.150905, 1, 1, 1, 1, 1,
3.611683, -1.536125, 1.326808, 1, 1, 1, 1, 1
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
var radius = 9.907288;
var distance = 34.79893;
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
mvMatrix.translate( 0.2714159, 0.322475, -0.3702407 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.79893);
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
