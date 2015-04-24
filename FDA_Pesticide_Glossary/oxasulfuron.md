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
-3.201096, -0.04663903, -1.360884, 1, 0, 0, 1,
-3.077468, -0.5525588, -0.4095881, 1, 0.007843138, 0, 1,
-3.038843, 1.202124, -2.725673, 1, 0.01176471, 0, 1,
-2.95803, 1.314353, -1.276314, 1, 0.01960784, 0, 1,
-2.954395, 0.3044029, 0.4642189, 1, 0.02352941, 0, 1,
-2.917807, -1.813289, -2.178941, 1, 0.03137255, 0, 1,
-2.903787, 0.5792716, -2.612932, 1, 0.03529412, 0, 1,
-2.652632, 0.2481773, -1.223633, 1, 0.04313726, 0, 1,
-2.637898, 0.1978962, -2.218476, 1, 0.04705882, 0, 1,
-2.494144, 0.07196046, -0.7631436, 1, 0.05490196, 0, 1,
-2.467108, -1.228234, -1.45884, 1, 0.05882353, 0, 1,
-2.465762, -0.5340421, -1.331482, 1, 0.06666667, 0, 1,
-2.453752, 0.04024329, -2.203376, 1, 0.07058824, 0, 1,
-2.3524, -0.8066967, -0.9986332, 1, 0.07843138, 0, 1,
-2.328166, 1.409001, -1.869385, 1, 0.08235294, 0, 1,
-2.308504, -0.09560481, -1.554313, 1, 0.09019608, 0, 1,
-2.260668, -0.9425378, -2.308912, 1, 0.09411765, 0, 1,
-2.229829, 1.906067, -2.09827, 1, 0.1019608, 0, 1,
-2.170026, -1.13918, -2.232013, 1, 0.1098039, 0, 1,
-2.166142, 0.4309101, -2.580419, 1, 0.1137255, 0, 1,
-2.160668, -0.4417691, -1.564615, 1, 0.1215686, 0, 1,
-2.152773, -0.02491125, 0.4696788, 1, 0.1254902, 0, 1,
-2.125015, 1.441102, -1.174768, 1, 0.1333333, 0, 1,
-2.110803, 0.606591, 0.03876555, 1, 0.1372549, 0, 1,
-2.110267, 0.5443307, -2.194164, 1, 0.145098, 0, 1,
-2.084881, -2.211334, -1.250488, 1, 0.1490196, 0, 1,
-2.050972, 1.061181, -1.174688, 1, 0.1568628, 0, 1,
-2.039725, -1.327019, -3.221843, 1, 0.1607843, 0, 1,
-2.016337, 0.02991491, 1.390834, 1, 0.1686275, 0, 1,
-2.005591, 1.382842, -0.04470822, 1, 0.172549, 0, 1,
-1.951658, 0.3791505, 0.0419694, 1, 0.1803922, 0, 1,
-1.928222, 0.6418133, 0.903129, 1, 0.1843137, 0, 1,
-1.899674, 0.363308, -0.4221119, 1, 0.1921569, 0, 1,
-1.895108, 0.9061509, -1.037512, 1, 0.1960784, 0, 1,
-1.888485, -0.7945289, -2.619153, 1, 0.2039216, 0, 1,
-1.870983, 0.8869136, -1.300586, 1, 0.2117647, 0, 1,
-1.85802, 1.359576, -1.870806, 1, 0.2156863, 0, 1,
-1.805558, 0.7459134, -1.763578, 1, 0.2235294, 0, 1,
-1.785917, 0.1551131, -0.3437833, 1, 0.227451, 0, 1,
-1.769836, 2.303982, 1.545102, 1, 0.2352941, 0, 1,
-1.763469, 0.9762068, 0.1026159, 1, 0.2392157, 0, 1,
-1.756855, -0.8354792, -2.067663, 1, 0.2470588, 0, 1,
-1.744084, 0.3524556, -0.6040183, 1, 0.2509804, 0, 1,
-1.734758, 0.1651673, -0.3974892, 1, 0.2588235, 0, 1,
-1.733828, -0.4786028, -3.158519, 1, 0.2627451, 0, 1,
-1.719241, 1.021802, -1.421445, 1, 0.2705882, 0, 1,
-1.715079, 1.072219, -2.566248, 1, 0.2745098, 0, 1,
-1.713218, -0.07127848, -1.675902, 1, 0.282353, 0, 1,
-1.710127, 1.422496, -0.4052236, 1, 0.2862745, 0, 1,
-1.682198, -0.3558869, -1.318243, 1, 0.2941177, 0, 1,
-1.681834, -0.2744707, -1.977461, 1, 0.3019608, 0, 1,
-1.676916, 0.4485022, -2.189386, 1, 0.3058824, 0, 1,
-1.676576, 0.4995963, -1.31982, 1, 0.3137255, 0, 1,
-1.671607, -1.225164, -2.806417, 1, 0.3176471, 0, 1,
-1.669389, -0.4580891, -2.612972, 1, 0.3254902, 0, 1,
-1.650047, 0.1843782, -0.9466143, 1, 0.3294118, 0, 1,
-1.641286, 0.0697417, -2.473861, 1, 0.3372549, 0, 1,
-1.632956, -1.895394, -2.086306, 1, 0.3411765, 0, 1,
-1.632671, -0.02526368, -1.022768, 1, 0.3490196, 0, 1,
-1.628099, 0.8935025, -1.461351, 1, 0.3529412, 0, 1,
-1.622304, 0.392316, -0.598942, 1, 0.3607843, 0, 1,
-1.615884, -0.8948525, -2.262841, 1, 0.3647059, 0, 1,
-1.581427, -1.1947, -1.888955, 1, 0.372549, 0, 1,
-1.578468, 1.251333, 0.2960168, 1, 0.3764706, 0, 1,
-1.55892, -1.045814, -1.826098, 1, 0.3843137, 0, 1,
-1.558477, -0.07537068, -2.782753, 1, 0.3882353, 0, 1,
-1.542068, -0.6953043, -2.886076, 1, 0.3960784, 0, 1,
-1.536939, -0.01402473, -1.327814, 1, 0.4039216, 0, 1,
-1.516078, 0.4179857, 0.9016512, 1, 0.4078431, 0, 1,
-1.509999, 0.7996868, -1.879362, 1, 0.4156863, 0, 1,
-1.503772, -1.647485, -2.482595, 1, 0.4196078, 0, 1,
-1.498401, 0.4694881, -3.347792, 1, 0.427451, 0, 1,
-1.481973, -0.203181, -1.191502, 1, 0.4313726, 0, 1,
-1.476941, 0.7714296, -0.8547702, 1, 0.4392157, 0, 1,
-1.47064, -0.6827711, -3.116925, 1, 0.4431373, 0, 1,
-1.467616, -0.7296265, -1.66031, 1, 0.4509804, 0, 1,
-1.451111, 0.6530408, 0.1769538, 1, 0.454902, 0, 1,
-1.450751, 0.6664906, -1.052975, 1, 0.4627451, 0, 1,
-1.449973, 0.6873926, -1.1263, 1, 0.4666667, 0, 1,
-1.443903, 0.5706792, -0.1649608, 1, 0.4745098, 0, 1,
-1.443623, 0.1523835, -3.327392, 1, 0.4784314, 0, 1,
-1.441774, 1.139498, -1.143061, 1, 0.4862745, 0, 1,
-1.438939, -2.104885, -3.57703, 1, 0.4901961, 0, 1,
-1.434806, -0.5434017, -1.159875, 1, 0.4980392, 0, 1,
-1.426402, -0.4979764, -1.029622, 1, 0.5058824, 0, 1,
-1.411814, -1.047479, 0.1834628, 1, 0.509804, 0, 1,
-1.402891, 0.1176956, -1.345582, 1, 0.5176471, 0, 1,
-1.401838, -0.3195634, -2.809261, 1, 0.5215687, 0, 1,
-1.373644, 0.2559928, -1.328232, 1, 0.5294118, 0, 1,
-1.353477, 0.3310711, -3.366461, 1, 0.5333334, 0, 1,
-1.349633, -2.367461, -2.075923, 1, 0.5411765, 0, 1,
-1.347419, -0.03580807, -2.380221, 1, 0.5450981, 0, 1,
-1.326504, 0.8703368, -0.8517376, 1, 0.5529412, 0, 1,
-1.325829, 1.038269, 0.004913897, 1, 0.5568628, 0, 1,
-1.316734, -1.07152, -3.048051, 1, 0.5647059, 0, 1,
-1.310132, -0.3665567, -2.506958, 1, 0.5686275, 0, 1,
-1.307716, 0.6932086, -2.351049, 1, 0.5764706, 0, 1,
-1.307662, 0.3054703, -1.976919, 1, 0.5803922, 0, 1,
-1.304575, 2.045807, -1.754078, 1, 0.5882353, 0, 1,
-1.302214, 1.37755, -2.146387, 1, 0.5921569, 0, 1,
-1.298401, 1.851919, -1.062931, 1, 0.6, 0, 1,
-1.295722, -0.3814445, -4.161362, 1, 0.6078432, 0, 1,
-1.294531, 0.3672386, -2.656271, 1, 0.6117647, 0, 1,
-1.29317, -0.5755005, -1.123945, 1, 0.6196079, 0, 1,
-1.292992, -0.9438394, -1.889741, 1, 0.6235294, 0, 1,
-1.291116, 0.4949094, 1.510327, 1, 0.6313726, 0, 1,
-1.271939, -0.2033116, -1.471394, 1, 0.6352941, 0, 1,
-1.271495, 0.3010295, -0.4017376, 1, 0.6431373, 0, 1,
-1.26883, 0.7746718, -0.7929139, 1, 0.6470588, 0, 1,
-1.267251, 1.464384, -0.3423867, 1, 0.654902, 0, 1,
-1.264422, 0.8601971, -0.7952704, 1, 0.6588235, 0, 1,
-1.263367, 0.6937333, 0.2373051, 1, 0.6666667, 0, 1,
-1.255018, -0.1057578, -1.567436, 1, 0.6705883, 0, 1,
-1.254706, -0.2085158, -2.048851, 1, 0.6784314, 0, 1,
-1.254098, -1.0957, -1.293339, 1, 0.682353, 0, 1,
-1.246091, -0.1243044, -2.791553, 1, 0.6901961, 0, 1,
-1.241355, 0.2898606, -0.7879914, 1, 0.6941177, 0, 1,
-1.240962, -0.882246, -1.663311, 1, 0.7019608, 0, 1,
-1.236233, -2.324296, -3.473189, 1, 0.7098039, 0, 1,
-1.235749, 0.26107, 1.376534, 1, 0.7137255, 0, 1,
-1.22815, 0.9123408, -0.6829885, 1, 0.7215686, 0, 1,
-1.22729, 0.3735034, -1.589038, 1, 0.7254902, 0, 1,
-1.226578, -0.8930669, -1.586191, 1, 0.7333333, 0, 1,
-1.217217, 0.6671534, -1.083796, 1, 0.7372549, 0, 1,
-1.215595, -0.2391526, -1.918229, 1, 0.7450981, 0, 1,
-1.214548, -0.443942, -2.44443, 1, 0.7490196, 0, 1,
-1.211946, 0.1901814, -1.666365, 1, 0.7568628, 0, 1,
-1.210075, -1.294189, -2.572113, 1, 0.7607843, 0, 1,
-1.200437, -1.187601, -3.026127, 1, 0.7686275, 0, 1,
-1.199981, 0.308357, -2.80606, 1, 0.772549, 0, 1,
-1.195305, -1.009754, -2.985228, 1, 0.7803922, 0, 1,
-1.194567, -1.14977, -2.56452, 1, 0.7843137, 0, 1,
-1.194264, -1.111154, -1.93142, 1, 0.7921569, 0, 1,
-1.192214, -0.6532032, -0.4647037, 1, 0.7960784, 0, 1,
-1.180341, 0.004273704, -3.045119, 1, 0.8039216, 0, 1,
-1.178642, -0.4900361, -1.349666, 1, 0.8117647, 0, 1,
-1.167856, 0.1132355, -0.02454204, 1, 0.8156863, 0, 1,
-1.165403, 1.66432, -1.302664, 1, 0.8235294, 0, 1,
-1.158259, -0.8739055, -1.782945, 1, 0.827451, 0, 1,
-1.154401, -0.1392734, -2.769176, 1, 0.8352941, 0, 1,
-1.154343, -1.319508, -0.1816489, 1, 0.8392157, 0, 1,
-1.152509, -0.633041, -1.867724, 1, 0.8470588, 0, 1,
-1.146266, 0.3894385, -0.8133576, 1, 0.8509804, 0, 1,
-1.143357, -0.6984558, -1.784923, 1, 0.8588235, 0, 1,
-1.140232, -0.01267216, -1.508993, 1, 0.8627451, 0, 1,
-1.126946, -0.0807424, -1.183931, 1, 0.8705882, 0, 1,
-1.120514, 0.4414198, -1.354817, 1, 0.8745098, 0, 1,
-1.115683, -0.5867646, -2.165396, 1, 0.8823529, 0, 1,
-1.111868, -1.034142, -2.614712, 1, 0.8862745, 0, 1,
-1.108514, 0.4180075, -0.175842, 1, 0.8941177, 0, 1,
-1.101076, 0.4142964, -0.6978906, 1, 0.8980392, 0, 1,
-1.088364, -2.881225, -2.59143, 1, 0.9058824, 0, 1,
-1.088006, 0.6186232, -2.047136, 1, 0.9137255, 0, 1,
-1.087728, 0.863902, -2.15628, 1, 0.9176471, 0, 1,
-1.074641, -0.5899944, -2.815688, 1, 0.9254902, 0, 1,
-1.070814, 0.5352172, -0.2153176, 1, 0.9294118, 0, 1,
-1.070165, 1.344711, 0.5698211, 1, 0.9372549, 0, 1,
-1.067948, -0.6384962, -1.242036, 1, 0.9411765, 0, 1,
-1.067864, 0.924983, -2.223727, 1, 0.9490196, 0, 1,
-1.066278, 0.2068184, -1.72638, 1, 0.9529412, 0, 1,
-1.065447, -0.3546434, -1.33902, 1, 0.9607843, 0, 1,
-1.054466, -1.51225, -5.109214, 1, 0.9647059, 0, 1,
-1.053455, -1.235347, -1.911962, 1, 0.972549, 0, 1,
-1.044012, 0.3482228, -1.300585, 1, 0.9764706, 0, 1,
-1.041512, 0.5643507, -1.021355, 1, 0.9843137, 0, 1,
-1.035416, -0.8649426, -2.33408, 1, 0.9882353, 0, 1,
-1.031989, 0.2774167, -1.599292, 1, 0.9960784, 0, 1,
-1.031593, -0.1466907, -1.228254, 0.9960784, 1, 0, 1,
-1.029927, 1.480436, 1.794464, 0.9921569, 1, 0, 1,
-1.025161, 0.5013117, -2.184283, 0.9843137, 1, 0, 1,
-1.020894, 1.695492, -0.5917993, 0.9803922, 1, 0, 1,
-1.017769, 1.083077, 0.06166038, 0.972549, 1, 0, 1,
-1.016316, 0.8052012, 0.1453111, 0.9686275, 1, 0, 1,
-1.010766, -0.03586814, -1.108207, 0.9607843, 1, 0, 1,
-1.006095, -0.8457637, -0.9400198, 0.9568627, 1, 0, 1,
-1.001637, 1.092472, -2.101462, 0.9490196, 1, 0, 1,
-1.000661, -0.3667502, -1.947572, 0.945098, 1, 0, 1,
-0.9942788, -1.365094, -2.289146, 0.9372549, 1, 0, 1,
-0.9939491, -0.6903251, -0.01741002, 0.9333333, 1, 0, 1,
-0.9863914, 0.9754308, -2.914562, 0.9254902, 1, 0, 1,
-0.9819722, 2.18557, 0.7055194, 0.9215686, 1, 0, 1,
-0.9743283, -0.2211763, -1.927164, 0.9137255, 1, 0, 1,
-0.9646735, -0.3516995, -2.658433, 0.9098039, 1, 0, 1,
-0.962999, 0.2522482, -1.016802, 0.9019608, 1, 0, 1,
-0.9629533, -0.7516227, 0.0478985, 0.8941177, 1, 0, 1,
-0.9516168, 0.2974925, -2.283091, 0.8901961, 1, 0, 1,
-0.9479402, -0.8470126, -3.065262, 0.8823529, 1, 0, 1,
-0.9442991, 0.1732397, -2.271518, 0.8784314, 1, 0, 1,
-0.9411638, 0.3911441, -2.157727, 0.8705882, 1, 0, 1,
-0.9408194, 0.3332481, -0.9926628, 0.8666667, 1, 0, 1,
-0.9395107, 0.5183948, -0.1334381, 0.8588235, 1, 0, 1,
-0.9339625, 0.8342638, 0.05853593, 0.854902, 1, 0, 1,
-0.9330251, 0.4508807, 0.01573882, 0.8470588, 1, 0, 1,
-0.9189818, -0.1712461, -2.584975, 0.8431373, 1, 0, 1,
-0.9183, 0.8558318, 0.2528355, 0.8352941, 1, 0, 1,
-0.9155677, -1.013855, -2.821033, 0.8313726, 1, 0, 1,
-0.9149984, 0.7742646, 0.6087219, 0.8235294, 1, 0, 1,
-0.9132772, 0.3232756, -1.972233, 0.8196079, 1, 0, 1,
-0.909692, 0.3101267, -0.9350058, 0.8117647, 1, 0, 1,
-0.9018906, 0.7498366, 0.7190661, 0.8078431, 1, 0, 1,
-0.8960339, -0.9472491, -2.709777, 0.8, 1, 0, 1,
-0.8937574, -0.2675453, -2.544327, 0.7921569, 1, 0, 1,
-0.8932888, 0.167154, -0.680933, 0.7882353, 1, 0, 1,
-0.890675, 0.1000852, -1.507012, 0.7803922, 1, 0, 1,
-0.8881476, 1.313436, -0.9730648, 0.7764706, 1, 0, 1,
-0.8848606, -0.5623865, -2.876326, 0.7686275, 1, 0, 1,
-0.8848242, 0.2927252, -2.445895, 0.7647059, 1, 0, 1,
-0.8816157, -1.826777, -3.846363, 0.7568628, 1, 0, 1,
-0.8731792, 0.2550803, 0.3331129, 0.7529412, 1, 0, 1,
-0.8718341, -0.511465, -1.976431, 0.7450981, 1, 0, 1,
-0.8704936, 0.7241849, -1.200294, 0.7411765, 1, 0, 1,
-0.8680278, 0.8208773, -1.131537, 0.7333333, 1, 0, 1,
-0.8675731, -0.6759422, -3.182398, 0.7294118, 1, 0, 1,
-0.8670727, -0.01069484, -1.368633, 0.7215686, 1, 0, 1,
-0.863851, 0.8453753, -2.058998, 0.7176471, 1, 0, 1,
-0.8625526, 0.3270834, -1.532225, 0.7098039, 1, 0, 1,
-0.8601237, -0.1083772, -0.4247549, 0.7058824, 1, 0, 1,
-0.8573846, -1.321631, -3.109599, 0.6980392, 1, 0, 1,
-0.8551462, -0.3723685, -1.04151, 0.6901961, 1, 0, 1,
-0.8538885, -1.047669, -0.6763679, 0.6862745, 1, 0, 1,
-0.8529968, 0.8971943, -0.6904762, 0.6784314, 1, 0, 1,
-0.8513451, -0.2130749, -2.316604, 0.6745098, 1, 0, 1,
-0.8385289, 0.1255925, -1.940193, 0.6666667, 1, 0, 1,
-0.8373435, -1.177893, -1.722276, 0.6627451, 1, 0, 1,
-0.8327254, 1.413829, -0.8184592, 0.654902, 1, 0, 1,
-0.8301449, 0.7528331, -1.944142, 0.6509804, 1, 0, 1,
-0.8263692, 0.1601115, -1.841233, 0.6431373, 1, 0, 1,
-0.8262875, -0.8589831, -1.262193, 0.6392157, 1, 0, 1,
-0.8161265, 0.8978787, -0.9686888, 0.6313726, 1, 0, 1,
-0.8158235, -0.09597753, -3.318828, 0.627451, 1, 0, 1,
-0.8143235, 2.827587, -0.8644676, 0.6196079, 1, 0, 1,
-0.813763, 0.7703753, -1.98034, 0.6156863, 1, 0, 1,
-0.8102793, -0.1797233, -2.311821, 0.6078432, 1, 0, 1,
-0.808845, -0.3445415, -2.214676, 0.6039216, 1, 0, 1,
-0.8082697, -0.004364415, -2.206919, 0.5960785, 1, 0, 1,
-0.8036742, -1.343887, -2.334483, 0.5882353, 1, 0, 1,
-0.8033416, 0.6003499, -4.052097, 0.5843138, 1, 0, 1,
-0.7900066, -0.9734813, -0.5011754, 0.5764706, 1, 0, 1,
-0.7862884, 1.357645, 1.321646, 0.572549, 1, 0, 1,
-0.7858979, -0.8352157, -1.373526, 0.5647059, 1, 0, 1,
-0.7764555, -0.821896, -3.645272, 0.5607843, 1, 0, 1,
-0.7755591, 0.9418442, -1.696711, 0.5529412, 1, 0, 1,
-0.7714838, 0.06887025, -0.1760959, 0.5490196, 1, 0, 1,
-0.770835, -0.3515653, -1.543644, 0.5411765, 1, 0, 1,
-0.7701086, 1.546319, -2.278073, 0.5372549, 1, 0, 1,
-0.7692276, 1.774641, 1.345284, 0.5294118, 1, 0, 1,
-0.7596517, 0.5942092, -1.253402, 0.5254902, 1, 0, 1,
-0.7556801, 0.7532608, -0.8482882, 0.5176471, 1, 0, 1,
-0.7517319, -0.8521851, -1.866106, 0.5137255, 1, 0, 1,
-0.7500113, 0.8522693, -1.6905, 0.5058824, 1, 0, 1,
-0.7495811, -0.9759835, -1.965675, 0.5019608, 1, 0, 1,
-0.744509, -0.02902482, -0.9761357, 0.4941176, 1, 0, 1,
-0.7391992, 0.8478215, 1.152676, 0.4862745, 1, 0, 1,
-0.7376963, -0.1383344, -1.336953, 0.4823529, 1, 0, 1,
-0.7343575, 0.6846561, -0.2334609, 0.4745098, 1, 0, 1,
-0.728244, 0.84702, -1.302249, 0.4705882, 1, 0, 1,
-0.7280139, 0.5865425, -1.367956, 0.4627451, 1, 0, 1,
-0.7258629, 0.0315797, -1.275291, 0.4588235, 1, 0, 1,
-0.7252534, 1.960151, -0.5278469, 0.4509804, 1, 0, 1,
-0.7246546, -0.5111127, -1.307725, 0.4470588, 1, 0, 1,
-0.7223662, -0.5084406, -2.542863, 0.4392157, 1, 0, 1,
-0.7216985, 0.9630243, 0.02201251, 0.4352941, 1, 0, 1,
-0.7119068, -0.2907408, -2.040833, 0.427451, 1, 0, 1,
-0.7061673, -0.5511885, -0.2889327, 0.4235294, 1, 0, 1,
-0.7038018, 1.690794, -0.2388264, 0.4156863, 1, 0, 1,
-0.7035984, 1.025235, -0.2849557, 0.4117647, 1, 0, 1,
-0.703558, -0.5586162, -1.683053, 0.4039216, 1, 0, 1,
-0.7022733, 0.7798827, -1.001876, 0.3960784, 1, 0, 1,
-0.7022497, -1.005889, -2.814166, 0.3921569, 1, 0, 1,
-0.7003559, 0.09876561, -2.914912, 0.3843137, 1, 0, 1,
-0.6965341, 0.685324, -0.7217956, 0.3803922, 1, 0, 1,
-0.6959341, -0.009825844, -0.6821186, 0.372549, 1, 0, 1,
-0.6811946, 1.7228, -1.969105, 0.3686275, 1, 0, 1,
-0.6777061, 0.8830999, -0.2977587, 0.3607843, 1, 0, 1,
-0.6684909, -0.2845169, -2.23127, 0.3568628, 1, 0, 1,
-0.6551849, 1.062651, -0.8266212, 0.3490196, 1, 0, 1,
-0.6548862, 0.0322032, -2.929558, 0.345098, 1, 0, 1,
-0.6548238, 0.7481012, -2.192106, 0.3372549, 1, 0, 1,
-0.6538581, 0.7063872, -1.145799, 0.3333333, 1, 0, 1,
-0.6511647, -1.514037, -1.996751, 0.3254902, 1, 0, 1,
-0.646307, -1.918072, -1.523833, 0.3215686, 1, 0, 1,
-0.6402987, -0.2746927, -1.553117, 0.3137255, 1, 0, 1,
-0.6377171, -0.153387, -2.719402, 0.3098039, 1, 0, 1,
-0.6310722, -1.094856, -1.301391, 0.3019608, 1, 0, 1,
-0.626351, -1.041067, -3.43841, 0.2941177, 1, 0, 1,
-0.6260075, 0.06322806, -1.346397, 0.2901961, 1, 0, 1,
-0.6213211, 1.086574, -0.5561945, 0.282353, 1, 0, 1,
-0.617393, -0.3396087, -3.544161, 0.2784314, 1, 0, 1,
-0.6147586, -0.6906404, -3.629014, 0.2705882, 1, 0, 1,
-0.6146935, -0.5948626, -1.461518, 0.2666667, 1, 0, 1,
-0.612819, -1.132612, -3.343118, 0.2588235, 1, 0, 1,
-0.6124932, -0.3296537, -2.902674, 0.254902, 1, 0, 1,
-0.6071372, 1.47515, 1.926906, 0.2470588, 1, 0, 1,
-0.6043596, 0.9616326, -0.6193459, 0.2431373, 1, 0, 1,
-0.6036255, 0.7446308, -0.6298556, 0.2352941, 1, 0, 1,
-0.6031615, -1.016817, -3.298129, 0.2313726, 1, 0, 1,
-0.5998326, 2.28941, 0.9958286, 0.2235294, 1, 0, 1,
-0.5990642, -1.740514, -3.611744, 0.2196078, 1, 0, 1,
-0.5970327, 0.8457305, -1.210517, 0.2117647, 1, 0, 1,
-0.5944576, -0.003915333, -1.377689, 0.2078431, 1, 0, 1,
-0.5853371, -0.02955985, -1.394729, 0.2, 1, 0, 1,
-0.5816949, 0.20327, -2.000964, 0.1921569, 1, 0, 1,
-0.5800126, -0.8280331, -3.500391, 0.1882353, 1, 0, 1,
-0.5708115, 1.666066, 0.6097504, 0.1803922, 1, 0, 1,
-0.5681226, 0.6429893, -1.287192, 0.1764706, 1, 0, 1,
-0.5675917, -0.06552912, -2.775748, 0.1686275, 1, 0, 1,
-0.5634585, 1.068762, -0.7547163, 0.1647059, 1, 0, 1,
-0.5562536, 0.02749003, -1.835672, 0.1568628, 1, 0, 1,
-0.5555769, 0.003128716, -1.133947, 0.1529412, 1, 0, 1,
-0.5553629, -0.753329, -0.1442247, 0.145098, 1, 0, 1,
-0.5541969, -0.7242873, -2.748284, 0.1411765, 1, 0, 1,
-0.5533512, 1.180686, -1.73218, 0.1333333, 1, 0, 1,
-0.5529125, 1.012815, -1.779484, 0.1294118, 1, 0, 1,
-0.548822, -1.199846, -2.965833, 0.1215686, 1, 0, 1,
-0.548523, -1.304536, -1.35725, 0.1176471, 1, 0, 1,
-0.5436594, 1.034276, -2.379726, 0.1098039, 1, 0, 1,
-0.5384301, 0.3976074, 0.7970316, 0.1058824, 1, 0, 1,
-0.5295148, -0.2874705, -3.621788, 0.09803922, 1, 0, 1,
-0.5289367, 1.419002, -1.369094, 0.09019608, 1, 0, 1,
-0.5288802, -0.09308635, -2.304443, 0.08627451, 1, 0, 1,
-0.5278432, -1.949892, -2.262012, 0.07843138, 1, 0, 1,
-0.5269602, 1.078585, 0.7239846, 0.07450981, 1, 0, 1,
-0.5262658, 1.111401, -0.4253089, 0.06666667, 1, 0, 1,
-0.5242067, -0.06221384, -1.513898, 0.0627451, 1, 0, 1,
-0.5213149, 0.976509, 0.5465005, 0.05490196, 1, 0, 1,
-0.5201948, 0.5826694, -1.261089, 0.05098039, 1, 0, 1,
-0.5195029, -0.8891424, -2.660447, 0.04313726, 1, 0, 1,
-0.517427, -0.01312061, -1.630805, 0.03921569, 1, 0, 1,
-0.516508, -1.680372, -3.311367, 0.03137255, 1, 0, 1,
-0.5129906, -1.325065, -3.535136, 0.02745098, 1, 0, 1,
-0.5097473, -0.6428231, -3.688641, 0.01960784, 1, 0, 1,
-0.5082207, 1.292987, 1.470666, 0.01568628, 1, 0, 1,
-0.5002427, -0.7682247, -3.281346, 0.007843138, 1, 0, 1,
-0.4985406, -0.2823557, -0.6590332, 0.003921569, 1, 0, 1,
-0.4979461, 0.3551385, -0.174038, 0, 1, 0.003921569, 1,
-0.4953537, 1.24106, -2.79912, 0, 1, 0.01176471, 1,
-0.4948451, 0.3193478, 0.9624391, 0, 1, 0.01568628, 1,
-0.4947626, 1.443081, 0.6483369, 0, 1, 0.02352941, 1,
-0.4937425, -0.6710923, -1.622668, 0, 1, 0.02745098, 1,
-0.4934719, 0.6038357, 0.8098263, 0, 1, 0.03529412, 1,
-0.4915751, -0.9986442, -2.624443, 0, 1, 0.03921569, 1,
-0.4909539, 0.4025502, -1.813788, 0, 1, 0.04705882, 1,
-0.487271, 0.7175512, -1.686383, 0, 1, 0.05098039, 1,
-0.4855794, -0.760374, -3.009823, 0, 1, 0.05882353, 1,
-0.4797534, -1.580974, -1.880655, 0, 1, 0.0627451, 1,
-0.4758443, -0.7413073, -2.107077, 0, 1, 0.07058824, 1,
-0.4748917, 0.5644286, 0.8072746, 0, 1, 0.07450981, 1,
-0.4726892, -1.188689, -3.301824, 0, 1, 0.08235294, 1,
-0.4642348, 2.314084, -0.3054997, 0, 1, 0.08627451, 1,
-0.459166, -0.7837333, -1.964775, 0, 1, 0.09411765, 1,
-0.4582555, 0.008307779, -0.3371746, 0, 1, 0.1019608, 1,
-0.4567806, 0.2349994, -0.2880818, 0, 1, 0.1058824, 1,
-0.4563672, 1.620323, -1.212949, 0, 1, 0.1137255, 1,
-0.4506133, 0.978726, -1.077561, 0, 1, 0.1176471, 1,
-0.4478634, 0.6278922, -0.966463, 0, 1, 0.1254902, 1,
-0.4453699, 0.3196284, -0.4680491, 0, 1, 0.1294118, 1,
-0.4440838, -1.256656, -2.183566, 0, 1, 0.1372549, 1,
-0.4374492, 0.6854705, -0.2990262, 0, 1, 0.1411765, 1,
-0.4370796, 1.319579, 0.3880698, 0, 1, 0.1490196, 1,
-0.4368099, 0.1475893, -2.329586, 0, 1, 0.1529412, 1,
-0.4329358, -0.5999613, -4.116132, 0, 1, 0.1607843, 1,
-0.4328668, 0.03545427, 0.154752, 0, 1, 0.1647059, 1,
-0.430486, 0.6669297, -2.100307, 0, 1, 0.172549, 1,
-0.4288296, -1.375961, -2.632708, 0, 1, 0.1764706, 1,
-0.4165785, 0.3040163, -0.8404722, 0, 1, 0.1843137, 1,
-0.4161484, -3.327388, -2.603726, 0, 1, 0.1882353, 1,
-0.4125127, -0.7183991, -2.537403, 0, 1, 0.1960784, 1,
-0.4120279, -0.07509814, -2.133785, 0, 1, 0.2039216, 1,
-0.4120247, 0.3339389, -1.581929, 0, 1, 0.2078431, 1,
-0.4082701, -0.4164065, -0.7222037, 0, 1, 0.2156863, 1,
-0.4067819, -0.5609502, -3.74408, 0, 1, 0.2196078, 1,
-0.4051787, -0.4238763, -1.600831, 0, 1, 0.227451, 1,
-0.3968662, -0.2028784, -1.955965, 0, 1, 0.2313726, 1,
-0.3930182, 0.3818666, 0.2319085, 0, 1, 0.2392157, 1,
-0.3874631, -0.3387398, -2.111735, 0, 1, 0.2431373, 1,
-0.3734295, -0.3481604, -2.132045, 0, 1, 0.2509804, 1,
-0.3730725, 0.742924, 0.1999221, 0, 1, 0.254902, 1,
-0.3650325, -0.1798853, -1.25769, 0, 1, 0.2627451, 1,
-0.3591274, -0.8631392, -2.034648, 0, 1, 0.2666667, 1,
-0.3576698, -3.189676, -2.385544, 0, 1, 0.2745098, 1,
-0.3562308, -0.08578859, -2.536679, 0, 1, 0.2784314, 1,
-0.3551523, -1.007505, -1.673884, 0, 1, 0.2862745, 1,
-0.3538656, 1.312849, -0.243325, 0, 1, 0.2901961, 1,
-0.3501265, -1.24796, -3.32936, 0, 1, 0.2980392, 1,
-0.3441975, 1.402413, -0.2266491, 0, 1, 0.3058824, 1,
-0.3375217, -1.148858, -2.620366, 0, 1, 0.3098039, 1,
-0.3312948, -1.593626, -2.531105, 0, 1, 0.3176471, 1,
-0.331024, 0.439364, -0.1860974, 0, 1, 0.3215686, 1,
-0.3279393, -0.3768996, -1.976658, 0, 1, 0.3294118, 1,
-0.3272981, 1.964797, 1.114718, 0, 1, 0.3333333, 1,
-0.3193453, 1.392671, -0.3725169, 0, 1, 0.3411765, 1,
-0.3146923, -2.099907, -3.685118, 0, 1, 0.345098, 1,
-0.3146901, 0.3482992, 0.1819318, 0, 1, 0.3529412, 1,
-0.311126, -1.059995, -2.797132, 0, 1, 0.3568628, 1,
-0.3092281, 0.4368099, -0.2108236, 0, 1, 0.3647059, 1,
-0.3072054, -0.4121792, -0.907268, 0, 1, 0.3686275, 1,
-0.3057469, 0.4015361, -1.347614, 0, 1, 0.3764706, 1,
-0.3036542, -0.6551681, -1.616027, 0, 1, 0.3803922, 1,
-0.3032571, 1.30676, 0.5276688, 0, 1, 0.3882353, 1,
-0.3011258, 0.6849653, 0.4483136, 0, 1, 0.3921569, 1,
-0.2978513, 0.5797897, 0.2317486, 0, 1, 0.4, 1,
-0.2976152, -1.170976, -3.011583, 0, 1, 0.4078431, 1,
-0.2969249, -1.960279, -2.944138, 0, 1, 0.4117647, 1,
-0.2960784, -0.2186189, -3.968048, 0, 1, 0.4196078, 1,
-0.2947086, -1.9649, -2.77031, 0, 1, 0.4235294, 1,
-0.285723, -0.8275183, -3.967371, 0, 1, 0.4313726, 1,
-0.2852694, -1.129778, -2.82863, 0, 1, 0.4352941, 1,
-0.2837529, -1.722224, -3.584082, 0, 1, 0.4431373, 1,
-0.2828265, 0.1985682, -2.002408, 0, 1, 0.4470588, 1,
-0.277614, 0.661433, -0.1602212, 0, 1, 0.454902, 1,
-0.275622, -0.3391309, -3.011513, 0, 1, 0.4588235, 1,
-0.2682956, 0.08029983, -2.142063, 0, 1, 0.4666667, 1,
-0.2602805, -0.2447535, -3.286269, 0, 1, 0.4705882, 1,
-0.2549091, -1.313947, -2.496801, 0, 1, 0.4784314, 1,
-0.2478867, -1.91704, -3.477504, 0, 1, 0.4823529, 1,
-0.2457725, 0.5478196, -0.9018931, 0, 1, 0.4901961, 1,
-0.241078, -0.7137809, -3.312447, 0, 1, 0.4941176, 1,
-0.2374649, -0.180873, -1.474862, 0, 1, 0.5019608, 1,
-0.2348246, 0.04084394, -1.074958, 0, 1, 0.509804, 1,
-0.2346598, 0.8867249, -1.24086, 0, 1, 0.5137255, 1,
-0.2338527, 1.010252, -1.294392, 0, 1, 0.5215687, 1,
-0.2241919, -1.488018, -3.911304, 0, 1, 0.5254902, 1,
-0.2239454, -0.5903243, -3.606137, 0, 1, 0.5333334, 1,
-0.2223711, 0.891, 0.1819497, 0, 1, 0.5372549, 1,
-0.2204614, 0.6233076, 0.07529228, 0, 1, 0.5450981, 1,
-0.2192508, 0.2835256, -0.6298179, 0, 1, 0.5490196, 1,
-0.2179125, -2.720043, -2.729705, 0, 1, 0.5568628, 1,
-0.2117602, -0.4450752, -3.829009, 0, 1, 0.5607843, 1,
-0.2027326, -1.656302, -3.31184, 0, 1, 0.5686275, 1,
-0.2021063, 0.7427742, -2.248775, 0, 1, 0.572549, 1,
-0.201808, -0.6955419, -3.832669, 0, 1, 0.5803922, 1,
-0.1962896, -0.9373558, -4.442003, 0, 1, 0.5843138, 1,
-0.1956796, -0.460353, -2.473423, 0, 1, 0.5921569, 1,
-0.1889214, 0.1263936, -0.4834275, 0, 1, 0.5960785, 1,
-0.1874965, 0.02883049, -1.487629, 0, 1, 0.6039216, 1,
-0.1843741, -0.9421296, -3.701663, 0, 1, 0.6117647, 1,
-0.1829617, 0.1261268, -1.616539, 0, 1, 0.6156863, 1,
-0.1759861, 0.9830465, 0.130702, 0, 1, 0.6235294, 1,
-0.1749438, 0.07665797, -1.828221, 0, 1, 0.627451, 1,
-0.1686649, -0.2155577, -4.527751, 0, 1, 0.6352941, 1,
-0.1682395, 0.370424, 0.4905596, 0, 1, 0.6392157, 1,
-0.1675091, -0.02919097, -2.102592, 0, 1, 0.6470588, 1,
-0.1673834, -0.7370661, -3.80845, 0, 1, 0.6509804, 1,
-0.1614475, -0.1760497, -1.138474, 0, 1, 0.6588235, 1,
-0.156753, -0.923543, -2.975136, 0, 1, 0.6627451, 1,
-0.1468065, -0.2337299, -4.412453, 0, 1, 0.6705883, 1,
-0.1405865, -1.55638, -3.669057, 0, 1, 0.6745098, 1,
-0.1373541, 0.5002797, 0.9700797, 0, 1, 0.682353, 1,
-0.1335858, 0.1257027, -1.326327, 0, 1, 0.6862745, 1,
-0.1327887, 0.2057451, -1.517398, 0, 1, 0.6941177, 1,
-0.1319183, 0.2484109, -1.349158, 0, 1, 0.7019608, 1,
-0.1259985, 0.6042246, -1.301218, 0, 1, 0.7058824, 1,
-0.1245905, 0.1661673, -0.01237133, 0, 1, 0.7137255, 1,
-0.1241942, 0.6105638, -0.4390842, 0, 1, 0.7176471, 1,
-0.1228869, 0.4380993, -0.7237542, 0, 1, 0.7254902, 1,
-0.1191745, -0.05617446, -1.748308, 0, 1, 0.7294118, 1,
-0.1148923, 2.138988, -0.3227457, 0, 1, 0.7372549, 1,
-0.1102147, 0.9342247, 0.1842063, 0, 1, 0.7411765, 1,
-0.1082049, 0.1332245, -0.2357999, 0, 1, 0.7490196, 1,
-0.1062622, -0.06599776, -1.882121, 0, 1, 0.7529412, 1,
-0.1037844, -0.5671549, -3.650167, 0, 1, 0.7607843, 1,
-0.0993259, -2.055131, -3.621511, 0, 1, 0.7647059, 1,
-0.0990788, 0.3363979, -0.2964836, 0, 1, 0.772549, 1,
-0.09854019, 1.646356, 0.4102859, 0, 1, 0.7764706, 1,
-0.09654441, 0.3631071, -0.2289383, 0, 1, 0.7843137, 1,
-0.09544932, -0.8672744, -3.848628, 0, 1, 0.7882353, 1,
-0.09371851, -0.6373153, -3.772188, 0, 1, 0.7960784, 1,
-0.0895631, -0.4894257, -1.755118, 0, 1, 0.8039216, 1,
-0.08950341, -0.3961027, -4.138216, 0, 1, 0.8078431, 1,
-0.07785994, 0.3647097, -0.487853, 0, 1, 0.8156863, 1,
-0.07583424, 1.251226, -0.2079345, 0, 1, 0.8196079, 1,
-0.07487937, -0.1723347, -1.156942, 0, 1, 0.827451, 1,
-0.06492341, -0.1891569, -1.585755, 0, 1, 0.8313726, 1,
-0.06414735, -0.5664504, -1.598341, 0, 1, 0.8392157, 1,
-0.05798914, 2.301152, -0.6476232, 0, 1, 0.8431373, 1,
-0.05440228, 0.711699, -1.170363, 0, 1, 0.8509804, 1,
-0.05362292, -0.6509193, -1.867244, 0, 1, 0.854902, 1,
-0.05343901, -0.501811, -5.755868, 0, 1, 0.8627451, 1,
-0.05058352, -1.883808, -1.950563, 0, 1, 0.8666667, 1,
-0.0495691, -0.460086, -3.364252, 0, 1, 0.8745098, 1,
-0.04673117, -0.7790588, -4.021026, 0, 1, 0.8784314, 1,
-0.04566202, -1.357769, -3.992728, 0, 1, 0.8862745, 1,
-0.04445426, 0.03548482, -1.773764, 0, 1, 0.8901961, 1,
-0.0422338, -0.2104008, -2.60097, 0, 1, 0.8980392, 1,
-0.03882779, 0.5202401, 0.4306282, 0, 1, 0.9058824, 1,
-0.03771766, -0.4498614, -2.22948, 0, 1, 0.9098039, 1,
-0.03526238, -0.4415923, -1.897754, 0, 1, 0.9176471, 1,
-0.03524832, 0.4979827, -1.56204, 0, 1, 0.9215686, 1,
-0.03464151, -0.8289769, -0.7883037, 0, 1, 0.9294118, 1,
-0.03291414, 0.8336235, 1.150303, 0, 1, 0.9333333, 1,
-0.03286323, 1.074718, 0.1056864, 0, 1, 0.9411765, 1,
-0.02962223, 0.0768702, -0.6833748, 0, 1, 0.945098, 1,
-0.02788609, -0.9320853, -3.696238, 0, 1, 0.9529412, 1,
-0.02236595, -0.549952, -1.776517, 0, 1, 0.9568627, 1,
-0.01978105, 0.2017896, 1.187492, 0, 1, 0.9647059, 1,
-0.0185703, -1.223499, -4.637704, 0, 1, 0.9686275, 1,
-0.01440032, 0.03911345, 0.362949, 0, 1, 0.9764706, 1,
-0.01153505, 0.9015553, 0.5199879, 0, 1, 0.9803922, 1,
-0.01113399, 1.233043, 0.6010672, 0, 1, 0.9882353, 1,
-0.00716287, 0.2178081, -0.5344207, 0, 1, 0.9921569, 1,
-0.006664296, -1.909927, -2.550171, 0, 1, 1, 1,
-0.0002996573, 0.2618954, -1.226365, 0, 0.9921569, 1, 1,
0.006304911, -0.08625685, 2.375373, 0, 0.9882353, 1, 1,
0.01146602, -0.9212784, 3.182002, 0, 0.9803922, 1, 1,
0.01246115, -1.413621, 5.28918, 0, 0.9764706, 1, 1,
0.01590184, 0.9184957, -0.4934309, 0, 0.9686275, 1, 1,
0.01941125, 0.2051224, -0.2834944, 0, 0.9647059, 1, 1,
0.02827542, 1.135284, 1.256793, 0, 0.9568627, 1, 1,
0.02835481, 0.3651138, -0.4161156, 0, 0.9529412, 1, 1,
0.03162976, 0.5235393, 0.2580471, 0, 0.945098, 1, 1,
0.03458642, 0.5032393, -0.7720429, 0, 0.9411765, 1, 1,
0.03462751, -0.4306761, 3.611146, 0, 0.9333333, 1, 1,
0.03504947, 0.4025062, 0.07696339, 0, 0.9294118, 1, 1,
0.03545909, -1.162633, 3.104951, 0, 0.9215686, 1, 1,
0.03574352, -0.1229999, 2.184819, 0, 0.9176471, 1, 1,
0.03576913, 0.1139738, -0.8819531, 0, 0.9098039, 1, 1,
0.03754719, -0.6790048, 3.090352, 0, 0.9058824, 1, 1,
0.0389743, -0.6684013, 3.845468, 0, 0.8980392, 1, 1,
0.0396786, 0.6160021, 0.6070762, 0, 0.8901961, 1, 1,
0.04023349, -0.2389, 3.881487, 0, 0.8862745, 1, 1,
0.04758302, -0.3666687, 3.039057, 0, 0.8784314, 1, 1,
0.05014959, -0.02963891, 2.406179, 0, 0.8745098, 1, 1,
0.0540772, -1.393768, 3.296163, 0, 0.8666667, 1, 1,
0.05620749, -1.289046, 3.945988, 0, 0.8627451, 1, 1,
0.05886915, 1.424717, -0.3536224, 0, 0.854902, 1, 1,
0.06147246, -0.6658162, 4.974556, 0, 0.8509804, 1, 1,
0.06454658, 0.173983, -0.07741832, 0, 0.8431373, 1, 1,
0.06853843, 0.06401768, -1.042297, 0, 0.8392157, 1, 1,
0.07434999, 1.406234, -1.106845, 0, 0.8313726, 1, 1,
0.07530587, -0.7687717, 3.74073, 0, 0.827451, 1, 1,
0.07644554, -0.8664113, 1.137329, 0, 0.8196079, 1, 1,
0.07675908, -0.3250998, 3.121158, 0, 0.8156863, 1, 1,
0.07688517, 1.188299, 0.4559327, 0, 0.8078431, 1, 1,
0.07748715, -1.099604, 3.970268, 0, 0.8039216, 1, 1,
0.08237942, 1.237564, 0.6328183, 0, 0.7960784, 1, 1,
0.08247499, -0.8406501, 3.671423, 0, 0.7882353, 1, 1,
0.0824986, 2.644348, -1.329864, 0, 0.7843137, 1, 1,
0.08775322, 2.103745, -0.4837253, 0, 0.7764706, 1, 1,
0.09349546, -0.984255, 3.306167, 0, 0.772549, 1, 1,
0.0944005, -0.03208453, 1.179395, 0, 0.7647059, 1, 1,
0.09452838, -0.7696055, 2.436541, 0, 0.7607843, 1, 1,
0.09572946, -0.02141046, 0.8961941, 0, 0.7529412, 1, 1,
0.09609454, 0.09350418, -0.2108564, 0, 0.7490196, 1, 1,
0.1024066, -2.376037, 4.703346, 0, 0.7411765, 1, 1,
0.1031222, 0.3523079, 1.843018, 0, 0.7372549, 1, 1,
0.1050316, 0.8919274, -0.808821, 0, 0.7294118, 1, 1,
0.1058892, -1.767347, 3.782965, 0, 0.7254902, 1, 1,
0.1082749, 0.5462244, 0.7817677, 0, 0.7176471, 1, 1,
0.112218, 0.4512918, 1.552628, 0, 0.7137255, 1, 1,
0.1138729, 0.7763112, -0.3506874, 0, 0.7058824, 1, 1,
0.1143491, 1.023639, 0.6059545, 0, 0.6980392, 1, 1,
0.1143696, 0.9523856, 1.127825, 0, 0.6941177, 1, 1,
0.1153618, -0.05935695, 1.908003, 0, 0.6862745, 1, 1,
0.1224555, -1.476789, 3.649734, 0, 0.682353, 1, 1,
0.1274936, -1.225791, 3.283658, 0, 0.6745098, 1, 1,
0.1280852, 0.527497, 0.5072419, 0, 0.6705883, 1, 1,
0.1286083, -0.3833702, 2.458388, 0, 0.6627451, 1, 1,
0.1310661, 1.049322, 0.07801861, 0, 0.6588235, 1, 1,
0.1320051, -0.1337045, 3.834362, 0, 0.6509804, 1, 1,
0.1396742, 0.7491234, -0.7101293, 0, 0.6470588, 1, 1,
0.1452236, 1.177795, -1.033636, 0, 0.6392157, 1, 1,
0.147157, 0.1054215, 0.3949864, 0, 0.6352941, 1, 1,
0.1488577, 1.462216, 0.3088112, 0, 0.627451, 1, 1,
0.1498942, 0.1440424, 1.982009, 0, 0.6235294, 1, 1,
0.1501103, 0.9585009, 0.7219202, 0, 0.6156863, 1, 1,
0.1501675, 0.7021661, 0.6449596, 0, 0.6117647, 1, 1,
0.1528818, 0.6838254, 0.2517884, 0, 0.6039216, 1, 1,
0.1543906, 1.095416, -0.3467052, 0, 0.5960785, 1, 1,
0.1553108, 1.110076, 0.9797949, 0, 0.5921569, 1, 1,
0.1560621, -0.8508634, 2.705968, 0, 0.5843138, 1, 1,
0.1581829, 1.063291, 1.753132, 0, 0.5803922, 1, 1,
0.1637597, -0.6621959, 1.522931, 0, 0.572549, 1, 1,
0.1689867, -0.5706648, 1.287891, 0, 0.5686275, 1, 1,
0.1695188, -0.5798888, 4.317774, 0, 0.5607843, 1, 1,
0.172823, -1.169869, 2.032608, 0, 0.5568628, 1, 1,
0.1747224, -1.255142, 3.641542, 0, 0.5490196, 1, 1,
0.1829011, -1.45298, 3.22051, 0, 0.5450981, 1, 1,
0.1871822, 2.399329, 0.04911472, 0, 0.5372549, 1, 1,
0.1892392, 1.745036, 0.2423912, 0, 0.5333334, 1, 1,
0.1922284, 0.01671552, 1.33263, 0, 0.5254902, 1, 1,
0.1995027, -0.505859, 2.707764, 0, 0.5215687, 1, 1,
0.1996725, 0.1666882, 0.9939932, 0, 0.5137255, 1, 1,
0.2063212, 0.8260994, 0.2802133, 0, 0.509804, 1, 1,
0.2087167, -0.6930963, 2.590608, 0, 0.5019608, 1, 1,
0.2099358, -1.671361, 2.47908, 0, 0.4941176, 1, 1,
0.2110712, 0.7808567, -0.356433, 0, 0.4901961, 1, 1,
0.2160776, 1.4274, 0.9212912, 0, 0.4823529, 1, 1,
0.2164211, 0.4421462, -0.3566426, 0, 0.4784314, 1, 1,
0.2218338, 1.983501, 0.1983932, 0, 0.4705882, 1, 1,
0.2225417, -1.584228, 3.071688, 0, 0.4666667, 1, 1,
0.2233986, -1.49661, 4.716134, 0, 0.4588235, 1, 1,
0.2261646, -1.122379, 1.607843, 0, 0.454902, 1, 1,
0.2311446, 0.706385, -0.5578901, 0, 0.4470588, 1, 1,
0.2320016, 0.4171481, 0.5898423, 0, 0.4431373, 1, 1,
0.2327316, 2.85555, -0.01965315, 0, 0.4352941, 1, 1,
0.2328821, -0.02995906, 2.441672, 0, 0.4313726, 1, 1,
0.2338001, -0.7962561, 1.815171, 0, 0.4235294, 1, 1,
0.2351181, -1.639248, 2.653934, 0, 0.4196078, 1, 1,
0.2406373, 0.5746515, -2.572998, 0, 0.4117647, 1, 1,
0.2417372, -0.5904341, 2.438932, 0, 0.4078431, 1, 1,
0.2465727, 0.3885024, 1.180145, 0, 0.4, 1, 1,
0.2552069, -0.03077561, 2.990995, 0, 0.3921569, 1, 1,
0.257819, 2.022659, 1.369388, 0, 0.3882353, 1, 1,
0.2581215, -0.959483, 1.268604, 0, 0.3803922, 1, 1,
0.2655016, -0.3507971, 3.212049, 0, 0.3764706, 1, 1,
0.2664181, -0.7021368, 1.653, 0, 0.3686275, 1, 1,
0.2702619, 0.1086268, 1.71865, 0, 0.3647059, 1, 1,
0.2707593, -0.006719822, 1.41996, 0, 0.3568628, 1, 1,
0.2729529, -0.1264764, 0.2154321, 0, 0.3529412, 1, 1,
0.2757076, 0.4318824, 1.351859, 0, 0.345098, 1, 1,
0.2766324, 0.942686, 2.095357, 0, 0.3411765, 1, 1,
0.2783317, -0.570415, 2.063628, 0, 0.3333333, 1, 1,
0.281926, 0.7507655, -0.4646236, 0, 0.3294118, 1, 1,
0.2840569, -1.219292, 2.152642, 0, 0.3215686, 1, 1,
0.2874257, 0.7320544, -2.085536, 0, 0.3176471, 1, 1,
0.2896301, -0.9365193, 3.067594, 0, 0.3098039, 1, 1,
0.2901376, 0.5785957, 0.9498397, 0, 0.3058824, 1, 1,
0.2966861, -0.8203993, 4.072275, 0, 0.2980392, 1, 1,
0.2998823, 0.2251353, 0.9418549, 0, 0.2901961, 1, 1,
0.3001989, 1.214674, -1.044534, 0, 0.2862745, 1, 1,
0.3071764, -0.6326903, 2.387713, 0, 0.2784314, 1, 1,
0.3100559, 0.1207998, 0.3777783, 0, 0.2745098, 1, 1,
0.3119146, -0.4167703, 1.896401, 0, 0.2666667, 1, 1,
0.3163335, 1.699794, 0.04585931, 0, 0.2627451, 1, 1,
0.3169914, 0.5489503, 1.282584, 0, 0.254902, 1, 1,
0.3176987, 1.921863, -0.9400132, 0, 0.2509804, 1, 1,
0.318448, 0.1688854, 2.278352, 0, 0.2431373, 1, 1,
0.3192631, 1.148318, 1.181882, 0, 0.2392157, 1, 1,
0.3243908, 0.4187073, 1.299456, 0, 0.2313726, 1, 1,
0.3249308, -0.02304132, 2.609956, 0, 0.227451, 1, 1,
0.3264126, -0.2111637, 2.239692, 0, 0.2196078, 1, 1,
0.3279732, 0.4992199, 0.9714063, 0, 0.2156863, 1, 1,
0.3297166, 0.129033, 0.5416616, 0, 0.2078431, 1, 1,
0.336578, 0.3196276, 1.412039, 0, 0.2039216, 1, 1,
0.3375152, 0.9612778, 0.3798188, 0, 0.1960784, 1, 1,
0.3385224, -0.3843918, 2.705447, 0, 0.1882353, 1, 1,
0.3400205, 0.5705919, 0.2794344, 0, 0.1843137, 1, 1,
0.3417029, -1.246701, 1.751147, 0, 0.1764706, 1, 1,
0.3451493, 0.4361571, 1.151705, 0, 0.172549, 1, 1,
0.3471249, -1.134248, 2.52875, 0, 0.1647059, 1, 1,
0.3508039, -0.4260008, 3.136823, 0, 0.1607843, 1, 1,
0.3534912, 0.07598988, 1.956907, 0, 0.1529412, 1, 1,
0.3591168, -0.0473598, 0.8893811, 0, 0.1490196, 1, 1,
0.3658065, 1.483652, 0.3908021, 0, 0.1411765, 1, 1,
0.3683522, -0.4434465, 2.794648, 0, 0.1372549, 1, 1,
0.3718222, 0.6552899, 1.447755, 0, 0.1294118, 1, 1,
0.3726353, -0.1769569, 2.255585, 0, 0.1254902, 1, 1,
0.373234, -1.235964, 2.275864, 0, 0.1176471, 1, 1,
0.375697, 1.145185, 0.4206243, 0, 0.1137255, 1, 1,
0.3776177, -1.381413, 2.265016, 0, 0.1058824, 1, 1,
0.3776997, 0.4299727, 0.9755797, 0, 0.09803922, 1, 1,
0.3795712, -0.04841052, 2.331279, 0, 0.09411765, 1, 1,
0.3824295, 0.3726946, -1.097214, 0, 0.08627451, 1, 1,
0.3833578, 0.5365679, -0.9616735, 0, 0.08235294, 1, 1,
0.384495, -1.039304, 4.405891, 0, 0.07450981, 1, 1,
0.3952726, 0.7377764, -0.01289577, 0, 0.07058824, 1, 1,
0.395593, 0.2784005, -1.207408, 0, 0.0627451, 1, 1,
0.4143838, -0.930519, 3.023802, 0, 0.05882353, 1, 1,
0.417891, -0.8722264, 1.006188, 0, 0.05098039, 1, 1,
0.4186024, -0.2310072, 1.996379, 0, 0.04705882, 1, 1,
0.4209654, 0.5463178, -1.40239, 0, 0.03921569, 1, 1,
0.4216751, 0.6490713, 0.8717262, 0, 0.03529412, 1, 1,
0.4217734, 0.8196287, 1.560835, 0, 0.02745098, 1, 1,
0.4262126, 0.5681498, -0.3189145, 0, 0.02352941, 1, 1,
0.4283795, 0.5434233, 1.114157, 0, 0.01568628, 1, 1,
0.4297754, -0.401358, 1.629427, 0, 0.01176471, 1, 1,
0.4317433, 0.07568054, 1.816313, 0, 0.003921569, 1, 1,
0.4342672, 0.0192658, 2.207353, 0.003921569, 0, 1, 1,
0.4343334, 0.5712276, -0.6041069, 0.007843138, 0, 1, 1,
0.4364191, 0.1716561, 2.099451, 0.01568628, 0, 1, 1,
0.438523, 0.660772, -0.2700684, 0.01960784, 0, 1, 1,
0.4428892, -0.8251145, 1.89409, 0.02745098, 0, 1, 1,
0.4440361, 0.02262265, 2.814898, 0.03137255, 0, 1, 1,
0.4452997, -0.4114844, 1.89516, 0.03921569, 0, 1, 1,
0.4459477, -0.01708171, 2.226409, 0.04313726, 0, 1, 1,
0.4485933, 2.433707, -0.7343761, 0.05098039, 0, 1, 1,
0.4533992, 1.085201, -1.459189, 0.05490196, 0, 1, 1,
0.4545819, -0.851407, 2.40071, 0.0627451, 0, 1, 1,
0.4557708, 0.9911689, 1.834943, 0.06666667, 0, 1, 1,
0.4581275, -0.45834, 2.275973, 0.07450981, 0, 1, 1,
0.4592317, 0.3330846, 0.3932353, 0.07843138, 0, 1, 1,
0.4606917, 1.404924, 1.084463, 0.08627451, 0, 1, 1,
0.4625165, 0.2681049, 0.297285, 0.09019608, 0, 1, 1,
0.4633406, -0.1745737, 2.001586, 0.09803922, 0, 1, 1,
0.4646588, 0.4291021, 1.82026, 0.1058824, 0, 1, 1,
0.4701438, 1.535648, 0.6559029, 0.1098039, 0, 1, 1,
0.4714361, 0.08944896, -0.04942139, 0.1176471, 0, 1, 1,
0.4737267, 0.5382317, 2.066197, 0.1215686, 0, 1, 1,
0.4742844, 0.7442989, -1.547335, 0.1294118, 0, 1, 1,
0.477613, -0.9280831, 2.468465, 0.1333333, 0, 1, 1,
0.4776802, 3.080552, 0.2990862, 0.1411765, 0, 1, 1,
0.482532, 0.9934236, 0.9962986, 0.145098, 0, 1, 1,
0.4865546, -0.07501828, 1.464503, 0.1529412, 0, 1, 1,
0.4925135, 0.2991722, 0.9547887, 0.1568628, 0, 1, 1,
0.4930329, 1.110998, 0.6842968, 0.1647059, 0, 1, 1,
0.49419, -0.2960758, 1.703164, 0.1686275, 0, 1, 1,
0.4943515, 0.3164551, 1.918134, 0.1764706, 0, 1, 1,
0.4947433, 0.7593982, 1.684434, 0.1803922, 0, 1, 1,
0.4989529, -0.9677418, 1.643611, 0.1882353, 0, 1, 1,
0.5105934, 0.5045679, 0.2074278, 0.1921569, 0, 1, 1,
0.5122425, 0.6877012, -1.031665, 0.2, 0, 1, 1,
0.5199229, -0.5926023, 1.304674, 0.2078431, 0, 1, 1,
0.5213535, -0.1813824, 3.857794, 0.2117647, 0, 1, 1,
0.5272312, -1.76972, 3.024604, 0.2196078, 0, 1, 1,
0.5275527, -1.580347, 2.812724, 0.2235294, 0, 1, 1,
0.5291297, -1.133356, 2.379426, 0.2313726, 0, 1, 1,
0.5342994, -0.1620839, 0.7377829, 0.2352941, 0, 1, 1,
0.5395493, -0.6156716, 3.125097, 0.2431373, 0, 1, 1,
0.5403965, -0.5222068, 0.5676069, 0.2470588, 0, 1, 1,
0.5475627, 0.3637346, 1.12089, 0.254902, 0, 1, 1,
0.5535462, 0.5399439, 0.2728992, 0.2588235, 0, 1, 1,
0.5536297, 0.8462155, 0.4046697, 0.2666667, 0, 1, 1,
0.5541888, -0.7226963, 3.557339, 0.2705882, 0, 1, 1,
0.555778, 0.794965, -0.4520425, 0.2784314, 0, 1, 1,
0.5590954, 0.4477046, 1.356258, 0.282353, 0, 1, 1,
0.5633342, 1.612735, -0.1935641, 0.2901961, 0, 1, 1,
0.5656711, 1.555846, 1.477586, 0.2941177, 0, 1, 1,
0.5690703, -0.9388564, 1.728491, 0.3019608, 0, 1, 1,
0.5868264, 0.3324798, 1.186381, 0.3098039, 0, 1, 1,
0.5911635, 1.135346, 1.398561, 0.3137255, 0, 1, 1,
0.5985889, -1.518691, 3.361363, 0.3215686, 0, 1, 1,
0.603888, -0.4163216, 1.920659, 0.3254902, 0, 1, 1,
0.6061454, -0.9866683, 3.666449, 0.3333333, 0, 1, 1,
0.6107122, -0.348662, 2.706413, 0.3372549, 0, 1, 1,
0.6167197, -0.4387765, 1.816544, 0.345098, 0, 1, 1,
0.6198195, 0.4416929, 2.354436, 0.3490196, 0, 1, 1,
0.6227596, -1.842148, 3.294314, 0.3568628, 0, 1, 1,
0.6318593, -0.1120169, 0.7943526, 0.3607843, 0, 1, 1,
0.6328356, -0.3559195, 2.354461, 0.3686275, 0, 1, 1,
0.63307, 0.03351224, 2.293218, 0.372549, 0, 1, 1,
0.634682, -0.6000634, 2.412559, 0.3803922, 0, 1, 1,
0.6408742, -0.7858483, 2.27698, 0.3843137, 0, 1, 1,
0.6411648, 0.66989, 1.334504, 0.3921569, 0, 1, 1,
0.6432844, 0.2049785, 0.7237132, 0.3960784, 0, 1, 1,
0.6448919, 0.0650843, 1.790645, 0.4039216, 0, 1, 1,
0.6458296, 2.972784, -1.058759, 0.4117647, 0, 1, 1,
0.6515512, 0.8908799, 0.2781335, 0.4156863, 0, 1, 1,
0.6641992, 1.190711, -0.7616203, 0.4235294, 0, 1, 1,
0.6663558, -0.7621601, 1.620639, 0.427451, 0, 1, 1,
0.6717552, 0.5808878, -0.3737161, 0.4352941, 0, 1, 1,
0.6726733, -1.379441, 3.018088, 0.4392157, 0, 1, 1,
0.6737288, -0.6973782, 2.918938, 0.4470588, 0, 1, 1,
0.6742805, 0.6254382, 0.4885622, 0.4509804, 0, 1, 1,
0.6771343, 1.366639, -0.1984778, 0.4588235, 0, 1, 1,
0.6801591, -1.135438, 2.91295, 0.4627451, 0, 1, 1,
0.6811709, -0.09038655, 0.8549045, 0.4705882, 0, 1, 1,
0.6852821, 1.135239, 0.1236162, 0.4745098, 0, 1, 1,
0.6897697, 0.3125829, 3.555366, 0.4823529, 0, 1, 1,
0.6924915, -0.310816, 3.85146, 0.4862745, 0, 1, 1,
0.6925786, 2.020325, 0.6154973, 0.4941176, 0, 1, 1,
0.6948791, -0.9277597, 3.226741, 0.5019608, 0, 1, 1,
0.694903, 0.3275045, 0.3951128, 0.5058824, 0, 1, 1,
0.6958566, 0.9896637, 0.4011214, 0.5137255, 0, 1, 1,
0.6964026, -0.9221375, 1.82898, 0.5176471, 0, 1, 1,
0.6980801, 0.5456851, 1.323775, 0.5254902, 0, 1, 1,
0.705346, 0.596971, 2.686716, 0.5294118, 0, 1, 1,
0.7056323, 0.1460156, 1.615427, 0.5372549, 0, 1, 1,
0.7078747, 0.1866045, 3.638096, 0.5411765, 0, 1, 1,
0.7104434, 1.105307, 2.344058, 0.5490196, 0, 1, 1,
0.7115749, 0.3326681, -1.040449, 0.5529412, 0, 1, 1,
0.7118905, -0.2378003, 2.541461, 0.5607843, 0, 1, 1,
0.7146981, 0.3384382, 1.874726, 0.5647059, 0, 1, 1,
0.7173472, -1.9561, 2.165765, 0.572549, 0, 1, 1,
0.717537, -0.7655684, 1.065087, 0.5764706, 0, 1, 1,
0.7232183, -1.053706, 1.786014, 0.5843138, 0, 1, 1,
0.7266402, -0.4146363, 2.304475, 0.5882353, 0, 1, 1,
0.7318632, 0.8660036, 0.08762383, 0.5960785, 0, 1, 1,
0.7431093, 0.005323695, 2.127553, 0.6039216, 0, 1, 1,
0.7473673, 1.182997, 0.9782346, 0.6078432, 0, 1, 1,
0.7490878, 1.668278, -0.5932202, 0.6156863, 0, 1, 1,
0.7494989, -0.5511422, 1.717608, 0.6196079, 0, 1, 1,
0.7593812, -2.594501, 4.061275, 0.627451, 0, 1, 1,
0.7733461, -0.08400963, 0.394545, 0.6313726, 0, 1, 1,
0.77341, -1.494574, 2.91539, 0.6392157, 0, 1, 1,
0.7739615, 0.1159956, 1.148513, 0.6431373, 0, 1, 1,
0.7771418, 1.072014, -1.14267, 0.6509804, 0, 1, 1,
0.7832536, 1.143311, 1.602826, 0.654902, 0, 1, 1,
0.783579, 0.3868151, 1.994833, 0.6627451, 0, 1, 1,
0.7861859, 1.677491, -0.9425136, 0.6666667, 0, 1, 1,
0.7893581, -0.5835872, 2.807747, 0.6745098, 0, 1, 1,
0.7900617, 0.2416966, 2.195928, 0.6784314, 0, 1, 1,
0.7907093, -0.7841169, 1.002129, 0.6862745, 0, 1, 1,
0.7941954, 0.2476026, 3.412951, 0.6901961, 0, 1, 1,
0.8098377, -1.216298, 1.234026, 0.6980392, 0, 1, 1,
0.81563, 0.1556042, 1.792899, 0.7058824, 0, 1, 1,
0.8170925, -1.331523, 3.150002, 0.7098039, 0, 1, 1,
0.8233219, -0.03982031, 3.63736, 0.7176471, 0, 1, 1,
0.82377, 0.8534137, -0.3602499, 0.7215686, 0, 1, 1,
0.8284862, -0.1606053, 1.788476, 0.7294118, 0, 1, 1,
0.8352887, -1.718662, 2.84449, 0.7333333, 0, 1, 1,
0.8373207, -0.4433799, 2.241267, 0.7411765, 0, 1, 1,
0.8449785, -1.339945, 1.764893, 0.7450981, 0, 1, 1,
0.8452076, 1.072751, 1.615131, 0.7529412, 0, 1, 1,
0.8486706, -0.5784112, 3.315433, 0.7568628, 0, 1, 1,
0.850818, 1.010079, -0.2612078, 0.7647059, 0, 1, 1,
0.8535216, -0.2161783, 1.317405, 0.7686275, 0, 1, 1,
0.8654844, -1.045724, 2.824077, 0.7764706, 0, 1, 1,
0.8691142, -1.083386, 2.763866, 0.7803922, 0, 1, 1,
0.8799848, -0.1886211, 2.243994, 0.7882353, 0, 1, 1,
0.8811369, 1.374539, 1.744962, 0.7921569, 0, 1, 1,
0.8841721, 0.2991701, 1.668316, 0.8, 0, 1, 1,
0.8865632, -0.8499351, 1.688827, 0.8078431, 0, 1, 1,
0.8877614, 1.922276, 0.3305617, 0.8117647, 0, 1, 1,
0.8949959, 1.454644, 1.205118, 0.8196079, 0, 1, 1,
0.90492, 0.5269635, 1.120618, 0.8235294, 0, 1, 1,
0.9080229, -1.008926, 2.342361, 0.8313726, 0, 1, 1,
0.9099331, 0.3390766, 1.889473, 0.8352941, 0, 1, 1,
0.9120299, -0.1069799, 2.141898, 0.8431373, 0, 1, 1,
0.9125247, 0.0128996, 1.640446, 0.8470588, 0, 1, 1,
0.9127653, -1.529276, 0.5802699, 0.854902, 0, 1, 1,
0.915562, -1.158369, 2.979358, 0.8588235, 0, 1, 1,
0.9178959, 0.07220087, 2.984003, 0.8666667, 0, 1, 1,
0.923863, -0.7576673, 1.315596, 0.8705882, 0, 1, 1,
0.9262462, 1.632172, 1.415626, 0.8784314, 0, 1, 1,
0.9358988, 2.058732, -1.580474, 0.8823529, 0, 1, 1,
0.9389477, 0.3677133, 0.6389553, 0.8901961, 0, 1, 1,
0.9481487, -1.060864, 2.410953, 0.8941177, 0, 1, 1,
0.9484746, 1.213628, -0.5797554, 0.9019608, 0, 1, 1,
0.960683, -1.207245, 3.449388, 0.9098039, 0, 1, 1,
0.9786596, -0.7838041, 1.512674, 0.9137255, 0, 1, 1,
0.9846761, -1.230019, 2.946535, 0.9215686, 0, 1, 1,
0.9849268, -1.37491, 3.434221, 0.9254902, 0, 1, 1,
0.9861755, -1.647575, 2.083253, 0.9333333, 0, 1, 1,
0.9881797, -1.080046, 2.79898, 0.9372549, 0, 1, 1,
0.9976488, 0.6614296, 2.068839, 0.945098, 0, 1, 1,
1.006297, -1.621268, 3.010569, 0.9490196, 0, 1, 1,
1.009567, 1.472655, 1.628532, 0.9568627, 0, 1, 1,
1.01606, 1.630313, 0.9906648, 0.9607843, 0, 1, 1,
1.01642, 1.913301, -0.8960484, 0.9686275, 0, 1, 1,
1.016708, 2.370506, 2.031558, 0.972549, 0, 1, 1,
1.01744, 1.193099, 0.8419989, 0.9803922, 0, 1, 1,
1.020225, -0.1305923, -0.7206857, 0.9843137, 0, 1, 1,
1.028946, -0.1644875, 2.623931, 0.9921569, 0, 1, 1,
1.033936, -1.756271, 2.776218, 0.9960784, 0, 1, 1,
1.034867, 1.296132, 0.4052415, 1, 0, 0.9960784, 1,
1.039182, 0.1283526, 1.563956, 1, 0, 0.9882353, 1,
1.040585, 0.7405933, 2.607141, 1, 0, 0.9843137, 1,
1.040586, -0.3362145, 1.707155, 1, 0, 0.9764706, 1,
1.044898, -0.7043183, 1.808518, 1, 0, 0.972549, 1,
1.04629, -0.7887644, 2.038065, 1, 0, 0.9647059, 1,
1.052264, -1.294419, 2.296635, 1, 0, 0.9607843, 1,
1.056859, 0.7834214, 1.023291, 1, 0, 0.9529412, 1,
1.059342, 0.3988499, 2.055362, 1, 0, 0.9490196, 1,
1.059602, -0.1131842, 3.812333, 1, 0, 0.9411765, 1,
1.061096, 0.1749632, 1.552648, 1, 0, 0.9372549, 1,
1.064497, -1.244231, 1.009659, 1, 0, 0.9294118, 1,
1.065999, 1.866626, 0.7235076, 1, 0, 0.9254902, 1,
1.075153, -0.2062383, 0.5795634, 1, 0, 0.9176471, 1,
1.080289, -0.46047, 1.692164, 1, 0, 0.9137255, 1,
1.084082, -0.1074394, 2.981194, 1, 0, 0.9058824, 1,
1.085811, -1.575155, 2.831707, 1, 0, 0.9019608, 1,
1.091436, 0.003533284, 3.334679, 1, 0, 0.8941177, 1,
1.102676, -0.9174883, 3.018696, 1, 0, 0.8862745, 1,
1.104125, 0.8100589, -3.582167, 1, 0, 0.8823529, 1,
1.106294, 0.5053474, -0.4077214, 1, 0, 0.8745098, 1,
1.106338, 0.2611645, 0.7582512, 1, 0, 0.8705882, 1,
1.11119, 0.2637571, 4.497273, 1, 0, 0.8627451, 1,
1.11269, 0.2265954, 1.724354, 1, 0, 0.8588235, 1,
1.116595, 0.3584675, 2.2533, 1, 0, 0.8509804, 1,
1.12381, 2.192458, 1.522277, 1, 0, 0.8470588, 1,
1.12964, 1.162979, 1.544823, 1, 0, 0.8392157, 1,
1.130186, 2.149988, 0.5189204, 1, 0, 0.8352941, 1,
1.130194, 0.2933806, 0.7009146, 1, 0, 0.827451, 1,
1.133167, -0.8661373, 1.127847, 1, 0, 0.8235294, 1,
1.133908, 0.5751507, 1.914526, 1, 0, 0.8156863, 1,
1.146103, -0.5285959, 3.412549, 1, 0, 0.8117647, 1,
1.155342, 1.438165, 0.5885096, 1, 0, 0.8039216, 1,
1.157051, -2.40615, 1.511342, 1, 0, 0.7960784, 1,
1.168993, -0.6565813, 2.893032, 1, 0, 0.7921569, 1,
1.169603, 0.4244227, 1.596148, 1, 0, 0.7843137, 1,
1.17792, 1.114844, 0.3893746, 1, 0, 0.7803922, 1,
1.20005, -0.279536, 1.981758, 1, 0, 0.772549, 1,
1.200176, -0.5331585, 1.207193, 1, 0, 0.7686275, 1,
1.203174, -0.3772436, 4.011764, 1, 0, 0.7607843, 1,
1.209375, -1.527018, 1.680273, 1, 0, 0.7568628, 1,
1.210151, -1.381272, 2.734944, 1, 0, 0.7490196, 1,
1.212993, 0.8711851, 0.6791496, 1, 0, 0.7450981, 1,
1.219966, 0.3460973, 1.836149, 1, 0, 0.7372549, 1,
1.22591, -2.503935, 3.082939, 1, 0, 0.7333333, 1,
1.227104, 1.364867, 0.3022148, 1, 0, 0.7254902, 1,
1.229271, 0.4314498, 2.426624, 1, 0, 0.7215686, 1,
1.229865, -0.002511817, 1.61981, 1, 0, 0.7137255, 1,
1.236757, 0.2598601, 3.343057, 1, 0, 0.7098039, 1,
1.238472, 0.1036915, 0.5131658, 1, 0, 0.7019608, 1,
1.240089, 1.730342, 1.882054, 1, 0, 0.6941177, 1,
1.240939, -0.8363094, 3.677706, 1, 0, 0.6901961, 1,
1.241099, 1.244021, 0.4199492, 1, 0, 0.682353, 1,
1.243214, -0.1906573, 3.87407, 1, 0, 0.6784314, 1,
1.25613, 0.5159051, 1.020391, 1, 0, 0.6705883, 1,
1.268027, -2.650693, 0.6766036, 1, 0, 0.6666667, 1,
1.272202, 0.08424582, 1.948534, 1, 0, 0.6588235, 1,
1.274773, -0.2502173, 0.3994376, 1, 0, 0.654902, 1,
1.278072, -0.7617277, 2.838742, 1, 0, 0.6470588, 1,
1.278428, -0.04013063, -0.08023001, 1, 0, 0.6431373, 1,
1.284291, 0.5228096, 2.786658, 1, 0, 0.6352941, 1,
1.287748, -1.162931, 0.8651105, 1, 0, 0.6313726, 1,
1.291796, 0.9632124, 1.251945, 1, 0, 0.6235294, 1,
1.294178, 0.1684754, 1.449629, 1, 0, 0.6196079, 1,
1.294183, 0.3919945, 0.8626191, 1, 0, 0.6117647, 1,
1.302011, 0.3829572, 1.115069, 1, 0, 0.6078432, 1,
1.302293, 0.5779135, 1.234649, 1, 0, 0.6, 1,
1.303516, -0.09744096, 1.429968, 1, 0, 0.5921569, 1,
1.315048, -0.5468224, 2.082246, 1, 0, 0.5882353, 1,
1.315257, -0.5414542, 1.772794, 1, 0, 0.5803922, 1,
1.317095, 0.8766985, 2.099807, 1, 0, 0.5764706, 1,
1.318238, 0.8081455, -0.3552972, 1, 0, 0.5686275, 1,
1.321715, -0.7190343, 2.060822, 1, 0, 0.5647059, 1,
1.323087, 0.4614581, 1.780302, 1, 0, 0.5568628, 1,
1.325534, -1.964049, 0.3912186, 1, 0, 0.5529412, 1,
1.338434, 0.6265032, 0.6813904, 1, 0, 0.5450981, 1,
1.339464, -0.1426239, 2.263441, 1, 0, 0.5411765, 1,
1.356332, -0.3668697, 1.661551, 1, 0, 0.5333334, 1,
1.364157, -0.8280275, 2.30178, 1, 0, 0.5294118, 1,
1.372749, -0.4900675, 1.516121, 1, 0, 0.5215687, 1,
1.384621, 1.100898, 2.747415, 1, 0, 0.5176471, 1,
1.387281, 0.2033043, 1.703314, 1, 0, 0.509804, 1,
1.387307, 1.027793, 0.7653733, 1, 0, 0.5058824, 1,
1.388094, -1.539035, 0.2496894, 1, 0, 0.4980392, 1,
1.393378, -0.8685191, 2.503036, 1, 0, 0.4901961, 1,
1.394034, 0.3392352, 2.016315, 1, 0, 0.4862745, 1,
1.395029, 0.06773084, 0.663084, 1, 0, 0.4784314, 1,
1.417433, -0.477066, 1.814135, 1, 0, 0.4745098, 1,
1.421347, 1.977922, -1.152944, 1, 0, 0.4666667, 1,
1.421847, 0.06545632, 2.412623, 1, 0, 0.4627451, 1,
1.424969, 0.1616536, 0.7534835, 1, 0, 0.454902, 1,
1.426739, -0.6390616, 2.213757, 1, 0, 0.4509804, 1,
1.42823, 1.519672, 1.028552, 1, 0, 0.4431373, 1,
1.431868, 0.1638158, 2.083938, 1, 0, 0.4392157, 1,
1.441726, 0.3748043, 0.9411923, 1, 0, 0.4313726, 1,
1.457092, -1.098874, 2.757312, 1, 0, 0.427451, 1,
1.466153, -0.3564367, -0.1465419, 1, 0, 0.4196078, 1,
1.478794, 0.2962523, 1.47649, 1, 0, 0.4156863, 1,
1.481408, 1.909564, 3.221111, 1, 0, 0.4078431, 1,
1.487947, 0.2221266, 2.221745, 1, 0, 0.4039216, 1,
1.48885, 0.4965988, 1.600263, 1, 0, 0.3960784, 1,
1.48995, -2.175123, 2.898135, 1, 0, 0.3882353, 1,
1.503716, 0.8715567, 1.750122, 1, 0, 0.3843137, 1,
1.510653, 0.402361, -0.3612589, 1, 0, 0.3764706, 1,
1.517504, -1.364287, 0.9782087, 1, 0, 0.372549, 1,
1.517669, 0.5593916, 0.1882067, 1, 0, 0.3647059, 1,
1.523186, 0.5029463, 2.378029, 1, 0, 0.3607843, 1,
1.52997, 0.09343529, 0.7445719, 1, 0, 0.3529412, 1,
1.533694, 0.674693, 0.502159, 1, 0, 0.3490196, 1,
1.538692, 1.022116, 0.3206742, 1, 0, 0.3411765, 1,
1.56294, -0.6876387, 0.5016419, 1, 0, 0.3372549, 1,
1.56619, -1.196121, 1.13033, 1, 0, 0.3294118, 1,
1.586784, 1.556348, -0.9140825, 1, 0, 0.3254902, 1,
1.592836, 0.8412068, 1.989985, 1, 0, 0.3176471, 1,
1.603494, 0.3309575, 1.067552, 1, 0, 0.3137255, 1,
1.617673, 2.897264, 0.8098387, 1, 0, 0.3058824, 1,
1.622653, -0.2985952, 1.52587, 1, 0, 0.2980392, 1,
1.641214, -0.1804357, 1.148901, 1, 0, 0.2941177, 1,
1.668545, 1.314006, 1.205242, 1, 0, 0.2862745, 1,
1.669153, -0.8626595, 1.444316, 1, 0, 0.282353, 1,
1.673851, 1.132956, -0.3719186, 1, 0, 0.2745098, 1,
1.692293, -0.2719743, -0.4589809, 1, 0, 0.2705882, 1,
1.706507, 0.1442806, 2.718282, 1, 0, 0.2627451, 1,
1.707309, -0.6257538, 2.249075, 1, 0, 0.2588235, 1,
1.715133, 0.4443397, 0.8893073, 1, 0, 0.2509804, 1,
1.73073, 0.659973, 0.2112009, 1, 0, 0.2470588, 1,
1.736621, -0.5883656, 2.205872, 1, 0, 0.2392157, 1,
1.770831, -1.494844, 3.397933, 1, 0, 0.2352941, 1,
1.802364, 0.1119886, 1.801617, 1, 0, 0.227451, 1,
1.819044, 0.02911879, 3.186598, 1, 0, 0.2235294, 1,
1.820437, -0.3360398, 1.19487, 1, 0, 0.2156863, 1,
1.826669, -0.7925282, 2.225175, 1, 0, 0.2117647, 1,
1.830709, 0.2099774, 2.678357, 1, 0, 0.2039216, 1,
1.845786, 2.194108, 0.9261091, 1, 0, 0.1960784, 1,
1.874538, 1.493846, 0.69164, 1, 0, 0.1921569, 1,
1.885594, 1.342985, 1.256583, 1, 0, 0.1843137, 1,
1.897173, 1.204027, 0.8830899, 1, 0, 0.1803922, 1,
1.965237, 0.3234482, 2.181033, 1, 0, 0.172549, 1,
1.97082, -1.716413, 2.589419, 1, 0, 0.1686275, 1,
1.975338, -1.260107, 1.887231, 1, 0, 0.1607843, 1,
1.984055, 1.744229, 1.294138, 1, 0, 0.1568628, 1,
1.994732, -0.4439495, 0.3184439, 1, 0, 0.1490196, 1,
2.027863, -1.433552, 1.945244, 1, 0, 0.145098, 1,
2.032534, -0.0382969, 0.6726408, 1, 0, 0.1372549, 1,
2.035615, 1.366014, -0.4745879, 1, 0, 0.1333333, 1,
2.046, 0.2090558, 3.379037, 1, 0, 0.1254902, 1,
2.072335, -0.01420558, 0.9182039, 1, 0, 0.1215686, 1,
2.142077, -0.1519592, 2.308434, 1, 0, 0.1137255, 1,
2.153833, 0.5913529, 0.3132299, 1, 0, 0.1098039, 1,
2.156009, -2.116363, 2.223862, 1, 0, 0.1019608, 1,
2.156177, -0.9067037, 1.421287, 1, 0, 0.09411765, 1,
2.177026, -0.09106146, 1.717044, 1, 0, 0.09019608, 1,
2.181636, -0.1046604, 1.35249, 1, 0, 0.08235294, 1,
2.206359, 0.009218858, 2.697833, 1, 0, 0.07843138, 1,
2.213908, -0.4676384, 3.617651, 1, 0, 0.07058824, 1,
2.226277, 0.09882829, 1.626891, 1, 0, 0.06666667, 1,
2.236503, 0.4441731, 2.080949, 1, 0, 0.05882353, 1,
2.254973, 0.9581282, 1.474818, 1, 0, 0.05490196, 1,
2.298177, 0.07658114, 1.130763, 1, 0, 0.04705882, 1,
2.305566, 0.9599329, 0.7261688, 1, 0, 0.04313726, 1,
2.437116, -0.6812065, 1.129796, 1, 0, 0.03529412, 1,
2.458637, 0.4126726, 3.614263, 1, 0, 0.03137255, 1,
2.901151, -1.916672, 3.601842, 1, 0, 0.02352941, 1,
2.906795, 1.026852, 1.352277, 1, 0, 0.01960784, 1,
2.983204, 1.480775, 1.220372, 1, 0, 0.01176471, 1,
3.433987, -1.128761, 2.726444, 1, 0, 0.007843138, 1
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
0.1164457, -4.413534, -7.628004, 0, -0.5, 0.5, 0.5,
0.1164457, -4.413534, -7.628004, 1, -0.5, 0.5, 0.5,
0.1164457, -4.413534, -7.628004, 1, 1.5, 0.5, 0.5,
0.1164457, -4.413534, -7.628004, 0, 1.5, 0.5, 0.5
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
-4.325742, -0.1234181, -7.628004, 0, -0.5, 0.5, 0.5,
-4.325742, -0.1234181, -7.628004, 1, -0.5, 0.5, 0.5,
-4.325742, -0.1234181, -7.628004, 1, 1.5, 0.5, 0.5,
-4.325742, -0.1234181, -7.628004, 0, 1.5, 0.5, 0.5
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
-4.325742, -4.413534, -0.2333438, 0, -0.5, 0.5, 0.5,
-4.325742, -4.413534, -0.2333438, 1, -0.5, 0.5, 0.5,
-4.325742, -4.413534, -0.2333438, 1, 1.5, 0.5, 0.5,
-4.325742, -4.413534, -0.2333438, 0, 1.5, 0.5, 0.5
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
-3, -3.423507, -5.921544,
3, -3.423507, -5.921544,
-3, -3.423507, -5.921544,
-3, -3.588511, -6.205954,
-2, -3.423507, -5.921544,
-2, -3.588511, -6.205954,
-1, -3.423507, -5.921544,
-1, -3.588511, -6.205954,
0, -3.423507, -5.921544,
0, -3.588511, -6.205954,
1, -3.423507, -5.921544,
1, -3.588511, -6.205954,
2, -3.423507, -5.921544,
2, -3.588511, -6.205954,
3, -3.423507, -5.921544,
3, -3.588511, -6.205954
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
-3, -3.91852, -6.774774, 0, -0.5, 0.5, 0.5,
-3, -3.91852, -6.774774, 1, -0.5, 0.5, 0.5,
-3, -3.91852, -6.774774, 1, 1.5, 0.5, 0.5,
-3, -3.91852, -6.774774, 0, 1.5, 0.5, 0.5,
-2, -3.91852, -6.774774, 0, -0.5, 0.5, 0.5,
-2, -3.91852, -6.774774, 1, -0.5, 0.5, 0.5,
-2, -3.91852, -6.774774, 1, 1.5, 0.5, 0.5,
-2, -3.91852, -6.774774, 0, 1.5, 0.5, 0.5,
-1, -3.91852, -6.774774, 0, -0.5, 0.5, 0.5,
-1, -3.91852, -6.774774, 1, -0.5, 0.5, 0.5,
-1, -3.91852, -6.774774, 1, 1.5, 0.5, 0.5,
-1, -3.91852, -6.774774, 0, 1.5, 0.5, 0.5,
0, -3.91852, -6.774774, 0, -0.5, 0.5, 0.5,
0, -3.91852, -6.774774, 1, -0.5, 0.5, 0.5,
0, -3.91852, -6.774774, 1, 1.5, 0.5, 0.5,
0, -3.91852, -6.774774, 0, 1.5, 0.5, 0.5,
1, -3.91852, -6.774774, 0, -0.5, 0.5, 0.5,
1, -3.91852, -6.774774, 1, -0.5, 0.5, 0.5,
1, -3.91852, -6.774774, 1, 1.5, 0.5, 0.5,
1, -3.91852, -6.774774, 0, 1.5, 0.5, 0.5,
2, -3.91852, -6.774774, 0, -0.5, 0.5, 0.5,
2, -3.91852, -6.774774, 1, -0.5, 0.5, 0.5,
2, -3.91852, -6.774774, 1, 1.5, 0.5, 0.5,
2, -3.91852, -6.774774, 0, 1.5, 0.5, 0.5,
3, -3.91852, -6.774774, 0, -0.5, 0.5, 0.5,
3, -3.91852, -6.774774, 1, -0.5, 0.5, 0.5,
3, -3.91852, -6.774774, 1, 1.5, 0.5, 0.5,
3, -3.91852, -6.774774, 0, 1.5, 0.5, 0.5
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
-3.300622, -3, -5.921544,
-3.300622, 3, -5.921544,
-3.300622, -3, -5.921544,
-3.471475, -3, -6.205954,
-3.300622, -2, -5.921544,
-3.471475, -2, -6.205954,
-3.300622, -1, -5.921544,
-3.471475, -1, -6.205954,
-3.300622, 0, -5.921544,
-3.471475, 0, -6.205954,
-3.300622, 1, -5.921544,
-3.471475, 1, -6.205954,
-3.300622, 2, -5.921544,
-3.471475, 2, -6.205954,
-3.300622, 3, -5.921544,
-3.471475, 3, -6.205954
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
-3.813182, -3, -6.774774, 0, -0.5, 0.5, 0.5,
-3.813182, -3, -6.774774, 1, -0.5, 0.5, 0.5,
-3.813182, -3, -6.774774, 1, 1.5, 0.5, 0.5,
-3.813182, -3, -6.774774, 0, 1.5, 0.5, 0.5,
-3.813182, -2, -6.774774, 0, -0.5, 0.5, 0.5,
-3.813182, -2, -6.774774, 1, -0.5, 0.5, 0.5,
-3.813182, -2, -6.774774, 1, 1.5, 0.5, 0.5,
-3.813182, -2, -6.774774, 0, 1.5, 0.5, 0.5,
-3.813182, -1, -6.774774, 0, -0.5, 0.5, 0.5,
-3.813182, -1, -6.774774, 1, -0.5, 0.5, 0.5,
-3.813182, -1, -6.774774, 1, 1.5, 0.5, 0.5,
-3.813182, -1, -6.774774, 0, 1.5, 0.5, 0.5,
-3.813182, 0, -6.774774, 0, -0.5, 0.5, 0.5,
-3.813182, 0, -6.774774, 1, -0.5, 0.5, 0.5,
-3.813182, 0, -6.774774, 1, 1.5, 0.5, 0.5,
-3.813182, 0, -6.774774, 0, 1.5, 0.5, 0.5,
-3.813182, 1, -6.774774, 0, -0.5, 0.5, 0.5,
-3.813182, 1, -6.774774, 1, -0.5, 0.5, 0.5,
-3.813182, 1, -6.774774, 1, 1.5, 0.5, 0.5,
-3.813182, 1, -6.774774, 0, 1.5, 0.5, 0.5,
-3.813182, 2, -6.774774, 0, -0.5, 0.5, 0.5,
-3.813182, 2, -6.774774, 1, -0.5, 0.5, 0.5,
-3.813182, 2, -6.774774, 1, 1.5, 0.5, 0.5,
-3.813182, 2, -6.774774, 0, 1.5, 0.5, 0.5,
-3.813182, 3, -6.774774, 0, -0.5, 0.5, 0.5,
-3.813182, 3, -6.774774, 1, -0.5, 0.5, 0.5,
-3.813182, 3, -6.774774, 1, 1.5, 0.5, 0.5,
-3.813182, 3, -6.774774, 0, 1.5, 0.5, 0.5
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
-3.300622, -3.423507, -4,
-3.300622, -3.423507, 4,
-3.300622, -3.423507, -4,
-3.471475, -3.588511, -4,
-3.300622, -3.423507, -2,
-3.471475, -3.588511, -2,
-3.300622, -3.423507, 0,
-3.471475, -3.588511, 0,
-3.300622, -3.423507, 2,
-3.471475, -3.588511, 2,
-3.300622, -3.423507, 4,
-3.471475, -3.588511, 4
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
-3.813182, -3.91852, -4, 0, -0.5, 0.5, 0.5,
-3.813182, -3.91852, -4, 1, -0.5, 0.5, 0.5,
-3.813182, -3.91852, -4, 1, 1.5, 0.5, 0.5,
-3.813182, -3.91852, -4, 0, 1.5, 0.5, 0.5,
-3.813182, -3.91852, -2, 0, -0.5, 0.5, 0.5,
-3.813182, -3.91852, -2, 1, -0.5, 0.5, 0.5,
-3.813182, -3.91852, -2, 1, 1.5, 0.5, 0.5,
-3.813182, -3.91852, -2, 0, 1.5, 0.5, 0.5,
-3.813182, -3.91852, 0, 0, -0.5, 0.5, 0.5,
-3.813182, -3.91852, 0, 1, -0.5, 0.5, 0.5,
-3.813182, -3.91852, 0, 1, 1.5, 0.5, 0.5,
-3.813182, -3.91852, 0, 0, 1.5, 0.5, 0.5,
-3.813182, -3.91852, 2, 0, -0.5, 0.5, 0.5,
-3.813182, -3.91852, 2, 1, -0.5, 0.5, 0.5,
-3.813182, -3.91852, 2, 1, 1.5, 0.5, 0.5,
-3.813182, -3.91852, 2, 0, 1.5, 0.5, 0.5,
-3.813182, -3.91852, 4, 0, -0.5, 0.5, 0.5,
-3.813182, -3.91852, 4, 1, -0.5, 0.5, 0.5,
-3.813182, -3.91852, 4, 1, 1.5, 0.5, 0.5,
-3.813182, -3.91852, 4, 0, 1.5, 0.5, 0.5
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
-3.300622, -3.423507, -5.921544,
-3.300622, 3.176671, -5.921544,
-3.300622, -3.423507, 5.454856,
-3.300622, 3.176671, 5.454856,
-3.300622, -3.423507, -5.921544,
-3.300622, -3.423507, 5.454856,
-3.300622, 3.176671, -5.921544,
-3.300622, 3.176671, 5.454856,
-3.300622, -3.423507, -5.921544,
3.533513, -3.423507, -5.921544,
-3.300622, -3.423507, 5.454856,
3.533513, -3.423507, 5.454856,
-3.300622, 3.176671, -5.921544,
3.533513, 3.176671, -5.921544,
-3.300622, 3.176671, 5.454856,
3.533513, 3.176671, 5.454856,
3.533513, -3.423507, -5.921544,
3.533513, 3.176671, -5.921544,
3.533513, -3.423507, 5.454856,
3.533513, 3.176671, 5.454856,
3.533513, -3.423507, -5.921544,
3.533513, -3.423507, 5.454856,
3.533513, 3.176671, -5.921544,
3.533513, 3.176671, 5.454856
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
var radius = 7.914634;
var distance = 35.2131;
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
mvMatrix.translate( -0.1164457, 0.1234181, 0.2333438 );
mvMatrix.scale( 1.252164, 1.29655, 0.7522113 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.2131);
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
oxasulfuron<-read.table("oxasulfuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxasulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxasulfuron' not found
```

```r
y<-oxasulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxasulfuron' not found
```

```r
z<-oxasulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxasulfuron' not found
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
-3.201096, -0.04663903, -1.360884, 0, 0, 1, 1, 1,
-3.077468, -0.5525588, -0.4095881, 1, 0, 0, 1, 1,
-3.038843, 1.202124, -2.725673, 1, 0, 0, 1, 1,
-2.95803, 1.314353, -1.276314, 1, 0, 0, 1, 1,
-2.954395, 0.3044029, 0.4642189, 1, 0, 0, 1, 1,
-2.917807, -1.813289, -2.178941, 1, 0, 0, 1, 1,
-2.903787, 0.5792716, -2.612932, 0, 0, 0, 1, 1,
-2.652632, 0.2481773, -1.223633, 0, 0, 0, 1, 1,
-2.637898, 0.1978962, -2.218476, 0, 0, 0, 1, 1,
-2.494144, 0.07196046, -0.7631436, 0, 0, 0, 1, 1,
-2.467108, -1.228234, -1.45884, 0, 0, 0, 1, 1,
-2.465762, -0.5340421, -1.331482, 0, 0, 0, 1, 1,
-2.453752, 0.04024329, -2.203376, 0, 0, 0, 1, 1,
-2.3524, -0.8066967, -0.9986332, 1, 1, 1, 1, 1,
-2.328166, 1.409001, -1.869385, 1, 1, 1, 1, 1,
-2.308504, -0.09560481, -1.554313, 1, 1, 1, 1, 1,
-2.260668, -0.9425378, -2.308912, 1, 1, 1, 1, 1,
-2.229829, 1.906067, -2.09827, 1, 1, 1, 1, 1,
-2.170026, -1.13918, -2.232013, 1, 1, 1, 1, 1,
-2.166142, 0.4309101, -2.580419, 1, 1, 1, 1, 1,
-2.160668, -0.4417691, -1.564615, 1, 1, 1, 1, 1,
-2.152773, -0.02491125, 0.4696788, 1, 1, 1, 1, 1,
-2.125015, 1.441102, -1.174768, 1, 1, 1, 1, 1,
-2.110803, 0.606591, 0.03876555, 1, 1, 1, 1, 1,
-2.110267, 0.5443307, -2.194164, 1, 1, 1, 1, 1,
-2.084881, -2.211334, -1.250488, 1, 1, 1, 1, 1,
-2.050972, 1.061181, -1.174688, 1, 1, 1, 1, 1,
-2.039725, -1.327019, -3.221843, 1, 1, 1, 1, 1,
-2.016337, 0.02991491, 1.390834, 0, 0, 1, 1, 1,
-2.005591, 1.382842, -0.04470822, 1, 0, 0, 1, 1,
-1.951658, 0.3791505, 0.0419694, 1, 0, 0, 1, 1,
-1.928222, 0.6418133, 0.903129, 1, 0, 0, 1, 1,
-1.899674, 0.363308, -0.4221119, 1, 0, 0, 1, 1,
-1.895108, 0.9061509, -1.037512, 1, 0, 0, 1, 1,
-1.888485, -0.7945289, -2.619153, 0, 0, 0, 1, 1,
-1.870983, 0.8869136, -1.300586, 0, 0, 0, 1, 1,
-1.85802, 1.359576, -1.870806, 0, 0, 0, 1, 1,
-1.805558, 0.7459134, -1.763578, 0, 0, 0, 1, 1,
-1.785917, 0.1551131, -0.3437833, 0, 0, 0, 1, 1,
-1.769836, 2.303982, 1.545102, 0, 0, 0, 1, 1,
-1.763469, 0.9762068, 0.1026159, 0, 0, 0, 1, 1,
-1.756855, -0.8354792, -2.067663, 1, 1, 1, 1, 1,
-1.744084, 0.3524556, -0.6040183, 1, 1, 1, 1, 1,
-1.734758, 0.1651673, -0.3974892, 1, 1, 1, 1, 1,
-1.733828, -0.4786028, -3.158519, 1, 1, 1, 1, 1,
-1.719241, 1.021802, -1.421445, 1, 1, 1, 1, 1,
-1.715079, 1.072219, -2.566248, 1, 1, 1, 1, 1,
-1.713218, -0.07127848, -1.675902, 1, 1, 1, 1, 1,
-1.710127, 1.422496, -0.4052236, 1, 1, 1, 1, 1,
-1.682198, -0.3558869, -1.318243, 1, 1, 1, 1, 1,
-1.681834, -0.2744707, -1.977461, 1, 1, 1, 1, 1,
-1.676916, 0.4485022, -2.189386, 1, 1, 1, 1, 1,
-1.676576, 0.4995963, -1.31982, 1, 1, 1, 1, 1,
-1.671607, -1.225164, -2.806417, 1, 1, 1, 1, 1,
-1.669389, -0.4580891, -2.612972, 1, 1, 1, 1, 1,
-1.650047, 0.1843782, -0.9466143, 1, 1, 1, 1, 1,
-1.641286, 0.0697417, -2.473861, 0, 0, 1, 1, 1,
-1.632956, -1.895394, -2.086306, 1, 0, 0, 1, 1,
-1.632671, -0.02526368, -1.022768, 1, 0, 0, 1, 1,
-1.628099, 0.8935025, -1.461351, 1, 0, 0, 1, 1,
-1.622304, 0.392316, -0.598942, 1, 0, 0, 1, 1,
-1.615884, -0.8948525, -2.262841, 1, 0, 0, 1, 1,
-1.581427, -1.1947, -1.888955, 0, 0, 0, 1, 1,
-1.578468, 1.251333, 0.2960168, 0, 0, 0, 1, 1,
-1.55892, -1.045814, -1.826098, 0, 0, 0, 1, 1,
-1.558477, -0.07537068, -2.782753, 0, 0, 0, 1, 1,
-1.542068, -0.6953043, -2.886076, 0, 0, 0, 1, 1,
-1.536939, -0.01402473, -1.327814, 0, 0, 0, 1, 1,
-1.516078, 0.4179857, 0.9016512, 0, 0, 0, 1, 1,
-1.509999, 0.7996868, -1.879362, 1, 1, 1, 1, 1,
-1.503772, -1.647485, -2.482595, 1, 1, 1, 1, 1,
-1.498401, 0.4694881, -3.347792, 1, 1, 1, 1, 1,
-1.481973, -0.203181, -1.191502, 1, 1, 1, 1, 1,
-1.476941, 0.7714296, -0.8547702, 1, 1, 1, 1, 1,
-1.47064, -0.6827711, -3.116925, 1, 1, 1, 1, 1,
-1.467616, -0.7296265, -1.66031, 1, 1, 1, 1, 1,
-1.451111, 0.6530408, 0.1769538, 1, 1, 1, 1, 1,
-1.450751, 0.6664906, -1.052975, 1, 1, 1, 1, 1,
-1.449973, 0.6873926, -1.1263, 1, 1, 1, 1, 1,
-1.443903, 0.5706792, -0.1649608, 1, 1, 1, 1, 1,
-1.443623, 0.1523835, -3.327392, 1, 1, 1, 1, 1,
-1.441774, 1.139498, -1.143061, 1, 1, 1, 1, 1,
-1.438939, -2.104885, -3.57703, 1, 1, 1, 1, 1,
-1.434806, -0.5434017, -1.159875, 1, 1, 1, 1, 1,
-1.426402, -0.4979764, -1.029622, 0, 0, 1, 1, 1,
-1.411814, -1.047479, 0.1834628, 1, 0, 0, 1, 1,
-1.402891, 0.1176956, -1.345582, 1, 0, 0, 1, 1,
-1.401838, -0.3195634, -2.809261, 1, 0, 0, 1, 1,
-1.373644, 0.2559928, -1.328232, 1, 0, 0, 1, 1,
-1.353477, 0.3310711, -3.366461, 1, 0, 0, 1, 1,
-1.349633, -2.367461, -2.075923, 0, 0, 0, 1, 1,
-1.347419, -0.03580807, -2.380221, 0, 0, 0, 1, 1,
-1.326504, 0.8703368, -0.8517376, 0, 0, 0, 1, 1,
-1.325829, 1.038269, 0.004913897, 0, 0, 0, 1, 1,
-1.316734, -1.07152, -3.048051, 0, 0, 0, 1, 1,
-1.310132, -0.3665567, -2.506958, 0, 0, 0, 1, 1,
-1.307716, 0.6932086, -2.351049, 0, 0, 0, 1, 1,
-1.307662, 0.3054703, -1.976919, 1, 1, 1, 1, 1,
-1.304575, 2.045807, -1.754078, 1, 1, 1, 1, 1,
-1.302214, 1.37755, -2.146387, 1, 1, 1, 1, 1,
-1.298401, 1.851919, -1.062931, 1, 1, 1, 1, 1,
-1.295722, -0.3814445, -4.161362, 1, 1, 1, 1, 1,
-1.294531, 0.3672386, -2.656271, 1, 1, 1, 1, 1,
-1.29317, -0.5755005, -1.123945, 1, 1, 1, 1, 1,
-1.292992, -0.9438394, -1.889741, 1, 1, 1, 1, 1,
-1.291116, 0.4949094, 1.510327, 1, 1, 1, 1, 1,
-1.271939, -0.2033116, -1.471394, 1, 1, 1, 1, 1,
-1.271495, 0.3010295, -0.4017376, 1, 1, 1, 1, 1,
-1.26883, 0.7746718, -0.7929139, 1, 1, 1, 1, 1,
-1.267251, 1.464384, -0.3423867, 1, 1, 1, 1, 1,
-1.264422, 0.8601971, -0.7952704, 1, 1, 1, 1, 1,
-1.263367, 0.6937333, 0.2373051, 1, 1, 1, 1, 1,
-1.255018, -0.1057578, -1.567436, 0, 0, 1, 1, 1,
-1.254706, -0.2085158, -2.048851, 1, 0, 0, 1, 1,
-1.254098, -1.0957, -1.293339, 1, 0, 0, 1, 1,
-1.246091, -0.1243044, -2.791553, 1, 0, 0, 1, 1,
-1.241355, 0.2898606, -0.7879914, 1, 0, 0, 1, 1,
-1.240962, -0.882246, -1.663311, 1, 0, 0, 1, 1,
-1.236233, -2.324296, -3.473189, 0, 0, 0, 1, 1,
-1.235749, 0.26107, 1.376534, 0, 0, 0, 1, 1,
-1.22815, 0.9123408, -0.6829885, 0, 0, 0, 1, 1,
-1.22729, 0.3735034, -1.589038, 0, 0, 0, 1, 1,
-1.226578, -0.8930669, -1.586191, 0, 0, 0, 1, 1,
-1.217217, 0.6671534, -1.083796, 0, 0, 0, 1, 1,
-1.215595, -0.2391526, -1.918229, 0, 0, 0, 1, 1,
-1.214548, -0.443942, -2.44443, 1, 1, 1, 1, 1,
-1.211946, 0.1901814, -1.666365, 1, 1, 1, 1, 1,
-1.210075, -1.294189, -2.572113, 1, 1, 1, 1, 1,
-1.200437, -1.187601, -3.026127, 1, 1, 1, 1, 1,
-1.199981, 0.308357, -2.80606, 1, 1, 1, 1, 1,
-1.195305, -1.009754, -2.985228, 1, 1, 1, 1, 1,
-1.194567, -1.14977, -2.56452, 1, 1, 1, 1, 1,
-1.194264, -1.111154, -1.93142, 1, 1, 1, 1, 1,
-1.192214, -0.6532032, -0.4647037, 1, 1, 1, 1, 1,
-1.180341, 0.004273704, -3.045119, 1, 1, 1, 1, 1,
-1.178642, -0.4900361, -1.349666, 1, 1, 1, 1, 1,
-1.167856, 0.1132355, -0.02454204, 1, 1, 1, 1, 1,
-1.165403, 1.66432, -1.302664, 1, 1, 1, 1, 1,
-1.158259, -0.8739055, -1.782945, 1, 1, 1, 1, 1,
-1.154401, -0.1392734, -2.769176, 1, 1, 1, 1, 1,
-1.154343, -1.319508, -0.1816489, 0, 0, 1, 1, 1,
-1.152509, -0.633041, -1.867724, 1, 0, 0, 1, 1,
-1.146266, 0.3894385, -0.8133576, 1, 0, 0, 1, 1,
-1.143357, -0.6984558, -1.784923, 1, 0, 0, 1, 1,
-1.140232, -0.01267216, -1.508993, 1, 0, 0, 1, 1,
-1.126946, -0.0807424, -1.183931, 1, 0, 0, 1, 1,
-1.120514, 0.4414198, -1.354817, 0, 0, 0, 1, 1,
-1.115683, -0.5867646, -2.165396, 0, 0, 0, 1, 1,
-1.111868, -1.034142, -2.614712, 0, 0, 0, 1, 1,
-1.108514, 0.4180075, -0.175842, 0, 0, 0, 1, 1,
-1.101076, 0.4142964, -0.6978906, 0, 0, 0, 1, 1,
-1.088364, -2.881225, -2.59143, 0, 0, 0, 1, 1,
-1.088006, 0.6186232, -2.047136, 0, 0, 0, 1, 1,
-1.087728, 0.863902, -2.15628, 1, 1, 1, 1, 1,
-1.074641, -0.5899944, -2.815688, 1, 1, 1, 1, 1,
-1.070814, 0.5352172, -0.2153176, 1, 1, 1, 1, 1,
-1.070165, 1.344711, 0.5698211, 1, 1, 1, 1, 1,
-1.067948, -0.6384962, -1.242036, 1, 1, 1, 1, 1,
-1.067864, 0.924983, -2.223727, 1, 1, 1, 1, 1,
-1.066278, 0.2068184, -1.72638, 1, 1, 1, 1, 1,
-1.065447, -0.3546434, -1.33902, 1, 1, 1, 1, 1,
-1.054466, -1.51225, -5.109214, 1, 1, 1, 1, 1,
-1.053455, -1.235347, -1.911962, 1, 1, 1, 1, 1,
-1.044012, 0.3482228, -1.300585, 1, 1, 1, 1, 1,
-1.041512, 0.5643507, -1.021355, 1, 1, 1, 1, 1,
-1.035416, -0.8649426, -2.33408, 1, 1, 1, 1, 1,
-1.031989, 0.2774167, -1.599292, 1, 1, 1, 1, 1,
-1.031593, -0.1466907, -1.228254, 1, 1, 1, 1, 1,
-1.029927, 1.480436, 1.794464, 0, 0, 1, 1, 1,
-1.025161, 0.5013117, -2.184283, 1, 0, 0, 1, 1,
-1.020894, 1.695492, -0.5917993, 1, 0, 0, 1, 1,
-1.017769, 1.083077, 0.06166038, 1, 0, 0, 1, 1,
-1.016316, 0.8052012, 0.1453111, 1, 0, 0, 1, 1,
-1.010766, -0.03586814, -1.108207, 1, 0, 0, 1, 1,
-1.006095, -0.8457637, -0.9400198, 0, 0, 0, 1, 1,
-1.001637, 1.092472, -2.101462, 0, 0, 0, 1, 1,
-1.000661, -0.3667502, -1.947572, 0, 0, 0, 1, 1,
-0.9942788, -1.365094, -2.289146, 0, 0, 0, 1, 1,
-0.9939491, -0.6903251, -0.01741002, 0, 0, 0, 1, 1,
-0.9863914, 0.9754308, -2.914562, 0, 0, 0, 1, 1,
-0.9819722, 2.18557, 0.7055194, 0, 0, 0, 1, 1,
-0.9743283, -0.2211763, -1.927164, 1, 1, 1, 1, 1,
-0.9646735, -0.3516995, -2.658433, 1, 1, 1, 1, 1,
-0.962999, 0.2522482, -1.016802, 1, 1, 1, 1, 1,
-0.9629533, -0.7516227, 0.0478985, 1, 1, 1, 1, 1,
-0.9516168, 0.2974925, -2.283091, 1, 1, 1, 1, 1,
-0.9479402, -0.8470126, -3.065262, 1, 1, 1, 1, 1,
-0.9442991, 0.1732397, -2.271518, 1, 1, 1, 1, 1,
-0.9411638, 0.3911441, -2.157727, 1, 1, 1, 1, 1,
-0.9408194, 0.3332481, -0.9926628, 1, 1, 1, 1, 1,
-0.9395107, 0.5183948, -0.1334381, 1, 1, 1, 1, 1,
-0.9339625, 0.8342638, 0.05853593, 1, 1, 1, 1, 1,
-0.9330251, 0.4508807, 0.01573882, 1, 1, 1, 1, 1,
-0.9189818, -0.1712461, -2.584975, 1, 1, 1, 1, 1,
-0.9183, 0.8558318, 0.2528355, 1, 1, 1, 1, 1,
-0.9155677, -1.013855, -2.821033, 1, 1, 1, 1, 1,
-0.9149984, 0.7742646, 0.6087219, 0, 0, 1, 1, 1,
-0.9132772, 0.3232756, -1.972233, 1, 0, 0, 1, 1,
-0.909692, 0.3101267, -0.9350058, 1, 0, 0, 1, 1,
-0.9018906, 0.7498366, 0.7190661, 1, 0, 0, 1, 1,
-0.8960339, -0.9472491, -2.709777, 1, 0, 0, 1, 1,
-0.8937574, -0.2675453, -2.544327, 1, 0, 0, 1, 1,
-0.8932888, 0.167154, -0.680933, 0, 0, 0, 1, 1,
-0.890675, 0.1000852, -1.507012, 0, 0, 0, 1, 1,
-0.8881476, 1.313436, -0.9730648, 0, 0, 0, 1, 1,
-0.8848606, -0.5623865, -2.876326, 0, 0, 0, 1, 1,
-0.8848242, 0.2927252, -2.445895, 0, 0, 0, 1, 1,
-0.8816157, -1.826777, -3.846363, 0, 0, 0, 1, 1,
-0.8731792, 0.2550803, 0.3331129, 0, 0, 0, 1, 1,
-0.8718341, -0.511465, -1.976431, 1, 1, 1, 1, 1,
-0.8704936, 0.7241849, -1.200294, 1, 1, 1, 1, 1,
-0.8680278, 0.8208773, -1.131537, 1, 1, 1, 1, 1,
-0.8675731, -0.6759422, -3.182398, 1, 1, 1, 1, 1,
-0.8670727, -0.01069484, -1.368633, 1, 1, 1, 1, 1,
-0.863851, 0.8453753, -2.058998, 1, 1, 1, 1, 1,
-0.8625526, 0.3270834, -1.532225, 1, 1, 1, 1, 1,
-0.8601237, -0.1083772, -0.4247549, 1, 1, 1, 1, 1,
-0.8573846, -1.321631, -3.109599, 1, 1, 1, 1, 1,
-0.8551462, -0.3723685, -1.04151, 1, 1, 1, 1, 1,
-0.8538885, -1.047669, -0.6763679, 1, 1, 1, 1, 1,
-0.8529968, 0.8971943, -0.6904762, 1, 1, 1, 1, 1,
-0.8513451, -0.2130749, -2.316604, 1, 1, 1, 1, 1,
-0.8385289, 0.1255925, -1.940193, 1, 1, 1, 1, 1,
-0.8373435, -1.177893, -1.722276, 1, 1, 1, 1, 1,
-0.8327254, 1.413829, -0.8184592, 0, 0, 1, 1, 1,
-0.8301449, 0.7528331, -1.944142, 1, 0, 0, 1, 1,
-0.8263692, 0.1601115, -1.841233, 1, 0, 0, 1, 1,
-0.8262875, -0.8589831, -1.262193, 1, 0, 0, 1, 1,
-0.8161265, 0.8978787, -0.9686888, 1, 0, 0, 1, 1,
-0.8158235, -0.09597753, -3.318828, 1, 0, 0, 1, 1,
-0.8143235, 2.827587, -0.8644676, 0, 0, 0, 1, 1,
-0.813763, 0.7703753, -1.98034, 0, 0, 0, 1, 1,
-0.8102793, -0.1797233, -2.311821, 0, 0, 0, 1, 1,
-0.808845, -0.3445415, -2.214676, 0, 0, 0, 1, 1,
-0.8082697, -0.004364415, -2.206919, 0, 0, 0, 1, 1,
-0.8036742, -1.343887, -2.334483, 0, 0, 0, 1, 1,
-0.8033416, 0.6003499, -4.052097, 0, 0, 0, 1, 1,
-0.7900066, -0.9734813, -0.5011754, 1, 1, 1, 1, 1,
-0.7862884, 1.357645, 1.321646, 1, 1, 1, 1, 1,
-0.7858979, -0.8352157, -1.373526, 1, 1, 1, 1, 1,
-0.7764555, -0.821896, -3.645272, 1, 1, 1, 1, 1,
-0.7755591, 0.9418442, -1.696711, 1, 1, 1, 1, 1,
-0.7714838, 0.06887025, -0.1760959, 1, 1, 1, 1, 1,
-0.770835, -0.3515653, -1.543644, 1, 1, 1, 1, 1,
-0.7701086, 1.546319, -2.278073, 1, 1, 1, 1, 1,
-0.7692276, 1.774641, 1.345284, 1, 1, 1, 1, 1,
-0.7596517, 0.5942092, -1.253402, 1, 1, 1, 1, 1,
-0.7556801, 0.7532608, -0.8482882, 1, 1, 1, 1, 1,
-0.7517319, -0.8521851, -1.866106, 1, 1, 1, 1, 1,
-0.7500113, 0.8522693, -1.6905, 1, 1, 1, 1, 1,
-0.7495811, -0.9759835, -1.965675, 1, 1, 1, 1, 1,
-0.744509, -0.02902482, -0.9761357, 1, 1, 1, 1, 1,
-0.7391992, 0.8478215, 1.152676, 0, 0, 1, 1, 1,
-0.7376963, -0.1383344, -1.336953, 1, 0, 0, 1, 1,
-0.7343575, 0.6846561, -0.2334609, 1, 0, 0, 1, 1,
-0.728244, 0.84702, -1.302249, 1, 0, 0, 1, 1,
-0.7280139, 0.5865425, -1.367956, 1, 0, 0, 1, 1,
-0.7258629, 0.0315797, -1.275291, 1, 0, 0, 1, 1,
-0.7252534, 1.960151, -0.5278469, 0, 0, 0, 1, 1,
-0.7246546, -0.5111127, -1.307725, 0, 0, 0, 1, 1,
-0.7223662, -0.5084406, -2.542863, 0, 0, 0, 1, 1,
-0.7216985, 0.9630243, 0.02201251, 0, 0, 0, 1, 1,
-0.7119068, -0.2907408, -2.040833, 0, 0, 0, 1, 1,
-0.7061673, -0.5511885, -0.2889327, 0, 0, 0, 1, 1,
-0.7038018, 1.690794, -0.2388264, 0, 0, 0, 1, 1,
-0.7035984, 1.025235, -0.2849557, 1, 1, 1, 1, 1,
-0.703558, -0.5586162, -1.683053, 1, 1, 1, 1, 1,
-0.7022733, 0.7798827, -1.001876, 1, 1, 1, 1, 1,
-0.7022497, -1.005889, -2.814166, 1, 1, 1, 1, 1,
-0.7003559, 0.09876561, -2.914912, 1, 1, 1, 1, 1,
-0.6965341, 0.685324, -0.7217956, 1, 1, 1, 1, 1,
-0.6959341, -0.009825844, -0.6821186, 1, 1, 1, 1, 1,
-0.6811946, 1.7228, -1.969105, 1, 1, 1, 1, 1,
-0.6777061, 0.8830999, -0.2977587, 1, 1, 1, 1, 1,
-0.6684909, -0.2845169, -2.23127, 1, 1, 1, 1, 1,
-0.6551849, 1.062651, -0.8266212, 1, 1, 1, 1, 1,
-0.6548862, 0.0322032, -2.929558, 1, 1, 1, 1, 1,
-0.6548238, 0.7481012, -2.192106, 1, 1, 1, 1, 1,
-0.6538581, 0.7063872, -1.145799, 1, 1, 1, 1, 1,
-0.6511647, -1.514037, -1.996751, 1, 1, 1, 1, 1,
-0.646307, -1.918072, -1.523833, 0, 0, 1, 1, 1,
-0.6402987, -0.2746927, -1.553117, 1, 0, 0, 1, 1,
-0.6377171, -0.153387, -2.719402, 1, 0, 0, 1, 1,
-0.6310722, -1.094856, -1.301391, 1, 0, 0, 1, 1,
-0.626351, -1.041067, -3.43841, 1, 0, 0, 1, 1,
-0.6260075, 0.06322806, -1.346397, 1, 0, 0, 1, 1,
-0.6213211, 1.086574, -0.5561945, 0, 0, 0, 1, 1,
-0.617393, -0.3396087, -3.544161, 0, 0, 0, 1, 1,
-0.6147586, -0.6906404, -3.629014, 0, 0, 0, 1, 1,
-0.6146935, -0.5948626, -1.461518, 0, 0, 0, 1, 1,
-0.612819, -1.132612, -3.343118, 0, 0, 0, 1, 1,
-0.6124932, -0.3296537, -2.902674, 0, 0, 0, 1, 1,
-0.6071372, 1.47515, 1.926906, 0, 0, 0, 1, 1,
-0.6043596, 0.9616326, -0.6193459, 1, 1, 1, 1, 1,
-0.6036255, 0.7446308, -0.6298556, 1, 1, 1, 1, 1,
-0.6031615, -1.016817, -3.298129, 1, 1, 1, 1, 1,
-0.5998326, 2.28941, 0.9958286, 1, 1, 1, 1, 1,
-0.5990642, -1.740514, -3.611744, 1, 1, 1, 1, 1,
-0.5970327, 0.8457305, -1.210517, 1, 1, 1, 1, 1,
-0.5944576, -0.003915333, -1.377689, 1, 1, 1, 1, 1,
-0.5853371, -0.02955985, -1.394729, 1, 1, 1, 1, 1,
-0.5816949, 0.20327, -2.000964, 1, 1, 1, 1, 1,
-0.5800126, -0.8280331, -3.500391, 1, 1, 1, 1, 1,
-0.5708115, 1.666066, 0.6097504, 1, 1, 1, 1, 1,
-0.5681226, 0.6429893, -1.287192, 1, 1, 1, 1, 1,
-0.5675917, -0.06552912, -2.775748, 1, 1, 1, 1, 1,
-0.5634585, 1.068762, -0.7547163, 1, 1, 1, 1, 1,
-0.5562536, 0.02749003, -1.835672, 1, 1, 1, 1, 1,
-0.5555769, 0.003128716, -1.133947, 0, 0, 1, 1, 1,
-0.5553629, -0.753329, -0.1442247, 1, 0, 0, 1, 1,
-0.5541969, -0.7242873, -2.748284, 1, 0, 0, 1, 1,
-0.5533512, 1.180686, -1.73218, 1, 0, 0, 1, 1,
-0.5529125, 1.012815, -1.779484, 1, 0, 0, 1, 1,
-0.548822, -1.199846, -2.965833, 1, 0, 0, 1, 1,
-0.548523, -1.304536, -1.35725, 0, 0, 0, 1, 1,
-0.5436594, 1.034276, -2.379726, 0, 0, 0, 1, 1,
-0.5384301, 0.3976074, 0.7970316, 0, 0, 0, 1, 1,
-0.5295148, -0.2874705, -3.621788, 0, 0, 0, 1, 1,
-0.5289367, 1.419002, -1.369094, 0, 0, 0, 1, 1,
-0.5288802, -0.09308635, -2.304443, 0, 0, 0, 1, 1,
-0.5278432, -1.949892, -2.262012, 0, 0, 0, 1, 1,
-0.5269602, 1.078585, 0.7239846, 1, 1, 1, 1, 1,
-0.5262658, 1.111401, -0.4253089, 1, 1, 1, 1, 1,
-0.5242067, -0.06221384, -1.513898, 1, 1, 1, 1, 1,
-0.5213149, 0.976509, 0.5465005, 1, 1, 1, 1, 1,
-0.5201948, 0.5826694, -1.261089, 1, 1, 1, 1, 1,
-0.5195029, -0.8891424, -2.660447, 1, 1, 1, 1, 1,
-0.517427, -0.01312061, -1.630805, 1, 1, 1, 1, 1,
-0.516508, -1.680372, -3.311367, 1, 1, 1, 1, 1,
-0.5129906, -1.325065, -3.535136, 1, 1, 1, 1, 1,
-0.5097473, -0.6428231, -3.688641, 1, 1, 1, 1, 1,
-0.5082207, 1.292987, 1.470666, 1, 1, 1, 1, 1,
-0.5002427, -0.7682247, -3.281346, 1, 1, 1, 1, 1,
-0.4985406, -0.2823557, -0.6590332, 1, 1, 1, 1, 1,
-0.4979461, 0.3551385, -0.174038, 1, 1, 1, 1, 1,
-0.4953537, 1.24106, -2.79912, 1, 1, 1, 1, 1,
-0.4948451, 0.3193478, 0.9624391, 0, 0, 1, 1, 1,
-0.4947626, 1.443081, 0.6483369, 1, 0, 0, 1, 1,
-0.4937425, -0.6710923, -1.622668, 1, 0, 0, 1, 1,
-0.4934719, 0.6038357, 0.8098263, 1, 0, 0, 1, 1,
-0.4915751, -0.9986442, -2.624443, 1, 0, 0, 1, 1,
-0.4909539, 0.4025502, -1.813788, 1, 0, 0, 1, 1,
-0.487271, 0.7175512, -1.686383, 0, 0, 0, 1, 1,
-0.4855794, -0.760374, -3.009823, 0, 0, 0, 1, 1,
-0.4797534, -1.580974, -1.880655, 0, 0, 0, 1, 1,
-0.4758443, -0.7413073, -2.107077, 0, 0, 0, 1, 1,
-0.4748917, 0.5644286, 0.8072746, 0, 0, 0, 1, 1,
-0.4726892, -1.188689, -3.301824, 0, 0, 0, 1, 1,
-0.4642348, 2.314084, -0.3054997, 0, 0, 0, 1, 1,
-0.459166, -0.7837333, -1.964775, 1, 1, 1, 1, 1,
-0.4582555, 0.008307779, -0.3371746, 1, 1, 1, 1, 1,
-0.4567806, 0.2349994, -0.2880818, 1, 1, 1, 1, 1,
-0.4563672, 1.620323, -1.212949, 1, 1, 1, 1, 1,
-0.4506133, 0.978726, -1.077561, 1, 1, 1, 1, 1,
-0.4478634, 0.6278922, -0.966463, 1, 1, 1, 1, 1,
-0.4453699, 0.3196284, -0.4680491, 1, 1, 1, 1, 1,
-0.4440838, -1.256656, -2.183566, 1, 1, 1, 1, 1,
-0.4374492, 0.6854705, -0.2990262, 1, 1, 1, 1, 1,
-0.4370796, 1.319579, 0.3880698, 1, 1, 1, 1, 1,
-0.4368099, 0.1475893, -2.329586, 1, 1, 1, 1, 1,
-0.4329358, -0.5999613, -4.116132, 1, 1, 1, 1, 1,
-0.4328668, 0.03545427, 0.154752, 1, 1, 1, 1, 1,
-0.430486, 0.6669297, -2.100307, 1, 1, 1, 1, 1,
-0.4288296, -1.375961, -2.632708, 1, 1, 1, 1, 1,
-0.4165785, 0.3040163, -0.8404722, 0, 0, 1, 1, 1,
-0.4161484, -3.327388, -2.603726, 1, 0, 0, 1, 1,
-0.4125127, -0.7183991, -2.537403, 1, 0, 0, 1, 1,
-0.4120279, -0.07509814, -2.133785, 1, 0, 0, 1, 1,
-0.4120247, 0.3339389, -1.581929, 1, 0, 0, 1, 1,
-0.4082701, -0.4164065, -0.7222037, 1, 0, 0, 1, 1,
-0.4067819, -0.5609502, -3.74408, 0, 0, 0, 1, 1,
-0.4051787, -0.4238763, -1.600831, 0, 0, 0, 1, 1,
-0.3968662, -0.2028784, -1.955965, 0, 0, 0, 1, 1,
-0.3930182, 0.3818666, 0.2319085, 0, 0, 0, 1, 1,
-0.3874631, -0.3387398, -2.111735, 0, 0, 0, 1, 1,
-0.3734295, -0.3481604, -2.132045, 0, 0, 0, 1, 1,
-0.3730725, 0.742924, 0.1999221, 0, 0, 0, 1, 1,
-0.3650325, -0.1798853, -1.25769, 1, 1, 1, 1, 1,
-0.3591274, -0.8631392, -2.034648, 1, 1, 1, 1, 1,
-0.3576698, -3.189676, -2.385544, 1, 1, 1, 1, 1,
-0.3562308, -0.08578859, -2.536679, 1, 1, 1, 1, 1,
-0.3551523, -1.007505, -1.673884, 1, 1, 1, 1, 1,
-0.3538656, 1.312849, -0.243325, 1, 1, 1, 1, 1,
-0.3501265, -1.24796, -3.32936, 1, 1, 1, 1, 1,
-0.3441975, 1.402413, -0.2266491, 1, 1, 1, 1, 1,
-0.3375217, -1.148858, -2.620366, 1, 1, 1, 1, 1,
-0.3312948, -1.593626, -2.531105, 1, 1, 1, 1, 1,
-0.331024, 0.439364, -0.1860974, 1, 1, 1, 1, 1,
-0.3279393, -0.3768996, -1.976658, 1, 1, 1, 1, 1,
-0.3272981, 1.964797, 1.114718, 1, 1, 1, 1, 1,
-0.3193453, 1.392671, -0.3725169, 1, 1, 1, 1, 1,
-0.3146923, -2.099907, -3.685118, 1, 1, 1, 1, 1,
-0.3146901, 0.3482992, 0.1819318, 0, 0, 1, 1, 1,
-0.311126, -1.059995, -2.797132, 1, 0, 0, 1, 1,
-0.3092281, 0.4368099, -0.2108236, 1, 0, 0, 1, 1,
-0.3072054, -0.4121792, -0.907268, 1, 0, 0, 1, 1,
-0.3057469, 0.4015361, -1.347614, 1, 0, 0, 1, 1,
-0.3036542, -0.6551681, -1.616027, 1, 0, 0, 1, 1,
-0.3032571, 1.30676, 0.5276688, 0, 0, 0, 1, 1,
-0.3011258, 0.6849653, 0.4483136, 0, 0, 0, 1, 1,
-0.2978513, 0.5797897, 0.2317486, 0, 0, 0, 1, 1,
-0.2976152, -1.170976, -3.011583, 0, 0, 0, 1, 1,
-0.2969249, -1.960279, -2.944138, 0, 0, 0, 1, 1,
-0.2960784, -0.2186189, -3.968048, 0, 0, 0, 1, 1,
-0.2947086, -1.9649, -2.77031, 0, 0, 0, 1, 1,
-0.285723, -0.8275183, -3.967371, 1, 1, 1, 1, 1,
-0.2852694, -1.129778, -2.82863, 1, 1, 1, 1, 1,
-0.2837529, -1.722224, -3.584082, 1, 1, 1, 1, 1,
-0.2828265, 0.1985682, -2.002408, 1, 1, 1, 1, 1,
-0.277614, 0.661433, -0.1602212, 1, 1, 1, 1, 1,
-0.275622, -0.3391309, -3.011513, 1, 1, 1, 1, 1,
-0.2682956, 0.08029983, -2.142063, 1, 1, 1, 1, 1,
-0.2602805, -0.2447535, -3.286269, 1, 1, 1, 1, 1,
-0.2549091, -1.313947, -2.496801, 1, 1, 1, 1, 1,
-0.2478867, -1.91704, -3.477504, 1, 1, 1, 1, 1,
-0.2457725, 0.5478196, -0.9018931, 1, 1, 1, 1, 1,
-0.241078, -0.7137809, -3.312447, 1, 1, 1, 1, 1,
-0.2374649, -0.180873, -1.474862, 1, 1, 1, 1, 1,
-0.2348246, 0.04084394, -1.074958, 1, 1, 1, 1, 1,
-0.2346598, 0.8867249, -1.24086, 1, 1, 1, 1, 1,
-0.2338527, 1.010252, -1.294392, 0, 0, 1, 1, 1,
-0.2241919, -1.488018, -3.911304, 1, 0, 0, 1, 1,
-0.2239454, -0.5903243, -3.606137, 1, 0, 0, 1, 1,
-0.2223711, 0.891, 0.1819497, 1, 0, 0, 1, 1,
-0.2204614, 0.6233076, 0.07529228, 1, 0, 0, 1, 1,
-0.2192508, 0.2835256, -0.6298179, 1, 0, 0, 1, 1,
-0.2179125, -2.720043, -2.729705, 0, 0, 0, 1, 1,
-0.2117602, -0.4450752, -3.829009, 0, 0, 0, 1, 1,
-0.2027326, -1.656302, -3.31184, 0, 0, 0, 1, 1,
-0.2021063, 0.7427742, -2.248775, 0, 0, 0, 1, 1,
-0.201808, -0.6955419, -3.832669, 0, 0, 0, 1, 1,
-0.1962896, -0.9373558, -4.442003, 0, 0, 0, 1, 1,
-0.1956796, -0.460353, -2.473423, 0, 0, 0, 1, 1,
-0.1889214, 0.1263936, -0.4834275, 1, 1, 1, 1, 1,
-0.1874965, 0.02883049, -1.487629, 1, 1, 1, 1, 1,
-0.1843741, -0.9421296, -3.701663, 1, 1, 1, 1, 1,
-0.1829617, 0.1261268, -1.616539, 1, 1, 1, 1, 1,
-0.1759861, 0.9830465, 0.130702, 1, 1, 1, 1, 1,
-0.1749438, 0.07665797, -1.828221, 1, 1, 1, 1, 1,
-0.1686649, -0.2155577, -4.527751, 1, 1, 1, 1, 1,
-0.1682395, 0.370424, 0.4905596, 1, 1, 1, 1, 1,
-0.1675091, -0.02919097, -2.102592, 1, 1, 1, 1, 1,
-0.1673834, -0.7370661, -3.80845, 1, 1, 1, 1, 1,
-0.1614475, -0.1760497, -1.138474, 1, 1, 1, 1, 1,
-0.156753, -0.923543, -2.975136, 1, 1, 1, 1, 1,
-0.1468065, -0.2337299, -4.412453, 1, 1, 1, 1, 1,
-0.1405865, -1.55638, -3.669057, 1, 1, 1, 1, 1,
-0.1373541, 0.5002797, 0.9700797, 1, 1, 1, 1, 1,
-0.1335858, 0.1257027, -1.326327, 0, 0, 1, 1, 1,
-0.1327887, 0.2057451, -1.517398, 1, 0, 0, 1, 1,
-0.1319183, 0.2484109, -1.349158, 1, 0, 0, 1, 1,
-0.1259985, 0.6042246, -1.301218, 1, 0, 0, 1, 1,
-0.1245905, 0.1661673, -0.01237133, 1, 0, 0, 1, 1,
-0.1241942, 0.6105638, -0.4390842, 1, 0, 0, 1, 1,
-0.1228869, 0.4380993, -0.7237542, 0, 0, 0, 1, 1,
-0.1191745, -0.05617446, -1.748308, 0, 0, 0, 1, 1,
-0.1148923, 2.138988, -0.3227457, 0, 0, 0, 1, 1,
-0.1102147, 0.9342247, 0.1842063, 0, 0, 0, 1, 1,
-0.1082049, 0.1332245, -0.2357999, 0, 0, 0, 1, 1,
-0.1062622, -0.06599776, -1.882121, 0, 0, 0, 1, 1,
-0.1037844, -0.5671549, -3.650167, 0, 0, 0, 1, 1,
-0.0993259, -2.055131, -3.621511, 1, 1, 1, 1, 1,
-0.0990788, 0.3363979, -0.2964836, 1, 1, 1, 1, 1,
-0.09854019, 1.646356, 0.4102859, 1, 1, 1, 1, 1,
-0.09654441, 0.3631071, -0.2289383, 1, 1, 1, 1, 1,
-0.09544932, -0.8672744, -3.848628, 1, 1, 1, 1, 1,
-0.09371851, -0.6373153, -3.772188, 1, 1, 1, 1, 1,
-0.0895631, -0.4894257, -1.755118, 1, 1, 1, 1, 1,
-0.08950341, -0.3961027, -4.138216, 1, 1, 1, 1, 1,
-0.07785994, 0.3647097, -0.487853, 1, 1, 1, 1, 1,
-0.07583424, 1.251226, -0.2079345, 1, 1, 1, 1, 1,
-0.07487937, -0.1723347, -1.156942, 1, 1, 1, 1, 1,
-0.06492341, -0.1891569, -1.585755, 1, 1, 1, 1, 1,
-0.06414735, -0.5664504, -1.598341, 1, 1, 1, 1, 1,
-0.05798914, 2.301152, -0.6476232, 1, 1, 1, 1, 1,
-0.05440228, 0.711699, -1.170363, 1, 1, 1, 1, 1,
-0.05362292, -0.6509193, -1.867244, 0, 0, 1, 1, 1,
-0.05343901, -0.501811, -5.755868, 1, 0, 0, 1, 1,
-0.05058352, -1.883808, -1.950563, 1, 0, 0, 1, 1,
-0.0495691, -0.460086, -3.364252, 1, 0, 0, 1, 1,
-0.04673117, -0.7790588, -4.021026, 1, 0, 0, 1, 1,
-0.04566202, -1.357769, -3.992728, 1, 0, 0, 1, 1,
-0.04445426, 0.03548482, -1.773764, 0, 0, 0, 1, 1,
-0.0422338, -0.2104008, -2.60097, 0, 0, 0, 1, 1,
-0.03882779, 0.5202401, 0.4306282, 0, 0, 0, 1, 1,
-0.03771766, -0.4498614, -2.22948, 0, 0, 0, 1, 1,
-0.03526238, -0.4415923, -1.897754, 0, 0, 0, 1, 1,
-0.03524832, 0.4979827, -1.56204, 0, 0, 0, 1, 1,
-0.03464151, -0.8289769, -0.7883037, 0, 0, 0, 1, 1,
-0.03291414, 0.8336235, 1.150303, 1, 1, 1, 1, 1,
-0.03286323, 1.074718, 0.1056864, 1, 1, 1, 1, 1,
-0.02962223, 0.0768702, -0.6833748, 1, 1, 1, 1, 1,
-0.02788609, -0.9320853, -3.696238, 1, 1, 1, 1, 1,
-0.02236595, -0.549952, -1.776517, 1, 1, 1, 1, 1,
-0.01978105, 0.2017896, 1.187492, 1, 1, 1, 1, 1,
-0.0185703, -1.223499, -4.637704, 1, 1, 1, 1, 1,
-0.01440032, 0.03911345, 0.362949, 1, 1, 1, 1, 1,
-0.01153505, 0.9015553, 0.5199879, 1, 1, 1, 1, 1,
-0.01113399, 1.233043, 0.6010672, 1, 1, 1, 1, 1,
-0.00716287, 0.2178081, -0.5344207, 1, 1, 1, 1, 1,
-0.006664296, -1.909927, -2.550171, 1, 1, 1, 1, 1,
-0.0002996573, 0.2618954, -1.226365, 1, 1, 1, 1, 1,
0.006304911, -0.08625685, 2.375373, 1, 1, 1, 1, 1,
0.01146602, -0.9212784, 3.182002, 1, 1, 1, 1, 1,
0.01246115, -1.413621, 5.28918, 0, 0, 1, 1, 1,
0.01590184, 0.9184957, -0.4934309, 1, 0, 0, 1, 1,
0.01941125, 0.2051224, -0.2834944, 1, 0, 0, 1, 1,
0.02827542, 1.135284, 1.256793, 1, 0, 0, 1, 1,
0.02835481, 0.3651138, -0.4161156, 1, 0, 0, 1, 1,
0.03162976, 0.5235393, 0.2580471, 1, 0, 0, 1, 1,
0.03458642, 0.5032393, -0.7720429, 0, 0, 0, 1, 1,
0.03462751, -0.4306761, 3.611146, 0, 0, 0, 1, 1,
0.03504947, 0.4025062, 0.07696339, 0, 0, 0, 1, 1,
0.03545909, -1.162633, 3.104951, 0, 0, 0, 1, 1,
0.03574352, -0.1229999, 2.184819, 0, 0, 0, 1, 1,
0.03576913, 0.1139738, -0.8819531, 0, 0, 0, 1, 1,
0.03754719, -0.6790048, 3.090352, 0, 0, 0, 1, 1,
0.0389743, -0.6684013, 3.845468, 1, 1, 1, 1, 1,
0.0396786, 0.6160021, 0.6070762, 1, 1, 1, 1, 1,
0.04023349, -0.2389, 3.881487, 1, 1, 1, 1, 1,
0.04758302, -0.3666687, 3.039057, 1, 1, 1, 1, 1,
0.05014959, -0.02963891, 2.406179, 1, 1, 1, 1, 1,
0.0540772, -1.393768, 3.296163, 1, 1, 1, 1, 1,
0.05620749, -1.289046, 3.945988, 1, 1, 1, 1, 1,
0.05886915, 1.424717, -0.3536224, 1, 1, 1, 1, 1,
0.06147246, -0.6658162, 4.974556, 1, 1, 1, 1, 1,
0.06454658, 0.173983, -0.07741832, 1, 1, 1, 1, 1,
0.06853843, 0.06401768, -1.042297, 1, 1, 1, 1, 1,
0.07434999, 1.406234, -1.106845, 1, 1, 1, 1, 1,
0.07530587, -0.7687717, 3.74073, 1, 1, 1, 1, 1,
0.07644554, -0.8664113, 1.137329, 1, 1, 1, 1, 1,
0.07675908, -0.3250998, 3.121158, 1, 1, 1, 1, 1,
0.07688517, 1.188299, 0.4559327, 0, 0, 1, 1, 1,
0.07748715, -1.099604, 3.970268, 1, 0, 0, 1, 1,
0.08237942, 1.237564, 0.6328183, 1, 0, 0, 1, 1,
0.08247499, -0.8406501, 3.671423, 1, 0, 0, 1, 1,
0.0824986, 2.644348, -1.329864, 1, 0, 0, 1, 1,
0.08775322, 2.103745, -0.4837253, 1, 0, 0, 1, 1,
0.09349546, -0.984255, 3.306167, 0, 0, 0, 1, 1,
0.0944005, -0.03208453, 1.179395, 0, 0, 0, 1, 1,
0.09452838, -0.7696055, 2.436541, 0, 0, 0, 1, 1,
0.09572946, -0.02141046, 0.8961941, 0, 0, 0, 1, 1,
0.09609454, 0.09350418, -0.2108564, 0, 0, 0, 1, 1,
0.1024066, -2.376037, 4.703346, 0, 0, 0, 1, 1,
0.1031222, 0.3523079, 1.843018, 0, 0, 0, 1, 1,
0.1050316, 0.8919274, -0.808821, 1, 1, 1, 1, 1,
0.1058892, -1.767347, 3.782965, 1, 1, 1, 1, 1,
0.1082749, 0.5462244, 0.7817677, 1, 1, 1, 1, 1,
0.112218, 0.4512918, 1.552628, 1, 1, 1, 1, 1,
0.1138729, 0.7763112, -0.3506874, 1, 1, 1, 1, 1,
0.1143491, 1.023639, 0.6059545, 1, 1, 1, 1, 1,
0.1143696, 0.9523856, 1.127825, 1, 1, 1, 1, 1,
0.1153618, -0.05935695, 1.908003, 1, 1, 1, 1, 1,
0.1224555, -1.476789, 3.649734, 1, 1, 1, 1, 1,
0.1274936, -1.225791, 3.283658, 1, 1, 1, 1, 1,
0.1280852, 0.527497, 0.5072419, 1, 1, 1, 1, 1,
0.1286083, -0.3833702, 2.458388, 1, 1, 1, 1, 1,
0.1310661, 1.049322, 0.07801861, 1, 1, 1, 1, 1,
0.1320051, -0.1337045, 3.834362, 1, 1, 1, 1, 1,
0.1396742, 0.7491234, -0.7101293, 1, 1, 1, 1, 1,
0.1452236, 1.177795, -1.033636, 0, 0, 1, 1, 1,
0.147157, 0.1054215, 0.3949864, 1, 0, 0, 1, 1,
0.1488577, 1.462216, 0.3088112, 1, 0, 0, 1, 1,
0.1498942, 0.1440424, 1.982009, 1, 0, 0, 1, 1,
0.1501103, 0.9585009, 0.7219202, 1, 0, 0, 1, 1,
0.1501675, 0.7021661, 0.6449596, 1, 0, 0, 1, 1,
0.1528818, 0.6838254, 0.2517884, 0, 0, 0, 1, 1,
0.1543906, 1.095416, -0.3467052, 0, 0, 0, 1, 1,
0.1553108, 1.110076, 0.9797949, 0, 0, 0, 1, 1,
0.1560621, -0.8508634, 2.705968, 0, 0, 0, 1, 1,
0.1581829, 1.063291, 1.753132, 0, 0, 0, 1, 1,
0.1637597, -0.6621959, 1.522931, 0, 0, 0, 1, 1,
0.1689867, -0.5706648, 1.287891, 0, 0, 0, 1, 1,
0.1695188, -0.5798888, 4.317774, 1, 1, 1, 1, 1,
0.172823, -1.169869, 2.032608, 1, 1, 1, 1, 1,
0.1747224, -1.255142, 3.641542, 1, 1, 1, 1, 1,
0.1829011, -1.45298, 3.22051, 1, 1, 1, 1, 1,
0.1871822, 2.399329, 0.04911472, 1, 1, 1, 1, 1,
0.1892392, 1.745036, 0.2423912, 1, 1, 1, 1, 1,
0.1922284, 0.01671552, 1.33263, 1, 1, 1, 1, 1,
0.1995027, -0.505859, 2.707764, 1, 1, 1, 1, 1,
0.1996725, 0.1666882, 0.9939932, 1, 1, 1, 1, 1,
0.2063212, 0.8260994, 0.2802133, 1, 1, 1, 1, 1,
0.2087167, -0.6930963, 2.590608, 1, 1, 1, 1, 1,
0.2099358, -1.671361, 2.47908, 1, 1, 1, 1, 1,
0.2110712, 0.7808567, -0.356433, 1, 1, 1, 1, 1,
0.2160776, 1.4274, 0.9212912, 1, 1, 1, 1, 1,
0.2164211, 0.4421462, -0.3566426, 1, 1, 1, 1, 1,
0.2218338, 1.983501, 0.1983932, 0, 0, 1, 1, 1,
0.2225417, -1.584228, 3.071688, 1, 0, 0, 1, 1,
0.2233986, -1.49661, 4.716134, 1, 0, 0, 1, 1,
0.2261646, -1.122379, 1.607843, 1, 0, 0, 1, 1,
0.2311446, 0.706385, -0.5578901, 1, 0, 0, 1, 1,
0.2320016, 0.4171481, 0.5898423, 1, 0, 0, 1, 1,
0.2327316, 2.85555, -0.01965315, 0, 0, 0, 1, 1,
0.2328821, -0.02995906, 2.441672, 0, 0, 0, 1, 1,
0.2338001, -0.7962561, 1.815171, 0, 0, 0, 1, 1,
0.2351181, -1.639248, 2.653934, 0, 0, 0, 1, 1,
0.2406373, 0.5746515, -2.572998, 0, 0, 0, 1, 1,
0.2417372, -0.5904341, 2.438932, 0, 0, 0, 1, 1,
0.2465727, 0.3885024, 1.180145, 0, 0, 0, 1, 1,
0.2552069, -0.03077561, 2.990995, 1, 1, 1, 1, 1,
0.257819, 2.022659, 1.369388, 1, 1, 1, 1, 1,
0.2581215, -0.959483, 1.268604, 1, 1, 1, 1, 1,
0.2655016, -0.3507971, 3.212049, 1, 1, 1, 1, 1,
0.2664181, -0.7021368, 1.653, 1, 1, 1, 1, 1,
0.2702619, 0.1086268, 1.71865, 1, 1, 1, 1, 1,
0.2707593, -0.006719822, 1.41996, 1, 1, 1, 1, 1,
0.2729529, -0.1264764, 0.2154321, 1, 1, 1, 1, 1,
0.2757076, 0.4318824, 1.351859, 1, 1, 1, 1, 1,
0.2766324, 0.942686, 2.095357, 1, 1, 1, 1, 1,
0.2783317, -0.570415, 2.063628, 1, 1, 1, 1, 1,
0.281926, 0.7507655, -0.4646236, 1, 1, 1, 1, 1,
0.2840569, -1.219292, 2.152642, 1, 1, 1, 1, 1,
0.2874257, 0.7320544, -2.085536, 1, 1, 1, 1, 1,
0.2896301, -0.9365193, 3.067594, 1, 1, 1, 1, 1,
0.2901376, 0.5785957, 0.9498397, 0, 0, 1, 1, 1,
0.2966861, -0.8203993, 4.072275, 1, 0, 0, 1, 1,
0.2998823, 0.2251353, 0.9418549, 1, 0, 0, 1, 1,
0.3001989, 1.214674, -1.044534, 1, 0, 0, 1, 1,
0.3071764, -0.6326903, 2.387713, 1, 0, 0, 1, 1,
0.3100559, 0.1207998, 0.3777783, 1, 0, 0, 1, 1,
0.3119146, -0.4167703, 1.896401, 0, 0, 0, 1, 1,
0.3163335, 1.699794, 0.04585931, 0, 0, 0, 1, 1,
0.3169914, 0.5489503, 1.282584, 0, 0, 0, 1, 1,
0.3176987, 1.921863, -0.9400132, 0, 0, 0, 1, 1,
0.318448, 0.1688854, 2.278352, 0, 0, 0, 1, 1,
0.3192631, 1.148318, 1.181882, 0, 0, 0, 1, 1,
0.3243908, 0.4187073, 1.299456, 0, 0, 0, 1, 1,
0.3249308, -0.02304132, 2.609956, 1, 1, 1, 1, 1,
0.3264126, -0.2111637, 2.239692, 1, 1, 1, 1, 1,
0.3279732, 0.4992199, 0.9714063, 1, 1, 1, 1, 1,
0.3297166, 0.129033, 0.5416616, 1, 1, 1, 1, 1,
0.336578, 0.3196276, 1.412039, 1, 1, 1, 1, 1,
0.3375152, 0.9612778, 0.3798188, 1, 1, 1, 1, 1,
0.3385224, -0.3843918, 2.705447, 1, 1, 1, 1, 1,
0.3400205, 0.5705919, 0.2794344, 1, 1, 1, 1, 1,
0.3417029, -1.246701, 1.751147, 1, 1, 1, 1, 1,
0.3451493, 0.4361571, 1.151705, 1, 1, 1, 1, 1,
0.3471249, -1.134248, 2.52875, 1, 1, 1, 1, 1,
0.3508039, -0.4260008, 3.136823, 1, 1, 1, 1, 1,
0.3534912, 0.07598988, 1.956907, 1, 1, 1, 1, 1,
0.3591168, -0.0473598, 0.8893811, 1, 1, 1, 1, 1,
0.3658065, 1.483652, 0.3908021, 1, 1, 1, 1, 1,
0.3683522, -0.4434465, 2.794648, 0, 0, 1, 1, 1,
0.3718222, 0.6552899, 1.447755, 1, 0, 0, 1, 1,
0.3726353, -0.1769569, 2.255585, 1, 0, 0, 1, 1,
0.373234, -1.235964, 2.275864, 1, 0, 0, 1, 1,
0.375697, 1.145185, 0.4206243, 1, 0, 0, 1, 1,
0.3776177, -1.381413, 2.265016, 1, 0, 0, 1, 1,
0.3776997, 0.4299727, 0.9755797, 0, 0, 0, 1, 1,
0.3795712, -0.04841052, 2.331279, 0, 0, 0, 1, 1,
0.3824295, 0.3726946, -1.097214, 0, 0, 0, 1, 1,
0.3833578, 0.5365679, -0.9616735, 0, 0, 0, 1, 1,
0.384495, -1.039304, 4.405891, 0, 0, 0, 1, 1,
0.3952726, 0.7377764, -0.01289577, 0, 0, 0, 1, 1,
0.395593, 0.2784005, -1.207408, 0, 0, 0, 1, 1,
0.4143838, -0.930519, 3.023802, 1, 1, 1, 1, 1,
0.417891, -0.8722264, 1.006188, 1, 1, 1, 1, 1,
0.4186024, -0.2310072, 1.996379, 1, 1, 1, 1, 1,
0.4209654, 0.5463178, -1.40239, 1, 1, 1, 1, 1,
0.4216751, 0.6490713, 0.8717262, 1, 1, 1, 1, 1,
0.4217734, 0.8196287, 1.560835, 1, 1, 1, 1, 1,
0.4262126, 0.5681498, -0.3189145, 1, 1, 1, 1, 1,
0.4283795, 0.5434233, 1.114157, 1, 1, 1, 1, 1,
0.4297754, -0.401358, 1.629427, 1, 1, 1, 1, 1,
0.4317433, 0.07568054, 1.816313, 1, 1, 1, 1, 1,
0.4342672, 0.0192658, 2.207353, 1, 1, 1, 1, 1,
0.4343334, 0.5712276, -0.6041069, 1, 1, 1, 1, 1,
0.4364191, 0.1716561, 2.099451, 1, 1, 1, 1, 1,
0.438523, 0.660772, -0.2700684, 1, 1, 1, 1, 1,
0.4428892, -0.8251145, 1.89409, 1, 1, 1, 1, 1,
0.4440361, 0.02262265, 2.814898, 0, 0, 1, 1, 1,
0.4452997, -0.4114844, 1.89516, 1, 0, 0, 1, 1,
0.4459477, -0.01708171, 2.226409, 1, 0, 0, 1, 1,
0.4485933, 2.433707, -0.7343761, 1, 0, 0, 1, 1,
0.4533992, 1.085201, -1.459189, 1, 0, 0, 1, 1,
0.4545819, -0.851407, 2.40071, 1, 0, 0, 1, 1,
0.4557708, 0.9911689, 1.834943, 0, 0, 0, 1, 1,
0.4581275, -0.45834, 2.275973, 0, 0, 0, 1, 1,
0.4592317, 0.3330846, 0.3932353, 0, 0, 0, 1, 1,
0.4606917, 1.404924, 1.084463, 0, 0, 0, 1, 1,
0.4625165, 0.2681049, 0.297285, 0, 0, 0, 1, 1,
0.4633406, -0.1745737, 2.001586, 0, 0, 0, 1, 1,
0.4646588, 0.4291021, 1.82026, 0, 0, 0, 1, 1,
0.4701438, 1.535648, 0.6559029, 1, 1, 1, 1, 1,
0.4714361, 0.08944896, -0.04942139, 1, 1, 1, 1, 1,
0.4737267, 0.5382317, 2.066197, 1, 1, 1, 1, 1,
0.4742844, 0.7442989, -1.547335, 1, 1, 1, 1, 1,
0.477613, -0.9280831, 2.468465, 1, 1, 1, 1, 1,
0.4776802, 3.080552, 0.2990862, 1, 1, 1, 1, 1,
0.482532, 0.9934236, 0.9962986, 1, 1, 1, 1, 1,
0.4865546, -0.07501828, 1.464503, 1, 1, 1, 1, 1,
0.4925135, 0.2991722, 0.9547887, 1, 1, 1, 1, 1,
0.4930329, 1.110998, 0.6842968, 1, 1, 1, 1, 1,
0.49419, -0.2960758, 1.703164, 1, 1, 1, 1, 1,
0.4943515, 0.3164551, 1.918134, 1, 1, 1, 1, 1,
0.4947433, 0.7593982, 1.684434, 1, 1, 1, 1, 1,
0.4989529, -0.9677418, 1.643611, 1, 1, 1, 1, 1,
0.5105934, 0.5045679, 0.2074278, 1, 1, 1, 1, 1,
0.5122425, 0.6877012, -1.031665, 0, 0, 1, 1, 1,
0.5199229, -0.5926023, 1.304674, 1, 0, 0, 1, 1,
0.5213535, -0.1813824, 3.857794, 1, 0, 0, 1, 1,
0.5272312, -1.76972, 3.024604, 1, 0, 0, 1, 1,
0.5275527, -1.580347, 2.812724, 1, 0, 0, 1, 1,
0.5291297, -1.133356, 2.379426, 1, 0, 0, 1, 1,
0.5342994, -0.1620839, 0.7377829, 0, 0, 0, 1, 1,
0.5395493, -0.6156716, 3.125097, 0, 0, 0, 1, 1,
0.5403965, -0.5222068, 0.5676069, 0, 0, 0, 1, 1,
0.5475627, 0.3637346, 1.12089, 0, 0, 0, 1, 1,
0.5535462, 0.5399439, 0.2728992, 0, 0, 0, 1, 1,
0.5536297, 0.8462155, 0.4046697, 0, 0, 0, 1, 1,
0.5541888, -0.7226963, 3.557339, 0, 0, 0, 1, 1,
0.555778, 0.794965, -0.4520425, 1, 1, 1, 1, 1,
0.5590954, 0.4477046, 1.356258, 1, 1, 1, 1, 1,
0.5633342, 1.612735, -0.1935641, 1, 1, 1, 1, 1,
0.5656711, 1.555846, 1.477586, 1, 1, 1, 1, 1,
0.5690703, -0.9388564, 1.728491, 1, 1, 1, 1, 1,
0.5868264, 0.3324798, 1.186381, 1, 1, 1, 1, 1,
0.5911635, 1.135346, 1.398561, 1, 1, 1, 1, 1,
0.5985889, -1.518691, 3.361363, 1, 1, 1, 1, 1,
0.603888, -0.4163216, 1.920659, 1, 1, 1, 1, 1,
0.6061454, -0.9866683, 3.666449, 1, 1, 1, 1, 1,
0.6107122, -0.348662, 2.706413, 1, 1, 1, 1, 1,
0.6167197, -0.4387765, 1.816544, 1, 1, 1, 1, 1,
0.6198195, 0.4416929, 2.354436, 1, 1, 1, 1, 1,
0.6227596, -1.842148, 3.294314, 1, 1, 1, 1, 1,
0.6318593, -0.1120169, 0.7943526, 1, 1, 1, 1, 1,
0.6328356, -0.3559195, 2.354461, 0, 0, 1, 1, 1,
0.63307, 0.03351224, 2.293218, 1, 0, 0, 1, 1,
0.634682, -0.6000634, 2.412559, 1, 0, 0, 1, 1,
0.6408742, -0.7858483, 2.27698, 1, 0, 0, 1, 1,
0.6411648, 0.66989, 1.334504, 1, 0, 0, 1, 1,
0.6432844, 0.2049785, 0.7237132, 1, 0, 0, 1, 1,
0.6448919, 0.0650843, 1.790645, 0, 0, 0, 1, 1,
0.6458296, 2.972784, -1.058759, 0, 0, 0, 1, 1,
0.6515512, 0.8908799, 0.2781335, 0, 0, 0, 1, 1,
0.6641992, 1.190711, -0.7616203, 0, 0, 0, 1, 1,
0.6663558, -0.7621601, 1.620639, 0, 0, 0, 1, 1,
0.6717552, 0.5808878, -0.3737161, 0, 0, 0, 1, 1,
0.6726733, -1.379441, 3.018088, 0, 0, 0, 1, 1,
0.6737288, -0.6973782, 2.918938, 1, 1, 1, 1, 1,
0.6742805, 0.6254382, 0.4885622, 1, 1, 1, 1, 1,
0.6771343, 1.366639, -0.1984778, 1, 1, 1, 1, 1,
0.6801591, -1.135438, 2.91295, 1, 1, 1, 1, 1,
0.6811709, -0.09038655, 0.8549045, 1, 1, 1, 1, 1,
0.6852821, 1.135239, 0.1236162, 1, 1, 1, 1, 1,
0.6897697, 0.3125829, 3.555366, 1, 1, 1, 1, 1,
0.6924915, -0.310816, 3.85146, 1, 1, 1, 1, 1,
0.6925786, 2.020325, 0.6154973, 1, 1, 1, 1, 1,
0.6948791, -0.9277597, 3.226741, 1, 1, 1, 1, 1,
0.694903, 0.3275045, 0.3951128, 1, 1, 1, 1, 1,
0.6958566, 0.9896637, 0.4011214, 1, 1, 1, 1, 1,
0.6964026, -0.9221375, 1.82898, 1, 1, 1, 1, 1,
0.6980801, 0.5456851, 1.323775, 1, 1, 1, 1, 1,
0.705346, 0.596971, 2.686716, 1, 1, 1, 1, 1,
0.7056323, 0.1460156, 1.615427, 0, 0, 1, 1, 1,
0.7078747, 0.1866045, 3.638096, 1, 0, 0, 1, 1,
0.7104434, 1.105307, 2.344058, 1, 0, 0, 1, 1,
0.7115749, 0.3326681, -1.040449, 1, 0, 0, 1, 1,
0.7118905, -0.2378003, 2.541461, 1, 0, 0, 1, 1,
0.7146981, 0.3384382, 1.874726, 1, 0, 0, 1, 1,
0.7173472, -1.9561, 2.165765, 0, 0, 0, 1, 1,
0.717537, -0.7655684, 1.065087, 0, 0, 0, 1, 1,
0.7232183, -1.053706, 1.786014, 0, 0, 0, 1, 1,
0.7266402, -0.4146363, 2.304475, 0, 0, 0, 1, 1,
0.7318632, 0.8660036, 0.08762383, 0, 0, 0, 1, 1,
0.7431093, 0.005323695, 2.127553, 0, 0, 0, 1, 1,
0.7473673, 1.182997, 0.9782346, 0, 0, 0, 1, 1,
0.7490878, 1.668278, -0.5932202, 1, 1, 1, 1, 1,
0.7494989, -0.5511422, 1.717608, 1, 1, 1, 1, 1,
0.7593812, -2.594501, 4.061275, 1, 1, 1, 1, 1,
0.7733461, -0.08400963, 0.394545, 1, 1, 1, 1, 1,
0.77341, -1.494574, 2.91539, 1, 1, 1, 1, 1,
0.7739615, 0.1159956, 1.148513, 1, 1, 1, 1, 1,
0.7771418, 1.072014, -1.14267, 1, 1, 1, 1, 1,
0.7832536, 1.143311, 1.602826, 1, 1, 1, 1, 1,
0.783579, 0.3868151, 1.994833, 1, 1, 1, 1, 1,
0.7861859, 1.677491, -0.9425136, 1, 1, 1, 1, 1,
0.7893581, -0.5835872, 2.807747, 1, 1, 1, 1, 1,
0.7900617, 0.2416966, 2.195928, 1, 1, 1, 1, 1,
0.7907093, -0.7841169, 1.002129, 1, 1, 1, 1, 1,
0.7941954, 0.2476026, 3.412951, 1, 1, 1, 1, 1,
0.8098377, -1.216298, 1.234026, 1, 1, 1, 1, 1,
0.81563, 0.1556042, 1.792899, 0, 0, 1, 1, 1,
0.8170925, -1.331523, 3.150002, 1, 0, 0, 1, 1,
0.8233219, -0.03982031, 3.63736, 1, 0, 0, 1, 1,
0.82377, 0.8534137, -0.3602499, 1, 0, 0, 1, 1,
0.8284862, -0.1606053, 1.788476, 1, 0, 0, 1, 1,
0.8352887, -1.718662, 2.84449, 1, 0, 0, 1, 1,
0.8373207, -0.4433799, 2.241267, 0, 0, 0, 1, 1,
0.8449785, -1.339945, 1.764893, 0, 0, 0, 1, 1,
0.8452076, 1.072751, 1.615131, 0, 0, 0, 1, 1,
0.8486706, -0.5784112, 3.315433, 0, 0, 0, 1, 1,
0.850818, 1.010079, -0.2612078, 0, 0, 0, 1, 1,
0.8535216, -0.2161783, 1.317405, 0, 0, 0, 1, 1,
0.8654844, -1.045724, 2.824077, 0, 0, 0, 1, 1,
0.8691142, -1.083386, 2.763866, 1, 1, 1, 1, 1,
0.8799848, -0.1886211, 2.243994, 1, 1, 1, 1, 1,
0.8811369, 1.374539, 1.744962, 1, 1, 1, 1, 1,
0.8841721, 0.2991701, 1.668316, 1, 1, 1, 1, 1,
0.8865632, -0.8499351, 1.688827, 1, 1, 1, 1, 1,
0.8877614, 1.922276, 0.3305617, 1, 1, 1, 1, 1,
0.8949959, 1.454644, 1.205118, 1, 1, 1, 1, 1,
0.90492, 0.5269635, 1.120618, 1, 1, 1, 1, 1,
0.9080229, -1.008926, 2.342361, 1, 1, 1, 1, 1,
0.9099331, 0.3390766, 1.889473, 1, 1, 1, 1, 1,
0.9120299, -0.1069799, 2.141898, 1, 1, 1, 1, 1,
0.9125247, 0.0128996, 1.640446, 1, 1, 1, 1, 1,
0.9127653, -1.529276, 0.5802699, 1, 1, 1, 1, 1,
0.915562, -1.158369, 2.979358, 1, 1, 1, 1, 1,
0.9178959, 0.07220087, 2.984003, 1, 1, 1, 1, 1,
0.923863, -0.7576673, 1.315596, 0, 0, 1, 1, 1,
0.9262462, 1.632172, 1.415626, 1, 0, 0, 1, 1,
0.9358988, 2.058732, -1.580474, 1, 0, 0, 1, 1,
0.9389477, 0.3677133, 0.6389553, 1, 0, 0, 1, 1,
0.9481487, -1.060864, 2.410953, 1, 0, 0, 1, 1,
0.9484746, 1.213628, -0.5797554, 1, 0, 0, 1, 1,
0.960683, -1.207245, 3.449388, 0, 0, 0, 1, 1,
0.9786596, -0.7838041, 1.512674, 0, 0, 0, 1, 1,
0.9846761, -1.230019, 2.946535, 0, 0, 0, 1, 1,
0.9849268, -1.37491, 3.434221, 0, 0, 0, 1, 1,
0.9861755, -1.647575, 2.083253, 0, 0, 0, 1, 1,
0.9881797, -1.080046, 2.79898, 0, 0, 0, 1, 1,
0.9976488, 0.6614296, 2.068839, 0, 0, 0, 1, 1,
1.006297, -1.621268, 3.010569, 1, 1, 1, 1, 1,
1.009567, 1.472655, 1.628532, 1, 1, 1, 1, 1,
1.01606, 1.630313, 0.9906648, 1, 1, 1, 1, 1,
1.01642, 1.913301, -0.8960484, 1, 1, 1, 1, 1,
1.016708, 2.370506, 2.031558, 1, 1, 1, 1, 1,
1.01744, 1.193099, 0.8419989, 1, 1, 1, 1, 1,
1.020225, -0.1305923, -0.7206857, 1, 1, 1, 1, 1,
1.028946, -0.1644875, 2.623931, 1, 1, 1, 1, 1,
1.033936, -1.756271, 2.776218, 1, 1, 1, 1, 1,
1.034867, 1.296132, 0.4052415, 1, 1, 1, 1, 1,
1.039182, 0.1283526, 1.563956, 1, 1, 1, 1, 1,
1.040585, 0.7405933, 2.607141, 1, 1, 1, 1, 1,
1.040586, -0.3362145, 1.707155, 1, 1, 1, 1, 1,
1.044898, -0.7043183, 1.808518, 1, 1, 1, 1, 1,
1.04629, -0.7887644, 2.038065, 1, 1, 1, 1, 1,
1.052264, -1.294419, 2.296635, 0, 0, 1, 1, 1,
1.056859, 0.7834214, 1.023291, 1, 0, 0, 1, 1,
1.059342, 0.3988499, 2.055362, 1, 0, 0, 1, 1,
1.059602, -0.1131842, 3.812333, 1, 0, 0, 1, 1,
1.061096, 0.1749632, 1.552648, 1, 0, 0, 1, 1,
1.064497, -1.244231, 1.009659, 1, 0, 0, 1, 1,
1.065999, 1.866626, 0.7235076, 0, 0, 0, 1, 1,
1.075153, -0.2062383, 0.5795634, 0, 0, 0, 1, 1,
1.080289, -0.46047, 1.692164, 0, 0, 0, 1, 1,
1.084082, -0.1074394, 2.981194, 0, 0, 0, 1, 1,
1.085811, -1.575155, 2.831707, 0, 0, 0, 1, 1,
1.091436, 0.003533284, 3.334679, 0, 0, 0, 1, 1,
1.102676, -0.9174883, 3.018696, 0, 0, 0, 1, 1,
1.104125, 0.8100589, -3.582167, 1, 1, 1, 1, 1,
1.106294, 0.5053474, -0.4077214, 1, 1, 1, 1, 1,
1.106338, 0.2611645, 0.7582512, 1, 1, 1, 1, 1,
1.11119, 0.2637571, 4.497273, 1, 1, 1, 1, 1,
1.11269, 0.2265954, 1.724354, 1, 1, 1, 1, 1,
1.116595, 0.3584675, 2.2533, 1, 1, 1, 1, 1,
1.12381, 2.192458, 1.522277, 1, 1, 1, 1, 1,
1.12964, 1.162979, 1.544823, 1, 1, 1, 1, 1,
1.130186, 2.149988, 0.5189204, 1, 1, 1, 1, 1,
1.130194, 0.2933806, 0.7009146, 1, 1, 1, 1, 1,
1.133167, -0.8661373, 1.127847, 1, 1, 1, 1, 1,
1.133908, 0.5751507, 1.914526, 1, 1, 1, 1, 1,
1.146103, -0.5285959, 3.412549, 1, 1, 1, 1, 1,
1.155342, 1.438165, 0.5885096, 1, 1, 1, 1, 1,
1.157051, -2.40615, 1.511342, 1, 1, 1, 1, 1,
1.168993, -0.6565813, 2.893032, 0, 0, 1, 1, 1,
1.169603, 0.4244227, 1.596148, 1, 0, 0, 1, 1,
1.17792, 1.114844, 0.3893746, 1, 0, 0, 1, 1,
1.20005, -0.279536, 1.981758, 1, 0, 0, 1, 1,
1.200176, -0.5331585, 1.207193, 1, 0, 0, 1, 1,
1.203174, -0.3772436, 4.011764, 1, 0, 0, 1, 1,
1.209375, -1.527018, 1.680273, 0, 0, 0, 1, 1,
1.210151, -1.381272, 2.734944, 0, 0, 0, 1, 1,
1.212993, 0.8711851, 0.6791496, 0, 0, 0, 1, 1,
1.219966, 0.3460973, 1.836149, 0, 0, 0, 1, 1,
1.22591, -2.503935, 3.082939, 0, 0, 0, 1, 1,
1.227104, 1.364867, 0.3022148, 0, 0, 0, 1, 1,
1.229271, 0.4314498, 2.426624, 0, 0, 0, 1, 1,
1.229865, -0.002511817, 1.61981, 1, 1, 1, 1, 1,
1.236757, 0.2598601, 3.343057, 1, 1, 1, 1, 1,
1.238472, 0.1036915, 0.5131658, 1, 1, 1, 1, 1,
1.240089, 1.730342, 1.882054, 1, 1, 1, 1, 1,
1.240939, -0.8363094, 3.677706, 1, 1, 1, 1, 1,
1.241099, 1.244021, 0.4199492, 1, 1, 1, 1, 1,
1.243214, -0.1906573, 3.87407, 1, 1, 1, 1, 1,
1.25613, 0.5159051, 1.020391, 1, 1, 1, 1, 1,
1.268027, -2.650693, 0.6766036, 1, 1, 1, 1, 1,
1.272202, 0.08424582, 1.948534, 1, 1, 1, 1, 1,
1.274773, -0.2502173, 0.3994376, 1, 1, 1, 1, 1,
1.278072, -0.7617277, 2.838742, 1, 1, 1, 1, 1,
1.278428, -0.04013063, -0.08023001, 1, 1, 1, 1, 1,
1.284291, 0.5228096, 2.786658, 1, 1, 1, 1, 1,
1.287748, -1.162931, 0.8651105, 1, 1, 1, 1, 1,
1.291796, 0.9632124, 1.251945, 0, 0, 1, 1, 1,
1.294178, 0.1684754, 1.449629, 1, 0, 0, 1, 1,
1.294183, 0.3919945, 0.8626191, 1, 0, 0, 1, 1,
1.302011, 0.3829572, 1.115069, 1, 0, 0, 1, 1,
1.302293, 0.5779135, 1.234649, 1, 0, 0, 1, 1,
1.303516, -0.09744096, 1.429968, 1, 0, 0, 1, 1,
1.315048, -0.5468224, 2.082246, 0, 0, 0, 1, 1,
1.315257, -0.5414542, 1.772794, 0, 0, 0, 1, 1,
1.317095, 0.8766985, 2.099807, 0, 0, 0, 1, 1,
1.318238, 0.8081455, -0.3552972, 0, 0, 0, 1, 1,
1.321715, -0.7190343, 2.060822, 0, 0, 0, 1, 1,
1.323087, 0.4614581, 1.780302, 0, 0, 0, 1, 1,
1.325534, -1.964049, 0.3912186, 0, 0, 0, 1, 1,
1.338434, 0.6265032, 0.6813904, 1, 1, 1, 1, 1,
1.339464, -0.1426239, 2.263441, 1, 1, 1, 1, 1,
1.356332, -0.3668697, 1.661551, 1, 1, 1, 1, 1,
1.364157, -0.8280275, 2.30178, 1, 1, 1, 1, 1,
1.372749, -0.4900675, 1.516121, 1, 1, 1, 1, 1,
1.384621, 1.100898, 2.747415, 1, 1, 1, 1, 1,
1.387281, 0.2033043, 1.703314, 1, 1, 1, 1, 1,
1.387307, 1.027793, 0.7653733, 1, 1, 1, 1, 1,
1.388094, -1.539035, 0.2496894, 1, 1, 1, 1, 1,
1.393378, -0.8685191, 2.503036, 1, 1, 1, 1, 1,
1.394034, 0.3392352, 2.016315, 1, 1, 1, 1, 1,
1.395029, 0.06773084, 0.663084, 1, 1, 1, 1, 1,
1.417433, -0.477066, 1.814135, 1, 1, 1, 1, 1,
1.421347, 1.977922, -1.152944, 1, 1, 1, 1, 1,
1.421847, 0.06545632, 2.412623, 1, 1, 1, 1, 1,
1.424969, 0.1616536, 0.7534835, 0, 0, 1, 1, 1,
1.426739, -0.6390616, 2.213757, 1, 0, 0, 1, 1,
1.42823, 1.519672, 1.028552, 1, 0, 0, 1, 1,
1.431868, 0.1638158, 2.083938, 1, 0, 0, 1, 1,
1.441726, 0.3748043, 0.9411923, 1, 0, 0, 1, 1,
1.457092, -1.098874, 2.757312, 1, 0, 0, 1, 1,
1.466153, -0.3564367, -0.1465419, 0, 0, 0, 1, 1,
1.478794, 0.2962523, 1.47649, 0, 0, 0, 1, 1,
1.481408, 1.909564, 3.221111, 0, 0, 0, 1, 1,
1.487947, 0.2221266, 2.221745, 0, 0, 0, 1, 1,
1.48885, 0.4965988, 1.600263, 0, 0, 0, 1, 1,
1.48995, -2.175123, 2.898135, 0, 0, 0, 1, 1,
1.503716, 0.8715567, 1.750122, 0, 0, 0, 1, 1,
1.510653, 0.402361, -0.3612589, 1, 1, 1, 1, 1,
1.517504, -1.364287, 0.9782087, 1, 1, 1, 1, 1,
1.517669, 0.5593916, 0.1882067, 1, 1, 1, 1, 1,
1.523186, 0.5029463, 2.378029, 1, 1, 1, 1, 1,
1.52997, 0.09343529, 0.7445719, 1, 1, 1, 1, 1,
1.533694, 0.674693, 0.502159, 1, 1, 1, 1, 1,
1.538692, 1.022116, 0.3206742, 1, 1, 1, 1, 1,
1.56294, -0.6876387, 0.5016419, 1, 1, 1, 1, 1,
1.56619, -1.196121, 1.13033, 1, 1, 1, 1, 1,
1.586784, 1.556348, -0.9140825, 1, 1, 1, 1, 1,
1.592836, 0.8412068, 1.989985, 1, 1, 1, 1, 1,
1.603494, 0.3309575, 1.067552, 1, 1, 1, 1, 1,
1.617673, 2.897264, 0.8098387, 1, 1, 1, 1, 1,
1.622653, -0.2985952, 1.52587, 1, 1, 1, 1, 1,
1.641214, -0.1804357, 1.148901, 1, 1, 1, 1, 1,
1.668545, 1.314006, 1.205242, 0, 0, 1, 1, 1,
1.669153, -0.8626595, 1.444316, 1, 0, 0, 1, 1,
1.673851, 1.132956, -0.3719186, 1, 0, 0, 1, 1,
1.692293, -0.2719743, -0.4589809, 1, 0, 0, 1, 1,
1.706507, 0.1442806, 2.718282, 1, 0, 0, 1, 1,
1.707309, -0.6257538, 2.249075, 1, 0, 0, 1, 1,
1.715133, 0.4443397, 0.8893073, 0, 0, 0, 1, 1,
1.73073, 0.659973, 0.2112009, 0, 0, 0, 1, 1,
1.736621, -0.5883656, 2.205872, 0, 0, 0, 1, 1,
1.770831, -1.494844, 3.397933, 0, 0, 0, 1, 1,
1.802364, 0.1119886, 1.801617, 0, 0, 0, 1, 1,
1.819044, 0.02911879, 3.186598, 0, 0, 0, 1, 1,
1.820437, -0.3360398, 1.19487, 0, 0, 0, 1, 1,
1.826669, -0.7925282, 2.225175, 1, 1, 1, 1, 1,
1.830709, 0.2099774, 2.678357, 1, 1, 1, 1, 1,
1.845786, 2.194108, 0.9261091, 1, 1, 1, 1, 1,
1.874538, 1.493846, 0.69164, 1, 1, 1, 1, 1,
1.885594, 1.342985, 1.256583, 1, 1, 1, 1, 1,
1.897173, 1.204027, 0.8830899, 1, 1, 1, 1, 1,
1.965237, 0.3234482, 2.181033, 1, 1, 1, 1, 1,
1.97082, -1.716413, 2.589419, 1, 1, 1, 1, 1,
1.975338, -1.260107, 1.887231, 1, 1, 1, 1, 1,
1.984055, 1.744229, 1.294138, 1, 1, 1, 1, 1,
1.994732, -0.4439495, 0.3184439, 1, 1, 1, 1, 1,
2.027863, -1.433552, 1.945244, 1, 1, 1, 1, 1,
2.032534, -0.0382969, 0.6726408, 1, 1, 1, 1, 1,
2.035615, 1.366014, -0.4745879, 1, 1, 1, 1, 1,
2.046, 0.2090558, 3.379037, 1, 1, 1, 1, 1,
2.072335, -0.01420558, 0.9182039, 0, 0, 1, 1, 1,
2.142077, -0.1519592, 2.308434, 1, 0, 0, 1, 1,
2.153833, 0.5913529, 0.3132299, 1, 0, 0, 1, 1,
2.156009, -2.116363, 2.223862, 1, 0, 0, 1, 1,
2.156177, -0.9067037, 1.421287, 1, 0, 0, 1, 1,
2.177026, -0.09106146, 1.717044, 1, 0, 0, 1, 1,
2.181636, -0.1046604, 1.35249, 0, 0, 0, 1, 1,
2.206359, 0.009218858, 2.697833, 0, 0, 0, 1, 1,
2.213908, -0.4676384, 3.617651, 0, 0, 0, 1, 1,
2.226277, 0.09882829, 1.626891, 0, 0, 0, 1, 1,
2.236503, 0.4441731, 2.080949, 0, 0, 0, 1, 1,
2.254973, 0.9581282, 1.474818, 0, 0, 0, 1, 1,
2.298177, 0.07658114, 1.130763, 0, 0, 0, 1, 1,
2.305566, 0.9599329, 0.7261688, 1, 1, 1, 1, 1,
2.437116, -0.6812065, 1.129796, 1, 1, 1, 1, 1,
2.458637, 0.4126726, 3.614263, 1, 1, 1, 1, 1,
2.901151, -1.916672, 3.601842, 1, 1, 1, 1, 1,
2.906795, 1.026852, 1.352277, 1, 1, 1, 1, 1,
2.983204, 1.480775, 1.220372, 1, 1, 1, 1, 1,
3.433987, -1.128761, 2.726444, 1, 1, 1, 1, 1
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
var radius = 9.768213;
var distance = 34.31043;
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
mvMatrix.translate( -0.1164455, 0.1234181, 0.2333438 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.31043);
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