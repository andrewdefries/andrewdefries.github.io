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
-2.855345, 0.1755529, -0.6118736, 1, 0, 0, 1,
-2.557046, 1.24761, 0.1388098, 1, 0.007843138, 0, 1,
-2.488585, 1.102998, -1.632303, 1, 0.01176471, 0, 1,
-2.472072, 2.028451, -0.8455365, 1, 0.01960784, 0, 1,
-2.440842, -0.5454892, -1.693775, 1, 0.02352941, 0, 1,
-2.414627, 1.247433, -1.453198, 1, 0.03137255, 0, 1,
-2.357959, 0.5299935, -1.325343, 1, 0.03529412, 0, 1,
-2.328951, -0.0179929, -0.8611052, 1, 0.04313726, 0, 1,
-2.265467, -1.108173, -1.470601, 1, 0.04705882, 0, 1,
-2.26341, 0.5483605, -0.4091923, 1, 0.05490196, 0, 1,
-2.251342, 0.4477313, -2.746393, 1, 0.05882353, 0, 1,
-2.249177, 0.1237119, -2.35883, 1, 0.06666667, 0, 1,
-2.227158, -0.7479034, -2.403204, 1, 0.07058824, 0, 1,
-2.227121, 0.3323317, -0.5694645, 1, 0.07843138, 0, 1,
-2.181089, -0.9768138, -3.371282, 1, 0.08235294, 0, 1,
-2.149756, -1.950749, -1.242904, 1, 0.09019608, 0, 1,
-2.146454, -0.04888551, -1.161189, 1, 0.09411765, 0, 1,
-2.143157, 0.4892246, -2.773561, 1, 0.1019608, 0, 1,
-2.14029, 0.3812705, -1.264783, 1, 0.1098039, 0, 1,
-2.139907, -0.543108, 0.1294956, 1, 0.1137255, 0, 1,
-2.08541, 0.8459727, -1.454947, 1, 0.1215686, 0, 1,
-2.058934, -1.461097, -1.027202, 1, 0.1254902, 0, 1,
-2.024879, -1.047716, -4.139026, 1, 0.1333333, 0, 1,
-2.019948, 0.1638933, -0.3757636, 1, 0.1372549, 0, 1,
-1.994192, -0.03069949, -1.487804, 1, 0.145098, 0, 1,
-1.991948, 2.028195, -1.135114, 1, 0.1490196, 0, 1,
-1.950144, 0.7774804, -1.460398, 1, 0.1568628, 0, 1,
-1.945238, -1.349736, -1.060391, 1, 0.1607843, 0, 1,
-1.912189, 0.5555364, -1.864599, 1, 0.1686275, 0, 1,
-1.897178, 0.3292311, -1.916913, 1, 0.172549, 0, 1,
-1.891413, 0.5985358, -1.087576, 1, 0.1803922, 0, 1,
-1.878288, -0.3377542, -3.167507, 1, 0.1843137, 0, 1,
-1.860376, -0.2516176, -1.967998, 1, 0.1921569, 0, 1,
-1.83407, -0.4422014, -0.6658686, 1, 0.1960784, 0, 1,
-1.792489, -0.03412608, -1.938337, 1, 0.2039216, 0, 1,
-1.738493, 0.66181, -0.242622, 1, 0.2117647, 0, 1,
-1.70135, -0.1138824, -1.443505, 1, 0.2156863, 0, 1,
-1.694986, 0.7394679, -0.0993245, 1, 0.2235294, 0, 1,
-1.693323, -0.7413021, 0.1494781, 1, 0.227451, 0, 1,
-1.681448, 0.3301402, -1.008255, 1, 0.2352941, 0, 1,
-1.681033, -1.017414, -3.476165, 1, 0.2392157, 0, 1,
-1.677956, 0.4509677, -1.923118, 1, 0.2470588, 0, 1,
-1.673831, 1.043006, -1.000715, 1, 0.2509804, 0, 1,
-1.671434, 0.5688004, -1.044562, 1, 0.2588235, 0, 1,
-1.652321, -0.1332797, -2.768568, 1, 0.2627451, 0, 1,
-1.625578, 0.1018914, 0.4357826, 1, 0.2705882, 0, 1,
-1.622768, -1.032243, -2.30875, 1, 0.2745098, 0, 1,
-1.620821, 1.052554, -1.10778, 1, 0.282353, 0, 1,
-1.610877, -1.110149, -1.811842, 1, 0.2862745, 0, 1,
-1.610669, -0.09010836, -0.9487582, 1, 0.2941177, 0, 1,
-1.608831, -1.072055, -1.287053, 1, 0.3019608, 0, 1,
-1.595593, 0.2406389, -2.896172, 1, 0.3058824, 0, 1,
-1.592335, 0.2699296, -2.029435, 1, 0.3137255, 0, 1,
-1.591219, -1.710012, -2.638135, 1, 0.3176471, 0, 1,
-1.574011, 1.073741, -0.6812675, 1, 0.3254902, 0, 1,
-1.5326, -0.9539064, -3.228361, 1, 0.3294118, 0, 1,
-1.523761, -0.1007369, -1.64431, 1, 0.3372549, 0, 1,
-1.52324, -0.3808025, -0.8442861, 1, 0.3411765, 0, 1,
-1.522659, 0.03116465, -2.010662, 1, 0.3490196, 0, 1,
-1.517195, 1.932476, 0.1113734, 1, 0.3529412, 0, 1,
-1.5145, -0.4494373, -2.188784, 1, 0.3607843, 0, 1,
-1.494866, -0.5297699, -2.341213, 1, 0.3647059, 0, 1,
-1.488233, 1.836528, -0.7044384, 1, 0.372549, 0, 1,
-1.485171, -0.02861555, -1.396161, 1, 0.3764706, 0, 1,
-1.484727, -0.6050134, -2.459829, 1, 0.3843137, 0, 1,
-1.483962, 0.816267, -1.252151, 1, 0.3882353, 0, 1,
-1.461948, 1.100153, -0.3349476, 1, 0.3960784, 0, 1,
-1.458186, -1.194583, -2.363225, 1, 0.4039216, 0, 1,
-1.450434, 0.3244329, -2.734197, 1, 0.4078431, 0, 1,
-1.441387, 0.1624164, -1.491809, 1, 0.4156863, 0, 1,
-1.435184, -0.6849623, -2.377614, 1, 0.4196078, 0, 1,
-1.434718, 0.1416198, -0.3398913, 1, 0.427451, 0, 1,
-1.434137, 0.3774736, -1.905762, 1, 0.4313726, 0, 1,
-1.420701, -0.343264, -2.224179, 1, 0.4392157, 0, 1,
-1.418071, 0.6670735, -0.4747899, 1, 0.4431373, 0, 1,
-1.417746, 1.234742, 0.3908351, 1, 0.4509804, 0, 1,
-1.413655, -1.463633, -2.482829, 1, 0.454902, 0, 1,
-1.405892, 1.609548, -0.5906145, 1, 0.4627451, 0, 1,
-1.400777, 0.4801706, 0.5967828, 1, 0.4666667, 0, 1,
-1.396165, 1.581333, -1.669807, 1, 0.4745098, 0, 1,
-1.384667, -0.2806211, -1.89782, 1, 0.4784314, 0, 1,
-1.376006, -1.293106, -3.147571, 1, 0.4862745, 0, 1,
-1.354618, -0.1056919, -1.009701, 1, 0.4901961, 0, 1,
-1.353045, 0.06615525, -1.079143, 1, 0.4980392, 0, 1,
-1.349349, 0.3508883, -1.991227, 1, 0.5058824, 0, 1,
-1.343241, -0.1094132, -1.575158, 1, 0.509804, 0, 1,
-1.329119, 0.05170568, -1.777683, 1, 0.5176471, 0, 1,
-1.327583, 1.373521, -0.4571577, 1, 0.5215687, 0, 1,
-1.320851, 0.2975208, -0.9505807, 1, 0.5294118, 0, 1,
-1.314341, 2.256127, -0.4363548, 1, 0.5333334, 0, 1,
-1.305715, 0.2636292, -2.912604, 1, 0.5411765, 0, 1,
-1.296215, 0.4726718, -0.4040958, 1, 0.5450981, 0, 1,
-1.295123, 1.149002, -0.109125, 1, 0.5529412, 0, 1,
-1.294619, -1.077137, -1.338356, 1, 0.5568628, 0, 1,
-1.293102, 0.4694848, -0.6678273, 1, 0.5647059, 0, 1,
-1.292405, -0.1183995, -2.347081, 1, 0.5686275, 0, 1,
-1.291332, -0.2681841, -4.200103, 1, 0.5764706, 0, 1,
-1.287147, -0.6956831, -2.193791, 1, 0.5803922, 0, 1,
-1.267648, 1.056001, -2.196768, 1, 0.5882353, 0, 1,
-1.262983, 0.03108636, -1.369471, 1, 0.5921569, 0, 1,
-1.256508, 1.598383, -1.63279, 1, 0.6, 0, 1,
-1.256445, -0.2991897, -2.957598, 1, 0.6078432, 0, 1,
-1.252717, -1.356201, -2.567743, 1, 0.6117647, 0, 1,
-1.249534, 0.2242246, -1.755213, 1, 0.6196079, 0, 1,
-1.237902, -0.3198327, -2.105654, 1, 0.6235294, 0, 1,
-1.227123, 0.6192286, -2.343774, 1, 0.6313726, 0, 1,
-1.224124, -0.9576426, -3.397896, 1, 0.6352941, 0, 1,
-1.219472, 0.6505, -2.191057, 1, 0.6431373, 0, 1,
-1.216255, -0.6867749, -2.26818, 1, 0.6470588, 0, 1,
-1.215027, 0.1583474, -2.924152, 1, 0.654902, 0, 1,
-1.210932, 1.319244, -1.837961, 1, 0.6588235, 0, 1,
-1.209395, -0.7255309, -0.03670817, 1, 0.6666667, 0, 1,
-1.209395, 1.610937, -1.201319, 1, 0.6705883, 0, 1,
-1.205196, 0.4834759, 0.1795667, 1, 0.6784314, 0, 1,
-1.200683, -0.7050747, -1.235296, 1, 0.682353, 0, 1,
-1.199359, -0.08577832, -3.620614, 1, 0.6901961, 0, 1,
-1.196467, 0.2223243, -1.003991, 1, 0.6941177, 0, 1,
-1.190848, 0.1022016, -0.9522836, 1, 0.7019608, 0, 1,
-1.181827, 0.955826, -1.853456, 1, 0.7098039, 0, 1,
-1.176631, -0.07079559, -3.027447, 1, 0.7137255, 0, 1,
-1.174671, -0.1438918, -3.64868, 1, 0.7215686, 0, 1,
-1.168847, -0.3365572, -1.094269, 1, 0.7254902, 0, 1,
-1.162581, 0.3526804, -1.859274, 1, 0.7333333, 0, 1,
-1.159311, 0.405318, -2.031384, 1, 0.7372549, 0, 1,
-1.157565, 1.175528, 1.360411, 1, 0.7450981, 0, 1,
-1.155127, 0.06026038, -1.02806, 1, 0.7490196, 0, 1,
-1.152709, 1.061918, 0.800226, 1, 0.7568628, 0, 1,
-1.150366, -0.05611005, -1.373452, 1, 0.7607843, 0, 1,
-1.131949, 0.6981725, -1.27221, 1, 0.7686275, 0, 1,
-1.130739, 0.3827243, -1.679165, 1, 0.772549, 0, 1,
-1.129722, -0.6562157, -1.648269, 1, 0.7803922, 0, 1,
-1.12796, -0.2704841, -1.215281, 1, 0.7843137, 0, 1,
-1.125903, -0.1530901, -0.8560396, 1, 0.7921569, 0, 1,
-1.124932, 0.6313448, 0.4941939, 1, 0.7960784, 0, 1,
-1.11804, 1.519794, -1.541036, 1, 0.8039216, 0, 1,
-1.113329, -2.006396, -2.01363, 1, 0.8117647, 0, 1,
-1.11182, -0.7336786, -1.105106, 1, 0.8156863, 0, 1,
-1.10486, -1.331551, -2.067745, 1, 0.8235294, 0, 1,
-1.103281, 0.2179711, -0.9651473, 1, 0.827451, 0, 1,
-1.102796, -1.057856, -2.455188, 1, 0.8352941, 0, 1,
-1.091652, 0.143279, -2.500162, 1, 0.8392157, 0, 1,
-1.086883, -0.06394866, -1.061418, 1, 0.8470588, 0, 1,
-1.077692, 0.1763822, -1.846245, 1, 0.8509804, 0, 1,
-1.077594, 1.602631, -2.354084, 1, 0.8588235, 0, 1,
-1.073452, 1.288071, -3.818743, 1, 0.8627451, 0, 1,
-1.072272, 1.67163, -1.670475, 1, 0.8705882, 0, 1,
-1.067528, 0.736246, -0.2768692, 1, 0.8745098, 0, 1,
-1.056362, -0.4180603, -2.616555, 1, 0.8823529, 0, 1,
-1.050737, 0.5670975, -0.4666873, 1, 0.8862745, 0, 1,
-1.039428, 0.1737326, -0.4488608, 1, 0.8941177, 0, 1,
-1.032483, -0.1254445, -1.365996, 1, 0.8980392, 0, 1,
-1.03171, -0.01321652, -0.645847, 1, 0.9058824, 0, 1,
-1.027079, 0.2876042, -0.0436047, 1, 0.9137255, 0, 1,
-1.024633, 1.477295, -1.586536, 1, 0.9176471, 0, 1,
-1.020183, 0.8430039, -1.4928, 1, 0.9254902, 0, 1,
-1.01962, -1.082024, -2.010781, 1, 0.9294118, 0, 1,
-1.017729, -0.5342238, -1.066568, 1, 0.9372549, 0, 1,
-1.01242, -0.105505, -1.152661, 1, 0.9411765, 0, 1,
-1.007309, -1.898559, -0.1511068, 1, 0.9490196, 0, 1,
-0.99379, 1.840526, -1.8379, 1, 0.9529412, 0, 1,
-0.9926857, 1.99968, -2.169272, 1, 0.9607843, 0, 1,
-0.9863465, 1.504561, -0.9142529, 1, 0.9647059, 0, 1,
-0.985523, -0.2650811, -1.810619, 1, 0.972549, 0, 1,
-0.9797148, -1.294622, -1.780644, 1, 0.9764706, 0, 1,
-0.9680687, 0.5702273, 0.3771229, 1, 0.9843137, 0, 1,
-0.9615725, 0.4463343, -0.552719, 1, 0.9882353, 0, 1,
-0.9606597, -0.1969638, -3.42592, 1, 0.9960784, 0, 1,
-0.9547911, -0.2274933, -3.361643, 0.9960784, 1, 0, 1,
-0.9546422, 0.9821098, 0.3629645, 0.9921569, 1, 0, 1,
-0.9477592, 0.04599399, -1.921106, 0.9843137, 1, 0, 1,
-0.9389042, -0.08035874, -1.709233, 0.9803922, 1, 0, 1,
-0.9375558, 0.9877247, 0.07936794, 0.972549, 1, 0, 1,
-0.9321886, -0.2779708, -0.2138628, 0.9686275, 1, 0, 1,
-0.9316653, 0.3605058, -1.184297, 0.9607843, 1, 0, 1,
-0.9308234, -0.1811959, -0.5586378, 0.9568627, 1, 0, 1,
-0.9283988, -0.490364, -1.995756, 0.9490196, 1, 0, 1,
-0.9275203, 0.3590842, 0.8579999, 0.945098, 1, 0, 1,
-0.9249362, 1.170422, 0.007290483, 0.9372549, 1, 0, 1,
-0.918144, -0.3083439, -2.093479, 0.9333333, 1, 0, 1,
-0.9133899, -0.2939498, -3.275992, 0.9254902, 1, 0, 1,
-0.9096742, 1.348018, -0.6841525, 0.9215686, 1, 0, 1,
-0.9072487, 0.3670584, -2.049587, 0.9137255, 1, 0, 1,
-0.9065728, -1.183798, -1.755618, 0.9098039, 1, 0, 1,
-0.90383, 0.3084395, -0.6417822, 0.9019608, 1, 0, 1,
-0.9009003, 0.7871403, 1.771944, 0.8941177, 1, 0, 1,
-0.8931534, -0.2265309, -2.0809, 0.8901961, 1, 0, 1,
-0.8903764, 0.4043629, -1.628045, 0.8823529, 1, 0, 1,
-0.8892972, 0.7009997, -2.075538, 0.8784314, 1, 0, 1,
-0.8880917, -0.480975, -4.300914, 0.8705882, 1, 0, 1,
-0.8879853, -1.623611, -1.996107, 0.8666667, 1, 0, 1,
-0.8855078, 0.5132634, -0.7669737, 0.8588235, 1, 0, 1,
-0.8851827, -0.441515, -1.92933, 0.854902, 1, 0, 1,
-0.8830606, 0.3473278, -2.811024, 0.8470588, 1, 0, 1,
-0.8825625, -0.16512, -1.644853, 0.8431373, 1, 0, 1,
-0.8782299, 0.01836733, -2.933841, 0.8352941, 1, 0, 1,
-0.8764011, -0.2980424, -3.529396, 0.8313726, 1, 0, 1,
-0.876307, -1.226948, -4.78335, 0.8235294, 1, 0, 1,
-0.8744653, 0.4491176, -2.937923, 0.8196079, 1, 0, 1,
-0.8701741, -3.785551, -3.139493, 0.8117647, 1, 0, 1,
-0.8674965, 1.220377, -2.060934, 0.8078431, 1, 0, 1,
-0.866354, 1.670654, 1.613461, 0.8, 1, 0, 1,
-0.8613684, -0.8846878, -1.006414, 0.7921569, 1, 0, 1,
-0.8584162, 0.5461411, -2.131415, 0.7882353, 1, 0, 1,
-0.857537, -0.7823437, -0.987052, 0.7803922, 1, 0, 1,
-0.8480873, 0.5960349, -0.6028003, 0.7764706, 1, 0, 1,
-0.8472224, 1.564597, -0.3946721, 0.7686275, 1, 0, 1,
-0.838755, 0.3044356, -1.511635, 0.7647059, 1, 0, 1,
-0.8372081, -0.8857656, -3.271725, 0.7568628, 1, 0, 1,
-0.8353726, 0.04727446, -2.676332, 0.7529412, 1, 0, 1,
-0.826923, -0.5307007, -3.731444, 0.7450981, 1, 0, 1,
-0.8226635, 1.858136, -0.966383, 0.7411765, 1, 0, 1,
-0.8179112, 2.729665, -1.610541, 0.7333333, 1, 0, 1,
-0.8157981, 0.389801, -0.3255905, 0.7294118, 1, 0, 1,
-0.8152776, -0.7881908, -2.907951, 0.7215686, 1, 0, 1,
-0.8132051, -1.556851, -2.220583, 0.7176471, 1, 0, 1,
-0.8090519, 0.1244904, -1.429604, 0.7098039, 1, 0, 1,
-0.8036861, 0.4779029, -0.04753304, 0.7058824, 1, 0, 1,
-0.7996728, -0.8366905, -2.751393, 0.6980392, 1, 0, 1,
-0.7996165, -0.4751236, -2.19868, 0.6901961, 1, 0, 1,
-0.795682, -0.5363261, -1.119566, 0.6862745, 1, 0, 1,
-0.7844802, 0.01149109, -1.03265, 0.6784314, 1, 0, 1,
-0.7825149, -0.6764478, -0.8734616, 0.6745098, 1, 0, 1,
-0.7815463, -0.03180497, -0.8478643, 0.6666667, 1, 0, 1,
-0.7812864, 0.4303785, 0.5255624, 0.6627451, 1, 0, 1,
-0.7702207, 2.131027, 0.6005226, 0.654902, 1, 0, 1,
-0.7623155, 1.309691, -1.475148, 0.6509804, 1, 0, 1,
-0.7573113, -0.09591313, -0.7635112, 0.6431373, 1, 0, 1,
-0.7566412, -2.327254, -2.647219, 0.6392157, 1, 0, 1,
-0.7496564, 2.242854, -0.8041196, 0.6313726, 1, 0, 1,
-0.7487167, -0.4642022, -1.734191, 0.627451, 1, 0, 1,
-0.7467073, 1.007856, -1.004813, 0.6196079, 1, 0, 1,
-0.7452663, -0.4561672, -1.052373, 0.6156863, 1, 0, 1,
-0.7449449, 1.701615, -1.16811, 0.6078432, 1, 0, 1,
-0.740449, -0.9133283, -2.125049, 0.6039216, 1, 0, 1,
-0.7316006, -0.7945002, -5.755074, 0.5960785, 1, 0, 1,
-0.7306619, -0.008070241, -1.575903, 0.5882353, 1, 0, 1,
-0.72868, 0.8684509, -0.1558151, 0.5843138, 1, 0, 1,
-0.7211882, 1.767612, -0.5732976, 0.5764706, 1, 0, 1,
-0.7192473, 0.5716447, -0.5749577, 0.572549, 1, 0, 1,
-0.7167733, -0.2980465, -1.924172, 0.5647059, 1, 0, 1,
-0.7142643, 0.1989441, -0.8264485, 0.5607843, 1, 0, 1,
-0.7067987, -0.7074834, -2.585068, 0.5529412, 1, 0, 1,
-0.7021107, -0.2151783, -2.379874, 0.5490196, 1, 0, 1,
-0.7005324, 0.03473951, -0.443219, 0.5411765, 1, 0, 1,
-0.6997761, -0.2844273, -1.33824, 0.5372549, 1, 0, 1,
-0.6961424, -0.1016047, -0.8429496, 0.5294118, 1, 0, 1,
-0.694357, -0.3900304, -1.676719, 0.5254902, 1, 0, 1,
-0.6935291, -2.34473, -2.358506, 0.5176471, 1, 0, 1,
-0.6847982, -0.9340183, -2.324558, 0.5137255, 1, 0, 1,
-0.6833128, 0.3867199, -1.840918, 0.5058824, 1, 0, 1,
-0.6822963, -0.9897909, -1.861399, 0.5019608, 1, 0, 1,
-0.6788206, 1.139066, 0.343488, 0.4941176, 1, 0, 1,
-0.6747228, 0.9945974, -3.172039, 0.4862745, 1, 0, 1,
-0.6741096, 0.9911827, -1.941701, 0.4823529, 1, 0, 1,
-0.6724191, 0.7114546, -0.697631, 0.4745098, 1, 0, 1,
-0.6702132, -1.72592, -2.947193, 0.4705882, 1, 0, 1,
-0.6685367, -1.70397, -3.380817, 0.4627451, 1, 0, 1,
-0.6629872, -0.2402858, -1.147036, 0.4588235, 1, 0, 1,
-0.6571121, -1.547611, -3.950805, 0.4509804, 1, 0, 1,
-0.656265, 0.4305822, -0.6378239, 0.4470588, 1, 0, 1,
-0.6511193, -0.5206248, -2.691403, 0.4392157, 1, 0, 1,
-0.6505961, -0.1796621, -1.315275, 0.4352941, 1, 0, 1,
-0.6501524, 0.4219601, -1.597028, 0.427451, 1, 0, 1,
-0.6346273, 0.9639995, 0.1333398, 0.4235294, 1, 0, 1,
-0.6343125, 0.7991414, -1.354316, 0.4156863, 1, 0, 1,
-0.6305068, 0.4798945, -1.298296, 0.4117647, 1, 0, 1,
-0.6288105, -0.05143343, -2.100494, 0.4039216, 1, 0, 1,
-0.6184493, -0.3565003, -1.753465, 0.3960784, 1, 0, 1,
-0.6166309, 1.168197, -0.702653, 0.3921569, 1, 0, 1,
-0.6133313, -0.5813975, -2.311351, 0.3843137, 1, 0, 1,
-0.6098107, -0.3329203, -2.141895, 0.3803922, 1, 0, 1,
-0.6068045, 1.417412, -2.222605, 0.372549, 1, 0, 1,
-0.5993777, 0.3148331, -0.6638449, 0.3686275, 1, 0, 1,
-0.5976405, 2.305223, -0.3917823, 0.3607843, 1, 0, 1,
-0.5895474, 0.714178, 2.457394, 0.3568628, 1, 0, 1,
-0.5867003, 0.387409, -0.5064051, 0.3490196, 1, 0, 1,
-0.5847689, -2.822122, -3.906286, 0.345098, 1, 0, 1,
-0.5747636, -1.755948, -2.653976, 0.3372549, 1, 0, 1,
-0.5741224, 1.386369, -3.039663, 0.3333333, 1, 0, 1,
-0.562401, 0.6100459, -0.3754536, 0.3254902, 1, 0, 1,
-0.5571672, 0.1131008, -1.089732, 0.3215686, 1, 0, 1,
-0.5534995, -0.1719249, -2.709773, 0.3137255, 1, 0, 1,
-0.5520748, 0.6591731, -1.411664, 0.3098039, 1, 0, 1,
-0.5516514, -0.1228211, -1.939752, 0.3019608, 1, 0, 1,
-0.5411463, -0.5972062, -1.445566, 0.2941177, 1, 0, 1,
-0.5405455, 2.154263, -2.404973, 0.2901961, 1, 0, 1,
-0.5359931, -2.007531, -3.271633, 0.282353, 1, 0, 1,
-0.5308025, 1.147866, -0.4667006, 0.2784314, 1, 0, 1,
-0.5301566, 0.9475103, 1.260478, 0.2705882, 1, 0, 1,
-0.5289963, 0.6040107, -1.62823, 0.2666667, 1, 0, 1,
-0.5215775, 3.129923, 0.3985487, 0.2588235, 1, 0, 1,
-0.5198281, -0.1049423, -1.459619, 0.254902, 1, 0, 1,
-0.519274, -0.2555605, -2.294192, 0.2470588, 1, 0, 1,
-0.5164256, 0.126267, -2.603679, 0.2431373, 1, 0, 1,
-0.5137487, -0.8423761, -2.104173, 0.2352941, 1, 0, 1,
-0.5110753, 0.8644382, -1.117866, 0.2313726, 1, 0, 1,
-0.5037013, -0.2817086, -2.237814, 0.2235294, 1, 0, 1,
-0.5029873, 1.32336, -0.7816958, 0.2196078, 1, 0, 1,
-0.4974746, 0.03460262, -1.9669, 0.2117647, 1, 0, 1,
-0.4955785, 0.4916892, 1.688978, 0.2078431, 1, 0, 1,
-0.4937467, -0.03271177, -2.197725, 0.2, 1, 0, 1,
-0.4917279, 0.6451907, -1.629012, 0.1921569, 1, 0, 1,
-0.4881916, -1.828843, -3.221958, 0.1882353, 1, 0, 1,
-0.4872442, -0.7126044, -2.755355, 0.1803922, 1, 0, 1,
-0.4850303, 0.06340824, 0.07050408, 0.1764706, 1, 0, 1,
-0.482967, 0.7448906, -1.809537, 0.1686275, 1, 0, 1,
-0.4804255, -0.5289613, -2.850404, 0.1647059, 1, 0, 1,
-0.4788812, -0.8460233, -2.610352, 0.1568628, 1, 0, 1,
-0.4765157, 0.05137556, 0.2899868, 0.1529412, 1, 0, 1,
-0.4745443, -0.3080371, -0.1898406, 0.145098, 1, 0, 1,
-0.4737891, 1.18329, 0.7335613, 0.1411765, 1, 0, 1,
-0.4731584, -2.156654, -2.812189, 0.1333333, 1, 0, 1,
-0.4700899, -0.9933796, -2.438615, 0.1294118, 1, 0, 1,
-0.4692543, 0.9701817, -1.770699, 0.1215686, 1, 0, 1,
-0.467036, -1.031061, -1.957902, 0.1176471, 1, 0, 1,
-0.4605365, 0.7193303, -0.5557079, 0.1098039, 1, 0, 1,
-0.4549516, 0.000991217, -0.638229, 0.1058824, 1, 0, 1,
-0.4515333, 1.008164, 0.480827, 0.09803922, 1, 0, 1,
-0.443597, -0.08363111, -2.580699, 0.09019608, 1, 0, 1,
-0.4379795, -0.6939303, -3.295466, 0.08627451, 1, 0, 1,
-0.4367427, -1.342517, -3.776702, 0.07843138, 1, 0, 1,
-0.4335174, -0.5847452, -1.923988, 0.07450981, 1, 0, 1,
-0.4305938, 0.8958189, -1.660348, 0.06666667, 1, 0, 1,
-0.428523, 2.828581, 0.1234595, 0.0627451, 1, 0, 1,
-0.4282431, 0.3748454, -0.6328037, 0.05490196, 1, 0, 1,
-0.4172322, 2.323557, -0.8878175, 0.05098039, 1, 0, 1,
-0.4166978, 0.6357919, -1.66055, 0.04313726, 1, 0, 1,
-0.4163308, -0.8760758, -1.845721, 0.03921569, 1, 0, 1,
-0.4149613, -0.8559445, -3.113648, 0.03137255, 1, 0, 1,
-0.4136537, -1.433225, -2.17854, 0.02745098, 1, 0, 1,
-0.4102902, 0.1808822, 0.8721374, 0.01960784, 1, 0, 1,
-0.4064265, 0.1156182, 1.581528, 0.01568628, 1, 0, 1,
-0.4063437, 2.299601, -0.5261343, 0.007843138, 1, 0, 1,
-0.4051573, 0.3653264, -1.145505, 0.003921569, 1, 0, 1,
-0.4049427, 1.625069, -1.307604, 0, 1, 0.003921569, 1,
-0.4038473, 1.87628, -0.2182769, 0, 1, 0.01176471, 1,
-0.3996918, 1.062874, 1.028077, 0, 1, 0.01568628, 1,
-0.3979382, 0.3252618, -0.7854514, 0, 1, 0.02352941, 1,
-0.3951681, -0.2473124, -3.383595, 0, 1, 0.02745098, 1,
-0.3950634, 1.399179, -0.3071985, 0, 1, 0.03529412, 1,
-0.3935999, -1.619375, -2.99021, 0, 1, 0.03921569, 1,
-0.389315, 1.155341, -0.432439, 0, 1, 0.04705882, 1,
-0.3869668, 0.3305361, -0.7548222, 0, 1, 0.05098039, 1,
-0.386347, 0.4450964, -1.530897, 0, 1, 0.05882353, 1,
-0.3834054, -2.501252, -3.708081, 0, 1, 0.0627451, 1,
-0.381131, 0.6911294, -0.1566717, 0, 1, 0.07058824, 1,
-0.3807893, -0.5599498, -2.68343, 0, 1, 0.07450981, 1,
-0.3798255, -0.5576175, -1.375435, 0, 1, 0.08235294, 1,
-0.3785317, -1.394878, -3.163023, 0, 1, 0.08627451, 1,
-0.3730474, 0.652418, -1.167222, 0, 1, 0.09411765, 1,
-0.3723063, -0.9024183, -2.521478, 0, 1, 0.1019608, 1,
-0.3716018, -0.1333091, -3.688645, 0, 1, 0.1058824, 1,
-0.3697432, -1.402321, -3.437589, 0, 1, 0.1137255, 1,
-0.3655285, 0.131192, -2.320759, 0, 1, 0.1176471, 1,
-0.365104, -0.3674692, -1.725266, 0, 1, 0.1254902, 1,
-0.3626528, 0.7010036, -0.4922255, 0, 1, 0.1294118, 1,
-0.3553415, -0.1373549, -0.9942334, 0, 1, 0.1372549, 1,
-0.3520272, 0.5404063, -0.1195115, 0, 1, 0.1411765, 1,
-0.3517255, -0.1653715, -2.822943, 0, 1, 0.1490196, 1,
-0.3501332, 1.673631, -0.1165948, 0, 1, 0.1529412, 1,
-0.3488657, -1.107103, -3.429909, 0, 1, 0.1607843, 1,
-0.3476143, -0.2875199, -2.666361, 0, 1, 0.1647059, 1,
-0.3469106, -1.476277, -4.892144, 0, 1, 0.172549, 1,
-0.3467292, -0.3335752, -3.677634, 0, 1, 0.1764706, 1,
-0.344304, 0.3098245, -3.056453, 0, 1, 0.1843137, 1,
-0.3430042, -0.1265707, -1.826026, 0, 1, 0.1882353, 1,
-0.3418181, -1.406272, -3.660955, 0, 1, 0.1960784, 1,
-0.3358686, 0.04272804, -1.834479, 0, 1, 0.2039216, 1,
-0.33551, 0.1706173, 0.1125371, 0, 1, 0.2078431, 1,
-0.3325977, 1.104153, -0.5164651, 0, 1, 0.2156863, 1,
-0.3323604, -2.333489, -3.354189, 0, 1, 0.2196078, 1,
-0.3297726, -1.500275, -2.025428, 0, 1, 0.227451, 1,
-0.3277278, -1.467556, -1.515273, 0, 1, 0.2313726, 1,
-0.3272448, 1.84697, 0.1797372, 0, 1, 0.2392157, 1,
-0.3245553, 0.7010919, -1.427258, 0, 1, 0.2431373, 1,
-0.322518, 1.41893, 0.6755173, 0, 1, 0.2509804, 1,
-0.321954, 0.5398628, 0.6877635, 0, 1, 0.254902, 1,
-0.3172956, 1.44144, 0.810453, 0, 1, 0.2627451, 1,
-0.3069916, -0.06430428, -2.624094, 0, 1, 0.2666667, 1,
-0.3023522, -1.724688, -4.373437, 0, 1, 0.2745098, 1,
-0.3020206, -0.2942962, -1.907542, 0, 1, 0.2784314, 1,
-0.2976552, -0.904411, -1.067041, 0, 1, 0.2862745, 1,
-0.296882, 0.9959337, -1.05997, 0, 1, 0.2901961, 1,
-0.296849, -1.316155, -3.057786, 0, 1, 0.2980392, 1,
-0.2957433, -1.407988, -3.326499, 0, 1, 0.3058824, 1,
-0.2936356, -1.548845, -4.666247, 0, 1, 0.3098039, 1,
-0.2917502, 0.9518815, 0.212814, 0, 1, 0.3176471, 1,
-0.290686, -0.1115004, -0.9021479, 0, 1, 0.3215686, 1,
-0.28471, 1.191184, -0.5545132, 0, 1, 0.3294118, 1,
-0.2830187, 2.103945, -1.201441, 0, 1, 0.3333333, 1,
-0.280438, 1.038156, -0.03278934, 0, 1, 0.3411765, 1,
-0.2797332, 0.3075246, -1.424019, 0, 1, 0.345098, 1,
-0.278201, 0.1318966, -1.928349, 0, 1, 0.3529412, 1,
-0.277697, 0.6562544, -0.01194075, 0, 1, 0.3568628, 1,
-0.2774999, -1.166345, -4.022861, 0, 1, 0.3647059, 1,
-0.2742617, 0.3813159, 1.597911, 0, 1, 0.3686275, 1,
-0.269503, -0.4006837, -2.902826, 0, 1, 0.3764706, 1,
-0.2670682, -0.5563247, -1.81644, 0, 1, 0.3803922, 1,
-0.2628151, -1.85683, -2.365084, 0, 1, 0.3882353, 1,
-0.2610798, 1.020098, 0.7222131, 0, 1, 0.3921569, 1,
-0.2584412, -1.255015, -3.868724, 0, 1, 0.4, 1,
-0.2579599, -0.6238791, -1.681494, 0, 1, 0.4078431, 1,
-0.2567508, -0.8293086, -3.94431, 0, 1, 0.4117647, 1,
-0.254932, 0.2600161, -2.960353, 0, 1, 0.4196078, 1,
-0.2468588, -0.4059387, -4.419323, 0, 1, 0.4235294, 1,
-0.2455898, -1.575433, -4.521076, 0, 1, 0.4313726, 1,
-0.2454726, 0.76237, 1.65994, 0, 1, 0.4352941, 1,
-0.2422164, -0.05557425, -1.578732, 0, 1, 0.4431373, 1,
-0.2377135, -0.4764208, -2.31532, 0, 1, 0.4470588, 1,
-0.2371883, -0.5696281, -0.6725242, 0, 1, 0.454902, 1,
-0.2366771, 0.27587, -1.718198, 0, 1, 0.4588235, 1,
-0.2359735, 1.417299, 0.96968, 0, 1, 0.4666667, 1,
-0.2338716, -1.146581, -2.041622, 0, 1, 0.4705882, 1,
-0.233302, -1.08287, -2.180347, 0, 1, 0.4784314, 1,
-0.2321186, 0.4878517, -1.704475, 0, 1, 0.4823529, 1,
-0.2314151, 0.2781051, -0.6945565, 0, 1, 0.4901961, 1,
-0.2289056, 0.9639298, 0.975334, 0, 1, 0.4941176, 1,
-0.2252539, 1.640473, -0.8035442, 0, 1, 0.5019608, 1,
-0.2239039, 0.1248471, -0.9308236, 0, 1, 0.509804, 1,
-0.2135072, -0.4875697, -4.168552, 0, 1, 0.5137255, 1,
-0.2107479, 0.09386675, -2.477876, 0, 1, 0.5215687, 1,
-0.2084072, -1.206874, -1.375126, 0, 1, 0.5254902, 1,
-0.2081444, 0.557587, 0.2804036, 0, 1, 0.5333334, 1,
-0.2063367, 0.6920422, 1.853483, 0, 1, 0.5372549, 1,
-0.2045913, -1.008401, -2.619774, 0, 1, 0.5450981, 1,
-0.2042802, -1.168176, -3.45753, 0, 1, 0.5490196, 1,
-0.2039555, 0.4935516, -1.528503, 0, 1, 0.5568628, 1,
-0.2033615, 0.2908602, -1.359155, 0, 1, 0.5607843, 1,
-0.1928671, 0.30579, 1.045669, 0, 1, 0.5686275, 1,
-0.1925063, 1.382744, -1.022838, 0, 1, 0.572549, 1,
-0.1921736, 1.458069, 0.4958401, 0, 1, 0.5803922, 1,
-0.189004, 1.156688, -1.367702, 0, 1, 0.5843138, 1,
-0.1855667, 1.352902, -0.1531879, 0, 1, 0.5921569, 1,
-0.1794038, -0.09271317, -2.436598, 0, 1, 0.5960785, 1,
-0.1785896, -1.015573, -1.925588, 0, 1, 0.6039216, 1,
-0.1696868, 0.05369702, -1.392098, 0, 1, 0.6117647, 1,
-0.1682368, 1.494993, -0.6998168, 0, 1, 0.6156863, 1,
-0.1556413, -2.379555, -2.552903, 0, 1, 0.6235294, 1,
-0.1545049, 0.8864413, -1.783567, 0, 1, 0.627451, 1,
-0.1537102, -0.96329, -3.451788, 0, 1, 0.6352941, 1,
-0.1526139, 0.1803893, -1.373358, 0, 1, 0.6392157, 1,
-0.1489469, 1.12749, 1.705735, 0, 1, 0.6470588, 1,
-0.1485355, -0.09826499, -0.6278824, 0, 1, 0.6509804, 1,
-0.1415255, 0.4365267, -1.110321, 0, 1, 0.6588235, 1,
-0.1381904, 0.1151301, 0.2145875, 0, 1, 0.6627451, 1,
-0.1331845, 0.2112249, 0.1710161, 0, 1, 0.6705883, 1,
-0.1324242, -0.1660782, -4.394748, 0, 1, 0.6745098, 1,
-0.1262884, 0.8247964, -0.8096933, 0, 1, 0.682353, 1,
-0.1250896, -2.33694, -2.414922, 0, 1, 0.6862745, 1,
-0.1162587, -0.06198483, -1.053967, 0, 1, 0.6941177, 1,
-0.114046, -0.3269306, -2.616199, 0, 1, 0.7019608, 1,
-0.1112978, -1.212105, -3.620895, 0, 1, 0.7058824, 1,
-0.1109202, 1.497884, -0.722976, 0, 1, 0.7137255, 1,
-0.1088565, -2.896551, -4.203559, 0, 1, 0.7176471, 1,
-0.1050971, -0.001560421, -1.568032, 0, 1, 0.7254902, 1,
-0.09985576, 0.1300299, -1.450629, 0, 1, 0.7294118, 1,
-0.09961742, -1.146317, -2.371693, 0, 1, 0.7372549, 1,
-0.0990833, 2.010825, -1.992922, 0, 1, 0.7411765, 1,
-0.0988321, -0.3022358, -2.738465, 0, 1, 0.7490196, 1,
-0.09804358, -0.5645322, -4.51589, 0, 1, 0.7529412, 1,
-0.09051677, 1.082043, -0.02318445, 0, 1, 0.7607843, 1,
-0.08757706, -0.1099897, -1.065444, 0, 1, 0.7647059, 1,
-0.08740606, -0.1990214, -3.382566, 0, 1, 0.772549, 1,
-0.08037046, 0.6159674, -0.6474298, 0, 1, 0.7764706, 1,
-0.07952581, -0.146269, -2.352801, 0, 1, 0.7843137, 1,
-0.07343172, -0.1926937, -3.071941, 0, 1, 0.7882353, 1,
-0.07082807, -0.5694495, -3.279294, 0, 1, 0.7960784, 1,
-0.07075095, -0.437585, -4.19968, 0, 1, 0.8039216, 1,
-0.06521486, -0.9736492, -2.43712, 0, 1, 0.8078431, 1,
-0.06421629, 1.344943, 0.1566862, 0, 1, 0.8156863, 1,
-0.06374387, 0.02151502, -0.4830969, 0, 1, 0.8196079, 1,
-0.05650317, -0.2705452, -2.223923, 0, 1, 0.827451, 1,
-0.05477188, 0.8158286, -0.4948201, 0, 1, 0.8313726, 1,
-0.05423937, 0.1298182, -1.005188, 0, 1, 0.8392157, 1,
-0.05266106, -0.07172772, -2.980032, 0, 1, 0.8431373, 1,
-0.05224277, -1.311187, -3.761101, 0, 1, 0.8509804, 1,
-0.04803639, -0.04607444, -2.060638, 0, 1, 0.854902, 1,
-0.04677214, 0.09725531, 0.08168826, 0, 1, 0.8627451, 1,
-0.04542509, 0.3238984, 0.2168387, 0, 1, 0.8666667, 1,
-0.04530458, -1.179422, -4.3647, 0, 1, 0.8745098, 1,
-0.04403457, 0.9052427, 0.5449458, 0, 1, 0.8784314, 1,
-0.04401072, -0.2553726, -1.550537, 0, 1, 0.8862745, 1,
-0.04094228, -1.278121, -2.062996, 0, 1, 0.8901961, 1,
-0.03928395, -0.8455667, -1.876191, 0, 1, 0.8980392, 1,
-0.03514872, -1.782271, -4.245107, 0, 1, 0.9058824, 1,
-0.0332568, -0.5825357, -1.079983, 0, 1, 0.9098039, 1,
-0.02606465, 1.808857, 0.4327904, 0, 1, 0.9176471, 1,
-0.02104917, -0.573502, -2.831396, 0, 1, 0.9215686, 1,
-0.01811839, 0.5255673, -0.1214451, 0, 1, 0.9294118, 1,
-0.01666892, 0.03965199, -0.5396618, 0, 1, 0.9333333, 1,
-0.01356346, -0.7569747, -2.374068, 0, 1, 0.9411765, 1,
-0.01182554, -1.701284, -3.098213, 0, 1, 0.945098, 1,
-0.01025805, 0.7423171, -0.4799726, 0, 1, 0.9529412, 1,
-0.01018468, 0.7675742, 1.535456, 0, 1, 0.9568627, 1,
0.00225211, 0.7284254, 0.2887569, 0, 1, 0.9647059, 1,
0.007411219, 0.4101748, 0.7794781, 0, 1, 0.9686275, 1,
0.008024508, -1.935926, 3.642045, 0, 1, 0.9764706, 1,
0.008792466, 0.3998616, 0.3973293, 0, 1, 0.9803922, 1,
0.009710582, -0.8467659, 3.795326, 0, 1, 0.9882353, 1,
0.01170986, -0.9841585, 1.822033, 0, 1, 0.9921569, 1,
0.01507369, 0.3024173, -1.612139, 0, 1, 1, 1,
0.01571267, -0.4775068, 3.598558, 0, 0.9921569, 1, 1,
0.01712112, 0.08639304, -0.9114881, 0, 0.9882353, 1, 1,
0.01906, -0.5353743, 3.029593, 0, 0.9803922, 1, 1,
0.02739082, -1.474975, 3.761348, 0, 0.9764706, 1, 1,
0.03454322, 0.2553651, -0.4895388, 0, 0.9686275, 1, 1,
0.03694945, -0.237533, 2.991824, 0, 0.9647059, 1, 1,
0.03941157, -0.2698257, 2.25388, 0, 0.9568627, 1, 1,
0.05257292, 0.1138849, -0.4217452, 0, 0.9529412, 1, 1,
0.05434558, 0.5304667, 1.155395, 0, 0.945098, 1, 1,
0.05523319, -0.08788002, 2.415725, 0, 0.9411765, 1, 1,
0.05587745, -1.185024, 2.975564, 0, 0.9333333, 1, 1,
0.05595053, 0.5519025, -0.4959258, 0, 0.9294118, 1, 1,
0.0586972, 1.49445, -0.4535939, 0, 0.9215686, 1, 1,
0.05873633, 1.180924, 0.04647493, 0, 0.9176471, 1, 1,
0.05951344, -0.3096576, 1.834821, 0, 0.9098039, 1, 1,
0.06112791, 1.904409, 0.9663278, 0, 0.9058824, 1, 1,
0.0655743, 0.6631244, -1.355861, 0, 0.8980392, 1, 1,
0.07211011, -2.017195, 3.067775, 0, 0.8901961, 1, 1,
0.07403823, 0.339166, 0.6043488, 0, 0.8862745, 1, 1,
0.07621935, -0.6772504, 2.605018, 0, 0.8784314, 1, 1,
0.08013534, 1.405479, -0.1218168, 0, 0.8745098, 1, 1,
0.08426304, -1.140723, 2.884299, 0, 0.8666667, 1, 1,
0.0852503, -0.1478543, 4.28037, 0, 0.8627451, 1, 1,
0.08566929, -0.8485054, 5.066259, 0, 0.854902, 1, 1,
0.08593449, -0.298361, 3.662376, 0, 0.8509804, 1, 1,
0.09059675, 0.05732728, 0.4699825, 0, 0.8431373, 1, 1,
0.09084219, -0.5710338, 1.766035, 0, 0.8392157, 1, 1,
0.09091993, 0.5348202, 0.9972814, 0, 0.8313726, 1, 1,
0.09218056, -0.6437997, 2.199741, 0, 0.827451, 1, 1,
0.0922089, -2.378207, 2.506531, 0, 0.8196079, 1, 1,
0.09670002, 0.6469094, 0.1985926, 0, 0.8156863, 1, 1,
0.09841477, 0.7141545, 0.07291035, 0, 0.8078431, 1, 1,
0.0987583, -1.005273, 2.570319, 0, 0.8039216, 1, 1,
0.1019991, -2.422529, 3.265182, 0, 0.7960784, 1, 1,
0.1089145, 0.8026223, 1.432107, 0, 0.7882353, 1, 1,
0.1173964, -0.7170033, 3.434929, 0, 0.7843137, 1, 1,
0.1179028, 1.25602, -0.8182469, 0, 0.7764706, 1, 1,
0.120729, 0.3481341, -0.2215687, 0, 0.772549, 1, 1,
0.1228767, 0.9325031, 1.053034, 0, 0.7647059, 1, 1,
0.1274536, 0.7091854, 0.6856774, 0, 0.7607843, 1, 1,
0.1277146, 0.4428131, -1.829024, 0, 0.7529412, 1, 1,
0.1277269, 0.04136979, 2.284288, 0, 0.7490196, 1, 1,
0.1278112, -2.28397, 1.857514, 0, 0.7411765, 1, 1,
0.1299133, 0.7330394, -0.7600257, 0, 0.7372549, 1, 1,
0.1320057, -0.9349566, 2.628178, 0, 0.7294118, 1, 1,
0.1400791, -0.7452406, 3.205251, 0, 0.7254902, 1, 1,
0.142277, 1.408346, 1.381178, 0, 0.7176471, 1, 1,
0.1437472, -0.7107762, 1.251559, 0, 0.7137255, 1, 1,
0.14682, -0.7060512, 3.580905, 0, 0.7058824, 1, 1,
0.1478963, -0.4498487, 3.911608, 0, 0.6980392, 1, 1,
0.1511558, -1.13404, 4.339515, 0, 0.6941177, 1, 1,
0.1518667, 0.9972178, 0.6393859, 0, 0.6862745, 1, 1,
0.1521274, 1.18527, -0.7615872, 0, 0.682353, 1, 1,
0.1549125, -0.4336532, 1.94109, 0, 0.6745098, 1, 1,
0.1561469, 1.064268, 2.33811, 0, 0.6705883, 1, 1,
0.1624142, -0.03183677, 3.151915, 0, 0.6627451, 1, 1,
0.1634538, 0.05958163, 3.119999, 0, 0.6588235, 1, 1,
0.1635479, 0.5915831, 0.3423826, 0, 0.6509804, 1, 1,
0.1648112, 2.222353, 0.7680299, 0, 0.6470588, 1, 1,
0.1699117, -1.194521, 1.972212, 0, 0.6392157, 1, 1,
0.1711673, -0.1496428, 2.058909, 0, 0.6352941, 1, 1,
0.1750522, 0.05404925, 2.339269, 0, 0.627451, 1, 1,
0.1752821, 0.6955925, 0.002844375, 0, 0.6235294, 1, 1,
0.1754358, -0.03037601, 1.807475, 0, 0.6156863, 1, 1,
0.1782894, -2.325499, 4.454372, 0, 0.6117647, 1, 1,
0.1796405, 0.06803114, -0.0707382, 0, 0.6039216, 1, 1,
0.1847003, 0.09275852, 2.600593, 0, 0.5960785, 1, 1,
0.1862291, -0.5246477, 5.428997, 0, 0.5921569, 1, 1,
0.1899186, 0.8182667, 1.959015, 0, 0.5843138, 1, 1,
0.1942885, -0.5814208, 2.155607, 0, 0.5803922, 1, 1,
0.1943925, -1.672138, 2.062231, 0, 0.572549, 1, 1,
0.1995071, -1.667869, 3.290319, 0, 0.5686275, 1, 1,
0.202268, 0.04505659, 1.506574, 0, 0.5607843, 1, 1,
0.2025703, 0.02906293, 1.985382, 0, 0.5568628, 1, 1,
0.2092186, 1.081474, 1.594849, 0, 0.5490196, 1, 1,
0.2127126, -1.546043, 2.071344, 0, 0.5450981, 1, 1,
0.2130142, -0.889237, 2.447901, 0, 0.5372549, 1, 1,
0.2186457, -1.827679, 3.555251, 0, 0.5333334, 1, 1,
0.2194015, -0.6416417, 3.307513, 0, 0.5254902, 1, 1,
0.2200973, 0.755972, 0.04628972, 0, 0.5215687, 1, 1,
0.2246475, -1.45479, 5.036215, 0, 0.5137255, 1, 1,
0.2275051, 1.188688, 2.553504, 0, 0.509804, 1, 1,
0.2275762, 1.621899, 0.4988416, 0, 0.5019608, 1, 1,
0.229688, -1.247818, 5.306513, 0, 0.4941176, 1, 1,
0.2310236, -0.0680759, 3.506542, 0, 0.4901961, 1, 1,
0.232354, -0.8191051, 4.233344, 0, 0.4823529, 1, 1,
0.2437328, 0.2612624, -0.2429927, 0, 0.4784314, 1, 1,
0.2438167, -1.726297, 3.498518, 0, 0.4705882, 1, 1,
0.2441978, -0.4205318, 1.836844, 0, 0.4666667, 1, 1,
0.2453401, -1.180035, 3.038604, 0, 0.4588235, 1, 1,
0.2473334, -0.750456, 1.889439, 0, 0.454902, 1, 1,
0.2524051, 0.05513525, 1.819046, 0, 0.4470588, 1, 1,
0.2573397, 1.917439, -1.455358, 0, 0.4431373, 1, 1,
0.2596676, -1.118252, 3.392344, 0, 0.4352941, 1, 1,
0.26003, -3.839979, 2.340502, 0, 0.4313726, 1, 1,
0.2620255, -0.08528671, 1.533053, 0, 0.4235294, 1, 1,
0.2683174, 0.2466955, 2.279024, 0, 0.4196078, 1, 1,
0.2699644, 0.3916077, 0.9886935, 0, 0.4117647, 1, 1,
0.273743, 0.3171744, 2.227483, 0, 0.4078431, 1, 1,
0.2785116, -1.674345, 2.683953, 0, 0.4, 1, 1,
0.2862533, 0.4947331, -0.1326713, 0, 0.3921569, 1, 1,
0.2930577, -0.7160767, 2.420093, 0, 0.3882353, 1, 1,
0.2941159, 0.4797564, -1.303904, 0, 0.3803922, 1, 1,
0.2990665, 0.4991513, -0.1479027, 0, 0.3764706, 1, 1,
0.3008541, 1.235612, 0.3973415, 0, 0.3686275, 1, 1,
0.3055868, 1.940776, 0.9881876, 0, 0.3647059, 1, 1,
0.3076911, 1.056373, 0.1304015, 0, 0.3568628, 1, 1,
0.3090399, 0.1359064, 0.5611271, 0, 0.3529412, 1, 1,
0.3099234, 0.1618478, 1.252098, 0, 0.345098, 1, 1,
0.3142478, 0.8432279, 0.2679449, 0, 0.3411765, 1, 1,
0.3195778, -1.304513, 2.945301, 0, 0.3333333, 1, 1,
0.3240512, -0.2937521, 2.67621, 0, 0.3294118, 1, 1,
0.3249069, -0.8804521, 2.38796, 0, 0.3215686, 1, 1,
0.3270006, 0.7178465, -1.126903, 0, 0.3176471, 1, 1,
0.3273761, -0.09473316, -0.2340809, 0, 0.3098039, 1, 1,
0.330087, 0.6856751, -0.1958328, 0, 0.3058824, 1, 1,
0.3341977, 0.8895427, 2.345739, 0, 0.2980392, 1, 1,
0.3344254, -1.288297, 4.009704, 0, 0.2901961, 1, 1,
0.3403795, 0.1878105, 1.73202, 0, 0.2862745, 1, 1,
0.3411389, 2.512266, 1.757983, 0, 0.2784314, 1, 1,
0.3431945, 0.8979965, -0.3748108, 0, 0.2745098, 1, 1,
0.3452998, -0.1544902, 1.477664, 0, 0.2666667, 1, 1,
0.3490565, 0.6280956, -2.813443, 0, 0.2627451, 1, 1,
0.3532416, -0.1153244, 1.006067, 0, 0.254902, 1, 1,
0.3548238, -0.7340997, 4.516569, 0, 0.2509804, 1, 1,
0.3558015, -0.04995942, 0.6486275, 0, 0.2431373, 1, 1,
0.3562247, -0.6767495, 2.773554, 0, 0.2392157, 1, 1,
0.3571762, -0.7937224, 0.4684524, 0, 0.2313726, 1, 1,
0.357712, -0.1147451, 1.849835, 0, 0.227451, 1, 1,
0.3606077, -1.08575, 4.190352, 0, 0.2196078, 1, 1,
0.3640238, -0.8342745, 1.139169, 0, 0.2156863, 1, 1,
0.3652016, -0.3572334, 1.654586, 0, 0.2078431, 1, 1,
0.3657861, -1.171088, 2.933622, 0, 0.2039216, 1, 1,
0.3665964, 1.124597, -1.015635, 0, 0.1960784, 1, 1,
0.3682959, 0.1909032, 0.0441464, 0, 0.1882353, 1, 1,
0.3708782, 0.3404011, 0.9440387, 0, 0.1843137, 1, 1,
0.3708843, 0.37147, -0.1825239, 0, 0.1764706, 1, 1,
0.372998, 0.4758095, 0.3970223, 0, 0.172549, 1, 1,
0.3731835, -0.3748855, 1.66089, 0, 0.1647059, 1, 1,
0.3746578, -0.09433533, 2.600368, 0, 0.1607843, 1, 1,
0.3795545, -0.1570501, 3.006073, 0, 0.1529412, 1, 1,
0.3817871, 0.132624, 1.528629, 0, 0.1490196, 1, 1,
0.3877864, -0.5008836, 1.57159, 0, 0.1411765, 1, 1,
0.3926022, 0.9850116, -0.3813223, 0, 0.1372549, 1, 1,
0.392985, -1.853734, 1.285247, 0, 0.1294118, 1, 1,
0.3959067, 0.567383, -0.9027097, 0, 0.1254902, 1, 1,
0.4045494, -0.07463746, 2.95515, 0, 0.1176471, 1, 1,
0.4054987, -0.365151, 3.989501, 0, 0.1137255, 1, 1,
0.4086909, 0.9266694, 1.820439, 0, 0.1058824, 1, 1,
0.42238, -0.7928271, 2.226584, 0, 0.09803922, 1, 1,
0.4226452, -1.373674, 2.555613, 0, 0.09411765, 1, 1,
0.4266054, -1.253437, 3.371119, 0, 0.08627451, 1, 1,
0.4272924, 0.9874338, 0.8848944, 0, 0.08235294, 1, 1,
0.4273146, -0.06590727, 0.5386122, 0, 0.07450981, 1, 1,
0.4278732, 1.160105, 0.8931038, 0, 0.07058824, 1, 1,
0.4294707, 2.169644, -0.3202664, 0, 0.0627451, 1, 1,
0.4305355, 0.3376351, 0.5581365, 0, 0.05882353, 1, 1,
0.4318864, 0.8334038, 0.5265193, 0, 0.05098039, 1, 1,
0.4329569, 1.635585, 0.1433512, 0, 0.04705882, 1, 1,
0.4331151, 0.6481, 1.050837, 0, 0.03921569, 1, 1,
0.4358049, 1.129412, 0.6265327, 0, 0.03529412, 1, 1,
0.4413571, -1.192111, 2.513696, 0, 0.02745098, 1, 1,
0.4413969, -0.2891944, 1.784891, 0, 0.02352941, 1, 1,
0.4471571, 0.05533418, 0.2816415, 0, 0.01568628, 1, 1,
0.4576451, -0.1639746, 0.9982355, 0, 0.01176471, 1, 1,
0.4640007, 1.625311, -0.8238383, 0, 0.003921569, 1, 1,
0.4646945, 0.3039206, 0.5896578, 0.003921569, 0, 1, 1,
0.4691491, 0.5116898, 0.3742276, 0.007843138, 0, 1, 1,
0.469786, 0.3721614, 1.166553, 0.01568628, 0, 1, 1,
0.4710076, -0.8615167, 4.544393, 0.01960784, 0, 1, 1,
0.4713243, -0.2637546, 1.312182, 0.02745098, 0, 1, 1,
0.4807188, -2.359704, 3.147171, 0.03137255, 0, 1, 1,
0.4817193, -1.621597, 2.331611, 0.03921569, 0, 1, 1,
0.4838253, -0.3013694, 2.521897, 0.04313726, 0, 1, 1,
0.4863491, -0.4524274, 0.572048, 0.05098039, 0, 1, 1,
0.4887939, 0.7196303, -0.1714114, 0.05490196, 0, 1, 1,
0.4898473, -1.301971, 3.280637, 0.0627451, 0, 1, 1,
0.4939444, -0.4559525, 3.021393, 0.06666667, 0, 1, 1,
0.4996027, 1.245619, 2.034208, 0.07450981, 0, 1, 1,
0.503387, 1.948222, -0.224468, 0.07843138, 0, 1, 1,
0.5039667, -0.2622752, 1.890776, 0.08627451, 0, 1, 1,
0.5109221, -0.0218908, 1.207953, 0.09019608, 0, 1, 1,
0.5160781, -0.1165549, 3.035522, 0.09803922, 0, 1, 1,
0.5164509, -0.3620631, 2.228804, 0.1058824, 0, 1, 1,
0.5185837, -1.465121, 3.962328, 0.1098039, 0, 1, 1,
0.5235036, 1.497932, -0.2003874, 0.1176471, 0, 1, 1,
0.5261325, -0.7803605, 3.588803, 0.1215686, 0, 1, 1,
0.5349633, -0.7634858, 1.808261, 0.1294118, 0, 1, 1,
0.5366204, 0.523517, 1.739726, 0.1333333, 0, 1, 1,
0.5370914, 1.047553, 0.103975, 0.1411765, 0, 1, 1,
0.5399662, -1.072229, 3.803003, 0.145098, 0, 1, 1,
0.5408491, 0.07386046, 0.2254161, 0.1529412, 0, 1, 1,
0.5409002, 0.477853, -1.351182, 0.1568628, 0, 1, 1,
0.5439955, 1.955269, 1.425833, 0.1647059, 0, 1, 1,
0.5455796, 1.762584, 1.962227, 0.1686275, 0, 1, 1,
0.5463313, 0.3037854, 1.703246, 0.1764706, 0, 1, 1,
0.5475875, 0.7046143, 0.9361379, 0.1803922, 0, 1, 1,
0.5515891, 0.5324466, 2.116257, 0.1882353, 0, 1, 1,
0.5521547, 0.4199254, 1.421055, 0.1921569, 0, 1, 1,
0.552716, 1.305037, -0.6937765, 0.2, 0, 1, 1,
0.5567777, -0.1985423, 2.938374, 0.2078431, 0, 1, 1,
0.5584438, -0.6917998, 3.294137, 0.2117647, 0, 1, 1,
0.5589507, 0.2942153, 0.06356547, 0.2196078, 0, 1, 1,
0.5598496, 0.4913978, 2.591327, 0.2235294, 0, 1, 1,
0.5644494, 0.7319894, 1.069221, 0.2313726, 0, 1, 1,
0.5648445, 0.2788131, 2.563348, 0.2352941, 0, 1, 1,
0.5651109, 1.911602, 0.1938479, 0.2431373, 0, 1, 1,
0.5657371, -0.8762179, 3.403353, 0.2470588, 0, 1, 1,
0.5680711, -0.9671121, 2.234776, 0.254902, 0, 1, 1,
0.5690703, -0.2142766, 0.5187194, 0.2588235, 0, 1, 1,
0.5722335, -0.05631489, 1.364751, 0.2666667, 0, 1, 1,
0.5732639, -1.092106, 2.978492, 0.2705882, 0, 1, 1,
0.5794332, -0.3520547, 1.231585, 0.2784314, 0, 1, 1,
0.5828941, 0.5191386, 1.579533, 0.282353, 0, 1, 1,
0.5896476, -0.4061073, 2.208333, 0.2901961, 0, 1, 1,
0.5919217, -0.2817182, 0.454265, 0.2941177, 0, 1, 1,
0.6068893, 0.4249927, 2.059188, 0.3019608, 0, 1, 1,
0.6083341, -2.879853, 4.145891, 0.3098039, 0, 1, 1,
0.6118413, -1.892814, 2.349974, 0.3137255, 0, 1, 1,
0.6134722, 0.4757548, 2.252586, 0.3215686, 0, 1, 1,
0.6144145, -0.2443848, 1.063187, 0.3254902, 0, 1, 1,
0.6193995, 0.1208778, 0.2865222, 0.3333333, 0, 1, 1,
0.6223105, 0.6221462, 1.56382, 0.3372549, 0, 1, 1,
0.6225618, -0.9292253, 3.732739, 0.345098, 0, 1, 1,
0.6229766, 0.7531514, 2.429602, 0.3490196, 0, 1, 1,
0.6253557, -0.755221, 0.2294103, 0.3568628, 0, 1, 1,
0.6335753, -0.2129689, 0.984331, 0.3607843, 0, 1, 1,
0.633756, 0.8520932, 1.098276, 0.3686275, 0, 1, 1,
0.6364286, -0.5449775, 1.907247, 0.372549, 0, 1, 1,
0.6376576, -0.2106416, 1.566089, 0.3803922, 0, 1, 1,
0.6394925, 0.1774752, 1.55685, 0.3843137, 0, 1, 1,
0.6403327, 0.3991106, 2.711397, 0.3921569, 0, 1, 1,
0.6423831, 0.3837503, 1.401674, 0.3960784, 0, 1, 1,
0.6443188, -0.06829824, 2.643528, 0.4039216, 0, 1, 1,
0.6457674, -0.1844596, 0.9878752, 0.4117647, 0, 1, 1,
0.6471913, 1.004355, 0.08595318, 0.4156863, 0, 1, 1,
0.6479864, 0.6504474, 1.485023, 0.4235294, 0, 1, 1,
0.6493979, -0.2680803, 2.472428, 0.427451, 0, 1, 1,
0.6529073, -0.2708004, 2.180074, 0.4352941, 0, 1, 1,
0.653437, -2.488507, 3.315882, 0.4392157, 0, 1, 1,
0.6573311, 1.134301, 0.318937, 0.4470588, 0, 1, 1,
0.6663742, -0.3252175, 2.076842, 0.4509804, 0, 1, 1,
0.6724586, -0.9994905, 1.278611, 0.4588235, 0, 1, 1,
0.673233, 1.479255, -0.5713073, 0.4627451, 0, 1, 1,
0.6753327, -0.4381945, 2.779473, 0.4705882, 0, 1, 1,
0.6773153, -0.4608236, 2.377517, 0.4745098, 0, 1, 1,
0.6824259, 0.7829406, -0.464323, 0.4823529, 0, 1, 1,
0.6856124, -0.4519562, 3.462815, 0.4862745, 0, 1, 1,
0.6923828, 1.319588, 0.5730844, 0.4941176, 0, 1, 1,
0.6957939, 0.3002141, 2.709841, 0.5019608, 0, 1, 1,
0.6969978, 1.034918, -0.4155622, 0.5058824, 0, 1, 1,
0.6978292, -0.7109507, 2.265446, 0.5137255, 0, 1, 1,
0.7049072, 1.328123, 0.6538984, 0.5176471, 0, 1, 1,
0.710623, -0.3096606, 3.14347, 0.5254902, 0, 1, 1,
0.7134297, -0.9242034, 1.981964, 0.5294118, 0, 1, 1,
0.7136043, -0.2677025, 1.538108, 0.5372549, 0, 1, 1,
0.7144194, 1.306914, 0.1143121, 0.5411765, 0, 1, 1,
0.7178876, -0.5055512, 1.43435, 0.5490196, 0, 1, 1,
0.720406, 0.2831455, 1.1962, 0.5529412, 0, 1, 1,
0.7276871, -0.3844785, 1.002592, 0.5607843, 0, 1, 1,
0.7288861, -0.9897743, 3.667375, 0.5647059, 0, 1, 1,
0.7289045, -0.8842862, 1.705, 0.572549, 0, 1, 1,
0.729582, -0.2340174, 1.965072, 0.5764706, 0, 1, 1,
0.7308164, 0.491912, -0.6389889, 0.5843138, 0, 1, 1,
0.7388608, 0.8103791, 1.237804, 0.5882353, 0, 1, 1,
0.73993, -0.1632231, 1.0734, 0.5960785, 0, 1, 1,
0.7462201, 0.4055432, 1.005896, 0.6039216, 0, 1, 1,
0.7486073, 2.509799, -0.3094319, 0.6078432, 0, 1, 1,
0.751315, -0.476741, 2.63277, 0.6156863, 0, 1, 1,
0.7520441, 1.666013, 1.606874, 0.6196079, 0, 1, 1,
0.7545479, -0.8960076, 1.053137, 0.627451, 0, 1, 1,
0.7629787, -1.300247, 2.820119, 0.6313726, 0, 1, 1,
0.7640338, -0.09428895, 3.508769, 0.6392157, 0, 1, 1,
0.7696072, -0.5055439, 1.698288, 0.6431373, 0, 1, 1,
0.7716188, -2.011209, 2.832849, 0.6509804, 0, 1, 1,
0.7744424, -1.028573, 3.122057, 0.654902, 0, 1, 1,
0.7785498, 0.8061931, 1.09232, 0.6627451, 0, 1, 1,
0.7852097, -1.387036, 4.493285, 0.6666667, 0, 1, 1,
0.7883172, 0.08601516, 3.176151, 0.6745098, 0, 1, 1,
0.7954398, -0.7388002, 3.405668, 0.6784314, 0, 1, 1,
0.7964999, -1.832345, 0.8365517, 0.6862745, 0, 1, 1,
0.8016543, -0.3953137, 2.6997, 0.6901961, 0, 1, 1,
0.8021927, -1.058624, 3.079159, 0.6980392, 0, 1, 1,
0.8071207, -1.413372, 2.476536, 0.7058824, 0, 1, 1,
0.8081516, -0.7112495, 2.478575, 0.7098039, 0, 1, 1,
0.8147424, 0.9577801, 1.25218, 0.7176471, 0, 1, 1,
0.8172076, -1.531732, 1.573479, 0.7215686, 0, 1, 1,
0.8185174, 1.035645, -0.09825702, 0.7294118, 0, 1, 1,
0.8230235, -0.1956717, 2.678387, 0.7333333, 0, 1, 1,
0.8312198, 1.969561, 0.2712349, 0.7411765, 0, 1, 1,
0.8325807, 0.03047383, -0.2009434, 0.7450981, 0, 1, 1,
0.8354609, 1.037172, 0.2315159, 0.7529412, 0, 1, 1,
0.8435675, -1.027797, 2.144306, 0.7568628, 0, 1, 1,
0.8448321, -0.7171386, 2.149625, 0.7647059, 0, 1, 1,
0.8500559, -2.750379, 2.898486, 0.7686275, 0, 1, 1,
0.8520901, 1.383161, -1.687073, 0.7764706, 0, 1, 1,
0.8537405, -0.2438703, 1.949777, 0.7803922, 0, 1, 1,
0.854166, 0.5831175, -0.2871033, 0.7882353, 0, 1, 1,
0.8547572, -0.3161907, 1.257177, 0.7921569, 0, 1, 1,
0.8554027, -0.2327684, 2.041043, 0.8, 0, 1, 1,
0.8595647, -0.04587356, -0.552434, 0.8078431, 0, 1, 1,
0.8647391, -0.4809984, 2.210515, 0.8117647, 0, 1, 1,
0.8679616, -0.5197241, 2.53581, 0.8196079, 0, 1, 1,
0.8686982, 0.2515716, 2.57177, 0.8235294, 0, 1, 1,
0.8690585, 0.7160187, -0.5362611, 0.8313726, 0, 1, 1,
0.8720677, -0.04598727, 1.387118, 0.8352941, 0, 1, 1,
0.8731044, 1.130381, -0.9757869, 0.8431373, 0, 1, 1,
0.8776044, 0.5149778, 1.979453, 0.8470588, 0, 1, 1,
0.8776384, 0.5494846, 1.565, 0.854902, 0, 1, 1,
0.8847641, 0.6024612, 2.587994, 0.8588235, 0, 1, 1,
0.8940721, -0.9714825, 1.843716, 0.8666667, 0, 1, 1,
0.9016684, -0.379133, 1.82676, 0.8705882, 0, 1, 1,
0.9019176, -2.23167, 2.751228, 0.8784314, 0, 1, 1,
0.9020464, -0.3025418, 1.597142, 0.8823529, 0, 1, 1,
0.9059403, 0.4815539, -1.04213, 0.8901961, 0, 1, 1,
0.9085007, -0.1781585, 1.62314, 0.8941177, 0, 1, 1,
0.9120125, 1.281774, 0.4264997, 0.9019608, 0, 1, 1,
0.9167498, -1.945842, 1.319594, 0.9098039, 0, 1, 1,
0.9200273, -0.8368138, 1.777274, 0.9137255, 0, 1, 1,
0.9248674, -0.8874193, 3.808389, 0.9215686, 0, 1, 1,
0.9377685, 0.1841937, 1.866917, 0.9254902, 0, 1, 1,
0.94368, 1.893031, 1.551256, 0.9333333, 0, 1, 1,
0.9445328, 0.0277562, 1.940484, 0.9372549, 0, 1, 1,
0.949312, 0.259959, 1.465389, 0.945098, 0, 1, 1,
0.9507785, 2.435286, 0.2254568, 0.9490196, 0, 1, 1,
0.9556089, -0.3349262, 0.8691761, 0.9568627, 0, 1, 1,
0.955775, -1.516782, 2.994961, 0.9607843, 0, 1, 1,
0.9578667, -0.5430538, 2.357784, 0.9686275, 0, 1, 1,
0.9644741, 0.1829051, 3.178512, 0.972549, 0, 1, 1,
0.9701508, 1.179606, 0.3587366, 0.9803922, 0, 1, 1,
0.9737552, -0.3876729, 0.4575665, 0.9843137, 0, 1, 1,
0.9750002, -1.454762, 1.725068, 0.9921569, 0, 1, 1,
0.9792101, -1.331534, 4.501347, 0.9960784, 0, 1, 1,
0.9871892, -0.54216, 0.5889726, 1, 0, 0.9960784, 1,
0.9907601, -2.419866, 2.06649, 1, 0, 0.9882353, 1,
1.005866, -0.5255334, 2.185687, 1, 0, 0.9843137, 1,
1.00983, 0.3718552, -0.1326483, 1, 0, 0.9764706, 1,
1.010631, 0.5592803, -0.5106947, 1, 0, 0.972549, 1,
1.018148, -1.455763, 2.906798, 1, 0, 0.9647059, 1,
1.033022, -0.2379389, 1.944094, 1, 0, 0.9607843, 1,
1.033977, -0.2704795, 0.4532517, 1, 0, 0.9529412, 1,
1.046725, 0.4052224, 1.508988, 1, 0, 0.9490196, 1,
1.049332, 0.3865739, 0.1797606, 1, 0, 0.9411765, 1,
1.055533, 0.006033002, 1.728414, 1, 0, 0.9372549, 1,
1.061786, -0.8563491, 2.863462, 1, 0, 0.9294118, 1,
1.066221, 0.917392, 1.178887, 1, 0, 0.9254902, 1,
1.077377, 0.5025992, 1.421026, 1, 0, 0.9176471, 1,
1.079156, 0.4902296, 0.03822696, 1, 0, 0.9137255, 1,
1.084256, -0.668485, 1.72763, 1, 0, 0.9058824, 1,
1.084532, -1.773115, 2.214226, 1, 0, 0.9019608, 1,
1.085362, -1.027766, 2.740592, 1, 0, 0.8941177, 1,
1.085377, 0.3044725, 0.09647108, 1, 0, 0.8862745, 1,
1.091762, -0.2935071, 0.8766362, 1, 0, 0.8823529, 1,
1.093525, 0.6589019, 0.5183252, 1, 0, 0.8745098, 1,
1.096569, 1.304307, -0.4575557, 1, 0, 0.8705882, 1,
1.09848, 1.369984, 1.332781, 1, 0, 0.8627451, 1,
1.099487, 0.2655, 1.250197, 1, 0, 0.8588235, 1,
1.112316, 1.243645, 0.7492374, 1, 0, 0.8509804, 1,
1.119278, -1.178983, 2.739342, 1, 0, 0.8470588, 1,
1.131508, -0.5649118, 3.663902, 1, 0, 0.8392157, 1,
1.135037, -1.796855, 2.8607, 1, 0, 0.8352941, 1,
1.139011, 0.6222218, 1.309754, 1, 0, 0.827451, 1,
1.14072, -2.382918, 2.641084, 1, 0, 0.8235294, 1,
1.155009, -0.3243684, 1.835628, 1, 0, 0.8156863, 1,
1.156058, -0.7784864, 2.515599, 1, 0, 0.8117647, 1,
1.15931, -1.135818, 1.236888, 1, 0, 0.8039216, 1,
1.163687, 1.808026, 0.6773716, 1, 0, 0.7960784, 1,
1.170344, -0.6366506, 2.866303, 1, 0, 0.7921569, 1,
1.171627, -0.2114819, 0.9001989, 1, 0, 0.7843137, 1,
1.173323, 0.05863579, 2.46956, 1, 0, 0.7803922, 1,
1.178653, -0.6243995, 1.958734, 1, 0, 0.772549, 1,
1.183992, 0.007477129, 2.43251, 1, 0, 0.7686275, 1,
1.184973, 0.5197504, 1.860725, 1, 0, 0.7607843, 1,
1.188713, 0.3926216, 2.305413, 1, 0, 0.7568628, 1,
1.190529, -1.231383, 2.633518, 1, 0, 0.7490196, 1,
1.198379, -0.4378594, 3.101778, 1, 0, 0.7450981, 1,
1.200451, -0.1972848, 0.9253609, 1, 0, 0.7372549, 1,
1.202211, -1.679359, 3.13352, 1, 0, 0.7333333, 1,
1.21634, 0.9233553, 0.6123987, 1, 0, 0.7254902, 1,
1.219708, -1.410017, 2.493218, 1, 0, 0.7215686, 1,
1.224063, -0.0414992, 2.688709, 1, 0, 0.7137255, 1,
1.224431, -2.209909, 1.340827, 1, 0, 0.7098039, 1,
1.225675, 0.654775, 3.427269, 1, 0, 0.7019608, 1,
1.230144, 0.4498487, 0.5847692, 1, 0, 0.6941177, 1,
1.232636, 1.519259, 1.073968, 1, 0, 0.6901961, 1,
1.23665, 0.3196161, 1.727367, 1, 0, 0.682353, 1,
1.240819, -0.8893859, 4.07545, 1, 0, 0.6784314, 1,
1.24925, 0.6093165, 0.9445426, 1, 0, 0.6705883, 1,
1.250665, -0.6535611, 1.878624, 1, 0, 0.6666667, 1,
1.25614, -0.08624448, 1.97333, 1, 0, 0.6588235, 1,
1.260246, 0.4768712, 0.7896985, 1, 0, 0.654902, 1,
1.266608, 0.360247, 2.159143, 1, 0, 0.6470588, 1,
1.27083, 0.6067699, 1.427172, 1, 0, 0.6431373, 1,
1.274202, 0.92005, 2.325361, 1, 0, 0.6352941, 1,
1.277266, 1.029295, 0.5969983, 1, 0, 0.6313726, 1,
1.292693, -1.171954, 1.687854, 1, 0, 0.6235294, 1,
1.295473, -0.04706625, 0.999627, 1, 0, 0.6196079, 1,
1.314055, -0.04432757, 0.1890962, 1, 0, 0.6117647, 1,
1.317616, 1.622769, 1.395908, 1, 0, 0.6078432, 1,
1.322862, -0.6263813, 2.310655, 1, 0, 0.6, 1,
1.328488, 0.7782705, -0.9142537, 1, 0, 0.5921569, 1,
1.328538, -0.2335196, 2.056519, 1, 0, 0.5882353, 1,
1.334327, -0.7306541, 1.168744, 1, 0, 0.5803922, 1,
1.336523, -1.38324, 1.957618, 1, 0, 0.5764706, 1,
1.336733, -0.3630585, 2.127328, 1, 0, 0.5686275, 1,
1.34309, -1.29908, 1.75437, 1, 0, 0.5647059, 1,
1.348937, -1.826249, 2.481769, 1, 0, 0.5568628, 1,
1.350421, -0.1562466, 2.582836, 1, 0, 0.5529412, 1,
1.355251, 2.535372, 0.8739092, 1, 0, 0.5450981, 1,
1.355695, -1.161443, 2.021848, 1, 0, 0.5411765, 1,
1.370933, 0.6005381, -0.1750654, 1, 0, 0.5333334, 1,
1.372501, -0.3250579, 1.359147, 1, 0, 0.5294118, 1,
1.382274, -0.7334883, 2.51759, 1, 0, 0.5215687, 1,
1.390936, -1.678291, 3.316115, 1, 0, 0.5176471, 1,
1.402239, 0.3234016, 2.174008, 1, 0, 0.509804, 1,
1.40408, 1.306135, -0.1166514, 1, 0, 0.5058824, 1,
1.407816, 0.4662109, 2.774598, 1, 0, 0.4980392, 1,
1.408386, -0.02353354, 1.652344, 1, 0, 0.4901961, 1,
1.423182, -0.6862, 2.81494, 1, 0, 0.4862745, 1,
1.449893, -1.611241, 3.298939, 1, 0, 0.4784314, 1,
1.454268, 0.9404983, -1.671842, 1, 0, 0.4745098, 1,
1.460418, 0.5793006, 2.100406, 1, 0, 0.4666667, 1,
1.478017, -0.6377339, 2.319668, 1, 0, 0.4627451, 1,
1.483409, -0.7384007, 2.951427, 1, 0, 0.454902, 1,
1.496742, -0.5934467, -0.03040154, 1, 0, 0.4509804, 1,
1.497663, 0.4061119, -0.3248653, 1, 0, 0.4431373, 1,
1.49853, 0.051421, 1.451666, 1, 0, 0.4392157, 1,
1.51202, -1.241528, 3.510784, 1, 0, 0.4313726, 1,
1.512049, -0.9553294, 2.402513, 1, 0, 0.427451, 1,
1.522724, -0.04006952, 2.813831, 1, 0, 0.4196078, 1,
1.5249, -0.6669915, 2.047941, 1, 0, 0.4156863, 1,
1.5449, -1.429925, 1.28256, 1, 0, 0.4078431, 1,
1.54577, -0.1795208, 0.5086761, 1, 0, 0.4039216, 1,
1.556901, 0.1772905, 1.127402, 1, 0, 0.3960784, 1,
1.562842, 0.1656793, 1.868374, 1, 0, 0.3882353, 1,
1.567576, -1.020577, 3.302675, 1, 0, 0.3843137, 1,
1.569331, -0.08890262, 0.788137, 1, 0, 0.3764706, 1,
1.587385, 0.772949, 0.3016509, 1, 0, 0.372549, 1,
1.588183, -1.539088, 1.782325, 1, 0, 0.3647059, 1,
1.608195, 1.820527, 2.2215, 1, 0, 0.3607843, 1,
1.611327, -1.624839, 1.839883, 1, 0, 0.3529412, 1,
1.630323, -0.3703141, 1.22824, 1, 0, 0.3490196, 1,
1.641123, 0.2957239, 2.636162, 1, 0, 0.3411765, 1,
1.647759, -0.238632, 2.138196, 1, 0, 0.3372549, 1,
1.653074, -0.7440664, 2.587223, 1, 0, 0.3294118, 1,
1.656001, -0.7809433, 2.105639, 1, 0, 0.3254902, 1,
1.670401, -2.074045, 1.362047, 1, 0, 0.3176471, 1,
1.671099, 1.660879, 0.7029271, 1, 0, 0.3137255, 1,
1.679917, 0.6249135, 1.889249, 1, 0, 0.3058824, 1,
1.683244, -0.4693183, 1.55733, 1, 0, 0.2980392, 1,
1.686255, -0.05773833, 1.897345, 1, 0, 0.2941177, 1,
1.690103, -2.452186, 1.543249, 1, 0, 0.2862745, 1,
1.697556, -0.07510886, 1.197881, 1, 0, 0.282353, 1,
1.72144, 0.02275374, 0.7156245, 1, 0, 0.2745098, 1,
1.735239, 0.5226195, 1.1824, 1, 0, 0.2705882, 1,
1.741408, -0.2140639, 2.250682, 1, 0, 0.2627451, 1,
1.743812, 0.4123515, 2.422304, 1, 0, 0.2588235, 1,
1.745838, -1.507044, 1.658133, 1, 0, 0.2509804, 1,
1.747492, 0.08354491, 0.3858205, 1, 0, 0.2470588, 1,
1.747714, -1.201593, 1.957881, 1, 0, 0.2392157, 1,
1.75129, 1.8302, 0.5378926, 1, 0, 0.2352941, 1,
1.753232, -0.9927074, 2.164187, 1, 0, 0.227451, 1,
1.753462, 1.364934, -0.472154, 1, 0, 0.2235294, 1,
1.761162, 1.162862, 2.552665, 1, 0, 0.2156863, 1,
1.761789, -0.4044064, 1.907953, 1, 0, 0.2117647, 1,
1.813252, -0.6355235, -0.344876, 1, 0, 0.2039216, 1,
1.839352, -0.2248504, 2.60624, 1, 0, 0.1960784, 1,
1.901897, 0.04882788, 1.744339, 1, 0, 0.1921569, 1,
1.909067, 0.1430888, 1.269255, 1, 0, 0.1843137, 1,
1.910395, 0.6265849, 3.700681, 1, 0, 0.1803922, 1,
1.910748, 1.35034, 2.1902, 1, 0, 0.172549, 1,
1.915385, 0.4119896, 2.244238, 1, 0, 0.1686275, 1,
1.927306, -1.257881, 4.15526, 1, 0, 0.1607843, 1,
1.956769, 0.8140144, 0.3928587, 1, 0, 0.1568628, 1,
1.967895, 2.00577, 0.8643755, 1, 0, 0.1490196, 1,
1.973229, 1.505719, 0.6978431, 1, 0, 0.145098, 1,
2.001754, 0.047898, 0.6436626, 1, 0, 0.1372549, 1,
2.001827, -0.217074, 1.180472, 1, 0, 0.1333333, 1,
2.032105, 1.242458, 0.8808978, 1, 0, 0.1254902, 1,
2.032583, 1.328997, 1.166598, 1, 0, 0.1215686, 1,
2.055299, 0.8217263, 2.971025, 1, 0, 0.1137255, 1,
2.064824, 0.2207087, 0.5788364, 1, 0, 0.1098039, 1,
2.104061, -0.7107829, 1.267421, 1, 0, 0.1019608, 1,
2.110517, -0.1734276, 2.008525, 1, 0, 0.09411765, 1,
2.125394, -0.6766218, 2.774825, 1, 0, 0.09019608, 1,
2.138792, -0.4751281, 0.5569181, 1, 0, 0.08235294, 1,
2.146046, 0.6754071, 1.15743, 1, 0, 0.07843138, 1,
2.159678, -1.117564, 1.286318, 1, 0, 0.07058824, 1,
2.187279, -0.004347193, 1.172184, 1, 0, 0.06666667, 1,
2.243524, -0.3642529, 1.383791, 1, 0, 0.05882353, 1,
2.25426, 0.5114864, 2.824277, 1, 0, 0.05490196, 1,
2.275887, -1.445429, 0.1472907, 1, 0, 0.04705882, 1,
2.285007, -0.9928589, 1.221505, 1, 0, 0.04313726, 1,
2.288547, -1.645119, 3.216708, 1, 0, 0.03529412, 1,
2.398839, 0.125128, 2.136106, 1, 0, 0.03137255, 1,
2.422238, 0.2236804, 2.273399, 1, 0, 0.02352941, 1,
2.493398, -1.658915, 1.240356, 1, 0, 0.01960784, 1,
2.553873, 0.6083079, 2.312321, 1, 0, 0.01176471, 1,
2.594634, -0.2826759, 1.363826, 1, 0, 0.007843138, 1
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
-0.1303557, -5.021378, -7.650774, 0, -0.5, 0.5, 0.5,
-0.1303557, -5.021378, -7.650774, 1, -0.5, 0.5, 0.5,
-0.1303557, -5.021378, -7.650774, 1, 1.5, 0.5, 0.5,
-0.1303557, -5.021378, -7.650774, 0, 1.5, 0.5, 0.5
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
-3.779117, -0.355028, -7.650774, 0, -0.5, 0.5, 0.5,
-3.779117, -0.355028, -7.650774, 1, -0.5, 0.5, 0.5,
-3.779117, -0.355028, -7.650774, 1, 1.5, 0.5, 0.5,
-3.779117, -0.355028, -7.650774, 0, 1.5, 0.5, 0.5
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
-3.779117, -5.021378, -0.1630383, 0, -0.5, 0.5, 0.5,
-3.779117, -5.021378, -0.1630383, 1, -0.5, 0.5, 0.5,
-3.779117, -5.021378, -0.1630383, 1, 1.5, 0.5, 0.5,
-3.779117, -5.021378, -0.1630383, 0, 1.5, 0.5, 0.5
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
-2, -3.944528, -5.922834,
2, -3.944528, -5.922834,
-2, -3.944528, -5.922834,
-2, -4.124003, -6.210824,
-1, -3.944528, -5.922834,
-1, -4.124003, -6.210824,
0, -3.944528, -5.922834,
0, -4.124003, -6.210824,
1, -3.944528, -5.922834,
1, -4.124003, -6.210824,
2, -3.944528, -5.922834,
2, -4.124003, -6.210824
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
-2, -4.482953, -6.786804, 0, -0.5, 0.5, 0.5,
-2, -4.482953, -6.786804, 1, -0.5, 0.5, 0.5,
-2, -4.482953, -6.786804, 1, 1.5, 0.5, 0.5,
-2, -4.482953, -6.786804, 0, 1.5, 0.5, 0.5,
-1, -4.482953, -6.786804, 0, -0.5, 0.5, 0.5,
-1, -4.482953, -6.786804, 1, -0.5, 0.5, 0.5,
-1, -4.482953, -6.786804, 1, 1.5, 0.5, 0.5,
-1, -4.482953, -6.786804, 0, 1.5, 0.5, 0.5,
0, -4.482953, -6.786804, 0, -0.5, 0.5, 0.5,
0, -4.482953, -6.786804, 1, -0.5, 0.5, 0.5,
0, -4.482953, -6.786804, 1, 1.5, 0.5, 0.5,
0, -4.482953, -6.786804, 0, 1.5, 0.5, 0.5,
1, -4.482953, -6.786804, 0, -0.5, 0.5, 0.5,
1, -4.482953, -6.786804, 1, -0.5, 0.5, 0.5,
1, -4.482953, -6.786804, 1, 1.5, 0.5, 0.5,
1, -4.482953, -6.786804, 0, 1.5, 0.5, 0.5,
2, -4.482953, -6.786804, 0, -0.5, 0.5, 0.5,
2, -4.482953, -6.786804, 1, -0.5, 0.5, 0.5,
2, -4.482953, -6.786804, 1, 1.5, 0.5, 0.5,
2, -4.482953, -6.786804, 0, 1.5, 0.5, 0.5
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
-2.937095, -3, -5.922834,
-2.937095, 3, -5.922834,
-2.937095, -3, -5.922834,
-3.077432, -3, -6.210824,
-2.937095, -2, -5.922834,
-3.077432, -2, -6.210824,
-2.937095, -1, -5.922834,
-3.077432, -1, -6.210824,
-2.937095, 0, -5.922834,
-3.077432, 0, -6.210824,
-2.937095, 1, -5.922834,
-3.077432, 1, -6.210824,
-2.937095, 2, -5.922834,
-3.077432, 2, -6.210824,
-2.937095, 3, -5.922834,
-3.077432, 3, -6.210824
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
-3.358106, -3, -6.786804, 0, -0.5, 0.5, 0.5,
-3.358106, -3, -6.786804, 1, -0.5, 0.5, 0.5,
-3.358106, -3, -6.786804, 1, 1.5, 0.5, 0.5,
-3.358106, -3, -6.786804, 0, 1.5, 0.5, 0.5,
-3.358106, -2, -6.786804, 0, -0.5, 0.5, 0.5,
-3.358106, -2, -6.786804, 1, -0.5, 0.5, 0.5,
-3.358106, -2, -6.786804, 1, 1.5, 0.5, 0.5,
-3.358106, -2, -6.786804, 0, 1.5, 0.5, 0.5,
-3.358106, -1, -6.786804, 0, -0.5, 0.5, 0.5,
-3.358106, -1, -6.786804, 1, -0.5, 0.5, 0.5,
-3.358106, -1, -6.786804, 1, 1.5, 0.5, 0.5,
-3.358106, -1, -6.786804, 0, 1.5, 0.5, 0.5,
-3.358106, 0, -6.786804, 0, -0.5, 0.5, 0.5,
-3.358106, 0, -6.786804, 1, -0.5, 0.5, 0.5,
-3.358106, 0, -6.786804, 1, 1.5, 0.5, 0.5,
-3.358106, 0, -6.786804, 0, 1.5, 0.5, 0.5,
-3.358106, 1, -6.786804, 0, -0.5, 0.5, 0.5,
-3.358106, 1, -6.786804, 1, -0.5, 0.5, 0.5,
-3.358106, 1, -6.786804, 1, 1.5, 0.5, 0.5,
-3.358106, 1, -6.786804, 0, 1.5, 0.5, 0.5,
-3.358106, 2, -6.786804, 0, -0.5, 0.5, 0.5,
-3.358106, 2, -6.786804, 1, -0.5, 0.5, 0.5,
-3.358106, 2, -6.786804, 1, 1.5, 0.5, 0.5,
-3.358106, 2, -6.786804, 0, 1.5, 0.5, 0.5,
-3.358106, 3, -6.786804, 0, -0.5, 0.5, 0.5,
-3.358106, 3, -6.786804, 1, -0.5, 0.5, 0.5,
-3.358106, 3, -6.786804, 1, 1.5, 0.5, 0.5,
-3.358106, 3, -6.786804, 0, 1.5, 0.5, 0.5
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
-2.937095, -3.944528, -4,
-2.937095, -3.944528, 4,
-2.937095, -3.944528, -4,
-3.077432, -4.124003, -4,
-2.937095, -3.944528, -2,
-3.077432, -4.124003, -2,
-2.937095, -3.944528, 0,
-3.077432, -4.124003, 0,
-2.937095, -3.944528, 2,
-3.077432, -4.124003, 2,
-2.937095, -3.944528, 4,
-3.077432, -4.124003, 4
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
-3.358106, -4.482953, -4, 0, -0.5, 0.5, 0.5,
-3.358106, -4.482953, -4, 1, -0.5, 0.5, 0.5,
-3.358106, -4.482953, -4, 1, 1.5, 0.5, 0.5,
-3.358106, -4.482953, -4, 0, 1.5, 0.5, 0.5,
-3.358106, -4.482953, -2, 0, -0.5, 0.5, 0.5,
-3.358106, -4.482953, -2, 1, -0.5, 0.5, 0.5,
-3.358106, -4.482953, -2, 1, 1.5, 0.5, 0.5,
-3.358106, -4.482953, -2, 0, 1.5, 0.5, 0.5,
-3.358106, -4.482953, 0, 0, -0.5, 0.5, 0.5,
-3.358106, -4.482953, 0, 1, -0.5, 0.5, 0.5,
-3.358106, -4.482953, 0, 1, 1.5, 0.5, 0.5,
-3.358106, -4.482953, 0, 0, 1.5, 0.5, 0.5,
-3.358106, -4.482953, 2, 0, -0.5, 0.5, 0.5,
-3.358106, -4.482953, 2, 1, -0.5, 0.5, 0.5,
-3.358106, -4.482953, 2, 1, 1.5, 0.5, 0.5,
-3.358106, -4.482953, 2, 0, 1.5, 0.5, 0.5,
-3.358106, -4.482953, 4, 0, -0.5, 0.5, 0.5,
-3.358106, -4.482953, 4, 1, -0.5, 0.5, 0.5,
-3.358106, -4.482953, 4, 1, 1.5, 0.5, 0.5,
-3.358106, -4.482953, 4, 0, 1.5, 0.5, 0.5
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
-2.937095, -3.944528, -5.922834,
-2.937095, 3.234472, -5.922834,
-2.937095, -3.944528, 5.596758,
-2.937095, 3.234472, 5.596758,
-2.937095, -3.944528, -5.922834,
-2.937095, -3.944528, 5.596758,
-2.937095, 3.234472, -5.922834,
-2.937095, 3.234472, 5.596758,
-2.937095, -3.944528, -5.922834,
2.676384, -3.944528, -5.922834,
-2.937095, -3.944528, 5.596758,
2.676384, -3.944528, 5.596758,
-2.937095, 3.234472, -5.922834,
2.676384, 3.234472, -5.922834,
-2.937095, 3.234472, 5.596758,
2.676384, 3.234472, 5.596758,
2.676384, -3.944528, -5.922834,
2.676384, 3.234472, -5.922834,
2.676384, -3.944528, 5.596758,
2.676384, 3.234472, 5.596758,
2.676384, -3.944528, -5.922834,
2.676384, -3.944528, 5.596758,
2.676384, 3.234472, -5.922834,
2.676384, 3.234472, 5.596758
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
var radius = 7.843341;
var distance = 34.89591;
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
mvMatrix.translate( 0.1303557, 0.355028, 0.1630383 );
mvMatrix.scale( 1.510716, 1.181275, 0.7361696 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.89591);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
methoproptryne<-read.table("methoproptryne.xyz")
```

```
## Error in read.table("methoproptryne.xyz"): no lines available in input
```

```r
x<-methoproptryne$V2
```

```
## Error in eval(expr, envir, enclos): object 'methoproptryne' not found
```

```r
y<-methoproptryne$V3
```

```
## Error in eval(expr, envir, enclos): object 'methoproptryne' not found
```

```r
z<-methoproptryne$V4
```

```
## Error in eval(expr, envir, enclos): object 'methoproptryne' not found
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
-2.855345, 0.1755529, -0.6118736, 0, 0, 1, 1, 1,
-2.557046, 1.24761, 0.1388098, 1, 0, 0, 1, 1,
-2.488585, 1.102998, -1.632303, 1, 0, 0, 1, 1,
-2.472072, 2.028451, -0.8455365, 1, 0, 0, 1, 1,
-2.440842, -0.5454892, -1.693775, 1, 0, 0, 1, 1,
-2.414627, 1.247433, -1.453198, 1, 0, 0, 1, 1,
-2.357959, 0.5299935, -1.325343, 0, 0, 0, 1, 1,
-2.328951, -0.0179929, -0.8611052, 0, 0, 0, 1, 1,
-2.265467, -1.108173, -1.470601, 0, 0, 0, 1, 1,
-2.26341, 0.5483605, -0.4091923, 0, 0, 0, 1, 1,
-2.251342, 0.4477313, -2.746393, 0, 0, 0, 1, 1,
-2.249177, 0.1237119, -2.35883, 0, 0, 0, 1, 1,
-2.227158, -0.7479034, -2.403204, 0, 0, 0, 1, 1,
-2.227121, 0.3323317, -0.5694645, 1, 1, 1, 1, 1,
-2.181089, -0.9768138, -3.371282, 1, 1, 1, 1, 1,
-2.149756, -1.950749, -1.242904, 1, 1, 1, 1, 1,
-2.146454, -0.04888551, -1.161189, 1, 1, 1, 1, 1,
-2.143157, 0.4892246, -2.773561, 1, 1, 1, 1, 1,
-2.14029, 0.3812705, -1.264783, 1, 1, 1, 1, 1,
-2.139907, -0.543108, 0.1294956, 1, 1, 1, 1, 1,
-2.08541, 0.8459727, -1.454947, 1, 1, 1, 1, 1,
-2.058934, -1.461097, -1.027202, 1, 1, 1, 1, 1,
-2.024879, -1.047716, -4.139026, 1, 1, 1, 1, 1,
-2.019948, 0.1638933, -0.3757636, 1, 1, 1, 1, 1,
-1.994192, -0.03069949, -1.487804, 1, 1, 1, 1, 1,
-1.991948, 2.028195, -1.135114, 1, 1, 1, 1, 1,
-1.950144, 0.7774804, -1.460398, 1, 1, 1, 1, 1,
-1.945238, -1.349736, -1.060391, 1, 1, 1, 1, 1,
-1.912189, 0.5555364, -1.864599, 0, 0, 1, 1, 1,
-1.897178, 0.3292311, -1.916913, 1, 0, 0, 1, 1,
-1.891413, 0.5985358, -1.087576, 1, 0, 0, 1, 1,
-1.878288, -0.3377542, -3.167507, 1, 0, 0, 1, 1,
-1.860376, -0.2516176, -1.967998, 1, 0, 0, 1, 1,
-1.83407, -0.4422014, -0.6658686, 1, 0, 0, 1, 1,
-1.792489, -0.03412608, -1.938337, 0, 0, 0, 1, 1,
-1.738493, 0.66181, -0.242622, 0, 0, 0, 1, 1,
-1.70135, -0.1138824, -1.443505, 0, 0, 0, 1, 1,
-1.694986, 0.7394679, -0.0993245, 0, 0, 0, 1, 1,
-1.693323, -0.7413021, 0.1494781, 0, 0, 0, 1, 1,
-1.681448, 0.3301402, -1.008255, 0, 0, 0, 1, 1,
-1.681033, -1.017414, -3.476165, 0, 0, 0, 1, 1,
-1.677956, 0.4509677, -1.923118, 1, 1, 1, 1, 1,
-1.673831, 1.043006, -1.000715, 1, 1, 1, 1, 1,
-1.671434, 0.5688004, -1.044562, 1, 1, 1, 1, 1,
-1.652321, -0.1332797, -2.768568, 1, 1, 1, 1, 1,
-1.625578, 0.1018914, 0.4357826, 1, 1, 1, 1, 1,
-1.622768, -1.032243, -2.30875, 1, 1, 1, 1, 1,
-1.620821, 1.052554, -1.10778, 1, 1, 1, 1, 1,
-1.610877, -1.110149, -1.811842, 1, 1, 1, 1, 1,
-1.610669, -0.09010836, -0.9487582, 1, 1, 1, 1, 1,
-1.608831, -1.072055, -1.287053, 1, 1, 1, 1, 1,
-1.595593, 0.2406389, -2.896172, 1, 1, 1, 1, 1,
-1.592335, 0.2699296, -2.029435, 1, 1, 1, 1, 1,
-1.591219, -1.710012, -2.638135, 1, 1, 1, 1, 1,
-1.574011, 1.073741, -0.6812675, 1, 1, 1, 1, 1,
-1.5326, -0.9539064, -3.228361, 1, 1, 1, 1, 1,
-1.523761, -0.1007369, -1.64431, 0, 0, 1, 1, 1,
-1.52324, -0.3808025, -0.8442861, 1, 0, 0, 1, 1,
-1.522659, 0.03116465, -2.010662, 1, 0, 0, 1, 1,
-1.517195, 1.932476, 0.1113734, 1, 0, 0, 1, 1,
-1.5145, -0.4494373, -2.188784, 1, 0, 0, 1, 1,
-1.494866, -0.5297699, -2.341213, 1, 0, 0, 1, 1,
-1.488233, 1.836528, -0.7044384, 0, 0, 0, 1, 1,
-1.485171, -0.02861555, -1.396161, 0, 0, 0, 1, 1,
-1.484727, -0.6050134, -2.459829, 0, 0, 0, 1, 1,
-1.483962, 0.816267, -1.252151, 0, 0, 0, 1, 1,
-1.461948, 1.100153, -0.3349476, 0, 0, 0, 1, 1,
-1.458186, -1.194583, -2.363225, 0, 0, 0, 1, 1,
-1.450434, 0.3244329, -2.734197, 0, 0, 0, 1, 1,
-1.441387, 0.1624164, -1.491809, 1, 1, 1, 1, 1,
-1.435184, -0.6849623, -2.377614, 1, 1, 1, 1, 1,
-1.434718, 0.1416198, -0.3398913, 1, 1, 1, 1, 1,
-1.434137, 0.3774736, -1.905762, 1, 1, 1, 1, 1,
-1.420701, -0.343264, -2.224179, 1, 1, 1, 1, 1,
-1.418071, 0.6670735, -0.4747899, 1, 1, 1, 1, 1,
-1.417746, 1.234742, 0.3908351, 1, 1, 1, 1, 1,
-1.413655, -1.463633, -2.482829, 1, 1, 1, 1, 1,
-1.405892, 1.609548, -0.5906145, 1, 1, 1, 1, 1,
-1.400777, 0.4801706, 0.5967828, 1, 1, 1, 1, 1,
-1.396165, 1.581333, -1.669807, 1, 1, 1, 1, 1,
-1.384667, -0.2806211, -1.89782, 1, 1, 1, 1, 1,
-1.376006, -1.293106, -3.147571, 1, 1, 1, 1, 1,
-1.354618, -0.1056919, -1.009701, 1, 1, 1, 1, 1,
-1.353045, 0.06615525, -1.079143, 1, 1, 1, 1, 1,
-1.349349, 0.3508883, -1.991227, 0, 0, 1, 1, 1,
-1.343241, -0.1094132, -1.575158, 1, 0, 0, 1, 1,
-1.329119, 0.05170568, -1.777683, 1, 0, 0, 1, 1,
-1.327583, 1.373521, -0.4571577, 1, 0, 0, 1, 1,
-1.320851, 0.2975208, -0.9505807, 1, 0, 0, 1, 1,
-1.314341, 2.256127, -0.4363548, 1, 0, 0, 1, 1,
-1.305715, 0.2636292, -2.912604, 0, 0, 0, 1, 1,
-1.296215, 0.4726718, -0.4040958, 0, 0, 0, 1, 1,
-1.295123, 1.149002, -0.109125, 0, 0, 0, 1, 1,
-1.294619, -1.077137, -1.338356, 0, 0, 0, 1, 1,
-1.293102, 0.4694848, -0.6678273, 0, 0, 0, 1, 1,
-1.292405, -0.1183995, -2.347081, 0, 0, 0, 1, 1,
-1.291332, -0.2681841, -4.200103, 0, 0, 0, 1, 1,
-1.287147, -0.6956831, -2.193791, 1, 1, 1, 1, 1,
-1.267648, 1.056001, -2.196768, 1, 1, 1, 1, 1,
-1.262983, 0.03108636, -1.369471, 1, 1, 1, 1, 1,
-1.256508, 1.598383, -1.63279, 1, 1, 1, 1, 1,
-1.256445, -0.2991897, -2.957598, 1, 1, 1, 1, 1,
-1.252717, -1.356201, -2.567743, 1, 1, 1, 1, 1,
-1.249534, 0.2242246, -1.755213, 1, 1, 1, 1, 1,
-1.237902, -0.3198327, -2.105654, 1, 1, 1, 1, 1,
-1.227123, 0.6192286, -2.343774, 1, 1, 1, 1, 1,
-1.224124, -0.9576426, -3.397896, 1, 1, 1, 1, 1,
-1.219472, 0.6505, -2.191057, 1, 1, 1, 1, 1,
-1.216255, -0.6867749, -2.26818, 1, 1, 1, 1, 1,
-1.215027, 0.1583474, -2.924152, 1, 1, 1, 1, 1,
-1.210932, 1.319244, -1.837961, 1, 1, 1, 1, 1,
-1.209395, -0.7255309, -0.03670817, 1, 1, 1, 1, 1,
-1.209395, 1.610937, -1.201319, 0, 0, 1, 1, 1,
-1.205196, 0.4834759, 0.1795667, 1, 0, 0, 1, 1,
-1.200683, -0.7050747, -1.235296, 1, 0, 0, 1, 1,
-1.199359, -0.08577832, -3.620614, 1, 0, 0, 1, 1,
-1.196467, 0.2223243, -1.003991, 1, 0, 0, 1, 1,
-1.190848, 0.1022016, -0.9522836, 1, 0, 0, 1, 1,
-1.181827, 0.955826, -1.853456, 0, 0, 0, 1, 1,
-1.176631, -0.07079559, -3.027447, 0, 0, 0, 1, 1,
-1.174671, -0.1438918, -3.64868, 0, 0, 0, 1, 1,
-1.168847, -0.3365572, -1.094269, 0, 0, 0, 1, 1,
-1.162581, 0.3526804, -1.859274, 0, 0, 0, 1, 1,
-1.159311, 0.405318, -2.031384, 0, 0, 0, 1, 1,
-1.157565, 1.175528, 1.360411, 0, 0, 0, 1, 1,
-1.155127, 0.06026038, -1.02806, 1, 1, 1, 1, 1,
-1.152709, 1.061918, 0.800226, 1, 1, 1, 1, 1,
-1.150366, -0.05611005, -1.373452, 1, 1, 1, 1, 1,
-1.131949, 0.6981725, -1.27221, 1, 1, 1, 1, 1,
-1.130739, 0.3827243, -1.679165, 1, 1, 1, 1, 1,
-1.129722, -0.6562157, -1.648269, 1, 1, 1, 1, 1,
-1.12796, -0.2704841, -1.215281, 1, 1, 1, 1, 1,
-1.125903, -0.1530901, -0.8560396, 1, 1, 1, 1, 1,
-1.124932, 0.6313448, 0.4941939, 1, 1, 1, 1, 1,
-1.11804, 1.519794, -1.541036, 1, 1, 1, 1, 1,
-1.113329, -2.006396, -2.01363, 1, 1, 1, 1, 1,
-1.11182, -0.7336786, -1.105106, 1, 1, 1, 1, 1,
-1.10486, -1.331551, -2.067745, 1, 1, 1, 1, 1,
-1.103281, 0.2179711, -0.9651473, 1, 1, 1, 1, 1,
-1.102796, -1.057856, -2.455188, 1, 1, 1, 1, 1,
-1.091652, 0.143279, -2.500162, 0, 0, 1, 1, 1,
-1.086883, -0.06394866, -1.061418, 1, 0, 0, 1, 1,
-1.077692, 0.1763822, -1.846245, 1, 0, 0, 1, 1,
-1.077594, 1.602631, -2.354084, 1, 0, 0, 1, 1,
-1.073452, 1.288071, -3.818743, 1, 0, 0, 1, 1,
-1.072272, 1.67163, -1.670475, 1, 0, 0, 1, 1,
-1.067528, 0.736246, -0.2768692, 0, 0, 0, 1, 1,
-1.056362, -0.4180603, -2.616555, 0, 0, 0, 1, 1,
-1.050737, 0.5670975, -0.4666873, 0, 0, 0, 1, 1,
-1.039428, 0.1737326, -0.4488608, 0, 0, 0, 1, 1,
-1.032483, -0.1254445, -1.365996, 0, 0, 0, 1, 1,
-1.03171, -0.01321652, -0.645847, 0, 0, 0, 1, 1,
-1.027079, 0.2876042, -0.0436047, 0, 0, 0, 1, 1,
-1.024633, 1.477295, -1.586536, 1, 1, 1, 1, 1,
-1.020183, 0.8430039, -1.4928, 1, 1, 1, 1, 1,
-1.01962, -1.082024, -2.010781, 1, 1, 1, 1, 1,
-1.017729, -0.5342238, -1.066568, 1, 1, 1, 1, 1,
-1.01242, -0.105505, -1.152661, 1, 1, 1, 1, 1,
-1.007309, -1.898559, -0.1511068, 1, 1, 1, 1, 1,
-0.99379, 1.840526, -1.8379, 1, 1, 1, 1, 1,
-0.9926857, 1.99968, -2.169272, 1, 1, 1, 1, 1,
-0.9863465, 1.504561, -0.9142529, 1, 1, 1, 1, 1,
-0.985523, -0.2650811, -1.810619, 1, 1, 1, 1, 1,
-0.9797148, -1.294622, -1.780644, 1, 1, 1, 1, 1,
-0.9680687, 0.5702273, 0.3771229, 1, 1, 1, 1, 1,
-0.9615725, 0.4463343, -0.552719, 1, 1, 1, 1, 1,
-0.9606597, -0.1969638, -3.42592, 1, 1, 1, 1, 1,
-0.9547911, -0.2274933, -3.361643, 1, 1, 1, 1, 1,
-0.9546422, 0.9821098, 0.3629645, 0, 0, 1, 1, 1,
-0.9477592, 0.04599399, -1.921106, 1, 0, 0, 1, 1,
-0.9389042, -0.08035874, -1.709233, 1, 0, 0, 1, 1,
-0.9375558, 0.9877247, 0.07936794, 1, 0, 0, 1, 1,
-0.9321886, -0.2779708, -0.2138628, 1, 0, 0, 1, 1,
-0.9316653, 0.3605058, -1.184297, 1, 0, 0, 1, 1,
-0.9308234, -0.1811959, -0.5586378, 0, 0, 0, 1, 1,
-0.9283988, -0.490364, -1.995756, 0, 0, 0, 1, 1,
-0.9275203, 0.3590842, 0.8579999, 0, 0, 0, 1, 1,
-0.9249362, 1.170422, 0.007290483, 0, 0, 0, 1, 1,
-0.918144, -0.3083439, -2.093479, 0, 0, 0, 1, 1,
-0.9133899, -0.2939498, -3.275992, 0, 0, 0, 1, 1,
-0.9096742, 1.348018, -0.6841525, 0, 0, 0, 1, 1,
-0.9072487, 0.3670584, -2.049587, 1, 1, 1, 1, 1,
-0.9065728, -1.183798, -1.755618, 1, 1, 1, 1, 1,
-0.90383, 0.3084395, -0.6417822, 1, 1, 1, 1, 1,
-0.9009003, 0.7871403, 1.771944, 1, 1, 1, 1, 1,
-0.8931534, -0.2265309, -2.0809, 1, 1, 1, 1, 1,
-0.8903764, 0.4043629, -1.628045, 1, 1, 1, 1, 1,
-0.8892972, 0.7009997, -2.075538, 1, 1, 1, 1, 1,
-0.8880917, -0.480975, -4.300914, 1, 1, 1, 1, 1,
-0.8879853, -1.623611, -1.996107, 1, 1, 1, 1, 1,
-0.8855078, 0.5132634, -0.7669737, 1, 1, 1, 1, 1,
-0.8851827, -0.441515, -1.92933, 1, 1, 1, 1, 1,
-0.8830606, 0.3473278, -2.811024, 1, 1, 1, 1, 1,
-0.8825625, -0.16512, -1.644853, 1, 1, 1, 1, 1,
-0.8782299, 0.01836733, -2.933841, 1, 1, 1, 1, 1,
-0.8764011, -0.2980424, -3.529396, 1, 1, 1, 1, 1,
-0.876307, -1.226948, -4.78335, 0, 0, 1, 1, 1,
-0.8744653, 0.4491176, -2.937923, 1, 0, 0, 1, 1,
-0.8701741, -3.785551, -3.139493, 1, 0, 0, 1, 1,
-0.8674965, 1.220377, -2.060934, 1, 0, 0, 1, 1,
-0.866354, 1.670654, 1.613461, 1, 0, 0, 1, 1,
-0.8613684, -0.8846878, -1.006414, 1, 0, 0, 1, 1,
-0.8584162, 0.5461411, -2.131415, 0, 0, 0, 1, 1,
-0.857537, -0.7823437, -0.987052, 0, 0, 0, 1, 1,
-0.8480873, 0.5960349, -0.6028003, 0, 0, 0, 1, 1,
-0.8472224, 1.564597, -0.3946721, 0, 0, 0, 1, 1,
-0.838755, 0.3044356, -1.511635, 0, 0, 0, 1, 1,
-0.8372081, -0.8857656, -3.271725, 0, 0, 0, 1, 1,
-0.8353726, 0.04727446, -2.676332, 0, 0, 0, 1, 1,
-0.826923, -0.5307007, -3.731444, 1, 1, 1, 1, 1,
-0.8226635, 1.858136, -0.966383, 1, 1, 1, 1, 1,
-0.8179112, 2.729665, -1.610541, 1, 1, 1, 1, 1,
-0.8157981, 0.389801, -0.3255905, 1, 1, 1, 1, 1,
-0.8152776, -0.7881908, -2.907951, 1, 1, 1, 1, 1,
-0.8132051, -1.556851, -2.220583, 1, 1, 1, 1, 1,
-0.8090519, 0.1244904, -1.429604, 1, 1, 1, 1, 1,
-0.8036861, 0.4779029, -0.04753304, 1, 1, 1, 1, 1,
-0.7996728, -0.8366905, -2.751393, 1, 1, 1, 1, 1,
-0.7996165, -0.4751236, -2.19868, 1, 1, 1, 1, 1,
-0.795682, -0.5363261, -1.119566, 1, 1, 1, 1, 1,
-0.7844802, 0.01149109, -1.03265, 1, 1, 1, 1, 1,
-0.7825149, -0.6764478, -0.8734616, 1, 1, 1, 1, 1,
-0.7815463, -0.03180497, -0.8478643, 1, 1, 1, 1, 1,
-0.7812864, 0.4303785, 0.5255624, 1, 1, 1, 1, 1,
-0.7702207, 2.131027, 0.6005226, 0, 0, 1, 1, 1,
-0.7623155, 1.309691, -1.475148, 1, 0, 0, 1, 1,
-0.7573113, -0.09591313, -0.7635112, 1, 0, 0, 1, 1,
-0.7566412, -2.327254, -2.647219, 1, 0, 0, 1, 1,
-0.7496564, 2.242854, -0.8041196, 1, 0, 0, 1, 1,
-0.7487167, -0.4642022, -1.734191, 1, 0, 0, 1, 1,
-0.7467073, 1.007856, -1.004813, 0, 0, 0, 1, 1,
-0.7452663, -0.4561672, -1.052373, 0, 0, 0, 1, 1,
-0.7449449, 1.701615, -1.16811, 0, 0, 0, 1, 1,
-0.740449, -0.9133283, -2.125049, 0, 0, 0, 1, 1,
-0.7316006, -0.7945002, -5.755074, 0, 0, 0, 1, 1,
-0.7306619, -0.008070241, -1.575903, 0, 0, 0, 1, 1,
-0.72868, 0.8684509, -0.1558151, 0, 0, 0, 1, 1,
-0.7211882, 1.767612, -0.5732976, 1, 1, 1, 1, 1,
-0.7192473, 0.5716447, -0.5749577, 1, 1, 1, 1, 1,
-0.7167733, -0.2980465, -1.924172, 1, 1, 1, 1, 1,
-0.7142643, 0.1989441, -0.8264485, 1, 1, 1, 1, 1,
-0.7067987, -0.7074834, -2.585068, 1, 1, 1, 1, 1,
-0.7021107, -0.2151783, -2.379874, 1, 1, 1, 1, 1,
-0.7005324, 0.03473951, -0.443219, 1, 1, 1, 1, 1,
-0.6997761, -0.2844273, -1.33824, 1, 1, 1, 1, 1,
-0.6961424, -0.1016047, -0.8429496, 1, 1, 1, 1, 1,
-0.694357, -0.3900304, -1.676719, 1, 1, 1, 1, 1,
-0.6935291, -2.34473, -2.358506, 1, 1, 1, 1, 1,
-0.6847982, -0.9340183, -2.324558, 1, 1, 1, 1, 1,
-0.6833128, 0.3867199, -1.840918, 1, 1, 1, 1, 1,
-0.6822963, -0.9897909, -1.861399, 1, 1, 1, 1, 1,
-0.6788206, 1.139066, 0.343488, 1, 1, 1, 1, 1,
-0.6747228, 0.9945974, -3.172039, 0, 0, 1, 1, 1,
-0.6741096, 0.9911827, -1.941701, 1, 0, 0, 1, 1,
-0.6724191, 0.7114546, -0.697631, 1, 0, 0, 1, 1,
-0.6702132, -1.72592, -2.947193, 1, 0, 0, 1, 1,
-0.6685367, -1.70397, -3.380817, 1, 0, 0, 1, 1,
-0.6629872, -0.2402858, -1.147036, 1, 0, 0, 1, 1,
-0.6571121, -1.547611, -3.950805, 0, 0, 0, 1, 1,
-0.656265, 0.4305822, -0.6378239, 0, 0, 0, 1, 1,
-0.6511193, -0.5206248, -2.691403, 0, 0, 0, 1, 1,
-0.6505961, -0.1796621, -1.315275, 0, 0, 0, 1, 1,
-0.6501524, 0.4219601, -1.597028, 0, 0, 0, 1, 1,
-0.6346273, 0.9639995, 0.1333398, 0, 0, 0, 1, 1,
-0.6343125, 0.7991414, -1.354316, 0, 0, 0, 1, 1,
-0.6305068, 0.4798945, -1.298296, 1, 1, 1, 1, 1,
-0.6288105, -0.05143343, -2.100494, 1, 1, 1, 1, 1,
-0.6184493, -0.3565003, -1.753465, 1, 1, 1, 1, 1,
-0.6166309, 1.168197, -0.702653, 1, 1, 1, 1, 1,
-0.6133313, -0.5813975, -2.311351, 1, 1, 1, 1, 1,
-0.6098107, -0.3329203, -2.141895, 1, 1, 1, 1, 1,
-0.6068045, 1.417412, -2.222605, 1, 1, 1, 1, 1,
-0.5993777, 0.3148331, -0.6638449, 1, 1, 1, 1, 1,
-0.5976405, 2.305223, -0.3917823, 1, 1, 1, 1, 1,
-0.5895474, 0.714178, 2.457394, 1, 1, 1, 1, 1,
-0.5867003, 0.387409, -0.5064051, 1, 1, 1, 1, 1,
-0.5847689, -2.822122, -3.906286, 1, 1, 1, 1, 1,
-0.5747636, -1.755948, -2.653976, 1, 1, 1, 1, 1,
-0.5741224, 1.386369, -3.039663, 1, 1, 1, 1, 1,
-0.562401, 0.6100459, -0.3754536, 1, 1, 1, 1, 1,
-0.5571672, 0.1131008, -1.089732, 0, 0, 1, 1, 1,
-0.5534995, -0.1719249, -2.709773, 1, 0, 0, 1, 1,
-0.5520748, 0.6591731, -1.411664, 1, 0, 0, 1, 1,
-0.5516514, -0.1228211, -1.939752, 1, 0, 0, 1, 1,
-0.5411463, -0.5972062, -1.445566, 1, 0, 0, 1, 1,
-0.5405455, 2.154263, -2.404973, 1, 0, 0, 1, 1,
-0.5359931, -2.007531, -3.271633, 0, 0, 0, 1, 1,
-0.5308025, 1.147866, -0.4667006, 0, 0, 0, 1, 1,
-0.5301566, 0.9475103, 1.260478, 0, 0, 0, 1, 1,
-0.5289963, 0.6040107, -1.62823, 0, 0, 0, 1, 1,
-0.5215775, 3.129923, 0.3985487, 0, 0, 0, 1, 1,
-0.5198281, -0.1049423, -1.459619, 0, 0, 0, 1, 1,
-0.519274, -0.2555605, -2.294192, 0, 0, 0, 1, 1,
-0.5164256, 0.126267, -2.603679, 1, 1, 1, 1, 1,
-0.5137487, -0.8423761, -2.104173, 1, 1, 1, 1, 1,
-0.5110753, 0.8644382, -1.117866, 1, 1, 1, 1, 1,
-0.5037013, -0.2817086, -2.237814, 1, 1, 1, 1, 1,
-0.5029873, 1.32336, -0.7816958, 1, 1, 1, 1, 1,
-0.4974746, 0.03460262, -1.9669, 1, 1, 1, 1, 1,
-0.4955785, 0.4916892, 1.688978, 1, 1, 1, 1, 1,
-0.4937467, -0.03271177, -2.197725, 1, 1, 1, 1, 1,
-0.4917279, 0.6451907, -1.629012, 1, 1, 1, 1, 1,
-0.4881916, -1.828843, -3.221958, 1, 1, 1, 1, 1,
-0.4872442, -0.7126044, -2.755355, 1, 1, 1, 1, 1,
-0.4850303, 0.06340824, 0.07050408, 1, 1, 1, 1, 1,
-0.482967, 0.7448906, -1.809537, 1, 1, 1, 1, 1,
-0.4804255, -0.5289613, -2.850404, 1, 1, 1, 1, 1,
-0.4788812, -0.8460233, -2.610352, 1, 1, 1, 1, 1,
-0.4765157, 0.05137556, 0.2899868, 0, 0, 1, 1, 1,
-0.4745443, -0.3080371, -0.1898406, 1, 0, 0, 1, 1,
-0.4737891, 1.18329, 0.7335613, 1, 0, 0, 1, 1,
-0.4731584, -2.156654, -2.812189, 1, 0, 0, 1, 1,
-0.4700899, -0.9933796, -2.438615, 1, 0, 0, 1, 1,
-0.4692543, 0.9701817, -1.770699, 1, 0, 0, 1, 1,
-0.467036, -1.031061, -1.957902, 0, 0, 0, 1, 1,
-0.4605365, 0.7193303, -0.5557079, 0, 0, 0, 1, 1,
-0.4549516, 0.000991217, -0.638229, 0, 0, 0, 1, 1,
-0.4515333, 1.008164, 0.480827, 0, 0, 0, 1, 1,
-0.443597, -0.08363111, -2.580699, 0, 0, 0, 1, 1,
-0.4379795, -0.6939303, -3.295466, 0, 0, 0, 1, 1,
-0.4367427, -1.342517, -3.776702, 0, 0, 0, 1, 1,
-0.4335174, -0.5847452, -1.923988, 1, 1, 1, 1, 1,
-0.4305938, 0.8958189, -1.660348, 1, 1, 1, 1, 1,
-0.428523, 2.828581, 0.1234595, 1, 1, 1, 1, 1,
-0.4282431, 0.3748454, -0.6328037, 1, 1, 1, 1, 1,
-0.4172322, 2.323557, -0.8878175, 1, 1, 1, 1, 1,
-0.4166978, 0.6357919, -1.66055, 1, 1, 1, 1, 1,
-0.4163308, -0.8760758, -1.845721, 1, 1, 1, 1, 1,
-0.4149613, -0.8559445, -3.113648, 1, 1, 1, 1, 1,
-0.4136537, -1.433225, -2.17854, 1, 1, 1, 1, 1,
-0.4102902, 0.1808822, 0.8721374, 1, 1, 1, 1, 1,
-0.4064265, 0.1156182, 1.581528, 1, 1, 1, 1, 1,
-0.4063437, 2.299601, -0.5261343, 1, 1, 1, 1, 1,
-0.4051573, 0.3653264, -1.145505, 1, 1, 1, 1, 1,
-0.4049427, 1.625069, -1.307604, 1, 1, 1, 1, 1,
-0.4038473, 1.87628, -0.2182769, 1, 1, 1, 1, 1,
-0.3996918, 1.062874, 1.028077, 0, 0, 1, 1, 1,
-0.3979382, 0.3252618, -0.7854514, 1, 0, 0, 1, 1,
-0.3951681, -0.2473124, -3.383595, 1, 0, 0, 1, 1,
-0.3950634, 1.399179, -0.3071985, 1, 0, 0, 1, 1,
-0.3935999, -1.619375, -2.99021, 1, 0, 0, 1, 1,
-0.389315, 1.155341, -0.432439, 1, 0, 0, 1, 1,
-0.3869668, 0.3305361, -0.7548222, 0, 0, 0, 1, 1,
-0.386347, 0.4450964, -1.530897, 0, 0, 0, 1, 1,
-0.3834054, -2.501252, -3.708081, 0, 0, 0, 1, 1,
-0.381131, 0.6911294, -0.1566717, 0, 0, 0, 1, 1,
-0.3807893, -0.5599498, -2.68343, 0, 0, 0, 1, 1,
-0.3798255, -0.5576175, -1.375435, 0, 0, 0, 1, 1,
-0.3785317, -1.394878, -3.163023, 0, 0, 0, 1, 1,
-0.3730474, 0.652418, -1.167222, 1, 1, 1, 1, 1,
-0.3723063, -0.9024183, -2.521478, 1, 1, 1, 1, 1,
-0.3716018, -0.1333091, -3.688645, 1, 1, 1, 1, 1,
-0.3697432, -1.402321, -3.437589, 1, 1, 1, 1, 1,
-0.3655285, 0.131192, -2.320759, 1, 1, 1, 1, 1,
-0.365104, -0.3674692, -1.725266, 1, 1, 1, 1, 1,
-0.3626528, 0.7010036, -0.4922255, 1, 1, 1, 1, 1,
-0.3553415, -0.1373549, -0.9942334, 1, 1, 1, 1, 1,
-0.3520272, 0.5404063, -0.1195115, 1, 1, 1, 1, 1,
-0.3517255, -0.1653715, -2.822943, 1, 1, 1, 1, 1,
-0.3501332, 1.673631, -0.1165948, 1, 1, 1, 1, 1,
-0.3488657, -1.107103, -3.429909, 1, 1, 1, 1, 1,
-0.3476143, -0.2875199, -2.666361, 1, 1, 1, 1, 1,
-0.3469106, -1.476277, -4.892144, 1, 1, 1, 1, 1,
-0.3467292, -0.3335752, -3.677634, 1, 1, 1, 1, 1,
-0.344304, 0.3098245, -3.056453, 0, 0, 1, 1, 1,
-0.3430042, -0.1265707, -1.826026, 1, 0, 0, 1, 1,
-0.3418181, -1.406272, -3.660955, 1, 0, 0, 1, 1,
-0.3358686, 0.04272804, -1.834479, 1, 0, 0, 1, 1,
-0.33551, 0.1706173, 0.1125371, 1, 0, 0, 1, 1,
-0.3325977, 1.104153, -0.5164651, 1, 0, 0, 1, 1,
-0.3323604, -2.333489, -3.354189, 0, 0, 0, 1, 1,
-0.3297726, -1.500275, -2.025428, 0, 0, 0, 1, 1,
-0.3277278, -1.467556, -1.515273, 0, 0, 0, 1, 1,
-0.3272448, 1.84697, 0.1797372, 0, 0, 0, 1, 1,
-0.3245553, 0.7010919, -1.427258, 0, 0, 0, 1, 1,
-0.322518, 1.41893, 0.6755173, 0, 0, 0, 1, 1,
-0.321954, 0.5398628, 0.6877635, 0, 0, 0, 1, 1,
-0.3172956, 1.44144, 0.810453, 1, 1, 1, 1, 1,
-0.3069916, -0.06430428, -2.624094, 1, 1, 1, 1, 1,
-0.3023522, -1.724688, -4.373437, 1, 1, 1, 1, 1,
-0.3020206, -0.2942962, -1.907542, 1, 1, 1, 1, 1,
-0.2976552, -0.904411, -1.067041, 1, 1, 1, 1, 1,
-0.296882, 0.9959337, -1.05997, 1, 1, 1, 1, 1,
-0.296849, -1.316155, -3.057786, 1, 1, 1, 1, 1,
-0.2957433, -1.407988, -3.326499, 1, 1, 1, 1, 1,
-0.2936356, -1.548845, -4.666247, 1, 1, 1, 1, 1,
-0.2917502, 0.9518815, 0.212814, 1, 1, 1, 1, 1,
-0.290686, -0.1115004, -0.9021479, 1, 1, 1, 1, 1,
-0.28471, 1.191184, -0.5545132, 1, 1, 1, 1, 1,
-0.2830187, 2.103945, -1.201441, 1, 1, 1, 1, 1,
-0.280438, 1.038156, -0.03278934, 1, 1, 1, 1, 1,
-0.2797332, 0.3075246, -1.424019, 1, 1, 1, 1, 1,
-0.278201, 0.1318966, -1.928349, 0, 0, 1, 1, 1,
-0.277697, 0.6562544, -0.01194075, 1, 0, 0, 1, 1,
-0.2774999, -1.166345, -4.022861, 1, 0, 0, 1, 1,
-0.2742617, 0.3813159, 1.597911, 1, 0, 0, 1, 1,
-0.269503, -0.4006837, -2.902826, 1, 0, 0, 1, 1,
-0.2670682, -0.5563247, -1.81644, 1, 0, 0, 1, 1,
-0.2628151, -1.85683, -2.365084, 0, 0, 0, 1, 1,
-0.2610798, 1.020098, 0.7222131, 0, 0, 0, 1, 1,
-0.2584412, -1.255015, -3.868724, 0, 0, 0, 1, 1,
-0.2579599, -0.6238791, -1.681494, 0, 0, 0, 1, 1,
-0.2567508, -0.8293086, -3.94431, 0, 0, 0, 1, 1,
-0.254932, 0.2600161, -2.960353, 0, 0, 0, 1, 1,
-0.2468588, -0.4059387, -4.419323, 0, 0, 0, 1, 1,
-0.2455898, -1.575433, -4.521076, 1, 1, 1, 1, 1,
-0.2454726, 0.76237, 1.65994, 1, 1, 1, 1, 1,
-0.2422164, -0.05557425, -1.578732, 1, 1, 1, 1, 1,
-0.2377135, -0.4764208, -2.31532, 1, 1, 1, 1, 1,
-0.2371883, -0.5696281, -0.6725242, 1, 1, 1, 1, 1,
-0.2366771, 0.27587, -1.718198, 1, 1, 1, 1, 1,
-0.2359735, 1.417299, 0.96968, 1, 1, 1, 1, 1,
-0.2338716, -1.146581, -2.041622, 1, 1, 1, 1, 1,
-0.233302, -1.08287, -2.180347, 1, 1, 1, 1, 1,
-0.2321186, 0.4878517, -1.704475, 1, 1, 1, 1, 1,
-0.2314151, 0.2781051, -0.6945565, 1, 1, 1, 1, 1,
-0.2289056, 0.9639298, 0.975334, 1, 1, 1, 1, 1,
-0.2252539, 1.640473, -0.8035442, 1, 1, 1, 1, 1,
-0.2239039, 0.1248471, -0.9308236, 1, 1, 1, 1, 1,
-0.2135072, -0.4875697, -4.168552, 1, 1, 1, 1, 1,
-0.2107479, 0.09386675, -2.477876, 0, 0, 1, 1, 1,
-0.2084072, -1.206874, -1.375126, 1, 0, 0, 1, 1,
-0.2081444, 0.557587, 0.2804036, 1, 0, 0, 1, 1,
-0.2063367, 0.6920422, 1.853483, 1, 0, 0, 1, 1,
-0.2045913, -1.008401, -2.619774, 1, 0, 0, 1, 1,
-0.2042802, -1.168176, -3.45753, 1, 0, 0, 1, 1,
-0.2039555, 0.4935516, -1.528503, 0, 0, 0, 1, 1,
-0.2033615, 0.2908602, -1.359155, 0, 0, 0, 1, 1,
-0.1928671, 0.30579, 1.045669, 0, 0, 0, 1, 1,
-0.1925063, 1.382744, -1.022838, 0, 0, 0, 1, 1,
-0.1921736, 1.458069, 0.4958401, 0, 0, 0, 1, 1,
-0.189004, 1.156688, -1.367702, 0, 0, 0, 1, 1,
-0.1855667, 1.352902, -0.1531879, 0, 0, 0, 1, 1,
-0.1794038, -0.09271317, -2.436598, 1, 1, 1, 1, 1,
-0.1785896, -1.015573, -1.925588, 1, 1, 1, 1, 1,
-0.1696868, 0.05369702, -1.392098, 1, 1, 1, 1, 1,
-0.1682368, 1.494993, -0.6998168, 1, 1, 1, 1, 1,
-0.1556413, -2.379555, -2.552903, 1, 1, 1, 1, 1,
-0.1545049, 0.8864413, -1.783567, 1, 1, 1, 1, 1,
-0.1537102, -0.96329, -3.451788, 1, 1, 1, 1, 1,
-0.1526139, 0.1803893, -1.373358, 1, 1, 1, 1, 1,
-0.1489469, 1.12749, 1.705735, 1, 1, 1, 1, 1,
-0.1485355, -0.09826499, -0.6278824, 1, 1, 1, 1, 1,
-0.1415255, 0.4365267, -1.110321, 1, 1, 1, 1, 1,
-0.1381904, 0.1151301, 0.2145875, 1, 1, 1, 1, 1,
-0.1331845, 0.2112249, 0.1710161, 1, 1, 1, 1, 1,
-0.1324242, -0.1660782, -4.394748, 1, 1, 1, 1, 1,
-0.1262884, 0.8247964, -0.8096933, 1, 1, 1, 1, 1,
-0.1250896, -2.33694, -2.414922, 0, 0, 1, 1, 1,
-0.1162587, -0.06198483, -1.053967, 1, 0, 0, 1, 1,
-0.114046, -0.3269306, -2.616199, 1, 0, 0, 1, 1,
-0.1112978, -1.212105, -3.620895, 1, 0, 0, 1, 1,
-0.1109202, 1.497884, -0.722976, 1, 0, 0, 1, 1,
-0.1088565, -2.896551, -4.203559, 1, 0, 0, 1, 1,
-0.1050971, -0.001560421, -1.568032, 0, 0, 0, 1, 1,
-0.09985576, 0.1300299, -1.450629, 0, 0, 0, 1, 1,
-0.09961742, -1.146317, -2.371693, 0, 0, 0, 1, 1,
-0.0990833, 2.010825, -1.992922, 0, 0, 0, 1, 1,
-0.0988321, -0.3022358, -2.738465, 0, 0, 0, 1, 1,
-0.09804358, -0.5645322, -4.51589, 0, 0, 0, 1, 1,
-0.09051677, 1.082043, -0.02318445, 0, 0, 0, 1, 1,
-0.08757706, -0.1099897, -1.065444, 1, 1, 1, 1, 1,
-0.08740606, -0.1990214, -3.382566, 1, 1, 1, 1, 1,
-0.08037046, 0.6159674, -0.6474298, 1, 1, 1, 1, 1,
-0.07952581, -0.146269, -2.352801, 1, 1, 1, 1, 1,
-0.07343172, -0.1926937, -3.071941, 1, 1, 1, 1, 1,
-0.07082807, -0.5694495, -3.279294, 1, 1, 1, 1, 1,
-0.07075095, -0.437585, -4.19968, 1, 1, 1, 1, 1,
-0.06521486, -0.9736492, -2.43712, 1, 1, 1, 1, 1,
-0.06421629, 1.344943, 0.1566862, 1, 1, 1, 1, 1,
-0.06374387, 0.02151502, -0.4830969, 1, 1, 1, 1, 1,
-0.05650317, -0.2705452, -2.223923, 1, 1, 1, 1, 1,
-0.05477188, 0.8158286, -0.4948201, 1, 1, 1, 1, 1,
-0.05423937, 0.1298182, -1.005188, 1, 1, 1, 1, 1,
-0.05266106, -0.07172772, -2.980032, 1, 1, 1, 1, 1,
-0.05224277, -1.311187, -3.761101, 1, 1, 1, 1, 1,
-0.04803639, -0.04607444, -2.060638, 0, 0, 1, 1, 1,
-0.04677214, 0.09725531, 0.08168826, 1, 0, 0, 1, 1,
-0.04542509, 0.3238984, 0.2168387, 1, 0, 0, 1, 1,
-0.04530458, -1.179422, -4.3647, 1, 0, 0, 1, 1,
-0.04403457, 0.9052427, 0.5449458, 1, 0, 0, 1, 1,
-0.04401072, -0.2553726, -1.550537, 1, 0, 0, 1, 1,
-0.04094228, -1.278121, -2.062996, 0, 0, 0, 1, 1,
-0.03928395, -0.8455667, -1.876191, 0, 0, 0, 1, 1,
-0.03514872, -1.782271, -4.245107, 0, 0, 0, 1, 1,
-0.0332568, -0.5825357, -1.079983, 0, 0, 0, 1, 1,
-0.02606465, 1.808857, 0.4327904, 0, 0, 0, 1, 1,
-0.02104917, -0.573502, -2.831396, 0, 0, 0, 1, 1,
-0.01811839, 0.5255673, -0.1214451, 0, 0, 0, 1, 1,
-0.01666892, 0.03965199, -0.5396618, 1, 1, 1, 1, 1,
-0.01356346, -0.7569747, -2.374068, 1, 1, 1, 1, 1,
-0.01182554, -1.701284, -3.098213, 1, 1, 1, 1, 1,
-0.01025805, 0.7423171, -0.4799726, 1, 1, 1, 1, 1,
-0.01018468, 0.7675742, 1.535456, 1, 1, 1, 1, 1,
0.00225211, 0.7284254, 0.2887569, 1, 1, 1, 1, 1,
0.007411219, 0.4101748, 0.7794781, 1, 1, 1, 1, 1,
0.008024508, -1.935926, 3.642045, 1, 1, 1, 1, 1,
0.008792466, 0.3998616, 0.3973293, 1, 1, 1, 1, 1,
0.009710582, -0.8467659, 3.795326, 1, 1, 1, 1, 1,
0.01170986, -0.9841585, 1.822033, 1, 1, 1, 1, 1,
0.01507369, 0.3024173, -1.612139, 1, 1, 1, 1, 1,
0.01571267, -0.4775068, 3.598558, 1, 1, 1, 1, 1,
0.01712112, 0.08639304, -0.9114881, 1, 1, 1, 1, 1,
0.01906, -0.5353743, 3.029593, 1, 1, 1, 1, 1,
0.02739082, -1.474975, 3.761348, 0, 0, 1, 1, 1,
0.03454322, 0.2553651, -0.4895388, 1, 0, 0, 1, 1,
0.03694945, -0.237533, 2.991824, 1, 0, 0, 1, 1,
0.03941157, -0.2698257, 2.25388, 1, 0, 0, 1, 1,
0.05257292, 0.1138849, -0.4217452, 1, 0, 0, 1, 1,
0.05434558, 0.5304667, 1.155395, 1, 0, 0, 1, 1,
0.05523319, -0.08788002, 2.415725, 0, 0, 0, 1, 1,
0.05587745, -1.185024, 2.975564, 0, 0, 0, 1, 1,
0.05595053, 0.5519025, -0.4959258, 0, 0, 0, 1, 1,
0.0586972, 1.49445, -0.4535939, 0, 0, 0, 1, 1,
0.05873633, 1.180924, 0.04647493, 0, 0, 0, 1, 1,
0.05951344, -0.3096576, 1.834821, 0, 0, 0, 1, 1,
0.06112791, 1.904409, 0.9663278, 0, 0, 0, 1, 1,
0.0655743, 0.6631244, -1.355861, 1, 1, 1, 1, 1,
0.07211011, -2.017195, 3.067775, 1, 1, 1, 1, 1,
0.07403823, 0.339166, 0.6043488, 1, 1, 1, 1, 1,
0.07621935, -0.6772504, 2.605018, 1, 1, 1, 1, 1,
0.08013534, 1.405479, -0.1218168, 1, 1, 1, 1, 1,
0.08426304, -1.140723, 2.884299, 1, 1, 1, 1, 1,
0.0852503, -0.1478543, 4.28037, 1, 1, 1, 1, 1,
0.08566929, -0.8485054, 5.066259, 1, 1, 1, 1, 1,
0.08593449, -0.298361, 3.662376, 1, 1, 1, 1, 1,
0.09059675, 0.05732728, 0.4699825, 1, 1, 1, 1, 1,
0.09084219, -0.5710338, 1.766035, 1, 1, 1, 1, 1,
0.09091993, 0.5348202, 0.9972814, 1, 1, 1, 1, 1,
0.09218056, -0.6437997, 2.199741, 1, 1, 1, 1, 1,
0.0922089, -2.378207, 2.506531, 1, 1, 1, 1, 1,
0.09670002, 0.6469094, 0.1985926, 1, 1, 1, 1, 1,
0.09841477, 0.7141545, 0.07291035, 0, 0, 1, 1, 1,
0.0987583, -1.005273, 2.570319, 1, 0, 0, 1, 1,
0.1019991, -2.422529, 3.265182, 1, 0, 0, 1, 1,
0.1089145, 0.8026223, 1.432107, 1, 0, 0, 1, 1,
0.1173964, -0.7170033, 3.434929, 1, 0, 0, 1, 1,
0.1179028, 1.25602, -0.8182469, 1, 0, 0, 1, 1,
0.120729, 0.3481341, -0.2215687, 0, 0, 0, 1, 1,
0.1228767, 0.9325031, 1.053034, 0, 0, 0, 1, 1,
0.1274536, 0.7091854, 0.6856774, 0, 0, 0, 1, 1,
0.1277146, 0.4428131, -1.829024, 0, 0, 0, 1, 1,
0.1277269, 0.04136979, 2.284288, 0, 0, 0, 1, 1,
0.1278112, -2.28397, 1.857514, 0, 0, 0, 1, 1,
0.1299133, 0.7330394, -0.7600257, 0, 0, 0, 1, 1,
0.1320057, -0.9349566, 2.628178, 1, 1, 1, 1, 1,
0.1400791, -0.7452406, 3.205251, 1, 1, 1, 1, 1,
0.142277, 1.408346, 1.381178, 1, 1, 1, 1, 1,
0.1437472, -0.7107762, 1.251559, 1, 1, 1, 1, 1,
0.14682, -0.7060512, 3.580905, 1, 1, 1, 1, 1,
0.1478963, -0.4498487, 3.911608, 1, 1, 1, 1, 1,
0.1511558, -1.13404, 4.339515, 1, 1, 1, 1, 1,
0.1518667, 0.9972178, 0.6393859, 1, 1, 1, 1, 1,
0.1521274, 1.18527, -0.7615872, 1, 1, 1, 1, 1,
0.1549125, -0.4336532, 1.94109, 1, 1, 1, 1, 1,
0.1561469, 1.064268, 2.33811, 1, 1, 1, 1, 1,
0.1624142, -0.03183677, 3.151915, 1, 1, 1, 1, 1,
0.1634538, 0.05958163, 3.119999, 1, 1, 1, 1, 1,
0.1635479, 0.5915831, 0.3423826, 1, 1, 1, 1, 1,
0.1648112, 2.222353, 0.7680299, 1, 1, 1, 1, 1,
0.1699117, -1.194521, 1.972212, 0, 0, 1, 1, 1,
0.1711673, -0.1496428, 2.058909, 1, 0, 0, 1, 1,
0.1750522, 0.05404925, 2.339269, 1, 0, 0, 1, 1,
0.1752821, 0.6955925, 0.002844375, 1, 0, 0, 1, 1,
0.1754358, -0.03037601, 1.807475, 1, 0, 0, 1, 1,
0.1782894, -2.325499, 4.454372, 1, 0, 0, 1, 1,
0.1796405, 0.06803114, -0.0707382, 0, 0, 0, 1, 1,
0.1847003, 0.09275852, 2.600593, 0, 0, 0, 1, 1,
0.1862291, -0.5246477, 5.428997, 0, 0, 0, 1, 1,
0.1899186, 0.8182667, 1.959015, 0, 0, 0, 1, 1,
0.1942885, -0.5814208, 2.155607, 0, 0, 0, 1, 1,
0.1943925, -1.672138, 2.062231, 0, 0, 0, 1, 1,
0.1995071, -1.667869, 3.290319, 0, 0, 0, 1, 1,
0.202268, 0.04505659, 1.506574, 1, 1, 1, 1, 1,
0.2025703, 0.02906293, 1.985382, 1, 1, 1, 1, 1,
0.2092186, 1.081474, 1.594849, 1, 1, 1, 1, 1,
0.2127126, -1.546043, 2.071344, 1, 1, 1, 1, 1,
0.2130142, -0.889237, 2.447901, 1, 1, 1, 1, 1,
0.2186457, -1.827679, 3.555251, 1, 1, 1, 1, 1,
0.2194015, -0.6416417, 3.307513, 1, 1, 1, 1, 1,
0.2200973, 0.755972, 0.04628972, 1, 1, 1, 1, 1,
0.2246475, -1.45479, 5.036215, 1, 1, 1, 1, 1,
0.2275051, 1.188688, 2.553504, 1, 1, 1, 1, 1,
0.2275762, 1.621899, 0.4988416, 1, 1, 1, 1, 1,
0.229688, -1.247818, 5.306513, 1, 1, 1, 1, 1,
0.2310236, -0.0680759, 3.506542, 1, 1, 1, 1, 1,
0.232354, -0.8191051, 4.233344, 1, 1, 1, 1, 1,
0.2437328, 0.2612624, -0.2429927, 1, 1, 1, 1, 1,
0.2438167, -1.726297, 3.498518, 0, 0, 1, 1, 1,
0.2441978, -0.4205318, 1.836844, 1, 0, 0, 1, 1,
0.2453401, -1.180035, 3.038604, 1, 0, 0, 1, 1,
0.2473334, -0.750456, 1.889439, 1, 0, 0, 1, 1,
0.2524051, 0.05513525, 1.819046, 1, 0, 0, 1, 1,
0.2573397, 1.917439, -1.455358, 1, 0, 0, 1, 1,
0.2596676, -1.118252, 3.392344, 0, 0, 0, 1, 1,
0.26003, -3.839979, 2.340502, 0, 0, 0, 1, 1,
0.2620255, -0.08528671, 1.533053, 0, 0, 0, 1, 1,
0.2683174, 0.2466955, 2.279024, 0, 0, 0, 1, 1,
0.2699644, 0.3916077, 0.9886935, 0, 0, 0, 1, 1,
0.273743, 0.3171744, 2.227483, 0, 0, 0, 1, 1,
0.2785116, -1.674345, 2.683953, 0, 0, 0, 1, 1,
0.2862533, 0.4947331, -0.1326713, 1, 1, 1, 1, 1,
0.2930577, -0.7160767, 2.420093, 1, 1, 1, 1, 1,
0.2941159, 0.4797564, -1.303904, 1, 1, 1, 1, 1,
0.2990665, 0.4991513, -0.1479027, 1, 1, 1, 1, 1,
0.3008541, 1.235612, 0.3973415, 1, 1, 1, 1, 1,
0.3055868, 1.940776, 0.9881876, 1, 1, 1, 1, 1,
0.3076911, 1.056373, 0.1304015, 1, 1, 1, 1, 1,
0.3090399, 0.1359064, 0.5611271, 1, 1, 1, 1, 1,
0.3099234, 0.1618478, 1.252098, 1, 1, 1, 1, 1,
0.3142478, 0.8432279, 0.2679449, 1, 1, 1, 1, 1,
0.3195778, -1.304513, 2.945301, 1, 1, 1, 1, 1,
0.3240512, -0.2937521, 2.67621, 1, 1, 1, 1, 1,
0.3249069, -0.8804521, 2.38796, 1, 1, 1, 1, 1,
0.3270006, 0.7178465, -1.126903, 1, 1, 1, 1, 1,
0.3273761, -0.09473316, -0.2340809, 1, 1, 1, 1, 1,
0.330087, 0.6856751, -0.1958328, 0, 0, 1, 1, 1,
0.3341977, 0.8895427, 2.345739, 1, 0, 0, 1, 1,
0.3344254, -1.288297, 4.009704, 1, 0, 0, 1, 1,
0.3403795, 0.1878105, 1.73202, 1, 0, 0, 1, 1,
0.3411389, 2.512266, 1.757983, 1, 0, 0, 1, 1,
0.3431945, 0.8979965, -0.3748108, 1, 0, 0, 1, 1,
0.3452998, -0.1544902, 1.477664, 0, 0, 0, 1, 1,
0.3490565, 0.6280956, -2.813443, 0, 0, 0, 1, 1,
0.3532416, -0.1153244, 1.006067, 0, 0, 0, 1, 1,
0.3548238, -0.7340997, 4.516569, 0, 0, 0, 1, 1,
0.3558015, -0.04995942, 0.6486275, 0, 0, 0, 1, 1,
0.3562247, -0.6767495, 2.773554, 0, 0, 0, 1, 1,
0.3571762, -0.7937224, 0.4684524, 0, 0, 0, 1, 1,
0.357712, -0.1147451, 1.849835, 1, 1, 1, 1, 1,
0.3606077, -1.08575, 4.190352, 1, 1, 1, 1, 1,
0.3640238, -0.8342745, 1.139169, 1, 1, 1, 1, 1,
0.3652016, -0.3572334, 1.654586, 1, 1, 1, 1, 1,
0.3657861, -1.171088, 2.933622, 1, 1, 1, 1, 1,
0.3665964, 1.124597, -1.015635, 1, 1, 1, 1, 1,
0.3682959, 0.1909032, 0.0441464, 1, 1, 1, 1, 1,
0.3708782, 0.3404011, 0.9440387, 1, 1, 1, 1, 1,
0.3708843, 0.37147, -0.1825239, 1, 1, 1, 1, 1,
0.372998, 0.4758095, 0.3970223, 1, 1, 1, 1, 1,
0.3731835, -0.3748855, 1.66089, 1, 1, 1, 1, 1,
0.3746578, -0.09433533, 2.600368, 1, 1, 1, 1, 1,
0.3795545, -0.1570501, 3.006073, 1, 1, 1, 1, 1,
0.3817871, 0.132624, 1.528629, 1, 1, 1, 1, 1,
0.3877864, -0.5008836, 1.57159, 1, 1, 1, 1, 1,
0.3926022, 0.9850116, -0.3813223, 0, 0, 1, 1, 1,
0.392985, -1.853734, 1.285247, 1, 0, 0, 1, 1,
0.3959067, 0.567383, -0.9027097, 1, 0, 0, 1, 1,
0.4045494, -0.07463746, 2.95515, 1, 0, 0, 1, 1,
0.4054987, -0.365151, 3.989501, 1, 0, 0, 1, 1,
0.4086909, 0.9266694, 1.820439, 1, 0, 0, 1, 1,
0.42238, -0.7928271, 2.226584, 0, 0, 0, 1, 1,
0.4226452, -1.373674, 2.555613, 0, 0, 0, 1, 1,
0.4266054, -1.253437, 3.371119, 0, 0, 0, 1, 1,
0.4272924, 0.9874338, 0.8848944, 0, 0, 0, 1, 1,
0.4273146, -0.06590727, 0.5386122, 0, 0, 0, 1, 1,
0.4278732, 1.160105, 0.8931038, 0, 0, 0, 1, 1,
0.4294707, 2.169644, -0.3202664, 0, 0, 0, 1, 1,
0.4305355, 0.3376351, 0.5581365, 1, 1, 1, 1, 1,
0.4318864, 0.8334038, 0.5265193, 1, 1, 1, 1, 1,
0.4329569, 1.635585, 0.1433512, 1, 1, 1, 1, 1,
0.4331151, 0.6481, 1.050837, 1, 1, 1, 1, 1,
0.4358049, 1.129412, 0.6265327, 1, 1, 1, 1, 1,
0.4413571, -1.192111, 2.513696, 1, 1, 1, 1, 1,
0.4413969, -0.2891944, 1.784891, 1, 1, 1, 1, 1,
0.4471571, 0.05533418, 0.2816415, 1, 1, 1, 1, 1,
0.4576451, -0.1639746, 0.9982355, 1, 1, 1, 1, 1,
0.4640007, 1.625311, -0.8238383, 1, 1, 1, 1, 1,
0.4646945, 0.3039206, 0.5896578, 1, 1, 1, 1, 1,
0.4691491, 0.5116898, 0.3742276, 1, 1, 1, 1, 1,
0.469786, 0.3721614, 1.166553, 1, 1, 1, 1, 1,
0.4710076, -0.8615167, 4.544393, 1, 1, 1, 1, 1,
0.4713243, -0.2637546, 1.312182, 1, 1, 1, 1, 1,
0.4807188, -2.359704, 3.147171, 0, 0, 1, 1, 1,
0.4817193, -1.621597, 2.331611, 1, 0, 0, 1, 1,
0.4838253, -0.3013694, 2.521897, 1, 0, 0, 1, 1,
0.4863491, -0.4524274, 0.572048, 1, 0, 0, 1, 1,
0.4887939, 0.7196303, -0.1714114, 1, 0, 0, 1, 1,
0.4898473, -1.301971, 3.280637, 1, 0, 0, 1, 1,
0.4939444, -0.4559525, 3.021393, 0, 0, 0, 1, 1,
0.4996027, 1.245619, 2.034208, 0, 0, 0, 1, 1,
0.503387, 1.948222, -0.224468, 0, 0, 0, 1, 1,
0.5039667, -0.2622752, 1.890776, 0, 0, 0, 1, 1,
0.5109221, -0.0218908, 1.207953, 0, 0, 0, 1, 1,
0.5160781, -0.1165549, 3.035522, 0, 0, 0, 1, 1,
0.5164509, -0.3620631, 2.228804, 0, 0, 0, 1, 1,
0.5185837, -1.465121, 3.962328, 1, 1, 1, 1, 1,
0.5235036, 1.497932, -0.2003874, 1, 1, 1, 1, 1,
0.5261325, -0.7803605, 3.588803, 1, 1, 1, 1, 1,
0.5349633, -0.7634858, 1.808261, 1, 1, 1, 1, 1,
0.5366204, 0.523517, 1.739726, 1, 1, 1, 1, 1,
0.5370914, 1.047553, 0.103975, 1, 1, 1, 1, 1,
0.5399662, -1.072229, 3.803003, 1, 1, 1, 1, 1,
0.5408491, 0.07386046, 0.2254161, 1, 1, 1, 1, 1,
0.5409002, 0.477853, -1.351182, 1, 1, 1, 1, 1,
0.5439955, 1.955269, 1.425833, 1, 1, 1, 1, 1,
0.5455796, 1.762584, 1.962227, 1, 1, 1, 1, 1,
0.5463313, 0.3037854, 1.703246, 1, 1, 1, 1, 1,
0.5475875, 0.7046143, 0.9361379, 1, 1, 1, 1, 1,
0.5515891, 0.5324466, 2.116257, 1, 1, 1, 1, 1,
0.5521547, 0.4199254, 1.421055, 1, 1, 1, 1, 1,
0.552716, 1.305037, -0.6937765, 0, 0, 1, 1, 1,
0.5567777, -0.1985423, 2.938374, 1, 0, 0, 1, 1,
0.5584438, -0.6917998, 3.294137, 1, 0, 0, 1, 1,
0.5589507, 0.2942153, 0.06356547, 1, 0, 0, 1, 1,
0.5598496, 0.4913978, 2.591327, 1, 0, 0, 1, 1,
0.5644494, 0.7319894, 1.069221, 1, 0, 0, 1, 1,
0.5648445, 0.2788131, 2.563348, 0, 0, 0, 1, 1,
0.5651109, 1.911602, 0.1938479, 0, 0, 0, 1, 1,
0.5657371, -0.8762179, 3.403353, 0, 0, 0, 1, 1,
0.5680711, -0.9671121, 2.234776, 0, 0, 0, 1, 1,
0.5690703, -0.2142766, 0.5187194, 0, 0, 0, 1, 1,
0.5722335, -0.05631489, 1.364751, 0, 0, 0, 1, 1,
0.5732639, -1.092106, 2.978492, 0, 0, 0, 1, 1,
0.5794332, -0.3520547, 1.231585, 1, 1, 1, 1, 1,
0.5828941, 0.5191386, 1.579533, 1, 1, 1, 1, 1,
0.5896476, -0.4061073, 2.208333, 1, 1, 1, 1, 1,
0.5919217, -0.2817182, 0.454265, 1, 1, 1, 1, 1,
0.6068893, 0.4249927, 2.059188, 1, 1, 1, 1, 1,
0.6083341, -2.879853, 4.145891, 1, 1, 1, 1, 1,
0.6118413, -1.892814, 2.349974, 1, 1, 1, 1, 1,
0.6134722, 0.4757548, 2.252586, 1, 1, 1, 1, 1,
0.6144145, -0.2443848, 1.063187, 1, 1, 1, 1, 1,
0.6193995, 0.1208778, 0.2865222, 1, 1, 1, 1, 1,
0.6223105, 0.6221462, 1.56382, 1, 1, 1, 1, 1,
0.6225618, -0.9292253, 3.732739, 1, 1, 1, 1, 1,
0.6229766, 0.7531514, 2.429602, 1, 1, 1, 1, 1,
0.6253557, -0.755221, 0.2294103, 1, 1, 1, 1, 1,
0.6335753, -0.2129689, 0.984331, 1, 1, 1, 1, 1,
0.633756, 0.8520932, 1.098276, 0, 0, 1, 1, 1,
0.6364286, -0.5449775, 1.907247, 1, 0, 0, 1, 1,
0.6376576, -0.2106416, 1.566089, 1, 0, 0, 1, 1,
0.6394925, 0.1774752, 1.55685, 1, 0, 0, 1, 1,
0.6403327, 0.3991106, 2.711397, 1, 0, 0, 1, 1,
0.6423831, 0.3837503, 1.401674, 1, 0, 0, 1, 1,
0.6443188, -0.06829824, 2.643528, 0, 0, 0, 1, 1,
0.6457674, -0.1844596, 0.9878752, 0, 0, 0, 1, 1,
0.6471913, 1.004355, 0.08595318, 0, 0, 0, 1, 1,
0.6479864, 0.6504474, 1.485023, 0, 0, 0, 1, 1,
0.6493979, -0.2680803, 2.472428, 0, 0, 0, 1, 1,
0.6529073, -0.2708004, 2.180074, 0, 0, 0, 1, 1,
0.653437, -2.488507, 3.315882, 0, 0, 0, 1, 1,
0.6573311, 1.134301, 0.318937, 1, 1, 1, 1, 1,
0.6663742, -0.3252175, 2.076842, 1, 1, 1, 1, 1,
0.6724586, -0.9994905, 1.278611, 1, 1, 1, 1, 1,
0.673233, 1.479255, -0.5713073, 1, 1, 1, 1, 1,
0.6753327, -0.4381945, 2.779473, 1, 1, 1, 1, 1,
0.6773153, -0.4608236, 2.377517, 1, 1, 1, 1, 1,
0.6824259, 0.7829406, -0.464323, 1, 1, 1, 1, 1,
0.6856124, -0.4519562, 3.462815, 1, 1, 1, 1, 1,
0.6923828, 1.319588, 0.5730844, 1, 1, 1, 1, 1,
0.6957939, 0.3002141, 2.709841, 1, 1, 1, 1, 1,
0.6969978, 1.034918, -0.4155622, 1, 1, 1, 1, 1,
0.6978292, -0.7109507, 2.265446, 1, 1, 1, 1, 1,
0.7049072, 1.328123, 0.6538984, 1, 1, 1, 1, 1,
0.710623, -0.3096606, 3.14347, 1, 1, 1, 1, 1,
0.7134297, -0.9242034, 1.981964, 1, 1, 1, 1, 1,
0.7136043, -0.2677025, 1.538108, 0, 0, 1, 1, 1,
0.7144194, 1.306914, 0.1143121, 1, 0, 0, 1, 1,
0.7178876, -0.5055512, 1.43435, 1, 0, 0, 1, 1,
0.720406, 0.2831455, 1.1962, 1, 0, 0, 1, 1,
0.7276871, -0.3844785, 1.002592, 1, 0, 0, 1, 1,
0.7288861, -0.9897743, 3.667375, 1, 0, 0, 1, 1,
0.7289045, -0.8842862, 1.705, 0, 0, 0, 1, 1,
0.729582, -0.2340174, 1.965072, 0, 0, 0, 1, 1,
0.7308164, 0.491912, -0.6389889, 0, 0, 0, 1, 1,
0.7388608, 0.8103791, 1.237804, 0, 0, 0, 1, 1,
0.73993, -0.1632231, 1.0734, 0, 0, 0, 1, 1,
0.7462201, 0.4055432, 1.005896, 0, 0, 0, 1, 1,
0.7486073, 2.509799, -0.3094319, 0, 0, 0, 1, 1,
0.751315, -0.476741, 2.63277, 1, 1, 1, 1, 1,
0.7520441, 1.666013, 1.606874, 1, 1, 1, 1, 1,
0.7545479, -0.8960076, 1.053137, 1, 1, 1, 1, 1,
0.7629787, -1.300247, 2.820119, 1, 1, 1, 1, 1,
0.7640338, -0.09428895, 3.508769, 1, 1, 1, 1, 1,
0.7696072, -0.5055439, 1.698288, 1, 1, 1, 1, 1,
0.7716188, -2.011209, 2.832849, 1, 1, 1, 1, 1,
0.7744424, -1.028573, 3.122057, 1, 1, 1, 1, 1,
0.7785498, 0.8061931, 1.09232, 1, 1, 1, 1, 1,
0.7852097, -1.387036, 4.493285, 1, 1, 1, 1, 1,
0.7883172, 0.08601516, 3.176151, 1, 1, 1, 1, 1,
0.7954398, -0.7388002, 3.405668, 1, 1, 1, 1, 1,
0.7964999, -1.832345, 0.8365517, 1, 1, 1, 1, 1,
0.8016543, -0.3953137, 2.6997, 1, 1, 1, 1, 1,
0.8021927, -1.058624, 3.079159, 1, 1, 1, 1, 1,
0.8071207, -1.413372, 2.476536, 0, 0, 1, 1, 1,
0.8081516, -0.7112495, 2.478575, 1, 0, 0, 1, 1,
0.8147424, 0.9577801, 1.25218, 1, 0, 0, 1, 1,
0.8172076, -1.531732, 1.573479, 1, 0, 0, 1, 1,
0.8185174, 1.035645, -0.09825702, 1, 0, 0, 1, 1,
0.8230235, -0.1956717, 2.678387, 1, 0, 0, 1, 1,
0.8312198, 1.969561, 0.2712349, 0, 0, 0, 1, 1,
0.8325807, 0.03047383, -0.2009434, 0, 0, 0, 1, 1,
0.8354609, 1.037172, 0.2315159, 0, 0, 0, 1, 1,
0.8435675, -1.027797, 2.144306, 0, 0, 0, 1, 1,
0.8448321, -0.7171386, 2.149625, 0, 0, 0, 1, 1,
0.8500559, -2.750379, 2.898486, 0, 0, 0, 1, 1,
0.8520901, 1.383161, -1.687073, 0, 0, 0, 1, 1,
0.8537405, -0.2438703, 1.949777, 1, 1, 1, 1, 1,
0.854166, 0.5831175, -0.2871033, 1, 1, 1, 1, 1,
0.8547572, -0.3161907, 1.257177, 1, 1, 1, 1, 1,
0.8554027, -0.2327684, 2.041043, 1, 1, 1, 1, 1,
0.8595647, -0.04587356, -0.552434, 1, 1, 1, 1, 1,
0.8647391, -0.4809984, 2.210515, 1, 1, 1, 1, 1,
0.8679616, -0.5197241, 2.53581, 1, 1, 1, 1, 1,
0.8686982, 0.2515716, 2.57177, 1, 1, 1, 1, 1,
0.8690585, 0.7160187, -0.5362611, 1, 1, 1, 1, 1,
0.8720677, -0.04598727, 1.387118, 1, 1, 1, 1, 1,
0.8731044, 1.130381, -0.9757869, 1, 1, 1, 1, 1,
0.8776044, 0.5149778, 1.979453, 1, 1, 1, 1, 1,
0.8776384, 0.5494846, 1.565, 1, 1, 1, 1, 1,
0.8847641, 0.6024612, 2.587994, 1, 1, 1, 1, 1,
0.8940721, -0.9714825, 1.843716, 1, 1, 1, 1, 1,
0.9016684, -0.379133, 1.82676, 0, 0, 1, 1, 1,
0.9019176, -2.23167, 2.751228, 1, 0, 0, 1, 1,
0.9020464, -0.3025418, 1.597142, 1, 0, 0, 1, 1,
0.9059403, 0.4815539, -1.04213, 1, 0, 0, 1, 1,
0.9085007, -0.1781585, 1.62314, 1, 0, 0, 1, 1,
0.9120125, 1.281774, 0.4264997, 1, 0, 0, 1, 1,
0.9167498, -1.945842, 1.319594, 0, 0, 0, 1, 1,
0.9200273, -0.8368138, 1.777274, 0, 0, 0, 1, 1,
0.9248674, -0.8874193, 3.808389, 0, 0, 0, 1, 1,
0.9377685, 0.1841937, 1.866917, 0, 0, 0, 1, 1,
0.94368, 1.893031, 1.551256, 0, 0, 0, 1, 1,
0.9445328, 0.0277562, 1.940484, 0, 0, 0, 1, 1,
0.949312, 0.259959, 1.465389, 0, 0, 0, 1, 1,
0.9507785, 2.435286, 0.2254568, 1, 1, 1, 1, 1,
0.9556089, -0.3349262, 0.8691761, 1, 1, 1, 1, 1,
0.955775, -1.516782, 2.994961, 1, 1, 1, 1, 1,
0.9578667, -0.5430538, 2.357784, 1, 1, 1, 1, 1,
0.9644741, 0.1829051, 3.178512, 1, 1, 1, 1, 1,
0.9701508, 1.179606, 0.3587366, 1, 1, 1, 1, 1,
0.9737552, -0.3876729, 0.4575665, 1, 1, 1, 1, 1,
0.9750002, -1.454762, 1.725068, 1, 1, 1, 1, 1,
0.9792101, -1.331534, 4.501347, 1, 1, 1, 1, 1,
0.9871892, -0.54216, 0.5889726, 1, 1, 1, 1, 1,
0.9907601, -2.419866, 2.06649, 1, 1, 1, 1, 1,
1.005866, -0.5255334, 2.185687, 1, 1, 1, 1, 1,
1.00983, 0.3718552, -0.1326483, 1, 1, 1, 1, 1,
1.010631, 0.5592803, -0.5106947, 1, 1, 1, 1, 1,
1.018148, -1.455763, 2.906798, 1, 1, 1, 1, 1,
1.033022, -0.2379389, 1.944094, 0, 0, 1, 1, 1,
1.033977, -0.2704795, 0.4532517, 1, 0, 0, 1, 1,
1.046725, 0.4052224, 1.508988, 1, 0, 0, 1, 1,
1.049332, 0.3865739, 0.1797606, 1, 0, 0, 1, 1,
1.055533, 0.006033002, 1.728414, 1, 0, 0, 1, 1,
1.061786, -0.8563491, 2.863462, 1, 0, 0, 1, 1,
1.066221, 0.917392, 1.178887, 0, 0, 0, 1, 1,
1.077377, 0.5025992, 1.421026, 0, 0, 0, 1, 1,
1.079156, 0.4902296, 0.03822696, 0, 0, 0, 1, 1,
1.084256, -0.668485, 1.72763, 0, 0, 0, 1, 1,
1.084532, -1.773115, 2.214226, 0, 0, 0, 1, 1,
1.085362, -1.027766, 2.740592, 0, 0, 0, 1, 1,
1.085377, 0.3044725, 0.09647108, 0, 0, 0, 1, 1,
1.091762, -0.2935071, 0.8766362, 1, 1, 1, 1, 1,
1.093525, 0.6589019, 0.5183252, 1, 1, 1, 1, 1,
1.096569, 1.304307, -0.4575557, 1, 1, 1, 1, 1,
1.09848, 1.369984, 1.332781, 1, 1, 1, 1, 1,
1.099487, 0.2655, 1.250197, 1, 1, 1, 1, 1,
1.112316, 1.243645, 0.7492374, 1, 1, 1, 1, 1,
1.119278, -1.178983, 2.739342, 1, 1, 1, 1, 1,
1.131508, -0.5649118, 3.663902, 1, 1, 1, 1, 1,
1.135037, -1.796855, 2.8607, 1, 1, 1, 1, 1,
1.139011, 0.6222218, 1.309754, 1, 1, 1, 1, 1,
1.14072, -2.382918, 2.641084, 1, 1, 1, 1, 1,
1.155009, -0.3243684, 1.835628, 1, 1, 1, 1, 1,
1.156058, -0.7784864, 2.515599, 1, 1, 1, 1, 1,
1.15931, -1.135818, 1.236888, 1, 1, 1, 1, 1,
1.163687, 1.808026, 0.6773716, 1, 1, 1, 1, 1,
1.170344, -0.6366506, 2.866303, 0, 0, 1, 1, 1,
1.171627, -0.2114819, 0.9001989, 1, 0, 0, 1, 1,
1.173323, 0.05863579, 2.46956, 1, 0, 0, 1, 1,
1.178653, -0.6243995, 1.958734, 1, 0, 0, 1, 1,
1.183992, 0.007477129, 2.43251, 1, 0, 0, 1, 1,
1.184973, 0.5197504, 1.860725, 1, 0, 0, 1, 1,
1.188713, 0.3926216, 2.305413, 0, 0, 0, 1, 1,
1.190529, -1.231383, 2.633518, 0, 0, 0, 1, 1,
1.198379, -0.4378594, 3.101778, 0, 0, 0, 1, 1,
1.200451, -0.1972848, 0.9253609, 0, 0, 0, 1, 1,
1.202211, -1.679359, 3.13352, 0, 0, 0, 1, 1,
1.21634, 0.9233553, 0.6123987, 0, 0, 0, 1, 1,
1.219708, -1.410017, 2.493218, 0, 0, 0, 1, 1,
1.224063, -0.0414992, 2.688709, 1, 1, 1, 1, 1,
1.224431, -2.209909, 1.340827, 1, 1, 1, 1, 1,
1.225675, 0.654775, 3.427269, 1, 1, 1, 1, 1,
1.230144, 0.4498487, 0.5847692, 1, 1, 1, 1, 1,
1.232636, 1.519259, 1.073968, 1, 1, 1, 1, 1,
1.23665, 0.3196161, 1.727367, 1, 1, 1, 1, 1,
1.240819, -0.8893859, 4.07545, 1, 1, 1, 1, 1,
1.24925, 0.6093165, 0.9445426, 1, 1, 1, 1, 1,
1.250665, -0.6535611, 1.878624, 1, 1, 1, 1, 1,
1.25614, -0.08624448, 1.97333, 1, 1, 1, 1, 1,
1.260246, 0.4768712, 0.7896985, 1, 1, 1, 1, 1,
1.266608, 0.360247, 2.159143, 1, 1, 1, 1, 1,
1.27083, 0.6067699, 1.427172, 1, 1, 1, 1, 1,
1.274202, 0.92005, 2.325361, 1, 1, 1, 1, 1,
1.277266, 1.029295, 0.5969983, 1, 1, 1, 1, 1,
1.292693, -1.171954, 1.687854, 0, 0, 1, 1, 1,
1.295473, -0.04706625, 0.999627, 1, 0, 0, 1, 1,
1.314055, -0.04432757, 0.1890962, 1, 0, 0, 1, 1,
1.317616, 1.622769, 1.395908, 1, 0, 0, 1, 1,
1.322862, -0.6263813, 2.310655, 1, 0, 0, 1, 1,
1.328488, 0.7782705, -0.9142537, 1, 0, 0, 1, 1,
1.328538, -0.2335196, 2.056519, 0, 0, 0, 1, 1,
1.334327, -0.7306541, 1.168744, 0, 0, 0, 1, 1,
1.336523, -1.38324, 1.957618, 0, 0, 0, 1, 1,
1.336733, -0.3630585, 2.127328, 0, 0, 0, 1, 1,
1.34309, -1.29908, 1.75437, 0, 0, 0, 1, 1,
1.348937, -1.826249, 2.481769, 0, 0, 0, 1, 1,
1.350421, -0.1562466, 2.582836, 0, 0, 0, 1, 1,
1.355251, 2.535372, 0.8739092, 1, 1, 1, 1, 1,
1.355695, -1.161443, 2.021848, 1, 1, 1, 1, 1,
1.370933, 0.6005381, -0.1750654, 1, 1, 1, 1, 1,
1.372501, -0.3250579, 1.359147, 1, 1, 1, 1, 1,
1.382274, -0.7334883, 2.51759, 1, 1, 1, 1, 1,
1.390936, -1.678291, 3.316115, 1, 1, 1, 1, 1,
1.402239, 0.3234016, 2.174008, 1, 1, 1, 1, 1,
1.40408, 1.306135, -0.1166514, 1, 1, 1, 1, 1,
1.407816, 0.4662109, 2.774598, 1, 1, 1, 1, 1,
1.408386, -0.02353354, 1.652344, 1, 1, 1, 1, 1,
1.423182, -0.6862, 2.81494, 1, 1, 1, 1, 1,
1.449893, -1.611241, 3.298939, 1, 1, 1, 1, 1,
1.454268, 0.9404983, -1.671842, 1, 1, 1, 1, 1,
1.460418, 0.5793006, 2.100406, 1, 1, 1, 1, 1,
1.478017, -0.6377339, 2.319668, 1, 1, 1, 1, 1,
1.483409, -0.7384007, 2.951427, 0, 0, 1, 1, 1,
1.496742, -0.5934467, -0.03040154, 1, 0, 0, 1, 1,
1.497663, 0.4061119, -0.3248653, 1, 0, 0, 1, 1,
1.49853, 0.051421, 1.451666, 1, 0, 0, 1, 1,
1.51202, -1.241528, 3.510784, 1, 0, 0, 1, 1,
1.512049, -0.9553294, 2.402513, 1, 0, 0, 1, 1,
1.522724, -0.04006952, 2.813831, 0, 0, 0, 1, 1,
1.5249, -0.6669915, 2.047941, 0, 0, 0, 1, 1,
1.5449, -1.429925, 1.28256, 0, 0, 0, 1, 1,
1.54577, -0.1795208, 0.5086761, 0, 0, 0, 1, 1,
1.556901, 0.1772905, 1.127402, 0, 0, 0, 1, 1,
1.562842, 0.1656793, 1.868374, 0, 0, 0, 1, 1,
1.567576, -1.020577, 3.302675, 0, 0, 0, 1, 1,
1.569331, -0.08890262, 0.788137, 1, 1, 1, 1, 1,
1.587385, 0.772949, 0.3016509, 1, 1, 1, 1, 1,
1.588183, -1.539088, 1.782325, 1, 1, 1, 1, 1,
1.608195, 1.820527, 2.2215, 1, 1, 1, 1, 1,
1.611327, -1.624839, 1.839883, 1, 1, 1, 1, 1,
1.630323, -0.3703141, 1.22824, 1, 1, 1, 1, 1,
1.641123, 0.2957239, 2.636162, 1, 1, 1, 1, 1,
1.647759, -0.238632, 2.138196, 1, 1, 1, 1, 1,
1.653074, -0.7440664, 2.587223, 1, 1, 1, 1, 1,
1.656001, -0.7809433, 2.105639, 1, 1, 1, 1, 1,
1.670401, -2.074045, 1.362047, 1, 1, 1, 1, 1,
1.671099, 1.660879, 0.7029271, 1, 1, 1, 1, 1,
1.679917, 0.6249135, 1.889249, 1, 1, 1, 1, 1,
1.683244, -0.4693183, 1.55733, 1, 1, 1, 1, 1,
1.686255, -0.05773833, 1.897345, 1, 1, 1, 1, 1,
1.690103, -2.452186, 1.543249, 0, 0, 1, 1, 1,
1.697556, -0.07510886, 1.197881, 1, 0, 0, 1, 1,
1.72144, 0.02275374, 0.7156245, 1, 0, 0, 1, 1,
1.735239, 0.5226195, 1.1824, 1, 0, 0, 1, 1,
1.741408, -0.2140639, 2.250682, 1, 0, 0, 1, 1,
1.743812, 0.4123515, 2.422304, 1, 0, 0, 1, 1,
1.745838, -1.507044, 1.658133, 0, 0, 0, 1, 1,
1.747492, 0.08354491, 0.3858205, 0, 0, 0, 1, 1,
1.747714, -1.201593, 1.957881, 0, 0, 0, 1, 1,
1.75129, 1.8302, 0.5378926, 0, 0, 0, 1, 1,
1.753232, -0.9927074, 2.164187, 0, 0, 0, 1, 1,
1.753462, 1.364934, -0.472154, 0, 0, 0, 1, 1,
1.761162, 1.162862, 2.552665, 0, 0, 0, 1, 1,
1.761789, -0.4044064, 1.907953, 1, 1, 1, 1, 1,
1.813252, -0.6355235, -0.344876, 1, 1, 1, 1, 1,
1.839352, -0.2248504, 2.60624, 1, 1, 1, 1, 1,
1.901897, 0.04882788, 1.744339, 1, 1, 1, 1, 1,
1.909067, 0.1430888, 1.269255, 1, 1, 1, 1, 1,
1.910395, 0.6265849, 3.700681, 1, 1, 1, 1, 1,
1.910748, 1.35034, 2.1902, 1, 1, 1, 1, 1,
1.915385, 0.4119896, 2.244238, 1, 1, 1, 1, 1,
1.927306, -1.257881, 4.15526, 1, 1, 1, 1, 1,
1.956769, 0.8140144, 0.3928587, 1, 1, 1, 1, 1,
1.967895, 2.00577, 0.8643755, 1, 1, 1, 1, 1,
1.973229, 1.505719, 0.6978431, 1, 1, 1, 1, 1,
2.001754, 0.047898, 0.6436626, 1, 1, 1, 1, 1,
2.001827, -0.217074, 1.180472, 1, 1, 1, 1, 1,
2.032105, 1.242458, 0.8808978, 1, 1, 1, 1, 1,
2.032583, 1.328997, 1.166598, 0, 0, 1, 1, 1,
2.055299, 0.8217263, 2.971025, 1, 0, 0, 1, 1,
2.064824, 0.2207087, 0.5788364, 1, 0, 0, 1, 1,
2.104061, -0.7107829, 1.267421, 1, 0, 0, 1, 1,
2.110517, -0.1734276, 2.008525, 1, 0, 0, 1, 1,
2.125394, -0.6766218, 2.774825, 1, 0, 0, 1, 1,
2.138792, -0.4751281, 0.5569181, 0, 0, 0, 1, 1,
2.146046, 0.6754071, 1.15743, 0, 0, 0, 1, 1,
2.159678, -1.117564, 1.286318, 0, 0, 0, 1, 1,
2.187279, -0.004347193, 1.172184, 0, 0, 0, 1, 1,
2.243524, -0.3642529, 1.383791, 0, 0, 0, 1, 1,
2.25426, 0.5114864, 2.824277, 0, 0, 0, 1, 1,
2.275887, -1.445429, 0.1472907, 0, 0, 0, 1, 1,
2.285007, -0.9928589, 1.221505, 1, 1, 1, 1, 1,
2.288547, -1.645119, 3.216708, 1, 1, 1, 1, 1,
2.398839, 0.125128, 2.136106, 1, 1, 1, 1, 1,
2.422238, 0.2236804, 2.273399, 1, 1, 1, 1, 1,
2.493398, -1.658915, 1.240356, 1, 1, 1, 1, 1,
2.553873, 0.6083079, 2.312321, 1, 1, 1, 1, 1,
2.594634, -0.2826759, 1.363826, 1, 1, 1, 1, 1
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
var radius = 9.680329;
var distance = 34.00175;
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
mvMatrix.translate( 0.1303557, 0.3550279, 0.1630383 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.00175);
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
