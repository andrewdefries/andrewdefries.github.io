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
-3.092845, -0.9223546, -3.00676, 1, 0, 0, 1,
-2.838879, -1.530048, -1.031875, 1, 0.007843138, 0, 1,
-2.838588, -1.323629, -1.61659, 1, 0.01176471, 0, 1,
-2.690731, -0.5218019, 0.09383062, 1, 0.01960784, 0, 1,
-2.563797, -1.707733, -2.540109, 1, 0.02352941, 0, 1,
-2.422476, 0.4402369, -1.914894, 1, 0.03137255, 0, 1,
-2.403059, -0.6293111, -0.8360094, 1, 0.03529412, 0, 1,
-2.390669, 0.2972611, -1.170789, 1, 0.04313726, 0, 1,
-2.320457, -0.09176269, -0.7389435, 1, 0.04705882, 0, 1,
-2.290923, -1.682508, -2.775485, 1, 0.05490196, 0, 1,
-2.278712, -1.610031, -3.673425, 1, 0.05882353, 0, 1,
-2.26663, 0.7463815, -1.24276, 1, 0.06666667, 0, 1,
-2.241695, -0.5205141, -1.74277, 1, 0.07058824, 0, 1,
-2.21313, 0.5128353, -0.360771, 1, 0.07843138, 0, 1,
-2.172059, 0.782106, -1.620276, 1, 0.08235294, 0, 1,
-2.126695, -0.2503614, -3.162697, 1, 0.09019608, 0, 1,
-2.115199, 0.4203927, -2.381845, 1, 0.09411765, 0, 1,
-2.014468, 0.2987727, -0.1523556, 1, 0.1019608, 0, 1,
-1.964378, 1.272345, 0.6074132, 1, 0.1098039, 0, 1,
-1.936394, 0.9702056, -1.383498, 1, 0.1137255, 0, 1,
-1.867185, -1.831461, -1.365406, 1, 0.1215686, 0, 1,
-1.864391, 0.1104084, -0.7260971, 1, 0.1254902, 0, 1,
-1.842442, -0.4154322, -2.544678, 1, 0.1333333, 0, 1,
-1.819944, -0.7468087, 0.8440604, 1, 0.1372549, 0, 1,
-1.806435, 0.7550367, -3.055812, 1, 0.145098, 0, 1,
-1.8041, -0.8692046, -1.856025, 1, 0.1490196, 0, 1,
-1.787589, -0.8260417, -2.329494, 1, 0.1568628, 0, 1,
-1.780201, -1.107438, -3.181846, 1, 0.1607843, 0, 1,
-1.779264, 0.6062421, 0.1567778, 1, 0.1686275, 0, 1,
-1.767279, -1.295051, -3.231921, 1, 0.172549, 0, 1,
-1.748308, 0.4686543, -1.934742, 1, 0.1803922, 0, 1,
-1.705405, -1.507256, -1.071134, 1, 0.1843137, 0, 1,
-1.699262, -0.9626419, -1.950254, 1, 0.1921569, 0, 1,
-1.69858, -1.354445, -1.982178, 1, 0.1960784, 0, 1,
-1.696212, 0.860953, -1.019252, 1, 0.2039216, 0, 1,
-1.687169, -1.157003, -2.669962, 1, 0.2117647, 0, 1,
-1.681099, -0.7897248, -2.09843, 1, 0.2156863, 0, 1,
-1.677213, 0.2370518, -1.506061, 1, 0.2235294, 0, 1,
-1.656432, 0.07017911, 0.3123536, 1, 0.227451, 0, 1,
-1.651426, -0.6502829, -2.532416, 1, 0.2352941, 0, 1,
-1.648774, -2.552406, -3.221799, 1, 0.2392157, 0, 1,
-1.643124, -1.357116, -0.8267589, 1, 0.2470588, 0, 1,
-1.641152, 0.6689717, -0.7024779, 1, 0.2509804, 0, 1,
-1.639956, -0.1959018, -1.002331, 1, 0.2588235, 0, 1,
-1.639783, 0.8675121, 0.6598408, 1, 0.2627451, 0, 1,
-1.638643, -0.4407001, -2.552128, 1, 0.2705882, 0, 1,
-1.625938, -0.01930637, -2.028622, 1, 0.2745098, 0, 1,
-1.624297, 0.9430828, -1.602061, 1, 0.282353, 0, 1,
-1.622363, -0.2949743, -2.577594, 1, 0.2862745, 0, 1,
-1.618913, 1.232324, -1.445753, 1, 0.2941177, 0, 1,
-1.549404, 0.9487537, -2.217558, 1, 0.3019608, 0, 1,
-1.541707, -0.3257942, -1.69622, 1, 0.3058824, 0, 1,
-1.536083, -0.0184233, -2.173802, 1, 0.3137255, 0, 1,
-1.52623, 0.4656615, -1.17464, 1, 0.3176471, 0, 1,
-1.51636, -1.562471, -2.844035, 1, 0.3254902, 0, 1,
-1.507217, 0.08112293, 0.5719109, 1, 0.3294118, 0, 1,
-1.500231, -1.086719, -3.040627, 1, 0.3372549, 0, 1,
-1.495075, 0.08667415, -1.364894, 1, 0.3411765, 0, 1,
-1.485718, -0.06742626, -2.82208, 1, 0.3490196, 0, 1,
-1.470187, 0.1342571, -1.94777, 1, 0.3529412, 0, 1,
-1.438282, -0.1169248, -2.358655, 1, 0.3607843, 0, 1,
-1.424098, -0.2918156, -2.205477, 1, 0.3647059, 0, 1,
-1.42366, 0.7195344, -2.303371, 1, 0.372549, 0, 1,
-1.412753, 0.5086774, -0.7454585, 1, 0.3764706, 0, 1,
-1.412007, -2.454683, -3.866444, 1, 0.3843137, 0, 1,
-1.408218, 1.509179, -1.12411, 1, 0.3882353, 0, 1,
-1.402951, 0.7600144, 0.1420932, 1, 0.3960784, 0, 1,
-1.397497, 0.2354778, -0.3559442, 1, 0.4039216, 0, 1,
-1.386204, -0.9355335, -0.9751785, 1, 0.4078431, 0, 1,
-1.383111, -0.0001820846, -2.628104, 1, 0.4156863, 0, 1,
-1.373504, -0.6525137, -2.903497, 1, 0.4196078, 0, 1,
-1.358822, -0.9042346, -1.408557, 1, 0.427451, 0, 1,
-1.357651, -0.5017444, -3.682, 1, 0.4313726, 0, 1,
-1.349798, 2.366917, 0.9411627, 1, 0.4392157, 0, 1,
-1.349352, 1.161211, -1.149456, 1, 0.4431373, 0, 1,
-1.348177, 0.1080579, -0.6547651, 1, 0.4509804, 0, 1,
-1.342984, 0.2314959, -0.1655875, 1, 0.454902, 0, 1,
-1.319938, 0.0221317, -2.690901, 1, 0.4627451, 0, 1,
-1.302812, -0.3822351, -2.701141, 1, 0.4666667, 0, 1,
-1.298444, -1.399443, -3.394277, 1, 0.4745098, 0, 1,
-1.285666, -0.965354, -1.455549, 1, 0.4784314, 0, 1,
-1.276126, 1.800698, 0.1174728, 1, 0.4862745, 0, 1,
-1.275776, -0.4162564, -2.225333, 1, 0.4901961, 0, 1,
-1.275457, -0.04508506, -2.547063, 1, 0.4980392, 0, 1,
-1.275, 0.1982025, -2.306128, 1, 0.5058824, 0, 1,
-1.264735, -1.299273, -1.703103, 1, 0.509804, 0, 1,
-1.258811, 0.7753755, 0.01546642, 1, 0.5176471, 0, 1,
-1.246295, -0.7130366, -2.118034, 1, 0.5215687, 0, 1,
-1.241281, -0.3220831, -2.297633, 1, 0.5294118, 0, 1,
-1.235887, 0.8123574, -0.8936865, 1, 0.5333334, 0, 1,
-1.231328, 0.8638927, -2.057689, 1, 0.5411765, 0, 1,
-1.229677, -1.28666, -4.020876, 1, 0.5450981, 0, 1,
-1.219391, 0.9603835, 0.7697536, 1, 0.5529412, 0, 1,
-1.218352, -0.2809528, -1.245131, 1, 0.5568628, 0, 1,
-1.215631, -0.9285989, -3.078457, 1, 0.5647059, 0, 1,
-1.212798, -0.316489, -3.410084, 1, 0.5686275, 0, 1,
-1.198922, 0.8440903, -1.867764, 1, 0.5764706, 0, 1,
-1.196503, -0.4773181, -0.28831, 1, 0.5803922, 0, 1,
-1.191958, 0.3838564, -1.717418, 1, 0.5882353, 0, 1,
-1.188451, -0.1017743, -2.488265, 1, 0.5921569, 0, 1,
-1.187568, -0.9261869, -3.396267, 1, 0.6, 0, 1,
-1.187542, 1.623903, 0.01572705, 1, 0.6078432, 0, 1,
-1.183893, -0.9179509, -3.745649, 1, 0.6117647, 0, 1,
-1.159192, -0.4665327, -1.839382, 1, 0.6196079, 0, 1,
-1.135591, -2.292824, -1.997163, 1, 0.6235294, 0, 1,
-1.131714, -0.9228302, -1.847153, 1, 0.6313726, 0, 1,
-1.125031, -0.005681745, -1.482404, 1, 0.6352941, 0, 1,
-1.119738, -1.10881, -2.143295, 1, 0.6431373, 0, 1,
-1.111294, 1.630299, -0.5763107, 1, 0.6470588, 0, 1,
-1.105468, -0.6170521, -1.84949, 1, 0.654902, 0, 1,
-1.094655, -1.622326, -2.230192, 1, 0.6588235, 0, 1,
-1.081588, -0.2452854, -1.402865, 1, 0.6666667, 0, 1,
-1.080995, 0.9067312, -2.22638, 1, 0.6705883, 0, 1,
-1.076693, -0.246527, -0.8143673, 1, 0.6784314, 0, 1,
-1.075538, -0.3685504, 0.03813521, 1, 0.682353, 0, 1,
-1.07391, -0.754691, -4.058269, 1, 0.6901961, 0, 1,
-1.073601, 1.722484, -0.9298167, 1, 0.6941177, 0, 1,
-1.067831, -0.5688223, -2.331948, 1, 0.7019608, 0, 1,
-1.062223, -0.316581, -0.9159119, 1, 0.7098039, 0, 1,
-1.060694, -0.5551636, -0.5359796, 1, 0.7137255, 0, 1,
-1.05356, 0.383197, -0.6997952, 1, 0.7215686, 0, 1,
-1.049491, 1.243967, -0.7399305, 1, 0.7254902, 0, 1,
-1.046383, -0.164064, -1.382028, 1, 0.7333333, 0, 1,
-1.040486, 1.092267, 0.7965494, 1, 0.7372549, 0, 1,
-1.038034, -0.02949467, -1.370499, 1, 0.7450981, 0, 1,
-1.02992, -1.974424, -3.439611, 1, 0.7490196, 0, 1,
-1.029054, 0.7289623, -2.090922, 1, 0.7568628, 0, 1,
-1.028869, -0.3850894, -1.796265, 1, 0.7607843, 0, 1,
-1.026513, -0.7725438, -3.375176, 1, 0.7686275, 0, 1,
-1.016254, -0.1775689, -2.586557, 1, 0.772549, 0, 1,
-1.014864, -0.05917184, -1.067031, 1, 0.7803922, 0, 1,
-1.011647, -0.4570344, -2.235462, 1, 0.7843137, 0, 1,
-1.002743, -0.4917367, -2.153976, 1, 0.7921569, 0, 1,
-0.9981172, 0.3645186, -0.9119602, 1, 0.7960784, 0, 1,
-0.9949932, -1.0285, -3.257659, 1, 0.8039216, 0, 1,
-0.9935144, 0.06299783, -3.184082, 1, 0.8117647, 0, 1,
-0.9899824, -1.460663, -3.338322, 1, 0.8156863, 0, 1,
-0.9891161, 0.2151555, -1.106825, 1, 0.8235294, 0, 1,
-0.9867814, -0.8444412, -2.757716, 1, 0.827451, 0, 1,
-0.9803043, 0.458059, 0.1305195, 1, 0.8352941, 0, 1,
-0.9741777, -0.07554287, -1.756007, 1, 0.8392157, 0, 1,
-0.9662269, 0.893496, -0.3229284, 1, 0.8470588, 0, 1,
-0.9651383, 1.292989, 0.5440189, 1, 0.8509804, 0, 1,
-0.9646437, 1.055904, 0.1612973, 1, 0.8588235, 0, 1,
-0.9642382, -1.37786, -1.866355, 1, 0.8627451, 0, 1,
-0.9639395, -0.3342775, -1.743219, 1, 0.8705882, 0, 1,
-0.9616805, 1.843045, -0.6460341, 1, 0.8745098, 0, 1,
-0.9611049, -0.99506, -1.094053, 1, 0.8823529, 0, 1,
-0.9599888, 0.6302956, 0.4914241, 1, 0.8862745, 0, 1,
-0.9588141, -0.9907736, -2.576455, 1, 0.8941177, 0, 1,
-0.9385986, 1.319209, -0.911979, 1, 0.8980392, 0, 1,
-0.9330962, -0.2016763, -1.908264, 1, 0.9058824, 0, 1,
-0.9327624, -1.213867, -2.755176, 1, 0.9137255, 0, 1,
-0.925602, 0.3406574, -2.282986, 1, 0.9176471, 0, 1,
-0.9192503, -0.4543923, -0.8087124, 1, 0.9254902, 0, 1,
-0.897194, -1.714135, -2.718806, 1, 0.9294118, 0, 1,
-0.8967924, 0.2628458, -1.327222, 1, 0.9372549, 0, 1,
-0.8936865, -0.6973261, -2.615387, 1, 0.9411765, 0, 1,
-0.8932973, 0.8984749, -1.68759, 1, 0.9490196, 0, 1,
-0.8925225, -2.045524, -1.993021, 1, 0.9529412, 0, 1,
-0.8883522, 1.025878, 0.2364252, 1, 0.9607843, 0, 1,
-0.8880901, 0.1684202, 0.8564836, 1, 0.9647059, 0, 1,
-0.8836937, -2.688803, -4.752661, 1, 0.972549, 0, 1,
-0.8807293, 0.4396663, -1.74599, 1, 0.9764706, 0, 1,
-0.8787746, -0.4403707, -1.963901, 1, 0.9843137, 0, 1,
-0.8766143, 1.041888, 0.3489751, 1, 0.9882353, 0, 1,
-0.8753876, -0.7898123, -4.021057, 1, 0.9960784, 0, 1,
-0.8732102, 0.6013582, -1.727217, 0.9960784, 1, 0, 1,
-0.8668149, 1.382666, -0.5868381, 0.9921569, 1, 0, 1,
-0.8649035, 0.8055454, -0.8006855, 0.9843137, 1, 0, 1,
-0.8644218, 0.5713652, -1.097071, 0.9803922, 1, 0, 1,
-0.8631554, -0.1515834, -1.634592, 0.972549, 1, 0, 1,
-0.8617679, -1.328701, -3.859486, 0.9686275, 1, 0, 1,
-0.856872, 0.8469805, -2.482658, 0.9607843, 1, 0, 1,
-0.8540825, 1.237499, 0.308677, 0.9568627, 1, 0, 1,
-0.8463427, -0.3164284, -1.093955, 0.9490196, 1, 0, 1,
-0.8395804, -1.690167, -2.804197, 0.945098, 1, 0, 1,
-0.8392818, -0.4185363, -3.531674, 0.9372549, 1, 0, 1,
-0.834828, -1.130363, -2.413534, 0.9333333, 1, 0, 1,
-0.8330798, -1.235345, -1.010105, 0.9254902, 1, 0, 1,
-0.8262262, 0.7139665, -2.507251, 0.9215686, 1, 0, 1,
-0.8233662, -0.8576748, -4.643915, 0.9137255, 1, 0, 1,
-0.8232754, 0.2626471, 0.4582371, 0.9098039, 1, 0, 1,
-0.8219012, -1.015964, -2.151342, 0.9019608, 1, 0, 1,
-0.8112279, -0.7149186, -2.75712, 0.8941177, 1, 0, 1,
-0.8087446, 0.9954819, -2.698653, 0.8901961, 1, 0, 1,
-0.8058329, -0.1981075, -2.536358, 0.8823529, 1, 0, 1,
-0.797098, 0.1721278, -1.957472, 0.8784314, 1, 0, 1,
-0.783577, -0.8204993, -0.5179337, 0.8705882, 1, 0, 1,
-0.7831989, 0.3361077, -0.02529679, 0.8666667, 1, 0, 1,
-0.7800882, -0.004792662, -0.3165357, 0.8588235, 1, 0, 1,
-0.7759745, 0.8035713, -2.405367, 0.854902, 1, 0, 1,
-0.7730491, 1.606549, -1.625789, 0.8470588, 1, 0, 1,
-0.7707375, 1.872183, 1.766615, 0.8431373, 1, 0, 1,
-0.7705113, -0.4442754, -2.501119, 0.8352941, 1, 0, 1,
-0.7680687, 1.919217, -1.077671, 0.8313726, 1, 0, 1,
-0.761459, -0.2350058, -0.3725532, 0.8235294, 1, 0, 1,
-0.7599084, 1.339301, -0.3828305, 0.8196079, 1, 0, 1,
-0.7570738, -0.8028569, -3.645419, 0.8117647, 1, 0, 1,
-0.756873, -1.777465, -4.717316, 0.8078431, 1, 0, 1,
-0.7567847, 1.960042, 0.6381816, 0.8, 1, 0, 1,
-0.7556533, -1.157619, -3.17631, 0.7921569, 1, 0, 1,
-0.7550337, -1.745629, -1.869846, 0.7882353, 1, 0, 1,
-0.7522077, -1.318816, -2.492982, 0.7803922, 1, 0, 1,
-0.7480052, -1.050892, -1.779094, 0.7764706, 1, 0, 1,
-0.7420841, 0.1813992, -1.238277, 0.7686275, 1, 0, 1,
-0.7418094, -0.8356419, -3.14732, 0.7647059, 1, 0, 1,
-0.740982, 0.6077676, -2.064347, 0.7568628, 1, 0, 1,
-0.7371062, -0.03850296, -0.6935613, 0.7529412, 1, 0, 1,
-0.7370535, 1.298667, 1.08577, 0.7450981, 1, 0, 1,
-0.7331889, 0.5144794, -2.499602, 0.7411765, 1, 0, 1,
-0.7193906, 2.453228, -0.9161363, 0.7333333, 1, 0, 1,
-0.7045475, 0.6091756, -2.135222, 0.7294118, 1, 0, 1,
-0.7030215, -0.7966474, -2.404515, 0.7215686, 1, 0, 1,
-0.7008342, -2.165504, -4.229202, 0.7176471, 1, 0, 1,
-0.6973447, -0.3395643, -1.961632, 0.7098039, 1, 0, 1,
-0.6917596, 0.8065798, -0.4096519, 0.7058824, 1, 0, 1,
-0.6881803, 0.5047289, 0.8723644, 0.6980392, 1, 0, 1,
-0.6864763, -0.4173389, -4.235971, 0.6901961, 1, 0, 1,
-0.6832506, -2.671319, -3.1252, 0.6862745, 1, 0, 1,
-0.6815992, -0.5390547, -4.097498, 0.6784314, 1, 0, 1,
-0.676989, -0.8717195, -2.739169, 0.6745098, 1, 0, 1,
-0.674731, -1.090544, -2.863322, 0.6666667, 1, 0, 1,
-0.6742591, -0.6668949, -3.440985, 0.6627451, 1, 0, 1,
-0.6713364, 0.2634412, -2.039126, 0.654902, 1, 0, 1,
-0.667361, -0.9094099, -2.782757, 0.6509804, 1, 0, 1,
-0.660786, 1.457676, -1.219442, 0.6431373, 1, 0, 1,
-0.6589169, -1.165313, 0.5451112, 0.6392157, 1, 0, 1,
-0.6575539, -0.01233516, -2.190635, 0.6313726, 1, 0, 1,
-0.655586, -0.9137989, -1.694997, 0.627451, 1, 0, 1,
-0.6554962, -1.213225, -1.785033, 0.6196079, 1, 0, 1,
-0.6529413, 0.2486078, -3.207615, 0.6156863, 1, 0, 1,
-0.6457014, 0.05660468, -0.3934393, 0.6078432, 1, 0, 1,
-0.6394842, 0.3573768, -1.085338, 0.6039216, 1, 0, 1,
-0.6361178, -1.333538, -2.895092, 0.5960785, 1, 0, 1,
-0.6305348, 1.037883, 0.2940999, 0.5882353, 1, 0, 1,
-0.6266829, 0.6829265, -1.87682, 0.5843138, 1, 0, 1,
-0.6245443, 1.658391, 0.1531831, 0.5764706, 1, 0, 1,
-0.6215412, -0.7095114, -2.67376, 0.572549, 1, 0, 1,
-0.6208534, 0.6744658, -0.3743882, 0.5647059, 1, 0, 1,
-0.6187866, 0.7664985, -0.7619826, 0.5607843, 1, 0, 1,
-0.6162513, -0.2654302, -2.853081, 0.5529412, 1, 0, 1,
-0.6154011, -0.7737928, -1.136, 0.5490196, 1, 0, 1,
-0.6143184, -1.02745, -0.7493259, 0.5411765, 1, 0, 1,
-0.6138864, 1.362321, -0.2183039, 0.5372549, 1, 0, 1,
-0.6136141, 0.3771698, -2.06505, 0.5294118, 1, 0, 1,
-0.6131752, 0.3479507, -3.213163, 0.5254902, 1, 0, 1,
-0.6073039, 2.221561, -0.4797179, 0.5176471, 1, 0, 1,
-0.6039944, -0.4690822, -1.855982, 0.5137255, 1, 0, 1,
-0.6036296, -0.01021579, -3.177033, 0.5058824, 1, 0, 1,
-0.6032617, -0.3919792, -1.302215, 0.5019608, 1, 0, 1,
-0.6022585, 1.685388, 0.1496225, 0.4941176, 1, 0, 1,
-0.5998366, -0.144097, -2.940931, 0.4862745, 1, 0, 1,
-0.5990868, -0.1236305, -2.037095, 0.4823529, 1, 0, 1,
-0.5981283, 1.197327, -0.2154526, 0.4745098, 1, 0, 1,
-0.5980726, 0.6981125, -1.264274, 0.4705882, 1, 0, 1,
-0.5973261, -1.58831, -2.273693, 0.4627451, 1, 0, 1,
-0.5933895, -0.7377813, -2.268661, 0.4588235, 1, 0, 1,
-0.5920959, -2.085482, -2.400719, 0.4509804, 1, 0, 1,
-0.5873261, -0.208596, -2.403581, 0.4470588, 1, 0, 1,
-0.5866839, -1.938564, -3.110372, 0.4392157, 1, 0, 1,
-0.583339, -0.118539, -0.8653306, 0.4352941, 1, 0, 1,
-0.5828674, 0.04877227, -1.703017, 0.427451, 1, 0, 1,
-0.5808814, -0.4474774, -2.266581, 0.4235294, 1, 0, 1,
-0.5730857, 0.2408233, -1.320473, 0.4156863, 1, 0, 1,
-0.5695555, -1.187057, -4.326584, 0.4117647, 1, 0, 1,
-0.5689517, -1.370549, -3.112928, 0.4039216, 1, 0, 1,
-0.5624105, -0.4230091, -3.649065, 0.3960784, 1, 0, 1,
-0.5593892, 1.045896, 0.02308629, 0.3921569, 1, 0, 1,
-0.5588974, 0.487741, -2.5087, 0.3843137, 1, 0, 1,
-0.5580085, 0.2758224, -0.224226, 0.3803922, 1, 0, 1,
-0.5531845, -1.194528, -2.314603, 0.372549, 1, 0, 1,
-0.5528037, 0.149447, -0.6416077, 0.3686275, 1, 0, 1,
-0.5525265, -0.7047162, -1.965024, 0.3607843, 1, 0, 1,
-0.5505611, 1.362117, 0.9899631, 0.3568628, 1, 0, 1,
-0.549419, -1.34209, -1.93998, 0.3490196, 1, 0, 1,
-0.5471565, 0.1457779, -1.514642, 0.345098, 1, 0, 1,
-0.5464216, -0.1273587, -3.716644, 0.3372549, 1, 0, 1,
-0.5418589, -0.2034203, -1.951434, 0.3333333, 1, 0, 1,
-0.5354875, 0.816848, -0.5780557, 0.3254902, 1, 0, 1,
-0.5350801, -1.132154, -1.695984, 0.3215686, 1, 0, 1,
-0.529566, -1.593181, -2.77947, 0.3137255, 1, 0, 1,
-0.5270073, 0.1071541, -2.410148, 0.3098039, 1, 0, 1,
-0.520136, 0.1217374, -2.019334, 0.3019608, 1, 0, 1,
-0.5185356, 1.064538, -1.019907, 0.2941177, 1, 0, 1,
-0.5165996, 1.554749, -1.195035, 0.2901961, 1, 0, 1,
-0.5153643, 0.3574131, -1.561627, 0.282353, 1, 0, 1,
-0.5116594, 1.173432, 0.628829, 0.2784314, 1, 0, 1,
-0.5093228, -0.2653852, -1.71558, 0.2705882, 1, 0, 1,
-0.5018489, -1.693265, -1.980732, 0.2666667, 1, 0, 1,
-0.5015261, 1.826691, 0.230874, 0.2588235, 1, 0, 1,
-0.5012676, -0.01392351, -1.789205, 0.254902, 1, 0, 1,
-0.4965595, 1.101253, 1.230254, 0.2470588, 1, 0, 1,
-0.4901337, -1.514932, -4.541131, 0.2431373, 1, 0, 1,
-0.4887399, -0.8509303, -1.435168, 0.2352941, 1, 0, 1,
-0.4857863, 0.5568513, 0.9327217, 0.2313726, 1, 0, 1,
-0.4853995, 1.88791, -1.199843, 0.2235294, 1, 0, 1,
-0.4834918, 1.385681, -1.809647, 0.2196078, 1, 0, 1,
-0.4819122, -0.5601307, -3.621658, 0.2117647, 1, 0, 1,
-0.480363, -1.083386, -3.137068, 0.2078431, 1, 0, 1,
-0.4783804, -0.7914092, -2.242841, 0.2, 1, 0, 1,
-0.4765193, 0.0843814, -3.733511, 0.1921569, 1, 0, 1,
-0.473987, -1.113362, -1.930561, 0.1882353, 1, 0, 1,
-0.470143, 1.23769, -1.289167, 0.1803922, 1, 0, 1,
-0.4669287, -1.107415, -3.613804, 0.1764706, 1, 0, 1,
-0.4561763, -1.23301, -2.702634, 0.1686275, 1, 0, 1,
-0.4547844, 0.7944627, 0.5350423, 0.1647059, 1, 0, 1,
-0.4520606, 0.2891955, -0.02625762, 0.1568628, 1, 0, 1,
-0.4498348, -0.6451563, -2.112452, 0.1529412, 1, 0, 1,
-0.4427799, 0.9506087, -1.11418, 0.145098, 1, 0, 1,
-0.4374197, -0.7956685, -1.610915, 0.1411765, 1, 0, 1,
-0.4373371, 1.068538, -0.5628017, 0.1333333, 1, 0, 1,
-0.4339876, 1.164288, -1.70808, 0.1294118, 1, 0, 1,
-0.4291338, 0.7854358, -1.3654, 0.1215686, 1, 0, 1,
-0.4267405, 1.426594, -0.1672713, 0.1176471, 1, 0, 1,
-0.4246457, 0.6816556, -0.7245997, 0.1098039, 1, 0, 1,
-0.4227777, 0.9224544, -1.028974, 0.1058824, 1, 0, 1,
-0.4181406, 1.897479, -0.1817317, 0.09803922, 1, 0, 1,
-0.4163022, -1.389182, -1.291607, 0.09019608, 1, 0, 1,
-0.4146233, -1.045288, -2.780494, 0.08627451, 1, 0, 1,
-0.4130082, -1.143364, -3.956255, 0.07843138, 1, 0, 1,
-0.4109485, 1.523392, -0.6371988, 0.07450981, 1, 0, 1,
-0.4060862, -0.5224671, -2.137336, 0.06666667, 1, 0, 1,
-0.4032587, 1.035967, -0.720126, 0.0627451, 1, 0, 1,
-0.3973035, -0.1750588, -1.959625, 0.05490196, 1, 0, 1,
-0.3960316, 0.1495647, -1.432956, 0.05098039, 1, 0, 1,
-0.3954984, 1.778296, -0.4044392, 0.04313726, 1, 0, 1,
-0.3942161, -0.2814474, -1.436683, 0.03921569, 1, 0, 1,
-0.3942045, -0.0830412, -2.343902, 0.03137255, 1, 0, 1,
-0.3939885, 0.4592813, -2.833691, 0.02745098, 1, 0, 1,
-0.3908463, -0.1198313, -2.064635, 0.01960784, 1, 0, 1,
-0.3895746, -0.9535373, -1.237566, 0.01568628, 1, 0, 1,
-0.3873758, -0.4607248, -2.064552, 0.007843138, 1, 0, 1,
-0.3854589, -0.694022, -1.776981, 0.003921569, 1, 0, 1,
-0.3831738, -0.5052888, -0.3478236, 0, 1, 0.003921569, 1,
-0.3827376, -0.8051392, -1.709966, 0, 1, 0.01176471, 1,
-0.3812757, -0.7907248, -3.864823, 0, 1, 0.01568628, 1,
-0.3802416, 1.290062, -0.234925, 0, 1, 0.02352941, 1,
-0.3701344, 0.4115322, -0.1031737, 0, 1, 0.02745098, 1,
-0.369104, 1.084129, -1.514803, 0, 1, 0.03529412, 1,
-0.3658279, -1.251372, -3.295194, 0, 1, 0.03921569, 1,
-0.3648188, 0.7033818, -1.863571, 0, 1, 0.04705882, 1,
-0.3625613, 0.7206518, 0.6700983, 0, 1, 0.05098039, 1,
-0.3597119, -0.3953605, -1.415856, 0, 1, 0.05882353, 1,
-0.3591329, 2.066193, -0.06706662, 0, 1, 0.0627451, 1,
-0.3568266, 0.3434444, -1.610665, 0, 1, 0.07058824, 1,
-0.3548046, -0.703988, -1.7206, 0, 1, 0.07450981, 1,
-0.3534078, 0.3110466, -1.277501, 0, 1, 0.08235294, 1,
-0.3487346, -0.3591156, -2.20997, 0, 1, 0.08627451, 1,
-0.3476489, 0.1901398, -0.1745369, 0, 1, 0.09411765, 1,
-0.3453764, 1.72482, 0.2890464, 0, 1, 0.1019608, 1,
-0.3435296, -0.119638, -2.334512, 0, 1, 0.1058824, 1,
-0.3430557, -0.6177927, -1.534068, 0, 1, 0.1137255, 1,
-0.3413162, -0.2821178, -4.73769, 0, 1, 0.1176471, 1,
-0.3406542, -0.7832962, -2.753469, 0, 1, 0.1254902, 1,
-0.3393106, -0.3236444, -3.636128, 0, 1, 0.1294118, 1,
-0.3386886, -1.383961, -3.504976, 0, 1, 0.1372549, 1,
-0.3385611, 0.4502822, -1.772487, 0, 1, 0.1411765, 1,
-0.3380927, -0.8684673, -2.360785, 0, 1, 0.1490196, 1,
-0.335986, -0.7165639, -1.32469, 0, 1, 0.1529412, 1,
-0.3348465, 0.2495797, -1.956521, 0, 1, 0.1607843, 1,
-0.3318828, -1.755027, -2.874184, 0, 1, 0.1647059, 1,
-0.3303802, -0.4988582, -4.643035, 0, 1, 0.172549, 1,
-0.3295727, 1.643709, -0.7026364, 0, 1, 0.1764706, 1,
-0.3289019, 0.5286149, -1.320996, 0, 1, 0.1843137, 1,
-0.3253579, 0.8225478, -1.026586, 0, 1, 0.1882353, 1,
-0.3232061, -1.016972, -2.633377, 0, 1, 0.1960784, 1,
-0.3161752, 1.309887, -0.1075551, 0, 1, 0.2039216, 1,
-0.3148955, -1.825703, -3.846368, 0, 1, 0.2078431, 1,
-0.3081244, -0.2463875, -2.095048, 0, 1, 0.2156863, 1,
-0.3068312, -1.638522, -2.755729, 0, 1, 0.2196078, 1,
-0.3066481, 1.632475, 0.7996188, 0, 1, 0.227451, 1,
-0.301733, 0.0541664, -2.775892, 0, 1, 0.2313726, 1,
-0.3008339, -0.9768736, -2.772189, 0, 1, 0.2392157, 1,
-0.2995921, 0.6753773, 0.1500953, 0, 1, 0.2431373, 1,
-0.2968538, -0.2026345, -1.35624, 0, 1, 0.2509804, 1,
-0.2931275, 2.055872, 0.05301972, 0, 1, 0.254902, 1,
-0.2921199, -1.420677, -2.566776, 0, 1, 0.2627451, 1,
-0.2900105, -0.5081039, -2.078524, 0, 1, 0.2666667, 1,
-0.2870864, -0.4548566, -1.996334, 0, 1, 0.2745098, 1,
-0.2862702, 1.075985, -0.6007668, 0, 1, 0.2784314, 1,
-0.2861815, -0.8340965, -3.374654, 0, 1, 0.2862745, 1,
-0.2845784, 1.772177, 1.563712, 0, 1, 0.2901961, 1,
-0.283468, 0.4433831, 0.1715843, 0, 1, 0.2980392, 1,
-0.2778685, 0.5903292, -2.031604, 0, 1, 0.3058824, 1,
-0.273388, 0.5372186, -1.480062, 0, 1, 0.3098039, 1,
-0.2696729, -0.6163422, -2.061324, 0, 1, 0.3176471, 1,
-0.2648541, -0.7823738, -2.453241, 0, 1, 0.3215686, 1,
-0.251992, 0.4500835, -1.156621, 0, 1, 0.3294118, 1,
-0.2469181, -0.02766778, -1.90864, 0, 1, 0.3333333, 1,
-0.2464381, 0.9817471, -0.4515193, 0, 1, 0.3411765, 1,
-0.2439552, -0.7103587, -3.316494, 0, 1, 0.345098, 1,
-0.2432331, 0.280553, -0.875461, 0, 1, 0.3529412, 1,
-0.2405907, -0.5818949, -3.686569, 0, 1, 0.3568628, 1,
-0.2380076, -0.1474787, -1.151551, 0, 1, 0.3647059, 1,
-0.2377844, -1.998941, -3.746696, 0, 1, 0.3686275, 1,
-0.2360539, -1.885258, -3.749185, 0, 1, 0.3764706, 1,
-0.2351584, 0.1868419, 0.3502051, 0, 1, 0.3803922, 1,
-0.2323848, 0.8814221, -0.9428659, 0, 1, 0.3882353, 1,
-0.2322985, 1.075329, -0.1424753, 0, 1, 0.3921569, 1,
-0.2259588, -0.9809326, -3.948262, 0, 1, 0.4, 1,
-0.2245687, -0.3739569, -2.914883, 0, 1, 0.4078431, 1,
-0.2227948, -0.7997408, -2.04174, 0, 1, 0.4117647, 1,
-0.2222843, 0.2048343, 0.64597, 0, 1, 0.4196078, 1,
-0.2194001, 0.2570321, -2.155542, 0, 1, 0.4235294, 1,
-0.219175, -1.287004, -2.510499, 0, 1, 0.4313726, 1,
-0.2178187, 1.106203, -0.8905904, 0, 1, 0.4352941, 1,
-0.2112743, 1.454933, -0.07045723, 0, 1, 0.4431373, 1,
-0.2103997, -0.4461961, -2.517624, 0, 1, 0.4470588, 1,
-0.2103612, -0.9496205, -3.850701, 0, 1, 0.454902, 1,
-0.2096465, 0.874017, 1.423712, 0, 1, 0.4588235, 1,
-0.2086221, -1.103932, -3.892191, 0, 1, 0.4666667, 1,
-0.1995336, 0.2087134, 0.02091343, 0, 1, 0.4705882, 1,
-0.1917645, 1.18078, -0.0920834, 0, 1, 0.4784314, 1,
-0.1907481, 0.6583825, 0.2481411, 0, 1, 0.4823529, 1,
-0.1902217, 0.05863698, -1.584931, 0, 1, 0.4901961, 1,
-0.1900453, 0.2618632, -0.6730235, 0, 1, 0.4941176, 1,
-0.1869353, -0.2055114, -3.898317, 0, 1, 0.5019608, 1,
-0.182018, 0.3616591, 0.8972175, 0, 1, 0.509804, 1,
-0.1807195, -1.930887, -1.540852, 0, 1, 0.5137255, 1,
-0.1798419, -1.604098, -3.043806, 0, 1, 0.5215687, 1,
-0.1788981, -0.8967365, -3.705422, 0, 1, 0.5254902, 1,
-0.1776667, 0.2821237, -0.9314573, 0, 1, 0.5333334, 1,
-0.173819, 0.5935426, 0.1544785, 0, 1, 0.5372549, 1,
-0.1724278, 1.74023, -0.8038577, 0, 1, 0.5450981, 1,
-0.1650487, -0.4383145, -3.023843, 0, 1, 0.5490196, 1,
-0.1637468, -0.02217398, -0.401625, 0, 1, 0.5568628, 1,
-0.1632433, 1.947916, -0.1893885, 0, 1, 0.5607843, 1,
-0.1628967, 0.1906885, 0.6164399, 0, 1, 0.5686275, 1,
-0.1594368, -2.360086, -3.389329, 0, 1, 0.572549, 1,
-0.1582893, 2.30202, -2.411398, 0, 1, 0.5803922, 1,
-0.1527902, -2.428159, -4.25364, 0, 1, 0.5843138, 1,
-0.1522613, 0.6160649, 0.819988, 0, 1, 0.5921569, 1,
-0.1511368, -0.6974331, -2.973521, 0, 1, 0.5960785, 1,
-0.1465686, 0.1546063, -0.09454314, 0, 1, 0.6039216, 1,
-0.1460538, -0.06331411, -1.945382, 0, 1, 0.6117647, 1,
-0.1455734, -2.151905, -1.222588, 0, 1, 0.6156863, 1,
-0.1433977, 0.06359473, -0.7088919, 0, 1, 0.6235294, 1,
-0.1365197, 0.2337305, -1.522038, 0, 1, 0.627451, 1,
-0.1321233, 0.3581431, -0.1654187, 0, 1, 0.6352941, 1,
-0.1304394, 0.1946611, -0.4809389, 0, 1, 0.6392157, 1,
-0.1288661, 0.463142, 0.8184333, 0, 1, 0.6470588, 1,
-0.1264938, -0.02935806, -0.9505001, 0, 1, 0.6509804, 1,
-0.1253724, 0.2673659, -0.2391651, 0, 1, 0.6588235, 1,
-0.1232046, -1.243811, -3.847745, 0, 1, 0.6627451, 1,
-0.1215753, -0.2464527, -3.822944, 0, 1, 0.6705883, 1,
-0.1149719, -0.9650686, -3.208387, 0, 1, 0.6745098, 1,
-0.1110154, -0.3489724, -3.537401, 0, 1, 0.682353, 1,
-0.105012, 0.7516958, 0.006253436, 0, 1, 0.6862745, 1,
-0.1024938, 1.341309, 0.01679226, 0, 1, 0.6941177, 1,
-0.1023247, -0.702125, -3.503999, 0, 1, 0.7019608, 1,
-0.09854638, 1.157502, -0.01604594, 0, 1, 0.7058824, 1,
-0.09568995, 0.07385416, 0.491973, 0, 1, 0.7137255, 1,
-0.09423504, -0.7080522, -3.72545, 0, 1, 0.7176471, 1,
-0.09345644, -0.886196, -2.535472, 0, 1, 0.7254902, 1,
-0.08906672, 1.561122, -1.383241, 0, 1, 0.7294118, 1,
-0.08618981, -0.8716522, -2.465146, 0, 1, 0.7372549, 1,
-0.08068991, 0.5405659, 0.04674479, 0, 1, 0.7411765, 1,
-0.07274856, 0.05664642, -1.129135, 0, 1, 0.7490196, 1,
-0.07235574, -0.7749506, -2.479894, 0, 1, 0.7529412, 1,
-0.07227442, -0.565825, -2.634134, 0, 1, 0.7607843, 1,
-0.06911042, 0.681051, -0.1361495, 0, 1, 0.7647059, 1,
-0.06379098, -1.124924, -3.573836, 0, 1, 0.772549, 1,
-0.06243827, -1.398957, -4.450257, 0, 1, 0.7764706, 1,
-0.06189045, -2.279462, -2.660626, 0, 1, 0.7843137, 1,
-0.06120908, -1.301066, -1.951087, 0, 1, 0.7882353, 1,
-0.05817876, 0.8559228, 0.4225263, 0, 1, 0.7960784, 1,
-0.05788011, -0.3011638, -0.3504321, 0, 1, 0.8039216, 1,
-0.05691977, -1.040732, -1.017993, 0, 1, 0.8078431, 1,
-0.05645569, 0.1953346, -2.319806, 0, 1, 0.8156863, 1,
-0.05045253, -0.3208823, -2.667419, 0, 1, 0.8196079, 1,
-0.05036628, 0.5543847, 0.3095318, 0, 1, 0.827451, 1,
-0.04872232, -0.2950061, -2.623222, 0, 1, 0.8313726, 1,
-0.04849932, -0.8896415, -2.717861, 0, 1, 0.8392157, 1,
-0.04808822, -0.1412332, -1.9148, 0, 1, 0.8431373, 1,
-0.04754063, 0.408411, -1.617256, 0, 1, 0.8509804, 1,
-0.04327999, -0.1638317, -2.368047, 0, 1, 0.854902, 1,
-0.04133878, -0.5082052, -3.976826, 0, 1, 0.8627451, 1,
-0.04004972, 0.627903, -1.091507, 0, 1, 0.8666667, 1,
-0.03740129, 1.595203, 0.4429817, 0, 1, 0.8745098, 1,
-0.03585433, 0.5726345, 0.9488724, 0, 1, 0.8784314, 1,
-0.03364471, -1.052045, -2.370685, 0, 1, 0.8862745, 1,
-0.03225545, 0.2628978, -1.339878, 0, 1, 0.8901961, 1,
-0.03030713, 0.6571654, 0.2526616, 0, 1, 0.8980392, 1,
-0.02996035, -0.7987342, -2.124325, 0, 1, 0.9058824, 1,
-0.02750206, -1.652499, -1.010658, 0, 1, 0.9098039, 1,
-0.02702784, 0.07984553, -0.8118551, 0, 1, 0.9176471, 1,
-0.02610004, -1.568394, -3.796924, 0, 1, 0.9215686, 1,
-0.0259841, 0.9625702, 1.489919, 0, 1, 0.9294118, 1,
-0.02559718, 0.5004853, -1.431375, 0, 1, 0.9333333, 1,
-0.02355438, -0.2902252, -1.729673, 0, 1, 0.9411765, 1,
-0.02267106, -2.495332, -4.519742, 0, 1, 0.945098, 1,
-0.02225983, -0.3224682, -1.422579, 0, 1, 0.9529412, 1,
-0.02042301, -0.9617139, -2.529768, 0, 1, 0.9568627, 1,
-0.02039727, 1.879843, 0.6827642, 0, 1, 0.9647059, 1,
-0.007699445, 0.1974531, -0.2114941, 0, 1, 0.9686275, 1,
-0.004390987, -0.3425803, -2.583163, 0, 1, 0.9764706, 1,
-0.003272035, 0.4661118, 0.226733, 0, 1, 0.9803922, 1,
-0.002849943, -0.1140431, -3.539765, 0, 1, 0.9882353, 1,
-0.002644488, -0.6284395, -2.646221, 0, 1, 0.9921569, 1,
-0.001074651, 0.962701, -0.598461, 0, 1, 1, 1,
-0.000487684, 0.4447243, 1.615831, 0, 0.9921569, 1, 1,
0.002433445, -1.410606, 2.52272, 0, 0.9882353, 1, 1,
0.003752899, -0.05700551, 2.228369, 0, 0.9803922, 1, 1,
0.003888377, -1.217408, 2.18065, 0, 0.9764706, 1, 1,
0.006519679, 0.688069, 1.29491, 0, 0.9686275, 1, 1,
0.009948792, 1.612606, 2.280271, 0, 0.9647059, 1, 1,
0.01835486, -0.3662742, 2.266474, 0, 0.9568627, 1, 1,
0.02882316, 0.2939686, -0.005250903, 0, 0.9529412, 1, 1,
0.03239551, -2.411819, 2.753371, 0, 0.945098, 1, 1,
0.03708698, -1.40277, 3.9522, 0, 0.9411765, 1, 1,
0.03755597, 1.709241, -0.4391761, 0, 0.9333333, 1, 1,
0.03866597, -0.7858552, 2.915183, 0, 0.9294118, 1, 1,
0.0398998, 0.03232761, 0.2021077, 0, 0.9215686, 1, 1,
0.03992632, -0.8287984, 4.572455, 0, 0.9176471, 1, 1,
0.04577458, -2.439688, 4.449993, 0, 0.9098039, 1, 1,
0.04702116, 0.4294548, -0.3032242, 0, 0.9058824, 1, 1,
0.06068869, 0.03673316, 0.8637972, 0, 0.8980392, 1, 1,
0.06468407, -1.265153, 4.114056, 0, 0.8901961, 1, 1,
0.06513777, -0.2732167, 4.184227, 0, 0.8862745, 1, 1,
0.06690922, -0.4229671, 3.174937, 0, 0.8784314, 1, 1,
0.06814887, -0.4480154, 4.725994, 0, 0.8745098, 1, 1,
0.07056581, 0.823166, -0.04046006, 0, 0.8666667, 1, 1,
0.07450977, 0.2608249, 0.1438248, 0, 0.8627451, 1, 1,
0.07518468, 0.4767845, -0.456753, 0, 0.854902, 1, 1,
0.07625514, -0.08913403, 0.4485264, 0, 0.8509804, 1, 1,
0.07712583, 0.4780802, 0.2337323, 0, 0.8431373, 1, 1,
0.07772101, 1.129446, -1.273774, 0, 0.8392157, 1, 1,
0.08471749, 0.01933333, 1.631459, 0, 0.8313726, 1, 1,
0.08775583, -1.179928, 3.146159, 0, 0.827451, 1, 1,
0.0879704, 0.07969663, 0.8017721, 0, 0.8196079, 1, 1,
0.08842459, -1.633393, 1.926177, 0, 0.8156863, 1, 1,
0.08931675, -1.161306, 3.263983, 0, 0.8078431, 1, 1,
0.09131332, -0.8977197, 3.833396, 0, 0.8039216, 1, 1,
0.09679044, -1.221728, 3.965557, 0, 0.7960784, 1, 1,
0.0971269, 0.251367, 1.271915, 0, 0.7882353, 1, 1,
0.101426, -1.756413, 2.768281, 0, 0.7843137, 1, 1,
0.1036236, 0.7278315, 0.2177241, 0, 0.7764706, 1, 1,
0.1046247, -0.5961617, 3.931478, 0, 0.772549, 1, 1,
0.1062078, 0.1122591, 1.661667, 0, 0.7647059, 1, 1,
0.1084551, -0.6198364, 3.379591, 0, 0.7607843, 1, 1,
0.1119553, -1.694993, 1.570273, 0, 0.7529412, 1, 1,
0.1138723, -0.3260476, 3.525357, 0, 0.7490196, 1, 1,
0.1181448, -0.6906172, 3.141169, 0, 0.7411765, 1, 1,
0.1188899, 1.21576, 0.06799907, 0, 0.7372549, 1, 1,
0.1209365, 0.6396845, 1.128563, 0, 0.7294118, 1, 1,
0.1215505, 0.3096094, -0.9023194, 0, 0.7254902, 1, 1,
0.1233996, -1.310024, 2.89269, 0, 0.7176471, 1, 1,
0.1243446, -1.262016, 2.881207, 0, 0.7137255, 1, 1,
0.1287954, 0.9713124, -0.07438855, 0, 0.7058824, 1, 1,
0.1313412, -0.07212094, 0.61059, 0, 0.6980392, 1, 1,
0.1336328, -0.3109468, 2.206476, 0, 0.6941177, 1, 1,
0.1379282, 0.5863749, -0.2761041, 0, 0.6862745, 1, 1,
0.1387693, 0.865521, 0.7571144, 0, 0.682353, 1, 1,
0.1410655, 0.4181795, 0.8196299, 0, 0.6745098, 1, 1,
0.1457648, 0.7578492, -2.648682, 0, 0.6705883, 1, 1,
0.1458331, 0.1269445, 1.245835, 0, 0.6627451, 1, 1,
0.1467809, -0.7545867, 2.236934, 0, 0.6588235, 1, 1,
0.1472799, 0.04450005, 2.766923, 0, 0.6509804, 1, 1,
0.1542119, -0.538556, 3.04828, 0, 0.6470588, 1, 1,
0.1566377, 0.6744764, -0.04118979, 0, 0.6392157, 1, 1,
0.1569037, -1.711203, 2.712484, 0, 0.6352941, 1, 1,
0.1609091, -0.7393968, 1.676239, 0, 0.627451, 1, 1,
0.1633802, -0.2277239, 1.732108, 0, 0.6235294, 1, 1,
0.1640867, -1.443961, 4.727301, 0, 0.6156863, 1, 1,
0.1651337, 0.7979126, 0.9891942, 0, 0.6117647, 1, 1,
0.1667868, 0.08692673, 1.365489, 0, 0.6039216, 1, 1,
0.1720255, -0.1775053, 1.873438, 0, 0.5960785, 1, 1,
0.1724719, -0.9802737, 2.265972, 0, 0.5921569, 1, 1,
0.1756311, -0.2604982, 1.519925, 0, 0.5843138, 1, 1,
0.1838229, -0.5500293, 3.477733, 0, 0.5803922, 1, 1,
0.1923126, -0.1858817, 3.055883, 0, 0.572549, 1, 1,
0.1931225, 0.9990211, -0.5571557, 0, 0.5686275, 1, 1,
0.1942101, -0.7146792, 4.045782, 0, 0.5607843, 1, 1,
0.2016692, 1.115095, 0.7897708, 0, 0.5568628, 1, 1,
0.2023861, -0.7192327, 2.762103, 0, 0.5490196, 1, 1,
0.2106356, 1.492505, 2.13082, 0, 0.5450981, 1, 1,
0.2126224, 0.7569172, 0.3753248, 0, 0.5372549, 1, 1,
0.2135703, 0.4198046, -1.459961, 0, 0.5333334, 1, 1,
0.2164776, -0.1153017, 1.434194, 0, 0.5254902, 1, 1,
0.2174478, 0.1358338, 2.187358, 0, 0.5215687, 1, 1,
0.2192943, 1.305213, -0.27626, 0, 0.5137255, 1, 1,
0.2219372, 0.9521204, 0.7401668, 0, 0.509804, 1, 1,
0.222853, 0.8704026, -0.05000012, 0, 0.5019608, 1, 1,
0.223291, -1.144852, 3.529856, 0, 0.4941176, 1, 1,
0.2249437, 1.301659, 0.188899, 0, 0.4901961, 1, 1,
0.2250147, -0.5898551, 2.629392, 0, 0.4823529, 1, 1,
0.2274004, -1.706596, 2.207023, 0, 0.4784314, 1, 1,
0.2277319, 1.57042, -0.426997, 0, 0.4705882, 1, 1,
0.2281165, -0.9775382, 3.671535, 0, 0.4666667, 1, 1,
0.2290261, 0.04532382, 2.396625, 0, 0.4588235, 1, 1,
0.2292979, 0.01675831, 0.2064915, 0, 0.454902, 1, 1,
0.2301687, 1.394363, 1.457193, 0, 0.4470588, 1, 1,
0.2325229, 1.49617, -0.7126483, 0, 0.4431373, 1, 1,
0.2380392, 0.8569967, 1.319667, 0, 0.4352941, 1, 1,
0.2381508, -0.2077826, 3.094288, 0, 0.4313726, 1, 1,
0.2446396, 0.2752775, 0.9627228, 0, 0.4235294, 1, 1,
0.2471107, 1.034028, 1.326362, 0, 0.4196078, 1, 1,
0.2496846, 0.791746, 0.7224281, 0, 0.4117647, 1, 1,
0.2501244, 1.531306, -0.4268517, 0, 0.4078431, 1, 1,
0.2582155, -0.875623, 2.048161, 0, 0.4, 1, 1,
0.260671, 2.942859, -0.8692024, 0, 0.3921569, 1, 1,
0.2659292, 0.8035461, -1.378097, 0, 0.3882353, 1, 1,
0.2670646, -0.6454259, 2.901878, 0, 0.3803922, 1, 1,
0.2671917, 0.1455027, -0.1937414, 0, 0.3764706, 1, 1,
0.2696356, -0.6131145, 3.157182, 0, 0.3686275, 1, 1,
0.2700064, -1.031912, 2.555305, 0, 0.3647059, 1, 1,
0.2797836, 0.3176845, 1.029689, 0, 0.3568628, 1, 1,
0.2848335, -0.2340739, 1.149749, 0, 0.3529412, 1, 1,
0.2852203, -0.4610063, 2.262264, 0, 0.345098, 1, 1,
0.2880251, 0.2920342, -1.132298, 0, 0.3411765, 1, 1,
0.2909452, 0.7546102, 2.622841, 0, 0.3333333, 1, 1,
0.2917965, -0.3637683, 2.32047, 0, 0.3294118, 1, 1,
0.293485, -0.5777026, 2.765089, 0, 0.3215686, 1, 1,
0.2939134, 1.573213, 0.8007267, 0, 0.3176471, 1, 1,
0.2949545, 0.4188579, 1.144433, 0, 0.3098039, 1, 1,
0.2949789, -0.8810121, 4.000793, 0, 0.3058824, 1, 1,
0.2962389, 0.3110259, 2.747252, 0, 0.2980392, 1, 1,
0.3011033, -1.112176, 2.869893, 0, 0.2901961, 1, 1,
0.3017811, -0.5662364, 3.850596, 0, 0.2862745, 1, 1,
0.3032948, -2.163286, 2.40454, 0, 0.2784314, 1, 1,
0.3054108, 0.2885693, 1.163266, 0, 0.2745098, 1, 1,
0.3067483, 0.8052117, 0.7781438, 0, 0.2666667, 1, 1,
0.3100582, -0.8386248, 5.522421, 0, 0.2627451, 1, 1,
0.310744, 0.2789857, 0.5654914, 0, 0.254902, 1, 1,
0.3152288, 0.43697, 0.06017151, 0, 0.2509804, 1, 1,
0.3190526, -2.014371, 2.846471, 0, 0.2431373, 1, 1,
0.3236655, 1.979328, 0.07461967, 0, 0.2392157, 1, 1,
0.3278975, 0.6126974, 2.180922, 0, 0.2313726, 1, 1,
0.3296816, 1.270714, -2.476703, 0, 0.227451, 1, 1,
0.3301015, -0.65161, 3.047517, 0, 0.2196078, 1, 1,
0.3309975, 0.09106264, 0.5560502, 0, 0.2156863, 1, 1,
0.3333304, -0.6335018, 2.637454, 0, 0.2078431, 1, 1,
0.3342509, -0.8579281, 2.027297, 0, 0.2039216, 1, 1,
0.3346195, -0.2083575, 2.201817, 0, 0.1960784, 1, 1,
0.3361913, 0.7047429, -0.2187189, 0, 0.1882353, 1, 1,
0.3372405, 0.5880746, -0.4061904, 0, 0.1843137, 1, 1,
0.3374608, 0.8390306, -0.4517659, 0, 0.1764706, 1, 1,
0.3405433, -1.280069, 2.21653, 0, 0.172549, 1, 1,
0.3419276, 0.7543582, -0.6026509, 0, 0.1647059, 1, 1,
0.3456959, 0.3323482, 1.34092, 0, 0.1607843, 1, 1,
0.3479186, 0.08925059, 2.073844, 0, 0.1529412, 1, 1,
0.3483839, -0.3847518, 2.923462, 0, 0.1490196, 1, 1,
0.3501476, 0.1276046, 1.316054, 0, 0.1411765, 1, 1,
0.3505866, -0.02653308, 1.157615, 0, 0.1372549, 1, 1,
0.3554057, -1.836104, 0.5586803, 0, 0.1294118, 1, 1,
0.3558104, 0.6652433, -1.712456, 0, 0.1254902, 1, 1,
0.3596565, -3.34955, 2.24555, 0, 0.1176471, 1, 1,
0.3662037, -0.1537744, 1.82718, 0, 0.1137255, 1, 1,
0.3698029, 0.7894568, 2.397404, 0, 0.1058824, 1, 1,
0.3770658, 0.8238891, 0.1044255, 0, 0.09803922, 1, 1,
0.3805815, 2.209975, -0.4171176, 0, 0.09411765, 1, 1,
0.3857674, -1.756747, 2.798338, 0, 0.08627451, 1, 1,
0.3859087, -0.698593, 4.389589, 0, 0.08235294, 1, 1,
0.3869263, -0.5558995, 1.315609, 0, 0.07450981, 1, 1,
0.3945438, 0.3934768, 0.8203492, 0, 0.07058824, 1, 1,
0.394548, 0.3036641, 1.841986, 0, 0.0627451, 1, 1,
0.3971014, -1.174192, 3.640899, 0, 0.05882353, 1, 1,
0.3983025, -1.245096, 2.558457, 0, 0.05098039, 1, 1,
0.3993864, 0.109008, 1.912855, 0, 0.04705882, 1, 1,
0.3999669, 0.009698689, -1.751101, 0, 0.03921569, 1, 1,
0.4121372, 0.6390115, -0.5783448, 0, 0.03529412, 1, 1,
0.4194833, 0.3884428, -1.095673, 0, 0.02745098, 1, 1,
0.4197028, 0.4557893, 0.6094055, 0, 0.02352941, 1, 1,
0.4212992, -0.1097362, 0.8792073, 0, 0.01568628, 1, 1,
0.4215439, -1.180637, 3.333875, 0, 0.01176471, 1, 1,
0.4227603, 1.132657, 0.02327868, 0, 0.003921569, 1, 1,
0.4254507, 1.687147, 0.4404345, 0.003921569, 0, 1, 1,
0.4256685, -0.7999982, 2.239406, 0.007843138, 0, 1, 1,
0.4261776, -2.176967, 1.795746, 0.01568628, 0, 1, 1,
0.4294066, -0.05910655, 0.6969364, 0.01960784, 0, 1, 1,
0.4301129, 0.6323615, -0.7232472, 0.02745098, 0, 1, 1,
0.430331, 0.6315029, 1.710031, 0.03137255, 0, 1, 1,
0.4303976, -1.008461, 0.6064146, 0.03921569, 0, 1, 1,
0.4312765, -0.758801, 2.05311, 0.04313726, 0, 1, 1,
0.4316197, 1.469655, 0.5244199, 0.05098039, 0, 1, 1,
0.4351425, -0.6310425, 2.466423, 0.05490196, 0, 1, 1,
0.4454298, -0.04969726, -0.3666076, 0.0627451, 0, 1, 1,
0.4502599, -0.3368068, 2.506519, 0.06666667, 0, 1, 1,
0.4506365, 0.8022955, -1.663491, 0.07450981, 0, 1, 1,
0.4544543, -0.9448212, 3.112137, 0.07843138, 0, 1, 1,
0.4549193, 0.1951545, 0.7104753, 0.08627451, 0, 1, 1,
0.4591912, -0.3261057, 3.76509, 0.09019608, 0, 1, 1,
0.4597319, -0.4586178, 2.772072, 0.09803922, 0, 1, 1,
0.4681542, 0.7673647, 1.021093, 0.1058824, 0, 1, 1,
0.4722394, -0.3066842, 2.632756, 0.1098039, 0, 1, 1,
0.4735765, -0.9692868, 1.813352, 0.1176471, 0, 1, 1,
0.4804374, 1.87801, -1.40604, 0.1215686, 0, 1, 1,
0.4834031, -0.1881691, 1.971046, 0.1294118, 0, 1, 1,
0.4834763, -0.08341227, 1.758333, 0.1333333, 0, 1, 1,
0.4864978, -1.175662, 4.133321, 0.1411765, 0, 1, 1,
0.4870972, -0.1733757, 0.5805605, 0.145098, 0, 1, 1,
0.4875664, -0.09949433, 2.622746, 0.1529412, 0, 1, 1,
0.488116, 0.3800818, 0.5323361, 0.1568628, 0, 1, 1,
0.4885632, -0.7654296, 3.649531, 0.1647059, 0, 1, 1,
0.4952994, 0.9039489, 0.9705392, 0.1686275, 0, 1, 1,
0.4961811, -0.09521437, 1.66774, 0.1764706, 0, 1, 1,
0.5021451, -0.9764493, 2.571775, 0.1803922, 0, 1, 1,
0.5054326, -0.8397002, 1.931515, 0.1882353, 0, 1, 1,
0.5076866, -0.5801476, 2.416245, 0.1921569, 0, 1, 1,
0.5099218, -0.05790401, 1.722081, 0.2, 0, 1, 1,
0.5109555, 0.8765948, 1.139576, 0.2078431, 0, 1, 1,
0.5130161, 1.387692, -0.06156474, 0.2117647, 0, 1, 1,
0.5157315, -0.01671116, 0.9080209, 0.2196078, 0, 1, 1,
0.5158829, 0.09123308, 2.740568, 0.2235294, 0, 1, 1,
0.5169775, 0.8501757, -0.4363712, 0.2313726, 0, 1, 1,
0.5218371, 2.206481, 0.604092, 0.2352941, 0, 1, 1,
0.5222214, 0.306173, 1.101644, 0.2431373, 0, 1, 1,
0.5257745, -1.264033, 2.490884, 0.2470588, 0, 1, 1,
0.5281331, 1.089242, -0.3751393, 0.254902, 0, 1, 1,
0.5330724, -0.03787418, 2.231583, 0.2588235, 0, 1, 1,
0.5340394, 0.1023515, 1.237406, 0.2666667, 0, 1, 1,
0.5412988, 0.5418993, 0.6525394, 0.2705882, 0, 1, 1,
0.5459188, -0.2366308, 1.323379, 0.2784314, 0, 1, 1,
0.5487409, -0.8580476, 3.029171, 0.282353, 0, 1, 1,
0.549005, 1.551826, 1.09173, 0.2901961, 0, 1, 1,
0.554678, -0.2795835, 0.1537659, 0.2941177, 0, 1, 1,
0.5555851, -0.05214889, 0.885035, 0.3019608, 0, 1, 1,
0.5558673, 0.5679269, 1.932618, 0.3098039, 0, 1, 1,
0.5564789, -2.566214, 2.483202, 0.3137255, 0, 1, 1,
0.5626644, -0.7562438, 1.941893, 0.3215686, 0, 1, 1,
0.5656096, -0.8989609, 3.156534, 0.3254902, 0, 1, 1,
0.5675705, -0.3147972, 0.4910696, 0.3333333, 0, 1, 1,
0.5746341, 0.4730246, 0.1259453, 0.3372549, 0, 1, 1,
0.5765589, -0.440618, 3.04571, 0.345098, 0, 1, 1,
0.5765762, 1.05618, 2.157162, 0.3490196, 0, 1, 1,
0.57709, 0.6749642, 0.9689529, 0.3568628, 0, 1, 1,
0.5825247, 0.06510732, 1.745579, 0.3607843, 0, 1, 1,
0.5877072, 0.249082, -0.9694707, 0.3686275, 0, 1, 1,
0.5945026, -1.748876, 2.687764, 0.372549, 0, 1, 1,
0.5947723, 0.2763586, 0.4545488, 0.3803922, 0, 1, 1,
0.5960654, -0.8484451, 1.153484, 0.3843137, 0, 1, 1,
0.5971768, 1.030903, 2.103013, 0.3921569, 0, 1, 1,
0.5986661, -0.1966546, 2.662253, 0.3960784, 0, 1, 1,
0.602529, -0.02851197, 1.661935, 0.4039216, 0, 1, 1,
0.6058143, 1.172486, 2.152855, 0.4117647, 0, 1, 1,
0.6080519, 1.13427, 0.1421853, 0.4156863, 0, 1, 1,
0.6110557, 0.6593846, 0.6305037, 0.4235294, 0, 1, 1,
0.6118315, 1.035359, -0.1205719, 0.427451, 0, 1, 1,
0.6211786, -0.2066657, 0.7789553, 0.4352941, 0, 1, 1,
0.6233893, -0.9155655, 2.370326, 0.4392157, 0, 1, 1,
0.624324, -0.7362031, 2.190025, 0.4470588, 0, 1, 1,
0.6272365, -1.543807, 4.239389, 0.4509804, 0, 1, 1,
0.6297064, -1.942474, 0.6931788, 0.4588235, 0, 1, 1,
0.6316078, -1.142018, 3.543159, 0.4627451, 0, 1, 1,
0.6334017, 0.8553441, -0.278589, 0.4705882, 0, 1, 1,
0.6348572, 0.3674543, 0.5747198, 0.4745098, 0, 1, 1,
0.6397364, -1.260508, 3.144127, 0.4823529, 0, 1, 1,
0.6453644, 2.299703, 0.6037772, 0.4862745, 0, 1, 1,
0.6475914, 1.498982, 2.745432, 0.4941176, 0, 1, 1,
0.6492682, -1.035844, 1.496049, 0.5019608, 0, 1, 1,
0.6545675, 0.1245661, 2.021173, 0.5058824, 0, 1, 1,
0.6546922, 0.6944674, 2.528437, 0.5137255, 0, 1, 1,
0.6566136, 0.2507025, 1.944424, 0.5176471, 0, 1, 1,
0.6615926, -0.9126055, 2.363393, 0.5254902, 0, 1, 1,
0.669672, -1.035411, 3.174668, 0.5294118, 0, 1, 1,
0.6731681, -0.1856177, 2.153416, 0.5372549, 0, 1, 1,
0.6737995, 1.951452, -0.3928396, 0.5411765, 0, 1, 1,
0.6765209, -0.2647121, 2.553779, 0.5490196, 0, 1, 1,
0.685167, -0.2331103, 2.433804, 0.5529412, 0, 1, 1,
0.6873001, 0.9731996, 1.15479, 0.5607843, 0, 1, 1,
0.6955023, -0.5377917, 1.41504, 0.5647059, 0, 1, 1,
0.6961927, 0.8651096, 2.320088, 0.572549, 0, 1, 1,
0.6980359, 1.20157, -0.4240028, 0.5764706, 0, 1, 1,
0.7139835, -0.2518631, 2.263223, 0.5843138, 0, 1, 1,
0.7145724, 0.9140198, 2.425347, 0.5882353, 0, 1, 1,
0.7172049, -1.437035, 3.089707, 0.5960785, 0, 1, 1,
0.7198167, 0.03587965, 1.101051, 0.6039216, 0, 1, 1,
0.729359, -1.655963, 3.507993, 0.6078432, 0, 1, 1,
0.7325075, 1.306733, 1.535657, 0.6156863, 0, 1, 1,
0.7346656, 1.033276, 1.1824, 0.6196079, 0, 1, 1,
0.7347224, 0.3242546, 0.6237628, 0.627451, 0, 1, 1,
0.7365686, 0.5800421, 0.2789403, 0.6313726, 0, 1, 1,
0.7420465, -0.5024254, 0.7344163, 0.6392157, 0, 1, 1,
0.7425544, 0.0385865, 3.06927, 0.6431373, 0, 1, 1,
0.745186, -0.7172846, 3.321062, 0.6509804, 0, 1, 1,
0.7483597, -0.5624278, 2.938076, 0.654902, 0, 1, 1,
0.7505104, 1.342086, 0.9726591, 0.6627451, 0, 1, 1,
0.760714, 0.6975837, -1.441614, 0.6666667, 0, 1, 1,
0.7616907, -0.3043145, 2.229908, 0.6745098, 0, 1, 1,
0.7623453, 1.122405, 1.29872, 0.6784314, 0, 1, 1,
0.7657234, -1.088427, 3.713753, 0.6862745, 0, 1, 1,
0.7722981, -0.963225, 3.023057, 0.6901961, 0, 1, 1,
0.7759184, -1.255297, 3.237281, 0.6980392, 0, 1, 1,
0.7779251, -0.5274867, 2.051104, 0.7058824, 0, 1, 1,
0.7789687, 0.8217627, 0.7039726, 0.7098039, 0, 1, 1,
0.7836857, 0.1531589, -0.1110569, 0.7176471, 0, 1, 1,
0.7860866, -1.419968, 2.179605, 0.7215686, 0, 1, 1,
0.7882267, 0.1133098, 2.435556, 0.7294118, 0, 1, 1,
0.7922381, 0.1895971, 0.2252465, 0.7333333, 0, 1, 1,
0.7974437, -0.095635, 1.415578, 0.7411765, 0, 1, 1,
0.7982773, -0.1880702, -0.6149597, 0.7450981, 0, 1, 1,
0.8034469, -0.238032, 1.93462, 0.7529412, 0, 1, 1,
0.8081693, -0.03546933, 1.893667, 0.7568628, 0, 1, 1,
0.8097082, 1.120404, 0.8062674, 0.7647059, 0, 1, 1,
0.8127452, -0.8031608, 2.028626, 0.7686275, 0, 1, 1,
0.8164959, -0.193348, 2.672386, 0.7764706, 0, 1, 1,
0.8198535, -0.2572614, 1.60993, 0.7803922, 0, 1, 1,
0.8276063, 0.9751216, 0.6738785, 0.7882353, 0, 1, 1,
0.8334824, -0.7003083, 1.458584, 0.7921569, 0, 1, 1,
0.8366528, 0.293607, 0.3969378, 0.8, 0, 1, 1,
0.839725, -0.2603526, 1.961606, 0.8078431, 0, 1, 1,
0.8421199, 2.237101, 0.7148587, 0.8117647, 0, 1, 1,
0.8438349, 0.8605456, 2.112046, 0.8196079, 0, 1, 1,
0.8565151, 1.820938, -1.611166, 0.8235294, 0, 1, 1,
0.8601685, 1.309028, -1.508871, 0.8313726, 0, 1, 1,
0.8666521, 0.5897781, 2.085468, 0.8352941, 0, 1, 1,
0.8671799, -0.5471678, 1.615191, 0.8431373, 0, 1, 1,
0.8675452, 1.134672, -0.5868786, 0.8470588, 0, 1, 1,
0.8676014, 0.8041181, 0.3994274, 0.854902, 0, 1, 1,
0.8807628, 0.3759358, 0.8775806, 0.8588235, 0, 1, 1,
0.8837615, 1.485382, -0.2725021, 0.8666667, 0, 1, 1,
0.8841304, -0.05625796, 1.884444, 0.8705882, 0, 1, 1,
0.8843766, -1.16473, 3.569402, 0.8784314, 0, 1, 1,
0.8914735, -0.9909644, 3.173183, 0.8823529, 0, 1, 1,
0.892232, 0.003864531, 1.817088, 0.8901961, 0, 1, 1,
0.8957155, 0.1114063, 0.868672, 0.8941177, 0, 1, 1,
0.899366, 1.584202, -0.98387, 0.9019608, 0, 1, 1,
0.9057128, 1.013334, 0.5909618, 0.9098039, 0, 1, 1,
0.9096544, 0.02272356, 1.082781, 0.9137255, 0, 1, 1,
0.9127286, -0.8773291, 1.422742, 0.9215686, 0, 1, 1,
0.9156828, 1.830941, 1.276824, 0.9254902, 0, 1, 1,
0.9185964, 0.72233, 2.787372, 0.9333333, 0, 1, 1,
0.9196143, 0.5468506, 1.840471, 0.9372549, 0, 1, 1,
0.9260787, -1.14004, 3.720924, 0.945098, 0, 1, 1,
0.9286101, 0.121594, -0.0962975, 0.9490196, 0, 1, 1,
0.9314581, 0.995672, 0.8207048, 0.9568627, 0, 1, 1,
0.937722, -2.339714, 2.92247, 0.9607843, 0, 1, 1,
0.9426873, -1.190001, 1.668013, 0.9686275, 0, 1, 1,
0.9454933, 0.9226435, -0.1701726, 0.972549, 0, 1, 1,
0.9524242, 0.679925, 0.529389, 0.9803922, 0, 1, 1,
0.9541614, -1.56404, 4.175378, 0.9843137, 0, 1, 1,
0.9570661, 1.816876, 1.280078, 0.9921569, 0, 1, 1,
0.957951, -0.7237278, 0.8167758, 0.9960784, 0, 1, 1,
0.9665844, -1.487846, 3.233014, 1, 0, 0.9960784, 1,
0.9701447, -0.2221794, 3.610251, 1, 0, 0.9882353, 1,
0.972198, 1.240276, 0.2550014, 1, 0, 0.9843137, 1,
0.9791608, -0.2664093, 1.000766, 1, 0, 0.9764706, 1,
0.9812895, -0.846214, 2.928311, 1, 0, 0.972549, 1,
0.9829226, -0.2957264, 1.074769, 1, 0, 0.9647059, 1,
0.9836937, -0.0362194, 0.6773133, 1, 0, 0.9607843, 1,
0.983988, 0.1401188, 2.02183, 1, 0, 0.9529412, 1,
0.9855899, 0.2356656, 1.147952, 1, 0, 0.9490196, 1,
0.9957451, 0.2338099, 1.294391, 1, 0, 0.9411765, 1,
1.003887, 0.563695, 0.8847935, 1, 0, 0.9372549, 1,
1.006614, 0.9815827, 0.5844975, 1, 0, 0.9294118, 1,
1.007651, -0.4192368, 3.018538, 1, 0, 0.9254902, 1,
1.008755, -0.1676897, 2.683718, 1, 0, 0.9176471, 1,
1.011894, 0.1091702, 0.7302964, 1, 0, 0.9137255, 1,
1.012215, -0.478927, 1.878519, 1, 0, 0.9058824, 1,
1.015393, -1.177601, 2.140678, 1, 0, 0.9019608, 1,
1.032148, -0.1250226, 0.3617257, 1, 0, 0.8941177, 1,
1.033558, -1.599149, 0.5159957, 1, 0, 0.8862745, 1,
1.034084, 0.3041348, 0.8435469, 1, 0, 0.8823529, 1,
1.037721, 0.8973942, 2.175415, 1, 0, 0.8745098, 1,
1.040152, -0.729409, 3.832181, 1, 0, 0.8705882, 1,
1.045421, 0.3608784, 2.400602, 1, 0, 0.8627451, 1,
1.045566, -0.6963373, 0.2123304, 1, 0, 0.8588235, 1,
1.047554, 0.5091764, 0.1408207, 1, 0, 0.8509804, 1,
1.053856, 1.230529, 1.993724, 1, 0, 0.8470588, 1,
1.055728, 0.1130664, 2.15346, 1, 0, 0.8392157, 1,
1.05586, -0.6445885, 2.240371, 1, 0, 0.8352941, 1,
1.055909, -0.7469743, 3.131851, 1, 0, 0.827451, 1,
1.064449, 0.633748, -0.479371, 1, 0, 0.8235294, 1,
1.06464, 0.8446477, 0.5813071, 1, 0, 0.8156863, 1,
1.07172, 1.049417, 0.7190384, 1, 0, 0.8117647, 1,
1.09345, -0.6149725, 2.006332, 1, 0, 0.8039216, 1,
1.106783, -0.08185623, 2.54787, 1, 0, 0.7960784, 1,
1.110558, 0.4523632, 1.075739, 1, 0, 0.7921569, 1,
1.113258, -1.225891, 3.089316, 1, 0, 0.7843137, 1,
1.113782, 0.5429846, 1.279786, 1, 0, 0.7803922, 1,
1.114246, 0.7772191, 2.190824, 1, 0, 0.772549, 1,
1.117276, -0.3863627, 1.403512, 1, 0, 0.7686275, 1,
1.118457, 0.8873341, 1.890058, 1, 0, 0.7607843, 1,
1.130589, 0.1747192, 1.943761, 1, 0, 0.7568628, 1,
1.1367, 1.042656, 0.3013546, 1, 0, 0.7490196, 1,
1.138626, 0.5642349, 1.695657, 1, 0, 0.7450981, 1,
1.141832, 0.01373861, 1.523868, 1, 0, 0.7372549, 1,
1.143798, -0.03786768, 0.8349432, 1, 0, 0.7333333, 1,
1.163319, 0.8808737, -0.5662787, 1, 0, 0.7254902, 1,
1.169022, 0.6020498, 1.632889, 1, 0, 0.7215686, 1,
1.179017, 0.7081968, -1.639488, 1, 0, 0.7137255, 1,
1.180101, 0.1490825, 0.748314, 1, 0, 0.7098039, 1,
1.185848, -0.324687, 3.823858, 1, 0, 0.7019608, 1,
1.188062, 0.1587182, 2.656831, 1, 0, 0.6941177, 1,
1.188681, 1.173809, 2.287587, 1, 0, 0.6901961, 1,
1.195041, -0.7962275, 3.053172, 1, 0, 0.682353, 1,
1.196111, 0.4629184, 0.4265087, 1, 0, 0.6784314, 1,
1.212309, -1.244074, 3.830862, 1, 0, 0.6705883, 1,
1.221777, -0.6235138, -0.09399169, 1, 0, 0.6666667, 1,
1.233278, -0.511595, 2.185235, 1, 0, 0.6588235, 1,
1.234344, 1.124949, -1.08627, 1, 0, 0.654902, 1,
1.236829, 0.4059398, 1.593438, 1, 0, 0.6470588, 1,
1.238589, 1.788523, 0.777825, 1, 0, 0.6431373, 1,
1.240285, 0.740611, -0.3196559, 1, 0, 0.6352941, 1,
1.247147, -0.1256494, 1.969295, 1, 0, 0.6313726, 1,
1.247547, -0.6060888, 1.538449, 1, 0, 0.6235294, 1,
1.281901, 0.04250912, 3.055555, 1, 0, 0.6196079, 1,
1.293103, -1.640336, 1.633767, 1, 0, 0.6117647, 1,
1.304186, -0.007611583, 3.127673, 1, 0, 0.6078432, 1,
1.31325, 0.4797553, 1.433587, 1, 0, 0.6, 1,
1.3191, 0.211806, 0.4912787, 1, 0, 0.5921569, 1,
1.319561, 1.292445, 0.336607, 1, 0, 0.5882353, 1,
1.325127, 0.9024919, 2.235205, 1, 0, 0.5803922, 1,
1.326747, 1.553141, 0.4932821, 1, 0, 0.5764706, 1,
1.330035, 0.3447632, 0.8263918, 1, 0, 0.5686275, 1,
1.332941, 0.9895365, 0.8762255, 1, 0, 0.5647059, 1,
1.339426, 1.507173, 0.3796517, 1, 0, 0.5568628, 1,
1.345537, 0.6910341, 1.985635, 1, 0, 0.5529412, 1,
1.359083, -1.380427, 1.849606, 1, 0, 0.5450981, 1,
1.365668, 1.360115, 0.2330691, 1, 0, 0.5411765, 1,
1.385738, 0.7107328, 1.175049, 1, 0, 0.5333334, 1,
1.393883, -0.07951062, 2.532224, 1, 0, 0.5294118, 1,
1.397028, -0.4030112, 0.8096182, 1, 0, 0.5215687, 1,
1.399313, -1.568038, 2.763691, 1, 0, 0.5176471, 1,
1.401288, -0.4633271, 1.032417, 1, 0, 0.509804, 1,
1.401763, -0.04741225, -0.01881273, 1, 0, 0.5058824, 1,
1.405119, -1.729137, 2.023266, 1, 0, 0.4980392, 1,
1.405628, -2.219349, 2.805139, 1, 0, 0.4901961, 1,
1.406395, -1.457381, 3.48085, 1, 0, 0.4862745, 1,
1.412671, -0.395075, 1.355889, 1, 0, 0.4784314, 1,
1.42594, -0.7652614, 1.871451, 1, 0, 0.4745098, 1,
1.425963, -2.529442, 1.724433, 1, 0, 0.4666667, 1,
1.438511, 1.61266, 1.257549, 1, 0, 0.4627451, 1,
1.440103, 1.130972, 1.793198, 1, 0, 0.454902, 1,
1.45907, -0.05267071, 2.136369, 1, 0, 0.4509804, 1,
1.461973, 0.8955301, 0.3913928, 1, 0, 0.4431373, 1,
1.463533, -0.3314794, 2.264698, 1, 0, 0.4392157, 1,
1.464516, 0.899269, 1.983363, 1, 0, 0.4313726, 1,
1.46573, 0.5142568, 0.239845, 1, 0, 0.427451, 1,
1.469365, 0.8881177, 2.041023, 1, 0, 0.4196078, 1,
1.471684, 1.297223, 1.132067, 1, 0, 0.4156863, 1,
1.471866, -2.086524, 1.747268, 1, 0, 0.4078431, 1,
1.473239, -0.9407146, 1.863852, 1, 0, 0.4039216, 1,
1.477298, -0.5130643, 2.759261, 1, 0, 0.3960784, 1,
1.48514, 0.2737178, 0.8006693, 1, 0, 0.3882353, 1,
1.487571, -0.4561614, 1.183379, 1, 0, 0.3843137, 1,
1.499623, 1.177647, 0.3997484, 1, 0, 0.3764706, 1,
1.500907, -1.236724, 2.653189, 1, 0, 0.372549, 1,
1.52544, 0.02127117, 2.625188, 1, 0, 0.3647059, 1,
1.552024, -0.07525273, -0.2081033, 1, 0, 0.3607843, 1,
1.565404, -0.9863458, 1.711195, 1, 0, 0.3529412, 1,
1.567624, 0.7904032, 0.6047981, 1, 0, 0.3490196, 1,
1.568098, 1.461983, 0.5432575, 1, 0, 0.3411765, 1,
1.577251, 0.6450093, 2.069143, 1, 0, 0.3372549, 1,
1.592256, 0.2585403, 0.8276817, 1, 0, 0.3294118, 1,
1.596303, -1.36385, 3.67499, 1, 0, 0.3254902, 1,
1.597112, 0.3304721, 0.7474695, 1, 0, 0.3176471, 1,
1.613005, 0.7284547, 1.510296, 1, 0, 0.3137255, 1,
1.614956, -0.09663298, 0.8748127, 1, 0, 0.3058824, 1,
1.650846, 1.03966, 1.39879, 1, 0, 0.2980392, 1,
1.665642, -0.3522267, 2.868188, 1, 0, 0.2941177, 1,
1.671645, -0.1800278, 2.559217, 1, 0, 0.2862745, 1,
1.674527, 0.1043636, 2.280488, 1, 0, 0.282353, 1,
1.678012, 0.4913203, 1.488025, 1, 0, 0.2745098, 1,
1.68604, 0.3519029, 0.7989618, 1, 0, 0.2705882, 1,
1.695545, -0.2050376, 1.92387, 1, 0, 0.2627451, 1,
1.713046, -1.008794, 2.38125, 1, 0, 0.2588235, 1,
1.719048, 0.5862386, 2.229458, 1, 0, 0.2509804, 1,
1.74516, 0.6725909, 2.118668, 1, 0, 0.2470588, 1,
1.748238, 0.2826881, 1.955063, 1, 0, 0.2392157, 1,
1.751449, -0.3769569, 1.467068, 1, 0, 0.2352941, 1,
1.75235, -0.3142178, 1.3358, 1, 0, 0.227451, 1,
1.762824, 0.561516, 2.120044, 1, 0, 0.2235294, 1,
1.775542, -0.2306375, 0.9404115, 1, 0, 0.2156863, 1,
1.776562, 0.2375629, 1.78036, 1, 0, 0.2117647, 1,
1.780145, 0.8663209, 0.2031682, 1, 0, 0.2039216, 1,
1.785618, 0.03126151, 2.222604, 1, 0, 0.1960784, 1,
1.796017, -0.6113089, 0.6648091, 1, 0, 0.1921569, 1,
1.806142, -1.50356, 2.014252, 1, 0, 0.1843137, 1,
1.855933, 1.505114, 0.484321, 1, 0, 0.1803922, 1,
1.962298, 1.635902, 0.7293023, 1, 0, 0.172549, 1,
1.981675, 1.100611, 1.241859, 1, 0, 0.1686275, 1,
1.982768, -1.066131, 1.911006, 1, 0, 0.1607843, 1,
2.002111, -0.3971806, 1.418216, 1, 0, 0.1568628, 1,
2.003453, 0.8518967, 2.291715, 1, 0, 0.1490196, 1,
2.025932, -1.143351, 2.002026, 1, 0, 0.145098, 1,
2.059242, 0.2245876, 1.643725, 1, 0, 0.1372549, 1,
2.061087, 0.3565657, 0.8947669, 1, 0, 0.1333333, 1,
2.066816, 1.496139, 0.3159451, 1, 0, 0.1254902, 1,
2.081337, 0.5106588, 1.617977, 1, 0, 0.1215686, 1,
2.099103, -0.07632464, 0.5636021, 1, 0, 0.1137255, 1,
2.122251, -0.7521379, 2.200339, 1, 0, 0.1098039, 1,
2.138572, 1.462915, 1.773391, 1, 0, 0.1019608, 1,
2.170294, 0.5167887, 3.543001, 1, 0, 0.09411765, 1,
2.181524, 0.5636315, 1.94714, 1, 0, 0.09019608, 1,
2.181546, 0.7704381, 1.767835, 1, 0, 0.08235294, 1,
2.196306, -0.2840359, 2.349452, 1, 0, 0.07843138, 1,
2.209337, 0.6828359, 1.410327, 1, 0, 0.07058824, 1,
2.221825, -0.3871306, 0.3708525, 1, 0, 0.06666667, 1,
2.24572, 0.3999646, 2.397951, 1, 0, 0.05882353, 1,
2.26523, 0.5800912, 1.229572, 1, 0, 0.05490196, 1,
2.271279, 2.260879, -0.5142238, 1, 0, 0.04705882, 1,
2.280121, -1.746169, 2.987642, 1, 0, 0.04313726, 1,
2.308017, 2.077989, 3.022511, 1, 0, 0.03529412, 1,
2.331044, 1.767342, -1.939268, 1, 0, 0.03137255, 1,
2.400922, 1.242727, 1.668987, 1, 0, 0.02352941, 1,
2.866947, 1.561468, 0.3968159, 1, 0, 0.01960784, 1,
2.917908, -0.0401036, 1.527522, 1, 0, 0.01176471, 1,
3.273168, 0.005653688, 1.5219, 1, 0, 0.007843138, 1
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
0.09016132, -4.416113, -6.494287, 0, -0.5, 0.5, 0.5,
0.09016132, -4.416113, -6.494287, 1, -0.5, 0.5, 0.5,
0.09016132, -4.416113, -6.494287, 1, 1.5, 0.5, 0.5,
0.09016132, -4.416113, -6.494287, 0, 1.5, 0.5, 0.5
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
-4.171885, -0.2033455, -6.494287, 0, -0.5, 0.5, 0.5,
-4.171885, -0.2033455, -6.494287, 1, -0.5, 0.5, 0.5,
-4.171885, -0.2033455, -6.494287, 1, 1.5, 0.5, 0.5,
-4.171885, -0.2033455, -6.494287, 0, 1.5, 0.5, 0.5
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
-4.171885, -4.416113, 0.3848801, 0, -0.5, 0.5, 0.5,
-4.171885, -4.416113, 0.3848801, 1, -0.5, 0.5, 0.5,
-4.171885, -4.416113, 0.3848801, 1, 1.5, 0.5, 0.5,
-4.171885, -4.416113, 0.3848801, 0, 1.5, 0.5, 0.5
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
-3, -3.443936, -4.906787,
3, -3.443936, -4.906787,
-3, -3.443936, -4.906787,
-3, -3.605965, -5.171371,
-2, -3.443936, -4.906787,
-2, -3.605965, -5.171371,
-1, -3.443936, -4.906787,
-1, -3.605965, -5.171371,
0, -3.443936, -4.906787,
0, -3.605965, -5.171371,
1, -3.443936, -4.906787,
1, -3.605965, -5.171371,
2, -3.443936, -4.906787,
2, -3.605965, -5.171371,
3, -3.443936, -4.906787,
3, -3.605965, -5.171371
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
-3, -3.930024, -5.700538, 0, -0.5, 0.5, 0.5,
-3, -3.930024, -5.700538, 1, -0.5, 0.5, 0.5,
-3, -3.930024, -5.700538, 1, 1.5, 0.5, 0.5,
-3, -3.930024, -5.700538, 0, 1.5, 0.5, 0.5,
-2, -3.930024, -5.700538, 0, -0.5, 0.5, 0.5,
-2, -3.930024, -5.700538, 1, -0.5, 0.5, 0.5,
-2, -3.930024, -5.700538, 1, 1.5, 0.5, 0.5,
-2, -3.930024, -5.700538, 0, 1.5, 0.5, 0.5,
-1, -3.930024, -5.700538, 0, -0.5, 0.5, 0.5,
-1, -3.930024, -5.700538, 1, -0.5, 0.5, 0.5,
-1, -3.930024, -5.700538, 1, 1.5, 0.5, 0.5,
-1, -3.930024, -5.700538, 0, 1.5, 0.5, 0.5,
0, -3.930024, -5.700538, 0, -0.5, 0.5, 0.5,
0, -3.930024, -5.700538, 1, -0.5, 0.5, 0.5,
0, -3.930024, -5.700538, 1, 1.5, 0.5, 0.5,
0, -3.930024, -5.700538, 0, 1.5, 0.5, 0.5,
1, -3.930024, -5.700538, 0, -0.5, 0.5, 0.5,
1, -3.930024, -5.700538, 1, -0.5, 0.5, 0.5,
1, -3.930024, -5.700538, 1, 1.5, 0.5, 0.5,
1, -3.930024, -5.700538, 0, 1.5, 0.5, 0.5,
2, -3.930024, -5.700538, 0, -0.5, 0.5, 0.5,
2, -3.930024, -5.700538, 1, -0.5, 0.5, 0.5,
2, -3.930024, -5.700538, 1, 1.5, 0.5, 0.5,
2, -3.930024, -5.700538, 0, 1.5, 0.5, 0.5,
3, -3.930024, -5.700538, 0, -0.5, 0.5, 0.5,
3, -3.930024, -5.700538, 1, -0.5, 0.5, 0.5,
3, -3.930024, -5.700538, 1, 1.5, 0.5, 0.5,
3, -3.930024, -5.700538, 0, 1.5, 0.5, 0.5
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
-3.188335, -3, -4.906787,
-3.188335, 2, -4.906787,
-3.188335, -3, -4.906787,
-3.35226, -3, -5.171371,
-3.188335, -2, -4.906787,
-3.35226, -2, -5.171371,
-3.188335, -1, -4.906787,
-3.35226, -1, -5.171371,
-3.188335, 0, -4.906787,
-3.35226, 0, -5.171371,
-3.188335, 1, -4.906787,
-3.35226, 1, -5.171371,
-3.188335, 2, -4.906787,
-3.35226, 2, -5.171371
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
-3.68011, -3, -5.700538, 0, -0.5, 0.5, 0.5,
-3.68011, -3, -5.700538, 1, -0.5, 0.5, 0.5,
-3.68011, -3, -5.700538, 1, 1.5, 0.5, 0.5,
-3.68011, -3, -5.700538, 0, 1.5, 0.5, 0.5,
-3.68011, -2, -5.700538, 0, -0.5, 0.5, 0.5,
-3.68011, -2, -5.700538, 1, -0.5, 0.5, 0.5,
-3.68011, -2, -5.700538, 1, 1.5, 0.5, 0.5,
-3.68011, -2, -5.700538, 0, 1.5, 0.5, 0.5,
-3.68011, -1, -5.700538, 0, -0.5, 0.5, 0.5,
-3.68011, -1, -5.700538, 1, -0.5, 0.5, 0.5,
-3.68011, -1, -5.700538, 1, 1.5, 0.5, 0.5,
-3.68011, -1, -5.700538, 0, 1.5, 0.5, 0.5,
-3.68011, 0, -5.700538, 0, -0.5, 0.5, 0.5,
-3.68011, 0, -5.700538, 1, -0.5, 0.5, 0.5,
-3.68011, 0, -5.700538, 1, 1.5, 0.5, 0.5,
-3.68011, 0, -5.700538, 0, 1.5, 0.5, 0.5,
-3.68011, 1, -5.700538, 0, -0.5, 0.5, 0.5,
-3.68011, 1, -5.700538, 1, -0.5, 0.5, 0.5,
-3.68011, 1, -5.700538, 1, 1.5, 0.5, 0.5,
-3.68011, 1, -5.700538, 0, 1.5, 0.5, 0.5,
-3.68011, 2, -5.700538, 0, -0.5, 0.5, 0.5,
-3.68011, 2, -5.700538, 1, -0.5, 0.5, 0.5,
-3.68011, 2, -5.700538, 1, 1.5, 0.5, 0.5,
-3.68011, 2, -5.700538, 0, 1.5, 0.5, 0.5
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
-3.188335, -3.443936, -4,
-3.188335, -3.443936, 4,
-3.188335, -3.443936, -4,
-3.35226, -3.605965, -4,
-3.188335, -3.443936, -2,
-3.35226, -3.605965, -2,
-3.188335, -3.443936, 0,
-3.35226, -3.605965, 0,
-3.188335, -3.443936, 2,
-3.35226, -3.605965, 2,
-3.188335, -3.443936, 4,
-3.35226, -3.605965, 4
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
-3.68011, -3.930024, -4, 0, -0.5, 0.5, 0.5,
-3.68011, -3.930024, -4, 1, -0.5, 0.5, 0.5,
-3.68011, -3.930024, -4, 1, 1.5, 0.5, 0.5,
-3.68011, -3.930024, -4, 0, 1.5, 0.5, 0.5,
-3.68011, -3.930024, -2, 0, -0.5, 0.5, 0.5,
-3.68011, -3.930024, -2, 1, -0.5, 0.5, 0.5,
-3.68011, -3.930024, -2, 1, 1.5, 0.5, 0.5,
-3.68011, -3.930024, -2, 0, 1.5, 0.5, 0.5,
-3.68011, -3.930024, 0, 0, -0.5, 0.5, 0.5,
-3.68011, -3.930024, 0, 1, -0.5, 0.5, 0.5,
-3.68011, -3.930024, 0, 1, 1.5, 0.5, 0.5,
-3.68011, -3.930024, 0, 0, 1.5, 0.5, 0.5,
-3.68011, -3.930024, 2, 0, -0.5, 0.5, 0.5,
-3.68011, -3.930024, 2, 1, -0.5, 0.5, 0.5,
-3.68011, -3.930024, 2, 1, 1.5, 0.5, 0.5,
-3.68011, -3.930024, 2, 0, 1.5, 0.5, 0.5,
-3.68011, -3.930024, 4, 0, -0.5, 0.5, 0.5,
-3.68011, -3.930024, 4, 1, -0.5, 0.5, 0.5,
-3.68011, -3.930024, 4, 1, 1.5, 0.5, 0.5,
-3.68011, -3.930024, 4, 0, 1.5, 0.5, 0.5
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
-3.188335, -3.443936, -4.906787,
-3.188335, 3.037245, -4.906787,
-3.188335, -3.443936, 5.676548,
-3.188335, 3.037245, 5.676548,
-3.188335, -3.443936, -4.906787,
-3.188335, -3.443936, 5.676548,
-3.188335, 3.037245, -4.906787,
-3.188335, 3.037245, 5.676548,
-3.188335, -3.443936, -4.906787,
3.368658, -3.443936, -4.906787,
-3.188335, -3.443936, 5.676548,
3.368658, -3.443936, 5.676548,
-3.188335, 3.037245, -4.906787,
3.368658, 3.037245, -4.906787,
-3.188335, 3.037245, 5.676548,
3.368658, 3.037245, 5.676548,
3.368658, -3.443936, -4.906787,
3.368658, 3.037245, -4.906787,
3.368658, -3.443936, 5.676548,
3.368658, 3.037245, 5.676548,
3.368658, -3.443936, -4.906787,
3.368658, -3.443936, 5.676548,
3.368658, 3.037245, -4.906787,
3.368658, 3.037245, 5.676548
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
var radius = 7.494905;
var distance = 33.34568;
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
mvMatrix.translate( -0.09016132, 0.2033455, -0.3848801 );
mvMatrix.scale( 1.235877, 1.250334, 0.765698 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.34568);
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


