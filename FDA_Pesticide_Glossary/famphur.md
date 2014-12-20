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
-3.483624, -0.7234594, -2.497551, 1, 0, 0, 1,
-3.15686, -0.3516287, -0.06284451, 1, 0.007843138, 0, 1,
-2.908259, 1.123985, -2.903468, 1, 0.01176471, 0, 1,
-2.754469, 0.2383174, -1.575425, 1, 0.01960784, 0, 1,
-2.687532, 0.4657573, -0.005590585, 1, 0.02352941, 0, 1,
-2.652221, -0.8797694, -3.021002, 1, 0.03137255, 0, 1,
-2.557353, -2.472273, -1.66711, 1, 0.03529412, 0, 1,
-2.398941, 0.5998033, -1.576714, 1, 0.04313726, 0, 1,
-2.377606, -0.3703462, -1.64731, 1, 0.04705882, 0, 1,
-2.333673, -0.9072995, -0.7266206, 1, 0.05490196, 0, 1,
-2.169763, -0.8736235, -2.470412, 1, 0.05882353, 0, 1,
-2.166309, -0.2877015, -3.411991, 1, 0.06666667, 0, 1,
-2.136038, -0.5179517, -2.739695, 1, 0.07058824, 0, 1,
-2.113351, -0.0817714, -2.384072, 1, 0.07843138, 0, 1,
-2.108697, 1.426609, -2.093319, 1, 0.08235294, 0, 1,
-2.105033, 0.5602775, -1.329431, 1, 0.09019608, 0, 1,
-2.08188, -0.06135986, -4.544113, 1, 0.09411765, 0, 1,
-2.080507, 1.508449, -1.054037, 1, 0.1019608, 0, 1,
-2.078852, 1.458542, -1.087958, 1, 0.1098039, 0, 1,
-2.070414, -0.7976616, -0.2493944, 1, 0.1137255, 0, 1,
-2.068313, -1.505938, -2.577971, 1, 0.1215686, 0, 1,
-2.056237, -1.091512, -3.696158, 1, 0.1254902, 0, 1,
-2.055, 0.1916613, -1.463889, 1, 0.1333333, 0, 1,
-2.016641, 1.136652, -0.9107032, 1, 0.1372549, 0, 1,
-2.014611, -1.139885, -2.727947, 1, 0.145098, 0, 1,
-2.004948, -0.6362763, -1.790198, 1, 0.1490196, 0, 1,
-1.98375, -0.05175353, -0.5781303, 1, 0.1568628, 0, 1,
-1.955169, -0.762311, -1.940135, 1, 0.1607843, 0, 1,
-1.936522, 0.4052729, 1.075166, 1, 0.1686275, 0, 1,
-1.934337, -2.254717, -4.221636, 1, 0.172549, 0, 1,
-1.933724, 1.33249, -1.346318, 1, 0.1803922, 0, 1,
-1.92565, -1.775034, -1.422428, 1, 0.1843137, 0, 1,
-1.911002, -1.040814, -1.20618, 1, 0.1921569, 0, 1,
-1.905548, -1.876097, -2.549589, 1, 0.1960784, 0, 1,
-1.895273, 1.302041, -1.199823, 1, 0.2039216, 0, 1,
-1.852933, -0.6571956, -1.992345, 1, 0.2117647, 0, 1,
-1.841762, -0.07635178, -1.675053, 1, 0.2156863, 0, 1,
-1.836034, -0.5973421, -2.974909, 1, 0.2235294, 0, 1,
-1.81552, -0.8660867, -3.549128, 1, 0.227451, 0, 1,
-1.750368, 0.7167654, 0.7879746, 1, 0.2352941, 0, 1,
-1.749261, -1.644905, -3.393807, 1, 0.2392157, 0, 1,
-1.732167, -0.7694579, -2.419017, 1, 0.2470588, 0, 1,
-1.684133, 0.2614558, -1.803186, 1, 0.2509804, 0, 1,
-1.680004, -0.3081357, -1.693942, 1, 0.2588235, 0, 1,
-1.653355, -1.176441, -2.277062, 1, 0.2627451, 0, 1,
-1.65253, -1.911355, -2.464888, 1, 0.2705882, 0, 1,
-1.641566, 0.8623424, -0.9417765, 1, 0.2745098, 0, 1,
-1.625234, -0.6061962, -3.427475, 1, 0.282353, 0, 1,
-1.619063, -0.4797069, -3.064407, 1, 0.2862745, 0, 1,
-1.598207, -1.009094, -3.406476, 1, 0.2941177, 0, 1,
-1.596359, 0.04652939, -1.941942, 1, 0.3019608, 0, 1,
-1.587581, -0.1275856, -2.441995, 1, 0.3058824, 0, 1,
-1.580719, 0.7596912, -0.5011438, 1, 0.3137255, 0, 1,
-1.576663, -0.2545893, -2.157149, 1, 0.3176471, 0, 1,
-1.573397, 0.4749748, -1.18023, 1, 0.3254902, 0, 1,
-1.561986, -0.2952994, -2.830834, 1, 0.3294118, 0, 1,
-1.548189, -0.8525068, -2.653106, 1, 0.3372549, 0, 1,
-1.545925, -0.3870667, -0.9780104, 1, 0.3411765, 0, 1,
-1.543549, -1.32732, -1.531483, 1, 0.3490196, 0, 1,
-1.541823, -1.187831, -1.437231, 1, 0.3529412, 0, 1,
-1.540501, -0.8694431, -1.630843, 1, 0.3607843, 0, 1,
-1.538595, -0.05629816, -1.992741, 1, 0.3647059, 0, 1,
-1.537965, -0.2625211, -2.648299, 1, 0.372549, 0, 1,
-1.532436, 1.026758, -0.780472, 1, 0.3764706, 0, 1,
-1.531872, 1.144561, -1.826155, 1, 0.3843137, 0, 1,
-1.530513, -1.437738, -3.319763, 1, 0.3882353, 0, 1,
-1.520569, 1.275967, -0.5690512, 1, 0.3960784, 0, 1,
-1.517234, 0.05452303, 0.1391921, 1, 0.4039216, 0, 1,
-1.510625, 0.4915774, -1.948476, 1, 0.4078431, 0, 1,
-1.505091, 0.2390888, -1.920661, 1, 0.4156863, 0, 1,
-1.487305, 1.273322, -2.392206, 1, 0.4196078, 0, 1,
-1.482029, 0.8014216, -2.248061, 1, 0.427451, 0, 1,
-1.458792, 0.7476886, -0.9537902, 1, 0.4313726, 0, 1,
-1.455194, 2.381562, -2.497659, 1, 0.4392157, 0, 1,
-1.450103, -1.257253, -1.557062, 1, 0.4431373, 0, 1,
-1.417079, -0.4346891, -0.9872417, 1, 0.4509804, 0, 1,
-1.405626, -1.884784, -2.467485, 1, 0.454902, 0, 1,
-1.404231, -0.4739315, -1.561297, 1, 0.4627451, 0, 1,
-1.400452, -1.777796, -3.41573, 1, 0.4666667, 0, 1,
-1.395679, -0.9457342, -0.9872832, 1, 0.4745098, 0, 1,
-1.393741, 2.047711, 0.06437166, 1, 0.4784314, 0, 1,
-1.389932, 1.364602, -3.195442, 1, 0.4862745, 0, 1,
-1.384003, -0.5298228, -3.013181, 1, 0.4901961, 0, 1,
-1.364289, 2.146269, -0.9652954, 1, 0.4980392, 0, 1,
-1.344768, -0.1898951, -2.770036, 1, 0.5058824, 0, 1,
-1.341632, 0.2235764, 0.07668757, 1, 0.509804, 0, 1,
-1.335836, 0.5052209, -2.684063, 1, 0.5176471, 0, 1,
-1.334403, 1.333999, -1.136478, 1, 0.5215687, 0, 1,
-1.325881, 1.593681, -1.58548, 1, 0.5294118, 0, 1,
-1.325278, -2.259912, -2.286597, 1, 0.5333334, 0, 1,
-1.299808, 1.204259, -1.701567, 1, 0.5411765, 0, 1,
-1.296385, -0.1432243, -2.039294, 1, 0.5450981, 0, 1,
-1.278781, 0.2782997, -0.9691219, 1, 0.5529412, 0, 1,
-1.275656, 0.1621494, -1.998542, 1, 0.5568628, 0, 1,
-1.257222, 0.6196539, -1.322628, 1, 0.5647059, 0, 1,
-1.249748, 0.04593818, -1.126598, 1, 0.5686275, 0, 1,
-1.23594, -0.4103722, -2.480113, 1, 0.5764706, 0, 1,
-1.22906, 0.5429643, -1.236958, 1, 0.5803922, 0, 1,
-1.226007, 0.431407, -1.562481, 1, 0.5882353, 0, 1,
-1.224547, -0.3314649, -1.703394, 1, 0.5921569, 0, 1,
-1.214775, 0.3780421, -1.106403, 1, 0.6, 0, 1,
-1.214447, -2.29049, -3.147413, 1, 0.6078432, 0, 1,
-1.208797, -0.2122155, -1.926759, 1, 0.6117647, 0, 1,
-1.204312, -0.5760719, -2.933953, 1, 0.6196079, 0, 1,
-1.194193, -0.3110094, -3.257408, 1, 0.6235294, 0, 1,
-1.190925, -1.286824, -2.565883, 1, 0.6313726, 0, 1,
-1.178878, 0.7038351, -0.9094926, 1, 0.6352941, 0, 1,
-1.158309, 0.2856863, -4.141004, 1, 0.6431373, 0, 1,
-1.155792, -3.329832, -1.510007, 1, 0.6470588, 0, 1,
-1.155739, -1.026875, -1.461335, 1, 0.654902, 0, 1,
-1.154098, -0.4364531, -3.033994, 1, 0.6588235, 0, 1,
-1.148498, 0.446828, -1.784497, 1, 0.6666667, 0, 1,
-1.14724, 1.794039, 0.8727369, 1, 0.6705883, 0, 1,
-1.146257, -1.007722, -3.420543, 1, 0.6784314, 0, 1,
-1.144987, -0.159682, -0.8236523, 1, 0.682353, 0, 1,
-1.140706, -0.6820066, -2.532331, 1, 0.6901961, 0, 1,
-1.124892, -0.9214043, -1.804845, 1, 0.6941177, 0, 1,
-1.122096, -1.050821, -2.918808, 1, 0.7019608, 0, 1,
-1.120226, 0.1278518, -0.2970872, 1, 0.7098039, 0, 1,
-1.118577, -1.10144, -3.429784, 1, 0.7137255, 0, 1,
-1.118271, -0.5279334, -2.467771, 1, 0.7215686, 0, 1,
-1.113105, -0.6064589, -1.454545, 1, 0.7254902, 0, 1,
-1.11117, 0.2014901, 0.7906306, 1, 0.7333333, 0, 1,
-1.111163, 2.925534, 0.9089034, 1, 0.7372549, 0, 1,
-1.108746, -1.670923, -2.874331, 1, 0.7450981, 0, 1,
-1.107824, 0.3007641, -1.756374, 1, 0.7490196, 0, 1,
-1.096325, -0.4275741, -1.283782, 1, 0.7568628, 0, 1,
-1.094475, -1.649451, -4.493069, 1, 0.7607843, 0, 1,
-1.093885, -0.4844746, -1.467288, 1, 0.7686275, 0, 1,
-1.088316, -0.151678, -0.7310365, 1, 0.772549, 0, 1,
-1.084138, -1.472998, -2.989541, 1, 0.7803922, 0, 1,
-1.083878, -0.7707087, -3.000336, 1, 0.7843137, 0, 1,
-1.080566, -0.168272, -0.2752498, 1, 0.7921569, 0, 1,
-1.077476, 0.3365597, 0.582148, 1, 0.7960784, 0, 1,
-1.076691, -0.8487098, -3.936761, 1, 0.8039216, 0, 1,
-1.072466, 0.9541057, -1.877641, 1, 0.8117647, 0, 1,
-1.071438, 0.124007, -0.6566253, 1, 0.8156863, 0, 1,
-1.062865, -0.432031, -0.5984623, 1, 0.8235294, 0, 1,
-1.062741, 0.2238699, -1.661757, 1, 0.827451, 0, 1,
-1.060418, -0.7642094, -1.477233, 1, 0.8352941, 0, 1,
-1.052219, 1.130961, -1.370345, 1, 0.8392157, 0, 1,
-1.050931, -0.4243519, -0.6476863, 1, 0.8470588, 0, 1,
-1.046159, 2.535635, -0.1195656, 1, 0.8509804, 0, 1,
-1.040536, -1.563681, -3.854786, 1, 0.8588235, 0, 1,
-1.038682, -1.666244, -1.21825, 1, 0.8627451, 0, 1,
-1.038379, 0.2372025, -1.365051, 1, 0.8705882, 0, 1,
-1.036017, 0.5013795, -1.2433, 1, 0.8745098, 0, 1,
-1.035004, -0.4714985, -1.693518, 1, 0.8823529, 0, 1,
-1.033983, -1.113836, -2.104511, 1, 0.8862745, 0, 1,
-1.026477, -0.803789, -3.517204, 1, 0.8941177, 0, 1,
-1.026123, -0.7752171, -0.7163266, 1, 0.8980392, 0, 1,
-1.020715, -0.5833098, -3.130213, 1, 0.9058824, 0, 1,
-1.013963, -1.002976, -4.485599, 1, 0.9137255, 0, 1,
-1.013654, 1.065717, -0.09391438, 1, 0.9176471, 0, 1,
-1.009098, 1.819196, 0.06527986, 1, 0.9254902, 0, 1,
-1.005953, -1.379916, -2.10954, 1, 0.9294118, 0, 1,
-0.9994622, -1.806731, -2.56393, 1, 0.9372549, 0, 1,
-0.9973007, 1.042823, -1.478009, 1, 0.9411765, 0, 1,
-0.9930134, -1.108186, -1.463596, 1, 0.9490196, 0, 1,
-0.985979, -0.002520374, -1.94254, 1, 0.9529412, 0, 1,
-0.9819589, -0.1757037, -0.7760061, 1, 0.9607843, 0, 1,
-0.9804267, 0.5791513, -0.652248, 1, 0.9647059, 0, 1,
-0.9746808, -0.9502527, -4.264085, 1, 0.972549, 0, 1,
-0.971612, -1.404337, -1.550821, 1, 0.9764706, 0, 1,
-0.9626931, 0.06487136, -0.4809102, 1, 0.9843137, 0, 1,
-0.953879, -0.4008223, -3.054159, 1, 0.9882353, 0, 1,
-0.9529428, -1.776106, -2.915008, 1, 0.9960784, 0, 1,
-0.9521955, 0.9632411, -3.045115, 0.9960784, 1, 0, 1,
-0.9514416, 0.1012503, -0.6409467, 0.9921569, 1, 0, 1,
-0.9512224, 0.1305235, -1.103817, 0.9843137, 1, 0, 1,
-0.9395477, -1.326291, -3.550535, 0.9803922, 1, 0, 1,
-0.9337384, 1.361837, -0.3596919, 0.972549, 1, 0, 1,
-0.9309108, -0.270175, -1.633104, 0.9686275, 1, 0, 1,
-0.9292272, 1.027114, -0.2677673, 0.9607843, 1, 0, 1,
-0.92781, -1.064016, -2.526858, 0.9568627, 1, 0, 1,
-0.9235368, -0.9484876, -2.562536, 0.9490196, 1, 0, 1,
-0.9216722, 0.185201, -0.1972807, 0.945098, 1, 0, 1,
-0.9211997, -2.563327, -2.352647, 0.9372549, 1, 0, 1,
-0.9208328, -0.6726068, -2.850525, 0.9333333, 1, 0, 1,
-0.9122325, 0.9620344, 0.4665636, 0.9254902, 1, 0, 1,
-0.9083128, 0.3956597, -1.229079, 0.9215686, 1, 0, 1,
-0.90191, 1.337394, -0.7929164, 0.9137255, 1, 0, 1,
-0.8984554, 1.276524, 1.042876, 0.9098039, 1, 0, 1,
-0.8942817, 0.08740107, 0.9346654, 0.9019608, 1, 0, 1,
-0.8887578, -1.310775, 0.2670985, 0.8941177, 1, 0, 1,
-0.8854694, -0.7438678, -2.775194, 0.8901961, 1, 0, 1,
-0.8815466, -0.8952207, -1.431248, 0.8823529, 1, 0, 1,
-0.863875, -0.5575569, -2.520636, 0.8784314, 1, 0, 1,
-0.8622992, 0.2239221, -2.300564, 0.8705882, 1, 0, 1,
-0.8590499, 1.19437, -1.596589, 0.8666667, 1, 0, 1,
-0.8564236, 0.2962583, -1.343715, 0.8588235, 1, 0, 1,
-0.8562607, 1.594668, -0.4643026, 0.854902, 1, 0, 1,
-0.8551387, 0.006253734, -2.122257, 0.8470588, 1, 0, 1,
-0.8528223, 0.9112018, -0.7882065, 0.8431373, 1, 0, 1,
-0.851882, 0.1447001, -1.88189, 0.8352941, 1, 0, 1,
-0.8489355, 2.128373, 0.4909405, 0.8313726, 1, 0, 1,
-0.8456034, -0.6321413, -1.768744, 0.8235294, 1, 0, 1,
-0.8451635, 0.8813459, -1.018912, 0.8196079, 1, 0, 1,
-0.8424047, 2.316735, -1.180354, 0.8117647, 1, 0, 1,
-0.8326217, -0.6052774, -1.754993, 0.8078431, 1, 0, 1,
-0.8122414, -2.529972, -3.138499, 0.8, 1, 0, 1,
-0.805281, -0.2664541, -1.477945, 0.7921569, 1, 0, 1,
-0.7986189, -0.0912321, -2.835907, 0.7882353, 1, 0, 1,
-0.791507, 1.176162, -0.003528624, 0.7803922, 1, 0, 1,
-0.7846981, -1.005302, -2.19106, 0.7764706, 1, 0, 1,
-0.7786242, -0.07024302, -1.627311, 0.7686275, 1, 0, 1,
-0.7785947, -0.6727006, -2.625418, 0.7647059, 1, 0, 1,
-0.7589206, -0.1837334, -2.722618, 0.7568628, 1, 0, 1,
-0.7558469, 1.238634, -1.479724, 0.7529412, 1, 0, 1,
-0.7530499, -1.047198, -3.09447, 0.7450981, 1, 0, 1,
-0.7524376, -0.8422799, -2.313477, 0.7411765, 1, 0, 1,
-0.7486954, 0.5221218, -2.447914, 0.7333333, 1, 0, 1,
-0.7443723, -0.02024733, -0.05058432, 0.7294118, 1, 0, 1,
-0.7441725, 1.699573, -0.7583367, 0.7215686, 1, 0, 1,
-0.741667, -0.8621037, -1.746106, 0.7176471, 1, 0, 1,
-0.7411926, 0.06331026, -0.8516752, 0.7098039, 1, 0, 1,
-0.7406301, 1.788785, -0.7256847, 0.7058824, 1, 0, 1,
-0.7399673, 0.3883575, -0.4316256, 0.6980392, 1, 0, 1,
-0.7368104, 0.4364781, -2.317471, 0.6901961, 1, 0, 1,
-0.7367562, 1.592332, -1.180142, 0.6862745, 1, 0, 1,
-0.7350314, 0.6771885, -0.4003017, 0.6784314, 1, 0, 1,
-0.7335454, 0.2676325, -0.5956721, 0.6745098, 1, 0, 1,
-0.7292849, 1.219073, -1.012337, 0.6666667, 1, 0, 1,
-0.7235678, -0.4212617, -1.696612, 0.6627451, 1, 0, 1,
-0.7222666, -1.443651, -2.323515, 0.654902, 1, 0, 1,
-0.7157106, 1.135895, 0.08409449, 0.6509804, 1, 0, 1,
-0.710265, -0.3561493, -2.809125, 0.6431373, 1, 0, 1,
-0.710256, -0.7276756, -2.339564, 0.6392157, 1, 0, 1,
-0.7074283, 2.893452, 0.6529616, 0.6313726, 1, 0, 1,
-0.6948621, 1.925327, 0.9172746, 0.627451, 1, 0, 1,
-0.6889609, 0.7245708, -0.2934184, 0.6196079, 1, 0, 1,
-0.688268, 1.63641, -0.0740578, 0.6156863, 1, 0, 1,
-0.6841666, -0.7070808, -1.429311, 0.6078432, 1, 0, 1,
-0.6785951, -0.6549973, -3.773868, 0.6039216, 1, 0, 1,
-0.6783735, -0.06201224, -0.9764186, 0.5960785, 1, 0, 1,
-0.6764299, 1.28433, -0.7711688, 0.5882353, 1, 0, 1,
-0.6743016, -0.7056101, -2.113557, 0.5843138, 1, 0, 1,
-0.6715941, -1.442827, -1.930777, 0.5764706, 1, 0, 1,
-0.6656946, 1.053975, -2.292954, 0.572549, 1, 0, 1,
-0.6646522, 0.008140095, -2.431603, 0.5647059, 1, 0, 1,
-0.6611226, -2.21749, -4.160306, 0.5607843, 1, 0, 1,
-0.6608995, -0.442231, -0.6573871, 0.5529412, 1, 0, 1,
-0.6588653, 0.3473713, -1.992809, 0.5490196, 1, 0, 1,
-0.6580487, 0.4125434, -0.9342817, 0.5411765, 1, 0, 1,
-0.6500188, 1.710752, -2.16754, 0.5372549, 1, 0, 1,
-0.6497849, -1.194379, -4.221189, 0.5294118, 1, 0, 1,
-0.647006, -1.037849, -2.470024, 0.5254902, 1, 0, 1,
-0.6389069, 0.159386, -2.235181, 0.5176471, 1, 0, 1,
-0.6377895, 0.004550476, -0.9408147, 0.5137255, 1, 0, 1,
-0.6377823, 0.2207769, -1.675123, 0.5058824, 1, 0, 1,
-0.6344552, 1.009295, 0.8173414, 0.5019608, 1, 0, 1,
-0.6326184, -0.3055922, -3.611208, 0.4941176, 1, 0, 1,
-0.6259128, -0.6938916, -3.535339, 0.4862745, 1, 0, 1,
-0.6258743, -0.408633, -1.04627, 0.4823529, 1, 0, 1,
-0.6249835, -2.054808, -2.134962, 0.4745098, 1, 0, 1,
-0.6245664, 0.7298291, -0.7167563, 0.4705882, 1, 0, 1,
-0.6227854, -0.07944688, -1.932837, 0.4627451, 1, 0, 1,
-0.6173521, 0.260304, 0.353322, 0.4588235, 1, 0, 1,
-0.6172115, 0.07366405, -2.271945, 0.4509804, 1, 0, 1,
-0.6135434, 1.632201, 0.2110346, 0.4470588, 1, 0, 1,
-0.6134085, -0.9236128, -2.233331, 0.4392157, 1, 0, 1,
-0.6123366, 0.08716841, -0.7527732, 0.4352941, 1, 0, 1,
-0.6062107, -0.01520908, -1.419981, 0.427451, 1, 0, 1,
-0.6041676, 0.107522, -1.497751, 0.4235294, 1, 0, 1,
-0.6039007, 0.9544987, -0.5950455, 0.4156863, 1, 0, 1,
-0.6018708, -1.41469, -3.382055, 0.4117647, 1, 0, 1,
-0.6015664, 0.4160747, 1.045058, 0.4039216, 1, 0, 1,
-0.6007831, -0.4038596, -3.24984, 0.3960784, 1, 0, 1,
-0.6006898, -0.8608201, -5.425647, 0.3921569, 1, 0, 1,
-0.6006156, -0.7220458, -3.110468, 0.3843137, 1, 0, 1,
-0.6002229, -0.8430737, -2.60646, 0.3803922, 1, 0, 1,
-0.5989743, -0.7994344, -2.436122, 0.372549, 1, 0, 1,
-0.5974589, 1.704191, -2.03475, 0.3686275, 1, 0, 1,
-0.5963503, 0.3040083, -0.04747796, 0.3607843, 1, 0, 1,
-0.595157, 0.2606451, -2.440711, 0.3568628, 1, 0, 1,
-0.5951318, -0.8254622, -1.528211, 0.3490196, 1, 0, 1,
-0.5934048, 0.6483017, -2.319088, 0.345098, 1, 0, 1,
-0.5885885, -0.3179066, -0.5860354, 0.3372549, 1, 0, 1,
-0.5804356, -0.5187869, -2.587032, 0.3333333, 1, 0, 1,
-0.5763301, -0.8508027, -1.112844, 0.3254902, 1, 0, 1,
-0.5738433, 0.2126736, -2.170342, 0.3215686, 1, 0, 1,
-0.5715945, 0.1670635, -0.3150738, 0.3137255, 1, 0, 1,
-0.5701541, 1.268714, -1.665036, 0.3098039, 1, 0, 1,
-0.5696594, -1.189546, -1.45116, 0.3019608, 1, 0, 1,
-0.5694629, 0.2278488, -2.13787, 0.2941177, 1, 0, 1,
-0.5675507, -0.667064, -1.309431, 0.2901961, 1, 0, 1,
-0.5638594, -0.6208895, -3.084337, 0.282353, 1, 0, 1,
-0.5617436, 0.35613, -2.811179, 0.2784314, 1, 0, 1,
-0.5580975, -0.1158057, 1.356277, 0.2705882, 1, 0, 1,
-0.5554727, 0.3318355, 1.059262, 0.2666667, 1, 0, 1,
-0.5547733, -0.4395097, -1.355635, 0.2588235, 1, 0, 1,
-0.5534013, -0.7753994, -1.040347, 0.254902, 1, 0, 1,
-0.5530078, -0.8550628, -2.152548, 0.2470588, 1, 0, 1,
-0.5446764, 0.3032971, -2.006991, 0.2431373, 1, 0, 1,
-0.5438911, -0.1200041, -0.940663, 0.2352941, 1, 0, 1,
-0.543007, -0.6116171, -2.142174, 0.2313726, 1, 0, 1,
-0.5408475, -0.8571379, -2.989, 0.2235294, 1, 0, 1,
-0.5384002, -0.04788635, -1.057258, 0.2196078, 1, 0, 1,
-0.5353063, -0.293705, -0.6684229, 0.2117647, 1, 0, 1,
-0.5298333, 0.8000308, -0.1287278, 0.2078431, 1, 0, 1,
-0.5226223, 0.9930164, -0.646992, 0.2, 1, 0, 1,
-0.5210909, -0.576803, -2.706103, 0.1921569, 1, 0, 1,
-0.5207403, -1.579773, -3.92463, 0.1882353, 1, 0, 1,
-0.5197624, -0.3454485, -2.522761, 0.1803922, 1, 0, 1,
-0.5131251, -1.218891, -2.08493, 0.1764706, 1, 0, 1,
-0.512448, -0.367165, -1.930742, 0.1686275, 1, 0, 1,
-0.5121658, 0.3807098, 0.8820186, 0.1647059, 1, 0, 1,
-0.5112969, 0.9114001, 0.1699808, 0.1568628, 1, 0, 1,
-0.5079976, -1.655778, -3.860142, 0.1529412, 1, 0, 1,
-0.5041692, -0.537282, -2.413192, 0.145098, 1, 0, 1,
-0.5031651, 0.9672351, 0.6692045, 0.1411765, 1, 0, 1,
-0.5020677, 0.620853, -2.229044, 0.1333333, 1, 0, 1,
-0.4941627, -1.17435, -4.055908, 0.1294118, 1, 0, 1,
-0.4936782, -1.867671, -3.624778, 0.1215686, 1, 0, 1,
-0.4815412, 1.447899, -0.264333, 0.1176471, 1, 0, 1,
-0.480893, -0.7964311, -2.636887, 0.1098039, 1, 0, 1,
-0.4773036, 0.4566975, -0.1728425, 0.1058824, 1, 0, 1,
-0.4771537, 2.652804, 0.05629705, 0.09803922, 1, 0, 1,
-0.4767095, 0.1472466, -1.237761, 0.09019608, 1, 0, 1,
-0.4651667, -1.027614, -3.278422, 0.08627451, 1, 0, 1,
-0.4600342, -2.075462, -2.152324, 0.07843138, 1, 0, 1,
-0.4551981, -0.3449438, -2.949051, 0.07450981, 1, 0, 1,
-0.4512933, -1.681592, -3.08711, 0.06666667, 1, 0, 1,
-0.444333, -0.9664376, -3.239967, 0.0627451, 1, 0, 1,
-0.4411945, 0.2551116, -1.69558, 0.05490196, 1, 0, 1,
-0.4386877, -0.8593346, -1.652295, 0.05098039, 1, 0, 1,
-0.4323715, -0.8776858, -2.799098, 0.04313726, 1, 0, 1,
-0.4322457, 0.1158551, -1.464632, 0.03921569, 1, 0, 1,
-0.4272744, -0.2463815, -3.346471, 0.03137255, 1, 0, 1,
-0.4236173, 0.8663858, -1.889132, 0.02745098, 1, 0, 1,
-0.4233388, -1.655914, -2.893989, 0.01960784, 1, 0, 1,
-0.4187874, -0.4905235, -2.656422, 0.01568628, 1, 0, 1,
-0.4178153, -1.142883, -2.629377, 0.007843138, 1, 0, 1,
-0.4174408, 1.083486, -1.077775, 0.003921569, 1, 0, 1,
-0.4146938, -0.7571111, -2.352637, 0, 1, 0.003921569, 1,
-0.4081882, 0.723455, -0.7295346, 0, 1, 0.01176471, 1,
-0.4070973, -0.1315878, -0.9738483, 0, 1, 0.01568628, 1,
-0.4070649, -1.453898, -3.624265, 0, 1, 0.02352941, 1,
-0.4001367, -1.126948, -3.869654, 0, 1, 0.02745098, 1,
-0.3991327, -0.8499734, -2.629326, 0, 1, 0.03529412, 1,
-0.3982612, 0.1836896, -0.8822585, 0, 1, 0.03921569, 1,
-0.3960035, -0.6362327, -3.110924, 0, 1, 0.04705882, 1,
-0.3938811, 1.315498, -0.2248659, 0, 1, 0.05098039, 1,
-0.3880782, -0.6439548, -2.069264, 0, 1, 0.05882353, 1,
-0.386847, 1.055064, -1.446424, 0, 1, 0.0627451, 1,
-0.3850368, 0.009533261, -2.291638, 0, 1, 0.07058824, 1,
-0.3848229, -0.3541447, -2.719995, 0, 1, 0.07450981, 1,
-0.3813537, 0.1589779, -1.195043, 0, 1, 0.08235294, 1,
-0.3773975, -1.58884, -3.812772, 0, 1, 0.08627451, 1,
-0.3771763, 0.5612735, -0.9525158, 0, 1, 0.09411765, 1,
-0.3760846, -1.012626, -1.654924, 0, 1, 0.1019608, 1,
-0.3733045, -2.069232, -2.242362, 0, 1, 0.1058824, 1,
-0.3645874, 0.2985977, -1.559093, 0, 1, 0.1137255, 1,
-0.3633443, -0.1242217, -1.886663, 0, 1, 0.1176471, 1,
-0.3621173, 0.2746588, 0.2574705, 0, 1, 0.1254902, 1,
-0.3574939, 2.555323, 0.1862992, 0, 1, 0.1294118, 1,
-0.3531365, -1.756948, -3.498339, 0, 1, 0.1372549, 1,
-0.3526228, -0.8256629, -2.76649, 0, 1, 0.1411765, 1,
-0.3481291, 0.5228066, -0.1973342, 0, 1, 0.1490196, 1,
-0.3471507, 0.1309845, -0.4582268, 0, 1, 0.1529412, 1,
-0.3306756, -0.6510679, -3.334045, 0, 1, 0.1607843, 1,
-0.3303991, 0.1689671, -1.06823, 0, 1, 0.1647059, 1,
-0.3281378, 0.277067, -1.708288, 0, 1, 0.172549, 1,
-0.3255796, -0.3906595, -3.54001, 0, 1, 0.1764706, 1,
-0.3253639, 0.1017654, -1.9457, 0, 1, 0.1843137, 1,
-0.3247369, 0.6183737, -0.4592902, 0, 1, 0.1882353, 1,
-0.3242382, 1.263376, -0.802885, 0, 1, 0.1960784, 1,
-0.3240205, -0.5974121, -3.620817, 0, 1, 0.2039216, 1,
-0.3201196, -0.7858673, -3.384803, 0, 1, 0.2078431, 1,
-0.3194459, 0.5382621, 0.5336803, 0, 1, 0.2156863, 1,
-0.3169604, -0.4145264, -2.628453, 0, 1, 0.2196078, 1,
-0.3122234, 0.609165, 0.7069031, 0, 1, 0.227451, 1,
-0.311704, -1.560109, -1.735335, 0, 1, 0.2313726, 1,
-0.3104986, -0.5233043, -2.745179, 0, 1, 0.2392157, 1,
-0.3083704, 0.8136086, -1.342585, 0, 1, 0.2431373, 1,
-0.3019122, 0.5217775, -0.5822175, 0, 1, 0.2509804, 1,
-0.300446, 1.44403, 0.0855739, 0, 1, 0.254902, 1,
-0.2997108, -2.509393, -3.095471, 0, 1, 0.2627451, 1,
-0.2983556, 0.01572391, -2.344226, 0, 1, 0.2666667, 1,
-0.2930093, 0.1871679, -0.9965199, 0, 1, 0.2745098, 1,
-0.292713, -0.409065, -3.321695, 0, 1, 0.2784314, 1,
-0.283554, -2.101269, -3.372227, 0, 1, 0.2862745, 1,
-0.2826799, -0.1045704, -1.299501, 0, 1, 0.2901961, 1,
-0.2821154, 0.1799518, -0.6956732, 0, 1, 0.2980392, 1,
-0.277189, -0.8879353, -3.621582, 0, 1, 0.3058824, 1,
-0.2678192, 0.05824447, -0.3538894, 0, 1, 0.3098039, 1,
-0.2593207, 0.4953401, 0.4034662, 0, 1, 0.3176471, 1,
-0.2549799, 1.231256, -0.695141, 0, 1, 0.3215686, 1,
-0.2507383, 0.3152207, -1.074152, 0, 1, 0.3294118, 1,
-0.2438318, -0.2678057, -1.267177, 0, 1, 0.3333333, 1,
-0.2425645, 0.001521073, -1.786688, 0, 1, 0.3411765, 1,
-0.2409811, -1.16999, -3.792452, 0, 1, 0.345098, 1,
-0.2408874, -0.4138092, -1.495478, 0, 1, 0.3529412, 1,
-0.2401066, -0.4246631, -4.029197, 0, 1, 0.3568628, 1,
-0.2387405, -0.2752385, -3.581283, 0, 1, 0.3647059, 1,
-0.2346989, 0.6009439, -1.216537, 0, 1, 0.3686275, 1,
-0.233629, -1.396508, -3.484594, 0, 1, 0.3764706, 1,
-0.233515, 0.6059105, -1.332182, 0, 1, 0.3803922, 1,
-0.2331705, 0.3140171, -2.197347, 0, 1, 0.3882353, 1,
-0.2331628, -1.439413, -2.13701, 0, 1, 0.3921569, 1,
-0.2261812, -0.3324675, -2.055369, 0, 1, 0.4, 1,
-0.2255265, -1.791496, -3.501296, 0, 1, 0.4078431, 1,
-0.2223673, -0.08809148, -2.448944, 0, 1, 0.4117647, 1,
-0.2222923, 1.68823, 0.09758151, 0, 1, 0.4196078, 1,
-0.2210226, 0.7261773, -0.2812805, 0, 1, 0.4235294, 1,
-0.2195177, -0.08803653, -0.2533911, 0, 1, 0.4313726, 1,
-0.2185192, -0.04113328, -1.57727, 0, 1, 0.4352941, 1,
-0.2180621, 0.5399212, -0.3763272, 0, 1, 0.4431373, 1,
-0.2106921, 0.4309027, -0.3475883, 0, 1, 0.4470588, 1,
-0.2079869, -0.4526791, -2.997205, 0, 1, 0.454902, 1,
-0.2041655, 0.8286032, 0.001734515, 0, 1, 0.4588235, 1,
-0.2031674, -0.3257127, -3.546198, 0, 1, 0.4666667, 1,
-0.2012575, -1.178053, -3.320308, 0, 1, 0.4705882, 1,
-0.1993278, 1.729604, 0.163463, 0, 1, 0.4784314, 1,
-0.1983456, -0.7256391, -2.263153, 0, 1, 0.4823529, 1,
-0.1981643, 0.3457646, -2.940992, 0, 1, 0.4901961, 1,
-0.1974476, -0.6539036, -2.223091, 0, 1, 0.4941176, 1,
-0.1968151, 0.3887042, -0.3284673, 0, 1, 0.5019608, 1,
-0.1964777, 0.07812733, 0.09218179, 0, 1, 0.509804, 1,
-0.1937447, 0.1630443, -0.3038737, 0, 1, 0.5137255, 1,
-0.188713, -1.187962, -3.726991, 0, 1, 0.5215687, 1,
-0.1860946, -2.494604, -2.268716, 0, 1, 0.5254902, 1,
-0.1853937, -0.3096272, -3.512394, 0, 1, 0.5333334, 1,
-0.1798812, 1.088542, -0.1417684, 0, 1, 0.5372549, 1,
-0.1790207, 0.3002779, -1.800297, 0, 1, 0.5450981, 1,
-0.1764862, -0.7895383, -2.239695, 0, 1, 0.5490196, 1,
-0.1740076, 0.9301358, 0.1185721, 0, 1, 0.5568628, 1,
-0.172463, 1.758333, -0.6172621, 0, 1, 0.5607843, 1,
-0.1673886, 0.6810848, 0.5515355, 0, 1, 0.5686275, 1,
-0.167129, 0.05565865, -0.7501216, 0, 1, 0.572549, 1,
-0.161757, 1.58393, 0.503599, 0, 1, 0.5803922, 1,
-0.1598482, 0.0670047, -1.085558, 0, 1, 0.5843138, 1,
-0.1591432, 1.516682, -1.780657, 0, 1, 0.5921569, 1,
-0.1566646, 0.8568442, 0.5490341, 0, 1, 0.5960785, 1,
-0.1556018, 2.076818, -0.4544934, 0, 1, 0.6039216, 1,
-0.152758, 1.268744, -1.12928, 0, 1, 0.6117647, 1,
-0.1474714, 0.3158008, 0.008291139, 0, 1, 0.6156863, 1,
-0.1447024, 1.410422, 1.54631, 0, 1, 0.6235294, 1,
-0.1413531, -0.9042783, -2.768264, 0, 1, 0.627451, 1,
-0.1382175, 1.362872, -0.6995018, 0, 1, 0.6352941, 1,
-0.1379281, 0.2837283, -2.037207, 0, 1, 0.6392157, 1,
-0.1348401, -1.089111, -1.684443, 0, 1, 0.6470588, 1,
-0.1315751, -0.2219385, -2.250847, 0, 1, 0.6509804, 1,
-0.126746, 0.5500779, -1.864732, 0, 1, 0.6588235, 1,
-0.1260177, -0.4257783, -1.681588, 0, 1, 0.6627451, 1,
-0.1244169, 0.2867503, -0.8537917, 0, 1, 0.6705883, 1,
-0.1241871, 0.5034424, -1.997614, 0, 1, 0.6745098, 1,
-0.1237012, -0.8377857, -0.524044, 0, 1, 0.682353, 1,
-0.1229563, -0.3026315, -0.3399284, 0, 1, 0.6862745, 1,
-0.1225018, 0.8578455, -1.105929, 0, 1, 0.6941177, 1,
-0.1205344, 0.1456503, 0.07269641, 0, 1, 0.7019608, 1,
-0.1191307, -1.009324, -2.575369, 0, 1, 0.7058824, 1,
-0.1128733, -0.470961, -2.842555, 0, 1, 0.7137255, 1,
-0.1110085, -0.6680582, -0.5172966, 0, 1, 0.7176471, 1,
-0.1106627, -0.7784648, -4.386264, 0, 1, 0.7254902, 1,
-0.1087507, -0.3290271, -1.4213, 0, 1, 0.7294118, 1,
-0.108023, 1.264361, -0.6872474, 0, 1, 0.7372549, 1,
-0.1028554, -0.7028872, -2.523748, 0, 1, 0.7411765, 1,
-0.1009071, 0.1445133, -0.7847792, 0, 1, 0.7490196, 1,
-0.0970885, 0.9067205, 0.1932949, 0, 1, 0.7529412, 1,
-0.09597787, 0.3586057, -1.801217, 0, 1, 0.7607843, 1,
-0.09581193, 2.101618, 0.9819391, 0, 1, 0.7647059, 1,
-0.09271206, -0.4343022, -3.702741, 0, 1, 0.772549, 1,
-0.09204313, -0.9289166, -2.61408, 0, 1, 0.7764706, 1,
-0.09020803, -0.04318225, -2.847112, 0, 1, 0.7843137, 1,
-0.088045, 0.2411034, -0.515507, 0, 1, 0.7882353, 1,
-0.08229277, 0.2634227, -0.8817906, 0, 1, 0.7960784, 1,
-0.07960726, -0.2730202, -2.894831, 0, 1, 0.8039216, 1,
-0.07926268, -1.951673, -2.778791, 0, 1, 0.8078431, 1,
-0.07628592, -1.030899, -1.96983, 0, 1, 0.8156863, 1,
-0.07564508, 2.510048, 0.5334148, 0, 1, 0.8196079, 1,
-0.07561535, -1.365829, -2.770812, 0, 1, 0.827451, 1,
-0.07479081, -0.6528204, -2.275471, 0, 1, 0.8313726, 1,
-0.07473988, -0.03667859, -3.147787, 0, 1, 0.8392157, 1,
-0.07114645, 1.5692, -1.852855, 0, 1, 0.8431373, 1,
-0.06585998, 0.5338808, 1.516434, 0, 1, 0.8509804, 1,
-0.06427175, -1.247223, -2.487577, 0, 1, 0.854902, 1,
-0.0628152, -0.2667321, -3.034196, 0, 1, 0.8627451, 1,
-0.06160418, 0.5182545, 0.7860405, 0, 1, 0.8666667, 1,
-0.06106876, 0.05291369, -0.6610967, 0, 1, 0.8745098, 1,
-0.06059578, 0.5728132, 0.1442584, 0, 1, 0.8784314, 1,
-0.04672723, -0.1332244, -1.643272, 0, 1, 0.8862745, 1,
-0.04514958, 1.441409, 1.301772, 0, 1, 0.8901961, 1,
-0.04326655, 1.045932, 0.9596073, 0, 1, 0.8980392, 1,
-0.04238713, -1.025313, -4.206044, 0, 1, 0.9058824, 1,
-0.04037135, -0.08971618, -3.590139, 0, 1, 0.9098039, 1,
-0.03415947, -0.06591075, -1.343843, 0, 1, 0.9176471, 1,
-0.01333515, -0.7015777, -2.233426, 0, 1, 0.9215686, 1,
-0.009936824, 2.101802, 0.1327191, 0, 1, 0.9294118, 1,
-0.008800286, -0.2803736, -3.010043, 0, 1, 0.9333333, 1,
-0.005622149, 1.705543, -0.7585987, 0, 1, 0.9411765, 1,
-0.00159404, 0.1234857, -1.447832, 0, 1, 0.945098, 1,
-0.001239402, -0.7464907, -4.32312, 0, 1, 0.9529412, 1,
0.0008116749, 2.203761, 0.06521004, 0, 1, 0.9568627, 1,
0.0009101532, -0.1911369, 3.693665, 0, 1, 0.9647059, 1,
0.01017389, -0.3527906, 2.847656, 0, 1, 0.9686275, 1,
0.01404694, 1.211337, 0.7277424, 0, 1, 0.9764706, 1,
0.01889366, 0.961703, -0.3673564, 0, 1, 0.9803922, 1,
0.02465353, -0.2768431, 2.329448, 0, 1, 0.9882353, 1,
0.02632157, 2.255403, 2.624518, 0, 1, 0.9921569, 1,
0.02698885, 0.8206222, 1.39317, 0, 1, 1, 1,
0.02702283, -0.7738807, 2.683815, 0, 0.9921569, 1, 1,
0.03618593, 0.7616806, -0.05185954, 0, 0.9882353, 1, 1,
0.04567109, 1.362423, -1.698924, 0, 0.9803922, 1, 1,
0.0486553, -0.2753913, 1.348554, 0, 0.9764706, 1, 1,
0.05129057, 2.008109, 0.5979637, 0, 0.9686275, 1, 1,
0.05218453, -1.042333, 1.133482, 0, 0.9647059, 1, 1,
0.05220648, 0.9072118, -0.2353629, 0, 0.9568627, 1, 1,
0.05327164, -0.8704206, 3.03046, 0, 0.9529412, 1, 1,
0.05456616, 0.2947982, 0.5432834, 0, 0.945098, 1, 1,
0.05601063, 0.2952003, 0.02114896, 0, 0.9411765, 1, 1,
0.05765558, -1.525359, 4.03096, 0, 0.9333333, 1, 1,
0.05929375, -0.8733633, 4.017261, 0, 0.9294118, 1, 1,
0.05974114, -0.006744193, 0.5109979, 0, 0.9215686, 1, 1,
0.06349979, 0.1396417, -0.1620057, 0, 0.9176471, 1, 1,
0.06524583, -0.1165928, 3.320255, 0, 0.9098039, 1, 1,
0.06857929, 1.213646, -0.1832858, 0, 0.9058824, 1, 1,
0.06905792, 1.974891, -0.001628375, 0, 0.8980392, 1, 1,
0.06925692, 0.9527281, -1.367925, 0, 0.8901961, 1, 1,
0.07502332, 0.1949166, -0.3391218, 0, 0.8862745, 1, 1,
0.07640647, 0.7571028, -1.215719, 0, 0.8784314, 1, 1,
0.07666511, 1.147419, 0.3398314, 0, 0.8745098, 1, 1,
0.07799235, -1.063247, 4.211963, 0, 0.8666667, 1, 1,
0.07868504, 1.279954, 1.191914, 0, 0.8627451, 1, 1,
0.08067141, 0.5771359, 0.6266273, 0, 0.854902, 1, 1,
0.08255574, 0.1897227, 0.5699378, 0, 0.8509804, 1, 1,
0.09072376, 0.725183, 0.5496953, 0, 0.8431373, 1, 1,
0.09135053, -0.334454, 2.467191, 0, 0.8392157, 1, 1,
0.09242291, 0.1452197, 1.322391, 0, 0.8313726, 1, 1,
0.09325267, 0.5126724, 1.438426, 0, 0.827451, 1, 1,
0.0952131, 0.2529657, 0.1775373, 0, 0.8196079, 1, 1,
0.0959169, -0.4703817, 5.094558, 0, 0.8156863, 1, 1,
0.09999745, 1.135395, -0.3368765, 0, 0.8078431, 1, 1,
0.1003359, -0.5548296, 3.860828, 0, 0.8039216, 1, 1,
0.1019269, -0.04182496, 0.561051, 0, 0.7960784, 1, 1,
0.1036988, -0.6212743, 2.247739, 0, 0.7882353, 1, 1,
0.1048763, 1.352782, 1.420926, 0, 0.7843137, 1, 1,
0.1054437, -1.526237, 3.200588, 0, 0.7764706, 1, 1,
0.109382, -0.4911976, 2.68069, 0, 0.772549, 1, 1,
0.1141766, 0.8783624, 0.4703411, 0, 0.7647059, 1, 1,
0.1145791, -0.3772097, 3.487238, 0, 0.7607843, 1, 1,
0.1182349, -0.4114352, 1.991303, 0, 0.7529412, 1, 1,
0.1187883, 1.151373, 0.357896, 0, 0.7490196, 1, 1,
0.1192494, -1.313797, 1.058438, 0, 0.7411765, 1, 1,
0.1209029, 1.570407, -0.04087323, 0, 0.7372549, 1, 1,
0.1242687, 0.1796779, -0.9409288, 0, 0.7294118, 1, 1,
0.1251462, 1.49935, 1.258763, 0, 0.7254902, 1, 1,
0.1258621, 0.1511649, 1.113095, 0, 0.7176471, 1, 1,
0.1266026, 0.4497903, 0.328607, 0, 0.7137255, 1, 1,
0.1274144, 0.06318045, 0.7078988, 0, 0.7058824, 1, 1,
0.1276912, 0.7415857, 1.173933, 0, 0.6980392, 1, 1,
0.1287889, 1.427711, 1.943304, 0, 0.6941177, 1, 1,
0.1289547, -1.14356, 3.645313, 0, 0.6862745, 1, 1,
0.1324775, -0.2305116, 2.411938, 0, 0.682353, 1, 1,
0.1348473, -0.7202039, 3.801452, 0, 0.6745098, 1, 1,
0.1360415, -0.2607713, 2.278196, 0, 0.6705883, 1, 1,
0.1367995, 0.1312778, -1.130859, 0, 0.6627451, 1, 1,
0.1370526, 0.3872543, -1.354455, 0, 0.6588235, 1, 1,
0.1374974, -0.1841206, 3.452704, 0, 0.6509804, 1, 1,
0.1378995, 0.9146336, -0.1591334, 0, 0.6470588, 1, 1,
0.1496536, -0.372541, 1.856513, 0, 0.6392157, 1, 1,
0.1497874, 3.096021, 0.3851491, 0, 0.6352941, 1, 1,
0.1558027, -0.7293345, 1.68608, 0, 0.627451, 1, 1,
0.1583678, 0.7293219, -0.2177091, 0, 0.6235294, 1, 1,
0.1618486, -0.8253315, 3.854453, 0, 0.6156863, 1, 1,
0.1633396, -0.4646662, 1.933934, 0, 0.6117647, 1, 1,
0.1663942, -0.8513302, 2.999807, 0, 0.6039216, 1, 1,
0.1667715, -0.008168648, 1.22218, 0, 0.5960785, 1, 1,
0.1697772, 2.183793, 0.4381484, 0, 0.5921569, 1, 1,
0.1741701, -0.05803752, 3.004525, 0, 0.5843138, 1, 1,
0.1751248, -1.684481, 1.569365, 0, 0.5803922, 1, 1,
0.1760388, 1.214636, -0.7739584, 0, 0.572549, 1, 1,
0.1809745, 0.01871674, 2.569434, 0, 0.5686275, 1, 1,
0.1844467, -0.862781, 3.627792, 0, 0.5607843, 1, 1,
0.1868774, -0.09077304, 1.108718, 0, 0.5568628, 1, 1,
0.1891988, 0.2442831, 0.09378201, 0, 0.5490196, 1, 1,
0.1892899, 0.901783, 0.4140924, 0, 0.5450981, 1, 1,
0.1905285, 0.6018566, -0.999616, 0, 0.5372549, 1, 1,
0.1929756, 0.1330817, 0.2239096, 0, 0.5333334, 1, 1,
0.1957164, 0.1578088, 3.534819, 0, 0.5254902, 1, 1,
0.1972104, 0.7314205, -0.5395678, 0, 0.5215687, 1, 1,
0.2050359, -0.7003751, 3.864326, 0, 0.5137255, 1, 1,
0.2249961, -0.494404, 3.353064, 0, 0.509804, 1, 1,
0.2282085, 2.023739, -0.9768951, 0, 0.5019608, 1, 1,
0.2306525, -1.753885, 2.134089, 0, 0.4941176, 1, 1,
0.2400322, -1.896889, 2.211516, 0, 0.4901961, 1, 1,
0.2415891, -1.891758, 3.036503, 0, 0.4823529, 1, 1,
0.242376, 0.328406, 1.045241, 0, 0.4784314, 1, 1,
0.2443756, 0.3695956, -0.787463, 0, 0.4705882, 1, 1,
0.2471471, -0.399499, 4.277448, 0, 0.4666667, 1, 1,
0.2476658, -0.8338459, 3.066708, 0, 0.4588235, 1, 1,
0.2483667, 1.61334, -0.1302856, 0, 0.454902, 1, 1,
0.2506503, 0.2858547, 0.01190649, 0, 0.4470588, 1, 1,
0.2600853, 0.9874688, -0.190529, 0, 0.4431373, 1, 1,
0.2693383, -0.3516764, 1.741001, 0, 0.4352941, 1, 1,
0.2711885, -1.408895, 3.002179, 0, 0.4313726, 1, 1,
0.2741162, 0.7090328, 1.061166, 0, 0.4235294, 1, 1,
0.2758351, -0.03998606, 3.081685, 0, 0.4196078, 1, 1,
0.2758843, 0.8543261, 0.1930508, 0, 0.4117647, 1, 1,
0.2795571, -0.5775938, 3.497939, 0, 0.4078431, 1, 1,
0.2801374, 1.479551, 1.036204, 0, 0.4, 1, 1,
0.2833102, 0.5820909, -1.477203, 0, 0.3921569, 1, 1,
0.2883576, 1.604669, 1.861451, 0, 0.3882353, 1, 1,
0.2891019, 1.007672, -0.2673325, 0, 0.3803922, 1, 1,
0.2945962, -1.674335, 3.75637, 0, 0.3764706, 1, 1,
0.3011408, 0.4204557, 1.036916, 0, 0.3686275, 1, 1,
0.3063983, -0.9270068, 3.310342, 0, 0.3647059, 1, 1,
0.3122337, -0.2420764, 3.266179, 0, 0.3568628, 1, 1,
0.3136775, 0.2554616, -0.1513476, 0, 0.3529412, 1, 1,
0.3209067, -1.077673, 3.288196, 0, 0.345098, 1, 1,
0.3234246, -1.177927, 3.70728, 0, 0.3411765, 1, 1,
0.3241832, 0.261676, 2.739265, 0, 0.3333333, 1, 1,
0.329985, 1.333953, 0.4525203, 0, 0.3294118, 1, 1,
0.3300126, -0.2023045, 3.541248, 0, 0.3215686, 1, 1,
0.3301962, 0.6812028, 1.221738, 0, 0.3176471, 1, 1,
0.330689, -0.3356495, 2.518543, 0, 0.3098039, 1, 1,
0.3326167, 0.1808241, 2.21749, 0, 0.3058824, 1, 1,
0.337443, -0.4866517, 1.559065, 0, 0.2980392, 1, 1,
0.3464728, 1.803228, 0.3444425, 0, 0.2901961, 1, 1,
0.3512227, 0.3939267, 0.7389355, 0, 0.2862745, 1, 1,
0.3512703, -0.4850678, 3.25305, 0, 0.2784314, 1, 1,
0.354665, 1.42997, -1.029716, 0, 0.2745098, 1, 1,
0.3597192, 0.7751897, 0.3881773, 0, 0.2666667, 1, 1,
0.3613141, -0.3595446, 1.184573, 0, 0.2627451, 1, 1,
0.3633859, 0.1968791, 3.270694, 0, 0.254902, 1, 1,
0.3660786, 0.1414528, 1.301056, 0, 0.2509804, 1, 1,
0.3746212, -0.9259074, 3.693568, 0, 0.2431373, 1, 1,
0.3814656, -0.3632737, 1.285927, 0, 0.2392157, 1, 1,
0.3834249, -0.2765104, 1.433708, 0, 0.2313726, 1, 1,
0.3834578, 0.3908327, 0.9370511, 0, 0.227451, 1, 1,
0.3854868, 0.2426187, 1.960754, 0, 0.2196078, 1, 1,
0.3869633, 0.1433346, 1.601818, 0, 0.2156863, 1, 1,
0.3888555, 0.0814238, 0.4264179, 0, 0.2078431, 1, 1,
0.3925095, -1.055487, 2.936698, 0, 0.2039216, 1, 1,
0.3951182, 0.1884125, 0.1744986, 0, 0.1960784, 1, 1,
0.3970333, 0.2675863, 0.2794087, 0, 0.1882353, 1, 1,
0.3993334, -0.6595813, 3.311514, 0, 0.1843137, 1, 1,
0.4053557, 0.5827107, -0.4924015, 0, 0.1764706, 1, 1,
0.4071014, -0.5455077, 0.1446156, 0, 0.172549, 1, 1,
0.407481, 1.32469, -1.09042, 0, 0.1647059, 1, 1,
0.4135233, -1.068876, 3.407332, 0, 0.1607843, 1, 1,
0.4135719, -0.2975805, 0.3568457, 0, 0.1529412, 1, 1,
0.4148349, 0.6080942, 0.09274236, 0, 0.1490196, 1, 1,
0.4150807, 0.662081, 1.212341, 0, 0.1411765, 1, 1,
0.420343, -0.7992197, 2.444169, 0, 0.1372549, 1, 1,
0.4212279, -0.1527377, 1.357657, 0, 0.1294118, 1, 1,
0.4218965, -0.1804067, 1.156194, 0, 0.1254902, 1, 1,
0.425011, -0.4408982, 1.960689, 0, 0.1176471, 1, 1,
0.4262179, 1.277635, 1.241415, 0, 0.1137255, 1, 1,
0.4281518, 1.892058, 0.2071322, 0, 0.1058824, 1, 1,
0.4282661, -2.946941, 2.198389, 0, 0.09803922, 1, 1,
0.4319586, 0.6971151, 0.3664365, 0, 0.09411765, 1, 1,
0.4320351, -0.2382246, 1.672505, 0, 0.08627451, 1, 1,
0.4343853, 0.9351157, 0.1124582, 0, 0.08235294, 1, 1,
0.4386223, 0.5920751, -0.5443245, 0, 0.07450981, 1, 1,
0.44011, -0.09479325, 2.499705, 0, 0.07058824, 1, 1,
0.4414025, -0.7056788, 2.293845, 0, 0.0627451, 1, 1,
0.4437944, 0.3173879, 1.76562, 0, 0.05882353, 1, 1,
0.4477667, -0.424204, 2.878256, 0, 0.05098039, 1, 1,
0.4486131, -0.5022334, 3.248341, 0, 0.04705882, 1, 1,
0.4528333, 0.4443325, 1.588624, 0, 0.03921569, 1, 1,
0.4581967, 1.698682, -1.252245, 0, 0.03529412, 1, 1,
0.4582717, 0.7179055, -0.1907386, 0, 0.02745098, 1, 1,
0.4598721, 0.006585849, 4.171779, 0, 0.02352941, 1, 1,
0.4656814, -0.961634, 2.675689, 0, 0.01568628, 1, 1,
0.4672472, 2.001719, 0.4598338, 0, 0.01176471, 1, 1,
0.4673647, -0.1340102, 2.609221, 0, 0.003921569, 1, 1,
0.475753, 0.2979375, 1.10012, 0.003921569, 0, 1, 1,
0.477478, 1.709326, 0.3391427, 0.007843138, 0, 1, 1,
0.4789609, -1.68011, 3.238324, 0.01568628, 0, 1, 1,
0.4791635, -1.988812, 3.335319, 0.01960784, 0, 1, 1,
0.4796014, -0.9377586, 2.307318, 0.02745098, 0, 1, 1,
0.4799499, 0.5765915, -0.2217128, 0.03137255, 0, 1, 1,
0.4836882, 1.814852, -0.7922192, 0.03921569, 0, 1, 1,
0.4887483, -0.4302405, 0.7742348, 0.04313726, 0, 1, 1,
0.4888621, -0.6712978, 2.550998, 0.05098039, 0, 1, 1,
0.489887, -0.8569252, 3.15414, 0.05490196, 0, 1, 1,
0.4901602, 0.3249996, 1.880497, 0.0627451, 0, 1, 1,
0.4951197, 0.6807623, 0.9070714, 0.06666667, 0, 1, 1,
0.4953463, 1.035815, -0.2037664, 0.07450981, 0, 1, 1,
0.4967217, -0.5965582, 3.383456, 0.07843138, 0, 1, 1,
0.4975949, 0.1879079, 0.6595494, 0.08627451, 0, 1, 1,
0.4994811, -0.8812216, 2.73841, 0.09019608, 0, 1, 1,
0.5054725, 0.919341, 0.7231936, 0.09803922, 0, 1, 1,
0.5062144, -0.3428823, 3.114416, 0.1058824, 0, 1, 1,
0.5075712, 0.2600333, 1.362907, 0.1098039, 0, 1, 1,
0.5126517, 1.694465, 0.3633295, 0.1176471, 0, 1, 1,
0.5143976, 1.001004, 1.128333, 0.1215686, 0, 1, 1,
0.517957, 0.8477685, -1.461504, 0.1294118, 0, 1, 1,
0.5184952, -0.05581944, 0.3202754, 0.1333333, 0, 1, 1,
0.5197619, -0.4020089, 3.68555, 0.1411765, 0, 1, 1,
0.5230469, 2.669509, 1.167066, 0.145098, 0, 1, 1,
0.5241607, 1.058252, 0.05477051, 0.1529412, 0, 1, 1,
0.525394, 1.99808, 1.721006, 0.1568628, 0, 1, 1,
0.5315501, -0.9461241, 3.821496, 0.1647059, 0, 1, 1,
0.5350487, 0.6182573, 0.0611417, 0.1686275, 0, 1, 1,
0.5396805, -0.2326243, 2.546475, 0.1764706, 0, 1, 1,
0.5398214, 0.9508418, -2.443833, 0.1803922, 0, 1, 1,
0.5407402, -0.491741, 2.831569, 0.1882353, 0, 1, 1,
0.5424821, 0.8177789, 1.819417, 0.1921569, 0, 1, 1,
0.5432952, -0.6002282, 1.653749, 0.2, 0, 1, 1,
0.5449914, 0.8342881, 1.537502, 0.2078431, 0, 1, 1,
0.5496174, -0.2369709, 2.458616, 0.2117647, 0, 1, 1,
0.5519896, -0.2903067, 1.003563, 0.2196078, 0, 1, 1,
0.5575331, 0.2967247, 0.1323899, 0.2235294, 0, 1, 1,
0.5581167, 0.584341, -1.684066, 0.2313726, 0, 1, 1,
0.5591394, -0.4820973, 2.065537, 0.2352941, 0, 1, 1,
0.5601584, 0.8333324, -1.446451, 0.2431373, 0, 1, 1,
0.5605938, -3.225144, 3.644916, 0.2470588, 0, 1, 1,
0.5607765, 0.4466073, 0.6557672, 0.254902, 0, 1, 1,
0.5613883, 0.2098575, 2.502277, 0.2588235, 0, 1, 1,
0.5662665, 0.8829312, 2.499451, 0.2666667, 0, 1, 1,
0.5680986, 0.02037041, 1.786727, 0.2705882, 0, 1, 1,
0.5692484, 0.5904921, -0.04183548, 0.2784314, 0, 1, 1,
0.5704207, -0.6160052, 2.00131, 0.282353, 0, 1, 1,
0.5754319, -0.04432385, 0.7244163, 0.2901961, 0, 1, 1,
0.5767593, -0.4509017, 2.399317, 0.2941177, 0, 1, 1,
0.584176, -0.86353, 3.153745, 0.3019608, 0, 1, 1,
0.5843166, 0.9903708, 0.5408611, 0.3098039, 0, 1, 1,
0.5851359, -0.6338972, 2.029783, 0.3137255, 0, 1, 1,
0.5881536, -2.342526, 2.647678, 0.3215686, 0, 1, 1,
0.5883229, 1.827215, 1.317979, 0.3254902, 0, 1, 1,
0.5895522, -1.472394, 2.075727, 0.3333333, 0, 1, 1,
0.5971946, 0.5056815, 2.047234, 0.3372549, 0, 1, 1,
0.5975061, 1.848946, 0.492842, 0.345098, 0, 1, 1,
0.6052384, -1.546807, 4.171433, 0.3490196, 0, 1, 1,
0.6070002, -1.808659, 3.116526, 0.3568628, 0, 1, 1,
0.6073406, -0.03941204, 0.753302, 0.3607843, 0, 1, 1,
0.6098639, -1.025953, 2.489137, 0.3686275, 0, 1, 1,
0.6158435, 0.4598865, 0.8199171, 0.372549, 0, 1, 1,
0.6173772, -0.346305, 2.73701, 0.3803922, 0, 1, 1,
0.6187235, 0.6639469, 1.641328, 0.3843137, 0, 1, 1,
0.6212639, 0.6239164, 0.9021904, 0.3921569, 0, 1, 1,
0.6218237, 0.7652447, 1.355406, 0.3960784, 0, 1, 1,
0.6218442, -0.6946572, 1.469803, 0.4039216, 0, 1, 1,
0.6223511, -0.2413783, 0.2318822, 0.4117647, 0, 1, 1,
0.6277644, -2.316775, 2.002371, 0.4156863, 0, 1, 1,
0.6285045, -0.1240711, 1.945741, 0.4235294, 0, 1, 1,
0.630159, -2.088045, 1.644606, 0.427451, 0, 1, 1,
0.6312059, 0.1811475, 0.893178, 0.4352941, 0, 1, 1,
0.6379068, -0.5017389, 0.8131082, 0.4392157, 0, 1, 1,
0.6414376, 1.850435, 0.5643519, 0.4470588, 0, 1, 1,
0.6504011, 0.1813239, 0.5968705, 0.4509804, 0, 1, 1,
0.6510264, 0.09699922, 2.164389, 0.4588235, 0, 1, 1,
0.6516894, 0.08527242, 2.722112, 0.4627451, 0, 1, 1,
0.6531101, 1.013594, 0.9060338, 0.4705882, 0, 1, 1,
0.6547738, -1.456501, 2.387439, 0.4745098, 0, 1, 1,
0.6554105, 1.420815, 2.552855, 0.4823529, 0, 1, 1,
0.6603279, -0.06660475, 1.190209, 0.4862745, 0, 1, 1,
0.6626188, 0.4811656, -0.2718832, 0.4941176, 0, 1, 1,
0.6673519, -3.011085, 1.34632, 0.5019608, 0, 1, 1,
0.6682625, 1.489539, 0.2501962, 0.5058824, 0, 1, 1,
0.6684623, -0.3926085, 0.1476947, 0.5137255, 0, 1, 1,
0.676237, 0.3251742, 1.478477, 0.5176471, 0, 1, 1,
0.6773474, 0.1195571, 2.429811, 0.5254902, 0, 1, 1,
0.6779673, 2.259514, 0.6368417, 0.5294118, 0, 1, 1,
0.6871343, 1.087406, -0.5715225, 0.5372549, 0, 1, 1,
0.6877666, -1.165461, 0.5264947, 0.5411765, 0, 1, 1,
0.687914, -1.518395, 2.499021, 0.5490196, 0, 1, 1,
0.6954395, 0.4902707, 1.625899, 0.5529412, 0, 1, 1,
0.6991697, 2.080595, 0.5532978, 0.5607843, 0, 1, 1,
0.7009324, -0.7108942, 0.4370178, 0.5647059, 0, 1, 1,
0.7047085, -0.4506978, 1.904995, 0.572549, 0, 1, 1,
0.7132258, -1.71379, 2.716122, 0.5764706, 0, 1, 1,
0.7134537, 0.2081888, 2.251861, 0.5843138, 0, 1, 1,
0.7157034, 0.1997669, 1.717788, 0.5882353, 0, 1, 1,
0.7167158, -0.4784422, 1.12716, 0.5960785, 0, 1, 1,
0.7213578, -1.074331, 2.774774, 0.6039216, 0, 1, 1,
0.7263363, -1.967235, 2.525414, 0.6078432, 0, 1, 1,
0.7315016, -0.4438164, 2.805035, 0.6156863, 0, 1, 1,
0.7331646, -0.1754709, 3.209457, 0.6196079, 0, 1, 1,
0.7364743, 0.4585278, 2.465129, 0.627451, 0, 1, 1,
0.7504683, -0.1452787, 3.339759, 0.6313726, 0, 1, 1,
0.7668444, 0.6857682, 0.6166587, 0.6392157, 0, 1, 1,
0.7684309, -1.053813, 2.876998, 0.6431373, 0, 1, 1,
0.7687662, 1.490755, -0.931165, 0.6509804, 0, 1, 1,
0.7705119, 0.250039, 0.7565027, 0.654902, 0, 1, 1,
0.7733641, 0.9097673, 0.3349779, 0.6627451, 0, 1, 1,
0.7751608, -0.2481984, 0.9178484, 0.6666667, 0, 1, 1,
0.776103, 0.8002873, 1.475201, 0.6745098, 0, 1, 1,
0.7781666, -0.5671166, -0.8427598, 0.6784314, 0, 1, 1,
0.7816597, 1.091537, 0.5816531, 0.6862745, 0, 1, 1,
0.7828709, 1.089499, -0.3708202, 0.6901961, 0, 1, 1,
0.7838714, 2.193906, 2.562429, 0.6980392, 0, 1, 1,
0.7851673, -0.6181442, 3.858012, 0.7058824, 0, 1, 1,
0.7852723, 0.3156229, 0.9340209, 0.7098039, 0, 1, 1,
0.7900131, -0.01081196, 1.889503, 0.7176471, 0, 1, 1,
0.7921588, -1.335427, 1.575153, 0.7215686, 0, 1, 1,
0.8054554, 0.172781, 2.748641, 0.7294118, 0, 1, 1,
0.8138347, -0.0200095, 0.8672938, 0.7333333, 0, 1, 1,
0.8173919, 0.7862011, 0.1837128, 0.7411765, 0, 1, 1,
0.8217171, 0.7809854, 1.434035, 0.7450981, 0, 1, 1,
0.8247854, 0.01048877, 1.874861, 0.7529412, 0, 1, 1,
0.8306185, 0.2787846, 2.437326, 0.7568628, 0, 1, 1,
0.8306262, 0.8653282, -0.6064703, 0.7647059, 0, 1, 1,
0.8327461, -1.764282, 3.758022, 0.7686275, 0, 1, 1,
0.8344038, 0.9056347, 0.4168273, 0.7764706, 0, 1, 1,
0.8357109, 1.040728, 0.7874822, 0.7803922, 0, 1, 1,
0.8523844, 0.1954229, 1.243011, 0.7882353, 0, 1, 1,
0.8532361, 0.6575105, 1.2938, 0.7921569, 0, 1, 1,
0.8536486, -1.715134, 2.989864, 0.8, 0, 1, 1,
0.8627853, -1.548431, 3.194441, 0.8078431, 0, 1, 1,
0.8649065, -0.3167478, 3.179617, 0.8117647, 0, 1, 1,
0.8736756, 0.02653567, 1.46334, 0.8196079, 0, 1, 1,
0.8760586, -0.2576675, 1.669221, 0.8235294, 0, 1, 1,
0.8785227, 0.7606137, -0.2136658, 0.8313726, 0, 1, 1,
0.8816371, 1.666859, 0.1217737, 0.8352941, 0, 1, 1,
0.8839759, -1.220153, 1.192393, 0.8431373, 0, 1, 1,
0.8851779, -0.1259062, 0.693553, 0.8470588, 0, 1, 1,
0.9122013, -0.4330894, 0.6598189, 0.854902, 0, 1, 1,
0.913985, -0.3918483, -0.2203932, 0.8588235, 0, 1, 1,
0.9183643, 1.10256, 2.73408, 0.8666667, 0, 1, 1,
0.9203781, -0.6821439, 0.4321432, 0.8705882, 0, 1, 1,
0.9279722, 0.3237406, 1.621717, 0.8784314, 0, 1, 1,
0.9305025, 0.3154408, -0.4008802, 0.8823529, 0, 1, 1,
0.9321096, 0.8506995, 1.16676, 0.8901961, 0, 1, 1,
0.9342443, 0.4688536, 0.7331821, 0.8941177, 0, 1, 1,
0.9374377, -0.1349931, 1.168758, 0.9019608, 0, 1, 1,
0.9381568, 0.0177382, 0.558561, 0.9098039, 0, 1, 1,
0.9457494, 1.056276, 1.33507, 0.9137255, 0, 1, 1,
0.9471704, -0.3404953, 1.345043, 0.9215686, 0, 1, 1,
0.9608979, -1.298159, 1.301298, 0.9254902, 0, 1, 1,
0.9632245, 0.4004582, 2.032161, 0.9333333, 0, 1, 1,
0.9639813, 0.2887414, -1.075605, 0.9372549, 0, 1, 1,
0.9692863, -0.1310932, 0.8938975, 0.945098, 0, 1, 1,
0.9719282, -0.2357026, 2.194659, 0.9490196, 0, 1, 1,
0.9729478, 1.312877, 0.78485, 0.9568627, 0, 1, 1,
0.9741986, 0.2589163, -0.5839369, 0.9607843, 0, 1, 1,
0.9757287, 0.8269088, 1.224714, 0.9686275, 0, 1, 1,
0.9837926, 0.862735, 1.502488, 0.972549, 0, 1, 1,
0.9884473, 1.046974, 0.6013806, 0.9803922, 0, 1, 1,
0.9934932, -0.2288108, 3.788416, 0.9843137, 0, 1, 1,
0.9958223, -1.27769, 0.9442701, 0.9921569, 0, 1, 1,
1.010202, -0.9413154, 3.298593, 0.9960784, 0, 1, 1,
1.013185, -0.9735008, 1.154411, 1, 0, 0.9960784, 1,
1.023911, 0.2362941, 0.1548748, 1, 0, 0.9882353, 1,
1.028289, -0.9527549, 2.066964, 1, 0, 0.9843137, 1,
1.028937, 0.3898031, 0.41428, 1, 0, 0.9764706, 1,
1.036586, 0.8104466, 0.6198925, 1, 0, 0.972549, 1,
1.038205, -1.062106, 2.664394, 1, 0, 0.9647059, 1,
1.040305, 2.107947, 1.948229, 1, 0, 0.9607843, 1,
1.042234, -1.519262, 0.7296454, 1, 0, 0.9529412, 1,
1.043264, -0.7372531, 1.6692, 1, 0, 0.9490196, 1,
1.047959, -1.790892, 3.400934, 1, 0, 0.9411765, 1,
1.057839, -0.2676886, 1.424907, 1, 0, 0.9372549, 1,
1.069865, 1.136019, 0.5965601, 1, 0, 0.9294118, 1,
1.072602, 0.8002399, 0.7433673, 1, 0, 0.9254902, 1,
1.074245, 0.8448241, 0.2061397, 1, 0, 0.9176471, 1,
1.0781, -0.4446194, 2.576823, 1, 0, 0.9137255, 1,
1.080119, 0.4031032, 1.24185, 1, 0, 0.9058824, 1,
1.082705, -1.267481, 3.258315, 1, 0, 0.9019608, 1,
1.083418, 1.000183, 2.233398, 1, 0, 0.8941177, 1,
1.086081, 0.856425, 1.42512, 1, 0, 0.8862745, 1,
1.086336, 1.003608, 0.8888218, 1, 0, 0.8823529, 1,
1.089237, 0.9789816, -0.1577108, 1, 0, 0.8745098, 1,
1.09138, -1.055561, 2.405929, 1, 0, 0.8705882, 1,
1.092175, -0.3734727, 1.447235, 1, 0, 0.8627451, 1,
1.096144, -0.7958404, 1.562112, 1, 0, 0.8588235, 1,
1.100872, -0.8784477, 2.000029, 1, 0, 0.8509804, 1,
1.105059, -0.7889474, 1.548657, 1, 0, 0.8470588, 1,
1.11893, 1.57123, 0.1193043, 1, 0, 0.8392157, 1,
1.126161, -1.287897, 2.074392, 1, 0, 0.8352941, 1,
1.127061, 0.4925989, 1.508137, 1, 0, 0.827451, 1,
1.128224, 1.113722, 0.1427344, 1, 0, 0.8235294, 1,
1.132156, -0.2525007, 2.970353, 1, 0, 0.8156863, 1,
1.144301, -0.4679183, 1.477299, 1, 0, 0.8117647, 1,
1.147665, -0.08821291, 1.435589, 1, 0, 0.8039216, 1,
1.147668, 0.4152388, 1.929534, 1, 0, 0.7960784, 1,
1.148362, 1.251413, 1.758157, 1, 0, 0.7921569, 1,
1.148672, 0.3140788, 0.2222441, 1, 0, 0.7843137, 1,
1.151205, -0.7123449, 2.703002, 1, 0, 0.7803922, 1,
1.164726, -0.6808411, 2.138118, 1, 0, 0.772549, 1,
1.164766, 0.147704, 0.8098761, 1, 0, 0.7686275, 1,
1.164882, 0.9523719, 1.55345, 1, 0, 0.7607843, 1,
1.167419, 0.4335896, 1.817109, 1, 0, 0.7568628, 1,
1.167873, 0.387895, 2.079814, 1, 0, 0.7490196, 1,
1.170176, -0.56736, 4.075738, 1, 0, 0.7450981, 1,
1.172642, 0.02012409, 2.016697, 1, 0, 0.7372549, 1,
1.181775, 1.144218, 1.642011, 1, 0, 0.7333333, 1,
1.18323, 0.5836337, 0.9228878, 1, 0, 0.7254902, 1,
1.19237, -0.6088005, 1.399027, 1, 0, 0.7215686, 1,
1.20824, 1.750636, 0.2048477, 1, 0, 0.7137255, 1,
1.219619, 0.4680748, 0.8004529, 1, 0, 0.7098039, 1,
1.222693, -2.107231, 2.560907, 1, 0, 0.7019608, 1,
1.239799, 2.418033, -0.2111228, 1, 0, 0.6941177, 1,
1.247589, -0.5619984, 3.038833, 1, 0, 0.6901961, 1,
1.249738, -0.01776783, 2.297276, 1, 0, 0.682353, 1,
1.25033, 0.1929044, 1.398083, 1, 0, 0.6784314, 1,
1.25192, -0.2432284, 0.7829556, 1, 0, 0.6705883, 1,
1.254342, 1.282175, 0.9110096, 1, 0, 0.6666667, 1,
1.256407, 0.3970184, 0.1227318, 1, 0, 0.6588235, 1,
1.25886, -0.6634145, 3.161953, 1, 0, 0.654902, 1,
1.274107, 1.367707, 0.1265818, 1, 0, 0.6470588, 1,
1.275453, -0.8878327, 2.806187, 1, 0, 0.6431373, 1,
1.277377, 1.245032, -0.9615874, 1, 0, 0.6352941, 1,
1.28251, -0.02980449, 1.708746, 1, 0, 0.6313726, 1,
1.288879, 0.5841956, -0.3783916, 1, 0, 0.6235294, 1,
1.292087, -0.78655, 2.075402, 1, 0, 0.6196079, 1,
1.29472, -0.0731965, 0.2297745, 1, 0, 0.6117647, 1,
1.303532, 1.760398, 1.19483, 1, 0, 0.6078432, 1,
1.305976, -0.07904556, 3.490048, 1, 0, 0.6, 1,
1.310271, -0.0299688, 2.108227, 1, 0, 0.5921569, 1,
1.311108, -0.7613053, 3.028502, 1, 0, 0.5882353, 1,
1.31292, -0.3990765, 3.068382, 1, 0, 0.5803922, 1,
1.335201, -0.2219959, -0.379273, 1, 0, 0.5764706, 1,
1.336832, -1.176397, 3.034062, 1, 0, 0.5686275, 1,
1.33741, 0.5397094, 1.062764, 1, 0, 0.5647059, 1,
1.339791, -0.3370514, 3.371475, 1, 0, 0.5568628, 1,
1.339874, -0.6397328, 0.5590408, 1, 0, 0.5529412, 1,
1.345709, 0.3645585, 1.633866, 1, 0, 0.5450981, 1,
1.351895, -1.145816, 0.3507226, 1, 0, 0.5411765, 1,
1.380957, 1.182219, -0.3785017, 1, 0, 0.5333334, 1,
1.386573, -0.1612416, 1.527966, 1, 0, 0.5294118, 1,
1.390016, -0.2019666, 2.576188, 1, 0, 0.5215687, 1,
1.399066, -1.334497, 3.290958, 1, 0, 0.5176471, 1,
1.410262, 0.4018737, 2.813722, 1, 0, 0.509804, 1,
1.414998, -2.58757, 3.099309, 1, 0, 0.5058824, 1,
1.417768, 0.5014474, 1.556648, 1, 0, 0.4980392, 1,
1.422605, -0.6641397, 1.807179, 1, 0, 0.4901961, 1,
1.444455, 1.897904, 0.1301593, 1, 0, 0.4862745, 1,
1.444713, -1.532376, 2.647627, 1, 0, 0.4784314, 1,
1.455842, 0.4059129, 2.284564, 1, 0, 0.4745098, 1,
1.460409, -0.9825884, 2.045662, 1, 0, 0.4666667, 1,
1.462144, 0.134699, 1.530674, 1, 0, 0.4627451, 1,
1.475917, -0.4663244, 2.872213, 1, 0, 0.454902, 1,
1.477483, 1.145127, 0.6922156, 1, 0, 0.4509804, 1,
1.484214, 1.437108, 1.164844, 1, 0, 0.4431373, 1,
1.497329, 0.58374, 2.507342, 1, 0, 0.4392157, 1,
1.526207, -0.5556647, 3.124501, 1, 0, 0.4313726, 1,
1.537005, -0.2621016, 0.8323324, 1, 0, 0.427451, 1,
1.545227, -0.7075402, 2.750709, 1, 0, 0.4196078, 1,
1.548045, -0.2611564, 0.6773653, 1, 0, 0.4156863, 1,
1.555118, 1.417431, 0.7471429, 1, 0, 0.4078431, 1,
1.565392, 0.02197611, 0.9330355, 1, 0, 0.4039216, 1,
1.590224, -1.04161, 0.3732987, 1, 0, 0.3960784, 1,
1.621752, -0.01390652, 0.3859163, 1, 0, 0.3882353, 1,
1.641721, -1.330655, 1.209734, 1, 0, 0.3843137, 1,
1.645387, -0.3846153, 0.4519518, 1, 0, 0.3764706, 1,
1.65983, -0.4536013, 1.650233, 1, 0, 0.372549, 1,
1.676745, 1.150178, 2.131405, 1, 0, 0.3647059, 1,
1.680139, 0.7954, 1.102161, 1, 0, 0.3607843, 1,
1.681953, 1.900694, 0.8580704, 1, 0, 0.3529412, 1,
1.68467, 0.1080324, 2.032851, 1, 0, 0.3490196, 1,
1.695042, -1.639674, 3.153898, 1, 0, 0.3411765, 1,
1.695829, 0.3697191, 2.878066, 1, 0, 0.3372549, 1,
1.700563, 1.498298, -0.4571434, 1, 0, 0.3294118, 1,
1.705439, 0.4608341, 0.7934983, 1, 0, 0.3254902, 1,
1.708642, -0.2600082, 0.8655112, 1, 0, 0.3176471, 1,
1.711517, 0.3343154, 1.046196, 1, 0, 0.3137255, 1,
1.730329, -1.579293, 2.731458, 1, 0, 0.3058824, 1,
1.761365, -1.046443, 1.225942, 1, 0, 0.2980392, 1,
1.770213, -0.4798371, 2.189567, 1, 0, 0.2941177, 1,
1.785345, 0.212471, -0.2367902, 1, 0, 0.2862745, 1,
1.817159, -0.2102512, 1.917156, 1, 0, 0.282353, 1,
1.825251, 2.048479, 1.70442, 1, 0, 0.2745098, 1,
1.842175, 0.860482, 1.962422, 1, 0, 0.2705882, 1,
1.853937, -1.832039, 2.543844, 1, 0, 0.2627451, 1,
1.856832, -1.422557, 1.568347, 1, 0, 0.2588235, 1,
1.875431, -0.0969518, 0.9631748, 1, 0, 0.2509804, 1,
1.877493, 0.482535, 0.6726878, 1, 0, 0.2470588, 1,
1.903033, -0.7248098, 1.127053, 1, 0, 0.2392157, 1,
1.91727, 1.503815, 2.759002, 1, 0, 0.2352941, 1,
1.939653, -0.03718614, 1.736824, 1, 0, 0.227451, 1,
1.968914, 0.6874888, 1.761037, 1, 0, 0.2235294, 1,
1.985426, -0.4331851, 2.040447, 1, 0, 0.2156863, 1,
1.985682, 0.8910971, 2.882352, 1, 0, 0.2117647, 1,
1.98876, -0.1297492, 1.333037, 1, 0, 0.2039216, 1,
1.98932, 1.513742, -0.409934, 1, 0, 0.1960784, 1,
1.99499, 1.805026, 1.693801, 1, 0, 0.1921569, 1,
2.01238, -1.249453, 1.629728, 1, 0, 0.1843137, 1,
2.023636, -1.422629, 0.6970517, 1, 0, 0.1803922, 1,
2.039009, -0.5593145, 2.598358, 1, 0, 0.172549, 1,
2.039207, -0.3890104, 2.009445, 1, 0, 0.1686275, 1,
2.04468, -0.9921822, 1.896441, 1, 0, 0.1607843, 1,
2.09136, -0.90212, 2.276306, 1, 0, 0.1568628, 1,
2.110088, -1.728244, 2.461688, 1, 0, 0.1490196, 1,
2.128809, 1.136133, -0.5484297, 1, 0, 0.145098, 1,
2.14251, -0.08005687, 0.4944266, 1, 0, 0.1372549, 1,
2.143725, -0.6932748, 1.216269, 1, 0, 0.1333333, 1,
2.147535, -0.175503, 1.97867, 1, 0, 0.1254902, 1,
2.151945, -1.129352, 1.112318, 1, 0, 0.1215686, 1,
2.176577, -0.4072636, 0.4645811, 1, 0, 0.1137255, 1,
2.193636, 1.895205, 1.557075, 1, 0, 0.1098039, 1,
2.2178, -0.6371233, 2.634934, 1, 0, 0.1019608, 1,
2.281439, -1.38736, 2.779002, 1, 0, 0.09411765, 1,
2.291322, -0.9800402, 0.7637932, 1, 0, 0.09019608, 1,
2.309032, 0.6275026, 1.95567, 1, 0, 0.08235294, 1,
2.317297, 0.339958, 2.146666, 1, 0, 0.07843138, 1,
2.326283, 0.4021973, 1.370094, 1, 0, 0.07058824, 1,
2.361556, -2.062269, 2.550778, 1, 0, 0.06666667, 1,
2.453055, 2.351361, 1.785671, 1, 0, 0.05882353, 1,
2.457864, 0.4598161, 2.020293, 1, 0, 0.05490196, 1,
2.505474, -0.6492327, 0.6797795, 1, 0, 0.04705882, 1,
2.531874, 0.7663552, 0.4736506, 1, 0, 0.04313726, 1,
2.577114, 0.07817399, 0.9722735, 1, 0, 0.03529412, 1,
2.622438, -0.8046626, 1.663723, 1, 0, 0.03137255, 1,
2.684684, -0.8118414, 1.774805, 1, 0, 0.02352941, 1,
2.952385, -0.4018029, 1.731158, 1, 0, 0.01960784, 1,
2.959955, 1.474639, 1.562392, 1, 0, 0.01176471, 1,
3.005241, 0.5624352, 1.277443, 1, 0, 0.007843138, 1
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
-0.2391918, -4.419014, -7.208821, 0, -0.5, 0.5, 0.5,
-0.2391918, -4.419014, -7.208821, 1, -0.5, 0.5, 0.5,
-0.2391918, -4.419014, -7.208821, 1, 1.5, 0.5, 0.5,
-0.2391918, -4.419014, -7.208821, 0, 1.5, 0.5, 0.5
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
-4.583487, -0.1169055, -7.208821, 0, -0.5, 0.5, 0.5,
-4.583487, -0.1169055, -7.208821, 1, -0.5, 0.5, 0.5,
-4.583487, -0.1169055, -7.208821, 1, 1.5, 0.5, 0.5,
-4.583487, -0.1169055, -7.208821, 0, 1.5, 0.5, 0.5
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
-4.583487, -4.419014, -0.1655443, 0, -0.5, 0.5, 0.5,
-4.583487, -4.419014, -0.1655443, 1, -0.5, 0.5, 0.5,
-4.583487, -4.419014, -0.1655443, 1, 1.5, 0.5, 0.5,
-4.583487, -4.419014, -0.1655443, 0, 1.5, 0.5, 0.5
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
-3, -3.42622, -5.58345,
3, -3.42622, -5.58345,
-3, -3.42622, -5.58345,
-3, -3.591686, -5.854345,
-2, -3.42622, -5.58345,
-2, -3.591686, -5.854345,
-1, -3.42622, -5.58345,
-1, -3.591686, -5.854345,
0, -3.42622, -5.58345,
0, -3.591686, -5.854345,
1, -3.42622, -5.58345,
1, -3.591686, -5.854345,
2, -3.42622, -5.58345,
2, -3.591686, -5.854345,
3, -3.42622, -5.58345,
3, -3.591686, -5.854345
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
-3, -3.922617, -6.396136, 0, -0.5, 0.5, 0.5,
-3, -3.922617, -6.396136, 1, -0.5, 0.5, 0.5,
-3, -3.922617, -6.396136, 1, 1.5, 0.5, 0.5,
-3, -3.922617, -6.396136, 0, 1.5, 0.5, 0.5,
-2, -3.922617, -6.396136, 0, -0.5, 0.5, 0.5,
-2, -3.922617, -6.396136, 1, -0.5, 0.5, 0.5,
-2, -3.922617, -6.396136, 1, 1.5, 0.5, 0.5,
-2, -3.922617, -6.396136, 0, 1.5, 0.5, 0.5,
-1, -3.922617, -6.396136, 0, -0.5, 0.5, 0.5,
-1, -3.922617, -6.396136, 1, -0.5, 0.5, 0.5,
-1, -3.922617, -6.396136, 1, 1.5, 0.5, 0.5,
-1, -3.922617, -6.396136, 0, 1.5, 0.5, 0.5,
0, -3.922617, -6.396136, 0, -0.5, 0.5, 0.5,
0, -3.922617, -6.396136, 1, -0.5, 0.5, 0.5,
0, -3.922617, -6.396136, 1, 1.5, 0.5, 0.5,
0, -3.922617, -6.396136, 0, 1.5, 0.5, 0.5,
1, -3.922617, -6.396136, 0, -0.5, 0.5, 0.5,
1, -3.922617, -6.396136, 1, -0.5, 0.5, 0.5,
1, -3.922617, -6.396136, 1, 1.5, 0.5, 0.5,
1, -3.922617, -6.396136, 0, 1.5, 0.5, 0.5,
2, -3.922617, -6.396136, 0, -0.5, 0.5, 0.5,
2, -3.922617, -6.396136, 1, -0.5, 0.5, 0.5,
2, -3.922617, -6.396136, 1, 1.5, 0.5, 0.5,
2, -3.922617, -6.396136, 0, 1.5, 0.5, 0.5,
3, -3.922617, -6.396136, 0, -0.5, 0.5, 0.5,
3, -3.922617, -6.396136, 1, -0.5, 0.5, 0.5,
3, -3.922617, -6.396136, 1, 1.5, 0.5, 0.5,
3, -3.922617, -6.396136, 0, 1.5, 0.5, 0.5
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
-3.580957, -3, -5.58345,
-3.580957, 3, -5.58345,
-3.580957, -3, -5.58345,
-3.748045, -3, -5.854345,
-3.580957, -2, -5.58345,
-3.748045, -2, -5.854345,
-3.580957, -1, -5.58345,
-3.748045, -1, -5.854345,
-3.580957, 0, -5.58345,
-3.748045, 0, -5.854345,
-3.580957, 1, -5.58345,
-3.748045, 1, -5.854345,
-3.580957, 2, -5.58345,
-3.748045, 2, -5.854345,
-3.580957, 3, -5.58345,
-3.748045, 3, -5.854345
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
-4.082222, -3, -6.396136, 0, -0.5, 0.5, 0.5,
-4.082222, -3, -6.396136, 1, -0.5, 0.5, 0.5,
-4.082222, -3, -6.396136, 1, 1.5, 0.5, 0.5,
-4.082222, -3, -6.396136, 0, 1.5, 0.5, 0.5,
-4.082222, -2, -6.396136, 0, -0.5, 0.5, 0.5,
-4.082222, -2, -6.396136, 1, -0.5, 0.5, 0.5,
-4.082222, -2, -6.396136, 1, 1.5, 0.5, 0.5,
-4.082222, -2, -6.396136, 0, 1.5, 0.5, 0.5,
-4.082222, -1, -6.396136, 0, -0.5, 0.5, 0.5,
-4.082222, -1, -6.396136, 1, -0.5, 0.5, 0.5,
-4.082222, -1, -6.396136, 1, 1.5, 0.5, 0.5,
-4.082222, -1, -6.396136, 0, 1.5, 0.5, 0.5,
-4.082222, 0, -6.396136, 0, -0.5, 0.5, 0.5,
-4.082222, 0, -6.396136, 1, -0.5, 0.5, 0.5,
-4.082222, 0, -6.396136, 1, 1.5, 0.5, 0.5,
-4.082222, 0, -6.396136, 0, 1.5, 0.5, 0.5,
-4.082222, 1, -6.396136, 0, -0.5, 0.5, 0.5,
-4.082222, 1, -6.396136, 1, -0.5, 0.5, 0.5,
-4.082222, 1, -6.396136, 1, 1.5, 0.5, 0.5,
-4.082222, 1, -6.396136, 0, 1.5, 0.5, 0.5,
-4.082222, 2, -6.396136, 0, -0.5, 0.5, 0.5,
-4.082222, 2, -6.396136, 1, -0.5, 0.5, 0.5,
-4.082222, 2, -6.396136, 1, 1.5, 0.5, 0.5,
-4.082222, 2, -6.396136, 0, 1.5, 0.5, 0.5,
-4.082222, 3, -6.396136, 0, -0.5, 0.5, 0.5,
-4.082222, 3, -6.396136, 1, -0.5, 0.5, 0.5,
-4.082222, 3, -6.396136, 1, 1.5, 0.5, 0.5,
-4.082222, 3, -6.396136, 0, 1.5, 0.5, 0.5
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
-3.580957, -3.42622, -4,
-3.580957, -3.42622, 4,
-3.580957, -3.42622, -4,
-3.748045, -3.591686, -4,
-3.580957, -3.42622, -2,
-3.748045, -3.591686, -2,
-3.580957, -3.42622, 0,
-3.748045, -3.591686, 0,
-3.580957, -3.42622, 2,
-3.748045, -3.591686, 2,
-3.580957, -3.42622, 4,
-3.748045, -3.591686, 4
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
-4.082222, -3.922617, -4, 0, -0.5, 0.5, 0.5,
-4.082222, -3.922617, -4, 1, -0.5, 0.5, 0.5,
-4.082222, -3.922617, -4, 1, 1.5, 0.5, 0.5,
-4.082222, -3.922617, -4, 0, 1.5, 0.5, 0.5,
-4.082222, -3.922617, -2, 0, -0.5, 0.5, 0.5,
-4.082222, -3.922617, -2, 1, -0.5, 0.5, 0.5,
-4.082222, -3.922617, -2, 1, 1.5, 0.5, 0.5,
-4.082222, -3.922617, -2, 0, 1.5, 0.5, 0.5,
-4.082222, -3.922617, 0, 0, -0.5, 0.5, 0.5,
-4.082222, -3.922617, 0, 1, -0.5, 0.5, 0.5,
-4.082222, -3.922617, 0, 1, 1.5, 0.5, 0.5,
-4.082222, -3.922617, 0, 0, 1.5, 0.5, 0.5,
-4.082222, -3.922617, 2, 0, -0.5, 0.5, 0.5,
-4.082222, -3.922617, 2, 1, -0.5, 0.5, 0.5,
-4.082222, -3.922617, 2, 1, 1.5, 0.5, 0.5,
-4.082222, -3.922617, 2, 0, 1.5, 0.5, 0.5,
-4.082222, -3.922617, 4, 0, -0.5, 0.5, 0.5,
-4.082222, -3.922617, 4, 1, -0.5, 0.5, 0.5,
-4.082222, -3.922617, 4, 1, 1.5, 0.5, 0.5,
-4.082222, -3.922617, 4, 0, 1.5, 0.5, 0.5
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
-3.580957, -3.42622, -5.58345,
-3.580957, 3.192409, -5.58345,
-3.580957, -3.42622, 5.252361,
-3.580957, 3.192409, 5.252361,
-3.580957, -3.42622, -5.58345,
-3.580957, -3.42622, 5.252361,
-3.580957, 3.192409, -5.58345,
-3.580957, 3.192409, 5.252361,
-3.580957, -3.42622, -5.58345,
3.102574, -3.42622, -5.58345,
-3.580957, -3.42622, 5.252361,
3.102574, -3.42622, 5.252361,
-3.580957, 3.192409, -5.58345,
3.102574, 3.192409, -5.58345,
-3.580957, 3.192409, 5.252361,
3.102574, 3.192409, 5.252361,
3.102574, -3.42622, -5.58345,
3.102574, 3.192409, -5.58345,
3.102574, -3.42622, 5.252361,
3.102574, 3.192409, 5.252361,
3.102574, -3.42622, -5.58345,
3.102574, -3.42622, 5.252361,
3.102574, 3.192409, -5.58345,
3.102574, 3.192409, 5.252361
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
var radius = 7.662029;
var distance = 34.08923;
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
mvMatrix.translate( 0.2391918, 0.1169055, 0.1655443 );
mvMatrix.scale( 1.239515, 1.251669, 0.764533 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.08923);
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
famphur<-read.table("famphur.xyz")
```

```
## Error in read.table("famphur.xyz"): no lines available in input
```

```r
x<-famphur$V2
```

```
## Error in eval(expr, envir, enclos): object 'famphur' not found
```

```r
y<-famphur$V3
```

```
## Error in eval(expr, envir, enclos): object 'famphur' not found
```

```r
z<-famphur$V4
```

```
## Error in eval(expr, envir, enclos): object 'famphur' not found
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
-3.483624, -0.7234594, -2.497551, 0, 0, 1, 1, 1,
-3.15686, -0.3516287, -0.06284451, 1, 0, 0, 1, 1,
-2.908259, 1.123985, -2.903468, 1, 0, 0, 1, 1,
-2.754469, 0.2383174, -1.575425, 1, 0, 0, 1, 1,
-2.687532, 0.4657573, -0.005590585, 1, 0, 0, 1, 1,
-2.652221, -0.8797694, -3.021002, 1, 0, 0, 1, 1,
-2.557353, -2.472273, -1.66711, 0, 0, 0, 1, 1,
-2.398941, 0.5998033, -1.576714, 0, 0, 0, 1, 1,
-2.377606, -0.3703462, -1.64731, 0, 0, 0, 1, 1,
-2.333673, -0.9072995, -0.7266206, 0, 0, 0, 1, 1,
-2.169763, -0.8736235, -2.470412, 0, 0, 0, 1, 1,
-2.166309, -0.2877015, -3.411991, 0, 0, 0, 1, 1,
-2.136038, -0.5179517, -2.739695, 0, 0, 0, 1, 1,
-2.113351, -0.0817714, -2.384072, 1, 1, 1, 1, 1,
-2.108697, 1.426609, -2.093319, 1, 1, 1, 1, 1,
-2.105033, 0.5602775, -1.329431, 1, 1, 1, 1, 1,
-2.08188, -0.06135986, -4.544113, 1, 1, 1, 1, 1,
-2.080507, 1.508449, -1.054037, 1, 1, 1, 1, 1,
-2.078852, 1.458542, -1.087958, 1, 1, 1, 1, 1,
-2.070414, -0.7976616, -0.2493944, 1, 1, 1, 1, 1,
-2.068313, -1.505938, -2.577971, 1, 1, 1, 1, 1,
-2.056237, -1.091512, -3.696158, 1, 1, 1, 1, 1,
-2.055, 0.1916613, -1.463889, 1, 1, 1, 1, 1,
-2.016641, 1.136652, -0.9107032, 1, 1, 1, 1, 1,
-2.014611, -1.139885, -2.727947, 1, 1, 1, 1, 1,
-2.004948, -0.6362763, -1.790198, 1, 1, 1, 1, 1,
-1.98375, -0.05175353, -0.5781303, 1, 1, 1, 1, 1,
-1.955169, -0.762311, -1.940135, 1, 1, 1, 1, 1,
-1.936522, 0.4052729, 1.075166, 0, 0, 1, 1, 1,
-1.934337, -2.254717, -4.221636, 1, 0, 0, 1, 1,
-1.933724, 1.33249, -1.346318, 1, 0, 0, 1, 1,
-1.92565, -1.775034, -1.422428, 1, 0, 0, 1, 1,
-1.911002, -1.040814, -1.20618, 1, 0, 0, 1, 1,
-1.905548, -1.876097, -2.549589, 1, 0, 0, 1, 1,
-1.895273, 1.302041, -1.199823, 0, 0, 0, 1, 1,
-1.852933, -0.6571956, -1.992345, 0, 0, 0, 1, 1,
-1.841762, -0.07635178, -1.675053, 0, 0, 0, 1, 1,
-1.836034, -0.5973421, -2.974909, 0, 0, 0, 1, 1,
-1.81552, -0.8660867, -3.549128, 0, 0, 0, 1, 1,
-1.750368, 0.7167654, 0.7879746, 0, 0, 0, 1, 1,
-1.749261, -1.644905, -3.393807, 0, 0, 0, 1, 1,
-1.732167, -0.7694579, -2.419017, 1, 1, 1, 1, 1,
-1.684133, 0.2614558, -1.803186, 1, 1, 1, 1, 1,
-1.680004, -0.3081357, -1.693942, 1, 1, 1, 1, 1,
-1.653355, -1.176441, -2.277062, 1, 1, 1, 1, 1,
-1.65253, -1.911355, -2.464888, 1, 1, 1, 1, 1,
-1.641566, 0.8623424, -0.9417765, 1, 1, 1, 1, 1,
-1.625234, -0.6061962, -3.427475, 1, 1, 1, 1, 1,
-1.619063, -0.4797069, -3.064407, 1, 1, 1, 1, 1,
-1.598207, -1.009094, -3.406476, 1, 1, 1, 1, 1,
-1.596359, 0.04652939, -1.941942, 1, 1, 1, 1, 1,
-1.587581, -0.1275856, -2.441995, 1, 1, 1, 1, 1,
-1.580719, 0.7596912, -0.5011438, 1, 1, 1, 1, 1,
-1.576663, -0.2545893, -2.157149, 1, 1, 1, 1, 1,
-1.573397, 0.4749748, -1.18023, 1, 1, 1, 1, 1,
-1.561986, -0.2952994, -2.830834, 1, 1, 1, 1, 1,
-1.548189, -0.8525068, -2.653106, 0, 0, 1, 1, 1,
-1.545925, -0.3870667, -0.9780104, 1, 0, 0, 1, 1,
-1.543549, -1.32732, -1.531483, 1, 0, 0, 1, 1,
-1.541823, -1.187831, -1.437231, 1, 0, 0, 1, 1,
-1.540501, -0.8694431, -1.630843, 1, 0, 0, 1, 1,
-1.538595, -0.05629816, -1.992741, 1, 0, 0, 1, 1,
-1.537965, -0.2625211, -2.648299, 0, 0, 0, 1, 1,
-1.532436, 1.026758, -0.780472, 0, 0, 0, 1, 1,
-1.531872, 1.144561, -1.826155, 0, 0, 0, 1, 1,
-1.530513, -1.437738, -3.319763, 0, 0, 0, 1, 1,
-1.520569, 1.275967, -0.5690512, 0, 0, 0, 1, 1,
-1.517234, 0.05452303, 0.1391921, 0, 0, 0, 1, 1,
-1.510625, 0.4915774, -1.948476, 0, 0, 0, 1, 1,
-1.505091, 0.2390888, -1.920661, 1, 1, 1, 1, 1,
-1.487305, 1.273322, -2.392206, 1, 1, 1, 1, 1,
-1.482029, 0.8014216, -2.248061, 1, 1, 1, 1, 1,
-1.458792, 0.7476886, -0.9537902, 1, 1, 1, 1, 1,
-1.455194, 2.381562, -2.497659, 1, 1, 1, 1, 1,
-1.450103, -1.257253, -1.557062, 1, 1, 1, 1, 1,
-1.417079, -0.4346891, -0.9872417, 1, 1, 1, 1, 1,
-1.405626, -1.884784, -2.467485, 1, 1, 1, 1, 1,
-1.404231, -0.4739315, -1.561297, 1, 1, 1, 1, 1,
-1.400452, -1.777796, -3.41573, 1, 1, 1, 1, 1,
-1.395679, -0.9457342, -0.9872832, 1, 1, 1, 1, 1,
-1.393741, 2.047711, 0.06437166, 1, 1, 1, 1, 1,
-1.389932, 1.364602, -3.195442, 1, 1, 1, 1, 1,
-1.384003, -0.5298228, -3.013181, 1, 1, 1, 1, 1,
-1.364289, 2.146269, -0.9652954, 1, 1, 1, 1, 1,
-1.344768, -0.1898951, -2.770036, 0, 0, 1, 1, 1,
-1.341632, 0.2235764, 0.07668757, 1, 0, 0, 1, 1,
-1.335836, 0.5052209, -2.684063, 1, 0, 0, 1, 1,
-1.334403, 1.333999, -1.136478, 1, 0, 0, 1, 1,
-1.325881, 1.593681, -1.58548, 1, 0, 0, 1, 1,
-1.325278, -2.259912, -2.286597, 1, 0, 0, 1, 1,
-1.299808, 1.204259, -1.701567, 0, 0, 0, 1, 1,
-1.296385, -0.1432243, -2.039294, 0, 0, 0, 1, 1,
-1.278781, 0.2782997, -0.9691219, 0, 0, 0, 1, 1,
-1.275656, 0.1621494, -1.998542, 0, 0, 0, 1, 1,
-1.257222, 0.6196539, -1.322628, 0, 0, 0, 1, 1,
-1.249748, 0.04593818, -1.126598, 0, 0, 0, 1, 1,
-1.23594, -0.4103722, -2.480113, 0, 0, 0, 1, 1,
-1.22906, 0.5429643, -1.236958, 1, 1, 1, 1, 1,
-1.226007, 0.431407, -1.562481, 1, 1, 1, 1, 1,
-1.224547, -0.3314649, -1.703394, 1, 1, 1, 1, 1,
-1.214775, 0.3780421, -1.106403, 1, 1, 1, 1, 1,
-1.214447, -2.29049, -3.147413, 1, 1, 1, 1, 1,
-1.208797, -0.2122155, -1.926759, 1, 1, 1, 1, 1,
-1.204312, -0.5760719, -2.933953, 1, 1, 1, 1, 1,
-1.194193, -0.3110094, -3.257408, 1, 1, 1, 1, 1,
-1.190925, -1.286824, -2.565883, 1, 1, 1, 1, 1,
-1.178878, 0.7038351, -0.9094926, 1, 1, 1, 1, 1,
-1.158309, 0.2856863, -4.141004, 1, 1, 1, 1, 1,
-1.155792, -3.329832, -1.510007, 1, 1, 1, 1, 1,
-1.155739, -1.026875, -1.461335, 1, 1, 1, 1, 1,
-1.154098, -0.4364531, -3.033994, 1, 1, 1, 1, 1,
-1.148498, 0.446828, -1.784497, 1, 1, 1, 1, 1,
-1.14724, 1.794039, 0.8727369, 0, 0, 1, 1, 1,
-1.146257, -1.007722, -3.420543, 1, 0, 0, 1, 1,
-1.144987, -0.159682, -0.8236523, 1, 0, 0, 1, 1,
-1.140706, -0.6820066, -2.532331, 1, 0, 0, 1, 1,
-1.124892, -0.9214043, -1.804845, 1, 0, 0, 1, 1,
-1.122096, -1.050821, -2.918808, 1, 0, 0, 1, 1,
-1.120226, 0.1278518, -0.2970872, 0, 0, 0, 1, 1,
-1.118577, -1.10144, -3.429784, 0, 0, 0, 1, 1,
-1.118271, -0.5279334, -2.467771, 0, 0, 0, 1, 1,
-1.113105, -0.6064589, -1.454545, 0, 0, 0, 1, 1,
-1.11117, 0.2014901, 0.7906306, 0, 0, 0, 1, 1,
-1.111163, 2.925534, 0.9089034, 0, 0, 0, 1, 1,
-1.108746, -1.670923, -2.874331, 0, 0, 0, 1, 1,
-1.107824, 0.3007641, -1.756374, 1, 1, 1, 1, 1,
-1.096325, -0.4275741, -1.283782, 1, 1, 1, 1, 1,
-1.094475, -1.649451, -4.493069, 1, 1, 1, 1, 1,
-1.093885, -0.4844746, -1.467288, 1, 1, 1, 1, 1,
-1.088316, -0.151678, -0.7310365, 1, 1, 1, 1, 1,
-1.084138, -1.472998, -2.989541, 1, 1, 1, 1, 1,
-1.083878, -0.7707087, -3.000336, 1, 1, 1, 1, 1,
-1.080566, -0.168272, -0.2752498, 1, 1, 1, 1, 1,
-1.077476, 0.3365597, 0.582148, 1, 1, 1, 1, 1,
-1.076691, -0.8487098, -3.936761, 1, 1, 1, 1, 1,
-1.072466, 0.9541057, -1.877641, 1, 1, 1, 1, 1,
-1.071438, 0.124007, -0.6566253, 1, 1, 1, 1, 1,
-1.062865, -0.432031, -0.5984623, 1, 1, 1, 1, 1,
-1.062741, 0.2238699, -1.661757, 1, 1, 1, 1, 1,
-1.060418, -0.7642094, -1.477233, 1, 1, 1, 1, 1,
-1.052219, 1.130961, -1.370345, 0, 0, 1, 1, 1,
-1.050931, -0.4243519, -0.6476863, 1, 0, 0, 1, 1,
-1.046159, 2.535635, -0.1195656, 1, 0, 0, 1, 1,
-1.040536, -1.563681, -3.854786, 1, 0, 0, 1, 1,
-1.038682, -1.666244, -1.21825, 1, 0, 0, 1, 1,
-1.038379, 0.2372025, -1.365051, 1, 0, 0, 1, 1,
-1.036017, 0.5013795, -1.2433, 0, 0, 0, 1, 1,
-1.035004, -0.4714985, -1.693518, 0, 0, 0, 1, 1,
-1.033983, -1.113836, -2.104511, 0, 0, 0, 1, 1,
-1.026477, -0.803789, -3.517204, 0, 0, 0, 1, 1,
-1.026123, -0.7752171, -0.7163266, 0, 0, 0, 1, 1,
-1.020715, -0.5833098, -3.130213, 0, 0, 0, 1, 1,
-1.013963, -1.002976, -4.485599, 0, 0, 0, 1, 1,
-1.013654, 1.065717, -0.09391438, 1, 1, 1, 1, 1,
-1.009098, 1.819196, 0.06527986, 1, 1, 1, 1, 1,
-1.005953, -1.379916, -2.10954, 1, 1, 1, 1, 1,
-0.9994622, -1.806731, -2.56393, 1, 1, 1, 1, 1,
-0.9973007, 1.042823, -1.478009, 1, 1, 1, 1, 1,
-0.9930134, -1.108186, -1.463596, 1, 1, 1, 1, 1,
-0.985979, -0.002520374, -1.94254, 1, 1, 1, 1, 1,
-0.9819589, -0.1757037, -0.7760061, 1, 1, 1, 1, 1,
-0.9804267, 0.5791513, -0.652248, 1, 1, 1, 1, 1,
-0.9746808, -0.9502527, -4.264085, 1, 1, 1, 1, 1,
-0.971612, -1.404337, -1.550821, 1, 1, 1, 1, 1,
-0.9626931, 0.06487136, -0.4809102, 1, 1, 1, 1, 1,
-0.953879, -0.4008223, -3.054159, 1, 1, 1, 1, 1,
-0.9529428, -1.776106, -2.915008, 1, 1, 1, 1, 1,
-0.9521955, 0.9632411, -3.045115, 1, 1, 1, 1, 1,
-0.9514416, 0.1012503, -0.6409467, 0, 0, 1, 1, 1,
-0.9512224, 0.1305235, -1.103817, 1, 0, 0, 1, 1,
-0.9395477, -1.326291, -3.550535, 1, 0, 0, 1, 1,
-0.9337384, 1.361837, -0.3596919, 1, 0, 0, 1, 1,
-0.9309108, -0.270175, -1.633104, 1, 0, 0, 1, 1,
-0.9292272, 1.027114, -0.2677673, 1, 0, 0, 1, 1,
-0.92781, -1.064016, -2.526858, 0, 0, 0, 1, 1,
-0.9235368, -0.9484876, -2.562536, 0, 0, 0, 1, 1,
-0.9216722, 0.185201, -0.1972807, 0, 0, 0, 1, 1,
-0.9211997, -2.563327, -2.352647, 0, 0, 0, 1, 1,
-0.9208328, -0.6726068, -2.850525, 0, 0, 0, 1, 1,
-0.9122325, 0.9620344, 0.4665636, 0, 0, 0, 1, 1,
-0.9083128, 0.3956597, -1.229079, 0, 0, 0, 1, 1,
-0.90191, 1.337394, -0.7929164, 1, 1, 1, 1, 1,
-0.8984554, 1.276524, 1.042876, 1, 1, 1, 1, 1,
-0.8942817, 0.08740107, 0.9346654, 1, 1, 1, 1, 1,
-0.8887578, -1.310775, 0.2670985, 1, 1, 1, 1, 1,
-0.8854694, -0.7438678, -2.775194, 1, 1, 1, 1, 1,
-0.8815466, -0.8952207, -1.431248, 1, 1, 1, 1, 1,
-0.863875, -0.5575569, -2.520636, 1, 1, 1, 1, 1,
-0.8622992, 0.2239221, -2.300564, 1, 1, 1, 1, 1,
-0.8590499, 1.19437, -1.596589, 1, 1, 1, 1, 1,
-0.8564236, 0.2962583, -1.343715, 1, 1, 1, 1, 1,
-0.8562607, 1.594668, -0.4643026, 1, 1, 1, 1, 1,
-0.8551387, 0.006253734, -2.122257, 1, 1, 1, 1, 1,
-0.8528223, 0.9112018, -0.7882065, 1, 1, 1, 1, 1,
-0.851882, 0.1447001, -1.88189, 1, 1, 1, 1, 1,
-0.8489355, 2.128373, 0.4909405, 1, 1, 1, 1, 1,
-0.8456034, -0.6321413, -1.768744, 0, 0, 1, 1, 1,
-0.8451635, 0.8813459, -1.018912, 1, 0, 0, 1, 1,
-0.8424047, 2.316735, -1.180354, 1, 0, 0, 1, 1,
-0.8326217, -0.6052774, -1.754993, 1, 0, 0, 1, 1,
-0.8122414, -2.529972, -3.138499, 1, 0, 0, 1, 1,
-0.805281, -0.2664541, -1.477945, 1, 0, 0, 1, 1,
-0.7986189, -0.0912321, -2.835907, 0, 0, 0, 1, 1,
-0.791507, 1.176162, -0.003528624, 0, 0, 0, 1, 1,
-0.7846981, -1.005302, -2.19106, 0, 0, 0, 1, 1,
-0.7786242, -0.07024302, -1.627311, 0, 0, 0, 1, 1,
-0.7785947, -0.6727006, -2.625418, 0, 0, 0, 1, 1,
-0.7589206, -0.1837334, -2.722618, 0, 0, 0, 1, 1,
-0.7558469, 1.238634, -1.479724, 0, 0, 0, 1, 1,
-0.7530499, -1.047198, -3.09447, 1, 1, 1, 1, 1,
-0.7524376, -0.8422799, -2.313477, 1, 1, 1, 1, 1,
-0.7486954, 0.5221218, -2.447914, 1, 1, 1, 1, 1,
-0.7443723, -0.02024733, -0.05058432, 1, 1, 1, 1, 1,
-0.7441725, 1.699573, -0.7583367, 1, 1, 1, 1, 1,
-0.741667, -0.8621037, -1.746106, 1, 1, 1, 1, 1,
-0.7411926, 0.06331026, -0.8516752, 1, 1, 1, 1, 1,
-0.7406301, 1.788785, -0.7256847, 1, 1, 1, 1, 1,
-0.7399673, 0.3883575, -0.4316256, 1, 1, 1, 1, 1,
-0.7368104, 0.4364781, -2.317471, 1, 1, 1, 1, 1,
-0.7367562, 1.592332, -1.180142, 1, 1, 1, 1, 1,
-0.7350314, 0.6771885, -0.4003017, 1, 1, 1, 1, 1,
-0.7335454, 0.2676325, -0.5956721, 1, 1, 1, 1, 1,
-0.7292849, 1.219073, -1.012337, 1, 1, 1, 1, 1,
-0.7235678, -0.4212617, -1.696612, 1, 1, 1, 1, 1,
-0.7222666, -1.443651, -2.323515, 0, 0, 1, 1, 1,
-0.7157106, 1.135895, 0.08409449, 1, 0, 0, 1, 1,
-0.710265, -0.3561493, -2.809125, 1, 0, 0, 1, 1,
-0.710256, -0.7276756, -2.339564, 1, 0, 0, 1, 1,
-0.7074283, 2.893452, 0.6529616, 1, 0, 0, 1, 1,
-0.6948621, 1.925327, 0.9172746, 1, 0, 0, 1, 1,
-0.6889609, 0.7245708, -0.2934184, 0, 0, 0, 1, 1,
-0.688268, 1.63641, -0.0740578, 0, 0, 0, 1, 1,
-0.6841666, -0.7070808, -1.429311, 0, 0, 0, 1, 1,
-0.6785951, -0.6549973, -3.773868, 0, 0, 0, 1, 1,
-0.6783735, -0.06201224, -0.9764186, 0, 0, 0, 1, 1,
-0.6764299, 1.28433, -0.7711688, 0, 0, 0, 1, 1,
-0.6743016, -0.7056101, -2.113557, 0, 0, 0, 1, 1,
-0.6715941, -1.442827, -1.930777, 1, 1, 1, 1, 1,
-0.6656946, 1.053975, -2.292954, 1, 1, 1, 1, 1,
-0.6646522, 0.008140095, -2.431603, 1, 1, 1, 1, 1,
-0.6611226, -2.21749, -4.160306, 1, 1, 1, 1, 1,
-0.6608995, -0.442231, -0.6573871, 1, 1, 1, 1, 1,
-0.6588653, 0.3473713, -1.992809, 1, 1, 1, 1, 1,
-0.6580487, 0.4125434, -0.9342817, 1, 1, 1, 1, 1,
-0.6500188, 1.710752, -2.16754, 1, 1, 1, 1, 1,
-0.6497849, -1.194379, -4.221189, 1, 1, 1, 1, 1,
-0.647006, -1.037849, -2.470024, 1, 1, 1, 1, 1,
-0.6389069, 0.159386, -2.235181, 1, 1, 1, 1, 1,
-0.6377895, 0.004550476, -0.9408147, 1, 1, 1, 1, 1,
-0.6377823, 0.2207769, -1.675123, 1, 1, 1, 1, 1,
-0.6344552, 1.009295, 0.8173414, 1, 1, 1, 1, 1,
-0.6326184, -0.3055922, -3.611208, 1, 1, 1, 1, 1,
-0.6259128, -0.6938916, -3.535339, 0, 0, 1, 1, 1,
-0.6258743, -0.408633, -1.04627, 1, 0, 0, 1, 1,
-0.6249835, -2.054808, -2.134962, 1, 0, 0, 1, 1,
-0.6245664, 0.7298291, -0.7167563, 1, 0, 0, 1, 1,
-0.6227854, -0.07944688, -1.932837, 1, 0, 0, 1, 1,
-0.6173521, 0.260304, 0.353322, 1, 0, 0, 1, 1,
-0.6172115, 0.07366405, -2.271945, 0, 0, 0, 1, 1,
-0.6135434, 1.632201, 0.2110346, 0, 0, 0, 1, 1,
-0.6134085, -0.9236128, -2.233331, 0, 0, 0, 1, 1,
-0.6123366, 0.08716841, -0.7527732, 0, 0, 0, 1, 1,
-0.6062107, -0.01520908, -1.419981, 0, 0, 0, 1, 1,
-0.6041676, 0.107522, -1.497751, 0, 0, 0, 1, 1,
-0.6039007, 0.9544987, -0.5950455, 0, 0, 0, 1, 1,
-0.6018708, -1.41469, -3.382055, 1, 1, 1, 1, 1,
-0.6015664, 0.4160747, 1.045058, 1, 1, 1, 1, 1,
-0.6007831, -0.4038596, -3.24984, 1, 1, 1, 1, 1,
-0.6006898, -0.8608201, -5.425647, 1, 1, 1, 1, 1,
-0.6006156, -0.7220458, -3.110468, 1, 1, 1, 1, 1,
-0.6002229, -0.8430737, -2.60646, 1, 1, 1, 1, 1,
-0.5989743, -0.7994344, -2.436122, 1, 1, 1, 1, 1,
-0.5974589, 1.704191, -2.03475, 1, 1, 1, 1, 1,
-0.5963503, 0.3040083, -0.04747796, 1, 1, 1, 1, 1,
-0.595157, 0.2606451, -2.440711, 1, 1, 1, 1, 1,
-0.5951318, -0.8254622, -1.528211, 1, 1, 1, 1, 1,
-0.5934048, 0.6483017, -2.319088, 1, 1, 1, 1, 1,
-0.5885885, -0.3179066, -0.5860354, 1, 1, 1, 1, 1,
-0.5804356, -0.5187869, -2.587032, 1, 1, 1, 1, 1,
-0.5763301, -0.8508027, -1.112844, 1, 1, 1, 1, 1,
-0.5738433, 0.2126736, -2.170342, 0, 0, 1, 1, 1,
-0.5715945, 0.1670635, -0.3150738, 1, 0, 0, 1, 1,
-0.5701541, 1.268714, -1.665036, 1, 0, 0, 1, 1,
-0.5696594, -1.189546, -1.45116, 1, 0, 0, 1, 1,
-0.5694629, 0.2278488, -2.13787, 1, 0, 0, 1, 1,
-0.5675507, -0.667064, -1.309431, 1, 0, 0, 1, 1,
-0.5638594, -0.6208895, -3.084337, 0, 0, 0, 1, 1,
-0.5617436, 0.35613, -2.811179, 0, 0, 0, 1, 1,
-0.5580975, -0.1158057, 1.356277, 0, 0, 0, 1, 1,
-0.5554727, 0.3318355, 1.059262, 0, 0, 0, 1, 1,
-0.5547733, -0.4395097, -1.355635, 0, 0, 0, 1, 1,
-0.5534013, -0.7753994, -1.040347, 0, 0, 0, 1, 1,
-0.5530078, -0.8550628, -2.152548, 0, 0, 0, 1, 1,
-0.5446764, 0.3032971, -2.006991, 1, 1, 1, 1, 1,
-0.5438911, -0.1200041, -0.940663, 1, 1, 1, 1, 1,
-0.543007, -0.6116171, -2.142174, 1, 1, 1, 1, 1,
-0.5408475, -0.8571379, -2.989, 1, 1, 1, 1, 1,
-0.5384002, -0.04788635, -1.057258, 1, 1, 1, 1, 1,
-0.5353063, -0.293705, -0.6684229, 1, 1, 1, 1, 1,
-0.5298333, 0.8000308, -0.1287278, 1, 1, 1, 1, 1,
-0.5226223, 0.9930164, -0.646992, 1, 1, 1, 1, 1,
-0.5210909, -0.576803, -2.706103, 1, 1, 1, 1, 1,
-0.5207403, -1.579773, -3.92463, 1, 1, 1, 1, 1,
-0.5197624, -0.3454485, -2.522761, 1, 1, 1, 1, 1,
-0.5131251, -1.218891, -2.08493, 1, 1, 1, 1, 1,
-0.512448, -0.367165, -1.930742, 1, 1, 1, 1, 1,
-0.5121658, 0.3807098, 0.8820186, 1, 1, 1, 1, 1,
-0.5112969, 0.9114001, 0.1699808, 1, 1, 1, 1, 1,
-0.5079976, -1.655778, -3.860142, 0, 0, 1, 1, 1,
-0.5041692, -0.537282, -2.413192, 1, 0, 0, 1, 1,
-0.5031651, 0.9672351, 0.6692045, 1, 0, 0, 1, 1,
-0.5020677, 0.620853, -2.229044, 1, 0, 0, 1, 1,
-0.4941627, -1.17435, -4.055908, 1, 0, 0, 1, 1,
-0.4936782, -1.867671, -3.624778, 1, 0, 0, 1, 1,
-0.4815412, 1.447899, -0.264333, 0, 0, 0, 1, 1,
-0.480893, -0.7964311, -2.636887, 0, 0, 0, 1, 1,
-0.4773036, 0.4566975, -0.1728425, 0, 0, 0, 1, 1,
-0.4771537, 2.652804, 0.05629705, 0, 0, 0, 1, 1,
-0.4767095, 0.1472466, -1.237761, 0, 0, 0, 1, 1,
-0.4651667, -1.027614, -3.278422, 0, 0, 0, 1, 1,
-0.4600342, -2.075462, -2.152324, 0, 0, 0, 1, 1,
-0.4551981, -0.3449438, -2.949051, 1, 1, 1, 1, 1,
-0.4512933, -1.681592, -3.08711, 1, 1, 1, 1, 1,
-0.444333, -0.9664376, -3.239967, 1, 1, 1, 1, 1,
-0.4411945, 0.2551116, -1.69558, 1, 1, 1, 1, 1,
-0.4386877, -0.8593346, -1.652295, 1, 1, 1, 1, 1,
-0.4323715, -0.8776858, -2.799098, 1, 1, 1, 1, 1,
-0.4322457, 0.1158551, -1.464632, 1, 1, 1, 1, 1,
-0.4272744, -0.2463815, -3.346471, 1, 1, 1, 1, 1,
-0.4236173, 0.8663858, -1.889132, 1, 1, 1, 1, 1,
-0.4233388, -1.655914, -2.893989, 1, 1, 1, 1, 1,
-0.4187874, -0.4905235, -2.656422, 1, 1, 1, 1, 1,
-0.4178153, -1.142883, -2.629377, 1, 1, 1, 1, 1,
-0.4174408, 1.083486, -1.077775, 1, 1, 1, 1, 1,
-0.4146938, -0.7571111, -2.352637, 1, 1, 1, 1, 1,
-0.4081882, 0.723455, -0.7295346, 1, 1, 1, 1, 1,
-0.4070973, -0.1315878, -0.9738483, 0, 0, 1, 1, 1,
-0.4070649, -1.453898, -3.624265, 1, 0, 0, 1, 1,
-0.4001367, -1.126948, -3.869654, 1, 0, 0, 1, 1,
-0.3991327, -0.8499734, -2.629326, 1, 0, 0, 1, 1,
-0.3982612, 0.1836896, -0.8822585, 1, 0, 0, 1, 1,
-0.3960035, -0.6362327, -3.110924, 1, 0, 0, 1, 1,
-0.3938811, 1.315498, -0.2248659, 0, 0, 0, 1, 1,
-0.3880782, -0.6439548, -2.069264, 0, 0, 0, 1, 1,
-0.386847, 1.055064, -1.446424, 0, 0, 0, 1, 1,
-0.3850368, 0.009533261, -2.291638, 0, 0, 0, 1, 1,
-0.3848229, -0.3541447, -2.719995, 0, 0, 0, 1, 1,
-0.3813537, 0.1589779, -1.195043, 0, 0, 0, 1, 1,
-0.3773975, -1.58884, -3.812772, 0, 0, 0, 1, 1,
-0.3771763, 0.5612735, -0.9525158, 1, 1, 1, 1, 1,
-0.3760846, -1.012626, -1.654924, 1, 1, 1, 1, 1,
-0.3733045, -2.069232, -2.242362, 1, 1, 1, 1, 1,
-0.3645874, 0.2985977, -1.559093, 1, 1, 1, 1, 1,
-0.3633443, -0.1242217, -1.886663, 1, 1, 1, 1, 1,
-0.3621173, 0.2746588, 0.2574705, 1, 1, 1, 1, 1,
-0.3574939, 2.555323, 0.1862992, 1, 1, 1, 1, 1,
-0.3531365, -1.756948, -3.498339, 1, 1, 1, 1, 1,
-0.3526228, -0.8256629, -2.76649, 1, 1, 1, 1, 1,
-0.3481291, 0.5228066, -0.1973342, 1, 1, 1, 1, 1,
-0.3471507, 0.1309845, -0.4582268, 1, 1, 1, 1, 1,
-0.3306756, -0.6510679, -3.334045, 1, 1, 1, 1, 1,
-0.3303991, 0.1689671, -1.06823, 1, 1, 1, 1, 1,
-0.3281378, 0.277067, -1.708288, 1, 1, 1, 1, 1,
-0.3255796, -0.3906595, -3.54001, 1, 1, 1, 1, 1,
-0.3253639, 0.1017654, -1.9457, 0, 0, 1, 1, 1,
-0.3247369, 0.6183737, -0.4592902, 1, 0, 0, 1, 1,
-0.3242382, 1.263376, -0.802885, 1, 0, 0, 1, 1,
-0.3240205, -0.5974121, -3.620817, 1, 0, 0, 1, 1,
-0.3201196, -0.7858673, -3.384803, 1, 0, 0, 1, 1,
-0.3194459, 0.5382621, 0.5336803, 1, 0, 0, 1, 1,
-0.3169604, -0.4145264, -2.628453, 0, 0, 0, 1, 1,
-0.3122234, 0.609165, 0.7069031, 0, 0, 0, 1, 1,
-0.311704, -1.560109, -1.735335, 0, 0, 0, 1, 1,
-0.3104986, -0.5233043, -2.745179, 0, 0, 0, 1, 1,
-0.3083704, 0.8136086, -1.342585, 0, 0, 0, 1, 1,
-0.3019122, 0.5217775, -0.5822175, 0, 0, 0, 1, 1,
-0.300446, 1.44403, 0.0855739, 0, 0, 0, 1, 1,
-0.2997108, -2.509393, -3.095471, 1, 1, 1, 1, 1,
-0.2983556, 0.01572391, -2.344226, 1, 1, 1, 1, 1,
-0.2930093, 0.1871679, -0.9965199, 1, 1, 1, 1, 1,
-0.292713, -0.409065, -3.321695, 1, 1, 1, 1, 1,
-0.283554, -2.101269, -3.372227, 1, 1, 1, 1, 1,
-0.2826799, -0.1045704, -1.299501, 1, 1, 1, 1, 1,
-0.2821154, 0.1799518, -0.6956732, 1, 1, 1, 1, 1,
-0.277189, -0.8879353, -3.621582, 1, 1, 1, 1, 1,
-0.2678192, 0.05824447, -0.3538894, 1, 1, 1, 1, 1,
-0.2593207, 0.4953401, 0.4034662, 1, 1, 1, 1, 1,
-0.2549799, 1.231256, -0.695141, 1, 1, 1, 1, 1,
-0.2507383, 0.3152207, -1.074152, 1, 1, 1, 1, 1,
-0.2438318, -0.2678057, -1.267177, 1, 1, 1, 1, 1,
-0.2425645, 0.001521073, -1.786688, 1, 1, 1, 1, 1,
-0.2409811, -1.16999, -3.792452, 1, 1, 1, 1, 1,
-0.2408874, -0.4138092, -1.495478, 0, 0, 1, 1, 1,
-0.2401066, -0.4246631, -4.029197, 1, 0, 0, 1, 1,
-0.2387405, -0.2752385, -3.581283, 1, 0, 0, 1, 1,
-0.2346989, 0.6009439, -1.216537, 1, 0, 0, 1, 1,
-0.233629, -1.396508, -3.484594, 1, 0, 0, 1, 1,
-0.233515, 0.6059105, -1.332182, 1, 0, 0, 1, 1,
-0.2331705, 0.3140171, -2.197347, 0, 0, 0, 1, 1,
-0.2331628, -1.439413, -2.13701, 0, 0, 0, 1, 1,
-0.2261812, -0.3324675, -2.055369, 0, 0, 0, 1, 1,
-0.2255265, -1.791496, -3.501296, 0, 0, 0, 1, 1,
-0.2223673, -0.08809148, -2.448944, 0, 0, 0, 1, 1,
-0.2222923, 1.68823, 0.09758151, 0, 0, 0, 1, 1,
-0.2210226, 0.7261773, -0.2812805, 0, 0, 0, 1, 1,
-0.2195177, -0.08803653, -0.2533911, 1, 1, 1, 1, 1,
-0.2185192, -0.04113328, -1.57727, 1, 1, 1, 1, 1,
-0.2180621, 0.5399212, -0.3763272, 1, 1, 1, 1, 1,
-0.2106921, 0.4309027, -0.3475883, 1, 1, 1, 1, 1,
-0.2079869, -0.4526791, -2.997205, 1, 1, 1, 1, 1,
-0.2041655, 0.8286032, 0.001734515, 1, 1, 1, 1, 1,
-0.2031674, -0.3257127, -3.546198, 1, 1, 1, 1, 1,
-0.2012575, -1.178053, -3.320308, 1, 1, 1, 1, 1,
-0.1993278, 1.729604, 0.163463, 1, 1, 1, 1, 1,
-0.1983456, -0.7256391, -2.263153, 1, 1, 1, 1, 1,
-0.1981643, 0.3457646, -2.940992, 1, 1, 1, 1, 1,
-0.1974476, -0.6539036, -2.223091, 1, 1, 1, 1, 1,
-0.1968151, 0.3887042, -0.3284673, 1, 1, 1, 1, 1,
-0.1964777, 0.07812733, 0.09218179, 1, 1, 1, 1, 1,
-0.1937447, 0.1630443, -0.3038737, 1, 1, 1, 1, 1,
-0.188713, -1.187962, -3.726991, 0, 0, 1, 1, 1,
-0.1860946, -2.494604, -2.268716, 1, 0, 0, 1, 1,
-0.1853937, -0.3096272, -3.512394, 1, 0, 0, 1, 1,
-0.1798812, 1.088542, -0.1417684, 1, 0, 0, 1, 1,
-0.1790207, 0.3002779, -1.800297, 1, 0, 0, 1, 1,
-0.1764862, -0.7895383, -2.239695, 1, 0, 0, 1, 1,
-0.1740076, 0.9301358, 0.1185721, 0, 0, 0, 1, 1,
-0.172463, 1.758333, -0.6172621, 0, 0, 0, 1, 1,
-0.1673886, 0.6810848, 0.5515355, 0, 0, 0, 1, 1,
-0.167129, 0.05565865, -0.7501216, 0, 0, 0, 1, 1,
-0.161757, 1.58393, 0.503599, 0, 0, 0, 1, 1,
-0.1598482, 0.0670047, -1.085558, 0, 0, 0, 1, 1,
-0.1591432, 1.516682, -1.780657, 0, 0, 0, 1, 1,
-0.1566646, 0.8568442, 0.5490341, 1, 1, 1, 1, 1,
-0.1556018, 2.076818, -0.4544934, 1, 1, 1, 1, 1,
-0.152758, 1.268744, -1.12928, 1, 1, 1, 1, 1,
-0.1474714, 0.3158008, 0.008291139, 1, 1, 1, 1, 1,
-0.1447024, 1.410422, 1.54631, 1, 1, 1, 1, 1,
-0.1413531, -0.9042783, -2.768264, 1, 1, 1, 1, 1,
-0.1382175, 1.362872, -0.6995018, 1, 1, 1, 1, 1,
-0.1379281, 0.2837283, -2.037207, 1, 1, 1, 1, 1,
-0.1348401, -1.089111, -1.684443, 1, 1, 1, 1, 1,
-0.1315751, -0.2219385, -2.250847, 1, 1, 1, 1, 1,
-0.126746, 0.5500779, -1.864732, 1, 1, 1, 1, 1,
-0.1260177, -0.4257783, -1.681588, 1, 1, 1, 1, 1,
-0.1244169, 0.2867503, -0.8537917, 1, 1, 1, 1, 1,
-0.1241871, 0.5034424, -1.997614, 1, 1, 1, 1, 1,
-0.1237012, -0.8377857, -0.524044, 1, 1, 1, 1, 1,
-0.1229563, -0.3026315, -0.3399284, 0, 0, 1, 1, 1,
-0.1225018, 0.8578455, -1.105929, 1, 0, 0, 1, 1,
-0.1205344, 0.1456503, 0.07269641, 1, 0, 0, 1, 1,
-0.1191307, -1.009324, -2.575369, 1, 0, 0, 1, 1,
-0.1128733, -0.470961, -2.842555, 1, 0, 0, 1, 1,
-0.1110085, -0.6680582, -0.5172966, 1, 0, 0, 1, 1,
-0.1106627, -0.7784648, -4.386264, 0, 0, 0, 1, 1,
-0.1087507, -0.3290271, -1.4213, 0, 0, 0, 1, 1,
-0.108023, 1.264361, -0.6872474, 0, 0, 0, 1, 1,
-0.1028554, -0.7028872, -2.523748, 0, 0, 0, 1, 1,
-0.1009071, 0.1445133, -0.7847792, 0, 0, 0, 1, 1,
-0.0970885, 0.9067205, 0.1932949, 0, 0, 0, 1, 1,
-0.09597787, 0.3586057, -1.801217, 0, 0, 0, 1, 1,
-0.09581193, 2.101618, 0.9819391, 1, 1, 1, 1, 1,
-0.09271206, -0.4343022, -3.702741, 1, 1, 1, 1, 1,
-0.09204313, -0.9289166, -2.61408, 1, 1, 1, 1, 1,
-0.09020803, -0.04318225, -2.847112, 1, 1, 1, 1, 1,
-0.088045, 0.2411034, -0.515507, 1, 1, 1, 1, 1,
-0.08229277, 0.2634227, -0.8817906, 1, 1, 1, 1, 1,
-0.07960726, -0.2730202, -2.894831, 1, 1, 1, 1, 1,
-0.07926268, -1.951673, -2.778791, 1, 1, 1, 1, 1,
-0.07628592, -1.030899, -1.96983, 1, 1, 1, 1, 1,
-0.07564508, 2.510048, 0.5334148, 1, 1, 1, 1, 1,
-0.07561535, -1.365829, -2.770812, 1, 1, 1, 1, 1,
-0.07479081, -0.6528204, -2.275471, 1, 1, 1, 1, 1,
-0.07473988, -0.03667859, -3.147787, 1, 1, 1, 1, 1,
-0.07114645, 1.5692, -1.852855, 1, 1, 1, 1, 1,
-0.06585998, 0.5338808, 1.516434, 1, 1, 1, 1, 1,
-0.06427175, -1.247223, -2.487577, 0, 0, 1, 1, 1,
-0.0628152, -0.2667321, -3.034196, 1, 0, 0, 1, 1,
-0.06160418, 0.5182545, 0.7860405, 1, 0, 0, 1, 1,
-0.06106876, 0.05291369, -0.6610967, 1, 0, 0, 1, 1,
-0.06059578, 0.5728132, 0.1442584, 1, 0, 0, 1, 1,
-0.04672723, -0.1332244, -1.643272, 1, 0, 0, 1, 1,
-0.04514958, 1.441409, 1.301772, 0, 0, 0, 1, 1,
-0.04326655, 1.045932, 0.9596073, 0, 0, 0, 1, 1,
-0.04238713, -1.025313, -4.206044, 0, 0, 0, 1, 1,
-0.04037135, -0.08971618, -3.590139, 0, 0, 0, 1, 1,
-0.03415947, -0.06591075, -1.343843, 0, 0, 0, 1, 1,
-0.01333515, -0.7015777, -2.233426, 0, 0, 0, 1, 1,
-0.009936824, 2.101802, 0.1327191, 0, 0, 0, 1, 1,
-0.008800286, -0.2803736, -3.010043, 1, 1, 1, 1, 1,
-0.005622149, 1.705543, -0.7585987, 1, 1, 1, 1, 1,
-0.00159404, 0.1234857, -1.447832, 1, 1, 1, 1, 1,
-0.001239402, -0.7464907, -4.32312, 1, 1, 1, 1, 1,
0.0008116749, 2.203761, 0.06521004, 1, 1, 1, 1, 1,
0.0009101532, -0.1911369, 3.693665, 1, 1, 1, 1, 1,
0.01017389, -0.3527906, 2.847656, 1, 1, 1, 1, 1,
0.01404694, 1.211337, 0.7277424, 1, 1, 1, 1, 1,
0.01889366, 0.961703, -0.3673564, 1, 1, 1, 1, 1,
0.02465353, -0.2768431, 2.329448, 1, 1, 1, 1, 1,
0.02632157, 2.255403, 2.624518, 1, 1, 1, 1, 1,
0.02698885, 0.8206222, 1.39317, 1, 1, 1, 1, 1,
0.02702283, -0.7738807, 2.683815, 1, 1, 1, 1, 1,
0.03618593, 0.7616806, -0.05185954, 1, 1, 1, 1, 1,
0.04567109, 1.362423, -1.698924, 1, 1, 1, 1, 1,
0.0486553, -0.2753913, 1.348554, 0, 0, 1, 1, 1,
0.05129057, 2.008109, 0.5979637, 1, 0, 0, 1, 1,
0.05218453, -1.042333, 1.133482, 1, 0, 0, 1, 1,
0.05220648, 0.9072118, -0.2353629, 1, 0, 0, 1, 1,
0.05327164, -0.8704206, 3.03046, 1, 0, 0, 1, 1,
0.05456616, 0.2947982, 0.5432834, 1, 0, 0, 1, 1,
0.05601063, 0.2952003, 0.02114896, 0, 0, 0, 1, 1,
0.05765558, -1.525359, 4.03096, 0, 0, 0, 1, 1,
0.05929375, -0.8733633, 4.017261, 0, 0, 0, 1, 1,
0.05974114, -0.006744193, 0.5109979, 0, 0, 0, 1, 1,
0.06349979, 0.1396417, -0.1620057, 0, 0, 0, 1, 1,
0.06524583, -0.1165928, 3.320255, 0, 0, 0, 1, 1,
0.06857929, 1.213646, -0.1832858, 0, 0, 0, 1, 1,
0.06905792, 1.974891, -0.001628375, 1, 1, 1, 1, 1,
0.06925692, 0.9527281, -1.367925, 1, 1, 1, 1, 1,
0.07502332, 0.1949166, -0.3391218, 1, 1, 1, 1, 1,
0.07640647, 0.7571028, -1.215719, 1, 1, 1, 1, 1,
0.07666511, 1.147419, 0.3398314, 1, 1, 1, 1, 1,
0.07799235, -1.063247, 4.211963, 1, 1, 1, 1, 1,
0.07868504, 1.279954, 1.191914, 1, 1, 1, 1, 1,
0.08067141, 0.5771359, 0.6266273, 1, 1, 1, 1, 1,
0.08255574, 0.1897227, 0.5699378, 1, 1, 1, 1, 1,
0.09072376, 0.725183, 0.5496953, 1, 1, 1, 1, 1,
0.09135053, -0.334454, 2.467191, 1, 1, 1, 1, 1,
0.09242291, 0.1452197, 1.322391, 1, 1, 1, 1, 1,
0.09325267, 0.5126724, 1.438426, 1, 1, 1, 1, 1,
0.0952131, 0.2529657, 0.1775373, 1, 1, 1, 1, 1,
0.0959169, -0.4703817, 5.094558, 1, 1, 1, 1, 1,
0.09999745, 1.135395, -0.3368765, 0, 0, 1, 1, 1,
0.1003359, -0.5548296, 3.860828, 1, 0, 0, 1, 1,
0.1019269, -0.04182496, 0.561051, 1, 0, 0, 1, 1,
0.1036988, -0.6212743, 2.247739, 1, 0, 0, 1, 1,
0.1048763, 1.352782, 1.420926, 1, 0, 0, 1, 1,
0.1054437, -1.526237, 3.200588, 1, 0, 0, 1, 1,
0.109382, -0.4911976, 2.68069, 0, 0, 0, 1, 1,
0.1141766, 0.8783624, 0.4703411, 0, 0, 0, 1, 1,
0.1145791, -0.3772097, 3.487238, 0, 0, 0, 1, 1,
0.1182349, -0.4114352, 1.991303, 0, 0, 0, 1, 1,
0.1187883, 1.151373, 0.357896, 0, 0, 0, 1, 1,
0.1192494, -1.313797, 1.058438, 0, 0, 0, 1, 1,
0.1209029, 1.570407, -0.04087323, 0, 0, 0, 1, 1,
0.1242687, 0.1796779, -0.9409288, 1, 1, 1, 1, 1,
0.1251462, 1.49935, 1.258763, 1, 1, 1, 1, 1,
0.1258621, 0.1511649, 1.113095, 1, 1, 1, 1, 1,
0.1266026, 0.4497903, 0.328607, 1, 1, 1, 1, 1,
0.1274144, 0.06318045, 0.7078988, 1, 1, 1, 1, 1,
0.1276912, 0.7415857, 1.173933, 1, 1, 1, 1, 1,
0.1287889, 1.427711, 1.943304, 1, 1, 1, 1, 1,
0.1289547, -1.14356, 3.645313, 1, 1, 1, 1, 1,
0.1324775, -0.2305116, 2.411938, 1, 1, 1, 1, 1,
0.1348473, -0.7202039, 3.801452, 1, 1, 1, 1, 1,
0.1360415, -0.2607713, 2.278196, 1, 1, 1, 1, 1,
0.1367995, 0.1312778, -1.130859, 1, 1, 1, 1, 1,
0.1370526, 0.3872543, -1.354455, 1, 1, 1, 1, 1,
0.1374974, -0.1841206, 3.452704, 1, 1, 1, 1, 1,
0.1378995, 0.9146336, -0.1591334, 1, 1, 1, 1, 1,
0.1496536, -0.372541, 1.856513, 0, 0, 1, 1, 1,
0.1497874, 3.096021, 0.3851491, 1, 0, 0, 1, 1,
0.1558027, -0.7293345, 1.68608, 1, 0, 0, 1, 1,
0.1583678, 0.7293219, -0.2177091, 1, 0, 0, 1, 1,
0.1618486, -0.8253315, 3.854453, 1, 0, 0, 1, 1,
0.1633396, -0.4646662, 1.933934, 1, 0, 0, 1, 1,
0.1663942, -0.8513302, 2.999807, 0, 0, 0, 1, 1,
0.1667715, -0.008168648, 1.22218, 0, 0, 0, 1, 1,
0.1697772, 2.183793, 0.4381484, 0, 0, 0, 1, 1,
0.1741701, -0.05803752, 3.004525, 0, 0, 0, 1, 1,
0.1751248, -1.684481, 1.569365, 0, 0, 0, 1, 1,
0.1760388, 1.214636, -0.7739584, 0, 0, 0, 1, 1,
0.1809745, 0.01871674, 2.569434, 0, 0, 0, 1, 1,
0.1844467, -0.862781, 3.627792, 1, 1, 1, 1, 1,
0.1868774, -0.09077304, 1.108718, 1, 1, 1, 1, 1,
0.1891988, 0.2442831, 0.09378201, 1, 1, 1, 1, 1,
0.1892899, 0.901783, 0.4140924, 1, 1, 1, 1, 1,
0.1905285, 0.6018566, -0.999616, 1, 1, 1, 1, 1,
0.1929756, 0.1330817, 0.2239096, 1, 1, 1, 1, 1,
0.1957164, 0.1578088, 3.534819, 1, 1, 1, 1, 1,
0.1972104, 0.7314205, -0.5395678, 1, 1, 1, 1, 1,
0.2050359, -0.7003751, 3.864326, 1, 1, 1, 1, 1,
0.2249961, -0.494404, 3.353064, 1, 1, 1, 1, 1,
0.2282085, 2.023739, -0.9768951, 1, 1, 1, 1, 1,
0.2306525, -1.753885, 2.134089, 1, 1, 1, 1, 1,
0.2400322, -1.896889, 2.211516, 1, 1, 1, 1, 1,
0.2415891, -1.891758, 3.036503, 1, 1, 1, 1, 1,
0.242376, 0.328406, 1.045241, 1, 1, 1, 1, 1,
0.2443756, 0.3695956, -0.787463, 0, 0, 1, 1, 1,
0.2471471, -0.399499, 4.277448, 1, 0, 0, 1, 1,
0.2476658, -0.8338459, 3.066708, 1, 0, 0, 1, 1,
0.2483667, 1.61334, -0.1302856, 1, 0, 0, 1, 1,
0.2506503, 0.2858547, 0.01190649, 1, 0, 0, 1, 1,
0.2600853, 0.9874688, -0.190529, 1, 0, 0, 1, 1,
0.2693383, -0.3516764, 1.741001, 0, 0, 0, 1, 1,
0.2711885, -1.408895, 3.002179, 0, 0, 0, 1, 1,
0.2741162, 0.7090328, 1.061166, 0, 0, 0, 1, 1,
0.2758351, -0.03998606, 3.081685, 0, 0, 0, 1, 1,
0.2758843, 0.8543261, 0.1930508, 0, 0, 0, 1, 1,
0.2795571, -0.5775938, 3.497939, 0, 0, 0, 1, 1,
0.2801374, 1.479551, 1.036204, 0, 0, 0, 1, 1,
0.2833102, 0.5820909, -1.477203, 1, 1, 1, 1, 1,
0.2883576, 1.604669, 1.861451, 1, 1, 1, 1, 1,
0.2891019, 1.007672, -0.2673325, 1, 1, 1, 1, 1,
0.2945962, -1.674335, 3.75637, 1, 1, 1, 1, 1,
0.3011408, 0.4204557, 1.036916, 1, 1, 1, 1, 1,
0.3063983, -0.9270068, 3.310342, 1, 1, 1, 1, 1,
0.3122337, -0.2420764, 3.266179, 1, 1, 1, 1, 1,
0.3136775, 0.2554616, -0.1513476, 1, 1, 1, 1, 1,
0.3209067, -1.077673, 3.288196, 1, 1, 1, 1, 1,
0.3234246, -1.177927, 3.70728, 1, 1, 1, 1, 1,
0.3241832, 0.261676, 2.739265, 1, 1, 1, 1, 1,
0.329985, 1.333953, 0.4525203, 1, 1, 1, 1, 1,
0.3300126, -0.2023045, 3.541248, 1, 1, 1, 1, 1,
0.3301962, 0.6812028, 1.221738, 1, 1, 1, 1, 1,
0.330689, -0.3356495, 2.518543, 1, 1, 1, 1, 1,
0.3326167, 0.1808241, 2.21749, 0, 0, 1, 1, 1,
0.337443, -0.4866517, 1.559065, 1, 0, 0, 1, 1,
0.3464728, 1.803228, 0.3444425, 1, 0, 0, 1, 1,
0.3512227, 0.3939267, 0.7389355, 1, 0, 0, 1, 1,
0.3512703, -0.4850678, 3.25305, 1, 0, 0, 1, 1,
0.354665, 1.42997, -1.029716, 1, 0, 0, 1, 1,
0.3597192, 0.7751897, 0.3881773, 0, 0, 0, 1, 1,
0.3613141, -0.3595446, 1.184573, 0, 0, 0, 1, 1,
0.3633859, 0.1968791, 3.270694, 0, 0, 0, 1, 1,
0.3660786, 0.1414528, 1.301056, 0, 0, 0, 1, 1,
0.3746212, -0.9259074, 3.693568, 0, 0, 0, 1, 1,
0.3814656, -0.3632737, 1.285927, 0, 0, 0, 1, 1,
0.3834249, -0.2765104, 1.433708, 0, 0, 0, 1, 1,
0.3834578, 0.3908327, 0.9370511, 1, 1, 1, 1, 1,
0.3854868, 0.2426187, 1.960754, 1, 1, 1, 1, 1,
0.3869633, 0.1433346, 1.601818, 1, 1, 1, 1, 1,
0.3888555, 0.0814238, 0.4264179, 1, 1, 1, 1, 1,
0.3925095, -1.055487, 2.936698, 1, 1, 1, 1, 1,
0.3951182, 0.1884125, 0.1744986, 1, 1, 1, 1, 1,
0.3970333, 0.2675863, 0.2794087, 1, 1, 1, 1, 1,
0.3993334, -0.6595813, 3.311514, 1, 1, 1, 1, 1,
0.4053557, 0.5827107, -0.4924015, 1, 1, 1, 1, 1,
0.4071014, -0.5455077, 0.1446156, 1, 1, 1, 1, 1,
0.407481, 1.32469, -1.09042, 1, 1, 1, 1, 1,
0.4135233, -1.068876, 3.407332, 1, 1, 1, 1, 1,
0.4135719, -0.2975805, 0.3568457, 1, 1, 1, 1, 1,
0.4148349, 0.6080942, 0.09274236, 1, 1, 1, 1, 1,
0.4150807, 0.662081, 1.212341, 1, 1, 1, 1, 1,
0.420343, -0.7992197, 2.444169, 0, 0, 1, 1, 1,
0.4212279, -0.1527377, 1.357657, 1, 0, 0, 1, 1,
0.4218965, -0.1804067, 1.156194, 1, 0, 0, 1, 1,
0.425011, -0.4408982, 1.960689, 1, 0, 0, 1, 1,
0.4262179, 1.277635, 1.241415, 1, 0, 0, 1, 1,
0.4281518, 1.892058, 0.2071322, 1, 0, 0, 1, 1,
0.4282661, -2.946941, 2.198389, 0, 0, 0, 1, 1,
0.4319586, 0.6971151, 0.3664365, 0, 0, 0, 1, 1,
0.4320351, -0.2382246, 1.672505, 0, 0, 0, 1, 1,
0.4343853, 0.9351157, 0.1124582, 0, 0, 0, 1, 1,
0.4386223, 0.5920751, -0.5443245, 0, 0, 0, 1, 1,
0.44011, -0.09479325, 2.499705, 0, 0, 0, 1, 1,
0.4414025, -0.7056788, 2.293845, 0, 0, 0, 1, 1,
0.4437944, 0.3173879, 1.76562, 1, 1, 1, 1, 1,
0.4477667, -0.424204, 2.878256, 1, 1, 1, 1, 1,
0.4486131, -0.5022334, 3.248341, 1, 1, 1, 1, 1,
0.4528333, 0.4443325, 1.588624, 1, 1, 1, 1, 1,
0.4581967, 1.698682, -1.252245, 1, 1, 1, 1, 1,
0.4582717, 0.7179055, -0.1907386, 1, 1, 1, 1, 1,
0.4598721, 0.006585849, 4.171779, 1, 1, 1, 1, 1,
0.4656814, -0.961634, 2.675689, 1, 1, 1, 1, 1,
0.4672472, 2.001719, 0.4598338, 1, 1, 1, 1, 1,
0.4673647, -0.1340102, 2.609221, 1, 1, 1, 1, 1,
0.475753, 0.2979375, 1.10012, 1, 1, 1, 1, 1,
0.477478, 1.709326, 0.3391427, 1, 1, 1, 1, 1,
0.4789609, -1.68011, 3.238324, 1, 1, 1, 1, 1,
0.4791635, -1.988812, 3.335319, 1, 1, 1, 1, 1,
0.4796014, -0.9377586, 2.307318, 1, 1, 1, 1, 1,
0.4799499, 0.5765915, -0.2217128, 0, 0, 1, 1, 1,
0.4836882, 1.814852, -0.7922192, 1, 0, 0, 1, 1,
0.4887483, -0.4302405, 0.7742348, 1, 0, 0, 1, 1,
0.4888621, -0.6712978, 2.550998, 1, 0, 0, 1, 1,
0.489887, -0.8569252, 3.15414, 1, 0, 0, 1, 1,
0.4901602, 0.3249996, 1.880497, 1, 0, 0, 1, 1,
0.4951197, 0.6807623, 0.9070714, 0, 0, 0, 1, 1,
0.4953463, 1.035815, -0.2037664, 0, 0, 0, 1, 1,
0.4967217, -0.5965582, 3.383456, 0, 0, 0, 1, 1,
0.4975949, 0.1879079, 0.6595494, 0, 0, 0, 1, 1,
0.4994811, -0.8812216, 2.73841, 0, 0, 0, 1, 1,
0.5054725, 0.919341, 0.7231936, 0, 0, 0, 1, 1,
0.5062144, -0.3428823, 3.114416, 0, 0, 0, 1, 1,
0.5075712, 0.2600333, 1.362907, 1, 1, 1, 1, 1,
0.5126517, 1.694465, 0.3633295, 1, 1, 1, 1, 1,
0.5143976, 1.001004, 1.128333, 1, 1, 1, 1, 1,
0.517957, 0.8477685, -1.461504, 1, 1, 1, 1, 1,
0.5184952, -0.05581944, 0.3202754, 1, 1, 1, 1, 1,
0.5197619, -0.4020089, 3.68555, 1, 1, 1, 1, 1,
0.5230469, 2.669509, 1.167066, 1, 1, 1, 1, 1,
0.5241607, 1.058252, 0.05477051, 1, 1, 1, 1, 1,
0.525394, 1.99808, 1.721006, 1, 1, 1, 1, 1,
0.5315501, -0.9461241, 3.821496, 1, 1, 1, 1, 1,
0.5350487, 0.6182573, 0.0611417, 1, 1, 1, 1, 1,
0.5396805, -0.2326243, 2.546475, 1, 1, 1, 1, 1,
0.5398214, 0.9508418, -2.443833, 1, 1, 1, 1, 1,
0.5407402, -0.491741, 2.831569, 1, 1, 1, 1, 1,
0.5424821, 0.8177789, 1.819417, 1, 1, 1, 1, 1,
0.5432952, -0.6002282, 1.653749, 0, 0, 1, 1, 1,
0.5449914, 0.8342881, 1.537502, 1, 0, 0, 1, 1,
0.5496174, -0.2369709, 2.458616, 1, 0, 0, 1, 1,
0.5519896, -0.2903067, 1.003563, 1, 0, 0, 1, 1,
0.5575331, 0.2967247, 0.1323899, 1, 0, 0, 1, 1,
0.5581167, 0.584341, -1.684066, 1, 0, 0, 1, 1,
0.5591394, -0.4820973, 2.065537, 0, 0, 0, 1, 1,
0.5601584, 0.8333324, -1.446451, 0, 0, 0, 1, 1,
0.5605938, -3.225144, 3.644916, 0, 0, 0, 1, 1,
0.5607765, 0.4466073, 0.6557672, 0, 0, 0, 1, 1,
0.5613883, 0.2098575, 2.502277, 0, 0, 0, 1, 1,
0.5662665, 0.8829312, 2.499451, 0, 0, 0, 1, 1,
0.5680986, 0.02037041, 1.786727, 0, 0, 0, 1, 1,
0.5692484, 0.5904921, -0.04183548, 1, 1, 1, 1, 1,
0.5704207, -0.6160052, 2.00131, 1, 1, 1, 1, 1,
0.5754319, -0.04432385, 0.7244163, 1, 1, 1, 1, 1,
0.5767593, -0.4509017, 2.399317, 1, 1, 1, 1, 1,
0.584176, -0.86353, 3.153745, 1, 1, 1, 1, 1,
0.5843166, 0.9903708, 0.5408611, 1, 1, 1, 1, 1,
0.5851359, -0.6338972, 2.029783, 1, 1, 1, 1, 1,
0.5881536, -2.342526, 2.647678, 1, 1, 1, 1, 1,
0.5883229, 1.827215, 1.317979, 1, 1, 1, 1, 1,
0.5895522, -1.472394, 2.075727, 1, 1, 1, 1, 1,
0.5971946, 0.5056815, 2.047234, 1, 1, 1, 1, 1,
0.5975061, 1.848946, 0.492842, 1, 1, 1, 1, 1,
0.6052384, -1.546807, 4.171433, 1, 1, 1, 1, 1,
0.6070002, -1.808659, 3.116526, 1, 1, 1, 1, 1,
0.6073406, -0.03941204, 0.753302, 1, 1, 1, 1, 1,
0.6098639, -1.025953, 2.489137, 0, 0, 1, 1, 1,
0.6158435, 0.4598865, 0.8199171, 1, 0, 0, 1, 1,
0.6173772, -0.346305, 2.73701, 1, 0, 0, 1, 1,
0.6187235, 0.6639469, 1.641328, 1, 0, 0, 1, 1,
0.6212639, 0.6239164, 0.9021904, 1, 0, 0, 1, 1,
0.6218237, 0.7652447, 1.355406, 1, 0, 0, 1, 1,
0.6218442, -0.6946572, 1.469803, 0, 0, 0, 1, 1,
0.6223511, -0.2413783, 0.2318822, 0, 0, 0, 1, 1,
0.6277644, -2.316775, 2.002371, 0, 0, 0, 1, 1,
0.6285045, -0.1240711, 1.945741, 0, 0, 0, 1, 1,
0.630159, -2.088045, 1.644606, 0, 0, 0, 1, 1,
0.6312059, 0.1811475, 0.893178, 0, 0, 0, 1, 1,
0.6379068, -0.5017389, 0.8131082, 0, 0, 0, 1, 1,
0.6414376, 1.850435, 0.5643519, 1, 1, 1, 1, 1,
0.6504011, 0.1813239, 0.5968705, 1, 1, 1, 1, 1,
0.6510264, 0.09699922, 2.164389, 1, 1, 1, 1, 1,
0.6516894, 0.08527242, 2.722112, 1, 1, 1, 1, 1,
0.6531101, 1.013594, 0.9060338, 1, 1, 1, 1, 1,
0.6547738, -1.456501, 2.387439, 1, 1, 1, 1, 1,
0.6554105, 1.420815, 2.552855, 1, 1, 1, 1, 1,
0.6603279, -0.06660475, 1.190209, 1, 1, 1, 1, 1,
0.6626188, 0.4811656, -0.2718832, 1, 1, 1, 1, 1,
0.6673519, -3.011085, 1.34632, 1, 1, 1, 1, 1,
0.6682625, 1.489539, 0.2501962, 1, 1, 1, 1, 1,
0.6684623, -0.3926085, 0.1476947, 1, 1, 1, 1, 1,
0.676237, 0.3251742, 1.478477, 1, 1, 1, 1, 1,
0.6773474, 0.1195571, 2.429811, 1, 1, 1, 1, 1,
0.6779673, 2.259514, 0.6368417, 1, 1, 1, 1, 1,
0.6871343, 1.087406, -0.5715225, 0, 0, 1, 1, 1,
0.6877666, -1.165461, 0.5264947, 1, 0, 0, 1, 1,
0.687914, -1.518395, 2.499021, 1, 0, 0, 1, 1,
0.6954395, 0.4902707, 1.625899, 1, 0, 0, 1, 1,
0.6991697, 2.080595, 0.5532978, 1, 0, 0, 1, 1,
0.7009324, -0.7108942, 0.4370178, 1, 0, 0, 1, 1,
0.7047085, -0.4506978, 1.904995, 0, 0, 0, 1, 1,
0.7132258, -1.71379, 2.716122, 0, 0, 0, 1, 1,
0.7134537, 0.2081888, 2.251861, 0, 0, 0, 1, 1,
0.7157034, 0.1997669, 1.717788, 0, 0, 0, 1, 1,
0.7167158, -0.4784422, 1.12716, 0, 0, 0, 1, 1,
0.7213578, -1.074331, 2.774774, 0, 0, 0, 1, 1,
0.7263363, -1.967235, 2.525414, 0, 0, 0, 1, 1,
0.7315016, -0.4438164, 2.805035, 1, 1, 1, 1, 1,
0.7331646, -0.1754709, 3.209457, 1, 1, 1, 1, 1,
0.7364743, 0.4585278, 2.465129, 1, 1, 1, 1, 1,
0.7504683, -0.1452787, 3.339759, 1, 1, 1, 1, 1,
0.7668444, 0.6857682, 0.6166587, 1, 1, 1, 1, 1,
0.7684309, -1.053813, 2.876998, 1, 1, 1, 1, 1,
0.7687662, 1.490755, -0.931165, 1, 1, 1, 1, 1,
0.7705119, 0.250039, 0.7565027, 1, 1, 1, 1, 1,
0.7733641, 0.9097673, 0.3349779, 1, 1, 1, 1, 1,
0.7751608, -0.2481984, 0.9178484, 1, 1, 1, 1, 1,
0.776103, 0.8002873, 1.475201, 1, 1, 1, 1, 1,
0.7781666, -0.5671166, -0.8427598, 1, 1, 1, 1, 1,
0.7816597, 1.091537, 0.5816531, 1, 1, 1, 1, 1,
0.7828709, 1.089499, -0.3708202, 1, 1, 1, 1, 1,
0.7838714, 2.193906, 2.562429, 1, 1, 1, 1, 1,
0.7851673, -0.6181442, 3.858012, 0, 0, 1, 1, 1,
0.7852723, 0.3156229, 0.9340209, 1, 0, 0, 1, 1,
0.7900131, -0.01081196, 1.889503, 1, 0, 0, 1, 1,
0.7921588, -1.335427, 1.575153, 1, 0, 0, 1, 1,
0.8054554, 0.172781, 2.748641, 1, 0, 0, 1, 1,
0.8138347, -0.0200095, 0.8672938, 1, 0, 0, 1, 1,
0.8173919, 0.7862011, 0.1837128, 0, 0, 0, 1, 1,
0.8217171, 0.7809854, 1.434035, 0, 0, 0, 1, 1,
0.8247854, 0.01048877, 1.874861, 0, 0, 0, 1, 1,
0.8306185, 0.2787846, 2.437326, 0, 0, 0, 1, 1,
0.8306262, 0.8653282, -0.6064703, 0, 0, 0, 1, 1,
0.8327461, -1.764282, 3.758022, 0, 0, 0, 1, 1,
0.8344038, 0.9056347, 0.4168273, 0, 0, 0, 1, 1,
0.8357109, 1.040728, 0.7874822, 1, 1, 1, 1, 1,
0.8523844, 0.1954229, 1.243011, 1, 1, 1, 1, 1,
0.8532361, 0.6575105, 1.2938, 1, 1, 1, 1, 1,
0.8536486, -1.715134, 2.989864, 1, 1, 1, 1, 1,
0.8627853, -1.548431, 3.194441, 1, 1, 1, 1, 1,
0.8649065, -0.3167478, 3.179617, 1, 1, 1, 1, 1,
0.8736756, 0.02653567, 1.46334, 1, 1, 1, 1, 1,
0.8760586, -0.2576675, 1.669221, 1, 1, 1, 1, 1,
0.8785227, 0.7606137, -0.2136658, 1, 1, 1, 1, 1,
0.8816371, 1.666859, 0.1217737, 1, 1, 1, 1, 1,
0.8839759, -1.220153, 1.192393, 1, 1, 1, 1, 1,
0.8851779, -0.1259062, 0.693553, 1, 1, 1, 1, 1,
0.9122013, -0.4330894, 0.6598189, 1, 1, 1, 1, 1,
0.913985, -0.3918483, -0.2203932, 1, 1, 1, 1, 1,
0.9183643, 1.10256, 2.73408, 1, 1, 1, 1, 1,
0.9203781, -0.6821439, 0.4321432, 0, 0, 1, 1, 1,
0.9279722, 0.3237406, 1.621717, 1, 0, 0, 1, 1,
0.9305025, 0.3154408, -0.4008802, 1, 0, 0, 1, 1,
0.9321096, 0.8506995, 1.16676, 1, 0, 0, 1, 1,
0.9342443, 0.4688536, 0.7331821, 1, 0, 0, 1, 1,
0.9374377, -0.1349931, 1.168758, 1, 0, 0, 1, 1,
0.9381568, 0.0177382, 0.558561, 0, 0, 0, 1, 1,
0.9457494, 1.056276, 1.33507, 0, 0, 0, 1, 1,
0.9471704, -0.3404953, 1.345043, 0, 0, 0, 1, 1,
0.9608979, -1.298159, 1.301298, 0, 0, 0, 1, 1,
0.9632245, 0.4004582, 2.032161, 0, 0, 0, 1, 1,
0.9639813, 0.2887414, -1.075605, 0, 0, 0, 1, 1,
0.9692863, -0.1310932, 0.8938975, 0, 0, 0, 1, 1,
0.9719282, -0.2357026, 2.194659, 1, 1, 1, 1, 1,
0.9729478, 1.312877, 0.78485, 1, 1, 1, 1, 1,
0.9741986, 0.2589163, -0.5839369, 1, 1, 1, 1, 1,
0.9757287, 0.8269088, 1.224714, 1, 1, 1, 1, 1,
0.9837926, 0.862735, 1.502488, 1, 1, 1, 1, 1,
0.9884473, 1.046974, 0.6013806, 1, 1, 1, 1, 1,
0.9934932, -0.2288108, 3.788416, 1, 1, 1, 1, 1,
0.9958223, -1.27769, 0.9442701, 1, 1, 1, 1, 1,
1.010202, -0.9413154, 3.298593, 1, 1, 1, 1, 1,
1.013185, -0.9735008, 1.154411, 1, 1, 1, 1, 1,
1.023911, 0.2362941, 0.1548748, 1, 1, 1, 1, 1,
1.028289, -0.9527549, 2.066964, 1, 1, 1, 1, 1,
1.028937, 0.3898031, 0.41428, 1, 1, 1, 1, 1,
1.036586, 0.8104466, 0.6198925, 1, 1, 1, 1, 1,
1.038205, -1.062106, 2.664394, 1, 1, 1, 1, 1,
1.040305, 2.107947, 1.948229, 0, 0, 1, 1, 1,
1.042234, -1.519262, 0.7296454, 1, 0, 0, 1, 1,
1.043264, -0.7372531, 1.6692, 1, 0, 0, 1, 1,
1.047959, -1.790892, 3.400934, 1, 0, 0, 1, 1,
1.057839, -0.2676886, 1.424907, 1, 0, 0, 1, 1,
1.069865, 1.136019, 0.5965601, 1, 0, 0, 1, 1,
1.072602, 0.8002399, 0.7433673, 0, 0, 0, 1, 1,
1.074245, 0.8448241, 0.2061397, 0, 0, 0, 1, 1,
1.0781, -0.4446194, 2.576823, 0, 0, 0, 1, 1,
1.080119, 0.4031032, 1.24185, 0, 0, 0, 1, 1,
1.082705, -1.267481, 3.258315, 0, 0, 0, 1, 1,
1.083418, 1.000183, 2.233398, 0, 0, 0, 1, 1,
1.086081, 0.856425, 1.42512, 0, 0, 0, 1, 1,
1.086336, 1.003608, 0.8888218, 1, 1, 1, 1, 1,
1.089237, 0.9789816, -0.1577108, 1, 1, 1, 1, 1,
1.09138, -1.055561, 2.405929, 1, 1, 1, 1, 1,
1.092175, -0.3734727, 1.447235, 1, 1, 1, 1, 1,
1.096144, -0.7958404, 1.562112, 1, 1, 1, 1, 1,
1.100872, -0.8784477, 2.000029, 1, 1, 1, 1, 1,
1.105059, -0.7889474, 1.548657, 1, 1, 1, 1, 1,
1.11893, 1.57123, 0.1193043, 1, 1, 1, 1, 1,
1.126161, -1.287897, 2.074392, 1, 1, 1, 1, 1,
1.127061, 0.4925989, 1.508137, 1, 1, 1, 1, 1,
1.128224, 1.113722, 0.1427344, 1, 1, 1, 1, 1,
1.132156, -0.2525007, 2.970353, 1, 1, 1, 1, 1,
1.144301, -0.4679183, 1.477299, 1, 1, 1, 1, 1,
1.147665, -0.08821291, 1.435589, 1, 1, 1, 1, 1,
1.147668, 0.4152388, 1.929534, 1, 1, 1, 1, 1,
1.148362, 1.251413, 1.758157, 0, 0, 1, 1, 1,
1.148672, 0.3140788, 0.2222441, 1, 0, 0, 1, 1,
1.151205, -0.7123449, 2.703002, 1, 0, 0, 1, 1,
1.164726, -0.6808411, 2.138118, 1, 0, 0, 1, 1,
1.164766, 0.147704, 0.8098761, 1, 0, 0, 1, 1,
1.164882, 0.9523719, 1.55345, 1, 0, 0, 1, 1,
1.167419, 0.4335896, 1.817109, 0, 0, 0, 1, 1,
1.167873, 0.387895, 2.079814, 0, 0, 0, 1, 1,
1.170176, -0.56736, 4.075738, 0, 0, 0, 1, 1,
1.172642, 0.02012409, 2.016697, 0, 0, 0, 1, 1,
1.181775, 1.144218, 1.642011, 0, 0, 0, 1, 1,
1.18323, 0.5836337, 0.9228878, 0, 0, 0, 1, 1,
1.19237, -0.6088005, 1.399027, 0, 0, 0, 1, 1,
1.20824, 1.750636, 0.2048477, 1, 1, 1, 1, 1,
1.219619, 0.4680748, 0.8004529, 1, 1, 1, 1, 1,
1.222693, -2.107231, 2.560907, 1, 1, 1, 1, 1,
1.239799, 2.418033, -0.2111228, 1, 1, 1, 1, 1,
1.247589, -0.5619984, 3.038833, 1, 1, 1, 1, 1,
1.249738, -0.01776783, 2.297276, 1, 1, 1, 1, 1,
1.25033, 0.1929044, 1.398083, 1, 1, 1, 1, 1,
1.25192, -0.2432284, 0.7829556, 1, 1, 1, 1, 1,
1.254342, 1.282175, 0.9110096, 1, 1, 1, 1, 1,
1.256407, 0.3970184, 0.1227318, 1, 1, 1, 1, 1,
1.25886, -0.6634145, 3.161953, 1, 1, 1, 1, 1,
1.274107, 1.367707, 0.1265818, 1, 1, 1, 1, 1,
1.275453, -0.8878327, 2.806187, 1, 1, 1, 1, 1,
1.277377, 1.245032, -0.9615874, 1, 1, 1, 1, 1,
1.28251, -0.02980449, 1.708746, 1, 1, 1, 1, 1,
1.288879, 0.5841956, -0.3783916, 0, 0, 1, 1, 1,
1.292087, -0.78655, 2.075402, 1, 0, 0, 1, 1,
1.29472, -0.0731965, 0.2297745, 1, 0, 0, 1, 1,
1.303532, 1.760398, 1.19483, 1, 0, 0, 1, 1,
1.305976, -0.07904556, 3.490048, 1, 0, 0, 1, 1,
1.310271, -0.0299688, 2.108227, 1, 0, 0, 1, 1,
1.311108, -0.7613053, 3.028502, 0, 0, 0, 1, 1,
1.31292, -0.3990765, 3.068382, 0, 0, 0, 1, 1,
1.335201, -0.2219959, -0.379273, 0, 0, 0, 1, 1,
1.336832, -1.176397, 3.034062, 0, 0, 0, 1, 1,
1.33741, 0.5397094, 1.062764, 0, 0, 0, 1, 1,
1.339791, -0.3370514, 3.371475, 0, 0, 0, 1, 1,
1.339874, -0.6397328, 0.5590408, 0, 0, 0, 1, 1,
1.345709, 0.3645585, 1.633866, 1, 1, 1, 1, 1,
1.351895, -1.145816, 0.3507226, 1, 1, 1, 1, 1,
1.380957, 1.182219, -0.3785017, 1, 1, 1, 1, 1,
1.386573, -0.1612416, 1.527966, 1, 1, 1, 1, 1,
1.390016, -0.2019666, 2.576188, 1, 1, 1, 1, 1,
1.399066, -1.334497, 3.290958, 1, 1, 1, 1, 1,
1.410262, 0.4018737, 2.813722, 1, 1, 1, 1, 1,
1.414998, -2.58757, 3.099309, 1, 1, 1, 1, 1,
1.417768, 0.5014474, 1.556648, 1, 1, 1, 1, 1,
1.422605, -0.6641397, 1.807179, 1, 1, 1, 1, 1,
1.444455, 1.897904, 0.1301593, 1, 1, 1, 1, 1,
1.444713, -1.532376, 2.647627, 1, 1, 1, 1, 1,
1.455842, 0.4059129, 2.284564, 1, 1, 1, 1, 1,
1.460409, -0.9825884, 2.045662, 1, 1, 1, 1, 1,
1.462144, 0.134699, 1.530674, 1, 1, 1, 1, 1,
1.475917, -0.4663244, 2.872213, 0, 0, 1, 1, 1,
1.477483, 1.145127, 0.6922156, 1, 0, 0, 1, 1,
1.484214, 1.437108, 1.164844, 1, 0, 0, 1, 1,
1.497329, 0.58374, 2.507342, 1, 0, 0, 1, 1,
1.526207, -0.5556647, 3.124501, 1, 0, 0, 1, 1,
1.537005, -0.2621016, 0.8323324, 1, 0, 0, 1, 1,
1.545227, -0.7075402, 2.750709, 0, 0, 0, 1, 1,
1.548045, -0.2611564, 0.6773653, 0, 0, 0, 1, 1,
1.555118, 1.417431, 0.7471429, 0, 0, 0, 1, 1,
1.565392, 0.02197611, 0.9330355, 0, 0, 0, 1, 1,
1.590224, -1.04161, 0.3732987, 0, 0, 0, 1, 1,
1.621752, -0.01390652, 0.3859163, 0, 0, 0, 1, 1,
1.641721, -1.330655, 1.209734, 0, 0, 0, 1, 1,
1.645387, -0.3846153, 0.4519518, 1, 1, 1, 1, 1,
1.65983, -0.4536013, 1.650233, 1, 1, 1, 1, 1,
1.676745, 1.150178, 2.131405, 1, 1, 1, 1, 1,
1.680139, 0.7954, 1.102161, 1, 1, 1, 1, 1,
1.681953, 1.900694, 0.8580704, 1, 1, 1, 1, 1,
1.68467, 0.1080324, 2.032851, 1, 1, 1, 1, 1,
1.695042, -1.639674, 3.153898, 1, 1, 1, 1, 1,
1.695829, 0.3697191, 2.878066, 1, 1, 1, 1, 1,
1.700563, 1.498298, -0.4571434, 1, 1, 1, 1, 1,
1.705439, 0.4608341, 0.7934983, 1, 1, 1, 1, 1,
1.708642, -0.2600082, 0.8655112, 1, 1, 1, 1, 1,
1.711517, 0.3343154, 1.046196, 1, 1, 1, 1, 1,
1.730329, -1.579293, 2.731458, 1, 1, 1, 1, 1,
1.761365, -1.046443, 1.225942, 1, 1, 1, 1, 1,
1.770213, -0.4798371, 2.189567, 1, 1, 1, 1, 1,
1.785345, 0.212471, -0.2367902, 0, 0, 1, 1, 1,
1.817159, -0.2102512, 1.917156, 1, 0, 0, 1, 1,
1.825251, 2.048479, 1.70442, 1, 0, 0, 1, 1,
1.842175, 0.860482, 1.962422, 1, 0, 0, 1, 1,
1.853937, -1.832039, 2.543844, 1, 0, 0, 1, 1,
1.856832, -1.422557, 1.568347, 1, 0, 0, 1, 1,
1.875431, -0.0969518, 0.9631748, 0, 0, 0, 1, 1,
1.877493, 0.482535, 0.6726878, 0, 0, 0, 1, 1,
1.903033, -0.7248098, 1.127053, 0, 0, 0, 1, 1,
1.91727, 1.503815, 2.759002, 0, 0, 0, 1, 1,
1.939653, -0.03718614, 1.736824, 0, 0, 0, 1, 1,
1.968914, 0.6874888, 1.761037, 0, 0, 0, 1, 1,
1.985426, -0.4331851, 2.040447, 0, 0, 0, 1, 1,
1.985682, 0.8910971, 2.882352, 1, 1, 1, 1, 1,
1.98876, -0.1297492, 1.333037, 1, 1, 1, 1, 1,
1.98932, 1.513742, -0.409934, 1, 1, 1, 1, 1,
1.99499, 1.805026, 1.693801, 1, 1, 1, 1, 1,
2.01238, -1.249453, 1.629728, 1, 1, 1, 1, 1,
2.023636, -1.422629, 0.6970517, 1, 1, 1, 1, 1,
2.039009, -0.5593145, 2.598358, 1, 1, 1, 1, 1,
2.039207, -0.3890104, 2.009445, 1, 1, 1, 1, 1,
2.04468, -0.9921822, 1.896441, 1, 1, 1, 1, 1,
2.09136, -0.90212, 2.276306, 1, 1, 1, 1, 1,
2.110088, -1.728244, 2.461688, 1, 1, 1, 1, 1,
2.128809, 1.136133, -0.5484297, 1, 1, 1, 1, 1,
2.14251, -0.08005687, 0.4944266, 1, 1, 1, 1, 1,
2.143725, -0.6932748, 1.216269, 1, 1, 1, 1, 1,
2.147535, -0.175503, 1.97867, 1, 1, 1, 1, 1,
2.151945, -1.129352, 1.112318, 0, 0, 1, 1, 1,
2.176577, -0.4072636, 0.4645811, 1, 0, 0, 1, 1,
2.193636, 1.895205, 1.557075, 1, 0, 0, 1, 1,
2.2178, -0.6371233, 2.634934, 1, 0, 0, 1, 1,
2.281439, -1.38736, 2.779002, 1, 0, 0, 1, 1,
2.291322, -0.9800402, 0.7637932, 1, 0, 0, 1, 1,
2.309032, 0.6275026, 1.95567, 0, 0, 0, 1, 1,
2.317297, 0.339958, 2.146666, 0, 0, 0, 1, 1,
2.326283, 0.4021973, 1.370094, 0, 0, 0, 1, 1,
2.361556, -2.062269, 2.550778, 0, 0, 0, 1, 1,
2.453055, 2.351361, 1.785671, 0, 0, 0, 1, 1,
2.457864, 0.4598161, 2.020293, 0, 0, 0, 1, 1,
2.505474, -0.6492327, 0.6797795, 0, 0, 0, 1, 1,
2.531874, 0.7663552, 0.4736506, 1, 1, 1, 1, 1,
2.577114, 0.07817399, 0.9722735, 1, 1, 1, 1, 1,
2.622438, -0.8046626, 1.663723, 1, 1, 1, 1, 1,
2.684684, -0.8118414, 1.774805, 1, 1, 1, 1, 1,
2.952385, -0.4018029, 1.731158, 1, 1, 1, 1, 1,
2.959955, 1.474639, 1.562392, 1, 1, 1, 1, 1,
3.005241, 0.5624352, 1.277443, 1, 1, 1, 1, 1
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
var radius = 9.523284;
var distance = 33.45013;
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
mvMatrix.translate( 0.239192, 0.1169052, 0.1655443 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.45013);
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
