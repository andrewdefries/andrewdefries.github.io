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
-2.849594, 0.7747919, -2.0845, 1, 0, 0, 1,
-2.821759, -1.932454, -2.498794, 1, 0.007843138, 0, 1,
-2.701538, -1.168613, -1.474843, 1, 0.01176471, 0, 1,
-2.562224, 0.2002319, -0.6930279, 1, 0.01960784, 0, 1,
-2.510296, 0.9966586, 0.7216581, 1, 0.02352941, 0, 1,
-2.453633, -1.145507, -1.426955, 1, 0.03137255, 0, 1,
-2.277115, 0.4986352, -1.444972, 1, 0.03529412, 0, 1,
-2.243008, -0.3401515, -3.57155, 1, 0.04313726, 0, 1,
-2.23255, 0.6754053, -2.29394, 1, 0.04705882, 0, 1,
-2.195128, 0.1469728, -3.128634, 1, 0.05490196, 0, 1,
-2.171764, 0.8397417, 0.2301546, 1, 0.05882353, 0, 1,
-2.132727, 0.904071, -0.3709172, 1, 0.06666667, 0, 1,
-2.050477, -1.041137, -2.191019, 1, 0.07058824, 0, 1,
-2.041198, -0.3843035, -2.555463, 1, 0.07843138, 0, 1,
-2.022884, -0.4435341, -3.451871, 1, 0.08235294, 0, 1,
-2.021331, -0.2546916, -3.261213, 1, 0.09019608, 0, 1,
-2.007872, -0.03676076, 1.662455, 1, 0.09411765, 0, 1,
-1.980225, 0.1174725, -1.817498, 1, 0.1019608, 0, 1,
-1.980198, -0.08356711, -2.651157, 1, 0.1098039, 0, 1,
-1.972602, -1.205715, -2.825269, 1, 0.1137255, 0, 1,
-1.969267, -1.364044, -1.452061, 1, 0.1215686, 0, 1,
-1.922867, 1.944654, -1.057203, 1, 0.1254902, 0, 1,
-1.916261, 0.977384, -1.466667, 1, 0.1333333, 0, 1,
-1.912994, -0.02476265, -1.059488, 1, 0.1372549, 0, 1,
-1.911561, 0.1694682, -2.031194, 1, 0.145098, 0, 1,
-1.890626, -0.1794284, -2.950797, 1, 0.1490196, 0, 1,
-1.864206, -0.19004, -2.512413, 1, 0.1568628, 0, 1,
-1.850143, 0.3650544, -1.280618, 1, 0.1607843, 0, 1,
-1.845793, 1.4355, -2.715609, 1, 0.1686275, 0, 1,
-1.824372, 0.891623, -2.299788, 1, 0.172549, 0, 1,
-1.806599, -0.6887602, -2.273924, 1, 0.1803922, 0, 1,
-1.804144, 0.2816042, -2.577566, 1, 0.1843137, 0, 1,
-1.795812, -0.03533871, -3.184648, 1, 0.1921569, 0, 1,
-1.787525, 0.9957021, -1.404159, 1, 0.1960784, 0, 1,
-1.757313, 2.261164, -1.193134, 1, 0.2039216, 0, 1,
-1.74774, -0.3572548, -3.009659, 1, 0.2117647, 0, 1,
-1.741699, -0.6305692, -2.898908, 1, 0.2156863, 0, 1,
-1.722882, -0.5375078, -1.076412, 1, 0.2235294, 0, 1,
-1.719481, 0.8989462, 0.1333726, 1, 0.227451, 0, 1,
-1.703802, 1.064089, -0.1418515, 1, 0.2352941, 0, 1,
-1.703751, -0.894192, -2.352915, 1, 0.2392157, 0, 1,
-1.703507, -0.7022547, -1.744673, 1, 0.2470588, 0, 1,
-1.693199, -0.4735361, -2.918836, 1, 0.2509804, 0, 1,
-1.68674, 0.5403483, -0.7949392, 1, 0.2588235, 0, 1,
-1.675567, -0.7473693, -2.759017, 1, 0.2627451, 0, 1,
-1.651345, -1.057148, -1.14225, 1, 0.2705882, 0, 1,
-1.646433, -0.8080133, -2.897226, 1, 0.2745098, 0, 1,
-1.645485, -0.9287904, -2.127213, 1, 0.282353, 0, 1,
-1.644706, 0.4272023, -1.541296, 1, 0.2862745, 0, 1,
-1.641268, 0.9698191, -0.8097555, 1, 0.2941177, 0, 1,
-1.638978, 0.1271247, 0.3529834, 1, 0.3019608, 0, 1,
-1.592073, 0.1229332, -0.7808213, 1, 0.3058824, 0, 1,
-1.589142, 0.1228915, -3.350079, 1, 0.3137255, 0, 1,
-1.56919, -0.2083944, -1.670595, 1, 0.3176471, 0, 1,
-1.564196, 0.7773032, -2.083191, 1, 0.3254902, 0, 1,
-1.56102, 0.5722732, -0.03950575, 1, 0.3294118, 0, 1,
-1.552815, -2.887122, -2.402296, 1, 0.3372549, 0, 1,
-1.546516, 0.4372239, -2.234297, 1, 0.3411765, 0, 1,
-1.541081, 1.792551, 1.092693, 1, 0.3490196, 0, 1,
-1.540331, -0.2872517, -2.581249, 1, 0.3529412, 0, 1,
-1.537821, 0.4661239, -1.391819, 1, 0.3607843, 0, 1,
-1.534625, 1.429385, -0.5137482, 1, 0.3647059, 0, 1,
-1.494937, -0.09906384, -1.889866, 1, 0.372549, 0, 1,
-1.477335, 0.5577025, -2.805465, 1, 0.3764706, 0, 1,
-1.472548, 1.546802, -1.530586, 1, 0.3843137, 0, 1,
-1.470809, -1.27368, -1.243038, 1, 0.3882353, 0, 1,
-1.464204, 1.344371, 0.8599312, 1, 0.3960784, 0, 1,
-1.459747, -1.590551, -3.01726, 1, 0.4039216, 0, 1,
-1.455029, 0.9347758, -2.04575, 1, 0.4078431, 0, 1,
-1.451723, 0.9057882, -0.2744687, 1, 0.4156863, 0, 1,
-1.445934, 1.10999, -0.6603165, 1, 0.4196078, 0, 1,
-1.412042, -1.323589, -2.471493, 1, 0.427451, 0, 1,
-1.406565, -1.167551, -2.564707, 1, 0.4313726, 0, 1,
-1.387086, 0.3997279, -1.708285, 1, 0.4392157, 0, 1,
-1.384697, -1.495235, -2.50481, 1, 0.4431373, 0, 1,
-1.376106, -0.568422, 0.1644198, 1, 0.4509804, 0, 1,
-1.370416, 0.04030196, -1.170609, 1, 0.454902, 0, 1,
-1.362133, 0.7565649, -1.310211, 1, 0.4627451, 0, 1,
-1.355074, 0.6242606, 0.4674616, 1, 0.4666667, 0, 1,
-1.348607, 0.01905021, -0.6498432, 1, 0.4745098, 0, 1,
-1.336258, -2.25893, -1.826586, 1, 0.4784314, 0, 1,
-1.335833, 0.3074296, -0.1381123, 1, 0.4862745, 0, 1,
-1.327441, 0.4557787, -1.236307, 1, 0.4901961, 0, 1,
-1.324943, 1.049511, -1.374461, 1, 0.4980392, 0, 1,
-1.320837, -0.9085723, -2.261491, 1, 0.5058824, 0, 1,
-1.320689, -1.3428, -0.6732644, 1, 0.509804, 0, 1,
-1.316497, -0.8781114, -3.800833, 1, 0.5176471, 0, 1,
-1.305172, 2.253408, 0.6919361, 1, 0.5215687, 0, 1,
-1.303154, 1.138858, -1.286226, 1, 0.5294118, 0, 1,
-1.291263, -0.4666747, -3.720291, 1, 0.5333334, 0, 1,
-1.290512, -0.9278639, -2.911285, 1, 0.5411765, 0, 1,
-1.283627, 0.7388715, -0.2566357, 1, 0.5450981, 0, 1,
-1.27686, 0.6470408, -0.4932582, 1, 0.5529412, 0, 1,
-1.270621, 0.3500688, -2.04163, 1, 0.5568628, 0, 1,
-1.265244, 0.5307088, 0.4044205, 1, 0.5647059, 0, 1,
-1.264867, 0.2232564, -1.08791, 1, 0.5686275, 0, 1,
-1.261531, -0.7669513, -3.123927, 1, 0.5764706, 0, 1,
-1.261281, -1.693229, -0.7919925, 1, 0.5803922, 0, 1,
-1.261219, -0.1926123, -1.324291, 1, 0.5882353, 0, 1,
-1.254683, -0.79596, -3.020092, 1, 0.5921569, 0, 1,
-1.254657, 0.09341578, -1.629645, 1, 0.6, 0, 1,
-1.243267, 0.9949332, -0.4771671, 1, 0.6078432, 0, 1,
-1.239111, -2.571932, -3.654485, 1, 0.6117647, 0, 1,
-1.228939, 1.377397, -1.336328, 1, 0.6196079, 0, 1,
-1.223251, -0.9773257, -1.443555, 1, 0.6235294, 0, 1,
-1.209936, 0.6450436, -2.76597, 1, 0.6313726, 0, 1,
-1.209886, -1.955231, -0.999169, 1, 0.6352941, 0, 1,
-1.205981, -0.5003741, -1.780005, 1, 0.6431373, 0, 1,
-1.201874, 1.574207, -0.6601727, 1, 0.6470588, 0, 1,
-1.191784, -0.5388805, -2.037608, 1, 0.654902, 0, 1,
-1.190847, 0.1428876, -0.4989038, 1, 0.6588235, 0, 1,
-1.189652, -0.399836, -0.9397544, 1, 0.6666667, 0, 1,
-1.179849, -0.8636047, -0.893095, 1, 0.6705883, 0, 1,
-1.169033, -0.5022832, -1.37339, 1, 0.6784314, 0, 1,
-1.158869, -0.4132845, -3.277344, 1, 0.682353, 0, 1,
-1.156693, 1.090258, -1.166527, 1, 0.6901961, 0, 1,
-1.151898, 0.458464, -1.597125, 1, 0.6941177, 0, 1,
-1.14703, 0.6554484, -0.8369846, 1, 0.7019608, 0, 1,
-1.144891, 0.4468775, -1.011027, 1, 0.7098039, 0, 1,
-1.13565, -0.1464648, -2.530632, 1, 0.7137255, 0, 1,
-1.135529, -0.1426035, -1.70957, 1, 0.7215686, 0, 1,
-1.125232, -0.7546905, -2.910889, 1, 0.7254902, 0, 1,
-1.12314, 0.7228203, -1.878237, 1, 0.7333333, 0, 1,
-1.120772, -1.75728, -3.534749, 1, 0.7372549, 0, 1,
-1.113984, -1.586725, -2.890386, 1, 0.7450981, 0, 1,
-1.112812, 0.05412924, -0.9405894, 1, 0.7490196, 0, 1,
-1.112522, 1.021403, -0.1725808, 1, 0.7568628, 0, 1,
-1.105949, -0.6639183, -0.1195581, 1, 0.7607843, 0, 1,
-1.104635, -0.1424799, -1.724294, 1, 0.7686275, 0, 1,
-1.102281, -1.838391, -2.754473, 1, 0.772549, 0, 1,
-1.101292, -0.4746707, -1.943107, 1, 0.7803922, 0, 1,
-1.098263, 0.3343941, -1.430378, 1, 0.7843137, 0, 1,
-1.093154, -2.06711, -2.34022, 1, 0.7921569, 0, 1,
-1.086719, -0.8799921, -4.427686, 1, 0.7960784, 0, 1,
-1.080225, -0.9104797, -2.913797, 1, 0.8039216, 0, 1,
-1.075544, 0.4245643, -1.465295, 1, 0.8117647, 0, 1,
-1.073132, -1.338621, -1.856241, 1, 0.8156863, 0, 1,
-1.072022, 1.647362, -0.186928, 1, 0.8235294, 0, 1,
-1.066772, -2.168854, -3.107829, 1, 0.827451, 0, 1,
-1.064579, -0.4206296, -1.15076, 1, 0.8352941, 0, 1,
-1.056551, -0.3789072, -1.775319, 1, 0.8392157, 0, 1,
-1.054911, 0.820115, -0.7331638, 1, 0.8470588, 0, 1,
-1.046296, 1.296767, -2.063298, 1, 0.8509804, 0, 1,
-1.042905, 0.6739293, -0.9495054, 1, 0.8588235, 0, 1,
-1.034203, -1.237004, -1.412784, 1, 0.8627451, 0, 1,
-1.02932, -0.5964691, -1.482435, 1, 0.8705882, 0, 1,
-1.025493, 0.1239599, -2.418608, 1, 0.8745098, 0, 1,
-1.011932, -0.3841093, -1.299204, 1, 0.8823529, 0, 1,
-1.011629, 1.433573, -1.40541, 1, 0.8862745, 0, 1,
-1.003629, -0.5483246, -0.1060071, 1, 0.8941177, 0, 1,
-1.002106, -0.1231055, -1.012857, 1, 0.8980392, 0, 1,
-1.000588, 0.5466061, -0.5951913, 1, 0.9058824, 0, 1,
-0.9993044, -0.7511262, -3.607351, 1, 0.9137255, 0, 1,
-0.9991846, 1.303538, -0.1025207, 1, 0.9176471, 0, 1,
-0.9882765, 0.734828, -0.6595815, 1, 0.9254902, 0, 1,
-0.9847111, 0.879755, -1.579824, 1, 0.9294118, 0, 1,
-0.9789293, -0.7955211, -1.988922, 1, 0.9372549, 0, 1,
-0.9745262, -1.690685, -2.424313, 1, 0.9411765, 0, 1,
-0.9740161, -0.8219426, -2.99168, 1, 0.9490196, 0, 1,
-0.9681327, 0.8490111, -0.6688154, 1, 0.9529412, 0, 1,
-0.9568816, -0.1691054, -1.920145, 1, 0.9607843, 0, 1,
-0.9547803, -0.9388575, -3.166109, 1, 0.9647059, 0, 1,
-0.9518017, -0.8540066, -2.919941, 1, 0.972549, 0, 1,
-0.9486418, 0.04717007, -2.284794, 1, 0.9764706, 0, 1,
-0.9361339, -0.4983019, -3.947959, 1, 0.9843137, 0, 1,
-0.9310163, 0.4840512, -0.4758055, 1, 0.9882353, 0, 1,
-0.9303665, 0.5711446, -1.476886, 1, 0.9960784, 0, 1,
-0.9264299, 2.360293, -1.811711, 0.9960784, 1, 0, 1,
-0.9196926, -0.1313927, -2.136212, 0.9921569, 1, 0, 1,
-0.9159632, -0.1817225, -1.486734, 0.9843137, 1, 0, 1,
-0.9128232, -0.4754089, -3.742418, 0.9803922, 1, 0, 1,
-0.9096857, 1.620681, -2.142202, 0.972549, 1, 0, 1,
-0.9080912, -0.2794824, -0.06552878, 0.9686275, 1, 0, 1,
-0.9078863, -0.877908, -1.934395, 0.9607843, 1, 0, 1,
-0.9050201, -0.9017677, -2.15574, 0.9568627, 1, 0, 1,
-0.9009084, -0.2664956, -2.587062, 0.9490196, 1, 0, 1,
-0.893285, -0.07825521, -2.08025, 0.945098, 1, 0, 1,
-0.8884361, 2.811104, 0.0596219, 0.9372549, 1, 0, 1,
-0.8842285, 0.5512231, -0.7037498, 0.9333333, 1, 0, 1,
-0.8819239, -1.402945, -0.4008494, 0.9254902, 1, 0, 1,
-0.8800108, -0.0839507, -1.218693, 0.9215686, 1, 0, 1,
-0.8757284, 0.9991302, 0.617484, 0.9137255, 1, 0, 1,
-0.8745997, 1.594479, -0.411628, 0.9098039, 1, 0, 1,
-0.8726396, 0.1937919, -2.541929, 0.9019608, 1, 0, 1,
-0.8704134, -0.01759924, -2.135237, 0.8941177, 1, 0, 1,
-0.8703642, 0.04263556, -1.656086, 0.8901961, 1, 0, 1,
-0.8656235, 1.856874, -0.2900131, 0.8823529, 1, 0, 1,
-0.8581105, 1.02362, 0.3447782, 0.8784314, 1, 0, 1,
-0.8515055, -0.2989384, -0.767951, 0.8705882, 1, 0, 1,
-0.8509305, 0.8516415, -0.3583588, 0.8666667, 1, 0, 1,
-0.8482831, -0.1092354, -0.894809, 0.8588235, 1, 0, 1,
-0.8405991, 1.008637, -0.858869, 0.854902, 1, 0, 1,
-0.8399661, 0.7599153, -1.467271, 0.8470588, 1, 0, 1,
-0.8290696, 1.074005, -0.1193828, 0.8431373, 1, 0, 1,
-0.8271596, 0.5109466, 0.3154985, 0.8352941, 1, 0, 1,
-0.8174455, -0.4301423, -1.785828, 0.8313726, 1, 0, 1,
-0.7768415, 1.8345, -0.001613874, 0.8235294, 1, 0, 1,
-0.7743551, 1.781218, 0.5941445, 0.8196079, 1, 0, 1,
-0.7716715, 0.2191755, -2.362627, 0.8117647, 1, 0, 1,
-0.7692505, 1.486318, -1.121996, 0.8078431, 1, 0, 1,
-0.768333, 1.376879, 0.7009046, 0.8, 1, 0, 1,
-0.7620532, -1.167784, -2.118321, 0.7921569, 1, 0, 1,
-0.7604655, 2.15532, 1.086645, 0.7882353, 1, 0, 1,
-0.759213, 1.345804, -2.180627, 0.7803922, 1, 0, 1,
-0.757021, 0.05964804, -1.79877, 0.7764706, 1, 0, 1,
-0.7532914, -0.7676088, -1.227268, 0.7686275, 1, 0, 1,
-0.7482713, -1.351193, -0.9871566, 0.7647059, 1, 0, 1,
-0.7477947, -0.4534722, -1.894118, 0.7568628, 1, 0, 1,
-0.7461023, -0.4954493, -2.454323, 0.7529412, 1, 0, 1,
-0.7458735, 0.1592378, -0.2933189, 0.7450981, 1, 0, 1,
-0.7425869, -0.6020867, -0.2116121, 0.7411765, 1, 0, 1,
-0.7401058, 2.248375, 0.1966149, 0.7333333, 1, 0, 1,
-0.7384988, 2.549716, -2.242818, 0.7294118, 1, 0, 1,
-0.7288436, -1.037782, -0.8181469, 0.7215686, 1, 0, 1,
-0.7264346, -0.1994765, -1.565727, 0.7176471, 1, 0, 1,
-0.7254005, -0.4945177, -0.2670552, 0.7098039, 1, 0, 1,
-0.7253942, -0.4283534, -1.482812, 0.7058824, 1, 0, 1,
-0.7197482, 0.1292803, -0.6742403, 0.6980392, 1, 0, 1,
-0.717158, -1.673159, -5.754981, 0.6901961, 1, 0, 1,
-0.7167386, 0.1289589, -2.920465, 0.6862745, 1, 0, 1,
-0.7144587, -0.9351489, -2.816473, 0.6784314, 1, 0, 1,
-0.7143685, -2.463496, -3.002674, 0.6745098, 1, 0, 1,
-0.705197, 0.6039305, -0.07541493, 0.6666667, 1, 0, 1,
-0.7035612, 0.02233025, -1.151533, 0.6627451, 1, 0, 1,
-0.701255, 0.3494158, -2.225216, 0.654902, 1, 0, 1,
-0.6979545, 2.731975, 0.4044861, 0.6509804, 1, 0, 1,
-0.6972331, 0.7098709, -1.258689, 0.6431373, 1, 0, 1,
-0.696172, 0.914012, 0.3734799, 0.6392157, 1, 0, 1,
-0.6957986, -1.465123, -2.259089, 0.6313726, 1, 0, 1,
-0.6937379, -0.2974121, -2.467421, 0.627451, 1, 0, 1,
-0.6889994, -0.7011674, -4.400434, 0.6196079, 1, 0, 1,
-0.6880322, 1.147784, -0.4858195, 0.6156863, 1, 0, 1,
-0.6830934, 1.593923, 0.2288018, 0.6078432, 1, 0, 1,
-0.6789871, -1.001834, -3.231198, 0.6039216, 1, 0, 1,
-0.6788401, -2.051221, -2.254776, 0.5960785, 1, 0, 1,
-0.6758376, 0.5948583, -0.04814586, 0.5882353, 1, 0, 1,
-0.6725671, 0.2021261, -0.6508508, 0.5843138, 1, 0, 1,
-0.6718699, -1.335872, -3.095807, 0.5764706, 1, 0, 1,
-0.6718521, -0.6099262, -3.617077, 0.572549, 1, 0, 1,
-0.6716618, -2.59061, -3.01855, 0.5647059, 1, 0, 1,
-0.6704166, -0.6890771, -2.442705, 0.5607843, 1, 0, 1,
-0.6689993, -1.20664, -2.973443, 0.5529412, 1, 0, 1,
-0.6648071, -0.7516146, -2.086149, 0.5490196, 1, 0, 1,
-0.6643016, -0.2836137, -3.068246, 0.5411765, 1, 0, 1,
-0.6595557, -0.1597407, -1.274846, 0.5372549, 1, 0, 1,
-0.6590906, -1.006993, -3.317231, 0.5294118, 1, 0, 1,
-0.6589294, 1.022197, -0.1560748, 0.5254902, 1, 0, 1,
-0.6577628, 0.4645531, -1.868232, 0.5176471, 1, 0, 1,
-0.6575293, -0.6123581, -1.88539, 0.5137255, 1, 0, 1,
-0.6561548, 0.8898753, -1.094662, 0.5058824, 1, 0, 1,
-0.6470405, -1.175058, -1.431788, 0.5019608, 1, 0, 1,
-0.6380028, 0.001153265, 0.568791, 0.4941176, 1, 0, 1,
-0.6340345, -0.6679259, -3.257227, 0.4862745, 1, 0, 1,
-0.6282173, -0.7636734, -2.79761, 0.4823529, 1, 0, 1,
-0.627633, 1.272039, -0.1293417, 0.4745098, 1, 0, 1,
-0.6180585, 1.032752, -1.343983, 0.4705882, 1, 0, 1,
-0.6142111, 0.4241921, -1.408032, 0.4627451, 1, 0, 1,
-0.6049263, -0.151478, -1.061133, 0.4588235, 1, 0, 1,
-0.5974278, 1.843528, 0.2899328, 0.4509804, 1, 0, 1,
-0.5946118, -0.2211476, -1.83727, 0.4470588, 1, 0, 1,
-0.5932718, -1.479631, -2.373348, 0.4392157, 1, 0, 1,
-0.5893708, -1.442171, -0.6700655, 0.4352941, 1, 0, 1,
-0.5890972, -0.1302218, -1.866073, 0.427451, 1, 0, 1,
-0.5860448, -0.02461946, -1.480424, 0.4235294, 1, 0, 1,
-0.5859541, 1.174957, -1.425843, 0.4156863, 1, 0, 1,
-0.5851773, -0.09248353, -1.883193, 0.4117647, 1, 0, 1,
-0.5817955, 0.2088885, -3.147404, 0.4039216, 1, 0, 1,
-0.5813779, -0.7864022, -3.075635, 0.3960784, 1, 0, 1,
-0.5796648, 0.1227852, -1.979804, 0.3921569, 1, 0, 1,
-0.5788229, 1.843304, 0.6197217, 0.3843137, 1, 0, 1,
-0.5746843, -1.309062, -2.903515, 0.3803922, 1, 0, 1,
-0.5680939, 1.23481, -0.1350109, 0.372549, 1, 0, 1,
-0.5677319, 0.4009526, -0.5084575, 0.3686275, 1, 0, 1,
-0.5641958, 1.843375, -1.046435, 0.3607843, 1, 0, 1,
-0.5607459, -2.510488, -3.117167, 0.3568628, 1, 0, 1,
-0.5559208, -1.199768, -3.222628, 0.3490196, 1, 0, 1,
-0.5545825, 0.8493332, -1.535542, 0.345098, 1, 0, 1,
-0.5534259, 0.1844574, -1.045617, 0.3372549, 1, 0, 1,
-0.5513133, 0.06435842, -0.345003, 0.3333333, 1, 0, 1,
-0.5501195, -1.202168, -3.375987, 0.3254902, 1, 0, 1,
-0.5468597, -0.5716524, 0.1362343, 0.3215686, 1, 0, 1,
-0.5391467, 0.8192585, -1.597317, 0.3137255, 1, 0, 1,
-0.5354103, 0.9361464, -1.747316, 0.3098039, 1, 0, 1,
-0.5352999, -0.4855761, -4.210916, 0.3019608, 1, 0, 1,
-0.5323275, 0.5032489, -2.180579, 0.2941177, 1, 0, 1,
-0.5280597, -0.07092699, -3.135791, 0.2901961, 1, 0, 1,
-0.52755, -1.397289, -2.106848, 0.282353, 1, 0, 1,
-0.5236205, 0.2002488, 0.07252344, 0.2784314, 1, 0, 1,
-0.5232664, 1.398556, 0.5710254, 0.2705882, 1, 0, 1,
-0.5209515, -0.008467965, -2.794637, 0.2666667, 1, 0, 1,
-0.5188355, -0.701098, -1.5599, 0.2588235, 1, 0, 1,
-0.517163, -0.191122, -1.133644, 0.254902, 1, 0, 1,
-0.5161544, -0.07438076, -1.827933, 0.2470588, 1, 0, 1,
-0.5151942, 0.8561481, -1.95014, 0.2431373, 1, 0, 1,
-0.5089916, 0.7076287, 0.735059, 0.2352941, 1, 0, 1,
-0.5082316, -1.47234, -2.329366, 0.2313726, 1, 0, 1,
-0.5079694, 0.814222, -1.764998, 0.2235294, 1, 0, 1,
-0.5078002, -0.4147304, -3.091757, 0.2196078, 1, 0, 1,
-0.4997937, -0.482117, -2.84384, 0.2117647, 1, 0, 1,
-0.4958899, 0.684032, 0.3312116, 0.2078431, 1, 0, 1,
-0.492588, -0.1606462, -1.884156, 0.2, 1, 0, 1,
-0.4903854, -0.3727065, -1.037988, 0.1921569, 1, 0, 1,
-0.4902798, -1.281328, -2.588257, 0.1882353, 1, 0, 1,
-0.4840402, -0.7859865, -3.018737, 0.1803922, 1, 0, 1,
-0.4816566, 1.903485, 0.3618239, 0.1764706, 1, 0, 1,
-0.479953, -0.5398513, -2.25773, 0.1686275, 1, 0, 1,
-0.4789881, -0.3079411, -2.371376, 0.1647059, 1, 0, 1,
-0.4784482, -0.0945786, -1.43475, 0.1568628, 1, 0, 1,
-0.4781235, 0.9020985, -1.353989, 0.1529412, 1, 0, 1,
-0.4780344, 0.4904969, -0.04847665, 0.145098, 1, 0, 1,
-0.4772321, -1.103955, -3.196637, 0.1411765, 1, 0, 1,
-0.4764164, -2.63694, -2.236633, 0.1333333, 1, 0, 1,
-0.470358, 0.1601379, -0.2094685, 0.1294118, 1, 0, 1,
-0.4691327, 0.3841082, -2.447337, 0.1215686, 1, 0, 1,
-0.4669689, 0.5206433, -0.8686917, 0.1176471, 1, 0, 1,
-0.4643988, -0.1724211, -0.5982581, 0.1098039, 1, 0, 1,
-0.4619568, -0.31219, -2.831606, 0.1058824, 1, 0, 1,
-0.4614834, 1.332192, -0.8210838, 0.09803922, 1, 0, 1,
-0.4604378, -1.287901, -1.895065, 0.09019608, 1, 0, 1,
-0.4593512, 0.3724251, -0.9407745, 0.08627451, 1, 0, 1,
-0.4551721, -1.837144, -1.747344, 0.07843138, 1, 0, 1,
-0.4470138, -2.118706, -1.753344, 0.07450981, 1, 0, 1,
-0.4441896, 0.8013985, -0.5994356, 0.06666667, 1, 0, 1,
-0.4378329, -0.743727, -3.448792, 0.0627451, 1, 0, 1,
-0.4350884, 0.2174421, -0.2614434, 0.05490196, 1, 0, 1,
-0.434071, 0.9355859, -1.142465, 0.05098039, 1, 0, 1,
-0.4309569, -1.180091, -3.337531, 0.04313726, 1, 0, 1,
-0.4264508, -0.5598134, -2.65861, 0.03921569, 1, 0, 1,
-0.4242632, 0.6050513, -0.1359971, 0.03137255, 1, 0, 1,
-0.4226927, 0.04816908, -1.875534, 0.02745098, 1, 0, 1,
-0.4203824, 1.222008, -0.2835937, 0.01960784, 1, 0, 1,
-0.4127648, 0.5933543, -0.6816445, 0.01568628, 1, 0, 1,
-0.4116891, 0.3523551, 0.1384817, 0.007843138, 1, 0, 1,
-0.4114069, 2.361896, -0.1536696, 0.003921569, 1, 0, 1,
-0.4109385, -2.791027, -5.327381, 0, 1, 0.003921569, 1,
-0.4066794, 0.5472045, -1.029249, 0, 1, 0.01176471, 1,
-0.4061034, -0.5398621, -1.259708, 0, 1, 0.01568628, 1,
-0.4049322, 0.4069177, -1.58162, 0, 1, 0.02352941, 1,
-0.4026601, -0.7772686, -2.531784, 0, 1, 0.02745098, 1,
-0.3963684, 0.7605324, -2.151233, 0, 1, 0.03529412, 1,
-0.393812, 0.3984498, 0.8400566, 0, 1, 0.03921569, 1,
-0.3934525, 0.08346646, 0.05352885, 0, 1, 0.04705882, 1,
-0.393148, 0.07133446, -0.7744688, 0, 1, 0.05098039, 1,
-0.3912326, 0.948127, 0.9943058, 0, 1, 0.05882353, 1,
-0.3906333, -2.049491, -3.35227, 0, 1, 0.0627451, 1,
-0.3885516, -0.3615216, -2.065783, 0, 1, 0.07058824, 1,
-0.3863521, -0.6923896, -1.828351, 0, 1, 0.07450981, 1,
-0.3861778, 0.02896564, -0.1479886, 0, 1, 0.08235294, 1,
-0.3823423, -0.5354679, -2.048172, 0, 1, 0.08627451, 1,
-0.3819006, 1.546552, -1.001888, 0, 1, 0.09411765, 1,
-0.3769952, 1.369131, -1.678877, 0, 1, 0.1019608, 1,
-0.3765689, 0.9183776, -1.551546, 0, 1, 0.1058824, 1,
-0.3732311, 0.8103321, -1.430106, 0, 1, 0.1137255, 1,
-0.3640291, -1.563362, -3.815465, 0, 1, 0.1176471, 1,
-0.3623325, 1.358541, 0.874927, 0, 1, 0.1254902, 1,
-0.3616986, 0.07889343, -2.089882, 0, 1, 0.1294118, 1,
-0.3591328, 0.2210019, -2.809121, 0, 1, 0.1372549, 1,
-0.3566779, -1.708295, -3.274637, 0, 1, 0.1411765, 1,
-0.3554645, -1.417473, -2.189375, 0, 1, 0.1490196, 1,
-0.3464918, 1.430952, -1.229677, 0, 1, 0.1529412, 1,
-0.3433212, 0.4782656, -2.242916, 0, 1, 0.1607843, 1,
-0.3410478, -0.7634938, -2.430326, 0, 1, 0.1647059, 1,
-0.3395133, -0.05362079, -1.01204, 0, 1, 0.172549, 1,
-0.3329085, -0.05016061, -1.524154, 0, 1, 0.1764706, 1,
-0.3328352, 0.5263757, -0.3025567, 0, 1, 0.1843137, 1,
-0.328169, 0.06202239, -1.664495, 0, 1, 0.1882353, 1,
-0.327109, -0.0627756, -1.228848, 0, 1, 0.1960784, 1,
-0.3264817, -0.01409831, -2.616769, 0, 1, 0.2039216, 1,
-0.3246572, 0.4625991, -0.2246274, 0, 1, 0.2078431, 1,
-0.315797, 1.326292, -1.45841, 0, 1, 0.2156863, 1,
-0.3142278, -0.2903686, -1.398242, 0, 1, 0.2196078, 1,
-0.3103723, 0.02358801, -2.155044, 0, 1, 0.227451, 1,
-0.3066989, 0.5522854, -0.8491782, 0, 1, 0.2313726, 1,
-0.3055486, 0.08565085, -0.5740734, 0, 1, 0.2392157, 1,
-0.3012156, 0.6426238, -0.3635586, 0, 1, 0.2431373, 1,
-0.3007119, -0.5267603, -1.399071, 0, 1, 0.2509804, 1,
-0.2990406, 0.9910122, -0.9230222, 0, 1, 0.254902, 1,
-0.2944602, -0.4960358, -1.139293, 0, 1, 0.2627451, 1,
-0.2912229, 1.065381, 0.1946929, 0, 1, 0.2666667, 1,
-0.2911702, 0.6572781, -1.323119, 0, 1, 0.2745098, 1,
-0.2880398, 0.7853677, -1.535998, 0, 1, 0.2784314, 1,
-0.2857132, 0.3939114, -0.8149418, 0, 1, 0.2862745, 1,
-0.2837062, 0.6039726, 0.6391836, 0, 1, 0.2901961, 1,
-0.2708437, -1.060591, -3.204519, 0, 1, 0.2980392, 1,
-0.2538162, 0.7206059, -1.942357, 0, 1, 0.3058824, 1,
-0.2532818, -0.1944753, -2.315283, 0, 1, 0.3098039, 1,
-0.2530523, 0.732871, -0.874483, 0, 1, 0.3176471, 1,
-0.2527297, -0.2819893, -1.311421, 0, 1, 0.3215686, 1,
-0.2524755, 0.2574683, -1.12931, 0, 1, 0.3294118, 1,
-0.2520237, -0.9984331, -3.275675, 0, 1, 0.3333333, 1,
-0.2512993, -1.887058, -2.7399, 0, 1, 0.3411765, 1,
-0.2500248, 0.9828402, -1.37635, 0, 1, 0.345098, 1,
-0.2487828, 1.008061, -1.642412, 0, 1, 0.3529412, 1,
-0.2451094, 0.6895123, -1.212068, 0, 1, 0.3568628, 1,
-0.2443404, 0.8415986, -0.3122973, 0, 1, 0.3647059, 1,
-0.2379426, -0.1687584, -0.7029265, 0, 1, 0.3686275, 1,
-0.2327323, -1.578535, -2.894143, 0, 1, 0.3764706, 1,
-0.230124, -0.9735081, -3.382749, 0, 1, 0.3803922, 1,
-0.2257441, -0.9931334, -2.174755, 0, 1, 0.3882353, 1,
-0.2255902, -0.9697793, -2.120732, 0, 1, 0.3921569, 1,
-0.2226404, 1.936437, 1.010314, 0, 1, 0.4, 1,
-0.2225976, -1.133825, -3.274178, 0, 1, 0.4078431, 1,
-0.2219045, 1.276995, -0.7449379, 0, 1, 0.4117647, 1,
-0.2201623, 0.540171, 1.514568, 0, 1, 0.4196078, 1,
-0.2140789, -0.7645776, -3.843642, 0, 1, 0.4235294, 1,
-0.2137043, 0.5819347, -2.082505, 0, 1, 0.4313726, 1,
-0.2025702, -1.092047, -3.132331, 0, 1, 0.4352941, 1,
-0.1965507, -1.040372, -3.21992, 0, 1, 0.4431373, 1,
-0.1880237, -0.8730778, -2.579453, 0, 1, 0.4470588, 1,
-0.1870066, -2.232274, -2.863995, 0, 1, 0.454902, 1,
-0.184813, 0.2634936, -1.411874, 0, 1, 0.4588235, 1,
-0.1836831, -1.012313, -3.043376, 0, 1, 0.4666667, 1,
-0.1801621, -1.22183, -4.240918, 0, 1, 0.4705882, 1,
-0.1799678, -0.8872376, -2.20462, 0, 1, 0.4784314, 1,
-0.1785452, 0.9811046, -0.1470523, 0, 1, 0.4823529, 1,
-0.1785216, 0.1115783, -0.5588994, 0, 1, 0.4901961, 1,
-0.1783983, 1.098055, 0.02645374, 0, 1, 0.4941176, 1,
-0.1767593, 0.1053182, 0.3394261, 0, 1, 0.5019608, 1,
-0.1757442, 1.064064, 0.4142503, 0, 1, 0.509804, 1,
-0.1754475, -1.220256, -2.345205, 0, 1, 0.5137255, 1,
-0.1750479, -0.920238, -2.809114, 0, 1, 0.5215687, 1,
-0.1703421, -0.350768, -1.275313, 0, 1, 0.5254902, 1,
-0.1696032, 0.4396121, -0.5028183, 0, 1, 0.5333334, 1,
-0.1643454, -0.4794341, -3.600873, 0, 1, 0.5372549, 1,
-0.1579721, -0.7264913, -1.686967, 0, 1, 0.5450981, 1,
-0.1524516, 0.07246719, -0.06246874, 0, 1, 0.5490196, 1,
-0.1523336, -0.3015846, -2.333352, 0, 1, 0.5568628, 1,
-0.1514678, -0.8831265, -4.91465, 0, 1, 0.5607843, 1,
-0.1506558, -0.484374, -3.10985, 0, 1, 0.5686275, 1,
-0.1482149, -0.9598693, -3.534343, 0, 1, 0.572549, 1,
-0.1449231, 0.4544159, 0.9019337, 0, 1, 0.5803922, 1,
-0.1441725, 0.8448235, 0.6663013, 0, 1, 0.5843138, 1,
-0.142683, -1.268745, -2.60602, 0, 1, 0.5921569, 1,
-0.1394344, -0.6548355, -4.676229, 0, 1, 0.5960785, 1,
-0.1382411, -1.889205, -4.864393, 0, 1, 0.6039216, 1,
-0.1364802, -0.4397052, -2.688776, 0, 1, 0.6117647, 1,
-0.1338989, 0.7945675, 0.231567, 0, 1, 0.6156863, 1,
-0.1313159, 0.1113828, -2.033476, 0, 1, 0.6235294, 1,
-0.1292879, 0.9887032, 0.8846844, 0, 1, 0.627451, 1,
-0.1277507, -0.9559124, -3.04493, 0, 1, 0.6352941, 1,
-0.1212168, 0.02404588, -1.229314, 0, 1, 0.6392157, 1,
-0.1200884, 0.5978951, 0.6821123, 0, 1, 0.6470588, 1,
-0.1128149, -1.52916, -3.715809, 0, 1, 0.6509804, 1,
-0.1102494, -0.8835441, -3.086101, 0, 1, 0.6588235, 1,
-0.1096372, 0.9457139, -1.028801, 0, 1, 0.6627451, 1,
-0.1043552, -0.5463263, -3.090702, 0, 1, 0.6705883, 1,
-0.1038098, 0.2549626, 0.1557871, 0, 1, 0.6745098, 1,
-0.1026327, -0.6505498, -1.795127, 0, 1, 0.682353, 1,
-0.1019172, -0.1051334, -2.846608, 0, 1, 0.6862745, 1,
-0.09978615, -0.5539865, -4.035285, 0, 1, 0.6941177, 1,
-0.09723628, 1.24772, -0.8113648, 0, 1, 0.7019608, 1,
-0.09542786, 2.266045, -0.6759601, 0, 1, 0.7058824, 1,
-0.09501469, -0.1920983, -2.899076, 0, 1, 0.7137255, 1,
-0.09331506, -0.6593121, -4.697381, 0, 1, 0.7176471, 1,
-0.09149457, -0.5473812, -2.813032, 0, 1, 0.7254902, 1,
-0.08881684, -0.09315199, -1.875926, 0, 1, 0.7294118, 1,
-0.08765627, -0.871833, -4.210344, 0, 1, 0.7372549, 1,
-0.08722641, 0.1588964, -0.6588419, 0, 1, 0.7411765, 1,
-0.08647119, -0.7731, -3.360882, 0, 1, 0.7490196, 1,
-0.08343107, 0.8815164, -0.6078451, 0, 1, 0.7529412, 1,
-0.08076784, 0.6496328, -0.2366133, 0, 1, 0.7607843, 1,
-0.07620603, 1.279057, 0.5944299, 0, 1, 0.7647059, 1,
-0.07591029, -1.35196, -4.940879, 0, 1, 0.772549, 1,
-0.07008945, -0.8924386, -3.73154, 0, 1, 0.7764706, 1,
-0.06657486, -0.7265303, -3.349094, 0, 1, 0.7843137, 1,
-0.06284332, 0.8150864, -0.03823452, 0, 1, 0.7882353, 1,
-0.06261091, 2.03024, -1.224018, 0, 1, 0.7960784, 1,
-0.06208149, 1.525708, -1.83963, 0, 1, 0.8039216, 1,
-0.05714495, -0.3020871, -3.475691, 0, 1, 0.8078431, 1,
-0.05337169, -0.4529042, -4.232388, 0, 1, 0.8156863, 1,
-0.05269177, -0.2527145, -2.025463, 0, 1, 0.8196079, 1,
-0.05157726, -0.3199084, -3.248685, 0, 1, 0.827451, 1,
-0.04831339, -0.01370725, -1.563982, 0, 1, 0.8313726, 1,
-0.04780897, -1.272026, -4.004443, 0, 1, 0.8392157, 1,
-0.04764701, 0.3196036, -0.4130837, 0, 1, 0.8431373, 1,
-0.03911794, 0.1832713, -0.705096, 0, 1, 0.8509804, 1,
-0.03527776, 0.3194968, 0.03151892, 0, 1, 0.854902, 1,
-0.03477059, 0.2541832, 0.7603322, 0, 1, 0.8627451, 1,
-0.03367253, -1.996279, -3.473671, 0, 1, 0.8666667, 1,
-0.02778917, -1.044082, -3.513484, 0, 1, 0.8745098, 1,
-0.02704499, 0.1116171, -0.4308046, 0, 1, 0.8784314, 1,
-0.02608752, 1.536635, 0.989261, 0, 1, 0.8862745, 1,
-0.02390147, -0.4833718, -1.422176, 0, 1, 0.8901961, 1,
-0.02284991, -1.008132, -2.593628, 0, 1, 0.8980392, 1,
-0.02257046, 2.133239, -0.8751348, 0, 1, 0.9058824, 1,
-0.02101179, -1.259229, -2.574524, 0, 1, 0.9098039, 1,
-0.01486208, 0.02610829, 1.07904, 0, 1, 0.9176471, 1,
-0.01481556, -2.233482, -1.548143, 0, 1, 0.9215686, 1,
-0.01382715, -0.7462322, -2.381849, 0, 1, 0.9294118, 1,
-0.01072123, 0.09104344, -1.571049, 0, 1, 0.9333333, 1,
-0.006961383, 0.7801176, 0.0762282, 0, 1, 0.9411765, 1,
-0.003857506, -0.1342039, -3.53788, 0, 1, 0.945098, 1,
-0.002190597, -0.6962466, -2.781024, 0, 1, 0.9529412, 1,
-0.001757474, -0.3704275, -3.203587, 0, 1, 0.9568627, 1,
-0.001097129, -0.5502267, -2.928737, 0, 1, 0.9647059, 1,
0.003357484, 0.5336339, -1.755048, 0, 1, 0.9686275, 1,
0.005644783, -0.04463442, 2.11005, 0, 1, 0.9764706, 1,
0.007637263, 0.2265624, -0.851891, 0, 1, 0.9803922, 1,
0.009341493, -0.9685904, 1.591133, 0, 1, 0.9882353, 1,
0.01096405, -1.354149, 3.095987, 0, 1, 0.9921569, 1,
0.0115231, -1.951142, 0.9289459, 0, 1, 1, 1,
0.01598811, 1.401353, -0.3241998, 0, 0.9921569, 1, 1,
0.0174264, 2.300544, -0.4879983, 0, 0.9882353, 1, 1,
0.02518933, 0.7541139, -0.7656619, 0, 0.9803922, 1, 1,
0.02533584, 2.560308, -0.6622482, 0, 0.9764706, 1, 1,
0.02622603, 0.1095165, 0.5029212, 0, 0.9686275, 1, 1,
0.0306039, 0.8314102, 2.683678, 0, 0.9647059, 1, 1,
0.03198741, 0.7153176, -0.08126017, 0, 0.9568627, 1, 1,
0.0323261, 0.7934949, -0.19089, 0, 0.9529412, 1, 1,
0.0374751, -0.6723558, 3.234741, 0, 0.945098, 1, 1,
0.03909414, 2.001684, -0.6422973, 0, 0.9411765, 1, 1,
0.04437248, 0.6880038, -1.686911, 0, 0.9333333, 1, 1,
0.04721573, -0.6371879, 3.336296, 0, 0.9294118, 1, 1,
0.04840295, -0.9301474, 2.600115, 0, 0.9215686, 1, 1,
0.05157145, -0.3526608, 3.900189, 0, 0.9176471, 1, 1,
0.05280001, 0.01519616, 1.580322, 0, 0.9098039, 1, 1,
0.05841887, 1.91865, -0.8712034, 0, 0.9058824, 1, 1,
0.07112321, -0.4355395, 2.542773, 0, 0.8980392, 1, 1,
0.07412096, 1.379428, -1.33648, 0, 0.8901961, 1, 1,
0.07600017, 0.419805, 0.1956163, 0, 0.8862745, 1, 1,
0.08315425, 0.3962953, 0.9880415, 0, 0.8784314, 1, 1,
0.08354472, -1.088137, 3.947242, 0, 0.8745098, 1, 1,
0.08557118, -0.4455204, 2.616598, 0, 0.8666667, 1, 1,
0.08618002, 0.5418097, 0.5845044, 0, 0.8627451, 1, 1,
0.08632568, 1.023723, -0.7728167, 0, 0.854902, 1, 1,
0.09220965, 0.1264507, 1.020442, 0, 0.8509804, 1, 1,
0.09790453, -0.4604164, 1.476849, 0, 0.8431373, 1, 1,
0.09877671, -0.2805097, 1.951382, 0, 0.8392157, 1, 1,
0.1008387, 1.150178, 1.245718, 0, 0.8313726, 1, 1,
0.1078037, 0.759764, 0.3996375, 0, 0.827451, 1, 1,
0.1099634, -0.6217849, 2.173899, 0, 0.8196079, 1, 1,
0.1216804, -1.01757, 3.805598, 0, 0.8156863, 1, 1,
0.1240627, 0.6589768, 1.672588, 0, 0.8078431, 1, 1,
0.1265056, 0.3235644, 0.3220572, 0, 0.8039216, 1, 1,
0.1292782, -0.24785, 2.199379, 0, 0.7960784, 1, 1,
0.1323657, -0.07939395, 2.77871, 0, 0.7882353, 1, 1,
0.1355568, -1.048818, 1.533957, 0, 0.7843137, 1, 1,
0.1382838, 0.3894354, -0.07131999, 0, 0.7764706, 1, 1,
0.1389621, 0.7137552, 0.952482, 0, 0.772549, 1, 1,
0.1396958, 0.6994299, 0.6297557, 0, 0.7647059, 1, 1,
0.1442183, -1.11028, 1.943889, 0, 0.7607843, 1, 1,
0.1464259, -1.569104, 2.992092, 0, 0.7529412, 1, 1,
0.1489563, 0.2528869, -0.09044893, 0, 0.7490196, 1, 1,
0.1504162, 0.6286889, -0.1572347, 0, 0.7411765, 1, 1,
0.1544436, 0.134682, 1.262854, 0, 0.7372549, 1, 1,
0.1548816, 0.07105784, -0.780045, 0, 0.7294118, 1, 1,
0.155559, 0.6250786, 2.78923, 0, 0.7254902, 1, 1,
0.1556943, -1.746019, 3.640156, 0, 0.7176471, 1, 1,
0.1601516, 0.5283404, -1.484751, 0, 0.7137255, 1, 1,
0.1608048, -0.9326462, 2.628052, 0, 0.7058824, 1, 1,
0.1629284, -0.7186102, 1.535425, 0, 0.6980392, 1, 1,
0.1646196, 2.946015, -1.341344, 0, 0.6941177, 1, 1,
0.1652966, -0.7533084, 4.068341, 0, 0.6862745, 1, 1,
0.1665753, -1.09641, 4.351838, 0, 0.682353, 1, 1,
0.1670699, 0.2768184, 1.286882, 0, 0.6745098, 1, 1,
0.1698021, 0.6965851, -0.9284753, 0, 0.6705883, 1, 1,
0.1746837, -1.056463, 3.312046, 0, 0.6627451, 1, 1,
0.1766428, -0.06403257, 3.166464, 0, 0.6588235, 1, 1,
0.1818251, -0.9618215, 2.849955, 0, 0.6509804, 1, 1,
0.1828322, -1.154384, 1.708508, 0, 0.6470588, 1, 1,
0.1857934, 0.8467084, -0.01552662, 0, 0.6392157, 1, 1,
0.1887503, 0.4719786, -0.06986756, 0, 0.6352941, 1, 1,
0.1888945, 1.137168, 0.4608626, 0, 0.627451, 1, 1,
0.1891535, 0.004039764, 1.79356, 0, 0.6235294, 1, 1,
0.1928306, -0.2034903, 1.82962, 0, 0.6156863, 1, 1,
0.1944384, 0.349138, 0.9412253, 0, 0.6117647, 1, 1,
0.1946657, -0.2526672, 2.255786, 0, 0.6039216, 1, 1,
0.1961947, -0.0495851, 2.74137, 0, 0.5960785, 1, 1,
0.1979528, -0.4117171, 3.484082, 0, 0.5921569, 1, 1,
0.1986535, -0.1187901, 0.7735574, 0, 0.5843138, 1, 1,
0.2028154, -2.144968, 0.7672616, 0, 0.5803922, 1, 1,
0.208695, -1.20904, 2.867933, 0, 0.572549, 1, 1,
0.2099105, -1.75343, 2.006095, 0, 0.5686275, 1, 1,
0.2110971, -0.133427, 0.8284875, 0, 0.5607843, 1, 1,
0.211168, 1.329504, -1.533379, 0, 0.5568628, 1, 1,
0.2126161, 1.867895, -2.299793, 0, 0.5490196, 1, 1,
0.2170029, 0.4927762, 0.2755938, 0, 0.5450981, 1, 1,
0.2176205, -2.011837, 2.973254, 0, 0.5372549, 1, 1,
0.2177151, -0.2304833, 1.881922, 0, 0.5333334, 1, 1,
0.2182997, -1.01876, 1.365574, 0, 0.5254902, 1, 1,
0.2185386, -1.088026, 3.227824, 0, 0.5215687, 1, 1,
0.2200416, 0.7273659, -0.2928333, 0, 0.5137255, 1, 1,
0.220969, 0.6433559, 0.8335972, 0, 0.509804, 1, 1,
0.2227615, -1.14395, 2.409455, 0, 0.5019608, 1, 1,
0.2245145, 0.7210354, 0.5392857, 0, 0.4941176, 1, 1,
0.2254696, 2.864296, 1.51375, 0, 0.4901961, 1, 1,
0.2321972, 0.8733979, 0.588055, 0, 0.4823529, 1, 1,
0.2332274, -0.3003154, 0.9695482, 0, 0.4784314, 1, 1,
0.2339464, -0.5896739, 2.237513, 0, 0.4705882, 1, 1,
0.234145, 0.1927156, -0.07985038, 0, 0.4666667, 1, 1,
0.2349391, 0.2573971, -0.225611, 0, 0.4588235, 1, 1,
0.2351453, -0.410537, 1.869125, 0, 0.454902, 1, 1,
0.2360463, -0.587025, 3.5782, 0, 0.4470588, 1, 1,
0.2360612, 1.389378, -2.622149, 0, 0.4431373, 1, 1,
0.2395649, -0.7678313, 1.067487, 0, 0.4352941, 1, 1,
0.2399146, -1.233204, 2.233956, 0, 0.4313726, 1, 1,
0.2404865, 1.854795, 0.3074464, 0, 0.4235294, 1, 1,
0.2525725, -0.8469418, 2.652027, 0, 0.4196078, 1, 1,
0.2574118, 0.010324, 2.184242, 0, 0.4117647, 1, 1,
0.2595801, 1.832148, 0.01063471, 0, 0.4078431, 1, 1,
0.2608529, -1.348958, 3.619731, 0, 0.4, 1, 1,
0.2610383, -0.2626519, 3.479663, 0, 0.3921569, 1, 1,
0.2677809, 0.459663, -0.07219373, 0, 0.3882353, 1, 1,
0.2713126, -0.9615274, 2.804895, 0, 0.3803922, 1, 1,
0.2724946, -0.8258249, 0.8700172, 0, 0.3764706, 1, 1,
0.2727223, -0.03541222, 1.879522, 0, 0.3686275, 1, 1,
0.2736003, 0.2795447, 1.111739, 0, 0.3647059, 1, 1,
0.2738705, 1.177952, 1.010959, 0, 0.3568628, 1, 1,
0.2777448, 0.4198001, -1.317496, 0, 0.3529412, 1, 1,
0.2861662, -1.151186, 3.695862, 0, 0.345098, 1, 1,
0.2959712, 0.2256619, 1.842975, 0, 0.3411765, 1, 1,
0.300335, 1.48959, -0.2451517, 0, 0.3333333, 1, 1,
0.3022619, -0.9178808, 1.976167, 0, 0.3294118, 1, 1,
0.303519, -0.8543835, 1.62647, 0, 0.3215686, 1, 1,
0.3055409, -0.5442998, 2.661805, 0, 0.3176471, 1, 1,
0.3114806, -0.5528906, 4.462725, 0, 0.3098039, 1, 1,
0.3206095, 0.8019753, -1.089823, 0, 0.3058824, 1, 1,
0.3230532, 0.4570262, -0.8173378, 0, 0.2980392, 1, 1,
0.323283, -0.0134771, 2.038954, 0, 0.2901961, 1, 1,
0.3242056, -0.4266851, 2.657763, 0, 0.2862745, 1, 1,
0.3343554, 2.231301, 0.1111864, 0, 0.2784314, 1, 1,
0.3371052, -0.1102638, 1.58696, 0, 0.2745098, 1, 1,
0.3379635, -0.3189489, 3.068708, 0, 0.2666667, 1, 1,
0.3612378, 0.2207264, 1.76032, 0, 0.2627451, 1, 1,
0.3666129, 0.3556169, 0.808381, 0, 0.254902, 1, 1,
0.3737599, 0.9852407, -1.429626, 0, 0.2509804, 1, 1,
0.3820949, -1.714766, 3.717017, 0, 0.2431373, 1, 1,
0.3825676, 0.622805, 1.181262, 0, 0.2392157, 1, 1,
0.3831889, -0.1744639, 2.912444, 0, 0.2313726, 1, 1,
0.3843755, 0.01249183, 2.56796, 0, 0.227451, 1, 1,
0.3904752, -0.3193949, 3.363329, 0, 0.2196078, 1, 1,
0.3928361, -0.3725978, 1.717507, 0, 0.2156863, 1, 1,
0.3938722, -0.4409003, 3.119881, 0, 0.2078431, 1, 1,
0.4007995, -0.4654388, 1.76843, 0, 0.2039216, 1, 1,
0.4014848, -0.4788614, 4.012757, 0, 0.1960784, 1, 1,
0.4048552, 1.652108, 1.109565, 0, 0.1882353, 1, 1,
0.4050749, -0.03475114, 0.7184548, 0, 0.1843137, 1, 1,
0.4105137, -0.6780777, 3.431879, 0, 0.1764706, 1, 1,
0.4112309, 0.07268406, 2.660002, 0, 0.172549, 1, 1,
0.4155936, 0.4857292, 0.4565346, 0, 0.1647059, 1, 1,
0.4218154, 1.040858, 2.051237, 0, 0.1607843, 1, 1,
0.4265156, 0.1175897, 0.1544621, 0, 0.1529412, 1, 1,
0.4275127, 0.1324863, 1.97653, 0, 0.1490196, 1, 1,
0.4331585, 0.8134451, 1.076703, 0, 0.1411765, 1, 1,
0.4341218, 1.044065, -0.05351757, 0, 0.1372549, 1, 1,
0.4353135, -0.7714747, 3.571332, 0, 0.1294118, 1, 1,
0.436295, 0.754459, 0.2877779, 0, 0.1254902, 1, 1,
0.4401028, 0.692635, 0.1387837, 0, 0.1176471, 1, 1,
0.440727, 0.4975668, 1.529592, 0, 0.1137255, 1, 1,
0.4425128, -1.33109, 0.2954665, 0, 0.1058824, 1, 1,
0.4445009, -0.1678134, 1.504339, 0, 0.09803922, 1, 1,
0.4446451, 0.771233, 0.03271066, 0, 0.09411765, 1, 1,
0.4447511, 0.7826352, -0.3791281, 0, 0.08627451, 1, 1,
0.4450359, -1.544479, 4.079809, 0, 0.08235294, 1, 1,
0.4468664, -0.03852462, 1.505757, 0, 0.07450981, 1, 1,
0.4489157, -0.5247196, 2.029008, 0, 0.07058824, 1, 1,
0.4508697, 0.2092965, 1.912968, 0, 0.0627451, 1, 1,
0.4515494, -1.604409, 2.307243, 0, 0.05882353, 1, 1,
0.4544181, -0.2552873, 1.788811, 0, 0.05098039, 1, 1,
0.4566821, -0.5288507, 2.160811, 0, 0.04705882, 1, 1,
0.4576452, 0.2178075, 2.073064, 0, 0.03921569, 1, 1,
0.4581231, -0.3553374, 1.342703, 0, 0.03529412, 1, 1,
0.4599745, -1.5829, 1.033982, 0, 0.02745098, 1, 1,
0.4629069, -0.211507, 0.8603516, 0, 0.02352941, 1, 1,
0.4648379, -1.514873, 3.580717, 0, 0.01568628, 1, 1,
0.4687028, 0.09137071, 2.532017, 0, 0.01176471, 1, 1,
0.4694704, 1.302099, 1.625579, 0, 0.003921569, 1, 1,
0.4698989, -0.6420862, 1.957168, 0.003921569, 0, 1, 1,
0.4772201, 1.442965, 0.8243058, 0.007843138, 0, 1, 1,
0.479097, -0.2994214, 1.841007, 0.01568628, 0, 1, 1,
0.4822749, -0.2737479, 1.615944, 0.01960784, 0, 1, 1,
0.482411, 0.2894484, 1.247085, 0.02745098, 0, 1, 1,
0.4825979, -0.7812435, 1.346091, 0.03137255, 0, 1, 1,
0.4835064, 0.5488672, 1.223307, 0.03921569, 0, 1, 1,
0.4847772, 0.3387115, -1.523486, 0.04313726, 0, 1, 1,
0.4916026, 0.5504213, 1.200773, 0.05098039, 0, 1, 1,
0.4945211, 0.5920451, -1.292456, 0.05490196, 0, 1, 1,
0.4981177, 1.308751, 0.3477566, 0.0627451, 0, 1, 1,
0.5014163, 0.8392221, -0.8028308, 0.06666667, 0, 1, 1,
0.5036533, 1.171255, 1.041587, 0.07450981, 0, 1, 1,
0.5066826, -0.09382042, 0.3907656, 0.07843138, 0, 1, 1,
0.514878, -0.8319021, 1.903126, 0.08627451, 0, 1, 1,
0.5192223, -1.841904, 3.309557, 0.09019608, 0, 1, 1,
0.5239596, 1.039436, 1.836164, 0.09803922, 0, 1, 1,
0.5249941, 1.308815, 0.5550256, 0.1058824, 0, 1, 1,
0.5291582, 2.050041, -0.4622383, 0.1098039, 0, 1, 1,
0.531162, 1.17579, 1.427569, 0.1176471, 0, 1, 1,
0.5393934, 1.537299, -0.5351874, 0.1215686, 0, 1, 1,
0.5416107, -1.91871, 3.188005, 0.1294118, 0, 1, 1,
0.5422791, -1.008915, 2.942155, 0.1333333, 0, 1, 1,
0.5434102, 0.6458392, 1.292599, 0.1411765, 0, 1, 1,
0.5440951, -1.301046, 1.888117, 0.145098, 0, 1, 1,
0.5464137, 0.4386469, 1.401871, 0.1529412, 0, 1, 1,
0.5466588, 0.5124994, 1.342158, 0.1568628, 0, 1, 1,
0.5478077, -0.9506561, 3.675251, 0.1647059, 0, 1, 1,
0.5483137, 0.09364827, 0.7989343, 0.1686275, 0, 1, 1,
0.5488361, -0.4183961, 2.930466, 0.1764706, 0, 1, 1,
0.5489109, 0.1706934, 3.150676, 0.1803922, 0, 1, 1,
0.5500101, 1.999249, 0.2347053, 0.1882353, 0, 1, 1,
0.5511085, 1.378439, 0.9897794, 0.1921569, 0, 1, 1,
0.5534348, -0.9045154, 3.529208, 0.2, 0, 1, 1,
0.5569736, -0.8583837, 2.537534, 0.2078431, 0, 1, 1,
0.5571412, -0.558378, 2.522205, 0.2117647, 0, 1, 1,
0.558829, 0.8120978, -0.2982896, 0.2196078, 0, 1, 1,
0.5591103, -2.528253, 3.307619, 0.2235294, 0, 1, 1,
0.5607647, -0.3560731, 1.321675, 0.2313726, 0, 1, 1,
0.5642642, -1.117996, 3.334535, 0.2352941, 0, 1, 1,
0.5707334, -1.053731, 0.5174839, 0.2431373, 0, 1, 1,
0.5714081, -2.026929, 2.806815, 0.2470588, 0, 1, 1,
0.5724605, -1.725077, 3.305081, 0.254902, 0, 1, 1,
0.5728998, 1.071598, 0.446216, 0.2588235, 0, 1, 1,
0.574969, -0.8642016, 2.024343, 0.2666667, 0, 1, 1,
0.5769319, -0.3188126, 1.811767, 0.2705882, 0, 1, 1,
0.5773486, -0.1930702, 1.417196, 0.2784314, 0, 1, 1,
0.5777884, 0.7107589, 1.188864, 0.282353, 0, 1, 1,
0.5861874, -0.1543683, 0.399893, 0.2901961, 0, 1, 1,
0.5913823, 1.16036, -1.020661, 0.2941177, 0, 1, 1,
0.5943215, 0.006658468, 1.946022, 0.3019608, 0, 1, 1,
0.5945088, 1.093067, 0.6113833, 0.3098039, 0, 1, 1,
0.5960037, 0.8514825, 1.450814, 0.3137255, 0, 1, 1,
0.5992895, -0.323236, 1.514243, 0.3215686, 0, 1, 1,
0.6026593, -0.996432, 2.911293, 0.3254902, 0, 1, 1,
0.6042704, 0.7788116, 1.829755, 0.3333333, 0, 1, 1,
0.6078949, 0.1421538, 0.5845405, 0.3372549, 0, 1, 1,
0.6104532, -0.07196198, 0.6666043, 0.345098, 0, 1, 1,
0.6116196, 0.07625935, 2.833908, 0.3490196, 0, 1, 1,
0.6185215, -1.072581, 2.649784, 0.3568628, 0, 1, 1,
0.6220152, 0.2031984, 0.9072274, 0.3607843, 0, 1, 1,
0.6270465, 1.42404, 1.568104, 0.3686275, 0, 1, 1,
0.62746, -1.771202, 4.214589, 0.372549, 0, 1, 1,
0.6307462, -0.4056838, 3.637369, 0.3803922, 0, 1, 1,
0.6338634, -0.4705538, 2.572514, 0.3843137, 0, 1, 1,
0.6384618, 0.8188421, -0.6196202, 0.3921569, 0, 1, 1,
0.6441254, 1.911488, -0.7329366, 0.3960784, 0, 1, 1,
0.6493988, 0.3200552, 1.121634, 0.4039216, 0, 1, 1,
0.6505179, -1.663481, 2.576365, 0.4117647, 0, 1, 1,
0.6587486, -0.1494041, -0.2374045, 0.4156863, 0, 1, 1,
0.6598902, 0.1420156, 1.269407, 0.4235294, 0, 1, 1,
0.6606426, 0.5385314, 0.3797635, 0.427451, 0, 1, 1,
0.6641325, -0.9802155, 1.854012, 0.4352941, 0, 1, 1,
0.6642004, -1.989906, 2.194325, 0.4392157, 0, 1, 1,
0.6716023, -1.870246, 2.221672, 0.4470588, 0, 1, 1,
0.6754102, 1.286192, -1.0115, 0.4509804, 0, 1, 1,
0.677375, -0.1890459, 2.650418, 0.4588235, 0, 1, 1,
0.6775023, -1.266003, 2.159145, 0.4627451, 0, 1, 1,
0.6788493, 0.0155019, 1.143792, 0.4705882, 0, 1, 1,
0.6795134, 0.3379867, 0.4308828, 0.4745098, 0, 1, 1,
0.680361, -0.8644873, 3.315565, 0.4823529, 0, 1, 1,
0.6809239, 0.889226, 0.9788328, 0.4862745, 0, 1, 1,
0.6817554, 0.2345025, 1.510314, 0.4941176, 0, 1, 1,
0.6875926, 1.104839, 0.8620237, 0.5019608, 0, 1, 1,
0.6898581, -0.6353211, 1.199934, 0.5058824, 0, 1, 1,
0.692597, 0.3311341, 0.8479302, 0.5137255, 0, 1, 1,
0.6997256, 1.699837, 1.514173, 0.5176471, 0, 1, 1,
0.7001876, 0.2339599, 1.384068, 0.5254902, 0, 1, 1,
0.701186, -0.6696032, 2.460685, 0.5294118, 0, 1, 1,
0.7052481, -0.1676722, 3.089945, 0.5372549, 0, 1, 1,
0.7102062, 1.525258, 0.1752166, 0.5411765, 0, 1, 1,
0.7142823, -0.2130135, 2.194293, 0.5490196, 0, 1, 1,
0.7165428, 0.1925693, 0.2712436, 0.5529412, 0, 1, 1,
0.7207328, -0.9687045, 2.02522, 0.5607843, 0, 1, 1,
0.7339476, 1.116332, 1.704201, 0.5647059, 0, 1, 1,
0.7450331, -0.04665431, 1.617362, 0.572549, 0, 1, 1,
0.7451994, -0.0200512, 0.887363, 0.5764706, 0, 1, 1,
0.7478895, -1.0324, 5.056612, 0.5843138, 0, 1, 1,
0.7553518, 0.1255526, 1.83455, 0.5882353, 0, 1, 1,
0.7562111, 0.3744731, 0.7803558, 0.5960785, 0, 1, 1,
0.7626699, 0.4532097, 2.798704, 0.6039216, 0, 1, 1,
0.7790934, 0.505007, 2.533716, 0.6078432, 0, 1, 1,
0.7811976, -2.325574, 4.033843, 0.6156863, 0, 1, 1,
0.7823559, 0.01402021, 0.9411055, 0.6196079, 0, 1, 1,
0.7945275, 0.1880671, -0.1873076, 0.627451, 0, 1, 1,
0.7950791, 1.974979, 0.8420392, 0.6313726, 0, 1, 1,
0.7957937, 0.4472274, -1.449941, 0.6392157, 0, 1, 1,
0.7985708, 0.1490618, 1.070982, 0.6431373, 0, 1, 1,
0.7999845, 0.2369361, 0.5682641, 0.6509804, 0, 1, 1,
0.8007819, 0.7538788, 0.6330671, 0.654902, 0, 1, 1,
0.8010941, 0.7153541, 2.851794, 0.6627451, 0, 1, 1,
0.8014207, -2.929589, 1.424288, 0.6666667, 0, 1, 1,
0.8041693, -0.4637405, 2.629246, 0.6745098, 0, 1, 1,
0.807852, -0.8636255, 1.789649, 0.6784314, 0, 1, 1,
0.8145463, 0.6449053, 0.3253104, 0.6862745, 0, 1, 1,
0.8174406, -0.5054859, 2.444777, 0.6901961, 0, 1, 1,
0.8191037, -0.3722597, 2.270043, 0.6980392, 0, 1, 1,
0.8193496, 0.4303956, 2.017324, 0.7058824, 0, 1, 1,
0.8241144, -0.8633859, 1.028399, 0.7098039, 0, 1, 1,
0.826474, 0.8359039, -0.6951436, 0.7176471, 0, 1, 1,
0.8266124, 0.4739724, 0.07377906, 0.7215686, 0, 1, 1,
0.8269895, 0.1490246, -0.8066483, 0.7294118, 0, 1, 1,
0.8317978, 1.501855, -0.4226432, 0.7333333, 0, 1, 1,
0.8439702, -0.5131668, 1.187448, 0.7411765, 0, 1, 1,
0.847183, 0.3990274, 1.881582, 0.7450981, 0, 1, 1,
0.8512244, -1.028103, 4.175986, 0.7529412, 0, 1, 1,
0.8515665, 1.544402, 2.519845, 0.7568628, 0, 1, 1,
0.8579702, 0.5244251, 1.874766, 0.7647059, 0, 1, 1,
0.8587703, -2.512697, 2.346142, 0.7686275, 0, 1, 1,
0.8645852, -0.2945183, 1.151722, 0.7764706, 0, 1, 1,
0.8661802, -1.34106, 1.160488, 0.7803922, 0, 1, 1,
0.8706661, 1.704009, -0.02041214, 0.7882353, 0, 1, 1,
0.8743541, 0.3594576, 1.6855, 0.7921569, 0, 1, 1,
0.8783327, -1.100243, 2.939754, 0.8, 0, 1, 1,
0.8816716, -0.5797208, 0.2387834, 0.8078431, 0, 1, 1,
0.8825503, 0.4125273, 3.607565, 0.8117647, 0, 1, 1,
0.885259, 0.0309191, 0.5494128, 0.8196079, 0, 1, 1,
0.8879447, -0.4175924, 2.306181, 0.8235294, 0, 1, 1,
0.8899041, 0.05201226, 2.104128, 0.8313726, 0, 1, 1,
0.8946317, 0.1048326, 0.5621474, 0.8352941, 0, 1, 1,
0.8947352, -0.8752492, 1.619807, 0.8431373, 0, 1, 1,
0.897097, -0.5369645, 3.554471, 0.8470588, 0, 1, 1,
0.9029642, -0.9216567, 3.228441, 0.854902, 0, 1, 1,
0.9031781, 1.388626, -0.6920635, 0.8588235, 0, 1, 1,
0.9032395, -1.517034, 1.571733, 0.8666667, 0, 1, 1,
0.9042799, -0.162643, 1.905515, 0.8705882, 0, 1, 1,
0.9058737, 2.218581, 0.4793956, 0.8784314, 0, 1, 1,
0.9086578, 1.72326, 0.0434609, 0.8823529, 0, 1, 1,
0.910032, -0.479569, 1.775606, 0.8901961, 0, 1, 1,
0.913664, -0.179015, -0.2380551, 0.8941177, 0, 1, 1,
0.914111, -0.2258933, 1.785775, 0.9019608, 0, 1, 1,
0.916827, -0.3679539, 3.209289, 0.9098039, 0, 1, 1,
0.9191022, 0.4904418, 0.5870726, 0.9137255, 0, 1, 1,
0.9254689, 0.2622417, 0.6527923, 0.9215686, 0, 1, 1,
0.9255481, -0.4741481, 3.516146, 0.9254902, 0, 1, 1,
0.9274009, -0.659758, 1.241553, 0.9333333, 0, 1, 1,
0.929728, -0.1040952, 3.547928, 0.9372549, 0, 1, 1,
0.934393, -0.01294435, 2.098046, 0.945098, 0, 1, 1,
0.9386317, 0.2776909, 3.218645, 0.9490196, 0, 1, 1,
0.9408907, 0.6941051, 0.4160601, 0.9568627, 0, 1, 1,
0.9413692, 0.06185632, 3.826759, 0.9607843, 0, 1, 1,
0.9438967, 1.883432, -0.2966715, 0.9686275, 0, 1, 1,
0.9440449, -0.2471559, 2.879674, 0.972549, 0, 1, 1,
0.9449416, 0.5441142, 4.274668, 0.9803922, 0, 1, 1,
0.9458846, 0.6909809, 1.18346, 0.9843137, 0, 1, 1,
0.9468509, 0.1609712, 2.229533, 0.9921569, 0, 1, 1,
0.9515222, -0.9754795, 3.698648, 0.9960784, 0, 1, 1,
0.9566542, 0.4835747, -0.6234429, 1, 0, 0.9960784, 1,
0.9619582, -1.417104, 1.64221, 1, 0, 0.9882353, 1,
0.964455, -1.499783, 3.852918, 1, 0, 0.9843137, 1,
0.967138, -0.3306752, 3.005435, 1, 0, 0.9764706, 1,
0.9676023, -0.03279474, 2.086461, 1, 0, 0.972549, 1,
0.9692605, 1.354365, -1.279866, 1, 0, 0.9647059, 1,
0.9702536, -0.07037173, 1.716394, 1, 0, 0.9607843, 1,
0.9784641, 0.5541093, 0.8560498, 1, 0, 0.9529412, 1,
0.9842978, -3.370999, 1.37162, 1, 0, 0.9490196, 1,
0.9880489, 0.04704739, 1.795061, 1, 0, 0.9411765, 1,
0.9896036, 0.2698512, 2.150671, 1, 0, 0.9372549, 1,
0.9913352, 0.3012542, 2.027259, 1, 0, 0.9294118, 1,
0.9996772, -1.684156, 2.7809, 1, 0, 0.9254902, 1,
1.000751, -2.403442, 3.462221, 1, 0, 0.9176471, 1,
1.001679, 0.7971125, 0.9518259, 1, 0, 0.9137255, 1,
1.005215, 0.4273376, 1.457281, 1, 0, 0.9058824, 1,
1.005655, 0.7597583, 0.8011805, 1, 0, 0.9019608, 1,
1.00635, 0.8534408, 1.61533, 1, 0, 0.8941177, 1,
1.007428, -1.273069, 2.445948, 1, 0, 0.8862745, 1,
1.012413, -2.049006, 3.024937, 1, 0, 0.8823529, 1,
1.017916, 0.331733, 1.856073, 1, 0, 0.8745098, 1,
1.024591, -1.222648, 2.798218, 1, 0, 0.8705882, 1,
1.026116, -0.226677, 3.295371, 1, 0, 0.8627451, 1,
1.027991, -1.603726, 2.500113, 1, 0, 0.8588235, 1,
1.030385, -1.341018, 2.094486, 1, 0, 0.8509804, 1,
1.032844, -0.1924595, 3.568676, 1, 0, 0.8470588, 1,
1.034375, -0.8602244, 2.493303, 1, 0, 0.8392157, 1,
1.035858, -0.603833, 2.731111, 1, 0, 0.8352941, 1,
1.040233, -0.03206043, -0.5136248, 1, 0, 0.827451, 1,
1.048518, -0.4604928, 1.292128, 1, 0, 0.8235294, 1,
1.052534, 0.3881259, 0.1503288, 1, 0, 0.8156863, 1,
1.060489, -2.905064, 4.4848, 1, 0, 0.8117647, 1,
1.066276, -1.306397, 3.102593, 1, 0, 0.8039216, 1,
1.066497, -1.086675, 1.048293, 1, 0, 0.7960784, 1,
1.068028, -1.170773, 4.180212, 1, 0, 0.7921569, 1,
1.072567, 0.5324869, -0.3122894, 1, 0, 0.7843137, 1,
1.073883, -0.6033555, 4.615644, 1, 0, 0.7803922, 1,
1.074623, 0.9733748, 0.1890765, 1, 0, 0.772549, 1,
1.080756, 0.002876923, 1.252295, 1, 0, 0.7686275, 1,
1.082429, 0.5457787, 0.3340387, 1, 0, 0.7607843, 1,
1.087973, -1.405527, 4.064874, 1, 0, 0.7568628, 1,
1.092649, -0.6449491, 2.611619, 1, 0, 0.7490196, 1,
1.097229, 1.73591, 0.1212414, 1, 0, 0.7450981, 1,
1.101095, -0.4604048, 2.242112, 1, 0, 0.7372549, 1,
1.105643, -0.953855, 2.077034, 1, 0, 0.7333333, 1,
1.10646, 0.9366277, 2.409385, 1, 0, 0.7254902, 1,
1.108997, -1.681366, 3.553693, 1, 0, 0.7215686, 1,
1.11363, -0.9290456, 2.604767, 1, 0, 0.7137255, 1,
1.127303, 1.14319, 1.431371, 1, 0, 0.7098039, 1,
1.130499, 0.1180232, 0.2172377, 1, 0, 0.7019608, 1,
1.139733, 0.06725056, 1.511958, 1, 0, 0.6941177, 1,
1.13994, 0.4881326, 1.647008, 1, 0, 0.6901961, 1,
1.14171, -1.103577, 3.564652, 1, 0, 0.682353, 1,
1.141748, -1.616098, 3.81334, 1, 0, 0.6784314, 1,
1.152326, 0.5049345, 0.1665762, 1, 0, 0.6705883, 1,
1.154781, -0.7096198, 1.831409, 1, 0, 0.6666667, 1,
1.175446, 2.152637, 1.483394, 1, 0, 0.6588235, 1,
1.181595, -0.7854506, 2.941302, 1, 0, 0.654902, 1,
1.184241, -2.258319, 3.003766, 1, 0, 0.6470588, 1,
1.188057, 1.248962, -1.51198, 1, 0, 0.6431373, 1,
1.193519, 0.3556806, -1.319781, 1, 0, 0.6352941, 1,
1.196025, 0.2911994, 1.744686, 1, 0, 0.6313726, 1,
1.196739, 0.3053373, 2.381099, 1, 0, 0.6235294, 1,
1.196913, -0.7733654, 2.15916, 1, 0, 0.6196079, 1,
1.202635, -1.027032, 1.594209, 1, 0, 0.6117647, 1,
1.203879, 0.4325855, 2.954247, 1, 0, 0.6078432, 1,
1.220294, 1.784523, 1.577069, 1, 0, 0.6, 1,
1.222652, 0.2552544, 1.526157, 1, 0, 0.5921569, 1,
1.227956, 1.124097, 0.5202894, 1, 0, 0.5882353, 1,
1.229155, -2.69961, 3.011985, 1, 0, 0.5803922, 1,
1.229272, -0.5431877, 1.238815, 1, 0, 0.5764706, 1,
1.240517, -1.306152, 2.9556, 1, 0, 0.5686275, 1,
1.241274, -1.333135, 4.446549, 1, 0, 0.5647059, 1,
1.242655, 2.560697, 0.7156754, 1, 0, 0.5568628, 1,
1.268803, -2.143197, 2.609826, 1, 0, 0.5529412, 1,
1.274008, -0.6237165, 1.527157, 1, 0, 0.5450981, 1,
1.277556, -0.7646366, 3.01145, 1, 0, 0.5411765, 1,
1.284486, -0.5888445, 3.667189, 1, 0, 0.5333334, 1,
1.285365, -0.343926, 1.62445, 1, 0, 0.5294118, 1,
1.306128, -0.9093475, 2.192165, 1, 0, 0.5215687, 1,
1.316101, 0.353833, 2.004988, 1, 0, 0.5176471, 1,
1.33696, 0.1932445, -0.5115969, 1, 0, 0.509804, 1,
1.338117, 0.353981, 0.1992829, 1, 0, 0.5058824, 1,
1.344322, -0.4158413, 2.145126, 1, 0, 0.4980392, 1,
1.359052, 1.253711, 0.9787502, 1, 0, 0.4901961, 1,
1.359808, -0.1771449, 1.434915, 1, 0, 0.4862745, 1,
1.361908, -0.4716332, 1.859721, 1, 0, 0.4784314, 1,
1.379559, -0.5861098, 0.2287838, 1, 0, 0.4745098, 1,
1.382052, -0.1143652, 1.206287, 1, 0, 0.4666667, 1,
1.383255, -0.9375538, 2.320234, 1, 0, 0.4627451, 1,
1.405056, 0.2115698, 2.056818, 1, 0, 0.454902, 1,
1.405313, 1.503924, -0.014529, 1, 0, 0.4509804, 1,
1.412094, -1.6172, 3.51872, 1, 0, 0.4431373, 1,
1.412662, 0.093056, 0.6042105, 1, 0, 0.4392157, 1,
1.420576, 0.9149075, 0.0419082, 1, 0, 0.4313726, 1,
1.43336, 0.6634955, 0.08048016, 1, 0, 0.427451, 1,
1.433459, 0.720138, -0.5335069, 1, 0, 0.4196078, 1,
1.437852, -0.9391068, 2.171444, 1, 0, 0.4156863, 1,
1.44511, -0.9266696, 1.726886, 1, 0, 0.4078431, 1,
1.445181, 0.9417174, 1.979252, 1, 0, 0.4039216, 1,
1.447635, 0.1923082, 1.89318, 1, 0, 0.3960784, 1,
1.449246, -0.7222517, 0.9531243, 1, 0, 0.3882353, 1,
1.449486, -1.115757, 2.73473, 1, 0, 0.3843137, 1,
1.456006, 0.03680621, 1.317008, 1, 0, 0.3764706, 1,
1.463986, -0.352444, 2.207032, 1, 0, 0.372549, 1,
1.483586, 1.72067, -0.8837014, 1, 0, 0.3647059, 1,
1.490575, -2.039291, 4.604163, 1, 0, 0.3607843, 1,
1.492267, -0.7122723, 2.757707, 1, 0, 0.3529412, 1,
1.503831, 0.2638594, 2.800148, 1, 0, 0.3490196, 1,
1.528775, 0.2406924, 1.80681, 1, 0, 0.3411765, 1,
1.541405, -1.677569, 1.718528, 1, 0, 0.3372549, 1,
1.545739, 0.3351391, 1.362425, 1, 0, 0.3294118, 1,
1.549389, 1.535264, 1.28245, 1, 0, 0.3254902, 1,
1.569459, 0.3687036, 0.2875968, 1, 0, 0.3176471, 1,
1.569608, -0.8421322, 2.054361, 1, 0, 0.3137255, 1,
1.571704, -0.2704576, 0.9026988, 1, 0, 0.3058824, 1,
1.574639, -0.03308061, 2.600395, 1, 0, 0.2980392, 1,
1.579527, 0.2964518, 1.316988, 1, 0, 0.2941177, 1,
1.591801, -0.5946087, 0.491438, 1, 0, 0.2862745, 1,
1.593843, -1.24245, 1.318995, 1, 0, 0.282353, 1,
1.59626, -1.610736, 2.368319, 1, 0, 0.2745098, 1,
1.609378, 1.109323, 1.910391, 1, 0, 0.2705882, 1,
1.619305, 0.4111763, 0.800706, 1, 0, 0.2627451, 1,
1.623721, -0.1585587, 1.845516, 1, 0, 0.2588235, 1,
1.624556, -0.2639516, 1.400138, 1, 0, 0.2509804, 1,
1.670529, -0.2690828, 0.9453701, 1, 0, 0.2470588, 1,
1.673929, -1.183288, 1.587651, 1, 0, 0.2392157, 1,
1.69096, 0.2778014, 2.241671, 1, 0, 0.2352941, 1,
1.691914, -1.593786, 1.637394, 1, 0, 0.227451, 1,
1.775723, 0.3011178, 0.8584833, 1, 0, 0.2235294, 1,
1.776125, -1.147233, 3.081327, 1, 0, 0.2156863, 1,
1.778397, -0.407667, 1.206349, 1, 0, 0.2117647, 1,
1.794331, 1.615228, -0.5610605, 1, 0, 0.2039216, 1,
1.80558, -0.2955942, 0.2662821, 1, 0, 0.1960784, 1,
1.82362, 0.4575919, 0.5242175, 1, 0, 0.1921569, 1,
1.831799, -0.5890033, 2.784096, 1, 0, 0.1843137, 1,
1.83459, 0.3872009, 0.6837731, 1, 0, 0.1803922, 1,
1.837107, 0.3519812, 1.286263, 1, 0, 0.172549, 1,
1.846393, 0.6082509, 1.961454, 1, 0, 0.1686275, 1,
1.866767, 1.559044, 1.446459, 1, 0, 0.1607843, 1,
1.906957, 0.3011529, 1.349093, 1, 0, 0.1568628, 1,
1.910285, -0.7380509, 1.842625, 1, 0, 0.1490196, 1,
1.915048, -0.1668918, 1.704948, 1, 0, 0.145098, 1,
1.967359, -0.4284561, 3.75129, 1, 0, 0.1372549, 1,
1.975024, -0.1952917, 2.763404, 1, 0, 0.1333333, 1,
1.975515, 0.8502862, -0.1837263, 1, 0, 0.1254902, 1,
1.976764, -1.973199, 2.459184, 1, 0, 0.1215686, 1,
1.977535, -0.7120908, 1.164418, 1, 0, 0.1137255, 1,
2.006787, -1.526809, 3.282172, 1, 0, 0.1098039, 1,
2.041227, -0.390176, 0.8919526, 1, 0, 0.1019608, 1,
2.059517, -0.3259742, 1.105157, 1, 0, 0.09411765, 1,
2.065673, 0.6394309, 2.934685, 1, 0, 0.09019608, 1,
2.105196, -0.9637639, 1.991885, 1, 0, 0.08235294, 1,
2.13026, 1.327647, 0.1896299, 1, 0, 0.07843138, 1,
2.161416, 0.9769655, 2.152275, 1, 0, 0.07058824, 1,
2.177186, -0.3123361, 1.589121, 1, 0, 0.06666667, 1,
2.180895, 2.037077, 1.288235, 1, 0, 0.05882353, 1,
2.36662, -0.7594957, 1.345122, 1, 0, 0.05490196, 1,
2.394481, 0.5390818, 0.5637513, 1, 0, 0.04705882, 1,
2.406658, 0.3486923, 1.264506, 1, 0, 0.04313726, 1,
2.487782, -1.36471, 2.352667, 1, 0, 0.03529412, 1,
2.521498, 0.1863915, 0.4280873, 1, 0, 0.03137255, 1,
2.539081, -0.2316946, 2.638851, 1, 0, 0.02352941, 1,
2.702737, 1.348595, 2.056101, 1, 0, 0.01960784, 1,
2.910207, 0.3350984, 0.8085747, 1, 0, 0.01176471, 1,
3.134291, 0.1813783, 0.5533285, 1, 0, 0.007843138, 1
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
0.1423489, -4.441733, -7.587546, 0, -0.5, 0.5, 0.5,
0.1423489, -4.441733, -7.587546, 1, -0.5, 0.5, 0.5,
0.1423489, -4.441733, -7.587546, 1, 1.5, 0.5, 0.5,
0.1423489, -4.441733, -7.587546, 0, 1.5, 0.5, 0.5
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
-3.863862, -0.212492, -7.587546, 0, -0.5, 0.5, 0.5,
-3.863862, -0.212492, -7.587546, 1, -0.5, 0.5, 0.5,
-3.863862, -0.212492, -7.587546, 1, 1.5, 0.5, 0.5,
-3.863862, -0.212492, -7.587546, 0, 1.5, 0.5, 0.5
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
-3.863862, -4.441733, -0.3491848, 0, -0.5, 0.5, 0.5,
-3.863862, -4.441733, -0.3491848, 1, -0.5, 0.5, 0.5,
-3.863862, -4.441733, -0.3491848, 1, 1.5, 0.5, 0.5,
-3.863862, -4.441733, -0.3491848, 0, 1.5, 0.5, 0.5
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
-2, -3.465755, -5.917155,
3, -3.465755, -5.917155,
-2, -3.465755, -5.917155,
-2, -3.628418, -6.195553,
-1, -3.465755, -5.917155,
-1, -3.628418, -6.195553,
0, -3.465755, -5.917155,
0, -3.628418, -6.195553,
1, -3.465755, -5.917155,
1, -3.628418, -6.195553,
2, -3.465755, -5.917155,
2, -3.628418, -6.195553,
3, -3.465755, -5.917155,
3, -3.628418, -6.195553
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
-2, -3.953744, -6.75235, 0, -0.5, 0.5, 0.5,
-2, -3.953744, -6.75235, 1, -0.5, 0.5, 0.5,
-2, -3.953744, -6.75235, 1, 1.5, 0.5, 0.5,
-2, -3.953744, -6.75235, 0, 1.5, 0.5, 0.5,
-1, -3.953744, -6.75235, 0, -0.5, 0.5, 0.5,
-1, -3.953744, -6.75235, 1, -0.5, 0.5, 0.5,
-1, -3.953744, -6.75235, 1, 1.5, 0.5, 0.5,
-1, -3.953744, -6.75235, 0, 1.5, 0.5, 0.5,
0, -3.953744, -6.75235, 0, -0.5, 0.5, 0.5,
0, -3.953744, -6.75235, 1, -0.5, 0.5, 0.5,
0, -3.953744, -6.75235, 1, 1.5, 0.5, 0.5,
0, -3.953744, -6.75235, 0, 1.5, 0.5, 0.5,
1, -3.953744, -6.75235, 0, -0.5, 0.5, 0.5,
1, -3.953744, -6.75235, 1, -0.5, 0.5, 0.5,
1, -3.953744, -6.75235, 1, 1.5, 0.5, 0.5,
1, -3.953744, -6.75235, 0, 1.5, 0.5, 0.5,
2, -3.953744, -6.75235, 0, -0.5, 0.5, 0.5,
2, -3.953744, -6.75235, 1, -0.5, 0.5, 0.5,
2, -3.953744, -6.75235, 1, 1.5, 0.5, 0.5,
2, -3.953744, -6.75235, 0, 1.5, 0.5, 0.5,
3, -3.953744, -6.75235, 0, -0.5, 0.5, 0.5,
3, -3.953744, -6.75235, 1, -0.5, 0.5, 0.5,
3, -3.953744, -6.75235, 1, 1.5, 0.5, 0.5,
3, -3.953744, -6.75235, 0, 1.5, 0.5, 0.5
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
-2.939352, -3, -5.917155,
-2.939352, 2, -5.917155,
-2.939352, -3, -5.917155,
-3.093437, -3, -6.195553,
-2.939352, -2, -5.917155,
-3.093437, -2, -6.195553,
-2.939352, -1, -5.917155,
-3.093437, -1, -6.195553,
-2.939352, 0, -5.917155,
-3.093437, 0, -6.195553,
-2.939352, 1, -5.917155,
-3.093437, 1, -6.195553,
-2.939352, 2, -5.917155,
-3.093437, 2, -6.195553
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
-3.401607, -3, -6.75235, 0, -0.5, 0.5, 0.5,
-3.401607, -3, -6.75235, 1, -0.5, 0.5, 0.5,
-3.401607, -3, -6.75235, 1, 1.5, 0.5, 0.5,
-3.401607, -3, -6.75235, 0, 1.5, 0.5, 0.5,
-3.401607, -2, -6.75235, 0, -0.5, 0.5, 0.5,
-3.401607, -2, -6.75235, 1, -0.5, 0.5, 0.5,
-3.401607, -2, -6.75235, 1, 1.5, 0.5, 0.5,
-3.401607, -2, -6.75235, 0, 1.5, 0.5, 0.5,
-3.401607, -1, -6.75235, 0, -0.5, 0.5, 0.5,
-3.401607, -1, -6.75235, 1, -0.5, 0.5, 0.5,
-3.401607, -1, -6.75235, 1, 1.5, 0.5, 0.5,
-3.401607, -1, -6.75235, 0, 1.5, 0.5, 0.5,
-3.401607, 0, -6.75235, 0, -0.5, 0.5, 0.5,
-3.401607, 0, -6.75235, 1, -0.5, 0.5, 0.5,
-3.401607, 0, -6.75235, 1, 1.5, 0.5, 0.5,
-3.401607, 0, -6.75235, 0, 1.5, 0.5, 0.5,
-3.401607, 1, -6.75235, 0, -0.5, 0.5, 0.5,
-3.401607, 1, -6.75235, 1, -0.5, 0.5, 0.5,
-3.401607, 1, -6.75235, 1, 1.5, 0.5, 0.5,
-3.401607, 1, -6.75235, 0, 1.5, 0.5, 0.5,
-3.401607, 2, -6.75235, 0, -0.5, 0.5, 0.5,
-3.401607, 2, -6.75235, 1, -0.5, 0.5, 0.5,
-3.401607, 2, -6.75235, 1, 1.5, 0.5, 0.5,
-3.401607, 2, -6.75235, 0, 1.5, 0.5, 0.5
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
-2.939352, -3.465755, -4,
-2.939352, -3.465755, 4,
-2.939352, -3.465755, -4,
-3.093437, -3.628418, -4,
-2.939352, -3.465755, -2,
-3.093437, -3.628418, -2,
-2.939352, -3.465755, 0,
-3.093437, -3.628418, 0,
-2.939352, -3.465755, 2,
-3.093437, -3.628418, 2,
-2.939352, -3.465755, 4,
-3.093437, -3.628418, 4
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
-3.401607, -3.953744, -4, 0, -0.5, 0.5, 0.5,
-3.401607, -3.953744, -4, 1, -0.5, 0.5, 0.5,
-3.401607, -3.953744, -4, 1, 1.5, 0.5, 0.5,
-3.401607, -3.953744, -4, 0, 1.5, 0.5, 0.5,
-3.401607, -3.953744, -2, 0, -0.5, 0.5, 0.5,
-3.401607, -3.953744, -2, 1, -0.5, 0.5, 0.5,
-3.401607, -3.953744, -2, 1, 1.5, 0.5, 0.5,
-3.401607, -3.953744, -2, 0, 1.5, 0.5, 0.5,
-3.401607, -3.953744, 0, 0, -0.5, 0.5, 0.5,
-3.401607, -3.953744, 0, 1, -0.5, 0.5, 0.5,
-3.401607, -3.953744, 0, 1, 1.5, 0.5, 0.5,
-3.401607, -3.953744, 0, 0, 1.5, 0.5, 0.5,
-3.401607, -3.953744, 2, 0, -0.5, 0.5, 0.5,
-3.401607, -3.953744, 2, 1, -0.5, 0.5, 0.5,
-3.401607, -3.953744, 2, 1, 1.5, 0.5, 0.5,
-3.401607, -3.953744, 2, 0, 1.5, 0.5, 0.5,
-3.401607, -3.953744, 4, 0, -0.5, 0.5, 0.5,
-3.401607, -3.953744, 4, 1, -0.5, 0.5, 0.5,
-3.401607, -3.953744, 4, 1, 1.5, 0.5, 0.5,
-3.401607, -3.953744, 4, 0, 1.5, 0.5, 0.5
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
-2.939352, -3.465755, -5.917155,
-2.939352, 3.040771, -5.917155,
-2.939352, -3.465755, 5.218785,
-2.939352, 3.040771, 5.218785,
-2.939352, -3.465755, -5.917155,
-2.939352, -3.465755, 5.218785,
-2.939352, 3.040771, -5.917155,
-2.939352, 3.040771, 5.218785,
-2.939352, -3.465755, -5.917155,
3.22405, -3.465755, -5.917155,
-2.939352, -3.465755, 5.218785,
3.22405, -3.465755, 5.218785,
-2.939352, 3.040771, -5.917155,
3.22405, 3.040771, -5.917155,
-2.939352, 3.040771, 5.218785,
3.22405, 3.040771, 5.218785,
3.22405, -3.465755, -5.917155,
3.22405, 3.040771, -5.917155,
3.22405, -3.465755, 5.218785,
3.22405, 3.040771, 5.218785,
3.22405, -3.465755, -5.917155,
3.22405, -3.465755, 5.218785,
3.22405, 3.040771, -5.917155,
3.22405, 3.040771, 5.218785
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
var radius = 7.632964;
var distance = 33.95992;
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
mvMatrix.translate( -0.1423489, 0.212492, 0.3491848 );
mvMatrix.scale( 1.339019, 1.268405, 0.7411058 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.95992);
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
mefenpyr-diethyl<-read.table("mefenpyr-diethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mefenpyr-diethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'mefenpyr' not found
```

```r
y<-mefenpyr-diethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'mefenpyr' not found
```

```r
z<-mefenpyr-diethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'mefenpyr' not found
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
-2.849594, 0.7747919, -2.0845, 0, 0, 1, 1, 1,
-2.821759, -1.932454, -2.498794, 1, 0, 0, 1, 1,
-2.701538, -1.168613, -1.474843, 1, 0, 0, 1, 1,
-2.562224, 0.2002319, -0.6930279, 1, 0, 0, 1, 1,
-2.510296, 0.9966586, 0.7216581, 1, 0, 0, 1, 1,
-2.453633, -1.145507, -1.426955, 1, 0, 0, 1, 1,
-2.277115, 0.4986352, -1.444972, 0, 0, 0, 1, 1,
-2.243008, -0.3401515, -3.57155, 0, 0, 0, 1, 1,
-2.23255, 0.6754053, -2.29394, 0, 0, 0, 1, 1,
-2.195128, 0.1469728, -3.128634, 0, 0, 0, 1, 1,
-2.171764, 0.8397417, 0.2301546, 0, 0, 0, 1, 1,
-2.132727, 0.904071, -0.3709172, 0, 0, 0, 1, 1,
-2.050477, -1.041137, -2.191019, 0, 0, 0, 1, 1,
-2.041198, -0.3843035, -2.555463, 1, 1, 1, 1, 1,
-2.022884, -0.4435341, -3.451871, 1, 1, 1, 1, 1,
-2.021331, -0.2546916, -3.261213, 1, 1, 1, 1, 1,
-2.007872, -0.03676076, 1.662455, 1, 1, 1, 1, 1,
-1.980225, 0.1174725, -1.817498, 1, 1, 1, 1, 1,
-1.980198, -0.08356711, -2.651157, 1, 1, 1, 1, 1,
-1.972602, -1.205715, -2.825269, 1, 1, 1, 1, 1,
-1.969267, -1.364044, -1.452061, 1, 1, 1, 1, 1,
-1.922867, 1.944654, -1.057203, 1, 1, 1, 1, 1,
-1.916261, 0.977384, -1.466667, 1, 1, 1, 1, 1,
-1.912994, -0.02476265, -1.059488, 1, 1, 1, 1, 1,
-1.911561, 0.1694682, -2.031194, 1, 1, 1, 1, 1,
-1.890626, -0.1794284, -2.950797, 1, 1, 1, 1, 1,
-1.864206, -0.19004, -2.512413, 1, 1, 1, 1, 1,
-1.850143, 0.3650544, -1.280618, 1, 1, 1, 1, 1,
-1.845793, 1.4355, -2.715609, 0, 0, 1, 1, 1,
-1.824372, 0.891623, -2.299788, 1, 0, 0, 1, 1,
-1.806599, -0.6887602, -2.273924, 1, 0, 0, 1, 1,
-1.804144, 0.2816042, -2.577566, 1, 0, 0, 1, 1,
-1.795812, -0.03533871, -3.184648, 1, 0, 0, 1, 1,
-1.787525, 0.9957021, -1.404159, 1, 0, 0, 1, 1,
-1.757313, 2.261164, -1.193134, 0, 0, 0, 1, 1,
-1.74774, -0.3572548, -3.009659, 0, 0, 0, 1, 1,
-1.741699, -0.6305692, -2.898908, 0, 0, 0, 1, 1,
-1.722882, -0.5375078, -1.076412, 0, 0, 0, 1, 1,
-1.719481, 0.8989462, 0.1333726, 0, 0, 0, 1, 1,
-1.703802, 1.064089, -0.1418515, 0, 0, 0, 1, 1,
-1.703751, -0.894192, -2.352915, 0, 0, 0, 1, 1,
-1.703507, -0.7022547, -1.744673, 1, 1, 1, 1, 1,
-1.693199, -0.4735361, -2.918836, 1, 1, 1, 1, 1,
-1.68674, 0.5403483, -0.7949392, 1, 1, 1, 1, 1,
-1.675567, -0.7473693, -2.759017, 1, 1, 1, 1, 1,
-1.651345, -1.057148, -1.14225, 1, 1, 1, 1, 1,
-1.646433, -0.8080133, -2.897226, 1, 1, 1, 1, 1,
-1.645485, -0.9287904, -2.127213, 1, 1, 1, 1, 1,
-1.644706, 0.4272023, -1.541296, 1, 1, 1, 1, 1,
-1.641268, 0.9698191, -0.8097555, 1, 1, 1, 1, 1,
-1.638978, 0.1271247, 0.3529834, 1, 1, 1, 1, 1,
-1.592073, 0.1229332, -0.7808213, 1, 1, 1, 1, 1,
-1.589142, 0.1228915, -3.350079, 1, 1, 1, 1, 1,
-1.56919, -0.2083944, -1.670595, 1, 1, 1, 1, 1,
-1.564196, 0.7773032, -2.083191, 1, 1, 1, 1, 1,
-1.56102, 0.5722732, -0.03950575, 1, 1, 1, 1, 1,
-1.552815, -2.887122, -2.402296, 0, 0, 1, 1, 1,
-1.546516, 0.4372239, -2.234297, 1, 0, 0, 1, 1,
-1.541081, 1.792551, 1.092693, 1, 0, 0, 1, 1,
-1.540331, -0.2872517, -2.581249, 1, 0, 0, 1, 1,
-1.537821, 0.4661239, -1.391819, 1, 0, 0, 1, 1,
-1.534625, 1.429385, -0.5137482, 1, 0, 0, 1, 1,
-1.494937, -0.09906384, -1.889866, 0, 0, 0, 1, 1,
-1.477335, 0.5577025, -2.805465, 0, 0, 0, 1, 1,
-1.472548, 1.546802, -1.530586, 0, 0, 0, 1, 1,
-1.470809, -1.27368, -1.243038, 0, 0, 0, 1, 1,
-1.464204, 1.344371, 0.8599312, 0, 0, 0, 1, 1,
-1.459747, -1.590551, -3.01726, 0, 0, 0, 1, 1,
-1.455029, 0.9347758, -2.04575, 0, 0, 0, 1, 1,
-1.451723, 0.9057882, -0.2744687, 1, 1, 1, 1, 1,
-1.445934, 1.10999, -0.6603165, 1, 1, 1, 1, 1,
-1.412042, -1.323589, -2.471493, 1, 1, 1, 1, 1,
-1.406565, -1.167551, -2.564707, 1, 1, 1, 1, 1,
-1.387086, 0.3997279, -1.708285, 1, 1, 1, 1, 1,
-1.384697, -1.495235, -2.50481, 1, 1, 1, 1, 1,
-1.376106, -0.568422, 0.1644198, 1, 1, 1, 1, 1,
-1.370416, 0.04030196, -1.170609, 1, 1, 1, 1, 1,
-1.362133, 0.7565649, -1.310211, 1, 1, 1, 1, 1,
-1.355074, 0.6242606, 0.4674616, 1, 1, 1, 1, 1,
-1.348607, 0.01905021, -0.6498432, 1, 1, 1, 1, 1,
-1.336258, -2.25893, -1.826586, 1, 1, 1, 1, 1,
-1.335833, 0.3074296, -0.1381123, 1, 1, 1, 1, 1,
-1.327441, 0.4557787, -1.236307, 1, 1, 1, 1, 1,
-1.324943, 1.049511, -1.374461, 1, 1, 1, 1, 1,
-1.320837, -0.9085723, -2.261491, 0, 0, 1, 1, 1,
-1.320689, -1.3428, -0.6732644, 1, 0, 0, 1, 1,
-1.316497, -0.8781114, -3.800833, 1, 0, 0, 1, 1,
-1.305172, 2.253408, 0.6919361, 1, 0, 0, 1, 1,
-1.303154, 1.138858, -1.286226, 1, 0, 0, 1, 1,
-1.291263, -0.4666747, -3.720291, 1, 0, 0, 1, 1,
-1.290512, -0.9278639, -2.911285, 0, 0, 0, 1, 1,
-1.283627, 0.7388715, -0.2566357, 0, 0, 0, 1, 1,
-1.27686, 0.6470408, -0.4932582, 0, 0, 0, 1, 1,
-1.270621, 0.3500688, -2.04163, 0, 0, 0, 1, 1,
-1.265244, 0.5307088, 0.4044205, 0, 0, 0, 1, 1,
-1.264867, 0.2232564, -1.08791, 0, 0, 0, 1, 1,
-1.261531, -0.7669513, -3.123927, 0, 0, 0, 1, 1,
-1.261281, -1.693229, -0.7919925, 1, 1, 1, 1, 1,
-1.261219, -0.1926123, -1.324291, 1, 1, 1, 1, 1,
-1.254683, -0.79596, -3.020092, 1, 1, 1, 1, 1,
-1.254657, 0.09341578, -1.629645, 1, 1, 1, 1, 1,
-1.243267, 0.9949332, -0.4771671, 1, 1, 1, 1, 1,
-1.239111, -2.571932, -3.654485, 1, 1, 1, 1, 1,
-1.228939, 1.377397, -1.336328, 1, 1, 1, 1, 1,
-1.223251, -0.9773257, -1.443555, 1, 1, 1, 1, 1,
-1.209936, 0.6450436, -2.76597, 1, 1, 1, 1, 1,
-1.209886, -1.955231, -0.999169, 1, 1, 1, 1, 1,
-1.205981, -0.5003741, -1.780005, 1, 1, 1, 1, 1,
-1.201874, 1.574207, -0.6601727, 1, 1, 1, 1, 1,
-1.191784, -0.5388805, -2.037608, 1, 1, 1, 1, 1,
-1.190847, 0.1428876, -0.4989038, 1, 1, 1, 1, 1,
-1.189652, -0.399836, -0.9397544, 1, 1, 1, 1, 1,
-1.179849, -0.8636047, -0.893095, 0, 0, 1, 1, 1,
-1.169033, -0.5022832, -1.37339, 1, 0, 0, 1, 1,
-1.158869, -0.4132845, -3.277344, 1, 0, 0, 1, 1,
-1.156693, 1.090258, -1.166527, 1, 0, 0, 1, 1,
-1.151898, 0.458464, -1.597125, 1, 0, 0, 1, 1,
-1.14703, 0.6554484, -0.8369846, 1, 0, 0, 1, 1,
-1.144891, 0.4468775, -1.011027, 0, 0, 0, 1, 1,
-1.13565, -0.1464648, -2.530632, 0, 0, 0, 1, 1,
-1.135529, -0.1426035, -1.70957, 0, 0, 0, 1, 1,
-1.125232, -0.7546905, -2.910889, 0, 0, 0, 1, 1,
-1.12314, 0.7228203, -1.878237, 0, 0, 0, 1, 1,
-1.120772, -1.75728, -3.534749, 0, 0, 0, 1, 1,
-1.113984, -1.586725, -2.890386, 0, 0, 0, 1, 1,
-1.112812, 0.05412924, -0.9405894, 1, 1, 1, 1, 1,
-1.112522, 1.021403, -0.1725808, 1, 1, 1, 1, 1,
-1.105949, -0.6639183, -0.1195581, 1, 1, 1, 1, 1,
-1.104635, -0.1424799, -1.724294, 1, 1, 1, 1, 1,
-1.102281, -1.838391, -2.754473, 1, 1, 1, 1, 1,
-1.101292, -0.4746707, -1.943107, 1, 1, 1, 1, 1,
-1.098263, 0.3343941, -1.430378, 1, 1, 1, 1, 1,
-1.093154, -2.06711, -2.34022, 1, 1, 1, 1, 1,
-1.086719, -0.8799921, -4.427686, 1, 1, 1, 1, 1,
-1.080225, -0.9104797, -2.913797, 1, 1, 1, 1, 1,
-1.075544, 0.4245643, -1.465295, 1, 1, 1, 1, 1,
-1.073132, -1.338621, -1.856241, 1, 1, 1, 1, 1,
-1.072022, 1.647362, -0.186928, 1, 1, 1, 1, 1,
-1.066772, -2.168854, -3.107829, 1, 1, 1, 1, 1,
-1.064579, -0.4206296, -1.15076, 1, 1, 1, 1, 1,
-1.056551, -0.3789072, -1.775319, 0, 0, 1, 1, 1,
-1.054911, 0.820115, -0.7331638, 1, 0, 0, 1, 1,
-1.046296, 1.296767, -2.063298, 1, 0, 0, 1, 1,
-1.042905, 0.6739293, -0.9495054, 1, 0, 0, 1, 1,
-1.034203, -1.237004, -1.412784, 1, 0, 0, 1, 1,
-1.02932, -0.5964691, -1.482435, 1, 0, 0, 1, 1,
-1.025493, 0.1239599, -2.418608, 0, 0, 0, 1, 1,
-1.011932, -0.3841093, -1.299204, 0, 0, 0, 1, 1,
-1.011629, 1.433573, -1.40541, 0, 0, 0, 1, 1,
-1.003629, -0.5483246, -0.1060071, 0, 0, 0, 1, 1,
-1.002106, -0.1231055, -1.012857, 0, 0, 0, 1, 1,
-1.000588, 0.5466061, -0.5951913, 0, 0, 0, 1, 1,
-0.9993044, -0.7511262, -3.607351, 0, 0, 0, 1, 1,
-0.9991846, 1.303538, -0.1025207, 1, 1, 1, 1, 1,
-0.9882765, 0.734828, -0.6595815, 1, 1, 1, 1, 1,
-0.9847111, 0.879755, -1.579824, 1, 1, 1, 1, 1,
-0.9789293, -0.7955211, -1.988922, 1, 1, 1, 1, 1,
-0.9745262, -1.690685, -2.424313, 1, 1, 1, 1, 1,
-0.9740161, -0.8219426, -2.99168, 1, 1, 1, 1, 1,
-0.9681327, 0.8490111, -0.6688154, 1, 1, 1, 1, 1,
-0.9568816, -0.1691054, -1.920145, 1, 1, 1, 1, 1,
-0.9547803, -0.9388575, -3.166109, 1, 1, 1, 1, 1,
-0.9518017, -0.8540066, -2.919941, 1, 1, 1, 1, 1,
-0.9486418, 0.04717007, -2.284794, 1, 1, 1, 1, 1,
-0.9361339, -0.4983019, -3.947959, 1, 1, 1, 1, 1,
-0.9310163, 0.4840512, -0.4758055, 1, 1, 1, 1, 1,
-0.9303665, 0.5711446, -1.476886, 1, 1, 1, 1, 1,
-0.9264299, 2.360293, -1.811711, 1, 1, 1, 1, 1,
-0.9196926, -0.1313927, -2.136212, 0, 0, 1, 1, 1,
-0.9159632, -0.1817225, -1.486734, 1, 0, 0, 1, 1,
-0.9128232, -0.4754089, -3.742418, 1, 0, 0, 1, 1,
-0.9096857, 1.620681, -2.142202, 1, 0, 0, 1, 1,
-0.9080912, -0.2794824, -0.06552878, 1, 0, 0, 1, 1,
-0.9078863, -0.877908, -1.934395, 1, 0, 0, 1, 1,
-0.9050201, -0.9017677, -2.15574, 0, 0, 0, 1, 1,
-0.9009084, -0.2664956, -2.587062, 0, 0, 0, 1, 1,
-0.893285, -0.07825521, -2.08025, 0, 0, 0, 1, 1,
-0.8884361, 2.811104, 0.0596219, 0, 0, 0, 1, 1,
-0.8842285, 0.5512231, -0.7037498, 0, 0, 0, 1, 1,
-0.8819239, -1.402945, -0.4008494, 0, 0, 0, 1, 1,
-0.8800108, -0.0839507, -1.218693, 0, 0, 0, 1, 1,
-0.8757284, 0.9991302, 0.617484, 1, 1, 1, 1, 1,
-0.8745997, 1.594479, -0.411628, 1, 1, 1, 1, 1,
-0.8726396, 0.1937919, -2.541929, 1, 1, 1, 1, 1,
-0.8704134, -0.01759924, -2.135237, 1, 1, 1, 1, 1,
-0.8703642, 0.04263556, -1.656086, 1, 1, 1, 1, 1,
-0.8656235, 1.856874, -0.2900131, 1, 1, 1, 1, 1,
-0.8581105, 1.02362, 0.3447782, 1, 1, 1, 1, 1,
-0.8515055, -0.2989384, -0.767951, 1, 1, 1, 1, 1,
-0.8509305, 0.8516415, -0.3583588, 1, 1, 1, 1, 1,
-0.8482831, -0.1092354, -0.894809, 1, 1, 1, 1, 1,
-0.8405991, 1.008637, -0.858869, 1, 1, 1, 1, 1,
-0.8399661, 0.7599153, -1.467271, 1, 1, 1, 1, 1,
-0.8290696, 1.074005, -0.1193828, 1, 1, 1, 1, 1,
-0.8271596, 0.5109466, 0.3154985, 1, 1, 1, 1, 1,
-0.8174455, -0.4301423, -1.785828, 1, 1, 1, 1, 1,
-0.7768415, 1.8345, -0.001613874, 0, 0, 1, 1, 1,
-0.7743551, 1.781218, 0.5941445, 1, 0, 0, 1, 1,
-0.7716715, 0.2191755, -2.362627, 1, 0, 0, 1, 1,
-0.7692505, 1.486318, -1.121996, 1, 0, 0, 1, 1,
-0.768333, 1.376879, 0.7009046, 1, 0, 0, 1, 1,
-0.7620532, -1.167784, -2.118321, 1, 0, 0, 1, 1,
-0.7604655, 2.15532, 1.086645, 0, 0, 0, 1, 1,
-0.759213, 1.345804, -2.180627, 0, 0, 0, 1, 1,
-0.757021, 0.05964804, -1.79877, 0, 0, 0, 1, 1,
-0.7532914, -0.7676088, -1.227268, 0, 0, 0, 1, 1,
-0.7482713, -1.351193, -0.9871566, 0, 0, 0, 1, 1,
-0.7477947, -0.4534722, -1.894118, 0, 0, 0, 1, 1,
-0.7461023, -0.4954493, -2.454323, 0, 0, 0, 1, 1,
-0.7458735, 0.1592378, -0.2933189, 1, 1, 1, 1, 1,
-0.7425869, -0.6020867, -0.2116121, 1, 1, 1, 1, 1,
-0.7401058, 2.248375, 0.1966149, 1, 1, 1, 1, 1,
-0.7384988, 2.549716, -2.242818, 1, 1, 1, 1, 1,
-0.7288436, -1.037782, -0.8181469, 1, 1, 1, 1, 1,
-0.7264346, -0.1994765, -1.565727, 1, 1, 1, 1, 1,
-0.7254005, -0.4945177, -0.2670552, 1, 1, 1, 1, 1,
-0.7253942, -0.4283534, -1.482812, 1, 1, 1, 1, 1,
-0.7197482, 0.1292803, -0.6742403, 1, 1, 1, 1, 1,
-0.717158, -1.673159, -5.754981, 1, 1, 1, 1, 1,
-0.7167386, 0.1289589, -2.920465, 1, 1, 1, 1, 1,
-0.7144587, -0.9351489, -2.816473, 1, 1, 1, 1, 1,
-0.7143685, -2.463496, -3.002674, 1, 1, 1, 1, 1,
-0.705197, 0.6039305, -0.07541493, 1, 1, 1, 1, 1,
-0.7035612, 0.02233025, -1.151533, 1, 1, 1, 1, 1,
-0.701255, 0.3494158, -2.225216, 0, 0, 1, 1, 1,
-0.6979545, 2.731975, 0.4044861, 1, 0, 0, 1, 1,
-0.6972331, 0.7098709, -1.258689, 1, 0, 0, 1, 1,
-0.696172, 0.914012, 0.3734799, 1, 0, 0, 1, 1,
-0.6957986, -1.465123, -2.259089, 1, 0, 0, 1, 1,
-0.6937379, -0.2974121, -2.467421, 1, 0, 0, 1, 1,
-0.6889994, -0.7011674, -4.400434, 0, 0, 0, 1, 1,
-0.6880322, 1.147784, -0.4858195, 0, 0, 0, 1, 1,
-0.6830934, 1.593923, 0.2288018, 0, 0, 0, 1, 1,
-0.6789871, -1.001834, -3.231198, 0, 0, 0, 1, 1,
-0.6788401, -2.051221, -2.254776, 0, 0, 0, 1, 1,
-0.6758376, 0.5948583, -0.04814586, 0, 0, 0, 1, 1,
-0.6725671, 0.2021261, -0.6508508, 0, 0, 0, 1, 1,
-0.6718699, -1.335872, -3.095807, 1, 1, 1, 1, 1,
-0.6718521, -0.6099262, -3.617077, 1, 1, 1, 1, 1,
-0.6716618, -2.59061, -3.01855, 1, 1, 1, 1, 1,
-0.6704166, -0.6890771, -2.442705, 1, 1, 1, 1, 1,
-0.6689993, -1.20664, -2.973443, 1, 1, 1, 1, 1,
-0.6648071, -0.7516146, -2.086149, 1, 1, 1, 1, 1,
-0.6643016, -0.2836137, -3.068246, 1, 1, 1, 1, 1,
-0.6595557, -0.1597407, -1.274846, 1, 1, 1, 1, 1,
-0.6590906, -1.006993, -3.317231, 1, 1, 1, 1, 1,
-0.6589294, 1.022197, -0.1560748, 1, 1, 1, 1, 1,
-0.6577628, 0.4645531, -1.868232, 1, 1, 1, 1, 1,
-0.6575293, -0.6123581, -1.88539, 1, 1, 1, 1, 1,
-0.6561548, 0.8898753, -1.094662, 1, 1, 1, 1, 1,
-0.6470405, -1.175058, -1.431788, 1, 1, 1, 1, 1,
-0.6380028, 0.001153265, 0.568791, 1, 1, 1, 1, 1,
-0.6340345, -0.6679259, -3.257227, 0, 0, 1, 1, 1,
-0.6282173, -0.7636734, -2.79761, 1, 0, 0, 1, 1,
-0.627633, 1.272039, -0.1293417, 1, 0, 0, 1, 1,
-0.6180585, 1.032752, -1.343983, 1, 0, 0, 1, 1,
-0.6142111, 0.4241921, -1.408032, 1, 0, 0, 1, 1,
-0.6049263, -0.151478, -1.061133, 1, 0, 0, 1, 1,
-0.5974278, 1.843528, 0.2899328, 0, 0, 0, 1, 1,
-0.5946118, -0.2211476, -1.83727, 0, 0, 0, 1, 1,
-0.5932718, -1.479631, -2.373348, 0, 0, 0, 1, 1,
-0.5893708, -1.442171, -0.6700655, 0, 0, 0, 1, 1,
-0.5890972, -0.1302218, -1.866073, 0, 0, 0, 1, 1,
-0.5860448, -0.02461946, -1.480424, 0, 0, 0, 1, 1,
-0.5859541, 1.174957, -1.425843, 0, 0, 0, 1, 1,
-0.5851773, -0.09248353, -1.883193, 1, 1, 1, 1, 1,
-0.5817955, 0.2088885, -3.147404, 1, 1, 1, 1, 1,
-0.5813779, -0.7864022, -3.075635, 1, 1, 1, 1, 1,
-0.5796648, 0.1227852, -1.979804, 1, 1, 1, 1, 1,
-0.5788229, 1.843304, 0.6197217, 1, 1, 1, 1, 1,
-0.5746843, -1.309062, -2.903515, 1, 1, 1, 1, 1,
-0.5680939, 1.23481, -0.1350109, 1, 1, 1, 1, 1,
-0.5677319, 0.4009526, -0.5084575, 1, 1, 1, 1, 1,
-0.5641958, 1.843375, -1.046435, 1, 1, 1, 1, 1,
-0.5607459, -2.510488, -3.117167, 1, 1, 1, 1, 1,
-0.5559208, -1.199768, -3.222628, 1, 1, 1, 1, 1,
-0.5545825, 0.8493332, -1.535542, 1, 1, 1, 1, 1,
-0.5534259, 0.1844574, -1.045617, 1, 1, 1, 1, 1,
-0.5513133, 0.06435842, -0.345003, 1, 1, 1, 1, 1,
-0.5501195, -1.202168, -3.375987, 1, 1, 1, 1, 1,
-0.5468597, -0.5716524, 0.1362343, 0, 0, 1, 1, 1,
-0.5391467, 0.8192585, -1.597317, 1, 0, 0, 1, 1,
-0.5354103, 0.9361464, -1.747316, 1, 0, 0, 1, 1,
-0.5352999, -0.4855761, -4.210916, 1, 0, 0, 1, 1,
-0.5323275, 0.5032489, -2.180579, 1, 0, 0, 1, 1,
-0.5280597, -0.07092699, -3.135791, 1, 0, 0, 1, 1,
-0.52755, -1.397289, -2.106848, 0, 0, 0, 1, 1,
-0.5236205, 0.2002488, 0.07252344, 0, 0, 0, 1, 1,
-0.5232664, 1.398556, 0.5710254, 0, 0, 0, 1, 1,
-0.5209515, -0.008467965, -2.794637, 0, 0, 0, 1, 1,
-0.5188355, -0.701098, -1.5599, 0, 0, 0, 1, 1,
-0.517163, -0.191122, -1.133644, 0, 0, 0, 1, 1,
-0.5161544, -0.07438076, -1.827933, 0, 0, 0, 1, 1,
-0.5151942, 0.8561481, -1.95014, 1, 1, 1, 1, 1,
-0.5089916, 0.7076287, 0.735059, 1, 1, 1, 1, 1,
-0.5082316, -1.47234, -2.329366, 1, 1, 1, 1, 1,
-0.5079694, 0.814222, -1.764998, 1, 1, 1, 1, 1,
-0.5078002, -0.4147304, -3.091757, 1, 1, 1, 1, 1,
-0.4997937, -0.482117, -2.84384, 1, 1, 1, 1, 1,
-0.4958899, 0.684032, 0.3312116, 1, 1, 1, 1, 1,
-0.492588, -0.1606462, -1.884156, 1, 1, 1, 1, 1,
-0.4903854, -0.3727065, -1.037988, 1, 1, 1, 1, 1,
-0.4902798, -1.281328, -2.588257, 1, 1, 1, 1, 1,
-0.4840402, -0.7859865, -3.018737, 1, 1, 1, 1, 1,
-0.4816566, 1.903485, 0.3618239, 1, 1, 1, 1, 1,
-0.479953, -0.5398513, -2.25773, 1, 1, 1, 1, 1,
-0.4789881, -0.3079411, -2.371376, 1, 1, 1, 1, 1,
-0.4784482, -0.0945786, -1.43475, 1, 1, 1, 1, 1,
-0.4781235, 0.9020985, -1.353989, 0, 0, 1, 1, 1,
-0.4780344, 0.4904969, -0.04847665, 1, 0, 0, 1, 1,
-0.4772321, -1.103955, -3.196637, 1, 0, 0, 1, 1,
-0.4764164, -2.63694, -2.236633, 1, 0, 0, 1, 1,
-0.470358, 0.1601379, -0.2094685, 1, 0, 0, 1, 1,
-0.4691327, 0.3841082, -2.447337, 1, 0, 0, 1, 1,
-0.4669689, 0.5206433, -0.8686917, 0, 0, 0, 1, 1,
-0.4643988, -0.1724211, -0.5982581, 0, 0, 0, 1, 1,
-0.4619568, -0.31219, -2.831606, 0, 0, 0, 1, 1,
-0.4614834, 1.332192, -0.8210838, 0, 0, 0, 1, 1,
-0.4604378, -1.287901, -1.895065, 0, 0, 0, 1, 1,
-0.4593512, 0.3724251, -0.9407745, 0, 0, 0, 1, 1,
-0.4551721, -1.837144, -1.747344, 0, 0, 0, 1, 1,
-0.4470138, -2.118706, -1.753344, 1, 1, 1, 1, 1,
-0.4441896, 0.8013985, -0.5994356, 1, 1, 1, 1, 1,
-0.4378329, -0.743727, -3.448792, 1, 1, 1, 1, 1,
-0.4350884, 0.2174421, -0.2614434, 1, 1, 1, 1, 1,
-0.434071, 0.9355859, -1.142465, 1, 1, 1, 1, 1,
-0.4309569, -1.180091, -3.337531, 1, 1, 1, 1, 1,
-0.4264508, -0.5598134, -2.65861, 1, 1, 1, 1, 1,
-0.4242632, 0.6050513, -0.1359971, 1, 1, 1, 1, 1,
-0.4226927, 0.04816908, -1.875534, 1, 1, 1, 1, 1,
-0.4203824, 1.222008, -0.2835937, 1, 1, 1, 1, 1,
-0.4127648, 0.5933543, -0.6816445, 1, 1, 1, 1, 1,
-0.4116891, 0.3523551, 0.1384817, 1, 1, 1, 1, 1,
-0.4114069, 2.361896, -0.1536696, 1, 1, 1, 1, 1,
-0.4109385, -2.791027, -5.327381, 1, 1, 1, 1, 1,
-0.4066794, 0.5472045, -1.029249, 1, 1, 1, 1, 1,
-0.4061034, -0.5398621, -1.259708, 0, 0, 1, 1, 1,
-0.4049322, 0.4069177, -1.58162, 1, 0, 0, 1, 1,
-0.4026601, -0.7772686, -2.531784, 1, 0, 0, 1, 1,
-0.3963684, 0.7605324, -2.151233, 1, 0, 0, 1, 1,
-0.393812, 0.3984498, 0.8400566, 1, 0, 0, 1, 1,
-0.3934525, 0.08346646, 0.05352885, 1, 0, 0, 1, 1,
-0.393148, 0.07133446, -0.7744688, 0, 0, 0, 1, 1,
-0.3912326, 0.948127, 0.9943058, 0, 0, 0, 1, 1,
-0.3906333, -2.049491, -3.35227, 0, 0, 0, 1, 1,
-0.3885516, -0.3615216, -2.065783, 0, 0, 0, 1, 1,
-0.3863521, -0.6923896, -1.828351, 0, 0, 0, 1, 1,
-0.3861778, 0.02896564, -0.1479886, 0, 0, 0, 1, 1,
-0.3823423, -0.5354679, -2.048172, 0, 0, 0, 1, 1,
-0.3819006, 1.546552, -1.001888, 1, 1, 1, 1, 1,
-0.3769952, 1.369131, -1.678877, 1, 1, 1, 1, 1,
-0.3765689, 0.9183776, -1.551546, 1, 1, 1, 1, 1,
-0.3732311, 0.8103321, -1.430106, 1, 1, 1, 1, 1,
-0.3640291, -1.563362, -3.815465, 1, 1, 1, 1, 1,
-0.3623325, 1.358541, 0.874927, 1, 1, 1, 1, 1,
-0.3616986, 0.07889343, -2.089882, 1, 1, 1, 1, 1,
-0.3591328, 0.2210019, -2.809121, 1, 1, 1, 1, 1,
-0.3566779, -1.708295, -3.274637, 1, 1, 1, 1, 1,
-0.3554645, -1.417473, -2.189375, 1, 1, 1, 1, 1,
-0.3464918, 1.430952, -1.229677, 1, 1, 1, 1, 1,
-0.3433212, 0.4782656, -2.242916, 1, 1, 1, 1, 1,
-0.3410478, -0.7634938, -2.430326, 1, 1, 1, 1, 1,
-0.3395133, -0.05362079, -1.01204, 1, 1, 1, 1, 1,
-0.3329085, -0.05016061, -1.524154, 1, 1, 1, 1, 1,
-0.3328352, 0.5263757, -0.3025567, 0, 0, 1, 1, 1,
-0.328169, 0.06202239, -1.664495, 1, 0, 0, 1, 1,
-0.327109, -0.0627756, -1.228848, 1, 0, 0, 1, 1,
-0.3264817, -0.01409831, -2.616769, 1, 0, 0, 1, 1,
-0.3246572, 0.4625991, -0.2246274, 1, 0, 0, 1, 1,
-0.315797, 1.326292, -1.45841, 1, 0, 0, 1, 1,
-0.3142278, -0.2903686, -1.398242, 0, 0, 0, 1, 1,
-0.3103723, 0.02358801, -2.155044, 0, 0, 0, 1, 1,
-0.3066989, 0.5522854, -0.8491782, 0, 0, 0, 1, 1,
-0.3055486, 0.08565085, -0.5740734, 0, 0, 0, 1, 1,
-0.3012156, 0.6426238, -0.3635586, 0, 0, 0, 1, 1,
-0.3007119, -0.5267603, -1.399071, 0, 0, 0, 1, 1,
-0.2990406, 0.9910122, -0.9230222, 0, 0, 0, 1, 1,
-0.2944602, -0.4960358, -1.139293, 1, 1, 1, 1, 1,
-0.2912229, 1.065381, 0.1946929, 1, 1, 1, 1, 1,
-0.2911702, 0.6572781, -1.323119, 1, 1, 1, 1, 1,
-0.2880398, 0.7853677, -1.535998, 1, 1, 1, 1, 1,
-0.2857132, 0.3939114, -0.8149418, 1, 1, 1, 1, 1,
-0.2837062, 0.6039726, 0.6391836, 1, 1, 1, 1, 1,
-0.2708437, -1.060591, -3.204519, 1, 1, 1, 1, 1,
-0.2538162, 0.7206059, -1.942357, 1, 1, 1, 1, 1,
-0.2532818, -0.1944753, -2.315283, 1, 1, 1, 1, 1,
-0.2530523, 0.732871, -0.874483, 1, 1, 1, 1, 1,
-0.2527297, -0.2819893, -1.311421, 1, 1, 1, 1, 1,
-0.2524755, 0.2574683, -1.12931, 1, 1, 1, 1, 1,
-0.2520237, -0.9984331, -3.275675, 1, 1, 1, 1, 1,
-0.2512993, -1.887058, -2.7399, 1, 1, 1, 1, 1,
-0.2500248, 0.9828402, -1.37635, 1, 1, 1, 1, 1,
-0.2487828, 1.008061, -1.642412, 0, 0, 1, 1, 1,
-0.2451094, 0.6895123, -1.212068, 1, 0, 0, 1, 1,
-0.2443404, 0.8415986, -0.3122973, 1, 0, 0, 1, 1,
-0.2379426, -0.1687584, -0.7029265, 1, 0, 0, 1, 1,
-0.2327323, -1.578535, -2.894143, 1, 0, 0, 1, 1,
-0.230124, -0.9735081, -3.382749, 1, 0, 0, 1, 1,
-0.2257441, -0.9931334, -2.174755, 0, 0, 0, 1, 1,
-0.2255902, -0.9697793, -2.120732, 0, 0, 0, 1, 1,
-0.2226404, 1.936437, 1.010314, 0, 0, 0, 1, 1,
-0.2225976, -1.133825, -3.274178, 0, 0, 0, 1, 1,
-0.2219045, 1.276995, -0.7449379, 0, 0, 0, 1, 1,
-0.2201623, 0.540171, 1.514568, 0, 0, 0, 1, 1,
-0.2140789, -0.7645776, -3.843642, 0, 0, 0, 1, 1,
-0.2137043, 0.5819347, -2.082505, 1, 1, 1, 1, 1,
-0.2025702, -1.092047, -3.132331, 1, 1, 1, 1, 1,
-0.1965507, -1.040372, -3.21992, 1, 1, 1, 1, 1,
-0.1880237, -0.8730778, -2.579453, 1, 1, 1, 1, 1,
-0.1870066, -2.232274, -2.863995, 1, 1, 1, 1, 1,
-0.184813, 0.2634936, -1.411874, 1, 1, 1, 1, 1,
-0.1836831, -1.012313, -3.043376, 1, 1, 1, 1, 1,
-0.1801621, -1.22183, -4.240918, 1, 1, 1, 1, 1,
-0.1799678, -0.8872376, -2.20462, 1, 1, 1, 1, 1,
-0.1785452, 0.9811046, -0.1470523, 1, 1, 1, 1, 1,
-0.1785216, 0.1115783, -0.5588994, 1, 1, 1, 1, 1,
-0.1783983, 1.098055, 0.02645374, 1, 1, 1, 1, 1,
-0.1767593, 0.1053182, 0.3394261, 1, 1, 1, 1, 1,
-0.1757442, 1.064064, 0.4142503, 1, 1, 1, 1, 1,
-0.1754475, -1.220256, -2.345205, 1, 1, 1, 1, 1,
-0.1750479, -0.920238, -2.809114, 0, 0, 1, 1, 1,
-0.1703421, -0.350768, -1.275313, 1, 0, 0, 1, 1,
-0.1696032, 0.4396121, -0.5028183, 1, 0, 0, 1, 1,
-0.1643454, -0.4794341, -3.600873, 1, 0, 0, 1, 1,
-0.1579721, -0.7264913, -1.686967, 1, 0, 0, 1, 1,
-0.1524516, 0.07246719, -0.06246874, 1, 0, 0, 1, 1,
-0.1523336, -0.3015846, -2.333352, 0, 0, 0, 1, 1,
-0.1514678, -0.8831265, -4.91465, 0, 0, 0, 1, 1,
-0.1506558, -0.484374, -3.10985, 0, 0, 0, 1, 1,
-0.1482149, -0.9598693, -3.534343, 0, 0, 0, 1, 1,
-0.1449231, 0.4544159, 0.9019337, 0, 0, 0, 1, 1,
-0.1441725, 0.8448235, 0.6663013, 0, 0, 0, 1, 1,
-0.142683, -1.268745, -2.60602, 0, 0, 0, 1, 1,
-0.1394344, -0.6548355, -4.676229, 1, 1, 1, 1, 1,
-0.1382411, -1.889205, -4.864393, 1, 1, 1, 1, 1,
-0.1364802, -0.4397052, -2.688776, 1, 1, 1, 1, 1,
-0.1338989, 0.7945675, 0.231567, 1, 1, 1, 1, 1,
-0.1313159, 0.1113828, -2.033476, 1, 1, 1, 1, 1,
-0.1292879, 0.9887032, 0.8846844, 1, 1, 1, 1, 1,
-0.1277507, -0.9559124, -3.04493, 1, 1, 1, 1, 1,
-0.1212168, 0.02404588, -1.229314, 1, 1, 1, 1, 1,
-0.1200884, 0.5978951, 0.6821123, 1, 1, 1, 1, 1,
-0.1128149, -1.52916, -3.715809, 1, 1, 1, 1, 1,
-0.1102494, -0.8835441, -3.086101, 1, 1, 1, 1, 1,
-0.1096372, 0.9457139, -1.028801, 1, 1, 1, 1, 1,
-0.1043552, -0.5463263, -3.090702, 1, 1, 1, 1, 1,
-0.1038098, 0.2549626, 0.1557871, 1, 1, 1, 1, 1,
-0.1026327, -0.6505498, -1.795127, 1, 1, 1, 1, 1,
-0.1019172, -0.1051334, -2.846608, 0, 0, 1, 1, 1,
-0.09978615, -0.5539865, -4.035285, 1, 0, 0, 1, 1,
-0.09723628, 1.24772, -0.8113648, 1, 0, 0, 1, 1,
-0.09542786, 2.266045, -0.6759601, 1, 0, 0, 1, 1,
-0.09501469, -0.1920983, -2.899076, 1, 0, 0, 1, 1,
-0.09331506, -0.6593121, -4.697381, 1, 0, 0, 1, 1,
-0.09149457, -0.5473812, -2.813032, 0, 0, 0, 1, 1,
-0.08881684, -0.09315199, -1.875926, 0, 0, 0, 1, 1,
-0.08765627, -0.871833, -4.210344, 0, 0, 0, 1, 1,
-0.08722641, 0.1588964, -0.6588419, 0, 0, 0, 1, 1,
-0.08647119, -0.7731, -3.360882, 0, 0, 0, 1, 1,
-0.08343107, 0.8815164, -0.6078451, 0, 0, 0, 1, 1,
-0.08076784, 0.6496328, -0.2366133, 0, 0, 0, 1, 1,
-0.07620603, 1.279057, 0.5944299, 1, 1, 1, 1, 1,
-0.07591029, -1.35196, -4.940879, 1, 1, 1, 1, 1,
-0.07008945, -0.8924386, -3.73154, 1, 1, 1, 1, 1,
-0.06657486, -0.7265303, -3.349094, 1, 1, 1, 1, 1,
-0.06284332, 0.8150864, -0.03823452, 1, 1, 1, 1, 1,
-0.06261091, 2.03024, -1.224018, 1, 1, 1, 1, 1,
-0.06208149, 1.525708, -1.83963, 1, 1, 1, 1, 1,
-0.05714495, -0.3020871, -3.475691, 1, 1, 1, 1, 1,
-0.05337169, -0.4529042, -4.232388, 1, 1, 1, 1, 1,
-0.05269177, -0.2527145, -2.025463, 1, 1, 1, 1, 1,
-0.05157726, -0.3199084, -3.248685, 1, 1, 1, 1, 1,
-0.04831339, -0.01370725, -1.563982, 1, 1, 1, 1, 1,
-0.04780897, -1.272026, -4.004443, 1, 1, 1, 1, 1,
-0.04764701, 0.3196036, -0.4130837, 1, 1, 1, 1, 1,
-0.03911794, 0.1832713, -0.705096, 1, 1, 1, 1, 1,
-0.03527776, 0.3194968, 0.03151892, 0, 0, 1, 1, 1,
-0.03477059, 0.2541832, 0.7603322, 1, 0, 0, 1, 1,
-0.03367253, -1.996279, -3.473671, 1, 0, 0, 1, 1,
-0.02778917, -1.044082, -3.513484, 1, 0, 0, 1, 1,
-0.02704499, 0.1116171, -0.4308046, 1, 0, 0, 1, 1,
-0.02608752, 1.536635, 0.989261, 1, 0, 0, 1, 1,
-0.02390147, -0.4833718, -1.422176, 0, 0, 0, 1, 1,
-0.02284991, -1.008132, -2.593628, 0, 0, 0, 1, 1,
-0.02257046, 2.133239, -0.8751348, 0, 0, 0, 1, 1,
-0.02101179, -1.259229, -2.574524, 0, 0, 0, 1, 1,
-0.01486208, 0.02610829, 1.07904, 0, 0, 0, 1, 1,
-0.01481556, -2.233482, -1.548143, 0, 0, 0, 1, 1,
-0.01382715, -0.7462322, -2.381849, 0, 0, 0, 1, 1,
-0.01072123, 0.09104344, -1.571049, 1, 1, 1, 1, 1,
-0.006961383, 0.7801176, 0.0762282, 1, 1, 1, 1, 1,
-0.003857506, -0.1342039, -3.53788, 1, 1, 1, 1, 1,
-0.002190597, -0.6962466, -2.781024, 1, 1, 1, 1, 1,
-0.001757474, -0.3704275, -3.203587, 1, 1, 1, 1, 1,
-0.001097129, -0.5502267, -2.928737, 1, 1, 1, 1, 1,
0.003357484, 0.5336339, -1.755048, 1, 1, 1, 1, 1,
0.005644783, -0.04463442, 2.11005, 1, 1, 1, 1, 1,
0.007637263, 0.2265624, -0.851891, 1, 1, 1, 1, 1,
0.009341493, -0.9685904, 1.591133, 1, 1, 1, 1, 1,
0.01096405, -1.354149, 3.095987, 1, 1, 1, 1, 1,
0.0115231, -1.951142, 0.9289459, 1, 1, 1, 1, 1,
0.01598811, 1.401353, -0.3241998, 1, 1, 1, 1, 1,
0.0174264, 2.300544, -0.4879983, 1, 1, 1, 1, 1,
0.02518933, 0.7541139, -0.7656619, 1, 1, 1, 1, 1,
0.02533584, 2.560308, -0.6622482, 0, 0, 1, 1, 1,
0.02622603, 0.1095165, 0.5029212, 1, 0, 0, 1, 1,
0.0306039, 0.8314102, 2.683678, 1, 0, 0, 1, 1,
0.03198741, 0.7153176, -0.08126017, 1, 0, 0, 1, 1,
0.0323261, 0.7934949, -0.19089, 1, 0, 0, 1, 1,
0.0374751, -0.6723558, 3.234741, 1, 0, 0, 1, 1,
0.03909414, 2.001684, -0.6422973, 0, 0, 0, 1, 1,
0.04437248, 0.6880038, -1.686911, 0, 0, 0, 1, 1,
0.04721573, -0.6371879, 3.336296, 0, 0, 0, 1, 1,
0.04840295, -0.9301474, 2.600115, 0, 0, 0, 1, 1,
0.05157145, -0.3526608, 3.900189, 0, 0, 0, 1, 1,
0.05280001, 0.01519616, 1.580322, 0, 0, 0, 1, 1,
0.05841887, 1.91865, -0.8712034, 0, 0, 0, 1, 1,
0.07112321, -0.4355395, 2.542773, 1, 1, 1, 1, 1,
0.07412096, 1.379428, -1.33648, 1, 1, 1, 1, 1,
0.07600017, 0.419805, 0.1956163, 1, 1, 1, 1, 1,
0.08315425, 0.3962953, 0.9880415, 1, 1, 1, 1, 1,
0.08354472, -1.088137, 3.947242, 1, 1, 1, 1, 1,
0.08557118, -0.4455204, 2.616598, 1, 1, 1, 1, 1,
0.08618002, 0.5418097, 0.5845044, 1, 1, 1, 1, 1,
0.08632568, 1.023723, -0.7728167, 1, 1, 1, 1, 1,
0.09220965, 0.1264507, 1.020442, 1, 1, 1, 1, 1,
0.09790453, -0.4604164, 1.476849, 1, 1, 1, 1, 1,
0.09877671, -0.2805097, 1.951382, 1, 1, 1, 1, 1,
0.1008387, 1.150178, 1.245718, 1, 1, 1, 1, 1,
0.1078037, 0.759764, 0.3996375, 1, 1, 1, 1, 1,
0.1099634, -0.6217849, 2.173899, 1, 1, 1, 1, 1,
0.1216804, -1.01757, 3.805598, 1, 1, 1, 1, 1,
0.1240627, 0.6589768, 1.672588, 0, 0, 1, 1, 1,
0.1265056, 0.3235644, 0.3220572, 1, 0, 0, 1, 1,
0.1292782, -0.24785, 2.199379, 1, 0, 0, 1, 1,
0.1323657, -0.07939395, 2.77871, 1, 0, 0, 1, 1,
0.1355568, -1.048818, 1.533957, 1, 0, 0, 1, 1,
0.1382838, 0.3894354, -0.07131999, 1, 0, 0, 1, 1,
0.1389621, 0.7137552, 0.952482, 0, 0, 0, 1, 1,
0.1396958, 0.6994299, 0.6297557, 0, 0, 0, 1, 1,
0.1442183, -1.11028, 1.943889, 0, 0, 0, 1, 1,
0.1464259, -1.569104, 2.992092, 0, 0, 0, 1, 1,
0.1489563, 0.2528869, -0.09044893, 0, 0, 0, 1, 1,
0.1504162, 0.6286889, -0.1572347, 0, 0, 0, 1, 1,
0.1544436, 0.134682, 1.262854, 0, 0, 0, 1, 1,
0.1548816, 0.07105784, -0.780045, 1, 1, 1, 1, 1,
0.155559, 0.6250786, 2.78923, 1, 1, 1, 1, 1,
0.1556943, -1.746019, 3.640156, 1, 1, 1, 1, 1,
0.1601516, 0.5283404, -1.484751, 1, 1, 1, 1, 1,
0.1608048, -0.9326462, 2.628052, 1, 1, 1, 1, 1,
0.1629284, -0.7186102, 1.535425, 1, 1, 1, 1, 1,
0.1646196, 2.946015, -1.341344, 1, 1, 1, 1, 1,
0.1652966, -0.7533084, 4.068341, 1, 1, 1, 1, 1,
0.1665753, -1.09641, 4.351838, 1, 1, 1, 1, 1,
0.1670699, 0.2768184, 1.286882, 1, 1, 1, 1, 1,
0.1698021, 0.6965851, -0.9284753, 1, 1, 1, 1, 1,
0.1746837, -1.056463, 3.312046, 1, 1, 1, 1, 1,
0.1766428, -0.06403257, 3.166464, 1, 1, 1, 1, 1,
0.1818251, -0.9618215, 2.849955, 1, 1, 1, 1, 1,
0.1828322, -1.154384, 1.708508, 1, 1, 1, 1, 1,
0.1857934, 0.8467084, -0.01552662, 0, 0, 1, 1, 1,
0.1887503, 0.4719786, -0.06986756, 1, 0, 0, 1, 1,
0.1888945, 1.137168, 0.4608626, 1, 0, 0, 1, 1,
0.1891535, 0.004039764, 1.79356, 1, 0, 0, 1, 1,
0.1928306, -0.2034903, 1.82962, 1, 0, 0, 1, 1,
0.1944384, 0.349138, 0.9412253, 1, 0, 0, 1, 1,
0.1946657, -0.2526672, 2.255786, 0, 0, 0, 1, 1,
0.1961947, -0.0495851, 2.74137, 0, 0, 0, 1, 1,
0.1979528, -0.4117171, 3.484082, 0, 0, 0, 1, 1,
0.1986535, -0.1187901, 0.7735574, 0, 0, 0, 1, 1,
0.2028154, -2.144968, 0.7672616, 0, 0, 0, 1, 1,
0.208695, -1.20904, 2.867933, 0, 0, 0, 1, 1,
0.2099105, -1.75343, 2.006095, 0, 0, 0, 1, 1,
0.2110971, -0.133427, 0.8284875, 1, 1, 1, 1, 1,
0.211168, 1.329504, -1.533379, 1, 1, 1, 1, 1,
0.2126161, 1.867895, -2.299793, 1, 1, 1, 1, 1,
0.2170029, 0.4927762, 0.2755938, 1, 1, 1, 1, 1,
0.2176205, -2.011837, 2.973254, 1, 1, 1, 1, 1,
0.2177151, -0.2304833, 1.881922, 1, 1, 1, 1, 1,
0.2182997, -1.01876, 1.365574, 1, 1, 1, 1, 1,
0.2185386, -1.088026, 3.227824, 1, 1, 1, 1, 1,
0.2200416, 0.7273659, -0.2928333, 1, 1, 1, 1, 1,
0.220969, 0.6433559, 0.8335972, 1, 1, 1, 1, 1,
0.2227615, -1.14395, 2.409455, 1, 1, 1, 1, 1,
0.2245145, 0.7210354, 0.5392857, 1, 1, 1, 1, 1,
0.2254696, 2.864296, 1.51375, 1, 1, 1, 1, 1,
0.2321972, 0.8733979, 0.588055, 1, 1, 1, 1, 1,
0.2332274, -0.3003154, 0.9695482, 1, 1, 1, 1, 1,
0.2339464, -0.5896739, 2.237513, 0, 0, 1, 1, 1,
0.234145, 0.1927156, -0.07985038, 1, 0, 0, 1, 1,
0.2349391, 0.2573971, -0.225611, 1, 0, 0, 1, 1,
0.2351453, -0.410537, 1.869125, 1, 0, 0, 1, 1,
0.2360463, -0.587025, 3.5782, 1, 0, 0, 1, 1,
0.2360612, 1.389378, -2.622149, 1, 0, 0, 1, 1,
0.2395649, -0.7678313, 1.067487, 0, 0, 0, 1, 1,
0.2399146, -1.233204, 2.233956, 0, 0, 0, 1, 1,
0.2404865, 1.854795, 0.3074464, 0, 0, 0, 1, 1,
0.2525725, -0.8469418, 2.652027, 0, 0, 0, 1, 1,
0.2574118, 0.010324, 2.184242, 0, 0, 0, 1, 1,
0.2595801, 1.832148, 0.01063471, 0, 0, 0, 1, 1,
0.2608529, -1.348958, 3.619731, 0, 0, 0, 1, 1,
0.2610383, -0.2626519, 3.479663, 1, 1, 1, 1, 1,
0.2677809, 0.459663, -0.07219373, 1, 1, 1, 1, 1,
0.2713126, -0.9615274, 2.804895, 1, 1, 1, 1, 1,
0.2724946, -0.8258249, 0.8700172, 1, 1, 1, 1, 1,
0.2727223, -0.03541222, 1.879522, 1, 1, 1, 1, 1,
0.2736003, 0.2795447, 1.111739, 1, 1, 1, 1, 1,
0.2738705, 1.177952, 1.010959, 1, 1, 1, 1, 1,
0.2777448, 0.4198001, -1.317496, 1, 1, 1, 1, 1,
0.2861662, -1.151186, 3.695862, 1, 1, 1, 1, 1,
0.2959712, 0.2256619, 1.842975, 1, 1, 1, 1, 1,
0.300335, 1.48959, -0.2451517, 1, 1, 1, 1, 1,
0.3022619, -0.9178808, 1.976167, 1, 1, 1, 1, 1,
0.303519, -0.8543835, 1.62647, 1, 1, 1, 1, 1,
0.3055409, -0.5442998, 2.661805, 1, 1, 1, 1, 1,
0.3114806, -0.5528906, 4.462725, 1, 1, 1, 1, 1,
0.3206095, 0.8019753, -1.089823, 0, 0, 1, 1, 1,
0.3230532, 0.4570262, -0.8173378, 1, 0, 0, 1, 1,
0.323283, -0.0134771, 2.038954, 1, 0, 0, 1, 1,
0.3242056, -0.4266851, 2.657763, 1, 0, 0, 1, 1,
0.3343554, 2.231301, 0.1111864, 1, 0, 0, 1, 1,
0.3371052, -0.1102638, 1.58696, 1, 0, 0, 1, 1,
0.3379635, -0.3189489, 3.068708, 0, 0, 0, 1, 1,
0.3612378, 0.2207264, 1.76032, 0, 0, 0, 1, 1,
0.3666129, 0.3556169, 0.808381, 0, 0, 0, 1, 1,
0.3737599, 0.9852407, -1.429626, 0, 0, 0, 1, 1,
0.3820949, -1.714766, 3.717017, 0, 0, 0, 1, 1,
0.3825676, 0.622805, 1.181262, 0, 0, 0, 1, 1,
0.3831889, -0.1744639, 2.912444, 0, 0, 0, 1, 1,
0.3843755, 0.01249183, 2.56796, 1, 1, 1, 1, 1,
0.3904752, -0.3193949, 3.363329, 1, 1, 1, 1, 1,
0.3928361, -0.3725978, 1.717507, 1, 1, 1, 1, 1,
0.3938722, -0.4409003, 3.119881, 1, 1, 1, 1, 1,
0.4007995, -0.4654388, 1.76843, 1, 1, 1, 1, 1,
0.4014848, -0.4788614, 4.012757, 1, 1, 1, 1, 1,
0.4048552, 1.652108, 1.109565, 1, 1, 1, 1, 1,
0.4050749, -0.03475114, 0.7184548, 1, 1, 1, 1, 1,
0.4105137, -0.6780777, 3.431879, 1, 1, 1, 1, 1,
0.4112309, 0.07268406, 2.660002, 1, 1, 1, 1, 1,
0.4155936, 0.4857292, 0.4565346, 1, 1, 1, 1, 1,
0.4218154, 1.040858, 2.051237, 1, 1, 1, 1, 1,
0.4265156, 0.1175897, 0.1544621, 1, 1, 1, 1, 1,
0.4275127, 0.1324863, 1.97653, 1, 1, 1, 1, 1,
0.4331585, 0.8134451, 1.076703, 1, 1, 1, 1, 1,
0.4341218, 1.044065, -0.05351757, 0, 0, 1, 1, 1,
0.4353135, -0.7714747, 3.571332, 1, 0, 0, 1, 1,
0.436295, 0.754459, 0.2877779, 1, 0, 0, 1, 1,
0.4401028, 0.692635, 0.1387837, 1, 0, 0, 1, 1,
0.440727, 0.4975668, 1.529592, 1, 0, 0, 1, 1,
0.4425128, -1.33109, 0.2954665, 1, 0, 0, 1, 1,
0.4445009, -0.1678134, 1.504339, 0, 0, 0, 1, 1,
0.4446451, 0.771233, 0.03271066, 0, 0, 0, 1, 1,
0.4447511, 0.7826352, -0.3791281, 0, 0, 0, 1, 1,
0.4450359, -1.544479, 4.079809, 0, 0, 0, 1, 1,
0.4468664, -0.03852462, 1.505757, 0, 0, 0, 1, 1,
0.4489157, -0.5247196, 2.029008, 0, 0, 0, 1, 1,
0.4508697, 0.2092965, 1.912968, 0, 0, 0, 1, 1,
0.4515494, -1.604409, 2.307243, 1, 1, 1, 1, 1,
0.4544181, -0.2552873, 1.788811, 1, 1, 1, 1, 1,
0.4566821, -0.5288507, 2.160811, 1, 1, 1, 1, 1,
0.4576452, 0.2178075, 2.073064, 1, 1, 1, 1, 1,
0.4581231, -0.3553374, 1.342703, 1, 1, 1, 1, 1,
0.4599745, -1.5829, 1.033982, 1, 1, 1, 1, 1,
0.4629069, -0.211507, 0.8603516, 1, 1, 1, 1, 1,
0.4648379, -1.514873, 3.580717, 1, 1, 1, 1, 1,
0.4687028, 0.09137071, 2.532017, 1, 1, 1, 1, 1,
0.4694704, 1.302099, 1.625579, 1, 1, 1, 1, 1,
0.4698989, -0.6420862, 1.957168, 1, 1, 1, 1, 1,
0.4772201, 1.442965, 0.8243058, 1, 1, 1, 1, 1,
0.479097, -0.2994214, 1.841007, 1, 1, 1, 1, 1,
0.4822749, -0.2737479, 1.615944, 1, 1, 1, 1, 1,
0.482411, 0.2894484, 1.247085, 1, 1, 1, 1, 1,
0.4825979, -0.7812435, 1.346091, 0, 0, 1, 1, 1,
0.4835064, 0.5488672, 1.223307, 1, 0, 0, 1, 1,
0.4847772, 0.3387115, -1.523486, 1, 0, 0, 1, 1,
0.4916026, 0.5504213, 1.200773, 1, 0, 0, 1, 1,
0.4945211, 0.5920451, -1.292456, 1, 0, 0, 1, 1,
0.4981177, 1.308751, 0.3477566, 1, 0, 0, 1, 1,
0.5014163, 0.8392221, -0.8028308, 0, 0, 0, 1, 1,
0.5036533, 1.171255, 1.041587, 0, 0, 0, 1, 1,
0.5066826, -0.09382042, 0.3907656, 0, 0, 0, 1, 1,
0.514878, -0.8319021, 1.903126, 0, 0, 0, 1, 1,
0.5192223, -1.841904, 3.309557, 0, 0, 0, 1, 1,
0.5239596, 1.039436, 1.836164, 0, 0, 0, 1, 1,
0.5249941, 1.308815, 0.5550256, 0, 0, 0, 1, 1,
0.5291582, 2.050041, -0.4622383, 1, 1, 1, 1, 1,
0.531162, 1.17579, 1.427569, 1, 1, 1, 1, 1,
0.5393934, 1.537299, -0.5351874, 1, 1, 1, 1, 1,
0.5416107, -1.91871, 3.188005, 1, 1, 1, 1, 1,
0.5422791, -1.008915, 2.942155, 1, 1, 1, 1, 1,
0.5434102, 0.6458392, 1.292599, 1, 1, 1, 1, 1,
0.5440951, -1.301046, 1.888117, 1, 1, 1, 1, 1,
0.5464137, 0.4386469, 1.401871, 1, 1, 1, 1, 1,
0.5466588, 0.5124994, 1.342158, 1, 1, 1, 1, 1,
0.5478077, -0.9506561, 3.675251, 1, 1, 1, 1, 1,
0.5483137, 0.09364827, 0.7989343, 1, 1, 1, 1, 1,
0.5488361, -0.4183961, 2.930466, 1, 1, 1, 1, 1,
0.5489109, 0.1706934, 3.150676, 1, 1, 1, 1, 1,
0.5500101, 1.999249, 0.2347053, 1, 1, 1, 1, 1,
0.5511085, 1.378439, 0.9897794, 1, 1, 1, 1, 1,
0.5534348, -0.9045154, 3.529208, 0, 0, 1, 1, 1,
0.5569736, -0.8583837, 2.537534, 1, 0, 0, 1, 1,
0.5571412, -0.558378, 2.522205, 1, 0, 0, 1, 1,
0.558829, 0.8120978, -0.2982896, 1, 0, 0, 1, 1,
0.5591103, -2.528253, 3.307619, 1, 0, 0, 1, 1,
0.5607647, -0.3560731, 1.321675, 1, 0, 0, 1, 1,
0.5642642, -1.117996, 3.334535, 0, 0, 0, 1, 1,
0.5707334, -1.053731, 0.5174839, 0, 0, 0, 1, 1,
0.5714081, -2.026929, 2.806815, 0, 0, 0, 1, 1,
0.5724605, -1.725077, 3.305081, 0, 0, 0, 1, 1,
0.5728998, 1.071598, 0.446216, 0, 0, 0, 1, 1,
0.574969, -0.8642016, 2.024343, 0, 0, 0, 1, 1,
0.5769319, -0.3188126, 1.811767, 0, 0, 0, 1, 1,
0.5773486, -0.1930702, 1.417196, 1, 1, 1, 1, 1,
0.5777884, 0.7107589, 1.188864, 1, 1, 1, 1, 1,
0.5861874, -0.1543683, 0.399893, 1, 1, 1, 1, 1,
0.5913823, 1.16036, -1.020661, 1, 1, 1, 1, 1,
0.5943215, 0.006658468, 1.946022, 1, 1, 1, 1, 1,
0.5945088, 1.093067, 0.6113833, 1, 1, 1, 1, 1,
0.5960037, 0.8514825, 1.450814, 1, 1, 1, 1, 1,
0.5992895, -0.323236, 1.514243, 1, 1, 1, 1, 1,
0.6026593, -0.996432, 2.911293, 1, 1, 1, 1, 1,
0.6042704, 0.7788116, 1.829755, 1, 1, 1, 1, 1,
0.6078949, 0.1421538, 0.5845405, 1, 1, 1, 1, 1,
0.6104532, -0.07196198, 0.6666043, 1, 1, 1, 1, 1,
0.6116196, 0.07625935, 2.833908, 1, 1, 1, 1, 1,
0.6185215, -1.072581, 2.649784, 1, 1, 1, 1, 1,
0.6220152, 0.2031984, 0.9072274, 1, 1, 1, 1, 1,
0.6270465, 1.42404, 1.568104, 0, 0, 1, 1, 1,
0.62746, -1.771202, 4.214589, 1, 0, 0, 1, 1,
0.6307462, -0.4056838, 3.637369, 1, 0, 0, 1, 1,
0.6338634, -0.4705538, 2.572514, 1, 0, 0, 1, 1,
0.6384618, 0.8188421, -0.6196202, 1, 0, 0, 1, 1,
0.6441254, 1.911488, -0.7329366, 1, 0, 0, 1, 1,
0.6493988, 0.3200552, 1.121634, 0, 0, 0, 1, 1,
0.6505179, -1.663481, 2.576365, 0, 0, 0, 1, 1,
0.6587486, -0.1494041, -0.2374045, 0, 0, 0, 1, 1,
0.6598902, 0.1420156, 1.269407, 0, 0, 0, 1, 1,
0.6606426, 0.5385314, 0.3797635, 0, 0, 0, 1, 1,
0.6641325, -0.9802155, 1.854012, 0, 0, 0, 1, 1,
0.6642004, -1.989906, 2.194325, 0, 0, 0, 1, 1,
0.6716023, -1.870246, 2.221672, 1, 1, 1, 1, 1,
0.6754102, 1.286192, -1.0115, 1, 1, 1, 1, 1,
0.677375, -0.1890459, 2.650418, 1, 1, 1, 1, 1,
0.6775023, -1.266003, 2.159145, 1, 1, 1, 1, 1,
0.6788493, 0.0155019, 1.143792, 1, 1, 1, 1, 1,
0.6795134, 0.3379867, 0.4308828, 1, 1, 1, 1, 1,
0.680361, -0.8644873, 3.315565, 1, 1, 1, 1, 1,
0.6809239, 0.889226, 0.9788328, 1, 1, 1, 1, 1,
0.6817554, 0.2345025, 1.510314, 1, 1, 1, 1, 1,
0.6875926, 1.104839, 0.8620237, 1, 1, 1, 1, 1,
0.6898581, -0.6353211, 1.199934, 1, 1, 1, 1, 1,
0.692597, 0.3311341, 0.8479302, 1, 1, 1, 1, 1,
0.6997256, 1.699837, 1.514173, 1, 1, 1, 1, 1,
0.7001876, 0.2339599, 1.384068, 1, 1, 1, 1, 1,
0.701186, -0.6696032, 2.460685, 1, 1, 1, 1, 1,
0.7052481, -0.1676722, 3.089945, 0, 0, 1, 1, 1,
0.7102062, 1.525258, 0.1752166, 1, 0, 0, 1, 1,
0.7142823, -0.2130135, 2.194293, 1, 0, 0, 1, 1,
0.7165428, 0.1925693, 0.2712436, 1, 0, 0, 1, 1,
0.7207328, -0.9687045, 2.02522, 1, 0, 0, 1, 1,
0.7339476, 1.116332, 1.704201, 1, 0, 0, 1, 1,
0.7450331, -0.04665431, 1.617362, 0, 0, 0, 1, 1,
0.7451994, -0.0200512, 0.887363, 0, 0, 0, 1, 1,
0.7478895, -1.0324, 5.056612, 0, 0, 0, 1, 1,
0.7553518, 0.1255526, 1.83455, 0, 0, 0, 1, 1,
0.7562111, 0.3744731, 0.7803558, 0, 0, 0, 1, 1,
0.7626699, 0.4532097, 2.798704, 0, 0, 0, 1, 1,
0.7790934, 0.505007, 2.533716, 0, 0, 0, 1, 1,
0.7811976, -2.325574, 4.033843, 1, 1, 1, 1, 1,
0.7823559, 0.01402021, 0.9411055, 1, 1, 1, 1, 1,
0.7945275, 0.1880671, -0.1873076, 1, 1, 1, 1, 1,
0.7950791, 1.974979, 0.8420392, 1, 1, 1, 1, 1,
0.7957937, 0.4472274, -1.449941, 1, 1, 1, 1, 1,
0.7985708, 0.1490618, 1.070982, 1, 1, 1, 1, 1,
0.7999845, 0.2369361, 0.5682641, 1, 1, 1, 1, 1,
0.8007819, 0.7538788, 0.6330671, 1, 1, 1, 1, 1,
0.8010941, 0.7153541, 2.851794, 1, 1, 1, 1, 1,
0.8014207, -2.929589, 1.424288, 1, 1, 1, 1, 1,
0.8041693, -0.4637405, 2.629246, 1, 1, 1, 1, 1,
0.807852, -0.8636255, 1.789649, 1, 1, 1, 1, 1,
0.8145463, 0.6449053, 0.3253104, 1, 1, 1, 1, 1,
0.8174406, -0.5054859, 2.444777, 1, 1, 1, 1, 1,
0.8191037, -0.3722597, 2.270043, 1, 1, 1, 1, 1,
0.8193496, 0.4303956, 2.017324, 0, 0, 1, 1, 1,
0.8241144, -0.8633859, 1.028399, 1, 0, 0, 1, 1,
0.826474, 0.8359039, -0.6951436, 1, 0, 0, 1, 1,
0.8266124, 0.4739724, 0.07377906, 1, 0, 0, 1, 1,
0.8269895, 0.1490246, -0.8066483, 1, 0, 0, 1, 1,
0.8317978, 1.501855, -0.4226432, 1, 0, 0, 1, 1,
0.8439702, -0.5131668, 1.187448, 0, 0, 0, 1, 1,
0.847183, 0.3990274, 1.881582, 0, 0, 0, 1, 1,
0.8512244, -1.028103, 4.175986, 0, 0, 0, 1, 1,
0.8515665, 1.544402, 2.519845, 0, 0, 0, 1, 1,
0.8579702, 0.5244251, 1.874766, 0, 0, 0, 1, 1,
0.8587703, -2.512697, 2.346142, 0, 0, 0, 1, 1,
0.8645852, -0.2945183, 1.151722, 0, 0, 0, 1, 1,
0.8661802, -1.34106, 1.160488, 1, 1, 1, 1, 1,
0.8706661, 1.704009, -0.02041214, 1, 1, 1, 1, 1,
0.8743541, 0.3594576, 1.6855, 1, 1, 1, 1, 1,
0.8783327, -1.100243, 2.939754, 1, 1, 1, 1, 1,
0.8816716, -0.5797208, 0.2387834, 1, 1, 1, 1, 1,
0.8825503, 0.4125273, 3.607565, 1, 1, 1, 1, 1,
0.885259, 0.0309191, 0.5494128, 1, 1, 1, 1, 1,
0.8879447, -0.4175924, 2.306181, 1, 1, 1, 1, 1,
0.8899041, 0.05201226, 2.104128, 1, 1, 1, 1, 1,
0.8946317, 0.1048326, 0.5621474, 1, 1, 1, 1, 1,
0.8947352, -0.8752492, 1.619807, 1, 1, 1, 1, 1,
0.897097, -0.5369645, 3.554471, 1, 1, 1, 1, 1,
0.9029642, -0.9216567, 3.228441, 1, 1, 1, 1, 1,
0.9031781, 1.388626, -0.6920635, 1, 1, 1, 1, 1,
0.9032395, -1.517034, 1.571733, 1, 1, 1, 1, 1,
0.9042799, -0.162643, 1.905515, 0, 0, 1, 1, 1,
0.9058737, 2.218581, 0.4793956, 1, 0, 0, 1, 1,
0.9086578, 1.72326, 0.0434609, 1, 0, 0, 1, 1,
0.910032, -0.479569, 1.775606, 1, 0, 0, 1, 1,
0.913664, -0.179015, -0.2380551, 1, 0, 0, 1, 1,
0.914111, -0.2258933, 1.785775, 1, 0, 0, 1, 1,
0.916827, -0.3679539, 3.209289, 0, 0, 0, 1, 1,
0.9191022, 0.4904418, 0.5870726, 0, 0, 0, 1, 1,
0.9254689, 0.2622417, 0.6527923, 0, 0, 0, 1, 1,
0.9255481, -0.4741481, 3.516146, 0, 0, 0, 1, 1,
0.9274009, -0.659758, 1.241553, 0, 0, 0, 1, 1,
0.929728, -0.1040952, 3.547928, 0, 0, 0, 1, 1,
0.934393, -0.01294435, 2.098046, 0, 0, 0, 1, 1,
0.9386317, 0.2776909, 3.218645, 1, 1, 1, 1, 1,
0.9408907, 0.6941051, 0.4160601, 1, 1, 1, 1, 1,
0.9413692, 0.06185632, 3.826759, 1, 1, 1, 1, 1,
0.9438967, 1.883432, -0.2966715, 1, 1, 1, 1, 1,
0.9440449, -0.2471559, 2.879674, 1, 1, 1, 1, 1,
0.9449416, 0.5441142, 4.274668, 1, 1, 1, 1, 1,
0.9458846, 0.6909809, 1.18346, 1, 1, 1, 1, 1,
0.9468509, 0.1609712, 2.229533, 1, 1, 1, 1, 1,
0.9515222, -0.9754795, 3.698648, 1, 1, 1, 1, 1,
0.9566542, 0.4835747, -0.6234429, 1, 1, 1, 1, 1,
0.9619582, -1.417104, 1.64221, 1, 1, 1, 1, 1,
0.964455, -1.499783, 3.852918, 1, 1, 1, 1, 1,
0.967138, -0.3306752, 3.005435, 1, 1, 1, 1, 1,
0.9676023, -0.03279474, 2.086461, 1, 1, 1, 1, 1,
0.9692605, 1.354365, -1.279866, 1, 1, 1, 1, 1,
0.9702536, -0.07037173, 1.716394, 0, 0, 1, 1, 1,
0.9784641, 0.5541093, 0.8560498, 1, 0, 0, 1, 1,
0.9842978, -3.370999, 1.37162, 1, 0, 0, 1, 1,
0.9880489, 0.04704739, 1.795061, 1, 0, 0, 1, 1,
0.9896036, 0.2698512, 2.150671, 1, 0, 0, 1, 1,
0.9913352, 0.3012542, 2.027259, 1, 0, 0, 1, 1,
0.9996772, -1.684156, 2.7809, 0, 0, 0, 1, 1,
1.000751, -2.403442, 3.462221, 0, 0, 0, 1, 1,
1.001679, 0.7971125, 0.9518259, 0, 0, 0, 1, 1,
1.005215, 0.4273376, 1.457281, 0, 0, 0, 1, 1,
1.005655, 0.7597583, 0.8011805, 0, 0, 0, 1, 1,
1.00635, 0.8534408, 1.61533, 0, 0, 0, 1, 1,
1.007428, -1.273069, 2.445948, 0, 0, 0, 1, 1,
1.012413, -2.049006, 3.024937, 1, 1, 1, 1, 1,
1.017916, 0.331733, 1.856073, 1, 1, 1, 1, 1,
1.024591, -1.222648, 2.798218, 1, 1, 1, 1, 1,
1.026116, -0.226677, 3.295371, 1, 1, 1, 1, 1,
1.027991, -1.603726, 2.500113, 1, 1, 1, 1, 1,
1.030385, -1.341018, 2.094486, 1, 1, 1, 1, 1,
1.032844, -0.1924595, 3.568676, 1, 1, 1, 1, 1,
1.034375, -0.8602244, 2.493303, 1, 1, 1, 1, 1,
1.035858, -0.603833, 2.731111, 1, 1, 1, 1, 1,
1.040233, -0.03206043, -0.5136248, 1, 1, 1, 1, 1,
1.048518, -0.4604928, 1.292128, 1, 1, 1, 1, 1,
1.052534, 0.3881259, 0.1503288, 1, 1, 1, 1, 1,
1.060489, -2.905064, 4.4848, 1, 1, 1, 1, 1,
1.066276, -1.306397, 3.102593, 1, 1, 1, 1, 1,
1.066497, -1.086675, 1.048293, 1, 1, 1, 1, 1,
1.068028, -1.170773, 4.180212, 0, 0, 1, 1, 1,
1.072567, 0.5324869, -0.3122894, 1, 0, 0, 1, 1,
1.073883, -0.6033555, 4.615644, 1, 0, 0, 1, 1,
1.074623, 0.9733748, 0.1890765, 1, 0, 0, 1, 1,
1.080756, 0.002876923, 1.252295, 1, 0, 0, 1, 1,
1.082429, 0.5457787, 0.3340387, 1, 0, 0, 1, 1,
1.087973, -1.405527, 4.064874, 0, 0, 0, 1, 1,
1.092649, -0.6449491, 2.611619, 0, 0, 0, 1, 1,
1.097229, 1.73591, 0.1212414, 0, 0, 0, 1, 1,
1.101095, -0.4604048, 2.242112, 0, 0, 0, 1, 1,
1.105643, -0.953855, 2.077034, 0, 0, 0, 1, 1,
1.10646, 0.9366277, 2.409385, 0, 0, 0, 1, 1,
1.108997, -1.681366, 3.553693, 0, 0, 0, 1, 1,
1.11363, -0.9290456, 2.604767, 1, 1, 1, 1, 1,
1.127303, 1.14319, 1.431371, 1, 1, 1, 1, 1,
1.130499, 0.1180232, 0.2172377, 1, 1, 1, 1, 1,
1.139733, 0.06725056, 1.511958, 1, 1, 1, 1, 1,
1.13994, 0.4881326, 1.647008, 1, 1, 1, 1, 1,
1.14171, -1.103577, 3.564652, 1, 1, 1, 1, 1,
1.141748, -1.616098, 3.81334, 1, 1, 1, 1, 1,
1.152326, 0.5049345, 0.1665762, 1, 1, 1, 1, 1,
1.154781, -0.7096198, 1.831409, 1, 1, 1, 1, 1,
1.175446, 2.152637, 1.483394, 1, 1, 1, 1, 1,
1.181595, -0.7854506, 2.941302, 1, 1, 1, 1, 1,
1.184241, -2.258319, 3.003766, 1, 1, 1, 1, 1,
1.188057, 1.248962, -1.51198, 1, 1, 1, 1, 1,
1.193519, 0.3556806, -1.319781, 1, 1, 1, 1, 1,
1.196025, 0.2911994, 1.744686, 1, 1, 1, 1, 1,
1.196739, 0.3053373, 2.381099, 0, 0, 1, 1, 1,
1.196913, -0.7733654, 2.15916, 1, 0, 0, 1, 1,
1.202635, -1.027032, 1.594209, 1, 0, 0, 1, 1,
1.203879, 0.4325855, 2.954247, 1, 0, 0, 1, 1,
1.220294, 1.784523, 1.577069, 1, 0, 0, 1, 1,
1.222652, 0.2552544, 1.526157, 1, 0, 0, 1, 1,
1.227956, 1.124097, 0.5202894, 0, 0, 0, 1, 1,
1.229155, -2.69961, 3.011985, 0, 0, 0, 1, 1,
1.229272, -0.5431877, 1.238815, 0, 0, 0, 1, 1,
1.240517, -1.306152, 2.9556, 0, 0, 0, 1, 1,
1.241274, -1.333135, 4.446549, 0, 0, 0, 1, 1,
1.242655, 2.560697, 0.7156754, 0, 0, 0, 1, 1,
1.268803, -2.143197, 2.609826, 0, 0, 0, 1, 1,
1.274008, -0.6237165, 1.527157, 1, 1, 1, 1, 1,
1.277556, -0.7646366, 3.01145, 1, 1, 1, 1, 1,
1.284486, -0.5888445, 3.667189, 1, 1, 1, 1, 1,
1.285365, -0.343926, 1.62445, 1, 1, 1, 1, 1,
1.306128, -0.9093475, 2.192165, 1, 1, 1, 1, 1,
1.316101, 0.353833, 2.004988, 1, 1, 1, 1, 1,
1.33696, 0.1932445, -0.5115969, 1, 1, 1, 1, 1,
1.338117, 0.353981, 0.1992829, 1, 1, 1, 1, 1,
1.344322, -0.4158413, 2.145126, 1, 1, 1, 1, 1,
1.359052, 1.253711, 0.9787502, 1, 1, 1, 1, 1,
1.359808, -0.1771449, 1.434915, 1, 1, 1, 1, 1,
1.361908, -0.4716332, 1.859721, 1, 1, 1, 1, 1,
1.379559, -0.5861098, 0.2287838, 1, 1, 1, 1, 1,
1.382052, -0.1143652, 1.206287, 1, 1, 1, 1, 1,
1.383255, -0.9375538, 2.320234, 1, 1, 1, 1, 1,
1.405056, 0.2115698, 2.056818, 0, 0, 1, 1, 1,
1.405313, 1.503924, -0.014529, 1, 0, 0, 1, 1,
1.412094, -1.6172, 3.51872, 1, 0, 0, 1, 1,
1.412662, 0.093056, 0.6042105, 1, 0, 0, 1, 1,
1.420576, 0.9149075, 0.0419082, 1, 0, 0, 1, 1,
1.43336, 0.6634955, 0.08048016, 1, 0, 0, 1, 1,
1.433459, 0.720138, -0.5335069, 0, 0, 0, 1, 1,
1.437852, -0.9391068, 2.171444, 0, 0, 0, 1, 1,
1.44511, -0.9266696, 1.726886, 0, 0, 0, 1, 1,
1.445181, 0.9417174, 1.979252, 0, 0, 0, 1, 1,
1.447635, 0.1923082, 1.89318, 0, 0, 0, 1, 1,
1.449246, -0.7222517, 0.9531243, 0, 0, 0, 1, 1,
1.449486, -1.115757, 2.73473, 0, 0, 0, 1, 1,
1.456006, 0.03680621, 1.317008, 1, 1, 1, 1, 1,
1.463986, -0.352444, 2.207032, 1, 1, 1, 1, 1,
1.483586, 1.72067, -0.8837014, 1, 1, 1, 1, 1,
1.490575, -2.039291, 4.604163, 1, 1, 1, 1, 1,
1.492267, -0.7122723, 2.757707, 1, 1, 1, 1, 1,
1.503831, 0.2638594, 2.800148, 1, 1, 1, 1, 1,
1.528775, 0.2406924, 1.80681, 1, 1, 1, 1, 1,
1.541405, -1.677569, 1.718528, 1, 1, 1, 1, 1,
1.545739, 0.3351391, 1.362425, 1, 1, 1, 1, 1,
1.549389, 1.535264, 1.28245, 1, 1, 1, 1, 1,
1.569459, 0.3687036, 0.2875968, 1, 1, 1, 1, 1,
1.569608, -0.8421322, 2.054361, 1, 1, 1, 1, 1,
1.571704, -0.2704576, 0.9026988, 1, 1, 1, 1, 1,
1.574639, -0.03308061, 2.600395, 1, 1, 1, 1, 1,
1.579527, 0.2964518, 1.316988, 1, 1, 1, 1, 1,
1.591801, -0.5946087, 0.491438, 0, 0, 1, 1, 1,
1.593843, -1.24245, 1.318995, 1, 0, 0, 1, 1,
1.59626, -1.610736, 2.368319, 1, 0, 0, 1, 1,
1.609378, 1.109323, 1.910391, 1, 0, 0, 1, 1,
1.619305, 0.4111763, 0.800706, 1, 0, 0, 1, 1,
1.623721, -0.1585587, 1.845516, 1, 0, 0, 1, 1,
1.624556, -0.2639516, 1.400138, 0, 0, 0, 1, 1,
1.670529, -0.2690828, 0.9453701, 0, 0, 0, 1, 1,
1.673929, -1.183288, 1.587651, 0, 0, 0, 1, 1,
1.69096, 0.2778014, 2.241671, 0, 0, 0, 1, 1,
1.691914, -1.593786, 1.637394, 0, 0, 0, 1, 1,
1.775723, 0.3011178, 0.8584833, 0, 0, 0, 1, 1,
1.776125, -1.147233, 3.081327, 0, 0, 0, 1, 1,
1.778397, -0.407667, 1.206349, 1, 1, 1, 1, 1,
1.794331, 1.615228, -0.5610605, 1, 1, 1, 1, 1,
1.80558, -0.2955942, 0.2662821, 1, 1, 1, 1, 1,
1.82362, 0.4575919, 0.5242175, 1, 1, 1, 1, 1,
1.831799, -0.5890033, 2.784096, 1, 1, 1, 1, 1,
1.83459, 0.3872009, 0.6837731, 1, 1, 1, 1, 1,
1.837107, 0.3519812, 1.286263, 1, 1, 1, 1, 1,
1.846393, 0.6082509, 1.961454, 1, 1, 1, 1, 1,
1.866767, 1.559044, 1.446459, 1, 1, 1, 1, 1,
1.906957, 0.3011529, 1.349093, 1, 1, 1, 1, 1,
1.910285, -0.7380509, 1.842625, 1, 1, 1, 1, 1,
1.915048, -0.1668918, 1.704948, 1, 1, 1, 1, 1,
1.967359, -0.4284561, 3.75129, 1, 1, 1, 1, 1,
1.975024, -0.1952917, 2.763404, 1, 1, 1, 1, 1,
1.975515, 0.8502862, -0.1837263, 1, 1, 1, 1, 1,
1.976764, -1.973199, 2.459184, 0, 0, 1, 1, 1,
1.977535, -0.7120908, 1.164418, 1, 0, 0, 1, 1,
2.006787, -1.526809, 3.282172, 1, 0, 0, 1, 1,
2.041227, -0.390176, 0.8919526, 1, 0, 0, 1, 1,
2.059517, -0.3259742, 1.105157, 1, 0, 0, 1, 1,
2.065673, 0.6394309, 2.934685, 1, 0, 0, 1, 1,
2.105196, -0.9637639, 1.991885, 0, 0, 0, 1, 1,
2.13026, 1.327647, 0.1896299, 0, 0, 0, 1, 1,
2.161416, 0.9769655, 2.152275, 0, 0, 0, 1, 1,
2.177186, -0.3123361, 1.589121, 0, 0, 0, 1, 1,
2.180895, 2.037077, 1.288235, 0, 0, 0, 1, 1,
2.36662, -0.7594957, 1.345122, 0, 0, 0, 1, 1,
2.394481, 0.5390818, 0.5637513, 0, 0, 0, 1, 1,
2.406658, 0.3486923, 1.264506, 1, 1, 1, 1, 1,
2.487782, -1.36471, 2.352667, 1, 1, 1, 1, 1,
2.521498, 0.1863915, 0.4280873, 1, 1, 1, 1, 1,
2.539081, -0.2316946, 2.638851, 1, 1, 1, 1, 1,
2.702737, 1.348595, 2.056101, 1, 1, 1, 1, 1,
2.910207, 0.3350984, 0.8085747, 1, 1, 1, 1, 1,
3.134291, 0.1813783, 0.5533285, 1, 1, 1, 1, 1
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
var radius = 9.479359;
var distance = 33.29585;
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
mvMatrix.translate( -0.142349, 0.212492, 0.3491848 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.29585);
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
