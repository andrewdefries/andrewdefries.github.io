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
-3.193191, -0.01874091, -0.6787333, 1, 0, 0, 1,
-3.130877, 1.309877, -0.9875342, 1, 0.007843138, 0, 1,
-3.043311, 1.23381, 0.1740252, 1, 0.01176471, 0, 1,
-2.853049, -0.7089483, -0.4988364, 1, 0.01960784, 0, 1,
-2.831323, 1.08447, -2.210719, 1, 0.02352941, 0, 1,
-2.771132, 0.8492591, -2.988161, 1, 0.03137255, 0, 1,
-2.679704, -1.241867, -1.70858, 1, 0.03529412, 0, 1,
-2.670101, -2.00386, -4.11901, 1, 0.04313726, 0, 1,
-2.645378, 0.3365897, -2.467641, 1, 0.04705882, 0, 1,
-2.579621, 1.183574, -0.9088562, 1, 0.05490196, 0, 1,
-2.567211, 0.348092, -0.4579256, 1, 0.05882353, 0, 1,
-2.54427, 2.08637, 0.7820765, 1, 0.06666667, 0, 1,
-2.388335, 1.502375, 0.02296316, 1, 0.07058824, 0, 1,
-2.350535, -0.01097651, -2.050913, 1, 0.07843138, 0, 1,
-2.338337, -0.4265759, -1.238531, 1, 0.08235294, 0, 1,
-2.328073, -0.3441961, -1.920227, 1, 0.09019608, 0, 1,
-2.320912, -0.07616804, -1.507606, 1, 0.09411765, 0, 1,
-2.277792, -0.06581579, -2.829452, 1, 0.1019608, 0, 1,
-2.259018, -0.8229563, -1.645426, 1, 0.1098039, 0, 1,
-2.256701, 0.1141245, -0.1036246, 1, 0.1137255, 0, 1,
-2.233465, -0.5488259, -2.335479, 1, 0.1215686, 0, 1,
-2.216277, 0.8021915, -1.395363, 1, 0.1254902, 0, 1,
-2.210958, -0.9316325, -2.422588, 1, 0.1333333, 0, 1,
-2.194886, 0.8965924, -0.3289311, 1, 0.1372549, 0, 1,
-2.184299, -0.08323181, -3.01154, 1, 0.145098, 0, 1,
-2.138305, -0.1151422, -1.296433, 1, 0.1490196, 0, 1,
-2.130328, 0.767237, -3.36919, 1, 0.1568628, 0, 1,
-2.104446, -0.2288627, -1.505727, 1, 0.1607843, 0, 1,
-2.098269, 0.9959145, 0.3228541, 1, 0.1686275, 0, 1,
-2.077057, 2.268044, 0.2599588, 1, 0.172549, 0, 1,
-2.059863, -0.7916742, -1.633769, 1, 0.1803922, 0, 1,
-2.01653, 0.426225, -3.839117, 1, 0.1843137, 0, 1,
-1.998393, 0.01400674, -1.2635, 1, 0.1921569, 0, 1,
-1.990488, -0.3556754, -0.7631812, 1, 0.1960784, 0, 1,
-1.981526, -0.9059415, -1.613929, 1, 0.2039216, 0, 1,
-1.979965, -0.3386614, -1.523067, 1, 0.2117647, 0, 1,
-1.965339, 0.1262359, -1.159636, 1, 0.2156863, 0, 1,
-1.943583, -1.529079, -2.146871, 1, 0.2235294, 0, 1,
-1.938166, -1.363187, -2.587824, 1, 0.227451, 0, 1,
-1.9348, 0.02920055, -2.46908, 1, 0.2352941, 0, 1,
-1.919592, -0.918918, -3.147163, 1, 0.2392157, 0, 1,
-1.913867, -0.3324654, -2.038619, 1, 0.2470588, 0, 1,
-1.894943, 1.344727, -0.1416242, 1, 0.2509804, 0, 1,
-1.864326, -1.402057, -1.231379, 1, 0.2588235, 0, 1,
-1.839877, -0.5635787, -2.048177, 1, 0.2627451, 0, 1,
-1.836236, 0.8334855, -1.445269, 1, 0.2705882, 0, 1,
-1.827111, -0.5950682, 0.261047, 1, 0.2745098, 0, 1,
-1.779612, -0.306119, -0.8320647, 1, 0.282353, 0, 1,
-1.771302, 1.813485, -1.378869, 1, 0.2862745, 0, 1,
-1.762995, -0.09373127, -2.745451, 1, 0.2941177, 0, 1,
-1.744715, 1.040955, -1.516477, 1, 0.3019608, 0, 1,
-1.724136, 0.76943, -0.1535693, 1, 0.3058824, 0, 1,
-1.722262, -1.51089, -3.133127, 1, 0.3137255, 0, 1,
-1.711555, 0.7498546, -1.918209, 1, 0.3176471, 0, 1,
-1.706782, 0.3895928, -1.706204, 1, 0.3254902, 0, 1,
-1.702522, -0.4617588, 0.03671191, 1, 0.3294118, 0, 1,
-1.690787, 0.01843718, -1.286106, 1, 0.3372549, 0, 1,
-1.676983, 0.9593401, -0.5633867, 1, 0.3411765, 0, 1,
-1.670078, 0.4898517, -0.8915569, 1, 0.3490196, 0, 1,
-1.670076, 1.071642, -2.235141, 1, 0.3529412, 0, 1,
-1.642854, 0.1788583, -1.119846, 1, 0.3607843, 0, 1,
-1.633685, -0.4723561, -1.259091, 1, 0.3647059, 0, 1,
-1.631654, 1.498036, -0.1277038, 1, 0.372549, 0, 1,
-1.619668, -0.3167589, -0.865855, 1, 0.3764706, 0, 1,
-1.618447, 2.568732, -0.3627153, 1, 0.3843137, 0, 1,
-1.610064, -0.04466894, -2.209777, 1, 0.3882353, 0, 1,
-1.6047, 0.8952979, -0.0584522, 1, 0.3960784, 0, 1,
-1.603376, 1.526108, -1.460786, 1, 0.4039216, 0, 1,
-1.580748, 1.955281, 0.751408, 1, 0.4078431, 0, 1,
-1.560382, -0.1969087, -1.449386, 1, 0.4156863, 0, 1,
-1.557851, -0.3697664, -1.131552, 1, 0.4196078, 0, 1,
-1.555183, 1.185346, -1.670704, 1, 0.427451, 0, 1,
-1.534396, -0.7032187, -1.321139, 1, 0.4313726, 0, 1,
-1.527919, -0.09312584, -2.856848, 1, 0.4392157, 0, 1,
-1.516446, 2.008546, -2.00529, 1, 0.4431373, 0, 1,
-1.507814, 0.6573962, -2.248639, 1, 0.4509804, 0, 1,
-1.496689, 1.161717, -0.7416389, 1, 0.454902, 0, 1,
-1.490204, 0.2087275, -1.434656, 1, 0.4627451, 0, 1,
-1.485764, 0.8817526, -0.8941553, 1, 0.4666667, 0, 1,
-1.470726, 0.7384295, -1.24264, 1, 0.4745098, 0, 1,
-1.462777, 0.9415063, -0.953349, 1, 0.4784314, 0, 1,
-1.451385, -0.03996538, 0.6690326, 1, 0.4862745, 0, 1,
-1.438738, 0.1175617, -0.9197663, 1, 0.4901961, 0, 1,
-1.433587, -0.3792575, -3.147762, 1, 0.4980392, 0, 1,
-1.426319, -0.1044384, 0.1610219, 1, 0.5058824, 0, 1,
-1.400299, 0.1199198, -0.6588535, 1, 0.509804, 0, 1,
-1.392729, -0.6123025, -2.41022, 1, 0.5176471, 0, 1,
-1.389486, 0.07456761, -1.383325, 1, 0.5215687, 0, 1,
-1.38474, 0.8911835, 0.3398861, 1, 0.5294118, 0, 1,
-1.384036, 0.5996553, -0.5610975, 1, 0.5333334, 0, 1,
-1.379753, -0.1498728, -1.95237, 1, 0.5411765, 0, 1,
-1.377336, 0.04030266, -1.425564, 1, 0.5450981, 0, 1,
-1.369787, -0.1296692, -0.5763212, 1, 0.5529412, 0, 1,
-1.369225, 0.05831725, -1.206018, 1, 0.5568628, 0, 1,
-1.342842, 1.561207, -1.898702, 1, 0.5647059, 0, 1,
-1.324949, 0.4044927, 0.04418156, 1, 0.5686275, 0, 1,
-1.324283, 1.074382, -1.686311, 1, 0.5764706, 0, 1,
-1.314968, 1.066955, -1.180813, 1, 0.5803922, 0, 1,
-1.314768, -0.1481163, -1.594444, 1, 0.5882353, 0, 1,
-1.311311, 1.686592, -1.035034, 1, 0.5921569, 0, 1,
-1.308311, -0.7903489, -3.818135, 1, 0.6, 0, 1,
-1.297024, -0.5301418, -3.119352, 1, 0.6078432, 0, 1,
-1.296519, -0.903575, -3.171438, 1, 0.6117647, 0, 1,
-1.288243, -0.2971365, -2.731389, 1, 0.6196079, 0, 1,
-1.263587, -0.2298079, -1.446731, 1, 0.6235294, 0, 1,
-1.261376, 1.527313, -0.3833406, 1, 0.6313726, 0, 1,
-1.259525, -0.5275176, -1.849367, 1, 0.6352941, 0, 1,
-1.248942, 0.3944504, -0.9862446, 1, 0.6431373, 0, 1,
-1.243173, -1.807603, -2.708976, 1, 0.6470588, 0, 1,
-1.236613, -0.1398536, -1.706371, 1, 0.654902, 0, 1,
-1.232516, -0.1711429, -2.459456, 1, 0.6588235, 0, 1,
-1.229839, 0.1121772, 0.4564067, 1, 0.6666667, 0, 1,
-1.212484, 0.8969733, -0.4491271, 1, 0.6705883, 0, 1,
-1.209835, -0.4661922, -2.290432, 1, 0.6784314, 0, 1,
-1.208873, 0.472863, -1.428066, 1, 0.682353, 0, 1,
-1.206548, 1.435586, -2.028352, 1, 0.6901961, 0, 1,
-1.20564, 1.76913, -1.004482, 1, 0.6941177, 0, 1,
-1.202455, -0.6823055, -2.068721, 1, 0.7019608, 0, 1,
-1.196143, -0.102505, -2.948355, 1, 0.7098039, 0, 1,
-1.195608, 0.01191444, -2.327583, 1, 0.7137255, 0, 1,
-1.186276, -0.6555665, -2.065825, 1, 0.7215686, 0, 1,
-1.184836, -2.13066, -2.4308, 1, 0.7254902, 0, 1,
-1.178835, 1.356461, -0.3511937, 1, 0.7333333, 0, 1,
-1.178405, -0.3391001, -1.308467, 1, 0.7372549, 0, 1,
-1.178169, -0.8039501, -1.856722, 1, 0.7450981, 0, 1,
-1.170196, -0.023731, -0.7171174, 1, 0.7490196, 0, 1,
-1.166656, 0.01090323, 0.621832, 1, 0.7568628, 0, 1,
-1.166156, 0.9330439, -2.504025, 1, 0.7607843, 0, 1,
-1.164059, -1.392812, -2.258673, 1, 0.7686275, 0, 1,
-1.162942, -0.1297081, -2.195738, 1, 0.772549, 0, 1,
-1.15957, 1.970295, 0.5739927, 1, 0.7803922, 0, 1,
-1.158943, 0.9252453, 0.3980488, 1, 0.7843137, 0, 1,
-1.158892, -0.836641, -2.470475, 1, 0.7921569, 0, 1,
-1.15134, 0.5502264, -2.721086, 1, 0.7960784, 0, 1,
-1.145265, 0.6837951, 1.169086, 1, 0.8039216, 0, 1,
-1.143332, 1.579837, -1.471934, 1, 0.8117647, 0, 1,
-1.140121, -0.7443724, -2.013529, 1, 0.8156863, 0, 1,
-1.136912, 0.3392459, 1.333381, 1, 0.8235294, 0, 1,
-1.130531, -1.020278, -3.119711, 1, 0.827451, 0, 1,
-1.126702, -0.3756131, -3.164153, 1, 0.8352941, 0, 1,
-1.123734, -0.1415559, -1.116984, 1, 0.8392157, 0, 1,
-1.119029, -0.1164084, -2.061118, 1, 0.8470588, 0, 1,
-1.116866, 0.704852, -2.019447, 1, 0.8509804, 0, 1,
-1.113847, 0.1186493, -1.283114, 1, 0.8588235, 0, 1,
-1.108343, -0.7547417, -1.656088, 1, 0.8627451, 0, 1,
-1.106533, -0.1596212, -1.430109, 1, 0.8705882, 0, 1,
-1.105409, -1.031571, -1.750716, 1, 0.8745098, 0, 1,
-1.099797, -0.1620833, -2.583647, 1, 0.8823529, 0, 1,
-1.099754, 0.1711773, -1.859952, 1, 0.8862745, 0, 1,
-1.095248, 1.496343, -1.396832, 1, 0.8941177, 0, 1,
-1.083819, -0.3182112, -1.750592, 1, 0.8980392, 0, 1,
-1.081184, -1.673417, -2.584101, 1, 0.9058824, 0, 1,
-1.080639, -0.1349961, -3.044749, 1, 0.9137255, 0, 1,
-1.076491, 0.6971515, -1.51455, 1, 0.9176471, 0, 1,
-1.072892, -0.07884981, -2.108719, 1, 0.9254902, 0, 1,
-1.067119, 0.1678285, -0.6990545, 1, 0.9294118, 0, 1,
-1.061772, 0.4400681, -1.317666, 1, 0.9372549, 0, 1,
-1.059376, -0.2928743, -2.650173, 1, 0.9411765, 0, 1,
-1.052436, 1.217209, -1.629107, 1, 0.9490196, 0, 1,
-1.050786, 0.9612693, -1.17597, 1, 0.9529412, 0, 1,
-1.050115, -0.4789994, -2.196461, 1, 0.9607843, 0, 1,
-1.044021, 0.2091402, -1.422829, 1, 0.9647059, 0, 1,
-1.043509, -0.06544814, -1.040886, 1, 0.972549, 0, 1,
-1.043347, -0.5530593, -2.091923, 1, 0.9764706, 0, 1,
-1.042383, 1.381791, 0.2403356, 1, 0.9843137, 0, 1,
-1.039072, -2.376277, -3.658469, 1, 0.9882353, 0, 1,
-1.034118, -1.381959, -4.491483, 1, 0.9960784, 0, 1,
-1.03063, -0.009876206, -1.252375, 0.9960784, 1, 0, 1,
-1.02737, -0.7658709, -2.349818, 0.9921569, 1, 0, 1,
-1.024361, -1.20887, -2.325534, 0.9843137, 1, 0, 1,
-1.020756, 1.141246, -0.1128393, 0.9803922, 1, 0, 1,
-1.01876, 1.417635, -1.613989, 0.972549, 1, 0, 1,
-1.015074, -1.414148, -0.8998911, 0.9686275, 1, 0, 1,
-1.008693, -1.956265, -1.472258, 0.9607843, 1, 0, 1,
-1.000704, -0.1357038, -0.06342841, 0.9568627, 1, 0, 1,
-0.9985895, 1.214122, -0.04418891, 0.9490196, 1, 0, 1,
-0.9983616, 0.2801113, 0.2236957, 0.945098, 1, 0, 1,
-0.9859239, -1.214024, -2.497448, 0.9372549, 1, 0, 1,
-0.9791704, 1.122013, -0.22631, 0.9333333, 1, 0, 1,
-0.9769059, 0.6617087, -0.07856422, 0.9254902, 1, 0, 1,
-0.9692194, 0.8642055, -1.213045, 0.9215686, 1, 0, 1,
-0.9640085, 2.947778, -0.2811104, 0.9137255, 1, 0, 1,
-0.9627181, 0.154706, -0.4588212, 0.9098039, 1, 0, 1,
-0.9622423, -0.6838228, -1.797802, 0.9019608, 1, 0, 1,
-0.9593306, 2.123642, -0.3265058, 0.8941177, 1, 0, 1,
-0.9534576, -2.234933, -4.659134, 0.8901961, 1, 0, 1,
-0.9522251, -1.111571, -3.611458, 0.8823529, 1, 0, 1,
-0.9438773, 1.634893, -0.1278689, 0.8784314, 1, 0, 1,
-0.9414712, -0.8142767, -1.924381, 0.8705882, 1, 0, 1,
-0.9399242, -0.1575406, -1.084121, 0.8666667, 1, 0, 1,
-0.9259902, 0.6022587, -2.5188, 0.8588235, 1, 0, 1,
-0.9258113, 1.12588, -0.3106223, 0.854902, 1, 0, 1,
-0.9246622, -0.08360812, -1.431348, 0.8470588, 1, 0, 1,
-0.9212515, -0.2558658, -3.58592, 0.8431373, 1, 0, 1,
-0.9200088, 1.209311, -0.3446966, 0.8352941, 1, 0, 1,
-0.9129754, -1.119802, -1.271351, 0.8313726, 1, 0, 1,
-0.9057453, 0.3793501, 0.1426667, 0.8235294, 1, 0, 1,
-0.8999799, -0.3931746, -1.610888, 0.8196079, 1, 0, 1,
-0.8951104, -0.7464867, -4.12676, 0.8117647, 1, 0, 1,
-0.8947302, -0.9627112, -0.2622494, 0.8078431, 1, 0, 1,
-0.894495, -0.707607, -3.471315, 0.8, 1, 0, 1,
-0.8789946, 0.04036742, -1.200431, 0.7921569, 1, 0, 1,
-0.8784696, 1.068116, -0.534273, 0.7882353, 1, 0, 1,
-0.8734542, -0.3932469, -1.449197, 0.7803922, 1, 0, 1,
-0.8681627, -0.5135127, -2.347049, 0.7764706, 1, 0, 1,
-0.8678831, 1.785616, 0.2027817, 0.7686275, 1, 0, 1,
-0.8602181, 0.8080391, -1.004206, 0.7647059, 1, 0, 1,
-0.8601884, 0.705626, -0.02286011, 0.7568628, 1, 0, 1,
-0.8492326, 1.199509, -0.06725921, 0.7529412, 1, 0, 1,
-0.8491704, 0.0405613, -2.805488, 0.7450981, 1, 0, 1,
-0.8485992, 0.9965911, -0.9855319, 0.7411765, 1, 0, 1,
-0.8459185, -0.8445875, -4.08529, 0.7333333, 1, 0, 1,
-0.8430225, 1.581805, -1.05218, 0.7294118, 1, 0, 1,
-0.840234, -0.1351102, -1.600989, 0.7215686, 1, 0, 1,
-0.8363455, 1.22566, -1.591879, 0.7176471, 1, 0, 1,
-0.831427, -1.251381, -4.441519, 0.7098039, 1, 0, 1,
-0.8255343, -0.7440522, -1.366033, 0.7058824, 1, 0, 1,
-0.8242774, -0.14169, -3.885964, 0.6980392, 1, 0, 1,
-0.8200791, 0.8085204, -1.919572, 0.6901961, 1, 0, 1,
-0.8176922, -0.01965033, -0.8587669, 0.6862745, 1, 0, 1,
-0.814734, -0.0692092, -1.419123, 0.6784314, 1, 0, 1,
-0.812522, 1.702827, 0.9110811, 0.6745098, 1, 0, 1,
-0.8105518, -0.9056613, -1.561651, 0.6666667, 1, 0, 1,
-0.8103587, 1.05521, 0.1541743, 0.6627451, 1, 0, 1,
-0.8102361, 1.36798, -0.7160061, 0.654902, 1, 0, 1,
-0.8094459, -0.9109432, -1.442937, 0.6509804, 1, 0, 1,
-0.808094, 1.559738, 0.02888945, 0.6431373, 1, 0, 1,
-0.8047714, -2.665431, -2.236866, 0.6392157, 1, 0, 1,
-0.7911891, 0.6478206, -1.760081, 0.6313726, 1, 0, 1,
-0.7894433, -1.103261, -2.179838, 0.627451, 1, 0, 1,
-0.7869505, -0.02480704, -1.939852, 0.6196079, 1, 0, 1,
-0.7849761, 2.376301, -1.439038, 0.6156863, 1, 0, 1,
-0.7817807, 0.7229716, -1.102056, 0.6078432, 1, 0, 1,
-0.777347, -0.2268617, -2.060309, 0.6039216, 1, 0, 1,
-0.7693363, -0.08713206, -2.255865, 0.5960785, 1, 0, 1,
-0.7682184, -1.005963, 0.0676571, 0.5882353, 1, 0, 1,
-0.7664015, -0.7696495, -0.7106224, 0.5843138, 1, 0, 1,
-0.7630794, -0.02455186, -0.9480287, 0.5764706, 1, 0, 1,
-0.7625259, 1.400425, -0.8338771, 0.572549, 1, 0, 1,
-0.7623907, 0.03517657, -2.044538, 0.5647059, 1, 0, 1,
-0.7612408, 0.4790635, 0.4256605, 0.5607843, 1, 0, 1,
-0.7500944, -0.2631237, -1.863566, 0.5529412, 1, 0, 1,
-0.7379324, -1.50614, -2.610018, 0.5490196, 1, 0, 1,
-0.7349541, 1.320129, 0.2237986, 0.5411765, 1, 0, 1,
-0.7344055, 0.2592801, -1.883806, 0.5372549, 1, 0, 1,
-0.7302992, 0.2717155, -2.337608, 0.5294118, 1, 0, 1,
-0.7298616, -0.4778777, -1.673663, 0.5254902, 1, 0, 1,
-0.7295076, -0.711443, -2.619835, 0.5176471, 1, 0, 1,
-0.7292603, 0.895305, 1.021637, 0.5137255, 1, 0, 1,
-0.7193613, -0.3540935, -2.008666, 0.5058824, 1, 0, 1,
-0.7175542, 1.01462, -0.9608161, 0.5019608, 1, 0, 1,
-0.7157215, -0.3205121, -3.408046, 0.4941176, 1, 0, 1,
-0.7061517, -1.016845, -3.299141, 0.4862745, 1, 0, 1,
-0.7008448, -2.381114, -3.768081, 0.4823529, 1, 0, 1,
-0.6960573, -0.3346648, -2.423212, 0.4745098, 1, 0, 1,
-0.6955426, -0.4985513, -1.592342, 0.4705882, 1, 0, 1,
-0.6955104, -0.5417266, -3.258, 0.4627451, 1, 0, 1,
-0.694477, 0.3152732, -0.1293549, 0.4588235, 1, 0, 1,
-0.6937971, -0.8942645, -2.047327, 0.4509804, 1, 0, 1,
-0.6916547, 0.2389116, -1.392632, 0.4470588, 1, 0, 1,
-0.6899979, -0.003287253, -1.206608, 0.4392157, 1, 0, 1,
-0.687509, 0.3628079, -2.150749, 0.4352941, 1, 0, 1,
-0.6871592, 1.242534, -1.205373, 0.427451, 1, 0, 1,
-0.6850914, 0.1272646, -0.6393719, 0.4235294, 1, 0, 1,
-0.6791155, 1.404045, -1.491513, 0.4156863, 1, 0, 1,
-0.6779114, 1.069046, 0.03728019, 0.4117647, 1, 0, 1,
-0.6693406, 0.4544188, -0.3496446, 0.4039216, 1, 0, 1,
-0.6683409, 0.8411598, -0.8861006, 0.3960784, 1, 0, 1,
-0.6679153, 0.575687, -1.992841, 0.3921569, 1, 0, 1,
-0.6654864, 0.617518, -2.322423, 0.3843137, 1, 0, 1,
-0.6596879, 1.012781, -1.408649, 0.3803922, 1, 0, 1,
-0.6596363, -1.778018, -3.569551, 0.372549, 1, 0, 1,
-0.6552367, 1.244324, 0.575036, 0.3686275, 1, 0, 1,
-0.6429579, 0.9893463, -1.186839, 0.3607843, 1, 0, 1,
-0.6416621, -0.3046119, -2.01983, 0.3568628, 1, 0, 1,
-0.6415359, -0.3768352, -2.978349, 0.3490196, 1, 0, 1,
-0.6394098, 0.7175485, -0.8429615, 0.345098, 1, 0, 1,
-0.637579, 0.2185072, -2.27672, 0.3372549, 1, 0, 1,
-0.6351172, -0.5925342, -1.607087, 0.3333333, 1, 0, 1,
-0.6308416, 0.8304772, 0.7738802, 0.3254902, 1, 0, 1,
-0.6283319, 0.5142416, -2.90888, 0.3215686, 1, 0, 1,
-0.6273778, 0.08375362, -0.7603549, 0.3137255, 1, 0, 1,
-0.6242955, 1.166273, -0.01937408, 0.3098039, 1, 0, 1,
-0.6228214, -0.2669742, -2.320426, 0.3019608, 1, 0, 1,
-0.6223367, -0.3923016, -4.024729, 0.2941177, 1, 0, 1,
-0.6158533, -1.277111, -1.160478, 0.2901961, 1, 0, 1,
-0.6118491, 0.6647401, -1.170047, 0.282353, 1, 0, 1,
-0.6026239, 1.653229, -2.4956, 0.2784314, 1, 0, 1,
-0.6000578, 0.5442912, 0.1141386, 0.2705882, 1, 0, 1,
-0.5998373, 0.001727018, -0.2025714, 0.2666667, 1, 0, 1,
-0.5984074, 0.4633231, -1.18213, 0.2588235, 1, 0, 1,
-0.5956417, 0.2284061, -0.5314575, 0.254902, 1, 0, 1,
-0.5888878, 0.8940532, 0.2740868, 0.2470588, 1, 0, 1,
-0.5850001, 1.817702, 0.06138735, 0.2431373, 1, 0, 1,
-0.5766901, 1.250901, -0.08319573, 0.2352941, 1, 0, 1,
-0.5765526, 0.5053791, -0.8169308, 0.2313726, 1, 0, 1,
-0.5764647, 0.5300137, -0.5268697, 0.2235294, 1, 0, 1,
-0.5750018, -0.271488, -2.613633, 0.2196078, 1, 0, 1,
-0.5712155, 0.6217646, 0.6868691, 0.2117647, 1, 0, 1,
-0.5691844, -0.8963523, -3.938408, 0.2078431, 1, 0, 1,
-0.5672032, -1.265932, -4.580054, 0.2, 1, 0, 1,
-0.5665459, -0.5937765, -1.55932, 0.1921569, 1, 0, 1,
-0.5656554, -0.3610933, -1.030795, 0.1882353, 1, 0, 1,
-0.5563872, -0.896718, -2.075289, 0.1803922, 1, 0, 1,
-0.5549527, -0.9862846, -1.35746, 0.1764706, 1, 0, 1,
-0.5433787, 1.138823, 0.6126804, 0.1686275, 1, 0, 1,
-0.5396104, -0.6701171, -1.152735, 0.1647059, 1, 0, 1,
-0.5363364, -1.185947, -2.032549, 0.1568628, 1, 0, 1,
-0.5269234, -0.7972097, -2.431918, 0.1529412, 1, 0, 1,
-0.5261205, -0.5950687, -3.327307, 0.145098, 1, 0, 1,
-0.52183, -1.316915, -3.211356, 0.1411765, 1, 0, 1,
-0.5168337, 1.020775, -0.4991017, 0.1333333, 1, 0, 1,
-0.5163949, 2.451766, -0.7074143, 0.1294118, 1, 0, 1,
-0.5139763, -0.8206789, -1.184528, 0.1215686, 1, 0, 1,
-0.511605, -1.033111, -0.7972177, 0.1176471, 1, 0, 1,
-0.507692, -0.7320531, -2.41287, 0.1098039, 1, 0, 1,
-0.5046166, -0.667938, -1.890483, 0.1058824, 1, 0, 1,
-0.5030643, 1.960988, -1.340435, 0.09803922, 1, 0, 1,
-0.5013297, 0.06398804, -0.5990183, 0.09019608, 1, 0, 1,
-0.5012829, -0.09205101, -2.6724, 0.08627451, 1, 0, 1,
-0.4965368, 0.0499225, -2.122077, 0.07843138, 1, 0, 1,
-0.4941345, 0.6837419, 1.071935, 0.07450981, 1, 0, 1,
-0.4888247, -0.1271917, -1.890772, 0.06666667, 1, 0, 1,
-0.4840378, -1.00682, -3.054722, 0.0627451, 1, 0, 1,
-0.4808794, -0.1050275, -0.5363265, 0.05490196, 1, 0, 1,
-0.4806142, -0.8617633, -3.045956, 0.05098039, 1, 0, 1,
-0.4780663, -0.8424463, -2.492497, 0.04313726, 1, 0, 1,
-0.4726168, -1.654465, -3.401338, 0.03921569, 1, 0, 1,
-0.470339, -0.9090371, -4.492433, 0.03137255, 1, 0, 1,
-0.4671536, 1.317362, 0.820036, 0.02745098, 1, 0, 1,
-0.465742, 0.2457223, -0.06694385, 0.01960784, 1, 0, 1,
-0.4529211, 0.05650778, -2.005806, 0.01568628, 1, 0, 1,
-0.4512893, 0.838162, -1.30092, 0.007843138, 1, 0, 1,
-0.445733, -0.1287763, -2.526551, 0.003921569, 1, 0, 1,
-0.4403211, 0.6909562, -1.210941, 0, 1, 0.003921569, 1,
-0.4375803, 0.690139, -1.194096, 0, 1, 0.01176471, 1,
-0.4341245, -2.059159, -2.38614, 0, 1, 0.01568628, 1,
-0.4331843, -2.301589, -1.869661, 0, 1, 0.02352941, 1,
-0.4308155, 0.9412304, -2.194522, 0, 1, 0.02745098, 1,
-0.4292286, 0.002488351, -1.58133, 0, 1, 0.03529412, 1,
-0.427772, 1.109132, -2.123533, 0, 1, 0.03921569, 1,
-0.4277282, -0.359675, -0.4402023, 0, 1, 0.04705882, 1,
-0.4275338, 0.2631048, 0.1066387, 0, 1, 0.05098039, 1,
-0.4215997, -0.1580923, -1.971923, 0, 1, 0.05882353, 1,
-0.4198734, 0.5615435, 0.8196489, 0, 1, 0.0627451, 1,
-0.4113547, 1.410818, 0.6461257, 0, 1, 0.07058824, 1,
-0.4104784, -0.6304571, -1.49901, 0, 1, 0.07450981, 1,
-0.4082756, -0.1970432, -2.413005, 0, 1, 0.08235294, 1,
-0.4049388, 1.135091, -1.088024, 0, 1, 0.08627451, 1,
-0.4034582, 0.8658819, -2.358581, 0, 1, 0.09411765, 1,
-0.3941818, 0.4612555, -0.4420021, 0, 1, 0.1019608, 1,
-0.391233, -3.040036, -1.982909, 0, 1, 0.1058824, 1,
-0.3900169, -0.3655213, -1.560494, 0, 1, 0.1137255, 1,
-0.3900119, 0.04437538, -1.216037, 0, 1, 0.1176471, 1,
-0.3886223, -1.389406, -3.049392, 0, 1, 0.1254902, 1,
-0.3826734, 0.8142218, 0.1454187, 0, 1, 0.1294118, 1,
-0.3819389, -0.5335374, -1.434032, 0, 1, 0.1372549, 1,
-0.3813184, 0.6862935, -0.8967572, 0, 1, 0.1411765, 1,
-0.3809381, -1.291013, -3.320001, 0, 1, 0.1490196, 1,
-0.3794321, -0.7155502, -2.779253, 0, 1, 0.1529412, 1,
-0.3778301, -0.9890071, -4.132096, 0, 1, 0.1607843, 1,
-0.3776587, -0.9014984, -3.278623, 0, 1, 0.1647059, 1,
-0.37443, 0.1866332, -1.759021, 0, 1, 0.172549, 1,
-0.3732035, 0.3007168, -0.462424, 0, 1, 0.1764706, 1,
-0.3721364, -0.7518268, -1.482803, 0, 1, 0.1843137, 1,
-0.3705409, 0.5549299, -1.672883, 0, 1, 0.1882353, 1,
-0.3689055, -0.7091569, -2.442993, 0, 1, 0.1960784, 1,
-0.3687596, -1.275963, -3.061258, 0, 1, 0.2039216, 1,
-0.3681868, 0.6983067, -0.4470853, 0, 1, 0.2078431, 1,
-0.365807, 0.5912389, -0.6936947, 0, 1, 0.2156863, 1,
-0.365465, 1.367338, -0.8326927, 0, 1, 0.2196078, 1,
-0.3646553, -0.8583479, -3.742303, 0, 1, 0.227451, 1,
-0.3642405, -0.7017854, -3.763059, 0, 1, 0.2313726, 1,
-0.3604715, -1.098424, -2.350564, 0, 1, 0.2392157, 1,
-0.3548766, -0.1116619, -1.355925, 0, 1, 0.2431373, 1,
-0.3530067, 1.390511, 1.021267, 0, 1, 0.2509804, 1,
-0.3465708, -0.1028254, -2.794893, 0, 1, 0.254902, 1,
-0.342436, 0.8725871, -1.233637, 0, 1, 0.2627451, 1,
-0.3392292, 1.172839, -2.163088, 0, 1, 0.2666667, 1,
-0.3379023, -0.8081563, -3.031598, 0, 1, 0.2745098, 1,
-0.3342999, 1.160033, -0.5218807, 0, 1, 0.2784314, 1,
-0.3277229, -0.04053615, -3.187313, 0, 1, 0.2862745, 1,
-0.3243871, -0.4606241, -2.466327, 0, 1, 0.2901961, 1,
-0.3206752, 0.9258811, -0.38986, 0, 1, 0.2980392, 1,
-0.318867, 0.7837418, 1.740611, 0, 1, 0.3058824, 1,
-0.3174263, 1.231434, -2.141927, 0, 1, 0.3098039, 1,
-0.3165932, -0.923991, -2.569035, 0, 1, 0.3176471, 1,
-0.31179, -0.3396131, -2.48246, 0, 1, 0.3215686, 1,
-0.3113943, 0.1955341, -1.482476, 0, 1, 0.3294118, 1,
-0.3102406, -0.04694055, -1.319526, 0, 1, 0.3333333, 1,
-0.3087248, -0.03160512, -0.7302759, 0, 1, 0.3411765, 1,
-0.3087014, -0.5114484, -2.719109, 0, 1, 0.345098, 1,
-0.3059551, 0.4225962, -0.3202793, 0, 1, 0.3529412, 1,
-0.3039983, -1.267184, -4.169988, 0, 1, 0.3568628, 1,
-0.3014061, -0.6948037, -2.900503, 0, 1, 0.3647059, 1,
-0.2960641, -1.132629, -3.932667, 0, 1, 0.3686275, 1,
-0.2921405, -0.04628139, -1.667291, 0, 1, 0.3764706, 1,
-0.2919579, 0.4255043, -0.04701135, 0, 1, 0.3803922, 1,
-0.291184, 0.1572692, -0.7651065, 0, 1, 0.3882353, 1,
-0.2826988, 0.6460511, 1.380808, 0, 1, 0.3921569, 1,
-0.2727785, 0.5528468, -0.3215536, 0, 1, 0.4, 1,
-0.2694447, 1.317979, -0.593959, 0, 1, 0.4078431, 1,
-0.2678491, 2.039604, -0.1247299, 0, 1, 0.4117647, 1,
-0.2567706, -0.7431834, -3.962104, 0, 1, 0.4196078, 1,
-0.2529087, 0.3390902, -0.1587198, 0, 1, 0.4235294, 1,
-0.2524493, 2.181061, -0.2810061, 0, 1, 0.4313726, 1,
-0.2452459, 0.6233335, 0.3279581, 0, 1, 0.4352941, 1,
-0.2376544, -0.4033085, -5.292768, 0, 1, 0.4431373, 1,
-0.2368097, -0.2978182, -2.527973, 0, 1, 0.4470588, 1,
-0.2364816, 0.6174192, 0.3069035, 0, 1, 0.454902, 1,
-0.2313329, -1.048222, -3.25791, 0, 1, 0.4588235, 1,
-0.2119268, -0.2429692, -3.729543, 0, 1, 0.4666667, 1,
-0.2089762, -1.393929, -4.43539, 0, 1, 0.4705882, 1,
-0.2076991, 0.4236267, -2.214787, 0, 1, 0.4784314, 1,
-0.2006528, -0.9666992, -4.76266, 0, 1, 0.4823529, 1,
-0.2005004, 1.306, -0.09703887, 0, 1, 0.4901961, 1,
-0.2004999, 0.3945845, 1.443563, 0, 1, 0.4941176, 1,
-0.2000562, -2.664029, -3.673716, 0, 1, 0.5019608, 1,
-0.197066, -0.05433346, -1.021841, 0, 1, 0.509804, 1,
-0.1924744, 0.148732, -1.91148, 0, 1, 0.5137255, 1,
-0.190599, -0.4784182, -3.352401, 0, 1, 0.5215687, 1,
-0.190071, 0.142095, -0.4766177, 0, 1, 0.5254902, 1,
-0.1881827, 1.020192, -0.7017381, 0, 1, 0.5333334, 1,
-0.187893, -1.274278, -2.447055, 0, 1, 0.5372549, 1,
-0.1831151, -0.4225718, -3.354068, 0, 1, 0.5450981, 1,
-0.1828227, -0.8412096, -1.478588, 0, 1, 0.5490196, 1,
-0.1809451, -0.0254455, -1.321574, 0, 1, 0.5568628, 1,
-0.1802734, -0.6241475, -1.185025, 0, 1, 0.5607843, 1,
-0.1790728, 0.02723736, -0.542771, 0, 1, 0.5686275, 1,
-0.1780142, 1.548352, 1.062379, 0, 1, 0.572549, 1,
-0.1772951, 0.6142813, -0.703895, 0, 1, 0.5803922, 1,
-0.1739323, -0.2088232, -2.875017, 0, 1, 0.5843138, 1,
-0.1716655, -0.7920554, -2.802951, 0, 1, 0.5921569, 1,
-0.1714012, 0.5802915, -0.6390886, 0, 1, 0.5960785, 1,
-0.1701253, 0.449522, 0.941921, 0, 1, 0.6039216, 1,
-0.152315, -1.183987, -3.144321, 0, 1, 0.6117647, 1,
-0.1505331, 0.2439811, -1.659058, 0, 1, 0.6156863, 1,
-0.1504033, -0.767627, -2.950413, 0, 1, 0.6235294, 1,
-0.1473961, -1.022556, -1.799989, 0, 1, 0.627451, 1,
-0.1464431, 0.2096673, -1.640903, 0, 1, 0.6352941, 1,
-0.1367497, 0.2829477, -0.8863754, 0, 1, 0.6392157, 1,
-0.1346217, 1.191156, 0.8754178, 0, 1, 0.6470588, 1,
-0.1344426, -0.79895, -2.017529, 0, 1, 0.6509804, 1,
-0.1327464, 0.3156149, -0.502456, 0, 1, 0.6588235, 1,
-0.127089, -0.02518363, -3.090122, 0, 1, 0.6627451, 1,
-0.1186232, -0.1557008, -1.862302, 0, 1, 0.6705883, 1,
-0.1171286, 0.5291914, -1.178717, 0, 1, 0.6745098, 1,
-0.1169085, 0.06814922, -1.137205, 0, 1, 0.682353, 1,
-0.1136578, -0.06658646, -2.514143, 0, 1, 0.6862745, 1,
-0.1119948, 0.7962261, -1.231391, 0, 1, 0.6941177, 1,
-0.1116304, 0.1882148, -1.226631, 0, 1, 0.7019608, 1,
-0.1092249, -1.321607, -4.167497, 0, 1, 0.7058824, 1,
-0.1086052, -0.1896213, -3.719737, 0, 1, 0.7137255, 1,
-0.1079881, -0.5064309, -2.985961, 0, 1, 0.7176471, 1,
-0.1045416, -1.237307, -2.726184, 0, 1, 0.7254902, 1,
-0.1018573, -1.123135, -4.969764, 0, 1, 0.7294118, 1,
-0.101086, 0.06112798, -1.574651, 0, 1, 0.7372549, 1,
-0.1007187, -0.9426175, -3.726557, 0, 1, 0.7411765, 1,
-0.08849473, 1.400063, 0.3285567, 0, 1, 0.7490196, 1,
-0.08729871, 1.506963, -1.224481, 0, 1, 0.7529412, 1,
-0.08632463, -0.3885068, -2.448298, 0, 1, 0.7607843, 1,
-0.08217052, -1.542721, -1.458724, 0, 1, 0.7647059, 1,
-0.07744377, -0.7198645, -2.975995, 0, 1, 0.772549, 1,
-0.0768486, 1.082063, -0.5150788, 0, 1, 0.7764706, 1,
-0.07578867, -1.52256, -3.090303, 0, 1, 0.7843137, 1,
-0.07436715, -1.140342, -3.417685, 0, 1, 0.7882353, 1,
-0.07228348, -0.7669554, -3.199396, 0, 1, 0.7960784, 1,
-0.07174533, -0.2050874, -2.204192, 0, 1, 0.8039216, 1,
-0.07059915, -1.488632, -4.065778, 0, 1, 0.8078431, 1,
-0.0634717, 1.688163, -0.02141654, 0, 1, 0.8156863, 1,
-0.0580636, 2.953782, 1.601904, 0, 1, 0.8196079, 1,
-0.05258777, 0.4755168, -0.03990346, 0, 1, 0.827451, 1,
-0.05132183, 0.04497674, -1.593379, 0, 1, 0.8313726, 1,
-0.04940606, 0.7515445, -0.9519638, 0, 1, 0.8392157, 1,
-0.04790257, -0.0911463, -3.178388, 0, 1, 0.8431373, 1,
-0.04732561, -0.3823241, -2.141787, 0, 1, 0.8509804, 1,
-0.04608334, -1.71122, -2.77444, 0, 1, 0.854902, 1,
-0.03053795, 0.4190069, -0.9675595, 0, 1, 0.8627451, 1,
-0.03009957, 0.2158494, -1.254514, 0, 1, 0.8666667, 1,
-0.03003385, -0.6347137, -1.369601, 0, 1, 0.8745098, 1,
-0.0271109, 0.04482108, -0.555329, 0, 1, 0.8784314, 1,
-0.02495966, 0.2432991, 0.02494251, 0, 1, 0.8862745, 1,
-0.02351709, 0.4196551, 0.6103066, 0, 1, 0.8901961, 1,
-0.02106899, -0.8794396, -2.778682, 0, 1, 0.8980392, 1,
-0.02009168, 1.069713, 0.7536588, 0, 1, 0.9058824, 1,
-0.01935051, 1.06821, -0.1330742, 0, 1, 0.9098039, 1,
-0.01763125, 0.5270065, 1.642246, 0, 1, 0.9176471, 1,
-0.01759041, 0.7158211, 1.775535, 0, 1, 0.9215686, 1,
-0.01713737, 0.319143, -0.3771912, 0, 1, 0.9294118, 1,
-0.01681549, 0.2276645, 1.171903, 0, 1, 0.9333333, 1,
-0.01675836, 0.9993472, -0.09992392, 0, 1, 0.9411765, 1,
-0.01215091, -0.08304519, -3.845672, 0, 1, 0.945098, 1,
-0.01027301, -0.104208, -3.297776, 0, 1, 0.9529412, 1,
-0.007656517, -0.1832671, -2.665236, 0, 1, 0.9568627, 1,
-0.004074542, -1.122628, -3.255135, 0, 1, 0.9647059, 1,
-0.002198093, 0.3375269, -1.71265, 0, 1, 0.9686275, 1,
-0.001648455, -1.121131, -3.153832, 0, 1, 0.9764706, 1,
5.851341e-05, -1.543613, 2.159892, 0, 1, 0.9803922, 1,
0.00110197, -0.4698869, 4.15837, 0, 1, 0.9882353, 1,
0.009506078, -0.5089576, 2.940051, 0, 1, 0.9921569, 1,
0.01041182, 1.334664, -0.01005387, 0, 1, 1, 1,
0.02016507, 0.7202286, -0.9016052, 0, 0.9921569, 1, 1,
0.02208393, 0.1580144, 1.449968, 0, 0.9882353, 1, 1,
0.0252885, -1.669393, 3.262124, 0, 0.9803922, 1, 1,
0.02784832, -0.9463534, 3.065717, 0, 0.9764706, 1, 1,
0.03095937, 0.1761265, -0.4603895, 0, 0.9686275, 1, 1,
0.0330278, -2.182974, 4.259139, 0, 0.9647059, 1, 1,
0.03328479, -0.8554475, 2.433445, 0, 0.9568627, 1, 1,
0.03417375, -1.384881, 4.274397, 0, 0.9529412, 1, 1,
0.03600561, -0.8641209, 2.511293, 0, 0.945098, 1, 1,
0.03822544, 0.7492109, -0.8493494, 0, 0.9411765, 1, 1,
0.03835859, -0.2224969, 3.314191, 0, 0.9333333, 1, 1,
0.04003653, 0.05979611, 2.126985, 0, 0.9294118, 1, 1,
0.04074335, 1.046772, 0.3103275, 0, 0.9215686, 1, 1,
0.05354569, 0.0057801, 2.223983, 0, 0.9176471, 1, 1,
0.0551424, 1.093478, -0.1414884, 0, 0.9098039, 1, 1,
0.05681548, -1.337715, 3.395463, 0, 0.9058824, 1, 1,
0.0575978, 0.2101058, 0.06931207, 0, 0.8980392, 1, 1,
0.06624503, 0.2851465, -0.05802384, 0, 0.8901961, 1, 1,
0.06735121, -0.08406021, 2.668871, 0, 0.8862745, 1, 1,
0.07237074, 0.3065793, 1.988526, 0, 0.8784314, 1, 1,
0.0736789, 0.5901785, -0.186559, 0, 0.8745098, 1, 1,
0.07667394, -0.2634365, 2.141501, 0, 0.8666667, 1, 1,
0.07997946, 0.8128933, -1.087756, 0, 0.8627451, 1, 1,
0.08040734, -0.9854258, 3.470219, 0, 0.854902, 1, 1,
0.08449276, 0.2598775, 2.765425, 0, 0.8509804, 1, 1,
0.0851337, -0.9313251, 1.246806, 0, 0.8431373, 1, 1,
0.08666677, 1.134055, 0.7491503, 0, 0.8392157, 1, 1,
0.08674812, 1.451895, 0.8592536, 0, 0.8313726, 1, 1,
0.09036538, -0.552351, 4.954628, 0, 0.827451, 1, 1,
0.09463454, 0.5388476, 1.448781, 0, 0.8196079, 1, 1,
0.09487756, 0.4961255, 0.6038885, 0, 0.8156863, 1, 1,
0.1004841, -0.04664537, 0.9259104, 0, 0.8078431, 1, 1,
0.1008821, -0.2211663, 2.663593, 0, 0.8039216, 1, 1,
0.1025473, -0.8213139, 3.765562, 0, 0.7960784, 1, 1,
0.1041503, 0.6131482, 0.2379857, 0, 0.7882353, 1, 1,
0.1095119, -0.1887355, 3.054069, 0, 0.7843137, 1, 1,
0.1104207, -0.4569521, 2.135551, 0, 0.7764706, 1, 1,
0.1135428, -0.2333497, 2.044441, 0, 0.772549, 1, 1,
0.1196165, 0.8908408, 1.526039, 0, 0.7647059, 1, 1,
0.1267727, 1.250902, 0.8490914, 0, 0.7607843, 1, 1,
0.1298078, 0.4796052, 0.5333567, 0, 0.7529412, 1, 1,
0.1326251, 0.3909816, -1.025571, 0, 0.7490196, 1, 1,
0.1346277, 0.421999, 1.511395, 0, 0.7411765, 1, 1,
0.1360006, 0.9650075, -0.07229193, 0, 0.7372549, 1, 1,
0.1362953, -0.7620426, 2.769053, 0, 0.7294118, 1, 1,
0.1380542, -1.002761, 2.967609, 0, 0.7254902, 1, 1,
0.1384648, -0.5711548, 2.283276, 0, 0.7176471, 1, 1,
0.1451323, -0.7251727, 3.026209, 0, 0.7137255, 1, 1,
0.1458363, 0.9408853, 0.1803351, 0, 0.7058824, 1, 1,
0.1462618, 1.141561, -0.2711062, 0, 0.6980392, 1, 1,
0.1470059, -1.618286, 2.366244, 0, 0.6941177, 1, 1,
0.1473277, -1.618863, 2.503931, 0, 0.6862745, 1, 1,
0.1540628, -0.2563567, 3.976692, 0, 0.682353, 1, 1,
0.1541356, -0.8947682, 4.453954, 0, 0.6745098, 1, 1,
0.1578861, 1.108579, -1.670251, 0, 0.6705883, 1, 1,
0.1666674, 1.632832, 1.990636, 0, 0.6627451, 1, 1,
0.1667628, 2.056909, 0.07384191, 0, 0.6588235, 1, 1,
0.1756644, -1.843848, 3.558189, 0, 0.6509804, 1, 1,
0.1822142, 0.6469173, -0.9323182, 0, 0.6470588, 1, 1,
0.1864944, 0.7767681, 2.255825, 0, 0.6392157, 1, 1,
0.1867804, -0.6690426, 3.056584, 0, 0.6352941, 1, 1,
0.1869477, -0.9306586, 2.647729, 0, 0.627451, 1, 1,
0.1890892, 0.7692151, -0.5766062, 0, 0.6235294, 1, 1,
0.1907781, 0.6963668, 1.185045, 0, 0.6156863, 1, 1,
0.1931079, 0.2478677, -0.4282023, 0, 0.6117647, 1, 1,
0.1947337, -2.721705, 3.226769, 0, 0.6039216, 1, 1,
0.1970472, 0.4048831, 1.523574, 0, 0.5960785, 1, 1,
0.2064817, 2.33775, -1.120127, 0, 0.5921569, 1, 1,
0.2064916, 0.9079114, -0.43039, 0, 0.5843138, 1, 1,
0.2120096, -0.5713067, 2.455812, 0, 0.5803922, 1, 1,
0.2164236, 0.8059416, -2.5866, 0, 0.572549, 1, 1,
0.2204549, 0.2087997, 2.092471, 0, 0.5686275, 1, 1,
0.2340398, 0.8228241, 1.958741, 0, 0.5607843, 1, 1,
0.2341534, 0.7149884, -1.669924, 0, 0.5568628, 1, 1,
0.2396807, -1.077572, 3.250973, 0, 0.5490196, 1, 1,
0.2443735, -1.172283, 3.231265, 0, 0.5450981, 1, 1,
0.2526708, -0.6367515, 2.995938, 0, 0.5372549, 1, 1,
0.2580826, 0.2971107, -0.2217823, 0, 0.5333334, 1, 1,
0.2593539, -1.165314, 2.617541, 0, 0.5254902, 1, 1,
0.2593698, -0.2051604, 1.404377, 0, 0.5215687, 1, 1,
0.26015, -1.40354, 3.531248, 0, 0.5137255, 1, 1,
0.2636426, -0.6505786, 2.920814, 0, 0.509804, 1, 1,
0.2711321, 0.4327088, -1.716107, 0, 0.5019608, 1, 1,
0.2718, -0.09848986, 2.880962, 0, 0.4941176, 1, 1,
0.2719164, 0.04416068, 0.6892281, 0, 0.4901961, 1, 1,
0.2720564, -0.01009482, 2.211994, 0, 0.4823529, 1, 1,
0.2752727, -1.355855, 4.671211, 0, 0.4784314, 1, 1,
0.2759238, -0.4868216, 3.828508, 0, 0.4705882, 1, 1,
0.2788447, -0.2453863, 1.966756, 0, 0.4666667, 1, 1,
0.2789282, -0.6133529, 2.440633, 0, 0.4588235, 1, 1,
0.2821909, -0.2515102, 2.1945, 0, 0.454902, 1, 1,
0.2826881, -0.04179307, 2.955241, 0, 0.4470588, 1, 1,
0.2864946, -0.6847187, 1.379155, 0, 0.4431373, 1, 1,
0.2882695, 0.9984295, 3.16678, 0, 0.4352941, 1, 1,
0.2921539, 0.6885431, 0.08435526, 0, 0.4313726, 1, 1,
0.2933968, -1.417623, 3.643726, 0, 0.4235294, 1, 1,
0.296119, -0.7854281, 4.021865, 0, 0.4196078, 1, 1,
0.2997309, 1.446355, 0.567221, 0, 0.4117647, 1, 1,
0.3010016, 0.2792863, -0.5491464, 0, 0.4078431, 1, 1,
0.3074338, -0.03965844, -0.548305, 0, 0.4, 1, 1,
0.3095262, 1.064668, 0.9072195, 0, 0.3921569, 1, 1,
0.313301, -0.2246088, 3.169848, 0, 0.3882353, 1, 1,
0.3137922, -1.722988, 3.854166, 0, 0.3803922, 1, 1,
0.3157883, 0.1518145, 1.558018, 0, 0.3764706, 1, 1,
0.3167262, 1.095735, -0.2067043, 0, 0.3686275, 1, 1,
0.3181027, -0.4146994, 2.115997, 0, 0.3647059, 1, 1,
0.3248889, -1.087454, 1.739954, 0, 0.3568628, 1, 1,
0.3262942, 1.634174, -1.0792, 0, 0.3529412, 1, 1,
0.3283108, -0.6965918, 3.89012, 0, 0.345098, 1, 1,
0.3313144, 0.4442504, 0.5956861, 0, 0.3411765, 1, 1,
0.3314907, 0.7286538, 0.799944, 0, 0.3333333, 1, 1,
0.3322979, -0.8594125, 1.444811, 0, 0.3294118, 1, 1,
0.3329332, -0.7803957, 3.037338, 0, 0.3215686, 1, 1,
0.3357344, 0.4740095, -0.4160051, 0, 0.3176471, 1, 1,
0.340346, -1.47638, 3.194227, 0, 0.3098039, 1, 1,
0.3417912, 0.006748434, 2.104878, 0, 0.3058824, 1, 1,
0.3440944, 0.9757878, -1.588959, 0, 0.2980392, 1, 1,
0.3462867, 0.2220314, 0.965042, 0, 0.2901961, 1, 1,
0.3534122, 0.9437315, -1.542542, 0, 0.2862745, 1, 1,
0.3542153, 0.1918273, 3.040576, 0, 0.2784314, 1, 1,
0.3558342, 2.39631, 0.4179252, 0, 0.2745098, 1, 1,
0.3589279, 1.465659, -0.4498498, 0, 0.2666667, 1, 1,
0.365215, 0.3985851, 1.592407, 0, 0.2627451, 1, 1,
0.3702761, -1.1895, 3.404332, 0, 0.254902, 1, 1,
0.3810766, -0.4252147, 2.089941, 0, 0.2509804, 1, 1,
0.3814248, 1.80498, 0.9114604, 0, 0.2431373, 1, 1,
0.3816972, -0.5178068, 1.442298, 0, 0.2392157, 1, 1,
0.3851846, 0.5078489, 1.191164, 0, 0.2313726, 1, 1,
0.3858502, -0.1987575, 0.8169435, 0, 0.227451, 1, 1,
0.3866754, -1.229179, 4.07238, 0, 0.2196078, 1, 1,
0.390817, -0.7374381, 2.670234, 0, 0.2156863, 1, 1,
0.3920527, -1.397726, 2.087662, 0, 0.2078431, 1, 1,
0.3922122, 1.866924, -0.1914864, 0, 0.2039216, 1, 1,
0.3939016, -1.726117, 3.963552, 0, 0.1960784, 1, 1,
0.4016797, 0.09475137, 0.8605538, 0, 0.1882353, 1, 1,
0.4062632, 0.3015505, 1.138563, 0, 0.1843137, 1, 1,
0.4074246, 0.5628772, 0.9599766, 0, 0.1764706, 1, 1,
0.4115996, -0.06753125, 1.522295, 0, 0.172549, 1, 1,
0.4133765, -0.1890927, 1.734444, 0, 0.1647059, 1, 1,
0.4149536, -0.9804712, 1.710102, 0, 0.1607843, 1, 1,
0.4160364, 0.1387882, 0.5080236, 0, 0.1529412, 1, 1,
0.4187205, 1.19139, -0.5968033, 0, 0.1490196, 1, 1,
0.4204958, 0.632045, 0.5714692, 0, 0.1411765, 1, 1,
0.4211463, -0.9522222, 1.698881, 0, 0.1372549, 1, 1,
0.4223971, 1.670541, 0.4740009, 0, 0.1294118, 1, 1,
0.4264016, 0.746667, -0.3323559, 0, 0.1254902, 1, 1,
0.427146, -0.7374172, 1.939747, 0, 0.1176471, 1, 1,
0.4284442, -1.012622, 2.434619, 0, 0.1137255, 1, 1,
0.4294373, 0.3185855, 0.9810994, 0, 0.1058824, 1, 1,
0.4387601, -0.19483, 1.39685, 0, 0.09803922, 1, 1,
0.4453455, 0.8995014, -0.4101515, 0, 0.09411765, 1, 1,
0.4487303, 0.3905953, 0.714459, 0, 0.08627451, 1, 1,
0.4532653, 0.6824102, 0.7169877, 0, 0.08235294, 1, 1,
0.4536277, -0.8825972, 2.921767, 0, 0.07450981, 1, 1,
0.4577067, -1.37194, 2.801729, 0, 0.07058824, 1, 1,
0.4582053, 0.8312265, -0.1805677, 0, 0.0627451, 1, 1,
0.4596773, -0.5000682, 4.152498, 0, 0.05882353, 1, 1,
0.4643397, 0.4785583, -0.9791799, 0, 0.05098039, 1, 1,
0.4718405, 0.5433016, 0.06809727, 0, 0.04705882, 1, 1,
0.4742612, 0.9926718, -1.69684, 0, 0.03921569, 1, 1,
0.4764942, -1.595791, 1.175289, 0, 0.03529412, 1, 1,
0.4814516, -1.522566, 2.474699, 0, 0.02745098, 1, 1,
0.4829809, -1.000764, 2.819744, 0, 0.02352941, 1, 1,
0.4847108, 0.5119182, -0.3522728, 0, 0.01568628, 1, 1,
0.4859435, -0.8113171, 2.537635, 0, 0.01176471, 1, 1,
0.4859721, -1.068473, 1.469371, 0, 0.003921569, 1, 1,
0.486326, -0.3953395, 5.192571, 0.003921569, 0, 1, 1,
0.4864806, 0.2005663, 0.4441459, 0.007843138, 0, 1, 1,
0.4870365, 0.9164777, 1.187722, 0.01568628, 0, 1, 1,
0.4876799, 1.056591, 0.34616, 0.01960784, 0, 1, 1,
0.4935819, 1.925981, -0.6550446, 0.02745098, 0, 1, 1,
0.4953738, -0.7229133, 0.1690101, 0.03137255, 0, 1, 1,
0.4958321, -1.917496, 3.215146, 0.03921569, 0, 1, 1,
0.4979488, -0.9070628, 2.07706, 0.04313726, 0, 1, 1,
0.4993542, 1.240684, 1.077368, 0.05098039, 0, 1, 1,
0.5003061, -0.5664759, 4.519433, 0.05490196, 0, 1, 1,
0.5026167, 0.3537086, -0.9197987, 0.0627451, 0, 1, 1,
0.505831, -0.06070812, -0.2237774, 0.06666667, 0, 1, 1,
0.5126132, -0.7863638, 0.8216058, 0.07450981, 0, 1, 1,
0.520291, 0.6597177, 1.107951, 0.07843138, 0, 1, 1,
0.5321872, 1.440369, 1.261876, 0.08627451, 0, 1, 1,
0.5325021, 0.0007817994, 1.662259, 0.09019608, 0, 1, 1,
0.5345272, -0.6891688, 3.748087, 0.09803922, 0, 1, 1,
0.5356153, 1.06284, 0.3408375, 0.1058824, 0, 1, 1,
0.5415102, -2.143444, 2.383962, 0.1098039, 0, 1, 1,
0.545743, 0.1128204, 3.23792, 0.1176471, 0, 1, 1,
0.5542048, -0.3987182, 1.868891, 0.1215686, 0, 1, 1,
0.5562824, 0.3661445, -0.2139781, 0.1294118, 0, 1, 1,
0.5573982, 0.6438237, -0.01048795, 0.1333333, 0, 1, 1,
0.559773, 0.3772445, 2.787019, 0.1411765, 0, 1, 1,
0.5653514, 0.709165, -0.4251808, 0.145098, 0, 1, 1,
0.5695753, -1.023268, 2.635386, 0.1529412, 0, 1, 1,
0.5708171, -0.8496432, 2.607129, 0.1568628, 0, 1, 1,
0.5858473, -1.09178, 3.616858, 0.1647059, 0, 1, 1,
0.6002924, 1.153179, 1.112759, 0.1686275, 0, 1, 1,
0.6005575, -0.6551463, 1.508352, 0.1764706, 0, 1, 1,
0.6031701, -0.9616886, 2.718303, 0.1803922, 0, 1, 1,
0.6081029, 1.181784, 0.7218012, 0.1882353, 0, 1, 1,
0.6109569, -1.101475, 0.1232428, 0.1921569, 0, 1, 1,
0.6115924, 0.8857338, 1.095773, 0.2, 0, 1, 1,
0.6119301, 0.03423058, 0.7750813, 0.2078431, 0, 1, 1,
0.6131871, -0.3416434, 2.196773, 0.2117647, 0, 1, 1,
0.613516, 1.073453, 2.55389, 0.2196078, 0, 1, 1,
0.6160623, 0.9427289, 0.5154147, 0.2235294, 0, 1, 1,
0.6243039, 1.705949, 0.2185433, 0.2313726, 0, 1, 1,
0.6257225, -0.5310308, 2.673107, 0.2352941, 0, 1, 1,
0.6280102, 0.3342299, 1.596512, 0.2431373, 0, 1, 1,
0.62948, -0.4262, 3.331333, 0.2470588, 0, 1, 1,
0.6302104, 0.5470643, -0.8518487, 0.254902, 0, 1, 1,
0.6335174, -0.3001996, 1.266587, 0.2588235, 0, 1, 1,
0.6412017, -0.419993, 1.643669, 0.2666667, 0, 1, 1,
0.6420898, 1.136537, 0.03442895, 0.2705882, 0, 1, 1,
0.6438305, -0.2587717, 2.442342, 0.2784314, 0, 1, 1,
0.653801, -1.569952, 2.698999, 0.282353, 0, 1, 1,
0.6555247, -0.1647245, 2.296632, 0.2901961, 0, 1, 1,
0.6555648, -0.07934858, 3.10206, 0.2941177, 0, 1, 1,
0.659665, -0.3564074, 1.885959, 0.3019608, 0, 1, 1,
0.662605, -2.339006, 2.441466, 0.3098039, 0, 1, 1,
0.6634222, -0.1710736, 2.069725, 0.3137255, 0, 1, 1,
0.6639599, -2.628823, 1.211572, 0.3215686, 0, 1, 1,
0.6652909, -0.1285977, 1.077765, 0.3254902, 0, 1, 1,
0.6691389, 0.3918119, 0.265046, 0.3333333, 0, 1, 1,
0.6708721, -0.7266523, 1.792499, 0.3372549, 0, 1, 1,
0.6708795, -0.2327781, 1.607662, 0.345098, 0, 1, 1,
0.671122, 0.9988365, -0.4147465, 0.3490196, 0, 1, 1,
0.6741273, 1.661885, -0.4520053, 0.3568628, 0, 1, 1,
0.6768361, -0.2018974, 1.867943, 0.3607843, 0, 1, 1,
0.6774486, -0.1080745, 1.550696, 0.3686275, 0, 1, 1,
0.6828073, -2.036191, 1.681633, 0.372549, 0, 1, 1,
0.6834779, -0.3524712, 2.576154, 0.3803922, 0, 1, 1,
0.687242, 0.8118592, 1.682586, 0.3843137, 0, 1, 1,
0.691097, -0.9671868, 3.970071, 0.3921569, 0, 1, 1,
0.6936222, 0.09630439, 1.954172, 0.3960784, 0, 1, 1,
0.6958573, -2.980819, 2.487152, 0.4039216, 0, 1, 1,
0.6963148, -1.304587, 2.969474, 0.4117647, 0, 1, 1,
0.6988006, 0.05140184, 2.558883, 0.4156863, 0, 1, 1,
0.7010046, 0.544583, 0.0104396, 0.4235294, 0, 1, 1,
0.7059672, 0.903551, 0.6223696, 0.427451, 0, 1, 1,
0.7061158, -0.308213, 1.699074, 0.4352941, 0, 1, 1,
0.7112392, 0.717412, 1.33386, 0.4392157, 0, 1, 1,
0.7151179, 0.6997314, 0.4685594, 0.4470588, 0, 1, 1,
0.7154963, 0.4767864, 1.986941, 0.4509804, 0, 1, 1,
0.7164813, 0.6034341, 2.62176, 0.4588235, 0, 1, 1,
0.7208501, -0.8391163, 2.903043, 0.4627451, 0, 1, 1,
0.7229462, 0.7322218, -0.04535953, 0.4705882, 0, 1, 1,
0.7233708, 0.9091546, 0.8346434, 0.4745098, 0, 1, 1,
0.7265409, 0.2728636, -0.9028459, 0.4823529, 0, 1, 1,
0.7369224, 0.8357365, 0.3190785, 0.4862745, 0, 1, 1,
0.7411104, 0.5138395, 1.384156, 0.4941176, 0, 1, 1,
0.7473589, 0.5989141, 0.7560481, 0.5019608, 0, 1, 1,
0.7477273, -0.3361169, 2.266521, 0.5058824, 0, 1, 1,
0.7495221, 1.192937, 1.234403, 0.5137255, 0, 1, 1,
0.7520263, -0.6284091, 2.016837, 0.5176471, 0, 1, 1,
0.7525479, 1.248233, 1.477316, 0.5254902, 0, 1, 1,
0.7556199, -1.782458, 1.117428, 0.5294118, 0, 1, 1,
0.7566087, -0.5053927, 1.836816, 0.5372549, 0, 1, 1,
0.7644461, -0.1670631, 0.1843503, 0.5411765, 0, 1, 1,
0.7649726, -2.590553, 3.673731, 0.5490196, 0, 1, 1,
0.7654945, 0.2537654, 2.07755, 0.5529412, 0, 1, 1,
0.7690077, -1.23715, 1.64211, 0.5607843, 0, 1, 1,
0.7695355, 1.014848, 0.9757263, 0.5647059, 0, 1, 1,
0.7710316, 0.3491807, 2.585009, 0.572549, 0, 1, 1,
0.771959, -0.1034552, 2.58584, 0.5764706, 0, 1, 1,
0.7784328, -0.9875931, 3.584232, 0.5843138, 0, 1, 1,
0.7803555, -0.3898593, 2.95516, 0.5882353, 0, 1, 1,
0.7821217, -0.3168484, 2.16611, 0.5960785, 0, 1, 1,
0.7833946, 0.1750169, 0.02847618, 0.6039216, 0, 1, 1,
0.7883371, 0.4717023, 0.5822499, 0.6078432, 0, 1, 1,
0.7891419, 0.843204, 1.199251, 0.6156863, 0, 1, 1,
0.7926154, -1.020758, 2.615687, 0.6196079, 0, 1, 1,
0.796117, 0.3646085, 0.4942756, 0.627451, 0, 1, 1,
0.8071648, 0.8692275, -0.4009306, 0.6313726, 0, 1, 1,
0.8155273, 1.179042, 0.8938816, 0.6392157, 0, 1, 1,
0.8168454, 1.240685, 0.07619081, 0.6431373, 0, 1, 1,
0.8171157, 0.4560987, 1.339645, 0.6509804, 0, 1, 1,
0.8172993, -1.312103, 1.923612, 0.654902, 0, 1, 1,
0.817693, -1.259523, 1.044353, 0.6627451, 0, 1, 1,
0.8194486, 1.120233, -0.1739711, 0.6666667, 0, 1, 1,
0.8211327, -0.5056489, 2.219251, 0.6745098, 0, 1, 1,
0.8253712, -0.4744599, 0.9125036, 0.6784314, 0, 1, 1,
0.8332998, -2.240324, 3.297527, 0.6862745, 0, 1, 1,
0.8371013, 0.6793446, -0.514673, 0.6901961, 0, 1, 1,
0.8428405, -0.4165655, 1.877012, 0.6980392, 0, 1, 1,
0.8432401, 0.6550866, 2.423703, 0.7058824, 0, 1, 1,
0.8443565, -0.908886, 3.193419, 0.7098039, 0, 1, 1,
0.8477169, -0.5085935, 0.4046385, 0.7176471, 0, 1, 1,
0.8539706, 0.4946735, 0.4554703, 0.7215686, 0, 1, 1,
0.8579615, -0.2515687, 0.1243307, 0.7294118, 0, 1, 1,
0.8652523, -1.100726, 2.509634, 0.7333333, 0, 1, 1,
0.8702177, -0.552182, 1.424921, 0.7411765, 0, 1, 1,
0.8728741, -0.4563377, 1.943537, 0.7450981, 0, 1, 1,
0.879774, -0.2956901, 1.085927, 0.7529412, 0, 1, 1,
0.8819913, 1.336612, 1.002696, 0.7568628, 0, 1, 1,
0.8873384, 0.3587291, 0.379629, 0.7647059, 0, 1, 1,
0.8891104, -0.4603962, 0.7069654, 0.7686275, 0, 1, 1,
0.8901569, -0.03967581, 0.01188829, 0.7764706, 0, 1, 1,
0.8919215, 0.03565152, 0.8833538, 0.7803922, 0, 1, 1,
0.893605, -0.9830982, 1.999669, 0.7882353, 0, 1, 1,
0.8961223, -0.6450736, -0.3465778, 0.7921569, 0, 1, 1,
0.8981993, -0.7473131, 3.101289, 0.8, 0, 1, 1,
0.8993132, 0.585205, 1.417572, 0.8078431, 0, 1, 1,
0.903011, -0.4458112, 0.9120811, 0.8117647, 0, 1, 1,
0.9089505, -2.003803, 2.685927, 0.8196079, 0, 1, 1,
0.9113296, 0.0147124, 1.625196, 0.8235294, 0, 1, 1,
0.9193772, -0.3415552, 3.687629, 0.8313726, 0, 1, 1,
0.9277718, -0.03302363, -0.1461195, 0.8352941, 0, 1, 1,
0.9292491, -0.7871143, 1.284876, 0.8431373, 0, 1, 1,
0.9318967, -0.6749662, 1.403918, 0.8470588, 0, 1, 1,
0.9371448, 0.7025417, 1.508787, 0.854902, 0, 1, 1,
0.9406987, 0.3389907, 3.154907, 0.8588235, 0, 1, 1,
0.9463331, -0.1497044, 1.702264, 0.8666667, 0, 1, 1,
0.947288, -0.3982158, 1.299541, 0.8705882, 0, 1, 1,
0.9478007, -0.2090505, 1.825636, 0.8784314, 0, 1, 1,
0.9480921, -0.2113654, 1.84352, 0.8823529, 0, 1, 1,
0.9509644, 1.568811, 0.493138, 0.8901961, 0, 1, 1,
0.9639021, -0.9299251, 2.59651, 0.8941177, 0, 1, 1,
0.9649531, 0.03204286, 2.421831, 0.9019608, 0, 1, 1,
0.9700235, -0.0539299, 0.09794776, 0.9098039, 0, 1, 1,
0.9751437, 0.5531849, 1.120079, 0.9137255, 0, 1, 1,
0.9755797, 0.2281067, 2.375904, 0.9215686, 0, 1, 1,
0.9770131, 0.3442907, 0.5271932, 0.9254902, 0, 1, 1,
0.983061, -0.4213268, 1.892168, 0.9333333, 0, 1, 1,
0.9856595, -1.947431, 3.587961, 0.9372549, 0, 1, 1,
0.9870917, -0.4714514, 2.873095, 0.945098, 0, 1, 1,
0.992963, 0.3477689, 0.2902814, 0.9490196, 0, 1, 1,
0.9960478, 0.1654727, 3.968914, 0.9568627, 0, 1, 1,
0.9979032, -0.4648381, 1.934891, 0.9607843, 0, 1, 1,
0.9993057, -2.092029, 4.097602, 0.9686275, 0, 1, 1,
1.001529, -1.001669, 2.035698, 0.972549, 0, 1, 1,
1.005201, -2.115401, 3.872993, 0.9803922, 0, 1, 1,
1.008729, -0.374297, 0.9266458, 0.9843137, 0, 1, 1,
1.013954, -0.1966109, 1.072113, 0.9921569, 0, 1, 1,
1.01397, 0.7419791, 1.269861, 0.9960784, 0, 1, 1,
1.021704, -1.42934, 3.360497, 1, 0, 0.9960784, 1,
1.028494, 1.014714, 0.7905014, 1, 0, 0.9882353, 1,
1.031271, 0.5228924, 1.758367, 1, 0, 0.9843137, 1,
1.033892, -0.9360378, 1.232223, 1, 0, 0.9764706, 1,
1.035105, 0.1030045, 1.065326, 1, 0, 0.972549, 1,
1.035491, -0.5300561, 2.813536, 1, 0, 0.9647059, 1,
1.039546, -0.225234, 1.298308, 1, 0, 0.9607843, 1,
1.041346, -1.029462, 1.684856, 1, 0, 0.9529412, 1,
1.049764, 0.6249939, 0.5583004, 1, 0, 0.9490196, 1,
1.050904, 1.074843, 0.08858594, 1, 0, 0.9411765, 1,
1.052055, -0.8490248, 2.683247, 1, 0, 0.9372549, 1,
1.05331, 1.39153, -0.132892, 1, 0, 0.9294118, 1,
1.054303, -2.440597, 2.114894, 1, 0, 0.9254902, 1,
1.062327, -0.3409226, 3.463481, 1, 0, 0.9176471, 1,
1.065018, 1.059672, 1.221538, 1, 0, 0.9137255, 1,
1.066598, 1.260427, -0.9620772, 1, 0, 0.9058824, 1,
1.071002, -0.1015462, 0.6696857, 1, 0, 0.9019608, 1,
1.075069, 1.492059, -0.5025011, 1, 0, 0.8941177, 1,
1.075087, -1.204573, 2.583211, 1, 0, 0.8862745, 1,
1.079434, 0.09474814, 3.044875, 1, 0, 0.8823529, 1,
1.091396, -0.06622176, 3.464197, 1, 0, 0.8745098, 1,
1.092817, -0.8752389, 3.410313, 1, 0, 0.8705882, 1,
1.107697, 0.6672595, -0.2425277, 1, 0, 0.8627451, 1,
1.112862, 0.4123796, 2.1821, 1, 0, 0.8588235, 1,
1.115612, 0.7922078, 1.533991, 1, 0, 0.8509804, 1,
1.116029, 0.1168447, 1.247785, 1, 0, 0.8470588, 1,
1.121775, -0.8573152, 3.054093, 1, 0, 0.8392157, 1,
1.124397, -1.140562, 2.176229, 1, 0, 0.8352941, 1,
1.129516, -0.8557211, 3.013698, 1, 0, 0.827451, 1,
1.142332, 0.6157295, 0.903411, 1, 0, 0.8235294, 1,
1.143133, -0.1836966, 0.8183439, 1, 0, 0.8156863, 1,
1.144523, -1.745886, 2.225642, 1, 0, 0.8117647, 1,
1.148815, 0.2171211, 3.806841, 1, 0, 0.8039216, 1,
1.14955, -2.31657, 4.225521, 1, 0, 0.7960784, 1,
1.162532, 0.0104311, 0.5605245, 1, 0, 0.7921569, 1,
1.170462, 0.8203407, -0.441304, 1, 0, 0.7843137, 1,
1.177987, 0.2486677, 0.02414749, 1, 0, 0.7803922, 1,
1.17974, 0.8885071, -0.2267417, 1, 0, 0.772549, 1,
1.181396, 0.6013802, 3.912506, 1, 0, 0.7686275, 1,
1.187319, -0.2192243, -0.9385315, 1, 0, 0.7607843, 1,
1.198856, -2.659871, 2.999846, 1, 0, 0.7568628, 1,
1.209222, -0.334433, 2.827457, 1, 0, 0.7490196, 1,
1.21412, 0.6153203, -0.7863085, 1, 0, 0.7450981, 1,
1.215992, -0.9863957, 2.711869, 1, 0, 0.7372549, 1,
1.222807, 0.01320997, 1.553447, 1, 0, 0.7333333, 1,
1.223974, -0.4043109, 2.639009, 1, 0, 0.7254902, 1,
1.229487, -0.3282213, 1.450731, 1, 0, 0.7215686, 1,
1.251305, 0.4299118, 1.737097, 1, 0, 0.7137255, 1,
1.269995, -1.136111, 2.123371, 1, 0, 0.7098039, 1,
1.270047, -0.02252953, 1.095826, 1, 0, 0.7019608, 1,
1.275297, -1.223525, 3.445635, 1, 0, 0.6941177, 1,
1.278302, -0.05098898, 2.646475, 1, 0, 0.6901961, 1,
1.280654, 1.10458, 0.8767596, 1, 0, 0.682353, 1,
1.284157, -1.432901, 3.608656, 1, 0, 0.6784314, 1,
1.28604, 2.285508, 1.502136, 1, 0, 0.6705883, 1,
1.289542, 1.12619, -1.01972, 1, 0, 0.6666667, 1,
1.296124, -1.042794, 4.258692, 1, 0, 0.6588235, 1,
1.298428, -1.108157, 1.544916, 1, 0, 0.654902, 1,
1.301347, -1.166578, 0.9498541, 1, 0, 0.6470588, 1,
1.351207, -0.642347, 2.576608, 1, 0, 0.6431373, 1,
1.353623, -0.5600261, 3.355558, 1, 0, 0.6352941, 1,
1.359337, -0.9039705, 1.233801, 1, 0, 0.6313726, 1,
1.381683, 0.37519, 1.471465, 1, 0, 0.6235294, 1,
1.387929, 1.189237, 0.09565187, 1, 0, 0.6196079, 1,
1.394522, 0.8252027, 1.280433, 1, 0, 0.6117647, 1,
1.398685, 0.411587, 1.281077, 1, 0, 0.6078432, 1,
1.399932, -0.867002, 1.72872, 1, 0, 0.6, 1,
1.405951, -1.078476, 0.7084544, 1, 0, 0.5921569, 1,
1.416811, 2.511582, -0.3803237, 1, 0, 0.5882353, 1,
1.418504, -0.01190096, 0.2888411, 1, 0, 0.5803922, 1,
1.422777, -0.9153745, 3.478416, 1, 0, 0.5764706, 1,
1.427646, -1.031878, 1.320687, 1, 0, 0.5686275, 1,
1.429604, -1.429138, 1.39425, 1, 0, 0.5647059, 1,
1.430676, 1.901823, 0.6307626, 1, 0, 0.5568628, 1,
1.441355, 1.316294, 1.884656, 1, 0, 0.5529412, 1,
1.444519, 0.8193539, 2.316887, 1, 0, 0.5450981, 1,
1.445374, 0.3120241, 2.632398, 1, 0, 0.5411765, 1,
1.446767, 1.657082, 2.561241, 1, 0, 0.5333334, 1,
1.457111, -1.399309, 0.8131216, 1, 0, 0.5294118, 1,
1.461589, -1.242567, 3.184803, 1, 0, 0.5215687, 1,
1.464029, -0.1484618, 1.89127, 1, 0, 0.5176471, 1,
1.470893, -1.541168, 2.872823, 1, 0, 0.509804, 1,
1.47102, 1.133923, -1.070392, 1, 0, 0.5058824, 1,
1.478147, 0.5271869, 0.2713678, 1, 0, 0.4980392, 1,
1.484227, -1.201645, 1.506448, 1, 0, 0.4901961, 1,
1.485412, 0.2188984, 0.646805, 1, 0, 0.4862745, 1,
1.49372, -0.8276614, 2.601593, 1, 0, 0.4784314, 1,
1.50209, 1.176971, 1.127166, 1, 0, 0.4745098, 1,
1.505531, 0.845173, -0.01445873, 1, 0, 0.4666667, 1,
1.508891, -0.6882532, 2.027024, 1, 0, 0.4627451, 1,
1.519715, 1.285551, 1.141627, 1, 0, 0.454902, 1,
1.523744, -1.055058, 3.042329, 1, 0, 0.4509804, 1,
1.549671, 1.242726, 0.7128186, 1, 0, 0.4431373, 1,
1.551637, -1.139923, 2.341829, 1, 0, 0.4392157, 1,
1.555275, -0.8539056, 1.946201, 1, 0, 0.4313726, 1,
1.567143, -1.586416, 0.5599799, 1, 0, 0.427451, 1,
1.568766, 1.100565, 0.7273907, 1, 0, 0.4196078, 1,
1.573611, -1.419651, 0.4692984, 1, 0, 0.4156863, 1,
1.576891, 1.274769, 3.214415, 1, 0, 0.4078431, 1,
1.579507, 0.6812783, 0.433528, 1, 0, 0.4039216, 1,
1.583934, 0.2133776, 2.558828, 1, 0, 0.3960784, 1,
1.597679, -1.809833, 2.083891, 1, 0, 0.3882353, 1,
1.605479, 1.810461, 1.252754, 1, 0, 0.3843137, 1,
1.605822, -1.730906, 2.807282, 1, 0, 0.3764706, 1,
1.607567, -0.4151048, 1.618718, 1, 0, 0.372549, 1,
1.61007, 2.672847, 1.446453, 1, 0, 0.3647059, 1,
1.630822, 0.1052131, 1.657849, 1, 0, 0.3607843, 1,
1.640062, 0.6508068, 1.74552, 1, 0, 0.3529412, 1,
1.642642, 1.163079, 2.420298, 1, 0, 0.3490196, 1,
1.65406, 1.818029, -0.1584128, 1, 0, 0.3411765, 1,
1.665797, -1.011487, 2.517392, 1, 0, 0.3372549, 1,
1.669313, 2.029628, 0.1065552, 1, 0, 0.3294118, 1,
1.670064, 1.310815, 1.585876, 1, 0, 0.3254902, 1,
1.679362, 0.3644567, 0.3934896, 1, 0, 0.3176471, 1,
1.707594, 0.1793991, 1.994374, 1, 0, 0.3137255, 1,
1.726309, 1.660758, 1.154066, 1, 0, 0.3058824, 1,
1.73517, 1.384436, 1.810865, 1, 0, 0.2980392, 1,
1.740901, 0.3413114, 0.1966709, 1, 0, 0.2941177, 1,
1.747994, -0.03279686, 1.480278, 1, 0, 0.2862745, 1,
1.748213, -0.1088574, 1.891361, 1, 0, 0.282353, 1,
1.760815, -2.285906, 2.086087, 1, 0, 0.2745098, 1,
1.776384, -0.40359, 1.200625, 1, 0, 0.2705882, 1,
1.78256, 1.451906, 0.0253965, 1, 0, 0.2627451, 1,
1.800735, 0.3251165, 0.04855079, 1, 0, 0.2588235, 1,
1.801616, 0.7820434, 1.915093, 1, 0, 0.2509804, 1,
1.810852, -0.7782883, 3.675502, 1, 0, 0.2470588, 1,
1.819341, 0.1851727, 1.830805, 1, 0, 0.2392157, 1,
1.819667, 0.3162783, 1.379141, 1, 0, 0.2352941, 1,
1.829024, 0.3933287, 1.992735, 1, 0, 0.227451, 1,
1.83949, 0.8485035, 3.008037, 1, 0, 0.2235294, 1,
1.846571, 0.1554091, 2.325343, 1, 0, 0.2156863, 1,
1.876117, 0.8699332, 2.375439, 1, 0, 0.2117647, 1,
1.881158, -1.071164, 2.220863, 1, 0, 0.2039216, 1,
1.89884, -0.8688194, 3.346308, 1, 0, 0.1960784, 1,
1.911532, -0.1488111, 2.402361, 1, 0, 0.1921569, 1,
1.912206, -1.318471, 3.618601, 1, 0, 0.1843137, 1,
1.91235, 1.029509, 0.1390947, 1, 0, 0.1803922, 1,
1.915345, -0.7074941, 1.68019, 1, 0, 0.172549, 1,
1.934759, 0.04990717, 3.180571, 1, 0, 0.1686275, 1,
1.951826, -1.467342, 1.934294, 1, 0, 0.1607843, 1,
1.953199, 0.4532734, -0.1116256, 1, 0, 0.1568628, 1,
1.995535, 0.7785201, 0.7405378, 1, 0, 0.1490196, 1,
1.998316, -0.9242413, 3.769235, 1, 0, 0.145098, 1,
2.031464, -0.7029188, 1.900102, 1, 0, 0.1372549, 1,
2.050607, 0.1500656, 2.008604, 1, 0, 0.1333333, 1,
2.104841, -0.4438448, 1.44874, 1, 0, 0.1254902, 1,
2.115044, -2.573342, 1.584334, 1, 0, 0.1215686, 1,
2.115673, 0.0885215, 0.5139468, 1, 0, 0.1137255, 1,
2.155216, -1.375049, 2.103833, 1, 0, 0.1098039, 1,
2.188878, 1.243798, 1.327374, 1, 0, 0.1019608, 1,
2.20744, -1.151177, 3.20922, 1, 0, 0.09411765, 1,
2.241138, -0.9851794, 3.522977, 1, 0, 0.09019608, 1,
2.245941, 0.4492045, 0.8966365, 1, 0, 0.08235294, 1,
2.286777, 1.235551, 1.074385, 1, 0, 0.07843138, 1,
2.341554, 1.62852, 0.8972361, 1, 0, 0.07058824, 1,
2.355033, -0.7958964, 1.79214, 1, 0, 0.06666667, 1,
2.36818, 1.929311, 0.8499255, 1, 0, 0.05882353, 1,
2.380034, 1.612803, 2.312822, 1, 0, 0.05490196, 1,
2.487548, 0.02339413, 2.437886, 1, 0, 0.04705882, 1,
2.526844, -0.4655047, 0.6834967, 1, 0, 0.04313726, 1,
2.568094, 0.4262589, 2.323946, 1, 0, 0.03529412, 1,
2.599087, 1.522749, -0.4726942, 1, 0, 0.03137255, 1,
2.605755, -0.6484361, 0.8537564, 1, 0, 0.02352941, 1,
2.630679, 1.307402, -0.7808796, 1, 0, 0.01960784, 1,
2.641763, -1.216247, 3.039497, 1, 0, 0.01176471, 1,
3.264362, 0.1497022, -0.9182459, 1, 0, 0.007843138, 1
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
0.03558576, -4.055988, -7.070033, 0, -0.5, 0.5, 0.5,
0.03558576, -4.055988, -7.070033, 1, -0.5, 0.5, 0.5,
0.03558576, -4.055988, -7.070033, 1, 1.5, 0.5, 0.5,
0.03558576, -4.055988, -7.070033, 0, 1.5, 0.5, 0.5
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
-4.287746, -0.04312682, -7.070033, 0, -0.5, 0.5, 0.5,
-4.287746, -0.04312682, -7.070033, 1, -0.5, 0.5, 0.5,
-4.287746, -0.04312682, -7.070033, 1, 1.5, 0.5, 0.5,
-4.287746, -0.04312682, -7.070033, 0, 1.5, 0.5, 0.5
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
-4.287746, -4.055988, -0.05009818, 0, -0.5, 0.5, 0.5,
-4.287746, -4.055988, -0.05009818, 1, -0.5, 0.5, 0.5,
-4.287746, -4.055988, -0.05009818, 1, 1.5, 0.5, 0.5,
-4.287746, -4.055988, -0.05009818, 0, 1.5, 0.5, 0.5
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
-3, -3.129943, -5.450047,
3, -3.129943, -5.450047,
-3, -3.129943, -5.450047,
-3, -3.284284, -5.720045,
-2, -3.129943, -5.450047,
-2, -3.284284, -5.720045,
-1, -3.129943, -5.450047,
-1, -3.284284, -5.720045,
0, -3.129943, -5.450047,
0, -3.284284, -5.720045,
1, -3.129943, -5.450047,
1, -3.284284, -5.720045,
2, -3.129943, -5.450047,
2, -3.284284, -5.720045,
3, -3.129943, -5.450047,
3, -3.284284, -5.720045
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
-3, -3.592965, -6.26004, 0, -0.5, 0.5, 0.5,
-3, -3.592965, -6.26004, 1, -0.5, 0.5, 0.5,
-3, -3.592965, -6.26004, 1, 1.5, 0.5, 0.5,
-3, -3.592965, -6.26004, 0, 1.5, 0.5, 0.5,
-2, -3.592965, -6.26004, 0, -0.5, 0.5, 0.5,
-2, -3.592965, -6.26004, 1, -0.5, 0.5, 0.5,
-2, -3.592965, -6.26004, 1, 1.5, 0.5, 0.5,
-2, -3.592965, -6.26004, 0, 1.5, 0.5, 0.5,
-1, -3.592965, -6.26004, 0, -0.5, 0.5, 0.5,
-1, -3.592965, -6.26004, 1, -0.5, 0.5, 0.5,
-1, -3.592965, -6.26004, 1, 1.5, 0.5, 0.5,
-1, -3.592965, -6.26004, 0, 1.5, 0.5, 0.5,
0, -3.592965, -6.26004, 0, -0.5, 0.5, 0.5,
0, -3.592965, -6.26004, 1, -0.5, 0.5, 0.5,
0, -3.592965, -6.26004, 1, 1.5, 0.5, 0.5,
0, -3.592965, -6.26004, 0, 1.5, 0.5, 0.5,
1, -3.592965, -6.26004, 0, -0.5, 0.5, 0.5,
1, -3.592965, -6.26004, 1, -0.5, 0.5, 0.5,
1, -3.592965, -6.26004, 1, 1.5, 0.5, 0.5,
1, -3.592965, -6.26004, 0, 1.5, 0.5, 0.5,
2, -3.592965, -6.26004, 0, -0.5, 0.5, 0.5,
2, -3.592965, -6.26004, 1, -0.5, 0.5, 0.5,
2, -3.592965, -6.26004, 1, 1.5, 0.5, 0.5,
2, -3.592965, -6.26004, 0, 1.5, 0.5, 0.5,
3, -3.592965, -6.26004, 0, -0.5, 0.5, 0.5,
3, -3.592965, -6.26004, 1, -0.5, 0.5, 0.5,
3, -3.592965, -6.26004, 1, 1.5, 0.5, 0.5,
3, -3.592965, -6.26004, 0, 1.5, 0.5, 0.5
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
-3.290054, -3, -5.450047,
-3.290054, 2, -5.450047,
-3.290054, -3, -5.450047,
-3.456336, -3, -5.720045,
-3.290054, -2, -5.450047,
-3.456336, -2, -5.720045,
-3.290054, -1, -5.450047,
-3.456336, -1, -5.720045,
-3.290054, 0, -5.450047,
-3.456336, 0, -5.720045,
-3.290054, 1, -5.450047,
-3.456336, 1, -5.720045,
-3.290054, 2, -5.450047,
-3.456336, 2, -5.720045
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
-3.7889, -3, -6.26004, 0, -0.5, 0.5, 0.5,
-3.7889, -3, -6.26004, 1, -0.5, 0.5, 0.5,
-3.7889, -3, -6.26004, 1, 1.5, 0.5, 0.5,
-3.7889, -3, -6.26004, 0, 1.5, 0.5, 0.5,
-3.7889, -2, -6.26004, 0, -0.5, 0.5, 0.5,
-3.7889, -2, -6.26004, 1, -0.5, 0.5, 0.5,
-3.7889, -2, -6.26004, 1, 1.5, 0.5, 0.5,
-3.7889, -2, -6.26004, 0, 1.5, 0.5, 0.5,
-3.7889, -1, -6.26004, 0, -0.5, 0.5, 0.5,
-3.7889, -1, -6.26004, 1, -0.5, 0.5, 0.5,
-3.7889, -1, -6.26004, 1, 1.5, 0.5, 0.5,
-3.7889, -1, -6.26004, 0, 1.5, 0.5, 0.5,
-3.7889, 0, -6.26004, 0, -0.5, 0.5, 0.5,
-3.7889, 0, -6.26004, 1, -0.5, 0.5, 0.5,
-3.7889, 0, -6.26004, 1, 1.5, 0.5, 0.5,
-3.7889, 0, -6.26004, 0, 1.5, 0.5, 0.5,
-3.7889, 1, -6.26004, 0, -0.5, 0.5, 0.5,
-3.7889, 1, -6.26004, 1, -0.5, 0.5, 0.5,
-3.7889, 1, -6.26004, 1, 1.5, 0.5, 0.5,
-3.7889, 1, -6.26004, 0, 1.5, 0.5, 0.5,
-3.7889, 2, -6.26004, 0, -0.5, 0.5, 0.5,
-3.7889, 2, -6.26004, 1, -0.5, 0.5, 0.5,
-3.7889, 2, -6.26004, 1, 1.5, 0.5, 0.5,
-3.7889, 2, -6.26004, 0, 1.5, 0.5, 0.5
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
-3.290054, -3.129943, -4,
-3.290054, -3.129943, 4,
-3.290054, -3.129943, -4,
-3.456336, -3.284284, -4,
-3.290054, -3.129943, -2,
-3.456336, -3.284284, -2,
-3.290054, -3.129943, 0,
-3.456336, -3.284284, 0,
-3.290054, -3.129943, 2,
-3.456336, -3.284284, 2,
-3.290054, -3.129943, 4,
-3.456336, -3.284284, 4
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
-3.7889, -3.592965, -4, 0, -0.5, 0.5, 0.5,
-3.7889, -3.592965, -4, 1, -0.5, 0.5, 0.5,
-3.7889, -3.592965, -4, 1, 1.5, 0.5, 0.5,
-3.7889, -3.592965, -4, 0, 1.5, 0.5, 0.5,
-3.7889, -3.592965, -2, 0, -0.5, 0.5, 0.5,
-3.7889, -3.592965, -2, 1, -0.5, 0.5, 0.5,
-3.7889, -3.592965, -2, 1, 1.5, 0.5, 0.5,
-3.7889, -3.592965, -2, 0, 1.5, 0.5, 0.5,
-3.7889, -3.592965, 0, 0, -0.5, 0.5, 0.5,
-3.7889, -3.592965, 0, 1, -0.5, 0.5, 0.5,
-3.7889, -3.592965, 0, 1, 1.5, 0.5, 0.5,
-3.7889, -3.592965, 0, 0, 1.5, 0.5, 0.5,
-3.7889, -3.592965, 2, 0, -0.5, 0.5, 0.5,
-3.7889, -3.592965, 2, 1, -0.5, 0.5, 0.5,
-3.7889, -3.592965, 2, 1, 1.5, 0.5, 0.5,
-3.7889, -3.592965, 2, 0, 1.5, 0.5, 0.5,
-3.7889, -3.592965, 4, 0, -0.5, 0.5, 0.5,
-3.7889, -3.592965, 4, 1, -0.5, 0.5, 0.5,
-3.7889, -3.592965, 4, 1, 1.5, 0.5, 0.5,
-3.7889, -3.592965, 4, 0, 1.5, 0.5, 0.5
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
-3.290054, -3.129943, -5.450047,
-3.290054, 3.043689, -5.450047,
-3.290054, -3.129943, 5.349851,
-3.290054, 3.043689, 5.349851,
-3.290054, -3.129943, -5.450047,
-3.290054, -3.129943, 5.349851,
-3.290054, 3.043689, -5.450047,
-3.290054, 3.043689, 5.349851,
-3.290054, -3.129943, -5.450047,
3.361225, -3.129943, -5.450047,
-3.290054, -3.129943, 5.349851,
3.361225, -3.129943, 5.349851,
-3.290054, 3.043689, -5.450047,
3.361225, 3.043689, -5.450047,
-3.290054, 3.043689, 5.349851,
3.361225, 3.043689, 5.349851,
3.361225, -3.129943, -5.450047,
3.361225, 3.043689, -5.450047,
3.361225, -3.129943, 5.349851,
3.361225, 3.043689, 5.349851,
3.361225, -3.129943, -5.450047,
3.361225, -3.129943, 5.349851,
3.361225, 3.043689, -5.450047,
3.361225, 3.043689, 5.349851
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
var radius = 7.532554;
var distance = 33.51318;
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
mvMatrix.translate( -0.03558576, 0.04312682, 0.05009818 );
mvMatrix.scale( 1.224478, 1.319214, 0.7541131 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.51318);
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
heptachlor_epoxide<-read.table("heptachlor_epoxide.xyz")
```

```
## Error in read.table("heptachlor_epoxide.xyz"): no lines available in input
```

```r
x<-heptachlor_epoxide$V2
```

```
## Error in eval(expr, envir, enclos): object 'heptachlor_epoxide' not found
```

```r
y<-heptachlor_epoxide$V3
```

```
## Error in eval(expr, envir, enclos): object 'heptachlor_epoxide' not found
```

```r
z<-heptachlor_epoxide$V4
```

```
## Error in eval(expr, envir, enclos): object 'heptachlor_epoxide' not found
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
-3.193191, -0.01874091, -0.6787333, 0, 0, 1, 1, 1,
-3.130877, 1.309877, -0.9875342, 1, 0, 0, 1, 1,
-3.043311, 1.23381, 0.1740252, 1, 0, 0, 1, 1,
-2.853049, -0.7089483, -0.4988364, 1, 0, 0, 1, 1,
-2.831323, 1.08447, -2.210719, 1, 0, 0, 1, 1,
-2.771132, 0.8492591, -2.988161, 1, 0, 0, 1, 1,
-2.679704, -1.241867, -1.70858, 0, 0, 0, 1, 1,
-2.670101, -2.00386, -4.11901, 0, 0, 0, 1, 1,
-2.645378, 0.3365897, -2.467641, 0, 0, 0, 1, 1,
-2.579621, 1.183574, -0.9088562, 0, 0, 0, 1, 1,
-2.567211, 0.348092, -0.4579256, 0, 0, 0, 1, 1,
-2.54427, 2.08637, 0.7820765, 0, 0, 0, 1, 1,
-2.388335, 1.502375, 0.02296316, 0, 0, 0, 1, 1,
-2.350535, -0.01097651, -2.050913, 1, 1, 1, 1, 1,
-2.338337, -0.4265759, -1.238531, 1, 1, 1, 1, 1,
-2.328073, -0.3441961, -1.920227, 1, 1, 1, 1, 1,
-2.320912, -0.07616804, -1.507606, 1, 1, 1, 1, 1,
-2.277792, -0.06581579, -2.829452, 1, 1, 1, 1, 1,
-2.259018, -0.8229563, -1.645426, 1, 1, 1, 1, 1,
-2.256701, 0.1141245, -0.1036246, 1, 1, 1, 1, 1,
-2.233465, -0.5488259, -2.335479, 1, 1, 1, 1, 1,
-2.216277, 0.8021915, -1.395363, 1, 1, 1, 1, 1,
-2.210958, -0.9316325, -2.422588, 1, 1, 1, 1, 1,
-2.194886, 0.8965924, -0.3289311, 1, 1, 1, 1, 1,
-2.184299, -0.08323181, -3.01154, 1, 1, 1, 1, 1,
-2.138305, -0.1151422, -1.296433, 1, 1, 1, 1, 1,
-2.130328, 0.767237, -3.36919, 1, 1, 1, 1, 1,
-2.104446, -0.2288627, -1.505727, 1, 1, 1, 1, 1,
-2.098269, 0.9959145, 0.3228541, 0, 0, 1, 1, 1,
-2.077057, 2.268044, 0.2599588, 1, 0, 0, 1, 1,
-2.059863, -0.7916742, -1.633769, 1, 0, 0, 1, 1,
-2.01653, 0.426225, -3.839117, 1, 0, 0, 1, 1,
-1.998393, 0.01400674, -1.2635, 1, 0, 0, 1, 1,
-1.990488, -0.3556754, -0.7631812, 1, 0, 0, 1, 1,
-1.981526, -0.9059415, -1.613929, 0, 0, 0, 1, 1,
-1.979965, -0.3386614, -1.523067, 0, 0, 0, 1, 1,
-1.965339, 0.1262359, -1.159636, 0, 0, 0, 1, 1,
-1.943583, -1.529079, -2.146871, 0, 0, 0, 1, 1,
-1.938166, -1.363187, -2.587824, 0, 0, 0, 1, 1,
-1.9348, 0.02920055, -2.46908, 0, 0, 0, 1, 1,
-1.919592, -0.918918, -3.147163, 0, 0, 0, 1, 1,
-1.913867, -0.3324654, -2.038619, 1, 1, 1, 1, 1,
-1.894943, 1.344727, -0.1416242, 1, 1, 1, 1, 1,
-1.864326, -1.402057, -1.231379, 1, 1, 1, 1, 1,
-1.839877, -0.5635787, -2.048177, 1, 1, 1, 1, 1,
-1.836236, 0.8334855, -1.445269, 1, 1, 1, 1, 1,
-1.827111, -0.5950682, 0.261047, 1, 1, 1, 1, 1,
-1.779612, -0.306119, -0.8320647, 1, 1, 1, 1, 1,
-1.771302, 1.813485, -1.378869, 1, 1, 1, 1, 1,
-1.762995, -0.09373127, -2.745451, 1, 1, 1, 1, 1,
-1.744715, 1.040955, -1.516477, 1, 1, 1, 1, 1,
-1.724136, 0.76943, -0.1535693, 1, 1, 1, 1, 1,
-1.722262, -1.51089, -3.133127, 1, 1, 1, 1, 1,
-1.711555, 0.7498546, -1.918209, 1, 1, 1, 1, 1,
-1.706782, 0.3895928, -1.706204, 1, 1, 1, 1, 1,
-1.702522, -0.4617588, 0.03671191, 1, 1, 1, 1, 1,
-1.690787, 0.01843718, -1.286106, 0, 0, 1, 1, 1,
-1.676983, 0.9593401, -0.5633867, 1, 0, 0, 1, 1,
-1.670078, 0.4898517, -0.8915569, 1, 0, 0, 1, 1,
-1.670076, 1.071642, -2.235141, 1, 0, 0, 1, 1,
-1.642854, 0.1788583, -1.119846, 1, 0, 0, 1, 1,
-1.633685, -0.4723561, -1.259091, 1, 0, 0, 1, 1,
-1.631654, 1.498036, -0.1277038, 0, 0, 0, 1, 1,
-1.619668, -0.3167589, -0.865855, 0, 0, 0, 1, 1,
-1.618447, 2.568732, -0.3627153, 0, 0, 0, 1, 1,
-1.610064, -0.04466894, -2.209777, 0, 0, 0, 1, 1,
-1.6047, 0.8952979, -0.0584522, 0, 0, 0, 1, 1,
-1.603376, 1.526108, -1.460786, 0, 0, 0, 1, 1,
-1.580748, 1.955281, 0.751408, 0, 0, 0, 1, 1,
-1.560382, -0.1969087, -1.449386, 1, 1, 1, 1, 1,
-1.557851, -0.3697664, -1.131552, 1, 1, 1, 1, 1,
-1.555183, 1.185346, -1.670704, 1, 1, 1, 1, 1,
-1.534396, -0.7032187, -1.321139, 1, 1, 1, 1, 1,
-1.527919, -0.09312584, -2.856848, 1, 1, 1, 1, 1,
-1.516446, 2.008546, -2.00529, 1, 1, 1, 1, 1,
-1.507814, 0.6573962, -2.248639, 1, 1, 1, 1, 1,
-1.496689, 1.161717, -0.7416389, 1, 1, 1, 1, 1,
-1.490204, 0.2087275, -1.434656, 1, 1, 1, 1, 1,
-1.485764, 0.8817526, -0.8941553, 1, 1, 1, 1, 1,
-1.470726, 0.7384295, -1.24264, 1, 1, 1, 1, 1,
-1.462777, 0.9415063, -0.953349, 1, 1, 1, 1, 1,
-1.451385, -0.03996538, 0.6690326, 1, 1, 1, 1, 1,
-1.438738, 0.1175617, -0.9197663, 1, 1, 1, 1, 1,
-1.433587, -0.3792575, -3.147762, 1, 1, 1, 1, 1,
-1.426319, -0.1044384, 0.1610219, 0, 0, 1, 1, 1,
-1.400299, 0.1199198, -0.6588535, 1, 0, 0, 1, 1,
-1.392729, -0.6123025, -2.41022, 1, 0, 0, 1, 1,
-1.389486, 0.07456761, -1.383325, 1, 0, 0, 1, 1,
-1.38474, 0.8911835, 0.3398861, 1, 0, 0, 1, 1,
-1.384036, 0.5996553, -0.5610975, 1, 0, 0, 1, 1,
-1.379753, -0.1498728, -1.95237, 0, 0, 0, 1, 1,
-1.377336, 0.04030266, -1.425564, 0, 0, 0, 1, 1,
-1.369787, -0.1296692, -0.5763212, 0, 0, 0, 1, 1,
-1.369225, 0.05831725, -1.206018, 0, 0, 0, 1, 1,
-1.342842, 1.561207, -1.898702, 0, 0, 0, 1, 1,
-1.324949, 0.4044927, 0.04418156, 0, 0, 0, 1, 1,
-1.324283, 1.074382, -1.686311, 0, 0, 0, 1, 1,
-1.314968, 1.066955, -1.180813, 1, 1, 1, 1, 1,
-1.314768, -0.1481163, -1.594444, 1, 1, 1, 1, 1,
-1.311311, 1.686592, -1.035034, 1, 1, 1, 1, 1,
-1.308311, -0.7903489, -3.818135, 1, 1, 1, 1, 1,
-1.297024, -0.5301418, -3.119352, 1, 1, 1, 1, 1,
-1.296519, -0.903575, -3.171438, 1, 1, 1, 1, 1,
-1.288243, -0.2971365, -2.731389, 1, 1, 1, 1, 1,
-1.263587, -0.2298079, -1.446731, 1, 1, 1, 1, 1,
-1.261376, 1.527313, -0.3833406, 1, 1, 1, 1, 1,
-1.259525, -0.5275176, -1.849367, 1, 1, 1, 1, 1,
-1.248942, 0.3944504, -0.9862446, 1, 1, 1, 1, 1,
-1.243173, -1.807603, -2.708976, 1, 1, 1, 1, 1,
-1.236613, -0.1398536, -1.706371, 1, 1, 1, 1, 1,
-1.232516, -0.1711429, -2.459456, 1, 1, 1, 1, 1,
-1.229839, 0.1121772, 0.4564067, 1, 1, 1, 1, 1,
-1.212484, 0.8969733, -0.4491271, 0, 0, 1, 1, 1,
-1.209835, -0.4661922, -2.290432, 1, 0, 0, 1, 1,
-1.208873, 0.472863, -1.428066, 1, 0, 0, 1, 1,
-1.206548, 1.435586, -2.028352, 1, 0, 0, 1, 1,
-1.20564, 1.76913, -1.004482, 1, 0, 0, 1, 1,
-1.202455, -0.6823055, -2.068721, 1, 0, 0, 1, 1,
-1.196143, -0.102505, -2.948355, 0, 0, 0, 1, 1,
-1.195608, 0.01191444, -2.327583, 0, 0, 0, 1, 1,
-1.186276, -0.6555665, -2.065825, 0, 0, 0, 1, 1,
-1.184836, -2.13066, -2.4308, 0, 0, 0, 1, 1,
-1.178835, 1.356461, -0.3511937, 0, 0, 0, 1, 1,
-1.178405, -0.3391001, -1.308467, 0, 0, 0, 1, 1,
-1.178169, -0.8039501, -1.856722, 0, 0, 0, 1, 1,
-1.170196, -0.023731, -0.7171174, 1, 1, 1, 1, 1,
-1.166656, 0.01090323, 0.621832, 1, 1, 1, 1, 1,
-1.166156, 0.9330439, -2.504025, 1, 1, 1, 1, 1,
-1.164059, -1.392812, -2.258673, 1, 1, 1, 1, 1,
-1.162942, -0.1297081, -2.195738, 1, 1, 1, 1, 1,
-1.15957, 1.970295, 0.5739927, 1, 1, 1, 1, 1,
-1.158943, 0.9252453, 0.3980488, 1, 1, 1, 1, 1,
-1.158892, -0.836641, -2.470475, 1, 1, 1, 1, 1,
-1.15134, 0.5502264, -2.721086, 1, 1, 1, 1, 1,
-1.145265, 0.6837951, 1.169086, 1, 1, 1, 1, 1,
-1.143332, 1.579837, -1.471934, 1, 1, 1, 1, 1,
-1.140121, -0.7443724, -2.013529, 1, 1, 1, 1, 1,
-1.136912, 0.3392459, 1.333381, 1, 1, 1, 1, 1,
-1.130531, -1.020278, -3.119711, 1, 1, 1, 1, 1,
-1.126702, -0.3756131, -3.164153, 1, 1, 1, 1, 1,
-1.123734, -0.1415559, -1.116984, 0, 0, 1, 1, 1,
-1.119029, -0.1164084, -2.061118, 1, 0, 0, 1, 1,
-1.116866, 0.704852, -2.019447, 1, 0, 0, 1, 1,
-1.113847, 0.1186493, -1.283114, 1, 0, 0, 1, 1,
-1.108343, -0.7547417, -1.656088, 1, 0, 0, 1, 1,
-1.106533, -0.1596212, -1.430109, 1, 0, 0, 1, 1,
-1.105409, -1.031571, -1.750716, 0, 0, 0, 1, 1,
-1.099797, -0.1620833, -2.583647, 0, 0, 0, 1, 1,
-1.099754, 0.1711773, -1.859952, 0, 0, 0, 1, 1,
-1.095248, 1.496343, -1.396832, 0, 0, 0, 1, 1,
-1.083819, -0.3182112, -1.750592, 0, 0, 0, 1, 1,
-1.081184, -1.673417, -2.584101, 0, 0, 0, 1, 1,
-1.080639, -0.1349961, -3.044749, 0, 0, 0, 1, 1,
-1.076491, 0.6971515, -1.51455, 1, 1, 1, 1, 1,
-1.072892, -0.07884981, -2.108719, 1, 1, 1, 1, 1,
-1.067119, 0.1678285, -0.6990545, 1, 1, 1, 1, 1,
-1.061772, 0.4400681, -1.317666, 1, 1, 1, 1, 1,
-1.059376, -0.2928743, -2.650173, 1, 1, 1, 1, 1,
-1.052436, 1.217209, -1.629107, 1, 1, 1, 1, 1,
-1.050786, 0.9612693, -1.17597, 1, 1, 1, 1, 1,
-1.050115, -0.4789994, -2.196461, 1, 1, 1, 1, 1,
-1.044021, 0.2091402, -1.422829, 1, 1, 1, 1, 1,
-1.043509, -0.06544814, -1.040886, 1, 1, 1, 1, 1,
-1.043347, -0.5530593, -2.091923, 1, 1, 1, 1, 1,
-1.042383, 1.381791, 0.2403356, 1, 1, 1, 1, 1,
-1.039072, -2.376277, -3.658469, 1, 1, 1, 1, 1,
-1.034118, -1.381959, -4.491483, 1, 1, 1, 1, 1,
-1.03063, -0.009876206, -1.252375, 1, 1, 1, 1, 1,
-1.02737, -0.7658709, -2.349818, 0, 0, 1, 1, 1,
-1.024361, -1.20887, -2.325534, 1, 0, 0, 1, 1,
-1.020756, 1.141246, -0.1128393, 1, 0, 0, 1, 1,
-1.01876, 1.417635, -1.613989, 1, 0, 0, 1, 1,
-1.015074, -1.414148, -0.8998911, 1, 0, 0, 1, 1,
-1.008693, -1.956265, -1.472258, 1, 0, 0, 1, 1,
-1.000704, -0.1357038, -0.06342841, 0, 0, 0, 1, 1,
-0.9985895, 1.214122, -0.04418891, 0, 0, 0, 1, 1,
-0.9983616, 0.2801113, 0.2236957, 0, 0, 0, 1, 1,
-0.9859239, -1.214024, -2.497448, 0, 0, 0, 1, 1,
-0.9791704, 1.122013, -0.22631, 0, 0, 0, 1, 1,
-0.9769059, 0.6617087, -0.07856422, 0, 0, 0, 1, 1,
-0.9692194, 0.8642055, -1.213045, 0, 0, 0, 1, 1,
-0.9640085, 2.947778, -0.2811104, 1, 1, 1, 1, 1,
-0.9627181, 0.154706, -0.4588212, 1, 1, 1, 1, 1,
-0.9622423, -0.6838228, -1.797802, 1, 1, 1, 1, 1,
-0.9593306, 2.123642, -0.3265058, 1, 1, 1, 1, 1,
-0.9534576, -2.234933, -4.659134, 1, 1, 1, 1, 1,
-0.9522251, -1.111571, -3.611458, 1, 1, 1, 1, 1,
-0.9438773, 1.634893, -0.1278689, 1, 1, 1, 1, 1,
-0.9414712, -0.8142767, -1.924381, 1, 1, 1, 1, 1,
-0.9399242, -0.1575406, -1.084121, 1, 1, 1, 1, 1,
-0.9259902, 0.6022587, -2.5188, 1, 1, 1, 1, 1,
-0.9258113, 1.12588, -0.3106223, 1, 1, 1, 1, 1,
-0.9246622, -0.08360812, -1.431348, 1, 1, 1, 1, 1,
-0.9212515, -0.2558658, -3.58592, 1, 1, 1, 1, 1,
-0.9200088, 1.209311, -0.3446966, 1, 1, 1, 1, 1,
-0.9129754, -1.119802, -1.271351, 1, 1, 1, 1, 1,
-0.9057453, 0.3793501, 0.1426667, 0, 0, 1, 1, 1,
-0.8999799, -0.3931746, -1.610888, 1, 0, 0, 1, 1,
-0.8951104, -0.7464867, -4.12676, 1, 0, 0, 1, 1,
-0.8947302, -0.9627112, -0.2622494, 1, 0, 0, 1, 1,
-0.894495, -0.707607, -3.471315, 1, 0, 0, 1, 1,
-0.8789946, 0.04036742, -1.200431, 1, 0, 0, 1, 1,
-0.8784696, 1.068116, -0.534273, 0, 0, 0, 1, 1,
-0.8734542, -0.3932469, -1.449197, 0, 0, 0, 1, 1,
-0.8681627, -0.5135127, -2.347049, 0, 0, 0, 1, 1,
-0.8678831, 1.785616, 0.2027817, 0, 0, 0, 1, 1,
-0.8602181, 0.8080391, -1.004206, 0, 0, 0, 1, 1,
-0.8601884, 0.705626, -0.02286011, 0, 0, 0, 1, 1,
-0.8492326, 1.199509, -0.06725921, 0, 0, 0, 1, 1,
-0.8491704, 0.0405613, -2.805488, 1, 1, 1, 1, 1,
-0.8485992, 0.9965911, -0.9855319, 1, 1, 1, 1, 1,
-0.8459185, -0.8445875, -4.08529, 1, 1, 1, 1, 1,
-0.8430225, 1.581805, -1.05218, 1, 1, 1, 1, 1,
-0.840234, -0.1351102, -1.600989, 1, 1, 1, 1, 1,
-0.8363455, 1.22566, -1.591879, 1, 1, 1, 1, 1,
-0.831427, -1.251381, -4.441519, 1, 1, 1, 1, 1,
-0.8255343, -0.7440522, -1.366033, 1, 1, 1, 1, 1,
-0.8242774, -0.14169, -3.885964, 1, 1, 1, 1, 1,
-0.8200791, 0.8085204, -1.919572, 1, 1, 1, 1, 1,
-0.8176922, -0.01965033, -0.8587669, 1, 1, 1, 1, 1,
-0.814734, -0.0692092, -1.419123, 1, 1, 1, 1, 1,
-0.812522, 1.702827, 0.9110811, 1, 1, 1, 1, 1,
-0.8105518, -0.9056613, -1.561651, 1, 1, 1, 1, 1,
-0.8103587, 1.05521, 0.1541743, 1, 1, 1, 1, 1,
-0.8102361, 1.36798, -0.7160061, 0, 0, 1, 1, 1,
-0.8094459, -0.9109432, -1.442937, 1, 0, 0, 1, 1,
-0.808094, 1.559738, 0.02888945, 1, 0, 0, 1, 1,
-0.8047714, -2.665431, -2.236866, 1, 0, 0, 1, 1,
-0.7911891, 0.6478206, -1.760081, 1, 0, 0, 1, 1,
-0.7894433, -1.103261, -2.179838, 1, 0, 0, 1, 1,
-0.7869505, -0.02480704, -1.939852, 0, 0, 0, 1, 1,
-0.7849761, 2.376301, -1.439038, 0, 0, 0, 1, 1,
-0.7817807, 0.7229716, -1.102056, 0, 0, 0, 1, 1,
-0.777347, -0.2268617, -2.060309, 0, 0, 0, 1, 1,
-0.7693363, -0.08713206, -2.255865, 0, 0, 0, 1, 1,
-0.7682184, -1.005963, 0.0676571, 0, 0, 0, 1, 1,
-0.7664015, -0.7696495, -0.7106224, 0, 0, 0, 1, 1,
-0.7630794, -0.02455186, -0.9480287, 1, 1, 1, 1, 1,
-0.7625259, 1.400425, -0.8338771, 1, 1, 1, 1, 1,
-0.7623907, 0.03517657, -2.044538, 1, 1, 1, 1, 1,
-0.7612408, 0.4790635, 0.4256605, 1, 1, 1, 1, 1,
-0.7500944, -0.2631237, -1.863566, 1, 1, 1, 1, 1,
-0.7379324, -1.50614, -2.610018, 1, 1, 1, 1, 1,
-0.7349541, 1.320129, 0.2237986, 1, 1, 1, 1, 1,
-0.7344055, 0.2592801, -1.883806, 1, 1, 1, 1, 1,
-0.7302992, 0.2717155, -2.337608, 1, 1, 1, 1, 1,
-0.7298616, -0.4778777, -1.673663, 1, 1, 1, 1, 1,
-0.7295076, -0.711443, -2.619835, 1, 1, 1, 1, 1,
-0.7292603, 0.895305, 1.021637, 1, 1, 1, 1, 1,
-0.7193613, -0.3540935, -2.008666, 1, 1, 1, 1, 1,
-0.7175542, 1.01462, -0.9608161, 1, 1, 1, 1, 1,
-0.7157215, -0.3205121, -3.408046, 1, 1, 1, 1, 1,
-0.7061517, -1.016845, -3.299141, 0, 0, 1, 1, 1,
-0.7008448, -2.381114, -3.768081, 1, 0, 0, 1, 1,
-0.6960573, -0.3346648, -2.423212, 1, 0, 0, 1, 1,
-0.6955426, -0.4985513, -1.592342, 1, 0, 0, 1, 1,
-0.6955104, -0.5417266, -3.258, 1, 0, 0, 1, 1,
-0.694477, 0.3152732, -0.1293549, 1, 0, 0, 1, 1,
-0.6937971, -0.8942645, -2.047327, 0, 0, 0, 1, 1,
-0.6916547, 0.2389116, -1.392632, 0, 0, 0, 1, 1,
-0.6899979, -0.003287253, -1.206608, 0, 0, 0, 1, 1,
-0.687509, 0.3628079, -2.150749, 0, 0, 0, 1, 1,
-0.6871592, 1.242534, -1.205373, 0, 0, 0, 1, 1,
-0.6850914, 0.1272646, -0.6393719, 0, 0, 0, 1, 1,
-0.6791155, 1.404045, -1.491513, 0, 0, 0, 1, 1,
-0.6779114, 1.069046, 0.03728019, 1, 1, 1, 1, 1,
-0.6693406, 0.4544188, -0.3496446, 1, 1, 1, 1, 1,
-0.6683409, 0.8411598, -0.8861006, 1, 1, 1, 1, 1,
-0.6679153, 0.575687, -1.992841, 1, 1, 1, 1, 1,
-0.6654864, 0.617518, -2.322423, 1, 1, 1, 1, 1,
-0.6596879, 1.012781, -1.408649, 1, 1, 1, 1, 1,
-0.6596363, -1.778018, -3.569551, 1, 1, 1, 1, 1,
-0.6552367, 1.244324, 0.575036, 1, 1, 1, 1, 1,
-0.6429579, 0.9893463, -1.186839, 1, 1, 1, 1, 1,
-0.6416621, -0.3046119, -2.01983, 1, 1, 1, 1, 1,
-0.6415359, -0.3768352, -2.978349, 1, 1, 1, 1, 1,
-0.6394098, 0.7175485, -0.8429615, 1, 1, 1, 1, 1,
-0.637579, 0.2185072, -2.27672, 1, 1, 1, 1, 1,
-0.6351172, -0.5925342, -1.607087, 1, 1, 1, 1, 1,
-0.6308416, 0.8304772, 0.7738802, 1, 1, 1, 1, 1,
-0.6283319, 0.5142416, -2.90888, 0, 0, 1, 1, 1,
-0.6273778, 0.08375362, -0.7603549, 1, 0, 0, 1, 1,
-0.6242955, 1.166273, -0.01937408, 1, 0, 0, 1, 1,
-0.6228214, -0.2669742, -2.320426, 1, 0, 0, 1, 1,
-0.6223367, -0.3923016, -4.024729, 1, 0, 0, 1, 1,
-0.6158533, -1.277111, -1.160478, 1, 0, 0, 1, 1,
-0.6118491, 0.6647401, -1.170047, 0, 0, 0, 1, 1,
-0.6026239, 1.653229, -2.4956, 0, 0, 0, 1, 1,
-0.6000578, 0.5442912, 0.1141386, 0, 0, 0, 1, 1,
-0.5998373, 0.001727018, -0.2025714, 0, 0, 0, 1, 1,
-0.5984074, 0.4633231, -1.18213, 0, 0, 0, 1, 1,
-0.5956417, 0.2284061, -0.5314575, 0, 0, 0, 1, 1,
-0.5888878, 0.8940532, 0.2740868, 0, 0, 0, 1, 1,
-0.5850001, 1.817702, 0.06138735, 1, 1, 1, 1, 1,
-0.5766901, 1.250901, -0.08319573, 1, 1, 1, 1, 1,
-0.5765526, 0.5053791, -0.8169308, 1, 1, 1, 1, 1,
-0.5764647, 0.5300137, -0.5268697, 1, 1, 1, 1, 1,
-0.5750018, -0.271488, -2.613633, 1, 1, 1, 1, 1,
-0.5712155, 0.6217646, 0.6868691, 1, 1, 1, 1, 1,
-0.5691844, -0.8963523, -3.938408, 1, 1, 1, 1, 1,
-0.5672032, -1.265932, -4.580054, 1, 1, 1, 1, 1,
-0.5665459, -0.5937765, -1.55932, 1, 1, 1, 1, 1,
-0.5656554, -0.3610933, -1.030795, 1, 1, 1, 1, 1,
-0.5563872, -0.896718, -2.075289, 1, 1, 1, 1, 1,
-0.5549527, -0.9862846, -1.35746, 1, 1, 1, 1, 1,
-0.5433787, 1.138823, 0.6126804, 1, 1, 1, 1, 1,
-0.5396104, -0.6701171, -1.152735, 1, 1, 1, 1, 1,
-0.5363364, -1.185947, -2.032549, 1, 1, 1, 1, 1,
-0.5269234, -0.7972097, -2.431918, 0, 0, 1, 1, 1,
-0.5261205, -0.5950687, -3.327307, 1, 0, 0, 1, 1,
-0.52183, -1.316915, -3.211356, 1, 0, 0, 1, 1,
-0.5168337, 1.020775, -0.4991017, 1, 0, 0, 1, 1,
-0.5163949, 2.451766, -0.7074143, 1, 0, 0, 1, 1,
-0.5139763, -0.8206789, -1.184528, 1, 0, 0, 1, 1,
-0.511605, -1.033111, -0.7972177, 0, 0, 0, 1, 1,
-0.507692, -0.7320531, -2.41287, 0, 0, 0, 1, 1,
-0.5046166, -0.667938, -1.890483, 0, 0, 0, 1, 1,
-0.5030643, 1.960988, -1.340435, 0, 0, 0, 1, 1,
-0.5013297, 0.06398804, -0.5990183, 0, 0, 0, 1, 1,
-0.5012829, -0.09205101, -2.6724, 0, 0, 0, 1, 1,
-0.4965368, 0.0499225, -2.122077, 0, 0, 0, 1, 1,
-0.4941345, 0.6837419, 1.071935, 1, 1, 1, 1, 1,
-0.4888247, -0.1271917, -1.890772, 1, 1, 1, 1, 1,
-0.4840378, -1.00682, -3.054722, 1, 1, 1, 1, 1,
-0.4808794, -0.1050275, -0.5363265, 1, 1, 1, 1, 1,
-0.4806142, -0.8617633, -3.045956, 1, 1, 1, 1, 1,
-0.4780663, -0.8424463, -2.492497, 1, 1, 1, 1, 1,
-0.4726168, -1.654465, -3.401338, 1, 1, 1, 1, 1,
-0.470339, -0.9090371, -4.492433, 1, 1, 1, 1, 1,
-0.4671536, 1.317362, 0.820036, 1, 1, 1, 1, 1,
-0.465742, 0.2457223, -0.06694385, 1, 1, 1, 1, 1,
-0.4529211, 0.05650778, -2.005806, 1, 1, 1, 1, 1,
-0.4512893, 0.838162, -1.30092, 1, 1, 1, 1, 1,
-0.445733, -0.1287763, -2.526551, 1, 1, 1, 1, 1,
-0.4403211, 0.6909562, -1.210941, 1, 1, 1, 1, 1,
-0.4375803, 0.690139, -1.194096, 1, 1, 1, 1, 1,
-0.4341245, -2.059159, -2.38614, 0, 0, 1, 1, 1,
-0.4331843, -2.301589, -1.869661, 1, 0, 0, 1, 1,
-0.4308155, 0.9412304, -2.194522, 1, 0, 0, 1, 1,
-0.4292286, 0.002488351, -1.58133, 1, 0, 0, 1, 1,
-0.427772, 1.109132, -2.123533, 1, 0, 0, 1, 1,
-0.4277282, -0.359675, -0.4402023, 1, 0, 0, 1, 1,
-0.4275338, 0.2631048, 0.1066387, 0, 0, 0, 1, 1,
-0.4215997, -0.1580923, -1.971923, 0, 0, 0, 1, 1,
-0.4198734, 0.5615435, 0.8196489, 0, 0, 0, 1, 1,
-0.4113547, 1.410818, 0.6461257, 0, 0, 0, 1, 1,
-0.4104784, -0.6304571, -1.49901, 0, 0, 0, 1, 1,
-0.4082756, -0.1970432, -2.413005, 0, 0, 0, 1, 1,
-0.4049388, 1.135091, -1.088024, 0, 0, 0, 1, 1,
-0.4034582, 0.8658819, -2.358581, 1, 1, 1, 1, 1,
-0.3941818, 0.4612555, -0.4420021, 1, 1, 1, 1, 1,
-0.391233, -3.040036, -1.982909, 1, 1, 1, 1, 1,
-0.3900169, -0.3655213, -1.560494, 1, 1, 1, 1, 1,
-0.3900119, 0.04437538, -1.216037, 1, 1, 1, 1, 1,
-0.3886223, -1.389406, -3.049392, 1, 1, 1, 1, 1,
-0.3826734, 0.8142218, 0.1454187, 1, 1, 1, 1, 1,
-0.3819389, -0.5335374, -1.434032, 1, 1, 1, 1, 1,
-0.3813184, 0.6862935, -0.8967572, 1, 1, 1, 1, 1,
-0.3809381, -1.291013, -3.320001, 1, 1, 1, 1, 1,
-0.3794321, -0.7155502, -2.779253, 1, 1, 1, 1, 1,
-0.3778301, -0.9890071, -4.132096, 1, 1, 1, 1, 1,
-0.3776587, -0.9014984, -3.278623, 1, 1, 1, 1, 1,
-0.37443, 0.1866332, -1.759021, 1, 1, 1, 1, 1,
-0.3732035, 0.3007168, -0.462424, 1, 1, 1, 1, 1,
-0.3721364, -0.7518268, -1.482803, 0, 0, 1, 1, 1,
-0.3705409, 0.5549299, -1.672883, 1, 0, 0, 1, 1,
-0.3689055, -0.7091569, -2.442993, 1, 0, 0, 1, 1,
-0.3687596, -1.275963, -3.061258, 1, 0, 0, 1, 1,
-0.3681868, 0.6983067, -0.4470853, 1, 0, 0, 1, 1,
-0.365807, 0.5912389, -0.6936947, 1, 0, 0, 1, 1,
-0.365465, 1.367338, -0.8326927, 0, 0, 0, 1, 1,
-0.3646553, -0.8583479, -3.742303, 0, 0, 0, 1, 1,
-0.3642405, -0.7017854, -3.763059, 0, 0, 0, 1, 1,
-0.3604715, -1.098424, -2.350564, 0, 0, 0, 1, 1,
-0.3548766, -0.1116619, -1.355925, 0, 0, 0, 1, 1,
-0.3530067, 1.390511, 1.021267, 0, 0, 0, 1, 1,
-0.3465708, -0.1028254, -2.794893, 0, 0, 0, 1, 1,
-0.342436, 0.8725871, -1.233637, 1, 1, 1, 1, 1,
-0.3392292, 1.172839, -2.163088, 1, 1, 1, 1, 1,
-0.3379023, -0.8081563, -3.031598, 1, 1, 1, 1, 1,
-0.3342999, 1.160033, -0.5218807, 1, 1, 1, 1, 1,
-0.3277229, -0.04053615, -3.187313, 1, 1, 1, 1, 1,
-0.3243871, -0.4606241, -2.466327, 1, 1, 1, 1, 1,
-0.3206752, 0.9258811, -0.38986, 1, 1, 1, 1, 1,
-0.318867, 0.7837418, 1.740611, 1, 1, 1, 1, 1,
-0.3174263, 1.231434, -2.141927, 1, 1, 1, 1, 1,
-0.3165932, -0.923991, -2.569035, 1, 1, 1, 1, 1,
-0.31179, -0.3396131, -2.48246, 1, 1, 1, 1, 1,
-0.3113943, 0.1955341, -1.482476, 1, 1, 1, 1, 1,
-0.3102406, -0.04694055, -1.319526, 1, 1, 1, 1, 1,
-0.3087248, -0.03160512, -0.7302759, 1, 1, 1, 1, 1,
-0.3087014, -0.5114484, -2.719109, 1, 1, 1, 1, 1,
-0.3059551, 0.4225962, -0.3202793, 0, 0, 1, 1, 1,
-0.3039983, -1.267184, -4.169988, 1, 0, 0, 1, 1,
-0.3014061, -0.6948037, -2.900503, 1, 0, 0, 1, 1,
-0.2960641, -1.132629, -3.932667, 1, 0, 0, 1, 1,
-0.2921405, -0.04628139, -1.667291, 1, 0, 0, 1, 1,
-0.2919579, 0.4255043, -0.04701135, 1, 0, 0, 1, 1,
-0.291184, 0.1572692, -0.7651065, 0, 0, 0, 1, 1,
-0.2826988, 0.6460511, 1.380808, 0, 0, 0, 1, 1,
-0.2727785, 0.5528468, -0.3215536, 0, 0, 0, 1, 1,
-0.2694447, 1.317979, -0.593959, 0, 0, 0, 1, 1,
-0.2678491, 2.039604, -0.1247299, 0, 0, 0, 1, 1,
-0.2567706, -0.7431834, -3.962104, 0, 0, 0, 1, 1,
-0.2529087, 0.3390902, -0.1587198, 0, 0, 0, 1, 1,
-0.2524493, 2.181061, -0.2810061, 1, 1, 1, 1, 1,
-0.2452459, 0.6233335, 0.3279581, 1, 1, 1, 1, 1,
-0.2376544, -0.4033085, -5.292768, 1, 1, 1, 1, 1,
-0.2368097, -0.2978182, -2.527973, 1, 1, 1, 1, 1,
-0.2364816, 0.6174192, 0.3069035, 1, 1, 1, 1, 1,
-0.2313329, -1.048222, -3.25791, 1, 1, 1, 1, 1,
-0.2119268, -0.2429692, -3.729543, 1, 1, 1, 1, 1,
-0.2089762, -1.393929, -4.43539, 1, 1, 1, 1, 1,
-0.2076991, 0.4236267, -2.214787, 1, 1, 1, 1, 1,
-0.2006528, -0.9666992, -4.76266, 1, 1, 1, 1, 1,
-0.2005004, 1.306, -0.09703887, 1, 1, 1, 1, 1,
-0.2004999, 0.3945845, 1.443563, 1, 1, 1, 1, 1,
-0.2000562, -2.664029, -3.673716, 1, 1, 1, 1, 1,
-0.197066, -0.05433346, -1.021841, 1, 1, 1, 1, 1,
-0.1924744, 0.148732, -1.91148, 1, 1, 1, 1, 1,
-0.190599, -0.4784182, -3.352401, 0, 0, 1, 1, 1,
-0.190071, 0.142095, -0.4766177, 1, 0, 0, 1, 1,
-0.1881827, 1.020192, -0.7017381, 1, 0, 0, 1, 1,
-0.187893, -1.274278, -2.447055, 1, 0, 0, 1, 1,
-0.1831151, -0.4225718, -3.354068, 1, 0, 0, 1, 1,
-0.1828227, -0.8412096, -1.478588, 1, 0, 0, 1, 1,
-0.1809451, -0.0254455, -1.321574, 0, 0, 0, 1, 1,
-0.1802734, -0.6241475, -1.185025, 0, 0, 0, 1, 1,
-0.1790728, 0.02723736, -0.542771, 0, 0, 0, 1, 1,
-0.1780142, 1.548352, 1.062379, 0, 0, 0, 1, 1,
-0.1772951, 0.6142813, -0.703895, 0, 0, 0, 1, 1,
-0.1739323, -0.2088232, -2.875017, 0, 0, 0, 1, 1,
-0.1716655, -0.7920554, -2.802951, 0, 0, 0, 1, 1,
-0.1714012, 0.5802915, -0.6390886, 1, 1, 1, 1, 1,
-0.1701253, 0.449522, 0.941921, 1, 1, 1, 1, 1,
-0.152315, -1.183987, -3.144321, 1, 1, 1, 1, 1,
-0.1505331, 0.2439811, -1.659058, 1, 1, 1, 1, 1,
-0.1504033, -0.767627, -2.950413, 1, 1, 1, 1, 1,
-0.1473961, -1.022556, -1.799989, 1, 1, 1, 1, 1,
-0.1464431, 0.2096673, -1.640903, 1, 1, 1, 1, 1,
-0.1367497, 0.2829477, -0.8863754, 1, 1, 1, 1, 1,
-0.1346217, 1.191156, 0.8754178, 1, 1, 1, 1, 1,
-0.1344426, -0.79895, -2.017529, 1, 1, 1, 1, 1,
-0.1327464, 0.3156149, -0.502456, 1, 1, 1, 1, 1,
-0.127089, -0.02518363, -3.090122, 1, 1, 1, 1, 1,
-0.1186232, -0.1557008, -1.862302, 1, 1, 1, 1, 1,
-0.1171286, 0.5291914, -1.178717, 1, 1, 1, 1, 1,
-0.1169085, 0.06814922, -1.137205, 1, 1, 1, 1, 1,
-0.1136578, -0.06658646, -2.514143, 0, 0, 1, 1, 1,
-0.1119948, 0.7962261, -1.231391, 1, 0, 0, 1, 1,
-0.1116304, 0.1882148, -1.226631, 1, 0, 0, 1, 1,
-0.1092249, -1.321607, -4.167497, 1, 0, 0, 1, 1,
-0.1086052, -0.1896213, -3.719737, 1, 0, 0, 1, 1,
-0.1079881, -0.5064309, -2.985961, 1, 0, 0, 1, 1,
-0.1045416, -1.237307, -2.726184, 0, 0, 0, 1, 1,
-0.1018573, -1.123135, -4.969764, 0, 0, 0, 1, 1,
-0.101086, 0.06112798, -1.574651, 0, 0, 0, 1, 1,
-0.1007187, -0.9426175, -3.726557, 0, 0, 0, 1, 1,
-0.08849473, 1.400063, 0.3285567, 0, 0, 0, 1, 1,
-0.08729871, 1.506963, -1.224481, 0, 0, 0, 1, 1,
-0.08632463, -0.3885068, -2.448298, 0, 0, 0, 1, 1,
-0.08217052, -1.542721, -1.458724, 1, 1, 1, 1, 1,
-0.07744377, -0.7198645, -2.975995, 1, 1, 1, 1, 1,
-0.0768486, 1.082063, -0.5150788, 1, 1, 1, 1, 1,
-0.07578867, -1.52256, -3.090303, 1, 1, 1, 1, 1,
-0.07436715, -1.140342, -3.417685, 1, 1, 1, 1, 1,
-0.07228348, -0.7669554, -3.199396, 1, 1, 1, 1, 1,
-0.07174533, -0.2050874, -2.204192, 1, 1, 1, 1, 1,
-0.07059915, -1.488632, -4.065778, 1, 1, 1, 1, 1,
-0.0634717, 1.688163, -0.02141654, 1, 1, 1, 1, 1,
-0.0580636, 2.953782, 1.601904, 1, 1, 1, 1, 1,
-0.05258777, 0.4755168, -0.03990346, 1, 1, 1, 1, 1,
-0.05132183, 0.04497674, -1.593379, 1, 1, 1, 1, 1,
-0.04940606, 0.7515445, -0.9519638, 1, 1, 1, 1, 1,
-0.04790257, -0.0911463, -3.178388, 1, 1, 1, 1, 1,
-0.04732561, -0.3823241, -2.141787, 1, 1, 1, 1, 1,
-0.04608334, -1.71122, -2.77444, 0, 0, 1, 1, 1,
-0.03053795, 0.4190069, -0.9675595, 1, 0, 0, 1, 1,
-0.03009957, 0.2158494, -1.254514, 1, 0, 0, 1, 1,
-0.03003385, -0.6347137, -1.369601, 1, 0, 0, 1, 1,
-0.0271109, 0.04482108, -0.555329, 1, 0, 0, 1, 1,
-0.02495966, 0.2432991, 0.02494251, 1, 0, 0, 1, 1,
-0.02351709, 0.4196551, 0.6103066, 0, 0, 0, 1, 1,
-0.02106899, -0.8794396, -2.778682, 0, 0, 0, 1, 1,
-0.02009168, 1.069713, 0.7536588, 0, 0, 0, 1, 1,
-0.01935051, 1.06821, -0.1330742, 0, 0, 0, 1, 1,
-0.01763125, 0.5270065, 1.642246, 0, 0, 0, 1, 1,
-0.01759041, 0.7158211, 1.775535, 0, 0, 0, 1, 1,
-0.01713737, 0.319143, -0.3771912, 0, 0, 0, 1, 1,
-0.01681549, 0.2276645, 1.171903, 1, 1, 1, 1, 1,
-0.01675836, 0.9993472, -0.09992392, 1, 1, 1, 1, 1,
-0.01215091, -0.08304519, -3.845672, 1, 1, 1, 1, 1,
-0.01027301, -0.104208, -3.297776, 1, 1, 1, 1, 1,
-0.007656517, -0.1832671, -2.665236, 1, 1, 1, 1, 1,
-0.004074542, -1.122628, -3.255135, 1, 1, 1, 1, 1,
-0.002198093, 0.3375269, -1.71265, 1, 1, 1, 1, 1,
-0.001648455, -1.121131, -3.153832, 1, 1, 1, 1, 1,
5.851341e-05, -1.543613, 2.159892, 1, 1, 1, 1, 1,
0.00110197, -0.4698869, 4.15837, 1, 1, 1, 1, 1,
0.009506078, -0.5089576, 2.940051, 1, 1, 1, 1, 1,
0.01041182, 1.334664, -0.01005387, 1, 1, 1, 1, 1,
0.02016507, 0.7202286, -0.9016052, 1, 1, 1, 1, 1,
0.02208393, 0.1580144, 1.449968, 1, 1, 1, 1, 1,
0.0252885, -1.669393, 3.262124, 1, 1, 1, 1, 1,
0.02784832, -0.9463534, 3.065717, 0, 0, 1, 1, 1,
0.03095937, 0.1761265, -0.4603895, 1, 0, 0, 1, 1,
0.0330278, -2.182974, 4.259139, 1, 0, 0, 1, 1,
0.03328479, -0.8554475, 2.433445, 1, 0, 0, 1, 1,
0.03417375, -1.384881, 4.274397, 1, 0, 0, 1, 1,
0.03600561, -0.8641209, 2.511293, 1, 0, 0, 1, 1,
0.03822544, 0.7492109, -0.8493494, 0, 0, 0, 1, 1,
0.03835859, -0.2224969, 3.314191, 0, 0, 0, 1, 1,
0.04003653, 0.05979611, 2.126985, 0, 0, 0, 1, 1,
0.04074335, 1.046772, 0.3103275, 0, 0, 0, 1, 1,
0.05354569, 0.0057801, 2.223983, 0, 0, 0, 1, 1,
0.0551424, 1.093478, -0.1414884, 0, 0, 0, 1, 1,
0.05681548, -1.337715, 3.395463, 0, 0, 0, 1, 1,
0.0575978, 0.2101058, 0.06931207, 1, 1, 1, 1, 1,
0.06624503, 0.2851465, -0.05802384, 1, 1, 1, 1, 1,
0.06735121, -0.08406021, 2.668871, 1, 1, 1, 1, 1,
0.07237074, 0.3065793, 1.988526, 1, 1, 1, 1, 1,
0.0736789, 0.5901785, -0.186559, 1, 1, 1, 1, 1,
0.07667394, -0.2634365, 2.141501, 1, 1, 1, 1, 1,
0.07997946, 0.8128933, -1.087756, 1, 1, 1, 1, 1,
0.08040734, -0.9854258, 3.470219, 1, 1, 1, 1, 1,
0.08449276, 0.2598775, 2.765425, 1, 1, 1, 1, 1,
0.0851337, -0.9313251, 1.246806, 1, 1, 1, 1, 1,
0.08666677, 1.134055, 0.7491503, 1, 1, 1, 1, 1,
0.08674812, 1.451895, 0.8592536, 1, 1, 1, 1, 1,
0.09036538, -0.552351, 4.954628, 1, 1, 1, 1, 1,
0.09463454, 0.5388476, 1.448781, 1, 1, 1, 1, 1,
0.09487756, 0.4961255, 0.6038885, 1, 1, 1, 1, 1,
0.1004841, -0.04664537, 0.9259104, 0, 0, 1, 1, 1,
0.1008821, -0.2211663, 2.663593, 1, 0, 0, 1, 1,
0.1025473, -0.8213139, 3.765562, 1, 0, 0, 1, 1,
0.1041503, 0.6131482, 0.2379857, 1, 0, 0, 1, 1,
0.1095119, -0.1887355, 3.054069, 1, 0, 0, 1, 1,
0.1104207, -0.4569521, 2.135551, 1, 0, 0, 1, 1,
0.1135428, -0.2333497, 2.044441, 0, 0, 0, 1, 1,
0.1196165, 0.8908408, 1.526039, 0, 0, 0, 1, 1,
0.1267727, 1.250902, 0.8490914, 0, 0, 0, 1, 1,
0.1298078, 0.4796052, 0.5333567, 0, 0, 0, 1, 1,
0.1326251, 0.3909816, -1.025571, 0, 0, 0, 1, 1,
0.1346277, 0.421999, 1.511395, 0, 0, 0, 1, 1,
0.1360006, 0.9650075, -0.07229193, 0, 0, 0, 1, 1,
0.1362953, -0.7620426, 2.769053, 1, 1, 1, 1, 1,
0.1380542, -1.002761, 2.967609, 1, 1, 1, 1, 1,
0.1384648, -0.5711548, 2.283276, 1, 1, 1, 1, 1,
0.1451323, -0.7251727, 3.026209, 1, 1, 1, 1, 1,
0.1458363, 0.9408853, 0.1803351, 1, 1, 1, 1, 1,
0.1462618, 1.141561, -0.2711062, 1, 1, 1, 1, 1,
0.1470059, -1.618286, 2.366244, 1, 1, 1, 1, 1,
0.1473277, -1.618863, 2.503931, 1, 1, 1, 1, 1,
0.1540628, -0.2563567, 3.976692, 1, 1, 1, 1, 1,
0.1541356, -0.8947682, 4.453954, 1, 1, 1, 1, 1,
0.1578861, 1.108579, -1.670251, 1, 1, 1, 1, 1,
0.1666674, 1.632832, 1.990636, 1, 1, 1, 1, 1,
0.1667628, 2.056909, 0.07384191, 1, 1, 1, 1, 1,
0.1756644, -1.843848, 3.558189, 1, 1, 1, 1, 1,
0.1822142, 0.6469173, -0.9323182, 1, 1, 1, 1, 1,
0.1864944, 0.7767681, 2.255825, 0, 0, 1, 1, 1,
0.1867804, -0.6690426, 3.056584, 1, 0, 0, 1, 1,
0.1869477, -0.9306586, 2.647729, 1, 0, 0, 1, 1,
0.1890892, 0.7692151, -0.5766062, 1, 0, 0, 1, 1,
0.1907781, 0.6963668, 1.185045, 1, 0, 0, 1, 1,
0.1931079, 0.2478677, -0.4282023, 1, 0, 0, 1, 1,
0.1947337, -2.721705, 3.226769, 0, 0, 0, 1, 1,
0.1970472, 0.4048831, 1.523574, 0, 0, 0, 1, 1,
0.2064817, 2.33775, -1.120127, 0, 0, 0, 1, 1,
0.2064916, 0.9079114, -0.43039, 0, 0, 0, 1, 1,
0.2120096, -0.5713067, 2.455812, 0, 0, 0, 1, 1,
0.2164236, 0.8059416, -2.5866, 0, 0, 0, 1, 1,
0.2204549, 0.2087997, 2.092471, 0, 0, 0, 1, 1,
0.2340398, 0.8228241, 1.958741, 1, 1, 1, 1, 1,
0.2341534, 0.7149884, -1.669924, 1, 1, 1, 1, 1,
0.2396807, -1.077572, 3.250973, 1, 1, 1, 1, 1,
0.2443735, -1.172283, 3.231265, 1, 1, 1, 1, 1,
0.2526708, -0.6367515, 2.995938, 1, 1, 1, 1, 1,
0.2580826, 0.2971107, -0.2217823, 1, 1, 1, 1, 1,
0.2593539, -1.165314, 2.617541, 1, 1, 1, 1, 1,
0.2593698, -0.2051604, 1.404377, 1, 1, 1, 1, 1,
0.26015, -1.40354, 3.531248, 1, 1, 1, 1, 1,
0.2636426, -0.6505786, 2.920814, 1, 1, 1, 1, 1,
0.2711321, 0.4327088, -1.716107, 1, 1, 1, 1, 1,
0.2718, -0.09848986, 2.880962, 1, 1, 1, 1, 1,
0.2719164, 0.04416068, 0.6892281, 1, 1, 1, 1, 1,
0.2720564, -0.01009482, 2.211994, 1, 1, 1, 1, 1,
0.2752727, -1.355855, 4.671211, 1, 1, 1, 1, 1,
0.2759238, -0.4868216, 3.828508, 0, 0, 1, 1, 1,
0.2788447, -0.2453863, 1.966756, 1, 0, 0, 1, 1,
0.2789282, -0.6133529, 2.440633, 1, 0, 0, 1, 1,
0.2821909, -0.2515102, 2.1945, 1, 0, 0, 1, 1,
0.2826881, -0.04179307, 2.955241, 1, 0, 0, 1, 1,
0.2864946, -0.6847187, 1.379155, 1, 0, 0, 1, 1,
0.2882695, 0.9984295, 3.16678, 0, 0, 0, 1, 1,
0.2921539, 0.6885431, 0.08435526, 0, 0, 0, 1, 1,
0.2933968, -1.417623, 3.643726, 0, 0, 0, 1, 1,
0.296119, -0.7854281, 4.021865, 0, 0, 0, 1, 1,
0.2997309, 1.446355, 0.567221, 0, 0, 0, 1, 1,
0.3010016, 0.2792863, -0.5491464, 0, 0, 0, 1, 1,
0.3074338, -0.03965844, -0.548305, 0, 0, 0, 1, 1,
0.3095262, 1.064668, 0.9072195, 1, 1, 1, 1, 1,
0.313301, -0.2246088, 3.169848, 1, 1, 1, 1, 1,
0.3137922, -1.722988, 3.854166, 1, 1, 1, 1, 1,
0.3157883, 0.1518145, 1.558018, 1, 1, 1, 1, 1,
0.3167262, 1.095735, -0.2067043, 1, 1, 1, 1, 1,
0.3181027, -0.4146994, 2.115997, 1, 1, 1, 1, 1,
0.3248889, -1.087454, 1.739954, 1, 1, 1, 1, 1,
0.3262942, 1.634174, -1.0792, 1, 1, 1, 1, 1,
0.3283108, -0.6965918, 3.89012, 1, 1, 1, 1, 1,
0.3313144, 0.4442504, 0.5956861, 1, 1, 1, 1, 1,
0.3314907, 0.7286538, 0.799944, 1, 1, 1, 1, 1,
0.3322979, -0.8594125, 1.444811, 1, 1, 1, 1, 1,
0.3329332, -0.7803957, 3.037338, 1, 1, 1, 1, 1,
0.3357344, 0.4740095, -0.4160051, 1, 1, 1, 1, 1,
0.340346, -1.47638, 3.194227, 1, 1, 1, 1, 1,
0.3417912, 0.006748434, 2.104878, 0, 0, 1, 1, 1,
0.3440944, 0.9757878, -1.588959, 1, 0, 0, 1, 1,
0.3462867, 0.2220314, 0.965042, 1, 0, 0, 1, 1,
0.3534122, 0.9437315, -1.542542, 1, 0, 0, 1, 1,
0.3542153, 0.1918273, 3.040576, 1, 0, 0, 1, 1,
0.3558342, 2.39631, 0.4179252, 1, 0, 0, 1, 1,
0.3589279, 1.465659, -0.4498498, 0, 0, 0, 1, 1,
0.365215, 0.3985851, 1.592407, 0, 0, 0, 1, 1,
0.3702761, -1.1895, 3.404332, 0, 0, 0, 1, 1,
0.3810766, -0.4252147, 2.089941, 0, 0, 0, 1, 1,
0.3814248, 1.80498, 0.9114604, 0, 0, 0, 1, 1,
0.3816972, -0.5178068, 1.442298, 0, 0, 0, 1, 1,
0.3851846, 0.5078489, 1.191164, 0, 0, 0, 1, 1,
0.3858502, -0.1987575, 0.8169435, 1, 1, 1, 1, 1,
0.3866754, -1.229179, 4.07238, 1, 1, 1, 1, 1,
0.390817, -0.7374381, 2.670234, 1, 1, 1, 1, 1,
0.3920527, -1.397726, 2.087662, 1, 1, 1, 1, 1,
0.3922122, 1.866924, -0.1914864, 1, 1, 1, 1, 1,
0.3939016, -1.726117, 3.963552, 1, 1, 1, 1, 1,
0.4016797, 0.09475137, 0.8605538, 1, 1, 1, 1, 1,
0.4062632, 0.3015505, 1.138563, 1, 1, 1, 1, 1,
0.4074246, 0.5628772, 0.9599766, 1, 1, 1, 1, 1,
0.4115996, -0.06753125, 1.522295, 1, 1, 1, 1, 1,
0.4133765, -0.1890927, 1.734444, 1, 1, 1, 1, 1,
0.4149536, -0.9804712, 1.710102, 1, 1, 1, 1, 1,
0.4160364, 0.1387882, 0.5080236, 1, 1, 1, 1, 1,
0.4187205, 1.19139, -0.5968033, 1, 1, 1, 1, 1,
0.4204958, 0.632045, 0.5714692, 1, 1, 1, 1, 1,
0.4211463, -0.9522222, 1.698881, 0, 0, 1, 1, 1,
0.4223971, 1.670541, 0.4740009, 1, 0, 0, 1, 1,
0.4264016, 0.746667, -0.3323559, 1, 0, 0, 1, 1,
0.427146, -0.7374172, 1.939747, 1, 0, 0, 1, 1,
0.4284442, -1.012622, 2.434619, 1, 0, 0, 1, 1,
0.4294373, 0.3185855, 0.9810994, 1, 0, 0, 1, 1,
0.4387601, -0.19483, 1.39685, 0, 0, 0, 1, 1,
0.4453455, 0.8995014, -0.4101515, 0, 0, 0, 1, 1,
0.4487303, 0.3905953, 0.714459, 0, 0, 0, 1, 1,
0.4532653, 0.6824102, 0.7169877, 0, 0, 0, 1, 1,
0.4536277, -0.8825972, 2.921767, 0, 0, 0, 1, 1,
0.4577067, -1.37194, 2.801729, 0, 0, 0, 1, 1,
0.4582053, 0.8312265, -0.1805677, 0, 0, 0, 1, 1,
0.4596773, -0.5000682, 4.152498, 1, 1, 1, 1, 1,
0.4643397, 0.4785583, -0.9791799, 1, 1, 1, 1, 1,
0.4718405, 0.5433016, 0.06809727, 1, 1, 1, 1, 1,
0.4742612, 0.9926718, -1.69684, 1, 1, 1, 1, 1,
0.4764942, -1.595791, 1.175289, 1, 1, 1, 1, 1,
0.4814516, -1.522566, 2.474699, 1, 1, 1, 1, 1,
0.4829809, -1.000764, 2.819744, 1, 1, 1, 1, 1,
0.4847108, 0.5119182, -0.3522728, 1, 1, 1, 1, 1,
0.4859435, -0.8113171, 2.537635, 1, 1, 1, 1, 1,
0.4859721, -1.068473, 1.469371, 1, 1, 1, 1, 1,
0.486326, -0.3953395, 5.192571, 1, 1, 1, 1, 1,
0.4864806, 0.2005663, 0.4441459, 1, 1, 1, 1, 1,
0.4870365, 0.9164777, 1.187722, 1, 1, 1, 1, 1,
0.4876799, 1.056591, 0.34616, 1, 1, 1, 1, 1,
0.4935819, 1.925981, -0.6550446, 1, 1, 1, 1, 1,
0.4953738, -0.7229133, 0.1690101, 0, 0, 1, 1, 1,
0.4958321, -1.917496, 3.215146, 1, 0, 0, 1, 1,
0.4979488, -0.9070628, 2.07706, 1, 0, 0, 1, 1,
0.4993542, 1.240684, 1.077368, 1, 0, 0, 1, 1,
0.5003061, -0.5664759, 4.519433, 1, 0, 0, 1, 1,
0.5026167, 0.3537086, -0.9197987, 1, 0, 0, 1, 1,
0.505831, -0.06070812, -0.2237774, 0, 0, 0, 1, 1,
0.5126132, -0.7863638, 0.8216058, 0, 0, 0, 1, 1,
0.520291, 0.6597177, 1.107951, 0, 0, 0, 1, 1,
0.5321872, 1.440369, 1.261876, 0, 0, 0, 1, 1,
0.5325021, 0.0007817994, 1.662259, 0, 0, 0, 1, 1,
0.5345272, -0.6891688, 3.748087, 0, 0, 0, 1, 1,
0.5356153, 1.06284, 0.3408375, 0, 0, 0, 1, 1,
0.5415102, -2.143444, 2.383962, 1, 1, 1, 1, 1,
0.545743, 0.1128204, 3.23792, 1, 1, 1, 1, 1,
0.5542048, -0.3987182, 1.868891, 1, 1, 1, 1, 1,
0.5562824, 0.3661445, -0.2139781, 1, 1, 1, 1, 1,
0.5573982, 0.6438237, -0.01048795, 1, 1, 1, 1, 1,
0.559773, 0.3772445, 2.787019, 1, 1, 1, 1, 1,
0.5653514, 0.709165, -0.4251808, 1, 1, 1, 1, 1,
0.5695753, -1.023268, 2.635386, 1, 1, 1, 1, 1,
0.5708171, -0.8496432, 2.607129, 1, 1, 1, 1, 1,
0.5858473, -1.09178, 3.616858, 1, 1, 1, 1, 1,
0.6002924, 1.153179, 1.112759, 1, 1, 1, 1, 1,
0.6005575, -0.6551463, 1.508352, 1, 1, 1, 1, 1,
0.6031701, -0.9616886, 2.718303, 1, 1, 1, 1, 1,
0.6081029, 1.181784, 0.7218012, 1, 1, 1, 1, 1,
0.6109569, -1.101475, 0.1232428, 1, 1, 1, 1, 1,
0.6115924, 0.8857338, 1.095773, 0, 0, 1, 1, 1,
0.6119301, 0.03423058, 0.7750813, 1, 0, 0, 1, 1,
0.6131871, -0.3416434, 2.196773, 1, 0, 0, 1, 1,
0.613516, 1.073453, 2.55389, 1, 0, 0, 1, 1,
0.6160623, 0.9427289, 0.5154147, 1, 0, 0, 1, 1,
0.6243039, 1.705949, 0.2185433, 1, 0, 0, 1, 1,
0.6257225, -0.5310308, 2.673107, 0, 0, 0, 1, 1,
0.6280102, 0.3342299, 1.596512, 0, 0, 0, 1, 1,
0.62948, -0.4262, 3.331333, 0, 0, 0, 1, 1,
0.6302104, 0.5470643, -0.8518487, 0, 0, 0, 1, 1,
0.6335174, -0.3001996, 1.266587, 0, 0, 0, 1, 1,
0.6412017, -0.419993, 1.643669, 0, 0, 0, 1, 1,
0.6420898, 1.136537, 0.03442895, 0, 0, 0, 1, 1,
0.6438305, -0.2587717, 2.442342, 1, 1, 1, 1, 1,
0.653801, -1.569952, 2.698999, 1, 1, 1, 1, 1,
0.6555247, -0.1647245, 2.296632, 1, 1, 1, 1, 1,
0.6555648, -0.07934858, 3.10206, 1, 1, 1, 1, 1,
0.659665, -0.3564074, 1.885959, 1, 1, 1, 1, 1,
0.662605, -2.339006, 2.441466, 1, 1, 1, 1, 1,
0.6634222, -0.1710736, 2.069725, 1, 1, 1, 1, 1,
0.6639599, -2.628823, 1.211572, 1, 1, 1, 1, 1,
0.6652909, -0.1285977, 1.077765, 1, 1, 1, 1, 1,
0.6691389, 0.3918119, 0.265046, 1, 1, 1, 1, 1,
0.6708721, -0.7266523, 1.792499, 1, 1, 1, 1, 1,
0.6708795, -0.2327781, 1.607662, 1, 1, 1, 1, 1,
0.671122, 0.9988365, -0.4147465, 1, 1, 1, 1, 1,
0.6741273, 1.661885, -0.4520053, 1, 1, 1, 1, 1,
0.6768361, -0.2018974, 1.867943, 1, 1, 1, 1, 1,
0.6774486, -0.1080745, 1.550696, 0, 0, 1, 1, 1,
0.6828073, -2.036191, 1.681633, 1, 0, 0, 1, 1,
0.6834779, -0.3524712, 2.576154, 1, 0, 0, 1, 1,
0.687242, 0.8118592, 1.682586, 1, 0, 0, 1, 1,
0.691097, -0.9671868, 3.970071, 1, 0, 0, 1, 1,
0.6936222, 0.09630439, 1.954172, 1, 0, 0, 1, 1,
0.6958573, -2.980819, 2.487152, 0, 0, 0, 1, 1,
0.6963148, -1.304587, 2.969474, 0, 0, 0, 1, 1,
0.6988006, 0.05140184, 2.558883, 0, 0, 0, 1, 1,
0.7010046, 0.544583, 0.0104396, 0, 0, 0, 1, 1,
0.7059672, 0.903551, 0.6223696, 0, 0, 0, 1, 1,
0.7061158, -0.308213, 1.699074, 0, 0, 0, 1, 1,
0.7112392, 0.717412, 1.33386, 0, 0, 0, 1, 1,
0.7151179, 0.6997314, 0.4685594, 1, 1, 1, 1, 1,
0.7154963, 0.4767864, 1.986941, 1, 1, 1, 1, 1,
0.7164813, 0.6034341, 2.62176, 1, 1, 1, 1, 1,
0.7208501, -0.8391163, 2.903043, 1, 1, 1, 1, 1,
0.7229462, 0.7322218, -0.04535953, 1, 1, 1, 1, 1,
0.7233708, 0.9091546, 0.8346434, 1, 1, 1, 1, 1,
0.7265409, 0.2728636, -0.9028459, 1, 1, 1, 1, 1,
0.7369224, 0.8357365, 0.3190785, 1, 1, 1, 1, 1,
0.7411104, 0.5138395, 1.384156, 1, 1, 1, 1, 1,
0.7473589, 0.5989141, 0.7560481, 1, 1, 1, 1, 1,
0.7477273, -0.3361169, 2.266521, 1, 1, 1, 1, 1,
0.7495221, 1.192937, 1.234403, 1, 1, 1, 1, 1,
0.7520263, -0.6284091, 2.016837, 1, 1, 1, 1, 1,
0.7525479, 1.248233, 1.477316, 1, 1, 1, 1, 1,
0.7556199, -1.782458, 1.117428, 1, 1, 1, 1, 1,
0.7566087, -0.5053927, 1.836816, 0, 0, 1, 1, 1,
0.7644461, -0.1670631, 0.1843503, 1, 0, 0, 1, 1,
0.7649726, -2.590553, 3.673731, 1, 0, 0, 1, 1,
0.7654945, 0.2537654, 2.07755, 1, 0, 0, 1, 1,
0.7690077, -1.23715, 1.64211, 1, 0, 0, 1, 1,
0.7695355, 1.014848, 0.9757263, 1, 0, 0, 1, 1,
0.7710316, 0.3491807, 2.585009, 0, 0, 0, 1, 1,
0.771959, -0.1034552, 2.58584, 0, 0, 0, 1, 1,
0.7784328, -0.9875931, 3.584232, 0, 0, 0, 1, 1,
0.7803555, -0.3898593, 2.95516, 0, 0, 0, 1, 1,
0.7821217, -0.3168484, 2.16611, 0, 0, 0, 1, 1,
0.7833946, 0.1750169, 0.02847618, 0, 0, 0, 1, 1,
0.7883371, 0.4717023, 0.5822499, 0, 0, 0, 1, 1,
0.7891419, 0.843204, 1.199251, 1, 1, 1, 1, 1,
0.7926154, -1.020758, 2.615687, 1, 1, 1, 1, 1,
0.796117, 0.3646085, 0.4942756, 1, 1, 1, 1, 1,
0.8071648, 0.8692275, -0.4009306, 1, 1, 1, 1, 1,
0.8155273, 1.179042, 0.8938816, 1, 1, 1, 1, 1,
0.8168454, 1.240685, 0.07619081, 1, 1, 1, 1, 1,
0.8171157, 0.4560987, 1.339645, 1, 1, 1, 1, 1,
0.8172993, -1.312103, 1.923612, 1, 1, 1, 1, 1,
0.817693, -1.259523, 1.044353, 1, 1, 1, 1, 1,
0.8194486, 1.120233, -0.1739711, 1, 1, 1, 1, 1,
0.8211327, -0.5056489, 2.219251, 1, 1, 1, 1, 1,
0.8253712, -0.4744599, 0.9125036, 1, 1, 1, 1, 1,
0.8332998, -2.240324, 3.297527, 1, 1, 1, 1, 1,
0.8371013, 0.6793446, -0.514673, 1, 1, 1, 1, 1,
0.8428405, -0.4165655, 1.877012, 1, 1, 1, 1, 1,
0.8432401, 0.6550866, 2.423703, 0, 0, 1, 1, 1,
0.8443565, -0.908886, 3.193419, 1, 0, 0, 1, 1,
0.8477169, -0.5085935, 0.4046385, 1, 0, 0, 1, 1,
0.8539706, 0.4946735, 0.4554703, 1, 0, 0, 1, 1,
0.8579615, -0.2515687, 0.1243307, 1, 0, 0, 1, 1,
0.8652523, -1.100726, 2.509634, 1, 0, 0, 1, 1,
0.8702177, -0.552182, 1.424921, 0, 0, 0, 1, 1,
0.8728741, -0.4563377, 1.943537, 0, 0, 0, 1, 1,
0.879774, -0.2956901, 1.085927, 0, 0, 0, 1, 1,
0.8819913, 1.336612, 1.002696, 0, 0, 0, 1, 1,
0.8873384, 0.3587291, 0.379629, 0, 0, 0, 1, 1,
0.8891104, -0.4603962, 0.7069654, 0, 0, 0, 1, 1,
0.8901569, -0.03967581, 0.01188829, 0, 0, 0, 1, 1,
0.8919215, 0.03565152, 0.8833538, 1, 1, 1, 1, 1,
0.893605, -0.9830982, 1.999669, 1, 1, 1, 1, 1,
0.8961223, -0.6450736, -0.3465778, 1, 1, 1, 1, 1,
0.8981993, -0.7473131, 3.101289, 1, 1, 1, 1, 1,
0.8993132, 0.585205, 1.417572, 1, 1, 1, 1, 1,
0.903011, -0.4458112, 0.9120811, 1, 1, 1, 1, 1,
0.9089505, -2.003803, 2.685927, 1, 1, 1, 1, 1,
0.9113296, 0.0147124, 1.625196, 1, 1, 1, 1, 1,
0.9193772, -0.3415552, 3.687629, 1, 1, 1, 1, 1,
0.9277718, -0.03302363, -0.1461195, 1, 1, 1, 1, 1,
0.9292491, -0.7871143, 1.284876, 1, 1, 1, 1, 1,
0.9318967, -0.6749662, 1.403918, 1, 1, 1, 1, 1,
0.9371448, 0.7025417, 1.508787, 1, 1, 1, 1, 1,
0.9406987, 0.3389907, 3.154907, 1, 1, 1, 1, 1,
0.9463331, -0.1497044, 1.702264, 1, 1, 1, 1, 1,
0.947288, -0.3982158, 1.299541, 0, 0, 1, 1, 1,
0.9478007, -0.2090505, 1.825636, 1, 0, 0, 1, 1,
0.9480921, -0.2113654, 1.84352, 1, 0, 0, 1, 1,
0.9509644, 1.568811, 0.493138, 1, 0, 0, 1, 1,
0.9639021, -0.9299251, 2.59651, 1, 0, 0, 1, 1,
0.9649531, 0.03204286, 2.421831, 1, 0, 0, 1, 1,
0.9700235, -0.0539299, 0.09794776, 0, 0, 0, 1, 1,
0.9751437, 0.5531849, 1.120079, 0, 0, 0, 1, 1,
0.9755797, 0.2281067, 2.375904, 0, 0, 0, 1, 1,
0.9770131, 0.3442907, 0.5271932, 0, 0, 0, 1, 1,
0.983061, -0.4213268, 1.892168, 0, 0, 0, 1, 1,
0.9856595, -1.947431, 3.587961, 0, 0, 0, 1, 1,
0.9870917, -0.4714514, 2.873095, 0, 0, 0, 1, 1,
0.992963, 0.3477689, 0.2902814, 1, 1, 1, 1, 1,
0.9960478, 0.1654727, 3.968914, 1, 1, 1, 1, 1,
0.9979032, -0.4648381, 1.934891, 1, 1, 1, 1, 1,
0.9993057, -2.092029, 4.097602, 1, 1, 1, 1, 1,
1.001529, -1.001669, 2.035698, 1, 1, 1, 1, 1,
1.005201, -2.115401, 3.872993, 1, 1, 1, 1, 1,
1.008729, -0.374297, 0.9266458, 1, 1, 1, 1, 1,
1.013954, -0.1966109, 1.072113, 1, 1, 1, 1, 1,
1.01397, 0.7419791, 1.269861, 1, 1, 1, 1, 1,
1.021704, -1.42934, 3.360497, 1, 1, 1, 1, 1,
1.028494, 1.014714, 0.7905014, 1, 1, 1, 1, 1,
1.031271, 0.5228924, 1.758367, 1, 1, 1, 1, 1,
1.033892, -0.9360378, 1.232223, 1, 1, 1, 1, 1,
1.035105, 0.1030045, 1.065326, 1, 1, 1, 1, 1,
1.035491, -0.5300561, 2.813536, 1, 1, 1, 1, 1,
1.039546, -0.225234, 1.298308, 0, 0, 1, 1, 1,
1.041346, -1.029462, 1.684856, 1, 0, 0, 1, 1,
1.049764, 0.6249939, 0.5583004, 1, 0, 0, 1, 1,
1.050904, 1.074843, 0.08858594, 1, 0, 0, 1, 1,
1.052055, -0.8490248, 2.683247, 1, 0, 0, 1, 1,
1.05331, 1.39153, -0.132892, 1, 0, 0, 1, 1,
1.054303, -2.440597, 2.114894, 0, 0, 0, 1, 1,
1.062327, -0.3409226, 3.463481, 0, 0, 0, 1, 1,
1.065018, 1.059672, 1.221538, 0, 0, 0, 1, 1,
1.066598, 1.260427, -0.9620772, 0, 0, 0, 1, 1,
1.071002, -0.1015462, 0.6696857, 0, 0, 0, 1, 1,
1.075069, 1.492059, -0.5025011, 0, 0, 0, 1, 1,
1.075087, -1.204573, 2.583211, 0, 0, 0, 1, 1,
1.079434, 0.09474814, 3.044875, 1, 1, 1, 1, 1,
1.091396, -0.06622176, 3.464197, 1, 1, 1, 1, 1,
1.092817, -0.8752389, 3.410313, 1, 1, 1, 1, 1,
1.107697, 0.6672595, -0.2425277, 1, 1, 1, 1, 1,
1.112862, 0.4123796, 2.1821, 1, 1, 1, 1, 1,
1.115612, 0.7922078, 1.533991, 1, 1, 1, 1, 1,
1.116029, 0.1168447, 1.247785, 1, 1, 1, 1, 1,
1.121775, -0.8573152, 3.054093, 1, 1, 1, 1, 1,
1.124397, -1.140562, 2.176229, 1, 1, 1, 1, 1,
1.129516, -0.8557211, 3.013698, 1, 1, 1, 1, 1,
1.142332, 0.6157295, 0.903411, 1, 1, 1, 1, 1,
1.143133, -0.1836966, 0.8183439, 1, 1, 1, 1, 1,
1.144523, -1.745886, 2.225642, 1, 1, 1, 1, 1,
1.148815, 0.2171211, 3.806841, 1, 1, 1, 1, 1,
1.14955, -2.31657, 4.225521, 1, 1, 1, 1, 1,
1.162532, 0.0104311, 0.5605245, 0, 0, 1, 1, 1,
1.170462, 0.8203407, -0.441304, 1, 0, 0, 1, 1,
1.177987, 0.2486677, 0.02414749, 1, 0, 0, 1, 1,
1.17974, 0.8885071, -0.2267417, 1, 0, 0, 1, 1,
1.181396, 0.6013802, 3.912506, 1, 0, 0, 1, 1,
1.187319, -0.2192243, -0.9385315, 1, 0, 0, 1, 1,
1.198856, -2.659871, 2.999846, 0, 0, 0, 1, 1,
1.209222, -0.334433, 2.827457, 0, 0, 0, 1, 1,
1.21412, 0.6153203, -0.7863085, 0, 0, 0, 1, 1,
1.215992, -0.9863957, 2.711869, 0, 0, 0, 1, 1,
1.222807, 0.01320997, 1.553447, 0, 0, 0, 1, 1,
1.223974, -0.4043109, 2.639009, 0, 0, 0, 1, 1,
1.229487, -0.3282213, 1.450731, 0, 0, 0, 1, 1,
1.251305, 0.4299118, 1.737097, 1, 1, 1, 1, 1,
1.269995, -1.136111, 2.123371, 1, 1, 1, 1, 1,
1.270047, -0.02252953, 1.095826, 1, 1, 1, 1, 1,
1.275297, -1.223525, 3.445635, 1, 1, 1, 1, 1,
1.278302, -0.05098898, 2.646475, 1, 1, 1, 1, 1,
1.280654, 1.10458, 0.8767596, 1, 1, 1, 1, 1,
1.284157, -1.432901, 3.608656, 1, 1, 1, 1, 1,
1.28604, 2.285508, 1.502136, 1, 1, 1, 1, 1,
1.289542, 1.12619, -1.01972, 1, 1, 1, 1, 1,
1.296124, -1.042794, 4.258692, 1, 1, 1, 1, 1,
1.298428, -1.108157, 1.544916, 1, 1, 1, 1, 1,
1.301347, -1.166578, 0.9498541, 1, 1, 1, 1, 1,
1.351207, -0.642347, 2.576608, 1, 1, 1, 1, 1,
1.353623, -0.5600261, 3.355558, 1, 1, 1, 1, 1,
1.359337, -0.9039705, 1.233801, 1, 1, 1, 1, 1,
1.381683, 0.37519, 1.471465, 0, 0, 1, 1, 1,
1.387929, 1.189237, 0.09565187, 1, 0, 0, 1, 1,
1.394522, 0.8252027, 1.280433, 1, 0, 0, 1, 1,
1.398685, 0.411587, 1.281077, 1, 0, 0, 1, 1,
1.399932, -0.867002, 1.72872, 1, 0, 0, 1, 1,
1.405951, -1.078476, 0.7084544, 1, 0, 0, 1, 1,
1.416811, 2.511582, -0.3803237, 0, 0, 0, 1, 1,
1.418504, -0.01190096, 0.2888411, 0, 0, 0, 1, 1,
1.422777, -0.9153745, 3.478416, 0, 0, 0, 1, 1,
1.427646, -1.031878, 1.320687, 0, 0, 0, 1, 1,
1.429604, -1.429138, 1.39425, 0, 0, 0, 1, 1,
1.430676, 1.901823, 0.6307626, 0, 0, 0, 1, 1,
1.441355, 1.316294, 1.884656, 0, 0, 0, 1, 1,
1.444519, 0.8193539, 2.316887, 1, 1, 1, 1, 1,
1.445374, 0.3120241, 2.632398, 1, 1, 1, 1, 1,
1.446767, 1.657082, 2.561241, 1, 1, 1, 1, 1,
1.457111, -1.399309, 0.8131216, 1, 1, 1, 1, 1,
1.461589, -1.242567, 3.184803, 1, 1, 1, 1, 1,
1.464029, -0.1484618, 1.89127, 1, 1, 1, 1, 1,
1.470893, -1.541168, 2.872823, 1, 1, 1, 1, 1,
1.47102, 1.133923, -1.070392, 1, 1, 1, 1, 1,
1.478147, 0.5271869, 0.2713678, 1, 1, 1, 1, 1,
1.484227, -1.201645, 1.506448, 1, 1, 1, 1, 1,
1.485412, 0.2188984, 0.646805, 1, 1, 1, 1, 1,
1.49372, -0.8276614, 2.601593, 1, 1, 1, 1, 1,
1.50209, 1.176971, 1.127166, 1, 1, 1, 1, 1,
1.505531, 0.845173, -0.01445873, 1, 1, 1, 1, 1,
1.508891, -0.6882532, 2.027024, 1, 1, 1, 1, 1,
1.519715, 1.285551, 1.141627, 0, 0, 1, 1, 1,
1.523744, -1.055058, 3.042329, 1, 0, 0, 1, 1,
1.549671, 1.242726, 0.7128186, 1, 0, 0, 1, 1,
1.551637, -1.139923, 2.341829, 1, 0, 0, 1, 1,
1.555275, -0.8539056, 1.946201, 1, 0, 0, 1, 1,
1.567143, -1.586416, 0.5599799, 1, 0, 0, 1, 1,
1.568766, 1.100565, 0.7273907, 0, 0, 0, 1, 1,
1.573611, -1.419651, 0.4692984, 0, 0, 0, 1, 1,
1.576891, 1.274769, 3.214415, 0, 0, 0, 1, 1,
1.579507, 0.6812783, 0.433528, 0, 0, 0, 1, 1,
1.583934, 0.2133776, 2.558828, 0, 0, 0, 1, 1,
1.597679, -1.809833, 2.083891, 0, 0, 0, 1, 1,
1.605479, 1.810461, 1.252754, 0, 0, 0, 1, 1,
1.605822, -1.730906, 2.807282, 1, 1, 1, 1, 1,
1.607567, -0.4151048, 1.618718, 1, 1, 1, 1, 1,
1.61007, 2.672847, 1.446453, 1, 1, 1, 1, 1,
1.630822, 0.1052131, 1.657849, 1, 1, 1, 1, 1,
1.640062, 0.6508068, 1.74552, 1, 1, 1, 1, 1,
1.642642, 1.163079, 2.420298, 1, 1, 1, 1, 1,
1.65406, 1.818029, -0.1584128, 1, 1, 1, 1, 1,
1.665797, -1.011487, 2.517392, 1, 1, 1, 1, 1,
1.669313, 2.029628, 0.1065552, 1, 1, 1, 1, 1,
1.670064, 1.310815, 1.585876, 1, 1, 1, 1, 1,
1.679362, 0.3644567, 0.3934896, 1, 1, 1, 1, 1,
1.707594, 0.1793991, 1.994374, 1, 1, 1, 1, 1,
1.726309, 1.660758, 1.154066, 1, 1, 1, 1, 1,
1.73517, 1.384436, 1.810865, 1, 1, 1, 1, 1,
1.740901, 0.3413114, 0.1966709, 1, 1, 1, 1, 1,
1.747994, -0.03279686, 1.480278, 0, 0, 1, 1, 1,
1.748213, -0.1088574, 1.891361, 1, 0, 0, 1, 1,
1.760815, -2.285906, 2.086087, 1, 0, 0, 1, 1,
1.776384, -0.40359, 1.200625, 1, 0, 0, 1, 1,
1.78256, 1.451906, 0.0253965, 1, 0, 0, 1, 1,
1.800735, 0.3251165, 0.04855079, 1, 0, 0, 1, 1,
1.801616, 0.7820434, 1.915093, 0, 0, 0, 1, 1,
1.810852, -0.7782883, 3.675502, 0, 0, 0, 1, 1,
1.819341, 0.1851727, 1.830805, 0, 0, 0, 1, 1,
1.819667, 0.3162783, 1.379141, 0, 0, 0, 1, 1,
1.829024, 0.3933287, 1.992735, 0, 0, 0, 1, 1,
1.83949, 0.8485035, 3.008037, 0, 0, 0, 1, 1,
1.846571, 0.1554091, 2.325343, 0, 0, 0, 1, 1,
1.876117, 0.8699332, 2.375439, 1, 1, 1, 1, 1,
1.881158, -1.071164, 2.220863, 1, 1, 1, 1, 1,
1.89884, -0.8688194, 3.346308, 1, 1, 1, 1, 1,
1.911532, -0.1488111, 2.402361, 1, 1, 1, 1, 1,
1.912206, -1.318471, 3.618601, 1, 1, 1, 1, 1,
1.91235, 1.029509, 0.1390947, 1, 1, 1, 1, 1,
1.915345, -0.7074941, 1.68019, 1, 1, 1, 1, 1,
1.934759, 0.04990717, 3.180571, 1, 1, 1, 1, 1,
1.951826, -1.467342, 1.934294, 1, 1, 1, 1, 1,
1.953199, 0.4532734, -0.1116256, 1, 1, 1, 1, 1,
1.995535, 0.7785201, 0.7405378, 1, 1, 1, 1, 1,
1.998316, -0.9242413, 3.769235, 1, 1, 1, 1, 1,
2.031464, -0.7029188, 1.900102, 1, 1, 1, 1, 1,
2.050607, 0.1500656, 2.008604, 1, 1, 1, 1, 1,
2.104841, -0.4438448, 1.44874, 1, 1, 1, 1, 1,
2.115044, -2.573342, 1.584334, 0, 0, 1, 1, 1,
2.115673, 0.0885215, 0.5139468, 1, 0, 0, 1, 1,
2.155216, -1.375049, 2.103833, 1, 0, 0, 1, 1,
2.188878, 1.243798, 1.327374, 1, 0, 0, 1, 1,
2.20744, -1.151177, 3.20922, 1, 0, 0, 1, 1,
2.241138, -0.9851794, 3.522977, 1, 0, 0, 1, 1,
2.245941, 0.4492045, 0.8966365, 0, 0, 0, 1, 1,
2.286777, 1.235551, 1.074385, 0, 0, 0, 1, 1,
2.341554, 1.62852, 0.8972361, 0, 0, 0, 1, 1,
2.355033, -0.7958964, 1.79214, 0, 0, 0, 1, 1,
2.36818, 1.929311, 0.8499255, 0, 0, 0, 1, 1,
2.380034, 1.612803, 2.312822, 0, 0, 0, 1, 1,
2.487548, 0.02339413, 2.437886, 0, 0, 0, 1, 1,
2.526844, -0.4655047, 0.6834967, 1, 1, 1, 1, 1,
2.568094, 0.4262589, 2.323946, 1, 1, 1, 1, 1,
2.599087, 1.522749, -0.4726942, 1, 1, 1, 1, 1,
2.605755, -0.6484361, 0.8537564, 1, 1, 1, 1, 1,
2.630679, 1.307402, -0.7808796, 1, 1, 1, 1, 1,
2.641763, -1.216247, 3.039497, 1, 1, 1, 1, 1,
3.264362, 0.1497022, -0.9182459, 1, 1, 1, 1, 1
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
var radius = 9.387374;
var distance = 32.97276;
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
mvMatrix.translate( -0.03558588, 0.04312682, 0.05009818 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.97276);
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
