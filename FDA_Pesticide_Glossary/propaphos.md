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
-3.583821, -0.03258949, -1.132352, 1, 0, 0, 1,
-3.290216, -0.1028161, -2.320633, 1, 0.007843138, 0, 1,
-3.199211, 0.324363, -2.881366, 1, 0.01176471, 0, 1,
-3.14984, -0.08037283, -1.23548, 1, 0.01960784, 0, 1,
-2.924064, -0.9232757, -3.277243, 1, 0.02352941, 0, 1,
-2.865654, 0.1744227, -0.2702875, 1, 0.03137255, 0, 1,
-2.710462, -0.07476405, -1.637258, 1, 0.03529412, 0, 1,
-2.554219, 0.2186289, -1.574082, 1, 0.04313726, 0, 1,
-2.497363, 0.8176212, -2.001095, 1, 0.04705882, 0, 1,
-2.446488, 0.4318426, -0.0351764, 1, 0.05490196, 0, 1,
-2.444716, -1.500181, -3.57978, 1, 0.05882353, 0, 1,
-2.412386, 0.9683369, -1.983126, 1, 0.06666667, 0, 1,
-2.291856, -2.007654, -2.374231, 1, 0.07058824, 0, 1,
-2.22274, 1.813362, -0.1898903, 1, 0.07843138, 0, 1,
-2.15781, 1.719465, -0.9191673, 1, 0.08235294, 0, 1,
-2.140897, 0.7494114, 0.1209579, 1, 0.09019608, 0, 1,
-2.139821, 0.6921134, -1.509884, 1, 0.09411765, 0, 1,
-2.137925, 0.1082654, -0.6801327, 1, 0.1019608, 0, 1,
-2.115882, -1.326215, -2.819532, 1, 0.1098039, 0, 1,
-2.110965, -0.3528871, -0.9492105, 1, 0.1137255, 0, 1,
-2.100228, 0.9501974, -2.068295, 1, 0.1215686, 0, 1,
-2.097941, -0.9559274, -4.155665, 1, 0.1254902, 0, 1,
-2.068307, -1.355026, -1.324194, 1, 0.1333333, 0, 1,
-2.061157, -0.4564864, -3.725716, 1, 0.1372549, 0, 1,
-2.03797, 1.851343, 0.3436353, 1, 0.145098, 0, 1,
-2.035095, -0.423001, -3.662193, 1, 0.1490196, 0, 1,
-2.016535, 0.2040035, -2.158599, 1, 0.1568628, 0, 1,
-1.937803, 3.196504, -0.198343, 1, 0.1607843, 0, 1,
-1.901995, -0.2345227, -0.9845024, 1, 0.1686275, 0, 1,
-1.875454, 0.6924323, 0.349843, 1, 0.172549, 0, 1,
-1.837774, -0.8327605, -1.62398, 1, 0.1803922, 0, 1,
-1.829406, -0.5792041, -3.404736, 1, 0.1843137, 0, 1,
-1.814007, 0.7154641, -0.4043114, 1, 0.1921569, 0, 1,
-1.808993, -0.4643817, -0.4183094, 1, 0.1960784, 0, 1,
-1.791646, 2.627927, 0.1139981, 1, 0.2039216, 0, 1,
-1.790491, -0.5268384, 0.6191878, 1, 0.2117647, 0, 1,
-1.770299, -0.124328, -2.578823, 1, 0.2156863, 0, 1,
-1.763335, 1.179854, -1.387263, 1, 0.2235294, 0, 1,
-1.74115, -1.625723, -0.6826663, 1, 0.227451, 0, 1,
-1.738191, 1.101927, -1.628686, 1, 0.2352941, 0, 1,
-1.7381, 0.9471703, -0.1395883, 1, 0.2392157, 0, 1,
-1.729334, -1.556588, -3.067648, 1, 0.2470588, 0, 1,
-1.728092, 0.6502046, -1.587768, 1, 0.2509804, 0, 1,
-1.72068, -1.935267, -3.054338, 1, 0.2588235, 0, 1,
-1.713172, 1.552638, -0.5324984, 1, 0.2627451, 0, 1,
-1.707866, -1.045375, -3.018703, 1, 0.2705882, 0, 1,
-1.703666, 0.7769317, -0.8253112, 1, 0.2745098, 0, 1,
-1.698755, 0.3267674, -1.208636, 1, 0.282353, 0, 1,
-1.696186, -1.190923, -1.86456, 1, 0.2862745, 0, 1,
-1.684214, 0.2559894, -1.688087, 1, 0.2941177, 0, 1,
-1.679504, -0.7987949, -2.716533, 1, 0.3019608, 0, 1,
-1.672704, -0.2158891, -3.641089, 1, 0.3058824, 0, 1,
-1.645781, -1.154731, -3.470068, 1, 0.3137255, 0, 1,
-1.643483, 1.414703, 0.2724362, 1, 0.3176471, 0, 1,
-1.639014, -0.4958963, -0.1939579, 1, 0.3254902, 0, 1,
-1.628814, -0.4986117, -1.436362, 1, 0.3294118, 0, 1,
-1.624488, -0.0109665, -0.4132122, 1, 0.3372549, 0, 1,
-1.600452, -0.9898174, -1.514646, 1, 0.3411765, 0, 1,
-1.583387, -2.002339, -1.583341, 1, 0.3490196, 0, 1,
-1.578081, -1.426703, 0.03596077, 1, 0.3529412, 0, 1,
-1.568502, -0.1695456, -1.123206, 1, 0.3607843, 0, 1,
-1.551263, 0.7921402, -1.261182, 1, 0.3647059, 0, 1,
-1.535452, 2.533381, -0.1389588, 1, 0.372549, 0, 1,
-1.531467, 0.4152977, -2.793181, 1, 0.3764706, 0, 1,
-1.513765, 1.304693, -1.761746, 1, 0.3843137, 0, 1,
-1.50801, 0.7224994, -2.705802, 1, 0.3882353, 0, 1,
-1.506062, -0.2164237, -1.206256, 1, 0.3960784, 0, 1,
-1.50295, -1.078963, -0.8976102, 1, 0.4039216, 0, 1,
-1.495726, -0.7650158, -0.8719113, 1, 0.4078431, 0, 1,
-1.493031, -0.01659591, -1.032998, 1, 0.4156863, 0, 1,
-1.477449, -1.580048, -0.8062703, 1, 0.4196078, 0, 1,
-1.471713, -0.941748, -1.697273, 1, 0.427451, 0, 1,
-1.466886, 1.012451, -1.606899, 1, 0.4313726, 0, 1,
-1.463629, -0.1759828, 0.09982771, 1, 0.4392157, 0, 1,
-1.459049, 0.4120654, -1.452901, 1, 0.4431373, 0, 1,
-1.448777, -0.7211269, -0.4465482, 1, 0.4509804, 0, 1,
-1.436639, -0.9941197, -2.439353, 1, 0.454902, 0, 1,
-1.435815, 1.997014, -0.5383318, 1, 0.4627451, 0, 1,
-1.406881, 2.30908, 0.6279035, 1, 0.4666667, 0, 1,
-1.39536, 1.008621, -0.4193923, 1, 0.4745098, 0, 1,
-1.392312, 0.6399756, -1.407256, 1, 0.4784314, 0, 1,
-1.387458, -1.591216, -2.651049, 1, 0.4862745, 0, 1,
-1.386265, 1.447347, 0.7737353, 1, 0.4901961, 0, 1,
-1.37785, -0.2201213, -1.887652, 1, 0.4980392, 0, 1,
-1.375489, -1.920275, -2.96635, 1, 0.5058824, 0, 1,
-1.363504, -0.2744817, -3.022131, 1, 0.509804, 0, 1,
-1.358472, 0.0325571, -2.173432, 1, 0.5176471, 0, 1,
-1.353995, -1.168113, -2.349084, 1, 0.5215687, 0, 1,
-1.349129, -0.6997721, -3.748396, 1, 0.5294118, 0, 1,
-1.336534, 0.6154617, -1.625037, 1, 0.5333334, 0, 1,
-1.329589, 0.5340065, -0.5508497, 1, 0.5411765, 0, 1,
-1.325278, -0.1700799, -0.2633471, 1, 0.5450981, 0, 1,
-1.323952, -1.236753, -3.409083, 1, 0.5529412, 0, 1,
-1.319508, -0.7955152, -1.715882, 1, 0.5568628, 0, 1,
-1.312158, 0.3575076, -3.077559, 1, 0.5647059, 0, 1,
-1.311971, -0.4146443, -3.039502, 1, 0.5686275, 0, 1,
-1.308418, -0.08001447, -0.5926145, 1, 0.5764706, 0, 1,
-1.306191, -0.326063, -2.042152, 1, 0.5803922, 0, 1,
-1.30096, -0.7046444, -2.163938, 1, 0.5882353, 0, 1,
-1.29136, 0.5293493, -2.046139, 1, 0.5921569, 0, 1,
-1.286599, -1.151751, -1.649657, 1, 0.6, 0, 1,
-1.286496, 0.7264106, 0.09152005, 1, 0.6078432, 0, 1,
-1.286188, 1.135866, 0.6981549, 1, 0.6117647, 0, 1,
-1.284128, 0.7688931, -1.955361, 1, 0.6196079, 0, 1,
-1.282758, 1.458454, 1.521697, 1, 0.6235294, 0, 1,
-1.277069, 0.09026051, -2.60392, 1, 0.6313726, 0, 1,
-1.276254, -1.110608, -4.144027, 1, 0.6352941, 0, 1,
-1.268975, -0.8167486, -0.9474223, 1, 0.6431373, 0, 1,
-1.247764, 0.5556354, -1.111197, 1, 0.6470588, 0, 1,
-1.237734, -1.087827, -1.738247, 1, 0.654902, 0, 1,
-1.235721, -0.5355496, -1.640744, 1, 0.6588235, 0, 1,
-1.233234, 1.009944, 0.293407, 1, 0.6666667, 0, 1,
-1.226659, -0.7814968, -3.300717, 1, 0.6705883, 0, 1,
-1.22279, 2.428671, -0.435013, 1, 0.6784314, 0, 1,
-1.209309, 0.1369921, -2.230746, 1, 0.682353, 0, 1,
-1.207327, 0.5118731, -1.218946, 1, 0.6901961, 0, 1,
-1.202015, 1.711586, 0.3869081, 1, 0.6941177, 0, 1,
-1.195322, 1.367359, -0.5986932, 1, 0.7019608, 0, 1,
-1.184076, -0.6160488, -2.658117, 1, 0.7098039, 0, 1,
-1.184066, -0.6685471, -3.210776, 1, 0.7137255, 0, 1,
-1.181147, 0.02283383, -2.483661, 1, 0.7215686, 0, 1,
-1.164146, -1.082178, -1.37665, 1, 0.7254902, 0, 1,
-1.163455, -0.1396913, -2.266458, 1, 0.7333333, 0, 1,
-1.161716, -2.741068, -2.03936, 1, 0.7372549, 0, 1,
-1.157672, 0.843025, 1.355103, 1, 0.7450981, 0, 1,
-1.157032, 0.5526131, -1.61906, 1, 0.7490196, 0, 1,
-1.14931, 0.1533841, -0.3902284, 1, 0.7568628, 0, 1,
-1.134188, -0.2996008, -2.419546, 1, 0.7607843, 0, 1,
-1.129142, -0.6035035, -1.567639, 1, 0.7686275, 0, 1,
-1.124626, 2.392019, -1.156757, 1, 0.772549, 0, 1,
-1.120837, 1.188253, -0.899, 1, 0.7803922, 0, 1,
-1.114492, 0.3358448, -0.763895, 1, 0.7843137, 0, 1,
-1.110339, 1.447608, -1.37292, 1, 0.7921569, 0, 1,
-1.107379, -1.414558, -2.534787, 1, 0.7960784, 0, 1,
-1.105134, 0.6137787, -1.098385, 1, 0.8039216, 0, 1,
-1.104853, -0.6547725, -4.861826, 1, 0.8117647, 0, 1,
-1.100753, -1.075051, -1.115246, 1, 0.8156863, 0, 1,
-1.100282, 0.08444951, -2.011731, 1, 0.8235294, 0, 1,
-1.099691, 1.588839, -0.735305, 1, 0.827451, 0, 1,
-1.096961, -0.421203, -1.172061, 1, 0.8352941, 0, 1,
-1.095478, -1.147033, -4.270916, 1, 0.8392157, 0, 1,
-1.091164, 1.838491, 1.341561, 1, 0.8470588, 0, 1,
-1.08441, 0.6344526, -0.7476528, 1, 0.8509804, 0, 1,
-1.082792, 0.8421677, -0.9814274, 1, 0.8588235, 0, 1,
-1.080114, -0.758553, -0.8811342, 1, 0.8627451, 0, 1,
-1.077299, 1.076536, -0.5878991, 1, 0.8705882, 0, 1,
-1.075178, -0.2249489, -1.353998, 1, 0.8745098, 0, 1,
-1.063987, 0.3150393, -0.9918843, 1, 0.8823529, 0, 1,
-1.063215, -0.06761057, -2.226722, 1, 0.8862745, 0, 1,
-1.057817, 1.163889, 1.220859, 1, 0.8941177, 0, 1,
-1.057032, -0.05740147, -1.631528, 1, 0.8980392, 0, 1,
-1.05636, -0.4774429, -2.074485, 1, 0.9058824, 0, 1,
-1.053056, -0.4438587, -2.650949, 1, 0.9137255, 0, 1,
-1.049178, 0.3712729, -0.8471484, 1, 0.9176471, 0, 1,
-1.047756, -0.5644661, -1.348723, 1, 0.9254902, 0, 1,
-1.030317, -0.6381906, -2.416149, 1, 0.9294118, 0, 1,
-1.02943, 0.2062531, -1.164336, 1, 0.9372549, 0, 1,
-1.02779, -1.263007, -2.276523, 1, 0.9411765, 0, 1,
-1.027712, 0.3702728, -0.9358802, 1, 0.9490196, 0, 1,
-1.02694, 0.4035312, -0.7143687, 1, 0.9529412, 0, 1,
-1.023199, 1.446078, 0.6311223, 1, 0.9607843, 0, 1,
-1.020278, -1.185215, -1.860016, 1, 0.9647059, 0, 1,
-1.001099, 0.8656982, -1.40664, 1, 0.972549, 0, 1,
-0.9954654, -0.2647962, -2.24602, 1, 0.9764706, 0, 1,
-0.993835, 0.3392702, -0.03793802, 1, 0.9843137, 0, 1,
-0.9896367, -1.209302, -3.57117, 1, 0.9882353, 0, 1,
-0.9846262, 0.1676743, -2.704578, 1, 0.9960784, 0, 1,
-0.9734616, -0.1610792, -3.319199, 0.9960784, 1, 0, 1,
-0.9679493, -0.3111435, -1.586493, 0.9921569, 1, 0, 1,
-0.9574382, -0.3339595, -1.029087, 0.9843137, 1, 0, 1,
-0.9533986, 0.0782472, -0.2132013, 0.9803922, 1, 0, 1,
-0.9452648, 0.5262522, -1.284072, 0.972549, 1, 0, 1,
-0.9409375, 0.8281267, -1.403753, 0.9686275, 1, 0, 1,
-0.9356549, 0.7945821, -0.7863353, 0.9607843, 1, 0, 1,
-0.9323915, 0.5398592, -1.571136, 0.9568627, 1, 0, 1,
-0.9306636, 0.02491109, -2.487756, 0.9490196, 1, 0, 1,
-0.9292294, -0.224705, -1.988217, 0.945098, 1, 0, 1,
-0.918117, 0.4619145, -0.6614384, 0.9372549, 1, 0, 1,
-0.914102, -1.21292, -2.377882, 0.9333333, 1, 0, 1,
-0.9123578, 0.9860942, -0.7386928, 0.9254902, 1, 0, 1,
-0.9118556, 0.2522432, -1.377779, 0.9215686, 1, 0, 1,
-0.9102616, 0.08278521, -0.9922081, 0.9137255, 1, 0, 1,
-0.9056687, -0.1020366, -1.466809, 0.9098039, 1, 0, 1,
-0.9001598, 0.1498515, -0.5265064, 0.9019608, 1, 0, 1,
-0.8961768, -0.3699239, -2.44959, 0.8941177, 1, 0, 1,
-0.8956513, -0.3225676, -3.336817, 0.8901961, 1, 0, 1,
-0.8926784, 1.958159, -1.100659, 0.8823529, 1, 0, 1,
-0.8885279, -0.9345245, -3.114269, 0.8784314, 1, 0, 1,
-0.8849228, -1.045792, -3.995748, 0.8705882, 1, 0, 1,
-0.8728383, -0.137447, -2.364989, 0.8666667, 1, 0, 1,
-0.8704615, -2.701247, -1.877787, 0.8588235, 1, 0, 1,
-0.8684126, 0.7437094, -1.575339, 0.854902, 1, 0, 1,
-0.86669, 0.01452425, -1.27507, 0.8470588, 1, 0, 1,
-0.8631828, -0.9029881, -2.272051, 0.8431373, 1, 0, 1,
-0.8598736, 0.9628744, 0.04905951, 0.8352941, 1, 0, 1,
-0.8501664, -0.2422902, -2.001343, 0.8313726, 1, 0, 1,
-0.8439271, -1.345417, -2.822742, 0.8235294, 1, 0, 1,
-0.8419886, 1.342722, 0.3329226, 0.8196079, 1, 0, 1,
-0.8409435, -0.1576551, -2.082262, 0.8117647, 1, 0, 1,
-0.8407938, -1.763811, -5.109159, 0.8078431, 1, 0, 1,
-0.8407548, -0.0554301, 0.09215251, 0.8, 1, 0, 1,
-0.8406193, -0.4918675, -2.985583, 0.7921569, 1, 0, 1,
-0.8352271, 1.899899, 0.6791122, 0.7882353, 1, 0, 1,
-0.8295191, 1.884418, -2.066716, 0.7803922, 1, 0, 1,
-0.8290897, 1.149513, -2.983877, 0.7764706, 1, 0, 1,
-0.8289258, 0.4460061, -0.0002987476, 0.7686275, 1, 0, 1,
-0.8274251, 0.450544, -1.740362, 0.7647059, 1, 0, 1,
-0.8205612, -0.7444884, -3.418957, 0.7568628, 1, 0, 1,
-0.8172395, -0.06407557, -2.060603, 0.7529412, 1, 0, 1,
-0.8058866, -1.122732, -0.8978766, 0.7450981, 1, 0, 1,
-0.8004656, 0.6042146, 0.5187699, 0.7411765, 1, 0, 1,
-0.7987455, 0.9372827, -0.5625264, 0.7333333, 1, 0, 1,
-0.7972736, -0.9889222, -2.892913, 0.7294118, 1, 0, 1,
-0.7869592, 0.3497954, -2.235054, 0.7215686, 1, 0, 1,
-0.7864499, -0.9524539, -2.921916, 0.7176471, 1, 0, 1,
-0.7647213, -1.131976, -2.463377, 0.7098039, 1, 0, 1,
-0.7614767, 1.618103, -0.979977, 0.7058824, 1, 0, 1,
-0.7603424, -0.05050621, -1.513479, 0.6980392, 1, 0, 1,
-0.7576586, 0.3132761, -0.6890805, 0.6901961, 1, 0, 1,
-0.7518321, -0.846482, -2.586599, 0.6862745, 1, 0, 1,
-0.7516199, 0.1694891, -2.926566, 0.6784314, 1, 0, 1,
-0.7512796, -1.004013, -1.951728, 0.6745098, 1, 0, 1,
-0.7504217, 0.2005576, -0.2160502, 0.6666667, 1, 0, 1,
-0.7441097, -1.205043, -2.853223, 0.6627451, 1, 0, 1,
-0.7267401, 1.800932, -0.1216651, 0.654902, 1, 0, 1,
-0.7191541, 2.607236, 0.9977971, 0.6509804, 1, 0, 1,
-0.714641, 0.9262403, 0.08187668, 0.6431373, 1, 0, 1,
-0.7107207, -2.376366, -2.609813, 0.6392157, 1, 0, 1,
-0.7098353, -0.9740157, -1.732622, 0.6313726, 1, 0, 1,
-0.7045407, -1.009108, -3.289448, 0.627451, 1, 0, 1,
-0.7040485, -1.443593, -2.675267, 0.6196079, 1, 0, 1,
-0.7027448, 0.1443317, -2.529415, 0.6156863, 1, 0, 1,
-0.7003944, 0.8630515, 0.3182827, 0.6078432, 1, 0, 1,
-0.6998649, 0.676785, 1.080868, 0.6039216, 1, 0, 1,
-0.6988989, 2.165177, 0.3844312, 0.5960785, 1, 0, 1,
-0.6988888, -0.2512074, -3.494275, 0.5882353, 1, 0, 1,
-0.697108, -0.7453676, -2.654871, 0.5843138, 1, 0, 1,
-0.6882957, 0.4087848, -1.238019, 0.5764706, 1, 0, 1,
-0.6670442, -0.5029557, -1.908355, 0.572549, 1, 0, 1,
-0.665108, 0.833317, -0.2348998, 0.5647059, 1, 0, 1,
-0.6619435, -0.4037641, -1.777431, 0.5607843, 1, 0, 1,
-0.6581501, -0.746371, -2.416166, 0.5529412, 1, 0, 1,
-0.6507818, -0.1064297, -1.463814, 0.5490196, 1, 0, 1,
-0.6496645, -0.9563656, -3.805007, 0.5411765, 1, 0, 1,
-0.6494321, 0.9256406, -0.7749081, 0.5372549, 1, 0, 1,
-0.6480657, -0.7467692, -3.34587, 0.5294118, 1, 0, 1,
-0.6430199, 0.6017779, -0.83634, 0.5254902, 1, 0, 1,
-0.642229, -0.2529505, -2.674311, 0.5176471, 1, 0, 1,
-0.6416513, 0.5780082, -1.325045, 0.5137255, 1, 0, 1,
-0.641622, 0.6613486, 0.2304617, 0.5058824, 1, 0, 1,
-0.6335381, 0.1846078, -0.8234733, 0.5019608, 1, 0, 1,
-0.6319294, -0.2768322, -3.669236, 0.4941176, 1, 0, 1,
-0.6314446, -0.3853225, -1.618497, 0.4862745, 1, 0, 1,
-0.626083, -0.1435662, -0.9268496, 0.4823529, 1, 0, 1,
-0.6260163, 0.6023852, 0.1893583, 0.4745098, 1, 0, 1,
-0.6232693, 0.4258722, -2.616925, 0.4705882, 1, 0, 1,
-0.6211459, 0.3386132, 0.8112305, 0.4627451, 1, 0, 1,
-0.6194537, 0.5970643, 1.325869, 0.4588235, 1, 0, 1,
-0.6158642, 0.1325805, -0.6406838, 0.4509804, 1, 0, 1,
-0.6152714, 0.768948, -0.4923771, 0.4470588, 1, 0, 1,
-0.6145191, 0.5559396, 0.5753679, 0.4392157, 1, 0, 1,
-0.6130022, -0.2754079, -3.177897, 0.4352941, 1, 0, 1,
-0.6100391, 0.05010571, -2.619899, 0.427451, 1, 0, 1,
-0.6017841, -1.388747, -2.319941, 0.4235294, 1, 0, 1,
-0.6007617, -0.3302185, -2.131171, 0.4156863, 1, 0, 1,
-0.5977743, 1.483394, -1.160911, 0.4117647, 1, 0, 1,
-0.5955586, 0.4464919, -2.17971, 0.4039216, 1, 0, 1,
-0.5908265, 0.3368054, -1.065926, 0.3960784, 1, 0, 1,
-0.5906378, 0.6670202, -0.4929778, 0.3921569, 1, 0, 1,
-0.5898889, -0.7013494, -2.219899, 0.3843137, 1, 0, 1,
-0.5890191, 0.9427088, 0.8744951, 0.3803922, 1, 0, 1,
-0.5835326, 0.5887327, -1.05262, 0.372549, 1, 0, 1,
-0.5830317, 1.218448, 0.01468915, 0.3686275, 1, 0, 1,
-0.5819154, 0.1321645, -2.392253, 0.3607843, 1, 0, 1,
-0.5725363, -0.8970747, -2.229833, 0.3568628, 1, 0, 1,
-0.5650669, -1.589912, -3.631794, 0.3490196, 1, 0, 1,
-0.5585871, 1.929112, -1.361677, 0.345098, 1, 0, 1,
-0.555308, 0.3191903, -1.825999, 0.3372549, 1, 0, 1,
-0.5545107, -0.9961529, -3.897064, 0.3333333, 1, 0, 1,
-0.5529579, -1.029864, -2.82975, 0.3254902, 1, 0, 1,
-0.5520185, 0.3251453, -1.187066, 0.3215686, 1, 0, 1,
-0.5508887, -0.5258985, -2.610998, 0.3137255, 1, 0, 1,
-0.5481195, -0.1017957, -2.215044, 0.3098039, 1, 0, 1,
-0.5468341, 1.016389, 0.4468426, 0.3019608, 1, 0, 1,
-0.5456414, -0.6074827, -2.256076, 0.2941177, 1, 0, 1,
-0.5419003, 0.896239, -0.4965597, 0.2901961, 1, 0, 1,
-0.5315164, 1.39661, -1.958359, 0.282353, 1, 0, 1,
-0.5308731, 0.4337351, -0.8036724, 0.2784314, 1, 0, 1,
-0.5288689, -1.725245, -1.76053, 0.2705882, 1, 0, 1,
-0.5285701, 0.4918972, -0.3772219, 0.2666667, 1, 0, 1,
-0.5270039, -0.3186459, -2.624783, 0.2588235, 1, 0, 1,
-0.5209322, 0.2458041, -1.628872, 0.254902, 1, 0, 1,
-0.5178118, -0.367184, 0.3009599, 0.2470588, 1, 0, 1,
-0.5174938, -0.08787856, -1.066198, 0.2431373, 1, 0, 1,
-0.5168649, -1.195137, -3.177568, 0.2352941, 1, 0, 1,
-0.5146878, 1.071088, -1.798597, 0.2313726, 1, 0, 1,
-0.5141856, 0.3403589, -1.203839, 0.2235294, 1, 0, 1,
-0.5138444, -1.107827, -3.3764, 0.2196078, 1, 0, 1,
-0.5131539, -1.628578, -3.637064, 0.2117647, 1, 0, 1,
-0.508686, 0.9201747, -1.511065, 0.2078431, 1, 0, 1,
-0.5072654, -0.8161591, -3.173171, 0.2, 1, 0, 1,
-0.505839, 1.693256, 0.3844897, 0.1921569, 1, 0, 1,
-0.4978183, 0.1975195, -1.604692, 0.1882353, 1, 0, 1,
-0.4972193, 1.518943, 0.5364014, 0.1803922, 1, 0, 1,
-0.4957894, -0.361551, -1.671154, 0.1764706, 1, 0, 1,
-0.4937832, 1.783469, 0.7216487, 0.1686275, 1, 0, 1,
-0.4934443, 2.009715, -1.418397, 0.1647059, 1, 0, 1,
-0.491224, 0.7194684, 0.1133043, 0.1568628, 1, 0, 1,
-0.4871323, 0.2783785, -0.2375286, 0.1529412, 1, 0, 1,
-0.4804775, -0.2359443, -2.650814, 0.145098, 1, 0, 1,
-0.4768361, 0.5580837, -0.6722915, 0.1411765, 1, 0, 1,
-0.4729241, 0.6446921, 0.629773, 0.1333333, 1, 0, 1,
-0.4690475, -0.2532536, -2.844568, 0.1294118, 1, 0, 1,
-0.4690201, 0.2947031, -0.9325576, 0.1215686, 1, 0, 1,
-0.4609036, 0.7979677, -0.6036554, 0.1176471, 1, 0, 1,
-0.4608212, 1.528509, -0.3505478, 0.1098039, 1, 0, 1,
-0.4573102, -0.5051443, -4.782262, 0.1058824, 1, 0, 1,
-0.4548859, 1.86287, -0.0333037, 0.09803922, 1, 0, 1,
-0.4548049, 0.4130786, -1.874458, 0.09019608, 1, 0, 1,
-0.4504345, 0.6524203, -1.217938, 0.08627451, 1, 0, 1,
-0.4465975, -1.45723, -2.055286, 0.07843138, 1, 0, 1,
-0.4464903, 0.6439629, -0.8993592, 0.07450981, 1, 0, 1,
-0.4458567, 1.403215, 0.02840508, 0.06666667, 1, 0, 1,
-0.4428566, 0.2392809, -1.825035, 0.0627451, 1, 0, 1,
-0.4378406, -2.092531, -2.588477, 0.05490196, 1, 0, 1,
-0.429789, 0.4191001, -1.052225, 0.05098039, 1, 0, 1,
-0.4295168, -0.4508792, -1.168288, 0.04313726, 1, 0, 1,
-0.4286737, 0.1701479, -0.5301233, 0.03921569, 1, 0, 1,
-0.4283899, -0.2450359, -2.126537, 0.03137255, 1, 0, 1,
-0.4274535, -0.6932844, -3.845124, 0.02745098, 1, 0, 1,
-0.4227617, -0.7683454, -1.395402, 0.01960784, 1, 0, 1,
-0.4215781, 1.116184, -1.034267, 0.01568628, 1, 0, 1,
-0.4190606, 0.8819312, -0.667905, 0.007843138, 1, 0, 1,
-0.4141887, -0.1637237, -2.453784, 0.003921569, 1, 0, 1,
-0.4097602, 0.06255011, -1.277465, 0, 1, 0.003921569, 1,
-0.4049626, -2.026562, -4.796624, 0, 1, 0.01176471, 1,
-0.402351, -0.09562959, -1.98014, 0, 1, 0.01568628, 1,
-0.4008718, 2.4665, -0.4457348, 0, 1, 0.02352941, 1,
-0.3992503, 0.3026882, -1.328184, 0, 1, 0.02745098, 1,
-0.3985345, -0.4636216, -1.116528, 0, 1, 0.03529412, 1,
-0.3975682, -2.065548, -3.348541, 0, 1, 0.03921569, 1,
-0.3953433, -1.252651, -1.918031, 0, 1, 0.04705882, 1,
-0.3828853, 0.2798785, -1.025022, 0, 1, 0.05098039, 1,
-0.3759139, -0.00924725, -1.313496, 0, 1, 0.05882353, 1,
-0.3733984, -1.325367, -3.741933, 0, 1, 0.0627451, 1,
-0.3726562, -1.478289, -2.027212, 0, 1, 0.07058824, 1,
-0.3718554, -0.2648892, -1.740141, 0, 1, 0.07450981, 1,
-0.37017, 0.4260984, -0.2724322, 0, 1, 0.08235294, 1,
-0.3700829, -0.9072807, -3.400204, 0, 1, 0.08627451, 1,
-0.3685434, -0.8100055, -3.263566, 0, 1, 0.09411765, 1,
-0.3587813, 1.774214, -0.5192537, 0, 1, 0.1019608, 1,
-0.3581064, 0.8963292, -1.559068, 0, 1, 0.1058824, 1,
-0.3559813, -0.2785605, -1.523357, 0, 1, 0.1137255, 1,
-0.3494985, -0.1327948, -1.48381, 0, 1, 0.1176471, 1,
-0.3483508, 1.3482, -0.04051262, 0, 1, 0.1254902, 1,
-0.3436458, -0.6524667, -1.109609, 0, 1, 0.1294118, 1,
-0.3404623, 0.346691, -2.225662, 0, 1, 0.1372549, 1,
-0.3395487, -1.932716, -2.880405, 0, 1, 0.1411765, 1,
-0.3359784, -0.3092928, -2.26065, 0, 1, 0.1490196, 1,
-0.3354333, 0.2721204, -1.169865, 0, 1, 0.1529412, 1,
-0.3329779, -1.335118, 0.7936052, 0, 1, 0.1607843, 1,
-0.3324474, -0.4139101, -2.488159, 0, 1, 0.1647059, 1,
-0.3269812, -2.803649, -2.897835, 0, 1, 0.172549, 1,
-0.3263945, -0.1498358, -2.397344, 0, 1, 0.1764706, 1,
-0.3263415, -0.04307078, -1.102204, 0, 1, 0.1843137, 1,
-0.3235168, 0.1996561, -1.183476, 0, 1, 0.1882353, 1,
-0.3195309, 0.6630987, -0.3313704, 0, 1, 0.1960784, 1,
-0.3145519, -0.7008987, -3.76347, 0, 1, 0.2039216, 1,
-0.313118, 0.3058086, 0.3863803, 0, 1, 0.2078431, 1,
-0.3118101, 0.4303295, -0.606733, 0, 1, 0.2156863, 1,
-0.3109182, 0.268433, 0.2444162, 0, 1, 0.2196078, 1,
-0.3097405, 0.2922948, -0.03054772, 0, 1, 0.227451, 1,
-0.2991031, -2.018548, -2.647567, 0, 1, 0.2313726, 1,
-0.2989018, 0.2076508, 0.1049639, 0, 1, 0.2392157, 1,
-0.2979078, -0.8093287, -2.538033, 0, 1, 0.2431373, 1,
-0.2978815, -0.6885657, -3.45625, 0, 1, 0.2509804, 1,
-0.293618, 0.5147144, -1.387168, 0, 1, 0.254902, 1,
-0.2835965, -0.3853963, -1.347574, 0, 1, 0.2627451, 1,
-0.2808876, 0.3521778, -0.5549408, 0, 1, 0.2666667, 1,
-0.2754789, -0.4573401, -0.4509643, 0, 1, 0.2745098, 1,
-0.2744182, -1.167698, -3.308134, 0, 1, 0.2784314, 1,
-0.2737975, 0.7309014, -1.426037, 0, 1, 0.2862745, 1,
-0.2737463, -0.7733361, -1.488917, 0, 1, 0.2901961, 1,
-0.2734397, 0.9536463, 0.4575936, 0, 1, 0.2980392, 1,
-0.2720491, -0.8846692, -1.772766, 0, 1, 0.3058824, 1,
-0.2717661, 0.314467, 0.01417762, 0, 1, 0.3098039, 1,
-0.2705236, 1.438933, 0.2430758, 0, 1, 0.3176471, 1,
-0.2698877, -0.8306077, -2.862097, 0, 1, 0.3215686, 1,
-0.2678885, 0.2289452, -1.375048, 0, 1, 0.3294118, 1,
-0.2674704, -0.4525101, -1.911088, 0, 1, 0.3333333, 1,
-0.2632551, -1.13235, -4.140804, 0, 1, 0.3411765, 1,
-0.2602271, 0.4779975, -0.9247904, 0, 1, 0.345098, 1,
-0.2590055, 1.13179, 0.4348603, 0, 1, 0.3529412, 1,
-0.2581097, 0.8882375, 0.6742806, 0, 1, 0.3568628, 1,
-0.2520422, 0.9983352, -0.6422478, 0, 1, 0.3647059, 1,
-0.2511145, -0.1798892, -1.087164, 0, 1, 0.3686275, 1,
-0.2487315, 0.4310872, -0.3229149, 0, 1, 0.3764706, 1,
-0.2469159, 0.3910002, -0.2315442, 0, 1, 0.3803922, 1,
-0.2450717, -0.7329242, -2.125909, 0, 1, 0.3882353, 1,
-0.2426035, 0.2353627, -1.122194, 0, 1, 0.3921569, 1,
-0.2413642, 0.02804874, -1.264309, 0, 1, 0.4, 1,
-0.2408963, -0.2744476, -1.28086, 0, 1, 0.4078431, 1,
-0.2362603, -1.080896, -3.356549, 0, 1, 0.4117647, 1,
-0.2343069, -0.05108657, -1.713563, 0, 1, 0.4196078, 1,
-0.2307863, 0.3768356, -1.426869, 0, 1, 0.4235294, 1,
-0.2289802, -1.109668, -1.885749, 0, 1, 0.4313726, 1,
-0.2270983, -0.8894015, -2.515903, 0, 1, 0.4352941, 1,
-0.2233979, -1.981715, -2.90709, 0, 1, 0.4431373, 1,
-0.2208304, 0.6546293, -0.008789504, 0, 1, 0.4470588, 1,
-0.2203305, -0.7475508, -1.829341, 0, 1, 0.454902, 1,
-0.2122708, 0.6396499, -0.1978599, 0, 1, 0.4588235, 1,
-0.2113625, 0.6671187, -1.774726, 0, 1, 0.4666667, 1,
-0.2104317, 0.6450506, -3.109796, 0, 1, 0.4705882, 1,
-0.2103785, 0.610157, 1.0845, 0, 1, 0.4784314, 1,
-0.2103, -1.641253, -2.745265, 0, 1, 0.4823529, 1,
-0.2087859, 0.487801, -1.364955, 0, 1, 0.4901961, 1,
-0.2081531, 2.28552, 0.1923147, 0, 1, 0.4941176, 1,
-0.2032245, -0.999418, -1.640302, 0, 1, 0.5019608, 1,
-0.2020244, -0.3566327, -2.40438, 0, 1, 0.509804, 1,
-0.1977576, -1.573678, -2.658512, 0, 1, 0.5137255, 1,
-0.1965757, 0.5467808, 0.1389652, 0, 1, 0.5215687, 1,
-0.1958922, -0.1309108, -2.860283, 0, 1, 0.5254902, 1,
-0.1953572, 1.668919, -0.04951416, 0, 1, 0.5333334, 1,
-0.1886077, 0.3716125, -0.3921842, 0, 1, 0.5372549, 1,
-0.1878208, 0.3829986, -0.1543079, 0, 1, 0.5450981, 1,
-0.1847435, 0.3342961, 0.4980779, 0, 1, 0.5490196, 1,
-0.1841226, 0.8985355, 0.2039292, 0, 1, 0.5568628, 1,
-0.1801111, 1.211366, -0.6802874, 0, 1, 0.5607843, 1,
-0.179809, 0.1324723, 0.7072815, 0, 1, 0.5686275, 1,
-0.1782569, 0.007715076, -1.119627, 0, 1, 0.572549, 1,
-0.1770417, -0.7809097, -3.331224, 0, 1, 0.5803922, 1,
-0.1748634, 0.6832271, -0.9326105, 0, 1, 0.5843138, 1,
-0.1725697, 1.660222, 0.7207879, 0, 1, 0.5921569, 1,
-0.1666423, 0.0957703, -1.574283, 0, 1, 0.5960785, 1,
-0.1633515, -3.133855, -3.751878, 0, 1, 0.6039216, 1,
-0.1627373, 2.352685, -0.7649044, 0, 1, 0.6117647, 1,
-0.1546302, -1.166753, -3.424705, 0, 1, 0.6156863, 1,
-0.1539502, 1.537185, 0.03944274, 0, 1, 0.6235294, 1,
-0.1433786, -0.4598535, -3.477333, 0, 1, 0.627451, 1,
-0.1432116, 1.128014, -2.325804, 0, 1, 0.6352941, 1,
-0.1401915, -1.120094, -4.260111, 0, 1, 0.6392157, 1,
-0.1397668, -0.1329234, -3.536325, 0, 1, 0.6470588, 1,
-0.1390731, 0.1129603, 1.088853, 0, 1, 0.6509804, 1,
-0.1379107, 0.1608452, -0.3902242, 0, 1, 0.6588235, 1,
-0.1352696, -1.74925, -3.36507, 0, 1, 0.6627451, 1,
-0.1278246, 1.009008, -2.014771, 0, 1, 0.6705883, 1,
-0.1252697, -0.1538363, -2.914315, 0, 1, 0.6745098, 1,
-0.1224805, -1.541262, -1.534152, 0, 1, 0.682353, 1,
-0.1219774, -0.9916579, -2.927979, 0, 1, 0.6862745, 1,
-0.1171332, -0.3838556, -3.205639, 0, 1, 0.6941177, 1,
-0.1115509, -0.5025095, -4.1149, 0, 1, 0.7019608, 1,
-0.1101548, -1.5011, -2.731768, 0, 1, 0.7058824, 1,
-0.1058448, -0.06779843, -0.8100494, 0, 1, 0.7137255, 1,
-0.1049528, -0.0710444, -1.720071, 0, 1, 0.7176471, 1,
-0.100115, 0.1371879, -1.771691, 0, 1, 0.7254902, 1,
-0.09872685, -0.008142243, -1.07937, 0, 1, 0.7294118, 1,
-0.09862534, -0.3209038, -3.64413, 0, 1, 0.7372549, 1,
-0.09638628, 1.010182, 0.6415001, 0, 1, 0.7411765, 1,
-0.09118546, -1.115361, -1.55446, 0, 1, 0.7490196, 1,
-0.08598445, 0.1378907, -0.6918972, 0, 1, 0.7529412, 1,
-0.08484935, -1.740484, -2.462111, 0, 1, 0.7607843, 1,
-0.07675823, -1.227453, -4.362931, 0, 1, 0.7647059, 1,
-0.0761779, 0.4232423, -0.5245471, 0, 1, 0.772549, 1,
-0.07103372, 0.7980694, 0.1329672, 0, 1, 0.7764706, 1,
-0.07059482, 0.3859271, 1.791695, 0, 1, 0.7843137, 1,
-0.0684683, -0.490567, -3.622492, 0, 1, 0.7882353, 1,
-0.06746308, 0.7105168, -1.770224, 0, 1, 0.7960784, 1,
-0.06221598, -0.1698546, -1.37749, 0, 1, 0.8039216, 1,
-0.06210317, -1.22402, -1.610076, 0, 1, 0.8078431, 1,
-0.06178717, 3.464694, -0.8355054, 0, 1, 0.8156863, 1,
-0.05965653, 0.588191, -2.127645, 0, 1, 0.8196079, 1,
-0.05904355, -2.006831, -3.105038, 0, 1, 0.827451, 1,
-0.05856768, -1.400543, -2.596626, 0, 1, 0.8313726, 1,
-0.05753601, 0.3261359, -1.436695, 0, 1, 0.8392157, 1,
-0.05383578, -0.3064271, -2.915233, 0, 1, 0.8431373, 1,
-0.05266808, -0.05686947, -1.025817, 0, 1, 0.8509804, 1,
-0.05208377, -0.6207442, -2.581901, 0, 1, 0.854902, 1,
-0.04905999, -0.9357682, -3.804259, 0, 1, 0.8627451, 1,
-0.04883456, -0.238748, -5.193042, 0, 1, 0.8666667, 1,
-0.044792, 1.823292, 2.23834, 0, 1, 0.8745098, 1,
-0.04230541, -0.5085301, -1.869973, 0, 1, 0.8784314, 1,
-0.04080018, -0.00198929, -0.3958281, 0, 1, 0.8862745, 1,
-0.04040952, -0.6211516, -3.159702, 0, 1, 0.8901961, 1,
-0.03743199, -0.9146132, -3.314487, 0, 1, 0.8980392, 1,
-0.03674628, 0.1709511, -0.3092869, 0, 1, 0.9058824, 1,
-0.03402685, 1.155928, -1.824612, 0, 1, 0.9098039, 1,
-0.03313864, 0.1389356, 0.6594013, 0, 1, 0.9176471, 1,
-0.02590899, -1.606243, -3.302041, 0, 1, 0.9215686, 1,
-0.02342668, -0.6352474, -3.199908, 0, 1, 0.9294118, 1,
-0.02068358, -1.091934, -2.956393, 0, 1, 0.9333333, 1,
-0.02054806, 2.194071, -0.05088381, 0, 1, 0.9411765, 1,
-0.01720121, 0.3938518, -1.822775, 0, 1, 0.945098, 1,
-0.01639031, 0.2461586, -0.3091128, 0, 1, 0.9529412, 1,
-0.007438793, -0.4188449, -2.124794, 0, 1, 0.9568627, 1,
-0.0001734626, 0.6775305, -0.4082189, 0, 1, 0.9647059, 1,
5.766268e-05, 1.618884, -0.7626793, 0, 1, 0.9686275, 1,
0.001884746, 1.049993, -1.855078, 0, 1, 0.9764706, 1,
0.004612553, -0.8826667, 3.67572, 0, 1, 0.9803922, 1,
0.006448838, 1.266409, -0.6917351, 0, 1, 0.9882353, 1,
0.01244392, -0.461913, 4.618661, 0, 1, 0.9921569, 1,
0.01437869, -1.071525, 2.474508, 0, 1, 1, 1,
0.01503847, -0.04077822, 3.839381, 0, 0.9921569, 1, 1,
0.01788433, 0.7780917, -1.121554, 0, 0.9882353, 1, 1,
0.02059941, 0.5364134, 0.4184196, 0, 0.9803922, 1, 1,
0.0273671, 1.16416, 0.6623024, 0, 0.9764706, 1, 1,
0.03525649, 0.7228706, -0.4519515, 0, 0.9686275, 1, 1,
0.03638593, 0.1730722, -1.018851, 0, 0.9647059, 1, 1,
0.03667594, 0.6197364, 1.648913, 0, 0.9568627, 1, 1,
0.03892994, 0.449965, 1.058865, 0, 0.9529412, 1, 1,
0.04024564, 0.06636832, 1.578492, 0, 0.945098, 1, 1,
0.05025828, -0.3610036, 4.432279, 0, 0.9411765, 1, 1,
0.05217795, -2.422171, 1.712501, 0, 0.9333333, 1, 1,
0.05894779, -0.01551684, 1.732447, 0, 0.9294118, 1, 1,
0.06054454, 0.3262245, 0.1434074, 0, 0.9215686, 1, 1,
0.06165929, -1.434381, 1.976786, 0, 0.9176471, 1, 1,
0.06606533, 1.646935, -0.4173946, 0, 0.9098039, 1, 1,
0.06671406, 0.1360337, -1.085976, 0, 0.9058824, 1, 1,
0.06792364, 1.811428, -0.618204, 0, 0.8980392, 1, 1,
0.06879468, -0.6497066, 4.49421, 0, 0.8901961, 1, 1,
0.07181382, -0.5422887, 2.870218, 0, 0.8862745, 1, 1,
0.07423802, 0.6030223, -0.9077222, 0, 0.8784314, 1, 1,
0.07799031, -0.7447768, 4.08181, 0, 0.8745098, 1, 1,
0.07913441, -0.8846278, 3.066227, 0, 0.8666667, 1, 1,
0.07952101, 0.2819792, 0.3985583, 0, 0.8627451, 1, 1,
0.08089964, 0.273403, -0.1307509, 0, 0.854902, 1, 1,
0.0810433, 0.06249786, 0.8837371, 0, 0.8509804, 1, 1,
0.08187827, -0.6917807, 4.569015, 0, 0.8431373, 1, 1,
0.08309557, 2.408512, -0.3723314, 0, 0.8392157, 1, 1,
0.08702642, -0.09532849, 3.879634, 0, 0.8313726, 1, 1,
0.09634661, -1.557121, 2.008434, 0, 0.827451, 1, 1,
0.09775364, -0.9055654, 2.674587, 0, 0.8196079, 1, 1,
0.102025, 1.609166, 0.476295, 0, 0.8156863, 1, 1,
0.1020389, -2.304443, 0.8958036, 0, 0.8078431, 1, 1,
0.1023703, -0.2552665, 1.944327, 0, 0.8039216, 1, 1,
0.1094573, 1.589291, 0.2339434, 0, 0.7960784, 1, 1,
0.109722, -0.4309749, 4.0756, 0, 0.7882353, 1, 1,
0.1114593, 0.1089832, -1.019423, 0, 0.7843137, 1, 1,
0.1116361, -2.13832, 3.930429, 0, 0.7764706, 1, 1,
0.1213162, -0.7001766, 2.22843, 0, 0.772549, 1, 1,
0.1216777, -1.389572, 2.884429, 0, 0.7647059, 1, 1,
0.126221, -0.4978823, 1.745823, 0, 0.7607843, 1, 1,
0.1285247, -1.627131, 4.527964, 0, 0.7529412, 1, 1,
0.1311014, -0.001846955, 2.612538, 0, 0.7490196, 1, 1,
0.1344845, -3.159666, 2.599574, 0, 0.7411765, 1, 1,
0.1352138, 1.711372, 0.2376377, 0, 0.7372549, 1, 1,
0.1352486, 0.9154106, -0.4022503, 0, 0.7294118, 1, 1,
0.1354115, -0.6380649, 3.392453, 0, 0.7254902, 1, 1,
0.1364359, -0.04852176, 2.571185, 0, 0.7176471, 1, 1,
0.1398626, 3.09838, 0.6288159, 0, 0.7137255, 1, 1,
0.1398879, 0.41537, 1.653043, 0, 0.7058824, 1, 1,
0.1421114, -1.776166, 3.333237, 0, 0.6980392, 1, 1,
0.1431214, -0.7755799, 2.29781, 0, 0.6941177, 1, 1,
0.1447923, 0.4400559, -0.1195505, 0, 0.6862745, 1, 1,
0.1513952, 0.7346154, 1.39348, 0, 0.682353, 1, 1,
0.1539413, -0.7976507, 2.705843, 0, 0.6745098, 1, 1,
0.1563978, 0.07992673, 0.9174861, 0, 0.6705883, 1, 1,
0.1564343, 0.1686378, 1.386583, 0, 0.6627451, 1, 1,
0.1574561, -0.7363227, 3.015154, 0, 0.6588235, 1, 1,
0.158061, -0.7232754, 2.785443, 0, 0.6509804, 1, 1,
0.1630522, 0.9474671, 0.642632, 0, 0.6470588, 1, 1,
0.1644099, 2.437196, -0.9094922, 0, 0.6392157, 1, 1,
0.1706608, 1.250798, -0.4656787, 0, 0.6352941, 1, 1,
0.1867853, 0.7282291, -0.1898697, 0, 0.627451, 1, 1,
0.1917922, -0.8955423, 3.811364, 0, 0.6235294, 1, 1,
0.2013961, -0.358982, 2.691744, 0, 0.6156863, 1, 1,
0.2032421, 0.5429809, 1.424312, 0, 0.6117647, 1, 1,
0.2038791, -1.113461, 3.510812, 0, 0.6039216, 1, 1,
0.2053193, 0.3135741, -0.511434, 0, 0.5960785, 1, 1,
0.2071105, -2.160492, 3.876839, 0, 0.5921569, 1, 1,
0.2098012, -0.8108228, 1.552164, 0, 0.5843138, 1, 1,
0.2113426, -0.01887406, 0.5286107, 0, 0.5803922, 1, 1,
0.2121181, 0.8870311, -1.19966, 0, 0.572549, 1, 1,
0.2122235, 0.3503469, 0.04351239, 0, 0.5686275, 1, 1,
0.2151206, 0.81248, 0.8238713, 0, 0.5607843, 1, 1,
0.2152968, 0.3793228, 1.491158, 0, 0.5568628, 1, 1,
0.2276662, 1.81346, 1.325737, 0, 0.5490196, 1, 1,
0.237475, 0.9116604, 1.530822, 0, 0.5450981, 1, 1,
0.2424569, 1.150662, -1.538151, 0, 0.5372549, 1, 1,
0.243088, -1.217826, 3.235633, 0, 0.5333334, 1, 1,
0.2437624, 0.9146416, 0.4630183, 0, 0.5254902, 1, 1,
0.2453742, -0.1254503, 3.600765, 0, 0.5215687, 1, 1,
0.2480939, -0.6214833, 4.117798, 0, 0.5137255, 1, 1,
0.2502536, 0.1001172, 0.5880734, 0, 0.509804, 1, 1,
0.2514157, 0.0108332, 2.692002, 0, 0.5019608, 1, 1,
0.2519557, -0.4061503, 1.508504, 0, 0.4941176, 1, 1,
0.2529569, 0.3244175, -0.4344097, 0, 0.4901961, 1, 1,
0.2555406, 1.965544, 0.5856705, 0, 0.4823529, 1, 1,
0.2590911, 0.2772673, 0.7231647, 0, 0.4784314, 1, 1,
0.2597655, -0.8501156, 2.913617, 0, 0.4705882, 1, 1,
0.2622077, 0.4961595, -0.4189029, 0, 0.4666667, 1, 1,
0.2636755, 0.004040216, 1.357071, 0, 0.4588235, 1, 1,
0.2654639, -1.592928, 2.863227, 0, 0.454902, 1, 1,
0.2662646, -0.157266, 1.441596, 0, 0.4470588, 1, 1,
0.2672176, -1.909606, 2.319342, 0, 0.4431373, 1, 1,
0.2674907, 0.8248141, 2.849911, 0, 0.4352941, 1, 1,
0.2679236, -1.317766, 0.5986941, 0, 0.4313726, 1, 1,
0.269291, 0.3797697, 1.402533, 0, 0.4235294, 1, 1,
0.2842517, 0.09678879, 1.933481, 0, 0.4196078, 1, 1,
0.2870107, 0.5640611, 1.61182, 0, 0.4117647, 1, 1,
0.287016, 0.2218912, 0.08728745, 0, 0.4078431, 1, 1,
0.2904763, -0.6115293, 4.094366, 0, 0.4, 1, 1,
0.290649, -0.4325325, 4.010309, 0, 0.3921569, 1, 1,
0.2914028, -0.6646212, 2.602336, 0, 0.3882353, 1, 1,
0.2922172, 0.0347334, -0.5105697, 0, 0.3803922, 1, 1,
0.2956139, 1.733732, -1.035773, 0, 0.3764706, 1, 1,
0.2963459, 1.011677, 0.7796063, 0, 0.3686275, 1, 1,
0.298066, 0.3308287, 1.966923, 0, 0.3647059, 1, 1,
0.3086251, -0.7811939, 4.02961, 0, 0.3568628, 1, 1,
0.310265, 1.414971, 0.636813, 0, 0.3529412, 1, 1,
0.3117183, -0.2544861, 1.894861, 0, 0.345098, 1, 1,
0.3123592, 0.3591838, -0.3683791, 0, 0.3411765, 1, 1,
0.3136687, 1.76298, 1.314469, 0, 0.3333333, 1, 1,
0.315564, -1.655638, 2.336431, 0, 0.3294118, 1, 1,
0.3194467, -1.232368, 2.8087, 0, 0.3215686, 1, 1,
0.3206334, 0.6342418, -0.579178, 0, 0.3176471, 1, 1,
0.3222512, -0.1166656, 2.088264, 0, 0.3098039, 1, 1,
0.3231717, -0.8819489, 1.171644, 0, 0.3058824, 1, 1,
0.3270602, -1.613545, 2.648731, 0, 0.2980392, 1, 1,
0.3271978, 1.125149, 0.3324437, 0, 0.2901961, 1, 1,
0.3292003, 0.07842253, 2.451006, 0, 0.2862745, 1, 1,
0.3303008, -0.4939134, 2.731393, 0, 0.2784314, 1, 1,
0.3321316, 0.3808337, 1.773073, 0, 0.2745098, 1, 1,
0.3328254, -1.622929, 2.212051, 0, 0.2666667, 1, 1,
0.3337463, -0.7579613, 2.968812, 0, 0.2627451, 1, 1,
0.3337883, 0.9545751, -0.05338123, 0, 0.254902, 1, 1,
0.3359243, 0.7933107, 0.5222589, 0, 0.2509804, 1, 1,
0.342049, -1.299088, 3.24265, 0, 0.2431373, 1, 1,
0.3441976, -0.3255886, 2.408063, 0, 0.2392157, 1, 1,
0.3443043, -0.07413195, 1.076311, 0, 0.2313726, 1, 1,
0.3445524, -0.7086701, 2.751207, 0, 0.227451, 1, 1,
0.3504738, 1.915924, -0.9701904, 0, 0.2196078, 1, 1,
0.3518651, 0.3779644, 1.703612, 0, 0.2156863, 1, 1,
0.352077, 0.5871383, 1.570118, 0, 0.2078431, 1, 1,
0.3541248, -1.326471, 4.054862, 0, 0.2039216, 1, 1,
0.3612372, -0.0742299, 1.686071, 0, 0.1960784, 1, 1,
0.3669117, -1.81656, 3.5966, 0, 0.1882353, 1, 1,
0.3683519, -0.4809879, 3.348195, 0, 0.1843137, 1, 1,
0.3760235, -0.5410941, 2.603634, 0, 0.1764706, 1, 1,
0.3765433, -0.3504451, 1.875534, 0, 0.172549, 1, 1,
0.3787934, 1.359543, -0.5367646, 0, 0.1647059, 1, 1,
0.3790414, -0.593824, 4.108668, 0, 0.1607843, 1, 1,
0.3792281, 0.2144481, 2.939903, 0, 0.1529412, 1, 1,
0.38055, -0.5145819, -0.2361013, 0, 0.1490196, 1, 1,
0.383117, -1.421985, 2.722783, 0, 0.1411765, 1, 1,
0.3831968, -0.1747923, 1.995299, 0, 0.1372549, 1, 1,
0.384554, 1.251719, 0.4544164, 0, 0.1294118, 1, 1,
0.3857602, 1.176823, -0.07499556, 0, 0.1254902, 1, 1,
0.3868357, 1.408281, 0.7942697, 0, 0.1176471, 1, 1,
0.3890489, -1.185027, 2.056464, 0, 0.1137255, 1, 1,
0.3924181, -0.3702433, 1.931371, 0, 0.1058824, 1, 1,
0.3944944, -0.7939844, 1.528213, 0, 0.09803922, 1, 1,
0.3972582, -0.09697022, 1.280893, 0, 0.09411765, 1, 1,
0.4071395, 1.103694, 0.6749065, 0, 0.08627451, 1, 1,
0.4104211, 0.3152993, 0.9111373, 0, 0.08235294, 1, 1,
0.4147412, -1.288235, 1.975997, 0, 0.07450981, 1, 1,
0.4147931, -0.7040719, 1.31634, 0, 0.07058824, 1, 1,
0.422114, 0.05177924, 4.65367, 0, 0.0627451, 1, 1,
0.4231039, -1.022706, 3.164576, 0, 0.05882353, 1, 1,
0.4269926, 0.004309074, 1.379347, 0, 0.05098039, 1, 1,
0.4312059, 0.5889176, 1.80173, 0, 0.04705882, 1, 1,
0.4313593, 0.2836225, 1.305099, 0, 0.03921569, 1, 1,
0.4322857, -1.269048, 3.192104, 0, 0.03529412, 1, 1,
0.432632, -0.2284393, 2.177347, 0, 0.02745098, 1, 1,
0.4380443, 0.7936365, 1.186315, 0, 0.02352941, 1, 1,
0.4401628, -0.6275961, 3.079007, 0, 0.01568628, 1, 1,
0.4426584, 0.9290599, 1.595619, 0, 0.01176471, 1, 1,
0.450429, -1.113749, 0.9441066, 0, 0.003921569, 1, 1,
0.4521228, 1.006726, 1.452074, 0.003921569, 0, 1, 1,
0.4532872, -2.031648, 1.228246, 0.007843138, 0, 1, 1,
0.4592996, 0.45187, -0.2835483, 0.01568628, 0, 1, 1,
0.4594398, -0.3750193, 2.278651, 0.01960784, 0, 1, 1,
0.4600277, 0.47381, 0.7348238, 0.02745098, 0, 1, 1,
0.4655581, 0.4383921, -0.2092991, 0.03137255, 0, 1, 1,
0.4786254, -1.461913, 2.816123, 0.03921569, 0, 1, 1,
0.4829473, 0.2686181, -0.1983989, 0.04313726, 0, 1, 1,
0.4849288, 1.878094, 0.8381093, 0.05098039, 0, 1, 1,
0.4850756, 0.4564475, 1.693827, 0.05490196, 0, 1, 1,
0.4872462, -0.2753884, 3.480674, 0.0627451, 0, 1, 1,
0.4895147, 1.126947, 0.3922513, 0.06666667, 0, 1, 1,
0.4938103, -1.783362, 1.323732, 0.07450981, 0, 1, 1,
0.4965817, -1.384051, 2.852933, 0.07843138, 0, 1, 1,
0.4966563, 1.741101, 1.166248, 0.08627451, 0, 1, 1,
0.4984975, 1.449121, -0.5219609, 0.09019608, 0, 1, 1,
0.5001475, 0.8794692, -0.03755702, 0.09803922, 0, 1, 1,
0.5001891, -0.5092353, 1.959186, 0.1058824, 0, 1, 1,
0.5020652, 1.137223, 0.7195145, 0.1098039, 0, 1, 1,
0.5173408, -1.29517, 3.884474, 0.1176471, 0, 1, 1,
0.5174022, 0.3403152, -0.2521186, 0.1215686, 0, 1, 1,
0.5181172, 0.8689378, 0.7025041, 0.1294118, 0, 1, 1,
0.5240575, -0.5527495, 0.7158451, 0.1333333, 0, 1, 1,
0.5337406, 1.632322, 0.7712932, 0.1411765, 0, 1, 1,
0.5340754, 1.502177, -0.7118256, 0.145098, 0, 1, 1,
0.5394467, -0.04963277, 2.85918, 0.1529412, 0, 1, 1,
0.5406157, -0.02449653, 1.727395, 0.1568628, 0, 1, 1,
0.5474797, -0.4156244, 1.698103, 0.1647059, 0, 1, 1,
0.5552585, -0.1668431, 3.304499, 0.1686275, 0, 1, 1,
0.561132, 0.4921077, -0.3863764, 0.1764706, 0, 1, 1,
0.5677401, -1.326333, 3.949799, 0.1803922, 0, 1, 1,
0.5700361, -2.095363, 3.196333, 0.1882353, 0, 1, 1,
0.5723109, -1.540323, 3.961933, 0.1921569, 0, 1, 1,
0.5749354, -0.3960923, 2.659692, 0.2, 0, 1, 1,
0.5774844, -1.440473, 3.677456, 0.2078431, 0, 1, 1,
0.579056, -1.375534, 1.37344, 0.2117647, 0, 1, 1,
0.5796208, 0.4110686, 1.342445, 0.2196078, 0, 1, 1,
0.5866041, -1.063501, 2.799442, 0.2235294, 0, 1, 1,
0.5871838, -0.5690964, 3.329283, 0.2313726, 0, 1, 1,
0.5875197, 0.9977947, -0.9002337, 0.2352941, 0, 1, 1,
0.5932299, 0.1509474, 2.311088, 0.2431373, 0, 1, 1,
0.602285, -0.06670394, 2.007144, 0.2470588, 0, 1, 1,
0.6074256, -0.1135167, 1.544527, 0.254902, 0, 1, 1,
0.6082036, 0.4782749, 1.076057, 0.2588235, 0, 1, 1,
0.6132683, -0.5694331, 4.187942, 0.2666667, 0, 1, 1,
0.6138451, 0.7226372, 0.6109076, 0.2705882, 0, 1, 1,
0.6152246, 0.2902514, 1.601945, 0.2784314, 0, 1, 1,
0.6181353, -1.40927, -0.4822896, 0.282353, 0, 1, 1,
0.6194882, -2.317564, 2.277902, 0.2901961, 0, 1, 1,
0.619836, 0.3635629, 1.546631, 0.2941177, 0, 1, 1,
0.6218816, 1.610318, -0.4147314, 0.3019608, 0, 1, 1,
0.6221589, -0.4897155, 2.789129, 0.3098039, 0, 1, 1,
0.6240298, 0.9548343, -0.05775859, 0.3137255, 0, 1, 1,
0.6282119, 0.6928864, 2.149942, 0.3215686, 0, 1, 1,
0.6289655, 0.4014947, -0.5149205, 0.3254902, 0, 1, 1,
0.6371822, -0.4904068, 2.849149, 0.3333333, 0, 1, 1,
0.6379468, 0.4767011, 1.494948, 0.3372549, 0, 1, 1,
0.6433195, -0.2776134, 0.8942567, 0.345098, 0, 1, 1,
0.6461344, 0.573239, 1.609264, 0.3490196, 0, 1, 1,
0.6540037, 0.275497, -0.3904951, 0.3568628, 0, 1, 1,
0.6610776, -0.1687993, 1.923693, 0.3607843, 0, 1, 1,
0.6622199, 1.874494, 1.934963, 0.3686275, 0, 1, 1,
0.6657318, 0.6916645, 1.298432, 0.372549, 0, 1, 1,
0.6699282, 0.3743492, 0.7260754, 0.3803922, 0, 1, 1,
0.6705924, 0.1461105, 1.627879, 0.3843137, 0, 1, 1,
0.677562, 0.4773572, 2.516882, 0.3921569, 0, 1, 1,
0.6794397, -0.2142881, 0.9480322, 0.3960784, 0, 1, 1,
0.6882213, -0.6140068, 2.520935, 0.4039216, 0, 1, 1,
0.6888018, 0.02154997, 3.041553, 0.4117647, 0, 1, 1,
0.6889614, -0.8532848, 2.856641, 0.4156863, 0, 1, 1,
0.6899625, 0.5093927, 2.168564, 0.4235294, 0, 1, 1,
0.7084722, -0.3184827, 0.9539757, 0.427451, 0, 1, 1,
0.7091909, 0.9191442, -0.4495471, 0.4352941, 0, 1, 1,
0.709366, 0.6271548, 0.4701634, 0.4392157, 0, 1, 1,
0.7095637, 0.06156802, 1.59441, 0.4470588, 0, 1, 1,
0.7139692, -0.1236707, 2.154537, 0.4509804, 0, 1, 1,
0.7206089, -0.5749534, 0.7711946, 0.4588235, 0, 1, 1,
0.7217647, -0.473848, 0.7387199, 0.4627451, 0, 1, 1,
0.7226049, 0.1855, 0.4791231, 0.4705882, 0, 1, 1,
0.7273024, -0.6828231, 2.168617, 0.4745098, 0, 1, 1,
0.7294306, -0.4361646, 0.8965076, 0.4823529, 0, 1, 1,
0.7302971, 1.1995, -0.9113213, 0.4862745, 0, 1, 1,
0.7333437, 0.8908618, -0.397057, 0.4941176, 0, 1, 1,
0.7382606, 1.013894, 0.5342928, 0.5019608, 0, 1, 1,
0.7397459, -0.0003747338, 2.101132, 0.5058824, 0, 1, 1,
0.740385, -0.2032948, 1.962401, 0.5137255, 0, 1, 1,
0.7406133, 0.9365733, 2.199039, 0.5176471, 0, 1, 1,
0.7413783, -0.1477693, 0.3299404, 0.5254902, 0, 1, 1,
0.7414271, 0.5401139, 2.141548, 0.5294118, 0, 1, 1,
0.741749, 1.009559, 0.2734544, 0.5372549, 0, 1, 1,
0.7433247, 0.5812805, 0.94466, 0.5411765, 0, 1, 1,
0.7451621, -1.44291, 1.24253, 0.5490196, 0, 1, 1,
0.7486371, -0.2508452, 2.84653, 0.5529412, 0, 1, 1,
0.7503225, 0.3876941, 1.602848, 0.5607843, 0, 1, 1,
0.7625812, 1.518837, 0.02508144, 0.5647059, 0, 1, 1,
0.7682221, -0.5411856, 3.629753, 0.572549, 0, 1, 1,
0.7697038, 1.157011, 1.154035, 0.5764706, 0, 1, 1,
0.7711061, -0.5728849, 3.118917, 0.5843138, 0, 1, 1,
0.7711734, -0.5751122, 2.213907, 0.5882353, 0, 1, 1,
0.7725365, -0.9347909, 1.631966, 0.5960785, 0, 1, 1,
0.77697, -0.4705768, 1.9311, 0.6039216, 0, 1, 1,
0.7781922, 0.4413667, 2.563886, 0.6078432, 0, 1, 1,
0.7813638, 0.6270964, 2.274521, 0.6156863, 0, 1, 1,
0.781966, -0.1376246, 1.354995, 0.6196079, 0, 1, 1,
0.7837734, 0.2196884, -0.07166401, 0.627451, 0, 1, 1,
0.784612, 1.242282, 1.993976, 0.6313726, 0, 1, 1,
0.7852127, 0.3538583, 1.024366, 0.6392157, 0, 1, 1,
0.7859773, -1.408554, 3.587011, 0.6431373, 0, 1, 1,
0.7892262, -0.01325929, 1.575088, 0.6509804, 0, 1, 1,
0.7899578, -1.039773, 2.27932, 0.654902, 0, 1, 1,
0.7923833, 1.805708, -0.2761481, 0.6627451, 0, 1, 1,
0.797846, -0.4444266, 2.821748, 0.6666667, 0, 1, 1,
0.8022615, -0.5938244, 1.929662, 0.6745098, 0, 1, 1,
0.8024464, -0.9358951, 2.506403, 0.6784314, 0, 1, 1,
0.8036026, -0.4603285, 1.942187, 0.6862745, 0, 1, 1,
0.8087895, 1.081424, 0.8709521, 0.6901961, 0, 1, 1,
0.8108719, -1.024455, 1.113368, 0.6980392, 0, 1, 1,
0.8125533, -0.2597434, 0.349952, 0.7058824, 0, 1, 1,
0.8133062, 0.1825569, 1.229092, 0.7098039, 0, 1, 1,
0.8262674, 0.2067022, 0.9209372, 0.7176471, 0, 1, 1,
0.832299, 0.2566357, 1.273964, 0.7215686, 0, 1, 1,
0.834843, 0.4614253, 1.398871, 0.7294118, 0, 1, 1,
0.8407061, 0.1700299, 0.6774315, 0.7333333, 0, 1, 1,
0.8429534, -1.517628, 3.823111, 0.7411765, 0, 1, 1,
0.8435485, 1.731784, -0.1443198, 0.7450981, 0, 1, 1,
0.8469725, -1.091671, 1.553679, 0.7529412, 0, 1, 1,
0.8521278, 0.4410995, 1.457205, 0.7568628, 0, 1, 1,
0.8566864, -1.331837, 3.892565, 0.7647059, 0, 1, 1,
0.858888, -0.5423313, 2.015821, 0.7686275, 0, 1, 1,
0.8606646, 0.5179954, 0.6923863, 0.7764706, 0, 1, 1,
0.8668362, -1.294181, 0.2866477, 0.7803922, 0, 1, 1,
0.8801457, 1.457592, 0.5635299, 0.7882353, 0, 1, 1,
0.8823679, 0.2019873, 2.638126, 0.7921569, 0, 1, 1,
0.8838001, 0.4297203, 2.617631, 0.8, 0, 1, 1,
0.8842481, 0.05950649, 1.928435, 0.8078431, 0, 1, 1,
0.8861064, -1.664144, 3.018497, 0.8117647, 0, 1, 1,
0.8865674, -1.740852, 2.696213, 0.8196079, 0, 1, 1,
0.8902259, -1.49456, 3.391134, 0.8235294, 0, 1, 1,
0.8931411, -0.9971786, 3.465285, 0.8313726, 0, 1, 1,
0.8950962, -1.481073, 2.834512, 0.8352941, 0, 1, 1,
0.8967637, -1.496745, 1.881171, 0.8431373, 0, 1, 1,
0.8967958, -1.538594, 1.713361, 0.8470588, 0, 1, 1,
0.8995983, -0.1954851, 1.217146, 0.854902, 0, 1, 1,
0.8999743, -0.621307, 1.723239, 0.8588235, 0, 1, 1,
0.9019389, -1.675498, 3.313515, 0.8666667, 0, 1, 1,
0.9055313, 1.114158, 1.188127, 0.8705882, 0, 1, 1,
0.907804, -0.2268816, 3.740082, 0.8784314, 0, 1, 1,
0.9105902, -0.5667738, 1.416009, 0.8823529, 0, 1, 1,
0.9135377, -2.35984, 2.583118, 0.8901961, 0, 1, 1,
0.9162866, -1.069624, 2.502952, 0.8941177, 0, 1, 1,
0.9202941, 2.414744, 0.3186543, 0.9019608, 0, 1, 1,
0.9227179, -0.5615402, 2.085397, 0.9098039, 0, 1, 1,
0.9248508, -1.293026, 3.769216, 0.9137255, 0, 1, 1,
0.92814, -0.1349655, 0.6498179, 0.9215686, 0, 1, 1,
0.9302747, 0.6848404, 0.2163555, 0.9254902, 0, 1, 1,
0.9357778, 0.6207924, -0.4888158, 0.9333333, 0, 1, 1,
0.9383228, 0.5737429, 1.494948, 0.9372549, 0, 1, 1,
0.9394578, -0.480282, 1.388846, 0.945098, 0, 1, 1,
0.9526284, -0.4047388, 0.9331769, 0.9490196, 0, 1, 1,
0.9567638, 0.4310388, 1.276613, 0.9568627, 0, 1, 1,
0.9615108, -0.6443444, 1.008634, 0.9607843, 0, 1, 1,
0.966655, -0.2920705, 1.843425, 0.9686275, 0, 1, 1,
0.9666993, 0.2402306, 0.2004246, 0.972549, 0, 1, 1,
0.9740624, 0.6929474, 2.053632, 0.9803922, 0, 1, 1,
0.9786633, 0.9562901, 1.847664, 0.9843137, 0, 1, 1,
0.9834028, -1.453528, 1.569039, 0.9921569, 0, 1, 1,
0.9883681, -0.3516861, 2.420203, 0.9960784, 0, 1, 1,
0.9897271, -0.3068316, 1.641792, 1, 0, 0.9960784, 1,
0.9907882, -0.840172, 1.823187, 1, 0, 0.9882353, 1,
0.9941384, -0.9307173, 1.313375, 1, 0, 0.9843137, 1,
0.9988587, 1.245044, 1.178263, 1, 0, 0.9764706, 1,
1.000345, -1.402257, 2.06206, 1, 0, 0.972549, 1,
1.001668, -1.985007, 0.6247134, 1, 0, 0.9647059, 1,
1.00374, 0.231157, 2.254317, 1, 0, 0.9607843, 1,
1.008704, 0.1929142, 1.52191, 1, 0, 0.9529412, 1,
1.014782, 2.090733, 0.6647084, 1, 0, 0.9490196, 1,
1.017641, 0.9910071, 1.885701, 1, 0, 0.9411765, 1,
1.018547, -2.061619, 3.062075, 1, 0, 0.9372549, 1,
1.031427, -0.001021474, -1.644653, 1, 0, 0.9294118, 1,
1.036152, -0.8745532, 2.306541, 1, 0, 0.9254902, 1,
1.038211, 1.228117, -0.2733029, 1, 0, 0.9176471, 1,
1.043503, -0.4718351, 0.006351633, 1, 0, 0.9137255, 1,
1.04721, -1.988016, 2.468889, 1, 0, 0.9058824, 1,
1.053179, -1.007276, 3.028992, 1, 0, 0.9019608, 1,
1.055009, -0.776856, 1.16163, 1, 0, 0.8941177, 1,
1.06811, 0.3254462, 1.107189, 1, 0, 0.8862745, 1,
1.070819, 0.03584302, 2.780146, 1, 0, 0.8823529, 1,
1.076594, -0.4060749, 1.221765, 1, 0, 0.8745098, 1,
1.078682, -0.4992934, 2.942997, 1, 0, 0.8705882, 1,
1.089359, 0.9194409, 1.701493, 1, 0, 0.8627451, 1,
1.096742, -0.3393343, 0.8409308, 1, 0, 0.8588235, 1,
1.099209, -0.1321577, 0.2521552, 1, 0, 0.8509804, 1,
1.102394, 1.249774, 1.180121, 1, 0, 0.8470588, 1,
1.102571, 0.8445947, 0.256473, 1, 0, 0.8392157, 1,
1.107803, -0.9716474, 1.716305, 1, 0, 0.8352941, 1,
1.110334, 0.7282517, 2.095493, 1, 0, 0.827451, 1,
1.110824, -1.123362, 1.57656, 1, 0, 0.8235294, 1,
1.118218, 0.6715996, 0.5506018, 1, 0, 0.8156863, 1,
1.122375, 0.7524547, 1.870069, 1, 0, 0.8117647, 1,
1.125195, 1.063396, 0.5637296, 1, 0, 0.8039216, 1,
1.128104, -0.01186589, 0.4578394, 1, 0, 0.7960784, 1,
1.135359, -0.6766219, 3.062087, 1, 0, 0.7921569, 1,
1.136933, 0.4379686, 1.921048, 1, 0, 0.7843137, 1,
1.140598, 1.341197, 0.5101996, 1, 0, 0.7803922, 1,
1.142867, -0.4726032, 1.017074, 1, 0, 0.772549, 1,
1.159289, -1.438276, 2.209336, 1, 0, 0.7686275, 1,
1.163022, 0.1645142, 2.537079, 1, 0, 0.7607843, 1,
1.171251, -0.09053243, 0.1324209, 1, 0, 0.7568628, 1,
1.171556, -0.7717327, 3.104644, 1, 0, 0.7490196, 1,
1.174374, -0.9008093, 4.183646, 1, 0, 0.7450981, 1,
1.176519, -0.2789726, 1.264914, 1, 0, 0.7372549, 1,
1.183479, 0.9525881, -1.271487, 1, 0, 0.7333333, 1,
1.183616, -0.384939, 3.101084, 1, 0, 0.7254902, 1,
1.187196, -0.1574256, 2.83557, 1, 0, 0.7215686, 1,
1.19156, 0.1580749, 1.510175, 1, 0, 0.7137255, 1,
1.196349, -0.455466, 0.8268513, 1, 0, 0.7098039, 1,
1.201595, 1.930766, 0.267131, 1, 0, 0.7019608, 1,
1.202783, -0.4112988, 0.9999946, 1, 0, 0.6941177, 1,
1.208067, 0.5228856, -0.2040571, 1, 0, 0.6901961, 1,
1.210026, -2.960454, 2.392779, 1, 0, 0.682353, 1,
1.211968, 0.9130228, -1.220108, 1, 0, 0.6784314, 1,
1.216148, 2.187743, -1.276564, 1, 0, 0.6705883, 1,
1.218155, -1.398244, 3.426193, 1, 0, 0.6666667, 1,
1.226178, -0.5579531, 3.834723, 1, 0, 0.6588235, 1,
1.229357, 0.1176054, 1.091675, 1, 0, 0.654902, 1,
1.232967, 1.555339, 0.1616092, 1, 0, 0.6470588, 1,
1.236499, -1.71102, 1.933038, 1, 0, 0.6431373, 1,
1.236524, 0.06329939, 3.807641, 1, 0, 0.6352941, 1,
1.237378, 0.9612607, 0.7906322, 1, 0, 0.6313726, 1,
1.239113, 0.770754, 1.250944, 1, 0, 0.6235294, 1,
1.240244, -1.157455, 1.724702, 1, 0, 0.6196079, 1,
1.242397, -0.8533083, 1.124213, 1, 0, 0.6117647, 1,
1.242858, -0.4531834, 4.328253, 1, 0, 0.6078432, 1,
1.248982, 1.210891, 3.362523, 1, 0, 0.6, 1,
1.254668, 0.2107026, -0.4957234, 1, 0, 0.5921569, 1,
1.273877, 0.659134, 2.468639, 1, 0, 0.5882353, 1,
1.287661, -0.08695046, 1.59673, 1, 0, 0.5803922, 1,
1.292141, 2.239106, 0.4306168, 1, 0, 0.5764706, 1,
1.302407, -0.6764001, 2.070846, 1, 0, 0.5686275, 1,
1.32165, 0.8346488, 1.058326, 1, 0, 0.5647059, 1,
1.321925, 0.9878697, 1.607847, 1, 0, 0.5568628, 1,
1.327714, -0.9278961, 3.917856, 1, 0, 0.5529412, 1,
1.329455, 1.397652, 0.3499272, 1, 0, 0.5450981, 1,
1.330095, -0.01898482, 3.217124, 1, 0, 0.5411765, 1,
1.335644, 0.9560596, 3.001579, 1, 0, 0.5333334, 1,
1.337394, 0.3095229, 2.122336, 1, 0, 0.5294118, 1,
1.339878, -1.476078, 1.576766, 1, 0, 0.5215687, 1,
1.348846, -1.031047, 2.84933, 1, 0, 0.5176471, 1,
1.352972, -0.1235753, 0.4032606, 1, 0, 0.509804, 1,
1.355545, -0.2801889, 2.591812, 1, 0, 0.5058824, 1,
1.358232, -0.5356433, 1.695443, 1, 0, 0.4980392, 1,
1.363878, -0.970495, 0.8446902, 1, 0, 0.4901961, 1,
1.369198, 0.1239106, 0.4670174, 1, 0, 0.4862745, 1,
1.370023, 0.265478, 0.5766067, 1, 0, 0.4784314, 1,
1.370492, 0.2044383, 0.6012416, 1, 0, 0.4745098, 1,
1.375955, -0.2094232, 1.841922, 1, 0, 0.4666667, 1,
1.385528, 0.1907538, -1.235487, 1, 0, 0.4627451, 1,
1.409561, 0.2986411, 0.09999621, 1, 0, 0.454902, 1,
1.423935, 0.8179253, 0.7505981, 1, 0, 0.4509804, 1,
1.431322, -0.1997161, 3.840282, 1, 0, 0.4431373, 1,
1.445768, 0.3182776, 2.127204, 1, 0, 0.4392157, 1,
1.449571, 0.8034781, 1.795985, 1, 0, 0.4313726, 1,
1.462984, -0.06736027, -0.4182505, 1, 0, 0.427451, 1,
1.463767, 0.7976708, 0.4865962, 1, 0, 0.4196078, 1,
1.472014, 1.015291, 0.6412504, 1, 0, 0.4156863, 1,
1.474372, 0.08211729, 2.70782, 1, 0, 0.4078431, 1,
1.508893, 0.7892143, -0.5521219, 1, 0, 0.4039216, 1,
1.511845, 0.9600579, 1.022616, 1, 0, 0.3960784, 1,
1.515697, -0.1367531, 1.354343, 1, 0, 0.3882353, 1,
1.557292, -1.075, 1.662279, 1, 0, 0.3843137, 1,
1.564857, 0.5812003, 2.13555, 1, 0, 0.3764706, 1,
1.564974, 0.4954692, -0.2243508, 1, 0, 0.372549, 1,
1.586168, 0.9957623, 3.035126, 1, 0, 0.3647059, 1,
1.58893, 0.6044803, 1.119218, 1, 0, 0.3607843, 1,
1.591945, 1.633324, -0.1162601, 1, 0, 0.3529412, 1,
1.602229, -1.54366, 2.519373, 1, 0, 0.3490196, 1,
1.609514, -1.158861, 0.7861035, 1, 0, 0.3411765, 1,
1.613879, 1.291044, 0.7089488, 1, 0, 0.3372549, 1,
1.618301, -1.941564, 4.105102, 1, 0, 0.3294118, 1,
1.63324, -1.128832, -0.7560797, 1, 0, 0.3254902, 1,
1.63738, -0.7592356, 1.754933, 1, 0, 0.3176471, 1,
1.640326, -0.168073, 1.918159, 1, 0, 0.3137255, 1,
1.644709, 0.1924057, 0.3675694, 1, 0, 0.3058824, 1,
1.648031, -0.1618741, 2.589188, 1, 0, 0.2980392, 1,
1.649117, -0.7932113, 2.915215, 1, 0, 0.2941177, 1,
1.658961, 0.1547154, -0.4965098, 1, 0, 0.2862745, 1,
1.659286, -1.115036, 0.7918284, 1, 0, 0.282353, 1,
1.662776, 0.5596257, 1.629935, 1, 0, 0.2745098, 1,
1.68433, 0.2758846, 0.1671296, 1, 0, 0.2705882, 1,
1.685598, -0.1243591, 2.155813, 1, 0, 0.2627451, 1,
1.686551, -0.1215166, 1.06808, 1, 0, 0.2588235, 1,
1.690124, -0.5154613, 0.5270193, 1, 0, 0.2509804, 1,
1.695114, -0.3689888, 1.273392, 1, 0, 0.2470588, 1,
1.696105, 0.7476015, 0.7539186, 1, 0, 0.2392157, 1,
1.699321, 0.2814397, 1.804745, 1, 0, 0.2352941, 1,
1.707898, -1.163962, -0.3939132, 1, 0, 0.227451, 1,
1.717731, 0.03634601, 2.230139, 1, 0, 0.2235294, 1,
1.724831, 0.05467199, 1.492556, 1, 0, 0.2156863, 1,
1.726782, -0.6363493, 0.861621, 1, 0, 0.2117647, 1,
1.784249, 0.2270614, 1.70812, 1, 0, 0.2039216, 1,
1.797696, -0.3281216, 2.748026, 1, 0, 0.1960784, 1,
1.821104, 0.1136124, 1.239995, 1, 0, 0.1921569, 1,
1.821811, -0.4016524, 0.3425101, 1, 0, 0.1843137, 1,
1.86661, 1.486024, 1.625461, 1, 0, 0.1803922, 1,
1.86966, -0.04569027, 2.505007, 1, 0, 0.172549, 1,
1.885912, -1.35547, 2.405019, 1, 0, 0.1686275, 1,
1.90375, 0.4562261, 1.52543, 1, 0, 0.1607843, 1,
1.910297, -1.847978, 1.776919, 1, 0, 0.1568628, 1,
1.931291, -1.996955, 2.459878, 1, 0, 0.1490196, 1,
1.939571, -0.5940396, 4.345206, 1, 0, 0.145098, 1,
1.947107, 3.47143, 1.803779, 1, 0, 0.1372549, 1,
1.991254, -1.072101, 1.527603, 1, 0, 0.1333333, 1,
2.020433, -1.497704, 2.755064, 1, 0, 0.1254902, 1,
2.021815, -0.2331267, 3.095724, 1, 0, 0.1215686, 1,
2.032781, 0.4540895, -0.5061852, 1, 0, 0.1137255, 1,
2.064543, -1.084475, 0.771268, 1, 0, 0.1098039, 1,
2.0656, -1.495705, 1.069478, 1, 0, 0.1019608, 1,
2.074178, -0.08852727, 2.42943, 1, 0, 0.09411765, 1,
2.097317, 0.1692685, 1.740599, 1, 0, 0.09019608, 1,
2.143608, -2.195034, 1.759572, 1, 0, 0.08235294, 1,
2.199707, -0.5862679, 1.533721, 1, 0, 0.07843138, 1,
2.207758, 0.125568, 0.1984936, 1, 0, 0.07058824, 1,
2.210156, -1.235032, 1.76238, 1, 0, 0.06666667, 1,
2.230461, 0.2277383, 1.335522, 1, 0, 0.05882353, 1,
2.2844, -1.356949, 3.092521, 1, 0, 0.05490196, 1,
2.383784, -0.5835643, 1.898494, 1, 0, 0.04705882, 1,
2.399297, 1.553155, 2.33207, 1, 0, 0.04313726, 1,
2.477338, 0.2674921, 2.183895, 1, 0, 0.03529412, 1,
2.498577, 0.003315798, 1.114343, 1, 0, 0.03137255, 1,
2.544867, -1.331831, 2.379315, 1, 0, 0.02352941, 1,
2.57047, -0.957288, 1.263096, 1, 0, 0.01960784, 1,
2.576404, 0.9107455, 2.742304, 1, 0, 0.01176471, 1,
2.68296, -1.184658, 1.698587, 1, 0, 0.007843138, 1
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
-0.4504306, -4.283637, -6.86206, 0, -0.5, 0.5, 0.5,
-0.4504306, -4.283637, -6.86206, 1, -0.5, 0.5, 0.5,
-0.4504306, -4.283637, -6.86206, 1, 1.5, 0.5, 0.5,
-0.4504306, -4.283637, -6.86206, 0, 1.5, 0.5, 0.5
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
-4.64604, 0.1558819, -6.86206, 0, -0.5, 0.5, 0.5,
-4.64604, 0.1558819, -6.86206, 1, -0.5, 0.5, 0.5,
-4.64604, 0.1558819, -6.86206, 1, 1.5, 0.5, 0.5,
-4.64604, 0.1558819, -6.86206, 0, 1.5, 0.5, 0.5
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
-4.64604, -4.283637, -0.2696862, 0, -0.5, 0.5, 0.5,
-4.64604, -4.283637, -0.2696862, 1, -0.5, 0.5, 0.5,
-4.64604, -4.283637, -0.2696862, 1, 1.5, 0.5, 0.5,
-4.64604, -4.283637, -0.2696862, 0, 1.5, 0.5, 0.5
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
-3, -3.259133, -5.340743,
2, -3.259133, -5.340743,
-3, -3.259133, -5.340743,
-3, -3.429883, -5.594296,
-2, -3.259133, -5.340743,
-2, -3.429883, -5.594296,
-1, -3.259133, -5.340743,
-1, -3.429883, -5.594296,
0, -3.259133, -5.340743,
0, -3.429883, -5.594296,
1, -3.259133, -5.340743,
1, -3.429883, -5.594296,
2, -3.259133, -5.340743,
2, -3.429883, -5.594296
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
-3, -3.771385, -6.101401, 0, -0.5, 0.5, 0.5,
-3, -3.771385, -6.101401, 1, -0.5, 0.5, 0.5,
-3, -3.771385, -6.101401, 1, 1.5, 0.5, 0.5,
-3, -3.771385, -6.101401, 0, 1.5, 0.5, 0.5,
-2, -3.771385, -6.101401, 0, -0.5, 0.5, 0.5,
-2, -3.771385, -6.101401, 1, -0.5, 0.5, 0.5,
-2, -3.771385, -6.101401, 1, 1.5, 0.5, 0.5,
-2, -3.771385, -6.101401, 0, 1.5, 0.5, 0.5,
-1, -3.771385, -6.101401, 0, -0.5, 0.5, 0.5,
-1, -3.771385, -6.101401, 1, -0.5, 0.5, 0.5,
-1, -3.771385, -6.101401, 1, 1.5, 0.5, 0.5,
-1, -3.771385, -6.101401, 0, 1.5, 0.5, 0.5,
0, -3.771385, -6.101401, 0, -0.5, 0.5, 0.5,
0, -3.771385, -6.101401, 1, -0.5, 0.5, 0.5,
0, -3.771385, -6.101401, 1, 1.5, 0.5, 0.5,
0, -3.771385, -6.101401, 0, 1.5, 0.5, 0.5,
1, -3.771385, -6.101401, 0, -0.5, 0.5, 0.5,
1, -3.771385, -6.101401, 1, -0.5, 0.5, 0.5,
1, -3.771385, -6.101401, 1, 1.5, 0.5, 0.5,
1, -3.771385, -6.101401, 0, 1.5, 0.5, 0.5,
2, -3.771385, -6.101401, 0, -0.5, 0.5, 0.5,
2, -3.771385, -6.101401, 1, -0.5, 0.5, 0.5,
2, -3.771385, -6.101401, 1, 1.5, 0.5, 0.5,
2, -3.771385, -6.101401, 0, 1.5, 0.5, 0.5
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
-3.677823, -3, -5.340743,
-3.677823, 3, -5.340743,
-3.677823, -3, -5.340743,
-3.839192, -3, -5.594296,
-3.677823, -2, -5.340743,
-3.839192, -2, -5.594296,
-3.677823, -1, -5.340743,
-3.839192, -1, -5.594296,
-3.677823, 0, -5.340743,
-3.839192, 0, -5.594296,
-3.677823, 1, -5.340743,
-3.839192, 1, -5.594296,
-3.677823, 2, -5.340743,
-3.839192, 2, -5.594296,
-3.677823, 3, -5.340743,
-3.839192, 3, -5.594296
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
-4.161932, -3, -6.101401, 0, -0.5, 0.5, 0.5,
-4.161932, -3, -6.101401, 1, -0.5, 0.5, 0.5,
-4.161932, -3, -6.101401, 1, 1.5, 0.5, 0.5,
-4.161932, -3, -6.101401, 0, 1.5, 0.5, 0.5,
-4.161932, -2, -6.101401, 0, -0.5, 0.5, 0.5,
-4.161932, -2, -6.101401, 1, -0.5, 0.5, 0.5,
-4.161932, -2, -6.101401, 1, 1.5, 0.5, 0.5,
-4.161932, -2, -6.101401, 0, 1.5, 0.5, 0.5,
-4.161932, -1, -6.101401, 0, -0.5, 0.5, 0.5,
-4.161932, -1, -6.101401, 1, -0.5, 0.5, 0.5,
-4.161932, -1, -6.101401, 1, 1.5, 0.5, 0.5,
-4.161932, -1, -6.101401, 0, 1.5, 0.5, 0.5,
-4.161932, 0, -6.101401, 0, -0.5, 0.5, 0.5,
-4.161932, 0, -6.101401, 1, -0.5, 0.5, 0.5,
-4.161932, 0, -6.101401, 1, 1.5, 0.5, 0.5,
-4.161932, 0, -6.101401, 0, 1.5, 0.5, 0.5,
-4.161932, 1, -6.101401, 0, -0.5, 0.5, 0.5,
-4.161932, 1, -6.101401, 1, -0.5, 0.5, 0.5,
-4.161932, 1, -6.101401, 1, 1.5, 0.5, 0.5,
-4.161932, 1, -6.101401, 0, 1.5, 0.5, 0.5,
-4.161932, 2, -6.101401, 0, -0.5, 0.5, 0.5,
-4.161932, 2, -6.101401, 1, -0.5, 0.5, 0.5,
-4.161932, 2, -6.101401, 1, 1.5, 0.5, 0.5,
-4.161932, 2, -6.101401, 0, 1.5, 0.5, 0.5,
-4.161932, 3, -6.101401, 0, -0.5, 0.5, 0.5,
-4.161932, 3, -6.101401, 1, -0.5, 0.5, 0.5,
-4.161932, 3, -6.101401, 1, 1.5, 0.5, 0.5,
-4.161932, 3, -6.101401, 0, 1.5, 0.5, 0.5
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
-3.677823, -3.259133, -4,
-3.677823, -3.259133, 4,
-3.677823, -3.259133, -4,
-3.839192, -3.429883, -4,
-3.677823, -3.259133, -2,
-3.839192, -3.429883, -2,
-3.677823, -3.259133, 0,
-3.839192, -3.429883, 0,
-3.677823, -3.259133, 2,
-3.839192, -3.429883, 2,
-3.677823, -3.259133, 4,
-3.839192, -3.429883, 4
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
-4.161932, -3.771385, -4, 0, -0.5, 0.5, 0.5,
-4.161932, -3.771385, -4, 1, -0.5, 0.5, 0.5,
-4.161932, -3.771385, -4, 1, 1.5, 0.5, 0.5,
-4.161932, -3.771385, -4, 0, 1.5, 0.5, 0.5,
-4.161932, -3.771385, -2, 0, -0.5, 0.5, 0.5,
-4.161932, -3.771385, -2, 1, -0.5, 0.5, 0.5,
-4.161932, -3.771385, -2, 1, 1.5, 0.5, 0.5,
-4.161932, -3.771385, -2, 0, 1.5, 0.5, 0.5,
-4.161932, -3.771385, 0, 0, -0.5, 0.5, 0.5,
-4.161932, -3.771385, 0, 1, -0.5, 0.5, 0.5,
-4.161932, -3.771385, 0, 1, 1.5, 0.5, 0.5,
-4.161932, -3.771385, 0, 0, 1.5, 0.5, 0.5,
-4.161932, -3.771385, 2, 0, -0.5, 0.5, 0.5,
-4.161932, -3.771385, 2, 1, -0.5, 0.5, 0.5,
-4.161932, -3.771385, 2, 1, 1.5, 0.5, 0.5,
-4.161932, -3.771385, 2, 0, 1.5, 0.5, 0.5,
-4.161932, -3.771385, 4, 0, -0.5, 0.5, 0.5,
-4.161932, -3.771385, 4, 1, -0.5, 0.5, 0.5,
-4.161932, -3.771385, 4, 1, 1.5, 0.5, 0.5,
-4.161932, -3.771385, 4, 0, 1.5, 0.5, 0.5
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
-3.677823, -3.259133, -5.340743,
-3.677823, 3.570897, -5.340743,
-3.677823, -3.259133, 4.801371,
-3.677823, 3.570897, 4.801371,
-3.677823, -3.259133, -5.340743,
-3.677823, -3.259133, 4.801371,
-3.677823, 3.570897, -5.340743,
-3.677823, 3.570897, 4.801371,
-3.677823, -3.259133, -5.340743,
2.776961, -3.259133, -5.340743,
-3.677823, -3.259133, 4.801371,
2.776961, -3.259133, 4.801371,
-3.677823, 3.570897, -5.340743,
2.776961, 3.570897, -5.340743,
-3.677823, 3.570897, 4.801371,
2.776961, 3.570897, 4.801371,
2.776961, -3.259133, -5.340743,
2.776961, 3.570897, -5.340743,
2.776961, -3.259133, 4.801371,
2.776961, 3.570897, 4.801371,
2.776961, -3.259133, -5.340743,
2.776961, -3.259133, 4.801371,
2.776961, 3.570897, -5.340743,
2.776961, 3.570897, 4.801371
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
var radius = 7.383158;
var distance = 32.84851;
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
mvMatrix.translate( 0.4504306, -0.1558819, 0.2696862 );
mvMatrix.scale( 1.236728, 1.168782, 0.7870958 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.84851);
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
propaphos<-read.table("propaphos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propaphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'propaphos' not found
```

```r
y<-propaphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'propaphos' not found
```

```r
z<-propaphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'propaphos' not found
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
-3.583821, -0.03258949, -1.132352, 0, 0, 1, 1, 1,
-3.290216, -0.1028161, -2.320633, 1, 0, 0, 1, 1,
-3.199211, 0.324363, -2.881366, 1, 0, 0, 1, 1,
-3.14984, -0.08037283, -1.23548, 1, 0, 0, 1, 1,
-2.924064, -0.9232757, -3.277243, 1, 0, 0, 1, 1,
-2.865654, 0.1744227, -0.2702875, 1, 0, 0, 1, 1,
-2.710462, -0.07476405, -1.637258, 0, 0, 0, 1, 1,
-2.554219, 0.2186289, -1.574082, 0, 0, 0, 1, 1,
-2.497363, 0.8176212, -2.001095, 0, 0, 0, 1, 1,
-2.446488, 0.4318426, -0.0351764, 0, 0, 0, 1, 1,
-2.444716, -1.500181, -3.57978, 0, 0, 0, 1, 1,
-2.412386, 0.9683369, -1.983126, 0, 0, 0, 1, 1,
-2.291856, -2.007654, -2.374231, 0, 0, 0, 1, 1,
-2.22274, 1.813362, -0.1898903, 1, 1, 1, 1, 1,
-2.15781, 1.719465, -0.9191673, 1, 1, 1, 1, 1,
-2.140897, 0.7494114, 0.1209579, 1, 1, 1, 1, 1,
-2.139821, 0.6921134, -1.509884, 1, 1, 1, 1, 1,
-2.137925, 0.1082654, -0.6801327, 1, 1, 1, 1, 1,
-2.115882, -1.326215, -2.819532, 1, 1, 1, 1, 1,
-2.110965, -0.3528871, -0.9492105, 1, 1, 1, 1, 1,
-2.100228, 0.9501974, -2.068295, 1, 1, 1, 1, 1,
-2.097941, -0.9559274, -4.155665, 1, 1, 1, 1, 1,
-2.068307, -1.355026, -1.324194, 1, 1, 1, 1, 1,
-2.061157, -0.4564864, -3.725716, 1, 1, 1, 1, 1,
-2.03797, 1.851343, 0.3436353, 1, 1, 1, 1, 1,
-2.035095, -0.423001, -3.662193, 1, 1, 1, 1, 1,
-2.016535, 0.2040035, -2.158599, 1, 1, 1, 1, 1,
-1.937803, 3.196504, -0.198343, 1, 1, 1, 1, 1,
-1.901995, -0.2345227, -0.9845024, 0, 0, 1, 1, 1,
-1.875454, 0.6924323, 0.349843, 1, 0, 0, 1, 1,
-1.837774, -0.8327605, -1.62398, 1, 0, 0, 1, 1,
-1.829406, -0.5792041, -3.404736, 1, 0, 0, 1, 1,
-1.814007, 0.7154641, -0.4043114, 1, 0, 0, 1, 1,
-1.808993, -0.4643817, -0.4183094, 1, 0, 0, 1, 1,
-1.791646, 2.627927, 0.1139981, 0, 0, 0, 1, 1,
-1.790491, -0.5268384, 0.6191878, 0, 0, 0, 1, 1,
-1.770299, -0.124328, -2.578823, 0, 0, 0, 1, 1,
-1.763335, 1.179854, -1.387263, 0, 0, 0, 1, 1,
-1.74115, -1.625723, -0.6826663, 0, 0, 0, 1, 1,
-1.738191, 1.101927, -1.628686, 0, 0, 0, 1, 1,
-1.7381, 0.9471703, -0.1395883, 0, 0, 0, 1, 1,
-1.729334, -1.556588, -3.067648, 1, 1, 1, 1, 1,
-1.728092, 0.6502046, -1.587768, 1, 1, 1, 1, 1,
-1.72068, -1.935267, -3.054338, 1, 1, 1, 1, 1,
-1.713172, 1.552638, -0.5324984, 1, 1, 1, 1, 1,
-1.707866, -1.045375, -3.018703, 1, 1, 1, 1, 1,
-1.703666, 0.7769317, -0.8253112, 1, 1, 1, 1, 1,
-1.698755, 0.3267674, -1.208636, 1, 1, 1, 1, 1,
-1.696186, -1.190923, -1.86456, 1, 1, 1, 1, 1,
-1.684214, 0.2559894, -1.688087, 1, 1, 1, 1, 1,
-1.679504, -0.7987949, -2.716533, 1, 1, 1, 1, 1,
-1.672704, -0.2158891, -3.641089, 1, 1, 1, 1, 1,
-1.645781, -1.154731, -3.470068, 1, 1, 1, 1, 1,
-1.643483, 1.414703, 0.2724362, 1, 1, 1, 1, 1,
-1.639014, -0.4958963, -0.1939579, 1, 1, 1, 1, 1,
-1.628814, -0.4986117, -1.436362, 1, 1, 1, 1, 1,
-1.624488, -0.0109665, -0.4132122, 0, 0, 1, 1, 1,
-1.600452, -0.9898174, -1.514646, 1, 0, 0, 1, 1,
-1.583387, -2.002339, -1.583341, 1, 0, 0, 1, 1,
-1.578081, -1.426703, 0.03596077, 1, 0, 0, 1, 1,
-1.568502, -0.1695456, -1.123206, 1, 0, 0, 1, 1,
-1.551263, 0.7921402, -1.261182, 1, 0, 0, 1, 1,
-1.535452, 2.533381, -0.1389588, 0, 0, 0, 1, 1,
-1.531467, 0.4152977, -2.793181, 0, 0, 0, 1, 1,
-1.513765, 1.304693, -1.761746, 0, 0, 0, 1, 1,
-1.50801, 0.7224994, -2.705802, 0, 0, 0, 1, 1,
-1.506062, -0.2164237, -1.206256, 0, 0, 0, 1, 1,
-1.50295, -1.078963, -0.8976102, 0, 0, 0, 1, 1,
-1.495726, -0.7650158, -0.8719113, 0, 0, 0, 1, 1,
-1.493031, -0.01659591, -1.032998, 1, 1, 1, 1, 1,
-1.477449, -1.580048, -0.8062703, 1, 1, 1, 1, 1,
-1.471713, -0.941748, -1.697273, 1, 1, 1, 1, 1,
-1.466886, 1.012451, -1.606899, 1, 1, 1, 1, 1,
-1.463629, -0.1759828, 0.09982771, 1, 1, 1, 1, 1,
-1.459049, 0.4120654, -1.452901, 1, 1, 1, 1, 1,
-1.448777, -0.7211269, -0.4465482, 1, 1, 1, 1, 1,
-1.436639, -0.9941197, -2.439353, 1, 1, 1, 1, 1,
-1.435815, 1.997014, -0.5383318, 1, 1, 1, 1, 1,
-1.406881, 2.30908, 0.6279035, 1, 1, 1, 1, 1,
-1.39536, 1.008621, -0.4193923, 1, 1, 1, 1, 1,
-1.392312, 0.6399756, -1.407256, 1, 1, 1, 1, 1,
-1.387458, -1.591216, -2.651049, 1, 1, 1, 1, 1,
-1.386265, 1.447347, 0.7737353, 1, 1, 1, 1, 1,
-1.37785, -0.2201213, -1.887652, 1, 1, 1, 1, 1,
-1.375489, -1.920275, -2.96635, 0, 0, 1, 1, 1,
-1.363504, -0.2744817, -3.022131, 1, 0, 0, 1, 1,
-1.358472, 0.0325571, -2.173432, 1, 0, 0, 1, 1,
-1.353995, -1.168113, -2.349084, 1, 0, 0, 1, 1,
-1.349129, -0.6997721, -3.748396, 1, 0, 0, 1, 1,
-1.336534, 0.6154617, -1.625037, 1, 0, 0, 1, 1,
-1.329589, 0.5340065, -0.5508497, 0, 0, 0, 1, 1,
-1.325278, -0.1700799, -0.2633471, 0, 0, 0, 1, 1,
-1.323952, -1.236753, -3.409083, 0, 0, 0, 1, 1,
-1.319508, -0.7955152, -1.715882, 0, 0, 0, 1, 1,
-1.312158, 0.3575076, -3.077559, 0, 0, 0, 1, 1,
-1.311971, -0.4146443, -3.039502, 0, 0, 0, 1, 1,
-1.308418, -0.08001447, -0.5926145, 0, 0, 0, 1, 1,
-1.306191, -0.326063, -2.042152, 1, 1, 1, 1, 1,
-1.30096, -0.7046444, -2.163938, 1, 1, 1, 1, 1,
-1.29136, 0.5293493, -2.046139, 1, 1, 1, 1, 1,
-1.286599, -1.151751, -1.649657, 1, 1, 1, 1, 1,
-1.286496, 0.7264106, 0.09152005, 1, 1, 1, 1, 1,
-1.286188, 1.135866, 0.6981549, 1, 1, 1, 1, 1,
-1.284128, 0.7688931, -1.955361, 1, 1, 1, 1, 1,
-1.282758, 1.458454, 1.521697, 1, 1, 1, 1, 1,
-1.277069, 0.09026051, -2.60392, 1, 1, 1, 1, 1,
-1.276254, -1.110608, -4.144027, 1, 1, 1, 1, 1,
-1.268975, -0.8167486, -0.9474223, 1, 1, 1, 1, 1,
-1.247764, 0.5556354, -1.111197, 1, 1, 1, 1, 1,
-1.237734, -1.087827, -1.738247, 1, 1, 1, 1, 1,
-1.235721, -0.5355496, -1.640744, 1, 1, 1, 1, 1,
-1.233234, 1.009944, 0.293407, 1, 1, 1, 1, 1,
-1.226659, -0.7814968, -3.300717, 0, 0, 1, 1, 1,
-1.22279, 2.428671, -0.435013, 1, 0, 0, 1, 1,
-1.209309, 0.1369921, -2.230746, 1, 0, 0, 1, 1,
-1.207327, 0.5118731, -1.218946, 1, 0, 0, 1, 1,
-1.202015, 1.711586, 0.3869081, 1, 0, 0, 1, 1,
-1.195322, 1.367359, -0.5986932, 1, 0, 0, 1, 1,
-1.184076, -0.6160488, -2.658117, 0, 0, 0, 1, 1,
-1.184066, -0.6685471, -3.210776, 0, 0, 0, 1, 1,
-1.181147, 0.02283383, -2.483661, 0, 0, 0, 1, 1,
-1.164146, -1.082178, -1.37665, 0, 0, 0, 1, 1,
-1.163455, -0.1396913, -2.266458, 0, 0, 0, 1, 1,
-1.161716, -2.741068, -2.03936, 0, 0, 0, 1, 1,
-1.157672, 0.843025, 1.355103, 0, 0, 0, 1, 1,
-1.157032, 0.5526131, -1.61906, 1, 1, 1, 1, 1,
-1.14931, 0.1533841, -0.3902284, 1, 1, 1, 1, 1,
-1.134188, -0.2996008, -2.419546, 1, 1, 1, 1, 1,
-1.129142, -0.6035035, -1.567639, 1, 1, 1, 1, 1,
-1.124626, 2.392019, -1.156757, 1, 1, 1, 1, 1,
-1.120837, 1.188253, -0.899, 1, 1, 1, 1, 1,
-1.114492, 0.3358448, -0.763895, 1, 1, 1, 1, 1,
-1.110339, 1.447608, -1.37292, 1, 1, 1, 1, 1,
-1.107379, -1.414558, -2.534787, 1, 1, 1, 1, 1,
-1.105134, 0.6137787, -1.098385, 1, 1, 1, 1, 1,
-1.104853, -0.6547725, -4.861826, 1, 1, 1, 1, 1,
-1.100753, -1.075051, -1.115246, 1, 1, 1, 1, 1,
-1.100282, 0.08444951, -2.011731, 1, 1, 1, 1, 1,
-1.099691, 1.588839, -0.735305, 1, 1, 1, 1, 1,
-1.096961, -0.421203, -1.172061, 1, 1, 1, 1, 1,
-1.095478, -1.147033, -4.270916, 0, 0, 1, 1, 1,
-1.091164, 1.838491, 1.341561, 1, 0, 0, 1, 1,
-1.08441, 0.6344526, -0.7476528, 1, 0, 0, 1, 1,
-1.082792, 0.8421677, -0.9814274, 1, 0, 0, 1, 1,
-1.080114, -0.758553, -0.8811342, 1, 0, 0, 1, 1,
-1.077299, 1.076536, -0.5878991, 1, 0, 0, 1, 1,
-1.075178, -0.2249489, -1.353998, 0, 0, 0, 1, 1,
-1.063987, 0.3150393, -0.9918843, 0, 0, 0, 1, 1,
-1.063215, -0.06761057, -2.226722, 0, 0, 0, 1, 1,
-1.057817, 1.163889, 1.220859, 0, 0, 0, 1, 1,
-1.057032, -0.05740147, -1.631528, 0, 0, 0, 1, 1,
-1.05636, -0.4774429, -2.074485, 0, 0, 0, 1, 1,
-1.053056, -0.4438587, -2.650949, 0, 0, 0, 1, 1,
-1.049178, 0.3712729, -0.8471484, 1, 1, 1, 1, 1,
-1.047756, -0.5644661, -1.348723, 1, 1, 1, 1, 1,
-1.030317, -0.6381906, -2.416149, 1, 1, 1, 1, 1,
-1.02943, 0.2062531, -1.164336, 1, 1, 1, 1, 1,
-1.02779, -1.263007, -2.276523, 1, 1, 1, 1, 1,
-1.027712, 0.3702728, -0.9358802, 1, 1, 1, 1, 1,
-1.02694, 0.4035312, -0.7143687, 1, 1, 1, 1, 1,
-1.023199, 1.446078, 0.6311223, 1, 1, 1, 1, 1,
-1.020278, -1.185215, -1.860016, 1, 1, 1, 1, 1,
-1.001099, 0.8656982, -1.40664, 1, 1, 1, 1, 1,
-0.9954654, -0.2647962, -2.24602, 1, 1, 1, 1, 1,
-0.993835, 0.3392702, -0.03793802, 1, 1, 1, 1, 1,
-0.9896367, -1.209302, -3.57117, 1, 1, 1, 1, 1,
-0.9846262, 0.1676743, -2.704578, 1, 1, 1, 1, 1,
-0.9734616, -0.1610792, -3.319199, 1, 1, 1, 1, 1,
-0.9679493, -0.3111435, -1.586493, 0, 0, 1, 1, 1,
-0.9574382, -0.3339595, -1.029087, 1, 0, 0, 1, 1,
-0.9533986, 0.0782472, -0.2132013, 1, 0, 0, 1, 1,
-0.9452648, 0.5262522, -1.284072, 1, 0, 0, 1, 1,
-0.9409375, 0.8281267, -1.403753, 1, 0, 0, 1, 1,
-0.9356549, 0.7945821, -0.7863353, 1, 0, 0, 1, 1,
-0.9323915, 0.5398592, -1.571136, 0, 0, 0, 1, 1,
-0.9306636, 0.02491109, -2.487756, 0, 0, 0, 1, 1,
-0.9292294, -0.224705, -1.988217, 0, 0, 0, 1, 1,
-0.918117, 0.4619145, -0.6614384, 0, 0, 0, 1, 1,
-0.914102, -1.21292, -2.377882, 0, 0, 0, 1, 1,
-0.9123578, 0.9860942, -0.7386928, 0, 0, 0, 1, 1,
-0.9118556, 0.2522432, -1.377779, 0, 0, 0, 1, 1,
-0.9102616, 0.08278521, -0.9922081, 1, 1, 1, 1, 1,
-0.9056687, -0.1020366, -1.466809, 1, 1, 1, 1, 1,
-0.9001598, 0.1498515, -0.5265064, 1, 1, 1, 1, 1,
-0.8961768, -0.3699239, -2.44959, 1, 1, 1, 1, 1,
-0.8956513, -0.3225676, -3.336817, 1, 1, 1, 1, 1,
-0.8926784, 1.958159, -1.100659, 1, 1, 1, 1, 1,
-0.8885279, -0.9345245, -3.114269, 1, 1, 1, 1, 1,
-0.8849228, -1.045792, -3.995748, 1, 1, 1, 1, 1,
-0.8728383, -0.137447, -2.364989, 1, 1, 1, 1, 1,
-0.8704615, -2.701247, -1.877787, 1, 1, 1, 1, 1,
-0.8684126, 0.7437094, -1.575339, 1, 1, 1, 1, 1,
-0.86669, 0.01452425, -1.27507, 1, 1, 1, 1, 1,
-0.8631828, -0.9029881, -2.272051, 1, 1, 1, 1, 1,
-0.8598736, 0.9628744, 0.04905951, 1, 1, 1, 1, 1,
-0.8501664, -0.2422902, -2.001343, 1, 1, 1, 1, 1,
-0.8439271, -1.345417, -2.822742, 0, 0, 1, 1, 1,
-0.8419886, 1.342722, 0.3329226, 1, 0, 0, 1, 1,
-0.8409435, -0.1576551, -2.082262, 1, 0, 0, 1, 1,
-0.8407938, -1.763811, -5.109159, 1, 0, 0, 1, 1,
-0.8407548, -0.0554301, 0.09215251, 1, 0, 0, 1, 1,
-0.8406193, -0.4918675, -2.985583, 1, 0, 0, 1, 1,
-0.8352271, 1.899899, 0.6791122, 0, 0, 0, 1, 1,
-0.8295191, 1.884418, -2.066716, 0, 0, 0, 1, 1,
-0.8290897, 1.149513, -2.983877, 0, 0, 0, 1, 1,
-0.8289258, 0.4460061, -0.0002987476, 0, 0, 0, 1, 1,
-0.8274251, 0.450544, -1.740362, 0, 0, 0, 1, 1,
-0.8205612, -0.7444884, -3.418957, 0, 0, 0, 1, 1,
-0.8172395, -0.06407557, -2.060603, 0, 0, 0, 1, 1,
-0.8058866, -1.122732, -0.8978766, 1, 1, 1, 1, 1,
-0.8004656, 0.6042146, 0.5187699, 1, 1, 1, 1, 1,
-0.7987455, 0.9372827, -0.5625264, 1, 1, 1, 1, 1,
-0.7972736, -0.9889222, -2.892913, 1, 1, 1, 1, 1,
-0.7869592, 0.3497954, -2.235054, 1, 1, 1, 1, 1,
-0.7864499, -0.9524539, -2.921916, 1, 1, 1, 1, 1,
-0.7647213, -1.131976, -2.463377, 1, 1, 1, 1, 1,
-0.7614767, 1.618103, -0.979977, 1, 1, 1, 1, 1,
-0.7603424, -0.05050621, -1.513479, 1, 1, 1, 1, 1,
-0.7576586, 0.3132761, -0.6890805, 1, 1, 1, 1, 1,
-0.7518321, -0.846482, -2.586599, 1, 1, 1, 1, 1,
-0.7516199, 0.1694891, -2.926566, 1, 1, 1, 1, 1,
-0.7512796, -1.004013, -1.951728, 1, 1, 1, 1, 1,
-0.7504217, 0.2005576, -0.2160502, 1, 1, 1, 1, 1,
-0.7441097, -1.205043, -2.853223, 1, 1, 1, 1, 1,
-0.7267401, 1.800932, -0.1216651, 0, 0, 1, 1, 1,
-0.7191541, 2.607236, 0.9977971, 1, 0, 0, 1, 1,
-0.714641, 0.9262403, 0.08187668, 1, 0, 0, 1, 1,
-0.7107207, -2.376366, -2.609813, 1, 0, 0, 1, 1,
-0.7098353, -0.9740157, -1.732622, 1, 0, 0, 1, 1,
-0.7045407, -1.009108, -3.289448, 1, 0, 0, 1, 1,
-0.7040485, -1.443593, -2.675267, 0, 0, 0, 1, 1,
-0.7027448, 0.1443317, -2.529415, 0, 0, 0, 1, 1,
-0.7003944, 0.8630515, 0.3182827, 0, 0, 0, 1, 1,
-0.6998649, 0.676785, 1.080868, 0, 0, 0, 1, 1,
-0.6988989, 2.165177, 0.3844312, 0, 0, 0, 1, 1,
-0.6988888, -0.2512074, -3.494275, 0, 0, 0, 1, 1,
-0.697108, -0.7453676, -2.654871, 0, 0, 0, 1, 1,
-0.6882957, 0.4087848, -1.238019, 1, 1, 1, 1, 1,
-0.6670442, -0.5029557, -1.908355, 1, 1, 1, 1, 1,
-0.665108, 0.833317, -0.2348998, 1, 1, 1, 1, 1,
-0.6619435, -0.4037641, -1.777431, 1, 1, 1, 1, 1,
-0.6581501, -0.746371, -2.416166, 1, 1, 1, 1, 1,
-0.6507818, -0.1064297, -1.463814, 1, 1, 1, 1, 1,
-0.6496645, -0.9563656, -3.805007, 1, 1, 1, 1, 1,
-0.6494321, 0.9256406, -0.7749081, 1, 1, 1, 1, 1,
-0.6480657, -0.7467692, -3.34587, 1, 1, 1, 1, 1,
-0.6430199, 0.6017779, -0.83634, 1, 1, 1, 1, 1,
-0.642229, -0.2529505, -2.674311, 1, 1, 1, 1, 1,
-0.6416513, 0.5780082, -1.325045, 1, 1, 1, 1, 1,
-0.641622, 0.6613486, 0.2304617, 1, 1, 1, 1, 1,
-0.6335381, 0.1846078, -0.8234733, 1, 1, 1, 1, 1,
-0.6319294, -0.2768322, -3.669236, 1, 1, 1, 1, 1,
-0.6314446, -0.3853225, -1.618497, 0, 0, 1, 1, 1,
-0.626083, -0.1435662, -0.9268496, 1, 0, 0, 1, 1,
-0.6260163, 0.6023852, 0.1893583, 1, 0, 0, 1, 1,
-0.6232693, 0.4258722, -2.616925, 1, 0, 0, 1, 1,
-0.6211459, 0.3386132, 0.8112305, 1, 0, 0, 1, 1,
-0.6194537, 0.5970643, 1.325869, 1, 0, 0, 1, 1,
-0.6158642, 0.1325805, -0.6406838, 0, 0, 0, 1, 1,
-0.6152714, 0.768948, -0.4923771, 0, 0, 0, 1, 1,
-0.6145191, 0.5559396, 0.5753679, 0, 0, 0, 1, 1,
-0.6130022, -0.2754079, -3.177897, 0, 0, 0, 1, 1,
-0.6100391, 0.05010571, -2.619899, 0, 0, 0, 1, 1,
-0.6017841, -1.388747, -2.319941, 0, 0, 0, 1, 1,
-0.6007617, -0.3302185, -2.131171, 0, 0, 0, 1, 1,
-0.5977743, 1.483394, -1.160911, 1, 1, 1, 1, 1,
-0.5955586, 0.4464919, -2.17971, 1, 1, 1, 1, 1,
-0.5908265, 0.3368054, -1.065926, 1, 1, 1, 1, 1,
-0.5906378, 0.6670202, -0.4929778, 1, 1, 1, 1, 1,
-0.5898889, -0.7013494, -2.219899, 1, 1, 1, 1, 1,
-0.5890191, 0.9427088, 0.8744951, 1, 1, 1, 1, 1,
-0.5835326, 0.5887327, -1.05262, 1, 1, 1, 1, 1,
-0.5830317, 1.218448, 0.01468915, 1, 1, 1, 1, 1,
-0.5819154, 0.1321645, -2.392253, 1, 1, 1, 1, 1,
-0.5725363, -0.8970747, -2.229833, 1, 1, 1, 1, 1,
-0.5650669, -1.589912, -3.631794, 1, 1, 1, 1, 1,
-0.5585871, 1.929112, -1.361677, 1, 1, 1, 1, 1,
-0.555308, 0.3191903, -1.825999, 1, 1, 1, 1, 1,
-0.5545107, -0.9961529, -3.897064, 1, 1, 1, 1, 1,
-0.5529579, -1.029864, -2.82975, 1, 1, 1, 1, 1,
-0.5520185, 0.3251453, -1.187066, 0, 0, 1, 1, 1,
-0.5508887, -0.5258985, -2.610998, 1, 0, 0, 1, 1,
-0.5481195, -0.1017957, -2.215044, 1, 0, 0, 1, 1,
-0.5468341, 1.016389, 0.4468426, 1, 0, 0, 1, 1,
-0.5456414, -0.6074827, -2.256076, 1, 0, 0, 1, 1,
-0.5419003, 0.896239, -0.4965597, 1, 0, 0, 1, 1,
-0.5315164, 1.39661, -1.958359, 0, 0, 0, 1, 1,
-0.5308731, 0.4337351, -0.8036724, 0, 0, 0, 1, 1,
-0.5288689, -1.725245, -1.76053, 0, 0, 0, 1, 1,
-0.5285701, 0.4918972, -0.3772219, 0, 0, 0, 1, 1,
-0.5270039, -0.3186459, -2.624783, 0, 0, 0, 1, 1,
-0.5209322, 0.2458041, -1.628872, 0, 0, 0, 1, 1,
-0.5178118, -0.367184, 0.3009599, 0, 0, 0, 1, 1,
-0.5174938, -0.08787856, -1.066198, 1, 1, 1, 1, 1,
-0.5168649, -1.195137, -3.177568, 1, 1, 1, 1, 1,
-0.5146878, 1.071088, -1.798597, 1, 1, 1, 1, 1,
-0.5141856, 0.3403589, -1.203839, 1, 1, 1, 1, 1,
-0.5138444, -1.107827, -3.3764, 1, 1, 1, 1, 1,
-0.5131539, -1.628578, -3.637064, 1, 1, 1, 1, 1,
-0.508686, 0.9201747, -1.511065, 1, 1, 1, 1, 1,
-0.5072654, -0.8161591, -3.173171, 1, 1, 1, 1, 1,
-0.505839, 1.693256, 0.3844897, 1, 1, 1, 1, 1,
-0.4978183, 0.1975195, -1.604692, 1, 1, 1, 1, 1,
-0.4972193, 1.518943, 0.5364014, 1, 1, 1, 1, 1,
-0.4957894, -0.361551, -1.671154, 1, 1, 1, 1, 1,
-0.4937832, 1.783469, 0.7216487, 1, 1, 1, 1, 1,
-0.4934443, 2.009715, -1.418397, 1, 1, 1, 1, 1,
-0.491224, 0.7194684, 0.1133043, 1, 1, 1, 1, 1,
-0.4871323, 0.2783785, -0.2375286, 0, 0, 1, 1, 1,
-0.4804775, -0.2359443, -2.650814, 1, 0, 0, 1, 1,
-0.4768361, 0.5580837, -0.6722915, 1, 0, 0, 1, 1,
-0.4729241, 0.6446921, 0.629773, 1, 0, 0, 1, 1,
-0.4690475, -0.2532536, -2.844568, 1, 0, 0, 1, 1,
-0.4690201, 0.2947031, -0.9325576, 1, 0, 0, 1, 1,
-0.4609036, 0.7979677, -0.6036554, 0, 0, 0, 1, 1,
-0.4608212, 1.528509, -0.3505478, 0, 0, 0, 1, 1,
-0.4573102, -0.5051443, -4.782262, 0, 0, 0, 1, 1,
-0.4548859, 1.86287, -0.0333037, 0, 0, 0, 1, 1,
-0.4548049, 0.4130786, -1.874458, 0, 0, 0, 1, 1,
-0.4504345, 0.6524203, -1.217938, 0, 0, 0, 1, 1,
-0.4465975, -1.45723, -2.055286, 0, 0, 0, 1, 1,
-0.4464903, 0.6439629, -0.8993592, 1, 1, 1, 1, 1,
-0.4458567, 1.403215, 0.02840508, 1, 1, 1, 1, 1,
-0.4428566, 0.2392809, -1.825035, 1, 1, 1, 1, 1,
-0.4378406, -2.092531, -2.588477, 1, 1, 1, 1, 1,
-0.429789, 0.4191001, -1.052225, 1, 1, 1, 1, 1,
-0.4295168, -0.4508792, -1.168288, 1, 1, 1, 1, 1,
-0.4286737, 0.1701479, -0.5301233, 1, 1, 1, 1, 1,
-0.4283899, -0.2450359, -2.126537, 1, 1, 1, 1, 1,
-0.4274535, -0.6932844, -3.845124, 1, 1, 1, 1, 1,
-0.4227617, -0.7683454, -1.395402, 1, 1, 1, 1, 1,
-0.4215781, 1.116184, -1.034267, 1, 1, 1, 1, 1,
-0.4190606, 0.8819312, -0.667905, 1, 1, 1, 1, 1,
-0.4141887, -0.1637237, -2.453784, 1, 1, 1, 1, 1,
-0.4097602, 0.06255011, -1.277465, 1, 1, 1, 1, 1,
-0.4049626, -2.026562, -4.796624, 1, 1, 1, 1, 1,
-0.402351, -0.09562959, -1.98014, 0, 0, 1, 1, 1,
-0.4008718, 2.4665, -0.4457348, 1, 0, 0, 1, 1,
-0.3992503, 0.3026882, -1.328184, 1, 0, 0, 1, 1,
-0.3985345, -0.4636216, -1.116528, 1, 0, 0, 1, 1,
-0.3975682, -2.065548, -3.348541, 1, 0, 0, 1, 1,
-0.3953433, -1.252651, -1.918031, 1, 0, 0, 1, 1,
-0.3828853, 0.2798785, -1.025022, 0, 0, 0, 1, 1,
-0.3759139, -0.00924725, -1.313496, 0, 0, 0, 1, 1,
-0.3733984, -1.325367, -3.741933, 0, 0, 0, 1, 1,
-0.3726562, -1.478289, -2.027212, 0, 0, 0, 1, 1,
-0.3718554, -0.2648892, -1.740141, 0, 0, 0, 1, 1,
-0.37017, 0.4260984, -0.2724322, 0, 0, 0, 1, 1,
-0.3700829, -0.9072807, -3.400204, 0, 0, 0, 1, 1,
-0.3685434, -0.8100055, -3.263566, 1, 1, 1, 1, 1,
-0.3587813, 1.774214, -0.5192537, 1, 1, 1, 1, 1,
-0.3581064, 0.8963292, -1.559068, 1, 1, 1, 1, 1,
-0.3559813, -0.2785605, -1.523357, 1, 1, 1, 1, 1,
-0.3494985, -0.1327948, -1.48381, 1, 1, 1, 1, 1,
-0.3483508, 1.3482, -0.04051262, 1, 1, 1, 1, 1,
-0.3436458, -0.6524667, -1.109609, 1, 1, 1, 1, 1,
-0.3404623, 0.346691, -2.225662, 1, 1, 1, 1, 1,
-0.3395487, -1.932716, -2.880405, 1, 1, 1, 1, 1,
-0.3359784, -0.3092928, -2.26065, 1, 1, 1, 1, 1,
-0.3354333, 0.2721204, -1.169865, 1, 1, 1, 1, 1,
-0.3329779, -1.335118, 0.7936052, 1, 1, 1, 1, 1,
-0.3324474, -0.4139101, -2.488159, 1, 1, 1, 1, 1,
-0.3269812, -2.803649, -2.897835, 1, 1, 1, 1, 1,
-0.3263945, -0.1498358, -2.397344, 1, 1, 1, 1, 1,
-0.3263415, -0.04307078, -1.102204, 0, 0, 1, 1, 1,
-0.3235168, 0.1996561, -1.183476, 1, 0, 0, 1, 1,
-0.3195309, 0.6630987, -0.3313704, 1, 0, 0, 1, 1,
-0.3145519, -0.7008987, -3.76347, 1, 0, 0, 1, 1,
-0.313118, 0.3058086, 0.3863803, 1, 0, 0, 1, 1,
-0.3118101, 0.4303295, -0.606733, 1, 0, 0, 1, 1,
-0.3109182, 0.268433, 0.2444162, 0, 0, 0, 1, 1,
-0.3097405, 0.2922948, -0.03054772, 0, 0, 0, 1, 1,
-0.2991031, -2.018548, -2.647567, 0, 0, 0, 1, 1,
-0.2989018, 0.2076508, 0.1049639, 0, 0, 0, 1, 1,
-0.2979078, -0.8093287, -2.538033, 0, 0, 0, 1, 1,
-0.2978815, -0.6885657, -3.45625, 0, 0, 0, 1, 1,
-0.293618, 0.5147144, -1.387168, 0, 0, 0, 1, 1,
-0.2835965, -0.3853963, -1.347574, 1, 1, 1, 1, 1,
-0.2808876, 0.3521778, -0.5549408, 1, 1, 1, 1, 1,
-0.2754789, -0.4573401, -0.4509643, 1, 1, 1, 1, 1,
-0.2744182, -1.167698, -3.308134, 1, 1, 1, 1, 1,
-0.2737975, 0.7309014, -1.426037, 1, 1, 1, 1, 1,
-0.2737463, -0.7733361, -1.488917, 1, 1, 1, 1, 1,
-0.2734397, 0.9536463, 0.4575936, 1, 1, 1, 1, 1,
-0.2720491, -0.8846692, -1.772766, 1, 1, 1, 1, 1,
-0.2717661, 0.314467, 0.01417762, 1, 1, 1, 1, 1,
-0.2705236, 1.438933, 0.2430758, 1, 1, 1, 1, 1,
-0.2698877, -0.8306077, -2.862097, 1, 1, 1, 1, 1,
-0.2678885, 0.2289452, -1.375048, 1, 1, 1, 1, 1,
-0.2674704, -0.4525101, -1.911088, 1, 1, 1, 1, 1,
-0.2632551, -1.13235, -4.140804, 1, 1, 1, 1, 1,
-0.2602271, 0.4779975, -0.9247904, 1, 1, 1, 1, 1,
-0.2590055, 1.13179, 0.4348603, 0, 0, 1, 1, 1,
-0.2581097, 0.8882375, 0.6742806, 1, 0, 0, 1, 1,
-0.2520422, 0.9983352, -0.6422478, 1, 0, 0, 1, 1,
-0.2511145, -0.1798892, -1.087164, 1, 0, 0, 1, 1,
-0.2487315, 0.4310872, -0.3229149, 1, 0, 0, 1, 1,
-0.2469159, 0.3910002, -0.2315442, 1, 0, 0, 1, 1,
-0.2450717, -0.7329242, -2.125909, 0, 0, 0, 1, 1,
-0.2426035, 0.2353627, -1.122194, 0, 0, 0, 1, 1,
-0.2413642, 0.02804874, -1.264309, 0, 0, 0, 1, 1,
-0.2408963, -0.2744476, -1.28086, 0, 0, 0, 1, 1,
-0.2362603, -1.080896, -3.356549, 0, 0, 0, 1, 1,
-0.2343069, -0.05108657, -1.713563, 0, 0, 0, 1, 1,
-0.2307863, 0.3768356, -1.426869, 0, 0, 0, 1, 1,
-0.2289802, -1.109668, -1.885749, 1, 1, 1, 1, 1,
-0.2270983, -0.8894015, -2.515903, 1, 1, 1, 1, 1,
-0.2233979, -1.981715, -2.90709, 1, 1, 1, 1, 1,
-0.2208304, 0.6546293, -0.008789504, 1, 1, 1, 1, 1,
-0.2203305, -0.7475508, -1.829341, 1, 1, 1, 1, 1,
-0.2122708, 0.6396499, -0.1978599, 1, 1, 1, 1, 1,
-0.2113625, 0.6671187, -1.774726, 1, 1, 1, 1, 1,
-0.2104317, 0.6450506, -3.109796, 1, 1, 1, 1, 1,
-0.2103785, 0.610157, 1.0845, 1, 1, 1, 1, 1,
-0.2103, -1.641253, -2.745265, 1, 1, 1, 1, 1,
-0.2087859, 0.487801, -1.364955, 1, 1, 1, 1, 1,
-0.2081531, 2.28552, 0.1923147, 1, 1, 1, 1, 1,
-0.2032245, -0.999418, -1.640302, 1, 1, 1, 1, 1,
-0.2020244, -0.3566327, -2.40438, 1, 1, 1, 1, 1,
-0.1977576, -1.573678, -2.658512, 1, 1, 1, 1, 1,
-0.1965757, 0.5467808, 0.1389652, 0, 0, 1, 1, 1,
-0.1958922, -0.1309108, -2.860283, 1, 0, 0, 1, 1,
-0.1953572, 1.668919, -0.04951416, 1, 0, 0, 1, 1,
-0.1886077, 0.3716125, -0.3921842, 1, 0, 0, 1, 1,
-0.1878208, 0.3829986, -0.1543079, 1, 0, 0, 1, 1,
-0.1847435, 0.3342961, 0.4980779, 1, 0, 0, 1, 1,
-0.1841226, 0.8985355, 0.2039292, 0, 0, 0, 1, 1,
-0.1801111, 1.211366, -0.6802874, 0, 0, 0, 1, 1,
-0.179809, 0.1324723, 0.7072815, 0, 0, 0, 1, 1,
-0.1782569, 0.007715076, -1.119627, 0, 0, 0, 1, 1,
-0.1770417, -0.7809097, -3.331224, 0, 0, 0, 1, 1,
-0.1748634, 0.6832271, -0.9326105, 0, 0, 0, 1, 1,
-0.1725697, 1.660222, 0.7207879, 0, 0, 0, 1, 1,
-0.1666423, 0.0957703, -1.574283, 1, 1, 1, 1, 1,
-0.1633515, -3.133855, -3.751878, 1, 1, 1, 1, 1,
-0.1627373, 2.352685, -0.7649044, 1, 1, 1, 1, 1,
-0.1546302, -1.166753, -3.424705, 1, 1, 1, 1, 1,
-0.1539502, 1.537185, 0.03944274, 1, 1, 1, 1, 1,
-0.1433786, -0.4598535, -3.477333, 1, 1, 1, 1, 1,
-0.1432116, 1.128014, -2.325804, 1, 1, 1, 1, 1,
-0.1401915, -1.120094, -4.260111, 1, 1, 1, 1, 1,
-0.1397668, -0.1329234, -3.536325, 1, 1, 1, 1, 1,
-0.1390731, 0.1129603, 1.088853, 1, 1, 1, 1, 1,
-0.1379107, 0.1608452, -0.3902242, 1, 1, 1, 1, 1,
-0.1352696, -1.74925, -3.36507, 1, 1, 1, 1, 1,
-0.1278246, 1.009008, -2.014771, 1, 1, 1, 1, 1,
-0.1252697, -0.1538363, -2.914315, 1, 1, 1, 1, 1,
-0.1224805, -1.541262, -1.534152, 1, 1, 1, 1, 1,
-0.1219774, -0.9916579, -2.927979, 0, 0, 1, 1, 1,
-0.1171332, -0.3838556, -3.205639, 1, 0, 0, 1, 1,
-0.1115509, -0.5025095, -4.1149, 1, 0, 0, 1, 1,
-0.1101548, -1.5011, -2.731768, 1, 0, 0, 1, 1,
-0.1058448, -0.06779843, -0.8100494, 1, 0, 0, 1, 1,
-0.1049528, -0.0710444, -1.720071, 1, 0, 0, 1, 1,
-0.100115, 0.1371879, -1.771691, 0, 0, 0, 1, 1,
-0.09872685, -0.008142243, -1.07937, 0, 0, 0, 1, 1,
-0.09862534, -0.3209038, -3.64413, 0, 0, 0, 1, 1,
-0.09638628, 1.010182, 0.6415001, 0, 0, 0, 1, 1,
-0.09118546, -1.115361, -1.55446, 0, 0, 0, 1, 1,
-0.08598445, 0.1378907, -0.6918972, 0, 0, 0, 1, 1,
-0.08484935, -1.740484, -2.462111, 0, 0, 0, 1, 1,
-0.07675823, -1.227453, -4.362931, 1, 1, 1, 1, 1,
-0.0761779, 0.4232423, -0.5245471, 1, 1, 1, 1, 1,
-0.07103372, 0.7980694, 0.1329672, 1, 1, 1, 1, 1,
-0.07059482, 0.3859271, 1.791695, 1, 1, 1, 1, 1,
-0.0684683, -0.490567, -3.622492, 1, 1, 1, 1, 1,
-0.06746308, 0.7105168, -1.770224, 1, 1, 1, 1, 1,
-0.06221598, -0.1698546, -1.37749, 1, 1, 1, 1, 1,
-0.06210317, -1.22402, -1.610076, 1, 1, 1, 1, 1,
-0.06178717, 3.464694, -0.8355054, 1, 1, 1, 1, 1,
-0.05965653, 0.588191, -2.127645, 1, 1, 1, 1, 1,
-0.05904355, -2.006831, -3.105038, 1, 1, 1, 1, 1,
-0.05856768, -1.400543, -2.596626, 1, 1, 1, 1, 1,
-0.05753601, 0.3261359, -1.436695, 1, 1, 1, 1, 1,
-0.05383578, -0.3064271, -2.915233, 1, 1, 1, 1, 1,
-0.05266808, -0.05686947, -1.025817, 1, 1, 1, 1, 1,
-0.05208377, -0.6207442, -2.581901, 0, 0, 1, 1, 1,
-0.04905999, -0.9357682, -3.804259, 1, 0, 0, 1, 1,
-0.04883456, -0.238748, -5.193042, 1, 0, 0, 1, 1,
-0.044792, 1.823292, 2.23834, 1, 0, 0, 1, 1,
-0.04230541, -0.5085301, -1.869973, 1, 0, 0, 1, 1,
-0.04080018, -0.00198929, -0.3958281, 1, 0, 0, 1, 1,
-0.04040952, -0.6211516, -3.159702, 0, 0, 0, 1, 1,
-0.03743199, -0.9146132, -3.314487, 0, 0, 0, 1, 1,
-0.03674628, 0.1709511, -0.3092869, 0, 0, 0, 1, 1,
-0.03402685, 1.155928, -1.824612, 0, 0, 0, 1, 1,
-0.03313864, 0.1389356, 0.6594013, 0, 0, 0, 1, 1,
-0.02590899, -1.606243, -3.302041, 0, 0, 0, 1, 1,
-0.02342668, -0.6352474, -3.199908, 0, 0, 0, 1, 1,
-0.02068358, -1.091934, -2.956393, 1, 1, 1, 1, 1,
-0.02054806, 2.194071, -0.05088381, 1, 1, 1, 1, 1,
-0.01720121, 0.3938518, -1.822775, 1, 1, 1, 1, 1,
-0.01639031, 0.2461586, -0.3091128, 1, 1, 1, 1, 1,
-0.007438793, -0.4188449, -2.124794, 1, 1, 1, 1, 1,
-0.0001734626, 0.6775305, -0.4082189, 1, 1, 1, 1, 1,
5.766268e-05, 1.618884, -0.7626793, 1, 1, 1, 1, 1,
0.001884746, 1.049993, -1.855078, 1, 1, 1, 1, 1,
0.004612553, -0.8826667, 3.67572, 1, 1, 1, 1, 1,
0.006448838, 1.266409, -0.6917351, 1, 1, 1, 1, 1,
0.01244392, -0.461913, 4.618661, 1, 1, 1, 1, 1,
0.01437869, -1.071525, 2.474508, 1, 1, 1, 1, 1,
0.01503847, -0.04077822, 3.839381, 1, 1, 1, 1, 1,
0.01788433, 0.7780917, -1.121554, 1, 1, 1, 1, 1,
0.02059941, 0.5364134, 0.4184196, 1, 1, 1, 1, 1,
0.0273671, 1.16416, 0.6623024, 0, 0, 1, 1, 1,
0.03525649, 0.7228706, -0.4519515, 1, 0, 0, 1, 1,
0.03638593, 0.1730722, -1.018851, 1, 0, 0, 1, 1,
0.03667594, 0.6197364, 1.648913, 1, 0, 0, 1, 1,
0.03892994, 0.449965, 1.058865, 1, 0, 0, 1, 1,
0.04024564, 0.06636832, 1.578492, 1, 0, 0, 1, 1,
0.05025828, -0.3610036, 4.432279, 0, 0, 0, 1, 1,
0.05217795, -2.422171, 1.712501, 0, 0, 0, 1, 1,
0.05894779, -0.01551684, 1.732447, 0, 0, 0, 1, 1,
0.06054454, 0.3262245, 0.1434074, 0, 0, 0, 1, 1,
0.06165929, -1.434381, 1.976786, 0, 0, 0, 1, 1,
0.06606533, 1.646935, -0.4173946, 0, 0, 0, 1, 1,
0.06671406, 0.1360337, -1.085976, 0, 0, 0, 1, 1,
0.06792364, 1.811428, -0.618204, 1, 1, 1, 1, 1,
0.06879468, -0.6497066, 4.49421, 1, 1, 1, 1, 1,
0.07181382, -0.5422887, 2.870218, 1, 1, 1, 1, 1,
0.07423802, 0.6030223, -0.9077222, 1, 1, 1, 1, 1,
0.07799031, -0.7447768, 4.08181, 1, 1, 1, 1, 1,
0.07913441, -0.8846278, 3.066227, 1, 1, 1, 1, 1,
0.07952101, 0.2819792, 0.3985583, 1, 1, 1, 1, 1,
0.08089964, 0.273403, -0.1307509, 1, 1, 1, 1, 1,
0.0810433, 0.06249786, 0.8837371, 1, 1, 1, 1, 1,
0.08187827, -0.6917807, 4.569015, 1, 1, 1, 1, 1,
0.08309557, 2.408512, -0.3723314, 1, 1, 1, 1, 1,
0.08702642, -0.09532849, 3.879634, 1, 1, 1, 1, 1,
0.09634661, -1.557121, 2.008434, 1, 1, 1, 1, 1,
0.09775364, -0.9055654, 2.674587, 1, 1, 1, 1, 1,
0.102025, 1.609166, 0.476295, 1, 1, 1, 1, 1,
0.1020389, -2.304443, 0.8958036, 0, 0, 1, 1, 1,
0.1023703, -0.2552665, 1.944327, 1, 0, 0, 1, 1,
0.1094573, 1.589291, 0.2339434, 1, 0, 0, 1, 1,
0.109722, -0.4309749, 4.0756, 1, 0, 0, 1, 1,
0.1114593, 0.1089832, -1.019423, 1, 0, 0, 1, 1,
0.1116361, -2.13832, 3.930429, 1, 0, 0, 1, 1,
0.1213162, -0.7001766, 2.22843, 0, 0, 0, 1, 1,
0.1216777, -1.389572, 2.884429, 0, 0, 0, 1, 1,
0.126221, -0.4978823, 1.745823, 0, 0, 0, 1, 1,
0.1285247, -1.627131, 4.527964, 0, 0, 0, 1, 1,
0.1311014, -0.001846955, 2.612538, 0, 0, 0, 1, 1,
0.1344845, -3.159666, 2.599574, 0, 0, 0, 1, 1,
0.1352138, 1.711372, 0.2376377, 0, 0, 0, 1, 1,
0.1352486, 0.9154106, -0.4022503, 1, 1, 1, 1, 1,
0.1354115, -0.6380649, 3.392453, 1, 1, 1, 1, 1,
0.1364359, -0.04852176, 2.571185, 1, 1, 1, 1, 1,
0.1398626, 3.09838, 0.6288159, 1, 1, 1, 1, 1,
0.1398879, 0.41537, 1.653043, 1, 1, 1, 1, 1,
0.1421114, -1.776166, 3.333237, 1, 1, 1, 1, 1,
0.1431214, -0.7755799, 2.29781, 1, 1, 1, 1, 1,
0.1447923, 0.4400559, -0.1195505, 1, 1, 1, 1, 1,
0.1513952, 0.7346154, 1.39348, 1, 1, 1, 1, 1,
0.1539413, -0.7976507, 2.705843, 1, 1, 1, 1, 1,
0.1563978, 0.07992673, 0.9174861, 1, 1, 1, 1, 1,
0.1564343, 0.1686378, 1.386583, 1, 1, 1, 1, 1,
0.1574561, -0.7363227, 3.015154, 1, 1, 1, 1, 1,
0.158061, -0.7232754, 2.785443, 1, 1, 1, 1, 1,
0.1630522, 0.9474671, 0.642632, 1, 1, 1, 1, 1,
0.1644099, 2.437196, -0.9094922, 0, 0, 1, 1, 1,
0.1706608, 1.250798, -0.4656787, 1, 0, 0, 1, 1,
0.1867853, 0.7282291, -0.1898697, 1, 0, 0, 1, 1,
0.1917922, -0.8955423, 3.811364, 1, 0, 0, 1, 1,
0.2013961, -0.358982, 2.691744, 1, 0, 0, 1, 1,
0.2032421, 0.5429809, 1.424312, 1, 0, 0, 1, 1,
0.2038791, -1.113461, 3.510812, 0, 0, 0, 1, 1,
0.2053193, 0.3135741, -0.511434, 0, 0, 0, 1, 1,
0.2071105, -2.160492, 3.876839, 0, 0, 0, 1, 1,
0.2098012, -0.8108228, 1.552164, 0, 0, 0, 1, 1,
0.2113426, -0.01887406, 0.5286107, 0, 0, 0, 1, 1,
0.2121181, 0.8870311, -1.19966, 0, 0, 0, 1, 1,
0.2122235, 0.3503469, 0.04351239, 0, 0, 0, 1, 1,
0.2151206, 0.81248, 0.8238713, 1, 1, 1, 1, 1,
0.2152968, 0.3793228, 1.491158, 1, 1, 1, 1, 1,
0.2276662, 1.81346, 1.325737, 1, 1, 1, 1, 1,
0.237475, 0.9116604, 1.530822, 1, 1, 1, 1, 1,
0.2424569, 1.150662, -1.538151, 1, 1, 1, 1, 1,
0.243088, -1.217826, 3.235633, 1, 1, 1, 1, 1,
0.2437624, 0.9146416, 0.4630183, 1, 1, 1, 1, 1,
0.2453742, -0.1254503, 3.600765, 1, 1, 1, 1, 1,
0.2480939, -0.6214833, 4.117798, 1, 1, 1, 1, 1,
0.2502536, 0.1001172, 0.5880734, 1, 1, 1, 1, 1,
0.2514157, 0.0108332, 2.692002, 1, 1, 1, 1, 1,
0.2519557, -0.4061503, 1.508504, 1, 1, 1, 1, 1,
0.2529569, 0.3244175, -0.4344097, 1, 1, 1, 1, 1,
0.2555406, 1.965544, 0.5856705, 1, 1, 1, 1, 1,
0.2590911, 0.2772673, 0.7231647, 1, 1, 1, 1, 1,
0.2597655, -0.8501156, 2.913617, 0, 0, 1, 1, 1,
0.2622077, 0.4961595, -0.4189029, 1, 0, 0, 1, 1,
0.2636755, 0.004040216, 1.357071, 1, 0, 0, 1, 1,
0.2654639, -1.592928, 2.863227, 1, 0, 0, 1, 1,
0.2662646, -0.157266, 1.441596, 1, 0, 0, 1, 1,
0.2672176, -1.909606, 2.319342, 1, 0, 0, 1, 1,
0.2674907, 0.8248141, 2.849911, 0, 0, 0, 1, 1,
0.2679236, -1.317766, 0.5986941, 0, 0, 0, 1, 1,
0.269291, 0.3797697, 1.402533, 0, 0, 0, 1, 1,
0.2842517, 0.09678879, 1.933481, 0, 0, 0, 1, 1,
0.2870107, 0.5640611, 1.61182, 0, 0, 0, 1, 1,
0.287016, 0.2218912, 0.08728745, 0, 0, 0, 1, 1,
0.2904763, -0.6115293, 4.094366, 0, 0, 0, 1, 1,
0.290649, -0.4325325, 4.010309, 1, 1, 1, 1, 1,
0.2914028, -0.6646212, 2.602336, 1, 1, 1, 1, 1,
0.2922172, 0.0347334, -0.5105697, 1, 1, 1, 1, 1,
0.2956139, 1.733732, -1.035773, 1, 1, 1, 1, 1,
0.2963459, 1.011677, 0.7796063, 1, 1, 1, 1, 1,
0.298066, 0.3308287, 1.966923, 1, 1, 1, 1, 1,
0.3086251, -0.7811939, 4.02961, 1, 1, 1, 1, 1,
0.310265, 1.414971, 0.636813, 1, 1, 1, 1, 1,
0.3117183, -0.2544861, 1.894861, 1, 1, 1, 1, 1,
0.3123592, 0.3591838, -0.3683791, 1, 1, 1, 1, 1,
0.3136687, 1.76298, 1.314469, 1, 1, 1, 1, 1,
0.315564, -1.655638, 2.336431, 1, 1, 1, 1, 1,
0.3194467, -1.232368, 2.8087, 1, 1, 1, 1, 1,
0.3206334, 0.6342418, -0.579178, 1, 1, 1, 1, 1,
0.3222512, -0.1166656, 2.088264, 1, 1, 1, 1, 1,
0.3231717, -0.8819489, 1.171644, 0, 0, 1, 1, 1,
0.3270602, -1.613545, 2.648731, 1, 0, 0, 1, 1,
0.3271978, 1.125149, 0.3324437, 1, 0, 0, 1, 1,
0.3292003, 0.07842253, 2.451006, 1, 0, 0, 1, 1,
0.3303008, -0.4939134, 2.731393, 1, 0, 0, 1, 1,
0.3321316, 0.3808337, 1.773073, 1, 0, 0, 1, 1,
0.3328254, -1.622929, 2.212051, 0, 0, 0, 1, 1,
0.3337463, -0.7579613, 2.968812, 0, 0, 0, 1, 1,
0.3337883, 0.9545751, -0.05338123, 0, 0, 0, 1, 1,
0.3359243, 0.7933107, 0.5222589, 0, 0, 0, 1, 1,
0.342049, -1.299088, 3.24265, 0, 0, 0, 1, 1,
0.3441976, -0.3255886, 2.408063, 0, 0, 0, 1, 1,
0.3443043, -0.07413195, 1.076311, 0, 0, 0, 1, 1,
0.3445524, -0.7086701, 2.751207, 1, 1, 1, 1, 1,
0.3504738, 1.915924, -0.9701904, 1, 1, 1, 1, 1,
0.3518651, 0.3779644, 1.703612, 1, 1, 1, 1, 1,
0.352077, 0.5871383, 1.570118, 1, 1, 1, 1, 1,
0.3541248, -1.326471, 4.054862, 1, 1, 1, 1, 1,
0.3612372, -0.0742299, 1.686071, 1, 1, 1, 1, 1,
0.3669117, -1.81656, 3.5966, 1, 1, 1, 1, 1,
0.3683519, -0.4809879, 3.348195, 1, 1, 1, 1, 1,
0.3760235, -0.5410941, 2.603634, 1, 1, 1, 1, 1,
0.3765433, -0.3504451, 1.875534, 1, 1, 1, 1, 1,
0.3787934, 1.359543, -0.5367646, 1, 1, 1, 1, 1,
0.3790414, -0.593824, 4.108668, 1, 1, 1, 1, 1,
0.3792281, 0.2144481, 2.939903, 1, 1, 1, 1, 1,
0.38055, -0.5145819, -0.2361013, 1, 1, 1, 1, 1,
0.383117, -1.421985, 2.722783, 1, 1, 1, 1, 1,
0.3831968, -0.1747923, 1.995299, 0, 0, 1, 1, 1,
0.384554, 1.251719, 0.4544164, 1, 0, 0, 1, 1,
0.3857602, 1.176823, -0.07499556, 1, 0, 0, 1, 1,
0.3868357, 1.408281, 0.7942697, 1, 0, 0, 1, 1,
0.3890489, -1.185027, 2.056464, 1, 0, 0, 1, 1,
0.3924181, -0.3702433, 1.931371, 1, 0, 0, 1, 1,
0.3944944, -0.7939844, 1.528213, 0, 0, 0, 1, 1,
0.3972582, -0.09697022, 1.280893, 0, 0, 0, 1, 1,
0.4071395, 1.103694, 0.6749065, 0, 0, 0, 1, 1,
0.4104211, 0.3152993, 0.9111373, 0, 0, 0, 1, 1,
0.4147412, -1.288235, 1.975997, 0, 0, 0, 1, 1,
0.4147931, -0.7040719, 1.31634, 0, 0, 0, 1, 1,
0.422114, 0.05177924, 4.65367, 0, 0, 0, 1, 1,
0.4231039, -1.022706, 3.164576, 1, 1, 1, 1, 1,
0.4269926, 0.004309074, 1.379347, 1, 1, 1, 1, 1,
0.4312059, 0.5889176, 1.80173, 1, 1, 1, 1, 1,
0.4313593, 0.2836225, 1.305099, 1, 1, 1, 1, 1,
0.4322857, -1.269048, 3.192104, 1, 1, 1, 1, 1,
0.432632, -0.2284393, 2.177347, 1, 1, 1, 1, 1,
0.4380443, 0.7936365, 1.186315, 1, 1, 1, 1, 1,
0.4401628, -0.6275961, 3.079007, 1, 1, 1, 1, 1,
0.4426584, 0.9290599, 1.595619, 1, 1, 1, 1, 1,
0.450429, -1.113749, 0.9441066, 1, 1, 1, 1, 1,
0.4521228, 1.006726, 1.452074, 1, 1, 1, 1, 1,
0.4532872, -2.031648, 1.228246, 1, 1, 1, 1, 1,
0.4592996, 0.45187, -0.2835483, 1, 1, 1, 1, 1,
0.4594398, -0.3750193, 2.278651, 1, 1, 1, 1, 1,
0.4600277, 0.47381, 0.7348238, 1, 1, 1, 1, 1,
0.4655581, 0.4383921, -0.2092991, 0, 0, 1, 1, 1,
0.4786254, -1.461913, 2.816123, 1, 0, 0, 1, 1,
0.4829473, 0.2686181, -0.1983989, 1, 0, 0, 1, 1,
0.4849288, 1.878094, 0.8381093, 1, 0, 0, 1, 1,
0.4850756, 0.4564475, 1.693827, 1, 0, 0, 1, 1,
0.4872462, -0.2753884, 3.480674, 1, 0, 0, 1, 1,
0.4895147, 1.126947, 0.3922513, 0, 0, 0, 1, 1,
0.4938103, -1.783362, 1.323732, 0, 0, 0, 1, 1,
0.4965817, -1.384051, 2.852933, 0, 0, 0, 1, 1,
0.4966563, 1.741101, 1.166248, 0, 0, 0, 1, 1,
0.4984975, 1.449121, -0.5219609, 0, 0, 0, 1, 1,
0.5001475, 0.8794692, -0.03755702, 0, 0, 0, 1, 1,
0.5001891, -0.5092353, 1.959186, 0, 0, 0, 1, 1,
0.5020652, 1.137223, 0.7195145, 1, 1, 1, 1, 1,
0.5173408, -1.29517, 3.884474, 1, 1, 1, 1, 1,
0.5174022, 0.3403152, -0.2521186, 1, 1, 1, 1, 1,
0.5181172, 0.8689378, 0.7025041, 1, 1, 1, 1, 1,
0.5240575, -0.5527495, 0.7158451, 1, 1, 1, 1, 1,
0.5337406, 1.632322, 0.7712932, 1, 1, 1, 1, 1,
0.5340754, 1.502177, -0.7118256, 1, 1, 1, 1, 1,
0.5394467, -0.04963277, 2.85918, 1, 1, 1, 1, 1,
0.5406157, -0.02449653, 1.727395, 1, 1, 1, 1, 1,
0.5474797, -0.4156244, 1.698103, 1, 1, 1, 1, 1,
0.5552585, -0.1668431, 3.304499, 1, 1, 1, 1, 1,
0.561132, 0.4921077, -0.3863764, 1, 1, 1, 1, 1,
0.5677401, -1.326333, 3.949799, 1, 1, 1, 1, 1,
0.5700361, -2.095363, 3.196333, 1, 1, 1, 1, 1,
0.5723109, -1.540323, 3.961933, 1, 1, 1, 1, 1,
0.5749354, -0.3960923, 2.659692, 0, 0, 1, 1, 1,
0.5774844, -1.440473, 3.677456, 1, 0, 0, 1, 1,
0.579056, -1.375534, 1.37344, 1, 0, 0, 1, 1,
0.5796208, 0.4110686, 1.342445, 1, 0, 0, 1, 1,
0.5866041, -1.063501, 2.799442, 1, 0, 0, 1, 1,
0.5871838, -0.5690964, 3.329283, 1, 0, 0, 1, 1,
0.5875197, 0.9977947, -0.9002337, 0, 0, 0, 1, 1,
0.5932299, 0.1509474, 2.311088, 0, 0, 0, 1, 1,
0.602285, -0.06670394, 2.007144, 0, 0, 0, 1, 1,
0.6074256, -0.1135167, 1.544527, 0, 0, 0, 1, 1,
0.6082036, 0.4782749, 1.076057, 0, 0, 0, 1, 1,
0.6132683, -0.5694331, 4.187942, 0, 0, 0, 1, 1,
0.6138451, 0.7226372, 0.6109076, 0, 0, 0, 1, 1,
0.6152246, 0.2902514, 1.601945, 1, 1, 1, 1, 1,
0.6181353, -1.40927, -0.4822896, 1, 1, 1, 1, 1,
0.6194882, -2.317564, 2.277902, 1, 1, 1, 1, 1,
0.619836, 0.3635629, 1.546631, 1, 1, 1, 1, 1,
0.6218816, 1.610318, -0.4147314, 1, 1, 1, 1, 1,
0.6221589, -0.4897155, 2.789129, 1, 1, 1, 1, 1,
0.6240298, 0.9548343, -0.05775859, 1, 1, 1, 1, 1,
0.6282119, 0.6928864, 2.149942, 1, 1, 1, 1, 1,
0.6289655, 0.4014947, -0.5149205, 1, 1, 1, 1, 1,
0.6371822, -0.4904068, 2.849149, 1, 1, 1, 1, 1,
0.6379468, 0.4767011, 1.494948, 1, 1, 1, 1, 1,
0.6433195, -0.2776134, 0.8942567, 1, 1, 1, 1, 1,
0.6461344, 0.573239, 1.609264, 1, 1, 1, 1, 1,
0.6540037, 0.275497, -0.3904951, 1, 1, 1, 1, 1,
0.6610776, -0.1687993, 1.923693, 1, 1, 1, 1, 1,
0.6622199, 1.874494, 1.934963, 0, 0, 1, 1, 1,
0.6657318, 0.6916645, 1.298432, 1, 0, 0, 1, 1,
0.6699282, 0.3743492, 0.7260754, 1, 0, 0, 1, 1,
0.6705924, 0.1461105, 1.627879, 1, 0, 0, 1, 1,
0.677562, 0.4773572, 2.516882, 1, 0, 0, 1, 1,
0.6794397, -0.2142881, 0.9480322, 1, 0, 0, 1, 1,
0.6882213, -0.6140068, 2.520935, 0, 0, 0, 1, 1,
0.6888018, 0.02154997, 3.041553, 0, 0, 0, 1, 1,
0.6889614, -0.8532848, 2.856641, 0, 0, 0, 1, 1,
0.6899625, 0.5093927, 2.168564, 0, 0, 0, 1, 1,
0.7084722, -0.3184827, 0.9539757, 0, 0, 0, 1, 1,
0.7091909, 0.9191442, -0.4495471, 0, 0, 0, 1, 1,
0.709366, 0.6271548, 0.4701634, 0, 0, 0, 1, 1,
0.7095637, 0.06156802, 1.59441, 1, 1, 1, 1, 1,
0.7139692, -0.1236707, 2.154537, 1, 1, 1, 1, 1,
0.7206089, -0.5749534, 0.7711946, 1, 1, 1, 1, 1,
0.7217647, -0.473848, 0.7387199, 1, 1, 1, 1, 1,
0.7226049, 0.1855, 0.4791231, 1, 1, 1, 1, 1,
0.7273024, -0.6828231, 2.168617, 1, 1, 1, 1, 1,
0.7294306, -0.4361646, 0.8965076, 1, 1, 1, 1, 1,
0.7302971, 1.1995, -0.9113213, 1, 1, 1, 1, 1,
0.7333437, 0.8908618, -0.397057, 1, 1, 1, 1, 1,
0.7382606, 1.013894, 0.5342928, 1, 1, 1, 1, 1,
0.7397459, -0.0003747338, 2.101132, 1, 1, 1, 1, 1,
0.740385, -0.2032948, 1.962401, 1, 1, 1, 1, 1,
0.7406133, 0.9365733, 2.199039, 1, 1, 1, 1, 1,
0.7413783, -0.1477693, 0.3299404, 1, 1, 1, 1, 1,
0.7414271, 0.5401139, 2.141548, 1, 1, 1, 1, 1,
0.741749, 1.009559, 0.2734544, 0, 0, 1, 1, 1,
0.7433247, 0.5812805, 0.94466, 1, 0, 0, 1, 1,
0.7451621, -1.44291, 1.24253, 1, 0, 0, 1, 1,
0.7486371, -0.2508452, 2.84653, 1, 0, 0, 1, 1,
0.7503225, 0.3876941, 1.602848, 1, 0, 0, 1, 1,
0.7625812, 1.518837, 0.02508144, 1, 0, 0, 1, 1,
0.7682221, -0.5411856, 3.629753, 0, 0, 0, 1, 1,
0.7697038, 1.157011, 1.154035, 0, 0, 0, 1, 1,
0.7711061, -0.5728849, 3.118917, 0, 0, 0, 1, 1,
0.7711734, -0.5751122, 2.213907, 0, 0, 0, 1, 1,
0.7725365, -0.9347909, 1.631966, 0, 0, 0, 1, 1,
0.77697, -0.4705768, 1.9311, 0, 0, 0, 1, 1,
0.7781922, 0.4413667, 2.563886, 0, 0, 0, 1, 1,
0.7813638, 0.6270964, 2.274521, 1, 1, 1, 1, 1,
0.781966, -0.1376246, 1.354995, 1, 1, 1, 1, 1,
0.7837734, 0.2196884, -0.07166401, 1, 1, 1, 1, 1,
0.784612, 1.242282, 1.993976, 1, 1, 1, 1, 1,
0.7852127, 0.3538583, 1.024366, 1, 1, 1, 1, 1,
0.7859773, -1.408554, 3.587011, 1, 1, 1, 1, 1,
0.7892262, -0.01325929, 1.575088, 1, 1, 1, 1, 1,
0.7899578, -1.039773, 2.27932, 1, 1, 1, 1, 1,
0.7923833, 1.805708, -0.2761481, 1, 1, 1, 1, 1,
0.797846, -0.4444266, 2.821748, 1, 1, 1, 1, 1,
0.8022615, -0.5938244, 1.929662, 1, 1, 1, 1, 1,
0.8024464, -0.9358951, 2.506403, 1, 1, 1, 1, 1,
0.8036026, -0.4603285, 1.942187, 1, 1, 1, 1, 1,
0.8087895, 1.081424, 0.8709521, 1, 1, 1, 1, 1,
0.8108719, -1.024455, 1.113368, 1, 1, 1, 1, 1,
0.8125533, -0.2597434, 0.349952, 0, 0, 1, 1, 1,
0.8133062, 0.1825569, 1.229092, 1, 0, 0, 1, 1,
0.8262674, 0.2067022, 0.9209372, 1, 0, 0, 1, 1,
0.832299, 0.2566357, 1.273964, 1, 0, 0, 1, 1,
0.834843, 0.4614253, 1.398871, 1, 0, 0, 1, 1,
0.8407061, 0.1700299, 0.6774315, 1, 0, 0, 1, 1,
0.8429534, -1.517628, 3.823111, 0, 0, 0, 1, 1,
0.8435485, 1.731784, -0.1443198, 0, 0, 0, 1, 1,
0.8469725, -1.091671, 1.553679, 0, 0, 0, 1, 1,
0.8521278, 0.4410995, 1.457205, 0, 0, 0, 1, 1,
0.8566864, -1.331837, 3.892565, 0, 0, 0, 1, 1,
0.858888, -0.5423313, 2.015821, 0, 0, 0, 1, 1,
0.8606646, 0.5179954, 0.6923863, 0, 0, 0, 1, 1,
0.8668362, -1.294181, 0.2866477, 1, 1, 1, 1, 1,
0.8801457, 1.457592, 0.5635299, 1, 1, 1, 1, 1,
0.8823679, 0.2019873, 2.638126, 1, 1, 1, 1, 1,
0.8838001, 0.4297203, 2.617631, 1, 1, 1, 1, 1,
0.8842481, 0.05950649, 1.928435, 1, 1, 1, 1, 1,
0.8861064, -1.664144, 3.018497, 1, 1, 1, 1, 1,
0.8865674, -1.740852, 2.696213, 1, 1, 1, 1, 1,
0.8902259, -1.49456, 3.391134, 1, 1, 1, 1, 1,
0.8931411, -0.9971786, 3.465285, 1, 1, 1, 1, 1,
0.8950962, -1.481073, 2.834512, 1, 1, 1, 1, 1,
0.8967637, -1.496745, 1.881171, 1, 1, 1, 1, 1,
0.8967958, -1.538594, 1.713361, 1, 1, 1, 1, 1,
0.8995983, -0.1954851, 1.217146, 1, 1, 1, 1, 1,
0.8999743, -0.621307, 1.723239, 1, 1, 1, 1, 1,
0.9019389, -1.675498, 3.313515, 1, 1, 1, 1, 1,
0.9055313, 1.114158, 1.188127, 0, 0, 1, 1, 1,
0.907804, -0.2268816, 3.740082, 1, 0, 0, 1, 1,
0.9105902, -0.5667738, 1.416009, 1, 0, 0, 1, 1,
0.9135377, -2.35984, 2.583118, 1, 0, 0, 1, 1,
0.9162866, -1.069624, 2.502952, 1, 0, 0, 1, 1,
0.9202941, 2.414744, 0.3186543, 1, 0, 0, 1, 1,
0.9227179, -0.5615402, 2.085397, 0, 0, 0, 1, 1,
0.9248508, -1.293026, 3.769216, 0, 0, 0, 1, 1,
0.92814, -0.1349655, 0.6498179, 0, 0, 0, 1, 1,
0.9302747, 0.6848404, 0.2163555, 0, 0, 0, 1, 1,
0.9357778, 0.6207924, -0.4888158, 0, 0, 0, 1, 1,
0.9383228, 0.5737429, 1.494948, 0, 0, 0, 1, 1,
0.9394578, -0.480282, 1.388846, 0, 0, 0, 1, 1,
0.9526284, -0.4047388, 0.9331769, 1, 1, 1, 1, 1,
0.9567638, 0.4310388, 1.276613, 1, 1, 1, 1, 1,
0.9615108, -0.6443444, 1.008634, 1, 1, 1, 1, 1,
0.966655, -0.2920705, 1.843425, 1, 1, 1, 1, 1,
0.9666993, 0.2402306, 0.2004246, 1, 1, 1, 1, 1,
0.9740624, 0.6929474, 2.053632, 1, 1, 1, 1, 1,
0.9786633, 0.9562901, 1.847664, 1, 1, 1, 1, 1,
0.9834028, -1.453528, 1.569039, 1, 1, 1, 1, 1,
0.9883681, -0.3516861, 2.420203, 1, 1, 1, 1, 1,
0.9897271, -0.3068316, 1.641792, 1, 1, 1, 1, 1,
0.9907882, -0.840172, 1.823187, 1, 1, 1, 1, 1,
0.9941384, -0.9307173, 1.313375, 1, 1, 1, 1, 1,
0.9988587, 1.245044, 1.178263, 1, 1, 1, 1, 1,
1.000345, -1.402257, 2.06206, 1, 1, 1, 1, 1,
1.001668, -1.985007, 0.6247134, 1, 1, 1, 1, 1,
1.00374, 0.231157, 2.254317, 0, 0, 1, 1, 1,
1.008704, 0.1929142, 1.52191, 1, 0, 0, 1, 1,
1.014782, 2.090733, 0.6647084, 1, 0, 0, 1, 1,
1.017641, 0.9910071, 1.885701, 1, 0, 0, 1, 1,
1.018547, -2.061619, 3.062075, 1, 0, 0, 1, 1,
1.031427, -0.001021474, -1.644653, 1, 0, 0, 1, 1,
1.036152, -0.8745532, 2.306541, 0, 0, 0, 1, 1,
1.038211, 1.228117, -0.2733029, 0, 0, 0, 1, 1,
1.043503, -0.4718351, 0.006351633, 0, 0, 0, 1, 1,
1.04721, -1.988016, 2.468889, 0, 0, 0, 1, 1,
1.053179, -1.007276, 3.028992, 0, 0, 0, 1, 1,
1.055009, -0.776856, 1.16163, 0, 0, 0, 1, 1,
1.06811, 0.3254462, 1.107189, 0, 0, 0, 1, 1,
1.070819, 0.03584302, 2.780146, 1, 1, 1, 1, 1,
1.076594, -0.4060749, 1.221765, 1, 1, 1, 1, 1,
1.078682, -0.4992934, 2.942997, 1, 1, 1, 1, 1,
1.089359, 0.9194409, 1.701493, 1, 1, 1, 1, 1,
1.096742, -0.3393343, 0.8409308, 1, 1, 1, 1, 1,
1.099209, -0.1321577, 0.2521552, 1, 1, 1, 1, 1,
1.102394, 1.249774, 1.180121, 1, 1, 1, 1, 1,
1.102571, 0.8445947, 0.256473, 1, 1, 1, 1, 1,
1.107803, -0.9716474, 1.716305, 1, 1, 1, 1, 1,
1.110334, 0.7282517, 2.095493, 1, 1, 1, 1, 1,
1.110824, -1.123362, 1.57656, 1, 1, 1, 1, 1,
1.118218, 0.6715996, 0.5506018, 1, 1, 1, 1, 1,
1.122375, 0.7524547, 1.870069, 1, 1, 1, 1, 1,
1.125195, 1.063396, 0.5637296, 1, 1, 1, 1, 1,
1.128104, -0.01186589, 0.4578394, 1, 1, 1, 1, 1,
1.135359, -0.6766219, 3.062087, 0, 0, 1, 1, 1,
1.136933, 0.4379686, 1.921048, 1, 0, 0, 1, 1,
1.140598, 1.341197, 0.5101996, 1, 0, 0, 1, 1,
1.142867, -0.4726032, 1.017074, 1, 0, 0, 1, 1,
1.159289, -1.438276, 2.209336, 1, 0, 0, 1, 1,
1.163022, 0.1645142, 2.537079, 1, 0, 0, 1, 1,
1.171251, -0.09053243, 0.1324209, 0, 0, 0, 1, 1,
1.171556, -0.7717327, 3.104644, 0, 0, 0, 1, 1,
1.174374, -0.9008093, 4.183646, 0, 0, 0, 1, 1,
1.176519, -0.2789726, 1.264914, 0, 0, 0, 1, 1,
1.183479, 0.9525881, -1.271487, 0, 0, 0, 1, 1,
1.183616, -0.384939, 3.101084, 0, 0, 0, 1, 1,
1.187196, -0.1574256, 2.83557, 0, 0, 0, 1, 1,
1.19156, 0.1580749, 1.510175, 1, 1, 1, 1, 1,
1.196349, -0.455466, 0.8268513, 1, 1, 1, 1, 1,
1.201595, 1.930766, 0.267131, 1, 1, 1, 1, 1,
1.202783, -0.4112988, 0.9999946, 1, 1, 1, 1, 1,
1.208067, 0.5228856, -0.2040571, 1, 1, 1, 1, 1,
1.210026, -2.960454, 2.392779, 1, 1, 1, 1, 1,
1.211968, 0.9130228, -1.220108, 1, 1, 1, 1, 1,
1.216148, 2.187743, -1.276564, 1, 1, 1, 1, 1,
1.218155, -1.398244, 3.426193, 1, 1, 1, 1, 1,
1.226178, -0.5579531, 3.834723, 1, 1, 1, 1, 1,
1.229357, 0.1176054, 1.091675, 1, 1, 1, 1, 1,
1.232967, 1.555339, 0.1616092, 1, 1, 1, 1, 1,
1.236499, -1.71102, 1.933038, 1, 1, 1, 1, 1,
1.236524, 0.06329939, 3.807641, 1, 1, 1, 1, 1,
1.237378, 0.9612607, 0.7906322, 1, 1, 1, 1, 1,
1.239113, 0.770754, 1.250944, 0, 0, 1, 1, 1,
1.240244, -1.157455, 1.724702, 1, 0, 0, 1, 1,
1.242397, -0.8533083, 1.124213, 1, 0, 0, 1, 1,
1.242858, -0.4531834, 4.328253, 1, 0, 0, 1, 1,
1.248982, 1.210891, 3.362523, 1, 0, 0, 1, 1,
1.254668, 0.2107026, -0.4957234, 1, 0, 0, 1, 1,
1.273877, 0.659134, 2.468639, 0, 0, 0, 1, 1,
1.287661, -0.08695046, 1.59673, 0, 0, 0, 1, 1,
1.292141, 2.239106, 0.4306168, 0, 0, 0, 1, 1,
1.302407, -0.6764001, 2.070846, 0, 0, 0, 1, 1,
1.32165, 0.8346488, 1.058326, 0, 0, 0, 1, 1,
1.321925, 0.9878697, 1.607847, 0, 0, 0, 1, 1,
1.327714, -0.9278961, 3.917856, 0, 0, 0, 1, 1,
1.329455, 1.397652, 0.3499272, 1, 1, 1, 1, 1,
1.330095, -0.01898482, 3.217124, 1, 1, 1, 1, 1,
1.335644, 0.9560596, 3.001579, 1, 1, 1, 1, 1,
1.337394, 0.3095229, 2.122336, 1, 1, 1, 1, 1,
1.339878, -1.476078, 1.576766, 1, 1, 1, 1, 1,
1.348846, -1.031047, 2.84933, 1, 1, 1, 1, 1,
1.352972, -0.1235753, 0.4032606, 1, 1, 1, 1, 1,
1.355545, -0.2801889, 2.591812, 1, 1, 1, 1, 1,
1.358232, -0.5356433, 1.695443, 1, 1, 1, 1, 1,
1.363878, -0.970495, 0.8446902, 1, 1, 1, 1, 1,
1.369198, 0.1239106, 0.4670174, 1, 1, 1, 1, 1,
1.370023, 0.265478, 0.5766067, 1, 1, 1, 1, 1,
1.370492, 0.2044383, 0.6012416, 1, 1, 1, 1, 1,
1.375955, -0.2094232, 1.841922, 1, 1, 1, 1, 1,
1.385528, 0.1907538, -1.235487, 1, 1, 1, 1, 1,
1.409561, 0.2986411, 0.09999621, 0, 0, 1, 1, 1,
1.423935, 0.8179253, 0.7505981, 1, 0, 0, 1, 1,
1.431322, -0.1997161, 3.840282, 1, 0, 0, 1, 1,
1.445768, 0.3182776, 2.127204, 1, 0, 0, 1, 1,
1.449571, 0.8034781, 1.795985, 1, 0, 0, 1, 1,
1.462984, -0.06736027, -0.4182505, 1, 0, 0, 1, 1,
1.463767, 0.7976708, 0.4865962, 0, 0, 0, 1, 1,
1.472014, 1.015291, 0.6412504, 0, 0, 0, 1, 1,
1.474372, 0.08211729, 2.70782, 0, 0, 0, 1, 1,
1.508893, 0.7892143, -0.5521219, 0, 0, 0, 1, 1,
1.511845, 0.9600579, 1.022616, 0, 0, 0, 1, 1,
1.515697, -0.1367531, 1.354343, 0, 0, 0, 1, 1,
1.557292, -1.075, 1.662279, 0, 0, 0, 1, 1,
1.564857, 0.5812003, 2.13555, 1, 1, 1, 1, 1,
1.564974, 0.4954692, -0.2243508, 1, 1, 1, 1, 1,
1.586168, 0.9957623, 3.035126, 1, 1, 1, 1, 1,
1.58893, 0.6044803, 1.119218, 1, 1, 1, 1, 1,
1.591945, 1.633324, -0.1162601, 1, 1, 1, 1, 1,
1.602229, -1.54366, 2.519373, 1, 1, 1, 1, 1,
1.609514, -1.158861, 0.7861035, 1, 1, 1, 1, 1,
1.613879, 1.291044, 0.7089488, 1, 1, 1, 1, 1,
1.618301, -1.941564, 4.105102, 1, 1, 1, 1, 1,
1.63324, -1.128832, -0.7560797, 1, 1, 1, 1, 1,
1.63738, -0.7592356, 1.754933, 1, 1, 1, 1, 1,
1.640326, -0.168073, 1.918159, 1, 1, 1, 1, 1,
1.644709, 0.1924057, 0.3675694, 1, 1, 1, 1, 1,
1.648031, -0.1618741, 2.589188, 1, 1, 1, 1, 1,
1.649117, -0.7932113, 2.915215, 1, 1, 1, 1, 1,
1.658961, 0.1547154, -0.4965098, 0, 0, 1, 1, 1,
1.659286, -1.115036, 0.7918284, 1, 0, 0, 1, 1,
1.662776, 0.5596257, 1.629935, 1, 0, 0, 1, 1,
1.68433, 0.2758846, 0.1671296, 1, 0, 0, 1, 1,
1.685598, -0.1243591, 2.155813, 1, 0, 0, 1, 1,
1.686551, -0.1215166, 1.06808, 1, 0, 0, 1, 1,
1.690124, -0.5154613, 0.5270193, 0, 0, 0, 1, 1,
1.695114, -0.3689888, 1.273392, 0, 0, 0, 1, 1,
1.696105, 0.7476015, 0.7539186, 0, 0, 0, 1, 1,
1.699321, 0.2814397, 1.804745, 0, 0, 0, 1, 1,
1.707898, -1.163962, -0.3939132, 0, 0, 0, 1, 1,
1.717731, 0.03634601, 2.230139, 0, 0, 0, 1, 1,
1.724831, 0.05467199, 1.492556, 0, 0, 0, 1, 1,
1.726782, -0.6363493, 0.861621, 1, 1, 1, 1, 1,
1.784249, 0.2270614, 1.70812, 1, 1, 1, 1, 1,
1.797696, -0.3281216, 2.748026, 1, 1, 1, 1, 1,
1.821104, 0.1136124, 1.239995, 1, 1, 1, 1, 1,
1.821811, -0.4016524, 0.3425101, 1, 1, 1, 1, 1,
1.86661, 1.486024, 1.625461, 1, 1, 1, 1, 1,
1.86966, -0.04569027, 2.505007, 1, 1, 1, 1, 1,
1.885912, -1.35547, 2.405019, 1, 1, 1, 1, 1,
1.90375, 0.4562261, 1.52543, 1, 1, 1, 1, 1,
1.910297, -1.847978, 1.776919, 1, 1, 1, 1, 1,
1.931291, -1.996955, 2.459878, 1, 1, 1, 1, 1,
1.939571, -0.5940396, 4.345206, 1, 1, 1, 1, 1,
1.947107, 3.47143, 1.803779, 1, 1, 1, 1, 1,
1.991254, -1.072101, 1.527603, 1, 1, 1, 1, 1,
2.020433, -1.497704, 2.755064, 1, 1, 1, 1, 1,
2.021815, -0.2331267, 3.095724, 0, 0, 1, 1, 1,
2.032781, 0.4540895, -0.5061852, 1, 0, 0, 1, 1,
2.064543, -1.084475, 0.771268, 1, 0, 0, 1, 1,
2.0656, -1.495705, 1.069478, 1, 0, 0, 1, 1,
2.074178, -0.08852727, 2.42943, 1, 0, 0, 1, 1,
2.097317, 0.1692685, 1.740599, 1, 0, 0, 1, 1,
2.143608, -2.195034, 1.759572, 0, 0, 0, 1, 1,
2.199707, -0.5862679, 1.533721, 0, 0, 0, 1, 1,
2.207758, 0.125568, 0.1984936, 0, 0, 0, 1, 1,
2.210156, -1.235032, 1.76238, 0, 0, 0, 1, 1,
2.230461, 0.2277383, 1.335522, 0, 0, 0, 1, 1,
2.2844, -1.356949, 3.092521, 0, 0, 0, 1, 1,
2.383784, -0.5835643, 1.898494, 0, 0, 0, 1, 1,
2.399297, 1.553155, 2.33207, 1, 1, 1, 1, 1,
2.477338, 0.2674921, 2.183895, 1, 1, 1, 1, 1,
2.498577, 0.003315798, 1.114343, 1, 1, 1, 1, 1,
2.544867, -1.331831, 2.379315, 1, 1, 1, 1, 1,
2.57047, -0.957288, 1.263096, 1, 1, 1, 1, 1,
2.576404, 0.9107455, 2.742304, 1, 1, 1, 1, 1,
2.68296, -1.184658, 1.698587, 1, 1, 1, 1, 1
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
var radius = 9.255375;
var distance = 32.50911;
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
mvMatrix.translate( 0.4504306, -0.1558819, 0.2696862 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.50911);
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
