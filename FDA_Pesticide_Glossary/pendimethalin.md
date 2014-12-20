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
-2.740236, -1.25254, -1.981119, 1, 0, 0, 1,
-2.584743, -0.4282036, -0.7267458, 1, 0.007843138, 0, 1,
-2.553588, -0.9695812, -2.735466, 1, 0.01176471, 0, 1,
-2.507907, -1.057161, -3.005261, 1, 0.01960784, 0, 1,
-2.455542, 0.72381, -1.300256, 1, 0.02352941, 0, 1,
-2.438714, -0.9965155, -1.565949, 1, 0.03137255, 0, 1,
-2.415822, 0.09213716, -2.762744, 1, 0.03529412, 0, 1,
-2.389239, -0.2443736, -1.465354, 1, 0.04313726, 0, 1,
-2.361579, -1.492527, -4.110098, 1, 0.04705882, 0, 1,
-2.277139, -1.387511, -2.825983, 1, 0.05490196, 0, 1,
-2.200538, 1.80121, -2.413966, 1, 0.05882353, 0, 1,
-2.166481, 0.4001777, -2.560995, 1, 0.06666667, 0, 1,
-2.148352, 1.887758, -0.7605067, 1, 0.07058824, 0, 1,
-2.112375, -0.114447, -2.054741, 1, 0.07843138, 0, 1,
-2.09585, -1.313029, -1.66346, 1, 0.08235294, 0, 1,
-2.06354, -0.006553665, -1.53704, 1, 0.09019608, 0, 1,
-2.044048, 0.445966, 0.2700529, 1, 0.09411765, 0, 1,
-2.029632, 0.8849438, -1.147226, 1, 0.1019608, 0, 1,
-2.021152, -1.003146, -1.330132, 1, 0.1098039, 0, 1,
-2.020327, 1.506999, -0.4142488, 1, 0.1137255, 0, 1,
-2.020108, 1.433407, -1.159894, 1, 0.1215686, 0, 1,
-1.992028, 0.1314434, 1.114959, 1, 0.1254902, 0, 1,
-1.914229, 1.63564, -0.8911723, 1, 0.1333333, 0, 1,
-1.911936, -1.124992, 0.1509904, 1, 0.1372549, 0, 1,
-1.90974, 0.3850383, -0.6854222, 1, 0.145098, 0, 1,
-1.90759, -0.2465575, -2.097912, 1, 0.1490196, 0, 1,
-1.902631, 1.671938, -1.286145, 1, 0.1568628, 0, 1,
-1.897278, 0.131382, -2.645201, 1, 0.1607843, 0, 1,
-1.890243, -0.1750412, 0.3013962, 1, 0.1686275, 0, 1,
-1.887982, 0.4943084, -2.976835, 1, 0.172549, 0, 1,
-1.885398, 0.357466, -1.184138, 1, 0.1803922, 0, 1,
-1.850269, 2.153086, -0.8300245, 1, 0.1843137, 0, 1,
-1.83853, -0.1521752, -1.661027, 1, 0.1921569, 0, 1,
-1.829663, 0.1419867, 0.3555933, 1, 0.1960784, 0, 1,
-1.826013, 1.551423, -0.3551746, 1, 0.2039216, 0, 1,
-1.764327, -1.849401, -1.84392, 1, 0.2117647, 0, 1,
-1.759569, -0.0497495, -4.361624, 1, 0.2156863, 0, 1,
-1.752742, 0.6271231, -0.3264207, 1, 0.2235294, 0, 1,
-1.7471, 0.9502042, -0.3247109, 1, 0.227451, 0, 1,
-1.733246, 0.5143954, -1.582548, 1, 0.2352941, 0, 1,
-1.733014, 0.7937784, 0.527028, 1, 0.2392157, 0, 1,
-1.721535, -0.4963593, -1.895684, 1, 0.2470588, 0, 1,
-1.713972, 0.3666446, -1.022754, 1, 0.2509804, 0, 1,
-1.702068, 0.6054086, 0.4330217, 1, 0.2588235, 0, 1,
-1.69668, 0.1737413, -2.504161, 1, 0.2627451, 0, 1,
-1.696366, 0.1012209, -1.783531, 1, 0.2705882, 0, 1,
-1.672646, -0.4202016, -2.491602, 1, 0.2745098, 0, 1,
-1.668782, 1.354074, -1.804985, 1, 0.282353, 0, 1,
-1.633616, -1.018465, -0.4260504, 1, 0.2862745, 0, 1,
-1.632673, 0.1902525, -1.118639, 1, 0.2941177, 0, 1,
-1.630939, 0.6888528, -0.07049073, 1, 0.3019608, 0, 1,
-1.622551, 2.346378, 0.3502696, 1, 0.3058824, 0, 1,
-1.590925, -0.347216, -2.02041, 1, 0.3137255, 0, 1,
-1.588092, 0.5920115, -2.866993, 1, 0.3176471, 0, 1,
-1.585637, -0.4531688, -2.145731, 1, 0.3254902, 0, 1,
-1.585344, -0.1024326, -2.081051, 1, 0.3294118, 0, 1,
-1.56892, -1.503784, -2.680746, 1, 0.3372549, 0, 1,
-1.553825, 0.9932448, -1.572845, 1, 0.3411765, 0, 1,
-1.534154, -0.3431675, -2.36605, 1, 0.3490196, 0, 1,
-1.51488, -2.425816, -3.458434, 1, 0.3529412, 0, 1,
-1.500086, 0.5137763, -1.63366, 1, 0.3607843, 0, 1,
-1.496696, -1.076089, -1.953251, 1, 0.3647059, 0, 1,
-1.485948, 1.219192, -0.6631235, 1, 0.372549, 0, 1,
-1.482275, -1.438433, -0.7486467, 1, 0.3764706, 0, 1,
-1.469682, 0.4855734, -1.533565, 1, 0.3843137, 0, 1,
-1.455543, -0.4668187, -1.068557, 1, 0.3882353, 0, 1,
-1.453807, -0.1479247, -2.843044, 1, 0.3960784, 0, 1,
-1.44632, -1.318091, -1.40009, 1, 0.4039216, 0, 1,
-1.444688, 0.7093241, -1.419322, 1, 0.4078431, 0, 1,
-1.443682, 0.1457712, -1.08154, 1, 0.4156863, 0, 1,
-1.44171, -0.8948649, -1.062751, 1, 0.4196078, 0, 1,
-1.432974, 1.453779, -0.9736337, 1, 0.427451, 0, 1,
-1.429678, 0.9601009, -1.249055, 1, 0.4313726, 0, 1,
-1.427262, 0.5686547, 0.04858488, 1, 0.4392157, 0, 1,
-1.42634, -1.28253, -1.839026, 1, 0.4431373, 0, 1,
-1.425385, 0.1935169, -0.9573678, 1, 0.4509804, 0, 1,
-1.424834, -0.2223057, -2.849055, 1, 0.454902, 0, 1,
-1.42459, -0.963222, -1.589148, 1, 0.4627451, 0, 1,
-1.422684, -0.02094146, -1.212402, 1, 0.4666667, 0, 1,
-1.420027, -1.144017, -3.183816, 1, 0.4745098, 0, 1,
-1.417479, -1.023323, -1.798786, 1, 0.4784314, 0, 1,
-1.41665, -0.2877871, -1.38098, 1, 0.4862745, 0, 1,
-1.415925, 1.005484, -1.195035, 1, 0.4901961, 0, 1,
-1.401005, -1.215774, -0.8812715, 1, 0.4980392, 0, 1,
-1.395594, 0.2018327, -2.353949, 1, 0.5058824, 0, 1,
-1.39152, 0.9110898, -0.5850316, 1, 0.509804, 0, 1,
-1.390131, -0.06361151, -0.01544017, 1, 0.5176471, 0, 1,
-1.389061, -0.4975438, -3.338389, 1, 0.5215687, 0, 1,
-1.371639, 1.717428, -0.8861499, 1, 0.5294118, 0, 1,
-1.368356, -1.180024, -2.343004, 1, 0.5333334, 0, 1,
-1.365342, 0.2354951, -0.9629869, 1, 0.5411765, 0, 1,
-1.363489, 1.779931, 0.02988275, 1, 0.5450981, 0, 1,
-1.359072, 0.9953333, 1.343361, 1, 0.5529412, 0, 1,
-1.356917, 1.223491, -0.7078085, 1, 0.5568628, 0, 1,
-1.353738, -0.4033636, -3.007289, 1, 0.5647059, 0, 1,
-1.352231, -0.2408015, 1.457552, 1, 0.5686275, 0, 1,
-1.348541, 1.498968, -1.104595, 1, 0.5764706, 0, 1,
-1.346743, 0.2382214, -1.50698, 1, 0.5803922, 0, 1,
-1.340131, 0.3729714, 1.250203, 1, 0.5882353, 0, 1,
-1.329469, 1.58796, -0.4029115, 1, 0.5921569, 0, 1,
-1.324941, -0.6451295, -3.085897, 1, 0.6, 0, 1,
-1.320451, 0.1633374, -0.645571, 1, 0.6078432, 0, 1,
-1.319575, 1.114169, 0.2845961, 1, 0.6117647, 0, 1,
-1.300514, 0.05056182, -1.842365, 1, 0.6196079, 0, 1,
-1.297303, -0.5588316, -2.781402, 1, 0.6235294, 0, 1,
-1.294434, 0.2382335, -3.356485, 1, 0.6313726, 0, 1,
-1.293459, -2.210356, -1.781176, 1, 0.6352941, 0, 1,
-1.289738, -0.6632609, -3.177986, 1, 0.6431373, 0, 1,
-1.27619, 0.919077, -1.023598, 1, 0.6470588, 0, 1,
-1.27575, 0.3123186, -0.2575882, 1, 0.654902, 0, 1,
-1.274923, 0.3861429, -2.599688, 1, 0.6588235, 0, 1,
-1.272299, 0.8769271, -1.952866, 1, 0.6666667, 0, 1,
-1.265878, -0.2655681, 0.005123875, 1, 0.6705883, 0, 1,
-1.265738, 0.2871051, -0.2021802, 1, 0.6784314, 0, 1,
-1.261048, 0.09682132, -1.749537, 1, 0.682353, 0, 1,
-1.259448, -0.43772, -3.17181, 1, 0.6901961, 0, 1,
-1.245004, -0.9660417, -2.377448, 1, 0.6941177, 0, 1,
-1.236116, 0.3005895, -0.5454948, 1, 0.7019608, 0, 1,
-1.233799, 0.635138, -1.223892, 1, 0.7098039, 0, 1,
-1.229397, -1.338001, -1.585716, 1, 0.7137255, 0, 1,
-1.221786, -1.462905, -1.989349, 1, 0.7215686, 0, 1,
-1.221508, -0.6904442, -2.05184, 1, 0.7254902, 0, 1,
-1.217757, 2.105973, -0.626125, 1, 0.7333333, 0, 1,
-1.206728, 1.106138, 0.591906, 1, 0.7372549, 0, 1,
-1.202662, -0.2054106, -2.912969, 1, 0.7450981, 0, 1,
-1.194227, 1.470876, -1.831765, 1, 0.7490196, 0, 1,
-1.187441, 1.159443, 0.3114299, 1, 0.7568628, 0, 1,
-1.186852, 0.3858287, -0.9697053, 1, 0.7607843, 0, 1,
-1.183171, -1.014654, -2.044344, 1, 0.7686275, 0, 1,
-1.180536, 1.550505, -0.01487639, 1, 0.772549, 0, 1,
-1.17858, 2.845267, -0.7653952, 1, 0.7803922, 0, 1,
-1.178277, 0.2776525, -2.020662, 1, 0.7843137, 0, 1,
-1.178013, -0.5367622, -2.202147, 1, 0.7921569, 0, 1,
-1.17289, -1.325271, -0.4019626, 1, 0.7960784, 0, 1,
-1.167656, 1.922348, -1.412167, 1, 0.8039216, 0, 1,
-1.155079, -1.722883, -4.396168, 1, 0.8117647, 0, 1,
-1.149404, -0.8485003, -3.03547, 1, 0.8156863, 0, 1,
-1.146896, -0.6317073, -2.835353, 1, 0.8235294, 0, 1,
-1.1454, -0.1042446, -1.963476, 1, 0.827451, 0, 1,
-1.145017, 0.5171396, 0.8046901, 1, 0.8352941, 0, 1,
-1.139959, -1.149697, -2.268261, 1, 0.8392157, 0, 1,
-1.131899, 0.8671116, -0.01786397, 1, 0.8470588, 0, 1,
-1.12785, 1.223346, -0.528293, 1, 0.8509804, 0, 1,
-1.119696, -0.8492169, -1.959061, 1, 0.8588235, 0, 1,
-1.117601, -1.336164, -3.481675, 1, 0.8627451, 0, 1,
-1.112653, 1.769402, -0.6901562, 1, 0.8705882, 0, 1,
-1.100061, 0.08498915, -0.6364039, 1, 0.8745098, 0, 1,
-1.098623, 0.169852, -2.81617, 1, 0.8823529, 0, 1,
-1.096315, -0.8801, -2.711728, 1, 0.8862745, 0, 1,
-1.096315, -1.971698, -1.204683, 1, 0.8941177, 0, 1,
-1.0936, 0.2233875, -0.6659674, 1, 0.8980392, 0, 1,
-1.092868, 0.7724692, -0.3304572, 1, 0.9058824, 0, 1,
-1.092417, -0.1229572, -1.037617, 1, 0.9137255, 0, 1,
-1.089857, -1.487258, -3.525449, 1, 0.9176471, 0, 1,
-1.08933, -1.116817, -3.964574, 1, 0.9254902, 0, 1,
-1.084121, -0.01809071, -1.229865, 1, 0.9294118, 0, 1,
-1.081936, -0.1467353, -2.319919, 1, 0.9372549, 0, 1,
-1.079073, 0.6204652, -0.5760081, 1, 0.9411765, 0, 1,
-1.075459, 1.036988, -1.132892, 1, 0.9490196, 0, 1,
-1.070809, 1.088731, -0.1124169, 1, 0.9529412, 0, 1,
-1.070145, -1.403285, -2.881541, 1, 0.9607843, 0, 1,
-1.062554, -0.838578, -2.788823, 1, 0.9647059, 0, 1,
-1.057582, 0.89684, -0.03104957, 1, 0.972549, 0, 1,
-1.055594, 0.2441959, -2.205798, 1, 0.9764706, 0, 1,
-1.051603, 2.19549, -0.05075485, 1, 0.9843137, 0, 1,
-1.048684, 0.6550549, -1.409514, 1, 0.9882353, 0, 1,
-1.044683, -0.4742956, -3.435712, 1, 0.9960784, 0, 1,
-1.039845, 0.4101188, -1.922629, 0.9960784, 1, 0, 1,
-1.037385, 0.3098153, 0.2485012, 0.9921569, 1, 0, 1,
-1.030309, 3.02656, -0.8428797, 0.9843137, 1, 0, 1,
-1.029628, -0.4751127, -0.8165181, 0.9803922, 1, 0, 1,
-1.027998, -0.4227689, -2.060963, 0.972549, 1, 0, 1,
-1.025275, -1.610695, -4.274962, 0.9686275, 1, 0, 1,
-1.018574, -0.5517415, -2.285443, 0.9607843, 1, 0, 1,
-1.015161, -0.6997429, -1.699515, 0.9568627, 1, 0, 1,
-1.00771, 0.9390884, 0.1052575, 0.9490196, 1, 0, 1,
-1.003826, 1.576425, -1.503927, 0.945098, 1, 0, 1,
-1.003447, -0.1042683, -2.864236, 0.9372549, 1, 0, 1,
-0.9964351, 0.4373892, -0.2141571, 0.9333333, 1, 0, 1,
-0.9912123, -0.3483095, -1.555272, 0.9254902, 1, 0, 1,
-0.9907511, 1.732109, -2.356226, 0.9215686, 1, 0, 1,
-0.9855948, -0.03847732, -2.841754, 0.9137255, 1, 0, 1,
-0.9847383, 0.577008, -1.603432, 0.9098039, 1, 0, 1,
-0.9811274, 1.468073, -0.9936031, 0.9019608, 1, 0, 1,
-0.9809962, -0.2287565, -1.278432, 0.8941177, 1, 0, 1,
-0.9779592, -0.5603662, -4.1276, 0.8901961, 1, 0, 1,
-0.9751379, 0.04765411, -2.991494, 0.8823529, 1, 0, 1,
-0.9621674, 0.7037392, -1.476818, 0.8784314, 1, 0, 1,
-0.9565377, 1.539814, -1.367307, 0.8705882, 1, 0, 1,
-0.9560916, 0.8271256, 0.04962091, 0.8666667, 1, 0, 1,
-0.9556842, -0.3988879, -0.9124531, 0.8588235, 1, 0, 1,
-0.9554233, -0.536451, -2.772574, 0.854902, 1, 0, 1,
-0.9511871, 0.9193298, -1.81913, 0.8470588, 1, 0, 1,
-0.9373661, 0.3160142, -0.6946673, 0.8431373, 1, 0, 1,
-0.9357808, 2.498975, 0.3110502, 0.8352941, 1, 0, 1,
-0.9353217, -0.7706334, -2.85646, 0.8313726, 1, 0, 1,
-0.9247823, 1.526414, 0.5966475, 0.8235294, 1, 0, 1,
-0.9206795, -1.348482, -1.707907, 0.8196079, 1, 0, 1,
-0.9161683, -0.8485528, -1.210663, 0.8117647, 1, 0, 1,
-0.9160376, -0.2975179, -1.032066, 0.8078431, 1, 0, 1,
-0.9149083, -0.8067797, -2.831229, 0.8, 1, 0, 1,
-0.9104007, -1.263625, -2.212744, 0.7921569, 1, 0, 1,
-0.9063199, -1.077734, 0.5224265, 0.7882353, 1, 0, 1,
-0.9050829, 0.7701605, -1.310137, 0.7803922, 1, 0, 1,
-0.9016929, -0.08651377, -1.459773, 0.7764706, 1, 0, 1,
-0.9014347, -0.3239173, -3.172272, 0.7686275, 1, 0, 1,
-0.8999621, -0.6516793, -3.570082, 0.7647059, 1, 0, 1,
-0.8982824, 0.6205713, 0.5872316, 0.7568628, 1, 0, 1,
-0.8901572, -0.9168012, -2.46832, 0.7529412, 1, 0, 1,
-0.8869638, 0.4658595, 0.06770667, 0.7450981, 1, 0, 1,
-0.8827969, 0.6026124, -1.160482, 0.7411765, 1, 0, 1,
-0.8739323, 1.153653, -1.65868, 0.7333333, 1, 0, 1,
-0.8717941, -1.161697, -0.6683449, 0.7294118, 1, 0, 1,
-0.8707707, -0.1321315, 0.02377765, 0.7215686, 1, 0, 1,
-0.8699045, -0.3041379, -1.318913, 0.7176471, 1, 0, 1,
-0.8571653, 0.2947258, -1.00997, 0.7098039, 1, 0, 1,
-0.8555015, 2.829736, -0.2288652, 0.7058824, 1, 0, 1,
-0.8441322, -2.056958, -3.400765, 0.6980392, 1, 0, 1,
-0.8427231, 0.668897, -0.9601521, 0.6901961, 1, 0, 1,
-0.8381358, -1.541683, -4.282936, 0.6862745, 1, 0, 1,
-0.8365458, 1.128493, -0.3777029, 0.6784314, 1, 0, 1,
-0.8344383, -1.293634, -3.850234, 0.6745098, 1, 0, 1,
-0.8266928, -0.7671471, -3.321157, 0.6666667, 1, 0, 1,
-0.8238795, 0.4704215, -0.5567077, 0.6627451, 1, 0, 1,
-0.8200563, 0.6317053, -0.4265748, 0.654902, 1, 0, 1,
-0.8176588, 0.4824318, -1.406364, 0.6509804, 1, 0, 1,
-0.8152156, -0.7697603, -2.105429, 0.6431373, 1, 0, 1,
-0.8126394, -1.669425, -2.874703, 0.6392157, 1, 0, 1,
-0.8124513, -0.1454094, -1.784626, 0.6313726, 1, 0, 1,
-0.8119385, -0.4342093, -3.688607, 0.627451, 1, 0, 1,
-0.8094307, -1.265485, -2.785338, 0.6196079, 1, 0, 1,
-0.8057307, 0.2208407, -0.4399588, 0.6156863, 1, 0, 1,
-0.8043475, -0.6850055, -1.928381, 0.6078432, 1, 0, 1,
-0.7932907, -0.07933127, -2.319304, 0.6039216, 1, 0, 1,
-0.7837811, -0.3782535, -1.80666, 0.5960785, 1, 0, 1,
-0.7725917, 0.2217949, -1.069944, 0.5882353, 1, 0, 1,
-0.7694903, -1.532167, -2.395199, 0.5843138, 1, 0, 1,
-0.7676388, 0.3554022, -0.1813632, 0.5764706, 1, 0, 1,
-0.7675158, 1.850092, -0.3169584, 0.572549, 1, 0, 1,
-0.7670752, -0.4873362, -1.404822, 0.5647059, 1, 0, 1,
-0.7652396, 1.136355, -0.3628385, 0.5607843, 1, 0, 1,
-0.7605882, -1.427378, -1.454394, 0.5529412, 1, 0, 1,
-0.7592803, 2.013885, 0.7199525, 0.5490196, 1, 0, 1,
-0.7577659, 0.114554, -2.85097, 0.5411765, 1, 0, 1,
-0.7568381, 0.9733381, 0.6272261, 0.5372549, 1, 0, 1,
-0.7559488, 3.348566, -0.3345943, 0.5294118, 1, 0, 1,
-0.7503278, -0.5793937, -1.551324, 0.5254902, 1, 0, 1,
-0.7453647, 0.01387561, -2.790884, 0.5176471, 1, 0, 1,
-0.7450137, -0.836411, -1.537167, 0.5137255, 1, 0, 1,
-0.7447036, 1.372566, -1.107343, 0.5058824, 1, 0, 1,
-0.7440268, 0.913247, -1.69549, 0.5019608, 1, 0, 1,
-0.742257, -1.593266, -3.034756, 0.4941176, 1, 0, 1,
-0.7404472, 0.2210335, -1.151466, 0.4862745, 1, 0, 1,
-0.7389541, -0.4524669, -1.049736, 0.4823529, 1, 0, 1,
-0.7379954, -1.073994, -2.073583, 0.4745098, 1, 0, 1,
-0.7368674, 0.3118587, -2.053954, 0.4705882, 1, 0, 1,
-0.7367257, -0.07291012, -1.477071, 0.4627451, 1, 0, 1,
-0.7342236, 0.585375, -2.154802, 0.4588235, 1, 0, 1,
-0.7332179, -0.1100682, -2.246417, 0.4509804, 1, 0, 1,
-0.7329362, 0.4900503, 1.122229, 0.4470588, 1, 0, 1,
-0.7272034, 0.3040874, -2.008837, 0.4392157, 1, 0, 1,
-0.7213208, -0.3344093, -1.84717, 0.4352941, 1, 0, 1,
-0.7191608, 0.2149502, -1.328196, 0.427451, 1, 0, 1,
-0.7182575, 0.8201462, -0.2262639, 0.4235294, 1, 0, 1,
-0.7177582, -0.6833258, -2.316954, 0.4156863, 1, 0, 1,
-0.7150548, -2.240692, -4.169044, 0.4117647, 1, 0, 1,
-0.7078869, -1.087365, -2.182878, 0.4039216, 1, 0, 1,
-0.703901, -0.009843588, -1.770322, 0.3960784, 1, 0, 1,
-0.7002879, 0.5219543, -1.168898, 0.3921569, 1, 0, 1,
-0.6994354, -0.1974867, -3.028755, 0.3843137, 1, 0, 1,
-0.6943254, 1.25401, -1.467059, 0.3803922, 1, 0, 1,
-0.6880921, 0.3185607, -0.5874776, 0.372549, 1, 0, 1,
-0.681663, 1.229179, -1.275618, 0.3686275, 1, 0, 1,
-0.6790602, 0.4123737, -1.022229, 0.3607843, 1, 0, 1,
-0.677999, 0.0861045, -1.033743, 0.3568628, 1, 0, 1,
-0.6753461, -0.2954771, -1.91911, 0.3490196, 1, 0, 1,
-0.6703166, -0.06420286, -1.190433, 0.345098, 1, 0, 1,
-0.6647904, 0.4248944, -2.206827, 0.3372549, 1, 0, 1,
-0.6634899, -0.7028883, -3.023, 0.3333333, 1, 0, 1,
-0.6621018, -0.1060649, -0.6168229, 0.3254902, 1, 0, 1,
-0.65889, 0.2733303, -0.0175198, 0.3215686, 1, 0, 1,
-0.6583242, -0.4878681, -0.4464751, 0.3137255, 1, 0, 1,
-0.6582911, 0.01393632, -1.044816, 0.3098039, 1, 0, 1,
-0.6577202, 0.9452538, -0.9873518, 0.3019608, 1, 0, 1,
-0.6557931, -0.4861178, -1.901316, 0.2941177, 1, 0, 1,
-0.654604, -2.038705, -2.343734, 0.2901961, 1, 0, 1,
-0.6520028, -1.002536, -3.15852, 0.282353, 1, 0, 1,
-0.6479191, 1.084473, -0.06195004, 0.2784314, 1, 0, 1,
-0.64553, -0.7262347, -2.233439, 0.2705882, 1, 0, 1,
-0.643878, 1.049991, 1.408103, 0.2666667, 1, 0, 1,
-0.6422968, 2.387832, -0.6842567, 0.2588235, 1, 0, 1,
-0.6391838, -0.9212191, -1.175345, 0.254902, 1, 0, 1,
-0.6388696, -0.9486075, -5.467788, 0.2470588, 1, 0, 1,
-0.6386912, 0.7894742, 0.07317086, 0.2431373, 1, 0, 1,
-0.6385946, 1.494802, 0.135718, 0.2352941, 1, 0, 1,
-0.6348674, 0.01583236, -1.739319, 0.2313726, 1, 0, 1,
-0.633223, -0.3101049, -1.922148, 0.2235294, 1, 0, 1,
-0.6314523, 0.2093062, -2.420807, 0.2196078, 1, 0, 1,
-0.6301303, -0.5185936, -2.090438, 0.2117647, 1, 0, 1,
-0.6292086, -2.392779, -2.201455, 0.2078431, 1, 0, 1,
-0.6284251, -0.01676891, -1.515772, 0.2, 1, 0, 1,
-0.6269433, 0.3039631, -1.287407, 0.1921569, 1, 0, 1,
-0.6195147, -0.6804183, -3.389257, 0.1882353, 1, 0, 1,
-0.6182048, 1.159524, -1.36147, 0.1803922, 1, 0, 1,
-0.6175687, -0.1071063, -1.504597, 0.1764706, 1, 0, 1,
-0.6149856, 0.3057896, -0.253848, 0.1686275, 1, 0, 1,
-0.6132552, -0.3962594, -1.973109, 0.1647059, 1, 0, 1,
-0.6124338, -1.372513, 0.135547, 0.1568628, 1, 0, 1,
-0.6116142, 1.203518, 0.3947555, 0.1529412, 1, 0, 1,
-0.6085349, -0.4193545, -3.343191, 0.145098, 1, 0, 1,
-0.6077684, -1.889745, -1.62795, 0.1411765, 1, 0, 1,
-0.6076139, 0.2382265, -2.636952, 0.1333333, 1, 0, 1,
-0.6051041, 0.05674351, -1.766499, 0.1294118, 1, 0, 1,
-0.5990741, -0.2304795, -0.501696, 0.1215686, 1, 0, 1,
-0.5932167, -0.3824009, -2.284246, 0.1176471, 1, 0, 1,
-0.5868267, 0.05152906, -1.550181, 0.1098039, 1, 0, 1,
-0.5837717, 0.3311135, -2.024916, 0.1058824, 1, 0, 1,
-0.5816287, 0.5424181, 0.1284558, 0.09803922, 1, 0, 1,
-0.5784933, 0.233179, -2.554334, 0.09019608, 1, 0, 1,
-0.5709144, 0.324994, -1.959167, 0.08627451, 1, 0, 1,
-0.5647954, 0.3212396, -0.6349227, 0.07843138, 1, 0, 1,
-0.5625821, -0.5846896, -2.201875, 0.07450981, 1, 0, 1,
-0.562422, 1.779977, -0.320882, 0.06666667, 1, 0, 1,
-0.5615722, 1.639341, 1.264256, 0.0627451, 1, 0, 1,
-0.5598308, 0.1319309, -1.251915, 0.05490196, 1, 0, 1,
-0.558678, 0.01919596, 0.4005222, 0.05098039, 1, 0, 1,
-0.5521805, 1.018522, -0.7502873, 0.04313726, 1, 0, 1,
-0.5512096, 1.73176, -0.3897579, 0.03921569, 1, 0, 1,
-0.5511258, -0.1681126, 0.02358481, 0.03137255, 1, 0, 1,
-0.5497582, -0.8586891, -2.299043, 0.02745098, 1, 0, 1,
-0.5495282, -0.409615, -1.712955, 0.01960784, 1, 0, 1,
-0.5473452, 0.0008204035, -0.5292157, 0.01568628, 1, 0, 1,
-0.546302, -0.07556543, -3.494821, 0.007843138, 1, 0, 1,
-0.546262, -0.4430507, -1.592765, 0.003921569, 1, 0, 1,
-0.542196, 0.7297401, -0.02472108, 0, 1, 0.003921569, 1,
-0.5384098, 0.4363984, 0.03586664, 0, 1, 0.01176471, 1,
-0.5378821, -0.7122011, -2.156707, 0, 1, 0.01568628, 1,
-0.5325327, 0.3049995, -1.087771, 0, 1, 0.02352941, 1,
-0.5155867, -0.1146029, -1.20975, 0, 1, 0.02745098, 1,
-0.5143927, -1.803318, -4.097779, 0, 1, 0.03529412, 1,
-0.5143819, 0.1104416, -0.3706901, 0, 1, 0.03921569, 1,
-0.5129076, 0.8511809, 0.2907053, 0, 1, 0.04705882, 1,
-0.5088663, 0.8811446, 1.045522, 0, 1, 0.05098039, 1,
-0.5083041, -1.090805, -2.079225, 0, 1, 0.05882353, 1,
-0.5014635, -0.006133177, -2.395851, 0, 1, 0.0627451, 1,
-0.5008665, 0.6594345, 0.7724171, 0, 1, 0.07058824, 1,
-0.5005025, -1.042586, -2.976091, 0, 1, 0.07450981, 1,
-0.5003341, -0.1334911, -0.8733618, 0, 1, 0.08235294, 1,
-0.499422, 0.9151435, 0.0778883, 0, 1, 0.08627451, 1,
-0.4934216, -0.1739632, -3.213912, 0, 1, 0.09411765, 1,
-0.4932125, 1.635837, -0.5310822, 0, 1, 0.1019608, 1,
-0.4879535, -1.1025, -2.879049, 0, 1, 0.1058824, 1,
-0.4867629, -0.1864979, -2.069917, 0, 1, 0.1137255, 1,
-0.486319, 0.9719875, -0.3131756, 0, 1, 0.1176471, 1,
-0.4811131, 0.798148, 0.3036193, 0, 1, 0.1254902, 1,
-0.4732967, -1.012844, -2.325038, 0, 1, 0.1294118, 1,
-0.4715191, 0.4258083, -0.3603842, 0, 1, 0.1372549, 1,
-0.4662546, 0.7409651, -2.772046, 0, 1, 0.1411765, 1,
-0.4648021, 0.9849476, 0.3306993, 0, 1, 0.1490196, 1,
-0.4601436, 0.9749077, 0.1181052, 0, 1, 0.1529412, 1,
-0.458299, -0.7945994, -1.903893, 0, 1, 0.1607843, 1,
-0.4567094, -0.4151103, -1.745549, 0, 1, 0.1647059, 1,
-0.4530502, -1.268702, -3.69316, 0, 1, 0.172549, 1,
-0.4487929, 0.8805838, -0.3591603, 0, 1, 0.1764706, 1,
-0.4486421, -0.1935655, -2.811424, 0, 1, 0.1843137, 1,
-0.4474587, 1.444515, 0.8919999, 0, 1, 0.1882353, 1,
-0.4406251, -0.9386465, -4.137743, 0, 1, 0.1960784, 1,
-0.4379965, 0.6487893, -0.02035898, 0, 1, 0.2039216, 1,
-0.4379668, -0.518864, -3.133443, 0, 1, 0.2078431, 1,
-0.4331116, 0.4364613, 2.176225, 0, 1, 0.2156863, 1,
-0.4317442, 0.1462022, -2.328344, 0, 1, 0.2196078, 1,
-0.4299139, 0.3815461, -1.493066, 0, 1, 0.227451, 1,
-0.4223275, 1.103341, -1.057954, 0, 1, 0.2313726, 1,
-0.406519, -0.5720237, -2.163014, 0, 1, 0.2392157, 1,
-0.403797, 0.7779202, -1.416663, 0, 1, 0.2431373, 1,
-0.402775, 0.03316325, -2.978367, 0, 1, 0.2509804, 1,
-0.402592, -0.4565374, -2.654727, 0, 1, 0.254902, 1,
-0.4010891, -0.7571132, -2.393431, 0, 1, 0.2627451, 1,
-0.3908432, 0.9593216, -0.9199868, 0, 1, 0.2666667, 1,
-0.385914, -1.408951, -1.729329, 0, 1, 0.2745098, 1,
-0.3842932, 1.403915, -1.536365, 0, 1, 0.2784314, 1,
-0.3766693, -0.67105, -1.829308, 0, 1, 0.2862745, 1,
-0.3727846, 0.09576493, 0.7716061, 0, 1, 0.2901961, 1,
-0.3685535, -1.869125, -1.374436, 0, 1, 0.2980392, 1,
-0.3680893, 0.5399852, -0.1673214, 0, 1, 0.3058824, 1,
-0.3676706, 2.489278, 0.6471416, 0, 1, 0.3098039, 1,
-0.365302, 0.1899196, -2.108339, 0, 1, 0.3176471, 1,
-0.3635072, -1.018552, -2.725104, 0, 1, 0.3215686, 1,
-0.3613853, -0.6341552, -3.341021, 0, 1, 0.3294118, 1,
-0.3598089, -1.476133, -2.981066, 0, 1, 0.3333333, 1,
-0.3588051, 0.4274001, 0.1572854, 0, 1, 0.3411765, 1,
-0.3576727, 0.0670105, -0.7775414, 0, 1, 0.345098, 1,
-0.354561, -0.8361672, -3.149539, 0, 1, 0.3529412, 1,
-0.3522699, 0.8422953, -0.3965634, 0, 1, 0.3568628, 1,
-0.35155, 0.06076741, -0.1115333, 0, 1, 0.3647059, 1,
-0.349369, -0.2847939, -2.457707, 0, 1, 0.3686275, 1,
-0.348666, -0.292566, -2.156164, 0, 1, 0.3764706, 1,
-0.3468854, -0.4965079, -2.347335, 0, 1, 0.3803922, 1,
-0.3460618, -0.8997863, -1.244268, 0, 1, 0.3882353, 1,
-0.3424993, 0.08531134, -2.411475, 0, 1, 0.3921569, 1,
-0.340818, 0.3438039, -1.281536, 0, 1, 0.4, 1,
-0.3368319, 0.2828406, -1.623913, 0, 1, 0.4078431, 1,
-0.3363456, 1.107454, -0.3345633, 0, 1, 0.4117647, 1,
-0.3318226, -1.990653, -3.721763, 0, 1, 0.4196078, 1,
-0.3303625, -0.2414639, -1.867238, 0, 1, 0.4235294, 1,
-0.3247516, 0.193734, -1.619897, 0, 1, 0.4313726, 1,
-0.3231756, 0.8838623, -1.016383, 0, 1, 0.4352941, 1,
-0.3199937, 0.5559127, 0.8859556, 0, 1, 0.4431373, 1,
-0.3153039, 0.1733021, -2.372618, 0, 1, 0.4470588, 1,
-0.3111453, 0.4747513, 0.5945876, 0, 1, 0.454902, 1,
-0.3078594, -0.174485, -1.340341, 0, 1, 0.4588235, 1,
-0.3030269, 2.324649, 0.5528329, 0, 1, 0.4666667, 1,
-0.3001102, -1.858972, -3.250727, 0, 1, 0.4705882, 1,
-0.2992239, 0.3932423, -1.195709, 0, 1, 0.4784314, 1,
-0.2934542, 0.4334928, -0.1816269, 0, 1, 0.4823529, 1,
-0.2922808, -0.03777878, -1.012089, 0, 1, 0.4901961, 1,
-0.2915611, 0.4726905, -1.622869, 0, 1, 0.4941176, 1,
-0.2903527, 0.8067287, -0.284172, 0, 1, 0.5019608, 1,
-0.2878834, -0.1486929, -3.50978, 0, 1, 0.509804, 1,
-0.2876264, -2.12098, -3.427593, 0, 1, 0.5137255, 1,
-0.2858213, 0.2133458, -0.3595309, 0, 1, 0.5215687, 1,
-0.2731379, 0.9444598, 0.1482349, 0, 1, 0.5254902, 1,
-0.2730482, -1.545008, -3.38906, 0, 1, 0.5333334, 1,
-0.2717187, -1.180743, -2.143458, 0, 1, 0.5372549, 1,
-0.2671347, 1.291676, -1.574528, 0, 1, 0.5450981, 1,
-0.2663469, 0.1676775, 0.01685924, 0, 1, 0.5490196, 1,
-0.2645295, 0.8526553, -2.925473, 0, 1, 0.5568628, 1,
-0.2544103, 0.03316642, -2.444538, 0, 1, 0.5607843, 1,
-0.2530174, 1.162145, -1.277026, 0, 1, 0.5686275, 1,
-0.2520744, -0.7508454, -2.732002, 0, 1, 0.572549, 1,
-0.2515604, -0.9030992, -3.120911, 0, 1, 0.5803922, 1,
-0.2470422, -1.43313, -2.922071, 0, 1, 0.5843138, 1,
-0.2404707, 0.2387184, -0.5055359, 0, 1, 0.5921569, 1,
-0.2393103, 1.303807, 1.976717, 0, 1, 0.5960785, 1,
-0.2385986, 0.990073, -0.9426772, 0, 1, 0.6039216, 1,
-0.2352446, -0.02715629, -1.428588, 0, 1, 0.6117647, 1,
-0.2348118, 1.234039, 0.7125732, 0, 1, 0.6156863, 1,
-0.230905, -0.1801812, -1.7131, 0, 1, 0.6235294, 1,
-0.2290713, 0.4688636, -0.8557675, 0, 1, 0.627451, 1,
-0.2238425, 1.544459, 0.3696191, 0, 1, 0.6352941, 1,
-0.2228286, 0.5757592, -1.169026, 0, 1, 0.6392157, 1,
-0.2155769, -0.2639273, -2.180513, 0, 1, 0.6470588, 1,
-0.2147726, -0.89108, -3.85038, 0, 1, 0.6509804, 1,
-0.2137693, -0.1000888, -3.383304, 0, 1, 0.6588235, 1,
-0.212137, -0.7105816, -3.491358, 0, 1, 0.6627451, 1,
-0.2118418, -0.9886609, -3.00814, 0, 1, 0.6705883, 1,
-0.2078259, -0.4594678, -2.84858, 0, 1, 0.6745098, 1,
-0.2055548, -0.578315, -2.803109, 0, 1, 0.682353, 1,
-0.2035085, 1.245514, -1.591374, 0, 1, 0.6862745, 1,
-0.2031127, -1.648752, -1.715913, 0, 1, 0.6941177, 1,
-0.2025663, 0.797828, 0.7581304, 0, 1, 0.7019608, 1,
-0.1936935, 0.4838241, -0.1430307, 0, 1, 0.7058824, 1,
-0.1906506, 1.380636, -0.760844, 0, 1, 0.7137255, 1,
-0.1898255, 1.643157, -0.5034418, 0, 1, 0.7176471, 1,
-0.1888227, 1.624154, 0.8659089, 0, 1, 0.7254902, 1,
-0.185561, 1.706565, -0.817672, 0, 1, 0.7294118, 1,
-0.1850352, -1.010729, -2.669199, 0, 1, 0.7372549, 1,
-0.182176, -0.6947342, -2.834258, 0, 1, 0.7411765, 1,
-0.1791761, 1.310087, 1.366099, 0, 1, 0.7490196, 1,
-0.1766672, 0.43667, -1.350012, 0, 1, 0.7529412, 1,
-0.1717238, -1.489211, -3.269728, 0, 1, 0.7607843, 1,
-0.1689514, -0.6336402, -0.9858208, 0, 1, 0.7647059, 1,
-0.1662914, 1.598108, 1.974479, 0, 1, 0.772549, 1,
-0.1660805, 0.7630574, 0.4781872, 0, 1, 0.7764706, 1,
-0.1568598, -0.306563, -2.158926, 0, 1, 0.7843137, 1,
-0.155383, 0.6361791, -2.649645, 0, 1, 0.7882353, 1,
-0.155025, 0.7611144, -1.913373, 0, 1, 0.7960784, 1,
-0.1531223, 1.029001, 0.8367571, 0, 1, 0.8039216, 1,
-0.1517957, -1.512111, -2.759809, 0, 1, 0.8078431, 1,
-0.1449552, -0.6843346, -1.318098, 0, 1, 0.8156863, 1,
-0.1374157, 0.1913734, -0.1317611, 0, 1, 0.8196079, 1,
-0.1355847, -0.5773269, -4.013508, 0, 1, 0.827451, 1,
-0.1355557, -0.06545074, -0.09117521, 0, 1, 0.8313726, 1,
-0.1334672, 0.02806658, -1.456901, 0, 1, 0.8392157, 1,
-0.1309811, -2.226404, -3.557054, 0, 1, 0.8431373, 1,
-0.1294908, -1.22522, -2.747828, 0, 1, 0.8509804, 1,
-0.1276099, -0.05664833, -1.781269, 0, 1, 0.854902, 1,
-0.1240162, -0.6667423, -1.647096, 0, 1, 0.8627451, 1,
-0.1239866, -0.8479066, -1.098861, 0, 1, 0.8666667, 1,
-0.1195524, -0.1684245, -3.218463, 0, 1, 0.8745098, 1,
-0.1148956, 0.05875044, -1.3772, 0, 1, 0.8784314, 1,
-0.11375, 0.6727713, 0.1515551, 0, 1, 0.8862745, 1,
-0.1135853, 1.010587, -0.05836933, 0, 1, 0.8901961, 1,
-0.1109372, 1.259836, -0.284005, 0, 1, 0.8980392, 1,
-0.1071458, -0.09290612, -1.712347, 0, 1, 0.9058824, 1,
-0.1067812, -0.8459852, -3.263447, 0, 1, 0.9098039, 1,
-0.1057247, 1.684899, 0.3183938, 0, 1, 0.9176471, 1,
-0.1042513, 0.1724574, -0.5537094, 0, 1, 0.9215686, 1,
-0.09886019, -0.1268288, -1.004009, 0, 1, 0.9294118, 1,
-0.09630815, -0.941063, -2.556262, 0, 1, 0.9333333, 1,
-0.09053326, 0.9878806, -0.9963921, 0, 1, 0.9411765, 1,
-0.08935254, 1.456852, 1.754453, 0, 1, 0.945098, 1,
-0.08750477, -0.1663446, -1.846533, 0, 1, 0.9529412, 1,
-0.08579191, 1.626743, 0.5113369, 0, 1, 0.9568627, 1,
-0.08430447, 1.169219, 0.8347836, 0, 1, 0.9647059, 1,
-0.08406016, 1.476989, 0.01067717, 0, 1, 0.9686275, 1,
-0.07206713, -1.110539, -3.571433, 0, 1, 0.9764706, 1,
-0.07114113, 0.9990419, 0.09617629, 0, 1, 0.9803922, 1,
-0.07098324, 0.5313061, 0.3594863, 0, 1, 0.9882353, 1,
-0.06994233, 1.302337, -1.54674, 0, 1, 0.9921569, 1,
-0.06517988, 0.6255158, 0.4667907, 0, 1, 1, 1,
-0.06461593, 0.3987841, 0.08014901, 0, 0.9921569, 1, 1,
-0.06305186, 0.2980936, -0.4395211, 0, 0.9882353, 1, 1,
-0.06106276, -1.665525, -3.970771, 0, 0.9803922, 1, 1,
-0.05413901, -2.499717, -2.196933, 0, 0.9764706, 1, 1,
-0.04411018, 0.3895255, 0.4942267, 0, 0.9686275, 1, 1,
-0.04174889, -0.4093132, -1.256193, 0, 0.9647059, 1, 1,
-0.04077264, -0.4807093, -1.557885, 0, 0.9568627, 1, 1,
-0.03962548, -2.125598, -3.338555, 0, 0.9529412, 1, 1,
-0.0365878, -0.6069258, -1.768114, 0, 0.945098, 1, 1,
-0.03481142, -1.138957, -4.503814, 0, 0.9411765, 1, 1,
-0.03163218, 1.749185, -0.1178775, 0, 0.9333333, 1, 1,
-0.03103252, 0.9807221, 0.1734339, 0, 0.9294118, 1, 1,
-0.03035536, -0.3581966, -2.549848, 0, 0.9215686, 1, 1,
-0.02636518, -0.1918527, -3.220754, 0, 0.9176471, 1, 1,
-0.02568023, 0.1933872, -1.512093, 0, 0.9098039, 1, 1,
-0.02504033, 0.5557573, 1.276673, 0, 0.9058824, 1, 1,
-0.01243932, 0.07579606, 0.5019158, 0, 0.8980392, 1, 1,
-0.01035934, -0.3405801, -3.487307, 0, 0.8901961, 1, 1,
-0.009734294, 0.4183705, -0.2177104, 0, 0.8862745, 1, 1,
-0.008020337, -0.9672897, -0.4805417, 0, 0.8784314, 1, 1,
-0.002669091, -0.5073966, -4.969797, 0, 0.8745098, 1, 1,
0.001690144, 0.704461, -0.5432392, 0, 0.8666667, 1, 1,
0.002384865, -1.849798, 4.344159, 0, 0.8627451, 1, 1,
0.004850095, 1.317165, -0.8071812, 0, 0.854902, 1, 1,
0.00596152, -0.1908966, 2.625238, 0, 0.8509804, 1, 1,
0.00922805, -1.271759, 3.802113, 0, 0.8431373, 1, 1,
0.01088775, 1.311937, -0.2260491, 0, 0.8392157, 1, 1,
0.01097067, -0.1964588, 3.705994, 0, 0.8313726, 1, 1,
0.0120058, -2.297779, 1.924042, 0, 0.827451, 1, 1,
0.01324762, 0.4068863, -0.1610001, 0, 0.8196079, 1, 1,
0.01360114, -1.520039, 3.080391, 0, 0.8156863, 1, 1,
0.01411891, 0.03836559, 2.193738, 0, 0.8078431, 1, 1,
0.01523578, 1.126188, 0.004786736, 0, 0.8039216, 1, 1,
0.01855088, 1.132187, -0.1160926, 0, 0.7960784, 1, 1,
0.01906474, -0.5148679, 1.720411, 0, 0.7882353, 1, 1,
0.0218063, 0.09164585, -0.7588022, 0, 0.7843137, 1, 1,
0.02512404, -0.5248429, 4.692163, 0, 0.7764706, 1, 1,
0.02929079, -1.313483, 4.621008, 0, 0.772549, 1, 1,
0.02999374, 0.6346407, -0.6618764, 0, 0.7647059, 1, 1,
0.04150928, -1.174104, 3.289352, 0, 0.7607843, 1, 1,
0.04190529, 0.8154388, 1.072042, 0, 0.7529412, 1, 1,
0.04244941, -1.002046, 3.728416, 0, 0.7490196, 1, 1,
0.04328594, -1.635094, 3.139538, 0, 0.7411765, 1, 1,
0.04661837, 1.685361, -2.493707, 0, 0.7372549, 1, 1,
0.04694529, 1.609219, 0.3224614, 0, 0.7294118, 1, 1,
0.05147366, -0.05982429, 2.139799, 0, 0.7254902, 1, 1,
0.0526513, 0.4675957, -1.885181, 0, 0.7176471, 1, 1,
0.05580257, 0.2720947, -0.3856732, 0, 0.7137255, 1, 1,
0.05815247, -0.5780826, 5.443868, 0, 0.7058824, 1, 1,
0.05936203, 2.42466, -0.4798019, 0, 0.6980392, 1, 1,
0.06638886, 1.267489, 0.3987001, 0, 0.6941177, 1, 1,
0.06984772, 0.6176049, -0.9401562, 0, 0.6862745, 1, 1,
0.07621442, 1.092423, -1.01339, 0, 0.682353, 1, 1,
0.07628413, 0.3634508, -0.9783795, 0, 0.6745098, 1, 1,
0.08006423, 0.04513875, 1.977694, 0, 0.6705883, 1, 1,
0.08401112, 1.223887, -0.6850221, 0, 0.6627451, 1, 1,
0.08529432, -0.2524624, 1.920034, 0, 0.6588235, 1, 1,
0.08791083, -0.8490014, 5.450129, 0, 0.6509804, 1, 1,
0.08890997, -0.4765718, 4.050033, 0, 0.6470588, 1, 1,
0.09254556, -2.69125, 1.371079, 0, 0.6392157, 1, 1,
0.09603516, -1.624421, 3.764023, 0, 0.6352941, 1, 1,
0.09695425, 1.637005, -0.5232883, 0, 0.627451, 1, 1,
0.1005128, 2.666372, -0.1844709, 0, 0.6235294, 1, 1,
0.1012541, 1.367473, 0.2689172, 0, 0.6156863, 1, 1,
0.1016292, 0.8350638, -0.09966565, 0, 0.6117647, 1, 1,
0.1026402, -0.4817834, 3.704021, 0, 0.6039216, 1, 1,
0.103292, -0.2806082, 2.394816, 0, 0.5960785, 1, 1,
0.1033614, -0.3130634, 0.9510723, 0, 0.5921569, 1, 1,
0.1046895, 1.074452, -2.173286, 0, 0.5843138, 1, 1,
0.1059408, -2.550202, -0.1912647, 0, 0.5803922, 1, 1,
0.1112469, 0.309061, 1.048968, 0, 0.572549, 1, 1,
0.1164534, 0.4166438, -2.462964, 0, 0.5686275, 1, 1,
0.1171397, -1.274399, 2.783479, 0, 0.5607843, 1, 1,
0.1201111, -0.07028008, 1.812395, 0, 0.5568628, 1, 1,
0.1214316, 2.263018, 1.20526, 0, 0.5490196, 1, 1,
0.123905, -0.3109984, 1.408438, 0, 0.5450981, 1, 1,
0.1305331, 0.7897557, 0.7801156, 0, 0.5372549, 1, 1,
0.1312379, -0.5708051, 1.97223, 0, 0.5333334, 1, 1,
0.1315663, -0.5616082, 2.103586, 0, 0.5254902, 1, 1,
0.1384979, -1.307191, 2.047178, 0, 0.5215687, 1, 1,
0.1401969, -2.592431, 3.906389, 0, 0.5137255, 1, 1,
0.1406468, -0.7460291, 3.101146, 0, 0.509804, 1, 1,
0.1421658, 0.4037157, 0.306992, 0, 0.5019608, 1, 1,
0.1445717, 0.574423, -0.9790818, 0, 0.4941176, 1, 1,
0.1452721, 0.7798168, -0.664471, 0, 0.4901961, 1, 1,
0.1459555, -0.05898386, 3.270158, 0, 0.4823529, 1, 1,
0.1476777, -0.1892293, 1.884711, 0, 0.4784314, 1, 1,
0.1514372, -0.8336326, 3.072877, 0, 0.4705882, 1, 1,
0.1527704, 0.3419999, -0.495691, 0, 0.4666667, 1, 1,
0.1603474, 1.325367, 0.2530761, 0, 0.4588235, 1, 1,
0.1607604, 1.02288, -0.7651993, 0, 0.454902, 1, 1,
0.1621234, -1.669591, 4.22423, 0, 0.4470588, 1, 1,
0.1661993, -1.150598, 3.02785, 0, 0.4431373, 1, 1,
0.1703434, 1.446605, 0.4901808, 0, 0.4352941, 1, 1,
0.1716883, 1.977546, -0.4622557, 0, 0.4313726, 1, 1,
0.1734717, 0.01004391, 1.322606, 0, 0.4235294, 1, 1,
0.1736306, 0.08585243, 0.2926689, 0, 0.4196078, 1, 1,
0.1829878, -1.472601, 2.959622, 0, 0.4117647, 1, 1,
0.1891506, -0.5188046, 0.9715527, 0, 0.4078431, 1, 1,
0.1910332, -0.1954893, 4.035121, 0, 0.4, 1, 1,
0.1951408, -0.336652, 2.002373, 0, 0.3921569, 1, 1,
0.1952367, -1.151014, 2.863161, 0, 0.3882353, 1, 1,
0.2010695, -0.5038777, 3.260909, 0, 0.3803922, 1, 1,
0.2011293, 0.9926715, -0.7173344, 0, 0.3764706, 1, 1,
0.2128177, -0.6732677, 3.65375, 0, 0.3686275, 1, 1,
0.2149622, -0.538383, 2.325176, 0, 0.3647059, 1, 1,
0.2185401, 0.781252, -0.8659974, 0, 0.3568628, 1, 1,
0.2201417, -0.5844713, 2.545858, 0, 0.3529412, 1, 1,
0.2310698, -1.88233, 3.520581, 0, 0.345098, 1, 1,
0.2418826, -0.1464079, 1.700125, 0, 0.3411765, 1, 1,
0.2464606, -0.6399876, 3.539736, 0, 0.3333333, 1, 1,
0.2493696, 0.07072891, 1.030582, 0, 0.3294118, 1, 1,
0.2551936, 2.358796, -0.2679242, 0, 0.3215686, 1, 1,
0.255733, -0.9012975, 3.100929, 0, 0.3176471, 1, 1,
0.2561153, 0.09845615, 2.214316, 0, 0.3098039, 1, 1,
0.2606624, -0.6889346, 3.752349, 0, 0.3058824, 1, 1,
0.2628634, -1.344393, 2.836737, 0, 0.2980392, 1, 1,
0.2654645, 0.3197798, 2.011324, 0, 0.2901961, 1, 1,
0.268804, 0.3538814, -0.6637492, 0, 0.2862745, 1, 1,
0.2689764, -1.024777, 2.506422, 0, 0.2784314, 1, 1,
0.2725289, 0.3974322, 1.760476, 0, 0.2745098, 1, 1,
0.2758687, -1.477996, 2.529811, 0, 0.2666667, 1, 1,
0.2762257, -0.09268761, 3.127244, 0, 0.2627451, 1, 1,
0.2781034, 0.1340253, 1.330759, 0, 0.254902, 1, 1,
0.2785762, -1.002264, 3.822892, 0, 0.2509804, 1, 1,
0.2839403, -0.8383051, 2.300815, 0, 0.2431373, 1, 1,
0.289715, 0.6062891, 1.902604, 0, 0.2392157, 1, 1,
0.2926126, 3.057486, -0.01451541, 0, 0.2313726, 1, 1,
0.2944435, 1.234315, 0.119338, 0, 0.227451, 1, 1,
0.3007196, 2.00164, -0.6340653, 0, 0.2196078, 1, 1,
0.3010056, -2.106994, 3.302431, 0, 0.2156863, 1, 1,
0.302675, 0.5764983, -0.61292, 0, 0.2078431, 1, 1,
0.3091381, 1.013966, -0.7562208, 0, 0.2039216, 1, 1,
0.3101087, -1.128458, 1.33166, 0, 0.1960784, 1, 1,
0.3119275, -0.498856, 2.142398, 0, 0.1882353, 1, 1,
0.3172128, -1.250694, 1.125123, 0, 0.1843137, 1, 1,
0.3179798, 0.7950038, 0.933647, 0, 0.1764706, 1, 1,
0.318403, -1.313581, 2.613891, 0, 0.172549, 1, 1,
0.3188842, 2.398578, -1.786153, 0, 0.1647059, 1, 1,
0.3236094, 1.211887, 0.6029512, 0, 0.1607843, 1, 1,
0.3281432, 0.498527, 2.416511, 0, 0.1529412, 1, 1,
0.3289481, 1.058005, -0.3179339, 0, 0.1490196, 1, 1,
0.3299912, 0.03185276, 1.644243, 0, 0.1411765, 1, 1,
0.3353083, -0.2640843, 0.7408206, 0, 0.1372549, 1, 1,
0.3379417, -0.9156137, 2.515068, 0, 0.1294118, 1, 1,
0.3393822, -0.4607862, 2.891673, 0, 0.1254902, 1, 1,
0.3440873, -0.784594, 2.389599, 0, 0.1176471, 1, 1,
0.3456637, 0.1420115, 0.6159042, 0, 0.1137255, 1, 1,
0.3475013, -0.1373109, 3.081571, 0, 0.1058824, 1, 1,
0.348738, -1.613766, 4.499125, 0, 0.09803922, 1, 1,
0.3520013, -0.5493294, 2.620767, 0, 0.09411765, 1, 1,
0.3524096, -0.3967693, 1.789979, 0, 0.08627451, 1, 1,
0.3540151, 0.4520116, 0.9022341, 0, 0.08235294, 1, 1,
0.3542362, -0.9237157, 3.01998, 0, 0.07450981, 1, 1,
0.3569767, -0.4665436, 1.849634, 0, 0.07058824, 1, 1,
0.3607883, -2.038494, 1.87031, 0, 0.0627451, 1, 1,
0.3615431, -2.263631, 3.895816, 0, 0.05882353, 1, 1,
0.3638034, -0.5647388, 1.737163, 0, 0.05098039, 1, 1,
0.3649124, -0.4944713, 3.68274, 0, 0.04705882, 1, 1,
0.3654716, 1.148268, -1.1849, 0, 0.03921569, 1, 1,
0.3658465, 0.5887701, 0.3982621, 0, 0.03529412, 1, 1,
0.3663168, 0.7723749, 2.372645, 0, 0.02745098, 1, 1,
0.3721506, -0.7818856, 1.885559, 0, 0.02352941, 1, 1,
0.3765513, -0.3420245, 1.322062, 0, 0.01568628, 1, 1,
0.3775392, 0.8775232, 1.305326, 0, 0.01176471, 1, 1,
0.3775648, -1.124404, 2.628855, 0, 0.003921569, 1, 1,
0.3817237, 1.163739, 0.6807948, 0.003921569, 0, 1, 1,
0.385343, -0.02158128, 2.516717, 0.007843138, 0, 1, 1,
0.3869927, -0.8619695, 1.382853, 0.01568628, 0, 1, 1,
0.3898571, -1.203676, 1.287235, 0.01960784, 0, 1, 1,
0.3917832, -0.6566659, 4.623889, 0.02745098, 0, 1, 1,
0.3926489, 1.494899, 0.9748322, 0.03137255, 0, 1, 1,
0.3930271, -0.7362901, 3.385241, 0.03921569, 0, 1, 1,
0.3935662, -0.366181, 3.083823, 0.04313726, 0, 1, 1,
0.3949504, 2.476762, -0.1986662, 0.05098039, 0, 1, 1,
0.3987202, -0.7384997, 3.98546, 0.05490196, 0, 1, 1,
0.3990634, 1.543721, 0.09326704, 0.0627451, 0, 1, 1,
0.4010748, -1.243011, 2.561425, 0.06666667, 0, 1, 1,
0.4141437, -1.423907, 1.90676, 0.07450981, 0, 1, 1,
0.4148778, 0.2482222, 2.003531, 0.07843138, 0, 1, 1,
0.4178429, -1.072748, 2.023796, 0.08627451, 0, 1, 1,
0.418766, -0.4564462, 3.867204, 0.09019608, 0, 1, 1,
0.419323, -0.2699583, 1.68183, 0.09803922, 0, 1, 1,
0.420278, -1.544606, 3.439043, 0.1058824, 0, 1, 1,
0.4240569, -0.7385922, 2.456601, 0.1098039, 0, 1, 1,
0.424581, 0.6407087, 0.6791508, 0.1176471, 0, 1, 1,
0.42662, -0.447685, 1.885173, 0.1215686, 0, 1, 1,
0.4305866, -1.13723, 4.403908, 0.1294118, 0, 1, 1,
0.432118, -0.2527413, 2.07368, 0.1333333, 0, 1, 1,
0.433116, 1.211703, 0.08276243, 0.1411765, 0, 1, 1,
0.4331309, -1.928543, 2.555746, 0.145098, 0, 1, 1,
0.4397033, 2.101417, 0.1028571, 0.1529412, 0, 1, 1,
0.4431068, -1.902432, 2.756021, 0.1568628, 0, 1, 1,
0.4454536, 2.004867, 0.02090691, 0.1647059, 0, 1, 1,
0.4504679, -1.485039, 1.462539, 0.1686275, 0, 1, 1,
0.4586551, -0.4399683, 3.054946, 0.1764706, 0, 1, 1,
0.4636237, 1.112954, -0.7857886, 0.1803922, 0, 1, 1,
0.4671776, -0.6059783, 3.512824, 0.1882353, 0, 1, 1,
0.4725087, 0.1005889, 2.764925, 0.1921569, 0, 1, 1,
0.4754824, 0.1862729, -0.4362403, 0.2, 0, 1, 1,
0.4771346, 0.595941, 1.474254, 0.2078431, 0, 1, 1,
0.4773501, 0.02065828, 1.321265, 0.2117647, 0, 1, 1,
0.4774026, 1.079866, -0.3012604, 0.2196078, 0, 1, 1,
0.4804356, -0.5094079, 3.255244, 0.2235294, 0, 1, 1,
0.4814295, 1.911888, 0.9005088, 0.2313726, 0, 1, 1,
0.4854788, -0.3547539, 2.032867, 0.2352941, 0, 1, 1,
0.4886894, -0.1803142, 1.243567, 0.2431373, 0, 1, 1,
0.4973539, 1.179567, 0.3152805, 0.2470588, 0, 1, 1,
0.5016963, 0.7219378, 0.4097207, 0.254902, 0, 1, 1,
0.506866, -0.4731649, 2.975959, 0.2588235, 0, 1, 1,
0.5068855, -1.428998, 2.312011, 0.2666667, 0, 1, 1,
0.5120824, 0.8702735, -0.1491622, 0.2705882, 0, 1, 1,
0.5124956, 0.1952718, 2.587492, 0.2784314, 0, 1, 1,
0.5188586, 0.9815035, 0.339397, 0.282353, 0, 1, 1,
0.5199131, -1.363495, 3.842179, 0.2901961, 0, 1, 1,
0.5228136, 0.2016573, 0.08429029, 0.2941177, 0, 1, 1,
0.5280841, 0.695045, -1.064629, 0.3019608, 0, 1, 1,
0.5315098, -2.246871, 2.980588, 0.3098039, 0, 1, 1,
0.5368503, 1.073842, 0.08038471, 0.3137255, 0, 1, 1,
0.538325, -0.3993902, 1.595477, 0.3215686, 0, 1, 1,
0.5429866, 2.125895, -0.8027654, 0.3254902, 0, 1, 1,
0.5461227, -0.8806043, 0.105731, 0.3333333, 0, 1, 1,
0.5506031, -0.0530692, 3.488298, 0.3372549, 0, 1, 1,
0.5507935, 0.9124805, 0.0932066, 0.345098, 0, 1, 1,
0.5533656, -1.054477, 1.570472, 0.3490196, 0, 1, 1,
0.5563411, 0.4021582, -0.4715696, 0.3568628, 0, 1, 1,
0.5681866, 1.013784, -0.4468298, 0.3607843, 0, 1, 1,
0.585593, 0.4203398, 1.594811, 0.3686275, 0, 1, 1,
0.5857113, 0.7682413, 2.253904, 0.372549, 0, 1, 1,
0.5875046, 1.608516, -0.5683959, 0.3803922, 0, 1, 1,
0.594486, 1.737801, 1.985021, 0.3843137, 0, 1, 1,
0.5945724, 1.122218, 0.9054935, 0.3921569, 0, 1, 1,
0.5956036, 1.117221, 0.6905754, 0.3960784, 0, 1, 1,
0.5957095, 0.2959877, 0.3546359, 0.4039216, 0, 1, 1,
0.5963451, 0.3074849, 0.7027035, 0.4117647, 0, 1, 1,
0.602352, 0.7402188, 2.212528, 0.4156863, 0, 1, 1,
0.6037471, -2.978334, 2.424841, 0.4235294, 0, 1, 1,
0.6083838, -0.3612297, 1.910852, 0.427451, 0, 1, 1,
0.6188469, -0.6523569, 0.4753143, 0.4352941, 0, 1, 1,
0.6193783, 1.55314, 1.419776, 0.4392157, 0, 1, 1,
0.6226143, 1.279119, -0.02150859, 0.4470588, 0, 1, 1,
0.6226206, -0.3476361, 3.352003, 0.4509804, 0, 1, 1,
0.6247691, -0.9270223, 1.697829, 0.4588235, 0, 1, 1,
0.6270723, 1.723172, 1.840149, 0.4627451, 0, 1, 1,
0.6293995, -1.825307, 3.441897, 0.4705882, 0, 1, 1,
0.635844, 1.28271, 0.5915226, 0.4745098, 0, 1, 1,
0.6358578, 1.13067, 1.172267, 0.4823529, 0, 1, 1,
0.6361655, 0.1718987, -0.5314417, 0.4862745, 0, 1, 1,
0.6384619, -0.9388832, 1.689176, 0.4941176, 0, 1, 1,
0.6410413, 0.5913877, 0.9761593, 0.5019608, 0, 1, 1,
0.6430991, -0.3028384, 0.531692, 0.5058824, 0, 1, 1,
0.6472058, -0.4360356, 1.13162, 0.5137255, 0, 1, 1,
0.6486421, 0.002625654, 0.4328945, 0.5176471, 0, 1, 1,
0.6496593, -0.104227, 3.107306, 0.5254902, 0, 1, 1,
0.6520826, -1.273695, 2.793193, 0.5294118, 0, 1, 1,
0.6559982, -0.4216786, 2.613172, 0.5372549, 0, 1, 1,
0.6596353, 0.7717627, -0.7811141, 0.5411765, 0, 1, 1,
0.6673713, -1.106666, 1.38313, 0.5490196, 0, 1, 1,
0.6674033, -0.5473752, 3.533778, 0.5529412, 0, 1, 1,
0.6737133, 1.400178, 0.5567783, 0.5607843, 0, 1, 1,
0.6749874, -0.2645157, 1.924744, 0.5647059, 0, 1, 1,
0.6815528, -0.1822599, 2.056474, 0.572549, 0, 1, 1,
0.6904832, 0.6068733, 0.1970584, 0.5764706, 0, 1, 1,
0.6988373, 0.4996598, 2.606708, 0.5843138, 0, 1, 1,
0.6990199, -0.660956, 2.500695, 0.5882353, 0, 1, 1,
0.7048367, 0.7399798, -1.070958, 0.5960785, 0, 1, 1,
0.7134601, -0.4737673, 1.484274, 0.6039216, 0, 1, 1,
0.7243493, 0.7890214, -1.193296, 0.6078432, 0, 1, 1,
0.7274469, -1.075093, 3.048692, 0.6156863, 0, 1, 1,
0.7276077, -0.754801, 1.576407, 0.6196079, 0, 1, 1,
0.7377225, -0.3537081, 0.460311, 0.627451, 0, 1, 1,
0.7407643, 0.6736889, 1.738323, 0.6313726, 0, 1, 1,
0.7433033, -0.6957679, 3.033882, 0.6392157, 0, 1, 1,
0.7447282, 0.264874, 0.457042, 0.6431373, 0, 1, 1,
0.7456619, 0.1605096, 0.3413024, 0.6509804, 0, 1, 1,
0.7459049, 0.8405721, 1.898283, 0.654902, 0, 1, 1,
0.7493309, -0.161638, 3.157925, 0.6627451, 0, 1, 1,
0.7520072, 0.4240318, 2.308261, 0.6666667, 0, 1, 1,
0.770028, -0.823054, 2.799273, 0.6745098, 0, 1, 1,
0.785402, -0.5716603, 1.28376, 0.6784314, 0, 1, 1,
0.7868516, 0.2039973, 0.4955839, 0.6862745, 0, 1, 1,
0.7917179, -0.09958512, 2.700344, 0.6901961, 0, 1, 1,
0.7951704, 0.2105892, 1.255291, 0.6980392, 0, 1, 1,
0.7957764, 0.446077, 2.206413, 0.7058824, 0, 1, 1,
0.7982866, -0.3105044, 3.382061, 0.7098039, 0, 1, 1,
0.7994496, -0.850126, 2.033872, 0.7176471, 0, 1, 1,
0.7999437, -0.4131278, 3.303006, 0.7215686, 0, 1, 1,
0.8023098, -0.840991, 3.240413, 0.7294118, 0, 1, 1,
0.804007, -1.599572, 1.59084, 0.7333333, 0, 1, 1,
0.8084304, -1.315806, 1.857189, 0.7411765, 0, 1, 1,
0.8101435, -1.599883, 4.075408, 0.7450981, 0, 1, 1,
0.8103219, 0.1375628, 2.144247, 0.7529412, 0, 1, 1,
0.8175352, 1.323377, 1.039254, 0.7568628, 0, 1, 1,
0.8199603, 0.8309305, 1.61589, 0.7647059, 0, 1, 1,
0.8231397, 0.8265084, 2.125308, 0.7686275, 0, 1, 1,
0.8235171, -1.092458, 3.394437, 0.7764706, 0, 1, 1,
0.8279746, 0.4155682, 2.411022, 0.7803922, 0, 1, 1,
0.8282987, -1.380874, 2.594401, 0.7882353, 0, 1, 1,
0.8307307, 2.153891, 0.6309029, 0.7921569, 0, 1, 1,
0.8328094, -0.2102181, 2.502723, 0.8, 0, 1, 1,
0.8465158, -2.55486, 2.748968, 0.8078431, 0, 1, 1,
0.8525791, -0.01619928, 2.12627, 0.8117647, 0, 1, 1,
0.857094, -0.7634736, 3.23336, 0.8196079, 0, 1, 1,
0.8594758, -0.8966131, 3.31575, 0.8235294, 0, 1, 1,
0.8610125, -0.588243, 0.9931362, 0.8313726, 0, 1, 1,
0.8623384, 0.723609, 0.369934, 0.8352941, 0, 1, 1,
0.8716386, 1.631233, -0.4721274, 0.8431373, 0, 1, 1,
0.8781246, 0.7579347, 1.814924, 0.8470588, 0, 1, 1,
0.892494, -2.751071, 3.426846, 0.854902, 0, 1, 1,
0.89477, 0.1230769, 1.680132, 0.8588235, 0, 1, 1,
0.8960938, 1.740949, 1.228393, 0.8666667, 0, 1, 1,
0.8996319, 0.5513258, 0.9427025, 0.8705882, 0, 1, 1,
0.9005411, 0.4192382, 1.588068, 0.8784314, 0, 1, 1,
0.9023211, -1.052464, 1.916141, 0.8823529, 0, 1, 1,
0.9040245, 0.3424349, 0.5405862, 0.8901961, 0, 1, 1,
0.9069566, -0.0518075, 2.863844, 0.8941177, 0, 1, 1,
0.9088885, 0.7512621, 1.161202, 0.9019608, 0, 1, 1,
0.911639, -0.1535472, -0.07249276, 0.9098039, 0, 1, 1,
0.917255, 1.850237, 0.5749817, 0.9137255, 0, 1, 1,
0.919399, 1.521654, 1.221725, 0.9215686, 0, 1, 1,
0.9234269, -1.584731, 2.714817, 0.9254902, 0, 1, 1,
0.9259381, -0.3977504, 2.234033, 0.9333333, 0, 1, 1,
0.9302754, 0.3753624, 2.105415, 0.9372549, 0, 1, 1,
0.94252, 0.6177342, 1.12595, 0.945098, 0, 1, 1,
0.95019, 1.428087, 0.02319266, 0.9490196, 0, 1, 1,
0.9526332, 1.827774, 0.6949294, 0.9568627, 0, 1, 1,
0.9530814, 0.55215, 0.3993589, 0.9607843, 0, 1, 1,
0.9628096, -1.282906, 2.526026, 0.9686275, 0, 1, 1,
0.9628499, 0.5537981, -0.8999847, 0.972549, 0, 1, 1,
0.9664137, 0.945552, 1.838224, 0.9803922, 0, 1, 1,
0.976976, 1.544228, -0.7535234, 0.9843137, 0, 1, 1,
0.9771869, -0.4540799, 3.398609, 0.9921569, 0, 1, 1,
0.9772111, 0.6591325, 0.9819427, 0.9960784, 0, 1, 1,
0.9791171, -1.314689, 2.695239, 1, 0, 0.9960784, 1,
0.9897755, 0.1764477, 1.238635, 1, 0, 0.9882353, 1,
1.002856, 1.11801, 2.192315, 1, 0, 0.9843137, 1,
1.011418, -0.2736074, 1.82184, 1, 0, 0.9764706, 1,
1.023211, -0.3349518, 1.669325, 1, 0, 0.972549, 1,
1.025728, -0.265901, 2.306529, 1, 0, 0.9647059, 1,
1.043216, -0.07325555, 2.443151, 1, 0, 0.9607843, 1,
1.058705, -0.04460584, 2.62849, 1, 0, 0.9529412, 1,
1.059839, -0.5108565, 1.68324, 1, 0, 0.9490196, 1,
1.061924, 0.5153525, 0.7703061, 1, 0, 0.9411765, 1,
1.067588, -0.6679428, 0.3399882, 1, 0, 0.9372549, 1,
1.068081, -0.7444385, 1.749289, 1, 0, 0.9294118, 1,
1.068513, -0.7101427, 1.95784, 1, 0, 0.9254902, 1,
1.069035, -0.6842915, 1.050654, 1, 0, 0.9176471, 1,
1.072191, -1.414752, 3.112449, 1, 0, 0.9137255, 1,
1.072812, 0.3865713, 1.301194, 1, 0, 0.9058824, 1,
1.078432, -0.5410767, 3.050068, 1, 0, 0.9019608, 1,
1.078602, -0.893319, 3.179712, 1, 0, 0.8941177, 1,
1.078977, 0.1211001, 3.570529, 1, 0, 0.8862745, 1,
1.083757, 0.5445824, 3.054075, 1, 0, 0.8823529, 1,
1.084603, -0.6664748, 1.665472, 1, 0, 0.8745098, 1,
1.089577, -2.757195, 4.184718, 1, 0, 0.8705882, 1,
1.090023, 1.004578, 0.4471443, 1, 0, 0.8627451, 1,
1.09442, -1.032595, 0.3366401, 1, 0, 0.8588235, 1,
1.097588, 0.5052281, 0.8924737, 1, 0, 0.8509804, 1,
1.098179, 1.572924, 0.1456046, 1, 0, 0.8470588, 1,
1.10804, -1.263576, 1.665683, 1, 0, 0.8392157, 1,
1.108538, 1.292188, 0.1829052, 1, 0, 0.8352941, 1,
1.111672, -0.8704062, 3.938247, 1, 0, 0.827451, 1,
1.112064, -0.7147574, 2.635054, 1, 0, 0.8235294, 1,
1.113035, 0.633779, 2.772881, 1, 0, 0.8156863, 1,
1.113402, 0.07082237, 0.880111, 1, 0, 0.8117647, 1,
1.118305, -0.7625307, 4.285193, 1, 0, 0.8039216, 1,
1.12198, -0.809345, 2.45868, 1, 0, 0.7960784, 1,
1.125453, -0.4605707, 0.8510578, 1, 0, 0.7921569, 1,
1.12844, -0.5352225, 2.593184, 1, 0, 0.7843137, 1,
1.13165, -0.6901464, 1.107426, 1, 0, 0.7803922, 1,
1.133978, 0.7137532, -0.1570154, 1, 0, 0.772549, 1,
1.135825, -0.07990122, 2.282622, 1, 0, 0.7686275, 1,
1.136604, 0.07245522, 1.154417, 1, 0, 0.7607843, 1,
1.147944, 0.5993068, 0.8693538, 1, 0, 0.7568628, 1,
1.151544, -1.254338, 1.983999, 1, 0, 0.7490196, 1,
1.160858, -0.3514365, 1.370993, 1, 0, 0.7450981, 1,
1.168136, 0.8147306, 2.63313, 1, 0, 0.7372549, 1,
1.17045, 1.195153, 1.010463, 1, 0, 0.7333333, 1,
1.17126, -0.5778875, 2.944342, 1, 0, 0.7254902, 1,
1.176778, -0.2314376, 1.402898, 1, 0, 0.7215686, 1,
1.177597, 0.1003995, 0.3932653, 1, 0, 0.7137255, 1,
1.178636, -0.150387, 3.560359, 1, 0, 0.7098039, 1,
1.183159, 1.724706, -0.6058645, 1, 0, 0.7019608, 1,
1.190109, -0.3737873, 3.50175, 1, 0, 0.6941177, 1,
1.193714, -0.2312483, 2.164745, 1, 0, 0.6901961, 1,
1.207007, 0.5479959, 1.342735, 1, 0, 0.682353, 1,
1.209622, 0.1712305, 2.106016, 1, 0, 0.6784314, 1,
1.214857, -1.434318, 2.853994, 1, 0, 0.6705883, 1,
1.220315, -0.6630676, 1.316033, 1, 0, 0.6666667, 1,
1.220971, 0.08188882, 2.833523, 1, 0, 0.6588235, 1,
1.223871, -1.399358, 2.17769, 1, 0, 0.654902, 1,
1.226346, 1.327692, 1.103203, 1, 0, 0.6470588, 1,
1.23, -0.2489392, 2.275558, 1, 0, 0.6431373, 1,
1.23565, -0.888463, 2.404042, 1, 0, 0.6352941, 1,
1.23688, -1.968104, 2.395847, 1, 0, 0.6313726, 1,
1.237904, 0.03661592, 0.9617022, 1, 0, 0.6235294, 1,
1.251386, 1.906576, 0.0243683, 1, 0, 0.6196079, 1,
1.258787, -0.745836, 0.7308805, 1, 0, 0.6117647, 1,
1.260294, 1.523979, -0.2425614, 1, 0, 0.6078432, 1,
1.265532, 1.690948, 1.236522, 1, 0, 0.6, 1,
1.270538, 0.009802911, 2.329899, 1, 0, 0.5921569, 1,
1.281802, 0.3316782, 0.1098796, 1, 0, 0.5882353, 1,
1.28409, -0.7260713, 2.336448, 1, 0, 0.5803922, 1,
1.284938, -0.2698977, 2.769714, 1, 0, 0.5764706, 1,
1.285248, -0.3204739, 0.4953619, 1, 0, 0.5686275, 1,
1.285362, 0.742281, 1.991661, 1, 0, 0.5647059, 1,
1.305375, -0.1616266, 2.209942, 1, 0, 0.5568628, 1,
1.327325, -0.8438596, 2.179267, 1, 0, 0.5529412, 1,
1.327714, -0.5932717, 2.758615, 1, 0, 0.5450981, 1,
1.331281, 0.685291, 0.3919972, 1, 0, 0.5411765, 1,
1.343838, -0.3971272, 1.617043, 1, 0, 0.5333334, 1,
1.346131, -1.700654, 3.211785, 1, 0, 0.5294118, 1,
1.3614, 0.5631923, 1.475364, 1, 0, 0.5215687, 1,
1.36787, 0.1957356, 1.784165, 1, 0, 0.5176471, 1,
1.372371, 1.189852, 0.2707415, 1, 0, 0.509804, 1,
1.37889, -0.8327985, 1.23193, 1, 0, 0.5058824, 1,
1.381052, 0.7277878, 1.006292, 1, 0, 0.4980392, 1,
1.387137, -0.7217374, 2.141178, 1, 0, 0.4901961, 1,
1.3917, -1.152284, 0.9817697, 1, 0, 0.4862745, 1,
1.416962, -0.0140573, 1.64233, 1, 0, 0.4784314, 1,
1.429419, -0.8898116, 2.231077, 1, 0, 0.4745098, 1,
1.437213, -0.4130329, 1.397457, 1, 0, 0.4666667, 1,
1.450911, -2.201693, 1.246798, 1, 0, 0.4627451, 1,
1.456863, 1.026273, 1.2642, 1, 0, 0.454902, 1,
1.461178, 0.4258237, 1.229901, 1, 0, 0.4509804, 1,
1.464445, 2.388214, 0.8641106, 1, 0, 0.4431373, 1,
1.470916, 0.8173273, 0.1012853, 1, 0, 0.4392157, 1,
1.473192, -0.1938052, 1.718925, 1, 0, 0.4313726, 1,
1.473641, -1.181244, 3.144822, 1, 0, 0.427451, 1,
1.474945, 1.148654, 1.723642, 1, 0, 0.4196078, 1,
1.480105, 0.01612717, 0.398605, 1, 0, 0.4156863, 1,
1.490316, 0.559184, 1.925214, 1, 0, 0.4078431, 1,
1.491406, -0.117997, -0.2220551, 1, 0, 0.4039216, 1,
1.503588, 0.151327, 2.147172, 1, 0, 0.3960784, 1,
1.520195, 0.1123213, 2.360568, 1, 0, 0.3882353, 1,
1.527239, -1.760211, 3.586476, 1, 0, 0.3843137, 1,
1.548092, 0.394354, 0.03579053, 1, 0, 0.3764706, 1,
1.551815, -1.445993, 1.703406, 1, 0, 0.372549, 1,
1.554847, 0.09234415, 1.145302, 1, 0, 0.3647059, 1,
1.567369, -1.490101, 0.3971597, 1, 0, 0.3607843, 1,
1.568828, 0.764492, 0.2677869, 1, 0, 0.3529412, 1,
1.594052, -0.3331594, 0.6019072, 1, 0, 0.3490196, 1,
1.603939, -1.682157, 1.366191, 1, 0, 0.3411765, 1,
1.643977, -0.8564748, 4.281469, 1, 0, 0.3372549, 1,
1.651806, -0.3622789, 1.15005, 1, 0, 0.3294118, 1,
1.657334, -0.5875322, 1.841211, 1, 0, 0.3254902, 1,
1.67235, 1.339614, 1.327838, 1, 0, 0.3176471, 1,
1.672655, 0.6079618, 0.6661937, 1, 0, 0.3137255, 1,
1.679799, 1.283392, -0.2825624, 1, 0, 0.3058824, 1,
1.698343, -2.018832, 2.322158, 1, 0, 0.2980392, 1,
1.701269, 0.4324657, 0.8911018, 1, 0, 0.2941177, 1,
1.703927, -1.17259, 2.154988, 1, 0, 0.2862745, 1,
1.71895, 1.570024, 0.9141414, 1, 0, 0.282353, 1,
1.719936, -0.8931145, 3.131948, 1, 0, 0.2745098, 1,
1.734919, 0.447825, 1.242984, 1, 0, 0.2705882, 1,
1.749788, -1.745365, 3.15838, 1, 0, 0.2627451, 1,
1.756765, 0.4064156, 1.365334, 1, 0, 0.2588235, 1,
1.76445, -0.8114169, 2.727403, 1, 0, 0.2509804, 1,
1.797589, 1.442791, 0.9241456, 1, 0, 0.2470588, 1,
1.822946, -0.3104234, 3.368282, 1, 0, 0.2392157, 1,
1.824475, 1.177673, 0.7189378, 1, 0, 0.2352941, 1,
1.860498, 0.6186802, 0.8551373, 1, 0, 0.227451, 1,
1.868654, -1.907058, 1.840879, 1, 0, 0.2235294, 1,
1.871019, 0.1413589, 0.4446355, 1, 0, 0.2156863, 1,
1.889977, 0.2629335, 2.171491, 1, 0, 0.2117647, 1,
1.917993, 0.4500141, 1.862524, 1, 0, 0.2039216, 1,
1.926122, -1.825739, 4.113186, 1, 0, 0.1960784, 1,
1.926132, 0.2116828, 1.882567, 1, 0, 0.1921569, 1,
1.976419, -0.4587186, 1.97871, 1, 0, 0.1843137, 1,
1.997856, -0.1813348, 0.4043977, 1, 0, 0.1803922, 1,
2.020668, 1.560103, -0.1053338, 1, 0, 0.172549, 1,
2.02349, -0.5702412, 0.378835, 1, 0, 0.1686275, 1,
2.026528, -1.089817, 0.4726408, 1, 0, 0.1607843, 1,
2.038125, -0.02692016, 0.02739109, 1, 0, 0.1568628, 1,
2.040298, -0.01370464, 2.947047, 1, 0, 0.1490196, 1,
2.077944, -1.288191, 2.470093, 1, 0, 0.145098, 1,
2.096541, -1.373275, -0.09994779, 1, 0, 0.1372549, 1,
2.098746, 0.2485717, 1.914592, 1, 0, 0.1333333, 1,
2.103856, -0.4474857, 1.938428, 1, 0, 0.1254902, 1,
2.109259, 0.5350342, 1.14262, 1, 0, 0.1215686, 1,
2.116086, -2.016783, 1.509306, 1, 0, 0.1137255, 1,
2.133287, -1.068776, 2.371394, 1, 0, 0.1098039, 1,
2.144518, 0.1452223, 1.851369, 1, 0, 0.1019608, 1,
2.21641, -1.69161, 0.4181513, 1, 0, 0.09411765, 1,
2.219797, -0.82442, 2.839975, 1, 0, 0.09019608, 1,
2.229167, 2.110062, 2.277616, 1, 0, 0.08235294, 1,
2.240947, -0.3699882, 1.791014, 1, 0, 0.07843138, 1,
2.270705, 0.5432835, 1.011586, 1, 0, 0.07058824, 1,
2.277523, 0.2643464, 2.544633, 1, 0, 0.06666667, 1,
2.292796, -0.4194214, -0.4066679, 1, 0, 0.05882353, 1,
2.337376, -1.039301, 3.100893, 1, 0, 0.05490196, 1,
2.474967, -0.3575197, 2.772398, 1, 0, 0.04705882, 1,
2.51721, 2.426468, 1.516773, 1, 0, 0.04313726, 1,
2.565964, 0.874249, 0.7579404, 1, 0, 0.03529412, 1,
2.606363, -0.0792253, 3.040976, 1, 0, 0.03137255, 1,
2.674078, -0.08693641, 3.040951, 1, 0, 0.02352941, 1,
2.827219, -1.441683, 1.891264, 1, 0, 0.01960784, 1,
2.827354, 0.2033445, 2.068863, 1, 0, 0.01176471, 1,
2.937209, -0.8083306, 3.163619, 1, 0, 0.007843138, 1
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
0.09848654, -4.050743, -7.318375, 0, -0.5, 0.5, 0.5,
0.09848654, -4.050743, -7.318375, 1, -0.5, 0.5, 0.5,
0.09848654, -4.050743, -7.318375, 1, 1.5, 0.5, 0.5,
0.09848654, -4.050743, -7.318375, 0, 1.5, 0.5, 0.5
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
-3.702563, 0.1851161, -7.318375, 0, -0.5, 0.5, 0.5,
-3.702563, 0.1851161, -7.318375, 1, -0.5, 0.5, 0.5,
-3.702563, 0.1851161, -7.318375, 1, 1.5, 0.5, 0.5,
-3.702563, 0.1851161, -7.318375, 0, 1.5, 0.5, 0.5
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
-3.702563, -4.050743, -0.008829594, 0, -0.5, 0.5, 0.5,
-3.702563, -4.050743, -0.008829594, 1, -0.5, 0.5, 0.5,
-3.702563, -4.050743, -0.008829594, 1, 1.5, 0.5, 0.5,
-3.702563, -4.050743, -0.008829594, 0, 1.5, 0.5, 0.5
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
-2, -3.073237, -5.631557,
2, -3.073237, -5.631557,
-2, -3.073237, -5.631557,
-2, -3.236155, -5.912693,
-1, -3.073237, -5.631557,
-1, -3.236155, -5.912693,
0, -3.073237, -5.631557,
0, -3.236155, -5.912693,
1, -3.073237, -5.631557,
1, -3.236155, -5.912693,
2, -3.073237, -5.631557,
2, -3.236155, -5.912693
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
-2, -3.56199, -6.474966, 0, -0.5, 0.5, 0.5,
-2, -3.56199, -6.474966, 1, -0.5, 0.5, 0.5,
-2, -3.56199, -6.474966, 1, 1.5, 0.5, 0.5,
-2, -3.56199, -6.474966, 0, 1.5, 0.5, 0.5,
-1, -3.56199, -6.474966, 0, -0.5, 0.5, 0.5,
-1, -3.56199, -6.474966, 1, -0.5, 0.5, 0.5,
-1, -3.56199, -6.474966, 1, 1.5, 0.5, 0.5,
-1, -3.56199, -6.474966, 0, 1.5, 0.5, 0.5,
0, -3.56199, -6.474966, 0, -0.5, 0.5, 0.5,
0, -3.56199, -6.474966, 1, -0.5, 0.5, 0.5,
0, -3.56199, -6.474966, 1, 1.5, 0.5, 0.5,
0, -3.56199, -6.474966, 0, 1.5, 0.5, 0.5,
1, -3.56199, -6.474966, 0, -0.5, 0.5, 0.5,
1, -3.56199, -6.474966, 1, -0.5, 0.5, 0.5,
1, -3.56199, -6.474966, 1, 1.5, 0.5, 0.5,
1, -3.56199, -6.474966, 0, 1.5, 0.5, 0.5,
2, -3.56199, -6.474966, 0, -0.5, 0.5, 0.5,
2, -3.56199, -6.474966, 1, -0.5, 0.5, 0.5,
2, -3.56199, -6.474966, 1, 1.5, 0.5, 0.5,
2, -3.56199, -6.474966, 0, 1.5, 0.5, 0.5
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
-2.825397, -2, -5.631557,
-2.825397, 3, -5.631557,
-2.825397, -2, -5.631557,
-2.971592, -2, -5.912693,
-2.825397, -1, -5.631557,
-2.971592, -1, -5.912693,
-2.825397, 0, -5.631557,
-2.971592, 0, -5.912693,
-2.825397, 1, -5.631557,
-2.971592, 1, -5.912693,
-2.825397, 2, -5.631557,
-2.971592, 2, -5.912693,
-2.825397, 3, -5.631557,
-2.971592, 3, -5.912693
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
-3.26398, -2, -6.474966, 0, -0.5, 0.5, 0.5,
-3.26398, -2, -6.474966, 1, -0.5, 0.5, 0.5,
-3.26398, -2, -6.474966, 1, 1.5, 0.5, 0.5,
-3.26398, -2, -6.474966, 0, 1.5, 0.5, 0.5,
-3.26398, -1, -6.474966, 0, -0.5, 0.5, 0.5,
-3.26398, -1, -6.474966, 1, -0.5, 0.5, 0.5,
-3.26398, -1, -6.474966, 1, 1.5, 0.5, 0.5,
-3.26398, -1, -6.474966, 0, 1.5, 0.5, 0.5,
-3.26398, 0, -6.474966, 0, -0.5, 0.5, 0.5,
-3.26398, 0, -6.474966, 1, -0.5, 0.5, 0.5,
-3.26398, 0, -6.474966, 1, 1.5, 0.5, 0.5,
-3.26398, 0, -6.474966, 0, 1.5, 0.5, 0.5,
-3.26398, 1, -6.474966, 0, -0.5, 0.5, 0.5,
-3.26398, 1, -6.474966, 1, -0.5, 0.5, 0.5,
-3.26398, 1, -6.474966, 1, 1.5, 0.5, 0.5,
-3.26398, 1, -6.474966, 0, 1.5, 0.5, 0.5,
-3.26398, 2, -6.474966, 0, -0.5, 0.5, 0.5,
-3.26398, 2, -6.474966, 1, -0.5, 0.5, 0.5,
-3.26398, 2, -6.474966, 1, 1.5, 0.5, 0.5,
-3.26398, 2, -6.474966, 0, 1.5, 0.5, 0.5,
-3.26398, 3, -6.474966, 0, -0.5, 0.5, 0.5,
-3.26398, 3, -6.474966, 1, -0.5, 0.5, 0.5,
-3.26398, 3, -6.474966, 1, 1.5, 0.5, 0.5,
-3.26398, 3, -6.474966, 0, 1.5, 0.5, 0.5
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
-2.825397, -3.073237, -4,
-2.825397, -3.073237, 4,
-2.825397, -3.073237, -4,
-2.971592, -3.236155, -4,
-2.825397, -3.073237, -2,
-2.971592, -3.236155, -2,
-2.825397, -3.073237, 0,
-2.971592, -3.236155, 0,
-2.825397, -3.073237, 2,
-2.971592, -3.236155, 2,
-2.825397, -3.073237, 4,
-2.971592, -3.236155, 4
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
-3.26398, -3.56199, -4, 0, -0.5, 0.5, 0.5,
-3.26398, -3.56199, -4, 1, -0.5, 0.5, 0.5,
-3.26398, -3.56199, -4, 1, 1.5, 0.5, 0.5,
-3.26398, -3.56199, -4, 0, 1.5, 0.5, 0.5,
-3.26398, -3.56199, -2, 0, -0.5, 0.5, 0.5,
-3.26398, -3.56199, -2, 1, -0.5, 0.5, 0.5,
-3.26398, -3.56199, -2, 1, 1.5, 0.5, 0.5,
-3.26398, -3.56199, -2, 0, 1.5, 0.5, 0.5,
-3.26398, -3.56199, 0, 0, -0.5, 0.5, 0.5,
-3.26398, -3.56199, 0, 1, -0.5, 0.5, 0.5,
-3.26398, -3.56199, 0, 1, 1.5, 0.5, 0.5,
-3.26398, -3.56199, 0, 0, 1.5, 0.5, 0.5,
-3.26398, -3.56199, 2, 0, -0.5, 0.5, 0.5,
-3.26398, -3.56199, 2, 1, -0.5, 0.5, 0.5,
-3.26398, -3.56199, 2, 1, 1.5, 0.5, 0.5,
-3.26398, -3.56199, 2, 0, 1.5, 0.5, 0.5,
-3.26398, -3.56199, 4, 0, -0.5, 0.5, 0.5,
-3.26398, -3.56199, 4, 1, -0.5, 0.5, 0.5,
-3.26398, -3.56199, 4, 1, 1.5, 0.5, 0.5,
-3.26398, -3.56199, 4, 0, 1.5, 0.5, 0.5
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
-2.825397, -3.073237, -5.631557,
-2.825397, 3.443469, -5.631557,
-2.825397, -3.073237, 5.613897,
-2.825397, 3.443469, 5.613897,
-2.825397, -3.073237, -5.631557,
-2.825397, -3.073237, 5.613897,
-2.825397, 3.443469, -5.631557,
-2.825397, 3.443469, 5.613897,
-2.825397, -3.073237, -5.631557,
3.022371, -3.073237, -5.631557,
-2.825397, -3.073237, 5.613897,
3.022371, -3.073237, 5.613897,
-2.825397, 3.443469, -5.631557,
3.022371, 3.443469, -5.631557,
-2.825397, 3.443469, 5.613897,
3.022371, 3.443469, 5.613897,
3.022371, -3.073237, -5.631557,
3.022371, 3.443469, -5.631557,
3.022371, -3.073237, 5.613897,
3.022371, 3.443469, 5.613897,
3.022371, -3.073237, -5.631557,
3.022371, -3.073237, 5.613897,
3.022371, 3.443469, -5.631557,
3.022371, 3.443469, 5.613897
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
var radius = 7.610377;
var distance = 33.85943;
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
mvMatrix.translate( -0.09848654, -0.1851161, 0.008829594 );
mvMatrix.scale( 1.407116, 1.262676, 0.7317169 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.85943);
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
pendimethalin<-read.table("pendimethalin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pendimethalin$V2
```

```
## Error in eval(expr, envir, enclos): object 'pendimethalin' not found
```

```r
y<-pendimethalin$V3
```

```
## Error in eval(expr, envir, enclos): object 'pendimethalin' not found
```

```r
z<-pendimethalin$V4
```

```
## Error in eval(expr, envir, enclos): object 'pendimethalin' not found
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
-2.740236, -1.25254, -1.981119, 0, 0, 1, 1, 1,
-2.584743, -0.4282036, -0.7267458, 1, 0, 0, 1, 1,
-2.553588, -0.9695812, -2.735466, 1, 0, 0, 1, 1,
-2.507907, -1.057161, -3.005261, 1, 0, 0, 1, 1,
-2.455542, 0.72381, -1.300256, 1, 0, 0, 1, 1,
-2.438714, -0.9965155, -1.565949, 1, 0, 0, 1, 1,
-2.415822, 0.09213716, -2.762744, 0, 0, 0, 1, 1,
-2.389239, -0.2443736, -1.465354, 0, 0, 0, 1, 1,
-2.361579, -1.492527, -4.110098, 0, 0, 0, 1, 1,
-2.277139, -1.387511, -2.825983, 0, 0, 0, 1, 1,
-2.200538, 1.80121, -2.413966, 0, 0, 0, 1, 1,
-2.166481, 0.4001777, -2.560995, 0, 0, 0, 1, 1,
-2.148352, 1.887758, -0.7605067, 0, 0, 0, 1, 1,
-2.112375, -0.114447, -2.054741, 1, 1, 1, 1, 1,
-2.09585, -1.313029, -1.66346, 1, 1, 1, 1, 1,
-2.06354, -0.006553665, -1.53704, 1, 1, 1, 1, 1,
-2.044048, 0.445966, 0.2700529, 1, 1, 1, 1, 1,
-2.029632, 0.8849438, -1.147226, 1, 1, 1, 1, 1,
-2.021152, -1.003146, -1.330132, 1, 1, 1, 1, 1,
-2.020327, 1.506999, -0.4142488, 1, 1, 1, 1, 1,
-2.020108, 1.433407, -1.159894, 1, 1, 1, 1, 1,
-1.992028, 0.1314434, 1.114959, 1, 1, 1, 1, 1,
-1.914229, 1.63564, -0.8911723, 1, 1, 1, 1, 1,
-1.911936, -1.124992, 0.1509904, 1, 1, 1, 1, 1,
-1.90974, 0.3850383, -0.6854222, 1, 1, 1, 1, 1,
-1.90759, -0.2465575, -2.097912, 1, 1, 1, 1, 1,
-1.902631, 1.671938, -1.286145, 1, 1, 1, 1, 1,
-1.897278, 0.131382, -2.645201, 1, 1, 1, 1, 1,
-1.890243, -0.1750412, 0.3013962, 0, 0, 1, 1, 1,
-1.887982, 0.4943084, -2.976835, 1, 0, 0, 1, 1,
-1.885398, 0.357466, -1.184138, 1, 0, 0, 1, 1,
-1.850269, 2.153086, -0.8300245, 1, 0, 0, 1, 1,
-1.83853, -0.1521752, -1.661027, 1, 0, 0, 1, 1,
-1.829663, 0.1419867, 0.3555933, 1, 0, 0, 1, 1,
-1.826013, 1.551423, -0.3551746, 0, 0, 0, 1, 1,
-1.764327, -1.849401, -1.84392, 0, 0, 0, 1, 1,
-1.759569, -0.0497495, -4.361624, 0, 0, 0, 1, 1,
-1.752742, 0.6271231, -0.3264207, 0, 0, 0, 1, 1,
-1.7471, 0.9502042, -0.3247109, 0, 0, 0, 1, 1,
-1.733246, 0.5143954, -1.582548, 0, 0, 0, 1, 1,
-1.733014, 0.7937784, 0.527028, 0, 0, 0, 1, 1,
-1.721535, -0.4963593, -1.895684, 1, 1, 1, 1, 1,
-1.713972, 0.3666446, -1.022754, 1, 1, 1, 1, 1,
-1.702068, 0.6054086, 0.4330217, 1, 1, 1, 1, 1,
-1.69668, 0.1737413, -2.504161, 1, 1, 1, 1, 1,
-1.696366, 0.1012209, -1.783531, 1, 1, 1, 1, 1,
-1.672646, -0.4202016, -2.491602, 1, 1, 1, 1, 1,
-1.668782, 1.354074, -1.804985, 1, 1, 1, 1, 1,
-1.633616, -1.018465, -0.4260504, 1, 1, 1, 1, 1,
-1.632673, 0.1902525, -1.118639, 1, 1, 1, 1, 1,
-1.630939, 0.6888528, -0.07049073, 1, 1, 1, 1, 1,
-1.622551, 2.346378, 0.3502696, 1, 1, 1, 1, 1,
-1.590925, -0.347216, -2.02041, 1, 1, 1, 1, 1,
-1.588092, 0.5920115, -2.866993, 1, 1, 1, 1, 1,
-1.585637, -0.4531688, -2.145731, 1, 1, 1, 1, 1,
-1.585344, -0.1024326, -2.081051, 1, 1, 1, 1, 1,
-1.56892, -1.503784, -2.680746, 0, 0, 1, 1, 1,
-1.553825, 0.9932448, -1.572845, 1, 0, 0, 1, 1,
-1.534154, -0.3431675, -2.36605, 1, 0, 0, 1, 1,
-1.51488, -2.425816, -3.458434, 1, 0, 0, 1, 1,
-1.500086, 0.5137763, -1.63366, 1, 0, 0, 1, 1,
-1.496696, -1.076089, -1.953251, 1, 0, 0, 1, 1,
-1.485948, 1.219192, -0.6631235, 0, 0, 0, 1, 1,
-1.482275, -1.438433, -0.7486467, 0, 0, 0, 1, 1,
-1.469682, 0.4855734, -1.533565, 0, 0, 0, 1, 1,
-1.455543, -0.4668187, -1.068557, 0, 0, 0, 1, 1,
-1.453807, -0.1479247, -2.843044, 0, 0, 0, 1, 1,
-1.44632, -1.318091, -1.40009, 0, 0, 0, 1, 1,
-1.444688, 0.7093241, -1.419322, 0, 0, 0, 1, 1,
-1.443682, 0.1457712, -1.08154, 1, 1, 1, 1, 1,
-1.44171, -0.8948649, -1.062751, 1, 1, 1, 1, 1,
-1.432974, 1.453779, -0.9736337, 1, 1, 1, 1, 1,
-1.429678, 0.9601009, -1.249055, 1, 1, 1, 1, 1,
-1.427262, 0.5686547, 0.04858488, 1, 1, 1, 1, 1,
-1.42634, -1.28253, -1.839026, 1, 1, 1, 1, 1,
-1.425385, 0.1935169, -0.9573678, 1, 1, 1, 1, 1,
-1.424834, -0.2223057, -2.849055, 1, 1, 1, 1, 1,
-1.42459, -0.963222, -1.589148, 1, 1, 1, 1, 1,
-1.422684, -0.02094146, -1.212402, 1, 1, 1, 1, 1,
-1.420027, -1.144017, -3.183816, 1, 1, 1, 1, 1,
-1.417479, -1.023323, -1.798786, 1, 1, 1, 1, 1,
-1.41665, -0.2877871, -1.38098, 1, 1, 1, 1, 1,
-1.415925, 1.005484, -1.195035, 1, 1, 1, 1, 1,
-1.401005, -1.215774, -0.8812715, 1, 1, 1, 1, 1,
-1.395594, 0.2018327, -2.353949, 0, 0, 1, 1, 1,
-1.39152, 0.9110898, -0.5850316, 1, 0, 0, 1, 1,
-1.390131, -0.06361151, -0.01544017, 1, 0, 0, 1, 1,
-1.389061, -0.4975438, -3.338389, 1, 0, 0, 1, 1,
-1.371639, 1.717428, -0.8861499, 1, 0, 0, 1, 1,
-1.368356, -1.180024, -2.343004, 1, 0, 0, 1, 1,
-1.365342, 0.2354951, -0.9629869, 0, 0, 0, 1, 1,
-1.363489, 1.779931, 0.02988275, 0, 0, 0, 1, 1,
-1.359072, 0.9953333, 1.343361, 0, 0, 0, 1, 1,
-1.356917, 1.223491, -0.7078085, 0, 0, 0, 1, 1,
-1.353738, -0.4033636, -3.007289, 0, 0, 0, 1, 1,
-1.352231, -0.2408015, 1.457552, 0, 0, 0, 1, 1,
-1.348541, 1.498968, -1.104595, 0, 0, 0, 1, 1,
-1.346743, 0.2382214, -1.50698, 1, 1, 1, 1, 1,
-1.340131, 0.3729714, 1.250203, 1, 1, 1, 1, 1,
-1.329469, 1.58796, -0.4029115, 1, 1, 1, 1, 1,
-1.324941, -0.6451295, -3.085897, 1, 1, 1, 1, 1,
-1.320451, 0.1633374, -0.645571, 1, 1, 1, 1, 1,
-1.319575, 1.114169, 0.2845961, 1, 1, 1, 1, 1,
-1.300514, 0.05056182, -1.842365, 1, 1, 1, 1, 1,
-1.297303, -0.5588316, -2.781402, 1, 1, 1, 1, 1,
-1.294434, 0.2382335, -3.356485, 1, 1, 1, 1, 1,
-1.293459, -2.210356, -1.781176, 1, 1, 1, 1, 1,
-1.289738, -0.6632609, -3.177986, 1, 1, 1, 1, 1,
-1.27619, 0.919077, -1.023598, 1, 1, 1, 1, 1,
-1.27575, 0.3123186, -0.2575882, 1, 1, 1, 1, 1,
-1.274923, 0.3861429, -2.599688, 1, 1, 1, 1, 1,
-1.272299, 0.8769271, -1.952866, 1, 1, 1, 1, 1,
-1.265878, -0.2655681, 0.005123875, 0, 0, 1, 1, 1,
-1.265738, 0.2871051, -0.2021802, 1, 0, 0, 1, 1,
-1.261048, 0.09682132, -1.749537, 1, 0, 0, 1, 1,
-1.259448, -0.43772, -3.17181, 1, 0, 0, 1, 1,
-1.245004, -0.9660417, -2.377448, 1, 0, 0, 1, 1,
-1.236116, 0.3005895, -0.5454948, 1, 0, 0, 1, 1,
-1.233799, 0.635138, -1.223892, 0, 0, 0, 1, 1,
-1.229397, -1.338001, -1.585716, 0, 0, 0, 1, 1,
-1.221786, -1.462905, -1.989349, 0, 0, 0, 1, 1,
-1.221508, -0.6904442, -2.05184, 0, 0, 0, 1, 1,
-1.217757, 2.105973, -0.626125, 0, 0, 0, 1, 1,
-1.206728, 1.106138, 0.591906, 0, 0, 0, 1, 1,
-1.202662, -0.2054106, -2.912969, 0, 0, 0, 1, 1,
-1.194227, 1.470876, -1.831765, 1, 1, 1, 1, 1,
-1.187441, 1.159443, 0.3114299, 1, 1, 1, 1, 1,
-1.186852, 0.3858287, -0.9697053, 1, 1, 1, 1, 1,
-1.183171, -1.014654, -2.044344, 1, 1, 1, 1, 1,
-1.180536, 1.550505, -0.01487639, 1, 1, 1, 1, 1,
-1.17858, 2.845267, -0.7653952, 1, 1, 1, 1, 1,
-1.178277, 0.2776525, -2.020662, 1, 1, 1, 1, 1,
-1.178013, -0.5367622, -2.202147, 1, 1, 1, 1, 1,
-1.17289, -1.325271, -0.4019626, 1, 1, 1, 1, 1,
-1.167656, 1.922348, -1.412167, 1, 1, 1, 1, 1,
-1.155079, -1.722883, -4.396168, 1, 1, 1, 1, 1,
-1.149404, -0.8485003, -3.03547, 1, 1, 1, 1, 1,
-1.146896, -0.6317073, -2.835353, 1, 1, 1, 1, 1,
-1.1454, -0.1042446, -1.963476, 1, 1, 1, 1, 1,
-1.145017, 0.5171396, 0.8046901, 1, 1, 1, 1, 1,
-1.139959, -1.149697, -2.268261, 0, 0, 1, 1, 1,
-1.131899, 0.8671116, -0.01786397, 1, 0, 0, 1, 1,
-1.12785, 1.223346, -0.528293, 1, 0, 0, 1, 1,
-1.119696, -0.8492169, -1.959061, 1, 0, 0, 1, 1,
-1.117601, -1.336164, -3.481675, 1, 0, 0, 1, 1,
-1.112653, 1.769402, -0.6901562, 1, 0, 0, 1, 1,
-1.100061, 0.08498915, -0.6364039, 0, 0, 0, 1, 1,
-1.098623, 0.169852, -2.81617, 0, 0, 0, 1, 1,
-1.096315, -0.8801, -2.711728, 0, 0, 0, 1, 1,
-1.096315, -1.971698, -1.204683, 0, 0, 0, 1, 1,
-1.0936, 0.2233875, -0.6659674, 0, 0, 0, 1, 1,
-1.092868, 0.7724692, -0.3304572, 0, 0, 0, 1, 1,
-1.092417, -0.1229572, -1.037617, 0, 0, 0, 1, 1,
-1.089857, -1.487258, -3.525449, 1, 1, 1, 1, 1,
-1.08933, -1.116817, -3.964574, 1, 1, 1, 1, 1,
-1.084121, -0.01809071, -1.229865, 1, 1, 1, 1, 1,
-1.081936, -0.1467353, -2.319919, 1, 1, 1, 1, 1,
-1.079073, 0.6204652, -0.5760081, 1, 1, 1, 1, 1,
-1.075459, 1.036988, -1.132892, 1, 1, 1, 1, 1,
-1.070809, 1.088731, -0.1124169, 1, 1, 1, 1, 1,
-1.070145, -1.403285, -2.881541, 1, 1, 1, 1, 1,
-1.062554, -0.838578, -2.788823, 1, 1, 1, 1, 1,
-1.057582, 0.89684, -0.03104957, 1, 1, 1, 1, 1,
-1.055594, 0.2441959, -2.205798, 1, 1, 1, 1, 1,
-1.051603, 2.19549, -0.05075485, 1, 1, 1, 1, 1,
-1.048684, 0.6550549, -1.409514, 1, 1, 1, 1, 1,
-1.044683, -0.4742956, -3.435712, 1, 1, 1, 1, 1,
-1.039845, 0.4101188, -1.922629, 1, 1, 1, 1, 1,
-1.037385, 0.3098153, 0.2485012, 0, 0, 1, 1, 1,
-1.030309, 3.02656, -0.8428797, 1, 0, 0, 1, 1,
-1.029628, -0.4751127, -0.8165181, 1, 0, 0, 1, 1,
-1.027998, -0.4227689, -2.060963, 1, 0, 0, 1, 1,
-1.025275, -1.610695, -4.274962, 1, 0, 0, 1, 1,
-1.018574, -0.5517415, -2.285443, 1, 0, 0, 1, 1,
-1.015161, -0.6997429, -1.699515, 0, 0, 0, 1, 1,
-1.00771, 0.9390884, 0.1052575, 0, 0, 0, 1, 1,
-1.003826, 1.576425, -1.503927, 0, 0, 0, 1, 1,
-1.003447, -0.1042683, -2.864236, 0, 0, 0, 1, 1,
-0.9964351, 0.4373892, -0.2141571, 0, 0, 0, 1, 1,
-0.9912123, -0.3483095, -1.555272, 0, 0, 0, 1, 1,
-0.9907511, 1.732109, -2.356226, 0, 0, 0, 1, 1,
-0.9855948, -0.03847732, -2.841754, 1, 1, 1, 1, 1,
-0.9847383, 0.577008, -1.603432, 1, 1, 1, 1, 1,
-0.9811274, 1.468073, -0.9936031, 1, 1, 1, 1, 1,
-0.9809962, -0.2287565, -1.278432, 1, 1, 1, 1, 1,
-0.9779592, -0.5603662, -4.1276, 1, 1, 1, 1, 1,
-0.9751379, 0.04765411, -2.991494, 1, 1, 1, 1, 1,
-0.9621674, 0.7037392, -1.476818, 1, 1, 1, 1, 1,
-0.9565377, 1.539814, -1.367307, 1, 1, 1, 1, 1,
-0.9560916, 0.8271256, 0.04962091, 1, 1, 1, 1, 1,
-0.9556842, -0.3988879, -0.9124531, 1, 1, 1, 1, 1,
-0.9554233, -0.536451, -2.772574, 1, 1, 1, 1, 1,
-0.9511871, 0.9193298, -1.81913, 1, 1, 1, 1, 1,
-0.9373661, 0.3160142, -0.6946673, 1, 1, 1, 1, 1,
-0.9357808, 2.498975, 0.3110502, 1, 1, 1, 1, 1,
-0.9353217, -0.7706334, -2.85646, 1, 1, 1, 1, 1,
-0.9247823, 1.526414, 0.5966475, 0, 0, 1, 1, 1,
-0.9206795, -1.348482, -1.707907, 1, 0, 0, 1, 1,
-0.9161683, -0.8485528, -1.210663, 1, 0, 0, 1, 1,
-0.9160376, -0.2975179, -1.032066, 1, 0, 0, 1, 1,
-0.9149083, -0.8067797, -2.831229, 1, 0, 0, 1, 1,
-0.9104007, -1.263625, -2.212744, 1, 0, 0, 1, 1,
-0.9063199, -1.077734, 0.5224265, 0, 0, 0, 1, 1,
-0.9050829, 0.7701605, -1.310137, 0, 0, 0, 1, 1,
-0.9016929, -0.08651377, -1.459773, 0, 0, 0, 1, 1,
-0.9014347, -0.3239173, -3.172272, 0, 0, 0, 1, 1,
-0.8999621, -0.6516793, -3.570082, 0, 0, 0, 1, 1,
-0.8982824, 0.6205713, 0.5872316, 0, 0, 0, 1, 1,
-0.8901572, -0.9168012, -2.46832, 0, 0, 0, 1, 1,
-0.8869638, 0.4658595, 0.06770667, 1, 1, 1, 1, 1,
-0.8827969, 0.6026124, -1.160482, 1, 1, 1, 1, 1,
-0.8739323, 1.153653, -1.65868, 1, 1, 1, 1, 1,
-0.8717941, -1.161697, -0.6683449, 1, 1, 1, 1, 1,
-0.8707707, -0.1321315, 0.02377765, 1, 1, 1, 1, 1,
-0.8699045, -0.3041379, -1.318913, 1, 1, 1, 1, 1,
-0.8571653, 0.2947258, -1.00997, 1, 1, 1, 1, 1,
-0.8555015, 2.829736, -0.2288652, 1, 1, 1, 1, 1,
-0.8441322, -2.056958, -3.400765, 1, 1, 1, 1, 1,
-0.8427231, 0.668897, -0.9601521, 1, 1, 1, 1, 1,
-0.8381358, -1.541683, -4.282936, 1, 1, 1, 1, 1,
-0.8365458, 1.128493, -0.3777029, 1, 1, 1, 1, 1,
-0.8344383, -1.293634, -3.850234, 1, 1, 1, 1, 1,
-0.8266928, -0.7671471, -3.321157, 1, 1, 1, 1, 1,
-0.8238795, 0.4704215, -0.5567077, 1, 1, 1, 1, 1,
-0.8200563, 0.6317053, -0.4265748, 0, 0, 1, 1, 1,
-0.8176588, 0.4824318, -1.406364, 1, 0, 0, 1, 1,
-0.8152156, -0.7697603, -2.105429, 1, 0, 0, 1, 1,
-0.8126394, -1.669425, -2.874703, 1, 0, 0, 1, 1,
-0.8124513, -0.1454094, -1.784626, 1, 0, 0, 1, 1,
-0.8119385, -0.4342093, -3.688607, 1, 0, 0, 1, 1,
-0.8094307, -1.265485, -2.785338, 0, 0, 0, 1, 1,
-0.8057307, 0.2208407, -0.4399588, 0, 0, 0, 1, 1,
-0.8043475, -0.6850055, -1.928381, 0, 0, 0, 1, 1,
-0.7932907, -0.07933127, -2.319304, 0, 0, 0, 1, 1,
-0.7837811, -0.3782535, -1.80666, 0, 0, 0, 1, 1,
-0.7725917, 0.2217949, -1.069944, 0, 0, 0, 1, 1,
-0.7694903, -1.532167, -2.395199, 0, 0, 0, 1, 1,
-0.7676388, 0.3554022, -0.1813632, 1, 1, 1, 1, 1,
-0.7675158, 1.850092, -0.3169584, 1, 1, 1, 1, 1,
-0.7670752, -0.4873362, -1.404822, 1, 1, 1, 1, 1,
-0.7652396, 1.136355, -0.3628385, 1, 1, 1, 1, 1,
-0.7605882, -1.427378, -1.454394, 1, 1, 1, 1, 1,
-0.7592803, 2.013885, 0.7199525, 1, 1, 1, 1, 1,
-0.7577659, 0.114554, -2.85097, 1, 1, 1, 1, 1,
-0.7568381, 0.9733381, 0.6272261, 1, 1, 1, 1, 1,
-0.7559488, 3.348566, -0.3345943, 1, 1, 1, 1, 1,
-0.7503278, -0.5793937, -1.551324, 1, 1, 1, 1, 1,
-0.7453647, 0.01387561, -2.790884, 1, 1, 1, 1, 1,
-0.7450137, -0.836411, -1.537167, 1, 1, 1, 1, 1,
-0.7447036, 1.372566, -1.107343, 1, 1, 1, 1, 1,
-0.7440268, 0.913247, -1.69549, 1, 1, 1, 1, 1,
-0.742257, -1.593266, -3.034756, 1, 1, 1, 1, 1,
-0.7404472, 0.2210335, -1.151466, 0, 0, 1, 1, 1,
-0.7389541, -0.4524669, -1.049736, 1, 0, 0, 1, 1,
-0.7379954, -1.073994, -2.073583, 1, 0, 0, 1, 1,
-0.7368674, 0.3118587, -2.053954, 1, 0, 0, 1, 1,
-0.7367257, -0.07291012, -1.477071, 1, 0, 0, 1, 1,
-0.7342236, 0.585375, -2.154802, 1, 0, 0, 1, 1,
-0.7332179, -0.1100682, -2.246417, 0, 0, 0, 1, 1,
-0.7329362, 0.4900503, 1.122229, 0, 0, 0, 1, 1,
-0.7272034, 0.3040874, -2.008837, 0, 0, 0, 1, 1,
-0.7213208, -0.3344093, -1.84717, 0, 0, 0, 1, 1,
-0.7191608, 0.2149502, -1.328196, 0, 0, 0, 1, 1,
-0.7182575, 0.8201462, -0.2262639, 0, 0, 0, 1, 1,
-0.7177582, -0.6833258, -2.316954, 0, 0, 0, 1, 1,
-0.7150548, -2.240692, -4.169044, 1, 1, 1, 1, 1,
-0.7078869, -1.087365, -2.182878, 1, 1, 1, 1, 1,
-0.703901, -0.009843588, -1.770322, 1, 1, 1, 1, 1,
-0.7002879, 0.5219543, -1.168898, 1, 1, 1, 1, 1,
-0.6994354, -0.1974867, -3.028755, 1, 1, 1, 1, 1,
-0.6943254, 1.25401, -1.467059, 1, 1, 1, 1, 1,
-0.6880921, 0.3185607, -0.5874776, 1, 1, 1, 1, 1,
-0.681663, 1.229179, -1.275618, 1, 1, 1, 1, 1,
-0.6790602, 0.4123737, -1.022229, 1, 1, 1, 1, 1,
-0.677999, 0.0861045, -1.033743, 1, 1, 1, 1, 1,
-0.6753461, -0.2954771, -1.91911, 1, 1, 1, 1, 1,
-0.6703166, -0.06420286, -1.190433, 1, 1, 1, 1, 1,
-0.6647904, 0.4248944, -2.206827, 1, 1, 1, 1, 1,
-0.6634899, -0.7028883, -3.023, 1, 1, 1, 1, 1,
-0.6621018, -0.1060649, -0.6168229, 1, 1, 1, 1, 1,
-0.65889, 0.2733303, -0.0175198, 0, 0, 1, 1, 1,
-0.6583242, -0.4878681, -0.4464751, 1, 0, 0, 1, 1,
-0.6582911, 0.01393632, -1.044816, 1, 0, 0, 1, 1,
-0.6577202, 0.9452538, -0.9873518, 1, 0, 0, 1, 1,
-0.6557931, -0.4861178, -1.901316, 1, 0, 0, 1, 1,
-0.654604, -2.038705, -2.343734, 1, 0, 0, 1, 1,
-0.6520028, -1.002536, -3.15852, 0, 0, 0, 1, 1,
-0.6479191, 1.084473, -0.06195004, 0, 0, 0, 1, 1,
-0.64553, -0.7262347, -2.233439, 0, 0, 0, 1, 1,
-0.643878, 1.049991, 1.408103, 0, 0, 0, 1, 1,
-0.6422968, 2.387832, -0.6842567, 0, 0, 0, 1, 1,
-0.6391838, -0.9212191, -1.175345, 0, 0, 0, 1, 1,
-0.6388696, -0.9486075, -5.467788, 0, 0, 0, 1, 1,
-0.6386912, 0.7894742, 0.07317086, 1, 1, 1, 1, 1,
-0.6385946, 1.494802, 0.135718, 1, 1, 1, 1, 1,
-0.6348674, 0.01583236, -1.739319, 1, 1, 1, 1, 1,
-0.633223, -0.3101049, -1.922148, 1, 1, 1, 1, 1,
-0.6314523, 0.2093062, -2.420807, 1, 1, 1, 1, 1,
-0.6301303, -0.5185936, -2.090438, 1, 1, 1, 1, 1,
-0.6292086, -2.392779, -2.201455, 1, 1, 1, 1, 1,
-0.6284251, -0.01676891, -1.515772, 1, 1, 1, 1, 1,
-0.6269433, 0.3039631, -1.287407, 1, 1, 1, 1, 1,
-0.6195147, -0.6804183, -3.389257, 1, 1, 1, 1, 1,
-0.6182048, 1.159524, -1.36147, 1, 1, 1, 1, 1,
-0.6175687, -0.1071063, -1.504597, 1, 1, 1, 1, 1,
-0.6149856, 0.3057896, -0.253848, 1, 1, 1, 1, 1,
-0.6132552, -0.3962594, -1.973109, 1, 1, 1, 1, 1,
-0.6124338, -1.372513, 0.135547, 1, 1, 1, 1, 1,
-0.6116142, 1.203518, 0.3947555, 0, 0, 1, 1, 1,
-0.6085349, -0.4193545, -3.343191, 1, 0, 0, 1, 1,
-0.6077684, -1.889745, -1.62795, 1, 0, 0, 1, 1,
-0.6076139, 0.2382265, -2.636952, 1, 0, 0, 1, 1,
-0.6051041, 0.05674351, -1.766499, 1, 0, 0, 1, 1,
-0.5990741, -0.2304795, -0.501696, 1, 0, 0, 1, 1,
-0.5932167, -0.3824009, -2.284246, 0, 0, 0, 1, 1,
-0.5868267, 0.05152906, -1.550181, 0, 0, 0, 1, 1,
-0.5837717, 0.3311135, -2.024916, 0, 0, 0, 1, 1,
-0.5816287, 0.5424181, 0.1284558, 0, 0, 0, 1, 1,
-0.5784933, 0.233179, -2.554334, 0, 0, 0, 1, 1,
-0.5709144, 0.324994, -1.959167, 0, 0, 0, 1, 1,
-0.5647954, 0.3212396, -0.6349227, 0, 0, 0, 1, 1,
-0.5625821, -0.5846896, -2.201875, 1, 1, 1, 1, 1,
-0.562422, 1.779977, -0.320882, 1, 1, 1, 1, 1,
-0.5615722, 1.639341, 1.264256, 1, 1, 1, 1, 1,
-0.5598308, 0.1319309, -1.251915, 1, 1, 1, 1, 1,
-0.558678, 0.01919596, 0.4005222, 1, 1, 1, 1, 1,
-0.5521805, 1.018522, -0.7502873, 1, 1, 1, 1, 1,
-0.5512096, 1.73176, -0.3897579, 1, 1, 1, 1, 1,
-0.5511258, -0.1681126, 0.02358481, 1, 1, 1, 1, 1,
-0.5497582, -0.8586891, -2.299043, 1, 1, 1, 1, 1,
-0.5495282, -0.409615, -1.712955, 1, 1, 1, 1, 1,
-0.5473452, 0.0008204035, -0.5292157, 1, 1, 1, 1, 1,
-0.546302, -0.07556543, -3.494821, 1, 1, 1, 1, 1,
-0.546262, -0.4430507, -1.592765, 1, 1, 1, 1, 1,
-0.542196, 0.7297401, -0.02472108, 1, 1, 1, 1, 1,
-0.5384098, 0.4363984, 0.03586664, 1, 1, 1, 1, 1,
-0.5378821, -0.7122011, -2.156707, 0, 0, 1, 1, 1,
-0.5325327, 0.3049995, -1.087771, 1, 0, 0, 1, 1,
-0.5155867, -0.1146029, -1.20975, 1, 0, 0, 1, 1,
-0.5143927, -1.803318, -4.097779, 1, 0, 0, 1, 1,
-0.5143819, 0.1104416, -0.3706901, 1, 0, 0, 1, 1,
-0.5129076, 0.8511809, 0.2907053, 1, 0, 0, 1, 1,
-0.5088663, 0.8811446, 1.045522, 0, 0, 0, 1, 1,
-0.5083041, -1.090805, -2.079225, 0, 0, 0, 1, 1,
-0.5014635, -0.006133177, -2.395851, 0, 0, 0, 1, 1,
-0.5008665, 0.6594345, 0.7724171, 0, 0, 0, 1, 1,
-0.5005025, -1.042586, -2.976091, 0, 0, 0, 1, 1,
-0.5003341, -0.1334911, -0.8733618, 0, 0, 0, 1, 1,
-0.499422, 0.9151435, 0.0778883, 0, 0, 0, 1, 1,
-0.4934216, -0.1739632, -3.213912, 1, 1, 1, 1, 1,
-0.4932125, 1.635837, -0.5310822, 1, 1, 1, 1, 1,
-0.4879535, -1.1025, -2.879049, 1, 1, 1, 1, 1,
-0.4867629, -0.1864979, -2.069917, 1, 1, 1, 1, 1,
-0.486319, 0.9719875, -0.3131756, 1, 1, 1, 1, 1,
-0.4811131, 0.798148, 0.3036193, 1, 1, 1, 1, 1,
-0.4732967, -1.012844, -2.325038, 1, 1, 1, 1, 1,
-0.4715191, 0.4258083, -0.3603842, 1, 1, 1, 1, 1,
-0.4662546, 0.7409651, -2.772046, 1, 1, 1, 1, 1,
-0.4648021, 0.9849476, 0.3306993, 1, 1, 1, 1, 1,
-0.4601436, 0.9749077, 0.1181052, 1, 1, 1, 1, 1,
-0.458299, -0.7945994, -1.903893, 1, 1, 1, 1, 1,
-0.4567094, -0.4151103, -1.745549, 1, 1, 1, 1, 1,
-0.4530502, -1.268702, -3.69316, 1, 1, 1, 1, 1,
-0.4487929, 0.8805838, -0.3591603, 1, 1, 1, 1, 1,
-0.4486421, -0.1935655, -2.811424, 0, 0, 1, 1, 1,
-0.4474587, 1.444515, 0.8919999, 1, 0, 0, 1, 1,
-0.4406251, -0.9386465, -4.137743, 1, 0, 0, 1, 1,
-0.4379965, 0.6487893, -0.02035898, 1, 0, 0, 1, 1,
-0.4379668, -0.518864, -3.133443, 1, 0, 0, 1, 1,
-0.4331116, 0.4364613, 2.176225, 1, 0, 0, 1, 1,
-0.4317442, 0.1462022, -2.328344, 0, 0, 0, 1, 1,
-0.4299139, 0.3815461, -1.493066, 0, 0, 0, 1, 1,
-0.4223275, 1.103341, -1.057954, 0, 0, 0, 1, 1,
-0.406519, -0.5720237, -2.163014, 0, 0, 0, 1, 1,
-0.403797, 0.7779202, -1.416663, 0, 0, 0, 1, 1,
-0.402775, 0.03316325, -2.978367, 0, 0, 0, 1, 1,
-0.402592, -0.4565374, -2.654727, 0, 0, 0, 1, 1,
-0.4010891, -0.7571132, -2.393431, 1, 1, 1, 1, 1,
-0.3908432, 0.9593216, -0.9199868, 1, 1, 1, 1, 1,
-0.385914, -1.408951, -1.729329, 1, 1, 1, 1, 1,
-0.3842932, 1.403915, -1.536365, 1, 1, 1, 1, 1,
-0.3766693, -0.67105, -1.829308, 1, 1, 1, 1, 1,
-0.3727846, 0.09576493, 0.7716061, 1, 1, 1, 1, 1,
-0.3685535, -1.869125, -1.374436, 1, 1, 1, 1, 1,
-0.3680893, 0.5399852, -0.1673214, 1, 1, 1, 1, 1,
-0.3676706, 2.489278, 0.6471416, 1, 1, 1, 1, 1,
-0.365302, 0.1899196, -2.108339, 1, 1, 1, 1, 1,
-0.3635072, -1.018552, -2.725104, 1, 1, 1, 1, 1,
-0.3613853, -0.6341552, -3.341021, 1, 1, 1, 1, 1,
-0.3598089, -1.476133, -2.981066, 1, 1, 1, 1, 1,
-0.3588051, 0.4274001, 0.1572854, 1, 1, 1, 1, 1,
-0.3576727, 0.0670105, -0.7775414, 1, 1, 1, 1, 1,
-0.354561, -0.8361672, -3.149539, 0, 0, 1, 1, 1,
-0.3522699, 0.8422953, -0.3965634, 1, 0, 0, 1, 1,
-0.35155, 0.06076741, -0.1115333, 1, 0, 0, 1, 1,
-0.349369, -0.2847939, -2.457707, 1, 0, 0, 1, 1,
-0.348666, -0.292566, -2.156164, 1, 0, 0, 1, 1,
-0.3468854, -0.4965079, -2.347335, 1, 0, 0, 1, 1,
-0.3460618, -0.8997863, -1.244268, 0, 0, 0, 1, 1,
-0.3424993, 0.08531134, -2.411475, 0, 0, 0, 1, 1,
-0.340818, 0.3438039, -1.281536, 0, 0, 0, 1, 1,
-0.3368319, 0.2828406, -1.623913, 0, 0, 0, 1, 1,
-0.3363456, 1.107454, -0.3345633, 0, 0, 0, 1, 1,
-0.3318226, -1.990653, -3.721763, 0, 0, 0, 1, 1,
-0.3303625, -0.2414639, -1.867238, 0, 0, 0, 1, 1,
-0.3247516, 0.193734, -1.619897, 1, 1, 1, 1, 1,
-0.3231756, 0.8838623, -1.016383, 1, 1, 1, 1, 1,
-0.3199937, 0.5559127, 0.8859556, 1, 1, 1, 1, 1,
-0.3153039, 0.1733021, -2.372618, 1, 1, 1, 1, 1,
-0.3111453, 0.4747513, 0.5945876, 1, 1, 1, 1, 1,
-0.3078594, -0.174485, -1.340341, 1, 1, 1, 1, 1,
-0.3030269, 2.324649, 0.5528329, 1, 1, 1, 1, 1,
-0.3001102, -1.858972, -3.250727, 1, 1, 1, 1, 1,
-0.2992239, 0.3932423, -1.195709, 1, 1, 1, 1, 1,
-0.2934542, 0.4334928, -0.1816269, 1, 1, 1, 1, 1,
-0.2922808, -0.03777878, -1.012089, 1, 1, 1, 1, 1,
-0.2915611, 0.4726905, -1.622869, 1, 1, 1, 1, 1,
-0.2903527, 0.8067287, -0.284172, 1, 1, 1, 1, 1,
-0.2878834, -0.1486929, -3.50978, 1, 1, 1, 1, 1,
-0.2876264, -2.12098, -3.427593, 1, 1, 1, 1, 1,
-0.2858213, 0.2133458, -0.3595309, 0, 0, 1, 1, 1,
-0.2731379, 0.9444598, 0.1482349, 1, 0, 0, 1, 1,
-0.2730482, -1.545008, -3.38906, 1, 0, 0, 1, 1,
-0.2717187, -1.180743, -2.143458, 1, 0, 0, 1, 1,
-0.2671347, 1.291676, -1.574528, 1, 0, 0, 1, 1,
-0.2663469, 0.1676775, 0.01685924, 1, 0, 0, 1, 1,
-0.2645295, 0.8526553, -2.925473, 0, 0, 0, 1, 1,
-0.2544103, 0.03316642, -2.444538, 0, 0, 0, 1, 1,
-0.2530174, 1.162145, -1.277026, 0, 0, 0, 1, 1,
-0.2520744, -0.7508454, -2.732002, 0, 0, 0, 1, 1,
-0.2515604, -0.9030992, -3.120911, 0, 0, 0, 1, 1,
-0.2470422, -1.43313, -2.922071, 0, 0, 0, 1, 1,
-0.2404707, 0.2387184, -0.5055359, 0, 0, 0, 1, 1,
-0.2393103, 1.303807, 1.976717, 1, 1, 1, 1, 1,
-0.2385986, 0.990073, -0.9426772, 1, 1, 1, 1, 1,
-0.2352446, -0.02715629, -1.428588, 1, 1, 1, 1, 1,
-0.2348118, 1.234039, 0.7125732, 1, 1, 1, 1, 1,
-0.230905, -0.1801812, -1.7131, 1, 1, 1, 1, 1,
-0.2290713, 0.4688636, -0.8557675, 1, 1, 1, 1, 1,
-0.2238425, 1.544459, 0.3696191, 1, 1, 1, 1, 1,
-0.2228286, 0.5757592, -1.169026, 1, 1, 1, 1, 1,
-0.2155769, -0.2639273, -2.180513, 1, 1, 1, 1, 1,
-0.2147726, -0.89108, -3.85038, 1, 1, 1, 1, 1,
-0.2137693, -0.1000888, -3.383304, 1, 1, 1, 1, 1,
-0.212137, -0.7105816, -3.491358, 1, 1, 1, 1, 1,
-0.2118418, -0.9886609, -3.00814, 1, 1, 1, 1, 1,
-0.2078259, -0.4594678, -2.84858, 1, 1, 1, 1, 1,
-0.2055548, -0.578315, -2.803109, 1, 1, 1, 1, 1,
-0.2035085, 1.245514, -1.591374, 0, 0, 1, 1, 1,
-0.2031127, -1.648752, -1.715913, 1, 0, 0, 1, 1,
-0.2025663, 0.797828, 0.7581304, 1, 0, 0, 1, 1,
-0.1936935, 0.4838241, -0.1430307, 1, 0, 0, 1, 1,
-0.1906506, 1.380636, -0.760844, 1, 0, 0, 1, 1,
-0.1898255, 1.643157, -0.5034418, 1, 0, 0, 1, 1,
-0.1888227, 1.624154, 0.8659089, 0, 0, 0, 1, 1,
-0.185561, 1.706565, -0.817672, 0, 0, 0, 1, 1,
-0.1850352, -1.010729, -2.669199, 0, 0, 0, 1, 1,
-0.182176, -0.6947342, -2.834258, 0, 0, 0, 1, 1,
-0.1791761, 1.310087, 1.366099, 0, 0, 0, 1, 1,
-0.1766672, 0.43667, -1.350012, 0, 0, 0, 1, 1,
-0.1717238, -1.489211, -3.269728, 0, 0, 0, 1, 1,
-0.1689514, -0.6336402, -0.9858208, 1, 1, 1, 1, 1,
-0.1662914, 1.598108, 1.974479, 1, 1, 1, 1, 1,
-0.1660805, 0.7630574, 0.4781872, 1, 1, 1, 1, 1,
-0.1568598, -0.306563, -2.158926, 1, 1, 1, 1, 1,
-0.155383, 0.6361791, -2.649645, 1, 1, 1, 1, 1,
-0.155025, 0.7611144, -1.913373, 1, 1, 1, 1, 1,
-0.1531223, 1.029001, 0.8367571, 1, 1, 1, 1, 1,
-0.1517957, -1.512111, -2.759809, 1, 1, 1, 1, 1,
-0.1449552, -0.6843346, -1.318098, 1, 1, 1, 1, 1,
-0.1374157, 0.1913734, -0.1317611, 1, 1, 1, 1, 1,
-0.1355847, -0.5773269, -4.013508, 1, 1, 1, 1, 1,
-0.1355557, -0.06545074, -0.09117521, 1, 1, 1, 1, 1,
-0.1334672, 0.02806658, -1.456901, 1, 1, 1, 1, 1,
-0.1309811, -2.226404, -3.557054, 1, 1, 1, 1, 1,
-0.1294908, -1.22522, -2.747828, 1, 1, 1, 1, 1,
-0.1276099, -0.05664833, -1.781269, 0, 0, 1, 1, 1,
-0.1240162, -0.6667423, -1.647096, 1, 0, 0, 1, 1,
-0.1239866, -0.8479066, -1.098861, 1, 0, 0, 1, 1,
-0.1195524, -0.1684245, -3.218463, 1, 0, 0, 1, 1,
-0.1148956, 0.05875044, -1.3772, 1, 0, 0, 1, 1,
-0.11375, 0.6727713, 0.1515551, 1, 0, 0, 1, 1,
-0.1135853, 1.010587, -0.05836933, 0, 0, 0, 1, 1,
-0.1109372, 1.259836, -0.284005, 0, 0, 0, 1, 1,
-0.1071458, -0.09290612, -1.712347, 0, 0, 0, 1, 1,
-0.1067812, -0.8459852, -3.263447, 0, 0, 0, 1, 1,
-0.1057247, 1.684899, 0.3183938, 0, 0, 0, 1, 1,
-0.1042513, 0.1724574, -0.5537094, 0, 0, 0, 1, 1,
-0.09886019, -0.1268288, -1.004009, 0, 0, 0, 1, 1,
-0.09630815, -0.941063, -2.556262, 1, 1, 1, 1, 1,
-0.09053326, 0.9878806, -0.9963921, 1, 1, 1, 1, 1,
-0.08935254, 1.456852, 1.754453, 1, 1, 1, 1, 1,
-0.08750477, -0.1663446, -1.846533, 1, 1, 1, 1, 1,
-0.08579191, 1.626743, 0.5113369, 1, 1, 1, 1, 1,
-0.08430447, 1.169219, 0.8347836, 1, 1, 1, 1, 1,
-0.08406016, 1.476989, 0.01067717, 1, 1, 1, 1, 1,
-0.07206713, -1.110539, -3.571433, 1, 1, 1, 1, 1,
-0.07114113, 0.9990419, 0.09617629, 1, 1, 1, 1, 1,
-0.07098324, 0.5313061, 0.3594863, 1, 1, 1, 1, 1,
-0.06994233, 1.302337, -1.54674, 1, 1, 1, 1, 1,
-0.06517988, 0.6255158, 0.4667907, 1, 1, 1, 1, 1,
-0.06461593, 0.3987841, 0.08014901, 1, 1, 1, 1, 1,
-0.06305186, 0.2980936, -0.4395211, 1, 1, 1, 1, 1,
-0.06106276, -1.665525, -3.970771, 1, 1, 1, 1, 1,
-0.05413901, -2.499717, -2.196933, 0, 0, 1, 1, 1,
-0.04411018, 0.3895255, 0.4942267, 1, 0, 0, 1, 1,
-0.04174889, -0.4093132, -1.256193, 1, 0, 0, 1, 1,
-0.04077264, -0.4807093, -1.557885, 1, 0, 0, 1, 1,
-0.03962548, -2.125598, -3.338555, 1, 0, 0, 1, 1,
-0.0365878, -0.6069258, -1.768114, 1, 0, 0, 1, 1,
-0.03481142, -1.138957, -4.503814, 0, 0, 0, 1, 1,
-0.03163218, 1.749185, -0.1178775, 0, 0, 0, 1, 1,
-0.03103252, 0.9807221, 0.1734339, 0, 0, 0, 1, 1,
-0.03035536, -0.3581966, -2.549848, 0, 0, 0, 1, 1,
-0.02636518, -0.1918527, -3.220754, 0, 0, 0, 1, 1,
-0.02568023, 0.1933872, -1.512093, 0, 0, 0, 1, 1,
-0.02504033, 0.5557573, 1.276673, 0, 0, 0, 1, 1,
-0.01243932, 0.07579606, 0.5019158, 1, 1, 1, 1, 1,
-0.01035934, -0.3405801, -3.487307, 1, 1, 1, 1, 1,
-0.009734294, 0.4183705, -0.2177104, 1, 1, 1, 1, 1,
-0.008020337, -0.9672897, -0.4805417, 1, 1, 1, 1, 1,
-0.002669091, -0.5073966, -4.969797, 1, 1, 1, 1, 1,
0.001690144, 0.704461, -0.5432392, 1, 1, 1, 1, 1,
0.002384865, -1.849798, 4.344159, 1, 1, 1, 1, 1,
0.004850095, 1.317165, -0.8071812, 1, 1, 1, 1, 1,
0.00596152, -0.1908966, 2.625238, 1, 1, 1, 1, 1,
0.00922805, -1.271759, 3.802113, 1, 1, 1, 1, 1,
0.01088775, 1.311937, -0.2260491, 1, 1, 1, 1, 1,
0.01097067, -0.1964588, 3.705994, 1, 1, 1, 1, 1,
0.0120058, -2.297779, 1.924042, 1, 1, 1, 1, 1,
0.01324762, 0.4068863, -0.1610001, 1, 1, 1, 1, 1,
0.01360114, -1.520039, 3.080391, 1, 1, 1, 1, 1,
0.01411891, 0.03836559, 2.193738, 0, 0, 1, 1, 1,
0.01523578, 1.126188, 0.004786736, 1, 0, 0, 1, 1,
0.01855088, 1.132187, -0.1160926, 1, 0, 0, 1, 1,
0.01906474, -0.5148679, 1.720411, 1, 0, 0, 1, 1,
0.0218063, 0.09164585, -0.7588022, 1, 0, 0, 1, 1,
0.02512404, -0.5248429, 4.692163, 1, 0, 0, 1, 1,
0.02929079, -1.313483, 4.621008, 0, 0, 0, 1, 1,
0.02999374, 0.6346407, -0.6618764, 0, 0, 0, 1, 1,
0.04150928, -1.174104, 3.289352, 0, 0, 0, 1, 1,
0.04190529, 0.8154388, 1.072042, 0, 0, 0, 1, 1,
0.04244941, -1.002046, 3.728416, 0, 0, 0, 1, 1,
0.04328594, -1.635094, 3.139538, 0, 0, 0, 1, 1,
0.04661837, 1.685361, -2.493707, 0, 0, 0, 1, 1,
0.04694529, 1.609219, 0.3224614, 1, 1, 1, 1, 1,
0.05147366, -0.05982429, 2.139799, 1, 1, 1, 1, 1,
0.0526513, 0.4675957, -1.885181, 1, 1, 1, 1, 1,
0.05580257, 0.2720947, -0.3856732, 1, 1, 1, 1, 1,
0.05815247, -0.5780826, 5.443868, 1, 1, 1, 1, 1,
0.05936203, 2.42466, -0.4798019, 1, 1, 1, 1, 1,
0.06638886, 1.267489, 0.3987001, 1, 1, 1, 1, 1,
0.06984772, 0.6176049, -0.9401562, 1, 1, 1, 1, 1,
0.07621442, 1.092423, -1.01339, 1, 1, 1, 1, 1,
0.07628413, 0.3634508, -0.9783795, 1, 1, 1, 1, 1,
0.08006423, 0.04513875, 1.977694, 1, 1, 1, 1, 1,
0.08401112, 1.223887, -0.6850221, 1, 1, 1, 1, 1,
0.08529432, -0.2524624, 1.920034, 1, 1, 1, 1, 1,
0.08791083, -0.8490014, 5.450129, 1, 1, 1, 1, 1,
0.08890997, -0.4765718, 4.050033, 1, 1, 1, 1, 1,
0.09254556, -2.69125, 1.371079, 0, 0, 1, 1, 1,
0.09603516, -1.624421, 3.764023, 1, 0, 0, 1, 1,
0.09695425, 1.637005, -0.5232883, 1, 0, 0, 1, 1,
0.1005128, 2.666372, -0.1844709, 1, 0, 0, 1, 1,
0.1012541, 1.367473, 0.2689172, 1, 0, 0, 1, 1,
0.1016292, 0.8350638, -0.09966565, 1, 0, 0, 1, 1,
0.1026402, -0.4817834, 3.704021, 0, 0, 0, 1, 1,
0.103292, -0.2806082, 2.394816, 0, 0, 0, 1, 1,
0.1033614, -0.3130634, 0.9510723, 0, 0, 0, 1, 1,
0.1046895, 1.074452, -2.173286, 0, 0, 0, 1, 1,
0.1059408, -2.550202, -0.1912647, 0, 0, 0, 1, 1,
0.1112469, 0.309061, 1.048968, 0, 0, 0, 1, 1,
0.1164534, 0.4166438, -2.462964, 0, 0, 0, 1, 1,
0.1171397, -1.274399, 2.783479, 1, 1, 1, 1, 1,
0.1201111, -0.07028008, 1.812395, 1, 1, 1, 1, 1,
0.1214316, 2.263018, 1.20526, 1, 1, 1, 1, 1,
0.123905, -0.3109984, 1.408438, 1, 1, 1, 1, 1,
0.1305331, 0.7897557, 0.7801156, 1, 1, 1, 1, 1,
0.1312379, -0.5708051, 1.97223, 1, 1, 1, 1, 1,
0.1315663, -0.5616082, 2.103586, 1, 1, 1, 1, 1,
0.1384979, -1.307191, 2.047178, 1, 1, 1, 1, 1,
0.1401969, -2.592431, 3.906389, 1, 1, 1, 1, 1,
0.1406468, -0.7460291, 3.101146, 1, 1, 1, 1, 1,
0.1421658, 0.4037157, 0.306992, 1, 1, 1, 1, 1,
0.1445717, 0.574423, -0.9790818, 1, 1, 1, 1, 1,
0.1452721, 0.7798168, -0.664471, 1, 1, 1, 1, 1,
0.1459555, -0.05898386, 3.270158, 1, 1, 1, 1, 1,
0.1476777, -0.1892293, 1.884711, 1, 1, 1, 1, 1,
0.1514372, -0.8336326, 3.072877, 0, 0, 1, 1, 1,
0.1527704, 0.3419999, -0.495691, 1, 0, 0, 1, 1,
0.1603474, 1.325367, 0.2530761, 1, 0, 0, 1, 1,
0.1607604, 1.02288, -0.7651993, 1, 0, 0, 1, 1,
0.1621234, -1.669591, 4.22423, 1, 0, 0, 1, 1,
0.1661993, -1.150598, 3.02785, 1, 0, 0, 1, 1,
0.1703434, 1.446605, 0.4901808, 0, 0, 0, 1, 1,
0.1716883, 1.977546, -0.4622557, 0, 0, 0, 1, 1,
0.1734717, 0.01004391, 1.322606, 0, 0, 0, 1, 1,
0.1736306, 0.08585243, 0.2926689, 0, 0, 0, 1, 1,
0.1829878, -1.472601, 2.959622, 0, 0, 0, 1, 1,
0.1891506, -0.5188046, 0.9715527, 0, 0, 0, 1, 1,
0.1910332, -0.1954893, 4.035121, 0, 0, 0, 1, 1,
0.1951408, -0.336652, 2.002373, 1, 1, 1, 1, 1,
0.1952367, -1.151014, 2.863161, 1, 1, 1, 1, 1,
0.2010695, -0.5038777, 3.260909, 1, 1, 1, 1, 1,
0.2011293, 0.9926715, -0.7173344, 1, 1, 1, 1, 1,
0.2128177, -0.6732677, 3.65375, 1, 1, 1, 1, 1,
0.2149622, -0.538383, 2.325176, 1, 1, 1, 1, 1,
0.2185401, 0.781252, -0.8659974, 1, 1, 1, 1, 1,
0.2201417, -0.5844713, 2.545858, 1, 1, 1, 1, 1,
0.2310698, -1.88233, 3.520581, 1, 1, 1, 1, 1,
0.2418826, -0.1464079, 1.700125, 1, 1, 1, 1, 1,
0.2464606, -0.6399876, 3.539736, 1, 1, 1, 1, 1,
0.2493696, 0.07072891, 1.030582, 1, 1, 1, 1, 1,
0.2551936, 2.358796, -0.2679242, 1, 1, 1, 1, 1,
0.255733, -0.9012975, 3.100929, 1, 1, 1, 1, 1,
0.2561153, 0.09845615, 2.214316, 1, 1, 1, 1, 1,
0.2606624, -0.6889346, 3.752349, 0, 0, 1, 1, 1,
0.2628634, -1.344393, 2.836737, 1, 0, 0, 1, 1,
0.2654645, 0.3197798, 2.011324, 1, 0, 0, 1, 1,
0.268804, 0.3538814, -0.6637492, 1, 0, 0, 1, 1,
0.2689764, -1.024777, 2.506422, 1, 0, 0, 1, 1,
0.2725289, 0.3974322, 1.760476, 1, 0, 0, 1, 1,
0.2758687, -1.477996, 2.529811, 0, 0, 0, 1, 1,
0.2762257, -0.09268761, 3.127244, 0, 0, 0, 1, 1,
0.2781034, 0.1340253, 1.330759, 0, 0, 0, 1, 1,
0.2785762, -1.002264, 3.822892, 0, 0, 0, 1, 1,
0.2839403, -0.8383051, 2.300815, 0, 0, 0, 1, 1,
0.289715, 0.6062891, 1.902604, 0, 0, 0, 1, 1,
0.2926126, 3.057486, -0.01451541, 0, 0, 0, 1, 1,
0.2944435, 1.234315, 0.119338, 1, 1, 1, 1, 1,
0.3007196, 2.00164, -0.6340653, 1, 1, 1, 1, 1,
0.3010056, -2.106994, 3.302431, 1, 1, 1, 1, 1,
0.302675, 0.5764983, -0.61292, 1, 1, 1, 1, 1,
0.3091381, 1.013966, -0.7562208, 1, 1, 1, 1, 1,
0.3101087, -1.128458, 1.33166, 1, 1, 1, 1, 1,
0.3119275, -0.498856, 2.142398, 1, 1, 1, 1, 1,
0.3172128, -1.250694, 1.125123, 1, 1, 1, 1, 1,
0.3179798, 0.7950038, 0.933647, 1, 1, 1, 1, 1,
0.318403, -1.313581, 2.613891, 1, 1, 1, 1, 1,
0.3188842, 2.398578, -1.786153, 1, 1, 1, 1, 1,
0.3236094, 1.211887, 0.6029512, 1, 1, 1, 1, 1,
0.3281432, 0.498527, 2.416511, 1, 1, 1, 1, 1,
0.3289481, 1.058005, -0.3179339, 1, 1, 1, 1, 1,
0.3299912, 0.03185276, 1.644243, 1, 1, 1, 1, 1,
0.3353083, -0.2640843, 0.7408206, 0, 0, 1, 1, 1,
0.3379417, -0.9156137, 2.515068, 1, 0, 0, 1, 1,
0.3393822, -0.4607862, 2.891673, 1, 0, 0, 1, 1,
0.3440873, -0.784594, 2.389599, 1, 0, 0, 1, 1,
0.3456637, 0.1420115, 0.6159042, 1, 0, 0, 1, 1,
0.3475013, -0.1373109, 3.081571, 1, 0, 0, 1, 1,
0.348738, -1.613766, 4.499125, 0, 0, 0, 1, 1,
0.3520013, -0.5493294, 2.620767, 0, 0, 0, 1, 1,
0.3524096, -0.3967693, 1.789979, 0, 0, 0, 1, 1,
0.3540151, 0.4520116, 0.9022341, 0, 0, 0, 1, 1,
0.3542362, -0.9237157, 3.01998, 0, 0, 0, 1, 1,
0.3569767, -0.4665436, 1.849634, 0, 0, 0, 1, 1,
0.3607883, -2.038494, 1.87031, 0, 0, 0, 1, 1,
0.3615431, -2.263631, 3.895816, 1, 1, 1, 1, 1,
0.3638034, -0.5647388, 1.737163, 1, 1, 1, 1, 1,
0.3649124, -0.4944713, 3.68274, 1, 1, 1, 1, 1,
0.3654716, 1.148268, -1.1849, 1, 1, 1, 1, 1,
0.3658465, 0.5887701, 0.3982621, 1, 1, 1, 1, 1,
0.3663168, 0.7723749, 2.372645, 1, 1, 1, 1, 1,
0.3721506, -0.7818856, 1.885559, 1, 1, 1, 1, 1,
0.3765513, -0.3420245, 1.322062, 1, 1, 1, 1, 1,
0.3775392, 0.8775232, 1.305326, 1, 1, 1, 1, 1,
0.3775648, -1.124404, 2.628855, 1, 1, 1, 1, 1,
0.3817237, 1.163739, 0.6807948, 1, 1, 1, 1, 1,
0.385343, -0.02158128, 2.516717, 1, 1, 1, 1, 1,
0.3869927, -0.8619695, 1.382853, 1, 1, 1, 1, 1,
0.3898571, -1.203676, 1.287235, 1, 1, 1, 1, 1,
0.3917832, -0.6566659, 4.623889, 1, 1, 1, 1, 1,
0.3926489, 1.494899, 0.9748322, 0, 0, 1, 1, 1,
0.3930271, -0.7362901, 3.385241, 1, 0, 0, 1, 1,
0.3935662, -0.366181, 3.083823, 1, 0, 0, 1, 1,
0.3949504, 2.476762, -0.1986662, 1, 0, 0, 1, 1,
0.3987202, -0.7384997, 3.98546, 1, 0, 0, 1, 1,
0.3990634, 1.543721, 0.09326704, 1, 0, 0, 1, 1,
0.4010748, -1.243011, 2.561425, 0, 0, 0, 1, 1,
0.4141437, -1.423907, 1.90676, 0, 0, 0, 1, 1,
0.4148778, 0.2482222, 2.003531, 0, 0, 0, 1, 1,
0.4178429, -1.072748, 2.023796, 0, 0, 0, 1, 1,
0.418766, -0.4564462, 3.867204, 0, 0, 0, 1, 1,
0.419323, -0.2699583, 1.68183, 0, 0, 0, 1, 1,
0.420278, -1.544606, 3.439043, 0, 0, 0, 1, 1,
0.4240569, -0.7385922, 2.456601, 1, 1, 1, 1, 1,
0.424581, 0.6407087, 0.6791508, 1, 1, 1, 1, 1,
0.42662, -0.447685, 1.885173, 1, 1, 1, 1, 1,
0.4305866, -1.13723, 4.403908, 1, 1, 1, 1, 1,
0.432118, -0.2527413, 2.07368, 1, 1, 1, 1, 1,
0.433116, 1.211703, 0.08276243, 1, 1, 1, 1, 1,
0.4331309, -1.928543, 2.555746, 1, 1, 1, 1, 1,
0.4397033, 2.101417, 0.1028571, 1, 1, 1, 1, 1,
0.4431068, -1.902432, 2.756021, 1, 1, 1, 1, 1,
0.4454536, 2.004867, 0.02090691, 1, 1, 1, 1, 1,
0.4504679, -1.485039, 1.462539, 1, 1, 1, 1, 1,
0.4586551, -0.4399683, 3.054946, 1, 1, 1, 1, 1,
0.4636237, 1.112954, -0.7857886, 1, 1, 1, 1, 1,
0.4671776, -0.6059783, 3.512824, 1, 1, 1, 1, 1,
0.4725087, 0.1005889, 2.764925, 1, 1, 1, 1, 1,
0.4754824, 0.1862729, -0.4362403, 0, 0, 1, 1, 1,
0.4771346, 0.595941, 1.474254, 1, 0, 0, 1, 1,
0.4773501, 0.02065828, 1.321265, 1, 0, 0, 1, 1,
0.4774026, 1.079866, -0.3012604, 1, 0, 0, 1, 1,
0.4804356, -0.5094079, 3.255244, 1, 0, 0, 1, 1,
0.4814295, 1.911888, 0.9005088, 1, 0, 0, 1, 1,
0.4854788, -0.3547539, 2.032867, 0, 0, 0, 1, 1,
0.4886894, -0.1803142, 1.243567, 0, 0, 0, 1, 1,
0.4973539, 1.179567, 0.3152805, 0, 0, 0, 1, 1,
0.5016963, 0.7219378, 0.4097207, 0, 0, 0, 1, 1,
0.506866, -0.4731649, 2.975959, 0, 0, 0, 1, 1,
0.5068855, -1.428998, 2.312011, 0, 0, 0, 1, 1,
0.5120824, 0.8702735, -0.1491622, 0, 0, 0, 1, 1,
0.5124956, 0.1952718, 2.587492, 1, 1, 1, 1, 1,
0.5188586, 0.9815035, 0.339397, 1, 1, 1, 1, 1,
0.5199131, -1.363495, 3.842179, 1, 1, 1, 1, 1,
0.5228136, 0.2016573, 0.08429029, 1, 1, 1, 1, 1,
0.5280841, 0.695045, -1.064629, 1, 1, 1, 1, 1,
0.5315098, -2.246871, 2.980588, 1, 1, 1, 1, 1,
0.5368503, 1.073842, 0.08038471, 1, 1, 1, 1, 1,
0.538325, -0.3993902, 1.595477, 1, 1, 1, 1, 1,
0.5429866, 2.125895, -0.8027654, 1, 1, 1, 1, 1,
0.5461227, -0.8806043, 0.105731, 1, 1, 1, 1, 1,
0.5506031, -0.0530692, 3.488298, 1, 1, 1, 1, 1,
0.5507935, 0.9124805, 0.0932066, 1, 1, 1, 1, 1,
0.5533656, -1.054477, 1.570472, 1, 1, 1, 1, 1,
0.5563411, 0.4021582, -0.4715696, 1, 1, 1, 1, 1,
0.5681866, 1.013784, -0.4468298, 1, 1, 1, 1, 1,
0.585593, 0.4203398, 1.594811, 0, 0, 1, 1, 1,
0.5857113, 0.7682413, 2.253904, 1, 0, 0, 1, 1,
0.5875046, 1.608516, -0.5683959, 1, 0, 0, 1, 1,
0.594486, 1.737801, 1.985021, 1, 0, 0, 1, 1,
0.5945724, 1.122218, 0.9054935, 1, 0, 0, 1, 1,
0.5956036, 1.117221, 0.6905754, 1, 0, 0, 1, 1,
0.5957095, 0.2959877, 0.3546359, 0, 0, 0, 1, 1,
0.5963451, 0.3074849, 0.7027035, 0, 0, 0, 1, 1,
0.602352, 0.7402188, 2.212528, 0, 0, 0, 1, 1,
0.6037471, -2.978334, 2.424841, 0, 0, 0, 1, 1,
0.6083838, -0.3612297, 1.910852, 0, 0, 0, 1, 1,
0.6188469, -0.6523569, 0.4753143, 0, 0, 0, 1, 1,
0.6193783, 1.55314, 1.419776, 0, 0, 0, 1, 1,
0.6226143, 1.279119, -0.02150859, 1, 1, 1, 1, 1,
0.6226206, -0.3476361, 3.352003, 1, 1, 1, 1, 1,
0.6247691, -0.9270223, 1.697829, 1, 1, 1, 1, 1,
0.6270723, 1.723172, 1.840149, 1, 1, 1, 1, 1,
0.6293995, -1.825307, 3.441897, 1, 1, 1, 1, 1,
0.635844, 1.28271, 0.5915226, 1, 1, 1, 1, 1,
0.6358578, 1.13067, 1.172267, 1, 1, 1, 1, 1,
0.6361655, 0.1718987, -0.5314417, 1, 1, 1, 1, 1,
0.6384619, -0.9388832, 1.689176, 1, 1, 1, 1, 1,
0.6410413, 0.5913877, 0.9761593, 1, 1, 1, 1, 1,
0.6430991, -0.3028384, 0.531692, 1, 1, 1, 1, 1,
0.6472058, -0.4360356, 1.13162, 1, 1, 1, 1, 1,
0.6486421, 0.002625654, 0.4328945, 1, 1, 1, 1, 1,
0.6496593, -0.104227, 3.107306, 1, 1, 1, 1, 1,
0.6520826, -1.273695, 2.793193, 1, 1, 1, 1, 1,
0.6559982, -0.4216786, 2.613172, 0, 0, 1, 1, 1,
0.6596353, 0.7717627, -0.7811141, 1, 0, 0, 1, 1,
0.6673713, -1.106666, 1.38313, 1, 0, 0, 1, 1,
0.6674033, -0.5473752, 3.533778, 1, 0, 0, 1, 1,
0.6737133, 1.400178, 0.5567783, 1, 0, 0, 1, 1,
0.6749874, -0.2645157, 1.924744, 1, 0, 0, 1, 1,
0.6815528, -0.1822599, 2.056474, 0, 0, 0, 1, 1,
0.6904832, 0.6068733, 0.1970584, 0, 0, 0, 1, 1,
0.6988373, 0.4996598, 2.606708, 0, 0, 0, 1, 1,
0.6990199, -0.660956, 2.500695, 0, 0, 0, 1, 1,
0.7048367, 0.7399798, -1.070958, 0, 0, 0, 1, 1,
0.7134601, -0.4737673, 1.484274, 0, 0, 0, 1, 1,
0.7243493, 0.7890214, -1.193296, 0, 0, 0, 1, 1,
0.7274469, -1.075093, 3.048692, 1, 1, 1, 1, 1,
0.7276077, -0.754801, 1.576407, 1, 1, 1, 1, 1,
0.7377225, -0.3537081, 0.460311, 1, 1, 1, 1, 1,
0.7407643, 0.6736889, 1.738323, 1, 1, 1, 1, 1,
0.7433033, -0.6957679, 3.033882, 1, 1, 1, 1, 1,
0.7447282, 0.264874, 0.457042, 1, 1, 1, 1, 1,
0.7456619, 0.1605096, 0.3413024, 1, 1, 1, 1, 1,
0.7459049, 0.8405721, 1.898283, 1, 1, 1, 1, 1,
0.7493309, -0.161638, 3.157925, 1, 1, 1, 1, 1,
0.7520072, 0.4240318, 2.308261, 1, 1, 1, 1, 1,
0.770028, -0.823054, 2.799273, 1, 1, 1, 1, 1,
0.785402, -0.5716603, 1.28376, 1, 1, 1, 1, 1,
0.7868516, 0.2039973, 0.4955839, 1, 1, 1, 1, 1,
0.7917179, -0.09958512, 2.700344, 1, 1, 1, 1, 1,
0.7951704, 0.2105892, 1.255291, 1, 1, 1, 1, 1,
0.7957764, 0.446077, 2.206413, 0, 0, 1, 1, 1,
0.7982866, -0.3105044, 3.382061, 1, 0, 0, 1, 1,
0.7994496, -0.850126, 2.033872, 1, 0, 0, 1, 1,
0.7999437, -0.4131278, 3.303006, 1, 0, 0, 1, 1,
0.8023098, -0.840991, 3.240413, 1, 0, 0, 1, 1,
0.804007, -1.599572, 1.59084, 1, 0, 0, 1, 1,
0.8084304, -1.315806, 1.857189, 0, 0, 0, 1, 1,
0.8101435, -1.599883, 4.075408, 0, 0, 0, 1, 1,
0.8103219, 0.1375628, 2.144247, 0, 0, 0, 1, 1,
0.8175352, 1.323377, 1.039254, 0, 0, 0, 1, 1,
0.8199603, 0.8309305, 1.61589, 0, 0, 0, 1, 1,
0.8231397, 0.8265084, 2.125308, 0, 0, 0, 1, 1,
0.8235171, -1.092458, 3.394437, 0, 0, 0, 1, 1,
0.8279746, 0.4155682, 2.411022, 1, 1, 1, 1, 1,
0.8282987, -1.380874, 2.594401, 1, 1, 1, 1, 1,
0.8307307, 2.153891, 0.6309029, 1, 1, 1, 1, 1,
0.8328094, -0.2102181, 2.502723, 1, 1, 1, 1, 1,
0.8465158, -2.55486, 2.748968, 1, 1, 1, 1, 1,
0.8525791, -0.01619928, 2.12627, 1, 1, 1, 1, 1,
0.857094, -0.7634736, 3.23336, 1, 1, 1, 1, 1,
0.8594758, -0.8966131, 3.31575, 1, 1, 1, 1, 1,
0.8610125, -0.588243, 0.9931362, 1, 1, 1, 1, 1,
0.8623384, 0.723609, 0.369934, 1, 1, 1, 1, 1,
0.8716386, 1.631233, -0.4721274, 1, 1, 1, 1, 1,
0.8781246, 0.7579347, 1.814924, 1, 1, 1, 1, 1,
0.892494, -2.751071, 3.426846, 1, 1, 1, 1, 1,
0.89477, 0.1230769, 1.680132, 1, 1, 1, 1, 1,
0.8960938, 1.740949, 1.228393, 1, 1, 1, 1, 1,
0.8996319, 0.5513258, 0.9427025, 0, 0, 1, 1, 1,
0.9005411, 0.4192382, 1.588068, 1, 0, 0, 1, 1,
0.9023211, -1.052464, 1.916141, 1, 0, 0, 1, 1,
0.9040245, 0.3424349, 0.5405862, 1, 0, 0, 1, 1,
0.9069566, -0.0518075, 2.863844, 1, 0, 0, 1, 1,
0.9088885, 0.7512621, 1.161202, 1, 0, 0, 1, 1,
0.911639, -0.1535472, -0.07249276, 0, 0, 0, 1, 1,
0.917255, 1.850237, 0.5749817, 0, 0, 0, 1, 1,
0.919399, 1.521654, 1.221725, 0, 0, 0, 1, 1,
0.9234269, -1.584731, 2.714817, 0, 0, 0, 1, 1,
0.9259381, -0.3977504, 2.234033, 0, 0, 0, 1, 1,
0.9302754, 0.3753624, 2.105415, 0, 0, 0, 1, 1,
0.94252, 0.6177342, 1.12595, 0, 0, 0, 1, 1,
0.95019, 1.428087, 0.02319266, 1, 1, 1, 1, 1,
0.9526332, 1.827774, 0.6949294, 1, 1, 1, 1, 1,
0.9530814, 0.55215, 0.3993589, 1, 1, 1, 1, 1,
0.9628096, -1.282906, 2.526026, 1, 1, 1, 1, 1,
0.9628499, 0.5537981, -0.8999847, 1, 1, 1, 1, 1,
0.9664137, 0.945552, 1.838224, 1, 1, 1, 1, 1,
0.976976, 1.544228, -0.7535234, 1, 1, 1, 1, 1,
0.9771869, -0.4540799, 3.398609, 1, 1, 1, 1, 1,
0.9772111, 0.6591325, 0.9819427, 1, 1, 1, 1, 1,
0.9791171, -1.314689, 2.695239, 1, 1, 1, 1, 1,
0.9897755, 0.1764477, 1.238635, 1, 1, 1, 1, 1,
1.002856, 1.11801, 2.192315, 1, 1, 1, 1, 1,
1.011418, -0.2736074, 1.82184, 1, 1, 1, 1, 1,
1.023211, -0.3349518, 1.669325, 1, 1, 1, 1, 1,
1.025728, -0.265901, 2.306529, 1, 1, 1, 1, 1,
1.043216, -0.07325555, 2.443151, 0, 0, 1, 1, 1,
1.058705, -0.04460584, 2.62849, 1, 0, 0, 1, 1,
1.059839, -0.5108565, 1.68324, 1, 0, 0, 1, 1,
1.061924, 0.5153525, 0.7703061, 1, 0, 0, 1, 1,
1.067588, -0.6679428, 0.3399882, 1, 0, 0, 1, 1,
1.068081, -0.7444385, 1.749289, 1, 0, 0, 1, 1,
1.068513, -0.7101427, 1.95784, 0, 0, 0, 1, 1,
1.069035, -0.6842915, 1.050654, 0, 0, 0, 1, 1,
1.072191, -1.414752, 3.112449, 0, 0, 0, 1, 1,
1.072812, 0.3865713, 1.301194, 0, 0, 0, 1, 1,
1.078432, -0.5410767, 3.050068, 0, 0, 0, 1, 1,
1.078602, -0.893319, 3.179712, 0, 0, 0, 1, 1,
1.078977, 0.1211001, 3.570529, 0, 0, 0, 1, 1,
1.083757, 0.5445824, 3.054075, 1, 1, 1, 1, 1,
1.084603, -0.6664748, 1.665472, 1, 1, 1, 1, 1,
1.089577, -2.757195, 4.184718, 1, 1, 1, 1, 1,
1.090023, 1.004578, 0.4471443, 1, 1, 1, 1, 1,
1.09442, -1.032595, 0.3366401, 1, 1, 1, 1, 1,
1.097588, 0.5052281, 0.8924737, 1, 1, 1, 1, 1,
1.098179, 1.572924, 0.1456046, 1, 1, 1, 1, 1,
1.10804, -1.263576, 1.665683, 1, 1, 1, 1, 1,
1.108538, 1.292188, 0.1829052, 1, 1, 1, 1, 1,
1.111672, -0.8704062, 3.938247, 1, 1, 1, 1, 1,
1.112064, -0.7147574, 2.635054, 1, 1, 1, 1, 1,
1.113035, 0.633779, 2.772881, 1, 1, 1, 1, 1,
1.113402, 0.07082237, 0.880111, 1, 1, 1, 1, 1,
1.118305, -0.7625307, 4.285193, 1, 1, 1, 1, 1,
1.12198, -0.809345, 2.45868, 1, 1, 1, 1, 1,
1.125453, -0.4605707, 0.8510578, 0, 0, 1, 1, 1,
1.12844, -0.5352225, 2.593184, 1, 0, 0, 1, 1,
1.13165, -0.6901464, 1.107426, 1, 0, 0, 1, 1,
1.133978, 0.7137532, -0.1570154, 1, 0, 0, 1, 1,
1.135825, -0.07990122, 2.282622, 1, 0, 0, 1, 1,
1.136604, 0.07245522, 1.154417, 1, 0, 0, 1, 1,
1.147944, 0.5993068, 0.8693538, 0, 0, 0, 1, 1,
1.151544, -1.254338, 1.983999, 0, 0, 0, 1, 1,
1.160858, -0.3514365, 1.370993, 0, 0, 0, 1, 1,
1.168136, 0.8147306, 2.63313, 0, 0, 0, 1, 1,
1.17045, 1.195153, 1.010463, 0, 0, 0, 1, 1,
1.17126, -0.5778875, 2.944342, 0, 0, 0, 1, 1,
1.176778, -0.2314376, 1.402898, 0, 0, 0, 1, 1,
1.177597, 0.1003995, 0.3932653, 1, 1, 1, 1, 1,
1.178636, -0.150387, 3.560359, 1, 1, 1, 1, 1,
1.183159, 1.724706, -0.6058645, 1, 1, 1, 1, 1,
1.190109, -0.3737873, 3.50175, 1, 1, 1, 1, 1,
1.193714, -0.2312483, 2.164745, 1, 1, 1, 1, 1,
1.207007, 0.5479959, 1.342735, 1, 1, 1, 1, 1,
1.209622, 0.1712305, 2.106016, 1, 1, 1, 1, 1,
1.214857, -1.434318, 2.853994, 1, 1, 1, 1, 1,
1.220315, -0.6630676, 1.316033, 1, 1, 1, 1, 1,
1.220971, 0.08188882, 2.833523, 1, 1, 1, 1, 1,
1.223871, -1.399358, 2.17769, 1, 1, 1, 1, 1,
1.226346, 1.327692, 1.103203, 1, 1, 1, 1, 1,
1.23, -0.2489392, 2.275558, 1, 1, 1, 1, 1,
1.23565, -0.888463, 2.404042, 1, 1, 1, 1, 1,
1.23688, -1.968104, 2.395847, 1, 1, 1, 1, 1,
1.237904, 0.03661592, 0.9617022, 0, 0, 1, 1, 1,
1.251386, 1.906576, 0.0243683, 1, 0, 0, 1, 1,
1.258787, -0.745836, 0.7308805, 1, 0, 0, 1, 1,
1.260294, 1.523979, -0.2425614, 1, 0, 0, 1, 1,
1.265532, 1.690948, 1.236522, 1, 0, 0, 1, 1,
1.270538, 0.009802911, 2.329899, 1, 0, 0, 1, 1,
1.281802, 0.3316782, 0.1098796, 0, 0, 0, 1, 1,
1.28409, -0.7260713, 2.336448, 0, 0, 0, 1, 1,
1.284938, -0.2698977, 2.769714, 0, 0, 0, 1, 1,
1.285248, -0.3204739, 0.4953619, 0, 0, 0, 1, 1,
1.285362, 0.742281, 1.991661, 0, 0, 0, 1, 1,
1.305375, -0.1616266, 2.209942, 0, 0, 0, 1, 1,
1.327325, -0.8438596, 2.179267, 0, 0, 0, 1, 1,
1.327714, -0.5932717, 2.758615, 1, 1, 1, 1, 1,
1.331281, 0.685291, 0.3919972, 1, 1, 1, 1, 1,
1.343838, -0.3971272, 1.617043, 1, 1, 1, 1, 1,
1.346131, -1.700654, 3.211785, 1, 1, 1, 1, 1,
1.3614, 0.5631923, 1.475364, 1, 1, 1, 1, 1,
1.36787, 0.1957356, 1.784165, 1, 1, 1, 1, 1,
1.372371, 1.189852, 0.2707415, 1, 1, 1, 1, 1,
1.37889, -0.8327985, 1.23193, 1, 1, 1, 1, 1,
1.381052, 0.7277878, 1.006292, 1, 1, 1, 1, 1,
1.387137, -0.7217374, 2.141178, 1, 1, 1, 1, 1,
1.3917, -1.152284, 0.9817697, 1, 1, 1, 1, 1,
1.416962, -0.0140573, 1.64233, 1, 1, 1, 1, 1,
1.429419, -0.8898116, 2.231077, 1, 1, 1, 1, 1,
1.437213, -0.4130329, 1.397457, 1, 1, 1, 1, 1,
1.450911, -2.201693, 1.246798, 1, 1, 1, 1, 1,
1.456863, 1.026273, 1.2642, 0, 0, 1, 1, 1,
1.461178, 0.4258237, 1.229901, 1, 0, 0, 1, 1,
1.464445, 2.388214, 0.8641106, 1, 0, 0, 1, 1,
1.470916, 0.8173273, 0.1012853, 1, 0, 0, 1, 1,
1.473192, -0.1938052, 1.718925, 1, 0, 0, 1, 1,
1.473641, -1.181244, 3.144822, 1, 0, 0, 1, 1,
1.474945, 1.148654, 1.723642, 0, 0, 0, 1, 1,
1.480105, 0.01612717, 0.398605, 0, 0, 0, 1, 1,
1.490316, 0.559184, 1.925214, 0, 0, 0, 1, 1,
1.491406, -0.117997, -0.2220551, 0, 0, 0, 1, 1,
1.503588, 0.151327, 2.147172, 0, 0, 0, 1, 1,
1.520195, 0.1123213, 2.360568, 0, 0, 0, 1, 1,
1.527239, -1.760211, 3.586476, 0, 0, 0, 1, 1,
1.548092, 0.394354, 0.03579053, 1, 1, 1, 1, 1,
1.551815, -1.445993, 1.703406, 1, 1, 1, 1, 1,
1.554847, 0.09234415, 1.145302, 1, 1, 1, 1, 1,
1.567369, -1.490101, 0.3971597, 1, 1, 1, 1, 1,
1.568828, 0.764492, 0.2677869, 1, 1, 1, 1, 1,
1.594052, -0.3331594, 0.6019072, 1, 1, 1, 1, 1,
1.603939, -1.682157, 1.366191, 1, 1, 1, 1, 1,
1.643977, -0.8564748, 4.281469, 1, 1, 1, 1, 1,
1.651806, -0.3622789, 1.15005, 1, 1, 1, 1, 1,
1.657334, -0.5875322, 1.841211, 1, 1, 1, 1, 1,
1.67235, 1.339614, 1.327838, 1, 1, 1, 1, 1,
1.672655, 0.6079618, 0.6661937, 1, 1, 1, 1, 1,
1.679799, 1.283392, -0.2825624, 1, 1, 1, 1, 1,
1.698343, -2.018832, 2.322158, 1, 1, 1, 1, 1,
1.701269, 0.4324657, 0.8911018, 1, 1, 1, 1, 1,
1.703927, -1.17259, 2.154988, 0, 0, 1, 1, 1,
1.71895, 1.570024, 0.9141414, 1, 0, 0, 1, 1,
1.719936, -0.8931145, 3.131948, 1, 0, 0, 1, 1,
1.734919, 0.447825, 1.242984, 1, 0, 0, 1, 1,
1.749788, -1.745365, 3.15838, 1, 0, 0, 1, 1,
1.756765, 0.4064156, 1.365334, 1, 0, 0, 1, 1,
1.76445, -0.8114169, 2.727403, 0, 0, 0, 1, 1,
1.797589, 1.442791, 0.9241456, 0, 0, 0, 1, 1,
1.822946, -0.3104234, 3.368282, 0, 0, 0, 1, 1,
1.824475, 1.177673, 0.7189378, 0, 0, 0, 1, 1,
1.860498, 0.6186802, 0.8551373, 0, 0, 0, 1, 1,
1.868654, -1.907058, 1.840879, 0, 0, 0, 1, 1,
1.871019, 0.1413589, 0.4446355, 0, 0, 0, 1, 1,
1.889977, 0.2629335, 2.171491, 1, 1, 1, 1, 1,
1.917993, 0.4500141, 1.862524, 1, 1, 1, 1, 1,
1.926122, -1.825739, 4.113186, 1, 1, 1, 1, 1,
1.926132, 0.2116828, 1.882567, 1, 1, 1, 1, 1,
1.976419, -0.4587186, 1.97871, 1, 1, 1, 1, 1,
1.997856, -0.1813348, 0.4043977, 1, 1, 1, 1, 1,
2.020668, 1.560103, -0.1053338, 1, 1, 1, 1, 1,
2.02349, -0.5702412, 0.378835, 1, 1, 1, 1, 1,
2.026528, -1.089817, 0.4726408, 1, 1, 1, 1, 1,
2.038125, -0.02692016, 0.02739109, 1, 1, 1, 1, 1,
2.040298, -0.01370464, 2.947047, 1, 1, 1, 1, 1,
2.077944, -1.288191, 2.470093, 1, 1, 1, 1, 1,
2.096541, -1.373275, -0.09994779, 1, 1, 1, 1, 1,
2.098746, 0.2485717, 1.914592, 1, 1, 1, 1, 1,
2.103856, -0.4474857, 1.938428, 1, 1, 1, 1, 1,
2.109259, 0.5350342, 1.14262, 0, 0, 1, 1, 1,
2.116086, -2.016783, 1.509306, 1, 0, 0, 1, 1,
2.133287, -1.068776, 2.371394, 1, 0, 0, 1, 1,
2.144518, 0.1452223, 1.851369, 1, 0, 0, 1, 1,
2.21641, -1.69161, 0.4181513, 1, 0, 0, 1, 1,
2.219797, -0.82442, 2.839975, 1, 0, 0, 1, 1,
2.229167, 2.110062, 2.277616, 0, 0, 0, 1, 1,
2.240947, -0.3699882, 1.791014, 0, 0, 0, 1, 1,
2.270705, 0.5432835, 1.011586, 0, 0, 0, 1, 1,
2.277523, 0.2643464, 2.544633, 0, 0, 0, 1, 1,
2.292796, -0.4194214, -0.4066679, 0, 0, 0, 1, 1,
2.337376, -1.039301, 3.100893, 0, 0, 0, 1, 1,
2.474967, -0.3575197, 2.772398, 0, 0, 0, 1, 1,
2.51721, 2.426468, 1.516773, 1, 1, 1, 1, 1,
2.565964, 0.874249, 0.7579404, 1, 1, 1, 1, 1,
2.606363, -0.0792253, 3.040976, 1, 1, 1, 1, 1,
2.674078, -0.08693641, 3.040951, 1, 1, 1, 1, 1,
2.827219, -1.441683, 1.891264, 1, 1, 1, 1, 1,
2.827354, 0.2033445, 2.068863, 1, 1, 1, 1, 1,
2.937209, -0.8083306, 3.163619, 1, 1, 1, 1, 1
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
var radius = 9.449009;
var distance = 33.18924;
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
mvMatrix.translate( -0.09848654, -0.1851162, 0.008829594 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.18924);
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
