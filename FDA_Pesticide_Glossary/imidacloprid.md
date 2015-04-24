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
-3.305429, 0.2401177, -2.427389, 1, 0, 0, 1,
-3.208567, 0.9852685, -0.3504574, 1, 0.007843138, 0, 1,
-3.10546, -0.800841, -2.525126, 1, 0.01176471, 0, 1,
-2.733583, 0.5620211, -3.749248, 1, 0.01960784, 0, 1,
-2.703166, 0.2346813, -1.07711, 1, 0.02352941, 0, 1,
-2.57377, -0.3098307, -0.6904256, 1, 0.03137255, 0, 1,
-2.515947, 2.030615, -0.84179, 1, 0.03529412, 0, 1,
-2.45928, -1.795566, -1.029139, 1, 0.04313726, 0, 1,
-2.405372, -0.3497234, -3.268145, 1, 0.04705882, 0, 1,
-2.377999, 0.155913, -4.399638, 1, 0.05490196, 0, 1,
-2.344015, -0.4333354, -2.955929, 1, 0.05882353, 0, 1,
-2.333889, 0.9198885, -0.7128834, 1, 0.06666667, 0, 1,
-2.301698, -1.135374, -1.000669, 1, 0.07058824, 0, 1,
-2.253249, -0.5473956, -0.1283496, 1, 0.07843138, 0, 1,
-2.238492, -0.4496176, -2.583595, 1, 0.08235294, 0, 1,
-2.139225, -1.291281, -2.063524, 1, 0.09019608, 0, 1,
-2.131198, 1.114889, 1.479563, 1, 0.09411765, 0, 1,
-2.109861, -0.2669044, -1.984396, 1, 0.1019608, 0, 1,
-2.056924, 1.80157, -0.8666081, 1, 0.1098039, 0, 1,
-1.997386, -0.8423676, -3.872997, 1, 0.1137255, 0, 1,
-1.994531, -0.6892241, -3.007808, 1, 0.1215686, 0, 1,
-1.983908, 0.9366703, -0.8361321, 1, 0.1254902, 0, 1,
-1.979284, 0.6047327, -0.4523609, 1, 0.1333333, 0, 1,
-1.973019, -1.752945, -1.213485, 1, 0.1372549, 0, 1,
-1.907671, 1.144716, -1.135336, 1, 0.145098, 0, 1,
-1.890777, 0.5088095, 0.130941, 1, 0.1490196, 0, 1,
-1.885247, 2.6842, -1.104099, 1, 0.1568628, 0, 1,
-1.867798, -0.7714068, 0.07439603, 1, 0.1607843, 0, 1,
-1.866269, -0.06436646, 0.02824934, 1, 0.1686275, 0, 1,
-1.833346, -0.8417523, -1.631613, 1, 0.172549, 0, 1,
-1.825933, -1.060417, -3.968821, 1, 0.1803922, 0, 1,
-1.82198, 0.2249073, -2.28285, 1, 0.1843137, 0, 1,
-1.813222, 0.4164072, 0.8555441, 1, 0.1921569, 0, 1,
-1.767466, -0.4984925, -0.5454007, 1, 0.1960784, 0, 1,
-1.750869, -0.9141477, -1.891164, 1, 0.2039216, 0, 1,
-1.705009, -0.7777352, 0.1575503, 1, 0.2117647, 0, 1,
-1.693116, -0.1978121, -2.305925, 1, 0.2156863, 0, 1,
-1.680215, -2.694527, -2.814109, 1, 0.2235294, 0, 1,
-1.668024, -1.965325, -2.327764, 1, 0.227451, 0, 1,
-1.667956, -0.380842, -3.302789, 1, 0.2352941, 0, 1,
-1.667167, 0.6025482, -0.6712544, 1, 0.2392157, 0, 1,
-1.641714, -1.949149, 0.1965375, 1, 0.2470588, 0, 1,
-1.632755, -0.538868, -2.254459, 1, 0.2509804, 0, 1,
-1.630954, -1.085163, -1.405999, 1, 0.2588235, 0, 1,
-1.629455, -1.462973, -3.005148, 1, 0.2627451, 0, 1,
-1.628615, 0.2503007, -1.56486, 1, 0.2705882, 0, 1,
-1.608537, -1.525642, -3.159516, 1, 0.2745098, 0, 1,
-1.599458, -0.4438593, -3.094045, 1, 0.282353, 0, 1,
-1.590244, 1.381072, -2.274472, 1, 0.2862745, 0, 1,
-1.576688, -1.578803, -2.155628, 1, 0.2941177, 0, 1,
-1.572691, 0.9743376, -2.793564, 1, 0.3019608, 0, 1,
-1.565153, 0.1218275, -1.431075, 1, 0.3058824, 0, 1,
-1.564629, -0.759085, -0.3554019, 1, 0.3137255, 0, 1,
-1.563092, 0.7357629, -1.482212, 1, 0.3176471, 0, 1,
-1.561262, 1.132007, -0.7879267, 1, 0.3254902, 0, 1,
-1.559083, -0.6314072, -2.327497, 1, 0.3294118, 0, 1,
-1.552158, -0.06605721, -1.286142, 1, 0.3372549, 0, 1,
-1.550967, -1.049156, -0.7353644, 1, 0.3411765, 0, 1,
-1.544249, 1.274405, -1.247571, 1, 0.3490196, 0, 1,
-1.543576, 2.236288, 1.208978, 1, 0.3529412, 0, 1,
-1.537694, -0.04551561, -1.79127, 1, 0.3607843, 0, 1,
-1.531588, -1.167996, -1.66158, 1, 0.3647059, 0, 1,
-1.52275, 0.08367706, -2.496196, 1, 0.372549, 0, 1,
-1.519078, 0.6902102, -2.901401, 1, 0.3764706, 0, 1,
-1.518911, -0.02818058, -2.668981, 1, 0.3843137, 0, 1,
-1.512887, 1.128782, 0.2248301, 1, 0.3882353, 0, 1,
-1.511835, -0.403277, -1.581142, 1, 0.3960784, 0, 1,
-1.495598, 0.9511524, -2.832637, 1, 0.4039216, 0, 1,
-1.492007, -0.2525481, -0.7888738, 1, 0.4078431, 0, 1,
-1.491619, 1.387092, -0.02575126, 1, 0.4156863, 0, 1,
-1.484003, 0.22937, -1.400887, 1, 0.4196078, 0, 1,
-1.480731, 1.54008, -0.6044897, 1, 0.427451, 0, 1,
-1.47861, 0.4021946, -2.444785, 1, 0.4313726, 0, 1,
-1.463678, 1.472982, 1.964369, 1, 0.4392157, 0, 1,
-1.458694, 2.904278, -0.6680359, 1, 0.4431373, 0, 1,
-1.458213, 1.721418, -0.5493062, 1, 0.4509804, 0, 1,
-1.452246, 0.3867111, -0.5034075, 1, 0.454902, 0, 1,
-1.445918, -0.402932, -2.805697, 1, 0.4627451, 0, 1,
-1.436027, 0.468762, -1.238159, 1, 0.4666667, 0, 1,
-1.419284, -0.5065433, -2.425997, 1, 0.4745098, 0, 1,
-1.406832, 0.5407207, -2.430734, 1, 0.4784314, 0, 1,
-1.399305, -0.6868505, -0.9585667, 1, 0.4862745, 0, 1,
-1.389488, -2.218853, -2.271564, 1, 0.4901961, 0, 1,
-1.383701, -1.125211, -2.09439, 1, 0.4980392, 0, 1,
-1.382419, 0.2841432, -1.860834, 1, 0.5058824, 0, 1,
-1.34943, 1.857893, -0.9942105, 1, 0.509804, 0, 1,
-1.34756, 0.8119009, 0.9085535, 1, 0.5176471, 0, 1,
-1.343741, -0.1440851, -0.5511192, 1, 0.5215687, 0, 1,
-1.343573, -0.6502901, -1.762921, 1, 0.5294118, 0, 1,
-1.334889, -0.2006567, -2.756468, 1, 0.5333334, 0, 1,
-1.334558, -0.2514707, -0.05779581, 1, 0.5411765, 0, 1,
-1.331815, -0.2440684, -1.512665, 1, 0.5450981, 0, 1,
-1.310102, -2.13676, -2.66487, 1, 0.5529412, 0, 1,
-1.306248, -1.775774, -2.624767, 1, 0.5568628, 0, 1,
-1.305326, 0.8388141, -1.491024, 1, 0.5647059, 0, 1,
-1.29305, 2.181822, 0.05524128, 1, 0.5686275, 0, 1,
-1.289992, -0.6525897, -1.642418, 1, 0.5764706, 0, 1,
-1.284476, -0.3311785, -2.861584, 1, 0.5803922, 0, 1,
-1.283249, 1.22809, -2.588305, 1, 0.5882353, 0, 1,
-1.283237, -1.552045, -3.228813, 1, 0.5921569, 0, 1,
-1.279388, 0.3556449, -1.965809, 1, 0.6, 0, 1,
-1.278314, -1.687039, -3.323716, 1, 0.6078432, 0, 1,
-1.275612, -0.01232892, -1.514144, 1, 0.6117647, 0, 1,
-1.273673, 0.0002397329, -1.861491, 1, 0.6196079, 0, 1,
-1.260924, -1.426824, -2.630288, 1, 0.6235294, 0, 1,
-1.260202, -0.3981307, -3.067839, 1, 0.6313726, 0, 1,
-1.252903, 1.053525, -0.6778342, 1, 0.6352941, 0, 1,
-1.246518, 1.364728, -1.014363, 1, 0.6431373, 0, 1,
-1.233689, -0.3022277, -1.780553, 1, 0.6470588, 0, 1,
-1.224945, 0.2439336, -0.8112916, 1, 0.654902, 0, 1,
-1.223889, 1.118505, -0.7894915, 1, 0.6588235, 0, 1,
-1.222975, 0.1226643, 0.120047, 1, 0.6666667, 0, 1,
-1.203051, 1.761836, 0.7135025, 1, 0.6705883, 0, 1,
-1.192828, 0.5079846, -0.8084793, 1, 0.6784314, 0, 1,
-1.192218, -1.549157, -1.713336, 1, 0.682353, 0, 1,
-1.189709, -1.914761, -2.203941, 1, 0.6901961, 0, 1,
-1.187226, -2.338295, -0.1005864, 1, 0.6941177, 0, 1,
-1.174979, -1.364071, -2.356234, 1, 0.7019608, 0, 1,
-1.174748, -0.800273, -1.846906, 1, 0.7098039, 0, 1,
-1.172897, -1.645695, -3.196358, 1, 0.7137255, 0, 1,
-1.172796, 0.9276188, -0.1076002, 1, 0.7215686, 0, 1,
-1.169493, -0.5705967, 0.1610488, 1, 0.7254902, 0, 1,
-1.165635, 1.533295, -1.602088, 1, 0.7333333, 0, 1,
-1.164501, -1.121723, -3.4029, 1, 0.7372549, 0, 1,
-1.161388, 2.119352, -1.941817, 1, 0.7450981, 0, 1,
-1.157871, 0.8956303, -1.715127, 1, 0.7490196, 0, 1,
-1.155505, 0.1960014, -2.418092, 1, 0.7568628, 0, 1,
-1.153517, -0.7768089, -1.536485, 1, 0.7607843, 0, 1,
-1.151365, 1.621232, -1.2004, 1, 0.7686275, 0, 1,
-1.144693, -0.5713696, -1.328504, 1, 0.772549, 0, 1,
-1.142873, 1.089073, -1.820447, 1, 0.7803922, 0, 1,
-1.137889, -0.5625347, -1.500007, 1, 0.7843137, 0, 1,
-1.136693, 1.151708, 0.3887032, 1, 0.7921569, 0, 1,
-1.132937, 0.1608514, -1.216165, 1, 0.7960784, 0, 1,
-1.128605, 0.008174118, -1.222475, 1, 0.8039216, 0, 1,
-1.127512, -1.72083, -2.828229, 1, 0.8117647, 0, 1,
-1.127256, 0.3298053, -2.691716, 1, 0.8156863, 0, 1,
-1.124447, -0.6798823, -1.642258, 1, 0.8235294, 0, 1,
-1.115921, 0.6489666, 1.080233, 1, 0.827451, 0, 1,
-1.088437, 0.06603009, -1.613052, 1, 0.8352941, 0, 1,
-1.085338, 0.2829281, -0.4937916, 1, 0.8392157, 0, 1,
-1.075228, 0.2654062, -2.204595, 1, 0.8470588, 0, 1,
-1.074732, 0.6701711, 1.188802, 1, 0.8509804, 0, 1,
-1.071989, 1.443943, -0.6821879, 1, 0.8588235, 0, 1,
-1.070162, -0.4285632, -0.07682052, 1, 0.8627451, 0, 1,
-1.067589, -1.600465, -4.298426, 1, 0.8705882, 0, 1,
-1.067174, -1.925684, -2.878637, 1, 0.8745098, 0, 1,
-1.066144, -0.7723604, -2.961921, 1, 0.8823529, 0, 1,
-1.046839, -0.07295556, -1.862712, 1, 0.8862745, 0, 1,
-1.037956, -0.986801, -3.548936, 1, 0.8941177, 0, 1,
-1.035253, 0.5240881, -0.5773693, 1, 0.8980392, 0, 1,
-1.030783, 0.415527, 1.240742, 1, 0.9058824, 0, 1,
-1.028578, 0.4260918, -2.375032, 1, 0.9137255, 0, 1,
-1.028108, -0.7822325, -2.556863, 1, 0.9176471, 0, 1,
-1.027391, -1.187282, -1.35032, 1, 0.9254902, 0, 1,
-1.025489, 0.2021109, -0.5536854, 1, 0.9294118, 0, 1,
-1.021291, -1.055492, -0.7895648, 1, 0.9372549, 0, 1,
-1.014965, -2.144226, -4.070633, 1, 0.9411765, 0, 1,
-1.012649, -1.328361, -2.044634, 1, 0.9490196, 0, 1,
-1.012165, -0.6215394, -1.15248, 1, 0.9529412, 0, 1,
-1.007222, 0.8833894, -1.330465, 1, 0.9607843, 0, 1,
-1.006916, -2.251488, -2.729242, 1, 0.9647059, 0, 1,
-1.004224, -0.8729273, -0.2427521, 1, 0.972549, 0, 1,
-0.9994298, 0.2431466, -0.08454162, 1, 0.9764706, 0, 1,
-0.9837182, -0.3611414, -2.31675, 1, 0.9843137, 0, 1,
-0.981014, 0.6330568, -1.486924, 1, 0.9882353, 0, 1,
-0.9793161, 1.925913, -0.7052302, 1, 0.9960784, 0, 1,
-0.9782121, -0.1304146, -1.036496, 0.9960784, 1, 0, 1,
-0.9769777, 1.181311, -0.307667, 0.9921569, 1, 0, 1,
-0.9763761, 1.389937, -1.547419, 0.9843137, 1, 0, 1,
-0.9702369, 0.5356057, -0.6506428, 0.9803922, 1, 0, 1,
-0.9670672, -0.5592826, -2.033901, 0.972549, 1, 0, 1,
-0.9623634, 0.3891278, -2.238367, 0.9686275, 1, 0, 1,
-0.9592267, -1.457995, -3.377311, 0.9607843, 1, 0, 1,
-0.9528736, -1.843554, -3.578008, 0.9568627, 1, 0, 1,
-0.9400735, 0.1962411, -0.3752028, 0.9490196, 1, 0, 1,
-0.9360178, -0.956094, -1.636977, 0.945098, 1, 0, 1,
-0.9330581, 1.028898, -0.5833653, 0.9372549, 1, 0, 1,
-0.9272816, -1.273055, -2.412102, 0.9333333, 1, 0, 1,
-0.9263325, 0.2541254, -0.41723, 0.9254902, 1, 0, 1,
-0.9258805, -0.491201, -1.932348, 0.9215686, 1, 0, 1,
-0.9197337, 0.7515011, -0.6704941, 0.9137255, 1, 0, 1,
-0.9175016, -0.4367033, -1.518313, 0.9098039, 1, 0, 1,
-0.9172605, -0.7938088, -0.2998871, 0.9019608, 1, 0, 1,
-0.9099516, -0.907961, -1.864653, 0.8941177, 1, 0, 1,
-0.9038005, 0.6772447, -0.9448141, 0.8901961, 1, 0, 1,
-0.900681, 0.05043827, -2.291541, 0.8823529, 1, 0, 1,
-0.8977406, -1.572293, -2.396482, 0.8784314, 1, 0, 1,
-0.8857407, 0.6942776, -4.141741, 0.8705882, 1, 0, 1,
-0.8790983, 0.2401696, -1.400473, 0.8666667, 1, 0, 1,
-0.8763671, 1.514989, -0.5585352, 0.8588235, 1, 0, 1,
-0.8760182, 0.3757815, -1.693126, 0.854902, 1, 0, 1,
-0.874139, -0.6409416, -3.512971, 0.8470588, 1, 0, 1,
-0.8715267, 0.4955125, -2.340291, 0.8431373, 1, 0, 1,
-0.8697342, 0.9307143, -1.828263, 0.8352941, 1, 0, 1,
-0.8680282, -1.357579, -3.242139, 0.8313726, 1, 0, 1,
-0.8553017, 0.5169516, -1.349929, 0.8235294, 1, 0, 1,
-0.8536094, -0.1887146, -1.718542, 0.8196079, 1, 0, 1,
-0.8523954, -0.6986821, -0.5026484, 0.8117647, 1, 0, 1,
-0.848004, -0.1734035, -0.1222491, 0.8078431, 1, 0, 1,
-0.8436593, 0.8546212, 0.3749495, 0.8, 1, 0, 1,
-0.8417986, 1.455128, -1.059867, 0.7921569, 1, 0, 1,
-0.8412693, -0.7095194, -2.581622, 0.7882353, 1, 0, 1,
-0.8393081, 0.7197353, -1.656847, 0.7803922, 1, 0, 1,
-0.8376183, 1.245473, -0.02074246, 0.7764706, 1, 0, 1,
-0.8374697, -1.212958, -4.125205, 0.7686275, 1, 0, 1,
-0.8373479, -0.4965076, -2.161519, 0.7647059, 1, 0, 1,
-0.8345158, 0.7668382, -0.8783647, 0.7568628, 1, 0, 1,
-0.8302889, -1.599964, -0.7684225, 0.7529412, 1, 0, 1,
-0.8248443, 1.057486, -1.121337, 0.7450981, 1, 0, 1,
-0.8240171, 0.2313257, -1.090558, 0.7411765, 1, 0, 1,
-0.8229532, 2.738702, 1.770928, 0.7333333, 1, 0, 1,
-0.8229449, -1.694565, -2.355106, 0.7294118, 1, 0, 1,
-0.817726, 0.06086824, -1.102497, 0.7215686, 1, 0, 1,
-0.8175674, -0.3188598, -0.216285, 0.7176471, 1, 0, 1,
-0.8141385, -2.712149, -3.497845, 0.7098039, 1, 0, 1,
-0.8123275, 2.196003, -0.94015, 0.7058824, 1, 0, 1,
-0.8103427, 0.6576033, -3.52704, 0.6980392, 1, 0, 1,
-0.8066067, -0.5192129, -2.465115, 0.6901961, 1, 0, 1,
-0.8063877, 2.608074, -1.309035, 0.6862745, 1, 0, 1,
-0.8053646, 0.6110271, -0.3444541, 0.6784314, 1, 0, 1,
-0.804464, 0.8070589, -1.549729, 0.6745098, 1, 0, 1,
-0.8006628, 0.5713114, -2.330315, 0.6666667, 1, 0, 1,
-0.795456, -0.5979877, -3.693371, 0.6627451, 1, 0, 1,
-0.7939184, -1.353239, -2.570895, 0.654902, 1, 0, 1,
-0.7868025, 0.3126672, -1.131175, 0.6509804, 1, 0, 1,
-0.7830624, -0.5718299, -1.107116, 0.6431373, 1, 0, 1,
-0.7802924, 0.9490293, -0.2940252, 0.6392157, 1, 0, 1,
-0.7799276, -0.4904842, -1.416236, 0.6313726, 1, 0, 1,
-0.7724048, -0.01252025, -0.1922252, 0.627451, 1, 0, 1,
-0.770465, -0.8614249, -2.724959, 0.6196079, 1, 0, 1,
-0.7688972, 0.7460706, -1.932084, 0.6156863, 1, 0, 1,
-0.7683057, 1.015074, 0.275727, 0.6078432, 1, 0, 1,
-0.7623943, -0.8149951, -2.637507, 0.6039216, 1, 0, 1,
-0.755692, -2.433707, -2.865339, 0.5960785, 1, 0, 1,
-0.7537907, 0.4419183, -1.615713, 0.5882353, 1, 0, 1,
-0.7483656, -0.05189031, -3.407551, 0.5843138, 1, 0, 1,
-0.7450062, 0.0163894, -0.5676355, 0.5764706, 1, 0, 1,
-0.7447848, -0.3595871, -2.04097, 0.572549, 1, 0, 1,
-0.7432733, -1.30035, -2.836075, 0.5647059, 1, 0, 1,
-0.735271, -1.619274, -3.530087, 0.5607843, 1, 0, 1,
-0.7352686, -0.1908341, -2.110311, 0.5529412, 1, 0, 1,
-0.7238911, -0.7754782, -1.193456, 0.5490196, 1, 0, 1,
-0.7189644, -0.3090168, -2.928323, 0.5411765, 1, 0, 1,
-0.7023274, 0.5267879, -0.1690951, 0.5372549, 1, 0, 1,
-0.6962841, -0.4064893, -3.039656, 0.5294118, 1, 0, 1,
-0.6939998, 1.237632, -0.6422431, 0.5254902, 1, 0, 1,
-0.6936824, -1.984322, -2.9433, 0.5176471, 1, 0, 1,
-0.6834581, 0.1652261, -0.377441, 0.5137255, 1, 0, 1,
-0.6815154, 0.6330753, 0.2235084, 0.5058824, 1, 0, 1,
-0.6706032, -0.0006927984, -0.7306407, 0.5019608, 1, 0, 1,
-0.6701295, 1.227948, -0.1647325, 0.4941176, 1, 0, 1,
-0.6700602, -0.3038689, -1.215408, 0.4862745, 1, 0, 1,
-0.6565717, -1.254967, -2.298584, 0.4823529, 1, 0, 1,
-0.655063, -0.8680921, -3.67419, 0.4745098, 1, 0, 1,
-0.6514333, 0.2100265, -1.233665, 0.4705882, 1, 0, 1,
-0.650521, 0.752929, -0.9534909, 0.4627451, 1, 0, 1,
-0.6470259, 2.339084, -0.2216969, 0.4588235, 1, 0, 1,
-0.6322508, 1.583616, -1.565014, 0.4509804, 1, 0, 1,
-0.6295527, -0.409272, -2.711432, 0.4470588, 1, 0, 1,
-0.6290779, -1.698447, -1.435493, 0.4392157, 1, 0, 1,
-0.6261928, -0.6414437, -2.96033, 0.4352941, 1, 0, 1,
-0.6256719, 0.5813814, 0.4271984, 0.427451, 1, 0, 1,
-0.6202552, 0.6913347, -2.669093, 0.4235294, 1, 0, 1,
-0.6193525, 0.7408634, -1.281953, 0.4156863, 1, 0, 1,
-0.6138139, 0.1530374, -2.505267, 0.4117647, 1, 0, 1,
-0.6099048, -1.067299, -4.21981, 0.4039216, 1, 0, 1,
-0.6084231, -0.4010932, -1.320839, 0.3960784, 1, 0, 1,
-0.6075556, -0.005157851, -2.265294, 0.3921569, 1, 0, 1,
-0.602087, 0.5708468, -0.9311113, 0.3843137, 1, 0, 1,
-0.6016953, -1.604006, -3.456956, 0.3803922, 1, 0, 1,
-0.5978519, 1.201196, -0.6086665, 0.372549, 1, 0, 1,
-0.5957832, 0.4554252, -0.5138363, 0.3686275, 1, 0, 1,
-0.595743, -0.5184294, -1.896193, 0.3607843, 1, 0, 1,
-0.5941048, 0.5485246, -1.998469, 0.3568628, 1, 0, 1,
-0.590773, -1.602388, -2.798666, 0.3490196, 1, 0, 1,
-0.5899985, -0.0667308, -3.15386, 0.345098, 1, 0, 1,
-0.5899191, -0.5432151, -2.427171, 0.3372549, 1, 0, 1,
-0.5871543, 1.803183, 0.04325636, 0.3333333, 1, 0, 1,
-0.580036, 1.73575, -0.6400799, 0.3254902, 1, 0, 1,
-0.5797474, -0.5094171, -2.867242, 0.3215686, 1, 0, 1,
-0.5781237, -0.8336948, -3.394438, 0.3137255, 1, 0, 1,
-0.5776381, -0.5634258, -2.814419, 0.3098039, 1, 0, 1,
-0.5757462, 0.2446749, -1.764315, 0.3019608, 1, 0, 1,
-0.5732923, -0.6770774, -2.203138, 0.2941177, 1, 0, 1,
-0.5716264, 0.2735838, -1.513398, 0.2901961, 1, 0, 1,
-0.5636877, 0.1306898, -1.359655, 0.282353, 1, 0, 1,
-0.5583367, -0.04143156, -2.488996, 0.2784314, 1, 0, 1,
-0.5531391, 1.61757, -1.093785, 0.2705882, 1, 0, 1,
-0.547032, -0.6891778, -1.697156, 0.2666667, 1, 0, 1,
-0.5441037, -0.8550677, -1.359699, 0.2588235, 1, 0, 1,
-0.5431513, -0.05924845, -1.984133, 0.254902, 1, 0, 1,
-0.5288088, 0.3881549, -0.6373923, 0.2470588, 1, 0, 1,
-0.5269554, -1.430453, -2.479616, 0.2431373, 1, 0, 1,
-0.526153, 0.7197912, -0.6249366, 0.2352941, 1, 0, 1,
-0.5227058, 1.475433, -1.434906, 0.2313726, 1, 0, 1,
-0.516504, -1.058437, -2.903646, 0.2235294, 1, 0, 1,
-0.5163785, 0.4990873, -2.526725, 0.2196078, 1, 0, 1,
-0.5155175, 0.9944432, 1.307724, 0.2117647, 1, 0, 1,
-0.5148833, 0.871627, 0.2566333, 0.2078431, 1, 0, 1,
-0.5144739, -0.8177453, -1.892821, 0.2, 1, 0, 1,
-0.5111214, -1.29857, -2.889182, 0.1921569, 1, 0, 1,
-0.5085858, 0.3237889, -1.343956, 0.1882353, 1, 0, 1,
-0.5007116, -0.5768607, -2.281847, 0.1803922, 1, 0, 1,
-0.5003988, -0.3257858, -1.46478, 0.1764706, 1, 0, 1,
-0.4985492, 0.3618189, -1.421046, 0.1686275, 1, 0, 1,
-0.4938127, 0.6078582, -1.759726, 0.1647059, 1, 0, 1,
-0.491298, -0.8730676, -3.2669, 0.1568628, 1, 0, 1,
-0.4901969, 0.4353644, -1.195145, 0.1529412, 1, 0, 1,
-0.4863805, 0.2241727, -0.7750927, 0.145098, 1, 0, 1,
-0.4834842, -2.611718, -2.968581, 0.1411765, 1, 0, 1,
-0.4795897, -0.7390063, -2.051086, 0.1333333, 1, 0, 1,
-0.4740047, -1.324589, -2.05192, 0.1294118, 1, 0, 1,
-0.4737805, 0.6658191, -2.062964, 0.1215686, 1, 0, 1,
-0.4718571, -0.7734188, -2.694302, 0.1176471, 1, 0, 1,
-0.4705887, -0.06545012, -1.579087, 0.1098039, 1, 0, 1,
-0.4633243, 0.3720999, -1.229282, 0.1058824, 1, 0, 1,
-0.4627804, -0.08629796, -1.833385, 0.09803922, 1, 0, 1,
-0.4559031, 1.905458, -1.006381, 0.09019608, 1, 0, 1,
-0.4509874, -0.4493779, -2.377344, 0.08627451, 1, 0, 1,
-0.4496375, 0.4282811, -0.927587, 0.07843138, 1, 0, 1,
-0.4475931, -0.3075587, -2.297852, 0.07450981, 1, 0, 1,
-0.4444791, 1.042642, 0.1564309, 0.06666667, 1, 0, 1,
-0.443598, -0.2583028, -4.130941, 0.0627451, 1, 0, 1,
-0.4332026, -1.052471, -2.524723, 0.05490196, 1, 0, 1,
-0.4319406, -2.528063, -1.924559, 0.05098039, 1, 0, 1,
-0.4303367, 1.125135, -0.5463499, 0.04313726, 1, 0, 1,
-0.4295385, -0.8583572, -1.968965, 0.03921569, 1, 0, 1,
-0.4260346, -2.63931, -2.755009, 0.03137255, 1, 0, 1,
-0.4225064, -1.155477, -3.098606, 0.02745098, 1, 0, 1,
-0.4183626, 0.04538047, -1.921441, 0.01960784, 1, 0, 1,
-0.4176864, 0.5763655, -1.521421, 0.01568628, 1, 0, 1,
-0.4163933, 1.095513, -0.1982877, 0.007843138, 1, 0, 1,
-0.4146137, 0.2716319, -1.288064, 0.003921569, 1, 0, 1,
-0.4128871, 1.135404, 1.194137, 0, 1, 0.003921569, 1,
-0.4077614, -0.1741222, -1.629136, 0, 1, 0.01176471, 1,
-0.4046129, 0.03444667, -1.345802, 0, 1, 0.01568628, 1,
-0.4044882, 0.4567159, -0.5340248, 0, 1, 0.02352941, 1,
-0.3940736, 1.441735, -0.4816324, 0, 1, 0.02745098, 1,
-0.3903673, -0.7824929, -2.681629, 0, 1, 0.03529412, 1,
-0.3887294, -2.222358, -3.677904, 0, 1, 0.03921569, 1,
-0.3871161, 0.04612634, -1.346839, 0, 1, 0.04705882, 1,
-0.384544, 0.3293036, -0.6151646, 0, 1, 0.05098039, 1,
-0.3816081, -0.1482941, -2.598142, 0, 1, 0.05882353, 1,
-0.3813825, 0.4988625, -0.06644154, 0, 1, 0.0627451, 1,
-0.3801796, 2.048206, -1.599623, 0, 1, 0.07058824, 1,
-0.379922, 0.0817357, -1.116526, 0, 1, 0.07450981, 1,
-0.3786361, -0.2995417, -1.006531, 0, 1, 0.08235294, 1,
-0.3780518, 0.3882444, -0.5532965, 0, 1, 0.08627451, 1,
-0.3764325, 1.255998, 2.129003, 0, 1, 0.09411765, 1,
-0.3763265, 0.8115322, -2.674286, 0, 1, 0.1019608, 1,
-0.3727128, 1.617098, -0.5928244, 0, 1, 0.1058824, 1,
-0.3723759, -0.9132354, -1.756294, 0, 1, 0.1137255, 1,
-0.3693426, 1.137719, 1.613165, 0, 1, 0.1176471, 1,
-0.3687845, 0.1874361, -1.313072, 0, 1, 0.1254902, 1,
-0.3642828, 0.8587978, -1.384423, 0, 1, 0.1294118, 1,
-0.3612258, 0.8241073, 0.2690501, 0, 1, 0.1372549, 1,
-0.3612133, 0.3302946, -2.147513, 0, 1, 0.1411765, 1,
-0.3554348, 1.20259, 1.858203, 0, 1, 0.1490196, 1,
-0.354146, -0.3026078, -0.9037516, 0, 1, 0.1529412, 1,
-0.3517203, -0.6101363, -1.915725, 0, 1, 0.1607843, 1,
-0.3484087, -0.8462003, -2.316848, 0, 1, 0.1647059, 1,
-0.347599, -1.120231, -3.208945, 0, 1, 0.172549, 1,
-0.3434056, -0.231206, -2.230707, 0, 1, 0.1764706, 1,
-0.3426577, 0.05759044, -1.019103, 0, 1, 0.1843137, 1,
-0.3416209, 0.3506872, 0.7345845, 0, 1, 0.1882353, 1,
-0.3386805, 0.3407124, 1.24366, 0, 1, 0.1960784, 1,
-0.3302085, 1.314722, 1.033605, 0, 1, 0.2039216, 1,
-0.3286122, -1.133394, -3.395813, 0, 1, 0.2078431, 1,
-0.325086, 0.4423451, -0.7962968, 0, 1, 0.2156863, 1,
-0.3241253, -0.2125672, -0.8466783, 0, 1, 0.2196078, 1,
-0.3237395, 1.480907, 0.6682432, 0, 1, 0.227451, 1,
-0.320309, -0.3462041, -3.509159, 0, 1, 0.2313726, 1,
-0.3189117, -1.093096, -1.717531, 0, 1, 0.2392157, 1,
-0.3181132, -0.1077071, -3.684801, 0, 1, 0.2431373, 1,
-0.314695, 0.5763559, 0.5226138, 0, 1, 0.2509804, 1,
-0.3127355, 1.744473, 0.9267235, 0, 1, 0.254902, 1,
-0.3125492, 1.065289, 0.3528955, 0, 1, 0.2627451, 1,
-0.3115225, -1.137656, -3.937339, 0, 1, 0.2666667, 1,
-0.3092304, 0.4446404, -2.634835, 0, 1, 0.2745098, 1,
-0.3087425, -0.1329549, -1.95347, 0, 1, 0.2784314, 1,
-0.3052429, -0.2621188, -1.602816, 0, 1, 0.2862745, 1,
-0.3037075, -0.3141279, -3.189683, 0, 1, 0.2901961, 1,
-0.3020647, -0.3042359, -4.221453, 0, 1, 0.2980392, 1,
-0.2966481, 1.180234, -1.610277, 0, 1, 0.3058824, 1,
-0.2890795, -0.9522939, -0.1336976, 0, 1, 0.3098039, 1,
-0.2886562, 1.115378, -0.04899365, 0, 1, 0.3176471, 1,
-0.288117, 0.9159108, -0.06283008, 0, 1, 0.3215686, 1,
-0.2873208, 1.30761, -1.051077, 0, 1, 0.3294118, 1,
-0.2872792, 1.05811, 0.5663865, 0, 1, 0.3333333, 1,
-0.283253, -1.012535, -2.598872, 0, 1, 0.3411765, 1,
-0.2804394, -0.6634217, -2.872705, 0, 1, 0.345098, 1,
-0.2803181, -0.2721609, -3.226868, 0, 1, 0.3529412, 1,
-0.2787751, -1.564905, -3.138013, 0, 1, 0.3568628, 1,
-0.2759972, 1.614371, -0.2685985, 0, 1, 0.3647059, 1,
-0.2747316, -0.3730092, -1.768237, 0, 1, 0.3686275, 1,
-0.2740387, -1.057671, -1.870402, 0, 1, 0.3764706, 1,
-0.2663127, -0.4396253, -2.9118, 0, 1, 0.3803922, 1,
-0.2657034, -0.2638401, 0.01897718, 0, 1, 0.3882353, 1,
-0.2622912, -1.38994, -2.574982, 0, 1, 0.3921569, 1,
-0.2523668, -0.005102337, -1.648862, 0, 1, 0.4, 1,
-0.2508153, 0.5595095, -1.622779, 0, 1, 0.4078431, 1,
-0.2501006, -1.016441, -3.501229, 0, 1, 0.4117647, 1,
-0.246383, -0.007367363, -1.131104, 0, 1, 0.4196078, 1,
-0.2420709, 0.2683248, -0.4790595, 0, 1, 0.4235294, 1,
-0.2396044, 1.459915, 1.023297, 0, 1, 0.4313726, 1,
-0.2346177, 0.8488719, -1.53769, 0, 1, 0.4352941, 1,
-0.2335774, -0.5178815, -1.611189, 0, 1, 0.4431373, 1,
-0.2328904, -0.01517806, -0.09582104, 0, 1, 0.4470588, 1,
-0.2326597, -1.58177, -3.186456, 0, 1, 0.454902, 1,
-0.2239274, 0.5802859, 0.4911752, 0, 1, 0.4588235, 1,
-0.2239091, 0.1459024, 0.711977, 0, 1, 0.4666667, 1,
-0.2236312, 1.500867, 0.6469361, 0, 1, 0.4705882, 1,
-0.2209882, -0.5396794, -2.176935, 0, 1, 0.4784314, 1,
-0.2203003, -0.58272, -3.252288, 0, 1, 0.4823529, 1,
-0.2118509, 1.712883, -0.778533, 0, 1, 0.4901961, 1,
-0.2114983, 0.1570027, -1.334121, 0, 1, 0.4941176, 1,
-0.2093215, -1.205299, -2.59626, 0, 1, 0.5019608, 1,
-0.2071946, 0.8291637, -1.21314, 0, 1, 0.509804, 1,
-0.2063207, 0.7182921, -0.8678603, 0, 1, 0.5137255, 1,
-0.2060802, 1.619297, 0.1506138, 0, 1, 0.5215687, 1,
-0.203638, 0.07361429, -0.7802356, 0, 1, 0.5254902, 1,
-0.2032544, 0.5346498, -0.3706635, 0, 1, 0.5333334, 1,
-0.1967882, -0.307255, -0.1762922, 0, 1, 0.5372549, 1,
-0.1967008, -1.555327, -4.925091, 0, 1, 0.5450981, 1,
-0.1893858, -2.058265, -4.756238, 0, 1, 0.5490196, 1,
-0.1853203, -0.1741583, -1.642194, 0, 1, 0.5568628, 1,
-0.181025, -0.8009288, -2.81607, 0, 1, 0.5607843, 1,
-0.1768877, 2.0405, -1.486844, 0, 1, 0.5686275, 1,
-0.1737106, 0.9878061, -0.369758, 0, 1, 0.572549, 1,
-0.1722711, 0.006291953, -3.751909, 0, 1, 0.5803922, 1,
-0.1667391, 0.9666975, -0.7490821, 0, 1, 0.5843138, 1,
-0.166729, 2.275032, -2.357459, 0, 1, 0.5921569, 1,
-0.1665416, -0.5584463, -3.418032, 0, 1, 0.5960785, 1,
-0.1637596, -0.40477, -2.383024, 0, 1, 0.6039216, 1,
-0.154281, 1.11241, 0.9458037, 0, 1, 0.6117647, 1,
-0.1534387, 1.650662, 0.5310095, 0, 1, 0.6156863, 1,
-0.1514839, -0.3485534, -3.1523, 0, 1, 0.6235294, 1,
-0.1487034, 0.4765022, -0.4795631, 0, 1, 0.627451, 1,
-0.1477012, 1.466527, -1.610653, 0, 1, 0.6352941, 1,
-0.146412, -0.5866334, -1.956301, 0, 1, 0.6392157, 1,
-0.1447393, 0.4639456, 1.720307, 0, 1, 0.6470588, 1,
-0.1428116, 0.9786061, 0.1449611, 0, 1, 0.6509804, 1,
-0.1401473, -0.1824222, -3.274708, 0, 1, 0.6588235, 1,
-0.133167, -0.1606779, -1.775496, 0, 1, 0.6627451, 1,
-0.1251678, -1.139854, -1.49749, 0, 1, 0.6705883, 1,
-0.1214212, 0.4308677, -0.6449497, 0, 1, 0.6745098, 1,
-0.1203306, 1.657772, -0.7053502, 0, 1, 0.682353, 1,
-0.1192936, 0.1584172, -0.08087587, 0, 1, 0.6862745, 1,
-0.1190034, -0.2404861, -3.309072, 0, 1, 0.6941177, 1,
-0.1163565, -0.6756634, -3.980011, 0, 1, 0.7019608, 1,
-0.1115208, 1.164867, 1.442274, 0, 1, 0.7058824, 1,
-0.1100704, 0.1835756, 0.5357206, 0, 1, 0.7137255, 1,
-0.1087841, -0.2030931, -3.045667, 0, 1, 0.7176471, 1,
-0.1076765, 1.112981, 0.5648519, 0, 1, 0.7254902, 1,
-0.09676066, 1.63889, 1.292609, 0, 1, 0.7294118, 1,
-0.09508827, -1.046066, -1.779479, 0, 1, 0.7372549, 1,
-0.09294841, 2.055137, -1.89565, 0, 1, 0.7411765, 1,
-0.09261744, 0.0297613, -0.3397022, 0, 1, 0.7490196, 1,
-0.09026183, -0.03044212, -0.8804361, 0, 1, 0.7529412, 1,
-0.09004447, -0.9746928, -1.976152, 0, 1, 0.7607843, 1,
-0.08822081, 0.5214391, 0.2094815, 0, 1, 0.7647059, 1,
-0.08795088, 0.06650614, -0.04864704, 0, 1, 0.772549, 1,
-0.08775337, 0.5300076, 0.4609308, 0, 1, 0.7764706, 1,
-0.0847154, 0.1944415, -2.188438, 0, 1, 0.7843137, 1,
-0.08259256, -0.7867137, -2.701235, 0, 1, 0.7882353, 1,
-0.08218767, -0.1465194, -1.186998, 0, 1, 0.7960784, 1,
-0.07966606, -1.709241, -3.677116, 0, 1, 0.8039216, 1,
-0.07037783, 0.4701658, -0.6059188, 0, 1, 0.8078431, 1,
-0.07004366, 0.06524019, -0.6615824, 0, 1, 0.8156863, 1,
-0.06588519, 0.314395, -0.1071818, 0, 1, 0.8196079, 1,
-0.06130191, -0.3063245, -4.132433, 0, 1, 0.827451, 1,
-0.06061443, 0.8429888, 0.6769522, 0, 1, 0.8313726, 1,
-0.05866755, 0.5099563, -0.9694716, 0, 1, 0.8392157, 1,
-0.0577962, 0.4970821, 0.5777867, 0, 1, 0.8431373, 1,
-0.05570076, 0.02638216, -1.629706, 0, 1, 0.8509804, 1,
-0.05323387, 0.8102816, -1.781565, 0, 1, 0.854902, 1,
-0.04699542, -0.7118367, -2.857338, 0, 1, 0.8627451, 1,
-0.04539308, -0.3292908, -2.323015, 0, 1, 0.8666667, 1,
-0.04186637, -1.611665, -2.13274, 0, 1, 0.8745098, 1,
-0.04162444, -0.1603141, -0.4173045, 0, 1, 0.8784314, 1,
-0.03842505, 0.4081665, -1.955317, 0, 1, 0.8862745, 1,
-0.03524014, 0.05844371, 1.201392, 0, 1, 0.8901961, 1,
-0.03445635, -0.3737931, -1.860026, 0, 1, 0.8980392, 1,
-0.03348776, 0.8001717, 0.1454927, 0, 1, 0.9058824, 1,
-0.03320285, -0.370762, -2.177371, 0, 1, 0.9098039, 1,
-0.03202597, -1.29589, -3.579377, 0, 1, 0.9176471, 1,
-0.03082619, -0.8997034, -3.548262, 0, 1, 0.9215686, 1,
-0.02684085, -0.4567301, -4.00525, 0, 1, 0.9294118, 1,
-0.02087029, -1.430831, -3.828423, 0, 1, 0.9333333, 1,
-0.02078935, -2.604408, -4.278568, 0, 1, 0.9411765, 1,
-0.01939606, 1.085267, -0.4004236, 0, 1, 0.945098, 1,
-0.01498018, -1.547586, -2.100841, 0, 1, 0.9529412, 1,
-0.01386352, -0.7275907, -4.269312, 0, 1, 0.9568627, 1,
-0.01205301, 0.569261, -1.827596, 0, 1, 0.9647059, 1,
-0.003704721, 0.08489586, 1.08312, 0, 1, 0.9686275, 1,
-0.0009953267, -0.5056691, -4.252792, 0, 1, 0.9764706, 1,
-0.0004465968, -0.5078338, -1.991843, 0, 1, 0.9803922, 1,
-0.0003665462, -0.1609272, -3.250297, 0, 1, 0.9882353, 1,
-7.089456e-05, 0.9654875, -0.08741099, 0, 1, 0.9921569, 1,
0.003814311, 0.5996208, 0.52887, 0, 1, 1, 1,
0.004530702, 0.3530181, 0.3244555, 0, 0.9921569, 1, 1,
0.006151413, -0.5676248, 2.437117, 0, 0.9882353, 1, 1,
0.006171046, 0.3226363, 0.9031716, 0, 0.9803922, 1, 1,
0.008308795, 1.451038, 1.105432, 0, 0.9764706, 1, 1,
0.01047013, -0.8443879, 3.527868, 0, 0.9686275, 1, 1,
0.01426268, 0.9339586, 1.106497, 0, 0.9647059, 1, 1,
0.01833856, 0.6122998, -0.4496275, 0, 0.9568627, 1, 1,
0.02136527, -0.8322768, 2.293871, 0, 0.9529412, 1, 1,
0.03363106, -0.4732382, 4.202289, 0, 0.945098, 1, 1,
0.03697647, -0.7305011, 4.255479, 0, 0.9411765, 1, 1,
0.03724328, -0.8928651, 3.141415, 0, 0.9333333, 1, 1,
0.03884814, 0.71922, -1.223428, 0, 0.9294118, 1, 1,
0.04237167, 0.2922813, 0.2700776, 0, 0.9215686, 1, 1,
0.04356963, -0.3520452, 3.644872, 0, 0.9176471, 1, 1,
0.0445337, -0.4037967, 1.155017, 0, 0.9098039, 1, 1,
0.0466769, 0.3478993, 0.5097328, 0, 0.9058824, 1, 1,
0.04713467, 1.755783, 1.03987, 0, 0.8980392, 1, 1,
0.0482308, 0.9329265, -1.559335, 0, 0.8901961, 1, 1,
0.05548836, -0.06978846, 1.879885, 0, 0.8862745, 1, 1,
0.05593844, 2.984781, 0.5314476, 0, 0.8784314, 1, 1,
0.06267104, -0.01310028, 0.9380223, 0, 0.8745098, 1, 1,
0.06425768, -0.729912, 2.770684, 0, 0.8666667, 1, 1,
0.06516899, -0.221789, 0.3227866, 0, 0.8627451, 1, 1,
0.06603865, -0.1469882, 2.834397, 0, 0.854902, 1, 1,
0.06609774, 1.155275, 0.8134193, 0, 0.8509804, 1, 1,
0.06686138, 1.128349, 1.296681, 0, 0.8431373, 1, 1,
0.06694262, -0.1632315, 1.77349, 0, 0.8392157, 1, 1,
0.06963699, 0.1763377, 0.4384319, 0, 0.8313726, 1, 1,
0.07123587, -0.2331161, 2.849511, 0, 0.827451, 1, 1,
0.07162248, 0.8723295, -0.02912071, 0, 0.8196079, 1, 1,
0.07255781, -0.942157, 2.535224, 0, 0.8156863, 1, 1,
0.07581405, 0.5234222, 2.046797, 0, 0.8078431, 1, 1,
0.07778966, -0.1507447, 4.146839, 0, 0.8039216, 1, 1,
0.07837121, 1.400968, -0.7538982, 0, 0.7960784, 1, 1,
0.08328667, -0.5636423, 1.733421, 0, 0.7882353, 1, 1,
0.08417799, 0.7709546, 0.4296696, 0, 0.7843137, 1, 1,
0.08442903, -1.180603, 1.988191, 0, 0.7764706, 1, 1,
0.0862295, -0.6088976, 2.167956, 0, 0.772549, 1, 1,
0.09090657, 1.408283, 1.151419, 0, 0.7647059, 1, 1,
0.09329063, -0.86907, 2.503721, 0, 0.7607843, 1, 1,
0.09397756, -0.2370238, 3.753506, 0, 0.7529412, 1, 1,
0.09601121, -1.552947, 3.828245, 0, 0.7490196, 1, 1,
0.09751817, 0.1429931, 0.7371054, 0, 0.7411765, 1, 1,
0.09871267, -1.08679, 2.607127, 0, 0.7372549, 1, 1,
0.100112, -2.396878, 1.099843, 0, 0.7294118, 1, 1,
0.1010993, -0.04444167, 1.500905, 0, 0.7254902, 1, 1,
0.101843, -1.262576, 2.732946, 0, 0.7176471, 1, 1,
0.1097128, -2.401502, 4.475879, 0, 0.7137255, 1, 1,
0.1111435, -0.61617, 3.208853, 0, 0.7058824, 1, 1,
0.1173196, 0.4615141, 1.882387, 0, 0.6980392, 1, 1,
0.1200875, -1.790125, 2.512014, 0, 0.6941177, 1, 1,
0.1210689, 0.1116908, 1.182288, 0, 0.6862745, 1, 1,
0.125076, 1.250657, -1.001077, 0, 0.682353, 1, 1,
0.1264881, -1.21446, 4.343676, 0, 0.6745098, 1, 1,
0.1331617, 0.3285491, 0.8334944, 0, 0.6705883, 1, 1,
0.1347981, 1.615785, 0.5571344, 0, 0.6627451, 1, 1,
0.1379699, 0.5171686, -0.3316428, 0, 0.6588235, 1, 1,
0.1423398, -0.8659791, 3.97477, 0, 0.6509804, 1, 1,
0.1507325, -0.3998168, 0.822983, 0, 0.6470588, 1, 1,
0.1607499, -1.150596, 1.52901, 0, 0.6392157, 1, 1,
0.1607652, 0.4339662, 1.66618, 0, 0.6352941, 1, 1,
0.1635444, 3.307558, -0.3061807, 0, 0.627451, 1, 1,
0.1642655, -0.8249753, 3.289441, 0, 0.6235294, 1, 1,
0.164831, -0.963725, 4.24908, 0, 0.6156863, 1, 1,
0.1655433, 0.6345477, -0.3628487, 0, 0.6117647, 1, 1,
0.1705682, 0.3435444, 0.1043891, 0, 0.6039216, 1, 1,
0.1705867, 0.7734208, 0.6942604, 0, 0.5960785, 1, 1,
0.1736483, -1.270522, 4.418614, 0, 0.5921569, 1, 1,
0.1767557, 0.5953886, 0.3184163, 0, 0.5843138, 1, 1,
0.1779702, -0.8175759, 2.807043, 0, 0.5803922, 1, 1,
0.1793814, -0.4473144, 2.415896, 0, 0.572549, 1, 1,
0.1807847, 3.892913, -0.1109138, 0, 0.5686275, 1, 1,
0.1848932, 1.826409, -2.149459, 0, 0.5607843, 1, 1,
0.1858409, 0.05953985, 0.2599947, 0, 0.5568628, 1, 1,
0.1877823, 1.416839, 0.3877953, 0, 0.5490196, 1, 1,
0.1906705, -0.4211121, 1.185823, 0, 0.5450981, 1, 1,
0.1906768, 0.7919837, -0.03288046, 0, 0.5372549, 1, 1,
0.1936361, 1.254102, 0.4149056, 0, 0.5333334, 1, 1,
0.1978569, -0.9876384, 3.516032, 0, 0.5254902, 1, 1,
0.1996138, -0.9904464, 2.002285, 0, 0.5215687, 1, 1,
0.2034149, 0.3358391, 0.9834302, 0, 0.5137255, 1, 1,
0.2054666, 0.9888948, 0.2362488, 0, 0.509804, 1, 1,
0.2072219, -1.703649, 2.852659, 0, 0.5019608, 1, 1,
0.2096949, 1.269706, -1.841226, 0, 0.4941176, 1, 1,
0.2113326, -1.069765, 3.677554, 0, 0.4901961, 1, 1,
0.2118263, 0.4721766, -1.163393, 0, 0.4823529, 1, 1,
0.2135223, -0.4179566, 1.370456, 0, 0.4784314, 1, 1,
0.2138647, 1.970733, -0.7276852, 0, 0.4705882, 1, 1,
0.2142029, -0.3264235, 3.426275, 0, 0.4666667, 1, 1,
0.214361, 0.7249231, 0.940028, 0, 0.4588235, 1, 1,
0.2186536, -0.6209405, 1.369918, 0, 0.454902, 1, 1,
0.2208874, 0.9724202, 0.5190371, 0, 0.4470588, 1, 1,
0.2213245, -0.9132301, 2.800731, 0, 0.4431373, 1, 1,
0.2338473, 1.206946, -0.8835877, 0, 0.4352941, 1, 1,
0.2344707, -0.09434602, 1.753929, 0, 0.4313726, 1, 1,
0.2349048, 1.020199, -1.740619, 0, 0.4235294, 1, 1,
0.2369481, 0.1191401, 0.5051284, 0, 0.4196078, 1, 1,
0.2377957, 0.7831162, -0.2288857, 0, 0.4117647, 1, 1,
0.238465, 0.2075906, -0.2001232, 0, 0.4078431, 1, 1,
0.2404836, 1.660132, -1.449063, 0, 0.4, 1, 1,
0.2414, 0.966447, -1.032869, 0, 0.3921569, 1, 1,
0.2430067, -0.1717923, 2.956017, 0, 0.3882353, 1, 1,
0.2452405, -0.2951058, 3.721462, 0, 0.3803922, 1, 1,
0.2461071, 0.06290931, 1.274053, 0, 0.3764706, 1, 1,
0.2482853, 1.440107, 1.785975, 0, 0.3686275, 1, 1,
0.2513668, -0.6510233, 3.096934, 0, 0.3647059, 1, 1,
0.2550091, 0.6179778, 0.5153051, 0, 0.3568628, 1, 1,
0.2553846, 1.357776, -0.342864, 0, 0.3529412, 1, 1,
0.2594749, -0.9359019, 3.543334, 0, 0.345098, 1, 1,
0.2609164, -0.2450908, 1.272966, 0, 0.3411765, 1, 1,
0.2628376, 0.2117239, 1.546713, 0, 0.3333333, 1, 1,
0.2640628, 1.267091, -2.57487, 0, 0.3294118, 1, 1,
0.2676122, 0.5685344, -0.1330176, 0, 0.3215686, 1, 1,
0.2676572, 0.4630365, 0.514198, 0, 0.3176471, 1, 1,
0.2689451, 0.9727163, -0.7076578, 0, 0.3098039, 1, 1,
0.2714494, 0.2030089, 1.479153, 0, 0.3058824, 1, 1,
0.271517, 0.4638838, 0.3971078, 0, 0.2980392, 1, 1,
0.2722211, 0.4119058, -1.339271, 0, 0.2901961, 1, 1,
0.2743481, 0.7068663, -0.1925937, 0, 0.2862745, 1, 1,
0.2760743, -0.8243352, 2.240315, 0, 0.2784314, 1, 1,
0.2795403, -0.2442392, 0.6371989, 0, 0.2745098, 1, 1,
0.2798246, -0.1483192, 2.965527, 0, 0.2666667, 1, 1,
0.2887067, 1.110802, 0.3819521, 0, 0.2627451, 1, 1,
0.2894832, 0.8690714, 1.924871, 0, 0.254902, 1, 1,
0.2919889, -1.615539, 3.63452, 0, 0.2509804, 1, 1,
0.2952358, 0.2603976, 2.129287, 0, 0.2431373, 1, 1,
0.2971068, -0.2008682, 2.470361, 0, 0.2392157, 1, 1,
0.3003255, -1.113651, 2.494953, 0, 0.2313726, 1, 1,
0.3016366, 1.356892, -0.4920146, 0, 0.227451, 1, 1,
0.3057756, 1.692878, 0.574326, 0, 0.2196078, 1, 1,
0.309311, 0.05316238, 1.205083, 0, 0.2156863, 1, 1,
0.3148937, 0.4425028, 0.3395048, 0, 0.2078431, 1, 1,
0.3182227, -1.192252, 2.732348, 0, 0.2039216, 1, 1,
0.3188488, 2.340963, -0.09334603, 0, 0.1960784, 1, 1,
0.3231065, -0.4879141, 2.887339, 0, 0.1882353, 1, 1,
0.3265103, 0.5626189, 0.2796879, 0, 0.1843137, 1, 1,
0.3288687, 0.7039872, 0.9587683, 0, 0.1764706, 1, 1,
0.3352025, -0.1468588, 1.90258, 0, 0.172549, 1, 1,
0.3358964, -0.7385536, 3.241693, 0, 0.1647059, 1, 1,
0.3394604, -1.154609, 3.058116, 0, 0.1607843, 1, 1,
0.3451033, 1.320102, -0.3630775, 0, 0.1529412, 1, 1,
0.3461497, -0.08356753, 1.240835, 0, 0.1490196, 1, 1,
0.3545978, -1.027285, 4.343215, 0, 0.1411765, 1, 1,
0.3580326, 0.2112006, 1.453376, 0, 0.1372549, 1, 1,
0.3631527, 1.479494, 1.710542, 0, 0.1294118, 1, 1,
0.3655778, 0.7945906, 1.673373, 0, 0.1254902, 1, 1,
0.370876, 0.7940412, -0.425106, 0, 0.1176471, 1, 1,
0.3784037, 1.071056, -1.089014, 0, 0.1137255, 1, 1,
0.3786855, -0.2848188, 0.7290758, 0, 0.1058824, 1, 1,
0.3878067, 0.2338311, 1.619969, 0, 0.09803922, 1, 1,
0.3896127, -0.3716011, 1.829494, 0, 0.09411765, 1, 1,
0.3901771, 1.730702, -0.1662212, 0, 0.08627451, 1, 1,
0.3913662, -0.6994881, 2.495479, 0, 0.08235294, 1, 1,
0.3913692, -0.3188385, 1.518014, 0, 0.07450981, 1, 1,
0.3936493, 0.3806216, 0.6401215, 0, 0.07058824, 1, 1,
0.3954721, -0.2742965, 0.535009, 0, 0.0627451, 1, 1,
0.3957189, -1.032821, 3.6143, 0, 0.05882353, 1, 1,
0.3980581, -0.2115888, 2.132453, 0, 0.05098039, 1, 1,
0.4022579, -0.2554197, 2.452781, 0, 0.04705882, 1, 1,
0.4035126, 0.009562764, 0.06829482, 0, 0.03921569, 1, 1,
0.406974, 0.5283588, -0.321081, 0, 0.03529412, 1, 1,
0.4092085, -0.005284212, 2.519744, 0, 0.02745098, 1, 1,
0.4096451, 0.7347624, -0.8719764, 0, 0.02352941, 1, 1,
0.4119777, 0.1356622, 0.2796277, 0, 0.01568628, 1, 1,
0.4122387, -0.7365165, 2.489948, 0, 0.01176471, 1, 1,
0.4152119, -0.3973932, 1.333485, 0, 0.003921569, 1, 1,
0.4195094, 0.2498461, 1.930246, 0.003921569, 0, 1, 1,
0.4213957, -0.01032531, 0.9838666, 0.007843138, 0, 1, 1,
0.4219334, 0.4986322, 0.7128243, 0.01568628, 0, 1, 1,
0.4223375, 0.481231, 0.2572833, 0.01960784, 0, 1, 1,
0.422682, 0.4676413, 0.9673133, 0.02745098, 0, 1, 1,
0.4254347, -0.3777779, 2.576754, 0.03137255, 0, 1, 1,
0.4257462, 0.02531498, 0.595395, 0.03921569, 0, 1, 1,
0.4306533, -0.1962149, 0.4342318, 0.04313726, 0, 1, 1,
0.4311564, 0.1556999, 2.248491, 0.05098039, 0, 1, 1,
0.4319303, 0.2407397, 0.1937881, 0.05490196, 0, 1, 1,
0.4381345, 0.04879754, 0.5948852, 0.0627451, 0, 1, 1,
0.4595596, 0.884607, 1.7562, 0.06666667, 0, 1, 1,
0.4613209, 0.4846768, 1.458504, 0.07450981, 0, 1, 1,
0.4615125, 1.571518, 1.43988, 0.07843138, 0, 1, 1,
0.4637132, 2.712093, -0.324944, 0.08627451, 0, 1, 1,
0.4688933, 0.1550977, -0.1682741, 0.09019608, 0, 1, 1,
0.4724464, 0.1664989, 2.147061, 0.09803922, 0, 1, 1,
0.4731249, -0.2552778, 2.07028, 0.1058824, 0, 1, 1,
0.4768926, -0.3003281, 1.690533, 0.1098039, 0, 1, 1,
0.4780243, -0.1486494, 2.821357, 0.1176471, 0, 1, 1,
0.47953, 0.2374465, -0.103356, 0.1215686, 0, 1, 1,
0.4804331, -1.407619, 3.275152, 0.1294118, 0, 1, 1,
0.489039, -0.8231643, 4.290676, 0.1333333, 0, 1, 1,
0.4892559, -0.1231905, 2.359195, 0.1411765, 0, 1, 1,
0.4918061, -1.547018, 3.378467, 0.145098, 0, 1, 1,
0.4948016, -0.4957555, 2.888137, 0.1529412, 0, 1, 1,
0.4955284, -0.2805789, 0.9933025, 0.1568628, 0, 1, 1,
0.496067, -0.5897473, 1.829211, 0.1647059, 0, 1, 1,
0.5066061, 0.1796719, 1.892213, 0.1686275, 0, 1, 1,
0.5067557, -1.537373, 3.052849, 0.1764706, 0, 1, 1,
0.5106063, 1.29429, 0.666898, 0.1803922, 0, 1, 1,
0.5199695, -0.07282742, 1.970251, 0.1882353, 0, 1, 1,
0.5206946, -1.509544, 4.859018, 0.1921569, 0, 1, 1,
0.5234928, 0.3215455, 2.381522, 0.2, 0, 1, 1,
0.527, -0.3752002, 1.178174, 0.2078431, 0, 1, 1,
0.5301636, 1.311566, -1.218823, 0.2117647, 0, 1, 1,
0.5307132, -0.08281457, 2.192505, 0.2196078, 0, 1, 1,
0.5320822, 1.31275, 0.7629862, 0.2235294, 0, 1, 1,
0.5328074, -0.6106427, 2.583842, 0.2313726, 0, 1, 1,
0.5352952, 1.415831, 0.8029905, 0.2352941, 0, 1, 1,
0.5428482, 0.09674959, -0.3423327, 0.2431373, 0, 1, 1,
0.5463771, -1.076581, 1.89162, 0.2470588, 0, 1, 1,
0.5473517, -0.805504, 1.039656, 0.254902, 0, 1, 1,
0.5506804, 1.971252, 0.5816916, 0.2588235, 0, 1, 1,
0.5514472, -1.095398, 2.246574, 0.2666667, 0, 1, 1,
0.555393, -0.3249028, 2.161856, 0.2705882, 0, 1, 1,
0.5562969, 0.3070795, 1.842706, 0.2784314, 0, 1, 1,
0.5570677, -0.2955438, 2.416661, 0.282353, 0, 1, 1,
0.5609572, -0.02236477, 0.8174523, 0.2901961, 0, 1, 1,
0.5622993, -0.4593827, 2.478827, 0.2941177, 0, 1, 1,
0.5764284, 1.723776, 0.07342133, 0.3019608, 0, 1, 1,
0.57956, -1.046118, 1.648726, 0.3098039, 0, 1, 1,
0.5805789, -0.8755805, 1.936014, 0.3137255, 0, 1, 1,
0.5820048, -0.2617553, 3.410822, 0.3215686, 0, 1, 1,
0.5865659, -0.07698838, 1.658289, 0.3254902, 0, 1, 1,
0.5877039, -0.3312434, 4.268244, 0.3333333, 0, 1, 1,
0.5881708, 1.164592, 1.619178, 0.3372549, 0, 1, 1,
0.5993478, -0.6100845, 2.293617, 0.345098, 0, 1, 1,
0.603433, -0.2556709, 1.976068, 0.3490196, 0, 1, 1,
0.6040844, -0.3902998, 2.44873, 0.3568628, 0, 1, 1,
0.6085647, -2.122293, 2.088376, 0.3607843, 0, 1, 1,
0.6109934, -0.7386371, 2.685581, 0.3686275, 0, 1, 1,
0.6139844, -1.341311, 2.977186, 0.372549, 0, 1, 1,
0.6146973, 0.9047734, -0.05447498, 0.3803922, 0, 1, 1,
0.6165419, 1.041729, 1.423198, 0.3843137, 0, 1, 1,
0.6178687, 2.127762, 2.135241, 0.3921569, 0, 1, 1,
0.6181502, 0.9828267, -1.107444, 0.3960784, 0, 1, 1,
0.6188295, 0.1936259, 0.7821158, 0.4039216, 0, 1, 1,
0.6207862, 0.2061102, 2.109786, 0.4117647, 0, 1, 1,
0.6230673, 0.8499748, 1.243278, 0.4156863, 0, 1, 1,
0.6242239, 0.2639993, -0.6441275, 0.4235294, 0, 1, 1,
0.6273609, -1.479787, 3.685873, 0.427451, 0, 1, 1,
0.6330575, 1.784787, -0.6866509, 0.4352941, 0, 1, 1,
0.6334908, 0.05223241, -0.4621185, 0.4392157, 0, 1, 1,
0.6384746, -0.183949, 1.41471, 0.4470588, 0, 1, 1,
0.6413438, -1.673894, 3.18951, 0.4509804, 0, 1, 1,
0.6413556, -0.7181596, 2.83867, 0.4588235, 0, 1, 1,
0.6505576, -0.5588483, 3.039608, 0.4627451, 0, 1, 1,
0.6518839, -0.5184002, 0.9758578, 0.4705882, 0, 1, 1,
0.6538835, -0.5805016, -0.0008359589, 0.4745098, 0, 1, 1,
0.6573062, 0.5708596, -0.1576642, 0.4823529, 0, 1, 1,
0.658658, -0.658299, 0.7613462, 0.4862745, 0, 1, 1,
0.6595286, -0.2546725, 0.8511251, 0.4941176, 0, 1, 1,
0.660482, 0.8965309, -0.7240837, 0.5019608, 0, 1, 1,
0.6622353, 2.729173, -1.812886, 0.5058824, 0, 1, 1,
0.6680456, -0.1984058, 1.725129, 0.5137255, 0, 1, 1,
0.6715185, -1.206897, 1.519393, 0.5176471, 0, 1, 1,
0.6767579, 0.1526032, 0.6348531, 0.5254902, 0, 1, 1,
0.6780348, -0.5162057, 0.3704493, 0.5294118, 0, 1, 1,
0.6830309, 0.6448147, 1.900847, 0.5372549, 0, 1, 1,
0.6832297, -0.7230012, 3.294865, 0.5411765, 0, 1, 1,
0.6841594, -1.408192, 3.980656, 0.5490196, 0, 1, 1,
0.6870193, 0.5045078, 1.59014, 0.5529412, 0, 1, 1,
0.6888423, -1.496532, 1.431227, 0.5607843, 0, 1, 1,
0.6905102, -0.9524365, 2.049646, 0.5647059, 0, 1, 1,
0.6937681, -2.691009, 2.64209, 0.572549, 0, 1, 1,
0.693918, -0.1696645, 2.250765, 0.5764706, 0, 1, 1,
0.694795, 0.4465881, 1.866171, 0.5843138, 0, 1, 1,
0.7045681, 0.8426093, 1.575751, 0.5882353, 0, 1, 1,
0.7053061, 1.844451, -0.5931342, 0.5960785, 0, 1, 1,
0.7080174, -0.07037609, 2.002366, 0.6039216, 0, 1, 1,
0.7089176, 0.5769671, 1.128653, 0.6078432, 0, 1, 1,
0.7145683, -0.733722, 1.646296, 0.6156863, 0, 1, 1,
0.7198405, 0.08275651, 1.847562, 0.6196079, 0, 1, 1,
0.7294944, 1.231031, -0.670239, 0.627451, 0, 1, 1,
0.7353842, -2.021705, 2.603597, 0.6313726, 0, 1, 1,
0.7362538, 1.258985, 1.211141, 0.6392157, 0, 1, 1,
0.7417948, -0.4965779, 2.459015, 0.6431373, 0, 1, 1,
0.7423056, 0.4637022, 2.033491, 0.6509804, 0, 1, 1,
0.7429252, -0.8012907, 3.218617, 0.654902, 0, 1, 1,
0.7444015, 0.7101352, 0.9726047, 0.6627451, 0, 1, 1,
0.7465305, -0.06938615, 1.596706, 0.6666667, 0, 1, 1,
0.7497157, -0.6933522, 2.435367, 0.6745098, 0, 1, 1,
0.75091, 1.29158, -0.8246776, 0.6784314, 0, 1, 1,
0.7523087, 1.475354, 0.3811344, 0.6862745, 0, 1, 1,
0.754914, 0.559701, 1.288994, 0.6901961, 0, 1, 1,
0.7560244, 1.391445, 0.6931559, 0.6980392, 0, 1, 1,
0.7588312, 1.170358, 0.08785798, 0.7058824, 0, 1, 1,
0.7616218, -0.2152195, 2.120216, 0.7098039, 0, 1, 1,
0.7644578, -0.9880981, 3.791335, 0.7176471, 0, 1, 1,
0.774033, -0.4010611, 3.217849, 0.7215686, 0, 1, 1,
0.7744405, -0.9254285, 2.852484, 0.7294118, 0, 1, 1,
0.77775, 0.04821579, 0.3666003, 0.7333333, 0, 1, 1,
0.7779222, -1.396185, 4.017558, 0.7411765, 0, 1, 1,
0.784334, -1.4038, 3.079447, 0.7450981, 0, 1, 1,
0.7882292, -2.066759, 2.755801, 0.7529412, 0, 1, 1,
0.7888656, -0.1744518, -0.1521376, 0.7568628, 0, 1, 1,
0.7891331, -0.7840422, 3.399443, 0.7647059, 0, 1, 1,
0.7946067, 0.5398083, 0.1552851, 0.7686275, 0, 1, 1,
0.7954383, 0.4924715, 1.902138, 0.7764706, 0, 1, 1,
0.7966864, 1.673985, 0.1246282, 0.7803922, 0, 1, 1,
0.804734, 0.110244, 0.3408479, 0.7882353, 0, 1, 1,
0.8051439, -1.445192, 2.162622, 0.7921569, 0, 1, 1,
0.8066158, 0.5431562, 2.514028, 0.8, 0, 1, 1,
0.8091009, 0.5260547, 1.834396, 0.8078431, 0, 1, 1,
0.8103915, 1.094504, 0.5419103, 0.8117647, 0, 1, 1,
0.8120589, -0.1779532, 2.215735, 0.8196079, 0, 1, 1,
0.8155808, -0.9180552, 1.98334, 0.8235294, 0, 1, 1,
0.8160064, 0.6747436, 1.308598, 0.8313726, 0, 1, 1,
0.8210076, 0.1335999, 1.43215, 0.8352941, 0, 1, 1,
0.8320392, 2.108731, -0.1907142, 0.8431373, 0, 1, 1,
0.834136, -0.8742752, 2.248527, 0.8470588, 0, 1, 1,
0.8379867, -0.4076717, 2.521149, 0.854902, 0, 1, 1,
0.8381175, -1.728241, 2.573116, 0.8588235, 0, 1, 1,
0.8408176, -0.230616, 2.906838, 0.8666667, 0, 1, 1,
0.841306, -0.1208477, 2.159926, 0.8705882, 0, 1, 1,
0.8466697, -0.3835427, 0.9094489, 0.8784314, 0, 1, 1,
0.8473739, 0.3233142, 0.6557208, 0.8823529, 0, 1, 1,
0.8473752, 0.4066185, 1.429343, 0.8901961, 0, 1, 1,
0.8478456, -0.4228933, 2.626946, 0.8941177, 0, 1, 1,
0.8563704, -0.6077814, 2.351365, 0.9019608, 0, 1, 1,
0.856902, 0.6181219, 1.169814, 0.9098039, 0, 1, 1,
0.8612223, 1.148198, -1.444605, 0.9137255, 0, 1, 1,
0.861946, 1.297003, 1.108671, 0.9215686, 0, 1, 1,
0.8650299, 1.625863, 2.139886, 0.9254902, 0, 1, 1,
0.8727813, 1.790694, 0.8606921, 0.9333333, 0, 1, 1,
0.8834163, 0.2783546, 0.8547996, 0.9372549, 0, 1, 1,
0.8896583, -0.9720497, 1.45408, 0.945098, 0, 1, 1,
0.8977794, 0.02489814, 2.08209, 0.9490196, 0, 1, 1,
0.9001486, 1.525537, -1.853995, 0.9568627, 0, 1, 1,
0.9015645, -0.9342281, 3.417495, 0.9607843, 0, 1, 1,
0.9028183, -0.6006584, 3.376112, 0.9686275, 0, 1, 1,
0.9086264, -0.003287997, 2.29076, 0.972549, 0, 1, 1,
0.9094916, -1.387319, 2.545817, 0.9803922, 0, 1, 1,
0.9118013, -0.3433461, 2.125602, 0.9843137, 0, 1, 1,
0.9128845, 0.07028266, -0.007648384, 0.9921569, 0, 1, 1,
0.9143353, -1.559664, 3.288006, 0.9960784, 0, 1, 1,
0.914519, -0.6593521, 2.726641, 1, 0, 0.9960784, 1,
0.9179947, -1.553297, 1.664114, 1, 0, 0.9882353, 1,
0.9199938, -0.09405708, 2.942598, 1, 0, 0.9843137, 1,
0.9232242, 1.256101, -0.01423057, 1, 0, 0.9764706, 1,
0.9234813, -1.037703, 3.911997, 1, 0, 0.972549, 1,
0.9237475, 1.270603, 1.498348, 1, 0, 0.9647059, 1,
0.9291826, -0.02579735, 4.577344, 1, 0, 0.9607843, 1,
0.9293435, 0.8786215, 0.9860551, 1, 0, 0.9529412, 1,
0.930999, -0.1132612, 2.085461, 1, 0, 0.9490196, 1,
0.9338025, -0.4048128, 1.442297, 1, 0, 0.9411765, 1,
0.9346614, 0.4845125, 0.927056, 1, 0, 0.9372549, 1,
0.9365408, 0.7621545, 1.874564, 1, 0, 0.9294118, 1,
0.9365724, -0.8188691, 2.595549, 1, 0, 0.9254902, 1,
0.9466279, -1.305699, 2.774896, 1, 0, 0.9176471, 1,
0.9476451, 0.8965482, 0.4631264, 1, 0, 0.9137255, 1,
0.9482225, 1.723334, 1.787926, 1, 0, 0.9058824, 1,
0.9564562, -1.347111, 1.236409, 1, 0, 0.9019608, 1,
0.9568125, 0.5719495, 1.079643, 1, 0, 0.8941177, 1,
0.9569108, 1.826627, 0.4137028, 1, 0, 0.8862745, 1,
0.9624416, 1.142639, -0.3437118, 1, 0, 0.8823529, 1,
0.966425, 0.8514179, 0.9437021, 1, 0, 0.8745098, 1,
0.9668995, -0.5789209, 2.402031, 1, 0, 0.8705882, 1,
0.973208, 0.4401053, 0.831019, 1, 0, 0.8627451, 1,
0.9763961, 0.8844922, -0.08919253, 1, 0, 0.8588235, 1,
0.9767655, 0.01942074, 0.8327804, 1, 0, 0.8509804, 1,
0.9794576, 0.8440411, 0.7399558, 1, 0, 0.8470588, 1,
0.9838747, -1.52478, 2.007859, 1, 0, 0.8392157, 1,
0.9839422, 0.9122263, 0.7938668, 1, 0, 0.8352941, 1,
0.9854288, 1.644537, 2.501867, 1, 0, 0.827451, 1,
0.9913707, 1.16908, 0.5220568, 1, 0, 0.8235294, 1,
1.004625, 3.114149, 0.7690855, 1, 0, 0.8156863, 1,
1.00941, -3.175152, 2.188646, 1, 0, 0.8117647, 1,
1.024344, 1.048521, 1.369441, 1, 0, 0.8039216, 1,
1.025286, 1.734168, 0.9883376, 1, 0, 0.7960784, 1,
1.031619, 1.150535, -1.120313, 1, 0, 0.7921569, 1,
1.032208, 0.8891438, 0.8792769, 1, 0, 0.7843137, 1,
1.033633, -0.7744829, 2.637642, 1, 0, 0.7803922, 1,
1.04504, 0.4612921, -0.1018115, 1, 0, 0.772549, 1,
1.048331, 1.0033, 1.403498, 1, 0, 0.7686275, 1,
1.058423, 0.4175496, -0.07921446, 1, 0, 0.7607843, 1,
1.061883, -0.2830954, 2.505939, 1, 0, 0.7568628, 1,
1.06491, -0.9630639, 3.153046, 1, 0, 0.7490196, 1,
1.084815, 0.4803911, 0.8898497, 1, 0, 0.7450981, 1,
1.088382, 0.1400104, 0.9247363, 1, 0, 0.7372549, 1,
1.089257, -1.033026, 2.24521, 1, 0, 0.7333333, 1,
1.097976, 0.1612682, 1.192008, 1, 0, 0.7254902, 1,
1.101581, 1.108979, 0.4526893, 1, 0, 0.7215686, 1,
1.108295, -2.240515, 4.065934, 1, 0, 0.7137255, 1,
1.108325, 0.8854396, 1.906501, 1, 0, 0.7098039, 1,
1.11022, -1.296729, 0.5725542, 1, 0, 0.7019608, 1,
1.12235, -0.578611, 2.77042, 1, 0, 0.6941177, 1,
1.127402, 0.1407625, 2.144934, 1, 0, 0.6901961, 1,
1.128379, -0.01936018, 0.942065, 1, 0, 0.682353, 1,
1.131566, -1.351776, 3.212541, 1, 0, 0.6784314, 1,
1.150474, -1.550414, 0.5310451, 1, 0, 0.6705883, 1,
1.154257, 0.8551664, 0.1697075, 1, 0, 0.6666667, 1,
1.154438, -0.09535145, 2.594557, 1, 0, 0.6588235, 1,
1.154693, -0.06229918, -0.5946308, 1, 0, 0.654902, 1,
1.159572, 1.204393, 1.287381, 1, 0, 0.6470588, 1,
1.162663, 0.2403528, 1.89913, 1, 0, 0.6431373, 1,
1.16475, -0.07906937, 1.421567, 1, 0, 0.6352941, 1,
1.171805, -0.9616266, 1.647275, 1, 0, 0.6313726, 1,
1.176731, 1.575471, -0.03943373, 1, 0, 0.6235294, 1,
1.177028, -0.4331053, 3.262951, 1, 0, 0.6196079, 1,
1.187107, 0.8701691, -0.7025875, 1, 0, 0.6117647, 1,
1.194665, -0.04628269, 1.783271, 1, 0, 0.6078432, 1,
1.19679, -0.8552967, 1.713617, 1, 0, 0.6, 1,
1.202698, 0.99347, 1.580526, 1, 0, 0.5921569, 1,
1.20621, -0.305999, 1.885189, 1, 0, 0.5882353, 1,
1.207102, 0.09669068, 2.063421, 1, 0, 0.5803922, 1,
1.211999, -0.9841396, 1.910007, 1, 0, 0.5764706, 1,
1.21488, 0.4999102, 1.137851, 1, 0, 0.5686275, 1,
1.225819, -0.6207328, 1.247216, 1, 0, 0.5647059, 1,
1.22643, 0.2676606, 1.125294, 1, 0, 0.5568628, 1,
1.228513, 1.348627, 1.278799, 1, 0, 0.5529412, 1,
1.228961, 1.334186, 0.5288144, 1, 0, 0.5450981, 1,
1.24743, 1.260675, 1.190566, 1, 0, 0.5411765, 1,
1.24899, -0.3333043, 2.278739, 1, 0, 0.5333334, 1,
1.250798, 0.2523795, 2.148975, 1, 0, 0.5294118, 1,
1.251375, -0.462661, 2.75613, 1, 0, 0.5215687, 1,
1.252911, -0.9041748, 2.580786, 1, 0, 0.5176471, 1,
1.266901, 0.7511012, -0.4937097, 1, 0, 0.509804, 1,
1.267588, -0.2771035, 1.019573, 1, 0, 0.5058824, 1,
1.272715, -1.261732, 1.262379, 1, 0, 0.4980392, 1,
1.293751, 0.3309356, 1.272483, 1, 0, 0.4901961, 1,
1.306983, -0.7079118, 1.583897, 1, 0, 0.4862745, 1,
1.310011, -0.1639868, 2.867757, 1, 0, 0.4784314, 1,
1.323437, 0.8575402, 0.4493692, 1, 0, 0.4745098, 1,
1.325774, -0.7183958, 0.7964211, 1, 0, 0.4666667, 1,
1.327185, -0.8183062, 2.155748, 1, 0, 0.4627451, 1,
1.334062, -1.04951, 4.491322, 1, 0, 0.454902, 1,
1.33485, 0.5774296, 1.380797, 1, 0, 0.4509804, 1,
1.336791, -0.5668686, 1.49693, 1, 0, 0.4431373, 1,
1.338834, 0.8867389, -0.6797379, 1, 0, 0.4392157, 1,
1.344308, 0.4613103, 0.3509222, 1, 0, 0.4313726, 1,
1.345057, -1.070077, 1.468753, 1, 0, 0.427451, 1,
1.349566, -0.09220522, 2.207815, 1, 0, 0.4196078, 1,
1.351946, -0.6594531, 0.8214015, 1, 0, 0.4156863, 1,
1.364264, 1.113138, -0.2540151, 1, 0, 0.4078431, 1,
1.364567, 0.0797043, 0.05139742, 1, 0, 0.4039216, 1,
1.371707, -1.988623, 2.571253, 1, 0, 0.3960784, 1,
1.371824, 2.140658, 0.6819455, 1, 0, 0.3882353, 1,
1.384929, -1.994212, 2.726727, 1, 0, 0.3843137, 1,
1.401972, -1.473452, 2.83065, 1, 0, 0.3764706, 1,
1.413429, -0.15177, 2.965516, 1, 0, 0.372549, 1,
1.416, 0.7508046, -0.2130656, 1, 0, 0.3647059, 1,
1.420144, 0.815915, 1.29398, 1, 0, 0.3607843, 1,
1.431026, -0.5121088, 1.801557, 1, 0, 0.3529412, 1,
1.433245, -1.423649, 3.94146, 1, 0, 0.3490196, 1,
1.446405, 0.0894836, 0.5484365, 1, 0, 0.3411765, 1,
1.453035, 0.2706557, 2.042898, 1, 0, 0.3372549, 1,
1.461178, 0.9478226, 1.609142, 1, 0, 0.3294118, 1,
1.479129, -0.9109176, 2.148523, 1, 0, 0.3254902, 1,
1.485762, 0.3341505, 1.401218, 1, 0, 0.3176471, 1,
1.499252, -0.2466175, 2.195129, 1, 0, 0.3137255, 1,
1.509213, 1.339975, -0.5926443, 1, 0, 0.3058824, 1,
1.52348, 1.295206, 2.328143, 1, 0, 0.2980392, 1,
1.524068, 1.01243, -0.2202618, 1, 0, 0.2941177, 1,
1.534195, -1.966756, 4.989834, 1, 0, 0.2862745, 1,
1.560535, -1.161781, 2.76026, 1, 0, 0.282353, 1,
1.563195, -0.4353605, 2.282897, 1, 0, 0.2745098, 1,
1.581965, -0.5200934, 1.604533, 1, 0, 0.2705882, 1,
1.585549, 0.7739417, 1.035756, 1, 0, 0.2627451, 1,
1.58825, -0.2167065, 0.9480671, 1, 0, 0.2588235, 1,
1.5912, 0.4679694, 1.020253, 1, 0, 0.2509804, 1,
1.602251, 0.09909002, 2.123939, 1, 0, 0.2470588, 1,
1.609192, 0.8609005, 0.531013, 1, 0, 0.2392157, 1,
1.611549, 0.5732924, 0.6820894, 1, 0, 0.2352941, 1,
1.623141, 2.145346, 0.7186298, 1, 0, 0.227451, 1,
1.637562, -0.3361737, 1.645085, 1, 0, 0.2235294, 1,
1.638165, 1.071527, 0.02989116, 1, 0, 0.2156863, 1,
1.650915, -0.1143188, 2.172439, 1, 0, 0.2117647, 1,
1.662808, 0.2734692, 1.894777, 1, 0, 0.2039216, 1,
1.66715, -0.9147636, 2.064114, 1, 0, 0.1960784, 1,
1.668224, -0.5928516, 1.427845, 1, 0, 0.1921569, 1,
1.679943, -0.9758298, 1.172204, 1, 0, 0.1843137, 1,
1.686867, 0.2966905, 0.6305512, 1, 0, 0.1803922, 1,
1.694199, 1.850449, -0.7270605, 1, 0, 0.172549, 1,
1.721102, -1.046288, 1.533906, 1, 0, 0.1686275, 1,
1.731444, -0.3709344, 2.480124, 1, 0, 0.1607843, 1,
1.779068, 2.006074, 0.2971402, 1, 0, 0.1568628, 1,
1.805629, -1.264673, 1.787912, 1, 0, 0.1490196, 1,
1.853676, -1.536066, 2.078485, 1, 0, 0.145098, 1,
1.864638, -0.3252414, 3.394768, 1, 0, 0.1372549, 1,
1.866846, -0.9196334, 2.089256, 1, 0, 0.1333333, 1,
1.88485, 0.4422504, 1.962524, 1, 0, 0.1254902, 1,
1.892957, -1.449179, 1.322103, 1, 0, 0.1215686, 1,
1.899761, 0.2071534, 1.769456, 1, 0, 0.1137255, 1,
1.935269, -0.09781577, 1.220754, 1, 0, 0.1098039, 1,
1.961759, -0.1427649, 1.329892, 1, 0, 0.1019608, 1,
1.995014, 0.1501327, 2.217764, 1, 0, 0.09411765, 1,
2.052105, -1.568085, 1.873778, 1, 0, 0.09019608, 1,
2.10625, 0.2998198, 2.559751, 1, 0, 0.08235294, 1,
2.112086, -0.5415208, 2.329717, 1, 0, 0.07843138, 1,
2.112358, 2.004162, 0.9804682, 1, 0, 0.07058824, 1,
2.11826, -0.6446905, 1.900453, 1, 0, 0.06666667, 1,
2.17732, 0.05550012, 0.2691408, 1, 0, 0.05882353, 1,
2.198378, -2.41697, 2.442751, 1, 0, 0.05490196, 1,
2.289224, -1.915702, 1.75853, 1, 0, 0.04705882, 1,
2.354774, 0.02782971, 1.170049, 1, 0, 0.04313726, 1,
2.430815, 0.7420509, 0.6358733, 1, 0, 0.03529412, 1,
2.473175, -0.1009976, 0.3889242, 1, 0, 0.03137255, 1,
2.474005, 0.2136318, 0.3669949, 1, 0, 0.02352941, 1,
2.488404, -1.321757, 1.590488, 1, 0, 0.01960784, 1,
2.518162, -1.982935, 2.014311, 1, 0, 0.01176471, 1,
2.6717, -0.7367385, 1.953942, 1, 0, 0.007843138, 1
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
-0.3168643, -4.373188, -6.605671, 0, -0.5, 0.5, 0.5,
-0.3168643, -4.373188, -6.605671, 1, -0.5, 0.5, 0.5,
-0.3168643, -4.373188, -6.605671, 1, 1.5, 0.5, 0.5,
-0.3168643, -4.373188, -6.605671, 0, 1.5, 0.5, 0.5
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
-4.318552, 0.3588805, -6.605671, 0, -0.5, 0.5, 0.5,
-4.318552, 0.3588805, -6.605671, 1, -0.5, 0.5, 0.5,
-4.318552, 0.3588805, -6.605671, 1, 1.5, 0.5, 0.5,
-4.318552, 0.3588805, -6.605671, 0, 1.5, 0.5, 0.5
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
-4.318552, -4.373188, 0.03237152, 0, -0.5, 0.5, 0.5,
-4.318552, -4.373188, 0.03237152, 1, -0.5, 0.5, 0.5,
-4.318552, -4.373188, 0.03237152, 1, 1.5, 0.5, 0.5,
-4.318552, -4.373188, 0.03237152, 0, 1.5, 0.5, 0.5
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
-3, -3.281173, -5.073815,
2, -3.281173, -5.073815,
-3, -3.281173, -5.073815,
-3, -3.463175, -5.329124,
-2, -3.281173, -5.073815,
-2, -3.463175, -5.329124,
-1, -3.281173, -5.073815,
-1, -3.463175, -5.329124,
0, -3.281173, -5.073815,
0, -3.463175, -5.329124,
1, -3.281173, -5.073815,
1, -3.463175, -5.329124,
2, -3.281173, -5.073815,
2, -3.463175, -5.329124
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
-3, -3.827181, -5.839743, 0, -0.5, 0.5, 0.5,
-3, -3.827181, -5.839743, 1, -0.5, 0.5, 0.5,
-3, -3.827181, -5.839743, 1, 1.5, 0.5, 0.5,
-3, -3.827181, -5.839743, 0, 1.5, 0.5, 0.5,
-2, -3.827181, -5.839743, 0, -0.5, 0.5, 0.5,
-2, -3.827181, -5.839743, 1, -0.5, 0.5, 0.5,
-2, -3.827181, -5.839743, 1, 1.5, 0.5, 0.5,
-2, -3.827181, -5.839743, 0, 1.5, 0.5, 0.5,
-1, -3.827181, -5.839743, 0, -0.5, 0.5, 0.5,
-1, -3.827181, -5.839743, 1, -0.5, 0.5, 0.5,
-1, -3.827181, -5.839743, 1, 1.5, 0.5, 0.5,
-1, -3.827181, -5.839743, 0, 1.5, 0.5, 0.5,
0, -3.827181, -5.839743, 0, -0.5, 0.5, 0.5,
0, -3.827181, -5.839743, 1, -0.5, 0.5, 0.5,
0, -3.827181, -5.839743, 1, 1.5, 0.5, 0.5,
0, -3.827181, -5.839743, 0, 1.5, 0.5, 0.5,
1, -3.827181, -5.839743, 0, -0.5, 0.5, 0.5,
1, -3.827181, -5.839743, 1, -0.5, 0.5, 0.5,
1, -3.827181, -5.839743, 1, 1.5, 0.5, 0.5,
1, -3.827181, -5.839743, 0, 1.5, 0.5, 0.5,
2, -3.827181, -5.839743, 0, -0.5, 0.5, 0.5,
2, -3.827181, -5.839743, 1, -0.5, 0.5, 0.5,
2, -3.827181, -5.839743, 1, 1.5, 0.5, 0.5,
2, -3.827181, -5.839743, 0, 1.5, 0.5, 0.5
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
-3.395086, -2, -5.073815,
-3.395086, 2, -5.073815,
-3.395086, -2, -5.073815,
-3.548997, -2, -5.329124,
-3.395086, 0, -5.073815,
-3.548997, 0, -5.329124,
-3.395086, 2, -5.073815,
-3.548997, 2, -5.329124
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
"0",
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
-3.856819, -2, -5.839743, 0, -0.5, 0.5, 0.5,
-3.856819, -2, -5.839743, 1, -0.5, 0.5, 0.5,
-3.856819, -2, -5.839743, 1, 1.5, 0.5, 0.5,
-3.856819, -2, -5.839743, 0, 1.5, 0.5, 0.5,
-3.856819, 0, -5.839743, 0, -0.5, 0.5, 0.5,
-3.856819, 0, -5.839743, 1, -0.5, 0.5, 0.5,
-3.856819, 0, -5.839743, 1, 1.5, 0.5, 0.5,
-3.856819, 0, -5.839743, 0, 1.5, 0.5, 0.5,
-3.856819, 2, -5.839743, 0, -0.5, 0.5, 0.5,
-3.856819, 2, -5.839743, 1, -0.5, 0.5, 0.5,
-3.856819, 2, -5.839743, 1, 1.5, 0.5, 0.5,
-3.856819, 2, -5.839743, 0, 1.5, 0.5, 0.5
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
-3.395086, -3.281173, -4,
-3.395086, -3.281173, 4,
-3.395086, -3.281173, -4,
-3.548997, -3.463175, -4,
-3.395086, -3.281173, -2,
-3.548997, -3.463175, -2,
-3.395086, -3.281173, 0,
-3.548997, -3.463175, 0,
-3.395086, -3.281173, 2,
-3.548997, -3.463175, 2,
-3.395086, -3.281173, 4,
-3.548997, -3.463175, 4
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
-3.856819, -3.827181, -4, 0, -0.5, 0.5, 0.5,
-3.856819, -3.827181, -4, 1, -0.5, 0.5, 0.5,
-3.856819, -3.827181, -4, 1, 1.5, 0.5, 0.5,
-3.856819, -3.827181, -4, 0, 1.5, 0.5, 0.5,
-3.856819, -3.827181, -2, 0, -0.5, 0.5, 0.5,
-3.856819, -3.827181, -2, 1, -0.5, 0.5, 0.5,
-3.856819, -3.827181, -2, 1, 1.5, 0.5, 0.5,
-3.856819, -3.827181, -2, 0, 1.5, 0.5, 0.5,
-3.856819, -3.827181, 0, 0, -0.5, 0.5, 0.5,
-3.856819, -3.827181, 0, 1, -0.5, 0.5, 0.5,
-3.856819, -3.827181, 0, 1, 1.5, 0.5, 0.5,
-3.856819, -3.827181, 0, 0, 1.5, 0.5, 0.5,
-3.856819, -3.827181, 2, 0, -0.5, 0.5, 0.5,
-3.856819, -3.827181, 2, 1, -0.5, 0.5, 0.5,
-3.856819, -3.827181, 2, 1, 1.5, 0.5, 0.5,
-3.856819, -3.827181, 2, 0, 1.5, 0.5, 0.5,
-3.856819, -3.827181, 4, 0, -0.5, 0.5, 0.5,
-3.856819, -3.827181, 4, 1, -0.5, 0.5, 0.5,
-3.856819, -3.827181, 4, 1, 1.5, 0.5, 0.5,
-3.856819, -3.827181, 4, 0, 1.5, 0.5, 0.5
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
-3.395086, -3.281173, -5.073815,
-3.395086, 3.998934, -5.073815,
-3.395086, -3.281173, 5.138558,
-3.395086, 3.998934, 5.138558,
-3.395086, -3.281173, -5.073815,
-3.395086, -3.281173, 5.138558,
-3.395086, 3.998934, -5.073815,
-3.395086, 3.998934, 5.138558,
-3.395086, -3.281173, -5.073815,
2.761357, -3.281173, -5.073815,
-3.395086, -3.281173, 5.138558,
2.761357, -3.281173, 5.138558,
-3.395086, 3.998934, -5.073815,
2.761357, 3.998934, -5.073815,
-3.395086, 3.998934, 5.138558,
2.761357, 3.998934, 5.138558,
2.761357, -3.281173, -5.073815,
2.761357, 3.998934, -5.073815,
2.761357, -3.281173, 5.138558,
2.761357, 3.998934, 5.138558,
2.761357, -3.281173, -5.073815,
2.761357, -3.281173, 5.138558,
2.761357, 3.998934, -5.073815,
2.761357, 3.998934, 5.138558
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
var radius = 7.460347;
var distance = 33.19193;
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
mvMatrix.translate( 0.3168643, -0.3588805, -0.03237152 );
mvMatrix.scale( 1.310217, 1.107988, 0.789853 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.19193);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
imidacloprid<-read.table("imidacloprid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imidacloprid$V2
```

```
## Error in eval(expr, envir, enclos): object 'imidacloprid' not found
```

```r
y<-imidacloprid$V3
```

```
## Error in eval(expr, envir, enclos): object 'imidacloprid' not found
```

```r
z<-imidacloprid$V4
```

```
## Error in eval(expr, envir, enclos): object 'imidacloprid' not found
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
-3.305429, 0.2401177, -2.427389, 0, 0, 1, 1, 1,
-3.208567, 0.9852685, -0.3504574, 1, 0, 0, 1, 1,
-3.10546, -0.800841, -2.525126, 1, 0, 0, 1, 1,
-2.733583, 0.5620211, -3.749248, 1, 0, 0, 1, 1,
-2.703166, 0.2346813, -1.07711, 1, 0, 0, 1, 1,
-2.57377, -0.3098307, -0.6904256, 1, 0, 0, 1, 1,
-2.515947, 2.030615, -0.84179, 0, 0, 0, 1, 1,
-2.45928, -1.795566, -1.029139, 0, 0, 0, 1, 1,
-2.405372, -0.3497234, -3.268145, 0, 0, 0, 1, 1,
-2.377999, 0.155913, -4.399638, 0, 0, 0, 1, 1,
-2.344015, -0.4333354, -2.955929, 0, 0, 0, 1, 1,
-2.333889, 0.9198885, -0.7128834, 0, 0, 0, 1, 1,
-2.301698, -1.135374, -1.000669, 0, 0, 0, 1, 1,
-2.253249, -0.5473956, -0.1283496, 1, 1, 1, 1, 1,
-2.238492, -0.4496176, -2.583595, 1, 1, 1, 1, 1,
-2.139225, -1.291281, -2.063524, 1, 1, 1, 1, 1,
-2.131198, 1.114889, 1.479563, 1, 1, 1, 1, 1,
-2.109861, -0.2669044, -1.984396, 1, 1, 1, 1, 1,
-2.056924, 1.80157, -0.8666081, 1, 1, 1, 1, 1,
-1.997386, -0.8423676, -3.872997, 1, 1, 1, 1, 1,
-1.994531, -0.6892241, -3.007808, 1, 1, 1, 1, 1,
-1.983908, 0.9366703, -0.8361321, 1, 1, 1, 1, 1,
-1.979284, 0.6047327, -0.4523609, 1, 1, 1, 1, 1,
-1.973019, -1.752945, -1.213485, 1, 1, 1, 1, 1,
-1.907671, 1.144716, -1.135336, 1, 1, 1, 1, 1,
-1.890777, 0.5088095, 0.130941, 1, 1, 1, 1, 1,
-1.885247, 2.6842, -1.104099, 1, 1, 1, 1, 1,
-1.867798, -0.7714068, 0.07439603, 1, 1, 1, 1, 1,
-1.866269, -0.06436646, 0.02824934, 0, 0, 1, 1, 1,
-1.833346, -0.8417523, -1.631613, 1, 0, 0, 1, 1,
-1.825933, -1.060417, -3.968821, 1, 0, 0, 1, 1,
-1.82198, 0.2249073, -2.28285, 1, 0, 0, 1, 1,
-1.813222, 0.4164072, 0.8555441, 1, 0, 0, 1, 1,
-1.767466, -0.4984925, -0.5454007, 1, 0, 0, 1, 1,
-1.750869, -0.9141477, -1.891164, 0, 0, 0, 1, 1,
-1.705009, -0.7777352, 0.1575503, 0, 0, 0, 1, 1,
-1.693116, -0.1978121, -2.305925, 0, 0, 0, 1, 1,
-1.680215, -2.694527, -2.814109, 0, 0, 0, 1, 1,
-1.668024, -1.965325, -2.327764, 0, 0, 0, 1, 1,
-1.667956, -0.380842, -3.302789, 0, 0, 0, 1, 1,
-1.667167, 0.6025482, -0.6712544, 0, 0, 0, 1, 1,
-1.641714, -1.949149, 0.1965375, 1, 1, 1, 1, 1,
-1.632755, -0.538868, -2.254459, 1, 1, 1, 1, 1,
-1.630954, -1.085163, -1.405999, 1, 1, 1, 1, 1,
-1.629455, -1.462973, -3.005148, 1, 1, 1, 1, 1,
-1.628615, 0.2503007, -1.56486, 1, 1, 1, 1, 1,
-1.608537, -1.525642, -3.159516, 1, 1, 1, 1, 1,
-1.599458, -0.4438593, -3.094045, 1, 1, 1, 1, 1,
-1.590244, 1.381072, -2.274472, 1, 1, 1, 1, 1,
-1.576688, -1.578803, -2.155628, 1, 1, 1, 1, 1,
-1.572691, 0.9743376, -2.793564, 1, 1, 1, 1, 1,
-1.565153, 0.1218275, -1.431075, 1, 1, 1, 1, 1,
-1.564629, -0.759085, -0.3554019, 1, 1, 1, 1, 1,
-1.563092, 0.7357629, -1.482212, 1, 1, 1, 1, 1,
-1.561262, 1.132007, -0.7879267, 1, 1, 1, 1, 1,
-1.559083, -0.6314072, -2.327497, 1, 1, 1, 1, 1,
-1.552158, -0.06605721, -1.286142, 0, 0, 1, 1, 1,
-1.550967, -1.049156, -0.7353644, 1, 0, 0, 1, 1,
-1.544249, 1.274405, -1.247571, 1, 0, 0, 1, 1,
-1.543576, 2.236288, 1.208978, 1, 0, 0, 1, 1,
-1.537694, -0.04551561, -1.79127, 1, 0, 0, 1, 1,
-1.531588, -1.167996, -1.66158, 1, 0, 0, 1, 1,
-1.52275, 0.08367706, -2.496196, 0, 0, 0, 1, 1,
-1.519078, 0.6902102, -2.901401, 0, 0, 0, 1, 1,
-1.518911, -0.02818058, -2.668981, 0, 0, 0, 1, 1,
-1.512887, 1.128782, 0.2248301, 0, 0, 0, 1, 1,
-1.511835, -0.403277, -1.581142, 0, 0, 0, 1, 1,
-1.495598, 0.9511524, -2.832637, 0, 0, 0, 1, 1,
-1.492007, -0.2525481, -0.7888738, 0, 0, 0, 1, 1,
-1.491619, 1.387092, -0.02575126, 1, 1, 1, 1, 1,
-1.484003, 0.22937, -1.400887, 1, 1, 1, 1, 1,
-1.480731, 1.54008, -0.6044897, 1, 1, 1, 1, 1,
-1.47861, 0.4021946, -2.444785, 1, 1, 1, 1, 1,
-1.463678, 1.472982, 1.964369, 1, 1, 1, 1, 1,
-1.458694, 2.904278, -0.6680359, 1, 1, 1, 1, 1,
-1.458213, 1.721418, -0.5493062, 1, 1, 1, 1, 1,
-1.452246, 0.3867111, -0.5034075, 1, 1, 1, 1, 1,
-1.445918, -0.402932, -2.805697, 1, 1, 1, 1, 1,
-1.436027, 0.468762, -1.238159, 1, 1, 1, 1, 1,
-1.419284, -0.5065433, -2.425997, 1, 1, 1, 1, 1,
-1.406832, 0.5407207, -2.430734, 1, 1, 1, 1, 1,
-1.399305, -0.6868505, -0.9585667, 1, 1, 1, 1, 1,
-1.389488, -2.218853, -2.271564, 1, 1, 1, 1, 1,
-1.383701, -1.125211, -2.09439, 1, 1, 1, 1, 1,
-1.382419, 0.2841432, -1.860834, 0, 0, 1, 1, 1,
-1.34943, 1.857893, -0.9942105, 1, 0, 0, 1, 1,
-1.34756, 0.8119009, 0.9085535, 1, 0, 0, 1, 1,
-1.343741, -0.1440851, -0.5511192, 1, 0, 0, 1, 1,
-1.343573, -0.6502901, -1.762921, 1, 0, 0, 1, 1,
-1.334889, -0.2006567, -2.756468, 1, 0, 0, 1, 1,
-1.334558, -0.2514707, -0.05779581, 0, 0, 0, 1, 1,
-1.331815, -0.2440684, -1.512665, 0, 0, 0, 1, 1,
-1.310102, -2.13676, -2.66487, 0, 0, 0, 1, 1,
-1.306248, -1.775774, -2.624767, 0, 0, 0, 1, 1,
-1.305326, 0.8388141, -1.491024, 0, 0, 0, 1, 1,
-1.29305, 2.181822, 0.05524128, 0, 0, 0, 1, 1,
-1.289992, -0.6525897, -1.642418, 0, 0, 0, 1, 1,
-1.284476, -0.3311785, -2.861584, 1, 1, 1, 1, 1,
-1.283249, 1.22809, -2.588305, 1, 1, 1, 1, 1,
-1.283237, -1.552045, -3.228813, 1, 1, 1, 1, 1,
-1.279388, 0.3556449, -1.965809, 1, 1, 1, 1, 1,
-1.278314, -1.687039, -3.323716, 1, 1, 1, 1, 1,
-1.275612, -0.01232892, -1.514144, 1, 1, 1, 1, 1,
-1.273673, 0.0002397329, -1.861491, 1, 1, 1, 1, 1,
-1.260924, -1.426824, -2.630288, 1, 1, 1, 1, 1,
-1.260202, -0.3981307, -3.067839, 1, 1, 1, 1, 1,
-1.252903, 1.053525, -0.6778342, 1, 1, 1, 1, 1,
-1.246518, 1.364728, -1.014363, 1, 1, 1, 1, 1,
-1.233689, -0.3022277, -1.780553, 1, 1, 1, 1, 1,
-1.224945, 0.2439336, -0.8112916, 1, 1, 1, 1, 1,
-1.223889, 1.118505, -0.7894915, 1, 1, 1, 1, 1,
-1.222975, 0.1226643, 0.120047, 1, 1, 1, 1, 1,
-1.203051, 1.761836, 0.7135025, 0, 0, 1, 1, 1,
-1.192828, 0.5079846, -0.8084793, 1, 0, 0, 1, 1,
-1.192218, -1.549157, -1.713336, 1, 0, 0, 1, 1,
-1.189709, -1.914761, -2.203941, 1, 0, 0, 1, 1,
-1.187226, -2.338295, -0.1005864, 1, 0, 0, 1, 1,
-1.174979, -1.364071, -2.356234, 1, 0, 0, 1, 1,
-1.174748, -0.800273, -1.846906, 0, 0, 0, 1, 1,
-1.172897, -1.645695, -3.196358, 0, 0, 0, 1, 1,
-1.172796, 0.9276188, -0.1076002, 0, 0, 0, 1, 1,
-1.169493, -0.5705967, 0.1610488, 0, 0, 0, 1, 1,
-1.165635, 1.533295, -1.602088, 0, 0, 0, 1, 1,
-1.164501, -1.121723, -3.4029, 0, 0, 0, 1, 1,
-1.161388, 2.119352, -1.941817, 0, 0, 0, 1, 1,
-1.157871, 0.8956303, -1.715127, 1, 1, 1, 1, 1,
-1.155505, 0.1960014, -2.418092, 1, 1, 1, 1, 1,
-1.153517, -0.7768089, -1.536485, 1, 1, 1, 1, 1,
-1.151365, 1.621232, -1.2004, 1, 1, 1, 1, 1,
-1.144693, -0.5713696, -1.328504, 1, 1, 1, 1, 1,
-1.142873, 1.089073, -1.820447, 1, 1, 1, 1, 1,
-1.137889, -0.5625347, -1.500007, 1, 1, 1, 1, 1,
-1.136693, 1.151708, 0.3887032, 1, 1, 1, 1, 1,
-1.132937, 0.1608514, -1.216165, 1, 1, 1, 1, 1,
-1.128605, 0.008174118, -1.222475, 1, 1, 1, 1, 1,
-1.127512, -1.72083, -2.828229, 1, 1, 1, 1, 1,
-1.127256, 0.3298053, -2.691716, 1, 1, 1, 1, 1,
-1.124447, -0.6798823, -1.642258, 1, 1, 1, 1, 1,
-1.115921, 0.6489666, 1.080233, 1, 1, 1, 1, 1,
-1.088437, 0.06603009, -1.613052, 1, 1, 1, 1, 1,
-1.085338, 0.2829281, -0.4937916, 0, 0, 1, 1, 1,
-1.075228, 0.2654062, -2.204595, 1, 0, 0, 1, 1,
-1.074732, 0.6701711, 1.188802, 1, 0, 0, 1, 1,
-1.071989, 1.443943, -0.6821879, 1, 0, 0, 1, 1,
-1.070162, -0.4285632, -0.07682052, 1, 0, 0, 1, 1,
-1.067589, -1.600465, -4.298426, 1, 0, 0, 1, 1,
-1.067174, -1.925684, -2.878637, 0, 0, 0, 1, 1,
-1.066144, -0.7723604, -2.961921, 0, 0, 0, 1, 1,
-1.046839, -0.07295556, -1.862712, 0, 0, 0, 1, 1,
-1.037956, -0.986801, -3.548936, 0, 0, 0, 1, 1,
-1.035253, 0.5240881, -0.5773693, 0, 0, 0, 1, 1,
-1.030783, 0.415527, 1.240742, 0, 0, 0, 1, 1,
-1.028578, 0.4260918, -2.375032, 0, 0, 0, 1, 1,
-1.028108, -0.7822325, -2.556863, 1, 1, 1, 1, 1,
-1.027391, -1.187282, -1.35032, 1, 1, 1, 1, 1,
-1.025489, 0.2021109, -0.5536854, 1, 1, 1, 1, 1,
-1.021291, -1.055492, -0.7895648, 1, 1, 1, 1, 1,
-1.014965, -2.144226, -4.070633, 1, 1, 1, 1, 1,
-1.012649, -1.328361, -2.044634, 1, 1, 1, 1, 1,
-1.012165, -0.6215394, -1.15248, 1, 1, 1, 1, 1,
-1.007222, 0.8833894, -1.330465, 1, 1, 1, 1, 1,
-1.006916, -2.251488, -2.729242, 1, 1, 1, 1, 1,
-1.004224, -0.8729273, -0.2427521, 1, 1, 1, 1, 1,
-0.9994298, 0.2431466, -0.08454162, 1, 1, 1, 1, 1,
-0.9837182, -0.3611414, -2.31675, 1, 1, 1, 1, 1,
-0.981014, 0.6330568, -1.486924, 1, 1, 1, 1, 1,
-0.9793161, 1.925913, -0.7052302, 1, 1, 1, 1, 1,
-0.9782121, -0.1304146, -1.036496, 1, 1, 1, 1, 1,
-0.9769777, 1.181311, -0.307667, 0, 0, 1, 1, 1,
-0.9763761, 1.389937, -1.547419, 1, 0, 0, 1, 1,
-0.9702369, 0.5356057, -0.6506428, 1, 0, 0, 1, 1,
-0.9670672, -0.5592826, -2.033901, 1, 0, 0, 1, 1,
-0.9623634, 0.3891278, -2.238367, 1, 0, 0, 1, 1,
-0.9592267, -1.457995, -3.377311, 1, 0, 0, 1, 1,
-0.9528736, -1.843554, -3.578008, 0, 0, 0, 1, 1,
-0.9400735, 0.1962411, -0.3752028, 0, 0, 0, 1, 1,
-0.9360178, -0.956094, -1.636977, 0, 0, 0, 1, 1,
-0.9330581, 1.028898, -0.5833653, 0, 0, 0, 1, 1,
-0.9272816, -1.273055, -2.412102, 0, 0, 0, 1, 1,
-0.9263325, 0.2541254, -0.41723, 0, 0, 0, 1, 1,
-0.9258805, -0.491201, -1.932348, 0, 0, 0, 1, 1,
-0.9197337, 0.7515011, -0.6704941, 1, 1, 1, 1, 1,
-0.9175016, -0.4367033, -1.518313, 1, 1, 1, 1, 1,
-0.9172605, -0.7938088, -0.2998871, 1, 1, 1, 1, 1,
-0.9099516, -0.907961, -1.864653, 1, 1, 1, 1, 1,
-0.9038005, 0.6772447, -0.9448141, 1, 1, 1, 1, 1,
-0.900681, 0.05043827, -2.291541, 1, 1, 1, 1, 1,
-0.8977406, -1.572293, -2.396482, 1, 1, 1, 1, 1,
-0.8857407, 0.6942776, -4.141741, 1, 1, 1, 1, 1,
-0.8790983, 0.2401696, -1.400473, 1, 1, 1, 1, 1,
-0.8763671, 1.514989, -0.5585352, 1, 1, 1, 1, 1,
-0.8760182, 0.3757815, -1.693126, 1, 1, 1, 1, 1,
-0.874139, -0.6409416, -3.512971, 1, 1, 1, 1, 1,
-0.8715267, 0.4955125, -2.340291, 1, 1, 1, 1, 1,
-0.8697342, 0.9307143, -1.828263, 1, 1, 1, 1, 1,
-0.8680282, -1.357579, -3.242139, 1, 1, 1, 1, 1,
-0.8553017, 0.5169516, -1.349929, 0, 0, 1, 1, 1,
-0.8536094, -0.1887146, -1.718542, 1, 0, 0, 1, 1,
-0.8523954, -0.6986821, -0.5026484, 1, 0, 0, 1, 1,
-0.848004, -0.1734035, -0.1222491, 1, 0, 0, 1, 1,
-0.8436593, 0.8546212, 0.3749495, 1, 0, 0, 1, 1,
-0.8417986, 1.455128, -1.059867, 1, 0, 0, 1, 1,
-0.8412693, -0.7095194, -2.581622, 0, 0, 0, 1, 1,
-0.8393081, 0.7197353, -1.656847, 0, 0, 0, 1, 1,
-0.8376183, 1.245473, -0.02074246, 0, 0, 0, 1, 1,
-0.8374697, -1.212958, -4.125205, 0, 0, 0, 1, 1,
-0.8373479, -0.4965076, -2.161519, 0, 0, 0, 1, 1,
-0.8345158, 0.7668382, -0.8783647, 0, 0, 0, 1, 1,
-0.8302889, -1.599964, -0.7684225, 0, 0, 0, 1, 1,
-0.8248443, 1.057486, -1.121337, 1, 1, 1, 1, 1,
-0.8240171, 0.2313257, -1.090558, 1, 1, 1, 1, 1,
-0.8229532, 2.738702, 1.770928, 1, 1, 1, 1, 1,
-0.8229449, -1.694565, -2.355106, 1, 1, 1, 1, 1,
-0.817726, 0.06086824, -1.102497, 1, 1, 1, 1, 1,
-0.8175674, -0.3188598, -0.216285, 1, 1, 1, 1, 1,
-0.8141385, -2.712149, -3.497845, 1, 1, 1, 1, 1,
-0.8123275, 2.196003, -0.94015, 1, 1, 1, 1, 1,
-0.8103427, 0.6576033, -3.52704, 1, 1, 1, 1, 1,
-0.8066067, -0.5192129, -2.465115, 1, 1, 1, 1, 1,
-0.8063877, 2.608074, -1.309035, 1, 1, 1, 1, 1,
-0.8053646, 0.6110271, -0.3444541, 1, 1, 1, 1, 1,
-0.804464, 0.8070589, -1.549729, 1, 1, 1, 1, 1,
-0.8006628, 0.5713114, -2.330315, 1, 1, 1, 1, 1,
-0.795456, -0.5979877, -3.693371, 1, 1, 1, 1, 1,
-0.7939184, -1.353239, -2.570895, 0, 0, 1, 1, 1,
-0.7868025, 0.3126672, -1.131175, 1, 0, 0, 1, 1,
-0.7830624, -0.5718299, -1.107116, 1, 0, 0, 1, 1,
-0.7802924, 0.9490293, -0.2940252, 1, 0, 0, 1, 1,
-0.7799276, -0.4904842, -1.416236, 1, 0, 0, 1, 1,
-0.7724048, -0.01252025, -0.1922252, 1, 0, 0, 1, 1,
-0.770465, -0.8614249, -2.724959, 0, 0, 0, 1, 1,
-0.7688972, 0.7460706, -1.932084, 0, 0, 0, 1, 1,
-0.7683057, 1.015074, 0.275727, 0, 0, 0, 1, 1,
-0.7623943, -0.8149951, -2.637507, 0, 0, 0, 1, 1,
-0.755692, -2.433707, -2.865339, 0, 0, 0, 1, 1,
-0.7537907, 0.4419183, -1.615713, 0, 0, 0, 1, 1,
-0.7483656, -0.05189031, -3.407551, 0, 0, 0, 1, 1,
-0.7450062, 0.0163894, -0.5676355, 1, 1, 1, 1, 1,
-0.7447848, -0.3595871, -2.04097, 1, 1, 1, 1, 1,
-0.7432733, -1.30035, -2.836075, 1, 1, 1, 1, 1,
-0.735271, -1.619274, -3.530087, 1, 1, 1, 1, 1,
-0.7352686, -0.1908341, -2.110311, 1, 1, 1, 1, 1,
-0.7238911, -0.7754782, -1.193456, 1, 1, 1, 1, 1,
-0.7189644, -0.3090168, -2.928323, 1, 1, 1, 1, 1,
-0.7023274, 0.5267879, -0.1690951, 1, 1, 1, 1, 1,
-0.6962841, -0.4064893, -3.039656, 1, 1, 1, 1, 1,
-0.6939998, 1.237632, -0.6422431, 1, 1, 1, 1, 1,
-0.6936824, -1.984322, -2.9433, 1, 1, 1, 1, 1,
-0.6834581, 0.1652261, -0.377441, 1, 1, 1, 1, 1,
-0.6815154, 0.6330753, 0.2235084, 1, 1, 1, 1, 1,
-0.6706032, -0.0006927984, -0.7306407, 1, 1, 1, 1, 1,
-0.6701295, 1.227948, -0.1647325, 1, 1, 1, 1, 1,
-0.6700602, -0.3038689, -1.215408, 0, 0, 1, 1, 1,
-0.6565717, -1.254967, -2.298584, 1, 0, 0, 1, 1,
-0.655063, -0.8680921, -3.67419, 1, 0, 0, 1, 1,
-0.6514333, 0.2100265, -1.233665, 1, 0, 0, 1, 1,
-0.650521, 0.752929, -0.9534909, 1, 0, 0, 1, 1,
-0.6470259, 2.339084, -0.2216969, 1, 0, 0, 1, 1,
-0.6322508, 1.583616, -1.565014, 0, 0, 0, 1, 1,
-0.6295527, -0.409272, -2.711432, 0, 0, 0, 1, 1,
-0.6290779, -1.698447, -1.435493, 0, 0, 0, 1, 1,
-0.6261928, -0.6414437, -2.96033, 0, 0, 0, 1, 1,
-0.6256719, 0.5813814, 0.4271984, 0, 0, 0, 1, 1,
-0.6202552, 0.6913347, -2.669093, 0, 0, 0, 1, 1,
-0.6193525, 0.7408634, -1.281953, 0, 0, 0, 1, 1,
-0.6138139, 0.1530374, -2.505267, 1, 1, 1, 1, 1,
-0.6099048, -1.067299, -4.21981, 1, 1, 1, 1, 1,
-0.6084231, -0.4010932, -1.320839, 1, 1, 1, 1, 1,
-0.6075556, -0.005157851, -2.265294, 1, 1, 1, 1, 1,
-0.602087, 0.5708468, -0.9311113, 1, 1, 1, 1, 1,
-0.6016953, -1.604006, -3.456956, 1, 1, 1, 1, 1,
-0.5978519, 1.201196, -0.6086665, 1, 1, 1, 1, 1,
-0.5957832, 0.4554252, -0.5138363, 1, 1, 1, 1, 1,
-0.595743, -0.5184294, -1.896193, 1, 1, 1, 1, 1,
-0.5941048, 0.5485246, -1.998469, 1, 1, 1, 1, 1,
-0.590773, -1.602388, -2.798666, 1, 1, 1, 1, 1,
-0.5899985, -0.0667308, -3.15386, 1, 1, 1, 1, 1,
-0.5899191, -0.5432151, -2.427171, 1, 1, 1, 1, 1,
-0.5871543, 1.803183, 0.04325636, 1, 1, 1, 1, 1,
-0.580036, 1.73575, -0.6400799, 1, 1, 1, 1, 1,
-0.5797474, -0.5094171, -2.867242, 0, 0, 1, 1, 1,
-0.5781237, -0.8336948, -3.394438, 1, 0, 0, 1, 1,
-0.5776381, -0.5634258, -2.814419, 1, 0, 0, 1, 1,
-0.5757462, 0.2446749, -1.764315, 1, 0, 0, 1, 1,
-0.5732923, -0.6770774, -2.203138, 1, 0, 0, 1, 1,
-0.5716264, 0.2735838, -1.513398, 1, 0, 0, 1, 1,
-0.5636877, 0.1306898, -1.359655, 0, 0, 0, 1, 1,
-0.5583367, -0.04143156, -2.488996, 0, 0, 0, 1, 1,
-0.5531391, 1.61757, -1.093785, 0, 0, 0, 1, 1,
-0.547032, -0.6891778, -1.697156, 0, 0, 0, 1, 1,
-0.5441037, -0.8550677, -1.359699, 0, 0, 0, 1, 1,
-0.5431513, -0.05924845, -1.984133, 0, 0, 0, 1, 1,
-0.5288088, 0.3881549, -0.6373923, 0, 0, 0, 1, 1,
-0.5269554, -1.430453, -2.479616, 1, 1, 1, 1, 1,
-0.526153, 0.7197912, -0.6249366, 1, 1, 1, 1, 1,
-0.5227058, 1.475433, -1.434906, 1, 1, 1, 1, 1,
-0.516504, -1.058437, -2.903646, 1, 1, 1, 1, 1,
-0.5163785, 0.4990873, -2.526725, 1, 1, 1, 1, 1,
-0.5155175, 0.9944432, 1.307724, 1, 1, 1, 1, 1,
-0.5148833, 0.871627, 0.2566333, 1, 1, 1, 1, 1,
-0.5144739, -0.8177453, -1.892821, 1, 1, 1, 1, 1,
-0.5111214, -1.29857, -2.889182, 1, 1, 1, 1, 1,
-0.5085858, 0.3237889, -1.343956, 1, 1, 1, 1, 1,
-0.5007116, -0.5768607, -2.281847, 1, 1, 1, 1, 1,
-0.5003988, -0.3257858, -1.46478, 1, 1, 1, 1, 1,
-0.4985492, 0.3618189, -1.421046, 1, 1, 1, 1, 1,
-0.4938127, 0.6078582, -1.759726, 1, 1, 1, 1, 1,
-0.491298, -0.8730676, -3.2669, 1, 1, 1, 1, 1,
-0.4901969, 0.4353644, -1.195145, 0, 0, 1, 1, 1,
-0.4863805, 0.2241727, -0.7750927, 1, 0, 0, 1, 1,
-0.4834842, -2.611718, -2.968581, 1, 0, 0, 1, 1,
-0.4795897, -0.7390063, -2.051086, 1, 0, 0, 1, 1,
-0.4740047, -1.324589, -2.05192, 1, 0, 0, 1, 1,
-0.4737805, 0.6658191, -2.062964, 1, 0, 0, 1, 1,
-0.4718571, -0.7734188, -2.694302, 0, 0, 0, 1, 1,
-0.4705887, -0.06545012, -1.579087, 0, 0, 0, 1, 1,
-0.4633243, 0.3720999, -1.229282, 0, 0, 0, 1, 1,
-0.4627804, -0.08629796, -1.833385, 0, 0, 0, 1, 1,
-0.4559031, 1.905458, -1.006381, 0, 0, 0, 1, 1,
-0.4509874, -0.4493779, -2.377344, 0, 0, 0, 1, 1,
-0.4496375, 0.4282811, -0.927587, 0, 0, 0, 1, 1,
-0.4475931, -0.3075587, -2.297852, 1, 1, 1, 1, 1,
-0.4444791, 1.042642, 0.1564309, 1, 1, 1, 1, 1,
-0.443598, -0.2583028, -4.130941, 1, 1, 1, 1, 1,
-0.4332026, -1.052471, -2.524723, 1, 1, 1, 1, 1,
-0.4319406, -2.528063, -1.924559, 1, 1, 1, 1, 1,
-0.4303367, 1.125135, -0.5463499, 1, 1, 1, 1, 1,
-0.4295385, -0.8583572, -1.968965, 1, 1, 1, 1, 1,
-0.4260346, -2.63931, -2.755009, 1, 1, 1, 1, 1,
-0.4225064, -1.155477, -3.098606, 1, 1, 1, 1, 1,
-0.4183626, 0.04538047, -1.921441, 1, 1, 1, 1, 1,
-0.4176864, 0.5763655, -1.521421, 1, 1, 1, 1, 1,
-0.4163933, 1.095513, -0.1982877, 1, 1, 1, 1, 1,
-0.4146137, 0.2716319, -1.288064, 1, 1, 1, 1, 1,
-0.4128871, 1.135404, 1.194137, 1, 1, 1, 1, 1,
-0.4077614, -0.1741222, -1.629136, 1, 1, 1, 1, 1,
-0.4046129, 0.03444667, -1.345802, 0, 0, 1, 1, 1,
-0.4044882, 0.4567159, -0.5340248, 1, 0, 0, 1, 1,
-0.3940736, 1.441735, -0.4816324, 1, 0, 0, 1, 1,
-0.3903673, -0.7824929, -2.681629, 1, 0, 0, 1, 1,
-0.3887294, -2.222358, -3.677904, 1, 0, 0, 1, 1,
-0.3871161, 0.04612634, -1.346839, 1, 0, 0, 1, 1,
-0.384544, 0.3293036, -0.6151646, 0, 0, 0, 1, 1,
-0.3816081, -0.1482941, -2.598142, 0, 0, 0, 1, 1,
-0.3813825, 0.4988625, -0.06644154, 0, 0, 0, 1, 1,
-0.3801796, 2.048206, -1.599623, 0, 0, 0, 1, 1,
-0.379922, 0.0817357, -1.116526, 0, 0, 0, 1, 1,
-0.3786361, -0.2995417, -1.006531, 0, 0, 0, 1, 1,
-0.3780518, 0.3882444, -0.5532965, 0, 0, 0, 1, 1,
-0.3764325, 1.255998, 2.129003, 1, 1, 1, 1, 1,
-0.3763265, 0.8115322, -2.674286, 1, 1, 1, 1, 1,
-0.3727128, 1.617098, -0.5928244, 1, 1, 1, 1, 1,
-0.3723759, -0.9132354, -1.756294, 1, 1, 1, 1, 1,
-0.3693426, 1.137719, 1.613165, 1, 1, 1, 1, 1,
-0.3687845, 0.1874361, -1.313072, 1, 1, 1, 1, 1,
-0.3642828, 0.8587978, -1.384423, 1, 1, 1, 1, 1,
-0.3612258, 0.8241073, 0.2690501, 1, 1, 1, 1, 1,
-0.3612133, 0.3302946, -2.147513, 1, 1, 1, 1, 1,
-0.3554348, 1.20259, 1.858203, 1, 1, 1, 1, 1,
-0.354146, -0.3026078, -0.9037516, 1, 1, 1, 1, 1,
-0.3517203, -0.6101363, -1.915725, 1, 1, 1, 1, 1,
-0.3484087, -0.8462003, -2.316848, 1, 1, 1, 1, 1,
-0.347599, -1.120231, -3.208945, 1, 1, 1, 1, 1,
-0.3434056, -0.231206, -2.230707, 1, 1, 1, 1, 1,
-0.3426577, 0.05759044, -1.019103, 0, 0, 1, 1, 1,
-0.3416209, 0.3506872, 0.7345845, 1, 0, 0, 1, 1,
-0.3386805, 0.3407124, 1.24366, 1, 0, 0, 1, 1,
-0.3302085, 1.314722, 1.033605, 1, 0, 0, 1, 1,
-0.3286122, -1.133394, -3.395813, 1, 0, 0, 1, 1,
-0.325086, 0.4423451, -0.7962968, 1, 0, 0, 1, 1,
-0.3241253, -0.2125672, -0.8466783, 0, 0, 0, 1, 1,
-0.3237395, 1.480907, 0.6682432, 0, 0, 0, 1, 1,
-0.320309, -0.3462041, -3.509159, 0, 0, 0, 1, 1,
-0.3189117, -1.093096, -1.717531, 0, 0, 0, 1, 1,
-0.3181132, -0.1077071, -3.684801, 0, 0, 0, 1, 1,
-0.314695, 0.5763559, 0.5226138, 0, 0, 0, 1, 1,
-0.3127355, 1.744473, 0.9267235, 0, 0, 0, 1, 1,
-0.3125492, 1.065289, 0.3528955, 1, 1, 1, 1, 1,
-0.3115225, -1.137656, -3.937339, 1, 1, 1, 1, 1,
-0.3092304, 0.4446404, -2.634835, 1, 1, 1, 1, 1,
-0.3087425, -0.1329549, -1.95347, 1, 1, 1, 1, 1,
-0.3052429, -0.2621188, -1.602816, 1, 1, 1, 1, 1,
-0.3037075, -0.3141279, -3.189683, 1, 1, 1, 1, 1,
-0.3020647, -0.3042359, -4.221453, 1, 1, 1, 1, 1,
-0.2966481, 1.180234, -1.610277, 1, 1, 1, 1, 1,
-0.2890795, -0.9522939, -0.1336976, 1, 1, 1, 1, 1,
-0.2886562, 1.115378, -0.04899365, 1, 1, 1, 1, 1,
-0.288117, 0.9159108, -0.06283008, 1, 1, 1, 1, 1,
-0.2873208, 1.30761, -1.051077, 1, 1, 1, 1, 1,
-0.2872792, 1.05811, 0.5663865, 1, 1, 1, 1, 1,
-0.283253, -1.012535, -2.598872, 1, 1, 1, 1, 1,
-0.2804394, -0.6634217, -2.872705, 1, 1, 1, 1, 1,
-0.2803181, -0.2721609, -3.226868, 0, 0, 1, 1, 1,
-0.2787751, -1.564905, -3.138013, 1, 0, 0, 1, 1,
-0.2759972, 1.614371, -0.2685985, 1, 0, 0, 1, 1,
-0.2747316, -0.3730092, -1.768237, 1, 0, 0, 1, 1,
-0.2740387, -1.057671, -1.870402, 1, 0, 0, 1, 1,
-0.2663127, -0.4396253, -2.9118, 1, 0, 0, 1, 1,
-0.2657034, -0.2638401, 0.01897718, 0, 0, 0, 1, 1,
-0.2622912, -1.38994, -2.574982, 0, 0, 0, 1, 1,
-0.2523668, -0.005102337, -1.648862, 0, 0, 0, 1, 1,
-0.2508153, 0.5595095, -1.622779, 0, 0, 0, 1, 1,
-0.2501006, -1.016441, -3.501229, 0, 0, 0, 1, 1,
-0.246383, -0.007367363, -1.131104, 0, 0, 0, 1, 1,
-0.2420709, 0.2683248, -0.4790595, 0, 0, 0, 1, 1,
-0.2396044, 1.459915, 1.023297, 1, 1, 1, 1, 1,
-0.2346177, 0.8488719, -1.53769, 1, 1, 1, 1, 1,
-0.2335774, -0.5178815, -1.611189, 1, 1, 1, 1, 1,
-0.2328904, -0.01517806, -0.09582104, 1, 1, 1, 1, 1,
-0.2326597, -1.58177, -3.186456, 1, 1, 1, 1, 1,
-0.2239274, 0.5802859, 0.4911752, 1, 1, 1, 1, 1,
-0.2239091, 0.1459024, 0.711977, 1, 1, 1, 1, 1,
-0.2236312, 1.500867, 0.6469361, 1, 1, 1, 1, 1,
-0.2209882, -0.5396794, -2.176935, 1, 1, 1, 1, 1,
-0.2203003, -0.58272, -3.252288, 1, 1, 1, 1, 1,
-0.2118509, 1.712883, -0.778533, 1, 1, 1, 1, 1,
-0.2114983, 0.1570027, -1.334121, 1, 1, 1, 1, 1,
-0.2093215, -1.205299, -2.59626, 1, 1, 1, 1, 1,
-0.2071946, 0.8291637, -1.21314, 1, 1, 1, 1, 1,
-0.2063207, 0.7182921, -0.8678603, 1, 1, 1, 1, 1,
-0.2060802, 1.619297, 0.1506138, 0, 0, 1, 1, 1,
-0.203638, 0.07361429, -0.7802356, 1, 0, 0, 1, 1,
-0.2032544, 0.5346498, -0.3706635, 1, 0, 0, 1, 1,
-0.1967882, -0.307255, -0.1762922, 1, 0, 0, 1, 1,
-0.1967008, -1.555327, -4.925091, 1, 0, 0, 1, 1,
-0.1893858, -2.058265, -4.756238, 1, 0, 0, 1, 1,
-0.1853203, -0.1741583, -1.642194, 0, 0, 0, 1, 1,
-0.181025, -0.8009288, -2.81607, 0, 0, 0, 1, 1,
-0.1768877, 2.0405, -1.486844, 0, 0, 0, 1, 1,
-0.1737106, 0.9878061, -0.369758, 0, 0, 0, 1, 1,
-0.1722711, 0.006291953, -3.751909, 0, 0, 0, 1, 1,
-0.1667391, 0.9666975, -0.7490821, 0, 0, 0, 1, 1,
-0.166729, 2.275032, -2.357459, 0, 0, 0, 1, 1,
-0.1665416, -0.5584463, -3.418032, 1, 1, 1, 1, 1,
-0.1637596, -0.40477, -2.383024, 1, 1, 1, 1, 1,
-0.154281, 1.11241, 0.9458037, 1, 1, 1, 1, 1,
-0.1534387, 1.650662, 0.5310095, 1, 1, 1, 1, 1,
-0.1514839, -0.3485534, -3.1523, 1, 1, 1, 1, 1,
-0.1487034, 0.4765022, -0.4795631, 1, 1, 1, 1, 1,
-0.1477012, 1.466527, -1.610653, 1, 1, 1, 1, 1,
-0.146412, -0.5866334, -1.956301, 1, 1, 1, 1, 1,
-0.1447393, 0.4639456, 1.720307, 1, 1, 1, 1, 1,
-0.1428116, 0.9786061, 0.1449611, 1, 1, 1, 1, 1,
-0.1401473, -0.1824222, -3.274708, 1, 1, 1, 1, 1,
-0.133167, -0.1606779, -1.775496, 1, 1, 1, 1, 1,
-0.1251678, -1.139854, -1.49749, 1, 1, 1, 1, 1,
-0.1214212, 0.4308677, -0.6449497, 1, 1, 1, 1, 1,
-0.1203306, 1.657772, -0.7053502, 1, 1, 1, 1, 1,
-0.1192936, 0.1584172, -0.08087587, 0, 0, 1, 1, 1,
-0.1190034, -0.2404861, -3.309072, 1, 0, 0, 1, 1,
-0.1163565, -0.6756634, -3.980011, 1, 0, 0, 1, 1,
-0.1115208, 1.164867, 1.442274, 1, 0, 0, 1, 1,
-0.1100704, 0.1835756, 0.5357206, 1, 0, 0, 1, 1,
-0.1087841, -0.2030931, -3.045667, 1, 0, 0, 1, 1,
-0.1076765, 1.112981, 0.5648519, 0, 0, 0, 1, 1,
-0.09676066, 1.63889, 1.292609, 0, 0, 0, 1, 1,
-0.09508827, -1.046066, -1.779479, 0, 0, 0, 1, 1,
-0.09294841, 2.055137, -1.89565, 0, 0, 0, 1, 1,
-0.09261744, 0.0297613, -0.3397022, 0, 0, 0, 1, 1,
-0.09026183, -0.03044212, -0.8804361, 0, 0, 0, 1, 1,
-0.09004447, -0.9746928, -1.976152, 0, 0, 0, 1, 1,
-0.08822081, 0.5214391, 0.2094815, 1, 1, 1, 1, 1,
-0.08795088, 0.06650614, -0.04864704, 1, 1, 1, 1, 1,
-0.08775337, 0.5300076, 0.4609308, 1, 1, 1, 1, 1,
-0.0847154, 0.1944415, -2.188438, 1, 1, 1, 1, 1,
-0.08259256, -0.7867137, -2.701235, 1, 1, 1, 1, 1,
-0.08218767, -0.1465194, -1.186998, 1, 1, 1, 1, 1,
-0.07966606, -1.709241, -3.677116, 1, 1, 1, 1, 1,
-0.07037783, 0.4701658, -0.6059188, 1, 1, 1, 1, 1,
-0.07004366, 0.06524019, -0.6615824, 1, 1, 1, 1, 1,
-0.06588519, 0.314395, -0.1071818, 1, 1, 1, 1, 1,
-0.06130191, -0.3063245, -4.132433, 1, 1, 1, 1, 1,
-0.06061443, 0.8429888, 0.6769522, 1, 1, 1, 1, 1,
-0.05866755, 0.5099563, -0.9694716, 1, 1, 1, 1, 1,
-0.0577962, 0.4970821, 0.5777867, 1, 1, 1, 1, 1,
-0.05570076, 0.02638216, -1.629706, 1, 1, 1, 1, 1,
-0.05323387, 0.8102816, -1.781565, 0, 0, 1, 1, 1,
-0.04699542, -0.7118367, -2.857338, 1, 0, 0, 1, 1,
-0.04539308, -0.3292908, -2.323015, 1, 0, 0, 1, 1,
-0.04186637, -1.611665, -2.13274, 1, 0, 0, 1, 1,
-0.04162444, -0.1603141, -0.4173045, 1, 0, 0, 1, 1,
-0.03842505, 0.4081665, -1.955317, 1, 0, 0, 1, 1,
-0.03524014, 0.05844371, 1.201392, 0, 0, 0, 1, 1,
-0.03445635, -0.3737931, -1.860026, 0, 0, 0, 1, 1,
-0.03348776, 0.8001717, 0.1454927, 0, 0, 0, 1, 1,
-0.03320285, -0.370762, -2.177371, 0, 0, 0, 1, 1,
-0.03202597, -1.29589, -3.579377, 0, 0, 0, 1, 1,
-0.03082619, -0.8997034, -3.548262, 0, 0, 0, 1, 1,
-0.02684085, -0.4567301, -4.00525, 0, 0, 0, 1, 1,
-0.02087029, -1.430831, -3.828423, 1, 1, 1, 1, 1,
-0.02078935, -2.604408, -4.278568, 1, 1, 1, 1, 1,
-0.01939606, 1.085267, -0.4004236, 1, 1, 1, 1, 1,
-0.01498018, -1.547586, -2.100841, 1, 1, 1, 1, 1,
-0.01386352, -0.7275907, -4.269312, 1, 1, 1, 1, 1,
-0.01205301, 0.569261, -1.827596, 1, 1, 1, 1, 1,
-0.003704721, 0.08489586, 1.08312, 1, 1, 1, 1, 1,
-0.0009953267, -0.5056691, -4.252792, 1, 1, 1, 1, 1,
-0.0004465968, -0.5078338, -1.991843, 1, 1, 1, 1, 1,
-0.0003665462, -0.1609272, -3.250297, 1, 1, 1, 1, 1,
-7.089456e-05, 0.9654875, -0.08741099, 1, 1, 1, 1, 1,
0.003814311, 0.5996208, 0.52887, 1, 1, 1, 1, 1,
0.004530702, 0.3530181, 0.3244555, 1, 1, 1, 1, 1,
0.006151413, -0.5676248, 2.437117, 1, 1, 1, 1, 1,
0.006171046, 0.3226363, 0.9031716, 1, 1, 1, 1, 1,
0.008308795, 1.451038, 1.105432, 0, 0, 1, 1, 1,
0.01047013, -0.8443879, 3.527868, 1, 0, 0, 1, 1,
0.01426268, 0.9339586, 1.106497, 1, 0, 0, 1, 1,
0.01833856, 0.6122998, -0.4496275, 1, 0, 0, 1, 1,
0.02136527, -0.8322768, 2.293871, 1, 0, 0, 1, 1,
0.03363106, -0.4732382, 4.202289, 1, 0, 0, 1, 1,
0.03697647, -0.7305011, 4.255479, 0, 0, 0, 1, 1,
0.03724328, -0.8928651, 3.141415, 0, 0, 0, 1, 1,
0.03884814, 0.71922, -1.223428, 0, 0, 0, 1, 1,
0.04237167, 0.2922813, 0.2700776, 0, 0, 0, 1, 1,
0.04356963, -0.3520452, 3.644872, 0, 0, 0, 1, 1,
0.0445337, -0.4037967, 1.155017, 0, 0, 0, 1, 1,
0.0466769, 0.3478993, 0.5097328, 0, 0, 0, 1, 1,
0.04713467, 1.755783, 1.03987, 1, 1, 1, 1, 1,
0.0482308, 0.9329265, -1.559335, 1, 1, 1, 1, 1,
0.05548836, -0.06978846, 1.879885, 1, 1, 1, 1, 1,
0.05593844, 2.984781, 0.5314476, 1, 1, 1, 1, 1,
0.06267104, -0.01310028, 0.9380223, 1, 1, 1, 1, 1,
0.06425768, -0.729912, 2.770684, 1, 1, 1, 1, 1,
0.06516899, -0.221789, 0.3227866, 1, 1, 1, 1, 1,
0.06603865, -0.1469882, 2.834397, 1, 1, 1, 1, 1,
0.06609774, 1.155275, 0.8134193, 1, 1, 1, 1, 1,
0.06686138, 1.128349, 1.296681, 1, 1, 1, 1, 1,
0.06694262, -0.1632315, 1.77349, 1, 1, 1, 1, 1,
0.06963699, 0.1763377, 0.4384319, 1, 1, 1, 1, 1,
0.07123587, -0.2331161, 2.849511, 1, 1, 1, 1, 1,
0.07162248, 0.8723295, -0.02912071, 1, 1, 1, 1, 1,
0.07255781, -0.942157, 2.535224, 1, 1, 1, 1, 1,
0.07581405, 0.5234222, 2.046797, 0, 0, 1, 1, 1,
0.07778966, -0.1507447, 4.146839, 1, 0, 0, 1, 1,
0.07837121, 1.400968, -0.7538982, 1, 0, 0, 1, 1,
0.08328667, -0.5636423, 1.733421, 1, 0, 0, 1, 1,
0.08417799, 0.7709546, 0.4296696, 1, 0, 0, 1, 1,
0.08442903, -1.180603, 1.988191, 1, 0, 0, 1, 1,
0.0862295, -0.6088976, 2.167956, 0, 0, 0, 1, 1,
0.09090657, 1.408283, 1.151419, 0, 0, 0, 1, 1,
0.09329063, -0.86907, 2.503721, 0, 0, 0, 1, 1,
0.09397756, -0.2370238, 3.753506, 0, 0, 0, 1, 1,
0.09601121, -1.552947, 3.828245, 0, 0, 0, 1, 1,
0.09751817, 0.1429931, 0.7371054, 0, 0, 0, 1, 1,
0.09871267, -1.08679, 2.607127, 0, 0, 0, 1, 1,
0.100112, -2.396878, 1.099843, 1, 1, 1, 1, 1,
0.1010993, -0.04444167, 1.500905, 1, 1, 1, 1, 1,
0.101843, -1.262576, 2.732946, 1, 1, 1, 1, 1,
0.1097128, -2.401502, 4.475879, 1, 1, 1, 1, 1,
0.1111435, -0.61617, 3.208853, 1, 1, 1, 1, 1,
0.1173196, 0.4615141, 1.882387, 1, 1, 1, 1, 1,
0.1200875, -1.790125, 2.512014, 1, 1, 1, 1, 1,
0.1210689, 0.1116908, 1.182288, 1, 1, 1, 1, 1,
0.125076, 1.250657, -1.001077, 1, 1, 1, 1, 1,
0.1264881, -1.21446, 4.343676, 1, 1, 1, 1, 1,
0.1331617, 0.3285491, 0.8334944, 1, 1, 1, 1, 1,
0.1347981, 1.615785, 0.5571344, 1, 1, 1, 1, 1,
0.1379699, 0.5171686, -0.3316428, 1, 1, 1, 1, 1,
0.1423398, -0.8659791, 3.97477, 1, 1, 1, 1, 1,
0.1507325, -0.3998168, 0.822983, 1, 1, 1, 1, 1,
0.1607499, -1.150596, 1.52901, 0, 0, 1, 1, 1,
0.1607652, 0.4339662, 1.66618, 1, 0, 0, 1, 1,
0.1635444, 3.307558, -0.3061807, 1, 0, 0, 1, 1,
0.1642655, -0.8249753, 3.289441, 1, 0, 0, 1, 1,
0.164831, -0.963725, 4.24908, 1, 0, 0, 1, 1,
0.1655433, 0.6345477, -0.3628487, 1, 0, 0, 1, 1,
0.1705682, 0.3435444, 0.1043891, 0, 0, 0, 1, 1,
0.1705867, 0.7734208, 0.6942604, 0, 0, 0, 1, 1,
0.1736483, -1.270522, 4.418614, 0, 0, 0, 1, 1,
0.1767557, 0.5953886, 0.3184163, 0, 0, 0, 1, 1,
0.1779702, -0.8175759, 2.807043, 0, 0, 0, 1, 1,
0.1793814, -0.4473144, 2.415896, 0, 0, 0, 1, 1,
0.1807847, 3.892913, -0.1109138, 0, 0, 0, 1, 1,
0.1848932, 1.826409, -2.149459, 1, 1, 1, 1, 1,
0.1858409, 0.05953985, 0.2599947, 1, 1, 1, 1, 1,
0.1877823, 1.416839, 0.3877953, 1, 1, 1, 1, 1,
0.1906705, -0.4211121, 1.185823, 1, 1, 1, 1, 1,
0.1906768, 0.7919837, -0.03288046, 1, 1, 1, 1, 1,
0.1936361, 1.254102, 0.4149056, 1, 1, 1, 1, 1,
0.1978569, -0.9876384, 3.516032, 1, 1, 1, 1, 1,
0.1996138, -0.9904464, 2.002285, 1, 1, 1, 1, 1,
0.2034149, 0.3358391, 0.9834302, 1, 1, 1, 1, 1,
0.2054666, 0.9888948, 0.2362488, 1, 1, 1, 1, 1,
0.2072219, -1.703649, 2.852659, 1, 1, 1, 1, 1,
0.2096949, 1.269706, -1.841226, 1, 1, 1, 1, 1,
0.2113326, -1.069765, 3.677554, 1, 1, 1, 1, 1,
0.2118263, 0.4721766, -1.163393, 1, 1, 1, 1, 1,
0.2135223, -0.4179566, 1.370456, 1, 1, 1, 1, 1,
0.2138647, 1.970733, -0.7276852, 0, 0, 1, 1, 1,
0.2142029, -0.3264235, 3.426275, 1, 0, 0, 1, 1,
0.214361, 0.7249231, 0.940028, 1, 0, 0, 1, 1,
0.2186536, -0.6209405, 1.369918, 1, 0, 0, 1, 1,
0.2208874, 0.9724202, 0.5190371, 1, 0, 0, 1, 1,
0.2213245, -0.9132301, 2.800731, 1, 0, 0, 1, 1,
0.2338473, 1.206946, -0.8835877, 0, 0, 0, 1, 1,
0.2344707, -0.09434602, 1.753929, 0, 0, 0, 1, 1,
0.2349048, 1.020199, -1.740619, 0, 0, 0, 1, 1,
0.2369481, 0.1191401, 0.5051284, 0, 0, 0, 1, 1,
0.2377957, 0.7831162, -0.2288857, 0, 0, 0, 1, 1,
0.238465, 0.2075906, -0.2001232, 0, 0, 0, 1, 1,
0.2404836, 1.660132, -1.449063, 0, 0, 0, 1, 1,
0.2414, 0.966447, -1.032869, 1, 1, 1, 1, 1,
0.2430067, -0.1717923, 2.956017, 1, 1, 1, 1, 1,
0.2452405, -0.2951058, 3.721462, 1, 1, 1, 1, 1,
0.2461071, 0.06290931, 1.274053, 1, 1, 1, 1, 1,
0.2482853, 1.440107, 1.785975, 1, 1, 1, 1, 1,
0.2513668, -0.6510233, 3.096934, 1, 1, 1, 1, 1,
0.2550091, 0.6179778, 0.5153051, 1, 1, 1, 1, 1,
0.2553846, 1.357776, -0.342864, 1, 1, 1, 1, 1,
0.2594749, -0.9359019, 3.543334, 1, 1, 1, 1, 1,
0.2609164, -0.2450908, 1.272966, 1, 1, 1, 1, 1,
0.2628376, 0.2117239, 1.546713, 1, 1, 1, 1, 1,
0.2640628, 1.267091, -2.57487, 1, 1, 1, 1, 1,
0.2676122, 0.5685344, -0.1330176, 1, 1, 1, 1, 1,
0.2676572, 0.4630365, 0.514198, 1, 1, 1, 1, 1,
0.2689451, 0.9727163, -0.7076578, 1, 1, 1, 1, 1,
0.2714494, 0.2030089, 1.479153, 0, 0, 1, 1, 1,
0.271517, 0.4638838, 0.3971078, 1, 0, 0, 1, 1,
0.2722211, 0.4119058, -1.339271, 1, 0, 0, 1, 1,
0.2743481, 0.7068663, -0.1925937, 1, 0, 0, 1, 1,
0.2760743, -0.8243352, 2.240315, 1, 0, 0, 1, 1,
0.2795403, -0.2442392, 0.6371989, 1, 0, 0, 1, 1,
0.2798246, -0.1483192, 2.965527, 0, 0, 0, 1, 1,
0.2887067, 1.110802, 0.3819521, 0, 0, 0, 1, 1,
0.2894832, 0.8690714, 1.924871, 0, 0, 0, 1, 1,
0.2919889, -1.615539, 3.63452, 0, 0, 0, 1, 1,
0.2952358, 0.2603976, 2.129287, 0, 0, 0, 1, 1,
0.2971068, -0.2008682, 2.470361, 0, 0, 0, 1, 1,
0.3003255, -1.113651, 2.494953, 0, 0, 0, 1, 1,
0.3016366, 1.356892, -0.4920146, 1, 1, 1, 1, 1,
0.3057756, 1.692878, 0.574326, 1, 1, 1, 1, 1,
0.309311, 0.05316238, 1.205083, 1, 1, 1, 1, 1,
0.3148937, 0.4425028, 0.3395048, 1, 1, 1, 1, 1,
0.3182227, -1.192252, 2.732348, 1, 1, 1, 1, 1,
0.3188488, 2.340963, -0.09334603, 1, 1, 1, 1, 1,
0.3231065, -0.4879141, 2.887339, 1, 1, 1, 1, 1,
0.3265103, 0.5626189, 0.2796879, 1, 1, 1, 1, 1,
0.3288687, 0.7039872, 0.9587683, 1, 1, 1, 1, 1,
0.3352025, -0.1468588, 1.90258, 1, 1, 1, 1, 1,
0.3358964, -0.7385536, 3.241693, 1, 1, 1, 1, 1,
0.3394604, -1.154609, 3.058116, 1, 1, 1, 1, 1,
0.3451033, 1.320102, -0.3630775, 1, 1, 1, 1, 1,
0.3461497, -0.08356753, 1.240835, 1, 1, 1, 1, 1,
0.3545978, -1.027285, 4.343215, 1, 1, 1, 1, 1,
0.3580326, 0.2112006, 1.453376, 0, 0, 1, 1, 1,
0.3631527, 1.479494, 1.710542, 1, 0, 0, 1, 1,
0.3655778, 0.7945906, 1.673373, 1, 0, 0, 1, 1,
0.370876, 0.7940412, -0.425106, 1, 0, 0, 1, 1,
0.3784037, 1.071056, -1.089014, 1, 0, 0, 1, 1,
0.3786855, -0.2848188, 0.7290758, 1, 0, 0, 1, 1,
0.3878067, 0.2338311, 1.619969, 0, 0, 0, 1, 1,
0.3896127, -0.3716011, 1.829494, 0, 0, 0, 1, 1,
0.3901771, 1.730702, -0.1662212, 0, 0, 0, 1, 1,
0.3913662, -0.6994881, 2.495479, 0, 0, 0, 1, 1,
0.3913692, -0.3188385, 1.518014, 0, 0, 0, 1, 1,
0.3936493, 0.3806216, 0.6401215, 0, 0, 0, 1, 1,
0.3954721, -0.2742965, 0.535009, 0, 0, 0, 1, 1,
0.3957189, -1.032821, 3.6143, 1, 1, 1, 1, 1,
0.3980581, -0.2115888, 2.132453, 1, 1, 1, 1, 1,
0.4022579, -0.2554197, 2.452781, 1, 1, 1, 1, 1,
0.4035126, 0.009562764, 0.06829482, 1, 1, 1, 1, 1,
0.406974, 0.5283588, -0.321081, 1, 1, 1, 1, 1,
0.4092085, -0.005284212, 2.519744, 1, 1, 1, 1, 1,
0.4096451, 0.7347624, -0.8719764, 1, 1, 1, 1, 1,
0.4119777, 0.1356622, 0.2796277, 1, 1, 1, 1, 1,
0.4122387, -0.7365165, 2.489948, 1, 1, 1, 1, 1,
0.4152119, -0.3973932, 1.333485, 1, 1, 1, 1, 1,
0.4195094, 0.2498461, 1.930246, 1, 1, 1, 1, 1,
0.4213957, -0.01032531, 0.9838666, 1, 1, 1, 1, 1,
0.4219334, 0.4986322, 0.7128243, 1, 1, 1, 1, 1,
0.4223375, 0.481231, 0.2572833, 1, 1, 1, 1, 1,
0.422682, 0.4676413, 0.9673133, 1, 1, 1, 1, 1,
0.4254347, -0.3777779, 2.576754, 0, 0, 1, 1, 1,
0.4257462, 0.02531498, 0.595395, 1, 0, 0, 1, 1,
0.4306533, -0.1962149, 0.4342318, 1, 0, 0, 1, 1,
0.4311564, 0.1556999, 2.248491, 1, 0, 0, 1, 1,
0.4319303, 0.2407397, 0.1937881, 1, 0, 0, 1, 1,
0.4381345, 0.04879754, 0.5948852, 1, 0, 0, 1, 1,
0.4595596, 0.884607, 1.7562, 0, 0, 0, 1, 1,
0.4613209, 0.4846768, 1.458504, 0, 0, 0, 1, 1,
0.4615125, 1.571518, 1.43988, 0, 0, 0, 1, 1,
0.4637132, 2.712093, -0.324944, 0, 0, 0, 1, 1,
0.4688933, 0.1550977, -0.1682741, 0, 0, 0, 1, 1,
0.4724464, 0.1664989, 2.147061, 0, 0, 0, 1, 1,
0.4731249, -0.2552778, 2.07028, 0, 0, 0, 1, 1,
0.4768926, -0.3003281, 1.690533, 1, 1, 1, 1, 1,
0.4780243, -0.1486494, 2.821357, 1, 1, 1, 1, 1,
0.47953, 0.2374465, -0.103356, 1, 1, 1, 1, 1,
0.4804331, -1.407619, 3.275152, 1, 1, 1, 1, 1,
0.489039, -0.8231643, 4.290676, 1, 1, 1, 1, 1,
0.4892559, -0.1231905, 2.359195, 1, 1, 1, 1, 1,
0.4918061, -1.547018, 3.378467, 1, 1, 1, 1, 1,
0.4948016, -0.4957555, 2.888137, 1, 1, 1, 1, 1,
0.4955284, -0.2805789, 0.9933025, 1, 1, 1, 1, 1,
0.496067, -0.5897473, 1.829211, 1, 1, 1, 1, 1,
0.5066061, 0.1796719, 1.892213, 1, 1, 1, 1, 1,
0.5067557, -1.537373, 3.052849, 1, 1, 1, 1, 1,
0.5106063, 1.29429, 0.666898, 1, 1, 1, 1, 1,
0.5199695, -0.07282742, 1.970251, 1, 1, 1, 1, 1,
0.5206946, -1.509544, 4.859018, 1, 1, 1, 1, 1,
0.5234928, 0.3215455, 2.381522, 0, 0, 1, 1, 1,
0.527, -0.3752002, 1.178174, 1, 0, 0, 1, 1,
0.5301636, 1.311566, -1.218823, 1, 0, 0, 1, 1,
0.5307132, -0.08281457, 2.192505, 1, 0, 0, 1, 1,
0.5320822, 1.31275, 0.7629862, 1, 0, 0, 1, 1,
0.5328074, -0.6106427, 2.583842, 1, 0, 0, 1, 1,
0.5352952, 1.415831, 0.8029905, 0, 0, 0, 1, 1,
0.5428482, 0.09674959, -0.3423327, 0, 0, 0, 1, 1,
0.5463771, -1.076581, 1.89162, 0, 0, 0, 1, 1,
0.5473517, -0.805504, 1.039656, 0, 0, 0, 1, 1,
0.5506804, 1.971252, 0.5816916, 0, 0, 0, 1, 1,
0.5514472, -1.095398, 2.246574, 0, 0, 0, 1, 1,
0.555393, -0.3249028, 2.161856, 0, 0, 0, 1, 1,
0.5562969, 0.3070795, 1.842706, 1, 1, 1, 1, 1,
0.5570677, -0.2955438, 2.416661, 1, 1, 1, 1, 1,
0.5609572, -0.02236477, 0.8174523, 1, 1, 1, 1, 1,
0.5622993, -0.4593827, 2.478827, 1, 1, 1, 1, 1,
0.5764284, 1.723776, 0.07342133, 1, 1, 1, 1, 1,
0.57956, -1.046118, 1.648726, 1, 1, 1, 1, 1,
0.5805789, -0.8755805, 1.936014, 1, 1, 1, 1, 1,
0.5820048, -0.2617553, 3.410822, 1, 1, 1, 1, 1,
0.5865659, -0.07698838, 1.658289, 1, 1, 1, 1, 1,
0.5877039, -0.3312434, 4.268244, 1, 1, 1, 1, 1,
0.5881708, 1.164592, 1.619178, 1, 1, 1, 1, 1,
0.5993478, -0.6100845, 2.293617, 1, 1, 1, 1, 1,
0.603433, -0.2556709, 1.976068, 1, 1, 1, 1, 1,
0.6040844, -0.3902998, 2.44873, 1, 1, 1, 1, 1,
0.6085647, -2.122293, 2.088376, 1, 1, 1, 1, 1,
0.6109934, -0.7386371, 2.685581, 0, 0, 1, 1, 1,
0.6139844, -1.341311, 2.977186, 1, 0, 0, 1, 1,
0.6146973, 0.9047734, -0.05447498, 1, 0, 0, 1, 1,
0.6165419, 1.041729, 1.423198, 1, 0, 0, 1, 1,
0.6178687, 2.127762, 2.135241, 1, 0, 0, 1, 1,
0.6181502, 0.9828267, -1.107444, 1, 0, 0, 1, 1,
0.6188295, 0.1936259, 0.7821158, 0, 0, 0, 1, 1,
0.6207862, 0.2061102, 2.109786, 0, 0, 0, 1, 1,
0.6230673, 0.8499748, 1.243278, 0, 0, 0, 1, 1,
0.6242239, 0.2639993, -0.6441275, 0, 0, 0, 1, 1,
0.6273609, -1.479787, 3.685873, 0, 0, 0, 1, 1,
0.6330575, 1.784787, -0.6866509, 0, 0, 0, 1, 1,
0.6334908, 0.05223241, -0.4621185, 0, 0, 0, 1, 1,
0.6384746, -0.183949, 1.41471, 1, 1, 1, 1, 1,
0.6413438, -1.673894, 3.18951, 1, 1, 1, 1, 1,
0.6413556, -0.7181596, 2.83867, 1, 1, 1, 1, 1,
0.6505576, -0.5588483, 3.039608, 1, 1, 1, 1, 1,
0.6518839, -0.5184002, 0.9758578, 1, 1, 1, 1, 1,
0.6538835, -0.5805016, -0.0008359589, 1, 1, 1, 1, 1,
0.6573062, 0.5708596, -0.1576642, 1, 1, 1, 1, 1,
0.658658, -0.658299, 0.7613462, 1, 1, 1, 1, 1,
0.6595286, -0.2546725, 0.8511251, 1, 1, 1, 1, 1,
0.660482, 0.8965309, -0.7240837, 1, 1, 1, 1, 1,
0.6622353, 2.729173, -1.812886, 1, 1, 1, 1, 1,
0.6680456, -0.1984058, 1.725129, 1, 1, 1, 1, 1,
0.6715185, -1.206897, 1.519393, 1, 1, 1, 1, 1,
0.6767579, 0.1526032, 0.6348531, 1, 1, 1, 1, 1,
0.6780348, -0.5162057, 0.3704493, 1, 1, 1, 1, 1,
0.6830309, 0.6448147, 1.900847, 0, 0, 1, 1, 1,
0.6832297, -0.7230012, 3.294865, 1, 0, 0, 1, 1,
0.6841594, -1.408192, 3.980656, 1, 0, 0, 1, 1,
0.6870193, 0.5045078, 1.59014, 1, 0, 0, 1, 1,
0.6888423, -1.496532, 1.431227, 1, 0, 0, 1, 1,
0.6905102, -0.9524365, 2.049646, 1, 0, 0, 1, 1,
0.6937681, -2.691009, 2.64209, 0, 0, 0, 1, 1,
0.693918, -0.1696645, 2.250765, 0, 0, 0, 1, 1,
0.694795, 0.4465881, 1.866171, 0, 0, 0, 1, 1,
0.7045681, 0.8426093, 1.575751, 0, 0, 0, 1, 1,
0.7053061, 1.844451, -0.5931342, 0, 0, 0, 1, 1,
0.7080174, -0.07037609, 2.002366, 0, 0, 0, 1, 1,
0.7089176, 0.5769671, 1.128653, 0, 0, 0, 1, 1,
0.7145683, -0.733722, 1.646296, 1, 1, 1, 1, 1,
0.7198405, 0.08275651, 1.847562, 1, 1, 1, 1, 1,
0.7294944, 1.231031, -0.670239, 1, 1, 1, 1, 1,
0.7353842, -2.021705, 2.603597, 1, 1, 1, 1, 1,
0.7362538, 1.258985, 1.211141, 1, 1, 1, 1, 1,
0.7417948, -0.4965779, 2.459015, 1, 1, 1, 1, 1,
0.7423056, 0.4637022, 2.033491, 1, 1, 1, 1, 1,
0.7429252, -0.8012907, 3.218617, 1, 1, 1, 1, 1,
0.7444015, 0.7101352, 0.9726047, 1, 1, 1, 1, 1,
0.7465305, -0.06938615, 1.596706, 1, 1, 1, 1, 1,
0.7497157, -0.6933522, 2.435367, 1, 1, 1, 1, 1,
0.75091, 1.29158, -0.8246776, 1, 1, 1, 1, 1,
0.7523087, 1.475354, 0.3811344, 1, 1, 1, 1, 1,
0.754914, 0.559701, 1.288994, 1, 1, 1, 1, 1,
0.7560244, 1.391445, 0.6931559, 1, 1, 1, 1, 1,
0.7588312, 1.170358, 0.08785798, 0, 0, 1, 1, 1,
0.7616218, -0.2152195, 2.120216, 1, 0, 0, 1, 1,
0.7644578, -0.9880981, 3.791335, 1, 0, 0, 1, 1,
0.774033, -0.4010611, 3.217849, 1, 0, 0, 1, 1,
0.7744405, -0.9254285, 2.852484, 1, 0, 0, 1, 1,
0.77775, 0.04821579, 0.3666003, 1, 0, 0, 1, 1,
0.7779222, -1.396185, 4.017558, 0, 0, 0, 1, 1,
0.784334, -1.4038, 3.079447, 0, 0, 0, 1, 1,
0.7882292, -2.066759, 2.755801, 0, 0, 0, 1, 1,
0.7888656, -0.1744518, -0.1521376, 0, 0, 0, 1, 1,
0.7891331, -0.7840422, 3.399443, 0, 0, 0, 1, 1,
0.7946067, 0.5398083, 0.1552851, 0, 0, 0, 1, 1,
0.7954383, 0.4924715, 1.902138, 0, 0, 0, 1, 1,
0.7966864, 1.673985, 0.1246282, 1, 1, 1, 1, 1,
0.804734, 0.110244, 0.3408479, 1, 1, 1, 1, 1,
0.8051439, -1.445192, 2.162622, 1, 1, 1, 1, 1,
0.8066158, 0.5431562, 2.514028, 1, 1, 1, 1, 1,
0.8091009, 0.5260547, 1.834396, 1, 1, 1, 1, 1,
0.8103915, 1.094504, 0.5419103, 1, 1, 1, 1, 1,
0.8120589, -0.1779532, 2.215735, 1, 1, 1, 1, 1,
0.8155808, -0.9180552, 1.98334, 1, 1, 1, 1, 1,
0.8160064, 0.6747436, 1.308598, 1, 1, 1, 1, 1,
0.8210076, 0.1335999, 1.43215, 1, 1, 1, 1, 1,
0.8320392, 2.108731, -0.1907142, 1, 1, 1, 1, 1,
0.834136, -0.8742752, 2.248527, 1, 1, 1, 1, 1,
0.8379867, -0.4076717, 2.521149, 1, 1, 1, 1, 1,
0.8381175, -1.728241, 2.573116, 1, 1, 1, 1, 1,
0.8408176, -0.230616, 2.906838, 1, 1, 1, 1, 1,
0.841306, -0.1208477, 2.159926, 0, 0, 1, 1, 1,
0.8466697, -0.3835427, 0.9094489, 1, 0, 0, 1, 1,
0.8473739, 0.3233142, 0.6557208, 1, 0, 0, 1, 1,
0.8473752, 0.4066185, 1.429343, 1, 0, 0, 1, 1,
0.8478456, -0.4228933, 2.626946, 1, 0, 0, 1, 1,
0.8563704, -0.6077814, 2.351365, 1, 0, 0, 1, 1,
0.856902, 0.6181219, 1.169814, 0, 0, 0, 1, 1,
0.8612223, 1.148198, -1.444605, 0, 0, 0, 1, 1,
0.861946, 1.297003, 1.108671, 0, 0, 0, 1, 1,
0.8650299, 1.625863, 2.139886, 0, 0, 0, 1, 1,
0.8727813, 1.790694, 0.8606921, 0, 0, 0, 1, 1,
0.8834163, 0.2783546, 0.8547996, 0, 0, 0, 1, 1,
0.8896583, -0.9720497, 1.45408, 0, 0, 0, 1, 1,
0.8977794, 0.02489814, 2.08209, 1, 1, 1, 1, 1,
0.9001486, 1.525537, -1.853995, 1, 1, 1, 1, 1,
0.9015645, -0.9342281, 3.417495, 1, 1, 1, 1, 1,
0.9028183, -0.6006584, 3.376112, 1, 1, 1, 1, 1,
0.9086264, -0.003287997, 2.29076, 1, 1, 1, 1, 1,
0.9094916, -1.387319, 2.545817, 1, 1, 1, 1, 1,
0.9118013, -0.3433461, 2.125602, 1, 1, 1, 1, 1,
0.9128845, 0.07028266, -0.007648384, 1, 1, 1, 1, 1,
0.9143353, -1.559664, 3.288006, 1, 1, 1, 1, 1,
0.914519, -0.6593521, 2.726641, 1, 1, 1, 1, 1,
0.9179947, -1.553297, 1.664114, 1, 1, 1, 1, 1,
0.9199938, -0.09405708, 2.942598, 1, 1, 1, 1, 1,
0.9232242, 1.256101, -0.01423057, 1, 1, 1, 1, 1,
0.9234813, -1.037703, 3.911997, 1, 1, 1, 1, 1,
0.9237475, 1.270603, 1.498348, 1, 1, 1, 1, 1,
0.9291826, -0.02579735, 4.577344, 0, 0, 1, 1, 1,
0.9293435, 0.8786215, 0.9860551, 1, 0, 0, 1, 1,
0.930999, -0.1132612, 2.085461, 1, 0, 0, 1, 1,
0.9338025, -0.4048128, 1.442297, 1, 0, 0, 1, 1,
0.9346614, 0.4845125, 0.927056, 1, 0, 0, 1, 1,
0.9365408, 0.7621545, 1.874564, 1, 0, 0, 1, 1,
0.9365724, -0.8188691, 2.595549, 0, 0, 0, 1, 1,
0.9466279, -1.305699, 2.774896, 0, 0, 0, 1, 1,
0.9476451, 0.8965482, 0.4631264, 0, 0, 0, 1, 1,
0.9482225, 1.723334, 1.787926, 0, 0, 0, 1, 1,
0.9564562, -1.347111, 1.236409, 0, 0, 0, 1, 1,
0.9568125, 0.5719495, 1.079643, 0, 0, 0, 1, 1,
0.9569108, 1.826627, 0.4137028, 0, 0, 0, 1, 1,
0.9624416, 1.142639, -0.3437118, 1, 1, 1, 1, 1,
0.966425, 0.8514179, 0.9437021, 1, 1, 1, 1, 1,
0.9668995, -0.5789209, 2.402031, 1, 1, 1, 1, 1,
0.973208, 0.4401053, 0.831019, 1, 1, 1, 1, 1,
0.9763961, 0.8844922, -0.08919253, 1, 1, 1, 1, 1,
0.9767655, 0.01942074, 0.8327804, 1, 1, 1, 1, 1,
0.9794576, 0.8440411, 0.7399558, 1, 1, 1, 1, 1,
0.9838747, -1.52478, 2.007859, 1, 1, 1, 1, 1,
0.9839422, 0.9122263, 0.7938668, 1, 1, 1, 1, 1,
0.9854288, 1.644537, 2.501867, 1, 1, 1, 1, 1,
0.9913707, 1.16908, 0.5220568, 1, 1, 1, 1, 1,
1.004625, 3.114149, 0.7690855, 1, 1, 1, 1, 1,
1.00941, -3.175152, 2.188646, 1, 1, 1, 1, 1,
1.024344, 1.048521, 1.369441, 1, 1, 1, 1, 1,
1.025286, 1.734168, 0.9883376, 1, 1, 1, 1, 1,
1.031619, 1.150535, -1.120313, 0, 0, 1, 1, 1,
1.032208, 0.8891438, 0.8792769, 1, 0, 0, 1, 1,
1.033633, -0.7744829, 2.637642, 1, 0, 0, 1, 1,
1.04504, 0.4612921, -0.1018115, 1, 0, 0, 1, 1,
1.048331, 1.0033, 1.403498, 1, 0, 0, 1, 1,
1.058423, 0.4175496, -0.07921446, 1, 0, 0, 1, 1,
1.061883, -0.2830954, 2.505939, 0, 0, 0, 1, 1,
1.06491, -0.9630639, 3.153046, 0, 0, 0, 1, 1,
1.084815, 0.4803911, 0.8898497, 0, 0, 0, 1, 1,
1.088382, 0.1400104, 0.9247363, 0, 0, 0, 1, 1,
1.089257, -1.033026, 2.24521, 0, 0, 0, 1, 1,
1.097976, 0.1612682, 1.192008, 0, 0, 0, 1, 1,
1.101581, 1.108979, 0.4526893, 0, 0, 0, 1, 1,
1.108295, -2.240515, 4.065934, 1, 1, 1, 1, 1,
1.108325, 0.8854396, 1.906501, 1, 1, 1, 1, 1,
1.11022, -1.296729, 0.5725542, 1, 1, 1, 1, 1,
1.12235, -0.578611, 2.77042, 1, 1, 1, 1, 1,
1.127402, 0.1407625, 2.144934, 1, 1, 1, 1, 1,
1.128379, -0.01936018, 0.942065, 1, 1, 1, 1, 1,
1.131566, -1.351776, 3.212541, 1, 1, 1, 1, 1,
1.150474, -1.550414, 0.5310451, 1, 1, 1, 1, 1,
1.154257, 0.8551664, 0.1697075, 1, 1, 1, 1, 1,
1.154438, -0.09535145, 2.594557, 1, 1, 1, 1, 1,
1.154693, -0.06229918, -0.5946308, 1, 1, 1, 1, 1,
1.159572, 1.204393, 1.287381, 1, 1, 1, 1, 1,
1.162663, 0.2403528, 1.89913, 1, 1, 1, 1, 1,
1.16475, -0.07906937, 1.421567, 1, 1, 1, 1, 1,
1.171805, -0.9616266, 1.647275, 1, 1, 1, 1, 1,
1.176731, 1.575471, -0.03943373, 0, 0, 1, 1, 1,
1.177028, -0.4331053, 3.262951, 1, 0, 0, 1, 1,
1.187107, 0.8701691, -0.7025875, 1, 0, 0, 1, 1,
1.194665, -0.04628269, 1.783271, 1, 0, 0, 1, 1,
1.19679, -0.8552967, 1.713617, 1, 0, 0, 1, 1,
1.202698, 0.99347, 1.580526, 1, 0, 0, 1, 1,
1.20621, -0.305999, 1.885189, 0, 0, 0, 1, 1,
1.207102, 0.09669068, 2.063421, 0, 0, 0, 1, 1,
1.211999, -0.9841396, 1.910007, 0, 0, 0, 1, 1,
1.21488, 0.4999102, 1.137851, 0, 0, 0, 1, 1,
1.225819, -0.6207328, 1.247216, 0, 0, 0, 1, 1,
1.22643, 0.2676606, 1.125294, 0, 0, 0, 1, 1,
1.228513, 1.348627, 1.278799, 0, 0, 0, 1, 1,
1.228961, 1.334186, 0.5288144, 1, 1, 1, 1, 1,
1.24743, 1.260675, 1.190566, 1, 1, 1, 1, 1,
1.24899, -0.3333043, 2.278739, 1, 1, 1, 1, 1,
1.250798, 0.2523795, 2.148975, 1, 1, 1, 1, 1,
1.251375, -0.462661, 2.75613, 1, 1, 1, 1, 1,
1.252911, -0.9041748, 2.580786, 1, 1, 1, 1, 1,
1.266901, 0.7511012, -0.4937097, 1, 1, 1, 1, 1,
1.267588, -0.2771035, 1.019573, 1, 1, 1, 1, 1,
1.272715, -1.261732, 1.262379, 1, 1, 1, 1, 1,
1.293751, 0.3309356, 1.272483, 1, 1, 1, 1, 1,
1.306983, -0.7079118, 1.583897, 1, 1, 1, 1, 1,
1.310011, -0.1639868, 2.867757, 1, 1, 1, 1, 1,
1.323437, 0.8575402, 0.4493692, 1, 1, 1, 1, 1,
1.325774, -0.7183958, 0.7964211, 1, 1, 1, 1, 1,
1.327185, -0.8183062, 2.155748, 1, 1, 1, 1, 1,
1.334062, -1.04951, 4.491322, 0, 0, 1, 1, 1,
1.33485, 0.5774296, 1.380797, 1, 0, 0, 1, 1,
1.336791, -0.5668686, 1.49693, 1, 0, 0, 1, 1,
1.338834, 0.8867389, -0.6797379, 1, 0, 0, 1, 1,
1.344308, 0.4613103, 0.3509222, 1, 0, 0, 1, 1,
1.345057, -1.070077, 1.468753, 1, 0, 0, 1, 1,
1.349566, -0.09220522, 2.207815, 0, 0, 0, 1, 1,
1.351946, -0.6594531, 0.8214015, 0, 0, 0, 1, 1,
1.364264, 1.113138, -0.2540151, 0, 0, 0, 1, 1,
1.364567, 0.0797043, 0.05139742, 0, 0, 0, 1, 1,
1.371707, -1.988623, 2.571253, 0, 0, 0, 1, 1,
1.371824, 2.140658, 0.6819455, 0, 0, 0, 1, 1,
1.384929, -1.994212, 2.726727, 0, 0, 0, 1, 1,
1.401972, -1.473452, 2.83065, 1, 1, 1, 1, 1,
1.413429, -0.15177, 2.965516, 1, 1, 1, 1, 1,
1.416, 0.7508046, -0.2130656, 1, 1, 1, 1, 1,
1.420144, 0.815915, 1.29398, 1, 1, 1, 1, 1,
1.431026, -0.5121088, 1.801557, 1, 1, 1, 1, 1,
1.433245, -1.423649, 3.94146, 1, 1, 1, 1, 1,
1.446405, 0.0894836, 0.5484365, 1, 1, 1, 1, 1,
1.453035, 0.2706557, 2.042898, 1, 1, 1, 1, 1,
1.461178, 0.9478226, 1.609142, 1, 1, 1, 1, 1,
1.479129, -0.9109176, 2.148523, 1, 1, 1, 1, 1,
1.485762, 0.3341505, 1.401218, 1, 1, 1, 1, 1,
1.499252, -0.2466175, 2.195129, 1, 1, 1, 1, 1,
1.509213, 1.339975, -0.5926443, 1, 1, 1, 1, 1,
1.52348, 1.295206, 2.328143, 1, 1, 1, 1, 1,
1.524068, 1.01243, -0.2202618, 1, 1, 1, 1, 1,
1.534195, -1.966756, 4.989834, 0, 0, 1, 1, 1,
1.560535, -1.161781, 2.76026, 1, 0, 0, 1, 1,
1.563195, -0.4353605, 2.282897, 1, 0, 0, 1, 1,
1.581965, -0.5200934, 1.604533, 1, 0, 0, 1, 1,
1.585549, 0.7739417, 1.035756, 1, 0, 0, 1, 1,
1.58825, -0.2167065, 0.9480671, 1, 0, 0, 1, 1,
1.5912, 0.4679694, 1.020253, 0, 0, 0, 1, 1,
1.602251, 0.09909002, 2.123939, 0, 0, 0, 1, 1,
1.609192, 0.8609005, 0.531013, 0, 0, 0, 1, 1,
1.611549, 0.5732924, 0.6820894, 0, 0, 0, 1, 1,
1.623141, 2.145346, 0.7186298, 0, 0, 0, 1, 1,
1.637562, -0.3361737, 1.645085, 0, 0, 0, 1, 1,
1.638165, 1.071527, 0.02989116, 0, 0, 0, 1, 1,
1.650915, -0.1143188, 2.172439, 1, 1, 1, 1, 1,
1.662808, 0.2734692, 1.894777, 1, 1, 1, 1, 1,
1.66715, -0.9147636, 2.064114, 1, 1, 1, 1, 1,
1.668224, -0.5928516, 1.427845, 1, 1, 1, 1, 1,
1.679943, -0.9758298, 1.172204, 1, 1, 1, 1, 1,
1.686867, 0.2966905, 0.6305512, 1, 1, 1, 1, 1,
1.694199, 1.850449, -0.7270605, 1, 1, 1, 1, 1,
1.721102, -1.046288, 1.533906, 1, 1, 1, 1, 1,
1.731444, -0.3709344, 2.480124, 1, 1, 1, 1, 1,
1.779068, 2.006074, 0.2971402, 1, 1, 1, 1, 1,
1.805629, -1.264673, 1.787912, 1, 1, 1, 1, 1,
1.853676, -1.536066, 2.078485, 1, 1, 1, 1, 1,
1.864638, -0.3252414, 3.394768, 1, 1, 1, 1, 1,
1.866846, -0.9196334, 2.089256, 1, 1, 1, 1, 1,
1.88485, 0.4422504, 1.962524, 1, 1, 1, 1, 1,
1.892957, -1.449179, 1.322103, 0, 0, 1, 1, 1,
1.899761, 0.2071534, 1.769456, 1, 0, 0, 1, 1,
1.935269, -0.09781577, 1.220754, 1, 0, 0, 1, 1,
1.961759, -0.1427649, 1.329892, 1, 0, 0, 1, 1,
1.995014, 0.1501327, 2.217764, 1, 0, 0, 1, 1,
2.052105, -1.568085, 1.873778, 1, 0, 0, 1, 1,
2.10625, 0.2998198, 2.559751, 0, 0, 0, 1, 1,
2.112086, -0.5415208, 2.329717, 0, 0, 0, 1, 1,
2.112358, 2.004162, 0.9804682, 0, 0, 0, 1, 1,
2.11826, -0.6446905, 1.900453, 0, 0, 0, 1, 1,
2.17732, 0.05550012, 0.2691408, 0, 0, 0, 1, 1,
2.198378, -2.41697, 2.442751, 0, 0, 0, 1, 1,
2.289224, -1.915702, 1.75853, 0, 0, 0, 1, 1,
2.354774, 0.02782971, 1.170049, 1, 1, 1, 1, 1,
2.430815, 0.7420509, 0.6358733, 1, 1, 1, 1, 1,
2.473175, -0.1009976, 0.3889242, 1, 1, 1, 1, 1,
2.474005, 0.2136318, 0.3669949, 1, 1, 1, 1, 1,
2.488404, -1.321757, 1.590488, 1, 1, 1, 1, 1,
2.518162, -1.982935, 2.014311, 1, 1, 1, 1, 1,
2.6717, -0.7367385, 1.953942, 1, 1, 1, 1, 1
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
var radius = 9.331052;
var distance = 32.77492;
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
mvMatrix.translate( 0.3168641, -0.3588805, -0.03237152 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.77492);
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