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
-2.838401, -1.03735, -3.355728, 1, 0, 0, 1,
-2.796892, 0.4723676, -1.374066, 1, 0.007843138, 0, 1,
-2.693894, -1.830859, -2.394313, 1, 0.01176471, 0, 1,
-2.601107, -0.216666, -1.91726, 1, 0.01960784, 0, 1,
-2.572451, 0.8213415, 1.321034, 1, 0.02352941, 0, 1,
-2.475837, -0.3716379, -1.455783, 1, 0.03137255, 0, 1,
-2.407885, -0.03902989, -1.596678, 1, 0.03529412, 0, 1,
-2.390842, 0.6742986, -2.618395, 1, 0.04313726, 0, 1,
-2.339768, 0.9452408, 1.335362, 1, 0.04705882, 0, 1,
-2.315503, -1.847758, -1.657608, 1, 0.05490196, 0, 1,
-2.280446, -0.1716165, -1.01294, 1, 0.05882353, 0, 1,
-2.273654, -0.6003957, -1.904998, 1, 0.06666667, 0, 1,
-2.266273, -0.4076736, -0.1006038, 1, 0.07058824, 0, 1,
-2.233999, 2.808394, 0.2595461, 1, 0.07843138, 0, 1,
-2.232349, -0.5499526, 0.06024712, 1, 0.08235294, 0, 1,
-2.106166, -1.365479, -2.517655, 1, 0.09019608, 0, 1,
-2.090998, -0.8874124, -3.363029, 1, 0.09411765, 0, 1,
-2.08859, 0.7398348, -0.1535351, 1, 0.1019608, 0, 1,
-2.036711, -0.04664857, -0.6113355, 1, 0.1098039, 0, 1,
-2.036343, 0.3091507, -1.010172, 1, 0.1137255, 0, 1,
-2.015642, 1.601948, 0.1081843, 1, 0.1215686, 0, 1,
-2.013816, -0.840714, -2.469306, 1, 0.1254902, 0, 1,
-2.001278, 0.2009837, -1.571193, 1, 0.1333333, 0, 1,
-1.978303, 1.30824, -0.7493517, 1, 0.1372549, 0, 1,
-1.977389, -0.7857974, -3.299237, 1, 0.145098, 0, 1,
-1.93117, 0.9932174, -3.048592, 1, 0.1490196, 0, 1,
-1.912506, 0.9700844, -2.522612, 1, 0.1568628, 0, 1,
-1.898345, -0.0490443, -1.063448, 1, 0.1607843, 0, 1,
-1.893351, 1.351462, -1.452597, 1, 0.1686275, 0, 1,
-1.892707, -1.684464, -1.982697, 1, 0.172549, 0, 1,
-1.870432, 0.05993143, -1.129378, 1, 0.1803922, 0, 1,
-1.863637, 1.201559, -2.203298, 1, 0.1843137, 0, 1,
-1.847896, 0.02638292, -1.601693, 1, 0.1921569, 0, 1,
-1.843688, 0.6122734, -2.796823, 1, 0.1960784, 0, 1,
-1.829323, -0.5388217, -1.293437, 1, 0.2039216, 0, 1,
-1.809863, 1.414464, -1.219323, 1, 0.2117647, 0, 1,
-1.8027, 0.8888032, -0.05035978, 1, 0.2156863, 0, 1,
-1.795223, -0.7153088, -2.67926, 1, 0.2235294, 0, 1,
-1.773806, 2.616134, 0.09593304, 1, 0.227451, 0, 1,
-1.772423, -1.001697, -1.028623, 1, 0.2352941, 0, 1,
-1.768901, 0.400245, -0.4682115, 1, 0.2392157, 0, 1,
-1.764565, -1.670648, -0.9989457, 1, 0.2470588, 0, 1,
-1.763948, -0.3891366, -3.122012, 1, 0.2509804, 0, 1,
-1.707224, -0.1639659, -3.683019, 1, 0.2588235, 0, 1,
-1.706328, -2.135398, -1.212607, 1, 0.2627451, 0, 1,
-1.696372, 1.475762, -0.4206383, 1, 0.2705882, 0, 1,
-1.694623, 1.470819, 0.3922193, 1, 0.2745098, 0, 1,
-1.687853, -0.1207409, -2.435627, 1, 0.282353, 0, 1,
-1.686641, 0.9334348, -3.184554, 1, 0.2862745, 0, 1,
-1.651472, -1.055008, -2.488748, 1, 0.2941177, 0, 1,
-1.642888, -0.6784806, -1.7298, 1, 0.3019608, 0, 1,
-1.639149, -0.05470321, -1.817688, 1, 0.3058824, 0, 1,
-1.628686, 0.6336896, -4.357241, 1, 0.3137255, 0, 1,
-1.622787, 0.245716, -2.308805, 1, 0.3176471, 0, 1,
-1.61019, -1.980821, -4.45419, 1, 0.3254902, 0, 1,
-1.605107, -0.7115225, -2.054122, 1, 0.3294118, 0, 1,
-1.602513, -0.3075513, -2.925314, 1, 0.3372549, 0, 1,
-1.599685, 0.6012056, -2.937703, 1, 0.3411765, 0, 1,
-1.596593, 0.3593646, 0.08337153, 1, 0.3490196, 0, 1,
-1.59417, 1.781185, -0.7924921, 1, 0.3529412, 0, 1,
-1.585315, -0.3210791, -4.005921, 1, 0.3607843, 0, 1,
-1.582146, 1.627554, 1.245636, 1, 0.3647059, 0, 1,
-1.57876, 0.7212844, -2.650229, 1, 0.372549, 0, 1,
-1.576975, -1.170633, -3.791565, 1, 0.3764706, 0, 1,
-1.572738, 0.177144, -2.019966, 1, 0.3843137, 0, 1,
-1.570111, -1.390853, -2.858257, 1, 0.3882353, 0, 1,
-1.563281, -1.623195, -1.212086, 1, 0.3960784, 0, 1,
-1.562104, -0.6671712, -4.108495, 1, 0.4039216, 0, 1,
-1.556199, 3.006746, -1.229082, 1, 0.4078431, 0, 1,
-1.515749, 1.84408, 0.05801539, 1, 0.4156863, 0, 1,
-1.508045, 1.465288, -1.765701, 1, 0.4196078, 0, 1,
-1.495731, -0.6017192, -3.150459, 1, 0.427451, 0, 1,
-1.486941, 0.9513299, 0.2443059, 1, 0.4313726, 0, 1,
-1.483849, -0.9433244, -2.660033, 1, 0.4392157, 0, 1,
-1.479483, 0.9567179, -1.245218, 1, 0.4431373, 0, 1,
-1.465996, -0.2788326, -1.869804, 1, 0.4509804, 0, 1,
-1.461672, 0.01837951, -1.464386, 1, 0.454902, 0, 1,
-1.461207, -0.03795705, -1.105582, 1, 0.4627451, 0, 1,
-1.46104, -1.107931, -2.709208, 1, 0.4666667, 0, 1,
-1.450116, 0.7807639, -1.062817, 1, 0.4745098, 0, 1,
-1.449357, 0.7702552, -1.240177, 1, 0.4784314, 0, 1,
-1.443841, -0.1571908, -1.104557, 1, 0.4862745, 0, 1,
-1.434297, 1.18746, -0.9091546, 1, 0.4901961, 0, 1,
-1.433003, -0.06547411, -1.270305, 1, 0.4980392, 0, 1,
-1.414416, 0.2501514, -2.408531, 1, 0.5058824, 0, 1,
-1.41333, 0.3660566, -0.8359081, 1, 0.509804, 0, 1,
-1.399803, 0.08003154, 0.3038585, 1, 0.5176471, 0, 1,
-1.3979, -0.5413809, -2.177583, 1, 0.5215687, 0, 1,
-1.392753, -0.4579742, -1.691608, 1, 0.5294118, 0, 1,
-1.391733, -0.412347, -2.085538, 1, 0.5333334, 0, 1,
-1.379864, 0.2169386, -2.08966, 1, 0.5411765, 0, 1,
-1.373479, -0.2881804, -2.971508, 1, 0.5450981, 0, 1,
-1.360638, 0.4030152, -3.110573, 1, 0.5529412, 0, 1,
-1.358495, 0.4893962, 0.03276993, 1, 0.5568628, 0, 1,
-1.357144, 2.03079, -2.094098, 1, 0.5647059, 0, 1,
-1.330571, -0.1643206, -1.579515, 1, 0.5686275, 0, 1,
-1.328027, -0.6444955, -0.4531307, 1, 0.5764706, 0, 1,
-1.323095, -0.5622408, -3.173014, 1, 0.5803922, 0, 1,
-1.31852, 0.8215211, -1.20381, 1, 0.5882353, 0, 1,
-1.301659, 1.033605, -0.4710886, 1, 0.5921569, 0, 1,
-1.295846, -1.154146, -2.058044, 1, 0.6, 0, 1,
-1.290999, -0.7005656, -1.931445, 1, 0.6078432, 0, 1,
-1.284244, 0.8610094, -1.338498, 1, 0.6117647, 0, 1,
-1.282929, -1.131587, -4.219238, 1, 0.6196079, 0, 1,
-1.281677, -0.1475745, -2.152113, 1, 0.6235294, 0, 1,
-1.274871, -1.916837, -3.921953, 1, 0.6313726, 0, 1,
-1.274744, 0.1751657, -0.1092894, 1, 0.6352941, 0, 1,
-1.272525, -0.00712986, -1.783903, 1, 0.6431373, 0, 1,
-1.268765, 0.4312332, -2.154602, 1, 0.6470588, 0, 1,
-1.265082, 0.1541469, -1.443008, 1, 0.654902, 0, 1,
-1.255446, 0.1430466, -2.40981, 1, 0.6588235, 0, 1,
-1.24134, -0.4778464, -2.444971, 1, 0.6666667, 0, 1,
-1.233721, -0.7463467, -1.21283, 1, 0.6705883, 0, 1,
-1.232829, -1.220247, -1.56693, 1, 0.6784314, 0, 1,
-1.229403, -0.7531195, -2.10914, 1, 0.682353, 0, 1,
-1.227133, 1.484874, -0.3910218, 1, 0.6901961, 0, 1,
-1.224729, 0.7867613, -0.1652242, 1, 0.6941177, 0, 1,
-1.218076, 0.5091695, -0.9085703, 1, 0.7019608, 0, 1,
-1.216995, -0.5834221, -2.922452, 1, 0.7098039, 0, 1,
-1.216786, 0.2795973, -0.2338839, 1, 0.7137255, 0, 1,
-1.213695, -0.4174242, -1.949266, 1, 0.7215686, 0, 1,
-1.213621, 0.6985902, 0.05303343, 1, 0.7254902, 0, 1,
-1.197785, 0.9425431, -0.159628, 1, 0.7333333, 0, 1,
-1.19733, -0.9012384, -3.76915, 1, 0.7372549, 0, 1,
-1.190965, 1.28759, 0.7214981, 1, 0.7450981, 0, 1,
-1.184834, -0.2618425, -1.77206, 1, 0.7490196, 0, 1,
-1.159518, -1.332091, -1.926322, 1, 0.7568628, 0, 1,
-1.157315, 0.4182906, -1.094961, 1, 0.7607843, 0, 1,
-1.150564, -0.1104523, -1.721339, 1, 0.7686275, 0, 1,
-1.137782, -1.207555, 0.04997619, 1, 0.772549, 0, 1,
-1.13458, -0.3598854, -0.622097, 1, 0.7803922, 0, 1,
-1.12418, -1.257133, -1.582139, 1, 0.7843137, 0, 1,
-1.12237, 1.066709, -0.2188005, 1, 0.7921569, 0, 1,
-1.11981, 1.402487, -0.5804784, 1, 0.7960784, 0, 1,
-1.119347, 0.04086722, -2.388199, 1, 0.8039216, 0, 1,
-1.11461, -1.809843, -3.099003, 1, 0.8117647, 0, 1,
-1.106809, -0.4650132, -1.937758, 1, 0.8156863, 0, 1,
-1.106119, 1.264492, -4.325076, 1, 0.8235294, 0, 1,
-1.105948, -0.2840161, -3.94885, 1, 0.827451, 0, 1,
-1.104087, 0.07576563, -3.150198, 1, 0.8352941, 0, 1,
-1.100042, -0.05989195, -4.751597, 1, 0.8392157, 0, 1,
-1.092462, 1.391472, -1.255588, 1, 0.8470588, 0, 1,
-1.092448, -1.552898, -4.901921, 1, 0.8509804, 0, 1,
-1.083665, -1.009759, -1.696877, 1, 0.8588235, 0, 1,
-1.083359, -0.3016036, -2.110366, 1, 0.8627451, 0, 1,
-1.081985, -0.1956359, -0.5247014, 1, 0.8705882, 0, 1,
-1.079943, -0.5985722, -0.3525794, 1, 0.8745098, 0, 1,
-1.071223, -1.719668, -2.81482, 1, 0.8823529, 0, 1,
-1.063042, -0.3031486, -2.460235, 1, 0.8862745, 0, 1,
-1.057062, 0.265325, -2.746305, 1, 0.8941177, 0, 1,
-1.056677, -1.131557, -1.069, 1, 0.8980392, 0, 1,
-1.05508, 0.7451494, -1.103795, 1, 0.9058824, 0, 1,
-1.052957, 0.08127155, -0.2785251, 1, 0.9137255, 0, 1,
-1.051121, -2.734325, -3.820196, 1, 0.9176471, 0, 1,
-1.047535, -0.4782197, -1.116004, 1, 0.9254902, 0, 1,
-1.046571, 0.710329, -1.311714, 1, 0.9294118, 0, 1,
-1.044422, 1.479189, 0.3566694, 1, 0.9372549, 0, 1,
-1.043329, -0.5432378, -2.366359, 1, 0.9411765, 0, 1,
-1.041897, -1.118648, -2.742802, 1, 0.9490196, 0, 1,
-1.0352, -0.247198, -4.123214, 1, 0.9529412, 0, 1,
-1.029942, -0.09652889, -1.53833, 1, 0.9607843, 0, 1,
-1.02994, 1.231589, 0.9595875, 1, 0.9647059, 0, 1,
-1.020767, -0.1938459, -1.043229, 1, 0.972549, 0, 1,
-1.020765, 0.5216321, -1.288019, 1, 0.9764706, 0, 1,
-1.01715, -0.6414253, -2.927647, 1, 0.9843137, 0, 1,
-1.016752, 1.121922, -2.378523, 1, 0.9882353, 0, 1,
-1.006628, -0.8722865, -3.003295, 1, 0.9960784, 0, 1,
-1.005254, 0.08533698, -1.491439, 0.9960784, 1, 0, 1,
-0.9971904, 0.9055084, -0.2130514, 0.9921569, 1, 0, 1,
-0.9968533, -0.4566748, -3.300684, 0.9843137, 1, 0, 1,
-0.9869952, -0.3468492, -0.9205782, 0.9803922, 1, 0, 1,
-0.9844521, -0.5794759, -2.734586, 0.972549, 1, 0, 1,
-0.9805704, 1.64744, -0.8650014, 0.9686275, 1, 0, 1,
-0.9795523, 0.860727, 0.06433437, 0.9607843, 1, 0, 1,
-0.9751507, 0.9257919, -2.330221, 0.9568627, 1, 0, 1,
-0.9730735, 1.615098, -1.469881, 0.9490196, 1, 0, 1,
-0.9703785, 0.6447842, -2.021982, 0.945098, 1, 0, 1,
-0.9613541, -0.398541, -2.122172, 0.9372549, 1, 0, 1,
-0.9592979, 0.6712484, -1.040059, 0.9333333, 1, 0, 1,
-0.958432, 2.322753, -1.325191, 0.9254902, 1, 0, 1,
-0.9477745, 1.273284, -0.6971402, 0.9215686, 1, 0, 1,
-0.9456024, -0.8430678, -3.696054, 0.9137255, 1, 0, 1,
-0.9405692, -0.0677158, 0.9375405, 0.9098039, 1, 0, 1,
-0.9359559, 1.269551, -0.1542773, 0.9019608, 1, 0, 1,
-0.9322786, 0.04211145, -1.723221, 0.8941177, 1, 0, 1,
-0.9292921, 0.3655533, -1.430848, 0.8901961, 1, 0, 1,
-0.9183812, 0.2751413, 0.312065, 0.8823529, 1, 0, 1,
-0.9137672, 0.04513755, -1.735326, 0.8784314, 1, 0, 1,
-0.9033973, 0.5033907, 0.247214, 0.8705882, 1, 0, 1,
-0.8996952, -0.8526279, -2.218985, 0.8666667, 1, 0, 1,
-0.8979798, -0.6926364, -2.586523, 0.8588235, 1, 0, 1,
-0.8978013, 1.099788, -0.9147003, 0.854902, 1, 0, 1,
-0.8976043, -0.07150597, -1.228123, 0.8470588, 1, 0, 1,
-0.8975221, 2.338835, -0.1781808, 0.8431373, 1, 0, 1,
-0.8913026, 0.1078691, -2.447109, 0.8352941, 1, 0, 1,
-0.8894799, 0.7132109, -2.106644, 0.8313726, 1, 0, 1,
-0.8777785, -0.3549717, -1.247316, 0.8235294, 1, 0, 1,
-0.8772725, -0.2869283, -1.742074, 0.8196079, 1, 0, 1,
-0.874957, 0.1754277, -0.5533654, 0.8117647, 1, 0, 1,
-0.8697143, -0.8247713, -2.436012, 0.8078431, 1, 0, 1,
-0.8613837, -0.3419066, -2.012781, 0.8, 1, 0, 1,
-0.8517066, 0.5451126, -1.081405, 0.7921569, 1, 0, 1,
-0.8495815, 0.5301915, -0.05446907, 0.7882353, 1, 0, 1,
-0.8485711, -0.6891973, -3.043806, 0.7803922, 1, 0, 1,
-0.8396741, -0.442181, -3.370202, 0.7764706, 1, 0, 1,
-0.8386378, 0.7485144, -0.4878009, 0.7686275, 1, 0, 1,
-0.836251, -1.580193, -3.79219, 0.7647059, 1, 0, 1,
-0.8350245, 1.364205, -0.2750941, 0.7568628, 1, 0, 1,
-0.8343081, 1.240751, 1.606333, 0.7529412, 1, 0, 1,
-0.8339728, -0.04750274, -0.6503146, 0.7450981, 1, 0, 1,
-0.8315483, 0.6641258, -1.494522, 0.7411765, 1, 0, 1,
-0.8279334, 0.2084642, -1.423706, 0.7333333, 1, 0, 1,
-0.8261373, -0.5494182, -1.558945, 0.7294118, 1, 0, 1,
-0.8181166, -1.11187, -2.046827, 0.7215686, 1, 0, 1,
-0.7997057, -2.031672, -3.018211, 0.7176471, 1, 0, 1,
-0.7973449, -0.002334675, -1.70976, 0.7098039, 1, 0, 1,
-0.7962699, -0.8086585, -3.88836, 0.7058824, 1, 0, 1,
-0.7919005, 0.1591484, -0.8436612, 0.6980392, 1, 0, 1,
-0.7858352, 0.2718991, -0.5503236, 0.6901961, 1, 0, 1,
-0.7739913, -0.04445074, -1.658375, 0.6862745, 1, 0, 1,
-0.7737682, -1.186846, -3.295806, 0.6784314, 1, 0, 1,
-0.7735192, -0.03735437, -2.556802, 0.6745098, 1, 0, 1,
-0.7724318, 0.04157891, -2.740124, 0.6666667, 1, 0, 1,
-0.7678435, 0.7977379, 0.4858921, 0.6627451, 1, 0, 1,
-0.7628502, 0.991769, 0.05187594, 0.654902, 1, 0, 1,
-0.7628323, 1.920667, -0.9716032, 0.6509804, 1, 0, 1,
-0.7592716, 0.3580064, -1.353567, 0.6431373, 1, 0, 1,
-0.752941, 0.9739236, -1.051761, 0.6392157, 1, 0, 1,
-0.7472391, 0.9542268, -0.9787225, 0.6313726, 1, 0, 1,
-0.7467828, -1.374399, -2.399281, 0.627451, 1, 0, 1,
-0.7449104, 0.4680979, -0.8456148, 0.6196079, 1, 0, 1,
-0.7409156, -1.178126, -1.126666, 0.6156863, 1, 0, 1,
-0.7374009, -1.697936, -3.190612, 0.6078432, 1, 0, 1,
-0.736707, -0.8112127, -3.668157, 0.6039216, 1, 0, 1,
-0.7349438, 0.4860469, -1.317587, 0.5960785, 1, 0, 1,
-0.7341844, -0.5022921, -2.682251, 0.5882353, 1, 0, 1,
-0.7318324, -0.01056596, -0.5619893, 0.5843138, 1, 0, 1,
-0.7293375, -0.4352749, -2.279161, 0.5764706, 1, 0, 1,
-0.7192799, -0.4900329, -2.471506, 0.572549, 1, 0, 1,
-0.7170762, -0.148524, -0.9732473, 0.5647059, 1, 0, 1,
-0.7157252, 1.525347, -1.108148, 0.5607843, 1, 0, 1,
-0.7137085, 0.1272324, 0.3922104, 0.5529412, 1, 0, 1,
-0.7050298, 1.262228, 0.1985988, 0.5490196, 1, 0, 1,
-0.7027627, -1.069158, -3.987963, 0.5411765, 1, 0, 1,
-0.7018822, 0.4001991, -0.9565152, 0.5372549, 1, 0, 1,
-0.7017043, -1.693637, -1.931188, 0.5294118, 1, 0, 1,
-0.7013631, -1.835445, -2.199054, 0.5254902, 1, 0, 1,
-0.697736, 2.227251, -0.6675743, 0.5176471, 1, 0, 1,
-0.6886445, 0.110244, -1.26313, 0.5137255, 1, 0, 1,
-0.6873152, -0.7376322, -2.304327, 0.5058824, 1, 0, 1,
-0.6872986, -0.453094, -2.143649, 0.5019608, 1, 0, 1,
-0.6840944, 0.1286303, -1.324156, 0.4941176, 1, 0, 1,
-0.6777427, 0.07894164, -1.835172, 0.4862745, 1, 0, 1,
-0.6773169, 0.4106789, -0.4607816, 0.4823529, 1, 0, 1,
-0.6647951, -0.1493946, -0.6108246, 0.4745098, 1, 0, 1,
-0.660589, -0.1084796, -3.504696, 0.4705882, 1, 0, 1,
-0.6591383, -0.9859319, -2.015117, 0.4627451, 1, 0, 1,
-0.6567011, -0.07429373, -1.39972, 0.4588235, 1, 0, 1,
-0.6560519, 0.2389913, -0.5464978, 0.4509804, 1, 0, 1,
-0.6476846, -0.8617077, -2.628365, 0.4470588, 1, 0, 1,
-0.6472425, -1.369644, -2.696252, 0.4392157, 1, 0, 1,
-0.6443862, -2.140875, -1.872086, 0.4352941, 1, 0, 1,
-0.6405644, 0.1080255, -2.184677, 0.427451, 1, 0, 1,
-0.6357021, 0.03545403, -1.220628, 0.4235294, 1, 0, 1,
-0.6327912, 0.01117133, -0.404345, 0.4156863, 1, 0, 1,
-0.6325756, -0.6566994, -1.399726, 0.4117647, 1, 0, 1,
-0.6295093, -0.003369652, -1.740066, 0.4039216, 1, 0, 1,
-0.625142, -1.740556, -2.277164, 0.3960784, 1, 0, 1,
-0.6225807, -1.12449, -1.566712, 0.3921569, 1, 0, 1,
-0.6211554, -0.606175, 0.954587, 0.3843137, 1, 0, 1,
-0.6206032, 1.269994, -0.6997306, 0.3803922, 1, 0, 1,
-0.6124421, -1.033352, -1.939315, 0.372549, 1, 0, 1,
-0.6108856, -0.2206124, -1.474038, 0.3686275, 1, 0, 1,
-0.6062225, -0.7348425, -3.211222, 0.3607843, 1, 0, 1,
-0.6061666, -1.019596, -3.242826, 0.3568628, 1, 0, 1,
-0.6040202, -1.407809, -2.539853, 0.3490196, 1, 0, 1,
-0.603136, 1.242834, -0.1446351, 0.345098, 1, 0, 1,
-0.5967436, 0.692083, -1.469486, 0.3372549, 1, 0, 1,
-0.5955224, -1.063, -3.595854, 0.3333333, 1, 0, 1,
-0.5924849, -0.112751, -1.98044, 0.3254902, 1, 0, 1,
-0.5884678, 0.7526068, -0.9449492, 0.3215686, 1, 0, 1,
-0.5814338, 0.3362513, -3.068192, 0.3137255, 1, 0, 1,
-0.5801531, -1.37799, -4.041908, 0.3098039, 1, 0, 1,
-0.5801384, -1.277381, -3.462136, 0.3019608, 1, 0, 1,
-0.5777469, 0.4589765, -1.770338, 0.2941177, 1, 0, 1,
-0.5765783, 0.676084, -0.6735581, 0.2901961, 1, 0, 1,
-0.5713047, 1.588575, 0.5814861, 0.282353, 1, 0, 1,
-0.566509, -2.333568, -2.235944, 0.2784314, 1, 0, 1,
-0.5645257, -0.4590403, -1.759481, 0.2705882, 1, 0, 1,
-0.5636187, -0.7563465, -1.615122, 0.2666667, 1, 0, 1,
-0.5580719, -1.441272, -3.043252, 0.2588235, 1, 0, 1,
-0.5562715, 0.3560905, -1.253007, 0.254902, 1, 0, 1,
-0.554586, 1.012062, 0.1069719, 0.2470588, 1, 0, 1,
-0.5492633, -0.06065919, -0.2915118, 0.2431373, 1, 0, 1,
-0.5453508, -0.07692862, -1.792719, 0.2352941, 1, 0, 1,
-0.5446405, -1.658753, -2.865356, 0.2313726, 1, 0, 1,
-0.5401378, 0.3419302, -1.521708, 0.2235294, 1, 0, 1,
-0.5391421, -0.5278654, -2.49136, 0.2196078, 1, 0, 1,
-0.5388921, 0.3359554, -1.592393, 0.2117647, 1, 0, 1,
-0.5367837, -0.6903047, -3.014039, 0.2078431, 1, 0, 1,
-0.5322203, -0.5573958, -1.283995, 0.2, 1, 0, 1,
-0.5265256, -0.4010532, -1.887585, 0.1921569, 1, 0, 1,
-0.5259354, -0.2534716, -1.249007, 0.1882353, 1, 0, 1,
-0.5249993, 1.209442, 0.2801616, 0.1803922, 1, 0, 1,
-0.5193124, 0.2313191, -2.444337, 0.1764706, 1, 0, 1,
-0.5191746, 2.000336, 0.4321772, 0.1686275, 1, 0, 1,
-0.5121005, -0.1019867, -2.364498, 0.1647059, 1, 0, 1,
-0.511401, 1.547642, 0.2620359, 0.1568628, 1, 0, 1,
-0.5104891, 0.4549421, -0.8015394, 0.1529412, 1, 0, 1,
-0.5053618, -0.5177431, -2.495262, 0.145098, 1, 0, 1,
-0.50198, -1.287867, -2.992775, 0.1411765, 1, 0, 1,
-0.5010053, 0.4936096, -1.871605, 0.1333333, 1, 0, 1,
-0.4967129, -1.31299, -1.745112, 0.1294118, 1, 0, 1,
-0.4938649, -0.5907821, -2.975551, 0.1215686, 1, 0, 1,
-0.490169, 0.08919733, -1.795043, 0.1176471, 1, 0, 1,
-0.4871295, -0.8969213, -3.243407, 0.1098039, 1, 0, 1,
-0.4859259, -0.569129, -2.024591, 0.1058824, 1, 0, 1,
-0.4835759, -0.8731452, -2.543769, 0.09803922, 1, 0, 1,
-0.4833727, -0.2168864, -1.560048, 0.09019608, 1, 0, 1,
-0.4773968, 1.910052, -0.3214659, 0.08627451, 1, 0, 1,
-0.4681486, 0.8483477, -1.698143, 0.07843138, 1, 0, 1,
-0.4645012, -1.255465, -1.567214, 0.07450981, 1, 0, 1,
-0.4637718, 0.3901067, 1.086277, 0.06666667, 1, 0, 1,
-0.4625639, -1.023712, -4.725629, 0.0627451, 1, 0, 1,
-0.4617087, -0.1974628, -2.517459, 0.05490196, 1, 0, 1,
-0.4606919, -0.2617834, -1.712554, 0.05098039, 1, 0, 1,
-0.4560476, -0.7580501, -3.851954, 0.04313726, 1, 0, 1,
-0.4555221, -1.39733, -4.170793, 0.03921569, 1, 0, 1,
-0.4517885, 0.2672701, -1.114263, 0.03137255, 1, 0, 1,
-0.4504903, -1.522973, -4.288476, 0.02745098, 1, 0, 1,
-0.449887, -2.009169, -2.940762, 0.01960784, 1, 0, 1,
-0.4482316, -0.9515311, -1.24988, 0.01568628, 1, 0, 1,
-0.446087, -0.06877005, -3.390567, 0.007843138, 1, 0, 1,
-0.4448369, -0.9816026, -4.169062, 0.003921569, 1, 0, 1,
-0.4416506, 0.4369752, -0.5581248, 0, 1, 0.003921569, 1,
-0.4410008, 1.133138, -0.4365526, 0, 1, 0.01176471, 1,
-0.4391327, -2.654474, -1.199282, 0, 1, 0.01568628, 1,
-0.438962, 1.396006, 0.003566446, 0, 1, 0.02352941, 1,
-0.4369467, -0.8192843, -4.455765, 0, 1, 0.02745098, 1,
-0.435646, 0.6063749, -1.378984, 0, 1, 0.03529412, 1,
-0.432079, 1.912454, -0.7429436, 0, 1, 0.03921569, 1,
-0.4303549, 2.165461, -1.68204, 0, 1, 0.04705882, 1,
-0.4301389, -0.5222687, -2.206605, 0, 1, 0.05098039, 1,
-0.4277245, -0.7483915, -3.512164, 0, 1, 0.05882353, 1,
-0.423416, 1.048366, -1.168961, 0, 1, 0.0627451, 1,
-0.421832, 0.6328003, -1.185622, 0, 1, 0.07058824, 1,
-0.4162249, 1.353186, -0.2371762, 0, 1, 0.07450981, 1,
-0.4155785, 1.74828, -0.6955706, 0, 1, 0.08235294, 1,
-0.4095563, 0.02802584, -0.6580508, 0, 1, 0.08627451, 1,
-0.4089577, -1.85587, -2.667214, 0, 1, 0.09411765, 1,
-0.4051761, -1.001565, -1.772261, 0, 1, 0.1019608, 1,
-0.4015168, 0.09602196, -1.732511, 0, 1, 0.1058824, 1,
-0.4003213, -0.3517355, -4.046756, 0, 1, 0.1137255, 1,
-0.3938053, 0.7666619, -0.6062615, 0, 1, 0.1176471, 1,
-0.3911285, -0.07480826, -2.071908, 0, 1, 0.1254902, 1,
-0.3903547, -0.206321, -1.313106, 0, 1, 0.1294118, 1,
-0.3895203, 1.089506, 0.1169234, 0, 1, 0.1372549, 1,
-0.3892432, 0.5650786, -0.4961617, 0, 1, 0.1411765, 1,
-0.3868836, 0.8281533, -0.3428534, 0, 1, 0.1490196, 1,
-0.384636, -0.1905977, -2.847771, 0, 1, 0.1529412, 1,
-0.3826949, 1.209257, 1.020561, 0, 1, 0.1607843, 1,
-0.3805394, -0.6147388, -4.056268, 0, 1, 0.1647059, 1,
-0.3802735, -0.9042104, -2.598488, 0, 1, 0.172549, 1,
-0.3773169, -0.1069968, -1.673808, 0, 1, 0.1764706, 1,
-0.3731729, -2.361565, -2.888716, 0, 1, 0.1843137, 1,
-0.3719278, -0.3901143, -1.032755, 0, 1, 0.1882353, 1,
-0.3706784, -0.2635876, -1.847033, 0, 1, 0.1960784, 1,
-0.3690913, 1.174749, 0.5659203, 0, 1, 0.2039216, 1,
-0.3687415, -0.5298661, -3.426987, 0, 1, 0.2078431, 1,
-0.3680512, -1.003789, -3.833367, 0, 1, 0.2156863, 1,
-0.3666326, -0.3211631, -2.329783, 0, 1, 0.2196078, 1,
-0.3633832, -0.3584764, -3.623181, 0, 1, 0.227451, 1,
-0.3629474, -1.902043, -2.106118, 0, 1, 0.2313726, 1,
-0.3616356, -0.4974104, -2.62852, 0, 1, 0.2392157, 1,
-0.3560475, 0.3402289, -0.5332292, 0, 1, 0.2431373, 1,
-0.3557414, -0.2250999, -2.129, 0, 1, 0.2509804, 1,
-0.3547094, 0.2504712, -0.7497593, 0, 1, 0.254902, 1,
-0.3522741, 1.127981, 0.5953863, 0, 1, 0.2627451, 1,
-0.3510361, -0.5763165, -3.904329, 0, 1, 0.2666667, 1,
-0.3484824, 2.117837, -1.128079, 0, 1, 0.2745098, 1,
-0.3464894, -1.535585, -2.769301, 0, 1, 0.2784314, 1,
-0.3463378, -0.1114727, -2.209649, 0, 1, 0.2862745, 1,
-0.3456426, 0.3902821, 1.141993, 0, 1, 0.2901961, 1,
-0.3439443, -1.405861, -4.287291, 0, 1, 0.2980392, 1,
-0.3437668, -0.416458, -3.484179, 0, 1, 0.3058824, 1,
-0.342937, 1.426887, -0.6278595, 0, 1, 0.3098039, 1,
-0.339748, 0.4711145, -0.9752662, 0, 1, 0.3176471, 1,
-0.3384777, 0.3114392, -1.114576, 0, 1, 0.3215686, 1,
-0.3330731, -0.1711373, -1.78765, 0, 1, 0.3294118, 1,
-0.3321752, -0.8762348, -2.378626, 0, 1, 0.3333333, 1,
-0.3294769, -0.5290136, -3.418988, 0, 1, 0.3411765, 1,
-0.3261774, 1.58892, -0.6316815, 0, 1, 0.345098, 1,
-0.3257312, -1.220947, -0.8785841, 0, 1, 0.3529412, 1,
-0.325005, -0.1169857, -2.058654, 0, 1, 0.3568628, 1,
-0.3217616, -1.358953, -1.610872, 0, 1, 0.3647059, 1,
-0.3128415, -0.9573365, -2.509155, 0, 1, 0.3686275, 1,
-0.3124785, 0.8428954, -1.821801, 0, 1, 0.3764706, 1,
-0.3088832, 0.1728749, -1.808674, 0, 1, 0.3803922, 1,
-0.3079931, 0.1696599, -0.7071728, 0, 1, 0.3882353, 1,
-0.3043271, 0.605645, -0.29513, 0, 1, 0.3921569, 1,
-0.3034012, 0.6297178, 0.8334972, 0, 1, 0.4, 1,
-0.3015152, -0.2568112, -3.954622, 0, 1, 0.4078431, 1,
-0.2973577, 0.4785654, -0.4719886, 0, 1, 0.4117647, 1,
-0.2944522, 1.742853, -1.343001, 0, 1, 0.4196078, 1,
-0.2940156, 0.2608001, 0.6062948, 0, 1, 0.4235294, 1,
-0.2914285, -1.025575, -3.282847, 0, 1, 0.4313726, 1,
-0.2903493, 1.184096, 0.3422181, 0, 1, 0.4352941, 1,
-0.289052, 0.6659393, 0.008760569, 0, 1, 0.4431373, 1,
-0.2882806, 0.2634357, 0.1559578, 0, 1, 0.4470588, 1,
-0.2840725, -1.145269, -4.780518, 0, 1, 0.454902, 1,
-0.2802433, -0.2328863, -3.046849, 0, 1, 0.4588235, 1,
-0.2784764, -0.1552889, -3.279856, 0, 1, 0.4666667, 1,
-0.2780489, 0.8515353, 2.130691, 0, 1, 0.4705882, 1,
-0.2771965, -0.8037227, -0.2061076, 0, 1, 0.4784314, 1,
-0.2761225, -0.1694588, -2.560476, 0, 1, 0.4823529, 1,
-0.2757633, 2.960134, 1.128214, 0, 1, 0.4901961, 1,
-0.2741434, 0.2447321, 1.546151, 0, 1, 0.4941176, 1,
-0.2662823, 0.9671007, 0.3912987, 0, 1, 0.5019608, 1,
-0.2652059, 1.444368, 0.5277908, 0, 1, 0.509804, 1,
-0.2642463, 1.925676, 1.763549, 0, 1, 0.5137255, 1,
-0.2637739, -0.9735307, -4.158592, 0, 1, 0.5215687, 1,
-0.2635852, 0.05847139, -1.563844, 0, 1, 0.5254902, 1,
-0.2532547, 2.110581, 0.3091593, 0, 1, 0.5333334, 1,
-0.2521646, 1.386012, 0.08279452, 0, 1, 0.5372549, 1,
-0.2409997, 0.8158293, 0.5966272, 0, 1, 0.5450981, 1,
-0.2401716, -0.8068146, -2.81942, 0, 1, 0.5490196, 1,
-0.2363312, 2.328239, 1.021538, 0, 1, 0.5568628, 1,
-0.2327361, 0.5227813, 1.149704, 0, 1, 0.5607843, 1,
-0.2313615, -1.239379, -3.662985, 0, 1, 0.5686275, 1,
-0.2278711, 0.8736144, 0.8512286, 0, 1, 0.572549, 1,
-0.2247242, 2.741012, -0.7062278, 0, 1, 0.5803922, 1,
-0.2233885, -0.2660083, -4.010739, 0, 1, 0.5843138, 1,
-0.2229181, 0.2469255, -0.628029, 0, 1, 0.5921569, 1,
-0.2203086, 0.4465629, 0.6866639, 0, 1, 0.5960785, 1,
-0.2185342, -1.145932, -1.80896, 0, 1, 0.6039216, 1,
-0.2122707, -0.2546937, -3.689536, 0, 1, 0.6117647, 1,
-0.2103433, 0.7444232, -3.354059, 0, 1, 0.6156863, 1,
-0.209933, -0.4966271, -4.371749, 0, 1, 0.6235294, 1,
-0.2018771, -1.582597, -1.568678, 0, 1, 0.627451, 1,
-0.2004745, -0.7106518, -2.141227, 0, 1, 0.6352941, 1,
-0.1996704, 0.553864, -2.192382, 0, 1, 0.6392157, 1,
-0.1993592, -1.180666, -4.074684, 0, 1, 0.6470588, 1,
-0.195563, 0.005079074, -0.9060149, 0, 1, 0.6509804, 1,
-0.1943394, -0.6074565, -3.453584, 0, 1, 0.6588235, 1,
-0.1879976, 0.02081244, -0.8868677, 0, 1, 0.6627451, 1,
-0.1855473, 3.462686, 1.502928, 0, 1, 0.6705883, 1,
-0.1831865, -1.006328, -3.938875, 0, 1, 0.6745098, 1,
-0.1821076, -0.7716978, -3.688576, 0, 1, 0.682353, 1,
-0.1814459, -0.6571626, -3.698851, 0, 1, 0.6862745, 1,
-0.1802555, -0.9366568, -2.556861, 0, 1, 0.6941177, 1,
-0.1798137, 0.2376674, 0.1976817, 0, 1, 0.7019608, 1,
-0.1794447, 1.100216, -0.5345927, 0, 1, 0.7058824, 1,
-0.1781795, 0.2176618, -0.9202105, 0, 1, 0.7137255, 1,
-0.1766631, -0.115214, -3.997656, 0, 1, 0.7176471, 1,
-0.1764974, 1.857049, -0.7482272, 0, 1, 0.7254902, 1,
-0.1728152, 3.203656, -0.402153, 0, 1, 0.7294118, 1,
-0.1724542, 1.494587, 1.086376, 0, 1, 0.7372549, 1,
-0.1712931, -0.7845575, -3.303945, 0, 1, 0.7411765, 1,
-0.1660581, -0.5200149, -3.224763, 0, 1, 0.7490196, 1,
-0.163332, 0.2690831, -2.611253, 0, 1, 0.7529412, 1,
-0.1625127, -2.034551, -4.804349, 0, 1, 0.7607843, 1,
-0.159883, 0.7975784, 0.1294856, 0, 1, 0.7647059, 1,
-0.156526, 0.8014111, -0.8694254, 0, 1, 0.772549, 1,
-0.1542967, -0.2539023, -3.528906, 0, 1, 0.7764706, 1,
-0.1526108, 1.519635, 0.6809091, 0, 1, 0.7843137, 1,
-0.1517624, 0.6945292, 0.04068176, 0, 1, 0.7882353, 1,
-0.1434079, -1.218115, -2.468353, 0, 1, 0.7960784, 1,
-0.1433594, 0.1613921, -1.855988, 0, 1, 0.8039216, 1,
-0.1382312, 1.079424, -0.9819556, 0, 1, 0.8078431, 1,
-0.1358698, -0.9857981, -2.187008, 0, 1, 0.8156863, 1,
-0.1348905, 0.2531544, -1.051858, 0, 1, 0.8196079, 1,
-0.1326458, -0.6771577, -2.649458, 0, 1, 0.827451, 1,
-0.1322685, 0.6315773, 0.5490269, 0, 1, 0.8313726, 1,
-0.1206031, -0.2882479, -2.277975, 0, 1, 0.8392157, 1,
-0.1187983, -1.673289, -4.415605, 0, 1, 0.8431373, 1,
-0.1164515, -0.4233762, -3.353751, 0, 1, 0.8509804, 1,
-0.1112645, -0.3082766, -3.615546, 0, 1, 0.854902, 1,
-0.1068577, -0.09859781, -1.138724, 0, 1, 0.8627451, 1,
-0.1065713, -1.094462, -1.622027, 0, 1, 0.8666667, 1,
-0.1042839, 0.2955232, -0.0780515, 0, 1, 0.8745098, 1,
-0.1020766, 0.7171453, -2.434832, 0, 1, 0.8784314, 1,
-0.1007002, -0.06877878, -1.001376, 0, 1, 0.8862745, 1,
-0.0978605, -0.6280699, -2.816144, 0, 1, 0.8901961, 1,
-0.09714116, -0.8077464, -1.46713, 0, 1, 0.8980392, 1,
-0.09055605, -0.2928658, -2.378907, 0, 1, 0.9058824, 1,
-0.09050309, -0.7739714, -2.184709, 0, 1, 0.9098039, 1,
-0.08683626, 1.116275, -0.166115, 0, 1, 0.9176471, 1,
-0.07857602, -0.7779739, -4.866194, 0, 1, 0.9215686, 1,
-0.07840729, 0.6096472, -0.9671491, 0, 1, 0.9294118, 1,
-0.07177538, -0.8859656, -2.533857, 0, 1, 0.9333333, 1,
-0.07150412, 0.2167478, -0.838911, 0, 1, 0.9411765, 1,
-0.07037565, -0.5105324, -2.996741, 0, 1, 0.945098, 1,
-0.06993198, 0.3225559, -0.1155043, 0, 1, 0.9529412, 1,
-0.06945936, -1.074218, -4.751876, 0, 1, 0.9568627, 1,
-0.06842295, -0.5361541, -3.984795, 0, 1, 0.9647059, 1,
-0.06549897, 1.736718, -0.9916131, 0, 1, 0.9686275, 1,
-0.06235737, 0.02105051, -2.22433, 0, 1, 0.9764706, 1,
-0.05383309, -0.2598614, -3.663671, 0, 1, 0.9803922, 1,
-0.05246065, 1.532708, 0.16459, 0, 1, 0.9882353, 1,
-0.04242678, -0.8640029, -2.942226, 0, 1, 0.9921569, 1,
-0.03905255, 1.587682, 0.1287895, 0, 1, 1, 1,
-0.03621798, 0.006265637, -3.392575, 0, 0.9921569, 1, 1,
-0.03593256, 0.09162335, -0.4279321, 0, 0.9882353, 1, 1,
-0.03188856, -0.05263077, -2.894026, 0, 0.9803922, 1, 1,
-0.03083772, 0.1392972, 0.4365281, 0, 0.9764706, 1, 1,
-0.02985328, 1.441903, -0.1588143, 0, 0.9686275, 1, 1,
-0.02569664, 0.2839574, -0.4721425, 0, 0.9647059, 1, 1,
-0.02553093, -0.4909012, -2.42048, 0, 0.9568627, 1, 1,
-0.02203633, 1.048646, -0.9885901, 0, 0.9529412, 1, 1,
-0.02172212, -0.4257726, -1.30776, 0, 0.945098, 1, 1,
-0.01871411, 0.001972489, -1.833412, 0, 0.9411765, 1, 1,
-0.01703476, 2.5247, 0.6242031, 0, 0.9333333, 1, 1,
-0.01333136, -0.3442239, -1.903621, 0, 0.9294118, 1, 1,
-0.01041134, 0.7951336, -1.19036, 0, 0.9215686, 1, 1,
-0.00897431, 0.7954144, 1.095998, 0, 0.9176471, 1, 1,
-0.006449403, 1.363523, -1.010296, 0, 0.9098039, 1, 1,
-0.002988357, -1.085669, -1.865241, 0, 0.9058824, 1, 1,
0.003156531, -2.581747, 2.882905, 0, 0.8980392, 1, 1,
0.004608858, 1.946256, 0.7403867, 0, 0.8901961, 1, 1,
0.005882931, 0.9211289, -0.4355342, 0, 0.8862745, 1, 1,
0.006207108, -1.049608, 2.722307, 0, 0.8784314, 1, 1,
0.007811217, -0.04005487, 2.529183, 0, 0.8745098, 1, 1,
0.00791657, 0.2468204, -0.853798, 0, 0.8666667, 1, 1,
0.00829047, -0.004625788, 2.195686, 0, 0.8627451, 1, 1,
0.020145, 0.9919622, 1.185999, 0, 0.854902, 1, 1,
0.02415849, -1.164376, 3.959197, 0, 0.8509804, 1, 1,
0.02788062, -1.503506, 4.110768, 0, 0.8431373, 1, 1,
0.03554435, -0.0941823, 3.77347, 0, 0.8392157, 1, 1,
0.03563217, 1.423535, 0.4041083, 0, 0.8313726, 1, 1,
0.0358985, -0.8086478, 3.733177, 0, 0.827451, 1, 1,
0.04003819, -0.5355741, 0.5839453, 0, 0.8196079, 1, 1,
0.04502302, 1.12225, 2.65253, 0, 0.8156863, 1, 1,
0.04548832, -2.106602, 3.404804, 0, 0.8078431, 1, 1,
0.04549854, -0.5252137, 3.813699, 0, 0.8039216, 1, 1,
0.0486394, -0.2244198, 3.558029, 0, 0.7960784, 1, 1,
0.05490705, 1.167528, -1.002601, 0, 0.7882353, 1, 1,
0.05624559, 0.2966551, 0.08132192, 0, 0.7843137, 1, 1,
0.05983795, 0.5045911, 1.079821, 0, 0.7764706, 1, 1,
0.06099482, 0.6977956, -1.578843, 0, 0.772549, 1, 1,
0.06464636, -0.877203, 1.71271, 0, 0.7647059, 1, 1,
0.06996373, -1.036916, 1.523955, 0, 0.7607843, 1, 1,
0.07046794, -1.840587, 2.509809, 0, 0.7529412, 1, 1,
0.07054967, 2.535314, -1.391129, 0, 0.7490196, 1, 1,
0.07057402, -0.691458, 2.336259, 0, 0.7411765, 1, 1,
0.07504838, 1.114281, 0.5298829, 0, 0.7372549, 1, 1,
0.07626499, 0.5689062, -0.9757449, 0, 0.7294118, 1, 1,
0.07770479, 0.4078489, -1.390383, 0, 0.7254902, 1, 1,
0.07986804, 0.2248651, 1.577835, 0, 0.7176471, 1, 1,
0.08589984, 0.8148674, 0.03868423, 0, 0.7137255, 1, 1,
0.08695424, -0.7312868, 3.349802, 0, 0.7058824, 1, 1,
0.09267213, 0.7512854, -0.4879363, 0, 0.6980392, 1, 1,
0.1059645, -0.06168615, 1.36148, 0, 0.6941177, 1, 1,
0.1092921, 1.322802, 0.1782831, 0, 0.6862745, 1, 1,
0.1132537, -0.02239396, 2.358371, 0, 0.682353, 1, 1,
0.1143742, -0.8835667, 1.872039, 0, 0.6745098, 1, 1,
0.1146326, -0.5318504, 3.01591, 0, 0.6705883, 1, 1,
0.1161439, -1.695321, 1.983641, 0, 0.6627451, 1, 1,
0.1164988, -0.2581693, 2.596733, 0, 0.6588235, 1, 1,
0.1193034, 1.38048, 0.4685305, 0, 0.6509804, 1, 1,
0.119758, 0.3893226, 1.502007, 0, 0.6470588, 1, 1,
0.1205498, 0.1825552, -2.376939, 0, 0.6392157, 1, 1,
0.1208342, 0.5826626, 0.4594214, 0, 0.6352941, 1, 1,
0.1229332, 0.9858933, 0.005336253, 0, 0.627451, 1, 1,
0.1237582, 0.8668813, 1.066707, 0, 0.6235294, 1, 1,
0.1255008, -0.7882667, 3.229096, 0, 0.6156863, 1, 1,
0.1297235, -0.5663782, 2.011841, 0, 0.6117647, 1, 1,
0.1327037, -2.621624, 3.243804, 0, 0.6039216, 1, 1,
0.1343996, 0.9098799, -0.5830078, 0, 0.5960785, 1, 1,
0.1350193, 1.256624, -0.7451971, 0, 0.5921569, 1, 1,
0.1397579, -1.3938, 3.293015, 0, 0.5843138, 1, 1,
0.14748, -0.1551188, 2.07219, 0, 0.5803922, 1, 1,
0.1521555, 0.9417189, -0.8959664, 0, 0.572549, 1, 1,
0.1542344, 1.545958, -0.4359818, 0, 0.5686275, 1, 1,
0.1573101, 0.912175, 0.4092761, 0, 0.5607843, 1, 1,
0.1593613, 1.176876, 0.1976041, 0, 0.5568628, 1, 1,
0.1598442, 0.06488537, 0.4870196, 0, 0.5490196, 1, 1,
0.1600326, 0.5403736, 0.1394412, 0, 0.5450981, 1, 1,
0.1607677, -0.3246102, 4.309024, 0, 0.5372549, 1, 1,
0.1623674, 0.5545283, 2.275612, 0, 0.5333334, 1, 1,
0.1640781, -1.420559, 2.378514, 0, 0.5254902, 1, 1,
0.1656634, 0.1338309, -0.7509587, 0, 0.5215687, 1, 1,
0.1706199, 0.6771151, -1.151843, 0, 0.5137255, 1, 1,
0.1709528, -0.792311, 2.526194, 0, 0.509804, 1, 1,
0.1714961, -2.204355, 4.323769, 0, 0.5019608, 1, 1,
0.1762395, 1.773475, -1.159689, 0, 0.4941176, 1, 1,
0.181704, 1.182531, 0.003042187, 0, 0.4901961, 1, 1,
0.1863883, -1.217284, 3.467767, 0, 0.4823529, 1, 1,
0.1898236, 0.529802, 1.458976, 0, 0.4784314, 1, 1,
0.1910585, 0.7881865, -0.3268857, 0, 0.4705882, 1, 1,
0.1963748, 0.9737924, 1.330533, 0, 0.4666667, 1, 1,
0.1970594, 1.406713, 0.3670353, 0, 0.4588235, 1, 1,
0.207102, -0.3366705, 4.168897, 0, 0.454902, 1, 1,
0.20881, -2.644662, 1.771047, 0, 0.4470588, 1, 1,
0.2101686, -0.1555968, 2.183943, 0, 0.4431373, 1, 1,
0.2117278, 1.62489, 0.3982819, 0, 0.4352941, 1, 1,
0.2138247, 0.3597251, 0.2160602, 0, 0.4313726, 1, 1,
0.2184294, -1.684641, 1.510469, 0, 0.4235294, 1, 1,
0.2228558, -0.8086444, 3.1154, 0, 0.4196078, 1, 1,
0.2261999, -1.512734, 4.762462, 0, 0.4117647, 1, 1,
0.2266284, -0.642965, 1.642366, 0, 0.4078431, 1, 1,
0.2338946, -0.2618149, 2.53249, 0, 0.4, 1, 1,
0.2383757, -0.3924881, 3.838427, 0, 0.3921569, 1, 1,
0.2409257, 1.574058, -0.1215028, 0, 0.3882353, 1, 1,
0.2416308, 0.9754245, -1.515345, 0, 0.3803922, 1, 1,
0.2432167, 1.68941, -1.14559, 0, 0.3764706, 1, 1,
0.2480217, 1.098927, 1.299481, 0, 0.3686275, 1, 1,
0.2522174, 0.3872228, 0.3550254, 0, 0.3647059, 1, 1,
0.2536526, -0.8015177, 1.784957, 0, 0.3568628, 1, 1,
0.255742, 0.4149694, -0.8093199, 0, 0.3529412, 1, 1,
0.2582597, 0.1954265, -1.432121, 0, 0.345098, 1, 1,
0.258713, 0.9010308, 1.938404, 0, 0.3411765, 1, 1,
0.2587134, 0.5179499, -1.067809, 0, 0.3333333, 1, 1,
0.2665381, -0.7273952, 1.715684, 0, 0.3294118, 1, 1,
0.2667488, -1.473828, 2.367947, 0, 0.3215686, 1, 1,
0.2705983, -0.5804959, 3.409662, 0, 0.3176471, 1, 1,
0.2724802, 0.9822289, -1.14596, 0, 0.3098039, 1, 1,
0.2750455, -1.053115, 2.320766, 0, 0.3058824, 1, 1,
0.2760279, 0.6733583, 2.260992, 0, 0.2980392, 1, 1,
0.2761791, -0.1305635, 2.85971, 0, 0.2901961, 1, 1,
0.2775, 0.8414041, -0.2090877, 0, 0.2862745, 1, 1,
0.2822995, -0.645191, 1.686825, 0, 0.2784314, 1, 1,
0.2828796, -0.0857823, 2.301442, 0, 0.2745098, 1, 1,
0.2861907, 1.390653, 1.062487, 0, 0.2666667, 1, 1,
0.2875376, 1.204675, -0.4645553, 0, 0.2627451, 1, 1,
0.3007933, -0.6109, 3.615062, 0, 0.254902, 1, 1,
0.3103954, 0.5103709, 1.59511, 0, 0.2509804, 1, 1,
0.3116062, -0.7216731, 1.967172, 0, 0.2431373, 1, 1,
0.3153242, -0.244826, 2.300191, 0, 0.2392157, 1, 1,
0.3171785, 0.5043172, 0.5664799, 0, 0.2313726, 1, 1,
0.3181939, -0.4506842, 2.512216, 0, 0.227451, 1, 1,
0.3187198, 0.428637, 1.201022, 0, 0.2196078, 1, 1,
0.3206933, 0.784655, -1.30232, 0, 0.2156863, 1, 1,
0.3209243, 0.5084828, 0.8448359, 0, 0.2078431, 1, 1,
0.3213651, 0.9842499, 0.6773018, 0, 0.2039216, 1, 1,
0.3224256, -0.04003878, 1.388996, 0, 0.1960784, 1, 1,
0.322475, -1.829245, 1.972219, 0, 0.1882353, 1, 1,
0.3258164, -1.043595, 3.41417, 0, 0.1843137, 1, 1,
0.3288288, -1.688656, 2.442635, 0, 0.1764706, 1, 1,
0.3340314, -0.1596649, 4.152335, 0, 0.172549, 1, 1,
0.3352425, 0.2890464, 0.8189493, 0, 0.1647059, 1, 1,
0.3353646, 0.1413516, 1.442942, 0, 0.1607843, 1, 1,
0.33798, -1.340974, 2.505415, 0, 0.1529412, 1, 1,
0.3416413, 1.33212, 0.3981521, 0, 0.1490196, 1, 1,
0.3446068, 1.848099, 0.7466487, 0, 0.1411765, 1, 1,
0.3464254, 0.5618924, 0.4846639, 0, 0.1372549, 1, 1,
0.3504997, -0.6661102, 2.409534, 0, 0.1294118, 1, 1,
0.3513497, 0.8590543, 0.6969198, 0, 0.1254902, 1, 1,
0.3515817, -2.137726, 3.596818, 0, 0.1176471, 1, 1,
0.3516472, -0.7951987, 0.9007762, 0, 0.1137255, 1, 1,
0.3525089, 0.1977239, 0.3107965, 0, 0.1058824, 1, 1,
0.3528621, -1.431265, 3.577819, 0, 0.09803922, 1, 1,
0.3538913, 0.6288475, 1.48244, 0, 0.09411765, 1, 1,
0.3552743, 2.183049, 0.08455134, 0, 0.08627451, 1, 1,
0.3588927, 0.9610764, -1.108639, 0, 0.08235294, 1, 1,
0.3622427, 0.5034246, 0.9815298, 0, 0.07450981, 1, 1,
0.364423, 0.8677009, -0.4363607, 0, 0.07058824, 1, 1,
0.365758, -0.657171, 1.008096, 0, 0.0627451, 1, 1,
0.3659454, 1.424285, 0.3062514, 0, 0.05882353, 1, 1,
0.3715135, -1.604103, 3.639934, 0, 0.05098039, 1, 1,
0.3763637, 0.4189632, 2.002854, 0, 0.04705882, 1, 1,
0.3763908, 1.304168, -0.5089754, 0, 0.03921569, 1, 1,
0.3771257, 0.3786871, 1.69237, 0, 0.03529412, 1, 1,
0.3777464, -0.6383413, 1.974578, 0, 0.02745098, 1, 1,
0.37789, -1.088542, 1.647324, 0, 0.02352941, 1, 1,
0.3779157, 0.3427887, -0.6506518, 0, 0.01568628, 1, 1,
0.3781178, -0.5658576, 3.459168, 0, 0.01176471, 1, 1,
0.3796492, 1.043294, -0.7575861, 0, 0.003921569, 1, 1,
0.3814032, -0.2101459, 1.143828, 0.003921569, 0, 1, 1,
0.3822085, -1.346497, 2.781979, 0.007843138, 0, 1, 1,
0.3838477, -0.5880983, 1.469287, 0.01568628, 0, 1, 1,
0.3846449, 1.41735, 0.253105, 0.01960784, 0, 1, 1,
0.3910998, -0.9610634, 3.478552, 0.02745098, 0, 1, 1,
0.3928132, -0.4626128, 3.51749, 0.03137255, 0, 1, 1,
0.3968264, 0.09984644, 2.777573, 0.03921569, 0, 1, 1,
0.4055244, 0.5999361, -1.062695, 0.04313726, 0, 1, 1,
0.407632, -0.9439955, 2.077969, 0.05098039, 0, 1, 1,
0.4097231, 2.144557, 0.669808, 0.05490196, 0, 1, 1,
0.4121554, 0.8051172, -0.7166587, 0.0627451, 0, 1, 1,
0.4226272, -0.5255486, 0.5443717, 0.06666667, 0, 1, 1,
0.4243407, 1.650604, -0.2167943, 0.07450981, 0, 1, 1,
0.4265317, -0.2082363, 0.2809668, 0.07843138, 0, 1, 1,
0.426573, 0.6489536, 0.916218, 0.08627451, 0, 1, 1,
0.4305202, -1.389628, 2.539625, 0.09019608, 0, 1, 1,
0.4335945, -0.1090424, 1.825669, 0.09803922, 0, 1, 1,
0.445336, 1.885427, 1.375599, 0.1058824, 0, 1, 1,
0.445568, -0.6614984, 2.647615, 0.1098039, 0, 1, 1,
0.4456107, 2.194944, -0.5019464, 0.1176471, 0, 1, 1,
0.4460014, -0.6851001, 4.218752, 0.1215686, 0, 1, 1,
0.4513855, 1.180152, 0.87707, 0.1294118, 0, 1, 1,
0.4524617, 0.5348863, -0.6942211, 0.1333333, 0, 1, 1,
0.4536415, -0.02170948, 1.179639, 0.1411765, 0, 1, 1,
0.4584293, -0.9411786, 2.360965, 0.145098, 0, 1, 1,
0.4587634, -0.2001922, 1.325014, 0.1529412, 0, 1, 1,
0.4619343, 0.7920674, 0.813032, 0.1568628, 0, 1, 1,
0.4701277, -0.245784, 2.718006, 0.1647059, 0, 1, 1,
0.4706558, 1.592668, 1.799488, 0.1686275, 0, 1, 1,
0.4722695, -0.7667759, 3.766675, 0.1764706, 0, 1, 1,
0.4771406, 0.0322844, 0.5300553, 0.1803922, 0, 1, 1,
0.4843698, -0.1510139, 2.579288, 0.1882353, 0, 1, 1,
0.49288, 1.450715, 0.1338145, 0.1921569, 0, 1, 1,
0.4932207, -0.4873551, 1.831902, 0.2, 0, 1, 1,
0.4957193, 0.2232465, 1.293911, 0.2078431, 0, 1, 1,
0.4982532, 0.03699585, 2.705715, 0.2117647, 0, 1, 1,
0.5005186, 0.01117243, 0.4775865, 0.2196078, 0, 1, 1,
0.503877, 1.116842, -0.02807744, 0.2235294, 0, 1, 1,
0.50692, 0.4182336, -0.1675063, 0.2313726, 0, 1, 1,
0.5091078, 2.224712, 0.8034099, 0.2352941, 0, 1, 1,
0.5093987, -0.9260464, 2.224012, 0.2431373, 0, 1, 1,
0.5108498, 0.170793, -0.07138129, 0.2470588, 0, 1, 1,
0.5153659, -0.2131064, 1.870029, 0.254902, 0, 1, 1,
0.5198464, -1.182145, 3.098619, 0.2588235, 0, 1, 1,
0.522293, -1.575731, 4.371347, 0.2666667, 0, 1, 1,
0.5277957, -0.4573467, 3.626698, 0.2705882, 0, 1, 1,
0.5333763, -0.8254859, 5.304945, 0.2784314, 0, 1, 1,
0.5387677, 1.813246, 1.39009, 0.282353, 0, 1, 1,
0.5391277, -1.007548, 4.170637, 0.2901961, 0, 1, 1,
0.5436496, -0.2001765, 1.747007, 0.2941177, 0, 1, 1,
0.5453109, -0.199757, 2.660629, 0.3019608, 0, 1, 1,
0.5462068, 0.5144271, 0.8065487, 0.3098039, 0, 1, 1,
0.5494111, -0.008699344, 0.4202055, 0.3137255, 0, 1, 1,
0.5663055, 1.229777, 2.659248, 0.3215686, 0, 1, 1,
0.5704294, 0.8103139, 0.51491, 0.3254902, 0, 1, 1,
0.5762388, 0.5118265, 1.230909, 0.3333333, 0, 1, 1,
0.5773844, 0.08644003, -0.05991939, 0.3372549, 0, 1, 1,
0.5816085, -0.09815361, 2.650986, 0.345098, 0, 1, 1,
0.5922214, 0.5110833, 1.527132, 0.3490196, 0, 1, 1,
0.5922297, -0.08289107, 2.248885, 0.3568628, 0, 1, 1,
0.5932082, -0.551936, 2.071986, 0.3607843, 0, 1, 1,
0.5934746, -0.3434116, 0.8849577, 0.3686275, 0, 1, 1,
0.5948091, 1.36919, 1.659807, 0.372549, 0, 1, 1,
0.6032208, 1.68613, 0.02098869, 0.3803922, 0, 1, 1,
0.6050479, 1.538168, 0.6124281, 0.3843137, 0, 1, 1,
0.6111594, -0.09364744, 4.444579, 0.3921569, 0, 1, 1,
0.6137091, 1.611339, 0.139088, 0.3960784, 0, 1, 1,
0.6155177, 0.1690942, 2.478019, 0.4039216, 0, 1, 1,
0.6175386, 1.11576, 0.3712472, 0.4117647, 0, 1, 1,
0.6203319, -0.7634724, 1.799645, 0.4156863, 0, 1, 1,
0.6209967, -0.6023089, 2.088341, 0.4235294, 0, 1, 1,
0.621157, 0.5154564, 0.4786026, 0.427451, 0, 1, 1,
0.6217689, 0.06335866, -0.482558, 0.4352941, 0, 1, 1,
0.6272126, 0.5322915, 0.8594213, 0.4392157, 0, 1, 1,
0.6293343, 0.5627633, 1.509317, 0.4470588, 0, 1, 1,
0.638101, 0.2894011, 1.180493, 0.4509804, 0, 1, 1,
0.6381222, -1.006292, 2.510555, 0.4588235, 0, 1, 1,
0.6428014, -0.01995126, 0.2588218, 0.4627451, 0, 1, 1,
0.643867, 1.690966, 1.255475, 0.4705882, 0, 1, 1,
0.6522185, 1.971372, 0.7738826, 0.4745098, 0, 1, 1,
0.6554717, -1.782248, 2.795803, 0.4823529, 0, 1, 1,
0.6652362, 1.17982, 0.4987659, 0.4862745, 0, 1, 1,
0.6683536, 0.4962507, 0.3710684, 0.4941176, 0, 1, 1,
0.6796012, 0.6540712, 1.39819, 0.5019608, 0, 1, 1,
0.6891883, 0.4863932, 0.6463429, 0.5058824, 0, 1, 1,
0.6895875, 0.7834557, 1.336244, 0.5137255, 0, 1, 1,
0.6986021, -0.3178484, 2.617276, 0.5176471, 0, 1, 1,
0.7009538, -0.1665023, 1.854334, 0.5254902, 0, 1, 1,
0.7055425, 1.475313, 0.852573, 0.5294118, 0, 1, 1,
0.7124668, -1.160942, 2.063145, 0.5372549, 0, 1, 1,
0.7161706, -1.305269, 2.975845, 0.5411765, 0, 1, 1,
0.721942, -1.114587, 2.969976, 0.5490196, 0, 1, 1,
0.7227615, -1.848, 1.740754, 0.5529412, 0, 1, 1,
0.7240007, -1.302948, 4.152821, 0.5607843, 0, 1, 1,
0.7281389, 1.103124, 1.964938, 0.5647059, 0, 1, 1,
0.7290344, 1.059291, 0.5640531, 0.572549, 0, 1, 1,
0.7323114, -3.312967, 3.959259, 0.5764706, 0, 1, 1,
0.7333463, 0.0534753, 2.034039, 0.5843138, 0, 1, 1,
0.7460819, -1.844916, 3.334792, 0.5882353, 0, 1, 1,
0.7470397, -0.1459126, 1.71292, 0.5960785, 0, 1, 1,
0.7486172, -0.9668447, 0.8734065, 0.6039216, 0, 1, 1,
0.7527905, 0.5581273, 1.528354, 0.6078432, 0, 1, 1,
0.7535711, 0.8237886, 0.4206693, 0.6156863, 0, 1, 1,
0.7602043, 0.0006608515, 1.93543, 0.6196079, 0, 1, 1,
0.7603929, 1.116824, -0.1710991, 0.627451, 0, 1, 1,
0.7626644, -0.397819, 2.563925, 0.6313726, 0, 1, 1,
0.7695906, -0.6209579, 3.246201, 0.6392157, 0, 1, 1,
0.7842683, 2.541226, 0.2601273, 0.6431373, 0, 1, 1,
0.786709, -0.1358437, 1.952303, 0.6509804, 0, 1, 1,
0.7882519, 0.4436685, 2.176428, 0.654902, 0, 1, 1,
0.7887815, -1.544816, 2.441006, 0.6627451, 0, 1, 1,
0.7898573, 2.165042, 0.8614107, 0.6666667, 0, 1, 1,
0.794452, 0.6162487, 1.196392, 0.6745098, 0, 1, 1,
0.7966393, -1.440508, 2.010888, 0.6784314, 0, 1, 1,
0.8027111, -0.04046031, 2.006234, 0.6862745, 0, 1, 1,
0.8058832, 2.151081, 1.604685, 0.6901961, 0, 1, 1,
0.8058932, 2.166154, 1.593204, 0.6980392, 0, 1, 1,
0.8078542, -0.3258331, 1.992737, 0.7058824, 0, 1, 1,
0.8094548, -1.802482, 2.384389, 0.7098039, 0, 1, 1,
0.8096297, 0.1561846, 1.214914, 0.7176471, 0, 1, 1,
0.8132644, -0.6839119, 2.776148, 0.7215686, 0, 1, 1,
0.8140162, 0.7531042, 1.512063, 0.7294118, 0, 1, 1,
0.8212916, 0.5675189, 1.537644, 0.7333333, 0, 1, 1,
0.8265944, 1.889403, 1.356417, 0.7411765, 0, 1, 1,
0.8283947, 0.2575222, 0.2933876, 0.7450981, 0, 1, 1,
0.8290792, -1.008447, 3.40397, 0.7529412, 0, 1, 1,
0.8416386, -2.563945, 3.258737, 0.7568628, 0, 1, 1,
0.8434563, 1.567043, 0.9830906, 0.7647059, 0, 1, 1,
0.8472267, -2.426461, 2.571422, 0.7686275, 0, 1, 1,
0.8488448, -0.009833828, 2.367246, 0.7764706, 0, 1, 1,
0.8489505, 0.4880051, 0.6109735, 0.7803922, 0, 1, 1,
0.8505346, 0.209239, 1.389768, 0.7882353, 0, 1, 1,
0.8533702, -0.2555476, -1.616899, 0.7921569, 0, 1, 1,
0.8557981, -0.1329757, 4.072004, 0.8, 0, 1, 1,
0.8591195, -0.0398251, 3.683782, 0.8078431, 0, 1, 1,
0.8604679, -1.03623, 2.028465, 0.8117647, 0, 1, 1,
0.8611531, -0.2786486, 2.184421, 0.8196079, 0, 1, 1,
0.8615714, 0.2492778, 1.325448, 0.8235294, 0, 1, 1,
0.8655329, -0.1678064, 1.924752, 0.8313726, 0, 1, 1,
0.8658537, -0.6372893, 1.936443, 0.8352941, 0, 1, 1,
0.8666382, 0.2283662, 0.2802578, 0.8431373, 0, 1, 1,
0.879258, -0.818414, 2.665502, 0.8470588, 0, 1, 1,
0.8800038, 1.896592, 2.345728, 0.854902, 0, 1, 1,
0.8869655, 0.6602497, -0.5044618, 0.8588235, 0, 1, 1,
0.8929313, -0.3535376, 2.874527, 0.8666667, 0, 1, 1,
0.8938513, 0.3148848, 2.000473, 0.8705882, 0, 1, 1,
0.9008949, -1.067318, 2.730138, 0.8784314, 0, 1, 1,
0.9277653, 0.7807293, 2.156553, 0.8823529, 0, 1, 1,
0.9343819, 0.7619906, -0.1585622, 0.8901961, 0, 1, 1,
0.9442727, -0.6063303, 1.862995, 0.8941177, 0, 1, 1,
0.9490025, -1.996227, 4.292169, 0.9019608, 0, 1, 1,
0.9492866, -2.14373, 0.6800929, 0.9098039, 0, 1, 1,
0.9528108, 0.97601, 0.2307156, 0.9137255, 0, 1, 1,
0.9557011, 0.1989841, 1.095131, 0.9215686, 0, 1, 1,
0.9597461, -0.168833, 1.354498, 0.9254902, 0, 1, 1,
0.9605328, -0.9095176, 4.392801, 0.9333333, 0, 1, 1,
0.9639022, -1.738164, 1.408584, 0.9372549, 0, 1, 1,
0.9732736, 0.2347359, 0.6905246, 0.945098, 0, 1, 1,
0.9763665, -0.6507251, 2.528157, 0.9490196, 0, 1, 1,
0.9765626, 0.9838562, 1.732155, 0.9568627, 0, 1, 1,
0.9779949, 1.018373, 1.328626, 0.9607843, 0, 1, 1,
0.9958619, -1.08905, 2.553914, 0.9686275, 0, 1, 1,
0.99686, -0.9141936, 1.647155, 0.972549, 0, 1, 1,
1.004406, -0.6005736, 2.445309, 0.9803922, 0, 1, 1,
1.004827, -0.348618, 1.198895, 0.9843137, 0, 1, 1,
1.013689, 0.4861735, -0.6948029, 0.9921569, 0, 1, 1,
1.020352, -0.6778102, 1.522581, 0.9960784, 0, 1, 1,
1.022672, -0.02412442, 2.033504, 1, 0, 0.9960784, 1,
1.024913, 1.233768, 0.7504191, 1, 0, 0.9882353, 1,
1.029652, -0.3762239, 0.639329, 1, 0, 0.9843137, 1,
1.033489, 1.032801, 1.925695, 1, 0, 0.9764706, 1,
1.033578, 0.3057814, -0.2073905, 1, 0, 0.972549, 1,
1.035525, 0.8351001, 1.968741, 1, 0, 0.9647059, 1,
1.046654, 0.7336674, 2.702462, 1, 0, 0.9607843, 1,
1.049147, -0.6153701, 0.3089787, 1, 0, 0.9529412, 1,
1.049408, 0.7176613, 1.134231, 1, 0, 0.9490196, 1,
1.056075, 0.1887098, 2.01614, 1, 0, 0.9411765, 1,
1.058427, -0.7390304, 2.041724, 1, 0, 0.9372549, 1,
1.072797, 1.141044, 1.788884, 1, 0, 0.9294118, 1,
1.085565, -0.2525502, 0.7974312, 1, 0, 0.9254902, 1,
1.090273, -0.4434964, 2.335881, 1, 0, 0.9176471, 1,
1.099218, 0.01380251, 1.452745, 1, 0, 0.9137255, 1,
1.106535, -0.2869954, 1.902726, 1, 0, 0.9058824, 1,
1.110042, 0.2391865, 1.211811, 1, 0, 0.9019608, 1,
1.110732, 0.2213449, 1.280967, 1, 0, 0.8941177, 1,
1.1116, 0.1514292, 1.753559, 1, 0, 0.8862745, 1,
1.118392, 0.0800422, 1.362345, 1, 0, 0.8823529, 1,
1.125541, 0.1083621, 1.664423, 1, 0, 0.8745098, 1,
1.128222, -1.18533, 1.867967, 1, 0, 0.8705882, 1,
1.130042, 1.110135, 0.6263846, 1, 0, 0.8627451, 1,
1.13042, -2.242781, 3.381138, 1, 0, 0.8588235, 1,
1.136653, -1.169815, 2.026099, 1, 0, 0.8509804, 1,
1.137893, -0.3977238, 2.642528, 1, 0, 0.8470588, 1,
1.142161, -0.01881615, 1.683044, 1, 0, 0.8392157, 1,
1.143409, -0.8326185, 2.46947, 1, 0, 0.8352941, 1,
1.157284, -2.419324, 4.093795, 1, 0, 0.827451, 1,
1.160997, 0.3750049, 2.086361, 1, 0, 0.8235294, 1,
1.165266, 0.3034329, 1.047853, 1, 0, 0.8156863, 1,
1.17043, 0.07107124, 0.8751243, 1, 0, 0.8117647, 1,
1.173844, -0.6597431, 2.748785, 1, 0, 0.8039216, 1,
1.178742, -0.4058405, 1.561554, 1, 0, 0.7960784, 1,
1.180614, -0.05529837, 1.94287, 1, 0, 0.7921569, 1,
1.181696, 1.223232, -0.4610528, 1, 0, 0.7843137, 1,
1.192114, -0.2419165, 1.055988, 1, 0, 0.7803922, 1,
1.217186, -1.225007, 1.697864, 1, 0, 0.772549, 1,
1.218579, 0.7673637, -0.7465943, 1, 0, 0.7686275, 1,
1.221006, -0.3897107, 1.131344, 1, 0, 0.7607843, 1,
1.221192, -1.117016, 2.235668, 1, 0, 0.7568628, 1,
1.223691, -0.152877, 0.8734275, 1, 0, 0.7490196, 1,
1.225407, -0.8010951, 0.6465124, 1, 0, 0.7450981, 1,
1.22567, -0.6974078, 2.145617, 1, 0, 0.7372549, 1,
1.225796, -0.5472777, -0.2939238, 1, 0, 0.7333333, 1,
1.226622, 0.01647148, 1.47652, 1, 0, 0.7254902, 1,
1.234477, 0.173326, 0.223427, 1, 0, 0.7215686, 1,
1.236787, 0.3806695, 1.822672, 1, 0, 0.7137255, 1,
1.242736, 1.883277, -0.4849566, 1, 0, 0.7098039, 1,
1.245322, 0.901817, -1.355079, 1, 0, 0.7019608, 1,
1.245487, 0.2941425, 0.5368268, 1, 0, 0.6941177, 1,
1.246333, -0.7785206, 3.424701, 1, 0, 0.6901961, 1,
1.251146, 0.4666264, 1.222757, 1, 0, 0.682353, 1,
1.257656, 0.04445992, 1.372396, 1, 0, 0.6784314, 1,
1.261958, -0.9826626, 1.830232, 1, 0, 0.6705883, 1,
1.271235, -0.6783221, 2.305206, 1, 0, 0.6666667, 1,
1.275994, -0.3727815, 2.552474, 1, 0, 0.6588235, 1,
1.278408, -1.220088, 2.22358, 1, 0, 0.654902, 1,
1.282655, -0.4576689, 2.862398, 1, 0, 0.6470588, 1,
1.283332, 1.479216, 1.312042, 1, 0, 0.6431373, 1,
1.286428, -0.03024529, 0.2271731, 1, 0, 0.6352941, 1,
1.297823, 1.901646, 0.19624, 1, 0, 0.6313726, 1,
1.300498, 0.3134314, 2.405231, 1, 0, 0.6235294, 1,
1.311373, 0.7320998, 1.607553, 1, 0, 0.6196079, 1,
1.321883, -0.2827685, 1.140979, 1, 0, 0.6117647, 1,
1.323849, 0.08827712, 1.206021, 1, 0, 0.6078432, 1,
1.327476, -1.503279, 2.023907, 1, 0, 0.6, 1,
1.330974, 0.8494341, 1.433652, 1, 0, 0.5921569, 1,
1.345448, 1.628895, 0.057701, 1, 0, 0.5882353, 1,
1.346877, 0.7162239, 1.205743, 1, 0, 0.5803922, 1,
1.349553, -0.2939672, -0.5866345, 1, 0, 0.5764706, 1,
1.351622, -1.380583, 2.476787, 1, 0, 0.5686275, 1,
1.354195, 2.600259, -0.4536721, 1, 0, 0.5647059, 1,
1.368335, -0.89328, 0.7348623, 1, 0, 0.5568628, 1,
1.374674, 1.048275, 1.460152, 1, 0, 0.5529412, 1,
1.383224, 2.220076, -1.086364, 1, 0, 0.5450981, 1,
1.383401, 0.4431709, 0.1362937, 1, 0, 0.5411765, 1,
1.384778, -0.1643074, 2.064799, 1, 0, 0.5333334, 1,
1.384819, -1.360548, 4.485944, 1, 0, 0.5294118, 1,
1.386356, 0.06489754, 2.148141, 1, 0, 0.5215687, 1,
1.394202, 0.1037472, 1.557973, 1, 0, 0.5176471, 1,
1.395132, 0.5114543, 1.199495, 1, 0, 0.509804, 1,
1.403824, 0.7988082, 0.454038, 1, 0, 0.5058824, 1,
1.404917, 1.873773, -1.213006, 1, 0, 0.4980392, 1,
1.412785, -2.56773, 2.275457, 1, 0, 0.4901961, 1,
1.430844, 1.84692, 2.215122, 1, 0, 0.4862745, 1,
1.436128, -0.4455258, 2.443319, 1, 0, 0.4784314, 1,
1.437891, -0.1067113, 0.1849913, 1, 0, 0.4745098, 1,
1.440195, 0.403941, 0.7924129, 1, 0, 0.4666667, 1,
1.462032, -0.1568757, 0.6950984, 1, 0, 0.4627451, 1,
1.470467, 1.040534, 1.174835, 1, 0, 0.454902, 1,
1.47343, 0.01537093, 1.94601, 1, 0, 0.4509804, 1,
1.47402, 1.104864, 0.07120039, 1, 0, 0.4431373, 1,
1.491305, -0.2673624, 0.7433611, 1, 0, 0.4392157, 1,
1.494093, 0.05673025, 2.168562, 1, 0, 0.4313726, 1,
1.513422, 1.231982, -0.2017564, 1, 0, 0.427451, 1,
1.515073, 0.3299436, 3.82568, 1, 0, 0.4196078, 1,
1.517311, -0.5387565, 2.255861, 1, 0, 0.4156863, 1,
1.522315, -0.3955646, 1.416946, 1, 0, 0.4078431, 1,
1.546981, 1.816201, 1.877622, 1, 0, 0.4039216, 1,
1.575846, -1.102071, 3.82536, 1, 0, 0.3960784, 1,
1.586133, -1.109302, 1.81176, 1, 0, 0.3882353, 1,
1.597809, -0.7967655, 4.635698, 1, 0, 0.3843137, 1,
1.601491, 1.619285, 0.8310069, 1, 0, 0.3764706, 1,
1.607008, 0.4020035, 0.4616899, 1, 0, 0.372549, 1,
1.611363, -2.074476, 1.442241, 1, 0, 0.3647059, 1,
1.642719, 2.001632, 0.6536987, 1, 0, 0.3607843, 1,
1.646223, -0.08555438, -0.1367026, 1, 0, 0.3529412, 1,
1.655073, -0.08187126, 2.335882, 1, 0, 0.3490196, 1,
1.667793, -1.157687, 2.983064, 1, 0, 0.3411765, 1,
1.67047, -0.7634894, 3.383911, 1, 0, 0.3372549, 1,
1.683661, -0.6653967, 3.488764, 1, 0, 0.3294118, 1,
1.684872, -0.997564, 2.31343, 1, 0, 0.3254902, 1,
1.685315, -0.337139, 2.645428, 1, 0, 0.3176471, 1,
1.686702, 0.08420905, 0.253192, 1, 0, 0.3137255, 1,
1.690361, 1.106191, 1.140903, 1, 0, 0.3058824, 1,
1.697522, 0.9037542, 2.014777, 1, 0, 0.2980392, 1,
1.70298, -1.515869, 2.379411, 1, 0, 0.2941177, 1,
1.715849, 1.380971, -0.9254096, 1, 0, 0.2862745, 1,
1.724554, -0.6963001, 2.154404, 1, 0, 0.282353, 1,
1.73178, -1.491968, 1.081167, 1, 0, 0.2745098, 1,
1.738672, 0.9091001, -1.100067, 1, 0, 0.2705882, 1,
1.75329, 0.481086, 2.59162, 1, 0, 0.2627451, 1,
1.755973, 0.5039206, 1.127755, 1, 0, 0.2588235, 1,
1.756137, -0.3015265, 2.591492, 1, 0, 0.2509804, 1,
1.7866, -1.007702, 3.322701, 1, 0, 0.2470588, 1,
1.789858, 0.38327, 0.2850892, 1, 0, 0.2392157, 1,
1.791034, -1.78826, 2.476655, 1, 0, 0.2352941, 1,
1.805901, -2.21866, 1.518518, 1, 0, 0.227451, 1,
1.81669, -1.17407, 3.499265, 1, 0, 0.2235294, 1,
1.823029, -1.143386, 2.177056, 1, 0, 0.2156863, 1,
1.823433, 1.837375, 0.2218024, 1, 0, 0.2117647, 1,
1.832355, 0.4976486, 2.747429, 1, 0, 0.2039216, 1,
1.835264, 0.007556925, 2.750385, 1, 0, 0.1960784, 1,
1.836141, 0.1675147, -0.0787662, 1, 0, 0.1921569, 1,
1.842767, 2.163973, -0.9449472, 1, 0, 0.1843137, 1,
1.844761, -1.730781, 1.961707, 1, 0, 0.1803922, 1,
1.898154, 0.2623454, 0.6536566, 1, 0, 0.172549, 1,
1.899309, 0.1654507, 1.996822, 1, 0, 0.1686275, 1,
1.915826, -1.029885, 2.923785, 1, 0, 0.1607843, 1,
1.941884, -0.2864581, 3.10486, 1, 0, 0.1568628, 1,
1.989901, -1.762245, 3.080851, 1, 0, 0.1490196, 1,
2.002835, -0.1947656, 0.8729674, 1, 0, 0.145098, 1,
2.003897, 2.008152, -0.444976, 1, 0, 0.1372549, 1,
2.053677, 0.5590861, 1.78713, 1, 0, 0.1333333, 1,
2.054904, -1.049814, 1.738768, 1, 0, 0.1254902, 1,
2.062194, -1.522257, 3.863414, 1, 0, 0.1215686, 1,
2.063352, -0.1174703, 1.232733, 1, 0, 0.1137255, 1,
2.1074, -1.625952, 1.526597, 1, 0, 0.1098039, 1,
2.119304, 0.6985851, 0.369791, 1, 0, 0.1019608, 1,
2.190271, 0.04242123, 0.8916649, 1, 0, 0.09411765, 1,
2.231141, 0.5456425, 1.799978, 1, 0, 0.09019608, 1,
2.246097, -1.112711, 2.964263, 1, 0, 0.08235294, 1,
2.253385, -1.201294, 1.599437, 1, 0, 0.07843138, 1,
2.267817, 1.246452, -0.4516182, 1, 0, 0.07058824, 1,
2.344856, 0.2004789, 0.8865046, 1, 0, 0.06666667, 1,
2.375823, 0.5800323, -0.779443, 1, 0, 0.05882353, 1,
2.414552, -1.767418, 2.092483, 1, 0, 0.05490196, 1,
2.474831, -0.9047059, 2.827075, 1, 0, 0.04705882, 1,
2.488021, -0.9470504, 3.16591, 1, 0, 0.04313726, 1,
2.507252, 0.08773225, 1.908758, 1, 0, 0.03529412, 1,
2.552049, -0.2309739, 2.067392, 1, 0, 0.03137255, 1,
2.6247, 0.4016364, 1.856072, 1, 0, 0.02352941, 1,
2.645347, -0.3879372, 1.388121, 1, 0, 0.01960784, 1,
2.777701, -0.02668645, 1.388122, 1, 0, 0.01176471, 1,
3.171868, 0.6396934, -1.094323, 1, 0, 0.007843138, 1
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
0.1667333, -4.46144, -6.631985, 0, -0.5, 0.5, 0.5,
0.1667333, -4.46144, -6.631985, 1, -0.5, 0.5, 0.5,
0.1667333, -4.46144, -6.631985, 1, 1.5, 0.5, 0.5,
0.1667333, -4.46144, -6.631985, 0, 1.5, 0.5, 0.5
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
-3.857142, 0.07485986, -6.631985, 0, -0.5, 0.5, 0.5,
-3.857142, 0.07485986, -6.631985, 1, -0.5, 0.5, 0.5,
-3.857142, 0.07485986, -6.631985, 1, 1.5, 0.5, 0.5,
-3.857142, 0.07485986, -6.631985, 0, 1.5, 0.5, 0.5
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
-3.857142, -4.46144, 0.2015119, 0, -0.5, 0.5, 0.5,
-3.857142, -4.46144, 0.2015119, 1, -0.5, 0.5, 0.5,
-3.857142, -4.46144, 0.2015119, 1, 1.5, 0.5, 0.5,
-3.857142, -4.46144, 0.2015119, 0, 1.5, 0.5, 0.5
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
-2, -3.414601, -5.055024,
3, -3.414601, -5.055024,
-2, -3.414601, -5.055024,
-2, -3.589074, -5.317851,
-1, -3.414601, -5.055024,
-1, -3.589074, -5.317851,
0, -3.414601, -5.055024,
0, -3.589074, -5.317851,
1, -3.414601, -5.055024,
1, -3.589074, -5.317851,
2, -3.414601, -5.055024,
2, -3.589074, -5.317851,
3, -3.414601, -5.055024,
3, -3.589074, -5.317851
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
-2, -3.93802, -5.843505, 0, -0.5, 0.5, 0.5,
-2, -3.93802, -5.843505, 1, -0.5, 0.5, 0.5,
-2, -3.93802, -5.843505, 1, 1.5, 0.5, 0.5,
-2, -3.93802, -5.843505, 0, 1.5, 0.5, 0.5,
-1, -3.93802, -5.843505, 0, -0.5, 0.5, 0.5,
-1, -3.93802, -5.843505, 1, -0.5, 0.5, 0.5,
-1, -3.93802, -5.843505, 1, 1.5, 0.5, 0.5,
-1, -3.93802, -5.843505, 0, 1.5, 0.5, 0.5,
0, -3.93802, -5.843505, 0, -0.5, 0.5, 0.5,
0, -3.93802, -5.843505, 1, -0.5, 0.5, 0.5,
0, -3.93802, -5.843505, 1, 1.5, 0.5, 0.5,
0, -3.93802, -5.843505, 0, 1.5, 0.5, 0.5,
1, -3.93802, -5.843505, 0, -0.5, 0.5, 0.5,
1, -3.93802, -5.843505, 1, -0.5, 0.5, 0.5,
1, -3.93802, -5.843505, 1, 1.5, 0.5, 0.5,
1, -3.93802, -5.843505, 0, 1.5, 0.5, 0.5,
2, -3.93802, -5.843505, 0, -0.5, 0.5, 0.5,
2, -3.93802, -5.843505, 1, -0.5, 0.5, 0.5,
2, -3.93802, -5.843505, 1, 1.5, 0.5, 0.5,
2, -3.93802, -5.843505, 0, 1.5, 0.5, 0.5,
3, -3.93802, -5.843505, 0, -0.5, 0.5, 0.5,
3, -3.93802, -5.843505, 1, -0.5, 0.5, 0.5,
3, -3.93802, -5.843505, 1, 1.5, 0.5, 0.5,
3, -3.93802, -5.843505, 0, 1.5, 0.5, 0.5
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
-2.928555, -3, -5.055024,
-2.928555, 3, -5.055024,
-2.928555, -3, -5.055024,
-3.083319, -3, -5.317851,
-2.928555, -2, -5.055024,
-3.083319, -2, -5.317851,
-2.928555, -1, -5.055024,
-3.083319, -1, -5.317851,
-2.928555, 0, -5.055024,
-3.083319, 0, -5.317851,
-2.928555, 1, -5.055024,
-3.083319, 1, -5.317851,
-2.928555, 2, -5.055024,
-3.083319, 2, -5.317851,
-2.928555, 3, -5.055024,
-3.083319, 3, -5.317851
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
-3.392848, -3, -5.843505, 0, -0.5, 0.5, 0.5,
-3.392848, -3, -5.843505, 1, -0.5, 0.5, 0.5,
-3.392848, -3, -5.843505, 1, 1.5, 0.5, 0.5,
-3.392848, -3, -5.843505, 0, 1.5, 0.5, 0.5,
-3.392848, -2, -5.843505, 0, -0.5, 0.5, 0.5,
-3.392848, -2, -5.843505, 1, -0.5, 0.5, 0.5,
-3.392848, -2, -5.843505, 1, 1.5, 0.5, 0.5,
-3.392848, -2, -5.843505, 0, 1.5, 0.5, 0.5,
-3.392848, -1, -5.843505, 0, -0.5, 0.5, 0.5,
-3.392848, -1, -5.843505, 1, -0.5, 0.5, 0.5,
-3.392848, -1, -5.843505, 1, 1.5, 0.5, 0.5,
-3.392848, -1, -5.843505, 0, 1.5, 0.5, 0.5,
-3.392848, 0, -5.843505, 0, -0.5, 0.5, 0.5,
-3.392848, 0, -5.843505, 1, -0.5, 0.5, 0.5,
-3.392848, 0, -5.843505, 1, 1.5, 0.5, 0.5,
-3.392848, 0, -5.843505, 0, 1.5, 0.5, 0.5,
-3.392848, 1, -5.843505, 0, -0.5, 0.5, 0.5,
-3.392848, 1, -5.843505, 1, -0.5, 0.5, 0.5,
-3.392848, 1, -5.843505, 1, 1.5, 0.5, 0.5,
-3.392848, 1, -5.843505, 0, 1.5, 0.5, 0.5,
-3.392848, 2, -5.843505, 0, -0.5, 0.5, 0.5,
-3.392848, 2, -5.843505, 1, -0.5, 0.5, 0.5,
-3.392848, 2, -5.843505, 1, 1.5, 0.5, 0.5,
-3.392848, 2, -5.843505, 0, 1.5, 0.5, 0.5,
-3.392848, 3, -5.843505, 0, -0.5, 0.5, 0.5,
-3.392848, 3, -5.843505, 1, -0.5, 0.5, 0.5,
-3.392848, 3, -5.843505, 1, 1.5, 0.5, 0.5,
-3.392848, 3, -5.843505, 0, 1.5, 0.5, 0.5
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
-2.928555, -3.414601, -4,
-2.928555, -3.414601, 4,
-2.928555, -3.414601, -4,
-3.083319, -3.589074, -4,
-2.928555, -3.414601, -2,
-3.083319, -3.589074, -2,
-2.928555, -3.414601, 0,
-3.083319, -3.589074, 0,
-2.928555, -3.414601, 2,
-3.083319, -3.589074, 2,
-2.928555, -3.414601, 4,
-3.083319, -3.589074, 4
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
-3.392848, -3.93802, -4, 0, -0.5, 0.5, 0.5,
-3.392848, -3.93802, -4, 1, -0.5, 0.5, 0.5,
-3.392848, -3.93802, -4, 1, 1.5, 0.5, 0.5,
-3.392848, -3.93802, -4, 0, 1.5, 0.5, 0.5,
-3.392848, -3.93802, -2, 0, -0.5, 0.5, 0.5,
-3.392848, -3.93802, -2, 1, -0.5, 0.5, 0.5,
-3.392848, -3.93802, -2, 1, 1.5, 0.5, 0.5,
-3.392848, -3.93802, -2, 0, 1.5, 0.5, 0.5,
-3.392848, -3.93802, 0, 0, -0.5, 0.5, 0.5,
-3.392848, -3.93802, 0, 1, -0.5, 0.5, 0.5,
-3.392848, -3.93802, 0, 1, 1.5, 0.5, 0.5,
-3.392848, -3.93802, 0, 0, 1.5, 0.5, 0.5,
-3.392848, -3.93802, 2, 0, -0.5, 0.5, 0.5,
-3.392848, -3.93802, 2, 1, -0.5, 0.5, 0.5,
-3.392848, -3.93802, 2, 1, 1.5, 0.5, 0.5,
-3.392848, -3.93802, 2, 0, 1.5, 0.5, 0.5,
-3.392848, -3.93802, 4, 0, -0.5, 0.5, 0.5,
-3.392848, -3.93802, 4, 1, -0.5, 0.5, 0.5,
-3.392848, -3.93802, 4, 1, 1.5, 0.5, 0.5,
-3.392848, -3.93802, 4, 0, 1.5, 0.5, 0.5
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
-2.928555, -3.414601, -5.055024,
-2.928555, 3.564321, -5.055024,
-2.928555, -3.414601, 5.458048,
-2.928555, 3.564321, 5.458048,
-2.928555, -3.414601, -5.055024,
-2.928555, -3.414601, 5.458048,
-2.928555, 3.564321, -5.055024,
-2.928555, 3.564321, 5.458048,
-2.928555, -3.414601, -5.055024,
3.262022, -3.414601, -5.055024,
-2.928555, -3.414601, 5.458048,
3.262022, -3.414601, 5.458048,
-2.928555, 3.564321, -5.055024,
3.262022, 3.564321, -5.055024,
-2.928555, 3.564321, 5.458048,
3.262022, 3.564321, 5.458048,
3.262022, -3.414601, -5.055024,
3.262022, 3.564321, -5.055024,
3.262022, -3.414601, 5.458048,
3.262022, 3.564321, 5.458048,
3.262022, -3.414601, -5.055024,
3.262022, -3.414601, 5.458048,
3.262022, 3.564321, -5.055024,
3.262022, 3.564321, 5.458048
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
var radius = 7.505292;
var distance = 33.39189;
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
mvMatrix.translate( -0.1667333, -0.07485986, -0.2015119 );
mvMatrix.scale( 1.310842, 1.162768, 0.7718837 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.39189);
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
methylarsonate_ammon<-read.table("methylarsonate_ammon.xyz", skip=1)
x<-methylarsonate_ammon$V2
y<-methylarsonate_ammon$V3
z<-methylarsonate_ammon$V4
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
13, 11, 2, 0, 0, 1, 1, 1,
1, 1, 1, 1, 0, 0, 1, 1,
5, 4, 1, 1, 0, 0, 1, 1,
4, 5, 1, 1, 0, 0, 1, 1,
6, 6, 1, 1, 0, 0, 1, 1,
6, 2, 1, 1, 0, 0, 1, 1,
6, 8, 1, 0, 0, 0, 1, 1,
3, 6, 1, 0, 0, 0, 1, 1,
8, 6, 1, 0, 0, 0, 1, 1,
11, 1, 1, 0, 0, 0, 1, 1,
12, 1, 1, 0, 0, 0, 1, 1,
7, 7, 1, 0, 0, 0, 1, 1,
7, 3, 1, 0, 0, 0, 1, 1,
7, 9, 1, 1, 1, 1, 1, 1,
9, 7, 1, 1, 1, 1, 1, 1,
2, 7, 1, 1, 1, 1, 1, 1,
1, 10, 1, 1, 1, 1, 1, 1,
10, 10, 1, 1, 1, 1, 1, 1
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
var radius = 10.27485;
var distance = 36.08997;
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
mvMatrix.translate( -7, -6, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.08997);
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
for (var i = 0; i < 18; i++) {
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