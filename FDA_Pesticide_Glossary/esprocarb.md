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
-3.633077, 0.3186736, -0.3421291, 1, 0, 0, 1,
-3.257478, -0.001191123, -2.577806, 1, 0.007843138, 0, 1,
-2.944495, -1.148202, -1.584898, 1, 0.01176471, 0, 1,
-2.582566, -0.2000975, -3.369415, 1, 0.01960784, 0, 1,
-2.525044, 0.450674, -1.284446, 1, 0.02352941, 0, 1,
-2.499292, 1.449419, -0.6343153, 1, 0.03137255, 0, 1,
-2.395462, 0.1491885, -1.042875, 1, 0.03529412, 0, 1,
-2.342763, 0.189185, 0.7841836, 1, 0.04313726, 0, 1,
-2.32882, -0.5655996, -2.00337, 1, 0.04705882, 0, 1,
-2.322941, -0.476561, -3.305059, 1, 0.05490196, 0, 1,
-2.225537, 1.344948, 0.2685311, 1, 0.05882353, 0, 1,
-2.208705, 0.2932283, -1.441756, 1, 0.06666667, 0, 1,
-2.185033, 0.03567656, -3.154047, 1, 0.07058824, 0, 1,
-2.182944, -0.2626456, -2.159067, 1, 0.07843138, 0, 1,
-2.149739, 0.1529033, -1.084193, 1, 0.08235294, 0, 1,
-2.147064, 0.578308, -0.0711353, 1, 0.09019608, 0, 1,
-2.112846, -0.6830699, -1.602613, 1, 0.09411765, 0, 1,
-2.103407, -0.09346327, -2.140152, 1, 0.1019608, 0, 1,
-2.090685, 0.08965771, -1.251432, 1, 0.1098039, 0, 1,
-2.080119, 0.09975342, -1.776188, 1, 0.1137255, 0, 1,
-2.072756, -1.078891, -0.440001, 1, 0.1215686, 0, 1,
-2.03989, 0.6177753, -0.4443767, 1, 0.1254902, 0, 1,
-2.024716, -0.09969964, -0.957187, 1, 0.1333333, 0, 1,
-1.999825, -0.3011401, -2.105202, 1, 0.1372549, 0, 1,
-1.969208, 0.003598816, -1.344913, 1, 0.145098, 0, 1,
-1.940318, -1.343314, -2.310625, 1, 0.1490196, 0, 1,
-1.935698, -0.8008268, -1.657672, 1, 0.1568628, 0, 1,
-1.905159, 1.155894, -0.8123057, 1, 0.1607843, 0, 1,
-1.904445, 2.442934, -1.80502, 1, 0.1686275, 0, 1,
-1.883622, -1.341524, -4.061028, 1, 0.172549, 0, 1,
-1.871685, -2.250733, -1.575111, 1, 0.1803922, 0, 1,
-1.869976, -0.8962582, -1.903249, 1, 0.1843137, 0, 1,
-1.851506, 0.5847569, -1.045682, 1, 0.1921569, 0, 1,
-1.833056, 0.04220057, -2.783085, 1, 0.1960784, 0, 1,
-1.823243, -0.969804, -0.1440155, 1, 0.2039216, 0, 1,
-1.79642, 0.4572802, -1.493856, 1, 0.2117647, 0, 1,
-1.779777, 0.4486607, -1.049249, 1, 0.2156863, 0, 1,
-1.778149, 0.5782645, -0.4147256, 1, 0.2235294, 0, 1,
-1.77181, -0.4443327, -3.059149, 1, 0.227451, 0, 1,
-1.765111, -0.5676584, -2.161763, 1, 0.2352941, 0, 1,
-1.74403, 0.8570838, -0.810631, 1, 0.2392157, 0, 1,
-1.7367, -0.03372679, -2.0972, 1, 0.2470588, 0, 1,
-1.723086, -0.8323761, -1.986024, 1, 0.2509804, 0, 1,
-1.721208, 1.299622, -1.256156, 1, 0.2588235, 0, 1,
-1.714642, -1.350262, -2.23686, 1, 0.2627451, 0, 1,
-1.711417, 1.070659, -2.01363, 1, 0.2705882, 0, 1,
-1.707866, 1.726703, 0.2998143, 1, 0.2745098, 0, 1,
-1.703401, 2.021586, -1.937687, 1, 0.282353, 0, 1,
-1.697777, 0.1245409, -2.359946, 1, 0.2862745, 0, 1,
-1.682926, -1.321708, -2.338972, 1, 0.2941177, 0, 1,
-1.655818, -0.9167737, -4.008841, 1, 0.3019608, 0, 1,
-1.654352, 0.07285672, -2.101907, 1, 0.3058824, 0, 1,
-1.651408, 0.2347189, -1.12471, 1, 0.3137255, 0, 1,
-1.643207, 1.554185, -0.2996608, 1, 0.3176471, 0, 1,
-1.639459, 1.32594, -0.8977888, 1, 0.3254902, 0, 1,
-1.637656, -0.01905175, -0.3526664, 1, 0.3294118, 0, 1,
-1.608833, 0.3419422, -0.0004946752, 1, 0.3372549, 0, 1,
-1.606647, 0.154941, -1.951242, 1, 0.3411765, 0, 1,
-1.593198, -0.3817612, -1.950481, 1, 0.3490196, 0, 1,
-1.58758, 0.6917811, -0.7000577, 1, 0.3529412, 0, 1,
-1.572657, -2.014231, -1.687979, 1, 0.3607843, 0, 1,
-1.566232, -0.4267242, -1.043349, 1, 0.3647059, 0, 1,
-1.552561, 0.304556, -1.648795, 1, 0.372549, 0, 1,
-1.547821, 0.003127052, -0.5404912, 1, 0.3764706, 0, 1,
-1.530046, 1.075511, -0.0677185, 1, 0.3843137, 0, 1,
-1.522704, 0.4992529, -2.13867, 1, 0.3882353, 0, 1,
-1.519034, 0.02696285, -1.854805, 1, 0.3960784, 0, 1,
-1.51005, -1.212877, -1.545451, 1, 0.4039216, 0, 1,
-1.474154, 0.518604, 0.01123957, 1, 0.4078431, 0, 1,
-1.457924, -0.02726338, 0.2512755, 1, 0.4156863, 0, 1,
-1.453323, -0.8087826, -1.061162, 1, 0.4196078, 0, 1,
-1.44629, 0.3914498, -2.017512, 1, 0.427451, 0, 1,
-1.433446, -0.7878827, -1.448807, 1, 0.4313726, 0, 1,
-1.410553, -0.6931158, -1.334718, 1, 0.4392157, 0, 1,
-1.410253, -0.3937875, -1.778633, 1, 0.4431373, 0, 1,
-1.388422, 1.067141, -1.162264, 1, 0.4509804, 0, 1,
-1.387986, 0.4332559, -0.1742999, 1, 0.454902, 0, 1,
-1.38595, -0.3469158, -2.380514, 1, 0.4627451, 0, 1,
-1.383713, -2.151986, -3.658947, 1, 0.4666667, 0, 1,
-1.377975, -0.1351705, -0.8664816, 1, 0.4745098, 0, 1,
-1.374228, -0.561092, -1.938607, 1, 0.4784314, 0, 1,
-1.365794, -0.1968057, -3.063979, 1, 0.4862745, 0, 1,
-1.365451, 1.768241, -1.963187, 1, 0.4901961, 0, 1,
-1.365071, -1.40783, -3.571426, 1, 0.4980392, 0, 1,
-1.360282, -0.182122, -1.804695, 1, 0.5058824, 0, 1,
-1.35347, 0.03790093, -1.244966, 1, 0.509804, 0, 1,
-1.350898, 1.247758, -0.01015753, 1, 0.5176471, 0, 1,
-1.350407, 0.1118791, 0.09926471, 1, 0.5215687, 0, 1,
-1.336497, -0.4256034, -2.563809, 1, 0.5294118, 0, 1,
-1.333637, -1.053472, -1.108429, 1, 0.5333334, 0, 1,
-1.323337, -0.1768573, -0.7836269, 1, 0.5411765, 0, 1,
-1.321419, 0.1553949, -2.572598, 1, 0.5450981, 0, 1,
-1.319956, 0.7746296, -0.3340608, 1, 0.5529412, 0, 1,
-1.304369, -0.3798855, -5.120897, 1, 0.5568628, 0, 1,
-1.298873, -1.186928, -2.296341, 1, 0.5647059, 0, 1,
-1.295823, 1.656805, -1.000656, 1, 0.5686275, 0, 1,
-1.29575, -1.120666, -2.839261, 1, 0.5764706, 0, 1,
-1.294954, 0.9595707, -1.886506, 1, 0.5803922, 0, 1,
-1.292378, 0.7106781, -2.421443, 1, 0.5882353, 0, 1,
-1.286526, -1.518346, -3.092256, 1, 0.5921569, 0, 1,
-1.284618, -0.4821135, -1.179835, 1, 0.6, 0, 1,
-1.277131, -0.296895, -2.02649, 1, 0.6078432, 0, 1,
-1.272269, -1.816554, -3.889029, 1, 0.6117647, 0, 1,
-1.27126, 1.575214, -1.282041, 1, 0.6196079, 0, 1,
-1.269032, 0.2727137, -0.3615422, 1, 0.6235294, 0, 1,
-1.266755, -0.76718, -2.704805, 1, 0.6313726, 0, 1,
-1.250554, 0.4710065, -1.390755, 1, 0.6352941, 0, 1,
-1.243683, -0.1771109, -0.8621848, 1, 0.6431373, 0, 1,
-1.240211, 0.05778165, -3.315344, 1, 0.6470588, 0, 1,
-1.237557, -0.2618823, 0.6369295, 1, 0.654902, 0, 1,
-1.235163, 1.262034, -2.099297, 1, 0.6588235, 0, 1,
-1.231802, 1.152798, -0.1312268, 1, 0.6666667, 0, 1,
-1.225845, 0.7316689, -3.44329, 1, 0.6705883, 0, 1,
-1.22253, 0.09651589, -0.6418082, 1, 0.6784314, 0, 1,
-1.22249, 0.04646897, -0.08016294, 1, 0.682353, 0, 1,
-1.213411, 1.654778, -1.735069, 1, 0.6901961, 0, 1,
-1.212117, -0.09859479, -1.338155, 1, 0.6941177, 0, 1,
-1.210585, -0.7681628, -2.271214, 1, 0.7019608, 0, 1,
-1.207429, -0.4083003, -1.033342, 1, 0.7098039, 0, 1,
-1.201288, 0.8273972, -1.700399, 1, 0.7137255, 0, 1,
-1.201095, 1.335574, -1.327325, 1, 0.7215686, 0, 1,
-1.198048, -0.6238424, -1.114841, 1, 0.7254902, 0, 1,
-1.1881, -0.2494378, -1.485365, 1, 0.7333333, 0, 1,
-1.188015, -0.3846454, -2.141137, 1, 0.7372549, 0, 1,
-1.183635, -0.05869986, -2.188044, 1, 0.7450981, 0, 1,
-1.182531, -3.188954, -1.786608, 1, 0.7490196, 0, 1,
-1.176642, 2.929785, -0.9349687, 1, 0.7568628, 0, 1,
-1.175612, 0.5002045, 0.07531477, 1, 0.7607843, 0, 1,
-1.159399, -1.034738, -2.107293, 1, 0.7686275, 0, 1,
-1.153895, 0.2510564, -2.129345, 1, 0.772549, 0, 1,
-1.153047, -2.15594, -2.905051, 1, 0.7803922, 0, 1,
-1.151555, -2.01238, -3.502966, 1, 0.7843137, 0, 1,
-1.143544, -0.6314632, -2.714766, 1, 0.7921569, 0, 1,
-1.133514, 0.7107245, 0.6357033, 1, 0.7960784, 0, 1,
-1.132604, 0.4649033, -0.337896, 1, 0.8039216, 0, 1,
-1.129994, -0.02005049, -1.676922, 1, 0.8117647, 0, 1,
-1.124654, -0.2088508, -0.08361294, 1, 0.8156863, 0, 1,
-1.121394, 1.339191, 1.234123, 1, 0.8235294, 0, 1,
-1.114136, -1.417156, -3.41048, 1, 0.827451, 0, 1,
-1.113798, 0.5267513, -1.140874, 1, 0.8352941, 0, 1,
-1.11078, -0.1393366, -1.522308, 1, 0.8392157, 0, 1,
-1.109217, -1.468173, -2.96096, 1, 0.8470588, 0, 1,
-1.105211, -0.5745823, -0.3463525, 1, 0.8509804, 0, 1,
-1.102759, -2.377501, -4.337382, 1, 0.8588235, 0, 1,
-1.099831, -1.55228, -2.384617, 1, 0.8627451, 0, 1,
-1.09134, 1.25197, -0.6311194, 1, 0.8705882, 0, 1,
-1.082621, 0.03362802, -2.854006, 1, 0.8745098, 0, 1,
-1.077683, -0.1976985, -1.001129, 1, 0.8823529, 0, 1,
-1.075545, -1.285808, -3.046564, 1, 0.8862745, 0, 1,
-1.074303, 0.775626, -1.879394, 1, 0.8941177, 0, 1,
-1.071672, 0.2826129, -1.456651, 1, 0.8980392, 0, 1,
-1.066443, -1.794633, -1.169397, 1, 0.9058824, 0, 1,
-1.062353, -1.46815, -3.255675, 1, 0.9137255, 0, 1,
-1.060793, -0.0946487, -0.9831286, 1, 0.9176471, 0, 1,
-1.059644, 0.8161021, -1.134582, 1, 0.9254902, 0, 1,
-1.057524, -0.4474632, -0.9100382, 1, 0.9294118, 0, 1,
-1.05571, -1.18072, -1.54666, 1, 0.9372549, 0, 1,
-1.053511, 0.8621455, -2.093742, 1, 0.9411765, 0, 1,
-1.049069, 0.8091223, -1.632044, 1, 0.9490196, 0, 1,
-1.043343, 0.1269806, -1.87835, 1, 0.9529412, 0, 1,
-1.043261, 0.919939, -3.326349, 1, 0.9607843, 0, 1,
-1.032484, -0.2960297, -2.326452, 1, 0.9647059, 0, 1,
-1.029072, -0.6591189, -2.447578, 1, 0.972549, 0, 1,
-1.028196, 0.2856659, -3.224023, 1, 0.9764706, 0, 1,
-1.024547, -0.3493574, -0.6250817, 1, 0.9843137, 0, 1,
-1.023474, 0.30535, -0.6863366, 1, 0.9882353, 0, 1,
-1.013298, -0.107127, -1.210478, 1, 0.9960784, 0, 1,
-1.011266, -1.848493, -2.802364, 0.9960784, 1, 0, 1,
-1.010074, -0.7922408, -1.618406, 0.9921569, 1, 0, 1,
-0.9989756, 0.597959, -0.3541099, 0.9843137, 1, 0, 1,
-0.9980468, -1.541541, -2.27603, 0.9803922, 1, 0, 1,
-0.9969761, 0.07457023, 0.3467211, 0.972549, 1, 0, 1,
-0.9958706, 0.6956092, -1.704671, 0.9686275, 1, 0, 1,
-0.9920793, 2.474231, -0.200467, 0.9607843, 1, 0, 1,
-0.9901557, 0.6510123, -0.5344447, 0.9568627, 1, 0, 1,
-0.9890568, -2.959532, -5.506069, 0.9490196, 1, 0, 1,
-0.9867666, 0.539404, -2.248043, 0.945098, 1, 0, 1,
-0.9769436, -0.3313895, -2.427451, 0.9372549, 1, 0, 1,
-0.9755982, -0.09317077, -3.318651, 0.9333333, 1, 0, 1,
-0.9694516, 0.4608382, -2.285622, 0.9254902, 1, 0, 1,
-0.9685847, -0.4301875, -2.020552, 0.9215686, 1, 0, 1,
-0.9666714, -1.083269, -2.88139, 0.9137255, 1, 0, 1,
-0.9654589, 0.2177529, -0.8970736, 0.9098039, 1, 0, 1,
-0.9620606, -1.722267, -2.640129, 0.9019608, 1, 0, 1,
-0.9564115, 0.1697455, -0.03704815, 0.8941177, 1, 0, 1,
-0.9554942, 0.8300748, -0.2812292, 0.8901961, 1, 0, 1,
-0.9517593, 0.1392598, -0.9407481, 0.8823529, 1, 0, 1,
-0.9489446, 0.2763738, -0.6838868, 0.8784314, 1, 0, 1,
-0.9414575, -0.5911578, -3.227596, 0.8705882, 1, 0, 1,
-0.9385135, 1.67693, -2.942053, 0.8666667, 1, 0, 1,
-0.9243127, 0.3545274, 0.1803449, 0.8588235, 1, 0, 1,
-0.9170459, -0.3700504, -1.82681, 0.854902, 1, 0, 1,
-0.9166682, 0.07135892, -0.5840606, 0.8470588, 1, 0, 1,
-0.9142115, -0.1726271, -1.603427, 0.8431373, 1, 0, 1,
-0.9098816, 0.01729572, -2.308337, 0.8352941, 1, 0, 1,
-0.9061353, 0.9622929, 0.6685556, 0.8313726, 1, 0, 1,
-0.9053841, 0.9687184, 0.2152325, 0.8235294, 1, 0, 1,
-0.9017798, 0.3519212, -1.166633, 0.8196079, 1, 0, 1,
-0.899406, 0.8317062, -1.145924, 0.8117647, 1, 0, 1,
-0.8983266, -1.587086, -1.518157, 0.8078431, 1, 0, 1,
-0.8930117, -0.08460552, 0.1443568, 0.8, 1, 0, 1,
-0.8890471, -1.299466, -4.580843, 0.7921569, 1, 0, 1,
-0.8876044, -1.373164, -2.476068, 0.7882353, 1, 0, 1,
-0.8847444, 2.054337, -0.3103861, 0.7803922, 1, 0, 1,
-0.8823878, -0.2721858, -1.955496, 0.7764706, 1, 0, 1,
-0.8804923, -0.06171104, -1.386165, 0.7686275, 1, 0, 1,
-0.8782728, 0.02745121, 0.6853343, 0.7647059, 1, 0, 1,
-0.8758103, 0.9605597, -2.6887, 0.7568628, 1, 0, 1,
-0.8641865, -0.743068, -4.920075, 0.7529412, 1, 0, 1,
-0.8615581, 1.362455, -0.409804, 0.7450981, 1, 0, 1,
-0.8590627, 0.5376111, 1.120198, 0.7411765, 1, 0, 1,
-0.8568383, -0.03289965, -0.2849508, 0.7333333, 1, 0, 1,
-0.8560667, -0.5875301, -4.341081, 0.7294118, 1, 0, 1,
-0.8524467, -0.9676241, -3.195991, 0.7215686, 1, 0, 1,
-0.8523555, 0.5235285, -0.2189493, 0.7176471, 1, 0, 1,
-0.8489875, 0.3568715, -0.7458072, 0.7098039, 1, 0, 1,
-0.8466361, 2.17105, -1.260952, 0.7058824, 1, 0, 1,
-0.8446193, 0.07710817, -2.42602, 0.6980392, 1, 0, 1,
-0.8440303, -0.6508198, -3.175881, 0.6901961, 1, 0, 1,
-0.8327571, -0.982324, -2.265244, 0.6862745, 1, 0, 1,
-0.8222669, -0.922527, -2.749018, 0.6784314, 1, 0, 1,
-0.8158085, 0.5199991, -0.2289411, 0.6745098, 1, 0, 1,
-0.8135968, -1.35434, -1.134411, 0.6666667, 1, 0, 1,
-0.8069898, 0.7970213, 0.1765219, 0.6627451, 1, 0, 1,
-0.8002632, -0.2677609, 0.3987218, 0.654902, 1, 0, 1,
-0.7986189, 0.671368, 0.7607554, 0.6509804, 1, 0, 1,
-0.7955943, -0.4173536, -2.613511, 0.6431373, 1, 0, 1,
-0.7948931, 0.5676882, -0.3818467, 0.6392157, 1, 0, 1,
-0.7933409, -0.6508062, -2.787728, 0.6313726, 1, 0, 1,
-0.7889755, -0.2983135, -1.392843, 0.627451, 1, 0, 1,
-0.7885416, -0.5468662, -2.184877, 0.6196079, 1, 0, 1,
-0.7860807, -0.03760002, -0.4281489, 0.6156863, 1, 0, 1,
-0.7809672, 0.1868162, -0.9518974, 0.6078432, 1, 0, 1,
-0.7780802, 0.7142857, -2.195977, 0.6039216, 1, 0, 1,
-0.7764415, -0.7189947, -1.920833, 0.5960785, 1, 0, 1,
-0.7664273, -0.971884, -3.784682, 0.5882353, 1, 0, 1,
-0.7618462, 1.530879, -0.1578383, 0.5843138, 1, 0, 1,
-0.7569401, 0.006203094, -1.32318, 0.5764706, 1, 0, 1,
-0.749165, 1.371281, -0.9382824, 0.572549, 1, 0, 1,
-0.7438462, 1.341696, 0.7247546, 0.5647059, 1, 0, 1,
-0.7370504, 0.4643495, -1.725065, 0.5607843, 1, 0, 1,
-0.7370281, 0.491146, -1.938793, 0.5529412, 1, 0, 1,
-0.7358784, 0.1447641, -0.115351, 0.5490196, 1, 0, 1,
-0.727838, -0.5370738, -2.613412, 0.5411765, 1, 0, 1,
-0.7261902, -1.074828, -3.68592, 0.5372549, 1, 0, 1,
-0.7227101, -2.12238, -1.885301, 0.5294118, 1, 0, 1,
-0.7201492, -0.1876173, -0.6153039, 0.5254902, 1, 0, 1,
-0.7135825, -0.6303247, -2.903231, 0.5176471, 1, 0, 1,
-0.7122166, 0.449014, 0.4089647, 0.5137255, 1, 0, 1,
-0.7039765, -2.017412, -1.73446, 0.5058824, 1, 0, 1,
-0.7022133, 0.002102387, -0.1468788, 0.5019608, 1, 0, 1,
-0.6974385, 0.9520199, -1.261079, 0.4941176, 1, 0, 1,
-0.6964957, -0.9368159, -3.1703, 0.4862745, 1, 0, 1,
-0.6953877, -0.6156737, -1.635734, 0.4823529, 1, 0, 1,
-0.6835, -0.4498984, -2.562834, 0.4745098, 1, 0, 1,
-0.6797203, 0.2198779, -1.887071, 0.4705882, 1, 0, 1,
-0.6793507, 0.1487529, 0.1091015, 0.4627451, 1, 0, 1,
-0.6759285, 0.9754907, -0.2666049, 0.4588235, 1, 0, 1,
-0.6698686, -0.4074974, -2.399053, 0.4509804, 1, 0, 1,
-0.6696749, -0.8885422, -3.483707, 0.4470588, 1, 0, 1,
-0.6693251, 0.7363737, -0.8295321, 0.4392157, 1, 0, 1,
-0.6647782, 0.7599037, -0.3649005, 0.4352941, 1, 0, 1,
-0.6624519, 0.9345888, -0.8172271, 0.427451, 1, 0, 1,
-0.6612216, 1.149009, 0.7882795, 0.4235294, 1, 0, 1,
-0.6595232, -0.6563749, -1.970893, 0.4156863, 1, 0, 1,
-0.657813, 0.300416, 0.2798735, 0.4117647, 1, 0, 1,
-0.6496701, -0.6315678, -2.826051, 0.4039216, 1, 0, 1,
-0.6483203, -0.5305409, -1.321636, 0.3960784, 1, 0, 1,
-0.6462319, -0.9499034, -1.744677, 0.3921569, 1, 0, 1,
-0.6419712, 0.3859369, -1.127864, 0.3843137, 1, 0, 1,
-0.6372611, -0.4024723, -2.031141, 0.3803922, 1, 0, 1,
-0.6366992, 0.6598894, -0.7842118, 0.372549, 1, 0, 1,
-0.6353835, -0.2316754, -2.111628, 0.3686275, 1, 0, 1,
-0.6316406, -1.461425, -0.6269071, 0.3607843, 1, 0, 1,
-0.626593, -0.6748608, -4.040626, 0.3568628, 1, 0, 1,
-0.6247662, -1.863317, -4.061053, 0.3490196, 1, 0, 1,
-0.6207457, -1.238371, -2.362058, 0.345098, 1, 0, 1,
-0.6187921, -0.5800385, -1.969391, 0.3372549, 1, 0, 1,
-0.6182884, -0.6958874, -3.339881, 0.3333333, 1, 0, 1,
-0.617646, 0.05978838, -1.84646, 0.3254902, 1, 0, 1,
-0.6173205, -0.7396149, -0.1927354, 0.3215686, 1, 0, 1,
-0.6170695, 0.302341, -1.543183, 0.3137255, 1, 0, 1,
-0.612703, -0.31467, -3.380401, 0.3098039, 1, 0, 1,
-0.6110779, 0.371603, 1.234482, 0.3019608, 1, 0, 1,
-0.6103186, 2.172869, -0.6103998, 0.2941177, 1, 0, 1,
-0.6098876, -0.1855736, -2.383052, 0.2901961, 1, 0, 1,
-0.607655, -0.7973667, -2.663818, 0.282353, 1, 0, 1,
-0.6002029, 0.2537195, 0.02853541, 0.2784314, 1, 0, 1,
-0.596531, -0.4839966, -3.392246, 0.2705882, 1, 0, 1,
-0.5963308, -1.203583, -2.466973, 0.2666667, 1, 0, 1,
-0.586378, 1.28957, -1.340344, 0.2588235, 1, 0, 1,
-0.5851824, -0.3690193, -3.371785, 0.254902, 1, 0, 1,
-0.5843161, 0.9507946, -1.28187, 0.2470588, 1, 0, 1,
-0.583621, 0.4999205, -2.39438, 0.2431373, 1, 0, 1,
-0.583154, -0.07160804, 0.204158, 0.2352941, 1, 0, 1,
-0.5769361, -0.3098051, -1.38323, 0.2313726, 1, 0, 1,
-0.5764511, 0.8903894, -1.883075, 0.2235294, 1, 0, 1,
-0.575969, 1.020356, -1.981816, 0.2196078, 1, 0, 1,
-0.568918, 0.4865359, -1.723192, 0.2117647, 1, 0, 1,
-0.568712, -0.6024105, -2.68674, 0.2078431, 1, 0, 1,
-0.5677664, -1.03857, -1.405493, 0.2, 1, 0, 1,
-0.5676632, -1.678602, -1.951867, 0.1921569, 1, 0, 1,
-0.5661955, -1.600286, -3.283248, 0.1882353, 1, 0, 1,
-0.5661284, -1.276168, -3.015141, 0.1803922, 1, 0, 1,
-0.562109, -0.1631672, -2.239552, 0.1764706, 1, 0, 1,
-0.5607119, 0.6483528, 0.1061937, 0.1686275, 1, 0, 1,
-0.555546, -1.523287, -5.28269, 0.1647059, 1, 0, 1,
-0.5532702, -0.554538, -0.7900999, 0.1568628, 1, 0, 1,
-0.552032, -0.075363, -1.759386, 0.1529412, 1, 0, 1,
-0.5518059, -0.4746873, -1.842925, 0.145098, 1, 0, 1,
-0.5467122, 0.4757258, 0.6206185, 0.1411765, 1, 0, 1,
-0.5433444, -0.2154676, -3.410442, 0.1333333, 1, 0, 1,
-0.5405489, 1.085155, 0.1957938, 0.1294118, 1, 0, 1,
-0.5400437, 0.3761557, -0.843025, 0.1215686, 1, 0, 1,
-0.5381485, 0.2306289, 0.4319347, 0.1176471, 1, 0, 1,
-0.5377854, 0.817839, 0.6797017, 0.1098039, 1, 0, 1,
-0.5375905, 1.963719, -0.2462437, 0.1058824, 1, 0, 1,
-0.5365513, 0.5646299, 0.1926214, 0.09803922, 1, 0, 1,
-0.535019, -0.5411149, -2.346032, 0.09019608, 1, 0, 1,
-0.5340592, 0.3825602, -2.819385, 0.08627451, 1, 0, 1,
-0.5325862, 2.300408, -0.6245512, 0.07843138, 1, 0, 1,
-0.5260711, 0.5039089, -1.780796, 0.07450981, 1, 0, 1,
-0.5215228, -0.7026868, -2.426715, 0.06666667, 1, 0, 1,
-0.5210437, -0.2005735, -0.8338307, 0.0627451, 1, 0, 1,
-0.5192947, 0.9797586, 0.3063854, 0.05490196, 1, 0, 1,
-0.5039301, 2.26598, 0.4323171, 0.05098039, 1, 0, 1,
-0.5032706, -0.1645238, -1.057325, 0.04313726, 1, 0, 1,
-0.5016195, -1.328479, -2.338333, 0.03921569, 1, 0, 1,
-0.4984224, 0.1171297, -2.218615, 0.03137255, 1, 0, 1,
-0.4952427, -1.52276, -4.793808, 0.02745098, 1, 0, 1,
-0.4816487, -0.2023129, -2.129874, 0.01960784, 1, 0, 1,
-0.4811856, 0.8722348, -0.2856955, 0.01568628, 1, 0, 1,
-0.4798124, -1.946321, -3.454961, 0.007843138, 1, 0, 1,
-0.4782386, 0.9041368, 1.366364, 0.003921569, 1, 0, 1,
-0.4781945, -1.188208, -4.759191, 0, 1, 0.003921569, 1,
-0.477857, 1.862461, -1.945141, 0, 1, 0.01176471, 1,
-0.4752897, 1.613845, -1.184779, 0, 1, 0.01568628, 1,
-0.4684389, -0.7837585, -2.217697, 0, 1, 0.02352941, 1,
-0.4628835, 1.233032, 0.1627363, 0, 1, 0.02745098, 1,
-0.4573083, -0.4260394, -1.853869, 0, 1, 0.03529412, 1,
-0.4565174, 0.3664041, -3.865435, 0, 1, 0.03921569, 1,
-0.4546857, 1.198376, 0.06855453, 0, 1, 0.04705882, 1,
-0.4546454, -1.292079, -2.729238, 0, 1, 0.05098039, 1,
-0.4535202, -0.02929417, -4.210094, 0, 1, 0.05882353, 1,
-0.4505745, 0.2126926, -1.805165, 0, 1, 0.0627451, 1,
-0.4487801, -0.2743265, -1.145666, 0, 1, 0.07058824, 1,
-0.4420833, 0.6685618, -0.209125, 0, 1, 0.07450981, 1,
-0.4414748, -1.21314, -2.283887, 0, 1, 0.08235294, 1,
-0.4388954, -0.4961999, -5.2389, 0, 1, 0.08627451, 1,
-0.4379446, 0.7691678, -1.884348, 0, 1, 0.09411765, 1,
-0.4344403, 1.844512, -1.183923, 0, 1, 0.1019608, 1,
-0.4329159, -0.04110228, 0.041047, 0, 1, 0.1058824, 1,
-0.4320755, 0.2066616, -0.9866461, 0, 1, 0.1137255, 1,
-0.4285062, 1.008511, 0.6826001, 0, 1, 0.1176471, 1,
-0.4276705, -0.0005245403, -2.975214, 0, 1, 0.1254902, 1,
-0.4252421, -0.4288534, -0.8453033, 0, 1, 0.1294118, 1,
-0.4251808, 1.27608, -0.3444779, 0, 1, 0.1372549, 1,
-0.4250211, -1.71787, -2.405232, 0, 1, 0.1411765, 1,
-0.4235121, 0.1381354, -4.086879, 0, 1, 0.1490196, 1,
-0.418853, 0.4192761, -2.144015, 0, 1, 0.1529412, 1,
-0.4140623, -1.881577, -3.123081, 0, 1, 0.1607843, 1,
-0.4050686, 0.2358675, -0.8165661, 0, 1, 0.1647059, 1,
-0.4026051, -0.1996111, -2.878321, 0, 1, 0.172549, 1,
-0.4007752, 1.649813, 1.896275, 0, 1, 0.1764706, 1,
-0.3980695, 1.255269, -1.239717, 0, 1, 0.1843137, 1,
-0.3961247, -1.271586, -2.946958, 0, 1, 0.1882353, 1,
-0.3951969, -0.06389427, -2.372462, 0, 1, 0.1960784, 1,
-0.3929667, 0.5030863, -0.3371033, 0, 1, 0.2039216, 1,
-0.3869841, -1.396262, -4.316661, 0, 1, 0.2078431, 1,
-0.3868115, 1.158673, -0.8958443, 0, 1, 0.2156863, 1,
-0.3834405, -1.390169, -3.794015, 0, 1, 0.2196078, 1,
-0.3797199, -0.08047843, -1.132316, 0, 1, 0.227451, 1,
-0.3772605, -0.4680451, -1.255222, 0, 1, 0.2313726, 1,
-0.3762071, 0.1480319, -2.09967, 0, 1, 0.2392157, 1,
-0.3715035, 1.175268, 0.4116626, 0, 1, 0.2431373, 1,
-0.3676525, 1.147937, -1.411479, 0, 1, 0.2509804, 1,
-0.3660562, -1.149326, -4.85133, 0, 1, 0.254902, 1,
-0.3645707, -0.1021971, -2.095526, 0, 1, 0.2627451, 1,
-0.3601416, -0.957004, -1.549725, 0, 1, 0.2666667, 1,
-0.3590835, -0.6577011, -1.609692, 0, 1, 0.2745098, 1,
-0.3578583, -0.7279251, -1.282789, 0, 1, 0.2784314, 1,
-0.3547839, -1.039907, -2.795883, 0, 1, 0.2862745, 1,
-0.354733, -0.1577089, -1.650946, 0, 1, 0.2901961, 1,
-0.3531222, -0.2126444, -1.775944, 0, 1, 0.2980392, 1,
-0.3530158, 0.8560575, -0.3710681, 0, 1, 0.3058824, 1,
-0.3473432, -0.1311834, -1.848399, 0, 1, 0.3098039, 1,
-0.3465248, -0.09865455, -0.3915986, 0, 1, 0.3176471, 1,
-0.3348299, 0.9275928, -0.02866338, 0, 1, 0.3215686, 1,
-0.3347709, -1.438442, -3.30676, 0, 1, 0.3294118, 1,
-0.3344834, -0.6414429, -2.556391, 0, 1, 0.3333333, 1,
-0.3343019, -1.065419, -2.672049, 0, 1, 0.3411765, 1,
-0.3312028, 0.09399218, -1.143821, 0, 1, 0.345098, 1,
-0.330053, 0.6724555, -0.3109657, 0, 1, 0.3529412, 1,
-0.3290404, -0.3211059, -2.462264, 0, 1, 0.3568628, 1,
-0.3287311, -0.8745505, -4.264946, 0, 1, 0.3647059, 1,
-0.327361, -0.5969905, -3.039711, 0, 1, 0.3686275, 1,
-0.3255262, -1.448969, -2.08736, 0, 1, 0.3764706, 1,
-0.3253459, 0.446174, 0.6481887, 0, 1, 0.3803922, 1,
-0.3214026, -1.192154, -2.227883, 0, 1, 0.3882353, 1,
-0.3177306, -1.377537, -1.595206, 0, 1, 0.3921569, 1,
-0.3151278, -0.6493679, -1.909817, 0, 1, 0.4, 1,
-0.3145061, 0.441619, -1.0084, 0, 1, 0.4078431, 1,
-0.3137096, -0.3105336, -2.977487, 0, 1, 0.4117647, 1,
-0.3125235, 0.2684954, -3.276401, 0, 1, 0.4196078, 1,
-0.3042837, 0.7680832, 0.9011197, 0, 1, 0.4235294, 1,
-0.2981055, -0.08708367, -0.5118988, 0, 1, 0.4313726, 1,
-0.297483, 0.4607272, 0.2050839, 0, 1, 0.4352941, 1,
-0.2974371, 0.6947013, -0.4896052, 0, 1, 0.4431373, 1,
-0.2941784, -0.8885444, -0.7407689, 0, 1, 0.4470588, 1,
-0.2819035, -0.9298084, -3.725476, 0, 1, 0.454902, 1,
-0.2804208, 0.09988034, -1.65792, 0, 1, 0.4588235, 1,
-0.2781979, 0.6644, -0.1089461, 0, 1, 0.4666667, 1,
-0.2748871, -0.3147992, -1.454185, 0, 1, 0.4705882, 1,
-0.273862, -0.08380922, -1.9157, 0, 1, 0.4784314, 1,
-0.2727708, 0.1517109, -0.9758275, 0, 1, 0.4823529, 1,
-0.2709565, 1.052864, -0.5483434, 0, 1, 0.4901961, 1,
-0.2679344, -0.3328575, -3.075145, 0, 1, 0.4941176, 1,
-0.2653775, 0.5934902, 0.4017286, 0, 1, 0.5019608, 1,
-0.2649424, 0.02415897, -0.4678443, 0, 1, 0.509804, 1,
-0.2638639, -0.150256, -2.338193, 0, 1, 0.5137255, 1,
-0.2580276, -0.9159265, -3.776223, 0, 1, 0.5215687, 1,
-0.2519906, 1.137222, -0.1457224, 0, 1, 0.5254902, 1,
-0.2517058, 0.3925585, 0.442773, 0, 1, 0.5333334, 1,
-0.2477728, -2.001191, -2.612265, 0, 1, 0.5372549, 1,
-0.2457998, -0.6911831, -2.619743, 0, 1, 0.5450981, 1,
-0.2437527, 0.6177623, -0.08398906, 0, 1, 0.5490196, 1,
-0.2423089, 1.357306, -1.966785, 0, 1, 0.5568628, 1,
-0.2416845, -0.604789, -3.473064, 0, 1, 0.5607843, 1,
-0.2416207, 0.4937476, -0.4432464, 0, 1, 0.5686275, 1,
-0.2383734, -0.376588, -3.227989, 0, 1, 0.572549, 1,
-0.2352912, -0.3689263, -1.632379, 0, 1, 0.5803922, 1,
-0.233223, -0.8101909, -4.636507, 0, 1, 0.5843138, 1,
-0.2329221, -0.8862454, -3.148106, 0, 1, 0.5921569, 1,
-0.2327372, 0.5184489, -1.135216, 0, 1, 0.5960785, 1,
-0.2293178, -0.9112185, -2.738673, 0, 1, 0.6039216, 1,
-0.2262812, 0.8490962, -1.376926, 0, 1, 0.6117647, 1,
-0.2242139, 2.072205, -0.4579293, 0, 1, 0.6156863, 1,
-0.2241626, -0.03781258, -1.269782, 0, 1, 0.6235294, 1,
-0.2237318, -0.008849486, -1.177776, 0, 1, 0.627451, 1,
-0.2201073, -1.590357, -3.841763, 0, 1, 0.6352941, 1,
-0.2187763, 0.02286508, -0.336842, 0, 1, 0.6392157, 1,
-0.2162166, -0.9040027, -2.098198, 0, 1, 0.6470588, 1,
-0.2099915, -0.7000257, -1.979324, 0, 1, 0.6509804, 1,
-0.20403, 0.7194296, -0.8261706, 0, 1, 0.6588235, 1,
-0.1969377, 0.358164, -1.13169, 0, 1, 0.6627451, 1,
-0.1965995, -1.468831, -3.203142, 0, 1, 0.6705883, 1,
-0.1964821, 0.7134401, -0.2850438, 0, 1, 0.6745098, 1,
-0.1955106, 2.458167, -0.4614848, 0, 1, 0.682353, 1,
-0.1906348, 0.2304077, -0.8719484, 0, 1, 0.6862745, 1,
-0.1858994, -0.4072602, -2.69055, 0, 1, 0.6941177, 1,
-0.1804879, -1.214768, -3.442072, 0, 1, 0.7019608, 1,
-0.172712, 1.413652, 0.8556401, 0, 1, 0.7058824, 1,
-0.1707479, 1.158415, 0.4336801, 0, 1, 0.7137255, 1,
-0.1691832, -0.01944263, -2.582102, 0, 1, 0.7176471, 1,
-0.161668, -1.807685, -1.753479, 0, 1, 0.7254902, 1,
-0.1596393, 0.1391152, -0.616165, 0, 1, 0.7294118, 1,
-0.1484089, -0.2489692, -2.081946, 0, 1, 0.7372549, 1,
-0.148077, -1.111097, -2.698618, 0, 1, 0.7411765, 1,
-0.1433089, 0.8129522, 0.8237802, 0, 1, 0.7490196, 1,
-0.139699, -0.06077756, -3.122919, 0, 1, 0.7529412, 1,
-0.1380102, -0.3679305, -1.819316, 0, 1, 0.7607843, 1,
-0.1345496, -1.41559, -1.997653, 0, 1, 0.7647059, 1,
-0.1344408, 0.297159, -0.6434937, 0, 1, 0.772549, 1,
-0.1318032, 0.0611575, -1.368354, 0, 1, 0.7764706, 1,
-0.1306497, -2.114008, -3.878022, 0, 1, 0.7843137, 1,
-0.1302675, 0.8113972, 0.4138545, 0, 1, 0.7882353, 1,
-0.1299442, -0.4210512, -3.038614, 0, 1, 0.7960784, 1,
-0.1299423, 1.863525, 0.04018196, 0, 1, 0.8039216, 1,
-0.1200665, 0.420372, -1.914819, 0, 1, 0.8078431, 1,
-0.1191196, -0.3514782, -3.789207, 0, 1, 0.8156863, 1,
-0.1187313, -1.316444, -2.535862, 0, 1, 0.8196079, 1,
-0.1156965, -0.7745264, -1.890105, 0, 1, 0.827451, 1,
-0.1149956, 1.452229, 0.004821432, 0, 1, 0.8313726, 1,
-0.1145584, -0.675786, -1.971647, 0, 1, 0.8392157, 1,
-0.1137366, 1.813855, -0.3373342, 0, 1, 0.8431373, 1,
-0.1132866, -0.3801582, -3.030251, 0, 1, 0.8509804, 1,
-0.1082344, -1.121689, -2.6423, 0, 1, 0.854902, 1,
-0.1074147, 0.4409289, -0.9620584, 0, 1, 0.8627451, 1,
-0.1064707, -0.882467, -2.060515, 0, 1, 0.8666667, 1,
-0.1061932, -1.138739, -2.897929, 0, 1, 0.8745098, 1,
-0.103684, -0.2915482, -2.948546, 0, 1, 0.8784314, 1,
-0.09668355, -0.454203, -2.820624, 0, 1, 0.8862745, 1,
-0.09648623, 1.784714, 1.201109, 0, 1, 0.8901961, 1,
-0.09588543, 1.497656, -1.094471, 0, 1, 0.8980392, 1,
-0.09102033, -0.6322495, -2.95283, 0, 1, 0.9058824, 1,
-0.09025682, 0.9104447, 0.2842973, 0, 1, 0.9098039, 1,
-0.08782119, -0.9810269, -3.699866, 0, 1, 0.9176471, 1,
-0.08290195, -0.3589279, -2.666039, 0, 1, 0.9215686, 1,
-0.08136521, 0.8425884, 0.3532861, 0, 1, 0.9294118, 1,
-0.08116379, 0.03012299, -1.724466, 0, 1, 0.9333333, 1,
-0.08020446, -2.653274, -3.214498, 0, 1, 0.9411765, 1,
-0.07777885, -0.3253192, -4.001899, 0, 1, 0.945098, 1,
-0.07597733, -0.7558571, -1.853925, 0, 1, 0.9529412, 1,
-0.07505178, 1.157176, 0.128061, 0, 1, 0.9568627, 1,
-0.07495201, 0.1413139, 1.677106, 0, 1, 0.9647059, 1,
-0.07464589, -0.136911, -3.732579, 0, 1, 0.9686275, 1,
-0.07352663, -0.4715021, -3.01693, 0, 1, 0.9764706, 1,
-0.06629025, 0.2013291, 0.655441, 0, 1, 0.9803922, 1,
-0.06593515, -0.6365469, -3.608108, 0, 1, 0.9882353, 1,
-0.06569941, -0.9245299, -3.078134, 0, 1, 0.9921569, 1,
-0.0636541, 1.576752, 0.199288, 0, 1, 1, 1,
-0.06354824, -0.05136009, -1.22768, 0, 0.9921569, 1, 1,
-0.06349785, 0.7764499, -2.718126, 0, 0.9882353, 1, 1,
-0.0634978, -0.2846065, -2.106976, 0, 0.9803922, 1, 1,
-0.05986017, 0.6300494, 0.3372066, 0, 0.9764706, 1, 1,
-0.05959043, -0.3018638, -3.08272, 0, 0.9686275, 1, 1,
-0.05755265, 0.7804716, -0.1089912, 0, 0.9647059, 1, 1,
-0.05391033, -1.233931, -1.220983, 0, 0.9568627, 1, 1,
-0.05105434, -0.0478662, -3.518952, 0, 0.9529412, 1, 1,
-0.04992079, 0.02516041, -0.2096877, 0, 0.945098, 1, 1,
-0.04383097, 1.82715, -0.2625326, 0, 0.9411765, 1, 1,
-0.04248586, -0.04909899, -4.415638, 0, 0.9333333, 1, 1,
-0.04181338, 1.404531, -1.265307, 0, 0.9294118, 1, 1,
-0.04096416, -0.7623193, -2.549833, 0, 0.9215686, 1, 1,
-0.03737601, -0.5775332, -2.715308, 0, 0.9176471, 1, 1,
-0.03559253, 0.1357165, -1.377006, 0, 0.9098039, 1, 1,
-0.0351634, 0.4980019, -2.861904, 0, 0.9058824, 1, 1,
-0.03355534, -0.08099566, -4.173418, 0, 0.8980392, 1, 1,
-0.01995379, 1.234669, -0.5368275, 0, 0.8901961, 1, 1,
-0.01515005, -1.155241, -2.424783, 0, 0.8862745, 1, 1,
-0.006988605, -1.384398, -3.413154, 0, 0.8784314, 1, 1,
-0.003421901, 1.283777, 0.4845801, 0, 0.8745098, 1, 1,
-0.002818082, 0.5702873, -1.750382, 0, 0.8666667, 1, 1,
-0.0009366248, 0.2927302, -0.5651137, 0, 0.8627451, 1, 1,
0.001097447, -0.9493392, 2.930579, 0, 0.854902, 1, 1,
0.0046071, -0.4287913, 4.261148, 0, 0.8509804, 1, 1,
0.006320271, -0.1912795, 3.865987, 0, 0.8431373, 1, 1,
0.008158438, -0.9026847, 3.869476, 0, 0.8392157, 1, 1,
0.008845404, 0.3467515, -0.9322268, 0, 0.8313726, 1, 1,
0.01168518, -1.171717, 2.854554, 0, 0.827451, 1, 1,
0.01273799, -1.927165, 4.118983, 0, 0.8196079, 1, 1,
0.02116428, 0.8953117, -0.5532901, 0, 0.8156863, 1, 1,
0.02746447, 0.5743046, 2.209453, 0, 0.8078431, 1, 1,
0.02951909, 0.4984535, -0.6907169, 0, 0.8039216, 1, 1,
0.03172495, -0.1495276, 2.930642, 0, 0.7960784, 1, 1,
0.0329015, 0.1992872, 0.7520175, 0, 0.7882353, 1, 1,
0.03985482, -1.212151, 1.170754, 0, 0.7843137, 1, 1,
0.0409142, -0.7684666, 5.432029, 0, 0.7764706, 1, 1,
0.04121426, 1.241604, -1.658227, 0, 0.772549, 1, 1,
0.04301164, 0.3545138, -0.1504031, 0, 0.7647059, 1, 1,
0.04868322, -0.3834148, 2.754929, 0, 0.7607843, 1, 1,
0.05242075, -0.7166143, 1.790314, 0, 0.7529412, 1, 1,
0.052456, -0.1208244, 1.616419, 0, 0.7490196, 1, 1,
0.05473193, 0.7068104, 1.006054, 0, 0.7411765, 1, 1,
0.05699681, -0.2735792, 4.51069, 0, 0.7372549, 1, 1,
0.05816053, 0.3543224, -0.6427606, 0, 0.7294118, 1, 1,
0.05824941, -1.289624, 5.639215, 0, 0.7254902, 1, 1,
0.06406535, -0.899808, 2.867269, 0, 0.7176471, 1, 1,
0.06681223, 0.5803923, 1.513636, 0, 0.7137255, 1, 1,
0.06815229, 0.4281782, 0.1871916, 0, 0.7058824, 1, 1,
0.06990773, 1.264513, 1.350209, 0, 0.6980392, 1, 1,
0.07164558, 1.002946, 0.7949908, 0, 0.6941177, 1, 1,
0.07506859, -1.160787, 4.571483, 0, 0.6862745, 1, 1,
0.07600557, 1.172152, 0.173622, 0, 0.682353, 1, 1,
0.07628351, 0.3411428, 0.6636672, 0, 0.6745098, 1, 1,
0.07860671, -1.032171, 3.034604, 0, 0.6705883, 1, 1,
0.07867206, -0.4229799, 1.843307, 0, 0.6627451, 1, 1,
0.07891311, -0.1107812, 3.0099, 0, 0.6588235, 1, 1,
0.07904998, 1.524153, -0.01926873, 0, 0.6509804, 1, 1,
0.08129483, -0.2189827, 2.134615, 0, 0.6470588, 1, 1,
0.08498765, 1.436197, -0.1715591, 0, 0.6392157, 1, 1,
0.08524355, -0.2325587, 2.542082, 0, 0.6352941, 1, 1,
0.08554612, -0.4558582, 1.869702, 0, 0.627451, 1, 1,
0.0881069, -0.2865602, 4.610595, 0, 0.6235294, 1, 1,
0.08960134, 1.298063, -1.117964, 0, 0.6156863, 1, 1,
0.09664608, 0.02796373, 1.658022, 0, 0.6117647, 1, 1,
0.09963333, 0.815097, 1.089627, 0, 0.6039216, 1, 1,
0.1003009, -0.6070076, 3.210642, 0, 0.5960785, 1, 1,
0.1013185, 0.8628547, -0.01380532, 0, 0.5921569, 1, 1,
0.1028637, 0.9631015, 1.504381, 0, 0.5843138, 1, 1,
0.1084765, -0.1854965, 2.646179, 0, 0.5803922, 1, 1,
0.1124362, -1.637903, 3.961224, 0, 0.572549, 1, 1,
0.1128295, 1.003182, 0.2577309, 0, 0.5686275, 1, 1,
0.1130477, 0.4277311, -0.08024306, 0, 0.5607843, 1, 1,
0.115222, -1.355942, 2.027705, 0, 0.5568628, 1, 1,
0.1155901, 1.330498, 0.2200531, 0, 0.5490196, 1, 1,
0.1184571, 1.062707, -0.7454013, 0, 0.5450981, 1, 1,
0.1215143, 0.2054132, 0.8982719, 0, 0.5372549, 1, 1,
0.122885, -1.200376, 6.608442, 0, 0.5333334, 1, 1,
0.1254825, 0.4718437, 0.09326418, 0, 0.5254902, 1, 1,
0.1267741, -0.3681987, 4.191133, 0, 0.5215687, 1, 1,
0.1277952, -0.5442837, 2.343377, 0, 0.5137255, 1, 1,
0.1307681, 1.198944, 0.3784505, 0, 0.509804, 1, 1,
0.1315269, -2.324442, 4.467569, 0, 0.5019608, 1, 1,
0.132327, 0.1658763, -0.0432418, 0, 0.4941176, 1, 1,
0.1404619, -2.237734, 2.797268, 0, 0.4901961, 1, 1,
0.1407657, 0.3963411, 0.01494747, 0, 0.4823529, 1, 1,
0.1414495, -0.6405967, 3.818275, 0, 0.4784314, 1, 1,
0.1426692, -1.411688, 3.001678, 0, 0.4705882, 1, 1,
0.1432319, 1.170628, 0.5387749, 0, 0.4666667, 1, 1,
0.1515045, 0.7709175, 0.1882333, 0, 0.4588235, 1, 1,
0.1535385, -1.121698, 3.286399, 0, 0.454902, 1, 1,
0.1537179, 1.137061, 0.9519014, 0, 0.4470588, 1, 1,
0.1581366, -0.1845442, 2.540006, 0, 0.4431373, 1, 1,
0.1591712, 1.326652, -0.07819156, 0, 0.4352941, 1, 1,
0.1595421, 2.354561, -0.5168039, 0, 0.4313726, 1, 1,
0.1605794, -1.580973, 3.765087, 0, 0.4235294, 1, 1,
0.1612719, 1.108984, -0.6113258, 0, 0.4196078, 1, 1,
0.1702719, 1.39286, 0.853341, 0, 0.4117647, 1, 1,
0.1715737, 0.4584768, -0.03297235, 0, 0.4078431, 1, 1,
0.1747889, 1.473589, -0.6111469, 0, 0.4, 1, 1,
0.1841215, -1.102036, 2.719662, 0, 0.3921569, 1, 1,
0.185167, -0.1999433, 1.64355, 0, 0.3882353, 1, 1,
0.1972087, 0.1570692, 0.5978565, 0, 0.3803922, 1, 1,
0.2027771, -0.4563686, 2.711083, 0, 0.3764706, 1, 1,
0.2028001, -0.6936963, 2.290054, 0, 0.3686275, 1, 1,
0.2029795, 0.8726675, 0.733414, 0, 0.3647059, 1, 1,
0.2105728, 1.826233, -0.8472466, 0, 0.3568628, 1, 1,
0.2224202, -2.199507, 4.181798, 0, 0.3529412, 1, 1,
0.2274238, -2.198316, -0.01283435, 0, 0.345098, 1, 1,
0.2288819, 0.3544325, 0.6721138, 0, 0.3411765, 1, 1,
0.2297813, 0.8756646, -0.6395163, 0, 0.3333333, 1, 1,
0.2304425, -0.404188, 1.808739, 0, 0.3294118, 1, 1,
0.2310216, -0.2647729, 1.286481, 0, 0.3215686, 1, 1,
0.2311205, 0.875795, 0.8367169, 0, 0.3176471, 1, 1,
0.2321116, -0.4352906, 2.198128, 0, 0.3098039, 1, 1,
0.2327499, -0.07240526, 0.8303077, 0, 0.3058824, 1, 1,
0.2338997, -0.5021616, 4.258478, 0, 0.2980392, 1, 1,
0.2345188, -0.6540931, 2.029475, 0, 0.2901961, 1, 1,
0.2348062, -0.5305445, 3.124122, 0, 0.2862745, 1, 1,
0.2365092, -0.7260793, 0.7854962, 0, 0.2784314, 1, 1,
0.2400483, 0.5392135, 0.4581023, 0, 0.2745098, 1, 1,
0.2570808, -0.2483251, 2.770069, 0, 0.2666667, 1, 1,
0.2593923, -0.5324684, 1.892124, 0, 0.2627451, 1, 1,
0.2616194, -1.047946, 2.676644, 0, 0.254902, 1, 1,
0.2628352, 0.3634949, -0.2464605, 0, 0.2509804, 1, 1,
0.2643148, -1.226284, 3.413411, 0, 0.2431373, 1, 1,
0.2645608, -0.04280723, 2.377495, 0, 0.2392157, 1, 1,
0.2665226, 0.627332, -1.461012, 0, 0.2313726, 1, 1,
0.2672559, 2.881571, 1.63068, 0, 0.227451, 1, 1,
0.2699918, 1.671711, -1.173982, 0, 0.2196078, 1, 1,
0.2712187, -0.8123493, 3.085919, 0, 0.2156863, 1, 1,
0.27993, 1.388418, -0.0005622756, 0, 0.2078431, 1, 1,
0.2859738, 0.7949356, 0.6991541, 0, 0.2039216, 1, 1,
0.2892727, -0.01247058, 1.895051, 0, 0.1960784, 1, 1,
0.2926304, -2.075508, 1.744424, 0, 0.1882353, 1, 1,
0.2927288, 1.622078, -0.598129, 0, 0.1843137, 1, 1,
0.295101, 0.1478348, 1.242409, 0, 0.1764706, 1, 1,
0.2969001, -0.7072722, 2.761913, 0, 0.172549, 1, 1,
0.3026561, -0.2089083, 2.899359, 0, 0.1647059, 1, 1,
0.3055237, 0.7493558, 0.7410366, 0, 0.1607843, 1, 1,
0.3117194, -0.2168101, 1.444871, 0, 0.1529412, 1, 1,
0.3131202, -2.434734, 3.357817, 0, 0.1490196, 1, 1,
0.3170964, -1.481555, 3.236479, 0, 0.1411765, 1, 1,
0.3195644, 0.7821175, 0.7608318, 0, 0.1372549, 1, 1,
0.3202235, -1.235309, 2.758806, 0, 0.1294118, 1, 1,
0.3220868, 0.4597415, -0.760215, 0, 0.1254902, 1, 1,
0.3259369, 0.2005091, 1.36008, 0, 0.1176471, 1, 1,
0.3307962, 0.3125592, 0.6721864, 0, 0.1137255, 1, 1,
0.3427489, 1.344555, 0.4894213, 0, 0.1058824, 1, 1,
0.3482533, -1.311246, 3.285, 0, 0.09803922, 1, 1,
0.3490961, -0.7026501, 1.844657, 0, 0.09411765, 1, 1,
0.3548733, -0.5503654, 5.159124, 0, 0.08627451, 1, 1,
0.3559868, 1.242217, 0.04334347, 0, 0.08235294, 1, 1,
0.3561398, 0.9401893, -0.3553461, 0, 0.07450981, 1, 1,
0.3571964, -2.080508, 2.857166, 0, 0.07058824, 1, 1,
0.3591866, 1.485873, 1.001343, 0, 0.0627451, 1, 1,
0.3655807, 0.7808769, -0.8157958, 0, 0.05882353, 1, 1,
0.3664292, -1.696338, 1.903797, 0, 0.05098039, 1, 1,
0.3692353, 1.782563, 0.7580322, 0, 0.04705882, 1, 1,
0.3700059, -0.1783506, 2.27254, 0, 0.03921569, 1, 1,
0.3706638, -0.3735936, 2.089703, 0, 0.03529412, 1, 1,
0.3712701, -0.4154176, 4.20434, 0, 0.02745098, 1, 1,
0.3775314, -1.109816, 1.78579, 0, 0.02352941, 1, 1,
0.3848334, 0.1419741, 0.6765564, 0, 0.01568628, 1, 1,
0.3878872, 0.3992501, 1.608156, 0, 0.01176471, 1, 1,
0.3936279, -0.3157732, 1.443529, 0, 0.003921569, 1, 1,
0.4004015, -1.285961, 2.010442, 0.003921569, 0, 1, 1,
0.4027966, 0.6256506, 1.487069, 0.007843138, 0, 1, 1,
0.4031482, 0.6206495, -0.1744506, 0.01568628, 0, 1, 1,
0.4042577, -0.1788193, 0.9414962, 0.01960784, 0, 1, 1,
0.4062217, 1.430529, -0.1849589, 0.02745098, 0, 1, 1,
0.4071757, -0.1811368, -0.2531664, 0.03137255, 0, 1, 1,
0.4132582, -0.6505964, 0.7059866, 0.03921569, 0, 1, 1,
0.4139526, -0.006147561, 0.4042416, 0.04313726, 0, 1, 1,
0.414306, -1.255447, 3.371171, 0.05098039, 0, 1, 1,
0.4156261, 0.7627614, -0.6457492, 0.05490196, 0, 1, 1,
0.4183675, 0.5812102, 0.9015276, 0.0627451, 0, 1, 1,
0.4220929, -1.052599, 1.654567, 0.06666667, 0, 1, 1,
0.4228825, -0.3534524, 1.849534, 0.07450981, 0, 1, 1,
0.4255618, -0.2553442, 1.249769, 0.07843138, 0, 1, 1,
0.4283068, 0.8306496, -0.6654196, 0.08627451, 0, 1, 1,
0.437121, -0.4616495, 1.706978, 0.09019608, 0, 1, 1,
0.4443904, -0.1767416, 1.864667, 0.09803922, 0, 1, 1,
0.444788, 0.7598065, 0.6597074, 0.1058824, 0, 1, 1,
0.4451507, -0.4675674, 1.214595, 0.1098039, 0, 1, 1,
0.4473867, -0.01048676, 1.523398, 0.1176471, 0, 1, 1,
0.4485684, 0.1400004, 2.314181, 0.1215686, 0, 1, 1,
0.45132, -0.7845707, 2.776043, 0.1294118, 0, 1, 1,
0.4540208, 0.3821444, 0.2712903, 0.1333333, 0, 1, 1,
0.454988, -1.0712, 4.202693, 0.1411765, 0, 1, 1,
0.4565437, -0.1092411, -0.01869099, 0.145098, 0, 1, 1,
0.4569625, -0.5556992, 3.061628, 0.1529412, 0, 1, 1,
0.4577675, 0.2158961, -0.01752906, 0.1568628, 0, 1, 1,
0.4608608, -0.6707706, 0.2393632, 0.1647059, 0, 1, 1,
0.4644105, -0.5203626, 1.757087, 0.1686275, 0, 1, 1,
0.4687684, 1.340052, -1.119048, 0.1764706, 0, 1, 1,
0.4720601, 0.1134971, 0.3327299, 0.1803922, 0, 1, 1,
0.4720718, 1.954569, 1.79418, 0.1882353, 0, 1, 1,
0.4725214, -0.4544809, 1.92085, 0.1921569, 0, 1, 1,
0.4736332, 1.285338, -0.7287402, 0.2, 0, 1, 1,
0.480235, 0.5907912, 0.9145232, 0.2078431, 0, 1, 1,
0.4806612, -0.4004891, 0.6303972, 0.2117647, 0, 1, 1,
0.4812291, -0.4072942, 2.438505, 0.2196078, 0, 1, 1,
0.4815288, -0.7832422, 2.129247, 0.2235294, 0, 1, 1,
0.4827525, -0.06902973, 1.635406, 0.2313726, 0, 1, 1,
0.4843654, 0.3780157, -0.1534389, 0.2352941, 0, 1, 1,
0.4862165, 1.1685, 2.25466, 0.2431373, 0, 1, 1,
0.4899135, -0.2335951, 2.250439, 0.2470588, 0, 1, 1,
0.4908605, -0.06521355, 3.376392, 0.254902, 0, 1, 1,
0.4987332, -0.1848049, 3.42902, 0.2588235, 0, 1, 1,
0.5124191, 0.1696967, 2.2302, 0.2666667, 0, 1, 1,
0.5133389, -1.780334, 2.828393, 0.2705882, 0, 1, 1,
0.5147343, 0.04576923, 2.57512, 0.2784314, 0, 1, 1,
0.5156215, 0.3292481, 2.29472, 0.282353, 0, 1, 1,
0.5182096, 2.041793, 0.3705718, 0.2901961, 0, 1, 1,
0.5200409, 0.6216983, 0.2947215, 0.2941177, 0, 1, 1,
0.5210179, 0.526553, 2.357353, 0.3019608, 0, 1, 1,
0.5215974, 0.4049894, 1.3911, 0.3098039, 0, 1, 1,
0.5239537, 2.064193, 1.18587, 0.3137255, 0, 1, 1,
0.5251805, 0.507782, 0.5008305, 0.3215686, 0, 1, 1,
0.5274428, -0.230625, 1.125308, 0.3254902, 0, 1, 1,
0.5288909, -1.098731, 2.55321, 0.3333333, 0, 1, 1,
0.5292109, 0.08969676, 0.01620711, 0.3372549, 0, 1, 1,
0.5319454, 1.129415, -0.3410659, 0.345098, 0, 1, 1,
0.5341797, 0.5208188, 1.988051, 0.3490196, 0, 1, 1,
0.535814, -0.1289504, 0.9836527, 0.3568628, 0, 1, 1,
0.5358264, 0.1689951, 2.357293, 0.3607843, 0, 1, 1,
0.546526, 0.3251247, 0.2035007, 0.3686275, 0, 1, 1,
0.5470185, -0.7522652, 1.013872, 0.372549, 0, 1, 1,
0.5486906, 0.7634686, -0.6650566, 0.3803922, 0, 1, 1,
0.5488279, -0.6289111, 3.468222, 0.3843137, 0, 1, 1,
0.5521104, 0.5387402, -0.4765369, 0.3921569, 0, 1, 1,
0.553214, -0.3921677, 1.597855, 0.3960784, 0, 1, 1,
0.553293, 0.4062319, 1.966486, 0.4039216, 0, 1, 1,
0.5535892, -0.2285011, 2.05048, 0.4117647, 0, 1, 1,
0.5546886, -0.3835627, 2.097177, 0.4156863, 0, 1, 1,
0.5550959, 0.004525325, 1.722753, 0.4235294, 0, 1, 1,
0.5599315, -1.442968, 3.185746, 0.427451, 0, 1, 1,
0.5608073, 0.4442417, 2.033906, 0.4352941, 0, 1, 1,
0.5663741, 0.04377647, 1.438975, 0.4392157, 0, 1, 1,
0.571408, 0.8839566, 1.026404, 0.4470588, 0, 1, 1,
0.5789422, -1.006394, 2.118114, 0.4509804, 0, 1, 1,
0.5881849, 0.8897012, -1.847538, 0.4588235, 0, 1, 1,
0.5899825, 0.04719513, 2.923056, 0.4627451, 0, 1, 1,
0.5913963, 1.897386, -0.2462036, 0.4705882, 0, 1, 1,
0.5998858, -0.6393889, 3.33902, 0.4745098, 0, 1, 1,
0.6006655, 1.631952, 1.04209, 0.4823529, 0, 1, 1,
0.6061967, 0.1156373, 1.068876, 0.4862745, 0, 1, 1,
0.6097886, -0.1901645, 1.454956, 0.4941176, 0, 1, 1,
0.6098695, 0.3954005, -0.0172587, 0.5019608, 0, 1, 1,
0.6112911, 0.1019332, 0.8869998, 0.5058824, 0, 1, 1,
0.6117324, -0.9056509, 2.63033, 0.5137255, 0, 1, 1,
0.6166717, 0.555267, 0.5966329, 0.5176471, 0, 1, 1,
0.6190659, 1.056305, 1.850572, 0.5254902, 0, 1, 1,
0.6228207, 0.8519965, 1.216404, 0.5294118, 0, 1, 1,
0.6281831, 0.4792701, 0.07278275, 0.5372549, 0, 1, 1,
0.6339437, -0.8991717, 2.208382, 0.5411765, 0, 1, 1,
0.6363549, -0.9010935, 5.343799, 0.5490196, 0, 1, 1,
0.6389931, -0.2582187, 2.625077, 0.5529412, 0, 1, 1,
0.6396838, -0.6182769, 0.8053159, 0.5607843, 0, 1, 1,
0.6411166, -1.092586, 2.924123, 0.5647059, 0, 1, 1,
0.6434843, -0.8142153, 1.180527, 0.572549, 0, 1, 1,
0.6449663, -0.01817732, 2.907419, 0.5764706, 0, 1, 1,
0.6553693, 1.06012, 0.1187868, 0.5843138, 0, 1, 1,
0.6610089, 0.03200658, 3.062805, 0.5882353, 0, 1, 1,
0.6623063, -0.6129937, 3.025287, 0.5960785, 0, 1, 1,
0.6653962, -0.6459911, 4.107337, 0.6039216, 0, 1, 1,
0.6677169, -0.4926388, 4.259513, 0.6078432, 0, 1, 1,
0.6677551, -0.3110148, 2.366399, 0.6156863, 0, 1, 1,
0.671104, 0.8947572, 2.489954, 0.6196079, 0, 1, 1,
0.6764258, 0.1747763, 2.533661, 0.627451, 0, 1, 1,
0.6844898, -0.0802306, 3.389555, 0.6313726, 0, 1, 1,
0.6854162, 0.6078924, 1.350564, 0.6392157, 0, 1, 1,
0.6861563, 1.690276, 0.225552, 0.6431373, 0, 1, 1,
0.7015457, -0.2559923, 2.361171, 0.6509804, 0, 1, 1,
0.7058401, -0.1496155, 1.023274, 0.654902, 0, 1, 1,
0.7065489, 1.094183, 1.755816, 0.6627451, 0, 1, 1,
0.707069, -0.8807283, 3.178878, 0.6666667, 0, 1, 1,
0.7079762, -0.01877019, 0.7126696, 0.6745098, 0, 1, 1,
0.709053, 0.8985068, 1.248005, 0.6784314, 0, 1, 1,
0.7107421, -2.073591, 3.595074, 0.6862745, 0, 1, 1,
0.7120317, 0.3784748, -0.1612343, 0.6901961, 0, 1, 1,
0.7166048, 2.368275, 1.066994, 0.6980392, 0, 1, 1,
0.7200047, -1.343369, 1.863666, 0.7058824, 0, 1, 1,
0.7218507, -0.9294332, 3.076798, 0.7098039, 0, 1, 1,
0.7219638, -1.890866, 2.19697, 0.7176471, 0, 1, 1,
0.7275036, 0.2140048, 0.3434163, 0.7215686, 0, 1, 1,
0.7405339, 0.5595084, 0.8516107, 0.7294118, 0, 1, 1,
0.7442905, 0.7481171, 1.404389, 0.7333333, 0, 1, 1,
0.7501523, 0.6710243, 1.303313, 0.7411765, 0, 1, 1,
0.7536578, 0.6595656, 1.403356, 0.7450981, 0, 1, 1,
0.7614052, -1.133224, 1.691007, 0.7529412, 0, 1, 1,
0.7646477, -1.095602, 3.720878, 0.7568628, 0, 1, 1,
0.772053, 0.519143, -0.06394663, 0.7647059, 0, 1, 1,
0.7829723, -0.3626635, 1.621831, 0.7686275, 0, 1, 1,
0.7908177, 2.498796, -1.954707, 0.7764706, 0, 1, 1,
0.7920459, 1.256805, 1.481108, 0.7803922, 0, 1, 1,
0.7957569, 1.472939, 0.7914141, 0.7882353, 0, 1, 1,
0.7994009, -0.2979051, 3.20701, 0.7921569, 0, 1, 1,
0.8019688, 0.01223453, 1.396768, 0.8, 0, 1, 1,
0.8046946, -1.523519, 3.641404, 0.8078431, 0, 1, 1,
0.8057249, 0.565136, 1.975217, 0.8117647, 0, 1, 1,
0.8092301, 0.5246583, 0.3363635, 0.8196079, 0, 1, 1,
0.8116537, 1.019227, -0.9859874, 0.8235294, 0, 1, 1,
0.8162749, -0.1518452, 1.173677, 0.8313726, 0, 1, 1,
0.8175489, 1.270523, -1.105555, 0.8352941, 0, 1, 1,
0.8176798, -0.3371571, 1.818036, 0.8431373, 0, 1, 1,
0.8223277, 0.0009681355, 1.790458, 0.8470588, 0, 1, 1,
0.8233416, -0.6246708, 0.7707678, 0.854902, 0, 1, 1,
0.8239049, -1.655442, 0.8692732, 0.8588235, 0, 1, 1,
0.8409029, 0.6688596, 0.2602828, 0.8666667, 0, 1, 1,
0.8442101, -0.3708614, 1.464075, 0.8705882, 0, 1, 1,
0.8501969, -0.9689533, 3.227396, 0.8784314, 0, 1, 1,
0.8523937, 0.6109304, -0.1352544, 0.8823529, 0, 1, 1,
0.8613731, 2.107202, -0.4573516, 0.8901961, 0, 1, 1,
0.8622221, -0.6579815, 2.33607, 0.8941177, 0, 1, 1,
0.8643922, 0.2279624, 2.049262, 0.9019608, 0, 1, 1,
0.8677846, 0.4958698, 0.2834704, 0.9098039, 0, 1, 1,
0.8696371, -1.154527, 1.873849, 0.9137255, 0, 1, 1,
0.875401, -0.7311094, 2.332329, 0.9215686, 0, 1, 1,
0.8785393, 0.5395772, 1.0694, 0.9254902, 0, 1, 1,
0.8793656, -0.1265498, -0.6204439, 0.9333333, 0, 1, 1,
0.885177, -0.1042753, 1.931909, 0.9372549, 0, 1, 1,
0.8932527, -1.218462, 3.221338, 0.945098, 0, 1, 1,
0.8973373, 0.2599939, 0.2282822, 0.9490196, 0, 1, 1,
0.9095509, -0.9929819, 2.053338, 0.9568627, 0, 1, 1,
0.9155046, 0.505556, -0.636626, 0.9607843, 0, 1, 1,
0.919733, -0.9604618, 2.249878, 0.9686275, 0, 1, 1,
0.9213455, -0.8507599, 2.300691, 0.972549, 0, 1, 1,
0.9263471, -0.6345547, 2.824266, 0.9803922, 0, 1, 1,
0.9337072, 0.4870188, 3.04218, 0.9843137, 0, 1, 1,
0.9337978, -1.807874, 4.176136, 0.9921569, 0, 1, 1,
0.9345737, 2.268415, -0.4710346, 0.9960784, 0, 1, 1,
0.9379471, -0.3344927, 1.983723, 1, 0, 0.9960784, 1,
0.9400051, -0.2424612, -0.4132103, 1, 0, 0.9882353, 1,
0.944778, 1.610763, 0.1798882, 1, 0, 0.9843137, 1,
0.9457685, 1.63474, -0.05892577, 1, 0, 0.9764706, 1,
0.9481304, 0.2426622, 0.01323372, 1, 0, 0.972549, 1,
0.951526, -0.0894452, 1.76164, 1, 0, 0.9647059, 1,
0.9644415, 1.368335, -2.386993, 1, 0, 0.9607843, 1,
0.9678057, 0.3812596, 2.42598, 1, 0, 0.9529412, 1,
0.9713407, -1.016863, 2.406933, 1, 0, 0.9490196, 1,
0.9713693, -0.4901479, 3.362868, 1, 0, 0.9411765, 1,
0.9718971, 0.5350604, 0.9681211, 1, 0, 0.9372549, 1,
0.9722042, 0.04056203, 1.579596, 1, 0, 0.9294118, 1,
0.9727927, 0.4604549, 1.695948, 1, 0, 0.9254902, 1,
0.9761296, -1.211824, 2.475592, 1, 0, 0.9176471, 1,
0.9764699, -1.577861, 1.802702, 1, 0, 0.9137255, 1,
0.9795382, -0.1888083, 2.245298, 1, 0, 0.9058824, 1,
0.9998112, -1.271895, 0.8214504, 1, 0, 0.9019608, 1,
1.006622, 1.367409, -0.3859978, 1, 0, 0.8941177, 1,
1.016276, -0.941384, 5.293587, 1, 0, 0.8862745, 1,
1.02015, -0.7904917, 1.837435, 1, 0, 0.8823529, 1,
1.039621, 0.2758236, 1.718996, 1, 0, 0.8745098, 1,
1.041842, 0.1298224, 1.188775, 1, 0, 0.8705882, 1,
1.043293, -0.6105953, 2.032454, 1, 0, 0.8627451, 1,
1.046553, 1.791272, 1.33338, 1, 0, 0.8588235, 1,
1.048928, -2.507902, 3.01329, 1, 0, 0.8509804, 1,
1.060674, 0.787235, -0.6082488, 1, 0, 0.8470588, 1,
1.066549, -0.2993944, 1.691477, 1, 0, 0.8392157, 1,
1.070583, -0.5545211, 2.943838, 1, 0, 0.8352941, 1,
1.072977, 0.1913694, 2.119945, 1, 0, 0.827451, 1,
1.087049, 0.5240155, 4.680826, 1, 0, 0.8235294, 1,
1.087742, -0.118607, 2.499619, 1, 0, 0.8156863, 1,
1.099859, -0.8872573, 2.60353, 1, 0, 0.8117647, 1,
1.108045, -1.282151, 2.912423, 1, 0, 0.8039216, 1,
1.108217, 2.34084, 1.179313, 1, 0, 0.7960784, 1,
1.108225, 1.106809, -1.48156, 1, 0, 0.7921569, 1,
1.11884, -0.7255782, 2.218876, 1, 0, 0.7843137, 1,
1.131642, 0.593913, 1.062769, 1, 0, 0.7803922, 1,
1.142989, 0.6209779, 3.14446, 1, 0, 0.772549, 1,
1.155646, 1.133132, 2.2848, 1, 0, 0.7686275, 1,
1.161535, 0.2379428, 0.854987, 1, 0, 0.7607843, 1,
1.162895, 2.159503, 0.07727475, 1, 0, 0.7568628, 1,
1.174423, -0.7248899, 0.8121269, 1, 0, 0.7490196, 1,
1.181752, 0.7773091, 1.692063, 1, 0, 0.7450981, 1,
1.217809, 0.3968515, 0.4511958, 1, 0, 0.7372549, 1,
1.228968, -0.1495484, 1.6555, 1, 0, 0.7333333, 1,
1.229208, 0.05007569, 1.483036, 1, 0, 0.7254902, 1,
1.230405, 0.3023303, -0.7207189, 1, 0, 0.7215686, 1,
1.230882, 0.778116, -0.1710021, 1, 0, 0.7137255, 1,
1.232084, -1.173372, 3.748111, 1, 0, 0.7098039, 1,
1.233096, 1.754552, -0.1577954, 1, 0, 0.7019608, 1,
1.23404, 0.7504085, 0.5907667, 1, 0, 0.6941177, 1,
1.245779, -0.009972884, 0.319259, 1, 0, 0.6901961, 1,
1.249618, -0.1743498, 3.096116, 1, 0, 0.682353, 1,
1.253598, -0.8900746, 1.245147, 1, 0, 0.6784314, 1,
1.254023, -0.2694371, 1.509878, 1, 0, 0.6705883, 1,
1.266468, -2.938339, -0.3571827, 1, 0, 0.6666667, 1,
1.278143, -0.813345, 0.9066362, 1, 0, 0.6588235, 1,
1.285958, 0.2018443, 1.824885, 1, 0, 0.654902, 1,
1.296813, -0.9511489, 2.3228, 1, 0, 0.6470588, 1,
1.29921, -0.3960387, 2.503455, 1, 0, 0.6431373, 1,
1.313632, -0.8179625, 2.476512, 1, 0, 0.6352941, 1,
1.32093, 2.817965, 2.345209, 1, 0, 0.6313726, 1,
1.331178, -0.3848389, 1.836645, 1, 0, 0.6235294, 1,
1.338094, 1.146477, 0.3251643, 1, 0, 0.6196079, 1,
1.353222, -0.6137102, 1.648252, 1, 0, 0.6117647, 1,
1.366009, -0.7774333, 2.170911, 1, 0, 0.6078432, 1,
1.376082, 0.6491625, 2.113103, 1, 0, 0.6, 1,
1.383151, 0.5009487, 0.389742, 1, 0, 0.5921569, 1,
1.384259, -0.0317993, 1.838651, 1, 0, 0.5882353, 1,
1.384742, 0.2631184, 2.412178, 1, 0, 0.5803922, 1,
1.385618, -0.880592, 3.207805, 1, 0, 0.5764706, 1,
1.396827, 1.656837, 0.6655756, 1, 0, 0.5686275, 1,
1.408096, -1.486746, 4.309551, 1, 0, 0.5647059, 1,
1.409065, -2.491447, 3.441318, 1, 0, 0.5568628, 1,
1.412301, 0.532039, 1.075154, 1, 0, 0.5529412, 1,
1.415476, 0.3681307, 0.3487945, 1, 0, 0.5450981, 1,
1.423157, 1.319262, 2.501106, 1, 0, 0.5411765, 1,
1.428154, -0.09460533, 1.228778, 1, 0, 0.5333334, 1,
1.438254, 0.4929508, 1.864179, 1, 0, 0.5294118, 1,
1.442211, -0.7329556, 2.484589, 1, 0, 0.5215687, 1,
1.452675, -0.03771207, 2.736341, 1, 0, 0.5176471, 1,
1.460858, -1.404388, 1.753637, 1, 0, 0.509804, 1,
1.467428, 0.4886209, 3.151196, 1, 0, 0.5058824, 1,
1.474745, 0.04671067, 1.667841, 1, 0, 0.4980392, 1,
1.477488, -1.417725, 3.524956, 1, 0, 0.4901961, 1,
1.482084, 0.8105434, 2.86456, 1, 0, 0.4862745, 1,
1.48583, 1.331735, 1.936965, 1, 0, 0.4784314, 1,
1.485991, 0.8784646, -0.09826775, 1, 0, 0.4745098, 1,
1.486328, -0.5316089, 3.012041, 1, 0, 0.4666667, 1,
1.493284, -0.1027399, 1.305848, 1, 0, 0.4627451, 1,
1.497842, -0.1235252, 3.096855, 1, 0, 0.454902, 1,
1.498681, -0.5943102, 2.094638, 1, 0, 0.4509804, 1,
1.498837, 0.470585, 2.127996, 1, 0, 0.4431373, 1,
1.53264, -0.6620446, 2.106046, 1, 0, 0.4392157, 1,
1.538967, 1.506251, 0.8920836, 1, 0, 0.4313726, 1,
1.545698, 0.7516918, 2.200867, 1, 0, 0.427451, 1,
1.547544, -0.007770227, 1.645301, 1, 0, 0.4196078, 1,
1.548574, 0.02130774, 0.4478725, 1, 0, 0.4156863, 1,
1.549935, 0.4033203, 0.1250372, 1, 0, 0.4078431, 1,
1.566646, -0.5536986, 1.093414, 1, 0, 0.4039216, 1,
1.577363, 0.8685743, 0.7064893, 1, 0, 0.3960784, 1,
1.581004, 0.01019629, 1.059118, 1, 0, 0.3882353, 1,
1.583644, 1.059, 1.516062, 1, 0, 0.3843137, 1,
1.590384, -1.508996, 3.865949, 1, 0, 0.3764706, 1,
1.603586, -0.1379908, 1.650004, 1, 0, 0.372549, 1,
1.611372, -0.5702108, 3.127153, 1, 0, 0.3647059, 1,
1.638237, -0.8022555, 0.9436103, 1, 0, 0.3607843, 1,
1.642062, -1.326218, 2.495895, 1, 0, 0.3529412, 1,
1.652818, -0.4687178, 0.1195364, 1, 0, 0.3490196, 1,
1.673135, 0.01986684, 2.378123, 1, 0, 0.3411765, 1,
1.676683, -0.9854275, 1.848821, 1, 0, 0.3372549, 1,
1.683385, -0.2891481, 1.033243, 1, 0, 0.3294118, 1,
1.706488, -0.4099111, 1.624087, 1, 0, 0.3254902, 1,
1.720159, -0.8610011, 2.26743, 1, 0, 0.3176471, 1,
1.726681, 0.2951053, 0.8908262, 1, 0, 0.3137255, 1,
1.735669, -0.9104552, 2.029395, 1, 0, 0.3058824, 1,
1.747702, -0.4006985, 3.253645, 1, 0, 0.2980392, 1,
1.756674, 0.5670729, 0.4682521, 1, 0, 0.2941177, 1,
1.763728, 1.647393, 0.2351786, 1, 0, 0.2862745, 1,
1.782723, -0.2034116, 1.862338, 1, 0, 0.282353, 1,
1.78633, -0.6008536, 2.735356, 1, 0, 0.2745098, 1,
1.789586, -0.09639591, 2.093113, 1, 0, 0.2705882, 1,
1.824688, 0.1862677, 0.958243, 1, 0, 0.2627451, 1,
1.832245, -0.7880263, 1.552728, 1, 0, 0.2588235, 1,
1.832347, -1.435588, 3.735081, 1, 0, 0.2509804, 1,
1.851533, -0.2645428, 1.596663, 1, 0, 0.2470588, 1,
1.863266, -1.825987, 1.962176, 1, 0, 0.2392157, 1,
1.866997, 0.4008861, 1.942311, 1, 0, 0.2352941, 1,
1.872145, 0.3144776, 1.533857, 1, 0, 0.227451, 1,
1.873936, 0.4273553, 1.109604, 1, 0, 0.2235294, 1,
1.881616, -1.359221, 0.8388675, 1, 0, 0.2156863, 1,
1.895881, 0.3521032, 2.445305, 1, 0, 0.2117647, 1,
1.899012, -0.2988968, 0.8897257, 1, 0, 0.2039216, 1,
1.901074, -1.456704, 4.228436, 1, 0, 0.1960784, 1,
1.905554, 0.6918701, 0.2523696, 1, 0, 0.1921569, 1,
1.908927, -0.2427618, 0.2309082, 1, 0, 0.1843137, 1,
1.909301, 0.9883184, 1.063882, 1, 0, 0.1803922, 1,
1.930625, -0.7257556, 0.7640947, 1, 0, 0.172549, 1,
1.941858, -0.2746934, 0.4949847, 1, 0, 0.1686275, 1,
1.944698, -0.65535, 2.479374, 1, 0, 0.1607843, 1,
1.950167, 1.781921, 0.7228339, 1, 0, 0.1568628, 1,
1.969024, -1.826866, 2.71761, 1, 0, 0.1490196, 1,
1.978911, 1.398012, 0.3169072, 1, 0, 0.145098, 1,
1.981647, 1.560305, 0.4187678, 1, 0, 0.1372549, 1,
1.984711, 0.7767668, 2.068817, 1, 0, 0.1333333, 1,
1.996182, -1.361229, 2.448435, 1, 0, 0.1254902, 1,
2.022513, -0.188459, 0.8196359, 1, 0, 0.1215686, 1,
2.047099, 1.27206, 1.778859, 1, 0, 0.1137255, 1,
2.060326, -1.165871, 2.163662, 1, 0, 0.1098039, 1,
2.067366, -0.004574786, 1.390251, 1, 0, 0.1019608, 1,
2.094359, -0.4742884, 3.018726, 1, 0, 0.09411765, 1,
2.097575, -1.267454, 3.311544, 1, 0, 0.09019608, 1,
2.135775, 0.7805237, 0.6021129, 1, 0, 0.08235294, 1,
2.14517, -0.6517413, 0.9001038, 1, 0, 0.07843138, 1,
2.258896, 0.4881839, -0.7175766, 1, 0, 0.07058824, 1,
2.314604, 1.163815, 0.9338408, 1, 0, 0.06666667, 1,
2.318896, 1.160399, 1.707514, 1, 0, 0.05882353, 1,
2.412643, -1.874799, 4.267227, 1, 0, 0.05490196, 1,
2.458089, -1.42545, 1.452015, 1, 0, 0.04705882, 1,
2.47761, 1.066661, -0.0364939, 1, 0, 0.04313726, 1,
2.584068, -0.5424644, 3.964568, 1, 0, 0.03529412, 1,
2.597191, -0.4197665, 2.001657, 1, 0, 0.03137255, 1,
2.615199, -1.240117, 1.427823, 1, 0, 0.02352941, 1,
2.700213, 0.4215621, -0.7410603, 1, 0, 0.01960784, 1,
2.719232, 1.131536, -0.2860435, 1, 0, 0.01176471, 1,
3.05228, 1.070521, -0.5965828, 1, 0, 0.007843138, 1
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
-0.2903982, -4.22608, -7.559478, 0, -0.5, 0.5, 0.5,
-0.2903982, -4.22608, -7.559478, 1, -0.5, 0.5, 0.5,
-0.2903982, -4.22608, -7.559478, 1, 1.5, 0.5, 0.5,
-0.2903982, -4.22608, -7.559478, 0, 1.5, 0.5, 0.5
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
-4.766245, -0.1295843, -7.559478, 0, -0.5, 0.5, 0.5,
-4.766245, -0.1295843, -7.559478, 1, -0.5, 0.5, 0.5,
-4.766245, -0.1295843, -7.559478, 1, 1.5, 0.5, 0.5,
-4.766245, -0.1295843, -7.559478, 0, 1.5, 0.5, 0.5
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
-4.766245, -4.22608, 0.5511868, 0, -0.5, 0.5, 0.5,
-4.766245, -4.22608, 0.5511868, 1, -0.5, 0.5, 0.5,
-4.766245, -4.22608, 0.5511868, 1, 1.5, 0.5, 0.5,
-4.766245, -4.22608, 0.5511868, 0, 1.5, 0.5, 0.5
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
-3, -3.280735, -5.687787,
3, -3.280735, -5.687787,
-3, -3.280735, -5.687787,
-3, -3.438293, -5.999735,
-2, -3.280735, -5.687787,
-2, -3.438293, -5.999735,
-1, -3.280735, -5.687787,
-1, -3.438293, -5.999735,
0, -3.280735, -5.687787,
0, -3.438293, -5.999735,
1, -3.280735, -5.687787,
1, -3.438293, -5.999735,
2, -3.280735, -5.687787,
2, -3.438293, -5.999735,
3, -3.280735, -5.687787,
3, -3.438293, -5.999735
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
-3, -3.753407, -6.623632, 0, -0.5, 0.5, 0.5,
-3, -3.753407, -6.623632, 1, -0.5, 0.5, 0.5,
-3, -3.753407, -6.623632, 1, 1.5, 0.5, 0.5,
-3, -3.753407, -6.623632, 0, 1.5, 0.5, 0.5,
-2, -3.753407, -6.623632, 0, -0.5, 0.5, 0.5,
-2, -3.753407, -6.623632, 1, -0.5, 0.5, 0.5,
-2, -3.753407, -6.623632, 1, 1.5, 0.5, 0.5,
-2, -3.753407, -6.623632, 0, 1.5, 0.5, 0.5,
-1, -3.753407, -6.623632, 0, -0.5, 0.5, 0.5,
-1, -3.753407, -6.623632, 1, -0.5, 0.5, 0.5,
-1, -3.753407, -6.623632, 1, 1.5, 0.5, 0.5,
-1, -3.753407, -6.623632, 0, 1.5, 0.5, 0.5,
0, -3.753407, -6.623632, 0, -0.5, 0.5, 0.5,
0, -3.753407, -6.623632, 1, -0.5, 0.5, 0.5,
0, -3.753407, -6.623632, 1, 1.5, 0.5, 0.5,
0, -3.753407, -6.623632, 0, 1.5, 0.5, 0.5,
1, -3.753407, -6.623632, 0, -0.5, 0.5, 0.5,
1, -3.753407, -6.623632, 1, -0.5, 0.5, 0.5,
1, -3.753407, -6.623632, 1, 1.5, 0.5, 0.5,
1, -3.753407, -6.623632, 0, 1.5, 0.5, 0.5,
2, -3.753407, -6.623632, 0, -0.5, 0.5, 0.5,
2, -3.753407, -6.623632, 1, -0.5, 0.5, 0.5,
2, -3.753407, -6.623632, 1, 1.5, 0.5, 0.5,
2, -3.753407, -6.623632, 0, 1.5, 0.5, 0.5,
3, -3.753407, -6.623632, 0, -0.5, 0.5, 0.5,
3, -3.753407, -6.623632, 1, -0.5, 0.5, 0.5,
3, -3.753407, -6.623632, 1, 1.5, 0.5, 0.5,
3, -3.753407, -6.623632, 0, 1.5, 0.5, 0.5
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
-3.733357, -3, -5.687787,
-3.733357, 2, -5.687787,
-3.733357, -3, -5.687787,
-3.905505, -3, -5.999735,
-3.733357, -2, -5.687787,
-3.905505, -2, -5.999735,
-3.733357, -1, -5.687787,
-3.905505, -1, -5.999735,
-3.733357, 0, -5.687787,
-3.905505, 0, -5.999735,
-3.733357, 1, -5.687787,
-3.905505, 1, -5.999735,
-3.733357, 2, -5.687787,
-3.905505, 2, -5.999735
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
-4.249801, -3, -6.623632, 0, -0.5, 0.5, 0.5,
-4.249801, -3, -6.623632, 1, -0.5, 0.5, 0.5,
-4.249801, -3, -6.623632, 1, 1.5, 0.5, 0.5,
-4.249801, -3, -6.623632, 0, 1.5, 0.5, 0.5,
-4.249801, -2, -6.623632, 0, -0.5, 0.5, 0.5,
-4.249801, -2, -6.623632, 1, -0.5, 0.5, 0.5,
-4.249801, -2, -6.623632, 1, 1.5, 0.5, 0.5,
-4.249801, -2, -6.623632, 0, 1.5, 0.5, 0.5,
-4.249801, -1, -6.623632, 0, -0.5, 0.5, 0.5,
-4.249801, -1, -6.623632, 1, -0.5, 0.5, 0.5,
-4.249801, -1, -6.623632, 1, 1.5, 0.5, 0.5,
-4.249801, -1, -6.623632, 0, 1.5, 0.5, 0.5,
-4.249801, 0, -6.623632, 0, -0.5, 0.5, 0.5,
-4.249801, 0, -6.623632, 1, -0.5, 0.5, 0.5,
-4.249801, 0, -6.623632, 1, 1.5, 0.5, 0.5,
-4.249801, 0, -6.623632, 0, 1.5, 0.5, 0.5,
-4.249801, 1, -6.623632, 0, -0.5, 0.5, 0.5,
-4.249801, 1, -6.623632, 1, -0.5, 0.5, 0.5,
-4.249801, 1, -6.623632, 1, 1.5, 0.5, 0.5,
-4.249801, 1, -6.623632, 0, 1.5, 0.5, 0.5,
-4.249801, 2, -6.623632, 0, -0.5, 0.5, 0.5,
-4.249801, 2, -6.623632, 1, -0.5, 0.5, 0.5,
-4.249801, 2, -6.623632, 1, 1.5, 0.5, 0.5,
-4.249801, 2, -6.623632, 0, 1.5, 0.5, 0.5
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
-3.733357, -3.280735, -4,
-3.733357, -3.280735, 6,
-3.733357, -3.280735, -4,
-3.905505, -3.438293, -4,
-3.733357, -3.280735, -2,
-3.905505, -3.438293, -2,
-3.733357, -3.280735, 0,
-3.905505, -3.438293, 0,
-3.733357, -3.280735, 2,
-3.905505, -3.438293, 2,
-3.733357, -3.280735, 4,
-3.905505, -3.438293, 4,
-3.733357, -3.280735, 6,
-3.905505, -3.438293, 6
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
-4.249801, -3.753407, -4, 0, -0.5, 0.5, 0.5,
-4.249801, -3.753407, -4, 1, -0.5, 0.5, 0.5,
-4.249801, -3.753407, -4, 1, 1.5, 0.5, 0.5,
-4.249801, -3.753407, -4, 0, 1.5, 0.5, 0.5,
-4.249801, -3.753407, -2, 0, -0.5, 0.5, 0.5,
-4.249801, -3.753407, -2, 1, -0.5, 0.5, 0.5,
-4.249801, -3.753407, -2, 1, 1.5, 0.5, 0.5,
-4.249801, -3.753407, -2, 0, 1.5, 0.5, 0.5,
-4.249801, -3.753407, 0, 0, -0.5, 0.5, 0.5,
-4.249801, -3.753407, 0, 1, -0.5, 0.5, 0.5,
-4.249801, -3.753407, 0, 1, 1.5, 0.5, 0.5,
-4.249801, -3.753407, 0, 0, 1.5, 0.5, 0.5,
-4.249801, -3.753407, 2, 0, -0.5, 0.5, 0.5,
-4.249801, -3.753407, 2, 1, -0.5, 0.5, 0.5,
-4.249801, -3.753407, 2, 1, 1.5, 0.5, 0.5,
-4.249801, -3.753407, 2, 0, 1.5, 0.5, 0.5,
-4.249801, -3.753407, 4, 0, -0.5, 0.5, 0.5,
-4.249801, -3.753407, 4, 1, -0.5, 0.5, 0.5,
-4.249801, -3.753407, 4, 1, 1.5, 0.5, 0.5,
-4.249801, -3.753407, 4, 0, 1.5, 0.5, 0.5,
-4.249801, -3.753407, 6, 0, -0.5, 0.5, 0.5,
-4.249801, -3.753407, 6, 1, -0.5, 0.5, 0.5,
-4.249801, -3.753407, 6, 1, 1.5, 0.5, 0.5,
-4.249801, -3.753407, 6, 0, 1.5, 0.5, 0.5
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
-3.733357, -3.280735, -5.687787,
-3.733357, 3.021566, -5.687787,
-3.733357, -3.280735, 6.79016,
-3.733357, 3.021566, 6.79016,
-3.733357, -3.280735, -5.687787,
-3.733357, -3.280735, 6.79016,
-3.733357, 3.021566, -5.687787,
-3.733357, 3.021566, 6.79016,
-3.733357, -3.280735, -5.687787,
3.152561, -3.280735, -5.687787,
-3.733357, -3.280735, 6.79016,
3.152561, -3.280735, 6.79016,
-3.733357, 3.021566, -5.687787,
3.152561, 3.021566, -5.687787,
-3.733357, 3.021566, 6.79016,
3.152561, 3.021566, 6.79016,
3.152561, -3.280735, -5.687787,
3.152561, 3.021566, -5.687787,
3.152561, -3.280735, 6.79016,
3.152561, 3.021566, 6.79016,
3.152561, -3.280735, -5.687787,
3.152561, -3.280735, 6.79016,
3.152561, 3.021566, -5.687787,
3.152561, 3.021566, 6.79016
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
var radius = 8.32109;
var distance = 37.02147;
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
mvMatrix.translate( 0.2903982, 0.1295843, -0.5511868 );
mvMatrix.scale( 1.306569, 1.427562, 0.7210262 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.02147);
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
esprocarb<-read.table("esprocarb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-esprocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'esprocarb' not found
```

```r
y<-esprocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'esprocarb' not found
```

```r
z<-esprocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'esprocarb' not found
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
-3.633077, 0.3186736, -0.3421291, 0, 0, 1, 1, 1,
-3.257478, -0.001191123, -2.577806, 1, 0, 0, 1, 1,
-2.944495, -1.148202, -1.584898, 1, 0, 0, 1, 1,
-2.582566, -0.2000975, -3.369415, 1, 0, 0, 1, 1,
-2.525044, 0.450674, -1.284446, 1, 0, 0, 1, 1,
-2.499292, 1.449419, -0.6343153, 1, 0, 0, 1, 1,
-2.395462, 0.1491885, -1.042875, 0, 0, 0, 1, 1,
-2.342763, 0.189185, 0.7841836, 0, 0, 0, 1, 1,
-2.32882, -0.5655996, -2.00337, 0, 0, 0, 1, 1,
-2.322941, -0.476561, -3.305059, 0, 0, 0, 1, 1,
-2.225537, 1.344948, 0.2685311, 0, 0, 0, 1, 1,
-2.208705, 0.2932283, -1.441756, 0, 0, 0, 1, 1,
-2.185033, 0.03567656, -3.154047, 0, 0, 0, 1, 1,
-2.182944, -0.2626456, -2.159067, 1, 1, 1, 1, 1,
-2.149739, 0.1529033, -1.084193, 1, 1, 1, 1, 1,
-2.147064, 0.578308, -0.0711353, 1, 1, 1, 1, 1,
-2.112846, -0.6830699, -1.602613, 1, 1, 1, 1, 1,
-2.103407, -0.09346327, -2.140152, 1, 1, 1, 1, 1,
-2.090685, 0.08965771, -1.251432, 1, 1, 1, 1, 1,
-2.080119, 0.09975342, -1.776188, 1, 1, 1, 1, 1,
-2.072756, -1.078891, -0.440001, 1, 1, 1, 1, 1,
-2.03989, 0.6177753, -0.4443767, 1, 1, 1, 1, 1,
-2.024716, -0.09969964, -0.957187, 1, 1, 1, 1, 1,
-1.999825, -0.3011401, -2.105202, 1, 1, 1, 1, 1,
-1.969208, 0.003598816, -1.344913, 1, 1, 1, 1, 1,
-1.940318, -1.343314, -2.310625, 1, 1, 1, 1, 1,
-1.935698, -0.8008268, -1.657672, 1, 1, 1, 1, 1,
-1.905159, 1.155894, -0.8123057, 1, 1, 1, 1, 1,
-1.904445, 2.442934, -1.80502, 0, 0, 1, 1, 1,
-1.883622, -1.341524, -4.061028, 1, 0, 0, 1, 1,
-1.871685, -2.250733, -1.575111, 1, 0, 0, 1, 1,
-1.869976, -0.8962582, -1.903249, 1, 0, 0, 1, 1,
-1.851506, 0.5847569, -1.045682, 1, 0, 0, 1, 1,
-1.833056, 0.04220057, -2.783085, 1, 0, 0, 1, 1,
-1.823243, -0.969804, -0.1440155, 0, 0, 0, 1, 1,
-1.79642, 0.4572802, -1.493856, 0, 0, 0, 1, 1,
-1.779777, 0.4486607, -1.049249, 0, 0, 0, 1, 1,
-1.778149, 0.5782645, -0.4147256, 0, 0, 0, 1, 1,
-1.77181, -0.4443327, -3.059149, 0, 0, 0, 1, 1,
-1.765111, -0.5676584, -2.161763, 0, 0, 0, 1, 1,
-1.74403, 0.8570838, -0.810631, 0, 0, 0, 1, 1,
-1.7367, -0.03372679, -2.0972, 1, 1, 1, 1, 1,
-1.723086, -0.8323761, -1.986024, 1, 1, 1, 1, 1,
-1.721208, 1.299622, -1.256156, 1, 1, 1, 1, 1,
-1.714642, -1.350262, -2.23686, 1, 1, 1, 1, 1,
-1.711417, 1.070659, -2.01363, 1, 1, 1, 1, 1,
-1.707866, 1.726703, 0.2998143, 1, 1, 1, 1, 1,
-1.703401, 2.021586, -1.937687, 1, 1, 1, 1, 1,
-1.697777, 0.1245409, -2.359946, 1, 1, 1, 1, 1,
-1.682926, -1.321708, -2.338972, 1, 1, 1, 1, 1,
-1.655818, -0.9167737, -4.008841, 1, 1, 1, 1, 1,
-1.654352, 0.07285672, -2.101907, 1, 1, 1, 1, 1,
-1.651408, 0.2347189, -1.12471, 1, 1, 1, 1, 1,
-1.643207, 1.554185, -0.2996608, 1, 1, 1, 1, 1,
-1.639459, 1.32594, -0.8977888, 1, 1, 1, 1, 1,
-1.637656, -0.01905175, -0.3526664, 1, 1, 1, 1, 1,
-1.608833, 0.3419422, -0.0004946752, 0, 0, 1, 1, 1,
-1.606647, 0.154941, -1.951242, 1, 0, 0, 1, 1,
-1.593198, -0.3817612, -1.950481, 1, 0, 0, 1, 1,
-1.58758, 0.6917811, -0.7000577, 1, 0, 0, 1, 1,
-1.572657, -2.014231, -1.687979, 1, 0, 0, 1, 1,
-1.566232, -0.4267242, -1.043349, 1, 0, 0, 1, 1,
-1.552561, 0.304556, -1.648795, 0, 0, 0, 1, 1,
-1.547821, 0.003127052, -0.5404912, 0, 0, 0, 1, 1,
-1.530046, 1.075511, -0.0677185, 0, 0, 0, 1, 1,
-1.522704, 0.4992529, -2.13867, 0, 0, 0, 1, 1,
-1.519034, 0.02696285, -1.854805, 0, 0, 0, 1, 1,
-1.51005, -1.212877, -1.545451, 0, 0, 0, 1, 1,
-1.474154, 0.518604, 0.01123957, 0, 0, 0, 1, 1,
-1.457924, -0.02726338, 0.2512755, 1, 1, 1, 1, 1,
-1.453323, -0.8087826, -1.061162, 1, 1, 1, 1, 1,
-1.44629, 0.3914498, -2.017512, 1, 1, 1, 1, 1,
-1.433446, -0.7878827, -1.448807, 1, 1, 1, 1, 1,
-1.410553, -0.6931158, -1.334718, 1, 1, 1, 1, 1,
-1.410253, -0.3937875, -1.778633, 1, 1, 1, 1, 1,
-1.388422, 1.067141, -1.162264, 1, 1, 1, 1, 1,
-1.387986, 0.4332559, -0.1742999, 1, 1, 1, 1, 1,
-1.38595, -0.3469158, -2.380514, 1, 1, 1, 1, 1,
-1.383713, -2.151986, -3.658947, 1, 1, 1, 1, 1,
-1.377975, -0.1351705, -0.8664816, 1, 1, 1, 1, 1,
-1.374228, -0.561092, -1.938607, 1, 1, 1, 1, 1,
-1.365794, -0.1968057, -3.063979, 1, 1, 1, 1, 1,
-1.365451, 1.768241, -1.963187, 1, 1, 1, 1, 1,
-1.365071, -1.40783, -3.571426, 1, 1, 1, 1, 1,
-1.360282, -0.182122, -1.804695, 0, 0, 1, 1, 1,
-1.35347, 0.03790093, -1.244966, 1, 0, 0, 1, 1,
-1.350898, 1.247758, -0.01015753, 1, 0, 0, 1, 1,
-1.350407, 0.1118791, 0.09926471, 1, 0, 0, 1, 1,
-1.336497, -0.4256034, -2.563809, 1, 0, 0, 1, 1,
-1.333637, -1.053472, -1.108429, 1, 0, 0, 1, 1,
-1.323337, -0.1768573, -0.7836269, 0, 0, 0, 1, 1,
-1.321419, 0.1553949, -2.572598, 0, 0, 0, 1, 1,
-1.319956, 0.7746296, -0.3340608, 0, 0, 0, 1, 1,
-1.304369, -0.3798855, -5.120897, 0, 0, 0, 1, 1,
-1.298873, -1.186928, -2.296341, 0, 0, 0, 1, 1,
-1.295823, 1.656805, -1.000656, 0, 0, 0, 1, 1,
-1.29575, -1.120666, -2.839261, 0, 0, 0, 1, 1,
-1.294954, 0.9595707, -1.886506, 1, 1, 1, 1, 1,
-1.292378, 0.7106781, -2.421443, 1, 1, 1, 1, 1,
-1.286526, -1.518346, -3.092256, 1, 1, 1, 1, 1,
-1.284618, -0.4821135, -1.179835, 1, 1, 1, 1, 1,
-1.277131, -0.296895, -2.02649, 1, 1, 1, 1, 1,
-1.272269, -1.816554, -3.889029, 1, 1, 1, 1, 1,
-1.27126, 1.575214, -1.282041, 1, 1, 1, 1, 1,
-1.269032, 0.2727137, -0.3615422, 1, 1, 1, 1, 1,
-1.266755, -0.76718, -2.704805, 1, 1, 1, 1, 1,
-1.250554, 0.4710065, -1.390755, 1, 1, 1, 1, 1,
-1.243683, -0.1771109, -0.8621848, 1, 1, 1, 1, 1,
-1.240211, 0.05778165, -3.315344, 1, 1, 1, 1, 1,
-1.237557, -0.2618823, 0.6369295, 1, 1, 1, 1, 1,
-1.235163, 1.262034, -2.099297, 1, 1, 1, 1, 1,
-1.231802, 1.152798, -0.1312268, 1, 1, 1, 1, 1,
-1.225845, 0.7316689, -3.44329, 0, 0, 1, 1, 1,
-1.22253, 0.09651589, -0.6418082, 1, 0, 0, 1, 1,
-1.22249, 0.04646897, -0.08016294, 1, 0, 0, 1, 1,
-1.213411, 1.654778, -1.735069, 1, 0, 0, 1, 1,
-1.212117, -0.09859479, -1.338155, 1, 0, 0, 1, 1,
-1.210585, -0.7681628, -2.271214, 1, 0, 0, 1, 1,
-1.207429, -0.4083003, -1.033342, 0, 0, 0, 1, 1,
-1.201288, 0.8273972, -1.700399, 0, 0, 0, 1, 1,
-1.201095, 1.335574, -1.327325, 0, 0, 0, 1, 1,
-1.198048, -0.6238424, -1.114841, 0, 0, 0, 1, 1,
-1.1881, -0.2494378, -1.485365, 0, 0, 0, 1, 1,
-1.188015, -0.3846454, -2.141137, 0, 0, 0, 1, 1,
-1.183635, -0.05869986, -2.188044, 0, 0, 0, 1, 1,
-1.182531, -3.188954, -1.786608, 1, 1, 1, 1, 1,
-1.176642, 2.929785, -0.9349687, 1, 1, 1, 1, 1,
-1.175612, 0.5002045, 0.07531477, 1, 1, 1, 1, 1,
-1.159399, -1.034738, -2.107293, 1, 1, 1, 1, 1,
-1.153895, 0.2510564, -2.129345, 1, 1, 1, 1, 1,
-1.153047, -2.15594, -2.905051, 1, 1, 1, 1, 1,
-1.151555, -2.01238, -3.502966, 1, 1, 1, 1, 1,
-1.143544, -0.6314632, -2.714766, 1, 1, 1, 1, 1,
-1.133514, 0.7107245, 0.6357033, 1, 1, 1, 1, 1,
-1.132604, 0.4649033, -0.337896, 1, 1, 1, 1, 1,
-1.129994, -0.02005049, -1.676922, 1, 1, 1, 1, 1,
-1.124654, -0.2088508, -0.08361294, 1, 1, 1, 1, 1,
-1.121394, 1.339191, 1.234123, 1, 1, 1, 1, 1,
-1.114136, -1.417156, -3.41048, 1, 1, 1, 1, 1,
-1.113798, 0.5267513, -1.140874, 1, 1, 1, 1, 1,
-1.11078, -0.1393366, -1.522308, 0, 0, 1, 1, 1,
-1.109217, -1.468173, -2.96096, 1, 0, 0, 1, 1,
-1.105211, -0.5745823, -0.3463525, 1, 0, 0, 1, 1,
-1.102759, -2.377501, -4.337382, 1, 0, 0, 1, 1,
-1.099831, -1.55228, -2.384617, 1, 0, 0, 1, 1,
-1.09134, 1.25197, -0.6311194, 1, 0, 0, 1, 1,
-1.082621, 0.03362802, -2.854006, 0, 0, 0, 1, 1,
-1.077683, -0.1976985, -1.001129, 0, 0, 0, 1, 1,
-1.075545, -1.285808, -3.046564, 0, 0, 0, 1, 1,
-1.074303, 0.775626, -1.879394, 0, 0, 0, 1, 1,
-1.071672, 0.2826129, -1.456651, 0, 0, 0, 1, 1,
-1.066443, -1.794633, -1.169397, 0, 0, 0, 1, 1,
-1.062353, -1.46815, -3.255675, 0, 0, 0, 1, 1,
-1.060793, -0.0946487, -0.9831286, 1, 1, 1, 1, 1,
-1.059644, 0.8161021, -1.134582, 1, 1, 1, 1, 1,
-1.057524, -0.4474632, -0.9100382, 1, 1, 1, 1, 1,
-1.05571, -1.18072, -1.54666, 1, 1, 1, 1, 1,
-1.053511, 0.8621455, -2.093742, 1, 1, 1, 1, 1,
-1.049069, 0.8091223, -1.632044, 1, 1, 1, 1, 1,
-1.043343, 0.1269806, -1.87835, 1, 1, 1, 1, 1,
-1.043261, 0.919939, -3.326349, 1, 1, 1, 1, 1,
-1.032484, -0.2960297, -2.326452, 1, 1, 1, 1, 1,
-1.029072, -0.6591189, -2.447578, 1, 1, 1, 1, 1,
-1.028196, 0.2856659, -3.224023, 1, 1, 1, 1, 1,
-1.024547, -0.3493574, -0.6250817, 1, 1, 1, 1, 1,
-1.023474, 0.30535, -0.6863366, 1, 1, 1, 1, 1,
-1.013298, -0.107127, -1.210478, 1, 1, 1, 1, 1,
-1.011266, -1.848493, -2.802364, 1, 1, 1, 1, 1,
-1.010074, -0.7922408, -1.618406, 0, 0, 1, 1, 1,
-0.9989756, 0.597959, -0.3541099, 1, 0, 0, 1, 1,
-0.9980468, -1.541541, -2.27603, 1, 0, 0, 1, 1,
-0.9969761, 0.07457023, 0.3467211, 1, 0, 0, 1, 1,
-0.9958706, 0.6956092, -1.704671, 1, 0, 0, 1, 1,
-0.9920793, 2.474231, -0.200467, 1, 0, 0, 1, 1,
-0.9901557, 0.6510123, -0.5344447, 0, 0, 0, 1, 1,
-0.9890568, -2.959532, -5.506069, 0, 0, 0, 1, 1,
-0.9867666, 0.539404, -2.248043, 0, 0, 0, 1, 1,
-0.9769436, -0.3313895, -2.427451, 0, 0, 0, 1, 1,
-0.9755982, -0.09317077, -3.318651, 0, 0, 0, 1, 1,
-0.9694516, 0.4608382, -2.285622, 0, 0, 0, 1, 1,
-0.9685847, -0.4301875, -2.020552, 0, 0, 0, 1, 1,
-0.9666714, -1.083269, -2.88139, 1, 1, 1, 1, 1,
-0.9654589, 0.2177529, -0.8970736, 1, 1, 1, 1, 1,
-0.9620606, -1.722267, -2.640129, 1, 1, 1, 1, 1,
-0.9564115, 0.1697455, -0.03704815, 1, 1, 1, 1, 1,
-0.9554942, 0.8300748, -0.2812292, 1, 1, 1, 1, 1,
-0.9517593, 0.1392598, -0.9407481, 1, 1, 1, 1, 1,
-0.9489446, 0.2763738, -0.6838868, 1, 1, 1, 1, 1,
-0.9414575, -0.5911578, -3.227596, 1, 1, 1, 1, 1,
-0.9385135, 1.67693, -2.942053, 1, 1, 1, 1, 1,
-0.9243127, 0.3545274, 0.1803449, 1, 1, 1, 1, 1,
-0.9170459, -0.3700504, -1.82681, 1, 1, 1, 1, 1,
-0.9166682, 0.07135892, -0.5840606, 1, 1, 1, 1, 1,
-0.9142115, -0.1726271, -1.603427, 1, 1, 1, 1, 1,
-0.9098816, 0.01729572, -2.308337, 1, 1, 1, 1, 1,
-0.9061353, 0.9622929, 0.6685556, 1, 1, 1, 1, 1,
-0.9053841, 0.9687184, 0.2152325, 0, 0, 1, 1, 1,
-0.9017798, 0.3519212, -1.166633, 1, 0, 0, 1, 1,
-0.899406, 0.8317062, -1.145924, 1, 0, 0, 1, 1,
-0.8983266, -1.587086, -1.518157, 1, 0, 0, 1, 1,
-0.8930117, -0.08460552, 0.1443568, 1, 0, 0, 1, 1,
-0.8890471, -1.299466, -4.580843, 1, 0, 0, 1, 1,
-0.8876044, -1.373164, -2.476068, 0, 0, 0, 1, 1,
-0.8847444, 2.054337, -0.3103861, 0, 0, 0, 1, 1,
-0.8823878, -0.2721858, -1.955496, 0, 0, 0, 1, 1,
-0.8804923, -0.06171104, -1.386165, 0, 0, 0, 1, 1,
-0.8782728, 0.02745121, 0.6853343, 0, 0, 0, 1, 1,
-0.8758103, 0.9605597, -2.6887, 0, 0, 0, 1, 1,
-0.8641865, -0.743068, -4.920075, 0, 0, 0, 1, 1,
-0.8615581, 1.362455, -0.409804, 1, 1, 1, 1, 1,
-0.8590627, 0.5376111, 1.120198, 1, 1, 1, 1, 1,
-0.8568383, -0.03289965, -0.2849508, 1, 1, 1, 1, 1,
-0.8560667, -0.5875301, -4.341081, 1, 1, 1, 1, 1,
-0.8524467, -0.9676241, -3.195991, 1, 1, 1, 1, 1,
-0.8523555, 0.5235285, -0.2189493, 1, 1, 1, 1, 1,
-0.8489875, 0.3568715, -0.7458072, 1, 1, 1, 1, 1,
-0.8466361, 2.17105, -1.260952, 1, 1, 1, 1, 1,
-0.8446193, 0.07710817, -2.42602, 1, 1, 1, 1, 1,
-0.8440303, -0.6508198, -3.175881, 1, 1, 1, 1, 1,
-0.8327571, -0.982324, -2.265244, 1, 1, 1, 1, 1,
-0.8222669, -0.922527, -2.749018, 1, 1, 1, 1, 1,
-0.8158085, 0.5199991, -0.2289411, 1, 1, 1, 1, 1,
-0.8135968, -1.35434, -1.134411, 1, 1, 1, 1, 1,
-0.8069898, 0.7970213, 0.1765219, 1, 1, 1, 1, 1,
-0.8002632, -0.2677609, 0.3987218, 0, 0, 1, 1, 1,
-0.7986189, 0.671368, 0.7607554, 1, 0, 0, 1, 1,
-0.7955943, -0.4173536, -2.613511, 1, 0, 0, 1, 1,
-0.7948931, 0.5676882, -0.3818467, 1, 0, 0, 1, 1,
-0.7933409, -0.6508062, -2.787728, 1, 0, 0, 1, 1,
-0.7889755, -0.2983135, -1.392843, 1, 0, 0, 1, 1,
-0.7885416, -0.5468662, -2.184877, 0, 0, 0, 1, 1,
-0.7860807, -0.03760002, -0.4281489, 0, 0, 0, 1, 1,
-0.7809672, 0.1868162, -0.9518974, 0, 0, 0, 1, 1,
-0.7780802, 0.7142857, -2.195977, 0, 0, 0, 1, 1,
-0.7764415, -0.7189947, -1.920833, 0, 0, 0, 1, 1,
-0.7664273, -0.971884, -3.784682, 0, 0, 0, 1, 1,
-0.7618462, 1.530879, -0.1578383, 0, 0, 0, 1, 1,
-0.7569401, 0.006203094, -1.32318, 1, 1, 1, 1, 1,
-0.749165, 1.371281, -0.9382824, 1, 1, 1, 1, 1,
-0.7438462, 1.341696, 0.7247546, 1, 1, 1, 1, 1,
-0.7370504, 0.4643495, -1.725065, 1, 1, 1, 1, 1,
-0.7370281, 0.491146, -1.938793, 1, 1, 1, 1, 1,
-0.7358784, 0.1447641, -0.115351, 1, 1, 1, 1, 1,
-0.727838, -0.5370738, -2.613412, 1, 1, 1, 1, 1,
-0.7261902, -1.074828, -3.68592, 1, 1, 1, 1, 1,
-0.7227101, -2.12238, -1.885301, 1, 1, 1, 1, 1,
-0.7201492, -0.1876173, -0.6153039, 1, 1, 1, 1, 1,
-0.7135825, -0.6303247, -2.903231, 1, 1, 1, 1, 1,
-0.7122166, 0.449014, 0.4089647, 1, 1, 1, 1, 1,
-0.7039765, -2.017412, -1.73446, 1, 1, 1, 1, 1,
-0.7022133, 0.002102387, -0.1468788, 1, 1, 1, 1, 1,
-0.6974385, 0.9520199, -1.261079, 1, 1, 1, 1, 1,
-0.6964957, -0.9368159, -3.1703, 0, 0, 1, 1, 1,
-0.6953877, -0.6156737, -1.635734, 1, 0, 0, 1, 1,
-0.6835, -0.4498984, -2.562834, 1, 0, 0, 1, 1,
-0.6797203, 0.2198779, -1.887071, 1, 0, 0, 1, 1,
-0.6793507, 0.1487529, 0.1091015, 1, 0, 0, 1, 1,
-0.6759285, 0.9754907, -0.2666049, 1, 0, 0, 1, 1,
-0.6698686, -0.4074974, -2.399053, 0, 0, 0, 1, 1,
-0.6696749, -0.8885422, -3.483707, 0, 0, 0, 1, 1,
-0.6693251, 0.7363737, -0.8295321, 0, 0, 0, 1, 1,
-0.6647782, 0.7599037, -0.3649005, 0, 0, 0, 1, 1,
-0.6624519, 0.9345888, -0.8172271, 0, 0, 0, 1, 1,
-0.6612216, 1.149009, 0.7882795, 0, 0, 0, 1, 1,
-0.6595232, -0.6563749, -1.970893, 0, 0, 0, 1, 1,
-0.657813, 0.300416, 0.2798735, 1, 1, 1, 1, 1,
-0.6496701, -0.6315678, -2.826051, 1, 1, 1, 1, 1,
-0.6483203, -0.5305409, -1.321636, 1, 1, 1, 1, 1,
-0.6462319, -0.9499034, -1.744677, 1, 1, 1, 1, 1,
-0.6419712, 0.3859369, -1.127864, 1, 1, 1, 1, 1,
-0.6372611, -0.4024723, -2.031141, 1, 1, 1, 1, 1,
-0.6366992, 0.6598894, -0.7842118, 1, 1, 1, 1, 1,
-0.6353835, -0.2316754, -2.111628, 1, 1, 1, 1, 1,
-0.6316406, -1.461425, -0.6269071, 1, 1, 1, 1, 1,
-0.626593, -0.6748608, -4.040626, 1, 1, 1, 1, 1,
-0.6247662, -1.863317, -4.061053, 1, 1, 1, 1, 1,
-0.6207457, -1.238371, -2.362058, 1, 1, 1, 1, 1,
-0.6187921, -0.5800385, -1.969391, 1, 1, 1, 1, 1,
-0.6182884, -0.6958874, -3.339881, 1, 1, 1, 1, 1,
-0.617646, 0.05978838, -1.84646, 1, 1, 1, 1, 1,
-0.6173205, -0.7396149, -0.1927354, 0, 0, 1, 1, 1,
-0.6170695, 0.302341, -1.543183, 1, 0, 0, 1, 1,
-0.612703, -0.31467, -3.380401, 1, 0, 0, 1, 1,
-0.6110779, 0.371603, 1.234482, 1, 0, 0, 1, 1,
-0.6103186, 2.172869, -0.6103998, 1, 0, 0, 1, 1,
-0.6098876, -0.1855736, -2.383052, 1, 0, 0, 1, 1,
-0.607655, -0.7973667, -2.663818, 0, 0, 0, 1, 1,
-0.6002029, 0.2537195, 0.02853541, 0, 0, 0, 1, 1,
-0.596531, -0.4839966, -3.392246, 0, 0, 0, 1, 1,
-0.5963308, -1.203583, -2.466973, 0, 0, 0, 1, 1,
-0.586378, 1.28957, -1.340344, 0, 0, 0, 1, 1,
-0.5851824, -0.3690193, -3.371785, 0, 0, 0, 1, 1,
-0.5843161, 0.9507946, -1.28187, 0, 0, 0, 1, 1,
-0.583621, 0.4999205, -2.39438, 1, 1, 1, 1, 1,
-0.583154, -0.07160804, 0.204158, 1, 1, 1, 1, 1,
-0.5769361, -0.3098051, -1.38323, 1, 1, 1, 1, 1,
-0.5764511, 0.8903894, -1.883075, 1, 1, 1, 1, 1,
-0.575969, 1.020356, -1.981816, 1, 1, 1, 1, 1,
-0.568918, 0.4865359, -1.723192, 1, 1, 1, 1, 1,
-0.568712, -0.6024105, -2.68674, 1, 1, 1, 1, 1,
-0.5677664, -1.03857, -1.405493, 1, 1, 1, 1, 1,
-0.5676632, -1.678602, -1.951867, 1, 1, 1, 1, 1,
-0.5661955, -1.600286, -3.283248, 1, 1, 1, 1, 1,
-0.5661284, -1.276168, -3.015141, 1, 1, 1, 1, 1,
-0.562109, -0.1631672, -2.239552, 1, 1, 1, 1, 1,
-0.5607119, 0.6483528, 0.1061937, 1, 1, 1, 1, 1,
-0.555546, -1.523287, -5.28269, 1, 1, 1, 1, 1,
-0.5532702, -0.554538, -0.7900999, 1, 1, 1, 1, 1,
-0.552032, -0.075363, -1.759386, 0, 0, 1, 1, 1,
-0.5518059, -0.4746873, -1.842925, 1, 0, 0, 1, 1,
-0.5467122, 0.4757258, 0.6206185, 1, 0, 0, 1, 1,
-0.5433444, -0.2154676, -3.410442, 1, 0, 0, 1, 1,
-0.5405489, 1.085155, 0.1957938, 1, 0, 0, 1, 1,
-0.5400437, 0.3761557, -0.843025, 1, 0, 0, 1, 1,
-0.5381485, 0.2306289, 0.4319347, 0, 0, 0, 1, 1,
-0.5377854, 0.817839, 0.6797017, 0, 0, 0, 1, 1,
-0.5375905, 1.963719, -0.2462437, 0, 0, 0, 1, 1,
-0.5365513, 0.5646299, 0.1926214, 0, 0, 0, 1, 1,
-0.535019, -0.5411149, -2.346032, 0, 0, 0, 1, 1,
-0.5340592, 0.3825602, -2.819385, 0, 0, 0, 1, 1,
-0.5325862, 2.300408, -0.6245512, 0, 0, 0, 1, 1,
-0.5260711, 0.5039089, -1.780796, 1, 1, 1, 1, 1,
-0.5215228, -0.7026868, -2.426715, 1, 1, 1, 1, 1,
-0.5210437, -0.2005735, -0.8338307, 1, 1, 1, 1, 1,
-0.5192947, 0.9797586, 0.3063854, 1, 1, 1, 1, 1,
-0.5039301, 2.26598, 0.4323171, 1, 1, 1, 1, 1,
-0.5032706, -0.1645238, -1.057325, 1, 1, 1, 1, 1,
-0.5016195, -1.328479, -2.338333, 1, 1, 1, 1, 1,
-0.4984224, 0.1171297, -2.218615, 1, 1, 1, 1, 1,
-0.4952427, -1.52276, -4.793808, 1, 1, 1, 1, 1,
-0.4816487, -0.2023129, -2.129874, 1, 1, 1, 1, 1,
-0.4811856, 0.8722348, -0.2856955, 1, 1, 1, 1, 1,
-0.4798124, -1.946321, -3.454961, 1, 1, 1, 1, 1,
-0.4782386, 0.9041368, 1.366364, 1, 1, 1, 1, 1,
-0.4781945, -1.188208, -4.759191, 1, 1, 1, 1, 1,
-0.477857, 1.862461, -1.945141, 1, 1, 1, 1, 1,
-0.4752897, 1.613845, -1.184779, 0, 0, 1, 1, 1,
-0.4684389, -0.7837585, -2.217697, 1, 0, 0, 1, 1,
-0.4628835, 1.233032, 0.1627363, 1, 0, 0, 1, 1,
-0.4573083, -0.4260394, -1.853869, 1, 0, 0, 1, 1,
-0.4565174, 0.3664041, -3.865435, 1, 0, 0, 1, 1,
-0.4546857, 1.198376, 0.06855453, 1, 0, 0, 1, 1,
-0.4546454, -1.292079, -2.729238, 0, 0, 0, 1, 1,
-0.4535202, -0.02929417, -4.210094, 0, 0, 0, 1, 1,
-0.4505745, 0.2126926, -1.805165, 0, 0, 0, 1, 1,
-0.4487801, -0.2743265, -1.145666, 0, 0, 0, 1, 1,
-0.4420833, 0.6685618, -0.209125, 0, 0, 0, 1, 1,
-0.4414748, -1.21314, -2.283887, 0, 0, 0, 1, 1,
-0.4388954, -0.4961999, -5.2389, 0, 0, 0, 1, 1,
-0.4379446, 0.7691678, -1.884348, 1, 1, 1, 1, 1,
-0.4344403, 1.844512, -1.183923, 1, 1, 1, 1, 1,
-0.4329159, -0.04110228, 0.041047, 1, 1, 1, 1, 1,
-0.4320755, 0.2066616, -0.9866461, 1, 1, 1, 1, 1,
-0.4285062, 1.008511, 0.6826001, 1, 1, 1, 1, 1,
-0.4276705, -0.0005245403, -2.975214, 1, 1, 1, 1, 1,
-0.4252421, -0.4288534, -0.8453033, 1, 1, 1, 1, 1,
-0.4251808, 1.27608, -0.3444779, 1, 1, 1, 1, 1,
-0.4250211, -1.71787, -2.405232, 1, 1, 1, 1, 1,
-0.4235121, 0.1381354, -4.086879, 1, 1, 1, 1, 1,
-0.418853, 0.4192761, -2.144015, 1, 1, 1, 1, 1,
-0.4140623, -1.881577, -3.123081, 1, 1, 1, 1, 1,
-0.4050686, 0.2358675, -0.8165661, 1, 1, 1, 1, 1,
-0.4026051, -0.1996111, -2.878321, 1, 1, 1, 1, 1,
-0.4007752, 1.649813, 1.896275, 1, 1, 1, 1, 1,
-0.3980695, 1.255269, -1.239717, 0, 0, 1, 1, 1,
-0.3961247, -1.271586, -2.946958, 1, 0, 0, 1, 1,
-0.3951969, -0.06389427, -2.372462, 1, 0, 0, 1, 1,
-0.3929667, 0.5030863, -0.3371033, 1, 0, 0, 1, 1,
-0.3869841, -1.396262, -4.316661, 1, 0, 0, 1, 1,
-0.3868115, 1.158673, -0.8958443, 1, 0, 0, 1, 1,
-0.3834405, -1.390169, -3.794015, 0, 0, 0, 1, 1,
-0.3797199, -0.08047843, -1.132316, 0, 0, 0, 1, 1,
-0.3772605, -0.4680451, -1.255222, 0, 0, 0, 1, 1,
-0.3762071, 0.1480319, -2.09967, 0, 0, 0, 1, 1,
-0.3715035, 1.175268, 0.4116626, 0, 0, 0, 1, 1,
-0.3676525, 1.147937, -1.411479, 0, 0, 0, 1, 1,
-0.3660562, -1.149326, -4.85133, 0, 0, 0, 1, 1,
-0.3645707, -0.1021971, -2.095526, 1, 1, 1, 1, 1,
-0.3601416, -0.957004, -1.549725, 1, 1, 1, 1, 1,
-0.3590835, -0.6577011, -1.609692, 1, 1, 1, 1, 1,
-0.3578583, -0.7279251, -1.282789, 1, 1, 1, 1, 1,
-0.3547839, -1.039907, -2.795883, 1, 1, 1, 1, 1,
-0.354733, -0.1577089, -1.650946, 1, 1, 1, 1, 1,
-0.3531222, -0.2126444, -1.775944, 1, 1, 1, 1, 1,
-0.3530158, 0.8560575, -0.3710681, 1, 1, 1, 1, 1,
-0.3473432, -0.1311834, -1.848399, 1, 1, 1, 1, 1,
-0.3465248, -0.09865455, -0.3915986, 1, 1, 1, 1, 1,
-0.3348299, 0.9275928, -0.02866338, 1, 1, 1, 1, 1,
-0.3347709, -1.438442, -3.30676, 1, 1, 1, 1, 1,
-0.3344834, -0.6414429, -2.556391, 1, 1, 1, 1, 1,
-0.3343019, -1.065419, -2.672049, 1, 1, 1, 1, 1,
-0.3312028, 0.09399218, -1.143821, 1, 1, 1, 1, 1,
-0.330053, 0.6724555, -0.3109657, 0, 0, 1, 1, 1,
-0.3290404, -0.3211059, -2.462264, 1, 0, 0, 1, 1,
-0.3287311, -0.8745505, -4.264946, 1, 0, 0, 1, 1,
-0.327361, -0.5969905, -3.039711, 1, 0, 0, 1, 1,
-0.3255262, -1.448969, -2.08736, 1, 0, 0, 1, 1,
-0.3253459, 0.446174, 0.6481887, 1, 0, 0, 1, 1,
-0.3214026, -1.192154, -2.227883, 0, 0, 0, 1, 1,
-0.3177306, -1.377537, -1.595206, 0, 0, 0, 1, 1,
-0.3151278, -0.6493679, -1.909817, 0, 0, 0, 1, 1,
-0.3145061, 0.441619, -1.0084, 0, 0, 0, 1, 1,
-0.3137096, -0.3105336, -2.977487, 0, 0, 0, 1, 1,
-0.3125235, 0.2684954, -3.276401, 0, 0, 0, 1, 1,
-0.3042837, 0.7680832, 0.9011197, 0, 0, 0, 1, 1,
-0.2981055, -0.08708367, -0.5118988, 1, 1, 1, 1, 1,
-0.297483, 0.4607272, 0.2050839, 1, 1, 1, 1, 1,
-0.2974371, 0.6947013, -0.4896052, 1, 1, 1, 1, 1,
-0.2941784, -0.8885444, -0.7407689, 1, 1, 1, 1, 1,
-0.2819035, -0.9298084, -3.725476, 1, 1, 1, 1, 1,
-0.2804208, 0.09988034, -1.65792, 1, 1, 1, 1, 1,
-0.2781979, 0.6644, -0.1089461, 1, 1, 1, 1, 1,
-0.2748871, -0.3147992, -1.454185, 1, 1, 1, 1, 1,
-0.273862, -0.08380922, -1.9157, 1, 1, 1, 1, 1,
-0.2727708, 0.1517109, -0.9758275, 1, 1, 1, 1, 1,
-0.2709565, 1.052864, -0.5483434, 1, 1, 1, 1, 1,
-0.2679344, -0.3328575, -3.075145, 1, 1, 1, 1, 1,
-0.2653775, 0.5934902, 0.4017286, 1, 1, 1, 1, 1,
-0.2649424, 0.02415897, -0.4678443, 1, 1, 1, 1, 1,
-0.2638639, -0.150256, -2.338193, 1, 1, 1, 1, 1,
-0.2580276, -0.9159265, -3.776223, 0, 0, 1, 1, 1,
-0.2519906, 1.137222, -0.1457224, 1, 0, 0, 1, 1,
-0.2517058, 0.3925585, 0.442773, 1, 0, 0, 1, 1,
-0.2477728, -2.001191, -2.612265, 1, 0, 0, 1, 1,
-0.2457998, -0.6911831, -2.619743, 1, 0, 0, 1, 1,
-0.2437527, 0.6177623, -0.08398906, 1, 0, 0, 1, 1,
-0.2423089, 1.357306, -1.966785, 0, 0, 0, 1, 1,
-0.2416845, -0.604789, -3.473064, 0, 0, 0, 1, 1,
-0.2416207, 0.4937476, -0.4432464, 0, 0, 0, 1, 1,
-0.2383734, -0.376588, -3.227989, 0, 0, 0, 1, 1,
-0.2352912, -0.3689263, -1.632379, 0, 0, 0, 1, 1,
-0.233223, -0.8101909, -4.636507, 0, 0, 0, 1, 1,
-0.2329221, -0.8862454, -3.148106, 0, 0, 0, 1, 1,
-0.2327372, 0.5184489, -1.135216, 1, 1, 1, 1, 1,
-0.2293178, -0.9112185, -2.738673, 1, 1, 1, 1, 1,
-0.2262812, 0.8490962, -1.376926, 1, 1, 1, 1, 1,
-0.2242139, 2.072205, -0.4579293, 1, 1, 1, 1, 1,
-0.2241626, -0.03781258, -1.269782, 1, 1, 1, 1, 1,
-0.2237318, -0.008849486, -1.177776, 1, 1, 1, 1, 1,
-0.2201073, -1.590357, -3.841763, 1, 1, 1, 1, 1,
-0.2187763, 0.02286508, -0.336842, 1, 1, 1, 1, 1,
-0.2162166, -0.9040027, -2.098198, 1, 1, 1, 1, 1,
-0.2099915, -0.7000257, -1.979324, 1, 1, 1, 1, 1,
-0.20403, 0.7194296, -0.8261706, 1, 1, 1, 1, 1,
-0.1969377, 0.358164, -1.13169, 1, 1, 1, 1, 1,
-0.1965995, -1.468831, -3.203142, 1, 1, 1, 1, 1,
-0.1964821, 0.7134401, -0.2850438, 1, 1, 1, 1, 1,
-0.1955106, 2.458167, -0.4614848, 1, 1, 1, 1, 1,
-0.1906348, 0.2304077, -0.8719484, 0, 0, 1, 1, 1,
-0.1858994, -0.4072602, -2.69055, 1, 0, 0, 1, 1,
-0.1804879, -1.214768, -3.442072, 1, 0, 0, 1, 1,
-0.172712, 1.413652, 0.8556401, 1, 0, 0, 1, 1,
-0.1707479, 1.158415, 0.4336801, 1, 0, 0, 1, 1,
-0.1691832, -0.01944263, -2.582102, 1, 0, 0, 1, 1,
-0.161668, -1.807685, -1.753479, 0, 0, 0, 1, 1,
-0.1596393, 0.1391152, -0.616165, 0, 0, 0, 1, 1,
-0.1484089, -0.2489692, -2.081946, 0, 0, 0, 1, 1,
-0.148077, -1.111097, -2.698618, 0, 0, 0, 1, 1,
-0.1433089, 0.8129522, 0.8237802, 0, 0, 0, 1, 1,
-0.139699, -0.06077756, -3.122919, 0, 0, 0, 1, 1,
-0.1380102, -0.3679305, -1.819316, 0, 0, 0, 1, 1,
-0.1345496, -1.41559, -1.997653, 1, 1, 1, 1, 1,
-0.1344408, 0.297159, -0.6434937, 1, 1, 1, 1, 1,
-0.1318032, 0.0611575, -1.368354, 1, 1, 1, 1, 1,
-0.1306497, -2.114008, -3.878022, 1, 1, 1, 1, 1,
-0.1302675, 0.8113972, 0.4138545, 1, 1, 1, 1, 1,
-0.1299442, -0.4210512, -3.038614, 1, 1, 1, 1, 1,
-0.1299423, 1.863525, 0.04018196, 1, 1, 1, 1, 1,
-0.1200665, 0.420372, -1.914819, 1, 1, 1, 1, 1,
-0.1191196, -0.3514782, -3.789207, 1, 1, 1, 1, 1,
-0.1187313, -1.316444, -2.535862, 1, 1, 1, 1, 1,
-0.1156965, -0.7745264, -1.890105, 1, 1, 1, 1, 1,
-0.1149956, 1.452229, 0.004821432, 1, 1, 1, 1, 1,
-0.1145584, -0.675786, -1.971647, 1, 1, 1, 1, 1,
-0.1137366, 1.813855, -0.3373342, 1, 1, 1, 1, 1,
-0.1132866, -0.3801582, -3.030251, 1, 1, 1, 1, 1,
-0.1082344, -1.121689, -2.6423, 0, 0, 1, 1, 1,
-0.1074147, 0.4409289, -0.9620584, 1, 0, 0, 1, 1,
-0.1064707, -0.882467, -2.060515, 1, 0, 0, 1, 1,
-0.1061932, -1.138739, -2.897929, 1, 0, 0, 1, 1,
-0.103684, -0.2915482, -2.948546, 1, 0, 0, 1, 1,
-0.09668355, -0.454203, -2.820624, 1, 0, 0, 1, 1,
-0.09648623, 1.784714, 1.201109, 0, 0, 0, 1, 1,
-0.09588543, 1.497656, -1.094471, 0, 0, 0, 1, 1,
-0.09102033, -0.6322495, -2.95283, 0, 0, 0, 1, 1,
-0.09025682, 0.9104447, 0.2842973, 0, 0, 0, 1, 1,
-0.08782119, -0.9810269, -3.699866, 0, 0, 0, 1, 1,
-0.08290195, -0.3589279, -2.666039, 0, 0, 0, 1, 1,
-0.08136521, 0.8425884, 0.3532861, 0, 0, 0, 1, 1,
-0.08116379, 0.03012299, -1.724466, 1, 1, 1, 1, 1,
-0.08020446, -2.653274, -3.214498, 1, 1, 1, 1, 1,
-0.07777885, -0.3253192, -4.001899, 1, 1, 1, 1, 1,
-0.07597733, -0.7558571, -1.853925, 1, 1, 1, 1, 1,
-0.07505178, 1.157176, 0.128061, 1, 1, 1, 1, 1,
-0.07495201, 0.1413139, 1.677106, 1, 1, 1, 1, 1,
-0.07464589, -0.136911, -3.732579, 1, 1, 1, 1, 1,
-0.07352663, -0.4715021, -3.01693, 1, 1, 1, 1, 1,
-0.06629025, 0.2013291, 0.655441, 1, 1, 1, 1, 1,
-0.06593515, -0.6365469, -3.608108, 1, 1, 1, 1, 1,
-0.06569941, -0.9245299, -3.078134, 1, 1, 1, 1, 1,
-0.0636541, 1.576752, 0.199288, 1, 1, 1, 1, 1,
-0.06354824, -0.05136009, -1.22768, 1, 1, 1, 1, 1,
-0.06349785, 0.7764499, -2.718126, 1, 1, 1, 1, 1,
-0.0634978, -0.2846065, -2.106976, 1, 1, 1, 1, 1,
-0.05986017, 0.6300494, 0.3372066, 0, 0, 1, 1, 1,
-0.05959043, -0.3018638, -3.08272, 1, 0, 0, 1, 1,
-0.05755265, 0.7804716, -0.1089912, 1, 0, 0, 1, 1,
-0.05391033, -1.233931, -1.220983, 1, 0, 0, 1, 1,
-0.05105434, -0.0478662, -3.518952, 1, 0, 0, 1, 1,
-0.04992079, 0.02516041, -0.2096877, 1, 0, 0, 1, 1,
-0.04383097, 1.82715, -0.2625326, 0, 0, 0, 1, 1,
-0.04248586, -0.04909899, -4.415638, 0, 0, 0, 1, 1,
-0.04181338, 1.404531, -1.265307, 0, 0, 0, 1, 1,
-0.04096416, -0.7623193, -2.549833, 0, 0, 0, 1, 1,
-0.03737601, -0.5775332, -2.715308, 0, 0, 0, 1, 1,
-0.03559253, 0.1357165, -1.377006, 0, 0, 0, 1, 1,
-0.0351634, 0.4980019, -2.861904, 0, 0, 0, 1, 1,
-0.03355534, -0.08099566, -4.173418, 1, 1, 1, 1, 1,
-0.01995379, 1.234669, -0.5368275, 1, 1, 1, 1, 1,
-0.01515005, -1.155241, -2.424783, 1, 1, 1, 1, 1,
-0.006988605, -1.384398, -3.413154, 1, 1, 1, 1, 1,
-0.003421901, 1.283777, 0.4845801, 1, 1, 1, 1, 1,
-0.002818082, 0.5702873, -1.750382, 1, 1, 1, 1, 1,
-0.0009366248, 0.2927302, -0.5651137, 1, 1, 1, 1, 1,
0.001097447, -0.9493392, 2.930579, 1, 1, 1, 1, 1,
0.0046071, -0.4287913, 4.261148, 1, 1, 1, 1, 1,
0.006320271, -0.1912795, 3.865987, 1, 1, 1, 1, 1,
0.008158438, -0.9026847, 3.869476, 1, 1, 1, 1, 1,
0.008845404, 0.3467515, -0.9322268, 1, 1, 1, 1, 1,
0.01168518, -1.171717, 2.854554, 1, 1, 1, 1, 1,
0.01273799, -1.927165, 4.118983, 1, 1, 1, 1, 1,
0.02116428, 0.8953117, -0.5532901, 1, 1, 1, 1, 1,
0.02746447, 0.5743046, 2.209453, 0, 0, 1, 1, 1,
0.02951909, 0.4984535, -0.6907169, 1, 0, 0, 1, 1,
0.03172495, -0.1495276, 2.930642, 1, 0, 0, 1, 1,
0.0329015, 0.1992872, 0.7520175, 1, 0, 0, 1, 1,
0.03985482, -1.212151, 1.170754, 1, 0, 0, 1, 1,
0.0409142, -0.7684666, 5.432029, 1, 0, 0, 1, 1,
0.04121426, 1.241604, -1.658227, 0, 0, 0, 1, 1,
0.04301164, 0.3545138, -0.1504031, 0, 0, 0, 1, 1,
0.04868322, -0.3834148, 2.754929, 0, 0, 0, 1, 1,
0.05242075, -0.7166143, 1.790314, 0, 0, 0, 1, 1,
0.052456, -0.1208244, 1.616419, 0, 0, 0, 1, 1,
0.05473193, 0.7068104, 1.006054, 0, 0, 0, 1, 1,
0.05699681, -0.2735792, 4.51069, 0, 0, 0, 1, 1,
0.05816053, 0.3543224, -0.6427606, 1, 1, 1, 1, 1,
0.05824941, -1.289624, 5.639215, 1, 1, 1, 1, 1,
0.06406535, -0.899808, 2.867269, 1, 1, 1, 1, 1,
0.06681223, 0.5803923, 1.513636, 1, 1, 1, 1, 1,
0.06815229, 0.4281782, 0.1871916, 1, 1, 1, 1, 1,
0.06990773, 1.264513, 1.350209, 1, 1, 1, 1, 1,
0.07164558, 1.002946, 0.7949908, 1, 1, 1, 1, 1,
0.07506859, -1.160787, 4.571483, 1, 1, 1, 1, 1,
0.07600557, 1.172152, 0.173622, 1, 1, 1, 1, 1,
0.07628351, 0.3411428, 0.6636672, 1, 1, 1, 1, 1,
0.07860671, -1.032171, 3.034604, 1, 1, 1, 1, 1,
0.07867206, -0.4229799, 1.843307, 1, 1, 1, 1, 1,
0.07891311, -0.1107812, 3.0099, 1, 1, 1, 1, 1,
0.07904998, 1.524153, -0.01926873, 1, 1, 1, 1, 1,
0.08129483, -0.2189827, 2.134615, 1, 1, 1, 1, 1,
0.08498765, 1.436197, -0.1715591, 0, 0, 1, 1, 1,
0.08524355, -0.2325587, 2.542082, 1, 0, 0, 1, 1,
0.08554612, -0.4558582, 1.869702, 1, 0, 0, 1, 1,
0.0881069, -0.2865602, 4.610595, 1, 0, 0, 1, 1,
0.08960134, 1.298063, -1.117964, 1, 0, 0, 1, 1,
0.09664608, 0.02796373, 1.658022, 1, 0, 0, 1, 1,
0.09963333, 0.815097, 1.089627, 0, 0, 0, 1, 1,
0.1003009, -0.6070076, 3.210642, 0, 0, 0, 1, 1,
0.1013185, 0.8628547, -0.01380532, 0, 0, 0, 1, 1,
0.1028637, 0.9631015, 1.504381, 0, 0, 0, 1, 1,
0.1084765, -0.1854965, 2.646179, 0, 0, 0, 1, 1,
0.1124362, -1.637903, 3.961224, 0, 0, 0, 1, 1,
0.1128295, 1.003182, 0.2577309, 0, 0, 0, 1, 1,
0.1130477, 0.4277311, -0.08024306, 1, 1, 1, 1, 1,
0.115222, -1.355942, 2.027705, 1, 1, 1, 1, 1,
0.1155901, 1.330498, 0.2200531, 1, 1, 1, 1, 1,
0.1184571, 1.062707, -0.7454013, 1, 1, 1, 1, 1,
0.1215143, 0.2054132, 0.8982719, 1, 1, 1, 1, 1,
0.122885, -1.200376, 6.608442, 1, 1, 1, 1, 1,
0.1254825, 0.4718437, 0.09326418, 1, 1, 1, 1, 1,
0.1267741, -0.3681987, 4.191133, 1, 1, 1, 1, 1,
0.1277952, -0.5442837, 2.343377, 1, 1, 1, 1, 1,
0.1307681, 1.198944, 0.3784505, 1, 1, 1, 1, 1,
0.1315269, -2.324442, 4.467569, 1, 1, 1, 1, 1,
0.132327, 0.1658763, -0.0432418, 1, 1, 1, 1, 1,
0.1404619, -2.237734, 2.797268, 1, 1, 1, 1, 1,
0.1407657, 0.3963411, 0.01494747, 1, 1, 1, 1, 1,
0.1414495, -0.6405967, 3.818275, 1, 1, 1, 1, 1,
0.1426692, -1.411688, 3.001678, 0, 0, 1, 1, 1,
0.1432319, 1.170628, 0.5387749, 1, 0, 0, 1, 1,
0.1515045, 0.7709175, 0.1882333, 1, 0, 0, 1, 1,
0.1535385, -1.121698, 3.286399, 1, 0, 0, 1, 1,
0.1537179, 1.137061, 0.9519014, 1, 0, 0, 1, 1,
0.1581366, -0.1845442, 2.540006, 1, 0, 0, 1, 1,
0.1591712, 1.326652, -0.07819156, 0, 0, 0, 1, 1,
0.1595421, 2.354561, -0.5168039, 0, 0, 0, 1, 1,
0.1605794, -1.580973, 3.765087, 0, 0, 0, 1, 1,
0.1612719, 1.108984, -0.6113258, 0, 0, 0, 1, 1,
0.1702719, 1.39286, 0.853341, 0, 0, 0, 1, 1,
0.1715737, 0.4584768, -0.03297235, 0, 0, 0, 1, 1,
0.1747889, 1.473589, -0.6111469, 0, 0, 0, 1, 1,
0.1841215, -1.102036, 2.719662, 1, 1, 1, 1, 1,
0.185167, -0.1999433, 1.64355, 1, 1, 1, 1, 1,
0.1972087, 0.1570692, 0.5978565, 1, 1, 1, 1, 1,
0.2027771, -0.4563686, 2.711083, 1, 1, 1, 1, 1,
0.2028001, -0.6936963, 2.290054, 1, 1, 1, 1, 1,
0.2029795, 0.8726675, 0.733414, 1, 1, 1, 1, 1,
0.2105728, 1.826233, -0.8472466, 1, 1, 1, 1, 1,
0.2224202, -2.199507, 4.181798, 1, 1, 1, 1, 1,
0.2274238, -2.198316, -0.01283435, 1, 1, 1, 1, 1,
0.2288819, 0.3544325, 0.6721138, 1, 1, 1, 1, 1,
0.2297813, 0.8756646, -0.6395163, 1, 1, 1, 1, 1,
0.2304425, -0.404188, 1.808739, 1, 1, 1, 1, 1,
0.2310216, -0.2647729, 1.286481, 1, 1, 1, 1, 1,
0.2311205, 0.875795, 0.8367169, 1, 1, 1, 1, 1,
0.2321116, -0.4352906, 2.198128, 1, 1, 1, 1, 1,
0.2327499, -0.07240526, 0.8303077, 0, 0, 1, 1, 1,
0.2338997, -0.5021616, 4.258478, 1, 0, 0, 1, 1,
0.2345188, -0.6540931, 2.029475, 1, 0, 0, 1, 1,
0.2348062, -0.5305445, 3.124122, 1, 0, 0, 1, 1,
0.2365092, -0.7260793, 0.7854962, 1, 0, 0, 1, 1,
0.2400483, 0.5392135, 0.4581023, 1, 0, 0, 1, 1,
0.2570808, -0.2483251, 2.770069, 0, 0, 0, 1, 1,
0.2593923, -0.5324684, 1.892124, 0, 0, 0, 1, 1,
0.2616194, -1.047946, 2.676644, 0, 0, 0, 1, 1,
0.2628352, 0.3634949, -0.2464605, 0, 0, 0, 1, 1,
0.2643148, -1.226284, 3.413411, 0, 0, 0, 1, 1,
0.2645608, -0.04280723, 2.377495, 0, 0, 0, 1, 1,
0.2665226, 0.627332, -1.461012, 0, 0, 0, 1, 1,
0.2672559, 2.881571, 1.63068, 1, 1, 1, 1, 1,
0.2699918, 1.671711, -1.173982, 1, 1, 1, 1, 1,
0.2712187, -0.8123493, 3.085919, 1, 1, 1, 1, 1,
0.27993, 1.388418, -0.0005622756, 1, 1, 1, 1, 1,
0.2859738, 0.7949356, 0.6991541, 1, 1, 1, 1, 1,
0.2892727, -0.01247058, 1.895051, 1, 1, 1, 1, 1,
0.2926304, -2.075508, 1.744424, 1, 1, 1, 1, 1,
0.2927288, 1.622078, -0.598129, 1, 1, 1, 1, 1,
0.295101, 0.1478348, 1.242409, 1, 1, 1, 1, 1,
0.2969001, -0.7072722, 2.761913, 1, 1, 1, 1, 1,
0.3026561, -0.2089083, 2.899359, 1, 1, 1, 1, 1,
0.3055237, 0.7493558, 0.7410366, 1, 1, 1, 1, 1,
0.3117194, -0.2168101, 1.444871, 1, 1, 1, 1, 1,
0.3131202, -2.434734, 3.357817, 1, 1, 1, 1, 1,
0.3170964, -1.481555, 3.236479, 1, 1, 1, 1, 1,
0.3195644, 0.7821175, 0.7608318, 0, 0, 1, 1, 1,
0.3202235, -1.235309, 2.758806, 1, 0, 0, 1, 1,
0.3220868, 0.4597415, -0.760215, 1, 0, 0, 1, 1,
0.3259369, 0.2005091, 1.36008, 1, 0, 0, 1, 1,
0.3307962, 0.3125592, 0.6721864, 1, 0, 0, 1, 1,
0.3427489, 1.344555, 0.4894213, 1, 0, 0, 1, 1,
0.3482533, -1.311246, 3.285, 0, 0, 0, 1, 1,
0.3490961, -0.7026501, 1.844657, 0, 0, 0, 1, 1,
0.3548733, -0.5503654, 5.159124, 0, 0, 0, 1, 1,
0.3559868, 1.242217, 0.04334347, 0, 0, 0, 1, 1,
0.3561398, 0.9401893, -0.3553461, 0, 0, 0, 1, 1,
0.3571964, -2.080508, 2.857166, 0, 0, 0, 1, 1,
0.3591866, 1.485873, 1.001343, 0, 0, 0, 1, 1,
0.3655807, 0.7808769, -0.8157958, 1, 1, 1, 1, 1,
0.3664292, -1.696338, 1.903797, 1, 1, 1, 1, 1,
0.3692353, 1.782563, 0.7580322, 1, 1, 1, 1, 1,
0.3700059, -0.1783506, 2.27254, 1, 1, 1, 1, 1,
0.3706638, -0.3735936, 2.089703, 1, 1, 1, 1, 1,
0.3712701, -0.4154176, 4.20434, 1, 1, 1, 1, 1,
0.3775314, -1.109816, 1.78579, 1, 1, 1, 1, 1,
0.3848334, 0.1419741, 0.6765564, 1, 1, 1, 1, 1,
0.3878872, 0.3992501, 1.608156, 1, 1, 1, 1, 1,
0.3936279, -0.3157732, 1.443529, 1, 1, 1, 1, 1,
0.4004015, -1.285961, 2.010442, 1, 1, 1, 1, 1,
0.4027966, 0.6256506, 1.487069, 1, 1, 1, 1, 1,
0.4031482, 0.6206495, -0.1744506, 1, 1, 1, 1, 1,
0.4042577, -0.1788193, 0.9414962, 1, 1, 1, 1, 1,
0.4062217, 1.430529, -0.1849589, 1, 1, 1, 1, 1,
0.4071757, -0.1811368, -0.2531664, 0, 0, 1, 1, 1,
0.4132582, -0.6505964, 0.7059866, 1, 0, 0, 1, 1,
0.4139526, -0.006147561, 0.4042416, 1, 0, 0, 1, 1,
0.414306, -1.255447, 3.371171, 1, 0, 0, 1, 1,
0.4156261, 0.7627614, -0.6457492, 1, 0, 0, 1, 1,
0.4183675, 0.5812102, 0.9015276, 1, 0, 0, 1, 1,
0.4220929, -1.052599, 1.654567, 0, 0, 0, 1, 1,
0.4228825, -0.3534524, 1.849534, 0, 0, 0, 1, 1,
0.4255618, -0.2553442, 1.249769, 0, 0, 0, 1, 1,
0.4283068, 0.8306496, -0.6654196, 0, 0, 0, 1, 1,
0.437121, -0.4616495, 1.706978, 0, 0, 0, 1, 1,
0.4443904, -0.1767416, 1.864667, 0, 0, 0, 1, 1,
0.444788, 0.7598065, 0.6597074, 0, 0, 0, 1, 1,
0.4451507, -0.4675674, 1.214595, 1, 1, 1, 1, 1,
0.4473867, -0.01048676, 1.523398, 1, 1, 1, 1, 1,
0.4485684, 0.1400004, 2.314181, 1, 1, 1, 1, 1,
0.45132, -0.7845707, 2.776043, 1, 1, 1, 1, 1,
0.4540208, 0.3821444, 0.2712903, 1, 1, 1, 1, 1,
0.454988, -1.0712, 4.202693, 1, 1, 1, 1, 1,
0.4565437, -0.1092411, -0.01869099, 1, 1, 1, 1, 1,
0.4569625, -0.5556992, 3.061628, 1, 1, 1, 1, 1,
0.4577675, 0.2158961, -0.01752906, 1, 1, 1, 1, 1,
0.4608608, -0.6707706, 0.2393632, 1, 1, 1, 1, 1,
0.4644105, -0.5203626, 1.757087, 1, 1, 1, 1, 1,
0.4687684, 1.340052, -1.119048, 1, 1, 1, 1, 1,
0.4720601, 0.1134971, 0.3327299, 1, 1, 1, 1, 1,
0.4720718, 1.954569, 1.79418, 1, 1, 1, 1, 1,
0.4725214, -0.4544809, 1.92085, 1, 1, 1, 1, 1,
0.4736332, 1.285338, -0.7287402, 0, 0, 1, 1, 1,
0.480235, 0.5907912, 0.9145232, 1, 0, 0, 1, 1,
0.4806612, -0.4004891, 0.6303972, 1, 0, 0, 1, 1,
0.4812291, -0.4072942, 2.438505, 1, 0, 0, 1, 1,
0.4815288, -0.7832422, 2.129247, 1, 0, 0, 1, 1,
0.4827525, -0.06902973, 1.635406, 1, 0, 0, 1, 1,
0.4843654, 0.3780157, -0.1534389, 0, 0, 0, 1, 1,
0.4862165, 1.1685, 2.25466, 0, 0, 0, 1, 1,
0.4899135, -0.2335951, 2.250439, 0, 0, 0, 1, 1,
0.4908605, -0.06521355, 3.376392, 0, 0, 0, 1, 1,
0.4987332, -0.1848049, 3.42902, 0, 0, 0, 1, 1,
0.5124191, 0.1696967, 2.2302, 0, 0, 0, 1, 1,
0.5133389, -1.780334, 2.828393, 0, 0, 0, 1, 1,
0.5147343, 0.04576923, 2.57512, 1, 1, 1, 1, 1,
0.5156215, 0.3292481, 2.29472, 1, 1, 1, 1, 1,
0.5182096, 2.041793, 0.3705718, 1, 1, 1, 1, 1,
0.5200409, 0.6216983, 0.2947215, 1, 1, 1, 1, 1,
0.5210179, 0.526553, 2.357353, 1, 1, 1, 1, 1,
0.5215974, 0.4049894, 1.3911, 1, 1, 1, 1, 1,
0.5239537, 2.064193, 1.18587, 1, 1, 1, 1, 1,
0.5251805, 0.507782, 0.5008305, 1, 1, 1, 1, 1,
0.5274428, -0.230625, 1.125308, 1, 1, 1, 1, 1,
0.5288909, -1.098731, 2.55321, 1, 1, 1, 1, 1,
0.5292109, 0.08969676, 0.01620711, 1, 1, 1, 1, 1,
0.5319454, 1.129415, -0.3410659, 1, 1, 1, 1, 1,
0.5341797, 0.5208188, 1.988051, 1, 1, 1, 1, 1,
0.535814, -0.1289504, 0.9836527, 1, 1, 1, 1, 1,
0.5358264, 0.1689951, 2.357293, 1, 1, 1, 1, 1,
0.546526, 0.3251247, 0.2035007, 0, 0, 1, 1, 1,
0.5470185, -0.7522652, 1.013872, 1, 0, 0, 1, 1,
0.5486906, 0.7634686, -0.6650566, 1, 0, 0, 1, 1,
0.5488279, -0.6289111, 3.468222, 1, 0, 0, 1, 1,
0.5521104, 0.5387402, -0.4765369, 1, 0, 0, 1, 1,
0.553214, -0.3921677, 1.597855, 1, 0, 0, 1, 1,
0.553293, 0.4062319, 1.966486, 0, 0, 0, 1, 1,
0.5535892, -0.2285011, 2.05048, 0, 0, 0, 1, 1,
0.5546886, -0.3835627, 2.097177, 0, 0, 0, 1, 1,
0.5550959, 0.004525325, 1.722753, 0, 0, 0, 1, 1,
0.5599315, -1.442968, 3.185746, 0, 0, 0, 1, 1,
0.5608073, 0.4442417, 2.033906, 0, 0, 0, 1, 1,
0.5663741, 0.04377647, 1.438975, 0, 0, 0, 1, 1,
0.571408, 0.8839566, 1.026404, 1, 1, 1, 1, 1,
0.5789422, -1.006394, 2.118114, 1, 1, 1, 1, 1,
0.5881849, 0.8897012, -1.847538, 1, 1, 1, 1, 1,
0.5899825, 0.04719513, 2.923056, 1, 1, 1, 1, 1,
0.5913963, 1.897386, -0.2462036, 1, 1, 1, 1, 1,
0.5998858, -0.6393889, 3.33902, 1, 1, 1, 1, 1,
0.6006655, 1.631952, 1.04209, 1, 1, 1, 1, 1,
0.6061967, 0.1156373, 1.068876, 1, 1, 1, 1, 1,
0.6097886, -0.1901645, 1.454956, 1, 1, 1, 1, 1,
0.6098695, 0.3954005, -0.0172587, 1, 1, 1, 1, 1,
0.6112911, 0.1019332, 0.8869998, 1, 1, 1, 1, 1,
0.6117324, -0.9056509, 2.63033, 1, 1, 1, 1, 1,
0.6166717, 0.555267, 0.5966329, 1, 1, 1, 1, 1,
0.6190659, 1.056305, 1.850572, 1, 1, 1, 1, 1,
0.6228207, 0.8519965, 1.216404, 1, 1, 1, 1, 1,
0.6281831, 0.4792701, 0.07278275, 0, 0, 1, 1, 1,
0.6339437, -0.8991717, 2.208382, 1, 0, 0, 1, 1,
0.6363549, -0.9010935, 5.343799, 1, 0, 0, 1, 1,
0.6389931, -0.2582187, 2.625077, 1, 0, 0, 1, 1,
0.6396838, -0.6182769, 0.8053159, 1, 0, 0, 1, 1,
0.6411166, -1.092586, 2.924123, 1, 0, 0, 1, 1,
0.6434843, -0.8142153, 1.180527, 0, 0, 0, 1, 1,
0.6449663, -0.01817732, 2.907419, 0, 0, 0, 1, 1,
0.6553693, 1.06012, 0.1187868, 0, 0, 0, 1, 1,
0.6610089, 0.03200658, 3.062805, 0, 0, 0, 1, 1,
0.6623063, -0.6129937, 3.025287, 0, 0, 0, 1, 1,
0.6653962, -0.6459911, 4.107337, 0, 0, 0, 1, 1,
0.6677169, -0.4926388, 4.259513, 0, 0, 0, 1, 1,
0.6677551, -0.3110148, 2.366399, 1, 1, 1, 1, 1,
0.671104, 0.8947572, 2.489954, 1, 1, 1, 1, 1,
0.6764258, 0.1747763, 2.533661, 1, 1, 1, 1, 1,
0.6844898, -0.0802306, 3.389555, 1, 1, 1, 1, 1,
0.6854162, 0.6078924, 1.350564, 1, 1, 1, 1, 1,
0.6861563, 1.690276, 0.225552, 1, 1, 1, 1, 1,
0.7015457, -0.2559923, 2.361171, 1, 1, 1, 1, 1,
0.7058401, -0.1496155, 1.023274, 1, 1, 1, 1, 1,
0.7065489, 1.094183, 1.755816, 1, 1, 1, 1, 1,
0.707069, -0.8807283, 3.178878, 1, 1, 1, 1, 1,
0.7079762, -0.01877019, 0.7126696, 1, 1, 1, 1, 1,
0.709053, 0.8985068, 1.248005, 1, 1, 1, 1, 1,
0.7107421, -2.073591, 3.595074, 1, 1, 1, 1, 1,
0.7120317, 0.3784748, -0.1612343, 1, 1, 1, 1, 1,
0.7166048, 2.368275, 1.066994, 1, 1, 1, 1, 1,
0.7200047, -1.343369, 1.863666, 0, 0, 1, 1, 1,
0.7218507, -0.9294332, 3.076798, 1, 0, 0, 1, 1,
0.7219638, -1.890866, 2.19697, 1, 0, 0, 1, 1,
0.7275036, 0.2140048, 0.3434163, 1, 0, 0, 1, 1,
0.7405339, 0.5595084, 0.8516107, 1, 0, 0, 1, 1,
0.7442905, 0.7481171, 1.404389, 1, 0, 0, 1, 1,
0.7501523, 0.6710243, 1.303313, 0, 0, 0, 1, 1,
0.7536578, 0.6595656, 1.403356, 0, 0, 0, 1, 1,
0.7614052, -1.133224, 1.691007, 0, 0, 0, 1, 1,
0.7646477, -1.095602, 3.720878, 0, 0, 0, 1, 1,
0.772053, 0.519143, -0.06394663, 0, 0, 0, 1, 1,
0.7829723, -0.3626635, 1.621831, 0, 0, 0, 1, 1,
0.7908177, 2.498796, -1.954707, 0, 0, 0, 1, 1,
0.7920459, 1.256805, 1.481108, 1, 1, 1, 1, 1,
0.7957569, 1.472939, 0.7914141, 1, 1, 1, 1, 1,
0.7994009, -0.2979051, 3.20701, 1, 1, 1, 1, 1,
0.8019688, 0.01223453, 1.396768, 1, 1, 1, 1, 1,
0.8046946, -1.523519, 3.641404, 1, 1, 1, 1, 1,
0.8057249, 0.565136, 1.975217, 1, 1, 1, 1, 1,
0.8092301, 0.5246583, 0.3363635, 1, 1, 1, 1, 1,
0.8116537, 1.019227, -0.9859874, 1, 1, 1, 1, 1,
0.8162749, -0.1518452, 1.173677, 1, 1, 1, 1, 1,
0.8175489, 1.270523, -1.105555, 1, 1, 1, 1, 1,
0.8176798, -0.3371571, 1.818036, 1, 1, 1, 1, 1,
0.8223277, 0.0009681355, 1.790458, 1, 1, 1, 1, 1,
0.8233416, -0.6246708, 0.7707678, 1, 1, 1, 1, 1,
0.8239049, -1.655442, 0.8692732, 1, 1, 1, 1, 1,
0.8409029, 0.6688596, 0.2602828, 1, 1, 1, 1, 1,
0.8442101, -0.3708614, 1.464075, 0, 0, 1, 1, 1,
0.8501969, -0.9689533, 3.227396, 1, 0, 0, 1, 1,
0.8523937, 0.6109304, -0.1352544, 1, 0, 0, 1, 1,
0.8613731, 2.107202, -0.4573516, 1, 0, 0, 1, 1,
0.8622221, -0.6579815, 2.33607, 1, 0, 0, 1, 1,
0.8643922, 0.2279624, 2.049262, 1, 0, 0, 1, 1,
0.8677846, 0.4958698, 0.2834704, 0, 0, 0, 1, 1,
0.8696371, -1.154527, 1.873849, 0, 0, 0, 1, 1,
0.875401, -0.7311094, 2.332329, 0, 0, 0, 1, 1,
0.8785393, 0.5395772, 1.0694, 0, 0, 0, 1, 1,
0.8793656, -0.1265498, -0.6204439, 0, 0, 0, 1, 1,
0.885177, -0.1042753, 1.931909, 0, 0, 0, 1, 1,
0.8932527, -1.218462, 3.221338, 0, 0, 0, 1, 1,
0.8973373, 0.2599939, 0.2282822, 1, 1, 1, 1, 1,
0.9095509, -0.9929819, 2.053338, 1, 1, 1, 1, 1,
0.9155046, 0.505556, -0.636626, 1, 1, 1, 1, 1,
0.919733, -0.9604618, 2.249878, 1, 1, 1, 1, 1,
0.9213455, -0.8507599, 2.300691, 1, 1, 1, 1, 1,
0.9263471, -0.6345547, 2.824266, 1, 1, 1, 1, 1,
0.9337072, 0.4870188, 3.04218, 1, 1, 1, 1, 1,
0.9337978, -1.807874, 4.176136, 1, 1, 1, 1, 1,
0.9345737, 2.268415, -0.4710346, 1, 1, 1, 1, 1,
0.9379471, -0.3344927, 1.983723, 1, 1, 1, 1, 1,
0.9400051, -0.2424612, -0.4132103, 1, 1, 1, 1, 1,
0.944778, 1.610763, 0.1798882, 1, 1, 1, 1, 1,
0.9457685, 1.63474, -0.05892577, 1, 1, 1, 1, 1,
0.9481304, 0.2426622, 0.01323372, 1, 1, 1, 1, 1,
0.951526, -0.0894452, 1.76164, 1, 1, 1, 1, 1,
0.9644415, 1.368335, -2.386993, 0, 0, 1, 1, 1,
0.9678057, 0.3812596, 2.42598, 1, 0, 0, 1, 1,
0.9713407, -1.016863, 2.406933, 1, 0, 0, 1, 1,
0.9713693, -0.4901479, 3.362868, 1, 0, 0, 1, 1,
0.9718971, 0.5350604, 0.9681211, 1, 0, 0, 1, 1,
0.9722042, 0.04056203, 1.579596, 1, 0, 0, 1, 1,
0.9727927, 0.4604549, 1.695948, 0, 0, 0, 1, 1,
0.9761296, -1.211824, 2.475592, 0, 0, 0, 1, 1,
0.9764699, -1.577861, 1.802702, 0, 0, 0, 1, 1,
0.9795382, -0.1888083, 2.245298, 0, 0, 0, 1, 1,
0.9998112, -1.271895, 0.8214504, 0, 0, 0, 1, 1,
1.006622, 1.367409, -0.3859978, 0, 0, 0, 1, 1,
1.016276, -0.941384, 5.293587, 0, 0, 0, 1, 1,
1.02015, -0.7904917, 1.837435, 1, 1, 1, 1, 1,
1.039621, 0.2758236, 1.718996, 1, 1, 1, 1, 1,
1.041842, 0.1298224, 1.188775, 1, 1, 1, 1, 1,
1.043293, -0.6105953, 2.032454, 1, 1, 1, 1, 1,
1.046553, 1.791272, 1.33338, 1, 1, 1, 1, 1,
1.048928, -2.507902, 3.01329, 1, 1, 1, 1, 1,
1.060674, 0.787235, -0.6082488, 1, 1, 1, 1, 1,
1.066549, -0.2993944, 1.691477, 1, 1, 1, 1, 1,
1.070583, -0.5545211, 2.943838, 1, 1, 1, 1, 1,
1.072977, 0.1913694, 2.119945, 1, 1, 1, 1, 1,
1.087049, 0.5240155, 4.680826, 1, 1, 1, 1, 1,
1.087742, -0.118607, 2.499619, 1, 1, 1, 1, 1,
1.099859, -0.8872573, 2.60353, 1, 1, 1, 1, 1,
1.108045, -1.282151, 2.912423, 1, 1, 1, 1, 1,
1.108217, 2.34084, 1.179313, 1, 1, 1, 1, 1,
1.108225, 1.106809, -1.48156, 0, 0, 1, 1, 1,
1.11884, -0.7255782, 2.218876, 1, 0, 0, 1, 1,
1.131642, 0.593913, 1.062769, 1, 0, 0, 1, 1,
1.142989, 0.6209779, 3.14446, 1, 0, 0, 1, 1,
1.155646, 1.133132, 2.2848, 1, 0, 0, 1, 1,
1.161535, 0.2379428, 0.854987, 1, 0, 0, 1, 1,
1.162895, 2.159503, 0.07727475, 0, 0, 0, 1, 1,
1.174423, -0.7248899, 0.8121269, 0, 0, 0, 1, 1,
1.181752, 0.7773091, 1.692063, 0, 0, 0, 1, 1,
1.217809, 0.3968515, 0.4511958, 0, 0, 0, 1, 1,
1.228968, -0.1495484, 1.6555, 0, 0, 0, 1, 1,
1.229208, 0.05007569, 1.483036, 0, 0, 0, 1, 1,
1.230405, 0.3023303, -0.7207189, 0, 0, 0, 1, 1,
1.230882, 0.778116, -0.1710021, 1, 1, 1, 1, 1,
1.232084, -1.173372, 3.748111, 1, 1, 1, 1, 1,
1.233096, 1.754552, -0.1577954, 1, 1, 1, 1, 1,
1.23404, 0.7504085, 0.5907667, 1, 1, 1, 1, 1,
1.245779, -0.009972884, 0.319259, 1, 1, 1, 1, 1,
1.249618, -0.1743498, 3.096116, 1, 1, 1, 1, 1,
1.253598, -0.8900746, 1.245147, 1, 1, 1, 1, 1,
1.254023, -0.2694371, 1.509878, 1, 1, 1, 1, 1,
1.266468, -2.938339, -0.3571827, 1, 1, 1, 1, 1,
1.278143, -0.813345, 0.9066362, 1, 1, 1, 1, 1,
1.285958, 0.2018443, 1.824885, 1, 1, 1, 1, 1,
1.296813, -0.9511489, 2.3228, 1, 1, 1, 1, 1,
1.29921, -0.3960387, 2.503455, 1, 1, 1, 1, 1,
1.313632, -0.8179625, 2.476512, 1, 1, 1, 1, 1,
1.32093, 2.817965, 2.345209, 1, 1, 1, 1, 1,
1.331178, -0.3848389, 1.836645, 0, 0, 1, 1, 1,
1.338094, 1.146477, 0.3251643, 1, 0, 0, 1, 1,
1.353222, -0.6137102, 1.648252, 1, 0, 0, 1, 1,
1.366009, -0.7774333, 2.170911, 1, 0, 0, 1, 1,
1.376082, 0.6491625, 2.113103, 1, 0, 0, 1, 1,
1.383151, 0.5009487, 0.389742, 1, 0, 0, 1, 1,
1.384259, -0.0317993, 1.838651, 0, 0, 0, 1, 1,
1.384742, 0.2631184, 2.412178, 0, 0, 0, 1, 1,
1.385618, -0.880592, 3.207805, 0, 0, 0, 1, 1,
1.396827, 1.656837, 0.6655756, 0, 0, 0, 1, 1,
1.408096, -1.486746, 4.309551, 0, 0, 0, 1, 1,
1.409065, -2.491447, 3.441318, 0, 0, 0, 1, 1,
1.412301, 0.532039, 1.075154, 0, 0, 0, 1, 1,
1.415476, 0.3681307, 0.3487945, 1, 1, 1, 1, 1,
1.423157, 1.319262, 2.501106, 1, 1, 1, 1, 1,
1.428154, -0.09460533, 1.228778, 1, 1, 1, 1, 1,
1.438254, 0.4929508, 1.864179, 1, 1, 1, 1, 1,
1.442211, -0.7329556, 2.484589, 1, 1, 1, 1, 1,
1.452675, -0.03771207, 2.736341, 1, 1, 1, 1, 1,
1.460858, -1.404388, 1.753637, 1, 1, 1, 1, 1,
1.467428, 0.4886209, 3.151196, 1, 1, 1, 1, 1,
1.474745, 0.04671067, 1.667841, 1, 1, 1, 1, 1,
1.477488, -1.417725, 3.524956, 1, 1, 1, 1, 1,
1.482084, 0.8105434, 2.86456, 1, 1, 1, 1, 1,
1.48583, 1.331735, 1.936965, 1, 1, 1, 1, 1,
1.485991, 0.8784646, -0.09826775, 1, 1, 1, 1, 1,
1.486328, -0.5316089, 3.012041, 1, 1, 1, 1, 1,
1.493284, -0.1027399, 1.305848, 1, 1, 1, 1, 1,
1.497842, -0.1235252, 3.096855, 0, 0, 1, 1, 1,
1.498681, -0.5943102, 2.094638, 1, 0, 0, 1, 1,
1.498837, 0.470585, 2.127996, 1, 0, 0, 1, 1,
1.53264, -0.6620446, 2.106046, 1, 0, 0, 1, 1,
1.538967, 1.506251, 0.8920836, 1, 0, 0, 1, 1,
1.545698, 0.7516918, 2.200867, 1, 0, 0, 1, 1,
1.547544, -0.007770227, 1.645301, 0, 0, 0, 1, 1,
1.548574, 0.02130774, 0.4478725, 0, 0, 0, 1, 1,
1.549935, 0.4033203, 0.1250372, 0, 0, 0, 1, 1,
1.566646, -0.5536986, 1.093414, 0, 0, 0, 1, 1,
1.577363, 0.8685743, 0.7064893, 0, 0, 0, 1, 1,
1.581004, 0.01019629, 1.059118, 0, 0, 0, 1, 1,
1.583644, 1.059, 1.516062, 0, 0, 0, 1, 1,
1.590384, -1.508996, 3.865949, 1, 1, 1, 1, 1,
1.603586, -0.1379908, 1.650004, 1, 1, 1, 1, 1,
1.611372, -0.5702108, 3.127153, 1, 1, 1, 1, 1,
1.638237, -0.8022555, 0.9436103, 1, 1, 1, 1, 1,
1.642062, -1.326218, 2.495895, 1, 1, 1, 1, 1,
1.652818, -0.4687178, 0.1195364, 1, 1, 1, 1, 1,
1.673135, 0.01986684, 2.378123, 1, 1, 1, 1, 1,
1.676683, -0.9854275, 1.848821, 1, 1, 1, 1, 1,
1.683385, -0.2891481, 1.033243, 1, 1, 1, 1, 1,
1.706488, -0.4099111, 1.624087, 1, 1, 1, 1, 1,
1.720159, -0.8610011, 2.26743, 1, 1, 1, 1, 1,
1.726681, 0.2951053, 0.8908262, 1, 1, 1, 1, 1,
1.735669, -0.9104552, 2.029395, 1, 1, 1, 1, 1,
1.747702, -0.4006985, 3.253645, 1, 1, 1, 1, 1,
1.756674, 0.5670729, 0.4682521, 1, 1, 1, 1, 1,
1.763728, 1.647393, 0.2351786, 0, 0, 1, 1, 1,
1.782723, -0.2034116, 1.862338, 1, 0, 0, 1, 1,
1.78633, -0.6008536, 2.735356, 1, 0, 0, 1, 1,
1.789586, -0.09639591, 2.093113, 1, 0, 0, 1, 1,
1.824688, 0.1862677, 0.958243, 1, 0, 0, 1, 1,
1.832245, -0.7880263, 1.552728, 1, 0, 0, 1, 1,
1.832347, -1.435588, 3.735081, 0, 0, 0, 1, 1,
1.851533, -0.2645428, 1.596663, 0, 0, 0, 1, 1,
1.863266, -1.825987, 1.962176, 0, 0, 0, 1, 1,
1.866997, 0.4008861, 1.942311, 0, 0, 0, 1, 1,
1.872145, 0.3144776, 1.533857, 0, 0, 0, 1, 1,
1.873936, 0.4273553, 1.109604, 0, 0, 0, 1, 1,
1.881616, -1.359221, 0.8388675, 0, 0, 0, 1, 1,
1.895881, 0.3521032, 2.445305, 1, 1, 1, 1, 1,
1.899012, -0.2988968, 0.8897257, 1, 1, 1, 1, 1,
1.901074, -1.456704, 4.228436, 1, 1, 1, 1, 1,
1.905554, 0.6918701, 0.2523696, 1, 1, 1, 1, 1,
1.908927, -0.2427618, 0.2309082, 1, 1, 1, 1, 1,
1.909301, 0.9883184, 1.063882, 1, 1, 1, 1, 1,
1.930625, -0.7257556, 0.7640947, 1, 1, 1, 1, 1,
1.941858, -0.2746934, 0.4949847, 1, 1, 1, 1, 1,
1.944698, -0.65535, 2.479374, 1, 1, 1, 1, 1,
1.950167, 1.781921, 0.7228339, 1, 1, 1, 1, 1,
1.969024, -1.826866, 2.71761, 1, 1, 1, 1, 1,
1.978911, 1.398012, 0.3169072, 1, 1, 1, 1, 1,
1.981647, 1.560305, 0.4187678, 1, 1, 1, 1, 1,
1.984711, 0.7767668, 2.068817, 1, 1, 1, 1, 1,
1.996182, -1.361229, 2.448435, 1, 1, 1, 1, 1,
2.022513, -0.188459, 0.8196359, 0, 0, 1, 1, 1,
2.047099, 1.27206, 1.778859, 1, 0, 0, 1, 1,
2.060326, -1.165871, 2.163662, 1, 0, 0, 1, 1,
2.067366, -0.004574786, 1.390251, 1, 0, 0, 1, 1,
2.094359, -0.4742884, 3.018726, 1, 0, 0, 1, 1,
2.097575, -1.267454, 3.311544, 1, 0, 0, 1, 1,
2.135775, 0.7805237, 0.6021129, 0, 0, 0, 1, 1,
2.14517, -0.6517413, 0.9001038, 0, 0, 0, 1, 1,
2.258896, 0.4881839, -0.7175766, 0, 0, 0, 1, 1,
2.314604, 1.163815, 0.9338408, 0, 0, 0, 1, 1,
2.318896, 1.160399, 1.707514, 0, 0, 0, 1, 1,
2.412643, -1.874799, 4.267227, 0, 0, 0, 1, 1,
2.458089, -1.42545, 1.452015, 0, 0, 0, 1, 1,
2.47761, 1.066661, -0.0364939, 1, 1, 1, 1, 1,
2.584068, -0.5424644, 3.964568, 1, 1, 1, 1, 1,
2.597191, -0.4197665, 2.001657, 1, 1, 1, 1, 1,
2.615199, -1.240117, 1.427823, 1, 1, 1, 1, 1,
2.700213, 0.4215621, -0.7410603, 1, 1, 1, 1, 1,
2.719232, 1.131536, -0.2860435, 1, 1, 1, 1, 1,
3.05228, 1.070521, -0.5965828, 1, 1, 1, 1, 1
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
var radius = 10.14998;
var distance = 35.65137;
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
mvMatrix.translate( 0.2903981, 0.1295843, -0.5511868 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.65137);
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
