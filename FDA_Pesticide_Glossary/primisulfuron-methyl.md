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
-3.01992, 0.7723323, -1.068901, 1, 0, 0, 1,
-2.653333, -0.06518309, -0.1380505, 1, 0.007843138, 0, 1,
-2.563935, -1.864658, -2.054579, 1, 0.01176471, 0, 1,
-2.521046, 0.5161473, -2.016741, 1, 0.01960784, 0, 1,
-2.466615, 2.234376, -2.040638, 1, 0.02352941, 0, 1,
-2.410944, 0.3040172, -1.141985, 1, 0.03137255, 0, 1,
-2.375395, -0.6256278, -2.913366, 1, 0.03529412, 0, 1,
-2.337258, -1.010427, -0.8553855, 1, 0.04313726, 0, 1,
-2.329626, -1.361439, -1.517057, 1, 0.04705882, 0, 1,
-2.248313, 0.7014635, -2.348381, 1, 0.05490196, 0, 1,
-2.246964, -0.0684177, -2.874268, 1, 0.05882353, 0, 1,
-2.197212, 1.58646, -1.995718, 1, 0.06666667, 0, 1,
-2.181877, -0.2385829, -1.317843, 1, 0.07058824, 0, 1,
-2.180906, 0.2437925, -1.397494, 1, 0.07843138, 0, 1,
-2.180849, 0.7695947, -0.236517, 1, 0.08235294, 0, 1,
-2.124909, -0.5682206, -0.8634798, 1, 0.09019608, 0, 1,
-2.114253, -0.6540606, -1.537415, 1, 0.09411765, 0, 1,
-2.074799, -0.838331, -2.517442, 1, 0.1019608, 0, 1,
-2.065085, 0.4186773, -3.696424, 1, 0.1098039, 0, 1,
-2.048644, -1.329472, -2.306799, 1, 0.1137255, 0, 1,
-2.023444, 0.1284652, -2.43763, 1, 0.1215686, 0, 1,
-2.022979, 0.6322993, -2.797927, 1, 0.1254902, 0, 1,
-2.01647, -1.185292, -1.596892, 1, 0.1333333, 0, 1,
-1.997756, -1.206377, -2.13252, 1, 0.1372549, 0, 1,
-1.983319, -1.575287, -3.02173, 1, 0.145098, 0, 1,
-1.973015, 0.05643222, -3.278627, 1, 0.1490196, 0, 1,
-1.945103, -1.099365, -2.643274, 1, 0.1568628, 0, 1,
-1.908968, 1.215042, -0.06409895, 1, 0.1607843, 0, 1,
-1.903427, -0.01628, -0.6316418, 1, 0.1686275, 0, 1,
-1.877671, -0.9780545, -1.971077, 1, 0.172549, 0, 1,
-1.874177, -2.456538, -2.761061, 1, 0.1803922, 0, 1,
-1.859296, 0.3133914, -1.024776, 1, 0.1843137, 0, 1,
-1.829138, -0.2335346, -3.424681, 1, 0.1921569, 0, 1,
-1.828116, -1.040397, -2.130688, 1, 0.1960784, 0, 1,
-1.824752, -0.264226, -2.865042, 1, 0.2039216, 0, 1,
-1.782116, 0.1244006, -1.415138, 1, 0.2117647, 0, 1,
-1.764025, 0.06170693, -4.090131, 1, 0.2156863, 0, 1,
-1.760228, 0.5179741, -0.8359498, 1, 0.2235294, 0, 1,
-1.757969, 1.587538, -0.9563138, 1, 0.227451, 0, 1,
-1.751296, 1.349561, -1.432934, 1, 0.2352941, 0, 1,
-1.737543, 0.7598411, -0.6401158, 1, 0.2392157, 0, 1,
-1.729262, 2.889181, -1.0406, 1, 0.2470588, 0, 1,
-1.700754, 0.251034, -2.170933, 1, 0.2509804, 0, 1,
-1.679655, 0.7877648, 0.7385677, 1, 0.2588235, 0, 1,
-1.652303, -1.043054, -4.29081, 1, 0.2627451, 0, 1,
-1.630359, 0.6612002, -2.499476, 1, 0.2705882, 0, 1,
-1.626445, -0.4517217, -1.388675, 1, 0.2745098, 0, 1,
-1.614817, 0.5572182, -2.953407, 1, 0.282353, 0, 1,
-1.597332, -0.1524712, -2.829132, 1, 0.2862745, 0, 1,
-1.590207, 0.1505359, -1.258784, 1, 0.2941177, 0, 1,
-1.587826, -0.3891962, -0.4585784, 1, 0.3019608, 0, 1,
-1.572548, -0.5991191, -0.2029391, 1, 0.3058824, 0, 1,
-1.562715, 0.1657255, 0.115816, 1, 0.3137255, 0, 1,
-1.552512, 0.4374405, -2.457172, 1, 0.3176471, 0, 1,
-1.549625, -1.287278, -0.7419518, 1, 0.3254902, 0, 1,
-1.546552, -0.03330395, -2.398542, 1, 0.3294118, 0, 1,
-1.535472, 0.6830438, -0.4667866, 1, 0.3372549, 0, 1,
-1.502843, -0.1626372, -2.990253, 1, 0.3411765, 0, 1,
-1.499271, -0.6461862, -0.4018363, 1, 0.3490196, 0, 1,
-1.49414, 1.587561, -1.094084, 1, 0.3529412, 0, 1,
-1.486524, -0.0613094, -1.145175, 1, 0.3607843, 0, 1,
-1.482014, -0.646412, -1.616964, 1, 0.3647059, 0, 1,
-1.475056, 0.7636122, -1.606291, 1, 0.372549, 0, 1,
-1.474803, -0.5436414, -0.5825187, 1, 0.3764706, 0, 1,
-1.455368, 0.4198171, -1.963466, 1, 0.3843137, 0, 1,
-1.450189, -0.8518471, -1.792237, 1, 0.3882353, 0, 1,
-1.447033, -0.7315044, -3.420591, 1, 0.3960784, 0, 1,
-1.432343, -0.9631271, -3.771318, 1, 0.4039216, 0, 1,
-1.429304, 0.1026989, -1.330818, 1, 0.4078431, 0, 1,
-1.420944, 0.8725182, -0.7204543, 1, 0.4156863, 0, 1,
-1.413347, 1.511039, -2.11657, 1, 0.4196078, 0, 1,
-1.410786, -2.060085, -2.576072, 1, 0.427451, 0, 1,
-1.408858, 1.398387, 1.992375, 1, 0.4313726, 0, 1,
-1.400871, 0.4034941, -0.009191889, 1, 0.4392157, 0, 1,
-1.397812, -0.8229335, -2.634469, 1, 0.4431373, 0, 1,
-1.391893, 0.0474475, -3.56344, 1, 0.4509804, 0, 1,
-1.391704, -0.7596678, -1.682215, 1, 0.454902, 0, 1,
-1.391666, 1.173041, 0.3409809, 1, 0.4627451, 0, 1,
-1.385511, -0.08967644, -2.491839, 1, 0.4666667, 0, 1,
-1.371328, 3.153892, -0.4866238, 1, 0.4745098, 0, 1,
-1.363175, -0.6026356, -3.081235, 1, 0.4784314, 0, 1,
-1.354845, -1.35866, -1.090752, 1, 0.4862745, 0, 1,
-1.352212, 1.136038, -0.1111164, 1, 0.4901961, 0, 1,
-1.349898, 0.2694566, -1.735381, 1, 0.4980392, 0, 1,
-1.338497, 1.534117, 0.3271319, 1, 0.5058824, 0, 1,
-1.332581, -0.5950685, -2.621539, 1, 0.509804, 0, 1,
-1.33189, -0.0301378, -1.543721, 1, 0.5176471, 0, 1,
-1.324596, -1.760393, -2.608098, 1, 0.5215687, 0, 1,
-1.321304, 0.4688922, -0.4065297, 1, 0.5294118, 0, 1,
-1.317955, -0.2724298, -1.72618, 1, 0.5333334, 0, 1,
-1.315158, 1.778851, -1.088909, 1, 0.5411765, 0, 1,
-1.313924, 0.377602, -0.5865174, 1, 0.5450981, 0, 1,
-1.309315, 0.05743463, 0.3745308, 1, 0.5529412, 0, 1,
-1.302888, -0.2091095, -1.590715, 1, 0.5568628, 0, 1,
-1.279257, -0.2376791, -3.15699, 1, 0.5647059, 0, 1,
-1.279016, -0.1166725, -0.346821, 1, 0.5686275, 0, 1,
-1.271341, -0.2437913, -2.709678, 1, 0.5764706, 0, 1,
-1.271295, 0.7438703, -2.440085, 1, 0.5803922, 0, 1,
-1.26207, 0.5360782, -3.573885, 1, 0.5882353, 0, 1,
-1.250102, -1.500528, -5.343093, 1, 0.5921569, 0, 1,
-1.245331, -0.08340214, -2.525438, 1, 0.6, 0, 1,
-1.24238, 0.2849014, -1.543525, 1, 0.6078432, 0, 1,
-1.23802, 0.1826557, 0.5252115, 1, 0.6117647, 0, 1,
-1.236479, 0.2429086, 0.1110011, 1, 0.6196079, 0, 1,
-1.231732, 1.486079, 0.7319795, 1, 0.6235294, 0, 1,
-1.230556, 0.5787013, -2.764882, 1, 0.6313726, 0, 1,
-1.229, 0.09368361, -1.038475, 1, 0.6352941, 0, 1,
-1.221491, 0.9739431, -1.140097, 1, 0.6431373, 0, 1,
-1.217779, 0.4852125, -2.77133, 1, 0.6470588, 0, 1,
-1.214808, -0.6217992, -1.643451, 1, 0.654902, 0, 1,
-1.208681, -0.2978415, -2.977363, 1, 0.6588235, 0, 1,
-1.189872, 0.2278454, 0.11901, 1, 0.6666667, 0, 1,
-1.188954, -0.3418393, -1.622579, 1, 0.6705883, 0, 1,
-1.188579, -0.8074185, -0.8996478, 1, 0.6784314, 0, 1,
-1.181209, 0.1273508, -3.154456, 1, 0.682353, 0, 1,
-1.180553, 0.2429073, -1.19307, 1, 0.6901961, 0, 1,
-1.178906, 0.6408013, 0.08929817, 1, 0.6941177, 0, 1,
-1.166489, -0.6391282, -3.036054, 1, 0.7019608, 0, 1,
-1.16569, 0.1260663, -1.644711, 1, 0.7098039, 0, 1,
-1.16527, -2.961046, -2.82883, 1, 0.7137255, 0, 1,
-1.161448, -2.15244, -1.863201, 1, 0.7215686, 0, 1,
-1.154026, -0.2340723, -0.2063567, 1, 0.7254902, 0, 1,
-1.152702, -1.777541, -4.508653, 1, 0.7333333, 0, 1,
-1.152009, 0.1867675, -0.7225828, 1, 0.7372549, 0, 1,
-1.151575, -1.505146, -3.117516, 1, 0.7450981, 0, 1,
-1.149409, -0.8928407, -1.80572, 1, 0.7490196, 0, 1,
-1.142264, -2.324429, -2.327462, 1, 0.7568628, 0, 1,
-1.135728, -0.3541104, -1.469207, 1, 0.7607843, 0, 1,
-1.109019, 1.979067, -0.1481737, 1, 0.7686275, 0, 1,
-1.102677, -1.204564, -2.437486, 1, 0.772549, 0, 1,
-1.100865, 1.092499, -2.547389, 1, 0.7803922, 0, 1,
-1.100572, -1.44653, -3.045704, 1, 0.7843137, 0, 1,
-1.100462, -0.5300561, -1.233593, 1, 0.7921569, 0, 1,
-1.08011, -0.8823636, -1.115351, 1, 0.7960784, 0, 1,
-1.074861, 0.284154, -1.942793, 1, 0.8039216, 0, 1,
-1.074226, 0.08985794, -1.002679, 1, 0.8117647, 0, 1,
-1.071167, 0.2329357, -3.216939, 1, 0.8156863, 0, 1,
-1.065869, -0.006068034, -2.31615, 1, 0.8235294, 0, 1,
-1.064776, 0.4344942, -1.240329, 1, 0.827451, 0, 1,
-1.063492, -0.5976154, -0.6402766, 1, 0.8352941, 0, 1,
-1.060536, 1.368038, -2.700084, 1, 0.8392157, 0, 1,
-1.057674, -0.5928105, -1.676059, 1, 0.8470588, 0, 1,
-1.056113, -1.25968, -3.364249, 1, 0.8509804, 0, 1,
-1.051236, -0.1644071, -0.654768, 1, 0.8588235, 0, 1,
-1.040071, -1.184281, -2.037215, 1, 0.8627451, 0, 1,
-1.03388, -0.1811019, -2.005725, 1, 0.8705882, 0, 1,
-1.033338, -1.038133, -1.855136, 1, 0.8745098, 0, 1,
-1.026583, -2.178154, -2.097067, 1, 0.8823529, 0, 1,
-1.022837, -0.4140475, -2.415065, 1, 0.8862745, 0, 1,
-1.02274, -0.4987403, -3.866488, 1, 0.8941177, 0, 1,
-1.019301, 0.827144, -0.9988049, 1, 0.8980392, 0, 1,
-1.016709, -0.541514, -2.05373, 1, 0.9058824, 0, 1,
-1.015336, -0.9888469, -1.43051, 1, 0.9137255, 0, 1,
-1.007366, -0.8312789, -0.5408288, 1, 0.9176471, 0, 1,
-1.006338, 0.3048049, -2.367525, 1, 0.9254902, 0, 1,
-1.005219, 0.8530909, -1.464604, 1, 0.9294118, 0, 1,
-1.001297, 0.8797229, -1.701338, 1, 0.9372549, 0, 1,
-0.9912865, 0.3368629, -1.848935, 1, 0.9411765, 0, 1,
-0.9892448, -1.189676, -1.981751, 1, 0.9490196, 0, 1,
-0.9802695, 1.244015, -1.520477, 1, 0.9529412, 0, 1,
-0.976046, -1.825712, -4.056992, 1, 0.9607843, 0, 1,
-0.966399, 0.1907532, -2.083504, 1, 0.9647059, 0, 1,
-0.9644779, 0.7170511, -2.089435, 1, 0.972549, 0, 1,
-0.9623226, 0.6213886, -2.273081, 1, 0.9764706, 0, 1,
-0.9598774, 0.8433804, -0.6452376, 1, 0.9843137, 0, 1,
-0.9577214, 1.729203, -1.293737, 1, 0.9882353, 0, 1,
-0.9500576, -1.346737, -4.233275, 1, 0.9960784, 0, 1,
-0.9480904, 1.900361, 0.9330366, 0.9960784, 1, 0, 1,
-0.9465996, 0.3323384, -1.315409, 0.9921569, 1, 0, 1,
-0.9446686, 0.05770105, -2.043259, 0.9843137, 1, 0, 1,
-0.942505, -0.3807077, -1.376525, 0.9803922, 1, 0, 1,
-0.9408806, -0.4463577, -2.379989, 0.972549, 1, 0, 1,
-0.9397284, -1.061855, -1.518609, 0.9686275, 1, 0, 1,
-0.9382232, 1.628901, 0.6343684, 0.9607843, 1, 0, 1,
-0.934065, 1.873326, -0.8367854, 0.9568627, 1, 0, 1,
-0.9234253, -1.385107, -2.727325, 0.9490196, 1, 0, 1,
-0.9212275, 0.2769889, -2.532497, 0.945098, 1, 0, 1,
-0.9040373, -1.643159, -1.571508, 0.9372549, 1, 0, 1,
-0.9009064, 0.8210388, 0.5147442, 0.9333333, 1, 0, 1,
-0.8989779, -0.4336885, -2.946943, 0.9254902, 1, 0, 1,
-0.8979434, -1.082848, -4.99158, 0.9215686, 1, 0, 1,
-0.8978652, -0.4664298, -1.12585, 0.9137255, 1, 0, 1,
-0.8964917, -0.3021474, -2.909469, 0.9098039, 1, 0, 1,
-0.8928038, -0.1806602, -1.474756, 0.9019608, 1, 0, 1,
-0.891673, -1.576151, -1.741045, 0.8941177, 1, 0, 1,
-0.8861491, 0.3085811, -1.839786, 0.8901961, 1, 0, 1,
-0.8859912, -0.0734293, -3.123606, 0.8823529, 1, 0, 1,
-0.8856521, 1.420197, -1.003666, 0.8784314, 1, 0, 1,
-0.8823215, -0.1076039, 0.06189455, 0.8705882, 1, 0, 1,
-0.8809667, 0.0337602, -1.913475, 0.8666667, 1, 0, 1,
-0.8804855, -0.6430626, -1.455734, 0.8588235, 1, 0, 1,
-0.8720745, 0.9786501, -0.8818539, 0.854902, 1, 0, 1,
-0.8666924, -0.01848358, -2.690177, 0.8470588, 1, 0, 1,
-0.8608868, -0.1746141, -2.111776, 0.8431373, 1, 0, 1,
-0.8545539, 0.06654607, -1.344728, 0.8352941, 1, 0, 1,
-0.8527699, -0.6547156, -3.64844, 0.8313726, 1, 0, 1,
-0.8459732, -0.4891772, -2.244138, 0.8235294, 1, 0, 1,
-0.8432186, 2.637227, -0.4169577, 0.8196079, 1, 0, 1,
-0.8249507, -0.1237993, -2.377148, 0.8117647, 1, 0, 1,
-0.8243644, -0.4174909, -3.075848, 0.8078431, 1, 0, 1,
-0.8177806, -0.07462019, -2.33408, 0.8, 1, 0, 1,
-0.8124611, 1.045839, 0.4384932, 0.7921569, 1, 0, 1,
-0.8069325, -1.171171, -2.594633, 0.7882353, 1, 0, 1,
-0.8030601, 0.9278722, -0.2393, 0.7803922, 1, 0, 1,
-0.8029428, 1.089825, -3.562484, 0.7764706, 1, 0, 1,
-0.8028685, -0.8199431, -2.174304, 0.7686275, 1, 0, 1,
-0.8027205, 0.8940477, -1.301135, 0.7647059, 1, 0, 1,
-0.7986587, 0.409059, -0.3082013, 0.7568628, 1, 0, 1,
-0.7936231, 0.862237, 0.0009366107, 0.7529412, 1, 0, 1,
-0.7934902, -0.7407381, -1.483642, 0.7450981, 1, 0, 1,
-0.7889115, -0.529184, -2.944395, 0.7411765, 1, 0, 1,
-0.7876765, 1.167125, -1.652478, 0.7333333, 1, 0, 1,
-0.7858509, 0.2730726, -2.333043, 0.7294118, 1, 0, 1,
-0.783456, -0.2773257, -2.082644, 0.7215686, 1, 0, 1,
-0.7799938, 0.3431323, -0.6522754, 0.7176471, 1, 0, 1,
-0.7744761, 1.252549, -1.944476, 0.7098039, 1, 0, 1,
-0.7723274, 0.6508937, 0.3024458, 0.7058824, 1, 0, 1,
-0.7697882, 0.5107056, -1.878929, 0.6980392, 1, 0, 1,
-0.7662104, -0.8863803, -3.920429, 0.6901961, 1, 0, 1,
-0.7615315, -0.3409953, -0.8740041, 0.6862745, 1, 0, 1,
-0.7590307, 0.6201697, -0.8136483, 0.6784314, 1, 0, 1,
-0.7570387, -0.0981679, -2.435796, 0.6745098, 1, 0, 1,
-0.746793, -0.1418082, -1.612366, 0.6666667, 1, 0, 1,
-0.7439051, 1.172498, -0.36687, 0.6627451, 1, 0, 1,
-0.7421492, 1.762945, -1.928197, 0.654902, 1, 0, 1,
-0.7393874, 0.4512047, -2.014443, 0.6509804, 1, 0, 1,
-0.7380615, -1.162423, -4.049895, 0.6431373, 1, 0, 1,
-0.7307596, -1.833027, -1.914901, 0.6392157, 1, 0, 1,
-0.7293061, 0.8557651, -0.7760082, 0.6313726, 1, 0, 1,
-0.724214, -1.211788, -1.810102, 0.627451, 1, 0, 1,
-0.7222185, 1.182337, -0.4754732, 0.6196079, 1, 0, 1,
-0.721979, 1.346552, 0.7731712, 0.6156863, 1, 0, 1,
-0.7218204, -0.2412318, -1.971351, 0.6078432, 1, 0, 1,
-0.7164104, -0.965693, -2.591771, 0.6039216, 1, 0, 1,
-0.7158786, 0.8900773, -0.09657004, 0.5960785, 1, 0, 1,
-0.7114384, 0.3089642, -1.894216, 0.5882353, 1, 0, 1,
-0.706952, -0.583869, -1.576681, 0.5843138, 1, 0, 1,
-0.7049583, -0.2885348, -0.4688225, 0.5764706, 1, 0, 1,
-0.7020848, -0.07916713, -3.073051, 0.572549, 1, 0, 1,
-0.6915764, 0.4451673, -1.866225, 0.5647059, 1, 0, 1,
-0.6897489, -0.8644883, -1.970167, 0.5607843, 1, 0, 1,
-0.6887848, -0.6584688, -2.138688, 0.5529412, 1, 0, 1,
-0.688422, -0.3426984, -1.3498, 0.5490196, 1, 0, 1,
-0.6869996, -0.1090589, -1.139693, 0.5411765, 1, 0, 1,
-0.6800632, 0.5289928, -1.534751, 0.5372549, 1, 0, 1,
-0.6739404, 0.8526046, 0.2975727, 0.5294118, 1, 0, 1,
-0.6729536, -1.420251, -1.147517, 0.5254902, 1, 0, 1,
-0.6720836, -0.1068018, -0.3980682, 0.5176471, 1, 0, 1,
-0.6611679, -0.6914016, -2.148121, 0.5137255, 1, 0, 1,
-0.6529432, -1.043223, -1.647358, 0.5058824, 1, 0, 1,
-0.6499505, -0.1109088, -1.481468, 0.5019608, 1, 0, 1,
-0.6494234, -1.698396, -3.327277, 0.4941176, 1, 0, 1,
-0.6491984, -0.5380272, -2.706912, 0.4862745, 1, 0, 1,
-0.6459513, -0.5923905, -1.505401, 0.4823529, 1, 0, 1,
-0.6436929, -1.962331, -1.015512, 0.4745098, 1, 0, 1,
-0.6413842, 0.176319, -0.5944783, 0.4705882, 1, 0, 1,
-0.6399094, 0.6733742, -1.801389, 0.4627451, 1, 0, 1,
-0.6356779, -0.2290438, -1.218437, 0.4588235, 1, 0, 1,
-0.6350775, 1.100732, -0.1602465, 0.4509804, 1, 0, 1,
-0.6319706, -1.693923, -3.706223, 0.4470588, 1, 0, 1,
-0.6286265, -0.423585, -2.059832, 0.4392157, 1, 0, 1,
-0.6246514, 0.02861862, -3.31348, 0.4352941, 1, 0, 1,
-0.6229907, 1.910984, -0.3340536, 0.427451, 1, 0, 1,
-0.6192171, -0.74294, -1.188272, 0.4235294, 1, 0, 1,
-0.6151491, -0.8806869, -2.990546, 0.4156863, 1, 0, 1,
-0.6141628, 0.1151895, -0.9503005, 0.4117647, 1, 0, 1,
-0.6113138, -1.327844, -1.856763, 0.4039216, 1, 0, 1,
-0.6081214, 1.296119, -1.525384, 0.3960784, 1, 0, 1,
-0.607941, 0.6178142, -1.824794, 0.3921569, 1, 0, 1,
-0.6076397, 0.7396094, 0.3365598, 0.3843137, 1, 0, 1,
-0.6034111, -0.4278989, -2.217794, 0.3803922, 1, 0, 1,
-0.6031618, 0.5240969, -1.015787, 0.372549, 1, 0, 1,
-0.600723, -1.714873, -3.327718, 0.3686275, 1, 0, 1,
-0.5968674, 0.2672961, -0.4035471, 0.3607843, 1, 0, 1,
-0.5961124, -1.211102, -1.829795, 0.3568628, 1, 0, 1,
-0.59498, 0.431228, -1.773922, 0.3490196, 1, 0, 1,
-0.586156, 0.2476673, 0.2190635, 0.345098, 1, 0, 1,
-0.585129, 0.004146374, -0.7878447, 0.3372549, 1, 0, 1,
-0.5845325, -0.7713283, -1.95591, 0.3333333, 1, 0, 1,
-0.5843012, -2.489763, -1.490883, 0.3254902, 1, 0, 1,
-0.5781791, 1.882774, -0.8599914, 0.3215686, 1, 0, 1,
-0.5741435, -1.056552, -1.951345, 0.3137255, 1, 0, 1,
-0.5712901, 1.182868, -0.04167024, 0.3098039, 1, 0, 1,
-0.5712566, 1.242608, 0.1463176, 0.3019608, 1, 0, 1,
-0.5650241, 0.139666, 0.6175947, 0.2941177, 1, 0, 1,
-0.5642166, 0.8600644, -0.050758, 0.2901961, 1, 0, 1,
-0.5633193, 0.165527, 1.791115, 0.282353, 1, 0, 1,
-0.5613701, -1.236433, -3.065216, 0.2784314, 1, 0, 1,
-0.5563158, 1.058428, -0.9689055, 0.2705882, 1, 0, 1,
-0.5523087, 0.5597928, -2.221383, 0.2666667, 1, 0, 1,
-0.5498198, 0.8895317, -1.365812, 0.2588235, 1, 0, 1,
-0.5496557, -1.976312, -2.15171, 0.254902, 1, 0, 1,
-0.5481876, 0.6867074, -1.238151, 0.2470588, 1, 0, 1,
-0.5480779, 1.366101, 1.33042, 0.2431373, 1, 0, 1,
-0.5427043, -0.09988269, -1.595126, 0.2352941, 1, 0, 1,
-0.5410408, 0.2530223, 0.359124, 0.2313726, 1, 0, 1,
-0.5352966, 0.6974576, 0.5486478, 0.2235294, 1, 0, 1,
-0.5289475, -0.02863532, -1.566889, 0.2196078, 1, 0, 1,
-0.5282878, -1.343757, -2.046157, 0.2117647, 1, 0, 1,
-0.5211047, -0.6151257, -3.755137, 0.2078431, 1, 0, 1,
-0.5210242, 1.349872, -0.6257347, 0.2, 1, 0, 1,
-0.5209392, 0.3179418, -0.4017017, 0.1921569, 1, 0, 1,
-0.5168834, 1.131194, -1.499685, 0.1882353, 1, 0, 1,
-0.5165716, 0.691386, 0.3114443, 0.1803922, 1, 0, 1,
-0.5149454, 0.3541635, -2.15688, 0.1764706, 1, 0, 1,
-0.5141078, -0.8305563, -1.902578, 0.1686275, 1, 0, 1,
-0.5121095, 0.1684135, -1.270077, 0.1647059, 1, 0, 1,
-0.5099196, 1.138924, -1.406966, 0.1568628, 1, 0, 1,
-0.5075881, -1.229348, -3.614321, 0.1529412, 1, 0, 1,
-0.5051141, 0.7261356, -1.733986, 0.145098, 1, 0, 1,
-0.5050421, 0.4516875, -0.6374686, 0.1411765, 1, 0, 1,
-0.5007852, 1.395648, -0.7366412, 0.1333333, 1, 0, 1,
-0.5002892, 0.08657408, -0.0811559, 0.1294118, 1, 0, 1,
-0.4985359, -1.229754, -3.759015, 0.1215686, 1, 0, 1,
-0.4967873, 0.02743973, -0.3843727, 0.1176471, 1, 0, 1,
-0.4936923, -0.8749247, -2.055562, 0.1098039, 1, 0, 1,
-0.4923898, -0.5674859, -2.172084, 0.1058824, 1, 0, 1,
-0.4913524, -0.2517065, -1.193231, 0.09803922, 1, 0, 1,
-0.4880191, 0.5221704, -2.073757, 0.09019608, 1, 0, 1,
-0.4831988, 0.5281798, 0.8833572, 0.08627451, 1, 0, 1,
-0.4825663, 1.436268, -0.7741572, 0.07843138, 1, 0, 1,
-0.4804929, -0.311646, -0.9085104, 0.07450981, 1, 0, 1,
-0.4761601, -1.428329, -3.994773, 0.06666667, 1, 0, 1,
-0.4741046, 0.09402631, -1.623405, 0.0627451, 1, 0, 1,
-0.4694078, -0.01632016, -0.4387522, 0.05490196, 1, 0, 1,
-0.4671245, 3.001112, 0.007362744, 0.05098039, 1, 0, 1,
-0.4656317, 0.3096793, 0.5212762, 0.04313726, 1, 0, 1,
-0.4594949, 1.346825, -0.5331435, 0.03921569, 1, 0, 1,
-0.4584711, -0.1026033, -1.229663, 0.03137255, 1, 0, 1,
-0.4575264, -0.8376411, -2.178739, 0.02745098, 1, 0, 1,
-0.4547989, -1.962762, -5.023508, 0.01960784, 1, 0, 1,
-0.4533305, 0.3405113, -1.192307, 0.01568628, 1, 0, 1,
-0.4515135, 0.06837772, -1.677125, 0.007843138, 1, 0, 1,
-0.4507451, -1.320101, -4.974365, 0.003921569, 1, 0, 1,
-0.4502198, -0.8543361, -3.676405, 0, 1, 0.003921569, 1,
-0.4475752, -1.109604, -0.9756479, 0, 1, 0.01176471, 1,
-0.4433888, -1.586316, -2.768761, 0, 1, 0.01568628, 1,
-0.4384585, 0.1797058, -0.5502056, 0, 1, 0.02352941, 1,
-0.4347101, -0.309764, -1.226012, 0, 1, 0.02745098, 1,
-0.4320088, 0.3463663, -2.803258, 0, 1, 0.03529412, 1,
-0.4286239, 1.459408, 0.1942711, 0, 1, 0.03921569, 1,
-0.4265746, -0.6335946, -3.840065, 0, 1, 0.04705882, 1,
-0.4180076, 0.6134685, -1.849544, 0, 1, 0.05098039, 1,
-0.4177351, 0.1642474, -0.6470256, 0, 1, 0.05882353, 1,
-0.4116163, -1.282495, -3.048427, 0, 1, 0.0627451, 1,
-0.4061019, 0.07207517, -0.9325885, 0, 1, 0.07058824, 1,
-0.4017612, -0.7890617, -1.923336, 0, 1, 0.07450981, 1,
-0.3996682, 0.3282546, -0.6095048, 0, 1, 0.08235294, 1,
-0.3993685, -0.6808068, -3.425359, 0, 1, 0.08627451, 1,
-0.3989567, -1.179304, -2.969497, 0, 1, 0.09411765, 1,
-0.3983735, -0.9813663, -4.141669, 0, 1, 0.1019608, 1,
-0.3934671, -0.5333681, -0.4711553, 0, 1, 0.1058824, 1,
-0.3915899, 0.01444499, -2.030571, 0, 1, 0.1137255, 1,
-0.3913007, 0.4912639, -0.7265742, 0, 1, 0.1176471, 1,
-0.3884768, 0.617405, -1.937789, 0, 1, 0.1254902, 1,
-0.3880118, -0.5807664, -3.546569, 0, 1, 0.1294118, 1,
-0.3824351, 1.888967, 0.589633, 0, 1, 0.1372549, 1,
-0.3799845, 0.06739751, 0.1002296, 0, 1, 0.1411765, 1,
-0.3768755, -0.06945598, -2.892195, 0, 1, 0.1490196, 1,
-0.3734334, -0.6504114, -1.138744, 0, 1, 0.1529412, 1,
-0.3717279, 0.8386886, -2.83538, 0, 1, 0.1607843, 1,
-0.3714501, 0.4222975, -1.032633, 0, 1, 0.1647059, 1,
-0.3676136, 1.214304, 1.325426, 0, 1, 0.172549, 1,
-0.3662364, -0.7766408, -1.938509, 0, 1, 0.1764706, 1,
-0.3645844, -0.5515645, -2.889631, 0, 1, 0.1843137, 1,
-0.3628038, 1.578594, -1.027081, 0, 1, 0.1882353, 1,
-0.3625776, 0.04520958, -1.606532, 0, 1, 0.1960784, 1,
-0.3602024, 1.304484, -0.7029036, 0, 1, 0.2039216, 1,
-0.3593909, -0.1275216, -0.9112443, 0, 1, 0.2078431, 1,
-0.358009, 0.6595458, 0.03548044, 0, 1, 0.2156863, 1,
-0.3571528, -0.3134644, -0.7717181, 0, 1, 0.2196078, 1,
-0.3567155, -0.1892167, -2.962648, 0, 1, 0.227451, 1,
-0.3554528, -0.09034564, -1.888102, 0, 1, 0.2313726, 1,
-0.3550169, -0.7331049, -3.803206, 0, 1, 0.2392157, 1,
-0.3528531, 0.875717, 0.4646752, 0, 1, 0.2431373, 1,
-0.3476032, 1.809321, 0.09603084, 0, 1, 0.2509804, 1,
-0.3474226, 0.2801904, -0.6064736, 0, 1, 0.254902, 1,
-0.3437748, -0.1585743, -1.334037, 0, 1, 0.2627451, 1,
-0.343352, 0.2530212, -2.519624, 0, 1, 0.2666667, 1,
-0.3426534, -0.3655578, -2.713816, 0, 1, 0.2745098, 1,
-0.3409253, -0.9614573, -2.875267, 0, 1, 0.2784314, 1,
-0.3349534, 1.397036, -0.1331835, 0, 1, 0.2862745, 1,
-0.3330288, -1.120626, -2.635681, 0, 1, 0.2901961, 1,
-0.324111, -0.7974237, -1.760879, 0, 1, 0.2980392, 1,
-0.3204728, -0.08921478, -2.8338, 0, 1, 0.3058824, 1,
-0.3202577, 0.09827854, -1.596957, 0, 1, 0.3098039, 1,
-0.3185883, -0.04128792, -0.4634355, 0, 1, 0.3176471, 1,
-0.3058621, 0.5436002, -0.6509171, 0, 1, 0.3215686, 1,
-0.3028861, 1.059975, -0.7249221, 0, 1, 0.3294118, 1,
-0.3008348, -0.9128243, -3.022401, 0, 1, 0.3333333, 1,
-0.2984553, -1.097812, -1.890675, 0, 1, 0.3411765, 1,
-0.2977465, -1.445768, -3.728442, 0, 1, 0.345098, 1,
-0.2966339, 0.5713902, -1.676057, 0, 1, 0.3529412, 1,
-0.2947994, -1.657608, -3.100931, 0, 1, 0.3568628, 1,
-0.2930295, -1.802711, -3.997424, 0, 1, 0.3647059, 1,
-0.292897, 1.032707, 0.4183185, 0, 1, 0.3686275, 1,
-0.2889655, -2.06383, -1.77915, 0, 1, 0.3764706, 1,
-0.28611, -1.553702, -4.651863, 0, 1, 0.3803922, 1,
-0.2769906, 0.7071013, -0.12748, 0, 1, 0.3882353, 1,
-0.2757936, 0.4924291, 0.09154092, 0, 1, 0.3921569, 1,
-0.2756289, 0.6568277, -0.3854608, 0, 1, 0.4, 1,
-0.2729955, 0.9957944, 0.6221634, 0, 1, 0.4078431, 1,
-0.2729625, 0.4238511, -2.387895, 0, 1, 0.4117647, 1,
-0.2721311, -0.5816315, -2.347922, 0, 1, 0.4196078, 1,
-0.2671075, 1.240096, -0.506917, 0, 1, 0.4235294, 1,
-0.2668319, -0.1209409, -2.535507, 0, 1, 0.4313726, 1,
-0.2659221, -0.1797632, -3.450352, 0, 1, 0.4352941, 1,
-0.2647108, 0.1467196, -1.042497, 0, 1, 0.4431373, 1,
-0.2644443, 0.5871492, 1.200033, 0, 1, 0.4470588, 1,
-0.2611388, 0.0003172287, -2.099401, 0, 1, 0.454902, 1,
-0.2592046, 0.6671469, -1.588007, 0, 1, 0.4588235, 1,
-0.255556, -0.6374053, -3.049767, 0, 1, 0.4666667, 1,
-0.2541367, 0.609654, -0.8695557, 0, 1, 0.4705882, 1,
-0.2499579, -0.3843683, -3.438975, 0, 1, 0.4784314, 1,
-0.2484857, -0.9940487, -3.122054, 0, 1, 0.4823529, 1,
-0.2475282, 1.263519, -0.04698366, 0, 1, 0.4901961, 1,
-0.2474229, -1.088863, -3.619632, 0, 1, 0.4941176, 1,
-0.2452583, 0.8163175, 0.6000841, 0, 1, 0.5019608, 1,
-0.2442405, 0.006664443, -2.810121, 0, 1, 0.509804, 1,
-0.2422385, -0.1154297, -2.933925, 0, 1, 0.5137255, 1,
-0.2407761, 0.2881545, -2.23188, 0, 1, 0.5215687, 1,
-0.2396221, 0.4355935, -1.254406, 0, 1, 0.5254902, 1,
-0.2384435, -1.113091, -3.367645, 0, 1, 0.5333334, 1,
-0.2372859, -0.8279703, -3.467936, 0, 1, 0.5372549, 1,
-0.2360798, -0.4530804, -2.69033, 0, 1, 0.5450981, 1,
-0.2357761, -0.2707501, -0.7879288, 0, 1, 0.5490196, 1,
-0.2332298, 0.2852349, -1.744025, 0, 1, 0.5568628, 1,
-0.2328619, 0.744163, 0.3553394, 0, 1, 0.5607843, 1,
-0.2308164, -0.9929457, -2.780494, 0, 1, 0.5686275, 1,
-0.2300685, 1.052478, -0.2518889, 0, 1, 0.572549, 1,
-0.2285551, 0.622962, -0.8702485, 0, 1, 0.5803922, 1,
-0.2269672, 0.6039525, 0.361315, 0, 1, 0.5843138, 1,
-0.2269133, 0.9310782, -1.726063, 0, 1, 0.5921569, 1,
-0.2263696, 0.01865268, -0.1557365, 0, 1, 0.5960785, 1,
-0.2187263, -0.2255462, -0.9174845, 0, 1, 0.6039216, 1,
-0.2185803, -0.9196098, -1.879618, 0, 1, 0.6117647, 1,
-0.2175979, -2.222262, -1.771087, 0, 1, 0.6156863, 1,
-0.216023, 1.924586, -0.24533, 0, 1, 0.6235294, 1,
-0.2145342, -0.5312363, -3.643346, 0, 1, 0.627451, 1,
-0.2120887, 0.8426676, 0.006611508, 0, 1, 0.6352941, 1,
-0.2120291, -1.068156, -4.276164, 0, 1, 0.6392157, 1,
-0.2116258, -0.1521174, -1.81569, 0, 1, 0.6470588, 1,
-0.2114833, 1.430509, -0.8671947, 0, 1, 0.6509804, 1,
-0.2112536, -0.2444427, -2.458627, 0, 1, 0.6588235, 1,
-0.2108112, 0.7016865, -0.2616095, 0, 1, 0.6627451, 1,
-0.2106137, 0.3414932, -0.6716521, 0, 1, 0.6705883, 1,
-0.2096345, 0.3520404, -0.3285359, 0, 1, 0.6745098, 1,
-0.2086001, -1.110488, -2.063853, 0, 1, 0.682353, 1,
-0.2085548, 0.08616932, -2.39524, 0, 1, 0.6862745, 1,
-0.2079408, -0.3148595, -2.824597, 0, 1, 0.6941177, 1,
-0.1969278, 1.642166, 0.4948635, 0, 1, 0.7019608, 1,
-0.1945857, 0.6640235, 2.525532, 0, 1, 0.7058824, 1,
-0.192322, 0.5453038, -2.349749, 0, 1, 0.7137255, 1,
-0.1883121, -0.3852949, -1.834374, 0, 1, 0.7176471, 1,
-0.1855561, -0.4795797, -3.471759, 0, 1, 0.7254902, 1,
-0.1847225, -0.3386189, -1.247108, 0, 1, 0.7294118, 1,
-0.1839909, 0.3711284, -0.9637229, 0, 1, 0.7372549, 1,
-0.1792087, -0.2058479, -1.281963, 0, 1, 0.7411765, 1,
-0.1747262, -1.336974, -3.719147, 0, 1, 0.7490196, 1,
-0.1715439, -0.6998518, -2.77274, 0, 1, 0.7529412, 1,
-0.1610791, -1.333916, -4.01076, 0, 1, 0.7607843, 1,
-0.1601983, -0.3172362, -2.489733, 0, 1, 0.7647059, 1,
-0.1599663, 1.114375, -0.03633329, 0, 1, 0.772549, 1,
-0.157903, 2.850063, 1.710333, 0, 1, 0.7764706, 1,
-0.157306, 0.7382109, -0.2355779, 0, 1, 0.7843137, 1,
-0.1565719, 0.6484575, 0.9212275, 0, 1, 0.7882353, 1,
-0.1562257, 1.228073, -0.1730328, 0, 1, 0.7960784, 1,
-0.1478281, 0.934159, 1.168374, 0, 1, 0.8039216, 1,
-0.143993, -0.09555697, -0.8819766, 0, 1, 0.8078431, 1,
-0.1357721, -0.06472935, -2.620435, 0, 1, 0.8156863, 1,
-0.1316172, 0.2876712, 0.4871356, 0, 1, 0.8196079, 1,
-0.1315341, -0.8959964, -3.505577, 0, 1, 0.827451, 1,
-0.1309825, -2.182667, -1.984756, 0, 1, 0.8313726, 1,
-0.1297266, 1.246965, 0.1282885, 0, 1, 0.8392157, 1,
-0.118012, 2.359283, 0.5121165, 0, 1, 0.8431373, 1,
-0.1177446, -0.7219864, -3.0883, 0, 1, 0.8509804, 1,
-0.1170854, -0.5119981, -0.6288685, 0, 1, 0.854902, 1,
-0.1125174, -1.156798, -3.930228, 0, 1, 0.8627451, 1,
-0.1100233, 0.07463755, -1.045207, 0, 1, 0.8666667, 1,
-0.1083889, 0.7957199, 0.3277665, 0, 1, 0.8745098, 1,
-0.1081485, -0.1964675, -1.876326, 0, 1, 0.8784314, 1,
-0.1029601, -0.2511899, -1.617242, 0, 1, 0.8862745, 1,
-0.1016047, -1.039797, -2.973774, 0, 1, 0.8901961, 1,
-0.1004518, -0.1450535, -2.640336, 0, 1, 0.8980392, 1,
-0.09712056, 0.8408521, -0.5217186, 0, 1, 0.9058824, 1,
-0.09644938, 0.1407521, 0.2839664, 0, 1, 0.9098039, 1,
-0.09392113, -0.9348655, -4.27078, 0, 1, 0.9176471, 1,
-0.08279461, -0.6727994, -2.167802, 0, 1, 0.9215686, 1,
-0.07954849, -0.6162832, -3.626834, 0, 1, 0.9294118, 1,
-0.0780707, -0.003476236, -1.441749, 0, 1, 0.9333333, 1,
-0.07791355, 0.9042939, -0.4139182, 0, 1, 0.9411765, 1,
-0.0737705, -0.2101288, -2.258104, 0, 1, 0.945098, 1,
-0.07338951, -1.947455, -4.421812, 0, 1, 0.9529412, 1,
-0.06768919, 1.820964, 0.1713627, 0, 1, 0.9568627, 1,
-0.06384379, -0.06398661, -3.434292, 0, 1, 0.9647059, 1,
-0.06268418, 0.157093, -1.399341, 0, 1, 0.9686275, 1,
-0.0614865, 2.282025, -1.579106, 0, 1, 0.9764706, 1,
-0.06092203, 0.3578283, 0.3007694, 0, 1, 0.9803922, 1,
-0.06070102, 0.7478291, 0.899833, 0, 1, 0.9882353, 1,
-0.0582251, 0.4240245, 0.3182981, 0, 1, 0.9921569, 1,
-0.05749797, 0.7385666, 1.483146, 0, 1, 1, 1,
-0.05543477, -0.1647368, -0.4724859, 0, 0.9921569, 1, 1,
-0.05378415, -2.209703, -3.662184, 0, 0.9882353, 1, 1,
-0.05354081, -1.746009, -0.8389933, 0, 0.9803922, 1, 1,
-0.05333529, 0.1165477, -1.110899, 0, 0.9764706, 1, 1,
-0.0524276, -0.4467962, -4.063906, 0, 0.9686275, 1, 1,
-0.05195363, -1.0211, -4.325986, 0, 0.9647059, 1, 1,
-0.05150047, 0.3443359, -0.6105855, 0, 0.9568627, 1, 1,
-0.04854662, 1.141943, -0.714067, 0, 0.9529412, 1, 1,
-0.04762375, -0.6788852, -3.285384, 0, 0.945098, 1, 1,
-0.04639538, -0.1652834, -3.278512, 0, 0.9411765, 1, 1,
-0.04523138, 0.6722983, 1.117432, 0, 0.9333333, 1, 1,
-0.04409626, -0.4884761, -2.398896, 0, 0.9294118, 1, 1,
-0.0433837, 1.124493, 0.7702283, 0, 0.9215686, 1, 1,
-0.04301921, 0.3843818, -0.7234697, 0, 0.9176471, 1, 1,
-0.04279304, -0.01144363, -1.496072, 0, 0.9098039, 1, 1,
-0.03634756, -0.2959223, -2.249234, 0, 0.9058824, 1, 1,
-0.03077945, -1.98982, -3.730675, 0, 0.8980392, 1, 1,
-0.03017867, -1.356706, -3.077872, 0, 0.8901961, 1, 1,
-0.02858821, -0.1931905, -1.227595, 0, 0.8862745, 1, 1,
-0.02738908, 2.088766, 0.02449496, 0, 0.8784314, 1, 1,
-0.02696804, 0.4206411, -1.572075, 0, 0.8745098, 1, 1,
-0.02478223, 0.8273478, -0.6057385, 0, 0.8666667, 1, 1,
-0.0240559, -0.1494301, -2.905983, 0, 0.8627451, 1, 1,
-0.02325225, 0.6338223, 1.552857, 0, 0.854902, 1, 1,
-0.02280865, -1.451747, -3.990698, 0, 0.8509804, 1, 1,
-0.02184007, -1.776445, -3.198928, 0, 0.8431373, 1, 1,
-0.02133687, -1.431879, -3.889164, 0, 0.8392157, 1, 1,
-0.01753618, 0.6466758, -2.395159, 0, 0.8313726, 1, 1,
-0.01465475, 0.231053, 1.530961, 0, 0.827451, 1, 1,
-0.01399576, -0.5466434, -3.576305, 0, 0.8196079, 1, 1,
-0.01044, -0.06894505, -3.473805, 0, 0.8156863, 1, 1,
-0.00809301, -0.09042383, -1.896948, 0, 0.8078431, 1, 1,
-0.007450206, 2.115634, -1.565237, 0, 0.8039216, 1, 1,
-0.005295368, -0.3198868, -4.152167, 0, 0.7960784, 1, 1,
-0.004313409, -1.144762, -2.768072, 0, 0.7882353, 1, 1,
-0.001451641, 1.223712, -0.3462914, 0, 0.7843137, 1, 1,
0.0002168737, 0.5440519, 0.4054219, 0, 0.7764706, 1, 1,
0.00545996, -1.488348, 2.328198, 0, 0.772549, 1, 1,
0.005691104, 0.5567377, 0.8918963, 0, 0.7647059, 1, 1,
0.00925006, -1.459201, 2.768065, 0, 0.7607843, 1, 1,
0.01468473, 0.4830023, -1.306174, 0, 0.7529412, 1, 1,
0.01616251, -1.692943, 1.766428, 0, 0.7490196, 1, 1,
0.01629078, 0.820145, 0.8827797, 0, 0.7411765, 1, 1,
0.01744804, 0.1818988, 1.362558, 0, 0.7372549, 1, 1,
0.0202607, -0.9480302, 1.842938, 0, 0.7294118, 1, 1,
0.02037542, -1.849207, 3.679399, 0, 0.7254902, 1, 1,
0.02234782, 1.354785, -0.07999868, 0, 0.7176471, 1, 1,
0.0228747, 1.642998, -0.4967741, 0, 0.7137255, 1, 1,
0.02402648, 2.458493, -0.7496815, 0, 0.7058824, 1, 1,
0.02904595, 1.407226, -0.2344576, 0, 0.6980392, 1, 1,
0.02950384, 0.4788462, -0.08995154, 0, 0.6941177, 1, 1,
0.03022853, -0.5496214, 5.016296, 0, 0.6862745, 1, 1,
0.03407785, 1.117885, -0.005863322, 0, 0.682353, 1, 1,
0.03518509, -0.02648275, 2.444799, 0, 0.6745098, 1, 1,
0.03633147, 2.236473, 0.518918, 0, 0.6705883, 1, 1,
0.04373464, -1.650789, 3.084916, 0, 0.6627451, 1, 1,
0.04786959, -0.2718021, 2.935228, 0, 0.6588235, 1, 1,
0.05077361, 0.5791727, -1.607689, 0, 0.6509804, 1, 1,
0.05316129, 0.2245741, -0.6102989, 0, 0.6470588, 1, 1,
0.05394625, 0.1932137, 0.8839952, 0, 0.6392157, 1, 1,
0.0545533, -1.310022, 3.423621, 0, 0.6352941, 1, 1,
0.05466167, -0.6680002, 0.9113946, 0, 0.627451, 1, 1,
0.05707365, 0.2164628, 1.293529, 0, 0.6235294, 1, 1,
0.06108575, 1.135261, 0.645378, 0, 0.6156863, 1, 1,
0.06702121, -0.13863, 3.12322, 0, 0.6117647, 1, 1,
0.06911192, 2.164042, -0.0572812, 0, 0.6039216, 1, 1,
0.07015121, 0.4381613, 0.8992447, 0, 0.5960785, 1, 1,
0.07472097, -0.8629133, 2.810931, 0, 0.5921569, 1, 1,
0.07530748, -0.62552, 3.32081, 0, 0.5843138, 1, 1,
0.07798645, -0.6940381, 3.001065, 0, 0.5803922, 1, 1,
0.07940624, -1.936826, 2.299025, 0, 0.572549, 1, 1,
0.08045917, 1.079363, -0.7670535, 0, 0.5686275, 1, 1,
0.08083021, 0.6928938, -0.1280459, 0, 0.5607843, 1, 1,
0.081556, 0.9483339, -0.5633302, 0, 0.5568628, 1, 1,
0.0816128, -1.043018, 5.199018, 0, 0.5490196, 1, 1,
0.08218511, -2.28921, 3.128386, 0, 0.5450981, 1, 1,
0.08343356, 0.08219327, 1.186325, 0, 0.5372549, 1, 1,
0.08383465, 0.4190128, 0.6547786, 0, 0.5333334, 1, 1,
0.08405955, -0.09960034, 2.164358, 0, 0.5254902, 1, 1,
0.08981008, 0.5888814, -0.3463659, 0, 0.5215687, 1, 1,
0.09355029, 1.501812, 0.4632739, 0, 0.5137255, 1, 1,
0.09488896, -1.235753, 3.271165, 0, 0.509804, 1, 1,
0.09822592, -0.2421887, 1.742823, 0, 0.5019608, 1, 1,
0.09943918, -0.315753, 3.790067, 0, 0.4941176, 1, 1,
0.1025373, -1.044707, 3.254975, 0, 0.4901961, 1, 1,
0.1051638, 0.3269544, 0.1486202, 0, 0.4823529, 1, 1,
0.1125877, 0.6094137, 0.197021, 0, 0.4784314, 1, 1,
0.1131116, 0.0376234, 1.039708, 0, 0.4705882, 1, 1,
0.1134432, -0.1334651, 4.880742, 0, 0.4666667, 1, 1,
0.1195639, 0.7329347, 1.479758, 0, 0.4588235, 1, 1,
0.1207249, -0.7792659, 4.184088, 0, 0.454902, 1, 1,
0.1226466, 1.307896, 0.460083, 0, 0.4470588, 1, 1,
0.1235934, 0.8541653, -0.351352, 0, 0.4431373, 1, 1,
0.1300276, 0.1147373, 2.11793, 0, 0.4352941, 1, 1,
0.1331287, 1.044729, -0.9678415, 0, 0.4313726, 1, 1,
0.1356669, -0.3113188, 3.001051, 0, 0.4235294, 1, 1,
0.1370863, -0.1672425, 1.905026, 0, 0.4196078, 1, 1,
0.1435612, 0.06040536, 2.648906, 0, 0.4117647, 1, 1,
0.163086, 0.862884, 0.6942933, 0, 0.4078431, 1, 1,
0.1641308, -1.422029, 4.524393, 0, 0.4, 1, 1,
0.17135, 0.7307743, 1.010459, 0, 0.3921569, 1, 1,
0.1739246, 0.5521021, -1.01726, 0, 0.3882353, 1, 1,
0.1767806, -1.700483, 3.005037, 0, 0.3803922, 1, 1,
0.1775825, 1.496394, 0.4820305, 0, 0.3764706, 1, 1,
0.1824193, -0.2273417, 1.921235, 0, 0.3686275, 1, 1,
0.1843632, -0.2746939, 1.170564, 0, 0.3647059, 1, 1,
0.1844918, -0.4324636, 2.515838, 0, 0.3568628, 1, 1,
0.1857183, 0.4022079, 0.5132466, 0, 0.3529412, 1, 1,
0.189405, -1.577074, 2.869493, 0, 0.345098, 1, 1,
0.1894813, -0.5020564, 1.528403, 0, 0.3411765, 1, 1,
0.1903521, 0.1945217, 1.02989, 0, 0.3333333, 1, 1,
0.1909144, 0.3684333, 0.8807332, 0, 0.3294118, 1, 1,
0.1943547, 0.4178687, -0.5430014, 0, 0.3215686, 1, 1,
0.1954943, -1.609564, 1.857185, 0, 0.3176471, 1, 1,
0.196524, 2.116955, 1.438816, 0, 0.3098039, 1, 1,
0.1994606, -0.4549229, 4.005135, 0, 0.3058824, 1, 1,
0.2009635, 1.133556, -1.346286, 0, 0.2980392, 1, 1,
0.2015283, 1.879001, -0.9760541, 0, 0.2901961, 1, 1,
0.2053681, -2.11614, 3.104339, 0, 0.2862745, 1, 1,
0.2079659, 0.6519401, 1.145998, 0, 0.2784314, 1, 1,
0.2110336, -0.4465958, 3.241751, 0, 0.2745098, 1, 1,
0.2150361, -0.05396403, 2.025256, 0, 0.2666667, 1, 1,
0.220541, -0.362635, 1.704339, 0, 0.2627451, 1, 1,
0.2219022, 0.3368739, 0.3921604, 0, 0.254902, 1, 1,
0.2222055, -0.04401701, 1.830297, 0, 0.2509804, 1, 1,
0.2232285, 0.2060492, 1.085233, 0, 0.2431373, 1, 1,
0.2302842, 0.1544393, 1.342753, 0, 0.2392157, 1, 1,
0.230555, -2.405045, 1.573224, 0, 0.2313726, 1, 1,
0.2375459, -1.218411, 3.374633, 0, 0.227451, 1, 1,
0.2386319, 0.1181418, 1.84948, 0, 0.2196078, 1, 1,
0.2389011, 1.991663, 0.0654939, 0, 0.2156863, 1, 1,
0.2448349, 0.5171067, -0.9598915, 0, 0.2078431, 1, 1,
0.2469675, 0.6800582, 1.629737, 0, 0.2039216, 1, 1,
0.2477523, -0.5397486, 3.198842, 0, 0.1960784, 1, 1,
0.2478537, -1.366685, 3.479413, 0, 0.1882353, 1, 1,
0.2503859, -1.17759, 1.338612, 0, 0.1843137, 1, 1,
0.2505967, 0.3261276, 0.1382932, 0, 0.1764706, 1, 1,
0.2536295, 1.479446, -1.509051, 0, 0.172549, 1, 1,
0.2536627, -1.066195, 2.84076, 0, 0.1647059, 1, 1,
0.254497, 0.7803043, 0.8008993, 0, 0.1607843, 1, 1,
0.2575538, 1.250017, -0.01355097, 0, 0.1529412, 1, 1,
0.2576532, -1.308436, 3.24385, 0, 0.1490196, 1, 1,
0.2650006, -1.885119, 2.839934, 0, 0.1411765, 1, 1,
0.2718852, 1.213698, -0.3835506, 0, 0.1372549, 1, 1,
0.2784251, 1.371442, -0.132664, 0, 0.1294118, 1, 1,
0.2857026, 0.4823638, -0.09740978, 0, 0.1254902, 1, 1,
0.2865658, 0.1023743, 1.753733, 0, 0.1176471, 1, 1,
0.2878952, 1.469307, -0.005543943, 0, 0.1137255, 1, 1,
0.2901029, 0.1216338, 2.49523, 0, 0.1058824, 1, 1,
0.2961006, 1.770481, -0.002487236, 0, 0.09803922, 1, 1,
0.2964347, -0.9427915, 4.502248, 0, 0.09411765, 1, 1,
0.2988782, 0.7641609, -0.1613005, 0, 0.08627451, 1, 1,
0.3104675, 0.984405, -0.5155382, 0, 0.08235294, 1, 1,
0.3173842, 0.4559023, 2.278816, 0, 0.07450981, 1, 1,
0.3208731, -1.56709, 1.916769, 0, 0.07058824, 1, 1,
0.3268454, 0.219813, -0.2644399, 0, 0.0627451, 1, 1,
0.3273948, -0.4820013, 2.437396, 0, 0.05882353, 1, 1,
0.3275404, 0.6327125, 2.27417, 0, 0.05098039, 1, 1,
0.32888, 0.09197527, 3.110236, 0, 0.04705882, 1, 1,
0.3292443, 1.528081, 1.409132, 0, 0.03921569, 1, 1,
0.3304035, -0.6424459, 2.686872, 0, 0.03529412, 1, 1,
0.3315144, -1.47672, 4.416751, 0, 0.02745098, 1, 1,
0.3323079, -0.7397936, 3.259569, 0, 0.02352941, 1, 1,
0.3330805, -0.01127788, -0.1655691, 0, 0.01568628, 1, 1,
0.3332221, -0.6663726, 4.037825, 0, 0.01176471, 1, 1,
0.3362939, 0.7490461, 1.489228, 0, 0.003921569, 1, 1,
0.3389829, -0.088636, 2.776259, 0.003921569, 0, 1, 1,
0.3395247, 0.4094725, 0.1205651, 0.007843138, 0, 1, 1,
0.342435, 0.7078734, -0.3126385, 0.01568628, 0, 1, 1,
0.3445978, -0.3387306, 2.798032, 0.01960784, 0, 1, 1,
0.3465629, 0.6213136, -0.4181423, 0.02745098, 0, 1, 1,
0.3482792, 1.139207, 0.5988241, 0.03137255, 0, 1, 1,
0.3532466, -0.3941052, 4.557164, 0.03921569, 0, 1, 1,
0.357496, 0.4380842, -0.03902608, 0.04313726, 0, 1, 1,
0.3588204, 0.2855136, 1.840236, 0.05098039, 0, 1, 1,
0.3619932, 0.3264084, 1.10767, 0.05490196, 0, 1, 1,
0.3677715, 0.2732912, 0.3301861, 0.0627451, 0, 1, 1,
0.3742498, 1.625214, -1.696941, 0.06666667, 0, 1, 1,
0.3818846, -1.363032, 0.7756881, 0.07450981, 0, 1, 1,
0.3925604, -0.6187754, 1.770323, 0.07843138, 0, 1, 1,
0.3970776, -1.586634, 2.002055, 0.08627451, 0, 1, 1,
0.3989757, 0.6706262, 0.6022441, 0.09019608, 0, 1, 1,
0.3990051, 1.428845, -2.608142, 0.09803922, 0, 1, 1,
0.404523, -0.4230485, 3.097088, 0.1058824, 0, 1, 1,
0.4048959, -0.6414663, 3.173412, 0.1098039, 0, 1, 1,
0.4088936, -0.08891448, 1.347266, 0.1176471, 0, 1, 1,
0.4156393, 1.124129, -0.4798557, 0.1215686, 0, 1, 1,
0.4161543, 0.0821269, 1.845777, 0.1294118, 0, 1, 1,
0.4162728, -0.617537, 2.395119, 0.1333333, 0, 1, 1,
0.417384, -0.01448992, 1.754531, 0.1411765, 0, 1, 1,
0.4176128, 1.029033, 0.3988137, 0.145098, 0, 1, 1,
0.417642, -0.4776917, 2.728396, 0.1529412, 0, 1, 1,
0.4219216, 2.779093, 1.442465, 0.1568628, 0, 1, 1,
0.4231701, -0.3170049, 2.610898, 0.1647059, 0, 1, 1,
0.4237627, 1.208001, 1.689749, 0.1686275, 0, 1, 1,
0.4263085, -0.7686677, 5.229363, 0.1764706, 0, 1, 1,
0.4319512, 1.86601, 0.2837124, 0.1803922, 0, 1, 1,
0.4341907, -0.5985438, 2.360553, 0.1882353, 0, 1, 1,
0.4357049, 0.386724, 1.625405, 0.1921569, 0, 1, 1,
0.4388193, -0.4049471, 3.334184, 0.2, 0, 1, 1,
0.4390792, 0.2223338, 1.561372, 0.2078431, 0, 1, 1,
0.4406168, -1.327441, 1.753172, 0.2117647, 0, 1, 1,
0.4419761, 1.428467, 0.8166765, 0.2196078, 0, 1, 1,
0.4441516, 1.456277, 0.6627398, 0.2235294, 0, 1, 1,
0.444363, -0.3994258, 3.213652, 0.2313726, 0, 1, 1,
0.4480208, 1.490305, 0.4835935, 0.2352941, 0, 1, 1,
0.4489839, 1.77721, 0.0003028906, 0.2431373, 0, 1, 1,
0.4613666, -1.855235, 3.331501, 0.2470588, 0, 1, 1,
0.4630216, 1.394226, 0.9227723, 0.254902, 0, 1, 1,
0.4662808, 0.3611996, -0.6276225, 0.2588235, 0, 1, 1,
0.4674791, -0.2240324, 2.023358, 0.2666667, 0, 1, 1,
0.4719619, -0.2425268, 3.9894, 0.2705882, 0, 1, 1,
0.4780201, -0.1258792, 0.8425661, 0.2784314, 0, 1, 1,
0.4787629, -0.482338, 3.258319, 0.282353, 0, 1, 1,
0.4848455, 0.9329077, 1.607234, 0.2901961, 0, 1, 1,
0.4904225, 0.9669682, 0.4840648, 0.2941177, 0, 1, 1,
0.4945908, 0.6957403, 1.025508, 0.3019608, 0, 1, 1,
0.4958036, -1.840944, 2.580961, 0.3098039, 0, 1, 1,
0.4971993, 0.8046499, -0.2373549, 0.3137255, 0, 1, 1,
0.4982338, -0.1918492, 2.372036, 0.3215686, 0, 1, 1,
0.5005696, -0.1032358, 2.052876, 0.3254902, 0, 1, 1,
0.5007681, 0.3856889, -0.189449, 0.3333333, 0, 1, 1,
0.5012228, -0.2539454, -0.4808669, 0.3372549, 0, 1, 1,
0.5015967, -0.3103525, 1.362037, 0.345098, 0, 1, 1,
0.5088671, -0.6716979, 2.07221, 0.3490196, 0, 1, 1,
0.5089593, -0.3110234, 1.940471, 0.3568628, 0, 1, 1,
0.509972, -0.8405696, 0.5242971, 0.3607843, 0, 1, 1,
0.5102775, -0.8927403, 1.715369, 0.3686275, 0, 1, 1,
0.5122785, 0.7020391, 0.5220207, 0.372549, 0, 1, 1,
0.5127263, 1.37409, 0.2161654, 0.3803922, 0, 1, 1,
0.5131441, 0.8092741, 1.817848, 0.3843137, 0, 1, 1,
0.5191274, 0.6088629, 1.139798, 0.3921569, 0, 1, 1,
0.522212, 0.8829638, 0.7277955, 0.3960784, 0, 1, 1,
0.5235142, -0.6612494, 4.350099, 0.4039216, 0, 1, 1,
0.5236036, 1.117875, -1.923722, 0.4117647, 0, 1, 1,
0.5254791, -0.9192671, 1.76845, 0.4156863, 0, 1, 1,
0.5337427, 1.643968, -0.3097811, 0.4235294, 0, 1, 1,
0.543968, -0.8390725, 2.2271, 0.427451, 0, 1, 1,
0.5471714, -0.04039702, 2.654184, 0.4352941, 0, 1, 1,
0.5483491, 0.9244269, -0.08160551, 0.4392157, 0, 1, 1,
0.5574202, -1.156116, 3.25764, 0.4470588, 0, 1, 1,
0.5592982, -0.7057287, 0.7274713, 0.4509804, 0, 1, 1,
0.5641692, -1.452295, 4.109465, 0.4588235, 0, 1, 1,
0.5645125, 0.4408615, 1.958734, 0.4627451, 0, 1, 1,
0.5664632, -1.196772, 1.091528, 0.4705882, 0, 1, 1,
0.5678388, 0.5631413, 0.4898143, 0.4745098, 0, 1, 1,
0.5680476, -1.582984, 3.566203, 0.4823529, 0, 1, 1,
0.5690434, 1.452689, 0.2839716, 0.4862745, 0, 1, 1,
0.5694897, -0.6044086, 3.03734, 0.4941176, 0, 1, 1,
0.5695696, 0.5380007, 1.610911, 0.5019608, 0, 1, 1,
0.5704942, -0.8211548, 1.390682, 0.5058824, 0, 1, 1,
0.573566, 0.443382, 1.624209, 0.5137255, 0, 1, 1,
0.5758825, 0.9991176, 0.0206874, 0.5176471, 0, 1, 1,
0.5797119, -0.6134696, 2.099069, 0.5254902, 0, 1, 1,
0.5858574, 1.092748, 2.103531, 0.5294118, 0, 1, 1,
0.586102, 1.85267, 0.3247754, 0.5372549, 0, 1, 1,
0.5869145, -0.8985614, 2.211189, 0.5411765, 0, 1, 1,
0.5967616, 0.1113174, 0.9184969, 0.5490196, 0, 1, 1,
0.5998425, 1.687418, 0.2620935, 0.5529412, 0, 1, 1,
0.6012089, 0.2039778, 2.142312, 0.5607843, 0, 1, 1,
0.6036733, -1.386913, 2.004397, 0.5647059, 0, 1, 1,
0.6082847, -1.739979, 3.381246, 0.572549, 0, 1, 1,
0.6136609, 1.002277, 0.2947347, 0.5764706, 0, 1, 1,
0.6177618, -1.455978, 2.550199, 0.5843138, 0, 1, 1,
0.6223245, -0.2422518, 2.826419, 0.5882353, 0, 1, 1,
0.624291, -1.035646, 2.904747, 0.5960785, 0, 1, 1,
0.6358062, -0.6861785, 3.385561, 0.6039216, 0, 1, 1,
0.6363128, -0.8399406, 2.426712, 0.6078432, 0, 1, 1,
0.6392403, -1.683784, 3.972838, 0.6156863, 0, 1, 1,
0.6427042, 0.9023526, 1.308301, 0.6196079, 0, 1, 1,
0.6465177, 0.8049405, 1.638734, 0.627451, 0, 1, 1,
0.648333, 1.249825, 1.500846, 0.6313726, 0, 1, 1,
0.6485803, 0.07635564, 1.729959, 0.6392157, 0, 1, 1,
0.6522076, 0.901024, 0.380784, 0.6431373, 0, 1, 1,
0.6533585, -1.124939, 3.295892, 0.6509804, 0, 1, 1,
0.6539614, 0.09474408, 2.121572, 0.654902, 0, 1, 1,
0.6541715, -1.301205, 2.850763, 0.6627451, 0, 1, 1,
0.6584755, -0.1598287, 3.710871, 0.6666667, 0, 1, 1,
0.6584856, -0.6856062, 2.08733, 0.6745098, 0, 1, 1,
0.6586767, -0.2260835, 1.613298, 0.6784314, 0, 1, 1,
0.6645599, -0.3375519, 2.381252, 0.6862745, 0, 1, 1,
0.6669919, 0.8647393, 3.079137, 0.6901961, 0, 1, 1,
0.6689981, -1.302709, 3.620783, 0.6980392, 0, 1, 1,
0.6691778, -0.5585545, 2.531814, 0.7058824, 0, 1, 1,
0.6735247, -0.959433, 2.651472, 0.7098039, 0, 1, 1,
0.6772601, 0.9281434, 0.6012487, 0.7176471, 0, 1, 1,
0.6774883, -0.2474364, 2.477962, 0.7215686, 0, 1, 1,
0.6818353, 0.2083043, 1.804042, 0.7294118, 0, 1, 1,
0.6881939, 0.441845, 1.134878, 0.7333333, 0, 1, 1,
0.6915075, 0.374379, 1.037425, 0.7411765, 0, 1, 1,
0.6916347, 0.6232644, -0.4230776, 0.7450981, 0, 1, 1,
0.6980253, -2.328284, 2.75165, 0.7529412, 0, 1, 1,
0.7005579, 1.56447, -0.2192799, 0.7568628, 0, 1, 1,
0.703548, 0.660394, 2.599921, 0.7647059, 0, 1, 1,
0.7062799, 0.6922653, 0.3097305, 0.7686275, 0, 1, 1,
0.7143694, -0.08853181, -0.90385, 0.7764706, 0, 1, 1,
0.7154759, 1.021889, 1.171931, 0.7803922, 0, 1, 1,
0.7206285, -0.8094395, 2.545381, 0.7882353, 0, 1, 1,
0.7401679, -0.04292927, 1.493431, 0.7921569, 0, 1, 1,
0.7412376, -1.733186, 4.184766, 0.8, 0, 1, 1,
0.7455274, 1.470534, -0.7937757, 0.8078431, 0, 1, 1,
0.7471999, -0.06146363, 2.303909, 0.8117647, 0, 1, 1,
0.7487419, 1.693154, -2.418133, 0.8196079, 0, 1, 1,
0.7513866, -2.241173, 2.135504, 0.8235294, 0, 1, 1,
0.7774333, 1.188015, 0.8594952, 0.8313726, 0, 1, 1,
0.7828672, 0.3759508, 0.9859617, 0.8352941, 0, 1, 1,
0.7889903, -0.2114009, 1.432638, 0.8431373, 0, 1, 1,
0.7898445, -0.2976723, 0.3888425, 0.8470588, 0, 1, 1,
0.79045, -0.5315244, 4.174617, 0.854902, 0, 1, 1,
0.7965197, -0.9347413, 2.737657, 0.8588235, 0, 1, 1,
0.7966305, 0.1647074, 1.607803, 0.8666667, 0, 1, 1,
0.7970648, 0.8201691, 1.397097, 0.8705882, 0, 1, 1,
0.7990389, 2.605064, -0.3012229, 0.8784314, 0, 1, 1,
0.8003133, -0.3894166, 1.283084, 0.8823529, 0, 1, 1,
0.8003938, -1.487871, 3.552577, 0.8901961, 0, 1, 1,
0.8008689, 0.7238288, -0.2115766, 0.8941177, 0, 1, 1,
0.8008772, -0.4556656, 3.109121, 0.9019608, 0, 1, 1,
0.8021641, 0.4798526, 0.8985721, 0.9098039, 0, 1, 1,
0.8031386, 0.2641592, 1.164985, 0.9137255, 0, 1, 1,
0.8075864, 0.187854, 0.8904716, 0.9215686, 0, 1, 1,
0.8163887, 0.005941105, 0.1952458, 0.9254902, 0, 1, 1,
0.8210757, -0.9007035, 1.973207, 0.9333333, 0, 1, 1,
0.8291953, -0.6822153, 3.023461, 0.9372549, 0, 1, 1,
0.8369747, -1.479406, 2.819475, 0.945098, 0, 1, 1,
0.8398275, -0.06253021, 2.147269, 0.9490196, 0, 1, 1,
0.8537122, 0.6383129, -0.511629, 0.9568627, 0, 1, 1,
0.8558633, -0.479339, 3.961901, 0.9607843, 0, 1, 1,
0.8603449, 0.6982886, 0.7943038, 0.9686275, 0, 1, 1,
0.8652154, -0.9128444, 2.877913, 0.972549, 0, 1, 1,
0.8653947, 0.5348396, 2.220205, 0.9803922, 0, 1, 1,
0.8695906, 0.9157643, 0.8216724, 0.9843137, 0, 1, 1,
0.8855988, -0.1155255, 1.82601, 0.9921569, 0, 1, 1,
0.90477, -0.7122678, 0.5994934, 0.9960784, 0, 1, 1,
0.9207422, -0.1169723, 2.579092, 1, 0, 0.9960784, 1,
0.9386477, -1.704872, 2.218485, 1, 0, 0.9882353, 1,
0.9395185, -1.007397, 3.53592, 1, 0, 0.9843137, 1,
0.9425833, 0.2185014, 1.237348, 1, 0, 0.9764706, 1,
0.9464173, -0.4622157, 3.506088, 1, 0, 0.972549, 1,
0.9466566, -0.4966928, 1.694729, 1, 0, 0.9647059, 1,
0.9507706, 1.285453, 1.712782, 1, 0, 0.9607843, 1,
0.9544059, -0.1884418, 3.636733, 1, 0, 0.9529412, 1,
0.9551975, 0.07727633, 0.5539437, 1, 0, 0.9490196, 1,
0.9616975, 1.559245, -0.1407078, 1, 0, 0.9411765, 1,
0.9623883, 1.089392, 0.1734774, 1, 0, 0.9372549, 1,
0.9624504, -0.08274895, 0.8955902, 1, 0, 0.9294118, 1,
0.9628399, 0.7213127, 0.998688, 1, 0, 0.9254902, 1,
0.9628419, -0.615077, 1.662141, 1, 0, 0.9176471, 1,
0.9729671, -0.9338602, 1.563948, 1, 0, 0.9137255, 1,
0.9736922, 0.1149489, 2.062474, 1, 0, 0.9058824, 1,
0.9771078, -0.7697143, 2.224077, 1, 0, 0.9019608, 1,
0.9917842, 1.497725, -0.5997843, 1, 0, 0.8941177, 1,
0.9933894, -0.5898396, 1.849672, 1, 0, 0.8862745, 1,
0.9990873, 1.044144, -0.166868, 1, 0, 0.8823529, 1,
1.0027, -0.1668747, 2.913246, 1, 0, 0.8745098, 1,
1.003824, 1.534649, 2.543933, 1, 0, 0.8705882, 1,
1.010048, -1.182474, 2.162804, 1, 0, 0.8627451, 1,
1.015306, -0.6251027, 0.8269325, 1, 0, 0.8588235, 1,
1.017085, 0.6179097, -0.6437489, 1, 0, 0.8509804, 1,
1.030666, 0.5493816, 1.560622, 1, 0, 0.8470588, 1,
1.032923, -1.56773, 2.450869, 1, 0, 0.8392157, 1,
1.034365, -0.1342717, 2.665514, 1, 0, 0.8352941, 1,
1.038381, 0.814584, 0.6163288, 1, 0, 0.827451, 1,
1.04054, -1.154241, 2.822185, 1, 0, 0.8235294, 1,
1.040596, 0.230491, 4.28516, 1, 0, 0.8156863, 1,
1.044531, 2.416718, 0.9523643, 1, 0, 0.8117647, 1,
1.049013, -0.4157071, 1.815738, 1, 0, 0.8039216, 1,
1.05847, -0.2568118, 2.85346, 1, 0, 0.7960784, 1,
1.06549, 0.07212417, 1.402372, 1, 0, 0.7921569, 1,
1.066052, 2.118844, 0.3893568, 1, 0, 0.7843137, 1,
1.074163, -0.2072424, 2.116317, 1, 0, 0.7803922, 1,
1.086482, 0.4869027, 0.7867581, 1, 0, 0.772549, 1,
1.092734, -0.7196562, 0.3101659, 1, 0, 0.7686275, 1,
1.09303, -2.394213, 1.353117, 1, 0, 0.7607843, 1,
1.094983, -0.1536857, 3.350695, 1, 0, 0.7568628, 1,
1.107887, -0.6215673, 0.8095784, 1, 0, 0.7490196, 1,
1.118608, -0.3676332, 1.242172, 1, 0, 0.7450981, 1,
1.125532, 0.0011183, 2.749389, 1, 0, 0.7372549, 1,
1.144599, -0.2319887, 0.7858163, 1, 0, 0.7333333, 1,
1.162649, 1.03817, -0.3235842, 1, 0, 0.7254902, 1,
1.168754, 1.552816, 1.122729, 1, 0, 0.7215686, 1,
1.173625, 0.2112482, 0.7097458, 1, 0, 0.7137255, 1,
1.174482, 0.2764119, -0.2163327, 1, 0, 0.7098039, 1,
1.176965, -0.6185647, 1.863495, 1, 0, 0.7019608, 1,
1.177626, -2.005629, 0.8408779, 1, 0, 0.6941177, 1,
1.180692, 0.9511287, -1.255096, 1, 0, 0.6901961, 1,
1.183544, 0.7293437, -0.2235768, 1, 0, 0.682353, 1,
1.186834, -1.707715, 3.083296, 1, 0, 0.6784314, 1,
1.189622, -0.7844046, 1.961169, 1, 0, 0.6705883, 1,
1.190671, -0.4100281, 3.582382, 1, 0, 0.6666667, 1,
1.193073, -0.1810666, 1.177445, 1, 0, 0.6588235, 1,
1.195412, 0.3439369, 1.863595, 1, 0, 0.654902, 1,
1.19946, -0.8870647, 2.742629, 1, 0, 0.6470588, 1,
1.200861, -0.3030591, 1.751793, 1, 0, 0.6431373, 1,
1.201757, 0.906, -0.03441153, 1, 0, 0.6352941, 1,
1.202426, 0.3231971, 0.6504874, 1, 0, 0.6313726, 1,
1.21148, -0.3524409, 1.2127, 1, 0, 0.6235294, 1,
1.220537, -0.09357089, 2.050347, 1, 0, 0.6196079, 1,
1.223362, 0.5742781, 1.376342, 1, 0, 0.6117647, 1,
1.223943, -0.5373752, 0.7540439, 1, 0, 0.6078432, 1,
1.227777, -0.8123025, 1.518467, 1, 0, 0.6, 1,
1.237039, 1.060906, -0.0002773849, 1, 0, 0.5921569, 1,
1.241609, 0.3729215, 1.05842, 1, 0, 0.5882353, 1,
1.247051, -0.8362074, 2.696078, 1, 0, 0.5803922, 1,
1.249261, 0.4604058, 2.190809, 1, 0, 0.5764706, 1,
1.249526, 0.8900489, 2.725254, 1, 0, 0.5686275, 1,
1.255313, -0.8296075, 0.5368673, 1, 0, 0.5647059, 1,
1.256042, -0.224272, 2.174082, 1, 0, 0.5568628, 1,
1.264737, 0.9852534, 1.012695, 1, 0, 0.5529412, 1,
1.271233, -0.08020578, 3.177843, 1, 0, 0.5450981, 1,
1.27259, -1.541208, 2.697035, 1, 0, 0.5411765, 1,
1.276658, -0.8046393, 2.921121, 1, 0, 0.5333334, 1,
1.277566, 0.5466511, 2.384347, 1, 0, 0.5294118, 1,
1.298629, 0.9898301, 1.174148, 1, 0, 0.5215687, 1,
1.311008, 0.3996503, 0.04080557, 1, 0, 0.5176471, 1,
1.313022, 0.7370167, 2.070091, 1, 0, 0.509804, 1,
1.321644, 0.5751833, 0.748722, 1, 0, 0.5058824, 1,
1.330165, 0.18466, 1.018538, 1, 0, 0.4980392, 1,
1.33341, -0.8954554, 2.458981, 1, 0, 0.4901961, 1,
1.335243, 0.1431953, 2.317371, 1, 0, 0.4862745, 1,
1.33989, 0.8834225, 1.366027, 1, 0, 0.4784314, 1,
1.34742, -0.05896844, 2.896549, 1, 0, 0.4745098, 1,
1.34771, -0.5487344, 1.614168, 1, 0, 0.4666667, 1,
1.367854, -0.9711486, 2.276156, 1, 0, 0.4627451, 1,
1.368152, 0.1820738, 0.5822266, 1, 0, 0.454902, 1,
1.382727, 0.1894446, 2.121212, 1, 0, 0.4509804, 1,
1.383979, -0.2379617, 1.020143, 1, 0, 0.4431373, 1,
1.386811, -0.2313, 1.104003, 1, 0, 0.4392157, 1,
1.396544, 0.6971104, -0.7259846, 1, 0, 0.4313726, 1,
1.403381, -0.604369, 2.467144, 1, 0, 0.427451, 1,
1.407973, 1.228713, 0.8712919, 1, 0, 0.4196078, 1,
1.408499, 0.4291416, 2.742075, 1, 0, 0.4156863, 1,
1.412529, -1.08654, 3.405957, 1, 0, 0.4078431, 1,
1.426086, -0.6430442, -0.2742813, 1, 0, 0.4039216, 1,
1.429158, 0.5815991, 2.208184, 1, 0, 0.3960784, 1,
1.438236, -0.197733, 2.115356, 1, 0, 0.3882353, 1,
1.44783, 0.2979503, 0.7231853, 1, 0, 0.3843137, 1,
1.464336, -0.02443851, 3.015123, 1, 0, 0.3764706, 1,
1.467819, -0.2699993, 3.596322, 1, 0, 0.372549, 1,
1.494286, 1.412257, -0.2672986, 1, 0, 0.3647059, 1,
1.500932, -0.004438083, 1.050233, 1, 0, 0.3607843, 1,
1.50654, -0.3880345, 0.5788966, 1, 0, 0.3529412, 1,
1.507385, 0.8046004, 0.3805918, 1, 0, 0.3490196, 1,
1.518244, -0.9712794, 4.151219, 1, 0, 0.3411765, 1,
1.525234, 1.184576, 1.870573, 1, 0, 0.3372549, 1,
1.530354, 1.674437, 0.1626156, 1, 0, 0.3294118, 1,
1.531066, 1.058025, 1.42914, 1, 0, 0.3254902, 1,
1.531839, -0.5803997, 0.03372115, 1, 0, 0.3176471, 1,
1.549667, 1.918606, -0.5436177, 1, 0, 0.3137255, 1,
1.549962, -0.964949, 1.060376, 1, 0, 0.3058824, 1,
1.556328, -0.4706, 1.969652, 1, 0, 0.2980392, 1,
1.564034, 1.294588, 1.524619, 1, 0, 0.2941177, 1,
1.589383, 1.249447, 0.1201748, 1, 0, 0.2862745, 1,
1.60702, 0.7160681, 0.6231714, 1, 0, 0.282353, 1,
1.610383, 0.4900833, 0.5448403, 1, 0, 0.2745098, 1,
1.626356, 1.042446, -0.4572981, 1, 0, 0.2705882, 1,
1.638738, 0.4105499, -0.1572396, 1, 0, 0.2627451, 1,
1.644192, -0.3233005, 1.077078, 1, 0, 0.2588235, 1,
1.672862, -0.2449845, 1.014867, 1, 0, 0.2509804, 1,
1.684378, 0.06979126, 3.259807, 1, 0, 0.2470588, 1,
1.703776, -1.775252, 2.780866, 1, 0, 0.2392157, 1,
1.73516, 1.180225, 1.992434, 1, 0, 0.2352941, 1,
1.741393, -0.8529748, 1.440908, 1, 0, 0.227451, 1,
1.746756, -0.2093297, 2.668302, 1, 0, 0.2235294, 1,
1.757434, -1.292681, 2.134124, 1, 0, 0.2156863, 1,
1.758857, -0.06104293, 1.233297, 1, 0, 0.2117647, 1,
1.790407, -0.7964928, 0.5015551, 1, 0, 0.2039216, 1,
1.811424, 0.1971789, 2.337215, 1, 0, 0.1960784, 1,
1.817092, -0.7245359, 1.182076, 1, 0, 0.1921569, 1,
1.84564, -0.7224087, 2.841458, 1, 0, 0.1843137, 1,
1.84967, 0.9323149, 0.5342183, 1, 0, 0.1803922, 1,
1.851003, 0.4851243, 2.690669, 1, 0, 0.172549, 1,
1.869049, 0.2927815, 0.07177903, 1, 0, 0.1686275, 1,
1.871904, 1.142359, 2.012309, 1, 0, 0.1607843, 1,
1.872044, -0.3325805, 0.9350567, 1, 0, 0.1568628, 1,
1.910995, -1.891411, 2.202925, 1, 0, 0.1490196, 1,
1.924568, -0.4284661, 0.6327891, 1, 0, 0.145098, 1,
1.932335, -1.962643, 2.417689, 1, 0, 0.1372549, 1,
1.953856, 1.160092, -0.1253279, 1, 0, 0.1333333, 1,
1.973465, -0.2318924, 1.652651, 1, 0, 0.1254902, 1,
1.980183, -0.3621559, -0.61581, 1, 0, 0.1215686, 1,
2.009965, 0.6886606, 1.693269, 1, 0, 0.1137255, 1,
2.05863, 0.3867189, -0.5882331, 1, 0, 0.1098039, 1,
2.082175, -0.703235, 2.465935, 1, 0, 0.1019608, 1,
2.084961, 1.216546, 1.230038, 1, 0, 0.09411765, 1,
2.097296, -0.8938067, 2.002712, 1, 0, 0.09019608, 1,
2.120662, -1.632635, 1.443917, 1, 0, 0.08235294, 1,
2.309431, -0.5304921, 1.335345, 1, 0, 0.07843138, 1,
2.323409, 0.6877771, 0.8211491, 1, 0, 0.07058824, 1,
2.335654, -0.984473, 2.358969, 1, 0, 0.06666667, 1,
2.35896, 1.032729, 1.473757, 1, 0, 0.05882353, 1,
2.479182, 0.4676732, 1.570764, 1, 0, 0.05490196, 1,
2.502316, -0.1443536, 2.545567, 1, 0, 0.04705882, 1,
2.57382, 1.487366, -0.7371684, 1, 0, 0.04313726, 1,
2.625684, -1.142802, 2.397714, 1, 0, 0.03529412, 1,
2.633482, -1.858987, 4.351998, 1, 0, 0.03137255, 1,
2.759447, 2.411195, 1.496218, 1, 0, 0.02352941, 1,
2.94786, 1.831089, 2.460841, 1, 0, 0.01960784, 1,
3.173125, 0.02230894, 1.317137, 1, 0, 0.01176471, 1,
3.397467, -3.011064, 0.3042881, 1, 0, 0.007843138, 1
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
0.1887736, -4.056025, -7.135124, 0, -0.5, 0.5, 0.5,
0.1887736, -4.056025, -7.135124, 1, -0.5, 0.5, 0.5,
0.1887736, -4.056025, -7.135124, 1, 1.5, 0.5, 0.5,
0.1887736, -4.056025, -7.135124, 0, 1.5, 0.5, 0.5
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
-4.107667, 0.07141376, -7.135124, 0, -0.5, 0.5, 0.5,
-4.107667, 0.07141376, -7.135124, 1, -0.5, 0.5, 0.5,
-4.107667, 0.07141376, -7.135124, 1, 1.5, 0.5, 0.5,
-4.107667, 0.07141376, -7.135124, 0, 1.5, 0.5, 0.5
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
-4.107667, -4.056025, -0.05686498, 0, -0.5, 0.5, 0.5,
-4.107667, -4.056025, -0.05686498, 1, -0.5, 0.5, 0.5,
-4.107667, -4.056025, -0.05686498, 1, 1.5, 0.5, 0.5,
-4.107667, -4.056025, -0.05686498, 0, 1.5, 0.5, 0.5
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
-3, -3.103539, -5.50168,
3, -3.103539, -5.50168,
-3, -3.103539, -5.50168,
-3, -3.262286, -5.773921,
-2, -3.103539, -5.50168,
-2, -3.262286, -5.773921,
-1, -3.103539, -5.50168,
-1, -3.262286, -5.773921,
0, -3.103539, -5.50168,
0, -3.262286, -5.773921,
1, -3.103539, -5.50168,
1, -3.262286, -5.773921,
2, -3.103539, -5.50168,
2, -3.262286, -5.773921,
3, -3.103539, -5.50168,
3, -3.262286, -5.773921
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
-3, -3.579782, -6.318402, 0, -0.5, 0.5, 0.5,
-3, -3.579782, -6.318402, 1, -0.5, 0.5, 0.5,
-3, -3.579782, -6.318402, 1, 1.5, 0.5, 0.5,
-3, -3.579782, -6.318402, 0, 1.5, 0.5, 0.5,
-2, -3.579782, -6.318402, 0, -0.5, 0.5, 0.5,
-2, -3.579782, -6.318402, 1, -0.5, 0.5, 0.5,
-2, -3.579782, -6.318402, 1, 1.5, 0.5, 0.5,
-2, -3.579782, -6.318402, 0, 1.5, 0.5, 0.5,
-1, -3.579782, -6.318402, 0, -0.5, 0.5, 0.5,
-1, -3.579782, -6.318402, 1, -0.5, 0.5, 0.5,
-1, -3.579782, -6.318402, 1, 1.5, 0.5, 0.5,
-1, -3.579782, -6.318402, 0, 1.5, 0.5, 0.5,
0, -3.579782, -6.318402, 0, -0.5, 0.5, 0.5,
0, -3.579782, -6.318402, 1, -0.5, 0.5, 0.5,
0, -3.579782, -6.318402, 1, 1.5, 0.5, 0.5,
0, -3.579782, -6.318402, 0, 1.5, 0.5, 0.5,
1, -3.579782, -6.318402, 0, -0.5, 0.5, 0.5,
1, -3.579782, -6.318402, 1, -0.5, 0.5, 0.5,
1, -3.579782, -6.318402, 1, 1.5, 0.5, 0.5,
1, -3.579782, -6.318402, 0, 1.5, 0.5, 0.5,
2, -3.579782, -6.318402, 0, -0.5, 0.5, 0.5,
2, -3.579782, -6.318402, 1, -0.5, 0.5, 0.5,
2, -3.579782, -6.318402, 1, 1.5, 0.5, 0.5,
2, -3.579782, -6.318402, 0, 1.5, 0.5, 0.5,
3, -3.579782, -6.318402, 0, -0.5, 0.5, 0.5,
3, -3.579782, -6.318402, 1, -0.5, 0.5, 0.5,
3, -3.579782, -6.318402, 1, 1.5, 0.5, 0.5,
3, -3.579782, -6.318402, 0, 1.5, 0.5, 0.5
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
-3.116181, -3, -5.50168,
-3.116181, 3, -5.50168,
-3.116181, -3, -5.50168,
-3.281428, -3, -5.773921,
-3.116181, -2, -5.50168,
-3.281428, -2, -5.773921,
-3.116181, -1, -5.50168,
-3.281428, -1, -5.773921,
-3.116181, 0, -5.50168,
-3.281428, 0, -5.773921,
-3.116181, 1, -5.50168,
-3.281428, 1, -5.773921,
-3.116181, 2, -5.50168,
-3.281428, 2, -5.773921,
-3.116181, 3, -5.50168,
-3.281428, 3, -5.773921
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
-3.611924, -3, -6.318402, 0, -0.5, 0.5, 0.5,
-3.611924, -3, -6.318402, 1, -0.5, 0.5, 0.5,
-3.611924, -3, -6.318402, 1, 1.5, 0.5, 0.5,
-3.611924, -3, -6.318402, 0, 1.5, 0.5, 0.5,
-3.611924, -2, -6.318402, 0, -0.5, 0.5, 0.5,
-3.611924, -2, -6.318402, 1, -0.5, 0.5, 0.5,
-3.611924, -2, -6.318402, 1, 1.5, 0.5, 0.5,
-3.611924, -2, -6.318402, 0, 1.5, 0.5, 0.5,
-3.611924, -1, -6.318402, 0, -0.5, 0.5, 0.5,
-3.611924, -1, -6.318402, 1, -0.5, 0.5, 0.5,
-3.611924, -1, -6.318402, 1, 1.5, 0.5, 0.5,
-3.611924, -1, -6.318402, 0, 1.5, 0.5, 0.5,
-3.611924, 0, -6.318402, 0, -0.5, 0.5, 0.5,
-3.611924, 0, -6.318402, 1, -0.5, 0.5, 0.5,
-3.611924, 0, -6.318402, 1, 1.5, 0.5, 0.5,
-3.611924, 0, -6.318402, 0, 1.5, 0.5, 0.5,
-3.611924, 1, -6.318402, 0, -0.5, 0.5, 0.5,
-3.611924, 1, -6.318402, 1, -0.5, 0.5, 0.5,
-3.611924, 1, -6.318402, 1, 1.5, 0.5, 0.5,
-3.611924, 1, -6.318402, 0, 1.5, 0.5, 0.5,
-3.611924, 2, -6.318402, 0, -0.5, 0.5, 0.5,
-3.611924, 2, -6.318402, 1, -0.5, 0.5, 0.5,
-3.611924, 2, -6.318402, 1, 1.5, 0.5, 0.5,
-3.611924, 2, -6.318402, 0, 1.5, 0.5, 0.5,
-3.611924, 3, -6.318402, 0, -0.5, 0.5, 0.5,
-3.611924, 3, -6.318402, 1, -0.5, 0.5, 0.5,
-3.611924, 3, -6.318402, 1, 1.5, 0.5, 0.5,
-3.611924, 3, -6.318402, 0, 1.5, 0.5, 0.5
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
-3.116181, -3.103539, -4,
-3.116181, -3.103539, 4,
-3.116181, -3.103539, -4,
-3.281428, -3.262286, -4,
-3.116181, -3.103539, -2,
-3.281428, -3.262286, -2,
-3.116181, -3.103539, 0,
-3.281428, -3.262286, 0,
-3.116181, -3.103539, 2,
-3.281428, -3.262286, 2,
-3.116181, -3.103539, 4,
-3.281428, -3.262286, 4
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
-3.611924, -3.579782, -4, 0, -0.5, 0.5, 0.5,
-3.611924, -3.579782, -4, 1, -0.5, 0.5, 0.5,
-3.611924, -3.579782, -4, 1, 1.5, 0.5, 0.5,
-3.611924, -3.579782, -4, 0, 1.5, 0.5, 0.5,
-3.611924, -3.579782, -2, 0, -0.5, 0.5, 0.5,
-3.611924, -3.579782, -2, 1, -0.5, 0.5, 0.5,
-3.611924, -3.579782, -2, 1, 1.5, 0.5, 0.5,
-3.611924, -3.579782, -2, 0, 1.5, 0.5, 0.5,
-3.611924, -3.579782, 0, 0, -0.5, 0.5, 0.5,
-3.611924, -3.579782, 0, 1, -0.5, 0.5, 0.5,
-3.611924, -3.579782, 0, 1, 1.5, 0.5, 0.5,
-3.611924, -3.579782, 0, 0, 1.5, 0.5, 0.5,
-3.611924, -3.579782, 2, 0, -0.5, 0.5, 0.5,
-3.611924, -3.579782, 2, 1, -0.5, 0.5, 0.5,
-3.611924, -3.579782, 2, 1, 1.5, 0.5, 0.5,
-3.611924, -3.579782, 2, 0, 1.5, 0.5, 0.5,
-3.611924, -3.579782, 4, 0, -0.5, 0.5, 0.5,
-3.611924, -3.579782, 4, 1, -0.5, 0.5, 0.5,
-3.611924, -3.579782, 4, 1, 1.5, 0.5, 0.5,
-3.611924, -3.579782, 4, 0, 1.5, 0.5, 0.5
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
-3.116181, -3.103539, -5.50168,
-3.116181, 3.246366, -5.50168,
-3.116181, -3.103539, 5.38795,
-3.116181, 3.246366, 5.38795,
-3.116181, -3.103539, -5.50168,
-3.116181, -3.103539, 5.38795,
-3.116181, 3.246366, -5.50168,
-3.116181, 3.246366, 5.38795,
-3.116181, -3.103539, -5.50168,
3.493728, -3.103539, -5.50168,
-3.116181, -3.103539, 5.38795,
3.493728, -3.103539, 5.38795,
-3.116181, 3.246366, -5.50168,
3.493728, 3.246366, -5.50168,
-3.116181, 3.246366, 5.38795,
3.493728, 3.246366, 5.38795,
3.493728, -3.103539, -5.50168,
3.493728, 3.246366, -5.50168,
3.493728, -3.103539, 5.38795,
3.493728, 3.246366, 5.38795,
3.493728, -3.103539, -5.50168,
3.493728, -3.103539, 5.38795,
3.493728, 3.246366, -5.50168,
3.493728, 3.246366, 5.38795
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
var radius = 7.600482;
var distance = 33.8154;
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
mvMatrix.translate( -0.1887736, -0.07141376, 0.05686498 );
mvMatrix.scale( 1.243253, 1.29416, 0.7546437 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.8154);
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
primisulfuron-methyl<-read.table("primisulfuron-methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-primisulfuron-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'primisulfuron' not found
```

```r
y<-primisulfuron-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'primisulfuron' not found
```

```r
z<-primisulfuron-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'primisulfuron' not found
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
-3.01992, 0.7723323, -1.068901, 0, 0, 1, 1, 1,
-2.653333, -0.06518309, -0.1380505, 1, 0, 0, 1, 1,
-2.563935, -1.864658, -2.054579, 1, 0, 0, 1, 1,
-2.521046, 0.5161473, -2.016741, 1, 0, 0, 1, 1,
-2.466615, 2.234376, -2.040638, 1, 0, 0, 1, 1,
-2.410944, 0.3040172, -1.141985, 1, 0, 0, 1, 1,
-2.375395, -0.6256278, -2.913366, 0, 0, 0, 1, 1,
-2.337258, -1.010427, -0.8553855, 0, 0, 0, 1, 1,
-2.329626, -1.361439, -1.517057, 0, 0, 0, 1, 1,
-2.248313, 0.7014635, -2.348381, 0, 0, 0, 1, 1,
-2.246964, -0.0684177, -2.874268, 0, 0, 0, 1, 1,
-2.197212, 1.58646, -1.995718, 0, 0, 0, 1, 1,
-2.181877, -0.2385829, -1.317843, 0, 0, 0, 1, 1,
-2.180906, 0.2437925, -1.397494, 1, 1, 1, 1, 1,
-2.180849, 0.7695947, -0.236517, 1, 1, 1, 1, 1,
-2.124909, -0.5682206, -0.8634798, 1, 1, 1, 1, 1,
-2.114253, -0.6540606, -1.537415, 1, 1, 1, 1, 1,
-2.074799, -0.838331, -2.517442, 1, 1, 1, 1, 1,
-2.065085, 0.4186773, -3.696424, 1, 1, 1, 1, 1,
-2.048644, -1.329472, -2.306799, 1, 1, 1, 1, 1,
-2.023444, 0.1284652, -2.43763, 1, 1, 1, 1, 1,
-2.022979, 0.6322993, -2.797927, 1, 1, 1, 1, 1,
-2.01647, -1.185292, -1.596892, 1, 1, 1, 1, 1,
-1.997756, -1.206377, -2.13252, 1, 1, 1, 1, 1,
-1.983319, -1.575287, -3.02173, 1, 1, 1, 1, 1,
-1.973015, 0.05643222, -3.278627, 1, 1, 1, 1, 1,
-1.945103, -1.099365, -2.643274, 1, 1, 1, 1, 1,
-1.908968, 1.215042, -0.06409895, 1, 1, 1, 1, 1,
-1.903427, -0.01628, -0.6316418, 0, 0, 1, 1, 1,
-1.877671, -0.9780545, -1.971077, 1, 0, 0, 1, 1,
-1.874177, -2.456538, -2.761061, 1, 0, 0, 1, 1,
-1.859296, 0.3133914, -1.024776, 1, 0, 0, 1, 1,
-1.829138, -0.2335346, -3.424681, 1, 0, 0, 1, 1,
-1.828116, -1.040397, -2.130688, 1, 0, 0, 1, 1,
-1.824752, -0.264226, -2.865042, 0, 0, 0, 1, 1,
-1.782116, 0.1244006, -1.415138, 0, 0, 0, 1, 1,
-1.764025, 0.06170693, -4.090131, 0, 0, 0, 1, 1,
-1.760228, 0.5179741, -0.8359498, 0, 0, 0, 1, 1,
-1.757969, 1.587538, -0.9563138, 0, 0, 0, 1, 1,
-1.751296, 1.349561, -1.432934, 0, 0, 0, 1, 1,
-1.737543, 0.7598411, -0.6401158, 0, 0, 0, 1, 1,
-1.729262, 2.889181, -1.0406, 1, 1, 1, 1, 1,
-1.700754, 0.251034, -2.170933, 1, 1, 1, 1, 1,
-1.679655, 0.7877648, 0.7385677, 1, 1, 1, 1, 1,
-1.652303, -1.043054, -4.29081, 1, 1, 1, 1, 1,
-1.630359, 0.6612002, -2.499476, 1, 1, 1, 1, 1,
-1.626445, -0.4517217, -1.388675, 1, 1, 1, 1, 1,
-1.614817, 0.5572182, -2.953407, 1, 1, 1, 1, 1,
-1.597332, -0.1524712, -2.829132, 1, 1, 1, 1, 1,
-1.590207, 0.1505359, -1.258784, 1, 1, 1, 1, 1,
-1.587826, -0.3891962, -0.4585784, 1, 1, 1, 1, 1,
-1.572548, -0.5991191, -0.2029391, 1, 1, 1, 1, 1,
-1.562715, 0.1657255, 0.115816, 1, 1, 1, 1, 1,
-1.552512, 0.4374405, -2.457172, 1, 1, 1, 1, 1,
-1.549625, -1.287278, -0.7419518, 1, 1, 1, 1, 1,
-1.546552, -0.03330395, -2.398542, 1, 1, 1, 1, 1,
-1.535472, 0.6830438, -0.4667866, 0, 0, 1, 1, 1,
-1.502843, -0.1626372, -2.990253, 1, 0, 0, 1, 1,
-1.499271, -0.6461862, -0.4018363, 1, 0, 0, 1, 1,
-1.49414, 1.587561, -1.094084, 1, 0, 0, 1, 1,
-1.486524, -0.0613094, -1.145175, 1, 0, 0, 1, 1,
-1.482014, -0.646412, -1.616964, 1, 0, 0, 1, 1,
-1.475056, 0.7636122, -1.606291, 0, 0, 0, 1, 1,
-1.474803, -0.5436414, -0.5825187, 0, 0, 0, 1, 1,
-1.455368, 0.4198171, -1.963466, 0, 0, 0, 1, 1,
-1.450189, -0.8518471, -1.792237, 0, 0, 0, 1, 1,
-1.447033, -0.7315044, -3.420591, 0, 0, 0, 1, 1,
-1.432343, -0.9631271, -3.771318, 0, 0, 0, 1, 1,
-1.429304, 0.1026989, -1.330818, 0, 0, 0, 1, 1,
-1.420944, 0.8725182, -0.7204543, 1, 1, 1, 1, 1,
-1.413347, 1.511039, -2.11657, 1, 1, 1, 1, 1,
-1.410786, -2.060085, -2.576072, 1, 1, 1, 1, 1,
-1.408858, 1.398387, 1.992375, 1, 1, 1, 1, 1,
-1.400871, 0.4034941, -0.009191889, 1, 1, 1, 1, 1,
-1.397812, -0.8229335, -2.634469, 1, 1, 1, 1, 1,
-1.391893, 0.0474475, -3.56344, 1, 1, 1, 1, 1,
-1.391704, -0.7596678, -1.682215, 1, 1, 1, 1, 1,
-1.391666, 1.173041, 0.3409809, 1, 1, 1, 1, 1,
-1.385511, -0.08967644, -2.491839, 1, 1, 1, 1, 1,
-1.371328, 3.153892, -0.4866238, 1, 1, 1, 1, 1,
-1.363175, -0.6026356, -3.081235, 1, 1, 1, 1, 1,
-1.354845, -1.35866, -1.090752, 1, 1, 1, 1, 1,
-1.352212, 1.136038, -0.1111164, 1, 1, 1, 1, 1,
-1.349898, 0.2694566, -1.735381, 1, 1, 1, 1, 1,
-1.338497, 1.534117, 0.3271319, 0, 0, 1, 1, 1,
-1.332581, -0.5950685, -2.621539, 1, 0, 0, 1, 1,
-1.33189, -0.0301378, -1.543721, 1, 0, 0, 1, 1,
-1.324596, -1.760393, -2.608098, 1, 0, 0, 1, 1,
-1.321304, 0.4688922, -0.4065297, 1, 0, 0, 1, 1,
-1.317955, -0.2724298, -1.72618, 1, 0, 0, 1, 1,
-1.315158, 1.778851, -1.088909, 0, 0, 0, 1, 1,
-1.313924, 0.377602, -0.5865174, 0, 0, 0, 1, 1,
-1.309315, 0.05743463, 0.3745308, 0, 0, 0, 1, 1,
-1.302888, -0.2091095, -1.590715, 0, 0, 0, 1, 1,
-1.279257, -0.2376791, -3.15699, 0, 0, 0, 1, 1,
-1.279016, -0.1166725, -0.346821, 0, 0, 0, 1, 1,
-1.271341, -0.2437913, -2.709678, 0, 0, 0, 1, 1,
-1.271295, 0.7438703, -2.440085, 1, 1, 1, 1, 1,
-1.26207, 0.5360782, -3.573885, 1, 1, 1, 1, 1,
-1.250102, -1.500528, -5.343093, 1, 1, 1, 1, 1,
-1.245331, -0.08340214, -2.525438, 1, 1, 1, 1, 1,
-1.24238, 0.2849014, -1.543525, 1, 1, 1, 1, 1,
-1.23802, 0.1826557, 0.5252115, 1, 1, 1, 1, 1,
-1.236479, 0.2429086, 0.1110011, 1, 1, 1, 1, 1,
-1.231732, 1.486079, 0.7319795, 1, 1, 1, 1, 1,
-1.230556, 0.5787013, -2.764882, 1, 1, 1, 1, 1,
-1.229, 0.09368361, -1.038475, 1, 1, 1, 1, 1,
-1.221491, 0.9739431, -1.140097, 1, 1, 1, 1, 1,
-1.217779, 0.4852125, -2.77133, 1, 1, 1, 1, 1,
-1.214808, -0.6217992, -1.643451, 1, 1, 1, 1, 1,
-1.208681, -0.2978415, -2.977363, 1, 1, 1, 1, 1,
-1.189872, 0.2278454, 0.11901, 1, 1, 1, 1, 1,
-1.188954, -0.3418393, -1.622579, 0, 0, 1, 1, 1,
-1.188579, -0.8074185, -0.8996478, 1, 0, 0, 1, 1,
-1.181209, 0.1273508, -3.154456, 1, 0, 0, 1, 1,
-1.180553, 0.2429073, -1.19307, 1, 0, 0, 1, 1,
-1.178906, 0.6408013, 0.08929817, 1, 0, 0, 1, 1,
-1.166489, -0.6391282, -3.036054, 1, 0, 0, 1, 1,
-1.16569, 0.1260663, -1.644711, 0, 0, 0, 1, 1,
-1.16527, -2.961046, -2.82883, 0, 0, 0, 1, 1,
-1.161448, -2.15244, -1.863201, 0, 0, 0, 1, 1,
-1.154026, -0.2340723, -0.2063567, 0, 0, 0, 1, 1,
-1.152702, -1.777541, -4.508653, 0, 0, 0, 1, 1,
-1.152009, 0.1867675, -0.7225828, 0, 0, 0, 1, 1,
-1.151575, -1.505146, -3.117516, 0, 0, 0, 1, 1,
-1.149409, -0.8928407, -1.80572, 1, 1, 1, 1, 1,
-1.142264, -2.324429, -2.327462, 1, 1, 1, 1, 1,
-1.135728, -0.3541104, -1.469207, 1, 1, 1, 1, 1,
-1.109019, 1.979067, -0.1481737, 1, 1, 1, 1, 1,
-1.102677, -1.204564, -2.437486, 1, 1, 1, 1, 1,
-1.100865, 1.092499, -2.547389, 1, 1, 1, 1, 1,
-1.100572, -1.44653, -3.045704, 1, 1, 1, 1, 1,
-1.100462, -0.5300561, -1.233593, 1, 1, 1, 1, 1,
-1.08011, -0.8823636, -1.115351, 1, 1, 1, 1, 1,
-1.074861, 0.284154, -1.942793, 1, 1, 1, 1, 1,
-1.074226, 0.08985794, -1.002679, 1, 1, 1, 1, 1,
-1.071167, 0.2329357, -3.216939, 1, 1, 1, 1, 1,
-1.065869, -0.006068034, -2.31615, 1, 1, 1, 1, 1,
-1.064776, 0.4344942, -1.240329, 1, 1, 1, 1, 1,
-1.063492, -0.5976154, -0.6402766, 1, 1, 1, 1, 1,
-1.060536, 1.368038, -2.700084, 0, 0, 1, 1, 1,
-1.057674, -0.5928105, -1.676059, 1, 0, 0, 1, 1,
-1.056113, -1.25968, -3.364249, 1, 0, 0, 1, 1,
-1.051236, -0.1644071, -0.654768, 1, 0, 0, 1, 1,
-1.040071, -1.184281, -2.037215, 1, 0, 0, 1, 1,
-1.03388, -0.1811019, -2.005725, 1, 0, 0, 1, 1,
-1.033338, -1.038133, -1.855136, 0, 0, 0, 1, 1,
-1.026583, -2.178154, -2.097067, 0, 0, 0, 1, 1,
-1.022837, -0.4140475, -2.415065, 0, 0, 0, 1, 1,
-1.02274, -0.4987403, -3.866488, 0, 0, 0, 1, 1,
-1.019301, 0.827144, -0.9988049, 0, 0, 0, 1, 1,
-1.016709, -0.541514, -2.05373, 0, 0, 0, 1, 1,
-1.015336, -0.9888469, -1.43051, 0, 0, 0, 1, 1,
-1.007366, -0.8312789, -0.5408288, 1, 1, 1, 1, 1,
-1.006338, 0.3048049, -2.367525, 1, 1, 1, 1, 1,
-1.005219, 0.8530909, -1.464604, 1, 1, 1, 1, 1,
-1.001297, 0.8797229, -1.701338, 1, 1, 1, 1, 1,
-0.9912865, 0.3368629, -1.848935, 1, 1, 1, 1, 1,
-0.9892448, -1.189676, -1.981751, 1, 1, 1, 1, 1,
-0.9802695, 1.244015, -1.520477, 1, 1, 1, 1, 1,
-0.976046, -1.825712, -4.056992, 1, 1, 1, 1, 1,
-0.966399, 0.1907532, -2.083504, 1, 1, 1, 1, 1,
-0.9644779, 0.7170511, -2.089435, 1, 1, 1, 1, 1,
-0.9623226, 0.6213886, -2.273081, 1, 1, 1, 1, 1,
-0.9598774, 0.8433804, -0.6452376, 1, 1, 1, 1, 1,
-0.9577214, 1.729203, -1.293737, 1, 1, 1, 1, 1,
-0.9500576, -1.346737, -4.233275, 1, 1, 1, 1, 1,
-0.9480904, 1.900361, 0.9330366, 1, 1, 1, 1, 1,
-0.9465996, 0.3323384, -1.315409, 0, 0, 1, 1, 1,
-0.9446686, 0.05770105, -2.043259, 1, 0, 0, 1, 1,
-0.942505, -0.3807077, -1.376525, 1, 0, 0, 1, 1,
-0.9408806, -0.4463577, -2.379989, 1, 0, 0, 1, 1,
-0.9397284, -1.061855, -1.518609, 1, 0, 0, 1, 1,
-0.9382232, 1.628901, 0.6343684, 1, 0, 0, 1, 1,
-0.934065, 1.873326, -0.8367854, 0, 0, 0, 1, 1,
-0.9234253, -1.385107, -2.727325, 0, 0, 0, 1, 1,
-0.9212275, 0.2769889, -2.532497, 0, 0, 0, 1, 1,
-0.9040373, -1.643159, -1.571508, 0, 0, 0, 1, 1,
-0.9009064, 0.8210388, 0.5147442, 0, 0, 0, 1, 1,
-0.8989779, -0.4336885, -2.946943, 0, 0, 0, 1, 1,
-0.8979434, -1.082848, -4.99158, 0, 0, 0, 1, 1,
-0.8978652, -0.4664298, -1.12585, 1, 1, 1, 1, 1,
-0.8964917, -0.3021474, -2.909469, 1, 1, 1, 1, 1,
-0.8928038, -0.1806602, -1.474756, 1, 1, 1, 1, 1,
-0.891673, -1.576151, -1.741045, 1, 1, 1, 1, 1,
-0.8861491, 0.3085811, -1.839786, 1, 1, 1, 1, 1,
-0.8859912, -0.0734293, -3.123606, 1, 1, 1, 1, 1,
-0.8856521, 1.420197, -1.003666, 1, 1, 1, 1, 1,
-0.8823215, -0.1076039, 0.06189455, 1, 1, 1, 1, 1,
-0.8809667, 0.0337602, -1.913475, 1, 1, 1, 1, 1,
-0.8804855, -0.6430626, -1.455734, 1, 1, 1, 1, 1,
-0.8720745, 0.9786501, -0.8818539, 1, 1, 1, 1, 1,
-0.8666924, -0.01848358, -2.690177, 1, 1, 1, 1, 1,
-0.8608868, -0.1746141, -2.111776, 1, 1, 1, 1, 1,
-0.8545539, 0.06654607, -1.344728, 1, 1, 1, 1, 1,
-0.8527699, -0.6547156, -3.64844, 1, 1, 1, 1, 1,
-0.8459732, -0.4891772, -2.244138, 0, 0, 1, 1, 1,
-0.8432186, 2.637227, -0.4169577, 1, 0, 0, 1, 1,
-0.8249507, -0.1237993, -2.377148, 1, 0, 0, 1, 1,
-0.8243644, -0.4174909, -3.075848, 1, 0, 0, 1, 1,
-0.8177806, -0.07462019, -2.33408, 1, 0, 0, 1, 1,
-0.8124611, 1.045839, 0.4384932, 1, 0, 0, 1, 1,
-0.8069325, -1.171171, -2.594633, 0, 0, 0, 1, 1,
-0.8030601, 0.9278722, -0.2393, 0, 0, 0, 1, 1,
-0.8029428, 1.089825, -3.562484, 0, 0, 0, 1, 1,
-0.8028685, -0.8199431, -2.174304, 0, 0, 0, 1, 1,
-0.8027205, 0.8940477, -1.301135, 0, 0, 0, 1, 1,
-0.7986587, 0.409059, -0.3082013, 0, 0, 0, 1, 1,
-0.7936231, 0.862237, 0.0009366107, 0, 0, 0, 1, 1,
-0.7934902, -0.7407381, -1.483642, 1, 1, 1, 1, 1,
-0.7889115, -0.529184, -2.944395, 1, 1, 1, 1, 1,
-0.7876765, 1.167125, -1.652478, 1, 1, 1, 1, 1,
-0.7858509, 0.2730726, -2.333043, 1, 1, 1, 1, 1,
-0.783456, -0.2773257, -2.082644, 1, 1, 1, 1, 1,
-0.7799938, 0.3431323, -0.6522754, 1, 1, 1, 1, 1,
-0.7744761, 1.252549, -1.944476, 1, 1, 1, 1, 1,
-0.7723274, 0.6508937, 0.3024458, 1, 1, 1, 1, 1,
-0.7697882, 0.5107056, -1.878929, 1, 1, 1, 1, 1,
-0.7662104, -0.8863803, -3.920429, 1, 1, 1, 1, 1,
-0.7615315, -0.3409953, -0.8740041, 1, 1, 1, 1, 1,
-0.7590307, 0.6201697, -0.8136483, 1, 1, 1, 1, 1,
-0.7570387, -0.0981679, -2.435796, 1, 1, 1, 1, 1,
-0.746793, -0.1418082, -1.612366, 1, 1, 1, 1, 1,
-0.7439051, 1.172498, -0.36687, 1, 1, 1, 1, 1,
-0.7421492, 1.762945, -1.928197, 0, 0, 1, 1, 1,
-0.7393874, 0.4512047, -2.014443, 1, 0, 0, 1, 1,
-0.7380615, -1.162423, -4.049895, 1, 0, 0, 1, 1,
-0.7307596, -1.833027, -1.914901, 1, 0, 0, 1, 1,
-0.7293061, 0.8557651, -0.7760082, 1, 0, 0, 1, 1,
-0.724214, -1.211788, -1.810102, 1, 0, 0, 1, 1,
-0.7222185, 1.182337, -0.4754732, 0, 0, 0, 1, 1,
-0.721979, 1.346552, 0.7731712, 0, 0, 0, 1, 1,
-0.7218204, -0.2412318, -1.971351, 0, 0, 0, 1, 1,
-0.7164104, -0.965693, -2.591771, 0, 0, 0, 1, 1,
-0.7158786, 0.8900773, -0.09657004, 0, 0, 0, 1, 1,
-0.7114384, 0.3089642, -1.894216, 0, 0, 0, 1, 1,
-0.706952, -0.583869, -1.576681, 0, 0, 0, 1, 1,
-0.7049583, -0.2885348, -0.4688225, 1, 1, 1, 1, 1,
-0.7020848, -0.07916713, -3.073051, 1, 1, 1, 1, 1,
-0.6915764, 0.4451673, -1.866225, 1, 1, 1, 1, 1,
-0.6897489, -0.8644883, -1.970167, 1, 1, 1, 1, 1,
-0.6887848, -0.6584688, -2.138688, 1, 1, 1, 1, 1,
-0.688422, -0.3426984, -1.3498, 1, 1, 1, 1, 1,
-0.6869996, -0.1090589, -1.139693, 1, 1, 1, 1, 1,
-0.6800632, 0.5289928, -1.534751, 1, 1, 1, 1, 1,
-0.6739404, 0.8526046, 0.2975727, 1, 1, 1, 1, 1,
-0.6729536, -1.420251, -1.147517, 1, 1, 1, 1, 1,
-0.6720836, -0.1068018, -0.3980682, 1, 1, 1, 1, 1,
-0.6611679, -0.6914016, -2.148121, 1, 1, 1, 1, 1,
-0.6529432, -1.043223, -1.647358, 1, 1, 1, 1, 1,
-0.6499505, -0.1109088, -1.481468, 1, 1, 1, 1, 1,
-0.6494234, -1.698396, -3.327277, 1, 1, 1, 1, 1,
-0.6491984, -0.5380272, -2.706912, 0, 0, 1, 1, 1,
-0.6459513, -0.5923905, -1.505401, 1, 0, 0, 1, 1,
-0.6436929, -1.962331, -1.015512, 1, 0, 0, 1, 1,
-0.6413842, 0.176319, -0.5944783, 1, 0, 0, 1, 1,
-0.6399094, 0.6733742, -1.801389, 1, 0, 0, 1, 1,
-0.6356779, -0.2290438, -1.218437, 1, 0, 0, 1, 1,
-0.6350775, 1.100732, -0.1602465, 0, 0, 0, 1, 1,
-0.6319706, -1.693923, -3.706223, 0, 0, 0, 1, 1,
-0.6286265, -0.423585, -2.059832, 0, 0, 0, 1, 1,
-0.6246514, 0.02861862, -3.31348, 0, 0, 0, 1, 1,
-0.6229907, 1.910984, -0.3340536, 0, 0, 0, 1, 1,
-0.6192171, -0.74294, -1.188272, 0, 0, 0, 1, 1,
-0.6151491, -0.8806869, -2.990546, 0, 0, 0, 1, 1,
-0.6141628, 0.1151895, -0.9503005, 1, 1, 1, 1, 1,
-0.6113138, -1.327844, -1.856763, 1, 1, 1, 1, 1,
-0.6081214, 1.296119, -1.525384, 1, 1, 1, 1, 1,
-0.607941, 0.6178142, -1.824794, 1, 1, 1, 1, 1,
-0.6076397, 0.7396094, 0.3365598, 1, 1, 1, 1, 1,
-0.6034111, -0.4278989, -2.217794, 1, 1, 1, 1, 1,
-0.6031618, 0.5240969, -1.015787, 1, 1, 1, 1, 1,
-0.600723, -1.714873, -3.327718, 1, 1, 1, 1, 1,
-0.5968674, 0.2672961, -0.4035471, 1, 1, 1, 1, 1,
-0.5961124, -1.211102, -1.829795, 1, 1, 1, 1, 1,
-0.59498, 0.431228, -1.773922, 1, 1, 1, 1, 1,
-0.586156, 0.2476673, 0.2190635, 1, 1, 1, 1, 1,
-0.585129, 0.004146374, -0.7878447, 1, 1, 1, 1, 1,
-0.5845325, -0.7713283, -1.95591, 1, 1, 1, 1, 1,
-0.5843012, -2.489763, -1.490883, 1, 1, 1, 1, 1,
-0.5781791, 1.882774, -0.8599914, 0, 0, 1, 1, 1,
-0.5741435, -1.056552, -1.951345, 1, 0, 0, 1, 1,
-0.5712901, 1.182868, -0.04167024, 1, 0, 0, 1, 1,
-0.5712566, 1.242608, 0.1463176, 1, 0, 0, 1, 1,
-0.5650241, 0.139666, 0.6175947, 1, 0, 0, 1, 1,
-0.5642166, 0.8600644, -0.050758, 1, 0, 0, 1, 1,
-0.5633193, 0.165527, 1.791115, 0, 0, 0, 1, 1,
-0.5613701, -1.236433, -3.065216, 0, 0, 0, 1, 1,
-0.5563158, 1.058428, -0.9689055, 0, 0, 0, 1, 1,
-0.5523087, 0.5597928, -2.221383, 0, 0, 0, 1, 1,
-0.5498198, 0.8895317, -1.365812, 0, 0, 0, 1, 1,
-0.5496557, -1.976312, -2.15171, 0, 0, 0, 1, 1,
-0.5481876, 0.6867074, -1.238151, 0, 0, 0, 1, 1,
-0.5480779, 1.366101, 1.33042, 1, 1, 1, 1, 1,
-0.5427043, -0.09988269, -1.595126, 1, 1, 1, 1, 1,
-0.5410408, 0.2530223, 0.359124, 1, 1, 1, 1, 1,
-0.5352966, 0.6974576, 0.5486478, 1, 1, 1, 1, 1,
-0.5289475, -0.02863532, -1.566889, 1, 1, 1, 1, 1,
-0.5282878, -1.343757, -2.046157, 1, 1, 1, 1, 1,
-0.5211047, -0.6151257, -3.755137, 1, 1, 1, 1, 1,
-0.5210242, 1.349872, -0.6257347, 1, 1, 1, 1, 1,
-0.5209392, 0.3179418, -0.4017017, 1, 1, 1, 1, 1,
-0.5168834, 1.131194, -1.499685, 1, 1, 1, 1, 1,
-0.5165716, 0.691386, 0.3114443, 1, 1, 1, 1, 1,
-0.5149454, 0.3541635, -2.15688, 1, 1, 1, 1, 1,
-0.5141078, -0.8305563, -1.902578, 1, 1, 1, 1, 1,
-0.5121095, 0.1684135, -1.270077, 1, 1, 1, 1, 1,
-0.5099196, 1.138924, -1.406966, 1, 1, 1, 1, 1,
-0.5075881, -1.229348, -3.614321, 0, 0, 1, 1, 1,
-0.5051141, 0.7261356, -1.733986, 1, 0, 0, 1, 1,
-0.5050421, 0.4516875, -0.6374686, 1, 0, 0, 1, 1,
-0.5007852, 1.395648, -0.7366412, 1, 0, 0, 1, 1,
-0.5002892, 0.08657408, -0.0811559, 1, 0, 0, 1, 1,
-0.4985359, -1.229754, -3.759015, 1, 0, 0, 1, 1,
-0.4967873, 0.02743973, -0.3843727, 0, 0, 0, 1, 1,
-0.4936923, -0.8749247, -2.055562, 0, 0, 0, 1, 1,
-0.4923898, -0.5674859, -2.172084, 0, 0, 0, 1, 1,
-0.4913524, -0.2517065, -1.193231, 0, 0, 0, 1, 1,
-0.4880191, 0.5221704, -2.073757, 0, 0, 0, 1, 1,
-0.4831988, 0.5281798, 0.8833572, 0, 0, 0, 1, 1,
-0.4825663, 1.436268, -0.7741572, 0, 0, 0, 1, 1,
-0.4804929, -0.311646, -0.9085104, 1, 1, 1, 1, 1,
-0.4761601, -1.428329, -3.994773, 1, 1, 1, 1, 1,
-0.4741046, 0.09402631, -1.623405, 1, 1, 1, 1, 1,
-0.4694078, -0.01632016, -0.4387522, 1, 1, 1, 1, 1,
-0.4671245, 3.001112, 0.007362744, 1, 1, 1, 1, 1,
-0.4656317, 0.3096793, 0.5212762, 1, 1, 1, 1, 1,
-0.4594949, 1.346825, -0.5331435, 1, 1, 1, 1, 1,
-0.4584711, -0.1026033, -1.229663, 1, 1, 1, 1, 1,
-0.4575264, -0.8376411, -2.178739, 1, 1, 1, 1, 1,
-0.4547989, -1.962762, -5.023508, 1, 1, 1, 1, 1,
-0.4533305, 0.3405113, -1.192307, 1, 1, 1, 1, 1,
-0.4515135, 0.06837772, -1.677125, 1, 1, 1, 1, 1,
-0.4507451, -1.320101, -4.974365, 1, 1, 1, 1, 1,
-0.4502198, -0.8543361, -3.676405, 1, 1, 1, 1, 1,
-0.4475752, -1.109604, -0.9756479, 1, 1, 1, 1, 1,
-0.4433888, -1.586316, -2.768761, 0, 0, 1, 1, 1,
-0.4384585, 0.1797058, -0.5502056, 1, 0, 0, 1, 1,
-0.4347101, -0.309764, -1.226012, 1, 0, 0, 1, 1,
-0.4320088, 0.3463663, -2.803258, 1, 0, 0, 1, 1,
-0.4286239, 1.459408, 0.1942711, 1, 0, 0, 1, 1,
-0.4265746, -0.6335946, -3.840065, 1, 0, 0, 1, 1,
-0.4180076, 0.6134685, -1.849544, 0, 0, 0, 1, 1,
-0.4177351, 0.1642474, -0.6470256, 0, 0, 0, 1, 1,
-0.4116163, -1.282495, -3.048427, 0, 0, 0, 1, 1,
-0.4061019, 0.07207517, -0.9325885, 0, 0, 0, 1, 1,
-0.4017612, -0.7890617, -1.923336, 0, 0, 0, 1, 1,
-0.3996682, 0.3282546, -0.6095048, 0, 0, 0, 1, 1,
-0.3993685, -0.6808068, -3.425359, 0, 0, 0, 1, 1,
-0.3989567, -1.179304, -2.969497, 1, 1, 1, 1, 1,
-0.3983735, -0.9813663, -4.141669, 1, 1, 1, 1, 1,
-0.3934671, -0.5333681, -0.4711553, 1, 1, 1, 1, 1,
-0.3915899, 0.01444499, -2.030571, 1, 1, 1, 1, 1,
-0.3913007, 0.4912639, -0.7265742, 1, 1, 1, 1, 1,
-0.3884768, 0.617405, -1.937789, 1, 1, 1, 1, 1,
-0.3880118, -0.5807664, -3.546569, 1, 1, 1, 1, 1,
-0.3824351, 1.888967, 0.589633, 1, 1, 1, 1, 1,
-0.3799845, 0.06739751, 0.1002296, 1, 1, 1, 1, 1,
-0.3768755, -0.06945598, -2.892195, 1, 1, 1, 1, 1,
-0.3734334, -0.6504114, -1.138744, 1, 1, 1, 1, 1,
-0.3717279, 0.8386886, -2.83538, 1, 1, 1, 1, 1,
-0.3714501, 0.4222975, -1.032633, 1, 1, 1, 1, 1,
-0.3676136, 1.214304, 1.325426, 1, 1, 1, 1, 1,
-0.3662364, -0.7766408, -1.938509, 1, 1, 1, 1, 1,
-0.3645844, -0.5515645, -2.889631, 0, 0, 1, 1, 1,
-0.3628038, 1.578594, -1.027081, 1, 0, 0, 1, 1,
-0.3625776, 0.04520958, -1.606532, 1, 0, 0, 1, 1,
-0.3602024, 1.304484, -0.7029036, 1, 0, 0, 1, 1,
-0.3593909, -0.1275216, -0.9112443, 1, 0, 0, 1, 1,
-0.358009, 0.6595458, 0.03548044, 1, 0, 0, 1, 1,
-0.3571528, -0.3134644, -0.7717181, 0, 0, 0, 1, 1,
-0.3567155, -0.1892167, -2.962648, 0, 0, 0, 1, 1,
-0.3554528, -0.09034564, -1.888102, 0, 0, 0, 1, 1,
-0.3550169, -0.7331049, -3.803206, 0, 0, 0, 1, 1,
-0.3528531, 0.875717, 0.4646752, 0, 0, 0, 1, 1,
-0.3476032, 1.809321, 0.09603084, 0, 0, 0, 1, 1,
-0.3474226, 0.2801904, -0.6064736, 0, 0, 0, 1, 1,
-0.3437748, -0.1585743, -1.334037, 1, 1, 1, 1, 1,
-0.343352, 0.2530212, -2.519624, 1, 1, 1, 1, 1,
-0.3426534, -0.3655578, -2.713816, 1, 1, 1, 1, 1,
-0.3409253, -0.9614573, -2.875267, 1, 1, 1, 1, 1,
-0.3349534, 1.397036, -0.1331835, 1, 1, 1, 1, 1,
-0.3330288, -1.120626, -2.635681, 1, 1, 1, 1, 1,
-0.324111, -0.7974237, -1.760879, 1, 1, 1, 1, 1,
-0.3204728, -0.08921478, -2.8338, 1, 1, 1, 1, 1,
-0.3202577, 0.09827854, -1.596957, 1, 1, 1, 1, 1,
-0.3185883, -0.04128792, -0.4634355, 1, 1, 1, 1, 1,
-0.3058621, 0.5436002, -0.6509171, 1, 1, 1, 1, 1,
-0.3028861, 1.059975, -0.7249221, 1, 1, 1, 1, 1,
-0.3008348, -0.9128243, -3.022401, 1, 1, 1, 1, 1,
-0.2984553, -1.097812, -1.890675, 1, 1, 1, 1, 1,
-0.2977465, -1.445768, -3.728442, 1, 1, 1, 1, 1,
-0.2966339, 0.5713902, -1.676057, 0, 0, 1, 1, 1,
-0.2947994, -1.657608, -3.100931, 1, 0, 0, 1, 1,
-0.2930295, -1.802711, -3.997424, 1, 0, 0, 1, 1,
-0.292897, 1.032707, 0.4183185, 1, 0, 0, 1, 1,
-0.2889655, -2.06383, -1.77915, 1, 0, 0, 1, 1,
-0.28611, -1.553702, -4.651863, 1, 0, 0, 1, 1,
-0.2769906, 0.7071013, -0.12748, 0, 0, 0, 1, 1,
-0.2757936, 0.4924291, 0.09154092, 0, 0, 0, 1, 1,
-0.2756289, 0.6568277, -0.3854608, 0, 0, 0, 1, 1,
-0.2729955, 0.9957944, 0.6221634, 0, 0, 0, 1, 1,
-0.2729625, 0.4238511, -2.387895, 0, 0, 0, 1, 1,
-0.2721311, -0.5816315, -2.347922, 0, 0, 0, 1, 1,
-0.2671075, 1.240096, -0.506917, 0, 0, 0, 1, 1,
-0.2668319, -0.1209409, -2.535507, 1, 1, 1, 1, 1,
-0.2659221, -0.1797632, -3.450352, 1, 1, 1, 1, 1,
-0.2647108, 0.1467196, -1.042497, 1, 1, 1, 1, 1,
-0.2644443, 0.5871492, 1.200033, 1, 1, 1, 1, 1,
-0.2611388, 0.0003172287, -2.099401, 1, 1, 1, 1, 1,
-0.2592046, 0.6671469, -1.588007, 1, 1, 1, 1, 1,
-0.255556, -0.6374053, -3.049767, 1, 1, 1, 1, 1,
-0.2541367, 0.609654, -0.8695557, 1, 1, 1, 1, 1,
-0.2499579, -0.3843683, -3.438975, 1, 1, 1, 1, 1,
-0.2484857, -0.9940487, -3.122054, 1, 1, 1, 1, 1,
-0.2475282, 1.263519, -0.04698366, 1, 1, 1, 1, 1,
-0.2474229, -1.088863, -3.619632, 1, 1, 1, 1, 1,
-0.2452583, 0.8163175, 0.6000841, 1, 1, 1, 1, 1,
-0.2442405, 0.006664443, -2.810121, 1, 1, 1, 1, 1,
-0.2422385, -0.1154297, -2.933925, 1, 1, 1, 1, 1,
-0.2407761, 0.2881545, -2.23188, 0, 0, 1, 1, 1,
-0.2396221, 0.4355935, -1.254406, 1, 0, 0, 1, 1,
-0.2384435, -1.113091, -3.367645, 1, 0, 0, 1, 1,
-0.2372859, -0.8279703, -3.467936, 1, 0, 0, 1, 1,
-0.2360798, -0.4530804, -2.69033, 1, 0, 0, 1, 1,
-0.2357761, -0.2707501, -0.7879288, 1, 0, 0, 1, 1,
-0.2332298, 0.2852349, -1.744025, 0, 0, 0, 1, 1,
-0.2328619, 0.744163, 0.3553394, 0, 0, 0, 1, 1,
-0.2308164, -0.9929457, -2.780494, 0, 0, 0, 1, 1,
-0.2300685, 1.052478, -0.2518889, 0, 0, 0, 1, 1,
-0.2285551, 0.622962, -0.8702485, 0, 0, 0, 1, 1,
-0.2269672, 0.6039525, 0.361315, 0, 0, 0, 1, 1,
-0.2269133, 0.9310782, -1.726063, 0, 0, 0, 1, 1,
-0.2263696, 0.01865268, -0.1557365, 1, 1, 1, 1, 1,
-0.2187263, -0.2255462, -0.9174845, 1, 1, 1, 1, 1,
-0.2185803, -0.9196098, -1.879618, 1, 1, 1, 1, 1,
-0.2175979, -2.222262, -1.771087, 1, 1, 1, 1, 1,
-0.216023, 1.924586, -0.24533, 1, 1, 1, 1, 1,
-0.2145342, -0.5312363, -3.643346, 1, 1, 1, 1, 1,
-0.2120887, 0.8426676, 0.006611508, 1, 1, 1, 1, 1,
-0.2120291, -1.068156, -4.276164, 1, 1, 1, 1, 1,
-0.2116258, -0.1521174, -1.81569, 1, 1, 1, 1, 1,
-0.2114833, 1.430509, -0.8671947, 1, 1, 1, 1, 1,
-0.2112536, -0.2444427, -2.458627, 1, 1, 1, 1, 1,
-0.2108112, 0.7016865, -0.2616095, 1, 1, 1, 1, 1,
-0.2106137, 0.3414932, -0.6716521, 1, 1, 1, 1, 1,
-0.2096345, 0.3520404, -0.3285359, 1, 1, 1, 1, 1,
-0.2086001, -1.110488, -2.063853, 1, 1, 1, 1, 1,
-0.2085548, 0.08616932, -2.39524, 0, 0, 1, 1, 1,
-0.2079408, -0.3148595, -2.824597, 1, 0, 0, 1, 1,
-0.1969278, 1.642166, 0.4948635, 1, 0, 0, 1, 1,
-0.1945857, 0.6640235, 2.525532, 1, 0, 0, 1, 1,
-0.192322, 0.5453038, -2.349749, 1, 0, 0, 1, 1,
-0.1883121, -0.3852949, -1.834374, 1, 0, 0, 1, 1,
-0.1855561, -0.4795797, -3.471759, 0, 0, 0, 1, 1,
-0.1847225, -0.3386189, -1.247108, 0, 0, 0, 1, 1,
-0.1839909, 0.3711284, -0.9637229, 0, 0, 0, 1, 1,
-0.1792087, -0.2058479, -1.281963, 0, 0, 0, 1, 1,
-0.1747262, -1.336974, -3.719147, 0, 0, 0, 1, 1,
-0.1715439, -0.6998518, -2.77274, 0, 0, 0, 1, 1,
-0.1610791, -1.333916, -4.01076, 0, 0, 0, 1, 1,
-0.1601983, -0.3172362, -2.489733, 1, 1, 1, 1, 1,
-0.1599663, 1.114375, -0.03633329, 1, 1, 1, 1, 1,
-0.157903, 2.850063, 1.710333, 1, 1, 1, 1, 1,
-0.157306, 0.7382109, -0.2355779, 1, 1, 1, 1, 1,
-0.1565719, 0.6484575, 0.9212275, 1, 1, 1, 1, 1,
-0.1562257, 1.228073, -0.1730328, 1, 1, 1, 1, 1,
-0.1478281, 0.934159, 1.168374, 1, 1, 1, 1, 1,
-0.143993, -0.09555697, -0.8819766, 1, 1, 1, 1, 1,
-0.1357721, -0.06472935, -2.620435, 1, 1, 1, 1, 1,
-0.1316172, 0.2876712, 0.4871356, 1, 1, 1, 1, 1,
-0.1315341, -0.8959964, -3.505577, 1, 1, 1, 1, 1,
-0.1309825, -2.182667, -1.984756, 1, 1, 1, 1, 1,
-0.1297266, 1.246965, 0.1282885, 1, 1, 1, 1, 1,
-0.118012, 2.359283, 0.5121165, 1, 1, 1, 1, 1,
-0.1177446, -0.7219864, -3.0883, 1, 1, 1, 1, 1,
-0.1170854, -0.5119981, -0.6288685, 0, 0, 1, 1, 1,
-0.1125174, -1.156798, -3.930228, 1, 0, 0, 1, 1,
-0.1100233, 0.07463755, -1.045207, 1, 0, 0, 1, 1,
-0.1083889, 0.7957199, 0.3277665, 1, 0, 0, 1, 1,
-0.1081485, -0.1964675, -1.876326, 1, 0, 0, 1, 1,
-0.1029601, -0.2511899, -1.617242, 1, 0, 0, 1, 1,
-0.1016047, -1.039797, -2.973774, 0, 0, 0, 1, 1,
-0.1004518, -0.1450535, -2.640336, 0, 0, 0, 1, 1,
-0.09712056, 0.8408521, -0.5217186, 0, 0, 0, 1, 1,
-0.09644938, 0.1407521, 0.2839664, 0, 0, 0, 1, 1,
-0.09392113, -0.9348655, -4.27078, 0, 0, 0, 1, 1,
-0.08279461, -0.6727994, -2.167802, 0, 0, 0, 1, 1,
-0.07954849, -0.6162832, -3.626834, 0, 0, 0, 1, 1,
-0.0780707, -0.003476236, -1.441749, 1, 1, 1, 1, 1,
-0.07791355, 0.9042939, -0.4139182, 1, 1, 1, 1, 1,
-0.0737705, -0.2101288, -2.258104, 1, 1, 1, 1, 1,
-0.07338951, -1.947455, -4.421812, 1, 1, 1, 1, 1,
-0.06768919, 1.820964, 0.1713627, 1, 1, 1, 1, 1,
-0.06384379, -0.06398661, -3.434292, 1, 1, 1, 1, 1,
-0.06268418, 0.157093, -1.399341, 1, 1, 1, 1, 1,
-0.0614865, 2.282025, -1.579106, 1, 1, 1, 1, 1,
-0.06092203, 0.3578283, 0.3007694, 1, 1, 1, 1, 1,
-0.06070102, 0.7478291, 0.899833, 1, 1, 1, 1, 1,
-0.0582251, 0.4240245, 0.3182981, 1, 1, 1, 1, 1,
-0.05749797, 0.7385666, 1.483146, 1, 1, 1, 1, 1,
-0.05543477, -0.1647368, -0.4724859, 1, 1, 1, 1, 1,
-0.05378415, -2.209703, -3.662184, 1, 1, 1, 1, 1,
-0.05354081, -1.746009, -0.8389933, 1, 1, 1, 1, 1,
-0.05333529, 0.1165477, -1.110899, 0, 0, 1, 1, 1,
-0.0524276, -0.4467962, -4.063906, 1, 0, 0, 1, 1,
-0.05195363, -1.0211, -4.325986, 1, 0, 0, 1, 1,
-0.05150047, 0.3443359, -0.6105855, 1, 0, 0, 1, 1,
-0.04854662, 1.141943, -0.714067, 1, 0, 0, 1, 1,
-0.04762375, -0.6788852, -3.285384, 1, 0, 0, 1, 1,
-0.04639538, -0.1652834, -3.278512, 0, 0, 0, 1, 1,
-0.04523138, 0.6722983, 1.117432, 0, 0, 0, 1, 1,
-0.04409626, -0.4884761, -2.398896, 0, 0, 0, 1, 1,
-0.0433837, 1.124493, 0.7702283, 0, 0, 0, 1, 1,
-0.04301921, 0.3843818, -0.7234697, 0, 0, 0, 1, 1,
-0.04279304, -0.01144363, -1.496072, 0, 0, 0, 1, 1,
-0.03634756, -0.2959223, -2.249234, 0, 0, 0, 1, 1,
-0.03077945, -1.98982, -3.730675, 1, 1, 1, 1, 1,
-0.03017867, -1.356706, -3.077872, 1, 1, 1, 1, 1,
-0.02858821, -0.1931905, -1.227595, 1, 1, 1, 1, 1,
-0.02738908, 2.088766, 0.02449496, 1, 1, 1, 1, 1,
-0.02696804, 0.4206411, -1.572075, 1, 1, 1, 1, 1,
-0.02478223, 0.8273478, -0.6057385, 1, 1, 1, 1, 1,
-0.0240559, -0.1494301, -2.905983, 1, 1, 1, 1, 1,
-0.02325225, 0.6338223, 1.552857, 1, 1, 1, 1, 1,
-0.02280865, -1.451747, -3.990698, 1, 1, 1, 1, 1,
-0.02184007, -1.776445, -3.198928, 1, 1, 1, 1, 1,
-0.02133687, -1.431879, -3.889164, 1, 1, 1, 1, 1,
-0.01753618, 0.6466758, -2.395159, 1, 1, 1, 1, 1,
-0.01465475, 0.231053, 1.530961, 1, 1, 1, 1, 1,
-0.01399576, -0.5466434, -3.576305, 1, 1, 1, 1, 1,
-0.01044, -0.06894505, -3.473805, 1, 1, 1, 1, 1,
-0.00809301, -0.09042383, -1.896948, 0, 0, 1, 1, 1,
-0.007450206, 2.115634, -1.565237, 1, 0, 0, 1, 1,
-0.005295368, -0.3198868, -4.152167, 1, 0, 0, 1, 1,
-0.004313409, -1.144762, -2.768072, 1, 0, 0, 1, 1,
-0.001451641, 1.223712, -0.3462914, 1, 0, 0, 1, 1,
0.0002168737, 0.5440519, 0.4054219, 1, 0, 0, 1, 1,
0.00545996, -1.488348, 2.328198, 0, 0, 0, 1, 1,
0.005691104, 0.5567377, 0.8918963, 0, 0, 0, 1, 1,
0.00925006, -1.459201, 2.768065, 0, 0, 0, 1, 1,
0.01468473, 0.4830023, -1.306174, 0, 0, 0, 1, 1,
0.01616251, -1.692943, 1.766428, 0, 0, 0, 1, 1,
0.01629078, 0.820145, 0.8827797, 0, 0, 0, 1, 1,
0.01744804, 0.1818988, 1.362558, 0, 0, 0, 1, 1,
0.0202607, -0.9480302, 1.842938, 1, 1, 1, 1, 1,
0.02037542, -1.849207, 3.679399, 1, 1, 1, 1, 1,
0.02234782, 1.354785, -0.07999868, 1, 1, 1, 1, 1,
0.0228747, 1.642998, -0.4967741, 1, 1, 1, 1, 1,
0.02402648, 2.458493, -0.7496815, 1, 1, 1, 1, 1,
0.02904595, 1.407226, -0.2344576, 1, 1, 1, 1, 1,
0.02950384, 0.4788462, -0.08995154, 1, 1, 1, 1, 1,
0.03022853, -0.5496214, 5.016296, 1, 1, 1, 1, 1,
0.03407785, 1.117885, -0.005863322, 1, 1, 1, 1, 1,
0.03518509, -0.02648275, 2.444799, 1, 1, 1, 1, 1,
0.03633147, 2.236473, 0.518918, 1, 1, 1, 1, 1,
0.04373464, -1.650789, 3.084916, 1, 1, 1, 1, 1,
0.04786959, -0.2718021, 2.935228, 1, 1, 1, 1, 1,
0.05077361, 0.5791727, -1.607689, 1, 1, 1, 1, 1,
0.05316129, 0.2245741, -0.6102989, 1, 1, 1, 1, 1,
0.05394625, 0.1932137, 0.8839952, 0, 0, 1, 1, 1,
0.0545533, -1.310022, 3.423621, 1, 0, 0, 1, 1,
0.05466167, -0.6680002, 0.9113946, 1, 0, 0, 1, 1,
0.05707365, 0.2164628, 1.293529, 1, 0, 0, 1, 1,
0.06108575, 1.135261, 0.645378, 1, 0, 0, 1, 1,
0.06702121, -0.13863, 3.12322, 1, 0, 0, 1, 1,
0.06911192, 2.164042, -0.0572812, 0, 0, 0, 1, 1,
0.07015121, 0.4381613, 0.8992447, 0, 0, 0, 1, 1,
0.07472097, -0.8629133, 2.810931, 0, 0, 0, 1, 1,
0.07530748, -0.62552, 3.32081, 0, 0, 0, 1, 1,
0.07798645, -0.6940381, 3.001065, 0, 0, 0, 1, 1,
0.07940624, -1.936826, 2.299025, 0, 0, 0, 1, 1,
0.08045917, 1.079363, -0.7670535, 0, 0, 0, 1, 1,
0.08083021, 0.6928938, -0.1280459, 1, 1, 1, 1, 1,
0.081556, 0.9483339, -0.5633302, 1, 1, 1, 1, 1,
0.0816128, -1.043018, 5.199018, 1, 1, 1, 1, 1,
0.08218511, -2.28921, 3.128386, 1, 1, 1, 1, 1,
0.08343356, 0.08219327, 1.186325, 1, 1, 1, 1, 1,
0.08383465, 0.4190128, 0.6547786, 1, 1, 1, 1, 1,
0.08405955, -0.09960034, 2.164358, 1, 1, 1, 1, 1,
0.08981008, 0.5888814, -0.3463659, 1, 1, 1, 1, 1,
0.09355029, 1.501812, 0.4632739, 1, 1, 1, 1, 1,
0.09488896, -1.235753, 3.271165, 1, 1, 1, 1, 1,
0.09822592, -0.2421887, 1.742823, 1, 1, 1, 1, 1,
0.09943918, -0.315753, 3.790067, 1, 1, 1, 1, 1,
0.1025373, -1.044707, 3.254975, 1, 1, 1, 1, 1,
0.1051638, 0.3269544, 0.1486202, 1, 1, 1, 1, 1,
0.1125877, 0.6094137, 0.197021, 1, 1, 1, 1, 1,
0.1131116, 0.0376234, 1.039708, 0, 0, 1, 1, 1,
0.1134432, -0.1334651, 4.880742, 1, 0, 0, 1, 1,
0.1195639, 0.7329347, 1.479758, 1, 0, 0, 1, 1,
0.1207249, -0.7792659, 4.184088, 1, 0, 0, 1, 1,
0.1226466, 1.307896, 0.460083, 1, 0, 0, 1, 1,
0.1235934, 0.8541653, -0.351352, 1, 0, 0, 1, 1,
0.1300276, 0.1147373, 2.11793, 0, 0, 0, 1, 1,
0.1331287, 1.044729, -0.9678415, 0, 0, 0, 1, 1,
0.1356669, -0.3113188, 3.001051, 0, 0, 0, 1, 1,
0.1370863, -0.1672425, 1.905026, 0, 0, 0, 1, 1,
0.1435612, 0.06040536, 2.648906, 0, 0, 0, 1, 1,
0.163086, 0.862884, 0.6942933, 0, 0, 0, 1, 1,
0.1641308, -1.422029, 4.524393, 0, 0, 0, 1, 1,
0.17135, 0.7307743, 1.010459, 1, 1, 1, 1, 1,
0.1739246, 0.5521021, -1.01726, 1, 1, 1, 1, 1,
0.1767806, -1.700483, 3.005037, 1, 1, 1, 1, 1,
0.1775825, 1.496394, 0.4820305, 1, 1, 1, 1, 1,
0.1824193, -0.2273417, 1.921235, 1, 1, 1, 1, 1,
0.1843632, -0.2746939, 1.170564, 1, 1, 1, 1, 1,
0.1844918, -0.4324636, 2.515838, 1, 1, 1, 1, 1,
0.1857183, 0.4022079, 0.5132466, 1, 1, 1, 1, 1,
0.189405, -1.577074, 2.869493, 1, 1, 1, 1, 1,
0.1894813, -0.5020564, 1.528403, 1, 1, 1, 1, 1,
0.1903521, 0.1945217, 1.02989, 1, 1, 1, 1, 1,
0.1909144, 0.3684333, 0.8807332, 1, 1, 1, 1, 1,
0.1943547, 0.4178687, -0.5430014, 1, 1, 1, 1, 1,
0.1954943, -1.609564, 1.857185, 1, 1, 1, 1, 1,
0.196524, 2.116955, 1.438816, 1, 1, 1, 1, 1,
0.1994606, -0.4549229, 4.005135, 0, 0, 1, 1, 1,
0.2009635, 1.133556, -1.346286, 1, 0, 0, 1, 1,
0.2015283, 1.879001, -0.9760541, 1, 0, 0, 1, 1,
0.2053681, -2.11614, 3.104339, 1, 0, 0, 1, 1,
0.2079659, 0.6519401, 1.145998, 1, 0, 0, 1, 1,
0.2110336, -0.4465958, 3.241751, 1, 0, 0, 1, 1,
0.2150361, -0.05396403, 2.025256, 0, 0, 0, 1, 1,
0.220541, -0.362635, 1.704339, 0, 0, 0, 1, 1,
0.2219022, 0.3368739, 0.3921604, 0, 0, 0, 1, 1,
0.2222055, -0.04401701, 1.830297, 0, 0, 0, 1, 1,
0.2232285, 0.2060492, 1.085233, 0, 0, 0, 1, 1,
0.2302842, 0.1544393, 1.342753, 0, 0, 0, 1, 1,
0.230555, -2.405045, 1.573224, 0, 0, 0, 1, 1,
0.2375459, -1.218411, 3.374633, 1, 1, 1, 1, 1,
0.2386319, 0.1181418, 1.84948, 1, 1, 1, 1, 1,
0.2389011, 1.991663, 0.0654939, 1, 1, 1, 1, 1,
0.2448349, 0.5171067, -0.9598915, 1, 1, 1, 1, 1,
0.2469675, 0.6800582, 1.629737, 1, 1, 1, 1, 1,
0.2477523, -0.5397486, 3.198842, 1, 1, 1, 1, 1,
0.2478537, -1.366685, 3.479413, 1, 1, 1, 1, 1,
0.2503859, -1.17759, 1.338612, 1, 1, 1, 1, 1,
0.2505967, 0.3261276, 0.1382932, 1, 1, 1, 1, 1,
0.2536295, 1.479446, -1.509051, 1, 1, 1, 1, 1,
0.2536627, -1.066195, 2.84076, 1, 1, 1, 1, 1,
0.254497, 0.7803043, 0.8008993, 1, 1, 1, 1, 1,
0.2575538, 1.250017, -0.01355097, 1, 1, 1, 1, 1,
0.2576532, -1.308436, 3.24385, 1, 1, 1, 1, 1,
0.2650006, -1.885119, 2.839934, 1, 1, 1, 1, 1,
0.2718852, 1.213698, -0.3835506, 0, 0, 1, 1, 1,
0.2784251, 1.371442, -0.132664, 1, 0, 0, 1, 1,
0.2857026, 0.4823638, -0.09740978, 1, 0, 0, 1, 1,
0.2865658, 0.1023743, 1.753733, 1, 0, 0, 1, 1,
0.2878952, 1.469307, -0.005543943, 1, 0, 0, 1, 1,
0.2901029, 0.1216338, 2.49523, 1, 0, 0, 1, 1,
0.2961006, 1.770481, -0.002487236, 0, 0, 0, 1, 1,
0.2964347, -0.9427915, 4.502248, 0, 0, 0, 1, 1,
0.2988782, 0.7641609, -0.1613005, 0, 0, 0, 1, 1,
0.3104675, 0.984405, -0.5155382, 0, 0, 0, 1, 1,
0.3173842, 0.4559023, 2.278816, 0, 0, 0, 1, 1,
0.3208731, -1.56709, 1.916769, 0, 0, 0, 1, 1,
0.3268454, 0.219813, -0.2644399, 0, 0, 0, 1, 1,
0.3273948, -0.4820013, 2.437396, 1, 1, 1, 1, 1,
0.3275404, 0.6327125, 2.27417, 1, 1, 1, 1, 1,
0.32888, 0.09197527, 3.110236, 1, 1, 1, 1, 1,
0.3292443, 1.528081, 1.409132, 1, 1, 1, 1, 1,
0.3304035, -0.6424459, 2.686872, 1, 1, 1, 1, 1,
0.3315144, -1.47672, 4.416751, 1, 1, 1, 1, 1,
0.3323079, -0.7397936, 3.259569, 1, 1, 1, 1, 1,
0.3330805, -0.01127788, -0.1655691, 1, 1, 1, 1, 1,
0.3332221, -0.6663726, 4.037825, 1, 1, 1, 1, 1,
0.3362939, 0.7490461, 1.489228, 1, 1, 1, 1, 1,
0.3389829, -0.088636, 2.776259, 1, 1, 1, 1, 1,
0.3395247, 0.4094725, 0.1205651, 1, 1, 1, 1, 1,
0.342435, 0.7078734, -0.3126385, 1, 1, 1, 1, 1,
0.3445978, -0.3387306, 2.798032, 1, 1, 1, 1, 1,
0.3465629, 0.6213136, -0.4181423, 1, 1, 1, 1, 1,
0.3482792, 1.139207, 0.5988241, 0, 0, 1, 1, 1,
0.3532466, -0.3941052, 4.557164, 1, 0, 0, 1, 1,
0.357496, 0.4380842, -0.03902608, 1, 0, 0, 1, 1,
0.3588204, 0.2855136, 1.840236, 1, 0, 0, 1, 1,
0.3619932, 0.3264084, 1.10767, 1, 0, 0, 1, 1,
0.3677715, 0.2732912, 0.3301861, 1, 0, 0, 1, 1,
0.3742498, 1.625214, -1.696941, 0, 0, 0, 1, 1,
0.3818846, -1.363032, 0.7756881, 0, 0, 0, 1, 1,
0.3925604, -0.6187754, 1.770323, 0, 0, 0, 1, 1,
0.3970776, -1.586634, 2.002055, 0, 0, 0, 1, 1,
0.3989757, 0.6706262, 0.6022441, 0, 0, 0, 1, 1,
0.3990051, 1.428845, -2.608142, 0, 0, 0, 1, 1,
0.404523, -0.4230485, 3.097088, 0, 0, 0, 1, 1,
0.4048959, -0.6414663, 3.173412, 1, 1, 1, 1, 1,
0.4088936, -0.08891448, 1.347266, 1, 1, 1, 1, 1,
0.4156393, 1.124129, -0.4798557, 1, 1, 1, 1, 1,
0.4161543, 0.0821269, 1.845777, 1, 1, 1, 1, 1,
0.4162728, -0.617537, 2.395119, 1, 1, 1, 1, 1,
0.417384, -0.01448992, 1.754531, 1, 1, 1, 1, 1,
0.4176128, 1.029033, 0.3988137, 1, 1, 1, 1, 1,
0.417642, -0.4776917, 2.728396, 1, 1, 1, 1, 1,
0.4219216, 2.779093, 1.442465, 1, 1, 1, 1, 1,
0.4231701, -0.3170049, 2.610898, 1, 1, 1, 1, 1,
0.4237627, 1.208001, 1.689749, 1, 1, 1, 1, 1,
0.4263085, -0.7686677, 5.229363, 1, 1, 1, 1, 1,
0.4319512, 1.86601, 0.2837124, 1, 1, 1, 1, 1,
0.4341907, -0.5985438, 2.360553, 1, 1, 1, 1, 1,
0.4357049, 0.386724, 1.625405, 1, 1, 1, 1, 1,
0.4388193, -0.4049471, 3.334184, 0, 0, 1, 1, 1,
0.4390792, 0.2223338, 1.561372, 1, 0, 0, 1, 1,
0.4406168, -1.327441, 1.753172, 1, 0, 0, 1, 1,
0.4419761, 1.428467, 0.8166765, 1, 0, 0, 1, 1,
0.4441516, 1.456277, 0.6627398, 1, 0, 0, 1, 1,
0.444363, -0.3994258, 3.213652, 1, 0, 0, 1, 1,
0.4480208, 1.490305, 0.4835935, 0, 0, 0, 1, 1,
0.4489839, 1.77721, 0.0003028906, 0, 0, 0, 1, 1,
0.4613666, -1.855235, 3.331501, 0, 0, 0, 1, 1,
0.4630216, 1.394226, 0.9227723, 0, 0, 0, 1, 1,
0.4662808, 0.3611996, -0.6276225, 0, 0, 0, 1, 1,
0.4674791, -0.2240324, 2.023358, 0, 0, 0, 1, 1,
0.4719619, -0.2425268, 3.9894, 0, 0, 0, 1, 1,
0.4780201, -0.1258792, 0.8425661, 1, 1, 1, 1, 1,
0.4787629, -0.482338, 3.258319, 1, 1, 1, 1, 1,
0.4848455, 0.9329077, 1.607234, 1, 1, 1, 1, 1,
0.4904225, 0.9669682, 0.4840648, 1, 1, 1, 1, 1,
0.4945908, 0.6957403, 1.025508, 1, 1, 1, 1, 1,
0.4958036, -1.840944, 2.580961, 1, 1, 1, 1, 1,
0.4971993, 0.8046499, -0.2373549, 1, 1, 1, 1, 1,
0.4982338, -0.1918492, 2.372036, 1, 1, 1, 1, 1,
0.5005696, -0.1032358, 2.052876, 1, 1, 1, 1, 1,
0.5007681, 0.3856889, -0.189449, 1, 1, 1, 1, 1,
0.5012228, -0.2539454, -0.4808669, 1, 1, 1, 1, 1,
0.5015967, -0.3103525, 1.362037, 1, 1, 1, 1, 1,
0.5088671, -0.6716979, 2.07221, 1, 1, 1, 1, 1,
0.5089593, -0.3110234, 1.940471, 1, 1, 1, 1, 1,
0.509972, -0.8405696, 0.5242971, 1, 1, 1, 1, 1,
0.5102775, -0.8927403, 1.715369, 0, 0, 1, 1, 1,
0.5122785, 0.7020391, 0.5220207, 1, 0, 0, 1, 1,
0.5127263, 1.37409, 0.2161654, 1, 0, 0, 1, 1,
0.5131441, 0.8092741, 1.817848, 1, 0, 0, 1, 1,
0.5191274, 0.6088629, 1.139798, 1, 0, 0, 1, 1,
0.522212, 0.8829638, 0.7277955, 1, 0, 0, 1, 1,
0.5235142, -0.6612494, 4.350099, 0, 0, 0, 1, 1,
0.5236036, 1.117875, -1.923722, 0, 0, 0, 1, 1,
0.5254791, -0.9192671, 1.76845, 0, 0, 0, 1, 1,
0.5337427, 1.643968, -0.3097811, 0, 0, 0, 1, 1,
0.543968, -0.8390725, 2.2271, 0, 0, 0, 1, 1,
0.5471714, -0.04039702, 2.654184, 0, 0, 0, 1, 1,
0.5483491, 0.9244269, -0.08160551, 0, 0, 0, 1, 1,
0.5574202, -1.156116, 3.25764, 1, 1, 1, 1, 1,
0.5592982, -0.7057287, 0.7274713, 1, 1, 1, 1, 1,
0.5641692, -1.452295, 4.109465, 1, 1, 1, 1, 1,
0.5645125, 0.4408615, 1.958734, 1, 1, 1, 1, 1,
0.5664632, -1.196772, 1.091528, 1, 1, 1, 1, 1,
0.5678388, 0.5631413, 0.4898143, 1, 1, 1, 1, 1,
0.5680476, -1.582984, 3.566203, 1, 1, 1, 1, 1,
0.5690434, 1.452689, 0.2839716, 1, 1, 1, 1, 1,
0.5694897, -0.6044086, 3.03734, 1, 1, 1, 1, 1,
0.5695696, 0.5380007, 1.610911, 1, 1, 1, 1, 1,
0.5704942, -0.8211548, 1.390682, 1, 1, 1, 1, 1,
0.573566, 0.443382, 1.624209, 1, 1, 1, 1, 1,
0.5758825, 0.9991176, 0.0206874, 1, 1, 1, 1, 1,
0.5797119, -0.6134696, 2.099069, 1, 1, 1, 1, 1,
0.5858574, 1.092748, 2.103531, 1, 1, 1, 1, 1,
0.586102, 1.85267, 0.3247754, 0, 0, 1, 1, 1,
0.5869145, -0.8985614, 2.211189, 1, 0, 0, 1, 1,
0.5967616, 0.1113174, 0.9184969, 1, 0, 0, 1, 1,
0.5998425, 1.687418, 0.2620935, 1, 0, 0, 1, 1,
0.6012089, 0.2039778, 2.142312, 1, 0, 0, 1, 1,
0.6036733, -1.386913, 2.004397, 1, 0, 0, 1, 1,
0.6082847, -1.739979, 3.381246, 0, 0, 0, 1, 1,
0.6136609, 1.002277, 0.2947347, 0, 0, 0, 1, 1,
0.6177618, -1.455978, 2.550199, 0, 0, 0, 1, 1,
0.6223245, -0.2422518, 2.826419, 0, 0, 0, 1, 1,
0.624291, -1.035646, 2.904747, 0, 0, 0, 1, 1,
0.6358062, -0.6861785, 3.385561, 0, 0, 0, 1, 1,
0.6363128, -0.8399406, 2.426712, 0, 0, 0, 1, 1,
0.6392403, -1.683784, 3.972838, 1, 1, 1, 1, 1,
0.6427042, 0.9023526, 1.308301, 1, 1, 1, 1, 1,
0.6465177, 0.8049405, 1.638734, 1, 1, 1, 1, 1,
0.648333, 1.249825, 1.500846, 1, 1, 1, 1, 1,
0.6485803, 0.07635564, 1.729959, 1, 1, 1, 1, 1,
0.6522076, 0.901024, 0.380784, 1, 1, 1, 1, 1,
0.6533585, -1.124939, 3.295892, 1, 1, 1, 1, 1,
0.6539614, 0.09474408, 2.121572, 1, 1, 1, 1, 1,
0.6541715, -1.301205, 2.850763, 1, 1, 1, 1, 1,
0.6584755, -0.1598287, 3.710871, 1, 1, 1, 1, 1,
0.6584856, -0.6856062, 2.08733, 1, 1, 1, 1, 1,
0.6586767, -0.2260835, 1.613298, 1, 1, 1, 1, 1,
0.6645599, -0.3375519, 2.381252, 1, 1, 1, 1, 1,
0.6669919, 0.8647393, 3.079137, 1, 1, 1, 1, 1,
0.6689981, -1.302709, 3.620783, 1, 1, 1, 1, 1,
0.6691778, -0.5585545, 2.531814, 0, 0, 1, 1, 1,
0.6735247, -0.959433, 2.651472, 1, 0, 0, 1, 1,
0.6772601, 0.9281434, 0.6012487, 1, 0, 0, 1, 1,
0.6774883, -0.2474364, 2.477962, 1, 0, 0, 1, 1,
0.6818353, 0.2083043, 1.804042, 1, 0, 0, 1, 1,
0.6881939, 0.441845, 1.134878, 1, 0, 0, 1, 1,
0.6915075, 0.374379, 1.037425, 0, 0, 0, 1, 1,
0.6916347, 0.6232644, -0.4230776, 0, 0, 0, 1, 1,
0.6980253, -2.328284, 2.75165, 0, 0, 0, 1, 1,
0.7005579, 1.56447, -0.2192799, 0, 0, 0, 1, 1,
0.703548, 0.660394, 2.599921, 0, 0, 0, 1, 1,
0.7062799, 0.6922653, 0.3097305, 0, 0, 0, 1, 1,
0.7143694, -0.08853181, -0.90385, 0, 0, 0, 1, 1,
0.7154759, 1.021889, 1.171931, 1, 1, 1, 1, 1,
0.7206285, -0.8094395, 2.545381, 1, 1, 1, 1, 1,
0.7401679, -0.04292927, 1.493431, 1, 1, 1, 1, 1,
0.7412376, -1.733186, 4.184766, 1, 1, 1, 1, 1,
0.7455274, 1.470534, -0.7937757, 1, 1, 1, 1, 1,
0.7471999, -0.06146363, 2.303909, 1, 1, 1, 1, 1,
0.7487419, 1.693154, -2.418133, 1, 1, 1, 1, 1,
0.7513866, -2.241173, 2.135504, 1, 1, 1, 1, 1,
0.7774333, 1.188015, 0.8594952, 1, 1, 1, 1, 1,
0.7828672, 0.3759508, 0.9859617, 1, 1, 1, 1, 1,
0.7889903, -0.2114009, 1.432638, 1, 1, 1, 1, 1,
0.7898445, -0.2976723, 0.3888425, 1, 1, 1, 1, 1,
0.79045, -0.5315244, 4.174617, 1, 1, 1, 1, 1,
0.7965197, -0.9347413, 2.737657, 1, 1, 1, 1, 1,
0.7966305, 0.1647074, 1.607803, 1, 1, 1, 1, 1,
0.7970648, 0.8201691, 1.397097, 0, 0, 1, 1, 1,
0.7990389, 2.605064, -0.3012229, 1, 0, 0, 1, 1,
0.8003133, -0.3894166, 1.283084, 1, 0, 0, 1, 1,
0.8003938, -1.487871, 3.552577, 1, 0, 0, 1, 1,
0.8008689, 0.7238288, -0.2115766, 1, 0, 0, 1, 1,
0.8008772, -0.4556656, 3.109121, 1, 0, 0, 1, 1,
0.8021641, 0.4798526, 0.8985721, 0, 0, 0, 1, 1,
0.8031386, 0.2641592, 1.164985, 0, 0, 0, 1, 1,
0.8075864, 0.187854, 0.8904716, 0, 0, 0, 1, 1,
0.8163887, 0.005941105, 0.1952458, 0, 0, 0, 1, 1,
0.8210757, -0.9007035, 1.973207, 0, 0, 0, 1, 1,
0.8291953, -0.6822153, 3.023461, 0, 0, 0, 1, 1,
0.8369747, -1.479406, 2.819475, 0, 0, 0, 1, 1,
0.8398275, -0.06253021, 2.147269, 1, 1, 1, 1, 1,
0.8537122, 0.6383129, -0.511629, 1, 1, 1, 1, 1,
0.8558633, -0.479339, 3.961901, 1, 1, 1, 1, 1,
0.8603449, 0.6982886, 0.7943038, 1, 1, 1, 1, 1,
0.8652154, -0.9128444, 2.877913, 1, 1, 1, 1, 1,
0.8653947, 0.5348396, 2.220205, 1, 1, 1, 1, 1,
0.8695906, 0.9157643, 0.8216724, 1, 1, 1, 1, 1,
0.8855988, -0.1155255, 1.82601, 1, 1, 1, 1, 1,
0.90477, -0.7122678, 0.5994934, 1, 1, 1, 1, 1,
0.9207422, -0.1169723, 2.579092, 1, 1, 1, 1, 1,
0.9386477, -1.704872, 2.218485, 1, 1, 1, 1, 1,
0.9395185, -1.007397, 3.53592, 1, 1, 1, 1, 1,
0.9425833, 0.2185014, 1.237348, 1, 1, 1, 1, 1,
0.9464173, -0.4622157, 3.506088, 1, 1, 1, 1, 1,
0.9466566, -0.4966928, 1.694729, 1, 1, 1, 1, 1,
0.9507706, 1.285453, 1.712782, 0, 0, 1, 1, 1,
0.9544059, -0.1884418, 3.636733, 1, 0, 0, 1, 1,
0.9551975, 0.07727633, 0.5539437, 1, 0, 0, 1, 1,
0.9616975, 1.559245, -0.1407078, 1, 0, 0, 1, 1,
0.9623883, 1.089392, 0.1734774, 1, 0, 0, 1, 1,
0.9624504, -0.08274895, 0.8955902, 1, 0, 0, 1, 1,
0.9628399, 0.7213127, 0.998688, 0, 0, 0, 1, 1,
0.9628419, -0.615077, 1.662141, 0, 0, 0, 1, 1,
0.9729671, -0.9338602, 1.563948, 0, 0, 0, 1, 1,
0.9736922, 0.1149489, 2.062474, 0, 0, 0, 1, 1,
0.9771078, -0.7697143, 2.224077, 0, 0, 0, 1, 1,
0.9917842, 1.497725, -0.5997843, 0, 0, 0, 1, 1,
0.9933894, -0.5898396, 1.849672, 0, 0, 0, 1, 1,
0.9990873, 1.044144, -0.166868, 1, 1, 1, 1, 1,
1.0027, -0.1668747, 2.913246, 1, 1, 1, 1, 1,
1.003824, 1.534649, 2.543933, 1, 1, 1, 1, 1,
1.010048, -1.182474, 2.162804, 1, 1, 1, 1, 1,
1.015306, -0.6251027, 0.8269325, 1, 1, 1, 1, 1,
1.017085, 0.6179097, -0.6437489, 1, 1, 1, 1, 1,
1.030666, 0.5493816, 1.560622, 1, 1, 1, 1, 1,
1.032923, -1.56773, 2.450869, 1, 1, 1, 1, 1,
1.034365, -0.1342717, 2.665514, 1, 1, 1, 1, 1,
1.038381, 0.814584, 0.6163288, 1, 1, 1, 1, 1,
1.04054, -1.154241, 2.822185, 1, 1, 1, 1, 1,
1.040596, 0.230491, 4.28516, 1, 1, 1, 1, 1,
1.044531, 2.416718, 0.9523643, 1, 1, 1, 1, 1,
1.049013, -0.4157071, 1.815738, 1, 1, 1, 1, 1,
1.05847, -0.2568118, 2.85346, 1, 1, 1, 1, 1,
1.06549, 0.07212417, 1.402372, 0, 0, 1, 1, 1,
1.066052, 2.118844, 0.3893568, 1, 0, 0, 1, 1,
1.074163, -0.2072424, 2.116317, 1, 0, 0, 1, 1,
1.086482, 0.4869027, 0.7867581, 1, 0, 0, 1, 1,
1.092734, -0.7196562, 0.3101659, 1, 0, 0, 1, 1,
1.09303, -2.394213, 1.353117, 1, 0, 0, 1, 1,
1.094983, -0.1536857, 3.350695, 0, 0, 0, 1, 1,
1.107887, -0.6215673, 0.8095784, 0, 0, 0, 1, 1,
1.118608, -0.3676332, 1.242172, 0, 0, 0, 1, 1,
1.125532, 0.0011183, 2.749389, 0, 0, 0, 1, 1,
1.144599, -0.2319887, 0.7858163, 0, 0, 0, 1, 1,
1.162649, 1.03817, -0.3235842, 0, 0, 0, 1, 1,
1.168754, 1.552816, 1.122729, 0, 0, 0, 1, 1,
1.173625, 0.2112482, 0.7097458, 1, 1, 1, 1, 1,
1.174482, 0.2764119, -0.2163327, 1, 1, 1, 1, 1,
1.176965, -0.6185647, 1.863495, 1, 1, 1, 1, 1,
1.177626, -2.005629, 0.8408779, 1, 1, 1, 1, 1,
1.180692, 0.9511287, -1.255096, 1, 1, 1, 1, 1,
1.183544, 0.7293437, -0.2235768, 1, 1, 1, 1, 1,
1.186834, -1.707715, 3.083296, 1, 1, 1, 1, 1,
1.189622, -0.7844046, 1.961169, 1, 1, 1, 1, 1,
1.190671, -0.4100281, 3.582382, 1, 1, 1, 1, 1,
1.193073, -0.1810666, 1.177445, 1, 1, 1, 1, 1,
1.195412, 0.3439369, 1.863595, 1, 1, 1, 1, 1,
1.19946, -0.8870647, 2.742629, 1, 1, 1, 1, 1,
1.200861, -0.3030591, 1.751793, 1, 1, 1, 1, 1,
1.201757, 0.906, -0.03441153, 1, 1, 1, 1, 1,
1.202426, 0.3231971, 0.6504874, 1, 1, 1, 1, 1,
1.21148, -0.3524409, 1.2127, 0, 0, 1, 1, 1,
1.220537, -0.09357089, 2.050347, 1, 0, 0, 1, 1,
1.223362, 0.5742781, 1.376342, 1, 0, 0, 1, 1,
1.223943, -0.5373752, 0.7540439, 1, 0, 0, 1, 1,
1.227777, -0.8123025, 1.518467, 1, 0, 0, 1, 1,
1.237039, 1.060906, -0.0002773849, 1, 0, 0, 1, 1,
1.241609, 0.3729215, 1.05842, 0, 0, 0, 1, 1,
1.247051, -0.8362074, 2.696078, 0, 0, 0, 1, 1,
1.249261, 0.4604058, 2.190809, 0, 0, 0, 1, 1,
1.249526, 0.8900489, 2.725254, 0, 0, 0, 1, 1,
1.255313, -0.8296075, 0.5368673, 0, 0, 0, 1, 1,
1.256042, -0.224272, 2.174082, 0, 0, 0, 1, 1,
1.264737, 0.9852534, 1.012695, 0, 0, 0, 1, 1,
1.271233, -0.08020578, 3.177843, 1, 1, 1, 1, 1,
1.27259, -1.541208, 2.697035, 1, 1, 1, 1, 1,
1.276658, -0.8046393, 2.921121, 1, 1, 1, 1, 1,
1.277566, 0.5466511, 2.384347, 1, 1, 1, 1, 1,
1.298629, 0.9898301, 1.174148, 1, 1, 1, 1, 1,
1.311008, 0.3996503, 0.04080557, 1, 1, 1, 1, 1,
1.313022, 0.7370167, 2.070091, 1, 1, 1, 1, 1,
1.321644, 0.5751833, 0.748722, 1, 1, 1, 1, 1,
1.330165, 0.18466, 1.018538, 1, 1, 1, 1, 1,
1.33341, -0.8954554, 2.458981, 1, 1, 1, 1, 1,
1.335243, 0.1431953, 2.317371, 1, 1, 1, 1, 1,
1.33989, 0.8834225, 1.366027, 1, 1, 1, 1, 1,
1.34742, -0.05896844, 2.896549, 1, 1, 1, 1, 1,
1.34771, -0.5487344, 1.614168, 1, 1, 1, 1, 1,
1.367854, -0.9711486, 2.276156, 1, 1, 1, 1, 1,
1.368152, 0.1820738, 0.5822266, 0, 0, 1, 1, 1,
1.382727, 0.1894446, 2.121212, 1, 0, 0, 1, 1,
1.383979, -0.2379617, 1.020143, 1, 0, 0, 1, 1,
1.386811, -0.2313, 1.104003, 1, 0, 0, 1, 1,
1.396544, 0.6971104, -0.7259846, 1, 0, 0, 1, 1,
1.403381, -0.604369, 2.467144, 1, 0, 0, 1, 1,
1.407973, 1.228713, 0.8712919, 0, 0, 0, 1, 1,
1.408499, 0.4291416, 2.742075, 0, 0, 0, 1, 1,
1.412529, -1.08654, 3.405957, 0, 0, 0, 1, 1,
1.426086, -0.6430442, -0.2742813, 0, 0, 0, 1, 1,
1.429158, 0.5815991, 2.208184, 0, 0, 0, 1, 1,
1.438236, -0.197733, 2.115356, 0, 0, 0, 1, 1,
1.44783, 0.2979503, 0.7231853, 0, 0, 0, 1, 1,
1.464336, -0.02443851, 3.015123, 1, 1, 1, 1, 1,
1.467819, -0.2699993, 3.596322, 1, 1, 1, 1, 1,
1.494286, 1.412257, -0.2672986, 1, 1, 1, 1, 1,
1.500932, -0.004438083, 1.050233, 1, 1, 1, 1, 1,
1.50654, -0.3880345, 0.5788966, 1, 1, 1, 1, 1,
1.507385, 0.8046004, 0.3805918, 1, 1, 1, 1, 1,
1.518244, -0.9712794, 4.151219, 1, 1, 1, 1, 1,
1.525234, 1.184576, 1.870573, 1, 1, 1, 1, 1,
1.530354, 1.674437, 0.1626156, 1, 1, 1, 1, 1,
1.531066, 1.058025, 1.42914, 1, 1, 1, 1, 1,
1.531839, -0.5803997, 0.03372115, 1, 1, 1, 1, 1,
1.549667, 1.918606, -0.5436177, 1, 1, 1, 1, 1,
1.549962, -0.964949, 1.060376, 1, 1, 1, 1, 1,
1.556328, -0.4706, 1.969652, 1, 1, 1, 1, 1,
1.564034, 1.294588, 1.524619, 1, 1, 1, 1, 1,
1.589383, 1.249447, 0.1201748, 0, 0, 1, 1, 1,
1.60702, 0.7160681, 0.6231714, 1, 0, 0, 1, 1,
1.610383, 0.4900833, 0.5448403, 1, 0, 0, 1, 1,
1.626356, 1.042446, -0.4572981, 1, 0, 0, 1, 1,
1.638738, 0.4105499, -0.1572396, 1, 0, 0, 1, 1,
1.644192, -0.3233005, 1.077078, 1, 0, 0, 1, 1,
1.672862, -0.2449845, 1.014867, 0, 0, 0, 1, 1,
1.684378, 0.06979126, 3.259807, 0, 0, 0, 1, 1,
1.703776, -1.775252, 2.780866, 0, 0, 0, 1, 1,
1.73516, 1.180225, 1.992434, 0, 0, 0, 1, 1,
1.741393, -0.8529748, 1.440908, 0, 0, 0, 1, 1,
1.746756, -0.2093297, 2.668302, 0, 0, 0, 1, 1,
1.757434, -1.292681, 2.134124, 0, 0, 0, 1, 1,
1.758857, -0.06104293, 1.233297, 1, 1, 1, 1, 1,
1.790407, -0.7964928, 0.5015551, 1, 1, 1, 1, 1,
1.811424, 0.1971789, 2.337215, 1, 1, 1, 1, 1,
1.817092, -0.7245359, 1.182076, 1, 1, 1, 1, 1,
1.84564, -0.7224087, 2.841458, 1, 1, 1, 1, 1,
1.84967, 0.9323149, 0.5342183, 1, 1, 1, 1, 1,
1.851003, 0.4851243, 2.690669, 1, 1, 1, 1, 1,
1.869049, 0.2927815, 0.07177903, 1, 1, 1, 1, 1,
1.871904, 1.142359, 2.012309, 1, 1, 1, 1, 1,
1.872044, -0.3325805, 0.9350567, 1, 1, 1, 1, 1,
1.910995, -1.891411, 2.202925, 1, 1, 1, 1, 1,
1.924568, -0.4284661, 0.6327891, 1, 1, 1, 1, 1,
1.932335, -1.962643, 2.417689, 1, 1, 1, 1, 1,
1.953856, 1.160092, -0.1253279, 1, 1, 1, 1, 1,
1.973465, -0.2318924, 1.652651, 1, 1, 1, 1, 1,
1.980183, -0.3621559, -0.61581, 0, 0, 1, 1, 1,
2.009965, 0.6886606, 1.693269, 1, 0, 0, 1, 1,
2.05863, 0.3867189, -0.5882331, 1, 0, 0, 1, 1,
2.082175, -0.703235, 2.465935, 1, 0, 0, 1, 1,
2.084961, 1.216546, 1.230038, 1, 0, 0, 1, 1,
2.097296, -0.8938067, 2.002712, 1, 0, 0, 1, 1,
2.120662, -1.632635, 1.443917, 0, 0, 0, 1, 1,
2.309431, -0.5304921, 1.335345, 0, 0, 0, 1, 1,
2.323409, 0.6877771, 0.8211491, 0, 0, 0, 1, 1,
2.335654, -0.984473, 2.358969, 0, 0, 0, 1, 1,
2.35896, 1.032729, 1.473757, 0, 0, 0, 1, 1,
2.479182, 0.4676732, 1.570764, 0, 0, 0, 1, 1,
2.502316, -0.1443536, 2.545567, 0, 0, 0, 1, 1,
2.57382, 1.487366, -0.7371684, 1, 1, 1, 1, 1,
2.625684, -1.142802, 2.397714, 1, 1, 1, 1, 1,
2.633482, -1.858987, 4.351998, 1, 1, 1, 1, 1,
2.759447, 2.411195, 1.496218, 1, 1, 1, 1, 1,
2.94786, 1.831089, 2.460841, 1, 1, 1, 1, 1,
3.173125, 0.02230894, 1.317137, 1, 1, 1, 1, 1,
3.397467, -3.011064, 0.3042881, 1, 1, 1, 1, 1
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
var radius = 9.455931;
var distance = 33.21356;
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
mvMatrix.translate( -0.1887736, -0.07141352, 0.05686498 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.21356);
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