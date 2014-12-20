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
-3.250297, -0.5059472, -1.205735, 1, 0, 0, 1,
-2.866727, -0.1820855, -1.994058, 1, 0.007843138, 0, 1,
-2.855782, -1.154323, -1.085632, 1, 0.01176471, 0, 1,
-2.69105, -0.9792994, -3.380839, 1, 0.01960784, 0, 1,
-2.643236, -1.040647, -3.034497, 1, 0.02352941, 0, 1,
-2.6406, -0.4130484, -2.834517, 1, 0.03137255, 0, 1,
-2.476961, 0.3263009, -2.530597, 1, 0.03529412, 0, 1,
-2.455163, -0.7365423, -1.836262, 1, 0.04313726, 0, 1,
-2.452493, -1.271739, -3.395209, 1, 0.04705882, 0, 1,
-2.388126, -0.2035894, -2.062016, 1, 0.05490196, 0, 1,
-2.370039, 0.2747302, -1.505952, 1, 0.05882353, 0, 1,
-2.31831, -0.9866226, -2.629155, 1, 0.06666667, 0, 1,
-2.22911, -0.1917792, -1.39592, 1, 0.07058824, 0, 1,
-2.198487, 1.412728, -0.186321, 1, 0.07843138, 0, 1,
-2.116375, -0.1285854, -2.264856, 1, 0.08235294, 0, 1,
-2.113893, -1.181574, -4.47473, 1, 0.09019608, 0, 1,
-2.078665, -0.7575601, -2.936849, 1, 0.09411765, 0, 1,
-2.070093, 0.8032253, -1.802704, 1, 0.1019608, 0, 1,
-2.026429, -0.5888683, -2.335735, 1, 0.1098039, 0, 1,
-1.969709, -1.696982, -2.389414, 1, 0.1137255, 0, 1,
-1.964347, 1.020125, -1.26946, 1, 0.1215686, 0, 1,
-1.958172, 0.1913963, -1.254899, 1, 0.1254902, 0, 1,
-1.952536, 0.453173, -0.6009881, 1, 0.1333333, 0, 1,
-1.943774, 0.3452609, -1.006153, 1, 0.1372549, 0, 1,
-1.919028, 0.276477, -3.83118, 1, 0.145098, 0, 1,
-1.908099, -2.323338, -2.460248, 1, 0.1490196, 0, 1,
-1.902449, -0.08797773, -2.377806, 1, 0.1568628, 0, 1,
-1.87976, 0.2735038, 0.6533741, 1, 0.1607843, 0, 1,
-1.868153, -0.04660609, -1.097035, 1, 0.1686275, 0, 1,
-1.841697, 0.1494052, -2.057849, 1, 0.172549, 0, 1,
-1.823504, 2.270458, -1.514437, 1, 0.1803922, 0, 1,
-1.80858, 2.271744, 0.1044858, 1, 0.1843137, 0, 1,
-1.800818, 0.5202706, -3.124843, 1, 0.1921569, 0, 1,
-1.778495, -0.311418, -0.9084218, 1, 0.1960784, 0, 1,
-1.777163, -0.2180345, -0.2782258, 1, 0.2039216, 0, 1,
-1.746513, -1.258181, -4.258691, 1, 0.2117647, 0, 1,
-1.682506, -0.5085678, -3.165055, 1, 0.2156863, 0, 1,
-1.678427, -0.5543612, -0.3730076, 1, 0.2235294, 0, 1,
-1.652417, -1.485227, -2.158951, 1, 0.227451, 0, 1,
-1.631407, 1.030433, -0.09995751, 1, 0.2352941, 0, 1,
-1.624906, 1.272368, -0.229245, 1, 0.2392157, 0, 1,
-1.62298, 0.2392276, -0.7137957, 1, 0.2470588, 0, 1,
-1.620573, -0.2388224, -0.9261674, 1, 0.2509804, 0, 1,
-1.618199, 0.09281711, -0.2653502, 1, 0.2588235, 0, 1,
-1.600376, 0.173066, -0.6114886, 1, 0.2627451, 0, 1,
-1.561832, -0.4078524, -1.207882, 1, 0.2705882, 0, 1,
-1.550962, -0.8286798, 0.2821515, 1, 0.2745098, 0, 1,
-1.549407, -0.803933, -2.216737, 1, 0.282353, 0, 1,
-1.546051, -1.011634, -2.154638, 1, 0.2862745, 0, 1,
-1.530051, 0.1685749, -0.6411021, 1, 0.2941177, 0, 1,
-1.527752, 0.7764897, -1.320889, 1, 0.3019608, 0, 1,
-1.52056, 1.201723, -0.3549308, 1, 0.3058824, 0, 1,
-1.510277, -0.005992416, 0.0962608, 1, 0.3137255, 0, 1,
-1.50512, 0.4457938, 0.2666613, 1, 0.3176471, 0, 1,
-1.488935, -1.053697, -3.479158, 1, 0.3254902, 0, 1,
-1.487217, -1.699289, -2.31343, 1, 0.3294118, 0, 1,
-1.479317, -0.3560129, -3.271232, 1, 0.3372549, 0, 1,
-1.471432, 1.086411, -1.396447, 1, 0.3411765, 0, 1,
-1.469288, 0.6984496, -1.837412, 1, 0.3490196, 0, 1,
-1.466514, 2.045996, -1.778794, 1, 0.3529412, 0, 1,
-1.462411, -0.166288, -2.947016, 1, 0.3607843, 0, 1,
-1.456628, 1.127565, 0.3044445, 1, 0.3647059, 0, 1,
-1.443733, 1.548438, -0.3172466, 1, 0.372549, 0, 1,
-1.437508, -1.36685, -2.071487, 1, 0.3764706, 0, 1,
-1.43347, 0.893023, -0.2239867, 1, 0.3843137, 0, 1,
-1.42783, 0.2144468, -1.962097, 1, 0.3882353, 0, 1,
-1.404223, -0.597347, -1.232025, 1, 0.3960784, 0, 1,
-1.351805, 1.701547, -2.798549, 1, 0.4039216, 0, 1,
-1.34805, 0.746076, -1.040794, 1, 0.4078431, 0, 1,
-1.331383, -0.3348329, -1.443469, 1, 0.4156863, 0, 1,
-1.329808, -0.107785, -2.910197, 1, 0.4196078, 0, 1,
-1.325693, -0.2068145, -2.086907, 1, 0.427451, 0, 1,
-1.320573, -0.2564582, -1.012556, 1, 0.4313726, 0, 1,
-1.308157, -0.2014047, -0.1986087, 1, 0.4392157, 0, 1,
-1.281918, -1.24788, -2.836597, 1, 0.4431373, 0, 1,
-1.270616, 0.8436782, -1.552285, 1, 0.4509804, 0, 1,
-1.270153, -0.5481654, -1.411482, 1, 0.454902, 0, 1,
-1.263832, 0.5168203, 0.6013895, 1, 0.4627451, 0, 1,
-1.262606, -0.4404639, -2.032456, 1, 0.4666667, 0, 1,
-1.255451, 0.8722137, 0.1677798, 1, 0.4745098, 0, 1,
-1.251188, -0.3221249, -0.8635958, 1, 0.4784314, 0, 1,
-1.249855, 0.4682807, -3.455751, 1, 0.4862745, 0, 1,
-1.242424, -0.385563, -2.621422, 1, 0.4901961, 0, 1,
-1.240193, -0.1083001, -1.72271, 1, 0.4980392, 0, 1,
-1.238987, 0.103342, 0.1253445, 1, 0.5058824, 0, 1,
-1.23202, -0.9048876, -3.018223, 1, 0.509804, 0, 1,
-1.231511, 0.0664144, -2.147541, 1, 0.5176471, 0, 1,
-1.225942, -0.5672966, -2.556412, 1, 0.5215687, 0, 1,
-1.220695, -0.02859305, -1.433773, 1, 0.5294118, 0, 1,
-1.219975, -1.498006, -2.668012, 1, 0.5333334, 0, 1,
-1.218152, -0.2773371, -2.55061, 1, 0.5411765, 0, 1,
-1.215628, 0.3882436, 0.1419555, 1, 0.5450981, 0, 1,
-1.21533, 0.6664405, 0.784981, 1, 0.5529412, 0, 1,
-1.214148, -0.3526465, -2.03838, 1, 0.5568628, 0, 1,
-1.214137, 2.189534, -1.402683, 1, 0.5647059, 0, 1,
-1.212061, 1.133371, -0.8590433, 1, 0.5686275, 0, 1,
-1.206004, -0.6597985, -2.529981, 1, 0.5764706, 0, 1,
-1.205157, 0.04210508, -0.775292, 1, 0.5803922, 0, 1,
-1.204987, 0.8047121, -3.29173, 1, 0.5882353, 0, 1,
-1.197589, 1.140284, -0.06190921, 1, 0.5921569, 0, 1,
-1.191035, -1.312362, -3.99602, 1, 0.6, 0, 1,
-1.182569, 1.448122, -0.9445196, 1, 0.6078432, 0, 1,
-1.175536, 0.6282224, -2.144097, 1, 0.6117647, 0, 1,
-1.175292, 0.8675388, -1.319531, 1, 0.6196079, 0, 1,
-1.175083, -2.229843, -2.148483, 1, 0.6235294, 0, 1,
-1.175013, 0.3533362, -0.3458161, 1, 0.6313726, 0, 1,
-1.173344, -1.070035, -2.168638, 1, 0.6352941, 0, 1,
-1.170111, -0.1032299, -1.737883, 1, 0.6431373, 0, 1,
-1.169058, -0.07856891, -1.220266, 1, 0.6470588, 0, 1,
-1.161546, -1.011478, -2.220646, 1, 0.654902, 0, 1,
-1.160291, -0.601359, -2.448489, 1, 0.6588235, 0, 1,
-1.147769, -0.8885592, -0.693436, 1, 0.6666667, 0, 1,
-1.146284, -1.116643, -2.701545, 1, 0.6705883, 0, 1,
-1.144543, -0.7508904, -1.681976, 1, 0.6784314, 0, 1,
-1.142974, 0.6404459, -4.238255, 1, 0.682353, 0, 1,
-1.141648, -1.842986, -1.481508, 1, 0.6901961, 0, 1,
-1.138844, 0.3096921, -1.861787, 1, 0.6941177, 0, 1,
-1.132179, 0.688109, -0.4409006, 1, 0.7019608, 0, 1,
-1.13143, -0.956555, -2.246018, 1, 0.7098039, 0, 1,
-1.128761, -0.1962296, -1.217349, 1, 0.7137255, 0, 1,
-1.128109, -0.6564488, -2.895289, 1, 0.7215686, 0, 1,
-1.12727, 0.4481152, -0.5469112, 1, 0.7254902, 0, 1,
-1.120892, 0.5632563, -0.3194263, 1, 0.7333333, 0, 1,
-1.114157, -1.367604, -2.077619, 1, 0.7372549, 0, 1,
-1.110808, 0.6980442, -0.9090684, 1, 0.7450981, 0, 1,
-1.103289, 0.6497492, -2.142115, 1, 0.7490196, 0, 1,
-1.102455, -0.8178102, -2.812343, 1, 0.7568628, 0, 1,
-1.095819, 0.1485217, -1.52816, 1, 0.7607843, 0, 1,
-1.089166, -0.6462523, -2.86695, 1, 0.7686275, 0, 1,
-1.082437, -0.8321238, -2.490235, 1, 0.772549, 0, 1,
-1.07389, 1.336774, -0.9418306, 1, 0.7803922, 0, 1,
-1.068024, -0.0658165, -0.8645563, 1, 0.7843137, 0, 1,
-1.064787, 0.6064723, -0.726286, 1, 0.7921569, 0, 1,
-1.062591, -0.2816733, -0.9540029, 1, 0.7960784, 0, 1,
-1.060742, -0.4410785, -3.163121, 1, 0.8039216, 0, 1,
-1.043625, 1.055604, -1.013991, 1, 0.8117647, 0, 1,
-1.041156, 0.05750267, -2.201185, 1, 0.8156863, 0, 1,
-1.040986, 1.644075, -0.7021729, 1, 0.8235294, 0, 1,
-1.040649, -0.1336757, -2.419841, 1, 0.827451, 0, 1,
-1.026047, -0.9943039, -3.472717, 1, 0.8352941, 0, 1,
-1.018035, -0.1463789, -1.437989, 1, 0.8392157, 0, 1,
-1.014619, -0.2826107, -1.092365, 1, 0.8470588, 0, 1,
-1.012786, 1.233824, -1.023004, 1, 0.8509804, 0, 1,
-1.007171, 1.467538, -1.154264, 1, 0.8588235, 0, 1,
-1.005968, -0.02698776, -0.09488437, 1, 0.8627451, 0, 1,
-1.003299, 2.050439, -0.4901537, 1, 0.8705882, 0, 1,
-1.00005, -1.247601, -1.474044, 1, 0.8745098, 0, 1,
-0.9940998, -0.8713406, -1.980143, 1, 0.8823529, 0, 1,
-0.9779171, -0.4343434, -0.8653775, 1, 0.8862745, 0, 1,
-0.9769101, 0.1939188, -1.638592, 1, 0.8941177, 0, 1,
-0.9766707, -0.5543846, -1.934495, 1, 0.8980392, 0, 1,
-0.9759399, 0.29151, -1.463711, 1, 0.9058824, 0, 1,
-0.9693703, -2.180079, -1.988823, 1, 0.9137255, 0, 1,
-0.9544023, -0.238618, -0.3817571, 1, 0.9176471, 0, 1,
-0.9525776, -0.6852168, -3.237008, 1, 0.9254902, 0, 1,
-0.945532, -1.467115, -1.065542, 1, 0.9294118, 0, 1,
-0.9424924, -0.4967322, -2.525523, 1, 0.9372549, 0, 1,
-0.9270818, -1.138135, -3.957651, 1, 0.9411765, 0, 1,
-0.9249337, -0.3460802, -0.5759426, 1, 0.9490196, 0, 1,
-0.916128, 0.1221935, -3.268613, 1, 0.9529412, 0, 1,
-0.9109582, -0.6140979, -1.866794, 1, 0.9607843, 0, 1,
-0.9040669, 0.5697263, -0.7420643, 1, 0.9647059, 0, 1,
-0.9007172, -0.4826084, -1.581601, 1, 0.972549, 0, 1,
-0.897008, -0.8901187, -3.440154, 1, 0.9764706, 0, 1,
-0.8965111, 1.129586, -1.519196, 1, 0.9843137, 0, 1,
-0.888838, -1.472776, -1.911889, 1, 0.9882353, 0, 1,
-0.8789561, 0.2712613, -1.921297, 1, 0.9960784, 0, 1,
-0.8744007, 1.655507, -1.659744, 0.9960784, 1, 0, 1,
-0.8621026, -2.257773, -1.232688, 0.9921569, 1, 0, 1,
-0.8486026, -0.08507674, -1.003404, 0.9843137, 1, 0, 1,
-0.8463264, -0.06326558, -1.682649, 0.9803922, 1, 0, 1,
-0.8462868, 0.7456645, -0.1403805, 0.972549, 1, 0, 1,
-0.8340272, 0.3152801, -0.8153705, 0.9686275, 1, 0, 1,
-0.8246755, 1.337809, 0.5535999, 0.9607843, 1, 0, 1,
-0.8204001, -0.9799206, -3.149756, 0.9568627, 1, 0, 1,
-0.8128959, 0.3663681, -0.5830582, 0.9490196, 1, 0, 1,
-0.8091878, -0.2558085, -1.845263, 0.945098, 1, 0, 1,
-0.8021525, 0.0656657, -2.207308, 0.9372549, 1, 0, 1,
-0.7894005, 0.5801717, -1.278008, 0.9333333, 1, 0, 1,
-0.7846408, 0.2705643, -1.586118, 0.9254902, 1, 0, 1,
-0.7835368, 0.2764989, -2.942235, 0.9215686, 1, 0, 1,
-0.780929, 0.2142227, -2.408577, 0.9137255, 1, 0, 1,
-0.7791846, 1.432377, -0.5014771, 0.9098039, 1, 0, 1,
-0.776625, -2.761889, -2.165815, 0.9019608, 1, 0, 1,
-0.774761, -1.097975, -3.701922, 0.8941177, 1, 0, 1,
-0.7731709, 1.262696, -1.209383, 0.8901961, 1, 0, 1,
-0.7725545, 0.4840741, 0.6752945, 0.8823529, 1, 0, 1,
-0.7717906, -0.3215612, -1.400445, 0.8784314, 1, 0, 1,
-0.7716947, -0.1556803, -2.084287, 0.8705882, 1, 0, 1,
-0.7694334, 0.8288617, -2.038053, 0.8666667, 1, 0, 1,
-0.7668228, 0.6505949, -1.234467, 0.8588235, 1, 0, 1,
-0.7604434, 1.106848, -0.2791216, 0.854902, 1, 0, 1,
-0.7594562, 1.568611, 0.01243221, 0.8470588, 1, 0, 1,
-0.7486041, 0.007420696, -0.2154895, 0.8431373, 1, 0, 1,
-0.7438948, 0.6728482, -2.410818, 0.8352941, 1, 0, 1,
-0.7436695, 0.2886371, -0.1757406, 0.8313726, 1, 0, 1,
-0.7433157, 1.080377, -1.147691, 0.8235294, 1, 0, 1,
-0.7428016, 0.006133945, 0.0352486, 0.8196079, 1, 0, 1,
-0.7384837, 0.9988189, -1.196586, 0.8117647, 1, 0, 1,
-0.7357593, -0.02920771, -1.545041, 0.8078431, 1, 0, 1,
-0.7329662, -0.5244937, -2.671608, 0.8, 1, 0, 1,
-0.7310491, -1.977448, -2.444141, 0.7921569, 1, 0, 1,
-0.7289053, 0.1979091, -1.455056, 0.7882353, 1, 0, 1,
-0.7286752, 0.02780619, 0.3362713, 0.7803922, 1, 0, 1,
-0.7268798, -1.272115, -1.346473, 0.7764706, 1, 0, 1,
-0.7204475, 0.3486811, -3.025099, 0.7686275, 1, 0, 1,
-0.7195695, 1.14806, -0.8429275, 0.7647059, 1, 0, 1,
-0.7169179, -1.336958, -4.700646, 0.7568628, 1, 0, 1,
-0.7132472, 0.5938082, -1.082533, 0.7529412, 1, 0, 1,
-0.7106829, -0.3815013, -1.758866, 0.7450981, 1, 0, 1,
-0.6931095, 0.09302666, -1.283105, 0.7411765, 1, 0, 1,
-0.689109, 0.04112979, -2.805604, 0.7333333, 1, 0, 1,
-0.6856677, -2.078043, -2.851484, 0.7294118, 1, 0, 1,
-0.6779742, -1.673245, -4.043459, 0.7215686, 1, 0, 1,
-0.6774145, 0.5119955, -2.283719, 0.7176471, 1, 0, 1,
-0.6761539, 0.0527362, -1.333098, 0.7098039, 1, 0, 1,
-0.6751853, 0.1233036, -1.218034, 0.7058824, 1, 0, 1,
-0.6693972, 0.3198323, -2.155904, 0.6980392, 1, 0, 1,
-0.6679249, -0.9277146, -3.361267, 0.6901961, 1, 0, 1,
-0.667101, 0.5015455, -1.522952, 0.6862745, 1, 0, 1,
-0.6633, 1.012828, -1.320359, 0.6784314, 1, 0, 1,
-0.6623363, -0.502211, -0.9767922, 0.6745098, 1, 0, 1,
-0.6618358, -1.19107, -2.466923, 0.6666667, 1, 0, 1,
-0.6578008, 0.3712213, -1.579074, 0.6627451, 1, 0, 1,
-0.6577569, 0.1835841, -2.174143, 0.654902, 1, 0, 1,
-0.6571023, 0.6477901, -0.4274322, 0.6509804, 1, 0, 1,
-0.6568648, 0.4031565, -0.51796, 0.6431373, 1, 0, 1,
-0.6529861, 0.2435375, 0.288173, 0.6392157, 1, 0, 1,
-0.6513426, -0.714506, -3.07217, 0.6313726, 1, 0, 1,
-0.6434025, 0.2306326, -1.917294, 0.627451, 1, 0, 1,
-0.6372464, 1.113916, -1.39716, 0.6196079, 1, 0, 1,
-0.6340806, -0.7329854, -1.774884, 0.6156863, 1, 0, 1,
-0.6287101, -1.345634, -1.958252, 0.6078432, 1, 0, 1,
-0.6277261, -1.988968, -0.7689672, 0.6039216, 1, 0, 1,
-0.6240756, 0.3508016, -2.407386, 0.5960785, 1, 0, 1,
-0.6230893, -0.4799258, -2.854795, 0.5882353, 1, 0, 1,
-0.6212091, 0.1478709, -1.267183, 0.5843138, 1, 0, 1,
-0.6209087, -1.093574, -2.837769, 0.5764706, 1, 0, 1,
-0.6208708, 0.5393142, -1.258282, 0.572549, 1, 0, 1,
-0.6167853, 1.062784, -1.735732, 0.5647059, 1, 0, 1,
-0.6163861, -0.2392245, -1.440578, 0.5607843, 1, 0, 1,
-0.6159651, -1.146382, 0.1466626, 0.5529412, 1, 0, 1,
-0.6133011, 1.901728, -2.030805, 0.5490196, 1, 0, 1,
-0.6124541, 1.177586, -0.6404635, 0.5411765, 1, 0, 1,
-0.6120047, -1.207184, -2.877815, 0.5372549, 1, 0, 1,
-0.6100963, 0.04497923, -1.631024, 0.5294118, 1, 0, 1,
-0.6088504, 1.09772, -1.574054, 0.5254902, 1, 0, 1,
-0.6076384, -0.166514, -3.211215, 0.5176471, 1, 0, 1,
-0.605639, 0.2064646, -1.055528, 0.5137255, 1, 0, 1,
-0.6045931, -0.1299414, -1.093512, 0.5058824, 1, 0, 1,
-0.6040844, 1.475606, 1.397361, 0.5019608, 1, 0, 1,
-0.6005735, -0.4270118, -1.051087, 0.4941176, 1, 0, 1,
-0.5994148, -0.5683197, -1.100008, 0.4862745, 1, 0, 1,
-0.5953368, 1.102878, 0.5560045, 0.4823529, 1, 0, 1,
-0.5920824, -1.329147, -1.290923, 0.4745098, 1, 0, 1,
-0.5898656, 0.2843748, 0.2757719, 0.4705882, 1, 0, 1,
-0.5872014, -1.718677, -2.422407, 0.4627451, 1, 0, 1,
-0.5852701, 0.3747605, 1.965987, 0.4588235, 1, 0, 1,
-0.5851475, 1.4603, 0.2101143, 0.4509804, 1, 0, 1,
-0.5789327, 0.6869547, -0.2945117, 0.4470588, 1, 0, 1,
-0.5782956, 0.9462777, -2.406671, 0.4392157, 1, 0, 1,
-0.5771645, -0.8608283, -2.619061, 0.4352941, 1, 0, 1,
-0.5760195, -1.25958, -0.5206397, 0.427451, 1, 0, 1,
-0.5759603, -0.198242, -0.6484081, 0.4235294, 1, 0, 1,
-0.5754509, 2.374009, -0.6163669, 0.4156863, 1, 0, 1,
-0.57291, 0.2514154, -1.870836, 0.4117647, 1, 0, 1,
-0.572606, 1.583482, 0.3531338, 0.4039216, 1, 0, 1,
-0.5722276, -0.7785772, -1.367794, 0.3960784, 1, 0, 1,
-0.5701801, -0.7821407, -1.53376, 0.3921569, 1, 0, 1,
-0.5682126, 1.420006, -0.9482474, 0.3843137, 1, 0, 1,
-0.566672, -0.4044533, -2.324805, 0.3803922, 1, 0, 1,
-0.5613832, -0.1480462, -3.167351, 0.372549, 1, 0, 1,
-0.5599789, 0.5125684, -1.197761, 0.3686275, 1, 0, 1,
-0.5544336, 0.9459376, 0.7103692, 0.3607843, 1, 0, 1,
-0.546716, -0.4890155, -2.512357, 0.3568628, 1, 0, 1,
-0.5447591, 1.274448, -1.146575, 0.3490196, 1, 0, 1,
-0.5428618, 1.071501, -0.3777846, 0.345098, 1, 0, 1,
-0.5424515, 1.121258, -1.61881, 0.3372549, 1, 0, 1,
-0.5298507, -0.5108449, -1.640834, 0.3333333, 1, 0, 1,
-0.5290209, 0.561369, 1.509685, 0.3254902, 1, 0, 1,
-0.5270854, -2.162377, -3.254406, 0.3215686, 1, 0, 1,
-0.5246414, -1.973456, -3.441425, 0.3137255, 1, 0, 1,
-0.5223814, -2.099589, -4.740931, 0.3098039, 1, 0, 1,
-0.5164481, 0.2740987, -1.856862, 0.3019608, 1, 0, 1,
-0.5155805, 0.5422508, 0.08627488, 0.2941177, 1, 0, 1,
-0.513833, -0.1298658, -0.7232157, 0.2901961, 1, 0, 1,
-0.5118967, 0.8372964, -1.454039, 0.282353, 1, 0, 1,
-0.5097561, -0.7004541, -3.373941, 0.2784314, 1, 0, 1,
-0.5067974, -0.1332655, -2.112237, 0.2705882, 1, 0, 1,
-0.50247, 1.848478, -1.897802, 0.2666667, 1, 0, 1,
-0.4994214, 1.367191, -1.38555, 0.2588235, 1, 0, 1,
-0.4983034, 0.5567574, -0.4360892, 0.254902, 1, 0, 1,
-0.4979585, 0.6522434, -2.536432, 0.2470588, 1, 0, 1,
-0.4973957, 0.952485, 0.2495959, 0.2431373, 1, 0, 1,
-0.4966623, 0.6639331, -0.5209318, 0.2352941, 1, 0, 1,
-0.4923651, -2.643431, -3.076325, 0.2313726, 1, 0, 1,
-0.4910827, -1.196163, -4.499998, 0.2235294, 1, 0, 1,
-0.4907748, -1.384137, -3.672333, 0.2196078, 1, 0, 1,
-0.4844057, 0.7598125, -0.6627691, 0.2117647, 1, 0, 1,
-0.4732812, 2.191019, -1.816898, 0.2078431, 1, 0, 1,
-0.4696673, -0.07895599, -0.9306406, 0.2, 1, 0, 1,
-0.4689462, -0.9152178, -3.640871, 0.1921569, 1, 0, 1,
-0.4655098, -0.9524658, -2.675762, 0.1882353, 1, 0, 1,
-0.4625728, -0.260075, -2.289817, 0.1803922, 1, 0, 1,
-0.4592688, 0.3192287, -1.838045, 0.1764706, 1, 0, 1,
-0.4555626, -2.239369, -3.087648, 0.1686275, 1, 0, 1,
-0.4494421, -0.1590131, -2.791515, 0.1647059, 1, 0, 1,
-0.4481049, 1.075583, 0.3794161, 0.1568628, 1, 0, 1,
-0.4469491, -1.197224, -3.222548, 0.1529412, 1, 0, 1,
-0.4339269, -2.721909, -2.704957, 0.145098, 1, 0, 1,
-0.4314064, -1.03907, -1.881688, 0.1411765, 1, 0, 1,
-0.428941, 3.515353, 0.3750617, 0.1333333, 1, 0, 1,
-0.4279064, -0.01989718, -1.624206, 0.1294118, 1, 0, 1,
-0.4255669, 0.2038895, -0.3416066, 0.1215686, 1, 0, 1,
-0.4214371, 0.9420055, 0.1820168, 0.1176471, 1, 0, 1,
-0.4187274, -1.561646, -2.99344, 0.1098039, 1, 0, 1,
-0.4116899, 0.09323922, -1.327144, 0.1058824, 1, 0, 1,
-0.4116512, -0.9362471, -2.841401, 0.09803922, 1, 0, 1,
-0.4084865, -1.064397, -3.238302, 0.09019608, 1, 0, 1,
-0.4012269, -1.030351, -2.123495, 0.08627451, 1, 0, 1,
-0.3992983, 0.558481, -0.9217299, 0.07843138, 1, 0, 1,
-0.3979406, -1.238767, -3.120231, 0.07450981, 1, 0, 1,
-0.3933728, 0.7483028, -0.1938919, 0.06666667, 1, 0, 1,
-0.3899091, -0.7319241, -1.800925, 0.0627451, 1, 0, 1,
-0.3897575, 1.578846, -1.626385, 0.05490196, 1, 0, 1,
-0.388859, 0.8150179, -1.740017, 0.05098039, 1, 0, 1,
-0.3860774, -0.09842356, -2.567796, 0.04313726, 1, 0, 1,
-0.3852076, -0.6061516, -4.236379, 0.03921569, 1, 0, 1,
-0.3851112, 1.294046, -1.593503, 0.03137255, 1, 0, 1,
-0.3836865, -1.482305, -2.56639, 0.02745098, 1, 0, 1,
-0.3832623, -0.2532168, -0.1413315, 0.01960784, 1, 0, 1,
-0.3829225, -0.4041186, -2.881086, 0.01568628, 1, 0, 1,
-0.3805502, 1.679571, 0.4474488, 0.007843138, 1, 0, 1,
-0.3792236, -0.2590644, -2.961075, 0.003921569, 1, 0, 1,
-0.3767712, -0.3284994, -2.840996, 0, 1, 0.003921569, 1,
-0.3763319, 1.443995, -0.1918597, 0, 1, 0.01176471, 1,
-0.3680873, 0.1757179, -0.9444623, 0, 1, 0.01568628, 1,
-0.367492, -0.1853811, -3.579068, 0, 1, 0.02352941, 1,
-0.3634409, 1.617529, -0.5532362, 0, 1, 0.02745098, 1,
-0.359102, 0.4894214, -1.040004, 0, 1, 0.03529412, 1,
-0.3581797, 0.3734421, -2.508959, 0, 1, 0.03921569, 1,
-0.3576307, 0.8286261, -1.428092, 0, 1, 0.04705882, 1,
-0.3481387, -0.0703803, -1.602869, 0, 1, 0.05098039, 1,
-0.3443685, -0.8997228, -2.122597, 0, 1, 0.05882353, 1,
-0.3433262, -0.6386114, -0.3325064, 0, 1, 0.0627451, 1,
-0.3422281, -0.1262949, -1.507215, 0, 1, 0.07058824, 1,
-0.3355426, 0.4015797, 1.795388, 0, 1, 0.07450981, 1,
-0.3338694, 0.06491806, -0.8622055, 0, 1, 0.08235294, 1,
-0.3305006, 0.4986425, 0.1616592, 0, 1, 0.08627451, 1,
-0.3241173, 1.07202, -0.0947245, 0, 1, 0.09411765, 1,
-0.3224032, 0.03929998, 0.269523, 0, 1, 0.1019608, 1,
-0.3175455, -0.2199801, -3.594805, 0, 1, 0.1058824, 1,
-0.316206, -1.054444, -2.451041, 0, 1, 0.1137255, 1,
-0.31378, -0.07911387, -1.591008, 0, 1, 0.1176471, 1,
-0.3123342, 0.6578115, -0.2605395, 0, 1, 0.1254902, 1,
-0.3087019, 0.04957139, -2.169128, 0, 1, 0.1294118, 1,
-0.3065264, -0.1844804, -3.562548, 0, 1, 0.1372549, 1,
-0.3061902, -1.101835, -3.860421, 0, 1, 0.1411765, 1,
-0.3044677, 0.2698304, -1.794969, 0, 1, 0.1490196, 1,
-0.3012761, 1.044104, 1.155736, 0, 1, 0.1529412, 1,
-0.3007081, -1.794226, -4.649846, 0, 1, 0.1607843, 1,
-0.3002985, 0.04718593, -1.827547, 0, 1, 0.1647059, 1,
-0.2954212, 1.08136, -0.3718339, 0, 1, 0.172549, 1,
-0.2917875, 0.4528498, 0.1155313, 0, 1, 0.1764706, 1,
-0.2907483, 0.2145418, 0.3667476, 0, 1, 0.1843137, 1,
-0.2882017, -0.377447, -2.891254, 0, 1, 0.1882353, 1,
-0.287637, 2.160342, 0.9890776, 0, 1, 0.1960784, 1,
-0.2859922, 0.6217644, -0.2098918, 0, 1, 0.2039216, 1,
-0.2849832, -0.250154, -3.51458, 0, 1, 0.2078431, 1,
-0.2839137, 0.3341092, 0.003601644, 0, 1, 0.2156863, 1,
-0.2835702, 0.5316514, -0.0840233, 0, 1, 0.2196078, 1,
-0.2826451, -0.0814735, -3.060338, 0, 1, 0.227451, 1,
-0.2813745, 0.6183617, -1.832903, 0, 1, 0.2313726, 1,
-0.2811548, -0.5701465, -3.430065, 0, 1, 0.2392157, 1,
-0.2810189, 0.6237393, -0.2812481, 0, 1, 0.2431373, 1,
-0.2805315, -2.377933, -3.140622, 0, 1, 0.2509804, 1,
-0.2708272, 0.8535829, -0.8565105, 0, 1, 0.254902, 1,
-0.2700088, 0.5495409, -0.6330538, 0, 1, 0.2627451, 1,
-0.2693266, -1.579648, -2.950973, 0, 1, 0.2666667, 1,
-0.2686042, 0.8827828, -0.654663, 0, 1, 0.2745098, 1,
-0.2649375, -0.05320952, -2.560483, 0, 1, 0.2784314, 1,
-0.2616318, -0.3256743, -2.787366, 0, 1, 0.2862745, 1,
-0.2614914, 0.4242316, 0.4950551, 0, 1, 0.2901961, 1,
-0.2605705, -1.897297, -0.5566062, 0, 1, 0.2980392, 1,
-0.2604961, -0.03886921, -1.335129, 0, 1, 0.3058824, 1,
-0.2540712, -0.3067877, -2.833298, 0, 1, 0.3098039, 1,
-0.2538147, 2.046776, 0.8637278, 0, 1, 0.3176471, 1,
-0.2536887, -0.973636, -3.941411, 0, 1, 0.3215686, 1,
-0.2519029, -0.8987572, -5.167109, 0, 1, 0.3294118, 1,
-0.2512841, -3.104644, -3.628592, 0, 1, 0.3333333, 1,
-0.2483921, -0.6886586, -3.860532, 0, 1, 0.3411765, 1,
-0.2436635, 0.1752148, -1.649414, 0, 1, 0.345098, 1,
-0.2412182, 0.3633197, -1.282992, 0, 1, 0.3529412, 1,
-0.240859, 1.033681, 0.4950252, 0, 1, 0.3568628, 1,
-0.2387293, -0.2381645, -1.339881, 0, 1, 0.3647059, 1,
-0.2375516, 0.3044752, 0.3745934, 0, 1, 0.3686275, 1,
-0.2352621, -0.4431537, -2.110221, 0, 1, 0.3764706, 1,
-0.2320445, -1.235563, -3.274402, 0, 1, 0.3803922, 1,
-0.2263688, 0.2534583, -1.788825, 0, 1, 0.3882353, 1,
-0.2262065, -0.1554456, -2.857271, 0, 1, 0.3921569, 1,
-0.2247386, 1.203259, -1.865267, 0, 1, 0.4, 1,
-0.2235156, -0.6648545, -2.514739, 0, 1, 0.4078431, 1,
-0.2210942, -0.8388256, -0.68411, 0, 1, 0.4117647, 1,
-0.2101921, 0.6007038, 0.2110015, 0, 1, 0.4196078, 1,
-0.2098355, 1.073151, 0.3207786, 0, 1, 0.4235294, 1,
-0.2052376, -0.3947732, -2.763826, 0, 1, 0.4313726, 1,
-0.2046459, -1.70529, -2.255583, 0, 1, 0.4352941, 1,
-0.2019715, 0.677543, 0.980998, 0, 1, 0.4431373, 1,
-0.2013682, -1.292489, -3.549522, 0, 1, 0.4470588, 1,
-0.201138, -0.9614593, -3.581442, 0, 1, 0.454902, 1,
-0.1990134, -1.596274, -3.809804, 0, 1, 0.4588235, 1,
-0.1964578, 0.6091474, -1.789034, 0, 1, 0.4666667, 1,
-0.1931854, -0.1050667, -2.034229, 0, 1, 0.4705882, 1,
-0.1921931, 0.1367143, -0.7974422, 0, 1, 0.4784314, 1,
-0.1908257, 0.560022, -0.8710579, 0, 1, 0.4823529, 1,
-0.1897061, 1.10564, 0.6109876, 0, 1, 0.4901961, 1,
-0.1896261, -0.4752969, -2.666166, 0, 1, 0.4941176, 1,
-0.187957, 0.2206666, -2.388568, 0, 1, 0.5019608, 1,
-0.1867366, 1.444002, 1.756156, 0, 1, 0.509804, 1,
-0.1842956, -0.05299973, -4.243935, 0, 1, 0.5137255, 1,
-0.183019, -0.6166719, -3.276176, 0, 1, 0.5215687, 1,
-0.1822236, -0.07999617, -1.671596, 0, 1, 0.5254902, 1,
-0.1776093, 0.4069598, 1.075795, 0, 1, 0.5333334, 1,
-0.1707933, -0.7683777, -3.189063, 0, 1, 0.5372549, 1,
-0.170097, -1.126629, -3.700456, 0, 1, 0.5450981, 1,
-0.1694768, -0.1882068, -2.7947, 0, 1, 0.5490196, 1,
-0.168419, 0.5431617, -1.279588, 0, 1, 0.5568628, 1,
-0.1654022, -0.2047559, -2.218241, 0, 1, 0.5607843, 1,
-0.1647748, -0.5924157, -3.428612, 0, 1, 0.5686275, 1,
-0.1618861, 0.1844296, 0.4230821, 0, 1, 0.572549, 1,
-0.1524764, -0.0801919, -1.514088, 0, 1, 0.5803922, 1,
-0.1500479, 0.02222219, -0.4750856, 0, 1, 0.5843138, 1,
-0.1448056, 0.1472697, -1.172047, 0, 1, 0.5921569, 1,
-0.1427509, -0.876407, -3.910731, 0, 1, 0.5960785, 1,
-0.1422069, 1.460509, -0.5670525, 0, 1, 0.6039216, 1,
-0.1401374, 1.44044, 0.7984396, 0, 1, 0.6117647, 1,
-0.1397849, -0.3771725, -2.221068, 0, 1, 0.6156863, 1,
-0.1385501, -1.119008, -5.549243, 0, 1, 0.6235294, 1,
-0.133901, -1.380074, -2.718657, 0, 1, 0.627451, 1,
-0.1311578, -0.1515958, -1.780817, 0, 1, 0.6352941, 1,
-0.1253757, 0.5600461, 0.4472195, 0, 1, 0.6392157, 1,
-0.1218016, -0.4442847, -2.991182, 0, 1, 0.6470588, 1,
-0.1207045, -2.112545, -1.516756, 0, 1, 0.6509804, 1,
-0.1195722, -1.965602, -1.341309, 0, 1, 0.6588235, 1,
-0.1172224, 0.2219019, 1.886428, 0, 1, 0.6627451, 1,
-0.113911, -0.2877216, -3.934032, 0, 1, 0.6705883, 1,
-0.1106825, 0.2600492, -1.266824, 0, 1, 0.6745098, 1,
-0.1101385, -2.100487, -3.003011, 0, 1, 0.682353, 1,
-0.1023924, -0.1999754, -4.169007, 0, 1, 0.6862745, 1,
-0.1005773, -0.6861484, -2.94241, 0, 1, 0.6941177, 1,
-0.09940398, 1.141416, 0.1052192, 0, 1, 0.7019608, 1,
-0.0979136, -0.2075809, -3.180838, 0, 1, 0.7058824, 1,
-0.09648225, -0.7684487, -2.390281, 0, 1, 0.7137255, 1,
-0.09525098, -1.388882, -3.314587, 0, 1, 0.7176471, 1,
-0.09419036, 0.6295944, -0.007732516, 0, 1, 0.7254902, 1,
-0.09392694, 0.9308606, -0.3124535, 0, 1, 0.7294118, 1,
-0.09051763, -0.6054205, -1.194701, 0, 1, 0.7372549, 1,
-0.08838088, -1.368078, -3.511217, 0, 1, 0.7411765, 1,
-0.08801123, -0.07527637, -0.3825587, 0, 1, 0.7490196, 1,
-0.08570128, 0.5100181, -0.8139185, 0, 1, 0.7529412, 1,
-0.07583106, 0.2826216, -1.658696, 0, 1, 0.7607843, 1,
-0.07037523, 0.4054198, -0.3862197, 0, 1, 0.7647059, 1,
-0.06814095, 0.6280844, 1.154714, 0, 1, 0.772549, 1,
-0.06705135, 1.063365, -0.5839604, 0, 1, 0.7764706, 1,
-0.06553715, -0.3331275, -3.138508, 0, 1, 0.7843137, 1,
-0.05607937, -0.5852575, -2.616613, 0, 1, 0.7882353, 1,
-0.05528812, -0.2790492, -3.133268, 0, 1, 0.7960784, 1,
-0.05230204, 0.1407705, 0.05829004, 0, 1, 0.8039216, 1,
-0.05046375, -0.1968866, -4.078767, 0, 1, 0.8078431, 1,
-0.04842814, 0.8537109, -0.7921991, 0, 1, 0.8156863, 1,
-0.04751004, -0.5830468, -3.140158, 0, 1, 0.8196079, 1,
-0.04445507, 0.3362505, -0.3596916, 0, 1, 0.827451, 1,
-0.03495544, -2.485115, -3.871086, 0, 1, 0.8313726, 1,
-0.02839262, -0.3577283, -3.154342, 0, 1, 0.8392157, 1,
-0.02834484, -0.4146583, -4.296969, 0, 1, 0.8431373, 1,
-0.02332068, -0.8869739, -3.850157, 0, 1, 0.8509804, 1,
-0.02205256, -0.003145024, -3.385164, 0, 1, 0.854902, 1,
-0.01568089, -1.143366, -1.960138, 0, 1, 0.8627451, 1,
-0.008082327, -1.374307, -3.138763, 0, 1, 0.8666667, 1,
-0.007643483, 1.975299, -0.2240731, 0, 1, 0.8745098, 1,
-0.006914572, -0.3543386, -3.783357, 0, 1, 0.8784314, 1,
-0.006904829, -0.1870695, -2.742205, 0, 1, 0.8862745, 1,
-0.00558704, 0.9730934, 0.9960172, 0, 1, 0.8901961, 1,
-0.005111084, -0.673944, -3.651634, 0, 1, 0.8980392, 1,
-0.004052711, -0.03779492, -2.683658, 0, 1, 0.9058824, 1,
-0.003052909, -2.635995, -3.243117, 0, 1, 0.9098039, 1,
0.005404548, 0.9134965, 0.7796022, 0, 1, 0.9176471, 1,
0.008661007, -0.8435665, 3.861967, 0, 1, 0.9215686, 1,
0.01044613, -1.781053, 4.267979, 0, 1, 0.9294118, 1,
0.01136014, -0.6772637, 2.620649, 0, 1, 0.9333333, 1,
0.0114144, -1.022522, 2.214898, 0, 1, 0.9411765, 1,
0.01226701, 2.96858, -0.9904579, 0, 1, 0.945098, 1,
0.0139732, -0.713901, 2.624525, 0, 1, 0.9529412, 1,
0.01424909, 0.5228293, -0.9064761, 0, 1, 0.9568627, 1,
0.0150161, 0.5293311, 0.3920037, 0, 1, 0.9647059, 1,
0.01563427, 0.7149268, 1.691702, 0, 1, 0.9686275, 1,
0.01816141, 1.15461, -0.1051346, 0, 1, 0.9764706, 1,
0.02407547, 1.334278, 0.1814312, 0, 1, 0.9803922, 1,
0.02584866, -0.4937962, 3.11419, 0, 1, 0.9882353, 1,
0.02624249, -1.396889, 4.521792, 0, 1, 0.9921569, 1,
0.02626982, -0.3139518, 0.881034, 0, 1, 1, 1,
0.02771954, 1.191087, -0.08950043, 0, 0.9921569, 1, 1,
0.0289388, -0.787796, 4.316892, 0, 0.9882353, 1, 1,
0.02926885, 1.103953, -0.2800687, 0, 0.9803922, 1, 1,
0.03326067, 0.8442415, 1.646761, 0, 0.9764706, 1, 1,
0.03609161, 0.2587576, 0.2691021, 0, 0.9686275, 1, 1,
0.03624041, 0.4601611, -0.05682031, 0, 0.9647059, 1, 1,
0.0384833, 2.107472, -0.6992961, 0, 0.9568627, 1, 1,
0.03860249, -0.1466177, 1.817996, 0, 0.9529412, 1, 1,
0.04088772, -0.4138147, 1.694761, 0, 0.945098, 1, 1,
0.04574959, -0.4789818, 2.626836, 0, 0.9411765, 1, 1,
0.04692737, 1.386188, -0.119459, 0, 0.9333333, 1, 1,
0.0483852, 3.028084, 1.791758, 0, 0.9294118, 1, 1,
0.05061501, -2.600807, 2.812192, 0, 0.9215686, 1, 1,
0.05084448, -0.5928496, 4.125033, 0, 0.9176471, 1, 1,
0.05272861, -1.591946, 3.710476, 0, 0.9098039, 1, 1,
0.05750915, 1.458537, -1.51147, 0, 0.9058824, 1, 1,
0.0581605, -0.4503041, 3.115664, 0, 0.8980392, 1, 1,
0.05978612, -0.4298421, 3.797305, 0, 0.8901961, 1, 1,
0.06020269, -0.6134946, 4.003931, 0, 0.8862745, 1, 1,
0.0631948, 1.066449, -0.5955971, 0, 0.8784314, 1, 1,
0.06695063, 1.248984, 0.02566109, 0, 0.8745098, 1, 1,
0.07555176, -0.1580476, 4.238744, 0, 0.8666667, 1, 1,
0.0763452, -0.1432884, 3.173489, 0, 0.8627451, 1, 1,
0.07827386, -3.265527, 2.6061, 0, 0.854902, 1, 1,
0.09095762, 0.1877402, -0.2499213, 0, 0.8509804, 1, 1,
0.09362943, 0.7552825, -1.476102, 0, 0.8431373, 1, 1,
0.09435029, -1.563944, 3.109031, 0, 0.8392157, 1, 1,
0.0944381, 0.8113344, -0.3740359, 0, 0.8313726, 1, 1,
0.09819797, 0.0791902, 1.392798, 0, 0.827451, 1, 1,
0.09889104, 1.179746, 1.645649, 0, 0.8196079, 1, 1,
0.1011965, -1.465962, 3.527639, 0, 0.8156863, 1, 1,
0.1031892, -0.3460657, 2.528044, 0, 0.8078431, 1, 1,
0.1088404, -0.3352319, 3.918391, 0, 0.8039216, 1, 1,
0.1104819, -1.297255, 3.282242, 0, 0.7960784, 1, 1,
0.1109304, -1.16118, 0.9596547, 0, 0.7882353, 1, 1,
0.1116439, -0.4517054, 2.419311, 0, 0.7843137, 1, 1,
0.1129786, 1.368976, 0.4602377, 0, 0.7764706, 1, 1,
0.1140313, -0.7364148, 3.272956, 0, 0.772549, 1, 1,
0.1155522, 0.2557185, -0.4106523, 0, 0.7647059, 1, 1,
0.1160955, -0.7044255, 4.414322, 0, 0.7607843, 1, 1,
0.119061, -0.1167257, 1.182644, 0, 0.7529412, 1, 1,
0.1241558, 0.6172171, -1.578575, 0, 0.7490196, 1, 1,
0.1290924, 1.198689, -0.5098871, 0, 0.7411765, 1, 1,
0.1297494, -0.2950791, 3.111494, 0, 0.7372549, 1, 1,
0.1300847, 2.184612, 0.8462982, 0, 0.7294118, 1, 1,
0.1310976, -0.9140173, 4.314747, 0, 0.7254902, 1, 1,
0.1469761, 0.2879975, -0.5229568, 0, 0.7176471, 1, 1,
0.15162, 1.285399, -1.293848, 0, 0.7137255, 1, 1,
0.1517733, 0.5781233, 0.03790131, 0, 0.7058824, 1, 1,
0.1530803, 0.4962335, 0.1702104, 0, 0.6980392, 1, 1,
0.1534459, 0.1597594, 2.018316, 0, 0.6941177, 1, 1,
0.1561948, 1.564823, -1.356582, 0, 0.6862745, 1, 1,
0.1584675, 1.374056, 0.1211474, 0, 0.682353, 1, 1,
0.1616567, 0.5667828, 0.2634136, 0, 0.6745098, 1, 1,
0.1634159, 0.8278291, 1.745149, 0, 0.6705883, 1, 1,
0.1645792, -1.26359, 5.161034, 0, 0.6627451, 1, 1,
0.167705, 0.7683843, -0.2344491, 0, 0.6588235, 1, 1,
0.1701704, -0.9150075, 2.72187, 0, 0.6509804, 1, 1,
0.1719439, 0.7217122, 0.4978466, 0, 0.6470588, 1, 1,
0.1725001, 1.434671, -0.009193571, 0, 0.6392157, 1, 1,
0.1737178, -0.2191053, 3.669786, 0, 0.6352941, 1, 1,
0.1753592, -0.8360949, 4.2143, 0, 0.627451, 1, 1,
0.1780867, 0.05684158, -0.3576907, 0, 0.6235294, 1, 1,
0.1785018, 0.266546, 1.56927, 0, 0.6156863, 1, 1,
0.1808779, 1.282994, 4.303161, 0, 0.6117647, 1, 1,
0.1878799, -0.9691453, 3.713703, 0, 0.6039216, 1, 1,
0.1923687, 1.119624, 0.6873029, 0, 0.5960785, 1, 1,
0.1967807, 0.5351378, 2.073157, 0, 0.5921569, 1, 1,
0.1979513, 1.582478, 0.1842353, 0, 0.5843138, 1, 1,
0.1984972, -0.07029548, 4.241065, 0, 0.5803922, 1, 1,
0.2027355, -0.2046528, 2.222372, 0, 0.572549, 1, 1,
0.204541, -0.4581038, 2.160794, 0, 0.5686275, 1, 1,
0.2048608, -1.072193, 2.983126, 0, 0.5607843, 1, 1,
0.2053352, -0.5866919, 1.665181, 0, 0.5568628, 1, 1,
0.2057509, 0.3656525, -0.7465979, 0, 0.5490196, 1, 1,
0.2101433, -0.06693184, 3.015547, 0, 0.5450981, 1, 1,
0.2149645, -0.1317535, 2.090786, 0, 0.5372549, 1, 1,
0.2158594, -0.8433829, 2.805684, 0, 0.5333334, 1, 1,
0.2203021, -0.6397547, 3.156113, 0, 0.5254902, 1, 1,
0.2215621, 1.835539, -0.03747439, 0, 0.5215687, 1, 1,
0.22771, -0.1414794, -0.1407709, 0, 0.5137255, 1, 1,
0.2292563, 0.2218498, 2.317274, 0, 0.509804, 1, 1,
0.230074, 1.784354, 0.3635425, 0, 0.5019608, 1, 1,
0.2305846, 0.7980822, -1.07248, 0, 0.4941176, 1, 1,
0.2394869, -0.8302815, 3.301881, 0, 0.4901961, 1, 1,
0.2419386, -1.712614, 2.769282, 0, 0.4823529, 1, 1,
0.2423262, 0.5441321, -0.4450395, 0, 0.4784314, 1, 1,
0.2444053, 0.3229215, -1.06528, 0, 0.4705882, 1, 1,
0.247186, -0.592887, 1.493804, 0, 0.4666667, 1, 1,
0.250565, -0.763195, 3.423596, 0, 0.4588235, 1, 1,
0.2514225, 0.3768438, 1.813788, 0, 0.454902, 1, 1,
0.2529221, -0.3997278, 1.903378, 0, 0.4470588, 1, 1,
0.2576221, -1.294554, 4.638432, 0, 0.4431373, 1, 1,
0.2581146, 1.15108, -0.1026407, 0, 0.4352941, 1, 1,
0.2592181, 1.003968, -0.4969865, 0, 0.4313726, 1, 1,
0.2673952, 0.4058611, 0.05912448, 0, 0.4235294, 1, 1,
0.272826, -0.4627517, 3.592279, 0, 0.4196078, 1, 1,
0.2748617, 1.293525, 2.120173, 0, 0.4117647, 1, 1,
0.2780136, -0.7473224, 0.762899, 0, 0.4078431, 1, 1,
0.2813101, 0.06533516, 1.757618, 0, 0.4, 1, 1,
0.2860415, 1.51651, 0.8379322, 0, 0.3921569, 1, 1,
0.287795, 1.47323, 0.03192914, 0, 0.3882353, 1, 1,
0.2937017, 0.3003142, 1.054852, 0, 0.3803922, 1, 1,
0.3069344, 0.2482407, 0.7752382, 0, 0.3764706, 1, 1,
0.3103363, -0.8348362, 2.968181, 0, 0.3686275, 1, 1,
0.3151654, -0.7971727, 3.158144, 0, 0.3647059, 1, 1,
0.315342, -0.5742222, 2.606816, 0, 0.3568628, 1, 1,
0.3172879, 0.2459542, 0.2513286, 0, 0.3529412, 1, 1,
0.319086, -0.2922532, 3.250413, 0, 0.345098, 1, 1,
0.3247601, 0.09474725, 1.077697, 0, 0.3411765, 1, 1,
0.3284133, -0.2018581, 0.4048719, 0, 0.3333333, 1, 1,
0.3288203, -0.3930097, 1.338634, 0, 0.3294118, 1, 1,
0.3308809, 0.7285889, -0.4431399, 0, 0.3215686, 1, 1,
0.3331095, -0.6023442, 2.072433, 0, 0.3176471, 1, 1,
0.3337861, 1.841037, 1.973413, 0, 0.3098039, 1, 1,
0.3340053, -0.5867115, 2.32675, 0, 0.3058824, 1, 1,
0.3365975, 0.1798705, 1.515314, 0, 0.2980392, 1, 1,
0.3397831, -1.375087, 2.58577, 0, 0.2901961, 1, 1,
0.3477104, 0.8288878, -0.3766213, 0, 0.2862745, 1, 1,
0.3490772, 0.9248053, 0.04870474, 0, 0.2784314, 1, 1,
0.352624, 0.3680399, 2.820966, 0, 0.2745098, 1, 1,
0.3555626, -1.45343, 2.934057, 0, 0.2666667, 1, 1,
0.3571929, 1.298805, 0.9611995, 0, 0.2627451, 1, 1,
0.3601544, 1.247528, 0.775401, 0, 0.254902, 1, 1,
0.3617221, -0.3001931, 2.464544, 0, 0.2509804, 1, 1,
0.3663626, 1.461934, -0.3376901, 0, 0.2431373, 1, 1,
0.3690861, -1.092725, 4.194466, 0, 0.2392157, 1, 1,
0.3772255, -0.9901832, 2.762596, 0, 0.2313726, 1, 1,
0.3843288, 0.4942115, 1.890004, 0, 0.227451, 1, 1,
0.3898231, 1.134118, -0.4176059, 0, 0.2196078, 1, 1,
0.3899544, 1.78201, 0.3636454, 0, 0.2156863, 1, 1,
0.3909116, -0.3561852, 3.740485, 0, 0.2078431, 1, 1,
0.3917733, 1.197948, -0.8508112, 0, 0.2039216, 1, 1,
0.39394, -0.7031746, 1.814412, 0, 0.1960784, 1, 1,
0.3957328, -1.242967, 1.967848, 0, 0.1882353, 1, 1,
0.3989094, -0.223932, 3.189645, 0, 0.1843137, 1, 1,
0.3993529, 0.5777693, 0.1882657, 0, 0.1764706, 1, 1,
0.4003896, -2.090731, 3.650106, 0, 0.172549, 1, 1,
0.4035381, -0.05587779, 1.707514, 0, 0.1647059, 1, 1,
0.403783, 0.00708364, 1.940626, 0, 0.1607843, 1, 1,
0.4042347, -1.199105, 3.038158, 0, 0.1529412, 1, 1,
0.4118024, -0.7027218, 1.941466, 0, 0.1490196, 1, 1,
0.4152519, 0.5412297, 2.257074, 0, 0.1411765, 1, 1,
0.4156279, -0.04501917, 2.486291, 0, 0.1372549, 1, 1,
0.4171295, -1.909497, 2.535411, 0, 0.1294118, 1, 1,
0.4190182, -0.6614089, 3.51769, 0, 0.1254902, 1, 1,
0.4200417, -0.4543863, 2.202968, 0, 0.1176471, 1, 1,
0.4237118, -0.961522, 2.468942, 0, 0.1137255, 1, 1,
0.4244928, -0.4185432, 0.6479037, 0, 0.1058824, 1, 1,
0.4255753, 0.4378794, 2.979916, 0, 0.09803922, 1, 1,
0.4266891, 0.6471761, 1.796413, 0, 0.09411765, 1, 1,
0.4278061, 0.596882, 0.6743445, 0, 0.08627451, 1, 1,
0.4351745, -0.8968183, 2.57342, 0, 0.08235294, 1, 1,
0.4382318, -1.07791, 4.154778, 0, 0.07450981, 1, 1,
0.4386639, -1.620879, 2.461138, 0, 0.07058824, 1, 1,
0.4429912, -0.4702833, 1.480735, 0, 0.0627451, 1, 1,
0.4447241, -0.3536644, 2.450547, 0, 0.05882353, 1, 1,
0.447281, 0.9586229, 1.889236, 0, 0.05098039, 1, 1,
0.4534366, 0.4261842, 0.2267462, 0, 0.04705882, 1, 1,
0.4569984, 1.066699, -0.4522198, 0, 0.03921569, 1, 1,
0.4574149, -1.190905, 4.491761, 0, 0.03529412, 1, 1,
0.457596, 0.07513401, 2.417145, 0, 0.02745098, 1, 1,
0.4579561, 0.1920625, 0.6338829, 0, 0.02352941, 1, 1,
0.4619862, -0.3958966, 3.071454, 0, 0.01568628, 1, 1,
0.4637927, 0.05908657, 0.4523924, 0, 0.01176471, 1, 1,
0.466244, -1.608808, 2.307034, 0, 0.003921569, 1, 1,
0.4663308, -0.8312901, 2.660618, 0.003921569, 0, 1, 1,
0.471875, -0.4068277, 1.031363, 0.007843138, 0, 1, 1,
0.4719489, 0.06724727, 2.267215, 0.01568628, 0, 1, 1,
0.4731248, -1.037995, 3.163544, 0.01960784, 0, 1, 1,
0.4784184, 0.9356223, 0.4352537, 0.02745098, 0, 1, 1,
0.4807048, 0.2584143, 1.061814, 0.03137255, 0, 1, 1,
0.4860222, 0.5173603, -0.007458835, 0.03921569, 0, 1, 1,
0.4875592, -1.890324, 2.111791, 0.04313726, 0, 1, 1,
0.4897021, 0.6562793, 1.833057, 0.05098039, 0, 1, 1,
0.4904722, -1.605676, -0.824966, 0.05490196, 0, 1, 1,
0.4923144, -0.7359995, 1.908843, 0.0627451, 0, 1, 1,
0.4923398, 1.406748, -0.4937046, 0.06666667, 0, 1, 1,
0.4964219, -0.3438014, 2.413598, 0.07450981, 0, 1, 1,
0.5016227, 1.394781, -1.21568, 0.07843138, 0, 1, 1,
0.502057, 0.8646476, -0.753629, 0.08627451, 0, 1, 1,
0.5047985, 0.6575578, 1.064269, 0.09019608, 0, 1, 1,
0.5055911, 1.486811, -1.87201, 0.09803922, 0, 1, 1,
0.505725, 0.4947256, 0.444608, 0.1058824, 0, 1, 1,
0.5116527, 1.149159, 1.094441, 0.1098039, 0, 1, 1,
0.5156042, 1.533127, 0.9030031, 0.1176471, 0, 1, 1,
0.520919, 0.9018788, 1.420407, 0.1215686, 0, 1, 1,
0.5271809, -2.321851, 1.52868, 0.1294118, 0, 1, 1,
0.5285814, -1.322145, 2.225883, 0.1333333, 0, 1, 1,
0.5318926, -0.06543534, 2.464797, 0.1411765, 0, 1, 1,
0.5324662, 0.4110261, 1.479893, 0.145098, 0, 1, 1,
0.5404295, 1.174255, 0.3597237, 0.1529412, 0, 1, 1,
0.5408242, -1.559965, 1.584904, 0.1568628, 0, 1, 1,
0.5435145, 1.291932, 0.6476417, 0.1647059, 0, 1, 1,
0.5491524, 1.755999, 1.053004, 0.1686275, 0, 1, 1,
0.5496141, 1.890854, 0.661383, 0.1764706, 0, 1, 1,
0.5579004, 1.546515, 0.3379314, 0.1803922, 0, 1, 1,
0.559351, 0.5149474, 0.9984001, 0.1882353, 0, 1, 1,
0.5596136, -0.2596166, 3.028744, 0.1921569, 0, 1, 1,
0.5607443, -0.3560777, 2.172174, 0.2, 0, 1, 1,
0.5647478, -0.6642877, 2.286223, 0.2078431, 0, 1, 1,
0.566061, 2.189763, 0.0270054, 0.2117647, 0, 1, 1,
0.5682543, 0.6508011, 2.937999, 0.2196078, 0, 1, 1,
0.5697592, -0.5030457, 2.841929, 0.2235294, 0, 1, 1,
0.5743002, 0.05190452, 0.5305896, 0.2313726, 0, 1, 1,
0.5780296, 0.5899282, 0.8799008, 0.2352941, 0, 1, 1,
0.5801958, -0.1791418, 2.601664, 0.2431373, 0, 1, 1,
0.5806147, 1.099646, 1.143359, 0.2470588, 0, 1, 1,
0.5824448, 0.1454597, 1.248243, 0.254902, 0, 1, 1,
0.5888367, -0.9827086, 3.446929, 0.2588235, 0, 1, 1,
0.5995182, 1.648761, 1.057867, 0.2666667, 0, 1, 1,
0.6079341, 0.547102, -0.4989241, 0.2705882, 0, 1, 1,
0.6087062, 0.1606885, 1.610031, 0.2784314, 0, 1, 1,
0.6199747, -0.3401417, 0.5746728, 0.282353, 0, 1, 1,
0.6236431, -0.3717914, 1.80676, 0.2901961, 0, 1, 1,
0.6271328, -0.8923338, 0.732277, 0.2941177, 0, 1, 1,
0.6271955, -0.002951342, 1.494038, 0.3019608, 0, 1, 1,
0.6279792, -0.4844963, 1.810682, 0.3098039, 0, 1, 1,
0.629086, -0.337159, 1.972437, 0.3137255, 0, 1, 1,
0.6291224, 1.868135, -0.6278737, 0.3215686, 0, 1, 1,
0.6313475, 0.3843523, -1.395485, 0.3254902, 0, 1, 1,
0.6326693, 0.06560431, 0.9613647, 0.3333333, 0, 1, 1,
0.6327296, 0.9256672, 1.074292, 0.3372549, 0, 1, 1,
0.6342519, -0.1464201, 0.2219902, 0.345098, 0, 1, 1,
0.6347272, 0.1271886, 0.6564687, 0.3490196, 0, 1, 1,
0.635053, 1.000761, 0.3027583, 0.3568628, 0, 1, 1,
0.638754, -0.5716125, 1.665687, 0.3607843, 0, 1, 1,
0.638984, -1.702023, 2.975857, 0.3686275, 0, 1, 1,
0.6392154, -0.6959487, 1.272469, 0.372549, 0, 1, 1,
0.6396713, 0.3780503, 2.701135, 0.3803922, 0, 1, 1,
0.6433869, -0.3099678, 0.9333389, 0.3843137, 0, 1, 1,
0.6436638, 0.403331, 0.8718606, 0.3921569, 0, 1, 1,
0.6533278, -0.433193, 1.855245, 0.3960784, 0, 1, 1,
0.6614613, -0.2674002, 1.685142, 0.4039216, 0, 1, 1,
0.6616234, -0.775547, 2.020401, 0.4117647, 0, 1, 1,
0.6639574, 0.2744242, 2.998054, 0.4156863, 0, 1, 1,
0.6650434, -0.7564816, 1.878443, 0.4235294, 0, 1, 1,
0.6687445, 2.09836, 1.195776, 0.427451, 0, 1, 1,
0.6715941, 0.5271482, 0.1739992, 0.4352941, 0, 1, 1,
0.6718483, 0.3844366, 2.094072, 0.4392157, 0, 1, 1,
0.6774071, -0.3005988, 1.520995, 0.4470588, 0, 1, 1,
0.677514, -2.11225, 2.595589, 0.4509804, 0, 1, 1,
0.6807185, -0.2380591, 1.563074, 0.4588235, 0, 1, 1,
0.6817239, -0.8004131, 3.570843, 0.4627451, 0, 1, 1,
0.6874397, -0.6398205, 1.902447, 0.4705882, 0, 1, 1,
0.6879764, 0.4540416, 0.409395, 0.4745098, 0, 1, 1,
0.6895629, 1.309329, 0.7523898, 0.4823529, 0, 1, 1,
0.6957985, 0.5686802, 0.5212183, 0.4862745, 0, 1, 1,
0.6976054, 1.112776, 0.315778, 0.4941176, 0, 1, 1,
0.7017185, 2.069557, -0.9204427, 0.5019608, 0, 1, 1,
0.7020317, 0.6797713, 2.062592, 0.5058824, 0, 1, 1,
0.7052363, 0.3584397, 1.068044, 0.5137255, 0, 1, 1,
0.7108604, -0.7905369, 1.253073, 0.5176471, 0, 1, 1,
0.7112147, 0.441359, 0.4327846, 0.5254902, 0, 1, 1,
0.7112978, -1.50475, 2.718438, 0.5294118, 0, 1, 1,
0.7206171, -1.631927, 1.937379, 0.5372549, 0, 1, 1,
0.7318008, -0.0261409, 2.416893, 0.5411765, 0, 1, 1,
0.7320552, 0.1288176, 0.7202101, 0.5490196, 0, 1, 1,
0.7353832, 1.006408, 0.9618453, 0.5529412, 0, 1, 1,
0.7366933, -1.647729, 3.568409, 0.5607843, 0, 1, 1,
0.7373322, -0.1469382, 1.490337, 0.5647059, 0, 1, 1,
0.7416173, 0.3280793, 0.01640232, 0.572549, 0, 1, 1,
0.7486196, -0.9121682, 1.948281, 0.5764706, 0, 1, 1,
0.7509292, -1.861855, 1.86097, 0.5843138, 0, 1, 1,
0.7519765, -0.1927623, 1.401269, 0.5882353, 0, 1, 1,
0.7559649, -0.7372603, 1.394729, 0.5960785, 0, 1, 1,
0.7586913, 2.527744, -1.824886, 0.6039216, 0, 1, 1,
0.7677647, 0.1160015, 1.439229, 0.6078432, 0, 1, 1,
0.7813798, -1.049799, 3.448134, 0.6156863, 0, 1, 1,
0.7819003, -0.09669811, 3.124161, 0.6196079, 0, 1, 1,
0.7855213, -0.688957, 1.957518, 0.627451, 0, 1, 1,
0.7872741, -1.449178, 2.394167, 0.6313726, 0, 1, 1,
0.7917384, 1.808426, 1.242518, 0.6392157, 0, 1, 1,
0.7924989, -1.388984, 2.600651, 0.6431373, 0, 1, 1,
0.7928104, -0.6866608, 5.190579, 0.6509804, 0, 1, 1,
0.7953169, 1.191278, 0.1975113, 0.654902, 0, 1, 1,
0.8055027, -0.1306822, 1.338191, 0.6627451, 0, 1, 1,
0.8094472, -1.300162, 2.095943, 0.6666667, 0, 1, 1,
0.8108945, -0.8295314, 4.051885, 0.6745098, 0, 1, 1,
0.8144166, 1.862396, 1.974998, 0.6784314, 0, 1, 1,
0.8217964, -2.15322, 3.216182, 0.6862745, 0, 1, 1,
0.8264963, 0.6955991, 1.553438, 0.6901961, 0, 1, 1,
0.8333335, 0.04488097, -0.9748563, 0.6980392, 0, 1, 1,
0.8376606, -0.1928055, 1.938741, 0.7058824, 0, 1, 1,
0.8530414, -1.502966, 1.293489, 0.7098039, 0, 1, 1,
0.8539943, 1.031263, 1.879376, 0.7176471, 0, 1, 1,
0.8550391, -0.889753, 2.366652, 0.7215686, 0, 1, 1,
0.8559482, -0.4955058, 3.028191, 0.7294118, 0, 1, 1,
0.8579797, 1.530616, 0.4826347, 0.7333333, 0, 1, 1,
0.8607425, 0.4373792, 0.7495099, 0.7411765, 0, 1, 1,
0.8629087, -0.1816361, 1.903256, 0.7450981, 0, 1, 1,
0.8631477, -1.576285, 1.852048, 0.7529412, 0, 1, 1,
0.8638414, -0.8422059, 2.634012, 0.7568628, 0, 1, 1,
0.8732461, 0.1663482, 2.631236, 0.7647059, 0, 1, 1,
0.8739174, 1.896625, 0.505609, 0.7686275, 0, 1, 1,
0.8752011, -0.9076443, 2.017302, 0.7764706, 0, 1, 1,
0.877125, -1.007199, 2.588135, 0.7803922, 0, 1, 1,
0.8870903, 1.130087, 0.2549163, 0.7882353, 0, 1, 1,
0.8931963, -0.06582558, 1.919424, 0.7921569, 0, 1, 1,
0.8935127, 0.3004468, 3.130373, 0.8, 0, 1, 1,
0.8947746, 0.7169856, 0.6000823, 0.8078431, 0, 1, 1,
0.8974012, -0.3760315, 2.602233, 0.8117647, 0, 1, 1,
0.8995227, -1.145889, 2.367598, 0.8196079, 0, 1, 1,
0.9065254, 0.7662907, 0.6622659, 0.8235294, 0, 1, 1,
0.9095325, -0.1005168, 0.4171435, 0.8313726, 0, 1, 1,
0.9115952, 0.572638, 1.284997, 0.8352941, 0, 1, 1,
0.9121596, 0.8617222, 0.5275904, 0.8431373, 0, 1, 1,
0.9150162, -0.8863723, 1.680779, 0.8470588, 0, 1, 1,
0.9167742, -0.1545617, 1.964106, 0.854902, 0, 1, 1,
0.9227995, 1.519333, 0.1674514, 0.8588235, 0, 1, 1,
0.9255188, 0.6734038, -0.06126631, 0.8666667, 0, 1, 1,
0.9274056, -0.1349173, 2.197761, 0.8705882, 0, 1, 1,
0.9278771, -0.4481201, 1.765353, 0.8784314, 0, 1, 1,
0.9281929, 1.743504, -0.1337052, 0.8823529, 0, 1, 1,
0.9309042, 0.8417937, 1.556817, 0.8901961, 0, 1, 1,
0.9357419, -0.142512, 0.4761431, 0.8941177, 0, 1, 1,
0.9427769, 1.394512, -2.210711, 0.9019608, 0, 1, 1,
0.9502624, 0.5897674, 0.9148189, 0.9098039, 0, 1, 1,
0.9524696, -1.505399, 1.794432, 0.9137255, 0, 1, 1,
0.9614893, -0.2853904, 1.041725, 0.9215686, 0, 1, 1,
0.9634998, 2.481634, 1.978835, 0.9254902, 0, 1, 1,
0.9638649, -1.07842, 3.447473, 0.9333333, 0, 1, 1,
0.9646505, -1.347067, 3.773014, 0.9372549, 0, 1, 1,
0.9675363, 1.493004, 1.227494, 0.945098, 0, 1, 1,
0.9704639, -1.326597, 2.701612, 0.9490196, 0, 1, 1,
0.9716803, 0.5549952, 0.6589159, 0.9568627, 0, 1, 1,
0.9719853, 0.831408, 1.74706, 0.9607843, 0, 1, 1,
0.9744716, -0.3899554, 2.167425, 0.9686275, 0, 1, 1,
0.9769973, -0.5337505, 4.004415, 0.972549, 0, 1, 1,
0.9848036, -2.932674, 3.507394, 0.9803922, 0, 1, 1,
0.9900903, 1.010321, 2.219533, 0.9843137, 0, 1, 1,
0.9926683, 0.6134663, 0.8839241, 0.9921569, 0, 1, 1,
0.9959586, 0.9998027, 0.5011435, 0.9960784, 0, 1, 1,
1.003021, 0.7132897, 2.300747, 1, 0, 0.9960784, 1,
1.005346, -0.7087842, 3.478628, 1, 0, 0.9882353, 1,
1.006597, 0.9751936, 0.20681, 1, 0, 0.9843137, 1,
1.011936, 1.340333, -0.6110801, 1, 0, 0.9764706, 1,
1.014541, -1.901128, 3.384957, 1, 0, 0.972549, 1,
1.015297, -0.811021, 1.599374, 1, 0, 0.9647059, 1,
1.027045, -2.228138, 4.599448, 1, 0, 0.9607843, 1,
1.032928, -1.846855, 1.222461, 1, 0, 0.9529412, 1,
1.03338, -0.6048652, 2.778447, 1, 0, 0.9490196, 1,
1.034869, -0.6566089, 4.615208, 1, 0, 0.9411765, 1,
1.035963, 0.2723963, 2.977368, 1, 0, 0.9372549, 1,
1.037713, 0.5608351, 1.084918, 1, 0, 0.9294118, 1,
1.040768, -0.3079917, 2.7252, 1, 0, 0.9254902, 1,
1.043653, -1.589315, 2.770737, 1, 0, 0.9176471, 1,
1.044497, 0.03151088, 0.7849309, 1, 0, 0.9137255, 1,
1.044511, 0.7731186, 1.281402, 1, 0, 0.9058824, 1,
1.045191, 0.2763716, 0.3341019, 1, 0, 0.9019608, 1,
1.047897, 1.070474, 0.2649436, 1, 0, 0.8941177, 1,
1.053586, -0.2802329, 2.164784, 1, 0, 0.8862745, 1,
1.061677, -1.911937, 2.442614, 1, 0, 0.8823529, 1,
1.065052, -2.289749, 2.469317, 1, 0, 0.8745098, 1,
1.066449, -0.6591545, 2.535942, 1, 0, 0.8705882, 1,
1.067802, -0.766135, 3.310421, 1, 0, 0.8627451, 1,
1.075457, -0.1124427, 2.178267, 1, 0, 0.8588235, 1,
1.077365, -1.859066, 3.917732, 1, 0, 0.8509804, 1,
1.085703, 0.6057235, -0.2844665, 1, 0, 0.8470588, 1,
1.086237, 1.019396, 1.108686, 1, 0, 0.8392157, 1,
1.088721, 0.1931585, -0.6534733, 1, 0, 0.8352941, 1,
1.092712, -0.6753986, 0.9907305, 1, 0, 0.827451, 1,
1.116813, -1.766341, 3.101604, 1, 0, 0.8235294, 1,
1.120628, -0.1831323, 1.314375, 1, 0, 0.8156863, 1,
1.128873, -1.426028, 1.401159, 1, 0, 0.8117647, 1,
1.137017, 0.8042743, 0.4154285, 1, 0, 0.8039216, 1,
1.138008, -0.5135683, 2.429706, 1, 0, 0.7960784, 1,
1.139999, 0.07220974, 0.7011733, 1, 0, 0.7921569, 1,
1.140151, 0.792749, -0.2520526, 1, 0, 0.7843137, 1,
1.149177, 1.374717, 0.9661769, 1, 0, 0.7803922, 1,
1.149404, -0.9949021, 2.485222, 1, 0, 0.772549, 1,
1.15035, 2.48277, -0.3829088, 1, 0, 0.7686275, 1,
1.152308, -0.626069, 2.643512, 1, 0, 0.7607843, 1,
1.155159, 0.8388661, 0.9189607, 1, 0, 0.7568628, 1,
1.156631, 0.7037626, 1.380725, 1, 0, 0.7490196, 1,
1.156666, 0.4237356, 0.9621595, 1, 0, 0.7450981, 1,
1.162177, 1.059124, 1.545249, 1, 0, 0.7372549, 1,
1.166401, -0.6790363, 0.2005763, 1, 0, 0.7333333, 1,
1.171381, -1.272049, 2.581032, 1, 0, 0.7254902, 1,
1.175711, 0.4549258, 0.2722455, 1, 0, 0.7215686, 1,
1.176974, 0.1188928, 1.733625, 1, 0, 0.7137255, 1,
1.178345, -1.325843, 0.3214032, 1, 0, 0.7098039, 1,
1.190196, 0.4775537, 0.7651044, 1, 0, 0.7019608, 1,
1.191563, 0.8482055, 2.36227, 1, 0, 0.6941177, 1,
1.195096, -2.002327, 1.414244, 1, 0, 0.6901961, 1,
1.215751, -0.8713409, 1.45999, 1, 0, 0.682353, 1,
1.221116, 1.476821, 0.8961731, 1, 0, 0.6784314, 1,
1.221788, -0.0190512, 0.450567, 1, 0, 0.6705883, 1,
1.222208, 0.1780947, 0.4155669, 1, 0, 0.6666667, 1,
1.230873, -1.701574, 2.732274, 1, 0, 0.6588235, 1,
1.234168, -0.903403, 2.063382, 1, 0, 0.654902, 1,
1.236756, 1.228649, 0.2468152, 1, 0, 0.6470588, 1,
1.248407, 0.4849972, 1.291324, 1, 0, 0.6431373, 1,
1.254779, 0.3591892, -0.1506492, 1, 0, 0.6352941, 1,
1.259915, -2.206208, 1.670415, 1, 0, 0.6313726, 1,
1.259984, -2.835733, 4.465155, 1, 0, 0.6235294, 1,
1.267914, 0.9433393, -0.4920653, 1, 0, 0.6196079, 1,
1.273111, -0.1255689, 1.300482, 1, 0, 0.6117647, 1,
1.274959, -0.5735834, 0.575115, 1, 0, 0.6078432, 1,
1.298555, 1.354796, 3.420685, 1, 0, 0.6, 1,
1.320436, 1.173002, 0.9431754, 1, 0, 0.5921569, 1,
1.322769, -1.353521, 2.461187, 1, 0, 0.5882353, 1,
1.326866, -0.3958571, 1.150168, 1, 0, 0.5803922, 1,
1.335268, -1.184688, 0.3255857, 1, 0, 0.5764706, 1,
1.335726, -0.166195, 1.244258, 1, 0, 0.5686275, 1,
1.338525, -0.1518852, 1.804731, 1, 0, 0.5647059, 1,
1.339219, 0.8491889, 1.990625, 1, 0, 0.5568628, 1,
1.341323, -1.35285, 2.577503, 1, 0, 0.5529412, 1,
1.348363, -0.4123801, 2.142583, 1, 0, 0.5450981, 1,
1.34901, 0.08620956, 1.107896, 1, 0, 0.5411765, 1,
1.362831, 0.1240031, 2.454848, 1, 0, 0.5333334, 1,
1.368058, -0.8948331, 2.019573, 1, 0, 0.5294118, 1,
1.370108, 0.1659812, 2.083106, 1, 0, 0.5215687, 1,
1.373519, 0.6928472, 2.295554, 1, 0, 0.5176471, 1,
1.379742, -0.8541647, 2.300747, 1, 0, 0.509804, 1,
1.382173, -0.1043897, 3.137826, 1, 0, 0.5058824, 1,
1.385901, 0.3924511, 2.626999, 1, 0, 0.4980392, 1,
1.397574, 1.12921, 0.9106968, 1, 0, 0.4901961, 1,
1.398883, -1.10281, 2.336406, 1, 0, 0.4862745, 1,
1.398923, -0.6724433, 1.48889, 1, 0, 0.4784314, 1,
1.400421, -0.5178496, 3.231364, 1, 0, 0.4745098, 1,
1.400623, 0.2265447, 2.753329, 1, 0, 0.4666667, 1,
1.410209, 0.7118366, 2.575043, 1, 0, 0.4627451, 1,
1.412647, -1.963973, 1.904493, 1, 0, 0.454902, 1,
1.415961, 1.106139, 1.279233, 1, 0, 0.4509804, 1,
1.421532, -0.6308606, 2.501924, 1, 0, 0.4431373, 1,
1.424369, -0.1925307, 1.89341, 1, 0, 0.4392157, 1,
1.42725, 1.291137, -0.4675323, 1, 0, 0.4313726, 1,
1.435995, 0.1083901, 0.6222871, 1, 0, 0.427451, 1,
1.436861, 0.1487107, 2.0727, 1, 0, 0.4196078, 1,
1.461072, -0.4571446, 1.907367, 1, 0, 0.4156863, 1,
1.475503, -2.149161, 2.287122, 1, 0, 0.4078431, 1,
1.491292, -0.9907751, 0.9975301, 1, 0, 0.4039216, 1,
1.492973, -0.0236325, 2.780064, 1, 0, 0.3960784, 1,
1.507939, 0.06312365, 2.992605, 1, 0, 0.3882353, 1,
1.517857, -1.268658, 1.814552, 1, 0, 0.3843137, 1,
1.527901, 0.1347349, 1.535791, 1, 0, 0.3764706, 1,
1.534145, -0.3908809, 2.531657, 1, 0, 0.372549, 1,
1.552552, -0.708265, 2.441364, 1, 0, 0.3647059, 1,
1.556382, -2.736629, 3.191231, 1, 0, 0.3607843, 1,
1.557459, 0.8372642, 0.3539733, 1, 0, 0.3529412, 1,
1.563278, 1.192683, 1.12583, 1, 0, 0.3490196, 1,
1.566339, -1.7307, 2.248508, 1, 0, 0.3411765, 1,
1.569275, 0.5167911, 3.833304, 1, 0, 0.3372549, 1,
1.569497, -0.5171587, 3.301142, 1, 0, 0.3294118, 1,
1.570714, -1.03966, 1.899515, 1, 0, 0.3254902, 1,
1.577055, 1.422464, 0.7923638, 1, 0, 0.3176471, 1,
1.584514, -1.355603, 2.793077, 1, 0, 0.3137255, 1,
1.60053, -0.1406963, 0.8945239, 1, 0, 0.3058824, 1,
1.604561, -0.755917, 1.361128, 1, 0, 0.2980392, 1,
1.617781, 0.6512609, -0.7172228, 1, 0, 0.2941177, 1,
1.626789, 0.958549, 0.8133828, 1, 0, 0.2862745, 1,
1.632879, -0.01786435, 1.236957, 1, 0, 0.282353, 1,
1.634129, 0.9366969, 1.44835, 1, 0, 0.2745098, 1,
1.652544, -0.3035673, -0.8064973, 1, 0, 0.2705882, 1,
1.663374, -0.1947895, 1.047421, 1, 0, 0.2627451, 1,
1.690284, -0.3073682, 4.77618, 1, 0, 0.2588235, 1,
1.711576, -0.8282285, 2.664206, 1, 0, 0.2509804, 1,
1.745815, 0.6760976, 2.211308, 1, 0, 0.2470588, 1,
1.750522, -0.7525749, 1.269795, 1, 0, 0.2392157, 1,
1.751349, -1.429468, 1.697242, 1, 0, 0.2352941, 1,
1.763879, -0.01664371, 0.3927512, 1, 0, 0.227451, 1,
1.783964, 0.4516839, 0.2674004, 1, 0, 0.2235294, 1,
1.785495, -0.362489, 0.4884546, 1, 0, 0.2156863, 1,
1.78909, 0.1517601, 1.378848, 1, 0, 0.2117647, 1,
1.824563, 0.3712336, 3.039367, 1, 0, 0.2039216, 1,
1.835509, 0.584053, 2.723031, 1, 0, 0.1960784, 1,
1.840461, 0.6862201, 1.225456, 1, 0, 0.1921569, 1,
1.859902, 0.4036167, 1.957896, 1, 0, 0.1843137, 1,
1.873537, 0.0357606, 2.207464, 1, 0, 0.1803922, 1,
1.979853, 3.89146, 0.7817162, 1, 0, 0.172549, 1,
1.987983, -2.564408, 3.066962, 1, 0, 0.1686275, 1,
1.992337, 0.9722915, 1.62766, 1, 0, 0.1607843, 1,
2.028555, -0.2791145, 2.272114, 1, 0, 0.1568628, 1,
2.030308, 1.843839, 1.265231, 1, 0, 0.1490196, 1,
2.078441, -0.2179744, 0.4340559, 1, 0, 0.145098, 1,
2.110132, -0.871681, 2.108915, 1, 0, 0.1372549, 1,
2.111156, 0.6914964, -0.04448291, 1, 0, 0.1333333, 1,
2.120173, -1.105919, 0.2033739, 1, 0, 0.1254902, 1,
2.122051, -0.01240216, 1.317975, 1, 0, 0.1215686, 1,
2.232462, -0.09939368, 3.038877, 1, 0, 0.1137255, 1,
2.25435, 0.4519644, 1.079691, 1, 0, 0.1098039, 1,
2.291276, 0.3166624, 1.692369, 1, 0, 0.1019608, 1,
2.342762, 0.04564379, 1.922668, 1, 0, 0.09411765, 1,
2.37532, -1.393821, 1.471776, 1, 0, 0.09019608, 1,
2.399226, 0.4483983, 1.863747, 1, 0, 0.08235294, 1,
2.399714, -1.505749, 2.731264, 1, 0, 0.07843138, 1,
2.412018, -0.7861249, 2.040345, 1, 0, 0.07058824, 1,
2.432922, -0.7577152, 2.089189, 1, 0, 0.06666667, 1,
2.446331, 0.03458589, 0.3411937, 1, 0, 0.05882353, 1,
2.468925, 0.6482335, 2.204434, 1, 0, 0.05490196, 1,
2.558873, -0.6343625, 1.860647, 1, 0, 0.04705882, 1,
2.562438, -0.9490439, 2.506792, 1, 0, 0.04313726, 1,
2.59182, 0.3826632, 0.9725461, 1, 0, 0.03529412, 1,
2.652212, -1.627687, 2.198761, 1, 0, 0.03137255, 1,
2.927528, 0.2807481, -0.6281287, 1, 0, 0.02352941, 1,
3.000207, -0.4928851, 1.198201, 1, 0, 0.01960784, 1,
3.206928, 0.3333755, 1.734068, 1, 0, 0.01176471, 1,
3.21252, -0.2077859, 1.285565, 1, 0, 0.007843138, 1
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
-0.01888812, -4.478636, -7.369643, 0, -0.5, 0.5, 0.5,
-0.01888812, -4.478636, -7.369643, 1, -0.5, 0.5, 0.5,
-0.01888812, -4.478636, -7.369643, 1, 1.5, 0.5, 0.5,
-0.01888812, -4.478636, -7.369643, 0, 1.5, 0.5, 0.5
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
-4.345744, 0.3129663, -7.369643, 0, -0.5, 0.5, 0.5,
-4.345744, 0.3129663, -7.369643, 1, -0.5, 0.5, 0.5,
-4.345744, 0.3129663, -7.369643, 1, 1.5, 0.5, 0.5,
-4.345744, 0.3129663, -7.369643, 0, 1.5, 0.5, 0.5
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
-4.345744, -4.478636, -0.179332, 0, -0.5, 0.5, 0.5,
-4.345744, -4.478636, -0.179332, 1, -0.5, 0.5, 0.5,
-4.345744, -4.478636, -0.179332, 1, 1.5, 0.5, 0.5,
-4.345744, -4.478636, -0.179332, 0, 1.5, 0.5, 0.5
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
-3, -3.372882, -5.71034,
3, -3.372882, -5.71034,
-3, -3.372882, -5.71034,
-3, -3.557174, -5.986891,
-2, -3.372882, -5.71034,
-2, -3.557174, -5.986891,
-1, -3.372882, -5.71034,
-1, -3.557174, -5.986891,
0, -3.372882, -5.71034,
0, -3.557174, -5.986891,
1, -3.372882, -5.71034,
1, -3.557174, -5.986891,
2, -3.372882, -5.71034,
2, -3.557174, -5.986891,
3, -3.372882, -5.71034,
3, -3.557174, -5.986891
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
-3, -3.925759, -6.539991, 0, -0.5, 0.5, 0.5,
-3, -3.925759, -6.539991, 1, -0.5, 0.5, 0.5,
-3, -3.925759, -6.539991, 1, 1.5, 0.5, 0.5,
-3, -3.925759, -6.539991, 0, 1.5, 0.5, 0.5,
-2, -3.925759, -6.539991, 0, -0.5, 0.5, 0.5,
-2, -3.925759, -6.539991, 1, -0.5, 0.5, 0.5,
-2, -3.925759, -6.539991, 1, 1.5, 0.5, 0.5,
-2, -3.925759, -6.539991, 0, 1.5, 0.5, 0.5,
-1, -3.925759, -6.539991, 0, -0.5, 0.5, 0.5,
-1, -3.925759, -6.539991, 1, -0.5, 0.5, 0.5,
-1, -3.925759, -6.539991, 1, 1.5, 0.5, 0.5,
-1, -3.925759, -6.539991, 0, 1.5, 0.5, 0.5,
0, -3.925759, -6.539991, 0, -0.5, 0.5, 0.5,
0, -3.925759, -6.539991, 1, -0.5, 0.5, 0.5,
0, -3.925759, -6.539991, 1, 1.5, 0.5, 0.5,
0, -3.925759, -6.539991, 0, 1.5, 0.5, 0.5,
1, -3.925759, -6.539991, 0, -0.5, 0.5, 0.5,
1, -3.925759, -6.539991, 1, -0.5, 0.5, 0.5,
1, -3.925759, -6.539991, 1, 1.5, 0.5, 0.5,
1, -3.925759, -6.539991, 0, 1.5, 0.5, 0.5,
2, -3.925759, -6.539991, 0, -0.5, 0.5, 0.5,
2, -3.925759, -6.539991, 1, -0.5, 0.5, 0.5,
2, -3.925759, -6.539991, 1, 1.5, 0.5, 0.5,
2, -3.925759, -6.539991, 0, 1.5, 0.5, 0.5,
3, -3.925759, -6.539991, 0, -0.5, 0.5, 0.5,
3, -3.925759, -6.539991, 1, -0.5, 0.5, 0.5,
3, -3.925759, -6.539991, 1, 1.5, 0.5, 0.5,
3, -3.925759, -6.539991, 0, 1.5, 0.5, 0.5
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
-3.347239, -2, -5.71034,
-3.347239, 2, -5.71034,
-3.347239, -2, -5.71034,
-3.513656, -2, -5.986891,
-3.347239, 0, -5.71034,
-3.513656, 0, -5.986891,
-3.347239, 2, -5.71034,
-3.513656, 2, -5.986891
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
-3.846492, -2, -6.539991, 0, -0.5, 0.5, 0.5,
-3.846492, -2, -6.539991, 1, -0.5, 0.5, 0.5,
-3.846492, -2, -6.539991, 1, 1.5, 0.5, 0.5,
-3.846492, -2, -6.539991, 0, 1.5, 0.5, 0.5,
-3.846492, 0, -6.539991, 0, -0.5, 0.5, 0.5,
-3.846492, 0, -6.539991, 1, -0.5, 0.5, 0.5,
-3.846492, 0, -6.539991, 1, 1.5, 0.5, 0.5,
-3.846492, 0, -6.539991, 0, 1.5, 0.5, 0.5,
-3.846492, 2, -6.539991, 0, -0.5, 0.5, 0.5,
-3.846492, 2, -6.539991, 1, -0.5, 0.5, 0.5,
-3.846492, 2, -6.539991, 1, 1.5, 0.5, 0.5,
-3.846492, 2, -6.539991, 0, 1.5, 0.5, 0.5
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
-3.347239, -3.372882, -4,
-3.347239, -3.372882, 4,
-3.347239, -3.372882, -4,
-3.513656, -3.557174, -4,
-3.347239, -3.372882, -2,
-3.513656, -3.557174, -2,
-3.347239, -3.372882, 0,
-3.513656, -3.557174, 0,
-3.347239, -3.372882, 2,
-3.513656, -3.557174, 2,
-3.347239, -3.372882, 4,
-3.513656, -3.557174, 4
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
-3.846492, -3.925759, -4, 0, -0.5, 0.5, 0.5,
-3.846492, -3.925759, -4, 1, -0.5, 0.5, 0.5,
-3.846492, -3.925759, -4, 1, 1.5, 0.5, 0.5,
-3.846492, -3.925759, -4, 0, 1.5, 0.5, 0.5,
-3.846492, -3.925759, -2, 0, -0.5, 0.5, 0.5,
-3.846492, -3.925759, -2, 1, -0.5, 0.5, 0.5,
-3.846492, -3.925759, -2, 1, 1.5, 0.5, 0.5,
-3.846492, -3.925759, -2, 0, 1.5, 0.5, 0.5,
-3.846492, -3.925759, 0, 0, -0.5, 0.5, 0.5,
-3.846492, -3.925759, 0, 1, -0.5, 0.5, 0.5,
-3.846492, -3.925759, 0, 1, 1.5, 0.5, 0.5,
-3.846492, -3.925759, 0, 0, 1.5, 0.5, 0.5,
-3.846492, -3.925759, 2, 0, -0.5, 0.5, 0.5,
-3.846492, -3.925759, 2, 1, -0.5, 0.5, 0.5,
-3.846492, -3.925759, 2, 1, 1.5, 0.5, 0.5,
-3.846492, -3.925759, 2, 0, 1.5, 0.5, 0.5,
-3.846492, -3.925759, 4, 0, -0.5, 0.5, 0.5,
-3.846492, -3.925759, 4, 1, -0.5, 0.5, 0.5,
-3.846492, -3.925759, 4, 1, 1.5, 0.5, 0.5,
-3.846492, -3.925759, 4, 0, 1.5, 0.5, 0.5
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
-3.347239, -3.372882, -5.71034,
-3.347239, 3.998815, -5.71034,
-3.347239, -3.372882, 5.351676,
-3.347239, 3.998815, 5.351676,
-3.347239, -3.372882, -5.71034,
-3.347239, -3.372882, 5.351676,
-3.347239, 3.998815, -5.71034,
-3.347239, 3.998815, 5.351676,
-3.347239, -3.372882, -5.71034,
3.309463, -3.372882, -5.71034,
-3.347239, -3.372882, 5.351676,
3.309463, -3.372882, 5.351676,
-3.347239, 3.998815, -5.71034,
3.309463, 3.998815, -5.71034,
-3.347239, 3.998815, 5.351676,
3.309463, 3.998815, 5.351676,
3.309463, -3.372882, -5.71034,
3.309463, 3.998815, -5.71034,
3.309463, -3.372882, 5.351676,
3.309463, 3.998815, 5.351676,
3.309463, -3.372882, -5.71034,
3.309463, -3.372882, 5.351676,
3.309463, 3.998815, -5.71034,
3.309463, 3.998815, 5.351676
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
var radius = 7.938583;
var distance = 35.31966;
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
mvMatrix.translate( 0.01888812, -0.3129663, 0.179332 );
mvMatrix.scale( 1.28943, 1.164366, 0.7759301 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.31966);
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
kepone<-read.table("kepone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-kepone$V2
```

```
## Error in eval(expr, envir, enclos): object 'kepone' not found
```

```r
y<-kepone$V3
```

```
## Error in eval(expr, envir, enclos): object 'kepone' not found
```

```r
z<-kepone$V4
```

```
## Error in eval(expr, envir, enclos): object 'kepone' not found
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
-3.250297, -0.5059472, -1.205735, 0, 0, 1, 1, 1,
-2.866727, -0.1820855, -1.994058, 1, 0, 0, 1, 1,
-2.855782, -1.154323, -1.085632, 1, 0, 0, 1, 1,
-2.69105, -0.9792994, -3.380839, 1, 0, 0, 1, 1,
-2.643236, -1.040647, -3.034497, 1, 0, 0, 1, 1,
-2.6406, -0.4130484, -2.834517, 1, 0, 0, 1, 1,
-2.476961, 0.3263009, -2.530597, 0, 0, 0, 1, 1,
-2.455163, -0.7365423, -1.836262, 0, 0, 0, 1, 1,
-2.452493, -1.271739, -3.395209, 0, 0, 0, 1, 1,
-2.388126, -0.2035894, -2.062016, 0, 0, 0, 1, 1,
-2.370039, 0.2747302, -1.505952, 0, 0, 0, 1, 1,
-2.31831, -0.9866226, -2.629155, 0, 0, 0, 1, 1,
-2.22911, -0.1917792, -1.39592, 0, 0, 0, 1, 1,
-2.198487, 1.412728, -0.186321, 1, 1, 1, 1, 1,
-2.116375, -0.1285854, -2.264856, 1, 1, 1, 1, 1,
-2.113893, -1.181574, -4.47473, 1, 1, 1, 1, 1,
-2.078665, -0.7575601, -2.936849, 1, 1, 1, 1, 1,
-2.070093, 0.8032253, -1.802704, 1, 1, 1, 1, 1,
-2.026429, -0.5888683, -2.335735, 1, 1, 1, 1, 1,
-1.969709, -1.696982, -2.389414, 1, 1, 1, 1, 1,
-1.964347, 1.020125, -1.26946, 1, 1, 1, 1, 1,
-1.958172, 0.1913963, -1.254899, 1, 1, 1, 1, 1,
-1.952536, 0.453173, -0.6009881, 1, 1, 1, 1, 1,
-1.943774, 0.3452609, -1.006153, 1, 1, 1, 1, 1,
-1.919028, 0.276477, -3.83118, 1, 1, 1, 1, 1,
-1.908099, -2.323338, -2.460248, 1, 1, 1, 1, 1,
-1.902449, -0.08797773, -2.377806, 1, 1, 1, 1, 1,
-1.87976, 0.2735038, 0.6533741, 1, 1, 1, 1, 1,
-1.868153, -0.04660609, -1.097035, 0, 0, 1, 1, 1,
-1.841697, 0.1494052, -2.057849, 1, 0, 0, 1, 1,
-1.823504, 2.270458, -1.514437, 1, 0, 0, 1, 1,
-1.80858, 2.271744, 0.1044858, 1, 0, 0, 1, 1,
-1.800818, 0.5202706, -3.124843, 1, 0, 0, 1, 1,
-1.778495, -0.311418, -0.9084218, 1, 0, 0, 1, 1,
-1.777163, -0.2180345, -0.2782258, 0, 0, 0, 1, 1,
-1.746513, -1.258181, -4.258691, 0, 0, 0, 1, 1,
-1.682506, -0.5085678, -3.165055, 0, 0, 0, 1, 1,
-1.678427, -0.5543612, -0.3730076, 0, 0, 0, 1, 1,
-1.652417, -1.485227, -2.158951, 0, 0, 0, 1, 1,
-1.631407, 1.030433, -0.09995751, 0, 0, 0, 1, 1,
-1.624906, 1.272368, -0.229245, 0, 0, 0, 1, 1,
-1.62298, 0.2392276, -0.7137957, 1, 1, 1, 1, 1,
-1.620573, -0.2388224, -0.9261674, 1, 1, 1, 1, 1,
-1.618199, 0.09281711, -0.2653502, 1, 1, 1, 1, 1,
-1.600376, 0.173066, -0.6114886, 1, 1, 1, 1, 1,
-1.561832, -0.4078524, -1.207882, 1, 1, 1, 1, 1,
-1.550962, -0.8286798, 0.2821515, 1, 1, 1, 1, 1,
-1.549407, -0.803933, -2.216737, 1, 1, 1, 1, 1,
-1.546051, -1.011634, -2.154638, 1, 1, 1, 1, 1,
-1.530051, 0.1685749, -0.6411021, 1, 1, 1, 1, 1,
-1.527752, 0.7764897, -1.320889, 1, 1, 1, 1, 1,
-1.52056, 1.201723, -0.3549308, 1, 1, 1, 1, 1,
-1.510277, -0.005992416, 0.0962608, 1, 1, 1, 1, 1,
-1.50512, 0.4457938, 0.2666613, 1, 1, 1, 1, 1,
-1.488935, -1.053697, -3.479158, 1, 1, 1, 1, 1,
-1.487217, -1.699289, -2.31343, 1, 1, 1, 1, 1,
-1.479317, -0.3560129, -3.271232, 0, 0, 1, 1, 1,
-1.471432, 1.086411, -1.396447, 1, 0, 0, 1, 1,
-1.469288, 0.6984496, -1.837412, 1, 0, 0, 1, 1,
-1.466514, 2.045996, -1.778794, 1, 0, 0, 1, 1,
-1.462411, -0.166288, -2.947016, 1, 0, 0, 1, 1,
-1.456628, 1.127565, 0.3044445, 1, 0, 0, 1, 1,
-1.443733, 1.548438, -0.3172466, 0, 0, 0, 1, 1,
-1.437508, -1.36685, -2.071487, 0, 0, 0, 1, 1,
-1.43347, 0.893023, -0.2239867, 0, 0, 0, 1, 1,
-1.42783, 0.2144468, -1.962097, 0, 0, 0, 1, 1,
-1.404223, -0.597347, -1.232025, 0, 0, 0, 1, 1,
-1.351805, 1.701547, -2.798549, 0, 0, 0, 1, 1,
-1.34805, 0.746076, -1.040794, 0, 0, 0, 1, 1,
-1.331383, -0.3348329, -1.443469, 1, 1, 1, 1, 1,
-1.329808, -0.107785, -2.910197, 1, 1, 1, 1, 1,
-1.325693, -0.2068145, -2.086907, 1, 1, 1, 1, 1,
-1.320573, -0.2564582, -1.012556, 1, 1, 1, 1, 1,
-1.308157, -0.2014047, -0.1986087, 1, 1, 1, 1, 1,
-1.281918, -1.24788, -2.836597, 1, 1, 1, 1, 1,
-1.270616, 0.8436782, -1.552285, 1, 1, 1, 1, 1,
-1.270153, -0.5481654, -1.411482, 1, 1, 1, 1, 1,
-1.263832, 0.5168203, 0.6013895, 1, 1, 1, 1, 1,
-1.262606, -0.4404639, -2.032456, 1, 1, 1, 1, 1,
-1.255451, 0.8722137, 0.1677798, 1, 1, 1, 1, 1,
-1.251188, -0.3221249, -0.8635958, 1, 1, 1, 1, 1,
-1.249855, 0.4682807, -3.455751, 1, 1, 1, 1, 1,
-1.242424, -0.385563, -2.621422, 1, 1, 1, 1, 1,
-1.240193, -0.1083001, -1.72271, 1, 1, 1, 1, 1,
-1.238987, 0.103342, 0.1253445, 0, 0, 1, 1, 1,
-1.23202, -0.9048876, -3.018223, 1, 0, 0, 1, 1,
-1.231511, 0.0664144, -2.147541, 1, 0, 0, 1, 1,
-1.225942, -0.5672966, -2.556412, 1, 0, 0, 1, 1,
-1.220695, -0.02859305, -1.433773, 1, 0, 0, 1, 1,
-1.219975, -1.498006, -2.668012, 1, 0, 0, 1, 1,
-1.218152, -0.2773371, -2.55061, 0, 0, 0, 1, 1,
-1.215628, 0.3882436, 0.1419555, 0, 0, 0, 1, 1,
-1.21533, 0.6664405, 0.784981, 0, 0, 0, 1, 1,
-1.214148, -0.3526465, -2.03838, 0, 0, 0, 1, 1,
-1.214137, 2.189534, -1.402683, 0, 0, 0, 1, 1,
-1.212061, 1.133371, -0.8590433, 0, 0, 0, 1, 1,
-1.206004, -0.6597985, -2.529981, 0, 0, 0, 1, 1,
-1.205157, 0.04210508, -0.775292, 1, 1, 1, 1, 1,
-1.204987, 0.8047121, -3.29173, 1, 1, 1, 1, 1,
-1.197589, 1.140284, -0.06190921, 1, 1, 1, 1, 1,
-1.191035, -1.312362, -3.99602, 1, 1, 1, 1, 1,
-1.182569, 1.448122, -0.9445196, 1, 1, 1, 1, 1,
-1.175536, 0.6282224, -2.144097, 1, 1, 1, 1, 1,
-1.175292, 0.8675388, -1.319531, 1, 1, 1, 1, 1,
-1.175083, -2.229843, -2.148483, 1, 1, 1, 1, 1,
-1.175013, 0.3533362, -0.3458161, 1, 1, 1, 1, 1,
-1.173344, -1.070035, -2.168638, 1, 1, 1, 1, 1,
-1.170111, -0.1032299, -1.737883, 1, 1, 1, 1, 1,
-1.169058, -0.07856891, -1.220266, 1, 1, 1, 1, 1,
-1.161546, -1.011478, -2.220646, 1, 1, 1, 1, 1,
-1.160291, -0.601359, -2.448489, 1, 1, 1, 1, 1,
-1.147769, -0.8885592, -0.693436, 1, 1, 1, 1, 1,
-1.146284, -1.116643, -2.701545, 0, 0, 1, 1, 1,
-1.144543, -0.7508904, -1.681976, 1, 0, 0, 1, 1,
-1.142974, 0.6404459, -4.238255, 1, 0, 0, 1, 1,
-1.141648, -1.842986, -1.481508, 1, 0, 0, 1, 1,
-1.138844, 0.3096921, -1.861787, 1, 0, 0, 1, 1,
-1.132179, 0.688109, -0.4409006, 1, 0, 0, 1, 1,
-1.13143, -0.956555, -2.246018, 0, 0, 0, 1, 1,
-1.128761, -0.1962296, -1.217349, 0, 0, 0, 1, 1,
-1.128109, -0.6564488, -2.895289, 0, 0, 0, 1, 1,
-1.12727, 0.4481152, -0.5469112, 0, 0, 0, 1, 1,
-1.120892, 0.5632563, -0.3194263, 0, 0, 0, 1, 1,
-1.114157, -1.367604, -2.077619, 0, 0, 0, 1, 1,
-1.110808, 0.6980442, -0.9090684, 0, 0, 0, 1, 1,
-1.103289, 0.6497492, -2.142115, 1, 1, 1, 1, 1,
-1.102455, -0.8178102, -2.812343, 1, 1, 1, 1, 1,
-1.095819, 0.1485217, -1.52816, 1, 1, 1, 1, 1,
-1.089166, -0.6462523, -2.86695, 1, 1, 1, 1, 1,
-1.082437, -0.8321238, -2.490235, 1, 1, 1, 1, 1,
-1.07389, 1.336774, -0.9418306, 1, 1, 1, 1, 1,
-1.068024, -0.0658165, -0.8645563, 1, 1, 1, 1, 1,
-1.064787, 0.6064723, -0.726286, 1, 1, 1, 1, 1,
-1.062591, -0.2816733, -0.9540029, 1, 1, 1, 1, 1,
-1.060742, -0.4410785, -3.163121, 1, 1, 1, 1, 1,
-1.043625, 1.055604, -1.013991, 1, 1, 1, 1, 1,
-1.041156, 0.05750267, -2.201185, 1, 1, 1, 1, 1,
-1.040986, 1.644075, -0.7021729, 1, 1, 1, 1, 1,
-1.040649, -0.1336757, -2.419841, 1, 1, 1, 1, 1,
-1.026047, -0.9943039, -3.472717, 1, 1, 1, 1, 1,
-1.018035, -0.1463789, -1.437989, 0, 0, 1, 1, 1,
-1.014619, -0.2826107, -1.092365, 1, 0, 0, 1, 1,
-1.012786, 1.233824, -1.023004, 1, 0, 0, 1, 1,
-1.007171, 1.467538, -1.154264, 1, 0, 0, 1, 1,
-1.005968, -0.02698776, -0.09488437, 1, 0, 0, 1, 1,
-1.003299, 2.050439, -0.4901537, 1, 0, 0, 1, 1,
-1.00005, -1.247601, -1.474044, 0, 0, 0, 1, 1,
-0.9940998, -0.8713406, -1.980143, 0, 0, 0, 1, 1,
-0.9779171, -0.4343434, -0.8653775, 0, 0, 0, 1, 1,
-0.9769101, 0.1939188, -1.638592, 0, 0, 0, 1, 1,
-0.9766707, -0.5543846, -1.934495, 0, 0, 0, 1, 1,
-0.9759399, 0.29151, -1.463711, 0, 0, 0, 1, 1,
-0.9693703, -2.180079, -1.988823, 0, 0, 0, 1, 1,
-0.9544023, -0.238618, -0.3817571, 1, 1, 1, 1, 1,
-0.9525776, -0.6852168, -3.237008, 1, 1, 1, 1, 1,
-0.945532, -1.467115, -1.065542, 1, 1, 1, 1, 1,
-0.9424924, -0.4967322, -2.525523, 1, 1, 1, 1, 1,
-0.9270818, -1.138135, -3.957651, 1, 1, 1, 1, 1,
-0.9249337, -0.3460802, -0.5759426, 1, 1, 1, 1, 1,
-0.916128, 0.1221935, -3.268613, 1, 1, 1, 1, 1,
-0.9109582, -0.6140979, -1.866794, 1, 1, 1, 1, 1,
-0.9040669, 0.5697263, -0.7420643, 1, 1, 1, 1, 1,
-0.9007172, -0.4826084, -1.581601, 1, 1, 1, 1, 1,
-0.897008, -0.8901187, -3.440154, 1, 1, 1, 1, 1,
-0.8965111, 1.129586, -1.519196, 1, 1, 1, 1, 1,
-0.888838, -1.472776, -1.911889, 1, 1, 1, 1, 1,
-0.8789561, 0.2712613, -1.921297, 1, 1, 1, 1, 1,
-0.8744007, 1.655507, -1.659744, 1, 1, 1, 1, 1,
-0.8621026, -2.257773, -1.232688, 0, 0, 1, 1, 1,
-0.8486026, -0.08507674, -1.003404, 1, 0, 0, 1, 1,
-0.8463264, -0.06326558, -1.682649, 1, 0, 0, 1, 1,
-0.8462868, 0.7456645, -0.1403805, 1, 0, 0, 1, 1,
-0.8340272, 0.3152801, -0.8153705, 1, 0, 0, 1, 1,
-0.8246755, 1.337809, 0.5535999, 1, 0, 0, 1, 1,
-0.8204001, -0.9799206, -3.149756, 0, 0, 0, 1, 1,
-0.8128959, 0.3663681, -0.5830582, 0, 0, 0, 1, 1,
-0.8091878, -0.2558085, -1.845263, 0, 0, 0, 1, 1,
-0.8021525, 0.0656657, -2.207308, 0, 0, 0, 1, 1,
-0.7894005, 0.5801717, -1.278008, 0, 0, 0, 1, 1,
-0.7846408, 0.2705643, -1.586118, 0, 0, 0, 1, 1,
-0.7835368, 0.2764989, -2.942235, 0, 0, 0, 1, 1,
-0.780929, 0.2142227, -2.408577, 1, 1, 1, 1, 1,
-0.7791846, 1.432377, -0.5014771, 1, 1, 1, 1, 1,
-0.776625, -2.761889, -2.165815, 1, 1, 1, 1, 1,
-0.774761, -1.097975, -3.701922, 1, 1, 1, 1, 1,
-0.7731709, 1.262696, -1.209383, 1, 1, 1, 1, 1,
-0.7725545, 0.4840741, 0.6752945, 1, 1, 1, 1, 1,
-0.7717906, -0.3215612, -1.400445, 1, 1, 1, 1, 1,
-0.7716947, -0.1556803, -2.084287, 1, 1, 1, 1, 1,
-0.7694334, 0.8288617, -2.038053, 1, 1, 1, 1, 1,
-0.7668228, 0.6505949, -1.234467, 1, 1, 1, 1, 1,
-0.7604434, 1.106848, -0.2791216, 1, 1, 1, 1, 1,
-0.7594562, 1.568611, 0.01243221, 1, 1, 1, 1, 1,
-0.7486041, 0.007420696, -0.2154895, 1, 1, 1, 1, 1,
-0.7438948, 0.6728482, -2.410818, 1, 1, 1, 1, 1,
-0.7436695, 0.2886371, -0.1757406, 1, 1, 1, 1, 1,
-0.7433157, 1.080377, -1.147691, 0, 0, 1, 1, 1,
-0.7428016, 0.006133945, 0.0352486, 1, 0, 0, 1, 1,
-0.7384837, 0.9988189, -1.196586, 1, 0, 0, 1, 1,
-0.7357593, -0.02920771, -1.545041, 1, 0, 0, 1, 1,
-0.7329662, -0.5244937, -2.671608, 1, 0, 0, 1, 1,
-0.7310491, -1.977448, -2.444141, 1, 0, 0, 1, 1,
-0.7289053, 0.1979091, -1.455056, 0, 0, 0, 1, 1,
-0.7286752, 0.02780619, 0.3362713, 0, 0, 0, 1, 1,
-0.7268798, -1.272115, -1.346473, 0, 0, 0, 1, 1,
-0.7204475, 0.3486811, -3.025099, 0, 0, 0, 1, 1,
-0.7195695, 1.14806, -0.8429275, 0, 0, 0, 1, 1,
-0.7169179, -1.336958, -4.700646, 0, 0, 0, 1, 1,
-0.7132472, 0.5938082, -1.082533, 0, 0, 0, 1, 1,
-0.7106829, -0.3815013, -1.758866, 1, 1, 1, 1, 1,
-0.6931095, 0.09302666, -1.283105, 1, 1, 1, 1, 1,
-0.689109, 0.04112979, -2.805604, 1, 1, 1, 1, 1,
-0.6856677, -2.078043, -2.851484, 1, 1, 1, 1, 1,
-0.6779742, -1.673245, -4.043459, 1, 1, 1, 1, 1,
-0.6774145, 0.5119955, -2.283719, 1, 1, 1, 1, 1,
-0.6761539, 0.0527362, -1.333098, 1, 1, 1, 1, 1,
-0.6751853, 0.1233036, -1.218034, 1, 1, 1, 1, 1,
-0.6693972, 0.3198323, -2.155904, 1, 1, 1, 1, 1,
-0.6679249, -0.9277146, -3.361267, 1, 1, 1, 1, 1,
-0.667101, 0.5015455, -1.522952, 1, 1, 1, 1, 1,
-0.6633, 1.012828, -1.320359, 1, 1, 1, 1, 1,
-0.6623363, -0.502211, -0.9767922, 1, 1, 1, 1, 1,
-0.6618358, -1.19107, -2.466923, 1, 1, 1, 1, 1,
-0.6578008, 0.3712213, -1.579074, 1, 1, 1, 1, 1,
-0.6577569, 0.1835841, -2.174143, 0, 0, 1, 1, 1,
-0.6571023, 0.6477901, -0.4274322, 1, 0, 0, 1, 1,
-0.6568648, 0.4031565, -0.51796, 1, 0, 0, 1, 1,
-0.6529861, 0.2435375, 0.288173, 1, 0, 0, 1, 1,
-0.6513426, -0.714506, -3.07217, 1, 0, 0, 1, 1,
-0.6434025, 0.2306326, -1.917294, 1, 0, 0, 1, 1,
-0.6372464, 1.113916, -1.39716, 0, 0, 0, 1, 1,
-0.6340806, -0.7329854, -1.774884, 0, 0, 0, 1, 1,
-0.6287101, -1.345634, -1.958252, 0, 0, 0, 1, 1,
-0.6277261, -1.988968, -0.7689672, 0, 0, 0, 1, 1,
-0.6240756, 0.3508016, -2.407386, 0, 0, 0, 1, 1,
-0.6230893, -0.4799258, -2.854795, 0, 0, 0, 1, 1,
-0.6212091, 0.1478709, -1.267183, 0, 0, 0, 1, 1,
-0.6209087, -1.093574, -2.837769, 1, 1, 1, 1, 1,
-0.6208708, 0.5393142, -1.258282, 1, 1, 1, 1, 1,
-0.6167853, 1.062784, -1.735732, 1, 1, 1, 1, 1,
-0.6163861, -0.2392245, -1.440578, 1, 1, 1, 1, 1,
-0.6159651, -1.146382, 0.1466626, 1, 1, 1, 1, 1,
-0.6133011, 1.901728, -2.030805, 1, 1, 1, 1, 1,
-0.6124541, 1.177586, -0.6404635, 1, 1, 1, 1, 1,
-0.6120047, -1.207184, -2.877815, 1, 1, 1, 1, 1,
-0.6100963, 0.04497923, -1.631024, 1, 1, 1, 1, 1,
-0.6088504, 1.09772, -1.574054, 1, 1, 1, 1, 1,
-0.6076384, -0.166514, -3.211215, 1, 1, 1, 1, 1,
-0.605639, 0.2064646, -1.055528, 1, 1, 1, 1, 1,
-0.6045931, -0.1299414, -1.093512, 1, 1, 1, 1, 1,
-0.6040844, 1.475606, 1.397361, 1, 1, 1, 1, 1,
-0.6005735, -0.4270118, -1.051087, 1, 1, 1, 1, 1,
-0.5994148, -0.5683197, -1.100008, 0, 0, 1, 1, 1,
-0.5953368, 1.102878, 0.5560045, 1, 0, 0, 1, 1,
-0.5920824, -1.329147, -1.290923, 1, 0, 0, 1, 1,
-0.5898656, 0.2843748, 0.2757719, 1, 0, 0, 1, 1,
-0.5872014, -1.718677, -2.422407, 1, 0, 0, 1, 1,
-0.5852701, 0.3747605, 1.965987, 1, 0, 0, 1, 1,
-0.5851475, 1.4603, 0.2101143, 0, 0, 0, 1, 1,
-0.5789327, 0.6869547, -0.2945117, 0, 0, 0, 1, 1,
-0.5782956, 0.9462777, -2.406671, 0, 0, 0, 1, 1,
-0.5771645, -0.8608283, -2.619061, 0, 0, 0, 1, 1,
-0.5760195, -1.25958, -0.5206397, 0, 0, 0, 1, 1,
-0.5759603, -0.198242, -0.6484081, 0, 0, 0, 1, 1,
-0.5754509, 2.374009, -0.6163669, 0, 0, 0, 1, 1,
-0.57291, 0.2514154, -1.870836, 1, 1, 1, 1, 1,
-0.572606, 1.583482, 0.3531338, 1, 1, 1, 1, 1,
-0.5722276, -0.7785772, -1.367794, 1, 1, 1, 1, 1,
-0.5701801, -0.7821407, -1.53376, 1, 1, 1, 1, 1,
-0.5682126, 1.420006, -0.9482474, 1, 1, 1, 1, 1,
-0.566672, -0.4044533, -2.324805, 1, 1, 1, 1, 1,
-0.5613832, -0.1480462, -3.167351, 1, 1, 1, 1, 1,
-0.5599789, 0.5125684, -1.197761, 1, 1, 1, 1, 1,
-0.5544336, 0.9459376, 0.7103692, 1, 1, 1, 1, 1,
-0.546716, -0.4890155, -2.512357, 1, 1, 1, 1, 1,
-0.5447591, 1.274448, -1.146575, 1, 1, 1, 1, 1,
-0.5428618, 1.071501, -0.3777846, 1, 1, 1, 1, 1,
-0.5424515, 1.121258, -1.61881, 1, 1, 1, 1, 1,
-0.5298507, -0.5108449, -1.640834, 1, 1, 1, 1, 1,
-0.5290209, 0.561369, 1.509685, 1, 1, 1, 1, 1,
-0.5270854, -2.162377, -3.254406, 0, 0, 1, 1, 1,
-0.5246414, -1.973456, -3.441425, 1, 0, 0, 1, 1,
-0.5223814, -2.099589, -4.740931, 1, 0, 0, 1, 1,
-0.5164481, 0.2740987, -1.856862, 1, 0, 0, 1, 1,
-0.5155805, 0.5422508, 0.08627488, 1, 0, 0, 1, 1,
-0.513833, -0.1298658, -0.7232157, 1, 0, 0, 1, 1,
-0.5118967, 0.8372964, -1.454039, 0, 0, 0, 1, 1,
-0.5097561, -0.7004541, -3.373941, 0, 0, 0, 1, 1,
-0.5067974, -0.1332655, -2.112237, 0, 0, 0, 1, 1,
-0.50247, 1.848478, -1.897802, 0, 0, 0, 1, 1,
-0.4994214, 1.367191, -1.38555, 0, 0, 0, 1, 1,
-0.4983034, 0.5567574, -0.4360892, 0, 0, 0, 1, 1,
-0.4979585, 0.6522434, -2.536432, 0, 0, 0, 1, 1,
-0.4973957, 0.952485, 0.2495959, 1, 1, 1, 1, 1,
-0.4966623, 0.6639331, -0.5209318, 1, 1, 1, 1, 1,
-0.4923651, -2.643431, -3.076325, 1, 1, 1, 1, 1,
-0.4910827, -1.196163, -4.499998, 1, 1, 1, 1, 1,
-0.4907748, -1.384137, -3.672333, 1, 1, 1, 1, 1,
-0.4844057, 0.7598125, -0.6627691, 1, 1, 1, 1, 1,
-0.4732812, 2.191019, -1.816898, 1, 1, 1, 1, 1,
-0.4696673, -0.07895599, -0.9306406, 1, 1, 1, 1, 1,
-0.4689462, -0.9152178, -3.640871, 1, 1, 1, 1, 1,
-0.4655098, -0.9524658, -2.675762, 1, 1, 1, 1, 1,
-0.4625728, -0.260075, -2.289817, 1, 1, 1, 1, 1,
-0.4592688, 0.3192287, -1.838045, 1, 1, 1, 1, 1,
-0.4555626, -2.239369, -3.087648, 1, 1, 1, 1, 1,
-0.4494421, -0.1590131, -2.791515, 1, 1, 1, 1, 1,
-0.4481049, 1.075583, 0.3794161, 1, 1, 1, 1, 1,
-0.4469491, -1.197224, -3.222548, 0, 0, 1, 1, 1,
-0.4339269, -2.721909, -2.704957, 1, 0, 0, 1, 1,
-0.4314064, -1.03907, -1.881688, 1, 0, 0, 1, 1,
-0.428941, 3.515353, 0.3750617, 1, 0, 0, 1, 1,
-0.4279064, -0.01989718, -1.624206, 1, 0, 0, 1, 1,
-0.4255669, 0.2038895, -0.3416066, 1, 0, 0, 1, 1,
-0.4214371, 0.9420055, 0.1820168, 0, 0, 0, 1, 1,
-0.4187274, -1.561646, -2.99344, 0, 0, 0, 1, 1,
-0.4116899, 0.09323922, -1.327144, 0, 0, 0, 1, 1,
-0.4116512, -0.9362471, -2.841401, 0, 0, 0, 1, 1,
-0.4084865, -1.064397, -3.238302, 0, 0, 0, 1, 1,
-0.4012269, -1.030351, -2.123495, 0, 0, 0, 1, 1,
-0.3992983, 0.558481, -0.9217299, 0, 0, 0, 1, 1,
-0.3979406, -1.238767, -3.120231, 1, 1, 1, 1, 1,
-0.3933728, 0.7483028, -0.1938919, 1, 1, 1, 1, 1,
-0.3899091, -0.7319241, -1.800925, 1, 1, 1, 1, 1,
-0.3897575, 1.578846, -1.626385, 1, 1, 1, 1, 1,
-0.388859, 0.8150179, -1.740017, 1, 1, 1, 1, 1,
-0.3860774, -0.09842356, -2.567796, 1, 1, 1, 1, 1,
-0.3852076, -0.6061516, -4.236379, 1, 1, 1, 1, 1,
-0.3851112, 1.294046, -1.593503, 1, 1, 1, 1, 1,
-0.3836865, -1.482305, -2.56639, 1, 1, 1, 1, 1,
-0.3832623, -0.2532168, -0.1413315, 1, 1, 1, 1, 1,
-0.3829225, -0.4041186, -2.881086, 1, 1, 1, 1, 1,
-0.3805502, 1.679571, 0.4474488, 1, 1, 1, 1, 1,
-0.3792236, -0.2590644, -2.961075, 1, 1, 1, 1, 1,
-0.3767712, -0.3284994, -2.840996, 1, 1, 1, 1, 1,
-0.3763319, 1.443995, -0.1918597, 1, 1, 1, 1, 1,
-0.3680873, 0.1757179, -0.9444623, 0, 0, 1, 1, 1,
-0.367492, -0.1853811, -3.579068, 1, 0, 0, 1, 1,
-0.3634409, 1.617529, -0.5532362, 1, 0, 0, 1, 1,
-0.359102, 0.4894214, -1.040004, 1, 0, 0, 1, 1,
-0.3581797, 0.3734421, -2.508959, 1, 0, 0, 1, 1,
-0.3576307, 0.8286261, -1.428092, 1, 0, 0, 1, 1,
-0.3481387, -0.0703803, -1.602869, 0, 0, 0, 1, 1,
-0.3443685, -0.8997228, -2.122597, 0, 0, 0, 1, 1,
-0.3433262, -0.6386114, -0.3325064, 0, 0, 0, 1, 1,
-0.3422281, -0.1262949, -1.507215, 0, 0, 0, 1, 1,
-0.3355426, 0.4015797, 1.795388, 0, 0, 0, 1, 1,
-0.3338694, 0.06491806, -0.8622055, 0, 0, 0, 1, 1,
-0.3305006, 0.4986425, 0.1616592, 0, 0, 0, 1, 1,
-0.3241173, 1.07202, -0.0947245, 1, 1, 1, 1, 1,
-0.3224032, 0.03929998, 0.269523, 1, 1, 1, 1, 1,
-0.3175455, -0.2199801, -3.594805, 1, 1, 1, 1, 1,
-0.316206, -1.054444, -2.451041, 1, 1, 1, 1, 1,
-0.31378, -0.07911387, -1.591008, 1, 1, 1, 1, 1,
-0.3123342, 0.6578115, -0.2605395, 1, 1, 1, 1, 1,
-0.3087019, 0.04957139, -2.169128, 1, 1, 1, 1, 1,
-0.3065264, -0.1844804, -3.562548, 1, 1, 1, 1, 1,
-0.3061902, -1.101835, -3.860421, 1, 1, 1, 1, 1,
-0.3044677, 0.2698304, -1.794969, 1, 1, 1, 1, 1,
-0.3012761, 1.044104, 1.155736, 1, 1, 1, 1, 1,
-0.3007081, -1.794226, -4.649846, 1, 1, 1, 1, 1,
-0.3002985, 0.04718593, -1.827547, 1, 1, 1, 1, 1,
-0.2954212, 1.08136, -0.3718339, 1, 1, 1, 1, 1,
-0.2917875, 0.4528498, 0.1155313, 1, 1, 1, 1, 1,
-0.2907483, 0.2145418, 0.3667476, 0, 0, 1, 1, 1,
-0.2882017, -0.377447, -2.891254, 1, 0, 0, 1, 1,
-0.287637, 2.160342, 0.9890776, 1, 0, 0, 1, 1,
-0.2859922, 0.6217644, -0.2098918, 1, 0, 0, 1, 1,
-0.2849832, -0.250154, -3.51458, 1, 0, 0, 1, 1,
-0.2839137, 0.3341092, 0.003601644, 1, 0, 0, 1, 1,
-0.2835702, 0.5316514, -0.0840233, 0, 0, 0, 1, 1,
-0.2826451, -0.0814735, -3.060338, 0, 0, 0, 1, 1,
-0.2813745, 0.6183617, -1.832903, 0, 0, 0, 1, 1,
-0.2811548, -0.5701465, -3.430065, 0, 0, 0, 1, 1,
-0.2810189, 0.6237393, -0.2812481, 0, 0, 0, 1, 1,
-0.2805315, -2.377933, -3.140622, 0, 0, 0, 1, 1,
-0.2708272, 0.8535829, -0.8565105, 0, 0, 0, 1, 1,
-0.2700088, 0.5495409, -0.6330538, 1, 1, 1, 1, 1,
-0.2693266, -1.579648, -2.950973, 1, 1, 1, 1, 1,
-0.2686042, 0.8827828, -0.654663, 1, 1, 1, 1, 1,
-0.2649375, -0.05320952, -2.560483, 1, 1, 1, 1, 1,
-0.2616318, -0.3256743, -2.787366, 1, 1, 1, 1, 1,
-0.2614914, 0.4242316, 0.4950551, 1, 1, 1, 1, 1,
-0.2605705, -1.897297, -0.5566062, 1, 1, 1, 1, 1,
-0.2604961, -0.03886921, -1.335129, 1, 1, 1, 1, 1,
-0.2540712, -0.3067877, -2.833298, 1, 1, 1, 1, 1,
-0.2538147, 2.046776, 0.8637278, 1, 1, 1, 1, 1,
-0.2536887, -0.973636, -3.941411, 1, 1, 1, 1, 1,
-0.2519029, -0.8987572, -5.167109, 1, 1, 1, 1, 1,
-0.2512841, -3.104644, -3.628592, 1, 1, 1, 1, 1,
-0.2483921, -0.6886586, -3.860532, 1, 1, 1, 1, 1,
-0.2436635, 0.1752148, -1.649414, 1, 1, 1, 1, 1,
-0.2412182, 0.3633197, -1.282992, 0, 0, 1, 1, 1,
-0.240859, 1.033681, 0.4950252, 1, 0, 0, 1, 1,
-0.2387293, -0.2381645, -1.339881, 1, 0, 0, 1, 1,
-0.2375516, 0.3044752, 0.3745934, 1, 0, 0, 1, 1,
-0.2352621, -0.4431537, -2.110221, 1, 0, 0, 1, 1,
-0.2320445, -1.235563, -3.274402, 1, 0, 0, 1, 1,
-0.2263688, 0.2534583, -1.788825, 0, 0, 0, 1, 1,
-0.2262065, -0.1554456, -2.857271, 0, 0, 0, 1, 1,
-0.2247386, 1.203259, -1.865267, 0, 0, 0, 1, 1,
-0.2235156, -0.6648545, -2.514739, 0, 0, 0, 1, 1,
-0.2210942, -0.8388256, -0.68411, 0, 0, 0, 1, 1,
-0.2101921, 0.6007038, 0.2110015, 0, 0, 0, 1, 1,
-0.2098355, 1.073151, 0.3207786, 0, 0, 0, 1, 1,
-0.2052376, -0.3947732, -2.763826, 1, 1, 1, 1, 1,
-0.2046459, -1.70529, -2.255583, 1, 1, 1, 1, 1,
-0.2019715, 0.677543, 0.980998, 1, 1, 1, 1, 1,
-0.2013682, -1.292489, -3.549522, 1, 1, 1, 1, 1,
-0.201138, -0.9614593, -3.581442, 1, 1, 1, 1, 1,
-0.1990134, -1.596274, -3.809804, 1, 1, 1, 1, 1,
-0.1964578, 0.6091474, -1.789034, 1, 1, 1, 1, 1,
-0.1931854, -0.1050667, -2.034229, 1, 1, 1, 1, 1,
-0.1921931, 0.1367143, -0.7974422, 1, 1, 1, 1, 1,
-0.1908257, 0.560022, -0.8710579, 1, 1, 1, 1, 1,
-0.1897061, 1.10564, 0.6109876, 1, 1, 1, 1, 1,
-0.1896261, -0.4752969, -2.666166, 1, 1, 1, 1, 1,
-0.187957, 0.2206666, -2.388568, 1, 1, 1, 1, 1,
-0.1867366, 1.444002, 1.756156, 1, 1, 1, 1, 1,
-0.1842956, -0.05299973, -4.243935, 1, 1, 1, 1, 1,
-0.183019, -0.6166719, -3.276176, 0, 0, 1, 1, 1,
-0.1822236, -0.07999617, -1.671596, 1, 0, 0, 1, 1,
-0.1776093, 0.4069598, 1.075795, 1, 0, 0, 1, 1,
-0.1707933, -0.7683777, -3.189063, 1, 0, 0, 1, 1,
-0.170097, -1.126629, -3.700456, 1, 0, 0, 1, 1,
-0.1694768, -0.1882068, -2.7947, 1, 0, 0, 1, 1,
-0.168419, 0.5431617, -1.279588, 0, 0, 0, 1, 1,
-0.1654022, -0.2047559, -2.218241, 0, 0, 0, 1, 1,
-0.1647748, -0.5924157, -3.428612, 0, 0, 0, 1, 1,
-0.1618861, 0.1844296, 0.4230821, 0, 0, 0, 1, 1,
-0.1524764, -0.0801919, -1.514088, 0, 0, 0, 1, 1,
-0.1500479, 0.02222219, -0.4750856, 0, 0, 0, 1, 1,
-0.1448056, 0.1472697, -1.172047, 0, 0, 0, 1, 1,
-0.1427509, -0.876407, -3.910731, 1, 1, 1, 1, 1,
-0.1422069, 1.460509, -0.5670525, 1, 1, 1, 1, 1,
-0.1401374, 1.44044, 0.7984396, 1, 1, 1, 1, 1,
-0.1397849, -0.3771725, -2.221068, 1, 1, 1, 1, 1,
-0.1385501, -1.119008, -5.549243, 1, 1, 1, 1, 1,
-0.133901, -1.380074, -2.718657, 1, 1, 1, 1, 1,
-0.1311578, -0.1515958, -1.780817, 1, 1, 1, 1, 1,
-0.1253757, 0.5600461, 0.4472195, 1, 1, 1, 1, 1,
-0.1218016, -0.4442847, -2.991182, 1, 1, 1, 1, 1,
-0.1207045, -2.112545, -1.516756, 1, 1, 1, 1, 1,
-0.1195722, -1.965602, -1.341309, 1, 1, 1, 1, 1,
-0.1172224, 0.2219019, 1.886428, 1, 1, 1, 1, 1,
-0.113911, -0.2877216, -3.934032, 1, 1, 1, 1, 1,
-0.1106825, 0.2600492, -1.266824, 1, 1, 1, 1, 1,
-0.1101385, -2.100487, -3.003011, 1, 1, 1, 1, 1,
-0.1023924, -0.1999754, -4.169007, 0, 0, 1, 1, 1,
-0.1005773, -0.6861484, -2.94241, 1, 0, 0, 1, 1,
-0.09940398, 1.141416, 0.1052192, 1, 0, 0, 1, 1,
-0.0979136, -0.2075809, -3.180838, 1, 0, 0, 1, 1,
-0.09648225, -0.7684487, -2.390281, 1, 0, 0, 1, 1,
-0.09525098, -1.388882, -3.314587, 1, 0, 0, 1, 1,
-0.09419036, 0.6295944, -0.007732516, 0, 0, 0, 1, 1,
-0.09392694, 0.9308606, -0.3124535, 0, 0, 0, 1, 1,
-0.09051763, -0.6054205, -1.194701, 0, 0, 0, 1, 1,
-0.08838088, -1.368078, -3.511217, 0, 0, 0, 1, 1,
-0.08801123, -0.07527637, -0.3825587, 0, 0, 0, 1, 1,
-0.08570128, 0.5100181, -0.8139185, 0, 0, 0, 1, 1,
-0.07583106, 0.2826216, -1.658696, 0, 0, 0, 1, 1,
-0.07037523, 0.4054198, -0.3862197, 1, 1, 1, 1, 1,
-0.06814095, 0.6280844, 1.154714, 1, 1, 1, 1, 1,
-0.06705135, 1.063365, -0.5839604, 1, 1, 1, 1, 1,
-0.06553715, -0.3331275, -3.138508, 1, 1, 1, 1, 1,
-0.05607937, -0.5852575, -2.616613, 1, 1, 1, 1, 1,
-0.05528812, -0.2790492, -3.133268, 1, 1, 1, 1, 1,
-0.05230204, 0.1407705, 0.05829004, 1, 1, 1, 1, 1,
-0.05046375, -0.1968866, -4.078767, 1, 1, 1, 1, 1,
-0.04842814, 0.8537109, -0.7921991, 1, 1, 1, 1, 1,
-0.04751004, -0.5830468, -3.140158, 1, 1, 1, 1, 1,
-0.04445507, 0.3362505, -0.3596916, 1, 1, 1, 1, 1,
-0.03495544, -2.485115, -3.871086, 1, 1, 1, 1, 1,
-0.02839262, -0.3577283, -3.154342, 1, 1, 1, 1, 1,
-0.02834484, -0.4146583, -4.296969, 1, 1, 1, 1, 1,
-0.02332068, -0.8869739, -3.850157, 1, 1, 1, 1, 1,
-0.02205256, -0.003145024, -3.385164, 0, 0, 1, 1, 1,
-0.01568089, -1.143366, -1.960138, 1, 0, 0, 1, 1,
-0.008082327, -1.374307, -3.138763, 1, 0, 0, 1, 1,
-0.007643483, 1.975299, -0.2240731, 1, 0, 0, 1, 1,
-0.006914572, -0.3543386, -3.783357, 1, 0, 0, 1, 1,
-0.006904829, -0.1870695, -2.742205, 1, 0, 0, 1, 1,
-0.00558704, 0.9730934, 0.9960172, 0, 0, 0, 1, 1,
-0.005111084, -0.673944, -3.651634, 0, 0, 0, 1, 1,
-0.004052711, -0.03779492, -2.683658, 0, 0, 0, 1, 1,
-0.003052909, -2.635995, -3.243117, 0, 0, 0, 1, 1,
0.005404548, 0.9134965, 0.7796022, 0, 0, 0, 1, 1,
0.008661007, -0.8435665, 3.861967, 0, 0, 0, 1, 1,
0.01044613, -1.781053, 4.267979, 0, 0, 0, 1, 1,
0.01136014, -0.6772637, 2.620649, 1, 1, 1, 1, 1,
0.0114144, -1.022522, 2.214898, 1, 1, 1, 1, 1,
0.01226701, 2.96858, -0.9904579, 1, 1, 1, 1, 1,
0.0139732, -0.713901, 2.624525, 1, 1, 1, 1, 1,
0.01424909, 0.5228293, -0.9064761, 1, 1, 1, 1, 1,
0.0150161, 0.5293311, 0.3920037, 1, 1, 1, 1, 1,
0.01563427, 0.7149268, 1.691702, 1, 1, 1, 1, 1,
0.01816141, 1.15461, -0.1051346, 1, 1, 1, 1, 1,
0.02407547, 1.334278, 0.1814312, 1, 1, 1, 1, 1,
0.02584866, -0.4937962, 3.11419, 1, 1, 1, 1, 1,
0.02624249, -1.396889, 4.521792, 1, 1, 1, 1, 1,
0.02626982, -0.3139518, 0.881034, 1, 1, 1, 1, 1,
0.02771954, 1.191087, -0.08950043, 1, 1, 1, 1, 1,
0.0289388, -0.787796, 4.316892, 1, 1, 1, 1, 1,
0.02926885, 1.103953, -0.2800687, 1, 1, 1, 1, 1,
0.03326067, 0.8442415, 1.646761, 0, 0, 1, 1, 1,
0.03609161, 0.2587576, 0.2691021, 1, 0, 0, 1, 1,
0.03624041, 0.4601611, -0.05682031, 1, 0, 0, 1, 1,
0.0384833, 2.107472, -0.6992961, 1, 0, 0, 1, 1,
0.03860249, -0.1466177, 1.817996, 1, 0, 0, 1, 1,
0.04088772, -0.4138147, 1.694761, 1, 0, 0, 1, 1,
0.04574959, -0.4789818, 2.626836, 0, 0, 0, 1, 1,
0.04692737, 1.386188, -0.119459, 0, 0, 0, 1, 1,
0.0483852, 3.028084, 1.791758, 0, 0, 0, 1, 1,
0.05061501, -2.600807, 2.812192, 0, 0, 0, 1, 1,
0.05084448, -0.5928496, 4.125033, 0, 0, 0, 1, 1,
0.05272861, -1.591946, 3.710476, 0, 0, 0, 1, 1,
0.05750915, 1.458537, -1.51147, 0, 0, 0, 1, 1,
0.0581605, -0.4503041, 3.115664, 1, 1, 1, 1, 1,
0.05978612, -0.4298421, 3.797305, 1, 1, 1, 1, 1,
0.06020269, -0.6134946, 4.003931, 1, 1, 1, 1, 1,
0.0631948, 1.066449, -0.5955971, 1, 1, 1, 1, 1,
0.06695063, 1.248984, 0.02566109, 1, 1, 1, 1, 1,
0.07555176, -0.1580476, 4.238744, 1, 1, 1, 1, 1,
0.0763452, -0.1432884, 3.173489, 1, 1, 1, 1, 1,
0.07827386, -3.265527, 2.6061, 1, 1, 1, 1, 1,
0.09095762, 0.1877402, -0.2499213, 1, 1, 1, 1, 1,
0.09362943, 0.7552825, -1.476102, 1, 1, 1, 1, 1,
0.09435029, -1.563944, 3.109031, 1, 1, 1, 1, 1,
0.0944381, 0.8113344, -0.3740359, 1, 1, 1, 1, 1,
0.09819797, 0.0791902, 1.392798, 1, 1, 1, 1, 1,
0.09889104, 1.179746, 1.645649, 1, 1, 1, 1, 1,
0.1011965, -1.465962, 3.527639, 1, 1, 1, 1, 1,
0.1031892, -0.3460657, 2.528044, 0, 0, 1, 1, 1,
0.1088404, -0.3352319, 3.918391, 1, 0, 0, 1, 1,
0.1104819, -1.297255, 3.282242, 1, 0, 0, 1, 1,
0.1109304, -1.16118, 0.9596547, 1, 0, 0, 1, 1,
0.1116439, -0.4517054, 2.419311, 1, 0, 0, 1, 1,
0.1129786, 1.368976, 0.4602377, 1, 0, 0, 1, 1,
0.1140313, -0.7364148, 3.272956, 0, 0, 0, 1, 1,
0.1155522, 0.2557185, -0.4106523, 0, 0, 0, 1, 1,
0.1160955, -0.7044255, 4.414322, 0, 0, 0, 1, 1,
0.119061, -0.1167257, 1.182644, 0, 0, 0, 1, 1,
0.1241558, 0.6172171, -1.578575, 0, 0, 0, 1, 1,
0.1290924, 1.198689, -0.5098871, 0, 0, 0, 1, 1,
0.1297494, -0.2950791, 3.111494, 0, 0, 0, 1, 1,
0.1300847, 2.184612, 0.8462982, 1, 1, 1, 1, 1,
0.1310976, -0.9140173, 4.314747, 1, 1, 1, 1, 1,
0.1469761, 0.2879975, -0.5229568, 1, 1, 1, 1, 1,
0.15162, 1.285399, -1.293848, 1, 1, 1, 1, 1,
0.1517733, 0.5781233, 0.03790131, 1, 1, 1, 1, 1,
0.1530803, 0.4962335, 0.1702104, 1, 1, 1, 1, 1,
0.1534459, 0.1597594, 2.018316, 1, 1, 1, 1, 1,
0.1561948, 1.564823, -1.356582, 1, 1, 1, 1, 1,
0.1584675, 1.374056, 0.1211474, 1, 1, 1, 1, 1,
0.1616567, 0.5667828, 0.2634136, 1, 1, 1, 1, 1,
0.1634159, 0.8278291, 1.745149, 1, 1, 1, 1, 1,
0.1645792, -1.26359, 5.161034, 1, 1, 1, 1, 1,
0.167705, 0.7683843, -0.2344491, 1, 1, 1, 1, 1,
0.1701704, -0.9150075, 2.72187, 1, 1, 1, 1, 1,
0.1719439, 0.7217122, 0.4978466, 1, 1, 1, 1, 1,
0.1725001, 1.434671, -0.009193571, 0, 0, 1, 1, 1,
0.1737178, -0.2191053, 3.669786, 1, 0, 0, 1, 1,
0.1753592, -0.8360949, 4.2143, 1, 0, 0, 1, 1,
0.1780867, 0.05684158, -0.3576907, 1, 0, 0, 1, 1,
0.1785018, 0.266546, 1.56927, 1, 0, 0, 1, 1,
0.1808779, 1.282994, 4.303161, 1, 0, 0, 1, 1,
0.1878799, -0.9691453, 3.713703, 0, 0, 0, 1, 1,
0.1923687, 1.119624, 0.6873029, 0, 0, 0, 1, 1,
0.1967807, 0.5351378, 2.073157, 0, 0, 0, 1, 1,
0.1979513, 1.582478, 0.1842353, 0, 0, 0, 1, 1,
0.1984972, -0.07029548, 4.241065, 0, 0, 0, 1, 1,
0.2027355, -0.2046528, 2.222372, 0, 0, 0, 1, 1,
0.204541, -0.4581038, 2.160794, 0, 0, 0, 1, 1,
0.2048608, -1.072193, 2.983126, 1, 1, 1, 1, 1,
0.2053352, -0.5866919, 1.665181, 1, 1, 1, 1, 1,
0.2057509, 0.3656525, -0.7465979, 1, 1, 1, 1, 1,
0.2101433, -0.06693184, 3.015547, 1, 1, 1, 1, 1,
0.2149645, -0.1317535, 2.090786, 1, 1, 1, 1, 1,
0.2158594, -0.8433829, 2.805684, 1, 1, 1, 1, 1,
0.2203021, -0.6397547, 3.156113, 1, 1, 1, 1, 1,
0.2215621, 1.835539, -0.03747439, 1, 1, 1, 1, 1,
0.22771, -0.1414794, -0.1407709, 1, 1, 1, 1, 1,
0.2292563, 0.2218498, 2.317274, 1, 1, 1, 1, 1,
0.230074, 1.784354, 0.3635425, 1, 1, 1, 1, 1,
0.2305846, 0.7980822, -1.07248, 1, 1, 1, 1, 1,
0.2394869, -0.8302815, 3.301881, 1, 1, 1, 1, 1,
0.2419386, -1.712614, 2.769282, 1, 1, 1, 1, 1,
0.2423262, 0.5441321, -0.4450395, 1, 1, 1, 1, 1,
0.2444053, 0.3229215, -1.06528, 0, 0, 1, 1, 1,
0.247186, -0.592887, 1.493804, 1, 0, 0, 1, 1,
0.250565, -0.763195, 3.423596, 1, 0, 0, 1, 1,
0.2514225, 0.3768438, 1.813788, 1, 0, 0, 1, 1,
0.2529221, -0.3997278, 1.903378, 1, 0, 0, 1, 1,
0.2576221, -1.294554, 4.638432, 1, 0, 0, 1, 1,
0.2581146, 1.15108, -0.1026407, 0, 0, 0, 1, 1,
0.2592181, 1.003968, -0.4969865, 0, 0, 0, 1, 1,
0.2673952, 0.4058611, 0.05912448, 0, 0, 0, 1, 1,
0.272826, -0.4627517, 3.592279, 0, 0, 0, 1, 1,
0.2748617, 1.293525, 2.120173, 0, 0, 0, 1, 1,
0.2780136, -0.7473224, 0.762899, 0, 0, 0, 1, 1,
0.2813101, 0.06533516, 1.757618, 0, 0, 0, 1, 1,
0.2860415, 1.51651, 0.8379322, 1, 1, 1, 1, 1,
0.287795, 1.47323, 0.03192914, 1, 1, 1, 1, 1,
0.2937017, 0.3003142, 1.054852, 1, 1, 1, 1, 1,
0.3069344, 0.2482407, 0.7752382, 1, 1, 1, 1, 1,
0.3103363, -0.8348362, 2.968181, 1, 1, 1, 1, 1,
0.3151654, -0.7971727, 3.158144, 1, 1, 1, 1, 1,
0.315342, -0.5742222, 2.606816, 1, 1, 1, 1, 1,
0.3172879, 0.2459542, 0.2513286, 1, 1, 1, 1, 1,
0.319086, -0.2922532, 3.250413, 1, 1, 1, 1, 1,
0.3247601, 0.09474725, 1.077697, 1, 1, 1, 1, 1,
0.3284133, -0.2018581, 0.4048719, 1, 1, 1, 1, 1,
0.3288203, -0.3930097, 1.338634, 1, 1, 1, 1, 1,
0.3308809, 0.7285889, -0.4431399, 1, 1, 1, 1, 1,
0.3331095, -0.6023442, 2.072433, 1, 1, 1, 1, 1,
0.3337861, 1.841037, 1.973413, 1, 1, 1, 1, 1,
0.3340053, -0.5867115, 2.32675, 0, 0, 1, 1, 1,
0.3365975, 0.1798705, 1.515314, 1, 0, 0, 1, 1,
0.3397831, -1.375087, 2.58577, 1, 0, 0, 1, 1,
0.3477104, 0.8288878, -0.3766213, 1, 0, 0, 1, 1,
0.3490772, 0.9248053, 0.04870474, 1, 0, 0, 1, 1,
0.352624, 0.3680399, 2.820966, 1, 0, 0, 1, 1,
0.3555626, -1.45343, 2.934057, 0, 0, 0, 1, 1,
0.3571929, 1.298805, 0.9611995, 0, 0, 0, 1, 1,
0.3601544, 1.247528, 0.775401, 0, 0, 0, 1, 1,
0.3617221, -0.3001931, 2.464544, 0, 0, 0, 1, 1,
0.3663626, 1.461934, -0.3376901, 0, 0, 0, 1, 1,
0.3690861, -1.092725, 4.194466, 0, 0, 0, 1, 1,
0.3772255, -0.9901832, 2.762596, 0, 0, 0, 1, 1,
0.3843288, 0.4942115, 1.890004, 1, 1, 1, 1, 1,
0.3898231, 1.134118, -0.4176059, 1, 1, 1, 1, 1,
0.3899544, 1.78201, 0.3636454, 1, 1, 1, 1, 1,
0.3909116, -0.3561852, 3.740485, 1, 1, 1, 1, 1,
0.3917733, 1.197948, -0.8508112, 1, 1, 1, 1, 1,
0.39394, -0.7031746, 1.814412, 1, 1, 1, 1, 1,
0.3957328, -1.242967, 1.967848, 1, 1, 1, 1, 1,
0.3989094, -0.223932, 3.189645, 1, 1, 1, 1, 1,
0.3993529, 0.5777693, 0.1882657, 1, 1, 1, 1, 1,
0.4003896, -2.090731, 3.650106, 1, 1, 1, 1, 1,
0.4035381, -0.05587779, 1.707514, 1, 1, 1, 1, 1,
0.403783, 0.00708364, 1.940626, 1, 1, 1, 1, 1,
0.4042347, -1.199105, 3.038158, 1, 1, 1, 1, 1,
0.4118024, -0.7027218, 1.941466, 1, 1, 1, 1, 1,
0.4152519, 0.5412297, 2.257074, 1, 1, 1, 1, 1,
0.4156279, -0.04501917, 2.486291, 0, 0, 1, 1, 1,
0.4171295, -1.909497, 2.535411, 1, 0, 0, 1, 1,
0.4190182, -0.6614089, 3.51769, 1, 0, 0, 1, 1,
0.4200417, -0.4543863, 2.202968, 1, 0, 0, 1, 1,
0.4237118, -0.961522, 2.468942, 1, 0, 0, 1, 1,
0.4244928, -0.4185432, 0.6479037, 1, 0, 0, 1, 1,
0.4255753, 0.4378794, 2.979916, 0, 0, 0, 1, 1,
0.4266891, 0.6471761, 1.796413, 0, 0, 0, 1, 1,
0.4278061, 0.596882, 0.6743445, 0, 0, 0, 1, 1,
0.4351745, -0.8968183, 2.57342, 0, 0, 0, 1, 1,
0.4382318, -1.07791, 4.154778, 0, 0, 0, 1, 1,
0.4386639, -1.620879, 2.461138, 0, 0, 0, 1, 1,
0.4429912, -0.4702833, 1.480735, 0, 0, 0, 1, 1,
0.4447241, -0.3536644, 2.450547, 1, 1, 1, 1, 1,
0.447281, 0.9586229, 1.889236, 1, 1, 1, 1, 1,
0.4534366, 0.4261842, 0.2267462, 1, 1, 1, 1, 1,
0.4569984, 1.066699, -0.4522198, 1, 1, 1, 1, 1,
0.4574149, -1.190905, 4.491761, 1, 1, 1, 1, 1,
0.457596, 0.07513401, 2.417145, 1, 1, 1, 1, 1,
0.4579561, 0.1920625, 0.6338829, 1, 1, 1, 1, 1,
0.4619862, -0.3958966, 3.071454, 1, 1, 1, 1, 1,
0.4637927, 0.05908657, 0.4523924, 1, 1, 1, 1, 1,
0.466244, -1.608808, 2.307034, 1, 1, 1, 1, 1,
0.4663308, -0.8312901, 2.660618, 1, 1, 1, 1, 1,
0.471875, -0.4068277, 1.031363, 1, 1, 1, 1, 1,
0.4719489, 0.06724727, 2.267215, 1, 1, 1, 1, 1,
0.4731248, -1.037995, 3.163544, 1, 1, 1, 1, 1,
0.4784184, 0.9356223, 0.4352537, 1, 1, 1, 1, 1,
0.4807048, 0.2584143, 1.061814, 0, 0, 1, 1, 1,
0.4860222, 0.5173603, -0.007458835, 1, 0, 0, 1, 1,
0.4875592, -1.890324, 2.111791, 1, 0, 0, 1, 1,
0.4897021, 0.6562793, 1.833057, 1, 0, 0, 1, 1,
0.4904722, -1.605676, -0.824966, 1, 0, 0, 1, 1,
0.4923144, -0.7359995, 1.908843, 1, 0, 0, 1, 1,
0.4923398, 1.406748, -0.4937046, 0, 0, 0, 1, 1,
0.4964219, -0.3438014, 2.413598, 0, 0, 0, 1, 1,
0.5016227, 1.394781, -1.21568, 0, 0, 0, 1, 1,
0.502057, 0.8646476, -0.753629, 0, 0, 0, 1, 1,
0.5047985, 0.6575578, 1.064269, 0, 0, 0, 1, 1,
0.5055911, 1.486811, -1.87201, 0, 0, 0, 1, 1,
0.505725, 0.4947256, 0.444608, 0, 0, 0, 1, 1,
0.5116527, 1.149159, 1.094441, 1, 1, 1, 1, 1,
0.5156042, 1.533127, 0.9030031, 1, 1, 1, 1, 1,
0.520919, 0.9018788, 1.420407, 1, 1, 1, 1, 1,
0.5271809, -2.321851, 1.52868, 1, 1, 1, 1, 1,
0.5285814, -1.322145, 2.225883, 1, 1, 1, 1, 1,
0.5318926, -0.06543534, 2.464797, 1, 1, 1, 1, 1,
0.5324662, 0.4110261, 1.479893, 1, 1, 1, 1, 1,
0.5404295, 1.174255, 0.3597237, 1, 1, 1, 1, 1,
0.5408242, -1.559965, 1.584904, 1, 1, 1, 1, 1,
0.5435145, 1.291932, 0.6476417, 1, 1, 1, 1, 1,
0.5491524, 1.755999, 1.053004, 1, 1, 1, 1, 1,
0.5496141, 1.890854, 0.661383, 1, 1, 1, 1, 1,
0.5579004, 1.546515, 0.3379314, 1, 1, 1, 1, 1,
0.559351, 0.5149474, 0.9984001, 1, 1, 1, 1, 1,
0.5596136, -0.2596166, 3.028744, 1, 1, 1, 1, 1,
0.5607443, -0.3560777, 2.172174, 0, 0, 1, 1, 1,
0.5647478, -0.6642877, 2.286223, 1, 0, 0, 1, 1,
0.566061, 2.189763, 0.0270054, 1, 0, 0, 1, 1,
0.5682543, 0.6508011, 2.937999, 1, 0, 0, 1, 1,
0.5697592, -0.5030457, 2.841929, 1, 0, 0, 1, 1,
0.5743002, 0.05190452, 0.5305896, 1, 0, 0, 1, 1,
0.5780296, 0.5899282, 0.8799008, 0, 0, 0, 1, 1,
0.5801958, -0.1791418, 2.601664, 0, 0, 0, 1, 1,
0.5806147, 1.099646, 1.143359, 0, 0, 0, 1, 1,
0.5824448, 0.1454597, 1.248243, 0, 0, 0, 1, 1,
0.5888367, -0.9827086, 3.446929, 0, 0, 0, 1, 1,
0.5995182, 1.648761, 1.057867, 0, 0, 0, 1, 1,
0.6079341, 0.547102, -0.4989241, 0, 0, 0, 1, 1,
0.6087062, 0.1606885, 1.610031, 1, 1, 1, 1, 1,
0.6199747, -0.3401417, 0.5746728, 1, 1, 1, 1, 1,
0.6236431, -0.3717914, 1.80676, 1, 1, 1, 1, 1,
0.6271328, -0.8923338, 0.732277, 1, 1, 1, 1, 1,
0.6271955, -0.002951342, 1.494038, 1, 1, 1, 1, 1,
0.6279792, -0.4844963, 1.810682, 1, 1, 1, 1, 1,
0.629086, -0.337159, 1.972437, 1, 1, 1, 1, 1,
0.6291224, 1.868135, -0.6278737, 1, 1, 1, 1, 1,
0.6313475, 0.3843523, -1.395485, 1, 1, 1, 1, 1,
0.6326693, 0.06560431, 0.9613647, 1, 1, 1, 1, 1,
0.6327296, 0.9256672, 1.074292, 1, 1, 1, 1, 1,
0.6342519, -0.1464201, 0.2219902, 1, 1, 1, 1, 1,
0.6347272, 0.1271886, 0.6564687, 1, 1, 1, 1, 1,
0.635053, 1.000761, 0.3027583, 1, 1, 1, 1, 1,
0.638754, -0.5716125, 1.665687, 1, 1, 1, 1, 1,
0.638984, -1.702023, 2.975857, 0, 0, 1, 1, 1,
0.6392154, -0.6959487, 1.272469, 1, 0, 0, 1, 1,
0.6396713, 0.3780503, 2.701135, 1, 0, 0, 1, 1,
0.6433869, -0.3099678, 0.9333389, 1, 0, 0, 1, 1,
0.6436638, 0.403331, 0.8718606, 1, 0, 0, 1, 1,
0.6533278, -0.433193, 1.855245, 1, 0, 0, 1, 1,
0.6614613, -0.2674002, 1.685142, 0, 0, 0, 1, 1,
0.6616234, -0.775547, 2.020401, 0, 0, 0, 1, 1,
0.6639574, 0.2744242, 2.998054, 0, 0, 0, 1, 1,
0.6650434, -0.7564816, 1.878443, 0, 0, 0, 1, 1,
0.6687445, 2.09836, 1.195776, 0, 0, 0, 1, 1,
0.6715941, 0.5271482, 0.1739992, 0, 0, 0, 1, 1,
0.6718483, 0.3844366, 2.094072, 0, 0, 0, 1, 1,
0.6774071, -0.3005988, 1.520995, 1, 1, 1, 1, 1,
0.677514, -2.11225, 2.595589, 1, 1, 1, 1, 1,
0.6807185, -0.2380591, 1.563074, 1, 1, 1, 1, 1,
0.6817239, -0.8004131, 3.570843, 1, 1, 1, 1, 1,
0.6874397, -0.6398205, 1.902447, 1, 1, 1, 1, 1,
0.6879764, 0.4540416, 0.409395, 1, 1, 1, 1, 1,
0.6895629, 1.309329, 0.7523898, 1, 1, 1, 1, 1,
0.6957985, 0.5686802, 0.5212183, 1, 1, 1, 1, 1,
0.6976054, 1.112776, 0.315778, 1, 1, 1, 1, 1,
0.7017185, 2.069557, -0.9204427, 1, 1, 1, 1, 1,
0.7020317, 0.6797713, 2.062592, 1, 1, 1, 1, 1,
0.7052363, 0.3584397, 1.068044, 1, 1, 1, 1, 1,
0.7108604, -0.7905369, 1.253073, 1, 1, 1, 1, 1,
0.7112147, 0.441359, 0.4327846, 1, 1, 1, 1, 1,
0.7112978, -1.50475, 2.718438, 1, 1, 1, 1, 1,
0.7206171, -1.631927, 1.937379, 0, 0, 1, 1, 1,
0.7318008, -0.0261409, 2.416893, 1, 0, 0, 1, 1,
0.7320552, 0.1288176, 0.7202101, 1, 0, 0, 1, 1,
0.7353832, 1.006408, 0.9618453, 1, 0, 0, 1, 1,
0.7366933, -1.647729, 3.568409, 1, 0, 0, 1, 1,
0.7373322, -0.1469382, 1.490337, 1, 0, 0, 1, 1,
0.7416173, 0.3280793, 0.01640232, 0, 0, 0, 1, 1,
0.7486196, -0.9121682, 1.948281, 0, 0, 0, 1, 1,
0.7509292, -1.861855, 1.86097, 0, 0, 0, 1, 1,
0.7519765, -0.1927623, 1.401269, 0, 0, 0, 1, 1,
0.7559649, -0.7372603, 1.394729, 0, 0, 0, 1, 1,
0.7586913, 2.527744, -1.824886, 0, 0, 0, 1, 1,
0.7677647, 0.1160015, 1.439229, 0, 0, 0, 1, 1,
0.7813798, -1.049799, 3.448134, 1, 1, 1, 1, 1,
0.7819003, -0.09669811, 3.124161, 1, 1, 1, 1, 1,
0.7855213, -0.688957, 1.957518, 1, 1, 1, 1, 1,
0.7872741, -1.449178, 2.394167, 1, 1, 1, 1, 1,
0.7917384, 1.808426, 1.242518, 1, 1, 1, 1, 1,
0.7924989, -1.388984, 2.600651, 1, 1, 1, 1, 1,
0.7928104, -0.6866608, 5.190579, 1, 1, 1, 1, 1,
0.7953169, 1.191278, 0.1975113, 1, 1, 1, 1, 1,
0.8055027, -0.1306822, 1.338191, 1, 1, 1, 1, 1,
0.8094472, -1.300162, 2.095943, 1, 1, 1, 1, 1,
0.8108945, -0.8295314, 4.051885, 1, 1, 1, 1, 1,
0.8144166, 1.862396, 1.974998, 1, 1, 1, 1, 1,
0.8217964, -2.15322, 3.216182, 1, 1, 1, 1, 1,
0.8264963, 0.6955991, 1.553438, 1, 1, 1, 1, 1,
0.8333335, 0.04488097, -0.9748563, 1, 1, 1, 1, 1,
0.8376606, -0.1928055, 1.938741, 0, 0, 1, 1, 1,
0.8530414, -1.502966, 1.293489, 1, 0, 0, 1, 1,
0.8539943, 1.031263, 1.879376, 1, 0, 0, 1, 1,
0.8550391, -0.889753, 2.366652, 1, 0, 0, 1, 1,
0.8559482, -0.4955058, 3.028191, 1, 0, 0, 1, 1,
0.8579797, 1.530616, 0.4826347, 1, 0, 0, 1, 1,
0.8607425, 0.4373792, 0.7495099, 0, 0, 0, 1, 1,
0.8629087, -0.1816361, 1.903256, 0, 0, 0, 1, 1,
0.8631477, -1.576285, 1.852048, 0, 0, 0, 1, 1,
0.8638414, -0.8422059, 2.634012, 0, 0, 0, 1, 1,
0.8732461, 0.1663482, 2.631236, 0, 0, 0, 1, 1,
0.8739174, 1.896625, 0.505609, 0, 0, 0, 1, 1,
0.8752011, -0.9076443, 2.017302, 0, 0, 0, 1, 1,
0.877125, -1.007199, 2.588135, 1, 1, 1, 1, 1,
0.8870903, 1.130087, 0.2549163, 1, 1, 1, 1, 1,
0.8931963, -0.06582558, 1.919424, 1, 1, 1, 1, 1,
0.8935127, 0.3004468, 3.130373, 1, 1, 1, 1, 1,
0.8947746, 0.7169856, 0.6000823, 1, 1, 1, 1, 1,
0.8974012, -0.3760315, 2.602233, 1, 1, 1, 1, 1,
0.8995227, -1.145889, 2.367598, 1, 1, 1, 1, 1,
0.9065254, 0.7662907, 0.6622659, 1, 1, 1, 1, 1,
0.9095325, -0.1005168, 0.4171435, 1, 1, 1, 1, 1,
0.9115952, 0.572638, 1.284997, 1, 1, 1, 1, 1,
0.9121596, 0.8617222, 0.5275904, 1, 1, 1, 1, 1,
0.9150162, -0.8863723, 1.680779, 1, 1, 1, 1, 1,
0.9167742, -0.1545617, 1.964106, 1, 1, 1, 1, 1,
0.9227995, 1.519333, 0.1674514, 1, 1, 1, 1, 1,
0.9255188, 0.6734038, -0.06126631, 1, 1, 1, 1, 1,
0.9274056, -0.1349173, 2.197761, 0, 0, 1, 1, 1,
0.9278771, -0.4481201, 1.765353, 1, 0, 0, 1, 1,
0.9281929, 1.743504, -0.1337052, 1, 0, 0, 1, 1,
0.9309042, 0.8417937, 1.556817, 1, 0, 0, 1, 1,
0.9357419, -0.142512, 0.4761431, 1, 0, 0, 1, 1,
0.9427769, 1.394512, -2.210711, 1, 0, 0, 1, 1,
0.9502624, 0.5897674, 0.9148189, 0, 0, 0, 1, 1,
0.9524696, -1.505399, 1.794432, 0, 0, 0, 1, 1,
0.9614893, -0.2853904, 1.041725, 0, 0, 0, 1, 1,
0.9634998, 2.481634, 1.978835, 0, 0, 0, 1, 1,
0.9638649, -1.07842, 3.447473, 0, 0, 0, 1, 1,
0.9646505, -1.347067, 3.773014, 0, 0, 0, 1, 1,
0.9675363, 1.493004, 1.227494, 0, 0, 0, 1, 1,
0.9704639, -1.326597, 2.701612, 1, 1, 1, 1, 1,
0.9716803, 0.5549952, 0.6589159, 1, 1, 1, 1, 1,
0.9719853, 0.831408, 1.74706, 1, 1, 1, 1, 1,
0.9744716, -0.3899554, 2.167425, 1, 1, 1, 1, 1,
0.9769973, -0.5337505, 4.004415, 1, 1, 1, 1, 1,
0.9848036, -2.932674, 3.507394, 1, 1, 1, 1, 1,
0.9900903, 1.010321, 2.219533, 1, 1, 1, 1, 1,
0.9926683, 0.6134663, 0.8839241, 1, 1, 1, 1, 1,
0.9959586, 0.9998027, 0.5011435, 1, 1, 1, 1, 1,
1.003021, 0.7132897, 2.300747, 1, 1, 1, 1, 1,
1.005346, -0.7087842, 3.478628, 1, 1, 1, 1, 1,
1.006597, 0.9751936, 0.20681, 1, 1, 1, 1, 1,
1.011936, 1.340333, -0.6110801, 1, 1, 1, 1, 1,
1.014541, -1.901128, 3.384957, 1, 1, 1, 1, 1,
1.015297, -0.811021, 1.599374, 1, 1, 1, 1, 1,
1.027045, -2.228138, 4.599448, 0, 0, 1, 1, 1,
1.032928, -1.846855, 1.222461, 1, 0, 0, 1, 1,
1.03338, -0.6048652, 2.778447, 1, 0, 0, 1, 1,
1.034869, -0.6566089, 4.615208, 1, 0, 0, 1, 1,
1.035963, 0.2723963, 2.977368, 1, 0, 0, 1, 1,
1.037713, 0.5608351, 1.084918, 1, 0, 0, 1, 1,
1.040768, -0.3079917, 2.7252, 0, 0, 0, 1, 1,
1.043653, -1.589315, 2.770737, 0, 0, 0, 1, 1,
1.044497, 0.03151088, 0.7849309, 0, 0, 0, 1, 1,
1.044511, 0.7731186, 1.281402, 0, 0, 0, 1, 1,
1.045191, 0.2763716, 0.3341019, 0, 0, 0, 1, 1,
1.047897, 1.070474, 0.2649436, 0, 0, 0, 1, 1,
1.053586, -0.2802329, 2.164784, 0, 0, 0, 1, 1,
1.061677, -1.911937, 2.442614, 1, 1, 1, 1, 1,
1.065052, -2.289749, 2.469317, 1, 1, 1, 1, 1,
1.066449, -0.6591545, 2.535942, 1, 1, 1, 1, 1,
1.067802, -0.766135, 3.310421, 1, 1, 1, 1, 1,
1.075457, -0.1124427, 2.178267, 1, 1, 1, 1, 1,
1.077365, -1.859066, 3.917732, 1, 1, 1, 1, 1,
1.085703, 0.6057235, -0.2844665, 1, 1, 1, 1, 1,
1.086237, 1.019396, 1.108686, 1, 1, 1, 1, 1,
1.088721, 0.1931585, -0.6534733, 1, 1, 1, 1, 1,
1.092712, -0.6753986, 0.9907305, 1, 1, 1, 1, 1,
1.116813, -1.766341, 3.101604, 1, 1, 1, 1, 1,
1.120628, -0.1831323, 1.314375, 1, 1, 1, 1, 1,
1.128873, -1.426028, 1.401159, 1, 1, 1, 1, 1,
1.137017, 0.8042743, 0.4154285, 1, 1, 1, 1, 1,
1.138008, -0.5135683, 2.429706, 1, 1, 1, 1, 1,
1.139999, 0.07220974, 0.7011733, 0, 0, 1, 1, 1,
1.140151, 0.792749, -0.2520526, 1, 0, 0, 1, 1,
1.149177, 1.374717, 0.9661769, 1, 0, 0, 1, 1,
1.149404, -0.9949021, 2.485222, 1, 0, 0, 1, 1,
1.15035, 2.48277, -0.3829088, 1, 0, 0, 1, 1,
1.152308, -0.626069, 2.643512, 1, 0, 0, 1, 1,
1.155159, 0.8388661, 0.9189607, 0, 0, 0, 1, 1,
1.156631, 0.7037626, 1.380725, 0, 0, 0, 1, 1,
1.156666, 0.4237356, 0.9621595, 0, 0, 0, 1, 1,
1.162177, 1.059124, 1.545249, 0, 0, 0, 1, 1,
1.166401, -0.6790363, 0.2005763, 0, 0, 0, 1, 1,
1.171381, -1.272049, 2.581032, 0, 0, 0, 1, 1,
1.175711, 0.4549258, 0.2722455, 0, 0, 0, 1, 1,
1.176974, 0.1188928, 1.733625, 1, 1, 1, 1, 1,
1.178345, -1.325843, 0.3214032, 1, 1, 1, 1, 1,
1.190196, 0.4775537, 0.7651044, 1, 1, 1, 1, 1,
1.191563, 0.8482055, 2.36227, 1, 1, 1, 1, 1,
1.195096, -2.002327, 1.414244, 1, 1, 1, 1, 1,
1.215751, -0.8713409, 1.45999, 1, 1, 1, 1, 1,
1.221116, 1.476821, 0.8961731, 1, 1, 1, 1, 1,
1.221788, -0.0190512, 0.450567, 1, 1, 1, 1, 1,
1.222208, 0.1780947, 0.4155669, 1, 1, 1, 1, 1,
1.230873, -1.701574, 2.732274, 1, 1, 1, 1, 1,
1.234168, -0.903403, 2.063382, 1, 1, 1, 1, 1,
1.236756, 1.228649, 0.2468152, 1, 1, 1, 1, 1,
1.248407, 0.4849972, 1.291324, 1, 1, 1, 1, 1,
1.254779, 0.3591892, -0.1506492, 1, 1, 1, 1, 1,
1.259915, -2.206208, 1.670415, 1, 1, 1, 1, 1,
1.259984, -2.835733, 4.465155, 0, 0, 1, 1, 1,
1.267914, 0.9433393, -0.4920653, 1, 0, 0, 1, 1,
1.273111, -0.1255689, 1.300482, 1, 0, 0, 1, 1,
1.274959, -0.5735834, 0.575115, 1, 0, 0, 1, 1,
1.298555, 1.354796, 3.420685, 1, 0, 0, 1, 1,
1.320436, 1.173002, 0.9431754, 1, 0, 0, 1, 1,
1.322769, -1.353521, 2.461187, 0, 0, 0, 1, 1,
1.326866, -0.3958571, 1.150168, 0, 0, 0, 1, 1,
1.335268, -1.184688, 0.3255857, 0, 0, 0, 1, 1,
1.335726, -0.166195, 1.244258, 0, 0, 0, 1, 1,
1.338525, -0.1518852, 1.804731, 0, 0, 0, 1, 1,
1.339219, 0.8491889, 1.990625, 0, 0, 0, 1, 1,
1.341323, -1.35285, 2.577503, 0, 0, 0, 1, 1,
1.348363, -0.4123801, 2.142583, 1, 1, 1, 1, 1,
1.34901, 0.08620956, 1.107896, 1, 1, 1, 1, 1,
1.362831, 0.1240031, 2.454848, 1, 1, 1, 1, 1,
1.368058, -0.8948331, 2.019573, 1, 1, 1, 1, 1,
1.370108, 0.1659812, 2.083106, 1, 1, 1, 1, 1,
1.373519, 0.6928472, 2.295554, 1, 1, 1, 1, 1,
1.379742, -0.8541647, 2.300747, 1, 1, 1, 1, 1,
1.382173, -0.1043897, 3.137826, 1, 1, 1, 1, 1,
1.385901, 0.3924511, 2.626999, 1, 1, 1, 1, 1,
1.397574, 1.12921, 0.9106968, 1, 1, 1, 1, 1,
1.398883, -1.10281, 2.336406, 1, 1, 1, 1, 1,
1.398923, -0.6724433, 1.48889, 1, 1, 1, 1, 1,
1.400421, -0.5178496, 3.231364, 1, 1, 1, 1, 1,
1.400623, 0.2265447, 2.753329, 1, 1, 1, 1, 1,
1.410209, 0.7118366, 2.575043, 1, 1, 1, 1, 1,
1.412647, -1.963973, 1.904493, 0, 0, 1, 1, 1,
1.415961, 1.106139, 1.279233, 1, 0, 0, 1, 1,
1.421532, -0.6308606, 2.501924, 1, 0, 0, 1, 1,
1.424369, -0.1925307, 1.89341, 1, 0, 0, 1, 1,
1.42725, 1.291137, -0.4675323, 1, 0, 0, 1, 1,
1.435995, 0.1083901, 0.6222871, 1, 0, 0, 1, 1,
1.436861, 0.1487107, 2.0727, 0, 0, 0, 1, 1,
1.461072, -0.4571446, 1.907367, 0, 0, 0, 1, 1,
1.475503, -2.149161, 2.287122, 0, 0, 0, 1, 1,
1.491292, -0.9907751, 0.9975301, 0, 0, 0, 1, 1,
1.492973, -0.0236325, 2.780064, 0, 0, 0, 1, 1,
1.507939, 0.06312365, 2.992605, 0, 0, 0, 1, 1,
1.517857, -1.268658, 1.814552, 0, 0, 0, 1, 1,
1.527901, 0.1347349, 1.535791, 1, 1, 1, 1, 1,
1.534145, -0.3908809, 2.531657, 1, 1, 1, 1, 1,
1.552552, -0.708265, 2.441364, 1, 1, 1, 1, 1,
1.556382, -2.736629, 3.191231, 1, 1, 1, 1, 1,
1.557459, 0.8372642, 0.3539733, 1, 1, 1, 1, 1,
1.563278, 1.192683, 1.12583, 1, 1, 1, 1, 1,
1.566339, -1.7307, 2.248508, 1, 1, 1, 1, 1,
1.569275, 0.5167911, 3.833304, 1, 1, 1, 1, 1,
1.569497, -0.5171587, 3.301142, 1, 1, 1, 1, 1,
1.570714, -1.03966, 1.899515, 1, 1, 1, 1, 1,
1.577055, 1.422464, 0.7923638, 1, 1, 1, 1, 1,
1.584514, -1.355603, 2.793077, 1, 1, 1, 1, 1,
1.60053, -0.1406963, 0.8945239, 1, 1, 1, 1, 1,
1.604561, -0.755917, 1.361128, 1, 1, 1, 1, 1,
1.617781, 0.6512609, -0.7172228, 1, 1, 1, 1, 1,
1.626789, 0.958549, 0.8133828, 0, 0, 1, 1, 1,
1.632879, -0.01786435, 1.236957, 1, 0, 0, 1, 1,
1.634129, 0.9366969, 1.44835, 1, 0, 0, 1, 1,
1.652544, -0.3035673, -0.8064973, 1, 0, 0, 1, 1,
1.663374, -0.1947895, 1.047421, 1, 0, 0, 1, 1,
1.690284, -0.3073682, 4.77618, 1, 0, 0, 1, 1,
1.711576, -0.8282285, 2.664206, 0, 0, 0, 1, 1,
1.745815, 0.6760976, 2.211308, 0, 0, 0, 1, 1,
1.750522, -0.7525749, 1.269795, 0, 0, 0, 1, 1,
1.751349, -1.429468, 1.697242, 0, 0, 0, 1, 1,
1.763879, -0.01664371, 0.3927512, 0, 0, 0, 1, 1,
1.783964, 0.4516839, 0.2674004, 0, 0, 0, 1, 1,
1.785495, -0.362489, 0.4884546, 0, 0, 0, 1, 1,
1.78909, 0.1517601, 1.378848, 1, 1, 1, 1, 1,
1.824563, 0.3712336, 3.039367, 1, 1, 1, 1, 1,
1.835509, 0.584053, 2.723031, 1, 1, 1, 1, 1,
1.840461, 0.6862201, 1.225456, 1, 1, 1, 1, 1,
1.859902, 0.4036167, 1.957896, 1, 1, 1, 1, 1,
1.873537, 0.0357606, 2.207464, 1, 1, 1, 1, 1,
1.979853, 3.89146, 0.7817162, 1, 1, 1, 1, 1,
1.987983, -2.564408, 3.066962, 1, 1, 1, 1, 1,
1.992337, 0.9722915, 1.62766, 1, 1, 1, 1, 1,
2.028555, -0.2791145, 2.272114, 1, 1, 1, 1, 1,
2.030308, 1.843839, 1.265231, 1, 1, 1, 1, 1,
2.078441, -0.2179744, 0.4340559, 1, 1, 1, 1, 1,
2.110132, -0.871681, 2.108915, 1, 1, 1, 1, 1,
2.111156, 0.6914964, -0.04448291, 1, 1, 1, 1, 1,
2.120173, -1.105919, 0.2033739, 1, 1, 1, 1, 1,
2.122051, -0.01240216, 1.317975, 0, 0, 1, 1, 1,
2.232462, -0.09939368, 3.038877, 1, 0, 0, 1, 1,
2.25435, 0.4519644, 1.079691, 1, 0, 0, 1, 1,
2.291276, 0.3166624, 1.692369, 1, 0, 0, 1, 1,
2.342762, 0.04564379, 1.922668, 1, 0, 0, 1, 1,
2.37532, -1.393821, 1.471776, 1, 0, 0, 1, 1,
2.399226, 0.4483983, 1.863747, 0, 0, 0, 1, 1,
2.399714, -1.505749, 2.731264, 0, 0, 0, 1, 1,
2.412018, -0.7861249, 2.040345, 0, 0, 0, 1, 1,
2.432922, -0.7577152, 2.089189, 0, 0, 0, 1, 1,
2.446331, 0.03458589, 0.3411937, 0, 0, 0, 1, 1,
2.468925, 0.6482335, 2.204434, 0, 0, 0, 1, 1,
2.558873, -0.6343625, 1.860647, 0, 0, 0, 1, 1,
2.562438, -0.9490439, 2.506792, 1, 1, 1, 1, 1,
2.59182, 0.3826632, 0.9725461, 1, 1, 1, 1, 1,
2.652212, -1.627687, 2.198761, 1, 1, 1, 1, 1,
2.927528, 0.2807481, -0.6281287, 1, 1, 1, 1, 1,
3.000207, -0.4928851, 1.198201, 1, 1, 1, 1, 1,
3.206928, 0.3333755, 1.734068, 1, 1, 1, 1, 1,
3.21252, -0.2077859, 1.285565, 1, 1, 1, 1, 1
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
var radius = 9.8044;
var distance = 34.43754;
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
mvMatrix.translate( 0.018888, -0.3129663, 0.179332 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.43754);
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
