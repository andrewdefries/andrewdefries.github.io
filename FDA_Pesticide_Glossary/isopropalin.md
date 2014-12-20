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
-3.09342, -1.000488, -2.89244, 1, 0, 0, 1,
-2.948932, -1.399958, -1.740476, 1, 0.007843138, 0, 1,
-2.853972, 0.4892855, 1.088456, 1, 0.01176471, 0, 1,
-2.787975, -0.2184979, -0.6882011, 1, 0.01960784, 0, 1,
-2.637795, -1.143188, -1.770596, 1, 0.02352941, 0, 1,
-2.547464, 0.1904532, -1.902137, 1, 0.03137255, 0, 1,
-2.534655, 0.06868359, -0.2500545, 1, 0.03529412, 0, 1,
-2.382592, 0.4012424, 0.7264302, 1, 0.04313726, 0, 1,
-2.307472, 0.9741217, -0.2063001, 1, 0.04705882, 0, 1,
-2.293051, 1.960154, -1.410453, 1, 0.05490196, 0, 1,
-2.271231, 0.4964584, -0.9919211, 1, 0.05882353, 0, 1,
-2.246919, -1.111174, -2.569596, 1, 0.06666667, 0, 1,
-2.241763, 0.4505815, -1.746474, 1, 0.07058824, 0, 1,
-2.221113, 0.7023003, -1.06972, 1, 0.07843138, 0, 1,
-2.188803, 0.1830763, -1.278784, 1, 0.08235294, 0, 1,
-2.130204, 1.186465, -2.281826, 1, 0.09019608, 0, 1,
-2.114221, -1.421449, -1.560104, 1, 0.09411765, 0, 1,
-2.054168, -1.142006, -1.545579, 1, 0.1019608, 0, 1,
-2.037319, 1.224657, -2.785451, 1, 0.1098039, 0, 1,
-2.001975, 0.3015495, -1.720049, 1, 0.1137255, 0, 1,
-1.990738, -0.7059497, -2.798287, 1, 0.1215686, 0, 1,
-1.988791, 0.4160435, -2.267516, 1, 0.1254902, 0, 1,
-1.987278, 0.5654832, -1.994371, 1, 0.1333333, 0, 1,
-1.98206, -1.021593, -3.390945, 1, 0.1372549, 0, 1,
-1.959105, 1.401905, -1.942158, 1, 0.145098, 0, 1,
-1.930697, 0.2730178, -2.198564, 1, 0.1490196, 0, 1,
-1.907296, -0.2798674, -2.622856, 1, 0.1568628, 0, 1,
-1.858158, -0.2583088, -1.391517, 1, 0.1607843, 0, 1,
-1.840081, -0.2195616, -3.942211, 1, 0.1686275, 0, 1,
-1.837123, 0.529892, -1.208431, 1, 0.172549, 0, 1,
-1.836054, -0.2478049, -0.5956354, 1, 0.1803922, 0, 1,
-1.833225, -0.8515885, -1.76273, 1, 0.1843137, 0, 1,
-1.829628, 0.3130275, -2.198118, 1, 0.1921569, 0, 1,
-1.827349, 0.4416618, -0.9661171, 1, 0.1960784, 0, 1,
-1.825024, 0.9523619, -3.456186, 1, 0.2039216, 0, 1,
-1.820214, 0.6165221, -1.606512, 1, 0.2117647, 0, 1,
-1.814311, 0.6347058, -0.2735819, 1, 0.2156863, 0, 1,
-1.794833, -0.214469, -1.613482, 1, 0.2235294, 0, 1,
-1.793873, 0.6649522, 0.03248678, 1, 0.227451, 0, 1,
-1.787984, 1.294325, -1.609049, 1, 0.2352941, 0, 1,
-1.786333, 1.639304, -0.1998599, 1, 0.2392157, 0, 1,
-1.772182, 0.2974215, -1.105241, 1, 0.2470588, 0, 1,
-1.769244, 1.430641, -1.258376, 1, 0.2509804, 0, 1,
-1.754167, 0.1374254, -2.569548, 1, 0.2588235, 0, 1,
-1.729107, -0.01771157, -2.011044, 1, 0.2627451, 0, 1,
-1.708625, 0.3452884, -0.3087412, 1, 0.2705882, 0, 1,
-1.706331, 0.8201426, -1.080391, 1, 0.2745098, 0, 1,
-1.691029, 0.9701835, 0.03740996, 1, 0.282353, 0, 1,
-1.677113, -1.241483, -4.497935, 1, 0.2862745, 0, 1,
-1.676986, 1.611107, -0.9271381, 1, 0.2941177, 0, 1,
-1.656693, -1.418647, -2.342545, 1, 0.3019608, 0, 1,
-1.653669, -0.04315209, -1.697856, 1, 0.3058824, 0, 1,
-1.641226, -0.4308519, -0.07937472, 1, 0.3137255, 0, 1,
-1.612902, 1.187144, 0.6631098, 1, 0.3176471, 0, 1,
-1.596076, 0.4733054, -0.7023274, 1, 0.3254902, 0, 1,
-1.581691, -0.2908715, -1.819548, 1, 0.3294118, 0, 1,
-1.57131, -0.6762003, -3.226854, 1, 0.3372549, 0, 1,
-1.565252, 1.92618, 1.111356, 1, 0.3411765, 0, 1,
-1.547834, -1.616726, -2.5362, 1, 0.3490196, 0, 1,
-1.545118, -0.5110981, -2.40582, 1, 0.3529412, 0, 1,
-1.528596, 0.5376582, -1.242061, 1, 0.3607843, 0, 1,
-1.513279, 0.8416749, -0.5862803, 1, 0.3647059, 0, 1,
-1.49529, -2.478571, -3.504486, 1, 0.372549, 0, 1,
-1.494223, 1.126776, -0.6195698, 1, 0.3764706, 0, 1,
-1.491114, 0.7432991, 0.7674789, 1, 0.3843137, 0, 1,
-1.487197, -2.031609, -2.064814, 1, 0.3882353, 0, 1,
-1.469074, 2.30961, 0.8863664, 1, 0.3960784, 0, 1,
-1.466515, -2.18903, -2.624522, 1, 0.4039216, 0, 1,
-1.463575, -1.100656, -2.381799, 1, 0.4078431, 0, 1,
-1.452333, 0.5182125, -1.65003, 1, 0.4156863, 0, 1,
-1.441267, 0.2022427, -1.93617, 1, 0.4196078, 0, 1,
-1.42693, 0.2261381, -2.197072, 1, 0.427451, 0, 1,
-1.423127, -0.7157644, -2.719881, 1, 0.4313726, 0, 1,
-1.420755, -0.05859019, -1.589166, 1, 0.4392157, 0, 1,
-1.419131, -1.420013, -2.427975, 1, 0.4431373, 0, 1,
-1.411664, -0.2521234, -0.6543144, 1, 0.4509804, 0, 1,
-1.396495, -0.100163, -0.6253824, 1, 0.454902, 0, 1,
-1.392631, -1.295731, -1.010913, 1, 0.4627451, 0, 1,
-1.391248, 0.3474824, -0.6742278, 1, 0.4666667, 0, 1,
-1.378894, -0.1078157, -1.986169, 1, 0.4745098, 0, 1,
-1.367449, -1.831293, -2.858196, 1, 0.4784314, 0, 1,
-1.354284, 0.8624215, -0.4065809, 1, 0.4862745, 0, 1,
-1.353792, -1.193124, -2.658201, 1, 0.4901961, 0, 1,
-1.352008, 1.841398, 0.08830787, 1, 0.4980392, 0, 1,
-1.346469, -0.4356283, -1.192737, 1, 0.5058824, 0, 1,
-1.344958, 1.776176, -0.8239409, 1, 0.509804, 0, 1,
-1.32675, -2.107543, -2.213109, 1, 0.5176471, 0, 1,
-1.315086, -1.097877, -1.716172, 1, 0.5215687, 0, 1,
-1.311684, 0.9411851, -1.242755, 1, 0.5294118, 0, 1,
-1.307684, 1.033008, -0.08588312, 1, 0.5333334, 0, 1,
-1.304002, 0.3861256, -1.841681, 1, 0.5411765, 0, 1,
-1.301719, 0.02183796, -1.630194, 1, 0.5450981, 0, 1,
-1.298132, 1.211135, -0.6673542, 1, 0.5529412, 0, 1,
-1.297028, -1.263141, -2.087316, 1, 0.5568628, 0, 1,
-1.289119, 0.1301202, -2.616615, 1, 0.5647059, 0, 1,
-1.287576, -0.2957847, -2.804137, 1, 0.5686275, 0, 1,
-1.282797, 1.353227, -0.6635987, 1, 0.5764706, 0, 1,
-1.281502, -0.2660694, -1.742319, 1, 0.5803922, 0, 1,
-1.276187, -1.903733, -2.58603, 1, 0.5882353, 0, 1,
-1.274871, -0.2349736, -0.4742991, 1, 0.5921569, 0, 1,
-1.274643, -0.3132653, -3.206062, 1, 0.6, 0, 1,
-1.257784, -1.462479, -3.030632, 1, 0.6078432, 0, 1,
-1.246705, 1.082821, 0.4372174, 1, 0.6117647, 0, 1,
-1.218713, -0.8008412, -0.9964746, 1, 0.6196079, 0, 1,
-1.208871, -0.5827244, -3.062193, 1, 0.6235294, 0, 1,
-1.205922, 0.7587129, -0.2264995, 1, 0.6313726, 0, 1,
-1.202937, 0.04900402, -1.342986, 1, 0.6352941, 0, 1,
-1.201881, 0.01003168, -0.7188754, 1, 0.6431373, 0, 1,
-1.201452, 2.133835, -1.179115, 1, 0.6470588, 0, 1,
-1.195158, 0.5009871, -0.6078002, 1, 0.654902, 0, 1,
-1.193887, -0.01486022, -1.839671, 1, 0.6588235, 0, 1,
-1.185953, 0.6016992, -0.1496769, 1, 0.6666667, 0, 1,
-1.179052, 2.253578, -1.535979, 1, 0.6705883, 0, 1,
-1.178935, -0.4966549, -1.630221, 1, 0.6784314, 0, 1,
-1.168229, -0.3471999, -0.8437357, 1, 0.682353, 0, 1,
-1.167258, -0.0195508, -2.890705, 1, 0.6901961, 0, 1,
-1.161468, 0.4472447, -3.108004, 1, 0.6941177, 0, 1,
-1.158327, -0.3524573, -1.515383, 1, 0.7019608, 0, 1,
-1.150275, -1.205926, -1.678724, 1, 0.7098039, 0, 1,
-1.150144, -0.8176744, -2.019516, 1, 0.7137255, 0, 1,
-1.149744, -2.216809, -3.755665, 1, 0.7215686, 0, 1,
-1.146889, -0.5328181, -2.698697, 1, 0.7254902, 0, 1,
-1.139455, -0.6963118, -1.323469, 1, 0.7333333, 0, 1,
-1.136489, -1.074324, -2.355088, 1, 0.7372549, 0, 1,
-1.123611, -0.8223774, -1.125908, 1, 0.7450981, 0, 1,
-1.122202, 0.7298957, -3.719811, 1, 0.7490196, 0, 1,
-1.117531, -0.1133955, -1.852129, 1, 0.7568628, 0, 1,
-1.11043, -0.6246296, -1.406061, 1, 0.7607843, 0, 1,
-1.109673, -1.850019, -2.557129, 1, 0.7686275, 0, 1,
-1.105596, 0.9557189, -1.303794, 1, 0.772549, 0, 1,
-1.098531, 1.389675, -2.32474, 1, 0.7803922, 0, 1,
-1.095394, 1.460238, 0.7444147, 1, 0.7843137, 0, 1,
-1.091662, -0.2731844, -1.577106, 1, 0.7921569, 0, 1,
-1.091042, -0.8900391, -0.1993093, 1, 0.7960784, 0, 1,
-1.089586, 0.2780608, -2.153128, 1, 0.8039216, 0, 1,
-1.089155, 0.08668867, -1.596121, 1, 0.8117647, 0, 1,
-1.081265, 1.234622, -0.5221559, 1, 0.8156863, 0, 1,
-1.070558, 0.5448696, -1.54689, 1, 0.8235294, 0, 1,
-1.07023, -0.3001702, -3.007543, 1, 0.827451, 0, 1,
-1.067997, 0.1127827, -1.562911, 1, 0.8352941, 0, 1,
-1.064863, -1.047042, -1.672037, 1, 0.8392157, 0, 1,
-1.063116, 1.080943, 0.7109975, 1, 0.8470588, 0, 1,
-1.058421, -0.6143396, -3.38688, 1, 0.8509804, 0, 1,
-1.057797, -0.7937613, -2.47512, 1, 0.8588235, 0, 1,
-1.051505, -0.4901669, -2.340668, 1, 0.8627451, 0, 1,
-1.046478, 0.9912114, -0.3432457, 1, 0.8705882, 0, 1,
-1.031975, 0.04822436, -2.310625, 1, 0.8745098, 0, 1,
-1.028985, 0.1695302, -1.129859, 1, 0.8823529, 0, 1,
-1.023181, 0.9376057, -1.237503, 1, 0.8862745, 0, 1,
-1.019909, -0.04561996, -3.448075, 1, 0.8941177, 0, 1,
-1.019167, -2.052655, -3.359266, 1, 0.8980392, 0, 1,
-1.01172, -1.121481, -2.447706, 1, 0.9058824, 0, 1,
-1.001696, -0.2206018, 0.8556159, 1, 0.9137255, 0, 1,
-1.001431, -1.104474, -3.117154, 1, 0.9176471, 0, 1,
-0.997879, 0.2170904, -0.5772268, 1, 0.9254902, 0, 1,
-0.9950384, -0.02949447, 0.2744153, 1, 0.9294118, 0, 1,
-0.9933763, -0.3063816, -2.757121, 1, 0.9372549, 0, 1,
-0.9900483, 0.9367216, -0.01484373, 1, 0.9411765, 0, 1,
-0.9889451, 2.404284, 0.2894675, 1, 0.9490196, 0, 1,
-0.9856263, 0.7539465, -0.8832825, 1, 0.9529412, 0, 1,
-0.9851568, -1.742033, -1.16644, 1, 0.9607843, 0, 1,
-0.967716, -0.0439036, -2.07206, 1, 0.9647059, 0, 1,
-0.967574, 0.276461, -2.631978, 1, 0.972549, 0, 1,
-0.9672835, -0.006743171, -0.03623144, 1, 0.9764706, 0, 1,
-0.9655578, -0.3034976, -0.6780729, 1, 0.9843137, 0, 1,
-0.9654923, -0.3175324, -2.625491, 1, 0.9882353, 0, 1,
-0.9619588, -0.8340088, -3.803704, 1, 0.9960784, 0, 1,
-0.9482439, 0.2575177, -2.349642, 0.9960784, 1, 0, 1,
-0.9481161, -1.012872, -1.926506, 0.9921569, 1, 0, 1,
-0.9438105, -0.1768179, -2.400844, 0.9843137, 1, 0, 1,
-0.9407082, 0.7073513, -0.678051, 0.9803922, 1, 0, 1,
-0.931128, -2.224124, -2.92955, 0.972549, 1, 0, 1,
-0.927314, -0.2577651, -2.02563, 0.9686275, 1, 0, 1,
-0.9244191, 0.2690451, -0.149504, 0.9607843, 1, 0, 1,
-0.9242178, -0.139963, -2.424726, 0.9568627, 1, 0, 1,
-0.9201376, -0.2886349, -2.886491, 0.9490196, 1, 0, 1,
-0.9130424, -0.6744022, 0.2049453, 0.945098, 1, 0, 1,
-0.9112371, 0.4038998, 1.532109, 0.9372549, 1, 0, 1,
-0.9063226, 0.9181795, -0.7147352, 0.9333333, 1, 0, 1,
-0.9053444, 2.244229, -0.5271872, 0.9254902, 1, 0, 1,
-0.9035891, 0.2275139, -1.059332, 0.9215686, 1, 0, 1,
-0.8963791, -0.8255895, -0.9395069, 0.9137255, 1, 0, 1,
-0.8953675, 0.3177934, -1.311366, 0.9098039, 1, 0, 1,
-0.8881976, -1.752318, -1.93631, 0.9019608, 1, 0, 1,
-0.887489, 0.02485066, -2.594005, 0.8941177, 1, 0, 1,
-0.8859735, 0.4192772, -2.062796, 0.8901961, 1, 0, 1,
-0.8850567, 0.5063624, -2.937613, 0.8823529, 1, 0, 1,
-0.87457, 0.2102714, -1.919825, 0.8784314, 1, 0, 1,
-0.8740583, 1.110165, -0.7522995, 0.8705882, 1, 0, 1,
-0.8738258, -0.7928503, -4.479132, 0.8666667, 1, 0, 1,
-0.8722883, -1.532379, -1.728583, 0.8588235, 1, 0, 1,
-0.872287, -2.219128, -2.598749, 0.854902, 1, 0, 1,
-0.8717124, 0.2021746, -1.099996, 0.8470588, 1, 0, 1,
-0.8656593, -1.311578, -3.095492, 0.8431373, 1, 0, 1,
-0.8603774, 0.6059931, -0.1083384, 0.8352941, 1, 0, 1,
-0.8540555, -0.1687033, -0.3972473, 0.8313726, 1, 0, 1,
-0.8532009, 0.1910296, -2.926139, 0.8235294, 1, 0, 1,
-0.8507443, -1.722834, -0.7756609, 0.8196079, 1, 0, 1,
-0.8376482, 0.6417689, 0.2094186, 0.8117647, 1, 0, 1,
-0.8359321, -0.6378232, -0.7366498, 0.8078431, 1, 0, 1,
-0.8324529, 0.5160056, -3.011541, 0.8, 1, 0, 1,
-0.8314006, 0.3593196, -1.280989, 0.7921569, 1, 0, 1,
-0.8296302, 0.2399413, -1.130716, 0.7882353, 1, 0, 1,
-0.820227, -0.7062948, -2.399015, 0.7803922, 1, 0, 1,
-0.8035433, -1.227422, -2.184473, 0.7764706, 1, 0, 1,
-0.7953979, -0.1042575, -1.776333, 0.7686275, 1, 0, 1,
-0.7912472, -0.06815924, -2.013149, 0.7647059, 1, 0, 1,
-0.7893944, 0.9520731, -1.904509, 0.7568628, 1, 0, 1,
-0.7888202, 1.129175, 0.3130408, 0.7529412, 1, 0, 1,
-0.7824991, 0.2672858, -1.065002, 0.7450981, 1, 0, 1,
-0.7804345, 0.3646869, -0.6683517, 0.7411765, 1, 0, 1,
-0.7803294, -1.974874, -4.062829, 0.7333333, 1, 0, 1,
-0.7787418, -0.6158633, -2.12661, 0.7294118, 1, 0, 1,
-0.7784706, -0.684845, -3.578996, 0.7215686, 1, 0, 1,
-0.7754933, 0.5006464, -1.721176, 0.7176471, 1, 0, 1,
-0.7696692, 0.625443, -0.9697773, 0.7098039, 1, 0, 1,
-0.7662625, 0.6373207, 0.1097861, 0.7058824, 1, 0, 1,
-0.7652892, -0.5108305, -1.62494, 0.6980392, 1, 0, 1,
-0.7583528, -1.595082, -3.612294, 0.6901961, 1, 0, 1,
-0.756682, -0.834745, -3.090096, 0.6862745, 1, 0, 1,
-0.7454145, 0.9095074, -0.5414624, 0.6784314, 1, 0, 1,
-0.7434396, -0.4636267, -1.803122, 0.6745098, 1, 0, 1,
-0.7357737, -0.169923, -1.412814, 0.6666667, 1, 0, 1,
-0.7333285, 0.6871722, -0.9345278, 0.6627451, 1, 0, 1,
-0.7229815, 0.3317085, -0.03910724, 0.654902, 1, 0, 1,
-0.7221544, -0.2182432, -2.407062, 0.6509804, 1, 0, 1,
-0.7160497, 0.681164, -1.779299, 0.6431373, 1, 0, 1,
-0.7129576, -0.1548413, -4.309304, 0.6392157, 1, 0, 1,
-0.7123691, -1.338972, -2.92308, 0.6313726, 1, 0, 1,
-0.7090055, 1.321886, -0.4320257, 0.627451, 1, 0, 1,
-0.7073977, 1.830593, -0.4037118, 0.6196079, 1, 0, 1,
-0.704653, -0.2369523, -1.438948, 0.6156863, 1, 0, 1,
-0.6984903, 0.2089128, -3.050142, 0.6078432, 1, 0, 1,
-0.6968814, 1.432542, 0.6260585, 0.6039216, 1, 0, 1,
-0.695069, 1.018836, -0.02173395, 0.5960785, 1, 0, 1,
-0.6939288, -0.01675829, -1.825493, 0.5882353, 1, 0, 1,
-0.6936583, 1.03365, -1.556169, 0.5843138, 1, 0, 1,
-0.6911699, -2.135618, -3.144606, 0.5764706, 1, 0, 1,
-0.6779447, -2.012054, -1.207978, 0.572549, 1, 0, 1,
-0.6776369, -1.149287, -3.967231, 0.5647059, 1, 0, 1,
-0.6769528, -0.4858018, -2.193991, 0.5607843, 1, 0, 1,
-0.6768713, 1.216949, -3.29667, 0.5529412, 1, 0, 1,
-0.6762183, -1.001194, -2.517794, 0.5490196, 1, 0, 1,
-0.6714376, 0.8255138, -1.593706, 0.5411765, 1, 0, 1,
-0.6711282, -0.6403328, -2.654655, 0.5372549, 1, 0, 1,
-0.6693951, -0.1963583, -0.9873049, 0.5294118, 1, 0, 1,
-0.6692507, 1.465838, 0.03152803, 0.5254902, 1, 0, 1,
-0.6688118, -0.3510353, -2.073827, 0.5176471, 1, 0, 1,
-0.6680635, -1.57761, -2.103852, 0.5137255, 1, 0, 1,
-0.6668249, -0.8498327, -2.774248, 0.5058824, 1, 0, 1,
-0.6665971, -0.5178927, -2.560735, 0.5019608, 1, 0, 1,
-0.6632996, -1.594979, -4.585268, 0.4941176, 1, 0, 1,
-0.6576034, 1.19023, 0.2279196, 0.4862745, 1, 0, 1,
-0.6567131, -1.031433, -1.237071, 0.4823529, 1, 0, 1,
-0.6562612, 0.7501608, 0.2542101, 0.4745098, 1, 0, 1,
-0.6523828, 0.660102, -2.989486, 0.4705882, 1, 0, 1,
-0.6508726, -0.3239046, -2.583639, 0.4627451, 1, 0, 1,
-0.649592, -0.9228113, -3.339325, 0.4588235, 1, 0, 1,
-0.649356, -0.5929788, -2.435235, 0.4509804, 1, 0, 1,
-0.6488206, 1.167965, -0.2098086, 0.4470588, 1, 0, 1,
-0.6480039, 1.635166, -0.4988565, 0.4392157, 1, 0, 1,
-0.6468831, 1.208552, 0.05890291, 0.4352941, 1, 0, 1,
-0.6415109, 0.02973845, -3.226536, 0.427451, 1, 0, 1,
-0.6407708, 2.308991, 0.1250526, 0.4235294, 1, 0, 1,
-0.6400639, 0.3254431, -0.4190829, 0.4156863, 1, 0, 1,
-0.6333376, 2.28543, -0.015731, 0.4117647, 1, 0, 1,
-0.6324037, -2.065519, -3.054328, 0.4039216, 1, 0, 1,
-0.6300716, 0.7918503, -2.692201, 0.3960784, 1, 0, 1,
-0.629302, -1.438303, -2.504846, 0.3921569, 1, 0, 1,
-0.6255445, 1.165509, -2.225543, 0.3843137, 1, 0, 1,
-0.6001694, -0.6667337, -3.472921, 0.3803922, 1, 0, 1,
-0.5975693, -1.805927, -3.181185, 0.372549, 1, 0, 1,
-0.5946059, 0.07871781, -2.606221, 0.3686275, 1, 0, 1,
-0.590107, 0.7221674, 0.3769299, 0.3607843, 1, 0, 1,
-0.5885541, -1.893379, -0.978753, 0.3568628, 1, 0, 1,
-0.579042, 0.5062168, 1.107855, 0.3490196, 1, 0, 1,
-0.577376, -1.353559, -2.536184, 0.345098, 1, 0, 1,
-0.5708373, -0.4508566, -1.35153, 0.3372549, 1, 0, 1,
-0.5661495, -0.5816894, -3.474849, 0.3333333, 1, 0, 1,
-0.5654628, -0.2335605, -1.750006, 0.3254902, 1, 0, 1,
-0.5633904, 0.4352669, -2.391616, 0.3215686, 1, 0, 1,
-0.5632265, 0.5024615, -0.1532256, 0.3137255, 1, 0, 1,
-0.56096, 0.07048181, -2.067999, 0.3098039, 1, 0, 1,
-0.557443, -0.3798265, -1.949323, 0.3019608, 1, 0, 1,
-0.5537488, -2.352334, -2.989153, 0.2941177, 1, 0, 1,
-0.5460703, -0.4327248, -2.63306, 0.2901961, 1, 0, 1,
-0.5444311, 1.390044, 0.9224869, 0.282353, 1, 0, 1,
-0.5410577, -0.7532472, -1.525823, 0.2784314, 1, 0, 1,
-0.5391243, -1.657199, -3.213934, 0.2705882, 1, 0, 1,
-0.5375068, -1.83298, -1.553644, 0.2666667, 1, 0, 1,
-0.5290246, 0.6936051, -2.44084, 0.2588235, 1, 0, 1,
-0.5273684, 0.9360381, -0.7322623, 0.254902, 1, 0, 1,
-0.5254068, 1.997091, -0.9966066, 0.2470588, 1, 0, 1,
-0.5175614, -0.4134478, -2.508333, 0.2431373, 1, 0, 1,
-0.5167628, -0.5669948, -3.285345, 0.2352941, 1, 0, 1,
-0.5161558, -2.065209, -2.666576, 0.2313726, 1, 0, 1,
-0.511345, 1.52542, -1.005675, 0.2235294, 1, 0, 1,
-0.5112746, -2.819445, -3.711052, 0.2196078, 1, 0, 1,
-0.5087604, 0.8484769, 0.2059981, 0.2117647, 1, 0, 1,
-0.5085987, -0.6545293, -2.037725, 0.2078431, 1, 0, 1,
-0.5073166, -0.2875815, -2.601613, 0.2, 1, 0, 1,
-0.507099, 0.09235554, -0.8607532, 0.1921569, 1, 0, 1,
-0.5068483, -0.6186657, -2.003866, 0.1882353, 1, 0, 1,
-0.5006722, 0.3802506, 0.4025231, 0.1803922, 1, 0, 1,
-0.5003783, -0.9885636, -1.366283, 0.1764706, 1, 0, 1,
-0.500331, -0.07409646, -1.960518, 0.1686275, 1, 0, 1,
-0.4948783, 0.2647319, -0.9890679, 0.1647059, 1, 0, 1,
-0.4946988, 0.004270625, -1.856307, 0.1568628, 1, 0, 1,
-0.49281, -1.003412, -3.796274, 0.1529412, 1, 0, 1,
-0.4910741, 0.4372528, -1.275951, 0.145098, 1, 0, 1,
-0.4905189, -0.9386074, 0.1238633, 0.1411765, 1, 0, 1,
-0.4887496, 1.81424, -1.519915, 0.1333333, 1, 0, 1,
-0.4884583, -1.517302, -4.310091, 0.1294118, 1, 0, 1,
-0.4851572, 0.6269688, 0.8006591, 0.1215686, 1, 0, 1,
-0.484145, 0.4945765, -0.5987969, 0.1176471, 1, 0, 1,
-0.4794472, -0.7420539, -4.098869, 0.1098039, 1, 0, 1,
-0.4788853, 0.2100586, -0.436864, 0.1058824, 1, 0, 1,
-0.4767242, -0.4704296, -3.856416, 0.09803922, 1, 0, 1,
-0.4741883, 0.4672098, 0.5740014, 0.09019608, 1, 0, 1,
-0.4723853, 1.529993, 1.198819, 0.08627451, 1, 0, 1,
-0.4722055, -0.176655, -2.457694, 0.07843138, 1, 0, 1,
-0.4700164, 0.354801, -1.372117, 0.07450981, 1, 0, 1,
-0.4664616, -0.376813, -2.504294, 0.06666667, 1, 0, 1,
-0.4553409, -1.110734, -1.905825, 0.0627451, 1, 0, 1,
-0.4547147, 0.4733439, -1.798101, 0.05490196, 1, 0, 1,
-0.4512684, -0.5016403, -3.258027, 0.05098039, 1, 0, 1,
-0.4512431, -0.4501354, -1.351102, 0.04313726, 1, 0, 1,
-0.4508181, 0.488791, -1.970137, 0.03921569, 1, 0, 1,
-0.4483921, -0.7727857, -2.355067, 0.03137255, 1, 0, 1,
-0.447963, 0.6531003, 1.266638, 0.02745098, 1, 0, 1,
-0.4475225, 0.03575517, -2.582178, 0.01960784, 1, 0, 1,
-0.4467221, -0.5604058, -2.510126, 0.01568628, 1, 0, 1,
-0.4436645, 1.868208, 1.438002, 0.007843138, 1, 0, 1,
-0.4430926, 1.80721, 0.4925135, 0.003921569, 1, 0, 1,
-0.4418148, -0.6409629, -0.8281826, 0, 1, 0.003921569, 1,
-0.4410551, -0.3897752, -3.373855, 0, 1, 0.01176471, 1,
-0.4185431, -0.2698802, -2.859828, 0, 1, 0.01568628, 1,
-0.41482, -0.8500039, -1.38116, 0, 1, 0.02352941, 1,
-0.4144942, 0.8308431, -0.101788, 0, 1, 0.02745098, 1,
-0.4097692, -0.2706183, -2.482798, 0, 1, 0.03529412, 1,
-0.4063424, 0.662954, 0.3606395, 0, 1, 0.03921569, 1,
-0.4035667, -0.04971286, -1.856732, 0, 1, 0.04705882, 1,
-0.4012293, 0.9194216, -0.4940789, 0, 1, 0.05098039, 1,
-0.4008226, 0.4387835, -1.360144, 0, 1, 0.05882353, 1,
-0.3989286, 1.251765, 2.147437, 0, 1, 0.0627451, 1,
-0.3988336, 0.02156477, -1.850891, 0, 1, 0.07058824, 1,
-0.394293, -1.108478, -5.229398, 0, 1, 0.07450981, 1,
-0.3927244, 1.371915, -1.682962, 0, 1, 0.08235294, 1,
-0.3907403, 0.4438755, -2.012904, 0, 1, 0.08627451, 1,
-0.3896701, -0.8584554, -4.325442, 0, 1, 0.09411765, 1,
-0.3862416, -1.02356, -2.116208, 0, 1, 0.1019608, 1,
-0.377997, -0.9480253, -1.2179, 0, 1, 0.1058824, 1,
-0.3773128, 1.222909, -0.4950133, 0, 1, 0.1137255, 1,
-0.375956, -0.483247, -1.468383, 0, 1, 0.1176471, 1,
-0.3747244, 2.178813, 0.2426042, 0, 1, 0.1254902, 1,
-0.3715755, 0.7541709, -0.08148585, 0, 1, 0.1294118, 1,
-0.3700955, -1.286775, -1.519762, 0, 1, 0.1372549, 1,
-0.3671761, 0.6146563, -0.3601621, 0, 1, 0.1411765, 1,
-0.3665343, -1.193218, -2.686113, 0, 1, 0.1490196, 1,
-0.3654346, -1.142516, -2.628928, 0, 1, 0.1529412, 1,
-0.3642856, 1.531951, -0.9131645, 0, 1, 0.1607843, 1,
-0.3621092, -1.852428, -2.826077, 0, 1, 0.1647059, 1,
-0.3616826, 0.3251593, -2.247941, 0, 1, 0.172549, 1,
-0.3572659, -0.149673, -0.5854385, 0, 1, 0.1764706, 1,
-0.3567048, -0.2372954, -2.657254, 0, 1, 0.1843137, 1,
-0.3547689, 0.3438266, 0.3759595, 0, 1, 0.1882353, 1,
-0.3527732, -0.309583, -3.284261, 0, 1, 0.1960784, 1,
-0.3500631, 0.7771549, 1.486572, 0, 1, 0.2039216, 1,
-0.3497485, 2.141733, -0.874678, 0, 1, 0.2078431, 1,
-0.3477541, 0.04570734, -0.6490084, 0, 1, 0.2156863, 1,
-0.3460656, 0.7205893, -1.534132, 0, 1, 0.2196078, 1,
-0.3451659, -0.5924052, -5.087024, 0, 1, 0.227451, 1,
-0.3427948, 1.360489, -0.3498009, 0, 1, 0.2313726, 1,
-0.338172, 0.835471, -1.120985, 0, 1, 0.2392157, 1,
-0.3359391, -1.136004, -3.250024, 0, 1, 0.2431373, 1,
-0.3339708, 0.02339589, -2.244143, 0, 1, 0.2509804, 1,
-0.3297157, 0.2157269, -0.7295251, 0, 1, 0.254902, 1,
-0.328975, 0.4444992, -0.1649382, 0, 1, 0.2627451, 1,
-0.3252681, 1.204705, 0.6008093, 0, 1, 0.2666667, 1,
-0.3227194, -0.587197, -5.246292, 0, 1, 0.2745098, 1,
-0.3213831, -0.008779673, -2.854155, 0, 1, 0.2784314, 1,
-0.3203058, -1.677897, -4.281296, 0, 1, 0.2862745, 1,
-0.3178975, -0.8466832, -3.564507, 0, 1, 0.2901961, 1,
-0.3159385, -0.2362004, -2.884603, 0, 1, 0.2980392, 1,
-0.3147556, -0.4360989, -0.3111062, 0, 1, 0.3058824, 1,
-0.3114097, 1.153892, 0.6128156, 0, 1, 0.3098039, 1,
-0.3085144, 0.04833049, -0.7762541, 0, 1, 0.3176471, 1,
-0.3005678, 0.6969478, 0.1731768, 0, 1, 0.3215686, 1,
-0.2977254, -0.1392901, -1.23379, 0, 1, 0.3294118, 1,
-0.2940248, 2.024272, -0.9323504, 0, 1, 0.3333333, 1,
-0.2929995, -0.2622367, -2.227612, 0, 1, 0.3411765, 1,
-0.2898632, -1.54795, -2.649112, 0, 1, 0.345098, 1,
-0.2874387, -0.2477061, -0.4477117, 0, 1, 0.3529412, 1,
-0.2859147, 0.4161061, -0.2166821, 0, 1, 0.3568628, 1,
-0.284647, -1.058706, -3.862916, 0, 1, 0.3647059, 1,
-0.2833866, 0.3801627, -1.065395, 0, 1, 0.3686275, 1,
-0.2656315, 0.5147552, 0.6429766, 0, 1, 0.3764706, 1,
-0.2649454, 0.1621034, -1.863332, 0, 1, 0.3803922, 1,
-0.2640635, -2.112022, -3.809767, 0, 1, 0.3882353, 1,
-0.2624483, 0.1010831, -0.6608036, 0, 1, 0.3921569, 1,
-0.2619541, -0.1606845, -3.083753, 0, 1, 0.4, 1,
-0.261323, 2.39292, 0.1357002, 0, 1, 0.4078431, 1,
-0.2611253, -1.413239, -2.346763, 0, 1, 0.4117647, 1,
-0.260711, -1.777489, -1.800774, 0, 1, 0.4196078, 1,
-0.2593123, -0.926888, -2.366619, 0, 1, 0.4235294, 1,
-0.2558577, 0.9245231, -0.4356323, 0, 1, 0.4313726, 1,
-0.2543513, -0.09917364, -1.693143, 0, 1, 0.4352941, 1,
-0.2527526, -0.6522253, -1.86632, 0, 1, 0.4431373, 1,
-0.2487176, -2.093766, -1.694196, 0, 1, 0.4470588, 1,
-0.2431681, -2.170519, -3.404335, 0, 1, 0.454902, 1,
-0.2416434, 0.7050871, -2.194927, 0, 1, 0.4588235, 1,
-0.2381473, -0.7342575, -3.171709, 0, 1, 0.4666667, 1,
-0.2374456, -1.410897, -3.159816, 0, 1, 0.4705882, 1,
-0.2331246, 0.361958, -0.7584565, 0, 1, 0.4784314, 1,
-0.2290591, 0.61922, -0.6169705, 0, 1, 0.4823529, 1,
-0.2249517, 0.1971775, 0.7977291, 0, 1, 0.4901961, 1,
-0.2188616, 0.03501778, -1.423634, 0, 1, 0.4941176, 1,
-0.2155463, 0.7529073, -0.7032477, 0, 1, 0.5019608, 1,
-0.2153767, -0.2931787, -2.146921, 0, 1, 0.509804, 1,
-0.2150927, 0.9853085, 0.4621924, 0, 1, 0.5137255, 1,
-0.2141234, 0.3753584, 1.222357, 0, 1, 0.5215687, 1,
-0.2123089, -0.768246, -2.855692, 0, 1, 0.5254902, 1,
-0.2119559, 3.524865, 0.3479367, 0, 1, 0.5333334, 1,
-0.2112096, 1.649016, -0.507126, 0, 1, 0.5372549, 1,
-0.2104603, 0.740133, -0.5577636, 0, 1, 0.5450981, 1,
-0.2098259, 0.1597604, -3.215481, 0, 1, 0.5490196, 1,
-0.2033363, 1.04452, 0.3839612, 0, 1, 0.5568628, 1,
-0.2029164, 2.58139, -0.230249, 0, 1, 0.5607843, 1,
-0.2009104, 0.8720219, -0.9088489, 0, 1, 0.5686275, 1,
-0.1992695, 0.6599211, 0.6449931, 0, 1, 0.572549, 1,
-0.1923197, -0.7236684, -3.213018, 0, 1, 0.5803922, 1,
-0.1920125, 0.779283, 1.49511, 0, 1, 0.5843138, 1,
-0.1912711, 0.08953607, -0.2227243, 0, 1, 0.5921569, 1,
-0.1873169, 1.835634, 0.2154703, 0, 1, 0.5960785, 1,
-0.1832189, -0.4200287, -0.992085, 0, 1, 0.6039216, 1,
-0.1793827, 0.225773, 0.01747449, 0, 1, 0.6117647, 1,
-0.1729746, 1.846105, 0.5771365, 0, 1, 0.6156863, 1,
-0.1699851, -0.1617147, -2.148835, 0, 1, 0.6235294, 1,
-0.165599, -0.7930079, -2.436212, 0, 1, 0.627451, 1,
-0.1597662, 1.767684, 0.6235152, 0, 1, 0.6352941, 1,
-0.1595781, -0.154802, -2.899024, 0, 1, 0.6392157, 1,
-0.159039, 0.8748904, 0.4376236, 0, 1, 0.6470588, 1,
-0.1584506, -0.2569917, -1.504538, 0, 1, 0.6509804, 1,
-0.1553372, -0.6719783, -3.59307, 0, 1, 0.6588235, 1,
-0.152029, 0.1553497, -0.9280018, 0, 1, 0.6627451, 1,
-0.1520007, -0.06842517, -1.104622, 0, 1, 0.6705883, 1,
-0.1510506, -0.9823122, -4.253336, 0, 1, 0.6745098, 1,
-0.1465756, -0.7770806, -4.150387, 0, 1, 0.682353, 1,
-0.1460522, 0.5526327, -0.2771795, 0, 1, 0.6862745, 1,
-0.1415185, 2.758923, 1.825004, 0, 1, 0.6941177, 1,
-0.1407125, -1.476371, -1.041583, 0, 1, 0.7019608, 1,
-0.1368276, 0.09613714, 0.5962672, 0, 1, 0.7058824, 1,
-0.1361378, 0.3032845, -0.4708729, 0, 1, 0.7137255, 1,
-0.1360693, 0.6108189, 0.9764781, 0, 1, 0.7176471, 1,
-0.135451, -0.3310374, -4.489288, 0, 1, 0.7254902, 1,
-0.1343477, 0.840044, 0.4006653, 0, 1, 0.7294118, 1,
-0.1334532, -0.2189008, -3.318514, 0, 1, 0.7372549, 1,
-0.1294268, 1.663864, -0.1664277, 0, 1, 0.7411765, 1,
-0.1288843, -0.6611081, -3.367128, 0, 1, 0.7490196, 1,
-0.1160824, 0.4833513, -1.919017, 0, 1, 0.7529412, 1,
-0.1133384, 0.5044419, -0.03088042, 0, 1, 0.7607843, 1,
-0.1130758, -0.7334606, -1.953014, 0, 1, 0.7647059, 1,
-0.1126536, -1.112777, -1.962836, 0, 1, 0.772549, 1,
-0.1079135, 0.1802448, -1.511732, 0, 1, 0.7764706, 1,
-0.1073502, 0.2255684, -0.8270667, 0, 1, 0.7843137, 1,
-0.1036233, -0.1555425, -1.687854, 0, 1, 0.7882353, 1,
-0.102889, 0.2521792, -0.3736768, 0, 1, 0.7960784, 1,
-0.09918581, -1.389725, -2.373396, 0, 1, 0.8039216, 1,
-0.09748084, 0.6771671, -0.0803744, 0, 1, 0.8078431, 1,
-0.09692113, -0.8688861, -3.902387, 0, 1, 0.8156863, 1,
-0.09459426, 1.101559, 0.5752654, 0, 1, 0.8196079, 1,
-0.09452377, 1.117133, -0.5924396, 0, 1, 0.827451, 1,
-0.09227227, -1.277615, -2.50485, 0, 1, 0.8313726, 1,
-0.08660948, 0.6465353, -0.7782801, 0, 1, 0.8392157, 1,
-0.08629643, 0.1654921, -0.03738437, 0, 1, 0.8431373, 1,
-0.08336368, 2.275391, -0.2284118, 0, 1, 0.8509804, 1,
-0.08294033, -0.2324728, -3.617283, 0, 1, 0.854902, 1,
-0.08244997, 0.0639152, 0.5640513, 0, 1, 0.8627451, 1,
-0.08193112, 0.7985019, -2.193784, 0, 1, 0.8666667, 1,
-0.0801117, 1.685709, -0.1236844, 0, 1, 0.8745098, 1,
-0.07926705, 0.9751975, 1.465871, 0, 1, 0.8784314, 1,
-0.07790676, -0.3058745, -2.286689, 0, 1, 0.8862745, 1,
-0.07517532, 1.28554, -0.7390543, 0, 1, 0.8901961, 1,
-0.07495204, -0.2390976, -1.970112, 0, 1, 0.8980392, 1,
-0.07053336, 0.2798267, 0.5781143, 0, 1, 0.9058824, 1,
-0.06469236, -0.8655947, -2.34736, 0, 1, 0.9098039, 1,
-0.0639827, 0.9668384, -0.6855097, 0, 1, 0.9176471, 1,
-0.06040446, 0.2821827, 1.81143, 0, 1, 0.9215686, 1,
-0.05348801, 1.023071, 0.4533708, 0, 1, 0.9294118, 1,
-0.05334895, 0.06578677, -0.09238102, 0, 1, 0.9333333, 1,
-0.05007221, 1.068056, -0.9669475, 0, 1, 0.9411765, 1,
-0.04985537, -0.8933581, -2.331862, 0, 1, 0.945098, 1,
-0.04755762, 0.9143388, -0.003261011, 0, 1, 0.9529412, 1,
-0.04598249, 0.174762, 0.04772125, 0, 1, 0.9568627, 1,
-0.04079454, -0.7426684, -3.096793, 0, 1, 0.9647059, 1,
-0.04050489, 2.2104, 1.92838, 0, 1, 0.9686275, 1,
-0.03797286, -0.7409573, -2.647796, 0, 1, 0.9764706, 1,
-0.0356985, 1.089468, -0.3200812, 0, 1, 0.9803922, 1,
-0.03452545, 1.134741, -0.1814286, 0, 1, 0.9882353, 1,
-0.03096908, -0.3949815, -0.1562829, 0, 1, 0.9921569, 1,
-0.03039095, -1.66845, -4.884552, 0, 1, 1, 1,
-0.02932665, 1.303814, 0.06014396, 0, 0.9921569, 1, 1,
-0.0232296, 0.4680748, 2.165302, 0, 0.9882353, 1, 1,
-0.01908499, 1.024579, 1.670817, 0, 0.9803922, 1, 1,
-0.01863462, 0.4911039, -0.9568099, 0, 0.9764706, 1, 1,
-0.003271754, -0.3679793, -4.382835, 0, 0.9686275, 1, 1,
-0.001204491, -0.4243328, -2.42039, 0, 0.9647059, 1, 1,
0.003443914, 1.025227, 1.582412, 0, 0.9568627, 1, 1,
0.008805801, -0.4580121, 4.945543, 0, 0.9529412, 1, 1,
0.01044133, -0.9781916, 4.587448, 0, 0.945098, 1, 1,
0.01284423, 1.988854, 0.2273218, 0, 0.9411765, 1, 1,
0.0135767, 0.570802, -0.8713589, 0, 0.9333333, 1, 1,
0.01700211, 0.1817906, -1.851086, 0, 0.9294118, 1, 1,
0.01717828, 0.04930829, 0.4032615, 0, 0.9215686, 1, 1,
0.01965184, -1.085038, 4.485643, 0, 0.9176471, 1, 1,
0.0207755, 0.420941, -0.1587783, 0, 0.9098039, 1, 1,
0.02136716, 0.06860357, 0.8792281, 0, 0.9058824, 1, 1,
0.02174019, 0.1226435, 0.3866185, 0, 0.8980392, 1, 1,
0.02735861, 1.012253, 0.6611646, 0, 0.8901961, 1, 1,
0.02829437, -0.525438, 3.843103, 0, 0.8862745, 1, 1,
0.02901244, 0.6227054, 0.05194454, 0, 0.8784314, 1, 1,
0.03003745, 0.6707553, -1.491867, 0, 0.8745098, 1, 1,
0.03005392, 0.1305199, 0.3881324, 0, 0.8666667, 1, 1,
0.03118155, -0.7522764, 2.245929, 0, 0.8627451, 1, 1,
0.03435707, -2.245953, 2.773144, 0, 0.854902, 1, 1,
0.03519805, -0.048228, 2.82217, 0, 0.8509804, 1, 1,
0.03652423, -0.9060798, 3.60812, 0, 0.8431373, 1, 1,
0.04746775, 0.4267774, 0.9834684, 0, 0.8392157, 1, 1,
0.05138485, -0.2367747, 4.973746, 0, 0.8313726, 1, 1,
0.05369995, 1.419904, 0.04327107, 0, 0.827451, 1, 1,
0.05640602, 0.5647005, -0.2813064, 0, 0.8196079, 1, 1,
0.05957249, 0.4272007, 0.5937648, 0, 0.8156863, 1, 1,
0.06118651, 0.5735573, 0.6647659, 0, 0.8078431, 1, 1,
0.06507529, -0.284591, 3.516182, 0, 0.8039216, 1, 1,
0.06513584, -0.1001424, 1.92679, 0, 0.7960784, 1, 1,
0.06584027, -0.8466324, 3.982059, 0, 0.7882353, 1, 1,
0.06945228, -2.08479, 4.473263, 0, 0.7843137, 1, 1,
0.07093292, -0.6111089, 5.129537, 0, 0.7764706, 1, 1,
0.07275334, 0.1000821, -0.1542669, 0, 0.772549, 1, 1,
0.07313734, -1.089708, 3.555159, 0, 0.7647059, 1, 1,
0.0751447, -0.2544731, 3.960588, 0, 0.7607843, 1, 1,
0.07627863, -0.4837296, 0.9955885, 0, 0.7529412, 1, 1,
0.08197633, -1.218745, 2.859975, 0, 0.7490196, 1, 1,
0.08219548, 0.2106009, 0.5676209, 0, 0.7411765, 1, 1,
0.0826965, -1.352608, 1.628732, 0, 0.7372549, 1, 1,
0.09038636, 1.317087, 1.286485, 0, 0.7294118, 1, 1,
0.09603955, 0.412933, 2.130614, 0, 0.7254902, 1, 1,
0.09649723, 0.07924513, 0.7374072, 0, 0.7176471, 1, 1,
0.1074273, 0.9994999, 0.1049265, 0, 0.7137255, 1, 1,
0.1110249, 2.02355, -0.3714539, 0, 0.7058824, 1, 1,
0.1114298, -1.026473, 2.818362, 0, 0.6980392, 1, 1,
0.1119759, -0.253132, 2.105647, 0, 0.6941177, 1, 1,
0.1159355, -1.52757, 3.975563, 0, 0.6862745, 1, 1,
0.118648, -1.184005, 1.291709, 0, 0.682353, 1, 1,
0.1194484, -1.378623, 2.785359, 0, 0.6745098, 1, 1,
0.1237962, 0.8083684, -1.782192, 0, 0.6705883, 1, 1,
0.1245596, -0.8241959, 3.214097, 0, 0.6627451, 1, 1,
0.1255615, 0.1482798, 0.3646477, 0, 0.6588235, 1, 1,
0.1267704, -0.2507278, 0.3274948, 0, 0.6509804, 1, 1,
0.1285324, -0.7439891, 3.109344, 0, 0.6470588, 1, 1,
0.1305773, -0.1269928, 3.990626, 0, 0.6392157, 1, 1,
0.1337778, -0.09817261, 0.4333967, 0, 0.6352941, 1, 1,
0.1356583, -2.088974, 4.28621, 0, 0.627451, 1, 1,
0.1361379, -0.3070985, 5.646092, 0, 0.6235294, 1, 1,
0.1371205, -0.780523, 3.220906, 0, 0.6156863, 1, 1,
0.1372386, 0.0103052, 1.726419, 0, 0.6117647, 1, 1,
0.1508256, 0.5325283, 0.6887309, 0, 0.6039216, 1, 1,
0.152495, 0.8038722, 1.310585, 0, 0.5960785, 1, 1,
0.1594805, -0.1249069, 2.159957, 0, 0.5921569, 1, 1,
0.1605114, 2.474046, 0.5530474, 0, 0.5843138, 1, 1,
0.1610304, -1.184225, 3.200428, 0, 0.5803922, 1, 1,
0.1611753, 1.646667, -1.191572, 0, 0.572549, 1, 1,
0.1627809, 1.545456, -0.2704994, 0, 0.5686275, 1, 1,
0.1670527, 0.661039, 1.333563, 0, 0.5607843, 1, 1,
0.1675126, 0.09950266, 2.430019, 0, 0.5568628, 1, 1,
0.1706825, -0.8455901, 2.122895, 0, 0.5490196, 1, 1,
0.1728676, -1.743655, 3.04367, 0, 0.5450981, 1, 1,
0.1743737, -0.5177909, 4.653174, 0, 0.5372549, 1, 1,
0.1753312, -0.7019555, 2.287713, 0, 0.5333334, 1, 1,
0.1790599, 0.9521299, 1.513652, 0, 0.5254902, 1, 1,
0.1830939, 0.9026766, 1.174451, 0, 0.5215687, 1, 1,
0.1835184, -0.8065214, 1.084514, 0, 0.5137255, 1, 1,
0.1836538, -0.3526635, 2.602015, 0, 0.509804, 1, 1,
0.1842602, -1.689817, 3.487463, 0, 0.5019608, 1, 1,
0.1843238, 1.076253, 0.872538, 0, 0.4941176, 1, 1,
0.1889936, -1.908248, 2.170354, 0, 0.4901961, 1, 1,
0.1996337, -0.5115992, 2.456617, 0, 0.4823529, 1, 1,
0.2026998, 0.8604291, -0.1822458, 0, 0.4784314, 1, 1,
0.2077131, -0.4036343, 1.463451, 0, 0.4705882, 1, 1,
0.2079114, -1.690607, 2.695639, 0, 0.4666667, 1, 1,
0.2095439, -1.902859, 3.0855, 0, 0.4588235, 1, 1,
0.2176665, -1.082434, 3.357323, 0, 0.454902, 1, 1,
0.2177591, -0.957019, 2.468332, 0, 0.4470588, 1, 1,
0.2192021, -0.4835641, 3.378725, 0, 0.4431373, 1, 1,
0.2209168, 1.430411, -1.308627, 0, 0.4352941, 1, 1,
0.2225161, 0.1400991, 1.704441, 0, 0.4313726, 1, 1,
0.2225587, -1.060372, 5.281794, 0, 0.4235294, 1, 1,
0.2238598, 0.04420776, 2.396885, 0, 0.4196078, 1, 1,
0.2251668, 0.1037176, 0.9534127, 0, 0.4117647, 1, 1,
0.2260816, -0.30739, 3.875348, 0, 0.4078431, 1, 1,
0.2269957, 0.03961527, 1.349782, 0, 0.4, 1, 1,
0.2272079, 0.9249206, 0.5808873, 0, 0.3921569, 1, 1,
0.2345262, -0.8394972, 1.55124, 0, 0.3882353, 1, 1,
0.2354969, -0.5678753, 3.268553, 0, 0.3803922, 1, 1,
0.2377785, -0.1265413, 2.326649, 0, 0.3764706, 1, 1,
0.2440207, -0.1958115, 1.532864, 0, 0.3686275, 1, 1,
0.2504002, -1.802871, 3.360362, 0, 0.3647059, 1, 1,
0.2550426, 1.757296, -0.1550778, 0, 0.3568628, 1, 1,
0.2585488, -0.6208363, 3.482988, 0, 0.3529412, 1, 1,
0.2586929, 0.6788688, 0.8759243, 0, 0.345098, 1, 1,
0.2588812, 1.354116, 0.2721201, 0, 0.3411765, 1, 1,
0.2605065, -0.706297, 3.390657, 0, 0.3333333, 1, 1,
0.2675362, -0.9376205, 3.58816, 0, 0.3294118, 1, 1,
0.2681896, 1.467538, -0.2554651, 0, 0.3215686, 1, 1,
0.2703338, -0.2948705, 2.604151, 0, 0.3176471, 1, 1,
0.271507, 1.243342, 1.488305, 0, 0.3098039, 1, 1,
0.2724591, 0.7551067, 0.5891002, 0, 0.3058824, 1, 1,
0.2727786, 0.3268883, 1.091746, 0, 0.2980392, 1, 1,
0.2753892, 0.02775628, 1.266545, 0, 0.2901961, 1, 1,
0.2758029, -0.08017014, 2.144734, 0, 0.2862745, 1, 1,
0.2784784, 0.1561312, -0.06901235, 0, 0.2784314, 1, 1,
0.2815239, 0.6037439, -1.60575, 0, 0.2745098, 1, 1,
0.2827626, 0.6036672, 0.397116, 0, 0.2666667, 1, 1,
0.2860245, -0.6389064, 2.556024, 0, 0.2627451, 1, 1,
0.2861338, -0.3248259, 3.21652, 0, 0.254902, 1, 1,
0.2878602, 0.130896, 2.287893, 0, 0.2509804, 1, 1,
0.2975349, 0.5505338, 0.5031033, 0, 0.2431373, 1, 1,
0.2982692, -0.6697451, 0.9586358, 0, 0.2392157, 1, 1,
0.3004346, -0.5979308, 3.061419, 0, 0.2313726, 1, 1,
0.3004386, -1.580197, 4.391971, 0, 0.227451, 1, 1,
0.3014239, -0.9720417, 3.751541, 0, 0.2196078, 1, 1,
0.3049235, -1.020736, 1.946287, 0, 0.2156863, 1, 1,
0.3061525, 1.041154, -0.5725819, 0, 0.2078431, 1, 1,
0.3104959, 0.9639927, 1.405275, 0, 0.2039216, 1, 1,
0.3120812, 0.5028691, 2.212749, 0, 0.1960784, 1, 1,
0.3130575, -0.8021196, 3.395419, 0, 0.1882353, 1, 1,
0.3138301, 0.776949, -0.9581041, 0, 0.1843137, 1, 1,
0.3138742, 1.139627, -0.7919259, 0, 0.1764706, 1, 1,
0.3163126, -0.7404537, 2.260715, 0, 0.172549, 1, 1,
0.3281577, 0.4986906, -0.3083747, 0, 0.1647059, 1, 1,
0.3315493, 1.069741, -0.5686042, 0, 0.1607843, 1, 1,
0.3333905, -0.4392818, 2.468131, 0, 0.1529412, 1, 1,
0.3347524, 1.273197, 0.4314381, 0, 0.1490196, 1, 1,
0.3349541, 0.9471517, 1.422851, 0, 0.1411765, 1, 1,
0.3449484, 0.7861241, -0.9981063, 0, 0.1372549, 1, 1,
0.3450252, 0.4593322, 1.687186, 0, 0.1294118, 1, 1,
0.3497368, -0.6617644, 2.644878, 0, 0.1254902, 1, 1,
0.3562169, -1.420656, 4.341268, 0, 0.1176471, 1, 1,
0.3579432, -0.5959859, 0.8842996, 0, 0.1137255, 1, 1,
0.3654981, -0.5575347, 0.7486915, 0, 0.1058824, 1, 1,
0.3705264, -0.2353967, 2.269718, 0, 0.09803922, 1, 1,
0.3736005, -1.155334, 4.488302, 0, 0.09411765, 1, 1,
0.3764528, 0.3892799, 2.033818, 0, 0.08627451, 1, 1,
0.3797948, 1.21325, -0.8971502, 0, 0.08235294, 1, 1,
0.3814778, -0.6928401, 3.094079, 0, 0.07450981, 1, 1,
0.3833013, 0.05429116, 0.2037628, 0, 0.07058824, 1, 1,
0.3839248, 0.5114301, 1.173285, 0, 0.0627451, 1, 1,
0.3880887, -0.4745958, 2.859976, 0, 0.05882353, 1, 1,
0.3906161, 0.0108112, 0.9589555, 0, 0.05098039, 1, 1,
0.3971328, 0.9515412, 2.442974, 0, 0.04705882, 1, 1,
0.3981513, 0.2109076, 0.468017, 0, 0.03921569, 1, 1,
0.3990799, -0.2363663, 1.434479, 0, 0.03529412, 1, 1,
0.400739, -0.1739873, 1.760559, 0, 0.02745098, 1, 1,
0.4046817, 0.842432, 0.9276974, 0, 0.02352941, 1, 1,
0.419889, -0.4331487, 2.949809, 0, 0.01568628, 1, 1,
0.4340002, 1.892458, -0.8641089, 0, 0.01176471, 1, 1,
0.4349957, -0.7634209, 2.045064, 0, 0.003921569, 1, 1,
0.4373938, 0.2587622, 1.311696, 0.003921569, 0, 1, 1,
0.4383875, -0.929689, 1.866293, 0.007843138, 0, 1, 1,
0.4386075, -1.770268, 3.018208, 0.01568628, 0, 1, 1,
0.4419088, 0.6231533, -0.63555, 0.01960784, 0, 1, 1,
0.4429896, 0.6613792, 0.6567129, 0.02745098, 0, 1, 1,
0.4574741, -1.571797, 2.361319, 0.03137255, 0, 1, 1,
0.4575166, -0.6527936, 2.024849, 0.03921569, 0, 1, 1,
0.4591454, 0.6183326, -0.5774488, 0.04313726, 0, 1, 1,
0.4622152, 1.73714, 1.241538, 0.05098039, 0, 1, 1,
0.4622328, 2.137565, -1.141596, 0.05490196, 0, 1, 1,
0.464239, 1.117963, -0.5774719, 0.0627451, 0, 1, 1,
0.4649597, 1.457952, -2.218634, 0.06666667, 0, 1, 1,
0.4673603, -0.7058507, 3.115534, 0.07450981, 0, 1, 1,
0.4678016, 1.470181, 0.7299984, 0.07843138, 0, 1, 1,
0.4706727, -0.0814025, 0.79751, 0.08627451, 0, 1, 1,
0.4715175, 0.788313, -1.19126, 0.09019608, 0, 1, 1,
0.4746213, 0.798351, 0.2726682, 0.09803922, 0, 1, 1,
0.4767595, -1.695676, 2.7948, 0.1058824, 0, 1, 1,
0.4815849, -1.402714, 1.769272, 0.1098039, 0, 1, 1,
0.4825867, -1.137145, 3.115291, 0.1176471, 0, 1, 1,
0.4904622, -0.6824487, 1.268427, 0.1215686, 0, 1, 1,
0.4905066, 2.678796, 1.236423, 0.1294118, 0, 1, 1,
0.4907606, -0.9219374, 2.811344, 0.1333333, 0, 1, 1,
0.4919458, 0.8865047, 2.444458, 0.1411765, 0, 1, 1,
0.4932512, 0.6527838, 1.450804, 0.145098, 0, 1, 1,
0.4936007, -0.4725018, 2.020304, 0.1529412, 0, 1, 1,
0.495624, 0.5405533, 1.300002, 0.1568628, 0, 1, 1,
0.4956439, -0.1171424, 1.052232, 0.1647059, 0, 1, 1,
0.4992476, -1.092104, 1.980364, 0.1686275, 0, 1, 1,
0.4997155, 1.178473, -0.1997294, 0.1764706, 0, 1, 1,
0.5015089, -1.126444, 1.891253, 0.1803922, 0, 1, 1,
0.5026734, 1.071474, -0.4700519, 0.1882353, 0, 1, 1,
0.5132186, 1.085284, 2.785378, 0.1921569, 0, 1, 1,
0.5155996, -0.01639114, 1.161029, 0.2, 0, 1, 1,
0.5179182, -0.2547551, 2.477463, 0.2078431, 0, 1, 1,
0.5185422, 0.3690923, 0.4317156, 0.2117647, 0, 1, 1,
0.5214019, 0.5167486, 2.791162, 0.2196078, 0, 1, 1,
0.5219432, 0.2379489, -0.03847028, 0.2235294, 0, 1, 1,
0.5225605, 0.9120503, 1.193062, 0.2313726, 0, 1, 1,
0.5226621, -0.4634904, 4.120132, 0.2352941, 0, 1, 1,
0.5299224, -1.049778, 2.243961, 0.2431373, 0, 1, 1,
0.5334198, 0.5154436, 1.01768, 0.2470588, 0, 1, 1,
0.5337289, -0.5005748, 3.469083, 0.254902, 0, 1, 1,
0.5341212, 1.261591, -0.06047897, 0.2588235, 0, 1, 1,
0.5342686, 0.4246639, 1.758003, 0.2666667, 0, 1, 1,
0.5360197, -0.3209717, 2.753494, 0.2705882, 0, 1, 1,
0.537202, 0.09204602, 1.156846, 0.2784314, 0, 1, 1,
0.5373096, 0.1048878, 0.2391498, 0.282353, 0, 1, 1,
0.5411376, -0.4274909, 1.898237, 0.2901961, 0, 1, 1,
0.5447282, -0.4266067, 0.9942057, 0.2941177, 0, 1, 1,
0.5470272, 0.1445623, 0.9036412, 0.3019608, 0, 1, 1,
0.5470729, 1.504335, -0.4024734, 0.3098039, 0, 1, 1,
0.5510184, 0.2456432, 1.117567, 0.3137255, 0, 1, 1,
0.5517747, 0.9384583, 2.236842, 0.3215686, 0, 1, 1,
0.5520434, -0.05540293, 3.897558, 0.3254902, 0, 1, 1,
0.5551549, -0.7810734, 3.075737, 0.3333333, 0, 1, 1,
0.5579735, -1.132559, 2.560652, 0.3372549, 0, 1, 1,
0.5647841, -2.206759, 2.893744, 0.345098, 0, 1, 1,
0.5706946, -0.3470133, 2.261199, 0.3490196, 0, 1, 1,
0.5713006, 1.055505, 1.293408, 0.3568628, 0, 1, 1,
0.5727676, 0.04945478, 1.390372, 0.3607843, 0, 1, 1,
0.5728648, -0.1587067, 1.096309, 0.3686275, 0, 1, 1,
0.5740146, 0.920359, 0.7674709, 0.372549, 0, 1, 1,
0.5740746, 1.198317, 1.061213, 0.3803922, 0, 1, 1,
0.5849532, 0.8248803, 1.478655, 0.3843137, 0, 1, 1,
0.585499, -1.363971, 1.744251, 0.3921569, 0, 1, 1,
0.5868567, -1.033021, 2.54408, 0.3960784, 0, 1, 1,
0.5908932, -1.534045, 4.5174, 0.4039216, 0, 1, 1,
0.5937271, 0.2304791, 0.6288967, 0.4117647, 0, 1, 1,
0.5980263, -2.243842, 2.177942, 0.4156863, 0, 1, 1,
0.6076517, 0.3490514, 0.7931899, 0.4235294, 0, 1, 1,
0.6078084, -0.3677449, 2.411441, 0.427451, 0, 1, 1,
0.6088795, -1.292731, 3.932281, 0.4352941, 0, 1, 1,
0.611526, -0.007674742, 0.6883592, 0.4392157, 0, 1, 1,
0.6150337, -0.5647068, 1.903359, 0.4470588, 0, 1, 1,
0.6194382, -0.4665391, 2.252879, 0.4509804, 0, 1, 1,
0.623165, 0.130793, -0.1760709, 0.4588235, 0, 1, 1,
0.634836, -1.168005, 3.404661, 0.4627451, 0, 1, 1,
0.6353128, -0.211247, 2.971624, 0.4705882, 0, 1, 1,
0.6379864, -1.342753, 1.511773, 0.4745098, 0, 1, 1,
0.6394302, -1.043285, 1.898412, 0.4823529, 0, 1, 1,
0.6495595, -1.750586, 2.443539, 0.4862745, 0, 1, 1,
0.6636647, 0.8852, 1.027495, 0.4941176, 0, 1, 1,
0.6667531, 0.5506555, 2.824491, 0.5019608, 0, 1, 1,
0.6730723, -0.6646037, 1.824115, 0.5058824, 0, 1, 1,
0.6747767, 0.476297, -0.3021072, 0.5137255, 0, 1, 1,
0.6806387, -0.8022723, 2.192555, 0.5176471, 0, 1, 1,
0.6806999, 0.5903702, 1.397563, 0.5254902, 0, 1, 1,
0.6843507, -0.3921614, 2.792999, 0.5294118, 0, 1, 1,
0.6918572, -1.504105, 3.292598, 0.5372549, 0, 1, 1,
0.6932012, 1.826848, 0.1699469, 0.5411765, 0, 1, 1,
0.7003345, -1.155545, 0.990302, 0.5490196, 0, 1, 1,
0.7014563, -1.045916, 5.898205, 0.5529412, 0, 1, 1,
0.7020807, -0.9552553, 2.778931, 0.5607843, 0, 1, 1,
0.7023069, 1.63723, 1.007694, 0.5647059, 0, 1, 1,
0.7088608, 0.6417655, -0.3074388, 0.572549, 0, 1, 1,
0.7139297, -1.888473, 2.263494, 0.5764706, 0, 1, 1,
0.7142378, 0.3527243, 0.07643126, 0.5843138, 0, 1, 1,
0.717268, 1.289926, 0.7947534, 0.5882353, 0, 1, 1,
0.7190126, 0.03397414, 2.206427, 0.5960785, 0, 1, 1,
0.7212581, -1.220172, 2.974887, 0.6039216, 0, 1, 1,
0.7231414, -0.8533429, 3.026252, 0.6078432, 0, 1, 1,
0.7279556, -1.261048, 1.516881, 0.6156863, 0, 1, 1,
0.7295283, 0.630805, 0.9188676, 0.6196079, 0, 1, 1,
0.7343123, 0.616946, 1.549951, 0.627451, 0, 1, 1,
0.7356479, 0.2685972, 2.073107, 0.6313726, 0, 1, 1,
0.7391062, -2.075764, 3.247243, 0.6392157, 0, 1, 1,
0.7391954, 0.5371554, -0.3025023, 0.6431373, 0, 1, 1,
0.7394171, -0.2125966, 3.073032, 0.6509804, 0, 1, 1,
0.7394873, 0.2642177, 1.326407, 0.654902, 0, 1, 1,
0.7405328, 0.6774322, 0.3702567, 0.6627451, 0, 1, 1,
0.7424406, 1.237089, 2.736753, 0.6666667, 0, 1, 1,
0.7461158, 0.1571258, 1.030621, 0.6745098, 0, 1, 1,
0.7474294, -1.759305, 2.482218, 0.6784314, 0, 1, 1,
0.7481479, 0.5130966, 2.580025, 0.6862745, 0, 1, 1,
0.7488009, -0.9088618, 3.401719, 0.6901961, 0, 1, 1,
0.7527605, -0.2803156, 1.889862, 0.6980392, 0, 1, 1,
0.7546744, 0.8554385, 0.5224985, 0.7058824, 0, 1, 1,
0.760466, 0.3333561, 0.5731975, 0.7098039, 0, 1, 1,
0.7703312, 1.415238, -0.9462481, 0.7176471, 0, 1, 1,
0.773598, -1.066006, 1.588279, 0.7215686, 0, 1, 1,
0.7745754, -0.6377009, 0.9242491, 0.7294118, 0, 1, 1,
0.7761175, -0.629944, 3.202015, 0.7333333, 0, 1, 1,
0.7773185, -0.9276544, 2.06818, 0.7411765, 0, 1, 1,
0.7803974, 0.690694, 1.946932, 0.7450981, 0, 1, 1,
0.7869911, 0.879982, 1.799063, 0.7529412, 0, 1, 1,
0.7929255, -0.9359205, 0.7083073, 0.7568628, 0, 1, 1,
0.7960023, -0.8901724, 1.160335, 0.7647059, 0, 1, 1,
0.8075303, -1.488423, 3.2695, 0.7686275, 0, 1, 1,
0.8104801, -0.1605722, 2.304079, 0.7764706, 0, 1, 1,
0.8111361, 1.318244, 0.519758, 0.7803922, 0, 1, 1,
0.8176113, -0.3789944, 1.361398, 0.7882353, 0, 1, 1,
0.818095, -0.06938016, 0.8198192, 0.7921569, 0, 1, 1,
0.8181875, -0.2749163, 2.015595, 0.8, 0, 1, 1,
0.8214515, 0.8675061, 1.210285, 0.8078431, 0, 1, 1,
0.823096, 0.0810358, 0.9338215, 0.8117647, 0, 1, 1,
0.8356985, 0.3048003, 3.846183, 0.8196079, 0, 1, 1,
0.8404356, 0.9703859, 0.450684, 0.8235294, 0, 1, 1,
0.8457614, -0.2242308, 1.616845, 0.8313726, 0, 1, 1,
0.8482182, -2.193887, 0.6156669, 0.8352941, 0, 1, 1,
0.8495312, 0.6133142, 1.595956, 0.8431373, 0, 1, 1,
0.8539918, -0.1500353, 0.3371771, 0.8470588, 0, 1, 1,
0.8586877, 0.319737, 1.124454, 0.854902, 0, 1, 1,
0.8637013, 1.007148, 0.8348106, 0.8588235, 0, 1, 1,
0.8676248, -0.02035012, 2.934203, 0.8666667, 0, 1, 1,
0.868452, 0.8987534, 0.9446254, 0.8705882, 0, 1, 1,
0.8703939, -1.356856, 3.177907, 0.8784314, 0, 1, 1,
0.8765585, -2.236812, 3.582773, 0.8823529, 0, 1, 1,
0.8803672, 0.7497227, -0.03114826, 0.8901961, 0, 1, 1,
0.8842714, -0.1084514, 1.17385, 0.8941177, 0, 1, 1,
0.8845906, -1.245472, 2.103888, 0.9019608, 0, 1, 1,
0.8858697, 0.6600949, 1.388293, 0.9098039, 0, 1, 1,
0.8890361, -0.4975118, 1.867896, 0.9137255, 0, 1, 1,
0.8900408, -0.1766193, 0.2195142, 0.9215686, 0, 1, 1,
0.8941708, -1.093467, 2.864992, 0.9254902, 0, 1, 1,
0.8986486, -0.1668068, 3.379021, 0.9333333, 0, 1, 1,
0.9025362, 0.1846452, 2.710493, 0.9372549, 0, 1, 1,
0.9026321, 0.4401277, 1.105736, 0.945098, 0, 1, 1,
0.9053342, 0.0002948253, 1.846908, 0.9490196, 0, 1, 1,
0.9064456, -0.679437, 3.550236, 0.9568627, 0, 1, 1,
0.9107468, -0.9705067, 1.710689, 0.9607843, 0, 1, 1,
0.9107932, 0.1331444, 1.860722, 0.9686275, 0, 1, 1,
0.9111677, 0.8893043, 1.514048, 0.972549, 0, 1, 1,
0.9168849, 1.991892, -1.715101, 0.9803922, 0, 1, 1,
0.9237373, -0.9287621, 3.006729, 0.9843137, 0, 1, 1,
0.9258548, -1.113219, 1.746651, 0.9921569, 0, 1, 1,
0.9282427, 1.823833, 0.1592456, 0.9960784, 0, 1, 1,
0.9292004, 0.2773821, -0.83167, 1, 0, 0.9960784, 1,
0.9295456, 0.6144093, 1.481295, 1, 0, 0.9882353, 1,
0.9313504, 0.2442039, 0.8091272, 1, 0, 0.9843137, 1,
0.9343137, 0.005462223, 0.08763418, 1, 0, 0.9764706, 1,
0.9351692, -0.1918023, 0.8996069, 1, 0, 0.972549, 1,
0.9441723, 0.2293843, 2.459174, 1, 0, 0.9647059, 1,
0.9472841, 0.08144312, 2.755863, 1, 0, 0.9607843, 1,
0.9487231, 0.08727468, 2.822915, 1, 0, 0.9529412, 1,
0.9530186, 1.019042, -0.8840907, 1, 0, 0.9490196, 1,
0.954897, 1.61659, 0.1727235, 1, 0, 0.9411765, 1,
0.9559292, 0.1777878, 1.346133, 1, 0, 0.9372549, 1,
0.9568508, 0.187375, 2.09653, 1, 0, 0.9294118, 1,
0.960661, -0.6016661, -0.3495408, 1, 0, 0.9254902, 1,
0.9681392, 0.8834442, -1.135094, 1, 0, 0.9176471, 1,
0.9792987, 0.7111336, 1.520759, 1, 0, 0.9137255, 1,
0.9850476, -0.03212317, -0.3499925, 1, 0, 0.9058824, 1,
0.9858852, 0.2041763, 2.280768, 1, 0, 0.9019608, 1,
0.9941252, -0.6561691, 2.589698, 1, 0, 0.8941177, 1,
1.004956, 0.2866879, 1.535366, 1, 0, 0.8862745, 1,
1.017535, 0.7579337, 0.7990429, 1, 0, 0.8823529, 1,
1.017804, -2.405497, 1.447175, 1, 0, 0.8745098, 1,
1.02355, 0.6842532, 0.08323196, 1, 0, 0.8705882, 1,
1.025915, 1.111517, 0.8731831, 1, 0, 0.8627451, 1,
1.031837, -0.3565741, 0.776811, 1, 0, 0.8588235, 1,
1.031901, 1.182883, -0.3227926, 1, 0, 0.8509804, 1,
1.032259, 0.8899454, 1.041875, 1, 0, 0.8470588, 1,
1.035032, 1.431538, 0.04550806, 1, 0, 0.8392157, 1,
1.043056, 0.07633679, 0.9521453, 1, 0, 0.8352941, 1,
1.043148, 0.811465, 0.9950291, 1, 0, 0.827451, 1,
1.044044, 1.277154, 0.3466808, 1, 0, 0.8235294, 1,
1.064199, -0.131102, 0.9337275, 1, 0, 0.8156863, 1,
1.067092, 1.17769, -0.1500727, 1, 0, 0.8117647, 1,
1.06787, -1.648114, 1.760545, 1, 0, 0.8039216, 1,
1.073115, 1.631412, 0.2766989, 1, 0, 0.7960784, 1,
1.075439, -0.5808652, 1.858141, 1, 0, 0.7921569, 1,
1.079793, 1.507537, 1.31499, 1, 0, 0.7843137, 1,
1.08473, 1.739788, 0.9590678, 1, 0, 0.7803922, 1,
1.10473, 0.1899083, 0.9853054, 1, 0, 0.772549, 1,
1.104812, -0.6429561, 2.60578, 1, 0, 0.7686275, 1,
1.107459, -0.5254286, 2.126803, 1, 0, 0.7607843, 1,
1.109789, 0.9211746, 0.200556, 1, 0, 0.7568628, 1,
1.112087, -1.183405, 1.524338, 1, 0, 0.7490196, 1,
1.122783, -0.3817231, 2.863767, 1, 0, 0.7450981, 1,
1.126489, -1.012359, 2.954545, 1, 0, 0.7372549, 1,
1.134856, 0.1730985, 2.062024, 1, 0, 0.7333333, 1,
1.137607, 0.2596541, 1.791156, 1, 0, 0.7254902, 1,
1.14547, 0.384375, 0.6334891, 1, 0, 0.7215686, 1,
1.14794, 1.100491, -0.2435891, 1, 0, 0.7137255, 1,
1.148472, -1.460057, 1.717319, 1, 0, 0.7098039, 1,
1.157729, -1.582093, 2.711586, 1, 0, 0.7019608, 1,
1.164027, 0.2933112, 1.729813, 1, 0, 0.6941177, 1,
1.166883, -0.5728959, 2.201707, 1, 0, 0.6901961, 1,
1.166938, -2.705312, 2.553309, 1, 0, 0.682353, 1,
1.173037, -0.4927511, 2.992069, 1, 0, 0.6784314, 1,
1.174703, -0.8296329, 3.031583, 1, 0, 0.6705883, 1,
1.176583, 0.877409, -0.9494884, 1, 0, 0.6666667, 1,
1.192343, 0.5210209, 1.992699, 1, 0, 0.6588235, 1,
1.197681, 1.508359, 1.896352, 1, 0, 0.654902, 1,
1.199302, 1.639476, 0.7555296, 1, 0, 0.6470588, 1,
1.21866, 0.9883586, 0.8353512, 1, 0, 0.6431373, 1,
1.22147, -0.9034984, 2.877465, 1, 0, 0.6352941, 1,
1.228345, -0.6499783, 1.229845, 1, 0, 0.6313726, 1,
1.249618, 0.1393955, 2.770997, 1, 0, 0.6235294, 1,
1.253831, 0.8069192, 3.039222, 1, 0, 0.6196079, 1,
1.269824, 1.547595, 0.1241812, 1, 0, 0.6117647, 1,
1.277227, -0.1800414, 0.989505, 1, 0, 0.6078432, 1,
1.281091, 0.6982687, 0.1302915, 1, 0, 0.6, 1,
1.285105, -0.8798297, 1.635683, 1, 0, 0.5921569, 1,
1.286937, 0.4580799, 0.6493628, 1, 0, 0.5882353, 1,
1.287635, 0.9938143, 0.4002488, 1, 0, 0.5803922, 1,
1.301052, 0.6530452, -0.03341062, 1, 0, 0.5764706, 1,
1.309886, 0.9355835, 1.727236, 1, 0, 0.5686275, 1,
1.31299, 0.7470715, -0.1786845, 1, 0, 0.5647059, 1,
1.316322, 0.5319769, 1.273952, 1, 0, 0.5568628, 1,
1.334261, -0.7903965, 1.253854, 1, 0, 0.5529412, 1,
1.338122, 0.1208759, 3.212368, 1, 0, 0.5450981, 1,
1.346452, -1.270938, 2.133617, 1, 0, 0.5411765, 1,
1.352073, -0.1317457, 0.959209, 1, 0, 0.5333334, 1,
1.35223, 0.04508333, 2.148284, 1, 0, 0.5294118, 1,
1.36595, 1.143952, 1.375461, 1, 0, 0.5215687, 1,
1.372662, -0.9262124, 1.013018, 1, 0, 0.5176471, 1,
1.372787, 0.04575586, 1.739384, 1, 0, 0.509804, 1,
1.37404, -0.1965368, 0.7495468, 1, 0, 0.5058824, 1,
1.377916, -0.08273494, 0.8445921, 1, 0, 0.4980392, 1,
1.378827, 0.3828364, 0.1775917, 1, 0, 0.4901961, 1,
1.381889, 0.7772572, 0.04029783, 1, 0, 0.4862745, 1,
1.385148, -0.6569371, 2.059648, 1, 0, 0.4784314, 1,
1.396754, -0.5244012, 1.43942, 1, 0, 0.4745098, 1,
1.3992, 0.3683373, 0.8128565, 1, 0, 0.4666667, 1,
1.457817, 0.3278939, 2.027607, 1, 0, 0.4627451, 1,
1.461771, 0.3801845, 1.929253, 1, 0, 0.454902, 1,
1.466682, -0.458719, 1.827205, 1, 0, 0.4509804, 1,
1.476538, 0.7177742, 1.238293, 1, 0, 0.4431373, 1,
1.476664, -1.137336, 2.647888, 1, 0, 0.4392157, 1,
1.478417, -0.8357922, 2.232515, 1, 0, 0.4313726, 1,
1.479381, -0.4252008, 0.08415645, 1, 0, 0.427451, 1,
1.492796, -0.5309122, 0.6940039, 1, 0, 0.4196078, 1,
1.498408, -0.4926307, 3.618794, 1, 0, 0.4156863, 1,
1.505623, -1.15323, 3.66888, 1, 0, 0.4078431, 1,
1.508733, -0.6324896, 2.851472, 1, 0, 0.4039216, 1,
1.518544, 0.9281941, -0.7470209, 1, 0, 0.3960784, 1,
1.518622, -0.01398957, 1.781101, 1, 0, 0.3882353, 1,
1.523679, -1.030185, 2.611857, 1, 0, 0.3843137, 1,
1.528319, 0.9720012, 0.9376989, 1, 0, 0.3764706, 1,
1.55076, 0.7127441, 2.179788, 1, 0, 0.372549, 1,
1.561018, 0.9937233, 1.127075, 1, 0, 0.3647059, 1,
1.563083, 0.3150914, 0.1922452, 1, 0, 0.3607843, 1,
1.570985, -0.2526371, 1.329179, 1, 0, 0.3529412, 1,
1.58433, -0.3235932, 1.938088, 1, 0, 0.3490196, 1,
1.613537, 1.791822, 0.568085, 1, 0, 0.3411765, 1,
1.617445, 0.2243335, -0.2963113, 1, 0, 0.3372549, 1,
1.620326, 1.449159, 0.7469948, 1, 0, 0.3294118, 1,
1.625011, 1.972075, -0.3824389, 1, 0, 0.3254902, 1,
1.627255, -0.8543235, 2.042724, 1, 0, 0.3176471, 1,
1.628844, -1.106297, 1.224431, 1, 0, 0.3137255, 1,
1.636038, 0.06908987, 2.441548, 1, 0, 0.3058824, 1,
1.636501, 0.2675214, 1.419299, 1, 0, 0.2980392, 1,
1.641626, -0.9649418, 2.165129, 1, 0, 0.2941177, 1,
1.644935, 0.5408991, 1.244202, 1, 0, 0.2862745, 1,
1.653509, 0.6393859, 2.541137, 1, 0, 0.282353, 1,
1.654107, 0.7470245, -0.1063715, 1, 0, 0.2745098, 1,
1.661533, -0.8628784, 1.400404, 1, 0, 0.2705882, 1,
1.666911, 1.095316, 1.056903, 1, 0, 0.2627451, 1,
1.685715, -0.01905316, 2.637087, 1, 0, 0.2588235, 1,
1.707539, -0.5609699, 1.405938, 1, 0, 0.2509804, 1,
1.708119, 1.525577, 0.2286438, 1, 0, 0.2470588, 1,
1.716953, 0.4215787, 1.654066, 1, 0, 0.2392157, 1,
1.722105, 0.3192628, 3.002299, 1, 0, 0.2352941, 1,
1.733426, -0.6196789, 0.8642601, 1, 0, 0.227451, 1,
1.737357, -0.2423299, 3.357694, 1, 0, 0.2235294, 1,
1.743374, -1.238206, 1.68923, 1, 0, 0.2156863, 1,
1.752285, 1.127452, 1.091391, 1, 0, 0.2117647, 1,
1.78164, -1.223819, 2.411851, 1, 0, 0.2039216, 1,
1.809691, 0.1821214, 0.1399888, 1, 0, 0.1960784, 1,
1.821681, -0.727488, 4.468677, 1, 0, 0.1921569, 1,
1.827829, 1.392114, -0.1049564, 1, 0, 0.1843137, 1,
1.835171, 0.1449828, 1.061861, 1, 0, 0.1803922, 1,
1.841558, 2.845618, 0.49095, 1, 0, 0.172549, 1,
1.845328, -1.803572, 2.482287, 1, 0, 0.1686275, 1,
1.845965, -0.6346579, 1.00327, 1, 0, 0.1607843, 1,
1.873877, -0.6242939, 2.24312, 1, 0, 0.1568628, 1,
1.894139, -0.6014619, 4.018717, 1, 0, 0.1490196, 1,
1.979326, 0.03208394, 2.12233, 1, 0, 0.145098, 1,
1.985234, 0.04736174, 1.047488, 1, 0, 0.1372549, 1,
1.994103, 1.155915, 1.919949, 1, 0, 0.1333333, 1,
2.055306, 0.754092, 1.455209, 1, 0, 0.1254902, 1,
2.064919, 0.5690817, 1.560301, 1, 0, 0.1215686, 1,
2.135558, 2.333807, 1.336569, 1, 0, 0.1137255, 1,
2.147373, 0.41693, 1.880172, 1, 0, 0.1098039, 1,
2.158417, -2.387002, 3.212301, 1, 0, 0.1019608, 1,
2.183699, 0.3558843, 3.091443, 1, 0, 0.09411765, 1,
2.197229, -0.4429968, 1.130548, 1, 0, 0.09019608, 1,
2.327906, -0.4298401, 0.6406391, 1, 0, 0.08235294, 1,
2.391967, 1.801158, 2.5691, 1, 0, 0.07843138, 1,
2.410607, -0.4141621, 1.349097, 1, 0, 0.07058824, 1,
2.45204, 1.643836, 0.7947418, 1, 0, 0.06666667, 1,
2.50213, 0.360676, 2.822938, 1, 0, 0.05882353, 1,
2.53133, -1.065344, 1.429778, 1, 0, 0.05490196, 1,
2.681335, -0.2900588, 2.08308, 1, 0, 0.04705882, 1,
2.723244, -1.407861, 1.664663, 1, 0, 0.04313726, 1,
2.762329, -0.4409112, 1.754069, 1, 0, 0.03529412, 1,
2.786254, 2.51266, 1.99153, 1, 0, 0.03137255, 1,
2.861789, -1.73178, 2.106936, 1, 0, 0.02352941, 1,
2.948855, -0.5291892, 2.454994, 1, 0, 0.01960784, 1,
3.02531, 0.1773169, 2.241331, 1, 0, 0.01176471, 1,
3.188426, -1.719196, 1.72555, 1, 0, 0.007843138, 1
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
0.04750311, -3.894805, -7.135284, 0, -0.5, 0.5, 0.5,
0.04750311, -3.894805, -7.135284, 1, -0.5, 0.5, 0.5,
0.04750311, -3.894805, -7.135284, 1, 1.5, 0.5, 0.5,
0.04750311, -3.894805, -7.135284, 0, 1.5, 0.5, 0.5
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
-4.158192, 0.3527101, -7.135284, 0, -0.5, 0.5, 0.5,
-4.158192, 0.3527101, -7.135284, 1, -0.5, 0.5, 0.5,
-4.158192, 0.3527101, -7.135284, 1, 1.5, 0.5, 0.5,
-4.158192, 0.3527101, -7.135284, 0, 1.5, 0.5, 0.5
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
-4.158192, -3.894805, 0.3259568, 0, -0.5, 0.5, 0.5,
-4.158192, -3.894805, 0.3259568, 1, -0.5, 0.5, 0.5,
-4.158192, -3.894805, 0.3259568, 1, 1.5, 0.5, 0.5,
-4.158192, -3.894805, 0.3259568, 0, 1.5, 0.5, 0.5
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
-3, -2.914609, -5.413459,
3, -2.914609, -5.413459,
-3, -2.914609, -5.413459,
-3, -3.077975, -5.70043,
-2, -2.914609, -5.413459,
-2, -3.077975, -5.70043,
-1, -2.914609, -5.413459,
-1, -3.077975, -5.70043,
0, -2.914609, -5.413459,
0, -3.077975, -5.70043,
1, -2.914609, -5.413459,
1, -3.077975, -5.70043,
2, -2.914609, -5.413459,
2, -3.077975, -5.70043,
3, -2.914609, -5.413459,
3, -3.077975, -5.70043
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
-3, -3.404707, -6.274372, 0, -0.5, 0.5, 0.5,
-3, -3.404707, -6.274372, 1, -0.5, 0.5, 0.5,
-3, -3.404707, -6.274372, 1, 1.5, 0.5, 0.5,
-3, -3.404707, -6.274372, 0, 1.5, 0.5, 0.5,
-2, -3.404707, -6.274372, 0, -0.5, 0.5, 0.5,
-2, -3.404707, -6.274372, 1, -0.5, 0.5, 0.5,
-2, -3.404707, -6.274372, 1, 1.5, 0.5, 0.5,
-2, -3.404707, -6.274372, 0, 1.5, 0.5, 0.5,
-1, -3.404707, -6.274372, 0, -0.5, 0.5, 0.5,
-1, -3.404707, -6.274372, 1, -0.5, 0.5, 0.5,
-1, -3.404707, -6.274372, 1, 1.5, 0.5, 0.5,
-1, -3.404707, -6.274372, 0, 1.5, 0.5, 0.5,
0, -3.404707, -6.274372, 0, -0.5, 0.5, 0.5,
0, -3.404707, -6.274372, 1, -0.5, 0.5, 0.5,
0, -3.404707, -6.274372, 1, 1.5, 0.5, 0.5,
0, -3.404707, -6.274372, 0, 1.5, 0.5, 0.5,
1, -3.404707, -6.274372, 0, -0.5, 0.5, 0.5,
1, -3.404707, -6.274372, 1, -0.5, 0.5, 0.5,
1, -3.404707, -6.274372, 1, 1.5, 0.5, 0.5,
1, -3.404707, -6.274372, 0, 1.5, 0.5, 0.5,
2, -3.404707, -6.274372, 0, -0.5, 0.5, 0.5,
2, -3.404707, -6.274372, 1, -0.5, 0.5, 0.5,
2, -3.404707, -6.274372, 1, 1.5, 0.5, 0.5,
2, -3.404707, -6.274372, 0, 1.5, 0.5, 0.5,
3, -3.404707, -6.274372, 0, -0.5, 0.5, 0.5,
3, -3.404707, -6.274372, 1, -0.5, 0.5, 0.5,
3, -3.404707, -6.274372, 1, 1.5, 0.5, 0.5,
3, -3.404707, -6.274372, 0, 1.5, 0.5, 0.5
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
-3.187647, -2, -5.413459,
-3.187647, 3, -5.413459,
-3.187647, -2, -5.413459,
-3.349405, -2, -5.70043,
-3.187647, -1, -5.413459,
-3.349405, -1, -5.70043,
-3.187647, 0, -5.413459,
-3.349405, 0, -5.70043,
-3.187647, 1, -5.413459,
-3.349405, 1, -5.70043,
-3.187647, 2, -5.413459,
-3.349405, 2, -5.70043,
-3.187647, 3, -5.413459,
-3.349405, 3, -5.70043
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
-3.67292, -2, -6.274372, 0, -0.5, 0.5, 0.5,
-3.67292, -2, -6.274372, 1, -0.5, 0.5, 0.5,
-3.67292, -2, -6.274372, 1, 1.5, 0.5, 0.5,
-3.67292, -2, -6.274372, 0, 1.5, 0.5, 0.5,
-3.67292, -1, -6.274372, 0, -0.5, 0.5, 0.5,
-3.67292, -1, -6.274372, 1, -0.5, 0.5, 0.5,
-3.67292, -1, -6.274372, 1, 1.5, 0.5, 0.5,
-3.67292, -1, -6.274372, 0, 1.5, 0.5, 0.5,
-3.67292, 0, -6.274372, 0, -0.5, 0.5, 0.5,
-3.67292, 0, -6.274372, 1, -0.5, 0.5, 0.5,
-3.67292, 0, -6.274372, 1, 1.5, 0.5, 0.5,
-3.67292, 0, -6.274372, 0, 1.5, 0.5, 0.5,
-3.67292, 1, -6.274372, 0, -0.5, 0.5, 0.5,
-3.67292, 1, -6.274372, 1, -0.5, 0.5, 0.5,
-3.67292, 1, -6.274372, 1, 1.5, 0.5, 0.5,
-3.67292, 1, -6.274372, 0, 1.5, 0.5, 0.5,
-3.67292, 2, -6.274372, 0, -0.5, 0.5, 0.5,
-3.67292, 2, -6.274372, 1, -0.5, 0.5, 0.5,
-3.67292, 2, -6.274372, 1, 1.5, 0.5, 0.5,
-3.67292, 2, -6.274372, 0, 1.5, 0.5, 0.5,
-3.67292, 3, -6.274372, 0, -0.5, 0.5, 0.5,
-3.67292, 3, -6.274372, 1, -0.5, 0.5, 0.5,
-3.67292, 3, -6.274372, 1, 1.5, 0.5, 0.5,
-3.67292, 3, -6.274372, 0, 1.5, 0.5, 0.5
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
-3.187647, -2.914609, -4,
-3.187647, -2.914609, 4,
-3.187647, -2.914609, -4,
-3.349405, -3.077975, -4,
-3.187647, -2.914609, -2,
-3.349405, -3.077975, -2,
-3.187647, -2.914609, 0,
-3.349405, -3.077975, 0,
-3.187647, -2.914609, 2,
-3.349405, -3.077975, 2,
-3.187647, -2.914609, 4,
-3.349405, -3.077975, 4
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
-3.67292, -3.404707, -4, 0, -0.5, 0.5, 0.5,
-3.67292, -3.404707, -4, 1, -0.5, 0.5, 0.5,
-3.67292, -3.404707, -4, 1, 1.5, 0.5, 0.5,
-3.67292, -3.404707, -4, 0, 1.5, 0.5, 0.5,
-3.67292, -3.404707, -2, 0, -0.5, 0.5, 0.5,
-3.67292, -3.404707, -2, 1, -0.5, 0.5, 0.5,
-3.67292, -3.404707, -2, 1, 1.5, 0.5, 0.5,
-3.67292, -3.404707, -2, 0, 1.5, 0.5, 0.5,
-3.67292, -3.404707, 0, 0, -0.5, 0.5, 0.5,
-3.67292, -3.404707, 0, 1, -0.5, 0.5, 0.5,
-3.67292, -3.404707, 0, 1, 1.5, 0.5, 0.5,
-3.67292, -3.404707, 0, 0, 1.5, 0.5, 0.5,
-3.67292, -3.404707, 2, 0, -0.5, 0.5, 0.5,
-3.67292, -3.404707, 2, 1, -0.5, 0.5, 0.5,
-3.67292, -3.404707, 2, 1, 1.5, 0.5, 0.5,
-3.67292, -3.404707, 2, 0, 1.5, 0.5, 0.5,
-3.67292, -3.404707, 4, 0, -0.5, 0.5, 0.5,
-3.67292, -3.404707, 4, 1, -0.5, 0.5, 0.5,
-3.67292, -3.404707, 4, 1, 1.5, 0.5, 0.5,
-3.67292, -3.404707, 4, 0, 1.5, 0.5, 0.5
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
-3.187647, -2.914609, -5.413459,
-3.187647, 3.620029, -5.413459,
-3.187647, -2.914609, 6.065373,
-3.187647, 3.620029, 6.065373,
-3.187647, -2.914609, -5.413459,
-3.187647, -2.914609, 6.065373,
-3.187647, 3.620029, -5.413459,
-3.187647, 3.620029, 6.065373,
-3.187647, -2.914609, -5.413459,
3.282654, -2.914609, -5.413459,
-3.187647, -2.914609, 6.065373,
3.282654, -2.914609, 6.065373,
-3.187647, 3.620029, -5.413459,
3.282654, 3.620029, -5.413459,
-3.187647, 3.620029, 6.065373,
3.282654, 3.620029, 6.065373,
3.282654, -2.914609, -5.413459,
3.282654, 3.620029, -5.413459,
3.282654, -2.914609, 6.065373,
3.282654, 3.620029, 6.065373,
3.282654, -2.914609, -5.413459,
3.282654, -2.914609, 6.065373,
3.282654, 3.620029, -5.413459,
3.282654, 3.620029, 6.065373
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
var radius = 7.85387;
var distance = 34.94275;
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
mvMatrix.translate( -0.04750311, -0.3527101, -0.3259568 );
mvMatrix.scale( 1.312421, 1.299499, 0.7397755 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.94275);
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
isopropalin<-read.table("isopropalin.xyz")
```

```
## Error in read.table("isopropalin.xyz"): no lines available in input
```

```r
x<-isopropalin$V2
```

```
## Error in eval(expr, envir, enclos): object 'isopropalin' not found
```

```r
y<-isopropalin$V3
```

```
## Error in eval(expr, envir, enclos): object 'isopropalin' not found
```

```r
z<-isopropalin$V4
```

```
## Error in eval(expr, envir, enclos): object 'isopropalin' not found
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
-3.09342, -1.000488, -2.89244, 0, 0, 1, 1, 1,
-2.948932, -1.399958, -1.740476, 1, 0, 0, 1, 1,
-2.853972, 0.4892855, 1.088456, 1, 0, 0, 1, 1,
-2.787975, -0.2184979, -0.6882011, 1, 0, 0, 1, 1,
-2.637795, -1.143188, -1.770596, 1, 0, 0, 1, 1,
-2.547464, 0.1904532, -1.902137, 1, 0, 0, 1, 1,
-2.534655, 0.06868359, -0.2500545, 0, 0, 0, 1, 1,
-2.382592, 0.4012424, 0.7264302, 0, 0, 0, 1, 1,
-2.307472, 0.9741217, -0.2063001, 0, 0, 0, 1, 1,
-2.293051, 1.960154, -1.410453, 0, 0, 0, 1, 1,
-2.271231, 0.4964584, -0.9919211, 0, 0, 0, 1, 1,
-2.246919, -1.111174, -2.569596, 0, 0, 0, 1, 1,
-2.241763, 0.4505815, -1.746474, 0, 0, 0, 1, 1,
-2.221113, 0.7023003, -1.06972, 1, 1, 1, 1, 1,
-2.188803, 0.1830763, -1.278784, 1, 1, 1, 1, 1,
-2.130204, 1.186465, -2.281826, 1, 1, 1, 1, 1,
-2.114221, -1.421449, -1.560104, 1, 1, 1, 1, 1,
-2.054168, -1.142006, -1.545579, 1, 1, 1, 1, 1,
-2.037319, 1.224657, -2.785451, 1, 1, 1, 1, 1,
-2.001975, 0.3015495, -1.720049, 1, 1, 1, 1, 1,
-1.990738, -0.7059497, -2.798287, 1, 1, 1, 1, 1,
-1.988791, 0.4160435, -2.267516, 1, 1, 1, 1, 1,
-1.987278, 0.5654832, -1.994371, 1, 1, 1, 1, 1,
-1.98206, -1.021593, -3.390945, 1, 1, 1, 1, 1,
-1.959105, 1.401905, -1.942158, 1, 1, 1, 1, 1,
-1.930697, 0.2730178, -2.198564, 1, 1, 1, 1, 1,
-1.907296, -0.2798674, -2.622856, 1, 1, 1, 1, 1,
-1.858158, -0.2583088, -1.391517, 1, 1, 1, 1, 1,
-1.840081, -0.2195616, -3.942211, 0, 0, 1, 1, 1,
-1.837123, 0.529892, -1.208431, 1, 0, 0, 1, 1,
-1.836054, -0.2478049, -0.5956354, 1, 0, 0, 1, 1,
-1.833225, -0.8515885, -1.76273, 1, 0, 0, 1, 1,
-1.829628, 0.3130275, -2.198118, 1, 0, 0, 1, 1,
-1.827349, 0.4416618, -0.9661171, 1, 0, 0, 1, 1,
-1.825024, 0.9523619, -3.456186, 0, 0, 0, 1, 1,
-1.820214, 0.6165221, -1.606512, 0, 0, 0, 1, 1,
-1.814311, 0.6347058, -0.2735819, 0, 0, 0, 1, 1,
-1.794833, -0.214469, -1.613482, 0, 0, 0, 1, 1,
-1.793873, 0.6649522, 0.03248678, 0, 0, 0, 1, 1,
-1.787984, 1.294325, -1.609049, 0, 0, 0, 1, 1,
-1.786333, 1.639304, -0.1998599, 0, 0, 0, 1, 1,
-1.772182, 0.2974215, -1.105241, 1, 1, 1, 1, 1,
-1.769244, 1.430641, -1.258376, 1, 1, 1, 1, 1,
-1.754167, 0.1374254, -2.569548, 1, 1, 1, 1, 1,
-1.729107, -0.01771157, -2.011044, 1, 1, 1, 1, 1,
-1.708625, 0.3452884, -0.3087412, 1, 1, 1, 1, 1,
-1.706331, 0.8201426, -1.080391, 1, 1, 1, 1, 1,
-1.691029, 0.9701835, 0.03740996, 1, 1, 1, 1, 1,
-1.677113, -1.241483, -4.497935, 1, 1, 1, 1, 1,
-1.676986, 1.611107, -0.9271381, 1, 1, 1, 1, 1,
-1.656693, -1.418647, -2.342545, 1, 1, 1, 1, 1,
-1.653669, -0.04315209, -1.697856, 1, 1, 1, 1, 1,
-1.641226, -0.4308519, -0.07937472, 1, 1, 1, 1, 1,
-1.612902, 1.187144, 0.6631098, 1, 1, 1, 1, 1,
-1.596076, 0.4733054, -0.7023274, 1, 1, 1, 1, 1,
-1.581691, -0.2908715, -1.819548, 1, 1, 1, 1, 1,
-1.57131, -0.6762003, -3.226854, 0, 0, 1, 1, 1,
-1.565252, 1.92618, 1.111356, 1, 0, 0, 1, 1,
-1.547834, -1.616726, -2.5362, 1, 0, 0, 1, 1,
-1.545118, -0.5110981, -2.40582, 1, 0, 0, 1, 1,
-1.528596, 0.5376582, -1.242061, 1, 0, 0, 1, 1,
-1.513279, 0.8416749, -0.5862803, 1, 0, 0, 1, 1,
-1.49529, -2.478571, -3.504486, 0, 0, 0, 1, 1,
-1.494223, 1.126776, -0.6195698, 0, 0, 0, 1, 1,
-1.491114, 0.7432991, 0.7674789, 0, 0, 0, 1, 1,
-1.487197, -2.031609, -2.064814, 0, 0, 0, 1, 1,
-1.469074, 2.30961, 0.8863664, 0, 0, 0, 1, 1,
-1.466515, -2.18903, -2.624522, 0, 0, 0, 1, 1,
-1.463575, -1.100656, -2.381799, 0, 0, 0, 1, 1,
-1.452333, 0.5182125, -1.65003, 1, 1, 1, 1, 1,
-1.441267, 0.2022427, -1.93617, 1, 1, 1, 1, 1,
-1.42693, 0.2261381, -2.197072, 1, 1, 1, 1, 1,
-1.423127, -0.7157644, -2.719881, 1, 1, 1, 1, 1,
-1.420755, -0.05859019, -1.589166, 1, 1, 1, 1, 1,
-1.419131, -1.420013, -2.427975, 1, 1, 1, 1, 1,
-1.411664, -0.2521234, -0.6543144, 1, 1, 1, 1, 1,
-1.396495, -0.100163, -0.6253824, 1, 1, 1, 1, 1,
-1.392631, -1.295731, -1.010913, 1, 1, 1, 1, 1,
-1.391248, 0.3474824, -0.6742278, 1, 1, 1, 1, 1,
-1.378894, -0.1078157, -1.986169, 1, 1, 1, 1, 1,
-1.367449, -1.831293, -2.858196, 1, 1, 1, 1, 1,
-1.354284, 0.8624215, -0.4065809, 1, 1, 1, 1, 1,
-1.353792, -1.193124, -2.658201, 1, 1, 1, 1, 1,
-1.352008, 1.841398, 0.08830787, 1, 1, 1, 1, 1,
-1.346469, -0.4356283, -1.192737, 0, 0, 1, 1, 1,
-1.344958, 1.776176, -0.8239409, 1, 0, 0, 1, 1,
-1.32675, -2.107543, -2.213109, 1, 0, 0, 1, 1,
-1.315086, -1.097877, -1.716172, 1, 0, 0, 1, 1,
-1.311684, 0.9411851, -1.242755, 1, 0, 0, 1, 1,
-1.307684, 1.033008, -0.08588312, 1, 0, 0, 1, 1,
-1.304002, 0.3861256, -1.841681, 0, 0, 0, 1, 1,
-1.301719, 0.02183796, -1.630194, 0, 0, 0, 1, 1,
-1.298132, 1.211135, -0.6673542, 0, 0, 0, 1, 1,
-1.297028, -1.263141, -2.087316, 0, 0, 0, 1, 1,
-1.289119, 0.1301202, -2.616615, 0, 0, 0, 1, 1,
-1.287576, -0.2957847, -2.804137, 0, 0, 0, 1, 1,
-1.282797, 1.353227, -0.6635987, 0, 0, 0, 1, 1,
-1.281502, -0.2660694, -1.742319, 1, 1, 1, 1, 1,
-1.276187, -1.903733, -2.58603, 1, 1, 1, 1, 1,
-1.274871, -0.2349736, -0.4742991, 1, 1, 1, 1, 1,
-1.274643, -0.3132653, -3.206062, 1, 1, 1, 1, 1,
-1.257784, -1.462479, -3.030632, 1, 1, 1, 1, 1,
-1.246705, 1.082821, 0.4372174, 1, 1, 1, 1, 1,
-1.218713, -0.8008412, -0.9964746, 1, 1, 1, 1, 1,
-1.208871, -0.5827244, -3.062193, 1, 1, 1, 1, 1,
-1.205922, 0.7587129, -0.2264995, 1, 1, 1, 1, 1,
-1.202937, 0.04900402, -1.342986, 1, 1, 1, 1, 1,
-1.201881, 0.01003168, -0.7188754, 1, 1, 1, 1, 1,
-1.201452, 2.133835, -1.179115, 1, 1, 1, 1, 1,
-1.195158, 0.5009871, -0.6078002, 1, 1, 1, 1, 1,
-1.193887, -0.01486022, -1.839671, 1, 1, 1, 1, 1,
-1.185953, 0.6016992, -0.1496769, 1, 1, 1, 1, 1,
-1.179052, 2.253578, -1.535979, 0, 0, 1, 1, 1,
-1.178935, -0.4966549, -1.630221, 1, 0, 0, 1, 1,
-1.168229, -0.3471999, -0.8437357, 1, 0, 0, 1, 1,
-1.167258, -0.0195508, -2.890705, 1, 0, 0, 1, 1,
-1.161468, 0.4472447, -3.108004, 1, 0, 0, 1, 1,
-1.158327, -0.3524573, -1.515383, 1, 0, 0, 1, 1,
-1.150275, -1.205926, -1.678724, 0, 0, 0, 1, 1,
-1.150144, -0.8176744, -2.019516, 0, 0, 0, 1, 1,
-1.149744, -2.216809, -3.755665, 0, 0, 0, 1, 1,
-1.146889, -0.5328181, -2.698697, 0, 0, 0, 1, 1,
-1.139455, -0.6963118, -1.323469, 0, 0, 0, 1, 1,
-1.136489, -1.074324, -2.355088, 0, 0, 0, 1, 1,
-1.123611, -0.8223774, -1.125908, 0, 0, 0, 1, 1,
-1.122202, 0.7298957, -3.719811, 1, 1, 1, 1, 1,
-1.117531, -0.1133955, -1.852129, 1, 1, 1, 1, 1,
-1.11043, -0.6246296, -1.406061, 1, 1, 1, 1, 1,
-1.109673, -1.850019, -2.557129, 1, 1, 1, 1, 1,
-1.105596, 0.9557189, -1.303794, 1, 1, 1, 1, 1,
-1.098531, 1.389675, -2.32474, 1, 1, 1, 1, 1,
-1.095394, 1.460238, 0.7444147, 1, 1, 1, 1, 1,
-1.091662, -0.2731844, -1.577106, 1, 1, 1, 1, 1,
-1.091042, -0.8900391, -0.1993093, 1, 1, 1, 1, 1,
-1.089586, 0.2780608, -2.153128, 1, 1, 1, 1, 1,
-1.089155, 0.08668867, -1.596121, 1, 1, 1, 1, 1,
-1.081265, 1.234622, -0.5221559, 1, 1, 1, 1, 1,
-1.070558, 0.5448696, -1.54689, 1, 1, 1, 1, 1,
-1.07023, -0.3001702, -3.007543, 1, 1, 1, 1, 1,
-1.067997, 0.1127827, -1.562911, 1, 1, 1, 1, 1,
-1.064863, -1.047042, -1.672037, 0, 0, 1, 1, 1,
-1.063116, 1.080943, 0.7109975, 1, 0, 0, 1, 1,
-1.058421, -0.6143396, -3.38688, 1, 0, 0, 1, 1,
-1.057797, -0.7937613, -2.47512, 1, 0, 0, 1, 1,
-1.051505, -0.4901669, -2.340668, 1, 0, 0, 1, 1,
-1.046478, 0.9912114, -0.3432457, 1, 0, 0, 1, 1,
-1.031975, 0.04822436, -2.310625, 0, 0, 0, 1, 1,
-1.028985, 0.1695302, -1.129859, 0, 0, 0, 1, 1,
-1.023181, 0.9376057, -1.237503, 0, 0, 0, 1, 1,
-1.019909, -0.04561996, -3.448075, 0, 0, 0, 1, 1,
-1.019167, -2.052655, -3.359266, 0, 0, 0, 1, 1,
-1.01172, -1.121481, -2.447706, 0, 0, 0, 1, 1,
-1.001696, -0.2206018, 0.8556159, 0, 0, 0, 1, 1,
-1.001431, -1.104474, -3.117154, 1, 1, 1, 1, 1,
-0.997879, 0.2170904, -0.5772268, 1, 1, 1, 1, 1,
-0.9950384, -0.02949447, 0.2744153, 1, 1, 1, 1, 1,
-0.9933763, -0.3063816, -2.757121, 1, 1, 1, 1, 1,
-0.9900483, 0.9367216, -0.01484373, 1, 1, 1, 1, 1,
-0.9889451, 2.404284, 0.2894675, 1, 1, 1, 1, 1,
-0.9856263, 0.7539465, -0.8832825, 1, 1, 1, 1, 1,
-0.9851568, -1.742033, -1.16644, 1, 1, 1, 1, 1,
-0.967716, -0.0439036, -2.07206, 1, 1, 1, 1, 1,
-0.967574, 0.276461, -2.631978, 1, 1, 1, 1, 1,
-0.9672835, -0.006743171, -0.03623144, 1, 1, 1, 1, 1,
-0.9655578, -0.3034976, -0.6780729, 1, 1, 1, 1, 1,
-0.9654923, -0.3175324, -2.625491, 1, 1, 1, 1, 1,
-0.9619588, -0.8340088, -3.803704, 1, 1, 1, 1, 1,
-0.9482439, 0.2575177, -2.349642, 1, 1, 1, 1, 1,
-0.9481161, -1.012872, -1.926506, 0, 0, 1, 1, 1,
-0.9438105, -0.1768179, -2.400844, 1, 0, 0, 1, 1,
-0.9407082, 0.7073513, -0.678051, 1, 0, 0, 1, 1,
-0.931128, -2.224124, -2.92955, 1, 0, 0, 1, 1,
-0.927314, -0.2577651, -2.02563, 1, 0, 0, 1, 1,
-0.9244191, 0.2690451, -0.149504, 1, 0, 0, 1, 1,
-0.9242178, -0.139963, -2.424726, 0, 0, 0, 1, 1,
-0.9201376, -0.2886349, -2.886491, 0, 0, 0, 1, 1,
-0.9130424, -0.6744022, 0.2049453, 0, 0, 0, 1, 1,
-0.9112371, 0.4038998, 1.532109, 0, 0, 0, 1, 1,
-0.9063226, 0.9181795, -0.7147352, 0, 0, 0, 1, 1,
-0.9053444, 2.244229, -0.5271872, 0, 0, 0, 1, 1,
-0.9035891, 0.2275139, -1.059332, 0, 0, 0, 1, 1,
-0.8963791, -0.8255895, -0.9395069, 1, 1, 1, 1, 1,
-0.8953675, 0.3177934, -1.311366, 1, 1, 1, 1, 1,
-0.8881976, -1.752318, -1.93631, 1, 1, 1, 1, 1,
-0.887489, 0.02485066, -2.594005, 1, 1, 1, 1, 1,
-0.8859735, 0.4192772, -2.062796, 1, 1, 1, 1, 1,
-0.8850567, 0.5063624, -2.937613, 1, 1, 1, 1, 1,
-0.87457, 0.2102714, -1.919825, 1, 1, 1, 1, 1,
-0.8740583, 1.110165, -0.7522995, 1, 1, 1, 1, 1,
-0.8738258, -0.7928503, -4.479132, 1, 1, 1, 1, 1,
-0.8722883, -1.532379, -1.728583, 1, 1, 1, 1, 1,
-0.872287, -2.219128, -2.598749, 1, 1, 1, 1, 1,
-0.8717124, 0.2021746, -1.099996, 1, 1, 1, 1, 1,
-0.8656593, -1.311578, -3.095492, 1, 1, 1, 1, 1,
-0.8603774, 0.6059931, -0.1083384, 1, 1, 1, 1, 1,
-0.8540555, -0.1687033, -0.3972473, 1, 1, 1, 1, 1,
-0.8532009, 0.1910296, -2.926139, 0, 0, 1, 1, 1,
-0.8507443, -1.722834, -0.7756609, 1, 0, 0, 1, 1,
-0.8376482, 0.6417689, 0.2094186, 1, 0, 0, 1, 1,
-0.8359321, -0.6378232, -0.7366498, 1, 0, 0, 1, 1,
-0.8324529, 0.5160056, -3.011541, 1, 0, 0, 1, 1,
-0.8314006, 0.3593196, -1.280989, 1, 0, 0, 1, 1,
-0.8296302, 0.2399413, -1.130716, 0, 0, 0, 1, 1,
-0.820227, -0.7062948, -2.399015, 0, 0, 0, 1, 1,
-0.8035433, -1.227422, -2.184473, 0, 0, 0, 1, 1,
-0.7953979, -0.1042575, -1.776333, 0, 0, 0, 1, 1,
-0.7912472, -0.06815924, -2.013149, 0, 0, 0, 1, 1,
-0.7893944, 0.9520731, -1.904509, 0, 0, 0, 1, 1,
-0.7888202, 1.129175, 0.3130408, 0, 0, 0, 1, 1,
-0.7824991, 0.2672858, -1.065002, 1, 1, 1, 1, 1,
-0.7804345, 0.3646869, -0.6683517, 1, 1, 1, 1, 1,
-0.7803294, -1.974874, -4.062829, 1, 1, 1, 1, 1,
-0.7787418, -0.6158633, -2.12661, 1, 1, 1, 1, 1,
-0.7784706, -0.684845, -3.578996, 1, 1, 1, 1, 1,
-0.7754933, 0.5006464, -1.721176, 1, 1, 1, 1, 1,
-0.7696692, 0.625443, -0.9697773, 1, 1, 1, 1, 1,
-0.7662625, 0.6373207, 0.1097861, 1, 1, 1, 1, 1,
-0.7652892, -0.5108305, -1.62494, 1, 1, 1, 1, 1,
-0.7583528, -1.595082, -3.612294, 1, 1, 1, 1, 1,
-0.756682, -0.834745, -3.090096, 1, 1, 1, 1, 1,
-0.7454145, 0.9095074, -0.5414624, 1, 1, 1, 1, 1,
-0.7434396, -0.4636267, -1.803122, 1, 1, 1, 1, 1,
-0.7357737, -0.169923, -1.412814, 1, 1, 1, 1, 1,
-0.7333285, 0.6871722, -0.9345278, 1, 1, 1, 1, 1,
-0.7229815, 0.3317085, -0.03910724, 0, 0, 1, 1, 1,
-0.7221544, -0.2182432, -2.407062, 1, 0, 0, 1, 1,
-0.7160497, 0.681164, -1.779299, 1, 0, 0, 1, 1,
-0.7129576, -0.1548413, -4.309304, 1, 0, 0, 1, 1,
-0.7123691, -1.338972, -2.92308, 1, 0, 0, 1, 1,
-0.7090055, 1.321886, -0.4320257, 1, 0, 0, 1, 1,
-0.7073977, 1.830593, -0.4037118, 0, 0, 0, 1, 1,
-0.704653, -0.2369523, -1.438948, 0, 0, 0, 1, 1,
-0.6984903, 0.2089128, -3.050142, 0, 0, 0, 1, 1,
-0.6968814, 1.432542, 0.6260585, 0, 0, 0, 1, 1,
-0.695069, 1.018836, -0.02173395, 0, 0, 0, 1, 1,
-0.6939288, -0.01675829, -1.825493, 0, 0, 0, 1, 1,
-0.6936583, 1.03365, -1.556169, 0, 0, 0, 1, 1,
-0.6911699, -2.135618, -3.144606, 1, 1, 1, 1, 1,
-0.6779447, -2.012054, -1.207978, 1, 1, 1, 1, 1,
-0.6776369, -1.149287, -3.967231, 1, 1, 1, 1, 1,
-0.6769528, -0.4858018, -2.193991, 1, 1, 1, 1, 1,
-0.6768713, 1.216949, -3.29667, 1, 1, 1, 1, 1,
-0.6762183, -1.001194, -2.517794, 1, 1, 1, 1, 1,
-0.6714376, 0.8255138, -1.593706, 1, 1, 1, 1, 1,
-0.6711282, -0.6403328, -2.654655, 1, 1, 1, 1, 1,
-0.6693951, -0.1963583, -0.9873049, 1, 1, 1, 1, 1,
-0.6692507, 1.465838, 0.03152803, 1, 1, 1, 1, 1,
-0.6688118, -0.3510353, -2.073827, 1, 1, 1, 1, 1,
-0.6680635, -1.57761, -2.103852, 1, 1, 1, 1, 1,
-0.6668249, -0.8498327, -2.774248, 1, 1, 1, 1, 1,
-0.6665971, -0.5178927, -2.560735, 1, 1, 1, 1, 1,
-0.6632996, -1.594979, -4.585268, 1, 1, 1, 1, 1,
-0.6576034, 1.19023, 0.2279196, 0, 0, 1, 1, 1,
-0.6567131, -1.031433, -1.237071, 1, 0, 0, 1, 1,
-0.6562612, 0.7501608, 0.2542101, 1, 0, 0, 1, 1,
-0.6523828, 0.660102, -2.989486, 1, 0, 0, 1, 1,
-0.6508726, -0.3239046, -2.583639, 1, 0, 0, 1, 1,
-0.649592, -0.9228113, -3.339325, 1, 0, 0, 1, 1,
-0.649356, -0.5929788, -2.435235, 0, 0, 0, 1, 1,
-0.6488206, 1.167965, -0.2098086, 0, 0, 0, 1, 1,
-0.6480039, 1.635166, -0.4988565, 0, 0, 0, 1, 1,
-0.6468831, 1.208552, 0.05890291, 0, 0, 0, 1, 1,
-0.6415109, 0.02973845, -3.226536, 0, 0, 0, 1, 1,
-0.6407708, 2.308991, 0.1250526, 0, 0, 0, 1, 1,
-0.6400639, 0.3254431, -0.4190829, 0, 0, 0, 1, 1,
-0.6333376, 2.28543, -0.015731, 1, 1, 1, 1, 1,
-0.6324037, -2.065519, -3.054328, 1, 1, 1, 1, 1,
-0.6300716, 0.7918503, -2.692201, 1, 1, 1, 1, 1,
-0.629302, -1.438303, -2.504846, 1, 1, 1, 1, 1,
-0.6255445, 1.165509, -2.225543, 1, 1, 1, 1, 1,
-0.6001694, -0.6667337, -3.472921, 1, 1, 1, 1, 1,
-0.5975693, -1.805927, -3.181185, 1, 1, 1, 1, 1,
-0.5946059, 0.07871781, -2.606221, 1, 1, 1, 1, 1,
-0.590107, 0.7221674, 0.3769299, 1, 1, 1, 1, 1,
-0.5885541, -1.893379, -0.978753, 1, 1, 1, 1, 1,
-0.579042, 0.5062168, 1.107855, 1, 1, 1, 1, 1,
-0.577376, -1.353559, -2.536184, 1, 1, 1, 1, 1,
-0.5708373, -0.4508566, -1.35153, 1, 1, 1, 1, 1,
-0.5661495, -0.5816894, -3.474849, 1, 1, 1, 1, 1,
-0.5654628, -0.2335605, -1.750006, 1, 1, 1, 1, 1,
-0.5633904, 0.4352669, -2.391616, 0, 0, 1, 1, 1,
-0.5632265, 0.5024615, -0.1532256, 1, 0, 0, 1, 1,
-0.56096, 0.07048181, -2.067999, 1, 0, 0, 1, 1,
-0.557443, -0.3798265, -1.949323, 1, 0, 0, 1, 1,
-0.5537488, -2.352334, -2.989153, 1, 0, 0, 1, 1,
-0.5460703, -0.4327248, -2.63306, 1, 0, 0, 1, 1,
-0.5444311, 1.390044, 0.9224869, 0, 0, 0, 1, 1,
-0.5410577, -0.7532472, -1.525823, 0, 0, 0, 1, 1,
-0.5391243, -1.657199, -3.213934, 0, 0, 0, 1, 1,
-0.5375068, -1.83298, -1.553644, 0, 0, 0, 1, 1,
-0.5290246, 0.6936051, -2.44084, 0, 0, 0, 1, 1,
-0.5273684, 0.9360381, -0.7322623, 0, 0, 0, 1, 1,
-0.5254068, 1.997091, -0.9966066, 0, 0, 0, 1, 1,
-0.5175614, -0.4134478, -2.508333, 1, 1, 1, 1, 1,
-0.5167628, -0.5669948, -3.285345, 1, 1, 1, 1, 1,
-0.5161558, -2.065209, -2.666576, 1, 1, 1, 1, 1,
-0.511345, 1.52542, -1.005675, 1, 1, 1, 1, 1,
-0.5112746, -2.819445, -3.711052, 1, 1, 1, 1, 1,
-0.5087604, 0.8484769, 0.2059981, 1, 1, 1, 1, 1,
-0.5085987, -0.6545293, -2.037725, 1, 1, 1, 1, 1,
-0.5073166, -0.2875815, -2.601613, 1, 1, 1, 1, 1,
-0.507099, 0.09235554, -0.8607532, 1, 1, 1, 1, 1,
-0.5068483, -0.6186657, -2.003866, 1, 1, 1, 1, 1,
-0.5006722, 0.3802506, 0.4025231, 1, 1, 1, 1, 1,
-0.5003783, -0.9885636, -1.366283, 1, 1, 1, 1, 1,
-0.500331, -0.07409646, -1.960518, 1, 1, 1, 1, 1,
-0.4948783, 0.2647319, -0.9890679, 1, 1, 1, 1, 1,
-0.4946988, 0.004270625, -1.856307, 1, 1, 1, 1, 1,
-0.49281, -1.003412, -3.796274, 0, 0, 1, 1, 1,
-0.4910741, 0.4372528, -1.275951, 1, 0, 0, 1, 1,
-0.4905189, -0.9386074, 0.1238633, 1, 0, 0, 1, 1,
-0.4887496, 1.81424, -1.519915, 1, 0, 0, 1, 1,
-0.4884583, -1.517302, -4.310091, 1, 0, 0, 1, 1,
-0.4851572, 0.6269688, 0.8006591, 1, 0, 0, 1, 1,
-0.484145, 0.4945765, -0.5987969, 0, 0, 0, 1, 1,
-0.4794472, -0.7420539, -4.098869, 0, 0, 0, 1, 1,
-0.4788853, 0.2100586, -0.436864, 0, 0, 0, 1, 1,
-0.4767242, -0.4704296, -3.856416, 0, 0, 0, 1, 1,
-0.4741883, 0.4672098, 0.5740014, 0, 0, 0, 1, 1,
-0.4723853, 1.529993, 1.198819, 0, 0, 0, 1, 1,
-0.4722055, -0.176655, -2.457694, 0, 0, 0, 1, 1,
-0.4700164, 0.354801, -1.372117, 1, 1, 1, 1, 1,
-0.4664616, -0.376813, -2.504294, 1, 1, 1, 1, 1,
-0.4553409, -1.110734, -1.905825, 1, 1, 1, 1, 1,
-0.4547147, 0.4733439, -1.798101, 1, 1, 1, 1, 1,
-0.4512684, -0.5016403, -3.258027, 1, 1, 1, 1, 1,
-0.4512431, -0.4501354, -1.351102, 1, 1, 1, 1, 1,
-0.4508181, 0.488791, -1.970137, 1, 1, 1, 1, 1,
-0.4483921, -0.7727857, -2.355067, 1, 1, 1, 1, 1,
-0.447963, 0.6531003, 1.266638, 1, 1, 1, 1, 1,
-0.4475225, 0.03575517, -2.582178, 1, 1, 1, 1, 1,
-0.4467221, -0.5604058, -2.510126, 1, 1, 1, 1, 1,
-0.4436645, 1.868208, 1.438002, 1, 1, 1, 1, 1,
-0.4430926, 1.80721, 0.4925135, 1, 1, 1, 1, 1,
-0.4418148, -0.6409629, -0.8281826, 1, 1, 1, 1, 1,
-0.4410551, -0.3897752, -3.373855, 1, 1, 1, 1, 1,
-0.4185431, -0.2698802, -2.859828, 0, 0, 1, 1, 1,
-0.41482, -0.8500039, -1.38116, 1, 0, 0, 1, 1,
-0.4144942, 0.8308431, -0.101788, 1, 0, 0, 1, 1,
-0.4097692, -0.2706183, -2.482798, 1, 0, 0, 1, 1,
-0.4063424, 0.662954, 0.3606395, 1, 0, 0, 1, 1,
-0.4035667, -0.04971286, -1.856732, 1, 0, 0, 1, 1,
-0.4012293, 0.9194216, -0.4940789, 0, 0, 0, 1, 1,
-0.4008226, 0.4387835, -1.360144, 0, 0, 0, 1, 1,
-0.3989286, 1.251765, 2.147437, 0, 0, 0, 1, 1,
-0.3988336, 0.02156477, -1.850891, 0, 0, 0, 1, 1,
-0.394293, -1.108478, -5.229398, 0, 0, 0, 1, 1,
-0.3927244, 1.371915, -1.682962, 0, 0, 0, 1, 1,
-0.3907403, 0.4438755, -2.012904, 0, 0, 0, 1, 1,
-0.3896701, -0.8584554, -4.325442, 1, 1, 1, 1, 1,
-0.3862416, -1.02356, -2.116208, 1, 1, 1, 1, 1,
-0.377997, -0.9480253, -1.2179, 1, 1, 1, 1, 1,
-0.3773128, 1.222909, -0.4950133, 1, 1, 1, 1, 1,
-0.375956, -0.483247, -1.468383, 1, 1, 1, 1, 1,
-0.3747244, 2.178813, 0.2426042, 1, 1, 1, 1, 1,
-0.3715755, 0.7541709, -0.08148585, 1, 1, 1, 1, 1,
-0.3700955, -1.286775, -1.519762, 1, 1, 1, 1, 1,
-0.3671761, 0.6146563, -0.3601621, 1, 1, 1, 1, 1,
-0.3665343, -1.193218, -2.686113, 1, 1, 1, 1, 1,
-0.3654346, -1.142516, -2.628928, 1, 1, 1, 1, 1,
-0.3642856, 1.531951, -0.9131645, 1, 1, 1, 1, 1,
-0.3621092, -1.852428, -2.826077, 1, 1, 1, 1, 1,
-0.3616826, 0.3251593, -2.247941, 1, 1, 1, 1, 1,
-0.3572659, -0.149673, -0.5854385, 1, 1, 1, 1, 1,
-0.3567048, -0.2372954, -2.657254, 0, 0, 1, 1, 1,
-0.3547689, 0.3438266, 0.3759595, 1, 0, 0, 1, 1,
-0.3527732, -0.309583, -3.284261, 1, 0, 0, 1, 1,
-0.3500631, 0.7771549, 1.486572, 1, 0, 0, 1, 1,
-0.3497485, 2.141733, -0.874678, 1, 0, 0, 1, 1,
-0.3477541, 0.04570734, -0.6490084, 1, 0, 0, 1, 1,
-0.3460656, 0.7205893, -1.534132, 0, 0, 0, 1, 1,
-0.3451659, -0.5924052, -5.087024, 0, 0, 0, 1, 1,
-0.3427948, 1.360489, -0.3498009, 0, 0, 0, 1, 1,
-0.338172, 0.835471, -1.120985, 0, 0, 0, 1, 1,
-0.3359391, -1.136004, -3.250024, 0, 0, 0, 1, 1,
-0.3339708, 0.02339589, -2.244143, 0, 0, 0, 1, 1,
-0.3297157, 0.2157269, -0.7295251, 0, 0, 0, 1, 1,
-0.328975, 0.4444992, -0.1649382, 1, 1, 1, 1, 1,
-0.3252681, 1.204705, 0.6008093, 1, 1, 1, 1, 1,
-0.3227194, -0.587197, -5.246292, 1, 1, 1, 1, 1,
-0.3213831, -0.008779673, -2.854155, 1, 1, 1, 1, 1,
-0.3203058, -1.677897, -4.281296, 1, 1, 1, 1, 1,
-0.3178975, -0.8466832, -3.564507, 1, 1, 1, 1, 1,
-0.3159385, -0.2362004, -2.884603, 1, 1, 1, 1, 1,
-0.3147556, -0.4360989, -0.3111062, 1, 1, 1, 1, 1,
-0.3114097, 1.153892, 0.6128156, 1, 1, 1, 1, 1,
-0.3085144, 0.04833049, -0.7762541, 1, 1, 1, 1, 1,
-0.3005678, 0.6969478, 0.1731768, 1, 1, 1, 1, 1,
-0.2977254, -0.1392901, -1.23379, 1, 1, 1, 1, 1,
-0.2940248, 2.024272, -0.9323504, 1, 1, 1, 1, 1,
-0.2929995, -0.2622367, -2.227612, 1, 1, 1, 1, 1,
-0.2898632, -1.54795, -2.649112, 1, 1, 1, 1, 1,
-0.2874387, -0.2477061, -0.4477117, 0, 0, 1, 1, 1,
-0.2859147, 0.4161061, -0.2166821, 1, 0, 0, 1, 1,
-0.284647, -1.058706, -3.862916, 1, 0, 0, 1, 1,
-0.2833866, 0.3801627, -1.065395, 1, 0, 0, 1, 1,
-0.2656315, 0.5147552, 0.6429766, 1, 0, 0, 1, 1,
-0.2649454, 0.1621034, -1.863332, 1, 0, 0, 1, 1,
-0.2640635, -2.112022, -3.809767, 0, 0, 0, 1, 1,
-0.2624483, 0.1010831, -0.6608036, 0, 0, 0, 1, 1,
-0.2619541, -0.1606845, -3.083753, 0, 0, 0, 1, 1,
-0.261323, 2.39292, 0.1357002, 0, 0, 0, 1, 1,
-0.2611253, -1.413239, -2.346763, 0, 0, 0, 1, 1,
-0.260711, -1.777489, -1.800774, 0, 0, 0, 1, 1,
-0.2593123, -0.926888, -2.366619, 0, 0, 0, 1, 1,
-0.2558577, 0.9245231, -0.4356323, 1, 1, 1, 1, 1,
-0.2543513, -0.09917364, -1.693143, 1, 1, 1, 1, 1,
-0.2527526, -0.6522253, -1.86632, 1, 1, 1, 1, 1,
-0.2487176, -2.093766, -1.694196, 1, 1, 1, 1, 1,
-0.2431681, -2.170519, -3.404335, 1, 1, 1, 1, 1,
-0.2416434, 0.7050871, -2.194927, 1, 1, 1, 1, 1,
-0.2381473, -0.7342575, -3.171709, 1, 1, 1, 1, 1,
-0.2374456, -1.410897, -3.159816, 1, 1, 1, 1, 1,
-0.2331246, 0.361958, -0.7584565, 1, 1, 1, 1, 1,
-0.2290591, 0.61922, -0.6169705, 1, 1, 1, 1, 1,
-0.2249517, 0.1971775, 0.7977291, 1, 1, 1, 1, 1,
-0.2188616, 0.03501778, -1.423634, 1, 1, 1, 1, 1,
-0.2155463, 0.7529073, -0.7032477, 1, 1, 1, 1, 1,
-0.2153767, -0.2931787, -2.146921, 1, 1, 1, 1, 1,
-0.2150927, 0.9853085, 0.4621924, 1, 1, 1, 1, 1,
-0.2141234, 0.3753584, 1.222357, 0, 0, 1, 1, 1,
-0.2123089, -0.768246, -2.855692, 1, 0, 0, 1, 1,
-0.2119559, 3.524865, 0.3479367, 1, 0, 0, 1, 1,
-0.2112096, 1.649016, -0.507126, 1, 0, 0, 1, 1,
-0.2104603, 0.740133, -0.5577636, 1, 0, 0, 1, 1,
-0.2098259, 0.1597604, -3.215481, 1, 0, 0, 1, 1,
-0.2033363, 1.04452, 0.3839612, 0, 0, 0, 1, 1,
-0.2029164, 2.58139, -0.230249, 0, 0, 0, 1, 1,
-0.2009104, 0.8720219, -0.9088489, 0, 0, 0, 1, 1,
-0.1992695, 0.6599211, 0.6449931, 0, 0, 0, 1, 1,
-0.1923197, -0.7236684, -3.213018, 0, 0, 0, 1, 1,
-0.1920125, 0.779283, 1.49511, 0, 0, 0, 1, 1,
-0.1912711, 0.08953607, -0.2227243, 0, 0, 0, 1, 1,
-0.1873169, 1.835634, 0.2154703, 1, 1, 1, 1, 1,
-0.1832189, -0.4200287, -0.992085, 1, 1, 1, 1, 1,
-0.1793827, 0.225773, 0.01747449, 1, 1, 1, 1, 1,
-0.1729746, 1.846105, 0.5771365, 1, 1, 1, 1, 1,
-0.1699851, -0.1617147, -2.148835, 1, 1, 1, 1, 1,
-0.165599, -0.7930079, -2.436212, 1, 1, 1, 1, 1,
-0.1597662, 1.767684, 0.6235152, 1, 1, 1, 1, 1,
-0.1595781, -0.154802, -2.899024, 1, 1, 1, 1, 1,
-0.159039, 0.8748904, 0.4376236, 1, 1, 1, 1, 1,
-0.1584506, -0.2569917, -1.504538, 1, 1, 1, 1, 1,
-0.1553372, -0.6719783, -3.59307, 1, 1, 1, 1, 1,
-0.152029, 0.1553497, -0.9280018, 1, 1, 1, 1, 1,
-0.1520007, -0.06842517, -1.104622, 1, 1, 1, 1, 1,
-0.1510506, -0.9823122, -4.253336, 1, 1, 1, 1, 1,
-0.1465756, -0.7770806, -4.150387, 1, 1, 1, 1, 1,
-0.1460522, 0.5526327, -0.2771795, 0, 0, 1, 1, 1,
-0.1415185, 2.758923, 1.825004, 1, 0, 0, 1, 1,
-0.1407125, -1.476371, -1.041583, 1, 0, 0, 1, 1,
-0.1368276, 0.09613714, 0.5962672, 1, 0, 0, 1, 1,
-0.1361378, 0.3032845, -0.4708729, 1, 0, 0, 1, 1,
-0.1360693, 0.6108189, 0.9764781, 1, 0, 0, 1, 1,
-0.135451, -0.3310374, -4.489288, 0, 0, 0, 1, 1,
-0.1343477, 0.840044, 0.4006653, 0, 0, 0, 1, 1,
-0.1334532, -0.2189008, -3.318514, 0, 0, 0, 1, 1,
-0.1294268, 1.663864, -0.1664277, 0, 0, 0, 1, 1,
-0.1288843, -0.6611081, -3.367128, 0, 0, 0, 1, 1,
-0.1160824, 0.4833513, -1.919017, 0, 0, 0, 1, 1,
-0.1133384, 0.5044419, -0.03088042, 0, 0, 0, 1, 1,
-0.1130758, -0.7334606, -1.953014, 1, 1, 1, 1, 1,
-0.1126536, -1.112777, -1.962836, 1, 1, 1, 1, 1,
-0.1079135, 0.1802448, -1.511732, 1, 1, 1, 1, 1,
-0.1073502, 0.2255684, -0.8270667, 1, 1, 1, 1, 1,
-0.1036233, -0.1555425, -1.687854, 1, 1, 1, 1, 1,
-0.102889, 0.2521792, -0.3736768, 1, 1, 1, 1, 1,
-0.09918581, -1.389725, -2.373396, 1, 1, 1, 1, 1,
-0.09748084, 0.6771671, -0.0803744, 1, 1, 1, 1, 1,
-0.09692113, -0.8688861, -3.902387, 1, 1, 1, 1, 1,
-0.09459426, 1.101559, 0.5752654, 1, 1, 1, 1, 1,
-0.09452377, 1.117133, -0.5924396, 1, 1, 1, 1, 1,
-0.09227227, -1.277615, -2.50485, 1, 1, 1, 1, 1,
-0.08660948, 0.6465353, -0.7782801, 1, 1, 1, 1, 1,
-0.08629643, 0.1654921, -0.03738437, 1, 1, 1, 1, 1,
-0.08336368, 2.275391, -0.2284118, 1, 1, 1, 1, 1,
-0.08294033, -0.2324728, -3.617283, 0, 0, 1, 1, 1,
-0.08244997, 0.0639152, 0.5640513, 1, 0, 0, 1, 1,
-0.08193112, 0.7985019, -2.193784, 1, 0, 0, 1, 1,
-0.0801117, 1.685709, -0.1236844, 1, 0, 0, 1, 1,
-0.07926705, 0.9751975, 1.465871, 1, 0, 0, 1, 1,
-0.07790676, -0.3058745, -2.286689, 1, 0, 0, 1, 1,
-0.07517532, 1.28554, -0.7390543, 0, 0, 0, 1, 1,
-0.07495204, -0.2390976, -1.970112, 0, 0, 0, 1, 1,
-0.07053336, 0.2798267, 0.5781143, 0, 0, 0, 1, 1,
-0.06469236, -0.8655947, -2.34736, 0, 0, 0, 1, 1,
-0.0639827, 0.9668384, -0.6855097, 0, 0, 0, 1, 1,
-0.06040446, 0.2821827, 1.81143, 0, 0, 0, 1, 1,
-0.05348801, 1.023071, 0.4533708, 0, 0, 0, 1, 1,
-0.05334895, 0.06578677, -0.09238102, 1, 1, 1, 1, 1,
-0.05007221, 1.068056, -0.9669475, 1, 1, 1, 1, 1,
-0.04985537, -0.8933581, -2.331862, 1, 1, 1, 1, 1,
-0.04755762, 0.9143388, -0.003261011, 1, 1, 1, 1, 1,
-0.04598249, 0.174762, 0.04772125, 1, 1, 1, 1, 1,
-0.04079454, -0.7426684, -3.096793, 1, 1, 1, 1, 1,
-0.04050489, 2.2104, 1.92838, 1, 1, 1, 1, 1,
-0.03797286, -0.7409573, -2.647796, 1, 1, 1, 1, 1,
-0.0356985, 1.089468, -0.3200812, 1, 1, 1, 1, 1,
-0.03452545, 1.134741, -0.1814286, 1, 1, 1, 1, 1,
-0.03096908, -0.3949815, -0.1562829, 1, 1, 1, 1, 1,
-0.03039095, -1.66845, -4.884552, 1, 1, 1, 1, 1,
-0.02932665, 1.303814, 0.06014396, 1, 1, 1, 1, 1,
-0.0232296, 0.4680748, 2.165302, 1, 1, 1, 1, 1,
-0.01908499, 1.024579, 1.670817, 1, 1, 1, 1, 1,
-0.01863462, 0.4911039, -0.9568099, 0, 0, 1, 1, 1,
-0.003271754, -0.3679793, -4.382835, 1, 0, 0, 1, 1,
-0.001204491, -0.4243328, -2.42039, 1, 0, 0, 1, 1,
0.003443914, 1.025227, 1.582412, 1, 0, 0, 1, 1,
0.008805801, -0.4580121, 4.945543, 1, 0, 0, 1, 1,
0.01044133, -0.9781916, 4.587448, 1, 0, 0, 1, 1,
0.01284423, 1.988854, 0.2273218, 0, 0, 0, 1, 1,
0.0135767, 0.570802, -0.8713589, 0, 0, 0, 1, 1,
0.01700211, 0.1817906, -1.851086, 0, 0, 0, 1, 1,
0.01717828, 0.04930829, 0.4032615, 0, 0, 0, 1, 1,
0.01965184, -1.085038, 4.485643, 0, 0, 0, 1, 1,
0.0207755, 0.420941, -0.1587783, 0, 0, 0, 1, 1,
0.02136716, 0.06860357, 0.8792281, 0, 0, 0, 1, 1,
0.02174019, 0.1226435, 0.3866185, 1, 1, 1, 1, 1,
0.02735861, 1.012253, 0.6611646, 1, 1, 1, 1, 1,
0.02829437, -0.525438, 3.843103, 1, 1, 1, 1, 1,
0.02901244, 0.6227054, 0.05194454, 1, 1, 1, 1, 1,
0.03003745, 0.6707553, -1.491867, 1, 1, 1, 1, 1,
0.03005392, 0.1305199, 0.3881324, 1, 1, 1, 1, 1,
0.03118155, -0.7522764, 2.245929, 1, 1, 1, 1, 1,
0.03435707, -2.245953, 2.773144, 1, 1, 1, 1, 1,
0.03519805, -0.048228, 2.82217, 1, 1, 1, 1, 1,
0.03652423, -0.9060798, 3.60812, 1, 1, 1, 1, 1,
0.04746775, 0.4267774, 0.9834684, 1, 1, 1, 1, 1,
0.05138485, -0.2367747, 4.973746, 1, 1, 1, 1, 1,
0.05369995, 1.419904, 0.04327107, 1, 1, 1, 1, 1,
0.05640602, 0.5647005, -0.2813064, 1, 1, 1, 1, 1,
0.05957249, 0.4272007, 0.5937648, 1, 1, 1, 1, 1,
0.06118651, 0.5735573, 0.6647659, 0, 0, 1, 1, 1,
0.06507529, -0.284591, 3.516182, 1, 0, 0, 1, 1,
0.06513584, -0.1001424, 1.92679, 1, 0, 0, 1, 1,
0.06584027, -0.8466324, 3.982059, 1, 0, 0, 1, 1,
0.06945228, -2.08479, 4.473263, 1, 0, 0, 1, 1,
0.07093292, -0.6111089, 5.129537, 1, 0, 0, 1, 1,
0.07275334, 0.1000821, -0.1542669, 0, 0, 0, 1, 1,
0.07313734, -1.089708, 3.555159, 0, 0, 0, 1, 1,
0.0751447, -0.2544731, 3.960588, 0, 0, 0, 1, 1,
0.07627863, -0.4837296, 0.9955885, 0, 0, 0, 1, 1,
0.08197633, -1.218745, 2.859975, 0, 0, 0, 1, 1,
0.08219548, 0.2106009, 0.5676209, 0, 0, 0, 1, 1,
0.0826965, -1.352608, 1.628732, 0, 0, 0, 1, 1,
0.09038636, 1.317087, 1.286485, 1, 1, 1, 1, 1,
0.09603955, 0.412933, 2.130614, 1, 1, 1, 1, 1,
0.09649723, 0.07924513, 0.7374072, 1, 1, 1, 1, 1,
0.1074273, 0.9994999, 0.1049265, 1, 1, 1, 1, 1,
0.1110249, 2.02355, -0.3714539, 1, 1, 1, 1, 1,
0.1114298, -1.026473, 2.818362, 1, 1, 1, 1, 1,
0.1119759, -0.253132, 2.105647, 1, 1, 1, 1, 1,
0.1159355, -1.52757, 3.975563, 1, 1, 1, 1, 1,
0.118648, -1.184005, 1.291709, 1, 1, 1, 1, 1,
0.1194484, -1.378623, 2.785359, 1, 1, 1, 1, 1,
0.1237962, 0.8083684, -1.782192, 1, 1, 1, 1, 1,
0.1245596, -0.8241959, 3.214097, 1, 1, 1, 1, 1,
0.1255615, 0.1482798, 0.3646477, 1, 1, 1, 1, 1,
0.1267704, -0.2507278, 0.3274948, 1, 1, 1, 1, 1,
0.1285324, -0.7439891, 3.109344, 1, 1, 1, 1, 1,
0.1305773, -0.1269928, 3.990626, 0, 0, 1, 1, 1,
0.1337778, -0.09817261, 0.4333967, 1, 0, 0, 1, 1,
0.1356583, -2.088974, 4.28621, 1, 0, 0, 1, 1,
0.1361379, -0.3070985, 5.646092, 1, 0, 0, 1, 1,
0.1371205, -0.780523, 3.220906, 1, 0, 0, 1, 1,
0.1372386, 0.0103052, 1.726419, 1, 0, 0, 1, 1,
0.1508256, 0.5325283, 0.6887309, 0, 0, 0, 1, 1,
0.152495, 0.8038722, 1.310585, 0, 0, 0, 1, 1,
0.1594805, -0.1249069, 2.159957, 0, 0, 0, 1, 1,
0.1605114, 2.474046, 0.5530474, 0, 0, 0, 1, 1,
0.1610304, -1.184225, 3.200428, 0, 0, 0, 1, 1,
0.1611753, 1.646667, -1.191572, 0, 0, 0, 1, 1,
0.1627809, 1.545456, -0.2704994, 0, 0, 0, 1, 1,
0.1670527, 0.661039, 1.333563, 1, 1, 1, 1, 1,
0.1675126, 0.09950266, 2.430019, 1, 1, 1, 1, 1,
0.1706825, -0.8455901, 2.122895, 1, 1, 1, 1, 1,
0.1728676, -1.743655, 3.04367, 1, 1, 1, 1, 1,
0.1743737, -0.5177909, 4.653174, 1, 1, 1, 1, 1,
0.1753312, -0.7019555, 2.287713, 1, 1, 1, 1, 1,
0.1790599, 0.9521299, 1.513652, 1, 1, 1, 1, 1,
0.1830939, 0.9026766, 1.174451, 1, 1, 1, 1, 1,
0.1835184, -0.8065214, 1.084514, 1, 1, 1, 1, 1,
0.1836538, -0.3526635, 2.602015, 1, 1, 1, 1, 1,
0.1842602, -1.689817, 3.487463, 1, 1, 1, 1, 1,
0.1843238, 1.076253, 0.872538, 1, 1, 1, 1, 1,
0.1889936, -1.908248, 2.170354, 1, 1, 1, 1, 1,
0.1996337, -0.5115992, 2.456617, 1, 1, 1, 1, 1,
0.2026998, 0.8604291, -0.1822458, 1, 1, 1, 1, 1,
0.2077131, -0.4036343, 1.463451, 0, 0, 1, 1, 1,
0.2079114, -1.690607, 2.695639, 1, 0, 0, 1, 1,
0.2095439, -1.902859, 3.0855, 1, 0, 0, 1, 1,
0.2176665, -1.082434, 3.357323, 1, 0, 0, 1, 1,
0.2177591, -0.957019, 2.468332, 1, 0, 0, 1, 1,
0.2192021, -0.4835641, 3.378725, 1, 0, 0, 1, 1,
0.2209168, 1.430411, -1.308627, 0, 0, 0, 1, 1,
0.2225161, 0.1400991, 1.704441, 0, 0, 0, 1, 1,
0.2225587, -1.060372, 5.281794, 0, 0, 0, 1, 1,
0.2238598, 0.04420776, 2.396885, 0, 0, 0, 1, 1,
0.2251668, 0.1037176, 0.9534127, 0, 0, 0, 1, 1,
0.2260816, -0.30739, 3.875348, 0, 0, 0, 1, 1,
0.2269957, 0.03961527, 1.349782, 0, 0, 0, 1, 1,
0.2272079, 0.9249206, 0.5808873, 1, 1, 1, 1, 1,
0.2345262, -0.8394972, 1.55124, 1, 1, 1, 1, 1,
0.2354969, -0.5678753, 3.268553, 1, 1, 1, 1, 1,
0.2377785, -0.1265413, 2.326649, 1, 1, 1, 1, 1,
0.2440207, -0.1958115, 1.532864, 1, 1, 1, 1, 1,
0.2504002, -1.802871, 3.360362, 1, 1, 1, 1, 1,
0.2550426, 1.757296, -0.1550778, 1, 1, 1, 1, 1,
0.2585488, -0.6208363, 3.482988, 1, 1, 1, 1, 1,
0.2586929, 0.6788688, 0.8759243, 1, 1, 1, 1, 1,
0.2588812, 1.354116, 0.2721201, 1, 1, 1, 1, 1,
0.2605065, -0.706297, 3.390657, 1, 1, 1, 1, 1,
0.2675362, -0.9376205, 3.58816, 1, 1, 1, 1, 1,
0.2681896, 1.467538, -0.2554651, 1, 1, 1, 1, 1,
0.2703338, -0.2948705, 2.604151, 1, 1, 1, 1, 1,
0.271507, 1.243342, 1.488305, 1, 1, 1, 1, 1,
0.2724591, 0.7551067, 0.5891002, 0, 0, 1, 1, 1,
0.2727786, 0.3268883, 1.091746, 1, 0, 0, 1, 1,
0.2753892, 0.02775628, 1.266545, 1, 0, 0, 1, 1,
0.2758029, -0.08017014, 2.144734, 1, 0, 0, 1, 1,
0.2784784, 0.1561312, -0.06901235, 1, 0, 0, 1, 1,
0.2815239, 0.6037439, -1.60575, 1, 0, 0, 1, 1,
0.2827626, 0.6036672, 0.397116, 0, 0, 0, 1, 1,
0.2860245, -0.6389064, 2.556024, 0, 0, 0, 1, 1,
0.2861338, -0.3248259, 3.21652, 0, 0, 0, 1, 1,
0.2878602, 0.130896, 2.287893, 0, 0, 0, 1, 1,
0.2975349, 0.5505338, 0.5031033, 0, 0, 0, 1, 1,
0.2982692, -0.6697451, 0.9586358, 0, 0, 0, 1, 1,
0.3004346, -0.5979308, 3.061419, 0, 0, 0, 1, 1,
0.3004386, -1.580197, 4.391971, 1, 1, 1, 1, 1,
0.3014239, -0.9720417, 3.751541, 1, 1, 1, 1, 1,
0.3049235, -1.020736, 1.946287, 1, 1, 1, 1, 1,
0.3061525, 1.041154, -0.5725819, 1, 1, 1, 1, 1,
0.3104959, 0.9639927, 1.405275, 1, 1, 1, 1, 1,
0.3120812, 0.5028691, 2.212749, 1, 1, 1, 1, 1,
0.3130575, -0.8021196, 3.395419, 1, 1, 1, 1, 1,
0.3138301, 0.776949, -0.9581041, 1, 1, 1, 1, 1,
0.3138742, 1.139627, -0.7919259, 1, 1, 1, 1, 1,
0.3163126, -0.7404537, 2.260715, 1, 1, 1, 1, 1,
0.3281577, 0.4986906, -0.3083747, 1, 1, 1, 1, 1,
0.3315493, 1.069741, -0.5686042, 1, 1, 1, 1, 1,
0.3333905, -0.4392818, 2.468131, 1, 1, 1, 1, 1,
0.3347524, 1.273197, 0.4314381, 1, 1, 1, 1, 1,
0.3349541, 0.9471517, 1.422851, 1, 1, 1, 1, 1,
0.3449484, 0.7861241, -0.9981063, 0, 0, 1, 1, 1,
0.3450252, 0.4593322, 1.687186, 1, 0, 0, 1, 1,
0.3497368, -0.6617644, 2.644878, 1, 0, 0, 1, 1,
0.3562169, -1.420656, 4.341268, 1, 0, 0, 1, 1,
0.3579432, -0.5959859, 0.8842996, 1, 0, 0, 1, 1,
0.3654981, -0.5575347, 0.7486915, 1, 0, 0, 1, 1,
0.3705264, -0.2353967, 2.269718, 0, 0, 0, 1, 1,
0.3736005, -1.155334, 4.488302, 0, 0, 0, 1, 1,
0.3764528, 0.3892799, 2.033818, 0, 0, 0, 1, 1,
0.3797948, 1.21325, -0.8971502, 0, 0, 0, 1, 1,
0.3814778, -0.6928401, 3.094079, 0, 0, 0, 1, 1,
0.3833013, 0.05429116, 0.2037628, 0, 0, 0, 1, 1,
0.3839248, 0.5114301, 1.173285, 0, 0, 0, 1, 1,
0.3880887, -0.4745958, 2.859976, 1, 1, 1, 1, 1,
0.3906161, 0.0108112, 0.9589555, 1, 1, 1, 1, 1,
0.3971328, 0.9515412, 2.442974, 1, 1, 1, 1, 1,
0.3981513, 0.2109076, 0.468017, 1, 1, 1, 1, 1,
0.3990799, -0.2363663, 1.434479, 1, 1, 1, 1, 1,
0.400739, -0.1739873, 1.760559, 1, 1, 1, 1, 1,
0.4046817, 0.842432, 0.9276974, 1, 1, 1, 1, 1,
0.419889, -0.4331487, 2.949809, 1, 1, 1, 1, 1,
0.4340002, 1.892458, -0.8641089, 1, 1, 1, 1, 1,
0.4349957, -0.7634209, 2.045064, 1, 1, 1, 1, 1,
0.4373938, 0.2587622, 1.311696, 1, 1, 1, 1, 1,
0.4383875, -0.929689, 1.866293, 1, 1, 1, 1, 1,
0.4386075, -1.770268, 3.018208, 1, 1, 1, 1, 1,
0.4419088, 0.6231533, -0.63555, 1, 1, 1, 1, 1,
0.4429896, 0.6613792, 0.6567129, 1, 1, 1, 1, 1,
0.4574741, -1.571797, 2.361319, 0, 0, 1, 1, 1,
0.4575166, -0.6527936, 2.024849, 1, 0, 0, 1, 1,
0.4591454, 0.6183326, -0.5774488, 1, 0, 0, 1, 1,
0.4622152, 1.73714, 1.241538, 1, 0, 0, 1, 1,
0.4622328, 2.137565, -1.141596, 1, 0, 0, 1, 1,
0.464239, 1.117963, -0.5774719, 1, 0, 0, 1, 1,
0.4649597, 1.457952, -2.218634, 0, 0, 0, 1, 1,
0.4673603, -0.7058507, 3.115534, 0, 0, 0, 1, 1,
0.4678016, 1.470181, 0.7299984, 0, 0, 0, 1, 1,
0.4706727, -0.0814025, 0.79751, 0, 0, 0, 1, 1,
0.4715175, 0.788313, -1.19126, 0, 0, 0, 1, 1,
0.4746213, 0.798351, 0.2726682, 0, 0, 0, 1, 1,
0.4767595, -1.695676, 2.7948, 0, 0, 0, 1, 1,
0.4815849, -1.402714, 1.769272, 1, 1, 1, 1, 1,
0.4825867, -1.137145, 3.115291, 1, 1, 1, 1, 1,
0.4904622, -0.6824487, 1.268427, 1, 1, 1, 1, 1,
0.4905066, 2.678796, 1.236423, 1, 1, 1, 1, 1,
0.4907606, -0.9219374, 2.811344, 1, 1, 1, 1, 1,
0.4919458, 0.8865047, 2.444458, 1, 1, 1, 1, 1,
0.4932512, 0.6527838, 1.450804, 1, 1, 1, 1, 1,
0.4936007, -0.4725018, 2.020304, 1, 1, 1, 1, 1,
0.495624, 0.5405533, 1.300002, 1, 1, 1, 1, 1,
0.4956439, -0.1171424, 1.052232, 1, 1, 1, 1, 1,
0.4992476, -1.092104, 1.980364, 1, 1, 1, 1, 1,
0.4997155, 1.178473, -0.1997294, 1, 1, 1, 1, 1,
0.5015089, -1.126444, 1.891253, 1, 1, 1, 1, 1,
0.5026734, 1.071474, -0.4700519, 1, 1, 1, 1, 1,
0.5132186, 1.085284, 2.785378, 1, 1, 1, 1, 1,
0.5155996, -0.01639114, 1.161029, 0, 0, 1, 1, 1,
0.5179182, -0.2547551, 2.477463, 1, 0, 0, 1, 1,
0.5185422, 0.3690923, 0.4317156, 1, 0, 0, 1, 1,
0.5214019, 0.5167486, 2.791162, 1, 0, 0, 1, 1,
0.5219432, 0.2379489, -0.03847028, 1, 0, 0, 1, 1,
0.5225605, 0.9120503, 1.193062, 1, 0, 0, 1, 1,
0.5226621, -0.4634904, 4.120132, 0, 0, 0, 1, 1,
0.5299224, -1.049778, 2.243961, 0, 0, 0, 1, 1,
0.5334198, 0.5154436, 1.01768, 0, 0, 0, 1, 1,
0.5337289, -0.5005748, 3.469083, 0, 0, 0, 1, 1,
0.5341212, 1.261591, -0.06047897, 0, 0, 0, 1, 1,
0.5342686, 0.4246639, 1.758003, 0, 0, 0, 1, 1,
0.5360197, -0.3209717, 2.753494, 0, 0, 0, 1, 1,
0.537202, 0.09204602, 1.156846, 1, 1, 1, 1, 1,
0.5373096, 0.1048878, 0.2391498, 1, 1, 1, 1, 1,
0.5411376, -0.4274909, 1.898237, 1, 1, 1, 1, 1,
0.5447282, -0.4266067, 0.9942057, 1, 1, 1, 1, 1,
0.5470272, 0.1445623, 0.9036412, 1, 1, 1, 1, 1,
0.5470729, 1.504335, -0.4024734, 1, 1, 1, 1, 1,
0.5510184, 0.2456432, 1.117567, 1, 1, 1, 1, 1,
0.5517747, 0.9384583, 2.236842, 1, 1, 1, 1, 1,
0.5520434, -0.05540293, 3.897558, 1, 1, 1, 1, 1,
0.5551549, -0.7810734, 3.075737, 1, 1, 1, 1, 1,
0.5579735, -1.132559, 2.560652, 1, 1, 1, 1, 1,
0.5647841, -2.206759, 2.893744, 1, 1, 1, 1, 1,
0.5706946, -0.3470133, 2.261199, 1, 1, 1, 1, 1,
0.5713006, 1.055505, 1.293408, 1, 1, 1, 1, 1,
0.5727676, 0.04945478, 1.390372, 1, 1, 1, 1, 1,
0.5728648, -0.1587067, 1.096309, 0, 0, 1, 1, 1,
0.5740146, 0.920359, 0.7674709, 1, 0, 0, 1, 1,
0.5740746, 1.198317, 1.061213, 1, 0, 0, 1, 1,
0.5849532, 0.8248803, 1.478655, 1, 0, 0, 1, 1,
0.585499, -1.363971, 1.744251, 1, 0, 0, 1, 1,
0.5868567, -1.033021, 2.54408, 1, 0, 0, 1, 1,
0.5908932, -1.534045, 4.5174, 0, 0, 0, 1, 1,
0.5937271, 0.2304791, 0.6288967, 0, 0, 0, 1, 1,
0.5980263, -2.243842, 2.177942, 0, 0, 0, 1, 1,
0.6076517, 0.3490514, 0.7931899, 0, 0, 0, 1, 1,
0.6078084, -0.3677449, 2.411441, 0, 0, 0, 1, 1,
0.6088795, -1.292731, 3.932281, 0, 0, 0, 1, 1,
0.611526, -0.007674742, 0.6883592, 0, 0, 0, 1, 1,
0.6150337, -0.5647068, 1.903359, 1, 1, 1, 1, 1,
0.6194382, -0.4665391, 2.252879, 1, 1, 1, 1, 1,
0.623165, 0.130793, -0.1760709, 1, 1, 1, 1, 1,
0.634836, -1.168005, 3.404661, 1, 1, 1, 1, 1,
0.6353128, -0.211247, 2.971624, 1, 1, 1, 1, 1,
0.6379864, -1.342753, 1.511773, 1, 1, 1, 1, 1,
0.6394302, -1.043285, 1.898412, 1, 1, 1, 1, 1,
0.6495595, -1.750586, 2.443539, 1, 1, 1, 1, 1,
0.6636647, 0.8852, 1.027495, 1, 1, 1, 1, 1,
0.6667531, 0.5506555, 2.824491, 1, 1, 1, 1, 1,
0.6730723, -0.6646037, 1.824115, 1, 1, 1, 1, 1,
0.6747767, 0.476297, -0.3021072, 1, 1, 1, 1, 1,
0.6806387, -0.8022723, 2.192555, 1, 1, 1, 1, 1,
0.6806999, 0.5903702, 1.397563, 1, 1, 1, 1, 1,
0.6843507, -0.3921614, 2.792999, 1, 1, 1, 1, 1,
0.6918572, -1.504105, 3.292598, 0, 0, 1, 1, 1,
0.6932012, 1.826848, 0.1699469, 1, 0, 0, 1, 1,
0.7003345, -1.155545, 0.990302, 1, 0, 0, 1, 1,
0.7014563, -1.045916, 5.898205, 1, 0, 0, 1, 1,
0.7020807, -0.9552553, 2.778931, 1, 0, 0, 1, 1,
0.7023069, 1.63723, 1.007694, 1, 0, 0, 1, 1,
0.7088608, 0.6417655, -0.3074388, 0, 0, 0, 1, 1,
0.7139297, -1.888473, 2.263494, 0, 0, 0, 1, 1,
0.7142378, 0.3527243, 0.07643126, 0, 0, 0, 1, 1,
0.717268, 1.289926, 0.7947534, 0, 0, 0, 1, 1,
0.7190126, 0.03397414, 2.206427, 0, 0, 0, 1, 1,
0.7212581, -1.220172, 2.974887, 0, 0, 0, 1, 1,
0.7231414, -0.8533429, 3.026252, 0, 0, 0, 1, 1,
0.7279556, -1.261048, 1.516881, 1, 1, 1, 1, 1,
0.7295283, 0.630805, 0.9188676, 1, 1, 1, 1, 1,
0.7343123, 0.616946, 1.549951, 1, 1, 1, 1, 1,
0.7356479, 0.2685972, 2.073107, 1, 1, 1, 1, 1,
0.7391062, -2.075764, 3.247243, 1, 1, 1, 1, 1,
0.7391954, 0.5371554, -0.3025023, 1, 1, 1, 1, 1,
0.7394171, -0.2125966, 3.073032, 1, 1, 1, 1, 1,
0.7394873, 0.2642177, 1.326407, 1, 1, 1, 1, 1,
0.7405328, 0.6774322, 0.3702567, 1, 1, 1, 1, 1,
0.7424406, 1.237089, 2.736753, 1, 1, 1, 1, 1,
0.7461158, 0.1571258, 1.030621, 1, 1, 1, 1, 1,
0.7474294, -1.759305, 2.482218, 1, 1, 1, 1, 1,
0.7481479, 0.5130966, 2.580025, 1, 1, 1, 1, 1,
0.7488009, -0.9088618, 3.401719, 1, 1, 1, 1, 1,
0.7527605, -0.2803156, 1.889862, 1, 1, 1, 1, 1,
0.7546744, 0.8554385, 0.5224985, 0, 0, 1, 1, 1,
0.760466, 0.3333561, 0.5731975, 1, 0, 0, 1, 1,
0.7703312, 1.415238, -0.9462481, 1, 0, 0, 1, 1,
0.773598, -1.066006, 1.588279, 1, 0, 0, 1, 1,
0.7745754, -0.6377009, 0.9242491, 1, 0, 0, 1, 1,
0.7761175, -0.629944, 3.202015, 1, 0, 0, 1, 1,
0.7773185, -0.9276544, 2.06818, 0, 0, 0, 1, 1,
0.7803974, 0.690694, 1.946932, 0, 0, 0, 1, 1,
0.7869911, 0.879982, 1.799063, 0, 0, 0, 1, 1,
0.7929255, -0.9359205, 0.7083073, 0, 0, 0, 1, 1,
0.7960023, -0.8901724, 1.160335, 0, 0, 0, 1, 1,
0.8075303, -1.488423, 3.2695, 0, 0, 0, 1, 1,
0.8104801, -0.1605722, 2.304079, 0, 0, 0, 1, 1,
0.8111361, 1.318244, 0.519758, 1, 1, 1, 1, 1,
0.8176113, -0.3789944, 1.361398, 1, 1, 1, 1, 1,
0.818095, -0.06938016, 0.8198192, 1, 1, 1, 1, 1,
0.8181875, -0.2749163, 2.015595, 1, 1, 1, 1, 1,
0.8214515, 0.8675061, 1.210285, 1, 1, 1, 1, 1,
0.823096, 0.0810358, 0.9338215, 1, 1, 1, 1, 1,
0.8356985, 0.3048003, 3.846183, 1, 1, 1, 1, 1,
0.8404356, 0.9703859, 0.450684, 1, 1, 1, 1, 1,
0.8457614, -0.2242308, 1.616845, 1, 1, 1, 1, 1,
0.8482182, -2.193887, 0.6156669, 1, 1, 1, 1, 1,
0.8495312, 0.6133142, 1.595956, 1, 1, 1, 1, 1,
0.8539918, -0.1500353, 0.3371771, 1, 1, 1, 1, 1,
0.8586877, 0.319737, 1.124454, 1, 1, 1, 1, 1,
0.8637013, 1.007148, 0.8348106, 1, 1, 1, 1, 1,
0.8676248, -0.02035012, 2.934203, 1, 1, 1, 1, 1,
0.868452, 0.8987534, 0.9446254, 0, 0, 1, 1, 1,
0.8703939, -1.356856, 3.177907, 1, 0, 0, 1, 1,
0.8765585, -2.236812, 3.582773, 1, 0, 0, 1, 1,
0.8803672, 0.7497227, -0.03114826, 1, 0, 0, 1, 1,
0.8842714, -0.1084514, 1.17385, 1, 0, 0, 1, 1,
0.8845906, -1.245472, 2.103888, 1, 0, 0, 1, 1,
0.8858697, 0.6600949, 1.388293, 0, 0, 0, 1, 1,
0.8890361, -0.4975118, 1.867896, 0, 0, 0, 1, 1,
0.8900408, -0.1766193, 0.2195142, 0, 0, 0, 1, 1,
0.8941708, -1.093467, 2.864992, 0, 0, 0, 1, 1,
0.8986486, -0.1668068, 3.379021, 0, 0, 0, 1, 1,
0.9025362, 0.1846452, 2.710493, 0, 0, 0, 1, 1,
0.9026321, 0.4401277, 1.105736, 0, 0, 0, 1, 1,
0.9053342, 0.0002948253, 1.846908, 1, 1, 1, 1, 1,
0.9064456, -0.679437, 3.550236, 1, 1, 1, 1, 1,
0.9107468, -0.9705067, 1.710689, 1, 1, 1, 1, 1,
0.9107932, 0.1331444, 1.860722, 1, 1, 1, 1, 1,
0.9111677, 0.8893043, 1.514048, 1, 1, 1, 1, 1,
0.9168849, 1.991892, -1.715101, 1, 1, 1, 1, 1,
0.9237373, -0.9287621, 3.006729, 1, 1, 1, 1, 1,
0.9258548, -1.113219, 1.746651, 1, 1, 1, 1, 1,
0.9282427, 1.823833, 0.1592456, 1, 1, 1, 1, 1,
0.9292004, 0.2773821, -0.83167, 1, 1, 1, 1, 1,
0.9295456, 0.6144093, 1.481295, 1, 1, 1, 1, 1,
0.9313504, 0.2442039, 0.8091272, 1, 1, 1, 1, 1,
0.9343137, 0.005462223, 0.08763418, 1, 1, 1, 1, 1,
0.9351692, -0.1918023, 0.8996069, 1, 1, 1, 1, 1,
0.9441723, 0.2293843, 2.459174, 1, 1, 1, 1, 1,
0.9472841, 0.08144312, 2.755863, 0, 0, 1, 1, 1,
0.9487231, 0.08727468, 2.822915, 1, 0, 0, 1, 1,
0.9530186, 1.019042, -0.8840907, 1, 0, 0, 1, 1,
0.954897, 1.61659, 0.1727235, 1, 0, 0, 1, 1,
0.9559292, 0.1777878, 1.346133, 1, 0, 0, 1, 1,
0.9568508, 0.187375, 2.09653, 1, 0, 0, 1, 1,
0.960661, -0.6016661, -0.3495408, 0, 0, 0, 1, 1,
0.9681392, 0.8834442, -1.135094, 0, 0, 0, 1, 1,
0.9792987, 0.7111336, 1.520759, 0, 0, 0, 1, 1,
0.9850476, -0.03212317, -0.3499925, 0, 0, 0, 1, 1,
0.9858852, 0.2041763, 2.280768, 0, 0, 0, 1, 1,
0.9941252, -0.6561691, 2.589698, 0, 0, 0, 1, 1,
1.004956, 0.2866879, 1.535366, 0, 0, 0, 1, 1,
1.017535, 0.7579337, 0.7990429, 1, 1, 1, 1, 1,
1.017804, -2.405497, 1.447175, 1, 1, 1, 1, 1,
1.02355, 0.6842532, 0.08323196, 1, 1, 1, 1, 1,
1.025915, 1.111517, 0.8731831, 1, 1, 1, 1, 1,
1.031837, -0.3565741, 0.776811, 1, 1, 1, 1, 1,
1.031901, 1.182883, -0.3227926, 1, 1, 1, 1, 1,
1.032259, 0.8899454, 1.041875, 1, 1, 1, 1, 1,
1.035032, 1.431538, 0.04550806, 1, 1, 1, 1, 1,
1.043056, 0.07633679, 0.9521453, 1, 1, 1, 1, 1,
1.043148, 0.811465, 0.9950291, 1, 1, 1, 1, 1,
1.044044, 1.277154, 0.3466808, 1, 1, 1, 1, 1,
1.064199, -0.131102, 0.9337275, 1, 1, 1, 1, 1,
1.067092, 1.17769, -0.1500727, 1, 1, 1, 1, 1,
1.06787, -1.648114, 1.760545, 1, 1, 1, 1, 1,
1.073115, 1.631412, 0.2766989, 1, 1, 1, 1, 1,
1.075439, -0.5808652, 1.858141, 0, 0, 1, 1, 1,
1.079793, 1.507537, 1.31499, 1, 0, 0, 1, 1,
1.08473, 1.739788, 0.9590678, 1, 0, 0, 1, 1,
1.10473, 0.1899083, 0.9853054, 1, 0, 0, 1, 1,
1.104812, -0.6429561, 2.60578, 1, 0, 0, 1, 1,
1.107459, -0.5254286, 2.126803, 1, 0, 0, 1, 1,
1.109789, 0.9211746, 0.200556, 0, 0, 0, 1, 1,
1.112087, -1.183405, 1.524338, 0, 0, 0, 1, 1,
1.122783, -0.3817231, 2.863767, 0, 0, 0, 1, 1,
1.126489, -1.012359, 2.954545, 0, 0, 0, 1, 1,
1.134856, 0.1730985, 2.062024, 0, 0, 0, 1, 1,
1.137607, 0.2596541, 1.791156, 0, 0, 0, 1, 1,
1.14547, 0.384375, 0.6334891, 0, 0, 0, 1, 1,
1.14794, 1.100491, -0.2435891, 1, 1, 1, 1, 1,
1.148472, -1.460057, 1.717319, 1, 1, 1, 1, 1,
1.157729, -1.582093, 2.711586, 1, 1, 1, 1, 1,
1.164027, 0.2933112, 1.729813, 1, 1, 1, 1, 1,
1.166883, -0.5728959, 2.201707, 1, 1, 1, 1, 1,
1.166938, -2.705312, 2.553309, 1, 1, 1, 1, 1,
1.173037, -0.4927511, 2.992069, 1, 1, 1, 1, 1,
1.174703, -0.8296329, 3.031583, 1, 1, 1, 1, 1,
1.176583, 0.877409, -0.9494884, 1, 1, 1, 1, 1,
1.192343, 0.5210209, 1.992699, 1, 1, 1, 1, 1,
1.197681, 1.508359, 1.896352, 1, 1, 1, 1, 1,
1.199302, 1.639476, 0.7555296, 1, 1, 1, 1, 1,
1.21866, 0.9883586, 0.8353512, 1, 1, 1, 1, 1,
1.22147, -0.9034984, 2.877465, 1, 1, 1, 1, 1,
1.228345, -0.6499783, 1.229845, 1, 1, 1, 1, 1,
1.249618, 0.1393955, 2.770997, 0, 0, 1, 1, 1,
1.253831, 0.8069192, 3.039222, 1, 0, 0, 1, 1,
1.269824, 1.547595, 0.1241812, 1, 0, 0, 1, 1,
1.277227, -0.1800414, 0.989505, 1, 0, 0, 1, 1,
1.281091, 0.6982687, 0.1302915, 1, 0, 0, 1, 1,
1.285105, -0.8798297, 1.635683, 1, 0, 0, 1, 1,
1.286937, 0.4580799, 0.6493628, 0, 0, 0, 1, 1,
1.287635, 0.9938143, 0.4002488, 0, 0, 0, 1, 1,
1.301052, 0.6530452, -0.03341062, 0, 0, 0, 1, 1,
1.309886, 0.9355835, 1.727236, 0, 0, 0, 1, 1,
1.31299, 0.7470715, -0.1786845, 0, 0, 0, 1, 1,
1.316322, 0.5319769, 1.273952, 0, 0, 0, 1, 1,
1.334261, -0.7903965, 1.253854, 0, 0, 0, 1, 1,
1.338122, 0.1208759, 3.212368, 1, 1, 1, 1, 1,
1.346452, -1.270938, 2.133617, 1, 1, 1, 1, 1,
1.352073, -0.1317457, 0.959209, 1, 1, 1, 1, 1,
1.35223, 0.04508333, 2.148284, 1, 1, 1, 1, 1,
1.36595, 1.143952, 1.375461, 1, 1, 1, 1, 1,
1.372662, -0.9262124, 1.013018, 1, 1, 1, 1, 1,
1.372787, 0.04575586, 1.739384, 1, 1, 1, 1, 1,
1.37404, -0.1965368, 0.7495468, 1, 1, 1, 1, 1,
1.377916, -0.08273494, 0.8445921, 1, 1, 1, 1, 1,
1.378827, 0.3828364, 0.1775917, 1, 1, 1, 1, 1,
1.381889, 0.7772572, 0.04029783, 1, 1, 1, 1, 1,
1.385148, -0.6569371, 2.059648, 1, 1, 1, 1, 1,
1.396754, -0.5244012, 1.43942, 1, 1, 1, 1, 1,
1.3992, 0.3683373, 0.8128565, 1, 1, 1, 1, 1,
1.457817, 0.3278939, 2.027607, 1, 1, 1, 1, 1,
1.461771, 0.3801845, 1.929253, 0, 0, 1, 1, 1,
1.466682, -0.458719, 1.827205, 1, 0, 0, 1, 1,
1.476538, 0.7177742, 1.238293, 1, 0, 0, 1, 1,
1.476664, -1.137336, 2.647888, 1, 0, 0, 1, 1,
1.478417, -0.8357922, 2.232515, 1, 0, 0, 1, 1,
1.479381, -0.4252008, 0.08415645, 1, 0, 0, 1, 1,
1.492796, -0.5309122, 0.6940039, 0, 0, 0, 1, 1,
1.498408, -0.4926307, 3.618794, 0, 0, 0, 1, 1,
1.505623, -1.15323, 3.66888, 0, 0, 0, 1, 1,
1.508733, -0.6324896, 2.851472, 0, 0, 0, 1, 1,
1.518544, 0.9281941, -0.7470209, 0, 0, 0, 1, 1,
1.518622, -0.01398957, 1.781101, 0, 0, 0, 1, 1,
1.523679, -1.030185, 2.611857, 0, 0, 0, 1, 1,
1.528319, 0.9720012, 0.9376989, 1, 1, 1, 1, 1,
1.55076, 0.7127441, 2.179788, 1, 1, 1, 1, 1,
1.561018, 0.9937233, 1.127075, 1, 1, 1, 1, 1,
1.563083, 0.3150914, 0.1922452, 1, 1, 1, 1, 1,
1.570985, -0.2526371, 1.329179, 1, 1, 1, 1, 1,
1.58433, -0.3235932, 1.938088, 1, 1, 1, 1, 1,
1.613537, 1.791822, 0.568085, 1, 1, 1, 1, 1,
1.617445, 0.2243335, -0.2963113, 1, 1, 1, 1, 1,
1.620326, 1.449159, 0.7469948, 1, 1, 1, 1, 1,
1.625011, 1.972075, -0.3824389, 1, 1, 1, 1, 1,
1.627255, -0.8543235, 2.042724, 1, 1, 1, 1, 1,
1.628844, -1.106297, 1.224431, 1, 1, 1, 1, 1,
1.636038, 0.06908987, 2.441548, 1, 1, 1, 1, 1,
1.636501, 0.2675214, 1.419299, 1, 1, 1, 1, 1,
1.641626, -0.9649418, 2.165129, 1, 1, 1, 1, 1,
1.644935, 0.5408991, 1.244202, 0, 0, 1, 1, 1,
1.653509, 0.6393859, 2.541137, 1, 0, 0, 1, 1,
1.654107, 0.7470245, -0.1063715, 1, 0, 0, 1, 1,
1.661533, -0.8628784, 1.400404, 1, 0, 0, 1, 1,
1.666911, 1.095316, 1.056903, 1, 0, 0, 1, 1,
1.685715, -0.01905316, 2.637087, 1, 0, 0, 1, 1,
1.707539, -0.5609699, 1.405938, 0, 0, 0, 1, 1,
1.708119, 1.525577, 0.2286438, 0, 0, 0, 1, 1,
1.716953, 0.4215787, 1.654066, 0, 0, 0, 1, 1,
1.722105, 0.3192628, 3.002299, 0, 0, 0, 1, 1,
1.733426, -0.6196789, 0.8642601, 0, 0, 0, 1, 1,
1.737357, -0.2423299, 3.357694, 0, 0, 0, 1, 1,
1.743374, -1.238206, 1.68923, 0, 0, 0, 1, 1,
1.752285, 1.127452, 1.091391, 1, 1, 1, 1, 1,
1.78164, -1.223819, 2.411851, 1, 1, 1, 1, 1,
1.809691, 0.1821214, 0.1399888, 1, 1, 1, 1, 1,
1.821681, -0.727488, 4.468677, 1, 1, 1, 1, 1,
1.827829, 1.392114, -0.1049564, 1, 1, 1, 1, 1,
1.835171, 0.1449828, 1.061861, 1, 1, 1, 1, 1,
1.841558, 2.845618, 0.49095, 1, 1, 1, 1, 1,
1.845328, -1.803572, 2.482287, 1, 1, 1, 1, 1,
1.845965, -0.6346579, 1.00327, 1, 1, 1, 1, 1,
1.873877, -0.6242939, 2.24312, 1, 1, 1, 1, 1,
1.894139, -0.6014619, 4.018717, 1, 1, 1, 1, 1,
1.979326, 0.03208394, 2.12233, 1, 1, 1, 1, 1,
1.985234, 0.04736174, 1.047488, 1, 1, 1, 1, 1,
1.994103, 1.155915, 1.919949, 1, 1, 1, 1, 1,
2.055306, 0.754092, 1.455209, 1, 1, 1, 1, 1,
2.064919, 0.5690817, 1.560301, 0, 0, 1, 1, 1,
2.135558, 2.333807, 1.336569, 1, 0, 0, 1, 1,
2.147373, 0.41693, 1.880172, 1, 0, 0, 1, 1,
2.158417, -2.387002, 3.212301, 1, 0, 0, 1, 1,
2.183699, 0.3558843, 3.091443, 1, 0, 0, 1, 1,
2.197229, -0.4429968, 1.130548, 1, 0, 0, 1, 1,
2.327906, -0.4298401, 0.6406391, 0, 0, 0, 1, 1,
2.391967, 1.801158, 2.5691, 0, 0, 0, 1, 1,
2.410607, -0.4141621, 1.349097, 0, 0, 0, 1, 1,
2.45204, 1.643836, 0.7947418, 0, 0, 0, 1, 1,
2.50213, 0.360676, 2.822938, 0, 0, 0, 1, 1,
2.53133, -1.065344, 1.429778, 0, 0, 0, 1, 1,
2.681335, -0.2900588, 2.08308, 0, 0, 0, 1, 1,
2.723244, -1.407861, 1.664663, 1, 1, 1, 1, 1,
2.762329, -0.4409112, 1.754069, 1, 1, 1, 1, 1,
2.786254, 2.51266, 1.99153, 1, 1, 1, 1, 1,
2.861789, -1.73178, 2.106936, 1, 1, 1, 1, 1,
2.948855, -0.5291892, 2.454994, 1, 1, 1, 1, 1,
3.02531, 0.1773169, 2.241331, 1, 1, 1, 1, 1,
3.188426, -1.719196, 1.72555, 1, 1, 1, 1, 1
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
var radius = 9.699266;
var distance = 34.06826;
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
mvMatrix.translate( -0.04750323, -0.3527102, -0.3259568 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.06826);
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
