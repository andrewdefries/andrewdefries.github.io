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
-3.072518, -0.1755378, -1.525166, 1, 0, 0, 1,
-2.814178, 0.1064358, -2.127894, 1, 0.007843138, 0, 1,
-2.666446, -0.6050458, -1.305838, 1, 0.01176471, 0, 1,
-2.62398, 0.5044326, -2.01973, 1, 0.01960784, 0, 1,
-2.604231, 0.891108, -2.59387, 1, 0.02352941, 0, 1,
-2.599963, -0.8989487, -2.239131, 1, 0.03137255, 0, 1,
-2.58516, -0.6612033, -2.867709, 1, 0.03529412, 0, 1,
-2.524366, -0.00475874, -1.344544, 1, 0.04313726, 0, 1,
-2.461025, -0.608124, -1.058059, 1, 0.04705882, 0, 1,
-2.458528, -1.146357, -1.443703, 1, 0.05490196, 0, 1,
-2.453508, -0.05819643, -0.3391619, 1, 0.05882353, 0, 1,
-2.40887, 0.2309714, -1.317479, 1, 0.06666667, 0, 1,
-2.378499, 0.9424534, 0.2290595, 1, 0.07058824, 0, 1,
-2.315866, -0.1480614, 0.179924, 1, 0.07843138, 0, 1,
-2.283932, 0.4509607, -2.309265, 1, 0.08235294, 0, 1,
-2.283819, -0.270987, 0.2457883, 1, 0.09019608, 0, 1,
-2.205243, -1.530692, -3.493967, 1, 0.09411765, 0, 1,
-2.170475, -0.1014131, 0.5535179, 1, 0.1019608, 0, 1,
-2.153612, 0.2964251, -1.783426, 1, 0.1098039, 0, 1,
-2.103883, 0.8060516, -0.9272048, 1, 0.1137255, 0, 1,
-2.077463, 1.365629, -2.786312, 1, 0.1215686, 0, 1,
-2.071003, -1.203181, -1.246539, 1, 0.1254902, 0, 1,
-2.060624, 0.1417308, -1.677706, 1, 0.1333333, 0, 1,
-2.042233, 0.6476302, -1.462836, 1, 0.1372549, 0, 1,
-2.032127, -0.5442873, -3.067553, 1, 0.145098, 0, 1,
-2.013288, 0.6102617, -0.2492855, 1, 0.1490196, 0, 1,
-2.004111, -0.8802815, -4.218987, 1, 0.1568628, 0, 1,
-1.993048, -0.7683401, -1.295885, 1, 0.1607843, 0, 1,
-1.984592, 0.6048055, -1.390825, 1, 0.1686275, 0, 1,
-1.944581, 0.2187847, -4.151292, 1, 0.172549, 0, 1,
-1.940727, -1.589439, -2.884245, 1, 0.1803922, 0, 1,
-1.932043, -0.4216472, -1.284176, 1, 0.1843137, 0, 1,
-1.921796, -0.8580964, -1.932304, 1, 0.1921569, 0, 1,
-1.894922, 0.3652123, -0.7766777, 1, 0.1960784, 0, 1,
-1.889358, -0.7952352, -2.210527, 1, 0.2039216, 0, 1,
-1.875152, -0.7300743, -2.939795, 1, 0.2117647, 0, 1,
-1.874343, -0.3995912, -3.321813, 1, 0.2156863, 0, 1,
-1.852375, -1.454205, -2.986223, 1, 0.2235294, 0, 1,
-1.81283, -0.04222978, -1.42468, 1, 0.227451, 0, 1,
-1.806728, 1.28927, -0.5907804, 1, 0.2352941, 0, 1,
-1.788334, 0.2124151, -1.919665, 1, 0.2392157, 0, 1,
-1.787784, 1.674317, -1.925223, 1, 0.2470588, 0, 1,
-1.744712, -1.949007, -4.067536, 1, 0.2509804, 0, 1,
-1.741507, -1.148651, -1.278655, 1, 0.2588235, 0, 1,
-1.717493, 0.5441471, -1.632483, 1, 0.2627451, 0, 1,
-1.702474, 2.958323, 0.03762344, 1, 0.2705882, 0, 1,
-1.698529, -0.6143526, -2.316846, 1, 0.2745098, 0, 1,
-1.679429, 0.8601198, -1.13658, 1, 0.282353, 0, 1,
-1.677125, -0.8944073, -0.2786205, 1, 0.2862745, 0, 1,
-1.673969, 1.647405, -1.310071, 1, 0.2941177, 0, 1,
-1.670968, -0.3604685, -1.559301, 1, 0.3019608, 0, 1,
-1.668515, 0.1021765, -1.763477, 1, 0.3058824, 0, 1,
-1.660173, -0.3900523, -1.267452, 1, 0.3137255, 0, 1,
-1.645133, -0.4890217, -2.139926, 1, 0.3176471, 0, 1,
-1.642637, -0.1975975, -1.624182, 1, 0.3254902, 0, 1,
-1.591463, 0.6172222, -1.089052, 1, 0.3294118, 0, 1,
-1.587787, 0.2941501, -0.236946, 1, 0.3372549, 0, 1,
-1.579589, 0.2142252, -0.1900009, 1, 0.3411765, 0, 1,
-1.569096, 1.807311, 0.3862842, 1, 0.3490196, 0, 1,
-1.532975, -1.55538, -1.277116, 1, 0.3529412, 0, 1,
-1.524881, -0.4264866, -2.379202, 1, 0.3607843, 0, 1,
-1.516471, 0.5463144, -1.174578, 1, 0.3647059, 0, 1,
-1.500681, -0.5999421, -2.502384, 1, 0.372549, 0, 1,
-1.499471, 2.10839, -0.9280474, 1, 0.3764706, 0, 1,
-1.491684, 1.731886, -1.01118, 1, 0.3843137, 0, 1,
-1.486227, 1.000995, -1.190757, 1, 0.3882353, 0, 1,
-1.478025, -3.311692, -4.113613, 1, 0.3960784, 0, 1,
-1.473775, -0.09543099, -0.6741118, 1, 0.4039216, 0, 1,
-1.470515, -0.4432631, -1.69153, 1, 0.4078431, 0, 1,
-1.440599, -0.5727093, -1.154853, 1, 0.4156863, 0, 1,
-1.422785, 1.340598, 0.3354679, 1, 0.4196078, 0, 1,
-1.405663, 0.1025838, -1.594131, 1, 0.427451, 0, 1,
-1.405595, -0.6780245, -2.896142, 1, 0.4313726, 0, 1,
-1.404378, 1.026935, -2.495154, 1, 0.4392157, 0, 1,
-1.399038, 0.3416553, 0.6040056, 1, 0.4431373, 0, 1,
-1.376358, -0.1477721, -1.607686, 1, 0.4509804, 0, 1,
-1.376279, 0.7254848, -1.313003, 1, 0.454902, 0, 1,
-1.37249, -0.8370496, -2.145543, 1, 0.4627451, 0, 1,
-1.364786, -1.501773, -2.949138, 1, 0.4666667, 0, 1,
-1.347809, -0.1613077, -1.789569, 1, 0.4745098, 0, 1,
-1.341036, -0.8082486, -5.12354, 1, 0.4784314, 0, 1,
-1.332533, -1.953956, -2.834257, 1, 0.4862745, 0, 1,
-1.308953, -0.7960682, -0.06308844, 1, 0.4901961, 0, 1,
-1.308931, 0.8205161, 0.2578214, 1, 0.4980392, 0, 1,
-1.306712, -0.9483639, -3.286886, 1, 0.5058824, 0, 1,
-1.302724, -1.353759, -3.357363, 1, 0.509804, 0, 1,
-1.302577, 0.2558765, -0.9399501, 1, 0.5176471, 0, 1,
-1.298793, 0.1818672, -1.259749, 1, 0.5215687, 0, 1,
-1.295579, 2.687793, -0.6320307, 1, 0.5294118, 0, 1,
-1.292468, 0.9765693, -1.376052, 1, 0.5333334, 0, 1,
-1.290319, 0.1876819, 0.3520823, 1, 0.5411765, 0, 1,
-1.289635, 1.069442, -1.352011, 1, 0.5450981, 0, 1,
-1.289108, -0.02747151, -2.546033, 1, 0.5529412, 0, 1,
-1.286445, -0.8098316, -3.146566, 1, 0.5568628, 0, 1,
-1.286163, 0.2375632, -0.6194776, 1, 0.5647059, 0, 1,
-1.284378, 0.1904847, -2.375384, 1, 0.5686275, 0, 1,
-1.283891, 0.611463, 0.3568358, 1, 0.5764706, 0, 1,
-1.281654, -1.468953, -3.022789, 1, 0.5803922, 0, 1,
-1.278196, 0.420319, -0.8948078, 1, 0.5882353, 0, 1,
-1.272761, -0.6541078, -1.461768, 1, 0.5921569, 0, 1,
-1.267848, -0.9842647, -0.7762201, 1, 0.6, 0, 1,
-1.265674, -0.5249006, -1.663088, 1, 0.6078432, 0, 1,
-1.264787, 0.7852176, -2.576654, 1, 0.6117647, 0, 1,
-1.263357, -0.5768445, -2.396111, 1, 0.6196079, 0, 1,
-1.263297, 1.02774, -1.242952, 1, 0.6235294, 0, 1,
-1.249642, -2.607755, -4.234865, 1, 0.6313726, 0, 1,
-1.235789, 1.168441, 0.5912946, 1, 0.6352941, 0, 1,
-1.235263, 0.1233183, -1.10583, 1, 0.6431373, 0, 1,
-1.233873, -0.1955875, -2.688922, 1, 0.6470588, 0, 1,
-1.221808, 0.9844049, -1.41635, 1, 0.654902, 0, 1,
-1.221697, 1.31626, -1.217332, 1, 0.6588235, 0, 1,
-1.221688, 0.07312363, -1.165478, 1, 0.6666667, 0, 1,
-1.217508, -0.8535623, -1.452636, 1, 0.6705883, 0, 1,
-1.21096, 0.1784969, -1.589685, 1, 0.6784314, 0, 1,
-1.206412, 0.8680536, 1.41499, 1, 0.682353, 0, 1,
-1.206138, 0.2513106, -0.9555868, 1, 0.6901961, 0, 1,
-1.204077, -0.5679927, -2.488402, 1, 0.6941177, 0, 1,
-1.203545, 1.71596, -1.316873, 1, 0.7019608, 0, 1,
-1.203489, -0.2583411, -0.5681285, 1, 0.7098039, 0, 1,
-1.19653, -0.7018303, -1.556046, 1, 0.7137255, 0, 1,
-1.19591, -1.526343, -3.296608, 1, 0.7215686, 0, 1,
-1.190787, 0.1923368, -0.1649472, 1, 0.7254902, 0, 1,
-1.183338, 0.09482186, -1.664093, 1, 0.7333333, 0, 1,
-1.176078, -1.128451, -1.187654, 1, 0.7372549, 0, 1,
-1.171211, 0.1908111, 0.1562892, 1, 0.7450981, 0, 1,
-1.170379, 1.084151, -0.1774715, 1, 0.7490196, 0, 1,
-1.168436, -0.3490601, -2.586204, 1, 0.7568628, 0, 1,
-1.156126, 0.1698293, -1.218381, 1, 0.7607843, 0, 1,
-1.141204, 0.3564956, -0.2726648, 1, 0.7686275, 0, 1,
-1.122961, 3.274536, 0.07870097, 1, 0.772549, 0, 1,
-1.118037, -1.045828, -4.119729, 1, 0.7803922, 0, 1,
-1.112025, 0.07332373, -1.345698, 1, 0.7843137, 0, 1,
-1.110025, -1.018195, -2.060855, 1, 0.7921569, 0, 1,
-1.10923, -0.5013902, -1.3112, 1, 0.7960784, 0, 1,
-1.102653, -1.951303, -2.079047, 1, 0.8039216, 0, 1,
-1.100634, 0.0413541, -2.164893, 1, 0.8117647, 0, 1,
-1.083133, -0.02026681, -1.655853, 1, 0.8156863, 0, 1,
-1.079974, 0.008741466, -1.491283, 1, 0.8235294, 0, 1,
-1.075662, -0.5412707, -3.810608, 1, 0.827451, 0, 1,
-1.070128, -0.6794566, -0.9440124, 1, 0.8352941, 0, 1,
-1.058516, -1.362888, -1.92807, 1, 0.8392157, 0, 1,
-1.057303, 1.162456, -0.941084, 1, 0.8470588, 0, 1,
-1.053, 2.725527, -0.3985344, 1, 0.8509804, 0, 1,
-1.046285, -0.1888983, -2.356275, 1, 0.8588235, 0, 1,
-1.041262, -2.733412, -3.399912, 1, 0.8627451, 0, 1,
-1.035234, 0.8022073, -0.3616238, 1, 0.8705882, 0, 1,
-1.030107, 0.08072495, -2.019457, 1, 0.8745098, 0, 1,
-1.029056, 0.002398825, -1.221135, 1, 0.8823529, 0, 1,
-1.020144, -0.1603003, -3.201925, 1, 0.8862745, 0, 1,
-1.015652, 0.1464961, -1.163824, 1, 0.8941177, 0, 1,
-1.008866, 0.6779503, -2.982375, 1, 0.8980392, 0, 1,
-1.008181, -0.4717486, -1.430095, 1, 0.9058824, 0, 1,
-1.005499, -0.07003938, -1.554085, 1, 0.9137255, 0, 1,
-1.00151, 1.646425, -1.633755, 1, 0.9176471, 0, 1,
-0.9985164, 0.6960232, -0.7310202, 1, 0.9254902, 0, 1,
-0.9981294, -1.054114, -2.187889, 1, 0.9294118, 0, 1,
-0.9971669, -0.7079018, -3.045113, 1, 0.9372549, 0, 1,
-0.9958832, 0.05266495, -1.603203, 1, 0.9411765, 0, 1,
-0.9950167, 1.2206, -0.4120831, 1, 0.9490196, 0, 1,
-0.9936165, -0.05642346, -1.190993, 1, 0.9529412, 0, 1,
-0.9923204, 1.739693, -0.1382493, 1, 0.9607843, 0, 1,
-0.9888417, -0.629959, -1.450457, 1, 0.9647059, 0, 1,
-0.9813681, 0.1257132, -3.23064, 1, 0.972549, 0, 1,
-0.9793351, 0.7015564, -2.33825, 1, 0.9764706, 0, 1,
-0.9752571, 1.769087, 2.066012, 1, 0.9843137, 0, 1,
-0.9679209, 0.6078768, -1.917341, 1, 0.9882353, 0, 1,
-0.9543815, -1.735579, -2.791741, 1, 0.9960784, 0, 1,
-0.9530621, -2.510277, -1.516021, 0.9960784, 1, 0, 1,
-0.9460058, 2.42679, -1.474345, 0.9921569, 1, 0, 1,
-0.9446753, -0.2352682, -2.502451, 0.9843137, 1, 0, 1,
-0.9408242, -0.2955589, -1.955336, 0.9803922, 1, 0, 1,
-0.9402533, -0.8527645, -0.5134703, 0.972549, 1, 0, 1,
-0.9360439, -0.3921411, -3.400069, 0.9686275, 1, 0, 1,
-0.9269739, 0.5343229, -0.09053616, 0.9607843, 1, 0, 1,
-0.920951, -0.08053731, -1.921912, 0.9568627, 1, 0, 1,
-0.9208706, 0.7904525, 0.2960199, 0.9490196, 1, 0, 1,
-0.9153569, 0.1297189, -0.1545886, 0.945098, 1, 0, 1,
-0.9089727, -0.9818001, -3.163073, 0.9372549, 1, 0, 1,
-0.9070994, 0.1426074, -2.217321, 0.9333333, 1, 0, 1,
-0.9049522, 0.4173711, -2.014875, 0.9254902, 1, 0, 1,
-0.9009162, -0.8657091, -1.274534, 0.9215686, 1, 0, 1,
-0.9006218, 0.2375972, -0.4686858, 0.9137255, 1, 0, 1,
-0.9000574, -0.08272383, -2.858262, 0.9098039, 1, 0, 1,
-0.8972234, -0.6617321, -1.979705, 0.9019608, 1, 0, 1,
-0.8969975, -1.012093, -1.773985, 0.8941177, 1, 0, 1,
-0.8940668, -0.7968321, -2.656084, 0.8901961, 1, 0, 1,
-0.8822942, -0.1271798, -0.9079849, 0.8823529, 1, 0, 1,
-0.8755237, -0.06145015, -0.9787114, 0.8784314, 1, 0, 1,
-0.872634, -0.6670278, -2.584371, 0.8705882, 1, 0, 1,
-0.8704436, -0.2449831, -1.313605, 0.8666667, 1, 0, 1,
-0.8660126, -0.9362799, -1.26411, 0.8588235, 1, 0, 1,
-0.859755, 1.278228, -0.8538182, 0.854902, 1, 0, 1,
-0.8579541, 0.4357774, -1.960762, 0.8470588, 1, 0, 1,
-0.8567092, 0.4180391, 1.235716, 0.8431373, 1, 0, 1,
-0.8530611, 0.7441972, -1.901588, 0.8352941, 1, 0, 1,
-0.8500018, 0.9139064, -1.042318, 0.8313726, 1, 0, 1,
-0.8471808, -0.5842566, -1.508486, 0.8235294, 1, 0, 1,
-0.8366029, 0.2237371, -1.671132, 0.8196079, 1, 0, 1,
-0.8356533, -1.07619, -2.355432, 0.8117647, 1, 0, 1,
-0.8319135, 0.7706812, -1.141705, 0.8078431, 1, 0, 1,
-0.8317245, 0.3239795, -0.2146871, 0.8, 1, 0, 1,
-0.8278517, 0.9675481, -1.743158, 0.7921569, 1, 0, 1,
-0.8243285, -0.493487, -3.996242, 0.7882353, 1, 0, 1,
-0.8170441, -0.457237, -2.823319, 0.7803922, 1, 0, 1,
-0.8159126, -0.9215971, -4.196678, 0.7764706, 1, 0, 1,
-0.8115044, 2.440138, -1.623081, 0.7686275, 1, 0, 1,
-0.8109505, -0.157713, -2.418028, 0.7647059, 1, 0, 1,
-0.8105357, -0.7347984, -1.621898, 0.7568628, 1, 0, 1,
-0.8061774, -1.46541, -4.558393, 0.7529412, 1, 0, 1,
-0.8038065, -0.9284403, -2.119695, 0.7450981, 1, 0, 1,
-0.8036143, -0.06644337, -2.33182, 0.7411765, 1, 0, 1,
-0.8018881, -0.5533649, -2.069185, 0.7333333, 1, 0, 1,
-0.8016453, 0.8069285, -0.03076488, 0.7294118, 1, 0, 1,
-0.7942179, -1.114983, -2.507616, 0.7215686, 1, 0, 1,
-0.7878354, 0.07420128, -1.645421, 0.7176471, 1, 0, 1,
-0.7840254, 0.2182782, -2.979768, 0.7098039, 1, 0, 1,
-0.7825965, -0.2376361, 0.9137388, 0.7058824, 1, 0, 1,
-0.7799771, 0.8508945, -0.06257178, 0.6980392, 1, 0, 1,
-0.7792612, 0.5339821, 1.732533, 0.6901961, 1, 0, 1,
-0.7781785, 1.074568, 0.3183838, 0.6862745, 1, 0, 1,
-0.7778802, -0.2882384, -1.487478, 0.6784314, 1, 0, 1,
-0.7711598, 0.9491028, 0.2760021, 0.6745098, 1, 0, 1,
-0.7578126, 1.469651, -0.05230744, 0.6666667, 1, 0, 1,
-0.7553709, -0.4235978, -0.8403743, 0.6627451, 1, 0, 1,
-0.7543197, -0.7010285, -2.233455, 0.654902, 1, 0, 1,
-0.7492771, -0.8284612, -1.492265, 0.6509804, 1, 0, 1,
-0.7475293, -0.05523645, -1.700011, 0.6431373, 1, 0, 1,
-0.7452618, 1.095945, -1.746004, 0.6392157, 1, 0, 1,
-0.7450555, -0.4909911, -3.727362, 0.6313726, 1, 0, 1,
-0.7327686, -0.1364809, -0.9267891, 0.627451, 1, 0, 1,
-0.7317276, -0.7311947, -4.283469, 0.6196079, 1, 0, 1,
-0.7292652, 0.1292849, 0.3983034, 0.6156863, 1, 0, 1,
-0.7263652, 0.903651, 0.1332378, 0.6078432, 1, 0, 1,
-0.723222, -0.09376106, -0.8661993, 0.6039216, 1, 0, 1,
-0.7213866, -0.3278508, -0.9373299, 0.5960785, 1, 0, 1,
-0.7147112, -0.08957896, -1.77284, 0.5882353, 1, 0, 1,
-0.7134261, -0.737637, -2.09086, 0.5843138, 1, 0, 1,
-0.7110803, 0.4198298, -0.8687238, 0.5764706, 1, 0, 1,
-0.7047339, -0.6323118, -3.569445, 0.572549, 1, 0, 1,
-0.7045668, 1.138591, -1.541625, 0.5647059, 1, 0, 1,
-0.7032674, 1.087069, -0.6080147, 0.5607843, 1, 0, 1,
-0.7002825, -0.4170823, -3.098631, 0.5529412, 1, 0, 1,
-0.6996207, 1.215405, -0.6060883, 0.5490196, 1, 0, 1,
-0.6953255, -0.3395205, -2.482558, 0.5411765, 1, 0, 1,
-0.6948321, 0.4977602, -0.1774606, 0.5372549, 1, 0, 1,
-0.691944, 0.1520094, -0.3213714, 0.5294118, 1, 0, 1,
-0.6882646, 0.2320458, -1.105735, 0.5254902, 1, 0, 1,
-0.6881371, -0.8103129, -2.898094, 0.5176471, 1, 0, 1,
-0.68782, -0.4835087, -2.362384, 0.5137255, 1, 0, 1,
-0.6876656, -0.2070521, -1.5307, 0.5058824, 1, 0, 1,
-0.6843781, -0.2864107, -0.1665813, 0.5019608, 1, 0, 1,
-0.6832991, -0.5414069, -0.7614169, 0.4941176, 1, 0, 1,
-0.6795161, -0.09745619, 0.1501519, 0.4862745, 1, 0, 1,
-0.670612, 0.9279203, -0.8150677, 0.4823529, 1, 0, 1,
-0.6701292, -0.1396107, -3.424212, 0.4745098, 1, 0, 1,
-0.6694027, -0.1153136, -2.056553, 0.4705882, 1, 0, 1,
-0.6680408, 0.2264663, -0.3978485, 0.4627451, 1, 0, 1,
-0.6672656, 0.5262526, -0.8445928, 0.4588235, 1, 0, 1,
-0.6625772, 1.442235, -0.6347119, 0.4509804, 1, 0, 1,
-0.6620615, 0.2192691, 0.5212449, 0.4470588, 1, 0, 1,
-0.6612635, -0.4095722, -0.8134176, 0.4392157, 1, 0, 1,
-0.6541129, -0.3961358, -2.672833, 0.4352941, 1, 0, 1,
-0.6521481, -0.3626254, -1.077972, 0.427451, 1, 0, 1,
-0.6484016, 1.699366, 0.907415, 0.4235294, 1, 0, 1,
-0.6414366, 0.2944111, -1.438517, 0.4156863, 1, 0, 1,
-0.6389762, 0.4667052, 0.1426046, 0.4117647, 1, 0, 1,
-0.6386855, -0.3189444, -4.254464, 0.4039216, 1, 0, 1,
-0.6375568, -0.4635831, -2.442491, 0.3960784, 1, 0, 1,
-0.6292599, 2.301347, -0.6941504, 0.3921569, 1, 0, 1,
-0.6291752, -0.1303748, -2.454411, 0.3843137, 1, 0, 1,
-0.6245174, -0.3040016, -2.001742, 0.3803922, 1, 0, 1,
-0.6205705, 0.795507, 1.552771, 0.372549, 1, 0, 1,
-0.6153004, 0.5008137, -3.065572, 0.3686275, 1, 0, 1,
-0.6102393, 1.436824, -2.52476, 0.3607843, 1, 0, 1,
-0.608489, 1.127028, -0.5821653, 0.3568628, 1, 0, 1,
-0.604645, 1.502583, 0.1353448, 0.3490196, 1, 0, 1,
-0.6035448, 0.9092114, 1.072995, 0.345098, 1, 0, 1,
-0.6022305, 1.440417, -0.06632105, 0.3372549, 1, 0, 1,
-0.6021256, 1.5475, -1.683455, 0.3333333, 1, 0, 1,
-0.6008125, 0.4550756, -1.150226, 0.3254902, 1, 0, 1,
-0.5983892, -2.357769, -3.607473, 0.3215686, 1, 0, 1,
-0.5948301, -1.230489, -1.402385, 0.3137255, 1, 0, 1,
-0.5945989, 0.02942144, -3.681561, 0.3098039, 1, 0, 1,
-0.5944067, -0.3957169, -1.160041, 0.3019608, 1, 0, 1,
-0.5923753, 0.6237421, -1.287025, 0.2941177, 1, 0, 1,
-0.5914057, 2.054991, -0.5365483, 0.2901961, 1, 0, 1,
-0.5849692, 0.226282, -1.052987, 0.282353, 1, 0, 1,
-0.5843803, -0.2123176, -1.8202, 0.2784314, 1, 0, 1,
-0.5802116, -0.8221254, -3.386803, 0.2705882, 1, 0, 1,
-0.578733, 0.2380009, -1.977752, 0.2666667, 1, 0, 1,
-0.5758967, -0.1931498, -2.061475, 0.2588235, 1, 0, 1,
-0.5683303, 0.6064787, 0.2455534, 0.254902, 1, 0, 1,
-0.567966, -2.472434, -3.055216, 0.2470588, 1, 0, 1,
-0.5626202, -0.7280816, -3.272367, 0.2431373, 1, 0, 1,
-0.5593315, -1.534663, -3.159666, 0.2352941, 1, 0, 1,
-0.5547546, -2.018271, -3.798345, 0.2313726, 1, 0, 1,
-0.5530802, 0.07683109, -3.070204, 0.2235294, 1, 0, 1,
-0.5528587, -1.728454, -2.972345, 0.2196078, 1, 0, 1,
-0.5507908, 1.189534, -2.766064, 0.2117647, 1, 0, 1,
-0.5472807, 0.4815989, -1.496344, 0.2078431, 1, 0, 1,
-0.545737, -0.9247265, -1.80713, 0.2, 1, 0, 1,
-0.5428504, -1.22723, -0.3063165, 0.1921569, 1, 0, 1,
-0.5418376, 0.3990159, -1.8696, 0.1882353, 1, 0, 1,
-0.5351886, 1.051975, -1.115682, 0.1803922, 1, 0, 1,
-0.5332464, -0.008966617, -1.532769, 0.1764706, 1, 0, 1,
-0.5327445, 0.4460605, -1.278032, 0.1686275, 1, 0, 1,
-0.5293857, -0.6851408, -2.138659, 0.1647059, 1, 0, 1,
-0.5270498, -1.801098, -1.65677, 0.1568628, 1, 0, 1,
-0.5224592, 0.06799002, -1.302118, 0.1529412, 1, 0, 1,
-0.5167346, -1.164017, -2.536768, 0.145098, 1, 0, 1,
-0.5158805, 0.6165736, -1.298499, 0.1411765, 1, 0, 1,
-0.5152099, 0.2115085, 0.687446, 0.1333333, 1, 0, 1,
-0.5138742, 0.468937, -0.318694, 0.1294118, 1, 0, 1,
-0.5126495, 0.8099035, 0.5704178, 0.1215686, 1, 0, 1,
-0.5084066, 0.2869236, 0.1283085, 0.1176471, 1, 0, 1,
-0.5062213, -0.8972435, -2.725895, 0.1098039, 1, 0, 1,
-0.5035089, -0.6370497, -3.425215, 0.1058824, 1, 0, 1,
-0.5017946, -0.6413966, -1.355012, 0.09803922, 1, 0, 1,
-0.5013213, -0.862946, -1.009028, 0.09019608, 1, 0, 1,
-0.4953338, 0.2525936, 0.009467209, 0.08627451, 1, 0, 1,
-0.4916846, 0.154206, -1.324033, 0.07843138, 1, 0, 1,
-0.4909347, 3.564726, 0.7576227, 0.07450981, 1, 0, 1,
-0.4880097, 0.271776, -0.2834438, 0.06666667, 1, 0, 1,
-0.4861441, 0.1520415, -1.718456, 0.0627451, 1, 0, 1,
-0.4857123, -1.016979, -1.182285, 0.05490196, 1, 0, 1,
-0.4812411, 0.448902, 0.2784456, 0.05098039, 1, 0, 1,
-0.4767532, 1.10411, -1.541727, 0.04313726, 1, 0, 1,
-0.4763212, -0.02089326, 0.386783, 0.03921569, 1, 0, 1,
-0.476319, 0.9983186, -0.4034076, 0.03137255, 1, 0, 1,
-0.472651, 1.381601, -2.23827, 0.02745098, 1, 0, 1,
-0.4700065, 0.08173359, -2.49246, 0.01960784, 1, 0, 1,
-0.4628328, 1.032086, 0.6806717, 0.01568628, 1, 0, 1,
-0.4616824, 0.09628282, -1.034326, 0.007843138, 1, 0, 1,
-0.4611239, -0.2629405, -2.738395, 0.003921569, 1, 0, 1,
-0.4576772, 1.748731, -3.15698, 0, 1, 0.003921569, 1,
-0.4553116, -0.7072836, -3.091851, 0, 1, 0.01176471, 1,
-0.4513672, 0.07387766, -1.339486, 0, 1, 0.01568628, 1,
-0.449527, -1.451503, -2.84945, 0, 1, 0.02352941, 1,
-0.4467011, 0.7024297, -1.205026, 0, 1, 0.02745098, 1,
-0.4390212, -1.103149, -3.089112, 0, 1, 0.03529412, 1,
-0.437554, 1.061678, 0.2333239, 0, 1, 0.03921569, 1,
-0.4308804, 0.05770609, -1.547579, 0, 1, 0.04705882, 1,
-0.4284346, -1.036991, -2.638456, 0, 1, 0.05098039, 1,
-0.4211917, -1.159572, -1.769515, 0, 1, 0.05882353, 1,
-0.4179968, -0.8569428, -2.048356, 0, 1, 0.0627451, 1,
-0.4153654, 1.556668, 0.3843758, 0, 1, 0.07058824, 1,
-0.4053342, 0.8352795, -1.71318, 0, 1, 0.07450981, 1,
-0.4001233, -0.2382811, -2.585424, 0, 1, 0.08235294, 1,
-0.3999862, -1.52993, -3.474691, 0, 1, 0.08627451, 1,
-0.3999482, 0.549875, -0.2264159, 0, 1, 0.09411765, 1,
-0.3993014, -0.9827638, -4.155299, 0, 1, 0.1019608, 1,
-0.3942952, -0.2851133, -3.483809, 0, 1, 0.1058824, 1,
-0.3924227, -1.60522, -3.812473, 0, 1, 0.1137255, 1,
-0.387744, -0.4134906, -0.9600981, 0, 1, 0.1176471, 1,
-0.3791505, -0.1790099, -1.672293, 0, 1, 0.1254902, 1,
-0.3783971, 0.089266, -0.9480721, 0, 1, 0.1294118, 1,
-0.3735591, -1.235662, -3.857367, 0, 1, 0.1372549, 1,
-0.3726746, 0.1801089, -0.02497174, 0, 1, 0.1411765, 1,
-0.3726217, 0.5477691, -0.1227364, 0, 1, 0.1490196, 1,
-0.3692399, 0.3811287, -1.68957, 0, 1, 0.1529412, 1,
-0.3674528, -0.7677174, -2.510787, 0, 1, 0.1607843, 1,
-0.3666712, 1.081468, -1.33626, 0, 1, 0.1647059, 1,
-0.3666487, -0.7285413, -3.408405, 0, 1, 0.172549, 1,
-0.3657949, -1.878444, -2.518348, 0, 1, 0.1764706, 1,
-0.3647636, -1.131354, -4.618534, 0, 1, 0.1843137, 1,
-0.3635663, 0.5298774, 0.6482408, 0, 1, 0.1882353, 1,
-0.359698, -0.5823027, -3.349486, 0, 1, 0.1960784, 1,
-0.3538387, 1.938235, 1.510779, 0, 1, 0.2039216, 1,
-0.3532863, -0.7515243, -4.139461, 0, 1, 0.2078431, 1,
-0.3521258, 0.1743443, -0.1329553, 0, 1, 0.2156863, 1,
-0.3506243, 0.02394004, -0.1580154, 0, 1, 0.2196078, 1,
-0.3464482, 0.1952969, -0.6354425, 0, 1, 0.227451, 1,
-0.3454115, 0.6812586, -0.7050477, 0, 1, 0.2313726, 1,
-0.343554, -0.1106657, -0.2946347, 0, 1, 0.2392157, 1,
-0.340166, -1.276695, -3.667927, 0, 1, 0.2431373, 1,
-0.3397146, -0.3438894, -1.145144, 0, 1, 0.2509804, 1,
-0.3370982, -0.9085558, -2.516116, 0, 1, 0.254902, 1,
-0.3335221, 0.02767134, -2.24473, 0, 1, 0.2627451, 1,
-0.3295672, 0.4524447, -2.134809, 0, 1, 0.2666667, 1,
-0.3292682, -0.2904527, -1.335836, 0, 1, 0.2745098, 1,
-0.3221517, -0.302702, -0.8967347, 0, 1, 0.2784314, 1,
-0.3217538, 0.9513458, -1.097856, 0, 1, 0.2862745, 1,
-0.3180066, -0.3406224, -5.124207, 0, 1, 0.2901961, 1,
-0.3169472, -0.4762224, -3.287716, 0, 1, 0.2980392, 1,
-0.3135285, -0.3547433, -2.792453, 0, 1, 0.3058824, 1,
-0.3126167, 0.5542303, -0.6940985, 0, 1, 0.3098039, 1,
-0.3084717, -0.471741, -4.091525, 0, 1, 0.3176471, 1,
-0.3062899, 2.229681, 1.382213, 0, 1, 0.3215686, 1,
-0.3027467, 1.50689, 0.7857761, 0, 1, 0.3294118, 1,
-0.3014844, 0.5975721, 0.4298786, 0, 1, 0.3333333, 1,
-0.2906982, -1.757861, -3.152189, 0, 1, 0.3411765, 1,
-0.2862105, 0.6269411, -1.702295, 0, 1, 0.345098, 1,
-0.2817343, -0.3058842, -2.974489, 0, 1, 0.3529412, 1,
-0.280152, 0.7917503, 0.2361973, 0, 1, 0.3568628, 1,
-0.2781998, 0.4730245, 0.2602471, 0, 1, 0.3647059, 1,
-0.2765859, -0.2218762, -3.128586, 0, 1, 0.3686275, 1,
-0.2753506, 1.242725, 2.278004, 0, 1, 0.3764706, 1,
-0.2712179, 0.1839674, -1.271452, 0, 1, 0.3803922, 1,
-0.2710937, 0.5622684, -2.034914, 0, 1, 0.3882353, 1,
-0.2635753, 0.80656, -1.430795, 0, 1, 0.3921569, 1,
-0.2634584, -0.4993107, -1.832481, 0, 1, 0.4, 1,
-0.2544965, 0.3494866, -1.748775, 0, 1, 0.4078431, 1,
-0.253453, 0.9228322, -0.2665093, 0, 1, 0.4117647, 1,
-0.2530691, 0.4388058, 0.7384578, 0, 1, 0.4196078, 1,
-0.252368, -0.8722782, -2.479395, 0, 1, 0.4235294, 1,
-0.2516135, -0.3422511, -3.015238, 0, 1, 0.4313726, 1,
-0.2504941, -1.30484, -3.771101, 0, 1, 0.4352941, 1,
-0.2432148, -1.832527, -1.845905, 0, 1, 0.4431373, 1,
-0.2414245, -0.9435379, -4.476832, 0, 1, 0.4470588, 1,
-0.2400338, 1.043265, 0.6818374, 0, 1, 0.454902, 1,
-0.2383301, -0.2050992, -2.604661, 0, 1, 0.4588235, 1,
-0.2353997, 2.884246, 0.5847256, 0, 1, 0.4666667, 1,
-0.2346528, 0.4631453, 0.06076286, 0, 1, 0.4705882, 1,
-0.2344735, 0.6788863, -2.558675, 0, 1, 0.4784314, 1,
-0.2277854, -1.434945, -2.818789, 0, 1, 0.4823529, 1,
-0.2268132, 1.191325, -0.1629596, 0, 1, 0.4901961, 1,
-0.2258307, 0.9081734, -0.7025411, 0, 1, 0.4941176, 1,
-0.225401, 0.816361, -0.5030607, 0, 1, 0.5019608, 1,
-0.2242436, -2.771796, -1.858896, 0, 1, 0.509804, 1,
-0.2237957, 0.1817288, -0.7106712, 0, 1, 0.5137255, 1,
-0.2236978, -1.291735, -2.583683, 0, 1, 0.5215687, 1,
-0.2227777, -0.06258243, -1.594097, 0, 1, 0.5254902, 1,
-0.219726, 0.1436155, -2.613292, 0, 1, 0.5333334, 1,
-0.2139036, -0.3053438, -4.451763, 0, 1, 0.5372549, 1,
-0.2107812, 0.7907735, 0.5733041, 0, 1, 0.5450981, 1,
-0.2091973, -0.3025852, -3.196243, 0, 1, 0.5490196, 1,
-0.2084234, 0.6204903, 0.4827071, 0, 1, 0.5568628, 1,
-0.2059085, -1.38739, -4.115725, 0, 1, 0.5607843, 1,
-0.2042248, -0.7061941, -3.703317, 0, 1, 0.5686275, 1,
-0.2041695, 0.848044, -1.25062, 0, 1, 0.572549, 1,
-0.2040146, -0.4293455, -2.081882, 0, 1, 0.5803922, 1,
-0.2007823, -0.05709119, -1.498721, 0, 1, 0.5843138, 1,
-0.1974287, 1.170747, 0.2291327, 0, 1, 0.5921569, 1,
-0.1966915, 0.09583026, 0.3941832, 0, 1, 0.5960785, 1,
-0.1943785, -1.501122, -2.514292, 0, 1, 0.6039216, 1,
-0.18996, 0.01654279, 0.8414648, 0, 1, 0.6117647, 1,
-0.1853939, -0.2920324, -1.898687, 0, 1, 0.6156863, 1,
-0.184531, -1.603189, -4.479311, 0, 1, 0.6235294, 1,
-0.1801058, -2.114518, -1.807014, 0, 1, 0.627451, 1,
-0.1790549, -0.5231056, -1.986196, 0, 1, 0.6352941, 1,
-0.1758612, -0.5526131, -1.968652, 0, 1, 0.6392157, 1,
-0.1724376, -1.928007, -2.656755, 0, 1, 0.6470588, 1,
-0.1703027, 0.6354176, -1.986512, 0, 1, 0.6509804, 1,
-0.1692898, 0.7599526, -0.1879503, 0, 1, 0.6588235, 1,
-0.1671333, 0.08569025, -2.822652, 0, 1, 0.6627451, 1,
-0.165893, -0.9740068, -2.187746, 0, 1, 0.6705883, 1,
-0.1658531, -0.1671389, -1.122952, 0, 1, 0.6745098, 1,
-0.1579303, 0.8225466, 0.04082297, 0, 1, 0.682353, 1,
-0.1553115, -0.7473012, -1.768068, 0, 1, 0.6862745, 1,
-0.1551406, 0.1522778, -3.031693, 0, 1, 0.6941177, 1,
-0.1475375, -0.5553406, -3.677192, 0, 1, 0.7019608, 1,
-0.141921, 0.963917, -1.161334, 0, 1, 0.7058824, 1,
-0.1372264, 2.049819, -0.3141018, 0, 1, 0.7137255, 1,
-0.1346627, 1.391263, 1.513834, 0, 1, 0.7176471, 1,
-0.1332384, -0.3716943, -3.029121, 0, 1, 0.7254902, 1,
-0.1309177, -0.4660869, -2.467603, 0, 1, 0.7294118, 1,
-0.1256375, -0.6625443, -0.8897297, 0, 1, 0.7372549, 1,
-0.1203368, 0.06938899, 0.002136275, 0, 1, 0.7411765, 1,
-0.1189506, -0.08629963, -1.277136, 0, 1, 0.7490196, 1,
-0.1175885, -0.05910961, -2.391734, 0, 1, 0.7529412, 1,
-0.1151486, 0.05935039, -2.954921, 0, 1, 0.7607843, 1,
-0.1145176, -0.3860602, -3.463013, 0, 1, 0.7647059, 1,
-0.1137432, -0.06740644, -3.828499, 0, 1, 0.772549, 1,
-0.1097278, -1.771322, -2.458303, 0, 1, 0.7764706, 1,
-0.1082332, -0.09292889, -2.003703, 0, 1, 0.7843137, 1,
-0.1000786, -1.225825, -0.4583717, 0, 1, 0.7882353, 1,
-0.09998204, -0.2782844, -3.172835, 0, 1, 0.7960784, 1,
-0.09706965, -0.2460987, -2.681764, 0, 1, 0.8039216, 1,
-0.09514882, 1.245353, 0.6171434, 0, 1, 0.8078431, 1,
-0.0934426, 0.3815518, 0.1852035, 0, 1, 0.8156863, 1,
-0.08676942, -0.8115487, -2.875163, 0, 1, 0.8196079, 1,
-0.07898732, -0.02869739, -0.5422078, 0, 1, 0.827451, 1,
-0.07614228, 0.04140408, 1.363089, 0, 1, 0.8313726, 1,
-0.07520083, -0.1774403, -2.109146, 0, 1, 0.8392157, 1,
-0.07327107, -0.9159864, -4.623288, 0, 1, 0.8431373, 1,
-0.07162305, 1.828851, -0.6083123, 0, 1, 0.8509804, 1,
-0.0697983, 0.4697774, -0.5910712, 0, 1, 0.854902, 1,
-0.06717447, -0.7549245, -4.124475, 0, 1, 0.8627451, 1,
-0.0667879, 1.128738, -0.405359, 0, 1, 0.8666667, 1,
-0.06381668, 0.35177, -2.331603, 0, 1, 0.8745098, 1,
-0.06250086, -0.02310334, -0.7643542, 0, 1, 0.8784314, 1,
-0.06192298, 0.04490143, -0.8249667, 0, 1, 0.8862745, 1,
-0.05748292, 1.88913, -0.6689189, 0, 1, 0.8901961, 1,
-0.05463864, -0.1963773, -3.240931, 0, 1, 0.8980392, 1,
-0.04590306, 0.1566663, -0.05523442, 0, 1, 0.9058824, 1,
-0.04579499, -0.100719, -1.582872, 0, 1, 0.9098039, 1,
-0.04504327, -0.1240235, -4.178637, 0, 1, 0.9176471, 1,
-0.04105305, -0.3397221, -1.587243, 0, 1, 0.9215686, 1,
-0.03351271, -0.7558832, -2.453203, 0, 1, 0.9294118, 1,
-0.03138679, -2.243762, -2.60363, 0, 1, 0.9333333, 1,
-0.01893568, -0.6773832, -4.415224, 0, 1, 0.9411765, 1,
-0.01625383, 0.2576938, -0.1293796, 0, 1, 0.945098, 1,
-0.0135309, -1.054049, -3.171373, 0, 1, 0.9529412, 1,
-0.01338867, 1.454733, -0.3824924, 0, 1, 0.9568627, 1,
-0.006971807, 0.2490609, -0.3617558, 0, 1, 0.9647059, 1,
-0.00624638, 1.789333, -0.7757819, 0, 1, 0.9686275, 1,
-0.00376369, 1.308581, -2.941519, 0, 1, 0.9764706, 1,
-0.002182557, 1.950499, -0.4476106, 0, 1, 0.9803922, 1,
0.0004878854, 0.1692086, -0.8783079, 0, 1, 0.9882353, 1,
0.003341787, 0.5219676, 2.029738, 0, 1, 0.9921569, 1,
0.003745724, 0.8986111, -0.1845196, 0, 1, 1, 1,
0.007194064, -0.5588413, 1.838336, 0, 0.9921569, 1, 1,
0.008056493, -1.001463, 2.943795, 0, 0.9882353, 1, 1,
0.009093564, -0.07428717, 2.168455, 0, 0.9803922, 1, 1,
0.01677519, -0.1768874, 1.229856, 0, 0.9764706, 1, 1,
0.01730987, -0.8435107, 3.605813, 0, 0.9686275, 1, 1,
0.01799604, -1.487066, 3.626866, 0, 0.9647059, 1, 1,
0.02206947, -0.124889, 4.252092, 0, 0.9568627, 1, 1,
0.02356785, 1.073583, -0.9918142, 0, 0.9529412, 1, 1,
0.02660721, -0.337191, 2.677644, 0, 0.945098, 1, 1,
0.03614686, 0.03190356, 3.117244, 0, 0.9411765, 1, 1,
0.04115968, 0.5756316, 1.025445, 0, 0.9333333, 1, 1,
0.04165464, 0.5564059, 2.725865, 0, 0.9294118, 1, 1,
0.04519714, 1.598155, -0.354185, 0, 0.9215686, 1, 1,
0.0460207, 0.2776127, -0.08457644, 0, 0.9176471, 1, 1,
0.04795363, -0.1143756, 1.104093, 0, 0.9098039, 1, 1,
0.05130301, 1.479829, 0.2766553, 0, 0.9058824, 1, 1,
0.05257212, 1.976474, 0.302399, 0, 0.8980392, 1, 1,
0.05316866, -0.7653968, 2.392122, 0, 0.8901961, 1, 1,
0.05868903, 1.60488, 0.2294909, 0, 0.8862745, 1, 1,
0.05911348, 0.05832531, -0.80078, 0, 0.8784314, 1, 1,
0.05918544, -0.1348927, 3.510128, 0, 0.8745098, 1, 1,
0.06195634, -0.08002985, 3.922395, 0, 0.8666667, 1, 1,
0.06199704, 0.04897064, 0.7284809, 0, 0.8627451, 1, 1,
0.06215171, -0.4907874, 4.031287, 0, 0.854902, 1, 1,
0.06434525, -0.02284962, 2.76543, 0, 0.8509804, 1, 1,
0.0687177, -0.2484451, 2.139612, 0, 0.8431373, 1, 1,
0.07189012, 1.532103, 0.1575505, 0, 0.8392157, 1, 1,
0.07325874, -1.119599, 3.652926, 0, 0.8313726, 1, 1,
0.07440368, -0.7879018, 2.226701, 0, 0.827451, 1, 1,
0.07450941, -0.4506762, 4.359419, 0, 0.8196079, 1, 1,
0.08372123, -0.3975271, 1.439997, 0, 0.8156863, 1, 1,
0.09140948, 1.297225, 0.7069124, 0, 0.8078431, 1, 1,
0.0945358, -0.4132818, 2.207125, 0, 0.8039216, 1, 1,
0.09566087, -0.5411679, 3.408943, 0, 0.7960784, 1, 1,
0.09573313, -1.272352, 3.889888, 0, 0.7882353, 1, 1,
0.09650004, -0.7468578, 2.54433, 0, 0.7843137, 1, 1,
0.1013339, 0.006369677, 3.340791, 0, 0.7764706, 1, 1,
0.1014183, -1.666464, 3.998799, 0, 0.772549, 1, 1,
0.1021607, -2.000549, 1.593724, 0, 0.7647059, 1, 1,
0.1047132, -0.2238173, 3.116684, 0, 0.7607843, 1, 1,
0.10658, 0.04758393, 0.01035111, 0, 0.7529412, 1, 1,
0.1084236, -0.1322275, 3.065185, 0, 0.7490196, 1, 1,
0.1088732, 0.7532158, 0.9641058, 0, 0.7411765, 1, 1,
0.1090089, -0.9121733, 3.909979, 0, 0.7372549, 1, 1,
0.1141131, -0.3406029, 3.413718, 0, 0.7294118, 1, 1,
0.1147422, 1.235194, 0.5011216, 0, 0.7254902, 1, 1,
0.1151915, 0.9829918, 0.3084076, 0, 0.7176471, 1, 1,
0.1174488, -1.337397, 4.410741, 0, 0.7137255, 1, 1,
0.1187697, -1.457397, 4.617506, 0, 0.7058824, 1, 1,
0.1223796, -1.903028, 1.446893, 0, 0.6980392, 1, 1,
0.1331769, -0.3937034, 1.733488, 0, 0.6941177, 1, 1,
0.1354921, 0.7021831, 1.167894, 0, 0.6862745, 1, 1,
0.1366269, -1.604955, 2.811181, 0, 0.682353, 1, 1,
0.1374991, -1.123216, 4.25931, 0, 0.6745098, 1, 1,
0.1410329, 1.02693, 0.2513543, 0, 0.6705883, 1, 1,
0.1411186, 0.2320275, 0.4823793, 0, 0.6627451, 1, 1,
0.1426692, -0.02201651, 1.656988, 0, 0.6588235, 1, 1,
0.1496262, -1.869122, 1.755263, 0, 0.6509804, 1, 1,
0.1555497, -1.557336, 5.403358, 0, 0.6470588, 1, 1,
0.1569825, -1.834977, 4.143539, 0, 0.6392157, 1, 1,
0.1588259, 0.1962893, 1.058717, 0, 0.6352941, 1, 1,
0.1591965, -2.003628, 2.234412, 0, 0.627451, 1, 1,
0.1648993, -0.7106351, 4.680887, 0, 0.6235294, 1, 1,
0.1652073, -0.8207454, 3.429801, 0, 0.6156863, 1, 1,
0.1667278, -0.8715275, 1.674482, 0, 0.6117647, 1, 1,
0.1773589, -2.872833, 3.307698, 0, 0.6039216, 1, 1,
0.1813176, 0.7749568, 0.5093037, 0, 0.5960785, 1, 1,
0.1826884, -0.9184017, 3.410477, 0, 0.5921569, 1, 1,
0.1851656, -1.54322, 4.219281, 0, 0.5843138, 1, 1,
0.1859595, 1.120051, 0.8599195, 0, 0.5803922, 1, 1,
0.1878066, -0.04850363, 0.6673836, 0, 0.572549, 1, 1,
0.1932098, 1.316994, 0.8631394, 0, 0.5686275, 1, 1,
0.1945787, 0.6208466, -0.552826, 0, 0.5607843, 1, 1,
0.1971565, -0.2106668, 0.5809426, 0, 0.5568628, 1, 1,
0.1975253, 1.075728, 1.315722, 0, 0.5490196, 1, 1,
0.2025952, 2.324562, -2.217515, 0, 0.5450981, 1, 1,
0.2031767, 0.34548, 0.2578812, 0, 0.5372549, 1, 1,
0.2034007, 0.3605441, -0.225565, 0, 0.5333334, 1, 1,
0.2043089, 1.654371, 0.3575216, 0, 0.5254902, 1, 1,
0.208064, 0.6322346, 0.3171577, 0, 0.5215687, 1, 1,
0.2139465, -0.5075458, 0.17312, 0, 0.5137255, 1, 1,
0.2185211, 0.5167529, -1.497312, 0, 0.509804, 1, 1,
0.2197832, 0.3564598, 0.8016972, 0, 0.5019608, 1, 1,
0.2288186, 0.567844, 0.5667655, 0, 0.4941176, 1, 1,
0.2335904, 0.7435065, -0.301894, 0, 0.4901961, 1, 1,
0.235668, 0.8316596, 0.6517994, 0, 0.4823529, 1, 1,
0.2405421, -0.6317908, 3.259747, 0, 0.4784314, 1, 1,
0.2414536, 0.9265908, 0.5100204, 0, 0.4705882, 1, 1,
0.2466979, -2.686295, 3.025688, 0, 0.4666667, 1, 1,
0.2511354, 0.9444327, 0.5709117, 0, 0.4588235, 1, 1,
0.2516157, -0.3597635, 3.570441, 0, 0.454902, 1, 1,
0.2654391, 0.8333904, -0.4857806, 0, 0.4470588, 1, 1,
0.2666039, 0.4670678, -0.294742, 0, 0.4431373, 1, 1,
0.2678783, 0.02990925, -0.1647464, 0, 0.4352941, 1, 1,
0.2680123, 0.9797021, 1.735151, 0, 0.4313726, 1, 1,
0.2681686, 0.6103702, 1.578498, 0, 0.4235294, 1, 1,
0.2682255, 1.072574, -0.8761114, 0, 0.4196078, 1, 1,
0.2712366, 1.72466, 0.1423668, 0, 0.4117647, 1, 1,
0.2715157, -1.526002, 1.994892, 0, 0.4078431, 1, 1,
0.2725752, 1.319596, 1.380206, 0, 0.4, 1, 1,
0.2740245, 1.146035, 0.2915267, 0, 0.3921569, 1, 1,
0.274208, 0.5332276, -0.2649233, 0, 0.3882353, 1, 1,
0.2749773, 0.1499995, 1.470908, 0, 0.3803922, 1, 1,
0.2775399, 1.257199, 2.338405, 0, 0.3764706, 1, 1,
0.2777516, 0.5052938, 0.1577059, 0, 0.3686275, 1, 1,
0.2777768, -1.851784, 3.141936, 0, 0.3647059, 1, 1,
0.2833524, 0.2311262, 1.64304, 0, 0.3568628, 1, 1,
0.2843884, 1.028952, 0.2036834, 0, 0.3529412, 1, 1,
0.2847848, -0.7394435, 2.18361, 0, 0.345098, 1, 1,
0.2860476, 0.9882404, 0.3053686, 0, 0.3411765, 1, 1,
0.2869596, 1.34902, -0.2598566, 0, 0.3333333, 1, 1,
0.287359, 1.818159, 0.1498375, 0, 0.3294118, 1, 1,
0.2972562, 1.344794, 0.8520285, 0, 0.3215686, 1, 1,
0.3042641, -0.1453034, 2.141568, 0, 0.3176471, 1, 1,
0.3043805, -0.4697119, 1.704674, 0, 0.3098039, 1, 1,
0.306014, 0.3151048, -0.110072, 0, 0.3058824, 1, 1,
0.3068016, -1.380637, 3.125669, 0, 0.2980392, 1, 1,
0.3080049, 0.5761696, 0.6497868, 0, 0.2901961, 1, 1,
0.3087003, 0.5142701, 1.372801, 0, 0.2862745, 1, 1,
0.3164021, 0.4770641, 0.4463722, 0, 0.2784314, 1, 1,
0.3182416, 0.6268718, 0.2087385, 0, 0.2745098, 1, 1,
0.3204247, 0.3026158, -0.04389733, 0, 0.2666667, 1, 1,
0.3207147, -0.2287581, 3.706563, 0, 0.2627451, 1, 1,
0.3226142, -1.976306, 3.750298, 0, 0.254902, 1, 1,
0.3228403, 0.9249499, 1.385932, 0, 0.2509804, 1, 1,
0.3256554, -0.5877562, 2.79302, 0, 0.2431373, 1, 1,
0.3292256, -0.5626987, 3.512267, 0, 0.2392157, 1, 1,
0.3300042, 0.6646087, 0.6991135, 0, 0.2313726, 1, 1,
0.3338661, -0.5152307, 1.723511, 0, 0.227451, 1, 1,
0.3359997, -0.02107267, 1.057774, 0, 0.2196078, 1, 1,
0.339844, 1.811816, -0.2720586, 0, 0.2156863, 1, 1,
0.3400618, -2.096591, 3.335719, 0, 0.2078431, 1, 1,
0.3546333, -1.198122, 2.478777, 0, 0.2039216, 1, 1,
0.3572393, 0.4158503, 0.522623, 0, 0.1960784, 1, 1,
0.3578815, -1.04489, 3.532308, 0, 0.1882353, 1, 1,
0.3624791, 0.1576599, 2.021573, 0, 0.1843137, 1, 1,
0.3630169, 0.463173, 0.6735411, 0, 0.1764706, 1, 1,
0.3664165, 0.1868919, 1.465433, 0, 0.172549, 1, 1,
0.3722166, -1.089333, 4.119136, 0, 0.1647059, 1, 1,
0.3726403, -0.462638, 1.953441, 0, 0.1607843, 1, 1,
0.3731205, -0.1380287, 2.590922, 0, 0.1529412, 1, 1,
0.3768101, 0.2333828, 1.128063, 0, 0.1490196, 1, 1,
0.3790721, 0.04365207, 0.08859012, 0, 0.1411765, 1, 1,
0.381615, 1.575563, 1.364453, 0, 0.1372549, 1, 1,
0.3883274, 1.277164, 0.9125469, 0, 0.1294118, 1, 1,
0.3909292, 1.476159, 2.506549, 0, 0.1254902, 1, 1,
0.3919776, 0.5329813, -1.760428, 0, 0.1176471, 1, 1,
0.3925562, 1.107408, -0.0318376, 0, 0.1137255, 1, 1,
0.3944157, 1.303555, 0.124331, 0, 0.1058824, 1, 1,
0.3983792, -0.6614397, 3.454829, 0, 0.09803922, 1, 1,
0.4040645, 0.2791358, -0.03320372, 0, 0.09411765, 1, 1,
0.4102486, -0.9278003, 3.530936, 0, 0.08627451, 1, 1,
0.4110734, -0.1094465, 1.737242, 0, 0.08235294, 1, 1,
0.4222646, -0.01893967, 1.507435, 0, 0.07450981, 1, 1,
0.4256367, -0.1780708, 1.530825, 0, 0.07058824, 1, 1,
0.4257843, 1.109847, 0.1474518, 0, 0.0627451, 1, 1,
0.4296544, 0.6558955, 0.6939213, 0, 0.05882353, 1, 1,
0.4347991, -0.1615345, 2.408166, 0, 0.05098039, 1, 1,
0.4365509, 0.6394222, 1.39809, 0, 0.04705882, 1, 1,
0.4412287, 0.1132886, 2.584766, 0, 0.03921569, 1, 1,
0.4418505, -0.1575426, 1.618272, 0, 0.03529412, 1, 1,
0.4440221, 0.4313848, 0.08565113, 0, 0.02745098, 1, 1,
0.4448519, 1.007415, -0.2927574, 0, 0.02352941, 1, 1,
0.4515806, 0.3887331, -0.5213547, 0, 0.01568628, 1, 1,
0.4530108, -1.271119, 1.165301, 0, 0.01176471, 1, 1,
0.4539406, -1.533603, 3.592078, 0, 0.003921569, 1, 1,
0.4606314, 0.2259403, 0.6036708, 0.003921569, 0, 1, 1,
0.463385, -1.552833, 2.360266, 0.007843138, 0, 1, 1,
0.4646103, 0.2357749, -0.7556111, 0.01568628, 0, 1, 1,
0.4727633, -1.16672, 2.139786, 0.01960784, 0, 1, 1,
0.4734093, -0.4865114, 3.074363, 0.02745098, 0, 1, 1,
0.4782616, -0.3833708, 0.1568299, 0.03137255, 0, 1, 1,
0.4813273, 0.2713525, 1.756196, 0.03921569, 0, 1, 1,
0.4820918, 0.6628773, 1.890993, 0.04313726, 0, 1, 1,
0.4826907, 0.3346568, 3.897508, 0.05098039, 0, 1, 1,
0.4829171, -0.1410622, 2.910387, 0.05490196, 0, 1, 1,
0.4830907, -0.6490595, 2.704933, 0.0627451, 0, 1, 1,
0.4856742, 0.4665039, 2.079547, 0.06666667, 0, 1, 1,
0.4860731, 0.8060066, 0.5607817, 0.07450981, 0, 1, 1,
0.4893029, 1.026093, 0.07604644, 0.07843138, 0, 1, 1,
0.4902003, -1.055405, 3.366582, 0.08627451, 0, 1, 1,
0.4958419, -2.530869, 3.30842, 0.09019608, 0, 1, 1,
0.5006281, 0.5411949, 1.319118, 0.09803922, 0, 1, 1,
0.5014079, -0.8296667, 1.048016, 0.1058824, 0, 1, 1,
0.5057455, -0.2538323, 1.394808, 0.1098039, 0, 1, 1,
0.5064659, 0.759474, 0.588996, 0.1176471, 0, 1, 1,
0.5078456, -0.7919168, 3.081515, 0.1215686, 0, 1, 1,
0.5126595, 0.8239559, 1.140216, 0.1294118, 0, 1, 1,
0.5162176, 0.2047708, -0.4780097, 0.1333333, 0, 1, 1,
0.5165289, -1.132972, 2.032422, 0.1411765, 0, 1, 1,
0.5200518, -0.9843171, 2.886275, 0.145098, 0, 1, 1,
0.5200818, 0.3435324, 1.537542, 0.1529412, 0, 1, 1,
0.5218537, 0.1714498, 1.635734, 0.1568628, 0, 1, 1,
0.5235047, 0.8483122, 0.9900037, 0.1647059, 0, 1, 1,
0.5275689, -1.337831, 3.508076, 0.1686275, 0, 1, 1,
0.5290694, 0.2608141, -0.6844956, 0.1764706, 0, 1, 1,
0.5364561, 1.408916, 0.3395198, 0.1803922, 0, 1, 1,
0.5390598, -0.4953645, 2.857059, 0.1882353, 0, 1, 1,
0.5417425, 1.846348, -0.5644735, 0.1921569, 0, 1, 1,
0.5423914, -0.9914179, 1.582745, 0.2, 0, 1, 1,
0.5424828, -1.037058, 3.425648, 0.2078431, 0, 1, 1,
0.5446046, 0.3257041, 1.170823, 0.2117647, 0, 1, 1,
0.5486476, -1.960887, 2.222442, 0.2196078, 0, 1, 1,
0.5492118, 0.2743713, 0.2072505, 0.2235294, 0, 1, 1,
0.5508111, -0.7323035, 2.051521, 0.2313726, 0, 1, 1,
0.5510161, -0.4955891, 2.5674, 0.2352941, 0, 1, 1,
0.5532421, 0.6515954, 1.539714, 0.2431373, 0, 1, 1,
0.5545073, -0.7208331, 3.642368, 0.2470588, 0, 1, 1,
0.5569254, 0.5748062, -0.09513403, 0.254902, 0, 1, 1,
0.5578945, 0.3947998, 0.9711671, 0.2588235, 0, 1, 1,
0.5583006, -0.2002047, 1.214541, 0.2666667, 0, 1, 1,
0.5584964, 1.039301, 2.480766, 0.2705882, 0, 1, 1,
0.5609345, 0.15382, 2.570373, 0.2784314, 0, 1, 1,
0.562914, 0.4704206, 1.476953, 0.282353, 0, 1, 1,
0.5634769, -2.842657, 1.73638, 0.2901961, 0, 1, 1,
0.5672265, 0.492264, 1.669577, 0.2941177, 0, 1, 1,
0.575738, 1.044205, -1.925691, 0.3019608, 0, 1, 1,
0.5775141, -0.09816298, 1.442039, 0.3098039, 0, 1, 1,
0.5775145, 0.2148073, 0.8683493, 0.3137255, 0, 1, 1,
0.5775642, -0.8529795, 3.774791, 0.3215686, 0, 1, 1,
0.5782788, 0.6558583, 1.662293, 0.3254902, 0, 1, 1,
0.582544, -0.07796296, 3.536659, 0.3333333, 0, 1, 1,
0.5857212, 0.5397683, 1.39037, 0.3372549, 0, 1, 1,
0.5867606, 0.06026209, 1.537834, 0.345098, 0, 1, 1,
0.5917486, -1.196611, 2.51247, 0.3490196, 0, 1, 1,
0.5957533, 0.8411443, -0.473457, 0.3568628, 0, 1, 1,
0.5987843, -0.06426799, 1.746454, 0.3607843, 0, 1, 1,
0.6100426, -1.012712, 3.369245, 0.3686275, 0, 1, 1,
0.6106581, 0.6874121, 0.8175904, 0.372549, 0, 1, 1,
0.6152318, -0.08008792, 2.548701, 0.3803922, 0, 1, 1,
0.6171927, -0.1124494, 2.016605, 0.3843137, 0, 1, 1,
0.6202042, 0.02755163, 0.7971116, 0.3921569, 0, 1, 1,
0.6238539, -0.5475355, 1.985571, 0.3960784, 0, 1, 1,
0.632023, -1.426631, 1.640629, 0.4039216, 0, 1, 1,
0.6323407, 1.719199, -2.060551, 0.4117647, 0, 1, 1,
0.6353462, -0.7437685, 1.393344, 0.4156863, 0, 1, 1,
0.6367396, 1.942294, 0.7625924, 0.4235294, 0, 1, 1,
0.6413158, -0.07570213, 2.343964, 0.427451, 0, 1, 1,
0.6417338, 0.07382147, 2.016821, 0.4352941, 0, 1, 1,
0.6435758, -0.9501386, 3.879672, 0.4392157, 0, 1, 1,
0.6438178, -0.7005445, 2.28206, 0.4470588, 0, 1, 1,
0.6518286, 1.087598, 0.6686488, 0.4509804, 0, 1, 1,
0.6683838, 1.691954, 1.056369, 0.4588235, 0, 1, 1,
0.6699668, 0.5735974, 0.1098888, 0.4627451, 0, 1, 1,
0.6704828, 1.580178, 0.5287583, 0.4705882, 0, 1, 1,
0.6765254, 0.9340901, 0.2231782, 0.4745098, 0, 1, 1,
0.6778494, -0.8901253, 0.3335523, 0.4823529, 0, 1, 1,
0.6809756, -0.9724672, 2.40952, 0.4862745, 0, 1, 1,
0.6898242, 0.08209742, 1.164807, 0.4941176, 0, 1, 1,
0.7012894, -0.8260732, 2.049904, 0.5019608, 0, 1, 1,
0.7024089, 1.445461, -0.04478863, 0.5058824, 0, 1, 1,
0.7044697, 0.3476298, 1.815136, 0.5137255, 0, 1, 1,
0.7046224, 1.841345, -1.090789, 0.5176471, 0, 1, 1,
0.7078981, 0.4671435, 1.489528, 0.5254902, 0, 1, 1,
0.7158921, -1.471226, 3.109343, 0.5294118, 0, 1, 1,
0.7200317, -1.287549, 3.447433, 0.5372549, 0, 1, 1,
0.722372, -1.268952, 1.644819, 0.5411765, 0, 1, 1,
0.7231197, 1.015443, 1.883853, 0.5490196, 0, 1, 1,
0.73205, 2.202043, 1.249109, 0.5529412, 0, 1, 1,
0.7324874, 0.2118271, 1.434457, 0.5607843, 0, 1, 1,
0.7405437, -1.224711, 4.353853, 0.5647059, 0, 1, 1,
0.7413653, 0.1073814, 3.068003, 0.572549, 0, 1, 1,
0.7416102, -1.198281, 3.557531, 0.5764706, 0, 1, 1,
0.7456149, 0.4134941, 1.510262, 0.5843138, 0, 1, 1,
0.7484338, -2.41756, 3.335894, 0.5882353, 0, 1, 1,
0.7489514, -1.480741, 1.064925, 0.5960785, 0, 1, 1,
0.7521587, 0.03930005, 1.456909, 0.6039216, 0, 1, 1,
0.7551585, -1.463451, 1.75832, 0.6078432, 0, 1, 1,
0.7629303, 1.298263, -0.07887933, 0.6156863, 0, 1, 1,
0.7653064, -0.1818658, 1.482655, 0.6196079, 0, 1, 1,
0.7675154, -0.7656952, 1.103263, 0.627451, 0, 1, 1,
0.7701483, -0.8329728, 2.36126, 0.6313726, 0, 1, 1,
0.7704405, 0.4380108, 0.1574029, 0.6392157, 0, 1, 1,
0.7741992, 1.488399, -0.02052863, 0.6431373, 0, 1, 1,
0.7771191, -1.737097, 1.219705, 0.6509804, 0, 1, 1,
0.7797011, 2.183927, 0.3367839, 0.654902, 0, 1, 1,
0.7949745, -1.524742, 2.561469, 0.6627451, 0, 1, 1,
0.8005229, 0.6359678, 1.514365, 0.6666667, 0, 1, 1,
0.8023607, -0.8927206, 2.154612, 0.6745098, 0, 1, 1,
0.8075712, 0.2728643, 3.391763, 0.6784314, 0, 1, 1,
0.8108161, 1.558942, 0.4123574, 0.6862745, 0, 1, 1,
0.8135847, 0.5798805, -1.217009, 0.6901961, 0, 1, 1,
0.8146336, -0.2721002, 0.35152, 0.6980392, 0, 1, 1,
0.8168302, -0.1513449, 1.420313, 0.7058824, 0, 1, 1,
0.8172268, 0.7325569, 2.547498, 0.7098039, 0, 1, 1,
0.8202882, -0.2017999, 2.126106, 0.7176471, 0, 1, 1,
0.8224592, -1.625653, 2.533771, 0.7215686, 0, 1, 1,
0.8228418, -1.570613, 2.951411, 0.7294118, 0, 1, 1,
0.8248687, 1.458259, 1.713973, 0.7333333, 0, 1, 1,
0.8256417, 1.284209, -0.7784101, 0.7411765, 0, 1, 1,
0.8280603, 0.6648954, 1.133342, 0.7450981, 0, 1, 1,
0.8307643, -0.5379605, 1.828704, 0.7529412, 0, 1, 1,
0.831277, -0.4896837, 2.6345, 0.7568628, 0, 1, 1,
0.832764, -0.5558939, 3.550584, 0.7647059, 0, 1, 1,
0.8395702, 0.6507751, 0.504244, 0.7686275, 0, 1, 1,
0.841022, 1.460368, -0.3797233, 0.7764706, 0, 1, 1,
0.8416762, -2.02319, 4.116369, 0.7803922, 0, 1, 1,
0.8421335, 0.4359629, 2.515294, 0.7882353, 0, 1, 1,
0.8443611, -0.4345679, 2.694571, 0.7921569, 0, 1, 1,
0.8473408, -1.10813, 2.058222, 0.8, 0, 1, 1,
0.8544016, -1.704554, 3.910699, 0.8078431, 0, 1, 1,
0.8597115, -0.9942406, 2.465576, 0.8117647, 0, 1, 1,
0.8714289, -0.7472358, 1.195265, 0.8196079, 0, 1, 1,
0.8724027, 0.1891056, 2.805011, 0.8235294, 0, 1, 1,
0.8726555, 0.1318402, 0.4480185, 0.8313726, 0, 1, 1,
0.8749428, 0.2142349, 1.777118, 0.8352941, 0, 1, 1,
0.8775036, 1.187158, 1.94683, 0.8431373, 0, 1, 1,
0.8810493, 1.462482, 0.2193804, 0.8470588, 0, 1, 1,
0.8818523, 0.04281812, 2.396551, 0.854902, 0, 1, 1,
0.8825645, 0.1525045, 2.323078, 0.8588235, 0, 1, 1,
0.8867404, -0.4189526, 0.7870161, 0.8666667, 0, 1, 1,
0.8945355, -0.882889, 0.8893176, 0.8705882, 0, 1, 1,
0.8960386, -0.9771019, 1.638359, 0.8784314, 0, 1, 1,
0.9073346, -1.334185, 2.874677, 0.8823529, 0, 1, 1,
0.9185134, 0.3821709, 2.189584, 0.8901961, 0, 1, 1,
0.923849, 1.02099, 1.798992, 0.8941177, 0, 1, 1,
0.924416, 0.708486, 0.8291262, 0.9019608, 0, 1, 1,
0.9247993, -0.6383043, 1.524897, 0.9098039, 0, 1, 1,
0.9273547, 0.3815369, 2.45781, 0.9137255, 0, 1, 1,
0.9319045, 0.1367786, 0.8441774, 0.9215686, 0, 1, 1,
0.9337514, -0.3177687, 4.248963, 0.9254902, 0, 1, 1,
0.9406683, -0.1404227, 1.62774, 0.9333333, 0, 1, 1,
0.9439082, -0.9859477, 3.233699, 0.9372549, 0, 1, 1,
0.9503886, 0.3669257, 1.746161, 0.945098, 0, 1, 1,
0.9517721, 0.09746756, 1.899859, 0.9490196, 0, 1, 1,
0.9520923, 0.006211454, 1.337685, 0.9568627, 0, 1, 1,
0.9555013, -0.8959643, 4.703014, 0.9607843, 0, 1, 1,
0.9556773, -0.8511311, 3.366418, 0.9686275, 0, 1, 1,
0.9591466, 0.667993, 1.367479, 0.972549, 0, 1, 1,
0.9799825, -0.4702901, 1.808702, 0.9803922, 0, 1, 1,
0.9820368, 0.9721311, 0.2020837, 0.9843137, 0, 1, 1,
0.9830311, -1.079295, 3.287591, 0.9921569, 0, 1, 1,
0.9903569, -0.2028921, 1.012679, 0.9960784, 0, 1, 1,
0.9961504, 1.469491, 0.1123392, 1, 0, 0.9960784, 1,
1.001128, 0.6310764, -0.2103045, 1, 0, 0.9882353, 1,
1.006537, 1.335921, 0.2276569, 1, 0, 0.9843137, 1,
1.013965, 0.3987904, 2.5378, 1, 0, 0.9764706, 1,
1.013973, -0.320874, 3.097727, 1, 0, 0.972549, 1,
1.016195, -1.894584, 2.139306, 1, 0, 0.9647059, 1,
1.018668, -0.9439512, 0.6900421, 1, 0, 0.9607843, 1,
1.018999, 0.424572, 0.6872196, 1, 0, 0.9529412, 1,
1.03323, -0.646003, 2.387755, 1, 0, 0.9490196, 1,
1.036785, -0.1225194, 2.533148, 1, 0, 0.9411765, 1,
1.042018, 1.620356, -0.03745542, 1, 0, 0.9372549, 1,
1.045153, -0.3762128, 1.288522, 1, 0, 0.9294118, 1,
1.048142, 1.106151, 1.021415, 1, 0, 0.9254902, 1,
1.048604, -0.1664942, 0.1783973, 1, 0, 0.9176471, 1,
1.050016, 1.321295, 1.468928, 1, 0, 0.9137255, 1,
1.057455, -1.143755, 2.744697, 1, 0, 0.9058824, 1,
1.0661, 1.142352, -0.4310417, 1, 0, 0.9019608, 1,
1.06636, 0.09165023, 2.898876, 1, 0, 0.8941177, 1,
1.066642, 0.8958375, 1.786569, 1, 0, 0.8862745, 1,
1.06849, -0.9425556, 2.938898, 1, 0, 0.8823529, 1,
1.071062, -1.854566, 1.672022, 1, 0, 0.8745098, 1,
1.074845, 0.8268172, 0.1194004, 1, 0, 0.8705882, 1,
1.079475, -0.2403312, 1.627705, 1, 0, 0.8627451, 1,
1.080745, -0.004215572, 2.045809, 1, 0, 0.8588235, 1,
1.081424, -0.4645025, 0.7542986, 1, 0, 0.8509804, 1,
1.086496, -0.6698703, 2.867159, 1, 0, 0.8470588, 1,
1.088575, 0.09023888, 0.588008, 1, 0, 0.8392157, 1,
1.091547, -1.10742, 2.478837, 1, 0, 0.8352941, 1,
1.095142, 0.09806701, 2.583257, 1, 0, 0.827451, 1,
1.097645, 0.7874973, -0.2769142, 1, 0, 0.8235294, 1,
1.100821, -0.3009452, 3.061681, 1, 0, 0.8156863, 1,
1.101503, 0.9762992, 0.3913991, 1, 0, 0.8117647, 1,
1.102169, -1.560801, 2.308268, 1, 0, 0.8039216, 1,
1.105289, 1.660335, 0.7546635, 1, 0, 0.7960784, 1,
1.107458, -1.303032, 2.878749, 1, 0, 0.7921569, 1,
1.113474, -3.376959, 1.88975, 1, 0, 0.7843137, 1,
1.115327, -1.667845, 1.626835, 1, 0, 0.7803922, 1,
1.116591, 1.82561, 0.6135627, 1, 0, 0.772549, 1,
1.117015, 0.3147635, 1.371287, 1, 0, 0.7686275, 1,
1.122162, 0.8519681, 0.2706084, 1, 0, 0.7607843, 1,
1.124432, -0.8429559, 2.250781, 1, 0, 0.7568628, 1,
1.124463, -1.577198, 2.434897, 1, 0, 0.7490196, 1,
1.136743, 0.01548634, 3.409108, 1, 0, 0.7450981, 1,
1.138372, -0.07397129, 0.7923166, 1, 0, 0.7372549, 1,
1.141131, 1.592827, -0.07996077, 1, 0, 0.7333333, 1,
1.143161, 0.4181056, 2.556312, 1, 0, 0.7254902, 1,
1.146807, -1.105346, 1.869243, 1, 0, 0.7215686, 1,
1.147846, -0.1932596, 1.523896, 1, 0, 0.7137255, 1,
1.166158, 1.216097, 1.084677, 1, 0, 0.7098039, 1,
1.170065, 0.1508814, 3.028638, 1, 0, 0.7019608, 1,
1.174096, -0.6225725, 1.214301, 1, 0, 0.6941177, 1,
1.177026, 1.568317, 0.7125634, 1, 0, 0.6901961, 1,
1.181934, -1.932175, 1.557101, 1, 0, 0.682353, 1,
1.186354, -0.03778853, 3.084964, 1, 0, 0.6784314, 1,
1.1894, 0.1631581, 2.644555, 1, 0, 0.6705883, 1,
1.189513, 1.371255, 0.3580522, 1, 0, 0.6666667, 1,
1.19877, -0.2755149, 2.381076, 1, 0, 0.6588235, 1,
1.217134, 0.6466966, 0.8825669, 1, 0, 0.654902, 1,
1.222354, -0.05019051, 1.688745, 1, 0, 0.6470588, 1,
1.250198, 0.6129826, 2.259115, 1, 0, 0.6431373, 1,
1.251744, -0.07962538, 2.358097, 1, 0, 0.6352941, 1,
1.253193, 2.150061, -0.9327997, 1, 0, 0.6313726, 1,
1.254143, 1.881512, 1.315738, 1, 0, 0.6235294, 1,
1.268917, -0.9597402, 2.226876, 1, 0, 0.6196079, 1,
1.273582, -2.040544, 3.944688, 1, 0, 0.6117647, 1,
1.292286, 0.06686038, 2.020486, 1, 0, 0.6078432, 1,
1.292706, 0.7377303, 1.594676, 1, 0, 0.6, 1,
1.300868, 0.3446764, 2.225029, 1, 0, 0.5921569, 1,
1.303941, 1.954032, 1.254237, 1, 0, 0.5882353, 1,
1.309955, -1.750583, 2.021065, 1, 0, 0.5803922, 1,
1.315401, 1.306183, 1.878775, 1, 0, 0.5764706, 1,
1.345086, 0.5002477, 1.1468, 1, 0, 0.5686275, 1,
1.359299, 2.246078, 1.535086, 1, 0, 0.5647059, 1,
1.366157, -0.4478483, 1.489442, 1, 0, 0.5568628, 1,
1.380004, 0.3481263, 1.602065, 1, 0, 0.5529412, 1,
1.386345, 0.4574713, 2.14132, 1, 0, 0.5450981, 1,
1.389972, -0.7151344, 2.134422, 1, 0, 0.5411765, 1,
1.4105, 0.114602, 0.1026961, 1, 0, 0.5333334, 1,
1.441995, -0.09345122, 1.472706, 1, 0, 0.5294118, 1,
1.446948, -0.5740407, 0.9802763, 1, 0, 0.5215687, 1,
1.45981, -0.6813121, 1.184664, 1, 0, 0.5176471, 1,
1.46082, 0.5756181, 0.3391981, 1, 0, 0.509804, 1,
1.460847, -0.2030711, 2.940615, 1, 0, 0.5058824, 1,
1.464711, 1.248767, 1.513194, 1, 0, 0.4980392, 1,
1.467812, -0.3672287, 1.389759, 1, 0, 0.4901961, 1,
1.471982, -0.7813146, 1.952352, 1, 0, 0.4862745, 1,
1.47347, 0.06658092, 1.939831, 1, 0, 0.4784314, 1,
1.481632, 0.5917892, -0.3012031, 1, 0, 0.4745098, 1,
1.485905, 1.401279, 1.846143, 1, 0, 0.4666667, 1,
1.487213, -0.0154598, 1.937091, 1, 0, 0.4627451, 1,
1.492522, -0.6700013, 3.277162, 1, 0, 0.454902, 1,
1.511511, -1.371423, 3.0777, 1, 0, 0.4509804, 1,
1.514799, -0.03513284, 1.00701, 1, 0, 0.4431373, 1,
1.518832, 0.2734134, 0.2040009, 1, 0, 0.4392157, 1,
1.520615, 0.432793, 1.337031, 1, 0, 0.4313726, 1,
1.544766, -0.8537737, 1.895657, 1, 0, 0.427451, 1,
1.54772, -0.2061435, 0.9992678, 1, 0, 0.4196078, 1,
1.552588, -0.2504173, 1.618446, 1, 0, 0.4156863, 1,
1.556488, 1.069044, 3.369709, 1, 0, 0.4078431, 1,
1.558636, -0.2263743, 2.012247, 1, 0, 0.4039216, 1,
1.575569, -0.4194253, 3.870993, 1, 0, 0.3960784, 1,
1.590235, -0.1175487, 0.7572249, 1, 0, 0.3882353, 1,
1.59173, -0.2510197, 3.880785, 1, 0, 0.3843137, 1,
1.604887, 2.265956, 0.8826184, 1, 0, 0.3764706, 1,
1.612346, 0.142892, 0.7154701, 1, 0, 0.372549, 1,
1.616477, -1.010771, 3.566504, 1, 0, 0.3647059, 1,
1.626858, 0.4578302, 2.619519, 1, 0, 0.3607843, 1,
1.631887, -0.8141611, 1.238347, 1, 0, 0.3529412, 1,
1.637498, -1.436357, 1.29248, 1, 0, 0.3490196, 1,
1.652107, 1.931414, 1.645064, 1, 0, 0.3411765, 1,
1.655615, -0.8044872, 3.933522, 1, 0, 0.3372549, 1,
1.658681, 0.1255446, 0.9113697, 1, 0, 0.3294118, 1,
1.669251, -1.602306, 2.053511, 1, 0, 0.3254902, 1,
1.680932, -1.032837, 2.549934, 1, 0, 0.3176471, 1,
1.685122, 1.020287, 2.893414, 1, 0, 0.3137255, 1,
1.687631, 1.613418, 0.5479553, 1, 0, 0.3058824, 1,
1.694651, -0.03527443, 1.556854, 1, 0, 0.2980392, 1,
1.696023, -1.081568, 1.21096, 1, 0, 0.2941177, 1,
1.699493, -0.02119882, 0.4185208, 1, 0, 0.2862745, 1,
1.744212, -0.4506858, 1.909522, 1, 0, 0.282353, 1,
1.745328, 0.6259561, 0.618489, 1, 0, 0.2745098, 1,
1.751104, -1.166655, 2.210997, 1, 0, 0.2705882, 1,
1.753225, 0.3164196, 1.621805, 1, 0, 0.2627451, 1,
1.783918, -0.5390894, 1.622972, 1, 0, 0.2588235, 1,
1.786044, -0.3366953, 0.8594644, 1, 0, 0.2509804, 1,
1.790012, 1.258477, 0.219478, 1, 0, 0.2470588, 1,
1.794903, -0.2920187, 0.9607969, 1, 0, 0.2392157, 1,
1.79539, -0.800814, 2.151449, 1, 0, 0.2352941, 1,
1.796274, 0.6821733, 0.2032885, 1, 0, 0.227451, 1,
1.801744, -0.6634013, 1.351061, 1, 0, 0.2235294, 1,
1.804178, 0.1849404, 3.755571, 1, 0, 0.2156863, 1,
1.810882, 0.9822071, -1.054458, 1, 0, 0.2117647, 1,
1.832688, 1.837134, 1.696041, 1, 0, 0.2039216, 1,
1.844347, 0.1174042, 1.714376, 1, 0, 0.1960784, 1,
1.853333, -1.222919, 2.995062, 1, 0, 0.1921569, 1,
1.854997, -0.4691285, 0.3312767, 1, 0, 0.1843137, 1,
1.868352, -1.663765, 2.012704, 1, 0, 0.1803922, 1,
1.871599, -0.667788, 1.715693, 1, 0, 0.172549, 1,
1.886414, 0.09931821, 2.296301, 1, 0, 0.1686275, 1,
1.90039, 1.578452, -0.832575, 1, 0, 0.1607843, 1,
1.929628, -0.3042016, 3.884027, 1, 0, 0.1568628, 1,
1.944212, 0.2297872, 1.034828, 1, 0, 0.1490196, 1,
1.946359, -1.037048, 2.105497, 1, 0, 0.145098, 1,
1.995642, -0.5680901, 4.408406, 1, 0, 0.1372549, 1,
1.996015, -0.09601226, 1.872967, 1, 0, 0.1333333, 1,
2.001787, 0.5959198, 0.9254301, 1, 0, 0.1254902, 1,
2.025399, 0.1388027, -0.000774217, 1, 0, 0.1215686, 1,
2.071297, -0.3945341, -0.4690889, 1, 0, 0.1137255, 1,
2.077637, 0.8583113, 1.840379, 1, 0, 0.1098039, 1,
2.078446, 0.160494, 2.312471, 1, 0, 0.1019608, 1,
2.082065, 0.04159361, 0.40031, 1, 0, 0.09411765, 1,
2.110342, -0.3074405, 0.7903861, 1, 0, 0.09019608, 1,
2.124177, 0.1508153, 1.117965, 1, 0, 0.08235294, 1,
2.216029, -0.8914782, 2.848848, 1, 0, 0.07843138, 1,
2.217036, 0.6927631, 2.94167, 1, 0, 0.07058824, 1,
2.256112, 0.7202392, 1.492928, 1, 0, 0.06666667, 1,
2.286403, 0.9353624, 1.316467, 1, 0, 0.05882353, 1,
2.302236, -0.5816242, 1.38412, 1, 0, 0.05490196, 1,
2.398469, -0.5642707, 0.9066328, 1, 0, 0.04705882, 1,
2.410473, 0.9544964, 0.4428037, 1, 0, 0.04313726, 1,
2.490267, 0.009955765, 1.455029, 1, 0, 0.03529412, 1,
2.511983, 0.1022278, 3.052131, 1, 0, 0.03137255, 1,
2.583401, 1.608281, 0.6858826, 1, 0, 0.02352941, 1,
2.727014, -0.1883275, 1.163121, 1, 0, 0.01960784, 1,
2.894763, 2.512995, 0.5992121, 1, 0, 0.01176471, 1,
3.373156, 0.2009702, 1.162959, 1, 0, 0.007843138, 1
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
0.1503189, -4.553574, -6.90863, 0, -0.5, 0.5, 0.5,
0.1503189, -4.553574, -6.90863, 1, -0.5, 0.5, 0.5,
0.1503189, -4.553574, -6.90863, 1, 1.5, 0.5, 0.5,
0.1503189, -4.553574, -6.90863, 0, 1.5, 0.5, 0.5
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
-4.16506, 0.09388387, -6.90863, 0, -0.5, 0.5, 0.5,
-4.16506, 0.09388387, -6.90863, 1, -0.5, 0.5, 0.5,
-4.16506, 0.09388387, -6.90863, 1, 1.5, 0.5, 0.5,
-4.16506, 0.09388387, -6.90863, 0, 1.5, 0.5, 0.5
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
-4.16506, -4.553574, 0.139575, 0, -0.5, 0.5, 0.5,
-4.16506, -4.553574, 0.139575, 1, -0.5, 0.5, 0.5,
-4.16506, -4.553574, 0.139575, 1, 1.5, 0.5, 0.5,
-4.16506, -4.553574, 0.139575, 0, 1.5, 0.5, 0.5
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
-3, -3.481084, -5.282121,
3, -3.481084, -5.282121,
-3, -3.481084, -5.282121,
-3, -3.659832, -5.553206,
-2, -3.481084, -5.282121,
-2, -3.659832, -5.553206,
-1, -3.481084, -5.282121,
-1, -3.659832, -5.553206,
0, -3.481084, -5.282121,
0, -3.659832, -5.553206,
1, -3.481084, -5.282121,
1, -3.659832, -5.553206,
2, -3.481084, -5.282121,
2, -3.659832, -5.553206,
3, -3.481084, -5.282121,
3, -3.659832, -5.553206
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
-3, -4.017329, -6.095376, 0, -0.5, 0.5, 0.5,
-3, -4.017329, -6.095376, 1, -0.5, 0.5, 0.5,
-3, -4.017329, -6.095376, 1, 1.5, 0.5, 0.5,
-3, -4.017329, -6.095376, 0, 1.5, 0.5, 0.5,
-2, -4.017329, -6.095376, 0, -0.5, 0.5, 0.5,
-2, -4.017329, -6.095376, 1, -0.5, 0.5, 0.5,
-2, -4.017329, -6.095376, 1, 1.5, 0.5, 0.5,
-2, -4.017329, -6.095376, 0, 1.5, 0.5, 0.5,
-1, -4.017329, -6.095376, 0, -0.5, 0.5, 0.5,
-1, -4.017329, -6.095376, 1, -0.5, 0.5, 0.5,
-1, -4.017329, -6.095376, 1, 1.5, 0.5, 0.5,
-1, -4.017329, -6.095376, 0, 1.5, 0.5, 0.5,
0, -4.017329, -6.095376, 0, -0.5, 0.5, 0.5,
0, -4.017329, -6.095376, 1, -0.5, 0.5, 0.5,
0, -4.017329, -6.095376, 1, 1.5, 0.5, 0.5,
0, -4.017329, -6.095376, 0, 1.5, 0.5, 0.5,
1, -4.017329, -6.095376, 0, -0.5, 0.5, 0.5,
1, -4.017329, -6.095376, 1, -0.5, 0.5, 0.5,
1, -4.017329, -6.095376, 1, 1.5, 0.5, 0.5,
1, -4.017329, -6.095376, 0, 1.5, 0.5, 0.5,
2, -4.017329, -6.095376, 0, -0.5, 0.5, 0.5,
2, -4.017329, -6.095376, 1, -0.5, 0.5, 0.5,
2, -4.017329, -6.095376, 1, 1.5, 0.5, 0.5,
2, -4.017329, -6.095376, 0, 1.5, 0.5, 0.5,
3, -4.017329, -6.095376, 0, -0.5, 0.5, 0.5,
3, -4.017329, -6.095376, 1, -0.5, 0.5, 0.5,
3, -4.017329, -6.095376, 1, 1.5, 0.5, 0.5,
3, -4.017329, -6.095376, 0, 1.5, 0.5, 0.5
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
-3.169204, -3, -5.282121,
-3.169204, 3, -5.282121,
-3.169204, -3, -5.282121,
-3.33518, -3, -5.553206,
-3.169204, -2, -5.282121,
-3.33518, -2, -5.553206,
-3.169204, -1, -5.282121,
-3.33518, -1, -5.553206,
-3.169204, 0, -5.282121,
-3.33518, 0, -5.553206,
-3.169204, 1, -5.282121,
-3.33518, 1, -5.553206,
-3.169204, 2, -5.282121,
-3.33518, 2, -5.553206,
-3.169204, 3, -5.282121,
-3.33518, 3, -5.553206
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
-3.667132, -3, -6.095376, 0, -0.5, 0.5, 0.5,
-3.667132, -3, -6.095376, 1, -0.5, 0.5, 0.5,
-3.667132, -3, -6.095376, 1, 1.5, 0.5, 0.5,
-3.667132, -3, -6.095376, 0, 1.5, 0.5, 0.5,
-3.667132, -2, -6.095376, 0, -0.5, 0.5, 0.5,
-3.667132, -2, -6.095376, 1, -0.5, 0.5, 0.5,
-3.667132, -2, -6.095376, 1, 1.5, 0.5, 0.5,
-3.667132, -2, -6.095376, 0, 1.5, 0.5, 0.5,
-3.667132, -1, -6.095376, 0, -0.5, 0.5, 0.5,
-3.667132, -1, -6.095376, 1, -0.5, 0.5, 0.5,
-3.667132, -1, -6.095376, 1, 1.5, 0.5, 0.5,
-3.667132, -1, -6.095376, 0, 1.5, 0.5, 0.5,
-3.667132, 0, -6.095376, 0, -0.5, 0.5, 0.5,
-3.667132, 0, -6.095376, 1, -0.5, 0.5, 0.5,
-3.667132, 0, -6.095376, 1, 1.5, 0.5, 0.5,
-3.667132, 0, -6.095376, 0, 1.5, 0.5, 0.5,
-3.667132, 1, -6.095376, 0, -0.5, 0.5, 0.5,
-3.667132, 1, -6.095376, 1, -0.5, 0.5, 0.5,
-3.667132, 1, -6.095376, 1, 1.5, 0.5, 0.5,
-3.667132, 1, -6.095376, 0, 1.5, 0.5, 0.5,
-3.667132, 2, -6.095376, 0, -0.5, 0.5, 0.5,
-3.667132, 2, -6.095376, 1, -0.5, 0.5, 0.5,
-3.667132, 2, -6.095376, 1, 1.5, 0.5, 0.5,
-3.667132, 2, -6.095376, 0, 1.5, 0.5, 0.5,
-3.667132, 3, -6.095376, 0, -0.5, 0.5, 0.5,
-3.667132, 3, -6.095376, 1, -0.5, 0.5, 0.5,
-3.667132, 3, -6.095376, 1, 1.5, 0.5, 0.5,
-3.667132, 3, -6.095376, 0, 1.5, 0.5, 0.5
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
-3.169204, -3.481084, -4,
-3.169204, -3.481084, 4,
-3.169204, -3.481084, -4,
-3.33518, -3.659832, -4,
-3.169204, -3.481084, -2,
-3.33518, -3.659832, -2,
-3.169204, -3.481084, 0,
-3.33518, -3.659832, 0,
-3.169204, -3.481084, 2,
-3.33518, -3.659832, 2,
-3.169204, -3.481084, 4,
-3.33518, -3.659832, 4
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
-3.667132, -4.017329, -4, 0, -0.5, 0.5, 0.5,
-3.667132, -4.017329, -4, 1, -0.5, 0.5, 0.5,
-3.667132, -4.017329, -4, 1, 1.5, 0.5, 0.5,
-3.667132, -4.017329, -4, 0, 1.5, 0.5, 0.5,
-3.667132, -4.017329, -2, 0, -0.5, 0.5, 0.5,
-3.667132, -4.017329, -2, 1, -0.5, 0.5, 0.5,
-3.667132, -4.017329, -2, 1, 1.5, 0.5, 0.5,
-3.667132, -4.017329, -2, 0, 1.5, 0.5, 0.5,
-3.667132, -4.017329, 0, 0, -0.5, 0.5, 0.5,
-3.667132, -4.017329, 0, 1, -0.5, 0.5, 0.5,
-3.667132, -4.017329, 0, 1, 1.5, 0.5, 0.5,
-3.667132, -4.017329, 0, 0, 1.5, 0.5, 0.5,
-3.667132, -4.017329, 2, 0, -0.5, 0.5, 0.5,
-3.667132, -4.017329, 2, 1, -0.5, 0.5, 0.5,
-3.667132, -4.017329, 2, 1, 1.5, 0.5, 0.5,
-3.667132, -4.017329, 2, 0, 1.5, 0.5, 0.5,
-3.667132, -4.017329, 4, 0, -0.5, 0.5, 0.5,
-3.667132, -4.017329, 4, 1, -0.5, 0.5, 0.5,
-3.667132, -4.017329, 4, 1, 1.5, 0.5, 0.5,
-3.667132, -4.017329, 4, 0, 1.5, 0.5, 0.5
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
-3.169204, -3.481084, -5.282121,
-3.169204, 3.668852, -5.282121,
-3.169204, -3.481084, 5.561271,
-3.169204, 3.668852, 5.561271,
-3.169204, -3.481084, -5.282121,
-3.169204, -3.481084, 5.561271,
-3.169204, 3.668852, -5.282121,
-3.169204, 3.668852, 5.561271,
-3.169204, -3.481084, -5.282121,
3.469841, -3.481084, -5.282121,
-3.169204, -3.481084, 5.561271,
3.469841, -3.481084, 5.561271,
-3.169204, 3.668852, -5.282121,
3.469841, 3.668852, -5.282121,
-3.169204, 3.668852, 5.561271,
3.469841, 3.668852, 5.561271,
3.469841, -3.481084, -5.282121,
3.469841, 3.668852, -5.282121,
3.469841, -3.481084, 5.561271,
3.469841, 3.668852, 5.561271,
3.469841, -3.481084, -5.282121,
3.469841, -3.481084, 5.561271,
3.469841, 3.668852, -5.282121,
3.469841, 3.668852, 5.561271
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
var radius = 7.789121;
var distance = 34.65468;
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
mvMatrix.translate( -0.1503189, -0.09388387, -0.139575 );
mvMatrix.scale( 1.268518, 1.177878, 0.7766712 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.65468);
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
nitrofluorfen<-read.table("nitrofluorfen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nitrofluorfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'nitrofluorfen' not found
```

```r
y<-nitrofluorfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'nitrofluorfen' not found
```

```r
z<-nitrofluorfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'nitrofluorfen' not found
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
-3.072518, -0.1755378, -1.525166, 0, 0, 1, 1, 1,
-2.814178, 0.1064358, -2.127894, 1, 0, 0, 1, 1,
-2.666446, -0.6050458, -1.305838, 1, 0, 0, 1, 1,
-2.62398, 0.5044326, -2.01973, 1, 0, 0, 1, 1,
-2.604231, 0.891108, -2.59387, 1, 0, 0, 1, 1,
-2.599963, -0.8989487, -2.239131, 1, 0, 0, 1, 1,
-2.58516, -0.6612033, -2.867709, 0, 0, 0, 1, 1,
-2.524366, -0.00475874, -1.344544, 0, 0, 0, 1, 1,
-2.461025, -0.608124, -1.058059, 0, 0, 0, 1, 1,
-2.458528, -1.146357, -1.443703, 0, 0, 0, 1, 1,
-2.453508, -0.05819643, -0.3391619, 0, 0, 0, 1, 1,
-2.40887, 0.2309714, -1.317479, 0, 0, 0, 1, 1,
-2.378499, 0.9424534, 0.2290595, 0, 0, 0, 1, 1,
-2.315866, -0.1480614, 0.179924, 1, 1, 1, 1, 1,
-2.283932, 0.4509607, -2.309265, 1, 1, 1, 1, 1,
-2.283819, -0.270987, 0.2457883, 1, 1, 1, 1, 1,
-2.205243, -1.530692, -3.493967, 1, 1, 1, 1, 1,
-2.170475, -0.1014131, 0.5535179, 1, 1, 1, 1, 1,
-2.153612, 0.2964251, -1.783426, 1, 1, 1, 1, 1,
-2.103883, 0.8060516, -0.9272048, 1, 1, 1, 1, 1,
-2.077463, 1.365629, -2.786312, 1, 1, 1, 1, 1,
-2.071003, -1.203181, -1.246539, 1, 1, 1, 1, 1,
-2.060624, 0.1417308, -1.677706, 1, 1, 1, 1, 1,
-2.042233, 0.6476302, -1.462836, 1, 1, 1, 1, 1,
-2.032127, -0.5442873, -3.067553, 1, 1, 1, 1, 1,
-2.013288, 0.6102617, -0.2492855, 1, 1, 1, 1, 1,
-2.004111, -0.8802815, -4.218987, 1, 1, 1, 1, 1,
-1.993048, -0.7683401, -1.295885, 1, 1, 1, 1, 1,
-1.984592, 0.6048055, -1.390825, 0, 0, 1, 1, 1,
-1.944581, 0.2187847, -4.151292, 1, 0, 0, 1, 1,
-1.940727, -1.589439, -2.884245, 1, 0, 0, 1, 1,
-1.932043, -0.4216472, -1.284176, 1, 0, 0, 1, 1,
-1.921796, -0.8580964, -1.932304, 1, 0, 0, 1, 1,
-1.894922, 0.3652123, -0.7766777, 1, 0, 0, 1, 1,
-1.889358, -0.7952352, -2.210527, 0, 0, 0, 1, 1,
-1.875152, -0.7300743, -2.939795, 0, 0, 0, 1, 1,
-1.874343, -0.3995912, -3.321813, 0, 0, 0, 1, 1,
-1.852375, -1.454205, -2.986223, 0, 0, 0, 1, 1,
-1.81283, -0.04222978, -1.42468, 0, 0, 0, 1, 1,
-1.806728, 1.28927, -0.5907804, 0, 0, 0, 1, 1,
-1.788334, 0.2124151, -1.919665, 0, 0, 0, 1, 1,
-1.787784, 1.674317, -1.925223, 1, 1, 1, 1, 1,
-1.744712, -1.949007, -4.067536, 1, 1, 1, 1, 1,
-1.741507, -1.148651, -1.278655, 1, 1, 1, 1, 1,
-1.717493, 0.5441471, -1.632483, 1, 1, 1, 1, 1,
-1.702474, 2.958323, 0.03762344, 1, 1, 1, 1, 1,
-1.698529, -0.6143526, -2.316846, 1, 1, 1, 1, 1,
-1.679429, 0.8601198, -1.13658, 1, 1, 1, 1, 1,
-1.677125, -0.8944073, -0.2786205, 1, 1, 1, 1, 1,
-1.673969, 1.647405, -1.310071, 1, 1, 1, 1, 1,
-1.670968, -0.3604685, -1.559301, 1, 1, 1, 1, 1,
-1.668515, 0.1021765, -1.763477, 1, 1, 1, 1, 1,
-1.660173, -0.3900523, -1.267452, 1, 1, 1, 1, 1,
-1.645133, -0.4890217, -2.139926, 1, 1, 1, 1, 1,
-1.642637, -0.1975975, -1.624182, 1, 1, 1, 1, 1,
-1.591463, 0.6172222, -1.089052, 1, 1, 1, 1, 1,
-1.587787, 0.2941501, -0.236946, 0, 0, 1, 1, 1,
-1.579589, 0.2142252, -0.1900009, 1, 0, 0, 1, 1,
-1.569096, 1.807311, 0.3862842, 1, 0, 0, 1, 1,
-1.532975, -1.55538, -1.277116, 1, 0, 0, 1, 1,
-1.524881, -0.4264866, -2.379202, 1, 0, 0, 1, 1,
-1.516471, 0.5463144, -1.174578, 1, 0, 0, 1, 1,
-1.500681, -0.5999421, -2.502384, 0, 0, 0, 1, 1,
-1.499471, 2.10839, -0.9280474, 0, 0, 0, 1, 1,
-1.491684, 1.731886, -1.01118, 0, 0, 0, 1, 1,
-1.486227, 1.000995, -1.190757, 0, 0, 0, 1, 1,
-1.478025, -3.311692, -4.113613, 0, 0, 0, 1, 1,
-1.473775, -0.09543099, -0.6741118, 0, 0, 0, 1, 1,
-1.470515, -0.4432631, -1.69153, 0, 0, 0, 1, 1,
-1.440599, -0.5727093, -1.154853, 1, 1, 1, 1, 1,
-1.422785, 1.340598, 0.3354679, 1, 1, 1, 1, 1,
-1.405663, 0.1025838, -1.594131, 1, 1, 1, 1, 1,
-1.405595, -0.6780245, -2.896142, 1, 1, 1, 1, 1,
-1.404378, 1.026935, -2.495154, 1, 1, 1, 1, 1,
-1.399038, 0.3416553, 0.6040056, 1, 1, 1, 1, 1,
-1.376358, -0.1477721, -1.607686, 1, 1, 1, 1, 1,
-1.376279, 0.7254848, -1.313003, 1, 1, 1, 1, 1,
-1.37249, -0.8370496, -2.145543, 1, 1, 1, 1, 1,
-1.364786, -1.501773, -2.949138, 1, 1, 1, 1, 1,
-1.347809, -0.1613077, -1.789569, 1, 1, 1, 1, 1,
-1.341036, -0.8082486, -5.12354, 1, 1, 1, 1, 1,
-1.332533, -1.953956, -2.834257, 1, 1, 1, 1, 1,
-1.308953, -0.7960682, -0.06308844, 1, 1, 1, 1, 1,
-1.308931, 0.8205161, 0.2578214, 1, 1, 1, 1, 1,
-1.306712, -0.9483639, -3.286886, 0, 0, 1, 1, 1,
-1.302724, -1.353759, -3.357363, 1, 0, 0, 1, 1,
-1.302577, 0.2558765, -0.9399501, 1, 0, 0, 1, 1,
-1.298793, 0.1818672, -1.259749, 1, 0, 0, 1, 1,
-1.295579, 2.687793, -0.6320307, 1, 0, 0, 1, 1,
-1.292468, 0.9765693, -1.376052, 1, 0, 0, 1, 1,
-1.290319, 0.1876819, 0.3520823, 0, 0, 0, 1, 1,
-1.289635, 1.069442, -1.352011, 0, 0, 0, 1, 1,
-1.289108, -0.02747151, -2.546033, 0, 0, 0, 1, 1,
-1.286445, -0.8098316, -3.146566, 0, 0, 0, 1, 1,
-1.286163, 0.2375632, -0.6194776, 0, 0, 0, 1, 1,
-1.284378, 0.1904847, -2.375384, 0, 0, 0, 1, 1,
-1.283891, 0.611463, 0.3568358, 0, 0, 0, 1, 1,
-1.281654, -1.468953, -3.022789, 1, 1, 1, 1, 1,
-1.278196, 0.420319, -0.8948078, 1, 1, 1, 1, 1,
-1.272761, -0.6541078, -1.461768, 1, 1, 1, 1, 1,
-1.267848, -0.9842647, -0.7762201, 1, 1, 1, 1, 1,
-1.265674, -0.5249006, -1.663088, 1, 1, 1, 1, 1,
-1.264787, 0.7852176, -2.576654, 1, 1, 1, 1, 1,
-1.263357, -0.5768445, -2.396111, 1, 1, 1, 1, 1,
-1.263297, 1.02774, -1.242952, 1, 1, 1, 1, 1,
-1.249642, -2.607755, -4.234865, 1, 1, 1, 1, 1,
-1.235789, 1.168441, 0.5912946, 1, 1, 1, 1, 1,
-1.235263, 0.1233183, -1.10583, 1, 1, 1, 1, 1,
-1.233873, -0.1955875, -2.688922, 1, 1, 1, 1, 1,
-1.221808, 0.9844049, -1.41635, 1, 1, 1, 1, 1,
-1.221697, 1.31626, -1.217332, 1, 1, 1, 1, 1,
-1.221688, 0.07312363, -1.165478, 1, 1, 1, 1, 1,
-1.217508, -0.8535623, -1.452636, 0, 0, 1, 1, 1,
-1.21096, 0.1784969, -1.589685, 1, 0, 0, 1, 1,
-1.206412, 0.8680536, 1.41499, 1, 0, 0, 1, 1,
-1.206138, 0.2513106, -0.9555868, 1, 0, 0, 1, 1,
-1.204077, -0.5679927, -2.488402, 1, 0, 0, 1, 1,
-1.203545, 1.71596, -1.316873, 1, 0, 0, 1, 1,
-1.203489, -0.2583411, -0.5681285, 0, 0, 0, 1, 1,
-1.19653, -0.7018303, -1.556046, 0, 0, 0, 1, 1,
-1.19591, -1.526343, -3.296608, 0, 0, 0, 1, 1,
-1.190787, 0.1923368, -0.1649472, 0, 0, 0, 1, 1,
-1.183338, 0.09482186, -1.664093, 0, 0, 0, 1, 1,
-1.176078, -1.128451, -1.187654, 0, 0, 0, 1, 1,
-1.171211, 0.1908111, 0.1562892, 0, 0, 0, 1, 1,
-1.170379, 1.084151, -0.1774715, 1, 1, 1, 1, 1,
-1.168436, -0.3490601, -2.586204, 1, 1, 1, 1, 1,
-1.156126, 0.1698293, -1.218381, 1, 1, 1, 1, 1,
-1.141204, 0.3564956, -0.2726648, 1, 1, 1, 1, 1,
-1.122961, 3.274536, 0.07870097, 1, 1, 1, 1, 1,
-1.118037, -1.045828, -4.119729, 1, 1, 1, 1, 1,
-1.112025, 0.07332373, -1.345698, 1, 1, 1, 1, 1,
-1.110025, -1.018195, -2.060855, 1, 1, 1, 1, 1,
-1.10923, -0.5013902, -1.3112, 1, 1, 1, 1, 1,
-1.102653, -1.951303, -2.079047, 1, 1, 1, 1, 1,
-1.100634, 0.0413541, -2.164893, 1, 1, 1, 1, 1,
-1.083133, -0.02026681, -1.655853, 1, 1, 1, 1, 1,
-1.079974, 0.008741466, -1.491283, 1, 1, 1, 1, 1,
-1.075662, -0.5412707, -3.810608, 1, 1, 1, 1, 1,
-1.070128, -0.6794566, -0.9440124, 1, 1, 1, 1, 1,
-1.058516, -1.362888, -1.92807, 0, 0, 1, 1, 1,
-1.057303, 1.162456, -0.941084, 1, 0, 0, 1, 1,
-1.053, 2.725527, -0.3985344, 1, 0, 0, 1, 1,
-1.046285, -0.1888983, -2.356275, 1, 0, 0, 1, 1,
-1.041262, -2.733412, -3.399912, 1, 0, 0, 1, 1,
-1.035234, 0.8022073, -0.3616238, 1, 0, 0, 1, 1,
-1.030107, 0.08072495, -2.019457, 0, 0, 0, 1, 1,
-1.029056, 0.002398825, -1.221135, 0, 0, 0, 1, 1,
-1.020144, -0.1603003, -3.201925, 0, 0, 0, 1, 1,
-1.015652, 0.1464961, -1.163824, 0, 0, 0, 1, 1,
-1.008866, 0.6779503, -2.982375, 0, 0, 0, 1, 1,
-1.008181, -0.4717486, -1.430095, 0, 0, 0, 1, 1,
-1.005499, -0.07003938, -1.554085, 0, 0, 0, 1, 1,
-1.00151, 1.646425, -1.633755, 1, 1, 1, 1, 1,
-0.9985164, 0.6960232, -0.7310202, 1, 1, 1, 1, 1,
-0.9981294, -1.054114, -2.187889, 1, 1, 1, 1, 1,
-0.9971669, -0.7079018, -3.045113, 1, 1, 1, 1, 1,
-0.9958832, 0.05266495, -1.603203, 1, 1, 1, 1, 1,
-0.9950167, 1.2206, -0.4120831, 1, 1, 1, 1, 1,
-0.9936165, -0.05642346, -1.190993, 1, 1, 1, 1, 1,
-0.9923204, 1.739693, -0.1382493, 1, 1, 1, 1, 1,
-0.9888417, -0.629959, -1.450457, 1, 1, 1, 1, 1,
-0.9813681, 0.1257132, -3.23064, 1, 1, 1, 1, 1,
-0.9793351, 0.7015564, -2.33825, 1, 1, 1, 1, 1,
-0.9752571, 1.769087, 2.066012, 1, 1, 1, 1, 1,
-0.9679209, 0.6078768, -1.917341, 1, 1, 1, 1, 1,
-0.9543815, -1.735579, -2.791741, 1, 1, 1, 1, 1,
-0.9530621, -2.510277, -1.516021, 1, 1, 1, 1, 1,
-0.9460058, 2.42679, -1.474345, 0, 0, 1, 1, 1,
-0.9446753, -0.2352682, -2.502451, 1, 0, 0, 1, 1,
-0.9408242, -0.2955589, -1.955336, 1, 0, 0, 1, 1,
-0.9402533, -0.8527645, -0.5134703, 1, 0, 0, 1, 1,
-0.9360439, -0.3921411, -3.400069, 1, 0, 0, 1, 1,
-0.9269739, 0.5343229, -0.09053616, 1, 0, 0, 1, 1,
-0.920951, -0.08053731, -1.921912, 0, 0, 0, 1, 1,
-0.9208706, 0.7904525, 0.2960199, 0, 0, 0, 1, 1,
-0.9153569, 0.1297189, -0.1545886, 0, 0, 0, 1, 1,
-0.9089727, -0.9818001, -3.163073, 0, 0, 0, 1, 1,
-0.9070994, 0.1426074, -2.217321, 0, 0, 0, 1, 1,
-0.9049522, 0.4173711, -2.014875, 0, 0, 0, 1, 1,
-0.9009162, -0.8657091, -1.274534, 0, 0, 0, 1, 1,
-0.9006218, 0.2375972, -0.4686858, 1, 1, 1, 1, 1,
-0.9000574, -0.08272383, -2.858262, 1, 1, 1, 1, 1,
-0.8972234, -0.6617321, -1.979705, 1, 1, 1, 1, 1,
-0.8969975, -1.012093, -1.773985, 1, 1, 1, 1, 1,
-0.8940668, -0.7968321, -2.656084, 1, 1, 1, 1, 1,
-0.8822942, -0.1271798, -0.9079849, 1, 1, 1, 1, 1,
-0.8755237, -0.06145015, -0.9787114, 1, 1, 1, 1, 1,
-0.872634, -0.6670278, -2.584371, 1, 1, 1, 1, 1,
-0.8704436, -0.2449831, -1.313605, 1, 1, 1, 1, 1,
-0.8660126, -0.9362799, -1.26411, 1, 1, 1, 1, 1,
-0.859755, 1.278228, -0.8538182, 1, 1, 1, 1, 1,
-0.8579541, 0.4357774, -1.960762, 1, 1, 1, 1, 1,
-0.8567092, 0.4180391, 1.235716, 1, 1, 1, 1, 1,
-0.8530611, 0.7441972, -1.901588, 1, 1, 1, 1, 1,
-0.8500018, 0.9139064, -1.042318, 1, 1, 1, 1, 1,
-0.8471808, -0.5842566, -1.508486, 0, 0, 1, 1, 1,
-0.8366029, 0.2237371, -1.671132, 1, 0, 0, 1, 1,
-0.8356533, -1.07619, -2.355432, 1, 0, 0, 1, 1,
-0.8319135, 0.7706812, -1.141705, 1, 0, 0, 1, 1,
-0.8317245, 0.3239795, -0.2146871, 1, 0, 0, 1, 1,
-0.8278517, 0.9675481, -1.743158, 1, 0, 0, 1, 1,
-0.8243285, -0.493487, -3.996242, 0, 0, 0, 1, 1,
-0.8170441, -0.457237, -2.823319, 0, 0, 0, 1, 1,
-0.8159126, -0.9215971, -4.196678, 0, 0, 0, 1, 1,
-0.8115044, 2.440138, -1.623081, 0, 0, 0, 1, 1,
-0.8109505, -0.157713, -2.418028, 0, 0, 0, 1, 1,
-0.8105357, -0.7347984, -1.621898, 0, 0, 0, 1, 1,
-0.8061774, -1.46541, -4.558393, 0, 0, 0, 1, 1,
-0.8038065, -0.9284403, -2.119695, 1, 1, 1, 1, 1,
-0.8036143, -0.06644337, -2.33182, 1, 1, 1, 1, 1,
-0.8018881, -0.5533649, -2.069185, 1, 1, 1, 1, 1,
-0.8016453, 0.8069285, -0.03076488, 1, 1, 1, 1, 1,
-0.7942179, -1.114983, -2.507616, 1, 1, 1, 1, 1,
-0.7878354, 0.07420128, -1.645421, 1, 1, 1, 1, 1,
-0.7840254, 0.2182782, -2.979768, 1, 1, 1, 1, 1,
-0.7825965, -0.2376361, 0.9137388, 1, 1, 1, 1, 1,
-0.7799771, 0.8508945, -0.06257178, 1, 1, 1, 1, 1,
-0.7792612, 0.5339821, 1.732533, 1, 1, 1, 1, 1,
-0.7781785, 1.074568, 0.3183838, 1, 1, 1, 1, 1,
-0.7778802, -0.2882384, -1.487478, 1, 1, 1, 1, 1,
-0.7711598, 0.9491028, 0.2760021, 1, 1, 1, 1, 1,
-0.7578126, 1.469651, -0.05230744, 1, 1, 1, 1, 1,
-0.7553709, -0.4235978, -0.8403743, 1, 1, 1, 1, 1,
-0.7543197, -0.7010285, -2.233455, 0, 0, 1, 1, 1,
-0.7492771, -0.8284612, -1.492265, 1, 0, 0, 1, 1,
-0.7475293, -0.05523645, -1.700011, 1, 0, 0, 1, 1,
-0.7452618, 1.095945, -1.746004, 1, 0, 0, 1, 1,
-0.7450555, -0.4909911, -3.727362, 1, 0, 0, 1, 1,
-0.7327686, -0.1364809, -0.9267891, 1, 0, 0, 1, 1,
-0.7317276, -0.7311947, -4.283469, 0, 0, 0, 1, 1,
-0.7292652, 0.1292849, 0.3983034, 0, 0, 0, 1, 1,
-0.7263652, 0.903651, 0.1332378, 0, 0, 0, 1, 1,
-0.723222, -0.09376106, -0.8661993, 0, 0, 0, 1, 1,
-0.7213866, -0.3278508, -0.9373299, 0, 0, 0, 1, 1,
-0.7147112, -0.08957896, -1.77284, 0, 0, 0, 1, 1,
-0.7134261, -0.737637, -2.09086, 0, 0, 0, 1, 1,
-0.7110803, 0.4198298, -0.8687238, 1, 1, 1, 1, 1,
-0.7047339, -0.6323118, -3.569445, 1, 1, 1, 1, 1,
-0.7045668, 1.138591, -1.541625, 1, 1, 1, 1, 1,
-0.7032674, 1.087069, -0.6080147, 1, 1, 1, 1, 1,
-0.7002825, -0.4170823, -3.098631, 1, 1, 1, 1, 1,
-0.6996207, 1.215405, -0.6060883, 1, 1, 1, 1, 1,
-0.6953255, -0.3395205, -2.482558, 1, 1, 1, 1, 1,
-0.6948321, 0.4977602, -0.1774606, 1, 1, 1, 1, 1,
-0.691944, 0.1520094, -0.3213714, 1, 1, 1, 1, 1,
-0.6882646, 0.2320458, -1.105735, 1, 1, 1, 1, 1,
-0.6881371, -0.8103129, -2.898094, 1, 1, 1, 1, 1,
-0.68782, -0.4835087, -2.362384, 1, 1, 1, 1, 1,
-0.6876656, -0.2070521, -1.5307, 1, 1, 1, 1, 1,
-0.6843781, -0.2864107, -0.1665813, 1, 1, 1, 1, 1,
-0.6832991, -0.5414069, -0.7614169, 1, 1, 1, 1, 1,
-0.6795161, -0.09745619, 0.1501519, 0, 0, 1, 1, 1,
-0.670612, 0.9279203, -0.8150677, 1, 0, 0, 1, 1,
-0.6701292, -0.1396107, -3.424212, 1, 0, 0, 1, 1,
-0.6694027, -0.1153136, -2.056553, 1, 0, 0, 1, 1,
-0.6680408, 0.2264663, -0.3978485, 1, 0, 0, 1, 1,
-0.6672656, 0.5262526, -0.8445928, 1, 0, 0, 1, 1,
-0.6625772, 1.442235, -0.6347119, 0, 0, 0, 1, 1,
-0.6620615, 0.2192691, 0.5212449, 0, 0, 0, 1, 1,
-0.6612635, -0.4095722, -0.8134176, 0, 0, 0, 1, 1,
-0.6541129, -0.3961358, -2.672833, 0, 0, 0, 1, 1,
-0.6521481, -0.3626254, -1.077972, 0, 0, 0, 1, 1,
-0.6484016, 1.699366, 0.907415, 0, 0, 0, 1, 1,
-0.6414366, 0.2944111, -1.438517, 0, 0, 0, 1, 1,
-0.6389762, 0.4667052, 0.1426046, 1, 1, 1, 1, 1,
-0.6386855, -0.3189444, -4.254464, 1, 1, 1, 1, 1,
-0.6375568, -0.4635831, -2.442491, 1, 1, 1, 1, 1,
-0.6292599, 2.301347, -0.6941504, 1, 1, 1, 1, 1,
-0.6291752, -0.1303748, -2.454411, 1, 1, 1, 1, 1,
-0.6245174, -0.3040016, -2.001742, 1, 1, 1, 1, 1,
-0.6205705, 0.795507, 1.552771, 1, 1, 1, 1, 1,
-0.6153004, 0.5008137, -3.065572, 1, 1, 1, 1, 1,
-0.6102393, 1.436824, -2.52476, 1, 1, 1, 1, 1,
-0.608489, 1.127028, -0.5821653, 1, 1, 1, 1, 1,
-0.604645, 1.502583, 0.1353448, 1, 1, 1, 1, 1,
-0.6035448, 0.9092114, 1.072995, 1, 1, 1, 1, 1,
-0.6022305, 1.440417, -0.06632105, 1, 1, 1, 1, 1,
-0.6021256, 1.5475, -1.683455, 1, 1, 1, 1, 1,
-0.6008125, 0.4550756, -1.150226, 1, 1, 1, 1, 1,
-0.5983892, -2.357769, -3.607473, 0, 0, 1, 1, 1,
-0.5948301, -1.230489, -1.402385, 1, 0, 0, 1, 1,
-0.5945989, 0.02942144, -3.681561, 1, 0, 0, 1, 1,
-0.5944067, -0.3957169, -1.160041, 1, 0, 0, 1, 1,
-0.5923753, 0.6237421, -1.287025, 1, 0, 0, 1, 1,
-0.5914057, 2.054991, -0.5365483, 1, 0, 0, 1, 1,
-0.5849692, 0.226282, -1.052987, 0, 0, 0, 1, 1,
-0.5843803, -0.2123176, -1.8202, 0, 0, 0, 1, 1,
-0.5802116, -0.8221254, -3.386803, 0, 0, 0, 1, 1,
-0.578733, 0.2380009, -1.977752, 0, 0, 0, 1, 1,
-0.5758967, -0.1931498, -2.061475, 0, 0, 0, 1, 1,
-0.5683303, 0.6064787, 0.2455534, 0, 0, 0, 1, 1,
-0.567966, -2.472434, -3.055216, 0, 0, 0, 1, 1,
-0.5626202, -0.7280816, -3.272367, 1, 1, 1, 1, 1,
-0.5593315, -1.534663, -3.159666, 1, 1, 1, 1, 1,
-0.5547546, -2.018271, -3.798345, 1, 1, 1, 1, 1,
-0.5530802, 0.07683109, -3.070204, 1, 1, 1, 1, 1,
-0.5528587, -1.728454, -2.972345, 1, 1, 1, 1, 1,
-0.5507908, 1.189534, -2.766064, 1, 1, 1, 1, 1,
-0.5472807, 0.4815989, -1.496344, 1, 1, 1, 1, 1,
-0.545737, -0.9247265, -1.80713, 1, 1, 1, 1, 1,
-0.5428504, -1.22723, -0.3063165, 1, 1, 1, 1, 1,
-0.5418376, 0.3990159, -1.8696, 1, 1, 1, 1, 1,
-0.5351886, 1.051975, -1.115682, 1, 1, 1, 1, 1,
-0.5332464, -0.008966617, -1.532769, 1, 1, 1, 1, 1,
-0.5327445, 0.4460605, -1.278032, 1, 1, 1, 1, 1,
-0.5293857, -0.6851408, -2.138659, 1, 1, 1, 1, 1,
-0.5270498, -1.801098, -1.65677, 1, 1, 1, 1, 1,
-0.5224592, 0.06799002, -1.302118, 0, 0, 1, 1, 1,
-0.5167346, -1.164017, -2.536768, 1, 0, 0, 1, 1,
-0.5158805, 0.6165736, -1.298499, 1, 0, 0, 1, 1,
-0.5152099, 0.2115085, 0.687446, 1, 0, 0, 1, 1,
-0.5138742, 0.468937, -0.318694, 1, 0, 0, 1, 1,
-0.5126495, 0.8099035, 0.5704178, 1, 0, 0, 1, 1,
-0.5084066, 0.2869236, 0.1283085, 0, 0, 0, 1, 1,
-0.5062213, -0.8972435, -2.725895, 0, 0, 0, 1, 1,
-0.5035089, -0.6370497, -3.425215, 0, 0, 0, 1, 1,
-0.5017946, -0.6413966, -1.355012, 0, 0, 0, 1, 1,
-0.5013213, -0.862946, -1.009028, 0, 0, 0, 1, 1,
-0.4953338, 0.2525936, 0.009467209, 0, 0, 0, 1, 1,
-0.4916846, 0.154206, -1.324033, 0, 0, 0, 1, 1,
-0.4909347, 3.564726, 0.7576227, 1, 1, 1, 1, 1,
-0.4880097, 0.271776, -0.2834438, 1, 1, 1, 1, 1,
-0.4861441, 0.1520415, -1.718456, 1, 1, 1, 1, 1,
-0.4857123, -1.016979, -1.182285, 1, 1, 1, 1, 1,
-0.4812411, 0.448902, 0.2784456, 1, 1, 1, 1, 1,
-0.4767532, 1.10411, -1.541727, 1, 1, 1, 1, 1,
-0.4763212, -0.02089326, 0.386783, 1, 1, 1, 1, 1,
-0.476319, 0.9983186, -0.4034076, 1, 1, 1, 1, 1,
-0.472651, 1.381601, -2.23827, 1, 1, 1, 1, 1,
-0.4700065, 0.08173359, -2.49246, 1, 1, 1, 1, 1,
-0.4628328, 1.032086, 0.6806717, 1, 1, 1, 1, 1,
-0.4616824, 0.09628282, -1.034326, 1, 1, 1, 1, 1,
-0.4611239, -0.2629405, -2.738395, 1, 1, 1, 1, 1,
-0.4576772, 1.748731, -3.15698, 1, 1, 1, 1, 1,
-0.4553116, -0.7072836, -3.091851, 1, 1, 1, 1, 1,
-0.4513672, 0.07387766, -1.339486, 0, 0, 1, 1, 1,
-0.449527, -1.451503, -2.84945, 1, 0, 0, 1, 1,
-0.4467011, 0.7024297, -1.205026, 1, 0, 0, 1, 1,
-0.4390212, -1.103149, -3.089112, 1, 0, 0, 1, 1,
-0.437554, 1.061678, 0.2333239, 1, 0, 0, 1, 1,
-0.4308804, 0.05770609, -1.547579, 1, 0, 0, 1, 1,
-0.4284346, -1.036991, -2.638456, 0, 0, 0, 1, 1,
-0.4211917, -1.159572, -1.769515, 0, 0, 0, 1, 1,
-0.4179968, -0.8569428, -2.048356, 0, 0, 0, 1, 1,
-0.4153654, 1.556668, 0.3843758, 0, 0, 0, 1, 1,
-0.4053342, 0.8352795, -1.71318, 0, 0, 0, 1, 1,
-0.4001233, -0.2382811, -2.585424, 0, 0, 0, 1, 1,
-0.3999862, -1.52993, -3.474691, 0, 0, 0, 1, 1,
-0.3999482, 0.549875, -0.2264159, 1, 1, 1, 1, 1,
-0.3993014, -0.9827638, -4.155299, 1, 1, 1, 1, 1,
-0.3942952, -0.2851133, -3.483809, 1, 1, 1, 1, 1,
-0.3924227, -1.60522, -3.812473, 1, 1, 1, 1, 1,
-0.387744, -0.4134906, -0.9600981, 1, 1, 1, 1, 1,
-0.3791505, -0.1790099, -1.672293, 1, 1, 1, 1, 1,
-0.3783971, 0.089266, -0.9480721, 1, 1, 1, 1, 1,
-0.3735591, -1.235662, -3.857367, 1, 1, 1, 1, 1,
-0.3726746, 0.1801089, -0.02497174, 1, 1, 1, 1, 1,
-0.3726217, 0.5477691, -0.1227364, 1, 1, 1, 1, 1,
-0.3692399, 0.3811287, -1.68957, 1, 1, 1, 1, 1,
-0.3674528, -0.7677174, -2.510787, 1, 1, 1, 1, 1,
-0.3666712, 1.081468, -1.33626, 1, 1, 1, 1, 1,
-0.3666487, -0.7285413, -3.408405, 1, 1, 1, 1, 1,
-0.3657949, -1.878444, -2.518348, 1, 1, 1, 1, 1,
-0.3647636, -1.131354, -4.618534, 0, 0, 1, 1, 1,
-0.3635663, 0.5298774, 0.6482408, 1, 0, 0, 1, 1,
-0.359698, -0.5823027, -3.349486, 1, 0, 0, 1, 1,
-0.3538387, 1.938235, 1.510779, 1, 0, 0, 1, 1,
-0.3532863, -0.7515243, -4.139461, 1, 0, 0, 1, 1,
-0.3521258, 0.1743443, -0.1329553, 1, 0, 0, 1, 1,
-0.3506243, 0.02394004, -0.1580154, 0, 0, 0, 1, 1,
-0.3464482, 0.1952969, -0.6354425, 0, 0, 0, 1, 1,
-0.3454115, 0.6812586, -0.7050477, 0, 0, 0, 1, 1,
-0.343554, -0.1106657, -0.2946347, 0, 0, 0, 1, 1,
-0.340166, -1.276695, -3.667927, 0, 0, 0, 1, 1,
-0.3397146, -0.3438894, -1.145144, 0, 0, 0, 1, 1,
-0.3370982, -0.9085558, -2.516116, 0, 0, 0, 1, 1,
-0.3335221, 0.02767134, -2.24473, 1, 1, 1, 1, 1,
-0.3295672, 0.4524447, -2.134809, 1, 1, 1, 1, 1,
-0.3292682, -0.2904527, -1.335836, 1, 1, 1, 1, 1,
-0.3221517, -0.302702, -0.8967347, 1, 1, 1, 1, 1,
-0.3217538, 0.9513458, -1.097856, 1, 1, 1, 1, 1,
-0.3180066, -0.3406224, -5.124207, 1, 1, 1, 1, 1,
-0.3169472, -0.4762224, -3.287716, 1, 1, 1, 1, 1,
-0.3135285, -0.3547433, -2.792453, 1, 1, 1, 1, 1,
-0.3126167, 0.5542303, -0.6940985, 1, 1, 1, 1, 1,
-0.3084717, -0.471741, -4.091525, 1, 1, 1, 1, 1,
-0.3062899, 2.229681, 1.382213, 1, 1, 1, 1, 1,
-0.3027467, 1.50689, 0.7857761, 1, 1, 1, 1, 1,
-0.3014844, 0.5975721, 0.4298786, 1, 1, 1, 1, 1,
-0.2906982, -1.757861, -3.152189, 1, 1, 1, 1, 1,
-0.2862105, 0.6269411, -1.702295, 1, 1, 1, 1, 1,
-0.2817343, -0.3058842, -2.974489, 0, 0, 1, 1, 1,
-0.280152, 0.7917503, 0.2361973, 1, 0, 0, 1, 1,
-0.2781998, 0.4730245, 0.2602471, 1, 0, 0, 1, 1,
-0.2765859, -0.2218762, -3.128586, 1, 0, 0, 1, 1,
-0.2753506, 1.242725, 2.278004, 1, 0, 0, 1, 1,
-0.2712179, 0.1839674, -1.271452, 1, 0, 0, 1, 1,
-0.2710937, 0.5622684, -2.034914, 0, 0, 0, 1, 1,
-0.2635753, 0.80656, -1.430795, 0, 0, 0, 1, 1,
-0.2634584, -0.4993107, -1.832481, 0, 0, 0, 1, 1,
-0.2544965, 0.3494866, -1.748775, 0, 0, 0, 1, 1,
-0.253453, 0.9228322, -0.2665093, 0, 0, 0, 1, 1,
-0.2530691, 0.4388058, 0.7384578, 0, 0, 0, 1, 1,
-0.252368, -0.8722782, -2.479395, 0, 0, 0, 1, 1,
-0.2516135, -0.3422511, -3.015238, 1, 1, 1, 1, 1,
-0.2504941, -1.30484, -3.771101, 1, 1, 1, 1, 1,
-0.2432148, -1.832527, -1.845905, 1, 1, 1, 1, 1,
-0.2414245, -0.9435379, -4.476832, 1, 1, 1, 1, 1,
-0.2400338, 1.043265, 0.6818374, 1, 1, 1, 1, 1,
-0.2383301, -0.2050992, -2.604661, 1, 1, 1, 1, 1,
-0.2353997, 2.884246, 0.5847256, 1, 1, 1, 1, 1,
-0.2346528, 0.4631453, 0.06076286, 1, 1, 1, 1, 1,
-0.2344735, 0.6788863, -2.558675, 1, 1, 1, 1, 1,
-0.2277854, -1.434945, -2.818789, 1, 1, 1, 1, 1,
-0.2268132, 1.191325, -0.1629596, 1, 1, 1, 1, 1,
-0.2258307, 0.9081734, -0.7025411, 1, 1, 1, 1, 1,
-0.225401, 0.816361, -0.5030607, 1, 1, 1, 1, 1,
-0.2242436, -2.771796, -1.858896, 1, 1, 1, 1, 1,
-0.2237957, 0.1817288, -0.7106712, 1, 1, 1, 1, 1,
-0.2236978, -1.291735, -2.583683, 0, 0, 1, 1, 1,
-0.2227777, -0.06258243, -1.594097, 1, 0, 0, 1, 1,
-0.219726, 0.1436155, -2.613292, 1, 0, 0, 1, 1,
-0.2139036, -0.3053438, -4.451763, 1, 0, 0, 1, 1,
-0.2107812, 0.7907735, 0.5733041, 1, 0, 0, 1, 1,
-0.2091973, -0.3025852, -3.196243, 1, 0, 0, 1, 1,
-0.2084234, 0.6204903, 0.4827071, 0, 0, 0, 1, 1,
-0.2059085, -1.38739, -4.115725, 0, 0, 0, 1, 1,
-0.2042248, -0.7061941, -3.703317, 0, 0, 0, 1, 1,
-0.2041695, 0.848044, -1.25062, 0, 0, 0, 1, 1,
-0.2040146, -0.4293455, -2.081882, 0, 0, 0, 1, 1,
-0.2007823, -0.05709119, -1.498721, 0, 0, 0, 1, 1,
-0.1974287, 1.170747, 0.2291327, 0, 0, 0, 1, 1,
-0.1966915, 0.09583026, 0.3941832, 1, 1, 1, 1, 1,
-0.1943785, -1.501122, -2.514292, 1, 1, 1, 1, 1,
-0.18996, 0.01654279, 0.8414648, 1, 1, 1, 1, 1,
-0.1853939, -0.2920324, -1.898687, 1, 1, 1, 1, 1,
-0.184531, -1.603189, -4.479311, 1, 1, 1, 1, 1,
-0.1801058, -2.114518, -1.807014, 1, 1, 1, 1, 1,
-0.1790549, -0.5231056, -1.986196, 1, 1, 1, 1, 1,
-0.1758612, -0.5526131, -1.968652, 1, 1, 1, 1, 1,
-0.1724376, -1.928007, -2.656755, 1, 1, 1, 1, 1,
-0.1703027, 0.6354176, -1.986512, 1, 1, 1, 1, 1,
-0.1692898, 0.7599526, -0.1879503, 1, 1, 1, 1, 1,
-0.1671333, 0.08569025, -2.822652, 1, 1, 1, 1, 1,
-0.165893, -0.9740068, -2.187746, 1, 1, 1, 1, 1,
-0.1658531, -0.1671389, -1.122952, 1, 1, 1, 1, 1,
-0.1579303, 0.8225466, 0.04082297, 1, 1, 1, 1, 1,
-0.1553115, -0.7473012, -1.768068, 0, 0, 1, 1, 1,
-0.1551406, 0.1522778, -3.031693, 1, 0, 0, 1, 1,
-0.1475375, -0.5553406, -3.677192, 1, 0, 0, 1, 1,
-0.141921, 0.963917, -1.161334, 1, 0, 0, 1, 1,
-0.1372264, 2.049819, -0.3141018, 1, 0, 0, 1, 1,
-0.1346627, 1.391263, 1.513834, 1, 0, 0, 1, 1,
-0.1332384, -0.3716943, -3.029121, 0, 0, 0, 1, 1,
-0.1309177, -0.4660869, -2.467603, 0, 0, 0, 1, 1,
-0.1256375, -0.6625443, -0.8897297, 0, 0, 0, 1, 1,
-0.1203368, 0.06938899, 0.002136275, 0, 0, 0, 1, 1,
-0.1189506, -0.08629963, -1.277136, 0, 0, 0, 1, 1,
-0.1175885, -0.05910961, -2.391734, 0, 0, 0, 1, 1,
-0.1151486, 0.05935039, -2.954921, 0, 0, 0, 1, 1,
-0.1145176, -0.3860602, -3.463013, 1, 1, 1, 1, 1,
-0.1137432, -0.06740644, -3.828499, 1, 1, 1, 1, 1,
-0.1097278, -1.771322, -2.458303, 1, 1, 1, 1, 1,
-0.1082332, -0.09292889, -2.003703, 1, 1, 1, 1, 1,
-0.1000786, -1.225825, -0.4583717, 1, 1, 1, 1, 1,
-0.09998204, -0.2782844, -3.172835, 1, 1, 1, 1, 1,
-0.09706965, -0.2460987, -2.681764, 1, 1, 1, 1, 1,
-0.09514882, 1.245353, 0.6171434, 1, 1, 1, 1, 1,
-0.0934426, 0.3815518, 0.1852035, 1, 1, 1, 1, 1,
-0.08676942, -0.8115487, -2.875163, 1, 1, 1, 1, 1,
-0.07898732, -0.02869739, -0.5422078, 1, 1, 1, 1, 1,
-0.07614228, 0.04140408, 1.363089, 1, 1, 1, 1, 1,
-0.07520083, -0.1774403, -2.109146, 1, 1, 1, 1, 1,
-0.07327107, -0.9159864, -4.623288, 1, 1, 1, 1, 1,
-0.07162305, 1.828851, -0.6083123, 1, 1, 1, 1, 1,
-0.0697983, 0.4697774, -0.5910712, 0, 0, 1, 1, 1,
-0.06717447, -0.7549245, -4.124475, 1, 0, 0, 1, 1,
-0.0667879, 1.128738, -0.405359, 1, 0, 0, 1, 1,
-0.06381668, 0.35177, -2.331603, 1, 0, 0, 1, 1,
-0.06250086, -0.02310334, -0.7643542, 1, 0, 0, 1, 1,
-0.06192298, 0.04490143, -0.8249667, 1, 0, 0, 1, 1,
-0.05748292, 1.88913, -0.6689189, 0, 0, 0, 1, 1,
-0.05463864, -0.1963773, -3.240931, 0, 0, 0, 1, 1,
-0.04590306, 0.1566663, -0.05523442, 0, 0, 0, 1, 1,
-0.04579499, -0.100719, -1.582872, 0, 0, 0, 1, 1,
-0.04504327, -0.1240235, -4.178637, 0, 0, 0, 1, 1,
-0.04105305, -0.3397221, -1.587243, 0, 0, 0, 1, 1,
-0.03351271, -0.7558832, -2.453203, 0, 0, 0, 1, 1,
-0.03138679, -2.243762, -2.60363, 1, 1, 1, 1, 1,
-0.01893568, -0.6773832, -4.415224, 1, 1, 1, 1, 1,
-0.01625383, 0.2576938, -0.1293796, 1, 1, 1, 1, 1,
-0.0135309, -1.054049, -3.171373, 1, 1, 1, 1, 1,
-0.01338867, 1.454733, -0.3824924, 1, 1, 1, 1, 1,
-0.006971807, 0.2490609, -0.3617558, 1, 1, 1, 1, 1,
-0.00624638, 1.789333, -0.7757819, 1, 1, 1, 1, 1,
-0.00376369, 1.308581, -2.941519, 1, 1, 1, 1, 1,
-0.002182557, 1.950499, -0.4476106, 1, 1, 1, 1, 1,
0.0004878854, 0.1692086, -0.8783079, 1, 1, 1, 1, 1,
0.003341787, 0.5219676, 2.029738, 1, 1, 1, 1, 1,
0.003745724, 0.8986111, -0.1845196, 1, 1, 1, 1, 1,
0.007194064, -0.5588413, 1.838336, 1, 1, 1, 1, 1,
0.008056493, -1.001463, 2.943795, 1, 1, 1, 1, 1,
0.009093564, -0.07428717, 2.168455, 1, 1, 1, 1, 1,
0.01677519, -0.1768874, 1.229856, 0, 0, 1, 1, 1,
0.01730987, -0.8435107, 3.605813, 1, 0, 0, 1, 1,
0.01799604, -1.487066, 3.626866, 1, 0, 0, 1, 1,
0.02206947, -0.124889, 4.252092, 1, 0, 0, 1, 1,
0.02356785, 1.073583, -0.9918142, 1, 0, 0, 1, 1,
0.02660721, -0.337191, 2.677644, 1, 0, 0, 1, 1,
0.03614686, 0.03190356, 3.117244, 0, 0, 0, 1, 1,
0.04115968, 0.5756316, 1.025445, 0, 0, 0, 1, 1,
0.04165464, 0.5564059, 2.725865, 0, 0, 0, 1, 1,
0.04519714, 1.598155, -0.354185, 0, 0, 0, 1, 1,
0.0460207, 0.2776127, -0.08457644, 0, 0, 0, 1, 1,
0.04795363, -0.1143756, 1.104093, 0, 0, 0, 1, 1,
0.05130301, 1.479829, 0.2766553, 0, 0, 0, 1, 1,
0.05257212, 1.976474, 0.302399, 1, 1, 1, 1, 1,
0.05316866, -0.7653968, 2.392122, 1, 1, 1, 1, 1,
0.05868903, 1.60488, 0.2294909, 1, 1, 1, 1, 1,
0.05911348, 0.05832531, -0.80078, 1, 1, 1, 1, 1,
0.05918544, -0.1348927, 3.510128, 1, 1, 1, 1, 1,
0.06195634, -0.08002985, 3.922395, 1, 1, 1, 1, 1,
0.06199704, 0.04897064, 0.7284809, 1, 1, 1, 1, 1,
0.06215171, -0.4907874, 4.031287, 1, 1, 1, 1, 1,
0.06434525, -0.02284962, 2.76543, 1, 1, 1, 1, 1,
0.0687177, -0.2484451, 2.139612, 1, 1, 1, 1, 1,
0.07189012, 1.532103, 0.1575505, 1, 1, 1, 1, 1,
0.07325874, -1.119599, 3.652926, 1, 1, 1, 1, 1,
0.07440368, -0.7879018, 2.226701, 1, 1, 1, 1, 1,
0.07450941, -0.4506762, 4.359419, 1, 1, 1, 1, 1,
0.08372123, -0.3975271, 1.439997, 1, 1, 1, 1, 1,
0.09140948, 1.297225, 0.7069124, 0, 0, 1, 1, 1,
0.0945358, -0.4132818, 2.207125, 1, 0, 0, 1, 1,
0.09566087, -0.5411679, 3.408943, 1, 0, 0, 1, 1,
0.09573313, -1.272352, 3.889888, 1, 0, 0, 1, 1,
0.09650004, -0.7468578, 2.54433, 1, 0, 0, 1, 1,
0.1013339, 0.006369677, 3.340791, 1, 0, 0, 1, 1,
0.1014183, -1.666464, 3.998799, 0, 0, 0, 1, 1,
0.1021607, -2.000549, 1.593724, 0, 0, 0, 1, 1,
0.1047132, -0.2238173, 3.116684, 0, 0, 0, 1, 1,
0.10658, 0.04758393, 0.01035111, 0, 0, 0, 1, 1,
0.1084236, -0.1322275, 3.065185, 0, 0, 0, 1, 1,
0.1088732, 0.7532158, 0.9641058, 0, 0, 0, 1, 1,
0.1090089, -0.9121733, 3.909979, 0, 0, 0, 1, 1,
0.1141131, -0.3406029, 3.413718, 1, 1, 1, 1, 1,
0.1147422, 1.235194, 0.5011216, 1, 1, 1, 1, 1,
0.1151915, 0.9829918, 0.3084076, 1, 1, 1, 1, 1,
0.1174488, -1.337397, 4.410741, 1, 1, 1, 1, 1,
0.1187697, -1.457397, 4.617506, 1, 1, 1, 1, 1,
0.1223796, -1.903028, 1.446893, 1, 1, 1, 1, 1,
0.1331769, -0.3937034, 1.733488, 1, 1, 1, 1, 1,
0.1354921, 0.7021831, 1.167894, 1, 1, 1, 1, 1,
0.1366269, -1.604955, 2.811181, 1, 1, 1, 1, 1,
0.1374991, -1.123216, 4.25931, 1, 1, 1, 1, 1,
0.1410329, 1.02693, 0.2513543, 1, 1, 1, 1, 1,
0.1411186, 0.2320275, 0.4823793, 1, 1, 1, 1, 1,
0.1426692, -0.02201651, 1.656988, 1, 1, 1, 1, 1,
0.1496262, -1.869122, 1.755263, 1, 1, 1, 1, 1,
0.1555497, -1.557336, 5.403358, 1, 1, 1, 1, 1,
0.1569825, -1.834977, 4.143539, 0, 0, 1, 1, 1,
0.1588259, 0.1962893, 1.058717, 1, 0, 0, 1, 1,
0.1591965, -2.003628, 2.234412, 1, 0, 0, 1, 1,
0.1648993, -0.7106351, 4.680887, 1, 0, 0, 1, 1,
0.1652073, -0.8207454, 3.429801, 1, 0, 0, 1, 1,
0.1667278, -0.8715275, 1.674482, 1, 0, 0, 1, 1,
0.1773589, -2.872833, 3.307698, 0, 0, 0, 1, 1,
0.1813176, 0.7749568, 0.5093037, 0, 0, 0, 1, 1,
0.1826884, -0.9184017, 3.410477, 0, 0, 0, 1, 1,
0.1851656, -1.54322, 4.219281, 0, 0, 0, 1, 1,
0.1859595, 1.120051, 0.8599195, 0, 0, 0, 1, 1,
0.1878066, -0.04850363, 0.6673836, 0, 0, 0, 1, 1,
0.1932098, 1.316994, 0.8631394, 0, 0, 0, 1, 1,
0.1945787, 0.6208466, -0.552826, 1, 1, 1, 1, 1,
0.1971565, -0.2106668, 0.5809426, 1, 1, 1, 1, 1,
0.1975253, 1.075728, 1.315722, 1, 1, 1, 1, 1,
0.2025952, 2.324562, -2.217515, 1, 1, 1, 1, 1,
0.2031767, 0.34548, 0.2578812, 1, 1, 1, 1, 1,
0.2034007, 0.3605441, -0.225565, 1, 1, 1, 1, 1,
0.2043089, 1.654371, 0.3575216, 1, 1, 1, 1, 1,
0.208064, 0.6322346, 0.3171577, 1, 1, 1, 1, 1,
0.2139465, -0.5075458, 0.17312, 1, 1, 1, 1, 1,
0.2185211, 0.5167529, -1.497312, 1, 1, 1, 1, 1,
0.2197832, 0.3564598, 0.8016972, 1, 1, 1, 1, 1,
0.2288186, 0.567844, 0.5667655, 1, 1, 1, 1, 1,
0.2335904, 0.7435065, -0.301894, 1, 1, 1, 1, 1,
0.235668, 0.8316596, 0.6517994, 1, 1, 1, 1, 1,
0.2405421, -0.6317908, 3.259747, 1, 1, 1, 1, 1,
0.2414536, 0.9265908, 0.5100204, 0, 0, 1, 1, 1,
0.2466979, -2.686295, 3.025688, 1, 0, 0, 1, 1,
0.2511354, 0.9444327, 0.5709117, 1, 0, 0, 1, 1,
0.2516157, -0.3597635, 3.570441, 1, 0, 0, 1, 1,
0.2654391, 0.8333904, -0.4857806, 1, 0, 0, 1, 1,
0.2666039, 0.4670678, -0.294742, 1, 0, 0, 1, 1,
0.2678783, 0.02990925, -0.1647464, 0, 0, 0, 1, 1,
0.2680123, 0.9797021, 1.735151, 0, 0, 0, 1, 1,
0.2681686, 0.6103702, 1.578498, 0, 0, 0, 1, 1,
0.2682255, 1.072574, -0.8761114, 0, 0, 0, 1, 1,
0.2712366, 1.72466, 0.1423668, 0, 0, 0, 1, 1,
0.2715157, -1.526002, 1.994892, 0, 0, 0, 1, 1,
0.2725752, 1.319596, 1.380206, 0, 0, 0, 1, 1,
0.2740245, 1.146035, 0.2915267, 1, 1, 1, 1, 1,
0.274208, 0.5332276, -0.2649233, 1, 1, 1, 1, 1,
0.2749773, 0.1499995, 1.470908, 1, 1, 1, 1, 1,
0.2775399, 1.257199, 2.338405, 1, 1, 1, 1, 1,
0.2777516, 0.5052938, 0.1577059, 1, 1, 1, 1, 1,
0.2777768, -1.851784, 3.141936, 1, 1, 1, 1, 1,
0.2833524, 0.2311262, 1.64304, 1, 1, 1, 1, 1,
0.2843884, 1.028952, 0.2036834, 1, 1, 1, 1, 1,
0.2847848, -0.7394435, 2.18361, 1, 1, 1, 1, 1,
0.2860476, 0.9882404, 0.3053686, 1, 1, 1, 1, 1,
0.2869596, 1.34902, -0.2598566, 1, 1, 1, 1, 1,
0.287359, 1.818159, 0.1498375, 1, 1, 1, 1, 1,
0.2972562, 1.344794, 0.8520285, 1, 1, 1, 1, 1,
0.3042641, -0.1453034, 2.141568, 1, 1, 1, 1, 1,
0.3043805, -0.4697119, 1.704674, 1, 1, 1, 1, 1,
0.306014, 0.3151048, -0.110072, 0, 0, 1, 1, 1,
0.3068016, -1.380637, 3.125669, 1, 0, 0, 1, 1,
0.3080049, 0.5761696, 0.6497868, 1, 0, 0, 1, 1,
0.3087003, 0.5142701, 1.372801, 1, 0, 0, 1, 1,
0.3164021, 0.4770641, 0.4463722, 1, 0, 0, 1, 1,
0.3182416, 0.6268718, 0.2087385, 1, 0, 0, 1, 1,
0.3204247, 0.3026158, -0.04389733, 0, 0, 0, 1, 1,
0.3207147, -0.2287581, 3.706563, 0, 0, 0, 1, 1,
0.3226142, -1.976306, 3.750298, 0, 0, 0, 1, 1,
0.3228403, 0.9249499, 1.385932, 0, 0, 0, 1, 1,
0.3256554, -0.5877562, 2.79302, 0, 0, 0, 1, 1,
0.3292256, -0.5626987, 3.512267, 0, 0, 0, 1, 1,
0.3300042, 0.6646087, 0.6991135, 0, 0, 0, 1, 1,
0.3338661, -0.5152307, 1.723511, 1, 1, 1, 1, 1,
0.3359997, -0.02107267, 1.057774, 1, 1, 1, 1, 1,
0.339844, 1.811816, -0.2720586, 1, 1, 1, 1, 1,
0.3400618, -2.096591, 3.335719, 1, 1, 1, 1, 1,
0.3546333, -1.198122, 2.478777, 1, 1, 1, 1, 1,
0.3572393, 0.4158503, 0.522623, 1, 1, 1, 1, 1,
0.3578815, -1.04489, 3.532308, 1, 1, 1, 1, 1,
0.3624791, 0.1576599, 2.021573, 1, 1, 1, 1, 1,
0.3630169, 0.463173, 0.6735411, 1, 1, 1, 1, 1,
0.3664165, 0.1868919, 1.465433, 1, 1, 1, 1, 1,
0.3722166, -1.089333, 4.119136, 1, 1, 1, 1, 1,
0.3726403, -0.462638, 1.953441, 1, 1, 1, 1, 1,
0.3731205, -0.1380287, 2.590922, 1, 1, 1, 1, 1,
0.3768101, 0.2333828, 1.128063, 1, 1, 1, 1, 1,
0.3790721, 0.04365207, 0.08859012, 1, 1, 1, 1, 1,
0.381615, 1.575563, 1.364453, 0, 0, 1, 1, 1,
0.3883274, 1.277164, 0.9125469, 1, 0, 0, 1, 1,
0.3909292, 1.476159, 2.506549, 1, 0, 0, 1, 1,
0.3919776, 0.5329813, -1.760428, 1, 0, 0, 1, 1,
0.3925562, 1.107408, -0.0318376, 1, 0, 0, 1, 1,
0.3944157, 1.303555, 0.124331, 1, 0, 0, 1, 1,
0.3983792, -0.6614397, 3.454829, 0, 0, 0, 1, 1,
0.4040645, 0.2791358, -0.03320372, 0, 0, 0, 1, 1,
0.4102486, -0.9278003, 3.530936, 0, 0, 0, 1, 1,
0.4110734, -0.1094465, 1.737242, 0, 0, 0, 1, 1,
0.4222646, -0.01893967, 1.507435, 0, 0, 0, 1, 1,
0.4256367, -0.1780708, 1.530825, 0, 0, 0, 1, 1,
0.4257843, 1.109847, 0.1474518, 0, 0, 0, 1, 1,
0.4296544, 0.6558955, 0.6939213, 1, 1, 1, 1, 1,
0.4347991, -0.1615345, 2.408166, 1, 1, 1, 1, 1,
0.4365509, 0.6394222, 1.39809, 1, 1, 1, 1, 1,
0.4412287, 0.1132886, 2.584766, 1, 1, 1, 1, 1,
0.4418505, -0.1575426, 1.618272, 1, 1, 1, 1, 1,
0.4440221, 0.4313848, 0.08565113, 1, 1, 1, 1, 1,
0.4448519, 1.007415, -0.2927574, 1, 1, 1, 1, 1,
0.4515806, 0.3887331, -0.5213547, 1, 1, 1, 1, 1,
0.4530108, -1.271119, 1.165301, 1, 1, 1, 1, 1,
0.4539406, -1.533603, 3.592078, 1, 1, 1, 1, 1,
0.4606314, 0.2259403, 0.6036708, 1, 1, 1, 1, 1,
0.463385, -1.552833, 2.360266, 1, 1, 1, 1, 1,
0.4646103, 0.2357749, -0.7556111, 1, 1, 1, 1, 1,
0.4727633, -1.16672, 2.139786, 1, 1, 1, 1, 1,
0.4734093, -0.4865114, 3.074363, 1, 1, 1, 1, 1,
0.4782616, -0.3833708, 0.1568299, 0, 0, 1, 1, 1,
0.4813273, 0.2713525, 1.756196, 1, 0, 0, 1, 1,
0.4820918, 0.6628773, 1.890993, 1, 0, 0, 1, 1,
0.4826907, 0.3346568, 3.897508, 1, 0, 0, 1, 1,
0.4829171, -0.1410622, 2.910387, 1, 0, 0, 1, 1,
0.4830907, -0.6490595, 2.704933, 1, 0, 0, 1, 1,
0.4856742, 0.4665039, 2.079547, 0, 0, 0, 1, 1,
0.4860731, 0.8060066, 0.5607817, 0, 0, 0, 1, 1,
0.4893029, 1.026093, 0.07604644, 0, 0, 0, 1, 1,
0.4902003, -1.055405, 3.366582, 0, 0, 0, 1, 1,
0.4958419, -2.530869, 3.30842, 0, 0, 0, 1, 1,
0.5006281, 0.5411949, 1.319118, 0, 0, 0, 1, 1,
0.5014079, -0.8296667, 1.048016, 0, 0, 0, 1, 1,
0.5057455, -0.2538323, 1.394808, 1, 1, 1, 1, 1,
0.5064659, 0.759474, 0.588996, 1, 1, 1, 1, 1,
0.5078456, -0.7919168, 3.081515, 1, 1, 1, 1, 1,
0.5126595, 0.8239559, 1.140216, 1, 1, 1, 1, 1,
0.5162176, 0.2047708, -0.4780097, 1, 1, 1, 1, 1,
0.5165289, -1.132972, 2.032422, 1, 1, 1, 1, 1,
0.5200518, -0.9843171, 2.886275, 1, 1, 1, 1, 1,
0.5200818, 0.3435324, 1.537542, 1, 1, 1, 1, 1,
0.5218537, 0.1714498, 1.635734, 1, 1, 1, 1, 1,
0.5235047, 0.8483122, 0.9900037, 1, 1, 1, 1, 1,
0.5275689, -1.337831, 3.508076, 1, 1, 1, 1, 1,
0.5290694, 0.2608141, -0.6844956, 1, 1, 1, 1, 1,
0.5364561, 1.408916, 0.3395198, 1, 1, 1, 1, 1,
0.5390598, -0.4953645, 2.857059, 1, 1, 1, 1, 1,
0.5417425, 1.846348, -0.5644735, 1, 1, 1, 1, 1,
0.5423914, -0.9914179, 1.582745, 0, 0, 1, 1, 1,
0.5424828, -1.037058, 3.425648, 1, 0, 0, 1, 1,
0.5446046, 0.3257041, 1.170823, 1, 0, 0, 1, 1,
0.5486476, -1.960887, 2.222442, 1, 0, 0, 1, 1,
0.5492118, 0.2743713, 0.2072505, 1, 0, 0, 1, 1,
0.5508111, -0.7323035, 2.051521, 1, 0, 0, 1, 1,
0.5510161, -0.4955891, 2.5674, 0, 0, 0, 1, 1,
0.5532421, 0.6515954, 1.539714, 0, 0, 0, 1, 1,
0.5545073, -0.7208331, 3.642368, 0, 0, 0, 1, 1,
0.5569254, 0.5748062, -0.09513403, 0, 0, 0, 1, 1,
0.5578945, 0.3947998, 0.9711671, 0, 0, 0, 1, 1,
0.5583006, -0.2002047, 1.214541, 0, 0, 0, 1, 1,
0.5584964, 1.039301, 2.480766, 0, 0, 0, 1, 1,
0.5609345, 0.15382, 2.570373, 1, 1, 1, 1, 1,
0.562914, 0.4704206, 1.476953, 1, 1, 1, 1, 1,
0.5634769, -2.842657, 1.73638, 1, 1, 1, 1, 1,
0.5672265, 0.492264, 1.669577, 1, 1, 1, 1, 1,
0.575738, 1.044205, -1.925691, 1, 1, 1, 1, 1,
0.5775141, -0.09816298, 1.442039, 1, 1, 1, 1, 1,
0.5775145, 0.2148073, 0.8683493, 1, 1, 1, 1, 1,
0.5775642, -0.8529795, 3.774791, 1, 1, 1, 1, 1,
0.5782788, 0.6558583, 1.662293, 1, 1, 1, 1, 1,
0.582544, -0.07796296, 3.536659, 1, 1, 1, 1, 1,
0.5857212, 0.5397683, 1.39037, 1, 1, 1, 1, 1,
0.5867606, 0.06026209, 1.537834, 1, 1, 1, 1, 1,
0.5917486, -1.196611, 2.51247, 1, 1, 1, 1, 1,
0.5957533, 0.8411443, -0.473457, 1, 1, 1, 1, 1,
0.5987843, -0.06426799, 1.746454, 1, 1, 1, 1, 1,
0.6100426, -1.012712, 3.369245, 0, 0, 1, 1, 1,
0.6106581, 0.6874121, 0.8175904, 1, 0, 0, 1, 1,
0.6152318, -0.08008792, 2.548701, 1, 0, 0, 1, 1,
0.6171927, -0.1124494, 2.016605, 1, 0, 0, 1, 1,
0.6202042, 0.02755163, 0.7971116, 1, 0, 0, 1, 1,
0.6238539, -0.5475355, 1.985571, 1, 0, 0, 1, 1,
0.632023, -1.426631, 1.640629, 0, 0, 0, 1, 1,
0.6323407, 1.719199, -2.060551, 0, 0, 0, 1, 1,
0.6353462, -0.7437685, 1.393344, 0, 0, 0, 1, 1,
0.6367396, 1.942294, 0.7625924, 0, 0, 0, 1, 1,
0.6413158, -0.07570213, 2.343964, 0, 0, 0, 1, 1,
0.6417338, 0.07382147, 2.016821, 0, 0, 0, 1, 1,
0.6435758, -0.9501386, 3.879672, 0, 0, 0, 1, 1,
0.6438178, -0.7005445, 2.28206, 1, 1, 1, 1, 1,
0.6518286, 1.087598, 0.6686488, 1, 1, 1, 1, 1,
0.6683838, 1.691954, 1.056369, 1, 1, 1, 1, 1,
0.6699668, 0.5735974, 0.1098888, 1, 1, 1, 1, 1,
0.6704828, 1.580178, 0.5287583, 1, 1, 1, 1, 1,
0.6765254, 0.9340901, 0.2231782, 1, 1, 1, 1, 1,
0.6778494, -0.8901253, 0.3335523, 1, 1, 1, 1, 1,
0.6809756, -0.9724672, 2.40952, 1, 1, 1, 1, 1,
0.6898242, 0.08209742, 1.164807, 1, 1, 1, 1, 1,
0.7012894, -0.8260732, 2.049904, 1, 1, 1, 1, 1,
0.7024089, 1.445461, -0.04478863, 1, 1, 1, 1, 1,
0.7044697, 0.3476298, 1.815136, 1, 1, 1, 1, 1,
0.7046224, 1.841345, -1.090789, 1, 1, 1, 1, 1,
0.7078981, 0.4671435, 1.489528, 1, 1, 1, 1, 1,
0.7158921, -1.471226, 3.109343, 1, 1, 1, 1, 1,
0.7200317, -1.287549, 3.447433, 0, 0, 1, 1, 1,
0.722372, -1.268952, 1.644819, 1, 0, 0, 1, 1,
0.7231197, 1.015443, 1.883853, 1, 0, 0, 1, 1,
0.73205, 2.202043, 1.249109, 1, 0, 0, 1, 1,
0.7324874, 0.2118271, 1.434457, 1, 0, 0, 1, 1,
0.7405437, -1.224711, 4.353853, 1, 0, 0, 1, 1,
0.7413653, 0.1073814, 3.068003, 0, 0, 0, 1, 1,
0.7416102, -1.198281, 3.557531, 0, 0, 0, 1, 1,
0.7456149, 0.4134941, 1.510262, 0, 0, 0, 1, 1,
0.7484338, -2.41756, 3.335894, 0, 0, 0, 1, 1,
0.7489514, -1.480741, 1.064925, 0, 0, 0, 1, 1,
0.7521587, 0.03930005, 1.456909, 0, 0, 0, 1, 1,
0.7551585, -1.463451, 1.75832, 0, 0, 0, 1, 1,
0.7629303, 1.298263, -0.07887933, 1, 1, 1, 1, 1,
0.7653064, -0.1818658, 1.482655, 1, 1, 1, 1, 1,
0.7675154, -0.7656952, 1.103263, 1, 1, 1, 1, 1,
0.7701483, -0.8329728, 2.36126, 1, 1, 1, 1, 1,
0.7704405, 0.4380108, 0.1574029, 1, 1, 1, 1, 1,
0.7741992, 1.488399, -0.02052863, 1, 1, 1, 1, 1,
0.7771191, -1.737097, 1.219705, 1, 1, 1, 1, 1,
0.7797011, 2.183927, 0.3367839, 1, 1, 1, 1, 1,
0.7949745, -1.524742, 2.561469, 1, 1, 1, 1, 1,
0.8005229, 0.6359678, 1.514365, 1, 1, 1, 1, 1,
0.8023607, -0.8927206, 2.154612, 1, 1, 1, 1, 1,
0.8075712, 0.2728643, 3.391763, 1, 1, 1, 1, 1,
0.8108161, 1.558942, 0.4123574, 1, 1, 1, 1, 1,
0.8135847, 0.5798805, -1.217009, 1, 1, 1, 1, 1,
0.8146336, -0.2721002, 0.35152, 1, 1, 1, 1, 1,
0.8168302, -0.1513449, 1.420313, 0, 0, 1, 1, 1,
0.8172268, 0.7325569, 2.547498, 1, 0, 0, 1, 1,
0.8202882, -0.2017999, 2.126106, 1, 0, 0, 1, 1,
0.8224592, -1.625653, 2.533771, 1, 0, 0, 1, 1,
0.8228418, -1.570613, 2.951411, 1, 0, 0, 1, 1,
0.8248687, 1.458259, 1.713973, 1, 0, 0, 1, 1,
0.8256417, 1.284209, -0.7784101, 0, 0, 0, 1, 1,
0.8280603, 0.6648954, 1.133342, 0, 0, 0, 1, 1,
0.8307643, -0.5379605, 1.828704, 0, 0, 0, 1, 1,
0.831277, -0.4896837, 2.6345, 0, 0, 0, 1, 1,
0.832764, -0.5558939, 3.550584, 0, 0, 0, 1, 1,
0.8395702, 0.6507751, 0.504244, 0, 0, 0, 1, 1,
0.841022, 1.460368, -0.3797233, 0, 0, 0, 1, 1,
0.8416762, -2.02319, 4.116369, 1, 1, 1, 1, 1,
0.8421335, 0.4359629, 2.515294, 1, 1, 1, 1, 1,
0.8443611, -0.4345679, 2.694571, 1, 1, 1, 1, 1,
0.8473408, -1.10813, 2.058222, 1, 1, 1, 1, 1,
0.8544016, -1.704554, 3.910699, 1, 1, 1, 1, 1,
0.8597115, -0.9942406, 2.465576, 1, 1, 1, 1, 1,
0.8714289, -0.7472358, 1.195265, 1, 1, 1, 1, 1,
0.8724027, 0.1891056, 2.805011, 1, 1, 1, 1, 1,
0.8726555, 0.1318402, 0.4480185, 1, 1, 1, 1, 1,
0.8749428, 0.2142349, 1.777118, 1, 1, 1, 1, 1,
0.8775036, 1.187158, 1.94683, 1, 1, 1, 1, 1,
0.8810493, 1.462482, 0.2193804, 1, 1, 1, 1, 1,
0.8818523, 0.04281812, 2.396551, 1, 1, 1, 1, 1,
0.8825645, 0.1525045, 2.323078, 1, 1, 1, 1, 1,
0.8867404, -0.4189526, 0.7870161, 1, 1, 1, 1, 1,
0.8945355, -0.882889, 0.8893176, 0, 0, 1, 1, 1,
0.8960386, -0.9771019, 1.638359, 1, 0, 0, 1, 1,
0.9073346, -1.334185, 2.874677, 1, 0, 0, 1, 1,
0.9185134, 0.3821709, 2.189584, 1, 0, 0, 1, 1,
0.923849, 1.02099, 1.798992, 1, 0, 0, 1, 1,
0.924416, 0.708486, 0.8291262, 1, 0, 0, 1, 1,
0.9247993, -0.6383043, 1.524897, 0, 0, 0, 1, 1,
0.9273547, 0.3815369, 2.45781, 0, 0, 0, 1, 1,
0.9319045, 0.1367786, 0.8441774, 0, 0, 0, 1, 1,
0.9337514, -0.3177687, 4.248963, 0, 0, 0, 1, 1,
0.9406683, -0.1404227, 1.62774, 0, 0, 0, 1, 1,
0.9439082, -0.9859477, 3.233699, 0, 0, 0, 1, 1,
0.9503886, 0.3669257, 1.746161, 0, 0, 0, 1, 1,
0.9517721, 0.09746756, 1.899859, 1, 1, 1, 1, 1,
0.9520923, 0.006211454, 1.337685, 1, 1, 1, 1, 1,
0.9555013, -0.8959643, 4.703014, 1, 1, 1, 1, 1,
0.9556773, -0.8511311, 3.366418, 1, 1, 1, 1, 1,
0.9591466, 0.667993, 1.367479, 1, 1, 1, 1, 1,
0.9799825, -0.4702901, 1.808702, 1, 1, 1, 1, 1,
0.9820368, 0.9721311, 0.2020837, 1, 1, 1, 1, 1,
0.9830311, -1.079295, 3.287591, 1, 1, 1, 1, 1,
0.9903569, -0.2028921, 1.012679, 1, 1, 1, 1, 1,
0.9961504, 1.469491, 0.1123392, 1, 1, 1, 1, 1,
1.001128, 0.6310764, -0.2103045, 1, 1, 1, 1, 1,
1.006537, 1.335921, 0.2276569, 1, 1, 1, 1, 1,
1.013965, 0.3987904, 2.5378, 1, 1, 1, 1, 1,
1.013973, -0.320874, 3.097727, 1, 1, 1, 1, 1,
1.016195, -1.894584, 2.139306, 1, 1, 1, 1, 1,
1.018668, -0.9439512, 0.6900421, 0, 0, 1, 1, 1,
1.018999, 0.424572, 0.6872196, 1, 0, 0, 1, 1,
1.03323, -0.646003, 2.387755, 1, 0, 0, 1, 1,
1.036785, -0.1225194, 2.533148, 1, 0, 0, 1, 1,
1.042018, 1.620356, -0.03745542, 1, 0, 0, 1, 1,
1.045153, -0.3762128, 1.288522, 1, 0, 0, 1, 1,
1.048142, 1.106151, 1.021415, 0, 0, 0, 1, 1,
1.048604, -0.1664942, 0.1783973, 0, 0, 0, 1, 1,
1.050016, 1.321295, 1.468928, 0, 0, 0, 1, 1,
1.057455, -1.143755, 2.744697, 0, 0, 0, 1, 1,
1.0661, 1.142352, -0.4310417, 0, 0, 0, 1, 1,
1.06636, 0.09165023, 2.898876, 0, 0, 0, 1, 1,
1.066642, 0.8958375, 1.786569, 0, 0, 0, 1, 1,
1.06849, -0.9425556, 2.938898, 1, 1, 1, 1, 1,
1.071062, -1.854566, 1.672022, 1, 1, 1, 1, 1,
1.074845, 0.8268172, 0.1194004, 1, 1, 1, 1, 1,
1.079475, -0.2403312, 1.627705, 1, 1, 1, 1, 1,
1.080745, -0.004215572, 2.045809, 1, 1, 1, 1, 1,
1.081424, -0.4645025, 0.7542986, 1, 1, 1, 1, 1,
1.086496, -0.6698703, 2.867159, 1, 1, 1, 1, 1,
1.088575, 0.09023888, 0.588008, 1, 1, 1, 1, 1,
1.091547, -1.10742, 2.478837, 1, 1, 1, 1, 1,
1.095142, 0.09806701, 2.583257, 1, 1, 1, 1, 1,
1.097645, 0.7874973, -0.2769142, 1, 1, 1, 1, 1,
1.100821, -0.3009452, 3.061681, 1, 1, 1, 1, 1,
1.101503, 0.9762992, 0.3913991, 1, 1, 1, 1, 1,
1.102169, -1.560801, 2.308268, 1, 1, 1, 1, 1,
1.105289, 1.660335, 0.7546635, 1, 1, 1, 1, 1,
1.107458, -1.303032, 2.878749, 0, 0, 1, 1, 1,
1.113474, -3.376959, 1.88975, 1, 0, 0, 1, 1,
1.115327, -1.667845, 1.626835, 1, 0, 0, 1, 1,
1.116591, 1.82561, 0.6135627, 1, 0, 0, 1, 1,
1.117015, 0.3147635, 1.371287, 1, 0, 0, 1, 1,
1.122162, 0.8519681, 0.2706084, 1, 0, 0, 1, 1,
1.124432, -0.8429559, 2.250781, 0, 0, 0, 1, 1,
1.124463, -1.577198, 2.434897, 0, 0, 0, 1, 1,
1.136743, 0.01548634, 3.409108, 0, 0, 0, 1, 1,
1.138372, -0.07397129, 0.7923166, 0, 0, 0, 1, 1,
1.141131, 1.592827, -0.07996077, 0, 0, 0, 1, 1,
1.143161, 0.4181056, 2.556312, 0, 0, 0, 1, 1,
1.146807, -1.105346, 1.869243, 0, 0, 0, 1, 1,
1.147846, -0.1932596, 1.523896, 1, 1, 1, 1, 1,
1.166158, 1.216097, 1.084677, 1, 1, 1, 1, 1,
1.170065, 0.1508814, 3.028638, 1, 1, 1, 1, 1,
1.174096, -0.6225725, 1.214301, 1, 1, 1, 1, 1,
1.177026, 1.568317, 0.7125634, 1, 1, 1, 1, 1,
1.181934, -1.932175, 1.557101, 1, 1, 1, 1, 1,
1.186354, -0.03778853, 3.084964, 1, 1, 1, 1, 1,
1.1894, 0.1631581, 2.644555, 1, 1, 1, 1, 1,
1.189513, 1.371255, 0.3580522, 1, 1, 1, 1, 1,
1.19877, -0.2755149, 2.381076, 1, 1, 1, 1, 1,
1.217134, 0.6466966, 0.8825669, 1, 1, 1, 1, 1,
1.222354, -0.05019051, 1.688745, 1, 1, 1, 1, 1,
1.250198, 0.6129826, 2.259115, 1, 1, 1, 1, 1,
1.251744, -0.07962538, 2.358097, 1, 1, 1, 1, 1,
1.253193, 2.150061, -0.9327997, 1, 1, 1, 1, 1,
1.254143, 1.881512, 1.315738, 0, 0, 1, 1, 1,
1.268917, -0.9597402, 2.226876, 1, 0, 0, 1, 1,
1.273582, -2.040544, 3.944688, 1, 0, 0, 1, 1,
1.292286, 0.06686038, 2.020486, 1, 0, 0, 1, 1,
1.292706, 0.7377303, 1.594676, 1, 0, 0, 1, 1,
1.300868, 0.3446764, 2.225029, 1, 0, 0, 1, 1,
1.303941, 1.954032, 1.254237, 0, 0, 0, 1, 1,
1.309955, -1.750583, 2.021065, 0, 0, 0, 1, 1,
1.315401, 1.306183, 1.878775, 0, 0, 0, 1, 1,
1.345086, 0.5002477, 1.1468, 0, 0, 0, 1, 1,
1.359299, 2.246078, 1.535086, 0, 0, 0, 1, 1,
1.366157, -0.4478483, 1.489442, 0, 0, 0, 1, 1,
1.380004, 0.3481263, 1.602065, 0, 0, 0, 1, 1,
1.386345, 0.4574713, 2.14132, 1, 1, 1, 1, 1,
1.389972, -0.7151344, 2.134422, 1, 1, 1, 1, 1,
1.4105, 0.114602, 0.1026961, 1, 1, 1, 1, 1,
1.441995, -0.09345122, 1.472706, 1, 1, 1, 1, 1,
1.446948, -0.5740407, 0.9802763, 1, 1, 1, 1, 1,
1.45981, -0.6813121, 1.184664, 1, 1, 1, 1, 1,
1.46082, 0.5756181, 0.3391981, 1, 1, 1, 1, 1,
1.460847, -0.2030711, 2.940615, 1, 1, 1, 1, 1,
1.464711, 1.248767, 1.513194, 1, 1, 1, 1, 1,
1.467812, -0.3672287, 1.389759, 1, 1, 1, 1, 1,
1.471982, -0.7813146, 1.952352, 1, 1, 1, 1, 1,
1.47347, 0.06658092, 1.939831, 1, 1, 1, 1, 1,
1.481632, 0.5917892, -0.3012031, 1, 1, 1, 1, 1,
1.485905, 1.401279, 1.846143, 1, 1, 1, 1, 1,
1.487213, -0.0154598, 1.937091, 1, 1, 1, 1, 1,
1.492522, -0.6700013, 3.277162, 0, 0, 1, 1, 1,
1.511511, -1.371423, 3.0777, 1, 0, 0, 1, 1,
1.514799, -0.03513284, 1.00701, 1, 0, 0, 1, 1,
1.518832, 0.2734134, 0.2040009, 1, 0, 0, 1, 1,
1.520615, 0.432793, 1.337031, 1, 0, 0, 1, 1,
1.544766, -0.8537737, 1.895657, 1, 0, 0, 1, 1,
1.54772, -0.2061435, 0.9992678, 0, 0, 0, 1, 1,
1.552588, -0.2504173, 1.618446, 0, 0, 0, 1, 1,
1.556488, 1.069044, 3.369709, 0, 0, 0, 1, 1,
1.558636, -0.2263743, 2.012247, 0, 0, 0, 1, 1,
1.575569, -0.4194253, 3.870993, 0, 0, 0, 1, 1,
1.590235, -0.1175487, 0.7572249, 0, 0, 0, 1, 1,
1.59173, -0.2510197, 3.880785, 0, 0, 0, 1, 1,
1.604887, 2.265956, 0.8826184, 1, 1, 1, 1, 1,
1.612346, 0.142892, 0.7154701, 1, 1, 1, 1, 1,
1.616477, -1.010771, 3.566504, 1, 1, 1, 1, 1,
1.626858, 0.4578302, 2.619519, 1, 1, 1, 1, 1,
1.631887, -0.8141611, 1.238347, 1, 1, 1, 1, 1,
1.637498, -1.436357, 1.29248, 1, 1, 1, 1, 1,
1.652107, 1.931414, 1.645064, 1, 1, 1, 1, 1,
1.655615, -0.8044872, 3.933522, 1, 1, 1, 1, 1,
1.658681, 0.1255446, 0.9113697, 1, 1, 1, 1, 1,
1.669251, -1.602306, 2.053511, 1, 1, 1, 1, 1,
1.680932, -1.032837, 2.549934, 1, 1, 1, 1, 1,
1.685122, 1.020287, 2.893414, 1, 1, 1, 1, 1,
1.687631, 1.613418, 0.5479553, 1, 1, 1, 1, 1,
1.694651, -0.03527443, 1.556854, 1, 1, 1, 1, 1,
1.696023, -1.081568, 1.21096, 1, 1, 1, 1, 1,
1.699493, -0.02119882, 0.4185208, 0, 0, 1, 1, 1,
1.744212, -0.4506858, 1.909522, 1, 0, 0, 1, 1,
1.745328, 0.6259561, 0.618489, 1, 0, 0, 1, 1,
1.751104, -1.166655, 2.210997, 1, 0, 0, 1, 1,
1.753225, 0.3164196, 1.621805, 1, 0, 0, 1, 1,
1.783918, -0.5390894, 1.622972, 1, 0, 0, 1, 1,
1.786044, -0.3366953, 0.8594644, 0, 0, 0, 1, 1,
1.790012, 1.258477, 0.219478, 0, 0, 0, 1, 1,
1.794903, -0.2920187, 0.9607969, 0, 0, 0, 1, 1,
1.79539, -0.800814, 2.151449, 0, 0, 0, 1, 1,
1.796274, 0.6821733, 0.2032885, 0, 0, 0, 1, 1,
1.801744, -0.6634013, 1.351061, 0, 0, 0, 1, 1,
1.804178, 0.1849404, 3.755571, 0, 0, 0, 1, 1,
1.810882, 0.9822071, -1.054458, 1, 1, 1, 1, 1,
1.832688, 1.837134, 1.696041, 1, 1, 1, 1, 1,
1.844347, 0.1174042, 1.714376, 1, 1, 1, 1, 1,
1.853333, -1.222919, 2.995062, 1, 1, 1, 1, 1,
1.854997, -0.4691285, 0.3312767, 1, 1, 1, 1, 1,
1.868352, -1.663765, 2.012704, 1, 1, 1, 1, 1,
1.871599, -0.667788, 1.715693, 1, 1, 1, 1, 1,
1.886414, 0.09931821, 2.296301, 1, 1, 1, 1, 1,
1.90039, 1.578452, -0.832575, 1, 1, 1, 1, 1,
1.929628, -0.3042016, 3.884027, 1, 1, 1, 1, 1,
1.944212, 0.2297872, 1.034828, 1, 1, 1, 1, 1,
1.946359, -1.037048, 2.105497, 1, 1, 1, 1, 1,
1.995642, -0.5680901, 4.408406, 1, 1, 1, 1, 1,
1.996015, -0.09601226, 1.872967, 1, 1, 1, 1, 1,
2.001787, 0.5959198, 0.9254301, 1, 1, 1, 1, 1,
2.025399, 0.1388027, -0.000774217, 0, 0, 1, 1, 1,
2.071297, -0.3945341, -0.4690889, 1, 0, 0, 1, 1,
2.077637, 0.8583113, 1.840379, 1, 0, 0, 1, 1,
2.078446, 0.160494, 2.312471, 1, 0, 0, 1, 1,
2.082065, 0.04159361, 0.40031, 1, 0, 0, 1, 1,
2.110342, -0.3074405, 0.7903861, 1, 0, 0, 1, 1,
2.124177, 0.1508153, 1.117965, 0, 0, 0, 1, 1,
2.216029, -0.8914782, 2.848848, 0, 0, 0, 1, 1,
2.217036, 0.6927631, 2.94167, 0, 0, 0, 1, 1,
2.256112, 0.7202392, 1.492928, 0, 0, 0, 1, 1,
2.286403, 0.9353624, 1.316467, 0, 0, 0, 1, 1,
2.302236, -0.5816242, 1.38412, 0, 0, 0, 1, 1,
2.398469, -0.5642707, 0.9066328, 0, 0, 0, 1, 1,
2.410473, 0.9544964, 0.4428037, 1, 1, 1, 1, 1,
2.490267, 0.009955765, 1.455029, 1, 1, 1, 1, 1,
2.511983, 0.1022278, 3.052131, 1, 1, 1, 1, 1,
2.583401, 1.608281, 0.6858826, 1, 1, 1, 1, 1,
2.727014, -0.1883275, 1.163121, 1, 1, 1, 1, 1,
2.894763, 2.512995, 0.5992121, 1, 1, 1, 1, 1,
3.373156, 0.2009702, 1.162959, 1, 1, 1, 1, 1
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
var radius = 9.655955;
var distance = 33.91613;
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
mvMatrix.translate( -0.1503189, -0.09388375, -0.139575 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.91613);
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