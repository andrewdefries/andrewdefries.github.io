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
-3.424524, -0.3401504, -1.862354, 1, 0, 0, 1,
-3.116734, 2.611273, -1.416862, 1, 0.007843138, 0, 1,
-2.967432, 0.1618184, -1.881746, 1, 0.01176471, 0, 1,
-2.953233, -0.07269404, -0.1769694, 1, 0.01960784, 0, 1,
-2.849552, -1.952008, -1.670597, 1, 0.02352941, 0, 1,
-2.718075, 0.1771933, -2.424897, 1, 0.03137255, 0, 1,
-2.706541, -0.7138312, -1.523247, 1, 0.03529412, 0, 1,
-2.58205, -1.143035, -1.224413, 1, 0.04313726, 0, 1,
-2.467348, -0.1587104, -1.891964, 1, 0.04705882, 0, 1,
-2.455953, 1.579834, -0.9065812, 1, 0.05490196, 0, 1,
-2.243551, -2.001787, -0.7456645, 1, 0.05882353, 0, 1,
-2.217022, 1.631865, -1.368156, 1, 0.06666667, 0, 1,
-2.191087, 0.08876398, -3.429647, 1, 0.07058824, 0, 1,
-2.175904, -2.490172, -0.2139805, 1, 0.07843138, 0, 1,
-2.145113, 0.8842171, -1.069984, 1, 0.08235294, 0, 1,
-2.140199, -0.7941309, -2.773338, 1, 0.09019608, 0, 1,
-2.090027, 0.5861616, -1.782864, 1, 0.09411765, 0, 1,
-2.077926, -1.32732, -2.331535, 1, 0.1019608, 0, 1,
-2.077078, -0.608206, -2.745179, 1, 0.1098039, 0, 1,
-2.04273, -1.226438, -3.377218, 1, 0.1137255, 0, 1,
-1.963899, 1.32933, -1.283064, 1, 0.1215686, 0, 1,
-1.926545, -2.072486, -1.930302, 1, 0.1254902, 0, 1,
-1.915001, 0.9615847, -0.8131469, 1, 0.1333333, 0, 1,
-1.914778, -0.9595227, -1.097072, 1, 0.1372549, 0, 1,
-1.913233, -1.24651, -4.105003, 1, 0.145098, 0, 1,
-1.906819, -0.04299535, -0.1365064, 1, 0.1490196, 0, 1,
-1.875746, 0.6440303, -1.771837, 1, 0.1568628, 0, 1,
-1.871982, -0.08083966, -2.51617, 1, 0.1607843, 0, 1,
-1.838915, -0.4399259, -2.400021, 1, 0.1686275, 0, 1,
-1.813001, -0.5861394, -1.387704, 1, 0.172549, 0, 1,
-1.802606, -1.197461, -2.779814, 1, 0.1803922, 0, 1,
-1.778421, 0.656161, -0.8430909, 1, 0.1843137, 0, 1,
-1.766529, 0.4665639, -1.9259, 1, 0.1921569, 0, 1,
-1.738332, 0.820689, -0.2108152, 1, 0.1960784, 0, 1,
-1.734079, 0.9413534, 0.740702, 1, 0.2039216, 0, 1,
-1.729813, 0.308937, -2.093774, 1, 0.2117647, 0, 1,
-1.719348, 0.6265576, -1.530994, 1, 0.2156863, 0, 1,
-1.704951, 0.473071, -0.4944946, 1, 0.2235294, 0, 1,
-1.700732, -0.02642463, -2.750896, 1, 0.227451, 0, 1,
-1.680652, 0.07226932, -0.9138646, 1, 0.2352941, 0, 1,
-1.66659, -0.1152201, -1.310045, 1, 0.2392157, 0, 1,
-1.663789, 0.6784824, -1.245461, 1, 0.2470588, 0, 1,
-1.662766, -0.6802285, -2.498063, 1, 0.2509804, 0, 1,
-1.603421, 0.277408, -2.507462, 1, 0.2588235, 0, 1,
-1.579204, -0.6542991, -0.9258819, 1, 0.2627451, 0, 1,
-1.558008, -0.3731124, -2.413839, 1, 0.2705882, 0, 1,
-1.555291, 0.3899744, -1.644225, 1, 0.2745098, 0, 1,
-1.534562, -0.7081684, -0.6530813, 1, 0.282353, 0, 1,
-1.523774, -1.080675, -1.789121, 1, 0.2862745, 0, 1,
-1.516577, -0.2453393, -0.6043154, 1, 0.2941177, 0, 1,
-1.509609, 0.6103658, -1.173398, 1, 0.3019608, 0, 1,
-1.490744, -1.980304, -3.014816, 1, 0.3058824, 0, 1,
-1.487514, -0.180769, -0.8944678, 1, 0.3137255, 0, 1,
-1.487322, 0.3654267, -3.490219, 1, 0.3176471, 0, 1,
-1.486201, 0.1861908, -0.7579481, 1, 0.3254902, 0, 1,
-1.481782, -0.8522472, -2.982635, 1, 0.3294118, 0, 1,
-1.461935, 0.4748535, -2.815438, 1, 0.3372549, 0, 1,
-1.442739, -1.356043, -3.351342, 1, 0.3411765, 0, 1,
-1.438051, -0.9805926, -0.1225451, 1, 0.3490196, 0, 1,
-1.426766, -0.913221, -2.704873, 1, 0.3529412, 0, 1,
-1.423969, -0.6675634, -2.653037, 1, 0.3607843, 0, 1,
-1.4192, -0.7688689, -0.9237676, 1, 0.3647059, 0, 1,
-1.398267, 1.640902, 0.4955878, 1, 0.372549, 0, 1,
-1.394807, 0.2251098, -0.5174271, 1, 0.3764706, 0, 1,
-1.38203, -0.8214459, -0.8562942, 1, 0.3843137, 0, 1,
-1.378527, -0.2566253, -1.990001, 1, 0.3882353, 0, 1,
-1.373573, -0.8542278, -1.544447, 1, 0.3960784, 0, 1,
-1.364636, -0.3882517, -1.233835, 1, 0.4039216, 0, 1,
-1.363358, 0.1428745, 0.2102232, 1, 0.4078431, 0, 1,
-1.347345, -1.357385, -0.9806194, 1, 0.4156863, 0, 1,
-1.338815, 0.4348828, -2.630286, 1, 0.4196078, 0, 1,
-1.334402, 0.7420474, 1.198472, 1, 0.427451, 0, 1,
-1.334023, -1.999057, -1.328334, 1, 0.4313726, 0, 1,
-1.328826, 1.132443, -1.635012, 1, 0.4392157, 0, 1,
-1.3288, -0.2092981, -0.5942765, 1, 0.4431373, 0, 1,
-1.327544, -0.2634449, -1.604647, 1, 0.4509804, 0, 1,
-1.314262, -0.6589246, -1.830734, 1, 0.454902, 0, 1,
-1.309275, 1.616752, -0.8874017, 1, 0.4627451, 0, 1,
-1.306633, 1.027206, -2.072552, 1, 0.4666667, 0, 1,
-1.299252, 0.4098677, -1.416206, 1, 0.4745098, 0, 1,
-1.294217, 0.4988408, -2.939964, 1, 0.4784314, 0, 1,
-1.293224, -0.03934051, -0.4362977, 1, 0.4862745, 0, 1,
-1.288314, -1.308042, -3.394644, 1, 0.4901961, 0, 1,
-1.287089, 1.090508, -2.030334, 1, 0.4980392, 0, 1,
-1.275472, -0.426936, -2.042835, 1, 0.5058824, 0, 1,
-1.271573, -0.7405002, -0.2003607, 1, 0.509804, 0, 1,
-1.267366, 0.6940491, -1.021578, 1, 0.5176471, 0, 1,
-1.265595, -0.9446136, -0.819017, 1, 0.5215687, 0, 1,
-1.258106, -0.1011453, -2.746218, 1, 0.5294118, 0, 1,
-1.250989, 0.3528967, -1.777653, 1, 0.5333334, 0, 1,
-1.242778, -2.110224, -1.684157, 1, 0.5411765, 0, 1,
-1.241732, 0.4159175, 0.2742442, 1, 0.5450981, 0, 1,
-1.23297, -0.6574101, -3.959032, 1, 0.5529412, 0, 1,
-1.229845, -0.7698768, -2.786785, 1, 0.5568628, 0, 1,
-1.229059, 0.3774481, 0.6404572, 1, 0.5647059, 0, 1,
-1.227217, -0.2421563, -1.290041, 1, 0.5686275, 0, 1,
-1.22406, -0.5958313, -1.263794, 1, 0.5764706, 0, 1,
-1.211322, 0.4694207, -2.097954, 1, 0.5803922, 0, 1,
-1.210618, -0.6451676, -3.024372, 1, 0.5882353, 0, 1,
-1.190559, 0.1152593, -1.526221, 1, 0.5921569, 0, 1,
-1.183457, 0.6211658, -2.248263, 1, 0.6, 0, 1,
-1.18261, 0.7528238, -0.4230428, 1, 0.6078432, 0, 1,
-1.181818, -1.054167, -3.814343, 1, 0.6117647, 0, 1,
-1.179302, -0.1258133, -2.917178, 1, 0.6196079, 0, 1,
-1.159292, 0.7606906, -1.438078, 1, 0.6235294, 0, 1,
-1.151029, 1.45783, -1.047884, 1, 0.6313726, 0, 1,
-1.147341, 0.4871821, -2.773355, 1, 0.6352941, 0, 1,
-1.136241, 0.3692742, -1.873589, 1, 0.6431373, 0, 1,
-1.123493, -1.565758, -3.723199, 1, 0.6470588, 0, 1,
-1.119231, 1.318411, -0.7249312, 1, 0.654902, 0, 1,
-1.11761, 1.697162, -0.6875111, 1, 0.6588235, 0, 1,
-1.115499, 0.2190312, -0.8355531, 1, 0.6666667, 0, 1,
-1.114759, 0.3313023, -0.2175808, 1, 0.6705883, 0, 1,
-1.10703, -0.7434794, -2.726112, 1, 0.6784314, 0, 1,
-1.098984, -0.7288971, -3.132432, 1, 0.682353, 0, 1,
-1.089941, 1.035293, -3.071883, 1, 0.6901961, 0, 1,
-1.088211, 0.8088748, -0.7387886, 1, 0.6941177, 0, 1,
-1.084026, -0.5051394, -0.7365401, 1, 0.7019608, 0, 1,
-1.080302, -0.01001456, -1.587023, 1, 0.7098039, 0, 1,
-1.080017, 0.6553258, 0.4858988, 1, 0.7137255, 0, 1,
-1.068724, -0.7445015, -3.556555, 1, 0.7215686, 0, 1,
-1.066399, -0.7491778, -1.728328, 1, 0.7254902, 0, 1,
-1.065516, 0.1812468, -2.122512, 1, 0.7333333, 0, 1,
-1.063771, -1.247026, -3.156984, 1, 0.7372549, 0, 1,
-1.062659, -0.1271844, -2.921114, 1, 0.7450981, 0, 1,
-1.056733, -0.1582414, -2.829805, 1, 0.7490196, 0, 1,
-1.045603, 0.1587118, -2.293173, 1, 0.7568628, 0, 1,
-1.039365, -1.652562, -3.936879, 1, 0.7607843, 0, 1,
-1.021568, -0.09363712, -1.862011, 1, 0.7686275, 0, 1,
-1.01663, 0.2715624, -0.2170685, 1, 0.772549, 0, 1,
-1.0012, 0.3171276, -1.752078, 1, 0.7803922, 0, 1,
-0.9962544, 2.040245, 0.2823416, 1, 0.7843137, 0, 1,
-0.9938582, 0.6011788, -2.073121, 1, 0.7921569, 0, 1,
-0.990233, 0.4813422, -0.336534, 1, 0.7960784, 0, 1,
-0.9880726, -0.6707364, -2.380211, 1, 0.8039216, 0, 1,
-0.9861, -1.042324, -3.465506, 1, 0.8117647, 0, 1,
-0.9844171, 0.527986, -0.232636, 1, 0.8156863, 0, 1,
-0.9832366, 1.512352, -2.793927, 1, 0.8235294, 0, 1,
-0.9576998, -1.041814, -2.365406, 1, 0.827451, 0, 1,
-0.9528697, 2.286833, -0.4171128, 1, 0.8352941, 0, 1,
-0.9414888, 0.3368213, -0.6590204, 1, 0.8392157, 0, 1,
-0.9311061, 0.3820397, -2.570275, 1, 0.8470588, 0, 1,
-0.9242732, -0.4724481, -1.596008, 1, 0.8509804, 0, 1,
-0.9148377, 0.3963966, -2.709034, 1, 0.8588235, 0, 1,
-0.9134087, 1.35082, -1.467641, 1, 0.8627451, 0, 1,
-0.9065843, 1.304495, 0.6951057, 1, 0.8705882, 0, 1,
-0.9057429, -0.8176704, -2.196511, 1, 0.8745098, 0, 1,
-0.9026471, -1.76353, -3.548218, 1, 0.8823529, 0, 1,
-0.8988534, 0.1342178, -1.731439, 1, 0.8862745, 0, 1,
-0.881121, -0.6600752, -1.52663, 1, 0.8941177, 0, 1,
-0.8761914, -0.2820182, -0.8044159, 1, 0.8980392, 0, 1,
-0.8755916, -0.2241119, -0.4444588, 1, 0.9058824, 0, 1,
-0.8747591, -1.84862, -2.630125, 1, 0.9137255, 0, 1,
-0.864971, 1.997583, -2.036031, 1, 0.9176471, 0, 1,
-0.8648815, -0.3790328, -1.943534, 1, 0.9254902, 0, 1,
-0.8645483, 0.4434406, -1.567643, 1, 0.9294118, 0, 1,
-0.8591868, -2.208788, -2.569905, 1, 0.9372549, 0, 1,
-0.8577074, 0.1766681, -1.466548, 1, 0.9411765, 0, 1,
-0.8548998, 0.1263704, -1.036329, 1, 0.9490196, 0, 1,
-0.8408664, -0.5024709, -2.348925, 1, 0.9529412, 0, 1,
-0.8309021, -0.4794519, -1.860939, 1, 0.9607843, 0, 1,
-0.8306838, -1.399924, -1.436032, 1, 0.9647059, 0, 1,
-0.8285598, -0.3756453, -1.508159, 1, 0.972549, 0, 1,
-0.8219259, 0.3584001, -3.461859, 1, 0.9764706, 0, 1,
-0.8148407, -0.4683579, -2.77339, 1, 0.9843137, 0, 1,
-0.8004912, -0.1794398, -0.3838917, 1, 0.9882353, 0, 1,
-0.8001764, 0.550045, 1.258761, 1, 0.9960784, 0, 1,
-0.7909292, 0.132136, -1.545679, 0.9960784, 1, 0, 1,
-0.7887917, 0.7008554, -1.63875, 0.9921569, 1, 0, 1,
-0.7870747, -0.1183548, -0.1180863, 0.9843137, 1, 0, 1,
-0.7866324, 0.8217431, -0.1041149, 0.9803922, 1, 0, 1,
-0.7862984, 0.1856037, -3.540396, 0.972549, 1, 0, 1,
-0.7819183, -0.04298537, -0.9969393, 0.9686275, 1, 0, 1,
-0.7775709, -2.351456, -3.884005, 0.9607843, 1, 0, 1,
-0.7739295, -0.9443175, -1.689604, 0.9568627, 1, 0, 1,
-0.7715465, 0.7028971, -1.510317, 0.9490196, 1, 0, 1,
-0.7694023, -0.5283182, -2.620955, 0.945098, 1, 0, 1,
-0.7676674, -1.537154, -2.814707, 0.9372549, 1, 0, 1,
-0.766215, -0.2868808, -0.9177082, 0.9333333, 1, 0, 1,
-0.7658653, 1.736228, -2.114973, 0.9254902, 1, 0, 1,
-0.7641707, -1.340954, -3.186451, 0.9215686, 1, 0, 1,
-0.7632035, 0.4464493, -0.7003747, 0.9137255, 1, 0, 1,
-0.7601743, -0.9990808, -1.80599, 0.9098039, 1, 0, 1,
-0.7593122, -0.6819829, -3.822477, 0.9019608, 1, 0, 1,
-0.7552259, 0.4538916, -1.36797, 0.8941177, 1, 0, 1,
-0.750913, -0.05917711, -0.2955987, 0.8901961, 1, 0, 1,
-0.7468103, -0.4912369, -1.490921, 0.8823529, 1, 0, 1,
-0.7457552, 0.2584154, -2.158892, 0.8784314, 1, 0, 1,
-0.744541, 0.7448739, 0.3747373, 0.8705882, 1, 0, 1,
-0.7436432, -0.4223039, 0.6038657, 0.8666667, 1, 0, 1,
-0.7418205, -0.7043998, -1.860589, 0.8588235, 1, 0, 1,
-0.7400351, 1.444244, -0.729628, 0.854902, 1, 0, 1,
-0.7376394, -0.6170965, -2.815426, 0.8470588, 1, 0, 1,
-0.7364402, 1.424741, -0.8600689, 0.8431373, 1, 0, 1,
-0.7231192, -0.9372391, -1.421554, 0.8352941, 1, 0, 1,
-0.7221346, 1.780116, 0.2383476, 0.8313726, 1, 0, 1,
-0.7184015, -0.556882, -3.253227, 0.8235294, 1, 0, 1,
-0.7182261, -0.03159809, -1.712476, 0.8196079, 1, 0, 1,
-0.7153927, -0.5536596, -1.688129, 0.8117647, 1, 0, 1,
-0.7146902, 1.945781, -0.3444783, 0.8078431, 1, 0, 1,
-0.7098668, 1.254688, -1.121322, 0.8, 1, 0, 1,
-0.7047673, -0.7930205, -3.225916, 0.7921569, 1, 0, 1,
-0.6995484, -2.7905, -2.134215, 0.7882353, 1, 0, 1,
-0.6914639, 0.6203513, -1.800764, 0.7803922, 1, 0, 1,
-0.6906007, -0.8867797, -2.126742, 0.7764706, 1, 0, 1,
-0.6887714, 0.6724366, -0.8686843, 0.7686275, 1, 0, 1,
-0.6858954, 0.2509443, -1.283484, 0.7647059, 1, 0, 1,
-0.6816548, -0.4058418, -3.399889, 0.7568628, 1, 0, 1,
-0.6799552, 0.9094647, 1.508107, 0.7529412, 1, 0, 1,
-0.6783978, 0.004832455, -2.244973, 0.7450981, 1, 0, 1,
-0.677711, -1.581517, -2.708838, 0.7411765, 1, 0, 1,
-0.6776481, -0.7476637, -2.587318, 0.7333333, 1, 0, 1,
-0.6774175, 1.161756, -0.1763762, 0.7294118, 1, 0, 1,
-0.6736721, -1.246083, -2.035106, 0.7215686, 1, 0, 1,
-0.6736647, -0.8613399, -3.106693, 0.7176471, 1, 0, 1,
-0.6677267, 1.169246, -0.2441829, 0.7098039, 1, 0, 1,
-0.6645682, 0.2104901, -2.076673, 0.7058824, 1, 0, 1,
-0.6627355, -1.189257, -1.31165, 0.6980392, 1, 0, 1,
-0.6536714, 0.3604615, 0.06662856, 0.6901961, 1, 0, 1,
-0.6501501, 0.6335449, 0.9626387, 0.6862745, 1, 0, 1,
-0.6497221, -0.5168043, -3.69349, 0.6784314, 1, 0, 1,
-0.6495088, -0.1555287, -0.7178369, 0.6745098, 1, 0, 1,
-0.6485702, -0.005860394, -1.678355, 0.6666667, 1, 0, 1,
-0.6483023, 1.121737, -0.5679051, 0.6627451, 1, 0, 1,
-0.6422377, -0.6536686, -1.95595, 0.654902, 1, 0, 1,
-0.6398025, 2.383208, 1.240796, 0.6509804, 1, 0, 1,
-0.6396053, -0.9037265, -1.640299, 0.6431373, 1, 0, 1,
-0.6362284, -1.892002, -2.159544, 0.6392157, 1, 0, 1,
-0.6352465, 1.044416, -0.3884164, 0.6313726, 1, 0, 1,
-0.6341768, -0.191982, -0.4704752, 0.627451, 1, 0, 1,
-0.62851, 0.1153204, -2.304288, 0.6196079, 1, 0, 1,
-0.6260006, 0.9962428, 1.079824, 0.6156863, 1, 0, 1,
-0.6258116, 0.2873153, -0.9203943, 0.6078432, 1, 0, 1,
-0.6250975, 0.4647447, -1.501114, 0.6039216, 1, 0, 1,
-0.6245638, -1.416906, -3.639626, 0.5960785, 1, 0, 1,
-0.6202199, -0.376136, -2.488161, 0.5882353, 1, 0, 1,
-0.6187497, -0.9072099, -2.670223, 0.5843138, 1, 0, 1,
-0.6164776, -0.499304, -3.206574, 0.5764706, 1, 0, 1,
-0.6150441, 1.367673, 0.8738052, 0.572549, 1, 0, 1,
-0.614367, 0.6706521, -3.402347, 0.5647059, 1, 0, 1,
-0.609471, -0.8493841, -0.8093517, 0.5607843, 1, 0, 1,
-0.5834954, -0.1525985, -1.325011, 0.5529412, 1, 0, 1,
-0.582498, -1.00471, -4.456694, 0.5490196, 1, 0, 1,
-0.5817274, 0.911509, 0.2693809, 0.5411765, 1, 0, 1,
-0.5803784, 1.228769, -0.07820369, 0.5372549, 1, 0, 1,
-0.5795777, 1.445394, 0.1385258, 0.5294118, 1, 0, 1,
-0.5793186, 1.18371, 0.2050117, 0.5254902, 1, 0, 1,
-0.5792547, 0.101964, -1.099742, 0.5176471, 1, 0, 1,
-0.5730143, 0.03624248, -1.904402, 0.5137255, 1, 0, 1,
-0.5652381, -1.107913, -1.771956, 0.5058824, 1, 0, 1,
-0.5625044, -0.7136752, -4.717303, 0.5019608, 1, 0, 1,
-0.561399, -0.5926818, -3.338249, 0.4941176, 1, 0, 1,
-0.5593013, 1.616026, -0.3823485, 0.4862745, 1, 0, 1,
-0.5564674, 0.597578, -1.068165, 0.4823529, 1, 0, 1,
-0.5528083, 0.532334, 0.193224, 0.4745098, 1, 0, 1,
-0.5527341, 1.377389, 1.74977, 0.4705882, 1, 0, 1,
-0.5507144, -0.2346686, -1.626523, 0.4627451, 1, 0, 1,
-0.5501336, -0.5015473, -0.9854069, 0.4588235, 1, 0, 1,
-0.5465934, -0.207826, -2.093429, 0.4509804, 1, 0, 1,
-0.546343, -1.198081, -2.342722, 0.4470588, 1, 0, 1,
-0.5424911, 0.4987502, -0.4253179, 0.4392157, 1, 0, 1,
-0.5410935, -0.1288827, -1.366838, 0.4352941, 1, 0, 1,
-0.5391953, -0.09776923, -1.171455, 0.427451, 1, 0, 1,
-0.5380384, 0.06944169, -2.501063, 0.4235294, 1, 0, 1,
-0.5357014, 1.588689, -0.3306007, 0.4156863, 1, 0, 1,
-0.5347711, 0.8188226, 0.1049311, 0.4117647, 1, 0, 1,
-0.5322794, 0.5541348, -1.00755, 0.4039216, 1, 0, 1,
-0.5302275, -0.1490133, -2.583949, 0.3960784, 1, 0, 1,
-0.5289435, -1.401347, -4.511394, 0.3921569, 1, 0, 1,
-0.5289258, -1.1956, -1.165441, 0.3843137, 1, 0, 1,
-0.5194154, -1.140696, -1.695298, 0.3803922, 1, 0, 1,
-0.5126016, -0.5976844, -3.796041, 0.372549, 1, 0, 1,
-0.5104888, 0.7347978, -1.218536, 0.3686275, 1, 0, 1,
-0.5100955, 0.36797, -0.8356628, 0.3607843, 1, 0, 1,
-0.5097191, -0.6084756, -2.985111, 0.3568628, 1, 0, 1,
-0.509707, 0.6237351, -0.5615107, 0.3490196, 1, 0, 1,
-0.5083339, -0.01211962, -2.106818, 0.345098, 1, 0, 1,
-0.5066143, -1.071481, -1.871085, 0.3372549, 1, 0, 1,
-0.5064403, 0.6043517, -2.751582, 0.3333333, 1, 0, 1,
-0.505095, 0.3551335, -0.6493497, 0.3254902, 1, 0, 1,
-0.5018542, -0.2588865, -1.517728, 0.3215686, 1, 0, 1,
-0.5004995, -0.6658618, -2.199197, 0.3137255, 1, 0, 1,
-0.4990949, 1.264126, 1.911007, 0.3098039, 1, 0, 1,
-0.4979963, 1.016977, -1.999879, 0.3019608, 1, 0, 1,
-0.4969321, 1.555151, -1.730651, 0.2941177, 1, 0, 1,
-0.4934525, 1.234734, -0.1042706, 0.2901961, 1, 0, 1,
-0.493415, 0.8047915, 1.893215, 0.282353, 1, 0, 1,
-0.4932285, 0.4897186, -1.673382, 0.2784314, 1, 0, 1,
-0.4916707, 1.462041, 0.8011462, 0.2705882, 1, 0, 1,
-0.4878712, -1.077877, -2.764368, 0.2666667, 1, 0, 1,
-0.4826765, 0.7476456, 2.243729, 0.2588235, 1, 0, 1,
-0.4780144, -1.962581, -4.598609, 0.254902, 1, 0, 1,
-0.4775823, -0.1326168, -2.544698, 0.2470588, 1, 0, 1,
-0.4770516, 1.054767, 0.2427875, 0.2431373, 1, 0, 1,
-0.4704532, -0.9481748, -3.209758, 0.2352941, 1, 0, 1,
-0.4675165, -0.5730621, -1.704513, 0.2313726, 1, 0, 1,
-0.4667991, -0.6213832, -3.363568, 0.2235294, 1, 0, 1,
-0.4644115, -0.5644872, -3.317179, 0.2196078, 1, 0, 1,
-0.4635901, -0.6097354, -2.202489, 0.2117647, 1, 0, 1,
-0.4616485, 0.368839, -0.274163, 0.2078431, 1, 0, 1,
-0.461498, 0.4767401, -0.4145403, 0.2, 1, 0, 1,
-0.4612098, 0.2744062, -0.8295835, 0.1921569, 1, 0, 1,
-0.4612074, -0.1851586, -2.671664, 0.1882353, 1, 0, 1,
-0.4588046, 1.034844, -0.06921019, 0.1803922, 1, 0, 1,
-0.4521728, 1.36487, -0.6817234, 0.1764706, 1, 0, 1,
-0.452016, 0.5219488, -0.8851405, 0.1686275, 1, 0, 1,
-0.4480703, -0.4983948, -0.7629919, 0.1647059, 1, 0, 1,
-0.4477999, 0.455276, 1.897621, 0.1568628, 1, 0, 1,
-0.4447818, -0.331124, -1.361133, 0.1529412, 1, 0, 1,
-0.440616, -1.808345, -4.010801, 0.145098, 1, 0, 1,
-0.4406007, -0.5021422, -1.583869, 0.1411765, 1, 0, 1,
-0.4402663, 2.030623, -0.1208922, 0.1333333, 1, 0, 1,
-0.4390371, -0.9705473, -2.985353, 0.1294118, 1, 0, 1,
-0.4386097, -0.6575062, -2.555115, 0.1215686, 1, 0, 1,
-0.4377434, 1.209801, -1.171993, 0.1176471, 1, 0, 1,
-0.4356655, 0.659557, 0.7087905, 0.1098039, 1, 0, 1,
-0.4346911, -0.3170079, -1.582451, 0.1058824, 1, 0, 1,
-0.4345312, 1.447932, -0.01400473, 0.09803922, 1, 0, 1,
-0.4341351, 0.9045319, -0.6714792, 0.09019608, 1, 0, 1,
-0.4339781, -0.6737377, -1.199946, 0.08627451, 1, 0, 1,
-0.4323125, 0.07873, -1.170462, 0.07843138, 1, 0, 1,
-0.4269201, 0.7501882, -0.1512915, 0.07450981, 1, 0, 1,
-0.418897, -0.5084443, -2.495198, 0.06666667, 1, 0, 1,
-0.4128828, -1.072487, -2.559726, 0.0627451, 1, 0, 1,
-0.4055321, -0.8018702, -4.135409, 0.05490196, 1, 0, 1,
-0.4010987, -0.01961265, -2.280688, 0.05098039, 1, 0, 1,
-0.3994916, -0.1491273, -1.348198, 0.04313726, 1, 0, 1,
-0.3994052, -0.01209006, -0.6656209, 0.03921569, 1, 0, 1,
-0.3956803, 0.7932984, -0.8431382, 0.03137255, 1, 0, 1,
-0.3920757, 0.420512, -1.226533, 0.02745098, 1, 0, 1,
-0.3914804, 1.036291, 0.179822, 0.01960784, 1, 0, 1,
-0.3868789, -1.495773, -2.2383, 0.01568628, 1, 0, 1,
-0.3822032, -0.8442111, -1.541707, 0.007843138, 1, 0, 1,
-0.3817748, -0.8909454, -1.642662, 0.003921569, 1, 0, 1,
-0.3815291, 0.2397255, -2.116995, 0, 1, 0.003921569, 1,
-0.3807716, 1.245546, -0.6163689, 0, 1, 0.01176471, 1,
-0.3805003, 1.338235, -0.7708376, 0, 1, 0.01568628, 1,
-0.3746069, 0.5492346, 0.5356469, 0, 1, 0.02352941, 1,
-0.3743485, 0.2968528, -0.5767914, 0, 1, 0.02745098, 1,
-0.3734756, 0.5727147, -2.259025, 0, 1, 0.03529412, 1,
-0.3696835, -1.464851, -3.736456, 0, 1, 0.03921569, 1,
-0.3677825, -0.1700528, -2.271731, 0, 1, 0.04705882, 1,
-0.361789, -1.027299, -2.337248, 0, 1, 0.05098039, 1,
-0.3613397, -1.903215, -1.650143, 0, 1, 0.05882353, 1,
-0.3587857, -1.826256, -5.74806, 0, 1, 0.0627451, 1,
-0.3500252, 1.793661, 1.264932, 0, 1, 0.07058824, 1,
-0.3432154, -0.5830031, -2.432045, 0, 1, 0.07450981, 1,
-0.3410023, -0.03381873, -2.238871, 0, 1, 0.08235294, 1,
-0.3400717, 0.463791, 0.503549, 0, 1, 0.08627451, 1,
-0.3398422, -0.8892596, -2.729221, 0, 1, 0.09411765, 1,
-0.3393737, -0.1956892, -1.755412, 0, 1, 0.1019608, 1,
-0.3393629, -0.09021368, -1.850226, 0, 1, 0.1058824, 1,
-0.3339339, 0.04129731, -0.6091426, 0, 1, 0.1137255, 1,
-0.3318233, -0.3688236, -3.921999, 0, 1, 0.1176471, 1,
-0.3309254, 0.738891, -0.2495096, 0, 1, 0.1254902, 1,
-0.3306358, -0.9241259, -2.299471, 0, 1, 0.1294118, 1,
-0.3288343, -1.591085, -4.758234, 0, 1, 0.1372549, 1,
-0.3257163, -0.5990127, -2.053946, 0, 1, 0.1411765, 1,
-0.3251174, -0.7475966, -1.915223, 0, 1, 0.1490196, 1,
-0.3245937, 0.8724738, 1.185854, 0, 1, 0.1529412, 1,
-0.3241739, 0.1841433, -0.9617897, 0, 1, 0.1607843, 1,
-0.3214552, -1.451758, -4.537272, 0, 1, 0.1647059, 1,
-0.3194766, 1.07685, -0.8473455, 0, 1, 0.172549, 1,
-0.3166528, -0.6040808, -2.389887, 0, 1, 0.1764706, 1,
-0.3134958, -0.4715269, -4.024184, 0, 1, 0.1843137, 1,
-0.3103517, 0.5242937, -0.2441313, 0, 1, 0.1882353, 1,
-0.3057193, 0.6033548, -0.4794062, 0, 1, 0.1960784, 1,
-0.2995867, -0.9036348, -3.526379, 0, 1, 0.2039216, 1,
-0.2944736, -1.171873, -3.130862, 0, 1, 0.2078431, 1,
-0.293464, -0.5519773, -2.254063, 0, 1, 0.2156863, 1,
-0.2934065, -1.017563, -0.635107, 0, 1, 0.2196078, 1,
-0.2917841, -0.005996607, -1.83003, 0, 1, 0.227451, 1,
-0.2908838, -0.3176372, -1.519595, 0, 1, 0.2313726, 1,
-0.2879433, 0.3262788, -0.1701833, 0, 1, 0.2392157, 1,
-0.2798864, 1.482335, 0.02312117, 0, 1, 0.2431373, 1,
-0.2761874, 0.5421215, 0.5444449, 0, 1, 0.2509804, 1,
-0.2754087, 2.370339, 0.1317741, 0, 1, 0.254902, 1,
-0.2750055, 0.01936516, -1.432667, 0, 1, 0.2627451, 1,
-0.2734174, -1.311828, -1.298318, 0, 1, 0.2666667, 1,
-0.2695312, 1.568429, 0.6090888, 0, 1, 0.2745098, 1,
-0.2643184, 0.113406, -0.6248141, 0, 1, 0.2784314, 1,
-0.2628483, 0.6392681, -0.8850496, 0, 1, 0.2862745, 1,
-0.2575038, 0.01068441, -2.113658, 0, 1, 0.2901961, 1,
-0.2563717, -0.8180779, -3.572671, 0, 1, 0.2980392, 1,
-0.2526411, -0.6299122, -2.440045, 0, 1, 0.3058824, 1,
-0.2526006, 0.1108379, -0.09739085, 0, 1, 0.3098039, 1,
-0.2488741, 0.3448295, 0.5442029, 0, 1, 0.3176471, 1,
-0.2470205, 0.4683912, -0.6317836, 0, 1, 0.3215686, 1,
-0.2448227, 0.688839, -1.078318, 0, 1, 0.3294118, 1,
-0.2416808, -0.1730986, -3.744464, 0, 1, 0.3333333, 1,
-0.2351559, 1.979959, 0.9226217, 0, 1, 0.3411765, 1,
-0.2349556, 0.3212463, -1.412978, 0, 1, 0.345098, 1,
-0.2340288, 1.81959, -0.4190648, 0, 1, 0.3529412, 1,
-0.2315825, 0.1440933, -2.184966, 0, 1, 0.3568628, 1,
-0.2287908, -0.1994001, -2.519768, 0, 1, 0.3647059, 1,
-0.2278991, 0.4135431, -0.004668958, 0, 1, 0.3686275, 1,
-0.2268298, 0.9832224, 1.934533, 0, 1, 0.3764706, 1,
-0.2257307, 0.1054295, -0.7879168, 0, 1, 0.3803922, 1,
-0.2255224, -2.509089, -3.781439, 0, 1, 0.3882353, 1,
-0.2250611, 1.017537, 0.01157322, 0, 1, 0.3921569, 1,
-0.2238779, -0.2953263, -1.824854, 0, 1, 0.4, 1,
-0.2176595, 0.244484, -0.6359295, 0, 1, 0.4078431, 1,
-0.2168086, 1.370351, 1.040935, 0, 1, 0.4117647, 1,
-0.2160202, 1.593405, 0.2601897, 0, 1, 0.4196078, 1,
-0.2153247, -1.428026, -3.975622, 0, 1, 0.4235294, 1,
-0.214546, 0.4243403, 1.791757, 0, 1, 0.4313726, 1,
-0.2054252, 0.4113502, -0.1150075, 0, 1, 0.4352941, 1,
-0.2046945, 1.05628, -0.5367737, 0, 1, 0.4431373, 1,
-0.2037895, -0.7503735, -2.795732, 0, 1, 0.4470588, 1,
-0.2016623, 1.758814, -0.07168579, 0, 1, 0.454902, 1,
-0.2006641, -0.727115, -3.662445, 0, 1, 0.4588235, 1,
-0.1989793, -1.439882, -1.573377, 0, 1, 0.4666667, 1,
-0.1973988, 0.1005224, -1.551952, 0, 1, 0.4705882, 1,
-0.196247, 0.1649954, -0.8857608, 0, 1, 0.4784314, 1,
-0.192395, -0.3315909, -2.459422, 0, 1, 0.4823529, 1,
-0.1921494, 0.9554573, -1.952244, 0, 1, 0.4901961, 1,
-0.1900862, -0.1653709, -1.92404, 0, 1, 0.4941176, 1,
-0.1896908, -0.2032484, -1.876504, 0, 1, 0.5019608, 1,
-0.1860281, 1.354161, -0.1237095, 0, 1, 0.509804, 1,
-0.1827635, 2.248193, -0.1876603, 0, 1, 0.5137255, 1,
-0.1799792, 2.639844, -2.375959, 0, 1, 0.5215687, 1,
-0.1788124, -0.564787, -1.474617, 0, 1, 0.5254902, 1,
-0.1781362, -1.094149, -3.503598, 0, 1, 0.5333334, 1,
-0.1771778, -0.7821058, -2.352808, 0, 1, 0.5372549, 1,
-0.1765419, -0.9198138, -2.424638, 0, 1, 0.5450981, 1,
-0.1763331, -0.8850025, -2.851135, 0, 1, 0.5490196, 1,
-0.1745712, 2.066818, 1.731023, 0, 1, 0.5568628, 1,
-0.1681749, -0.2072638, -1.155884, 0, 1, 0.5607843, 1,
-0.1649661, -0.03981562, -1.339725, 0, 1, 0.5686275, 1,
-0.1637859, -1.424932, -4.063266, 0, 1, 0.572549, 1,
-0.1630149, -0.03007497, -2.883446, 0, 1, 0.5803922, 1,
-0.1574518, -0.02663125, -0.7262332, 0, 1, 0.5843138, 1,
-0.1537059, 0.2081863, -0.8696638, 0, 1, 0.5921569, 1,
-0.1471576, 0.3017315, 1.140548, 0, 1, 0.5960785, 1,
-0.1464188, -1.597691, -2.578212, 0, 1, 0.6039216, 1,
-0.1457051, -0.1075567, -2.285869, 0, 1, 0.6117647, 1,
-0.1322845, -0.05035375, -0.585705, 0, 1, 0.6156863, 1,
-0.1299408, 1.381257, -0.5846953, 0, 1, 0.6235294, 1,
-0.1292739, 1.42889, -1.830413, 0, 1, 0.627451, 1,
-0.1285696, -0.1979199, -2.214283, 0, 1, 0.6352941, 1,
-0.1271188, -0.1081162, -2.224108, 0, 1, 0.6392157, 1,
-0.1176088, 0.1634826, 0.1165311, 0, 1, 0.6470588, 1,
-0.116613, -1.062942, -0.6695188, 0, 1, 0.6509804, 1,
-0.1149969, 0.1193562, -1.036697, 0, 1, 0.6588235, 1,
-0.1104434, -0.01811455, -0.7795243, 0, 1, 0.6627451, 1,
-0.1056686, 0.3771095, 1.403346, 0, 1, 0.6705883, 1,
-0.1047946, -0.7726617, -3.388952, 0, 1, 0.6745098, 1,
-0.1010086, -0.5478992, -3.343238, 0, 1, 0.682353, 1,
-0.09798927, -0.3277219, -1.118345, 0, 1, 0.6862745, 1,
-0.09560887, 0.875988, -1.420095, 0, 1, 0.6941177, 1,
-0.09331444, 1.715585, -1.211037, 0, 1, 0.7019608, 1,
-0.09259782, 0.3461879, -0.3997056, 0, 1, 0.7058824, 1,
-0.08855179, 0.9959279, 0.2406216, 0, 1, 0.7137255, 1,
-0.08727198, -0.3206846, -3.751737, 0, 1, 0.7176471, 1,
-0.08513733, 0.2247065, 0.8486229, 0, 1, 0.7254902, 1,
-0.08101046, 0.3879106, 1.331391, 0, 1, 0.7294118, 1,
-0.07923513, -1.001856, -4.234802, 0, 1, 0.7372549, 1,
-0.07782486, -1.533046, -3.288132, 0, 1, 0.7411765, 1,
-0.0745063, 0.7291298, 1.937049, 0, 1, 0.7490196, 1,
-0.07195167, -0.8482691, -1.443195, 0, 1, 0.7529412, 1,
-0.06632908, 1.245404, 1.507396, 0, 1, 0.7607843, 1,
-0.06141652, 0.05269964, -0.7191214, 0, 1, 0.7647059, 1,
-0.06132044, -0.403037, -1.894136, 0, 1, 0.772549, 1,
-0.0587904, -1.711976, -2.1329, 0, 1, 0.7764706, 1,
-0.05856666, 0.5017773, -1.862326, 0, 1, 0.7843137, 1,
-0.05438693, 0.7386556, 0.3786466, 0, 1, 0.7882353, 1,
-0.0536699, -0.7365533, -3.024521, 0, 1, 0.7960784, 1,
-0.05270381, -1.082676, -5.586594, 0, 1, 0.8039216, 1,
-0.05163432, -1.475823, -2.313303, 0, 1, 0.8078431, 1,
-0.04521188, 0.8070764, 0.8243016, 0, 1, 0.8156863, 1,
-0.04451036, -0.4662892, -5.952676, 0, 1, 0.8196079, 1,
-0.04383447, -0.1922663, -2.810275, 0, 1, 0.827451, 1,
-0.04075681, 0.2321449, 0.7737908, 0, 1, 0.8313726, 1,
-0.03953414, 0.9878412, 0.5160877, 0, 1, 0.8392157, 1,
-0.03758416, 1.112763, -1.265973, 0, 1, 0.8431373, 1,
-0.03186907, 0.7218695, 1.198498, 0, 1, 0.8509804, 1,
-0.02996351, -0.3337017, -1.730721, 0, 1, 0.854902, 1,
-0.02850833, -0.3773786, -4.122233, 0, 1, 0.8627451, 1,
-0.02761511, -0.2314195, -2.28186, 0, 1, 0.8666667, 1,
-0.02572601, -0.9179087, -2.221009, 0, 1, 0.8745098, 1,
-0.02188454, 0.6042708, -0.09823785, 0, 1, 0.8784314, 1,
-0.01860886, 0.1163301, 0.2053545, 0, 1, 0.8862745, 1,
-0.009486154, 0.5729457, -1.073991, 0, 1, 0.8901961, 1,
-0.008687466, -0.557721, -3.993127, 0, 1, 0.8980392, 1,
-0.007887171, -1.064369, -2.469352, 0, 1, 0.9058824, 1,
-0.0002266162, 1.168679, -1.491708, 0, 1, 0.9098039, 1,
0.001149052, 0.1811459, -0.8814934, 0, 1, 0.9176471, 1,
0.001860655, -0.3709429, 4.075354, 0, 1, 0.9215686, 1,
0.008628806, 1.410461, -0.1722331, 0, 1, 0.9294118, 1,
0.009318055, 0.6925899, 0.9506338, 0, 1, 0.9333333, 1,
0.01056964, -0.5805416, 4.989716, 0, 1, 0.9411765, 1,
0.0117669, 1.032878, 0.4169133, 0, 1, 0.945098, 1,
0.01231278, -0.09471834, 2.684017, 0, 1, 0.9529412, 1,
0.01533514, -0.6354675, 2.26936, 0, 1, 0.9568627, 1,
0.01558955, -1.55255, 3.65455, 0, 1, 0.9647059, 1,
0.01711647, 2.208041, 0.169208, 0, 1, 0.9686275, 1,
0.017926, 0.6525842, 0.6988804, 0, 1, 0.9764706, 1,
0.02037476, -0.3407802, 3.02904, 0, 1, 0.9803922, 1,
0.02192584, 0.09689099, 0.7222158, 0, 1, 0.9882353, 1,
0.02725928, 0.5603483, 0.4695521, 0, 1, 0.9921569, 1,
0.03086512, 0.3820311, -1.168108, 0, 1, 1, 1,
0.03361426, 0.3638934, 0.2622084, 0, 0.9921569, 1, 1,
0.03850712, -0.8369832, 1.244704, 0, 0.9882353, 1, 1,
0.04543586, -2.09246, 2.165654, 0, 0.9803922, 1, 1,
0.04725162, 1.681317, -1.129766, 0, 0.9764706, 1, 1,
0.05672781, -0.2692136, 1.774377, 0, 0.9686275, 1, 1,
0.0599186, -0.5187188, 4.166082, 0, 0.9647059, 1, 1,
0.06117073, -0.9209406, 1.791249, 0, 0.9568627, 1, 1,
0.06284657, 1.033238, 0.9080792, 0, 0.9529412, 1, 1,
0.06615346, -0.59125, 1.460639, 0, 0.945098, 1, 1,
0.06889211, -2.004831, 3.027853, 0, 0.9411765, 1, 1,
0.06894903, -1.05118, 3.693782, 0, 0.9333333, 1, 1,
0.07067753, -1.444324, 2.336685, 0, 0.9294118, 1, 1,
0.07238311, -1.03492, 2.811203, 0, 0.9215686, 1, 1,
0.07518315, -1.245019, 3.354036, 0, 0.9176471, 1, 1,
0.07590295, -0.9481926, 2.534221, 0, 0.9098039, 1, 1,
0.08186367, -1.026536, 3.87566, 0, 0.9058824, 1, 1,
0.08344684, 0.4929023, 0.6476359, 0, 0.8980392, 1, 1,
0.08533747, -0.7330973, 3.946398, 0, 0.8901961, 1, 1,
0.08592978, -0.5490457, 2.192833, 0, 0.8862745, 1, 1,
0.0878036, -0.1593088, 2.191327, 0, 0.8784314, 1, 1,
0.0903224, 0.03357096, 0.3944249, 0, 0.8745098, 1, 1,
0.09195816, -0.1244167, 3.236883, 0, 0.8666667, 1, 1,
0.09924769, -1.059971, 3.604436, 0, 0.8627451, 1, 1,
0.09987461, -0.5335227, 3.094951, 0, 0.854902, 1, 1,
0.09994946, 0.01167713, 2.446666, 0, 0.8509804, 1, 1,
0.1010128, 0.5417074, -0.2159434, 0, 0.8431373, 1, 1,
0.1026966, -0.8653467, 3.621258, 0, 0.8392157, 1, 1,
0.1060376, 0.2733783, 1.35178, 0, 0.8313726, 1, 1,
0.1075479, 1.310686, 0.5463817, 0, 0.827451, 1, 1,
0.1084245, -1.876799, 3.740067, 0, 0.8196079, 1, 1,
0.1118261, -0.6761613, 2.816888, 0, 0.8156863, 1, 1,
0.1124559, -0.0504336, 1.379451, 0, 0.8078431, 1, 1,
0.1126801, -1.16525, 2.518094, 0, 0.8039216, 1, 1,
0.1210524, -0.2994737, 3.876222, 0, 0.7960784, 1, 1,
0.1243984, -0.8265213, 2.953952, 0, 0.7882353, 1, 1,
0.1293732, 1.119093, -0.4192206, 0, 0.7843137, 1, 1,
0.1337971, -0.3215465, 3.488925, 0, 0.7764706, 1, 1,
0.1341425, -0.6334302, 3.439018, 0, 0.772549, 1, 1,
0.1382784, -1.229103, 3.472838, 0, 0.7647059, 1, 1,
0.1401692, 0.1133304, -0.9497203, 0, 0.7607843, 1, 1,
0.1453017, 0.1698913, -0.6374459, 0, 0.7529412, 1, 1,
0.1489655, 0.7822195, 0.4487658, 0, 0.7490196, 1, 1,
0.1505703, -2.380636, 1.911135, 0, 0.7411765, 1, 1,
0.150862, 0.001881474, 1.68724, 0, 0.7372549, 1, 1,
0.1537793, 0.4352001, 4.124712, 0, 0.7294118, 1, 1,
0.1541906, -0.4954128, 3.088367, 0, 0.7254902, 1, 1,
0.1548291, -0.1881276, 1.851795, 0, 0.7176471, 1, 1,
0.1569811, -1.08452, 3.046117, 0, 0.7137255, 1, 1,
0.1611924, -0.6245354, 2.105562, 0, 0.7058824, 1, 1,
0.1630981, -1.950958, 2.102579, 0, 0.6980392, 1, 1,
0.1711771, -0.1429855, 2.660504, 0, 0.6941177, 1, 1,
0.1717563, -0.026412, 1.897282, 0, 0.6862745, 1, 1,
0.1772406, 1.411672, -0.3902099, 0, 0.682353, 1, 1,
0.1798536, -1.023862, 3.142796, 0, 0.6745098, 1, 1,
0.1810665, -0.4424593, 3.713891, 0, 0.6705883, 1, 1,
0.1926545, -0.6259374, 3.086057, 0, 0.6627451, 1, 1,
0.1956645, 1.290985, 0.7974122, 0, 0.6588235, 1, 1,
0.1959537, 2.220609, 1.070263, 0, 0.6509804, 1, 1,
0.2001631, -0.5747285, 4.15139, 0, 0.6470588, 1, 1,
0.2034896, -0.2440029, 3.899982, 0, 0.6392157, 1, 1,
0.2064914, -0.07733198, 1.798454, 0, 0.6352941, 1, 1,
0.2137319, -0.7190731, 0.5182005, 0, 0.627451, 1, 1,
0.2140744, 0.3545906, -0.1768154, 0, 0.6235294, 1, 1,
0.2146748, 0.3083866, 0.1176937, 0, 0.6156863, 1, 1,
0.2154741, -1.389605, 2.045232, 0, 0.6117647, 1, 1,
0.2170367, -0.8885359, 1.437251, 0, 0.6039216, 1, 1,
0.2193408, 0.466728, 1.581413, 0, 0.5960785, 1, 1,
0.221984, 0.6767922, -0.3241913, 0, 0.5921569, 1, 1,
0.2223649, -0.168649, 0.8412727, 0, 0.5843138, 1, 1,
0.222992, -0.3477091, 3.147495, 0, 0.5803922, 1, 1,
0.2272852, 0.2263222, 0.989602, 0, 0.572549, 1, 1,
0.2284258, -1.713833, 3.723648, 0, 0.5686275, 1, 1,
0.2303535, 0.3266289, -0.9936839, 0, 0.5607843, 1, 1,
0.2324533, 0.453938, 1.476247, 0, 0.5568628, 1, 1,
0.2348535, -1.936901, 1.54707, 0, 0.5490196, 1, 1,
0.2355354, 1.606874, -1.649785, 0, 0.5450981, 1, 1,
0.238331, -0.9933668, 2.69208, 0, 0.5372549, 1, 1,
0.2385188, -0.1743663, 0.3151023, 0, 0.5333334, 1, 1,
0.2385304, 0.6389415, -0.4771653, 0, 0.5254902, 1, 1,
0.2444638, -1.029582, 3.692769, 0, 0.5215687, 1, 1,
0.2464934, -0.2680492, 3.258329, 0, 0.5137255, 1, 1,
0.2469443, 0.788516, 0.6506231, 0, 0.509804, 1, 1,
0.2478796, 0.07780489, 2.661515, 0, 0.5019608, 1, 1,
0.2495227, -1.566218, 3.160164, 0, 0.4941176, 1, 1,
0.2546644, -0.4082057, 1.594535, 0, 0.4901961, 1, 1,
0.2548855, -0.3124608, 2.973031, 0, 0.4823529, 1, 1,
0.256961, 0.8785247, -0.4412495, 0, 0.4784314, 1, 1,
0.2641359, 0.07386737, 1.237339, 0, 0.4705882, 1, 1,
0.2690959, -0.04298139, 0.8700453, 0, 0.4666667, 1, 1,
0.2696843, -0.1041881, 0.5383359, 0, 0.4588235, 1, 1,
0.2710536, 0.4987285, -0.4899734, 0, 0.454902, 1, 1,
0.2749776, 1.684729, 2.63648, 0, 0.4470588, 1, 1,
0.2816795, 0.1111985, 1.479809, 0, 0.4431373, 1, 1,
0.2817104, -0.9046869, 2.489579, 0, 0.4352941, 1, 1,
0.2873427, 2.125074, 0.9623628, 0, 0.4313726, 1, 1,
0.2875885, -0.08388305, 1.352952, 0, 0.4235294, 1, 1,
0.2884745, 0.3896614, -0.6929885, 0, 0.4196078, 1, 1,
0.2889796, 0.3795452, 0.9648816, 0, 0.4117647, 1, 1,
0.2894252, 0.5692313, -0.415258, 0, 0.4078431, 1, 1,
0.2929977, 0.2193966, 0.345514, 0, 0.4, 1, 1,
0.2934037, -0.2407524, 2.263435, 0, 0.3921569, 1, 1,
0.2953644, 0.2097595, 1.5949, 0, 0.3882353, 1, 1,
0.295449, 0.2953691, 1.439634, 0, 0.3803922, 1, 1,
0.2959585, 1.103238, -1.395403, 0, 0.3764706, 1, 1,
0.299107, 1.425309, 1.078088, 0, 0.3686275, 1, 1,
0.3027151, 0.2207298, -0.7373388, 0, 0.3647059, 1, 1,
0.306928, 1.962844, 1.13031, 0, 0.3568628, 1, 1,
0.3077022, 0.2152706, 1.433704, 0, 0.3529412, 1, 1,
0.3112696, 0.9540573, -1.272324, 0, 0.345098, 1, 1,
0.3130027, 0.2595761, -0.0471787, 0, 0.3411765, 1, 1,
0.3135107, 0.3749265, 0.9939653, 0, 0.3333333, 1, 1,
0.313784, -0.4661147, 2.256205, 0, 0.3294118, 1, 1,
0.3138246, -0.5384129, 1.829107, 0, 0.3215686, 1, 1,
0.3153783, -0.3105785, 1.264853, 0, 0.3176471, 1, 1,
0.3247536, 0.5205937, 1.213124, 0, 0.3098039, 1, 1,
0.3294012, 0.2206516, 1.485319, 0, 0.3058824, 1, 1,
0.3336119, -1.689357, 4.625077, 0, 0.2980392, 1, 1,
0.3416649, -0.538709, 2.581682, 0, 0.2901961, 1, 1,
0.3421577, -0.04744173, 0.7320048, 0, 0.2862745, 1, 1,
0.3439449, -0.5062773, 1.759798, 0, 0.2784314, 1, 1,
0.3452984, -1.332417, 2.290174, 0, 0.2745098, 1, 1,
0.3495672, 0.7462122, 0.1072766, 0, 0.2666667, 1, 1,
0.3514949, -0.3258434, 1.420421, 0, 0.2627451, 1, 1,
0.3516524, 1.570847, 1.022955, 0, 0.254902, 1, 1,
0.3521931, -0.03220375, 1.649384, 0, 0.2509804, 1, 1,
0.3556524, -1.209207, 3.022886, 0, 0.2431373, 1, 1,
0.3652881, -0.246707, 3.334166, 0, 0.2392157, 1, 1,
0.3714963, -0.682194, 2.064388, 0, 0.2313726, 1, 1,
0.3725417, 1.210511, 1.637262, 0, 0.227451, 1, 1,
0.3794812, 0.6046126, -0.3717014, 0, 0.2196078, 1, 1,
0.3834604, -0.07631363, 2.15935, 0, 0.2156863, 1, 1,
0.3872635, 0.4252347, 1.691282, 0, 0.2078431, 1, 1,
0.3930056, 0.4675918, 0.1935093, 0, 0.2039216, 1, 1,
0.395648, -0.7173198, 4.207804, 0, 0.1960784, 1, 1,
0.3979314, 0.07723077, 2.560896, 0, 0.1882353, 1, 1,
0.3996437, 0.5645673, 1.665051, 0, 0.1843137, 1, 1,
0.40057, 0.4156497, 0.8403084, 0, 0.1764706, 1, 1,
0.4108315, -0.7647113, 3.148029, 0, 0.172549, 1, 1,
0.4121405, -0.08145103, 2.043821, 0, 0.1647059, 1, 1,
0.4177519, -1.400291, 3.117093, 0, 0.1607843, 1, 1,
0.4252362, 0.4888445, 0.06592264, 0, 0.1529412, 1, 1,
0.4256573, -1.49356, 2.848395, 0, 0.1490196, 1, 1,
0.433477, -0.849071, 3.207259, 0, 0.1411765, 1, 1,
0.4400122, -0.2693264, -1.26469, 0, 0.1372549, 1, 1,
0.446102, -0.07564013, 2.38397, 0, 0.1294118, 1, 1,
0.4465345, -0.06192558, 0.9397864, 0, 0.1254902, 1, 1,
0.4469619, -0.7666532, 1.379611, 0, 0.1176471, 1, 1,
0.4480385, -0.3718279, 1.405124, 0, 0.1137255, 1, 1,
0.4482405, -0.1228323, 2.323252, 0, 0.1058824, 1, 1,
0.4503891, -1.961529, 6.730286, 0, 0.09803922, 1, 1,
0.4558843, 0.8696084, 1.237275, 0, 0.09411765, 1, 1,
0.4559315, -0.322886, 3.266992, 0, 0.08627451, 1, 1,
0.4561647, 0.3276491, 1.96297, 0, 0.08235294, 1, 1,
0.4565619, -0.5081031, 3.131718, 0, 0.07450981, 1, 1,
0.4599834, -0.8491696, 3.077516, 0, 0.07058824, 1, 1,
0.468551, 0.9387864, 1.232891, 0, 0.0627451, 1, 1,
0.4722438, -1.341852, 3.763605, 0, 0.05882353, 1, 1,
0.47425, -0.04593334, 0.5705465, 0, 0.05098039, 1, 1,
0.4776733, -0.4869933, 2.581551, 0, 0.04705882, 1, 1,
0.4822075, -0.7305897, 2.630788, 0, 0.03921569, 1, 1,
0.4843994, 0.604574, 0.5676859, 0, 0.03529412, 1, 1,
0.4870729, 0.4490923, -0.8436382, 0, 0.02745098, 1, 1,
0.4874963, 0.5193501, 1.183422, 0, 0.02352941, 1, 1,
0.4977785, -0.2177131, 1.208215, 0, 0.01568628, 1, 1,
0.4997359, -1.566836, 2.802165, 0, 0.01176471, 1, 1,
0.5025272, 0.6148278, 0.9705719, 0, 0.003921569, 1, 1,
0.5029576, -0.1331675, 2.036787, 0.003921569, 0, 1, 1,
0.504876, 0.2018282, 0.4139318, 0.007843138, 0, 1, 1,
0.5084444, 1.131112, -0.5013922, 0.01568628, 0, 1, 1,
0.5119832, -0.5944924, 2.100678, 0.01960784, 0, 1, 1,
0.5134572, -1.068636, 2.20476, 0.02745098, 0, 1, 1,
0.514947, -0.9188018, 2.741071, 0.03137255, 0, 1, 1,
0.5216121, 0.9631748, 0.7755744, 0.03921569, 0, 1, 1,
0.5216479, 0.1898829, 0.5583934, 0.04313726, 0, 1, 1,
0.5224102, -1.424647, 3.113447, 0.05098039, 0, 1, 1,
0.5274771, 0.05204418, -0.1265153, 0.05490196, 0, 1, 1,
0.5280379, 1.699421, 0.3572545, 0.0627451, 0, 1, 1,
0.5313065, 0.6249148, 0.02284532, 0.06666667, 0, 1, 1,
0.5321431, 0.1878868, 3.19808, 0.07450981, 0, 1, 1,
0.5340086, -0.02648476, 2.124008, 0.07843138, 0, 1, 1,
0.5401947, 1.916937, -1.815503, 0.08627451, 0, 1, 1,
0.5414882, -0.6262957, 1.910886, 0.09019608, 0, 1, 1,
0.5459596, 0.4251406, 2.336879, 0.09803922, 0, 1, 1,
0.5465909, -0.5498719, 0.9424044, 0.1058824, 0, 1, 1,
0.5587412, 0.9610044, 0.4406585, 0.1098039, 0, 1, 1,
0.565475, 0.569015, 0.8508619, 0.1176471, 0, 1, 1,
0.5683282, -0.2047432, 2.446154, 0.1215686, 0, 1, 1,
0.5698598, 1.802747, -1.798092, 0.1294118, 0, 1, 1,
0.5800171, -0.403731, 1.162515, 0.1333333, 0, 1, 1,
0.58029, 0.7410453, 2.343934, 0.1411765, 0, 1, 1,
0.581158, -0.0802868, 4.305395, 0.145098, 0, 1, 1,
0.5844741, 2.927172, -0.02633993, 0.1529412, 0, 1, 1,
0.5865539, 0.7094392, -0.4127621, 0.1568628, 0, 1, 1,
0.5917514, -0.9601005, 2.757763, 0.1647059, 0, 1, 1,
0.59377, 0.2013227, 0.6065241, 0.1686275, 0, 1, 1,
0.5968786, 2.441812, -1.006897, 0.1764706, 0, 1, 1,
0.5992402, 1.213346, 0.8110163, 0.1803922, 0, 1, 1,
0.6052876, -0.8623645, 0.3870718, 0.1882353, 0, 1, 1,
0.6105378, -0.4017705, 3.540582, 0.1921569, 0, 1, 1,
0.6139052, 0.5670659, -0.647134, 0.2, 0, 1, 1,
0.6144754, 1.038314, 1.457511, 0.2078431, 0, 1, 1,
0.614677, 0.1303001, 1.311327, 0.2117647, 0, 1, 1,
0.6236867, -0.6498355, 3.060411, 0.2196078, 0, 1, 1,
0.6241542, -1.196069, 2.786494, 0.2235294, 0, 1, 1,
0.6246504, -0.6287719, 3.822463, 0.2313726, 0, 1, 1,
0.6251039, -0.1244574, 0.06074066, 0.2352941, 0, 1, 1,
0.625416, 1.203722, 1.532476, 0.2431373, 0, 1, 1,
0.6306475, -1.618028, 2.435682, 0.2470588, 0, 1, 1,
0.6308737, -0.141493, 0.7987067, 0.254902, 0, 1, 1,
0.6311105, 0.6341797, -0.3614278, 0.2588235, 0, 1, 1,
0.636035, 0.5193431, 0.1853916, 0.2666667, 0, 1, 1,
0.6375694, 0.2923931, 2.002227, 0.2705882, 0, 1, 1,
0.6426356, 0.5334525, 1.630443, 0.2784314, 0, 1, 1,
0.6427314, -0.04353223, 0.5191095, 0.282353, 0, 1, 1,
0.6546507, -1.217151, 3.271595, 0.2901961, 0, 1, 1,
0.65584, 0.03074181, 2.210458, 0.2941177, 0, 1, 1,
0.6587485, -2.678148, 1.764102, 0.3019608, 0, 1, 1,
0.6646926, 1.412825, -1.06715, 0.3098039, 0, 1, 1,
0.6648046, 0.6321049, 0.5726472, 0.3137255, 0, 1, 1,
0.6707721, 0.4206358, 1.50238, 0.3215686, 0, 1, 1,
0.6713958, -1.8144, 2.074891, 0.3254902, 0, 1, 1,
0.6724954, 0.5774433, 0.5288774, 0.3333333, 0, 1, 1,
0.6740805, 1.24535, -0.7416434, 0.3372549, 0, 1, 1,
0.6816519, -0.5805091, 1.833245, 0.345098, 0, 1, 1,
0.6828518, 0.0505459, 1.244104, 0.3490196, 0, 1, 1,
0.6847959, -0.7347418, 3.309455, 0.3568628, 0, 1, 1,
0.6921033, 0.2145005, 3.044272, 0.3607843, 0, 1, 1,
0.6936536, 1.490437, 1.339869, 0.3686275, 0, 1, 1,
0.6948204, 0.2755227, 1.707606, 0.372549, 0, 1, 1,
0.6972662, -0.8749216, 1.083285, 0.3803922, 0, 1, 1,
0.7016069, 0.06648885, 1.69896, 0.3843137, 0, 1, 1,
0.7116404, -2.050678, 1.534737, 0.3921569, 0, 1, 1,
0.7134389, 0.5255329, -0.6743345, 0.3960784, 0, 1, 1,
0.7169302, -0.6255381, 2.538419, 0.4039216, 0, 1, 1,
0.7211005, -0.2471854, 2.457223, 0.4117647, 0, 1, 1,
0.7244871, 0.4945925, -1.075976, 0.4156863, 0, 1, 1,
0.7253748, 0.2474531, 1.39724, 0.4235294, 0, 1, 1,
0.7277929, -0.4189453, 1.94297, 0.427451, 0, 1, 1,
0.7284663, 0.4418676, -0.7966253, 0.4352941, 0, 1, 1,
0.7287495, -0.078049, -0.4431176, 0.4392157, 0, 1, 1,
0.7308538, 0.7014357, 1.328345, 0.4470588, 0, 1, 1,
0.7328742, 1.410838, -1.571388, 0.4509804, 0, 1, 1,
0.7337739, 1.678161, -0.2445395, 0.4588235, 0, 1, 1,
0.7398978, 0.663579, 1.433415, 0.4627451, 0, 1, 1,
0.7470607, -1.152757, 2.317421, 0.4705882, 0, 1, 1,
0.7550683, 0.2339279, 1.310822, 0.4745098, 0, 1, 1,
0.759101, 1.416637, -0.799334, 0.4823529, 0, 1, 1,
0.7612228, 0.2553052, 0.4132659, 0.4862745, 0, 1, 1,
0.7625748, 1.027022, 0.1791851, 0.4941176, 0, 1, 1,
0.7627316, -1.025557, 2.668724, 0.5019608, 0, 1, 1,
0.7663379, -0.3338784, 1.787577, 0.5058824, 0, 1, 1,
0.7717022, 0.5790634, 1.827678, 0.5137255, 0, 1, 1,
0.7770713, 0.467192, -0.7712791, 0.5176471, 0, 1, 1,
0.7790366, 1.683826, 0.326863, 0.5254902, 0, 1, 1,
0.7793477, 0.5160254, 4.25542, 0.5294118, 0, 1, 1,
0.7801812, -0.0574461, 1.133565, 0.5372549, 0, 1, 1,
0.782587, 2.318932, 1.148414, 0.5411765, 0, 1, 1,
0.7894597, 1.499937, 0.05472294, 0.5490196, 0, 1, 1,
0.7903737, -1.617186, 0.914108, 0.5529412, 0, 1, 1,
0.7986759, -0.7323934, 2.156615, 0.5607843, 0, 1, 1,
0.8006976, 0.2276252, 2.65392, 0.5647059, 0, 1, 1,
0.8048827, 0.2654538, 0.6908189, 0.572549, 0, 1, 1,
0.8132933, -1.074004, 3.09401, 0.5764706, 0, 1, 1,
0.815633, -2.036893, 2.117605, 0.5843138, 0, 1, 1,
0.8301698, 1.21516, 0.844025, 0.5882353, 0, 1, 1,
0.8337013, -1.359285, 3.057595, 0.5960785, 0, 1, 1,
0.8385857, -0.9947176, 3.163007, 0.6039216, 0, 1, 1,
0.8429061, -0.2342379, 1.183166, 0.6078432, 0, 1, 1,
0.8461977, -0.4030366, 2.455987, 0.6156863, 0, 1, 1,
0.8467688, -1.305313, 2.026002, 0.6196079, 0, 1, 1,
0.8475005, -2.563305, 2.219832, 0.627451, 0, 1, 1,
0.8508795, 0.2263235, 0.0294961, 0.6313726, 0, 1, 1,
0.8521328, -1.564274, 2.18993, 0.6392157, 0, 1, 1,
0.8550623, 0.3996181, 0.961008, 0.6431373, 0, 1, 1,
0.8552255, 0.009224192, 2.445012, 0.6509804, 0, 1, 1,
0.8567067, 1.923102, -0.6902488, 0.654902, 0, 1, 1,
0.8640192, -1.920753, 2.489467, 0.6627451, 0, 1, 1,
0.8656032, -0.6018669, 3.607218, 0.6666667, 0, 1, 1,
0.8693464, 2.064993, 1.931607, 0.6745098, 0, 1, 1,
0.8743913, -0.9219776, 1.633636, 0.6784314, 0, 1, 1,
0.8752934, 1.121224, -0.6766284, 0.6862745, 0, 1, 1,
0.8754532, -0.4225214, 3.899384, 0.6901961, 0, 1, 1,
0.8783056, -0.4029736, 2.652437, 0.6980392, 0, 1, 1,
0.8797382, 0.2415208, 1.528158, 0.7058824, 0, 1, 1,
0.8812181, 0.1087839, 1.260869, 0.7098039, 0, 1, 1,
0.8823738, 1.099346, 0.9631971, 0.7176471, 0, 1, 1,
0.8839936, 0.2463242, 2.657996, 0.7215686, 0, 1, 1,
0.886739, -2.63206, 4.044384, 0.7294118, 0, 1, 1,
0.8875461, -0.06770158, 1.399024, 0.7333333, 0, 1, 1,
0.8936493, -0.4779674, 3.257897, 0.7411765, 0, 1, 1,
0.8988226, 1.007509, 2.440206, 0.7450981, 0, 1, 1,
0.913355, -0.8282933, 4.62398, 0.7529412, 0, 1, 1,
0.9143806, -0.7500237, 0.6389485, 0.7568628, 0, 1, 1,
0.9179392, -0.7893366, 2.654548, 0.7647059, 0, 1, 1,
0.9191878, 0.8270726, 2.111485, 0.7686275, 0, 1, 1,
0.9209626, 0.03716317, 0.931759, 0.7764706, 0, 1, 1,
0.9244996, -0.0472883, 1.855083, 0.7803922, 0, 1, 1,
0.9263264, -2.2643, 1.834371, 0.7882353, 0, 1, 1,
0.9305908, -2.310114, 2.71124, 0.7921569, 0, 1, 1,
0.9364595, 0.6917024, 3.083967, 0.8, 0, 1, 1,
0.9395273, -0.1778756, 0.3114445, 0.8078431, 0, 1, 1,
0.9439829, 1.485581, 0.4408129, 0.8117647, 0, 1, 1,
0.9478183, -0.1062529, 1.791595, 0.8196079, 0, 1, 1,
0.9539498, 0.175202, 1.669367, 0.8235294, 0, 1, 1,
0.9563973, 1.099287, -0.7805468, 0.8313726, 0, 1, 1,
0.9620662, -0.400732, 2.37197, 0.8352941, 0, 1, 1,
0.967299, -0.1692944, 1.881047, 0.8431373, 0, 1, 1,
0.9717704, -1.539492, 2.912864, 0.8470588, 0, 1, 1,
0.9801133, 0.1093671, 1.403413, 0.854902, 0, 1, 1,
0.9818687, 0.6415679, 1.354037, 0.8588235, 0, 1, 1,
0.9865097, 1.195872, -0.5207618, 0.8666667, 0, 1, 1,
0.9874346, -0.5431427, 2.287561, 0.8705882, 0, 1, 1,
0.9902729, -0.01714646, 0.240241, 0.8784314, 0, 1, 1,
0.9906939, -0.3973657, 0.8279618, 0.8823529, 0, 1, 1,
0.9928671, 0.5100885, 2.50447, 0.8901961, 0, 1, 1,
0.9942764, -0.5471935, 0.831354, 0.8941177, 0, 1, 1,
0.9983567, -1.685528, 1.88822, 0.9019608, 0, 1, 1,
0.9983896, 1.424668, 0.1195123, 0.9098039, 0, 1, 1,
0.9993726, 0.63258, 2.359731, 0.9137255, 0, 1, 1,
1.012856, -1.755704, 0.6532753, 0.9215686, 0, 1, 1,
1.013266, 0.807215, 1.465311, 0.9254902, 0, 1, 1,
1.016857, 0.7383591, 2.071217, 0.9333333, 0, 1, 1,
1.017769, 0.1444675, 0.1256927, 0.9372549, 0, 1, 1,
1.019463, 0.2095928, 0.8029231, 0.945098, 0, 1, 1,
1.02186, -0.2115035, 1.307982, 0.9490196, 0, 1, 1,
1.030618, -0.328592, 2.423129, 0.9568627, 0, 1, 1,
1.036024, 0.8420383, 0.8831788, 0.9607843, 0, 1, 1,
1.036355, 1.489563, 0.04672137, 0.9686275, 0, 1, 1,
1.044234, 0.08529176, 1.692715, 0.972549, 0, 1, 1,
1.047127, -0.9839513, 0.5728897, 0.9803922, 0, 1, 1,
1.05451, -0.06997657, 0.8488972, 0.9843137, 0, 1, 1,
1.056149, 0.06328993, 0.3805196, 0.9921569, 0, 1, 1,
1.060425, 0.1709304, 0.399686, 0.9960784, 0, 1, 1,
1.061205, 1.112203, 1.241008, 1, 0, 0.9960784, 1,
1.062857, -0.06620575, 1.066005, 1, 0, 0.9882353, 1,
1.067612, 1.646713, 1.093328, 1, 0, 0.9843137, 1,
1.070955, 1.192968, 0.3154886, 1, 0, 0.9764706, 1,
1.071866, 0.6593717, 0.2573134, 1, 0, 0.972549, 1,
1.077922, 0.6819626, -0.7321376, 1, 0, 0.9647059, 1,
1.085999, 0.8414805, -0.7029428, 1, 0, 0.9607843, 1,
1.086119, 0.2476882, -0.08369508, 1, 0, 0.9529412, 1,
1.088524, 0.435147, 0.6752589, 1, 0, 0.9490196, 1,
1.089634, 0.3415572, 0.1347301, 1, 0, 0.9411765, 1,
1.092575, 0.1286957, 2.807504, 1, 0, 0.9372549, 1,
1.094278, 0.4475116, 1.77921, 1, 0, 0.9294118, 1,
1.094735, 0.006800774, 2.886096, 1, 0, 0.9254902, 1,
1.099622, 0.5263197, 0.05876061, 1, 0, 0.9176471, 1,
1.099715, -0.2068251, 0.2407713, 1, 0, 0.9137255, 1,
1.106293, -1.739592, 2.50406, 1, 0, 0.9058824, 1,
1.111107, -0.7784256, 2.930573, 1, 0, 0.9019608, 1,
1.119763, 2.064178, 0.5293988, 1, 0, 0.8941177, 1,
1.126136, -1.162075, 2.340472, 1, 0, 0.8862745, 1,
1.12616, 0.8295822, 0.008952594, 1, 0, 0.8823529, 1,
1.126915, 0.5611316, 0.1763318, 1, 0, 0.8745098, 1,
1.128806, 0.06149227, 3.058233, 1, 0, 0.8705882, 1,
1.131164, -0.1765665, 1.275681, 1, 0, 0.8627451, 1,
1.131712, -0.6988859, 2.309392, 1, 0, 0.8588235, 1,
1.141328, -0.6423707, 1.958657, 1, 0, 0.8509804, 1,
1.150923, 2.031539, -0.313741, 1, 0, 0.8470588, 1,
1.151953, 0.5211232, 2.911523, 1, 0, 0.8392157, 1,
1.160591, 0.4398861, 0.698651, 1, 0, 0.8352941, 1,
1.162853, -0.05616991, 2.897813, 1, 0, 0.827451, 1,
1.163674, -0.4962335, 1.534161, 1, 0, 0.8235294, 1,
1.16876, 0.279998, 1.1659, 1, 0, 0.8156863, 1,
1.174533, 0.5523562, 1.488262, 1, 0, 0.8117647, 1,
1.177283, -1.209119, 0.8332526, 1, 0, 0.8039216, 1,
1.185031, -0.692345, 2.845152, 1, 0, 0.7960784, 1,
1.192282, -0.8588538, 2.818245, 1, 0, 0.7921569, 1,
1.192313, -1.008655, 3.288288, 1, 0, 0.7843137, 1,
1.195466, 0.7568898, 0.6107083, 1, 0, 0.7803922, 1,
1.200492, 1.827305, 0.2112424, 1, 0, 0.772549, 1,
1.208323, 0.04783833, 1.764743, 1, 0, 0.7686275, 1,
1.213664, -1.209417, 0.8152429, 1, 0, 0.7607843, 1,
1.214703, 0.3647015, 1.119221, 1, 0, 0.7568628, 1,
1.22168, 0.02696784, 1.588599, 1, 0, 0.7490196, 1,
1.223855, -1.276255, 3.254909, 1, 0, 0.7450981, 1,
1.226153, -0.6476331, 2.332986, 1, 0, 0.7372549, 1,
1.231813, 0.1851956, 0.5349302, 1, 0, 0.7333333, 1,
1.233095, 0.2411931, 0.6637461, 1, 0, 0.7254902, 1,
1.239819, -0.5342008, 1.312615, 1, 0, 0.7215686, 1,
1.24433, 0.6211095, 0.6835241, 1, 0, 0.7137255, 1,
1.246525, 0.904152, 1.117795, 1, 0, 0.7098039, 1,
1.249132, -0.3763516, 1.502184, 1, 0, 0.7019608, 1,
1.254748, -1.825362, 1.36835, 1, 0, 0.6941177, 1,
1.272519, -0.4527928, 2.694065, 1, 0, 0.6901961, 1,
1.273335, 0.09674963, 2.747055, 1, 0, 0.682353, 1,
1.276069, 0.4194094, 0.5131608, 1, 0, 0.6784314, 1,
1.296722, 0.713375, 0.9802093, 1, 0, 0.6705883, 1,
1.305836, 0.5020533, 1.881399, 1, 0, 0.6666667, 1,
1.315685, -0.1187016, 2.324666, 1, 0, 0.6588235, 1,
1.324391, -0.5767462, 1.229584, 1, 0, 0.654902, 1,
1.324959, -0.5320165, -0.1158891, 1, 0, 0.6470588, 1,
1.329973, -0.09919018, 1.80341, 1, 0, 0.6431373, 1,
1.335697, 1.376853, -0.3513721, 1, 0, 0.6352941, 1,
1.342986, -0.9445786, 2.10575, 1, 0, 0.6313726, 1,
1.343277, 2.09832, 1.0747, 1, 0, 0.6235294, 1,
1.343737, -1.667731, 1.349634, 1, 0, 0.6196079, 1,
1.344815, 0.7785947, 0.5688483, 1, 0, 0.6117647, 1,
1.353329, 0.1142953, -1.487001, 1, 0, 0.6078432, 1,
1.357609, 0.4644195, 3.545648, 1, 0, 0.6, 1,
1.361997, -1.10873, 2.253632, 1, 0, 0.5921569, 1,
1.371902, 0.7535001, 2.077862, 1, 0, 0.5882353, 1,
1.383222, 0.5223336, 1.767796, 1, 0, 0.5803922, 1,
1.39652, 1.153994, 2.560347, 1, 0, 0.5764706, 1,
1.400858, -0.6331005, 2.779906, 1, 0, 0.5686275, 1,
1.401059, 0.2588706, 2.310911, 1, 0, 0.5647059, 1,
1.402301, -0.5929824, 3.36951, 1, 0, 0.5568628, 1,
1.404146, 1.295845, 2.265593, 1, 0, 0.5529412, 1,
1.42331, 2.058357, 2.745535, 1, 0, 0.5450981, 1,
1.428884, -0.3433098, 2.472343, 1, 0, 0.5411765, 1,
1.429046, -0.3943264, 1.622908, 1, 0, 0.5333334, 1,
1.430138, 0.2892381, 1.456552, 1, 0, 0.5294118, 1,
1.430225, -0.8902785, 3.260835, 1, 0, 0.5215687, 1,
1.445737, 0.2348047, 0.5169544, 1, 0, 0.5176471, 1,
1.447071, -1.061693, 3.209053, 1, 0, 0.509804, 1,
1.449973, 0.7018955, -0.6100572, 1, 0, 0.5058824, 1,
1.45301, 1.455917, 2.7142, 1, 0, 0.4980392, 1,
1.458919, -0.1286398, 1.088334, 1, 0, 0.4901961, 1,
1.459877, -0.4293228, 2.838172, 1, 0, 0.4862745, 1,
1.462048, -0.5681967, 1.489215, 1, 0, 0.4784314, 1,
1.464842, 1.508011, -0.5727247, 1, 0, 0.4745098, 1,
1.47728, -1.277559, 1.444446, 1, 0, 0.4666667, 1,
1.486781, -0.08809794, 0.3553062, 1, 0, 0.4627451, 1,
1.497302, 2.222371, 1.816702, 1, 0, 0.454902, 1,
1.50433, 0.4639017, 1.328308, 1, 0, 0.4509804, 1,
1.510858, 0.1581894, 1.453371, 1, 0, 0.4431373, 1,
1.511447, -0.3988353, 1.561354, 1, 0, 0.4392157, 1,
1.522222, -0.9558827, 1.067194, 1, 0, 0.4313726, 1,
1.526021, -0.0255826, 1.442608, 1, 0, 0.427451, 1,
1.528208, -1.01478, 1.706471, 1, 0, 0.4196078, 1,
1.532994, 1.023036, 0.920785, 1, 0, 0.4156863, 1,
1.535058, -0.1163478, 3.465706, 1, 0, 0.4078431, 1,
1.537759, 0.7142316, -0.473025, 1, 0, 0.4039216, 1,
1.540625, -0.3931659, 1.539696, 1, 0, 0.3960784, 1,
1.552504, 1.331833, 1.418789, 1, 0, 0.3882353, 1,
1.557246, -0.8917701, 0.04734193, 1, 0, 0.3843137, 1,
1.562013, 0.6078026, 0.418919, 1, 0, 0.3764706, 1,
1.567644, 1.053249, 2.146373, 1, 0, 0.372549, 1,
1.568134, -0.0961014, 2.176301, 1, 0, 0.3647059, 1,
1.569236, 1.2372, 0.2771401, 1, 0, 0.3607843, 1,
1.576126, -0.708083, 1.994926, 1, 0, 0.3529412, 1,
1.576433, 1.090001, -0.3391452, 1, 0, 0.3490196, 1,
1.593366, -0.5424616, 0.8548067, 1, 0, 0.3411765, 1,
1.606633, 0.8396972, 1.472222, 1, 0, 0.3372549, 1,
1.621013, 0.7422584, 1.921196, 1, 0, 0.3294118, 1,
1.625911, 1.539939, 0.130199, 1, 0, 0.3254902, 1,
1.64422, 0.3756642, 3.451248, 1, 0, 0.3176471, 1,
1.660097, 0.5832457, 0.3047536, 1, 0, 0.3137255, 1,
1.669945, 2.104614, -1.839095, 1, 0, 0.3058824, 1,
1.674359, -0.7297275, 3.712538, 1, 0, 0.2980392, 1,
1.729382, 1.2385, -0.3005656, 1, 0, 0.2941177, 1,
1.740202, -1.990771, 2.49183, 1, 0, 0.2862745, 1,
1.742988, -0.3758828, 1.928857, 1, 0, 0.282353, 1,
1.751584, -0.8799354, 0.6881623, 1, 0, 0.2745098, 1,
1.765007, 0.6280434, 1.564283, 1, 0, 0.2705882, 1,
1.768674, -0.2776697, 1.787765, 1, 0, 0.2627451, 1,
1.775253, 0.01586231, 1.780718, 1, 0, 0.2588235, 1,
1.78866, -0.1279915, 1.432531, 1, 0, 0.2509804, 1,
1.797572, -1.747873, 2.490563, 1, 0, 0.2470588, 1,
1.809553, -1.194075, 4.156834, 1, 0, 0.2392157, 1,
1.825511, 0.6920493, 1.622278, 1, 0, 0.2352941, 1,
1.828248, 1.191327, 1.069435, 1, 0, 0.227451, 1,
1.830061, 0.4845602, 3.261577, 1, 0, 0.2235294, 1,
1.850205, -0.372353, 1.032064, 1, 0, 0.2156863, 1,
1.863951, -0.4108513, 4.228641, 1, 0, 0.2117647, 1,
1.874949, -0.4791074, 2.764359, 1, 0, 0.2039216, 1,
1.89366, -0.9389827, 2.029905, 1, 0, 0.1960784, 1,
1.915498, 1.294627, -1.783299, 1, 0, 0.1921569, 1,
1.91947, 0.6150584, 0.6541429, 1, 0, 0.1843137, 1,
1.928435, -0.2462443, 2.980995, 1, 0, 0.1803922, 1,
1.94414, -0.2372065, 1.144686, 1, 0, 0.172549, 1,
1.968153, 1.481915, 0.8474703, 1, 0, 0.1686275, 1,
2.031333, 1.107507, 1.926833, 1, 0, 0.1607843, 1,
2.060333, -0.4603452, 0.7646921, 1, 0, 0.1568628, 1,
2.067997, -0.4712074, -0.09315678, 1, 0, 0.1490196, 1,
2.110581, 0.7420235, 2.103349, 1, 0, 0.145098, 1,
2.113589, 0.7280875, 1.84426, 1, 0, 0.1372549, 1,
2.115712, 0.0529831, 2.726144, 1, 0, 0.1333333, 1,
2.152541, 0.3756453, 0.4677184, 1, 0, 0.1254902, 1,
2.164135, -0.2590198, 2.437678, 1, 0, 0.1215686, 1,
2.175917, 0.1723695, 1.314228, 1, 0, 0.1137255, 1,
2.186597, 0.4322484, 1.891548, 1, 0, 0.1098039, 1,
2.229042, 0.1490304, 0.7440707, 1, 0, 0.1019608, 1,
2.238487, -0.0460553, 0.4164011, 1, 0, 0.09411765, 1,
2.239196, -0.4455293, 1.743546, 1, 0, 0.09019608, 1,
2.242686, 1.761656, 0.005848263, 1, 0, 0.08235294, 1,
2.265502, -0.7971584, 1.63358, 1, 0, 0.07843138, 1,
2.288945, 0.02029092, 3.110365, 1, 0, 0.07058824, 1,
2.297239, -1.757813, 2.326418, 1, 0, 0.06666667, 1,
2.377325, 1.119686, 0.7736152, 1, 0, 0.05882353, 1,
2.39775, 0.3248958, 2.580609, 1, 0, 0.05490196, 1,
2.446372, -1.32379, 2.393064, 1, 0, 0.04705882, 1,
2.446878, 2.026804, 0.9560807, 1, 0, 0.04313726, 1,
2.487395, 0.6417989, 1.937161, 1, 0, 0.03529412, 1,
2.513139, -0.8736904, 4.19636, 1, 0, 0.03137255, 1,
2.517529, 0.1219703, 1.559956, 1, 0, 0.02352941, 1,
2.680399, -1.842936, 1.840672, 1, 0, 0.01960784, 1,
2.881034, -0.8833696, 2.103307, 1, 0, 0.01176471, 1,
3.357875, -2.404258, 2.690837, 1, 0, 0.007843138, 1
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
-0.03332448, -3.759645, -8.102438, 0, -0.5, 0.5, 0.5,
-0.03332448, -3.759645, -8.102438, 1, -0.5, 0.5, 0.5,
-0.03332448, -3.759645, -8.102438, 1, 1.5, 0.5, 0.5,
-0.03332448, -3.759645, -8.102438, 0, 1.5, 0.5, 0.5
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
-4.574141, 0.06833613, -8.102438, 0, -0.5, 0.5, 0.5,
-4.574141, 0.06833613, -8.102438, 1, -0.5, 0.5, 0.5,
-4.574141, 0.06833613, -8.102438, 1, 1.5, 0.5, 0.5,
-4.574141, 0.06833613, -8.102438, 0, 1.5, 0.5, 0.5
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
-4.574141, -3.759645, 0.3888049, 0, -0.5, 0.5, 0.5,
-4.574141, -3.759645, 0.3888049, 1, -0.5, 0.5, 0.5,
-4.574141, -3.759645, 0.3888049, 1, 1.5, 0.5, 0.5,
-4.574141, -3.759645, 0.3888049, 0, 1.5, 0.5, 0.5
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
-3, -2.876265, -6.14292,
3, -2.876265, -6.14292,
-3, -2.876265, -6.14292,
-3, -3.023495, -6.469507,
-2, -2.876265, -6.14292,
-2, -3.023495, -6.469507,
-1, -2.876265, -6.14292,
-1, -3.023495, -6.469507,
0, -2.876265, -6.14292,
0, -3.023495, -6.469507,
1, -2.876265, -6.14292,
1, -3.023495, -6.469507,
2, -2.876265, -6.14292,
2, -3.023495, -6.469507,
3, -2.876265, -6.14292,
3, -3.023495, -6.469507
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
-3, -3.317955, -7.12268, 0, -0.5, 0.5, 0.5,
-3, -3.317955, -7.12268, 1, -0.5, 0.5, 0.5,
-3, -3.317955, -7.12268, 1, 1.5, 0.5, 0.5,
-3, -3.317955, -7.12268, 0, 1.5, 0.5, 0.5,
-2, -3.317955, -7.12268, 0, -0.5, 0.5, 0.5,
-2, -3.317955, -7.12268, 1, -0.5, 0.5, 0.5,
-2, -3.317955, -7.12268, 1, 1.5, 0.5, 0.5,
-2, -3.317955, -7.12268, 0, 1.5, 0.5, 0.5,
-1, -3.317955, -7.12268, 0, -0.5, 0.5, 0.5,
-1, -3.317955, -7.12268, 1, -0.5, 0.5, 0.5,
-1, -3.317955, -7.12268, 1, 1.5, 0.5, 0.5,
-1, -3.317955, -7.12268, 0, 1.5, 0.5, 0.5,
0, -3.317955, -7.12268, 0, -0.5, 0.5, 0.5,
0, -3.317955, -7.12268, 1, -0.5, 0.5, 0.5,
0, -3.317955, -7.12268, 1, 1.5, 0.5, 0.5,
0, -3.317955, -7.12268, 0, 1.5, 0.5, 0.5,
1, -3.317955, -7.12268, 0, -0.5, 0.5, 0.5,
1, -3.317955, -7.12268, 1, -0.5, 0.5, 0.5,
1, -3.317955, -7.12268, 1, 1.5, 0.5, 0.5,
1, -3.317955, -7.12268, 0, 1.5, 0.5, 0.5,
2, -3.317955, -7.12268, 0, -0.5, 0.5, 0.5,
2, -3.317955, -7.12268, 1, -0.5, 0.5, 0.5,
2, -3.317955, -7.12268, 1, 1.5, 0.5, 0.5,
2, -3.317955, -7.12268, 0, 1.5, 0.5, 0.5,
3, -3.317955, -7.12268, 0, -0.5, 0.5, 0.5,
3, -3.317955, -7.12268, 1, -0.5, 0.5, 0.5,
3, -3.317955, -7.12268, 1, 1.5, 0.5, 0.5,
3, -3.317955, -7.12268, 0, 1.5, 0.5, 0.5
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
-3.52626, -2, -6.14292,
-3.52626, 2, -6.14292,
-3.52626, -2, -6.14292,
-3.700907, -2, -6.469507,
-3.52626, -1, -6.14292,
-3.700907, -1, -6.469507,
-3.52626, 0, -6.14292,
-3.700907, 0, -6.469507,
-3.52626, 1, -6.14292,
-3.700907, 1, -6.469507,
-3.52626, 2, -6.14292,
-3.700907, 2, -6.469507
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
-4.0502, -2, -7.12268, 0, -0.5, 0.5, 0.5,
-4.0502, -2, -7.12268, 1, -0.5, 0.5, 0.5,
-4.0502, -2, -7.12268, 1, 1.5, 0.5, 0.5,
-4.0502, -2, -7.12268, 0, 1.5, 0.5, 0.5,
-4.0502, -1, -7.12268, 0, -0.5, 0.5, 0.5,
-4.0502, -1, -7.12268, 1, -0.5, 0.5, 0.5,
-4.0502, -1, -7.12268, 1, 1.5, 0.5, 0.5,
-4.0502, -1, -7.12268, 0, 1.5, 0.5, 0.5,
-4.0502, 0, -7.12268, 0, -0.5, 0.5, 0.5,
-4.0502, 0, -7.12268, 1, -0.5, 0.5, 0.5,
-4.0502, 0, -7.12268, 1, 1.5, 0.5, 0.5,
-4.0502, 0, -7.12268, 0, 1.5, 0.5, 0.5,
-4.0502, 1, -7.12268, 0, -0.5, 0.5, 0.5,
-4.0502, 1, -7.12268, 1, -0.5, 0.5, 0.5,
-4.0502, 1, -7.12268, 1, 1.5, 0.5, 0.5,
-4.0502, 1, -7.12268, 0, 1.5, 0.5, 0.5,
-4.0502, 2, -7.12268, 0, -0.5, 0.5, 0.5,
-4.0502, 2, -7.12268, 1, -0.5, 0.5, 0.5,
-4.0502, 2, -7.12268, 1, 1.5, 0.5, 0.5,
-4.0502, 2, -7.12268, 0, 1.5, 0.5, 0.5
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
-3.52626, -2.876265, -4,
-3.52626, -2.876265, 6,
-3.52626, -2.876265, -4,
-3.700907, -3.023495, -4,
-3.52626, -2.876265, -2,
-3.700907, -3.023495, -2,
-3.52626, -2.876265, 0,
-3.700907, -3.023495, 0,
-3.52626, -2.876265, 2,
-3.700907, -3.023495, 2,
-3.52626, -2.876265, 4,
-3.700907, -3.023495, 4,
-3.52626, -2.876265, 6,
-3.700907, -3.023495, 6
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
-4.0502, -3.317955, -4, 0, -0.5, 0.5, 0.5,
-4.0502, -3.317955, -4, 1, -0.5, 0.5, 0.5,
-4.0502, -3.317955, -4, 1, 1.5, 0.5, 0.5,
-4.0502, -3.317955, -4, 0, 1.5, 0.5, 0.5,
-4.0502, -3.317955, -2, 0, -0.5, 0.5, 0.5,
-4.0502, -3.317955, -2, 1, -0.5, 0.5, 0.5,
-4.0502, -3.317955, -2, 1, 1.5, 0.5, 0.5,
-4.0502, -3.317955, -2, 0, 1.5, 0.5, 0.5,
-4.0502, -3.317955, 0, 0, -0.5, 0.5, 0.5,
-4.0502, -3.317955, 0, 1, -0.5, 0.5, 0.5,
-4.0502, -3.317955, 0, 1, 1.5, 0.5, 0.5,
-4.0502, -3.317955, 0, 0, 1.5, 0.5, 0.5,
-4.0502, -3.317955, 2, 0, -0.5, 0.5, 0.5,
-4.0502, -3.317955, 2, 1, -0.5, 0.5, 0.5,
-4.0502, -3.317955, 2, 1, 1.5, 0.5, 0.5,
-4.0502, -3.317955, 2, 0, 1.5, 0.5, 0.5,
-4.0502, -3.317955, 4, 0, -0.5, 0.5, 0.5,
-4.0502, -3.317955, 4, 1, -0.5, 0.5, 0.5,
-4.0502, -3.317955, 4, 1, 1.5, 0.5, 0.5,
-4.0502, -3.317955, 4, 0, 1.5, 0.5, 0.5,
-4.0502, -3.317955, 6, 0, -0.5, 0.5, 0.5,
-4.0502, -3.317955, 6, 1, -0.5, 0.5, 0.5,
-4.0502, -3.317955, 6, 1, 1.5, 0.5, 0.5,
-4.0502, -3.317955, 6, 0, 1.5, 0.5, 0.5
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
-3.52626, -2.876265, -6.14292,
-3.52626, 3.012937, -6.14292,
-3.52626, -2.876265, 6.92053,
-3.52626, 3.012937, 6.92053,
-3.52626, -2.876265, -6.14292,
-3.52626, -2.876265, 6.92053,
-3.52626, 3.012937, -6.14292,
-3.52626, 3.012937, 6.92053,
-3.52626, -2.876265, -6.14292,
3.459611, -2.876265, -6.14292,
-3.52626, -2.876265, 6.92053,
3.459611, -2.876265, 6.92053,
-3.52626, 3.012937, -6.14292,
3.459611, 3.012937, -6.14292,
-3.52626, 3.012937, 6.92053,
3.459611, 3.012937, 6.92053,
3.459611, -2.876265, -6.14292,
3.459611, 3.012937, -6.14292,
3.459611, -2.876265, 6.92053,
3.459611, 3.012937, 6.92053,
3.459611, -2.876265, -6.14292,
3.459611, -2.876265, 6.92053,
3.459611, 3.012937, -6.14292,
3.459611, 3.012937, 6.92053
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
var radius = 8.512576;
var distance = 37.87341;
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
mvMatrix.translate( 0.03332448, -0.06833613, -0.3888049 );
mvMatrix.scale( 1.317511, 1.562854, 0.7045584 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.87341);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
fenpropidin<-read.table("fenpropidin.xyz")
```

```
## Error in read.table("fenpropidin.xyz"): no lines available in input
```

```r
x<-fenpropidin$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenpropidin' not found
```

```r
y<-fenpropidin$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenpropidin' not found
```

```r
z<-fenpropidin$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenpropidin' not found
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
-3.424524, -0.3401504, -1.862354, 0, 0, 1, 1, 1,
-3.116734, 2.611273, -1.416862, 1, 0, 0, 1, 1,
-2.967432, 0.1618184, -1.881746, 1, 0, 0, 1, 1,
-2.953233, -0.07269404, -0.1769694, 1, 0, 0, 1, 1,
-2.849552, -1.952008, -1.670597, 1, 0, 0, 1, 1,
-2.718075, 0.1771933, -2.424897, 1, 0, 0, 1, 1,
-2.706541, -0.7138312, -1.523247, 0, 0, 0, 1, 1,
-2.58205, -1.143035, -1.224413, 0, 0, 0, 1, 1,
-2.467348, -0.1587104, -1.891964, 0, 0, 0, 1, 1,
-2.455953, 1.579834, -0.9065812, 0, 0, 0, 1, 1,
-2.243551, -2.001787, -0.7456645, 0, 0, 0, 1, 1,
-2.217022, 1.631865, -1.368156, 0, 0, 0, 1, 1,
-2.191087, 0.08876398, -3.429647, 0, 0, 0, 1, 1,
-2.175904, -2.490172, -0.2139805, 1, 1, 1, 1, 1,
-2.145113, 0.8842171, -1.069984, 1, 1, 1, 1, 1,
-2.140199, -0.7941309, -2.773338, 1, 1, 1, 1, 1,
-2.090027, 0.5861616, -1.782864, 1, 1, 1, 1, 1,
-2.077926, -1.32732, -2.331535, 1, 1, 1, 1, 1,
-2.077078, -0.608206, -2.745179, 1, 1, 1, 1, 1,
-2.04273, -1.226438, -3.377218, 1, 1, 1, 1, 1,
-1.963899, 1.32933, -1.283064, 1, 1, 1, 1, 1,
-1.926545, -2.072486, -1.930302, 1, 1, 1, 1, 1,
-1.915001, 0.9615847, -0.8131469, 1, 1, 1, 1, 1,
-1.914778, -0.9595227, -1.097072, 1, 1, 1, 1, 1,
-1.913233, -1.24651, -4.105003, 1, 1, 1, 1, 1,
-1.906819, -0.04299535, -0.1365064, 1, 1, 1, 1, 1,
-1.875746, 0.6440303, -1.771837, 1, 1, 1, 1, 1,
-1.871982, -0.08083966, -2.51617, 1, 1, 1, 1, 1,
-1.838915, -0.4399259, -2.400021, 0, 0, 1, 1, 1,
-1.813001, -0.5861394, -1.387704, 1, 0, 0, 1, 1,
-1.802606, -1.197461, -2.779814, 1, 0, 0, 1, 1,
-1.778421, 0.656161, -0.8430909, 1, 0, 0, 1, 1,
-1.766529, 0.4665639, -1.9259, 1, 0, 0, 1, 1,
-1.738332, 0.820689, -0.2108152, 1, 0, 0, 1, 1,
-1.734079, 0.9413534, 0.740702, 0, 0, 0, 1, 1,
-1.729813, 0.308937, -2.093774, 0, 0, 0, 1, 1,
-1.719348, 0.6265576, -1.530994, 0, 0, 0, 1, 1,
-1.704951, 0.473071, -0.4944946, 0, 0, 0, 1, 1,
-1.700732, -0.02642463, -2.750896, 0, 0, 0, 1, 1,
-1.680652, 0.07226932, -0.9138646, 0, 0, 0, 1, 1,
-1.66659, -0.1152201, -1.310045, 0, 0, 0, 1, 1,
-1.663789, 0.6784824, -1.245461, 1, 1, 1, 1, 1,
-1.662766, -0.6802285, -2.498063, 1, 1, 1, 1, 1,
-1.603421, 0.277408, -2.507462, 1, 1, 1, 1, 1,
-1.579204, -0.6542991, -0.9258819, 1, 1, 1, 1, 1,
-1.558008, -0.3731124, -2.413839, 1, 1, 1, 1, 1,
-1.555291, 0.3899744, -1.644225, 1, 1, 1, 1, 1,
-1.534562, -0.7081684, -0.6530813, 1, 1, 1, 1, 1,
-1.523774, -1.080675, -1.789121, 1, 1, 1, 1, 1,
-1.516577, -0.2453393, -0.6043154, 1, 1, 1, 1, 1,
-1.509609, 0.6103658, -1.173398, 1, 1, 1, 1, 1,
-1.490744, -1.980304, -3.014816, 1, 1, 1, 1, 1,
-1.487514, -0.180769, -0.8944678, 1, 1, 1, 1, 1,
-1.487322, 0.3654267, -3.490219, 1, 1, 1, 1, 1,
-1.486201, 0.1861908, -0.7579481, 1, 1, 1, 1, 1,
-1.481782, -0.8522472, -2.982635, 1, 1, 1, 1, 1,
-1.461935, 0.4748535, -2.815438, 0, 0, 1, 1, 1,
-1.442739, -1.356043, -3.351342, 1, 0, 0, 1, 1,
-1.438051, -0.9805926, -0.1225451, 1, 0, 0, 1, 1,
-1.426766, -0.913221, -2.704873, 1, 0, 0, 1, 1,
-1.423969, -0.6675634, -2.653037, 1, 0, 0, 1, 1,
-1.4192, -0.7688689, -0.9237676, 1, 0, 0, 1, 1,
-1.398267, 1.640902, 0.4955878, 0, 0, 0, 1, 1,
-1.394807, 0.2251098, -0.5174271, 0, 0, 0, 1, 1,
-1.38203, -0.8214459, -0.8562942, 0, 0, 0, 1, 1,
-1.378527, -0.2566253, -1.990001, 0, 0, 0, 1, 1,
-1.373573, -0.8542278, -1.544447, 0, 0, 0, 1, 1,
-1.364636, -0.3882517, -1.233835, 0, 0, 0, 1, 1,
-1.363358, 0.1428745, 0.2102232, 0, 0, 0, 1, 1,
-1.347345, -1.357385, -0.9806194, 1, 1, 1, 1, 1,
-1.338815, 0.4348828, -2.630286, 1, 1, 1, 1, 1,
-1.334402, 0.7420474, 1.198472, 1, 1, 1, 1, 1,
-1.334023, -1.999057, -1.328334, 1, 1, 1, 1, 1,
-1.328826, 1.132443, -1.635012, 1, 1, 1, 1, 1,
-1.3288, -0.2092981, -0.5942765, 1, 1, 1, 1, 1,
-1.327544, -0.2634449, -1.604647, 1, 1, 1, 1, 1,
-1.314262, -0.6589246, -1.830734, 1, 1, 1, 1, 1,
-1.309275, 1.616752, -0.8874017, 1, 1, 1, 1, 1,
-1.306633, 1.027206, -2.072552, 1, 1, 1, 1, 1,
-1.299252, 0.4098677, -1.416206, 1, 1, 1, 1, 1,
-1.294217, 0.4988408, -2.939964, 1, 1, 1, 1, 1,
-1.293224, -0.03934051, -0.4362977, 1, 1, 1, 1, 1,
-1.288314, -1.308042, -3.394644, 1, 1, 1, 1, 1,
-1.287089, 1.090508, -2.030334, 1, 1, 1, 1, 1,
-1.275472, -0.426936, -2.042835, 0, 0, 1, 1, 1,
-1.271573, -0.7405002, -0.2003607, 1, 0, 0, 1, 1,
-1.267366, 0.6940491, -1.021578, 1, 0, 0, 1, 1,
-1.265595, -0.9446136, -0.819017, 1, 0, 0, 1, 1,
-1.258106, -0.1011453, -2.746218, 1, 0, 0, 1, 1,
-1.250989, 0.3528967, -1.777653, 1, 0, 0, 1, 1,
-1.242778, -2.110224, -1.684157, 0, 0, 0, 1, 1,
-1.241732, 0.4159175, 0.2742442, 0, 0, 0, 1, 1,
-1.23297, -0.6574101, -3.959032, 0, 0, 0, 1, 1,
-1.229845, -0.7698768, -2.786785, 0, 0, 0, 1, 1,
-1.229059, 0.3774481, 0.6404572, 0, 0, 0, 1, 1,
-1.227217, -0.2421563, -1.290041, 0, 0, 0, 1, 1,
-1.22406, -0.5958313, -1.263794, 0, 0, 0, 1, 1,
-1.211322, 0.4694207, -2.097954, 1, 1, 1, 1, 1,
-1.210618, -0.6451676, -3.024372, 1, 1, 1, 1, 1,
-1.190559, 0.1152593, -1.526221, 1, 1, 1, 1, 1,
-1.183457, 0.6211658, -2.248263, 1, 1, 1, 1, 1,
-1.18261, 0.7528238, -0.4230428, 1, 1, 1, 1, 1,
-1.181818, -1.054167, -3.814343, 1, 1, 1, 1, 1,
-1.179302, -0.1258133, -2.917178, 1, 1, 1, 1, 1,
-1.159292, 0.7606906, -1.438078, 1, 1, 1, 1, 1,
-1.151029, 1.45783, -1.047884, 1, 1, 1, 1, 1,
-1.147341, 0.4871821, -2.773355, 1, 1, 1, 1, 1,
-1.136241, 0.3692742, -1.873589, 1, 1, 1, 1, 1,
-1.123493, -1.565758, -3.723199, 1, 1, 1, 1, 1,
-1.119231, 1.318411, -0.7249312, 1, 1, 1, 1, 1,
-1.11761, 1.697162, -0.6875111, 1, 1, 1, 1, 1,
-1.115499, 0.2190312, -0.8355531, 1, 1, 1, 1, 1,
-1.114759, 0.3313023, -0.2175808, 0, 0, 1, 1, 1,
-1.10703, -0.7434794, -2.726112, 1, 0, 0, 1, 1,
-1.098984, -0.7288971, -3.132432, 1, 0, 0, 1, 1,
-1.089941, 1.035293, -3.071883, 1, 0, 0, 1, 1,
-1.088211, 0.8088748, -0.7387886, 1, 0, 0, 1, 1,
-1.084026, -0.5051394, -0.7365401, 1, 0, 0, 1, 1,
-1.080302, -0.01001456, -1.587023, 0, 0, 0, 1, 1,
-1.080017, 0.6553258, 0.4858988, 0, 0, 0, 1, 1,
-1.068724, -0.7445015, -3.556555, 0, 0, 0, 1, 1,
-1.066399, -0.7491778, -1.728328, 0, 0, 0, 1, 1,
-1.065516, 0.1812468, -2.122512, 0, 0, 0, 1, 1,
-1.063771, -1.247026, -3.156984, 0, 0, 0, 1, 1,
-1.062659, -0.1271844, -2.921114, 0, 0, 0, 1, 1,
-1.056733, -0.1582414, -2.829805, 1, 1, 1, 1, 1,
-1.045603, 0.1587118, -2.293173, 1, 1, 1, 1, 1,
-1.039365, -1.652562, -3.936879, 1, 1, 1, 1, 1,
-1.021568, -0.09363712, -1.862011, 1, 1, 1, 1, 1,
-1.01663, 0.2715624, -0.2170685, 1, 1, 1, 1, 1,
-1.0012, 0.3171276, -1.752078, 1, 1, 1, 1, 1,
-0.9962544, 2.040245, 0.2823416, 1, 1, 1, 1, 1,
-0.9938582, 0.6011788, -2.073121, 1, 1, 1, 1, 1,
-0.990233, 0.4813422, -0.336534, 1, 1, 1, 1, 1,
-0.9880726, -0.6707364, -2.380211, 1, 1, 1, 1, 1,
-0.9861, -1.042324, -3.465506, 1, 1, 1, 1, 1,
-0.9844171, 0.527986, -0.232636, 1, 1, 1, 1, 1,
-0.9832366, 1.512352, -2.793927, 1, 1, 1, 1, 1,
-0.9576998, -1.041814, -2.365406, 1, 1, 1, 1, 1,
-0.9528697, 2.286833, -0.4171128, 1, 1, 1, 1, 1,
-0.9414888, 0.3368213, -0.6590204, 0, 0, 1, 1, 1,
-0.9311061, 0.3820397, -2.570275, 1, 0, 0, 1, 1,
-0.9242732, -0.4724481, -1.596008, 1, 0, 0, 1, 1,
-0.9148377, 0.3963966, -2.709034, 1, 0, 0, 1, 1,
-0.9134087, 1.35082, -1.467641, 1, 0, 0, 1, 1,
-0.9065843, 1.304495, 0.6951057, 1, 0, 0, 1, 1,
-0.9057429, -0.8176704, -2.196511, 0, 0, 0, 1, 1,
-0.9026471, -1.76353, -3.548218, 0, 0, 0, 1, 1,
-0.8988534, 0.1342178, -1.731439, 0, 0, 0, 1, 1,
-0.881121, -0.6600752, -1.52663, 0, 0, 0, 1, 1,
-0.8761914, -0.2820182, -0.8044159, 0, 0, 0, 1, 1,
-0.8755916, -0.2241119, -0.4444588, 0, 0, 0, 1, 1,
-0.8747591, -1.84862, -2.630125, 0, 0, 0, 1, 1,
-0.864971, 1.997583, -2.036031, 1, 1, 1, 1, 1,
-0.8648815, -0.3790328, -1.943534, 1, 1, 1, 1, 1,
-0.8645483, 0.4434406, -1.567643, 1, 1, 1, 1, 1,
-0.8591868, -2.208788, -2.569905, 1, 1, 1, 1, 1,
-0.8577074, 0.1766681, -1.466548, 1, 1, 1, 1, 1,
-0.8548998, 0.1263704, -1.036329, 1, 1, 1, 1, 1,
-0.8408664, -0.5024709, -2.348925, 1, 1, 1, 1, 1,
-0.8309021, -0.4794519, -1.860939, 1, 1, 1, 1, 1,
-0.8306838, -1.399924, -1.436032, 1, 1, 1, 1, 1,
-0.8285598, -0.3756453, -1.508159, 1, 1, 1, 1, 1,
-0.8219259, 0.3584001, -3.461859, 1, 1, 1, 1, 1,
-0.8148407, -0.4683579, -2.77339, 1, 1, 1, 1, 1,
-0.8004912, -0.1794398, -0.3838917, 1, 1, 1, 1, 1,
-0.8001764, 0.550045, 1.258761, 1, 1, 1, 1, 1,
-0.7909292, 0.132136, -1.545679, 1, 1, 1, 1, 1,
-0.7887917, 0.7008554, -1.63875, 0, 0, 1, 1, 1,
-0.7870747, -0.1183548, -0.1180863, 1, 0, 0, 1, 1,
-0.7866324, 0.8217431, -0.1041149, 1, 0, 0, 1, 1,
-0.7862984, 0.1856037, -3.540396, 1, 0, 0, 1, 1,
-0.7819183, -0.04298537, -0.9969393, 1, 0, 0, 1, 1,
-0.7775709, -2.351456, -3.884005, 1, 0, 0, 1, 1,
-0.7739295, -0.9443175, -1.689604, 0, 0, 0, 1, 1,
-0.7715465, 0.7028971, -1.510317, 0, 0, 0, 1, 1,
-0.7694023, -0.5283182, -2.620955, 0, 0, 0, 1, 1,
-0.7676674, -1.537154, -2.814707, 0, 0, 0, 1, 1,
-0.766215, -0.2868808, -0.9177082, 0, 0, 0, 1, 1,
-0.7658653, 1.736228, -2.114973, 0, 0, 0, 1, 1,
-0.7641707, -1.340954, -3.186451, 0, 0, 0, 1, 1,
-0.7632035, 0.4464493, -0.7003747, 1, 1, 1, 1, 1,
-0.7601743, -0.9990808, -1.80599, 1, 1, 1, 1, 1,
-0.7593122, -0.6819829, -3.822477, 1, 1, 1, 1, 1,
-0.7552259, 0.4538916, -1.36797, 1, 1, 1, 1, 1,
-0.750913, -0.05917711, -0.2955987, 1, 1, 1, 1, 1,
-0.7468103, -0.4912369, -1.490921, 1, 1, 1, 1, 1,
-0.7457552, 0.2584154, -2.158892, 1, 1, 1, 1, 1,
-0.744541, 0.7448739, 0.3747373, 1, 1, 1, 1, 1,
-0.7436432, -0.4223039, 0.6038657, 1, 1, 1, 1, 1,
-0.7418205, -0.7043998, -1.860589, 1, 1, 1, 1, 1,
-0.7400351, 1.444244, -0.729628, 1, 1, 1, 1, 1,
-0.7376394, -0.6170965, -2.815426, 1, 1, 1, 1, 1,
-0.7364402, 1.424741, -0.8600689, 1, 1, 1, 1, 1,
-0.7231192, -0.9372391, -1.421554, 1, 1, 1, 1, 1,
-0.7221346, 1.780116, 0.2383476, 1, 1, 1, 1, 1,
-0.7184015, -0.556882, -3.253227, 0, 0, 1, 1, 1,
-0.7182261, -0.03159809, -1.712476, 1, 0, 0, 1, 1,
-0.7153927, -0.5536596, -1.688129, 1, 0, 0, 1, 1,
-0.7146902, 1.945781, -0.3444783, 1, 0, 0, 1, 1,
-0.7098668, 1.254688, -1.121322, 1, 0, 0, 1, 1,
-0.7047673, -0.7930205, -3.225916, 1, 0, 0, 1, 1,
-0.6995484, -2.7905, -2.134215, 0, 0, 0, 1, 1,
-0.6914639, 0.6203513, -1.800764, 0, 0, 0, 1, 1,
-0.6906007, -0.8867797, -2.126742, 0, 0, 0, 1, 1,
-0.6887714, 0.6724366, -0.8686843, 0, 0, 0, 1, 1,
-0.6858954, 0.2509443, -1.283484, 0, 0, 0, 1, 1,
-0.6816548, -0.4058418, -3.399889, 0, 0, 0, 1, 1,
-0.6799552, 0.9094647, 1.508107, 0, 0, 0, 1, 1,
-0.6783978, 0.004832455, -2.244973, 1, 1, 1, 1, 1,
-0.677711, -1.581517, -2.708838, 1, 1, 1, 1, 1,
-0.6776481, -0.7476637, -2.587318, 1, 1, 1, 1, 1,
-0.6774175, 1.161756, -0.1763762, 1, 1, 1, 1, 1,
-0.6736721, -1.246083, -2.035106, 1, 1, 1, 1, 1,
-0.6736647, -0.8613399, -3.106693, 1, 1, 1, 1, 1,
-0.6677267, 1.169246, -0.2441829, 1, 1, 1, 1, 1,
-0.6645682, 0.2104901, -2.076673, 1, 1, 1, 1, 1,
-0.6627355, -1.189257, -1.31165, 1, 1, 1, 1, 1,
-0.6536714, 0.3604615, 0.06662856, 1, 1, 1, 1, 1,
-0.6501501, 0.6335449, 0.9626387, 1, 1, 1, 1, 1,
-0.6497221, -0.5168043, -3.69349, 1, 1, 1, 1, 1,
-0.6495088, -0.1555287, -0.7178369, 1, 1, 1, 1, 1,
-0.6485702, -0.005860394, -1.678355, 1, 1, 1, 1, 1,
-0.6483023, 1.121737, -0.5679051, 1, 1, 1, 1, 1,
-0.6422377, -0.6536686, -1.95595, 0, 0, 1, 1, 1,
-0.6398025, 2.383208, 1.240796, 1, 0, 0, 1, 1,
-0.6396053, -0.9037265, -1.640299, 1, 0, 0, 1, 1,
-0.6362284, -1.892002, -2.159544, 1, 0, 0, 1, 1,
-0.6352465, 1.044416, -0.3884164, 1, 0, 0, 1, 1,
-0.6341768, -0.191982, -0.4704752, 1, 0, 0, 1, 1,
-0.62851, 0.1153204, -2.304288, 0, 0, 0, 1, 1,
-0.6260006, 0.9962428, 1.079824, 0, 0, 0, 1, 1,
-0.6258116, 0.2873153, -0.9203943, 0, 0, 0, 1, 1,
-0.6250975, 0.4647447, -1.501114, 0, 0, 0, 1, 1,
-0.6245638, -1.416906, -3.639626, 0, 0, 0, 1, 1,
-0.6202199, -0.376136, -2.488161, 0, 0, 0, 1, 1,
-0.6187497, -0.9072099, -2.670223, 0, 0, 0, 1, 1,
-0.6164776, -0.499304, -3.206574, 1, 1, 1, 1, 1,
-0.6150441, 1.367673, 0.8738052, 1, 1, 1, 1, 1,
-0.614367, 0.6706521, -3.402347, 1, 1, 1, 1, 1,
-0.609471, -0.8493841, -0.8093517, 1, 1, 1, 1, 1,
-0.5834954, -0.1525985, -1.325011, 1, 1, 1, 1, 1,
-0.582498, -1.00471, -4.456694, 1, 1, 1, 1, 1,
-0.5817274, 0.911509, 0.2693809, 1, 1, 1, 1, 1,
-0.5803784, 1.228769, -0.07820369, 1, 1, 1, 1, 1,
-0.5795777, 1.445394, 0.1385258, 1, 1, 1, 1, 1,
-0.5793186, 1.18371, 0.2050117, 1, 1, 1, 1, 1,
-0.5792547, 0.101964, -1.099742, 1, 1, 1, 1, 1,
-0.5730143, 0.03624248, -1.904402, 1, 1, 1, 1, 1,
-0.5652381, -1.107913, -1.771956, 1, 1, 1, 1, 1,
-0.5625044, -0.7136752, -4.717303, 1, 1, 1, 1, 1,
-0.561399, -0.5926818, -3.338249, 1, 1, 1, 1, 1,
-0.5593013, 1.616026, -0.3823485, 0, 0, 1, 1, 1,
-0.5564674, 0.597578, -1.068165, 1, 0, 0, 1, 1,
-0.5528083, 0.532334, 0.193224, 1, 0, 0, 1, 1,
-0.5527341, 1.377389, 1.74977, 1, 0, 0, 1, 1,
-0.5507144, -0.2346686, -1.626523, 1, 0, 0, 1, 1,
-0.5501336, -0.5015473, -0.9854069, 1, 0, 0, 1, 1,
-0.5465934, -0.207826, -2.093429, 0, 0, 0, 1, 1,
-0.546343, -1.198081, -2.342722, 0, 0, 0, 1, 1,
-0.5424911, 0.4987502, -0.4253179, 0, 0, 0, 1, 1,
-0.5410935, -0.1288827, -1.366838, 0, 0, 0, 1, 1,
-0.5391953, -0.09776923, -1.171455, 0, 0, 0, 1, 1,
-0.5380384, 0.06944169, -2.501063, 0, 0, 0, 1, 1,
-0.5357014, 1.588689, -0.3306007, 0, 0, 0, 1, 1,
-0.5347711, 0.8188226, 0.1049311, 1, 1, 1, 1, 1,
-0.5322794, 0.5541348, -1.00755, 1, 1, 1, 1, 1,
-0.5302275, -0.1490133, -2.583949, 1, 1, 1, 1, 1,
-0.5289435, -1.401347, -4.511394, 1, 1, 1, 1, 1,
-0.5289258, -1.1956, -1.165441, 1, 1, 1, 1, 1,
-0.5194154, -1.140696, -1.695298, 1, 1, 1, 1, 1,
-0.5126016, -0.5976844, -3.796041, 1, 1, 1, 1, 1,
-0.5104888, 0.7347978, -1.218536, 1, 1, 1, 1, 1,
-0.5100955, 0.36797, -0.8356628, 1, 1, 1, 1, 1,
-0.5097191, -0.6084756, -2.985111, 1, 1, 1, 1, 1,
-0.509707, 0.6237351, -0.5615107, 1, 1, 1, 1, 1,
-0.5083339, -0.01211962, -2.106818, 1, 1, 1, 1, 1,
-0.5066143, -1.071481, -1.871085, 1, 1, 1, 1, 1,
-0.5064403, 0.6043517, -2.751582, 1, 1, 1, 1, 1,
-0.505095, 0.3551335, -0.6493497, 1, 1, 1, 1, 1,
-0.5018542, -0.2588865, -1.517728, 0, 0, 1, 1, 1,
-0.5004995, -0.6658618, -2.199197, 1, 0, 0, 1, 1,
-0.4990949, 1.264126, 1.911007, 1, 0, 0, 1, 1,
-0.4979963, 1.016977, -1.999879, 1, 0, 0, 1, 1,
-0.4969321, 1.555151, -1.730651, 1, 0, 0, 1, 1,
-0.4934525, 1.234734, -0.1042706, 1, 0, 0, 1, 1,
-0.493415, 0.8047915, 1.893215, 0, 0, 0, 1, 1,
-0.4932285, 0.4897186, -1.673382, 0, 0, 0, 1, 1,
-0.4916707, 1.462041, 0.8011462, 0, 0, 0, 1, 1,
-0.4878712, -1.077877, -2.764368, 0, 0, 0, 1, 1,
-0.4826765, 0.7476456, 2.243729, 0, 0, 0, 1, 1,
-0.4780144, -1.962581, -4.598609, 0, 0, 0, 1, 1,
-0.4775823, -0.1326168, -2.544698, 0, 0, 0, 1, 1,
-0.4770516, 1.054767, 0.2427875, 1, 1, 1, 1, 1,
-0.4704532, -0.9481748, -3.209758, 1, 1, 1, 1, 1,
-0.4675165, -0.5730621, -1.704513, 1, 1, 1, 1, 1,
-0.4667991, -0.6213832, -3.363568, 1, 1, 1, 1, 1,
-0.4644115, -0.5644872, -3.317179, 1, 1, 1, 1, 1,
-0.4635901, -0.6097354, -2.202489, 1, 1, 1, 1, 1,
-0.4616485, 0.368839, -0.274163, 1, 1, 1, 1, 1,
-0.461498, 0.4767401, -0.4145403, 1, 1, 1, 1, 1,
-0.4612098, 0.2744062, -0.8295835, 1, 1, 1, 1, 1,
-0.4612074, -0.1851586, -2.671664, 1, 1, 1, 1, 1,
-0.4588046, 1.034844, -0.06921019, 1, 1, 1, 1, 1,
-0.4521728, 1.36487, -0.6817234, 1, 1, 1, 1, 1,
-0.452016, 0.5219488, -0.8851405, 1, 1, 1, 1, 1,
-0.4480703, -0.4983948, -0.7629919, 1, 1, 1, 1, 1,
-0.4477999, 0.455276, 1.897621, 1, 1, 1, 1, 1,
-0.4447818, -0.331124, -1.361133, 0, 0, 1, 1, 1,
-0.440616, -1.808345, -4.010801, 1, 0, 0, 1, 1,
-0.4406007, -0.5021422, -1.583869, 1, 0, 0, 1, 1,
-0.4402663, 2.030623, -0.1208922, 1, 0, 0, 1, 1,
-0.4390371, -0.9705473, -2.985353, 1, 0, 0, 1, 1,
-0.4386097, -0.6575062, -2.555115, 1, 0, 0, 1, 1,
-0.4377434, 1.209801, -1.171993, 0, 0, 0, 1, 1,
-0.4356655, 0.659557, 0.7087905, 0, 0, 0, 1, 1,
-0.4346911, -0.3170079, -1.582451, 0, 0, 0, 1, 1,
-0.4345312, 1.447932, -0.01400473, 0, 0, 0, 1, 1,
-0.4341351, 0.9045319, -0.6714792, 0, 0, 0, 1, 1,
-0.4339781, -0.6737377, -1.199946, 0, 0, 0, 1, 1,
-0.4323125, 0.07873, -1.170462, 0, 0, 0, 1, 1,
-0.4269201, 0.7501882, -0.1512915, 1, 1, 1, 1, 1,
-0.418897, -0.5084443, -2.495198, 1, 1, 1, 1, 1,
-0.4128828, -1.072487, -2.559726, 1, 1, 1, 1, 1,
-0.4055321, -0.8018702, -4.135409, 1, 1, 1, 1, 1,
-0.4010987, -0.01961265, -2.280688, 1, 1, 1, 1, 1,
-0.3994916, -0.1491273, -1.348198, 1, 1, 1, 1, 1,
-0.3994052, -0.01209006, -0.6656209, 1, 1, 1, 1, 1,
-0.3956803, 0.7932984, -0.8431382, 1, 1, 1, 1, 1,
-0.3920757, 0.420512, -1.226533, 1, 1, 1, 1, 1,
-0.3914804, 1.036291, 0.179822, 1, 1, 1, 1, 1,
-0.3868789, -1.495773, -2.2383, 1, 1, 1, 1, 1,
-0.3822032, -0.8442111, -1.541707, 1, 1, 1, 1, 1,
-0.3817748, -0.8909454, -1.642662, 1, 1, 1, 1, 1,
-0.3815291, 0.2397255, -2.116995, 1, 1, 1, 1, 1,
-0.3807716, 1.245546, -0.6163689, 1, 1, 1, 1, 1,
-0.3805003, 1.338235, -0.7708376, 0, 0, 1, 1, 1,
-0.3746069, 0.5492346, 0.5356469, 1, 0, 0, 1, 1,
-0.3743485, 0.2968528, -0.5767914, 1, 0, 0, 1, 1,
-0.3734756, 0.5727147, -2.259025, 1, 0, 0, 1, 1,
-0.3696835, -1.464851, -3.736456, 1, 0, 0, 1, 1,
-0.3677825, -0.1700528, -2.271731, 1, 0, 0, 1, 1,
-0.361789, -1.027299, -2.337248, 0, 0, 0, 1, 1,
-0.3613397, -1.903215, -1.650143, 0, 0, 0, 1, 1,
-0.3587857, -1.826256, -5.74806, 0, 0, 0, 1, 1,
-0.3500252, 1.793661, 1.264932, 0, 0, 0, 1, 1,
-0.3432154, -0.5830031, -2.432045, 0, 0, 0, 1, 1,
-0.3410023, -0.03381873, -2.238871, 0, 0, 0, 1, 1,
-0.3400717, 0.463791, 0.503549, 0, 0, 0, 1, 1,
-0.3398422, -0.8892596, -2.729221, 1, 1, 1, 1, 1,
-0.3393737, -0.1956892, -1.755412, 1, 1, 1, 1, 1,
-0.3393629, -0.09021368, -1.850226, 1, 1, 1, 1, 1,
-0.3339339, 0.04129731, -0.6091426, 1, 1, 1, 1, 1,
-0.3318233, -0.3688236, -3.921999, 1, 1, 1, 1, 1,
-0.3309254, 0.738891, -0.2495096, 1, 1, 1, 1, 1,
-0.3306358, -0.9241259, -2.299471, 1, 1, 1, 1, 1,
-0.3288343, -1.591085, -4.758234, 1, 1, 1, 1, 1,
-0.3257163, -0.5990127, -2.053946, 1, 1, 1, 1, 1,
-0.3251174, -0.7475966, -1.915223, 1, 1, 1, 1, 1,
-0.3245937, 0.8724738, 1.185854, 1, 1, 1, 1, 1,
-0.3241739, 0.1841433, -0.9617897, 1, 1, 1, 1, 1,
-0.3214552, -1.451758, -4.537272, 1, 1, 1, 1, 1,
-0.3194766, 1.07685, -0.8473455, 1, 1, 1, 1, 1,
-0.3166528, -0.6040808, -2.389887, 1, 1, 1, 1, 1,
-0.3134958, -0.4715269, -4.024184, 0, 0, 1, 1, 1,
-0.3103517, 0.5242937, -0.2441313, 1, 0, 0, 1, 1,
-0.3057193, 0.6033548, -0.4794062, 1, 0, 0, 1, 1,
-0.2995867, -0.9036348, -3.526379, 1, 0, 0, 1, 1,
-0.2944736, -1.171873, -3.130862, 1, 0, 0, 1, 1,
-0.293464, -0.5519773, -2.254063, 1, 0, 0, 1, 1,
-0.2934065, -1.017563, -0.635107, 0, 0, 0, 1, 1,
-0.2917841, -0.005996607, -1.83003, 0, 0, 0, 1, 1,
-0.2908838, -0.3176372, -1.519595, 0, 0, 0, 1, 1,
-0.2879433, 0.3262788, -0.1701833, 0, 0, 0, 1, 1,
-0.2798864, 1.482335, 0.02312117, 0, 0, 0, 1, 1,
-0.2761874, 0.5421215, 0.5444449, 0, 0, 0, 1, 1,
-0.2754087, 2.370339, 0.1317741, 0, 0, 0, 1, 1,
-0.2750055, 0.01936516, -1.432667, 1, 1, 1, 1, 1,
-0.2734174, -1.311828, -1.298318, 1, 1, 1, 1, 1,
-0.2695312, 1.568429, 0.6090888, 1, 1, 1, 1, 1,
-0.2643184, 0.113406, -0.6248141, 1, 1, 1, 1, 1,
-0.2628483, 0.6392681, -0.8850496, 1, 1, 1, 1, 1,
-0.2575038, 0.01068441, -2.113658, 1, 1, 1, 1, 1,
-0.2563717, -0.8180779, -3.572671, 1, 1, 1, 1, 1,
-0.2526411, -0.6299122, -2.440045, 1, 1, 1, 1, 1,
-0.2526006, 0.1108379, -0.09739085, 1, 1, 1, 1, 1,
-0.2488741, 0.3448295, 0.5442029, 1, 1, 1, 1, 1,
-0.2470205, 0.4683912, -0.6317836, 1, 1, 1, 1, 1,
-0.2448227, 0.688839, -1.078318, 1, 1, 1, 1, 1,
-0.2416808, -0.1730986, -3.744464, 1, 1, 1, 1, 1,
-0.2351559, 1.979959, 0.9226217, 1, 1, 1, 1, 1,
-0.2349556, 0.3212463, -1.412978, 1, 1, 1, 1, 1,
-0.2340288, 1.81959, -0.4190648, 0, 0, 1, 1, 1,
-0.2315825, 0.1440933, -2.184966, 1, 0, 0, 1, 1,
-0.2287908, -0.1994001, -2.519768, 1, 0, 0, 1, 1,
-0.2278991, 0.4135431, -0.004668958, 1, 0, 0, 1, 1,
-0.2268298, 0.9832224, 1.934533, 1, 0, 0, 1, 1,
-0.2257307, 0.1054295, -0.7879168, 1, 0, 0, 1, 1,
-0.2255224, -2.509089, -3.781439, 0, 0, 0, 1, 1,
-0.2250611, 1.017537, 0.01157322, 0, 0, 0, 1, 1,
-0.2238779, -0.2953263, -1.824854, 0, 0, 0, 1, 1,
-0.2176595, 0.244484, -0.6359295, 0, 0, 0, 1, 1,
-0.2168086, 1.370351, 1.040935, 0, 0, 0, 1, 1,
-0.2160202, 1.593405, 0.2601897, 0, 0, 0, 1, 1,
-0.2153247, -1.428026, -3.975622, 0, 0, 0, 1, 1,
-0.214546, 0.4243403, 1.791757, 1, 1, 1, 1, 1,
-0.2054252, 0.4113502, -0.1150075, 1, 1, 1, 1, 1,
-0.2046945, 1.05628, -0.5367737, 1, 1, 1, 1, 1,
-0.2037895, -0.7503735, -2.795732, 1, 1, 1, 1, 1,
-0.2016623, 1.758814, -0.07168579, 1, 1, 1, 1, 1,
-0.2006641, -0.727115, -3.662445, 1, 1, 1, 1, 1,
-0.1989793, -1.439882, -1.573377, 1, 1, 1, 1, 1,
-0.1973988, 0.1005224, -1.551952, 1, 1, 1, 1, 1,
-0.196247, 0.1649954, -0.8857608, 1, 1, 1, 1, 1,
-0.192395, -0.3315909, -2.459422, 1, 1, 1, 1, 1,
-0.1921494, 0.9554573, -1.952244, 1, 1, 1, 1, 1,
-0.1900862, -0.1653709, -1.92404, 1, 1, 1, 1, 1,
-0.1896908, -0.2032484, -1.876504, 1, 1, 1, 1, 1,
-0.1860281, 1.354161, -0.1237095, 1, 1, 1, 1, 1,
-0.1827635, 2.248193, -0.1876603, 1, 1, 1, 1, 1,
-0.1799792, 2.639844, -2.375959, 0, 0, 1, 1, 1,
-0.1788124, -0.564787, -1.474617, 1, 0, 0, 1, 1,
-0.1781362, -1.094149, -3.503598, 1, 0, 0, 1, 1,
-0.1771778, -0.7821058, -2.352808, 1, 0, 0, 1, 1,
-0.1765419, -0.9198138, -2.424638, 1, 0, 0, 1, 1,
-0.1763331, -0.8850025, -2.851135, 1, 0, 0, 1, 1,
-0.1745712, 2.066818, 1.731023, 0, 0, 0, 1, 1,
-0.1681749, -0.2072638, -1.155884, 0, 0, 0, 1, 1,
-0.1649661, -0.03981562, -1.339725, 0, 0, 0, 1, 1,
-0.1637859, -1.424932, -4.063266, 0, 0, 0, 1, 1,
-0.1630149, -0.03007497, -2.883446, 0, 0, 0, 1, 1,
-0.1574518, -0.02663125, -0.7262332, 0, 0, 0, 1, 1,
-0.1537059, 0.2081863, -0.8696638, 0, 0, 0, 1, 1,
-0.1471576, 0.3017315, 1.140548, 1, 1, 1, 1, 1,
-0.1464188, -1.597691, -2.578212, 1, 1, 1, 1, 1,
-0.1457051, -0.1075567, -2.285869, 1, 1, 1, 1, 1,
-0.1322845, -0.05035375, -0.585705, 1, 1, 1, 1, 1,
-0.1299408, 1.381257, -0.5846953, 1, 1, 1, 1, 1,
-0.1292739, 1.42889, -1.830413, 1, 1, 1, 1, 1,
-0.1285696, -0.1979199, -2.214283, 1, 1, 1, 1, 1,
-0.1271188, -0.1081162, -2.224108, 1, 1, 1, 1, 1,
-0.1176088, 0.1634826, 0.1165311, 1, 1, 1, 1, 1,
-0.116613, -1.062942, -0.6695188, 1, 1, 1, 1, 1,
-0.1149969, 0.1193562, -1.036697, 1, 1, 1, 1, 1,
-0.1104434, -0.01811455, -0.7795243, 1, 1, 1, 1, 1,
-0.1056686, 0.3771095, 1.403346, 1, 1, 1, 1, 1,
-0.1047946, -0.7726617, -3.388952, 1, 1, 1, 1, 1,
-0.1010086, -0.5478992, -3.343238, 1, 1, 1, 1, 1,
-0.09798927, -0.3277219, -1.118345, 0, 0, 1, 1, 1,
-0.09560887, 0.875988, -1.420095, 1, 0, 0, 1, 1,
-0.09331444, 1.715585, -1.211037, 1, 0, 0, 1, 1,
-0.09259782, 0.3461879, -0.3997056, 1, 0, 0, 1, 1,
-0.08855179, 0.9959279, 0.2406216, 1, 0, 0, 1, 1,
-0.08727198, -0.3206846, -3.751737, 1, 0, 0, 1, 1,
-0.08513733, 0.2247065, 0.8486229, 0, 0, 0, 1, 1,
-0.08101046, 0.3879106, 1.331391, 0, 0, 0, 1, 1,
-0.07923513, -1.001856, -4.234802, 0, 0, 0, 1, 1,
-0.07782486, -1.533046, -3.288132, 0, 0, 0, 1, 1,
-0.0745063, 0.7291298, 1.937049, 0, 0, 0, 1, 1,
-0.07195167, -0.8482691, -1.443195, 0, 0, 0, 1, 1,
-0.06632908, 1.245404, 1.507396, 0, 0, 0, 1, 1,
-0.06141652, 0.05269964, -0.7191214, 1, 1, 1, 1, 1,
-0.06132044, -0.403037, -1.894136, 1, 1, 1, 1, 1,
-0.0587904, -1.711976, -2.1329, 1, 1, 1, 1, 1,
-0.05856666, 0.5017773, -1.862326, 1, 1, 1, 1, 1,
-0.05438693, 0.7386556, 0.3786466, 1, 1, 1, 1, 1,
-0.0536699, -0.7365533, -3.024521, 1, 1, 1, 1, 1,
-0.05270381, -1.082676, -5.586594, 1, 1, 1, 1, 1,
-0.05163432, -1.475823, -2.313303, 1, 1, 1, 1, 1,
-0.04521188, 0.8070764, 0.8243016, 1, 1, 1, 1, 1,
-0.04451036, -0.4662892, -5.952676, 1, 1, 1, 1, 1,
-0.04383447, -0.1922663, -2.810275, 1, 1, 1, 1, 1,
-0.04075681, 0.2321449, 0.7737908, 1, 1, 1, 1, 1,
-0.03953414, 0.9878412, 0.5160877, 1, 1, 1, 1, 1,
-0.03758416, 1.112763, -1.265973, 1, 1, 1, 1, 1,
-0.03186907, 0.7218695, 1.198498, 1, 1, 1, 1, 1,
-0.02996351, -0.3337017, -1.730721, 0, 0, 1, 1, 1,
-0.02850833, -0.3773786, -4.122233, 1, 0, 0, 1, 1,
-0.02761511, -0.2314195, -2.28186, 1, 0, 0, 1, 1,
-0.02572601, -0.9179087, -2.221009, 1, 0, 0, 1, 1,
-0.02188454, 0.6042708, -0.09823785, 1, 0, 0, 1, 1,
-0.01860886, 0.1163301, 0.2053545, 1, 0, 0, 1, 1,
-0.009486154, 0.5729457, -1.073991, 0, 0, 0, 1, 1,
-0.008687466, -0.557721, -3.993127, 0, 0, 0, 1, 1,
-0.007887171, -1.064369, -2.469352, 0, 0, 0, 1, 1,
-0.0002266162, 1.168679, -1.491708, 0, 0, 0, 1, 1,
0.001149052, 0.1811459, -0.8814934, 0, 0, 0, 1, 1,
0.001860655, -0.3709429, 4.075354, 0, 0, 0, 1, 1,
0.008628806, 1.410461, -0.1722331, 0, 0, 0, 1, 1,
0.009318055, 0.6925899, 0.9506338, 1, 1, 1, 1, 1,
0.01056964, -0.5805416, 4.989716, 1, 1, 1, 1, 1,
0.0117669, 1.032878, 0.4169133, 1, 1, 1, 1, 1,
0.01231278, -0.09471834, 2.684017, 1, 1, 1, 1, 1,
0.01533514, -0.6354675, 2.26936, 1, 1, 1, 1, 1,
0.01558955, -1.55255, 3.65455, 1, 1, 1, 1, 1,
0.01711647, 2.208041, 0.169208, 1, 1, 1, 1, 1,
0.017926, 0.6525842, 0.6988804, 1, 1, 1, 1, 1,
0.02037476, -0.3407802, 3.02904, 1, 1, 1, 1, 1,
0.02192584, 0.09689099, 0.7222158, 1, 1, 1, 1, 1,
0.02725928, 0.5603483, 0.4695521, 1, 1, 1, 1, 1,
0.03086512, 0.3820311, -1.168108, 1, 1, 1, 1, 1,
0.03361426, 0.3638934, 0.2622084, 1, 1, 1, 1, 1,
0.03850712, -0.8369832, 1.244704, 1, 1, 1, 1, 1,
0.04543586, -2.09246, 2.165654, 1, 1, 1, 1, 1,
0.04725162, 1.681317, -1.129766, 0, 0, 1, 1, 1,
0.05672781, -0.2692136, 1.774377, 1, 0, 0, 1, 1,
0.0599186, -0.5187188, 4.166082, 1, 0, 0, 1, 1,
0.06117073, -0.9209406, 1.791249, 1, 0, 0, 1, 1,
0.06284657, 1.033238, 0.9080792, 1, 0, 0, 1, 1,
0.06615346, -0.59125, 1.460639, 1, 0, 0, 1, 1,
0.06889211, -2.004831, 3.027853, 0, 0, 0, 1, 1,
0.06894903, -1.05118, 3.693782, 0, 0, 0, 1, 1,
0.07067753, -1.444324, 2.336685, 0, 0, 0, 1, 1,
0.07238311, -1.03492, 2.811203, 0, 0, 0, 1, 1,
0.07518315, -1.245019, 3.354036, 0, 0, 0, 1, 1,
0.07590295, -0.9481926, 2.534221, 0, 0, 0, 1, 1,
0.08186367, -1.026536, 3.87566, 0, 0, 0, 1, 1,
0.08344684, 0.4929023, 0.6476359, 1, 1, 1, 1, 1,
0.08533747, -0.7330973, 3.946398, 1, 1, 1, 1, 1,
0.08592978, -0.5490457, 2.192833, 1, 1, 1, 1, 1,
0.0878036, -0.1593088, 2.191327, 1, 1, 1, 1, 1,
0.0903224, 0.03357096, 0.3944249, 1, 1, 1, 1, 1,
0.09195816, -0.1244167, 3.236883, 1, 1, 1, 1, 1,
0.09924769, -1.059971, 3.604436, 1, 1, 1, 1, 1,
0.09987461, -0.5335227, 3.094951, 1, 1, 1, 1, 1,
0.09994946, 0.01167713, 2.446666, 1, 1, 1, 1, 1,
0.1010128, 0.5417074, -0.2159434, 1, 1, 1, 1, 1,
0.1026966, -0.8653467, 3.621258, 1, 1, 1, 1, 1,
0.1060376, 0.2733783, 1.35178, 1, 1, 1, 1, 1,
0.1075479, 1.310686, 0.5463817, 1, 1, 1, 1, 1,
0.1084245, -1.876799, 3.740067, 1, 1, 1, 1, 1,
0.1118261, -0.6761613, 2.816888, 1, 1, 1, 1, 1,
0.1124559, -0.0504336, 1.379451, 0, 0, 1, 1, 1,
0.1126801, -1.16525, 2.518094, 1, 0, 0, 1, 1,
0.1210524, -0.2994737, 3.876222, 1, 0, 0, 1, 1,
0.1243984, -0.8265213, 2.953952, 1, 0, 0, 1, 1,
0.1293732, 1.119093, -0.4192206, 1, 0, 0, 1, 1,
0.1337971, -0.3215465, 3.488925, 1, 0, 0, 1, 1,
0.1341425, -0.6334302, 3.439018, 0, 0, 0, 1, 1,
0.1382784, -1.229103, 3.472838, 0, 0, 0, 1, 1,
0.1401692, 0.1133304, -0.9497203, 0, 0, 0, 1, 1,
0.1453017, 0.1698913, -0.6374459, 0, 0, 0, 1, 1,
0.1489655, 0.7822195, 0.4487658, 0, 0, 0, 1, 1,
0.1505703, -2.380636, 1.911135, 0, 0, 0, 1, 1,
0.150862, 0.001881474, 1.68724, 0, 0, 0, 1, 1,
0.1537793, 0.4352001, 4.124712, 1, 1, 1, 1, 1,
0.1541906, -0.4954128, 3.088367, 1, 1, 1, 1, 1,
0.1548291, -0.1881276, 1.851795, 1, 1, 1, 1, 1,
0.1569811, -1.08452, 3.046117, 1, 1, 1, 1, 1,
0.1611924, -0.6245354, 2.105562, 1, 1, 1, 1, 1,
0.1630981, -1.950958, 2.102579, 1, 1, 1, 1, 1,
0.1711771, -0.1429855, 2.660504, 1, 1, 1, 1, 1,
0.1717563, -0.026412, 1.897282, 1, 1, 1, 1, 1,
0.1772406, 1.411672, -0.3902099, 1, 1, 1, 1, 1,
0.1798536, -1.023862, 3.142796, 1, 1, 1, 1, 1,
0.1810665, -0.4424593, 3.713891, 1, 1, 1, 1, 1,
0.1926545, -0.6259374, 3.086057, 1, 1, 1, 1, 1,
0.1956645, 1.290985, 0.7974122, 1, 1, 1, 1, 1,
0.1959537, 2.220609, 1.070263, 1, 1, 1, 1, 1,
0.2001631, -0.5747285, 4.15139, 1, 1, 1, 1, 1,
0.2034896, -0.2440029, 3.899982, 0, 0, 1, 1, 1,
0.2064914, -0.07733198, 1.798454, 1, 0, 0, 1, 1,
0.2137319, -0.7190731, 0.5182005, 1, 0, 0, 1, 1,
0.2140744, 0.3545906, -0.1768154, 1, 0, 0, 1, 1,
0.2146748, 0.3083866, 0.1176937, 1, 0, 0, 1, 1,
0.2154741, -1.389605, 2.045232, 1, 0, 0, 1, 1,
0.2170367, -0.8885359, 1.437251, 0, 0, 0, 1, 1,
0.2193408, 0.466728, 1.581413, 0, 0, 0, 1, 1,
0.221984, 0.6767922, -0.3241913, 0, 0, 0, 1, 1,
0.2223649, -0.168649, 0.8412727, 0, 0, 0, 1, 1,
0.222992, -0.3477091, 3.147495, 0, 0, 0, 1, 1,
0.2272852, 0.2263222, 0.989602, 0, 0, 0, 1, 1,
0.2284258, -1.713833, 3.723648, 0, 0, 0, 1, 1,
0.2303535, 0.3266289, -0.9936839, 1, 1, 1, 1, 1,
0.2324533, 0.453938, 1.476247, 1, 1, 1, 1, 1,
0.2348535, -1.936901, 1.54707, 1, 1, 1, 1, 1,
0.2355354, 1.606874, -1.649785, 1, 1, 1, 1, 1,
0.238331, -0.9933668, 2.69208, 1, 1, 1, 1, 1,
0.2385188, -0.1743663, 0.3151023, 1, 1, 1, 1, 1,
0.2385304, 0.6389415, -0.4771653, 1, 1, 1, 1, 1,
0.2444638, -1.029582, 3.692769, 1, 1, 1, 1, 1,
0.2464934, -0.2680492, 3.258329, 1, 1, 1, 1, 1,
0.2469443, 0.788516, 0.6506231, 1, 1, 1, 1, 1,
0.2478796, 0.07780489, 2.661515, 1, 1, 1, 1, 1,
0.2495227, -1.566218, 3.160164, 1, 1, 1, 1, 1,
0.2546644, -0.4082057, 1.594535, 1, 1, 1, 1, 1,
0.2548855, -0.3124608, 2.973031, 1, 1, 1, 1, 1,
0.256961, 0.8785247, -0.4412495, 1, 1, 1, 1, 1,
0.2641359, 0.07386737, 1.237339, 0, 0, 1, 1, 1,
0.2690959, -0.04298139, 0.8700453, 1, 0, 0, 1, 1,
0.2696843, -0.1041881, 0.5383359, 1, 0, 0, 1, 1,
0.2710536, 0.4987285, -0.4899734, 1, 0, 0, 1, 1,
0.2749776, 1.684729, 2.63648, 1, 0, 0, 1, 1,
0.2816795, 0.1111985, 1.479809, 1, 0, 0, 1, 1,
0.2817104, -0.9046869, 2.489579, 0, 0, 0, 1, 1,
0.2873427, 2.125074, 0.9623628, 0, 0, 0, 1, 1,
0.2875885, -0.08388305, 1.352952, 0, 0, 0, 1, 1,
0.2884745, 0.3896614, -0.6929885, 0, 0, 0, 1, 1,
0.2889796, 0.3795452, 0.9648816, 0, 0, 0, 1, 1,
0.2894252, 0.5692313, -0.415258, 0, 0, 0, 1, 1,
0.2929977, 0.2193966, 0.345514, 0, 0, 0, 1, 1,
0.2934037, -0.2407524, 2.263435, 1, 1, 1, 1, 1,
0.2953644, 0.2097595, 1.5949, 1, 1, 1, 1, 1,
0.295449, 0.2953691, 1.439634, 1, 1, 1, 1, 1,
0.2959585, 1.103238, -1.395403, 1, 1, 1, 1, 1,
0.299107, 1.425309, 1.078088, 1, 1, 1, 1, 1,
0.3027151, 0.2207298, -0.7373388, 1, 1, 1, 1, 1,
0.306928, 1.962844, 1.13031, 1, 1, 1, 1, 1,
0.3077022, 0.2152706, 1.433704, 1, 1, 1, 1, 1,
0.3112696, 0.9540573, -1.272324, 1, 1, 1, 1, 1,
0.3130027, 0.2595761, -0.0471787, 1, 1, 1, 1, 1,
0.3135107, 0.3749265, 0.9939653, 1, 1, 1, 1, 1,
0.313784, -0.4661147, 2.256205, 1, 1, 1, 1, 1,
0.3138246, -0.5384129, 1.829107, 1, 1, 1, 1, 1,
0.3153783, -0.3105785, 1.264853, 1, 1, 1, 1, 1,
0.3247536, 0.5205937, 1.213124, 1, 1, 1, 1, 1,
0.3294012, 0.2206516, 1.485319, 0, 0, 1, 1, 1,
0.3336119, -1.689357, 4.625077, 1, 0, 0, 1, 1,
0.3416649, -0.538709, 2.581682, 1, 0, 0, 1, 1,
0.3421577, -0.04744173, 0.7320048, 1, 0, 0, 1, 1,
0.3439449, -0.5062773, 1.759798, 1, 0, 0, 1, 1,
0.3452984, -1.332417, 2.290174, 1, 0, 0, 1, 1,
0.3495672, 0.7462122, 0.1072766, 0, 0, 0, 1, 1,
0.3514949, -0.3258434, 1.420421, 0, 0, 0, 1, 1,
0.3516524, 1.570847, 1.022955, 0, 0, 0, 1, 1,
0.3521931, -0.03220375, 1.649384, 0, 0, 0, 1, 1,
0.3556524, -1.209207, 3.022886, 0, 0, 0, 1, 1,
0.3652881, -0.246707, 3.334166, 0, 0, 0, 1, 1,
0.3714963, -0.682194, 2.064388, 0, 0, 0, 1, 1,
0.3725417, 1.210511, 1.637262, 1, 1, 1, 1, 1,
0.3794812, 0.6046126, -0.3717014, 1, 1, 1, 1, 1,
0.3834604, -0.07631363, 2.15935, 1, 1, 1, 1, 1,
0.3872635, 0.4252347, 1.691282, 1, 1, 1, 1, 1,
0.3930056, 0.4675918, 0.1935093, 1, 1, 1, 1, 1,
0.395648, -0.7173198, 4.207804, 1, 1, 1, 1, 1,
0.3979314, 0.07723077, 2.560896, 1, 1, 1, 1, 1,
0.3996437, 0.5645673, 1.665051, 1, 1, 1, 1, 1,
0.40057, 0.4156497, 0.8403084, 1, 1, 1, 1, 1,
0.4108315, -0.7647113, 3.148029, 1, 1, 1, 1, 1,
0.4121405, -0.08145103, 2.043821, 1, 1, 1, 1, 1,
0.4177519, -1.400291, 3.117093, 1, 1, 1, 1, 1,
0.4252362, 0.4888445, 0.06592264, 1, 1, 1, 1, 1,
0.4256573, -1.49356, 2.848395, 1, 1, 1, 1, 1,
0.433477, -0.849071, 3.207259, 1, 1, 1, 1, 1,
0.4400122, -0.2693264, -1.26469, 0, 0, 1, 1, 1,
0.446102, -0.07564013, 2.38397, 1, 0, 0, 1, 1,
0.4465345, -0.06192558, 0.9397864, 1, 0, 0, 1, 1,
0.4469619, -0.7666532, 1.379611, 1, 0, 0, 1, 1,
0.4480385, -0.3718279, 1.405124, 1, 0, 0, 1, 1,
0.4482405, -0.1228323, 2.323252, 1, 0, 0, 1, 1,
0.4503891, -1.961529, 6.730286, 0, 0, 0, 1, 1,
0.4558843, 0.8696084, 1.237275, 0, 0, 0, 1, 1,
0.4559315, -0.322886, 3.266992, 0, 0, 0, 1, 1,
0.4561647, 0.3276491, 1.96297, 0, 0, 0, 1, 1,
0.4565619, -0.5081031, 3.131718, 0, 0, 0, 1, 1,
0.4599834, -0.8491696, 3.077516, 0, 0, 0, 1, 1,
0.468551, 0.9387864, 1.232891, 0, 0, 0, 1, 1,
0.4722438, -1.341852, 3.763605, 1, 1, 1, 1, 1,
0.47425, -0.04593334, 0.5705465, 1, 1, 1, 1, 1,
0.4776733, -0.4869933, 2.581551, 1, 1, 1, 1, 1,
0.4822075, -0.7305897, 2.630788, 1, 1, 1, 1, 1,
0.4843994, 0.604574, 0.5676859, 1, 1, 1, 1, 1,
0.4870729, 0.4490923, -0.8436382, 1, 1, 1, 1, 1,
0.4874963, 0.5193501, 1.183422, 1, 1, 1, 1, 1,
0.4977785, -0.2177131, 1.208215, 1, 1, 1, 1, 1,
0.4997359, -1.566836, 2.802165, 1, 1, 1, 1, 1,
0.5025272, 0.6148278, 0.9705719, 1, 1, 1, 1, 1,
0.5029576, -0.1331675, 2.036787, 1, 1, 1, 1, 1,
0.504876, 0.2018282, 0.4139318, 1, 1, 1, 1, 1,
0.5084444, 1.131112, -0.5013922, 1, 1, 1, 1, 1,
0.5119832, -0.5944924, 2.100678, 1, 1, 1, 1, 1,
0.5134572, -1.068636, 2.20476, 1, 1, 1, 1, 1,
0.514947, -0.9188018, 2.741071, 0, 0, 1, 1, 1,
0.5216121, 0.9631748, 0.7755744, 1, 0, 0, 1, 1,
0.5216479, 0.1898829, 0.5583934, 1, 0, 0, 1, 1,
0.5224102, -1.424647, 3.113447, 1, 0, 0, 1, 1,
0.5274771, 0.05204418, -0.1265153, 1, 0, 0, 1, 1,
0.5280379, 1.699421, 0.3572545, 1, 0, 0, 1, 1,
0.5313065, 0.6249148, 0.02284532, 0, 0, 0, 1, 1,
0.5321431, 0.1878868, 3.19808, 0, 0, 0, 1, 1,
0.5340086, -0.02648476, 2.124008, 0, 0, 0, 1, 1,
0.5401947, 1.916937, -1.815503, 0, 0, 0, 1, 1,
0.5414882, -0.6262957, 1.910886, 0, 0, 0, 1, 1,
0.5459596, 0.4251406, 2.336879, 0, 0, 0, 1, 1,
0.5465909, -0.5498719, 0.9424044, 0, 0, 0, 1, 1,
0.5587412, 0.9610044, 0.4406585, 1, 1, 1, 1, 1,
0.565475, 0.569015, 0.8508619, 1, 1, 1, 1, 1,
0.5683282, -0.2047432, 2.446154, 1, 1, 1, 1, 1,
0.5698598, 1.802747, -1.798092, 1, 1, 1, 1, 1,
0.5800171, -0.403731, 1.162515, 1, 1, 1, 1, 1,
0.58029, 0.7410453, 2.343934, 1, 1, 1, 1, 1,
0.581158, -0.0802868, 4.305395, 1, 1, 1, 1, 1,
0.5844741, 2.927172, -0.02633993, 1, 1, 1, 1, 1,
0.5865539, 0.7094392, -0.4127621, 1, 1, 1, 1, 1,
0.5917514, -0.9601005, 2.757763, 1, 1, 1, 1, 1,
0.59377, 0.2013227, 0.6065241, 1, 1, 1, 1, 1,
0.5968786, 2.441812, -1.006897, 1, 1, 1, 1, 1,
0.5992402, 1.213346, 0.8110163, 1, 1, 1, 1, 1,
0.6052876, -0.8623645, 0.3870718, 1, 1, 1, 1, 1,
0.6105378, -0.4017705, 3.540582, 1, 1, 1, 1, 1,
0.6139052, 0.5670659, -0.647134, 0, 0, 1, 1, 1,
0.6144754, 1.038314, 1.457511, 1, 0, 0, 1, 1,
0.614677, 0.1303001, 1.311327, 1, 0, 0, 1, 1,
0.6236867, -0.6498355, 3.060411, 1, 0, 0, 1, 1,
0.6241542, -1.196069, 2.786494, 1, 0, 0, 1, 1,
0.6246504, -0.6287719, 3.822463, 1, 0, 0, 1, 1,
0.6251039, -0.1244574, 0.06074066, 0, 0, 0, 1, 1,
0.625416, 1.203722, 1.532476, 0, 0, 0, 1, 1,
0.6306475, -1.618028, 2.435682, 0, 0, 0, 1, 1,
0.6308737, -0.141493, 0.7987067, 0, 0, 0, 1, 1,
0.6311105, 0.6341797, -0.3614278, 0, 0, 0, 1, 1,
0.636035, 0.5193431, 0.1853916, 0, 0, 0, 1, 1,
0.6375694, 0.2923931, 2.002227, 0, 0, 0, 1, 1,
0.6426356, 0.5334525, 1.630443, 1, 1, 1, 1, 1,
0.6427314, -0.04353223, 0.5191095, 1, 1, 1, 1, 1,
0.6546507, -1.217151, 3.271595, 1, 1, 1, 1, 1,
0.65584, 0.03074181, 2.210458, 1, 1, 1, 1, 1,
0.6587485, -2.678148, 1.764102, 1, 1, 1, 1, 1,
0.6646926, 1.412825, -1.06715, 1, 1, 1, 1, 1,
0.6648046, 0.6321049, 0.5726472, 1, 1, 1, 1, 1,
0.6707721, 0.4206358, 1.50238, 1, 1, 1, 1, 1,
0.6713958, -1.8144, 2.074891, 1, 1, 1, 1, 1,
0.6724954, 0.5774433, 0.5288774, 1, 1, 1, 1, 1,
0.6740805, 1.24535, -0.7416434, 1, 1, 1, 1, 1,
0.6816519, -0.5805091, 1.833245, 1, 1, 1, 1, 1,
0.6828518, 0.0505459, 1.244104, 1, 1, 1, 1, 1,
0.6847959, -0.7347418, 3.309455, 1, 1, 1, 1, 1,
0.6921033, 0.2145005, 3.044272, 1, 1, 1, 1, 1,
0.6936536, 1.490437, 1.339869, 0, 0, 1, 1, 1,
0.6948204, 0.2755227, 1.707606, 1, 0, 0, 1, 1,
0.6972662, -0.8749216, 1.083285, 1, 0, 0, 1, 1,
0.7016069, 0.06648885, 1.69896, 1, 0, 0, 1, 1,
0.7116404, -2.050678, 1.534737, 1, 0, 0, 1, 1,
0.7134389, 0.5255329, -0.6743345, 1, 0, 0, 1, 1,
0.7169302, -0.6255381, 2.538419, 0, 0, 0, 1, 1,
0.7211005, -0.2471854, 2.457223, 0, 0, 0, 1, 1,
0.7244871, 0.4945925, -1.075976, 0, 0, 0, 1, 1,
0.7253748, 0.2474531, 1.39724, 0, 0, 0, 1, 1,
0.7277929, -0.4189453, 1.94297, 0, 0, 0, 1, 1,
0.7284663, 0.4418676, -0.7966253, 0, 0, 0, 1, 1,
0.7287495, -0.078049, -0.4431176, 0, 0, 0, 1, 1,
0.7308538, 0.7014357, 1.328345, 1, 1, 1, 1, 1,
0.7328742, 1.410838, -1.571388, 1, 1, 1, 1, 1,
0.7337739, 1.678161, -0.2445395, 1, 1, 1, 1, 1,
0.7398978, 0.663579, 1.433415, 1, 1, 1, 1, 1,
0.7470607, -1.152757, 2.317421, 1, 1, 1, 1, 1,
0.7550683, 0.2339279, 1.310822, 1, 1, 1, 1, 1,
0.759101, 1.416637, -0.799334, 1, 1, 1, 1, 1,
0.7612228, 0.2553052, 0.4132659, 1, 1, 1, 1, 1,
0.7625748, 1.027022, 0.1791851, 1, 1, 1, 1, 1,
0.7627316, -1.025557, 2.668724, 1, 1, 1, 1, 1,
0.7663379, -0.3338784, 1.787577, 1, 1, 1, 1, 1,
0.7717022, 0.5790634, 1.827678, 1, 1, 1, 1, 1,
0.7770713, 0.467192, -0.7712791, 1, 1, 1, 1, 1,
0.7790366, 1.683826, 0.326863, 1, 1, 1, 1, 1,
0.7793477, 0.5160254, 4.25542, 1, 1, 1, 1, 1,
0.7801812, -0.0574461, 1.133565, 0, 0, 1, 1, 1,
0.782587, 2.318932, 1.148414, 1, 0, 0, 1, 1,
0.7894597, 1.499937, 0.05472294, 1, 0, 0, 1, 1,
0.7903737, -1.617186, 0.914108, 1, 0, 0, 1, 1,
0.7986759, -0.7323934, 2.156615, 1, 0, 0, 1, 1,
0.8006976, 0.2276252, 2.65392, 1, 0, 0, 1, 1,
0.8048827, 0.2654538, 0.6908189, 0, 0, 0, 1, 1,
0.8132933, -1.074004, 3.09401, 0, 0, 0, 1, 1,
0.815633, -2.036893, 2.117605, 0, 0, 0, 1, 1,
0.8301698, 1.21516, 0.844025, 0, 0, 0, 1, 1,
0.8337013, -1.359285, 3.057595, 0, 0, 0, 1, 1,
0.8385857, -0.9947176, 3.163007, 0, 0, 0, 1, 1,
0.8429061, -0.2342379, 1.183166, 0, 0, 0, 1, 1,
0.8461977, -0.4030366, 2.455987, 1, 1, 1, 1, 1,
0.8467688, -1.305313, 2.026002, 1, 1, 1, 1, 1,
0.8475005, -2.563305, 2.219832, 1, 1, 1, 1, 1,
0.8508795, 0.2263235, 0.0294961, 1, 1, 1, 1, 1,
0.8521328, -1.564274, 2.18993, 1, 1, 1, 1, 1,
0.8550623, 0.3996181, 0.961008, 1, 1, 1, 1, 1,
0.8552255, 0.009224192, 2.445012, 1, 1, 1, 1, 1,
0.8567067, 1.923102, -0.6902488, 1, 1, 1, 1, 1,
0.8640192, -1.920753, 2.489467, 1, 1, 1, 1, 1,
0.8656032, -0.6018669, 3.607218, 1, 1, 1, 1, 1,
0.8693464, 2.064993, 1.931607, 1, 1, 1, 1, 1,
0.8743913, -0.9219776, 1.633636, 1, 1, 1, 1, 1,
0.8752934, 1.121224, -0.6766284, 1, 1, 1, 1, 1,
0.8754532, -0.4225214, 3.899384, 1, 1, 1, 1, 1,
0.8783056, -0.4029736, 2.652437, 1, 1, 1, 1, 1,
0.8797382, 0.2415208, 1.528158, 0, 0, 1, 1, 1,
0.8812181, 0.1087839, 1.260869, 1, 0, 0, 1, 1,
0.8823738, 1.099346, 0.9631971, 1, 0, 0, 1, 1,
0.8839936, 0.2463242, 2.657996, 1, 0, 0, 1, 1,
0.886739, -2.63206, 4.044384, 1, 0, 0, 1, 1,
0.8875461, -0.06770158, 1.399024, 1, 0, 0, 1, 1,
0.8936493, -0.4779674, 3.257897, 0, 0, 0, 1, 1,
0.8988226, 1.007509, 2.440206, 0, 0, 0, 1, 1,
0.913355, -0.8282933, 4.62398, 0, 0, 0, 1, 1,
0.9143806, -0.7500237, 0.6389485, 0, 0, 0, 1, 1,
0.9179392, -0.7893366, 2.654548, 0, 0, 0, 1, 1,
0.9191878, 0.8270726, 2.111485, 0, 0, 0, 1, 1,
0.9209626, 0.03716317, 0.931759, 0, 0, 0, 1, 1,
0.9244996, -0.0472883, 1.855083, 1, 1, 1, 1, 1,
0.9263264, -2.2643, 1.834371, 1, 1, 1, 1, 1,
0.9305908, -2.310114, 2.71124, 1, 1, 1, 1, 1,
0.9364595, 0.6917024, 3.083967, 1, 1, 1, 1, 1,
0.9395273, -0.1778756, 0.3114445, 1, 1, 1, 1, 1,
0.9439829, 1.485581, 0.4408129, 1, 1, 1, 1, 1,
0.9478183, -0.1062529, 1.791595, 1, 1, 1, 1, 1,
0.9539498, 0.175202, 1.669367, 1, 1, 1, 1, 1,
0.9563973, 1.099287, -0.7805468, 1, 1, 1, 1, 1,
0.9620662, -0.400732, 2.37197, 1, 1, 1, 1, 1,
0.967299, -0.1692944, 1.881047, 1, 1, 1, 1, 1,
0.9717704, -1.539492, 2.912864, 1, 1, 1, 1, 1,
0.9801133, 0.1093671, 1.403413, 1, 1, 1, 1, 1,
0.9818687, 0.6415679, 1.354037, 1, 1, 1, 1, 1,
0.9865097, 1.195872, -0.5207618, 1, 1, 1, 1, 1,
0.9874346, -0.5431427, 2.287561, 0, 0, 1, 1, 1,
0.9902729, -0.01714646, 0.240241, 1, 0, 0, 1, 1,
0.9906939, -0.3973657, 0.8279618, 1, 0, 0, 1, 1,
0.9928671, 0.5100885, 2.50447, 1, 0, 0, 1, 1,
0.9942764, -0.5471935, 0.831354, 1, 0, 0, 1, 1,
0.9983567, -1.685528, 1.88822, 1, 0, 0, 1, 1,
0.9983896, 1.424668, 0.1195123, 0, 0, 0, 1, 1,
0.9993726, 0.63258, 2.359731, 0, 0, 0, 1, 1,
1.012856, -1.755704, 0.6532753, 0, 0, 0, 1, 1,
1.013266, 0.807215, 1.465311, 0, 0, 0, 1, 1,
1.016857, 0.7383591, 2.071217, 0, 0, 0, 1, 1,
1.017769, 0.1444675, 0.1256927, 0, 0, 0, 1, 1,
1.019463, 0.2095928, 0.8029231, 0, 0, 0, 1, 1,
1.02186, -0.2115035, 1.307982, 1, 1, 1, 1, 1,
1.030618, -0.328592, 2.423129, 1, 1, 1, 1, 1,
1.036024, 0.8420383, 0.8831788, 1, 1, 1, 1, 1,
1.036355, 1.489563, 0.04672137, 1, 1, 1, 1, 1,
1.044234, 0.08529176, 1.692715, 1, 1, 1, 1, 1,
1.047127, -0.9839513, 0.5728897, 1, 1, 1, 1, 1,
1.05451, -0.06997657, 0.8488972, 1, 1, 1, 1, 1,
1.056149, 0.06328993, 0.3805196, 1, 1, 1, 1, 1,
1.060425, 0.1709304, 0.399686, 1, 1, 1, 1, 1,
1.061205, 1.112203, 1.241008, 1, 1, 1, 1, 1,
1.062857, -0.06620575, 1.066005, 1, 1, 1, 1, 1,
1.067612, 1.646713, 1.093328, 1, 1, 1, 1, 1,
1.070955, 1.192968, 0.3154886, 1, 1, 1, 1, 1,
1.071866, 0.6593717, 0.2573134, 1, 1, 1, 1, 1,
1.077922, 0.6819626, -0.7321376, 1, 1, 1, 1, 1,
1.085999, 0.8414805, -0.7029428, 0, 0, 1, 1, 1,
1.086119, 0.2476882, -0.08369508, 1, 0, 0, 1, 1,
1.088524, 0.435147, 0.6752589, 1, 0, 0, 1, 1,
1.089634, 0.3415572, 0.1347301, 1, 0, 0, 1, 1,
1.092575, 0.1286957, 2.807504, 1, 0, 0, 1, 1,
1.094278, 0.4475116, 1.77921, 1, 0, 0, 1, 1,
1.094735, 0.006800774, 2.886096, 0, 0, 0, 1, 1,
1.099622, 0.5263197, 0.05876061, 0, 0, 0, 1, 1,
1.099715, -0.2068251, 0.2407713, 0, 0, 0, 1, 1,
1.106293, -1.739592, 2.50406, 0, 0, 0, 1, 1,
1.111107, -0.7784256, 2.930573, 0, 0, 0, 1, 1,
1.119763, 2.064178, 0.5293988, 0, 0, 0, 1, 1,
1.126136, -1.162075, 2.340472, 0, 0, 0, 1, 1,
1.12616, 0.8295822, 0.008952594, 1, 1, 1, 1, 1,
1.126915, 0.5611316, 0.1763318, 1, 1, 1, 1, 1,
1.128806, 0.06149227, 3.058233, 1, 1, 1, 1, 1,
1.131164, -0.1765665, 1.275681, 1, 1, 1, 1, 1,
1.131712, -0.6988859, 2.309392, 1, 1, 1, 1, 1,
1.141328, -0.6423707, 1.958657, 1, 1, 1, 1, 1,
1.150923, 2.031539, -0.313741, 1, 1, 1, 1, 1,
1.151953, 0.5211232, 2.911523, 1, 1, 1, 1, 1,
1.160591, 0.4398861, 0.698651, 1, 1, 1, 1, 1,
1.162853, -0.05616991, 2.897813, 1, 1, 1, 1, 1,
1.163674, -0.4962335, 1.534161, 1, 1, 1, 1, 1,
1.16876, 0.279998, 1.1659, 1, 1, 1, 1, 1,
1.174533, 0.5523562, 1.488262, 1, 1, 1, 1, 1,
1.177283, -1.209119, 0.8332526, 1, 1, 1, 1, 1,
1.185031, -0.692345, 2.845152, 1, 1, 1, 1, 1,
1.192282, -0.8588538, 2.818245, 0, 0, 1, 1, 1,
1.192313, -1.008655, 3.288288, 1, 0, 0, 1, 1,
1.195466, 0.7568898, 0.6107083, 1, 0, 0, 1, 1,
1.200492, 1.827305, 0.2112424, 1, 0, 0, 1, 1,
1.208323, 0.04783833, 1.764743, 1, 0, 0, 1, 1,
1.213664, -1.209417, 0.8152429, 1, 0, 0, 1, 1,
1.214703, 0.3647015, 1.119221, 0, 0, 0, 1, 1,
1.22168, 0.02696784, 1.588599, 0, 0, 0, 1, 1,
1.223855, -1.276255, 3.254909, 0, 0, 0, 1, 1,
1.226153, -0.6476331, 2.332986, 0, 0, 0, 1, 1,
1.231813, 0.1851956, 0.5349302, 0, 0, 0, 1, 1,
1.233095, 0.2411931, 0.6637461, 0, 0, 0, 1, 1,
1.239819, -0.5342008, 1.312615, 0, 0, 0, 1, 1,
1.24433, 0.6211095, 0.6835241, 1, 1, 1, 1, 1,
1.246525, 0.904152, 1.117795, 1, 1, 1, 1, 1,
1.249132, -0.3763516, 1.502184, 1, 1, 1, 1, 1,
1.254748, -1.825362, 1.36835, 1, 1, 1, 1, 1,
1.272519, -0.4527928, 2.694065, 1, 1, 1, 1, 1,
1.273335, 0.09674963, 2.747055, 1, 1, 1, 1, 1,
1.276069, 0.4194094, 0.5131608, 1, 1, 1, 1, 1,
1.296722, 0.713375, 0.9802093, 1, 1, 1, 1, 1,
1.305836, 0.5020533, 1.881399, 1, 1, 1, 1, 1,
1.315685, -0.1187016, 2.324666, 1, 1, 1, 1, 1,
1.324391, -0.5767462, 1.229584, 1, 1, 1, 1, 1,
1.324959, -0.5320165, -0.1158891, 1, 1, 1, 1, 1,
1.329973, -0.09919018, 1.80341, 1, 1, 1, 1, 1,
1.335697, 1.376853, -0.3513721, 1, 1, 1, 1, 1,
1.342986, -0.9445786, 2.10575, 1, 1, 1, 1, 1,
1.343277, 2.09832, 1.0747, 0, 0, 1, 1, 1,
1.343737, -1.667731, 1.349634, 1, 0, 0, 1, 1,
1.344815, 0.7785947, 0.5688483, 1, 0, 0, 1, 1,
1.353329, 0.1142953, -1.487001, 1, 0, 0, 1, 1,
1.357609, 0.4644195, 3.545648, 1, 0, 0, 1, 1,
1.361997, -1.10873, 2.253632, 1, 0, 0, 1, 1,
1.371902, 0.7535001, 2.077862, 0, 0, 0, 1, 1,
1.383222, 0.5223336, 1.767796, 0, 0, 0, 1, 1,
1.39652, 1.153994, 2.560347, 0, 0, 0, 1, 1,
1.400858, -0.6331005, 2.779906, 0, 0, 0, 1, 1,
1.401059, 0.2588706, 2.310911, 0, 0, 0, 1, 1,
1.402301, -0.5929824, 3.36951, 0, 0, 0, 1, 1,
1.404146, 1.295845, 2.265593, 0, 0, 0, 1, 1,
1.42331, 2.058357, 2.745535, 1, 1, 1, 1, 1,
1.428884, -0.3433098, 2.472343, 1, 1, 1, 1, 1,
1.429046, -0.3943264, 1.622908, 1, 1, 1, 1, 1,
1.430138, 0.2892381, 1.456552, 1, 1, 1, 1, 1,
1.430225, -0.8902785, 3.260835, 1, 1, 1, 1, 1,
1.445737, 0.2348047, 0.5169544, 1, 1, 1, 1, 1,
1.447071, -1.061693, 3.209053, 1, 1, 1, 1, 1,
1.449973, 0.7018955, -0.6100572, 1, 1, 1, 1, 1,
1.45301, 1.455917, 2.7142, 1, 1, 1, 1, 1,
1.458919, -0.1286398, 1.088334, 1, 1, 1, 1, 1,
1.459877, -0.4293228, 2.838172, 1, 1, 1, 1, 1,
1.462048, -0.5681967, 1.489215, 1, 1, 1, 1, 1,
1.464842, 1.508011, -0.5727247, 1, 1, 1, 1, 1,
1.47728, -1.277559, 1.444446, 1, 1, 1, 1, 1,
1.486781, -0.08809794, 0.3553062, 1, 1, 1, 1, 1,
1.497302, 2.222371, 1.816702, 0, 0, 1, 1, 1,
1.50433, 0.4639017, 1.328308, 1, 0, 0, 1, 1,
1.510858, 0.1581894, 1.453371, 1, 0, 0, 1, 1,
1.511447, -0.3988353, 1.561354, 1, 0, 0, 1, 1,
1.522222, -0.9558827, 1.067194, 1, 0, 0, 1, 1,
1.526021, -0.0255826, 1.442608, 1, 0, 0, 1, 1,
1.528208, -1.01478, 1.706471, 0, 0, 0, 1, 1,
1.532994, 1.023036, 0.920785, 0, 0, 0, 1, 1,
1.535058, -0.1163478, 3.465706, 0, 0, 0, 1, 1,
1.537759, 0.7142316, -0.473025, 0, 0, 0, 1, 1,
1.540625, -0.3931659, 1.539696, 0, 0, 0, 1, 1,
1.552504, 1.331833, 1.418789, 0, 0, 0, 1, 1,
1.557246, -0.8917701, 0.04734193, 0, 0, 0, 1, 1,
1.562013, 0.6078026, 0.418919, 1, 1, 1, 1, 1,
1.567644, 1.053249, 2.146373, 1, 1, 1, 1, 1,
1.568134, -0.0961014, 2.176301, 1, 1, 1, 1, 1,
1.569236, 1.2372, 0.2771401, 1, 1, 1, 1, 1,
1.576126, -0.708083, 1.994926, 1, 1, 1, 1, 1,
1.576433, 1.090001, -0.3391452, 1, 1, 1, 1, 1,
1.593366, -0.5424616, 0.8548067, 1, 1, 1, 1, 1,
1.606633, 0.8396972, 1.472222, 1, 1, 1, 1, 1,
1.621013, 0.7422584, 1.921196, 1, 1, 1, 1, 1,
1.625911, 1.539939, 0.130199, 1, 1, 1, 1, 1,
1.64422, 0.3756642, 3.451248, 1, 1, 1, 1, 1,
1.660097, 0.5832457, 0.3047536, 1, 1, 1, 1, 1,
1.669945, 2.104614, -1.839095, 1, 1, 1, 1, 1,
1.674359, -0.7297275, 3.712538, 1, 1, 1, 1, 1,
1.729382, 1.2385, -0.3005656, 1, 1, 1, 1, 1,
1.740202, -1.990771, 2.49183, 0, 0, 1, 1, 1,
1.742988, -0.3758828, 1.928857, 1, 0, 0, 1, 1,
1.751584, -0.8799354, 0.6881623, 1, 0, 0, 1, 1,
1.765007, 0.6280434, 1.564283, 1, 0, 0, 1, 1,
1.768674, -0.2776697, 1.787765, 1, 0, 0, 1, 1,
1.775253, 0.01586231, 1.780718, 1, 0, 0, 1, 1,
1.78866, -0.1279915, 1.432531, 0, 0, 0, 1, 1,
1.797572, -1.747873, 2.490563, 0, 0, 0, 1, 1,
1.809553, -1.194075, 4.156834, 0, 0, 0, 1, 1,
1.825511, 0.6920493, 1.622278, 0, 0, 0, 1, 1,
1.828248, 1.191327, 1.069435, 0, 0, 0, 1, 1,
1.830061, 0.4845602, 3.261577, 0, 0, 0, 1, 1,
1.850205, -0.372353, 1.032064, 0, 0, 0, 1, 1,
1.863951, -0.4108513, 4.228641, 1, 1, 1, 1, 1,
1.874949, -0.4791074, 2.764359, 1, 1, 1, 1, 1,
1.89366, -0.9389827, 2.029905, 1, 1, 1, 1, 1,
1.915498, 1.294627, -1.783299, 1, 1, 1, 1, 1,
1.91947, 0.6150584, 0.6541429, 1, 1, 1, 1, 1,
1.928435, -0.2462443, 2.980995, 1, 1, 1, 1, 1,
1.94414, -0.2372065, 1.144686, 1, 1, 1, 1, 1,
1.968153, 1.481915, 0.8474703, 1, 1, 1, 1, 1,
2.031333, 1.107507, 1.926833, 1, 1, 1, 1, 1,
2.060333, -0.4603452, 0.7646921, 1, 1, 1, 1, 1,
2.067997, -0.4712074, -0.09315678, 1, 1, 1, 1, 1,
2.110581, 0.7420235, 2.103349, 1, 1, 1, 1, 1,
2.113589, 0.7280875, 1.84426, 1, 1, 1, 1, 1,
2.115712, 0.0529831, 2.726144, 1, 1, 1, 1, 1,
2.152541, 0.3756453, 0.4677184, 1, 1, 1, 1, 1,
2.164135, -0.2590198, 2.437678, 0, 0, 1, 1, 1,
2.175917, 0.1723695, 1.314228, 1, 0, 0, 1, 1,
2.186597, 0.4322484, 1.891548, 1, 0, 0, 1, 1,
2.229042, 0.1490304, 0.7440707, 1, 0, 0, 1, 1,
2.238487, -0.0460553, 0.4164011, 1, 0, 0, 1, 1,
2.239196, -0.4455293, 1.743546, 1, 0, 0, 1, 1,
2.242686, 1.761656, 0.005848263, 0, 0, 0, 1, 1,
2.265502, -0.7971584, 1.63358, 0, 0, 0, 1, 1,
2.288945, 0.02029092, 3.110365, 0, 0, 0, 1, 1,
2.297239, -1.757813, 2.326418, 0, 0, 0, 1, 1,
2.377325, 1.119686, 0.7736152, 0, 0, 0, 1, 1,
2.39775, 0.3248958, 2.580609, 0, 0, 0, 1, 1,
2.446372, -1.32379, 2.393064, 0, 0, 0, 1, 1,
2.446878, 2.026804, 0.9560807, 1, 1, 1, 1, 1,
2.487395, 0.6417989, 1.937161, 1, 1, 1, 1, 1,
2.513139, -0.8736904, 4.19636, 1, 1, 1, 1, 1,
2.517529, 0.1219703, 1.559956, 1, 1, 1, 1, 1,
2.680399, -1.842936, 1.840672, 1, 1, 1, 1, 1,
2.881034, -0.8833696, 2.103307, 1, 1, 1, 1, 1,
3.357875, -2.404258, 2.690837, 1, 1, 1, 1, 1
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
var radius = 10.32305;
var distance = 36.25928;
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
mvMatrix.translate( 0.03332448, -0.06833613, -0.3888049 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.25928);
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
