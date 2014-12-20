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
-3.579972, 0.625746, -2.144809, 1, 0, 0, 1,
-3.311585, -0.6254804, -0.7962813, 1, 0.007843138, 0, 1,
-3.028829, -0.7969615, -1.508242, 1, 0.01176471, 0, 1,
-2.802237, 0.486432, -0.9000242, 1, 0.01960784, 0, 1,
-2.512525, 1.437514, -1.956129, 1, 0.02352941, 0, 1,
-2.486319, 0.3943475, -2.996813, 1, 0.03137255, 0, 1,
-2.480762, 0.7873151, -1.765209, 1, 0.03529412, 0, 1,
-2.473058, -0.6049934, -1.651189, 1, 0.04313726, 0, 1,
-2.460402, 0.07413427, -2.350118, 1, 0.04705882, 0, 1,
-2.383121, -1.331451, -3.432656, 1, 0.05490196, 0, 1,
-2.342339, 0.981164, 0.1902514, 1, 0.05882353, 0, 1,
-2.296908, -0.5736713, -3.781559, 1, 0.06666667, 0, 1,
-2.219718, -0.512639, -2.809227, 1, 0.07058824, 0, 1,
-2.121866, 0.2550031, -1.49574, 1, 0.07843138, 0, 1,
-2.08729, 1.376555, -2.060378, 1, 0.08235294, 0, 1,
-2.070467, 2.873806, -1.107367, 1, 0.09019608, 0, 1,
-2.036228, 0.890812, -0.7687867, 1, 0.09411765, 0, 1,
-1.976991, 0.5189768, -2.120377, 1, 0.1019608, 0, 1,
-1.974584, -0.1959433, -2.417613, 1, 0.1098039, 0, 1,
-1.967007, -0.05848108, -1.293284, 1, 0.1137255, 0, 1,
-1.966625, -0.03417994, -1.417536, 1, 0.1215686, 0, 1,
-1.963116, 0.5044926, 0.8170274, 1, 0.1254902, 0, 1,
-1.927978, -0.59426, -1.995042, 1, 0.1333333, 0, 1,
-1.914746, -0.8703507, -4.358083, 1, 0.1372549, 0, 1,
-1.898253, -0.2291923, -2.581756, 1, 0.145098, 0, 1,
-1.887908, -0.02767185, -0.4015755, 1, 0.1490196, 0, 1,
-1.88561, 0.1264994, -2.209636, 1, 0.1568628, 0, 1,
-1.884353, -1.681118, -2.068493, 1, 0.1607843, 0, 1,
-1.848557, 0.6999663, 0.489674, 1, 0.1686275, 0, 1,
-1.825035, 0.7769754, -1.736023, 1, 0.172549, 0, 1,
-1.774788, 0.9695972, -2.128996, 1, 0.1803922, 0, 1,
-1.762122, 1.077124, -0.3249232, 1, 0.1843137, 0, 1,
-1.758293, 0.4471002, -3.213636, 1, 0.1921569, 0, 1,
-1.747444, 0.0147596, -2.24572, 1, 0.1960784, 0, 1,
-1.713129, -0.1638034, -1.572431, 1, 0.2039216, 0, 1,
-1.694166, -0.07249206, -1.443065, 1, 0.2117647, 0, 1,
-1.68659, 0.1244222, -1.554036, 1, 0.2156863, 0, 1,
-1.680788, -0.6277051, -1.278419, 1, 0.2235294, 0, 1,
-1.662227, 0.4430491, -2.142749, 1, 0.227451, 0, 1,
-1.651199, -1.268899, -1.988126, 1, 0.2352941, 0, 1,
-1.641046, 0.7430086, -1.346648, 1, 0.2392157, 0, 1,
-1.630796, 0.3001948, -0.9571917, 1, 0.2470588, 0, 1,
-1.601204, -1.158751, -3.133195, 1, 0.2509804, 0, 1,
-1.589864, -0.7567828, -2.649347, 1, 0.2588235, 0, 1,
-1.589437, 0.9154998, -1.110034, 1, 0.2627451, 0, 1,
-1.588206, -0.2357763, 0.3721491, 1, 0.2705882, 0, 1,
-1.582409, 1.281361, -2.321886, 1, 0.2745098, 0, 1,
-1.577702, 0.2923566, -0.8634247, 1, 0.282353, 0, 1,
-1.572824, -1.419424, -2.280316, 1, 0.2862745, 0, 1,
-1.538494, 0.8644329, -0.8234423, 1, 0.2941177, 0, 1,
-1.528626, 0.6424179, -1.612343, 1, 0.3019608, 0, 1,
-1.524166, 0.6461845, -2.316191, 1, 0.3058824, 0, 1,
-1.501127, 1.879274, -1.571575, 1, 0.3137255, 0, 1,
-1.487113, 0.007120612, -1.391336, 1, 0.3176471, 0, 1,
-1.485227, 0.2899924, -3.4702, 1, 0.3254902, 0, 1,
-1.484574, -0.527982, -2.182982, 1, 0.3294118, 0, 1,
-1.477677, 1.471459, -1.738365, 1, 0.3372549, 0, 1,
-1.467618, 0.331673, -1.584462, 1, 0.3411765, 0, 1,
-1.466899, -1.059287, -2.557572, 1, 0.3490196, 0, 1,
-1.463108, -0.04061301, -2.92381, 1, 0.3529412, 0, 1,
-1.45599, -0.9625506, -2.142403, 1, 0.3607843, 0, 1,
-1.448399, -1.269623, -0.8181878, 1, 0.3647059, 0, 1,
-1.444837, -0.5022298, -1.858045, 1, 0.372549, 0, 1,
-1.44028, -1.381156, -0.444705, 1, 0.3764706, 0, 1,
-1.433561, -0.9097722, -2.050617, 1, 0.3843137, 0, 1,
-1.412551, -0.3011167, -1.146262, 1, 0.3882353, 0, 1,
-1.411723, 0.6220074, -2.318744, 1, 0.3960784, 0, 1,
-1.389732, 1.875377, -0.5864545, 1, 0.4039216, 0, 1,
-1.38514, -0.6246311, -2.708596, 1, 0.4078431, 0, 1,
-1.377892, -2.000181, -3.235838, 1, 0.4156863, 0, 1,
-1.373374, -0.6530267, -3.133533, 1, 0.4196078, 0, 1,
-1.370112, -0.1022513, -2.705396, 1, 0.427451, 0, 1,
-1.350036, 0.3058403, 0.6544012, 1, 0.4313726, 0, 1,
-1.338185, -0.6947638, -3.029835, 1, 0.4392157, 0, 1,
-1.336037, 0.59452, -1.717598, 1, 0.4431373, 0, 1,
-1.331576, -0.6608324, -2.382603, 1, 0.4509804, 0, 1,
-1.327111, -0.6120275, -0.9397287, 1, 0.454902, 0, 1,
-1.32057, -0.3299185, -1.674489, 1, 0.4627451, 0, 1,
-1.318988, 0.07523765, -2.89665, 1, 0.4666667, 0, 1,
-1.3042, 0.7268209, 0.3123495, 1, 0.4745098, 0, 1,
-1.303789, 0.3959957, -3.045356, 1, 0.4784314, 0, 1,
-1.301787, -1.666648, -3.180843, 1, 0.4862745, 0, 1,
-1.301531, -0.4581847, -3.559657, 1, 0.4901961, 0, 1,
-1.300107, 0.9018671, -2.842603, 1, 0.4980392, 0, 1,
-1.299014, -1.784808, -3.577419, 1, 0.5058824, 0, 1,
-1.298291, 0.1396079, -1.17641, 1, 0.509804, 0, 1,
-1.287477, 0.0007479465, -1.316479, 1, 0.5176471, 0, 1,
-1.285803, -2.210299, -2.542934, 1, 0.5215687, 0, 1,
-1.283083, -0.4601852, -3.105338, 1, 0.5294118, 0, 1,
-1.281123, -0.756496, -3.735394, 1, 0.5333334, 0, 1,
-1.276977, 0.6646828, 0.4930505, 1, 0.5411765, 0, 1,
-1.275619, 1.026412, 0.4649811, 1, 0.5450981, 0, 1,
-1.267487, 0.9924951, 0.3958756, 1, 0.5529412, 0, 1,
-1.265952, 1.32424, -1.002987, 1, 0.5568628, 0, 1,
-1.258491, -0.5873739, -2.60096, 1, 0.5647059, 0, 1,
-1.25349, -0.2526829, -2.213949, 1, 0.5686275, 0, 1,
-1.248843, -0.1372977, -0.622232, 1, 0.5764706, 0, 1,
-1.246366, 0.09599697, -2.857161, 1, 0.5803922, 0, 1,
-1.243807, -1.391909, -1.476266, 1, 0.5882353, 0, 1,
-1.242787, -0.1757089, -0.3395047, 1, 0.5921569, 0, 1,
-1.236849, 2.302331, -0.1901478, 1, 0.6, 0, 1,
-1.229097, -0.6094652, -1.718347, 1, 0.6078432, 0, 1,
-1.229027, -0.09173599, -2.398555, 1, 0.6117647, 0, 1,
-1.225373, 1.924492, 0.3805777, 1, 0.6196079, 0, 1,
-1.216427, -2.100554, -2.699581, 1, 0.6235294, 0, 1,
-1.210499, -2.670828, -3.944566, 1, 0.6313726, 0, 1,
-1.209137, 0.951809, -0.9849699, 1, 0.6352941, 0, 1,
-1.205508, -0.5497663, -0.1553227, 1, 0.6431373, 0, 1,
-1.1938, -0.01711792, -2.596874, 1, 0.6470588, 0, 1,
-1.183286, -1.058994, -1.675424, 1, 0.654902, 0, 1,
-1.177556, -0.439655, -1.027426, 1, 0.6588235, 0, 1,
-1.177452, -0.6120752, -2.430532, 1, 0.6666667, 0, 1,
-1.174554, -0.05162742, -1.125366, 1, 0.6705883, 0, 1,
-1.171451, 1.177913, 0.3873826, 1, 0.6784314, 0, 1,
-1.17085, -0.2682076, -1.569229, 1, 0.682353, 0, 1,
-1.169578, 0.8768494, -2.236981, 1, 0.6901961, 0, 1,
-1.167724, -1.382875, -1.690458, 1, 0.6941177, 0, 1,
-1.163198, -0.4693784, -1.132657, 1, 0.7019608, 0, 1,
-1.161094, -0.606356, -0.9948961, 1, 0.7098039, 0, 1,
-1.156446, 1.169122, -1.776819, 1, 0.7137255, 0, 1,
-1.145606, 0.1538098, -1.637987, 1, 0.7215686, 0, 1,
-1.140106, -0.08147161, -1.7564, 1, 0.7254902, 0, 1,
-1.135241, 0.66147, -2.657864, 1, 0.7333333, 0, 1,
-1.134554, 2.140475, -2.351015, 1, 0.7372549, 0, 1,
-1.132286, -0.682896, -2.877989, 1, 0.7450981, 0, 1,
-1.12865, 0.2605349, -1.170837, 1, 0.7490196, 0, 1,
-1.128474, 0.6645166, -1.25097, 1, 0.7568628, 0, 1,
-1.12302, 0.5875884, -1.550021, 1, 0.7607843, 0, 1,
-1.122717, -0.5609066, -1.501442, 1, 0.7686275, 0, 1,
-1.11596, -0.4538943, -1.251367, 1, 0.772549, 0, 1,
-1.111058, -1.049851, -2.576556, 1, 0.7803922, 0, 1,
-1.106233, -1.159052, -2.672292, 1, 0.7843137, 0, 1,
-1.105353, -0.8087349, -1.642823, 1, 0.7921569, 0, 1,
-1.100044, 0.7748001, -0.8958649, 1, 0.7960784, 0, 1,
-1.09737, -0.8729518, -3.659685, 1, 0.8039216, 0, 1,
-1.093942, 1.178184, -1.692981, 1, 0.8117647, 0, 1,
-1.091049, -0.4099787, -0.8996524, 1, 0.8156863, 0, 1,
-1.089854, 0.4048352, -2.703823, 1, 0.8235294, 0, 1,
-1.089192, 1.357524, -1.532627, 1, 0.827451, 0, 1,
-1.086034, -0.6952265, -3.262625, 1, 0.8352941, 0, 1,
-1.080796, 1.355145, -0.2412963, 1, 0.8392157, 0, 1,
-1.071959, 0.7327055, -1.789751, 1, 0.8470588, 0, 1,
-1.07121, -0.7030714, -2.92059, 1, 0.8509804, 0, 1,
-1.070868, 1.249688, -1.464051, 1, 0.8588235, 0, 1,
-1.065647, -0.3455942, -1.996867, 1, 0.8627451, 0, 1,
-1.05921, 0.3781359, -2.499506, 1, 0.8705882, 0, 1,
-1.053947, 0.7938233, -0.8989046, 1, 0.8745098, 0, 1,
-1.04976, 0.01669929, -2.083313, 1, 0.8823529, 0, 1,
-1.044085, -0.282972, -2.29353, 1, 0.8862745, 0, 1,
-1.037828, 0.69164, 0.1437647, 1, 0.8941177, 0, 1,
-1.037059, 0.1296219, -3.525358, 1, 0.8980392, 0, 1,
-1.034932, 1.665578, -1.545911, 1, 0.9058824, 0, 1,
-1.022527, -0.3028161, -2.648586, 1, 0.9137255, 0, 1,
-1.015827, 1.346138, -0.7888007, 1, 0.9176471, 0, 1,
-1.015327, -0.960135, -2.271896, 1, 0.9254902, 0, 1,
-1.015017, 1.503498, -1.231591, 1, 0.9294118, 0, 1,
-1.014167, 0.8700162, -1.657104, 1, 0.9372549, 0, 1,
-1.009991, -0.274715, -0.9439248, 1, 0.9411765, 0, 1,
-1.008214, 0.3776658, -1.399165, 1, 0.9490196, 0, 1,
-1.005392, 1.554788, 0.6440851, 1, 0.9529412, 0, 1,
-0.9983938, 0.5511, 0.6261221, 1, 0.9607843, 0, 1,
-0.9964171, -0.794647, -1.306256, 1, 0.9647059, 0, 1,
-0.9913867, -1.059896, -2.760108, 1, 0.972549, 0, 1,
-0.9874399, -0.5708258, -3.430037, 1, 0.9764706, 0, 1,
-0.9781508, 0.983278, 0.3526385, 1, 0.9843137, 0, 1,
-0.9735786, 0.2691493, 0.3255331, 1, 0.9882353, 0, 1,
-0.9690287, 0.09210663, -1.397784, 1, 0.9960784, 0, 1,
-0.9658748, -0.9390166, -3.033949, 0.9960784, 1, 0, 1,
-0.9626594, -0.5738637, -1.008893, 0.9921569, 1, 0, 1,
-0.9603981, 0.4992685, -0.7247553, 0.9843137, 1, 0, 1,
-0.9585176, 0.1763533, -2.373968, 0.9803922, 1, 0, 1,
-0.9530429, -1.236779, -4.025274, 0.972549, 1, 0, 1,
-0.9464222, 0.8153834, -0.456765, 0.9686275, 1, 0, 1,
-0.9436789, 0.4830431, -0.4485841, 0.9607843, 1, 0, 1,
-0.9430647, 0.7794917, -1.355539, 0.9568627, 1, 0, 1,
-0.9377574, 1.196161, 1.181282, 0.9490196, 1, 0, 1,
-0.9367276, -0.565404, -1.601552, 0.945098, 1, 0, 1,
-0.932376, 0.3951042, 0.01176661, 0.9372549, 1, 0, 1,
-0.9294301, 1.051851, -0.7731512, 0.9333333, 1, 0, 1,
-0.9219631, 2.494204, -0.6010765, 0.9254902, 1, 0, 1,
-0.9141487, -1.636373, -3.279316, 0.9215686, 1, 0, 1,
-0.9063531, 0.06497189, -1.980943, 0.9137255, 1, 0, 1,
-0.899475, 0.9043581, -1.427134, 0.9098039, 1, 0, 1,
-0.8978313, 0.7444036, -0.3099522, 0.9019608, 1, 0, 1,
-0.8974791, -0.698747, -2.552717, 0.8941177, 1, 0, 1,
-0.8967844, -0.005396809, -3.300177, 0.8901961, 1, 0, 1,
-0.892815, 1.520516, -2.834992, 0.8823529, 1, 0, 1,
-0.8898741, -2.072464, -1.770501, 0.8784314, 1, 0, 1,
-0.8881437, 1.847546, -1.523436, 0.8705882, 1, 0, 1,
-0.8870954, 1.383957, -0.6437495, 0.8666667, 1, 0, 1,
-0.8814021, 0.1688456, -1.337511, 0.8588235, 1, 0, 1,
-0.87962, -1.868671, -2.19789, 0.854902, 1, 0, 1,
-0.8776257, -0.041981, -2.002088, 0.8470588, 1, 0, 1,
-0.8760338, -1.32664, -2.222718, 0.8431373, 1, 0, 1,
-0.8652999, 0.4947793, -0.98313, 0.8352941, 1, 0, 1,
-0.8604526, 0.5898578, -2.065139, 0.8313726, 1, 0, 1,
-0.8546762, -0.1400161, -3.871256, 0.8235294, 1, 0, 1,
-0.8519413, 0.8255872, -2.508647, 0.8196079, 1, 0, 1,
-0.846683, -0.412847, -2.091874, 0.8117647, 1, 0, 1,
-0.8373397, 0.7640086, -1.078162, 0.8078431, 1, 0, 1,
-0.8348833, 0.2172949, -0.8492841, 0.8, 1, 0, 1,
-0.8331959, 0.3695658, -0.7901422, 0.7921569, 1, 0, 1,
-0.8246022, 1.724195, 0.4308826, 0.7882353, 1, 0, 1,
-0.8244408, 1.698607, -1.008393, 0.7803922, 1, 0, 1,
-0.8226703, -0.8798059, -2.05863, 0.7764706, 1, 0, 1,
-0.8200598, -0.774981, -2.419571, 0.7686275, 1, 0, 1,
-0.8123943, 0.53351, -0.3973164, 0.7647059, 1, 0, 1,
-0.7972013, 1.13778, -0.6814964, 0.7568628, 1, 0, 1,
-0.7950633, 0.6121274, -0.715385, 0.7529412, 1, 0, 1,
-0.7879549, -0.6561831, -2.195837, 0.7450981, 1, 0, 1,
-0.7865828, -1.456182, -3.021093, 0.7411765, 1, 0, 1,
-0.7865102, -0.171546, -0.764483, 0.7333333, 1, 0, 1,
-0.7856986, -1.768594, -2.772213, 0.7294118, 1, 0, 1,
-0.7846128, 0.7219581, -0.2416913, 0.7215686, 1, 0, 1,
-0.7828413, 1.068996, -0.725107, 0.7176471, 1, 0, 1,
-0.7765011, -0.5110646, -3.092729, 0.7098039, 1, 0, 1,
-0.7738649, -0.6378877, -2.417322, 0.7058824, 1, 0, 1,
-0.7721969, 1.033975, -1.472072, 0.6980392, 1, 0, 1,
-0.755577, 0.8302832, -1.00036, 0.6901961, 1, 0, 1,
-0.7426434, -0.6275029, -0.9866569, 0.6862745, 1, 0, 1,
-0.7365586, -1.328084, -2.609059, 0.6784314, 1, 0, 1,
-0.7358061, -2.435712, -3.175285, 0.6745098, 1, 0, 1,
-0.7325695, -0.6159028, -2.856222, 0.6666667, 1, 0, 1,
-0.7317755, 1.111597, -1.158405, 0.6627451, 1, 0, 1,
-0.7266229, -0.8692264, -1.727366, 0.654902, 1, 0, 1,
-0.72245, 0.7014361, -0.263007, 0.6509804, 1, 0, 1,
-0.7200202, 1.312092, -0.9111906, 0.6431373, 1, 0, 1,
-0.7166591, -1.820794, -2.269375, 0.6392157, 1, 0, 1,
-0.7145577, -0.2409229, -2.304736, 0.6313726, 1, 0, 1,
-0.7117441, 1.706023, -0.5050251, 0.627451, 1, 0, 1,
-0.7113172, 0.9507232, -1.552155, 0.6196079, 1, 0, 1,
-0.7073287, 0.9886015, -2.843269, 0.6156863, 1, 0, 1,
-0.7065347, -1.04111, -3.210291, 0.6078432, 1, 0, 1,
-0.6979561, -0.9662579, -3.270912, 0.6039216, 1, 0, 1,
-0.6974759, 2.1143, 0.6443095, 0.5960785, 1, 0, 1,
-0.6964445, 2.62967, 1.906222, 0.5882353, 1, 0, 1,
-0.6946198, -0.1537302, -0.8933343, 0.5843138, 1, 0, 1,
-0.690861, 1.480607, -0.4678096, 0.5764706, 1, 0, 1,
-0.6833469, 0.8424519, -1.14191, 0.572549, 1, 0, 1,
-0.681159, -0.5693869, -0.242715, 0.5647059, 1, 0, 1,
-0.674673, 0.7625042, -0.7321734, 0.5607843, 1, 0, 1,
-0.6743793, 1.582997, -1.83466, 0.5529412, 1, 0, 1,
-0.672574, -0.2819226, -2.602793, 0.5490196, 1, 0, 1,
-0.6693183, 0.2769524, -3.038396, 0.5411765, 1, 0, 1,
-0.6677549, -0.3241988, -1.823442, 0.5372549, 1, 0, 1,
-0.6674379, -1.512845, -2.774184, 0.5294118, 1, 0, 1,
-0.6669855, -1.711451, -2.182989, 0.5254902, 1, 0, 1,
-0.6655692, 1.371305, -0.9069464, 0.5176471, 1, 0, 1,
-0.6433359, -0.6405568, -3.671323, 0.5137255, 1, 0, 1,
-0.6424244, 0.3540038, -2.138347, 0.5058824, 1, 0, 1,
-0.6339384, 0.4046457, 0.6056275, 0.5019608, 1, 0, 1,
-0.6315816, -0.1107516, -2.153706, 0.4941176, 1, 0, 1,
-0.6300035, -0.9408944, -1.439689, 0.4862745, 1, 0, 1,
-0.6286341, -1.397842, -1.739284, 0.4823529, 1, 0, 1,
-0.6237506, 1.570495, -1.211958, 0.4745098, 1, 0, 1,
-0.6204886, 1.445611, 1.031629, 0.4705882, 1, 0, 1,
-0.6186924, 1.142211, -1.886589, 0.4627451, 1, 0, 1,
-0.6180502, -0.3627758, -2.29598, 0.4588235, 1, 0, 1,
-0.6169205, -0.05188594, -2.832238, 0.4509804, 1, 0, 1,
-0.6163309, -0.5007471, -1.395949, 0.4470588, 1, 0, 1,
-0.6144441, 1.782407, 0.9773645, 0.4392157, 1, 0, 1,
-0.6117867, -0.9769562, -2.284913, 0.4352941, 1, 0, 1,
-0.6114627, -1.206714, -4.610799, 0.427451, 1, 0, 1,
-0.5999833, -0.9555203, -0.7214316, 0.4235294, 1, 0, 1,
-0.5933453, 0.988283, -1.359222, 0.4156863, 1, 0, 1,
-0.5923483, -0.1135332, -1.953341, 0.4117647, 1, 0, 1,
-0.5867718, 0.7624084, -1.593539, 0.4039216, 1, 0, 1,
-0.5828874, 0.3101028, -0.9614732, 0.3960784, 1, 0, 1,
-0.5766479, -0.2571692, -1.57586, 0.3921569, 1, 0, 1,
-0.5765965, -0.9570797, -2.836998, 0.3843137, 1, 0, 1,
-0.5763552, 1.733598, -1.239457, 0.3803922, 1, 0, 1,
-0.5743838, 0.9272504, -1.417625, 0.372549, 1, 0, 1,
-0.5696276, 0.8025244, -1.323408, 0.3686275, 1, 0, 1,
-0.5656886, -1.873298, -2.668886, 0.3607843, 1, 0, 1,
-0.5623201, 0.4807676, -0.9468024, 0.3568628, 1, 0, 1,
-0.5544343, 0.6726742, -2.66899, 0.3490196, 1, 0, 1,
-0.5539795, -0.6843261, -3.456839, 0.345098, 1, 0, 1,
-0.5494632, 1.485722, -1.026033, 0.3372549, 1, 0, 1,
-0.5445501, -1.370504, -0.987848, 0.3333333, 1, 0, 1,
-0.5423964, 0.894663, -0.8029983, 0.3254902, 1, 0, 1,
-0.5423343, -0.8943526, -1.248264, 0.3215686, 1, 0, 1,
-0.5421231, -1.470375, -1.76905, 0.3137255, 1, 0, 1,
-0.5399422, -0.9967793, -2.716855, 0.3098039, 1, 0, 1,
-0.5383784, 0.03835999, 0.3185759, 0.3019608, 1, 0, 1,
-0.5361449, -0.3812442, -3.549719, 0.2941177, 1, 0, 1,
-0.5339953, -0.2086183, -1.020211, 0.2901961, 1, 0, 1,
-0.5339927, -0.2835488, -3.100609, 0.282353, 1, 0, 1,
-0.5336739, -0.1634662, -3.197423, 0.2784314, 1, 0, 1,
-0.5297803, -0.1836683, -0.736371, 0.2705882, 1, 0, 1,
-0.5256059, -0.3603989, -1.172206, 0.2666667, 1, 0, 1,
-0.5255097, -2.160861, -2.238388, 0.2588235, 1, 0, 1,
-0.5239335, 1.286534, -1.257571, 0.254902, 1, 0, 1,
-0.5207027, -0.9831551, -3.345406, 0.2470588, 1, 0, 1,
-0.5206224, -0.4124698, -1.729721, 0.2431373, 1, 0, 1,
-0.5197303, -1.331023, -2.192008, 0.2352941, 1, 0, 1,
-0.5192643, -0.3920204, -2.252145, 0.2313726, 1, 0, 1,
-0.514228, 1.132066, 1.721254, 0.2235294, 1, 0, 1,
-0.5129807, 0.703066, -0.8460711, 0.2196078, 1, 0, 1,
-0.5118584, 0.04989967, -0.8945129, 0.2117647, 1, 0, 1,
-0.5093931, -1.753895, -2.394547, 0.2078431, 1, 0, 1,
-0.508119, 0.03128657, -1.800071, 0.2, 1, 0, 1,
-0.5029016, -0.5862267, -0.8170571, 0.1921569, 1, 0, 1,
-0.4983332, -0.372656, -4.809916, 0.1882353, 1, 0, 1,
-0.4956357, -1.208182, -2.829618, 0.1803922, 1, 0, 1,
-0.4914599, 1.726708, 0.06693569, 0.1764706, 1, 0, 1,
-0.4809326, -0.1113662, -0.3833943, 0.1686275, 1, 0, 1,
-0.4781249, -0.4897338, -3.885649, 0.1647059, 1, 0, 1,
-0.4763233, -0.6626756, -4.254003, 0.1568628, 1, 0, 1,
-0.4762789, 1.421111, 0.1197123, 0.1529412, 1, 0, 1,
-0.4742316, -0.2103771, -2.174285, 0.145098, 1, 0, 1,
-0.473329, 0.6909208, 1.31206, 0.1411765, 1, 0, 1,
-0.4694109, -2.19312, -3.240253, 0.1333333, 1, 0, 1,
-0.468134, -0.2742743, -0.7483426, 0.1294118, 1, 0, 1,
-0.4667432, -0.8488526, -2.652595, 0.1215686, 1, 0, 1,
-0.464575, 0.654083, -1.858816, 0.1176471, 1, 0, 1,
-0.4641074, -0.6028689, -2.131592, 0.1098039, 1, 0, 1,
-0.4619908, 2.098558, 0.1570532, 0.1058824, 1, 0, 1,
-0.4588258, -0.1855535, -1.358439, 0.09803922, 1, 0, 1,
-0.4584878, -0.06264731, -3.121353, 0.09019608, 1, 0, 1,
-0.4549099, 2.374801, -0.3496247, 0.08627451, 1, 0, 1,
-0.454838, 0.123964, -4.449711, 0.07843138, 1, 0, 1,
-0.4531232, -0.4662386, -1.386779, 0.07450981, 1, 0, 1,
-0.4514145, 1.608672, -0.8450692, 0.06666667, 1, 0, 1,
-0.4495632, 0.4358892, -0.9185178, 0.0627451, 1, 0, 1,
-0.4423401, -0.7705953, -2.356812, 0.05490196, 1, 0, 1,
-0.4373708, -2.761152, -4.006256, 0.05098039, 1, 0, 1,
-0.435207, 0.7639959, -0.6536179, 0.04313726, 1, 0, 1,
-0.4280449, -0.1339118, -3.396413, 0.03921569, 1, 0, 1,
-0.4205214, -1.1639, -3.074236, 0.03137255, 1, 0, 1,
-0.4198422, 0.005896488, -2.491316, 0.02745098, 1, 0, 1,
-0.4162047, -0.09825613, -2.351304, 0.01960784, 1, 0, 1,
-0.4161798, 0.3877293, 0.2112638, 0.01568628, 1, 0, 1,
-0.4111502, 0.1987028, -3.110772, 0.007843138, 1, 0, 1,
-0.4086683, 2.784138, 0.5879313, 0.003921569, 1, 0, 1,
-0.4057048, -0.66348, -2.225489, 0, 1, 0.003921569, 1,
-0.4055297, -1.350616, -2.77072, 0, 1, 0.01176471, 1,
-0.4050716, -0.1883372, -1.156349, 0, 1, 0.01568628, 1,
-0.4044733, 1.378082, 0.7781189, 0, 1, 0.02352941, 1,
-0.3983309, -0.05474084, -2.123036, 0, 1, 0.02745098, 1,
-0.3961233, -0.6843596, -3.295595, 0, 1, 0.03529412, 1,
-0.3943938, 0.08551013, -1.500864, 0, 1, 0.03921569, 1,
-0.387527, -0.7704471, -1.780416, 0, 1, 0.04705882, 1,
-0.3850425, 0.5943508, 0.5371768, 0, 1, 0.05098039, 1,
-0.3843467, -0.9368222, -1.758374, 0, 1, 0.05882353, 1,
-0.3816801, 0.5912319, -0.6238723, 0, 1, 0.0627451, 1,
-0.3770628, -0.4546551, -1.318312, 0, 1, 0.07058824, 1,
-0.3751314, -1.093841, -2.731986, 0, 1, 0.07450981, 1,
-0.3750883, -0.7740405, -3.062474, 0, 1, 0.08235294, 1,
-0.372385, 1.70909, -0.5013286, 0, 1, 0.08627451, 1,
-0.3720949, 0.08385, -0.9799781, 0, 1, 0.09411765, 1,
-0.3716737, -0.1678914, -2.212875, 0, 1, 0.1019608, 1,
-0.3680172, 0.9397063, 1.425714, 0, 1, 0.1058824, 1,
-0.3665335, 1.220757, -0.4673274, 0, 1, 0.1137255, 1,
-0.3662241, 0.138093, -0.2993981, 0, 1, 0.1176471, 1,
-0.3642588, 0.1576405, -3.365026, 0, 1, 0.1254902, 1,
-0.3642332, 0.7880022, -0.2719366, 0, 1, 0.1294118, 1,
-0.3567076, 0.003138771, -1.729987, 0, 1, 0.1372549, 1,
-0.3558743, -0.1580906, -0.5909399, 0, 1, 0.1411765, 1,
-0.3530479, -0.3964306, -3.244974, 0, 1, 0.1490196, 1,
-0.3519989, 0.4346254, -0.4202538, 0, 1, 0.1529412, 1,
-0.3511665, -2.055288, -4.240243, 0, 1, 0.1607843, 1,
-0.3492383, -0.9648137, -4.316061, 0, 1, 0.1647059, 1,
-0.3434066, -0.9576402, -2.238346, 0, 1, 0.172549, 1,
-0.3426815, -0.3078159, -1.260132, 0, 1, 0.1764706, 1,
-0.3420989, -1.787688, -2.370857, 0, 1, 0.1843137, 1,
-0.3319918, -0.1060946, -0.4340724, 0, 1, 0.1882353, 1,
-0.3251294, 1.515087, 0.3609349, 0, 1, 0.1960784, 1,
-0.3160769, -1.909291, -3.306624, 0, 1, 0.2039216, 1,
-0.31404, 1.251844, -0.4617113, 0, 1, 0.2078431, 1,
-0.3133706, 1.983536, 1.180462, 0, 1, 0.2156863, 1,
-0.3026493, 0.254635, -0.5561016, 0, 1, 0.2196078, 1,
-0.3020492, 1.787427, -0.4515611, 0, 1, 0.227451, 1,
-0.30136, -0.7554367, -1.883353, 0, 1, 0.2313726, 1,
-0.2987394, 0.387884, -1.995346, 0, 1, 0.2392157, 1,
-0.2964121, -0.7971136, -1.807237, 0, 1, 0.2431373, 1,
-0.2942963, -0.2745411, -1.832366, 0, 1, 0.2509804, 1,
-0.2915991, 0.01317151, -2.171067, 0, 1, 0.254902, 1,
-0.2853201, 0.6336293, -0.9813653, 0, 1, 0.2627451, 1,
-0.2846467, 1.200879, -0.5553105, 0, 1, 0.2666667, 1,
-0.2844325, 0.2335397, 0.39045, 0, 1, 0.2745098, 1,
-0.2830851, -1.43932, -1.517686, 0, 1, 0.2784314, 1,
-0.2820405, 0.6605306, -0.7752191, 0, 1, 0.2862745, 1,
-0.2769332, -2.097291, -4.604187, 0, 1, 0.2901961, 1,
-0.2715129, -1.642757, -1.861599, 0, 1, 0.2980392, 1,
-0.2669534, -1.545187, -4.513378, 0, 1, 0.3058824, 1,
-0.2625973, -0.4814531, -1.920707, 0, 1, 0.3098039, 1,
-0.2584182, 0.6044769, -1.706053, 0, 1, 0.3176471, 1,
-0.2561419, -0.7095062, -2.558007, 0, 1, 0.3215686, 1,
-0.2560052, -0.6730506, -0.3618754, 0, 1, 0.3294118, 1,
-0.2537576, -0.2981344, -3.97087, 0, 1, 0.3333333, 1,
-0.2533941, -0.8191823, -4.726132, 0, 1, 0.3411765, 1,
-0.2493317, 0.7188798, 1.183071, 0, 1, 0.345098, 1,
-0.2486851, -1.51596, -4.342682, 0, 1, 0.3529412, 1,
-0.247078, 0.2608907, -0.513473, 0, 1, 0.3568628, 1,
-0.2466666, 1.068297, 0.0835987, 0, 1, 0.3647059, 1,
-0.2411119, -1.101657, -3.177709, 0, 1, 0.3686275, 1,
-0.239735, -0.4058951, -3.184148, 0, 1, 0.3764706, 1,
-0.2316605, -1.123355, -3.372544, 0, 1, 0.3803922, 1,
-0.2284528, 0.8185597, -0.5942779, 0, 1, 0.3882353, 1,
-0.2277616, 0.8050566, -0.7819657, 0, 1, 0.3921569, 1,
-0.2269077, 0.6765273, 0.59281, 0, 1, 0.4, 1,
-0.220101, 1.281654, -1.469971, 0, 1, 0.4078431, 1,
-0.2169299, -0.3824114, -0.9926351, 0, 1, 0.4117647, 1,
-0.2138265, 0.08243617, -1.362221, 0, 1, 0.4196078, 1,
-0.2128743, 0.2427485, -0.587409, 0, 1, 0.4235294, 1,
-0.2121394, -1.590934, -3.232028, 0, 1, 0.4313726, 1,
-0.2112629, 0.05223655, -2.516257, 0, 1, 0.4352941, 1,
-0.2080484, 0.5921603, 0.9209981, 0, 1, 0.4431373, 1,
-0.2074118, -0.4015702, -2.640048, 0, 1, 0.4470588, 1,
-0.2033126, -0.2172082, -3.454456, 0, 1, 0.454902, 1,
-0.2030106, 1.126829, 0.127932, 0, 1, 0.4588235, 1,
-0.1965034, -0.4570146, -0.6660637, 0, 1, 0.4666667, 1,
-0.1907652, -0.6099815, -3.906768, 0, 1, 0.4705882, 1,
-0.190734, -0.747326, -3.883794, 0, 1, 0.4784314, 1,
-0.1905628, 0.9955338, 0.3719941, 0, 1, 0.4823529, 1,
-0.1870013, -2.912075, -2.646351, 0, 1, 0.4901961, 1,
-0.1868012, -0.5079215, -2.686526, 0, 1, 0.4941176, 1,
-0.1808729, -0.03527164, -1.889961, 0, 1, 0.5019608, 1,
-0.1807472, -1.696525, -3.558255, 0, 1, 0.509804, 1,
-0.1769626, -0.009748972, -2.658535, 0, 1, 0.5137255, 1,
-0.175615, -0.2833787, -3.901965, 0, 1, 0.5215687, 1,
-0.1749594, 0.8524354, -0.5239016, 0, 1, 0.5254902, 1,
-0.1747215, 1.359559, 1.190217, 0, 1, 0.5333334, 1,
-0.171527, -0.1535094, -2.707992, 0, 1, 0.5372549, 1,
-0.1702943, -0.4886422, -1.743844, 0, 1, 0.5450981, 1,
-0.1682853, 0.4555457, 0.7866133, 0, 1, 0.5490196, 1,
-0.1672975, -0.5128751, -0.8019048, 0, 1, 0.5568628, 1,
-0.1667189, -0.9783593, -1.598905, 0, 1, 0.5607843, 1,
-0.1657501, 0.8694689, -2.001516, 0, 1, 0.5686275, 1,
-0.1643651, 0.2140184, -1.528895, 0, 1, 0.572549, 1,
-0.1633624, 0.8035514, -0.8720928, 0, 1, 0.5803922, 1,
-0.1563675, -1.148874, -3.7834, 0, 1, 0.5843138, 1,
-0.153959, 1.549167, -1.579487, 0, 1, 0.5921569, 1,
-0.1533597, 0.7709703, 1.611215, 0, 1, 0.5960785, 1,
-0.1426059, -0.3996565, -2.284304, 0, 1, 0.6039216, 1,
-0.1384733, -0.7582058, -1.373438, 0, 1, 0.6117647, 1,
-0.1380191, 0.1974282, -2.041595, 0, 1, 0.6156863, 1,
-0.136841, 0.5492582, -1.313605, 0, 1, 0.6235294, 1,
-0.1341857, -0.04230597, -0.5941803, 0, 1, 0.627451, 1,
-0.1340552, -0.6988431, -4.028681, 0, 1, 0.6352941, 1,
-0.1337335, 0.8161128, -1.727156, 0, 1, 0.6392157, 1,
-0.1333708, 1.388328, -2.026544, 0, 1, 0.6470588, 1,
-0.1248292, 0.1578116, -0.7952014, 0, 1, 0.6509804, 1,
-0.1187352, 0.4027026, -0.1354789, 0, 1, 0.6588235, 1,
-0.1174659, 0.6711406, 0.821087, 0, 1, 0.6627451, 1,
-0.1172726, -0.8723398, -4.227801, 0, 1, 0.6705883, 1,
-0.1168735, 1.438403, -0.4881572, 0, 1, 0.6745098, 1,
-0.1147809, -0.3907917, -4.443004, 0, 1, 0.682353, 1,
-0.1133785, -0.783139, -1.706584, 0, 1, 0.6862745, 1,
-0.1130786, 1.059379, 0.982244, 0, 1, 0.6941177, 1,
-0.1118389, -0.6986002, -4.28075, 0, 1, 0.7019608, 1,
-0.1108329, -0.04697271, -0.5769128, 0, 1, 0.7058824, 1,
-0.1050932, 1.625762, -0.04348271, 0, 1, 0.7137255, 1,
-0.1046945, -1.181246, -3.778174, 0, 1, 0.7176471, 1,
-0.1035048, -0.05448814, -2.366472, 0, 1, 0.7254902, 1,
-0.1013578, 0.3359472, 0.455736, 0, 1, 0.7294118, 1,
-0.09976903, -0.9593351, -2.768551, 0, 1, 0.7372549, 1,
-0.09573351, -2.72857, -3.924255, 0, 1, 0.7411765, 1,
-0.09268484, 0.1335988, -1.18069, 0, 1, 0.7490196, 1,
-0.0924987, 2.202417, 0.3001576, 0, 1, 0.7529412, 1,
-0.08915209, 0.5604259, -1.496291, 0, 1, 0.7607843, 1,
-0.08330418, 2.807052, 0.3911561, 0, 1, 0.7647059, 1,
-0.07890529, 0.7901638, 1.642336, 0, 1, 0.772549, 1,
-0.07713298, 0.5990717, -1.905396, 0, 1, 0.7764706, 1,
-0.06867705, -0.02933666, -0.7914288, 0, 1, 0.7843137, 1,
-0.06813903, 0.8627751, -0.1868479, 0, 1, 0.7882353, 1,
-0.0675017, -0.04041175, -2.523867, 0, 1, 0.7960784, 1,
-0.06717483, 1.132651, -0.4446403, 0, 1, 0.8039216, 1,
-0.06529022, -0.1372499, -1.440882, 0, 1, 0.8078431, 1,
-0.06479114, 0.5323666, -2.2586, 0, 1, 0.8156863, 1,
-0.06290694, 1.068642, -0.07343038, 0, 1, 0.8196079, 1,
-0.06221468, 0.3459232, 0.1175785, 0, 1, 0.827451, 1,
-0.0599848, -1.094665, -2.426736, 0, 1, 0.8313726, 1,
-0.05484428, 2.053637, -0.04534374, 0, 1, 0.8392157, 1,
-0.05482114, 0.8259454, -0.5380031, 0, 1, 0.8431373, 1,
-0.05272254, -1.315443, -3.853579, 0, 1, 0.8509804, 1,
-0.0490525, -0.8299006, -4.921567, 0, 1, 0.854902, 1,
-0.04310387, -1.113686, -2.110829, 0, 1, 0.8627451, 1,
-0.04218943, 0.1920447, -1.499167, 0, 1, 0.8666667, 1,
-0.04175419, -0.9625282, -3.356613, 0, 1, 0.8745098, 1,
-0.03682649, 0.9725699, 0.44976, 0, 1, 0.8784314, 1,
-0.0359078, -0.9749578, -2.281057, 0, 1, 0.8862745, 1,
-0.03312391, -0.2766406, -4.225647, 0, 1, 0.8901961, 1,
-0.03196396, -0.9203507, -3.206052, 0, 1, 0.8980392, 1,
-0.02649461, -2.009276, -4.53097, 0, 1, 0.9058824, 1,
-0.02488887, 1.401422, -0.9621187, 0, 1, 0.9098039, 1,
-0.02092434, -1.329951, -3.007319, 0, 1, 0.9176471, 1,
-0.02081355, 0.217179, 0.8562276, 0, 1, 0.9215686, 1,
-0.01170723, 0.6474937, -1.06446, 0, 1, 0.9294118, 1,
-0.01148804, -1.181319, -2.29183, 0, 1, 0.9333333, 1,
-0.01078736, -1.411056, -1.562767, 0, 1, 0.9411765, 1,
-0.002933132, -0.5557024, -2.913964, 0, 1, 0.945098, 1,
-0.00189854, 0.1361363, 1.533942, 0, 1, 0.9529412, 1,
0.001208116, 0.8883754, 1.083017, 0, 1, 0.9568627, 1,
0.008715374, -1.188931, 3.553645, 0, 1, 0.9647059, 1,
0.01256213, -0.1559444, 1.407771, 0, 1, 0.9686275, 1,
0.01552453, 0.4496383, -1.140168, 0, 1, 0.9764706, 1,
0.02708435, -0.6145728, 2.81386, 0, 1, 0.9803922, 1,
0.03589578, 0.3607802, -0.2432097, 0, 1, 0.9882353, 1,
0.03805717, 0.2277758, -1.452293, 0, 1, 0.9921569, 1,
0.03857511, -0.6659061, 2.980785, 0, 1, 1, 1,
0.03882385, 1.441314, 1.825067, 0, 0.9921569, 1, 1,
0.04612131, 0.8208073, -1.572662, 0, 0.9882353, 1, 1,
0.04860875, -0.1774101, 2.991007, 0, 0.9803922, 1, 1,
0.04981953, 0.6106557, 0.4008764, 0, 0.9764706, 1, 1,
0.05189038, 1.301483, 0.1077795, 0, 0.9686275, 1, 1,
0.05263473, -1.211562, 4.538644, 0, 0.9647059, 1, 1,
0.05587919, -1.566938, 3.593853, 0, 0.9568627, 1, 1,
0.05972587, -0.1092607, 3.250214, 0, 0.9529412, 1, 1,
0.06287634, 0.3496533, -0.9935881, 0, 0.945098, 1, 1,
0.063653, -1.34123, 3.788766, 0, 0.9411765, 1, 1,
0.06561945, -1.164351, 4.570327, 0, 0.9333333, 1, 1,
0.06609291, 0.5972697, 0.1215111, 0, 0.9294118, 1, 1,
0.07069129, 0.1263532, 1.686287, 0, 0.9215686, 1, 1,
0.07214016, -0.4135256, 2.879589, 0, 0.9176471, 1, 1,
0.07557078, -0.6052237, 4.016676, 0, 0.9098039, 1, 1,
0.08216411, -0.2592465, 2.870209, 0, 0.9058824, 1, 1,
0.08350681, 0.3842109, -0.7036248, 0, 0.8980392, 1, 1,
0.08408821, 0.6253885, -0.4998502, 0, 0.8901961, 1, 1,
0.08607487, -0.5236661, 2.057162, 0, 0.8862745, 1, 1,
0.08609032, -0.6134059, 2.195183, 0, 0.8784314, 1, 1,
0.0881203, -0.7280079, 3.419196, 0, 0.8745098, 1, 1,
0.09053139, -1.929624, 1.774079, 0, 0.8666667, 1, 1,
0.09437843, -1.165935, 1.269058, 0, 0.8627451, 1, 1,
0.09447213, 0.2074618, 0.6448041, 0, 0.854902, 1, 1,
0.09619502, -0.4691188, 2.436831, 0, 0.8509804, 1, 1,
0.1028825, -1.208508, 2.695688, 0, 0.8431373, 1, 1,
0.1035793, 0.06530908, 1.344292, 0, 0.8392157, 1, 1,
0.1122879, -0.07418673, 2.155579, 0, 0.8313726, 1, 1,
0.1136762, -0.1509122, 4.588837, 0, 0.827451, 1, 1,
0.1146759, 0.05782212, 0.6705713, 0, 0.8196079, 1, 1,
0.1149212, -1.802994, 3.117732, 0, 0.8156863, 1, 1,
0.1153499, 0.1299687, 2.794917, 0, 0.8078431, 1, 1,
0.1162991, -0.8031011, 2.557928, 0, 0.8039216, 1, 1,
0.118776, -1.199404, 4.589257, 0, 0.7960784, 1, 1,
0.1225534, 1.244023, -1.425975, 0, 0.7882353, 1, 1,
0.122935, 0.844314, 1.105582, 0, 0.7843137, 1, 1,
0.1244278, 1.040667, -1.76496, 0, 0.7764706, 1, 1,
0.1247804, -0.3241914, 1.924973, 0, 0.772549, 1, 1,
0.127337, -1.145876, 5.079799, 0, 0.7647059, 1, 1,
0.1290633, 0.7600714, -1.20664, 0, 0.7607843, 1, 1,
0.1322863, -0.07226744, 3.393147, 0, 0.7529412, 1, 1,
0.1326862, 0.0959375, 2.255115, 0, 0.7490196, 1, 1,
0.1401567, 0.8780822, 2.677351, 0, 0.7411765, 1, 1,
0.1434457, 0.4308427, 2.218631, 0, 0.7372549, 1, 1,
0.1452743, 0.3710958, 1.716817, 0, 0.7294118, 1, 1,
0.1452945, 0.5039812, 0.1632443, 0, 0.7254902, 1, 1,
0.1495229, 0.3930116, 0.06131368, 0, 0.7176471, 1, 1,
0.1495255, 0.4221, 1.341786, 0, 0.7137255, 1, 1,
0.1565469, 0.2067942, 1.755164, 0, 0.7058824, 1, 1,
0.1566041, -1.134577, 1.41829, 0, 0.6980392, 1, 1,
0.1569647, 1.281801, -0.0454213, 0, 0.6941177, 1, 1,
0.1592839, -2.35334, 2.830346, 0, 0.6862745, 1, 1,
0.1608374, 0.7092466, -0.3112101, 0, 0.682353, 1, 1,
0.1612432, -0.4415998, 2.264698, 0, 0.6745098, 1, 1,
0.1625267, 0.5525116, -0.9544532, 0, 0.6705883, 1, 1,
0.1662189, 1.218382, 1.243734, 0, 0.6627451, 1, 1,
0.1683282, -0.6251721, 3.246791, 0, 0.6588235, 1, 1,
0.1705032, 0.8031636, 0.1811591, 0, 0.6509804, 1, 1,
0.172077, -0.808607, 2.387953, 0, 0.6470588, 1, 1,
0.1811075, -1.10088, 3.585346, 0, 0.6392157, 1, 1,
0.1841305, 1.019646, 0.002004912, 0, 0.6352941, 1, 1,
0.1856281, -0.2607737, 2.110021, 0, 0.627451, 1, 1,
0.1872451, 1.319292, -0.8103238, 0, 0.6235294, 1, 1,
0.190704, -0.1225094, 1.463019, 0, 0.6156863, 1, 1,
0.1925774, 1.112392, -0.4972463, 0, 0.6117647, 1, 1,
0.1958286, 0.4097922, 0.7141548, 0, 0.6039216, 1, 1,
0.1983794, 1.473249, -0.1876904, 0, 0.5960785, 1, 1,
0.2028089, 1.352323, 2.159996, 0, 0.5921569, 1, 1,
0.205247, -1.057336, 3.737262, 0, 0.5843138, 1, 1,
0.2073926, -1.125006, 1.421625, 0, 0.5803922, 1, 1,
0.2082644, 0.8683519, 1.924171, 0, 0.572549, 1, 1,
0.209539, 0.8576133, 2.12255, 0, 0.5686275, 1, 1,
0.210197, 1.066483, 0.04752738, 0, 0.5607843, 1, 1,
0.210982, 0.2558911, 0.9096168, 0, 0.5568628, 1, 1,
0.2151397, -0.6516182, 3.355032, 0, 0.5490196, 1, 1,
0.2152482, -0.1283341, 2.168653, 0, 0.5450981, 1, 1,
0.2156896, -0.06709728, 1.094922, 0, 0.5372549, 1, 1,
0.2164875, -0.6106054, 2.079359, 0, 0.5333334, 1, 1,
0.2187605, -1.360533, 3.953311, 0, 0.5254902, 1, 1,
0.2193305, 1.013283, -1.112406, 0, 0.5215687, 1, 1,
0.2193758, -0.2761303, 4.979845, 0, 0.5137255, 1, 1,
0.2210357, -1.558987, 2.230083, 0, 0.509804, 1, 1,
0.2211467, -0.770638, 2.107102, 0, 0.5019608, 1, 1,
0.2240546, -0.2950264, 1.637476, 0, 0.4941176, 1, 1,
0.2252249, 0.506214, 1.32805, 0, 0.4901961, 1, 1,
0.2298734, -1.916088, 3.24566, 0, 0.4823529, 1, 1,
0.2335323, 0.3044548, -0.4803672, 0, 0.4784314, 1, 1,
0.2344006, 0.3253338, 0.1181494, 0, 0.4705882, 1, 1,
0.2382001, -0.3974581, 3.294005, 0, 0.4666667, 1, 1,
0.2406901, 0.7613316, 0.1847335, 0, 0.4588235, 1, 1,
0.2428147, -1.114994, 1.070226, 0, 0.454902, 1, 1,
0.245296, -0.651664, 2.749464, 0, 0.4470588, 1, 1,
0.247951, 0.1996801, 1.342918, 0, 0.4431373, 1, 1,
0.2492958, 0.0232568, 0.9753675, 0, 0.4352941, 1, 1,
0.2555625, 1.561095, 0.8454224, 0, 0.4313726, 1, 1,
0.2560113, 0.4388066, 0.8472887, 0, 0.4235294, 1, 1,
0.2576981, 0.9024544, 0.7716514, 0, 0.4196078, 1, 1,
0.2609333, -0.4772539, 2.311053, 0, 0.4117647, 1, 1,
0.2645771, 1.842483, -0.3582145, 0, 0.4078431, 1, 1,
0.266219, -0.1397806, 1.782277, 0, 0.4, 1, 1,
0.2671913, 1.029003, 1.044596, 0, 0.3921569, 1, 1,
0.2682395, 0.6799949, 0.6906666, 0, 0.3882353, 1, 1,
0.2715184, -0.2705201, 3.057707, 0, 0.3803922, 1, 1,
0.2715561, -1.232214, 1.224433, 0, 0.3764706, 1, 1,
0.2781516, 0.7191298, -0.5265048, 0, 0.3686275, 1, 1,
0.2812109, -1.136878, 1.786583, 0, 0.3647059, 1, 1,
0.2833206, -0.4109439, 1.958516, 0, 0.3568628, 1, 1,
0.2899633, 1.110767, -0.3449182, 0, 0.3529412, 1, 1,
0.2914631, -0.7376272, 3.587835, 0, 0.345098, 1, 1,
0.291948, -0.2399072, 0.9659403, 0, 0.3411765, 1, 1,
0.2937623, -0.2274916, 3.062606, 0, 0.3333333, 1, 1,
0.2954618, 0.8257529, 0.3218384, 0, 0.3294118, 1, 1,
0.299281, 0.1710705, 1.278881, 0, 0.3215686, 1, 1,
0.3024475, 0.919717, -0.3875002, 0, 0.3176471, 1, 1,
0.3119994, -0.2916123, 2.972433, 0, 0.3098039, 1, 1,
0.3148083, -0.3033426, 2.445643, 0, 0.3058824, 1, 1,
0.316433, 0.1425047, 0.02002604, 0, 0.2980392, 1, 1,
0.3169674, -0.2063787, 2.090009, 0, 0.2901961, 1, 1,
0.3277912, -0.004824194, 2.408018, 0, 0.2862745, 1, 1,
0.3375925, -1.116238, 1.118207, 0, 0.2784314, 1, 1,
0.3452097, 1.227148, 1.730039, 0, 0.2745098, 1, 1,
0.3458411, 1.746318, -0.0647593, 0, 0.2666667, 1, 1,
0.3490777, 0.01695864, 1.01399, 0, 0.2627451, 1, 1,
0.3503989, -0.61595, 3.287281, 0, 0.254902, 1, 1,
0.3504101, 1.487388, -1.384754, 0, 0.2509804, 1, 1,
0.3507634, 0.08804036, 1.134851, 0, 0.2431373, 1, 1,
0.351035, 0.06354146, 0.2406953, 0, 0.2392157, 1, 1,
0.3543926, 2.046558, -0.2293303, 0, 0.2313726, 1, 1,
0.3546774, 0.2233381, -0.05940361, 0, 0.227451, 1, 1,
0.3574873, -0.7609756, 0.5558328, 0, 0.2196078, 1, 1,
0.3587715, -0.3011226, 2.593976, 0, 0.2156863, 1, 1,
0.358802, -0.5497583, 2.371449, 0, 0.2078431, 1, 1,
0.3678614, 0.7712463, 1.756137, 0, 0.2039216, 1, 1,
0.3686956, -0.5184144, 2.573305, 0, 0.1960784, 1, 1,
0.3707865, -0.09656346, 0.6961349, 0, 0.1882353, 1, 1,
0.3731971, -1.506777, 3.354464, 0, 0.1843137, 1, 1,
0.3828601, -0.1616502, 1.466059, 0, 0.1764706, 1, 1,
0.3854738, 0.2144153, 1.44702, 0, 0.172549, 1, 1,
0.3870127, 0.7546635, 0.7945337, 0, 0.1647059, 1, 1,
0.38861, -1.005377, 1.154346, 0, 0.1607843, 1, 1,
0.3924183, -0.8760679, 2.929747, 0, 0.1529412, 1, 1,
0.3925287, 0.8125786, 0.3955523, 0, 0.1490196, 1, 1,
0.4025328, -0.4377589, 4.373828, 0, 0.1411765, 1, 1,
0.4060834, 0.3334408, 1.187622, 0, 0.1372549, 1, 1,
0.4064645, 2.189909, -0.4917965, 0, 0.1294118, 1, 1,
0.4100971, 1.567888, 0.9059678, 0, 0.1254902, 1, 1,
0.4106437, -0.9530166, 1.382646, 0, 0.1176471, 1, 1,
0.4134749, -0.5587391, 1.422612, 0, 0.1137255, 1, 1,
0.4159771, 0.859563, 2.700906, 0, 0.1058824, 1, 1,
0.4195257, 0.956556, -0.3599089, 0, 0.09803922, 1, 1,
0.4246209, -0.9967069, 3.014836, 0, 0.09411765, 1, 1,
0.4247021, 1.295681, 0.09312413, 0, 0.08627451, 1, 1,
0.428444, -0.4872774, 2.779339, 0, 0.08235294, 1, 1,
0.4289978, 1.508867, 1.977736, 0, 0.07450981, 1, 1,
0.4300812, 0.5396912, 2.196593, 0, 0.07058824, 1, 1,
0.4334615, -1.30519, 2.013597, 0, 0.0627451, 1, 1,
0.4384211, 1.070838, 0.7418258, 0, 0.05882353, 1, 1,
0.4384424, -0.5858546, 4.139213, 0, 0.05098039, 1, 1,
0.4384891, 0.000718838, 1.783254, 0, 0.04705882, 1, 1,
0.4389699, 0.724395, 1.79164, 0, 0.03921569, 1, 1,
0.4394735, 0.2353816, 2.428525, 0, 0.03529412, 1, 1,
0.4438897, 0.4026529, 0.4900102, 0, 0.02745098, 1, 1,
0.452428, 0.07930317, 1.669347, 0, 0.02352941, 1, 1,
0.4541879, -0.4681152, 2.107761, 0, 0.01568628, 1, 1,
0.457365, -0.4670648, 2.132491, 0, 0.01176471, 1, 1,
0.4590228, 1.106063, 1.501426, 0, 0.003921569, 1, 1,
0.4631334, 0.7991747, 0.8868732, 0.003921569, 0, 1, 1,
0.4665585, -1.633118, 4.269715, 0.007843138, 0, 1, 1,
0.4717948, -0.708047, 0.4599732, 0.01568628, 0, 1, 1,
0.4719691, 0.1696041, 1.87862, 0.01960784, 0, 1, 1,
0.4748075, -1.606633, 2.365596, 0.02745098, 0, 1, 1,
0.4757193, -0.5001374, 3.417808, 0.03137255, 0, 1, 1,
0.476173, 1.055878, 1.513715, 0.03921569, 0, 1, 1,
0.4769775, -0.3350253, 2.825367, 0.04313726, 0, 1, 1,
0.4803662, 1.153599, 0.5253924, 0.05098039, 0, 1, 1,
0.4814694, 0.3693393, 0.6219688, 0.05490196, 0, 1, 1,
0.482424, 1.203117, 0.5940098, 0.0627451, 0, 1, 1,
0.4888591, 0.331723, 1.793631, 0.06666667, 0, 1, 1,
0.4970193, -0.9017746, 2.559561, 0.07450981, 0, 1, 1,
0.5012452, -0.9703355, 1.908379, 0.07843138, 0, 1, 1,
0.5034546, -0.8452063, 2.613572, 0.08627451, 0, 1, 1,
0.5036392, -0.5232587, 2.641509, 0.09019608, 0, 1, 1,
0.5065116, -0.42295, 1.29087, 0.09803922, 0, 1, 1,
0.5083029, 0.1645641, 1.057095, 0.1058824, 0, 1, 1,
0.5094211, -0.09170077, 3.037002, 0.1098039, 0, 1, 1,
0.5152082, -0.0991972, 3.253939, 0.1176471, 0, 1, 1,
0.5161621, -1.106719, 3.181083, 0.1215686, 0, 1, 1,
0.5165137, 1.665986, -0.8853818, 0.1294118, 0, 1, 1,
0.5165779, -1.243083, 2.78429, 0.1333333, 0, 1, 1,
0.5186083, -0.7579993, 3.682985, 0.1411765, 0, 1, 1,
0.5195347, 0.5289214, 1.850919, 0.145098, 0, 1, 1,
0.5228168, 1.056712, 1.133577, 0.1529412, 0, 1, 1,
0.5274529, 0.4777342, -0.3443343, 0.1568628, 0, 1, 1,
0.5289246, -0.7858444, 3.431267, 0.1647059, 0, 1, 1,
0.5390906, -2.347981, 3.377673, 0.1686275, 0, 1, 1,
0.5415283, 0.3939684, 3.834647, 0.1764706, 0, 1, 1,
0.5489519, -1.154185, 2.180355, 0.1803922, 0, 1, 1,
0.5543269, 1.647184, 1.08366, 0.1882353, 0, 1, 1,
0.5551012, -1.268275, 2.484549, 0.1921569, 0, 1, 1,
0.5566276, -0.8433989, 2.935886, 0.2, 0, 1, 1,
0.5598521, -0.7371201, 2.379742, 0.2078431, 0, 1, 1,
0.5603199, -1.306549, 1.2695, 0.2117647, 0, 1, 1,
0.5664009, -0.6131741, 3.919625, 0.2196078, 0, 1, 1,
0.5669025, -0.03010107, 2.127178, 0.2235294, 0, 1, 1,
0.5766405, 0.1956745, 2.028607, 0.2313726, 0, 1, 1,
0.5800263, -1.184694, 3.395066, 0.2352941, 0, 1, 1,
0.5809488, -0.2783957, 0.249991, 0.2431373, 0, 1, 1,
0.5820934, 0.01193709, 1.615928, 0.2470588, 0, 1, 1,
0.5837734, -0.1829585, 0.288583, 0.254902, 0, 1, 1,
0.5865659, -1.830988, 2.028837, 0.2588235, 0, 1, 1,
0.5869406, 0.885715, -0.7180045, 0.2666667, 0, 1, 1,
0.5933943, 0.2924556, 0.297197, 0.2705882, 0, 1, 1,
0.6029202, -0.4774885, 2.12985, 0.2784314, 0, 1, 1,
0.60524, -1.356416, 2.469879, 0.282353, 0, 1, 1,
0.6102074, -0.7871187, 0.4059071, 0.2901961, 0, 1, 1,
0.6118636, 1.301083, -0.241356, 0.2941177, 0, 1, 1,
0.6139365, -1.180457, 1.824757, 0.3019608, 0, 1, 1,
0.6148667, 0.3628879, 3.525369, 0.3098039, 0, 1, 1,
0.6156684, -0.08353109, 1.354492, 0.3137255, 0, 1, 1,
0.6239715, 1.195436, 0.9040633, 0.3215686, 0, 1, 1,
0.6241055, 0.02519387, 1.706832, 0.3254902, 0, 1, 1,
0.6250566, -1.742508, 2.081191, 0.3333333, 0, 1, 1,
0.626764, 0.6650772, 3.263299, 0.3372549, 0, 1, 1,
0.6398327, 1.635566, -0.645219, 0.345098, 0, 1, 1,
0.6399549, -0.6548047, 2.368702, 0.3490196, 0, 1, 1,
0.6417738, 1.179672, 0.5272441, 0.3568628, 0, 1, 1,
0.6473682, -0.4742866, 2.13011, 0.3607843, 0, 1, 1,
0.6513732, -1.14709, 0.9818084, 0.3686275, 0, 1, 1,
0.6521229, -1.733051, 3.60727, 0.372549, 0, 1, 1,
0.6522796, 0.424845, 1.037646, 0.3803922, 0, 1, 1,
0.6524405, -1.283263, 2.656244, 0.3843137, 0, 1, 1,
0.6528766, -0.4593221, 3.688627, 0.3921569, 0, 1, 1,
0.6538846, 0.5741267, 1.374038, 0.3960784, 0, 1, 1,
0.6540946, 1.25106, 0.1100401, 0.4039216, 0, 1, 1,
0.658886, 0.5800166, 0.8069091, 0.4117647, 0, 1, 1,
0.6594043, 0.6298689, 1.802918, 0.4156863, 0, 1, 1,
0.6596047, -1.168448, 0.813347, 0.4235294, 0, 1, 1,
0.6617221, -1.334172, 2.386319, 0.427451, 0, 1, 1,
0.6678118, 0.7335305, 1.168431, 0.4352941, 0, 1, 1,
0.6687924, 1.044818, 1.340454, 0.4392157, 0, 1, 1,
0.6697511, -0.9814922, 3.171526, 0.4470588, 0, 1, 1,
0.6742809, -0.116779, 0.977106, 0.4509804, 0, 1, 1,
0.6744716, 0.5879825, 1.705961, 0.4588235, 0, 1, 1,
0.6747327, 0.5770602, -0.2520221, 0.4627451, 0, 1, 1,
0.6761585, -0.2294718, 0.822899, 0.4705882, 0, 1, 1,
0.6777338, 1.433, -0.5745867, 0.4745098, 0, 1, 1,
0.6822725, -0.2378709, 0.2587022, 0.4823529, 0, 1, 1,
0.6865406, -0.01973524, 1.482962, 0.4862745, 0, 1, 1,
0.6908584, 1.008735, -0.3808695, 0.4941176, 0, 1, 1,
0.6919181, -1.779596, 5.031433, 0.5019608, 0, 1, 1,
0.6955069, 1.049235, -0.03074589, 0.5058824, 0, 1, 1,
0.7011474, -1.662066, 2.284472, 0.5137255, 0, 1, 1,
0.7013735, -0.4463589, 2.824727, 0.5176471, 0, 1, 1,
0.7050967, -0.1985542, 2.832734, 0.5254902, 0, 1, 1,
0.714104, -1.491823, 1.923051, 0.5294118, 0, 1, 1,
0.7200062, -0.09535632, 1.527432, 0.5372549, 0, 1, 1,
0.7231208, -1.776302, 1.79861, 0.5411765, 0, 1, 1,
0.7231747, 0.3563617, -0.001647182, 0.5490196, 0, 1, 1,
0.7282647, -0.624177, 0.8170645, 0.5529412, 0, 1, 1,
0.731548, -0.3928412, 2.291891, 0.5607843, 0, 1, 1,
0.7317038, -0.9291284, 1.776866, 0.5647059, 0, 1, 1,
0.7344801, -0.265294, 1.792603, 0.572549, 0, 1, 1,
0.7349877, 0.1732051, 1.729145, 0.5764706, 0, 1, 1,
0.7386547, 0.3515498, 0.2971118, 0.5843138, 0, 1, 1,
0.7386689, -0.511879, 1.710799, 0.5882353, 0, 1, 1,
0.7415527, 2.230978, 2.105611, 0.5960785, 0, 1, 1,
0.7421294, 1.160774, -0.4791451, 0.6039216, 0, 1, 1,
0.7449027, 0.7119226, 0.1669548, 0.6078432, 0, 1, 1,
0.7573346, 0.08245637, 0.441033, 0.6156863, 0, 1, 1,
0.7593612, 0.4449725, 0.2293951, 0.6196079, 0, 1, 1,
0.7606867, 0.1222838, 0.5059593, 0.627451, 0, 1, 1,
0.7636773, -0.04682902, 0.9136831, 0.6313726, 0, 1, 1,
0.7661341, -1.749282, 2.761126, 0.6392157, 0, 1, 1,
0.766817, -2.445814, 3.385839, 0.6431373, 0, 1, 1,
0.7689974, -0.4770646, 0.6310397, 0.6509804, 0, 1, 1,
0.7754327, -0.4218056, 2.952068, 0.654902, 0, 1, 1,
0.7791297, -1.225521, 3.271149, 0.6627451, 0, 1, 1,
0.7806338, 0.6898069, 1.439256, 0.6666667, 0, 1, 1,
0.7836643, -0.1901125, 3.356427, 0.6745098, 0, 1, 1,
0.7880554, -1.564891, 1.861532, 0.6784314, 0, 1, 1,
0.7917963, 0.3588935, 1.418152, 0.6862745, 0, 1, 1,
0.7963133, 1.264471, 1.51647, 0.6901961, 0, 1, 1,
0.7981611, -1.462151, 2.310695, 0.6980392, 0, 1, 1,
0.8053346, 0.2606194, 2.934678, 0.7058824, 0, 1, 1,
0.8066843, -1.501014, 2.719146, 0.7098039, 0, 1, 1,
0.8106454, -0.3796861, 1.449129, 0.7176471, 0, 1, 1,
0.8127842, -1.525672, 2.843437, 0.7215686, 0, 1, 1,
0.8157464, 0.8652889, 1.105951, 0.7294118, 0, 1, 1,
0.8164659, 0.0495745, 1.151645, 0.7333333, 0, 1, 1,
0.8198779, -0.09271273, 3.32535, 0.7411765, 0, 1, 1,
0.8234363, -0.760284, 3.598906, 0.7450981, 0, 1, 1,
0.8352869, -0.2909075, 3.578156, 0.7529412, 0, 1, 1,
0.8357399, 0.7155532, 3.243756, 0.7568628, 0, 1, 1,
0.8367292, -1.292935, 1.49851, 0.7647059, 0, 1, 1,
0.8394056, 0.5518287, 0.7299491, 0.7686275, 0, 1, 1,
0.8458176, 1.084733, 1.025749, 0.7764706, 0, 1, 1,
0.8492538, -0.2462737, 3.625281, 0.7803922, 0, 1, 1,
0.8509761, 0.6504007, -2.148438, 0.7882353, 0, 1, 1,
0.8513607, 0.8870385, 0.2455967, 0.7921569, 0, 1, 1,
0.8593053, 0.02894042, 0.3750431, 0.8, 0, 1, 1,
0.8597476, -0.8299428, 0.4609272, 0.8078431, 0, 1, 1,
0.862522, -0.4396166, 2.75547, 0.8117647, 0, 1, 1,
0.8633014, 1.551298, 2.644822, 0.8196079, 0, 1, 1,
0.8633111, 0.04758338, 2.738306, 0.8235294, 0, 1, 1,
0.8655551, 0.5861879, 1.189313, 0.8313726, 0, 1, 1,
0.8709709, -1.104295, 0.9026754, 0.8352941, 0, 1, 1,
0.8714705, 0.4372716, 0.06480309, 0.8431373, 0, 1, 1,
0.8738599, 0.1475234, 1.964415, 0.8470588, 0, 1, 1,
0.8764458, 0.9164848, -0.3783313, 0.854902, 0, 1, 1,
0.883258, 1.116841, 1.036848, 0.8588235, 0, 1, 1,
0.8855233, -0.2191819, 1.768169, 0.8666667, 0, 1, 1,
0.8926083, -0.5376704, 2.561279, 0.8705882, 0, 1, 1,
0.8929306, 0.3075375, 0.1748059, 0.8784314, 0, 1, 1,
0.8936296, -0.8110456, 2.787719, 0.8823529, 0, 1, 1,
0.898359, -0.2217035, -0.08866855, 0.8901961, 0, 1, 1,
0.901282, -0.1925666, 0.6688274, 0.8941177, 0, 1, 1,
0.9059823, -2.014213, 4.308362, 0.9019608, 0, 1, 1,
0.911949, 1.87882, -0.9308719, 0.9098039, 0, 1, 1,
0.9145179, -1.466199, 2.891981, 0.9137255, 0, 1, 1,
0.9158175, 1.502844, -0.07265384, 0.9215686, 0, 1, 1,
0.9165388, -0.9580951, 2.687865, 0.9254902, 0, 1, 1,
0.9215152, -0.4833855, 0.8587601, 0.9333333, 0, 1, 1,
0.9314358, -0.1031713, 2.226875, 0.9372549, 0, 1, 1,
0.9349322, -0.9275153, 3.161022, 0.945098, 0, 1, 1,
0.9379808, -0.5191172, 4.75244, 0.9490196, 0, 1, 1,
0.9449039, -0.1526845, 1.794152, 0.9568627, 0, 1, 1,
0.9476418, 1.744568, 1.760954, 0.9607843, 0, 1, 1,
0.9477293, 0.6393033, 1.988709, 0.9686275, 0, 1, 1,
0.9480015, 0.3839749, 1.113431, 0.972549, 0, 1, 1,
0.9513906, 1.335974, -1.325649, 0.9803922, 0, 1, 1,
0.9540869, -0.9927388, 2.532294, 0.9843137, 0, 1, 1,
0.9553587, 1.097657, 2.088712, 0.9921569, 0, 1, 1,
0.9563968, -0.05356121, 0.78452, 0.9960784, 0, 1, 1,
0.9573534, -1.282644, 5.278647, 1, 0, 0.9960784, 1,
0.9576453, -1.910255, 3.813417, 1, 0, 0.9882353, 1,
0.9665231, -0.5068086, 1.650402, 1, 0, 0.9843137, 1,
0.9733453, -0.02516473, 0.4508822, 1, 0, 0.9764706, 1,
0.9737035, -0.3922453, 1.502212, 1, 0, 0.972549, 1,
0.9753051, 0.542798, 0.3667182, 1, 0, 0.9647059, 1,
0.9816888, 0.6632531, 2.697905, 1, 0, 0.9607843, 1,
0.9917584, -0.580616, 3.541471, 1, 0, 0.9529412, 1,
0.9982796, -0.5948615, 1.646414, 1, 0, 0.9490196, 1,
1.013679, -0.3113721, 2.446127, 1, 0, 0.9411765, 1,
1.018181, 0.8997393, 1.472421, 1, 0, 0.9372549, 1,
1.024373, -0.05151825, 0.6980838, 1, 0, 0.9294118, 1,
1.026661, -0.6914079, 3.477487, 1, 0, 0.9254902, 1,
1.030452, -1.592343, 1.132797, 1, 0, 0.9176471, 1,
1.038265, -0.9712054, 2.02857, 1, 0, 0.9137255, 1,
1.048672, 1.049904, 0.9091072, 1, 0, 0.9058824, 1,
1.06609, 1.528168, 0.2027827, 1, 0, 0.9019608, 1,
1.070657, -0.8145364, 2.638561, 1, 0, 0.8941177, 1,
1.072271, 0.6129122, 0.4788737, 1, 0, 0.8862745, 1,
1.076705, -1.517941, 2.589278, 1, 0, 0.8823529, 1,
1.08026, 0.3755386, 2.934316, 1, 0, 0.8745098, 1,
1.094846, 0.06184347, 0.9796511, 1, 0, 0.8705882, 1,
1.098367, -0.06514032, 1.336957, 1, 0, 0.8627451, 1,
1.099316, -1.225683, 0.8736525, 1, 0, 0.8588235, 1,
1.101967, 1.560424, -0.4870095, 1, 0, 0.8509804, 1,
1.102502, 0.4693194, 0.6604444, 1, 0, 0.8470588, 1,
1.105103, -0.4380035, 0.6861212, 1, 0, 0.8392157, 1,
1.119214, -1.868241, 3.697793, 1, 0, 0.8352941, 1,
1.125129, 1.490352, -0.01861728, 1, 0, 0.827451, 1,
1.132117, -0.2334763, 1.599877, 1, 0, 0.8235294, 1,
1.134074, 0.3684214, 1.286423, 1, 0, 0.8156863, 1,
1.13832, 1.450533, 0.3324247, 1, 0, 0.8117647, 1,
1.141935, -0.4401902, 2.70646, 1, 0, 0.8039216, 1,
1.147375, 0.5613483, 1.060031, 1, 0, 0.7960784, 1,
1.158661, 1.741542, 1.058869, 1, 0, 0.7921569, 1,
1.162469, -0.2682643, 1.196338, 1, 0, 0.7843137, 1,
1.168848, 0.8784636, -0.2250248, 1, 0, 0.7803922, 1,
1.175424, 0.660062, 0.9924895, 1, 0, 0.772549, 1,
1.179364, 0.4864286, 2.862763, 1, 0, 0.7686275, 1,
1.191408, 2.028342, -1.007403, 1, 0, 0.7607843, 1,
1.204138, 0.1529565, 3.00099, 1, 0, 0.7568628, 1,
1.21236, 0.7394534, 1.51705, 1, 0, 0.7490196, 1,
1.212398, 1.328688, -0.536001, 1, 0, 0.7450981, 1,
1.212414, -0.1744849, 1.110727, 1, 0, 0.7372549, 1,
1.224434, 0.5498267, 0.5811879, 1, 0, 0.7333333, 1,
1.228812, 1.921232, 2.287741, 1, 0, 0.7254902, 1,
1.230845, 0.2483273, 2.006897, 1, 0, 0.7215686, 1,
1.232005, -1.612189, 2.450497, 1, 0, 0.7137255, 1,
1.25515, -0.4350953, 2.815017, 1, 0, 0.7098039, 1,
1.25926, -0.9588476, 0.5232301, 1, 0, 0.7019608, 1,
1.259755, 0.003411667, 1.681201, 1, 0, 0.6941177, 1,
1.262979, -0.08056358, 1.28228, 1, 0, 0.6901961, 1,
1.262986, 0.2808882, 1.2676, 1, 0, 0.682353, 1,
1.278196, 0.6462587, 2.379744, 1, 0, 0.6784314, 1,
1.283435, 0.8115125, 0.7376736, 1, 0, 0.6705883, 1,
1.284538, 0.7275457, 1.837969, 1, 0, 0.6666667, 1,
1.286348, 0.06504886, 1.804061, 1, 0, 0.6588235, 1,
1.306648, 0.1326891, 1.379754, 1, 0, 0.654902, 1,
1.310766, 2.030265, 1.295146, 1, 0, 0.6470588, 1,
1.317594, -0.8747806, 2.121526, 1, 0, 0.6431373, 1,
1.323221, 0.4746471, 0.4410858, 1, 0, 0.6352941, 1,
1.32538, -1.238972, 2.608438, 1, 0, 0.6313726, 1,
1.333144, 0.9797981, 2.662029, 1, 0, 0.6235294, 1,
1.336283, 1.326517, -0.5629348, 1, 0, 0.6196079, 1,
1.339306, 0.1794127, 2.247406, 1, 0, 0.6117647, 1,
1.34161, 0.2466323, 0.7157294, 1, 0, 0.6078432, 1,
1.344693, 1.998926, 0.3861501, 1, 0, 0.6, 1,
1.345202, -0.1327704, 0.5347279, 1, 0, 0.5921569, 1,
1.34669, -0.5696965, 1.347529, 1, 0, 0.5882353, 1,
1.347229, -1.76672, 2.894454, 1, 0, 0.5803922, 1,
1.354176, -0.7148708, 2.6468, 1, 0, 0.5764706, 1,
1.35598, -0.8805624, 2.286187, 1, 0, 0.5686275, 1,
1.36373, 0.4056808, 1.937489, 1, 0, 0.5647059, 1,
1.365805, 1.433387, 1.21336, 1, 0, 0.5568628, 1,
1.373968, -1.180467, 1.911488, 1, 0, 0.5529412, 1,
1.394399, 1.323829, 1.865247, 1, 0, 0.5450981, 1,
1.396157, -0.9715529, 2.820357, 1, 0, 0.5411765, 1,
1.415648, 0.9848076, 3.565321, 1, 0, 0.5333334, 1,
1.416966, 0.6181454, 0.03837266, 1, 0, 0.5294118, 1,
1.418909, -1.741633, 2.35496, 1, 0, 0.5215687, 1,
1.435678, 0.03107124, -0.0213499, 1, 0, 0.5176471, 1,
1.438041, -0.6064789, 3.197872, 1, 0, 0.509804, 1,
1.439243, 0.6767315, -0.8828951, 1, 0, 0.5058824, 1,
1.450312, 0.1580167, 2.127308, 1, 0, 0.4980392, 1,
1.453053, -0.7421249, 2.342776, 1, 0, 0.4901961, 1,
1.461072, 0.2920539, 2.375187, 1, 0, 0.4862745, 1,
1.463448, 0.007519817, 2.392525, 1, 0, 0.4784314, 1,
1.469902, 1.671749, 1.95762, 1, 0, 0.4745098, 1,
1.476014, 0.5325814, 1.233337, 1, 0, 0.4666667, 1,
1.488907, 0.7902108, 0.2321597, 1, 0, 0.4627451, 1,
1.497745, -1.353871, 2.545179, 1, 0, 0.454902, 1,
1.500558, 0.747068, -2.573384, 1, 0, 0.4509804, 1,
1.504238, -1.856378, 2.965509, 1, 0, 0.4431373, 1,
1.508557, 1.320495, 2.363167, 1, 0, 0.4392157, 1,
1.510407, -1.195041, 1.716975, 1, 0, 0.4313726, 1,
1.526086, 0.4815666, 3.018305, 1, 0, 0.427451, 1,
1.526921, -0.94284, 0.550937, 1, 0, 0.4196078, 1,
1.535658, 2.07207, -0.7271348, 1, 0, 0.4156863, 1,
1.559689, -0.007373335, 3.010239, 1, 0, 0.4078431, 1,
1.562377, -0.173555, 2.173703, 1, 0, 0.4039216, 1,
1.563911, 1.344564, 1.853556, 1, 0, 0.3960784, 1,
1.56548, -0.1275858, 2.923381, 1, 0, 0.3882353, 1,
1.572061, 1.163257, -0.3473286, 1, 0, 0.3843137, 1,
1.573595, -0.2466017, 1.304074, 1, 0, 0.3764706, 1,
1.576236, 1.376764, 0.8840192, 1, 0, 0.372549, 1,
1.579655, 1.784178, 0.3563822, 1, 0, 0.3647059, 1,
1.582706, 0.0498951, 2.168159, 1, 0, 0.3607843, 1,
1.591135, -0.9383215, 2.523988, 1, 0, 0.3529412, 1,
1.598074, 0.7281331, 1.351777, 1, 0, 0.3490196, 1,
1.608453, -0.2124521, 3.074336, 1, 0, 0.3411765, 1,
1.632023, -0.6602972, 2.366774, 1, 0, 0.3372549, 1,
1.649896, 1.106786, 1.174536, 1, 0, 0.3294118, 1,
1.664742, -0.7263206, 1.713128, 1, 0, 0.3254902, 1,
1.666619, 2.151124, 1.974443, 1, 0, 0.3176471, 1,
1.673783, 1.833926, 0.2956411, 1, 0, 0.3137255, 1,
1.676431, -2.551162, 2.848797, 1, 0, 0.3058824, 1,
1.686703, 0.8084126, -0.06283911, 1, 0, 0.2980392, 1,
1.695751, 0.7397583, -0.1186943, 1, 0, 0.2941177, 1,
1.698453, 0.4386987, 1.467846, 1, 0, 0.2862745, 1,
1.721555, -0.689849, 2.518817, 1, 0, 0.282353, 1,
1.729867, -0.01641876, 2.518924, 1, 0, 0.2745098, 1,
1.730828, -0.5307212, 2.474479, 1, 0, 0.2705882, 1,
1.740067, -1.192252, 2.556122, 1, 0, 0.2627451, 1,
1.744475, 1.397941, 1.236681, 1, 0, 0.2588235, 1,
1.74458, 0.7728704, 2.878449, 1, 0, 0.2509804, 1,
1.751433, -0.7329303, 2.548023, 1, 0, 0.2470588, 1,
1.757982, -0.4011463, 0.5455574, 1, 0, 0.2392157, 1,
1.761383, 0.2948845, 2.275915, 1, 0, 0.2352941, 1,
1.805476, -0.8749114, 2.797756, 1, 0, 0.227451, 1,
1.822739, 1.403737, 2.316292, 1, 0, 0.2235294, 1,
1.842162, 1.232622, -0.004659323, 1, 0, 0.2156863, 1,
1.854321, -0.04924587, 1.471863, 1, 0, 0.2117647, 1,
1.854474, -0.5619045, 1.262619, 1, 0, 0.2039216, 1,
1.85717, 0.1930064, 1.906939, 1, 0, 0.1960784, 1,
1.861831, -0.4102726, 0.3777071, 1, 0, 0.1921569, 1,
1.862564, -0.165364, 0.6574438, 1, 0, 0.1843137, 1,
1.896457, -0.3864679, 2.100691, 1, 0, 0.1803922, 1,
1.906907, -0.02987632, 1.486949, 1, 0, 0.172549, 1,
1.929794, -0.06583042, 0.8505397, 1, 0, 0.1686275, 1,
1.933353, 2.619021, 0.367597, 1, 0, 0.1607843, 1,
1.949482, 0.552232, 1.692465, 1, 0, 0.1568628, 1,
1.973271, 1.075882, 0.1819107, 1, 0, 0.1490196, 1,
1.981621, -1.271217, 2.071721, 1, 0, 0.145098, 1,
1.984847, 0.3396192, 1.128963, 1, 0, 0.1372549, 1,
2.026909, 1.490708, 1.337292, 1, 0, 0.1333333, 1,
2.035496, 0.3579061, 0.006169009, 1, 0, 0.1254902, 1,
2.045475, 0.5356179, 2.296455, 1, 0, 0.1215686, 1,
2.064896, 1.952704, 1.446456, 1, 0, 0.1137255, 1,
2.076239, -0.1023059, 2.858341, 1, 0, 0.1098039, 1,
2.092943, 0.1726989, 2.392235, 1, 0, 0.1019608, 1,
2.10694, 0.4856367, 1.927765, 1, 0, 0.09411765, 1,
2.11447, 0.3286346, 2.146991, 1, 0, 0.09019608, 1,
2.138864, 0.490014, -0.3792794, 1, 0, 0.08235294, 1,
2.159572, -1.007932, 0.4261527, 1, 0, 0.07843138, 1,
2.206769, 0.5829014, 0.5537797, 1, 0, 0.07058824, 1,
2.287698, -0.7858945, 1.512686, 1, 0, 0.06666667, 1,
2.289153, -1.363838, 4.535031, 1, 0, 0.05882353, 1,
2.372107, 0.2178801, 1.167525, 1, 0, 0.05490196, 1,
2.473573, 1.133431, 0.7287865, 1, 0, 0.04705882, 1,
2.569731, -0.08178798, 1.241478, 1, 0, 0.04313726, 1,
2.615542, -1.321762, 1.768896, 1, 0, 0.03529412, 1,
2.626189, 0.9383106, 0.9959904, 1, 0, 0.03137255, 1,
2.756168, -0.5748186, 3.62056, 1, 0, 0.02352941, 1,
2.80479, -0.4373415, 3.369364, 1, 0, 0.01960784, 1,
2.994425, -0.2716982, 0.9384326, 1, 0, 0.01176471, 1,
3.713962, 0.1698466, 0.9842511, 1, 0, 0.007843138, 1
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
0.06699502, -3.892781, -6.650504, 0, -0.5, 0.5, 0.5,
0.06699502, -3.892781, -6.650504, 1, -0.5, 0.5, 0.5,
0.06699502, -3.892781, -6.650504, 1, 1.5, 0.5, 0.5,
0.06699502, -3.892781, -6.650504, 0, 1.5, 0.5, 0.5
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
-4.816294, -0.01913416, -6.650504, 0, -0.5, 0.5, 0.5,
-4.816294, -0.01913416, -6.650504, 1, -0.5, 0.5, 0.5,
-4.816294, -0.01913416, -6.650504, 1, 1.5, 0.5, 0.5,
-4.816294, -0.01913416, -6.650504, 0, 1.5, 0.5, 0.5
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
-4.816294, -3.892781, 0.1785398, 0, -0.5, 0.5, 0.5,
-4.816294, -3.892781, 0.1785398, 1, -0.5, 0.5, 0.5,
-4.816294, -3.892781, 0.1785398, 1, 1.5, 0.5, 0.5,
-4.816294, -3.892781, 0.1785398, 0, 1.5, 0.5, 0.5
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
-2, -2.998863, -5.074571,
2, -2.998863, -5.074571,
-2, -2.998863, -5.074571,
-2, -3.147849, -5.337226,
0, -2.998863, -5.074571,
0, -3.147849, -5.337226,
2, -2.998863, -5.074571,
2, -3.147849, -5.337226
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
-2, -3.445822, -5.862537, 0, -0.5, 0.5, 0.5,
-2, -3.445822, -5.862537, 1, -0.5, 0.5, 0.5,
-2, -3.445822, -5.862537, 1, 1.5, 0.5, 0.5,
-2, -3.445822, -5.862537, 0, 1.5, 0.5, 0.5,
0, -3.445822, -5.862537, 0, -0.5, 0.5, 0.5,
0, -3.445822, -5.862537, 1, -0.5, 0.5, 0.5,
0, -3.445822, -5.862537, 1, 1.5, 0.5, 0.5,
0, -3.445822, -5.862537, 0, 1.5, 0.5, 0.5,
2, -3.445822, -5.862537, 0, -0.5, 0.5, 0.5,
2, -3.445822, -5.862537, 1, -0.5, 0.5, 0.5,
2, -3.445822, -5.862537, 1, 1.5, 0.5, 0.5,
2, -3.445822, -5.862537, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.689381, -2, -5.074571,
-3.689381, 2, -5.074571,
-3.689381, -2, -5.074571,
-3.8772, -2, -5.337226,
-3.689381, -1, -5.074571,
-3.8772, -1, -5.337226,
-3.689381, 0, -5.074571,
-3.8772, 0, -5.337226,
-3.689381, 1, -5.074571,
-3.8772, 1, -5.337226,
-3.689381, 2, -5.074571,
-3.8772, 2, -5.337226
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
-4.252838, -2, -5.862537, 0, -0.5, 0.5, 0.5,
-4.252838, -2, -5.862537, 1, -0.5, 0.5, 0.5,
-4.252838, -2, -5.862537, 1, 1.5, 0.5, 0.5,
-4.252838, -2, -5.862537, 0, 1.5, 0.5, 0.5,
-4.252838, -1, -5.862537, 0, -0.5, 0.5, 0.5,
-4.252838, -1, -5.862537, 1, -0.5, 0.5, 0.5,
-4.252838, -1, -5.862537, 1, 1.5, 0.5, 0.5,
-4.252838, -1, -5.862537, 0, 1.5, 0.5, 0.5,
-4.252838, 0, -5.862537, 0, -0.5, 0.5, 0.5,
-4.252838, 0, -5.862537, 1, -0.5, 0.5, 0.5,
-4.252838, 0, -5.862537, 1, 1.5, 0.5, 0.5,
-4.252838, 0, -5.862537, 0, 1.5, 0.5, 0.5,
-4.252838, 1, -5.862537, 0, -0.5, 0.5, 0.5,
-4.252838, 1, -5.862537, 1, -0.5, 0.5, 0.5,
-4.252838, 1, -5.862537, 1, 1.5, 0.5, 0.5,
-4.252838, 1, -5.862537, 0, 1.5, 0.5, 0.5,
-4.252838, 2, -5.862537, 0, -0.5, 0.5, 0.5,
-4.252838, 2, -5.862537, 1, -0.5, 0.5, 0.5,
-4.252838, 2, -5.862537, 1, 1.5, 0.5, 0.5,
-4.252838, 2, -5.862537, 0, 1.5, 0.5, 0.5
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
-3.689381, -2.998863, -4,
-3.689381, -2.998863, 4,
-3.689381, -2.998863, -4,
-3.8772, -3.147849, -4,
-3.689381, -2.998863, -2,
-3.8772, -3.147849, -2,
-3.689381, -2.998863, 0,
-3.8772, -3.147849, 0,
-3.689381, -2.998863, 2,
-3.8772, -3.147849, 2,
-3.689381, -2.998863, 4,
-3.8772, -3.147849, 4
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
-4.252838, -3.445822, -4, 0, -0.5, 0.5, 0.5,
-4.252838, -3.445822, -4, 1, -0.5, 0.5, 0.5,
-4.252838, -3.445822, -4, 1, 1.5, 0.5, 0.5,
-4.252838, -3.445822, -4, 0, 1.5, 0.5, 0.5,
-4.252838, -3.445822, -2, 0, -0.5, 0.5, 0.5,
-4.252838, -3.445822, -2, 1, -0.5, 0.5, 0.5,
-4.252838, -3.445822, -2, 1, 1.5, 0.5, 0.5,
-4.252838, -3.445822, -2, 0, 1.5, 0.5, 0.5,
-4.252838, -3.445822, 0, 0, -0.5, 0.5, 0.5,
-4.252838, -3.445822, 0, 1, -0.5, 0.5, 0.5,
-4.252838, -3.445822, 0, 1, 1.5, 0.5, 0.5,
-4.252838, -3.445822, 0, 0, 1.5, 0.5, 0.5,
-4.252838, -3.445822, 2, 0, -0.5, 0.5, 0.5,
-4.252838, -3.445822, 2, 1, -0.5, 0.5, 0.5,
-4.252838, -3.445822, 2, 1, 1.5, 0.5, 0.5,
-4.252838, -3.445822, 2, 0, 1.5, 0.5, 0.5,
-4.252838, -3.445822, 4, 0, -0.5, 0.5, 0.5,
-4.252838, -3.445822, 4, 1, -0.5, 0.5, 0.5,
-4.252838, -3.445822, 4, 1, 1.5, 0.5, 0.5,
-4.252838, -3.445822, 4, 0, 1.5, 0.5, 0.5
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
-3.689381, -2.998863, -5.074571,
-3.689381, 2.960594, -5.074571,
-3.689381, -2.998863, 5.43165,
-3.689381, 2.960594, 5.43165,
-3.689381, -2.998863, -5.074571,
-3.689381, -2.998863, 5.43165,
-3.689381, 2.960594, -5.074571,
-3.689381, 2.960594, 5.43165,
-3.689381, -2.998863, -5.074571,
3.823371, -2.998863, -5.074571,
-3.689381, -2.998863, 5.43165,
3.823371, -2.998863, 5.43165,
-3.689381, 2.960594, -5.074571,
3.823371, 2.960594, -5.074571,
-3.689381, 2.960594, 5.43165,
3.823371, 2.960594, 5.43165,
3.823371, -2.998863, -5.074571,
3.823371, 2.960594, -5.074571,
3.823371, -2.998863, 5.43165,
3.823371, 2.960594, 5.43165,
3.823371, -2.998863, -5.074571,
3.823371, -2.998863, 5.43165,
3.823371, 2.960594, -5.074571,
3.823371, 2.960594, 5.43165
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
var radius = 7.595623;
var distance = 33.79379;
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
mvMatrix.translate( -0.06699502, 0.01913416, -0.1785398 );
mvMatrix.scale( 1.093146, 1.378068, 0.7816832 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.79379);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
flurenol-butyl<-read.table("flurenol-butyl.xyz")
```

```
## Error in read.table("flurenol-butyl.xyz"): no lines available in input
```

```r
x<-flurenol-butyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'flurenol' not found
```

```r
y<-flurenol-butyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'flurenol' not found
```

```r
z<-flurenol-butyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'flurenol' not found
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
-3.579972, 0.625746, -2.144809, 0, 0, 1, 1, 1,
-3.311585, -0.6254804, -0.7962813, 1, 0, 0, 1, 1,
-3.028829, -0.7969615, -1.508242, 1, 0, 0, 1, 1,
-2.802237, 0.486432, -0.9000242, 1, 0, 0, 1, 1,
-2.512525, 1.437514, -1.956129, 1, 0, 0, 1, 1,
-2.486319, 0.3943475, -2.996813, 1, 0, 0, 1, 1,
-2.480762, 0.7873151, -1.765209, 0, 0, 0, 1, 1,
-2.473058, -0.6049934, -1.651189, 0, 0, 0, 1, 1,
-2.460402, 0.07413427, -2.350118, 0, 0, 0, 1, 1,
-2.383121, -1.331451, -3.432656, 0, 0, 0, 1, 1,
-2.342339, 0.981164, 0.1902514, 0, 0, 0, 1, 1,
-2.296908, -0.5736713, -3.781559, 0, 0, 0, 1, 1,
-2.219718, -0.512639, -2.809227, 0, 0, 0, 1, 1,
-2.121866, 0.2550031, -1.49574, 1, 1, 1, 1, 1,
-2.08729, 1.376555, -2.060378, 1, 1, 1, 1, 1,
-2.070467, 2.873806, -1.107367, 1, 1, 1, 1, 1,
-2.036228, 0.890812, -0.7687867, 1, 1, 1, 1, 1,
-1.976991, 0.5189768, -2.120377, 1, 1, 1, 1, 1,
-1.974584, -0.1959433, -2.417613, 1, 1, 1, 1, 1,
-1.967007, -0.05848108, -1.293284, 1, 1, 1, 1, 1,
-1.966625, -0.03417994, -1.417536, 1, 1, 1, 1, 1,
-1.963116, 0.5044926, 0.8170274, 1, 1, 1, 1, 1,
-1.927978, -0.59426, -1.995042, 1, 1, 1, 1, 1,
-1.914746, -0.8703507, -4.358083, 1, 1, 1, 1, 1,
-1.898253, -0.2291923, -2.581756, 1, 1, 1, 1, 1,
-1.887908, -0.02767185, -0.4015755, 1, 1, 1, 1, 1,
-1.88561, 0.1264994, -2.209636, 1, 1, 1, 1, 1,
-1.884353, -1.681118, -2.068493, 1, 1, 1, 1, 1,
-1.848557, 0.6999663, 0.489674, 0, 0, 1, 1, 1,
-1.825035, 0.7769754, -1.736023, 1, 0, 0, 1, 1,
-1.774788, 0.9695972, -2.128996, 1, 0, 0, 1, 1,
-1.762122, 1.077124, -0.3249232, 1, 0, 0, 1, 1,
-1.758293, 0.4471002, -3.213636, 1, 0, 0, 1, 1,
-1.747444, 0.0147596, -2.24572, 1, 0, 0, 1, 1,
-1.713129, -0.1638034, -1.572431, 0, 0, 0, 1, 1,
-1.694166, -0.07249206, -1.443065, 0, 0, 0, 1, 1,
-1.68659, 0.1244222, -1.554036, 0, 0, 0, 1, 1,
-1.680788, -0.6277051, -1.278419, 0, 0, 0, 1, 1,
-1.662227, 0.4430491, -2.142749, 0, 0, 0, 1, 1,
-1.651199, -1.268899, -1.988126, 0, 0, 0, 1, 1,
-1.641046, 0.7430086, -1.346648, 0, 0, 0, 1, 1,
-1.630796, 0.3001948, -0.9571917, 1, 1, 1, 1, 1,
-1.601204, -1.158751, -3.133195, 1, 1, 1, 1, 1,
-1.589864, -0.7567828, -2.649347, 1, 1, 1, 1, 1,
-1.589437, 0.9154998, -1.110034, 1, 1, 1, 1, 1,
-1.588206, -0.2357763, 0.3721491, 1, 1, 1, 1, 1,
-1.582409, 1.281361, -2.321886, 1, 1, 1, 1, 1,
-1.577702, 0.2923566, -0.8634247, 1, 1, 1, 1, 1,
-1.572824, -1.419424, -2.280316, 1, 1, 1, 1, 1,
-1.538494, 0.8644329, -0.8234423, 1, 1, 1, 1, 1,
-1.528626, 0.6424179, -1.612343, 1, 1, 1, 1, 1,
-1.524166, 0.6461845, -2.316191, 1, 1, 1, 1, 1,
-1.501127, 1.879274, -1.571575, 1, 1, 1, 1, 1,
-1.487113, 0.007120612, -1.391336, 1, 1, 1, 1, 1,
-1.485227, 0.2899924, -3.4702, 1, 1, 1, 1, 1,
-1.484574, -0.527982, -2.182982, 1, 1, 1, 1, 1,
-1.477677, 1.471459, -1.738365, 0, 0, 1, 1, 1,
-1.467618, 0.331673, -1.584462, 1, 0, 0, 1, 1,
-1.466899, -1.059287, -2.557572, 1, 0, 0, 1, 1,
-1.463108, -0.04061301, -2.92381, 1, 0, 0, 1, 1,
-1.45599, -0.9625506, -2.142403, 1, 0, 0, 1, 1,
-1.448399, -1.269623, -0.8181878, 1, 0, 0, 1, 1,
-1.444837, -0.5022298, -1.858045, 0, 0, 0, 1, 1,
-1.44028, -1.381156, -0.444705, 0, 0, 0, 1, 1,
-1.433561, -0.9097722, -2.050617, 0, 0, 0, 1, 1,
-1.412551, -0.3011167, -1.146262, 0, 0, 0, 1, 1,
-1.411723, 0.6220074, -2.318744, 0, 0, 0, 1, 1,
-1.389732, 1.875377, -0.5864545, 0, 0, 0, 1, 1,
-1.38514, -0.6246311, -2.708596, 0, 0, 0, 1, 1,
-1.377892, -2.000181, -3.235838, 1, 1, 1, 1, 1,
-1.373374, -0.6530267, -3.133533, 1, 1, 1, 1, 1,
-1.370112, -0.1022513, -2.705396, 1, 1, 1, 1, 1,
-1.350036, 0.3058403, 0.6544012, 1, 1, 1, 1, 1,
-1.338185, -0.6947638, -3.029835, 1, 1, 1, 1, 1,
-1.336037, 0.59452, -1.717598, 1, 1, 1, 1, 1,
-1.331576, -0.6608324, -2.382603, 1, 1, 1, 1, 1,
-1.327111, -0.6120275, -0.9397287, 1, 1, 1, 1, 1,
-1.32057, -0.3299185, -1.674489, 1, 1, 1, 1, 1,
-1.318988, 0.07523765, -2.89665, 1, 1, 1, 1, 1,
-1.3042, 0.7268209, 0.3123495, 1, 1, 1, 1, 1,
-1.303789, 0.3959957, -3.045356, 1, 1, 1, 1, 1,
-1.301787, -1.666648, -3.180843, 1, 1, 1, 1, 1,
-1.301531, -0.4581847, -3.559657, 1, 1, 1, 1, 1,
-1.300107, 0.9018671, -2.842603, 1, 1, 1, 1, 1,
-1.299014, -1.784808, -3.577419, 0, 0, 1, 1, 1,
-1.298291, 0.1396079, -1.17641, 1, 0, 0, 1, 1,
-1.287477, 0.0007479465, -1.316479, 1, 0, 0, 1, 1,
-1.285803, -2.210299, -2.542934, 1, 0, 0, 1, 1,
-1.283083, -0.4601852, -3.105338, 1, 0, 0, 1, 1,
-1.281123, -0.756496, -3.735394, 1, 0, 0, 1, 1,
-1.276977, 0.6646828, 0.4930505, 0, 0, 0, 1, 1,
-1.275619, 1.026412, 0.4649811, 0, 0, 0, 1, 1,
-1.267487, 0.9924951, 0.3958756, 0, 0, 0, 1, 1,
-1.265952, 1.32424, -1.002987, 0, 0, 0, 1, 1,
-1.258491, -0.5873739, -2.60096, 0, 0, 0, 1, 1,
-1.25349, -0.2526829, -2.213949, 0, 0, 0, 1, 1,
-1.248843, -0.1372977, -0.622232, 0, 0, 0, 1, 1,
-1.246366, 0.09599697, -2.857161, 1, 1, 1, 1, 1,
-1.243807, -1.391909, -1.476266, 1, 1, 1, 1, 1,
-1.242787, -0.1757089, -0.3395047, 1, 1, 1, 1, 1,
-1.236849, 2.302331, -0.1901478, 1, 1, 1, 1, 1,
-1.229097, -0.6094652, -1.718347, 1, 1, 1, 1, 1,
-1.229027, -0.09173599, -2.398555, 1, 1, 1, 1, 1,
-1.225373, 1.924492, 0.3805777, 1, 1, 1, 1, 1,
-1.216427, -2.100554, -2.699581, 1, 1, 1, 1, 1,
-1.210499, -2.670828, -3.944566, 1, 1, 1, 1, 1,
-1.209137, 0.951809, -0.9849699, 1, 1, 1, 1, 1,
-1.205508, -0.5497663, -0.1553227, 1, 1, 1, 1, 1,
-1.1938, -0.01711792, -2.596874, 1, 1, 1, 1, 1,
-1.183286, -1.058994, -1.675424, 1, 1, 1, 1, 1,
-1.177556, -0.439655, -1.027426, 1, 1, 1, 1, 1,
-1.177452, -0.6120752, -2.430532, 1, 1, 1, 1, 1,
-1.174554, -0.05162742, -1.125366, 0, 0, 1, 1, 1,
-1.171451, 1.177913, 0.3873826, 1, 0, 0, 1, 1,
-1.17085, -0.2682076, -1.569229, 1, 0, 0, 1, 1,
-1.169578, 0.8768494, -2.236981, 1, 0, 0, 1, 1,
-1.167724, -1.382875, -1.690458, 1, 0, 0, 1, 1,
-1.163198, -0.4693784, -1.132657, 1, 0, 0, 1, 1,
-1.161094, -0.606356, -0.9948961, 0, 0, 0, 1, 1,
-1.156446, 1.169122, -1.776819, 0, 0, 0, 1, 1,
-1.145606, 0.1538098, -1.637987, 0, 0, 0, 1, 1,
-1.140106, -0.08147161, -1.7564, 0, 0, 0, 1, 1,
-1.135241, 0.66147, -2.657864, 0, 0, 0, 1, 1,
-1.134554, 2.140475, -2.351015, 0, 0, 0, 1, 1,
-1.132286, -0.682896, -2.877989, 0, 0, 0, 1, 1,
-1.12865, 0.2605349, -1.170837, 1, 1, 1, 1, 1,
-1.128474, 0.6645166, -1.25097, 1, 1, 1, 1, 1,
-1.12302, 0.5875884, -1.550021, 1, 1, 1, 1, 1,
-1.122717, -0.5609066, -1.501442, 1, 1, 1, 1, 1,
-1.11596, -0.4538943, -1.251367, 1, 1, 1, 1, 1,
-1.111058, -1.049851, -2.576556, 1, 1, 1, 1, 1,
-1.106233, -1.159052, -2.672292, 1, 1, 1, 1, 1,
-1.105353, -0.8087349, -1.642823, 1, 1, 1, 1, 1,
-1.100044, 0.7748001, -0.8958649, 1, 1, 1, 1, 1,
-1.09737, -0.8729518, -3.659685, 1, 1, 1, 1, 1,
-1.093942, 1.178184, -1.692981, 1, 1, 1, 1, 1,
-1.091049, -0.4099787, -0.8996524, 1, 1, 1, 1, 1,
-1.089854, 0.4048352, -2.703823, 1, 1, 1, 1, 1,
-1.089192, 1.357524, -1.532627, 1, 1, 1, 1, 1,
-1.086034, -0.6952265, -3.262625, 1, 1, 1, 1, 1,
-1.080796, 1.355145, -0.2412963, 0, 0, 1, 1, 1,
-1.071959, 0.7327055, -1.789751, 1, 0, 0, 1, 1,
-1.07121, -0.7030714, -2.92059, 1, 0, 0, 1, 1,
-1.070868, 1.249688, -1.464051, 1, 0, 0, 1, 1,
-1.065647, -0.3455942, -1.996867, 1, 0, 0, 1, 1,
-1.05921, 0.3781359, -2.499506, 1, 0, 0, 1, 1,
-1.053947, 0.7938233, -0.8989046, 0, 0, 0, 1, 1,
-1.04976, 0.01669929, -2.083313, 0, 0, 0, 1, 1,
-1.044085, -0.282972, -2.29353, 0, 0, 0, 1, 1,
-1.037828, 0.69164, 0.1437647, 0, 0, 0, 1, 1,
-1.037059, 0.1296219, -3.525358, 0, 0, 0, 1, 1,
-1.034932, 1.665578, -1.545911, 0, 0, 0, 1, 1,
-1.022527, -0.3028161, -2.648586, 0, 0, 0, 1, 1,
-1.015827, 1.346138, -0.7888007, 1, 1, 1, 1, 1,
-1.015327, -0.960135, -2.271896, 1, 1, 1, 1, 1,
-1.015017, 1.503498, -1.231591, 1, 1, 1, 1, 1,
-1.014167, 0.8700162, -1.657104, 1, 1, 1, 1, 1,
-1.009991, -0.274715, -0.9439248, 1, 1, 1, 1, 1,
-1.008214, 0.3776658, -1.399165, 1, 1, 1, 1, 1,
-1.005392, 1.554788, 0.6440851, 1, 1, 1, 1, 1,
-0.9983938, 0.5511, 0.6261221, 1, 1, 1, 1, 1,
-0.9964171, -0.794647, -1.306256, 1, 1, 1, 1, 1,
-0.9913867, -1.059896, -2.760108, 1, 1, 1, 1, 1,
-0.9874399, -0.5708258, -3.430037, 1, 1, 1, 1, 1,
-0.9781508, 0.983278, 0.3526385, 1, 1, 1, 1, 1,
-0.9735786, 0.2691493, 0.3255331, 1, 1, 1, 1, 1,
-0.9690287, 0.09210663, -1.397784, 1, 1, 1, 1, 1,
-0.9658748, -0.9390166, -3.033949, 1, 1, 1, 1, 1,
-0.9626594, -0.5738637, -1.008893, 0, 0, 1, 1, 1,
-0.9603981, 0.4992685, -0.7247553, 1, 0, 0, 1, 1,
-0.9585176, 0.1763533, -2.373968, 1, 0, 0, 1, 1,
-0.9530429, -1.236779, -4.025274, 1, 0, 0, 1, 1,
-0.9464222, 0.8153834, -0.456765, 1, 0, 0, 1, 1,
-0.9436789, 0.4830431, -0.4485841, 1, 0, 0, 1, 1,
-0.9430647, 0.7794917, -1.355539, 0, 0, 0, 1, 1,
-0.9377574, 1.196161, 1.181282, 0, 0, 0, 1, 1,
-0.9367276, -0.565404, -1.601552, 0, 0, 0, 1, 1,
-0.932376, 0.3951042, 0.01176661, 0, 0, 0, 1, 1,
-0.9294301, 1.051851, -0.7731512, 0, 0, 0, 1, 1,
-0.9219631, 2.494204, -0.6010765, 0, 0, 0, 1, 1,
-0.9141487, -1.636373, -3.279316, 0, 0, 0, 1, 1,
-0.9063531, 0.06497189, -1.980943, 1, 1, 1, 1, 1,
-0.899475, 0.9043581, -1.427134, 1, 1, 1, 1, 1,
-0.8978313, 0.7444036, -0.3099522, 1, 1, 1, 1, 1,
-0.8974791, -0.698747, -2.552717, 1, 1, 1, 1, 1,
-0.8967844, -0.005396809, -3.300177, 1, 1, 1, 1, 1,
-0.892815, 1.520516, -2.834992, 1, 1, 1, 1, 1,
-0.8898741, -2.072464, -1.770501, 1, 1, 1, 1, 1,
-0.8881437, 1.847546, -1.523436, 1, 1, 1, 1, 1,
-0.8870954, 1.383957, -0.6437495, 1, 1, 1, 1, 1,
-0.8814021, 0.1688456, -1.337511, 1, 1, 1, 1, 1,
-0.87962, -1.868671, -2.19789, 1, 1, 1, 1, 1,
-0.8776257, -0.041981, -2.002088, 1, 1, 1, 1, 1,
-0.8760338, -1.32664, -2.222718, 1, 1, 1, 1, 1,
-0.8652999, 0.4947793, -0.98313, 1, 1, 1, 1, 1,
-0.8604526, 0.5898578, -2.065139, 1, 1, 1, 1, 1,
-0.8546762, -0.1400161, -3.871256, 0, 0, 1, 1, 1,
-0.8519413, 0.8255872, -2.508647, 1, 0, 0, 1, 1,
-0.846683, -0.412847, -2.091874, 1, 0, 0, 1, 1,
-0.8373397, 0.7640086, -1.078162, 1, 0, 0, 1, 1,
-0.8348833, 0.2172949, -0.8492841, 1, 0, 0, 1, 1,
-0.8331959, 0.3695658, -0.7901422, 1, 0, 0, 1, 1,
-0.8246022, 1.724195, 0.4308826, 0, 0, 0, 1, 1,
-0.8244408, 1.698607, -1.008393, 0, 0, 0, 1, 1,
-0.8226703, -0.8798059, -2.05863, 0, 0, 0, 1, 1,
-0.8200598, -0.774981, -2.419571, 0, 0, 0, 1, 1,
-0.8123943, 0.53351, -0.3973164, 0, 0, 0, 1, 1,
-0.7972013, 1.13778, -0.6814964, 0, 0, 0, 1, 1,
-0.7950633, 0.6121274, -0.715385, 0, 0, 0, 1, 1,
-0.7879549, -0.6561831, -2.195837, 1, 1, 1, 1, 1,
-0.7865828, -1.456182, -3.021093, 1, 1, 1, 1, 1,
-0.7865102, -0.171546, -0.764483, 1, 1, 1, 1, 1,
-0.7856986, -1.768594, -2.772213, 1, 1, 1, 1, 1,
-0.7846128, 0.7219581, -0.2416913, 1, 1, 1, 1, 1,
-0.7828413, 1.068996, -0.725107, 1, 1, 1, 1, 1,
-0.7765011, -0.5110646, -3.092729, 1, 1, 1, 1, 1,
-0.7738649, -0.6378877, -2.417322, 1, 1, 1, 1, 1,
-0.7721969, 1.033975, -1.472072, 1, 1, 1, 1, 1,
-0.755577, 0.8302832, -1.00036, 1, 1, 1, 1, 1,
-0.7426434, -0.6275029, -0.9866569, 1, 1, 1, 1, 1,
-0.7365586, -1.328084, -2.609059, 1, 1, 1, 1, 1,
-0.7358061, -2.435712, -3.175285, 1, 1, 1, 1, 1,
-0.7325695, -0.6159028, -2.856222, 1, 1, 1, 1, 1,
-0.7317755, 1.111597, -1.158405, 1, 1, 1, 1, 1,
-0.7266229, -0.8692264, -1.727366, 0, 0, 1, 1, 1,
-0.72245, 0.7014361, -0.263007, 1, 0, 0, 1, 1,
-0.7200202, 1.312092, -0.9111906, 1, 0, 0, 1, 1,
-0.7166591, -1.820794, -2.269375, 1, 0, 0, 1, 1,
-0.7145577, -0.2409229, -2.304736, 1, 0, 0, 1, 1,
-0.7117441, 1.706023, -0.5050251, 1, 0, 0, 1, 1,
-0.7113172, 0.9507232, -1.552155, 0, 0, 0, 1, 1,
-0.7073287, 0.9886015, -2.843269, 0, 0, 0, 1, 1,
-0.7065347, -1.04111, -3.210291, 0, 0, 0, 1, 1,
-0.6979561, -0.9662579, -3.270912, 0, 0, 0, 1, 1,
-0.6974759, 2.1143, 0.6443095, 0, 0, 0, 1, 1,
-0.6964445, 2.62967, 1.906222, 0, 0, 0, 1, 1,
-0.6946198, -0.1537302, -0.8933343, 0, 0, 0, 1, 1,
-0.690861, 1.480607, -0.4678096, 1, 1, 1, 1, 1,
-0.6833469, 0.8424519, -1.14191, 1, 1, 1, 1, 1,
-0.681159, -0.5693869, -0.242715, 1, 1, 1, 1, 1,
-0.674673, 0.7625042, -0.7321734, 1, 1, 1, 1, 1,
-0.6743793, 1.582997, -1.83466, 1, 1, 1, 1, 1,
-0.672574, -0.2819226, -2.602793, 1, 1, 1, 1, 1,
-0.6693183, 0.2769524, -3.038396, 1, 1, 1, 1, 1,
-0.6677549, -0.3241988, -1.823442, 1, 1, 1, 1, 1,
-0.6674379, -1.512845, -2.774184, 1, 1, 1, 1, 1,
-0.6669855, -1.711451, -2.182989, 1, 1, 1, 1, 1,
-0.6655692, 1.371305, -0.9069464, 1, 1, 1, 1, 1,
-0.6433359, -0.6405568, -3.671323, 1, 1, 1, 1, 1,
-0.6424244, 0.3540038, -2.138347, 1, 1, 1, 1, 1,
-0.6339384, 0.4046457, 0.6056275, 1, 1, 1, 1, 1,
-0.6315816, -0.1107516, -2.153706, 1, 1, 1, 1, 1,
-0.6300035, -0.9408944, -1.439689, 0, 0, 1, 1, 1,
-0.6286341, -1.397842, -1.739284, 1, 0, 0, 1, 1,
-0.6237506, 1.570495, -1.211958, 1, 0, 0, 1, 1,
-0.6204886, 1.445611, 1.031629, 1, 0, 0, 1, 1,
-0.6186924, 1.142211, -1.886589, 1, 0, 0, 1, 1,
-0.6180502, -0.3627758, -2.29598, 1, 0, 0, 1, 1,
-0.6169205, -0.05188594, -2.832238, 0, 0, 0, 1, 1,
-0.6163309, -0.5007471, -1.395949, 0, 0, 0, 1, 1,
-0.6144441, 1.782407, 0.9773645, 0, 0, 0, 1, 1,
-0.6117867, -0.9769562, -2.284913, 0, 0, 0, 1, 1,
-0.6114627, -1.206714, -4.610799, 0, 0, 0, 1, 1,
-0.5999833, -0.9555203, -0.7214316, 0, 0, 0, 1, 1,
-0.5933453, 0.988283, -1.359222, 0, 0, 0, 1, 1,
-0.5923483, -0.1135332, -1.953341, 1, 1, 1, 1, 1,
-0.5867718, 0.7624084, -1.593539, 1, 1, 1, 1, 1,
-0.5828874, 0.3101028, -0.9614732, 1, 1, 1, 1, 1,
-0.5766479, -0.2571692, -1.57586, 1, 1, 1, 1, 1,
-0.5765965, -0.9570797, -2.836998, 1, 1, 1, 1, 1,
-0.5763552, 1.733598, -1.239457, 1, 1, 1, 1, 1,
-0.5743838, 0.9272504, -1.417625, 1, 1, 1, 1, 1,
-0.5696276, 0.8025244, -1.323408, 1, 1, 1, 1, 1,
-0.5656886, -1.873298, -2.668886, 1, 1, 1, 1, 1,
-0.5623201, 0.4807676, -0.9468024, 1, 1, 1, 1, 1,
-0.5544343, 0.6726742, -2.66899, 1, 1, 1, 1, 1,
-0.5539795, -0.6843261, -3.456839, 1, 1, 1, 1, 1,
-0.5494632, 1.485722, -1.026033, 1, 1, 1, 1, 1,
-0.5445501, -1.370504, -0.987848, 1, 1, 1, 1, 1,
-0.5423964, 0.894663, -0.8029983, 1, 1, 1, 1, 1,
-0.5423343, -0.8943526, -1.248264, 0, 0, 1, 1, 1,
-0.5421231, -1.470375, -1.76905, 1, 0, 0, 1, 1,
-0.5399422, -0.9967793, -2.716855, 1, 0, 0, 1, 1,
-0.5383784, 0.03835999, 0.3185759, 1, 0, 0, 1, 1,
-0.5361449, -0.3812442, -3.549719, 1, 0, 0, 1, 1,
-0.5339953, -0.2086183, -1.020211, 1, 0, 0, 1, 1,
-0.5339927, -0.2835488, -3.100609, 0, 0, 0, 1, 1,
-0.5336739, -0.1634662, -3.197423, 0, 0, 0, 1, 1,
-0.5297803, -0.1836683, -0.736371, 0, 0, 0, 1, 1,
-0.5256059, -0.3603989, -1.172206, 0, 0, 0, 1, 1,
-0.5255097, -2.160861, -2.238388, 0, 0, 0, 1, 1,
-0.5239335, 1.286534, -1.257571, 0, 0, 0, 1, 1,
-0.5207027, -0.9831551, -3.345406, 0, 0, 0, 1, 1,
-0.5206224, -0.4124698, -1.729721, 1, 1, 1, 1, 1,
-0.5197303, -1.331023, -2.192008, 1, 1, 1, 1, 1,
-0.5192643, -0.3920204, -2.252145, 1, 1, 1, 1, 1,
-0.514228, 1.132066, 1.721254, 1, 1, 1, 1, 1,
-0.5129807, 0.703066, -0.8460711, 1, 1, 1, 1, 1,
-0.5118584, 0.04989967, -0.8945129, 1, 1, 1, 1, 1,
-0.5093931, -1.753895, -2.394547, 1, 1, 1, 1, 1,
-0.508119, 0.03128657, -1.800071, 1, 1, 1, 1, 1,
-0.5029016, -0.5862267, -0.8170571, 1, 1, 1, 1, 1,
-0.4983332, -0.372656, -4.809916, 1, 1, 1, 1, 1,
-0.4956357, -1.208182, -2.829618, 1, 1, 1, 1, 1,
-0.4914599, 1.726708, 0.06693569, 1, 1, 1, 1, 1,
-0.4809326, -0.1113662, -0.3833943, 1, 1, 1, 1, 1,
-0.4781249, -0.4897338, -3.885649, 1, 1, 1, 1, 1,
-0.4763233, -0.6626756, -4.254003, 1, 1, 1, 1, 1,
-0.4762789, 1.421111, 0.1197123, 0, 0, 1, 1, 1,
-0.4742316, -0.2103771, -2.174285, 1, 0, 0, 1, 1,
-0.473329, 0.6909208, 1.31206, 1, 0, 0, 1, 1,
-0.4694109, -2.19312, -3.240253, 1, 0, 0, 1, 1,
-0.468134, -0.2742743, -0.7483426, 1, 0, 0, 1, 1,
-0.4667432, -0.8488526, -2.652595, 1, 0, 0, 1, 1,
-0.464575, 0.654083, -1.858816, 0, 0, 0, 1, 1,
-0.4641074, -0.6028689, -2.131592, 0, 0, 0, 1, 1,
-0.4619908, 2.098558, 0.1570532, 0, 0, 0, 1, 1,
-0.4588258, -0.1855535, -1.358439, 0, 0, 0, 1, 1,
-0.4584878, -0.06264731, -3.121353, 0, 0, 0, 1, 1,
-0.4549099, 2.374801, -0.3496247, 0, 0, 0, 1, 1,
-0.454838, 0.123964, -4.449711, 0, 0, 0, 1, 1,
-0.4531232, -0.4662386, -1.386779, 1, 1, 1, 1, 1,
-0.4514145, 1.608672, -0.8450692, 1, 1, 1, 1, 1,
-0.4495632, 0.4358892, -0.9185178, 1, 1, 1, 1, 1,
-0.4423401, -0.7705953, -2.356812, 1, 1, 1, 1, 1,
-0.4373708, -2.761152, -4.006256, 1, 1, 1, 1, 1,
-0.435207, 0.7639959, -0.6536179, 1, 1, 1, 1, 1,
-0.4280449, -0.1339118, -3.396413, 1, 1, 1, 1, 1,
-0.4205214, -1.1639, -3.074236, 1, 1, 1, 1, 1,
-0.4198422, 0.005896488, -2.491316, 1, 1, 1, 1, 1,
-0.4162047, -0.09825613, -2.351304, 1, 1, 1, 1, 1,
-0.4161798, 0.3877293, 0.2112638, 1, 1, 1, 1, 1,
-0.4111502, 0.1987028, -3.110772, 1, 1, 1, 1, 1,
-0.4086683, 2.784138, 0.5879313, 1, 1, 1, 1, 1,
-0.4057048, -0.66348, -2.225489, 1, 1, 1, 1, 1,
-0.4055297, -1.350616, -2.77072, 1, 1, 1, 1, 1,
-0.4050716, -0.1883372, -1.156349, 0, 0, 1, 1, 1,
-0.4044733, 1.378082, 0.7781189, 1, 0, 0, 1, 1,
-0.3983309, -0.05474084, -2.123036, 1, 0, 0, 1, 1,
-0.3961233, -0.6843596, -3.295595, 1, 0, 0, 1, 1,
-0.3943938, 0.08551013, -1.500864, 1, 0, 0, 1, 1,
-0.387527, -0.7704471, -1.780416, 1, 0, 0, 1, 1,
-0.3850425, 0.5943508, 0.5371768, 0, 0, 0, 1, 1,
-0.3843467, -0.9368222, -1.758374, 0, 0, 0, 1, 1,
-0.3816801, 0.5912319, -0.6238723, 0, 0, 0, 1, 1,
-0.3770628, -0.4546551, -1.318312, 0, 0, 0, 1, 1,
-0.3751314, -1.093841, -2.731986, 0, 0, 0, 1, 1,
-0.3750883, -0.7740405, -3.062474, 0, 0, 0, 1, 1,
-0.372385, 1.70909, -0.5013286, 0, 0, 0, 1, 1,
-0.3720949, 0.08385, -0.9799781, 1, 1, 1, 1, 1,
-0.3716737, -0.1678914, -2.212875, 1, 1, 1, 1, 1,
-0.3680172, 0.9397063, 1.425714, 1, 1, 1, 1, 1,
-0.3665335, 1.220757, -0.4673274, 1, 1, 1, 1, 1,
-0.3662241, 0.138093, -0.2993981, 1, 1, 1, 1, 1,
-0.3642588, 0.1576405, -3.365026, 1, 1, 1, 1, 1,
-0.3642332, 0.7880022, -0.2719366, 1, 1, 1, 1, 1,
-0.3567076, 0.003138771, -1.729987, 1, 1, 1, 1, 1,
-0.3558743, -0.1580906, -0.5909399, 1, 1, 1, 1, 1,
-0.3530479, -0.3964306, -3.244974, 1, 1, 1, 1, 1,
-0.3519989, 0.4346254, -0.4202538, 1, 1, 1, 1, 1,
-0.3511665, -2.055288, -4.240243, 1, 1, 1, 1, 1,
-0.3492383, -0.9648137, -4.316061, 1, 1, 1, 1, 1,
-0.3434066, -0.9576402, -2.238346, 1, 1, 1, 1, 1,
-0.3426815, -0.3078159, -1.260132, 1, 1, 1, 1, 1,
-0.3420989, -1.787688, -2.370857, 0, 0, 1, 1, 1,
-0.3319918, -0.1060946, -0.4340724, 1, 0, 0, 1, 1,
-0.3251294, 1.515087, 0.3609349, 1, 0, 0, 1, 1,
-0.3160769, -1.909291, -3.306624, 1, 0, 0, 1, 1,
-0.31404, 1.251844, -0.4617113, 1, 0, 0, 1, 1,
-0.3133706, 1.983536, 1.180462, 1, 0, 0, 1, 1,
-0.3026493, 0.254635, -0.5561016, 0, 0, 0, 1, 1,
-0.3020492, 1.787427, -0.4515611, 0, 0, 0, 1, 1,
-0.30136, -0.7554367, -1.883353, 0, 0, 0, 1, 1,
-0.2987394, 0.387884, -1.995346, 0, 0, 0, 1, 1,
-0.2964121, -0.7971136, -1.807237, 0, 0, 0, 1, 1,
-0.2942963, -0.2745411, -1.832366, 0, 0, 0, 1, 1,
-0.2915991, 0.01317151, -2.171067, 0, 0, 0, 1, 1,
-0.2853201, 0.6336293, -0.9813653, 1, 1, 1, 1, 1,
-0.2846467, 1.200879, -0.5553105, 1, 1, 1, 1, 1,
-0.2844325, 0.2335397, 0.39045, 1, 1, 1, 1, 1,
-0.2830851, -1.43932, -1.517686, 1, 1, 1, 1, 1,
-0.2820405, 0.6605306, -0.7752191, 1, 1, 1, 1, 1,
-0.2769332, -2.097291, -4.604187, 1, 1, 1, 1, 1,
-0.2715129, -1.642757, -1.861599, 1, 1, 1, 1, 1,
-0.2669534, -1.545187, -4.513378, 1, 1, 1, 1, 1,
-0.2625973, -0.4814531, -1.920707, 1, 1, 1, 1, 1,
-0.2584182, 0.6044769, -1.706053, 1, 1, 1, 1, 1,
-0.2561419, -0.7095062, -2.558007, 1, 1, 1, 1, 1,
-0.2560052, -0.6730506, -0.3618754, 1, 1, 1, 1, 1,
-0.2537576, -0.2981344, -3.97087, 1, 1, 1, 1, 1,
-0.2533941, -0.8191823, -4.726132, 1, 1, 1, 1, 1,
-0.2493317, 0.7188798, 1.183071, 1, 1, 1, 1, 1,
-0.2486851, -1.51596, -4.342682, 0, 0, 1, 1, 1,
-0.247078, 0.2608907, -0.513473, 1, 0, 0, 1, 1,
-0.2466666, 1.068297, 0.0835987, 1, 0, 0, 1, 1,
-0.2411119, -1.101657, -3.177709, 1, 0, 0, 1, 1,
-0.239735, -0.4058951, -3.184148, 1, 0, 0, 1, 1,
-0.2316605, -1.123355, -3.372544, 1, 0, 0, 1, 1,
-0.2284528, 0.8185597, -0.5942779, 0, 0, 0, 1, 1,
-0.2277616, 0.8050566, -0.7819657, 0, 0, 0, 1, 1,
-0.2269077, 0.6765273, 0.59281, 0, 0, 0, 1, 1,
-0.220101, 1.281654, -1.469971, 0, 0, 0, 1, 1,
-0.2169299, -0.3824114, -0.9926351, 0, 0, 0, 1, 1,
-0.2138265, 0.08243617, -1.362221, 0, 0, 0, 1, 1,
-0.2128743, 0.2427485, -0.587409, 0, 0, 0, 1, 1,
-0.2121394, -1.590934, -3.232028, 1, 1, 1, 1, 1,
-0.2112629, 0.05223655, -2.516257, 1, 1, 1, 1, 1,
-0.2080484, 0.5921603, 0.9209981, 1, 1, 1, 1, 1,
-0.2074118, -0.4015702, -2.640048, 1, 1, 1, 1, 1,
-0.2033126, -0.2172082, -3.454456, 1, 1, 1, 1, 1,
-0.2030106, 1.126829, 0.127932, 1, 1, 1, 1, 1,
-0.1965034, -0.4570146, -0.6660637, 1, 1, 1, 1, 1,
-0.1907652, -0.6099815, -3.906768, 1, 1, 1, 1, 1,
-0.190734, -0.747326, -3.883794, 1, 1, 1, 1, 1,
-0.1905628, 0.9955338, 0.3719941, 1, 1, 1, 1, 1,
-0.1870013, -2.912075, -2.646351, 1, 1, 1, 1, 1,
-0.1868012, -0.5079215, -2.686526, 1, 1, 1, 1, 1,
-0.1808729, -0.03527164, -1.889961, 1, 1, 1, 1, 1,
-0.1807472, -1.696525, -3.558255, 1, 1, 1, 1, 1,
-0.1769626, -0.009748972, -2.658535, 1, 1, 1, 1, 1,
-0.175615, -0.2833787, -3.901965, 0, 0, 1, 1, 1,
-0.1749594, 0.8524354, -0.5239016, 1, 0, 0, 1, 1,
-0.1747215, 1.359559, 1.190217, 1, 0, 0, 1, 1,
-0.171527, -0.1535094, -2.707992, 1, 0, 0, 1, 1,
-0.1702943, -0.4886422, -1.743844, 1, 0, 0, 1, 1,
-0.1682853, 0.4555457, 0.7866133, 1, 0, 0, 1, 1,
-0.1672975, -0.5128751, -0.8019048, 0, 0, 0, 1, 1,
-0.1667189, -0.9783593, -1.598905, 0, 0, 0, 1, 1,
-0.1657501, 0.8694689, -2.001516, 0, 0, 0, 1, 1,
-0.1643651, 0.2140184, -1.528895, 0, 0, 0, 1, 1,
-0.1633624, 0.8035514, -0.8720928, 0, 0, 0, 1, 1,
-0.1563675, -1.148874, -3.7834, 0, 0, 0, 1, 1,
-0.153959, 1.549167, -1.579487, 0, 0, 0, 1, 1,
-0.1533597, 0.7709703, 1.611215, 1, 1, 1, 1, 1,
-0.1426059, -0.3996565, -2.284304, 1, 1, 1, 1, 1,
-0.1384733, -0.7582058, -1.373438, 1, 1, 1, 1, 1,
-0.1380191, 0.1974282, -2.041595, 1, 1, 1, 1, 1,
-0.136841, 0.5492582, -1.313605, 1, 1, 1, 1, 1,
-0.1341857, -0.04230597, -0.5941803, 1, 1, 1, 1, 1,
-0.1340552, -0.6988431, -4.028681, 1, 1, 1, 1, 1,
-0.1337335, 0.8161128, -1.727156, 1, 1, 1, 1, 1,
-0.1333708, 1.388328, -2.026544, 1, 1, 1, 1, 1,
-0.1248292, 0.1578116, -0.7952014, 1, 1, 1, 1, 1,
-0.1187352, 0.4027026, -0.1354789, 1, 1, 1, 1, 1,
-0.1174659, 0.6711406, 0.821087, 1, 1, 1, 1, 1,
-0.1172726, -0.8723398, -4.227801, 1, 1, 1, 1, 1,
-0.1168735, 1.438403, -0.4881572, 1, 1, 1, 1, 1,
-0.1147809, -0.3907917, -4.443004, 1, 1, 1, 1, 1,
-0.1133785, -0.783139, -1.706584, 0, 0, 1, 1, 1,
-0.1130786, 1.059379, 0.982244, 1, 0, 0, 1, 1,
-0.1118389, -0.6986002, -4.28075, 1, 0, 0, 1, 1,
-0.1108329, -0.04697271, -0.5769128, 1, 0, 0, 1, 1,
-0.1050932, 1.625762, -0.04348271, 1, 0, 0, 1, 1,
-0.1046945, -1.181246, -3.778174, 1, 0, 0, 1, 1,
-0.1035048, -0.05448814, -2.366472, 0, 0, 0, 1, 1,
-0.1013578, 0.3359472, 0.455736, 0, 0, 0, 1, 1,
-0.09976903, -0.9593351, -2.768551, 0, 0, 0, 1, 1,
-0.09573351, -2.72857, -3.924255, 0, 0, 0, 1, 1,
-0.09268484, 0.1335988, -1.18069, 0, 0, 0, 1, 1,
-0.0924987, 2.202417, 0.3001576, 0, 0, 0, 1, 1,
-0.08915209, 0.5604259, -1.496291, 0, 0, 0, 1, 1,
-0.08330418, 2.807052, 0.3911561, 1, 1, 1, 1, 1,
-0.07890529, 0.7901638, 1.642336, 1, 1, 1, 1, 1,
-0.07713298, 0.5990717, -1.905396, 1, 1, 1, 1, 1,
-0.06867705, -0.02933666, -0.7914288, 1, 1, 1, 1, 1,
-0.06813903, 0.8627751, -0.1868479, 1, 1, 1, 1, 1,
-0.0675017, -0.04041175, -2.523867, 1, 1, 1, 1, 1,
-0.06717483, 1.132651, -0.4446403, 1, 1, 1, 1, 1,
-0.06529022, -0.1372499, -1.440882, 1, 1, 1, 1, 1,
-0.06479114, 0.5323666, -2.2586, 1, 1, 1, 1, 1,
-0.06290694, 1.068642, -0.07343038, 1, 1, 1, 1, 1,
-0.06221468, 0.3459232, 0.1175785, 1, 1, 1, 1, 1,
-0.0599848, -1.094665, -2.426736, 1, 1, 1, 1, 1,
-0.05484428, 2.053637, -0.04534374, 1, 1, 1, 1, 1,
-0.05482114, 0.8259454, -0.5380031, 1, 1, 1, 1, 1,
-0.05272254, -1.315443, -3.853579, 1, 1, 1, 1, 1,
-0.0490525, -0.8299006, -4.921567, 0, 0, 1, 1, 1,
-0.04310387, -1.113686, -2.110829, 1, 0, 0, 1, 1,
-0.04218943, 0.1920447, -1.499167, 1, 0, 0, 1, 1,
-0.04175419, -0.9625282, -3.356613, 1, 0, 0, 1, 1,
-0.03682649, 0.9725699, 0.44976, 1, 0, 0, 1, 1,
-0.0359078, -0.9749578, -2.281057, 1, 0, 0, 1, 1,
-0.03312391, -0.2766406, -4.225647, 0, 0, 0, 1, 1,
-0.03196396, -0.9203507, -3.206052, 0, 0, 0, 1, 1,
-0.02649461, -2.009276, -4.53097, 0, 0, 0, 1, 1,
-0.02488887, 1.401422, -0.9621187, 0, 0, 0, 1, 1,
-0.02092434, -1.329951, -3.007319, 0, 0, 0, 1, 1,
-0.02081355, 0.217179, 0.8562276, 0, 0, 0, 1, 1,
-0.01170723, 0.6474937, -1.06446, 0, 0, 0, 1, 1,
-0.01148804, -1.181319, -2.29183, 1, 1, 1, 1, 1,
-0.01078736, -1.411056, -1.562767, 1, 1, 1, 1, 1,
-0.002933132, -0.5557024, -2.913964, 1, 1, 1, 1, 1,
-0.00189854, 0.1361363, 1.533942, 1, 1, 1, 1, 1,
0.001208116, 0.8883754, 1.083017, 1, 1, 1, 1, 1,
0.008715374, -1.188931, 3.553645, 1, 1, 1, 1, 1,
0.01256213, -0.1559444, 1.407771, 1, 1, 1, 1, 1,
0.01552453, 0.4496383, -1.140168, 1, 1, 1, 1, 1,
0.02708435, -0.6145728, 2.81386, 1, 1, 1, 1, 1,
0.03589578, 0.3607802, -0.2432097, 1, 1, 1, 1, 1,
0.03805717, 0.2277758, -1.452293, 1, 1, 1, 1, 1,
0.03857511, -0.6659061, 2.980785, 1, 1, 1, 1, 1,
0.03882385, 1.441314, 1.825067, 1, 1, 1, 1, 1,
0.04612131, 0.8208073, -1.572662, 1, 1, 1, 1, 1,
0.04860875, -0.1774101, 2.991007, 1, 1, 1, 1, 1,
0.04981953, 0.6106557, 0.4008764, 0, 0, 1, 1, 1,
0.05189038, 1.301483, 0.1077795, 1, 0, 0, 1, 1,
0.05263473, -1.211562, 4.538644, 1, 0, 0, 1, 1,
0.05587919, -1.566938, 3.593853, 1, 0, 0, 1, 1,
0.05972587, -0.1092607, 3.250214, 1, 0, 0, 1, 1,
0.06287634, 0.3496533, -0.9935881, 1, 0, 0, 1, 1,
0.063653, -1.34123, 3.788766, 0, 0, 0, 1, 1,
0.06561945, -1.164351, 4.570327, 0, 0, 0, 1, 1,
0.06609291, 0.5972697, 0.1215111, 0, 0, 0, 1, 1,
0.07069129, 0.1263532, 1.686287, 0, 0, 0, 1, 1,
0.07214016, -0.4135256, 2.879589, 0, 0, 0, 1, 1,
0.07557078, -0.6052237, 4.016676, 0, 0, 0, 1, 1,
0.08216411, -0.2592465, 2.870209, 0, 0, 0, 1, 1,
0.08350681, 0.3842109, -0.7036248, 1, 1, 1, 1, 1,
0.08408821, 0.6253885, -0.4998502, 1, 1, 1, 1, 1,
0.08607487, -0.5236661, 2.057162, 1, 1, 1, 1, 1,
0.08609032, -0.6134059, 2.195183, 1, 1, 1, 1, 1,
0.0881203, -0.7280079, 3.419196, 1, 1, 1, 1, 1,
0.09053139, -1.929624, 1.774079, 1, 1, 1, 1, 1,
0.09437843, -1.165935, 1.269058, 1, 1, 1, 1, 1,
0.09447213, 0.2074618, 0.6448041, 1, 1, 1, 1, 1,
0.09619502, -0.4691188, 2.436831, 1, 1, 1, 1, 1,
0.1028825, -1.208508, 2.695688, 1, 1, 1, 1, 1,
0.1035793, 0.06530908, 1.344292, 1, 1, 1, 1, 1,
0.1122879, -0.07418673, 2.155579, 1, 1, 1, 1, 1,
0.1136762, -0.1509122, 4.588837, 1, 1, 1, 1, 1,
0.1146759, 0.05782212, 0.6705713, 1, 1, 1, 1, 1,
0.1149212, -1.802994, 3.117732, 1, 1, 1, 1, 1,
0.1153499, 0.1299687, 2.794917, 0, 0, 1, 1, 1,
0.1162991, -0.8031011, 2.557928, 1, 0, 0, 1, 1,
0.118776, -1.199404, 4.589257, 1, 0, 0, 1, 1,
0.1225534, 1.244023, -1.425975, 1, 0, 0, 1, 1,
0.122935, 0.844314, 1.105582, 1, 0, 0, 1, 1,
0.1244278, 1.040667, -1.76496, 1, 0, 0, 1, 1,
0.1247804, -0.3241914, 1.924973, 0, 0, 0, 1, 1,
0.127337, -1.145876, 5.079799, 0, 0, 0, 1, 1,
0.1290633, 0.7600714, -1.20664, 0, 0, 0, 1, 1,
0.1322863, -0.07226744, 3.393147, 0, 0, 0, 1, 1,
0.1326862, 0.0959375, 2.255115, 0, 0, 0, 1, 1,
0.1401567, 0.8780822, 2.677351, 0, 0, 0, 1, 1,
0.1434457, 0.4308427, 2.218631, 0, 0, 0, 1, 1,
0.1452743, 0.3710958, 1.716817, 1, 1, 1, 1, 1,
0.1452945, 0.5039812, 0.1632443, 1, 1, 1, 1, 1,
0.1495229, 0.3930116, 0.06131368, 1, 1, 1, 1, 1,
0.1495255, 0.4221, 1.341786, 1, 1, 1, 1, 1,
0.1565469, 0.2067942, 1.755164, 1, 1, 1, 1, 1,
0.1566041, -1.134577, 1.41829, 1, 1, 1, 1, 1,
0.1569647, 1.281801, -0.0454213, 1, 1, 1, 1, 1,
0.1592839, -2.35334, 2.830346, 1, 1, 1, 1, 1,
0.1608374, 0.7092466, -0.3112101, 1, 1, 1, 1, 1,
0.1612432, -0.4415998, 2.264698, 1, 1, 1, 1, 1,
0.1625267, 0.5525116, -0.9544532, 1, 1, 1, 1, 1,
0.1662189, 1.218382, 1.243734, 1, 1, 1, 1, 1,
0.1683282, -0.6251721, 3.246791, 1, 1, 1, 1, 1,
0.1705032, 0.8031636, 0.1811591, 1, 1, 1, 1, 1,
0.172077, -0.808607, 2.387953, 1, 1, 1, 1, 1,
0.1811075, -1.10088, 3.585346, 0, 0, 1, 1, 1,
0.1841305, 1.019646, 0.002004912, 1, 0, 0, 1, 1,
0.1856281, -0.2607737, 2.110021, 1, 0, 0, 1, 1,
0.1872451, 1.319292, -0.8103238, 1, 0, 0, 1, 1,
0.190704, -0.1225094, 1.463019, 1, 0, 0, 1, 1,
0.1925774, 1.112392, -0.4972463, 1, 0, 0, 1, 1,
0.1958286, 0.4097922, 0.7141548, 0, 0, 0, 1, 1,
0.1983794, 1.473249, -0.1876904, 0, 0, 0, 1, 1,
0.2028089, 1.352323, 2.159996, 0, 0, 0, 1, 1,
0.205247, -1.057336, 3.737262, 0, 0, 0, 1, 1,
0.2073926, -1.125006, 1.421625, 0, 0, 0, 1, 1,
0.2082644, 0.8683519, 1.924171, 0, 0, 0, 1, 1,
0.209539, 0.8576133, 2.12255, 0, 0, 0, 1, 1,
0.210197, 1.066483, 0.04752738, 1, 1, 1, 1, 1,
0.210982, 0.2558911, 0.9096168, 1, 1, 1, 1, 1,
0.2151397, -0.6516182, 3.355032, 1, 1, 1, 1, 1,
0.2152482, -0.1283341, 2.168653, 1, 1, 1, 1, 1,
0.2156896, -0.06709728, 1.094922, 1, 1, 1, 1, 1,
0.2164875, -0.6106054, 2.079359, 1, 1, 1, 1, 1,
0.2187605, -1.360533, 3.953311, 1, 1, 1, 1, 1,
0.2193305, 1.013283, -1.112406, 1, 1, 1, 1, 1,
0.2193758, -0.2761303, 4.979845, 1, 1, 1, 1, 1,
0.2210357, -1.558987, 2.230083, 1, 1, 1, 1, 1,
0.2211467, -0.770638, 2.107102, 1, 1, 1, 1, 1,
0.2240546, -0.2950264, 1.637476, 1, 1, 1, 1, 1,
0.2252249, 0.506214, 1.32805, 1, 1, 1, 1, 1,
0.2298734, -1.916088, 3.24566, 1, 1, 1, 1, 1,
0.2335323, 0.3044548, -0.4803672, 1, 1, 1, 1, 1,
0.2344006, 0.3253338, 0.1181494, 0, 0, 1, 1, 1,
0.2382001, -0.3974581, 3.294005, 1, 0, 0, 1, 1,
0.2406901, 0.7613316, 0.1847335, 1, 0, 0, 1, 1,
0.2428147, -1.114994, 1.070226, 1, 0, 0, 1, 1,
0.245296, -0.651664, 2.749464, 1, 0, 0, 1, 1,
0.247951, 0.1996801, 1.342918, 1, 0, 0, 1, 1,
0.2492958, 0.0232568, 0.9753675, 0, 0, 0, 1, 1,
0.2555625, 1.561095, 0.8454224, 0, 0, 0, 1, 1,
0.2560113, 0.4388066, 0.8472887, 0, 0, 0, 1, 1,
0.2576981, 0.9024544, 0.7716514, 0, 0, 0, 1, 1,
0.2609333, -0.4772539, 2.311053, 0, 0, 0, 1, 1,
0.2645771, 1.842483, -0.3582145, 0, 0, 0, 1, 1,
0.266219, -0.1397806, 1.782277, 0, 0, 0, 1, 1,
0.2671913, 1.029003, 1.044596, 1, 1, 1, 1, 1,
0.2682395, 0.6799949, 0.6906666, 1, 1, 1, 1, 1,
0.2715184, -0.2705201, 3.057707, 1, 1, 1, 1, 1,
0.2715561, -1.232214, 1.224433, 1, 1, 1, 1, 1,
0.2781516, 0.7191298, -0.5265048, 1, 1, 1, 1, 1,
0.2812109, -1.136878, 1.786583, 1, 1, 1, 1, 1,
0.2833206, -0.4109439, 1.958516, 1, 1, 1, 1, 1,
0.2899633, 1.110767, -0.3449182, 1, 1, 1, 1, 1,
0.2914631, -0.7376272, 3.587835, 1, 1, 1, 1, 1,
0.291948, -0.2399072, 0.9659403, 1, 1, 1, 1, 1,
0.2937623, -0.2274916, 3.062606, 1, 1, 1, 1, 1,
0.2954618, 0.8257529, 0.3218384, 1, 1, 1, 1, 1,
0.299281, 0.1710705, 1.278881, 1, 1, 1, 1, 1,
0.3024475, 0.919717, -0.3875002, 1, 1, 1, 1, 1,
0.3119994, -0.2916123, 2.972433, 1, 1, 1, 1, 1,
0.3148083, -0.3033426, 2.445643, 0, 0, 1, 1, 1,
0.316433, 0.1425047, 0.02002604, 1, 0, 0, 1, 1,
0.3169674, -0.2063787, 2.090009, 1, 0, 0, 1, 1,
0.3277912, -0.004824194, 2.408018, 1, 0, 0, 1, 1,
0.3375925, -1.116238, 1.118207, 1, 0, 0, 1, 1,
0.3452097, 1.227148, 1.730039, 1, 0, 0, 1, 1,
0.3458411, 1.746318, -0.0647593, 0, 0, 0, 1, 1,
0.3490777, 0.01695864, 1.01399, 0, 0, 0, 1, 1,
0.3503989, -0.61595, 3.287281, 0, 0, 0, 1, 1,
0.3504101, 1.487388, -1.384754, 0, 0, 0, 1, 1,
0.3507634, 0.08804036, 1.134851, 0, 0, 0, 1, 1,
0.351035, 0.06354146, 0.2406953, 0, 0, 0, 1, 1,
0.3543926, 2.046558, -0.2293303, 0, 0, 0, 1, 1,
0.3546774, 0.2233381, -0.05940361, 1, 1, 1, 1, 1,
0.3574873, -0.7609756, 0.5558328, 1, 1, 1, 1, 1,
0.3587715, -0.3011226, 2.593976, 1, 1, 1, 1, 1,
0.358802, -0.5497583, 2.371449, 1, 1, 1, 1, 1,
0.3678614, 0.7712463, 1.756137, 1, 1, 1, 1, 1,
0.3686956, -0.5184144, 2.573305, 1, 1, 1, 1, 1,
0.3707865, -0.09656346, 0.6961349, 1, 1, 1, 1, 1,
0.3731971, -1.506777, 3.354464, 1, 1, 1, 1, 1,
0.3828601, -0.1616502, 1.466059, 1, 1, 1, 1, 1,
0.3854738, 0.2144153, 1.44702, 1, 1, 1, 1, 1,
0.3870127, 0.7546635, 0.7945337, 1, 1, 1, 1, 1,
0.38861, -1.005377, 1.154346, 1, 1, 1, 1, 1,
0.3924183, -0.8760679, 2.929747, 1, 1, 1, 1, 1,
0.3925287, 0.8125786, 0.3955523, 1, 1, 1, 1, 1,
0.4025328, -0.4377589, 4.373828, 1, 1, 1, 1, 1,
0.4060834, 0.3334408, 1.187622, 0, 0, 1, 1, 1,
0.4064645, 2.189909, -0.4917965, 1, 0, 0, 1, 1,
0.4100971, 1.567888, 0.9059678, 1, 0, 0, 1, 1,
0.4106437, -0.9530166, 1.382646, 1, 0, 0, 1, 1,
0.4134749, -0.5587391, 1.422612, 1, 0, 0, 1, 1,
0.4159771, 0.859563, 2.700906, 1, 0, 0, 1, 1,
0.4195257, 0.956556, -0.3599089, 0, 0, 0, 1, 1,
0.4246209, -0.9967069, 3.014836, 0, 0, 0, 1, 1,
0.4247021, 1.295681, 0.09312413, 0, 0, 0, 1, 1,
0.428444, -0.4872774, 2.779339, 0, 0, 0, 1, 1,
0.4289978, 1.508867, 1.977736, 0, 0, 0, 1, 1,
0.4300812, 0.5396912, 2.196593, 0, 0, 0, 1, 1,
0.4334615, -1.30519, 2.013597, 0, 0, 0, 1, 1,
0.4384211, 1.070838, 0.7418258, 1, 1, 1, 1, 1,
0.4384424, -0.5858546, 4.139213, 1, 1, 1, 1, 1,
0.4384891, 0.000718838, 1.783254, 1, 1, 1, 1, 1,
0.4389699, 0.724395, 1.79164, 1, 1, 1, 1, 1,
0.4394735, 0.2353816, 2.428525, 1, 1, 1, 1, 1,
0.4438897, 0.4026529, 0.4900102, 1, 1, 1, 1, 1,
0.452428, 0.07930317, 1.669347, 1, 1, 1, 1, 1,
0.4541879, -0.4681152, 2.107761, 1, 1, 1, 1, 1,
0.457365, -0.4670648, 2.132491, 1, 1, 1, 1, 1,
0.4590228, 1.106063, 1.501426, 1, 1, 1, 1, 1,
0.4631334, 0.7991747, 0.8868732, 1, 1, 1, 1, 1,
0.4665585, -1.633118, 4.269715, 1, 1, 1, 1, 1,
0.4717948, -0.708047, 0.4599732, 1, 1, 1, 1, 1,
0.4719691, 0.1696041, 1.87862, 1, 1, 1, 1, 1,
0.4748075, -1.606633, 2.365596, 1, 1, 1, 1, 1,
0.4757193, -0.5001374, 3.417808, 0, 0, 1, 1, 1,
0.476173, 1.055878, 1.513715, 1, 0, 0, 1, 1,
0.4769775, -0.3350253, 2.825367, 1, 0, 0, 1, 1,
0.4803662, 1.153599, 0.5253924, 1, 0, 0, 1, 1,
0.4814694, 0.3693393, 0.6219688, 1, 0, 0, 1, 1,
0.482424, 1.203117, 0.5940098, 1, 0, 0, 1, 1,
0.4888591, 0.331723, 1.793631, 0, 0, 0, 1, 1,
0.4970193, -0.9017746, 2.559561, 0, 0, 0, 1, 1,
0.5012452, -0.9703355, 1.908379, 0, 0, 0, 1, 1,
0.5034546, -0.8452063, 2.613572, 0, 0, 0, 1, 1,
0.5036392, -0.5232587, 2.641509, 0, 0, 0, 1, 1,
0.5065116, -0.42295, 1.29087, 0, 0, 0, 1, 1,
0.5083029, 0.1645641, 1.057095, 0, 0, 0, 1, 1,
0.5094211, -0.09170077, 3.037002, 1, 1, 1, 1, 1,
0.5152082, -0.0991972, 3.253939, 1, 1, 1, 1, 1,
0.5161621, -1.106719, 3.181083, 1, 1, 1, 1, 1,
0.5165137, 1.665986, -0.8853818, 1, 1, 1, 1, 1,
0.5165779, -1.243083, 2.78429, 1, 1, 1, 1, 1,
0.5186083, -0.7579993, 3.682985, 1, 1, 1, 1, 1,
0.5195347, 0.5289214, 1.850919, 1, 1, 1, 1, 1,
0.5228168, 1.056712, 1.133577, 1, 1, 1, 1, 1,
0.5274529, 0.4777342, -0.3443343, 1, 1, 1, 1, 1,
0.5289246, -0.7858444, 3.431267, 1, 1, 1, 1, 1,
0.5390906, -2.347981, 3.377673, 1, 1, 1, 1, 1,
0.5415283, 0.3939684, 3.834647, 1, 1, 1, 1, 1,
0.5489519, -1.154185, 2.180355, 1, 1, 1, 1, 1,
0.5543269, 1.647184, 1.08366, 1, 1, 1, 1, 1,
0.5551012, -1.268275, 2.484549, 1, 1, 1, 1, 1,
0.5566276, -0.8433989, 2.935886, 0, 0, 1, 1, 1,
0.5598521, -0.7371201, 2.379742, 1, 0, 0, 1, 1,
0.5603199, -1.306549, 1.2695, 1, 0, 0, 1, 1,
0.5664009, -0.6131741, 3.919625, 1, 0, 0, 1, 1,
0.5669025, -0.03010107, 2.127178, 1, 0, 0, 1, 1,
0.5766405, 0.1956745, 2.028607, 1, 0, 0, 1, 1,
0.5800263, -1.184694, 3.395066, 0, 0, 0, 1, 1,
0.5809488, -0.2783957, 0.249991, 0, 0, 0, 1, 1,
0.5820934, 0.01193709, 1.615928, 0, 0, 0, 1, 1,
0.5837734, -0.1829585, 0.288583, 0, 0, 0, 1, 1,
0.5865659, -1.830988, 2.028837, 0, 0, 0, 1, 1,
0.5869406, 0.885715, -0.7180045, 0, 0, 0, 1, 1,
0.5933943, 0.2924556, 0.297197, 0, 0, 0, 1, 1,
0.6029202, -0.4774885, 2.12985, 1, 1, 1, 1, 1,
0.60524, -1.356416, 2.469879, 1, 1, 1, 1, 1,
0.6102074, -0.7871187, 0.4059071, 1, 1, 1, 1, 1,
0.6118636, 1.301083, -0.241356, 1, 1, 1, 1, 1,
0.6139365, -1.180457, 1.824757, 1, 1, 1, 1, 1,
0.6148667, 0.3628879, 3.525369, 1, 1, 1, 1, 1,
0.6156684, -0.08353109, 1.354492, 1, 1, 1, 1, 1,
0.6239715, 1.195436, 0.9040633, 1, 1, 1, 1, 1,
0.6241055, 0.02519387, 1.706832, 1, 1, 1, 1, 1,
0.6250566, -1.742508, 2.081191, 1, 1, 1, 1, 1,
0.626764, 0.6650772, 3.263299, 1, 1, 1, 1, 1,
0.6398327, 1.635566, -0.645219, 1, 1, 1, 1, 1,
0.6399549, -0.6548047, 2.368702, 1, 1, 1, 1, 1,
0.6417738, 1.179672, 0.5272441, 1, 1, 1, 1, 1,
0.6473682, -0.4742866, 2.13011, 1, 1, 1, 1, 1,
0.6513732, -1.14709, 0.9818084, 0, 0, 1, 1, 1,
0.6521229, -1.733051, 3.60727, 1, 0, 0, 1, 1,
0.6522796, 0.424845, 1.037646, 1, 0, 0, 1, 1,
0.6524405, -1.283263, 2.656244, 1, 0, 0, 1, 1,
0.6528766, -0.4593221, 3.688627, 1, 0, 0, 1, 1,
0.6538846, 0.5741267, 1.374038, 1, 0, 0, 1, 1,
0.6540946, 1.25106, 0.1100401, 0, 0, 0, 1, 1,
0.658886, 0.5800166, 0.8069091, 0, 0, 0, 1, 1,
0.6594043, 0.6298689, 1.802918, 0, 0, 0, 1, 1,
0.6596047, -1.168448, 0.813347, 0, 0, 0, 1, 1,
0.6617221, -1.334172, 2.386319, 0, 0, 0, 1, 1,
0.6678118, 0.7335305, 1.168431, 0, 0, 0, 1, 1,
0.6687924, 1.044818, 1.340454, 0, 0, 0, 1, 1,
0.6697511, -0.9814922, 3.171526, 1, 1, 1, 1, 1,
0.6742809, -0.116779, 0.977106, 1, 1, 1, 1, 1,
0.6744716, 0.5879825, 1.705961, 1, 1, 1, 1, 1,
0.6747327, 0.5770602, -0.2520221, 1, 1, 1, 1, 1,
0.6761585, -0.2294718, 0.822899, 1, 1, 1, 1, 1,
0.6777338, 1.433, -0.5745867, 1, 1, 1, 1, 1,
0.6822725, -0.2378709, 0.2587022, 1, 1, 1, 1, 1,
0.6865406, -0.01973524, 1.482962, 1, 1, 1, 1, 1,
0.6908584, 1.008735, -0.3808695, 1, 1, 1, 1, 1,
0.6919181, -1.779596, 5.031433, 1, 1, 1, 1, 1,
0.6955069, 1.049235, -0.03074589, 1, 1, 1, 1, 1,
0.7011474, -1.662066, 2.284472, 1, 1, 1, 1, 1,
0.7013735, -0.4463589, 2.824727, 1, 1, 1, 1, 1,
0.7050967, -0.1985542, 2.832734, 1, 1, 1, 1, 1,
0.714104, -1.491823, 1.923051, 1, 1, 1, 1, 1,
0.7200062, -0.09535632, 1.527432, 0, 0, 1, 1, 1,
0.7231208, -1.776302, 1.79861, 1, 0, 0, 1, 1,
0.7231747, 0.3563617, -0.001647182, 1, 0, 0, 1, 1,
0.7282647, -0.624177, 0.8170645, 1, 0, 0, 1, 1,
0.731548, -0.3928412, 2.291891, 1, 0, 0, 1, 1,
0.7317038, -0.9291284, 1.776866, 1, 0, 0, 1, 1,
0.7344801, -0.265294, 1.792603, 0, 0, 0, 1, 1,
0.7349877, 0.1732051, 1.729145, 0, 0, 0, 1, 1,
0.7386547, 0.3515498, 0.2971118, 0, 0, 0, 1, 1,
0.7386689, -0.511879, 1.710799, 0, 0, 0, 1, 1,
0.7415527, 2.230978, 2.105611, 0, 0, 0, 1, 1,
0.7421294, 1.160774, -0.4791451, 0, 0, 0, 1, 1,
0.7449027, 0.7119226, 0.1669548, 0, 0, 0, 1, 1,
0.7573346, 0.08245637, 0.441033, 1, 1, 1, 1, 1,
0.7593612, 0.4449725, 0.2293951, 1, 1, 1, 1, 1,
0.7606867, 0.1222838, 0.5059593, 1, 1, 1, 1, 1,
0.7636773, -0.04682902, 0.9136831, 1, 1, 1, 1, 1,
0.7661341, -1.749282, 2.761126, 1, 1, 1, 1, 1,
0.766817, -2.445814, 3.385839, 1, 1, 1, 1, 1,
0.7689974, -0.4770646, 0.6310397, 1, 1, 1, 1, 1,
0.7754327, -0.4218056, 2.952068, 1, 1, 1, 1, 1,
0.7791297, -1.225521, 3.271149, 1, 1, 1, 1, 1,
0.7806338, 0.6898069, 1.439256, 1, 1, 1, 1, 1,
0.7836643, -0.1901125, 3.356427, 1, 1, 1, 1, 1,
0.7880554, -1.564891, 1.861532, 1, 1, 1, 1, 1,
0.7917963, 0.3588935, 1.418152, 1, 1, 1, 1, 1,
0.7963133, 1.264471, 1.51647, 1, 1, 1, 1, 1,
0.7981611, -1.462151, 2.310695, 1, 1, 1, 1, 1,
0.8053346, 0.2606194, 2.934678, 0, 0, 1, 1, 1,
0.8066843, -1.501014, 2.719146, 1, 0, 0, 1, 1,
0.8106454, -0.3796861, 1.449129, 1, 0, 0, 1, 1,
0.8127842, -1.525672, 2.843437, 1, 0, 0, 1, 1,
0.8157464, 0.8652889, 1.105951, 1, 0, 0, 1, 1,
0.8164659, 0.0495745, 1.151645, 1, 0, 0, 1, 1,
0.8198779, -0.09271273, 3.32535, 0, 0, 0, 1, 1,
0.8234363, -0.760284, 3.598906, 0, 0, 0, 1, 1,
0.8352869, -0.2909075, 3.578156, 0, 0, 0, 1, 1,
0.8357399, 0.7155532, 3.243756, 0, 0, 0, 1, 1,
0.8367292, -1.292935, 1.49851, 0, 0, 0, 1, 1,
0.8394056, 0.5518287, 0.7299491, 0, 0, 0, 1, 1,
0.8458176, 1.084733, 1.025749, 0, 0, 0, 1, 1,
0.8492538, -0.2462737, 3.625281, 1, 1, 1, 1, 1,
0.8509761, 0.6504007, -2.148438, 1, 1, 1, 1, 1,
0.8513607, 0.8870385, 0.2455967, 1, 1, 1, 1, 1,
0.8593053, 0.02894042, 0.3750431, 1, 1, 1, 1, 1,
0.8597476, -0.8299428, 0.4609272, 1, 1, 1, 1, 1,
0.862522, -0.4396166, 2.75547, 1, 1, 1, 1, 1,
0.8633014, 1.551298, 2.644822, 1, 1, 1, 1, 1,
0.8633111, 0.04758338, 2.738306, 1, 1, 1, 1, 1,
0.8655551, 0.5861879, 1.189313, 1, 1, 1, 1, 1,
0.8709709, -1.104295, 0.9026754, 1, 1, 1, 1, 1,
0.8714705, 0.4372716, 0.06480309, 1, 1, 1, 1, 1,
0.8738599, 0.1475234, 1.964415, 1, 1, 1, 1, 1,
0.8764458, 0.9164848, -0.3783313, 1, 1, 1, 1, 1,
0.883258, 1.116841, 1.036848, 1, 1, 1, 1, 1,
0.8855233, -0.2191819, 1.768169, 1, 1, 1, 1, 1,
0.8926083, -0.5376704, 2.561279, 0, 0, 1, 1, 1,
0.8929306, 0.3075375, 0.1748059, 1, 0, 0, 1, 1,
0.8936296, -0.8110456, 2.787719, 1, 0, 0, 1, 1,
0.898359, -0.2217035, -0.08866855, 1, 0, 0, 1, 1,
0.901282, -0.1925666, 0.6688274, 1, 0, 0, 1, 1,
0.9059823, -2.014213, 4.308362, 1, 0, 0, 1, 1,
0.911949, 1.87882, -0.9308719, 0, 0, 0, 1, 1,
0.9145179, -1.466199, 2.891981, 0, 0, 0, 1, 1,
0.9158175, 1.502844, -0.07265384, 0, 0, 0, 1, 1,
0.9165388, -0.9580951, 2.687865, 0, 0, 0, 1, 1,
0.9215152, -0.4833855, 0.8587601, 0, 0, 0, 1, 1,
0.9314358, -0.1031713, 2.226875, 0, 0, 0, 1, 1,
0.9349322, -0.9275153, 3.161022, 0, 0, 0, 1, 1,
0.9379808, -0.5191172, 4.75244, 1, 1, 1, 1, 1,
0.9449039, -0.1526845, 1.794152, 1, 1, 1, 1, 1,
0.9476418, 1.744568, 1.760954, 1, 1, 1, 1, 1,
0.9477293, 0.6393033, 1.988709, 1, 1, 1, 1, 1,
0.9480015, 0.3839749, 1.113431, 1, 1, 1, 1, 1,
0.9513906, 1.335974, -1.325649, 1, 1, 1, 1, 1,
0.9540869, -0.9927388, 2.532294, 1, 1, 1, 1, 1,
0.9553587, 1.097657, 2.088712, 1, 1, 1, 1, 1,
0.9563968, -0.05356121, 0.78452, 1, 1, 1, 1, 1,
0.9573534, -1.282644, 5.278647, 1, 1, 1, 1, 1,
0.9576453, -1.910255, 3.813417, 1, 1, 1, 1, 1,
0.9665231, -0.5068086, 1.650402, 1, 1, 1, 1, 1,
0.9733453, -0.02516473, 0.4508822, 1, 1, 1, 1, 1,
0.9737035, -0.3922453, 1.502212, 1, 1, 1, 1, 1,
0.9753051, 0.542798, 0.3667182, 1, 1, 1, 1, 1,
0.9816888, 0.6632531, 2.697905, 0, 0, 1, 1, 1,
0.9917584, -0.580616, 3.541471, 1, 0, 0, 1, 1,
0.9982796, -0.5948615, 1.646414, 1, 0, 0, 1, 1,
1.013679, -0.3113721, 2.446127, 1, 0, 0, 1, 1,
1.018181, 0.8997393, 1.472421, 1, 0, 0, 1, 1,
1.024373, -0.05151825, 0.6980838, 1, 0, 0, 1, 1,
1.026661, -0.6914079, 3.477487, 0, 0, 0, 1, 1,
1.030452, -1.592343, 1.132797, 0, 0, 0, 1, 1,
1.038265, -0.9712054, 2.02857, 0, 0, 0, 1, 1,
1.048672, 1.049904, 0.9091072, 0, 0, 0, 1, 1,
1.06609, 1.528168, 0.2027827, 0, 0, 0, 1, 1,
1.070657, -0.8145364, 2.638561, 0, 0, 0, 1, 1,
1.072271, 0.6129122, 0.4788737, 0, 0, 0, 1, 1,
1.076705, -1.517941, 2.589278, 1, 1, 1, 1, 1,
1.08026, 0.3755386, 2.934316, 1, 1, 1, 1, 1,
1.094846, 0.06184347, 0.9796511, 1, 1, 1, 1, 1,
1.098367, -0.06514032, 1.336957, 1, 1, 1, 1, 1,
1.099316, -1.225683, 0.8736525, 1, 1, 1, 1, 1,
1.101967, 1.560424, -0.4870095, 1, 1, 1, 1, 1,
1.102502, 0.4693194, 0.6604444, 1, 1, 1, 1, 1,
1.105103, -0.4380035, 0.6861212, 1, 1, 1, 1, 1,
1.119214, -1.868241, 3.697793, 1, 1, 1, 1, 1,
1.125129, 1.490352, -0.01861728, 1, 1, 1, 1, 1,
1.132117, -0.2334763, 1.599877, 1, 1, 1, 1, 1,
1.134074, 0.3684214, 1.286423, 1, 1, 1, 1, 1,
1.13832, 1.450533, 0.3324247, 1, 1, 1, 1, 1,
1.141935, -0.4401902, 2.70646, 1, 1, 1, 1, 1,
1.147375, 0.5613483, 1.060031, 1, 1, 1, 1, 1,
1.158661, 1.741542, 1.058869, 0, 0, 1, 1, 1,
1.162469, -0.2682643, 1.196338, 1, 0, 0, 1, 1,
1.168848, 0.8784636, -0.2250248, 1, 0, 0, 1, 1,
1.175424, 0.660062, 0.9924895, 1, 0, 0, 1, 1,
1.179364, 0.4864286, 2.862763, 1, 0, 0, 1, 1,
1.191408, 2.028342, -1.007403, 1, 0, 0, 1, 1,
1.204138, 0.1529565, 3.00099, 0, 0, 0, 1, 1,
1.21236, 0.7394534, 1.51705, 0, 0, 0, 1, 1,
1.212398, 1.328688, -0.536001, 0, 0, 0, 1, 1,
1.212414, -0.1744849, 1.110727, 0, 0, 0, 1, 1,
1.224434, 0.5498267, 0.5811879, 0, 0, 0, 1, 1,
1.228812, 1.921232, 2.287741, 0, 0, 0, 1, 1,
1.230845, 0.2483273, 2.006897, 0, 0, 0, 1, 1,
1.232005, -1.612189, 2.450497, 1, 1, 1, 1, 1,
1.25515, -0.4350953, 2.815017, 1, 1, 1, 1, 1,
1.25926, -0.9588476, 0.5232301, 1, 1, 1, 1, 1,
1.259755, 0.003411667, 1.681201, 1, 1, 1, 1, 1,
1.262979, -0.08056358, 1.28228, 1, 1, 1, 1, 1,
1.262986, 0.2808882, 1.2676, 1, 1, 1, 1, 1,
1.278196, 0.6462587, 2.379744, 1, 1, 1, 1, 1,
1.283435, 0.8115125, 0.7376736, 1, 1, 1, 1, 1,
1.284538, 0.7275457, 1.837969, 1, 1, 1, 1, 1,
1.286348, 0.06504886, 1.804061, 1, 1, 1, 1, 1,
1.306648, 0.1326891, 1.379754, 1, 1, 1, 1, 1,
1.310766, 2.030265, 1.295146, 1, 1, 1, 1, 1,
1.317594, -0.8747806, 2.121526, 1, 1, 1, 1, 1,
1.323221, 0.4746471, 0.4410858, 1, 1, 1, 1, 1,
1.32538, -1.238972, 2.608438, 1, 1, 1, 1, 1,
1.333144, 0.9797981, 2.662029, 0, 0, 1, 1, 1,
1.336283, 1.326517, -0.5629348, 1, 0, 0, 1, 1,
1.339306, 0.1794127, 2.247406, 1, 0, 0, 1, 1,
1.34161, 0.2466323, 0.7157294, 1, 0, 0, 1, 1,
1.344693, 1.998926, 0.3861501, 1, 0, 0, 1, 1,
1.345202, -0.1327704, 0.5347279, 1, 0, 0, 1, 1,
1.34669, -0.5696965, 1.347529, 0, 0, 0, 1, 1,
1.347229, -1.76672, 2.894454, 0, 0, 0, 1, 1,
1.354176, -0.7148708, 2.6468, 0, 0, 0, 1, 1,
1.35598, -0.8805624, 2.286187, 0, 0, 0, 1, 1,
1.36373, 0.4056808, 1.937489, 0, 0, 0, 1, 1,
1.365805, 1.433387, 1.21336, 0, 0, 0, 1, 1,
1.373968, -1.180467, 1.911488, 0, 0, 0, 1, 1,
1.394399, 1.323829, 1.865247, 1, 1, 1, 1, 1,
1.396157, -0.9715529, 2.820357, 1, 1, 1, 1, 1,
1.415648, 0.9848076, 3.565321, 1, 1, 1, 1, 1,
1.416966, 0.6181454, 0.03837266, 1, 1, 1, 1, 1,
1.418909, -1.741633, 2.35496, 1, 1, 1, 1, 1,
1.435678, 0.03107124, -0.0213499, 1, 1, 1, 1, 1,
1.438041, -0.6064789, 3.197872, 1, 1, 1, 1, 1,
1.439243, 0.6767315, -0.8828951, 1, 1, 1, 1, 1,
1.450312, 0.1580167, 2.127308, 1, 1, 1, 1, 1,
1.453053, -0.7421249, 2.342776, 1, 1, 1, 1, 1,
1.461072, 0.2920539, 2.375187, 1, 1, 1, 1, 1,
1.463448, 0.007519817, 2.392525, 1, 1, 1, 1, 1,
1.469902, 1.671749, 1.95762, 1, 1, 1, 1, 1,
1.476014, 0.5325814, 1.233337, 1, 1, 1, 1, 1,
1.488907, 0.7902108, 0.2321597, 1, 1, 1, 1, 1,
1.497745, -1.353871, 2.545179, 0, 0, 1, 1, 1,
1.500558, 0.747068, -2.573384, 1, 0, 0, 1, 1,
1.504238, -1.856378, 2.965509, 1, 0, 0, 1, 1,
1.508557, 1.320495, 2.363167, 1, 0, 0, 1, 1,
1.510407, -1.195041, 1.716975, 1, 0, 0, 1, 1,
1.526086, 0.4815666, 3.018305, 1, 0, 0, 1, 1,
1.526921, -0.94284, 0.550937, 0, 0, 0, 1, 1,
1.535658, 2.07207, -0.7271348, 0, 0, 0, 1, 1,
1.559689, -0.007373335, 3.010239, 0, 0, 0, 1, 1,
1.562377, -0.173555, 2.173703, 0, 0, 0, 1, 1,
1.563911, 1.344564, 1.853556, 0, 0, 0, 1, 1,
1.56548, -0.1275858, 2.923381, 0, 0, 0, 1, 1,
1.572061, 1.163257, -0.3473286, 0, 0, 0, 1, 1,
1.573595, -0.2466017, 1.304074, 1, 1, 1, 1, 1,
1.576236, 1.376764, 0.8840192, 1, 1, 1, 1, 1,
1.579655, 1.784178, 0.3563822, 1, 1, 1, 1, 1,
1.582706, 0.0498951, 2.168159, 1, 1, 1, 1, 1,
1.591135, -0.9383215, 2.523988, 1, 1, 1, 1, 1,
1.598074, 0.7281331, 1.351777, 1, 1, 1, 1, 1,
1.608453, -0.2124521, 3.074336, 1, 1, 1, 1, 1,
1.632023, -0.6602972, 2.366774, 1, 1, 1, 1, 1,
1.649896, 1.106786, 1.174536, 1, 1, 1, 1, 1,
1.664742, -0.7263206, 1.713128, 1, 1, 1, 1, 1,
1.666619, 2.151124, 1.974443, 1, 1, 1, 1, 1,
1.673783, 1.833926, 0.2956411, 1, 1, 1, 1, 1,
1.676431, -2.551162, 2.848797, 1, 1, 1, 1, 1,
1.686703, 0.8084126, -0.06283911, 1, 1, 1, 1, 1,
1.695751, 0.7397583, -0.1186943, 1, 1, 1, 1, 1,
1.698453, 0.4386987, 1.467846, 0, 0, 1, 1, 1,
1.721555, -0.689849, 2.518817, 1, 0, 0, 1, 1,
1.729867, -0.01641876, 2.518924, 1, 0, 0, 1, 1,
1.730828, -0.5307212, 2.474479, 1, 0, 0, 1, 1,
1.740067, -1.192252, 2.556122, 1, 0, 0, 1, 1,
1.744475, 1.397941, 1.236681, 1, 0, 0, 1, 1,
1.74458, 0.7728704, 2.878449, 0, 0, 0, 1, 1,
1.751433, -0.7329303, 2.548023, 0, 0, 0, 1, 1,
1.757982, -0.4011463, 0.5455574, 0, 0, 0, 1, 1,
1.761383, 0.2948845, 2.275915, 0, 0, 0, 1, 1,
1.805476, -0.8749114, 2.797756, 0, 0, 0, 1, 1,
1.822739, 1.403737, 2.316292, 0, 0, 0, 1, 1,
1.842162, 1.232622, -0.004659323, 0, 0, 0, 1, 1,
1.854321, -0.04924587, 1.471863, 1, 1, 1, 1, 1,
1.854474, -0.5619045, 1.262619, 1, 1, 1, 1, 1,
1.85717, 0.1930064, 1.906939, 1, 1, 1, 1, 1,
1.861831, -0.4102726, 0.3777071, 1, 1, 1, 1, 1,
1.862564, -0.165364, 0.6574438, 1, 1, 1, 1, 1,
1.896457, -0.3864679, 2.100691, 1, 1, 1, 1, 1,
1.906907, -0.02987632, 1.486949, 1, 1, 1, 1, 1,
1.929794, -0.06583042, 0.8505397, 1, 1, 1, 1, 1,
1.933353, 2.619021, 0.367597, 1, 1, 1, 1, 1,
1.949482, 0.552232, 1.692465, 1, 1, 1, 1, 1,
1.973271, 1.075882, 0.1819107, 1, 1, 1, 1, 1,
1.981621, -1.271217, 2.071721, 1, 1, 1, 1, 1,
1.984847, 0.3396192, 1.128963, 1, 1, 1, 1, 1,
2.026909, 1.490708, 1.337292, 1, 1, 1, 1, 1,
2.035496, 0.3579061, 0.006169009, 1, 1, 1, 1, 1,
2.045475, 0.5356179, 2.296455, 0, 0, 1, 1, 1,
2.064896, 1.952704, 1.446456, 1, 0, 0, 1, 1,
2.076239, -0.1023059, 2.858341, 1, 0, 0, 1, 1,
2.092943, 0.1726989, 2.392235, 1, 0, 0, 1, 1,
2.10694, 0.4856367, 1.927765, 1, 0, 0, 1, 1,
2.11447, 0.3286346, 2.146991, 1, 0, 0, 1, 1,
2.138864, 0.490014, -0.3792794, 0, 0, 0, 1, 1,
2.159572, -1.007932, 0.4261527, 0, 0, 0, 1, 1,
2.206769, 0.5829014, 0.5537797, 0, 0, 0, 1, 1,
2.287698, -0.7858945, 1.512686, 0, 0, 0, 1, 1,
2.289153, -1.363838, 4.535031, 0, 0, 0, 1, 1,
2.372107, 0.2178801, 1.167525, 0, 0, 0, 1, 1,
2.473573, 1.133431, 0.7287865, 0, 0, 0, 1, 1,
2.569731, -0.08178798, 1.241478, 1, 1, 1, 1, 1,
2.615542, -1.321762, 1.768896, 1, 1, 1, 1, 1,
2.626189, 0.9383106, 0.9959904, 1, 1, 1, 1, 1,
2.756168, -0.5748186, 3.62056, 1, 1, 1, 1, 1,
2.80479, -0.4373415, 3.369364, 1, 1, 1, 1, 1,
2.994425, -0.2716982, 0.9384326, 1, 1, 1, 1, 1,
3.713962, 0.1698466, 0.9842511, 1, 1, 1, 1, 1
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
var radius = 9.460038;
var distance = 33.22798;
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
mvMatrix.translate( -0.06699491, 0.01913416, -0.1785398 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22798);
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
