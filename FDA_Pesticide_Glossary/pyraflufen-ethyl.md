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
-3.504042, -0.368637, -2.553071, 1, 0, 0, 1,
-3.21518, 0.5318501, -1.714326, 1, 0.007843138, 0, 1,
-2.777293, 1.328698, -0.6864232, 1, 0.01176471, 0, 1,
-2.656866, 0.8673943, -2.549478, 1, 0.01960784, 0, 1,
-2.650372, 0.09809341, -2.077466, 1, 0.02352941, 0, 1,
-2.520243, -0.6721628, -0.6115203, 1, 0.03137255, 0, 1,
-2.437073, 0.3827988, 0.4791059, 1, 0.03529412, 0, 1,
-2.429377, -0.7933371, -2.427205, 1, 0.04313726, 0, 1,
-2.397866, -0.6555302, 0.2064953, 1, 0.04705882, 0, 1,
-2.377807, -1.065414, -2.196405, 1, 0.05490196, 0, 1,
-2.211126, -0.8585832, -1.487385, 1, 0.05882353, 0, 1,
-2.210077, 1.037914, -2.000776, 1, 0.06666667, 0, 1,
-2.196184, 0.9262683, -0.6630633, 1, 0.07058824, 0, 1,
-2.146935, 0.4697611, -1.593318, 1, 0.07843138, 0, 1,
-2.135736, 0.01936683, -1.861821, 1, 0.08235294, 0, 1,
-2.074194, 0.3672111, 0.1637975, 1, 0.09019608, 0, 1,
-2.072351, 0.1430927, -0.9443679, 1, 0.09411765, 0, 1,
-2.050088, -0.03078391, -1.070351, 1, 0.1019608, 0, 1,
-2.032998, 1.002867, 0.3750916, 1, 0.1098039, 0, 1,
-2.032597, 0.7781618, -2.153653, 1, 0.1137255, 0, 1,
-2.023321, 0.2006618, -3.283235, 1, 0.1215686, 0, 1,
-1.953243, 0.6167281, -1.221943, 1, 0.1254902, 0, 1,
-1.952965, -0.0607916, 0.01201823, 1, 0.1333333, 0, 1,
-1.89936, 0.3188041, -0.4706248, 1, 0.1372549, 0, 1,
-1.892516, -1.52635, -1.206015, 1, 0.145098, 0, 1,
-1.855469, 0.9904748, -2.436096, 1, 0.1490196, 0, 1,
-1.844598, 0.1858282, -1.853896, 1, 0.1568628, 0, 1,
-1.835888, -0.04592129, -1.822886, 1, 0.1607843, 0, 1,
-1.834245, -0.5848203, -1.598221, 1, 0.1686275, 0, 1,
-1.824803, -0.2795528, -2.242776, 1, 0.172549, 0, 1,
-1.802161, 0.0605579, -1.722012, 1, 0.1803922, 0, 1,
-1.782907, 0.01318937, -1.263535, 1, 0.1843137, 0, 1,
-1.757418, 0.005191803, -0.2148678, 1, 0.1921569, 0, 1,
-1.737598, 0.5118752, -2.505204, 1, 0.1960784, 0, 1,
-1.719107, -0.2932974, -0.1700718, 1, 0.2039216, 0, 1,
-1.709973, -0.2261325, -1.43807, 1, 0.2117647, 0, 1,
-1.703707, -2.007257, -2.545251, 1, 0.2156863, 0, 1,
-1.681618, 0.1914606, -1.404922, 1, 0.2235294, 0, 1,
-1.680624, 3.014133, -0.8707846, 1, 0.227451, 0, 1,
-1.679778, 0.2158087, -2.243112, 1, 0.2352941, 0, 1,
-1.677784, 0.03401386, -0.4020869, 1, 0.2392157, 0, 1,
-1.671826, -0.7740923, -2.435592, 1, 0.2470588, 0, 1,
-1.669011, -0.2085762, -2.389665, 1, 0.2509804, 0, 1,
-1.660116, -1.30945, -3.022596, 1, 0.2588235, 0, 1,
-1.659054, 1.014387, -0.3483336, 1, 0.2627451, 0, 1,
-1.655518, 0.1196362, -0.7068163, 1, 0.2705882, 0, 1,
-1.650144, -0.8820435, -1.455046, 1, 0.2745098, 0, 1,
-1.64587, 0.9439806, -2.37678, 1, 0.282353, 0, 1,
-1.633693, -1.360934, -2.798092, 1, 0.2862745, 0, 1,
-1.624985, 0.6504451, -2.29694, 1, 0.2941177, 0, 1,
-1.608724, 0.3478011, -1.941841, 1, 0.3019608, 0, 1,
-1.592122, 0.5439767, -1.577618, 1, 0.3058824, 0, 1,
-1.581887, -0.2815318, -1.317285, 1, 0.3137255, 0, 1,
-1.57445, 0.3221194, -1.935776, 1, 0.3176471, 0, 1,
-1.566571, 0.03518559, -1.050813, 1, 0.3254902, 0, 1,
-1.564647, 0.7456135, -0.2569342, 1, 0.3294118, 0, 1,
-1.545718, -1.798443, -2.889713, 1, 0.3372549, 0, 1,
-1.533487, 0.4571348, -0.3542399, 1, 0.3411765, 0, 1,
-1.529476, 1.019355, -1.895602, 1, 0.3490196, 0, 1,
-1.528638, -2.118471, -2.103919, 1, 0.3529412, 0, 1,
-1.513061, -1.479478, -2.51704, 1, 0.3607843, 0, 1,
-1.505072, -0.5108976, -1.03496, 1, 0.3647059, 0, 1,
-1.497021, 0.4082836, -0.7026325, 1, 0.372549, 0, 1,
-1.483322, -0.2577658, -1.616644, 1, 0.3764706, 0, 1,
-1.46608, 2.297458, 1.021895, 1, 0.3843137, 0, 1,
-1.460053, -0.766832, -1.51389, 1, 0.3882353, 0, 1,
-1.451472, 0.7650707, -1.08722, 1, 0.3960784, 0, 1,
-1.451096, 0.6959178, -0.3894627, 1, 0.4039216, 0, 1,
-1.449626, 0.3925456, -2.604652, 1, 0.4078431, 0, 1,
-1.440064, 1.490774, -2.155557, 1, 0.4156863, 0, 1,
-1.43744, -0.596451, -2.343952, 1, 0.4196078, 0, 1,
-1.436247, 0.7394526, -1.569422, 1, 0.427451, 0, 1,
-1.435863, 1.098352, -1.247676, 1, 0.4313726, 0, 1,
-1.427029, -0.3867697, 0.4675789, 1, 0.4392157, 0, 1,
-1.426368, 0.2204461, 0.02717002, 1, 0.4431373, 0, 1,
-1.426257, 0.4542273, -0.7843117, 1, 0.4509804, 0, 1,
-1.425949, -1.196382, -2.180936, 1, 0.454902, 0, 1,
-1.425717, 1.62053, -0.6047308, 1, 0.4627451, 0, 1,
-1.419669, -0.4274707, -1.173372, 1, 0.4666667, 0, 1,
-1.418828, -0.2689844, -4.021982, 1, 0.4745098, 0, 1,
-1.417785, -0.5709806, -1.025715, 1, 0.4784314, 0, 1,
-1.417153, 1.256881, 0.06013579, 1, 0.4862745, 0, 1,
-1.393488, -1.009022, -2.934833, 1, 0.4901961, 0, 1,
-1.38051, -0.256699, -2.035087, 1, 0.4980392, 0, 1,
-1.378721, 0.3209735, -1.733167, 1, 0.5058824, 0, 1,
-1.372999, -1.702893, -1.173168, 1, 0.509804, 0, 1,
-1.36819, -0.0300511, -2.610186, 1, 0.5176471, 0, 1,
-1.350586, 0.6028908, -1.559676, 1, 0.5215687, 0, 1,
-1.34922, -1.922532, -2.576897, 1, 0.5294118, 0, 1,
-1.349009, 0.09890348, -2.017252, 1, 0.5333334, 0, 1,
-1.339918, 0.0985577, -2.292429, 1, 0.5411765, 0, 1,
-1.336085, -0.3696123, -2.804633, 1, 0.5450981, 0, 1,
-1.335439, 1.847448, -2.288199, 1, 0.5529412, 0, 1,
-1.334158, -0.2548391, -2.587743, 1, 0.5568628, 0, 1,
-1.333882, -0.8256125, -3.744695, 1, 0.5647059, 0, 1,
-1.331173, 0.2407551, -0.0507122, 1, 0.5686275, 0, 1,
-1.328357, -0.4507238, -3.013085, 1, 0.5764706, 0, 1,
-1.322843, -0.756636, -1.598005, 1, 0.5803922, 0, 1,
-1.321963, -0.8458062, -2.487809, 1, 0.5882353, 0, 1,
-1.300392, 1.04355, -0.2542235, 1, 0.5921569, 0, 1,
-1.292542, 0.7739651, -0.6396046, 1, 0.6, 0, 1,
-1.292477, 0.4650897, -2.333014, 1, 0.6078432, 0, 1,
-1.29197, -0.4165997, -2.050409, 1, 0.6117647, 0, 1,
-1.282323, 0.1585227, 0.0253788, 1, 0.6196079, 0, 1,
-1.269629, 0.3866352, -0.6755462, 1, 0.6235294, 0, 1,
-1.258278, 2.585412, -3.075977, 1, 0.6313726, 0, 1,
-1.250956, 1.22746, -2.194807, 1, 0.6352941, 0, 1,
-1.242498, -1.652743, -3.603935, 1, 0.6431373, 0, 1,
-1.239376, 1.283286, -0.2599733, 1, 0.6470588, 0, 1,
-1.232683, 0.3736245, -2.720056, 1, 0.654902, 0, 1,
-1.229475, 0.2916519, -0.8747134, 1, 0.6588235, 0, 1,
-1.212654, -0.8903053, -3.535417, 1, 0.6666667, 0, 1,
-1.201627, 0.5509652, -3.026282, 1, 0.6705883, 0, 1,
-1.201004, 0.09889988, -0.3095253, 1, 0.6784314, 0, 1,
-1.193671, -0.5414714, -2.630493, 1, 0.682353, 0, 1,
-1.193253, -0.2117837, -1.280615, 1, 0.6901961, 0, 1,
-1.189288, 0.3635002, -0.7527597, 1, 0.6941177, 0, 1,
-1.183395, -0.2143627, -3.787946, 1, 0.7019608, 0, 1,
-1.18328, -1.023393, -2.54806, 1, 0.7098039, 0, 1,
-1.180837, -0.2355263, -0.8659993, 1, 0.7137255, 0, 1,
-1.174268, 0.3595883, 0.02065214, 1, 0.7215686, 0, 1,
-1.17036, 0.5245262, -0.6039296, 1, 0.7254902, 0, 1,
-1.167449, 0.4975918, -3.125005, 1, 0.7333333, 0, 1,
-1.167072, -1.75405, -3.314881, 1, 0.7372549, 0, 1,
-1.161496, 1.112467, 0.1695195, 1, 0.7450981, 0, 1,
-1.161141, 1.033423, 0.856757, 1, 0.7490196, 0, 1,
-1.158002, 0.2656539, -0.7088717, 1, 0.7568628, 0, 1,
-1.156535, -1.196876, -1.774157, 1, 0.7607843, 0, 1,
-1.152325, -0.6030877, -1.807955, 1, 0.7686275, 0, 1,
-1.147228, -0.03302762, -1.54589, 1, 0.772549, 0, 1,
-1.143033, 0.1380682, -1.895008, 1, 0.7803922, 0, 1,
-1.125704, 1.561225, -1.413346, 1, 0.7843137, 0, 1,
-1.107315, 1.46918, -1.291085, 1, 0.7921569, 0, 1,
-1.106964, -1.629305, -2.686862, 1, 0.7960784, 0, 1,
-1.105933, -0.05905373, -2.123441, 1, 0.8039216, 0, 1,
-1.083547, -0.8358618, -1.76894, 1, 0.8117647, 0, 1,
-1.075492, 0.7786919, -0.838858, 1, 0.8156863, 0, 1,
-1.071643, -1.486091, -2.554505, 1, 0.8235294, 0, 1,
-1.071033, 0.8038173, 0.4281918, 1, 0.827451, 0, 1,
-1.064707, -0.02289964, -2.542871, 1, 0.8352941, 0, 1,
-1.060936, 0.03089238, -3.334241, 1, 0.8392157, 0, 1,
-1.058561, -1.796304, -1.642003, 1, 0.8470588, 0, 1,
-1.058437, 0.4330799, -1.505147, 1, 0.8509804, 0, 1,
-1.057976, -0.2551712, -0.36183, 1, 0.8588235, 0, 1,
-1.054477, 0.217257, -2.974125, 1, 0.8627451, 0, 1,
-1.047458, -1.146572, -1.668664, 1, 0.8705882, 0, 1,
-1.047446, -2.146843, -1.735028, 1, 0.8745098, 0, 1,
-1.042148, -0.1605646, -2.005608, 1, 0.8823529, 0, 1,
-1.037735, 0.5639046, -0.04967921, 1, 0.8862745, 0, 1,
-1.037516, -0.5133039, -1.061718, 1, 0.8941177, 0, 1,
-1.036122, 0.4059359, -0.9058994, 1, 0.8980392, 0, 1,
-1.033774, 1.777163, 0.7707831, 1, 0.9058824, 0, 1,
-1.02502, 0.5746068, -0.1433905, 1, 0.9137255, 0, 1,
-1.01938, -0.6902426, -3.658165, 1, 0.9176471, 0, 1,
-1.013914, -1.048538, -2.565271, 1, 0.9254902, 0, 1,
-1.013543, -0.1811734, -1.453308, 1, 0.9294118, 0, 1,
-1.013106, -0.8502261, -3.427217, 1, 0.9372549, 0, 1,
-1.012739, -0.5651757, -1.900328, 1, 0.9411765, 0, 1,
-1.011961, -0.7850529, -0.1919537, 1, 0.9490196, 0, 1,
-1.01129, -0.7240262, -2.250757, 1, 0.9529412, 0, 1,
-1.009322, 1.236211, -1.019053, 1, 0.9607843, 0, 1,
-1.006503, -0.890386, -3.1847, 1, 0.9647059, 0, 1,
-1.00204, 0.7889389, -0.9763306, 1, 0.972549, 0, 1,
-0.9833869, -1.299716, -2.851245, 1, 0.9764706, 0, 1,
-0.9791873, 1.238783, -0.7463088, 1, 0.9843137, 0, 1,
-0.9780489, -1.96617, -4.387355, 1, 0.9882353, 0, 1,
-0.9694959, -0.983942, -4.605319, 1, 0.9960784, 0, 1,
-0.9688641, -2.42585, -2.039422, 0.9960784, 1, 0, 1,
-0.9565674, 0.286047, -1.82864, 0.9921569, 1, 0, 1,
-0.9541149, 0.7704258, -0.8287715, 0.9843137, 1, 0, 1,
-0.9535648, -0.08113024, 0.07398498, 0.9803922, 1, 0, 1,
-0.9532768, 0.6679695, -1.00855, 0.972549, 1, 0, 1,
-0.9497944, -0.6440315, -3.160557, 0.9686275, 1, 0, 1,
-0.9469981, -0.7522889, -1.67576, 0.9607843, 1, 0, 1,
-0.9407011, 0.6686847, -2.103415, 0.9568627, 1, 0, 1,
-0.9376422, 0.07962904, -2.300865, 0.9490196, 1, 0, 1,
-0.9285579, -0.3949704, -1.445526, 0.945098, 1, 0, 1,
-0.9256241, -1.248916, -3.416301, 0.9372549, 1, 0, 1,
-0.924361, 1.413136, -0.4512077, 0.9333333, 1, 0, 1,
-0.9154929, 0.1885458, 0.6430454, 0.9254902, 1, 0, 1,
-0.9114338, -2.195894, -5.128554, 0.9215686, 1, 0, 1,
-0.9106401, -1.287518, -0.4471203, 0.9137255, 1, 0, 1,
-0.9102208, -0.2421268, -3.208036, 0.9098039, 1, 0, 1,
-0.90856, -0.739006, -2.610052, 0.9019608, 1, 0, 1,
-0.908052, 1.78592, -0.1366926, 0.8941177, 1, 0, 1,
-0.9071781, 1.07787, -1.735679, 0.8901961, 1, 0, 1,
-0.9069574, 0.8625264, -1.828531, 0.8823529, 1, 0, 1,
-0.9057084, 1.024032, -1.91158, 0.8784314, 1, 0, 1,
-0.9019095, -0.9571885, -3.71662, 0.8705882, 1, 0, 1,
-0.9003611, -1.402218, -2.118616, 0.8666667, 1, 0, 1,
-0.8811004, -0.9201883, -1.777629, 0.8588235, 1, 0, 1,
-0.8782383, -0.5303578, -1.971098, 0.854902, 1, 0, 1,
-0.8753389, -1.581599, -1.64356, 0.8470588, 1, 0, 1,
-0.8741224, -0.4124514, -1.546944, 0.8431373, 1, 0, 1,
-0.8733106, -1.20125, -4.141081, 0.8352941, 1, 0, 1,
-0.8682913, 1.844672, -0.2786798, 0.8313726, 1, 0, 1,
-0.8679712, -0.4831791, -0.8990183, 0.8235294, 1, 0, 1,
-0.8677747, -0.8382708, -1.386894, 0.8196079, 1, 0, 1,
-0.8626701, -0.05122939, -2.207787, 0.8117647, 1, 0, 1,
-0.859847, -1.404293, -1.772511, 0.8078431, 1, 0, 1,
-0.8588739, 1.766581, -1.93629, 0.8, 1, 0, 1,
-0.8496661, 0.9092864, -1.216673, 0.7921569, 1, 0, 1,
-0.8442796, 1.079897, -1.669485, 0.7882353, 1, 0, 1,
-0.8401092, -0.5577554, -1.919448, 0.7803922, 1, 0, 1,
-0.8288342, -0.9580702, -3.724797, 0.7764706, 1, 0, 1,
-0.8288335, -0.3867729, -2.561757, 0.7686275, 1, 0, 1,
-0.8286767, 0.2623382, -0.4797454, 0.7647059, 1, 0, 1,
-0.8275399, 1.509333, -0.01775509, 0.7568628, 1, 0, 1,
-0.8231714, -1.539101, -1.259987, 0.7529412, 1, 0, 1,
-0.8229046, -0.5022652, -1.05236, 0.7450981, 1, 0, 1,
-0.8119892, 1.025468, -0.4224898, 0.7411765, 1, 0, 1,
-0.8108268, -0.300644, -2.095433, 0.7333333, 1, 0, 1,
-0.8077136, -0.6625334, -3.085741, 0.7294118, 1, 0, 1,
-0.8054472, 0.2452721, -1.942337, 0.7215686, 1, 0, 1,
-0.7998224, 0.6427307, -0.9153447, 0.7176471, 1, 0, 1,
-0.79838, 2.31279, -0.6745099, 0.7098039, 1, 0, 1,
-0.7928561, 0.4221462, -0.5415506, 0.7058824, 1, 0, 1,
-0.7855459, -1.988672, -2.893925, 0.6980392, 1, 0, 1,
-0.7671009, -0.4862942, -1.634351, 0.6901961, 1, 0, 1,
-0.7636421, 0.4088456, -1.43463, 0.6862745, 1, 0, 1,
-0.7590318, 1.134842, -2.028226, 0.6784314, 1, 0, 1,
-0.7575457, -0.4129551, -1.991354, 0.6745098, 1, 0, 1,
-0.7562472, 0.1600678, -1.198985, 0.6666667, 1, 0, 1,
-0.7557108, -0.4346491, -1.442929, 0.6627451, 1, 0, 1,
-0.7556127, -0.1479355, -2.288905, 0.654902, 1, 0, 1,
-0.7497775, 0.1628753, -1.192651, 0.6509804, 1, 0, 1,
-0.7456985, -0.3316849, -2.054493, 0.6431373, 1, 0, 1,
-0.7431778, -0.1048886, -1.652746, 0.6392157, 1, 0, 1,
-0.7373922, 1.76439, -0.1603544, 0.6313726, 1, 0, 1,
-0.7369493, -0.570573, -2.264303, 0.627451, 1, 0, 1,
-0.7353342, 2.126484, 1.82973, 0.6196079, 1, 0, 1,
-0.7304349, -0.505941, -2.087515, 0.6156863, 1, 0, 1,
-0.7297952, 0.3661432, -1.917574, 0.6078432, 1, 0, 1,
-0.7294948, 0.7442552, 0.1115198, 0.6039216, 1, 0, 1,
-0.7243792, 0.7902824, 0.07708696, 0.5960785, 1, 0, 1,
-0.7083213, 1.014478, 0.6077049, 0.5882353, 1, 0, 1,
-0.7079645, -0.4486788, -1.071029, 0.5843138, 1, 0, 1,
-0.7077593, 2.040814, 0.1108084, 0.5764706, 1, 0, 1,
-0.7024906, -3.061849, -2.480997, 0.572549, 1, 0, 1,
-0.7022729, -0.1451476, -1.287241, 0.5647059, 1, 0, 1,
-0.7009512, -0.238218, -2.731293, 0.5607843, 1, 0, 1,
-0.6936443, 0.1499941, -2.511832, 0.5529412, 1, 0, 1,
-0.6865895, -2.21386, -3.981236, 0.5490196, 1, 0, 1,
-0.6861172, 0.3841814, 0.9274626, 0.5411765, 1, 0, 1,
-0.6824616, 0.9385266, 0.6473184, 0.5372549, 1, 0, 1,
-0.6807327, 0.822856, -2.388356, 0.5294118, 1, 0, 1,
-0.6786169, -0.7954584, -1.99424, 0.5254902, 1, 0, 1,
-0.6780638, 1.678504, -0.2949805, 0.5176471, 1, 0, 1,
-0.6693847, -0.05336558, -1.640358, 0.5137255, 1, 0, 1,
-0.6678119, -0.2546753, -2.955774, 0.5058824, 1, 0, 1,
-0.6613298, 1.805401, 1.08407, 0.5019608, 1, 0, 1,
-0.6600336, -0.03882499, -1.100965, 0.4941176, 1, 0, 1,
-0.6498784, -0.8159343, -0.3342098, 0.4862745, 1, 0, 1,
-0.6469334, -0.9253809, -3.864803, 0.4823529, 1, 0, 1,
-0.6468636, -1.390607, -1.875312, 0.4745098, 1, 0, 1,
-0.643918, -0.4702939, -3.094485, 0.4705882, 1, 0, 1,
-0.6431628, 1.218717, -0.04069605, 0.4627451, 1, 0, 1,
-0.6387985, 0.2190277, -1.378288, 0.4588235, 1, 0, 1,
-0.6325979, 0.7829781, -1.152375, 0.4509804, 1, 0, 1,
-0.6322114, 0.5722973, -1.040116, 0.4470588, 1, 0, 1,
-0.628507, 0.1305414, -1.466694, 0.4392157, 1, 0, 1,
-0.6274136, -0.3304052, -0.9165707, 0.4352941, 1, 0, 1,
-0.6266208, -0.4439799, -0.07016461, 0.427451, 1, 0, 1,
-0.6218013, 0.8258989, -2.555497, 0.4235294, 1, 0, 1,
-0.6174546, 0.1501891, -1.529968, 0.4156863, 1, 0, 1,
-0.613153, -0.3481317, -3.459164, 0.4117647, 1, 0, 1,
-0.6116105, -0.8972341, -2.395431, 0.4039216, 1, 0, 1,
-0.6114242, 0.8031719, -0.7567724, 0.3960784, 1, 0, 1,
-0.6091436, -0.4288571, -1.78146, 0.3921569, 1, 0, 1,
-0.6081678, -0.2818647, -1.859504, 0.3843137, 1, 0, 1,
-0.6075041, -0.9813894, -1.566195, 0.3803922, 1, 0, 1,
-0.5961474, -0.03614929, -2.728221, 0.372549, 1, 0, 1,
-0.5925993, -0.7194447, -2.857997, 0.3686275, 1, 0, 1,
-0.5920062, 0.05016673, 0.04309909, 0.3607843, 1, 0, 1,
-0.589675, 0.3935574, -1.261828, 0.3568628, 1, 0, 1,
-0.5848622, 0.03124445, -0.5489122, 0.3490196, 1, 0, 1,
-0.5813955, -1.060562, -4.167141, 0.345098, 1, 0, 1,
-0.5803355, 0.6031525, -2.615146, 0.3372549, 1, 0, 1,
-0.5800719, 0.3089639, -0.8063102, 0.3333333, 1, 0, 1,
-0.5731598, -0.5032824, -1.319258, 0.3254902, 1, 0, 1,
-0.5719745, -1.073301, -4.473443, 0.3215686, 1, 0, 1,
-0.5691807, -0.09524713, -4.051557, 0.3137255, 1, 0, 1,
-0.5669939, -0.743071, -1.862933, 0.3098039, 1, 0, 1,
-0.5659707, -0.8105882, -2.990729, 0.3019608, 1, 0, 1,
-0.5655581, -1.277989, -2.418393, 0.2941177, 1, 0, 1,
-0.5622925, 0.6095455, 0.05274312, 0.2901961, 1, 0, 1,
-0.5610483, -0.06609386, -2.203756, 0.282353, 1, 0, 1,
-0.5536022, 0.2158408, -1.016048, 0.2784314, 1, 0, 1,
-0.5498788, 0.9941595, -0.7413663, 0.2705882, 1, 0, 1,
-0.5450072, 0.1809614, -2.571553, 0.2666667, 1, 0, 1,
-0.5441558, -0.3355576, -2.476601, 0.2588235, 1, 0, 1,
-0.5401371, 0.9225041, -1.089856, 0.254902, 1, 0, 1,
-0.5338217, 1.022196, 0.1390069, 0.2470588, 1, 0, 1,
-0.5291403, -0.2159335, -2.188048, 0.2431373, 1, 0, 1,
-0.5285154, 0.009035304, -2.093287, 0.2352941, 1, 0, 1,
-0.5168991, 1.468198, -1.054029, 0.2313726, 1, 0, 1,
-0.5162835, -0.6463296, -2.906022, 0.2235294, 1, 0, 1,
-0.5151228, -1.202822, -1.670593, 0.2196078, 1, 0, 1,
-0.5141645, 0.940124, -0.2841348, 0.2117647, 1, 0, 1,
-0.5126284, -0.6940011, -1.764094, 0.2078431, 1, 0, 1,
-0.5104116, 1.300631, -0.1329903, 0.2, 1, 0, 1,
-0.5088214, 0.6196293, -0.4170574, 0.1921569, 1, 0, 1,
-0.5072734, 0.6156564, -1.414523, 0.1882353, 1, 0, 1,
-0.505276, -0.7414779, -2.694039, 0.1803922, 1, 0, 1,
-0.5006152, -0.7031896, -1.087533, 0.1764706, 1, 0, 1,
-0.4961064, -0.1439295, -2.125574, 0.1686275, 1, 0, 1,
-0.4941329, -0.3625427, -2.296675, 0.1647059, 1, 0, 1,
-0.4864993, -0.08525296, -0.2311363, 0.1568628, 1, 0, 1,
-0.4803912, -0.1187863, -3.762861, 0.1529412, 1, 0, 1,
-0.4797233, -0.2199436, -2.395254, 0.145098, 1, 0, 1,
-0.4739937, -0.6283233, -1.592315, 0.1411765, 1, 0, 1,
-0.4717237, -0.54985, -1.412754, 0.1333333, 1, 0, 1,
-0.466063, 0.543965, -2.483263, 0.1294118, 1, 0, 1,
-0.4659887, 2.313227, 1.377767, 0.1215686, 1, 0, 1,
-0.4635035, -1.69555, -1.94804, 0.1176471, 1, 0, 1,
-0.4586181, 0.1743397, -0.7475007, 0.1098039, 1, 0, 1,
-0.4561445, 0.5504119, -0.4574885, 0.1058824, 1, 0, 1,
-0.4552192, 0.7662037, -0.2241547, 0.09803922, 1, 0, 1,
-0.4544583, -0.7285168, -2.053999, 0.09019608, 1, 0, 1,
-0.4528465, 1.047607, 1.045257, 0.08627451, 1, 0, 1,
-0.4512852, 1.723655, -1.341335, 0.07843138, 1, 0, 1,
-0.4506763, 0.522864, -2.412449, 0.07450981, 1, 0, 1,
-0.4480467, -0.4478785, -4.263813, 0.06666667, 1, 0, 1,
-0.4477703, -0.2343261, -2.050535, 0.0627451, 1, 0, 1,
-0.4441675, 1.324336, -0.5391169, 0.05490196, 1, 0, 1,
-0.4354744, 0.7895405, -1.331645, 0.05098039, 1, 0, 1,
-0.4344778, 0.6755784, -1.704586, 0.04313726, 1, 0, 1,
-0.4275406, -0.05578677, -1.372499, 0.03921569, 1, 0, 1,
-0.4212669, -0.4038026, -2.413168, 0.03137255, 1, 0, 1,
-0.4180011, -0.5007119, -2.180188, 0.02745098, 1, 0, 1,
-0.4154023, 0.6392927, -0.7568393, 0.01960784, 1, 0, 1,
-0.4132915, -0.9368067, -2.290614, 0.01568628, 1, 0, 1,
-0.4113593, -0.1608917, -1.623961, 0.007843138, 1, 0, 1,
-0.4087798, 0.9179599, 0.1697465, 0.003921569, 1, 0, 1,
-0.4061424, -0.3907573, -1.097969, 0, 1, 0.003921569, 1,
-0.4051171, -0.6347104, -2.332276, 0, 1, 0.01176471, 1,
-0.3880458, 1.229341, -1.472007, 0, 1, 0.01568628, 1,
-0.3848086, -1.387029, -2.743696, 0, 1, 0.02352941, 1,
-0.3842528, 0.9175076, -0.7330515, 0, 1, 0.02745098, 1,
-0.3827735, 1.513191, -1.234361, 0, 1, 0.03529412, 1,
-0.3825556, 0.993337, -0.2780614, 0, 1, 0.03921569, 1,
-0.3786021, -0.938029, -3.707782, 0, 1, 0.04705882, 1,
-0.3773223, -0.8817632, -2.879262, 0, 1, 0.05098039, 1,
-0.3771179, 0.4215823, 0.02979426, 0, 1, 0.05882353, 1,
-0.3756339, -1.571445, -2.67392, 0, 1, 0.0627451, 1,
-0.3732293, 0.06222666, -2.422837, 0, 1, 0.07058824, 1,
-0.3708047, 0.8890494, -0.02342471, 0, 1, 0.07450981, 1,
-0.3696917, -2.202392, -3.41731, 0, 1, 0.08235294, 1,
-0.3647867, 1.473274, 0.6826975, 0, 1, 0.08627451, 1,
-0.3636961, 0.1899713, 1.027119, 0, 1, 0.09411765, 1,
-0.3628602, -1.301993, -1.814554, 0, 1, 0.1019608, 1,
-0.3627287, 1.229306, -0.2738974, 0, 1, 0.1058824, 1,
-0.3627208, 0.0643146, -1.143906, 0, 1, 0.1137255, 1,
-0.3613569, 0.4582947, -0.8923081, 0, 1, 0.1176471, 1,
-0.3548372, -0.2976483, -2.321949, 0, 1, 0.1254902, 1,
-0.3493161, -0.1188522, -2.704059, 0, 1, 0.1294118, 1,
-0.3479094, 1.033199, -0.9908139, 0, 1, 0.1372549, 1,
-0.3416568, 1.149401, -0.5486183, 0, 1, 0.1411765, 1,
-0.3411976, -2.377411, -1.035435, 0, 1, 0.1490196, 1,
-0.3396414, 0.5309945, 0.6294336, 0, 1, 0.1529412, 1,
-0.3358407, 0.4284816, -2.303396, 0, 1, 0.1607843, 1,
-0.3321546, 0.8928957, -0.04047499, 0, 1, 0.1647059, 1,
-0.3307684, -0.4139898, -2.826967, 0, 1, 0.172549, 1,
-0.3272602, 0.7532984, -0.05890698, 0, 1, 0.1764706, 1,
-0.3215219, -2.017272, -2.367448, 0, 1, 0.1843137, 1,
-0.3205862, 0.3560167, -1.078771, 0, 1, 0.1882353, 1,
-0.3205596, 0.8862587, 0.2291531, 0, 1, 0.1960784, 1,
-0.3194366, -0.1688368, -2.899475, 0, 1, 0.2039216, 1,
-0.3193029, -0.4915135, -2.938535, 0, 1, 0.2078431, 1,
-0.3186651, 1.811798, 0.5249218, 0, 1, 0.2156863, 1,
-0.3174807, -0.9930969, -3.314039, 0, 1, 0.2196078, 1,
-0.3174325, -0.4201045, -2.263774, 0, 1, 0.227451, 1,
-0.3087148, 0.1215913, -0.6238189, 0, 1, 0.2313726, 1,
-0.2991397, -0.1305198, -3.72872, 0, 1, 0.2392157, 1,
-0.2987666, -1.361126, -2.275666, 0, 1, 0.2431373, 1,
-0.2903392, 0.6772461, -0.9047312, 0, 1, 0.2509804, 1,
-0.2879234, -0.1084289, -0.7966782, 0, 1, 0.254902, 1,
-0.286506, 0.4510969, 0.390601, 0, 1, 0.2627451, 1,
-0.286369, 0.1762188, -1.079701, 0, 1, 0.2666667, 1,
-0.2825302, -0.2569123, -3.269894, 0, 1, 0.2745098, 1,
-0.281249, -0.6022345, -1.117399, 0, 1, 0.2784314, 1,
-0.2787146, -1.33854, -3.658151, 0, 1, 0.2862745, 1,
-0.2743917, -0.2781745, -2.757545, 0, 1, 0.2901961, 1,
-0.2691667, -0.1535605, -3.332696, 0, 1, 0.2980392, 1,
-0.2642388, 0.02070595, -3.106912, 0, 1, 0.3058824, 1,
-0.2628716, 0.2148414, -0.5731708, 0, 1, 0.3098039, 1,
-0.2609852, 1.241415, -1.303168, 0, 1, 0.3176471, 1,
-0.2607855, 1.309582, -1.159792, 0, 1, 0.3215686, 1,
-0.2599925, -0.489484, -2.991776, 0, 1, 0.3294118, 1,
-0.2594022, 1.873802, 0.3229714, 0, 1, 0.3333333, 1,
-0.2586316, -3.240979, -3.344702, 0, 1, 0.3411765, 1,
-0.2509142, 0.3039058, -1.908262, 0, 1, 0.345098, 1,
-0.2498435, 1.397086, 0.2066377, 0, 1, 0.3529412, 1,
-0.2493177, 0.5397208, -1.784674, 0, 1, 0.3568628, 1,
-0.2462006, -0.430022, -1.815191, 0, 1, 0.3647059, 1,
-0.2416053, -0.2095313, -3.968472, 0, 1, 0.3686275, 1,
-0.238406, 1.211543, -0.5700626, 0, 1, 0.3764706, 1,
-0.2358111, 1.440761, 0.4946686, 0, 1, 0.3803922, 1,
-0.2355984, -0.3268968, -1.874681, 0, 1, 0.3882353, 1,
-0.2354348, -0.4460741, -0.8601351, 0, 1, 0.3921569, 1,
-0.2342131, 0.4862013, -1.336856, 0, 1, 0.4, 1,
-0.2340792, -1.377356, -2.694206, 0, 1, 0.4078431, 1,
-0.2306204, 0.8448398, -0.6600987, 0, 1, 0.4117647, 1,
-0.2293952, 1.623697, -1.079862, 0, 1, 0.4196078, 1,
-0.2281148, -0.07274921, -3.751961, 0, 1, 0.4235294, 1,
-0.2267849, -2.314468, -3.103565, 0, 1, 0.4313726, 1,
-0.2267422, -0.6795447, -2.126727, 0, 1, 0.4352941, 1,
-0.2228919, 1.117591, 0.1985824, 0, 1, 0.4431373, 1,
-0.2197508, 1.198864, -0.1745057, 0, 1, 0.4470588, 1,
-0.2163605, -1.047045, -2.569191, 0, 1, 0.454902, 1,
-0.2052326, 0.565139, 2.167743, 0, 1, 0.4588235, 1,
-0.2008228, -0.6958109, -3.178869, 0, 1, 0.4666667, 1,
-0.1990765, 1.132859, -0.1953272, 0, 1, 0.4705882, 1,
-0.1985439, -0.3469582, -1.124647, 0, 1, 0.4784314, 1,
-0.197909, 0.4805891, -0.336805, 0, 1, 0.4823529, 1,
-0.1938189, -1.634545, -3.617079, 0, 1, 0.4901961, 1,
-0.19165, 0.9256931, -2.821716, 0, 1, 0.4941176, 1,
-0.1914661, -1.48494, -2.471805, 0, 1, 0.5019608, 1,
-0.1903344, -0.6035418, -2.131219, 0, 1, 0.509804, 1,
-0.1868793, -0.2187392, -2.366421, 0, 1, 0.5137255, 1,
-0.1868191, -1.771388, -2.606525, 0, 1, 0.5215687, 1,
-0.1810039, -1.262154, -4.61713, 0, 1, 0.5254902, 1,
-0.1790717, 0.9332557, 0.5624033, 0, 1, 0.5333334, 1,
-0.1787284, 0.3740732, -0.5060939, 0, 1, 0.5372549, 1,
-0.1777835, -0.2951521, -3.942202, 0, 1, 0.5450981, 1,
-0.1738884, -2.986451, -3.289952, 0, 1, 0.5490196, 1,
-0.1727054, -2.046639, -2.435807, 0, 1, 0.5568628, 1,
-0.170832, 1.079035, -1.304854, 0, 1, 0.5607843, 1,
-0.1675764, 1.116039, -1.684726, 0, 1, 0.5686275, 1,
-0.1662943, -0.7731909, -1.08374, 0, 1, 0.572549, 1,
-0.1655313, -1.789458, -3.727078, 0, 1, 0.5803922, 1,
-0.1627076, 0.05376013, -2.013047, 0, 1, 0.5843138, 1,
-0.1620666, -0.9699669, -3.670512, 0, 1, 0.5921569, 1,
-0.1608455, 0.5487384, -0.4100429, 0, 1, 0.5960785, 1,
-0.1577151, -0.7423574, -2.212549, 0, 1, 0.6039216, 1,
-0.1521075, 0.3237641, -0.6958457, 0, 1, 0.6117647, 1,
-0.1450449, 0.1393729, -0.4224025, 0, 1, 0.6156863, 1,
-0.1410594, -0.4822901, -1.979709, 0, 1, 0.6235294, 1,
-0.1372708, -0.5216988, -1.564951, 0, 1, 0.627451, 1,
-0.1371985, -0.0553883, -1.611703, 0, 1, 0.6352941, 1,
-0.1365352, -1.062646, -1.168808, 0, 1, 0.6392157, 1,
-0.1352659, 0.3672637, -0.3146988, 0, 1, 0.6470588, 1,
-0.1333846, 0.6575832, 0.005596691, 0, 1, 0.6509804, 1,
-0.1326126, -0.5667994, -3.749144, 0, 1, 0.6588235, 1,
-0.129527, 0.00014677, -0.8613777, 0, 1, 0.6627451, 1,
-0.1284567, 0.1908978, -1.412105, 0, 1, 0.6705883, 1,
-0.1208127, 0.1087038, -0.5099804, 0, 1, 0.6745098, 1,
-0.1205378, -0.5827665, -3.971817, 0, 1, 0.682353, 1,
-0.1196952, -1.914281, -3.976345, 0, 1, 0.6862745, 1,
-0.1132253, 0.9313058, -0.5323593, 0, 1, 0.6941177, 1,
-0.1129375, -0.7438333, -2.548692, 0, 1, 0.7019608, 1,
-0.1120908, -0.08295657, -0.5859637, 0, 1, 0.7058824, 1,
-0.110521, 1.77918, 0.13678, 0, 1, 0.7137255, 1,
-0.1076391, -0.1487937, -2.975398, 0, 1, 0.7176471, 1,
-0.1067858, 1.562687, -1.613017, 0, 1, 0.7254902, 1,
-0.1055594, -0.04814612, -2.699109, 0, 1, 0.7294118, 1,
-0.1049322, -0.1895432, -3.310321, 0, 1, 0.7372549, 1,
-0.1048718, -0.3098516, -3.421221, 0, 1, 0.7411765, 1,
-0.1034801, -0.5091305, -2.175992, 0, 1, 0.7490196, 1,
-0.09520562, 0.3921611, 1.223273, 0, 1, 0.7529412, 1,
-0.09343991, -0.9890533, -2.811109, 0, 1, 0.7607843, 1,
-0.09156922, -1.527116, -2.657805, 0, 1, 0.7647059, 1,
-0.08165734, 0.3083589, -0.9780966, 0, 1, 0.772549, 1,
-0.07755945, 1.180079, 0.09401136, 0, 1, 0.7764706, 1,
-0.07648115, -0.4349566, -4.160357, 0, 1, 0.7843137, 1,
-0.07532396, 0.3333005, 0.8523802, 0, 1, 0.7882353, 1,
-0.07458195, -0.3988381, -3.223066, 0, 1, 0.7960784, 1,
-0.07057469, 1.569426, -1.1023, 0, 1, 0.8039216, 1,
-0.0694964, 2.252162, -1.093481, 0, 1, 0.8078431, 1,
-0.06934652, 0.08907007, -2.036268, 0, 1, 0.8156863, 1,
-0.06856535, 0.4751175, -0.6282765, 0, 1, 0.8196079, 1,
-0.06101315, 0.9119096, -0.1967554, 0, 1, 0.827451, 1,
-0.05559205, -0.07025912, -2.026398, 0, 1, 0.8313726, 1,
-0.04420283, -0.1703498, -4.879856, 0, 1, 0.8392157, 1,
-0.04217616, 1.492574, 0.05658025, 0, 1, 0.8431373, 1,
-0.03252843, -1.244579, -2.653595, 0, 1, 0.8509804, 1,
-0.0307326, -1.455943, -3.950518, 0, 1, 0.854902, 1,
-0.02988526, -0.3381068, -4.463829, 0, 1, 0.8627451, 1,
-0.0278036, 0.8173256, -0.4911452, 0, 1, 0.8666667, 1,
-0.02655867, 0.3733759, 0.6878896, 0, 1, 0.8745098, 1,
-0.01928995, 0.02504191, 1.315918, 0, 1, 0.8784314, 1,
-0.0169925, 1.461744, 1.67059, 0, 1, 0.8862745, 1,
-0.01580064, 1.707228, -0.4147389, 0, 1, 0.8901961, 1,
-0.0119725, -0.1955652, -3.348003, 0, 1, 0.8980392, 1,
-0.01109629, 0.1397958, -1.072729, 0, 1, 0.9058824, 1,
-0.00949906, 0.4227085, 0.2964177, 0, 1, 0.9098039, 1,
-0.002550327, -1.284659, -4.148326, 0, 1, 0.9176471, 1,
-0.002164805, 1.033214, -1.507731, 0, 1, 0.9215686, 1,
-0.001643751, 0.8213912, -0.213552, 0, 1, 0.9294118, 1,
0.002723819, -0.3074935, 2.813464, 0, 1, 0.9333333, 1,
0.003113381, -2.110796, 2.159113, 0, 1, 0.9411765, 1,
0.005596574, 0.03021512, 0.8019464, 0, 1, 0.945098, 1,
0.008526524, 0.06152929, 0.5572147, 0, 1, 0.9529412, 1,
0.01640047, 0.1916573, 3.456667, 0, 1, 0.9568627, 1,
0.0172522, -0.1232777, 1.27844, 0, 1, 0.9647059, 1,
0.01726813, 1.421061, 0.9105938, 0, 1, 0.9686275, 1,
0.01852157, 1.116768, -0.8473854, 0, 1, 0.9764706, 1,
0.02049433, 0.07792036, 0.5772262, 0, 1, 0.9803922, 1,
0.02869845, -1.100343, 4.002964, 0, 1, 0.9882353, 1,
0.0288466, -1.617793, 2.629988, 0, 1, 0.9921569, 1,
0.02891927, -0.8916302, 3.85499, 0, 1, 1, 1,
0.02998463, 0.3954104, 0.7793085, 0, 0.9921569, 1, 1,
0.03366448, 1.979005, 0.3809096, 0, 0.9882353, 1, 1,
0.03566669, -2.280629, 2.98778, 0, 0.9803922, 1, 1,
0.03640946, -1.796678, 4.335453, 0, 0.9764706, 1, 1,
0.03909262, 0.1583673, 0.09430184, 0, 0.9686275, 1, 1,
0.04165732, -0.9223228, 2.830362, 0, 0.9647059, 1, 1,
0.04263965, -0.3658158, 2.011366, 0, 0.9568627, 1, 1,
0.04743795, -1.95137, 3.718278, 0, 0.9529412, 1, 1,
0.04832991, 1.656289, 1.124583, 0, 0.945098, 1, 1,
0.05071021, -1.769184, 1.5902, 0, 0.9411765, 1, 1,
0.05186673, 2.579719, 0.1417903, 0, 0.9333333, 1, 1,
0.0548522, -1.414303, 3.753006, 0, 0.9294118, 1, 1,
0.05548565, 0.533, -0.4285195, 0, 0.9215686, 1, 1,
0.05904527, -0.4461524, 2.090197, 0, 0.9176471, 1, 1,
0.06448595, 1.070609, -1.051703, 0, 0.9098039, 1, 1,
0.06535386, 0.4328492, 0.2191702, 0, 0.9058824, 1, 1,
0.06846011, 1.257054, 0.5119595, 0, 0.8980392, 1, 1,
0.07217195, -0.4468498, 3.322816, 0, 0.8901961, 1, 1,
0.08261961, -2.079418, 3.495393, 0, 0.8862745, 1, 1,
0.08294644, -1.120895, 3.753456, 0, 0.8784314, 1, 1,
0.08612709, -1.33138, 5.512744, 0, 0.8745098, 1, 1,
0.08624852, -0.1417757, 2.338341, 0, 0.8666667, 1, 1,
0.08710343, 1.218115, -0.2774467, 0, 0.8627451, 1, 1,
0.09286365, -0.8016808, 4.445587, 0, 0.854902, 1, 1,
0.0933579, 0.5086398, 1.361814, 0, 0.8509804, 1, 1,
0.09398333, -2.201471, 2.648473, 0, 0.8431373, 1, 1,
0.09401466, 1.167638, 0.6070472, 0, 0.8392157, 1, 1,
0.09795306, 2.663779, -0.9747059, 0, 0.8313726, 1, 1,
0.09836328, 0.01232511, 0.5975134, 0, 0.827451, 1, 1,
0.09891608, 0.7497671, -0.1763766, 0, 0.8196079, 1, 1,
0.1021011, -0.8431917, 3.726537, 0, 0.8156863, 1, 1,
0.1037318, 0.6553573, 1.058608, 0, 0.8078431, 1, 1,
0.1048349, -0.6734459, 2.445346, 0, 0.8039216, 1, 1,
0.1062895, -0.9445451, 2.868147, 0, 0.7960784, 1, 1,
0.1156436, -1.434739, 2.652609, 0, 0.7882353, 1, 1,
0.1232506, 0.1432869, 0.09721102, 0, 0.7843137, 1, 1,
0.1278607, 0.3925321, -1.12836, 0, 0.7764706, 1, 1,
0.1326056, -0.8885431, 3.777862, 0, 0.772549, 1, 1,
0.1370587, 1.531115, 1.839946, 0, 0.7647059, 1, 1,
0.1401355, 2.285255, -0.2525539, 0, 0.7607843, 1, 1,
0.1401743, -0.5071793, 1.910895, 0, 0.7529412, 1, 1,
0.1403896, 0.7242428, 1.949494, 0, 0.7490196, 1, 1,
0.1408327, 0.5524669, 1.498832, 0, 0.7411765, 1, 1,
0.1418181, 0.5068977, -1.070157, 0, 0.7372549, 1, 1,
0.1441707, 0.4249222, 0.9494839, 0, 0.7294118, 1, 1,
0.1451892, -0.2647292, 2.999672, 0, 0.7254902, 1, 1,
0.149293, 0.6711109, 0.5871324, 0, 0.7176471, 1, 1,
0.1518727, -0.5596963, 1.557099, 0, 0.7137255, 1, 1,
0.1537035, -1.042231, 2.494922, 0, 0.7058824, 1, 1,
0.1548956, -0.009293625, 2.087769, 0, 0.6980392, 1, 1,
0.1554159, 0.3891577, 0.07857287, 0, 0.6941177, 1, 1,
0.1623987, 0.03655689, 3.540192, 0, 0.6862745, 1, 1,
0.1651997, -0.06508675, 3.136258, 0, 0.682353, 1, 1,
0.1708635, 0.8461213, 0.3995203, 0, 0.6745098, 1, 1,
0.1746965, -1.045696, 2.295517, 0, 0.6705883, 1, 1,
0.17805, 2.212715, 0.06364188, 0, 0.6627451, 1, 1,
0.1835106, 2.158429, -0.7254416, 0, 0.6588235, 1, 1,
0.1871718, -0.307335, 3.15206, 0, 0.6509804, 1, 1,
0.1873932, -0.7197795, 6.103771, 0, 0.6470588, 1, 1,
0.1911136, 0.01054287, 2.300046, 0, 0.6392157, 1, 1,
0.1914666, -0.05735818, 2.055954, 0, 0.6352941, 1, 1,
0.1917278, -1.324877, 2.972414, 0, 0.627451, 1, 1,
0.1958323, 1.285171, -0.9419749, 0, 0.6235294, 1, 1,
0.1958654, -1.201211, 2.892598, 0, 0.6156863, 1, 1,
0.1975011, -0.4971636, 3.30282, 0, 0.6117647, 1, 1,
0.2004206, 0.6048137, 0.5530353, 0, 0.6039216, 1, 1,
0.2004917, 1.418211, -1.123268, 0, 0.5960785, 1, 1,
0.2020158, 0.0786847, 0.7912924, 0, 0.5921569, 1, 1,
0.2020414, -1.334494, 2.848164, 0, 0.5843138, 1, 1,
0.2024601, 0.4447822, 1.307125, 0, 0.5803922, 1, 1,
0.2037973, 0.2110751, 1.958358, 0, 0.572549, 1, 1,
0.2068824, -0.1699034, 1.656003, 0, 0.5686275, 1, 1,
0.2111869, -0.9058502, 5.095968, 0, 0.5607843, 1, 1,
0.2133429, -1.291501, 3.273245, 0, 0.5568628, 1, 1,
0.2143258, 0.462935, 0.7054412, 0, 0.5490196, 1, 1,
0.2162013, 0.1038931, 0.9231876, 0, 0.5450981, 1, 1,
0.2182558, -2.465398, 3.027501, 0, 0.5372549, 1, 1,
0.2187728, -2.310315, 2.734276, 0, 0.5333334, 1, 1,
0.2224318, 0.2268005, 1.172075, 0, 0.5254902, 1, 1,
0.2224648, 1.299309, 0.2900836, 0, 0.5215687, 1, 1,
0.2230085, -1.03082, 1.565726, 0, 0.5137255, 1, 1,
0.2254075, 1.196701, -0.1829205, 0, 0.509804, 1, 1,
0.2298291, -0.01761978, 1.658679, 0, 0.5019608, 1, 1,
0.2308581, -1.061451, 3.364688, 0, 0.4941176, 1, 1,
0.2340274, 0.3766946, 0.4880331, 0, 0.4901961, 1, 1,
0.2406378, -0.6780699, 2.740045, 0, 0.4823529, 1, 1,
0.2459687, -0.8232858, 4.098968, 0, 0.4784314, 1, 1,
0.2462336, 0.4804244, 0.8721628, 0, 0.4705882, 1, 1,
0.2470193, -1.281828, 3.4473, 0, 0.4666667, 1, 1,
0.2539466, -0.520487, 4.650276, 0, 0.4588235, 1, 1,
0.257225, -2.616713, 2.76452, 0, 0.454902, 1, 1,
0.2650795, 0.7728482, -1.888653, 0, 0.4470588, 1, 1,
0.2695424, 1.517831, 1.329189, 0, 0.4431373, 1, 1,
0.2698314, -0.1638014, 1.918823, 0, 0.4352941, 1, 1,
0.2705551, 0.3274946, 0.08210055, 0, 0.4313726, 1, 1,
0.2715302, 0.4381463, 3.465358, 0, 0.4235294, 1, 1,
0.27301, 0.2827256, -0.1633014, 0, 0.4196078, 1, 1,
0.2746676, -1.185731, 3.721991, 0, 0.4117647, 1, 1,
0.2750527, 0.1066488, 2.822431, 0, 0.4078431, 1, 1,
0.277781, -1.395624, 3.554221, 0, 0.4, 1, 1,
0.28501, -1.155435, 2.942136, 0, 0.3921569, 1, 1,
0.2880493, -0.4601895, 3.746265, 0, 0.3882353, 1, 1,
0.2914442, 1.072758, -0.01618452, 0, 0.3803922, 1, 1,
0.2939234, -0.188643, 1.626794, 0, 0.3764706, 1, 1,
0.2996678, -1.225774, 2.420247, 0, 0.3686275, 1, 1,
0.3026513, 1.107326, -0.2364698, 0, 0.3647059, 1, 1,
0.3038694, -0.7228757, 2.081697, 0, 0.3568628, 1, 1,
0.3109871, -1.930357, 2.587518, 0, 0.3529412, 1, 1,
0.3122143, -0.9240043, 2.623243, 0, 0.345098, 1, 1,
0.3137913, 0.5337009, 0.4576279, 0, 0.3411765, 1, 1,
0.3158707, 1.501597, 0.7096438, 0, 0.3333333, 1, 1,
0.3160387, -0.0848178, 1.41928, 0, 0.3294118, 1, 1,
0.3178044, -0.5394307, 2.289428, 0, 0.3215686, 1, 1,
0.330978, 0.5754082, 0.4525058, 0, 0.3176471, 1, 1,
0.3329511, -1.74329, 1.255943, 0, 0.3098039, 1, 1,
0.3339547, -0.3503106, 0.3384193, 0, 0.3058824, 1, 1,
0.3341186, 0.476665, -0.1709278, 0, 0.2980392, 1, 1,
0.3368498, -0.2869474, 2.777595, 0, 0.2901961, 1, 1,
0.338332, 0.05890635, 0.7230698, 0, 0.2862745, 1, 1,
0.3434312, 0.1150945, 1.716646, 0, 0.2784314, 1, 1,
0.3451651, 0.8834517, -0.1013723, 0, 0.2745098, 1, 1,
0.3451897, 1.032718, -0.1090142, 0, 0.2666667, 1, 1,
0.3466141, -0.4078382, 1.268902, 0, 0.2627451, 1, 1,
0.3488759, 1.132235, 1.941931, 0, 0.254902, 1, 1,
0.3503127, -1.738146, 1.848811, 0, 0.2509804, 1, 1,
0.3507335, 0.262073, -0.1419277, 0, 0.2431373, 1, 1,
0.3525283, 0.445763, 0.2482949, 0, 0.2392157, 1, 1,
0.3577155, -0.3279837, 3.42786, 0, 0.2313726, 1, 1,
0.3608785, 0.4813137, 1.557593, 0, 0.227451, 1, 1,
0.3617357, 0.951885, 0.244184, 0, 0.2196078, 1, 1,
0.3629412, 0.005166114, 1.940647, 0, 0.2156863, 1, 1,
0.3637056, -2.337487, 2.511083, 0, 0.2078431, 1, 1,
0.3674013, 0.04406722, -0.2215161, 0, 0.2039216, 1, 1,
0.3685048, -0.2075286, 0.2153966, 0, 0.1960784, 1, 1,
0.370854, -0.6622523, 3.34347, 0, 0.1882353, 1, 1,
0.3731588, 0.1817625, 1.816037, 0, 0.1843137, 1, 1,
0.376511, 0.3130967, 1.160425, 0, 0.1764706, 1, 1,
0.3784005, -0.3358918, 4.295012, 0, 0.172549, 1, 1,
0.3785793, 1.505316, 1.786512, 0, 0.1647059, 1, 1,
0.3789431, 0.2812954, 2.655998, 0, 0.1607843, 1, 1,
0.3811119, -1.887434, 1.370606, 0, 0.1529412, 1, 1,
0.3811248, 1.454162, 0.6869792, 0, 0.1490196, 1, 1,
0.3844007, -0.395036, 2.0148, 0, 0.1411765, 1, 1,
0.3879109, -0.8812753, 1.331565, 0, 0.1372549, 1, 1,
0.3907632, -0.9574465, 2.849346, 0, 0.1294118, 1, 1,
0.3916919, 0.2945408, 0.4710716, 0, 0.1254902, 1, 1,
0.3922753, -0.7067033, 2.380239, 0, 0.1176471, 1, 1,
0.3976581, 0.3972369, 0.7374889, 0, 0.1137255, 1, 1,
0.39998, -1.250225, 2.008394, 0, 0.1058824, 1, 1,
0.4018399, 0.8092151, 1.27786, 0, 0.09803922, 1, 1,
0.4063307, 0.5803286, 0.935333, 0, 0.09411765, 1, 1,
0.4108447, -0.8388574, 3.394476, 0, 0.08627451, 1, 1,
0.4133423, -0.5089647, 2.729584, 0, 0.08235294, 1, 1,
0.4147664, 0.001693896, 0.7804882, 0, 0.07450981, 1, 1,
0.4169739, 0.1034069, 1.021831, 0, 0.07058824, 1, 1,
0.4191184, -0.4370285, 2.651306, 0, 0.0627451, 1, 1,
0.4209389, -0.04687089, 1.170982, 0, 0.05882353, 1, 1,
0.4222382, -0.5768839, 3.149382, 0, 0.05098039, 1, 1,
0.4241831, 0.5559989, 1.776122, 0, 0.04705882, 1, 1,
0.4249045, 1.408628, -0.2196485, 0, 0.03921569, 1, 1,
0.4280631, 0.9426342, -0.1940667, 0, 0.03529412, 1, 1,
0.4300089, 0.6654836, 0.4190527, 0, 0.02745098, 1, 1,
0.4316553, 0.9529217, 0.9817308, 0, 0.02352941, 1, 1,
0.4340248, 0.08916076, 1.468431, 0, 0.01568628, 1, 1,
0.439075, -0.421989, 3.248219, 0, 0.01176471, 1, 1,
0.4393537, 0.6305361, 1.188578, 0, 0.003921569, 1, 1,
0.4457515, -0.09581875, 0.9481823, 0.003921569, 0, 1, 1,
0.4485739, -0.09385923, 1.44927, 0.007843138, 0, 1, 1,
0.4486242, 2.47038, 0.5025509, 0.01568628, 0, 1, 1,
0.4497789, -0.4832253, 3.681702, 0.01960784, 0, 1, 1,
0.4544026, -0.4125716, 4.987145, 0.02745098, 0, 1, 1,
0.4568173, 0.8681867, 0.7380928, 0.03137255, 0, 1, 1,
0.4576395, 0.5791861, 1.352654, 0.03921569, 0, 1, 1,
0.4588633, -0.4198943, 3.358665, 0.04313726, 0, 1, 1,
0.4607206, 1.53581, -1.10577, 0.05098039, 0, 1, 1,
0.4644702, -0.040926, 1.885121, 0.05490196, 0, 1, 1,
0.4707121, -1.064157, 3.032223, 0.0627451, 0, 1, 1,
0.4768267, 3.085402, 0.6583368, 0.06666667, 0, 1, 1,
0.4777134, 0.06696218, 3.464484, 0.07450981, 0, 1, 1,
0.4808591, -1.440659, 2.405188, 0.07843138, 0, 1, 1,
0.4850612, -0.6530685, 4.332471, 0.08627451, 0, 1, 1,
0.5065988, -0.2394511, 4.55757, 0.09019608, 0, 1, 1,
0.5111534, 0.8222119, 0.4803742, 0.09803922, 0, 1, 1,
0.5131499, 0.05738406, 1.937359, 0.1058824, 0, 1, 1,
0.5177881, -0.1576238, 2.790314, 0.1098039, 0, 1, 1,
0.5208158, 0.280397, 1.080753, 0.1176471, 0, 1, 1,
0.5317602, -1.228539, 1.65532, 0.1215686, 0, 1, 1,
0.541218, 0.650075, 1.711543, 0.1294118, 0, 1, 1,
0.5456603, 0.2490255, 1.130122, 0.1333333, 0, 1, 1,
0.548285, 0.3051748, 1.084464, 0.1411765, 0, 1, 1,
0.5515895, -1.420481, 2.163109, 0.145098, 0, 1, 1,
0.5519121, -1.570531, 4.616687, 0.1529412, 0, 1, 1,
0.5528859, 0.3514152, 0.7673468, 0.1568628, 0, 1, 1,
0.5533777, -0.2919648, 3.34594, 0.1647059, 0, 1, 1,
0.5543469, -0.7047692, 3.081969, 0.1686275, 0, 1, 1,
0.5551751, 0.5407606, 1.337219, 0.1764706, 0, 1, 1,
0.5607679, -1.431439, 3.245608, 0.1803922, 0, 1, 1,
0.5618416, -0.8513961, 1.313316, 0.1882353, 0, 1, 1,
0.5625455, -0.9840174, 4.28036, 0.1921569, 0, 1, 1,
0.5642483, 0.5096946, 2.179891, 0.2, 0, 1, 1,
0.5717487, -1.158705, 0.9402492, 0.2078431, 0, 1, 1,
0.5755306, -1.816825, 0.8457276, 0.2117647, 0, 1, 1,
0.575799, -0.3860745, 2.24703, 0.2196078, 0, 1, 1,
0.5822169, -1.700476, 3.091541, 0.2235294, 0, 1, 1,
0.5845146, -0.9044505, 3.674849, 0.2313726, 0, 1, 1,
0.5884253, 0.2921674, 0.9820285, 0.2352941, 0, 1, 1,
0.5948813, -1.060439, 0.1820374, 0.2431373, 0, 1, 1,
0.5960231, 0.4623261, 0.1723031, 0.2470588, 0, 1, 1,
0.5980607, 0.06106162, 2.398982, 0.254902, 0, 1, 1,
0.6004622, 1.015122, 1.199854, 0.2588235, 0, 1, 1,
0.6016188, -0.8895604, 1.445408, 0.2666667, 0, 1, 1,
0.6019688, -1.263928, 2.722184, 0.2705882, 0, 1, 1,
0.6023526, 0.3986086, 0.8005254, 0.2784314, 0, 1, 1,
0.6024603, -1.060589, 2.814597, 0.282353, 0, 1, 1,
0.604393, -0.05451849, 1.752707, 0.2901961, 0, 1, 1,
0.6049978, -0.9397479, 2.773799, 0.2941177, 0, 1, 1,
0.6056952, -0.6696832, 3.203583, 0.3019608, 0, 1, 1,
0.6111571, -0.6250181, 1.435098, 0.3098039, 0, 1, 1,
0.6143286, 0.5269746, 0.8068526, 0.3137255, 0, 1, 1,
0.6144132, 0.4678822, 2.071402, 0.3215686, 0, 1, 1,
0.6164703, 0.9115813, 0.2945543, 0.3254902, 0, 1, 1,
0.6196879, 0.3930308, 2.344533, 0.3333333, 0, 1, 1,
0.622357, -0.4611039, 2.21839, 0.3372549, 0, 1, 1,
0.6261522, 0.5238752, 0.02885161, 0.345098, 0, 1, 1,
0.6276466, 0.8729653, 1.631183, 0.3490196, 0, 1, 1,
0.6311311, 0.5206422, 1.185005, 0.3568628, 0, 1, 1,
0.634443, 0.2053508, 2.265483, 0.3607843, 0, 1, 1,
0.6350986, 1.882113, 0.1560738, 0.3686275, 0, 1, 1,
0.6447886, 0.275061, 3.265369, 0.372549, 0, 1, 1,
0.6448473, 0.6330243, 1.38431, 0.3803922, 0, 1, 1,
0.6552615, 0.06792359, 3.480715, 0.3843137, 0, 1, 1,
0.6560697, -0.4975424, 0.7161496, 0.3921569, 0, 1, 1,
0.658646, 0.183872, 2.049881, 0.3960784, 0, 1, 1,
0.6600863, -0.9287622, 2.493365, 0.4039216, 0, 1, 1,
0.6612723, -0.6653533, 1.96913, 0.4117647, 0, 1, 1,
0.6614525, 1.23922, 0.7551552, 0.4156863, 0, 1, 1,
0.6632446, -0.4840073, 2.258577, 0.4235294, 0, 1, 1,
0.6741726, -0.9269489, 0.9564674, 0.427451, 0, 1, 1,
0.6743852, 0.01699341, 2.302469, 0.4352941, 0, 1, 1,
0.6767166, 1.246403, 1.114395, 0.4392157, 0, 1, 1,
0.6804982, -0.5243448, 2.063677, 0.4470588, 0, 1, 1,
0.682797, -0.5287822, 3.972952, 0.4509804, 0, 1, 1,
0.6837687, 0.7388766, 1.391973, 0.4588235, 0, 1, 1,
0.6848227, -0.5399556, 3.255845, 0.4627451, 0, 1, 1,
0.6855016, 2.751751, 0.01612398, 0.4705882, 0, 1, 1,
0.6864503, -0.2378513, -0.03399201, 0.4745098, 0, 1, 1,
0.6874925, 0.474219, 1.635286, 0.4823529, 0, 1, 1,
0.6885261, 0.4285043, 1.336479, 0.4862745, 0, 1, 1,
0.699256, 0.6657717, 0.2705886, 0.4941176, 0, 1, 1,
0.7064798, 0.9206551, 1.293279, 0.5019608, 0, 1, 1,
0.7114999, 1.549464, 0.1448904, 0.5058824, 0, 1, 1,
0.7116496, -0.252464, 2.752073, 0.5137255, 0, 1, 1,
0.7129995, -0.7721353, 3.564144, 0.5176471, 0, 1, 1,
0.7204803, 0.2229106, 1.947954, 0.5254902, 0, 1, 1,
0.7214692, 1.175109, 1.873805, 0.5294118, 0, 1, 1,
0.7298424, -0.2975089, 2.162906, 0.5372549, 0, 1, 1,
0.7324865, -1.898506, 3.089809, 0.5411765, 0, 1, 1,
0.735239, 0.9265195, 2.071931, 0.5490196, 0, 1, 1,
0.7455193, -0.8202677, 1.974487, 0.5529412, 0, 1, 1,
0.7472761, 0.2130643, 0.09835601, 0.5607843, 0, 1, 1,
0.7481674, -0.3648521, 1.263222, 0.5647059, 0, 1, 1,
0.7511094, 0.3331769, 1.86511, 0.572549, 0, 1, 1,
0.7524836, 0.9820599, -1.016915, 0.5764706, 0, 1, 1,
0.7589527, 0.5206046, 0.70959, 0.5843138, 0, 1, 1,
0.7594725, -0.4513308, 1.569144, 0.5882353, 0, 1, 1,
0.769674, -0.9513067, 0.724636, 0.5960785, 0, 1, 1,
0.7717268, -1.035264, 1.42954, 0.6039216, 0, 1, 1,
0.7802076, 0.1328953, 1.687085, 0.6078432, 0, 1, 1,
0.7830434, 0.5686517, 1.516626, 0.6156863, 0, 1, 1,
0.7837805, 0.7852736, -0.1055363, 0.6196079, 0, 1, 1,
0.7852395, 1.215936, 0.67894, 0.627451, 0, 1, 1,
0.7869225, -0.9776446, 2.32054, 0.6313726, 0, 1, 1,
0.788928, -0.2614674, 1.575813, 0.6392157, 0, 1, 1,
0.7913784, -0.7005521, 2.096096, 0.6431373, 0, 1, 1,
0.8076211, -0.02909589, 0.8974283, 0.6509804, 0, 1, 1,
0.8108684, 2.307698, -0.5114387, 0.654902, 0, 1, 1,
0.8120697, 0.2405393, 3.053945, 0.6627451, 0, 1, 1,
0.8150961, 1.489898, 1.268865, 0.6666667, 0, 1, 1,
0.8167742, 0.1773787, 0.2738524, 0.6745098, 0, 1, 1,
0.8199875, 1.92715, -0.2202591, 0.6784314, 0, 1, 1,
0.8216811, 0.8519437, 0.305258, 0.6862745, 0, 1, 1,
0.8227482, -1.670977, 3.739013, 0.6901961, 0, 1, 1,
0.8237965, 1.910626, 0.1086604, 0.6980392, 0, 1, 1,
0.8265263, 0.8830187, 0.2356355, 0.7058824, 0, 1, 1,
0.8285056, 0.8504897, 1.320528, 0.7098039, 0, 1, 1,
0.8317795, 0.8722227, 0.3142089, 0.7176471, 0, 1, 1,
0.8338222, 0.05644908, 2.168793, 0.7215686, 0, 1, 1,
0.8368549, 0.3610229, -0.6335084, 0.7294118, 0, 1, 1,
0.8415534, -1.781258, 1.552098, 0.7333333, 0, 1, 1,
0.8449839, 1.158086, 0.04953713, 0.7411765, 0, 1, 1,
0.8592579, -0.8306462, 2.474905, 0.7450981, 0, 1, 1,
0.8705645, 1.575928, 0.9996703, 0.7529412, 0, 1, 1,
0.8793695, 0.6628486, 0.9395877, 0.7568628, 0, 1, 1,
0.8797594, 1.227281, -0.4523711, 0.7647059, 0, 1, 1,
0.8810003, 0.2628432, -0.411053, 0.7686275, 0, 1, 1,
0.8865101, -0.7365919, 1.016751, 0.7764706, 0, 1, 1,
0.8877544, 0.3415464, -0.1354342, 0.7803922, 0, 1, 1,
0.8894998, 0.3854845, 2.896709, 0.7882353, 0, 1, 1,
0.8902079, -0.4873065, 2.304552, 0.7921569, 0, 1, 1,
0.8963749, 0.1697969, 2.1631, 0.8, 0, 1, 1,
0.9007524, -0.3628359, 1.788964, 0.8078431, 0, 1, 1,
0.9019502, -0.3257973, 0.6300501, 0.8117647, 0, 1, 1,
0.9022657, 0.02240753, 2.220193, 0.8196079, 0, 1, 1,
0.9087648, 0.2863913, 1.269175, 0.8235294, 0, 1, 1,
0.916055, 0.3022895, 2.444552, 0.8313726, 0, 1, 1,
0.9190282, -1.090702, 1.971594, 0.8352941, 0, 1, 1,
0.9194036, -0.2114622, 1.799865, 0.8431373, 0, 1, 1,
0.9250044, -0.8416877, 4.247622, 0.8470588, 0, 1, 1,
0.926666, 0.1735598, 0.5606517, 0.854902, 0, 1, 1,
0.9294561, -1.719083, 2.231903, 0.8588235, 0, 1, 1,
0.9302087, -0.5299826, 1.590582, 0.8666667, 0, 1, 1,
0.9336919, -0.09479841, 3.536093, 0.8705882, 0, 1, 1,
0.9380752, -0.4093768, 0.184864, 0.8784314, 0, 1, 1,
0.9381407, 0.1863305, 0.9241757, 0.8823529, 0, 1, 1,
0.9433242, -0.4404798, 0.5200703, 0.8901961, 0, 1, 1,
0.945282, 1.594322, 0.6789907, 0.8941177, 0, 1, 1,
0.9479086, -0.09719484, 1.188284, 0.9019608, 0, 1, 1,
0.9482064, 1.213204, 0.3599805, 0.9098039, 0, 1, 1,
0.9485644, 0.5358967, 1.49113, 0.9137255, 0, 1, 1,
0.9489133, 1.515464, 0.5491544, 0.9215686, 0, 1, 1,
0.951076, -0.2726389, 2.324577, 0.9254902, 0, 1, 1,
0.9511512, -0.5502494, 2.177473, 0.9333333, 0, 1, 1,
0.9564649, -1.377121, 2.161479, 0.9372549, 0, 1, 1,
0.9602114, 2.049502, 0.4087937, 0.945098, 0, 1, 1,
0.9650275, 0.8188776, 0.6540587, 0.9490196, 0, 1, 1,
0.9670194, 0.3200358, 1.750414, 0.9568627, 0, 1, 1,
0.9684587, -1.644156, 3.040605, 0.9607843, 0, 1, 1,
0.9716081, 0.2899149, 1.020562, 0.9686275, 0, 1, 1,
0.9782467, 0.3896891, 2.00924, 0.972549, 0, 1, 1,
0.9800388, -0.01802274, 2.584285, 0.9803922, 0, 1, 1,
0.9822295, 0.8285902, 0.8192988, 0.9843137, 0, 1, 1,
0.9832172, 0.2902726, 1.337866, 0.9921569, 0, 1, 1,
0.9848467, -1.496471, 1.416553, 0.9960784, 0, 1, 1,
0.9869264, 1.688466, 0.9810086, 1, 0, 0.9960784, 1,
0.9881664, 0.8005894, 0.8254315, 1, 0, 0.9882353, 1,
0.9953017, 1.401478, 0.3861655, 1, 0, 0.9843137, 1,
0.999902, 0.8291572, 0.6005905, 1, 0, 0.9764706, 1,
1.002771, -1.541792, 2.037309, 1, 0, 0.972549, 1,
1.005731, 0.4625981, 2.283553, 1, 0, 0.9647059, 1,
1.009062, 0.9476681, -1.212354, 1, 0, 0.9607843, 1,
1.009584, 0.1111822, 1.51545, 1, 0, 0.9529412, 1,
1.010967, -0.3268663, 2.37691, 1, 0, 0.9490196, 1,
1.011678, -0.1558408, 0.9731535, 1, 0, 0.9411765, 1,
1.012665, 1.242972, 0.9497703, 1, 0, 0.9372549, 1,
1.017159, 0.7658669, -0.1671185, 1, 0, 0.9294118, 1,
1.020969, 0.227331, 0.5962399, 1, 0, 0.9254902, 1,
1.021853, -0.5303968, 1.80502, 1, 0, 0.9176471, 1,
1.024814, 0.1662175, -0.213401, 1, 0, 0.9137255, 1,
1.025546, -0.5276721, 3.43117, 1, 0, 0.9058824, 1,
1.026385, -0.1077014, 1.199519, 1, 0, 0.9019608, 1,
1.029061, -0.03844979, 2.538307, 1, 0, 0.8941177, 1,
1.030201, 1.162182, -0.7188804, 1, 0, 0.8862745, 1,
1.030627, 0.6626426, 0.3118448, 1, 0, 0.8823529, 1,
1.030996, 0.5806074, 1.767314, 1, 0, 0.8745098, 1,
1.039778, -0.1866415, 1.850544, 1, 0, 0.8705882, 1,
1.03978, -1.026128, 1.049195, 1, 0, 0.8627451, 1,
1.041076, -1.16428, 0.3727604, 1, 0, 0.8588235, 1,
1.050233, -0.186322, 2.980302, 1, 0, 0.8509804, 1,
1.05992, 0.5067781, 0.2665399, 1, 0, 0.8470588, 1,
1.062487, -0.8316854, 1.436303, 1, 0, 0.8392157, 1,
1.0627, -0.5029596, 2.221027, 1, 0, 0.8352941, 1,
1.066003, -0.8236083, 2.721315, 1, 0, 0.827451, 1,
1.06699, -0.4881469, 1.013557, 1, 0, 0.8235294, 1,
1.075092, -0.0002112983, 0.9652236, 1, 0, 0.8156863, 1,
1.077227, -0.4664755, 1.22355, 1, 0, 0.8117647, 1,
1.093213, -0.4940848, 1.375529, 1, 0, 0.8039216, 1,
1.095705, -0.0726825, 2.61222, 1, 0, 0.7960784, 1,
1.097665, -2.168697, 3.329195, 1, 0, 0.7921569, 1,
1.100711, -1.641166, 3.201797, 1, 0, 0.7843137, 1,
1.108292, 1.081203, -0.3106175, 1, 0, 0.7803922, 1,
1.110876, -0.5614527, 0.5393182, 1, 0, 0.772549, 1,
1.113191, -1.050904, 4.212995, 1, 0, 0.7686275, 1,
1.115927, 0.08169051, 1.196244, 1, 0, 0.7607843, 1,
1.139788, 1.338132, 1.832614, 1, 0, 0.7568628, 1,
1.142594, -1.507094, 2.271483, 1, 0, 0.7490196, 1,
1.150686, -0.4907618, 2.292022, 1, 0, 0.7450981, 1,
1.15077, -0.351477, 3.309844, 1, 0, 0.7372549, 1,
1.151563, -0.6620218, 2.557329, 1, 0, 0.7333333, 1,
1.158568, 1.853195, 0.8180424, 1, 0, 0.7254902, 1,
1.170003, 0.5674471, 0.4622971, 1, 0, 0.7215686, 1,
1.18201, -0.6270536, 1.500835, 1, 0, 0.7137255, 1,
1.198613, 0.3667873, 0.8224496, 1, 0, 0.7098039, 1,
1.202815, -0.3979446, 1.533889, 1, 0, 0.7019608, 1,
1.203839, 0.3093357, 0.6535701, 1, 0, 0.6941177, 1,
1.208213, -0.8149931, 2.623617, 1, 0, 0.6901961, 1,
1.211325, 1.514673, 0.3415007, 1, 0, 0.682353, 1,
1.215763, 0.8466747, 1.096441, 1, 0, 0.6784314, 1,
1.21796, -0.7835761, 1.085595, 1, 0, 0.6705883, 1,
1.220354, 0.6636528, 1.596917, 1, 0, 0.6666667, 1,
1.220575, 0.05670505, 3.018038, 1, 0, 0.6588235, 1,
1.225832, 0.1897606, 2.768873, 1, 0, 0.654902, 1,
1.23162, -0.1205936, 1.425089, 1, 0, 0.6470588, 1,
1.2376, -0.4615913, 3.696253, 1, 0, 0.6431373, 1,
1.238636, -1.596828, 2.699263, 1, 0, 0.6352941, 1,
1.243287, 0.9328517, 0.4413156, 1, 0, 0.6313726, 1,
1.248438, -0.1828437, 1.774482, 1, 0, 0.6235294, 1,
1.24854, -1.600321, 2.013547, 1, 0, 0.6196079, 1,
1.257774, -0.3477366, 2.838235, 1, 0, 0.6117647, 1,
1.257995, -0.7203774, 0.9095442, 1, 0, 0.6078432, 1,
1.258677, -0.294166, 2.415574, 1, 0, 0.6, 1,
1.263168, 0.5687925, 1.692555, 1, 0, 0.5921569, 1,
1.268947, 0.9205634, 0.4644955, 1, 0, 0.5882353, 1,
1.269817, -0.650224, 2.778152, 1, 0, 0.5803922, 1,
1.292415, 1.020498, -0.7252296, 1, 0, 0.5764706, 1,
1.297701, -0.8938794, 2.668909, 1, 0, 0.5686275, 1,
1.303353, 0.8425319, 1.56811, 1, 0, 0.5647059, 1,
1.311933, -0.7700276, 0.8298824, 1, 0, 0.5568628, 1,
1.328029, 0.8410947, -0.6230933, 1, 0, 0.5529412, 1,
1.334582, -0.1704028, 3.389922, 1, 0, 0.5450981, 1,
1.342331, 1.431593, 3.200978, 1, 0, 0.5411765, 1,
1.343207, 0.7239383, 1.638673, 1, 0, 0.5333334, 1,
1.343676, -1.24147, 2.173619, 1, 0, 0.5294118, 1,
1.348505, -0.2030854, 2.914501, 1, 0, 0.5215687, 1,
1.351807, -1.533084, 0.9633319, 1, 0, 0.5176471, 1,
1.35662, 1.072827, -0.9605877, 1, 0, 0.509804, 1,
1.364856, 1.092812, -2.085667, 1, 0, 0.5058824, 1,
1.368075, 2.080445, 0.8893116, 1, 0, 0.4980392, 1,
1.371434, -0.4187355, 1.831744, 1, 0, 0.4901961, 1,
1.376563, 0.5159817, 0.1237111, 1, 0, 0.4862745, 1,
1.380027, -0.8129529, 1.643058, 1, 0, 0.4784314, 1,
1.381215, 1.552792, 0.3691348, 1, 0, 0.4745098, 1,
1.389893, -0.4217798, 2.294421, 1, 0, 0.4666667, 1,
1.404442, 0.1746209, 2.196979, 1, 0, 0.4627451, 1,
1.419129, -2.349455, 2.780818, 1, 0, 0.454902, 1,
1.420003, 0.6189859, 1.460187, 1, 0, 0.4509804, 1,
1.425121, 2.045092, -0.4895618, 1, 0, 0.4431373, 1,
1.427267, 2.679458, 1.129465, 1, 0, 0.4392157, 1,
1.436466, 0.4600016, 1.940742, 1, 0, 0.4313726, 1,
1.437306, -1.006867, 2.345438, 1, 0, 0.427451, 1,
1.454461, -0.3736114, 1.013514, 1, 0, 0.4196078, 1,
1.475644, 0.652846, 0.5936159, 1, 0, 0.4156863, 1,
1.479481, -0.4402682, 1.948871, 1, 0, 0.4078431, 1,
1.480261, 0.4038148, -0.2403288, 1, 0, 0.4039216, 1,
1.489369, -0.6010474, 2.194138, 1, 0, 0.3960784, 1,
1.489572, -1.026814, 0.2962473, 1, 0, 0.3882353, 1,
1.490457, -0.9590807, 2.066746, 1, 0, 0.3843137, 1,
1.503766, -1.406476, 3.401194, 1, 0, 0.3764706, 1,
1.506247, 0.3682452, 3.096172, 1, 0, 0.372549, 1,
1.51663, -0.4842787, 2.983624, 1, 0, 0.3647059, 1,
1.533909, -1.194308, 0.4292476, 1, 0, 0.3607843, 1,
1.535053, 0.5311356, 0.5178141, 1, 0, 0.3529412, 1,
1.539313, -0.7831692, 0.9942994, 1, 0, 0.3490196, 1,
1.540495, -1.026447, 1.66145, 1, 0, 0.3411765, 1,
1.540504, -0.4928207, 1.160719, 1, 0, 0.3372549, 1,
1.541502, 1.093354, -1.433932, 1, 0, 0.3294118, 1,
1.548436, 0.7260199, 1.292061, 1, 0, 0.3254902, 1,
1.551823, -0.4631324, 2.749512, 1, 0, 0.3176471, 1,
1.557048, -1.295935, 3.207609, 1, 0, 0.3137255, 1,
1.559626, -0.3750715, 1.485288, 1, 0, 0.3058824, 1,
1.577477, 1.13641, -0.8606602, 1, 0, 0.2980392, 1,
1.578571, 0.2633689, 0.5049161, 1, 0, 0.2941177, 1,
1.587249, 0.271543, 1.872414, 1, 0, 0.2862745, 1,
1.595325, 0.2570952, 2.90362, 1, 0, 0.282353, 1,
1.62396, 0.939842, 1.603896, 1, 0, 0.2745098, 1,
1.626017, -0.9655497, 2.575692, 1, 0, 0.2705882, 1,
1.632896, -0.5751022, 0.7590433, 1, 0, 0.2627451, 1,
1.643296, 0.120096, 0.8792418, 1, 0, 0.2588235, 1,
1.659131, -1.691742, 1.55639, 1, 0, 0.2509804, 1,
1.696908, 1.009274, 1.185867, 1, 0, 0.2470588, 1,
1.720028, -0.2494357, 0.9665021, 1, 0, 0.2392157, 1,
1.733299, 1.382698, 1.464719, 1, 0, 0.2352941, 1,
1.734064, -0.8300689, 2.406803, 1, 0, 0.227451, 1,
1.786106, -1.03309, 2.660371, 1, 0, 0.2235294, 1,
1.797031, -1.145754, 1.708186, 1, 0, 0.2156863, 1,
1.798124, -1.482905, 0.8031796, 1, 0, 0.2117647, 1,
1.798673, 0.3343645, 1.639232, 1, 0, 0.2039216, 1,
1.824383, -0.5256482, 2.45774, 1, 0, 0.1960784, 1,
1.854541, 0.6972582, 2.055875, 1, 0, 0.1921569, 1,
1.875196, -0.7228927, 3.062909, 1, 0, 0.1843137, 1,
1.877521, 2.33975, 0.0130865, 1, 0, 0.1803922, 1,
1.899471, 0.1458348, 1.237103, 1, 0, 0.172549, 1,
1.908818, 0.04425874, 0.01161821, 1, 0, 0.1686275, 1,
1.914879, 0.02478624, -0.4789941, 1, 0, 0.1607843, 1,
1.928507, 2.464217, 0.9374719, 1, 0, 0.1568628, 1,
1.933187, -1.061871, 1.957367, 1, 0, 0.1490196, 1,
1.962422, -1.584366, 2.30575, 1, 0, 0.145098, 1,
1.976858, -1.425917, 0.6786773, 1, 0, 0.1372549, 1,
1.98319, 1.607465, -0.658024, 1, 0, 0.1333333, 1,
2.024188, 0.2207458, 2.494812, 1, 0, 0.1254902, 1,
2.041532, 1.602798, -0.3448486, 1, 0, 0.1215686, 1,
2.07003, -0.1633884, 3.011926, 1, 0, 0.1137255, 1,
2.072687, 0.1206035, 1.032966, 1, 0, 0.1098039, 1,
2.100595, 0.3151301, 0.2538697, 1, 0, 0.1019608, 1,
2.14278, 0.4985665, 2.802078, 1, 0, 0.09411765, 1,
2.159634, 0.02502492, -0.2447348, 1, 0, 0.09019608, 1,
2.175224, 0.2306649, 1.290104, 1, 0, 0.08235294, 1,
2.196832, 0.04513033, 1.764365, 1, 0, 0.07843138, 1,
2.253077, 0.2533052, 0.5201862, 1, 0, 0.07058824, 1,
2.303467, -1.079704, 2.847763, 1, 0, 0.06666667, 1,
2.347243, 0.8593076, 1.472836, 1, 0, 0.05882353, 1,
2.352355, -1.556909, 1.994921, 1, 0, 0.05490196, 1,
2.375718, 1.134614, 0.84176, 1, 0, 0.04705882, 1,
2.411078, -0.2561449, 3.072526, 1, 0, 0.04313726, 1,
2.450696, 0.7566659, 1.562319, 1, 0, 0.03529412, 1,
2.457179, -2.131861, 4.094273, 1, 0, 0.03137255, 1,
2.562859, 0.707761, 4.350595, 1, 0, 0.02352941, 1,
2.641549, 0.3594821, 1.384799, 1, 0, 0.01960784, 1,
2.68417, -0.9308547, 2.890426, 1, 0, 0.01176471, 1,
3.090488, 0.2809818, -0.599176, 1, 0, 0.007843138, 1
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
-0.2067767, -4.313301, -7.032434, 0, -0.5, 0.5, 0.5,
-0.2067767, -4.313301, -7.032434, 1, -0.5, 0.5, 0.5,
-0.2067767, -4.313301, -7.032434, 1, 1.5, 0.5, 0.5,
-0.2067767, -4.313301, -7.032434, 0, 1.5, 0.5, 0.5
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
-4.621814, -0.07778847, -7.032434, 0, -0.5, 0.5, 0.5,
-4.621814, -0.07778847, -7.032434, 1, -0.5, 0.5, 0.5,
-4.621814, -0.07778847, -7.032434, 1, 1.5, 0.5, 0.5,
-4.621814, -0.07778847, -7.032434, 0, 1.5, 0.5, 0.5
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
-4.621814, -4.313301, 0.4876084, 0, -0.5, 0.5, 0.5,
-4.621814, -4.313301, 0.4876084, 1, -0.5, 0.5, 0.5,
-4.621814, -4.313301, 0.4876084, 1, 1.5, 0.5, 0.5,
-4.621814, -4.313301, 0.4876084, 0, 1.5, 0.5, 0.5
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
-3, -3.335875, -5.297039,
3, -3.335875, -5.297039,
-3, -3.335875, -5.297039,
-3, -3.498779, -5.586272,
-2, -3.335875, -5.297039,
-2, -3.498779, -5.586272,
-1, -3.335875, -5.297039,
-1, -3.498779, -5.586272,
0, -3.335875, -5.297039,
0, -3.498779, -5.586272,
1, -3.335875, -5.297039,
1, -3.498779, -5.586272,
2, -3.335875, -5.297039,
2, -3.498779, -5.586272,
3, -3.335875, -5.297039,
3, -3.498779, -5.586272
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
-3, -3.824588, -6.164736, 0, -0.5, 0.5, 0.5,
-3, -3.824588, -6.164736, 1, -0.5, 0.5, 0.5,
-3, -3.824588, -6.164736, 1, 1.5, 0.5, 0.5,
-3, -3.824588, -6.164736, 0, 1.5, 0.5, 0.5,
-2, -3.824588, -6.164736, 0, -0.5, 0.5, 0.5,
-2, -3.824588, -6.164736, 1, -0.5, 0.5, 0.5,
-2, -3.824588, -6.164736, 1, 1.5, 0.5, 0.5,
-2, -3.824588, -6.164736, 0, 1.5, 0.5, 0.5,
-1, -3.824588, -6.164736, 0, -0.5, 0.5, 0.5,
-1, -3.824588, -6.164736, 1, -0.5, 0.5, 0.5,
-1, -3.824588, -6.164736, 1, 1.5, 0.5, 0.5,
-1, -3.824588, -6.164736, 0, 1.5, 0.5, 0.5,
0, -3.824588, -6.164736, 0, -0.5, 0.5, 0.5,
0, -3.824588, -6.164736, 1, -0.5, 0.5, 0.5,
0, -3.824588, -6.164736, 1, 1.5, 0.5, 0.5,
0, -3.824588, -6.164736, 0, 1.5, 0.5, 0.5,
1, -3.824588, -6.164736, 0, -0.5, 0.5, 0.5,
1, -3.824588, -6.164736, 1, -0.5, 0.5, 0.5,
1, -3.824588, -6.164736, 1, 1.5, 0.5, 0.5,
1, -3.824588, -6.164736, 0, 1.5, 0.5, 0.5,
2, -3.824588, -6.164736, 0, -0.5, 0.5, 0.5,
2, -3.824588, -6.164736, 1, -0.5, 0.5, 0.5,
2, -3.824588, -6.164736, 1, 1.5, 0.5, 0.5,
2, -3.824588, -6.164736, 0, 1.5, 0.5, 0.5,
3, -3.824588, -6.164736, 0, -0.5, 0.5, 0.5,
3, -3.824588, -6.164736, 1, -0.5, 0.5, 0.5,
3, -3.824588, -6.164736, 1, 1.5, 0.5, 0.5,
3, -3.824588, -6.164736, 0, 1.5, 0.5, 0.5
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
-3.60296, -3, -5.297039,
-3.60296, 3, -5.297039,
-3.60296, -3, -5.297039,
-3.772769, -3, -5.586272,
-3.60296, -2, -5.297039,
-3.772769, -2, -5.586272,
-3.60296, -1, -5.297039,
-3.772769, -1, -5.586272,
-3.60296, 0, -5.297039,
-3.772769, 0, -5.586272,
-3.60296, 1, -5.297039,
-3.772769, 1, -5.586272,
-3.60296, 2, -5.297039,
-3.772769, 2, -5.586272,
-3.60296, 3, -5.297039,
-3.772769, 3, -5.586272
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
-4.112387, -3, -6.164736, 0, -0.5, 0.5, 0.5,
-4.112387, -3, -6.164736, 1, -0.5, 0.5, 0.5,
-4.112387, -3, -6.164736, 1, 1.5, 0.5, 0.5,
-4.112387, -3, -6.164736, 0, 1.5, 0.5, 0.5,
-4.112387, -2, -6.164736, 0, -0.5, 0.5, 0.5,
-4.112387, -2, -6.164736, 1, -0.5, 0.5, 0.5,
-4.112387, -2, -6.164736, 1, 1.5, 0.5, 0.5,
-4.112387, -2, -6.164736, 0, 1.5, 0.5, 0.5,
-4.112387, -1, -6.164736, 0, -0.5, 0.5, 0.5,
-4.112387, -1, -6.164736, 1, -0.5, 0.5, 0.5,
-4.112387, -1, -6.164736, 1, 1.5, 0.5, 0.5,
-4.112387, -1, -6.164736, 0, 1.5, 0.5, 0.5,
-4.112387, 0, -6.164736, 0, -0.5, 0.5, 0.5,
-4.112387, 0, -6.164736, 1, -0.5, 0.5, 0.5,
-4.112387, 0, -6.164736, 1, 1.5, 0.5, 0.5,
-4.112387, 0, -6.164736, 0, 1.5, 0.5, 0.5,
-4.112387, 1, -6.164736, 0, -0.5, 0.5, 0.5,
-4.112387, 1, -6.164736, 1, -0.5, 0.5, 0.5,
-4.112387, 1, -6.164736, 1, 1.5, 0.5, 0.5,
-4.112387, 1, -6.164736, 0, 1.5, 0.5, 0.5,
-4.112387, 2, -6.164736, 0, -0.5, 0.5, 0.5,
-4.112387, 2, -6.164736, 1, -0.5, 0.5, 0.5,
-4.112387, 2, -6.164736, 1, 1.5, 0.5, 0.5,
-4.112387, 2, -6.164736, 0, 1.5, 0.5, 0.5,
-4.112387, 3, -6.164736, 0, -0.5, 0.5, 0.5,
-4.112387, 3, -6.164736, 1, -0.5, 0.5, 0.5,
-4.112387, 3, -6.164736, 1, 1.5, 0.5, 0.5,
-4.112387, 3, -6.164736, 0, 1.5, 0.5, 0.5
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
-3.60296, -3.335875, -4,
-3.60296, -3.335875, 6,
-3.60296, -3.335875, -4,
-3.772769, -3.498779, -4,
-3.60296, -3.335875, -2,
-3.772769, -3.498779, -2,
-3.60296, -3.335875, 0,
-3.772769, -3.498779, 0,
-3.60296, -3.335875, 2,
-3.772769, -3.498779, 2,
-3.60296, -3.335875, 4,
-3.772769, -3.498779, 4,
-3.60296, -3.335875, 6,
-3.772769, -3.498779, 6
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
"4",
"6"
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
-4.112387, -3.824588, -4, 0, -0.5, 0.5, 0.5,
-4.112387, -3.824588, -4, 1, -0.5, 0.5, 0.5,
-4.112387, -3.824588, -4, 1, 1.5, 0.5, 0.5,
-4.112387, -3.824588, -4, 0, 1.5, 0.5, 0.5,
-4.112387, -3.824588, -2, 0, -0.5, 0.5, 0.5,
-4.112387, -3.824588, -2, 1, -0.5, 0.5, 0.5,
-4.112387, -3.824588, -2, 1, 1.5, 0.5, 0.5,
-4.112387, -3.824588, -2, 0, 1.5, 0.5, 0.5,
-4.112387, -3.824588, 0, 0, -0.5, 0.5, 0.5,
-4.112387, -3.824588, 0, 1, -0.5, 0.5, 0.5,
-4.112387, -3.824588, 0, 1, 1.5, 0.5, 0.5,
-4.112387, -3.824588, 0, 0, 1.5, 0.5, 0.5,
-4.112387, -3.824588, 2, 0, -0.5, 0.5, 0.5,
-4.112387, -3.824588, 2, 1, -0.5, 0.5, 0.5,
-4.112387, -3.824588, 2, 1, 1.5, 0.5, 0.5,
-4.112387, -3.824588, 2, 0, 1.5, 0.5, 0.5,
-4.112387, -3.824588, 4, 0, -0.5, 0.5, 0.5,
-4.112387, -3.824588, 4, 1, -0.5, 0.5, 0.5,
-4.112387, -3.824588, 4, 1, 1.5, 0.5, 0.5,
-4.112387, -3.824588, 4, 0, 1.5, 0.5, 0.5,
-4.112387, -3.824588, 6, 0, -0.5, 0.5, 0.5,
-4.112387, -3.824588, 6, 1, -0.5, 0.5, 0.5,
-4.112387, -3.824588, 6, 1, 1.5, 0.5, 0.5,
-4.112387, -3.824588, 6, 0, 1.5, 0.5, 0.5
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
-3.60296, -3.335875, -5.297039,
-3.60296, 3.180298, -5.297039,
-3.60296, -3.335875, 6.272256,
-3.60296, 3.180298, 6.272256,
-3.60296, -3.335875, -5.297039,
-3.60296, -3.335875, 6.272256,
-3.60296, 3.180298, -5.297039,
-3.60296, 3.180298, 6.272256,
-3.60296, -3.335875, -5.297039,
3.189406, -3.335875, -5.297039,
-3.60296, -3.335875, 6.272256,
3.189406, -3.335875, 6.272256,
-3.60296, 3.180298, -5.297039,
3.189406, 3.180298, -5.297039,
-3.60296, 3.180298, 6.272256,
3.189406, 3.180298, 6.272256,
3.189406, -3.335875, -5.297039,
3.189406, 3.180298, -5.297039,
3.189406, -3.335875, 6.272256,
3.189406, 3.180298, 6.272256,
3.189406, -3.335875, -5.297039,
3.189406, -3.335875, 6.272256,
3.189406, 3.180298, -5.297039,
3.189406, 3.180298, 6.272256
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
var radius = 7.964108;
var distance = 35.43322;
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
mvMatrix.translate( 0.2067767, 0.07778847, -0.4876084 );
mvMatrix.scale( 1.267739, 1.321473, 0.7442933 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.43322);
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
pyraflufen-ethyl<-read.table("pyraflufen-ethyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyraflufen-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyraflufen' not found
```

```r
y<-pyraflufen-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyraflufen' not found
```

```r
z<-pyraflufen-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyraflufen' not found
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
-3.504042, -0.368637, -2.553071, 0, 0, 1, 1, 1,
-3.21518, 0.5318501, -1.714326, 1, 0, 0, 1, 1,
-2.777293, 1.328698, -0.6864232, 1, 0, 0, 1, 1,
-2.656866, 0.8673943, -2.549478, 1, 0, 0, 1, 1,
-2.650372, 0.09809341, -2.077466, 1, 0, 0, 1, 1,
-2.520243, -0.6721628, -0.6115203, 1, 0, 0, 1, 1,
-2.437073, 0.3827988, 0.4791059, 0, 0, 0, 1, 1,
-2.429377, -0.7933371, -2.427205, 0, 0, 0, 1, 1,
-2.397866, -0.6555302, 0.2064953, 0, 0, 0, 1, 1,
-2.377807, -1.065414, -2.196405, 0, 0, 0, 1, 1,
-2.211126, -0.8585832, -1.487385, 0, 0, 0, 1, 1,
-2.210077, 1.037914, -2.000776, 0, 0, 0, 1, 1,
-2.196184, 0.9262683, -0.6630633, 0, 0, 0, 1, 1,
-2.146935, 0.4697611, -1.593318, 1, 1, 1, 1, 1,
-2.135736, 0.01936683, -1.861821, 1, 1, 1, 1, 1,
-2.074194, 0.3672111, 0.1637975, 1, 1, 1, 1, 1,
-2.072351, 0.1430927, -0.9443679, 1, 1, 1, 1, 1,
-2.050088, -0.03078391, -1.070351, 1, 1, 1, 1, 1,
-2.032998, 1.002867, 0.3750916, 1, 1, 1, 1, 1,
-2.032597, 0.7781618, -2.153653, 1, 1, 1, 1, 1,
-2.023321, 0.2006618, -3.283235, 1, 1, 1, 1, 1,
-1.953243, 0.6167281, -1.221943, 1, 1, 1, 1, 1,
-1.952965, -0.0607916, 0.01201823, 1, 1, 1, 1, 1,
-1.89936, 0.3188041, -0.4706248, 1, 1, 1, 1, 1,
-1.892516, -1.52635, -1.206015, 1, 1, 1, 1, 1,
-1.855469, 0.9904748, -2.436096, 1, 1, 1, 1, 1,
-1.844598, 0.1858282, -1.853896, 1, 1, 1, 1, 1,
-1.835888, -0.04592129, -1.822886, 1, 1, 1, 1, 1,
-1.834245, -0.5848203, -1.598221, 0, 0, 1, 1, 1,
-1.824803, -0.2795528, -2.242776, 1, 0, 0, 1, 1,
-1.802161, 0.0605579, -1.722012, 1, 0, 0, 1, 1,
-1.782907, 0.01318937, -1.263535, 1, 0, 0, 1, 1,
-1.757418, 0.005191803, -0.2148678, 1, 0, 0, 1, 1,
-1.737598, 0.5118752, -2.505204, 1, 0, 0, 1, 1,
-1.719107, -0.2932974, -0.1700718, 0, 0, 0, 1, 1,
-1.709973, -0.2261325, -1.43807, 0, 0, 0, 1, 1,
-1.703707, -2.007257, -2.545251, 0, 0, 0, 1, 1,
-1.681618, 0.1914606, -1.404922, 0, 0, 0, 1, 1,
-1.680624, 3.014133, -0.8707846, 0, 0, 0, 1, 1,
-1.679778, 0.2158087, -2.243112, 0, 0, 0, 1, 1,
-1.677784, 0.03401386, -0.4020869, 0, 0, 0, 1, 1,
-1.671826, -0.7740923, -2.435592, 1, 1, 1, 1, 1,
-1.669011, -0.2085762, -2.389665, 1, 1, 1, 1, 1,
-1.660116, -1.30945, -3.022596, 1, 1, 1, 1, 1,
-1.659054, 1.014387, -0.3483336, 1, 1, 1, 1, 1,
-1.655518, 0.1196362, -0.7068163, 1, 1, 1, 1, 1,
-1.650144, -0.8820435, -1.455046, 1, 1, 1, 1, 1,
-1.64587, 0.9439806, -2.37678, 1, 1, 1, 1, 1,
-1.633693, -1.360934, -2.798092, 1, 1, 1, 1, 1,
-1.624985, 0.6504451, -2.29694, 1, 1, 1, 1, 1,
-1.608724, 0.3478011, -1.941841, 1, 1, 1, 1, 1,
-1.592122, 0.5439767, -1.577618, 1, 1, 1, 1, 1,
-1.581887, -0.2815318, -1.317285, 1, 1, 1, 1, 1,
-1.57445, 0.3221194, -1.935776, 1, 1, 1, 1, 1,
-1.566571, 0.03518559, -1.050813, 1, 1, 1, 1, 1,
-1.564647, 0.7456135, -0.2569342, 1, 1, 1, 1, 1,
-1.545718, -1.798443, -2.889713, 0, 0, 1, 1, 1,
-1.533487, 0.4571348, -0.3542399, 1, 0, 0, 1, 1,
-1.529476, 1.019355, -1.895602, 1, 0, 0, 1, 1,
-1.528638, -2.118471, -2.103919, 1, 0, 0, 1, 1,
-1.513061, -1.479478, -2.51704, 1, 0, 0, 1, 1,
-1.505072, -0.5108976, -1.03496, 1, 0, 0, 1, 1,
-1.497021, 0.4082836, -0.7026325, 0, 0, 0, 1, 1,
-1.483322, -0.2577658, -1.616644, 0, 0, 0, 1, 1,
-1.46608, 2.297458, 1.021895, 0, 0, 0, 1, 1,
-1.460053, -0.766832, -1.51389, 0, 0, 0, 1, 1,
-1.451472, 0.7650707, -1.08722, 0, 0, 0, 1, 1,
-1.451096, 0.6959178, -0.3894627, 0, 0, 0, 1, 1,
-1.449626, 0.3925456, -2.604652, 0, 0, 0, 1, 1,
-1.440064, 1.490774, -2.155557, 1, 1, 1, 1, 1,
-1.43744, -0.596451, -2.343952, 1, 1, 1, 1, 1,
-1.436247, 0.7394526, -1.569422, 1, 1, 1, 1, 1,
-1.435863, 1.098352, -1.247676, 1, 1, 1, 1, 1,
-1.427029, -0.3867697, 0.4675789, 1, 1, 1, 1, 1,
-1.426368, 0.2204461, 0.02717002, 1, 1, 1, 1, 1,
-1.426257, 0.4542273, -0.7843117, 1, 1, 1, 1, 1,
-1.425949, -1.196382, -2.180936, 1, 1, 1, 1, 1,
-1.425717, 1.62053, -0.6047308, 1, 1, 1, 1, 1,
-1.419669, -0.4274707, -1.173372, 1, 1, 1, 1, 1,
-1.418828, -0.2689844, -4.021982, 1, 1, 1, 1, 1,
-1.417785, -0.5709806, -1.025715, 1, 1, 1, 1, 1,
-1.417153, 1.256881, 0.06013579, 1, 1, 1, 1, 1,
-1.393488, -1.009022, -2.934833, 1, 1, 1, 1, 1,
-1.38051, -0.256699, -2.035087, 1, 1, 1, 1, 1,
-1.378721, 0.3209735, -1.733167, 0, 0, 1, 1, 1,
-1.372999, -1.702893, -1.173168, 1, 0, 0, 1, 1,
-1.36819, -0.0300511, -2.610186, 1, 0, 0, 1, 1,
-1.350586, 0.6028908, -1.559676, 1, 0, 0, 1, 1,
-1.34922, -1.922532, -2.576897, 1, 0, 0, 1, 1,
-1.349009, 0.09890348, -2.017252, 1, 0, 0, 1, 1,
-1.339918, 0.0985577, -2.292429, 0, 0, 0, 1, 1,
-1.336085, -0.3696123, -2.804633, 0, 0, 0, 1, 1,
-1.335439, 1.847448, -2.288199, 0, 0, 0, 1, 1,
-1.334158, -0.2548391, -2.587743, 0, 0, 0, 1, 1,
-1.333882, -0.8256125, -3.744695, 0, 0, 0, 1, 1,
-1.331173, 0.2407551, -0.0507122, 0, 0, 0, 1, 1,
-1.328357, -0.4507238, -3.013085, 0, 0, 0, 1, 1,
-1.322843, -0.756636, -1.598005, 1, 1, 1, 1, 1,
-1.321963, -0.8458062, -2.487809, 1, 1, 1, 1, 1,
-1.300392, 1.04355, -0.2542235, 1, 1, 1, 1, 1,
-1.292542, 0.7739651, -0.6396046, 1, 1, 1, 1, 1,
-1.292477, 0.4650897, -2.333014, 1, 1, 1, 1, 1,
-1.29197, -0.4165997, -2.050409, 1, 1, 1, 1, 1,
-1.282323, 0.1585227, 0.0253788, 1, 1, 1, 1, 1,
-1.269629, 0.3866352, -0.6755462, 1, 1, 1, 1, 1,
-1.258278, 2.585412, -3.075977, 1, 1, 1, 1, 1,
-1.250956, 1.22746, -2.194807, 1, 1, 1, 1, 1,
-1.242498, -1.652743, -3.603935, 1, 1, 1, 1, 1,
-1.239376, 1.283286, -0.2599733, 1, 1, 1, 1, 1,
-1.232683, 0.3736245, -2.720056, 1, 1, 1, 1, 1,
-1.229475, 0.2916519, -0.8747134, 1, 1, 1, 1, 1,
-1.212654, -0.8903053, -3.535417, 1, 1, 1, 1, 1,
-1.201627, 0.5509652, -3.026282, 0, 0, 1, 1, 1,
-1.201004, 0.09889988, -0.3095253, 1, 0, 0, 1, 1,
-1.193671, -0.5414714, -2.630493, 1, 0, 0, 1, 1,
-1.193253, -0.2117837, -1.280615, 1, 0, 0, 1, 1,
-1.189288, 0.3635002, -0.7527597, 1, 0, 0, 1, 1,
-1.183395, -0.2143627, -3.787946, 1, 0, 0, 1, 1,
-1.18328, -1.023393, -2.54806, 0, 0, 0, 1, 1,
-1.180837, -0.2355263, -0.8659993, 0, 0, 0, 1, 1,
-1.174268, 0.3595883, 0.02065214, 0, 0, 0, 1, 1,
-1.17036, 0.5245262, -0.6039296, 0, 0, 0, 1, 1,
-1.167449, 0.4975918, -3.125005, 0, 0, 0, 1, 1,
-1.167072, -1.75405, -3.314881, 0, 0, 0, 1, 1,
-1.161496, 1.112467, 0.1695195, 0, 0, 0, 1, 1,
-1.161141, 1.033423, 0.856757, 1, 1, 1, 1, 1,
-1.158002, 0.2656539, -0.7088717, 1, 1, 1, 1, 1,
-1.156535, -1.196876, -1.774157, 1, 1, 1, 1, 1,
-1.152325, -0.6030877, -1.807955, 1, 1, 1, 1, 1,
-1.147228, -0.03302762, -1.54589, 1, 1, 1, 1, 1,
-1.143033, 0.1380682, -1.895008, 1, 1, 1, 1, 1,
-1.125704, 1.561225, -1.413346, 1, 1, 1, 1, 1,
-1.107315, 1.46918, -1.291085, 1, 1, 1, 1, 1,
-1.106964, -1.629305, -2.686862, 1, 1, 1, 1, 1,
-1.105933, -0.05905373, -2.123441, 1, 1, 1, 1, 1,
-1.083547, -0.8358618, -1.76894, 1, 1, 1, 1, 1,
-1.075492, 0.7786919, -0.838858, 1, 1, 1, 1, 1,
-1.071643, -1.486091, -2.554505, 1, 1, 1, 1, 1,
-1.071033, 0.8038173, 0.4281918, 1, 1, 1, 1, 1,
-1.064707, -0.02289964, -2.542871, 1, 1, 1, 1, 1,
-1.060936, 0.03089238, -3.334241, 0, 0, 1, 1, 1,
-1.058561, -1.796304, -1.642003, 1, 0, 0, 1, 1,
-1.058437, 0.4330799, -1.505147, 1, 0, 0, 1, 1,
-1.057976, -0.2551712, -0.36183, 1, 0, 0, 1, 1,
-1.054477, 0.217257, -2.974125, 1, 0, 0, 1, 1,
-1.047458, -1.146572, -1.668664, 1, 0, 0, 1, 1,
-1.047446, -2.146843, -1.735028, 0, 0, 0, 1, 1,
-1.042148, -0.1605646, -2.005608, 0, 0, 0, 1, 1,
-1.037735, 0.5639046, -0.04967921, 0, 0, 0, 1, 1,
-1.037516, -0.5133039, -1.061718, 0, 0, 0, 1, 1,
-1.036122, 0.4059359, -0.9058994, 0, 0, 0, 1, 1,
-1.033774, 1.777163, 0.7707831, 0, 0, 0, 1, 1,
-1.02502, 0.5746068, -0.1433905, 0, 0, 0, 1, 1,
-1.01938, -0.6902426, -3.658165, 1, 1, 1, 1, 1,
-1.013914, -1.048538, -2.565271, 1, 1, 1, 1, 1,
-1.013543, -0.1811734, -1.453308, 1, 1, 1, 1, 1,
-1.013106, -0.8502261, -3.427217, 1, 1, 1, 1, 1,
-1.012739, -0.5651757, -1.900328, 1, 1, 1, 1, 1,
-1.011961, -0.7850529, -0.1919537, 1, 1, 1, 1, 1,
-1.01129, -0.7240262, -2.250757, 1, 1, 1, 1, 1,
-1.009322, 1.236211, -1.019053, 1, 1, 1, 1, 1,
-1.006503, -0.890386, -3.1847, 1, 1, 1, 1, 1,
-1.00204, 0.7889389, -0.9763306, 1, 1, 1, 1, 1,
-0.9833869, -1.299716, -2.851245, 1, 1, 1, 1, 1,
-0.9791873, 1.238783, -0.7463088, 1, 1, 1, 1, 1,
-0.9780489, -1.96617, -4.387355, 1, 1, 1, 1, 1,
-0.9694959, -0.983942, -4.605319, 1, 1, 1, 1, 1,
-0.9688641, -2.42585, -2.039422, 1, 1, 1, 1, 1,
-0.9565674, 0.286047, -1.82864, 0, 0, 1, 1, 1,
-0.9541149, 0.7704258, -0.8287715, 1, 0, 0, 1, 1,
-0.9535648, -0.08113024, 0.07398498, 1, 0, 0, 1, 1,
-0.9532768, 0.6679695, -1.00855, 1, 0, 0, 1, 1,
-0.9497944, -0.6440315, -3.160557, 1, 0, 0, 1, 1,
-0.9469981, -0.7522889, -1.67576, 1, 0, 0, 1, 1,
-0.9407011, 0.6686847, -2.103415, 0, 0, 0, 1, 1,
-0.9376422, 0.07962904, -2.300865, 0, 0, 0, 1, 1,
-0.9285579, -0.3949704, -1.445526, 0, 0, 0, 1, 1,
-0.9256241, -1.248916, -3.416301, 0, 0, 0, 1, 1,
-0.924361, 1.413136, -0.4512077, 0, 0, 0, 1, 1,
-0.9154929, 0.1885458, 0.6430454, 0, 0, 0, 1, 1,
-0.9114338, -2.195894, -5.128554, 0, 0, 0, 1, 1,
-0.9106401, -1.287518, -0.4471203, 1, 1, 1, 1, 1,
-0.9102208, -0.2421268, -3.208036, 1, 1, 1, 1, 1,
-0.90856, -0.739006, -2.610052, 1, 1, 1, 1, 1,
-0.908052, 1.78592, -0.1366926, 1, 1, 1, 1, 1,
-0.9071781, 1.07787, -1.735679, 1, 1, 1, 1, 1,
-0.9069574, 0.8625264, -1.828531, 1, 1, 1, 1, 1,
-0.9057084, 1.024032, -1.91158, 1, 1, 1, 1, 1,
-0.9019095, -0.9571885, -3.71662, 1, 1, 1, 1, 1,
-0.9003611, -1.402218, -2.118616, 1, 1, 1, 1, 1,
-0.8811004, -0.9201883, -1.777629, 1, 1, 1, 1, 1,
-0.8782383, -0.5303578, -1.971098, 1, 1, 1, 1, 1,
-0.8753389, -1.581599, -1.64356, 1, 1, 1, 1, 1,
-0.8741224, -0.4124514, -1.546944, 1, 1, 1, 1, 1,
-0.8733106, -1.20125, -4.141081, 1, 1, 1, 1, 1,
-0.8682913, 1.844672, -0.2786798, 1, 1, 1, 1, 1,
-0.8679712, -0.4831791, -0.8990183, 0, 0, 1, 1, 1,
-0.8677747, -0.8382708, -1.386894, 1, 0, 0, 1, 1,
-0.8626701, -0.05122939, -2.207787, 1, 0, 0, 1, 1,
-0.859847, -1.404293, -1.772511, 1, 0, 0, 1, 1,
-0.8588739, 1.766581, -1.93629, 1, 0, 0, 1, 1,
-0.8496661, 0.9092864, -1.216673, 1, 0, 0, 1, 1,
-0.8442796, 1.079897, -1.669485, 0, 0, 0, 1, 1,
-0.8401092, -0.5577554, -1.919448, 0, 0, 0, 1, 1,
-0.8288342, -0.9580702, -3.724797, 0, 0, 0, 1, 1,
-0.8288335, -0.3867729, -2.561757, 0, 0, 0, 1, 1,
-0.8286767, 0.2623382, -0.4797454, 0, 0, 0, 1, 1,
-0.8275399, 1.509333, -0.01775509, 0, 0, 0, 1, 1,
-0.8231714, -1.539101, -1.259987, 0, 0, 0, 1, 1,
-0.8229046, -0.5022652, -1.05236, 1, 1, 1, 1, 1,
-0.8119892, 1.025468, -0.4224898, 1, 1, 1, 1, 1,
-0.8108268, -0.300644, -2.095433, 1, 1, 1, 1, 1,
-0.8077136, -0.6625334, -3.085741, 1, 1, 1, 1, 1,
-0.8054472, 0.2452721, -1.942337, 1, 1, 1, 1, 1,
-0.7998224, 0.6427307, -0.9153447, 1, 1, 1, 1, 1,
-0.79838, 2.31279, -0.6745099, 1, 1, 1, 1, 1,
-0.7928561, 0.4221462, -0.5415506, 1, 1, 1, 1, 1,
-0.7855459, -1.988672, -2.893925, 1, 1, 1, 1, 1,
-0.7671009, -0.4862942, -1.634351, 1, 1, 1, 1, 1,
-0.7636421, 0.4088456, -1.43463, 1, 1, 1, 1, 1,
-0.7590318, 1.134842, -2.028226, 1, 1, 1, 1, 1,
-0.7575457, -0.4129551, -1.991354, 1, 1, 1, 1, 1,
-0.7562472, 0.1600678, -1.198985, 1, 1, 1, 1, 1,
-0.7557108, -0.4346491, -1.442929, 1, 1, 1, 1, 1,
-0.7556127, -0.1479355, -2.288905, 0, 0, 1, 1, 1,
-0.7497775, 0.1628753, -1.192651, 1, 0, 0, 1, 1,
-0.7456985, -0.3316849, -2.054493, 1, 0, 0, 1, 1,
-0.7431778, -0.1048886, -1.652746, 1, 0, 0, 1, 1,
-0.7373922, 1.76439, -0.1603544, 1, 0, 0, 1, 1,
-0.7369493, -0.570573, -2.264303, 1, 0, 0, 1, 1,
-0.7353342, 2.126484, 1.82973, 0, 0, 0, 1, 1,
-0.7304349, -0.505941, -2.087515, 0, 0, 0, 1, 1,
-0.7297952, 0.3661432, -1.917574, 0, 0, 0, 1, 1,
-0.7294948, 0.7442552, 0.1115198, 0, 0, 0, 1, 1,
-0.7243792, 0.7902824, 0.07708696, 0, 0, 0, 1, 1,
-0.7083213, 1.014478, 0.6077049, 0, 0, 0, 1, 1,
-0.7079645, -0.4486788, -1.071029, 0, 0, 0, 1, 1,
-0.7077593, 2.040814, 0.1108084, 1, 1, 1, 1, 1,
-0.7024906, -3.061849, -2.480997, 1, 1, 1, 1, 1,
-0.7022729, -0.1451476, -1.287241, 1, 1, 1, 1, 1,
-0.7009512, -0.238218, -2.731293, 1, 1, 1, 1, 1,
-0.6936443, 0.1499941, -2.511832, 1, 1, 1, 1, 1,
-0.6865895, -2.21386, -3.981236, 1, 1, 1, 1, 1,
-0.6861172, 0.3841814, 0.9274626, 1, 1, 1, 1, 1,
-0.6824616, 0.9385266, 0.6473184, 1, 1, 1, 1, 1,
-0.6807327, 0.822856, -2.388356, 1, 1, 1, 1, 1,
-0.6786169, -0.7954584, -1.99424, 1, 1, 1, 1, 1,
-0.6780638, 1.678504, -0.2949805, 1, 1, 1, 1, 1,
-0.6693847, -0.05336558, -1.640358, 1, 1, 1, 1, 1,
-0.6678119, -0.2546753, -2.955774, 1, 1, 1, 1, 1,
-0.6613298, 1.805401, 1.08407, 1, 1, 1, 1, 1,
-0.6600336, -0.03882499, -1.100965, 1, 1, 1, 1, 1,
-0.6498784, -0.8159343, -0.3342098, 0, 0, 1, 1, 1,
-0.6469334, -0.9253809, -3.864803, 1, 0, 0, 1, 1,
-0.6468636, -1.390607, -1.875312, 1, 0, 0, 1, 1,
-0.643918, -0.4702939, -3.094485, 1, 0, 0, 1, 1,
-0.6431628, 1.218717, -0.04069605, 1, 0, 0, 1, 1,
-0.6387985, 0.2190277, -1.378288, 1, 0, 0, 1, 1,
-0.6325979, 0.7829781, -1.152375, 0, 0, 0, 1, 1,
-0.6322114, 0.5722973, -1.040116, 0, 0, 0, 1, 1,
-0.628507, 0.1305414, -1.466694, 0, 0, 0, 1, 1,
-0.6274136, -0.3304052, -0.9165707, 0, 0, 0, 1, 1,
-0.6266208, -0.4439799, -0.07016461, 0, 0, 0, 1, 1,
-0.6218013, 0.8258989, -2.555497, 0, 0, 0, 1, 1,
-0.6174546, 0.1501891, -1.529968, 0, 0, 0, 1, 1,
-0.613153, -0.3481317, -3.459164, 1, 1, 1, 1, 1,
-0.6116105, -0.8972341, -2.395431, 1, 1, 1, 1, 1,
-0.6114242, 0.8031719, -0.7567724, 1, 1, 1, 1, 1,
-0.6091436, -0.4288571, -1.78146, 1, 1, 1, 1, 1,
-0.6081678, -0.2818647, -1.859504, 1, 1, 1, 1, 1,
-0.6075041, -0.9813894, -1.566195, 1, 1, 1, 1, 1,
-0.5961474, -0.03614929, -2.728221, 1, 1, 1, 1, 1,
-0.5925993, -0.7194447, -2.857997, 1, 1, 1, 1, 1,
-0.5920062, 0.05016673, 0.04309909, 1, 1, 1, 1, 1,
-0.589675, 0.3935574, -1.261828, 1, 1, 1, 1, 1,
-0.5848622, 0.03124445, -0.5489122, 1, 1, 1, 1, 1,
-0.5813955, -1.060562, -4.167141, 1, 1, 1, 1, 1,
-0.5803355, 0.6031525, -2.615146, 1, 1, 1, 1, 1,
-0.5800719, 0.3089639, -0.8063102, 1, 1, 1, 1, 1,
-0.5731598, -0.5032824, -1.319258, 1, 1, 1, 1, 1,
-0.5719745, -1.073301, -4.473443, 0, 0, 1, 1, 1,
-0.5691807, -0.09524713, -4.051557, 1, 0, 0, 1, 1,
-0.5669939, -0.743071, -1.862933, 1, 0, 0, 1, 1,
-0.5659707, -0.8105882, -2.990729, 1, 0, 0, 1, 1,
-0.5655581, -1.277989, -2.418393, 1, 0, 0, 1, 1,
-0.5622925, 0.6095455, 0.05274312, 1, 0, 0, 1, 1,
-0.5610483, -0.06609386, -2.203756, 0, 0, 0, 1, 1,
-0.5536022, 0.2158408, -1.016048, 0, 0, 0, 1, 1,
-0.5498788, 0.9941595, -0.7413663, 0, 0, 0, 1, 1,
-0.5450072, 0.1809614, -2.571553, 0, 0, 0, 1, 1,
-0.5441558, -0.3355576, -2.476601, 0, 0, 0, 1, 1,
-0.5401371, 0.9225041, -1.089856, 0, 0, 0, 1, 1,
-0.5338217, 1.022196, 0.1390069, 0, 0, 0, 1, 1,
-0.5291403, -0.2159335, -2.188048, 1, 1, 1, 1, 1,
-0.5285154, 0.009035304, -2.093287, 1, 1, 1, 1, 1,
-0.5168991, 1.468198, -1.054029, 1, 1, 1, 1, 1,
-0.5162835, -0.6463296, -2.906022, 1, 1, 1, 1, 1,
-0.5151228, -1.202822, -1.670593, 1, 1, 1, 1, 1,
-0.5141645, 0.940124, -0.2841348, 1, 1, 1, 1, 1,
-0.5126284, -0.6940011, -1.764094, 1, 1, 1, 1, 1,
-0.5104116, 1.300631, -0.1329903, 1, 1, 1, 1, 1,
-0.5088214, 0.6196293, -0.4170574, 1, 1, 1, 1, 1,
-0.5072734, 0.6156564, -1.414523, 1, 1, 1, 1, 1,
-0.505276, -0.7414779, -2.694039, 1, 1, 1, 1, 1,
-0.5006152, -0.7031896, -1.087533, 1, 1, 1, 1, 1,
-0.4961064, -0.1439295, -2.125574, 1, 1, 1, 1, 1,
-0.4941329, -0.3625427, -2.296675, 1, 1, 1, 1, 1,
-0.4864993, -0.08525296, -0.2311363, 1, 1, 1, 1, 1,
-0.4803912, -0.1187863, -3.762861, 0, 0, 1, 1, 1,
-0.4797233, -0.2199436, -2.395254, 1, 0, 0, 1, 1,
-0.4739937, -0.6283233, -1.592315, 1, 0, 0, 1, 1,
-0.4717237, -0.54985, -1.412754, 1, 0, 0, 1, 1,
-0.466063, 0.543965, -2.483263, 1, 0, 0, 1, 1,
-0.4659887, 2.313227, 1.377767, 1, 0, 0, 1, 1,
-0.4635035, -1.69555, -1.94804, 0, 0, 0, 1, 1,
-0.4586181, 0.1743397, -0.7475007, 0, 0, 0, 1, 1,
-0.4561445, 0.5504119, -0.4574885, 0, 0, 0, 1, 1,
-0.4552192, 0.7662037, -0.2241547, 0, 0, 0, 1, 1,
-0.4544583, -0.7285168, -2.053999, 0, 0, 0, 1, 1,
-0.4528465, 1.047607, 1.045257, 0, 0, 0, 1, 1,
-0.4512852, 1.723655, -1.341335, 0, 0, 0, 1, 1,
-0.4506763, 0.522864, -2.412449, 1, 1, 1, 1, 1,
-0.4480467, -0.4478785, -4.263813, 1, 1, 1, 1, 1,
-0.4477703, -0.2343261, -2.050535, 1, 1, 1, 1, 1,
-0.4441675, 1.324336, -0.5391169, 1, 1, 1, 1, 1,
-0.4354744, 0.7895405, -1.331645, 1, 1, 1, 1, 1,
-0.4344778, 0.6755784, -1.704586, 1, 1, 1, 1, 1,
-0.4275406, -0.05578677, -1.372499, 1, 1, 1, 1, 1,
-0.4212669, -0.4038026, -2.413168, 1, 1, 1, 1, 1,
-0.4180011, -0.5007119, -2.180188, 1, 1, 1, 1, 1,
-0.4154023, 0.6392927, -0.7568393, 1, 1, 1, 1, 1,
-0.4132915, -0.9368067, -2.290614, 1, 1, 1, 1, 1,
-0.4113593, -0.1608917, -1.623961, 1, 1, 1, 1, 1,
-0.4087798, 0.9179599, 0.1697465, 1, 1, 1, 1, 1,
-0.4061424, -0.3907573, -1.097969, 1, 1, 1, 1, 1,
-0.4051171, -0.6347104, -2.332276, 1, 1, 1, 1, 1,
-0.3880458, 1.229341, -1.472007, 0, 0, 1, 1, 1,
-0.3848086, -1.387029, -2.743696, 1, 0, 0, 1, 1,
-0.3842528, 0.9175076, -0.7330515, 1, 0, 0, 1, 1,
-0.3827735, 1.513191, -1.234361, 1, 0, 0, 1, 1,
-0.3825556, 0.993337, -0.2780614, 1, 0, 0, 1, 1,
-0.3786021, -0.938029, -3.707782, 1, 0, 0, 1, 1,
-0.3773223, -0.8817632, -2.879262, 0, 0, 0, 1, 1,
-0.3771179, 0.4215823, 0.02979426, 0, 0, 0, 1, 1,
-0.3756339, -1.571445, -2.67392, 0, 0, 0, 1, 1,
-0.3732293, 0.06222666, -2.422837, 0, 0, 0, 1, 1,
-0.3708047, 0.8890494, -0.02342471, 0, 0, 0, 1, 1,
-0.3696917, -2.202392, -3.41731, 0, 0, 0, 1, 1,
-0.3647867, 1.473274, 0.6826975, 0, 0, 0, 1, 1,
-0.3636961, 0.1899713, 1.027119, 1, 1, 1, 1, 1,
-0.3628602, -1.301993, -1.814554, 1, 1, 1, 1, 1,
-0.3627287, 1.229306, -0.2738974, 1, 1, 1, 1, 1,
-0.3627208, 0.0643146, -1.143906, 1, 1, 1, 1, 1,
-0.3613569, 0.4582947, -0.8923081, 1, 1, 1, 1, 1,
-0.3548372, -0.2976483, -2.321949, 1, 1, 1, 1, 1,
-0.3493161, -0.1188522, -2.704059, 1, 1, 1, 1, 1,
-0.3479094, 1.033199, -0.9908139, 1, 1, 1, 1, 1,
-0.3416568, 1.149401, -0.5486183, 1, 1, 1, 1, 1,
-0.3411976, -2.377411, -1.035435, 1, 1, 1, 1, 1,
-0.3396414, 0.5309945, 0.6294336, 1, 1, 1, 1, 1,
-0.3358407, 0.4284816, -2.303396, 1, 1, 1, 1, 1,
-0.3321546, 0.8928957, -0.04047499, 1, 1, 1, 1, 1,
-0.3307684, -0.4139898, -2.826967, 1, 1, 1, 1, 1,
-0.3272602, 0.7532984, -0.05890698, 1, 1, 1, 1, 1,
-0.3215219, -2.017272, -2.367448, 0, 0, 1, 1, 1,
-0.3205862, 0.3560167, -1.078771, 1, 0, 0, 1, 1,
-0.3205596, 0.8862587, 0.2291531, 1, 0, 0, 1, 1,
-0.3194366, -0.1688368, -2.899475, 1, 0, 0, 1, 1,
-0.3193029, -0.4915135, -2.938535, 1, 0, 0, 1, 1,
-0.3186651, 1.811798, 0.5249218, 1, 0, 0, 1, 1,
-0.3174807, -0.9930969, -3.314039, 0, 0, 0, 1, 1,
-0.3174325, -0.4201045, -2.263774, 0, 0, 0, 1, 1,
-0.3087148, 0.1215913, -0.6238189, 0, 0, 0, 1, 1,
-0.2991397, -0.1305198, -3.72872, 0, 0, 0, 1, 1,
-0.2987666, -1.361126, -2.275666, 0, 0, 0, 1, 1,
-0.2903392, 0.6772461, -0.9047312, 0, 0, 0, 1, 1,
-0.2879234, -0.1084289, -0.7966782, 0, 0, 0, 1, 1,
-0.286506, 0.4510969, 0.390601, 1, 1, 1, 1, 1,
-0.286369, 0.1762188, -1.079701, 1, 1, 1, 1, 1,
-0.2825302, -0.2569123, -3.269894, 1, 1, 1, 1, 1,
-0.281249, -0.6022345, -1.117399, 1, 1, 1, 1, 1,
-0.2787146, -1.33854, -3.658151, 1, 1, 1, 1, 1,
-0.2743917, -0.2781745, -2.757545, 1, 1, 1, 1, 1,
-0.2691667, -0.1535605, -3.332696, 1, 1, 1, 1, 1,
-0.2642388, 0.02070595, -3.106912, 1, 1, 1, 1, 1,
-0.2628716, 0.2148414, -0.5731708, 1, 1, 1, 1, 1,
-0.2609852, 1.241415, -1.303168, 1, 1, 1, 1, 1,
-0.2607855, 1.309582, -1.159792, 1, 1, 1, 1, 1,
-0.2599925, -0.489484, -2.991776, 1, 1, 1, 1, 1,
-0.2594022, 1.873802, 0.3229714, 1, 1, 1, 1, 1,
-0.2586316, -3.240979, -3.344702, 1, 1, 1, 1, 1,
-0.2509142, 0.3039058, -1.908262, 1, 1, 1, 1, 1,
-0.2498435, 1.397086, 0.2066377, 0, 0, 1, 1, 1,
-0.2493177, 0.5397208, -1.784674, 1, 0, 0, 1, 1,
-0.2462006, -0.430022, -1.815191, 1, 0, 0, 1, 1,
-0.2416053, -0.2095313, -3.968472, 1, 0, 0, 1, 1,
-0.238406, 1.211543, -0.5700626, 1, 0, 0, 1, 1,
-0.2358111, 1.440761, 0.4946686, 1, 0, 0, 1, 1,
-0.2355984, -0.3268968, -1.874681, 0, 0, 0, 1, 1,
-0.2354348, -0.4460741, -0.8601351, 0, 0, 0, 1, 1,
-0.2342131, 0.4862013, -1.336856, 0, 0, 0, 1, 1,
-0.2340792, -1.377356, -2.694206, 0, 0, 0, 1, 1,
-0.2306204, 0.8448398, -0.6600987, 0, 0, 0, 1, 1,
-0.2293952, 1.623697, -1.079862, 0, 0, 0, 1, 1,
-0.2281148, -0.07274921, -3.751961, 0, 0, 0, 1, 1,
-0.2267849, -2.314468, -3.103565, 1, 1, 1, 1, 1,
-0.2267422, -0.6795447, -2.126727, 1, 1, 1, 1, 1,
-0.2228919, 1.117591, 0.1985824, 1, 1, 1, 1, 1,
-0.2197508, 1.198864, -0.1745057, 1, 1, 1, 1, 1,
-0.2163605, -1.047045, -2.569191, 1, 1, 1, 1, 1,
-0.2052326, 0.565139, 2.167743, 1, 1, 1, 1, 1,
-0.2008228, -0.6958109, -3.178869, 1, 1, 1, 1, 1,
-0.1990765, 1.132859, -0.1953272, 1, 1, 1, 1, 1,
-0.1985439, -0.3469582, -1.124647, 1, 1, 1, 1, 1,
-0.197909, 0.4805891, -0.336805, 1, 1, 1, 1, 1,
-0.1938189, -1.634545, -3.617079, 1, 1, 1, 1, 1,
-0.19165, 0.9256931, -2.821716, 1, 1, 1, 1, 1,
-0.1914661, -1.48494, -2.471805, 1, 1, 1, 1, 1,
-0.1903344, -0.6035418, -2.131219, 1, 1, 1, 1, 1,
-0.1868793, -0.2187392, -2.366421, 1, 1, 1, 1, 1,
-0.1868191, -1.771388, -2.606525, 0, 0, 1, 1, 1,
-0.1810039, -1.262154, -4.61713, 1, 0, 0, 1, 1,
-0.1790717, 0.9332557, 0.5624033, 1, 0, 0, 1, 1,
-0.1787284, 0.3740732, -0.5060939, 1, 0, 0, 1, 1,
-0.1777835, -0.2951521, -3.942202, 1, 0, 0, 1, 1,
-0.1738884, -2.986451, -3.289952, 1, 0, 0, 1, 1,
-0.1727054, -2.046639, -2.435807, 0, 0, 0, 1, 1,
-0.170832, 1.079035, -1.304854, 0, 0, 0, 1, 1,
-0.1675764, 1.116039, -1.684726, 0, 0, 0, 1, 1,
-0.1662943, -0.7731909, -1.08374, 0, 0, 0, 1, 1,
-0.1655313, -1.789458, -3.727078, 0, 0, 0, 1, 1,
-0.1627076, 0.05376013, -2.013047, 0, 0, 0, 1, 1,
-0.1620666, -0.9699669, -3.670512, 0, 0, 0, 1, 1,
-0.1608455, 0.5487384, -0.4100429, 1, 1, 1, 1, 1,
-0.1577151, -0.7423574, -2.212549, 1, 1, 1, 1, 1,
-0.1521075, 0.3237641, -0.6958457, 1, 1, 1, 1, 1,
-0.1450449, 0.1393729, -0.4224025, 1, 1, 1, 1, 1,
-0.1410594, -0.4822901, -1.979709, 1, 1, 1, 1, 1,
-0.1372708, -0.5216988, -1.564951, 1, 1, 1, 1, 1,
-0.1371985, -0.0553883, -1.611703, 1, 1, 1, 1, 1,
-0.1365352, -1.062646, -1.168808, 1, 1, 1, 1, 1,
-0.1352659, 0.3672637, -0.3146988, 1, 1, 1, 1, 1,
-0.1333846, 0.6575832, 0.005596691, 1, 1, 1, 1, 1,
-0.1326126, -0.5667994, -3.749144, 1, 1, 1, 1, 1,
-0.129527, 0.00014677, -0.8613777, 1, 1, 1, 1, 1,
-0.1284567, 0.1908978, -1.412105, 1, 1, 1, 1, 1,
-0.1208127, 0.1087038, -0.5099804, 1, 1, 1, 1, 1,
-0.1205378, -0.5827665, -3.971817, 1, 1, 1, 1, 1,
-0.1196952, -1.914281, -3.976345, 0, 0, 1, 1, 1,
-0.1132253, 0.9313058, -0.5323593, 1, 0, 0, 1, 1,
-0.1129375, -0.7438333, -2.548692, 1, 0, 0, 1, 1,
-0.1120908, -0.08295657, -0.5859637, 1, 0, 0, 1, 1,
-0.110521, 1.77918, 0.13678, 1, 0, 0, 1, 1,
-0.1076391, -0.1487937, -2.975398, 1, 0, 0, 1, 1,
-0.1067858, 1.562687, -1.613017, 0, 0, 0, 1, 1,
-0.1055594, -0.04814612, -2.699109, 0, 0, 0, 1, 1,
-0.1049322, -0.1895432, -3.310321, 0, 0, 0, 1, 1,
-0.1048718, -0.3098516, -3.421221, 0, 0, 0, 1, 1,
-0.1034801, -0.5091305, -2.175992, 0, 0, 0, 1, 1,
-0.09520562, 0.3921611, 1.223273, 0, 0, 0, 1, 1,
-0.09343991, -0.9890533, -2.811109, 0, 0, 0, 1, 1,
-0.09156922, -1.527116, -2.657805, 1, 1, 1, 1, 1,
-0.08165734, 0.3083589, -0.9780966, 1, 1, 1, 1, 1,
-0.07755945, 1.180079, 0.09401136, 1, 1, 1, 1, 1,
-0.07648115, -0.4349566, -4.160357, 1, 1, 1, 1, 1,
-0.07532396, 0.3333005, 0.8523802, 1, 1, 1, 1, 1,
-0.07458195, -0.3988381, -3.223066, 1, 1, 1, 1, 1,
-0.07057469, 1.569426, -1.1023, 1, 1, 1, 1, 1,
-0.0694964, 2.252162, -1.093481, 1, 1, 1, 1, 1,
-0.06934652, 0.08907007, -2.036268, 1, 1, 1, 1, 1,
-0.06856535, 0.4751175, -0.6282765, 1, 1, 1, 1, 1,
-0.06101315, 0.9119096, -0.1967554, 1, 1, 1, 1, 1,
-0.05559205, -0.07025912, -2.026398, 1, 1, 1, 1, 1,
-0.04420283, -0.1703498, -4.879856, 1, 1, 1, 1, 1,
-0.04217616, 1.492574, 0.05658025, 1, 1, 1, 1, 1,
-0.03252843, -1.244579, -2.653595, 1, 1, 1, 1, 1,
-0.0307326, -1.455943, -3.950518, 0, 0, 1, 1, 1,
-0.02988526, -0.3381068, -4.463829, 1, 0, 0, 1, 1,
-0.0278036, 0.8173256, -0.4911452, 1, 0, 0, 1, 1,
-0.02655867, 0.3733759, 0.6878896, 1, 0, 0, 1, 1,
-0.01928995, 0.02504191, 1.315918, 1, 0, 0, 1, 1,
-0.0169925, 1.461744, 1.67059, 1, 0, 0, 1, 1,
-0.01580064, 1.707228, -0.4147389, 0, 0, 0, 1, 1,
-0.0119725, -0.1955652, -3.348003, 0, 0, 0, 1, 1,
-0.01109629, 0.1397958, -1.072729, 0, 0, 0, 1, 1,
-0.00949906, 0.4227085, 0.2964177, 0, 0, 0, 1, 1,
-0.002550327, -1.284659, -4.148326, 0, 0, 0, 1, 1,
-0.002164805, 1.033214, -1.507731, 0, 0, 0, 1, 1,
-0.001643751, 0.8213912, -0.213552, 0, 0, 0, 1, 1,
0.002723819, -0.3074935, 2.813464, 1, 1, 1, 1, 1,
0.003113381, -2.110796, 2.159113, 1, 1, 1, 1, 1,
0.005596574, 0.03021512, 0.8019464, 1, 1, 1, 1, 1,
0.008526524, 0.06152929, 0.5572147, 1, 1, 1, 1, 1,
0.01640047, 0.1916573, 3.456667, 1, 1, 1, 1, 1,
0.0172522, -0.1232777, 1.27844, 1, 1, 1, 1, 1,
0.01726813, 1.421061, 0.9105938, 1, 1, 1, 1, 1,
0.01852157, 1.116768, -0.8473854, 1, 1, 1, 1, 1,
0.02049433, 0.07792036, 0.5772262, 1, 1, 1, 1, 1,
0.02869845, -1.100343, 4.002964, 1, 1, 1, 1, 1,
0.0288466, -1.617793, 2.629988, 1, 1, 1, 1, 1,
0.02891927, -0.8916302, 3.85499, 1, 1, 1, 1, 1,
0.02998463, 0.3954104, 0.7793085, 1, 1, 1, 1, 1,
0.03366448, 1.979005, 0.3809096, 1, 1, 1, 1, 1,
0.03566669, -2.280629, 2.98778, 1, 1, 1, 1, 1,
0.03640946, -1.796678, 4.335453, 0, 0, 1, 1, 1,
0.03909262, 0.1583673, 0.09430184, 1, 0, 0, 1, 1,
0.04165732, -0.9223228, 2.830362, 1, 0, 0, 1, 1,
0.04263965, -0.3658158, 2.011366, 1, 0, 0, 1, 1,
0.04743795, -1.95137, 3.718278, 1, 0, 0, 1, 1,
0.04832991, 1.656289, 1.124583, 1, 0, 0, 1, 1,
0.05071021, -1.769184, 1.5902, 0, 0, 0, 1, 1,
0.05186673, 2.579719, 0.1417903, 0, 0, 0, 1, 1,
0.0548522, -1.414303, 3.753006, 0, 0, 0, 1, 1,
0.05548565, 0.533, -0.4285195, 0, 0, 0, 1, 1,
0.05904527, -0.4461524, 2.090197, 0, 0, 0, 1, 1,
0.06448595, 1.070609, -1.051703, 0, 0, 0, 1, 1,
0.06535386, 0.4328492, 0.2191702, 0, 0, 0, 1, 1,
0.06846011, 1.257054, 0.5119595, 1, 1, 1, 1, 1,
0.07217195, -0.4468498, 3.322816, 1, 1, 1, 1, 1,
0.08261961, -2.079418, 3.495393, 1, 1, 1, 1, 1,
0.08294644, -1.120895, 3.753456, 1, 1, 1, 1, 1,
0.08612709, -1.33138, 5.512744, 1, 1, 1, 1, 1,
0.08624852, -0.1417757, 2.338341, 1, 1, 1, 1, 1,
0.08710343, 1.218115, -0.2774467, 1, 1, 1, 1, 1,
0.09286365, -0.8016808, 4.445587, 1, 1, 1, 1, 1,
0.0933579, 0.5086398, 1.361814, 1, 1, 1, 1, 1,
0.09398333, -2.201471, 2.648473, 1, 1, 1, 1, 1,
0.09401466, 1.167638, 0.6070472, 1, 1, 1, 1, 1,
0.09795306, 2.663779, -0.9747059, 1, 1, 1, 1, 1,
0.09836328, 0.01232511, 0.5975134, 1, 1, 1, 1, 1,
0.09891608, 0.7497671, -0.1763766, 1, 1, 1, 1, 1,
0.1021011, -0.8431917, 3.726537, 1, 1, 1, 1, 1,
0.1037318, 0.6553573, 1.058608, 0, 0, 1, 1, 1,
0.1048349, -0.6734459, 2.445346, 1, 0, 0, 1, 1,
0.1062895, -0.9445451, 2.868147, 1, 0, 0, 1, 1,
0.1156436, -1.434739, 2.652609, 1, 0, 0, 1, 1,
0.1232506, 0.1432869, 0.09721102, 1, 0, 0, 1, 1,
0.1278607, 0.3925321, -1.12836, 1, 0, 0, 1, 1,
0.1326056, -0.8885431, 3.777862, 0, 0, 0, 1, 1,
0.1370587, 1.531115, 1.839946, 0, 0, 0, 1, 1,
0.1401355, 2.285255, -0.2525539, 0, 0, 0, 1, 1,
0.1401743, -0.5071793, 1.910895, 0, 0, 0, 1, 1,
0.1403896, 0.7242428, 1.949494, 0, 0, 0, 1, 1,
0.1408327, 0.5524669, 1.498832, 0, 0, 0, 1, 1,
0.1418181, 0.5068977, -1.070157, 0, 0, 0, 1, 1,
0.1441707, 0.4249222, 0.9494839, 1, 1, 1, 1, 1,
0.1451892, -0.2647292, 2.999672, 1, 1, 1, 1, 1,
0.149293, 0.6711109, 0.5871324, 1, 1, 1, 1, 1,
0.1518727, -0.5596963, 1.557099, 1, 1, 1, 1, 1,
0.1537035, -1.042231, 2.494922, 1, 1, 1, 1, 1,
0.1548956, -0.009293625, 2.087769, 1, 1, 1, 1, 1,
0.1554159, 0.3891577, 0.07857287, 1, 1, 1, 1, 1,
0.1623987, 0.03655689, 3.540192, 1, 1, 1, 1, 1,
0.1651997, -0.06508675, 3.136258, 1, 1, 1, 1, 1,
0.1708635, 0.8461213, 0.3995203, 1, 1, 1, 1, 1,
0.1746965, -1.045696, 2.295517, 1, 1, 1, 1, 1,
0.17805, 2.212715, 0.06364188, 1, 1, 1, 1, 1,
0.1835106, 2.158429, -0.7254416, 1, 1, 1, 1, 1,
0.1871718, -0.307335, 3.15206, 1, 1, 1, 1, 1,
0.1873932, -0.7197795, 6.103771, 1, 1, 1, 1, 1,
0.1911136, 0.01054287, 2.300046, 0, 0, 1, 1, 1,
0.1914666, -0.05735818, 2.055954, 1, 0, 0, 1, 1,
0.1917278, -1.324877, 2.972414, 1, 0, 0, 1, 1,
0.1958323, 1.285171, -0.9419749, 1, 0, 0, 1, 1,
0.1958654, -1.201211, 2.892598, 1, 0, 0, 1, 1,
0.1975011, -0.4971636, 3.30282, 1, 0, 0, 1, 1,
0.2004206, 0.6048137, 0.5530353, 0, 0, 0, 1, 1,
0.2004917, 1.418211, -1.123268, 0, 0, 0, 1, 1,
0.2020158, 0.0786847, 0.7912924, 0, 0, 0, 1, 1,
0.2020414, -1.334494, 2.848164, 0, 0, 0, 1, 1,
0.2024601, 0.4447822, 1.307125, 0, 0, 0, 1, 1,
0.2037973, 0.2110751, 1.958358, 0, 0, 0, 1, 1,
0.2068824, -0.1699034, 1.656003, 0, 0, 0, 1, 1,
0.2111869, -0.9058502, 5.095968, 1, 1, 1, 1, 1,
0.2133429, -1.291501, 3.273245, 1, 1, 1, 1, 1,
0.2143258, 0.462935, 0.7054412, 1, 1, 1, 1, 1,
0.2162013, 0.1038931, 0.9231876, 1, 1, 1, 1, 1,
0.2182558, -2.465398, 3.027501, 1, 1, 1, 1, 1,
0.2187728, -2.310315, 2.734276, 1, 1, 1, 1, 1,
0.2224318, 0.2268005, 1.172075, 1, 1, 1, 1, 1,
0.2224648, 1.299309, 0.2900836, 1, 1, 1, 1, 1,
0.2230085, -1.03082, 1.565726, 1, 1, 1, 1, 1,
0.2254075, 1.196701, -0.1829205, 1, 1, 1, 1, 1,
0.2298291, -0.01761978, 1.658679, 1, 1, 1, 1, 1,
0.2308581, -1.061451, 3.364688, 1, 1, 1, 1, 1,
0.2340274, 0.3766946, 0.4880331, 1, 1, 1, 1, 1,
0.2406378, -0.6780699, 2.740045, 1, 1, 1, 1, 1,
0.2459687, -0.8232858, 4.098968, 1, 1, 1, 1, 1,
0.2462336, 0.4804244, 0.8721628, 0, 0, 1, 1, 1,
0.2470193, -1.281828, 3.4473, 1, 0, 0, 1, 1,
0.2539466, -0.520487, 4.650276, 1, 0, 0, 1, 1,
0.257225, -2.616713, 2.76452, 1, 0, 0, 1, 1,
0.2650795, 0.7728482, -1.888653, 1, 0, 0, 1, 1,
0.2695424, 1.517831, 1.329189, 1, 0, 0, 1, 1,
0.2698314, -0.1638014, 1.918823, 0, 0, 0, 1, 1,
0.2705551, 0.3274946, 0.08210055, 0, 0, 0, 1, 1,
0.2715302, 0.4381463, 3.465358, 0, 0, 0, 1, 1,
0.27301, 0.2827256, -0.1633014, 0, 0, 0, 1, 1,
0.2746676, -1.185731, 3.721991, 0, 0, 0, 1, 1,
0.2750527, 0.1066488, 2.822431, 0, 0, 0, 1, 1,
0.277781, -1.395624, 3.554221, 0, 0, 0, 1, 1,
0.28501, -1.155435, 2.942136, 1, 1, 1, 1, 1,
0.2880493, -0.4601895, 3.746265, 1, 1, 1, 1, 1,
0.2914442, 1.072758, -0.01618452, 1, 1, 1, 1, 1,
0.2939234, -0.188643, 1.626794, 1, 1, 1, 1, 1,
0.2996678, -1.225774, 2.420247, 1, 1, 1, 1, 1,
0.3026513, 1.107326, -0.2364698, 1, 1, 1, 1, 1,
0.3038694, -0.7228757, 2.081697, 1, 1, 1, 1, 1,
0.3109871, -1.930357, 2.587518, 1, 1, 1, 1, 1,
0.3122143, -0.9240043, 2.623243, 1, 1, 1, 1, 1,
0.3137913, 0.5337009, 0.4576279, 1, 1, 1, 1, 1,
0.3158707, 1.501597, 0.7096438, 1, 1, 1, 1, 1,
0.3160387, -0.0848178, 1.41928, 1, 1, 1, 1, 1,
0.3178044, -0.5394307, 2.289428, 1, 1, 1, 1, 1,
0.330978, 0.5754082, 0.4525058, 1, 1, 1, 1, 1,
0.3329511, -1.74329, 1.255943, 1, 1, 1, 1, 1,
0.3339547, -0.3503106, 0.3384193, 0, 0, 1, 1, 1,
0.3341186, 0.476665, -0.1709278, 1, 0, 0, 1, 1,
0.3368498, -0.2869474, 2.777595, 1, 0, 0, 1, 1,
0.338332, 0.05890635, 0.7230698, 1, 0, 0, 1, 1,
0.3434312, 0.1150945, 1.716646, 1, 0, 0, 1, 1,
0.3451651, 0.8834517, -0.1013723, 1, 0, 0, 1, 1,
0.3451897, 1.032718, -0.1090142, 0, 0, 0, 1, 1,
0.3466141, -0.4078382, 1.268902, 0, 0, 0, 1, 1,
0.3488759, 1.132235, 1.941931, 0, 0, 0, 1, 1,
0.3503127, -1.738146, 1.848811, 0, 0, 0, 1, 1,
0.3507335, 0.262073, -0.1419277, 0, 0, 0, 1, 1,
0.3525283, 0.445763, 0.2482949, 0, 0, 0, 1, 1,
0.3577155, -0.3279837, 3.42786, 0, 0, 0, 1, 1,
0.3608785, 0.4813137, 1.557593, 1, 1, 1, 1, 1,
0.3617357, 0.951885, 0.244184, 1, 1, 1, 1, 1,
0.3629412, 0.005166114, 1.940647, 1, 1, 1, 1, 1,
0.3637056, -2.337487, 2.511083, 1, 1, 1, 1, 1,
0.3674013, 0.04406722, -0.2215161, 1, 1, 1, 1, 1,
0.3685048, -0.2075286, 0.2153966, 1, 1, 1, 1, 1,
0.370854, -0.6622523, 3.34347, 1, 1, 1, 1, 1,
0.3731588, 0.1817625, 1.816037, 1, 1, 1, 1, 1,
0.376511, 0.3130967, 1.160425, 1, 1, 1, 1, 1,
0.3784005, -0.3358918, 4.295012, 1, 1, 1, 1, 1,
0.3785793, 1.505316, 1.786512, 1, 1, 1, 1, 1,
0.3789431, 0.2812954, 2.655998, 1, 1, 1, 1, 1,
0.3811119, -1.887434, 1.370606, 1, 1, 1, 1, 1,
0.3811248, 1.454162, 0.6869792, 1, 1, 1, 1, 1,
0.3844007, -0.395036, 2.0148, 1, 1, 1, 1, 1,
0.3879109, -0.8812753, 1.331565, 0, 0, 1, 1, 1,
0.3907632, -0.9574465, 2.849346, 1, 0, 0, 1, 1,
0.3916919, 0.2945408, 0.4710716, 1, 0, 0, 1, 1,
0.3922753, -0.7067033, 2.380239, 1, 0, 0, 1, 1,
0.3976581, 0.3972369, 0.7374889, 1, 0, 0, 1, 1,
0.39998, -1.250225, 2.008394, 1, 0, 0, 1, 1,
0.4018399, 0.8092151, 1.27786, 0, 0, 0, 1, 1,
0.4063307, 0.5803286, 0.935333, 0, 0, 0, 1, 1,
0.4108447, -0.8388574, 3.394476, 0, 0, 0, 1, 1,
0.4133423, -0.5089647, 2.729584, 0, 0, 0, 1, 1,
0.4147664, 0.001693896, 0.7804882, 0, 0, 0, 1, 1,
0.4169739, 0.1034069, 1.021831, 0, 0, 0, 1, 1,
0.4191184, -0.4370285, 2.651306, 0, 0, 0, 1, 1,
0.4209389, -0.04687089, 1.170982, 1, 1, 1, 1, 1,
0.4222382, -0.5768839, 3.149382, 1, 1, 1, 1, 1,
0.4241831, 0.5559989, 1.776122, 1, 1, 1, 1, 1,
0.4249045, 1.408628, -0.2196485, 1, 1, 1, 1, 1,
0.4280631, 0.9426342, -0.1940667, 1, 1, 1, 1, 1,
0.4300089, 0.6654836, 0.4190527, 1, 1, 1, 1, 1,
0.4316553, 0.9529217, 0.9817308, 1, 1, 1, 1, 1,
0.4340248, 0.08916076, 1.468431, 1, 1, 1, 1, 1,
0.439075, -0.421989, 3.248219, 1, 1, 1, 1, 1,
0.4393537, 0.6305361, 1.188578, 1, 1, 1, 1, 1,
0.4457515, -0.09581875, 0.9481823, 1, 1, 1, 1, 1,
0.4485739, -0.09385923, 1.44927, 1, 1, 1, 1, 1,
0.4486242, 2.47038, 0.5025509, 1, 1, 1, 1, 1,
0.4497789, -0.4832253, 3.681702, 1, 1, 1, 1, 1,
0.4544026, -0.4125716, 4.987145, 1, 1, 1, 1, 1,
0.4568173, 0.8681867, 0.7380928, 0, 0, 1, 1, 1,
0.4576395, 0.5791861, 1.352654, 1, 0, 0, 1, 1,
0.4588633, -0.4198943, 3.358665, 1, 0, 0, 1, 1,
0.4607206, 1.53581, -1.10577, 1, 0, 0, 1, 1,
0.4644702, -0.040926, 1.885121, 1, 0, 0, 1, 1,
0.4707121, -1.064157, 3.032223, 1, 0, 0, 1, 1,
0.4768267, 3.085402, 0.6583368, 0, 0, 0, 1, 1,
0.4777134, 0.06696218, 3.464484, 0, 0, 0, 1, 1,
0.4808591, -1.440659, 2.405188, 0, 0, 0, 1, 1,
0.4850612, -0.6530685, 4.332471, 0, 0, 0, 1, 1,
0.5065988, -0.2394511, 4.55757, 0, 0, 0, 1, 1,
0.5111534, 0.8222119, 0.4803742, 0, 0, 0, 1, 1,
0.5131499, 0.05738406, 1.937359, 0, 0, 0, 1, 1,
0.5177881, -0.1576238, 2.790314, 1, 1, 1, 1, 1,
0.5208158, 0.280397, 1.080753, 1, 1, 1, 1, 1,
0.5317602, -1.228539, 1.65532, 1, 1, 1, 1, 1,
0.541218, 0.650075, 1.711543, 1, 1, 1, 1, 1,
0.5456603, 0.2490255, 1.130122, 1, 1, 1, 1, 1,
0.548285, 0.3051748, 1.084464, 1, 1, 1, 1, 1,
0.5515895, -1.420481, 2.163109, 1, 1, 1, 1, 1,
0.5519121, -1.570531, 4.616687, 1, 1, 1, 1, 1,
0.5528859, 0.3514152, 0.7673468, 1, 1, 1, 1, 1,
0.5533777, -0.2919648, 3.34594, 1, 1, 1, 1, 1,
0.5543469, -0.7047692, 3.081969, 1, 1, 1, 1, 1,
0.5551751, 0.5407606, 1.337219, 1, 1, 1, 1, 1,
0.5607679, -1.431439, 3.245608, 1, 1, 1, 1, 1,
0.5618416, -0.8513961, 1.313316, 1, 1, 1, 1, 1,
0.5625455, -0.9840174, 4.28036, 1, 1, 1, 1, 1,
0.5642483, 0.5096946, 2.179891, 0, 0, 1, 1, 1,
0.5717487, -1.158705, 0.9402492, 1, 0, 0, 1, 1,
0.5755306, -1.816825, 0.8457276, 1, 0, 0, 1, 1,
0.575799, -0.3860745, 2.24703, 1, 0, 0, 1, 1,
0.5822169, -1.700476, 3.091541, 1, 0, 0, 1, 1,
0.5845146, -0.9044505, 3.674849, 1, 0, 0, 1, 1,
0.5884253, 0.2921674, 0.9820285, 0, 0, 0, 1, 1,
0.5948813, -1.060439, 0.1820374, 0, 0, 0, 1, 1,
0.5960231, 0.4623261, 0.1723031, 0, 0, 0, 1, 1,
0.5980607, 0.06106162, 2.398982, 0, 0, 0, 1, 1,
0.6004622, 1.015122, 1.199854, 0, 0, 0, 1, 1,
0.6016188, -0.8895604, 1.445408, 0, 0, 0, 1, 1,
0.6019688, -1.263928, 2.722184, 0, 0, 0, 1, 1,
0.6023526, 0.3986086, 0.8005254, 1, 1, 1, 1, 1,
0.6024603, -1.060589, 2.814597, 1, 1, 1, 1, 1,
0.604393, -0.05451849, 1.752707, 1, 1, 1, 1, 1,
0.6049978, -0.9397479, 2.773799, 1, 1, 1, 1, 1,
0.6056952, -0.6696832, 3.203583, 1, 1, 1, 1, 1,
0.6111571, -0.6250181, 1.435098, 1, 1, 1, 1, 1,
0.6143286, 0.5269746, 0.8068526, 1, 1, 1, 1, 1,
0.6144132, 0.4678822, 2.071402, 1, 1, 1, 1, 1,
0.6164703, 0.9115813, 0.2945543, 1, 1, 1, 1, 1,
0.6196879, 0.3930308, 2.344533, 1, 1, 1, 1, 1,
0.622357, -0.4611039, 2.21839, 1, 1, 1, 1, 1,
0.6261522, 0.5238752, 0.02885161, 1, 1, 1, 1, 1,
0.6276466, 0.8729653, 1.631183, 1, 1, 1, 1, 1,
0.6311311, 0.5206422, 1.185005, 1, 1, 1, 1, 1,
0.634443, 0.2053508, 2.265483, 1, 1, 1, 1, 1,
0.6350986, 1.882113, 0.1560738, 0, 0, 1, 1, 1,
0.6447886, 0.275061, 3.265369, 1, 0, 0, 1, 1,
0.6448473, 0.6330243, 1.38431, 1, 0, 0, 1, 1,
0.6552615, 0.06792359, 3.480715, 1, 0, 0, 1, 1,
0.6560697, -0.4975424, 0.7161496, 1, 0, 0, 1, 1,
0.658646, 0.183872, 2.049881, 1, 0, 0, 1, 1,
0.6600863, -0.9287622, 2.493365, 0, 0, 0, 1, 1,
0.6612723, -0.6653533, 1.96913, 0, 0, 0, 1, 1,
0.6614525, 1.23922, 0.7551552, 0, 0, 0, 1, 1,
0.6632446, -0.4840073, 2.258577, 0, 0, 0, 1, 1,
0.6741726, -0.9269489, 0.9564674, 0, 0, 0, 1, 1,
0.6743852, 0.01699341, 2.302469, 0, 0, 0, 1, 1,
0.6767166, 1.246403, 1.114395, 0, 0, 0, 1, 1,
0.6804982, -0.5243448, 2.063677, 1, 1, 1, 1, 1,
0.682797, -0.5287822, 3.972952, 1, 1, 1, 1, 1,
0.6837687, 0.7388766, 1.391973, 1, 1, 1, 1, 1,
0.6848227, -0.5399556, 3.255845, 1, 1, 1, 1, 1,
0.6855016, 2.751751, 0.01612398, 1, 1, 1, 1, 1,
0.6864503, -0.2378513, -0.03399201, 1, 1, 1, 1, 1,
0.6874925, 0.474219, 1.635286, 1, 1, 1, 1, 1,
0.6885261, 0.4285043, 1.336479, 1, 1, 1, 1, 1,
0.699256, 0.6657717, 0.2705886, 1, 1, 1, 1, 1,
0.7064798, 0.9206551, 1.293279, 1, 1, 1, 1, 1,
0.7114999, 1.549464, 0.1448904, 1, 1, 1, 1, 1,
0.7116496, -0.252464, 2.752073, 1, 1, 1, 1, 1,
0.7129995, -0.7721353, 3.564144, 1, 1, 1, 1, 1,
0.7204803, 0.2229106, 1.947954, 1, 1, 1, 1, 1,
0.7214692, 1.175109, 1.873805, 1, 1, 1, 1, 1,
0.7298424, -0.2975089, 2.162906, 0, 0, 1, 1, 1,
0.7324865, -1.898506, 3.089809, 1, 0, 0, 1, 1,
0.735239, 0.9265195, 2.071931, 1, 0, 0, 1, 1,
0.7455193, -0.8202677, 1.974487, 1, 0, 0, 1, 1,
0.7472761, 0.2130643, 0.09835601, 1, 0, 0, 1, 1,
0.7481674, -0.3648521, 1.263222, 1, 0, 0, 1, 1,
0.7511094, 0.3331769, 1.86511, 0, 0, 0, 1, 1,
0.7524836, 0.9820599, -1.016915, 0, 0, 0, 1, 1,
0.7589527, 0.5206046, 0.70959, 0, 0, 0, 1, 1,
0.7594725, -0.4513308, 1.569144, 0, 0, 0, 1, 1,
0.769674, -0.9513067, 0.724636, 0, 0, 0, 1, 1,
0.7717268, -1.035264, 1.42954, 0, 0, 0, 1, 1,
0.7802076, 0.1328953, 1.687085, 0, 0, 0, 1, 1,
0.7830434, 0.5686517, 1.516626, 1, 1, 1, 1, 1,
0.7837805, 0.7852736, -0.1055363, 1, 1, 1, 1, 1,
0.7852395, 1.215936, 0.67894, 1, 1, 1, 1, 1,
0.7869225, -0.9776446, 2.32054, 1, 1, 1, 1, 1,
0.788928, -0.2614674, 1.575813, 1, 1, 1, 1, 1,
0.7913784, -0.7005521, 2.096096, 1, 1, 1, 1, 1,
0.8076211, -0.02909589, 0.8974283, 1, 1, 1, 1, 1,
0.8108684, 2.307698, -0.5114387, 1, 1, 1, 1, 1,
0.8120697, 0.2405393, 3.053945, 1, 1, 1, 1, 1,
0.8150961, 1.489898, 1.268865, 1, 1, 1, 1, 1,
0.8167742, 0.1773787, 0.2738524, 1, 1, 1, 1, 1,
0.8199875, 1.92715, -0.2202591, 1, 1, 1, 1, 1,
0.8216811, 0.8519437, 0.305258, 1, 1, 1, 1, 1,
0.8227482, -1.670977, 3.739013, 1, 1, 1, 1, 1,
0.8237965, 1.910626, 0.1086604, 1, 1, 1, 1, 1,
0.8265263, 0.8830187, 0.2356355, 0, 0, 1, 1, 1,
0.8285056, 0.8504897, 1.320528, 1, 0, 0, 1, 1,
0.8317795, 0.8722227, 0.3142089, 1, 0, 0, 1, 1,
0.8338222, 0.05644908, 2.168793, 1, 0, 0, 1, 1,
0.8368549, 0.3610229, -0.6335084, 1, 0, 0, 1, 1,
0.8415534, -1.781258, 1.552098, 1, 0, 0, 1, 1,
0.8449839, 1.158086, 0.04953713, 0, 0, 0, 1, 1,
0.8592579, -0.8306462, 2.474905, 0, 0, 0, 1, 1,
0.8705645, 1.575928, 0.9996703, 0, 0, 0, 1, 1,
0.8793695, 0.6628486, 0.9395877, 0, 0, 0, 1, 1,
0.8797594, 1.227281, -0.4523711, 0, 0, 0, 1, 1,
0.8810003, 0.2628432, -0.411053, 0, 0, 0, 1, 1,
0.8865101, -0.7365919, 1.016751, 0, 0, 0, 1, 1,
0.8877544, 0.3415464, -0.1354342, 1, 1, 1, 1, 1,
0.8894998, 0.3854845, 2.896709, 1, 1, 1, 1, 1,
0.8902079, -0.4873065, 2.304552, 1, 1, 1, 1, 1,
0.8963749, 0.1697969, 2.1631, 1, 1, 1, 1, 1,
0.9007524, -0.3628359, 1.788964, 1, 1, 1, 1, 1,
0.9019502, -0.3257973, 0.6300501, 1, 1, 1, 1, 1,
0.9022657, 0.02240753, 2.220193, 1, 1, 1, 1, 1,
0.9087648, 0.2863913, 1.269175, 1, 1, 1, 1, 1,
0.916055, 0.3022895, 2.444552, 1, 1, 1, 1, 1,
0.9190282, -1.090702, 1.971594, 1, 1, 1, 1, 1,
0.9194036, -0.2114622, 1.799865, 1, 1, 1, 1, 1,
0.9250044, -0.8416877, 4.247622, 1, 1, 1, 1, 1,
0.926666, 0.1735598, 0.5606517, 1, 1, 1, 1, 1,
0.9294561, -1.719083, 2.231903, 1, 1, 1, 1, 1,
0.9302087, -0.5299826, 1.590582, 1, 1, 1, 1, 1,
0.9336919, -0.09479841, 3.536093, 0, 0, 1, 1, 1,
0.9380752, -0.4093768, 0.184864, 1, 0, 0, 1, 1,
0.9381407, 0.1863305, 0.9241757, 1, 0, 0, 1, 1,
0.9433242, -0.4404798, 0.5200703, 1, 0, 0, 1, 1,
0.945282, 1.594322, 0.6789907, 1, 0, 0, 1, 1,
0.9479086, -0.09719484, 1.188284, 1, 0, 0, 1, 1,
0.9482064, 1.213204, 0.3599805, 0, 0, 0, 1, 1,
0.9485644, 0.5358967, 1.49113, 0, 0, 0, 1, 1,
0.9489133, 1.515464, 0.5491544, 0, 0, 0, 1, 1,
0.951076, -0.2726389, 2.324577, 0, 0, 0, 1, 1,
0.9511512, -0.5502494, 2.177473, 0, 0, 0, 1, 1,
0.9564649, -1.377121, 2.161479, 0, 0, 0, 1, 1,
0.9602114, 2.049502, 0.4087937, 0, 0, 0, 1, 1,
0.9650275, 0.8188776, 0.6540587, 1, 1, 1, 1, 1,
0.9670194, 0.3200358, 1.750414, 1, 1, 1, 1, 1,
0.9684587, -1.644156, 3.040605, 1, 1, 1, 1, 1,
0.9716081, 0.2899149, 1.020562, 1, 1, 1, 1, 1,
0.9782467, 0.3896891, 2.00924, 1, 1, 1, 1, 1,
0.9800388, -0.01802274, 2.584285, 1, 1, 1, 1, 1,
0.9822295, 0.8285902, 0.8192988, 1, 1, 1, 1, 1,
0.9832172, 0.2902726, 1.337866, 1, 1, 1, 1, 1,
0.9848467, -1.496471, 1.416553, 1, 1, 1, 1, 1,
0.9869264, 1.688466, 0.9810086, 1, 1, 1, 1, 1,
0.9881664, 0.8005894, 0.8254315, 1, 1, 1, 1, 1,
0.9953017, 1.401478, 0.3861655, 1, 1, 1, 1, 1,
0.999902, 0.8291572, 0.6005905, 1, 1, 1, 1, 1,
1.002771, -1.541792, 2.037309, 1, 1, 1, 1, 1,
1.005731, 0.4625981, 2.283553, 1, 1, 1, 1, 1,
1.009062, 0.9476681, -1.212354, 0, 0, 1, 1, 1,
1.009584, 0.1111822, 1.51545, 1, 0, 0, 1, 1,
1.010967, -0.3268663, 2.37691, 1, 0, 0, 1, 1,
1.011678, -0.1558408, 0.9731535, 1, 0, 0, 1, 1,
1.012665, 1.242972, 0.9497703, 1, 0, 0, 1, 1,
1.017159, 0.7658669, -0.1671185, 1, 0, 0, 1, 1,
1.020969, 0.227331, 0.5962399, 0, 0, 0, 1, 1,
1.021853, -0.5303968, 1.80502, 0, 0, 0, 1, 1,
1.024814, 0.1662175, -0.213401, 0, 0, 0, 1, 1,
1.025546, -0.5276721, 3.43117, 0, 0, 0, 1, 1,
1.026385, -0.1077014, 1.199519, 0, 0, 0, 1, 1,
1.029061, -0.03844979, 2.538307, 0, 0, 0, 1, 1,
1.030201, 1.162182, -0.7188804, 0, 0, 0, 1, 1,
1.030627, 0.6626426, 0.3118448, 1, 1, 1, 1, 1,
1.030996, 0.5806074, 1.767314, 1, 1, 1, 1, 1,
1.039778, -0.1866415, 1.850544, 1, 1, 1, 1, 1,
1.03978, -1.026128, 1.049195, 1, 1, 1, 1, 1,
1.041076, -1.16428, 0.3727604, 1, 1, 1, 1, 1,
1.050233, -0.186322, 2.980302, 1, 1, 1, 1, 1,
1.05992, 0.5067781, 0.2665399, 1, 1, 1, 1, 1,
1.062487, -0.8316854, 1.436303, 1, 1, 1, 1, 1,
1.0627, -0.5029596, 2.221027, 1, 1, 1, 1, 1,
1.066003, -0.8236083, 2.721315, 1, 1, 1, 1, 1,
1.06699, -0.4881469, 1.013557, 1, 1, 1, 1, 1,
1.075092, -0.0002112983, 0.9652236, 1, 1, 1, 1, 1,
1.077227, -0.4664755, 1.22355, 1, 1, 1, 1, 1,
1.093213, -0.4940848, 1.375529, 1, 1, 1, 1, 1,
1.095705, -0.0726825, 2.61222, 1, 1, 1, 1, 1,
1.097665, -2.168697, 3.329195, 0, 0, 1, 1, 1,
1.100711, -1.641166, 3.201797, 1, 0, 0, 1, 1,
1.108292, 1.081203, -0.3106175, 1, 0, 0, 1, 1,
1.110876, -0.5614527, 0.5393182, 1, 0, 0, 1, 1,
1.113191, -1.050904, 4.212995, 1, 0, 0, 1, 1,
1.115927, 0.08169051, 1.196244, 1, 0, 0, 1, 1,
1.139788, 1.338132, 1.832614, 0, 0, 0, 1, 1,
1.142594, -1.507094, 2.271483, 0, 0, 0, 1, 1,
1.150686, -0.4907618, 2.292022, 0, 0, 0, 1, 1,
1.15077, -0.351477, 3.309844, 0, 0, 0, 1, 1,
1.151563, -0.6620218, 2.557329, 0, 0, 0, 1, 1,
1.158568, 1.853195, 0.8180424, 0, 0, 0, 1, 1,
1.170003, 0.5674471, 0.4622971, 0, 0, 0, 1, 1,
1.18201, -0.6270536, 1.500835, 1, 1, 1, 1, 1,
1.198613, 0.3667873, 0.8224496, 1, 1, 1, 1, 1,
1.202815, -0.3979446, 1.533889, 1, 1, 1, 1, 1,
1.203839, 0.3093357, 0.6535701, 1, 1, 1, 1, 1,
1.208213, -0.8149931, 2.623617, 1, 1, 1, 1, 1,
1.211325, 1.514673, 0.3415007, 1, 1, 1, 1, 1,
1.215763, 0.8466747, 1.096441, 1, 1, 1, 1, 1,
1.21796, -0.7835761, 1.085595, 1, 1, 1, 1, 1,
1.220354, 0.6636528, 1.596917, 1, 1, 1, 1, 1,
1.220575, 0.05670505, 3.018038, 1, 1, 1, 1, 1,
1.225832, 0.1897606, 2.768873, 1, 1, 1, 1, 1,
1.23162, -0.1205936, 1.425089, 1, 1, 1, 1, 1,
1.2376, -0.4615913, 3.696253, 1, 1, 1, 1, 1,
1.238636, -1.596828, 2.699263, 1, 1, 1, 1, 1,
1.243287, 0.9328517, 0.4413156, 1, 1, 1, 1, 1,
1.248438, -0.1828437, 1.774482, 0, 0, 1, 1, 1,
1.24854, -1.600321, 2.013547, 1, 0, 0, 1, 1,
1.257774, -0.3477366, 2.838235, 1, 0, 0, 1, 1,
1.257995, -0.7203774, 0.9095442, 1, 0, 0, 1, 1,
1.258677, -0.294166, 2.415574, 1, 0, 0, 1, 1,
1.263168, 0.5687925, 1.692555, 1, 0, 0, 1, 1,
1.268947, 0.9205634, 0.4644955, 0, 0, 0, 1, 1,
1.269817, -0.650224, 2.778152, 0, 0, 0, 1, 1,
1.292415, 1.020498, -0.7252296, 0, 0, 0, 1, 1,
1.297701, -0.8938794, 2.668909, 0, 0, 0, 1, 1,
1.303353, 0.8425319, 1.56811, 0, 0, 0, 1, 1,
1.311933, -0.7700276, 0.8298824, 0, 0, 0, 1, 1,
1.328029, 0.8410947, -0.6230933, 0, 0, 0, 1, 1,
1.334582, -0.1704028, 3.389922, 1, 1, 1, 1, 1,
1.342331, 1.431593, 3.200978, 1, 1, 1, 1, 1,
1.343207, 0.7239383, 1.638673, 1, 1, 1, 1, 1,
1.343676, -1.24147, 2.173619, 1, 1, 1, 1, 1,
1.348505, -0.2030854, 2.914501, 1, 1, 1, 1, 1,
1.351807, -1.533084, 0.9633319, 1, 1, 1, 1, 1,
1.35662, 1.072827, -0.9605877, 1, 1, 1, 1, 1,
1.364856, 1.092812, -2.085667, 1, 1, 1, 1, 1,
1.368075, 2.080445, 0.8893116, 1, 1, 1, 1, 1,
1.371434, -0.4187355, 1.831744, 1, 1, 1, 1, 1,
1.376563, 0.5159817, 0.1237111, 1, 1, 1, 1, 1,
1.380027, -0.8129529, 1.643058, 1, 1, 1, 1, 1,
1.381215, 1.552792, 0.3691348, 1, 1, 1, 1, 1,
1.389893, -0.4217798, 2.294421, 1, 1, 1, 1, 1,
1.404442, 0.1746209, 2.196979, 1, 1, 1, 1, 1,
1.419129, -2.349455, 2.780818, 0, 0, 1, 1, 1,
1.420003, 0.6189859, 1.460187, 1, 0, 0, 1, 1,
1.425121, 2.045092, -0.4895618, 1, 0, 0, 1, 1,
1.427267, 2.679458, 1.129465, 1, 0, 0, 1, 1,
1.436466, 0.4600016, 1.940742, 1, 0, 0, 1, 1,
1.437306, -1.006867, 2.345438, 1, 0, 0, 1, 1,
1.454461, -0.3736114, 1.013514, 0, 0, 0, 1, 1,
1.475644, 0.652846, 0.5936159, 0, 0, 0, 1, 1,
1.479481, -0.4402682, 1.948871, 0, 0, 0, 1, 1,
1.480261, 0.4038148, -0.2403288, 0, 0, 0, 1, 1,
1.489369, -0.6010474, 2.194138, 0, 0, 0, 1, 1,
1.489572, -1.026814, 0.2962473, 0, 0, 0, 1, 1,
1.490457, -0.9590807, 2.066746, 0, 0, 0, 1, 1,
1.503766, -1.406476, 3.401194, 1, 1, 1, 1, 1,
1.506247, 0.3682452, 3.096172, 1, 1, 1, 1, 1,
1.51663, -0.4842787, 2.983624, 1, 1, 1, 1, 1,
1.533909, -1.194308, 0.4292476, 1, 1, 1, 1, 1,
1.535053, 0.5311356, 0.5178141, 1, 1, 1, 1, 1,
1.539313, -0.7831692, 0.9942994, 1, 1, 1, 1, 1,
1.540495, -1.026447, 1.66145, 1, 1, 1, 1, 1,
1.540504, -0.4928207, 1.160719, 1, 1, 1, 1, 1,
1.541502, 1.093354, -1.433932, 1, 1, 1, 1, 1,
1.548436, 0.7260199, 1.292061, 1, 1, 1, 1, 1,
1.551823, -0.4631324, 2.749512, 1, 1, 1, 1, 1,
1.557048, -1.295935, 3.207609, 1, 1, 1, 1, 1,
1.559626, -0.3750715, 1.485288, 1, 1, 1, 1, 1,
1.577477, 1.13641, -0.8606602, 1, 1, 1, 1, 1,
1.578571, 0.2633689, 0.5049161, 1, 1, 1, 1, 1,
1.587249, 0.271543, 1.872414, 0, 0, 1, 1, 1,
1.595325, 0.2570952, 2.90362, 1, 0, 0, 1, 1,
1.62396, 0.939842, 1.603896, 1, 0, 0, 1, 1,
1.626017, -0.9655497, 2.575692, 1, 0, 0, 1, 1,
1.632896, -0.5751022, 0.7590433, 1, 0, 0, 1, 1,
1.643296, 0.120096, 0.8792418, 1, 0, 0, 1, 1,
1.659131, -1.691742, 1.55639, 0, 0, 0, 1, 1,
1.696908, 1.009274, 1.185867, 0, 0, 0, 1, 1,
1.720028, -0.2494357, 0.9665021, 0, 0, 0, 1, 1,
1.733299, 1.382698, 1.464719, 0, 0, 0, 1, 1,
1.734064, -0.8300689, 2.406803, 0, 0, 0, 1, 1,
1.786106, -1.03309, 2.660371, 0, 0, 0, 1, 1,
1.797031, -1.145754, 1.708186, 0, 0, 0, 1, 1,
1.798124, -1.482905, 0.8031796, 1, 1, 1, 1, 1,
1.798673, 0.3343645, 1.639232, 1, 1, 1, 1, 1,
1.824383, -0.5256482, 2.45774, 1, 1, 1, 1, 1,
1.854541, 0.6972582, 2.055875, 1, 1, 1, 1, 1,
1.875196, -0.7228927, 3.062909, 1, 1, 1, 1, 1,
1.877521, 2.33975, 0.0130865, 1, 1, 1, 1, 1,
1.899471, 0.1458348, 1.237103, 1, 1, 1, 1, 1,
1.908818, 0.04425874, 0.01161821, 1, 1, 1, 1, 1,
1.914879, 0.02478624, -0.4789941, 1, 1, 1, 1, 1,
1.928507, 2.464217, 0.9374719, 1, 1, 1, 1, 1,
1.933187, -1.061871, 1.957367, 1, 1, 1, 1, 1,
1.962422, -1.584366, 2.30575, 1, 1, 1, 1, 1,
1.976858, -1.425917, 0.6786773, 1, 1, 1, 1, 1,
1.98319, 1.607465, -0.658024, 1, 1, 1, 1, 1,
2.024188, 0.2207458, 2.494812, 1, 1, 1, 1, 1,
2.041532, 1.602798, -0.3448486, 0, 0, 1, 1, 1,
2.07003, -0.1633884, 3.011926, 1, 0, 0, 1, 1,
2.072687, 0.1206035, 1.032966, 1, 0, 0, 1, 1,
2.100595, 0.3151301, 0.2538697, 1, 0, 0, 1, 1,
2.14278, 0.4985665, 2.802078, 1, 0, 0, 1, 1,
2.159634, 0.02502492, -0.2447348, 1, 0, 0, 1, 1,
2.175224, 0.2306649, 1.290104, 0, 0, 0, 1, 1,
2.196832, 0.04513033, 1.764365, 0, 0, 0, 1, 1,
2.253077, 0.2533052, 0.5201862, 0, 0, 0, 1, 1,
2.303467, -1.079704, 2.847763, 0, 0, 0, 1, 1,
2.347243, 0.8593076, 1.472836, 0, 0, 0, 1, 1,
2.352355, -1.556909, 1.994921, 0, 0, 0, 1, 1,
2.375718, 1.134614, 0.84176, 0, 0, 0, 1, 1,
2.411078, -0.2561449, 3.072526, 1, 1, 1, 1, 1,
2.450696, 0.7566659, 1.562319, 1, 1, 1, 1, 1,
2.457179, -2.131861, 4.094273, 1, 1, 1, 1, 1,
2.562859, 0.707761, 4.350595, 1, 1, 1, 1, 1,
2.641549, 0.3594821, 1.384799, 1, 1, 1, 1, 1,
2.68417, -0.9308547, 2.890426, 1, 1, 1, 1, 1,
3.090488, 0.2809818, -0.599176, 1, 1, 1, 1, 1
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
var radius = 9.812361;
var distance = 34.4655;
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
mvMatrix.translate( 0.2067766, 0.07778859, -0.4876084 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.4655);
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
