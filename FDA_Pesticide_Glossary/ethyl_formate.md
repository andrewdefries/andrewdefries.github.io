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
-3.139488, -0.1123096, -3.382732, 1, 0, 0, 1,
-3.125143, 1.358993, -1.709733, 1, 0.007843138, 0, 1,
-2.726725, 1.262216, -1.324881, 1, 0.01176471, 0, 1,
-2.685755, -2.568894, -3.438108, 1, 0.01960784, 0, 1,
-2.642226, -0.7460819, -0.1580073, 1, 0.02352941, 0, 1,
-2.630514, 0.9866405, -1.105099, 1, 0.03137255, 0, 1,
-2.623684, 1.37423, -2.094841, 1, 0.03529412, 0, 1,
-2.566368, 2.206432, -1.379227, 1, 0.04313726, 0, 1,
-2.47392, 0.3154129, -3.046196, 1, 0.04705882, 0, 1,
-2.369697, -1.07396, -4.072318, 1, 0.05490196, 0, 1,
-2.352199, 0.6981497, -2.581873, 1, 0.05882353, 0, 1,
-2.34236, -0.9998138, -0.2730707, 1, 0.06666667, 0, 1,
-2.279463, 0.1747522, -1.307545, 1, 0.07058824, 0, 1,
-2.276664, 1.029155, -1.05057, 1, 0.07843138, 0, 1,
-2.274425, 0.6968454, -2.514518, 1, 0.08235294, 0, 1,
-2.270696, 2.758211, 0.8012581, 1, 0.09019608, 0, 1,
-2.266435, -0.560565, -0.7074679, 1, 0.09411765, 0, 1,
-2.159717, -1.679765, -2.666263, 1, 0.1019608, 0, 1,
-2.137799, 0.06848857, -1.878033, 1, 0.1098039, 0, 1,
-2.097328, -0.05510629, -0.9270946, 1, 0.1137255, 0, 1,
-2.063876, -1.608374, -3.003479, 1, 0.1215686, 0, 1,
-2.060635, 1.345195, -0.8302325, 1, 0.1254902, 0, 1,
-2.037354, -0.09924337, -1.142552, 1, 0.1333333, 0, 1,
-1.997669, 0.4014692, -1.391022, 1, 0.1372549, 0, 1,
-1.993104, 0.9145377, 0.5312669, 1, 0.145098, 0, 1,
-1.986435, 0.1056264, -0.8967115, 1, 0.1490196, 0, 1,
-1.982822, -1.991232, -1.678156, 1, 0.1568628, 0, 1,
-1.965689, 0.6404462, -2.162079, 1, 0.1607843, 0, 1,
-1.953261, -1.749771, -1.876669, 1, 0.1686275, 0, 1,
-1.909346, -0.01852771, -3.817011, 1, 0.172549, 0, 1,
-1.905301, 1.320068, -0.05339966, 1, 0.1803922, 0, 1,
-1.90047, 0.5060486, -0.4161433, 1, 0.1843137, 0, 1,
-1.853068, -0.3242036, -2.812711, 1, 0.1921569, 0, 1,
-1.846746, -1.17442, -2.432899, 1, 0.1960784, 0, 1,
-1.82843, 0.3930256, -1.006232, 1, 0.2039216, 0, 1,
-1.824577, 1.231364, 0.2548976, 1, 0.2117647, 0, 1,
-1.821957, -0.3800354, 0.0002303538, 1, 0.2156863, 0, 1,
-1.806307, -0.9583509, -1.506168, 1, 0.2235294, 0, 1,
-1.798921, 0.4210884, -0.9798352, 1, 0.227451, 0, 1,
-1.788277, 0.5031765, -2.067181, 1, 0.2352941, 0, 1,
-1.773124, -0.1002235, 0.04337316, 1, 0.2392157, 0, 1,
-1.768262, 0.9421377, -2.608845, 1, 0.2470588, 0, 1,
-1.743252, 0.008375908, -1.349243, 1, 0.2509804, 0, 1,
-1.722165, -1.37639, -2.959763, 1, 0.2588235, 0, 1,
-1.708456, -0.6991938, -2.267053, 1, 0.2627451, 0, 1,
-1.704358, 0.1553051, -2.054954, 1, 0.2705882, 0, 1,
-1.693568, 1.028215, -1.190612, 1, 0.2745098, 0, 1,
-1.688558, -0.470671, -1.162334, 1, 0.282353, 0, 1,
-1.669085, -0.5166313, -1.587679, 1, 0.2862745, 0, 1,
-1.629014, -0.7042465, -2.197515, 1, 0.2941177, 0, 1,
-1.626187, 1.33257, 0.3063207, 1, 0.3019608, 0, 1,
-1.625387, -0.8359118, -3.777504, 1, 0.3058824, 0, 1,
-1.607216, 1.698369, -0.5567914, 1, 0.3137255, 0, 1,
-1.603359, 0.2203368, -1.696952, 1, 0.3176471, 0, 1,
-1.591621, -0.5766332, -2.307894, 1, 0.3254902, 0, 1,
-1.580016, 1.827555, -0.7494466, 1, 0.3294118, 0, 1,
-1.575693, 0.4678028, -1.520806, 1, 0.3372549, 0, 1,
-1.570137, -0.9794102, -1.196097, 1, 0.3411765, 0, 1,
-1.569946, 1.078619, -1.366294, 1, 0.3490196, 0, 1,
-1.56881, -0.2342366, -0.9645028, 1, 0.3529412, 0, 1,
-1.558963, 0.3432245, -2.440466, 1, 0.3607843, 0, 1,
-1.542067, 0.6878323, -0.1101367, 1, 0.3647059, 0, 1,
-1.535829, 0.8807134, -1.907625, 1, 0.372549, 0, 1,
-1.533362, 0.0005219141, 0.02127786, 1, 0.3764706, 0, 1,
-1.532693, -1.471294, -4.382038, 1, 0.3843137, 0, 1,
-1.531894, -0.4650207, -1.860501, 1, 0.3882353, 0, 1,
-1.523522, 1.205843, -0.4737344, 1, 0.3960784, 0, 1,
-1.522585, 0.8511631, -2.152223, 1, 0.4039216, 0, 1,
-1.521579, 0.5848962, 0.09610682, 1, 0.4078431, 0, 1,
-1.498994, -0.2773167, -1.974165, 1, 0.4156863, 0, 1,
-1.493552, 1.058156, -3.881657, 1, 0.4196078, 0, 1,
-1.491392, 1.197611, 0.1874661, 1, 0.427451, 0, 1,
-1.487761, -0.2934079, -2.69629, 1, 0.4313726, 0, 1,
-1.478164, 0.3440608, -2.60449, 1, 0.4392157, 0, 1,
-1.477523, -1.538375, -3.017141, 1, 0.4431373, 0, 1,
-1.474209, -0.8305929, -3.536243, 1, 0.4509804, 0, 1,
-1.457572, -0.8444729, -0.4136164, 1, 0.454902, 0, 1,
-1.449778, -1.90732, -1.784872, 1, 0.4627451, 0, 1,
-1.448282, -2.454359, -1.941271, 1, 0.4666667, 0, 1,
-1.438543, 0.2916939, -2.579361, 1, 0.4745098, 0, 1,
-1.436757, 1.994521, -0.1870129, 1, 0.4784314, 0, 1,
-1.436561, 0.6149288, -2.284908, 1, 0.4862745, 0, 1,
-1.433361, 2.577834, -0.756719, 1, 0.4901961, 0, 1,
-1.430202, -0.8204963, -0.9907771, 1, 0.4980392, 0, 1,
-1.414175, 1.967431, -1.802828, 1, 0.5058824, 0, 1,
-1.404654, 1.967946, -1.646934, 1, 0.509804, 0, 1,
-1.385949, 0.07167242, -2.642077, 1, 0.5176471, 0, 1,
-1.385138, 1.204253, 0.4556748, 1, 0.5215687, 0, 1,
-1.384952, 1.059622, -1.682557, 1, 0.5294118, 0, 1,
-1.384146, 1.026019, -1.517955, 1, 0.5333334, 0, 1,
-1.383935, -0.321633, -3.512725, 1, 0.5411765, 0, 1,
-1.373443, -0.4131417, -3.28905, 1, 0.5450981, 0, 1,
-1.37153, -0.8569688, -2.521105, 1, 0.5529412, 0, 1,
-1.361184, 0.3381175, -0.6206297, 1, 0.5568628, 0, 1,
-1.354938, 0.1193528, -1.39105, 1, 0.5647059, 0, 1,
-1.314667, 1.574946, -0.5422138, 1, 0.5686275, 0, 1,
-1.31073, 0.5262049, -1.451708, 1, 0.5764706, 0, 1,
-1.308412, 0.7050976, -0.4699912, 1, 0.5803922, 0, 1,
-1.279873, -0.9669061, -2.481134, 1, 0.5882353, 0, 1,
-1.271432, 0.1113109, -1.804346, 1, 0.5921569, 0, 1,
-1.265105, 1.718169, -1.981435, 1, 0.6, 0, 1,
-1.253518, -0.2716409, -1.190154, 1, 0.6078432, 0, 1,
-1.244171, 2.515312, 0.4389168, 1, 0.6117647, 0, 1,
-1.24217, -0.6463241, -0.6224149, 1, 0.6196079, 0, 1,
-1.238725, 0.3702385, -2.33027, 1, 0.6235294, 0, 1,
-1.234804, 0.273805, -1.190882, 1, 0.6313726, 0, 1,
-1.229374, 1.500224, 0.238421, 1, 0.6352941, 0, 1,
-1.228408, -0.3816636, -2.707964, 1, 0.6431373, 0, 1,
-1.22473, -0.3552799, -2.306229, 1, 0.6470588, 0, 1,
-1.211959, -0.4845017, -0.9960761, 1, 0.654902, 0, 1,
-1.208348, -0.5668598, -0.2784625, 1, 0.6588235, 0, 1,
-1.201153, -1.732575, -2.193194, 1, 0.6666667, 0, 1,
-1.191448, 0.03910891, -1.255119, 1, 0.6705883, 0, 1,
-1.186364, -0.2135469, -2.647844, 1, 0.6784314, 0, 1,
-1.179926, -0.9574935, -2.811507, 1, 0.682353, 0, 1,
-1.171315, -0.7322937, -1.456903, 1, 0.6901961, 0, 1,
-1.161914, 2.452974, -0.7693363, 1, 0.6941177, 0, 1,
-1.15558, 1.161985, -0.6101294, 1, 0.7019608, 0, 1,
-1.146513, 0.7673614, -0.4697971, 1, 0.7098039, 0, 1,
-1.143577, 0.7966412, 0.01566818, 1, 0.7137255, 0, 1,
-1.142338, 0.5709726, 0.8549897, 1, 0.7215686, 0, 1,
-1.121843, -0.8682759, -2.139894, 1, 0.7254902, 0, 1,
-1.121292, 0.230274, -1.496015, 1, 0.7333333, 0, 1,
-1.118338, -0.1782996, -3.231951, 1, 0.7372549, 0, 1,
-1.108236, 0.6644893, -0.9996873, 1, 0.7450981, 0, 1,
-1.107031, -0.7967249, -2.808524, 1, 0.7490196, 0, 1,
-1.106584, 0.1625043, -1.667118, 1, 0.7568628, 0, 1,
-1.105457, 0.7613546, -0.9899079, 1, 0.7607843, 0, 1,
-1.0957, 0.01498842, -1.479991, 1, 0.7686275, 0, 1,
-1.094622, 1.065051, -0.4083765, 1, 0.772549, 0, 1,
-1.094315, 0.9133873, -1.347883, 1, 0.7803922, 0, 1,
-1.09006, 0.3710796, -0.3693714, 1, 0.7843137, 0, 1,
-1.087919, -0.6488842, -2.001135, 1, 0.7921569, 0, 1,
-1.086545, -0.1643036, -1.810645, 1, 0.7960784, 0, 1,
-1.080352, -1.74405, -3.272709, 1, 0.8039216, 0, 1,
-1.075792, 0.2471772, -0.8958502, 1, 0.8117647, 0, 1,
-1.065985, 0.07728802, -0.4501791, 1, 0.8156863, 0, 1,
-1.065771, 1.058541, -0.2768191, 1, 0.8235294, 0, 1,
-1.052689, 0.3081738, -1.940939, 1, 0.827451, 0, 1,
-1.034903, -0.4668275, -1.801616, 1, 0.8352941, 0, 1,
-1.034753, -0.07290609, -1.528145, 1, 0.8392157, 0, 1,
-1.033783, -2.528854, -2.74289, 1, 0.8470588, 0, 1,
-1.023487, 1.353736, 0.547333, 1, 0.8509804, 0, 1,
-1.01758, -1.868406, -2.786175, 1, 0.8588235, 0, 1,
-1.01413, -0.3826963, -3.371671, 1, 0.8627451, 0, 1,
-1.011655, -0.07645573, -3.701177, 1, 0.8705882, 0, 1,
-1.00384, 0.0307764, -0.01034878, 1, 0.8745098, 0, 1,
-1.002732, 0.7206355, -0.5561, 1, 0.8823529, 0, 1,
-1.001898, 1.229828, -0.8652916, 1, 0.8862745, 0, 1,
-0.9999477, -0.103189, -2.890902, 1, 0.8941177, 0, 1,
-0.9965448, 0.3142795, -0.532941, 1, 0.8980392, 0, 1,
-0.9918048, 1.586012, 0.5905445, 1, 0.9058824, 0, 1,
-0.9900833, 0.8281999, -0.8324503, 1, 0.9137255, 0, 1,
-0.9815248, 0.8698452, 0.1038425, 1, 0.9176471, 0, 1,
-0.9791583, -0.4128492, -0.4319219, 1, 0.9254902, 0, 1,
-0.9791233, 0.6768772, -1.449385, 1, 0.9294118, 0, 1,
-0.9662353, -0.2626669, -1.03292, 1, 0.9372549, 0, 1,
-0.9563422, 1.707028, -1.663603, 1, 0.9411765, 0, 1,
-0.9556647, -1.270805, -3.259247, 1, 0.9490196, 0, 1,
-0.9443476, 0.4541587, 0.3291924, 1, 0.9529412, 0, 1,
-0.9438767, 0.2323108, -0.7372022, 1, 0.9607843, 0, 1,
-0.9435507, 1.505716, -0.8514456, 1, 0.9647059, 0, 1,
-0.9401607, -0.06615932, -1.050247, 1, 0.972549, 0, 1,
-0.9231054, 1.947022, 0.0496382, 1, 0.9764706, 0, 1,
-0.9216332, -2.253034, -1.367535, 1, 0.9843137, 0, 1,
-0.9184398, -0.3487624, -2.804121, 1, 0.9882353, 0, 1,
-0.9096698, -1.002213, -2.127762, 1, 0.9960784, 0, 1,
-0.9075725, -0.7746311, -1.956346, 0.9960784, 1, 0, 1,
-0.9067956, 0.7054713, -0.7104893, 0.9921569, 1, 0, 1,
-0.906601, -1.43032, -2.995202, 0.9843137, 1, 0, 1,
-0.9063618, 1.569032, -2.362553, 0.9803922, 1, 0, 1,
-0.887607, -1.221096, -1.358931, 0.972549, 1, 0, 1,
-0.8875112, 2.000027, -0.3793822, 0.9686275, 1, 0, 1,
-0.8862692, -0.3232754, -0.6202943, 0.9607843, 1, 0, 1,
-0.8843718, 0.2702091, -0.4375067, 0.9568627, 1, 0, 1,
-0.8709238, 0.5253716, -1.147619, 0.9490196, 1, 0, 1,
-0.8699288, -0.02511042, -2.072773, 0.945098, 1, 0, 1,
-0.8662542, -0.2226185, -1.818488, 0.9372549, 1, 0, 1,
-0.8657412, 1.119835, -0.6637834, 0.9333333, 1, 0, 1,
-0.8655974, -1.146981, -2.729272, 0.9254902, 1, 0, 1,
-0.8648352, 0.3140042, -1.124256, 0.9215686, 1, 0, 1,
-0.860084, -0.01164446, -1.744355, 0.9137255, 1, 0, 1,
-0.8580687, -2.740094, -2.713847, 0.9098039, 1, 0, 1,
-0.8551354, 1.881615, -0.613829, 0.9019608, 1, 0, 1,
-0.8513682, 0.05025385, -0.00861417, 0.8941177, 1, 0, 1,
-0.8494185, -1.575906, -2.882009, 0.8901961, 1, 0, 1,
-0.8484445, 0.8104221, -0.9579745, 0.8823529, 1, 0, 1,
-0.8409991, -0.3191539, -2.689849, 0.8784314, 1, 0, 1,
-0.8385572, -0.9196761, -4.651726, 0.8705882, 1, 0, 1,
-0.8359506, -0.1253611, -2.065902, 0.8666667, 1, 0, 1,
-0.828191, 0.7185389, -0.2782639, 0.8588235, 1, 0, 1,
-0.8188547, -0.0003087725, -1.923801, 0.854902, 1, 0, 1,
-0.8160667, -0.2587747, 0.04732811, 0.8470588, 1, 0, 1,
-0.8092459, 1.659612, -1.334744, 0.8431373, 1, 0, 1,
-0.8080032, -0.4436804, -0.8584743, 0.8352941, 1, 0, 1,
-0.807223, -2.125162, -3.813076, 0.8313726, 1, 0, 1,
-0.8054491, 0.352198, -2.120827, 0.8235294, 1, 0, 1,
-0.8038037, -0.8442459, -1.539845, 0.8196079, 1, 0, 1,
-0.8017644, 1.55991, -0.8044345, 0.8117647, 1, 0, 1,
-0.7928922, -0.6903942, -2.090464, 0.8078431, 1, 0, 1,
-0.7900965, 0.4407678, -2.910743, 0.8, 1, 0, 1,
-0.7894933, -0.7448234, -3.447499, 0.7921569, 1, 0, 1,
-0.7880081, 0.4278567, -1.698066, 0.7882353, 1, 0, 1,
-0.7880051, 0.9255367, -0.6035156, 0.7803922, 1, 0, 1,
-0.7794309, 0.7494298, -1.049638, 0.7764706, 1, 0, 1,
-0.7792501, 0.9308282, -0.6909983, 0.7686275, 1, 0, 1,
-0.7741507, -0.3083284, -1.286305, 0.7647059, 1, 0, 1,
-0.7635761, -1.474493, -3.747777, 0.7568628, 1, 0, 1,
-0.7624269, -1.399009, -2.186733, 0.7529412, 1, 0, 1,
-0.7468637, -0.4035234, -3.403027, 0.7450981, 1, 0, 1,
-0.7424989, 0.6001722, -1.252635, 0.7411765, 1, 0, 1,
-0.742482, -0.9227284, -2.92171, 0.7333333, 1, 0, 1,
-0.7368166, -0.1775552, -1.164472, 0.7294118, 1, 0, 1,
-0.7343975, -0.1569527, -1.694622, 0.7215686, 1, 0, 1,
-0.7318828, -0.02806338, 0.3818573, 0.7176471, 1, 0, 1,
-0.7306131, 0.2700235, -1.309473, 0.7098039, 1, 0, 1,
-0.7270474, -0.3093737, -0.3106122, 0.7058824, 1, 0, 1,
-0.726506, -0.9268745, -1.708247, 0.6980392, 1, 0, 1,
-0.7258608, 0.8409654, -0.5079169, 0.6901961, 1, 0, 1,
-0.7239436, -0.5767593, -3.22931, 0.6862745, 1, 0, 1,
-0.721751, -0.2398871, -2.706649, 0.6784314, 1, 0, 1,
-0.720939, 0.1075782, -3.051168, 0.6745098, 1, 0, 1,
-0.7190809, -0.5311962, -1.933709, 0.6666667, 1, 0, 1,
-0.7180597, 0.6316825, -0.3915677, 0.6627451, 1, 0, 1,
-0.717854, 0.78875, -0.9165017, 0.654902, 1, 0, 1,
-0.7172793, -0.3788353, -3.203878, 0.6509804, 1, 0, 1,
-0.7148992, 0.2198417, -0.5736967, 0.6431373, 1, 0, 1,
-0.7139646, 0.4938896, -0.8940866, 0.6392157, 1, 0, 1,
-0.7135949, 0.7172541, 0.5431197, 0.6313726, 1, 0, 1,
-0.7118291, 0.5343586, 1.449261, 0.627451, 1, 0, 1,
-0.7114858, 1.242644, -0.5029585, 0.6196079, 1, 0, 1,
-0.7111349, 2.578299, -0.3289153, 0.6156863, 1, 0, 1,
-0.7069322, 0.7168799, 0.6267539, 0.6078432, 1, 0, 1,
-0.6981052, 0.6823279, 0.7151175, 0.6039216, 1, 0, 1,
-0.6902109, -0.853353, -5.118912, 0.5960785, 1, 0, 1,
-0.6869974, 0.2939875, -0.4379369, 0.5882353, 1, 0, 1,
-0.6858863, -0.35129, -2.977268, 0.5843138, 1, 0, 1,
-0.683281, 0.08461615, -0.5572817, 0.5764706, 1, 0, 1,
-0.681489, -1.468577, -2.171578, 0.572549, 1, 0, 1,
-0.6801273, -0.1491087, -0.2531838, 0.5647059, 1, 0, 1,
-0.6795912, 0.4400868, 0.1641839, 0.5607843, 1, 0, 1,
-0.677068, -1.422922, -2.119515, 0.5529412, 1, 0, 1,
-0.6759741, -0.3963428, -0.9088944, 0.5490196, 1, 0, 1,
-0.6758556, 0.1985239, -0.4107412, 0.5411765, 1, 0, 1,
-0.6730006, 0.4204662, -2.071485, 0.5372549, 1, 0, 1,
-0.6716078, 1.158315, -1.131793, 0.5294118, 1, 0, 1,
-0.6712308, -1.396999, -2.978729, 0.5254902, 1, 0, 1,
-0.6618807, 0.4814683, -2.355498, 0.5176471, 1, 0, 1,
-0.6603374, -0.323777, -1.766862, 0.5137255, 1, 0, 1,
-0.6517788, -0.5427106, -1.864489, 0.5058824, 1, 0, 1,
-0.6503755, -1.201746, -0.8362998, 0.5019608, 1, 0, 1,
-0.6447801, -0.943684, -0.5449372, 0.4941176, 1, 0, 1,
-0.6280787, 0.8540069, 0.9855019, 0.4862745, 1, 0, 1,
-0.6218262, 0.7692659, -0.6181868, 0.4823529, 1, 0, 1,
-0.6211908, -0.9960814, -1.491837, 0.4745098, 1, 0, 1,
-0.6178427, 1.330586, -0.7418246, 0.4705882, 1, 0, 1,
-0.6156492, -1.175162, -4.235159, 0.4627451, 1, 0, 1,
-0.6107847, 0.8932819, -0.5675762, 0.4588235, 1, 0, 1,
-0.6104048, -0.7606316, -2.879017, 0.4509804, 1, 0, 1,
-0.6091058, -0.08947486, -0.8863355, 0.4470588, 1, 0, 1,
-0.6077987, -1.062742, -2.239645, 0.4392157, 1, 0, 1,
-0.5992101, -0.6226087, -2.176942, 0.4352941, 1, 0, 1,
-0.5960344, 0.2024553, -1.287487, 0.427451, 1, 0, 1,
-0.5942201, 0.7448369, -0.4630557, 0.4235294, 1, 0, 1,
-0.5933691, 0.3757473, -1.162491, 0.4156863, 1, 0, 1,
-0.5878796, -0.6205541, -4.402329, 0.4117647, 1, 0, 1,
-0.5842646, -0.9033718, -3.057333, 0.4039216, 1, 0, 1,
-0.5836349, -0.908058, -2.65025, 0.3960784, 1, 0, 1,
-0.5800065, 0.9038708, -1.938283, 0.3921569, 1, 0, 1,
-0.5763731, 0.6134192, -0.3179831, 0.3843137, 1, 0, 1,
-0.5673382, -1.093949, -2.524374, 0.3803922, 1, 0, 1,
-0.5520349, 0.3591577, -1.867444, 0.372549, 1, 0, 1,
-0.5505019, 0.3968083, -0.7990627, 0.3686275, 1, 0, 1,
-0.5504509, 1.068039, -0.0955398, 0.3607843, 1, 0, 1,
-0.5479057, -1.360462, -0.4205323, 0.3568628, 1, 0, 1,
-0.5439816, 1.980892, -1.467198, 0.3490196, 1, 0, 1,
-0.5427595, 0.7517837, 0.3266903, 0.345098, 1, 0, 1,
-0.5406013, 1.628404, 0.3586683, 0.3372549, 1, 0, 1,
-0.5395176, 0.4717738, -0.6248084, 0.3333333, 1, 0, 1,
-0.5366843, 0.4565427, 0.3705268, 0.3254902, 1, 0, 1,
-0.5338118, 0.02249684, -2.35861, 0.3215686, 1, 0, 1,
-0.5316456, -0.5400516, -0.9223704, 0.3137255, 1, 0, 1,
-0.5284565, -1.229645, -3.711926, 0.3098039, 1, 0, 1,
-0.5249523, 0.6550078, 0.2901832, 0.3019608, 1, 0, 1,
-0.523888, -0.924808, -4.062523, 0.2941177, 1, 0, 1,
-0.5211269, 0.4480306, -1.602614, 0.2901961, 1, 0, 1,
-0.5206432, -0.401745, -2.271073, 0.282353, 1, 0, 1,
-0.5157833, 0.5350934, -0.9565176, 0.2784314, 1, 0, 1,
-0.5094847, -0.3672282, -1.910903, 0.2705882, 1, 0, 1,
-0.5045621, -0.09119048, -2.042273, 0.2666667, 1, 0, 1,
-0.5041071, -0.3944597, -1.339171, 0.2588235, 1, 0, 1,
-0.5007459, 0.04448319, -1.24007, 0.254902, 1, 0, 1,
-0.4987109, -1.586458, -2.163707, 0.2470588, 1, 0, 1,
-0.4936966, -0.2035644, -3.26551, 0.2431373, 1, 0, 1,
-0.4905794, -0.2104668, -3.397745, 0.2352941, 1, 0, 1,
-0.4808176, 0.2279289, -0.03262492, 0.2313726, 1, 0, 1,
-0.480495, 1.274602, 0.4519429, 0.2235294, 1, 0, 1,
-0.4762833, -0.2401379, -2.633731, 0.2196078, 1, 0, 1,
-0.4742266, -0.2397763, -1.37498, 0.2117647, 1, 0, 1,
-0.4732782, -1.599786, -3.576934, 0.2078431, 1, 0, 1,
-0.4650967, 1.088543, -1.99503, 0.2, 1, 0, 1,
-0.4593458, 0.3293636, -1.850671, 0.1921569, 1, 0, 1,
-0.4590528, -1.276398, -2.265807, 0.1882353, 1, 0, 1,
-0.4545577, -0.4297984, -1.200245, 0.1803922, 1, 0, 1,
-0.4521857, -0.5023161, -2.500247, 0.1764706, 1, 0, 1,
-0.4504992, 0.5030153, -3.020106, 0.1686275, 1, 0, 1,
-0.4484468, -0.3192827, -2.810842, 0.1647059, 1, 0, 1,
-0.4479535, -3.404503, -4.967842, 0.1568628, 1, 0, 1,
-0.4459631, -2.038479, -3.29662, 0.1529412, 1, 0, 1,
-0.4411533, 1.155369, 1.403472, 0.145098, 1, 0, 1,
-0.4396285, 1.100469, 0.698678, 0.1411765, 1, 0, 1,
-0.4365366, 1.262231, 0.5677616, 0.1333333, 1, 0, 1,
-0.4362647, 1.273302, 1.009901, 0.1294118, 1, 0, 1,
-0.4361385, 0.3452325, -0.5966699, 0.1215686, 1, 0, 1,
-0.4346391, 0.7037962, -1.382891, 0.1176471, 1, 0, 1,
-0.4297307, 0.2092704, -0.1217144, 0.1098039, 1, 0, 1,
-0.426495, -1.455263, -4.867327, 0.1058824, 1, 0, 1,
-0.4261001, -0.3896311, -1.447043, 0.09803922, 1, 0, 1,
-0.4192183, -0.7326069, -4.053472, 0.09019608, 1, 0, 1,
-0.4185307, 0.9516643, -0.3295682, 0.08627451, 1, 0, 1,
-0.4183859, 1.023175, -0.5956857, 0.07843138, 1, 0, 1,
-0.4181151, 1.15815, -0.05222065, 0.07450981, 1, 0, 1,
-0.413962, -1.148551, -0.5711713, 0.06666667, 1, 0, 1,
-0.4139194, -2.087292, -6.438361, 0.0627451, 1, 0, 1,
-0.4137131, -1.017863, 0.9916531, 0.05490196, 1, 0, 1,
-0.4120646, -0.2805462, -2.678478, 0.05098039, 1, 0, 1,
-0.4101588, 0.3438614, -0.9864609, 0.04313726, 1, 0, 1,
-0.4067703, 2.22948, 0.6333212, 0.03921569, 1, 0, 1,
-0.4050012, 0.3020244, -2.603524, 0.03137255, 1, 0, 1,
-0.4015706, -1.210558, -2.951756, 0.02745098, 1, 0, 1,
-0.4006318, 0.8747063, 0.3921133, 0.01960784, 1, 0, 1,
-0.3936081, -0.8466894, -3.613898, 0.01568628, 1, 0, 1,
-0.3932109, 0.6913651, -0.9520209, 0.007843138, 1, 0, 1,
-0.3857697, 1.1163, -1.270502, 0.003921569, 1, 0, 1,
-0.3806496, 1.033661, 0.8974904, 0, 1, 0.003921569, 1,
-0.3805205, -0.5743665, -3.095936, 0, 1, 0.01176471, 1,
-0.3786919, 1.457681, -0.545679, 0, 1, 0.01568628, 1,
-0.3779725, 0.1567466, 0.1274342, 0, 1, 0.02352941, 1,
-0.3760075, -1.632366, -3.554433, 0, 1, 0.02745098, 1,
-0.3732528, -2.003777, -3.12277, 0, 1, 0.03529412, 1,
-0.3712956, 0.1535663, 0.2254387, 0, 1, 0.03921569, 1,
-0.3690386, 0.8441361, 1.455714, 0, 1, 0.04705882, 1,
-0.3678383, -0.3333142, -2.240125, 0, 1, 0.05098039, 1,
-0.3678295, -0.8055295, -1.025996, 0, 1, 0.05882353, 1,
-0.3578584, 1.698225, 0.7387859, 0, 1, 0.0627451, 1,
-0.3529254, -1.05076, -3.371917, 0, 1, 0.07058824, 1,
-0.3519537, 2.214569, -0.2996937, 0, 1, 0.07450981, 1,
-0.3509797, -0.9982109, -2.507542, 0, 1, 0.08235294, 1,
-0.3477975, 2.08989, 0.02077958, 0, 1, 0.08627451, 1,
-0.347607, -0.4310345, -1.436879, 0, 1, 0.09411765, 1,
-0.347219, -0.8393915, -2.100884, 0, 1, 0.1019608, 1,
-0.3431881, -0.5207657, -4.307354, 0, 1, 0.1058824, 1,
-0.340738, 1.456789, 0.6054392, 0, 1, 0.1137255, 1,
-0.3387916, -0.3896139, -3.949899, 0, 1, 0.1176471, 1,
-0.336386, -0.9283305, -2.833494, 0, 1, 0.1254902, 1,
-0.3350154, 0.3359048, -0.4214974, 0, 1, 0.1294118, 1,
-0.3349828, 0.2240201, -2.074677, 0, 1, 0.1372549, 1,
-0.3341187, 0.537648, -0.05917763, 0, 1, 0.1411765, 1,
-0.3328377, -0.79195, -1.749495, 0, 1, 0.1490196, 1,
-0.3319969, 0.8138068, -0.6237983, 0, 1, 0.1529412, 1,
-0.3307172, 0.03263531, -2.918651, 0, 1, 0.1607843, 1,
-0.3299854, 0.4262103, -1.0066, 0, 1, 0.1647059, 1,
-0.3294546, 1.259583, 1.281234, 0, 1, 0.172549, 1,
-0.3281956, 0.8473753, -0.2838291, 0, 1, 0.1764706, 1,
-0.3207532, -0.5186698, -3.045589, 0, 1, 0.1843137, 1,
-0.3173635, 0.7266005, -0.8088224, 0, 1, 0.1882353, 1,
-0.3168399, -0.1842133, -1.420222, 0, 1, 0.1960784, 1,
-0.3161753, -0.8719571, -2.037354, 0, 1, 0.2039216, 1,
-0.3149621, -1.078718, -3.724277, 0, 1, 0.2078431, 1,
-0.3148526, 0.8318031, -1.085491, 0, 1, 0.2156863, 1,
-0.313251, -0.8009105, -1.71965, 0, 1, 0.2196078, 1,
-0.3111019, -0.4058352, -1.743459, 0, 1, 0.227451, 1,
-0.2997608, 1.743445, 0.6313479, 0, 1, 0.2313726, 1,
-0.2971893, -0.9758115, -2.530169, 0, 1, 0.2392157, 1,
-0.2938828, 0.4602941, -0.05207103, 0, 1, 0.2431373, 1,
-0.2931775, -1.351223, -3.363858, 0, 1, 0.2509804, 1,
-0.2911796, -1.559717, -3.583166, 0, 1, 0.254902, 1,
-0.2840757, -0.1343045, -2.327878, 0, 1, 0.2627451, 1,
-0.2773344, -0.1710313, -1.412192, 0, 1, 0.2666667, 1,
-0.2740206, 0.9640073, -1.557854, 0, 1, 0.2745098, 1,
-0.2704521, -0.2982301, -1.712318, 0, 1, 0.2784314, 1,
-0.2699799, 0.02019821, -1.393088, 0, 1, 0.2862745, 1,
-0.265873, 0.1962213, -1.542976, 0, 1, 0.2901961, 1,
-0.2520956, -1.155656, -3.381769, 0, 1, 0.2980392, 1,
-0.2502072, -1.072467, -3.835841, 0, 1, 0.3058824, 1,
-0.247095, -0.03659487, -3.119364, 0, 1, 0.3098039, 1,
-0.2462954, 0.1000713, 0.1292544, 0, 1, 0.3176471, 1,
-0.2432927, -2.43753, -3.802591, 0, 1, 0.3215686, 1,
-0.2403305, 0.5197256, 1.213746, 0, 1, 0.3294118, 1,
-0.233829, 0.07554884, -2.107061, 0, 1, 0.3333333, 1,
-0.2328692, 1.237841, -0.5701006, 0, 1, 0.3411765, 1,
-0.2257551, 0.7310269, 0.02698945, 0, 1, 0.345098, 1,
-0.2255713, -0.6924855, -3.031273, 0, 1, 0.3529412, 1,
-0.2170097, 0.2488302, -0.6417716, 0, 1, 0.3568628, 1,
-0.2169801, -1.833264, -1.930281, 0, 1, 0.3647059, 1,
-0.2112655, -1.1105, -3.902035, 0, 1, 0.3686275, 1,
-0.2088414, -0.5260605, -2.392371, 0, 1, 0.3764706, 1,
-0.2064147, 2.255515, 1.674322, 0, 1, 0.3803922, 1,
-0.2059814, 1.750799, 1.837419, 0, 1, 0.3882353, 1,
-0.2044554, -1.682976, -0.4339622, 0, 1, 0.3921569, 1,
-0.2042869, -0.2432265, -1.927158, 0, 1, 0.4, 1,
-0.2037999, -0.9319086, -2.416382, 0, 1, 0.4078431, 1,
-0.1958296, 0.06227731, -1.12201, 0, 1, 0.4117647, 1,
-0.1951639, -0.1300461, -4.117587, 0, 1, 0.4196078, 1,
-0.1895278, -0.9959069, -3.299622, 0, 1, 0.4235294, 1,
-0.1883429, 0.2309285, 0.1311769, 0, 1, 0.4313726, 1,
-0.1855903, 1.126589, -0.455239, 0, 1, 0.4352941, 1,
-0.1853037, 0.5929459, 0.2193279, 0, 1, 0.4431373, 1,
-0.1839375, 0.3460152, 0.4271357, 0, 1, 0.4470588, 1,
-0.1828417, -0.3823089, -4.386738, 0, 1, 0.454902, 1,
-0.1760414, -1.116654, -2.594644, 0, 1, 0.4588235, 1,
-0.1750173, 0.9215712, -1.004001, 0, 1, 0.4666667, 1,
-0.174208, 0.297454, 0.3999718, 0, 1, 0.4705882, 1,
-0.1712971, -0.4752185, -1.763432, 0, 1, 0.4784314, 1,
-0.1711233, 0.3836344, -0.3690994, 0, 1, 0.4823529, 1,
-0.1661187, 0.333859, 0.9125734, 0, 1, 0.4901961, 1,
-0.1660349, 0.4146566, -0.3324615, 0, 1, 0.4941176, 1,
-0.1657793, -0.09156374, -0.5620184, 0, 1, 0.5019608, 1,
-0.1649678, -1.700478, -3.455268, 0, 1, 0.509804, 1,
-0.1583498, -1.599758, -1.898601, 0, 1, 0.5137255, 1,
-0.1581692, 0.1145236, 0.2714258, 0, 1, 0.5215687, 1,
-0.1572027, 0.5255408, 0.3070376, 0, 1, 0.5254902, 1,
-0.1569186, 0.3653017, 0.9933057, 0, 1, 0.5333334, 1,
-0.156854, -0.4157019, -2.750634, 0, 1, 0.5372549, 1,
-0.1542147, 0.1769163, -1.01449, 0, 1, 0.5450981, 1,
-0.1534176, 1.323551, -1.156514, 0, 1, 0.5490196, 1,
-0.153182, -0.384497, -2.469589, 0, 1, 0.5568628, 1,
-0.1527793, -0.7475896, -1.674698, 0, 1, 0.5607843, 1,
-0.1521793, -2.089957, -3.187772, 0, 1, 0.5686275, 1,
-0.1519903, -0.5186061, -2.513213, 0, 1, 0.572549, 1,
-0.149267, 0.7746548, 0.08943795, 0, 1, 0.5803922, 1,
-0.1491105, -0.4054233, -3.297818, 0, 1, 0.5843138, 1,
-0.1484167, -1.15762, -3.647229, 0, 1, 0.5921569, 1,
-0.1481258, 1.620001, -1.130103, 0, 1, 0.5960785, 1,
-0.1478115, -1.449262, -2.799307, 0, 1, 0.6039216, 1,
-0.1430292, -0.2552074, -1.970652, 0, 1, 0.6117647, 1,
-0.1427617, 0.8617341, 0.7133111, 0, 1, 0.6156863, 1,
-0.1366824, 0.9641339, -1.053469, 0, 1, 0.6235294, 1,
-0.1365814, -1.626266, -4.825029, 0, 1, 0.627451, 1,
-0.1363149, -0.5878595, -3.269814, 0, 1, 0.6352941, 1,
-0.1335325, 0.2558831, -0.3952354, 0, 1, 0.6392157, 1,
-0.1330826, 0.7172705, -0.08417949, 0, 1, 0.6470588, 1,
-0.1329231, -0.6864794, -2.418728, 0, 1, 0.6509804, 1,
-0.1321479, 0.1447626, -2.027718, 0, 1, 0.6588235, 1,
-0.1292315, 0.4860522, 0.6915811, 0, 1, 0.6627451, 1,
-0.1246564, -2.511483, -4.259097, 0, 1, 0.6705883, 1,
-0.1235246, 0.1620429, -0.2797195, 0, 1, 0.6745098, 1,
-0.1163704, -0.2992765, -3.704742, 0, 1, 0.682353, 1,
-0.1158766, 1.347087, -1.419568, 0, 1, 0.6862745, 1,
-0.1077361, -0.7860685, -0.2997777, 0, 1, 0.6941177, 1,
-0.1061772, 0.5167576, 1.196584, 0, 1, 0.7019608, 1,
-0.09785328, 0.6741285, -0.4940138, 0, 1, 0.7058824, 1,
-0.0961911, -0.7598264, -3.683628, 0, 1, 0.7137255, 1,
-0.09581368, -0.6356621, -3.114321, 0, 1, 0.7176471, 1,
-0.09461121, -1.289847, -2.817477, 0, 1, 0.7254902, 1,
-0.09417059, -0.007504495, -2.774198, 0, 1, 0.7294118, 1,
-0.09397131, 0.4317881, -1.035527, 0, 1, 0.7372549, 1,
-0.09299901, -0.5998961, -1.137246, 0, 1, 0.7411765, 1,
-0.09162704, -1.07971, -3.680384, 0, 1, 0.7490196, 1,
-0.08282167, -0.6195179, -2.36795, 0, 1, 0.7529412, 1,
-0.08085056, -1.518852, -3.335451, 0, 1, 0.7607843, 1,
-0.07768056, -2.408554, -3.160983, 0, 1, 0.7647059, 1,
-0.07405871, 0.4833615, -0.6797255, 0, 1, 0.772549, 1,
-0.06635365, 1.043679, 0.2308343, 0, 1, 0.7764706, 1,
-0.06564091, -0.2295436, -1.092059, 0, 1, 0.7843137, 1,
-0.0647314, 0.8198137, -0.5949087, 0, 1, 0.7882353, 1,
-0.05934327, 0.1486043, -0.3224767, 0, 1, 0.7960784, 1,
-0.05219231, -1.771899, -2.742983, 0, 1, 0.8039216, 1,
-0.05204359, 2.506393, 0.3017013, 0, 1, 0.8078431, 1,
-0.05199958, 0.8894598, -0.5729722, 0, 1, 0.8156863, 1,
-0.04730869, 0.2993217, -0.08035606, 0, 1, 0.8196079, 1,
-0.04663309, 0.2689684, 0.1305886, 0, 1, 0.827451, 1,
-0.04497367, 0.2320669, -2.440706, 0, 1, 0.8313726, 1,
-0.0418112, -0.2450721, -2.657453, 0, 1, 0.8392157, 1,
-0.04094487, 0.1245909, -0.05912548, 0, 1, 0.8431373, 1,
-0.04072703, -0.7620749, -4.079662, 0, 1, 0.8509804, 1,
-0.0361008, -0.02764004, -3.648346, 0, 1, 0.854902, 1,
-0.03565353, -2.057859, -3.410737, 0, 1, 0.8627451, 1,
-0.02739784, -0.206149, -4.021011, 0, 1, 0.8666667, 1,
-0.02395432, -0.5510001, -3.236989, 0, 1, 0.8745098, 1,
-0.02388379, -0.3895755, -1.336771, 0, 1, 0.8784314, 1,
-0.02281237, -0.3442346, -2.411218, 0, 1, 0.8862745, 1,
-0.0207588, 1.71298, 1.514476, 0, 1, 0.8901961, 1,
-0.01589002, 1.453771, 2.372704, 0, 1, 0.8980392, 1,
-0.01563558, -0.2187609, -3.476143, 0, 1, 0.9058824, 1,
-0.009182028, -0.6401337, -4.613432, 0, 1, 0.9098039, 1,
-0.008096461, -1.55311, -2.851572, 0, 1, 0.9176471, 1,
-0.003647957, -0.638716, -5.877021, 0, 1, 0.9215686, 1,
-0.003391709, -0.6367871, -2.154645, 0, 1, 0.9294118, 1,
-0.003234398, -0.03130876, -2.089944, 0, 1, 0.9333333, 1,
-0.002126705, 0.3117119, -0.657969, 0, 1, 0.9411765, 1,
0.0008301814, 0.7862215, 0.03470879, 0, 1, 0.945098, 1,
0.001647922, -0.5418556, 1.729139, 0, 1, 0.9529412, 1,
0.001740425, 1.192303, -0.1774281, 0, 1, 0.9568627, 1,
0.002808207, 0.8840815, -0.5557314, 0, 1, 0.9647059, 1,
0.007222729, 1.771893, -0.2336373, 0, 1, 0.9686275, 1,
0.02006779, 0.2531305, 0.3330435, 0, 1, 0.9764706, 1,
0.02369376, -0.3076138, 3.855585, 0, 1, 0.9803922, 1,
0.02466969, 2.799492, -1.444749, 0, 1, 0.9882353, 1,
0.0279261, -0.5945911, 2.223647, 0, 1, 0.9921569, 1,
0.02973826, 0.4548841, -0.2676841, 0, 1, 1, 1,
0.03443896, 0.8831922, 0.02989838, 0, 0.9921569, 1, 1,
0.03625898, -0.4280657, 1.586511, 0, 0.9882353, 1, 1,
0.0364283, -1.046399, 4.331183, 0, 0.9803922, 1, 1,
0.03899818, -0.6862005, 1.528146, 0, 0.9764706, 1, 1,
0.04128932, 0.5229484, 1.712967, 0, 0.9686275, 1, 1,
0.05128341, -1.515677, 1.432481, 0, 0.9647059, 1, 1,
0.05292697, 2.749332, 2.47134, 0, 0.9568627, 1, 1,
0.05306876, 1.968225, -0.2976655, 0, 0.9529412, 1, 1,
0.05395878, 0.3653151, -0.4565409, 0, 0.945098, 1, 1,
0.0546084, 0.003831002, 2.218069, 0, 0.9411765, 1, 1,
0.05645555, -0.1681411, 3.261637, 0, 0.9333333, 1, 1,
0.05781514, 0.6035246, -0.4416035, 0, 0.9294118, 1, 1,
0.05892207, -0.5842381, 3.72203, 0, 0.9215686, 1, 1,
0.06061778, 0.7663887, -0.9020417, 0, 0.9176471, 1, 1,
0.06069814, 0.7891299, -0.3984568, 0, 0.9098039, 1, 1,
0.06410393, -0.9638113, 2.319504, 0, 0.9058824, 1, 1,
0.06449606, 0.4334033, -1.197786, 0, 0.8980392, 1, 1,
0.06533361, -1.605833, 2.628716, 0, 0.8901961, 1, 1,
0.06548397, 0.9685215, 0.5973481, 0, 0.8862745, 1, 1,
0.0683643, 1.498762, 0.4147581, 0, 0.8784314, 1, 1,
0.07170505, -1.770447, 4.272083, 0, 0.8745098, 1, 1,
0.07350089, -0.1066182, 4.404619, 0, 0.8666667, 1, 1,
0.07486122, -0.558798, 3.94293, 0, 0.8627451, 1, 1,
0.07490889, 1.109527, 1.424314, 0, 0.854902, 1, 1,
0.0800782, -1.291828, 3.495664, 0, 0.8509804, 1, 1,
0.08256476, -0.1444434, 2.440437, 0, 0.8431373, 1, 1,
0.08847237, 0.1150846, 1.791889, 0, 0.8392157, 1, 1,
0.08852392, -0.05344846, 2.102348, 0, 0.8313726, 1, 1,
0.08996216, 0.0438184, 0.8825613, 0, 0.827451, 1, 1,
0.09091218, 0.1342308, 1.540421, 0, 0.8196079, 1, 1,
0.09289645, -1.335806, 3.615712, 0, 0.8156863, 1, 1,
0.09300005, 0.2920117, -1.166811, 0, 0.8078431, 1, 1,
0.09564008, 0.4825074, 0.8871244, 0, 0.8039216, 1, 1,
0.09836187, -0.4348469, 4.539059, 0, 0.7960784, 1, 1,
0.09844835, -0.07925196, 0.5692832, 0, 0.7882353, 1, 1,
0.1010763, 0.01044104, -0.09300683, 0, 0.7843137, 1, 1,
0.1021534, 1.037769, 0.1848828, 0, 0.7764706, 1, 1,
0.1082092, 0.9376308, -1.209667, 0, 0.772549, 1, 1,
0.1093466, -0.6596841, 5.309507, 0, 0.7647059, 1, 1,
0.1094493, 0.157129, -0.401913, 0, 0.7607843, 1, 1,
0.1131758, -0.8291956, 3.442999, 0, 0.7529412, 1, 1,
0.1172565, -0.6059471, 4.461389, 0, 0.7490196, 1, 1,
0.118389, 1.119844, 1.85082, 0, 0.7411765, 1, 1,
0.1271329, -0.3914425, 1.819718, 0, 0.7372549, 1, 1,
0.1273601, -1.03133, 4.04059, 0, 0.7294118, 1, 1,
0.1286307, -0.1917776, 3.164531, 0, 0.7254902, 1, 1,
0.131336, -0.5155508, 2.713353, 0, 0.7176471, 1, 1,
0.1335787, -1.54364, 4.151455, 0, 0.7137255, 1, 1,
0.1345216, 1.018029, -1.488706, 0, 0.7058824, 1, 1,
0.1383504, 0.5960703, 1.337202, 0, 0.6980392, 1, 1,
0.1399518, -0.9892923, 1.549884, 0, 0.6941177, 1, 1,
0.1403004, 0.265375, 0.3050644, 0, 0.6862745, 1, 1,
0.1425371, 0.905441, 2.152659, 0, 0.682353, 1, 1,
0.145776, 0.7067259, -1.033916, 0, 0.6745098, 1, 1,
0.1491714, 1.358787, 0.4195619, 0, 0.6705883, 1, 1,
0.1501748, 1.026936, 0.9917278, 0, 0.6627451, 1, 1,
0.151001, -0.07437835, 2.6867, 0, 0.6588235, 1, 1,
0.155014, 0.367073, -0.5635716, 0, 0.6509804, 1, 1,
0.1568473, 0.5571353, 0.3342296, 0, 0.6470588, 1, 1,
0.1580265, -0.5519348, 2.002316, 0, 0.6392157, 1, 1,
0.1591813, -1.122401, 2.851954, 0, 0.6352941, 1, 1,
0.1614129, 1.880332, -1.207127, 0, 0.627451, 1, 1,
0.1619642, -1.182932, 2.963279, 0, 0.6235294, 1, 1,
0.1629829, 0.2074618, 0.9647824, 0, 0.6156863, 1, 1,
0.1638582, -1.980595, 1.844257, 0, 0.6117647, 1, 1,
0.1646896, 0.967509, 0.7683758, 0, 0.6039216, 1, 1,
0.1658075, -1.505969, 2.439038, 0, 0.5960785, 1, 1,
0.1667141, -1.083438, 3.455366, 0, 0.5921569, 1, 1,
0.1713392, 1.357487, 0.7488205, 0, 0.5843138, 1, 1,
0.1744534, 0.6988186, 0.1887572, 0, 0.5803922, 1, 1,
0.1798372, 0.1121485, -0.2763127, 0, 0.572549, 1, 1,
0.1828995, -2.818207, 3.608692, 0, 0.5686275, 1, 1,
0.1838773, 0.3316318, 0.203469, 0, 0.5607843, 1, 1,
0.1883545, -0.8869593, 3.06576, 0, 0.5568628, 1, 1,
0.1900342, 0.298052, -0.5508364, 0, 0.5490196, 1, 1,
0.1970271, -0.1593586, 0.9545989, 0, 0.5450981, 1, 1,
0.2070725, -0.9618393, 3.534397, 0, 0.5372549, 1, 1,
0.2080624, 0.8334936, 0.5897518, 0, 0.5333334, 1, 1,
0.2122724, 0.8698742, 1.763736, 0, 0.5254902, 1, 1,
0.2152508, 1.520983, 1.980721, 0, 0.5215687, 1, 1,
0.2152797, -2.441614, 3.053135, 0, 0.5137255, 1, 1,
0.2167833, 0.4792147, -0.05738095, 0, 0.509804, 1, 1,
0.2203826, 1.478862, -0.8789592, 0, 0.5019608, 1, 1,
0.2218833, 0.5517058, -0.460523, 0, 0.4941176, 1, 1,
0.2245512, -1.446224, 1.884717, 0, 0.4901961, 1, 1,
0.2270764, -2.243461, 3.595202, 0, 0.4823529, 1, 1,
0.2273671, 0.7990322, -1.470692, 0, 0.4784314, 1, 1,
0.2287559, 0.4623742, -0.1236357, 0, 0.4705882, 1, 1,
0.2326132, 0.3397765, 0.1168062, 0, 0.4666667, 1, 1,
0.2354586, 0.6490502, -0.2915141, 0, 0.4588235, 1, 1,
0.2382234, -0.3740348, 2.298649, 0, 0.454902, 1, 1,
0.2385259, 1.335432, -0.3822689, 0, 0.4470588, 1, 1,
0.2498685, -0.1542853, 1.610327, 0, 0.4431373, 1, 1,
0.2519643, -1.062841, 3.67283, 0, 0.4352941, 1, 1,
0.2675387, -0.7175758, 2.018767, 0, 0.4313726, 1, 1,
0.272916, -2.289456, 4.917471, 0, 0.4235294, 1, 1,
0.2770557, 1.000523, 2.460899, 0, 0.4196078, 1, 1,
0.2781778, 0.2652449, 1.49836, 0, 0.4117647, 1, 1,
0.2810188, 1.496879, 0.3752907, 0, 0.4078431, 1, 1,
0.2817252, -0.8794294, 3.046501, 0, 0.4, 1, 1,
0.2863927, -2.132298, 3.596551, 0, 0.3921569, 1, 1,
0.2867135, -2.13128, 3.214111, 0, 0.3882353, 1, 1,
0.2870887, 1.246376, -0.3738688, 0, 0.3803922, 1, 1,
0.2883245, 0.2972697, 0.01094156, 0, 0.3764706, 1, 1,
0.2907256, 1.010956, -0.144766, 0, 0.3686275, 1, 1,
0.2944949, 2.15044, -1.508239, 0, 0.3647059, 1, 1,
0.2997244, -0.6335258, 3.205163, 0, 0.3568628, 1, 1,
0.3022232, -0.07388576, 2.122543, 0, 0.3529412, 1, 1,
0.302729, 0.9866506, 0.2950121, 0, 0.345098, 1, 1,
0.3036725, -0.1740152, 0.6141417, 0, 0.3411765, 1, 1,
0.3074556, 0.3019725, 1.022872, 0, 0.3333333, 1, 1,
0.3105172, 0.5954148, -0.1377645, 0, 0.3294118, 1, 1,
0.3112261, 0.1609731, 1.300007, 0, 0.3215686, 1, 1,
0.3151664, 0.2515123, -0.07167163, 0, 0.3176471, 1, 1,
0.3153837, 0.6941003, 1.547398, 0, 0.3098039, 1, 1,
0.3180993, 0.5544604, -0.003127719, 0, 0.3058824, 1, 1,
0.3194879, -0.2756612, 0.9823059, 0, 0.2980392, 1, 1,
0.3223394, -1.359161, 1.146711, 0, 0.2901961, 1, 1,
0.3230529, -0.359129, 2.36768, 0, 0.2862745, 1, 1,
0.3300374, -0.5287945, 2.78255, 0, 0.2784314, 1, 1,
0.3331195, -1.000065, 3.491593, 0, 0.2745098, 1, 1,
0.3433247, -0.8383385, 4.997454, 0, 0.2666667, 1, 1,
0.3444601, 1.867517, 0.08265167, 0, 0.2627451, 1, 1,
0.3465002, 1.224749, 0.4959998, 0, 0.254902, 1, 1,
0.3484338, 0.5640749, -0.8983083, 0, 0.2509804, 1, 1,
0.3513867, -2.127305, 3.846913, 0, 0.2431373, 1, 1,
0.3517979, 2.592686, -2.428478, 0, 0.2392157, 1, 1,
0.3544403, 0.4558193, 2.08428, 0, 0.2313726, 1, 1,
0.3547518, -1.295838, 3.264676, 0, 0.227451, 1, 1,
0.356559, 1.280929, -1.664229, 0, 0.2196078, 1, 1,
0.3603621, 1.096539, 0.6308033, 0, 0.2156863, 1, 1,
0.3670106, -0.8169647, 3.142279, 0, 0.2078431, 1, 1,
0.3691109, -1.053588, 2.641478, 0, 0.2039216, 1, 1,
0.3701035, -2.182608, 2.657552, 0, 0.1960784, 1, 1,
0.370581, -0.264968, 2.930276, 0, 0.1882353, 1, 1,
0.3871734, 0.744728, -0.3932819, 0, 0.1843137, 1, 1,
0.3872969, -0.3068123, 2.435428, 0, 0.1764706, 1, 1,
0.3874962, 0.7475498, 0.9316856, 0, 0.172549, 1, 1,
0.3875819, 0.3415103, 0.3625157, 0, 0.1647059, 1, 1,
0.3882346, -2.110977, 2.71917, 0, 0.1607843, 1, 1,
0.3923989, -0.7512376, 0.7403874, 0, 0.1529412, 1, 1,
0.3943859, 0.778073, 0.9227864, 0, 0.1490196, 1, 1,
0.3951409, -0.6351632, 1.782111, 0, 0.1411765, 1, 1,
0.3964876, -0.3584334, 2.166312, 0, 0.1372549, 1, 1,
0.3995372, 0.6024477, 2.229058, 0, 0.1294118, 1, 1,
0.4028237, 0.9361258, 0.8602954, 0, 0.1254902, 1, 1,
0.4077398, 0.8168146, 0.2797128, 0, 0.1176471, 1, 1,
0.407934, -1.066129, 1.849028, 0, 0.1137255, 1, 1,
0.4088736, 0.15265, 0.8193151, 0, 0.1058824, 1, 1,
0.4109405, -1.130509, 2.423017, 0, 0.09803922, 1, 1,
0.412338, -1.635512, 3.668582, 0, 0.09411765, 1, 1,
0.4171324, -0.1166208, 1.005966, 0, 0.08627451, 1, 1,
0.4202555, 0.4502171, 2.627441, 0, 0.08235294, 1, 1,
0.4226679, 0.3980818, -0.08880065, 0, 0.07450981, 1, 1,
0.4245179, -1.030902, 1.167889, 0, 0.07058824, 1, 1,
0.4248737, 2.117626, -0.04737283, 0, 0.0627451, 1, 1,
0.4252146, 0.6038979, 1.879786, 0, 0.05882353, 1, 1,
0.4348535, -0.06517844, 0.8903996, 0, 0.05098039, 1, 1,
0.4381902, -0.6887828, 3.657984, 0, 0.04705882, 1, 1,
0.4434752, 1.050146, -0.09325133, 0, 0.03921569, 1, 1,
0.4487601, 1.713458, -0.3585297, 0, 0.03529412, 1, 1,
0.4494077, 0.4594384, 1.464143, 0, 0.02745098, 1, 1,
0.4532999, 0.5489627, 0.6293669, 0, 0.02352941, 1, 1,
0.453383, -0.5245405, 1.932177, 0, 0.01568628, 1, 1,
0.4540392, 1.106541, -2.764552, 0, 0.01176471, 1, 1,
0.4546269, -0.7805257, 2.911867, 0, 0.003921569, 1, 1,
0.4547561, 0.8136561, 2.180022, 0.003921569, 0, 1, 1,
0.455163, 1.498727, 1.604379, 0.007843138, 0, 1, 1,
0.4553066, -0.1269194, -0.1787815, 0.01568628, 0, 1, 1,
0.4562726, 0.2360955, 2.540305, 0.01960784, 0, 1, 1,
0.4575967, -0.5528957, 1.088002, 0.02745098, 0, 1, 1,
0.4582216, 0.236628, 0.3832145, 0.03137255, 0, 1, 1,
0.4603405, 0.84388, 0.7879237, 0.03921569, 0, 1, 1,
0.463875, 0.600058, 0.9570481, 0.04313726, 0, 1, 1,
0.468952, -0.2536802, 3.492615, 0.05098039, 0, 1, 1,
0.4707448, 0.546672, 1.418795, 0.05490196, 0, 1, 1,
0.4708589, -1.085557, 3.982057, 0.0627451, 0, 1, 1,
0.4728089, 0.7561173, 0.4870056, 0.06666667, 0, 1, 1,
0.4741477, -0.5364795, 1.326848, 0.07450981, 0, 1, 1,
0.477764, 0.6224909, 0.9434054, 0.07843138, 0, 1, 1,
0.4923807, 1.643508, 0.07855942, 0.08627451, 0, 1, 1,
0.5012023, 0.05598399, 1.590563, 0.09019608, 0, 1, 1,
0.5012727, 0.4905242, 0.1258044, 0.09803922, 0, 1, 1,
0.5042732, 0.8939665, -0.9209749, 0.1058824, 0, 1, 1,
0.5130239, 0.8151528, -0.6848007, 0.1098039, 0, 1, 1,
0.5176287, -2.6113, 3.85111, 0.1176471, 0, 1, 1,
0.5195878, 0.01909267, 0.8718457, 0.1215686, 0, 1, 1,
0.519594, -1.818061, 3.881187, 0.1294118, 0, 1, 1,
0.5240124, -1.919262, 3.834087, 0.1333333, 0, 1, 1,
0.5279921, -2.780941, 4.959294, 0.1411765, 0, 1, 1,
0.5287241, -0.3081931, 0.9017408, 0.145098, 0, 1, 1,
0.5294741, 0.447974, 0.7164756, 0.1529412, 0, 1, 1,
0.5303342, -0.2686873, 3.41627, 0.1568628, 0, 1, 1,
0.5307986, 0.4958339, 1.650229, 0.1647059, 0, 1, 1,
0.5379741, -1.239932, 2.175416, 0.1686275, 0, 1, 1,
0.5388393, 0.417468, 0.8122848, 0.1764706, 0, 1, 1,
0.5392513, 0.5533402, 2.282876, 0.1803922, 0, 1, 1,
0.541653, 0.8897927, 1.929441, 0.1882353, 0, 1, 1,
0.5419848, 1.476655, -0.168443, 0.1921569, 0, 1, 1,
0.5433871, -0.1620364, 0.8482559, 0.2, 0, 1, 1,
0.5437899, 0.6871637, -1.375222, 0.2078431, 0, 1, 1,
0.551425, 0.8062446, 1.292142, 0.2117647, 0, 1, 1,
0.5518237, -1.29058, 3.16821, 0.2196078, 0, 1, 1,
0.5627248, -0.9847745, 2.849509, 0.2235294, 0, 1, 1,
0.5701821, -0.4981755, 1.453152, 0.2313726, 0, 1, 1,
0.5710187, 0.4549075, 0.323358, 0.2352941, 0, 1, 1,
0.5725705, 1.180878, 0.7091628, 0.2431373, 0, 1, 1,
0.5728599, 0.4406171, 2.114907, 0.2470588, 0, 1, 1,
0.5747555, 0.0831774, 0.6797664, 0.254902, 0, 1, 1,
0.5782421, 0.905992, -0.5516298, 0.2588235, 0, 1, 1,
0.5832394, 0.2505053, 0.8219197, 0.2666667, 0, 1, 1,
0.5850801, 0.08480678, 1.94433, 0.2705882, 0, 1, 1,
0.5890699, -0.3556702, 3.521412, 0.2784314, 0, 1, 1,
0.5927984, -3.36585, 1.453678, 0.282353, 0, 1, 1,
0.5929014, -2.456481, 2.183891, 0.2901961, 0, 1, 1,
0.5945398, -0.9374264, 4.819371, 0.2941177, 0, 1, 1,
0.5989484, -0.459678, 2.918902, 0.3019608, 0, 1, 1,
0.6002448, 0.9732175, 0.448465, 0.3098039, 0, 1, 1,
0.6014625, 2.511996, -0.2177777, 0.3137255, 0, 1, 1,
0.6063488, 0.1936233, 2.236866, 0.3215686, 0, 1, 1,
0.610071, 0.633493, 1.032306, 0.3254902, 0, 1, 1,
0.6117054, -0.7800632, 1.991813, 0.3333333, 0, 1, 1,
0.6123109, 0.1840982, 0.3358808, 0.3372549, 0, 1, 1,
0.6135399, 0.700946, 2.368208, 0.345098, 0, 1, 1,
0.6197162, 0.7353398, -0.5337057, 0.3490196, 0, 1, 1,
0.6235788, 0.4503555, 2.795871, 0.3568628, 0, 1, 1,
0.6263145, 0.1774736, 1.713249, 0.3607843, 0, 1, 1,
0.6264426, 1.251931, 2.125883, 0.3686275, 0, 1, 1,
0.6273952, -0.6418696, 2.523946, 0.372549, 0, 1, 1,
0.6312719, -0.187693, 2.096226, 0.3803922, 0, 1, 1,
0.6320894, 1.127366, 1.143191, 0.3843137, 0, 1, 1,
0.6325855, -1.577728, 2.180146, 0.3921569, 0, 1, 1,
0.6405909, 0.5756058, 1.327742, 0.3960784, 0, 1, 1,
0.6428551, 0.220136, 0.6108961, 0.4039216, 0, 1, 1,
0.643055, -0.7078014, 2.372801, 0.4117647, 0, 1, 1,
0.6460845, 0.896901, 1.143046, 0.4156863, 0, 1, 1,
0.6494557, -0.3493838, 2.282034, 0.4235294, 0, 1, 1,
0.6503672, -0.8527036, 0.6771357, 0.427451, 0, 1, 1,
0.6563902, 1.379804, 0.7376204, 0.4352941, 0, 1, 1,
0.6609728, 1.351433, 1.197034, 0.4392157, 0, 1, 1,
0.6617063, 0.1705873, 1.700016, 0.4470588, 0, 1, 1,
0.6643867, 0.5907367, 0.1532271, 0.4509804, 0, 1, 1,
0.6657711, 0.8443357, -0.5440565, 0.4588235, 0, 1, 1,
0.6672077, 0.8163833, 1.422148, 0.4627451, 0, 1, 1,
0.6673203, 0.3681638, 0.9856477, 0.4705882, 0, 1, 1,
0.668157, -1.265872, 3.987901, 0.4745098, 0, 1, 1,
0.6685201, -1.962603, 3.109377, 0.4823529, 0, 1, 1,
0.6715043, 0.1198473, 2.315901, 0.4862745, 0, 1, 1,
0.6807815, 0.2684042, -0.6704776, 0.4941176, 0, 1, 1,
0.6930252, 0.1266231, 1.766122, 0.5019608, 0, 1, 1,
0.6947561, -1.256338, 3.40824, 0.5058824, 0, 1, 1,
0.6958753, -0.387664, 2.780572, 0.5137255, 0, 1, 1,
0.6967362, 0.350247, -0.4226424, 0.5176471, 0, 1, 1,
0.6990923, 0.3634225, 0.4290617, 0.5254902, 0, 1, 1,
0.6994403, 1.753165, 0.7566377, 0.5294118, 0, 1, 1,
0.7000474, -0.8337232, 2.474465, 0.5372549, 0, 1, 1,
0.7003489, -0.003068996, 0.4770727, 0.5411765, 0, 1, 1,
0.7063322, -0.4413801, 3.719522, 0.5490196, 0, 1, 1,
0.709817, 0.3442048, 1.283534, 0.5529412, 0, 1, 1,
0.7124883, 0.06352117, 1.432803, 0.5607843, 0, 1, 1,
0.7160075, -0.09576505, 3.454049, 0.5647059, 0, 1, 1,
0.7169976, -0.4676051, 2.659208, 0.572549, 0, 1, 1,
0.7176924, 1.752149, 0.7839822, 0.5764706, 0, 1, 1,
0.7178242, -0.9814105, 3.565438, 0.5843138, 0, 1, 1,
0.7192407, -0.65996, 2.434411, 0.5882353, 0, 1, 1,
0.7276815, 1.043919, 0.7733441, 0.5960785, 0, 1, 1,
0.7282777, 1.41733, 1.232985, 0.6039216, 0, 1, 1,
0.7295341, -0.7198551, 2.038403, 0.6078432, 0, 1, 1,
0.7301721, 1.226526, 0.5271083, 0.6156863, 0, 1, 1,
0.7318401, -1.346897, 3.120903, 0.6196079, 0, 1, 1,
0.7325425, -1.413929, 3.85051, 0.627451, 0, 1, 1,
0.7358465, 0.3015548, 0.2532547, 0.6313726, 0, 1, 1,
0.7376162, 0.147661, 1.861794, 0.6392157, 0, 1, 1,
0.739362, -0.7728588, 3.323765, 0.6431373, 0, 1, 1,
0.7421433, -0.5752882, 1.518423, 0.6509804, 0, 1, 1,
0.7426321, -0.7058403, 2.828507, 0.654902, 0, 1, 1,
0.7443678, -0.04427146, 3.074435, 0.6627451, 0, 1, 1,
0.7469896, 0.9520495, 0.4468951, 0.6666667, 0, 1, 1,
0.7512367, 0.5639271, 1.621879, 0.6745098, 0, 1, 1,
0.7561455, 0.1276675, 1.529981, 0.6784314, 0, 1, 1,
0.7569699, 0.9718946, -0.5284743, 0.6862745, 0, 1, 1,
0.7574021, -0.3249986, 2.915684, 0.6901961, 0, 1, 1,
0.7627779, 0.28716, 1.837949, 0.6980392, 0, 1, 1,
0.7631482, 0.6035893, 1.131815, 0.7058824, 0, 1, 1,
0.7676066, 2.240915, -1.269724, 0.7098039, 0, 1, 1,
0.7678978, -0.8097824, 3.00724, 0.7176471, 0, 1, 1,
0.7702071, 0.06894553, 0.9866958, 0.7215686, 0, 1, 1,
0.7749014, 2.185227, 2.266859, 0.7294118, 0, 1, 1,
0.7767751, -1.313284, 2.858463, 0.7333333, 0, 1, 1,
0.7798594, 0.2693876, 0.583917, 0.7411765, 0, 1, 1,
0.7805205, 1.798578, -1.125166, 0.7450981, 0, 1, 1,
0.7855849, -2.621726, 1.16879, 0.7529412, 0, 1, 1,
0.7871004, -0.9878944, 2.32974, 0.7568628, 0, 1, 1,
0.7874156, -1.681166, 1.89607, 0.7647059, 0, 1, 1,
0.8117589, -0.07804044, 0.7791154, 0.7686275, 0, 1, 1,
0.8177217, 0.2855393, 1.737617, 0.7764706, 0, 1, 1,
0.8178958, -0.614867, 1.154408, 0.7803922, 0, 1, 1,
0.8221851, -2.327843, 3.875633, 0.7882353, 0, 1, 1,
0.8250514, 0.4597096, 1.189103, 0.7921569, 0, 1, 1,
0.8268206, 0.4135203, 1.025528, 0.8, 0, 1, 1,
0.8335587, 1.051575, -0.03203362, 0.8078431, 0, 1, 1,
0.8339196, 0.1841998, 1.7711, 0.8117647, 0, 1, 1,
0.8385463, 1.586855, 0.4748327, 0.8196079, 0, 1, 1,
0.8444306, -0.2481856, 2.824707, 0.8235294, 0, 1, 1,
0.8462831, 0.4297315, -0.3647483, 0.8313726, 0, 1, 1,
0.8473735, 0.4512116, 1.634469, 0.8352941, 0, 1, 1,
0.8542794, 0.5170661, 1.097803, 0.8431373, 0, 1, 1,
0.8623865, -1.179196, 1.84568, 0.8470588, 0, 1, 1,
0.8703982, -1.014509, 0.9526975, 0.854902, 0, 1, 1,
0.8769352, 0.7897471, 1.30985, 0.8588235, 0, 1, 1,
0.8790745, 0.8266361, 0.1108616, 0.8666667, 0, 1, 1,
0.8793257, 0.7248697, 0.243188, 0.8705882, 0, 1, 1,
0.8806769, -1.011145, 2.415946, 0.8784314, 0, 1, 1,
0.8829632, -0.8902269, 0.918211, 0.8823529, 0, 1, 1,
0.8838291, -1.333763, 2.159618, 0.8901961, 0, 1, 1,
0.8842906, -1.599053, 3.502973, 0.8941177, 0, 1, 1,
0.8884993, 0.003126829, -0.01010939, 0.9019608, 0, 1, 1,
0.8916853, 0.4049498, 0.9465297, 0.9098039, 0, 1, 1,
0.893446, -0.178013, 1.095392, 0.9137255, 0, 1, 1,
0.9036677, 0.7165444, 0.4628324, 0.9215686, 0, 1, 1,
0.9054986, 0.8391672, 1.540261, 0.9254902, 0, 1, 1,
0.9093454, -1.959912, 3.723833, 0.9333333, 0, 1, 1,
0.9170824, 0.0477756, 0.8382663, 0.9372549, 0, 1, 1,
0.920246, -1.645136, 2.671712, 0.945098, 0, 1, 1,
0.935095, -0.8930374, 1.599177, 0.9490196, 0, 1, 1,
0.9375969, 0.5148314, 1.94264, 0.9568627, 0, 1, 1,
0.938208, 0.1986062, 1.892282, 0.9607843, 0, 1, 1,
0.9503811, -0.01689029, 3.414995, 0.9686275, 0, 1, 1,
0.9507701, -1.592709, 2.335837, 0.972549, 0, 1, 1,
0.9560577, 0.648383, 1.66167, 0.9803922, 0, 1, 1,
0.9567074, 0.1582098, 1.947884, 0.9843137, 0, 1, 1,
0.9599107, -0.5445858, 4.836259, 0.9921569, 0, 1, 1,
0.9694728, -0.751709, 4.112269, 0.9960784, 0, 1, 1,
0.9732997, 1.527501, 0.9293275, 1, 0, 0.9960784, 1,
0.9769759, 0.04611461, 1.519027, 1, 0, 0.9882353, 1,
0.9775717, -0.07556704, 2.916235, 1, 0, 0.9843137, 1,
0.9779004, -0.3088397, 1.137991, 1, 0, 0.9764706, 1,
0.9820218, 0.9157738, 0.5116488, 1, 0, 0.972549, 1,
0.9834058, -1.184272, 2.324221, 1, 0, 0.9647059, 1,
0.9861032, -1.53931, 3.313797, 1, 0, 0.9607843, 1,
1.006723, -1.280261, 2.94275, 1, 0, 0.9529412, 1,
1.007517, -2.501044, 2.312531, 1, 0, 0.9490196, 1,
1.013772, -0.06184273, 2.086717, 1, 0, 0.9411765, 1,
1.017628, 1.788609, -0.2794808, 1, 0, 0.9372549, 1,
1.02539, 0.485955, -0.4651459, 1, 0, 0.9294118, 1,
1.033991, 0.4039823, 1.549896, 1, 0, 0.9254902, 1,
1.041024, -0.4064395, 3.027566, 1, 0, 0.9176471, 1,
1.044632, 0.5439875, -0.4636787, 1, 0, 0.9137255, 1,
1.047061, 0.9843204, 1.665861, 1, 0, 0.9058824, 1,
1.051963, -0.714922, 2.844849, 1, 0, 0.9019608, 1,
1.052151, 0.1307783, 2.612129, 1, 0, 0.8941177, 1,
1.057492, -0.09024864, 0.2437491, 1, 0, 0.8862745, 1,
1.058866, -0.2566569, 1.468752, 1, 0, 0.8823529, 1,
1.059226, 1.698136, 1.340133, 1, 0, 0.8745098, 1,
1.062516, -0.1764027, 1.742432, 1, 0, 0.8705882, 1,
1.070565, 1.593318, 0.3856452, 1, 0, 0.8627451, 1,
1.082547, 1.593779, 0.8627332, 1, 0, 0.8588235, 1,
1.083172, 1.38039, 1.52685, 1, 0, 0.8509804, 1,
1.083834, -0.4226789, 2.117876, 1, 0, 0.8470588, 1,
1.087153, 0.4905678, 0.6758259, 1, 0, 0.8392157, 1,
1.088578, -0.3913689, 1.248261, 1, 0, 0.8352941, 1,
1.089337, -0.7820981, -0.7374758, 1, 0, 0.827451, 1,
1.090614, -0.4893648, 1.635132, 1, 0, 0.8235294, 1,
1.091283, -2.001644, 2.660802, 1, 0, 0.8156863, 1,
1.091711, -0.1810133, 3.388783, 1, 0, 0.8117647, 1,
1.093043, 0.09463432, 2.979901, 1, 0, 0.8039216, 1,
1.093184, 0.4541371, -0.4182251, 1, 0, 0.7960784, 1,
1.114761, -0.113661, 0.836969, 1, 0, 0.7921569, 1,
1.125131, 1.110004, -0.3290905, 1, 0, 0.7843137, 1,
1.135538, -0.7736864, 1.643716, 1, 0, 0.7803922, 1,
1.143857, 0.7746114, 0.7634363, 1, 0, 0.772549, 1,
1.144954, -0.02855965, 1.029592, 1, 0, 0.7686275, 1,
1.149589, 1.002453, 2.661315, 1, 0, 0.7607843, 1,
1.152, -0.854263, 0.9937522, 1, 0, 0.7568628, 1,
1.162018, 0.8113862, 0.04448023, 1, 0, 0.7490196, 1,
1.162976, -0.8552281, 3.33916, 1, 0, 0.7450981, 1,
1.16355, -1.848813, 4.067474, 1, 0, 0.7372549, 1,
1.170169, 0.3696625, 2.741208, 1, 0, 0.7333333, 1,
1.178319, 1.641943, -0.1115449, 1, 0, 0.7254902, 1,
1.186275, -1.232669, 2.365072, 1, 0, 0.7215686, 1,
1.215611, -1.074831, 0.6470201, 1, 0, 0.7137255, 1,
1.217474, 0.9784356, 0.5968282, 1, 0, 0.7098039, 1,
1.222537, -0.59418, 2.874378, 1, 0, 0.7019608, 1,
1.229957, -0.7844001, 0.5386948, 1, 0, 0.6941177, 1,
1.230498, 0.04677451, 1.883914, 1, 0, 0.6901961, 1,
1.234791, 0.2938592, 1.178778, 1, 0, 0.682353, 1,
1.236296, -0.8582965, 1.476105, 1, 0, 0.6784314, 1,
1.237617, 0.2633584, 0.379907, 1, 0, 0.6705883, 1,
1.238216, 0.2817162, 3.384708, 1, 0, 0.6666667, 1,
1.252446, -0.5622871, 1.58045, 1, 0, 0.6588235, 1,
1.267709, 0.7712635, 2.280202, 1, 0, 0.654902, 1,
1.269824, 1.130768, 2.545753, 1, 0, 0.6470588, 1,
1.273193, -1.525307, 0.6519279, 1, 0, 0.6431373, 1,
1.282562, 0.1812666, 1.518597, 1, 0, 0.6352941, 1,
1.286753, -0.5345597, 2.44463, 1, 0, 0.6313726, 1,
1.289045, -0.2871576, 3.538152, 1, 0, 0.6235294, 1,
1.290299, -0.2649259, 2.178293, 1, 0, 0.6196079, 1,
1.293387, 0.1822552, 2.970173, 1, 0, 0.6117647, 1,
1.294769, 1.578719, -0.1009385, 1, 0, 0.6078432, 1,
1.296153, 1.041258, -0.7577716, 1, 0, 0.6, 1,
1.298372, 1.013317, 1.017113, 1, 0, 0.5921569, 1,
1.301945, -0.605094, 0.8912511, 1, 0, 0.5882353, 1,
1.303697, -0.8028941, 1.692328, 1, 0, 0.5803922, 1,
1.305335, 0.2352097, 0.172545, 1, 0, 0.5764706, 1,
1.305758, -0.8141574, 0.3665109, 1, 0, 0.5686275, 1,
1.314759, 0.4835549, 2.094698, 1, 0, 0.5647059, 1,
1.316698, -0.7729361, 3.383561, 1, 0, 0.5568628, 1,
1.32047, 0.9854107, -0.1904508, 1, 0, 0.5529412, 1,
1.330807, 0.1060114, -0.0006524979, 1, 0, 0.5450981, 1,
1.331068, -1.00507, 1.926252, 1, 0, 0.5411765, 1,
1.33784, -0.687677, 0.8257313, 1, 0, 0.5333334, 1,
1.348451, 0.2850934, 1.14317, 1, 0, 0.5294118, 1,
1.367342, 1.253902, -0.4269138, 1, 0, 0.5215687, 1,
1.367881, 0.8622835, 3.195867, 1, 0, 0.5176471, 1,
1.375506, -0.3173153, 0.5165651, 1, 0, 0.509804, 1,
1.378026, -0.08220431, -0.03315613, 1, 0, 0.5058824, 1,
1.389443, -1.950506, 2.504021, 1, 0, 0.4980392, 1,
1.39157, 1.593883, 2.235162, 1, 0, 0.4901961, 1,
1.398961, 1.50302, 1.307247, 1, 0, 0.4862745, 1,
1.402839, 0.09080903, 2.778161, 1, 0, 0.4784314, 1,
1.405784, 0.1437911, -0.2182677, 1, 0, 0.4745098, 1,
1.415567, 0.4507822, 2.376257, 1, 0, 0.4666667, 1,
1.420863, 1.208988, 0.1822842, 1, 0, 0.4627451, 1,
1.433763, 0.7039209, 0.6772681, 1, 0, 0.454902, 1,
1.441156, 1.444945, 0.02026321, 1, 0, 0.4509804, 1,
1.451321, -0.09410778, 2.333182, 1, 0, 0.4431373, 1,
1.46051, 1.161324, 0.5412649, 1, 0, 0.4392157, 1,
1.472199, -0.6595135, 2.841966, 1, 0, 0.4313726, 1,
1.475308, 0.8844355, 0.5298548, 1, 0, 0.427451, 1,
1.492192, -1.697403, 3.045385, 1, 0, 0.4196078, 1,
1.500391, 0.6795266, 1.428698, 1, 0, 0.4156863, 1,
1.513398, -0.6722068, 1.118459, 1, 0, 0.4078431, 1,
1.524448, -1.514767, 2.847225, 1, 0, 0.4039216, 1,
1.526652, -0.7201156, 2.354317, 1, 0, 0.3960784, 1,
1.531121, -0.3556576, 2.780224, 1, 0, 0.3882353, 1,
1.532509, -0.4007899, 3.508837, 1, 0, 0.3843137, 1,
1.538486, -0.2543273, 1.926338, 1, 0, 0.3764706, 1,
1.551028, -0.4826106, 1.49704, 1, 0, 0.372549, 1,
1.564585, 0.89433, 0.4487368, 1, 0, 0.3647059, 1,
1.564892, -0.274012, 2.199571, 1, 0, 0.3607843, 1,
1.565471, -0.3066029, 1.828298, 1, 0, 0.3529412, 1,
1.565823, 1.019525, 2.395945, 1, 0, 0.3490196, 1,
1.568212, 0.5848389, 1.606409, 1, 0, 0.3411765, 1,
1.573616, -0.1968106, 1.921548, 1, 0, 0.3372549, 1,
1.58093, -1.410022, 1.566919, 1, 0, 0.3294118, 1,
1.582026, 0.3067572, 0.2241296, 1, 0, 0.3254902, 1,
1.584949, 0.6372797, 0.2903096, 1, 0, 0.3176471, 1,
1.590396, -1.056853, 1.501622, 1, 0, 0.3137255, 1,
1.627333, -0.5381119, 1.532238, 1, 0, 0.3058824, 1,
1.635072, -2.299045, 4.362672, 1, 0, 0.2980392, 1,
1.660159, -0.7030897, 3.110865, 1, 0, 0.2941177, 1,
1.66716, 0.749984, 2.089635, 1, 0, 0.2862745, 1,
1.670959, 0.01142674, 0.5004949, 1, 0, 0.282353, 1,
1.677381, -1.271397, 2.049606, 1, 0, 0.2745098, 1,
1.682964, -0.9569428, 2.921582, 1, 0, 0.2705882, 1,
1.692755, 0.2202007, 2.779118, 1, 0, 0.2627451, 1,
1.700715, 0.04574528, 0.6032417, 1, 0, 0.2588235, 1,
1.702752, -0.4589228, 1.301287, 1, 0, 0.2509804, 1,
1.702954, -0.5738119, 1.491644, 1, 0, 0.2470588, 1,
1.738161, 0.6850642, 2.109911, 1, 0, 0.2392157, 1,
1.758443, 0.9604391, 1.568416, 1, 0, 0.2352941, 1,
1.771473, 2.17839, 2.773125, 1, 0, 0.227451, 1,
1.799341, -0.7896096, 0.4560456, 1, 0, 0.2235294, 1,
1.813889, -1.89358, 2.701272, 1, 0, 0.2156863, 1,
1.861795, -0.2148737, 3.496435, 1, 0, 0.2117647, 1,
1.864668, 0.0004999289, 5.187117, 1, 0, 0.2039216, 1,
1.87398, -1.254583, 2.733173, 1, 0, 0.1960784, 1,
1.893643, -0.2508818, 2.342872, 1, 0, 0.1921569, 1,
1.898769, -1.317363, 2.960006, 1, 0, 0.1843137, 1,
1.899652, 0.241473, 2.662768, 1, 0, 0.1803922, 1,
1.912813, 1.358365, 0.8214111, 1, 0, 0.172549, 1,
1.915053, 0.4423575, 1.908352, 1, 0, 0.1686275, 1,
1.922445, 0.578226, 3.234621, 1, 0, 0.1607843, 1,
1.938239, -0.5761838, 1.193715, 1, 0, 0.1568628, 1,
1.990074, 2.085746, 0.5877585, 1, 0, 0.1490196, 1,
1.990117, 2.861881, -0.4811821, 1, 0, 0.145098, 1,
1.991284, -0.5934986, 1.963791, 1, 0, 0.1372549, 1,
2.00323, 0.7489002, 0.7349026, 1, 0, 0.1333333, 1,
2.008949, 1.247512, 0.6634172, 1, 0, 0.1254902, 1,
2.038279, 0.5080877, 2.420753, 1, 0, 0.1215686, 1,
2.048479, 1.400758, 2.344406, 1, 0, 0.1137255, 1,
2.108254, -0.8192583, 1.622186, 1, 0, 0.1098039, 1,
2.114157, 0.5680485, 0.2712197, 1, 0, 0.1019608, 1,
2.135359, -0.2619378, 0.9531116, 1, 0, 0.09411765, 1,
2.162122, 1.818208, 0.2520106, 1, 0, 0.09019608, 1,
2.240883, -2.909572, 0.3407161, 1, 0, 0.08235294, 1,
2.375041, 2.027976, -0.3747892, 1, 0, 0.07843138, 1,
2.458136, 1.636817, -0.4140486, 1, 0, 0.07058824, 1,
2.464781, -0.1597784, 1.791947, 1, 0, 0.06666667, 1,
2.561881, 0.03532632, 2.285607, 1, 0, 0.05882353, 1,
2.624517, 0.9921255, 1.320063, 1, 0, 0.05490196, 1,
2.68923, -1.066965, 3.229063, 1, 0, 0.04705882, 1,
2.724951, -0.05664345, 2.606567, 1, 0, 0.04313726, 1,
2.769605, 1.325952, -0.3767265, 1, 0, 0.03529412, 1,
2.789956, -2.074642, 1.492648, 1, 0, 0.03137255, 1,
2.938025, 0.06183416, 1.422319, 1, 0, 0.02352941, 1,
3.048229, -0.09985836, 1.56906, 1, 0, 0.01960784, 1,
3.640437, 0.7574341, 2.949863, 1, 0, 0.01176471, 1,
3.669925, -0.002857913, 0.3748579, 1, 0, 0.007843138, 1
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
0.2652189, -4.466656, -8.429625, 0, -0.5, 0.5, 0.5,
0.2652189, -4.466656, -8.429625, 1, -0.5, 0.5, 0.5,
0.2652189, -4.466656, -8.429625, 1, 1.5, 0.5, 0.5,
0.2652189, -4.466656, -8.429625, 0, 1.5, 0.5, 0.5
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
-4.293683, -0.2713109, -8.429625, 0, -0.5, 0.5, 0.5,
-4.293683, -0.2713109, -8.429625, 1, -0.5, 0.5, 0.5,
-4.293683, -0.2713109, -8.429625, 1, 1.5, 0.5, 0.5,
-4.293683, -0.2713109, -8.429625, 0, 1.5, 0.5, 0.5
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
-4.293683, -4.466656, -0.5644269, 0, -0.5, 0.5, 0.5,
-4.293683, -4.466656, -0.5644269, 1, -0.5, 0.5, 0.5,
-4.293683, -4.466656, -0.5644269, 1, 1.5, 0.5, 0.5,
-4.293683, -4.466656, -0.5644269, 0, 1.5, 0.5, 0.5
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
-3, -3.498499, -6.614579,
3, -3.498499, -6.614579,
-3, -3.498499, -6.614579,
-3, -3.659858, -6.917086,
-2, -3.498499, -6.614579,
-2, -3.659858, -6.917086,
-1, -3.498499, -6.614579,
-1, -3.659858, -6.917086,
0, -3.498499, -6.614579,
0, -3.659858, -6.917086,
1, -3.498499, -6.614579,
1, -3.659858, -6.917086,
2, -3.498499, -6.614579,
2, -3.659858, -6.917086,
3, -3.498499, -6.614579,
3, -3.659858, -6.917086
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
-3, -3.982577, -7.522101, 0, -0.5, 0.5, 0.5,
-3, -3.982577, -7.522101, 1, -0.5, 0.5, 0.5,
-3, -3.982577, -7.522101, 1, 1.5, 0.5, 0.5,
-3, -3.982577, -7.522101, 0, 1.5, 0.5, 0.5,
-2, -3.982577, -7.522101, 0, -0.5, 0.5, 0.5,
-2, -3.982577, -7.522101, 1, -0.5, 0.5, 0.5,
-2, -3.982577, -7.522101, 1, 1.5, 0.5, 0.5,
-2, -3.982577, -7.522101, 0, 1.5, 0.5, 0.5,
-1, -3.982577, -7.522101, 0, -0.5, 0.5, 0.5,
-1, -3.982577, -7.522101, 1, -0.5, 0.5, 0.5,
-1, -3.982577, -7.522101, 1, 1.5, 0.5, 0.5,
-1, -3.982577, -7.522101, 0, 1.5, 0.5, 0.5,
0, -3.982577, -7.522101, 0, -0.5, 0.5, 0.5,
0, -3.982577, -7.522101, 1, -0.5, 0.5, 0.5,
0, -3.982577, -7.522101, 1, 1.5, 0.5, 0.5,
0, -3.982577, -7.522101, 0, 1.5, 0.5, 0.5,
1, -3.982577, -7.522101, 0, -0.5, 0.5, 0.5,
1, -3.982577, -7.522101, 1, -0.5, 0.5, 0.5,
1, -3.982577, -7.522101, 1, 1.5, 0.5, 0.5,
1, -3.982577, -7.522101, 0, 1.5, 0.5, 0.5,
2, -3.982577, -7.522101, 0, -0.5, 0.5, 0.5,
2, -3.982577, -7.522101, 1, -0.5, 0.5, 0.5,
2, -3.982577, -7.522101, 1, 1.5, 0.5, 0.5,
2, -3.982577, -7.522101, 0, 1.5, 0.5, 0.5,
3, -3.982577, -7.522101, 0, -0.5, 0.5, 0.5,
3, -3.982577, -7.522101, 1, -0.5, 0.5, 0.5,
3, -3.982577, -7.522101, 1, 1.5, 0.5, 0.5,
3, -3.982577, -7.522101, 0, 1.5, 0.5, 0.5
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
-3.241629, -3, -6.614579,
-3.241629, 2, -6.614579,
-3.241629, -3, -6.614579,
-3.416971, -3, -6.917086,
-3.241629, -2, -6.614579,
-3.416971, -2, -6.917086,
-3.241629, -1, -6.614579,
-3.416971, -1, -6.917086,
-3.241629, 0, -6.614579,
-3.416971, 0, -6.917086,
-3.241629, 1, -6.614579,
-3.416971, 1, -6.917086,
-3.241629, 2, -6.614579,
-3.416971, 2, -6.917086
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
-3.767656, -3, -7.522101, 0, -0.5, 0.5, 0.5,
-3.767656, -3, -7.522101, 1, -0.5, 0.5, 0.5,
-3.767656, -3, -7.522101, 1, 1.5, 0.5, 0.5,
-3.767656, -3, -7.522101, 0, 1.5, 0.5, 0.5,
-3.767656, -2, -7.522101, 0, -0.5, 0.5, 0.5,
-3.767656, -2, -7.522101, 1, -0.5, 0.5, 0.5,
-3.767656, -2, -7.522101, 1, 1.5, 0.5, 0.5,
-3.767656, -2, -7.522101, 0, 1.5, 0.5, 0.5,
-3.767656, -1, -7.522101, 0, -0.5, 0.5, 0.5,
-3.767656, -1, -7.522101, 1, -0.5, 0.5, 0.5,
-3.767656, -1, -7.522101, 1, 1.5, 0.5, 0.5,
-3.767656, -1, -7.522101, 0, 1.5, 0.5, 0.5,
-3.767656, 0, -7.522101, 0, -0.5, 0.5, 0.5,
-3.767656, 0, -7.522101, 1, -0.5, 0.5, 0.5,
-3.767656, 0, -7.522101, 1, 1.5, 0.5, 0.5,
-3.767656, 0, -7.522101, 0, 1.5, 0.5, 0.5,
-3.767656, 1, -7.522101, 0, -0.5, 0.5, 0.5,
-3.767656, 1, -7.522101, 1, -0.5, 0.5, 0.5,
-3.767656, 1, -7.522101, 1, 1.5, 0.5, 0.5,
-3.767656, 1, -7.522101, 0, 1.5, 0.5, 0.5,
-3.767656, 2, -7.522101, 0, -0.5, 0.5, 0.5,
-3.767656, 2, -7.522101, 1, -0.5, 0.5, 0.5,
-3.767656, 2, -7.522101, 1, 1.5, 0.5, 0.5,
-3.767656, 2, -7.522101, 0, 1.5, 0.5, 0.5
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
-3.241629, -3.498499, -6,
-3.241629, -3.498499, 4,
-3.241629, -3.498499, -6,
-3.416971, -3.659858, -6,
-3.241629, -3.498499, -4,
-3.416971, -3.659858, -4,
-3.241629, -3.498499, -2,
-3.416971, -3.659858, -2,
-3.241629, -3.498499, 0,
-3.416971, -3.659858, 0,
-3.241629, -3.498499, 2,
-3.416971, -3.659858, 2,
-3.241629, -3.498499, 4,
-3.416971, -3.659858, 4
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
-3.767656, -3.982577, -6, 0, -0.5, 0.5, 0.5,
-3.767656, -3.982577, -6, 1, -0.5, 0.5, 0.5,
-3.767656, -3.982577, -6, 1, 1.5, 0.5, 0.5,
-3.767656, -3.982577, -6, 0, 1.5, 0.5, 0.5,
-3.767656, -3.982577, -4, 0, -0.5, 0.5, 0.5,
-3.767656, -3.982577, -4, 1, -0.5, 0.5, 0.5,
-3.767656, -3.982577, -4, 1, 1.5, 0.5, 0.5,
-3.767656, -3.982577, -4, 0, 1.5, 0.5, 0.5,
-3.767656, -3.982577, -2, 0, -0.5, 0.5, 0.5,
-3.767656, -3.982577, -2, 1, -0.5, 0.5, 0.5,
-3.767656, -3.982577, -2, 1, 1.5, 0.5, 0.5,
-3.767656, -3.982577, -2, 0, 1.5, 0.5, 0.5,
-3.767656, -3.982577, 0, 0, -0.5, 0.5, 0.5,
-3.767656, -3.982577, 0, 1, -0.5, 0.5, 0.5,
-3.767656, -3.982577, 0, 1, 1.5, 0.5, 0.5,
-3.767656, -3.982577, 0, 0, 1.5, 0.5, 0.5,
-3.767656, -3.982577, 2, 0, -0.5, 0.5, 0.5,
-3.767656, -3.982577, 2, 1, -0.5, 0.5, 0.5,
-3.767656, -3.982577, 2, 1, 1.5, 0.5, 0.5,
-3.767656, -3.982577, 2, 0, 1.5, 0.5, 0.5,
-3.767656, -3.982577, 4, 0, -0.5, 0.5, 0.5,
-3.767656, -3.982577, 4, 1, -0.5, 0.5, 0.5,
-3.767656, -3.982577, 4, 1, 1.5, 0.5, 0.5,
-3.767656, -3.982577, 4, 0, 1.5, 0.5, 0.5
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
-3.241629, -3.498499, -6.614579,
-3.241629, 2.955877, -6.614579,
-3.241629, -3.498499, 5.485725,
-3.241629, 2.955877, 5.485725,
-3.241629, -3.498499, -6.614579,
-3.241629, -3.498499, 5.485725,
-3.241629, 2.955877, -6.614579,
-3.241629, 2.955877, 5.485725,
-3.241629, -3.498499, -6.614579,
3.772066, -3.498499, -6.614579,
-3.241629, -3.498499, 5.485725,
3.772066, -3.498499, 5.485725,
-3.241629, 2.955877, -6.614579,
3.772066, 2.955877, -6.614579,
-3.241629, 2.955877, 5.485725,
3.772066, 2.955877, 5.485725,
3.772066, -3.498499, -6.614579,
3.772066, 2.955877, -6.614579,
3.772066, -3.498499, 5.485725,
3.772066, 2.955877, 5.485725,
3.772066, -3.498499, -6.614579,
3.772066, -3.498499, 5.485725,
3.772066, 2.955877, -6.614579,
3.772066, 2.955877, 5.485725
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
var radius = 8.225177;
var distance = 36.59474;
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
mvMatrix.translate( -0.2652189, 0.2713109, 0.5644269 );
mvMatrix.scale( 1.26798, 1.377859, 0.7349586 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.59474);
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
ethyl_formate<-read.table("ethyl_formate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethyl_formate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_formate' not found
```

```r
y<-ethyl_formate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_formate' not found
```

```r
z<-ethyl_formate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethyl_formate' not found
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
-3.139488, -0.1123096, -3.382732, 0, 0, 1, 1, 1,
-3.125143, 1.358993, -1.709733, 1, 0, 0, 1, 1,
-2.726725, 1.262216, -1.324881, 1, 0, 0, 1, 1,
-2.685755, -2.568894, -3.438108, 1, 0, 0, 1, 1,
-2.642226, -0.7460819, -0.1580073, 1, 0, 0, 1, 1,
-2.630514, 0.9866405, -1.105099, 1, 0, 0, 1, 1,
-2.623684, 1.37423, -2.094841, 0, 0, 0, 1, 1,
-2.566368, 2.206432, -1.379227, 0, 0, 0, 1, 1,
-2.47392, 0.3154129, -3.046196, 0, 0, 0, 1, 1,
-2.369697, -1.07396, -4.072318, 0, 0, 0, 1, 1,
-2.352199, 0.6981497, -2.581873, 0, 0, 0, 1, 1,
-2.34236, -0.9998138, -0.2730707, 0, 0, 0, 1, 1,
-2.279463, 0.1747522, -1.307545, 0, 0, 0, 1, 1,
-2.276664, 1.029155, -1.05057, 1, 1, 1, 1, 1,
-2.274425, 0.6968454, -2.514518, 1, 1, 1, 1, 1,
-2.270696, 2.758211, 0.8012581, 1, 1, 1, 1, 1,
-2.266435, -0.560565, -0.7074679, 1, 1, 1, 1, 1,
-2.159717, -1.679765, -2.666263, 1, 1, 1, 1, 1,
-2.137799, 0.06848857, -1.878033, 1, 1, 1, 1, 1,
-2.097328, -0.05510629, -0.9270946, 1, 1, 1, 1, 1,
-2.063876, -1.608374, -3.003479, 1, 1, 1, 1, 1,
-2.060635, 1.345195, -0.8302325, 1, 1, 1, 1, 1,
-2.037354, -0.09924337, -1.142552, 1, 1, 1, 1, 1,
-1.997669, 0.4014692, -1.391022, 1, 1, 1, 1, 1,
-1.993104, 0.9145377, 0.5312669, 1, 1, 1, 1, 1,
-1.986435, 0.1056264, -0.8967115, 1, 1, 1, 1, 1,
-1.982822, -1.991232, -1.678156, 1, 1, 1, 1, 1,
-1.965689, 0.6404462, -2.162079, 1, 1, 1, 1, 1,
-1.953261, -1.749771, -1.876669, 0, 0, 1, 1, 1,
-1.909346, -0.01852771, -3.817011, 1, 0, 0, 1, 1,
-1.905301, 1.320068, -0.05339966, 1, 0, 0, 1, 1,
-1.90047, 0.5060486, -0.4161433, 1, 0, 0, 1, 1,
-1.853068, -0.3242036, -2.812711, 1, 0, 0, 1, 1,
-1.846746, -1.17442, -2.432899, 1, 0, 0, 1, 1,
-1.82843, 0.3930256, -1.006232, 0, 0, 0, 1, 1,
-1.824577, 1.231364, 0.2548976, 0, 0, 0, 1, 1,
-1.821957, -0.3800354, 0.0002303538, 0, 0, 0, 1, 1,
-1.806307, -0.9583509, -1.506168, 0, 0, 0, 1, 1,
-1.798921, 0.4210884, -0.9798352, 0, 0, 0, 1, 1,
-1.788277, 0.5031765, -2.067181, 0, 0, 0, 1, 1,
-1.773124, -0.1002235, 0.04337316, 0, 0, 0, 1, 1,
-1.768262, 0.9421377, -2.608845, 1, 1, 1, 1, 1,
-1.743252, 0.008375908, -1.349243, 1, 1, 1, 1, 1,
-1.722165, -1.37639, -2.959763, 1, 1, 1, 1, 1,
-1.708456, -0.6991938, -2.267053, 1, 1, 1, 1, 1,
-1.704358, 0.1553051, -2.054954, 1, 1, 1, 1, 1,
-1.693568, 1.028215, -1.190612, 1, 1, 1, 1, 1,
-1.688558, -0.470671, -1.162334, 1, 1, 1, 1, 1,
-1.669085, -0.5166313, -1.587679, 1, 1, 1, 1, 1,
-1.629014, -0.7042465, -2.197515, 1, 1, 1, 1, 1,
-1.626187, 1.33257, 0.3063207, 1, 1, 1, 1, 1,
-1.625387, -0.8359118, -3.777504, 1, 1, 1, 1, 1,
-1.607216, 1.698369, -0.5567914, 1, 1, 1, 1, 1,
-1.603359, 0.2203368, -1.696952, 1, 1, 1, 1, 1,
-1.591621, -0.5766332, -2.307894, 1, 1, 1, 1, 1,
-1.580016, 1.827555, -0.7494466, 1, 1, 1, 1, 1,
-1.575693, 0.4678028, -1.520806, 0, 0, 1, 1, 1,
-1.570137, -0.9794102, -1.196097, 1, 0, 0, 1, 1,
-1.569946, 1.078619, -1.366294, 1, 0, 0, 1, 1,
-1.56881, -0.2342366, -0.9645028, 1, 0, 0, 1, 1,
-1.558963, 0.3432245, -2.440466, 1, 0, 0, 1, 1,
-1.542067, 0.6878323, -0.1101367, 1, 0, 0, 1, 1,
-1.535829, 0.8807134, -1.907625, 0, 0, 0, 1, 1,
-1.533362, 0.0005219141, 0.02127786, 0, 0, 0, 1, 1,
-1.532693, -1.471294, -4.382038, 0, 0, 0, 1, 1,
-1.531894, -0.4650207, -1.860501, 0, 0, 0, 1, 1,
-1.523522, 1.205843, -0.4737344, 0, 0, 0, 1, 1,
-1.522585, 0.8511631, -2.152223, 0, 0, 0, 1, 1,
-1.521579, 0.5848962, 0.09610682, 0, 0, 0, 1, 1,
-1.498994, -0.2773167, -1.974165, 1, 1, 1, 1, 1,
-1.493552, 1.058156, -3.881657, 1, 1, 1, 1, 1,
-1.491392, 1.197611, 0.1874661, 1, 1, 1, 1, 1,
-1.487761, -0.2934079, -2.69629, 1, 1, 1, 1, 1,
-1.478164, 0.3440608, -2.60449, 1, 1, 1, 1, 1,
-1.477523, -1.538375, -3.017141, 1, 1, 1, 1, 1,
-1.474209, -0.8305929, -3.536243, 1, 1, 1, 1, 1,
-1.457572, -0.8444729, -0.4136164, 1, 1, 1, 1, 1,
-1.449778, -1.90732, -1.784872, 1, 1, 1, 1, 1,
-1.448282, -2.454359, -1.941271, 1, 1, 1, 1, 1,
-1.438543, 0.2916939, -2.579361, 1, 1, 1, 1, 1,
-1.436757, 1.994521, -0.1870129, 1, 1, 1, 1, 1,
-1.436561, 0.6149288, -2.284908, 1, 1, 1, 1, 1,
-1.433361, 2.577834, -0.756719, 1, 1, 1, 1, 1,
-1.430202, -0.8204963, -0.9907771, 1, 1, 1, 1, 1,
-1.414175, 1.967431, -1.802828, 0, 0, 1, 1, 1,
-1.404654, 1.967946, -1.646934, 1, 0, 0, 1, 1,
-1.385949, 0.07167242, -2.642077, 1, 0, 0, 1, 1,
-1.385138, 1.204253, 0.4556748, 1, 0, 0, 1, 1,
-1.384952, 1.059622, -1.682557, 1, 0, 0, 1, 1,
-1.384146, 1.026019, -1.517955, 1, 0, 0, 1, 1,
-1.383935, -0.321633, -3.512725, 0, 0, 0, 1, 1,
-1.373443, -0.4131417, -3.28905, 0, 0, 0, 1, 1,
-1.37153, -0.8569688, -2.521105, 0, 0, 0, 1, 1,
-1.361184, 0.3381175, -0.6206297, 0, 0, 0, 1, 1,
-1.354938, 0.1193528, -1.39105, 0, 0, 0, 1, 1,
-1.314667, 1.574946, -0.5422138, 0, 0, 0, 1, 1,
-1.31073, 0.5262049, -1.451708, 0, 0, 0, 1, 1,
-1.308412, 0.7050976, -0.4699912, 1, 1, 1, 1, 1,
-1.279873, -0.9669061, -2.481134, 1, 1, 1, 1, 1,
-1.271432, 0.1113109, -1.804346, 1, 1, 1, 1, 1,
-1.265105, 1.718169, -1.981435, 1, 1, 1, 1, 1,
-1.253518, -0.2716409, -1.190154, 1, 1, 1, 1, 1,
-1.244171, 2.515312, 0.4389168, 1, 1, 1, 1, 1,
-1.24217, -0.6463241, -0.6224149, 1, 1, 1, 1, 1,
-1.238725, 0.3702385, -2.33027, 1, 1, 1, 1, 1,
-1.234804, 0.273805, -1.190882, 1, 1, 1, 1, 1,
-1.229374, 1.500224, 0.238421, 1, 1, 1, 1, 1,
-1.228408, -0.3816636, -2.707964, 1, 1, 1, 1, 1,
-1.22473, -0.3552799, -2.306229, 1, 1, 1, 1, 1,
-1.211959, -0.4845017, -0.9960761, 1, 1, 1, 1, 1,
-1.208348, -0.5668598, -0.2784625, 1, 1, 1, 1, 1,
-1.201153, -1.732575, -2.193194, 1, 1, 1, 1, 1,
-1.191448, 0.03910891, -1.255119, 0, 0, 1, 1, 1,
-1.186364, -0.2135469, -2.647844, 1, 0, 0, 1, 1,
-1.179926, -0.9574935, -2.811507, 1, 0, 0, 1, 1,
-1.171315, -0.7322937, -1.456903, 1, 0, 0, 1, 1,
-1.161914, 2.452974, -0.7693363, 1, 0, 0, 1, 1,
-1.15558, 1.161985, -0.6101294, 1, 0, 0, 1, 1,
-1.146513, 0.7673614, -0.4697971, 0, 0, 0, 1, 1,
-1.143577, 0.7966412, 0.01566818, 0, 0, 0, 1, 1,
-1.142338, 0.5709726, 0.8549897, 0, 0, 0, 1, 1,
-1.121843, -0.8682759, -2.139894, 0, 0, 0, 1, 1,
-1.121292, 0.230274, -1.496015, 0, 0, 0, 1, 1,
-1.118338, -0.1782996, -3.231951, 0, 0, 0, 1, 1,
-1.108236, 0.6644893, -0.9996873, 0, 0, 0, 1, 1,
-1.107031, -0.7967249, -2.808524, 1, 1, 1, 1, 1,
-1.106584, 0.1625043, -1.667118, 1, 1, 1, 1, 1,
-1.105457, 0.7613546, -0.9899079, 1, 1, 1, 1, 1,
-1.0957, 0.01498842, -1.479991, 1, 1, 1, 1, 1,
-1.094622, 1.065051, -0.4083765, 1, 1, 1, 1, 1,
-1.094315, 0.9133873, -1.347883, 1, 1, 1, 1, 1,
-1.09006, 0.3710796, -0.3693714, 1, 1, 1, 1, 1,
-1.087919, -0.6488842, -2.001135, 1, 1, 1, 1, 1,
-1.086545, -0.1643036, -1.810645, 1, 1, 1, 1, 1,
-1.080352, -1.74405, -3.272709, 1, 1, 1, 1, 1,
-1.075792, 0.2471772, -0.8958502, 1, 1, 1, 1, 1,
-1.065985, 0.07728802, -0.4501791, 1, 1, 1, 1, 1,
-1.065771, 1.058541, -0.2768191, 1, 1, 1, 1, 1,
-1.052689, 0.3081738, -1.940939, 1, 1, 1, 1, 1,
-1.034903, -0.4668275, -1.801616, 1, 1, 1, 1, 1,
-1.034753, -0.07290609, -1.528145, 0, 0, 1, 1, 1,
-1.033783, -2.528854, -2.74289, 1, 0, 0, 1, 1,
-1.023487, 1.353736, 0.547333, 1, 0, 0, 1, 1,
-1.01758, -1.868406, -2.786175, 1, 0, 0, 1, 1,
-1.01413, -0.3826963, -3.371671, 1, 0, 0, 1, 1,
-1.011655, -0.07645573, -3.701177, 1, 0, 0, 1, 1,
-1.00384, 0.0307764, -0.01034878, 0, 0, 0, 1, 1,
-1.002732, 0.7206355, -0.5561, 0, 0, 0, 1, 1,
-1.001898, 1.229828, -0.8652916, 0, 0, 0, 1, 1,
-0.9999477, -0.103189, -2.890902, 0, 0, 0, 1, 1,
-0.9965448, 0.3142795, -0.532941, 0, 0, 0, 1, 1,
-0.9918048, 1.586012, 0.5905445, 0, 0, 0, 1, 1,
-0.9900833, 0.8281999, -0.8324503, 0, 0, 0, 1, 1,
-0.9815248, 0.8698452, 0.1038425, 1, 1, 1, 1, 1,
-0.9791583, -0.4128492, -0.4319219, 1, 1, 1, 1, 1,
-0.9791233, 0.6768772, -1.449385, 1, 1, 1, 1, 1,
-0.9662353, -0.2626669, -1.03292, 1, 1, 1, 1, 1,
-0.9563422, 1.707028, -1.663603, 1, 1, 1, 1, 1,
-0.9556647, -1.270805, -3.259247, 1, 1, 1, 1, 1,
-0.9443476, 0.4541587, 0.3291924, 1, 1, 1, 1, 1,
-0.9438767, 0.2323108, -0.7372022, 1, 1, 1, 1, 1,
-0.9435507, 1.505716, -0.8514456, 1, 1, 1, 1, 1,
-0.9401607, -0.06615932, -1.050247, 1, 1, 1, 1, 1,
-0.9231054, 1.947022, 0.0496382, 1, 1, 1, 1, 1,
-0.9216332, -2.253034, -1.367535, 1, 1, 1, 1, 1,
-0.9184398, -0.3487624, -2.804121, 1, 1, 1, 1, 1,
-0.9096698, -1.002213, -2.127762, 1, 1, 1, 1, 1,
-0.9075725, -0.7746311, -1.956346, 1, 1, 1, 1, 1,
-0.9067956, 0.7054713, -0.7104893, 0, 0, 1, 1, 1,
-0.906601, -1.43032, -2.995202, 1, 0, 0, 1, 1,
-0.9063618, 1.569032, -2.362553, 1, 0, 0, 1, 1,
-0.887607, -1.221096, -1.358931, 1, 0, 0, 1, 1,
-0.8875112, 2.000027, -0.3793822, 1, 0, 0, 1, 1,
-0.8862692, -0.3232754, -0.6202943, 1, 0, 0, 1, 1,
-0.8843718, 0.2702091, -0.4375067, 0, 0, 0, 1, 1,
-0.8709238, 0.5253716, -1.147619, 0, 0, 0, 1, 1,
-0.8699288, -0.02511042, -2.072773, 0, 0, 0, 1, 1,
-0.8662542, -0.2226185, -1.818488, 0, 0, 0, 1, 1,
-0.8657412, 1.119835, -0.6637834, 0, 0, 0, 1, 1,
-0.8655974, -1.146981, -2.729272, 0, 0, 0, 1, 1,
-0.8648352, 0.3140042, -1.124256, 0, 0, 0, 1, 1,
-0.860084, -0.01164446, -1.744355, 1, 1, 1, 1, 1,
-0.8580687, -2.740094, -2.713847, 1, 1, 1, 1, 1,
-0.8551354, 1.881615, -0.613829, 1, 1, 1, 1, 1,
-0.8513682, 0.05025385, -0.00861417, 1, 1, 1, 1, 1,
-0.8494185, -1.575906, -2.882009, 1, 1, 1, 1, 1,
-0.8484445, 0.8104221, -0.9579745, 1, 1, 1, 1, 1,
-0.8409991, -0.3191539, -2.689849, 1, 1, 1, 1, 1,
-0.8385572, -0.9196761, -4.651726, 1, 1, 1, 1, 1,
-0.8359506, -0.1253611, -2.065902, 1, 1, 1, 1, 1,
-0.828191, 0.7185389, -0.2782639, 1, 1, 1, 1, 1,
-0.8188547, -0.0003087725, -1.923801, 1, 1, 1, 1, 1,
-0.8160667, -0.2587747, 0.04732811, 1, 1, 1, 1, 1,
-0.8092459, 1.659612, -1.334744, 1, 1, 1, 1, 1,
-0.8080032, -0.4436804, -0.8584743, 1, 1, 1, 1, 1,
-0.807223, -2.125162, -3.813076, 1, 1, 1, 1, 1,
-0.8054491, 0.352198, -2.120827, 0, 0, 1, 1, 1,
-0.8038037, -0.8442459, -1.539845, 1, 0, 0, 1, 1,
-0.8017644, 1.55991, -0.8044345, 1, 0, 0, 1, 1,
-0.7928922, -0.6903942, -2.090464, 1, 0, 0, 1, 1,
-0.7900965, 0.4407678, -2.910743, 1, 0, 0, 1, 1,
-0.7894933, -0.7448234, -3.447499, 1, 0, 0, 1, 1,
-0.7880081, 0.4278567, -1.698066, 0, 0, 0, 1, 1,
-0.7880051, 0.9255367, -0.6035156, 0, 0, 0, 1, 1,
-0.7794309, 0.7494298, -1.049638, 0, 0, 0, 1, 1,
-0.7792501, 0.9308282, -0.6909983, 0, 0, 0, 1, 1,
-0.7741507, -0.3083284, -1.286305, 0, 0, 0, 1, 1,
-0.7635761, -1.474493, -3.747777, 0, 0, 0, 1, 1,
-0.7624269, -1.399009, -2.186733, 0, 0, 0, 1, 1,
-0.7468637, -0.4035234, -3.403027, 1, 1, 1, 1, 1,
-0.7424989, 0.6001722, -1.252635, 1, 1, 1, 1, 1,
-0.742482, -0.9227284, -2.92171, 1, 1, 1, 1, 1,
-0.7368166, -0.1775552, -1.164472, 1, 1, 1, 1, 1,
-0.7343975, -0.1569527, -1.694622, 1, 1, 1, 1, 1,
-0.7318828, -0.02806338, 0.3818573, 1, 1, 1, 1, 1,
-0.7306131, 0.2700235, -1.309473, 1, 1, 1, 1, 1,
-0.7270474, -0.3093737, -0.3106122, 1, 1, 1, 1, 1,
-0.726506, -0.9268745, -1.708247, 1, 1, 1, 1, 1,
-0.7258608, 0.8409654, -0.5079169, 1, 1, 1, 1, 1,
-0.7239436, -0.5767593, -3.22931, 1, 1, 1, 1, 1,
-0.721751, -0.2398871, -2.706649, 1, 1, 1, 1, 1,
-0.720939, 0.1075782, -3.051168, 1, 1, 1, 1, 1,
-0.7190809, -0.5311962, -1.933709, 1, 1, 1, 1, 1,
-0.7180597, 0.6316825, -0.3915677, 1, 1, 1, 1, 1,
-0.717854, 0.78875, -0.9165017, 0, 0, 1, 1, 1,
-0.7172793, -0.3788353, -3.203878, 1, 0, 0, 1, 1,
-0.7148992, 0.2198417, -0.5736967, 1, 0, 0, 1, 1,
-0.7139646, 0.4938896, -0.8940866, 1, 0, 0, 1, 1,
-0.7135949, 0.7172541, 0.5431197, 1, 0, 0, 1, 1,
-0.7118291, 0.5343586, 1.449261, 1, 0, 0, 1, 1,
-0.7114858, 1.242644, -0.5029585, 0, 0, 0, 1, 1,
-0.7111349, 2.578299, -0.3289153, 0, 0, 0, 1, 1,
-0.7069322, 0.7168799, 0.6267539, 0, 0, 0, 1, 1,
-0.6981052, 0.6823279, 0.7151175, 0, 0, 0, 1, 1,
-0.6902109, -0.853353, -5.118912, 0, 0, 0, 1, 1,
-0.6869974, 0.2939875, -0.4379369, 0, 0, 0, 1, 1,
-0.6858863, -0.35129, -2.977268, 0, 0, 0, 1, 1,
-0.683281, 0.08461615, -0.5572817, 1, 1, 1, 1, 1,
-0.681489, -1.468577, -2.171578, 1, 1, 1, 1, 1,
-0.6801273, -0.1491087, -0.2531838, 1, 1, 1, 1, 1,
-0.6795912, 0.4400868, 0.1641839, 1, 1, 1, 1, 1,
-0.677068, -1.422922, -2.119515, 1, 1, 1, 1, 1,
-0.6759741, -0.3963428, -0.9088944, 1, 1, 1, 1, 1,
-0.6758556, 0.1985239, -0.4107412, 1, 1, 1, 1, 1,
-0.6730006, 0.4204662, -2.071485, 1, 1, 1, 1, 1,
-0.6716078, 1.158315, -1.131793, 1, 1, 1, 1, 1,
-0.6712308, -1.396999, -2.978729, 1, 1, 1, 1, 1,
-0.6618807, 0.4814683, -2.355498, 1, 1, 1, 1, 1,
-0.6603374, -0.323777, -1.766862, 1, 1, 1, 1, 1,
-0.6517788, -0.5427106, -1.864489, 1, 1, 1, 1, 1,
-0.6503755, -1.201746, -0.8362998, 1, 1, 1, 1, 1,
-0.6447801, -0.943684, -0.5449372, 1, 1, 1, 1, 1,
-0.6280787, 0.8540069, 0.9855019, 0, 0, 1, 1, 1,
-0.6218262, 0.7692659, -0.6181868, 1, 0, 0, 1, 1,
-0.6211908, -0.9960814, -1.491837, 1, 0, 0, 1, 1,
-0.6178427, 1.330586, -0.7418246, 1, 0, 0, 1, 1,
-0.6156492, -1.175162, -4.235159, 1, 0, 0, 1, 1,
-0.6107847, 0.8932819, -0.5675762, 1, 0, 0, 1, 1,
-0.6104048, -0.7606316, -2.879017, 0, 0, 0, 1, 1,
-0.6091058, -0.08947486, -0.8863355, 0, 0, 0, 1, 1,
-0.6077987, -1.062742, -2.239645, 0, 0, 0, 1, 1,
-0.5992101, -0.6226087, -2.176942, 0, 0, 0, 1, 1,
-0.5960344, 0.2024553, -1.287487, 0, 0, 0, 1, 1,
-0.5942201, 0.7448369, -0.4630557, 0, 0, 0, 1, 1,
-0.5933691, 0.3757473, -1.162491, 0, 0, 0, 1, 1,
-0.5878796, -0.6205541, -4.402329, 1, 1, 1, 1, 1,
-0.5842646, -0.9033718, -3.057333, 1, 1, 1, 1, 1,
-0.5836349, -0.908058, -2.65025, 1, 1, 1, 1, 1,
-0.5800065, 0.9038708, -1.938283, 1, 1, 1, 1, 1,
-0.5763731, 0.6134192, -0.3179831, 1, 1, 1, 1, 1,
-0.5673382, -1.093949, -2.524374, 1, 1, 1, 1, 1,
-0.5520349, 0.3591577, -1.867444, 1, 1, 1, 1, 1,
-0.5505019, 0.3968083, -0.7990627, 1, 1, 1, 1, 1,
-0.5504509, 1.068039, -0.0955398, 1, 1, 1, 1, 1,
-0.5479057, -1.360462, -0.4205323, 1, 1, 1, 1, 1,
-0.5439816, 1.980892, -1.467198, 1, 1, 1, 1, 1,
-0.5427595, 0.7517837, 0.3266903, 1, 1, 1, 1, 1,
-0.5406013, 1.628404, 0.3586683, 1, 1, 1, 1, 1,
-0.5395176, 0.4717738, -0.6248084, 1, 1, 1, 1, 1,
-0.5366843, 0.4565427, 0.3705268, 1, 1, 1, 1, 1,
-0.5338118, 0.02249684, -2.35861, 0, 0, 1, 1, 1,
-0.5316456, -0.5400516, -0.9223704, 1, 0, 0, 1, 1,
-0.5284565, -1.229645, -3.711926, 1, 0, 0, 1, 1,
-0.5249523, 0.6550078, 0.2901832, 1, 0, 0, 1, 1,
-0.523888, -0.924808, -4.062523, 1, 0, 0, 1, 1,
-0.5211269, 0.4480306, -1.602614, 1, 0, 0, 1, 1,
-0.5206432, -0.401745, -2.271073, 0, 0, 0, 1, 1,
-0.5157833, 0.5350934, -0.9565176, 0, 0, 0, 1, 1,
-0.5094847, -0.3672282, -1.910903, 0, 0, 0, 1, 1,
-0.5045621, -0.09119048, -2.042273, 0, 0, 0, 1, 1,
-0.5041071, -0.3944597, -1.339171, 0, 0, 0, 1, 1,
-0.5007459, 0.04448319, -1.24007, 0, 0, 0, 1, 1,
-0.4987109, -1.586458, -2.163707, 0, 0, 0, 1, 1,
-0.4936966, -0.2035644, -3.26551, 1, 1, 1, 1, 1,
-0.4905794, -0.2104668, -3.397745, 1, 1, 1, 1, 1,
-0.4808176, 0.2279289, -0.03262492, 1, 1, 1, 1, 1,
-0.480495, 1.274602, 0.4519429, 1, 1, 1, 1, 1,
-0.4762833, -0.2401379, -2.633731, 1, 1, 1, 1, 1,
-0.4742266, -0.2397763, -1.37498, 1, 1, 1, 1, 1,
-0.4732782, -1.599786, -3.576934, 1, 1, 1, 1, 1,
-0.4650967, 1.088543, -1.99503, 1, 1, 1, 1, 1,
-0.4593458, 0.3293636, -1.850671, 1, 1, 1, 1, 1,
-0.4590528, -1.276398, -2.265807, 1, 1, 1, 1, 1,
-0.4545577, -0.4297984, -1.200245, 1, 1, 1, 1, 1,
-0.4521857, -0.5023161, -2.500247, 1, 1, 1, 1, 1,
-0.4504992, 0.5030153, -3.020106, 1, 1, 1, 1, 1,
-0.4484468, -0.3192827, -2.810842, 1, 1, 1, 1, 1,
-0.4479535, -3.404503, -4.967842, 1, 1, 1, 1, 1,
-0.4459631, -2.038479, -3.29662, 0, 0, 1, 1, 1,
-0.4411533, 1.155369, 1.403472, 1, 0, 0, 1, 1,
-0.4396285, 1.100469, 0.698678, 1, 0, 0, 1, 1,
-0.4365366, 1.262231, 0.5677616, 1, 0, 0, 1, 1,
-0.4362647, 1.273302, 1.009901, 1, 0, 0, 1, 1,
-0.4361385, 0.3452325, -0.5966699, 1, 0, 0, 1, 1,
-0.4346391, 0.7037962, -1.382891, 0, 0, 0, 1, 1,
-0.4297307, 0.2092704, -0.1217144, 0, 0, 0, 1, 1,
-0.426495, -1.455263, -4.867327, 0, 0, 0, 1, 1,
-0.4261001, -0.3896311, -1.447043, 0, 0, 0, 1, 1,
-0.4192183, -0.7326069, -4.053472, 0, 0, 0, 1, 1,
-0.4185307, 0.9516643, -0.3295682, 0, 0, 0, 1, 1,
-0.4183859, 1.023175, -0.5956857, 0, 0, 0, 1, 1,
-0.4181151, 1.15815, -0.05222065, 1, 1, 1, 1, 1,
-0.413962, -1.148551, -0.5711713, 1, 1, 1, 1, 1,
-0.4139194, -2.087292, -6.438361, 1, 1, 1, 1, 1,
-0.4137131, -1.017863, 0.9916531, 1, 1, 1, 1, 1,
-0.4120646, -0.2805462, -2.678478, 1, 1, 1, 1, 1,
-0.4101588, 0.3438614, -0.9864609, 1, 1, 1, 1, 1,
-0.4067703, 2.22948, 0.6333212, 1, 1, 1, 1, 1,
-0.4050012, 0.3020244, -2.603524, 1, 1, 1, 1, 1,
-0.4015706, -1.210558, -2.951756, 1, 1, 1, 1, 1,
-0.4006318, 0.8747063, 0.3921133, 1, 1, 1, 1, 1,
-0.3936081, -0.8466894, -3.613898, 1, 1, 1, 1, 1,
-0.3932109, 0.6913651, -0.9520209, 1, 1, 1, 1, 1,
-0.3857697, 1.1163, -1.270502, 1, 1, 1, 1, 1,
-0.3806496, 1.033661, 0.8974904, 1, 1, 1, 1, 1,
-0.3805205, -0.5743665, -3.095936, 1, 1, 1, 1, 1,
-0.3786919, 1.457681, -0.545679, 0, 0, 1, 1, 1,
-0.3779725, 0.1567466, 0.1274342, 1, 0, 0, 1, 1,
-0.3760075, -1.632366, -3.554433, 1, 0, 0, 1, 1,
-0.3732528, -2.003777, -3.12277, 1, 0, 0, 1, 1,
-0.3712956, 0.1535663, 0.2254387, 1, 0, 0, 1, 1,
-0.3690386, 0.8441361, 1.455714, 1, 0, 0, 1, 1,
-0.3678383, -0.3333142, -2.240125, 0, 0, 0, 1, 1,
-0.3678295, -0.8055295, -1.025996, 0, 0, 0, 1, 1,
-0.3578584, 1.698225, 0.7387859, 0, 0, 0, 1, 1,
-0.3529254, -1.05076, -3.371917, 0, 0, 0, 1, 1,
-0.3519537, 2.214569, -0.2996937, 0, 0, 0, 1, 1,
-0.3509797, -0.9982109, -2.507542, 0, 0, 0, 1, 1,
-0.3477975, 2.08989, 0.02077958, 0, 0, 0, 1, 1,
-0.347607, -0.4310345, -1.436879, 1, 1, 1, 1, 1,
-0.347219, -0.8393915, -2.100884, 1, 1, 1, 1, 1,
-0.3431881, -0.5207657, -4.307354, 1, 1, 1, 1, 1,
-0.340738, 1.456789, 0.6054392, 1, 1, 1, 1, 1,
-0.3387916, -0.3896139, -3.949899, 1, 1, 1, 1, 1,
-0.336386, -0.9283305, -2.833494, 1, 1, 1, 1, 1,
-0.3350154, 0.3359048, -0.4214974, 1, 1, 1, 1, 1,
-0.3349828, 0.2240201, -2.074677, 1, 1, 1, 1, 1,
-0.3341187, 0.537648, -0.05917763, 1, 1, 1, 1, 1,
-0.3328377, -0.79195, -1.749495, 1, 1, 1, 1, 1,
-0.3319969, 0.8138068, -0.6237983, 1, 1, 1, 1, 1,
-0.3307172, 0.03263531, -2.918651, 1, 1, 1, 1, 1,
-0.3299854, 0.4262103, -1.0066, 1, 1, 1, 1, 1,
-0.3294546, 1.259583, 1.281234, 1, 1, 1, 1, 1,
-0.3281956, 0.8473753, -0.2838291, 1, 1, 1, 1, 1,
-0.3207532, -0.5186698, -3.045589, 0, 0, 1, 1, 1,
-0.3173635, 0.7266005, -0.8088224, 1, 0, 0, 1, 1,
-0.3168399, -0.1842133, -1.420222, 1, 0, 0, 1, 1,
-0.3161753, -0.8719571, -2.037354, 1, 0, 0, 1, 1,
-0.3149621, -1.078718, -3.724277, 1, 0, 0, 1, 1,
-0.3148526, 0.8318031, -1.085491, 1, 0, 0, 1, 1,
-0.313251, -0.8009105, -1.71965, 0, 0, 0, 1, 1,
-0.3111019, -0.4058352, -1.743459, 0, 0, 0, 1, 1,
-0.2997608, 1.743445, 0.6313479, 0, 0, 0, 1, 1,
-0.2971893, -0.9758115, -2.530169, 0, 0, 0, 1, 1,
-0.2938828, 0.4602941, -0.05207103, 0, 0, 0, 1, 1,
-0.2931775, -1.351223, -3.363858, 0, 0, 0, 1, 1,
-0.2911796, -1.559717, -3.583166, 0, 0, 0, 1, 1,
-0.2840757, -0.1343045, -2.327878, 1, 1, 1, 1, 1,
-0.2773344, -0.1710313, -1.412192, 1, 1, 1, 1, 1,
-0.2740206, 0.9640073, -1.557854, 1, 1, 1, 1, 1,
-0.2704521, -0.2982301, -1.712318, 1, 1, 1, 1, 1,
-0.2699799, 0.02019821, -1.393088, 1, 1, 1, 1, 1,
-0.265873, 0.1962213, -1.542976, 1, 1, 1, 1, 1,
-0.2520956, -1.155656, -3.381769, 1, 1, 1, 1, 1,
-0.2502072, -1.072467, -3.835841, 1, 1, 1, 1, 1,
-0.247095, -0.03659487, -3.119364, 1, 1, 1, 1, 1,
-0.2462954, 0.1000713, 0.1292544, 1, 1, 1, 1, 1,
-0.2432927, -2.43753, -3.802591, 1, 1, 1, 1, 1,
-0.2403305, 0.5197256, 1.213746, 1, 1, 1, 1, 1,
-0.233829, 0.07554884, -2.107061, 1, 1, 1, 1, 1,
-0.2328692, 1.237841, -0.5701006, 1, 1, 1, 1, 1,
-0.2257551, 0.7310269, 0.02698945, 1, 1, 1, 1, 1,
-0.2255713, -0.6924855, -3.031273, 0, 0, 1, 1, 1,
-0.2170097, 0.2488302, -0.6417716, 1, 0, 0, 1, 1,
-0.2169801, -1.833264, -1.930281, 1, 0, 0, 1, 1,
-0.2112655, -1.1105, -3.902035, 1, 0, 0, 1, 1,
-0.2088414, -0.5260605, -2.392371, 1, 0, 0, 1, 1,
-0.2064147, 2.255515, 1.674322, 1, 0, 0, 1, 1,
-0.2059814, 1.750799, 1.837419, 0, 0, 0, 1, 1,
-0.2044554, -1.682976, -0.4339622, 0, 0, 0, 1, 1,
-0.2042869, -0.2432265, -1.927158, 0, 0, 0, 1, 1,
-0.2037999, -0.9319086, -2.416382, 0, 0, 0, 1, 1,
-0.1958296, 0.06227731, -1.12201, 0, 0, 0, 1, 1,
-0.1951639, -0.1300461, -4.117587, 0, 0, 0, 1, 1,
-0.1895278, -0.9959069, -3.299622, 0, 0, 0, 1, 1,
-0.1883429, 0.2309285, 0.1311769, 1, 1, 1, 1, 1,
-0.1855903, 1.126589, -0.455239, 1, 1, 1, 1, 1,
-0.1853037, 0.5929459, 0.2193279, 1, 1, 1, 1, 1,
-0.1839375, 0.3460152, 0.4271357, 1, 1, 1, 1, 1,
-0.1828417, -0.3823089, -4.386738, 1, 1, 1, 1, 1,
-0.1760414, -1.116654, -2.594644, 1, 1, 1, 1, 1,
-0.1750173, 0.9215712, -1.004001, 1, 1, 1, 1, 1,
-0.174208, 0.297454, 0.3999718, 1, 1, 1, 1, 1,
-0.1712971, -0.4752185, -1.763432, 1, 1, 1, 1, 1,
-0.1711233, 0.3836344, -0.3690994, 1, 1, 1, 1, 1,
-0.1661187, 0.333859, 0.9125734, 1, 1, 1, 1, 1,
-0.1660349, 0.4146566, -0.3324615, 1, 1, 1, 1, 1,
-0.1657793, -0.09156374, -0.5620184, 1, 1, 1, 1, 1,
-0.1649678, -1.700478, -3.455268, 1, 1, 1, 1, 1,
-0.1583498, -1.599758, -1.898601, 1, 1, 1, 1, 1,
-0.1581692, 0.1145236, 0.2714258, 0, 0, 1, 1, 1,
-0.1572027, 0.5255408, 0.3070376, 1, 0, 0, 1, 1,
-0.1569186, 0.3653017, 0.9933057, 1, 0, 0, 1, 1,
-0.156854, -0.4157019, -2.750634, 1, 0, 0, 1, 1,
-0.1542147, 0.1769163, -1.01449, 1, 0, 0, 1, 1,
-0.1534176, 1.323551, -1.156514, 1, 0, 0, 1, 1,
-0.153182, -0.384497, -2.469589, 0, 0, 0, 1, 1,
-0.1527793, -0.7475896, -1.674698, 0, 0, 0, 1, 1,
-0.1521793, -2.089957, -3.187772, 0, 0, 0, 1, 1,
-0.1519903, -0.5186061, -2.513213, 0, 0, 0, 1, 1,
-0.149267, 0.7746548, 0.08943795, 0, 0, 0, 1, 1,
-0.1491105, -0.4054233, -3.297818, 0, 0, 0, 1, 1,
-0.1484167, -1.15762, -3.647229, 0, 0, 0, 1, 1,
-0.1481258, 1.620001, -1.130103, 1, 1, 1, 1, 1,
-0.1478115, -1.449262, -2.799307, 1, 1, 1, 1, 1,
-0.1430292, -0.2552074, -1.970652, 1, 1, 1, 1, 1,
-0.1427617, 0.8617341, 0.7133111, 1, 1, 1, 1, 1,
-0.1366824, 0.9641339, -1.053469, 1, 1, 1, 1, 1,
-0.1365814, -1.626266, -4.825029, 1, 1, 1, 1, 1,
-0.1363149, -0.5878595, -3.269814, 1, 1, 1, 1, 1,
-0.1335325, 0.2558831, -0.3952354, 1, 1, 1, 1, 1,
-0.1330826, 0.7172705, -0.08417949, 1, 1, 1, 1, 1,
-0.1329231, -0.6864794, -2.418728, 1, 1, 1, 1, 1,
-0.1321479, 0.1447626, -2.027718, 1, 1, 1, 1, 1,
-0.1292315, 0.4860522, 0.6915811, 1, 1, 1, 1, 1,
-0.1246564, -2.511483, -4.259097, 1, 1, 1, 1, 1,
-0.1235246, 0.1620429, -0.2797195, 1, 1, 1, 1, 1,
-0.1163704, -0.2992765, -3.704742, 1, 1, 1, 1, 1,
-0.1158766, 1.347087, -1.419568, 0, 0, 1, 1, 1,
-0.1077361, -0.7860685, -0.2997777, 1, 0, 0, 1, 1,
-0.1061772, 0.5167576, 1.196584, 1, 0, 0, 1, 1,
-0.09785328, 0.6741285, -0.4940138, 1, 0, 0, 1, 1,
-0.0961911, -0.7598264, -3.683628, 1, 0, 0, 1, 1,
-0.09581368, -0.6356621, -3.114321, 1, 0, 0, 1, 1,
-0.09461121, -1.289847, -2.817477, 0, 0, 0, 1, 1,
-0.09417059, -0.007504495, -2.774198, 0, 0, 0, 1, 1,
-0.09397131, 0.4317881, -1.035527, 0, 0, 0, 1, 1,
-0.09299901, -0.5998961, -1.137246, 0, 0, 0, 1, 1,
-0.09162704, -1.07971, -3.680384, 0, 0, 0, 1, 1,
-0.08282167, -0.6195179, -2.36795, 0, 0, 0, 1, 1,
-0.08085056, -1.518852, -3.335451, 0, 0, 0, 1, 1,
-0.07768056, -2.408554, -3.160983, 1, 1, 1, 1, 1,
-0.07405871, 0.4833615, -0.6797255, 1, 1, 1, 1, 1,
-0.06635365, 1.043679, 0.2308343, 1, 1, 1, 1, 1,
-0.06564091, -0.2295436, -1.092059, 1, 1, 1, 1, 1,
-0.0647314, 0.8198137, -0.5949087, 1, 1, 1, 1, 1,
-0.05934327, 0.1486043, -0.3224767, 1, 1, 1, 1, 1,
-0.05219231, -1.771899, -2.742983, 1, 1, 1, 1, 1,
-0.05204359, 2.506393, 0.3017013, 1, 1, 1, 1, 1,
-0.05199958, 0.8894598, -0.5729722, 1, 1, 1, 1, 1,
-0.04730869, 0.2993217, -0.08035606, 1, 1, 1, 1, 1,
-0.04663309, 0.2689684, 0.1305886, 1, 1, 1, 1, 1,
-0.04497367, 0.2320669, -2.440706, 1, 1, 1, 1, 1,
-0.0418112, -0.2450721, -2.657453, 1, 1, 1, 1, 1,
-0.04094487, 0.1245909, -0.05912548, 1, 1, 1, 1, 1,
-0.04072703, -0.7620749, -4.079662, 1, 1, 1, 1, 1,
-0.0361008, -0.02764004, -3.648346, 0, 0, 1, 1, 1,
-0.03565353, -2.057859, -3.410737, 1, 0, 0, 1, 1,
-0.02739784, -0.206149, -4.021011, 1, 0, 0, 1, 1,
-0.02395432, -0.5510001, -3.236989, 1, 0, 0, 1, 1,
-0.02388379, -0.3895755, -1.336771, 1, 0, 0, 1, 1,
-0.02281237, -0.3442346, -2.411218, 1, 0, 0, 1, 1,
-0.0207588, 1.71298, 1.514476, 0, 0, 0, 1, 1,
-0.01589002, 1.453771, 2.372704, 0, 0, 0, 1, 1,
-0.01563558, -0.2187609, -3.476143, 0, 0, 0, 1, 1,
-0.009182028, -0.6401337, -4.613432, 0, 0, 0, 1, 1,
-0.008096461, -1.55311, -2.851572, 0, 0, 0, 1, 1,
-0.003647957, -0.638716, -5.877021, 0, 0, 0, 1, 1,
-0.003391709, -0.6367871, -2.154645, 0, 0, 0, 1, 1,
-0.003234398, -0.03130876, -2.089944, 1, 1, 1, 1, 1,
-0.002126705, 0.3117119, -0.657969, 1, 1, 1, 1, 1,
0.0008301814, 0.7862215, 0.03470879, 1, 1, 1, 1, 1,
0.001647922, -0.5418556, 1.729139, 1, 1, 1, 1, 1,
0.001740425, 1.192303, -0.1774281, 1, 1, 1, 1, 1,
0.002808207, 0.8840815, -0.5557314, 1, 1, 1, 1, 1,
0.007222729, 1.771893, -0.2336373, 1, 1, 1, 1, 1,
0.02006779, 0.2531305, 0.3330435, 1, 1, 1, 1, 1,
0.02369376, -0.3076138, 3.855585, 1, 1, 1, 1, 1,
0.02466969, 2.799492, -1.444749, 1, 1, 1, 1, 1,
0.0279261, -0.5945911, 2.223647, 1, 1, 1, 1, 1,
0.02973826, 0.4548841, -0.2676841, 1, 1, 1, 1, 1,
0.03443896, 0.8831922, 0.02989838, 1, 1, 1, 1, 1,
0.03625898, -0.4280657, 1.586511, 1, 1, 1, 1, 1,
0.0364283, -1.046399, 4.331183, 1, 1, 1, 1, 1,
0.03899818, -0.6862005, 1.528146, 0, 0, 1, 1, 1,
0.04128932, 0.5229484, 1.712967, 1, 0, 0, 1, 1,
0.05128341, -1.515677, 1.432481, 1, 0, 0, 1, 1,
0.05292697, 2.749332, 2.47134, 1, 0, 0, 1, 1,
0.05306876, 1.968225, -0.2976655, 1, 0, 0, 1, 1,
0.05395878, 0.3653151, -0.4565409, 1, 0, 0, 1, 1,
0.0546084, 0.003831002, 2.218069, 0, 0, 0, 1, 1,
0.05645555, -0.1681411, 3.261637, 0, 0, 0, 1, 1,
0.05781514, 0.6035246, -0.4416035, 0, 0, 0, 1, 1,
0.05892207, -0.5842381, 3.72203, 0, 0, 0, 1, 1,
0.06061778, 0.7663887, -0.9020417, 0, 0, 0, 1, 1,
0.06069814, 0.7891299, -0.3984568, 0, 0, 0, 1, 1,
0.06410393, -0.9638113, 2.319504, 0, 0, 0, 1, 1,
0.06449606, 0.4334033, -1.197786, 1, 1, 1, 1, 1,
0.06533361, -1.605833, 2.628716, 1, 1, 1, 1, 1,
0.06548397, 0.9685215, 0.5973481, 1, 1, 1, 1, 1,
0.0683643, 1.498762, 0.4147581, 1, 1, 1, 1, 1,
0.07170505, -1.770447, 4.272083, 1, 1, 1, 1, 1,
0.07350089, -0.1066182, 4.404619, 1, 1, 1, 1, 1,
0.07486122, -0.558798, 3.94293, 1, 1, 1, 1, 1,
0.07490889, 1.109527, 1.424314, 1, 1, 1, 1, 1,
0.0800782, -1.291828, 3.495664, 1, 1, 1, 1, 1,
0.08256476, -0.1444434, 2.440437, 1, 1, 1, 1, 1,
0.08847237, 0.1150846, 1.791889, 1, 1, 1, 1, 1,
0.08852392, -0.05344846, 2.102348, 1, 1, 1, 1, 1,
0.08996216, 0.0438184, 0.8825613, 1, 1, 1, 1, 1,
0.09091218, 0.1342308, 1.540421, 1, 1, 1, 1, 1,
0.09289645, -1.335806, 3.615712, 1, 1, 1, 1, 1,
0.09300005, 0.2920117, -1.166811, 0, 0, 1, 1, 1,
0.09564008, 0.4825074, 0.8871244, 1, 0, 0, 1, 1,
0.09836187, -0.4348469, 4.539059, 1, 0, 0, 1, 1,
0.09844835, -0.07925196, 0.5692832, 1, 0, 0, 1, 1,
0.1010763, 0.01044104, -0.09300683, 1, 0, 0, 1, 1,
0.1021534, 1.037769, 0.1848828, 1, 0, 0, 1, 1,
0.1082092, 0.9376308, -1.209667, 0, 0, 0, 1, 1,
0.1093466, -0.6596841, 5.309507, 0, 0, 0, 1, 1,
0.1094493, 0.157129, -0.401913, 0, 0, 0, 1, 1,
0.1131758, -0.8291956, 3.442999, 0, 0, 0, 1, 1,
0.1172565, -0.6059471, 4.461389, 0, 0, 0, 1, 1,
0.118389, 1.119844, 1.85082, 0, 0, 0, 1, 1,
0.1271329, -0.3914425, 1.819718, 0, 0, 0, 1, 1,
0.1273601, -1.03133, 4.04059, 1, 1, 1, 1, 1,
0.1286307, -0.1917776, 3.164531, 1, 1, 1, 1, 1,
0.131336, -0.5155508, 2.713353, 1, 1, 1, 1, 1,
0.1335787, -1.54364, 4.151455, 1, 1, 1, 1, 1,
0.1345216, 1.018029, -1.488706, 1, 1, 1, 1, 1,
0.1383504, 0.5960703, 1.337202, 1, 1, 1, 1, 1,
0.1399518, -0.9892923, 1.549884, 1, 1, 1, 1, 1,
0.1403004, 0.265375, 0.3050644, 1, 1, 1, 1, 1,
0.1425371, 0.905441, 2.152659, 1, 1, 1, 1, 1,
0.145776, 0.7067259, -1.033916, 1, 1, 1, 1, 1,
0.1491714, 1.358787, 0.4195619, 1, 1, 1, 1, 1,
0.1501748, 1.026936, 0.9917278, 1, 1, 1, 1, 1,
0.151001, -0.07437835, 2.6867, 1, 1, 1, 1, 1,
0.155014, 0.367073, -0.5635716, 1, 1, 1, 1, 1,
0.1568473, 0.5571353, 0.3342296, 1, 1, 1, 1, 1,
0.1580265, -0.5519348, 2.002316, 0, 0, 1, 1, 1,
0.1591813, -1.122401, 2.851954, 1, 0, 0, 1, 1,
0.1614129, 1.880332, -1.207127, 1, 0, 0, 1, 1,
0.1619642, -1.182932, 2.963279, 1, 0, 0, 1, 1,
0.1629829, 0.2074618, 0.9647824, 1, 0, 0, 1, 1,
0.1638582, -1.980595, 1.844257, 1, 0, 0, 1, 1,
0.1646896, 0.967509, 0.7683758, 0, 0, 0, 1, 1,
0.1658075, -1.505969, 2.439038, 0, 0, 0, 1, 1,
0.1667141, -1.083438, 3.455366, 0, 0, 0, 1, 1,
0.1713392, 1.357487, 0.7488205, 0, 0, 0, 1, 1,
0.1744534, 0.6988186, 0.1887572, 0, 0, 0, 1, 1,
0.1798372, 0.1121485, -0.2763127, 0, 0, 0, 1, 1,
0.1828995, -2.818207, 3.608692, 0, 0, 0, 1, 1,
0.1838773, 0.3316318, 0.203469, 1, 1, 1, 1, 1,
0.1883545, -0.8869593, 3.06576, 1, 1, 1, 1, 1,
0.1900342, 0.298052, -0.5508364, 1, 1, 1, 1, 1,
0.1970271, -0.1593586, 0.9545989, 1, 1, 1, 1, 1,
0.2070725, -0.9618393, 3.534397, 1, 1, 1, 1, 1,
0.2080624, 0.8334936, 0.5897518, 1, 1, 1, 1, 1,
0.2122724, 0.8698742, 1.763736, 1, 1, 1, 1, 1,
0.2152508, 1.520983, 1.980721, 1, 1, 1, 1, 1,
0.2152797, -2.441614, 3.053135, 1, 1, 1, 1, 1,
0.2167833, 0.4792147, -0.05738095, 1, 1, 1, 1, 1,
0.2203826, 1.478862, -0.8789592, 1, 1, 1, 1, 1,
0.2218833, 0.5517058, -0.460523, 1, 1, 1, 1, 1,
0.2245512, -1.446224, 1.884717, 1, 1, 1, 1, 1,
0.2270764, -2.243461, 3.595202, 1, 1, 1, 1, 1,
0.2273671, 0.7990322, -1.470692, 1, 1, 1, 1, 1,
0.2287559, 0.4623742, -0.1236357, 0, 0, 1, 1, 1,
0.2326132, 0.3397765, 0.1168062, 1, 0, 0, 1, 1,
0.2354586, 0.6490502, -0.2915141, 1, 0, 0, 1, 1,
0.2382234, -0.3740348, 2.298649, 1, 0, 0, 1, 1,
0.2385259, 1.335432, -0.3822689, 1, 0, 0, 1, 1,
0.2498685, -0.1542853, 1.610327, 1, 0, 0, 1, 1,
0.2519643, -1.062841, 3.67283, 0, 0, 0, 1, 1,
0.2675387, -0.7175758, 2.018767, 0, 0, 0, 1, 1,
0.272916, -2.289456, 4.917471, 0, 0, 0, 1, 1,
0.2770557, 1.000523, 2.460899, 0, 0, 0, 1, 1,
0.2781778, 0.2652449, 1.49836, 0, 0, 0, 1, 1,
0.2810188, 1.496879, 0.3752907, 0, 0, 0, 1, 1,
0.2817252, -0.8794294, 3.046501, 0, 0, 0, 1, 1,
0.2863927, -2.132298, 3.596551, 1, 1, 1, 1, 1,
0.2867135, -2.13128, 3.214111, 1, 1, 1, 1, 1,
0.2870887, 1.246376, -0.3738688, 1, 1, 1, 1, 1,
0.2883245, 0.2972697, 0.01094156, 1, 1, 1, 1, 1,
0.2907256, 1.010956, -0.144766, 1, 1, 1, 1, 1,
0.2944949, 2.15044, -1.508239, 1, 1, 1, 1, 1,
0.2997244, -0.6335258, 3.205163, 1, 1, 1, 1, 1,
0.3022232, -0.07388576, 2.122543, 1, 1, 1, 1, 1,
0.302729, 0.9866506, 0.2950121, 1, 1, 1, 1, 1,
0.3036725, -0.1740152, 0.6141417, 1, 1, 1, 1, 1,
0.3074556, 0.3019725, 1.022872, 1, 1, 1, 1, 1,
0.3105172, 0.5954148, -0.1377645, 1, 1, 1, 1, 1,
0.3112261, 0.1609731, 1.300007, 1, 1, 1, 1, 1,
0.3151664, 0.2515123, -0.07167163, 1, 1, 1, 1, 1,
0.3153837, 0.6941003, 1.547398, 1, 1, 1, 1, 1,
0.3180993, 0.5544604, -0.003127719, 0, 0, 1, 1, 1,
0.3194879, -0.2756612, 0.9823059, 1, 0, 0, 1, 1,
0.3223394, -1.359161, 1.146711, 1, 0, 0, 1, 1,
0.3230529, -0.359129, 2.36768, 1, 0, 0, 1, 1,
0.3300374, -0.5287945, 2.78255, 1, 0, 0, 1, 1,
0.3331195, -1.000065, 3.491593, 1, 0, 0, 1, 1,
0.3433247, -0.8383385, 4.997454, 0, 0, 0, 1, 1,
0.3444601, 1.867517, 0.08265167, 0, 0, 0, 1, 1,
0.3465002, 1.224749, 0.4959998, 0, 0, 0, 1, 1,
0.3484338, 0.5640749, -0.8983083, 0, 0, 0, 1, 1,
0.3513867, -2.127305, 3.846913, 0, 0, 0, 1, 1,
0.3517979, 2.592686, -2.428478, 0, 0, 0, 1, 1,
0.3544403, 0.4558193, 2.08428, 0, 0, 0, 1, 1,
0.3547518, -1.295838, 3.264676, 1, 1, 1, 1, 1,
0.356559, 1.280929, -1.664229, 1, 1, 1, 1, 1,
0.3603621, 1.096539, 0.6308033, 1, 1, 1, 1, 1,
0.3670106, -0.8169647, 3.142279, 1, 1, 1, 1, 1,
0.3691109, -1.053588, 2.641478, 1, 1, 1, 1, 1,
0.3701035, -2.182608, 2.657552, 1, 1, 1, 1, 1,
0.370581, -0.264968, 2.930276, 1, 1, 1, 1, 1,
0.3871734, 0.744728, -0.3932819, 1, 1, 1, 1, 1,
0.3872969, -0.3068123, 2.435428, 1, 1, 1, 1, 1,
0.3874962, 0.7475498, 0.9316856, 1, 1, 1, 1, 1,
0.3875819, 0.3415103, 0.3625157, 1, 1, 1, 1, 1,
0.3882346, -2.110977, 2.71917, 1, 1, 1, 1, 1,
0.3923989, -0.7512376, 0.7403874, 1, 1, 1, 1, 1,
0.3943859, 0.778073, 0.9227864, 1, 1, 1, 1, 1,
0.3951409, -0.6351632, 1.782111, 1, 1, 1, 1, 1,
0.3964876, -0.3584334, 2.166312, 0, 0, 1, 1, 1,
0.3995372, 0.6024477, 2.229058, 1, 0, 0, 1, 1,
0.4028237, 0.9361258, 0.8602954, 1, 0, 0, 1, 1,
0.4077398, 0.8168146, 0.2797128, 1, 0, 0, 1, 1,
0.407934, -1.066129, 1.849028, 1, 0, 0, 1, 1,
0.4088736, 0.15265, 0.8193151, 1, 0, 0, 1, 1,
0.4109405, -1.130509, 2.423017, 0, 0, 0, 1, 1,
0.412338, -1.635512, 3.668582, 0, 0, 0, 1, 1,
0.4171324, -0.1166208, 1.005966, 0, 0, 0, 1, 1,
0.4202555, 0.4502171, 2.627441, 0, 0, 0, 1, 1,
0.4226679, 0.3980818, -0.08880065, 0, 0, 0, 1, 1,
0.4245179, -1.030902, 1.167889, 0, 0, 0, 1, 1,
0.4248737, 2.117626, -0.04737283, 0, 0, 0, 1, 1,
0.4252146, 0.6038979, 1.879786, 1, 1, 1, 1, 1,
0.4348535, -0.06517844, 0.8903996, 1, 1, 1, 1, 1,
0.4381902, -0.6887828, 3.657984, 1, 1, 1, 1, 1,
0.4434752, 1.050146, -0.09325133, 1, 1, 1, 1, 1,
0.4487601, 1.713458, -0.3585297, 1, 1, 1, 1, 1,
0.4494077, 0.4594384, 1.464143, 1, 1, 1, 1, 1,
0.4532999, 0.5489627, 0.6293669, 1, 1, 1, 1, 1,
0.453383, -0.5245405, 1.932177, 1, 1, 1, 1, 1,
0.4540392, 1.106541, -2.764552, 1, 1, 1, 1, 1,
0.4546269, -0.7805257, 2.911867, 1, 1, 1, 1, 1,
0.4547561, 0.8136561, 2.180022, 1, 1, 1, 1, 1,
0.455163, 1.498727, 1.604379, 1, 1, 1, 1, 1,
0.4553066, -0.1269194, -0.1787815, 1, 1, 1, 1, 1,
0.4562726, 0.2360955, 2.540305, 1, 1, 1, 1, 1,
0.4575967, -0.5528957, 1.088002, 1, 1, 1, 1, 1,
0.4582216, 0.236628, 0.3832145, 0, 0, 1, 1, 1,
0.4603405, 0.84388, 0.7879237, 1, 0, 0, 1, 1,
0.463875, 0.600058, 0.9570481, 1, 0, 0, 1, 1,
0.468952, -0.2536802, 3.492615, 1, 0, 0, 1, 1,
0.4707448, 0.546672, 1.418795, 1, 0, 0, 1, 1,
0.4708589, -1.085557, 3.982057, 1, 0, 0, 1, 1,
0.4728089, 0.7561173, 0.4870056, 0, 0, 0, 1, 1,
0.4741477, -0.5364795, 1.326848, 0, 0, 0, 1, 1,
0.477764, 0.6224909, 0.9434054, 0, 0, 0, 1, 1,
0.4923807, 1.643508, 0.07855942, 0, 0, 0, 1, 1,
0.5012023, 0.05598399, 1.590563, 0, 0, 0, 1, 1,
0.5012727, 0.4905242, 0.1258044, 0, 0, 0, 1, 1,
0.5042732, 0.8939665, -0.9209749, 0, 0, 0, 1, 1,
0.5130239, 0.8151528, -0.6848007, 1, 1, 1, 1, 1,
0.5176287, -2.6113, 3.85111, 1, 1, 1, 1, 1,
0.5195878, 0.01909267, 0.8718457, 1, 1, 1, 1, 1,
0.519594, -1.818061, 3.881187, 1, 1, 1, 1, 1,
0.5240124, -1.919262, 3.834087, 1, 1, 1, 1, 1,
0.5279921, -2.780941, 4.959294, 1, 1, 1, 1, 1,
0.5287241, -0.3081931, 0.9017408, 1, 1, 1, 1, 1,
0.5294741, 0.447974, 0.7164756, 1, 1, 1, 1, 1,
0.5303342, -0.2686873, 3.41627, 1, 1, 1, 1, 1,
0.5307986, 0.4958339, 1.650229, 1, 1, 1, 1, 1,
0.5379741, -1.239932, 2.175416, 1, 1, 1, 1, 1,
0.5388393, 0.417468, 0.8122848, 1, 1, 1, 1, 1,
0.5392513, 0.5533402, 2.282876, 1, 1, 1, 1, 1,
0.541653, 0.8897927, 1.929441, 1, 1, 1, 1, 1,
0.5419848, 1.476655, -0.168443, 1, 1, 1, 1, 1,
0.5433871, -0.1620364, 0.8482559, 0, 0, 1, 1, 1,
0.5437899, 0.6871637, -1.375222, 1, 0, 0, 1, 1,
0.551425, 0.8062446, 1.292142, 1, 0, 0, 1, 1,
0.5518237, -1.29058, 3.16821, 1, 0, 0, 1, 1,
0.5627248, -0.9847745, 2.849509, 1, 0, 0, 1, 1,
0.5701821, -0.4981755, 1.453152, 1, 0, 0, 1, 1,
0.5710187, 0.4549075, 0.323358, 0, 0, 0, 1, 1,
0.5725705, 1.180878, 0.7091628, 0, 0, 0, 1, 1,
0.5728599, 0.4406171, 2.114907, 0, 0, 0, 1, 1,
0.5747555, 0.0831774, 0.6797664, 0, 0, 0, 1, 1,
0.5782421, 0.905992, -0.5516298, 0, 0, 0, 1, 1,
0.5832394, 0.2505053, 0.8219197, 0, 0, 0, 1, 1,
0.5850801, 0.08480678, 1.94433, 0, 0, 0, 1, 1,
0.5890699, -0.3556702, 3.521412, 1, 1, 1, 1, 1,
0.5927984, -3.36585, 1.453678, 1, 1, 1, 1, 1,
0.5929014, -2.456481, 2.183891, 1, 1, 1, 1, 1,
0.5945398, -0.9374264, 4.819371, 1, 1, 1, 1, 1,
0.5989484, -0.459678, 2.918902, 1, 1, 1, 1, 1,
0.6002448, 0.9732175, 0.448465, 1, 1, 1, 1, 1,
0.6014625, 2.511996, -0.2177777, 1, 1, 1, 1, 1,
0.6063488, 0.1936233, 2.236866, 1, 1, 1, 1, 1,
0.610071, 0.633493, 1.032306, 1, 1, 1, 1, 1,
0.6117054, -0.7800632, 1.991813, 1, 1, 1, 1, 1,
0.6123109, 0.1840982, 0.3358808, 1, 1, 1, 1, 1,
0.6135399, 0.700946, 2.368208, 1, 1, 1, 1, 1,
0.6197162, 0.7353398, -0.5337057, 1, 1, 1, 1, 1,
0.6235788, 0.4503555, 2.795871, 1, 1, 1, 1, 1,
0.6263145, 0.1774736, 1.713249, 1, 1, 1, 1, 1,
0.6264426, 1.251931, 2.125883, 0, 0, 1, 1, 1,
0.6273952, -0.6418696, 2.523946, 1, 0, 0, 1, 1,
0.6312719, -0.187693, 2.096226, 1, 0, 0, 1, 1,
0.6320894, 1.127366, 1.143191, 1, 0, 0, 1, 1,
0.6325855, -1.577728, 2.180146, 1, 0, 0, 1, 1,
0.6405909, 0.5756058, 1.327742, 1, 0, 0, 1, 1,
0.6428551, 0.220136, 0.6108961, 0, 0, 0, 1, 1,
0.643055, -0.7078014, 2.372801, 0, 0, 0, 1, 1,
0.6460845, 0.896901, 1.143046, 0, 0, 0, 1, 1,
0.6494557, -0.3493838, 2.282034, 0, 0, 0, 1, 1,
0.6503672, -0.8527036, 0.6771357, 0, 0, 0, 1, 1,
0.6563902, 1.379804, 0.7376204, 0, 0, 0, 1, 1,
0.6609728, 1.351433, 1.197034, 0, 0, 0, 1, 1,
0.6617063, 0.1705873, 1.700016, 1, 1, 1, 1, 1,
0.6643867, 0.5907367, 0.1532271, 1, 1, 1, 1, 1,
0.6657711, 0.8443357, -0.5440565, 1, 1, 1, 1, 1,
0.6672077, 0.8163833, 1.422148, 1, 1, 1, 1, 1,
0.6673203, 0.3681638, 0.9856477, 1, 1, 1, 1, 1,
0.668157, -1.265872, 3.987901, 1, 1, 1, 1, 1,
0.6685201, -1.962603, 3.109377, 1, 1, 1, 1, 1,
0.6715043, 0.1198473, 2.315901, 1, 1, 1, 1, 1,
0.6807815, 0.2684042, -0.6704776, 1, 1, 1, 1, 1,
0.6930252, 0.1266231, 1.766122, 1, 1, 1, 1, 1,
0.6947561, -1.256338, 3.40824, 1, 1, 1, 1, 1,
0.6958753, -0.387664, 2.780572, 1, 1, 1, 1, 1,
0.6967362, 0.350247, -0.4226424, 1, 1, 1, 1, 1,
0.6990923, 0.3634225, 0.4290617, 1, 1, 1, 1, 1,
0.6994403, 1.753165, 0.7566377, 1, 1, 1, 1, 1,
0.7000474, -0.8337232, 2.474465, 0, 0, 1, 1, 1,
0.7003489, -0.003068996, 0.4770727, 1, 0, 0, 1, 1,
0.7063322, -0.4413801, 3.719522, 1, 0, 0, 1, 1,
0.709817, 0.3442048, 1.283534, 1, 0, 0, 1, 1,
0.7124883, 0.06352117, 1.432803, 1, 0, 0, 1, 1,
0.7160075, -0.09576505, 3.454049, 1, 0, 0, 1, 1,
0.7169976, -0.4676051, 2.659208, 0, 0, 0, 1, 1,
0.7176924, 1.752149, 0.7839822, 0, 0, 0, 1, 1,
0.7178242, -0.9814105, 3.565438, 0, 0, 0, 1, 1,
0.7192407, -0.65996, 2.434411, 0, 0, 0, 1, 1,
0.7276815, 1.043919, 0.7733441, 0, 0, 0, 1, 1,
0.7282777, 1.41733, 1.232985, 0, 0, 0, 1, 1,
0.7295341, -0.7198551, 2.038403, 0, 0, 0, 1, 1,
0.7301721, 1.226526, 0.5271083, 1, 1, 1, 1, 1,
0.7318401, -1.346897, 3.120903, 1, 1, 1, 1, 1,
0.7325425, -1.413929, 3.85051, 1, 1, 1, 1, 1,
0.7358465, 0.3015548, 0.2532547, 1, 1, 1, 1, 1,
0.7376162, 0.147661, 1.861794, 1, 1, 1, 1, 1,
0.739362, -0.7728588, 3.323765, 1, 1, 1, 1, 1,
0.7421433, -0.5752882, 1.518423, 1, 1, 1, 1, 1,
0.7426321, -0.7058403, 2.828507, 1, 1, 1, 1, 1,
0.7443678, -0.04427146, 3.074435, 1, 1, 1, 1, 1,
0.7469896, 0.9520495, 0.4468951, 1, 1, 1, 1, 1,
0.7512367, 0.5639271, 1.621879, 1, 1, 1, 1, 1,
0.7561455, 0.1276675, 1.529981, 1, 1, 1, 1, 1,
0.7569699, 0.9718946, -0.5284743, 1, 1, 1, 1, 1,
0.7574021, -0.3249986, 2.915684, 1, 1, 1, 1, 1,
0.7627779, 0.28716, 1.837949, 1, 1, 1, 1, 1,
0.7631482, 0.6035893, 1.131815, 0, 0, 1, 1, 1,
0.7676066, 2.240915, -1.269724, 1, 0, 0, 1, 1,
0.7678978, -0.8097824, 3.00724, 1, 0, 0, 1, 1,
0.7702071, 0.06894553, 0.9866958, 1, 0, 0, 1, 1,
0.7749014, 2.185227, 2.266859, 1, 0, 0, 1, 1,
0.7767751, -1.313284, 2.858463, 1, 0, 0, 1, 1,
0.7798594, 0.2693876, 0.583917, 0, 0, 0, 1, 1,
0.7805205, 1.798578, -1.125166, 0, 0, 0, 1, 1,
0.7855849, -2.621726, 1.16879, 0, 0, 0, 1, 1,
0.7871004, -0.9878944, 2.32974, 0, 0, 0, 1, 1,
0.7874156, -1.681166, 1.89607, 0, 0, 0, 1, 1,
0.8117589, -0.07804044, 0.7791154, 0, 0, 0, 1, 1,
0.8177217, 0.2855393, 1.737617, 0, 0, 0, 1, 1,
0.8178958, -0.614867, 1.154408, 1, 1, 1, 1, 1,
0.8221851, -2.327843, 3.875633, 1, 1, 1, 1, 1,
0.8250514, 0.4597096, 1.189103, 1, 1, 1, 1, 1,
0.8268206, 0.4135203, 1.025528, 1, 1, 1, 1, 1,
0.8335587, 1.051575, -0.03203362, 1, 1, 1, 1, 1,
0.8339196, 0.1841998, 1.7711, 1, 1, 1, 1, 1,
0.8385463, 1.586855, 0.4748327, 1, 1, 1, 1, 1,
0.8444306, -0.2481856, 2.824707, 1, 1, 1, 1, 1,
0.8462831, 0.4297315, -0.3647483, 1, 1, 1, 1, 1,
0.8473735, 0.4512116, 1.634469, 1, 1, 1, 1, 1,
0.8542794, 0.5170661, 1.097803, 1, 1, 1, 1, 1,
0.8623865, -1.179196, 1.84568, 1, 1, 1, 1, 1,
0.8703982, -1.014509, 0.9526975, 1, 1, 1, 1, 1,
0.8769352, 0.7897471, 1.30985, 1, 1, 1, 1, 1,
0.8790745, 0.8266361, 0.1108616, 1, 1, 1, 1, 1,
0.8793257, 0.7248697, 0.243188, 0, 0, 1, 1, 1,
0.8806769, -1.011145, 2.415946, 1, 0, 0, 1, 1,
0.8829632, -0.8902269, 0.918211, 1, 0, 0, 1, 1,
0.8838291, -1.333763, 2.159618, 1, 0, 0, 1, 1,
0.8842906, -1.599053, 3.502973, 1, 0, 0, 1, 1,
0.8884993, 0.003126829, -0.01010939, 1, 0, 0, 1, 1,
0.8916853, 0.4049498, 0.9465297, 0, 0, 0, 1, 1,
0.893446, -0.178013, 1.095392, 0, 0, 0, 1, 1,
0.9036677, 0.7165444, 0.4628324, 0, 0, 0, 1, 1,
0.9054986, 0.8391672, 1.540261, 0, 0, 0, 1, 1,
0.9093454, -1.959912, 3.723833, 0, 0, 0, 1, 1,
0.9170824, 0.0477756, 0.8382663, 0, 0, 0, 1, 1,
0.920246, -1.645136, 2.671712, 0, 0, 0, 1, 1,
0.935095, -0.8930374, 1.599177, 1, 1, 1, 1, 1,
0.9375969, 0.5148314, 1.94264, 1, 1, 1, 1, 1,
0.938208, 0.1986062, 1.892282, 1, 1, 1, 1, 1,
0.9503811, -0.01689029, 3.414995, 1, 1, 1, 1, 1,
0.9507701, -1.592709, 2.335837, 1, 1, 1, 1, 1,
0.9560577, 0.648383, 1.66167, 1, 1, 1, 1, 1,
0.9567074, 0.1582098, 1.947884, 1, 1, 1, 1, 1,
0.9599107, -0.5445858, 4.836259, 1, 1, 1, 1, 1,
0.9694728, -0.751709, 4.112269, 1, 1, 1, 1, 1,
0.9732997, 1.527501, 0.9293275, 1, 1, 1, 1, 1,
0.9769759, 0.04611461, 1.519027, 1, 1, 1, 1, 1,
0.9775717, -0.07556704, 2.916235, 1, 1, 1, 1, 1,
0.9779004, -0.3088397, 1.137991, 1, 1, 1, 1, 1,
0.9820218, 0.9157738, 0.5116488, 1, 1, 1, 1, 1,
0.9834058, -1.184272, 2.324221, 1, 1, 1, 1, 1,
0.9861032, -1.53931, 3.313797, 0, 0, 1, 1, 1,
1.006723, -1.280261, 2.94275, 1, 0, 0, 1, 1,
1.007517, -2.501044, 2.312531, 1, 0, 0, 1, 1,
1.013772, -0.06184273, 2.086717, 1, 0, 0, 1, 1,
1.017628, 1.788609, -0.2794808, 1, 0, 0, 1, 1,
1.02539, 0.485955, -0.4651459, 1, 0, 0, 1, 1,
1.033991, 0.4039823, 1.549896, 0, 0, 0, 1, 1,
1.041024, -0.4064395, 3.027566, 0, 0, 0, 1, 1,
1.044632, 0.5439875, -0.4636787, 0, 0, 0, 1, 1,
1.047061, 0.9843204, 1.665861, 0, 0, 0, 1, 1,
1.051963, -0.714922, 2.844849, 0, 0, 0, 1, 1,
1.052151, 0.1307783, 2.612129, 0, 0, 0, 1, 1,
1.057492, -0.09024864, 0.2437491, 0, 0, 0, 1, 1,
1.058866, -0.2566569, 1.468752, 1, 1, 1, 1, 1,
1.059226, 1.698136, 1.340133, 1, 1, 1, 1, 1,
1.062516, -0.1764027, 1.742432, 1, 1, 1, 1, 1,
1.070565, 1.593318, 0.3856452, 1, 1, 1, 1, 1,
1.082547, 1.593779, 0.8627332, 1, 1, 1, 1, 1,
1.083172, 1.38039, 1.52685, 1, 1, 1, 1, 1,
1.083834, -0.4226789, 2.117876, 1, 1, 1, 1, 1,
1.087153, 0.4905678, 0.6758259, 1, 1, 1, 1, 1,
1.088578, -0.3913689, 1.248261, 1, 1, 1, 1, 1,
1.089337, -0.7820981, -0.7374758, 1, 1, 1, 1, 1,
1.090614, -0.4893648, 1.635132, 1, 1, 1, 1, 1,
1.091283, -2.001644, 2.660802, 1, 1, 1, 1, 1,
1.091711, -0.1810133, 3.388783, 1, 1, 1, 1, 1,
1.093043, 0.09463432, 2.979901, 1, 1, 1, 1, 1,
1.093184, 0.4541371, -0.4182251, 1, 1, 1, 1, 1,
1.114761, -0.113661, 0.836969, 0, 0, 1, 1, 1,
1.125131, 1.110004, -0.3290905, 1, 0, 0, 1, 1,
1.135538, -0.7736864, 1.643716, 1, 0, 0, 1, 1,
1.143857, 0.7746114, 0.7634363, 1, 0, 0, 1, 1,
1.144954, -0.02855965, 1.029592, 1, 0, 0, 1, 1,
1.149589, 1.002453, 2.661315, 1, 0, 0, 1, 1,
1.152, -0.854263, 0.9937522, 0, 0, 0, 1, 1,
1.162018, 0.8113862, 0.04448023, 0, 0, 0, 1, 1,
1.162976, -0.8552281, 3.33916, 0, 0, 0, 1, 1,
1.16355, -1.848813, 4.067474, 0, 0, 0, 1, 1,
1.170169, 0.3696625, 2.741208, 0, 0, 0, 1, 1,
1.178319, 1.641943, -0.1115449, 0, 0, 0, 1, 1,
1.186275, -1.232669, 2.365072, 0, 0, 0, 1, 1,
1.215611, -1.074831, 0.6470201, 1, 1, 1, 1, 1,
1.217474, 0.9784356, 0.5968282, 1, 1, 1, 1, 1,
1.222537, -0.59418, 2.874378, 1, 1, 1, 1, 1,
1.229957, -0.7844001, 0.5386948, 1, 1, 1, 1, 1,
1.230498, 0.04677451, 1.883914, 1, 1, 1, 1, 1,
1.234791, 0.2938592, 1.178778, 1, 1, 1, 1, 1,
1.236296, -0.8582965, 1.476105, 1, 1, 1, 1, 1,
1.237617, 0.2633584, 0.379907, 1, 1, 1, 1, 1,
1.238216, 0.2817162, 3.384708, 1, 1, 1, 1, 1,
1.252446, -0.5622871, 1.58045, 1, 1, 1, 1, 1,
1.267709, 0.7712635, 2.280202, 1, 1, 1, 1, 1,
1.269824, 1.130768, 2.545753, 1, 1, 1, 1, 1,
1.273193, -1.525307, 0.6519279, 1, 1, 1, 1, 1,
1.282562, 0.1812666, 1.518597, 1, 1, 1, 1, 1,
1.286753, -0.5345597, 2.44463, 1, 1, 1, 1, 1,
1.289045, -0.2871576, 3.538152, 0, 0, 1, 1, 1,
1.290299, -0.2649259, 2.178293, 1, 0, 0, 1, 1,
1.293387, 0.1822552, 2.970173, 1, 0, 0, 1, 1,
1.294769, 1.578719, -0.1009385, 1, 0, 0, 1, 1,
1.296153, 1.041258, -0.7577716, 1, 0, 0, 1, 1,
1.298372, 1.013317, 1.017113, 1, 0, 0, 1, 1,
1.301945, -0.605094, 0.8912511, 0, 0, 0, 1, 1,
1.303697, -0.8028941, 1.692328, 0, 0, 0, 1, 1,
1.305335, 0.2352097, 0.172545, 0, 0, 0, 1, 1,
1.305758, -0.8141574, 0.3665109, 0, 0, 0, 1, 1,
1.314759, 0.4835549, 2.094698, 0, 0, 0, 1, 1,
1.316698, -0.7729361, 3.383561, 0, 0, 0, 1, 1,
1.32047, 0.9854107, -0.1904508, 0, 0, 0, 1, 1,
1.330807, 0.1060114, -0.0006524979, 1, 1, 1, 1, 1,
1.331068, -1.00507, 1.926252, 1, 1, 1, 1, 1,
1.33784, -0.687677, 0.8257313, 1, 1, 1, 1, 1,
1.348451, 0.2850934, 1.14317, 1, 1, 1, 1, 1,
1.367342, 1.253902, -0.4269138, 1, 1, 1, 1, 1,
1.367881, 0.8622835, 3.195867, 1, 1, 1, 1, 1,
1.375506, -0.3173153, 0.5165651, 1, 1, 1, 1, 1,
1.378026, -0.08220431, -0.03315613, 1, 1, 1, 1, 1,
1.389443, -1.950506, 2.504021, 1, 1, 1, 1, 1,
1.39157, 1.593883, 2.235162, 1, 1, 1, 1, 1,
1.398961, 1.50302, 1.307247, 1, 1, 1, 1, 1,
1.402839, 0.09080903, 2.778161, 1, 1, 1, 1, 1,
1.405784, 0.1437911, -0.2182677, 1, 1, 1, 1, 1,
1.415567, 0.4507822, 2.376257, 1, 1, 1, 1, 1,
1.420863, 1.208988, 0.1822842, 1, 1, 1, 1, 1,
1.433763, 0.7039209, 0.6772681, 0, 0, 1, 1, 1,
1.441156, 1.444945, 0.02026321, 1, 0, 0, 1, 1,
1.451321, -0.09410778, 2.333182, 1, 0, 0, 1, 1,
1.46051, 1.161324, 0.5412649, 1, 0, 0, 1, 1,
1.472199, -0.6595135, 2.841966, 1, 0, 0, 1, 1,
1.475308, 0.8844355, 0.5298548, 1, 0, 0, 1, 1,
1.492192, -1.697403, 3.045385, 0, 0, 0, 1, 1,
1.500391, 0.6795266, 1.428698, 0, 0, 0, 1, 1,
1.513398, -0.6722068, 1.118459, 0, 0, 0, 1, 1,
1.524448, -1.514767, 2.847225, 0, 0, 0, 1, 1,
1.526652, -0.7201156, 2.354317, 0, 0, 0, 1, 1,
1.531121, -0.3556576, 2.780224, 0, 0, 0, 1, 1,
1.532509, -0.4007899, 3.508837, 0, 0, 0, 1, 1,
1.538486, -0.2543273, 1.926338, 1, 1, 1, 1, 1,
1.551028, -0.4826106, 1.49704, 1, 1, 1, 1, 1,
1.564585, 0.89433, 0.4487368, 1, 1, 1, 1, 1,
1.564892, -0.274012, 2.199571, 1, 1, 1, 1, 1,
1.565471, -0.3066029, 1.828298, 1, 1, 1, 1, 1,
1.565823, 1.019525, 2.395945, 1, 1, 1, 1, 1,
1.568212, 0.5848389, 1.606409, 1, 1, 1, 1, 1,
1.573616, -0.1968106, 1.921548, 1, 1, 1, 1, 1,
1.58093, -1.410022, 1.566919, 1, 1, 1, 1, 1,
1.582026, 0.3067572, 0.2241296, 1, 1, 1, 1, 1,
1.584949, 0.6372797, 0.2903096, 1, 1, 1, 1, 1,
1.590396, -1.056853, 1.501622, 1, 1, 1, 1, 1,
1.627333, -0.5381119, 1.532238, 1, 1, 1, 1, 1,
1.635072, -2.299045, 4.362672, 1, 1, 1, 1, 1,
1.660159, -0.7030897, 3.110865, 1, 1, 1, 1, 1,
1.66716, 0.749984, 2.089635, 0, 0, 1, 1, 1,
1.670959, 0.01142674, 0.5004949, 1, 0, 0, 1, 1,
1.677381, -1.271397, 2.049606, 1, 0, 0, 1, 1,
1.682964, -0.9569428, 2.921582, 1, 0, 0, 1, 1,
1.692755, 0.2202007, 2.779118, 1, 0, 0, 1, 1,
1.700715, 0.04574528, 0.6032417, 1, 0, 0, 1, 1,
1.702752, -0.4589228, 1.301287, 0, 0, 0, 1, 1,
1.702954, -0.5738119, 1.491644, 0, 0, 0, 1, 1,
1.738161, 0.6850642, 2.109911, 0, 0, 0, 1, 1,
1.758443, 0.9604391, 1.568416, 0, 0, 0, 1, 1,
1.771473, 2.17839, 2.773125, 0, 0, 0, 1, 1,
1.799341, -0.7896096, 0.4560456, 0, 0, 0, 1, 1,
1.813889, -1.89358, 2.701272, 0, 0, 0, 1, 1,
1.861795, -0.2148737, 3.496435, 1, 1, 1, 1, 1,
1.864668, 0.0004999289, 5.187117, 1, 1, 1, 1, 1,
1.87398, -1.254583, 2.733173, 1, 1, 1, 1, 1,
1.893643, -0.2508818, 2.342872, 1, 1, 1, 1, 1,
1.898769, -1.317363, 2.960006, 1, 1, 1, 1, 1,
1.899652, 0.241473, 2.662768, 1, 1, 1, 1, 1,
1.912813, 1.358365, 0.8214111, 1, 1, 1, 1, 1,
1.915053, 0.4423575, 1.908352, 1, 1, 1, 1, 1,
1.922445, 0.578226, 3.234621, 1, 1, 1, 1, 1,
1.938239, -0.5761838, 1.193715, 1, 1, 1, 1, 1,
1.990074, 2.085746, 0.5877585, 1, 1, 1, 1, 1,
1.990117, 2.861881, -0.4811821, 1, 1, 1, 1, 1,
1.991284, -0.5934986, 1.963791, 1, 1, 1, 1, 1,
2.00323, 0.7489002, 0.7349026, 1, 1, 1, 1, 1,
2.008949, 1.247512, 0.6634172, 1, 1, 1, 1, 1,
2.038279, 0.5080877, 2.420753, 0, 0, 1, 1, 1,
2.048479, 1.400758, 2.344406, 1, 0, 0, 1, 1,
2.108254, -0.8192583, 1.622186, 1, 0, 0, 1, 1,
2.114157, 0.5680485, 0.2712197, 1, 0, 0, 1, 1,
2.135359, -0.2619378, 0.9531116, 1, 0, 0, 1, 1,
2.162122, 1.818208, 0.2520106, 1, 0, 0, 1, 1,
2.240883, -2.909572, 0.3407161, 0, 0, 0, 1, 1,
2.375041, 2.027976, -0.3747892, 0, 0, 0, 1, 1,
2.458136, 1.636817, -0.4140486, 0, 0, 0, 1, 1,
2.464781, -0.1597784, 1.791947, 0, 0, 0, 1, 1,
2.561881, 0.03532632, 2.285607, 0, 0, 0, 1, 1,
2.624517, 0.9921255, 1.320063, 0, 0, 0, 1, 1,
2.68923, -1.066965, 3.229063, 0, 0, 0, 1, 1,
2.724951, -0.05664345, 2.606567, 1, 1, 1, 1, 1,
2.769605, 1.325952, -0.3767265, 1, 1, 1, 1, 1,
2.789956, -2.074642, 1.492648, 1, 1, 1, 1, 1,
2.938025, 0.06183416, 1.422319, 1, 1, 1, 1, 1,
3.048229, -0.09985836, 1.56906, 1, 1, 1, 1, 1,
3.640437, 0.7574341, 2.949863, 1, 1, 1, 1, 1,
3.669925, -0.002857913, 0.3748579, 1, 1, 1, 1, 1
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
var radius = 10.06579;
var distance = 35.35567;
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
mvMatrix.translate( -0.265219, 0.2713109, 0.5644269 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.35567);
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
