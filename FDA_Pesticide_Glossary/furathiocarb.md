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
-3.168956, -0.01917751, -0.4348242, 1, 0, 0, 1,
-2.733027, 1.131053, -0.1202983, 1, 0.007843138, 0, 1,
-2.693281, -1.349138, -1.834103, 1, 0.01176471, 0, 1,
-2.525002, 0.2540058, -1.412586, 1, 0.01960784, 0, 1,
-2.498752, 0.2386003, -1.234036, 1, 0.02352941, 0, 1,
-2.433737, -0.4141133, -1.064964, 1, 0.03137255, 0, 1,
-2.389194, -0.1526264, -1.622395, 1, 0.03529412, 0, 1,
-2.360068, -1.376832, -2.942346, 1, 0.04313726, 0, 1,
-2.267675, -2.787623, -1.231466, 1, 0.04705882, 0, 1,
-2.234621, 0.2948835, -0.3602438, 1, 0.05490196, 0, 1,
-2.22698, 0.01654731, 0.07137847, 1, 0.05882353, 0, 1,
-2.203243, -0.03197565, -0.1111335, 1, 0.06666667, 0, 1,
-2.188652, -2.868249, -2.833022, 1, 0.07058824, 0, 1,
-2.179165, 0.8002377, -0.3613196, 1, 0.07843138, 0, 1,
-2.169135, 1.022999, -1.509421, 1, 0.08235294, 0, 1,
-2.136843, -1.882345, -1.326487, 1, 0.09019608, 0, 1,
-2.126025, 0.9917381, 0.2035422, 1, 0.09411765, 0, 1,
-2.103202, -0.1047067, 0.7832834, 1, 0.1019608, 0, 1,
-2.096398, -0.4438705, 0.7292153, 1, 0.1098039, 0, 1,
-2.092465, -0.7752479, -2.905636, 1, 0.1137255, 0, 1,
-2.058577, -0.3890564, -0.8172377, 1, 0.1215686, 0, 1,
-2.035435, -0.1687847, -0.728691, 1, 0.1254902, 0, 1,
-1.982557, -1.569956, -1.965836, 1, 0.1333333, 0, 1,
-1.964944, -0.2014658, -2.461764, 1, 0.1372549, 0, 1,
-1.953322, 0.1662117, -0.2412744, 1, 0.145098, 0, 1,
-1.915345, -0.7435799, -0.8717186, 1, 0.1490196, 0, 1,
-1.905103, -1.366411, -1.989209, 1, 0.1568628, 0, 1,
-1.902681, -0.3902362, -1.032685, 1, 0.1607843, 0, 1,
-1.898893, -1.805048, -2.675588, 1, 0.1686275, 0, 1,
-1.86221, -1.16651, -1.050325, 1, 0.172549, 0, 1,
-1.859094, -0.456804, -1.670494, 1, 0.1803922, 0, 1,
-1.853752, 0.768888, -0.7730736, 1, 0.1843137, 0, 1,
-1.826894, -0.1351094, -1.463269, 1, 0.1921569, 0, 1,
-1.826111, -0.3064765, -3.102362, 1, 0.1960784, 0, 1,
-1.823352, 0.5939904, -2.584185, 1, 0.2039216, 0, 1,
-1.823114, 0.2668827, -0.9384807, 1, 0.2117647, 0, 1,
-1.819556, -0.2350818, -2.281809, 1, 0.2156863, 0, 1,
-1.799203, 0.572642, -0.8069369, 1, 0.2235294, 0, 1,
-1.746328, 0.8612675, -1.158969, 1, 0.227451, 0, 1,
-1.73156, -2.541771, -4.316007, 1, 0.2352941, 0, 1,
-1.697395, 1.606725, -0.4468392, 1, 0.2392157, 0, 1,
-1.688534, -0.2777028, -1.620023, 1, 0.2470588, 0, 1,
-1.684827, -0.226256, -1.932588, 1, 0.2509804, 0, 1,
-1.675013, -0.155144, -1.982922, 1, 0.2588235, 0, 1,
-1.650466, -1.197348, -1.914606, 1, 0.2627451, 0, 1,
-1.645481, 0.2841839, -2.289662, 1, 0.2705882, 0, 1,
-1.628205, -0.4166493, -3.139456, 1, 0.2745098, 0, 1,
-1.621083, -0.6412385, -2.126816, 1, 0.282353, 0, 1,
-1.609642, 0.8551754, -0.731936, 1, 0.2862745, 0, 1,
-1.59515, 1.576062, 1.082, 1, 0.2941177, 0, 1,
-1.569422, -0.3773477, -3.919299, 1, 0.3019608, 0, 1,
-1.552441, 0.6928757, -3.147243, 1, 0.3058824, 0, 1,
-1.535578, -1.345276, -1.285952, 1, 0.3137255, 0, 1,
-1.510621, -0.9081854, -3.358374, 1, 0.3176471, 0, 1,
-1.509574, -0.4959677, -2.298429, 1, 0.3254902, 0, 1,
-1.505462, 0.2662554, 0.3637356, 1, 0.3294118, 0, 1,
-1.497075, 0.730549, -3.133258, 1, 0.3372549, 0, 1,
-1.496073, 1.694433, -0.893273, 1, 0.3411765, 0, 1,
-1.491302, -1.912063, -2.183118, 1, 0.3490196, 0, 1,
-1.488317, -0.4644224, -1.051665, 1, 0.3529412, 0, 1,
-1.487889, 1.025442, -0.695868, 1, 0.3607843, 0, 1,
-1.481542, -0.479548, -2.424484, 1, 0.3647059, 0, 1,
-1.47692, 0.1240543, -2.287493, 1, 0.372549, 0, 1,
-1.46318, -1.008621, -2.300562, 1, 0.3764706, 0, 1,
-1.452312, -1.512893, -4.111752, 1, 0.3843137, 0, 1,
-1.451307, -0.02260263, -1.857571, 1, 0.3882353, 0, 1,
-1.450936, -0.8943259, -1.215527, 1, 0.3960784, 0, 1,
-1.43781, -0.1213394, -3.608635, 1, 0.4039216, 0, 1,
-1.434574, 1.116316, -0.4359046, 1, 0.4078431, 0, 1,
-1.427835, -0.2815849, -1.104199, 1, 0.4156863, 0, 1,
-1.39395, -1.968825, -1.681225, 1, 0.4196078, 0, 1,
-1.392061, -1.051135, -2.769603, 1, 0.427451, 0, 1,
-1.386278, -1.835473, -3.042306, 1, 0.4313726, 0, 1,
-1.369669, 0.5625819, -0.558013, 1, 0.4392157, 0, 1,
-1.369652, 0.7646883, -0.4565691, 1, 0.4431373, 0, 1,
-1.366315, 0.06957766, -1.811053, 1, 0.4509804, 0, 1,
-1.358692, -0.2157706, -0.5462049, 1, 0.454902, 0, 1,
-1.348961, -1.380625, -2.885618, 1, 0.4627451, 0, 1,
-1.332466, 0.5956368, -1.004167, 1, 0.4666667, 0, 1,
-1.327155, -0.620461, -2.200976, 1, 0.4745098, 0, 1,
-1.322552, -0.6160312, -2.354388, 1, 0.4784314, 0, 1,
-1.317008, -0.2317742, -2.281464, 1, 0.4862745, 0, 1,
-1.316092, 0.4495582, -0.8962387, 1, 0.4901961, 0, 1,
-1.305577, 0.7443593, -0.1781797, 1, 0.4980392, 0, 1,
-1.301104, -0.2579701, -1.198793, 1, 0.5058824, 0, 1,
-1.298251, -0.521099, -2.985027, 1, 0.509804, 0, 1,
-1.296576, 0.8753749, -0.9839956, 1, 0.5176471, 0, 1,
-1.280049, 1.664852, -1.135806, 1, 0.5215687, 0, 1,
-1.273078, -0.6925046, -2.875016, 1, 0.5294118, 0, 1,
-1.264239, 2.002116, -2.535644, 1, 0.5333334, 0, 1,
-1.26423, 0.5045145, -1.821327, 1, 0.5411765, 0, 1,
-1.260978, 0.5759733, -2.307194, 1, 0.5450981, 0, 1,
-1.255341, 0.5910164, -0.8594552, 1, 0.5529412, 0, 1,
-1.23363, -0.5071219, -1.477412, 1, 0.5568628, 0, 1,
-1.232612, -0.008636698, -1.759035, 1, 0.5647059, 0, 1,
-1.231173, -2.010861, -3.910722, 1, 0.5686275, 0, 1,
-1.220006, -0.6749157, -0.6740416, 1, 0.5764706, 0, 1,
-1.217219, -1.0052, -3.69379, 1, 0.5803922, 0, 1,
-1.203826, -0.7975014, -3.100877, 1, 0.5882353, 0, 1,
-1.19728, 1.127878, -1.361937, 1, 0.5921569, 0, 1,
-1.187981, 1.005086, -1.526484, 1, 0.6, 0, 1,
-1.180412, -1.652611, -0.283921, 1, 0.6078432, 0, 1,
-1.176936, 0.7216517, -2.475674, 1, 0.6117647, 0, 1,
-1.17386, 1.240259, -0.8774894, 1, 0.6196079, 0, 1,
-1.1738, 0.7709951, -0.4478047, 1, 0.6235294, 0, 1,
-1.16193, -2.487107, -2.263765, 1, 0.6313726, 0, 1,
-1.160365, 1.042951, -2.446224, 1, 0.6352941, 0, 1,
-1.149581, -0.7535696, -3.243862, 1, 0.6431373, 0, 1,
-1.129399, -0.008869279, -2.152613, 1, 0.6470588, 0, 1,
-1.122655, -0.05952353, -1.407376, 1, 0.654902, 0, 1,
-1.122224, -1.011497, -2.370291, 1, 0.6588235, 0, 1,
-1.121998, 0.2403719, -0.01665346, 1, 0.6666667, 0, 1,
-1.121344, 0.1364217, -1.422414, 1, 0.6705883, 0, 1,
-1.120467, 0.2423451, -2.090751, 1, 0.6784314, 0, 1,
-1.118275, 0.1570572, -2.491415, 1, 0.682353, 0, 1,
-1.11684, 0.8273804, -1.198287, 1, 0.6901961, 0, 1,
-1.109309, 1.175526, -1.678614, 1, 0.6941177, 0, 1,
-1.107984, 0.8352048, -1.432204, 1, 0.7019608, 0, 1,
-1.099913, 0.5037701, -2.082579, 1, 0.7098039, 0, 1,
-1.096716, -0.5085271, -1.528901, 1, 0.7137255, 0, 1,
-1.092254, 0.909213, -2.131232, 1, 0.7215686, 0, 1,
-1.09176, 0.4411102, -2.004323, 1, 0.7254902, 0, 1,
-1.087417, -0.3344452, -1.568785, 1, 0.7333333, 0, 1,
-1.081331, -1.229148, -2.993269, 1, 0.7372549, 0, 1,
-1.075122, -0.4171536, -0.6405424, 1, 0.7450981, 0, 1,
-1.072823, -0.106179, -1.730598, 1, 0.7490196, 0, 1,
-1.066548, 0.6344314, -0.2687722, 1, 0.7568628, 0, 1,
-1.061021, -1.268839, -3.083273, 1, 0.7607843, 0, 1,
-1.05829, 0.1011651, -1.083839, 1, 0.7686275, 0, 1,
-1.057692, -0.3344438, -2.350927, 1, 0.772549, 0, 1,
-1.056277, -0.3930185, -3.133071, 1, 0.7803922, 0, 1,
-1.054825, 0.08488483, -0.7674581, 1, 0.7843137, 0, 1,
-1.045062, -0.1078408, -2.221054, 1, 0.7921569, 0, 1,
-1.043908, -0.2860821, -2.404308, 1, 0.7960784, 0, 1,
-1.043408, 0.05561937, -2.026374, 1, 0.8039216, 0, 1,
-1.042987, -0.03635578, -1.680564, 1, 0.8117647, 0, 1,
-1.037709, -1.865648, -1.524817, 1, 0.8156863, 0, 1,
-1.033245, 0.4232252, -1.937353, 1, 0.8235294, 0, 1,
-1.030665, 1.316662, 0.03594078, 1, 0.827451, 0, 1,
-1.028735, 1.361227, 0.7728313, 1, 0.8352941, 0, 1,
-1.024413, 1.525042, -0.3887129, 1, 0.8392157, 0, 1,
-1.024248, -0.7326544, -4.353169, 1, 0.8470588, 0, 1,
-1.019874, -0.9318482, -3.268193, 1, 0.8509804, 0, 1,
-1.016358, -0.2147694, -2.321497, 1, 0.8588235, 0, 1,
-1.015733, 0.7187402, -0.8015757, 1, 0.8627451, 0, 1,
-1.005233, 0.452232, -2.143944, 1, 0.8705882, 0, 1,
-0.9991861, -0.2987131, 0.5517203, 1, 0.8745098, 0, 1,
-0.986085, 1.256239, -0.1066888, 1, 0.8823529, 0, 1,
-0.9822583, 0.01307938, -2.960161, 1, 0.8862745, 0, 1,
-0.9784109, 1.657315, 0.4005972, 1, 0.8941177, 0, 1,
-0.9652861, -0.3325855, 0.2605582, 1, 0.8980392, 0, 1,
-0.9598956, 0.0650791, -1.326507, 1, 0.9058824, 0, 1,
-0.9310393, -1.035732, -1.865567, 1, 0.9137255, 0, 1,
-0.9308707, 0.6945494, -0.9002565, 1, 0.9176471, 0, 1,
-0.9261453, -1.75649, -3.485215, 1, 0.9254902, 0, 1,
-0.924882, 1.670413, -0.6469462, 1, 0.9294118, 0, 1,
-0.9187834, -0.3076295, -0.3325886, 1, 0.9372549, 0, 1,
-0.9186575, -0.4884087, -0.8183828, 1, 0.9411765, 0, 1,
-0.9170893, -1.075405, -2.599574, 1, 0.9490196, 0, 1,
-0.9054627, -0.5662652, -2.811954, 1, 0.9529412, 0, 1,
-0.901606, -0.1333404, -1.274229, 1, 0.9607843, 0, 1,
-0.9009783, 1.974174, -0.6558238, 1, 0.9647059, 0, 1,
-0.8992108, -0.8011396, -0.427485, 1, 0.972549, 0, 1,
-0.8955655, 1.68099, -0.6512823, 1, 0.9764706, 0, 1,
-0.8865032, 0.2976548, -2.769734, 1, 0.9843137, 0, 1,
-0.8852633, 0.2440724, -1.986884, 1, 0.9882353, 0, 1,
-0.8840126, 0.5053264, -0.1798865, 1, 0.9960784, 0, 1,
-0.8773165, -0.9299636, -3.258804, 0.9960784, 1, 0, 1,
-0.875293, -0.6245531, -1.076323, 0.9921569, 1, 0, 1,
-0.8749844, 1.216451, 0.1975433, 0.9843137, 1, 0, 1,
-0.8574797, -0.3782533, -2.426779, 0.9803922, 1, 0, 1,
-0.8574219, -1.045066, -1.549174, 0.972549, 1, 0, 1,
-0.8561484, 1.713666, 0.1841252, 0.9686275, 1, 0, 1,
-0.8555498, 0.6514763, -0.2617516, 0.9607843, 1, 0, 1,
-0.8541952, 0.09746972, -0.7548158, 0.9568627, 1, 0, 1,
-0.849798, -0.3660296, -2.996485, 0.9490196, 1, 0, 1,
-0.8431846, -0.8612856, -2.175674, 0.945098, 1, 0, 1,
-0.8387094, 0.8363696, -0.7698863, 0.9372549, 1, 0, 1,
-0.835586, -0.8441199, -2.037956, 0.9333333, 1, 0, 1,
-0.832714, 0.6909258, -0.3747526, 0.9254902, 1, 0, 1,
-0.826824, -0.3173809, -1.395492, 0.9215686, 1, 0, 1,
-0.8251846, -1.080756, -3.508834, 0.9137255, 1, 0, 1,
-0.8234428, -0.2582683, -1.982822, 0.9098039, 1, 0, 1,
-0.8174782, -1.199157, -3.601566, 0.9019608, 1, 0, 1,
-0.8163124, -1.662277, -3.464833, 0.8941177, 1, 0, 1,
-0.8139171, 0.8264587, 0.9261069, 0.8901961, 1, 0, 1,
-0.8040288, 0.5757499, -1.960771, 0.8823529, 1, 0, 1,
-0.8040112, -0.6947714, -1.663494, 0.8784314, 1, 0, 1,
-0.8030659, -1.320592, -3.482576, 0.8705882, 1, 0, 1,
-0.7921969, -0.9511145, -2.915955, 0.8666667, 1, 0, 1,
-0.7879345, -0.7488237, -2.46607, 0.8588235, 1, 0, 1,
-0.7854354, -0.7085319, -2.18458, 0.854902, 1, 0, 1,
-0.7852311, 1.131763, -0.8764799, 0.8470588, 1, 0, 1,
-0.7820983, -0.3584304, -0.578666, 0.8431373, 1, 0, 1,
-0.7809793, 1.127317, -0.4463661, 0.8352941, 1, 0, 1,
-0.776087, -0.2621109, -1.577913, 0.8313726, 1, 0, 1,
-0.7757972, -0.5061206, -1.906533, 0.8235294, 1, 0, 1,
-0.7744543, 2.344706, -0.7692966, 0.8196079, 1, 0, 1,
-0.7694124, 1.293976, -0.2438447, 0.8117647, 1, 0, 1,
-0.7670304, -1.070953, -2.185682, 0.8078431, 1, 0, 1,
-0.7635028, 0.4106697, 0.5184423, 0.8, 1, 0, 1,
-0.7613607, 0.5660817, -0.7010968, 0.7921569, 1, 0, 1,
-0.7599488, -1.491386, -2.432426, 0.7882353, 1, 0, 1,
-0.7592044, 0.02453977, -1.638927, 0.7803922, 1, 0, 1,
-0.7578249, 0.02151304, -1.31779, 0.7764706, 1, 0, 1,
-0.7575607, 2.116823, -0.9391238, 0.7686275, 1, 0, 1,
-0.748311, 0.190288, -1.125965, 0.7647059, 1, 0, 1,
-0.7472056, -0.1762445, -0.0284062, 0.7568628, 1, 0, 1,
-0.7432981, 0.7600077, 0.01176564, 0.7529412, 1, 0, 1,
-0.7408617, -0.4813546, -1.558083, 0.7450981, 1, 0, 1,
-0.7371235, -1.459436, -2.940318, 0.7411765, 1, 0, 1,
-0.7368355, 1.151642, -1.000858, 0.7333333, 1, 0, 1,
-0.7353547, -0.2575764, -0.5479491, 0.7294118, 1, 0, 1,
-0.7293851, -0.09580874, -2.761203, 0.7215686, 1, 0, 1,
-0.7260651, 0.7007638, -1.166808, 0.7176471, 1, 0, 1,
-0.7231656, 1.92465, -0.6977797, 0.7098039, 1, 0, 1,
-0.7157034, 0.7751592, -1.62909, 0.7058824, 1, 0, 1,
-0.7142143, -1.134997, -2.5242, 0.6980392, 1, 0, 1,
-0.7071185, 0.05042247, -0.1287857, 0.6901961, 1, 0, 1,
-0.7069125, 0.8655491, -0.7343484, 0.6862745, 1, 0, 1,
-0.7056502, 0.1812738, -2.724425, 0.6784314, 1, 0, 1,
-0.7044495, -1.266977, -1.217989, 0.6745098, 1, 0, 1,
-0.689485, -0.8754668, -1.297553, 0.6666667, 1, 0, 1,
-0.6894107, 0.5346789, -1.659191, 0.6627451, 1, 0, 1,
-0.6832466, 0.5338075, -1.788175, 0.654902, 1, 0, 1,
-0.680257, 1.164034, -0.265273, 0.6509804, 1, 0, 1,
-0.6702393, -0.185279, -2.18259, 0.6431373, 1, 0, 1,
-0.6691226, -0.4087891, -0.36158, 0.6392157, 1, 0, 1,
-0.6675853, -1.315109, -2.959402, 0.6313726, 1, 0, 1,
-0.6672928, 0.952162, -0.2259559, 0.627451, 1, 0, 1,
-0.6670725, 0.1548373, -1.615588, 0.6196079, 1, 0, 1,
-0.6649435, -0.9891255, -3.644545, 0.6156863, 1, 0, 1,
-0.6633562, -0.8305941, -2.86944, 0.6078432, 1, 0, 1,
-0.6594824, 1.250353, -0.8572537, 0.6039216, 1, 0, 1,
-0.6566553, -2.282195, -3.72103, 0.5960785, 1, 0, 1,
-0.654442, 0.6088831, -0.4035116, 0.5882353, 1, 0, 1,
-0.6534173, -0.2736141, -1.171798, 0.5843138, 1, 0, 1,
-0.6521224, 0.2438725, -0.4775918, 0.5764706, 1, 0, 1,
-0.6469868, -0.6447098, -2.010098, 0.572549, 1, 0, 1,
-0.6461553, -0.5057291, -2.386243, 0.5647059, 1, 0, 1,
-0.6439974, -0.06785268, -3.284179, 0.5607843, 1, 0, 1,
-0.6422387, 1.766045, -0.8107744, 0.5529412, 1, 0, 1,
-0.6404563, -0.8441231, -0.1542012, 0.5490196, 1, 0, 1,
-0.63591, -0.1125917, 0.488813, 0.5411765, 1, 0, 1,
-0.6217735, 2.598652, -0.91114, 0.5372549, 1, 0, 1,
-0.6212592, 0.2560607, -2.938546, 0.5294118, 1, 0, 1,
-0.6211642, -1.119924, -2.728781, 0.5254902, 1, 0, 1,
-0.6155876, 2.579151, -0.5224476, 0.5176471, 1, 0, 1,
-0.613448, 0.2774093, -1.085673, 0.5137255, 1, 0, 1,
-0.6114891, 0.4696457, -0.9684882, 0.5058824, 1, 0, 1,
-0.6062261, 1.158832, -0.4908451, 0.5019608, 1, 0, 1,
-0.6055371, -2.151471, -2.622128, 0.4941176, 1, 0, 1,
-0.5928639, -0.007809494, -2.240293, 0.4862745, 1, 0, 1,
-0.5910394, 0.1526182, -1.546012, 0.4823529, 1, 0, 1,
-0.5832935, -0.4682647, -2.860701, 0.4745098, 1, 0, 1,
-0.5774673, 0.3396808, 0.1113502, 0.4705882, 1, 0, 1,
-0.5769426, 0.6918339, -0.7593706, 0.4627451, 1, 0, 1,
-0.5703322, 1.32517, -1.340251, 0.4588235, 1, 0, 1,
-0.56916, 0.4141194, -0.8811525, 0.4509804, 1, 0, 1,
-0.5673534, -0.5072747, -2.266463, 0.4470588, 1, 0, 1,
-0.5670618, -0.1946462, -0.4641486, 0.4392157, 1, 0, 1,
-0.5661221, -0.4632313, -2.326367, 0.4352941, 1, 0, 1,
-0.5623667, -0.9850603, -1.878593, 0.427451, 1, 0, 1,
-0.5622122, 1.644517, 0.00801536, 0.4235294, 1, 0, 1,
-0.5572813, -1.286053, -1.751441, 0.4156863, 1, 0, 1,
-0.556847, 0.9124629, -0.1724905, 0.4117647, 1, 0, 1,
-0.5556107, 0.1723612, -0.7493101, 0.4039216, 1, 0, 1,
-0.5555972, -1.895231, -3.389283, 0.3960784, 1, 0, 1,
-0.5536754, 0.4108091, -2.043664, 0.3921569, 1, 0, 1,
-0.5533453, -0.08183277, -1.288036, 0.3843137, 1, 0, 1,
-0.551361, -0.02313079, -0.5368488, 0.3803922, 1, 0, 1,
-0.5486254, -0.1856671, -3.33975, 0.372549, 1, 0, 1,
-0.5471746, 1.827114, -0.1904092, 0.3686275, 1, 0, 1,
-0.5466512, 0.8001825, -0.1416894, 0.3607843, 1, 0, 1,
-0.5435866, 0.4637648, -1.400646, 0.3568628, 1, 0, 1,
-0.5396114, 0.5291342, -1.794763, 0.3490196, 1, 0, 1,
-0.5395063, -1.014634, -3.385569, 0.345098, 1, 0, 1,
-0.5367142, -0.8203768, -2.15529, 0.3372549, 1, 0, 1,
-0.5345557, -0.905785, -3.107824, 0.3333333, 1, 0, 1,
-0.5327163, 0.5190188, 0.04285221, 0.3254902, 1, 0, 1,
-0.5277008, 0.9735335, -1.256869, 0.3215686, 1, 0, 1,
-0.5254489, -1.028467, -2.774372, 0.3137255, 1, 0, 1,
-0.525297, -0.9653404, -2.867153, 0.3098039, 1, 0, 1,
-0.5243497, 0.6017497, -0.3348077, 0.3019608, 1, 0, 1,
-0.5225708, 1.751748, -0.2199221, 0.2941177, 1, 0, 1,
-0.5195058, 0.0977203, -1.532286, 0.2901961, 1, 0, 1,
-0.5165152, 0.4536953, -3.002959, 0.282353, 1, 0, 1,
-0.5161773, -0.9069021, -2.48897, 0.2784314, 1, 0, 1,
-0.5161082, -1.365808, -2.251682, 0.2705882, 1, 0, 1,
-0.5142078, -0.7063146, -1.548393, 0.2666667, 1, 0, 1,
-0.5139045, 0.4106404, -1.288171, 0.2588235, 1, 0, 1,
-0.513353, 0.03943656, -1.10095, 0.254902, 1, 0, 1,
-0.5124165, -0.4442264, -2.667328, 0.2470588, 1, 0, 1,
-0.5117512, 0.867301, -0.05530865, 0.2431373, 1, 0, 1,
-0.5095327, 0.9873252, -0.5812672, 0.2352941, 1, 0, 1,
-0.5050289, -0.671472, -2.818409, 0.2313726, 1, 0, 1,
-0.4987884, -0.03967992, -1.234709, 0.2235294, 1, 0, 1,
-0.4942805, -0.9559413, -1.778329, 0.2196078, 1, 0, 1,
-0.4896491, -0.7365957, -3.493281, 0.2117647, 1, 0, 1,
-0.4877385, -0.6358457, -1.656343, 0.2078431, 1, 0, 1,
-0.4848716, 0.3803702, -1.533862, 0.2, 1, 0, 1,
-0.4839706, 0.03255007, -1.235394, 0.1921569, 1, 0, 1,
-0.4838307, -1.046821, -2.601239, 0.1882353, 1, 0, 1,
-0.4808415, -0.1091358, 0.1501767, 0.1803922, 1, 0, 1,
-0.4781992, 2.582537, 0.05590415, 0.1764706, 1, 0, 1,
-0.4665476, -0.8151786, -2.866552, 0.1686275, 1, 0, 1,
-0.4587864, 0.08781614, -2.562921, 0.1647059, 1, 0, 1,
-0.4557964, -0.5621505, -1.376765, 0.1568628, 1, 0, 1,
-0.4525219, 0.8147204, 0.006096107, 0.1529412, 1, 0, 1,
-0.4488641, 0.3272703, -0.7242861, 0.145098, 1, 0, 1,
-0.4466451, -0.3249311, -1.273423, 0.1411765, 1, 0, 1,
-0.4453474, 2.474222, 0.9085571, 0.1333333, 1, 0, 1,
-0.4409278, -0.1919999, -1.028257, 0.1294118, 1, 0, 1,
-0.4407204, 1.015435, 0.09802491, 0.1215686, 1, 0, 1,
-0.4372983, -1.343212, -2.89967, 0.1176471, 1, 0, 1,
-0.4352996, 0.5631951, -0.08906002, 0.1098039, 1, 0, 1,
-0.4323632, 1.858885, 0.3381462, 0.1058824, 1, 0, 1,
-0.4317642, 0.3154542, -1.44215, 0.09803922, 1, 0, 1,
-0.4280634, -0.4564642, -3.82722, 0.09019608, 1, 0, 1,
-0.4258152, 0.6792396, -0.07862347, 0.08627451, 1, 0, 1,
-0.4181555, 0.4243867, -1.240308, 0.07843138, 1, 0, 1,
-0.4180573, -1.972132, -3.219346, 0.07450981, 1, 0, 1,
-0.4116611, -0.1492769, -2.080184, 0.06666667, 1, 0, 1,
-0.4106739, -0.8544907, -2.253444, 0.0627451, 1, 0, 1,
-0.4100449, 0.2311919, -1.749226, 0.05490196, 1, 0, 1,
-0.4086861, -1.985163, -4.358159, 0.05098039, 1, 0, 1,
-0.4086258, -0.4872897, -2.501916, 0.04313726, 1, 0, 1,
-0.4067584, 0.09746169, -0.05289207, 0.03921569, 1, 0, 1,
-0.4014463, 0.1573506, -1.866458, 0.03137255, 1, 0, 1,
-0.4012398, 0.002571643, 0.277632, 0.02745098, 1, 0, 1,
-0.4000125, 1.455061, -0.6286213, 0.01960784, 1, 0, 1,
-0.3995462, -0.8973384, -2.458487, 0.01568628, 1, 0, 1,
-0.3980741, -0.9479212, -1.021633, 0.007843138, 1, 0, 1,
-0.3949477, -1.480801, -1.709337, 0.003921569, 1, 0, 1,
-0.3934987, -1.092359, -2.612474, 0, 1, 0.003921569, 1,
-0.3915823, 0.7002606, -1.93302, 0, 1, 0.01176471, 1,
-0.3901231, 0.3678593, -0.04001169, 0, 1, 0.01568628, 1,
-0.3895303, 0.2435575, -1.852179, 0, 1, 0.02352941, 1,
-0.3888144, -0.2650416, -2.091612, 0, 1, 0.02745098, 1,
-0.3849552, -1.196129, -3.310228, 0, 1, 0.03529412, 1,
-0.3845109, -0.8259592, -1.902138, 0, 1, 0.03921569, 1,
-0.3841752, -1.739921, -2.915438, 0, 1, 0.04705882, 1,
-0.3827019, 0.3149901, -1.482867, 0, 1, 0.05098039, 1,
-0.3816935, -0.8153321, -2.082318, 0, 1, 0.05882353, 1,
-0.3759937, -0.08317744, -1.206525, 0, 1, 0.0627451, 1,
-0.3744877, 1.96818, -0.9061749, 0, 1, 0.07058824, 1,
-0.3738674, -1.149343, -4.153275, 0, 1, 0.07450981, 1,
-0.373724, -0.5093448, -3.6134, 0, 1, 0.08235294, 1,
-0.3724593, 0.4416309, -1.100086, 0, 1, 0.08627451, 1,
-0.3618589, 0.3847988, -0.9597378, 0, 1, 0.09411765, 1,
-0.3599891, -0.4722404, -2.706865, 0, 1, 0.1019608, 1,
-0.3564282, -0.7062119, -2.07397, 0, 1, 0.1058824, 1,
-0.3547614, 1.01295, 1.499707, 0, 1, 0.1137255, 1,
-0.3546854, 1.129468, -0.6166821, 0, 1, 0.1176471, 1,
-0.3543489, 0.1872388, -1.032031, 0, 1, 0.1254902, 1,
-0.3538195, -0.5099228, -2.045792, 0, 1, 0.1294118, 1,
-0.3512768, 1.283537, 0.4552773, 0, 1, 0.1372549, 1,
-0.3501827, 0.6845992, -1.42777, 0, 1, 0.1411765, 1,
-0.3499085, 1.697266, 0.06737537, 0, 1, 0.1490196, 1,
-0.3491982, 0.4604889, -0.644033, 0, 1, 0.1529412, 1,
-0.3488767, -0.06758156, -1.009763, 0, 1, 0.1607843, 1,
-0.3454795, 0.9196806, -0.01681447, 0, 1, 0.1647059, 1,
-0.3453573, -0.2655864, -2.663105, 0, 1, 0.172549, 1,
-0.3431797, -1.062792, -1.974807, 0, 1, 0.1764706, 1,
-0.3378611, -0.1095904, -0.5479808, 0, 1, 0.1843137, 1,
-0.3332949, 0.125689, 0.8744243, 0, 1, 0.1882353, 1,
-0.3322859, -0.7146896, -3.061216, 0, 1, 0.1960784, 1,
-0.3317373, -0.3800569, -2.58026, 0, 1, 0.2039216, 1,
-0.3296584, -0.04285619, -2.910748, 0, 1, 0.2078431, 1,
-0.328612, -1.372813, -3.716572, 0, 1, 0.2156863, 1,
-0.3222595, -0.5903423, -4.550718, 0, 1, 0.2196078, 1,
-0.317723, -0.748035, -1.85791, 0, 1, 0.227451, 1,
-0.3162863, 1.177031, -0.5331754, 0, 1, 0.2313726, 1,
-0.3146018, -0.4671738, -2.16151, 0, 1, 0.2392157, 1,
-0.3135684, -0.1193397, -2.110276, 0, 1, 0.2431373, 1,
-0.3135594, -0.4326064, -2.017072, 0, 1, 0.2509804, 1,
-0.3132413, 0.2171089, -2.746244, 0, 1, 0.254902, 1,
-0.3119954, 0.767348, -1.403382, 0, 1, 0.2627451, 1,
-0.3118941, -0.8012148, -2.135865, 0, 1, 0.2666667, 1,
-0.3114028, -0.2116781, -3.491772, 0, 1, 0.2745098, 1,
-0.3105089, 0.0356185, -2.170858, 0, 1, 0.2784314, 1,
-0.3060394, -0.5936175, -1.791974, 0, 1, 0.2862745, 1,
-0.2997103, -0.4338591, -4.323387, 0, 1, 0.2901961, 1,
-0.2983741, 0.9007142, 0.1618934, 0, 1, 0.2980392, 1,
-0.2980732, 0.8603991, 0.432597, 0, 1, 0.3058824, 1,
-0.296545, 2.020924, 0.9046785, 0, 1, 0.3098039, 1,
-0.2940719, 0.2723211, -0.4503039, 0, 1, 0.3176471, 1,
-0.2929462, -0.405387, -1.383064, 0, 1, 0.3215686, 1,
-0.2901208, 2.981236, -0.3550972, 0, 1, 0.3294118, 1,
-0.287264, 0.2817189, -0.4037462, 0, 1, 0.3333333, 1,
-0.2860754, -0.4842553, -2.779864, 0, 1, 0.3411765, 1,
-0.2860228, -0.7108864, -4.796577, 0, 1, 0.345098, 1,
-0.2767219, 0.6893452, -0.04336189, 0, 1, 0.3529412, 1,
-0.2710032, -0.5083703, -1.83808, 0, 1, 0.3568628, 1,
-0.2695763, -0.4440992, -3.726202, 0, 1, 0.3647059, 1,
-0.2661247, 0.0987324, -2.367027, 0, 1, 0.3686275, 1,
-0.2650494, 1.803572, 0.5798337, 0, 1, 0.3764706, 1,
-0.2646393, 0.1254327, -1.391036, 0, 1, 0.3803922, 1,
-0.2605203, -0.8109949, -2.594114, 0, 1, 0.3882353, 1,
-0.2577661, -1.966263, -4.322435, 0, 1, 0.3921569, 1,
-0.2551296, 0.2976883, 0.1105688, 0, 1, 0.4, 1,
-0.2535541, 0.1135269, -2.39596, 0, 1, 0.4078431, 1,
-0.252827, 1.512566, 0.8416146, 0, 1, 0.4117647, 1,
-0.2496887, 0.6590585, -0.5684465, 0, 1, 0.4196078, 1,
-0.2490952, -2.922751, -3.380038, 0, 1, 0.4235294, 1,
-0.2452707, -0.4766179, -1.346135, 0, 1, 0.4313726, 1,
-0.2410649, -1.515269, -3.197575, 0, 1, 0.4352941, 1,
-0.2344709, -1.664362, -4.328652, 0, 1, 0.4431373, 1,
-0.2292525, 1.261953, 0.7966437, 0, 1, 0.4470588, 1,
-0.2290475, 1.92707, 0.1170225, 0, 1, 0.454902, 1,
-0.2289048, -0.2531235, -1.133601, 0, 1, 0.4588235, 1,
-0.2288517, 0.1880284, -2.549354, 0, 1, 0.4666667, 1,
-0.2272087, 0.02012951, -3.078081, 0, 1, 0.4705882, 1,
-0.2256373, -0.6693128, -1.782795, 0, 1, 0.4784314, 1,
-0.2214926, -2.012125, -5.07906, 0, 1, 0.4823529, 1,
-0.2169417, 1.073024, -1.897349, 0, 1, 0.4901961, 1,
-0.2155639, 1.499959, 1.297069, 0, 1, 0.4941176, 1,
-0.2047706, 1.095472, 0.04083516, 0, 1, 0.5019608, 1,
-0.1993364, -0.2064058, -2.238681, 0, 1, 0.509804, 1,
-0.1955479, -1.828273, -2.031236, 0, 1, 0.5137255, 1,
-0.1948565, 0.5405422, -1.101649, 0, 1, 0.5215687, 1,
-0.1916722, -0.1461502, -1.905756, 0, 1, 0.5254902, 1,
-0.1899843, -0.1655138, -2.54726, 0, 1, 0.5333334, 1,
-0.1896414, -1.312745, -2.039051, 0, 1, 0.5372549, 1,
-0.18908, 0.4637146, -0.2606494, 0, 1, 0.5450981, 1,
-0.1882722, 0.5963101, -2.545211, 0, 1, 0.5490196, 1,
-0.1821003, -0.3434284, -2.373143, 0, 1, 0.5568628, 1,
-0.1809167, -2.130996, -1.436964, 0, 1, 0.5607843, 1,
-0.1782578, -1.230743, -3.032797, 0, 1, 0.5686275, 1,
-0.1778349, -0.6393178, -2.247084, 0, 1, 0.572549, 1,
-0.1760969, -0.2483694, -1.920565, 0, 1, 0.5803922, 1,
-0.1751281, 0.957752, 0.8888483, 0, 1, 0.5843138, 1,
-0.1745183, 0.9070627, -0.4894706, 0, 1, 0.5921569, 1,
-0.1740881, -2.339359, -3.119941, 0, 1, 0.5960785, 1,
-0.1731898, -0.3271208, -1.547238, 0, 1, 0.6039216, 1,
-0.1706333, 0.8051324, -0.2423921, 0, 1, 0.6117647, 1,
-0.1704605, -0.000501541, -0.9715213, 0, 1, 0.6156863, 1,
-0.1662251, -2.202944, -3.759188, 0, 1, 0.6235294, 1,
-0.1660939, 0.9825976, 0.03941797, 0, 1, 0.627451, 1,
-0.1651027, 0.6093077, 1.114743, 0, 1, 0.6352941, 1,
-0.1638852, -0.7226126, -2.832326, 0, 1, 0.6392157, 1,
-0.1635838, -0.2615416, -1.56948, 0, 1, 0.6470588, 1,
-0.1630735, -1.069885, -2.481937, 0, 1, 0.6509804, 1,
-0.1601102, -1.8151, -3.490216, 0, 1, 0.6588235, 1,
-0.1566074, -0.5874851, -2.977017, 0, 1, 0.6627451, 1,
-0.1564628, -1.345493, -2.689062, 0, 1, 0.6705883, 1,
-0.1466652, 0.1883838, -3.054019, 0, 1, 0.6745098, 1,
-0.1391653, 1.016695, 0.2026972, 0, 1, 0.682353, 1,
-0.1386393, -1.003103, -2.902203, 0, 1, 0.6862745, 1,
-0.1327091, -0.7265341, -2.815345, 0, 1, 0.6941177, 1,
-0.1323071, -0.01516033, -1.783307, 0, 1, 0.7019608, 1,
-0.1316204, -0.2242149, -0.9625973, 0, 1, 0.7058824, 1,
-0.1296178, -0.2184231, -1.705465, 0, 1, 0.7137255, 1,
-0.1289719, -1.526999, -2.880124, 0, 1, 0.7176471, 1,
-0.1193424, -0.2514333, -2.252285, 0, 1, 0.7254902, 1,
-0.1173027, -0.385993, -3.121859, 0, 1, 0.7294118, 1,
-0.1160344, 1.549085, 0.499983, 0, 1, 0.7372549, 1,
-0.1149335, 0.1033994, -1.778575, 0, 1, 0.7411765, 1,
-0.112328, 0.4667421, -0.6816549, 0, 1, 0.7490196, 1,
-0.1118409, 0.8640165, 1.047452, 0, 1, 0.7529412, 1,
-0.1092529, -0.02995155, -1.787522, 0, 1, 0.7607843, 1,
-0.1082894, 1.008494, -0.8233977, 0, 1, 0.7647059, 1,
-0.1038675, 0.7028907, 0.04139607, 0, 1, 0.772549, 1,
-0.09982794, -0.7548587, -2.290588, 0, 1, 0.7764706, 1,
-0.09854387, 0.6415663, -0.6702075, 0, 1, 0.7843137, 1,
-0.09688061, 0.1427435, -0.7871988, 0, 1, 0.7882353, 1,
-0.09355357, 0.3639375, -0.08438173, 0, 1, 0.7960784, 1,
-0.08998868, 1.433133, -0.477705, 0, 1, 0.8039216, 1,
-0.0848402, -0.1713544, -4.438497, 0, 1, 0.8078431, 1,
-0.08255624, -0.5533859, -2.933939, 0, 1, 0.8156863, 1,
-0.08204219, -1.387332, -4.422635, 0, 1, 0.8196079, 1,
-0.07968019, 0.6958069, -0.6260785, 0, 1, 0.827451, 1,
-0.07357946, -0.9245275, -3.313687, 0, 1, 0.8313726, 1,
-0.07212713, 0.5071936, 0.9247276, 0, 1, 0.8392157, 1,
-0.0683348, -0.1911147, -1.866249, 0, 1, 0.8431373, 1,
-0.06779992, 0.8109941, -0.5553218, 0, 1, 0.8509804, 1,
-0.05868057, -0.007703901, -0.1615415, 0, 1, 0.854902, 1,
-0.05379972, -1.234455, -4.04761, 0, 1, 0.8627451, 1,
-0.0480286, -0.1248977, -3.347845, 0, 1, 0.8666667, 1,
-0.04693882, 0.3060814, -0.4459991, 0, 1, 0.8745098, 1,
-0.04581009, 0.86905, 0.8467141, 0, 1, 0.8784314, 1,
-0.04299187, 0.5172749, 0.8328962, 0, 1, 0.8862745, 1,
-0.03498875, -0.2119384, -1.856112, 0, 1, 0.8901961, 1,
-0.0332609, 0.9310396, -1.304382, 0, 1, 0.8980392, 1,
-0.0323115, 2.046063, -0.4021237, 0, 1, 0.9058824, 1,
-0.02660854, -1.290634, -3.586648, 0, 1, 0.9098039, 1,
-0.02651156, 0.4968659, 0.5325915, 0, 1, 0.9176471, 1,
-0.02301386, 0.4613981, -1.5191, 0, 1, 0.9215686, 1,
-0.02250627, 0.09046893, -0.5493237, 0, 1, 0.9294118, 1,
-0.02221806, 0.7751028, 0.6067659, 0, 1, 0.9333333, 1,
-0.02104904, -0.7704681, -3.3111, 0, 1, 0.9411765, 1,
-0.02031428, -1.600465, -3.286298, 0, 1, 0.945098, 1,
-0.01799576, 1.094579, -1.067448, 0, 1, 0.9529412, 1,
-0.00948518, -0.315921, -2.475254, 0, 1, 0.9568627, 1,
-0.003907318, -0.7035204, -3.167797, 0, 1, 0.9647059, 1,
-0.001234981, 0.1148967, 0.1368199, 0, 1, 0.9686275, 1,
-0.0007419401, -1.673093, -4.141994, 0, 1, 0.9764706, 1,
0.0116729, -0.3265091, 2.313403, 0, 1, 0.9803922, 1,
0.01507682, 1.299297, -0.1424535, 0, 1, 0.9882353, 1,
0.01863557, -0.6119698, 3.127518, 0, 1, 0.9921569, 1,
0.02084133, -0.3526217, 2.133347, 0, 1, 1, 1,
0.02138445, 0.4304625, -1.964305, 0, 0.9921569, 1, 1,
0.02885948, -1.604031, 1.171046, 0, 0.9882353, 1, 1,
0.03060586, 0.5561103, -0.07357153, 0, 0.9803922, 1, 1,
0.03128926, 0.8101891, -0.4606983, 0, 0.9764706, 1, 1,
0.03237849, 2.632681, -0.0423338, 0, 0.9686275, 1, 1,
0.03509018, 1.190217, 0.2805834, 0, 0.9647059, 1, 1,
0.03548758, -0.3209482, 1.080645, 0, 0.9568627, 1, 1,
0.03659371, 1.170813, 0.5344978, 0, 0.9529412, 1, 1,
0.0373587, 2.385483, 1.446194, 0, 0.945098, 1, 1,
0.04068724, -0.326334, 2.869568, 0, 0.9411765, 1, 1,
0.04223244, 0.6100917, 1.56347, 0, 0.9333333, 1, 1,
0.04469202, 1.281077, -0.5120497, 0, 0.9294118, 1, 1,
0.04685528, 1.200785, -2.432359, 0, 0.9215686, 1, 1,
0.05876602, 0.1498118, -0.6281705, 0, 0.9176471, 1, 1,
0.05881725, 0.8037561, 1.271466, 0, 0.9098039, 1, 1,
0.06074096, -0.223988, 3.280065, 0, 0.9058824, 1, 1,
0.06159265, 0.2614619, -1.27396, 0, 0.8980392, 1, 1,
0.06192639, 0.01069906, 2.367023, 0, 0.8901961, 1, 1,
0.06552002, 0.4557447, 0.6728227, 0, 0.8862745, 1, 1,
0.07132863, 1.170994, -0.1866842, 0, 0.8784314, 1, 1,
0.07375336, 0.2800556, 2.022634, 0, 0.8745098, 1, 1,
0.07541952, -0.07235464, 1.967425, 0, 0.8666667, 1, 1,
0.077215, 0.5259316, 2.380503, 0, 0.8627451, 1, 1,
0.08018513, 0.6458472, 0.2615856, 0, 0.854902, 1, 1,
0.08124936, 1.352489, 0.3474077, 0, 0.8509804, 1, 1,
0.08129925, -1.209406, 4.22967, 0, 0.8431373, 1, 1,
0.08138211, -1.262634, 2.336635, 0, 0.8392157, 1, 1,
0.08258882, 1.331926, -0.1315783, 0, 0.8313726, 1, 1,
0.08528966, -0.5954753, 3.88276, 0, 0.827451, 1, 1,
0.08987937, 0.2149715, 0.1761603, 0, 0.8196079, 1, 1,
0.09004103, 0.1858843, -0.1435841, 0, 0.8156863, 1, 1,
0.09155259, -0.7035477, 3.106094, 0, 0.8078431, 1, 1,
0.092417, -0.1966442, 3.201376, 0, 0.8039216, 1, 1,
0.0955262, 0.9129285, -1.429587, 0, 0.7960784, 1, 1,
0.09676772, 0.708957, 0.1008129, 0, 0.7882353, 1, 1,
0.09716736, 1.076311, -0.6854879, 0, 0.7843137, 1, 1,
0.09736132, -0.1348802, 2.218709, 0, 0.7764706, 1, 1,
0.1003536, -0.465599, 3.773813, 0, 0.772549, 1, 1,
0.1013441, 0.4888095, -1.262026, 0, 0.7647059, 1, 1,
0.101862, 0.2902813, 0.6055915, 0, 0.7607843, 1, 1,
0.1021002, -0.9196573, 3.372465, 0, 0.7529412, 1, 1,
0.1039311, 0.6870531, -0.06113379, 0, 0.7490196, 1, 1,
0.1048814, 1.271985, 0.5665602, 0, 0.7411765, 1, 1,
0.1051869, -0.290751, 1.698203, 0, 0.7372549, 1, 1,
0.1099294, 0.5140907, -1.77254, 0, 0.7294118, 1, 1,
0.1102084, -1.014384, 4.2514, 0, 0.7254902, 1, 1,
0.1124563, -1.019525, 3.438155, 0, 0.7176471, 1, 1,
0.121176, -0.6601643, 3.262755, 0, 0.7137255, 1, 1,
0.1250854, -0.8387824, 3.692643, 0, 0.7058824, 1, 1,
0.1276886, 1.527579, 0.07109184, 0, 0.6980392, 1, 1,
0.128833, 0.2999679, 0.6964232, 0, 0.6941177, 1, 1,
0.1294982, 1.309608, -0.6544427, 0, 0.6862745, 1, 1,
0.134199, 0.9731888, 0.8095021, 0, 0.682353, 1, 1,
0.1429006, -0.852026, 3.833143, 0, 0.6745098, 1, 1,
0.142964, -0.9171876, 3.210052, 0, 0.6705883, 1, 1,
0.1473025, 0.3161902, 1.382434, 0, 0.6627451, 1, 1,
0.1475047, -1.352124, 2.468869, 0, 0.6588235, 1, 1,
0.1480071, -0.1363901, 1.821756, 0, 0.6509804, 1, 1,
0.1503646, -0.6825658, 2.884023, 0, 0.6470588, 1, 1,
0.1540737, -0.4083093, 4.50642, 0, 0.6392157, 1, 1,
0.1557655, -1.029897, 2.992062, 0, 0.6352941, 1, 1,
0.1666718, 0.2590074, 0.5684566, 0, 0.627451, 1, 1,
0.173198, -0.1933925, 2.481344, 0, 0.6235294, 1, 1,
0.1736475, -1.008874, 2.729237, 0, 0.6156863, 1, 1,
0.1806279, -1.20252, 1.513203, 0, 0.6117647, 1, 1,
0.1815412, -1.989022, 3.926973, 0, 0.6039216, 1, 1,
0.1825586, 0.1557801, 0.8958507, 0, 0.5960785, 1, 1,
0.1859139, 1.395136, 0.5478078, 0, 0.5921569, 1, 1,
0.1866735, 0.5522377, -0.07667579, 0, 0.5843138, 1, 1,
0.1875835, -0.6960302, 4.202764, 0, 0.5803922, 1, 1,
0.187742, -0.06420399, 2.521105, 0, 0.572549, 1, 1,
0.1880506, 1.101423, -1.048547, 0, 0.5686275, 1, 1,
0.1883678, -1.05011, 3.987546, 0, 0.5607843, 1, 1,
0.1884451, 0.01933021, 1.30696, 0, 0.5568628, 1, 1,
0.1907395, -0.8309844, 1.085368, 0, 0.5490196, 1, 1,
0.1992632, 0.1826226, 1.460638, 0, 0.5450981, 1, 1,
0.1996302, 0.4986348, 0.5049716, 0, 0.5372549, 1, 1,
0.2084506, 0.4062009, 0.1079534, 0, 0.5333334, 1, 1,
0.2099166, -0.09221085, 2.439382, 0, 0.5254902, 1, 1,
0.2119283, 0.4597845, 0.3119403, 0, 0.5215687, 1, 1,
0.2150833, -0.3555413, 3.013086, 0, 0.5137255, 1, 1,
0.2201958, -1.487679, 2.229045, 0, 0.509804, 1, 1,
0.2234506, -1.257774, 2.595916, 0, 0.5019608, 1, 1,
0.2246569, -1.411733, 1.638289, 0, 0.4941176, 1, 1,
0.2262654, 0.4911991, -1.482656, 0, 0.4901961, 1, 1,
0.2276387, -2.221672, 3.012168, 0, 0.4823529, 1, 1,
0.2305872, -0.3565083, 2.586488, 0, 0.4784314, 1, 1,
0.2390387, -0.04881703, 1.423819, 0, 0.4705882, 1, 1,
0.2417236, 0.7031069, -0.100119, 0, 0.4666667, 1, 1,
0.2436165, 1.091169, -0.1321164, 0, 0.4588235, 1, 1,
0.2503807, 0.2477204, -0.3942703, 0, 0.454902, 1, 1,
0.2516443, 0.4348837, 1.162146, 0, 0.4470588, 1, 1,
0.2521095, -0.6820551, 1.663757, 0, 0.4431373, 1, 1,
0.2546922, -0.999271, 2.514634, 0, 0.4352941, 1, 1,
0.258486, 1.198077, 0.6402928, 0, 0.4313726, 1, 1,
0.2584869, 0.7383373, 0.6536819, 0, 0.4235294, 1, 1,
0.262835, 0.745243, 0.6366258, 0, 0.4196078, 1, 1,
0.2687387, 0.5878038, 0.7650028, 0, 0.4117647, 1, 1,
0.2730669, 0.5360744, -2.094043, 0, 0.4078431, 1, 1,
0.2827498, 0.1749293, -0.5440156, 0, 0.4, 1, 1,
0.2839122, -1.403332, 1.486463, 0, 0.3921569, 1, 1,
0.2863462, 1.748017, 0.5052804, 0, 0.3882353, 1, 1,
0.2878991, 1.748893, 0.4631507, 0, 0.3803922, 1, 1,
0.2906867, 1.477531, 0.5327719, 0, 0.3764706, 1, 1,
0.2918763, 1.186258, 0.3786643, 0, 0.3686275, 1, 1,
0.2951856, -2.123625, 3.461413, 0, 0.3647059, 1, 1,
0.2957646, -0.8036368, 3.551984, 0, 0.3568628, 1, 1,
0.2958033, 1.802352, 0.4266082, 0, 0.3529412, 1, 1,
0.2978509, 1.478932, -2.666003, 0, 0.345098, 1, 1,
0.3015113, 0.2790467, 0.8716609, 0, 0.3411765, 1, 1,
0.3024609, 1.904173, -0.1766734, 0, 0.3333333, 1, 1,
0.3067862, 0.5464427, 0.9877393, 0, 0.3294118, 1, 1,
0.3071144, -0.09153133, 2.502201, 0, 0.3215686, 1, 1,
0.3103511, -0.8774914, 2.327915, 0, 0.3176471, 1, 1,
0.311175, 0.912827, 0.2406142, 0, 0.3098039, 1, 1,
0.3120725, -1.053025, 2.062727, 0, 0.3058824, 1, 1,
0.3128206, 0.03425578, 1.185251, 0, 0.2980392, 1, 1,
0.3141992, -1.272935, 3.758641, 0, 0.2901961, 1, 1,
0.3186295, -0.8850302, 2.793875, 0, 0.2862745, 1, 1,
0.3192783, -0.5139444, 0.517642, 0, 0.2784314, 1, 1,
0.3212224, -0.1736474, 3.388342, 0, 0.2745098, 1, 1,
0.3226194, 0.2244129, -0.09772289, 0, 0.2666667, 1, 1,
0.3229483, -0.3080983, 2.380306, 0, 0.2627451, 1, 1,
0.3292584, 0.2821013, 0.4156791, 0, 0.254902, 1, 1,
0.3299895, -0.3946253, 2.135316, 0, 0.2509804, 1, 1,
0.3346264, -0.06263532, 1.708333, 0, 0.2431373, 1, 1,
0.3369355, 3.079665, -1.513803, 0, 0.2392157, 1, 1,
0.3437526, -0.5849054, 2.422069, 0, 0.2313726, 1, 1,
0.3460426, -0.4391152, 1.878392, 0, 0.227451, 1, 1,
0.3470613, -0.06152635, 2.743523, 0, 0.2196078, 1, 1,
0.347533, 1.134333, 0.6827505, 0, 0.2156863, 1, 1,
0.34856, 0.1157885, 3.322044, 0, 0.2078431, 1, 1,
0.3490587, 1.336442, 1.093728, 0, 0.2039216, 1, 1,
0.3498328, 0.6496527, -1.172614, 0, 0.1960784, 1, 1,
0.3628493, -0.226473, 0.697514, 0, 0.1882353, 1, 1,
0.3629173, 0.4690841, 1.434134, 0, 0.1843137, 1, 1,
0.3639026, -0.4112139, 1.772067, 0, 0.1764706, 1, 1,
0.3639893, 0.3557947, 1.57752, 0, 0.172549, 1, 1,
0.3641147, -0.3814125, 3.401141, 0, 0.1647059, 1, 1,
0.3682727, -0.3313876, 1.883015, 0, 0.1607843, 1, 1,
0.3699193, -0.6811665, 1.328581, 0, 0.1529412, 1, 1,
0.3704575, -0.4133492, 1.704032, 0, 0.1490196, 1, 1,
0.3767495, -0.4994759, 2.278692, 0, 0.1411765, 1, 1,
0.3795024, -0.2733648, 3.906764, 0, 0.1372549, 1, 1,
0.3811398, 0.6020937, 3.145483, 0, 0.1294118, 1, 1,
0.3835225, -1.477091, 3.323967, 0, 0.1254902, 1, 1,
0.3843209, 0.7812803, 0.6464964, 0, 0.1176471, 1, 1,
0.3845737, 1.245286, 0.9764167, 0, 0.1137255, 1, 1,
0.3878044, -1.280474, 3.701617, 0, 0.1058824, 1, 1,
0.3902893, 1.038462, 2.027071, 0, 0.09803922, 1, 1,
0.3916478, -0.6301047, 1.230847, 0, 0.09411765, 1, 1,
0.3929164, 0.2890075, 1.23788, 0, 0.08627451, 1, 1,
0.3945686, 0.310398, -0.5465221, 0, 0.08235294, 1, 1,
0.3952993, -1.474803, 1.339317, 0, 0.07450981, 1, 1,
0.39681, -0.817079, 2.092801, 0, 0.07058824, 1, 1,
0.3974977, 1.586507, 1.253127, 0, 0.0627451, 1, 1,
0.3997073, 0.07886188, -0.3894233, 0, 0.05882353, 1, 1,
0.4013611, 0.7306676, -0.9914212, 0, 0.05098039, 1, 1,
0.4088547, -0.787248, 1.704269, 0, 0.04705882, 1, 1,
0.4092396, -0.4889105, 3.757264, 0, 0.03921569, 1, 1,
0.4140201, -1.175655, 1.441083, 0, 0.03529412, 1, 1,
0.4158438, -0.380789, 2.883406, 0, 0.02745098, 1, 1,
0.4172786, 0.7300964, 0.05633127, 0, 0.02352941, 1, 1,
0.4236092, 0.7581112, 1.24631, 0, 0.01568628, 1, 1,
0.4280648, 1.417978, -0.03882232, 0, 0.01176471, 1, 1,
0.4296186, 0.125314, 3.714041, 0, 0.003921569, 1, 1,
0.4298577, 1.664886, -0.7526607, 0.003921569, 0, 1, 1,
0.4326295, 0.009383315, 1.484565, 0.007843138, 0, 1, 1,
0.4332103, -0.8467672, 2.722724, 0.01568628, 0, 1, 1,
0.4348248, -2.027751, 3.427099, 0.01960784, 0, 1, 1,
0.4400568, 1.458503, -0.862449, 0.02745098, 0, 1, 1,
0.444945, 0.7600857, 0.1098969, 0.03137255, 0, 1, 1,
0.4452551, -0.260958, 4.265812, 0.03921569, 0, 1, 1,
0.4465961, 1.765219, -1.622388, 0.04313726, 0, 1, 1,
0.4513493, 0.3969349, -0.6363776, 0.05098039, 0, 1, 1,
0.4515216, -0.02686726, 1.097923, 0.05490196, 0, 1, 1,
0.457658, -1.126321, 1.762555, 0.0627451, 0, 1, 1,
0.4581921, -1.20559, 2.472269, 0.06666667, 0, 1, 1,
0.4745808, 0.8893632, -1.504624, 0.07450981, 0, 1, 1,
0.4881938, 0.6949131, 1.421431, 0.07843138, 0, 1, 1,
0.491586, -1.645383, 3.267579, 0.08627451, 0, 1, 1,
0.4945515, -1.318784, 3.407923, 0.09019608, 0, 1, 1,
0.4963154, -0.6488531, 3.606519, 0.09803922, 0, 1, 1,
0.4978552, 0.9258783, 0.8098508, 0.1058824, 0, 1, 1,
0.5014388, -0.9073028, 4.329689, 0.1098039, 0, 1, 1,
0.5015057, 0.1913306, 2.178813, 0.1176471, 0, 1, 1,
0.5054179, 0.0287133, 0.9925854, 0.1215686, 0, 1, 1,
0.5059404, 0.4836166, 0.5317377, 0.1294118, 0, 1, 1,
0.5088955, -0.3651024, 0.9582334, 0.1333333, 0, 1, 1,
0.5094987, 0.9000831, 0.1318699, 0.1411765, 0, 1, 1,
0.5108096, 0.7724571, 0.5038404, 0.145098, 0, 1, 1,
0.5110196, -0.03347915, 1.389703, 0.1529412, 0, 1, 1,
0.5132299, -0.1067627, 0.8760728, 0.1568628, 0, 1, 1,
0.5136527, 0.6162857, -1.116313, 0.1647059, 0, 1, 1,
0.5156078, -1.145437, 2.545992, 0.1686275, 0, 1, 1,
0.522938, -0.673029, 5.986844, 0.1764706, 0, 1, 1,
0.5236382, 1.849157, 0.243878, 0.1803922, 0, 1, 1,
0.5282542, -0.195277, 2.226759, 0.1882353, 0, 1, 1,
0.5288857, 0.5275864, 1.15123, 0.1921569, 0, 1, 1,
0.5372619, -0.4650139, 2.905625, 0.2, 0, 1, 1,
0.538563, 1.669228, -1.001378, 0.2078431, 0, 1, 1,
0.5387714, 0.7093665, 0.3763579, 0.2117647, 0, 1, 1,
0.5389218, -0.5842816, 2.841294, 0.2196078, 0, 1, 1,
0.5389459, 0.2089441, -1.372096, 0.2235294, 0, 1, 1,
0.5413825, -0.273987, 2.205033, 0.2313726, 0, 1, 1,
0.5434905, -0.7383763, 3.30614, 0.2352941, 0, 1, 1,
0.5541129, 1.675783, -0.3499025, 0.2431373, 0, 1, 1,
0.5562006, 0.7838683, -0.08712996, 0.2470588, 0, 1, 1,
0.5616245, 0.4062854, 1.133899, 0.254902, 0, 1, 1,
0.569279, 1.547149, 1.064029, 0.2588235, 0, 1, 1,
0.5714914, 0.6695018, -0.1620002, 0.2666667, 0, 1, 1,
0.5724446, 0.9480237, -0.4362225, 0.2705882, 0, 1, 1,
0.57249, 1.177646, 1.63513, 0.2784314, 0, 1, 1,
0.574481, -1.146881, 5.76967, 0.282353, 0, 1, 1,
0.5749502, -0.1516851, 1.905011, 0.2901961, 0, 1, 1,
0.575797, -2.011122, 3.198707, 0.2941177, 0, 1, 1,
0.5761389, 0.3573375, 1.593582, 0.3019608, 0, 1, 1,
0.577756, 0.6754947, 0.6752999, 0.3098039, 0, 1, 1,
0.5782762, 1.460485, 0.3838592, 0.3137255, 0, 1, 1,
0.578362, -1.401311, 1.855721, 0.3215686, 0, 1, 1,
0.5786458, -0.4666218, 2.130818, 0.3254902, 0, 1, 1,
0.5790305, 0.671159, 1.551323, 0.3333333, 0, 1, 1,
0.5795096, 0.1410391, 0.9569471, 0.3372549, 0, 1, 1,
0.5797663, 2.128861, -2.051312, 0.345098, 0, 1, 1,
0.5841179, 0.9977029, 1.548218, 0.3490196, 0, 1, 1,
0.5843512, 0.1433049, 3.009179, 0.3568628, 0, 1, 1,
0.5863798, 0.1736836, 1.988063, 0.3607843, 0, 1, 1,
0.5873106, 1.028512, 0.9945096, 0.3686275, 0, 1, 1,
0.5886229, -0.8935723, 1.086668, 0.372549, 0, 1, 1,
0.5892926, -1.132943, 2.878919, 0.3803922, 0, 1, 1,
0.5938956, -0.3171769, 1.989496, 0.3843137, 0, 1, 1,
0.5971199, 1.560181, -1.090472, 0.3921569, 0, 1, 1,
0.600175, 0.226892, 0.5582054, 0.3960784, 0, 1, 1,
0.6002142, -0.04349717, 2.831353, 0.4039216, 0, 1, 1,
0.6005496, -0.884214, 1.818366, 0.4117647, 0, 1, 1,
0.6005812, 0.9488311, -1.275905, 0.4156863, 0, 1, 1,
0.6013865, -0.6876191, 3.204027, 0.4235294, 0, 1, 1,
0.6017014, 0.7210572, 0.06728372, 0.427451, 0, 1, 1,
0.6096097, -2.076321, 3.242669, 0.4352941, 0, 1, 1,
0.6098976, -0.1659692, 1.687567, 0.4392157, 0, 1, 1,
0.6155319, 0.4807575, 1.065804, 0.4470588, 0, 1, 1,
0.617247, -1.709546, 1.41731, 0.4509804, 0, 1, 1,
0.6203297, -0.07474368, 1.373517, 0.4588235, 0, 1, 1,
0.6324856, 1.149436, -1.895847, 0.4627451, 0, 1, 1,
0.6442065, -0.9257734, 2.777544, 0.4705882, 0, 1, 1,
0.6470862, -0.6200238, 0.6645086, 0.4745098, 0, 1, 1,
0.6477941, 0.3390385, 1.34062, 0.4823529, 0, 1, 1,
0.6532273, 1.704449, 1.519583, 0.4862745, 0, 1, 1,
0.6551151, -0.07830308, 1.048971, 0.4941176, 0, 1, 1,
0.6571146, 0.5598246, -0.1843136, 0.5019608, 0, 1, 1,
0.6610714, 0.811762, -0.9464484, 0.5058824, 0, 1, 1,
0.6616062, 0.5479241, 2.348231, 0.5137255, 0, 1, 1,
0.6697066, 0.3106128, 1.487816, 0.5176471, 0, 1, 1,
0.6702933, -0.5054753, 1.331694, 0.5254902, 0, 1, 1,
0.6719298, 0.5850595, 0.242313, 0.5294118, 0, 1, 1,
0.6851306, -0.804561, 1.410622, 0.5372549, 0, 1, 1,
0.6885906, -0.9055592, 3.56589, 0.5411765, 0, 1, 1,
0.6986718, 0.8972247, -0.01397913, 0.5490196, 0, 1, 1,
0.7083414, 0.4129117, 2.302538, 0.5529412, 0, 1, 1,
0.7088341, -1.061553, 1.992722, 0.5607843, 0, 1, 1,
0.7094044, 0.4834209, 0.2441982, 0.5647059, 0, 1, 1,
0.7095603, 1.645679, 0.8728883, 0.572549, 0, 1, 1,
0.7121874, -0.5890034, 2.193856, 0.5764706, 0, 1, 1,
0.7168591, -0.5841582, 1.972355, 0.5843138, 0, 1, 1,
0.7190014, 1.059722, -0.3996955, 0.5882353, 0, 1, 1,
0.7195514, 0.2793862, 1.810816, 0.5960785, 0, 1, 1,
0.7199022, -0.3934538, 1.668129, 0.6039216, 0, 1, 1,
0.7202349, -1.585394, 2.800894, 0.6078432, 0, 1, 1,
0.7224612, -0.6847983, 2.681728, 0.6156863, 0, 1, 1,
0.7233859, 0.06002917, 0.7165474, 0.6196079, 0, 1, 1,
0.7264655, -3.327395, 1.97685, 0.627451, 0, 1, 1,
0.7281319, 0.6084129, 1.971968, 0.6313726, 0, 1, 1,
0.7363867, 1.537642, 0.9627438, 0.6392157, 0, 1, 1,
0.7384018, 1.50277, -0.01973792, 0.6431373, 0, 1, 1,
0.7403437, 0.8237067, 1.488236, 0.6509804, 0, 1, 1,
0.7415665, 0.187498, 0.1267338, 0.654902, 0, 1, 1,
0.7489207, 0.8628269, 0.5585923, 0.6627451, 0, 1, 1,
0.7521182, 1.616099, 0.7660189, 0.6666667, 0, 1, 1,
0.7522443, -1.488679, 2.877413, 0.6745098, 0, 1, 1,
0.7684591, 0.1070944, 2.280518, 0.6784314, 0, 1, 1,
0.7687902, -0.3811324, 2.208987, 0.6862745, 0, 1, 1,
0.7705807, -0.2359685, 2.224292, 0.6901961, 0, 1, 1,
0.7783914, -0.120942, 1.062899, 0.6980392, 0, 1, 1,
0.7786922, -0.3971339, 2.261317, 0.7058824, 0, 1, 1,
0.7837719, -0.4750234, 1.213725, 0.7098039, 0, 1, 1,
0.7843274, 0.2858451, 0.4749418, 0.7176471, 0, 1, 1,
0.785067, -1.006875, 2.991536, 0.7215686, 0, 1, 1,
0.7872247, -0.4648809, 1.090074, 0.7294118, 0, 1, 1,
0.7891243, 0.547821, -0.2444577, 0.7333333, 0, 1, 1,
0.7903506, 0.3705411, 2.474735, 0.7411765, 0, 1, 1,
0.7903823, 1.584109, 2.567769, 0.7450981, 0, 1, 1,
0.7928482, -1.57313, 4.021377, 0.7529412, 0, 1, 1,
0.7980959, 0.9460659, 1.131635, 0.7568628, 0, 1, 1,
0.7986999, 0.7899734, 0.6728936, 0.7647059, 0, 1, 1,
0.8038729, 0.1349791, 2.861725, 0.7686275, 0, 1, 1,
0.8064259, -0.7516791, 3.321361, 0.7764706, 0, 1, 1,
0.8095363, 0.4198595, 1.199235, 0.7803922, 0, 1, 1,
0.8095775, -0.5200449, 2.234401, 0.7882353, 0, 1, 1,
0.8115667, 0.2169801, 0.9214801, 0.7921569, 0, 1, 1,
0.8163566, 1.663991, 0.09418034, 0.8, 0, 1, 1,
0.8165845, 1.39036, -0.3867904, 0.8078431, 0, 1, 1,
0.8230388, 1.399161, -0.07436881, 0.8117647, 0, 1, 1,
0.8247887, -1.690332, 3.84956, 0.8196079, 0, 1, 1,
0.8312308, -1.106469, 1.259226, 0.8235294, 0, 1, 1,
0.8318781, 0.003628693, 1.162059, 0.8313726, 0, 1, 1,
0.8399358, -0.007077782, 1.102908, 0.8352941, 0, 1, 1,
0.8432635, 2.385996, -0.8797645, 0.8431373, 0, 1, 1,
0.8452734, -1.68226, 2.154514, 0.8470588, 0, 1, 1,
0.8566474, -1.442763, 1.878478, 0.854902, 0, 1, 1,
0.8624508, -0.4867129, 1.630875, 0.8588235, 0, 1, 1,
0.8670623, -0.7007896, 2.60189, 0.8666667, 0, 1, 1,
0.8702132, 0.7297008, 1.258829, 0.8705882, 0, 1, 1,
0.874329, 0.01733976, 1.136181, 0.8784314, 0, 1, 1,
0.8861701, -1.463005, 2.97909, 0.8823529, 0, 1, 1,
0.8966231, 0.9138928, 0.6208794, 0.8901961, 0, 1, 1,
0.8992991, 1.558913, 0.1566954, 0.8941177, 0, 1, 1,
0.9006856, 0.4865491, -0.529815, 0.9019608, 0, 1, 1,
0.9027768, 0.5321705, 0.243553, 0.9098039, 0, 1, 1,
0.9030145, -0.4053002, 2.562249, 0.9137255, 0, 1, 1,
0.909252, -0.1320029, 1.670467, 0.9215686, 0, 1, 1,
0.9120799, -1.967238, 3.62439, 0.9254902, 0, 1, 1,
0.9146202, -0.03331207, 0.3224386, 0.9333333, 0, 1, 1,
0.9222451, -1.245751, 1.293596, 0.9372549, 0, 1, 1,
0.9283313, 0.1814242, 0.9884042, 0.945098, 0, 1, 1,
0.9332777, 0.320484, 1.456904, 0.9490196, 0, 1, 1,
0.9373648, 0.01569278, 0.0781085, 0.9568627, 0, 1, 1,
0.9379179, -1.844467, 2.31908, 0.9607843, 0, 1, 1,
0.9395558, -0.2120716, 2.170276, 0.9686275, 0, 1, 1,
0.9432711, -0.5531801, 2.240067, 0.972549, 0, 1, 1,
0.9522704, 0.2013361, 1.196032, 0.9803922, 0, 1, 1,
0.9544843, 0.04611435, -0.2815829, 0.9843137, 0, 1, 1,
0.9615912, 1.644393, 1.471227, 0.9921569, 0, 1, 1,
0.9635879, -0.9620069, 1.915937, 0.9960784, 0, 1, 1,
0.9639155, -0.3669889, 2.569654, 1, 0, 0.9960784, 1,
0.9654274, -1.038025, 3.805763, 1, 0, 0.9882353, 1,
0.9735227, 0.7162929, 1.094666, 1, 0, 0.9843137, 1,
0.9890615, -0.669929, 3.539333, 1, 0, 0.9764706, 1,
0.9917246, -0.9541621, 3.345685, 1, 0, 0.972549, 1,
0.992145, -0.3065762, 1.840457, 1, 0, 0.9647059, 1,
0.9988744, 0.01834668, -0.1638598, 1, 0, 0.9607843, 1,
1.007908, -0.5125594, 2.967971, 1, 0, 0.9529412, 1,
1.008437, 1.962636, 1.012169, 1, 0, 0.9490196, 1,
1.009336, 0.7168072, 0.6462315, 1, 0, 0.9411765, 1,
1.019872, 1.721551, 0.1115197, 1, 0, 0.9372549, 1,
1.022237, -0.88885, 2.377144, 1, 0, 0.9294118, 1,
1.029375, 0.04837515, 2.057917, 1, 0, 0.9254902, 1,
1.051118, 2.100129, 0.4223858, 1, 0, 0.9176471, 1,
1.052647, -0.9156454, 1.01777, 1, 0, 0.9137255, 1,
1.068223, -0.9063566, 0.364946, 1, 0, 0.9058824, 1,
1.06857, 0.4449224, -0.07573645, 1, 0, 0.9019608, 1,
1.084502, 2.133446, 1.396988, 1, 0, 0.8941177, 1,
1.095125, -0.3812568, 0.06305882, 1, 0, 0.8862745, 1,
1.095998, 1.552153, -0.08459844, 1, 0, 0.8823529, 1,
1.112896, 0.7764481, 0.1019324, 1, 0, 0.8745098, 1,
1.116485, -0.3063352, 1.907875, 1, 0, 0.8705882, 1,
1.116586, 0.3274229, 0.8506886, 1, 0, 0.8627451, 1,
1.120054, 1.070901, -0.2558595, 1, 0, 0.8588235, 1,
1.121201, -2.116494, 3.052078, 1, 0, 0.8509804, 1,
1.132758, -2.093507, 1.643526, 1, 0, 0.8470588, 1,
1.136469, 0.531503, 0.9392611, 1, 0, 0.8392157, 1,
1.136724, -0.06865124, 0.4944803, 1, 0, 0.8352941, 1,
1.139224, 0.8112116, 0.695566, 1, 0, 0.827451, 1,
1.139368, 0.6131179, 1.287477, 1, 0, 0.8235294, 1,
1.140432, -0.4143392, 2.10701, 1, 0, 0.8156863, 1,
1.141147, 2.374325, 0.2917176, 1, 0, 0.8117647, 1,
1.151928, -0.1427471, 2.721162, 1, 0, 0.8039216, 1,
1.154848, 0.9906988, -0.2449459, 1, 0, 0.7960784, 1,
1.156898, -0.8833376, 1.61484, 1, 0, 0.7921569, 1,
1.157868, 1.182223, 0.2878444, 1, 0, 0.7843137, 1,
1.159297, -0.04340892, 2.656759, 1, 0, 0.7803922, 1,
1.161362, 0.06983995, 1.030147, 1, 0, 0.772549, 1,
1.16175, 0.2002854, 1.007674, 1, 0, 0.7686275, 1,
1.162711, 0.4936339, 0.5734609, 1, 0, 0.7607843, 1,
1.172868, -0.7390405, 2.030722, 1, 0, 0.7568628, 1,
1.175275, -1.48753, 2.637327, 1, 0, 0.7490196, 1,
1.198755, 0.3311754, 1.49028, 1, 0, 0.7450981, 1,
1.204844, 1.624176, 0.5631754, 1, 0, 0.7372549, 1,
1.205178, 1.300012, -0.1459092, 1, 0, 0.7333333, 1,
1.219219, 0.4382626, 0.4895387, 1, 0, 0.7254902, 1,
1.21967, -0.4952707, 2.446589, 1, 0, 0.7215686, 1,
1.222234, -0.6917419, 2.400698, 1, 0, 0.7137255, 1,
1.225817, -1.200459, 1.98441, 1, 0, 0.7098039, 1,
1.23225, 0.2151643, 4.097059, 1, 0, 0.7019608, 1,
1.233286, 0.9838032, 2.053065, 1, 0, 0.6941177, 1,
1.234704, -0.5451975, 1.947077, 1, 0, 0.6901961, 1,
1.277712, -1.364253, 2.168046, 1, 0, 0.682353, 1,
1.281195, -1.513023, 1.697798, 1, 0, 0.6784314, 1,
1.283741, 0.1453292, 1.013797, 1, 0, 0.6705883, 1,
1.290905, 1.091452, 0.2291027, 1, 0, 0.6666667, 1,
1.292199, -0.05586736, 0.3112933, 1, 0, 0.6588235, 1,
1.29827, 3.241384, 0.847214, 1, 0, 0.654902, 1,
1.300442, 0.2251032, 0.04530512, 1, 0, 0.6470588, 1,
1.30101, 1.792749, 2.423155, 1, 0, 0.6431373, 1,
1.302572, 1.430386, -0.001708632, 1, 0, 0.6352941, 1,
1.306499, 0.3762392, 1.702386, 1, 0, 0.6313726, 1,
1.312703, 0.09738269, 2.109905, 1, 0, 0.6235294, 1,
1.317072, 1.152896, 0.1343304, 1, 0, 0.6196079, 1,
1.317845, 1.43916, -0.5975588, 1, 0, 0.6117647, 1,
1.321035, -0.3821071, 0.08902608, 1, 0, 0.6078432, 1,
1.329599, 0.8824837, 1.058171, 1, 0, 0.6, 1,
1.32964, 0.8113689, 2.214495, 1, 0, 0.5921569, 1,
1.332798, -0.9548775, 3.106806, 1, 0, 0.5882353, 1,
1.33428, 1.612697, 1.265742, 1, 0, 0.5803922, 1,
1.34535, -0.7291163, 0.9099087, 1, 0, 0.5764706, 1,
1.348541, 0.7542671, -0.2769963, 1, 0, 0.5686275, 1,
1.350116, -0.6291727, 2.174834, 1, 0, 0.5647059, 1,
1.371735, 0.1894337, 0.06379959, 1, 0, 0.5568628, 1,
1.372702, 2.663644, 0.2592354, 1, 0, 0.5529412, 1,
1.38048, 0.6421359, -0.4819378, 1, 0, 0.5450981, 1,
1.383121, -0.1521882, 1.667413, 1, 0, 0.5411765, 1,
1.396314, 0.7224104, 0.07405777, 1, 0, 0.5333334, 1,
1.40205, 1.385999, 1.050562, 1, 0, 0.5294118, 1,
1.403287, -0.9792101, 1.664554, 1, 0, 0.5215687, 1,
1.403497, -1.202824, 3.080405, 1, 0, 0.5176471, 1,
1.4062, -0.5163563, 1.798087, 1, 0, 0.509804, 1,
1.407359, -0.7287236, 2.185726, 1, 0, 0.5058824, 1,
1.407543, -0.411086, 2.773561, 1, 0, 0.4980392, 1,
1.408282, 0.4331806, 2.145019, 1, 0, 0.4901961, 1,
1.423341, 1.252758, 0.1336426, 1, 0, 0.4862745, 1,
1.424974, 0.03555587, 0.02301607, 1, 0, 0.4784314, 1,
1.440189, -0.4473104, 2.958495, 1, 0, 0.4745098, 1,
1.441729, -0.7876541, 1.092909, 1, 0, 0.4666667, 1,
1.448349, 0.1346872, 0.6111493, 1, 0, 0.4627451, 1,
1.450971, -1.018045, 2.084996, 1, 0, 0.454902, 1,
1.453279, 0.5578958, 1.258219, 1, 0, 0.4509804, 1,
1.465392, -0.2558477, 2.121924, 1, 0, 0.4431373, 1,
1.466369, -0.02546331, 1.364357, 1, 0, 0.4392157, 1,
1.46645, 1.440888, 2.455278, 1, 0, 0.4313726, 1,
1.473782, -0.2097474, 1.254653, 1, 0, 0.427451, 1,
1.473804, -0.6360939, 2.26603, 1, 0, 0.4196078, 1,
1.48007, 1.153256, 0.5503812, 1, 0, 0.4156863, 1,
1.485778, 1.323802, 1.191294, 1, 0, 0.4078431, 1,
1.486559, 0.754885, 0.003870089, 1, 0, 0.4039216, 1,
1.498877, -0.6796573, 3.536537, 1, 0, 0.3960784, 1,
1.507926, -1.23296, 3.394618, 1, 0, 0.3882353, 1,
1.511701, -0.9047126, 0.02779792, 1, 0, 0.3843137, 1,
1.513898, -1.209655, 3.120402, 1, 0, 0.3764706, 1,
1.531638, 0.3425914, 2.190734, 1, 0, 0.372549, 1,
1.534639, 2.012042, 1.486788, 1, 0, 0.3647059, 1,
1.549984, 1.300889, 1.167822, 1, 0, 0.3607843, 1,
1.574693, -1.510138, 2.215361, 1, 0, 0.3529412, 1,
1.640044, 0.9660036, 1.109397, 1, 0, 0.3490196, 1,
1.642016, -0.1619006, 0.8160763, 1, 0, 0.3411765, 1,
1.652287, 0.809037, 2.846784, 1, 0, 0.3372549, 1,
1.663501, -0.6199715, 3.793539, 1, 0, 0.3294118, 1,
1.668295, -0.9708748, 3.217463, 1, 0, 0.3254902, 1,
1.668453, 0.4770181, 0.0416946, 1, 0, 0.3176471, 1,
1.679663, 1.391452, 1.315947, 1, 0, 0.3137255, 1,
1.708529, 1.953249, 1.185032, 1, 0, 0.3058824, 1,
1.711256, -1.729472, 2.794773, 1, 0, 0.2980392, 1,
1.711849, 1.99457, 1.644294, 1, 0, 0.2941177, 1,
1.713452, -0.04521222, 1.871819, 1, 0, 0.2862745, 1,
1.747356, 0.823948, 1.661972, 1, 0, 0.282353, 1,
1.749826, -0.5019946, 3.006913, 1, 0, 0.2745098, 1,
1.755598, 0.01387346, 2.301903, 1, 0, 0.2705882, 1,
1.785009, -1.00582, 0.5722353, 1, 0, 0.2627451, 1,
1.788252, 0.6088809, 0.2470368, 1, 0, 0.2588235, 1,
1.813451, -0.5264636, 1.89226, 1, 0, 0.2509804, 1,
1.829365, -0.3833525, 2.961037, 1, 0, 0.2470588, 1,
1.84551, 1.96217, -0.04214885, 1, 0, 0.2392157, 1,
1.854945, -0.1467875, 1.214794, 1, 0, 0.2352941, 1,
1.869723, 0.0121942, 1.513882, 1, 0, 0.227451, 1,
1.885687, 1.613392, -0.1302319, 1, 0, 0.2235294, 1,
1.886552, -1.060235, 2.427915, 1, 0, 0.2156863, 1,
1.890925, -0.6114853, 3.577516, 1, 0, 0.2117647, 1,
1.892104, -0.3484286, 2.938743, 1, 0, 0.2039216, 1,
1.902139, 1.284576, 3.350038, 1, 0, 0.1960784, 1,
1.903839, 1.304314, 1.978298, 1, 0, 0.1921569, 1,
1.905315, 1.911115, 1.113365, 1, 0, 0.1843137, 1,
1.912655, 1.501986, 2.505936, 1, 0, 0.1803922, 1,
1.914813, 2.781692, -0.8537775, 1, 0, 0.172549, 1,
1.926311, 0.1457926, 2.872948, 1, 0, 0.1686275, 1,
1.961837, -1.265246, 2.257303, 1, 0, 0.1607843, 1,
1.964626, 1.164989, -2.262049, 1, 0, 0.1568628, 1,
1.968891, -0.5067825, 2.172358, 1, 0, 0.1490196, 1,
2.012304, -0.5261293, 2.805659, 1, 0, 0.145098, 1,
2.03623, -0.6238615, 0.4335451, 1, 0, 0.1372549, 1,
2.041246, -0.8342766, 2.75088, 1, 0, 0.1333333, 1,
2.099745, -0.04133605, 1.999233, 1, 0, 0.1254902, 1,
2.129481, -0.8792888, 3.371735, 1, 0, 0.1215686, 1,
2.138533, 0.1134493, 3.736248, 1, 0, 0.1137255, 1,
2.141276, 0.2570008, 2.602576, 1, 0, 0.1098039, 1,
2.171157, -2.211559, 3.416421, 1, 0, 0.1019608, 1,
2.174885, -1.284437, 3.024222, 1, 0, 0.09411765, 1,
2.1752, -2.012685, 3.829062, 1, 0, 0.09019608, 1,
2.186749, -1.97817, 3.263179, 1, 0, 0.08235294, 1,
2.199748, 1.600757, 1.558695, 1, 0, 0.07843138, 1,
2.256507, -0.7189884, 0.7177775, 1, 0, 0.07058824, 1,
2.316738, 0.4354905, 1.104542, 1, 0, 0.06666667, 1,
2.382019, 1.215525, 0.2918274, 1, 0, 0.05882353, 1,
2.478313, 0.6315325, 3.325929, 1, 0, 0.05490196, 1,
2.577058, 0.9470453, 0.5622363, 1, 0, 0.04705882, 1,
2.608027, 0.6276395, 1.560331, 1, 0, 0.04313726, 1,
2.693957, -1.402755, 3.069601, 1, 0, 0.03529412, 1,
2.753976, 0.8238803, 1.93809, 1, 0, 0.03137255, 1,
2.965436, -0.03628815, 0.1415458, 1, 0, 0.02352941, 1,
3.084966, -1.999787, 3.869443, 1, 0, 0.01960784, 1,
3.125419, -0.6073621, 0.2296945, 1, 0, 0.01176471, 1,
3.682414, 1.508668, 1.23358, 1, 0, 0.007843138, 1
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
0.2567292, -4.440803, -6.954731, 0, -0.5, 0.5, 0.5,
0.2567292, -4.440803, -6.954731, 1, -0.5, 0.5, 0.5,
0.2567292, -4.440803, -6.954731, 1, 1.5, 0.5, 0.5,
0.2567292, -4.440803, -6.954731, 0, 1.5, 0.5, 0.5
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
-4.330263, -0.04300582, -6.954731, 0, -0.5, 0.5, 0.5,
-4.330263, -0.04300582, -6.954731, 1, -0.5, 0.5, 0.5,
-4.330263, -0.04300582, -6.954731, 1, 1.5, 0.5, 0.5,
-4.330263, -0.04300582, -6.954731, 0, 1.5, 0.5, 0.5
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
-4.330263, -4.440803, 0.4538918, 0, -0.5, 0.5, 0.5,
-4.330263, -4.440803, 0.4538918, 1, -0.5, 0.5, 0.5,
-4.330263, -4.440803, 0.4538918, 1, 1.5, 0.5, 0.5,
-4.330263, -4.440803, 0.4538918, 0, 1.5, 0.5, 0.5
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
-3, -3.425927, -5.245049,
3, -3.425927, -5.245049,
-3, -3.425927, -5.245049,
-3, -3.595073, -5.529995,
-2, -3.425927, -5.245049,
-2, -3.595073, -5.529995,
-1, -3.425927, -5.245049,
-1, -3.595073, -5.529995,
0, -3.425927, -5.245049,
0, -3.595073, -5.529995,
1, -3.425927, -5.245049,
1, -3.595073, -5.529995,
2, -3.425927, -5.245049,
2, -3.595073, -5.529995,
3, -3.425927, -5.245049,
3, -3.595073, -5.529995
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
-3, -3.933365, -6.09989, 0, -0.5, 0.5, 0.5,
-3, -3.933365, -6.09989, 1, -0.5, 0.5, 0.5,
-3, -3.933365, -6.09989, 1, 1.5, 0.5, 0.5,
-3, -3.933365, -6.09989, 0, 1.5, 0.5, 0.5,
-2, -3.933365, -6.09989, 0, -0.5, 0.5, 0.5,
-2, -3.933365, -6.09989, 1, -0.5, 0.5, 0.5,
-2, -3.933365, -6.09989, 1, 1.5, 0.5, 0.5,
-2, -3.933365, -6.09989, 0, 1.5, 0.5, 0.5,
-1, -3.933365, -6.09989, 0, -0.5, 0.5, 0.5,
-1, -3.933365, -6.09989, 1, -0.5, 0.5, 0.5,
-1, -3.933365, -6.09989, 1, 1.5, 0.5, 0.5,
-1, -3.933365, -6.09989, 0, 1.5, 0.5, 0.5,
0, -3.933365, -6.09989, 0, -0.5, 0.5, 0.5,
0, -3.933365, -6.09989, 1, -0.5, 0.5, 0.5,
0, -3.933365, -6.09989, 1, 1.5, 0.5, 0.5,
0, -3.933365, -6.09989, 0, 1.5, 0.5, 0.5,
1, -3.933365, -6.09989, 0, -0.5, 0.5, 0.5,
1, -3.933365, -6.09989, 1, -0.5, 0.5, 0.5,
1, -3.933365, -6.09989, 1, 1.5, 0.5, 0.5,
1, -3.933365, -6.09989, 0, 1.5, 0.5, 0.5,
2, -3.933365, -6.09989, 0, -0.5, 0.5, 0.5,
2, -3.933365, -6.09989, 1, -0.5, 0.5, 0.5,
2, -3.933365, -6.09989, 1, 1.5, 0.5, 0.5,
2, -3.933365, -6.09989, 0, 1.5, 0.5, 0.5,
3, -3.933365, -6.09989, 0, -0.5, 0.5, 0.5,
3, -3.933365, -6.09989, 1, -0.5, 0.5, 0.5,
3, -3.933365, -6.09989, 1, 1.5, 0.5, 0.5,
3, -3.933365, -6.09989, 0, 1.5, 0.5, 0.5
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
-3.271726, -3, -5.245049,
-3.271726, 3, -5.245049,
-3.271726, -3, -5.245049,
-3.448149, -3, -5.529995,
-3.271726, -2, -5.245049,
-3.448149, -2, -5.529995,
-3.271726, -1, -5.245049,
-3.448149, -1, -5.529995,
-3.271726, 0, -5.245049,
-3.448149, 0, -5.529995,
-3.271726, 1, -5.245049,
-3.448149, 1, -5.529995,
-3.271726, 2, -5.245049,
-3.448149, 2, -5.529995,
-3.271726, 3, -5.245049,
-3.448149, 3, -5.529995
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
-3.800995, -3, -6.09989, 0, -0.5, 0.5, 0.5,
-3.800995, -3, -6.09989, 1, -0.5, 0.5, 0.5,
-3.800995, -3, -6.09989, 1, 1.5, 0.5, 0.5,
-3.800995, -3, -6.09989, 0, 1.5, 0.5, 0.5,
-3.800995, -2, -6.09989, 0, -0.5, 0.5, 0.5,
-3.800995, -2, -6.09989, 1, -0.5, 0.5, 0.5,
-3.800995, -2, -6.09989, 1, 1.5, 0.5, 0.5,
-3.800995, -2, -6.09989, 0, 1.5, 0.5, 0.5,
-3.800995, -1, -6.09989, 0, -0.5, 0.5, 0.5,
-3.800995, -1, -6.09989, 1, -0.5, 0.5, 0.5,
-3.800995, -1, -6.09989, 1, 1.5, 0.5, 0.5,
-3.800995, -1, -6.09989, 0, 1.5, 0.5, 0.5,
-3.800995, 0, -6.09989, 0, -0.5, 0.5, 0.5,
-3.800995, 0, -6.09989, 1, -0.5, 0.5, 0.5,
-3.800995, 0, -6.09989, 1, 1.5, 0.5, 0.5,
-3.800995, 0, -6.09989, 0, 1.5, 0.5, 0.5,
-3.800995, 1, -6.09989, 0, -0.5, 0.5, 0.5,
-3.800995, 1, -6.09989, 1, -0.5, 0.5, 0.5,
-3.800995, 1, -6.09989, 1, 1.5, 0.5, 0.5,
-3.800995, 1, -6.09989, 0, 1.5, 0.5, 0.5,
-3.800995, 2, -6.09989, 0, -0.5, 0.5, 0.5,
-3.800995, 2, -6.09989, 1, -0.5, 0.5, 0.5,
-3.800995, 2, -6.09989, 1, 1.5, 0.5, 0.5,
-3.800995, 2, -6.09989, 0, 1.5, 0.5, 0.5,
-3.800995, 3, -6.09989, 0, -0.5, 0.5, 0.5,
-3.800995, 3, -6.09989, 1, -0.5, 0.5, 0.5,
-3.800995, 3, -6.09989, 1, 1.5, 0.5, 0.5,
-3.800995, 3, -6.09989, 0, 1.5, 0.5, 0.5
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
-3.271726, -3.425927, -4,
-3.271726, -3.425927, 4,
-3.271726, -3.425927, -4,
-3.448149, -3.595073, -4,
-3.271726, -3.425927, -2,
-3.448149, -3.595073, -2,
-3.271726, -3.425927, 0,
-3.448149, -3.595073, 0,
-3.271726, -3.425927, 2,
-3.448149, -3.595073, 2,
-3.271726, -3.425927, 4,
-3.448149, -3.595073, 4
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
-3.800995, -3.933365, -4, 0, -0.5, 0.5, 0.5,
-3.800995, -3.933365, -4, 1, -0.5, 0.5, 0.5,
-3.800995, -3.933365, -4, 1, 1.5, 0.5, 0.5,
-3.800995, -3.933365, -4, 0, 1.5, 0.5, 0.5,
-3.800995, -3.933365, -2, 0, -0.5, 0.5, 0.5,
-3.800995, -3.933365, -2, 1, -0.5, 0.5, 0.5,
-3.800995, -3.933365, -2, 1, 1.5, 0.5, 0.5,
-3.800995, -3.933365, -2, 0, 1.5, 0.5, 0.5,
-3.800995, -3.933365, 0, 0, -0.5, 0.5, 0.5,
-3.800995, -3.933365, 0, 1, -0.5, 0.5, 0.5,
-3.800995, -3.933365, 0, 1, 1.5, 0.5, 0.5,
-3.800995, -3.933365, 0, 0, 1.5, 0.5, 0.5,
-3.800995, -3.933365, 2, 0, -0.5, 0.5, 0.5,
-3.800995, -3.933365, 2, 1, -0.5, 0.5, 0.5,
-3.800995, -3.933365, 2, 1, 1.5, 0.5, 0.5,
-3.800995, -3.933365, 2, 0, 1.5, 0.5, 0.5,
-3.800995, -3.933365, 4, 0, -0.5, 0.5, 0.5,
-3.800995, -3.933365, 4, 1, -0.5, 0.5, 0.5,
-3.800995, -3.933365, 4, 1, 1.5, 0.5, 0.5,
-3.800995, -3.933365, 4, 0, 1.5, 0.5, 0.5
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
-3.271726, -3.425927, -5.245049,
-3.271726, 3.339915, -5.245049,
-3.271726, -3.425927, 6.152832,
-3.271726, 3.339915, 6.152832,
-3.271726, -3.425927, -5.245049,
-3.271726, -3.425927, 6.152832,
-3.271726, 3.339915, -5.245049,
-3.271726, 3.339915, 6.152832,
-3.271726, -3.425927, -5.245049,
3.785185, -3.425927, -5.245049,
-3.271726, -3.425927, 6.152832,
3.785185, -3.425927, 6.152832,
-3.271726, 3.339915, -5.245049,
3.785185, 3.339915, -5.245049,
-3.271726, 3.339915, 6.152832,
3.785185, 3.339915, 6.152832,
3.785185, -3.425927, -5.245049,
3.785185, 3.339915, -5.245049,
3.785185, -3.425927, 6.152832,
3.785185, 3.339915, 6.152832,
3.785185, -3.425927, -5.245049,
3.785185, -3.425927, 6.152832,
3.785185, 3.339915, -5.245049,
3.785185, 3.339915, 6.152832
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
var radius = 8.018395;
var distance = 35.67475;
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
mvMatrix.translate( -0.2567292, 0.04300582, -0.4538918 );
mvMatrix.scale( 1.228533, 1.281385, 0.7606367 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.67475);
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
furathiocarb<-read.table("furathiocarb.xyz")
```

```
## Error in read.table("furathiocarb.xyz"): no lines available in input
```

```r
x<-furathiocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'furathiocarb' not found
```

```r
y<-furathiocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'furathiocarb' not found
```

```r
z<-furathiocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'furathiocarb' not found
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
-3.168956, -0.01917751, -0.4348242, 0, 0, 1, 1, 1,
-2.733027, 1.131053, -0.1202983, 1, 0, 0, 1, 1,
-2.693281, -1.349138, -1.834103, 1, 0, 0, 1, 1,
-2.525002, 0.2540058, -1.412586, 1, 0, 0, 1, 1,
-2.498752, 0.2386003, -1.234036, 1, 0, 0, 1, 1,
-2.433737, -0.4141133, -1.064964, 1, 0, 0, 1, 1,
-2.389194, -0.1526264, -1.622395, 0, 0, 0, 1, 1,
-2.360068, -1.376832, -2.942346, 0, 0, 0, 1, 1,
-2.267675, -2.787623, -1.231466, 0, 0, 0, 1, 1,
-2.234621, 0.2948835, -0.3602438, 0, 0, 0, 1, 1,
-2.22698, 0.01654731, 0.07137847, 0, 0, 0, 1, 1,
-2.203243, -0.03197565, -0.1111335, 0, 0, 0, 1, 1,
-2.188652, -2.868249, -2.833022, 0, 0, 0, 1, 1,
-2.179165, 0.8002377, -0.3613196, 1, 1, 1, 1, 1,
-2.169135, 1.022999, -1.509421, 1, 1, 1, 1, 1,
-2.136843, -1.882345, -1.326487, 1, 1, 1, 1, 1,
-2.126025, 0.9917381, 0.2035422, 1, 1, 1, 1, 1,
-2.103202, -0.1047067, 0.7832834, 1, 1, 1, 1, 1,
-2.096398, -0.4438705, 0.7292153, 1, 1, 1, 1, 1,
-2.092465, -0.7752479, -2.905636, 1, 1, 1, 1, 1,
-2.058577, -0.3890564, -0.8172377, 1, 1, 1, 1, 1,
-2.035435, -0.1687847, -0.728691, 1, 1, 1, 1, 1,
-1.982557, -1.569956, -1.965836, 1, 1, 1, 1, 1,
-1.964944, -0.2014658, -2.461764, 1, 1, 1, 1, 1,
-1.953322, 0.1662117, -0.2412744, 1, 1, 1, 1, 1,
-1.915345, -0.7435799, -0.8717186, 1, 1, 1, 1, 1,
-1.905103, -1.366411, -1.989209, 1, 1, 1, 1, 1,
-1.902681, -0.3902362, -1.032685, 1, 1, 1, 1, 1,
-1.898893, -1.805048, -2.675588, 0, 0, 1, 1, 1,
-1.86221, -1.16651, -1.050325, 1, 0, 0, 1, 1,
-1.859094, -0.456804, -1.670494, 1, 0, 0, 1, 1,
-1.853752, 0.768888, -0.7730736, 1, 0, 0, 1, 1,
-1.826894, -0.1351094, -1.463269, 1, 0, 0, 1, 1,
-1.826111, -0.3064765, -3.102362, 1, 0, 0, 1, 1,
-1.823352, 0.5939904, -2.584185, 0, 0, 0, 1, 1,
-1.823114, 0.2668827, -0.9384807, 0, 0, 0, 1, 1,
-1.819556, -0.2350818, -2.281809, 0, 0, 0, 1, 1,
-1.799203, 0.572642, -0.8069369, 0, 0, 0, 1, 1,
-1.746328, 0.8612675, -1.158969, 0, 0, 0, 1, 1,
-1.73156, -2.541771, -4.316007, 0, 0, 0, 1, 1,
-1.697395, 1.606725, -0.4468392, 0, 0, 0, 1, 1,
-1.688534, -0.2777028, -1.620023, 1, 1, 1, 1, 1,
-1.684827, -0.226256, -1.932588, 1, 1, 1, 1, 1,
-1.675013, -0.155144, -1.982922, 1, 1, 1, 1, 1,
-1.650466, -1.197348, -1.914606, 1, 1, 1, 1, 1,
-1.645481, 0.2841839, -2.289662, 1, 1, 1, 1, 1,
-1.628205, -0.4166493, -3.139456, 1, 1, 1, 1, 1,
-1.621083, -0.6412385, -2.126816, 1, 1, 1, 1, 1,
-1.609642, 0.8551754, -0.731936, 1, 1, 1, 1, 1,
-1.59515, 1.576062, 1.082, 1, 1, 1, 1, 1,
-1.569422, -0.3773477, -3.919299, 1, 1, 1, 1, 1,
-1.552441, 0.6928757, -3.147243, 1, 1, 1, 1, 1,
-1.535578, -1.345276, -1.285952, 1, 1, 1, 1, 1,
-1.510621, -0.9081854, -3.358374, 1, 1, 1, 1, 1,
-1.509574, -0.4959677, -2.298429, 1, 1, 1, 1, 1,
-1.505462, 0.2662554, 0.3637356, 1, 1, 1, 1, 1,
-1.497075, 0.730549, -3.133258, 0, 0, 1, 1, 1,
-1.496073, 1.694433, -0.893273, 1, 0, 0, 1, 1,
-1.491302, -1.912063, -2.183118, 1, 0, 0, 1, 1,
-1.488317, -0.4644224, -1.051665, 1, 0, 0, 1, 1,
-1.487889, 1.025442, -0.695868, 1, 0, 0, 1, 1,
-1.481542, -0.479548, -2.424484, 1, 0, 0, 1, 1,
-1.47692, 0.1240543, -2.287493, 0, 0, 0, 1, 1,
-1.46318, -1.008621, -2.300562, 0, 0, 0, 1, 1,
-1.452312, -1.512893, -4.111752, 0, 0, 0, 1, 1,
-1.451307, -0.02260263, -1.857571, 0, 0, 0, 1, 1,
-1.450936, -0.8943259, -1.215527, 0, 0, 0, 1, 1,
-1.43781, -0.1213394, -3.608635, 0, 0, 0, 1, 1,
-1.434574, 1.116316, -0.4359046, 0, 0, 0, 1, 1,
-1.427835, -0.2815849, -1.104199, 1, 1, 1, 1, 1,
-1.39395, -1.968825, -1.681225, 1, 1, 1, 1, 1,
-1.392061, -1.051135, -2.769603, 1, 1, 1, 1, 1,
-1.386278, -1.835473, -3.042306, 1, 1, 1, 1, 1,
-1.369669, 0.5625819, -0.558013, 1, 1, 1, 1, 1,
-1.369652, 0.7646883, -0.4565691, 1, 1, 1, 1, 1,
-1.366315, 0.06957766, -1.811053, 1, 1, 1, 1, 1,
-1.358692, -0.2157706, -0.5462049, 1, 1, 1, 1, 1,
-1.348961, -1.380625, -2.885618, 1, 1, 1, 1, 1,
-1.332466, 0.5956368, -1.004167, 1, 1, 1, 1, 1,
-1.327155, -0.620461, -2.200976, 1, 1, 1, 1, 1,
-1.322552, -0.6160312, -2.354388, 1, 1, 1, 1, 1,
-1.317008, -0.2317742, -2.281464, 1, 1, 1, 1, 1,
-1.316092, 0.4495582, -0.8962387, 1, 1, 1, 1, 1,
-1.305577, 0.7443593, -0.1781797, 1, 1, 1, 1, 1,
-1.301104, -0.2579701, -1.198793, 0, 0, 1, 1, 1,
-1.298251, -0.521099, -2.985027, 1, 0, 0, 1, 1,
-1.296576, 0.8753749, -0.9839956, 1, 0, 0, 1, 1,
-1.280049, 1.664852, -1.135806, 1, 0, 0, 1, 1,
-1.273078, -0.6925046, -2.875016, 1, 0, 0, 1, 1,
-1.264239, 2.002116, -2.535644, 1, 0, 0, 1, 1,
-1.26423, 0.5045145, -1.821327, 0, 0, 0, 1, 1,
-1.260978, 0.5759733, -2.307194, 0, 0, 0, 1, 1,
-1.255341, 0.5910164, -0.8594552, 0, 0, 0, 1, 1,
-1.23363, -0.5071219, -1.477412, 0, 0, 0, 1, 1,
-1.232612, -0.008636698, -1.759035, 0, 0, 0, 1, 1,
-1.231173, -2.010861, -3.910722, 0, 0, 0, 1, 1,
-1.220006, -0.6749157, -0.6740416, 0, 0, 0, 1, 1,
-1.217219, -1.0052, -3.69379, 1, 1, 1, 1, 1,
-1.203826, -0.7975014, -3.100877, 1, 1, 1, 1, 1,
-1.19728, 1.127878, -1.361937, 1, 1, 1, 1, 1,
-1.187981, 1.005086, -1.526484, 1, 1, 1, 1, 1,
-1.180412, -1.652611, -0.283921, 1, 1, 1, 1, 1,
-1.176936, 0.7216517, -2.475674, 1, 1, 1, 1, 1,
-1.17386, 1.240259, -0.8774894, 1, 1, 1, 1, 1,
-1.1738, 0.7709951, -0.4478047, 1, 1, 1, 1, 1,
-1.16193, -2.487107, -2.263765, 1, 1, 1, 1, 1,
-1.160365, 1.042951, -2.446224, 1, 1, 1, 1, 1,
-1.149581, -0.7535696, -3.243862, 1, 1, 1, 1, 1,
-1.129399, -0.008869279, -2.152613, 1, 1, 1, 1, 1,
-1.122655, -0.05952353, -1.407376, 1, 1, 1, 1, 1,
-1.122224, -1.011497, -2.370291, 1, 1, 1, 1, 1,
-1.121998, 0.2403719, -0.01665346, 1, 1, 1, 1, 1,
-1.121344, 0.1364217, -1.422414, 0, 0, 1, 1, 1,
-1.120467, 0.2423451, -2.090751, 1, 0, 0, 1, 1,
-1.118275, 0.1570572, -2.491415, 1, 0, 0, 1, 1,
-1.11684, 0.8273804, -1.198287, 1, 0, 0, 1, 1,
-1.109309, 1.175526, -1.678614, 1, 0, 0, 1, 1,
-1.107984, 0.8352048, -1.432204, 1, 0, 0, 1, 1,
-1.099913, 0.5037701, -2.082579, 0, 0, 0, 1, 1,
-1.096716, -0.5085271, -1.528901, 0, 0, 0, 1, 1,
-1.092254, 0.909213, -2.131232, 0, 0, 0, 1, 1,
-1.09176, 0.4411102, -2.004323, 0, 0, 0, 1, 1,
-1.087417, -0.3344452, -1.568785, 0, 0, 0, 1, 1,
-1.081331, -1.229148, -2.993269, 0, 0, 0, 1, 1,
-1.075122, -0.4171536, -0.6405424, 0, 0, 0, 1, 1,
-1.072823, -0.106179, -1.730598, 1, 1, 1, 1, 1,
-1.066548, 0.6344314, -0.2687722, 1, 1, 1, 1, 1,
-1.061021, -1.268839, -3.083273, 1, 1, 1, 1, 1,
-1.05829, 0.1011651, -1.083839, 1, 1, 1, 1, 1,
-1.057692, -0.3344438, -2.350927, 1, 1, 1, 1, 1,
-1.056277, -0.3930185, -3.133071, 1, 1, 1, 1, 1,
-1.054825, 0.08488483, -0.7674581, 1, 1, 1, 1, 1,
-1.045062, -0.1078408, -2.221054, 1, 1, 1, 1, 1,
-1.043908, -0.2860821, -2.404308, 1, 1, 1, 1, 1,
-1.043408, 0.05561937, -2.026374, 1, 1, 1, 1, 1,
-1.042987, -0.03635578, -1.680564, 1, 1, 1, 1, 1,
-1.037709, -1.865648, -1.524817, 1, 1, 1, 1, 1,
-1.033245, 0.4232252, -1.937353, 1, 1, 1, 1, 1,
-1.030665, 1.316662, 0.03594078, 1, 1, 1, 1, 1,
-1.028735, 1.361227, 0.7728313, 1, 1, 1, 1, 1,
-1.024413, 1.525042, -0.3887129, 0, 0, 1, 1, 1,
-1.024248, -0.7326544, -4.353169, 1, 0, 0, 1, 1,
-1.019874, -0.9318482, -3.268193, 1, 0, 0, 1, 1,
-1.016358, -0.2147694, -2.321497, 1, 0, 0, 1, 1,
-1.015733, 0.7187402, -0.8015757, 1, 0, 0, 1, 1,
-1.005233, 0.452232, -2.143944, 1, 0, 0, 1, 1,
-0.9991861, -0.2987131, 0.5517203, 0, 0, 0, 1, 1,
-0.986085, 1.256239, -0.1066888, 0, 0, 0, 1, 1,
-0.9822583, 0.01307938, -2.960161, 0, 0, 0, 1, 1,
-0.9784109, 1.657315, 0.4005972, 0, 0, 0, 1, 1,
-0.9652861, -0.3325855, 0.2605582, 0, 0, 0, 1, 1,
-0.9598956, 0.0650791, -1.326507, 0, 0, 0, 1, 1,
-0.9310393, -1.035732, -1.865567, 0, 0, 0, 1, 1,
-0.9308707, 0.6945494, -0.9002565, 1, 1, 1, 1, 1,
-0.9261453, -1.75649, -3.485215, 1, 1, 1, 1, 1,
-0.924882, 1.670413, -0.6469462, 1, 1, 1, 1, 1,
-0.9187834, -0.3076295, -0.3325886, 1, 1, 1, 1, 1,
-0.9186575, -0.4884087, -0.8183828, 1, 1, 1, 1, 1,
-0.9170893, -1.075405, -2.599574, 1, 1, 1, 1, 1,
-0.9054627, -0.5662652, -2.811954, 1, 1, 1, 1, 1,
-0.901606, -0.1333404, -1.274229, 1, 1, 1, 1, 1,
-0.9009783, 1.974174, -0.6558238, 1, 1, 1, 1, 1,
-0.8992108, -0.8011396, -0.427485, 1, 1, 1, 1, 1,
-0.8955655, 1.68099, -0.6512823, 1, 1, 1, 1, 1,
-0.8865032, 0.2976548, -2.769734, 1, 1, 1, 1, 1,
-0.8852633, 0.2440724, -1.986884, 1, 1, 1, 1, 1,
-0.8840126, 0.5053264, -0.1798865, 1, 1, 1, 1, 1,
-0.8773165, -0.9299636, -3.258804, 1, 1, 1, 1, 1,
-0.875293, -0.6245531, -1.076323, 0, 0, 1, 1, 1,
-0.8749844, 1.216451, 0.1975433, 1, 0, 0, 1, 1,
-0.8574797, -0.3782533, -2.426779, 1, 0, 0, 1, 1,
-0.8574219, -1.045066, -1.549174, 1, 0, 0, 1, 1,
-0.8561484, 1.713666, 0.1841252, 1, 0, 0, 1, 1,
-0.8555498, 0.6514763, -0.2617516, 1, 0, 0, 1, 1,
-0.8541952, 0.09746972, -0.7548158, 0, 0, 0, 1, 1,
-0.849798, -0.3660296, -2.996485, 0, 0, 0, 1, 1,
-0.8431846, -0.8612856, -2.175674, 0, 0, 0, 1, 1,
-0.8387094, 0.8363696, -0.7698863, 0, 0, 0, 1, 1,
-0.835586, -0.8441199, -2.037956, 0, 0, 0, 1, 1,
-0.832714, 0.6909258, -0.3747526, 0, 0, 0, 1, 1,
-0.826824, -0.3173809, -1.395492, 0, 0, 0, 1, 1,
-0.8251846, -1.080756, -3.508834, 1, 1, 1, 1, 1,
-0.8234428, -0.2582683, -1.982822, 1, 1, 1, 1, 1,
-0.8174782, -1.199157, -3.601566, 1, 1, 1, 1, 1,
-0.8163124, -1.662277, -3.464833, 1, 1, 1, 1, 1,
-0.8139171, 0.8264587, 0.9261069, 1, 1, 1, 1, 1,
-0.8040288, 0.5757499, -1.960771, 1, 1, 1, 1, 1,
-0.8040112, -0.6947714, -1.663494, 1, 1, 1, 1, 1,
-0.8030659, -1.320592, -3.482576, 1, 1, 1, 1, 1,
-0.7921969, -0.9511145, -2.915955, 1, 1, 1, 1, 1,
-0.7879345, -0.7488237, -2.46607, 1, 1, 1, 1, 1,
-0.7854354, -0.7085319, -2.18458, 1, 1, 1, 1, 1,
-0.7852311, 1.131763, -0.8764799, 1, 1, 1, 1, 1,
-0.7820983, -0.3584304, -0.578666, 1, 1, 1, 1, 1,
-0.7809793, 1.127317, -0.4463661, 1, 1, 1, 1, 1,
-0.776087, -0.2621109, -1.577913, 1, 1, 1, 1, 1,
-0.7757972, -0.5061206, -1.906533, 0, 0, 1, 1, 1,
-0.7744543, 2.344706, -0.7692966, 1, 0, 0, 1, 1,
-0.7694124, 1.293976, -0.2438447, 1, 0, 0, 1, 1,
-0.7670304, -1.070953, -2.185682, 1, 0, 0, 1, 1,
-0.7635028, 0.4106697, 0.5184423, 1, 0, 0, 1, 1,
-0.7613607, 0.5660817, -0.7010968, 1, 0, 0, 1, 1,
-0.7599488, -1.491386, -2.432426, 0, 0, 0, 1, 1,
-0.7592044, 0.02453977, -1.638927, 0, 0, 0, 1, 1,
-0.7578249, 0.02151304, -1.31779, 0, 0, 0, 1, 1,
-0.7575607, 2.116823, -0.9391238, 0, 0, 0, 1, 1,
-0.748311, 0.190288, -1.125965, 0, 0, 0, 1, 1,
-0.7472056, -0.1762445, -0.0284062, 0, 0, 0, 1, 1,
-0.7432981, 0.7600077, 0.01176564, 0, 0, 0, 1, 1,
-0.7408617, -0.4813546, -1.558083, 1, 1, 1, 1, 1,
-0.7371235, -1.459436, -2.940318, 1, 1, 1, 1, 1,
-0.7368355, 1.151642, -1.000858, 1, 1, 1, 1, 1,
-0.7353547, -0.2575764, -0.5479491, 1, 1, 1, 1, 1,
-0.7293851, -0.09580874, -2.761203, 1, 1, 1, 1, 1,
-0.7260651, 0.7007638, -1.166808, 1, 1, 1, 1, 1,
-0.7231656, 1.92465, -0.6977797, 1, 1, 1, 1, 1,
-0.7157034, 0.7751592, -1.62909, 1, 1, 1, 1, 1,
-0.7142143, -1.134997, -2.5242, 1, 1, 1, 1, 1,
-0.7071185, 0.05042247, -0.1287857, 1, 1, 1, 1, 1,
-0.7069125, 0.8655491, -0.7343484, 1, 1, 1, 1, 1,
-0.7056502, 0.1812738, -2.724425, 1, 1, 1, 1, 1,
-0.7044495, -1.266977, -1.217989, 1, 1, 1, 1, 1,
-0.689485, -0.8754668, -1.297553, 1, 1, 1, 1, 1,
-0.6894107, 0.5346789, -1.659191, 1, 1, 1, 1, 1,
-0.6832466, 0.5338075, -1.788175, 0, 0, 1, 1, 1,
-0.680257, 1.164034, -0.265273, 1, 0, 0, 1, 1,
-0.6702393, -0.185279, -2.18259, 1, 0, 0, 1, 1,
-0.6691226, -0.4087891, -0.36158, 1, 0, 0, 1, 1,
-0.6675853, -1.315109, -2.959402, 1, 0, 0, 1, 1,
-0.6672928, 0.952162, -0.2259559, 1, 0, 0, 1, 1,
-0.6670725, 0.1548373, -1.615588, 0, 0, 0, 1, 1,
-0.6649435, -0.9891255, -3.644545, 0, 0, 0, 1, 1,
-0.6633562, -0.8305941, -2.86944, 0, 0, 0, 1, 1,
-0.6594824, 1.250353, -0.8572537, 0, 0, 0, 1, 1,
-0.6566553, -2.282195, -3.72103, 0, 0, 0, 1, 1,
-0.654442, 0.6088831, -0.4035116, 0, 0, 0, 1, 1,
-0.6534173, -0.2736141, -1.171798, 0, 0, 0, 1, 1,
-0.6521224, 0.2438725, -0.4775918, 1, 1, 1, 1, 1,
-0.6469868, -0.6447098, -2.010098, 1, 1, 1, 1, 1,
-0.6461553, -0.5057291, -2.386243, 1, 1, 1, 1, 1,
-0.6439974, -0.06785268, -3.284179, 1, 1, 1, 1, 1,
-0.6422387, 1.766045, -0.8107744, 1, 1, 1, 1, 1,
-0.6404563, -0.8441231, -0.1542012, 1, 1, 1, 1, 1,
-0.63591, -0.1125917, 0.488813, 1, 1, 1, 1, 1,
-0.6217735, 2.598652, -0.91114, 1, 1, 1, 1, 1,
-0.6212592, 0.2560607, -2.938546, 1, 1, 1, 1, 1,
-0.6211642, -1.119924, -2.728781, 1, 1, 1, 1, 1,
-0.6155876, 2.579151, -0.5224476, 1, 1, 1, 1, 1,
-0.613448, 0.2774093, -1.085673, 1, 1, 1, 1, 1,
-0.6114891, 0.4696457, -0.9684882, 1, 1, 1, 1, 1,
-0.6062261, 1.158832, -0.4908451, 1, 1, 1, 1, 1,
-0.6055371, -2.151471, -2.622128, 1, 1, 1, 1, 1,
-0.5928639, -0.007809494, -2.240293, 0, 0, 1, 1, 1,
-0.5910394, 0.1526182, -1.546012, 1, 0, 0, 1, 1,
-0.5832935, -0.4682647, -2.860701, 1, 0, 0, 1, 1,
-0.5774673, 0.3396808, 0.1113502, 1, 0, 0, 1, 1,
-0.5769426, 0.6918339, -0.7593706, 1, 0, 0, 1, 1,
-0.5703322, 1.32517, -1.340251, 1, 0, 0, 1, 1,
-0.56916, 0.4141194, -0.8811525, 0, 0, 0, 1, 1,
-0.5673534, -0.5072747, -2.266463, 0, 0, 0, 1, 1,
-0.5670618, -0.1946462, -0.4641486, 0, 0, 0, 1, 1,
-0.5661221, -0.4632313, -2.326367, 0, 0, 0, 1, 1,
-0.5623667, -0.9850603, -1.878593, 0, 0, 0, 1, 1,
-0.5622122, 1.644517, 0.00801536, 0, 0, 0, 1, 1,
-0.5572813, -1.286053, -1.751441, 0, 0, 0, 1, 1,
-0.556847, 0.9124629, -0.1724905, 1, 1, 1, 1, 1,
-0.5556107, 0.1723612, -0.7493101, 1, 1, 1, 1, 1,
-0.5555972, -1.895231, -3.389283, 1, 1, 1, 1, 1,
-0.5536754, 0.4108091, -2.043664, 1, 1, 1, 1, 1,
-0.5533453, -0.08183277, -1.288036, 1, 1, 1, 1, 1,
-0.551361, -0.02313079, -0.5368488, 1, 1, 1, 1, 1,
-0.5486254, -0.1856671, -3.33975, 1, 1, 1, 1, 1,
-0.5471746, 1.827114, -0.1904092, 1, 1, 1, 1, 1,
-0.5466512, 0.8001825, -0.1416894, 1, 1, 1, 1, 1,
-0.5435866, 0.4637648, -1.400646, 1, 1, 1, 1, 1,
-0.5396114, 0.5291342, -1.794763, 1, 1, 1, 1, 1,
-0.5395063, -1.014634, -3.385569, 1, 1, 1, 1, 1,
-0.5367142, -0.8203768, -2.15529, 1, 1, 1, 1, 1,
-0.5345557, -0.905785, -3.107824, 1, 1, 1, 1, 1,
-0.5327163, 0.5190188, 0.04285221, 1, 1, 1, 1, 1,
-0.5277008, 0.9735335, -1.256869, 0, 0, 1, 1, 1,
-0.5254489, -1.028467, -2.774372, 1, 0, 0, 1, 1,
-0.525297, -0.9653404, -2.867153, 1, 0, 0, 1, 1,
-0.5243497, 0.6017497, -0.3348077, 1, 0, 0, 1, 1,
-0.5225708, 1.751748, -0.2199221, 1, 0, 0, 1, 1,
-0.5195058, 0.0977203, -1.532286, 1, 0, 0, 1, 1,
-0.5165152, 0.4536953, -3.002959, 0, 0, 0, 1, 1,
-0.5161773, -0.9069021, -2.48897, 0, 0, 0, 1, 1,
-0.5161082, -1.365808, -2.251682, 0, 0, 0, 1, 1,
-0.5142078, -0.7063146, -1.548393, 0, 0, 0, 1, 1,
-0.5139045, 0.4106404, -1.288171, 0, 0, 0, 1, 1,
-0.513353, 0.03943656, -1.10095, 0, 0, 0, 1, 1,
-0.5124165, -0.4442264, -2.667328, 0, 0, 0, 1, 1,
-0.5117512, 0.867301, -0.05530865, 1, 1, 1, 1, 1,
-0.5095327, 0.9873252, -0.5812672, 1, 1, 1, 1, 1,
-0.5050289, -0.671472, -2.818409, 1, 1, 1, 1, 1,
-0.4987884, -0.03967992, -1.234709, 1, 1, 1, 1, 1,
-0.4942805, -0.9559413, -1.778329, 1, 1, 1, 1, 1,
-0.4896491, -0.7365957, -3.493281, 1, 1, 1, 1, 1,
-0.4877385, -0.6358457, -1.656343, 1, 1, 1, 1, 1,
-0.4848716, 0.3803702, -1.533862, 1, 1, 1, 1, 1,
-0.4839706, 0.03255007, -1.235394, 1, 1, 1, 1, 1,
-0.4838307, -1.046821, -2.601239, 1, 1, 1, 1, 1,
-0.4808415, -0.1091358, 0.1501767, 1, 1, 1, 1, 1,
-0.4781992, 2.582537, 0.05590415, 1, 1, 1, 1, 1,
-0.4665476, -0.8151786, -2.866552, 1, 1, 1, 1, 1,
-0.4587864, 0.08781614, -2.562921, 1, 1, 1, 1, 1,
-0.4557964, -0.5621505, -1.376765, 1, 1, 1, 1, 1,
-0.4525219, 0.8147204, 0.006096107, 0, 0, 1, 1, 1,
-0.4488641, 0.3272703, -0.7242861, 1, 0, 0, 1, 1,
-0.4466451, -0.3249311, -1.273423, 1, 0, 0, 1, 1,
-0.4453474, 2.474222, 0.9085571, 1, 0, 0, 1, 1,
-0.4409278, -0.1919999, -1.028257, 1, 0, 0, 1, 1,
-0.4407204, 1.015435, 0.09802491, 1, 0, 0, 1, 1,
-0.4372983, -1.343212, -2.89967, 0, 0, 0, 1, 1,
-0.4352996, 0.5631951, -0.08906002, 0, 0, 0, 1, 1,
-0.4323632, 1.858885, 0.3381462, 0, 0, 0, 1, 1,
-0.4317642, 0.3154542, -1.44215, 0, 0, 0, 1, 1,
-0.4280634, -0.4564642, -3.82722, 0, 0, 0, 1, 1,
-0.4258152, 0.6792396, -0.07862347, 0, 0, 0, 1, 1,
-0.4181555, 0.4243867, -1.240308, 0, 0, 0, 1, 1,
-0.4180573, -1.972132, -3.219346, 1, 1, 1, 1, 1,
-0.4116611, -0.1492769, -2.080184, 1, 1, 1, 1, 1,
-0.4106739, -0.8544907, -2.253444, 1, 1, 1, 1, 1,
-0.4100449, 0.2311919, -1.749226, 1, 1, 1, 1, 1,
-0.4086861, -1.985163, -4.358159, 1, 1, 1, 1, 1,
-0.4086258, -0.4872897, -2.501916, 1, 1, 1, 1, 1,
-0.4067584, 0.09746169, -0.05289207, 1, 1, 1, 1, 1,
-0.4014463, 0.1573506, -1.866458, 1, 1, 1, 1, 1,
-0.4012398, 0.002571643, 0.277632, 1, 1, 1, 1, 1,
-0.4000125, 1.455061, -0.6286213, 1, 1, 1, 1, 1,
-0.3995462, -0.8973384, -2.458487, 1, 1, 1, 1, 1,
-0.3980741, -0.9479212, -1.021633, 1, 1, 1, 1, 1,
-0.3949477, -1.480801, -1.709337, 1, 1, 1, 1, 1,
-0.3934987, -1.092359, -2.612474, 1, 1, 1, 1, 1,
-0.3915823, 0.7002606, -1.93302, 1, 1, 1, 1, 1,
-0.3901231, 0.3678593, -0.04001169, 0, 0, 1, 1, 1,
-0.3895303, 0.2435575, -1.852179, 1, 0, 0, 1, 1,
-0.3888144, -0.2650416, -2.091612, 1, 0, 0, 1, 1,
-0.3849552, -1.196129, -3.310228, 1, 0, 0, 1, 1,
-0.3845109, -0.8259592, -1.902138, 1, 0, 0, 1, 1,
-0.3841752, -1.739921, -2.915438, 1, 0, 0, 1, 1,
-0.3827019, 0.3149901, -1.482867, 0, 0, 0, 1, 1,
-0.3816935, -0.8153321, -2.082318, 0, 0, 0, 1, 1,
-0.3759937, -0.08317744, -1.206525, 0, 0, 0, 1, 1,
-0.3744877, 1.96818, -0.9061749, 0, 0, 0, 1, 1,
-0.3738674, -1.149343, -4.153275, 0, 0, 0, 1, 1,
-0.373724, -0.5093448, -3.6134, 0, 0, 0, 1, 1,
-0.3724593, 0.4416309, -1.100086, 0, 0, 0, 1, 1,
-0.3618589, 0.3847988, -0.9597378, 1, 1, 1, 1, 1,
-0.3599891, -0.4722404, -2.706865, 1, 1, 1, 1, 1,
-0.3564282, -0.7062119, -2.07397, 1, 1, 1, 1, 1,
-0.3547614, 1.01295, 1.499707, 1, 1, 1, 1, 1,
-0.3546854, 1.129468, -0.6166821, 1, 1, 1, 1, 1,
-0.3543489, 0.1872388, -1.032031, 1, 1, 1, 1, 1,
-0.3538195, -0.5099228, -2.045792, 1, 1, 1, 1, 1,
-0.3512768, 1.283537, 0.4552773, 1, 1, 1, 1, 1,
-0.3501827, 0.6845992, -1.42777, 1, 1, 1, 1, 1,
-0.3499085, 1.697266, 0.06737537, 1, 1, 1, 1, 1,
-0.3491982, 0.4604889, -0.644033, 1, 1, 1, 1, 1,
-0.3488767, -0.06758156, -1.009763, 1, 1, 1, 1, 1,
-0.3454795, 0.9196806, -0.01681447, 1, 1, 1, 1, 1,
-0.3453573, -0.2655864, -2.663105, 1, 1, 1, 1, 1,
-0.3431797, -1.062792, -1.974807, 1, 1, 1, 1, 1,
-0.3378611, -0.1095904, -0.5479808, 0, 0, 1, 1, 1,
-0.3332949, 0.125689, 0.8744243, 1, 0, 0, 1, 1,
-0.3322859, -0.7146896, -3.061216, 1, 0, 0, 1, 1,
-0.3317373, -0.3800569, -2.58026, 1, 0, 0, 1, 1,
-0.3296584, -0.04285619, -2.910748, 1, 0, 0, 1, 1,
-0.328612, -1.372813, -3.716572, 1, 0, 0, 1, 1,
-0.3222595, -0.5903423, -4.550718, 0, 0, 0, 1, 1,
-0.317723, -0.748035, -1.85791, 0, 0, 0, 1, 1,
-0.3162863, 1.177031, -0.5331754, 0, 0, 0, 1, 1,
-0.3146018, -0.4671738, -2.16151, 0, 0, 0, 1, 1,
-0.3135684, -0.1193397, -2.110276, 0, 0, 0, 1, 1,
-0.3135594, -0.4326064, -2.017072, 0, 0, 0, 1, 1,
-0.3132413, 0.2171089, -2.746244, 0, 0, 0, 1, 1,
-0.3119954, 0.767348, -1.403382, 1, 1, 1, 1, 1,
-0.3118941, -0.8012148, -2.135865, 1, 1, 1, 1, 1,
-0.3114028, -0.2116781, -3.491772, 1, 1, 1, 1, 1,
-0.3105089, 0.0356185, -2.170858, 1, 1, 1, 1, 1,
-0.3060394, -0.5936175, -1.791974, 1, 1, 1, 1, 1,
-0.2997103, -0.4338591, -4.323387, 1, 1, 1, 1, 1,
-0.2983741, 0.9007142, 0.1618934, 1, 1, 1, 1, 1,
-0.2980732, 0.8603991, 0.432597, 1, 1, 1, 1, 1,
-0.296545, 2.020924, 0.9046785, 1, 1, 1, 1, 1,
-0.2940719, 0.2723211, -0.4503039, 1, 1, 1, 1, 1,
-0.2929462, -0.405387, -1.383064, 1, 1, 1, 1, 1,
-0.2901208, 2.981236, -0.3550972, 1, 1, 1, 1, 1,
-0.287264, 0.2817189, -0.4037462, 1, 1, 1, 1, 1,
-0.2860754, -0.4842553, -2.779864, 1, 1, 1, 1, 1,
-0.2860228, -0.7108864, -4.796577, 1, 1, 1, 1, 1,
-0.2767219, 0.6893452, -0.04336189, 0, 0, 1, 1, 1,
-0.2710032, -0.5083703, -1.83808, 1, 0, 0, 1, 1,
-0.2695763, -0.4440992, -3.726202, 1, 0, 0, 1, 1,
-0.2661247, 0.0987324, -2.367027, 1, 0, 0, 1, 1,
-0.2650494, 1.803572, 0.5798337, 1, 0, 0, 1, 1,
-0.2646393, 0.1254327, -1.391036, 1, 0, 0, 1, 1,
-0.2605203, -0.8109949, -2.594114, 0, 0, 0, 1, 1,
-0.2577661, -1.966263, -4.322435, 0, 0, 0, 1, 1,
-0.2551296, 0.2976883, 0.1105688, 0, 0, 0, 1, 1,
-0.2535541, 0.1135269, -2.39596, 0, 0, 0, 1, 1,
-0.252827, 1.512566, 0.8416146, 0, 0, 0, 1, 1,
-0.2496887, 0.6590585, -0.5684465, 0, 0, 0, 1, 1,
-0.2490952, -2.922751, -3.380038, 0, 0, 0, 1, 1,
-0.2452707, -0.4766179, -1.346135, 1, 1, 1, 1, 1,
-0.2410649, -1.515269, -3.197575, 1, 1, 1, 1, 1,
-0.2344709, -1.664362, -4.328652, 1, 1, 1, 1, 1,
-0.2292525, 1.261953, 0.7966437, 1, 1, 1, 1, 1,
-0.2290475, 1.92707, 0.1170225, 1, 1, 1, 1, 1,
-0.2289048, -0.2531235, -1.133601, 1, 1, 1, 1, 1,
-0.2288517, 0.1880284, -2.549354, 1, 1, 1, 1, 1,
-0.2272087, 0.02012951, -3.078081, 1, 1, 1, 1, 1,
-0.2256373, -0.6693128, -1.782795, 1, 1, 1, 1, 1,
-0.2214926, -2.012125, -5.07906, 1, 1, 1, 1, 1,
-0.2169417, 1.073024, -1.897349, 1, 1, 1, 1, 1,
-0.2155639, 1.499959, 1.297069, 1, 1, 1, 1, 1,
-0.2047706, 1.095472, 0.04083516, 1, 1, 1, 1, 1,
-0.1993364, -0.2064058, -2.238681, 1, 1, 1, 1, 1,
-0.1955479, -1.828273, -2.031236, 1, 1, 1, 1, 1,
-0.1948565, 0.5405422, -1.101649, 0, 0, 1, 1, 1,
-0.1916722, -0.1461502, -1.905756, 1, 0, 0, 1, 1,
-0.1899843, -0.1655138, -2.54726, 1, 0, 0, 1, 1,
-0.1896414, -1.312745, -2.039051, 1, 0, 0, 1, 1,
-0.18908, 0.4637146, -0.2606494, 1, 0, 0, 1, 1,
-0.1882722, 0.5963101, -2.545211, 1, 0, 0, 1, 1,
-0.1821003, -0.3434284, -2.373143, 0, 0, 0, 1, 1,
-0.1809167, -2.130996, -1.436964, 0, 0, 0, 1, 1,
-0.1782578, -1.230743, -3.032797, 0, 0, 0, 1, 1,
-0.1778349, -0.6393178, -2.247084, 0, 0, 0, 1, 1,
-0.1760969, -0.2483694, -1.920565, 0, 0, 0, 1, 1,
-0.1751281, 0.957752, 0.8888483, 0, 0, 0, 1, 1,
-0.1745183, 0.9070627, -0.4894706, 0, 0, 0, 1, 1,
-0.1740881, -2.339359, -3.119941, 1, 1, 1, 1, 1,
-0.1731898, -0.3271208, -1.547238, 1, 1, 1, 1, 1,
-0.1706333, 0.8051324, -0.2423921, 1, 1, 1, 1, 1,
-0.1704605, -0.000501541, -0.9715213, 1, 1, 1, 1, 1,
-0.1662251, -2.202944, -3.759188, 1, 1, 1, 1, 1,
-0.1660939, 0.9825976, 0.03941797, 1, 1, 1, 1, 1,
-0.1651027, 0.6093077, 1.114743, 1, 1, 1, 1, 1,
-0.1638852, -0.7226126, -2.832326, 1, 1, 1, 1, 1,
-0.1635838, -0.2615416, -1.56948, 1, 1, 1, 1, 1,
-0.1630735, -1.069885, -2.481937, 1, 1, 1, 1, 1,
-0.1601102, -1.8151, -3.490216, 1, 1, 1, 1, 1,
-0.1566074, -0.5874851, -2.977017, 1, 1, 1, 1, 1,
-0.1564628, -1.345493, -2.689062, 1, 1, 1, 1, 1,
-0.1466652, 0.1883838, -3.054019, 1, 1, 1, 1, 1,
-0.1391653, 1.016695, 0.2026972, 1, 1, 1, 1, 1,
-0.1386393, -1.003103, -2.902203, 0, 0, 1, 1, 1,
-0.1327091, -0.7265341, -2.815345, 1, 0, 0, 1, 1,
-0.1323071, -0.01516033, -1.783307, 1, 0, 0, 1, 1,
-0.1316204, -0.2242149, -0.9625973, 1, 0, 0, 1, 1,
-0.1296178, -0.2184231, -1.705465, 1, 0, 0, 1, 1,
-0.1289719, -1.526999, -2.880124, 1, 0, 0, 1, 1,
-0.1193424, -0.2514333, -2.252285, 0, 0, 0, 1, 1,
-0.1173027, -0.385993, -3.121859, 0, 0, 0, 1, 1,
-0.1160344, 1.549085, 0.499983, 0, 0, 0, 1, 1,
-0.1149335, 0.1033994, -1.778575, 0, 0, 0, 1, 1,
-0.112328, 0.4667421, -0.6816549, 0, 0, 0, 1, 1,
-0.1118409, 0.8640165, 1.047452, 0, 0, 0, 1, 1,
-0.1092529, -0.02995155, -1.787522, 0, 0, 0, 1, 1,
-0.1082894, 1.008494, -0.8233977, 1, 1, 1, 1, 1,
-0.1038675, 0.7028907, 0.04139607, 1, 1, 1, 1, 1,
-0.09982794, -0.7548587, -2.290588, 1, 1, 1, 1, 1,
-0.09854387, 0.6415663, -0.6702075, 1, 1, 1, 1, 1,
-0.09688061, 0.1427435, -0.7871988, 1, 1, 1, 1, 1,
-0.09355357, 0.3639375, -0.08438173, 1, 1, 1, 1, 1,
-0.08998868, 1.433133, -0.477705, 1, 1, 1, 1, 1,
-0.0848402, -0.1713544, -4.438497, 1, 1, 1, 1, 1,
-0.08255624, -0.5533859, -2.933939, 1, 1, 1, 1, 1,
-0.08204219, -1.387332, -4.422635, 1, 1, 1, 1, 1,
-0.07968019, 0.6958069, -0.6260785, 1, 1, 1, 1, 1,
-0.07357946, -0.9245275, -3.313687, 1, 1, 1, 1, 1,
-0.07212713, 0.5071936, 0.9247276, 1, 1, 1, 1, 1,
-0.0683348, -0.1911147, -1.866249, 1, 1, 1, 1, 1,
-0.06779992, 0.8109941, -0.5553218, 1, 1, 1, 1, 1,
-0.05868057, -0.007703901, -0.1615415, 0, 0, 1, 1, 1,
-0.05379972, -1.234455, -4.04761, 1, 0, 0, 1, 1,
-0.0480286, -0.1248977, -3.347845, 1, 0, 0, 1, 1,
-0.04693882, 0.3060814, -0.4459991, 1, 0, 0, 1, 1,
-0.04581009, 0.86905, 0.8467141, 1, 0, 0, 1, 1,
-0.04299187, 0.5172749, 0.8328962, 1, 0, 0, 1, 1,
-0.03498875, -0.2119384, -1.856112, 0, 0, 0, 1, 1,
-0.0332609, 0.9310396, -1.304382, 0, 0, 0, 1, 1,
-0.0323115, 2.046063, -0.4021237, 0, 0, 0, 1, 1,
-0.02660854, -1.290634, -3.586648, 0, 0, 0, 1, 1,
-0.02651156, 0.4968659, 0.5325915, 0, 0, 0, 1, 1,
-0.02301386, 0.4613981, -1.5191, 0, 0, 0, 1, 1,
-0.02250627, 0.09046893, -0.5493237, 0, 0, 0, 1, 1,
-0.02221806, 0.7751028, 0.6067659, 1, 1, 1, 1, 1,
-0.02104904, -0.7704681, -3.3111, 1, 1, 1, 1, 1,
-0.02031428, -1.600465, -3.286298, 1, 1, 1, 1, 1,
-0.01799576, 1.094579, -1.067448, 1, 1, 1, 1, 1,
-0.00948518, -0.315921, -2.475254, 1, 1, 1, 1, 1,
-0.003907318, -0.7035204, -3.167797, 1, 1, 1, 1, 1,
-0.001234981, 0.1148967, 0.1368199, 1, 1, 1, 1, 1,
-0.0007419401, -1.673093, -4.141994, 1, 1, 1, 1, 1,
0.0116729, -0.3265091, 2.313403, 1, 1, 1, 1, 1,
0.01507682, 1.299297, -0.1424535, 1, 1, 1, 1, 1,
0.01863557, -0.6119698, 3.127518, 1, 1, 1, 1, 1,
0.02084133, -0.3526217, 2.133347, 1, 1, 1, 1, 1,
0.02138445, 0.4304625, -1.964305, 1, 1, 1, 1, 1,
0.02885948, -1.604031, 1.171046, 1, 1, 1, 1, 1,
0.03060586, 0.5561103, -0.07357153, 1, 1, 1, 1, 1,
0.03128926, 0.8101891, -0.4606983, 0, 0, 1, 1, 1,
0.03237849, 2.632681, -0.0423338, 1, 0, 0, 1, 1,
0.03509018, 1.190217, 0.2805834, 1, 0, 0, 1, 1,
0.03548758, -0.3209482, 1.080645, 1, 0, 0, 1, 1,
0.03659371, 1.170813, 0.5344978, 1, 0, 0, 1, 1,
0.0373587, 2.385483, 1.446194, 1, 0, 0, 1, 1,
0.04068724, -0.326334, 2.869568, 0, 0, 0, 1, 1,
0.04223244, 0.6100917, 1.56347, 0, 0, 0, 1, 1,
0.04469202, 1.281077, -0.5120497, 0, 0, 0, 1, 1,
0.04685528, 1.200785, -2.432359, 0, 0, 0, 1, 1,
0.05876602, 0.1498118, -0.6281705, 0, 0, 0, 1, 1,
0.05881725, 0.8037561, 1.271466, 0, 0, 0, 1, 1,
0.06074096, -0.223988, 3.280065, 0, 0, 0, 1, 1,
0.06159265, 0.2614619, -1.27396, 1, 1, 1, 1, 1,
0.06192639, 0.01069906, 2.367023, 1, 1, 1, 1, 1,
0.06552002, 0.4557447, 0.6728227, 1, 1, 1, 1, 1,
0.07132863, 1.170994, -0.1866842, 1, 1, 1, 1, 1,
0.07375336, 0.2800556, 2.022634, 1, 1, 1, 1, 1,
0.07541952, -0.07235464, 1.967425, 1, 1, 1, 1, 1,
0.077215, 0.5259316, 2.380503, 1, 1, 1, 1, 1,
0.08018513, 0.6458472, 0.2615856, 1, 1, 1, 1, 1,
0.08124936, 1.352489, 0.3474077, 1, 1, 1, 1, 1,
0.08129925, -1.209406, 4.22967, 1, 1, 1, 1, 1,
0.08138211, -1.262634, 2.336635, 1, 1, 1, 1, 1,
0.08258882, 1.331926, -0.1315783, 1, 1, 1, 1, 1,
0.08528966, -0.5954753, 3.88276, 1, 1, 1, 1, 1,
0.08987937, 0.2149715, 0.1761603, 1, 1, 1, 1, 1,
0.09004103, 0.1858843, -0.1435841, 1, 1, 1, 1, 1,
0.09155259, -0.7035477, 3.106094, 0, 0, 1, 1, 1,
0.092417, -0.1966442, 3.201376, 1, 0, 0, 1, 1,
0.0955262, 0.9129285, -1.429587, 1, 0, 0, 1, 1,
0.09676772, 0.708957, 0.1008129, 1, 0, 0, 1, 1,
0.09716736, 1.076311, -0.6854879, 1, 0, 0, 1, 1,
0.09736132, -0.1348802, 2.218709, 1, 0, 0, 1, 1,
0.1003536, -0.465599, 3.773813, 0, 0, 0, 1, 1,
0.1013441, 0.4888095, -1.262026, 0, 0, 0, 1, 1,
0.101862, 0.2902813, 0.6055915, 0, 0, 0, 1, 1,
0.1021002, -0.9196573, 3.372465, 0, 0, 0, 1, 1,
0.1039311, 0.6870531, -0.06113379, 0, 0, 0, 1, 1,
0.1048814, 1.271985, 0.5665602, 0, 0, 0, 1, 1,
0.1051869, -0.290751, 1.698203, 0, 0, 0, 1, 1,
0.1099294, 0.5140907, -1.77254, 1, 1, 1, 1, 1,
0.1102084, -1.014384, 4.2514, 1, 1, 1, 1, 1,
0.1124563, -1.019525, 3.438155, 1, 1, 1, 1, 1,
0.121176, -0.6601643, 3.262755, 1, 1, 1, 1, 1,
0.1250854, -0.8387824, 3.692643, 1, 1, 1, 1, 1,
0.1276886, 1.527579, 0.07109184, 1, 1, 1, 1, 1,
0.128833, 0.2999679, 0.6964232, 1, 1, 1, 1, 1,
0.1294982, 1.309608, -0.6544427, 1, 1, 1, 1, 1,
0.134199, 0.9731888, 0.8095021, 1, 1, 1, 1, 1,
0.1429006, -0.852026, 3.833143, 1, 1, 1, 1, 1,
0.142964, -0.9171876, 3.210052, 1, 1, 1, 1, 1,
0.1473025, 0.3161902, 1.382434, 1, 1, 1, 1, 1,
0.1475047, -1.352124, 2.468869, 1, 1, 1, 1, 1,
0.1480071, -0.1363901, 1.821756, 1, 1, 1, 1, 1,
0.1503646, -0.6825658, 2.884023, 1, 1, 1, 1, 1,
0.1540737, -0.4083093, 4.50642, 0, 0, 1, 1, 1,
0.1557655, -1.029897, 2.992062, 1, 0, 0, 1, 1,
0.1666718, 0.2590074, 0.5684566, 1, 0, 0, 1, 1,
0.173198, -0.1933925, 2.481344, 1, 0, 0, 1, 1,
0.1736475, -1.008874, 2.729237, 1, 0, 0, 1, 1,
0.1806279, -1.20252, 1.513203, 1, 0, 0, 1, 1,
0.1815412, -1.989022, 3.926973, 0, 0, 0, 1, 1,
0.1825586, 0.1557801, 0.8958507, 0, 0, 0, 1, 1,
0.1859139, 1.395136, 0.5478078, 0, 0, 0, 1, 1,
0.1866735, 0.5522377, -0.07667579, 0, 0, 0, 1, 1,
0.1875835, -0.6960302, 4.202764, 0, 0, 0, 1, 1,
0.187742, -0.06420399, 2.521105, 0, 0, 0, 1, 1,
0.1880506, 1.101423, -1.048547, 0, 0, 0, 1, 1,
0.1883678, -1.05011, 3.987546, 1, 1, 1, 1, 1,
0.1884451, 0.01933021, 1.30696, 1, 1, 1, 1, 1,
0.1907395, -0.8309844, 1.085368, 1, 1, 1, 1, 1,
0.1992632, 0.1826226, 1.460638, 1, 1, 1, 1, 1,
0.1996302, 0.4986348, 0.5049716, 1, 1, 1, 1, 1,
0.2084506, 0.4062009, 0.1079534, 1, 1, 1, 1, 1,
0.2099166, -0.09221085, 2.439382, 1, 1, 1, 1, 1,
0.2119283, 0.4597845, 0.3119403, 1, 1, 1, 1, 1,
0.2150833, -0.3555413, 3.013086, 1, 1, 1, 1, 1,
0.2201958, -1.487679, 2.229045, 1, 1, 1, 1, 1,
0.2234506, -1.257774, 2.595916, 1, 1, 1, 1, 1,
0.2246569, -1.411733, 1.638289, 1, 1, 1, 1, 1,
0.2262654, 0.4911991, -1.482656, 1, 1, 1, 1, 1,
0.2276387, -2.221672, 3.012168, 1, 1, 1, 1, 1,
0.2305872, -0.3565083, 2.586488, 1, 1, 1, 1, 1,
0.2390387, -0.04881703, 1.423819, 0, 0, 1, 1, 1,
0.2417236, 0.7031069, -0.100119, 1, 0, 0, 1, 1,
0.2436165, 1.091169, -0.1321164, 1, 0, 0, 1, 1,
0.2503807, 0.2477204, -0.3942703, 1, 0, 0, 1, 1,
0.2516443, 0.4348837, 1.162146, 1, 0, 0, 1, 1,
0.2521095, -0.6820551, 1.663757, 1, 0, 0, 1, 1,
0.2546922, -0.999271, 2.514634, 0, 0, 0, 1, 1,
0.258486, 1.198077, 0.6402928, 0, 0, 0, 1, 1,
0.2584869, 0.7383373, 0.6536819, 0, 0, 0, 1, 1,
0.262835, 0.745243, 0.6366258, 0, 0, 0, 1, 1,
0.2687387, 0.5878038, 0.7650028, 0, 0, 0, 1, 1,
0.2730669, 0.5360744, -2.094043, 0, 0, 0, 1, 1,
0.2827498, 0.1749293, -0.5440156, 0, 0, 0, 1, 1,
0.2839122, -1.403332, 1.486463, 1, 1, 1, 1, 1,
0.2863462, 1.748017, 0.5052804, 1, 1, 1, 1, 1,
0.2878991, 1.748893, 0.4631507, 1, 1, 1, 1, 1,
0.2906867, 1.477531, 0.5327719, 1, 1, 1, 1, 1,
0.2918763, 1.186258, 0.3786643, 1, 1, 1, 1, 1,
0.2951856, -2.123625, 3.461413, 1, 1, 1, 1, 1,
0.2957646, -0.8036368, 3.551984, 1, 1, 1, 1, 1,
0.2958033, 1.802352, 0.4266082, 1, 1, 1, 1, 1,
0.2978509, 1.478932, -2.666003, 1, 1, 1, 1, 1,
0.3015113, 0.2790467, 0.8716609, 1, 1, 1, 1, 1,
0.3024609, 1.904173, -0.1766734, 1, 1, 1, 1, 1,
0.3067862, 0.5464427, 0.9877393, 1, 1, 1, 1, 1,
0.3071144, -0.09153133, 2.502201, 1, 1, 1, 1, 1,
0.3103511, -0.8774914, 2.327915, 1, 1, 1, 1, 1,
0.311175, 0.912827, 0.2406142, 1, 1, 1, 1, 1,
0.3120725, -1.053025, 2.062727, 0, 0, 1, 1, 1,
0.3128206, 0.03425578, 1.185251, 1, 0, 0, 1, 1,
0.3141992, -1.272935, 3.758641, 1, 0, 0, 1, 1,
0.3186295, -0.8850302, 2.793875, 1, 0, 0, 1, 1,
0.3192783, -0.5139444, 0.517642, 1, 0, 0, 1, 1,
0.3212224, -0.1736474, 3.388342, 1, 0, 0, 1, 1,
0.3226194, 0.2244129, -0.09772289, 0, 0, 0, 1, 1,
0.3229483, -0.3080983, 2.380306, 0, 0, 0, 1, 1,
0.3292584, 0.2821013, 0.4156791, 0, 0, 0, 1, 1,
0.3299895, -0.3946253, 2.135316, 0, 0, 0, 1, 1,
0.3346264, -0.06263532, 1.708333, 0, 0, 0, 1, 1,
0.3369355, 3.079665, -1.513803, 0, 0, 0, 1, 1,
0.3437526, -0.5849054, 2.422069, 0, 0, 0, 1, 1,
0.3460426, -0.4391152, 1.878392, 1, 1, 1, 1, 1,
0.3470613, -0.06152635, 2.743523, 1, 1, 1, 1, 1,
0.347533, 1.134333, 0.6827505, 1, 1, 1, 1, 1,
0.34856, 0.1157885, 3.322044, 1, 1, 1, 1, 1,
0.3490587, 1.336442, 1.093728, 1, 1, 1, 1, 1,
0.3498328, 0.6496527, -1.172614, 1, 1, 1, 1, 1,
0.3628493, -0.226473, 0.697514, 1, 1, 1, 1, 1,
0.3629173, 0.4690841, 1.434134, 1, 1, 1, 1, 1,
0.3639026, -0.4112139, 1.772067, 1, 1, 1, 1, 1,
0.3639893, 0.3557947, 1.57752, 1, 1, 1, 1, 1,
0.3641147, -0.3814125, 3.401141, 1, 1, 1, 1, 1,
0.3682727, -0.3313876, 1.883015, 1, 1, 1, 1, 1,
0.3699193, -0.6811665, 1.328581, 1, 1, 1, 1, 1,
0.3704575, -0.4133492, 1.704032, 1, 1, 1, 1, 1,
0.3767495, -0.4994759, 2.278692, 1, 1, 1, 1, 1,
0.3795024, -0.2733648, 3.906764, 0, 0, 1, 1, 1,
0.3811398, 0.6020937, 3.145483, 1, 0, 0, 1, 1,
0.3835225, -1.477091, 3.323967, 1, 0, 0, 1, 1,
0.3843209, 0.7812803, 0.6464964, 1, 0, 0, 1, 1,
0.3845737, 1.245286, 0.9764167, 1, 0, 0, 1, 1,
0.3878044, -1.280474, 3.701617, 1, 0, 0, 1, 1,
0.3902893, 1.038462, 2.027071, 0, 0, 0, 1, 1,
0.3916478, -0.6301047, 1.230847, 0, 0, 0, 1, 1,
0.3929164, 0.2890075, 1.23788, 0, 0, 0, 1, 1,
0.3945686, 0.310398, -0.5465221, 0, 0, 0, 1, 1,
0.3952993, -1.474803, 1.339317, 0, 0, 0, 1, 1,
0.39681, -0.817079, 2.092801, 0, 0, 0, 1, 1,
0.3974977, 1.586507, 1.253127, 0, 0, 0, 1, 1,
0.3997073, 0.07886188, -0.3894233, 1, 1, 1, 1, 1,
0.4013611, 0.7306676, -0.9914212, 1, 1, 1, 1, 1,
0.4088547, -0.787248, 1.704269, 1, 1, 1, 1, 1,
0.4092396, -0.4889105, 3.757264, 1, 1, 1, 1, 1,
0.4140201, -1.175655, 1.441083, 1, 1, 1, 1, 1,
0.4158438, -0.380789, 2.883406, 1, 1, 1, 1, 1,
0.4172786, 0.7300964, 0.05633127, 1, 1, 1, 1, 1,
0.4236092, 0.7581112, 1.24631, 1, 1, 1, 1, 1,
0.4280648, 1.417978, -0.03882232, 1, 1, 1, 1, 1,
0.4296186, 0.125314, 3.714041, 1, 1, 1, 1, 1,
0.4298577, 1.664886, -0.7526607, 1, 1, 1, 1, 1,
0.4326295, 0.009383315, 1.484565, 1, 1, 1, 1, 1,
0.4332103, -0.8467672, 2.722724, 1, 1, 1, 1, 1,
0.4348248, -2.027751, 3.427099, 1, 1, 1, 1, 1,
0.4400568, 1.458503, -0.862449, 1, 1, 1, 1, 1,
0.444945, 0.7600857, 0.1098969, 0, 0, 1, 1, 1,
0.4452551, -0.260958, 4.265812, 1, 0, 0, 1, 1,
0.4465961, 1.765219, -1.622388, 1, 0, 0, 1, 1,
0.4513493, 0.3969349, -0.6363776, 1, 0, 0, 1, 1,
0.4515216, -0.02686726, 1.097923, 1, 0, 0, 1, 1,
0.457658, -1.126321, 1.762555, 1, 0, 0, 1, 1,
0.4581921, -1.20559, 2.472269, 0, 0, 0, 1, 1,
0.4745808, 0.8893632, -1.504624, 0, 0, 0, 1, 1,
0.4881938, 0.6949131, 1.421431, 0, 0, 0, 1, 1,
0.491586, -1.645383, 3.267579, 0, 0, 0, 1, 1,
0.4945515, -1.318784, 3.407923, 0, 0, 0, 1, 1,
0.4963154, -0.6488531, 3.606519, 0, 0, 0, 1, 1,
0.4978552, 0.9258783, 0.8098508, 0, 0, 0, 1, 1,
0.5014388, -0.9073028, 4.329689, 1, 1, 1, 1, 1,
0.5015057, 0.1913306, 2.178813, 1, 1, 1, 1, 1,
0.5054179, 0.0287133, 0.9925854, 1, 1, 1, 1, 1,
0.5059404, 0.4836166, 0.5317377, 1, 1, 1, 1, 1,
0.5088955, -0.3651024, 0.9582334, 1, 1, 1, 1, 1,
0.5094987, 0.9000831, 0.1318699, 1, 1, 1, 1, 1,
0.5108096, 0.7724571, 0.5038404, 1, 1, 1, 1, 1,
0.5110196, -0.03347915, 1.389703, 1, 1, 1, 1, 1,
0.5132299, -0.1067627, 0.8760728, 1, 1, 1, 1, 1,
0.5136527, 0.6162857, -1.116313, 1, 1, 1, 1, 1,
0.5156078, -1.145437, 2.545992, 1, 1, 1, 1, 1,
0.522938, -0.673029, 5.986844, 1, 1, 1, 1, 1,
0.5236382, 1.849157, 0.243878, 1, 1, 1, 1, 1,
0.5282542, -0.195277, 2.226759, 1, 1, 1, 1, 1,
0.5288857, 0.5275864, 1.15123, 1, 1, 1, 1, 1,
0.5372619, -0.4650139, 2.905625, 0, 0, 1, 1, 1,
0.538563, 1.669228, -1.001378, 1, 0, 0, 1, 1,
0.5387714, 0.7093665, 0.3763579, 1, 0, 0, 1, 1,
0.5389218, -0.5842816, 2.841294, 1, 0, 0, 1, 1,
0.5389459, 0.2089441, -1.372096, 1, 0, 0, 1, 1,
0.5413825, -0.273987, 2.205033, 1, 0, 0, 1, 1,
0.5434905, -0.7383763, 3.30614, 0, 0, 0, 1, 1,
0.5541129, 1.675783, -0.3499025, 0, 0, 0, 1, 1,
0.5562006, 0.7838683, -0.08712996, 0, 0, 0, 1, 1,
0.5616245, 0.4062854, 1.133899, 0, 0, 0, 1, 1,
0.569279, 1.547149, 1.064029, 0, 0, 0, 1, 1,
0.5714914, 0.6695018, -0.1620002, 0, 0, 0, 1, 1,
0.5724446, 0.9480237, -0.4362225, 0, 0, 0, 1, 1,
0.57249, 1.177646, 1.63513, 1, 1, 1, 1, 1,
0.574481, -1.146881, 5.76967, 1, 1, 1, 1, 1,
0.5749502, -0.1516851, 1.905011, 1, 1, 1, 1, 1,
0.575797, -2.011122, 3.198707, 1, 1, 1, 1, 1,
0.5761389, 0.3573375, 1.593582, 1, 1, 1, 1, 1,
0.577756, 0.6754947, 0.6752999, 1, 1, 1, 1, 1,
0.5782762, 1.460485, 0.3838592, 1, 1, 1, 1, 1,
0.578362, -1.401311, 1.855721, 1, 1, 1, 1, 1,
0.5786458, -0.4666218, 2.130818, 1, 1, 1, 1, 1,
0.5790305, 0.671159, 1.551323, 1, 1, 1, 1, 1,
0.5795096, 0.1410391, 0.9569471, 1, 1, 1, 1, 1,
0.5797663, 2.128861, -2.051312, 1, 1, 1, 1, 1,
0.5841179, 0.9977029, 1.548218, 1, 1, 1, 1, 1,
0.5843512, 0.1433049, 3.009179, 1, 1, 1, 1, 1,
0.5863798, 0.1736836, 1.988063, 1, 1, 1, 1, 1,
0.5873106, 1.028512, 0.9945096, 0, 0, 1, 1, 1,
0.5886229, -0.8935723, 1.086668, 1, 0, 0, 1, 1,
0.5892926, -1.132943, 2.878919, 1, 0, 0, 1, 1,
0.5938956, -0.3171769, 1.989496, 1, 0, 0, 1, 1,
0.5971199, 1.560181, -1.090472, 1, 0, 0, 1, 1,
0.600175, 0.226892, 0.5582054, 1, 0, 0, 1, 1,
0.6002142, -0.04349717, 2.831353, 0, 0, 0, 1, 1,
0.6005496, -0.884214, 1.818366, 0, 0, 0, 1, 1,
0.6005812, 0.9488311, -1.275905, 0, 0, 0, 1, 1,
0.6013865, -0.6876191, 3.204027, 0, 0, 0, 1, 1,
0.6017014, 0.7210572, 0.06728372, 0, 0, 0, 1, 1,
0.6096097, -2.076321, 3.242669, 0, 0, 0, 1, 1,
0.6098976, -0.1659692, 1.687567, 0, 0, 0, 1, 1,
0.6155319, 0.4807575, 1.065804, 1, 1, 1, 1, 1,
0.617247, -1.709546, 1.41731, 1, 1, 1, 1, 1,
0.6203297, -0.07474368, 1.373517, 1, 1, 1, 1, 1,
0.6324856, 1.149436, -1.895847, 1, 1, 1, 1, 1,
0.6442065, -0.9257734, 2.777544, 1, 1, 1, 1, 1,
0.6470862, -0.6200238, 0.6645086, 1, 1, 1, 1, 1,
0.6477941, 0.3390385, 1.34062, 1, 1, 1, 1, 1,
0.6532273, 1.704449, 1.519583, 1, 1, 1, 1, 1,
0.6551151, -0.07830308, 1.048971, 1, 1, 1, 1, 1,
0.6571146, 0.5598246, -0.1843136, 1, 1, 1, 1, 1,
0.6610714, 0.811762, -0.9464484, 1, 1, 1, 1, 1,
0.6616062, 0.5479241, 2.348231, 1, 1, 1, 1, 1,
0.6697066, 0.3106128, 1.487816, 1, 1, 1, 1, 1,
0.6702933, -0.5054753, 1.331694, 1, 1, 1, 1, 1,
0.6719298, 0.5850595, 0.242313, 1, 1, 1, 1, 1,
0.6851306, -0.804561, 1.410622, 0, 0, 1, 1, 1,
0.6885906, -0.9055592, 3.56589, 1, 0, 0, 1, 1,
0.6986718, 0.8972247, -0.01397913, 1, 0, 0, 1, 1,
0.7083414, 0.4129117, 2.302538, 1, 0, 0, 1, 1,
0.7088341, -1.061553, 1.992722, 1, 0, 0, 1, 1,
0.7094044, 0.4834209, 0.2441982, 1, 0, 0, 1, 1,
0.7095603, 1.645679, 0.8728883, 0, 0, 0, 1, 1,
0.7121874, -0.5890034, 2.193856, 0, 0, 0, 1, 1,
0.7168591, -0.5841582, 1.972355, 0, 0, 0, 1, 1,
0.7190014, 1.059722, -0.3996955, 0, 0, 0, 1, 1,
0.7195514, 0.2793862, 1.810816, 0, 0, 0, 1, 1,
0.7199022, -0.3934538, 1.668129, 0, 0, 0, 1, 1,
0.7202349, -1.585394, 2.800894, 0, 0, 0, 1, 1,
0.7224612, -0.6847983, 2.681728, 1, 1, 1, 1, 1,
0.7233859, 0.06002917, 0.7165474, 1, 1, 1, 1, 1,
0.7264655, -3.327395, 1.97685, 1, 1, 1, 1, 1,
0.7281319, 0.6084129, 1.971968, 1, 1, 1, 1, 1,
0.7363867, 1.537642, 0.9627438, 1, 1, 1, 1, 1,
0.7384018, 1.50277, -0.01973792, 1, 1, 1, 1, 1,
0.7403437, 0.8237067, 1.488236, 1, 1, 1, 1, 1,
0.7415665, 0.187498, 0.1267338, 1, 1, 1, 1, 1,
0.7489207, 0.8628269, 0.5585923, 1, 1, 1, 1, 1,
0.7521182, 1.616099, 0.7660189, 1, 1, 1, 1, 1,
0.7522443, -1.488679, 2.877413, 1, 1, 1, 1, 1,
0.7684591, 0.1070944, 2.280518, 1, 1, 1, 1, 1,
0.7687902, -0.3811324, 2.208987, 1, 1, 1, 1, 1,
0.7705807, -0.2359685, 2.224292, 1, 1, 1, 1, 1,
0.7783914, -0.120942, 1.062899, 1, 1, 1, 1, 1,
0.7786922, -0.3971339, 2.261317, 0, 0, 1, 1, 1,
0.7837719, -0.4750234, 1.213725, 1, 0, 0, 1, 1,
0.7843274, 0.2858451, 0.4749418, 1, 0, 0, 1, 1,
0.785067, -1.006875, 2.991536, 1, 0, 0, 1, 1,
0.7872247, -0.4648809, 1.090074, 1, 0, 0, 1, 1,
0.7891243, 0.547821, -0.2444577, 1, 0, 0, 1, 1,
0.7903506, 0.3705411, 2.474735, 0, 0, 0, 1, 1,
0.7903823, 1.584109, 2.567769, 0, 0, 0, 1, 1,
0.7928482, -1.57313, 4.021377, 0, 0, 0, 1, 1,
0.7980959, 0.9460659, 1.131635, 0, 0, 0, 1, 1,
0.7986999, 0.7899734, 0.6728936, 0, 0, 0, 1, 1,
0.8038729, 0.1349791, 2.861725, 0, 0, 0, 1, 1,
0.8064259, -0.7516791, 3.321361, 0, 0, 0, 1, 1,
0.8095363, 0.4198595, 1.199235, 1, 1, 1, 1, 1,
0.8095775, -0.5200449, 2.234401, 1, 1, 1, 1, 1,
0.8115667, 0.2169801, 0.9214801, 1, 1, 1, 1, 1,
0.8163566, 1.663991, 0.09418034, 1, 1, 1, 1, 1,
0.8165845, 1.39036, -0.3867904, 1, 1, 1, 1, 1,
0.8230388, 1.399161, -0.07436881, 1, 1, 1, 1, 1,
0.8247887, -1.690332, 3.84956, 1, 1, 1, 1, 1,
0.8312308, -1.106469, 1.259226, 1, 1, 1, 1, 1,
0.8318781, 0.003628693, 1.162059, 1, 1, 1, 1, 1,
0.8399358, -0.007077782, 1.102908, 1, 1, 1, 1, 1,
0.8432635, 2.385996, -0.8797645, 1, 1, 1, 1, 1,
0.8452734, -1.68226, 2.154514, 1, 1, 1, 1, 1,
0.8566474, -1.442763, 1.878478, 1, 1, 1, 1, 1,
0.8624508, -0.4867129, 1.630875, 1, 1, 1, 1, 1,
0.8670623, -0.7007896, 2.60189, 1, 1, 1, 1, 1,
0.8702132, 0.7297008, 1.258829, 0, 0, 1, 1, 1,
0.874329, 0.01733976, 1.136181, 1, 0, 0, 1, 1,
0.8861701, -1.463005, 2.97909, 1, 0, 0, 1, 1,
0.8966231, 0.9138928, 0.6208794, 1, 0, 0, 1, 1,
0.8992991, 1.558913, 0.1566954, 1, 0, 0, 1, 1,
0.9006856, 0.4865491, -0.529815, 1, 0, 0, 1, 1,
0.9027768, 0.5321705, 0.243553, 0, 0, 0, 1, 1,
0.9030145, -0.4053002, 2.562249, 0, 0, 0, 1, 1,
0.909252, -0.1320029, 1.670467, 0, 0, 0, 1, 1,
0.9120799, -1.967238, 3.62439, 0, 0, 0, 1, 1,
0.9146202, -0.03331207, 0.3224386, 0, 0, 0, 1, 1,
0.9222451, -1.245751, 1.293596, 0, 0, 0, 1, 1,
0.9283313, 0.1814242, 0.9884042, 0, 0, 0, 1, 1,
0.9332777, 0.320484, 1.456904, 1, 1, 1, 1, 1,
0.9373648, 0.01569278, 0.0781085, 1, 1, 1, 1, 1,
0.9379179, -1.844467, 2.31908, 1, 1, 1, 1, 1,
0.9395558, -0.2120716, 2.170276, 1, 1, 1, 1, 1,
0.9432711, -0.5531801, 2.240067, 1, 1, 1, 1, 1,
0.9522704, 0.2013361, 1.196032, 1, 1, 1, 1, 1,
0.9544843, 0.04611435, -0.2815829, 1, 1, 1, 1, 1,
0.9615912, 1.644393, 1.471227, 1, 1, 1, 1, 1,
0.9635879, -0.9620069, 1.915937, 1, 1, 1, 1, 1,
0.9639155, -0.3669889, 2.569654, 1, 1, 1, 1, 1,
0.9654274, -1.038025, 3.805763, 1, 1, 1, 1, 1,
0.9735227, 0.7162929, 1.094666, 1, 1, 1, 1, 1,
0.9890615, -0.669929, 3.539333, 1, 1, 1, 1, 1,
0.9917246, -0.9541621, 3.345685, 1, 1, 1, 1, 1,
0.992145, -0.3065762, 1.840457, 1, 1, 1, 1, 1,
0.9988744, 0.01834668, -0.1638598, 0, 0, 1, 1, 1,
1.007908, -0.5125594, 2.967971, 1, 0, 0, 1, 1,
1.008437, 1.962636, 1.012169, 1, 0, 0, 1, 1,
1.009336, 0.7168072, 0.6462315, 1, 0, 0, 1, 1,
1.019872, 1.721551, 0.1115197, 1, 0, 0, 1, 1,
1.022237, -0.88885, 2.377144, 1, 0, 0, 1, 1,
1.029375, 0.04837515, 2.057917, 0, 0, 0, 1, 1,
1.051118, 2.100129, 0.4223858, 0, 0, 0, 1, 1,
1.052647, -0.9156454, 1.01777, 0, 0, 0, 1, 1,
1.068223, -0.9063566, 0.364946, 0, 0, 0, 1, 1,
1.06857, 0.4449224, -0.07573645, 0, 0, 0, 1, 1,
1.084502, 2.133446, 1.396988, 0, 0, 0, 1, 1,
1.095125, -0.3812568, 0.06305882, 0, 0, 0, 1, 1,
1.095998, 1.552153, -0.08459844, 1, 1, 1, 1, 1,
1.112896, 0.7764481, 0.1019324, 1, 1, 1, 1, 1,
1.116485, -0.3063352, 1.907875, 1, 1, 1, 1, 1,
1.116586, 0.3274229, 0.8506886, 1, 1, 1, 1, 1,
1.120054, 1.070901, -0.2558595, 1, 1, 1, 1, 1,
1.121201, -2.116494, 3.052078, 1, 1, 1, 1, 1,
1.132758, -2.093507, 1.643526, 1, 1, 1, 1, 1,
1.136469, 0.531503, 0.9392611, 1, 1, 1, 1, 1,
1.136724, -0.06865124, 0.4944803, 1, 1, 1, 1, 1,
1.139224, 0.8112116, 0.695566, 1, 1, 1, 1, 1,
1.139368, 0.6131179, 1.287477, 1, 1, 1, 1, 1,
1.140432, -0.4143392, 2.10701, 1, 1, 1, 1, 1,
1.141147, 2.374325, 0.2917176, 1, 1, 1, 1, 1,
1.151928, -0.1427471, 2.721162, 1, 1, 1, 1, 1,
1.154848, 0.9906988, -0.2449459, 1, 1, 1, 1, 1,
1.156898, -0.8833376, 1.61484, 0, 0, 1, 1, 1,
1.157868, 1.182223, 0.2878444, 1, 0, 0, 1, 1,
1.159297, -0.04340892, 2.656759, 1, 0, 0, 1, 1,
1.161362, 0.06983995, 1.030147, 1, 0, 0, 1, 1,
1.16175, 0.2002854, 1.007674, 1, 0, 0, 1, 1,
1.162711, 0.4936339, 0.5734609, 1, 0, 0, 1, 1,
1.172868, -0.7390405, 2.030722, 0, 0, 0, 1, 1,
1.175275, -1.48753, 2.637327, 0, 0, 0, 1, 1,
1.198755, 0.3311754, 1.49028, 0, 0, 0, 1, 1,
1.204844, 1.624176, 0.5631754, 0, 0, 0, 1, 1,
1.205178, 1.300012, -0.1459092, 0, 0, 0, 1, 1,
1.219219, 0.4382626, 0.4895387, 0, 0, 0, 1, 1,
1.21967, -0.4952707, 2.446589, 0, 0, 0, 1, 1,
1.222234, -0.6917419, 2.400698, 1, 1, 1, 1, 1,
1.225817, -1.200459, 1.98441, 1, 1, 1, 1, 1,
1.23225, 0.2151643, 4.097059, 1, 1, 1, 1, 1,
1.233286, 0.9838032, 2.053065, 1, 1, 1, 1, 1,
1.234704, -0.5451975, 1.947077, 1, 1, 1, 1, 1,
1.277712, -1.364253, 2.168046, 1, 1, 1, 1, 1,
1.281195, -1.513023, 1.697798, 1, 1, 1, 1, 1,
1.283741, 0.1453292, 1.013797, 1, 1, 1, 1, 1,
1.290905, 1.091452, 0.2291027, 1, 1, 1, 1, 1,
1.292199, -0.05586736, 0.3112933, 1, 1, 1, 1, 1,
1.29827, 3.241384, 0.847214, 1, 1, 1, 1, 1,
1.300442, 0.2251032, 0.04530512, 1, 1, 1, 1, 1,
1.30101, 1.792749, 2.423155, 1, 1, 1, 1, 1,
1.302572, 1.430386, -0.001708632, 1, 1, 1, 1, 1,
1.306499, 0.3762392, 1.702386, 1, 1, 1, 1, 1,
1.312703, 0.09738269, 2.109905, 0, 0, 1, 1, 1,
1.317072, 1.152896, 0.1343304, 1, 0, 0, 1, 1,
1.317845, 1.43916, -0.5975588, 1, 0, 0, 1, 1,
1.321035, -0.3821071, 0.08902608, 1, 0, 0, 1, 1,
1.329599, 0.8824837, 1.058171, 1, 0, 0, 1, 1,
1.32964, 0.8113689, 2.214495, 1, 0, 0, 1, 1,
1.332798, -0.9548775, 3.106806, 0, 0, 0, 1, 1,
1.33428, 1.612697, 1.265742, 0, 0, 0, 1, 1,
1.34535, -0.7291163, 0.9099087, 0, 0, 0, 1, 1,
1.348541, 0.7542671, -0.2769963, 0, 0, 0, 1, 1,
1.350116, -0.6291727, 2.174834, 0, 0, 0, 1, 1,
1.371735, 0.1894337, 0.06379959, 0, 0, 0, 1, 1,
1.372702, 2.663644, 0.2592354, 0, 0, 0, 1, 1,
1.38048, 0.6421359, -0.4819378, 1, 1, 1, 1, 1,
1.383121, -0.1521882, 1.667413, 1, 1, 1, 1, 1,
1.396314, 0.7224104, 0.07405777, 1, 1, 1, 1, 1,
1.40205, 1.385999, 1.050562, 1, 1, 1, 1, 1,
1.403287, -0.9792101, 1.664554, 1, 1, 1, 1, 1,
1.403497, -1.202824, 3.080405, 1, 1, 1, 1, 1,
1.4062, -0.5163563, 1.798087, 1, 1, 1, 1, 1,
1.407359, -0.7287236, 2.185726, 1, 1, 1, 1, 1,
1.407543, -0.411086, 2.773561, 1, 1, 1, 1, 1,
1.408282, 0.4331806, 2.145019, 1, 1, 1, 1, 1,
1.423341, 1.252758, 0.1336426, 1, 1, 1, 1, 1,
1.424974, 0.03555587, 0.02301607, 1, 1, 1, 1, 1,
1.440189, -0.4473104, 2.958495, 1, 1, 1, 1, 1,
1.441729, -0.7876541, 1.092909, 1, 1, 1, 1, 1,
1.448349, 0.1346872, 0.6111493, 1, 1, 1, 1, 1,
1.450971, -1.018045, 2.084996, 0, 0, 1, 1, 1,
1.453279, 0.5578958, 1.258219, 1, 0, 0, 1, 1,
1.465392, -0.2558477, 2.121924, 1, 0, 0, 1, 1,
1.466369, -0.02546331, 1.364357, 1, 0, 0, 1, 1,
1.46645, 1.440888, 2.455278, 1, 0, 0, 1, 1,
1.473782, -0.2097474, 1.254653, 1, 0, 0, 1, 1,
1.473804, -0.6360939, 2.26603, 0, 0, 0, 1, 1,
1.48007, 1.153256, 0.5503812, 0, 0, 0, 1, 1,
1.485778, 1.323802, 1.191294, 0, 0, 0, 1, 1,
1.486559, 0.754885, 0.003870089, 0, 0, 0, 1, 1,
1.498877, -0.6796573, 3.536537, 0, 0, 0, 1, 1,
1.507926, -1.23296, 3.394618, 0, 0, 0, 1, 1,
1.511701, -0.9047126, 0.02779792, 0, 0, 0, 1, 1,
1.513898, -1.209655, 3.120402, 1, 1, 1, 1, 1,
1.531638, 0.3425914, 2.190734, 1, 1, 1, 1, 1,
1.534639, 2.012042, 1.486788, 1, 1, 1, 1, 1,
1.549984, 1.300889, 1.167822, 1, 1, 1, 1, 1,
1.574693, -1.510138, 2.215361, 1, 1, 1, 1, 1,
1.640044, 0.9660036, 1.109397, 1, 1, 1, 1, 1,
1.642016, -0.1619006, 0.8160763, 1, 1, 1, 1, 1,
1.652287, 0.809037, 2.846784, 1, 1, 1, 1, 1,
1.663501, -0.6199715, 3.793539, 1, 1, 1, 1, 1,
1.668295, -0.9708748, 3.217463, 1, 1, 1, 1, 1,
1.668453, 0.4770181, 0.0416946, 1, 1, 1, 1, 1,
1.679663, 1.391452, 1.315947, 1, 1, 1, 1, 1,
1.708529, 1.953249, 1.185032, 1, 1, 1, 1, 1,
1.711256, -1.729472, 2.794773, 1, 1, 1, 1, 1,
1.711849, 1.99457, 1.644294, 1, 1, 1, 1, 1,
1.713452, -0.04521222, 1.871819, 0, 0, 1, 1, 1,
1.747356, 0.823948, 1.661972, 1, 0, 0, 1, 1,
1.749826, -0.5019946, 3.006913, 1, 0, 0, 1, 1,
1.755598, 0.01387346, 2.301903, 1, 0, 0, 1, 1,
1.785009, -1.00582, 0.5722353, 1, 0, 0, 1, 1,
1.788252, 0.6088809, 0.2470368, 1, 0, 0, 1, 1,
1.813451, -0.5264636, 1.89226, 0, 0, 0, 1, 1,
1.829365, -0.3833525, 2.961037, 0, 0, 0, 1, 1,
1.84551, 1.96217, -0.04214885, 0, 0, 0, 1, 1,
1.854945, -0.1467875, 1.214794, 0, 0, 0, 1, 1,
1.869723, 0.0121942, 1.513882, 0, 0, 0, 1, 1,
1.885687, 1.613392, -0.1302319, 0, 0, 0, 1, 1,
1.886552, -1.060235, 2.427915, 0, 0, 0, 1, 1,
1.890925, -0.6114853, 3.577516, 1, 1, 1, 1, 1,
1.892104, -0.3484286, 2.938743, 1, 1, 1, 1, 1,
1.902139, 1.284576, 3.350038, 1, 1, 1, 1, 1,
1.903839, 1.304314, 1.978298, 1, 1, 1, 1, 1,
1.905315, 1.911115, 1.113365, 1, 1, 1, 1, 1,
1.912655, 1.501986, 2.505936, 1, 1, 1, 1, 1,
1.914813, 2.781692, -0.8537775, 1, 1, 1, 1, 1,
1.926311, 0.1457926, 2.872948, 1, 1, 1, 1, 1,
1.961837, -1.265246, 2.257303, 1, 1, 1, 1, 1,
1.964626, 1.164989, -2.262049, 1, 1, 1, 1, 1,
1.968891, -0.5067825, 2.172358, 1, 1, 1, 1, 1,
2.012304, -0.5261293, 2.805659, 1, 1, 1, 1, 1,
2.03623, -0.6238615, 0.4335451, 1, 1, 1, 1, 1,
2.041246, -0.8342766, 2.75088, 1, 1, 1, 1, 1,
2.099745, -0.04133605, 1.999233, 1, 1, 1, 1, 1,
2.129481, -0.8792888, 3.371735, 0, 0, 1, 1, 1,
2.138533, 0.1134493, 3.736248, 1, 0, 0, 1, 1,
2.141276, 0.2570008, 2.602576, 1, 0, 0, 1, 1,
2.171157, -2.211559, 3.416421, 1, 0, 0, 1, 1,
2.174885, -1.284437, 3.024222, 1, 0, 0, 1, 1,
2.1752, -2.012685, 3.829062, 1, 0, 0, 1, 1,
2.186749, -1.97817, 3.263179, 0, 0, 0, 1, 1,
2.199748, 1.600757, 1.558695, 0, 0, 0, 1, 1,
2.256507, -0.7189884, 0.7177775, 0, 0, 0, 1, 1,
2.316738, 0.4354905, 1.104542, 0, 0, 0, 1, 1,
2.382019, 1.215525, 0.2918274, 0, 0, 0, 1, 1,
2.478313, 0.6315325, 3.325929, 0, 0, 0, 1, 1,
2.577058, 0.9470453, 0.5622363, 0, 0, 0, 1, 1,
2.608027, 0.6276395, 1.560331, 1, 1, 1, 1, 1,
2.693957, -1.402755, 3.069601, 1, 1, 1, 1, 1,
2.753976, 0.8238803, 1.93809, 1, 1, 1, 1, 1,
2.965436, -0.03628815, 0.1415458, 1, 1, 1, 1, 1,
3.084966, -1.999787, 3.869443, 1, 1, 1, 1, 1,
3.125419, -0.6073621, 0.2296945, 1, 1, 1, 1, 1,
3.682414, 1.508668, 1.23358, 1, 1, 1, 1, 1
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
var radius = 9.876882;
var distance = 34.69213;
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
mvMatrix.translate( -0.2567291, 0.04300594, -0.4538918 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.69213);
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
