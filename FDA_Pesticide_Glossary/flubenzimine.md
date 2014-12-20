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
-3.358503, 0.9177797, -0.4200353, 1, 0, 0, 1,
-2.945041, 0.4535414, -1.179386, 1, 0.007843138, 0, 1,
-2.845851, -0.536715, -2.194441, 1, 0.01176471, 0, 1,
-2.706461, 0.9191011, -2.070447, 1, 0.01960784, 0, 1,
-2.641824, -0.8058085, -2.664695, 1, 0.02352941, 0, 1,
-2.640954, 0.7246128, -0.5104554, 1, 0.03137255, 0, 1,
-2.625588, 0.370519, -0.9404389, 1, 0.03529412, 0, 1,
-2.595314, -0.5199938, -2.991304, 1, 0.04313726, 0, 1,
-2.587607, -2.124282, -2.653497, 1, 0.04705882, 0, 1,
-2.565721, -1.513724, -2.693359, 1, 0.05490196, 0, 1,
-2.458415, 0.636138, -1.128312, 1, 0.05882353, 0, 1,
-2.394447, -0.1261013, -0.7918143, 1, 0.06666667, 0, 1,
-2.385405, -1.072804, -3.999686, 1, 0.07058824, 0, 1,
-2.359336, 0.6750729, -0.4379106, 1, 0.07843138, 0, 1,
-2.301396, 0.06583749, -1.282951, 1, 0.08235294, 0, 1,
-2.297708, -0.3424014, -1.452841, 1, 0.09019608, 0, 1,
-2.264943, -0.005619701, -3.172609, 1, 0.09411765, 0, 1,
-2.261837, 0.8521644, -1.475935, 1, 0.1019608, 0, 1,
-2.229544, -0.04110304, -1.815885, 1, 0.1098039, 0, 1,
-2.133954, 1.22489, -0.9841555, 1, 0.1137255, 0, 1,
-2.095671, 0.1277926, -1.836172, 1, 0.1215686, 0, 1,
-2.085075, 0.9140204, -1.321641, 1, 0.1254902, 0, 1,
-2.065178, -1.526501, -2.032378, 1, 0.1333333, 0, 1,
-1.971706, -0.5827621, -3.748943, 1, 0.1372549, 0, 1,
-1.947283, 1.75075, -1.23305, 1, 0.145098, 0, 1,
-1.929657, 0.6151472, -3.114704, 1, 0.1490196, 0, 1,
-1.924273, -0.01983472, -2.458504, 1, 0.1568628, 0, 1,
-1.917441, 3.430317, -0.6179568, 1, 0.1607843, 0, 1,
-1.901958, -1.439365, -3.344917, 1, 0.1686275, 0, 1,
-1.875625, 0.6659238, -0.8644273, 1, 0.172549, 0, 1,
-1.843422, -0.236996, -2.096178, 1, 0.1803922, 0, 1,
-1.83687, -0.6278861, -2.768714, 1, 0.1843137, 0, 1,
-1.828294, -1.663318, -1.537072, 1, 0.1921569, 0, 1,
-1.815074, 0.1228575, -1.459109, 1, 0.1960784, 0, 1,
-1.814893, 0.3680791, -1.423371, 1, 0.2039216, 0, 1,
-1.810688, 0.4735164, -1.366023, 1, 0.2117647, 0, 1,
-1.803493, -0.4920323, -2.154616, 1, 0.2156863, 0, 1,
-1.79145, 0.8868096, -1.46727, 1, 0.2235294, 0, 1,
-1.783544, -0.4740179, -1.319013, 1, 0.227451, 0, 1,
-1.779022, 0.8965656, -2.707998, 1, 0.2352941, 0, 1,
-1.776042, 0.7786948, 0.08062181, 1, 0.2392157, 0, 1,
-1.775321, 0.7352047, 0.7883105, 1, 0.2470588, 0, 1,
-1.767219, 1.089467, -0.7239553, 1, 0.2509804, 0, 1,
-1.743705, 0.7000416, -1.512831, 1, 0.2588235, 0, 1,
-1.727332, 0.1175587, -1.739487, 1, 0.2627451, 0, 1,
-1.720276, -0.3213972, -3.378447, 1, 0.2705882, 0, 1,
-1.720028, -1.639139, -2.201583, 1, 0.2745098, 0, 1,
-1.70507, 1.451303, -0.7517026, 1, 0.282353, 0, 1,
-1.674305, 0.09263632, -1.914137, 1, 0.2862745, 0, 1,
-1.628975, -2.941652, -3.200798, 1, 0.2941177, 0, 1,
-1.625834, -1.677764, -2.861601, 1, 0.3019608, 0, 1,
-1.621091, -1.103152, -0.3429068, 1, 0.3058824, 0, 1,
-1.616992, 1.785847, 1.075546, 1, 0.3137255, 0, 1,
-1.615324, -0.2889467, -0.9144999, 1, 0.3176471, 0, 1,
-1.602306, -0.633017, -3.000121, 1, 0.3254902, 0, 1,
-1.602259, -0.07936732, -0.7963036, 1, 0.3294118, 0, 1,
-1.596127, -0.5592703, -2.228664, 1, 0.3372549, 0, 1,
-1.590697, 1.746466, -0.7075171, 1, 0.3411765, 0, 1,
-1.589758, 0.8039851, 0.1885125, 1, 0.3490196, 0, 1,
-1.587871, -0.6891093, -3.394577, 1, 0.3529412, 0, 1,
-1.57892, -1.517493, -1.622977, 1, 0.3607843, 0, 1,
-1.578826, 1.13097, 0.05111159, 1, 0.3647059, 0, 1,
-1.573626, 1.645511, -2.369025, 1, 0.372549, 0, 1,
-1.571987, 0.6645175, -0.1450931, 1, 0.3764706, 0, 1,
-1.566118, 0.9199766, -0.1750713, 1, 0.3843137, 0, 1,
-1.551605, -0.6788206, -1.700028, 1, 0.3882353, 0, 1,
-1.545041, 0.02668318, -3.676374, 1, 0.3960784, 0, 1,
-1.538803, -0.1630567, -2.718957, 1, 0.4039216, 0, 1,
-1.537545, -0.1927234, -0.9800388, 1, 0.4078431, 0, 1,
-1.532024, -1.364923, -2.614218, 1, 0.4156863, 0, 1,
-1.530788, 1.601207, -1.387911, 1, 0.4196078, 0, 1,
-1.52867, -0.8402761, -2.394006, 1, 0.427451, 0, 1,
-1.525496, 0.375601, -0.6135715, 1, 0.4313726, 0, 1,
-1.521473, -0.2704112, -1.593195, 1, 0.4392157, 0, 1,
-1.520603, -0.1592547, -0.347896, 1, 0.4431373, 0, 1,
-1.511358, 1.032047, -1.521926, 1, 0.4509804, 0, 1,
-1.507126, 0.2869148, -2.047943, 1, 0.454902, 0, 1,
-1.497281, -0.8224888, -1.568626, 1, 0.4627451, 0, 1,
-1.476739, -0.07208426, -1.101563, 1, 0.4666667, 0, 1,
-1.473542, -0.4657876, -1.693003, 1, 0.4745098, 0, 1,
-1.463712, -1.067362, -1.766182, 1, 0.4784314, 0, 1,
-1.454136, -1.630116, -3.430781, 1, 0.4862745, 0, 1,
-1.448983, 0.274158, -2.516922, 1, 0.4901961, 0, 1,
-1.441745, 1.394778, -0.7791259, 1, 0.4980392, 0, 1,
-1.434961, -0.8360342, -2.635481, 1, 0.5058824, 0, 1,
-1.432189, 0.7094571, -0.5106687, 1, 0.509804, 0, 1,
-1.415998, 0.2603633, -1.714066, 1, 0.5176471, 0, 1,
-1.410893, 0.2039612, 0.07315226, 1, 0.5215687, 0, 1,
-1.400838, 1.470001, 0.3600031, 1, 0.5294118, 0, 1,
-1.3944, 0.2729164, -2.417151, 1, 0.5333334, 0, 1,
-1.394121, -0.5605676, -3.012781, 1, 0.5411765, 0, 1,
-1.375378, 0.1624565, -2.206594, 1, 0.5450981, 0, 1,
-1.372948, 0.8483453, -2.861599, 1, 0.5529412, 0, 1,
-1.365531, 2.151561, -0.4649853, 1, 0.5568628, 0, 1,
-1.3643, -0.4820789, -2.729794, 1, 0.5647059, 0, 1,
-1.362439, 0.3668798, -0.6952429, 1, 0.5686275, 0, 1,
-1.354099, -0.1705097, -1.476782, 1, 0.5764706, 0, 1,
-1.334663, 1.385018, -1.10521, 1, 0.5803922, 0, 1,
-1.32858, -0.5184253, 1.324805, 1, 0.5882353, 0, 1,
-1.308771, 0.6430945, -1.95346, 1, 0.5921569, 0, 1,
-1.308287, 2.382383, -1.404542, 1, 0.6, 0, 1,
-1.287895, -2.368345, -3.82107, 1, 0.6078432, 0, 1,
-1.286364, 0.7776748, -0.3454696, 1, 0.6117647, 0, 1,
-1.285743, 1.260754, 0.09020797, 1, 0.6196079, 0, 1,
-1.283959, -1.162783, -0.9335448, 1, 0.6235294, 0, 1,
-1.280803, 0.6673753, 0.8880684, 1, 0.6313726, 0, 1,
-1.279902, -0.6487572, -2.436985, 1, 0.6352941, 0, 1,
-1.278879, -0.132434, -1.206385, 1, 0.6431373, 0, 1,
-1.27651, 1.452146, -1.901996, 1, 0.6470588, 0, 1,
-1.274565, 0.4346815, -1.941219, 1, 0.654902, 0, 1,
-1.273476, -0.3656201, -1.695914, 1, 0.6588235, 0, 1,
-1.27213, -1.699152, -1.674679, 1, 0.6666667, 0, 1,
-1.27144, 0.8385109, 0.7242274, 1, 0.6705883, 0, 1,
-1.257579, -1.511516, -3.961185, 1, 0.6784314, 0, 1,
-1.251416, 0.8883276, -0.972765, 1, 0.682353, 0, 1,
-1.24955, -0.4884256, -2.510981, 1, 0.6901961, 0, 1,
-1.235735, 0.06161726, -0.5566449, 1, 0.6941177, 0, 1,
-1.232121, 1.352251, -1.734733, 1, 0.7019608, 0, 1,
-1.220528, -2.905348, -3.306209, 1, 0.7098039, 0, 1,
-1.215736, -1.156538, -3.5507, 1, 0.7137255, 0, 1,
-1.205038, 0.4977799, -1.314625, 1, 0.7215686, 0, 1,
-1.188251, -0.2634922, -2.135199, 1, 0.7254902, 0, 1,
-1.187503, -2.090925, -2.545225, 1, 0.7333333, 0, 1,
-1.180458, -2.154274, -2.518443, 1, 0.7372549, 0, 1,
-1.168133, 1.105517, -1.005331, 1, 0.7450981, 0, 1,
-1.167371, 0.5928166, -0.7737029, 1, 0.7490196, 0, 1,
-1.162094, -1.501906, -0.2745703, 1, 0.7568628, 0, 1,
-1.16055, 0.2659795, -1.004199, 1, 0.7607843, 0, 1,
-1.159077, 0.09782076, -2.760359, 1, 0.7686275, 0, 1,
-1.147689, 1.856813, 0.41204, 1, 0.772549, 0, 1,
-1.14203, -0.8901878, -0.9286441, 1, 0.7803922, 0, 1,
-1.139117, 0.05417262, -0.8111829, 1, 0.7843137, 0, 1,
-1.137859, -1.879033, 0.5345314, 1, 0.7921569, 0, 1,
-1.128764, -0.3011253, -1.653213, 1, 0.7960784, 0, 1,
-1.120872, -0.399502, -0.842764, 1, 0.8039216, 0, 1,
-1.113851, 1.825193, 0.1330038, 1, 0.8117647, 0, 1,
-1.100103, 0.3175062, 0.5254818, 1, 0.8156863, 0, 1,
-1.099279, 0.1721286, 0.6514501, 1, 0.8235294, 0, 1,
-1.095098, 1.417256, -0.008319913, 1, 0.827451, 0, 1,
-1.086264, 0.6343687, -2.25796, 1, 0.8352941, 0, 1,
-1.082234, 0.7491199, -1.079129, 1, 0.8392157, 0, 1,
-1.081857, -0.6839908, -2.026863, 1, 0.8470588, 0, 1,
-1.080664, -0.5821854, -2.569401, 1, 0.8509804, 0, 1,
-1.076218, 0.2809516, -2.323362, 1, 0.8588235, 0, 1,
-1.074748, -0.7899785, -1.296004, 1, 0.8627451, 0, 1,
-1.07401, 1.248354, -0.3084201, 1, 0.8705882, 0, 1,
-1.045945, 0.6432434, -1.954805, 1, 0.8745098, 0, 1,
-1.04582, 1.958804, -0.01382431, 1, 0.8823529, 0, 1,
-1.042373, 1.096231, -0.5007076, 1, 0.8862745, 0, 1,
-1.041984, 1.200227, -1.901162, 1, 0.8941177, 0, 1,
-1.035351, -0.8983621, -4.323342, 1, 0.8980392, 0, 1,
-1.027041, -0.7183749, -2.141128, 1, 0.9058824, 0, 1,
-1.018198, 0.4258945, -2.322429, 1, 0.9137255, 0, 1,
-1.006607, -0.2903262, -0.9579519, 1, 0.9176471, 0, 1,
-1.006555, -0.8567538, -1.567914, 1, 0.9254902, 0, 1,
-1.006539, -0.6363276, -3.552233, 1, 0.9294118, 0, 1,
-1.001577, 0.3561675, -0.5085995, 1, 0.9372549, 0, 1,
-0.9954195, 0.6970893, -1.002559, 1, 0.9411765, 0, 1,
-0.9952287, -0.1645985, -2.57393, 1, 0.9490196, 0, 1,
-0.9952109, 0.3792111, -0.326753, 1, 0.9529412, 0, 1,
-0.9917089, -0.3517435, -1.609317, 1, 0.9607843, 0, 1,
-0.9916182, -0.7548203, -2.496406, 1, 0.9647059, 0, 1,
-0.9906896, -0.01529363, -1.605144, 1, 0.972549, 0, 1,
-0.9877494, 0.6709788, -0.7151218, 1, 0.9764706, 0, 1,
-0.9847024, -0.7564526, -1.926448, 1, 0.9843137, 0, 1,
-0.9835554, 0.200306, -1.271612, 1, 0.9882353, 0, 1,
-0.9824712, -0.07952926, -3.118549, 1, 0.9960784, 0, 1,
-0.9816099, -1.15307, -2.25832, 0.9960784, 1, 0, 1,
-0.9814739, -0.1336601, -2.579195, 0.9921569, 1, 0, 1,
-0.9781628, -0.392656, -1.040194, 0.9843137, 1, 0, 1,
-0.9776341, -0.5736306, -2.984358, 0.9803922, 1, 0, 1,
-0.9771916, 0.4762615, 0.6469418, 0.972549, 1, 0, 1,
-0.9745626, -0.5437914, -0.9628254, 0.9686275, 1, 0, 1,
-0.9695038, -0.4792754, -1.752471, 0.9607843, 1, 0, 1,
-0.9632222, 1.500365, 0.02445571, 0.9568627, 1, 0, 1,
-0.9613486, -1.778106, -3.111323, 0.9490196, 1, 0, 1,
-0.9603104, -1.918985, -4.46221, 0.945098, 1, 0, 1,
-0.9508947, -1.518131, -2.90191, 0.9372549, 1, 0, 1,
-0.9486809, -1.546992, -1.062205, 0.9333333, 1, 0, 1,
-0.9458109, 1.422513, -2.80687, 0.9254902, 1, 0, 1,
-0.9453444, 0.02566544, -2.990443, 0.9215686, 1, 0, 1,
-0.9378091, 1.504119, -0.8470825, 0.9137255, 1, 0, 1,
-0.9365912, 1.172772, -1.03482, 0.9098039, 1, 0, 1,
-0.936544, -1.204216, -2.155493, 0.9019608, 1, 0, 1,
-0.9291451, -0.3111411, -1.234901, 0.8941177, 1, 0, 1,
-0.9141272, -0.9692377, -4.133569, 0.8901961, 1, 0, 1,
-0.9140715, -1.307569, -3.898769, 0.8823529, 1, 0, 1,
-0.9075834, 0.8477754, 0.4206854, 0.8784314, 1, 0, 1,
-0.9012574, 0.6389408, -1.332017, 0.8705882, 1, 0, 1,
-0.8907848, 0.7307466, -2.502661, 0.8666667, 1, 0, 1,
-0.8906447, 2.05336, -0.696614, 0.8588235, 1, 0, 1,
-0.8857935, -1.734779, -2.253526, 0.854902, 1, 0, 1,
-0.8854167, -1.052273, -2.826138, 0.8470588, 1, 0, 1,
-0.8837196, -0.1771327, -1.622792, 0.8431373, 1, 0, 1,
-0.8745899, -0.7979214, -4.270243, 0.8352941, 1, 0, 1,
-0.8659817, 1.819683, 1.157859, 0.8313726, 1, 0, 1,
-0.8653707, -2.572987, 0.4910396, 0.8235294, 1, 0, 1,
-0.8592842, -0.1050524, -0.6588889, 0.8196079, 1, 0, 1,
-0.8499749, 1.590006, -1.247278, 0.8117647, 1, 0, 1,
-0.8394114, 2.016489, -0.2198185, 0.8078431, 1, 0, 1,
-0.8373175, -1.281654, -1.450965, 0.8, 1, 0, 1,
-0.8362443, 1.331935, -1.183085, 0.7921569, 1, 0, 1,
-0.8335497, 0.3033183, -0.683961, 0.7882353, 1, 0, 1,
-0.8319228, 0.1282473, -0.9428365, 0.7803922, 1, 0, 1,
-0.830129, -1.535314, -0.473184, 0.7764706, 1, 0, 1,
-0.8293397, 1.228657, -2.072075, 0.7686275, 1, 0, 1,
-0.8282152, -0.4227534, -1.087897, 0.7647059, 1, 0, 1,
-0.822763, 0.1224763, -2.014166, 0.7568628, 1, 0, 1,
-0.818671, 0.8311356, 0.5180345, 0.7529412, 1, 0, 1,
-0.8174873, -0.4079869, -1.710044, 0.7450981, 1, 0, 1,
-0.8160087, 1.168667, -1.419435, 0.7411765, 1, 0, 1,
-0.8097661, 0.4378281, -2.476917, 0.7333333, 1, 0, 1,
-0.8075659, -0.971251, -2.840124, 0.7294118, 1, 0, 1,
-0.8064292, -0.6869437, -2.023077, 0.7215686, 1, 0, 1,
-0.8048164, 0.4935339, -0.6133543, 0.7176471, 1, 0, 1,
-0.8022548, -0.3417115, -1.418344, 0.7098039, 1, 0, 1,
-0.8017211, -1.409041, -0.8140388, 0.7058824, 1, 0, 1,
-0.8004767, 0.5200936, -1.792845, 0.6980392, 1, 0, 1,
-0.790242, 1.627179, -1.830064, 0.6901961, 1, 0, 1,
-0.7894158, -0.0671843, -0.7750844, 0.6862745, 1, 0, 1,
-0.7890062, -1.031932, -4.912199, 0.6784314, 1, 0, 1,
-0.7855673, 0.1520702, -0.2972387, 0.6745098, 1, 0, 1,
-0.7822098, 0.5039452, -0.966378, 0.6666667, 1, 0, 1,
-0.7798423, -0.2312112, -0.5881059, 0.6627451, 1, 0, 1,
-0.7766681, 0.784597, 0.4881419, 0.654902, 1, 0, 1,
-0.7765539, -2.101723, -2.299326, 0.6509804, 1, 0, 1,
-0.7699289, 1.764284, -0.9448963, 0.6431373, 1, 0, 1,
-0.7694162, -0.6381739, -0.964012, 0.6392157, 1, 0, 1,
-0.7693437, -1.978718, -2.585703, 0.6313726, 1, 0, 1,
-0.7675152, -1.468904, -2.706826, 0.627451, 1, 0, 1,
-0.7633986, 1.023582, -1.776608, 0.6196079, 1, 0, 1,
-0.7606594, 0.2993429, -0.8106779, 0.6156863, 1, 0, 1,
-0.7601119, -0.5964293, -2.212805, 0.6078432, 1, 0, 1,
-0.7543811, -0.6725909, -3.837047, 0.6039216, 1, 0, 1,
-0.7484607, -0.1434585, -1.251096, 0.5960785, 1, 0, 1,
-0.7459428, -1.310598, -1.672805, 0.5882353, 1, 0, 1,
-0.7393407, -1.058317, -2.668244, 0.5843138, 1, 0, 1,
-0.722966, 0.7759872, -0.2506634, 0.5764706, 1, 0, 1,
-0.7190778, -0.4819608, -3.259258, 0.572549, 1, 0, 1,
-0.7178565, -0.7049353, -2.333447, 0.5647059, 1, 0, 1,
-0.7140883, -1.109541, -2.891131, 0.5607843, 1, 0, 1,
-0.7127818, 1.345473, -0.5550767, 0.5529412, 1, 0, 1,
-0.7093036, -1.552681, -3.048073, 0.5490196, 1, 0, 1,
-0.7080538, -0.7759519, -3.166143, 0.5411765, 1, 0, 1,
-0.7067959, -0.4414176, -2.270294, 0.5372549, 1, 0, 1,
-0.6990883, -0.01917069, -2.486023, 0.5294118, 1, 0, 1,
-0.6978444, -1.937322, -2.304943, 0.5254902, 1, 0, 1,
-0.6971419, 0.6526283, -0.2951068, 0.5176471, 1, 0, 1,
-0.6969573, 0.2381252, -0.09917562, 0.5137255, 1, 0, 1,
-0.6961269, 0.2210065, -1.745672, 0.5058824, 1, 0, 1,
-0.6931775, -0.2207664, -1.597818, 0.5019608, 1, 0, 1,
-0.6920601, -1.72633, -1.063295, 0.4941176, 1, 0, 1,
-0.6848248, 1.48836, -0.3747024, 0.4862745, 1, 0, 1,
-0.6840133, -1.116554, -2.529522, 0.4823529, 1, 0, 1,
-0.6827407, -0.1941553, -1.962648, 0.4745098, 1, 0, 1,
-0.6792012, 0.9681863, 0.4993022, 0.4705882, 1, 0, 1,
-0.6780047, 1.809991, -1.958617, 0.4627451, 1, 0, 1,
-0.6765313, -0.1575038, -2.003419, 0.4588235, 1, 0, 1,
-0.6731931, -0.8385736, -1.177436, 0.4509804, 1, 0, 1,
-0.6726915, -0.1339215, -1.527179, 0.4470588, 1, 0, 1,
-0.6724535, 0.6704388, -1.439695, 0.4392157, 1, 0, 1,
-0.6715796, -1.103309, -4.024104, 0.4352941, 1, 0, 1,
-0.6701424, -0.8705925, -5.184186, 0.427451, 1, 0, 1,
-0.6691777, -1.329035, -4.124353, 0.4235294, 1, 0, 1,
-0.6658607, 0.3442903, -1.326053, 0.4156863, 1, 0, 1,
-0.6634896, -0.1277453, -1.43656, 0.4117647, 1, 0, 1,
-0.6623852, -0.5333798, -3.97942, 0.4039216, 1, 0, 1,
-0.6618193, 0.1745823, -1.623131, 0.3960784, 1, 0, 1,
-0.6575354, 0.3718891, -3.407142, 0.3921569, 1, 0, 1,
-0.6550553, 0.2723596, -2.709984, 0.3843137, 1, 0, 1,
-0.6542543, 0.4437099, -1.752834, 0.3803922, 1, 0, 1,
-0.6497372, 0.7650553, -0.4691251, 0.372549, 1, 0, 1,
-0.649143, 1.902949, -0.552489, 0.3686275, 1, 0, 1,
-0.6491079, 1.706107, 0.6232011, 0.3607843, 1, 0, 1,
-0.649014, -0.03278535, -1.212462, 0.3568628, 1, 0, 1,
-0.6440248, -2.552037, -3.383958, 0.3490196, 1, 0, 1,
-0.6433886, -0.5277696, -1.679783, 0.345098, 1, 0, 1,
-0.643223, 1.081949, 1.302568, 0.3372549, 1, 0, 1,
-0.6411021, 0.8990058, -1.364968, 0.3333333, 1, 0, 1,
-0.6407504, 1.50681, -1.464667, 0.3254902, 1, 0, 1,
-0.6385027, -0.8388616, -3.47982, 0.3215686, 1, 0, 1,
-0.6358406, -0.2563748, -1.297767, 0.3137255, 1, 0, 1,
-0.6314095, -0.5231092, -1.051636, 0.3098039, 1, 0, 1,
-0.6294039, 1.472481, -0.5911286, 0.3019608, 1, 0, 1,
-0.6277056, -0.02704972, -1.116454, 0.2941177, 1, 0, 1,
-0.6276106, 0.1992136, -0.1791461, 0.2901961, 1, 0, 1,
-0.6254011, 0.651341, 0.8450567, 0.282353, 1, 0, 1,
-0.6249965, 0.485852, 0.4490992, 0.2784314, 1, 0, 1,
-0.6167007, -1.562936, -1.287361, 0.2705882, 1, 0, 1,
-0.616446, -0.183878, -2.721632, 0.2666667, 1, 0, 1,
-0.6122564, -0.03863516, -0.194337, 0.2588235, 1, 0, 1,
-0.6088935, 0.8661885, 1.137337, 0.254902, 1, 0, 1,
-0.6083806, -1.06585, -3.555596, 0.2470588, 1, 0, 1,
-0.6078234, -1.148286, -2.709233, 0.2431373, 1, 0, 1,
-0.6038275, 0.05290568, -2.571097, 0.2352941, 1, 0, 1,
-0.6018156, 0.1711313, -1.515699, 0.2313726, 1, 0, 1,
-0.5997083, 0.2747357, 0.2331826, 0.2235294, 1, 0, 1,
-0.5994838, -0.7796209, -2.255115, 0.2196078, 1, 0, 1,
-0.5920414, -0.5025207, -3.009336, 0.2117647, 1, 0, 1,
-0.5896692, -1.572281, -4.029876, 0.2078431, 1, 0, 1,
-0.5798231, 0.1737885, -1.138074, 0.2, 1, 0, 1,
-0.5781767, 0.6810018, -2.946153, 0.1921569, 1, 0, 1,
-0.5779871, 0.8123857, -1.797512, 0.1882353, 1, 0, 1,
-0.5771684, 1.024012, -0.02203508, 0.1803922, 1, 0, 1,
-0.5725331, -0.4427648, -2.423139, 0.1764706, 1, 0, 1,
-0.5690324, 2.917658, -1.495399, 0.1686275, 1, 0, 1,
-0.5666386, -1.539467, -0.5481842, 0.1647059, 1, 0, 1,
-0.566247, 0.2585519, -1.288071, 0.1568628, 1, 0, 1,
-0.5541648, -0.4844414, -0.5438271, 0.1529412, 1, 0, 1,
-0.551129, 0.4235046, -0.5144874, 0.145098, 1, 0, 1,
-0.5493138, -1.434669, -3.351981, 0.1411765, 1, 0, 1,
-0.5483534, 0.1913662, -3.073092, 0.1333333, 1, 0, 1,
-0.5472936, -1.045817, -2.091269, 0.1294118, 1, 0, 1,
-0.5410057, 1.515396, -0.5637015, 0.1215686, 1, 0, 1,
-0.5395646, 0.8297206, 0.3542695, 0.1176471, 1, 0, 1,
-0.5387974, 0.5146877, -0.7587153, 0.1098039, 1, 0, 1,
-0.537941, 0.0645988, -1.921473, 0.1058824, 1, 0, 1,
-0.5357398, -1.837429, -2.287035, 0.09803922, 1, 0, 1,
-0.5341206, 0.3196559, -1.457788, 0.09019608, 1, 0, 1,
-0.5302235, 0.6796481, 0.614498, 0.08627451, 1, 0, 1,
-0.5283571, 0.5083058, -1.96202, 0.07843138, 1, 0, 1,
-0.5277861, -0.748959, -3.69681, 0.07450981, 1, 0, 1,
-0.5200713, -0.3415264, -1.202314, 0.06666667, 1, 0, 1,
-0.518829, -2.635522, -1.979854, 0.0627451, 1, 0, 1,
-0.5144275, 1.40371, -0.6665098, 0.05490196, 1, 0, 1,
-0.5136759, 1.151807, -2.829665, 0.05098039, 1, 0, 1,
-0.5134966, 0.3613294, -1.92986, 0.04313726, 1, 0, 1,
-0.5090174, -0.2178365, 0.4720792, 0.03921569, 1, 0, 1,
-0.5035635, -0.03060013, -0.3861313, 0.03137255, 1, 0, 1,
-0.4979255, 1.205113, 0.3328361, 0.02745098, 1, 0, 1,
-0.4961869, -0.906216, -1.311033, 0.01960784, 1, 0, 1,
-0.4939934, 0.2179316, -1.307114, 0.01568628, 1, 0, 1,
-0.4909755, -0.5994746, -2.671159, 0.007843138, 1, 0, 1,
-0.4892181, -0.5627556, -0.4157949, 0.003921569, 1, 0, 1,
-0.4868261, 0.5842254, -0.169691, 0, 1, 0.003921569, 1,
-0.4833995, 1.65027, -0.739136, 0, 1, 0.01176471, 1,
-0.4833332, 0.8011242, 0.5541579, 0, 1, 0.01568628, 1,
-0.4811354, -0.003180961, -1.43175, 0, 1, 0.02352941, 1,
-0.4701135, -2.085847, -1.227519, 0, 1, 0.02745098, 1,
-0.469773, -0.2206305, -2.045407, 0, 1, 0.03529412, 1,
-0.4685907, -0.5204912, -3.151392, 0, 1, 0.03921569, 1,
-0.4659421, -2.177461, -3.738031, 0, 1, 0.04705882, 1,
-0.4631473, 0.2854085, -1.873333, 0, 1, 0.05098039, 1,
-0.463059, 0.4461717, -1.488632, 0, 1, 0.05882353, 1,
-0.4628505, 1.099282, -0.4756368, 0, 1, 0.0627451, 1,
-0.455064, 1.413889, -0.1113212, 0, 1, 0.07058824, 1,
-0.4483508, -0.4723593, -3.043038, 0, 1, 0.07450981, 1,
-0.4440426, 0.0006922238, -1.179741, 0, 1, 0.08235294, 1,
-0.4431126, -1.449822, -2.323553, 0, 1, 0.08627451, 1,
-0.4430081, 0.3382052, -1.356323, 0, 1, 0.09411765, 1,
-0.4412476, 0.08671717, -2.805786, 0, 1, 0.1019608, 1,
-0.4380746, -0.4706737, -3.364466, 0, 1, 0.1058824, 1,
-0.434307, 0.08971751, -1.503795, 0, 1, 0.1137255, 1,
-0.4340757, 0.664414, -1.440974, 0, 1, 0.1176471, 1,
-0.4332405, -0.825209, -2.135548, 0, 1, 0.1254902, 1,
-0.4259138, 1.032458, -0.3433957, 0, 1, 0.1294118, 1,
-0.4220308, 0.02021028, -2.145183, 0, 1, 0.1372549, 1,
-0.4213847, -0.02639419, -1.723902, 0, 1, 0.1411765, 1,
-0.4177707, 0.2670078, -2.719719, 0, 1, 0.1490196, 1,
-0.41766, -0.3450986, -2.625989, 0, 1, 0.1529412, 1,
-0.4151668, -0.9727647, -3.167252, 0, 1, 0.1607843, 1,
-0.4103978, 0.183908, -0.8066813, 0, 1, 0.1647059, 1,
-0.4089017, -0.8048156, -2.918736, 0, 1, 0.172549, 1,
-0.4078222, -1.15094, -4.062686, 0, 1, 0.1764706, 1,
-0.4051718, 0.006468199, -1.931503, 0, 1, 0.1843137, 1,
-0.3966965, 0.3090219, -2.032947, 0, 1, 0.1882353, 1,
-0.3900769, -0.4946255, -1.64296, 0, 1, 0.1960784, 1,
-0.3891786, -0.1469445, -2.316288, 0, 1, 0.2039216, 1,
-0.3881121, -0.2660822, -2.80493, 0, 1, 0.2078431, 1,
-0.387642, 0.7870234, -1.514214, 0, 1, 0.2156863, 1,
-0.3830769, -0.1416194, -1.375896, 0, 1, 0.2196078, 1,
-0.3805933, 0.6566313, -0.914282, 0, 1, 0.227451, 1,
-0.3780223, 0.06250518, -0.9316738, 0, 1, 0.2313726, 1,
-0.3769155, -0.7953857, -4.170795, 0, 1, 0.2392157, 1,
-0.3750575, -0.8331476, -2.36857, 0, 1, 0.2431373, 1,
-0.3731144, -1.36133, -2.442533, 0, 1, 0.2509804, 1,
-0.3690784, -1.610774, -2.185554, 0, 1, 0.254902, 1,
-0.3534362, -0.3771344, -1.775845, 0, 1, 0.2627451, 1,
-0.3424839, -0.4237619, -3.292483, 0, 1, 0.2666667, 1,
-0.3410892, 0.4105636, -0.659507, 0, 1, 0.2745098, 1,
-0.3369103, 1.253144, -0.7988626, 0, 1, 0.2784314, 1,
-0.3358915, -0.6566406, -0.2449094, 0, 1, 0.2862745, 1,
-0.3346995, 0.4012431, 0.1214777, 0, 1, 0.2901961, 1,
-0.3313854, -1.205926, -3.12906, 0, 1, 0.2980392, 1,
-0.3311522, -0.9496561, -3.499815, 0, 1, 0.3058824, 1,
-0.3280741, -1.339294, -1.086205, 0, 1, 0.3098039, 1,
-0.3279782, 0.00999765, -3.196616, 0, 1, 0.3176471, 1,
-0.3261076, -1.307501, -3.337201, 0, 1, 0.3215686, 1,
-0.3256621, 0.3788098, -0.8625822, 0, 1, 0.3294118, 1,
-0.325563, -0.004063056, -2.190819, 0, 1, 0.3333333, 1,
-0.3134496, -0.2896177, -2.896624, 0, 1, 0.3411765, 1,
-0.3029694, -0.7216862, -2.269297, 0, 1, 0.345098, 1,
-0.3019487, -0.4926955, -2.615152, 0, 1, 0.3529412, 1,
-0.2988948, 0.4804589, -0.9223054, 0, 1, 0.3568628, 1,
-0.2987473, -0.1624656, -2.253154, 0, 1, 0.3647059, 1,
-0.296227, -0.003228886, -2.668023, 0, 1, 0.3686275, 1,
-0.2944691, -0.6853859, 0.3106669, 0, 1, 0.3764706, 1,
-0.2917329, -0.462519, -4.030493, 0, 1, 0.3803922, 1,
-0.2914254, 0.6443757, 0.170505, 0, 1, 0.3882353, 1,
-0.2908807, -0.205977, -1.297208, 0, 1, 0.3921569, 1,
-0.2896902, -0.1083694, -2.183279, 0, 1, 0.4, 1,
-0.2889133, 0.4288559, -0.6474527, 0, 1, 0.4078431, 1,
-0.288906, -0.4355007, -2.809988, 0, 1, 0.4117647, 1,
-0.2868688, 0.1215033, -1.886798, 0, 1, 0.4196078, 1,
-0.285035, 0.8542953, -0.8548503, 0, 1, 0.4235294, 1,
-0.2779422, -0.7658555, -4.622244, 0, 1, 0.4313726, 1,
-0.2728061, 0.5613673, -1.842025, 0, 1, 0.4352941, 1,
-0.2685135, 0.3028594, -0.2935721, 0, 1, 0.4431373, 1,
-0.2683676, -0.8206762, -3.931453, 0, 1, 0.4470588, 1,
-0.2659181, 0.6953789, 0.3467773, 0, 1, 0.454902, 1,
-0.2643239, 0.4581158, 1.797992, 0, 1, 0.4588235, 1,
-0.2640647, -0.07095802, -2.528442, 0, 1, 0.4666667, 1,
-0.2588193, -1.966671, -1.976128, 0, 1, 0.4705882, 1,
-0.2532172, 0.8548739, -1.408012, 0, 1, 0.4784314, 1,
-0.2514974, 1.232625, -1.074034, 0, 1, 0.4823529, 1,
-0.250879, 0.5398896, 0.3011256, 0, 1, 0.4901961, 1,
-0.2466492, -0.1144609, -3.242759, 0, 1, 0.4941176, 1,
-0.2401525, -0.3708736, -1.208033, 0, 1, 0.5019608, 1,
-0.2388091, -0.09914236, -1.353058, 0, 1, 0.509804, 1,
-0.2387665, -0.9951055, -2.510588, 0, 1, 0.5137255, 1,
-0.235834, -1.7404, -2.936007, 0, 1, 0.5215687, 1,
-0.2329499, -1.354686, -2.583241, 0, 1, 0.5254902, 1,
-0.2320466, 0.3576581, -0.08620151, 0, 1, 0.5333334, 1,
-0.2243458, 0.8587357, 0.6834402, 0, 1, 0.5372549, 1,
-0.2213092, 0.4383428, -0.8551115, 0, 1, 0.5450981, 1,
-0.2205821, -0.1171342, -1.717246, 0, 1, 0.5490196, 1,
-0.2187214, 0.5342022, -0.4246557, 0, 1, 0.5568628, 1,
-0.2122103, 0.3202535, -2.287463, 0, 1, 0.5607843, 1,
-0.2108921, 1.508756, -0.6519913, 0, 1, 0.5686275, 1,
-0.2085625, 1.842807, 0.1572326, 0, 1, 0.572549, 1,
-0.2076211, -0.3940632, -0.9081003, 0, 1, 0.5803922, 1,
-0.2042694, -0.9620878, -2.175281, 0, 1, 0.5843138, 1,
-0.203366, 2.171857, -0.6783803, 0, 1, 0.5921569, 1,
-0.2010313, 1.061405, -1.869673, 0, 1, 0.5960785, 1,
-0.1956258, 1.640835, 0.02410682, 0, 1, 0.6039216, 1,
-0.1928767, 0.3016421, -0.399642, 0, 1, 0.6117647, 1,
-0.1927016, 0.4627931, 0.1623283, 0, 1, 0.6156863, 1,
-0.1917364, -1.737605, -4.682203, 0, 1, 0.6235294, 1,
-0.1906887, 1.952461, -0.482452, 0, 1, 0.627451, 1,
-0.1861427, 0.5461234, -1.645645, 0, 1, 0.6352941, 1,
-0.1802642, 1.387796, -1.05456, 0, 1, 0.6392157, 1,
-0.1797417, 0.7865971, -0.9572724, 0, 1, 0.6470588, 1,
-0.1790242, 0.1638728, -2.442422, 0, 1, 0.6509804, 1,
-0.1767084, -1.383879, -6.199562, 0, 1, 0.6588235, 1,
-0.1746838, -0.3237595, -2.973817, 0, 1, 0.6627451, 1,
-0.169629, 0.8833714, 1.411629, 0, 1, 0.6705883, 1,
-0.169165, 0.6154069, -1.088807, 0, 1, 0.6745098, 1,
-0.1643663, 2.634964, -0.004057764, 0, 1, 0.682353, 1,
-0.1617296, -0.2239042, -3.553577, 0, 1, 0.6862745, 1,
-0.1597967, -1.121554, -3.484177, 0, 1, 0.6941177, 1,
-0.1591129, -0.4473448, -1.977947, 0, 1, 0.7019608, 1,
-0.1590711, -2.456175, -1.592945, 0, 1, 0.7058824, 1,
-0.1539844, -0.5626964, -1.956876, 0, 1, 0.7137255, 1,
-0.1539621, -1.548207, -2.72675, 0, 1, 0.7176471, 1,
-0.1507506, -0.3597845, -0.41962, 0, 1, 0.7254902, 1,
-0.1490888, 2.170318, -0.1138759, 0, 1, 0.7294118, 1,
-0.1469881, 0.6222054, -0.7866039, 0, 1, 0.7372549, 1,
-0.1429875, -0.07256263, -2.892514, 0, 1, 0.7411765, 1,
-0.1407059, -0.4416316, -1.704546, 0, 1, 0.7490196, 1,
-0.1379636, 0.2944842, -0.3935514, 0, 1, 0.7529412, 1,
-0.1365434, -1.667295, -3.368304, 0, 1, 0.7607843, 1,
-0.1360822, -0.1106995, -2.226228, 0, 1, 0.7647059, 1,
-0.1347594, 0.3363349, 0.1462887, 0, 1, 0.772549, 1,
-0.1327599, 0.9480177, -0.9490775, 0, 1, 0.7764706, 1,
-0.1292698, 1.536448, 1.285619, 0, 1, 0.7843137, 1,
-0.1291358, -0.121857, -2.244509, 0, 1, 0.7882353, 1,
-0.1264056, 0.7636392, 0.5347242, 0, 1, 0.7960784, 1,
-0.1254284, -0.8771609, -3.290596, 0, 1, 0.8039216, 1,
-0.1222145, -0.4541997, -4.118339, 0, 1, 0.8078431, 1,
-0.1190616, 1.840679, -0.05280085, 0, 1, 0.8156863, 1,
-0.1183666, -0.1748549, -3.803417, 0, 1, 0.8196079, 1,
-0.1133751, 0.02140174, -1.602569, 0, 1, 0.827451, 1,
-0.1107948, 0.2963155, -1.511651, 0, 1, 0.8313726, 1,
-0.1088883, 1.332019, 0.5717869, 0, 1, 0.8392157, 1,
-0.1084102, 0.2242615, -0.5224353, 0, 1, 0.8431373, 1,
-0.1071206, 1.003208, -0.2874371, 0, 1, 0.8509804, 1,
-0.1041849, 1.269415, 0.6768741, 0, 1, 0.854902, 1,
-0.1017888, 0.189688, 1.14193, 0, 1, 0.8627451, 1,
-0.09908119, 1.527626, 0.8432277, 0, 1, 0.8666667, 1,
-0.09903787, -1.719006, -1.046948, 0, 1, 0.8745098, 1,
-0.09722359, -0.7156669, -3.019702, 0, 1, 0.8784314, 1,
-0.09698282, 0.8177958, -0.6185184, 0, 1, 0.8862745, 1,
-0.09629497, -0.4101344, -1.668178, 0, 1, 0.8901961, 1,
-0.09570982, 0.6083808, -1.125972, 0, 1, 0.8980392, 1,
-0.09470651, 1.204483, -0.1708459, 0, 1, 0.9058824, 1,
-0.09330815, 0.2287003, -0.9033929, 0, 1, 0.9098039, 1,
-0.09293418, -0.6767744, -3.007432, 0, 1, 0.9176471, 1,
-0.09237615, 2.976114, -0.8848121, 0, 1, 0.9215686, 1,
-0.09052907, 0.009147963, -1.463113, 0, 1, 0.9294118, 1,
-0.08743262, -0.9556996, -3.806868, 0, 1, 0.9333333, 1,
-0.0871238, -0.258801, -2.383544, 0, 1, 0.9411765, 1,
-0.08284485, 0.3022257, -1.42157, 0, 1, 0.945098, 1,
-0.08163133, 0.6730914, 1.081368, 0, 1, 0.9529412, 1,
-0.07985588, -1.47327, -4.954751, 0, 1, 0.9568627, 1,
-0.07851604, 0.01161926, -1.590287, 0, 1, 0.9647059, 1,
-0.07809598, -1.238926, -2.089309, 0, 1, 0.9686275, 1,
-0.07631153, -0.7294894, -3.936362, 0, 1, 0.9764706, 1,
-0.07510327, 0.6679931, 2.943203, 0, 1, 0.9803922, 1,
-0.07421239, 0.9268705, -0.3364136, 0, 1, 0.9882353, 1,
-0.07341755, -0.01916737, -2.018032, 0, 1, 0.9921569, 1,
-0.06978651, -0.6545455, -2.947086, 0, 1, 1, 1,
-0.06936184, 0.7615187, 0.4353368, 0, 0.9921569, 1, 1,
-0.06815896, 0.735414, 0.765887, 0, 0.9882353, 1, 1,
-0.06562266, -1.093074, -3.209088, 0, 0.9803922, 1, 1,
-0.06323319, 0.3896601, 1.081255, 0, 0.9764706, 1, 1,
-0.06255522, -1.560006, -3.114418, 0, 0.9686275, 1, 1,
-0.05019119, -0.114256, -2.761764, 0, 0.9647059, 1, 1,
-0.04650435, 0.2123784, 0.1127467, 0, 0.9568627, 1, 1,
-0.04241, 0.6246945, -1.31163, 0, 0.9529412, 1, 1,
-0.04146662, -0.4553629, -2.096412, 0, 0.945098, 1, 1,
-0.0406577, 1.169609, 0.02872289, 0, 0.9411765, 1, 1,
-0.04050154, 0.3813493, 0.6868488, 0, 0.9333333, 1, 1,
-0.03888058, -0.04971831, -1.013587, 0, 0.9294118, 1, 1,
-0.03147756, 0.1077011, -0.8068318, 0, 0.9215686, 1, 1,
-0.03035532, 0.4655653, 0.004433641, 0, 0.9176471, 1, 1,
-0.02174802, -1.232705, -2.241418, 0, 0.9098039, 1, 1,
-0.01718706, -0.3693973, -1.840995, 0, 0.9058824, 1, 1,
-0.01156192, 0.4212643, 0.8058144, 0, 0.8980392, 1, 1,
-0.009345687, -0.3331282, -2.266241, 0, 0.8901961, 1, 1,
-0.007621495, 1.553576, -0.1925094, 0, 0.8862745, 1, 1,
-0.005349047, 1.201445, -1.740709, 0, 0.8784314, 1, 1,
-0.005231385, 0.3351146, 1.603139, 0, 0.8745098, 1, 1,
-0.00218823, 0.6142245, -1.577718, 0, 0.8666667, 1, 1,
-0.0002671067, 3.433019, -1.215346, 0, 0.8627451, 1, 1,
0.001642035, 0.389922, -0.4511623, 0, 0.854902, 1, 1,
0.01239611, 0.06881889, -0.9581404, 0, 0.8509804, 1, 1,
0.0150658, 0.03994075, 0.2515663, 0, 0.8431373, 1, 1,
0.01651184, -0.9515582, 3.062967, 0, 0.8392157, 1, 1,
0.01920078, 1.08095, -1.252158, 0, 0.8313726, 1, 1,
0.01979964, -0.4352023, 3.302895, 0, 0.827451, 1, 1,
0.02212992, 0.517267, 0.3541114, 0, 0.8196079, 1, 1,
0.02541657, -0.59254, 1.444003, 0, 0.8156863, 1, 1,
0.02881576, 0.4292368, 0.4672199, 0, 0.8078431, 1, 1,
0.0317504, -0.2644657, 3.215514, 0, 0.8039216, 1, 1,
0.03221812, 0.5968297, 1.41908, 0, 0.7960784, 1, 1,
0.03999718, 1.236134, 0.3957293, 0, 0.7882353, 1, 1,
0.04657551, 0.6138642, 0.4936033, 0, 0.7843137, 1, 1,
0.05404276, 0.788559, -1.870433, 0, 0.7764706, 1, 1,
0.05550491, -0.2901476, 2.420002, 0, 0.772549, 1, 1,
0.0567932, 0.4182206, 0.04311559, 0, 0.7647059, 1, 1,
0.05734602, -0.5224378, 4.238218, 0, 0.7607843, 1, 1,
0.05821754, 0.1114324, -0.1555734, 0, 0.7529412, 1, 1,
0.05898602, -0.1154344, 0.953417, 0, 0.7490196, 1, 1,
0.06249465, 0.3510903, 0.01903386, 0, 0.7411765, 1, 1,
0.0636211, 1.879258, -0.8319407, 0, 0.7372549, 1, 1,
0.06528247, -0.01707118, 1.946347, 0, 0.7294118, 1, 1,
0.06778503, 1.217674, -0.3448334, 0, 0.7254902, 1, 1,
0.07037297, 1.54263, 1.980542, 0, 0.7176471, 1, 1,
0.07208348, 0.3009736, 0.1022503, 0, 0.7137255, 1, 1,
0.07453179, -0.3487627, 1.30667, 0, 0.7058824, 1, 1,
0.07477392, -2.362053, 2.18928, 0, 0.6980392, 1, 1,
0.08093247, 0.6427414, -2.705004, 0, 0.6941177, 1, 1,
0.08787484, -0.1181775, 1.519051, 0, 0.6862745, 1, 1,
0.09026025, 0.505215, -0.3075072, 0, 0.682353, 1, 1,
0.09035365, -0.03573717, 1.553274, 0, 0.6745098, 1, 1,
0.09088731, -1.110253, 2.668236, 0, 0.6705883, 1, 1,
0.09192416, -0.5741395, 3.567948, 0, 0.6627451, 1, 1,
0.09392712, 0.1249684, -0.8681256, 0, 0.6588235, 1, 1,
0.09875226, 0.3677471, 1.382954, 0, 0.6509804, 1, 1,
0.1017291, -0.1810879, 2.338175, 0, 0.6470588, 1, 1,
0.109104, -0.7516578, 3.276902, 0, 0.6392157, 1, 1,
0.1099257, -0.2759236, 2.242655, 0, 0.6352941, 1, 1,
0.1127995, -0.006973554, 1.923207, 0, 0.627451, 1, 1,
0.1182316, -1.32386, 2.913193, 0, 0.6235294, 1, 1,
0.1195653, 2.159471, 0.6012997, 0, 0.6156863, 1, 1,
0.1207642, -0.84053, 4.217917, 0, 0.6117647, 1, 1,
0.1219895, -0.1968583, 1.854936, 0, 0.6039216, 1, 1,
0.1225842, 0.2077113, 1.272167, 0, 0.5960785, 1, 1,
0.1229024, -0.9699339, 1.003811, 0, 0.5921569, 1, 1,
0.1236782, 0.2753683, 0.1273626, 0, 0.5843138, 1, 1,
0.1245931, 0.8583488, -0.4402325, 0, 0.5803922, 1, 1,
0.12559, 1.313997, -0.006551981, 0, 0.572549, 1, 1,
0.1262242, -1.842637, 4.128172, 0, 0.5686275, 1, 1,
0.1286171, -0.002089047, -0.6010804, 0, 0.5607843, 1, 1,
0.1310221, -0.3767175, 1.346941, 0, 0.5568628, 1, 1,
0.1351787, -0.7324183, 4.872357, 0, 0.5490196, 1, 1,
0.1387359, -0.4189707, 2.960486, 0, 0.5450981, 1, 1,
0.1397534, 0.3131577, -1.15037, 0, 0.5372549, 1, 1,
0.1401233, 0.3482913, 1.462676, 0, 0.5333334, 1, 1,
0.1414788, 0.7303122, -1.29643, 0, 0.5254902, 1, 1,
0.1447221, 1.362089, 0.4414528, 0, 0.5215687, 1, 1,
0.1453019, -0.9919261, 1.26155, 0, 0.5137255, 1, 1,
0.1456536, -1.807451, 1.537087, 0, 0.509804, 1, 1,
0.1472744, -0.190156, 3.170432, 0, 0.5019608, 1, 1,
0.1503704, -1.32902, 1.984715, 0, 0.4941176, 1, 1,
0.1519662, -1.264757, 3.290341, 0, 0.4901961, 1, 1,
0.1535189, 0.3465157, 0.6961738, 0, 0.4823529, 1, 1,
0.1536406, 0.2904749, 3.058396, 0, 0.4784314, 1, 1,
0.1546626, 1.045997, 0.3930137, 0, 0.4705882, 1, 1,
0.160837, -0.2566106, 1.581678, 0, 0.4666667, 1, 1,
0.1667784, -0.1600968, 2.641801, 0, 0.4588235, 1, 1,
0.1697077, 0.2053047, 0.4850391, 0, 0.454902, 1, 1,
0.1724316, 0.9175035, 0.3669503, 0, 0.4470588, 1, 1,
0.1767869, 1.315911, -2.647845, 0, 0.4431373, 1, 1,
0.1770213, 0.9667677, -1.227142, 0, 0.4352941, 1, 1,
0.1830589, 2.247638, 1.287387, 0, 0.4313726, 1, 1,
0.1849461, -0.01112071, 0.8629856, 0, 0.4235294, 1, 1,
0.1850019, -0.3919812, 3.143325, 0, 0.4196078, 1, 1,
0.185179, 0.4715534, 1.235265, 0, 0.4117647, 1, 1,
0.1862653, -0.8058772, 2.627771, 0, 0.4078431, 1, 1,
0.1876535, -0.09732269, 2.445151, 0, 0.4, 1, 1,
0.1906984, -0.3587159, 1.410196, 0, 0.3921569, 1, 1,
0.1952552, 1.481691, 0.1171121, 0, 0.3882353, 1, 1,
0.1968577, 0.1554973, 1.909354, 0, 0.3803922, 1, 1,
0.198869, -0.2120423, 0.7620208, 0, 0.3764706, 1, 1,
0.2003144, -0.9694231, 2.869551, 0, 0.3686275, 1, 1,
0.2038727, 0.3432693, -1.070406, 0, 0.3647059, 1, 1,
0.2083108, 0.7754523, 0.5593811, 0, 0.3568628, 1, 1,
0.2158666, 0.9041808, 0.5046796, 0, 0.3529412, 1, 1,
0.2202637, -1.718054, 3.513556, 0, 0.345098, 1, 1,
0.2223843, -0.5207563, 3.7304, 0, 0.3411765, 1, 1,
0.2270968, -0.0353003, 1.712755, 0, 0.3333333, 1, 1,
0.2319518, -0.1526207, 1.110086, 0, 0.3294118, 1, 1,
0.2325443, 0.03015095, 1.529811, 0, 0.3215686, 1, 1,
0.2430785, -0.3857928, 3.387558, 0, 0.3176471, 1, 1,
0.2451832, 2.137359, 0.3333646, 0, 0.3098039, 1, 1,
0.2459992, 2.274008, -0.8657252, 0, 0.3058824, 1, 1,
0.2496074, -1.259893, 2.524751, 0, 0.2980392, 1, 1,
0.2520255, -0.9295663, 3.027259, 0, 0.2901961, 1, 1,
0.2527684, 0.3793219, 1.502586, 0, 0.2862745, 1, 1,
0.2538507, 0.9543128, 1.196205, 0, 0.2784314, 1, 1,
0.2573736, -0.5475667, 2.148028, 0, 0.2745098, 1, 1,
0.2582633, 0.4160981, 1.780941, 0, 0.2666667, 1, 1,
0.2658335, -0.3709418, 2.791912, 0, 0.2627451, 1, 1,
0.2678591, -0.6431996, 2.262622, 0, 0.254902, 1, 1,
0.272998, -1.424522, 2.078837, 0, 0.2509804, 1, 1,
0.2814697, 1.217911, 0.4291073, 0, 0.2431373, 1, 1,
0.2815898, 1.096387, -0.7737927, 0, 0.2392157, 1, 1,
0.2831183, -1.251487, 2.636228, 0, 0.2313726, 1, 1,
0.2831864, -1.120765, 2.235253, 0, 0.227451, 1, 1,
0.2842243, -0.9439821, 3.231684, 0, 0.2196078, 1, 1,
0.2843567, -0.2889569, 1.641392, 0, 0.2156863, 1, 1,
0.2888411, 0.4334701, 0.3673404, 0, 0.2078431, 1, 1,
0.2914162, 0.6962085, 0.7705961, 0, 0.2039216, 1, 1,
0.3005215, 1.022783, 1.353299, 0, 0.1960784, 1, 1,
0.3023973, 0.04923308, 2.530717, 0, 0.1882353, 1, 1,
0.3034121, 1.514287, -0.865707, 0, 0.1843137, 1, 1,
0.3059066, 0.1775731, 0.8947603, 0, 0.1764706, 1, 1,
0.3061329, -0.106869, 1.51458, 0, 0.172549, 1, 1,
0.3085552, 0.6162189, 0.7248836, 0, 0.1647059, 1, 1,
0.3087711, 0.7119449, 0.7218741, 0, 0.1607843, 1, 1,
0.3100472, 1.496366, 1.099231, 0, 0.1529412, 1, 1,
0.3118098, 1.458443, 0.3733705, 0, 0.1490196, 1, 1,
0.3173471, 1.260461, 0.5714089, 0, 0.1411765, 1, 1,
0.3182968, 1.466088, 1.049688, 0, 0.1372549, 1, 1,
0.3185156, -1.63738, 1.372641, 0, 0.1294118, 1, 1,
0.3217123, -0.8978511, 1.486451, 0, 0.1254902, 1, 1,
0.3235951, 0.9752487, 0.520636, 0, 0.1176471, 1, 1,
0.3255411, -0.09891002, 3.135731, 0, 0.1137255, 1, 1,
0.3269242, 0.5727091, 1.917889, 0, 0.1058824, 1, 1,
0.3285003, 0.3946422, 0.6752174, 0, 0.09803922, 1, 1,
0.3311304, 0.7109522, 0.8820902, 0, 0.09411765, 1, 1,
0.3341321, -0.1997098, 3.468883, 0, 0.08627451, 1, 1,
0.3344379, 0.2631685, -1.040634, 0, 0.08235294, 1, 1,
0.3364745, 0.3916862, 0.130411, 0, 0.07450981, 1, 1,
0.3454014, -0.5730685, 2.602362, 0, 0.07058824, 1, 1,
0.3549004, -0.9724173, 2.666877, 0, 0.0627451, 1, 1,
0.3563316, -1.051494, 4.015116, 0, 0.05882353, 1, 1,
0.3591956, -0.1987928, 1.004533, 0, 0.05098039, 1, 1,
0.3662107, -0.5966909, 4.524959, 0, 0.04705882, 1, 1,
0.3688548, -0.1052788, 1.538081, 0, 0.03921569, 1, 1,
0.3723873, -0.8643898, 3.221804, 0, 0.03529412, 1, 1,
0.3726687, 0.004040529, 3.080157, 0, 0.02745098, 1, 1,
0.3727232, -2.290317, 2.916188, 0, 0.02352941, 1, 1,
0.3742146, 0.4006462, 1.29179, 0, 0.01568628, 1, 1,
0.3758442, 0.5041791, 1.301049, 0, 0.01176471, 1, 1,
0.3764771, 1.351945, 0.04948813, 0, 0.003921569, 1, 1,
0.3771145, 0.4410307, -0.3668396, 0.003921569, 0, 1, 1,
0.3775702, -1.937347, 2.171261, 0.007843138, 0, 1, 1,
0.3780825, 0.239385, 0.5905187, 0.01568628, 0, 1, 1,
0.3843281, -0.694534, 3.495875, 0.01960784, 0, 1, 1,
0.3857043, 0.2374214, 1.047205, 0.02745098, 0, 1, 1,
0.3872901, 0.5351588, 0.02899351, 0.03137255, 0, 1, 1,
0.3991962, -0.4302566, 2.409132, 0.03921569, 0, 1, 1,
0.4012454, -1.126315, 3.041494, 0.04313726, 0, 1, 1,
0.4034672, 0.4605086, -1.110157, 0.05098039, 0, 1, 1,
0.4055804, 0.8017, -1.151385, 0.05490196, 0, 1, 1,
0.4059407, 0.3890598, 2.262105, 0.0627451, 0, 1, 1,
0.407351, -1.50753, 2.268147, 0.06666667, 0, 1, 1,
0.4106939, -1.189109, 2.967258, 0.07450981, 0, 1, 1,
0.4128042, 2.113711, -0.743144, 0.07843138, 0, 1, 1,
0.4137934, -0.05614266, 1.414198, 0.08627451, 0, 1, 1,
0.4189525, -0.7718692, 4.002624, 0.09019608, 0, 1, 1,
0.4190528, 1.156394, 1.463171, 0.09803922, 0, 1, 1,
0.4194825, -0.3104257, 3.830162, 0.1058824, 0, 1, 1,
0.4239897, 0.2074683, -0.2652655, 0.1098039, 0, 1, 1,
0.4294069, 0.2160042, 1.287367, 0.1176471, 0, 1, 1,
0.4299835, 1.123916, -0.8794002, 0.1215686, 0, 1, 1,
0.432603, 1.189746, 0.5102449, 0.1294118, 0, 1, 1,
0.4346507, -0.7386768, 3.165412, 0.1333333, 0, 1, 1,
0.4347183, -0.3004154, 3.614476, 0.1411765, 0, 1, 1,
0.4350577, 0.9798866, -0.6108408, 0.145098, 0, 1, 1,
0.4385858, 1.093146, -0.03366888, 0.1529412, 0, 1, 1,
0.4413897, -0.6310868, 2.705635, 0.1568628, 0, 1, 1,
0.4418859, -1.175578, 1.772437, 0.1647059, 0, 1, 1,
0.4419065, 0.1967219, 0.2033888, 0.1686275, 0, 1, 1,
0.4434592, 0.355155, -0.8256112, 0.1764706, 0, 1, 1,
0.4438819, -0.6597045, 2.474648, 0.1803922, 0, 1, 1,
0.4452116, 0.4777192, 1.10196, 0.1882353, 0, 1, 1,
0.4466681, -0.6348079, 3.986628, 0.1921569, 0, 1, 1,
0.447657, 1.067111, 1.956362, 0.2, 0, 1, 1,
0.447932, 1.926454, 2.097384, 0.2078431, 0, 1, 1,
0.455062, 1.054475, 0.1223516, 0.2117647, 0, 1, 1,
0.4569239, 2.080942, 0.3715792, 0.2196078, 0, 1, 1,
0.4578937, 0.4126699, 2.210341, 0.2235294, 0, 1, 1,
0.4584464, 1.448606, -0.8278067, 0.2313726, 0, 1, 1,
0.4684319, 1.239988, 1.457491, 0.2352941, 0, 1, 1,
0.4686556, 0.4806635, 1.093415, 0.2431373, 0, 1, 1,
0.4711987, -0.7913206, 2.530172, 0.2470588, 0, 1, 1,
0.4745002, -0.8164592, 4.017057, 0.254902, 0, 1, 1,
0.4784926, 0.2475174, 0.0007553714, 0.2588235, 0, 1, 1,
0.4830669, 0.04270621, 2.121421, 0.2666667, 0, 1, 1,
0.4967614, -0.8704057, 1.503499, 0.2705882, 0, 1, 1,
0.5011796, -0.8456827, 4.423206, 0.2784314, 0, 1, 1,
0.5020176, 0.2629896, 0.9057379, 0.282353, 0, 1, 1,
0.5071845, 1.182433, -0.1537193, 0.2901961, 0, 1, 1,
0.5097345, -1.803978, 3.24548, 0.2941177, 0, 1, 1,
0.5102133, -1.971807, 4.801241, 0.3019608, 0, 1, 1,
0.5108213, -2.414756, 2.211734, 0.3098039, 0, 1, 1,
0.5118536, -0.2073267, 1.062766, 0.3137255, 0, 1, 1,
0.5160968, 2.157479, 0.9409432, 0.3215686, 0, 1, 1,
0.5199418, -0.6513931, 0.3574102, 0.3254902, 0, 1, 1,
0.5202408, 0.8358219, 0.3917046, 0.3333333, 0, 1, 1,
0.523042, -1.705529, 3.294769, 0.3372549, 0, 1, 1,
0.5238665, 1.169573, 1.039137, 0.345098, 0, 1, 1,
0.5274988, 0.1340223, 1.274657, 0.3490196, 0, 1, 1,
0.5278547, 0.7072017, 1.622103, 0.3568628, 0, 1, 1,
0.5291897, -2.001636, 3.530977, 0.3607843, 0, 1, 1,
0.5298059, -1.402988, 1.710243, 0.3686275, 0, 1, 1,
0.530075, -0.3847226, -0.4907281, 0.372549, 0, 1, 1,
0.5334545, -2.013193, 3.04055, 0.3803922, 0, 1, 1,
0.5367408, 1.767359, -0.3302369, 0.3843137, 0, 1, 1,
0.5414453, -0.6099729, 1.910137, 0.3921569, 0, 1, 1,
0.5472771, 0.029304, 0.6688426, 0.3960784, 0, 1, 1,
0.5494632, -0.3777571, 1.428273, 0.4039216, 0, 1, 1,
0.5640091, -0.4482218, 1.47106, 0.4117647, 0, 1, 1,
0.5644998, 0.631347, 0.3983707, 0.4156863, 0, 1, 1,
0.5645977, -1.275745, 5.411435, 0.4235294, 0, 1, 1,
0.5652421, 0.5325497, 0.9055274, 0.427451, 0, 1, 1,
0.5659319, 0.2627918, 0.3746195, 0.4352941, 0, 1, 1,
0.5815497, -1.587648, 3.491222, 0.4392157, 0, 1, 1,
0.5823032, 0.1807245, 2.014953, 0.4470588, 0, 1, 1,
0.5880536, 0.05401166, 1.478382, 0.4509804, 0, 1, 1,
0.5922269, -0.6128803, 2.306077, 0.4588235, 0, 1, 1,
0.5927979, 0.3567465, 2.792147, 0.4627451, 0, 1, 1,
0.5968428, 1.013655, 1.742678, 0.4705882, 0, 1, 1,
0.6006462, 1.922337, 2.442781, 0.4745098, 0, 1, 1,
0.6008197, 1.415608, 2.01607, 0.4823529, 0, 1, 1,
0.6044453, -1.509686, 1.760493, 0.4862745, 0, 1, 1,
0.6045591, 0.9846465, 0.0543742, 0.4941176, 0, 1, 1,
0.6053535, -0.4507017, 2.775217, 0.5019608, 0, 1, 1,
0.6128573, 0.4740842, 2.363157, 0.5058824, 0, 1, 1,
0.6130127, -1.859306, -0.3408195, 0.5137255, 0, 1, 1,
0.6137115, -2.370079, 2.436159, 0.5176471, 0, 1, 1,
0.6218113, 1.085401, -0.8329747, 0.5254902, 0, 1, 1,
0.6236287, 0.3028356, 0.1717081, 0.5294118, 0, 1, 1,
0.6286769, -0.8276865, 2.181039, 0.5372549, 0, 1, 1,
0.6307107, -0.3521454, 3.060983, 0.5411765, 0, 1, 1,
0.6413956, 0.04929861, 2.456217, 0.5490196, 0, 1, 1,
0.6417973, 0.04609793, -1.035476, 0.5529412, 0, 1, 1,
0.6443482, -2.013521, 2.073658, 0.5607843, 0, 1, 1,
0.645981, -1.072592, 4.48527, 0.5647059, 0, 1, 1,
0.6557401, 0.7903141, 1.17396, 0.572549, 0, 1, 1,
0.6574808, -1.289588, 0.9169829, 0.5764706, 0, 1, 1,
0.6590371, -1.235978, 2.936193, 0.5843138, 0, 1, 1,
0.6595813, -0.9230758, 2.417421, 0.5882353, 0, 1, 1,
0.6637007, -0.1554716, 1.681621, 0.5960785, 0, 1, 1,
0.6661704, 0.5640225, 1.008396, 0.6039216, 0, 1, 1,
0.6706349, -0.1207523, -0.134007, 0.6078432, 0, 1, 1,
0.6717877, 0.5433159, 1.350352, 0.6156863, 0, 1, 1,
0.6968443, -0.7286052, 2.438126, 0.6196079, 0, 1, 1,
0.6971191, 0.6769301, 0.03524991, 0.627451, 0, 1, 1,
0.6991414, 0.08291105, 0.5190265, 0.6313726, 0, 1, 1,
0.7005746, 1.386207, 0.3583108, 0.6392157, 0, 1, 1,
0.7039749, 1.016645, 1.415572, 0.6431373, 0, 1, 1,
0.7088441, 1.476878, -0.894032, 0.6509804, 0, 1, 1,
0.7115737, 1.061095, 0.4710843, 0.654902, 0, 1, 1,
0.7147118, -1.584639, 2.305573, 0.6627451, 0, 1, 1,
0.7154402, 0.07837122, 1.331572, 0.6666667, 0, 1, 1,
0.7180316, -1.11037, 2.608944, 0.6745098, 0, 1, 1,
0.7297009, -1.107071, 2.695398, 0.6784314, 0, 1, 1,
0.7326029, -0.6158996, 2.792389, 0.6862745, 0, 1, 1,
0.7342038, 0.4784241, 1.518926, 0.6901961, 0, 1, 1,
0.7363236, 1.872495, 1.299754, 0.6980392, 0, 1, 1,
0.7363687, -1.264433, 2.484071, 0.7058824, 0, 1, 1,
0.7395235, 0.5349178, 1.949247, 0.7098039, 0, 1, 1,
0.7410285, -0.7999927, 2.164473, 0.7176471, 0, 1, 1,
0.7481089, -0.8512218, 0.8301809, 0.7215686, 0, 1, 1,
0.7482721, 0.1964587, 0.5572904, 0.7294118, 0, 1, 1,
0.7483127, -0.990732, 2.358241, 0.7333333, 0, 1, 1,
0.7504616, 0.621102, 2.465213, 0.7411765, 0, 1, 1,
0.753556, -2.276785, 4.134849, 0.7450981, 0, 1, 1,
0.7583908, 1.225548, -0.6542259, 0.7529412, 0, 1, 1,
0.760423, -1.710122, 4.351727, 0.7568628, 0, 1, 1,
0.7696799, -1.282749, 1.264343, 0.7647059, 0, 1, 1,
0.7704148, 0.5669948, 1.273469, 0.7686275, 0, 1, 1,
0.7797052, 0.6060043, 0.5308641, 0.7764706, 0, 1, 1,
0.7799045, -0.876673, 4.941532, 0.7803922, 0, 1, 1,
0.7813034, -1.855003, 3.934168, 0.7882353, 0, 1, 1,
0.7833773, -0.3762528, 0.6303126, 0.7921569, 0, 1, 1,
0.7834519, -0.4076292, 0.1772682, 0.8, 0, 1, 1,
0.7885001, -0.5499403, 3.685601, 0.8078431, 0, 1, 1,
0.7889699, -0.542395, 3.403126, 0.8117647, 0, 1, 1,
0.7895243, 0.3316435, 4.048048, 0.8196079, 0, 1, 1,
0.7934731, 1.226998, 1.498643, 0.8235294, 0, 1, 1,
0.7964617, -0.9077998, 0.4652282, 0.8313726, 0, 1, 1,
0.8068051, 0.7866957, 0.2409645, 0.8352941, 0, 1, 1,
0.81291, -1.082236, 1.397057, 0.8431373, 0, 1, 1,
0.8148717, -0.1412678, 0.06129905, 0.8470588, 0, 1, 1,
0.8238705, 0.1805151, 0.7135407, 0.854902, 0, 1, 1,
0.8405012, -1.71808, 4.654124, 0.8588235, 0, 1, 1,
0.8406286, -0.3807498, 0.6654863, 0.8666667, 0, 1, 1,
0.8407506, 0.4555934, 2.015979, 0.8705882, 0, 1, 1,
0.8433089, -0.4839801, 0.9240414, 0.8784314, 0, 1, 1,
0.8439879, 0.4714255, 0.4787696, 0.8823529, 0, 1, 1,
0.8448026, -0.9843396, 1.733403, 0.8901961, 0, 1, 1,
0.8458427, -0.07155817, 1.935183, 0.8941177, 0, 1, 1,
0.8603294, -0.1105839, 2.776308, 0.9019608, 0, 1, 1,
0.8612354, 0.1246547, 2.229616, 0.9098039, 0, 1, 1,
0.8617874, 0.6250339, 1.989562, 0.9137255, 0, 1, 1,
0.8638603, -0.4267147, 2.27968, 0.9215686, 0, 1, 1,
0.8663749, 1.344783, 0.5033579, 0.9254902, 0, 1, 1,
0.8720531, -2.123003, 2.514733, 0.9333333, 0, 1, 1,
0.8734113, -0.627468, 2.774976, 0.9372549, 0, 1, 1,
0.878414, -1.705055, 2.925966, 0.945098, 0, 1, 1,
0.8797241, -1.714584, 1.731597, 0.9490196, 0, 1, 1,
0.8867107, 0.8166768, 0.2464942, 0.9568627, 0, 1, 1,
0.8939124, -0.7129212, 2.146852, 0.9607843, 0, 1, 1,
0.8979346, 0.3006264, 1.178118, 0.9686275, 0, 1, 1,
0.9064817, -1.095601, 1.35982, 0.972549, 0, 1, 1,
0.9127619, -0.416532, 1.623469, 0.9803922, 0, 1, 1,
0.9131577, 1.566127, 2.000687, 0.9843137, 0, 1, 1,
0.9151551, -1.045829, 2.927362, 0.9921569, 0, 1, 1,
0.9167148, 1.946664, 2.281964, 0.9960784, 0, 1, 1,
0.9205409, -0.3061907, 1.041951, 1, 0, 0.9960784, 1,
0.9219913, 1.052041, 0.736569, 1, 0, 0.9882353, 1,
0.9225876, 0.051048, 1.905307, 1, 0, 0.9843137, 1,
0.9227886, 0.4187501, -1.076237, 1, 0, 0.9764706, 1,
0.9281608, -0.9239796, 2.935093, 1, 0, 0.972549, 1,
0.9337994, 0.4573497, 0.766206, 1, 0, 0.9647059, 1,
0.9354382, -0.02991479, 2.995526, 1, 0, 0.9607843, 1,
0.9374403, 0.06744418, 1.04728, 1, 0, 0.9529412, 1,
0.9379742, 0.1464744, 1.585442, 1, 0, 0.9490196, 1,
0.9401645, 1.769107, -1.767339, 1, 0, 0.9411765, 1,
0.940237, -0.06879253, 3.36003, 1, 0, 0.9372549, 1,
0.9410188, -0.1023791, 2.270188, 1, 0, 0.9294118, 1,
0.9438427, -0.3448002, 1.17802, 1, 0, 0.9254902, 1,
0.9442622, -1.012121, 3.557656, 1, 0, 0.9176471, 1,
0.9453878, 0.7647758, 1.755645, 1, 0, 0.9137255, 1,
0.9568832, -0.6196772, 1.177019, 1, 0, 0.9058824, 1,
0.9586156, 1.139988, 1.738316, 1, 0, 0.9019608, 1,
0.9595937, 0.9215453, 0.2090977, 1, 0, 0.8941177, 1,
0.9635064, 0.7224823, 1.122416, 1, 0, 0.8862745, 1,
0.9641643, -0.1374554, 1.569001, 1, 0, 0.8823529, 1,
0.9688295, 0.9203514, 0.9987812, 1, 0, 0.8745098, 1,
0.9707146, 0.1974932, 0.1252726, 1, 0, 0.8705882, 1,
0.9709752, -0.01291708, -0.05457948, 1, 0, 0.8627451, 1,
0.9751169, 0.08662472, 1.321517, 1, 0, 0.8588235, 1,
0.9827846, 0.8029515, 0.3210686, 1, 0, 0.8509804, 1,
0.9857488, 1.034631, 0.6375195, 1, 0, 0.8470588, 1,
0.9866971, -0.6198574, 1.496804, 1, 0, 0.8392157, 1,
0.9902955, -0.1292299, 2.72677, 1, 0, 0.8352941, 1,
0.9968688, -0.09451034, 0.5907624, 1, 0, 0.827451, 1,
1.002481, -1.561005, 3.518061, 1, 0, 0.8235294, 1,
1.011574, -1.136457, 0.849768, 1, 0, 0.8156863, 1,
1.012269, -0.4291964, 1.877923, 1, 0, 0.8117647, 1,
1.01254, 0.6454467, -0.3736637, 1, 0, 0.8039216, 1,
1.020797, 0.8872615, 0.8402162, 1, 0, 0.7960784, 1,
1.024473, 2.740477, 0.7978179, 1, 0, 0.7921569, 1,
1.027823, 0.360682, 0.4129397, 1, 0, 0.7843137, 1,
1.031369, 0.9867275, 1.77195, 1, 0, 0.7803922, 1,
1.037575, 3.794425, 1.723529, 1, 0, 0.772549, 1,
1.044533, 0.5058018, -0.6977782, 1, 0, 0.7686275, 1,
1.057788, 0.250748, 2.770712, 1, 0, 0.7607843, 1,
1.062933, 1.104437, 0.9011282, 1, 0, 0.7568628, 1,
1.066408, -0.8977295, 3.984087, 1, 0, 0.7490196, 1,
1.069362, -0.8287456, 3.594149, 1, 0, 0.7450981, 1,
1.071946, 0.6670155, 1.0094, 1, 0, 0.7372549, 1,
1.075402, -0.0664009, 1.919064, 1, 0, 0.7333333, 1,
1.076434, -0.1340301, 2.314764, 1, 0, 0.7254902, 1,
1.083348, 0.8483661, 1.122187, 1, 0, 0.7215686, 1,
1.087936, -0.1023081, 0.6002007, 1, 0, 0.7137255, 1,
1.091094, -0.7422172, 2.777101, 1, 0, 0.7098039, 1,
1.095153, -1.47057, 2.954562, 1, 0, 0.7019608, 1,
1.096229, -1.50691, 2.631474, 1, 0, 0.6941177, 1,
1.100002, 1.237695, 0.008459464, 1, 0, 0.6901961, 1,
1.11032, 0.01221266, 2.619519, 1, 0, 0.682353, 1,
1.128308, -0.1904873, 0.5689867, 1, 0, 0.6784314, 1,
1.130697, -1.256855, 0.7918466, 1, 0, 0.6705883, 1,
1.13546, -1.498034, 3.414725, 1, 0, 0.6666667, 1,
1.136623, 0.3086063, 1.672213, 1, 0, 0.6588235, 1,
1.148809, 0.5766536, 1.200969, 1, 0, 0.654902, 1,
1.151153, 0.0003137768, 1.776628, 1, 0, 0.6470588, 1,
1.151449, 1.347639, 0.6673121, 1, 0, 0.6431373, 1,
1.159569, -0.7236408, 1.70173, 1, 0, 0.6352941, 1,
1.179749, 0.3460025, -0.04751386, 1, 0, 0.6313726, 1,
1.181852, 0.4549634, 1.918242, 1, 0, 0.6235294, 1,
1.182612, -0.1700598, 3.393766, 1, 0, 0.6196079, 1,
1.184337, 1.219007, 2.511322, 1, 0, 0.6117647, 1,
1.190101, -0.4650976, 3.941476, 1, 0, 0.6078432, 1,
1.197786, 0.02097107, 2.487472, 1, 0, 0.6, 1,
1.209561, -0.369607, 3.117611, 1, 0, 0.5921569, 1,
1.209772, -0.7572752, 2.852754, 1, 0, 0.5882353, 1,
1.211901, -0.9474352, 1.211798, 1, 0, 0.5803922, 1,
1.228501, -0.266705, 1.854283, 1, 0, 0.5764706, 1,
1.243151, -1.608289, 2.312825, 1, 0, 0.5686275, 1,
1.243227, 1.038084, 1.537018, 1, 0, 0.5647059, 1,
1.243558, 0.774734, 0.8352761, 1, 0, 0.5568628, 1,
1.256185, -1.3984, 1.937993, 1, 0, 0.5529412, 1,
1.262659, -0.7481194, 3.090391, 1, 0, 0.5450981, 1,
1.281145, 1.283825, 1.513711, 1, 0, 0.5411765, 1,
1.282176, -0.6036137, 0.9935905, 1, 0, 0.5333334, 1,
1.282526, -0.6594667, 1.931053, 1, 0, 0.5294118, 1,
1.284849, -0.6396641, 1.224458, 1, 0, 0.5215687, 1,
1.296581, 1.098782, 1.525317, 1, 0, 0.5176471, 1,
1.299854, -0.4305962, 0.03638335, 1, 0, 0.509804, 1,
1.310051, 0.09550337, 1.18849, 1, 0, 0.5058824, 1,
1.316496, -1.619666, 2.054664, 1, 0, 0.4980392, 1,
1.323586, -0.4843499, 1.481998, 1, 0, 0.4901961, 1,
1.32467, 0.3389929, 2.226826, 1, 0, 0.4862745, 1,
1.325801, -0.9822887, 2.503295, 1, 0, 0.4784314, 1,
1.329074, 0.6377354, 0.2510489, 1, 0, 0.4745098, 1,
1.330006, -0.7115886, 1.735888, 1, 0, 0.4666667, 1,
1.336704, -0.640781, 3.209144, 1, 0, 0.4627451, 1,
1.343603, 0.3352341, 2.690863, 1, 0, 0.454902, 1,
1.350449, -0.6316558, 1.704724, 1, 0, 0.4509804, 1,
1.360227, 0.05286756, 1.919404, 1, 0, 0.4431373, 1,
1.366542, 2.14212, -0.1722209, 1, 0, 0.4392157, 1,
1.370675, 0.2291934, -0.2069203, 1, 0, 0.4313726, 1,
1.371361, -0.0862027, 3.472929, 1, 0, 0.427451, 1,
1.372739, -2.17873, 2.012599, 1, 0, 0.4196078, 1,
1.376554, -0.4406376, 2.145138, 1, 0, 0.4156863, 1,
1.383545, 0.5977275, 2.229243, 1, 0, 0.4078431, 1,
1.389458, -0.05131328, 1.898301, 1, 0, 0.4039216, 1,
1.396837, -2.034153, 3.493895, 1, 0, 0.3960784, 1,
1.416357, 1.613926, 0.2063904, 1, 0, 0.3882353, 1,
1.421745, 1.493058, 3.167924, 1, 0, 0.3843137, 1,
1.432029, 1.914309, -0.6867849, 1, 0, 0.3764706, 1,
1.440341, -1.455051, 1.843622, 1, 0, 0.372549, 1,
1.448708, 0.4858576, 0.8330265, 1, 0, 0.3647059, 1,
1.455517, 0.5932867, 3.083415, 1, 0, 0.3607843, 1,
1.455739, -0.2263941, 0.6842614, 1, 0, 0.3529412, 1,
1.457823, 0.6630232, 0.111829, 1, 0, 0.3490196, 1,
1.46014, 1.422274, 1.19498, 1, 0, 0.3411765, 1,
1.470007, -1.533601, 2.654831, 1, 0, 0.3372549, 1,
1.47677, 0.3550643, 0.7955124, 1, 0, 0.3294118, 1,
1.482298, 1.180095, 2.087694, 1, 0, 0.3254902, 1,
1.488936, 2.282401, -0.2456136, 1, 0, 0.3176471, 1,
1.512792, 0.03623674, 2.260098, 1, 0, 0.3137255, 1,
1.515668, -2.05018, 4.225559, 1, 0, 0.3058824, 1,
1.515896, 0.3446765, 2.667725, 1, 0, 0.2980392, 1,
1.530325, 1.263208, 0.5847681, 1, 0, 0.2941177, 1,
1.537421, 0.7929639, 1.074215, 1, 0, 0.2862745, 1,
1.54306, -0.1536783, 1.038645, 1, 0, 0.282353, 1,
1.556048, 0.1834134, 1.093367, 1, 0, 0.2745098, 1,
1.558624, -0.1600376, 2.588793, 1, 0, 0.2705882, 1,
1.559002, 1.328087, -1.066134, 1, 0, 0.2627451, 1,
1.559366, -0.07545172, 1.336971, 1, 0, 0.2588235, 1,
1.56085, -0.6645681, 0.2526265, 1, 0, 0.2509804, 1,
1.566553, -0.7681605, 0.1773163, 1, 0, 0.2470588, 1,
1.591599, 0.8126025, -0.01778608, 1, 0, 0.2392157, 1,
1.60193, 1.23618, -0.6884024, 1, 0, 0.2352941, 1,
1.62095, -0.4393794, 0.5950524, 1, 0, 0.227451, 1,
1.634545, -0.9761179, 0.57933, 1, 0, 0.2235294, 1,
1.649031, 0.4841364, 2.03704, 1, 0, 0.2156863, 1,
1.660713, 0.05679145, 0.1972339, 1, 0, 0.2117647, 1,
1.672335, 1.066149, 1.583707, 1, 0, 0.2039216, 1,
1.683824, -0.5400382, 2.208912, 1, 0, 0.1960784, 1,
1.687466, 0.3013327, 1.687348, 1, 0, 0.1921569, 1,
1.741406, 0.709056, 2.323725, 1, 0, 0.1843137, 1,
1.75214, -1.674607, 1.36939, 1, 0, 0.1803922, 1,
1.790472, 0.9723185, 2.921232, 1, 0, 0.172549, 1,
1.79048, -0.01812313, 1.647386, 1, 0, 0.1686275, 1,
1.791666, 0.02434018, 0.3704686, 1, 0, 0.1607843, 1,
1.799693, 1.613945, 2.164727, 1, 0, 0.1568628, 1,
1.819963, 0.8441902, 1.491056, 1, 0, 0.1490196, 1,
1.822581, 0.04527725, 1.0785, 1, 0, 0.145098, 1,
1.830645, -0.4971135, 1.462571, 1, 0, 0.1372549, 1,
1.841765, -0.7596561, 2.111832, 1, 0, 0.1333333, 1,
1.842693, -1.436074, 2.652827, 1, 0, 0.1254902, 1,
1.855665, -0.409035, 2.950975, 1, 0, 0.1215686, 1,
1.878362, -1.598157, 2.226767, 1, 0, 0.1137255, 1,
1.883399, 0.9495252, 1.056826, 1, 0, 0.1098039, 1,
1.915371, 0.559082, -0.01543579, 1, 0, 0.1019608, 1,
1.965646, -1.18617, 2.641798, 1, 0, 0.09411765, 1,
1.980206, -0.4511017, 2.256047, 1, 0, 0.09019608, 1,
1.982386, -1.10723, 0.2027657, 1, 0, 0.08235294, 1,
2.00195, 0.8282956, 2.326804, 1, 0, 0.07843138, 1,
2.069863, -0.4476199, 3.31746, 1, 0, 0.07058824, 1,
2.07438, -0.6971698, 3.977895, 1, 0, 0.06666667, 1,
2.0828, 0.5316241, 1.116351, 1, 0, 0.05882353, 1,
2.101587, -0.9774112, 2.263716, 1, 0, 0.05490196, 1,
2.293583, 0.03848524, 0.3682804, 1, 0, 0.04705882, 1,
2.29737, 0.2007516, -0.5966876, 1, 0, 0.04313726, 1,
2.32472, 0.5265571, 2.333586, 1, 0, 0.03529412, 1,
2.457365, 0.6117102, 1.975929, 1, 0, 0.03137255, 1,
2.646262, 0.8396985, 0.735531, 1, 0, 0.02352941, 1,
2.836614, -1.329298, 0.9297864, 1, 0, 0.01960784, 1,
2.852274, 0.2388975, -1.051728, 1, 0, 0.01176471, 1,
2.896239, 1.322771, 1.725606, 1, 0, 0.007843138, 1
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
-0.231132, -4.083417, -8.167626, 0, -0.5, 0.5, 0.5,
-0.231132, -4.083417, -8.167626, 1, -0.5, 0.5, 0.5,
-0.231132, -4.083417, -8.167626, 1, 1.5, 0.5, 0.5,
-0.231132, -4.083417, -8.167626, 0, 1.5, 0.5, 0.5
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
-4.418682, 0.4263866, -8.167626, 0, -0.5, 0.5, 0.5,
-4.418682, 0.4263866, -8.167626, 1, -0.5, 0.5, 0.5,
-4.418682, 0.4263866, -8.167626, 1, 1.5, 0.5, 0.5,
-4.418682, 0.4263866, -8.167626, 0, 1.5, 0.5, 0.5
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
-4.418682, -4.083417, -0.3940635, 0, -0.5, 0.5, 0.5,
-4.418682, -4.083417, -0.3940635, 1, -0.5, 0.5, 0.5,
-4.418682, -4.083417, -0.3940635, 1, 1.5, 0.5, 0.5,
-4.418682, -4.083417, -0.3940635, 0, 1.5, 0.5, 0.5
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
-3, -3.042693, -6.373727,
2, -3.042693, -6.373727,
-3, -3.042693, -6.373727,
-3, -3.216147, -6.67271,
-2, -3.042693, -6.373727,
-2, -3.216147, -6.67271,
-1, -3.042693, -6.373727,
-1, -3.216147, -6.67271,
0, -3.042693, -6.373727,
0, -3.216147, -6.67271,
1, -3.042693, -6.373727,
1, -3.216147, -6.67271,
2, -3.042693, -6.373727,
2, -3.216147, -6.67271
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
-3, -3.563055, -7.270677, 0, -0.5, 0.5, 0.5,
-3, -3.563055, -7.270677, 1, -0.5, 0.5, 0.5,
-3, -3.563055, -7.270677, 1, 1.5, 0.5, 0.5,
-3, -3.563055, -7.270677, 0, 1.5, 0.5, 0.5,
-2, -3.563055, -7.270677, 0, -0.5, 0.5, 0.5,
-2, -3.563055, -7.270677, 1, -0.5, 0.5, 0.5,
-2, -3.563055, -7.270677, 1, 1.5, 0.5, 0.5,
-2, -3.563055, -7.270677, 0, 1.5, 0.5, 0.5,
-1, -3.563055, -7.270677, 0, -0.5, 0.5, 0.5,
-1, -3.563055, -7.270677, 1, -0.5, 0.5, 0.5,
-1, -3.563055, -7.270677, 1, 1.5, 0.5, 0.5,
-1, -3.563055, -7.270677, 0, 1.5, 0.5, 0.5,
0, -3.563055, -7.270677, 0, -0.5, 0.5, 0.5,
0, -3.563055, -7.270677, 1, -0.5, 0.5, 0.5,
0, -3.563055, -7.270677, 1, 1.5, 0.5, 0.5,
0, -3.563055, -7.270677, 0, 1.5, 0.5, 0.5,
1, -3.563055, -7.270677, 0, -0.5, 0.5, 0.5,
1, -3.563055, -7.270677, 1, -0.5, 0.5, 0.5,
1, -3.563055, -7.270677, 1, 1.5, 0.5, 0.5,
1, -3.563055, -7.270677, 0, 1.5, 0.5, 0.5,
2, -3.563055, -7.270677, 0, -0.5, 0.5, 0.5,
2, -3.563055, -7.270677, 1, -0.5, 0.5, 0.5,
2, -3.563055, -7.270677, 1, 1.5, 0.5, 0.5,
2, -3.563055, -7.270677, 0, 1.5, 0.5, 0.5
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
-3.452324, -2, -6.373727,
-3.452324, 3, -6.373727,
-3.452324, -2, -6.373727,
-3.613384, -2, -6.67271,
-3.452324, -1, -6.373727,
-3.613384, -1, -6.67271,
-3.452324, 0, -6.373727,
-3.613384, 0, -6.67271,
-3.452324, 1, -6.373727,
-3.613384, 1, -6.67271,
-3.452324, 2, -6.373727,
-3.613384, 2, -6.67271,
-3.452324, 3, -6.373727,
-3.613384, 3, -6.67271
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
-3.935503, -2, -7.270677, 0, -0.5, 0.5, 0.5,
-3.935503, -2, -7.270677, 1, -0.5, 0.5, 0.5,
-3.935503, -2, -7.270677, 1, 1.5, 0.5, 0.5,
-3.935503, -2, -7.270677, 0, 1.5, 0.5, 0.5,
-3.935503, -1, -7.270677, 0, -0.5, 0.5, 0.5,
-3.935503, -1, -7.270677, 1, -0.5, 0.5, 0.5,
-3.935503, -1, -7.270677, 1, 1.5, 0.5, 0.5,
-3.935503, -1, -7.270677, 0, 1.5, 0.5, 0.5,
-3.935503, 0, -7.270677, 0, -0.5, 0.5, 0.5,
-3.935503, 0, -7.270677, 1, -0.5, 0.5, 0.5,
-3.935503, 0, -7.270677, 1, 1.5, 0.5, 0.5,
-3.935503, 0, -7.270677, 0, 1.5, 0.5, 0.5,
-3.935503, 1, -7.270677, 0, -0.5, 0.5, 0.5,
-3.935503, 1, -7.270677, 1, -0.5, 0.5, 0.5,
-3.935503, 1, -7.270677, 1, 1.5, 0.5, 0.5,
-3.935503, 1, -7.270677, 0, 1.5, 0.5, 0.5,
-3.935503, 2, -7.270677, 0, -0.5, 0.5, 0.5,
-3.935503, 2, -7.270677, 1, -0.5, 0.5, 0.5,
-3.935503, 2, -7.270677, 1, 1.5, 0.5, 0.5,
-3.935503, 2, -7.270677, 0, 1.5, 0.5, 0.5,
-3.935503, 3, -7.270677, 0, -0.5, 0.5, 0.5,
-3.935503, 3, -7.270677, 1, -0.5, 0.5, 0.5,
-3.935503, 3, -7.270677, 1, 1.5, 0.5, 0.5,
-3.935503, 3, -7.270677, 0, 1.5, 0.5, 0.5
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
-3.452324, -3.042693, -6,
-3.452324, -3.042693, 4,
-3.452324, -3.042693, -6,
-3.613384, -3.216147, -6,
-3.452324, -3.042693, -4,
-3.613384, -3.216147, -4,
-3.452324, -3.042693, -2,
-3.613384, -3.216147, -2,
-3.452324, -3.042693, 0,
-3.613384, -3.216147, 0,
-3.452324, -3.042693, 2,
-3.613384, -3.216147, 2,
-3.452324, -3.042693, 4,
-3.613384, -3.216147, 4
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
-3.935503, -3.563055, -6, 0, -0.5, 0.5, 0.5,
-3.935503, -3.563055, -6, 1, -0.5, 0.5, 0.5,
-3.935503, -3.563055, -6, 1, 1.5, 0.5, 0.5,
-3.935503, -3.563055, -6, 0, 1.5, 0.5, 0.5,
-3.935503, -3.563055, -4, 0, -0.5, 0.5, 0.5,
-3.935503, -3.563055, -4, 1, -0.5, 0.5, 0.5,
-3.935503, -3.563055, -4, 1, 1.5, 0.5, 0.5,
-3.935503, -3.563055, -4, 0, 1.5, 0.5, 0.5,
-3.935503, -3.563055, -2, 0, -0.5, 0.5, 0.5,
-3.935503, -3.563055, -2, 1, -0.5, 0.5, 0.5,
-3.935503, -3.563055, -2, 1, 1.5, 0.5, 0.5,
-3.935503, -3.563055, -2, 0, 1.5, 0.5, 0.5,
-3.935503, -3.563055, 0, 0, -0.5, 0.5, 0.5,
-3.935503, -3.563055, 0, 1, -0.5, 0.5, 0.5,
-3.935503, -3.563055, 0, 1, 1.5, 0.5, 0.5,
-3.935503, -3.563055, 0, 0, 1.5, 0.5, 0.5,
-3.935503, -3.563055, 2, 0, -0.5, 0.5, 0.5,
-3.935503, -3.563055, 2, 1, -0.5, 0.5, 0.5,
-3.935503, -3.563055, 2, 1, 1.5, 0.5, 0.5,
-3.935503, -3.563055, 2, 0, 1.5, 0.5, 0.5,
-3.935503, -3.563055, 4, 0, -0.5, 0.5, 0.5,
-3.935503, -3.563055, 4, 1, -0.5, 0.5, 0.5,
-3.935503, -3.563055, 4, 1, 1.5, 0.5, 0.5,
-3.935503, -3.563055, 4, 0, 1.5, 0.5, 0.5
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
-3.452324, -3.042693, -6.373727,
-3.452324, 3.895466, -6.373727,
-3.452324, -3.042693, 5.5856,
-3.452324, 3.895466, 5.5856,
-3.452324, -3.042693, -6.373727,
-3.452324, -3.042693, 5.5856,
-3.452324, 3.895466, -6.373727,
-3.452324, 3.895466, 5.5856,
-3.452324, -3.042693, -6.373727,
2.99006, -3.042693, -6.373727,
-3.452324, -3.042693, 5.5856,
2.99006, -3.042693, 5.5856,
-3.452324, 3.895466, -6.373727,
2.99006, 3.895466, -6.373727,
-3.452324, 3.895466, 5.5856,
2.99006, 3.895466, 5.5856,
2.99006, -3.042693, -6.373727,
2.99006, 3.895466, -6.373727,
2.99006, -3.042693, 5.5856,
2.99006, 3.895466, 5.5856,
2.99006, -3.042693, -6.373727,
2.99006, -3.042693, 5.5856,
2.99006, 3.895466, -6.373727,
2.99006, 3.895466, 5.5856
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
var radius = 8.145049;
var distance = 36.23824;
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
mvMatrix.translate( 0.231132, -0.4263866, 0.3940635 );
mvMatrix.scale( 1.366976, 1.269297, 0.7363781 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.23824);
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
flubenzimine<-read.table("flubenzimine.xyz")
```

```
## Error in read.table("flubenzimine.xyz"): no lines available in input
```

```r
x<-flubenzimine$V2
```

```
## Error in eval(expr, envir, enclos): object 'flubenzimine' not found
```

```r
y<-flubenzimine$V3
```

```
## Error in eval(expr, envir, enclos): object 'flubenzimine' not found
```

```r
z<-flubenzimine$V4
```

```
## Error in eval(expr, envir, enclos): object 'flubenzimine' not found
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
-3.358503, 0.9177797, -0.4200353, 0, 0, 1, 1, 1,
-2.945041, 0.4535414, -1.179386, 1, 0, 0, 1, 1,
-2.845851, -0.536715, -2.194441, 1, 0, 0, 1, 1,
-2.706461, 0.9191011, -2.070447, 1, 0, 0, 1, 1,
-2.641824, -0.8058085, -2.664695, 1, 0, 0, 1, 1,
-2.640954, 0.7246128, -0.5104554, 1, 0, 0, 1, 1,
-2.625588, 0.370519, -0.9404389, 0, 0, 0, 1, 1,
-2.595314, -0.5199938, -2.991304, 0, 0, 0, 1, 1,
-2.587607, -2.124282, -2.653497, 0, 0, 0, 1, 1,
-2.565721, -1.513724, -2.693359, 0, 0, 0, 1, 1,
-2.458415, 0.636138, -1.128312, 0, 0, 0, 1, 1,
-2.394447, -0.1261013, -0.7918143, 0, 0, 0, 1, 1,
-2.385405, -1.072804, -3.999686, 0, 0, 0, 1, 1,
-2.359336, 0.6750729, -0.4379106, 1, 1, 1, 1, 1,
-2.301396, 0.06583749, -1.282951, 1, 1, 1, 1, 1,
-2.297708, -0.3424014, -1.452841, 1, 1, 1, 1, 1,
-2.264943, -0.005619701, -3.172609, 1, 1, 1, 1, 1,
-2.261837, 0.8521644, -1.475935, 1, 1, 1, 1, 1,
-2.229544, -0.04110304, -1.815885, 1, 1, 1, 1, 1,
-2.133954, 1.22489, -0.9841555, 1, 1, 1, 1, 1,
-2.095671, 0.1277926, -1.836172, 1, 1, 1, 1, 1,
-2.085075, 0.9140204, -1.321641, 1, 1, 1, 1, 1,
-2.065178, -1.526501, -2.032378, 1, 1, 1, 1, 1,
-1.971706, -0.5827621, -3.748943, 1, 1, 1, 1, 1,
-1.947283, 1.75075, -1.23305, 1, 1, 1, 1, 1,
-1.929657, 0.6151472, -3.114704, 1, 1, 1, 1, 1,
-1.924273, -0.01983472, -2.458504, 1, 1, 1, 1, 1,
-1.917441, 3.430317, -0.6179568, 1, 1, 1, 1, 1,
-1.901958, -1.439365, -3.344917, 0, 0, 1, 1, 1,
-1.875625, 0.6659238, -0.8644273, 1, 0, 0, 1, 1,
-1.843422, -0.236996, -2.096178, 1, 0, 0, 1, 1,
-1.83687, -0.6278861, -2.768714, 1, 0, 0, 1, 1,
-1.828294, -1.663318, -1.537072, 1, 0, 0, 1, 1,
-1.815074, 0.1228575, -1.459109, 1, 0, 0, 1, 1,
-1.814893, 0.3680791, -1.423371, 0, 0, 0, 1, 1,
-1.810688, 0.4735164, -1.366023, 0, 0, 0, 1, 1,
-1.803493, -0.4920323, -2.154616, 0, 0, 0, 1, 1,
-1.79145, 0.8868096, -1.46727, 0, 0, 0, 1, 1,
-1.783544, -0.4740179, -1.319013, 0, 0, 0, 1, 1,
-1.779022, 0.8965656, -2.707998, 0, 0, 0, 1, 1,
-1.776042, 0.7786948, 0.08062181, 0, 0, 0, 1, 1,
-1.775321, 0.7352047, 0.7883105, 1, 1, 1, 1, 1,
-1.767219, 1.089467, -0.7239553, 1, 1, 1, 1, 1,
-1.743705, 0.7000416, -1.512831, 1, 1, 1, 1, 1,
-1.727332, 0.1175587, -1.739487, 1, 1, 1, 1, 1,
-1.720276, -0.3213972, -3.378447, 1, 1, 1, 1, 1,
-1.720028, -1.639139, -2.201583, 1, 1, 1, 1, 1,
-1.70507, 1.451303, -0.7517026, 1, 1, 1, 1, 1,
-1.674305, 0.09263632, -1.914137, 1, 1, 1, 1, 1,
-1.628975, -2.941652, -3.200798, 1, 1, 1, 1, 1,
-1.625834, -1.677764, -2.861601, 1, 1, 1, 1, 1,
-1.621091, -1.103152, -0.3429068, 1, 1, 1, 1, 1,
-1.616992, 1.785847, 1.075546, 1, 1, 1, 1, 1,
-1.615324, -0.2889467, -0.9144999, 1, 1, 1, 1, 1,
-1.602306, -0.633017, -3.000121, 1, 1, 1, 1, 1,
-1.602259, -0.07936732, -0.7963036, 1, 1, 1, 1, 1,
-1.596127, -0.5592703, -2.228664, 0, 0, 1, 1, 1,
-1.590697, 1.746466, -0.7075171, 1, 0, 0, 1, 1,
-1.589758, 0.8039851, 0.1885125, 1, 0, 0, 1, 1,
-1.587871, -0.6891093, -3.394577, 1, 0, 0, 1, 1,
-1.57892, -1.517493, -1.622977, 1, 0, 0, 1, 1,
-1.578826, 1.13097, 0.05111159, 1, 0, 0, 1, 1,
-1.573626, 1.645511, -2.369025, 0, 0, 0, 1, 1,
-1.571987, 0.6645175, -0.1450931, 0, 0, 0, 1, 1,
-1.566118, 0.9199766, -0.1750713, 0, 0, 0, 1, 1,
-1.551605, -0.6788206, -1.700028, 0, 0, 0, 1, 1,
-1.545041, 0.02668318, -3.676374, 0, 0, 0, 1, 1,
-1.538803, -0.1630567, -2.718957, 0, 0, 0, 1, 1,
-1.537545, -0.1927234, -0.9800388, 0, 0, 0, 1, 1,
-1.532024, -1.364923, -2.614218, 1, 1, 1, 1, 1,
-1.530788, 1.601207, -1.387911, 1, 1, 1, 1, 1,
-1.52867, -0.8402761, -2.394006, 1, 1, 1, 1, 1,
-1.525496, 0.375601, -0.6135715, 1, 1, 1, 1, 1,
-1.521473, -0.2704112, -1.593195, 1, 1, 1, 1, 1,
-1.520603, -0.1592547, -0.347896, 1, 1, 1, 1, 1,
-1.511358, 1.032047, -1.521926, 1, 1, 1, 1, 1,
-1.507126, 0.2869148, -2.047943, 1, 1, 1, 1, 1,
-1.497281, -0.8224888, -1.568626, 1, 1, 1, 1, 1,
-1.476739, -0.07208426, -1.101563, 1, 1, 1, 1, 1,
-1.473542, -0.4657876, -1.693003, 1, 1, 1, 1, 1,
-1.463712, -1.067362, -1.766182, 1, 1, 1, 1, 1,
-1.454136, -1.630116, -3.430781, 1, 1, 1, 1, 1,
-1.448983, 0.274158, -2.516922, 1, 1, 1, 1, 1,
-1.441745, 1.394778, -0.7791259, 1, 1, 1, 1, 1,
-1.434961, -0.8360342, -2.635481, 0, 0, 1, 1, 1,
-1.432189, 0.7094571, -0.5106687, 1, 0, 0, 1, 1,
-1.415998, 0.2603633, -1.714066, 1, 0, 0, 1, 1,
-1.410893, 0.2039612, 0.07315226, 1, 0, 0, 1, 1,
-1.400838, 1.470001, 0.3600031, 1, 0, 0, 1, 1,
-1.3944, 0.2729164, -2.417151, 1, 0, 0, 1, 1,
-1.394121, -0.5605676, -3.012781, 0, 0, 0, 1, 1,
-1.375378, 0.1624565, -2.206594, 0, 0, 0, 1, 1,
-1.372948, 0.8483453, -2.861599, 0, 0, 0, 1, 1,
-1.365531, 2.151561, -0.4649853, 0, 0, 0, 1, 1,
-1.3643, -0.4820789, -2.729794, 0, 0, 0, 1, 1,
-1.362439, 0.3668798, -0.6952429, 0, 0, 0, 1, 1,
-1.354099, -0.1705097, -1.476782, 0, 0, 0, 1, 1,
-1.334663, 1.385018, -1.10521, 1, 1, 1, 1, 1,
-1.32858, -0.5184253, 1.324805, 1, 1, 1, 1, 1,
-1.308771, 0.6430945, -1.95346, 1, 1, 1, 1, 1,
-1.308287, 2.382383, -1.404542, 1, 1, 1, 1, 1,
-1.287895, -2.368345, -3.82107, 1, 1, 1, 1, 1,
-1.286364, 0.7776748, -0.3454696, 1, 1, 1, 1, 1,
-1.285743, 1.260754, 0.09020797, 1, 1, 1, 1, 1,
-1.283959, -1.162783, -0.9335448, 1, 1, 1, 1, 1,
-1.280803, 0.6673753, 0.8880684, 1, 1, 1, 1, 1,
-1.279902, -0.6487572, -2.436985, 1, 1, 1, 1, 1,
-1.278879, -0.132434, -1.206385, 1, 1, 1, 1, 1,
-1.27651, 1.452146, -1.901996, 1, 1, 1, 1, 1,
-1.274565, 0.4346815, -1.941219, 1, 1, 1, 1, 1,
-1.273476, -0.3656201, -1.695914, 1, 1, 1, 1, 1,
-1.27213, -1.699152, -1.674679, 1, 1, 1, 1, 1,
-1.27144, 0.8385109, 0.7242274, 0, 0, 1, 1, 1,
-1.257579, -1.511516, -3.961185, 1, 0, 0, 1, 1,
-1.251416, 0.8883276, -0.972765, 1, 0, 0, 1, 1,
-1.24955, -0.4884256, -2.510981, 1, 0, 0, 1, 1,
-1.235735, 0.06161726, -0.5566449, 1, 0, 0, 1, 1,
-1.232121, 1.352251, -1.734733, 1, 0, 0, 1, 1,
-1.220528, -2.905348, -3.306209, 0, 0, 0, 1, 1,
-1.215736, -1.156538, -3.5507, 0, 0, 0, 1, 1,
-1.205038, 0.4977799, -1.314625, 0, 0, 0, 1, 1,
-1.188251, -0.2634922, -2.135199, 0, 0, 0, 1, 1,
-1.187503, -2.090925, -2.545225, 0, 0, 0, 1, 1,
-1.180458, -2.154274, -2.518443, 0, 0, 0, 1, 1,
-1.168133, 1.105517, -1.005331, 0, 0, 0, 1, 1,
-1.167371, 0.5928166, -0.7737029, 1, 1, 1, 1, 1,
-1.162094, -1.501906, -0.2745703, 1, 1, 1, 1, 1,
-1.16055, 0.2659795, -1.004199, 1, 1, 1, 1, 1,
-1.159077, 0.09782076, -2.760359, 1, 1, 1, 1, 1,
-1.147689, 1.856813, 0.41204, 1, 1, 1, 1, 1,
-1.14203, -0.8901878, -0.9286441, 1, 1, 1, 1, 1,
-1.139117, 0.05417262, -0.8111829, 1, 1, 1, 1, 1,
-1.137859, -1.879033, 0.5345314, 1, 1, 1, 1, 1,
-1.128764, -0.3011253, -1.653213, 1, 1, 1, 1, 1,
-1.120872, -0.399502, -0.842764, 1, 1, 1, 1, 1,
-1.113851, 1.825193, 0.1330038, 1, 1, 1, 1, 1,
-1.100103, 0.3175062, 0.5254818, 1, 1, 1, 1, 1,
-1.099279, 0.1721286, 0.6514501, 1, 1, 1, 1, 1,
-1.095098, 1.417256, -0.008319913, 1, 1, 1, 1, 1,
-1.086264, 0.6343687, -2.25796, 1, 1, 1, 1, 1,
-1.082234, 0.7491199, -1.079129, 0, 0, 1, 1, 1,
-1.081857, -0.6839908, -2.026863, 1, 0, 0, 1, 1,
-1.080664, -0.5821854, -2.569401, 1, 0, 0, 1, 1,
-1.076218, 0.2809516, -2.323362, 1, 0, 0, 1, 1,
-1.074748, -0.7899785, -1.296004, 1, 0, 0, 1, 1,
-1.07401, 1.248354, -0.3084201, 1, 0, 0, 1, 1,
-1.045945, 0.6432434, -1.954805, 0, 0, 0, 1, 1,
-1.04582, 1.958804, -0.01382431, 0, 0, 0, 1, 1,
-1.042373, 1.096231, -0.5007076, 0, 0, 0, 1, 1,
-1.041984, 1.200227, -1.901162, 0, 0, 0, 1, 1,
-1.035351, -0.8983621, -4.323342, 0, 0, 0, 1, 1,
-1.027041, -0.7183749, -2.141128, 0, 0, 0, 1, 1,
-1.018198, 0.4258945, -2.322429, 0, 0, 0, 1, 1,
-1.006607, -0.2903262, -0.9579519, 1, 1, 1, 1, 1,
-1.006555, -0.8567538, -1.567914, 1, 1, 1, 1, 1,
-1.006539, -0.6363276, -3.552233, 1, 1, 1, 1, 1,
-1.001577, 0.3561675, -0.5085995, 1, 1, 1, 1, 1,
-0.9954195, 0.6970893, -1.002559, 1, 1, 1, 1, 1,
-0.9952287, -0.1645985, -2.57393, 1, 1, 1, 1, 1,
-0.9952109, 0.3792111, -0.326753, 1, 1, 1, 1, 1,
-0.9917089, -0.3517435, -1.609317, 1, 1, 1, 1, 1,
-0.9916182, -0.7548203, -2.496406, 1, 1, 1, 1, 1,
-0.9906896, -0.01529363, -1.605144, 1, 1, 1, 1, 1,
-0.9877494, 0.6709788, -0.7151218, 1, 1, 1, 1, 1,
-0.9847024, -0.7564526, -1.926448, 1, 1, 1, 1, 1,
-0.9835554, 0.200306, -1.271612, 1, 1, 1, 1, 1,
-0.9824712, -0.07952926, -3.118549, 1, 1, 1, 1, 1,
-0.9816099, -1.15307, -2.25832, 1, 1, 1, 1, 1,
-0.9814739, -0.1336601, -2.579195, 0, 0, 1, 1, 1,
-0.9781628, -0.392656, -1.040194, 1, 0, 0, 1, 1,
-0.9776341, -0.5736306, -2.984358, 1, 0, 0, 1, 1,
-0.9771916, 0.4762615, 0.6469418, 1, 0, 0, 1, 1,
-0.9745626, -0.5437914, -0.9628254, 1, 0, 0, 1, 1,
-0.9695038, -0.4792754, -1.752471, 1, 0, 0, 1, 1,
-0.9632222, 1.500365, 0.02445571, 0, 0, 0, 1, 1,
-0.9613486, -1.778106, -3.111323, 0, 0, 0, 1, 1,
-0.9603104, -1.918985, -4.46221, 0, 0, 0, 1, 1,
-0.9508947, -1.518131, -2.90191, 0, 0, 0, 1, 1,
-0.9486809, -1.546992, -1.062205, 0, 0, 0, 1, 1,
-0.9458109, 1.422513, -2.80687, 0, 0, 0, 1, 1,
-0.9453444, 0.02566544, -2.990443, 0, 0, 0, 1, 1,
-0.9378091, 1.504119, -0.8470825, 1, 1, 1, 1, 1,
-0.9365912, 1.172772, -1.03482, 1, 1, 1, 1, 1,
-0.936544, -1.204216, -2.155493, 1, 1, 1, 1, 1,
-0.9291451, -0.3111411, -1.234901, 1, 1, 1, 1, 1,
-0.9141272, -0.9692377, -4.133569, 1, 1, 1, 1, 1,
-0.9140715, -1.307569, -3.898769, 1, 1, 1, 1, 1,
-0.9075834, 0.8477754, 0.4206854, 1, 1, 1, 1, 1,
-0.9012574, 0.6389408, -1.332017, 1, 1, 1, 1, 1,
-0.8907848, 0.7307466, -2.502661, 1, 1, 1, 1, 1,
-0.8906447, 2.05336, -0.696614, 1, 1, 1, 1, 1,
-0.8857935, -1.734779, -2.253526, 1, 1, 1, 1, 1,
-0.8854167, -1.052273, -2.826138, 1, 1, 1, 1, 1,
-0.8837196, -0.1771327, -1.622792, 1, 1, 1, 1, 1,
-0.8745899, -0.7979214, -4.270243, 1, 1, 1, 1, 1,
-0.8659817, 1.819683, 1.157859, 1, 1, 1, 1, 1,
-0.8653707, -2.572987, 0.4910396, 0, 0, 1, 1, 1,
-0.8592842, -0.1050524, -0.6588889, 1, 0, 0, 1, 1,
-0.8499749, 1.590006, -1.247278, 1, 0, 0, 1, 1,
-0.8394114, 2.016489, -0.2198185, 1, 0, 0, 1, 1,
-0.8373175, -1.281654, -1.450965, 1, 0, 0, 1, 1,
-0.8362443, 1.331935, -1.183085, 1, 0, 0, 1, 1,
-0.8335497, 0.3033183, -0.683961, 0, 0, 0, 1, 1,
-0.8319228, 0.1282473, -0.9428365, 0, 0, 0, 1, 1,
-0.830129, -1.535314, -0.473184, 0, 0, 0, 1, 1,
-0.8293397, 1.228657, -2.072075, 0, 0, 0, 1, 1,
-0.8282152, -0.4227534, -1.087897, 0, 0, 0, 1, 1,
-0.822763, 0.1224763, -2.014166, 0, 0, 0, 1, 1,
-0.818671, 0.8311356, 0.5180345, 0, 0, 0, 1, 1,
-0.8174873, -0.4079869, -1.710044, 1, 1, 1, 1, 1,
-0.8160087, 1.168667, -1.419435, 1, 1, 1, 1, 1,
-0.8097661, 0.4378281, -2.476917, 1, 1, 1, 1, 1,
-0.8075659, -0.971251, -2.840124, 1, 1, 1, 1, 1,
-0.8064292, -0.6869437, -2.023077, 1, 1, 1, 1, 1,
-0.8048164, 0.4935339, -0.6133543, 1, 1, 1, 1, 1,
-0.8022548, -0.3417115, -1.418344, 1, 1, 1, 1, 1,
-0.8017211, -1.409041, -0.8140388, 1, 1, 1, 1, 1,
-0.8004767, 0.5200936, -1.792845, 1, 1, 1, 1, 1,
-0.790242, 1.627179, -1.830064, 1, 1, 1, 1, 1,
-0.7894158, -0.0671843, -0.7750844, 1, 1, 1, 1, 1,
-0.7890062, -1.031932, -4.912199, 1, 1, 1, 1, 1,
-0.7855673, 0.1520702, -0.2972387, 1, 1, 1, 1, 1,
-0.7822098, 0.5039452, -0.966378, 1, 1, 1, 1, 1,
-0.7798423, -0.2312112, -0.5881059, 1, 1, 1, 1, 1,
-0.7766681, 0.784597, 0.4881419, 0, 0, 1, 1, 1,
-0.7765539, -2.101723, -2.299326, 1, 0, 0, 1, 1,
-0.7699289, 1.764284, -0.9448963, 1, 0, 0, 1, 1,
-0.7694162, -0.6381739, -0.964012, 1, 0, 0, 1, 1,
-0.7693437, -1.978718, -2.585703, 1, 0, 0, 1, 1,
-0.7675152, -1.468904, -2.706826, 1, 0, 0, 1, 1,
-0.7633986, 1.023582, -1.776608, 0, 0, 0, 1, 1,
-0.7606594, 0.2993429, -0.8106779, 0, 0, 0, 1, 1,
-0.7601119, -0.5964293, -2.212805, 0, 0, 0, 1, 1,
-0.7543811, -0.6725909, -3.837047, 0, 0, 0, 1, 1,
-0.7484607, -0.1434585, -1.251096, 0, 0, 0, 1, 1,
-0.7459428, -1.310598, -1.672805, 0, 0, 0, 1, 1,
-0.7393407, -1.058317, -2.668244, 0, 0, 0, 1, 1,
-0.722966, 0.7759872, -0.2506634, 1, 1, 1, 1, 1,
-0.7190778, -0.4819608, -3.259258, 1, 1, 1, 1, 1,
-0.7178565, -0.7049353, -2.333447, 1, 1, 1, 1, 1,
-0.7140883, -1.109541, -2.891131, 1, 1, 1, 1, 1,
-0.7127818, 1.345473, -0.5550767, 1, 1, 1, 1, 1,
-0.7093036, -1.552681, -3.048073, 1, 1, 1, 1, 1,
-0.7080538, -0.7759519, -3.166143, 1, 1, 1, 1, 1,
-0.7067959, -0.4414176, -2.270294, 1, 1, 1, 1, 1,
-0.6990883, -0.01917069, -2.486023, 1, 1, 1, 1, 1,
-0.6978444, -1.937322, -2.304943, 1, 1, 1, 1, 1,
-0.6971419, 0.6526283, -0.2951068, 1, 1, 1, 1, 1,
-0.6969573, 0.2381252, -0.09917562, 1, 1, 1, 1, 1,
-0.6961269, 0.2210065, -1.745672, 1, 1, 1, 1, 1,
-0.6931775, -0.2207664, -1.597818, 1, 1, 1, 1, 1,
-0.6920601, -1.72633, -1.063295, 1, 1, 1, 1, 1,
-0.6848248, 1.48836, -0.3747024, 0, 0, 1, 1, 1,
-0.6840133, -1.116554, -2.529522, 1, 0, 0, 1, 1,
-0.6827407, -0.1941553, -1.962648, 1, 0, 0, 1, 1,
-0.6792012, 0.9681863, 0.4993022, 1, 0, 0, 1, 1,
-0.6780047, 1.809991, -1.958617, 1, 0, 0, 1, 1,
-0.6765313, -0.1575038, -2.003419, 1, 0, 0, 1, 1,
-0.6731931, -0.8385736, -1.177436, 0, 0, 0, 1, 1,
-0.6726915, -0.1339215, -1.527179, 0, 0, 0, 1, 1,
-0.6724535, 0.6704388, -1.439695, 0, 0, 0, 1, 1,
-0.6715796, -1.103309, -4.024104, 0, 0, 0, 1, 1,
-0.6701424, -0.8705925, -5.184186, 0, 0, 0, 1, 1,
-0.6691777, -1.329035, -4.124353, 0, 0, 0, 1, 1,
-0.6658607, 0.3442903, -1.326053, 0, 0, 0, 1, 1,
-0.6634896, -0.1277453, -1.43656, 1, 1, 1, 1, 1,
-0.6623852, -0.5333798, -3.97942, 1, 1, 1, 1, 1,
-0.6618193, 0.1745823, -1.623131, 1, 1, 1, 1, 1,
-0.6575354, 0.3718891, -3.407142, 1, 1, 1, 1, 1,
-0.6550553, 0.2723596, -2.709984, 1, 1, 1, 1, 1,
-0.6542543, 0.4437099, -1.752834, 1, 1, 1, 1, 1,
-0.6497372, 0.7650553, -0.4691251, 1, 1, 1, 1, 1,
-0.649143, 1.902949, -0.552489, 1, 1, 1, 1, 1,
-0.6491079, 1.706107, 0.6232011, 1, 1, 1, 1, 1,
-0.649014, -0.03278535, -1.212462, 1, 1, 1, 1, 1,
-0.6440248, -2.552037, -3.383958, 1, 1, 1, 1, 1,
-0.6433886, -0.5277696, -1.679783, 1, 1, 1, 1, 1,
-0.643223, 1.081949, 1.302568, 1, 1, 1, 1, 1,
-0.6411021, 0.8990058, -1.364968, 1, 1, 1, 1, 1,
-0.6407504, 1.50681, -1.464667, 1, 1, 1, 1, 1,
-0.6385027, -0.8388616, -3.47982, 0, 0, 1, 1, 1,
-0.6358406, -0.2563748, -1.297767, 1, 0, 0, 1, 1,
-0.6314095, -0.5231092, -1.051636, 1, 0, 0, 1, 1,
-0.6294039, 1.472481, -0.5911286, 1, 0, 0, 1, 1,
-0.6277056, -0.02704972, -1.116454, 1, 0, 0, 1, 1,
-0.6276106, 0.1992136, -0.1791461, 1, 0, 0, 1, 1,
-0.6254011, 0.651341, 0.8450567, 0, 0, 0, 1, 1,
-0.6249965, 0.485852, 0.4490992, 0, 0, 0, 1, 1,
-0.6167007, -1.562936, -1.287361, 0, 0, 0, 1, 1,
-0.616446, -0.183878, -2.721632, 0, 0, 0, 1, 1,
-0.6122564, -0.03863516, -0.194337, 0, 0, 0, 1, 1,
-0.6088935, 0.8661885, 1.137337, 0, 0, 0, 1, 1,
-0.6083806, -1.06585, -3.555596, 0, 0, 0, 1, 1,
-0.6078234, -1.148286, -2.709233, 1, 1, 1, 1, 1,
-0.6038275, 0.05290568, -2.571097, 1, 1, 1, 1, 1,
-0.6018156, 0.1711313, -1.515699, 1, 1, 1, 1, 1,
-0.5997083, 0.2747357, 0.2331826, 1, 1, 1, 1, 1,
-0.5994838, -0.7796209, -2.255115, 1, 1, 1, 1, 1,
-0.5920414, -0.5025207, -3.009336, 1, 1, 1, 1, 1,
-0.5896692, -1.572281, -4.029876, 1, 1, 1, 1, 1,
-0.5798231, 0.1737885, -1.138074, 1, 1, 1, 1, 1,
-0.5781767, 0.6810018, -2.946153, 1, 1, 1, 1, 1,
-0.5779871, 0.8123857, -1.797512, 1, 1, 1, 1, 1,
-0.5771684, 1.024012, -0.02203508, 1, 1, 1, 1, 1,
-0.5725331, -0.4427648, -2.423139, 1, 1, 1, 1, 1,
-0.5690324, 2.917658, -1.495399, 1, 1, 1, 1, 1,
-0.5666386, -1.539467, -0.5481842, 1, 1, 1, 1, 1,
-0.566247, 0.2585519, -1.288071, 1, 1, 1, 1, 1,
-0.5541648, -0.4844414, -0.5438271, 0, 0, 1, 1, 1,
-0.551129, 0.4235046, -0.5144874, 1, 0, 0, 1, 1,
-0.5493138, -1.434669, -3.351981, 1, 0, 0, 1, 1,
-0.5483534, 0.1913662, -3.073092, 1, 0, 0, 1, 1,
-0.5472936, -1.045817, -2.091269, 1, 0, 0, 1, 1,
-0.5410057, 1.515396, -0.5637015, 1, 0, 0, 1, 1,
-0.5395646, 0.8297206, 0.3542695, 0, 0, 0, 1, 1,
-0.5387974, 0.5146877, -0.7587153, 0, 0, 0, 1, 1,
-0.537941, 0.0645988, -1.921473, 0, 0, 0, 1, 1,
-0.5357398, -1.837429, -2.287035, 0, 0, 0, 1, 1,
-0.5341206, 0.3196559, -1.457788, 0, 0, 0, 1, 1,
-0.5302235, 0.6796481, 0.614498, 0, 0, 0, 1, 1,
-0.5283571, 0.5083058, -1.96202, 0, 0, 0, 1, 1,
-0.5277861, -0.748959, -3.69681, 1, 1, 1, 1, 1,
-0.5200713, -0.3415264, -1.202314, 1, 1, 1, 1, 1,
-0.518829, -2.635522, -1.979854, 1, 1, 1, 1, 1,
-0.5144275, 1.40371, -0.6665098, 1, 1, 1, 1, 1,
-0.5136759, 1.151807, -2.829665, 1, 1, 1, 1, 1,
-0.5134966, 0.3613294, -1.92986, 1, 1, 1, 1, 1,
-0.5090174, -0.2178365, 0.4720792, 1, 1, 1, 1, 1,
-0.5035635, -0.03060013, -0.3861313, 1, 1, 1, 1, 1,
-0.4979255, 1.205113, 0.3328361, 1, 1, 1, 1, 1,
-0.4961869, -0.906216, -1.311033, 1, 1, 1, 1, 1,
-0.4939934, 0.2179316, -1.307114, 1, 1, 1, 1, 1,
-0.4909755, -0.5994746, -2.671159, 1, 1, 1, 1, 1,
-0.4892181, -0.5627556, -0.4157949, 1, 1, 1, 1, 1,
-0.4868261, 0.5842254, -0.169691, 1, 1, 1, 1, 1,
-0.4833995, 1.65027, -0.739136, 1, 1, 1, 1, 1,
-0.4833332, 0.8011242, 0.5541579, 0, 0, 1, 1, 1,
-0.4811354, -0.003180961, -1.43175, 1, 0, 0, 1, 1,
-0.4701135, -2.085847, -1.227519, 1, 0, 0, 1, 1,
-0.469773, -0.2206305, -2.045407, 1, 0, 0, 1, 1,
-0.4685907, -0.5204912, -3.151392, 1, 0, 0, 1, 1,
-0.4659421, -2.177461, -3.738031, 1, 0, 0, 1, 1,
-0.4631473, 0.2854085, -1.873333, 0, 0, 0, 1, 1,
-0.463059, 0.4461717, -1.488632, 0, 0, 0, 1, 1,
-0.4628505, 1.099282, -0.4756368, 0, 0, 0, 1, 1,
-0.455064, 1.413889, -0.1113212, 0, 0, 0, 1, 1,
-0.4483508, -0.4723593, -3.043038, 0, 0, 0, 1, 1,
-0.4440426, 0.0006922238, -1.179741, 0, 0, 0, 1, 1,
-0.4431126, -1.449822, -2.323553, 0, 0, 0, 1, 1,
-0.4430081, 0.3382052, -1.356323, 1, 1, 1, 1, 1,
-0.4412476, 0.08671717, -2.805786, 1, 1, 1, 1, 1,
-0.4380746, -0.4706737, -3.364466, 1, 1, 1, 1, 1,
-0.434307, 0.08971751, -1.503795, 1, 1, 1, 1, 1,
-0.4340757, 0.664414, -1.440974, 1, 1, 1, 1, 1,
-0.4332405, -0.825209, -2.135548, 1, 1, 1, 1, 1,
-0.4259138, 1.032458, -0.3433957, 1, 1, 1, 1, 1,
-0.4220308, 0.02021028, -2.145183, 1, 1, 1, 1, 1,
-0.4213847, -0.02639419, -1.723902, 1, 1, 1, 1, 1,
-0.4177707, 0.2670078, -2.719719, 1, 1, 1, 1, 1,
-0.41766, -0.3450986, -2.625989, 1, 1, 1, 1, 1,
-0.4151668, -0.9727647, -3.167252, 1, 1, 1, 1, 1,
-0.4103978, 0.183908, -0.8066813, 1, 1, 1, 1, 1,
-0.4089017, -0.8048156, -2.918736, 1, 1, 1, 1, 1,
-0.4078222, -1.15094, -4.062686, 1, 1, 1, 1, 1,
-0.4051718, 0.006468199, -1.931503, 0, 0, 1, 1, 1,
-0.3966965, 0.3090219, -2.032947, 1, 0, 0, 1, 1,
-0.3900769, -0.4946255, -1.64296, 1, 0, 0, 1, 1,
-0.3891786, -0.1469445, -2.316288, 1, 0, 0, 1, 1,
-0.3881121, -0.2660822, -2.80493, 1, 0, 0, 1, 1,
-0.387642, 0.7870234, -1.514214, 1, 0, 0, 1, 1,
-0.3830769, -0.1416194, -1.375896, 0, 0, 0, 1, 1,
-0.3805933, 0.6566313, -0.914282, 0, 0, 0, 1, 1,
-0.3780223, 0.06250518, -0.9316738, 0, 0, 0, 1, 1,
-0.3769155, -0.7953857, -4.170795, 0, 0, 0, 1, 1,
-0.3750575, -0.8331476, -2.36857, 0, 0, 0, 1, 1,
-0.3731144, -1.36133, -2.442533, 0, 0, 0, 1, 1,
-0.3690784, -1.610774, -2.185554, 0, 0, 0, 1, 1,
-0.3534362, -0.3771344, -1.775845, 1, 1, 1, 1, 1,
-0.3424839, -0.4237619, -3.292483, 1, 1, 1, 1, 1,
-0.3410892, 0.4105636, -0.659507, 1, 1, 1, 1, 1,
-0.3369103, 1.253144, -0.7988626, 1, 1, 1, 1, 1,
-0.3358915, -0.6566406, -0.2449094, 1, 1, 1, 1, 1,
-0.3346995, 0.4012431, 0.1214777, 1, 1, 1, 1, 1,
-0.3313854, -1.205926, -3.12906, 1, 1, 1, 1, 1,
-0.3311522, -0.9496561, -3.499815, 1, 1, 1, 1, 1,
-0.3280741, -1.339294, -1.086205, 1, 1, 1, 1, 1,
-0.3279782, 0.00999765, -3.196616, 1, 1, 1, 1, 1,
-0.3261076, -1.307501, -3.337201, 1, 1, 1, 1, 1,
-0.3256621, 0.3788098, -0.8625822, 1, 1, 1, 1, 1,
-0.325563, -0.004063056, -2.190819, 1, 1, 1, 1, 1,
-0.3134496, -0.2896177, -2.896624, 1, 1, 1, 1, 1,
-0.3029694, -0.7216862, -2.269297, 1, 1, 1, 1, 1,
-0.3019487, -0.4926955, -2.615152, 0, 0, 1, 1, 1,
-0.2988948, 0.4804589, -0.9223054, 1, 0, 0, 1, 1,
-0.2987473, -0.1624656, -2.253154, 1, 0, 0, 1, 1,
-0.296227, -0.003228886, -2.668023, 1, 0, 0, 1, 1,
-0.2944691, -0.6853859, 0.3106669, 1, 0, 0, 1, 1,
-0.2917329, -0.462519, -4.030493, 1, 0, 0, 1, 1,
-0.2914254, 0.6443757, 0.170505, 0, 0, 0, 1, 1,
-0.2908807, -0.205977, -1.297208, 0, 0, 0, 1, 1,
-0.2896902, -0.1083694, -2.183279, 0, 0, 0, 1, 1,
-0.2889133, 0.4288559, -0.6474527, 0, 0, 0, 1, 1,
-0.288906, -0.4355007, -2.809988, 0, 0, 0, 1, 1,
-0.2868688, 0.1215033, -1.886798, 0, 0, 0, 1, 1,
-0.285035, 0.8542953, -0.8548503, 0, 0, 0, 1, 1,
-0.2779422, -0.7658555, -4.622244, 1, 1, 1, 1, 1,
-0.2728061, 0.5613673, -1.842025, 1, 1, 1, 1, 1,
-0.2685135, 0.3028594, -0.2935721, 1, 1, 1, 1, 1,
-0.2683676, -0.8206762, -3.931453, 1, 1, 1, 1, 1,
-0.2659181, 0.6953789, 0.3467773, 1, 1, 1, 1, 1,
-0.2643239, 0.4581158, 1.797992, 1, 1, 1, 1, 1,
-0.2640647, -0.07095802, -2.528442, 1, 1, 1, 1, 1,
-0.2588193, -1.966671, -1.976128, 1, 1, 1, 1, 1,
-0.2532172, 0.8548739, -1.408012, 1, 1, 1, 1, 1,
-0.2514974, 1.232625, -1.074034, 1, 1, 1, 1, 1,
-0.250879, 0.5398896, 0.3011256, 1, 1, 1, 1, 1,
-0.2466492, -0.1144609, -3.242759, 1, 1, 1, 1, 1,
-0.2401525, -0.3708736, -1.208033, 1, 1, 1, 1, 1,
-0.2388091, -0.09914236, -1.353058, 1, 1, 1, 1, 1,
-0.2387665, -0.9951055, -2.510588, 1, 1, 1, 1, 1,
-0.235834, -1.7404, -2.936007, 0, 0, 1, 1, 1,
-0.2329499, -1.354686, -2.583241, 1, 0, 0, 1, 1,
-0.2320466, 0.3576581, -0.08620151, 1, 0, 0, 1, 1,
-0.2243458, 0.8587357, 0.6834402, 1, 0, 0, 1, 1,
-0.2213092, 0.4383428, -0.8551115, 1, 0, 0, 1, 1,
-0.2205821, -0.1171342, -1.717246, 1, 0, 0, 1, 1,
-0.2187214, 0.5342022, -0.4246557, 0, 0, 0, 1, 1,
-0.2122103, 0.3202535, -2.287463, 0, 0, 0, 1, 1,
-0.2108921, 1.508756, -0.6519913, 0, 0, 0, 1, 1,
-0.2085625, 1.842807, 0.1572326, 0, 0, 0, 1, 1,
-0.2076211, -0.3940632, -0.9081003, 0, 0, 0, 1, 1,
-0.2042694, -0.9620878, -2.175281, 0, 0, 0, 1, 1,
-0.203366, 2.171857, -0.6783803, 0, 0, 0, 1, 1,
-0.2010313, 1.061405, -1.869673, 1, 1, 1, 1, 1,
-0.1956258, 1.640835, 0.02410682, 1, 1, 1, 1, 1,
-0.1928767, 0.3016421, -0.399642, 1, 1, 1, 1, 1,
-0.1927016, 0.4627931, 0.1623283, 1, 1, 1, 1, 1,
-0.1917364, -1.737605, -4.682203, 1, 1, 1, 1, 1,
-0.1906887, 1.952461, -0.482452, 1, 1, 1, 1, 1,
-0.1861427, 0.5461234, -1.645645, 1, 1, 1, 1, 1,
-0.1802642, 1.387796, -1.05456, 1, 1, 1, 1, 1,
-0.1797417, 0.7865971, -0.9572724, 1, 1, 1, 1, 1,
-0.1790242, 0.1638728, -2.442422, 1, 1, 1, 1, 1,
-0.1767084, -1.383879, -6.199562, 1, 1, 1, 1, 1,
-0.1746838, -0.3237595, -2.973817, 1, 1, 1, 1, 1,
-0.169629, 0.8833714, 1.411629, 1, 1, 1, 1, 1,
-0.169165, 0.6154069, -1.088807, 1, 1, 1, 1, 1,
-0.1643663, 2.634964, -0.004057764, 1, 1, 1, 1, 1,
-0.1617296, -0.2239042, -3.553577, 0, 0, 1, 1, 1,
-0.1597967, -1.121554, -3.484177, 1, 0, 0, 1, 1,
-0.1591129, -0.4473448, -1.977947, 1, 0, 0, 1, 1,
-0.1590711, -2.456175, -1.592945, 1, 0, 0, 1, 1,
-0.1539844, -0.5626964, -1.956876, 1, 0, 0, 1, 1,
-0.1539621, -1.548207, -2.72675, 1, 0, 0, 1, 1,
-0.1507506, -0.3597845, -0.41962, 0, 0, 0, 1, 1,
-0.1490888, 2.170318, -0.1138759, 0, 0, 0, 1, 1,
-0.1469881, 0.6222054, -0.7866039, 0, 0, 0, 1, 1,
-0.1429875, -0.07256263, -2.892514, 0, 0, 0, 1, 1,
-0.1407059, -0.4416316, -1.704546, 0, 0, 0, 1, 1,
-0.1379636, 0.2944842, -0.3935514, 0, 0, 0, 1, 1,
-0.1365434, -1.667295, -3.368304, 0, 0, 0, 1, 1,
-0.1360822, -0.1106995, -2.226228, 1, 1, 1, 1, 1,
-0.1347594, 0.3363349, 0.1462887, 1, 1, 1, 1, 1,
-0.1327599, 0.9480177, -0.9490775, 1, 1, 1, 1, 1,
-0.1292698, 1.536448, 1.285619, 1, 1, 1, 1, 1,
-0.1291358, -0.121857, -2.244509, 1, 1, 1, 1, 1,
-0.1264056, 0.7636392, 0.5347242, 1, 1, 1, 1, 1,
-0.1254284, -0.8771609, -3.290596, 1, 1, 1, 1, 1,
-0.1222145, -0.4541997, -4.118339, 1, 1, 1, 1, 1,
-0.1190616, 1.840679, -0.05280085, 1, 1, 1, 1, 1,
-0.1183666, -0.1748549, -3.803417, 1, 1, 1, 1, 1,
-0.1133751, 0.02140174, -1.602569, 1, 1, 1, 1, 1,
-0.1107948, 0.2963155, -1.511651, 1, 1, 1, 1, 1,
-0.1088883, 1.332019, 0.5717869, 1, 1, 1, 1, 1,
-0.1084102, 0.2242615, -0.5224353, 1, 1, 1, 1, 1,
-0.1071206, 1.003208, -0.2874371, 1, 1, 1, 1, 1,
-0.1041849, 1.269415, 0.6768741, 0, 0, 1, 1, 1,
-0.1017888, 0.189688, 1.14193, 1, 0, 0, 1, 1,
-0.09908119, 1.527626, 0.8432277, 1, 0, 0, 1, 1,
-0.09903787, -1.719006, -1.046948, 1, 0, 0, 1, 1,
-0.09722359, -0.7156669, -3.019702, 1, 0, 0, 1, 1,
-0.09698282, 0.8177958, -0.6185184, 1, 0, 0, 1, 1,
-0.09629497, -0.4101344, -1.668178, 0, 0, 0, 1, 1,
-0.09570982, 0.6083808, -1.125972, 0, 0, 0, 1, 1,
-0.09470651, 1.204483, -0.1708459, 0, 0, 0, 1, 1,
-0.09330815, 0.2287003, -0.9033929, 0, 0, 0, 1, 1,
-0.09293418, -0.6767744, -3.007432, 0, 0, 0, 1, 1,
-0.09237615, 2.976114, -0.8848121, 0, 0, 0, 1, 1,
-0.09052907, 0.009147963, -1.463113, 0, 0, 0, 1, 1,
-0.08743262, -0.9556996, -3.806868, 1, 1, 1, 1, 1,
-0.0871238, -0.258801, -2.383544, 1, 1, 1, 1, 1,
-0.08284485, 0.3022257, -1.42157, 1, 1, 1, 1, 1,
-0.08163133, 0.6730914, 1.081368, 1, 1, 1, 1, 1,
-0.07985588, -1.47327, -4.954751, 1, 1, 1, 1, 1,
-0.07851604, 0.01161926, -1.590287, 1, 1, 1, 1, 1,
-0.07809598, -1.238926, -2.089309, 1, 1, 1, 1, 1,
-0.07631153, -0.7294894, -3.936362, 1, 1, 1, 1, 1,
-0.07510327, 0.6679931, 2.943203, 1, 1, 1, 1, 1,
-0.07421239, 0.9268705, -0.3364136, 1, 1, 1, 1, 1,
-0.07341755, -0.01916737, -2.018032, 1, 1, 1, 1, 1,
-0.06978651, -0.6545455, -2.947086, 1, 1, 1, 1, 1,
-0.06936184, 0.7615187, 0.4353368, 1, 1, 1, 1, 1,
-0.06815896, 0.735414, 0.765887, 1, 1, 1, 1, 1,
-0.06562266, -1.093074, -3.209088, 1, 1, 1, 1, 1,
-0.06323319, 0.3896601, 1.081255, 0, 0, 1, 1, 1,
-0.06255522, -1.560006, -3.114418, 1, 0, 0, 1, 1,
-0.05019119, -0.114256, -2.761764, 1, 0, 0, 1, 1,
-0.04650435, 0.2123784, 0.1127467, 1, 0, 0, 1, 1,
-0.04241, 0.6246945, -1.31163, 1, 0, 0, 1, 1,
-0.04146662, -0.4553629, -2.096412, 1, 0, 0, 1, 1,
-0.0406577, 1.169609, 0.02872289, 0, 0, 0, 1, 1,
-0.04050154, 0.3813493, 0.6868488, 0, 0, 0, 1, 1,
-0.03888058, -0.04971831, -1.013587, 0, 0, 0, 1, 1,
-0.03147756, 0.1077011, -0.8068318, 0, 0, 0, 1, 1,
-0.03035532, 0.4655653, 0.004433641, 0, 0, 0, 1, 1,
-0.02174802, -1.232705, -2.241418, 0, 0, 0, 1, 1,
-0.01718706, -0.3693973, -1.840995, 0, 0, 0, 1, 1,
-0.01156192, 0.4212643, 0.8058144, 1, 1, 1, 1, 1,
-0.009345687, -0.3331282, -2.266241, 1, 1, 1, 1, 1,
-0.007621495, 1.553576, -0.1925094, 1, 1, 1, 1, 1,
-0.005349047, 1.201445, -1.740709, 1, 1, 1, 1, 1,
-0.005231385, 0.3351146, 1.603139, 1, 1, 1, 1, 1,
-0.00218823, 0.6142245, -1.577718, 1, 1, 1, 1, 1,
-0.0002671067, 3.433019, -1.215346, 1, 1, 1, 1, 1,
0.001642035, 0.389922, -0.4511623, 1, 1, 1, 1, 1,
0.01239611, 0.06881889, -0.9581404, 1, 1, 1, 1, 1,
0.0150658, 0.03994075, 0.2515663, 1, 1, 1, 1, 1,
0.01651184, -0.9515582, 3.062967, 1, 1, 1, 1, 1,
0.01920078, 1.08095, -1.252158, 1, 1, 1, 1, 1,
0.01979964, -0.4352023, 3.302895, 1, 1, 1, 1, 1,
0.02212992, 0.517267, 0.3541114, 1, 1, 1, 1, 1,
0.02541657, -0.59254, 1.444003, 1, 1, 1, 1, 1,
0.02881576, 0.4292368, 0.4672199, 0, 0, 1, 1, 1,
0.0317504, -0.2644657, 3.215514, 1, 0, 0, 1, 1,
0.03221812, 0.5968297, 1.41908, 1, 0, 0, 1, 1,
0.03999718, 1.236134, 0.3957293, 1, 0, 0, 1, 1,
0.04657551, 0.6138642, 0.4936033, 1, 0, 0, 1, 1,
0.05404276, 0.788559, -1.870433, 1, 0, 0, 1, 1,
0.05550491, -0.2901476, 2.420002, 0, 0, 0, 1, 1,
0.0567932, 0.4182206, 0.04311559, 0, 0, 0, 1, 1,
0.05734602, -0.5224378, 4.238218, 0, 0, 0, 1, 1,
0.05821754, 0.1114324, -0.1555734, 0, 0, 0, 1, 1,
0.05898602, -0.1154344, 0.953417, 0, 0, 0, 1, 1,
0.06249465, 0.3510903, 0.01903386, 0, 0, 0, 1, 1,
0.0636211, 1.879258, -0.8319407, 0, 0, 0, 1, 1,
0.06528247, -0.01707118, 1.946347, 1, 1, 1, 1, 1,
0.06778503, 1.217674, -0.3448334, 1, 1, 1, 1, 1,
0.07037297, 1.54263, 1.980542, 1, 1, 1, 1, 1,
0.07208348, 0.3009736, 0.1022503, 1, 1, 1, 1, 1,
0.07453179, -0.3487627, 1.30667, 1, 1, 1, 1, 1,
0.07477392, -2.362053, 2.18928, 1, 1, 1, 1, 1,
0.08093247, 0.6427414, -2.705004, 1, 1, 1, 1, 1,
0.08787484, -0.1181775, 1.519051, 1, 1, 1, 1, 1,
0.09026025, 0.505215, -0.3075072, 1, 1, 1, 1, 1,
0.09035365, -0.03573717, 1.553274, 1, 1, 1, 1, 1,
0.09088731, -1.110253, 2.668236, 1, 1, 1, 1, 1,
0.09192416, -0.5741395, 3.567948, 1, 1, 1, 1, 1,
0.09392712, 0.1249684, -0.8681256, 1, 1, 1, 1, 1,
0.09875226, 0.3677471, 1.382954, 1, 1, 1, 1, 1,
0.1017291, -0.1810879, 2.338175, 1, 1, 1, 1, 1,
0.109104, -0.7516578, 3.276902, 0, 0, 1, 1, 1,
0.1099257, -0.2759236, 2.242655, 1, 0, 0, 1, 1,
0.1127995, -0.006973554, 1.923207, 1, 0, 0, 1, 1,
0.1182316, -1.32386, 2.913193, 1, 0, 0, 1, 1,
0.1195653, 2.159471, 0.6012997, 1, 0, 0, 1, 1,
0.1207642, -0.84053, 4.217917, 1, 0, 0, 1, 1,
0.1219895, -0.1968583, 1.854936, 0, 0, 0, 1, 1,
0.1225842, 0.2077113, 1.272167, 0, 0, 0, 1, 1,
0.1229024, -0.9699339, 1.003811, 0, 0, 0, 1, 1,
0.1236782, 0.2753683, 0.1273626, 0, 0, 0, 1, 1,
0.1245931, 0.8583488, -0.4402325, 0, 0, 0, 1, 1,
0.12559, 1.313997, -0.006551981, 0, 0, 0, 1, 1,
0.1262242, -1.842637, 4.128172, 0, 0, 0, 1, 1,
0.1286171, -0.002089047, -0.6010804, 1, 1, 1, 1, 1,
0.1310221, -0.3767175, 1.346941, 1, 1, 1, 1, 1,
0.1351787, -0.7324183, 4.872357, 1, 1, 1, 1, 1,
0.1387359, -0.4189707, 2.960486, 1, 1, 1, 1, 1,
0.1397534, 0.3131577, -1.15037, 1, 1, 1, 1, 1,
0.1401233, 0.3482913, 1.462676, 1, 1, 1, 1, 1,
0.1414788, 0.7303122, -1.29643, 1, 1, 1, 1, 1,
0.1447221, 1.362089, 0.4414528, 1, 1, 1, 1, 1,
0.1453019, -0.9919261, 1.26155, 1, 1, 1, 1, 1,
0.1456536, -1.807451, 1.537087, 1, 1, 1, 1, 1,
0.1472744, -0.190156, 3.170432, 1, 1, 1, 1, 1,
0.1503704, -1.32902, 1.984715, 1, 1, 1, 1, 1,
0.1519662, -1.264757, 3.290341, 1, 1, 1, 1, 1,
0.1535189, 0.3465157, 0.6961738, 1, 1, 1, 1, 1,
0.1536406, 0.2904749, 3.058396, 1, 1, 1, 1, 1,
0.1546626, 1.045997, 0.3930137, 0, 0, 1, 1, 1,
0.160837, -0.2566106, 1.581678, 1, 0, 0, 1, 1,
0.1667784, -0.1600968, 2.641801, 1, 0, 0, 1, 1,
0.1697077, 0.2053047, 0.4850391, 1, 0, 0, 1, 1,
0.1724316, 0.9175035, 0.3669503, 1, 0, 0, 1, 1,
0.1767869, 1.315911, -2.647845, 1, 0, 0, 1, 1,
0.1770213, 0.9667677, -1.227142, 0, 0, 0, 1, 1,
0.1830589, 2.247638, 1.287387, 0, 0, 0, 1, 1,
0.1849461, -0.01112071, 0.8629856, 0, 0, 0, 1, 1,
0.1850019, -0.3919812, 3.143325, 0, 0, 0, 1, 1,
0.185179, 0.4715534, 1.235265, 0, 0, 0, 1, 1,
0.1862653, -0.8058772, 2.627771, 0, 0, 0, 1, 1,
0.1876535, -0.09732269, 2.445151, 0, 0, 0, 1, 1,
0.1906984, -0.3587159, 1.410196, 1, 1, 1, 1, 1,
0.1952552, 1.481691, 0.1171121, 1, 1, 1, 1, 1,
0.1968577, 0.1554973, 1.909354, 1, 1, 1, 1, 1,
0.198869, -0.2120423, 0.7620208, 1, 1, 1, 1, 1,
0.2003144, -0.9694231, 2.869551, 1, 1, 1, 1, 1,
0.2038727, 0.3432693, -1.070406, 1, 1, 1, 1, 1,
0.2083108, 0.7754523, 0.5593811, 1, 1, 1, 1, 1,
0.2158666, 0.9041808, 0.5046796, 1, 1, 1, 1, 1,
0.2202637, -1.718054, 3.513556, 1, 1, 1, 1, 1,
0.2223843, -0.5207563, 3.7304, 1, 1, 1, 1, 1,
0.2270968, -0.0353003, 1.712755, 1, 1, 1, 1, 1,
0.2319518, -0.1526207, 1.110086, 1, 1, 1, 1, 1,
0.2325443, 0.03015095, 1.529811, 1, 1, 1, 1, 1,
0.2430785, -0.3857928, 3.387558, 1, 1, 1, 1, 1,
0.2451832, 2.137359, 0.3333646, 1, 1, 1, 1, 1,
0.2459992, 2.274008, -0.8657252, 0, 0, 1, 1, 1,
0.2496074, -1.259893, 2.524751, 1, 0, 0, 1, 1,
0.2520255, -0.9295663, 3.027259, 1, 0, 0, 1, 1,
0.2527684, 0.3793219, 1.502586, 1, 0, 0, 1, 1,
0.2538507, 0.9543128, 1.196205, 1, 0, 0, 1, 1,
0.2573736, -0.5475667, 2.148028, 1, 0, 0, 1, 1,
0.2582633, 0.4160981, 1.780941, 0, 0, 0, 1, 1,
0.2658335, -0.3709418, 2.791912, 0, 0, 0, 1, 1,
0.2678591, -0.6431996, 2.262622, 0, 0, 0, 1, 1,
0.272998, -1.424522, 2.078837, 0, 0, 0, 1, 1,
0.2814697, 1.217911, 0.4291073, 0, 0, 0, 1, 1,
0.2815898, 1.096387, -0.7737927, 0, 0, 0, 1, 1,
0.2831183, -1.251487, 2.636228, 0, 0, 0, 1, 1,
0.2831864, -1.120765, 2.235253, 1, 1, 1, 1, 1,
0.2842243, -0.9439821, 3.231684, 1, 1, 1, 1, 1,
0.2843567, -0.2889569, 1.641392, 1, 1, 1, 1, 1,
0.2888411, 0.4334701, 0.3673404, 1, 1, 1, 1, 1,
0.2914162, 0.6962085, 0.7705961, 1, 1, 1, 1, 1,
0.3005215, 1.022783, 1.353299, 1, 1, 1, 1, 1,
0.3023973, 0.04923308, 2.530717, 1, 1, 1, 1, 1,
0.3034121, 1.514287, -0.865707, 1, 1, 1, 1, 1,
0.3059066, 0.1775731, 0.8947603, 1, 1, 1, 1, 1,
0.3061329, -0.106869, 1.51458, 1, 1, 1, 1, 1,
0.3085552, 0.6162189, 0.7248836, 1, 1, 1, 1, 1,
0.3087711, 0.7119449, 0.7218741, 1, 1, 1, 1, 1,
0.3100472, 1.496366, 1.099231, 1, 1, 1, 1, 1,
0.3118098, 1.458443, 0.3733705, 1, 1, 1, 1, 1,
0.3173471, 1.260461, 0.5714089, 1, 1, 1, 1, 1,
0.3182968, 1.466088, 1.049688, 0, 0, 1, 1, 1,
0.3185156, -1.63738, 1.372641, 1, 0, 0, 1, 1,
0.3217123, -0.8978511, 1.486451, 1, 0, 0, 1, 1,
0.3235951, 0.9752487, 0.520636, 1, 0, 0, 1, 1,
0.3255411, -0.09891002, 3.135731, 1, 0, 0, 1, 1,
0.3269242, 0.5727091, 1.917889, 1, 0, 0, 1, 1,
0.3285003, 0.3946422, 0.6752174, 0, 0, 0, 1, 1,
0.3311304, 0.7109522, 0.8820902, 0, 0, 0, 1, 1,
0.3341321, -0.1997098, 3.468883, 0, 0, 0, 1, 1,
0.3344379, 0.2631685, -1.040634, 0, 0, 0, 1, 1,
0.3364745, 0.3916862, 0.130411, 0, 0, 0, 1, 1,
0.3454014, -0.5730685, 2.602362, 0, 0, 0, 1, 1,
0.3549004, -0.9724173, 2.666877, 0, 0, 0, 1, 1,
0.3563316, -1.051494, 4.015116, 1, 1, 1, 1, 1,
0.3591956, -0.1987928, 1.004533, 1, 1, 1, 1, 1,
0.3662107, -0.5966909, 4.524959, 1, 1, 1, 1, 1,
0.3688548, -0.1052788, 1.538081, 1, 1, 1, 1, 1,
0.3723873, -0.8643898, 3.221804, 1, 1, 1, 1, 1,
0.3726687, 0.004040529, 3.080157, 1, 1, 1, 1, 1,
0.3727232, -2.290317, 2.916188, 1, 1, 1, 1, 1,
0.3742146, 0.4006462, 1.29179, 1, 1, 1, 1, 1,
0.3758442, 0.5041791, 1.301049, 1, 1, 1, 1, 1,
0.3764771, 1.351945, 0.04948813, 1, 1, 1, 1, 1,
0.3771145, 0.4410307, -0.3668396, 1, 1, 1, 1, 1,
0.3775702, -1.937347, 2.171261, 1, 1, 1, 1, 1,
0.3780825, 0.239385, 0.5905187, 1, 1, 1, 1, 1,
0.3843281, -0.694534, 3.495875, 1, 1, 1, 1, 1,
0.3857043, 0.2374214, 1.047205, 1, 1, 1, 1, 1,
0.3872901, 0.5351588, 0.02899351, 0, 0, 1, 1, 1,
0.3991962, -0.4302566, 2.409132, 1, 0, 0, 1, 1,
0.4012454, -1.126315, 3.041494, 1, 0, 0, 1, 1,
0.4034672, 0.4605086, -1.110157, 1, 0, 0, 1, 1,
0.4055804, 0.8017, -1.151385, 1, 0, 0, 1, 1,
0.4059407, 0.3890598, 2.262105, 1, 0, 0, 1, 1,
0.407351, -1.50753, 2.268147, 0, 0, 0, 1, 1,
0.4106939, -1.189109, 2.967258, 0, 0, 0, 1, 1,
0.4128042, 2.113711, -0.743144, 0, 0, 0, 1, 1,
0.4137934, -0.05614266, 1.414198, 0, 0, 0, 1, 1,
0.4189525, -0.7718692, 4.002624, 0, 0, 0, 1, 1,
0.4190528, 1.156394, 1.463171, 0, 0, 0, 1, 1,
0.4194825, -0.3104257, 3.830162, 0, 0, 0, 1, 1,
0.4239897, 0.2074683, -0.2652655, 1, 1, 1, 1, 1,
0.4294069, 0.2160042, 1.287367, 1, 1, 1, 1, 1,
0.4299835, 1.123916, -0.8794002, 1, 1, 1, 1, 1,
0.432603, 1.189746, 0.5102449, 1, 1, 1, 1, 1,
0.4346507, -0.7386768, 3.165412, 1, 1, 1, 1, 1,
0.4347183, -0.3004154, 3.614476, 1, 1, 1, 1, 1,
0.4350577, 0.9798866, -0.6108408, 1, 1, 1, 1, 1,
0.4385858, 1.093146, -0.03366888, 1, 1, 1, 1, 1,
0.4413897, -0.6310868, 2.705635, 1, 1, 1, 1, 1,
0.4418859, -1.175578, 1.772437, 1, 1, 1, 1, 1,
0.4419065, 0.1967219, 0.2033888, 1, 1, 1, 1, 1,
0.4434592, 0.355155, -0.8256112, 1, 1, 1, 1, 1,
0.4438819, -0.6597045, 2.474648, 1, 1, 1, 1, 1,
0.4452116, 0.4777192, 1.10196, 1, 1, 1, 1, 1,
0.4466681, -0.6348079, 3.986628, 1, 1, 1, 1, 1,
0.447657, 1.067111, 1.956362, 0, 0, 1, 1, 1,
0.447932, 1.926454, 2.097384, 1, 0, 0, 1, 1,
0.455062, 1.054475, 0.1223516, 1, 0, 0, 1, 1,
0.4569239, 2.080942, 0.3715792, 1, 0, 0, 1, 1,
0.4578937, 0.4126699, 2.210341, 1, 0, 0, 1, 1,
0.4584464, 1.448606, -0.8278067, 1, 0, 0, 1, 1,
0.4684319, 1.239988, 1.457491, 0, 0, 0, 1, 1,
0.4686556, 0.4806635, 1.093415, 0, 0, 0, 1, 1,
0.4711987, -0.7913206, 2.530172, 0, 0, 0, 1, 1,
0.4745002, -0.8164592, 4.017057, 0, 0, 0, 1, 1,
0.4784926, 0.2475174, 0.0007553714, 0, 0, 0, 1, 1,
0.4830669, 0.04270621, 2.121421, 0, 0, 0, 1, 1,
0.4967614, -0.8704057, 1.503499, 0, 0, 0, 1, 1,
0.5011796, -0.8456827, 4.423206, 1, 1, 1, 1, 1,
0.5020176, 0.2629896, 0.9057379, 1, 1, 1, 1, 1,
0.5071845, 1.182433, -0.1537193, 1, 1, 1, 1, 1,
0.5097345, -1.803978, 3.24548, 1, 1, 1, 1, 1,
0.5102133, -1.971807, 4.801241, 1, 1, 1, 1, 1,
0.5108213, -2.414756, 2.211734, 1, 1, 1, 1, 1,
0.5118536, -0.2073267, 1.062766, 1, 1, 1, 1, 1,
0.5160968, 2.157479, 0.9409432, 1, 1, 1, 1, 1,
0.5199418, -0.6513931, 0.3574102, 1, 1, 1, 1, 1,
0.5202408, 0.8358219, 0.3917046, 1, 1, 1, 1, 1,
0.523042, -1.705529, 3.294769, 1, 1, 1, 1, 1,
0.5238665, 1.169573, 1.039137, 1, 1, 1, 1, 1,
0.5274988, 0.1340223, 1.274657, 1, 1, 1, 1, 1,
0.5278547, 0.7072017, 1.622103, 1, 1, 1, 1, 1,
0.5291897, -2.001636, 3.530977, 1, 1, 1, 1, 1,
0.5298059, -1.402988, 1.710243, 0, 0, 1, 1, 1,
0.530075, -0.3847226, -0.4907281, 1, 0, 0, 1, 1,
0.5334545, -2.013193, 3.04055, 1, 0, 0, 1, 1,
0.5367408, 1.767359, -0.3302369, 1, 0, 0, 1, 1,
0.5414453, -0.6099729, 1.910137, 1, 0, 0, 1, 1,
0.5472771, 0.029304, 0.6688426, 1, 0, 0, 1, 1,
0.5494632, -0.3777571, 1.428273, 0, 0, 0, 1, 1,
0.5640091, -0.4482218, 1.47106, 0, 0, 0, 1, 1,
0.5644998, 0.631347, 0.3983707, 0, 0, 0, 1, 1,
0.5645977, -1.275745, 5.411435, 0, 0, 0, 1, 1,
0.5652421, 0.5325497, 0.9055274, 0, 0, 0, 1, 1,
0.5659319, 0.2627918, 0.3746195, 0, 0, 0, 1, 1,
0.5815497, -1.587648, 3.491222, 0, 0, 0, 1, 1,
0.5823032, 0.1807245, 2.014953, 1, 1, 1, 1, 1,
0.5880536, 0.05401166, 1.478382, 1, 1, 1, 1, 1,
0.5922269, -0.6128803, 2.306077, 1, 1, 1, 1, 1,
0.5927979, 0.3567465, 2.792147, 1, 1, 1, 1, 1,
0.5968428, 1.013655, 1.742678, 1, 1, 1, 1, 1,
0.6006462, 1.922337, 2.442781, 1, 1, 1, 1, 1,
0.6008197, 1.415608, 2.01607, 1, 1, 1, 1, 1,
0.6044453, -1.509686, 1.760493, 1, 1, 1, 1, 1,
0.6045591, 0.9846465, 0.0543742, 1, 1, 1, 1, 1,
0.6053535, -0.4507017, 2.775217, 1, 1, 1, 1, 1,
0.6128573, 0.4740842, 2.363157, 1, 1, 1, 1, 1,
0.6130127, -1.859306, -0.3408195, 1, 1, 1, 1, 1,
0.6137115, -2.370079, 2.436159, 1, 1, 1, 1, 1,
0.6218113, 1.085401, -0.8329747, 1, 1, 1, 1, 1,
0.6236287, 0.3028356, 0.1717081, 1, 1, 1, 1, 1,
0.6286769, -0.8276865, 2.181039, 0, 0, 1, 1, 1,
0.6307107, -0.3521454, 3.060983, 1, 0, 0, 1, 1,
0.6413956, 0.04929861, 2.456217, 1, 0, 0, 1, 1,
0.6417973, 0.04609793, -1.035476, 1, 0, 0, 1, 1,
0.6443482, -2.013521, 2.073658, 1, 0, 0, 1, 1,
0.645981, -1.072592, 4.48527, 1, 0, 0, 1, 1,
0.6557401, 0.7903141, 1.17396, 0, 0, 0, 1, 1,
0.6574808, -1.289588, 0.9169829, 0, 0, 0, 1, 1,
0.6590371, -1.235978, 2.936193, 0, 0, 0, 1, 1,
0.6595813, -0.9230758, 2.417421, 0, 0, 0, 1, 1,
0.6637007, -0.1554716, 1.681621, 0, 0, 0, 1, 1,
0.6661704, 0.5640225, 1.008396, 0, 0, 0, 1, 1,
0.6706349, -0.1207523, -0.134007, 0, 0, 0, 1, 1,
0.6717877, 0.5433159, 1.350352, 1, 1, 1, 1, 1,
0.6968443, -0.7286052, 2.438126, 1, 1, 1, 1, 1,
0.6971191, 0.6769301, 0.03524991, 1, 1, 1, 1, 1,
0.6991414, 0.08291105, 0.5190265, 1, 1, 1, 1, 1,
0.7005746, 1.386207, 0.3583108, 1, 1, 1, 1, 1,
0.7039749, 1.016645, 1.415572, 1, 1, 1, 1, 1,
0.7088441, 1.476878, -0.894032, 1, 1, 1, 1, 1,
0.7115737, 1.061095, 0.4710843, 1, 1, 1, 1, 1,
0.7147118, -1.584639, 2.305573, 1, 1, 1, 1, 1,
0.7154402, 0.07837122, 1.331572, 1, 1, 1, 1, 1,
0.7180316, -1.11037, 2.608944, 1, 1, 1, 1, 1,
0.7297009, -1.107071, 2.695398, 1, 1, 1, 1, 1,
0.7326029, -0.6158996, 2.792389, 1, 1, 1, 1, 1,
0.7342038, 0.4784241, 1.518926, 1, 1, 1, 1, 1,
0.7363236, 1.872495, 1.299754, 1, 1, 1, 1, 1,
0.7363687, -1.264433, 2.484071, 0, 0, 1, 1, 1,
0.7395235, 0.5349178, 1.949247, 1, 0, 0, 1, 1,
0.7410285, -0.7999927, 2.164473, 1, 0, 0, 1, 1,
0.7481089, -0.8512218, 0.8301809, 1, 0, 0, 1, 1,
0.7482721, 0.1964587, 0.5572904, 1, 0, 0, 1, 1,
0.7483127, -0.990732, 2.358241, 1, 0, 0, 1, 1,
0.7504616, 0.621102, 2.465213, 0, 0, 0, 1, 1,
0.753556, -2.276785, 4.134849, 0, 0, 0, 1, 1,
0.7583908, 1.225548, -0.6542259, 0, 0, 0, 1, 1,
0.760423, -1.710122, 4.351727, 0, 0, 0, 1, 1,
0.7696799, -1.282749, 1.264343, 0, 0, 0, 1, 1,
0.7704148, 0.5669948, 1.273469, 0, 0, 0, 1, 1,
0.7797052, 0.6060043, 0.5308641, 0, 0, 0, 1, 1,
0.7799045, -0.876673, 4.941532, 1, 1, 1, 1, 1,
0.7813034, -1.855003, 3.934168, 1, 1, 1, 1, 1,
0.7833773, -0.3762528, 0.6303126, 1, 1, 1, 1, 1,
0.7834519, -0.4076292, 0.1772682, 1, 1, 1, 1, 1,
0.7885001, -0.5499403, 3.685601, 1, 1, 1, 1, 1,
0.7889699, -0.542395, 3.403126, 1, 1, 1, 1, 1,
0.7895243, 0.3316435, 4.048048, 1, 1, 1, 1, 1,
0.7934731, 1.226998, 1.498643, 1, 1, 1, 1, 1,
0.7964617, -0.9077998, 0.4652282, 1, 1, 1, 1, 1,
0.8068051, 0.7866957, 0.2409645, 1, 1, 1, 1, 1,
0.81291, -1.082236, 1.397057, 1, 1, 1, 1, 1,
0.8148717, -0.1412678, 0.06129905, 1, 1, 1, 1, 1,
0.8238705, 0.1805151, 0.7135407, 1, 1, 1, 1, 1,
0.8405012, -1.71808, 4.654124, 1, 1, 1, 1, 1,
0.8406286, -0.3807498, 0.6654863, 1, 1, 1, 1, 1,
0.8407506, 0.4555934, 2.015979, 0, 0, 1, 1, 1,
0.8433089, -0.4839801, 0.9240414, 1, 0, 0, 1, 1,
0.8439879, 0.4714255, 0.4787696, 1, 0, 0, 1, 1,
0.8448026, -0.9843396, 1.733403, 1, 0, 0, 1, 1,
0.8458427, -0.07155817, 1.935183, 1, 0, 0, 1, 1,
0.8603294, -0.1105839, 2.776308, 1, 0, 0, 1, 1,
0.8612354, 0.1246547, 2.229616, 0, 0, 0, 1, 1,
0.8617874, 0.6250339, 1.989562, 0, 0, 0, 1, 1,
0.8638603, -0.4267147, 2.27968, 0, 0, 0, 1, 1,
0.8663749, 1.344783, 0.5033579, 0, 0, 0, 1, 1,
0.8720531, -2.123003, 2.514733, 0, 0, 0, 1, 1,
0.8734113, -0.627468, 2.774976, 0, 0, 0, 1, 1,
0.878414, -1.705055, 2.925966, 0, 0, 0, 1, 1,
0.8797241, -1.714584, 1.731597, 1, 1, 1, 1, 1,
0.8867107, 0.8166768, 0.2464942, 1, 1, 1, 1, 1,
0.8939124, -0.7129212, 2.146852, 1, 1, 1, 1, 1,
0.8979346, 0.3006264, 1.178118, 1, 1, 1, 1, 1,
0.9064817, -1.095601, 1.35982, 1, 1, 1, 1, 1,
0.9127619, -0.416532, 1.623469, 1, 1, 1, 1, 1,
0.9131577, 1.566127, 2.000687, 1, 1, 1, 1, 1,
0.9151551, -1.045829, 2.927362, 1, 1, 1, 1, 1,
0.9167148, 1.946664, 2.281964, 1, 1, 1, 1, 1,
0.9205409, -0.3061907, 1.041951, 1, 1, 1, 1, 1,
0.9219913, 1.052041, 0.736569, 1, 1, 1, 1, 1,
0.9225876, 0.051048, 1.905307, 1, 1, 1, 1, 1,
0.9227886, 0.4187501, -1.076237, 1, 1, 1, 1, 1,
0.9281608, -0.9239796, 2.935093, 1, 1, 1, 1, 1,
0.9337994, 0.4573497, 0.766206, 1, 1, 1, 1, 1,
0.9354382, -0.02991479, 2.995526, 0, 0, 1, 1, 1,
0.9374403, 0.06744418, 1.04728, 1, 0, 0, 1, 1,
0.9379742, 0.1464744, 1.585442, 1, 0, 0, 1, 1,
0.9401645, 1.769107, -1.767339, 1, 0, 0, 1, 1,
0.940237, -0.06879253, 3.36003, 1, 0, 0, 1, 1,
0.9410188, -0.1023791, 2.270188, 1, 0, 0, 1, 1,
0.9438427, -0.3448002, 1.17802, 0, 0, 0, 1, 1,
0.9442622, -1.012121, 3.557656, 0, 0, 0, 1, 1,
0.9453878, 0.7647758, 1.755645, 0, 0, 0, 1, 1,
0.9568832, -0.6196772, 1.177019, 0, 0, 0, 1, 1,
0.9586156, 1.139988, 1.738316, 0, 0, 0, 1, 1,
0.9595937, 0.9215453, 0.2090977, 0, 0, 0, 1, 1,
0.9635064, 0.7224823, 1.122416, 0, 0, 0, 1, 1,
0.9641643, -0.1374554, 1.569001, 1, 1, 1, 1, 1,
0.9688295, 0.9203514, 0.9987812, 1, 1, 1, 1, 1,
0.9707146, 0.1974932, 0.1252726, 1, 1, 1, 1, 1,
0.9709752, -0.01291708, -0.05457948, 1, 1, 1, 1, 1,
0.9751169, 0.08662472, 1.321517, 1, 1, 1, 1, 1,
0.9827846, 0.8029515, 0.3210686, 1, 1, 1, 1, 1,
0.9857488, 1.034631, 0.6375195, 1, 1, 1, 1, 1,
0.9866971, -0.6198574, 1.496804, 1, 1, 1, 1, 1,
0.9902955, -0.1292299, 2.72677, 1, 1, 1, 1, 1,
0.9968688, -0.09451034, 0.5907624, 1, 1, 1, 1, 1,
1.002481, -1.561005, 3.518061, 1, 1, 1, 1, 1,
1.011574, -1.136457, 0.849768, 1, 1, 1, 1, 1,
1.012269, -0.4291964, 1.877923, 1, 1, 1, 1, 1,
1.01254, 0.6454467, -0.3736637, 1, 1, 1, 1, 1,
1.020797, 0.8872615, 0.8402162, 1, 1, 1, 1, 1,
1.024473, 2.740477, 0.7978179, 0, 0, 1, 1, 1,
1.027823, 0.360682, 0.4129397, 1, 0, 0, 1, 1,
1.031369, 0.9867275, 1.77195, 1, 0, 0, 1, 1,
1.037575, 3.794425, 1.723529, 1, 0, 0, 1, 1,
1.044533, 0.5058018, -0.6977782, 1, 0, 0, 1, 1,
1.057788, 0.250748, 2.770712, 1, 0, 0, 1, 1,
1.062933, 1.104437, 0.9011282, 0, 0, 0, 1, 1,
1.066408, -0.8977295, 3.984087, 0, 0, 0, 1, 1,
1.069362, -0.8287456, 3.594149, 0, 0, 0, 1, 1,
1.071946, 0.6670155, 1.0094, 0, 0, 0, 1, 1,
1.075402, -0.0664009, 1.919064, 0, 0, 0, 1, 1,
1.076434, -0.1340301, 2.314764, 0, 0, 0, 1, 1,
1.083348, 0.8483661, 1.122187, 0, 0, 0, 1, 1,
1.087936, -0.1023081, 0.6002007, 1, 1, 1, 1, 1,
1.091094, -0.7422172, 2.777101, 1, 1, 1, 1, 1,
1.095153, -1.47057, 2.954562, 1, 1, 1, 1, 1,
1.096229, -1.50691, 2.631474, 1, 1, 1, 1, 1,
1.100002, 1.237695, 0.008459464, 1, 1, 1, 1, 1,
1.11032, 0.01221266, 2.619519, 1, 1, 1, 1, 1,
1.128308, -0.1904873, 0.5689867, 1, 1, 1, 1, 1,
1.130697, -1.256855, 0.7918466, 1, 1, 1, 1, 1,
1.13546, -1.498034, 3.414725, 1, 1, 1, 1, 1,
1.136623, 0.3086063, 1.672213, 1, 1, 1, 1, 1,
1.148809, 0.5766536, 1.200969, 1, 1, 1, 1, 1,
1.151153, 0.0003137768, 1.776628, 1, 1, 1, 1, 1,
1.151449, 1.347639, 0.6673121, 1, 1, 1, 1, 1,
1.159569, -0.7236408, 1.70173, 1, 1, 1, 1, 1,
1.179749, 0.3460025, -0.04751386, 1, 1, 1, 1, 1,
1.181852, 0.4549634, 1.918242, 0, 0, 1, 1, 1,
1.182612, -0.1700598, 3.393766, 1, 0, 0, 1, 1,
1.184337, 1.219007, 2.511322, 1, 0, 0, 1, 1,
1.190101, -0.4650976, 3.941476, 1, 0, 0, 1, 1,
1.197786, 0.02097107, 2.487472, 1, 0, 0, 1, 1,
1.209561, -0.369607, 3.117611, 1, 0, 0, 1, 1,
1.209772, -0.7572752, 2.852754, 0, 0, 0, 1, 1,
1.211901, -0.9474352, 1.211798, 0, 0, 0, 1, 1,
1.228501, -0.266705, 1.854283, 0, 0, 0, 1, 1,
1.243151, -1.608289, 2.312825, 0, 0, 0, 1, 1,
1.243227, 1.038084, 1.537018, 0, 0, 0, 1, 1,
1.243558, 0.774734, 0.8352761, 0, 0, 0, 1, 1,
1.256185, -1.3984, 1.937993, 0, 0, 0, 1, 1,
1.262659, -0.7481194, 3.090391, 1, 1, 1, 1, 1,
1.281145, 1.283825, 1.513711, 1, 1, 1, 1, 1,
1.282176, -0.6036137, 0.9935905, 1, 1, 1, 1, 1,
1.282526, -0.6594667, 1.931053, 1, 1, 1, 1, 1,
1.284849, -0.6396641, 1.224458, 1, 1, 1, 1, 1,
1.296581, 1.098782, 1.525317, 1, 1, 1, 1, 1,
1.299854, -0.4305962, 0.03638335, 1, 1, 1, 1, 1,
1.310051, 0.09550337, 1.18849, 1, 1, 1, 1, 1,
1.316496, -1.619666, 2.054664, 1, 1, 1, 1, 1,
1.323586, -0.4843499, 1.481998, 1, 1, 1, 1, 1,
1.32467, 0.3389929, 2.226826, 1, 1, 1, 1, 1,
1.325801, -0.9822887, 2.503295, 1, 1, 1, 1, 1,
1.329074, 0.6377354, 0.2510489, 1, 1, 1, 1, 1,
1.330006, -0.7115886, 1.735888, 1, 1, 1, 1, 1,
1.336704, -0.640781, 3.209144, 1, 1, 1, 1, 1,
1.343603, 0.3352341, 2.690863, 0, 0, 1, 1, 1,
1.350449, -0.6316558, 1.704724, 1, 0, 0, 1, 1,
1.360227, 0.05286756, 1.919404, 1, 0, 0, 1, 1,
1.366542, 2.14212, -0.1722209, 1, 0, 0, 1, 1,
1.370675, 0.2291934, -0.2069203, 1, 0, 0, 1, 1,
1.371361, -0.0862027, 3.472929, 1, 0, 0, 1, 1,
1.372739, -2.17873, 2.012599, 0, 0, 0, 1, 1,
1.376554, -0.4406376, 2.145138, 0, 0, 0, 1, 1,
1.383545, 0.5977275, 2.229243, 0, 0, 0, 1, 1,
1.389458, -0.05131328, 1.898301, 0, 0, 0, 1, 1,
1.396837, -2.034153, 3.493895, 0, 0, 0, 1, 1,
1.416357, 1.613926, 0.2063904, 0, 0, 0, 1, 1,
1.421745, 1.493058, 3.167924, 0, 0, 0, 1, 1,
1.432029, 1.914309, -0.6867849, 1, 1, 1, 1, 1,
1.440341, -1.455051, 1.843622, 1, 1, 1, 1, 1,
1.448708, 0.4858576, 0.8330265, 1, 1, 1, 1, 1,
1.455517, 0.5932867, 3.083415, 1, 1, 1, 1, 1,
1.455739, -0.2263941, 0.6842614, 1, 1, 1, 1, 1,
1.457823, 0.6630232, 0.111829, 1, 1, 1, 1, 1,
1.46014, 1.422274, 1.19498, 1, 1, 1, 1, 1,
1.470007, -1.533601, 2.654831, 1, 1, 1, 1, 1,
1.47677, 0.3550643, 0.7955124, 1, 1, 1, 1, 1,
1.482298, 1.180095, 2.087694, 1, 1, 1, 1, 1,
1.488936, 2.282401, -0.2456136, 1, 1, 1, 1, 1,
1.512792, 0.03623674, 2.260098, 1, 1, 1, 1, 1,
1.515668, -2.05018, 4.225559, 1, 1, 1, 1, 1,
1.515896, 0.3446765, 2.667725, 1, 1, 1, 1, 1,
1.530325, 1.263208, 0.5847681, 1, 1, 1, 1, 1,
1.537421, 0.7929639, 1.074215, 0, 0, 1, 1, 1,
1.54306, -0.1536783, 1.038645, 1, 0, 0, 1, 1,
1.556048, 0.1834134, 1.093367, 1, 0, 0, 1, 1,
1.558624, -0.1600376, 2.588793, 1, 0, 0, 1, 1,
1.559002, 1.328087, -1.066134, 1, 0, 0, 1, 1,
1.559366, -0.07545172, 1.336971, 1, 0, 0, 1, 1,
1.56085, -0.6645681, 0.2526265, 0, 0, 0, 1, 1,
1.566553, -0.7681605, 0.1773163, 0, 0, 0, 1, 1,
1.591599, 0.8126025, -0.01778608, 0, 0, 0, 1, 1,
1.60193, 1.23618, -0.6884024, 0, 0, 0, 1, 1,
1.62095, -0.4393794, 0.5950524, 0, 0, 0, 1, 1,
1.634545, -0.9761179, 0.57933, 0, 0, 0, 1, 1,
1.649031, 0.4841364, 2.03704, 0, 0, 0, 1, 1,
1.660713, 0.05679145, 0.1972339, 1, 1, 1, 1, 1,
1.672335, 1.066149, 1.583707, 1, 1, 1, 1, 1,
1.683824, -0.5400382, 2.208912, 1, 1, 1, 1, 1,
1.687466, 0.3013327, 1.687348, 1, 1, 1, 1, 1,
1.741406, 0.709056, 2.323725, 1, 1, 1, 1, 1,
1.75214, -1.674607, 1.36939, 1, 1, 1, 1, 1,
1.790472, 0.9723185, 2.921232, 1, 1, 1, 1, 1,
1.79048, -0.01812313, 1.647386, 1, 1, 1, 1, 1,
1.791666, 0.02434018, 0.3704686, 1, 1, 1, 1, 1,
1.799693, 1.613945, 2.164727, 1, 1, 1, 1, 1,
1.819963, 0.8441902, 1.491056, 1, 1, 1, 1, 1,
1.822581, 0.04527725, 1.0785, 1, 1, 1, 1, 1,
1.830645, -0.4971135, 1.462571, 1, 1, 1, 1, 1,
1.841765, -0.7596561, 2.111832, 1, 1, 1, 1, 1,
1.842693, -1.436074, 2.652827, 1, 1, 1, 1, 1,
1.855665, -0.409035, 2.950975, 0, 0, 1, 1, 1,
1.878362, -1.598157, 2.226767, 1, 0, 0, 1, 1,
1.883399, 0.9495252, 1.056826, 1, 0, 0, 1, 1,
1.915371, 0.559082, -0.01543579, 1, 0, 0, 1, 1,
1.965646, -1.18617, 2.641798, 1, 0, 0, 1, 1,
1.980206, -0.4511017, 2.256047, 1, 0, 0, 1, 1,
1.982386, -1.10723, 0.2027657, 0, 0, 0, 1, 1,
2.00195, 0.8282956, 2.326804, 0, 0, 0, 1, 1,
2.069863, -0.4476199, 3.31746, 0, 0, 0, 1, 1,
2.07438, -0.6971698, 3.977895, 0, 0, 0, 1, 1,
2.0828, 0.5316241, 1.116351, 0, 0, 0, 1, 1,
2.101587, -0.9774112, 2.263716, 0, 0, 0, 1, 1,
2.293583, 0.03848524, 0.3682804, 0, 0, 0, 1, 1,
2.29737, 0.2007516, -0.5966876, 1, 1, 1, 1, 1,
2.32472, 0.5265571, 2.333586, 1, 1, 1, 1, 1,
2.457365, 0.6117102, 1.975929, 1, 1, 1, 1, 1,
2.646262, 0.8396985, 0.735531, 1, 1, 1, 1, 1,
2.836614, -1.329298, 0.9297864, 1, 1, 1, 1, 1,
2.852274, 0.2388975, -1.051728, 1, 1, 1, 1, 1,
2.896239, 1.322771, 1.725606, 1, 1, 1, 1, 1
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
var radius = 9.986992;
var distance = 35.07888;
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
mvMatrix.translate( 0.231132, -0.4263865, 0.3940635 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.07888);
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
