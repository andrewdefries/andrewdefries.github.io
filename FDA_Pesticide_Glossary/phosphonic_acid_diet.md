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
-2.930639, 0.4588287, -1.294793, 1, 0, 0, 1,
-2.834047, -2.36267, -2.37334, 1, 0.007843138, 0, 1,
-2.744358, -0.5692304, 0.2877285, 1, 0.01176471, 0, 1,
-2.668001, -0.6858751, -1.648004, 1, 0.01960784, 0, 1,
-2.597636, -0.7886444, -2.937418, 1, 0.02352941, 0, 1,
-2.495819, -1.048408, -0.6795485, 1, 0.03137255, 0, 1,
-2.471871, -0.03501774, -1.688255, 1, 0.03529412, 0, 1,
-2.470378, -0.8587097, -1.948158, 1, 0.04313726, 0, 1,
-2.419859, 1.262364, -2.327567, 1, 0.04705882, 0, 1,
-2.360276, 0.09081482, -1.44905, 1, 0.05490196, 0, 1,
-2.330343, -0.2805992, -1.356114, 1, 0.05882353, 0, 1,
-2.299799, 0.3381175, -0.8120405, 1, 0.06666667, 0, 1,
-2.2946, 0.145374, -1.07853, 1, 0.07058824, 0, 1,
-2.274509, -0.6231166, -2.699776, 1, 0.07843138, 0, 1,
-2.262559, 1.664996, -0.004758752, 1, 0.08235294, 0, 1,
-2.232562, -1.592526, -2.222715, 1, 0.09019608, 0, 1,
-2.231076, -1.588911, -3.349654, 1, 0.09411765, 0, 1,
-2.214847, -0.3272747, -2.563859, 1, 0.1019608, 0, 1,
-2.210217, -0.8617363, -3.476023, 1, 0.1098039, 0, 1,
-2.171273, 0.1669708, -1.708522, 1, 0.1137255, 0, 1,
-2.148521, -1.144777, -0.9951152, 1, 0.1215686, 0, 1,
-2.053098, 1.881024, -0.2675456, 1, 0.1254902, 0, 1,
-2.048151, 1.068724, -2.174408, 1, 0.1333333, 0, 1,
-2.033031, 0.1191076, -0.6180204, 1, 0.1372549, 0, 1,
-2.016043, 1.088968, 0.649487, 1, 0.145098, 0, 1,
-2.007592, 0.3865433, -0.9195972, 1, 0.1490196, 0, 1,
-2.006657, -1.197539, -2.635813, 1, 0.1568628, 0, 1,
-1.995903, -1.479647, -2.030748, 1, 0.1607843, 0, 1,
-1.982624, 1.537148, -0.7930859, 1, 0.1686275, 0, 1,
-1.957145, -0.7690303, -3.35013, 1, 0.172549, 0, 1,
-1.937996, -1.070479, -0.9271773, 1, 0.1803922, 0, 1,
-1.934516, 0.3831129, -0.464423, 1, 0.1843137, 0, 1,
-1.915945, 0.1515536, -0.3462516, 1, 0.1921569, 0, 1,
-1.881375, 1.580488, 0.9043778, 1, 0.1960784, 0, 1,
-1.877239, 1.334462, -1.775151, 1, 0.2039216, 0, 1,
-1.86964, -0.3369787, -1.798947, 1, 0.2117647, 0, 1,
-1.865673, -0.9071312, -3.197331, 1, 0.2156863, 0, 1,
-1.839528, -0.02786307, -0.810834, 1, 0.2235294, 0, 1,
-1.834095, 0.8547682, -0.9715105, 1, 0.227451, 0, 1,
-1.826465, 2.152649, 1.424329, 1, 0.2352941, 0, 1,
-1.824112, 0.4741832, -1.162786, 1, 0.2392157, 0, 1,
-1.810943, 0.09175687, -0.797958, 1, 0.2470588, 0, 1,
-1.80325, -0.3465018, -1.471261, 1, 0.2509804, 0, 1,
-1.799787, -1.888465, -1.533089, 1, 0.2588235, 0, 1,
-1.795175, -0.806146, -3.28534, 1, 0.2627451, 0, 1,
-1.788888, -0.2086938, -1.958936, 1, 0.2705882, 0, 1,
-1.76524, -1.731383, -1.874099, 1, 0.2745098, 0, 1,
-1.759889, 0.6644772, -2.243238, 1, 0.282353, 0, 1,
-1.727329, -1.929551, 0.4095685, 1, 0.2862745, 0, 1,
-1.726871, 0.04417071, -1.312486, 1, 0.2941177, 0, 1,
-1.721643, -0.8969293, -2.130326, 1, 0.3019608, 0, 1,
-1.698787, 0.1492467, -0.3956787, 1, 0.3058824, 0, 1,
-1.673619, -0.1958104, -2.392612, 1, 0.3137255, 0, 1,
-1.67254, 0.355788, -2.070706, 1, 0.3176471, 0, 1,
-1.638328, 1.72734, -1.287394, 1, 0.3254902, 0, 1,
-1.626974, -0.7445167, -1.417931, 1, 0.3294118, 0, 1,
-1.619787, -0.2489877, -1.977296, 1, 0.3372549, 0, 1,
-1.61447, 0.8331378, -0.04228797, 1, 0.3411765, 0, 1,
-1.614183, 0.1857927, -3.106735, 1, 0.3490196, 0, 1,
-1.568975, -0.01859926, -1.157918, 1, 0.3529412, 0, 1,
-1.556112, 0.080626, -0.4983447, 1, 0.3607843, 0, 1,
-1.532678, 0.233609, -0.8474809, 1, 0.3647059, 0, 1,
-1.518604, -0.8516632, -2.511952, 1, 0.372549, 0, 1,
-1.517748, -0.7024942, -1.072239, 1, 0.3764706, 0, 1,
-1.486894, 0.2398785, -2.278491, 1, 0.3843137, 0, 1,
-1.480251, -0.2463276, -3.598588, 1, 0.3882353, 0, 1,
-1.473377, -0.9217284, -2.604166, 1, 0.3960784, 0, 1,
-1.467488, -1.641555, -3.655588, 1, 0.4039216, 0, 1,
-1.467169, -0.2175542, -1.621435, 1, 0.4078431, 0, 1,
-1.44322, 0.3364323, 0.08579654, 1, 0.4156863, 0, 1,
-1.436609, -2.436276, -1.430613, 1, 0.4196078, 0, 1,
-1.431244, -0.5264608, -0.194753, 1, 0.427451, 0, 1,
-1.427149, 0.7080869, -0.1998941, 1, 0.4313726, 0, 1,
-1.423627, -1.32653, -2.453251, 1, 0.4392157, 0, 1,
-1.409971, 0.5421832, -3.149844, 1, 0.4431373, 0, 1,
-1.409908, 0.2567737, -2.248317, 1, 0.4509804, 0, 1,
-1.409186, 0.9910806, -0.9402876, 1, 0.454902, 0, 1,
-1.402249, -0.1773198, -1.167027, 1, 0.4627451, 0, 1,
-1.402213, -0.4656333, -3.868279, 1, 0.4666667, 0, 1,
-1.39864, 0.07938528, -1.904572, 1, 0.4745098, 0, 1,
-1.398117, -1.493542, -1.544104, 1, 0.4784314, 0, 1,
-1.391482, 0.2493537, -0.798731, 1, 0.4862745, 0, 1,
-1.390101, -1.25707, -2.610103, 1, 0.4901961, 0, 1,
-1.381715, -1.643862, -3.531745, 1, 0.4980392, 0, 1,
-1.372717, -0.02081038, -2.26403, 1, 0.5058824, 0, 1,
-1.361628, -0.4936517, -2.08615, 1, 0.509804, 0, 1,
-1.360808, -0.7682445, -1.876141, 1, 0.5176471, 0, 1,
-1.353785, -0.2651973, -0.7769783, 1, 0.5215687, 0, 1,
-1.34895, -1.139467, -3.177885, 1, 0.5294118, 0, 1,
-1.348823, 0.1865326, -1.661016, 1, 0.5333334, 0, 1,
-1.344346, 0.2046082, 0.09686597, 1, 0.5411765, 0, 1,
-1.340536, -0.674017, -1.556119, 1, 0.5450981, 0, 1,
-1.330491, -1.544471, -3.780915, 1, 0.5529412, 0, 1,
-1.321172, 0.1828074, -0.6553671, 1, 0.5568628, 0, 1,
-1.315288, -0.8348159, -2.781054, 1, 0.5647059, 0, 1,
-1.314667, -1.288263, -2.069984, 1, 0.5686275, 0, 1,
-1.309052, 1.450825, -0.9887472, 1, 0.5764706, 0, 1,
-1.305208, -0.6317136, -1.809839, 1, 0.5803922, 0, 1,
-1.304042, 0.7313098, 1.048434, 1, 0.5882353, 0, 1,
-1.302964, -1.539971, -1.737036, 1, 0.5921569, 0, 1,
-1.299582, -0.1763734, -0.03350179, 1, 0.6, 0, 1,
-1.295843, 0.5616494, -1.314916, 1, 0.6078432, 0, 1,
-1.295297, 1.068962, -1.352622, 1, 0.6117647, 0, 1,
-1.29504, -0.144035, -2.378507, 1, 0.6196079, 0, 1,
-1.29294, 1.167794, -2.59717, 1, 0.6235294, 0, 1,
-1.282926, 1.44206, -1.204528, 1, 0.6313726, 0, 1,
-1.279386, -0.5336637, -1.742545, 1, 0.6352941, 0, 1,
-1.260595, 0.8267695, -1.718898, 1, 0.6431373, 0, 1,
-1.260018, -0.6065769, -2.541896, 1, 0.6470588, 0, 1,
-1.257214, 0.9627925, -2.550664, 1, 0.654902, 0, 1,
-1.256293, -1.071356, -1.455251, 1, 0.6588235, 0, 1,
-1.250194, 0.134101, -1.578351, 1, 0.6666667, 0, 1,
-1.237931, 0.8630522, -0.4457894, 1, 0.6705883, 0, 1,
-1.23735, -0.02453024, -1.048854, 1, 0.6784314, 0, 1,
-1.233697, 0.07172853, -2.923137, 1, 0.682353, 0, 1,
-1.227756, -1.295642, -1.350376, 1, 0.6901961, 0, 1,
-1.226535, -0.03467362, -1.313748, 1, 0.6941177, 0, 1,
-1.220439, 0.9045155, -0.01250998, 1, 0.7019608, 0, 1,
-1.218209, 1.06884, 0.1131665, 1, 0.7098039, 0, 1,
-1.211314, -0.136096, -3.191514, 1, 0.7137255, 0, 1,
-1.202245, -0.6442556, -1.727343, 1, 0.7215686, 0, 1,
-1.195483, -0.5856736, -4.184824, 1, 0.7254902, 0, 1,
-1.176153, -0.9428871, -2.355417, 1, 0.7333333, 0, 1,
-1.168462, 0.09835164, -2.973013, 1, 0.7372549, 0, 1,
-1.167286, -1.369965, -3.475793, 1, 0.7450981, 0, 1,
-1.166194, 0.6329094, -0.2845482, 1, 0.7490196, 0, 1,
-1.161095, 1.775127, 0.8251333, 1, 0.7568628, 0, 1,
-1.149669, 1.360751, -1.336727, 1, 0.7607843, 0, 1,
-1.147191, -0.6966971, -2.063211, 1, 0.7686275, 0, 1,
-1.145993, -0.562584, -2.836356, 1, 0.772549, 0, 1,
-1.138181, -2.229799, -2.194897, 1, 0.7803922, 0, 1,
-1.135286, -1.570288, -4.614887, 1, 0.7843137, 0, 1,
-1.134673, 1.555031, -0.4636834, 1, 0.7921569, 0, 1,
-1.133166, -0.2269645, -1.808454, 1, 0.7960784, 0, 1,
-1.120059, 0.5407599, -1.99193, 1, 0.8039216, 0, 1,
-1.112238, -0.1400682, -2.227805, 1, 0.8117647, 0, 1,
-1.108115, -0.3263134, -1.353482, 1, 0.8156863, 0, 1,
-1.102082, -0.2927768, -1.662452, 1, 0.8235294, 0, 1,
-1.101074, -1.788452, -3.879369, 1, 0.827451, 0, 1,
-1.096997, 0.3708968, 1.544502, 1, 0.8352941, 0, 1,
-1.094008, -0.8255855, -2.600919, 1, 0.8392157, 0, 1,
-1.093211, 0.8692979, -0.4029171, 1, 0.8470588, 0, 1,
-1.092476, -0.2513255, -3.123109, 1, 0.8509804, 0, 1,
-1.088017, 0.5119777, -0.9181607, 1, 0.8588235, 0, 1,
-1.085065, 1.725132, -1.561023, 1, 0.8627451, 0, 1,
-1.08408, 1.304955, -0.4408187, 1, 0.8705882, 0, 1,
-1.081593, 0.6004816, -0.56369, 1, 0.8745098, 0, 1,
-1.079941, 0.1458833, -1.616536, 1, 0.8823529, 0, 1,
-1.075583, 0.8626176, -1.324406, 1, 0.8862745, 0, 1,
-1.073205, 0.8940071, -1.486777, 1, 0.8941177, 0, 1,
-1.072953, -0.1234723, -1.225296, 1, 0.8980392, 0, 1,
-1.072587, 0.5028195, 0.2494678, 1, 0.9058824, 0, 1,
-1.068475, -0.2302695, -2.059556, 1, 0.9137255, 0, 1,
-1.068114, 0.7537524, -2.548682, 1, 0.9176471, 0, 1,
-1.064862, -0.03897871, -2.288303, 1, 0.9254902, 0, 1,
-1.059046, -0.9622145, -1.236111, 1, 0.9294118, 0, 1,
-1.054352, -1.073945, -2.555161, 1, 0.9372549, 0, 1,
-1.044896, -0.4192504, -1.528786, 1, 0.9411765, 0, 1,
-1.041013, 0.4602884, -0.5173832, 1, 0.9490196, 0, 1,
-1.034081, 1.013697, -2.339349, 1, 0.9529412, 0, 1,
-1.021717, 0.2804115, -1.532165, 1, 0.9607843, 0, 1,
-1.005117, 1.033571, -1.230294, 1, 0.9647059, 0, 1,
-0.9997163, -0.3703906, -3.286966, 1, 0.972549, 0, 1,
-0.9995652, 1.349376, 1.213786, 1, 0.9764706, 0, 1,
-0.9937894, -0.3767491, -3.239746, 1, 0.9843137, 0, 1,
-0.9853696, 1.641646, 1.412543, 1, 0.9882353, 0, 1,
-0.9836466, 1.713756, -0.02670322, 1, 0.9960784, 0, 1,
-0.9818435, 0.4716408, -1.607198, 0.9960784, 1, 0, 1,
-0.9787791, 0.1964268, -2.614019, 0.9921569, 1, 0, 1,
-0.9731566, -0.7217582, -1.95498, 0.9843137, 1, 0, 1,
-0.969228, -0.8825594, -1.925739, 0.9803922, 1, 0, 1,
-0.96805, 0.05804, -2.091472, 0.972549, 1, 0, 1,
-0.9668313, -0.5296623, -1.661795, 0.9686275, 1, 0, 1,
-0.9639435, -0.9342132, -1.799789, 0.9607843, 1, 0, 1,
-0.9621933, 0.7590984, -1.912932, 0.9568627, 1, 0, 1,
-0.955883, 2.431767, -1.642667, 0.9490196, 1, 0, 1,
-0.9501291, -0.3870526, -1.852373, 0.945098, 1, 0, 1,
-0.9500525, -0.8444092, -2.986098, 0.9372549, 1, 0, 1,
-0.9345723, 0.4888975, -1.522839, 0.9333333, 1, 0, 1,
-0.9267802, 0.9252932, 1.099095, 0.9254902, 1, 0, 1,
-0.9263241, -1.533046, -4.653719, 0.9215686, 1, 0, 1,
-0.9206066, -0.07312837, -1.943308, 0.9137255, 1, 0, 1,
-0.9143886, -1.279797, -1.021515, 0.9098039, 1, 0, 1,
-0.9096557, 2.17597, -0.5773346, 0.9019608, 1, 0, 1,
-0.9034428, 0.3495033, -1.755963, 0.8941177, 1, 0, 1,
-0.9032355, -0.795677, -2.885845, 0.8901961, 1, 0, 1,
-0.8979652, -0.2536511, -0.07662774, 0.8823529, 1, 0, 1,
-0.8978076, 0.9911209, 0.607235, 0.8784314, 1, 0, 1,
-0.895621, -1.114254, -2.885109, 0.8705882, 1, 0, 1,
-0.8916972, 1.099104, -1.71688, 0.8666667, 1, 0, 1,
-0.8907109, -0.8215973, -2.516964, 0.8588235, 1, 0, 1,
-0.8876113, 1.24843, -2.098973, 0.854902, 1, 0, 1,
-0.8870216, -0.374045, -2.659428, 0.8470588, 1, 0, 1,
-0.8855745, 0.6685773, -1.186585, 0.8431373, 1, 0, 1,
-0.8725025, 0.1542596, -1.803336, 0.8352941, 1, 0, 1,
-0.8721598, 0.7698237, -2.515499, 0.8313726, 1, 0, 1,
-0.8713734, -0.7603906, -1.65794, 0.8235294, 1, 0, 1,
-0.869864, -0.2274765, -2.207008, 0.8196079, 1, 0, 1,
-0.8697332, -0.3213096, -1.555925, 0.8117647, 1, 0, 1,
-0.8690434, -0.7204682, -2.842959, 0.8078431, 1, 0, 1,
-0.8686955, -0.6902346, -3.241201, 0.8, 1, 0, 1,
-0.8627041, -0.8658797, -3.091909, 0.7921569, 1, 0, 1,
-0.862221, -0.3511051, -2.795158, 0.7882353, 1, 0, 1,
-0.8507258, 0.7375657, -1.909801, 0.7803922, 1, 0, 1,
-0.8506723, 0.2641842, -0.268861, 0.7764706, 1, 0, 1,
-0.8469287, 0.2934021, -1.138809, 0.7686275, 1, 0, 1,
-0.8421577, -0.2068679, -1.707734, 0.7647059, 1, 0, 1,
-0.8399612, -0.07351375, -0.3865317, 0.7568628, 1, 0, 1,
-0.8354641, 2.043416, -0.5284247, 0.7529412, 1, 0, 1,
-0.8340538, 0.2653131, -0.1496784, 0.7450981, 1, 0, 1,
-0.8328208, 0.03452843, -2.160806, 0.7411765, 1, 0, 1,
-0.8205307, 0.0812848, -0.4211869, 0.7333333, 1, 0, 1,
-0.8202479, -0.8015533, -2.433872, 0.7294118, 1, 0, 1,
-0.8173788, 1.025999, -1.352789, 0.7215686, 1, 0, 1,
-0.8148863, -0.2169212, -3.175771, 0.7176471, 1, 0, 1,
-0.8108054, 0.6545355, 0.004384775, 0.7098039, 1, 0, 1,
-0.8087836, 0.5570487, -0.437147, 0.7058824, 1, 0, 1,
-0.798454, 1.246144, -0.9145256, 0.6980392, 1, 0, 1,
-0.7968771, -0.1299295, -1.895003, 0.6901961, 1, 0, 1,
-0.7946421, -0.2264698, -1.990198, 0.6862745, 1, 0, 1,
-0.7895185, 0.2813915, -1.381078, 0.6784314, 1, 0, 1,
-0.7885239, 0.9975486, -0.4024216, 0.6745098, 1, 0, 1,
-0.7834329, -0.6559869, -3.392913, 0.6666667, 1, 0, 1,
-0.7688449, 0.3059428, -2.039246, 0.6627451, 1, 0, 1,
-0.7599511, 1.174867, -0.4747934, 0.654902, 1, 0, 1,
-0.759573, 1.369814, -0.4382078, 0.6509804, 1, 0, 1,
-0.7581332, -0.9415246, -2.543679, 0.6431373, 1, 0, 1,
-0.7546965, -0.37913, -1.538243, 0.6392157, 1, 0, 1,
-0.7544321, 0.465442, -0.8683066, 0.6313726, 1, 0, 1,
-0.7544141, -0.08277629, -1.530728, 0.627451, 1, 0, 1,
-0.7533902, -0.07273737, -0.564687, 0.6196079, 1, 0, 1,
-0.7517424, -0.830923, -1.95155, 0.6156863, 1, 0, 1,
-0.7463243, 0.7787213, -0.5730432, 0.6078432, 1, 0, 1,
-0.7423691, -1.475421, -2.84228, 0.6039216, 1, 0, 1,
-0.7415265, 1.933924, -0.7702476, 0.5960785, 1, 0, 1,
-0.7330694, 2.180599, -1.51751, 0.5882353, 1, 0, 1,
-0.7329559, 1.203489, -0.04547433, 0.5843138, 1, 0, 1,
-0.7290382, -1.679478, -3.152941, 0.5764706, 1, 0, 1,
-0.7255837, -0.3416515, -3.166262, 0.572549, 1, 0, 1,
-0.7162213, -0.2711802, -1.774927, 0.5647059, 1, 0, 1,
-0.7130477, -1.926659, -2.680307, 0.5607843, 1, 0, 1,
-0.7113345, 0.1325668, -0.9122876, 0.5529412, 1, 0, 1,
-0.7088822, -0.2030436, -1.587093, 0.5490196, 1, 0, 1,
-0.7044216, 0.3328412, -0.8893718, 0.5411765, 1, 0, 1,
-0.7024329, -2.956925, -2.651747, 0.5372549, 1, 0, 1,
-0.7014074, 2.335853, -0.4447014, 0.5294118, 1, 0, 1,
-0.7011532, -0.8292047, -3.72775, 0.5254902, 1, 0, 1,
-0.6980059, -0.09607518, -1.90144, 0.5176471, 1, 0, 1,
-0.6936631, 0.16801, -1.347388, 0.5137255, 1, 0, 1,
-0.6897374, -0.3263501, -1.95182, 0.5058824, 1, 0, 1,
-0.6842126, 0.08994734, 0.7247804, 0.5019608, 1, 0, 1,
-0.6795135, 1.574259, -2.104865, 0.4941176, 1, 0, 1,
-0.6788849, -1.484805, -3.899653, 0.4862745, 1, 0, 1,
-0.6737549, 1.030227, -2.083485, 0.4823529, 1, 0, 1,
-0.6699659, 0.8656933, -2.986566, 0.4745098, 1, 0, 1,
-0.6687575, 0.6670516, -1.237904, 0.4705882, 1, 0, 1,
-0.6674663, -0.08953936, -1.286266, 0.4627451, 1, 0, 1,
-0.6602268, -1.434, -2.350189, 0.4588235, 1, 0, 1,
-0.6575566, 0.1148668, -2.241849, 0.4509804, 1, 0, 1,
-0.6517912, -0.9153586, -1.529912, 0.4470588, 1, 0, 1,
-0.6501931, -0.4137707, -3.02547, 0.4392157, 1, 0, 1,
-0.649949, -0.1188658, -1.919764, 0.4352941, 1, 0, 1,
-0.6492578, 0.6091396, -0.02853965, 0.427451, 1, 0, 1,
-0.6480722, -0.1567056, -1.847651, 0.4235294, 1, 0, 1,
-0.6462172, -0.5770213, -2.89067, 0.4156863, 1, 0, 1,
-0.6448326, 1.428035, -0.5711993, 0.4117647, 1, 0, 1,
-0.6406157, 1.728437, -0.2640287, 0.4039216, 1, 0, 1,
-0.6382774, 0.5284609, 0.1360825, 0.3960784, 1, 0, 1,
-0.6365047, -1.186037, -2.000791, 0.3921569, 1, 0, 1,
-0.6358685, 1.014012, 0.4584898, 0.3843137, 1, 0, 1,
-0.6345316, -0.1264191, -1.153042, 0.3803922, 1, 0, 1,
-0.6337108, 0.6442194, 0.2027978, 0.372549, 1, 0, 1,
-0.6336105, -1.733211, -4.72377, 0.3686275, 1, 0, 1,
-0.6314629, -0.991293, -3.945503, 0.3607843, 1, 0, 1,
-0.6262884, -2.343173, -3.473731, 0.3568628, 1, 0, 1,
-0.6251773, -1.545567, -2.582267, 0.3490196, 1, 0, 1,
-0.6245522, 1.033936, 0.7795512, 0.345098, 1, 0, 1,
-0.6194608, -0.5914283, -2.14842, 0.3372549, 1, 0, 1,
-0.6157753, 0.3306349, -0.8118357, 0.3333333, 1, 0, 1,
-0.6154228, 1.421356, 0.4676978, 0.3254902, 1, 0, 1,
-0.6036309, -0.91732, -1.970838, 0.3215686, 1, 0, 1,
-0.6003764, -0.8989332, -3.106318, 0.3137255, 1, 0, 1,
-0.5926212, 2.013295, 0.4008529, 0.3098039, 1, 0, 1,
-0.5922688, 1.705312, 0.3833515, 0.3019608, 1, 0, 1,
-0.586663, 0.7754939, -0.1233208, 0.2941177, 1, 0, 1,
-0.5840718, 2.020184, 0.6715562, 0.2901961, 1, 0, 1,
-0.5823126, 0.02894168, -1.25897, 0.282353, 1, 0, 1,
-0.5695053, 0.02258281, -2.428129, 0.2784314, 1, 0, 1,
-0.566337, -0.008484564, -2.306597, 0.2705882, 1, 0, 1,
-0.5631852, -0.02759344, -1.26685, 0.2666667, 1, 0, 1,
-0.5572776, -1.652788, -1.947129, 0.2588235, 1, 0, 1,
-0.5524474, 0.5693344, -0.8584622, 0.254902, 1, 0, 1,
-0.5502264, 0.7421869, -0.8964007, 0.2470588, 1, 0, 1,
-0.5448837, -0.7757276, -2.628686, 0.2431373, 1, 0, 1,
-0.5446197, -0.5020267, -2.086743, 0.2352941, 1, 0, 1,
-0.5416045, -0.1722353, 0.1363898, 0.2313726, 1, 0, 1,
-0.5413994, -0.6842234, -6.229878, 0.2235294, 1, 0, 1,
-0.5372713, -0.7626049, -2.187864, 0.2196078, 1, 0, 1,
-0.5324147, 0.4346489, -0.2132527, 0.2117647, 1, 0, 1,
-0.5310906, -0.3728862, -2.54449, 0.2078431, 1, 0, 1,
-0.5276013, -0.9000791, -3.221682, 0.2, 1, 0, 1,
-0.527002, -1.977458, -2.255697, 0.1921569, 1, 0, 1,
-0.5269622, -0.7733285, -2.654585, 0.1882353, 1, 0, 1,
-0.5241816, -0.6033394, -2.92489, 0.1803922, 1, 0, 1,
-0.520157, 0.6968592, 0.6344691, 0.1764706, 1, 0, 1,
-0.5186145, 2.109526, -0.3582253, 0.1686275, 1, 0, 1,
-0.5148208, -0.01452026, -1.028328, 0.1647059, 1, 0, 1,
-0.510713, 1.531647, -1.180817, 0.1568628, 1, 0, 1,
-0.5104383, -0.2980465, -2.274912, 0.1529412, 1, 0, 1,
-0.5007306, 0.4375793, -2.607686, 0.145098, 1, 0, 1,
-0.4997948, -2.14896, -4.201803, 0.1411765, 1, 0, 1,
-0.4979912, 0.02896051, -0.8287795, 0.1333333, 1, 0, 1,
-0.4941697, 0.1442843, -0.1840702, 0.1294118, 1, 0, 1,
-0.4896175, -1.247184, -2.799021, 0.1215686, 1, 0, 1,
-0.4871857, 0.8777528, -1.0626, 0.1176471, 1, 0, 1,
-0.4857315, 1.614215, -0.1461125, 0.1098039, 1, 0, 1,
-0.4853802, 1.088332, -1.221484, 0.1058824, 1, 0, 1,
-0.4836572, 1.671519, -1.444792, 0.09803922, 1, 0, 1,
-0.4834506, 0.5666823, -1.041503, 0.09019608, 1, 0, 1,
-0.4823537, 0.558903, -0.4187742, 0.08627451, 1, 0, 1,
-0.4808758, 0.07203931, -1.187299, 0.07843138, 1, 0, 1,
-0.4799385, 0.4177198, -1.011434, 0.07450981, 1, 0, 1,
-0.4789677, -0.2733544, -1.799918, 0.06666667, 1, 0, 1,
-0.4699715, 1.472994, 0.4227618, 0.0627451, 1, 0, 1,
-0.4592868, 0.4310955, -0.6307892, 0.05490196, 1, 0, 1,
-0.4543315, 1.129364, -0.398297, 0.05098039, 1, 0, 1,
-0.4509751, -1.237693, -1.324598, 0.04313726, 1, 0, 1,
-0.4505807, -0.3506448, -1.054006, 0.03921569, 1, 0, 1,
-0.4442531, -2.053053, -3.218946, 0.03137255, 1, 0, 1,
-0.4422885, 2.432078, 1.436209, 0.02745098, 1, 0, 1,
-0.4388396, -1.745411, -1.484162, 0.01960784, 1, 0, 1,
-0.4388037, 1.583622, 0.4634942, 0.01568628, 1, 0, 1,
-0.438058, -0.6577293, -3.024469, 0.007843138, 1, 0, 1,
-0.4368016, 0.2457149, 0.9045646, 0.003921569, 1, 0, 1,
-0.434871, -0.3994543, -2.844608, 0, 1, 0.003921569, 1,
-0.4347414, -0.98443, -2.8558, 0, 1, 0.01176471, 1,
-0.4326667, -0.4420585, -3.10949, 0, 1, 0.01568628, 1,
-0.4318805, 0.7897323, -1.132737, 0, 1, 0.02352941, 1,
-0.4257842, 0.08183304, -3.06205, 0, 1, 0.02745098, 1,
-0.4249589, -0.02472527, -1.69768, 0, 1, 0.03529412, 1,
-0.4227917, -0.07904196, -0.659034, 0, 1, 0.03921569, 1,
-0.4184743, -0.4855418, -1.303958, 0, 1, 0.04705882, 1,
-0.4164767, -0.1795142, -1.587059, 0, 1, 0.05098039, 1,
-0.4162456, 1.493744, -1.635835, 0, 1, 0.05882353, 1,
-0.4143643, -0.7024139, -2.308011, 0, 1, 0.0627451, 1,
-0.4139464, -0.9990707, -2.732238, 0, 1, 0.07058824, 1,
-0.4113052, 2.019376, -0.5031536, 0, 1, 0.07450981, 1,
-0.4110318, -0.9419364, -4.440056, 0, 1, 0.08235294, 1,
-0.4062921, 1.728132, 1.051247, 0, 1, 0.08627451, 1,
-0.4001838, -0.3168116, -3.459895, 0, 1, 0.09411765, 1,
-0.3978932, 0.8350279, -1.286937, 0, 1, 0.1019608, 1,
-0.3968593, 0.006362854, -1.467665, 0, 1, 0.1058824, 1,
-0.395341, -0.5318976, -2.037003, 0, 1, 0.1137255, 1,
-0.3917564, -0.1271849, -2.831993, 0, 1, 0.1176471, 1,
-0.3889627, 0.4933889, 0.3780977, 0, 1, 0.1254902, 1,
-0.3857163, -0.3903983, -1.245914, 0, 1, 0.1294118, 1,
-0.3852895, 0.377795, -1.055738, 0, 1, 0.1372549, 1,
-0.3781744, -0.9898227, -4.905631, 0, 1, 0.1411765, 1,
-0.3776873, 0.6097039, -0.1325623, 0, 1, 0.1490196, 1,
-0.3741983, -1.008406, -3.8166, 0, 1, 0.1529412, 1,
-0.3725961, -0.5865912, -1.988466, 0, 1, 0.1607843, 1,
-0.3715307, -0.3288085, -1.963836, 0, 1, 0.1647059, 1,
-0.3674399, -0.311324, -1.822604, 0, 1, 0.172549, 1,
-0.3649397, -0.1121276, -4.222114, 0, 1, 0.1764706, 1,
-0.3641671, -1.301503, -2.989155, 0, 1, 0.1843137, 1,
-0.3632853, 1.048744, -0.4573377, 0, 1, 0.1882353, 1,
-0.3566097, -0.4721383, -2.880132, 0, 1, 0.1960784, 1,
-0.3565562, -0.4047564, -0.356109, 0, 1, 0.2039216, 1,
-0.355679, 0.08607254, -2.126966, 0, 1, 0.2078431, 1,
-0.3540703, -1.537368, -3.395396, 0, 1, 0.2156863, 1,
-0.353735, -0.3309672, -0.9873019, 0, 1, 0.2196078, 1,
-0.3508832, 0.02847861, -1.276, 0, 1, 0.227451, 1,
-0.3504915, 0.1919179, -0.1712433, 0, 1, 0.2313726, 1,
-0.3409398, 0.7588593, -0.4741367, 0, 1, 0.2392157, 1,
-0.3376625, 0.3607802, 0.4955861, 0, 1, 0.2431373, 1,
-0.3337225, -1.646906, -3.219762, 0, 1, 0.2509804, 1,
-0.3330541, -0.652591, -2.071488, 0, 1, 0.254902, 1,
-0.3259932, -0.6558357, -0.452444, 0, 1, 0.2627451, 1,
-0.3231667, -0.5791268, -2.041872, 0, 1, 0.2666667, 1,
-0.3218207, 1.679556, -0.2219725, 0, 1, 0.2745098, 1,
-0.3139885, 0.864438, 0.693059, 0, 1, 0.2784314, 1,
-0.3096775, -0.5814441, -3.393624, 0, 1, 0.2862745, 1,
-0.3042281, 1.378855, 0.3398627, 0, 1, 0.2901961, 1,
-0.3040109, -0.1754053, -3.578124, 0, 1, 0.2980392, 1,
-0.3036273, -0.03496379, -1.112957, 0, 1, 0.3058824, 1,
-0.299671, 0.1861603, -1.918613, 0, 1, 0.3098039, 1,
-0.2902569, 0.5999043, 2.058278, 0, 1, 0.3176471, 1,
-0.2889847, 1.513896, -0.6036318, 0, 1, 0.3215686, 1,
-0.2871007, 0.6116305, 0.2286342, 0, 1, 0.3294118, 1,
-0.2840793, 0.1075487, -1.522773, 0, 1, 0.3333333, 1,
-0.2773169, -0.6594995, -2.996759, 0, 1, 0.3411765, 1,
-0.2758647, 0.4863852, -1.711473, 0, 1, 0.345098, 1,
-0.2708461, 0.2015502, -1.968334, 0, 1, 0.3529412, 1,
-0.2693368, 1.677525, 0.7808111, 0, 1, 0.3568628, 1,
-0.2686231, 0.2280731, -1.552037, 0, 1, 0.3647059, 1,
-0.2665772, -0.5631171, -0.9960054, 0, 1, 0.3686275, 1,
-0.2660654, 0.4293248, -2.970884, 0, 1, 0.3764706, 1,
-0.265709, 0.4613079, 0.03752388, 0, 1, 0.3803922, 1,
-0.2638286, 1.715634, 1.443867, 0, 1, 0.3882353, 1,
-0.2614424, -0.7848964, -4.735882, 0, 1, 0.3921569, 1,
-0.259648, 1.139756, -0.8657722, 0, 1, 0.4, 1,
-0.2593665, 2.138725, -1.383789, 0, 1, 0.4078431, 1,
-0.2565228, -0.8459466, -2.772463, 0, 1, 0.4117647, 1,
-0.256416, 0.03701517, -2.303604, 0, 1, 0.4196078, 1,
-0.2561091, 0.5676383, -1.551807, 0, 1, 0.4235294, 1,
-0.2557448, -0.3519481, -1.584536, 0, 1, 0.4313726, 1,
-0.2527637, 0.3231849, -0.5642098, 0, 1, 0.4352941, 1,
-0.24202, -2.128911, -0.7501253, 0, 1, 0.4431373, 1,
-0.2395386, 0.9083326, -0.3380373, 0, 1, 0.4470588, 1,
-0.2385395, -0.5254208, -2.578129, 0, 1, 0.454902, 1,
-0.2314327, 0.3700343, 1.169732, 0, 1, 0.4588235, 1,
-0.2289145, -0.9189797, -3.119538, 0, 1, 0.4666667, 1,
-0.2277519, 0.2688919, -0.6598874, 0, 1, 0.4705882, 1,
-0.2263756, 0.7899368, -0.133561, 0, 1, 0.4784314, 1,
-0.2195951, 2.155345, -0.3396336, 0, 1, 0.4823529, 1,
-0.2106915, -0.5196344, -1.409454, 0, 1, 0.4901961, 1,
-0.2094206, 0.1499818, -1.496496, 0, 1, 0.4941176, 1,
-0.2092876, -0.1435992, -1.978612, 0, 1, 0.5019608, 1,
-0.2086885, 0.2960599, -2.96462, 0, 1, 0.509804, 1,
-0.2058275, -0.179876, -1.335209, 0, 1, 0.5137255, 1,
-0.2053975, 0.6352733, -0.2083721, 0, 1, 0.5215687, 1,
-0.2030477, 1.68005, -1.942717, 0, 1, 0.5254902, 1,
-0.2030097, 0.2211995, -0.27014, 0, 1, 0.5333334, 1,
-0.1958257, 0.9989074, -0.2287509, 0, 1, 0.5372549, 1,
-0.1948062, 1.559521, -2.841949, 0, 1, 0.5450981, 1,
-0.1924294, 0.6357194, -1.803751, 0, 1, 0.5490196, 1,
-0.18764, 0.2062599, -1.6915, 0, 1, 0.5568628, 1,
-0.1836853, -1.346243, -1.422162, 0, 1, 0.5607843, 1,
-0.1818187, 0.1932102, 0.7500445, 0, 1, 0.5686275, 1,
-0.1812401, 0.009649737, -2.609139, 0, 1, 0.572549, 1,
-0.1745035, 0.1099548, -0.8415415, 0, 1, 0.5803922, 1,
-0.1731069, -0.6744076, -3.017795, 0, 1, 0.5843138, 1,
-0.170165, 1.716254, 0.6913067, 0, 1, 0.5921569, 1,
-0.1673353, -1.180562, -2.594167, 0, 1, 0.5960785, 1,
-0.163444, -0.3800081, -3.429743, 0, 1, 0.6039216, 1,
-0.1623347, 0.2543575, -1.477203, 0, 1, 0.6117647, 1,
-0.1596318, 0.7650368, 0.2976248, 0, 1, 0.6156863, 1,
-0.157615, -0.3334845, -3.629354, 0, 1, 0.6235294, 1,
-0.1548301, 1.360977, -0.2685116, 0, 1, 0.627451, 1,
-0.1542598, 0.04583888, -0.785774, 0, 1, 0.6352941, 1,
-0.1519744, -0.5797313, -2.837651, 0, 1, 0.6392157, 1,
-0.142507, 0.3013909, -2.668782, 0, 1, 0.6470588, 1,
-0.1377869, -1.777536, -3.218297, 0, 1, 0.6509804, 1,
-0.1326539, 0.5178802, -0.2335823, 0, 1, 0.6588235, 1,
-0.1325757, -1.505646, -4.77601, 0, 1, 0.6627451, 1,
-0.1314762, -1.142057, -2.969569, 0, 1, 0.6705883, 1,
-0.1303114, 0.7520173, -1.373837, 0, 1, 0.6745098, 1,
-0.1301463, -0.7051094, -3.654976, 0, 1, 0.682353, 1,
-0.1291697, -1.117545, -2.934039, 0, 1, 0.6862745, 1,
-0.1251816, 2.068952, -1.6751, 0, 1, 0.6941177, 1,
-0.1235384, -0.9008103, -4.174319, 0, 1, 0.7019608, 1,
-0.1215395, 0.4462268, -0.5223463, 0, 1, 0.7058824, 1,
-0.1212037, 2.561161, -0.2904406, 0, 1, 0.7137255, 1,
-0.1208008, -0.0003497353, -0.9083749, 0, 1, 0.7176471, 1,
-0.1198499, 0.8248308, 0.6393706, 0, 1, 0.7254902, 1,
-0.1184667, -0.03398535, -2.456141, 0, 1, 0.7294118, 1,
-0.1175792, -0.4410478, -2.708938, 0, 1, 0.7372549, 1,
-0.1150239, 0.9333885, -0.1938174, 0, 1, 0.7411765, 1,
-0.1145716, -2.069786, -3.405667, 0, 1, 0.7490196, 1,
-0.1129869, -0.7194977, -2.952473, 0, 1, 0.7529412, 1,
-0.1095711, -1.787481, -2.979311, 0, 1, 0.7607843, 1,
-0.09906602, -1.427729, -2.755518, 0, 1, 0.7647059, 1,
-0.09740134, 0.00490074, -0.1641822, 0, 1, 0.772549, 1,
-0.09314607, -0.325055, -2.272989, 0, 1, 0.7764706, 1,
-0.09116473, 1.51435, 0.3663163, 0, 1, 0.7843137, 1,
-0.08939495, 0.6454355, -0.1096577, 0, 1, 0.7882353, 1,
-0.0882292, 0.249716, 0.2175044, 0, 1, 0.7960784, 1,
-0.08513414, 0.2147873, -0.7297097, 0, 1, 0.8039216, 1,
-0.08352803, 0.5894377, -0.8540983, 0, 1, 0.8078431, 1,
-0.08202596, 0.6738759, 0.4045455, 0, 1, 0.8156863, 1,
-0.08042134, 0.7207205, 0.460538, 0, 1, 0.8196079, 1,
-0.07313298, -1.695424, -2.299394, 0, 1, 0.827451, 1,
-0.07294548, -0.7963281, -2.648228, 0, 1, 0.8313726, 1,
-0.07236619, 1.269027, -0.06077639, 0, 1, 0.8392157, 1,
-0.07141558, 0.7799067, -0.1775757, 0, 1, 0.8431373, 1,
-0.06927816, 0.8481995, 0.6209557, 0, 1, 0.8509804, 1,
-0.06704643, -1.728473, -3.447872, 0, 1, 0.854902, 1,
-0.06459707, -0.5136296, -1.465864, 0, 1, 0.8627451, 1,
-0.06161001, -0.4412796, -3.055741, 0, 1, 0.8666667, 1,
-0.04949554, 0.09991214, 0.0232509, 0, 1, 0.8745098, 1,
-0.04827744, -0.1596233, -3.289893, 0, 1, 0.8784314, 1,
-0.04559113, -1.626715, -3.485522, 0, 1, 0.8862745, 1,
-0.04440639, -0.5712848, -3.295485, 0, 1, 0.8901961, 1,
-0.03976659, 0.5123664, -1.185486, 0, 1, 0.8980392, 1,
-0.03801249, -0.4433437, -2.968328, 0, 1, 0.9058824, 1,
-0.03627714, -1.594248, -2.559982, 0, 1, 0.9098039, 1,
-0.03542725, 0.1996631, -0.7316372, 0, 1, 0.9176471, 1,
-0.0349903, 0.7892976, 2.051423, 0, 1, 0.9215686, 1,
-0.03366225, 0.6508985, 0.2275662, 0, 1, 0.9294118, 1,
-0.0303524, 0.9076594, -2.158821, 0, 1, 0.9333333, 1,
-0.02885894, 0.8949697, -0.2075048, 0, 1, 0.9411765, 1,
-0.02816778, 0.9606248, 0.4699913, 0, 1, 0.945098, 1,
-0.02072, 0.9187233, -1.847474, 0, 1, 0.9529412, 1,
-0.01783752, 1.026688, -1.214418, 0, 1, 0.9568627, 1,
-0.01620494, 0.2107607, -0.52957, 0, 1, 0.9647059, 1,
-0.01502184, 0.1912274, -0.1041909, 0, 1, 0.9686275, 1,
-0.01434842, -0.1186842, -2.967312, 0, 1, 0.9764706, 1,
-0.01334276, -1.383947, -2.980793, 0, 1, 0.9803922, 1,
-0.01291874, 0.2047978, 0.1250503, 0, 1, 0.9882353, 1,
-0.01055763, -0.9574216, -4.612214, 0, 1, 0.9921569, 1,
-0.009393711, -0.7926767, -1.86542, 0, 1, 1, 1,
-0.007525082, -0.2020064, -3.446133, 0, 0.9921569, 1, 1,
0.006519404, 0.9143798, 0.519403, 0, 0.9882353, 1, 1,
0.01046011, 0.6247065, 1.125365, 0, 0.9803922, 1, 1,
0.0125338, 0.8002445, -0.1672597, 0, 0.9764706, 1, 1,
0.01812712, 2.092338, 0.8639684, 0, 0.9686275, 1, 1,
0.02423562, -0.4914402, 1.382591, 0, 0.9647059, 1, 1,
0.02540551, -0.4830013, 2.157378, 0, 0.9568627, 1, 1,
0.02746842, -0.02004066, -0.4407778, 0, 0.9529412, 1, 1,
0.02834463, 2.587421, -1.222254, 0, 0.945098, 1, 1,
0.02883692, -0.5690342, 4.59389, 0, 0.9411765, 1, 1,
0.03129644, 0.7450069, 0.08104914, 0, 0.9333333, 1, 1,
0.0323932, -1.780562, 4.116949, 0, 0.9294118, 1, 1,
0.03709373, -0.04911529, 1.430126, 0, 0.9215686, 1, 1,
0.0391341, -1.349059, 2.391719, 0, 0.9176471, 1, 1,
0.04183763, -0.4341235, 2.396836, 0, 0.9098039, 1, 1,
0.04239439, 0.8426494, 0.6744738, 0, 0.9058824, 1, 1,
0.04480292, 1.713457, 0.1704845, 0, 0.8980392, 1, 1,
0.04498587, -0.9006261, 2.558794, 0, 0.8901961, 1, 1,
0.04643061, 1.952482, -0.3417746, 0, 0.8862745, 1, 1,
0.0476331, 0.5186848, -0.2754942, 0, 0.8784314, 1, 1,
0.04822075, 0.7082331, -0.002365095, 0, 0.8745098, 1, 1,
0.05226765, 0.505405, 0.4599539, 0, 0.8666667, 1, 1,
0.0524714, -1.345791, 2.606197, 0, 0.8627451, 1, 1,
0.05490386, 1.549786, 1.132536, 0, 0.854902, 1, 1,
0.05748899, 1.111631, -1.110198, 0, 0.8509804, 1, 1,
0.0605041, -1.327409, 1.822653, 0, 0.8431373, 1, 1,
0.06399152, 0.1241843, -0.6290346, 0, 0.8392157, 1, 1,
0.06672913, -1.410046, 4.303016, 0, 0.8313726, 1, 1,
0.06923457, -0.2408216, 4.580135, 0, 0.827451, 1, 1,
0.07039629, -1.388685, 2.790743, 0, 0.8196079, 1, 1,
0.07327834, -0.6328697, 1.222036, 0, 0.8156863, 1, 1,
0.07350682, 0.08908904, 2.065953, 0, 0.8078431, 1, 1,
0.07484891, -1.414213, 2.460056, 0, 0.8039216, 1, 1,
0.0765208, -0.4176371, 2.316832, 0, 0.7960784, 1, 1,
0.07744538, 0.5014001, 0.2419852, 0, 0.7882353, 1, 1,
0.08508597, 0.2148831, 0.6390158, 0, 0.7843137, 1, 1,
0.08557758, 0.08994267, -0.7271987, 0, 0.7764706, 1, 1,
0.08652875, -0.2315564, 3.307503, 0, 0.772549, 1, 1,
0.0919231, -0.3668732, 4.340352, 0, 0.7647059, 1, 1,
0.09868953, 0.8969226, 0.8767993, 0, 0.7607843, 1, 1,
0.09953023, 1.90804, 0.1155739, 0, 0.7529412, 1, 1,
0.1000386, -1.719252, 5.681701, 0, 0.7490196, 1, 1,
0.1037602, 0.801807, -0.02637141, 0, 0.7411765, 1, 1,
0.1053862, -1.011748, 2.506695, 0, 0.7372549, 1, 1,
0.1062021, -0.1095856, 2.178357, 0, 0.7294118, 1, 1,
0.1092385, -0.6558455, 3.551648, 0, 0.7254902, 1, 1,
0.111307, -0.2945285, 2.067379, 0, 0.7176471, 1, 1,
0.1118514, -0.3305411, 2.097355, 0, 0.7137255, 1, 1,
0.1119044, 0.3263194, 0.2080288, 0, 0.7058824, 1, 1,
0.1134896, 0.8028398, 0.6355758, 0, 0.6980392, 1, 1,
0.119544, -0.3048494, 3.382119, 0, 0.6941177, 1, 1,
0.1198538, 1.188727, 0.6619608, 0, 0.6862745, 1, 1,
0.1213773, -0.4841483, 3.785122, 0, 0.682353, 1, 1,
0.124567, 0.6245979, -0.8437945, 0, 0.6745098, 1, 1,
0.1336839, -0.09497232, 4.034145, 0, 0.6705883, 1, 1,
0.1453698, 0.1455435, 2.951682, 0, 0.6627451, 1, 1,
0.1454237, -0.005196697, 1.698142, 0, 0.6588235, 1, 1,
0.1498422, 0.5669957, 0.6288946, 0, 0.6509804, 1, 1,
0.1551879, 1.456426, -0.3804961, 0, 0.6470588, 1, 1,
0.1578082, -0.0631339, 2.981287, 0, 0.6392157, 1, 1,
0.1605644, -1.467667, 2.851421, 0, 0.6352941, 1, 1,
0.1607361, -0.2618568, 3.389544, 0, 0.627451, 1, 1,
0.1616327, 0.8614518, 1.064465, 0, 0.6235294, 1, 1,
0.1659245, 0.9531155, 0.9878709, 0, 0.6156863, 1, 1,
0.1716641, -2.000203, 2.943732, 0, 0.6117647, 1, 1,
0.1731202, 0.9309982, -0.7869688, 0, 0.6039216, 1, 1,
0.1776519, -0.2201407, 2.930978, 0, 0.5960785, 1, 1,
0.1827426, -0.9476563, 1.755305, 0, 0.5921569, 1, 1,
0.185131, -0.08573526, 1.748981, 0, 0.5843138, 1, 1,
0.1868818, 0.355902, 2.516063, 0, 0.5803922, 1, 1,
0.1918315, 1.568714, -1.019445, 0, 0.572549, 1, 1,
0.1970155, -1.312408, 1.528359, 0, 0.5686275, 1, 1,
0.1975397, 0.1058947, 1.193133, 0, 0.5607843, 1, 1,
0.1992272, 2.061227, 0.06450534, 0, 0.5568628, 1, 1,
0.2004682, 0.8773666, 0.6155257, 0, 0.5490196, 1, 1,
0.204968, 0.2491262, 0.3463202, 0, 0.5450981, 1, 1,
0.2055077, 1.167329, -0.6214844, 0, 0.5372549, 1, 1,
0.2076787, 0.8671207, 0.5984548, 0, 0.5333334, 1, 1,
0.2117174, 1.497231, 1.496594, 0, 0.5254902, 1, 1,
0.2117633, -0.5835979, 3.053407, 0, 0.5215687, 1, 1,
0.2122103, 0.4436075, 0.4438471, 0, 0.5137255, 1, 1,
0.2126559, -0.6905299, 2.064938, 0, 0.509804, 1, 1,
0.2208781, 0.1682736, 1.853471, 0, 0.5019608, 1, 1,
0.2248319, -0.1698555, 1.143523, 0, 0.4941176, 1, 1,
0.2276944, 1.437222, 1.31388, 0, 0.4901961, 1, 1,
0.2311249, -0.4370697, 2.049964, 0, 0.4823529, 1, 1,
0.2315543, 0.6138423, -0.9731976, 0, 0.4784314, 1, 1,
0.2421276, -0.493269, 1.560732, 0, 0.4705882, 1, 1,
0.2444334, 0.0929507, -1.022354, 0, 0.4666667, 1, 1,
0.2483456, -1.219118, 4.276079, 0, 0.4588235, 1, 1,
0.2487861, 1.083488, 0.4316012, 0, 0.454902, 1, 1,
0.251843, -0.1459814, 3.512904, 0, 0.4470588, 1, 1,
0.2526926, -0.3206376, 2.744372, 0, 0.4431373, 1, 1,
0.2528087, -0.9648129, 3.079358, 0, 0.4352941, 1, 1,
0.2573854, 0.4968773, 1.39705, 0, 0.4313726, 1, 1,
0.2622074, -0.09451049, 1.468735, 0, 0.4235294, 1, 1,
0.2628727, -1.544271, 2.117827, 0, 0.4196078, 1, 1,
0.2700938, -1.49677, 3.361512, 0, 0.4117647, 1, 1,
0.2772678, 1.956524, 0.2817058, 0, 0.4078431, 1, 1,
0.2774915, -0.2187741, 1.873499, 0, 0.4, 1, 1,
0.2775874, 2.35891, 1.299628, 0, 0.3921569, 1, 1,
0.2805688, 1.165411, -0.1490743, 0, 0.3882353, 1, 1,
0.281173, -0.5802372, 2.508128, 0, 0.3803922, 1, 1,
0.2842398, 0.1307267, 0.6905776, 0, 0.3764706, 1, 1,
0.2848474, 0.8228755, -0.5745677, 0, 0.3686275, 1, 1,
0.2867502, -2.357343, 2.584138, 0, 0.3647059, 1, 1,
0.2876647, -1.630514, 2.76991, 0, 0.3568628, 1, 1,
0.2905208, 0.0998966, 1.963791, 0, 0.3529412, 1, 1,
0.2907429, -0.2556464, 1.60903, 0, 0.345098, 1, 1,
0.2968095, 0.7427939, -0.8283828, 0, 0.3411765, 1, 1,
0.3028758, 0.2064216, 0.9610115, 0, 0.3333333, 1, 1,
0.3056374, -1.811714, 1.957038, 0, 0.3294118, 1, 1,
0.3056929, -1.422048, 2.459056, 0, 0.3215686, 1, 1,
0.3126303, -0.4543482, 1.797531, 0, 0.3176471, 1, 1,
0.3175388, -0.8975323, 3.277341, 0, 0.3098039, 1, 1,
0.3181233, 2.081512, -0.1703857, 0, 0.3058824, 1, 1,
0.3203421, -0.3071548, 0.4801171, 0, 0.2980392, 1, 1,
0.3207205, 1.4504, 1.099617, 0, 0.2901961, 1, 1,
0.3228253, -0.8802097, 3.656435, 0, 0.2862745, 1, 1,
0.3266707, -1.100288, 4.16106, 0, 0.2784314, 1, 1,
0.3300616, 0.9708531, -0.7962124, 0, 0.2745098, 1, 1,
0.3345953, 1.046445, -0.2096032, 0, 0.2666667, 1, 1,
0.3397177, 0.2238665, -0.318958, 0, 0.2627451, 1, 1,
0.3414392, -0.02737468, 1.501176, 0, 0.254902, 1, 1,
0.3436595, -0.544636, 3.243783, 0, 0.2509804, 1, 1,
0.3458445, -0.438008, 2.495928, 0, 0.2431373, 1, 1,
0.3464677, -0.9599981, 1.876242, 0, 0.2392157, 1, 1,
0.3496366, -0.5789896, 1.334244, 0, 0.2313726, 1, 1,
0.3523865, -1.522469, 4.67803, 0, 0.227451, 1, 1,
0.3528064, 0.4866208, 0.8443784, 0, 0.2196078, 1, 1,
0.3540176, 1.727381, -0.734573, 0, 0.2156863, 1, 1,
0.3575271, -0.1516075, 3.939188, 0, 0.2078431, 1, 1,
0.365583, 0.642403, -0.05807232, 0, 0.2039216, 1, 1,
0.3669982, 0.146629, 3.234186, 0, 0.1960784, 1, 1,
0.3698423, 0.6084101, 0.2396167, 0, 0.1882353, 1, 1,
0.37466, -0.01137513, 1.434414, 0, 0.1843137, 1, 1,
0.3772182, -0.7110106, 2.101429, 0, 0.1764706, 1, 1,
0.3792004, -1.241445, 1.909213, 0, 0.172549, 1, 1,
0.3795497, 0.2399177, 1.061489, 0, 0.1647059, 1, 1,
0.3819424, -0.8101876, 2.796106, 0, 0.1607843, 1, 1,
0.3823633, 2.062277, 3.112165, 0, 0.1529412, 1, 1,
0.3839005, 1.630119, -0.4010157, 0, 0.1490196, 1, 1,
0.3845196, -0.07919466, 1.222532, 0, 0.1411765, 1, 1,
0.3877275, 1.86528, -0.4412593, 0, 0.1372549, 1, 1,
0.3889213, -0.7181174, 1.826748, 0, 0.1294118, 1, 1,
0.3942661, 1.081804, -0.6478325, 0, 0.1254902, 1, 1,
0.3943307, -1.100697, 2.460728, 0, 0.1176471, 1, 1,
0.3952128, 0.7912593, -1.785249, 0, 0.1137255, 1, 1,
0.3980584, -0.894898, 2.61216, 0, 0.1058824, 1, 1,
0.3982208, 1.402184, -0.6357895, 0, 0.09803922, 1, 1,
0.3993689, 1.685609, 0.3594498, 0, 0.09411765, 1, 1,
0.4009205, 0.4056005, 1.28362, 0, 0.08627451, 1, 1,
0.4010286, 0.9458386, -1.430909, 0, 0.08235294, 1, 1,
0.4015711, 0.4326234, 1.841103, 0, 0.07450981, 1, 1,
0.4035831, 0.01088673, 1.501747, 0, 0.07058824, 1, 1,
0.4055959, 0.5606508, -0.6579513, 0, 0.0627451, 1, 1,
0.4069657, -0.01554981, 3.106756, 0, 0.05882353, 1, 1,
0.4069912, 0.9058505, 0.4940268, 0, 0.05098039, 1, 1,
0.4074788, -0.668286, 2.710636, 0, 0.04705882, 1, 1,
0.4091042, 0.9779375, 0.1657709, 0, 0.03921569, 1, 1,
0.4119579, 0.07137997, 1.683868, 0, 0.03529412, 1, 1,
0.412058, -0.01549562, 0.6150877, 0, 0.02745098, 1, 1,
0.4141941, -2.844028, 4.14059, 0, 0.02352941, 1, 1,
0.4204375, 1.537728, 1.075877, 0, 0.01568628, 1, 1,
0.4362983, -1.141994, 2.017253, 0, 0.01176471, 1, 1,
0.4366998, 0.09399293, 0.9032941, 0, 0.003921569, 1, 1,
0.4400144, 1.776183, 0.8545989, 0.003921569, 0, 1, 1,
0.4420432, -0.7970608, 1.861562, 0.007843138, 0, 1, 1,
0.442174, 0.4956368, 0.9456877, 0.01568628, 0, 1, 1,
0.4437727, 0.3329362, -0.9583086, 0.01960784, 0, 1, 1,
0.445987, -0.6391999, 0.8796787, 0.02745098, 0, 1, 1,
0.446208, 1.329826, 0.09076755, 0.03137255, 0, 1, 1,
0.4481131, -0.6011093, 1.509338, 0.03921569, 0, 1, 1,
0.4510747, -0.5957639, 3.449644, 0.04313726, 0, 1, 1,
0.4522657, -0.5080069, 2.464683, 0.05098039, 0, 1, 1,
0.4538491, 0.5399577, 2.857086, 0.05490196, 0, 1, 1,
0.4573402, 1.587104, 0.5059769, 0.0627451, 0, 1, 1,
0.4618599, 0.5094593, 2.272383, 0.06666667, 0, 1, 1,
0.4693852, 0.2052106, 0.3671435, 0.07450981, 0, 1, 1,
0.4779423, 0.1925899, -1.098568, 0.07843138, 0, 1, 1,
0.4800447, -2.294636, 3.944977, 0.08627451, 0, 1, 1,
0.4805064, 0.1678365, 2.297052, 0.09019608, 0, 1, 1,
0.4857189, 0.1671823, 0.1237504, 0.09803922, 0, 1, 1,
0.4889441, 0.830714, 0.7062406, 0.1058824, 0, 1, 1,
0.4986174, 0.6372703, 0.8433489, 0.1098039, 0, 1, 1,
0.4986795, -0.2775681, 3.218821, 0.1176471, 0, 1, 1,
0.4998171, -0.4958795, 3.111013, 0.1215686, 0, 1, 1,
0.5002695, 0.2450247, 2.556198, 0.1294118, 0, 1, 1,
0.5064084, -0.3112734, 1.894581, 0.1333333, 0, 1, 1,
0.5097669, 0.4602903, 1.403457, 0.1411765, 0, 1, 1,
0.5163695, 0.9370545, 1.804326, 0.145098, 0, 1, 1,
0.5168653, -0.2414997, 2.210428, 0.1529412, 0, 1, 1,
0.5176246, 0.5082486, -0.5308479, 0.1568628, 0, 1, 1,
0.5198315, -0.6315277, 2.396677, 0.1647059, 0, 1, 1,
0.5213075, -1.385399, 1.88199, 0.1686275, 0, 1, 1,
0.5214239, 1.340629, 1.002713, 0.1764706, 0, 1, 1,
0.5235606, -1.245832, 1.733921, 0.1803922, 0, 1, 1,
0.5324411, -0.787057, 3.313305, 0.1882353, 0, 1, 1,
0.5328129, -0.7155601, 3.414193, 0.1921569, 0, 1, 1,
0.5384216, 0.8488311, 0.3344502, 0.2, 0, 1, 1,
0.5385653, 0.3353903, 1.596094, 0.2078431, 0, 1, 1,
0.5396626, 0.06187525, 1.178208, 0.2117647, 0, 1, 1,
0.5438978, -0.3471985, 1.569487, 0.2196078, 0, 1, 1,
0.5468686, -0.2204786, 0.106956, 0.2235294, 0, 1, 1,
0.5490704, -0.01322282, 1.559929, 0.2313726, 0, 1, 1,
0.549298, 1.124976, -0.5367761, 0.2352941, 0, 1, 1,
0.5501112, 0.6554935, -1.078747, 0.2431373, 0, 1, 1,
0.5524169, -1.700447, 1.405539, 0.2470588, 0, 1, 1,
0.5524708, -0.4771039, 2.633136, 0.254902, 0, 1, 1,
0.5582668, -0.2871173, 2.158278, 0.2588235, 0, 1, 1,
0.5586493, 1.807537, 0.7614023, 0.2666667, 0, 1, 1,
0.559986, 0.3155637, 0.2628855, 0.2705882, 0, 1, 1,
0.560355, 0.05557185, 2.681269, 0.2784314, 0, 1, 1,
0.5709918, 0.6169084, -1.230539, 0.282353, 0, 1, 1,
0.5714519, -0.02980177, 0.9553531, 0.2901961, 0, 1, 1,
0.5724703, 0.3407447, 1.321467, 0.2941177, 0, 1, 1,
0.5726829, 0.5229892, 0.3448366, 0.3019608, 0, 1, 1,
0.5728785, 0.1555029, 2.089611, 0.3098039, 0, 1, 1,
0.5739877, 1.700642, -0.8855801, 0.3137255, 0, 1, 1,
0.5740031, -1.084515, 4.213606, 0.3215686, 0, 1, 1,
0.5770798, 0.2343907, 0.9654694, 0.3254902, 0, 1, 1,
0.5851237, 0.2196863, 0.8983982, 0.3333333, 0, 1, 1,
0.5868126, 1.570774, 1.523842, 0.3372549, 0, 1, 1,
0.5869982, -0.5883735, 1.552797, 0.345098, 0, 1, 1,
0.5917892, 0.6275656, 2.138201, 0.3490196, 0, 1, 1,
0.5918446, -0.1976752, 1.470114, 0.3568628, 0, 1, 1,
0.5951884, 0.4358268, 0.5740184, 0.3607843, 0, 1, 1,
0.6097105, -0.6542466, 2.150422, 0.3686275, 0, 1, 1,
0.6127135, -1.258543, 2.686088, 0.372549, 0, 1, 1,
0.6138256, 0.2244133, 0.7880411, 0.3803922, 0, 1, 1,
0.6217211, 0.7353425, 1.144582, 0.3843137, 0, 1, 1,
0.6220394, -1.284168, 2.126449, 0.3921569, 0, 1, 1,
0.6260895, -0.1186695, 1.593447, 0.3960784, 0, 1, 1,
0.6265085, 0.693748, -0.0846289, 0.4039216, 0, 1, 1,
0.6267736, -1.07705, 4.347722, 0.4117647, 0, 1, 1,
0.6325498, 0.5534633, 0.731281, 0.4156863, 0, 1, 1,
0.6419176, -0.1934822, 2.47452, 0.4235294, 0, 1, 1,
0.6429453, 1.409435, 0.6744183, 0.427451, 0, 1, 1,
0.6477223, -0.4121032, 3.335854, 0.4352941, 0, 1, 1,
0.650422, -0.3068537, 2.053218, 0.4392157, 0, 1, 1,
0.6532602, 0.8955096, -1.010573, 0.4470588, 0, 1, 1,
0.6538166, 0.02201941, 1.580755, 0.4509804, 0, 1, 1,
0.6596466, -0.6679938, 2.990118, 0.4588235, 0, 1, 1,
0.6601668, 1.331386, 1.817058, 0.4627451, 0, 1, 1,
0.6733335, -0.7368452, 2.277339, 0.4705882, 0, 1, 1,
0.6775119, -1.559149, 0.5115704, 0.4745098, 0, 1, 1,
0.6809037, -0.2220746, 1.026817, 0.4823529, 0, 1, 1,
0.6839982, -0.9301885, 2.800099, 0.4862745, 0, 1, 1,
0.686386, 1.455646, -0.01101357, 0.4941176, 0, 1, 1,
0.6866376, -1.438084, 3.910119, 0.5019608, 0, 1, 1,
0.6883968, 0.3801972, 2.194569, 0.5058824, 0, 1, 1,
0.6905248, 0.7259229, 0.5369557, 0.5137255, 0, 1, 1,
0.6977044, 1.020468, 2.177024, 0.5176471, 0, 1, 1,
0.6994209, -0.3607916, 1.35405, 0.5254902, 0, 1, 1,
0.7072538, -1.605338, 4.416125, 0.5294118, 0, 1, 1,
0.707993, -2.558801, 3.154594, 0.5372549, 0, 1, 1,
0.7101425, -0.6776319, 0.2883966, 0.5411765, 0, 1, 1,
0.7102181, -0.7147896, 3.504914, 0.5490196, 0, 1, 1,
0.7116815, -0.849069, 3.030161, 0.5529412, 0, 1, 1,
0.7129094, 1.021218, 0.5490212, 0.5607843, 0, 1, 1,
0.7134696, -0.8233691, 1.523607, 0.5647059, 0, 1, 1,
0.7146291, 0.5987492, 0.3759461, 0.572549, 0, 1, 1,
0.7149476, 1.031087, 0.3454847, 0.5764706, 0, 1, 1,
0.7152047, -0.0227247, 1.533078, 0.5843138, 0, 1, 1,
0.7175156, 0.272422, 0.5990413, 0.5882353, 0, 1, 1,
0.7232411, -1.489555, 4.412559, 0.5960785, 0, 1, 1,
0.7237103, -1.565389, 3.741421, 0.6039216, 0, 1, 1,
0.7249957, -0.1029925, 0.6623254, 0.6078432, 0, 1, 1,
0.7293417, 0.6612489, -0.8320186, 0.6156863, 0, 1, 1,
0.7352855, 0.1894649, 0.7691424, 0.6196079, 0, 1, 1,
0.7377334, 0.3983719, 1.149588, 0.627451, 0, 1, 1,
0.7395061, -1.15489, 4.550329, 0.6313726, 0, 1, 1,
0.7417033, -1.026621, 0.7619839, 0.6392157, 0, 1, 1,
0.7421296, -2.205688, 3.64349, 0.6431373, 0, 1, 1,
0.7435156, 1.258512, 1.340088, 0.6509804, 0, 1, 1,
0.7453195, 2.223772, -0.1635206, 0.654902, 0, 1, 1,
0.7497143, 2.272246, -1.069309, 0.6627451, 0, 1, 1,
0.7536126, -0.9098433, 2.957773, 0.6666667, 0, 1, 1,
0.7567324, -1.006417, 2.316663, 0.6745098, 0, 1, 1,
0.7569264, -1.282045, 3.58558, 0.6784314, 0, 1, 1,
0.7588066, -0.05861188, 2.635311, 0.6862745, 0, 1, 1,
0.7591542, -0.543204, 0.1097163, 0.6901961, 0, 1, 1,
0.7606825, 0.05583591, 3.140512, 0.6980392, 0, 1, 1,
0.7618351, 1.610477, 0.2668132, 0.7058824, 0, 1, 1,
0.7626313, -1.689649, 3.778185, 0.7098039, 0, 1, 1,
0.7642166, 0.5477194, 2.463122, 0.7176471, 0, 1, 1,
0.7669732, 0.8383024, 1.229792, 0.7215686, 0, 1, 1,
0.7778016, 0.7392541, 1.802165, 0.7294118, 0, 1, 1,
0.7793905, -0.9144089, 4.149867, 0.7333333, 0, 1, 1,
0.7877825, 1.250552, 0.5548301, 0.7411765, 0, 1, 1,
0.7963989, 0.1558513, 0.2755484, 0.7450981, 0, 1, 1,
0.798991, -1.393606, 3.466707, 0.7529412, 0, 1, 1,
0.8044273, 0.2521141, 0.494541, 0.7568628, 0, 1, 1,
0.8068706, 1.000056, 0.4418244, 0.7647059, 0, 1, 1,
0.8112345, -0.02123934, 1.699569, 0.7686275, 0, 1, 1,
0.8210629, 0.7047794, 1.242267, 0.7764706, 0, 1, 1,
0.829558, -0.4833953, 2.609139, 0.7803922, 0, 1, 1,
0.8381004, -0.008492862, 0.4832949, 0.7882353, 0, 1, 1,
0.8443555, 0.3852579, 0.5191571, 0.7921569, 0, 1, 1,
0.8595333, 1.468098, -0.2659536, 0.8, 0, 1, 1,
0.8628756, 1.581908, 0.8148631, 0.8078431, 0, 1, 1,
0.8684719, -0.1123659, 2.142292, 0.8117647, 0, 1, 1,
0.8714862, -1.665516, 3.038638, 0.8196079, 0, 1, 1,
0.8730856, -0.9017503, 3.47238, 0.8235294, 0, 1, 1,
0.8735766, 1.629696, 1.102557, 0.8313726, 0, 1, 1,
0.8800594, -0.6511189, 0.07373419, 0.8352941, 0, 1, 1,
0.8858644, -0.7106003, 0.95619, 0.8431373, 0, 1, 1,
0.8886613, -1.282684, 2.895198, 0.8470588, 0, 1, 1,
0.894103, -0.3224148, 2.309269, 0.854902, 0, 1, 1,
0.8950728, -0.2640907, 0.6414233, 0.8588235, 0, 1, 1,
0.9094675, -1.288557, 2.673108, 0.8666667, 0, 1, 1,
0.9164144, -1.029877, 4.821345, 0.8705882, 0, 1, 1,
0.9171333, -0.1433545, 1.743673, 0.8784314, 0, 1, 1,
0.9321854, -1.052464, 1.828683, 0.8823529, 0, 1, 1,
0.9329359, 0.5856869, -0.5020537, 0.8901961, 0, 1, 1,
0.9349497, 0.7115993, 1.274571, 0.8941177, 0, 1, 1,
0.9393982, 0.06323828, 1.976748, 0.9019608, 0, 1, 1,
0.9456882, 0.13966, 3.83138, 0.9098039, 0, 1, 1,
0.9477059, 1.132707, 0.438033, 0.9137255, 0, 1, 1,
0.9624799, -0.04776423, 0.7618662, 0.9215686, 0, 1, 1,
0.9672538, 2.138928, -0.3242787, 0.9254902, 0, 1, 1,
0.9689276, 1.341281, 0.9275326, 0.9333333, 0, 1, 1,
0.9689397, -0.9840534, 2.681177, 0.9372549, 0, 1, 1,
0.9778844, 0.02944884, 2.133673, 0.945098, 0, 1, 1,
0.9842567, 0.02671603, 1.130756, 0.9490196, 0, 1, 1,
0.9886164, -0.9048887, 1.714892, 0.9568627, 0, 1, 1,
0.9899549, -0.08698901, 1.625691, 0.9607843, 0, 1, 1,
0.99051, 0.2330625, 2.140796, 0.9686275, 0, 1, 1,
0.9920701, -0.06342228, -0.0481311, 0.972549, 0, 1, 1,
1.000133, -0.5076142, 2.384484, 0.9803922, 0, 1, 1,
1.002793, -1.980082, 3.438936, 0.9843137, 0, 1, 1,
1.008148, -0.2237555, 2.750031, 0.9921569, 0, 1, 1,
1.010242, 0.5274209, 0.1153761, 0.9960784, 0, 1, 1,
1.011555, 0.5670546, 1.598931, 1, 0, 0.9960784, 1,
1.01913, 0.7523257, -0.2428308, 1, 0, 0.9882353, 1,
1.025045, 0.1323932, 1.337207, 1, 0, 0.9843137, 1,
1.026056, 0.752843, -0.4357483, 1, 0, 0.9764706, 1,
1.029288, -1.056964, 2.868472, 1, 0, 0.972549, 1,
1.035708, -0.08255065, 0.8380923, 1, 0, 0.9647059, 1,
1.045141, 0.4959623, 2.845616, 1, 0, 0.9607843, 1,
1.05039, -0.9770123, 1.998319, 1, 0, 0.9529412, 1,
1.057226, 0.4867536, 0.2806388, 1, 0, 0.9490196, 1,
1.062552, -0.830399, 2.191033, 1, 0, 0.9411765, 1,
1.068711, 0.3494509, 0.3480007, 1, 0, 0.9372549, 1,
1.073581, 0.9493861, 1.695878, 1, 0, 0.9294118, 1,
1.081106, 0.1656511, 0.5147899, 1, 0, 0.9254902, 1,
1.082506, -0.5323089, 1.395723, 1, 0, 0.9176471, 1,
1.084626, 2.317199, 1.177449, 1, 0, 0.9137255, 1,
1.085487, 1.210734, 0.7109956, 1, 0, 0.9058824, 1,
1.088151, -0.8892713, 1.468813, 1, 0, 0.9019608, 1,
1.092139, -0.2791714, 1.996222, 1, 0, 0.8941177, 1,
1.092752, 0.5144127, 0.8650746, 1, 0, 0.8862745, 1,
1.112409, 0.4877139, 0.4891308, 1, 0, 0.8823529, 1,
1.120553, 0.2967758, -0.07660945, 1, 0, 0.8745098, 1,
1.121688, 0.7676383, 2.151866, 1, 0, 0.8705882, 1,
1.13278, 1.071269, 0.5098481, 1, 0, 0.8627451, 1,
1.139683, 2.082794, 0.1528708, 1, 0, 0.8588235, 1,
1.145513, 0.1599568, -0.4762996, 1, 0, 0.8509804, 1,
1.14824, -0.4842121, -0.8569922, 1, 0, 0.8470588, 1,
1.152958, 0.1544304, 1.235396, 1, 0, 0.8392157, 1,
1.153967, -0.7022017, 2.44253, 1, 0, 0.8352941, 1,
1.155481, 0.5032597, 1.938025, 1, 0, 0.827451, 1,
1.156309, -0.4473099, -0.03380163, 1, 0, 0.8235294, 1,
1.156939, 1.585688, 0.1211879, 1, 0, 0.8156863, 1,
1.165003, -0.3739799, 2.662467, 1, 0, 0.8117647, 1,
1.169281, 1.394113, 0.8131907, 1, 0, 0.8039216, 1,
1.172557, -1.224124, 1.93732, 1, 0, 0.7960784, 1,
1.173144, 0.1658685, 0.5610268, 1, 0, 0.7921569, 1,
1.174181, -1.31378, 1.861933, 1, 0, 0.7843137, 1,
1.175527, -0.1134285, 3.730305, 1, 0, 0.7803922, 1,
1.177158, 0.3110797, -0.3950467, 1, 0, 0.772549, 1,
1.177569, -0.4897761, 0.3778267, 1, 0, 0.7686275, 1,
1.181839, -1.061926, 2.364338, 1, 0, 0.7607843, 1,
1.185475, -1.313015, 2.016484, 1, 0, 0.7568628, 1,
1.194871, -0.3095342, 2.780963, 1, 0, 0.7490196, 1,
1.200665, 0.05187007, 2.005537, 1, 0, 0.7450981, 1,
1.201195, -0.2993923, 2.831522, 1, 0, 0.7372549, 1,
1.20552, 1.341106, 2.027048, 1, 0, 0.7333333, 1,
1.209679, -0.1853153, 1.527238, 1, 0, 0.7254902, 1,
1.211932, -0.4026375, 0.8625327, 1, 0, 0.7215686, 1,
1.212661, -0.6319326, 2.421576, 1, 0, 0.7137255, 1,
1.227066, 1.506817, 2.100623, 1, 0, 0.7098039, 1,
1.22744, 1.394527, 1.373867, 1, 0, 0.7019608, 1,
1.233616, -0.3341906, 0.862032, 1, 0, 0.6941177, 1,
1.234255, -0.6628922, 1.822325, 1, 0, 0.6901961, 1,
1.242395, -0.3689371, 0.6072056, 1, 0, 0.682353, 1,
1.245874, 1.568488, 0.4517734, 1, 0, 0.6784314, 1,
1.246951, -2.016842, 3.529063, 1, 0, 0.6705883, 1,
1.251999, 1.397971, 0.7616543, 1, 0, 0.6666667, 1,
1.252025, -0.9155779, 1.465544, 1, 0, 0.6588235, 1,
1.274433, -0.8158526, 3.108836, 1, 0, 0.654902, 1,
1.27845, -1.789793, 3.037773, 1, 0, 0.6470588, 1,
1.283208, -3.478414, 2.396555, 1, 0, 0.6431373, 1,
1.29133, -0.8801011, 3.079795, 1, 0, 0.6352941, 1,
1.291433, -0.1594425, 3.084352, 1, 0, 0.6313726, 1,
1.305407, 0.05042103, 3.94406, 1, 0, 0.6235294, 1,
1.306222, 2.127977, 0.3001705, 1, 0, 0.6196079, 1,
1.314271, 0.9683864, 0.6036417, 1, 0, 0.6117647, 1,
1.31757, -1.186378, 2.038186, 1, 0, 0.6078432, 1,
1.319754, -0.6830037, 2.13669, 1, 0, 0.6, 1,
1.334943, -0.0319337, 2.270358, 1, 0, 0.5921569, 1,
1.340045, -0.1677642, 0.2986481, 1, 0, 0.5882353, 1,
1.340292, 0.8366969, 0.9196676, 1, 0, 0.5803922, 1,
1.36386, 0.8352693, 0.5456787, 1, 0, 0.5764706, 1,
1.367986, 0.4881707, -0.6679373, 1, 0, 0.5686275, 1,
1.398788, -0.5247377, 3.132831, 1, 0, 0.5647059, 1,
1.402304, 0.2380694, 0.3560394, 1, 0, 0.5568628, 1,
1.404835, 0.754818, 1.096839, 1, 0, 0.5529412, 1,
1.406426, -0.104845, 2.742513, 1, 0, 0.5450981, 1,
1.407039, -0.665477, -0.4954785, 1, 0, 0.5411765, 1,
1.40768, 1.551416, 0.2852475, 1, 0, 0.5333334, 1,
1.409771, -0.4894352, 0.5015093, 1, 0, 0.5294118, 1,
1.410808, 0.3908026, 1.933499, 1, 0, 0.5215687, 1,
1.419369, 1.700737, 0.2188139, 1, 0, 0.5176471, 1,
1.423288, -0.2476075, 1.317887, 1, 0, 0.509804, 1,
1.427283, -0.2114674, 3.147364, 1, 0, 0.5058824, 1,
1.43421, -0.2293682, 2.210195, 1, 0, 0.4980392, 1,
1.436789, 0.09999853, 0.8740801, 1, 0, 0.4901961, 1,
1.437344, 0.904087, 0.8783553, 1, 0, 0.4862745, 1,
1.438863, 0.2918683, 1.447733, 1, 0, 0.4784314, 1,
1.444356, 0.08117484, 0.5366042, 1, 0, 0.4745098, 1,
1.454562, 1.872541, 1.424551, 1, 0, 0.4666667, 1,
1.455652, 1.65503, 1.686502, 1, 0, 0.4627451, 1,
1.461895, -0.08165429, 1.60444, 1, 0, 0.454902, 1,
1.478741, -0.9729216, 1.233967, 1, 0, 0.4509804, 1,
1.487785, 0.3633816, 2.517682, 1, 0, 0.4431373, 1,
1.49219, 2.412005, 0.3953266, 1, 0, 0.4392157, 1,
1.49319, 1.911968, 0.5380445, 1, 0, 0.4313726, 1,
1.496837, 0.05172316, 0.5862084, 1, 0, 0.427451, 1,
1.501027, 0.3914768, 2.258192, 1, 0, 0.4196078, 1,
1.505118, 0.3853267, 1.707152, 1, 0, 0.4156863, 1,
1.508522, -0.1457454, 2.308187, 1, 0, 0.4078431, 1,
1.53049, 1.537398, 2.537822, 1, 0, 0.4039216, 1,
1.535756, -1.703453, 2.564512, 1, 0, 0.3960784, 1,
1.542635, -0.4782469, 2.14085, 1, 0, 0.3882353, 1,
1.553143, -0.1613234, 0.1090806, 1, 0, 0.3843137, 1,
1.563128, 1.73245, 0.2216374, 1, 0, 0.3764706, 1,
1.565669, -2.152118, 4.031705, 1, 0, 0.372549, 1,
1.575293, -0.2696328, 1.365896, 1, 0, 0.3647059, 1,
1.584292, -0.9697614, 1.983035, 1, 0, 0.3607843, 1,
1.589923, -0.6074035, 2.579073, 1, 0, 0.3529412, 1,
1.594213, -0.5271171, 3.339534, 1, 0, 0.3490196, 1,
1.609433, 0.1786938, 2.118947, 1, 0, 0.3411765, 1,
1.613585, 1.227595, 0.5166789, 1, 0, 0.3372549, 1,
1.627294, 1.367649, -0.2131181, 1, 0, 0.3294118, 1,
1.634883, 1.144618, 1.92717, 1, 0, 0.3254902, 1,
1.672188, -0.792372, 1.989657, 1, 0, 0.3176471, 1,
1.685059, 0.6045187, 1.223287, 1, 0, 0.3137255, 1,
1.690291, -1.381194, 1.326967, 1, 0, 0.3058824, 1,
1.710086, -1.956686, 4.737169, 1, 0, 0.2980392, 1,
1.711272, 0.6716302, 1.278909, 1, 0, 0.2941177, 1,
1.730976, 0.02814651, 1.973916, 1, 0, 0.2862745, 1,
1.736025, 0.4244495, 1.609223, 1, 0, 0.282353, 1,
1.740275, 0.06041391, 0.07252383, 1, 0, 0.2745098, 1,
1.742872, -0.1024753, 1.023612, 1, 0, 0.2705882, 1,
1.742947, 0.7544066, 1.843681, 1, 0, 0.2627451, 1,
1.78231, -0.4913618, 1.070018, 1, 0, 0.2588235, 1,
1.804839, -1.810617, 2.17029, 1, 0, 0.2509804, 1,
1.823889, -0.0890646, 1.594947, 1, 0, 0.2470588, 1,
1.834358, -1.061307, 1.900818, 1, 0, 0.2392157, 1,
1.837189, -0.6364685, 2.367305, 1, 0, 0.2352941, 1,
1.841208, 0.6626654, 0.1972383, 1, 0, 0.227451, 1,
1.88428, 0.8514934, 0.7851267, 1, 0, 0.2235294, 1,
1.884597, -0.007427648, 3.617259, 1, 0, 0.2156863, 1,
1.88992, 1.458759, 0.471639, 1, 0, 0.2117647, 1,
1.894009, 2.604246, -0.1191909, 1, 0, 0.2039216, 1,
1.899275, 0.8392897, 1.18991, 1, 0, 0.1960784, 1,
1.900743, 0.4229796, 0.7818713, 1, 0, 0.1921569, 1,
1.903231, 0.9964939, 1.450388, 1, 0, 0.1843137, 1,
1.941057, 2.078606, 1.039688, 1, 0, 0.1803922, 1,
1.963663, -0.7657949, 0.3256366, 1, 0, 0.172549, 1,
1.986791, -0.8544565, 0.1448496, 1, 0, 0.1686275, 1,
1.989492, -0.07719956, -0.07983315, 1, 0, 0.1607843, 1,
2.042353, -0.9326474, 2.913604, 1, 0, 0.1568628, 1,
2.056916, 0.8110912, 3.1847, 1, 0, 0.1490196, 1,
2.092009, -0.5959342, 0.3672345, 1, 0, 0.145098, 1,
2.097564, -0.1918554, 1.485186, 1, 0, 0.1372549, 1,
2.133513, -0.7261683, 3.801527, 1, 0, 0.1333333, 1,
2.13681, 2.310441, 1.154124, 1, 0, 0.1254902, 1,
2.200579, 0.4719653, 0.9591132, 1, 0, 0.1215686, 1,
2.202697, -1.072581, 2.232297, 1, 0, 0.1137255, 1,
2.21373, 0.7014673, 2.041688, 1, 0, 0.1098039, 1,
2.267509, -0.9388511, 1.255704, 1, 0, 0.1019608, 1,
2.312663, -1.502836, 3.375172, 1, 0, 0.09411765, 1,
2.319842, 0.0163806, 0.8598889, 1, 0, 0.09019608, 1,
2.398243, 0.7482978, 0.8048576, 1, 0, 0.08235294, 1,
2.406071, -0.2513098, 2.095865, 1, 0, 0.07843138, 1,
2.415807, 0.1798003, 1.379618, 1, 0, 0.07058824, 1,
2.431359, -1.291963, 0.8447194, 1, 0, 0.06666667, 1,
2.52024, 0.8803652, 1.932348, 1, 0, 0.05882353, 1,
2.575669, 1.221882, 0.8758674, 1, 0, 0.05490196, 1,
2.615111, -0.1468915, 2.370146, 1, 0, 0.04705882, 1,
2.693587, 0.7494717, 2.047599, 1, 0, 0.04313726, 1,
2.944717, 2.382657, -0.2854367, 1, 0, 0.03529412, 1,
2.972715, -1.215074, 2.254375, 1, 0, 0.03137255, 1,
3.051569, -0.4004613, 1.98415, 1, 0, 0.02352941, 1,
3.086602, 1.361765, 2.238086, 1, 0, 0.01960784, 1,
3.119399, -0.2471216, 2.233677, 1, 0, 0.01176471, 1,
3.500347, -0.8120763, 0.5563732, 1, 0, 0.007843138, 1
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
0.2848543, -4.509424, -8.248891, 0, -0.5, 0.5, 0.5,
0.2848543, -4.509424, -8.248891, 1, -0.5, 0.5, 0.5,
0.2848543, -4.509424, -8.248891, 1, 1.5, 0.5, 0.5,
0.2848543, -4.509424, -8.248891, 0, 1.5, 0.5, 0.5
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
-4.020691, -0.4370836, -8.248891, 0, -0.5, 0.5, 0.5,
-4.020691, -0.4370836, -8.248891, 1, -0.5, 0.5, 0.5,
-4.020691, -0.4370836, -8.248891, 1, 1.5, 0.5, 0.5,
-4.020691, -0.4370836, -8.248891, 0, 1.5, 0.5, 0.5
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
-4.020691, -4.509424, -0.2740889, 0, -0.5, 0.5, 0.5,
-4.020691, -4.509424, -0.2740889, 1, -0.5, 0.5, 0.5,
-4.020691, -4.509424, -0.2740889, 1, 1.5, 0.5, 0.5,
-4.020691, -4.509424, -0.2740889, 0, 1.5, 0.5, 0.5
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
-2, -3.569654, -6.408552,
3, -3.569654, -6.408552,
-2, -3.569654, -6.408552,
-2, -3.726282, -6.715275,
-1, -3.569654, -6.408552,
-1, -3.726282, -6.715275,
0, -3.569654, -6.408552,
0, -3.726282, -6.715275,
1, -3.569654, -6.408552,
1, -3.726282, -6.715275,
2, -3.569654, -6.408552,
2, -3.726282, -6.715275,
3, -3.569654, -6.408552,
3, -3.726282, -6.715275
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
-2, -4.039539, -7.328722, 0, -0.5, 0.5, 0.5,
-2, -4.039539, -7.328722, 1, -0.5, 0.5, 0.5,
-2, -4.039539, -7.328722, 1, 1.5, 0.5, 0.5,
-2, -4.039539, -7.328722, 0, 1.5, 0.5, 0.5,
-1, -4.039539, -7.328722, 0, -0.5, 0.5, 0.5,
-1, -4.039539, -7.328722, 1, -0.5, 0.5, 0.5,
-1, -4.039539, -7.328722, 1, 1.5, 0.5, 0.5,
-1, -4.039539, -7.328722, 0, 1.5, 0.5, 0.5,
0, -4.039539, -7.328722, 0, -0.5, 0.5, 0.5,
0, -4.039539, -7.328722, 1, -0.5, 0.5, 0.5,
0, -4.039539, -7.328722, 1, 1.5, 0.5, 0.5,
0, -4.039539, -7.328722, 0, 1.5, 0.5, 0.5,
1, -4.039539, -7.328722, 0, -0.5, 0.5, 0.5,
1, -4.039539, -7.328722, 1, -0.5, 0.5, 0.5,
1, -4.039539, -7.328722, 1, 1.5, 0.5, 0.5,
1, -4.039539, -7.328722, 0, 1.5, 0.5, 0.5,
2, -4.039539, -7.328722, 0, -0.5, 0.5, 0.5,
2, -4.039539, -7.328722, 1, -0.5, 0.5, 0.5,
2, -4.039539, -7.328722, 1, 1.5, 0.5, 0.5,
2, -4.039539, -7.328722, 0, 1.5, 0.5, 0.5,
3, -4.039539, -7.328722, 0, -0.5, 0.5, 0.5,
3, -4.039539, -7.328722, 1, -0.5, 0.5, 0.5,
3, -4.039539, -7.328722, 1, 1.5, 0.5, 0.5,
3, -4.039539, -7.328722, 0, 1.5, 0.5, 0.5
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
-3.027104, -3, -6.408552,
-3.027104, 2, -6.408552,
-3.027104, -3, -6.408552,
-3.192702, -3, -6.715275,
-3.027104, -2, -6.408552,
-3.192702, -2, -6.715275,
-3.027104, -1, -6.408552,
-3.192702, -1, -6.715275,
-3.027104, 0, -6.408552,
-3.192702, 0, -6.715275,
-3.027104, 1, -6.408552,
-3.192702, 1, -6.715275,
-3.027104, 2, -6.408552,
-3.192702, 2, -6.715275
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
-3.523897, -3, -7.328722, 0, -0.5, 0.5, 0.5,
-3.523897, -3, -7.328722, 1, -0.5, 0.5, 0.5,
-3.523897, -3, -7.328722, 1, 1.5, 0.5, 0.5,
-3.523897, -3, -7.328722, 0, 1.5, 0.5, 0.5,
-3.523897, -2, -7.328722, 0, -0.5, 0.5, 0.5,
-3.523897, -2, -7.328722, 1, -0.5, 0.5, 0.5,
-3.523897, -2, -7.328722, 1, 1.5, 0.5, 0.5,
-3.523897, -2, -7.328722, 0, 1.5, 0.5, 0.5,
-3.523897, -1, -7.328722, 0, -0.5, 0.5, 0.5,
-3.523897, -1, -7.328722, 1, -0.5, 0.5, 0.5,
-3.523897, -1, -7.328722, 1, 1.5, 0.5, 0.5,
-3.523897, -1, -7.328722, 0, 1.5, 0.5, 0.5,
-3.523897, 0, -7.328722, 0, -0.5, 0.5, 0.5,
-3.523897, 0, -7.328722, 1, -0.5, 0.5, 0.5,
-3.523897, 0, -7.328722, 1, 1.5, 0.5, 0.5,
-3.523897, 0, -7.328722, 0, 1.5, 0.5, 0.5,
-3.523897, 1, -7.328722, 0, -0.5, 0.5, 0.5,
-3.523897, 1, -7.328722, 1, -0.5, 0.5, 0.5,
-3.523897, 1, -7.328722, 1, 1.5, 0.5, 0.5,
-3.523897, 1, -7.328722, 0, 1.5, 0.5, 0.5,
-3.523897, 2, -7.328722, 0, -0.5, 0.5, 0.5,
-3.523897, 2, -7.328722, 1, -0.5, 0.5, 0.5,
-3.523897, 2, -7.328722, 1, 1.5, 0.5, 0.5,
-3.523897, 2, -7.328722, 0, 1.5, 0.5, 0.5
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
-3.027104, -3.569654, -6,
-3.027104, -3.569654, 4,
-3.027104, -3.569654, -6,
-3.192702, -3.726282, -6,
-3.027104, -3.569654, -4,
-3.192702, -3.726282, -4,
-3.027104, -3.569654, -2,
-3.192702, -3.726282, -2,
-3.027104, -3.569654, 0,
-3.192702, -3.726282, 0,
-3.027104, -3.569654, 2,
-3.192702, -3.726282, 2,
-3.027104, -3.569654, 4,
-3.192702, -3.726282, 4
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
"-6",
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
-3.523897, -4.039539, -6, 0, -0.5, 0.5, 0.5,
-3.523897, -4.039539, -6, 1, -0.5, 0.5, 0.5,
-3.523897, -4.039539, -6, 1, 1.5, 0.5, 0.5,
-3.523897, -4.039539, -6, 0, 1.5, 0.5, 0.5,
-3.523897, -4.039539, -4, 0, -0.5, 0.5, 0.5,
-3.523897, -4.039539, -4, 1, -0.5, 0.5, 0.5,
-3.523897, -4.039539, -4, 1, 1.5, 0.5, 0.5,
-3.523897, -4.039539, -4, 0, 1.5, 0.5, 0.5,
-3.523897, -4.039539, -2, 0, -0.5, 0.5, 0.5,
-3.523897, -4.039539, -2, 1, -0.5, 0.5, 0.5,
-3.523897, -4.039539, -2, 1, 1.5, 0.5, 0.5,
-3.523897, -4.039539, -2, 0, 1.5, 0.5, 0.5,
-3.523897, -4.039539, 0, 0, -0.5, 0.5, 0.5,
-3.523897, -4.039539, 0, 1, -0.5, 0.5, 0.5,
-3.523897, -4.039539, 0, 1, 1.5, 0.5, 0.5,
-3.523897, -4.039539, 0, 0, 1.5, 0.5, 0.5,
-3.523897, -4.039539, 2, 0, -0.5, 0.5, 0.5,
-3.523897, -4.039539, 2, 1, -0.5, 0.5, 0.5,
-3.523897, -4.039539, 2, 1, 1.5, 0.5, 0.5,
-3.523897, -4.039539, 2, 0, 1.5, 0.5, 0.5,
-3.523897, -4.039539, 4, 0, -0.5, 0.5, 0.5,
-3.523897, -4.039539, 4, 1, -0.5, 0.5, 0.5,
-3.523897, -4.039539, 4, 1, 1.5, 0.5, 0.5,
-3.523897, -4.039539, 4, 0, 1.5, 0.5, 0.5
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
-3.027104, -3.569654, -6.408552,
-3.027104, 2.695486, -6.408552,
-3.027104, -3.569654, 5.860374,
-3.027104, 2.695486, 5.860374,
-3.027104, -3.569654, -6.408552,
-3.027104, -3.569654, 5.860374,
-3.027104, 2.695486, -6.408552,
-3.027104, 2.695486, 5.860374,
-3.027104, -3.569654, -6.408552,
3.596812, -3.569654, -6.408552,
-3.027104, -3.569654, 5.860374,
3.596812, -3.569654, 5.860374,
-3.027104, 2.695486, -6.408552,
3.596812, 2.695486, -6.408552,
-3.027104, 2.695486, 5.860374,
3.596812, 2.695486, 5.860374,
3.596812, -3.569654, -6.408552,
3.596812, 2.695486, -6.408552,
3.596812, -3.569654, 5.860374,
3.596812, 2.695486, 5.860374,
3.596812, -3.569654, -6.408552,
3.596812, -3.569654, 5.860374,
3.596812, 2.695486, -6.408552,
3.596812, 2.695486, 5.860374
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
var radius = 8.162305;
var distance = 36.31502;
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
mvMatrix.translate( -0.2848543, 0.4370836, 0.2740889 );
mvMatrix.scale( 1.33233, 1.408627, 0.7193167 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.31502);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
phosphonic_acid_diet<-read.table("phosphonic_acid_diet.xyz", skip=1)
x<-phosphonic_acid_diet$V2
y<-phosphonic_acid_diet$V3
z<-phosphonic_acid_diet$V4
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
8, 4, 2, 0, 0, 1, 1, 1,
1, 3, 1, 1, 0, 0, 1, 1,
2, 2, 1, 1, 0, 0, 1, 1,
3, 3, 1, 1, 0, 0, 1, 1,
4, 2, 1, 1, 0, 0, 1, 1,
4, 1, 1, 1, 0, 0, 1, 1,
5, 3, 1, 0, 0, 0, 1, 1,
6, 2, 1, 0, 0, 0, 1, 1,
7, 3, 1, 0, 0, 0, 1, 1
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
var radius = 5.898093;
var distance = 20.7168;
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
mvMatrix.translate( -4.5, -2.5, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -20.7168);
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
for (var i = 0; i < 9; i++) {
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