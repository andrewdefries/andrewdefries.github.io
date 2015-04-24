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
-2.862548, -1.008775, -2.650034, 1, 0, 0, 1,
-2.796356, -1.142577, -1.078627, 1, 0.007843138, 0, 1,
-2.560308, -0.8559505, -1.896182, 1, 0.01176471, 0, 1,
-2.501152, 0.6739388, -1.613838, 1, 0.01960784, 0, 1,
-2.429162, -0.2644921, -1.362924, 1, 0.02352941, 0, 1,
-2.4264, 0.3063252, 0.08943094, 1, 0.03137255, 0, 1,
-2.41108, -0.748799, -3.843398, 1, 0.03529412, 0, 1,
-2.398177, -0.4174064, -0.4599903, 1, 0.04313726, 0, 1,
-2.328866, 0.4169343, -0.8508362, 1, 0.04705882, 0, 1,
-2.313981, 1.102911, -0.9237024, 1, 0.05490196, 0, 1,
-2.305685, 1.633981, -0.8657232, 1, 0.05882353, 0, 1,
-2.303591, -0.3632079, -0.7403343, 1, 0.06666667, 0, 1,
-2.285644, 0.6182261, 0.2265151, 1, 0.07058824, 0, 1,
-2.27277, -0.8622456, -1.490406, 1, 0.07843138, 0, 1,
-2.259932, 1.675317, -1.780198, 1, 0.08235294, 0, 1,
-2.257785, 0.822837, 0.2201075, 1, 0.09019608, 0, 1,
-2.240939, -0.1096148, -2.358459, 1, 0.09411765, 0, 1,
-2.240428, 0.3833797, 0.2891995, 1, 0.1019608, 0, 1,
-2.193339, 0.2794766, -2.218079, 1, 0.1098039, 0, 1,
-2.172055, 0.939113, 0.07418674, 1, 0.1137255, 0, 1,
-2.120947, 1.457815, -0.8595503, 1, 0.1215686, 0, 1,
-2.110714, -1.209593, -0.5076683, 1, 0.1254902, 0, 1,
-2.090822, -0.451089, -4.622635, 1, 0.1333333, 0, 1,
-2.08428, -0.8432584, -1.075476, 1, 0.1372549, 0, 1,
-2.06001, -0.8337496, -3.354509, 1, 0.145098, 0, 1,
-2.035976, 0.9804482, -0.7743495, 1, 0.1490196, 0, 1,
-2.024217, -0.2009603, -0.8280979, 1, 0.1568628, 0, 1,
-2.007683, -1.116817, -0.8072244, 1, 0.1607843, 0, 1,
-2.002147, -1.918442, -2.5603, 1, 0.1686275, 0, 1,
-1.975218, 0.9854101, 0.353579, 1, 0.172549, 0, 1,
-1.965395, -0.1629013, -1.954084, 1, 0.1803922, 0, 1,
-1.964692, 1.265912, -1.015915, 1, 0.1843137, 0, 1,
-1.939166, 0.2813779, 0.3258597, 1, 0.1921569, 0, 1,
-1.938173, 1.140998, -0.8436946, 1, 0.1960784, 0, 1,
-1.916954, -0.2884481, -3.302694, 1, 0.2039216, 0, 1,
-1.915455, -0.6021391, -1.611823, 1, 0.2117647, 0, 1,
-1.887538, -0.2970614, -1.826037, 1, 0.2156863, 0, 1,
-1.883919, -0.7182158, -0.7091766, 1, 0.2235294, 0, 1,
-1.861999, 0.4244542, -2.722584, 1, 0.227451, 0, 1,
-1.851337, -1.305545, -2.072519, 1, 0.2352941, 0, 1,
-1.841538, 1.673826, -0.2685387, 1, 0.2392157, 0, 1,
-1.837991, 1.061428, 0.2827471, 1, 0.2470588, 0, 1,
-1.837708, -0.1057043, -1.682178, 1, 0.2509804, 0, 1,
-1.831994, 0.3462238, 0.9475778, 1, 0.2588235, 0, 1,
-1.819939, 0.6904938, -1.201153, 1, 0.2627451, 0, 1,
-1.818603, 0.8974168, -1.406971, 1, 0.2705882, 0, 1,
-1.794723, 0.09643242, -1.88864, 1, 0.2745098, 0, 1,
-1.791821, 0.1246424, -3.581801, 1, 0.282353, 0, 1,
-1.778514, -3.014145, -3.634579, 1, 0.2862745, 0, 1,
-1.759614, 0.1277205, -0.2141514, 1, 0.2941177, 0, 1,
-1.743037, 0.2086924, 0.7863067, 1, 0.3019608, 0, 1,
-1.740605, 1.246626, -0.9044657, 1, 0.3058824, 0, 1,
-1.73373, 0.2846976, -1.588566, 1, 0.3137255, 0, 1,
-1.727156, 0.8179237, -1.450711, 1, 0.3176471, 0, 1,
-1.726475, 0.4907353, 0.1358583, 1, 0.3254902, 0, 1,
-1.710021, 0.6145649, -2.231091, 1, 0.3294118, 0, 1,
-1.701931, -1.973642, -2.654357, 1, 0.3372549, 0, 1,
-1.69879, -1.119807, -2.227291, 1, 0.3411765, 0, 1,
-1.696032, -2.140639, -1.430835, 1, 0.3490196, 0, 1,
-1.692706, -0.8678917, -2.563059, 1, 0.3529412, 0, 1,
-1.681347, 1.134822, 0.4217388, 1, 0.3607843, 0, 1,
-1.669322, 0.02802862, -3.690102, 1, 0.3647059, 0, 1,
-1.659597, -0.7989134, -0.7345132, 1, 0.372549, 0, 1,
-1.652214, 1.47148, -0.9754252, 1, 0.3764706, 0, 1,
-1.63793, -2.329417, -3.097569, 1, 0.3843137, 0, 1,
-1.606722, -2.084045, -3.215577, 1, 0.3882353, 0, 1,
-1.602827, -0.4892363, -2.748028, 1, 0.3960784, 0, 1,
-1.594766, 0.9365284, -0.8439202, 1, 0.4039216, 0, 1,
-1.58448, -0.4961452, -0.2932898, 1, 0.4078431, 0, 1,
-1.576285, -0.9374323, -1.961165, 1, 0.4156863, 0, 1,
-1.572248, -0.224365, -3.035395, 1, 0.4196078, 0, 1,
-1.567605, 1.783008, 1.169594, 1, 0.427451, 0, 1,
-1.565713, 0.6861792, -0.3338783, 1, 0.4313726, 0, 1,
-1.553113, -0.2319793, -1.576351, 1, 0.4392157, 0, 1,
-1.552547, -1.245023, -2.69428, 1, 0.4431373, 0, 1,
-1.548225, -0.4693793, -1.117167, 1, 0.4509804, 0, 1,
-1.530265, 1.469254, -1.607345, 1, 0.454902, 0, 1,
-1.528718, -0.05867665, -2.669238, 1, 0.4627451, 0, 1,
-1.521426, 1.427606, -2.315526, 1, 0.4666667, 0, 1,
-1.521049, 1.083797, -0.4496098, 1, 0.4745098, 0, 1,
-1.518635, 1.634668, -0.7543932, 1, 0.4784314, 0, 1,
-1.51826, -0.4535598, -3.112898, 1, 0.4862745, 0, 1,
-1.517276, -0.08737983, -1.861044, 1, 0.4901961, 0, 1,
-1.513818, -0.2953719, -2.091886, 1, 0.4980392, 0, 1,
-1.509484, -0.0518181, -2.198807, 1, 0.5058824, 0, 1,
-1.502347, 0.9830689, -0.840691, 1, 0.509804, 0, 1,
-1.490376, -0.4080246, -1.21709, 1, 0.5176471, 0, 1,
-1.485694, -0.2121661, -1.111596, 1, 0.5215687, 0, 1,
-1.47362, -1.342506, -0.8722457, 1, 0.5294118, 0, 1,
-1.459764, 0.4157954, -2.372459, 1, 0.5333334, 0, 1,
-1.459611, 0.2015508, -1.229589, 1, 0.5411765, 0, 1,
-1.457674, 2.041868, -0.2211539, 1, 0.5450981, 0, 1,
-1.440058, -0.2374257, -0.6496387, 1, 0.5529412, 0, 1,
-1.43733, 0.7184735, -0.3108061, 1, 0.5568628, 0, 1,
-1.429667, -0.08449186, -3.50572, 1, 0.5647059, 0, 1,
-1.397658, 1.225976, -0.4586879, 1, 0.5686275, 0, 1,
-1.39322, 0.4691008, -0.6134777, 1, 0.5764706, 0, 1,
-1.391069, -0.06558422, -2.23428, 1, 0.5803922, 0, 1,
-1.374176, 0.9018299, -0.5512836, 1, 0.5882353, 0, 1,
-1.356065, -0.5806581, -0.9229795, 1, 0.5921569, 0, 1,
-1.355385, 0.1357621, -0.539976, 1, 0.6, 0, 1,
-1.349935, 0.5753143, -3.253246, 1, 0.6078432, 0, 1,
-1.338785, -0.616295, -1.03861, 1, 0.6117647, 0, 1,
-1.333957, -1.175957, -1.484541, 1, 0.6196079, 0, 1,
-1.320357, 0.989831, -2.085982, 1, 0.6235294, 0, 1,
-1.319811, 0.6188987, -1.121645, 1, 0.6313726, 0, 1,
-1.313731, 1.810082, -1.559798, 1, 0.6352941, 0, 1,
-1.313152, -0.794154, -1.788833, 1, 0.6431373, 0, 1,
-1.291556, 1.187347, -0.3416403, 1, 0.6470588, 0, 1,
-1.291278, 0.4075525, -2.972742, 1, 0.654902, 0, 1,
-1.291232, -0.509681, -1.995143, 1, 0.6588235, 0, 1,
-1.290323, 0.05312032, -2.858406, 1, 0.6666667, 0, 1,
-1.285796, -0.1667164, -0.7924097, 1, 0.6705883, 0, 1,
-1.285408, 0.3439909, -1.22005, 1, 0.6784314, 0, 1,
-1.284508, 0.7256729, -0.4019326, 1, 0.682353, 0, 1,
-1.280272, 0.6835742, -2.373972, 1, 0.6901961, 0, 1,
-1.266167, 0.4734364, -1.020039, 1, 0.6941177, 0, 1,
-1.263385, 0.1394736, -2.096599, 1, 0.7019608, 0, 1,
-1.262256, -0.8152267, -2.447555, 1, 0.7098039, 0, 1,
-1.239594, -1.14698, -4.654871, 1, 0.7137255, 0, 1,
-1.239099, -0.5183266, -0.7419257, 1, 0.7215686, 0, 1,
-1.237295, 0.8965774, -0.1423283, 1, 0.7254902, 0, 1,
-1.229732, -1.180429, -2.418833, 1, 0.7333333, 0, 1,
-1.216982, -0.5738676, -2.485797, 1, 0.7372549, 0, 1,
-1.209109, 0.05136145, -0.06482793, 1, 0.7450981, 0, 1,
-1.200406, 1.317115, -3.055458, 1, 0.7490196, 0, 1,
-1.19965, -0.8812146, -2.577282, 1, 0.7568628, 0, 1,
-1.195125, 0.2212664, 0.4145806, 1, 0.7607843, 0, 1,
-1.191182, 1.256417, -1.620967, 1, 0.7686275, 0, 1,
-1.189898, -1.514021, -3.600706, 1, 0.772549, 0, 1,
-1.185962, 0.352719, -2.777239, 1, 0.7803922, 0, 1,
-1.183114, -0.02295356, -2.77168, 1, 0.7843137, 0, 1,
-1.180989, 0.3274704, -1.583473, 1, 0.7921569, 0, 1,
-1.171237, 0.4176763, -0.9962208, 1, 0.7960784, 0, 1,
-1.16105, -1.450253, -2.392627, 1, 0.8039216, 0, 1,
-1.158004, 1.389179, -0.6791461, 1, 0.8117647, 0, 1,
-1.131041, 1.239233, -2.363409, 1, 0.8156863, 0, 1,
-1.130302, -0.9880128, -2.946065, 1, 0.8235294, 0, 1,
-1.123308, 0.328893, -2.960746, 1, 0.827451, 0, 1,
-1.11766, 0.2194534, -1.202488, 1, 0.8352941, 0, 1,
-1.114625, -0.6979066, -2.083089, 1, 0.8392157, 0, 1,
-1.097544, 0.3126376, -0.6797575, 1, 0.8470588, 0, 1,
-1.095893, -0.388121, -1.625141, 1, 0.8509804, 0, 1,
-1.093941, 0.08185977, -0.5356196, 1, 0.8588235, 0, 1,
-1.093738, 0.4002048, -0.339409, 1, 0.8627451, 0, 1,
-1.091006, 1.77963, -0.3347249, 1, 0.8705882, 0, 1,
-1.087861, -1.109359, -2.188585, 1, 0.8745098, 0, 1,
-1.082605, -0.5503696, -2.930413, 1, 0.8823529, 0, 1,
-1.076203, 0.7643189, -1.447591, 1, 0.8862745, 0, 1,
-1.066055, 0.1940646, -1.405775, 1, 0.8941177, 0, 1,
-1.065475, 1.005206, -0.3703115, 1, 0.8980392, 0, 1,
-1.063092, -0.9445159, -2.384594, 1, 0.9058824, 0, 1,
-1.060977, -1.879069, -5.3096, 1, 0.9137255, 0, 1,
-1.052582, 0.3088574, -2.318871, 1, 0.9176471, 0, 1,
-1.051372, 0.509968, -0.170389, 1, 0.9254902, 0, 1,
-1.047976, 1.043295, 0.04264946, 1, 0.9294118, 0, 1,
-1.046739, 0.2706534, -1.139362, 1, 0.9372549, 0, 1,
-1.034191, 0.6366897, -0.9831237, 1, 0.9411765, 0, 1,
-1.033462, 1.104901, -0.8277353, 1, 0.9490196, 0, 1,
-1.031923, 2.017774, -0.3307692, 1, 0.9529412, 0, 1,
-1.031206, -0.642469, -2.289752, 1, 0.9607843, 0, 1,
-1.026262, 0.4089361, -2.026384, 1, 0.9647059, 0, 1,
-1.023069, 0.8217142, -1.119194, 1, 0.972549, 0, 1,
-1.021118, 1.708281, -0.8692592, 1, 0.9764706, 0, 1,
-1.020399, 0.8799944, -3.535817, 1, 0.9843137, 0, 1,
-1.015796, 0.3770784, -0.3530879, 1, 0.9882353, 0, 1,
-1.015237, -0.5307036, -2.593351, 1, 0.9960784, 0, 1,
-1.012798, 0.1665976, -0.710224, 0.9960784, 1, 0, 1,
-1.011747, -1.161233, -3.498631, 0.9921569, 1, 0, 1,
-1.005201, 0.1534032, -2.144791, 0.9843137, 1, 0, 1,
-1.001409, 0.9490328, 1.885978, 0.9803922, 1, 0, 1,
-1.00026, -0.3896082, -0.3179282, 0.972549, 1, 0, 1,
-0.9994096, 0.2075899, -0.932804, 0.9686275, 1, 0, 1,
-0.9968744, -1.237794, -2.732759, 0.9607843, 1, 0, 1,
-0.9965802, -0.480989, -3.618792, 0.9568627, 1, 0, 1,
-0.9949986, -0.07343465, -0.4775912, 0.9490196, 1, 0, 1,
-0.9942204, 0.8617634, -0.9488579, 0.945098, 1, 0, 1,
-0.9868833, -0.8815457, -2.518553, 0.9372549, 1, 0, 1,
-0.9801239, 0.7640506, -0.5243993, 0.9333333, 1, 0, 1,
-0.9654592, -1.464792, -1.09308, 0.9254902, 1, 0, 1,
-0.959766, -0.6553769, -1.894793, 0.9215686, 1, 0, 1,
-0.9590495, 0.1098118, 0.8534737, 0.9137255, 1, 0, 1,
-0.958341, 0.1605904, -1.325285, 0.9098039, 1, 0, 1,
-0.9532937, 2.529554, 0.6496413, 0.9019608, 1, 0, 1,
-0.9469467, -0.09993883, -2.459124, 0.8941177, 1, 0, 1,
-0.9457503, 0.4326807, -0.2512429, 0.8901961, 1, 0, 1,
-0.9405318, -0.1864814, -1.959987, 0.8823529, 1, 0, 1,
-0.9372265, 1.06575, -0.4071952, 0.8784314, 1, 0, 1,
-0.9284489, 0.9259852, 0.2355091, 0.8705882, 1, 0, 1,
-0.9263924, -0.5375064, -3.294279, 0.8666667, 1, 0, 1,
-0.9248798, -0.4186559, -1.697802, 0.8588235, 1, 0, 1,
-0.9236407, 0.2781646, -1.699267, 0.854902, 1, 0, 1,
-0.9217932, -1.096662, -3.616909, 0.8470588, 1, 0, 1,
-0.9205387, -0.8100095, -2.920644, 0.8431373, 1, 0, 1,
-0.9197837, 0.3256107, -1.762868, 0.8352941, 1, 0, 1,
-0.9197373, -0.5026401, -3.144817, 0.8313726, 1, 0, 1,
-0.9152057, -0.2716713, -1.446684, 0.8235294, 1, 0, 1,
-0.9127755, -0.1835704, 0.1830663, 0.8196079, 1, 0, 1,
-0.9114505, 0.8543094, -0.1856079, 0.8117647, 1, 0, 1,
-0.9064182, -0.3179652, -1.462396, 0.8078431, 1, 0, 1,
-0.9045444, 0.1520613, -2.309005, 0.8, 1, 0, 1,
-0.8996905, -0.5437095, -1.255065, 0.7921569, 1, 0, 1,
-0.8968065, 0.6566105, -0.9938179, 0.7882353, 1, 0, 1,
-0.8895168, 0.728395, -0.8129535, 0.7803922, 1, 0, 1,
-0.8737807, -1.957838, -3.039643, 0.7764706, 1, 0, 1,
-0.8693416, 0.6319648, -1.493891, 0.7686275, 1, 0, 1,
-0.8593804, -1.517311, -3.903867, 0.7647059, 1, 0, 1,
-0.8584352, 0.8443409, -0.2516288, 0.7568628, 1, 0, 1,
-0.8568791, 0.9821183, -0.8589707, 0.7529412, 1, 0, 1,
-0.8546607, 0.3491171, 0.3263945, 0.7450981, 1, 0, 1,
-0.8535357, -0.7421007, -1.442661, 0.7411765, 1, 0, 1,
-0.8514283, 0.4896308, -2.56914, 0.7333333, 1, 0, 1,
-0.8424284, -0.1707441, -1.99875, 0.7294118, 1, 0, 1,
-0.8383266, 2.298581, 0.07943967, 0.7215686, 1, 0, 1,
-0.8341305, 0.112999, -1.091777, 0.7176471, 1, 0, 1,
-0.8288772, 0.6693712, -0.9975234, 0.7098039, 1, 0, 1,
-0.8268821, 0.294412, -2.367107, 0.7058824, 1, 0, 1,
-0.8268777, 0.5124882, 0.5746157, 0.6980392, 1, 0, 1,
-0.826796, -0.9178681, -3.064098, 0.6901961, 1, 0, 1,
-0.8207644, -1.262208, -2.777876, 0.6862745, 1, 0, 1,
-0.820655, -1.762606, -2.691714, 0.6784314, 1, 0, 1,
-0.8193238, 1.515272, -0.6589516, 0.6745098, 1, 0, 1,
-0.8089001, 0.1276003, -2.196529, 0.6666667, 1, 0, 1,
-0.7989218, 0.3095695, -1.802433, 0.6627451, 1, 0, 1,
-0.795496, -0.04474744, -2.03182, 0.654902, 1, 0, 1,
-0.7946993, 0.4945984, -2.725723, 0.6509804, 1, 0, 1,
-0.7942615, -0.519749, -3.527902, 0.6431373, 1, 0, 1,
-0.7930817, 1.549026, -1.390423, 0.6392157, 1, 0, 1,
-0.7886526, -1.123294, -2.337571, 0.6313726, 1, 0, 1,
-0.783964, 0.858086, -2.584953, 0.627451, 1, 0, 1,
-0.7817743, 0.2223881, 0.5787162, 0.6196079, 1, 0, 1,
-0.7777058, 0.7961016, -1.195853, 0.6156863, 1, 0, 1,
-0.7762366, -2.029868, -2.480899, 0.6078432, 1, 0, 1,
-0.7737526, 1.689176, -0.1102051, 0.6039216, 1, 0, 1,
-0.7616925, 1.257899, -0.226275, 0.5960785, 1, 0, 1,
-0.7613912, -0.2326773, -0.151037, 0.5882353, 1, 0, 1,
-0.7559867, -1.180667, -2.779684, 0.5843138, 1, 0, 1,
-0.7559291, 0.8019831, 1.290721, 0.5764706, 1, 0, 1,
-0.7545815, 1.577383, -1.811192, 0.572549, 1, 0, 1,
-0.7541359, -1.028996, -4.811263, 0.5647059, 1, 0, 1,
-0.7468642, 0.7707568, -1.53884, 0.5607843, 1, 0, 1,
-0.7464605, -1.316119, -4.074125, 0.5529412, 1, 0, 1,
-0.746084, 0.7551799, -1.100005, 0.5490196, 1, 0, 1,
-0.7429589, -0.8464071, -2.223415, 0.5411765, 1, 0, 1,
-0.7412536, -1.932536, -3.625766, 0.5372549, 1, 0, 1,
-0.7393407, 0.6421059, -0.8194045, 0.5294118, 1, 0, 1,
-0.7385732, -1.47485, -3.061786, 0.5254902, 1, 0, 1,
-0.7379684, 1.166961, -0.9382944, 0.5176471, 1, 0, 1,
-0.7353461, 0.07186503, -0.03197045, 0.5137255, 1, 0, 1,
-0.7346537, -0.7743264, -3.346638, 0.5058824, 1, 0, 1,
-0.7301437, -0.1699525, -1.765697, 0.5019608, 1, 0, 1,
-0.7275654, -0.09577844, -0.7884132, 0.4941176, 1, 0, 1,
-0.7068705, 0.4036649, -0.9368353, 0.4862745, 1, 0, 1,
-0.7062474, 2.108223, 1.327757, 0.4823529, 1, 0, 1,
-0.7059167, -0.7257939, -2.135899, 0.4745098, 1, 0, 1,
-0.7039356, -0.019498, -1.508541, 0.4705882, 1, 0, 1,
-0.702825, 0.8501703, -0.5083165, 0.4627451, 1, 0, 1,
-0.7015506, -0.08043819, -1.457331, 0.4588235, 1, 0, 1,
-0.6976327, 0.7841941, 0.2653859, 0.4509804, 1, 0, 1,
-0.6942613, 0.05190258, -2.158298, 0.4470588, 1, 0, 1,
-0.6932975, -0.7804932, -1.785225, 0.4392157, 1, 0, 1,
-0.6846749, 0.7066375, -0.3694967, 0.4352941, 1, 0, 1,
-0.6744586, 0.1386492, -2.54717, 0.427451, 1, 0, 1,
-0.6735014, -0.1916469, 0.8073718, 0.4235294, 1, 0, 1,
-0.6734619, 0.03422638, -1.188113, 0.4156863, 1, 0, 1,
-0.672972, 0.6990364, -1.876543, 0.4117647, 1, 0, 1,
-0.6726412, 1.692052, -1.952759, 0.4039216, 1, 0, 1,
-0.6690385, -0.1387089, -2.043668, 0.3960784, 1, 0, 1,
-0.6689873, 0.1831783, 0.1926219, 0.3921569, 1, 0, 1,
-0.6664369, -0.2110253, -1.532351, 0.3843137, 1, 0, 1,
-0.6642483, -0.0052984, -1.043245, 0.3803922, 1, 0, 1,
-0.6641401, -1.193487, -2.076457, 0.372549, 1, 0, 1,
-0.663357, 0.4669299, 0.3232437, 0.3686275, 1, 0, 1,
-0.6608556, -0.127302, -1.224199, 0.3607843, 1, 0, 1,
-0.6534631, -0.4720853, -2.535913, 0.3568628, 1, 0, 1,
-0.6531824, 0.02283021, -0.6633384, 0.3490196, 1, 0, 1,
-0.6526236, 0.3586327, -0.3265761, 0.345098, 1, 0, 1,
-0.6492245, -0.5830762, -3.942001, 0.3372549, 1, 0, 1,
-0.6470107, -0.4250678, -4.320102, 0.3333333, 1, 0, 1,
-0.6449675, -0.0807625, -1.791776, 0.3254902, 1, 0, 1,
-0.644237, 0.977739, -0.1943596, 0.3215686, 1, 0, 1,
-0.6375328, 0.1841675, -1.720964, 0.3137255, 1, 0, 1,
-0.6360863, -0.009604962, -2.024836, 0.3098039, 1, 0, 1,
-0.6358942, 0.3389304, -1.051617, 0.3019608, 1, 0, 1,
-0.6350393, -0.5479205, -1.896737, 0.2941177, 1, 0, 1,
-0.6253956, -2.153877, -4.024985, 0.2901961, 1, 0, 1,
-0.6173955, 2.107998, -0.51157, 0.282353, 1, 0, 1,
-0.6159044, 1.244953, -1.318358, 0.2784314, 1, 0, 1,
-0.6141549, -0.7080486, -1.884566, 0.2705882, 1, 0, 1,
-0.6125014, -1.225633, -3.799994, 0.2666667, 1, 0, 1,
-0.6099165, 1.061368, -1.067096, 0.2588235, 1, 0, 1,
-0.6081606, 0.3796118, -1.353108, 0.254902, 1, 0, 1,
-0.6059055, 0.2082166, -2.218708, 0.2470588, 1, 0, 1,
-0.601135, -1.218341, -1.900547, 0.2431373, 1, 0, 1,
-0.5990458, 0.04303756, -1.435621, 0.2352941, 1, 0, 1,
-0.5982665, -1.454069, -0.8061457, 0.2313726, 1, 0, 1,
-0.5974277, 1.211187, 0.2530354, 0.2235294, 1, 0, 1,
-0.5973084, 0.923637, -0.5127261, 0.2196078, 1, 0, 1,
-0.5964491, 1.704441, 0.6249486, 0.2117647, 1, 0, 1,
-0.5959575, -0.9723155, -1.499299, 0.2078431, 1, 0, 1,
-0.5955209, -0.8376405, -1.243215, 0.2, 1, 0, 1,
-0.5940452, 0.004442404, -2.150173, 0.1921569, 1, 0, 1,
-0.5925587, 0.1808569, -1.865798, 0.1882353, 1, 0, 1,
-0.5889679, 0.8828306, 0.5931801, 0.1803922, 1, 0, 1,
-0.5857038, -0.7017825, -3.033391, 0.1764706, 1, 0, 1,
-0.5789049, -1.463254, -2.932163, 0.1686275, 1, 0, 1,
-0.5745684, -0.06724072, -2.362571, 0.1647059, 1, 0, 1,
-0.5711301, 1.21467, 0.6112359, 0.1568628, 1, 0, 1,
-0.5685963, -0.4638901, -0.5891916, 0.1529412, 1, 0, 1,
-0.5669323, -0.7306666, -2.114921, 0.145098, 1, 0, 1,
-0.5615332, -1.235784, -1.822425, 0.1411765, 1, 0, 1,
-0.5572573, -0.2017096, -2.310941, 0.1333333, 1, 0, 1,
-0.5509074, -1.452337, -1.944878, 0.1294118, 1, 0, 1,
-0.5401797, -1.000886, -4.187221, 0.1215686, 1, 0, 1,
-0.5386843, 0.3696338, 0.08334581, 0.1176471, 1, 0, 1,
-0.5379112, 0.07751661, -0.8667954, 0.1098039, 1, 0, 1,
-0.5252434, 1.008413, -1.358368, 0.1058824, 1, 0, 1,
-0.5229752, -0.7495424, -2.224217, 0.09803922, 1, 0, 1,
-0.5219151, -1.047983, -4.139459, 0.09019608, 1, 0, 1,
-0.5142891, 0.1623073, -0.8957481, 0.08627451, 1, 0, 1,
-0.5141019, -0.9479343, -2.54306, 0.07843138, 1, 0, 1,
-0.5039594, 0.0379169, -1.772129, 0.07450981, 1, 0, 1,
-0.5032354, -0.2589717, -1.209146, 0.06666667, 1, 0, 1,
-0.5018557, 2.413946, -0.8825451, 0.0627451, 1, 0, 1,
-0.4997755, -0.2607814, -3.869178, 0.05490196, 1, 0, 1,
-0.4947309, 1.81401, -0.6222471, 0.05098039, 1, 0, 1,
-0.492264, 1.010991, -0.1676877, 0.04313726, 1, 0, 1,
-0.4916849, -0.3796346, -1.938454, 0.03921569, 1, 0, 1,
-0.4907176, 1.062395, -0.3020482, 0.03137255, 1, 0, 1,
-0.4851825, 0.7742195, -0.6286219, 0.02745098, 1, 0, 1,
-0.4767332, 0.5453117, 0.3719097, 0.01960784, 1, 0, 1,
-0.4756629, -0.4481635, -3.684855, 0.01568628, 1, 0, 1,
-0.4745745, -0.3296826, -3.638551, 0.007843138, 1, 0, 1,
-0.4717259, -0.8760258, -2.790682, 0.003921569, 1, 0, 1,
-0.4684548, 0.7981687, -0.2393295, 0, 1, 0.003921569, 1,
-0.4683456, -0.1295846, -2.094111, 0, 1, 0.01176471, 1,
-0.4662251, 0.09791204, -1.069886, 0, 1, 0.01568628, 1,
-0.4657034, 0.9608358, 1.186374, 0, 1, 0.02352941, 1,
-0.4430459, 1.093301, -0.2073561, 0, 1, 0.02745098, 1,
-0.4406826, 0.6342826, 0.6276486, 0, 1, 0.03529412, 1,
-0.436854, -1.329744, -2.436058, 0, 1, 0.03921569, 1,
-0.4350039, -0.2601409, -2.582732, 0, 1, 0.04705882, 1,
-0.4331729, -0.4086614, -1.482212, 0, 1, 0.05098039, 1,
-0.4187224, -0.433028, -2.527431, 0, 1, 0.05882353, 1,
-0.4182491, -1.272833, -1.709182, 0, 1, 0.0627451, 1,
-0.4169765, -1.434301, -2.544612, 0, 1, 0.07058824, 1,
-0.416497, 2.597045, 0.8386467, 0, 1, 0.07450981, 1,
-0.4127726, -0.9155883, -3.809285, 0, 1, 0.08235294, 1,
-0.4126564, 0.05765432, -1.685766, 0, 1, 0.08627451, 1,
-0.4105425, -0.9095302, -3.303413, 0, 1, 0.09411765, 1,
-0.4102841, -0.5996869, -2.004376, 0, 1, 0.1019608, 1,
-0.4059735, 1.706275, -0.9978182, 0, 1, 0.1058824, 1,
-0.4015265, 1.002915, -1.215759, 0, 1, 0.1137255, 1,
-0.3976746, 1.34453, -0.4657241, 0, 1, 0.1176471, 1,
-0.3932467, 1.74774, -0.04007891, 0, 1, 0.1254902, 1,
-0.3927199, -0.7364755, -3.0248, 0, 1, 0.1294118, 1,
-0.3919134, 0.7049333, 0.4549997, 0, 1, 0.1372549, 1,
-0.3885401, -0.9369351, -2.811742, 0, 1, 0.1411765, 1,
-0.3866704, 0.1304135, -0.3553957, 0, 1, 0.1490196, 1,
-0.38389, 1.698779, 0.7158334, 0, 1, 0.1529412, 1,
-0.3790403, -0.1099004, -1.132255, 0, 1, 0.1607843, 1,
-0.3763441, 1.326496, -0.9133803, 0, 1, 0.1647059, 1,
-0.3713344, -0.4416982, -2.969126, 0, 1, 0.172549, 1,
-0.3701614, 1.472748, 0.1533904, 0, 1, 0.1764706, 1,
-0.3690287, -0.3904366, -1.267196, 0, 1, 0.1843137, 1,
-0.3650046, 0.6074923, -0.4826906, 0, 1, 0.1882353, 1,
-0.3618514, 1.646302, -1.762136, 0, 1, 0.1960784, 1,
-0.3594981, 0.3250294, -2.151992, 0, 1, 0.2039216, 1,
-0.3580549, -0.8382248, -3.562611, 0, 1, 0.2078431, 1,
-0.3578609, 1.038736, -1.389304, 0, 1, 0.2156863, 1,
-0.3515839, -0.9716424, -1.489402, 0, 1, 0.2196078, 1,
-0.3509094, 0.3528563, -1.989698, 0, 1, 0.227451, 1,
-0.3396306, 1.048094, 0.6752512, 0, 1, 0.2313726, 1,
-0.334295, 0.4467988, 0.2576867, 0, 1, 0.2392157, 1,
-0.3330437, -1.199785, -3.519047, 0, 1, 0.2431373, 1,
-0.3329444, 0.6746829, 0.2881203, 0, 1, 0.2509804, 1,
-0.3326466, 0.5704974, -0.369022, 0, 1, 0.254902, 1,
-0.3305986, -0.8207536, -2.403221, 0, 1, 0.2627451, 1,
-0.3303548, 0.9907954, -1.018695, 0, 1, 0.2666667, 1,
-0.327225, 1.162977, -0.8630049, 0, 1, 0.2745098, 1,
-0.3257416, 1.22822, -1.55428, 0, 1, 0.2784314, 1,
-0.3249874, 1.023962, -0.2774197, 0, 1, 0.2862745, 1,
-0.3167163, 0.6659898, -0.8217438, 0, 1, 0.2901961, 1,
-0.3103083, 1.7191, 0.8795221, 0, 1, 0.2980392, 1,
-0.3087241, -1.219399, -2.219061, 0, 1, 0.3058824, 1,
-0.3083391, -2.107775, -1.814885, 0, 1, 0.3098039, 1,
-0.3054454, -0.05267617, -3.015483, 0, 1, 0.3176471, 1,
-0.3047585, -0.1829689, -1.594166, 0, 1, 0.3215686, 1,
-0.3037298, -1.796628, -5.562398, 0, 1, 0.3294118, 1,
-0.3021412, 1.454829, 0.7261496, 0, 1, 0.3333333, 1,
-0.2973593, 0.01934354, -2.111802, 0, 1, 0.3411765, 1,
-0.2953314, -0.6635743, -3.379583, 0, 1, 0.345098, 1,
-0.2908558, 0.8819132, -1.306454, 0, 1, 0.3529412, 1,
-0.2904714, -1.00074, -2.993483, 0, 1, 0.3568628, 1,
-0.2903185, -1.205434, -3.993779, 0, 1, 0.3647059, 1,
-0.2842541, -0.22635, -2.336217, 0, 1, 0.3686275, 1,
-0.2814324, -1.268694, -3.161831, 0, 1, 0.3764706, 1,
-0.280959, 0.8149548, 0.01735751, 0, 1, 0.3803922, 1,
-0.2797303, -0.09879176, -3.962264, 0, 1, 0.3882353, 1,
-0.2781823, -0.8065435, -1.466707, 0, 1, 0.3921569, 1,
-0.2764808, -0.6903701, -2.679878, 0, 1, 0.4, 1,
-0.2753578, 0.7063326, -0.6732441, 0, 1, 0.4078431, 1,
-0.2742985, -1.688924, -3.267698, 0, 1, 0.4117647, 1,
-0.2740506, -1.287571, -1.95069, 0, 1, 0.4196078, 1,
-0.2734589, 0.6689507, -2.186351, 0, 1, 0.4235294, 1,
-0.2734552, -0.3876014, -3.601857, 0, 1, 0.4313726, 1,
-0.2723697, 0.498148, -0.9746484, 0, 1, 0.4352941, 1,
-0.2704105, 1.076556, -0.08299572, 0, 1, 0.4431373, 1,
-0.2685745, -0.7416316, -3.991259, 0, 1, 0.4470588, 1,
-0.2684831, -0.3845187, -2.452888, 0, 1, 0.454902, 1,
-0.2677607, -0.5943652, -1.505279, 0, 1, 0.4588235, 1,
-0.2663413, 0.1986846, -0.782097, 0, 1, 0.4666667, 1,
-0.2539573, -0.1178682, -0.386914, 0, 1, 0.4705882, 1,
-0.2530122, -0.7146793, -0.8463324, 0, 1, 0.4784314, 1,
-0.2499807, -0.113651, -3.205863, 0, 1, 0.4823529, 1,
-0.2457305, -0.7970126, -2.777156, 0, 1, 0.4901961, 1,
-0.2419243, -1.420626, -2.762704, 0, 1, 0.4941176, 1,
-0.2373418, 0.4436245, -1.624345, 0, 1, 0.5019608, 1,
-0.2363266, 0.2125021, -0.4424216, 0, 1, 0.509804, 1,
-0.234242, -1.279841, -2.512619, 0, 1, 0.5137255, 1,
-0.2325574, -0.002391621, 0.549494, 0, 1, 0.5215687, 1,
-0.2258844, 1.117149, 0.5177686, 0, 1, 0.5254902, 1,
-0.2246819, -1.692055, -2.770838, 0, 1, 0.5333334, 1,
-0.2219404, 0.5651121, 1.061534, 0, 1, 0.5372549, 1,
-0.2185545, 0.3826151, -0.4170958, 0, 1, 0.5450981, 1,
-0.2158652, 0.5737378, 0.1129775, 0, 1, 0.5490196, 1,
-0.2138832, 1.521623, 0.4512141, 0, 1, 0.5568628, 1,
-0.2130046, -1.020484, -2.359029, 0, 1, 0.5607843, 1,
-0.2098246, -0.561506, -2.140734, 0, 1, 0.5686275, 1,
-0.2062636, -0.2738975, -2.211424, 0, 1, 0.572549, 1,
-0.2031444, 0.1010197, -0.1940266, 0, 1, 0.5803922, 1,
-0.1997549, -0.6287147, -2.279011, 0, 1, 0.5843138, 1,
-0.1964554, 0.9084987, 0.5222958, 0, 1, 0.5921569, 1,
-0.1924231, 1.474281, 0.5760044, 0, 1, 0.5960785, 1,
-0.1923522, 0.8099382, -1.928387, 0, 1, 0.6039216, 1,
-0.1868874, -0.590557, -3.083073, 0, 1, 0.6117647, 1,
-0.1865577, 1.033509, -0.5885698, 0, 1, 0.6156863, 1,
-0.183801, 0.813218, -1.508975, 0, 1, 0.6235294, 1,
-0.1831614, 0.9422553, 0.2952451, 0, 1, 0.627451, 1,
-0.1737102, -0.7923196, -2.226108, 0, 1, 0.6352941, 1,
-0.1691606, -0.1194259, -2.44905, 0, 1, 0.6392157, 1,
-0.1691091, -0.9458646, -3.392057, 0, 1, 0.6470588, 1,
-0.1644383, -1.034928, -3.595101, 0, 1, 0.6509804, 1,
-0.1575611, 1.127227, -0.9625924, 0, 1, 0.6588235, 1,
-0.1562965, 1.26585, 0.02904792, 0, 1, 0.6627451, 1,
-0.1556988, 0.0274182, 0.360072, 0, 1, 0.6705883, 1,
-0.153432, -0.3163868, -5.343453, 0, 1, 0.6745098, 1,
-0.1479662, -1.393858, -2.707921, 0, 1, 0.682353, 1,
-0.1474686, 2.943107, -0.06585621, 0, 1, 0.6862745, 1,
-0.1407551, -0.7902768, -3.247532, 0, 1, 0.6941177, 1,
-0.1399378, 0.1819861, -1.684013, 0, 1, 0.7019608, 1,
-0.1398974, 0.1823199, -0.2357894, 0, 1, 0.7058824, 1,
-0.1369534, 0.2146908, -1.683182, 0, 1, 0.7137255, 1,
-0.13626, 1.261898, -0.7294616, 0, 1, 0.7176471, 1,
-0.130525, -1.064186, -3.224285, 0, 1, 0.7254902, 1,
-0.1272731, -0.4069358, -2.37035, 0, 1, 0.7294118, 1,
-0.1211779, -1.843367, -3.240209, 0, 1, 0.7372549, 1,
-0.1200779, 0.2782002, -2.112294, 0, 1, 0.7411765, 1,
-0.1197589, -0.8988167, -3.768725, 0, 1, 0.7490196, 1,
-0.1172993, 0.1278224, -0.3404099, 0, 1, 0.7529412, 1,
-0.1163079, -0.6329773, -1.393973, 0, 1, 0.7607843, 1,
-0.1129654, 0.1694287, 0.3500249, 0, 1, 0.7647059, 1,
-0.1103253, 0.6299631, 1.454303, 0, 1, 0.772549, 1,
-0.1100926, 0.511124, -0.4909646, 0, 1, 0.7764706, 1,
-0.105662, -0.9840071, -3.416273, 0, 1, 0.7843137, 1,
-0.1047364, 0.4476638, -0.7267953, 0, 1, 0.7882353, 1,
-0.1031591, -0.8280883, -4.281757, 0, 1, 0.7960784, 1,
-0.1010412, 0.5973954, -1.031055, 0, 1, 0.8039216, 1,
-0.09563369, -0.6031752, -1.881902, 0, 1, 0.8078431, 1,
-0.08918467, -1.012737, -1.961935, 0, 1, 0.8156863, 1,
-0.089007, -2.695681, -3.372816, 0, 1, 0.8196079, 1,
-0.0881218, 1.088862, -0.1970351, 0, 1, 0.827451, 1,
-0.08655441, 0.5888553, -0.2381891, 0, 1, 0.8313726, 1,
-0.08026001, -2.289394, -2.903974, 0, 1, 0.8392157, 1,
-0.08017103, -0.7359154, -3.987005, 0, 1, 0.8431373, 1,
-0.07785098, -0.3008199, -1.779852, 0, 1, 0.8509804, 1,
-0.0756043, -0.3763688, -2.709429, 0, 1, 0.854902, 1,
-0.07254264, -1.717678, -1.996961, 0, 1, 0.8627451, 1,
-0.07113601, -0.6344663, -3.684629, 0, 1, 0.8666667, 1,
-0.06859007, 0.9866287, -0.0929305, 0, 1, 0.8745098, 1,
-0.06797259, -1.021612, -2.648981, 0, 1, 0.8784314, 1,
-0.06531955, 0.8148011, 0.582588, 0, 1, 0.8862745, 1,
-0.06372732, 0.0968192, -0.3242274, 0, 1, 0.8901961, 1,
-0.06320739, -1.752246, -2.846598, 0, 1, 0.8980392, 1,
-0.06309212, 0.5149199, -1.475261, 0, 1, 0.9058824, 1,
-0.06038679, -1.476278, -3.80106, 0, 1, 0.9098039, 1,
-0.05217859, 1.587086, -0.2147755, 0, 1, 0.9176471, 1,
-0.04976254, 0.3855537, 0.222377, 0, 1, 0.9215686, 1,
-0.04793556, -1.326535, -1.967402, 0, 1, 0.9294118, 1,
-0.04786136, 0.8743572, 1.584998, 0, 1, 0.9333333, 1,
-0.04128581, -0.1951705, -3.453516, 0, 1, 0.9411765, 1,
-0.03945678, 0.1140057, -0.3701747, 0, 1, 0.945098, 1,
-0.03743978, 1.220218, 0.7385467, 0, 1, 0.9529412, 1,
-0.03720151, -0.477335, -1.991665, 0, 1, 0.9568627, 1,
-0.03607823, -0.4768952, -4.207015, 0, 1, 0.9647059, 1,
-0.03455028, -0.01297111, -2.001702, 0, 1, 0.9686275, 1,
-0.03421977, 0.9150412, -1.001069, 0, 1, 0.9764706, 1,
-0.02908961, -0.6419556, -3.862252, 0, 1, 0.9803922, 1,
-0.02880978, -0.255849, -3.147408, 0, 1, 0.9882353, 1,
-0.02781715, -1.338699, -3.122914, 0, 1, 0.9921569, 1,
-0.02757838, -0.5339903, -3.345404, 0, 1, 1, 1,
-0.02452455, 0.2282692, -1.418591, 0, 0.9921569, 1, 1,
-0.02322714, -0.4771283, -4.189947, 0, 0.9882353, 1, 1,
-0.01992666, 0.8170652, -0.4949317, 0, 0.9803922, 1, 1,
-0.002239538, 0.04234312, 1.374172, 0, 0.9764706, 1, 1,
0.001600474, -0.5332958, 2.522894, 0, 0.9686275, 1, 1,
0.004267724, 1.100655, 0.09107829, 0, 0.9647059, 1, 1,
0.00601167, -0.9877148, 2.073224, 0, 0.9568627, 1, 1,
0.00754057, 1.641188, 0.6030781, 0, 0.9529412, 1, 1,
0.009135249, -0.8167776, 3.067526, 0, 0.945098, 1, 1,
0.01203617, -0.5979853, 3.650937, 0, 0.9411765, 1, 1,
0.01380197, 0.3652205, 0.6338965, 0, 0.9333333, 1, 1,
0.01624568, -0.7083807, 1.843543, 0, 0.9294118, 1, 1,
0.01694754, -0.5847688, 2.632887, 0, 0.9215686, 1, 1,
0.01759337, 0.6103467, -2.037371, 0, 0.9176471, 1, 1,
0.01955035, -0.7269116, 1.677259, 0, 0.9098039, 1, 1,
0.02141501, 0.2079286, 0.509501, 0, 0.9058824, 1, 1,
0.02525362, -0.3958023, 4.027281, 0, 0.8980392, 1, 1,
0.03277896, -0.2431684, 3.192751, 0, 0.8901961, 1, 1,
0.03357909, 0.4855767, -1.854589, 0, 0.8862745, 1, 1,
0.0349791, 1.088751, -0.4885732, 0, 0.8784314, 1, 1,
0.03707156, -0.992227, 2.401481, 0, 0.8745098, 1, 1,
0.03721539, 1.412561, -0.8559774, 0, 0.8666667, 1, 1,
0.03987301, 0.8299061, -1.118485, 0, 0.8627451, 1, 1,
0.04488426, 0.6270144, -2.426206, 0, 0.854902, 1, 1,
0.04705501, -1.273654, 3.103889, 0, 0.8509804, 1, 1,
0.04970508, 0.9481838, -0.8230239, 0, 0.8431373, 1, 1,
0.05490387, -0.5883336, 3.183925, 0, 0.8392157, 1, 1,
0.05777366, 1.749146, -2.181409, 0, 0.8313726, 1, 1,
0.06012981, 0.6007832, 0.9669562, 0, 0.827451, 1, 1,
0.06157421, -0.6451981, 4.004159, 0, 0.8196079, 1, 1,
0.06170914, 1.388665, -1.436886, 0, 0.8156863, 1, 1,
0.06617015, -0.01742095, 1.92364, 0, 0.8078431, 1, 1,
0.06617044, 2.985817, 0.6505854, 0, 0.8039216, 1, 1,
0.06706372, -1.805547, 4.842573, 0, 0.7960784, 1, 1,
0.06716865, 1.569043, -0.2500921, 0, 0.7882353, 1, 1,
0.06864324, -1.594662, 2.001141, 0, 0.7843137, 1, 1,
0.06875381, -0.5116464, 1.922993, 0, 0.7764706, 1, 1,
0.07338774, -0.8847701, 2.73383, 0, 0.772549, 1, 1,
0.07475698, -1.550441, 3.640079, 0, 0.7647059, 1, 1,
0.07558502, -0.6876436, 3.125967, 0, 0.7607843, 1, 1,
0.07919587, 0.5458073, -0.324894, 0, 0.7529412, 1, 1,
0.07969691, -0.3952886, 2.11111, 0, 0.7490196, 1, 1,
0.07979083, 0.4638245, -1.204972, 0, 0.7411765, 1, 1,
0.08112957, -0.04610514, 3.319368, 0, 0.7372549, 1, 1,
0.08224082, -1.028009, 2.820989, 0, 0.7294118, 1, 1,
0.08252434, 0.2891257, -1.854772, 0, 0.7254902, 1, 1,
0.082643, -0.05021927, 1.685596, 0, 0.7176471, 1, 1,
0.08765201, -1.11162, 4.164592, 0, 0.7137255, 1, 1,
0.08863004, -0.7347624, 4.713115, 0, 0.7058824, 1, 1,
0.08890627, -0.2812883, 2.461112, 0, 0.6980392, 1, 1,
0.09189056, 0.1340733, -0.4634014, 0, 0.6941177, 1, 1,
0.09327779, 2.345178, -1.330767, 0, 0.6862745, 1, 1,
0.09853046, -0.5979232, 1.143876, 0, 0.682353, 1, 1,
0.09881528, -0.5658899, 2.330917, 0, 0.6745098, 1, 1,
0.1000187, -0.8096593, 1.552753, 0, 0.6705883, 1, 1,
0.1026253, 0.1307896, -1.25009, 0, 0.6627451, 1, 1,
0.1038842, 1.800377, 0.7691088, 0, 0.6588235, 1, 1,
0.1064896, 0.6972625, 0.6387655, 0, 0.6509804, 1, 1,
0.1075776, -1.259678, 2.962806, 0, 0.6470588, 1, 1,
0.1104305, -0.05808427, 2.373632, 0, 0.6392157, 1, 1,
0.1116322, -0.3152935, 0.9451126, 0, 0.6352941, 1, 1,
0.1118807, -0.3733111, 2.583592, 0, 0.627451, 1, 1,
0.1118867, 0.1034075, 1.885493, 0, 0.6235294, 1, 1,
0.113764, -0.5394745, 2.370025, 0, 0.6156863, 1, 1,
0.114931, 1.261327, 0.3789131, 0, 0.6117647, 1, 1,
0.1167992, -0.03454598, 4.112091, 0, 0.6039216, 1, 1,
0.1218385, 1.126609, -0.5372321, 0, 0.5960785, 1, 1,
0.1232795, -1.898517, 3.708618, 0, 0.5921569, 1, 1,
0.1235962, 0.6969649, -0.01490438, 0, 0.5843138, 1, 1,
0.1323552, -0.8550717, 2.637936, 0, 0.5803922, 1, 1,
0.1332423, -0.3901585, 2.868011, 0, 0.572549, 1, 1,
0.1336202, -0.06568685, 3.480346, 0, 0.5686275, 1, 1,
0.1360213, 1.378665, 0.778551, 0, 0.5607843, 1, 1,
0.136754, 0.7905532, 1.093897, 0, 0.5568628, 1, 1,
0.1420094, 1.274614, -1.032249, 0, 0.5490196, 1, 1,
0.1449463, -0.1687623, 3.823555, 0, 0.5450981, 1, 1,
0.1485462, 0.6430709, -0.03497947, 0, 0.5372549, 1, 1,
0.1496403, 0.3908507, 2.454153, 0, 0.5333334, 1, 1,
0.1539996, -1.553849, 1.60756, 0, 0.5254902, 1, 1,
0.1582483, 0.7537507, 0.2253575, 0, 0.5215687, 1, 1,
0.1638754, -0.4947593, 3.801107, 0, 0.5137255, 1, 1,
0.1671101, 1.43791, 0.1064145, 0, 0.509804, 1, 1,
0.1674967, -0.732472, 4.137136, 0, 0.5019608, 1, 1,
0.1689623, -0.1636188, 1.98933, 0, 0.4941176, 1, 1,
0.1724, 0.4086209, 0.2298761, 0, 0.4901961, 1, 1,
0.1740311, 0.4311875, 1.482048, 0, 0.4823529, 1, 1,
0.1753553, 0.2618154, 1.436855, 0, 0.4784314, 1, 1,
0.1782667, 1.073939, 1.639041, 0, 0.4705882, 1, 1,
0.1794537, 0.5638034, 1.056817, 0, 0.4666667, 1, 1,
0.1823546, 1.936421, 0.6816704, 0, 0.4588235, 1, 1,
0.1831645, -1.087, 3.701805, 0, 0.454902, 1, 1,
0.1844919, 0.487907, -1.81155, 0, 0.4470588, 1, 1,
0.1886185, -0.4422729, 2.108041, 0, 0.4431373, 1, 1,
0.19352, 0.8330187, -0.6830028, 0, 0.4352941, 1, 1,
0.194057, 0.5593028, 1.061831, 0, 0.4313726, 1, 1,
0.1961876, -0.8232822, 3.496164, 0, 0.4235294, 1, 1,
0.1963655, -0.3533716, 5.351069, 0, 0.4196078, 1, 1,
0.1976451, -1.485713, 3.801385, 0, 0.4117647, 1, 1,
0.1999841, -0.6940308, 4.542392, 0, 0.4078431, 1, 1,
0.2034061, 1.126212, -1.032286, 0, 0.4, 1, 1,
0.2036539, -1.928421, 3.774147, 0, 0.3921569, 1, 1,
0.2043599, 0.1785379, 1.26685, 0, 0.3882353, 1, 1,
0.2068395, 0.4531213, 2.083582, 0, 0.3803922, 1, 1,
0.2088225, 0.3667082, -1.30595, 0, 0.3764706, 1, 1,
0.212301, -1.489717, 2.227268, 0, 0.3686275, 1, 1,
0.2172105, 0.1714527, 0.08149178, 0, 0.3647059, 1, 1,
0.2211393, -0.3314153, 1.973426, 0, 0.3568628, 1, 1,
0.2258379, -0.2110854, 3.019309, 0, 0.3529412, 1, 1,
0.2285011, -2.606318, 3.539315, 0, 0.345098, 1, 1,
0.2310522, 0.2433694, 1.071715, 0, 0.3411765, 1, 1,
0.2319395, 1.872457, -0.3158036, 0, 0.3333333, 1, 1,
0.2366445, -1.22211, 4.667126, 0, 0.3294118, 1, 1,
0.2377072, -0.3458126, 2.699191, 0, 0.3215686, 1, 1,
0.2391099, 0.01947976, 2.057657, 0, 0.3176471, 1, 1,
0.2421553, -0.7080192, 1.986714, 0, 0.3098039, 1, 1,
0.2449982, -0.8827755, 2.795597, 0, 0.3058824, 1, 1,
0.2454413, 0.02469409, 1.264915, 0, 0.2980392, 1, 1,
0.2466444, -1.257612, 4.23454, 0, 0.2901961, 1, 1,
0.2484729, -1.048098, 2.148175, 0, 0.2862745, 1, 1,
0.2491179, 0.7387151, 0.02519856, 0, 0.2784314, 1, 1,
0.2507897, 0.1433675, 0.4864427, 0, 0.2745098, 1, 1,
0.2510168, -1.223228, 2.190043, 0, 0.2666667, 1, 1,
0.2537426, -1.457577, 4.159109, 0, 0.2627451, 1, 1,
0.2545286, 0.449442, 0.297004, 0, 0.254902, 1, 1,
0.2550696, 1.731653, -0.3713847, 0, 0.2509804, 1, 1,
0.2588983, 1.007272, -0.3033921, 0, 0.2431373, 1, 1,
0.2595709, -0.2413457, 3.730517, 0, 0.2392157, 1, 1,
0.2608007, -0.9510342, 3.403018, 0, 0.2313726, 1, 1,
0.2616609, 0.0852095, 0.02125601, 0, 0.227451, 1, 1,
0.2638045, -1.349729, 4.884768, 0, 0.2196078, 1, 1,
0.2651719, -0.787936, 3.312179, 0, 0.2156863, 1, 1,
0.2680428, -0.5881982, 3.231972, 0, 0.2078431, 1, 1,
0.2683357, -0.5222596, 3.419673, 0, 0.2039216, 1, 1,
0.2697073, -0.4676464, 1.420318, 0, 0.1960784, 1, 1,
0.2718923, 0.9080498, -0.9675469, 0, 0.1882353, 1, 1,
0.2728794, -0.5782114, 2.23103, 0, 0.1843137, 1, 1,
0.2823547, -0.5143957, 2.889546, 0, 0.1764706, 1, 1,
0.2841011, 1.217104, -0.1375108, 0, 0.172549, 1, 1,
0.2847789, -0.308049, 2.563914, 0, 0.1647059, 1, 1,
0.285374, -0.6031985, 3.292862, 0, 0.1607843, 1, 1,
0.2937773, -1.534886, 2.23746, 0, 0.1529412, 1, 1,
0.297426, 1.948212, 1.421381, 0, 0.1490196, 1, 1,
0.297814, -1.03558, 2.948096, 0, 0.1411765, 1, 1,
0.2981794, 0.49042, -0.3002632, 0, 0.1372549, 1, 1,
0.3014263, 0.8951283, 1.067065, 0, 0.1294118, 1, 1,
0.3045126, -0.4539483, 2.470622, 0, 0.1254902, 1, 1,
0.306195, -1.542471, 1.799886, 0, 0.1176471, 1, 1,
0.3107649, -1.319615, 2.298941, 0, 0.1137255, 1, 1,
0.3113583, -0.6145803, 3.894118, 0, 0.1058824, 1, 1,
0.3151556, 2.633553, -0.384049, 0, 0.09803922, 1, 1,
0.3167871, -0.5638605, 2.738519, 0, 0.09411765, 1, 1,
0.3175669, -0.3738263, 2.90379, 0, 0.08627451, 1, 1,
0.3177345, -0.8788117, 2.839155, 0, 0.08235294, 1, 1,
0.3207563, -0.06747527, 2.210056, 0, 0.07450981, 1, 1,
0.3221036, -1.367371, 2.933864, 0, 0.07058824, 1, 1,
0.3232383, 0.4847336, 0.6138381, 0, 0.0627451, 1, 1,
0.3247261, -0.1260179, 2.852504, 0, 0.05882353, 1, 1,
0.3293661, 0.8470721, -0.2818396, 0, 0.05098039, 1, 1,
0.3308784, 0.3119774, 0.1698931, 0, 0.04705882, 1, 1,
0.3309844, 2.581922, 0.1918018, 0, 0.03921569, 1, 1,
0.331363, -0.03991799, 0.9883221, 0, 0.03529412, 1, 1,
0.331724, -0.2148491, 2.349119, 0, 0.02745098, 1, 1,
0.3411354, 1.69837, -1.351474, 0, 0.02352941, 1, 1,
0.3471884, 1.135321, 0.4888049, 0, 0.01568628, 1, 1,
0.349231, -0.3316224, 1.490574, 0, 0.01176471, 1, 1,
0.3493384, 0.1095642, 1.188923, 0, 0.003921569, 1, 1,
0.3507995, -0.2255108, 3.435126, 0.003921569, 0, 1, 1,
0.3512603, 0.1524902, 0.891101, 0.007843138, 0, 1, 1,
0.3520227, 0.9972241, -0.2143782, 0.01568628, 0, 1, 1,
0.3527214, -1.260729, 3.099227, 0.01960784, 0, 1, 1,
0.3527861, 1.625564, -0.9570614, 0.02745098, 0, 1, 1,
0.3600483, -2.249975, 1.886691, 0.03137255, 0, 1, 1,
0.3605891, 0.3231857, 0.007689901, 0.03921569, 0, 1, 1,
0.3619464, 1.106993, 1.198885, 0.04313726, 0, 1, 1,
0.3625521, -1.101543, 2.534923, 0.05098039, 0, 1, 1,
0.3636213, -0.1745453, 1.999389, 0.05490196, 0, 1, 1,
0.3656817, -1.728469, 3.211404, 0.0627451, 0, 1, 1,
0.3680651, 0.6365653, -0.4117765, 0.06666667, 0, 1, 1,
0.3713534, 1.101675, -1.083769, 0.07450981, 0, 1, 1,
0.3766786, -1.720646, 3.016446, 0.07843138, 0, 1, 1,
0.3768593, -1.427018, 2.103821, 0.08627451, 0, 1, 1,
0.3825302, -1.59067, 2.213466, 0.09019608, 0, 1, 1,
0.3830902, -1.19719, 2.224053, 0.09803922, 0, 1, 1,
0.3838684, -0.9220835, 3.298386, 0.1058824, 0, 1, 1,
0.3849007, 0.4696487, -0.003895256, 0.1098039, 0, 1, 1,
0.3865284, 0.7506728, 0.4497138, 0.1176471, 0, 1, 1,
0.3868836, 1.462235, 0.1477659, 0.1215686, 0, 1, 1,
0.3897472, 0.1093901, 1.025793, 0.1294118, 0, 1, 1,
0.3938595, 2.605912, 0.8594713, 0.1333333, 0, 1, 1,
0.3953441, 1.509984, 0.9559208, 0.1411765, 0, 1, 1,
0.3991917, -0.08525926, 2.673269, 0.145098, 0, 1, 1,
0.4000006, -0.402591, 0.5519186, 0.1529412, 0, 1, 1,
0.4087749, -0.7964517, 1.291534, 0.1568628, 0, 1, 1,
0.4153172, -0.2253752, 1.623827, 0.1647059, 0, 1, 1,
0.4199388, -0.7467495, 3.074548, 0.1686275, 0, 1, 1,
0.4215797, 0.4002261, 1.159434, 0.1764706, 0, 1, 1,
0.4231422, 2.083362, -0.9609191, 0.1803922, 0, 1, 1,
0.4234365, -1.039425, 2.866269, 0.1882353, 0, 1, 1,
0.4252259, -0.50933, 1.499157, 0.1921569, 0, 1, 1,
0.4261794, -0.2761291, 1.778252, 0.2, 0, 1, 1,
0.428157, 1.29675, 0.2960894, 0.2078431, 0, 1, 1,
0.4311135, -1.266601, 2.847514, 0.2117647, 0, 1, 1,
0.4318656, 0.7528846, 1.420342, 0.2196078, 0, 1, 1,
0.4347072, -1.109955, 1.388033, 0.2235294, 0, 1, 1,
0.4457005, -0.3875126, 1.572297, 0.2313726, 0, 1, 1,
0.4509651, -0.1072994, 3.604199, 0.2352941, 0, 1, 1,
0.4515156, -0.7165439, 3.072862, 0.2431373, 0, 1, 1,
0.4538974, -0.9398295, 4.800225, 0.2470588, 0, 1, 1,
0.4623547, 0.7087308, 0.7692344, 0.254902, 0, 1, 1,
0.462581, 2.034072, -0.4698216, 0.2588235, 0, 1, 1,
0.4642909, -0.901483, 3.491405, 0.2666667, 0, 1, 1,
0.4680277, -0.4104318, 3.539421, 0.2705882, 0, 1, 1,
0.4777991, -0.4038073, 2.748116, 0.2784314, 0, 1, 1,
0.4797721, 0.6534743, 0.1597166, 0.282353, 0, 1, 1,
0.4839931, -0.5840545, 2.231958, 0.2901961, 0, 1, 1,
0.4911087, -0.09800757, 0.5892014, 0.2941177, 0, 1, 1,
0.4926236, -0.53461, 2.583887, 0.3019608, 0, 1, 1,
0.4966319, 1.424964, -1.109824, 0.3098039, 0, 1, 1,
0.4986487, -0.8646311, 1.503648, 0.3137255, 0, 1, 1,
0.5003629, 0.5689704, 0.7778742, 0.3215686, 0, 1, 1,
0.5017868, -0.02766651, 2.338404, 0.3254902, 0, 1, 1,
0.5020183, -1.583215, 2.760397, 0.3333333, 0, 1, 1,
0.5020924, -1.491809, 2.928776, 0.3372549, 0, 1, 1,
0.502516, 0.6562163, 1.268219, 0.345098, 0, 1, 1,
0.5061946, 1.461064, 1.946831, 0.3490196, 0, 1, 1,
0.5082497, -0.5564024, 2.136281, 0.3568628, 0, 1, 1,
0.5162317, 0.5236222, 1.184774, 0.3607843, 0, 1, 1,
0.5207016, 0.1444117, 1.686415, 0.3686275, 0, 1, 1,
0.5233251, -0.3314229, 2.730534, 0.372549, 0, 1, 1,
0.5258725, -1.243235, 1.095997, 0.3803922, 0, 1, 1,
0.5263212, -0.1612081, 2.471123, 0.3843137, 0, 1, 1,
0.5265429, -1.551986, 3.377023, 0.3921569, 0, 1, 1,
0.5314378, 1.242245, 0.5681558, 0.3960784, 0, 1, 1,
0.5319866, 0.6352457, -0.5208154, 0.4039216, 0, 1, 1,
0.5402157, -0.6183992, 1.473717, 0.4117647, 0, 1, 1,
0.5443092, 1.391097, 0.3190372, 0.4156863, 0, 1, 1,
0.5472016, -1.293106, 3.101368, 0.4235294, 0, 1, 1,
0.5526223, 0.5747706, 0.8149148, 0.427451, 0, 1, 1,
0.5653915, -0.1307521, 0.04258751, 0.4352941, 0, 1, 1,
0.5683483, 0.07499331, 2.515054, 0.4392157, 0, 1, 1,
0.57398, -1.928889, 3.774998, 0.4470588, 0, 1, 1,
0.5747256, 0.7293597, 0.2951783, 0.4509804, 0, 1, 1,
0.5765226, 0.7743037, -0.2471843, 0.4588235, 0, 1, 1,
0.578344, -0.3213259, 3.125032, 0.4627451, 0, 1, 1,
0.5806962, -1.230174, 3.708509, 0.4705882, 0, 1, 1,
0.5809484, -0.3200819, 1.787635, 0.4745098, 0, 1, 1,
0.5821412, 0.4240629, -0.7312197, 0.4823529, 0, 1, 1,
0.5837457, -0.2871709, 3.301224, 0.4862745, 0, 1, 1,
0.5926807, -1.092643, 5.165647, 0.4941176, 0, 1, 1,
0.5964198, -1.767813, 3.690432, 0.5019608, 0, 1, 1,
0.6050775, -1.191204, 1.944873, 0.5058824, 0, 1, 1,
0.6055138, -0.05417465, 3.094623, 0.5137255, 0, 1, 1,
0.6118322, 0.8795152, -0.1488153, 0.5176471, 0, 1, 1,
0.6133523, 1.849424, 0.8436247, 0.5254902, 0, 1, 1,
0.6265617, 0.3643571, 1.858031, 0.5294118, 0, 1, 1,
0.6297312, -0.5982963, 2.95775, 0.5372549, 0, 1, 1,
0.6317158, -0.9491372, 2.484755, 0.5411765, 0, 1, 1,
0.6334609, -2.58064, 3.256674, 0.5490196, 0, 1, 1,
0.6458193, 0.3467104, -1.201158, 0.5529412, 0, 1, 1,
0.6472467, 0.1028859, 0.3211946, 0.5607843, 0, 1, 1,
0.6540332, -0.6249414, 2.712919, 0.5647059, 0, 1, 1,
0.6561598, -0.536023, 1.43573, 0.572549, 0, 1, 1,
0.6562431, 1.014053, -1.295604, 0.5764706, 0, 1, 1,
0.6607678, 0.04445789, 0.6277863, 0.5843138, 0, 1, 1,
0.6697512, 1.063724, 2.36297, 0.5882353, 0, 1, 1,
0.6699331, 1.571182, 0.3150855, 0.5960785, 0, 1, 1,
0.6742979, 1.824413, -0.1071835, 0.6039216, 0, 1, 1,
0.6758943, -1.191729, 1.569852, 0.6078432, 0, 1, 1,
0.6771272, 1.503064, 1.724361, 0.6156863, 0, 1, 1,
0.6793576, -0.9583442, 1.711334, 0.6196079, 0, 1, 1,
0.6814918, -1.442288, 2.479482, 0.627451, 0, 1, 1,
0.684655, -0.7061285, 1.142634, 0.6313726, 0, 1, 1,
0.6933185, 1.014031, 2.002735, 0.6392157, 0, 1, 1,
0.6939415, -0.7800629, 0.4240973, 0.6431373, 0, 1, 1,
0.7025843, 0.9752006, 0.4724608, 0.6509804, 0, 1, 1,
0.7060009, 0.1016563, 1.769232, 0.654902, 0, 1, 1,
0.7083693, 0.3963134, 2.633868, 0.6627451, 0, 1, 1,
0.7185132, 0.776536, 1.989839, 0.6666667, 0, 1, 1,
0.7190618, 0.7908069, 1.42418, 0.6745098, 0, 1, 1,
0.7266049, -1.679466, 2.034586, 0.6784314, 0, 1, 1,
0.7315236, -3.356695, 3.16963, 0.6862745, 0, 1, 1,
0.7325109, -0.464693, 0.5592191, 0.6901961, 0, 1, 1,
0.7359971, -1.108582, 1.905486, 0.6980392, 0, 1, 1,
0.7450587, 0.3912012, 1.847346, 0.7058824, 0, 1, 1,
0.7471043, 0.2689331, 2.623492, 0.7098039, 0, 1, 1,
0.7495123, -0.5200855, 1.805752, 0.7176471, 0, 1, 1,
0.7588532, -0.2992156, 2.037878, 0.7215686, 0, 1, 1,
0.7602209, 0.3116299, 1.812115, 0.7294118, 0, 1, 1,
0.7620136, 1.02358, 0.908021, 0.7333333, 0, 1, 1,
0.7637668, 0.6446893, 1.040326, 0.7411765, 0, 1, 1,
0.7650457, -1.393212, 4.304141, 0.7450981, 0, 1, 1,
0.7667706, 0.8479868, 0.7707935, 0.7529412, 0, 1, 1,
0.7677885, -0.4610505, 1.915327, 0.7568628, 0, 1, 1,
0.7758018, 0.8028951, 0.2436999, 0.7647059, 0, 1, 1,
0.7766889, 2.050161, 0.8074756, 0.7686275, 0, 1, 1,
0.778828, 0.254082, 1.767875, 0.7764706, 0, 1, 1,
0.7804681, -0.6149211, 2.193965, 0.7803922, 0, 1, 1,
0.7842746, 0.875828, 0.1462287, 0.7882353, 0, 1, 1,
0.7895753, -0.48362, 1.679694, 0.7921569, 0, 1, 1,
0.7905958, 1.293967, 1.204419, 0.8, 0, 1, 1,
0.7972569, 0.5345191, 2.592821, 0.8078431, 0, 1, 1,
0.8047091, 1.084177, 1.250335, 0.8117647, 0, 1, 1,
0.8074394, -0.3109153, 1.361215, 0.8196079, 0, 1, 1,
0.8089423, -0.7415074, 3.305983, 0.8235294, 0, 1, 1,
0.815777, -1.26264, 2.512241, 0.8313726, 0, 1, 1,
0.8195232, 0.5377006, 1.045961, 0.8352941, 0, 1, 1,
0.8208524, -0.2513939, 1.089428, 0.8431373, 0, 1, 1,
0.8228079, -0.09950492, 2.894577, 0.8470588, 0, 1, 1,
0.835723, -0.4291498, 2.324022, 0.854902, 0, 1, 1,
0.837044, 1.337067, -0.7173342, 0.8588235, 0, 1, 1,
0.8387806, -0.7962347, 2.344269, 0.8666667, 0, 1, 1,
0.8496978, -0.2886766, 1.697909, 0.8705882, 0, 1, 1,
0.8514514, 0.2301198, -0.03940526, 0.8784314, 0, 1, 1,
0.852627, -1.442414, 4.14535, 0.8823529, 0, 1, 1,
0.854499, 1.187554, -0.4697542, 0.8901961, 0, 1, 1,
0.8580624, 0.4412955, 0.4233462, 0.8941177, 0, 1, 1,
0.8605081, -0.7833559, 2.777116, 0.9019608, 0, 1, 1,
0.8721684, 1.328207, 0.03432699, 0.9098039, 0, 1, 1,
0.8787364, 0.4410028, 0.3189233, 0.9137255, 0, 1, 1,
0.8810614, 0.3351646, 0.9266514, 0.9215686, 0, 1, 1,
0.8812492, -0.7697256, 2.937779, 0.9254902, 0, 1, 1,
0.8820956, -0.5742507, 1.909375, 0.9333333, 0, 1, 1,
0.8827366, 1.65342, 0.4645843, 0.9372549, 0, 1, 1,
0.8858376, 0.4519976, 0.1175181, 0.945098, 0, 1, 1,
0.889886, 0.03971682, 0.6506901, 0.9490196, 0, 1, 1,
0.8908197, 0.6721349, 1.502496, 0.9568627, 0, 1, 1,
0.8930735, -0.2890735, 2.838412, 0.9607843, 0, 1, 1,
0.8937005, -0.9991277, 2.712384, 0.9686275, 0, 1, 1,
0.8962018, 0.5167903, 0.8982553, 0.972549, 0, 1, 1,
0.8981871, -1.123961, 4.779325, 0.9803922, 0, 1, 1,
0.8989024, 0.1436782, 1.810101, 0.9843137, 0, 1, 1,
0.8998551, 0.6725889, 0.480171, 0.9921569, 0, 1, 1,
0.9054454, 0.3403431, 1.795883, 0.9960784, 0, 1, 1,
0.905948, -1.719143, 2.542337, 1, 0, 0.9960784, 1,
0.9150771, 0.6353933, 0.2318916, 1, 0, 0.9882353, 1,
0.9187173, -0.010738, 1.639, 1, 0, 0.9843137, 1,
0.919708, -0.6242476, 1.120571, 1, 0, 0.9764706, 1,
0.9234647, 0.7346152, 0.2500578, 1, 0, 0.972549, 1,
0.9531798, -0.5395832, 4.046436, 1, 0, 0.9647059, 1,
0.9555662, -0.6689848, 2.420298, 1, 0, 0.9607843, 1,
0.9562886, 0.6334448, 0.9804817, 1, 0, 0.9529412, 1,
0.96706, 0.4724177, 0.2873412, 1, 0, 0.9490196, 1,
0.9803458, 0.9647213, 0.9407268, 1, 0, 0.9411765, 1,
0.9858503, -0.7101153, 3.171634, 1, 0, 0.9372549, 1,
0.9922615, -1.049066, 1.310038, 1, 0, 0.9294118, 1,
1.002619, 0.2378241, -0.5744696, 1, 0, 0.9254902, 1,
1.00351, -1.610136, 2.673116, 1, 0, 0.9176471, 1,
1.008335, -0.7626328, 3.756984, 1, 0, 0.9137255, 1,
1.01132, 0.7589833, 1.609907, 1, 0, 0.9058824, 1,
1.01899, -0.8035371, 3.621441, 1, 0, 0.9019608, 1,
1.02618, 0.2586575, -0.4769442, 1, 0, 0.8941177, 1,
1.038376, -1.765015, 3.134646, 1, 0, 0.8862745, 1,
1.039208, 0.5035684, 1.230282, 1, 0, 0.8823529, 1,
1.043741, 0.9403471, 0.3023813, 1, 0, 0.8745098, 1,
1.04578, 0.6095677, 0.730711, 1, 0, 0.8705882, 1,
1.045882, -1.406166, 2.793209, 1, 0, 0.8627451, 1,
1.047863, -0.8117554, 1.277001, 1, 0, 0.8588235, 1,
1.055169, 0.9404784, 1.679458, 1, 0, 0.8509804, 1,
1.060462, -1.19554, 1.723595, 1, 0, 0.8470588, 1,
1.060584, 0.5055469, 2.07511, 1, 0, 0.8392157, 1,
1.063158, -2.006706, 2.658942, 1, 0, 0.8352941, 1,
1.066749, 1.754461, 1.064958, 1, 0, 0.827451, 1,
1.09766, -0.2988779, 2.329803, 1, 0, 0.8235294, 1,
1.09813, -0.6903734, 3.557249, 1, 0, 0.8156863, 1,
1.111554, -0.3462075, 2.64637, 1, 0, 0.8117647, 1,
1.117523, -1.621213, 1.752453, 1, 0, 0.8039216, 1,
1.125034, 0.4113102, 1.459218, 1, 0, 0.7960784, 1,
1.132776, 0.7744148, 1.650531, 1, 0, 0.7921569, 1,
1.133703, -0.8789687, 1.460623, 1, 0, 0.7843137, 1,
1.145871, 0.4662483, 2.070969, 1, 0, 0.7803922, 1,
1.151456, 0.5185143, 0.4932259, 1, 0, 0.772549, 1,
1.154749, -0.6188214, 0.5053179, 1, 0, 0.7686275, 1,
1.160252, -1.007929, 3.213324, 1, 0, 0.7607843, 1,
1.161058, -1.0983, 3.070018, 1, 0, 0.7568628, 1,
1.161758, 0.7848532, -0.600688, 1, 0, 0.7490196, 1,
1.163202, 0.2724369, 1.714245, 1, 0, 0.7450981, 1,
1.164781, 1.89538, -1.742205, 1, 0, 0.7372549, 1,
1.168556, 0.3678333, 1.918828, 1, 0, 0.7333333, 1,
1.178633, -1.913074, 1.870778, 1, 0, 0.7254902, 1,
1.190413, 0.4745888, 1.622743, 1, 0, 0.7215686, 1,
1.198648, 0.201457, 2.386115, 1, 0, 0.7137255, 1,
1.218676, -1.041524, 3.14883, 1, 0, 0.7098039, 1,
1.233233, -0.8418416, 1.770513, 1, 0, 0.7019608, 1,
1.236422, -0.471779, 1.813732, 1, 0, 0.6941177, 1,
1.243803, 1.340974, 0.4983609, 1, 0, 0.6901961, 1,
1.253016, 0.612973, 2.100919, 1, 0, 0.682353, 1,
1.265748, 0.02213376, 3.925888, 1, 0, 0.6784314, 1,
1.26891, 1.191127, 0.9589995, 1, 0, 0.6705883, 1,
1.274242, -0.3311614, 3.50721, 1, 0, 0.6666667, 1,
1.278226, -1.570092, 2.474305, 1, 0, 0.6588235, 1,
1.283169, 0.157891, 1.212322, 1, 0, 0.654902, 1,
1.284358, -1.566557, 1.94475, 1, 0, 0.6470588, 1,
1.288519, -0.1887158, 1.107973, 1, 0, 0.6431373, 1,
1.28962, 1.168433, 0.8005714, 1, 0, 0.6352941, 1,
1.300211, -0.1672607, 2.701608, 1, 0, 0.6313726, 1,
1.306466, -0.5861071, 1.544184, 1, 0, 0.6235294, 1,
1.310526, -0.9543728, 1.86758, 1, 0, 0.6196079, 1,
1.312174, 1.32535, 0.9671229, 1, 0, 0.6117647, 1,
1.314363, 0.3699971, 2.960599, 1, 0, 0.6078432, 1,
1.319194, 0.04502508, 2.975489, 1, 0, 0.6, 1,
1.33324, 1.335999, 0.316301, 1, 0, 0.5921569, 1,
1.343275, 0.964168, 1.27662, 1, 0, 0.5882353, 1,
1.348467, 1.730961, 1.927788, 1, 0, 0.5803922, 1,
1.348961, -3.043219, 0.5140741, 1, 0, 0.5764706, 1,
1.349496, -0.9784228, 1.568276, 1, 0, 0.5686275, 1,
1.362807, -0.9638402, 3.565536, 1, 0, 0.5647059, 1,
1.371778, 0.8819697, 1.142282, 1, 0, 0.5568628, 1,
1.376342, -0.255728, 1.125661, 1, 0, 0.5529412, 1,
1.377641, 0.2941375, 2.048155, 1, 0, 0.5450981, 1,
1.392522, -1.102919, 2.66295, 1, 0, 0.5411765, 1,
1.398028, 1.27029, 2.426243, 1, 0, 0.5333334, 1,
1.41166, -0.6957022, 3.071981, 1, 0, 0.5294118, 1,
1.416531, 2.140993, 0.9741749, 1, 0, 0.5215687, 1,
1.438833, -0.9971673, 2.666635, 1, 0, 0.5176471, 1,
1.442505, 0.8575112, 0.4044346, 1, 0, 0.509804, 1,
1.44838, -0.2510133, 2.416544, 1, 0, 0.5058824, 1,
1.45453, 0.6238741, 2.021894, 1, 0, 0.4980392, 1,
1.459223, 0.1900356, -0.09762964, 1, 0, 0.4901961, 1,
1.460259, 0.2382628, 1.857165, 1, 0, 0.4862745, 1,
1.460436, -0.1633014, 2.350645, 1, 0, 0.4784314, 1,
1.478929, 0.4943793, -0.1278121, 1, 0, 0.4745098, 1,
1.483469, 1.682702, -0.02054746, 1, 0, 0.4666667, 1,
1.488243, -0.818701, 1.804293, 1, 0, 0.4627451, 1,
1.490369, -0.5782615, 0.736849, 1, 0, 0.454902, 1,
1.497247, 0.5103601, 1.046019, 1, 0, 0.4509804, 1,
1.505314, -1.794477, 3.269649, 1, 0, 0.4431373, 1,
1.509962, 0.4398475, 0.8008109, 1, 0, 0.4392157, 1,
1.516863, 0.1537641, -0.32442, 1, 0, 0.4313726, 1,
1.522185, -0.4720258, 1.852799, 1, 0, 0.427451, 1,
1.522807, 0.8617789, 1.001069, 1, 0, 0.4196078, 1,
1.53012, -1.490846, 2.778799, 1, 0, 0.4156863, 1,
1.539405, -0.01402748, 2.261812, 1, 0, 0.4078431, 1,
1.539828, 1.242224, -0.05301158, 1, 0, 0.4039216, 1,
1.541807, 0.6440437, 2.258406, 1, 0, 0.3960784, 1,
1.546104, -0.9191839, 1.657854, 1, 0, 0.3882353, 1,
1.555801, -1.424878, 3.033914, 1, 0, 0.3843137, 1,
1.566616, 0.376231, 2.540319, 1, 0, 0.3764706, 1,
1.56802, -0.6641498, 1.132897, 1, 0, 0.372549, 1,
1.579058, 0.3953013, -0.01162174, 1, 0, 0.3647059, 1,
1.586513, 1.39982, 1.538847, 1, 0, 0.3607843, 1,
1.593746, -0.4640837, 1.242024, 1, 0, 0.3529412, 1,
1.610453, -0.8604516, 3.463232, 1, 0, 0.3490196, 1,
1.626214, 0.1475179, -0.1651833, 1, 0, 0.3411765, 1,
1.631173, 1.079885, 0.2865142, 1, 0, 0.3372549, 1,
1.644241, 1.724911, 2.177232, 1, 0, 0.3294118, 1,
1.658837, 0.05299961, -0.1984705, 1, 0, 0.3254902, 1,
1.666079, -0.5847952, 0.3795814, 1, 0, 0.3176471, 1,
1.677058, 0.8877686, 0.3199301, 1, 0, 0.3137255, 1,
1.682676, -0.3673722, 1.615011, 1, 0, 0.3058824, 1,
1.701579, 0.9702874, 2.606014, 1, 0, 0.2980392, 1,
1.70686, -0.2694207, 1.04366, 1, 0, 0.2941177, 1,
1.712157, -0.271243, 1.708236, 1, 0, 0.2862745, 1,
1.723094, -0.6800554, 1.986832, 1, 0, 0.282353, 1,
1.729021, 1.750786, 0.4719723, 1, 0, 0.2745098, 1,
1.737786, 0.3184729, 1.139677, 1, 0, 0.2705882, 1,
1.763397, -0.7896638, 0.6111155, 1, 0, 0.2627451, 1,
1.767013, -0.1586578, -1.442022, 1, 0, 0.2588235, 1,
1.808967, -0.192004, 2.700786, 1, 0, 0.2509804, 1,
1.811708, 0.3129793, 1.513423, 1, 0, 0.2470588, 1,
1.856684, 0.9035673, -0.2456563, 1, 0, 0.2392157, 1,
1.869501, -0.6414091, 0.5913795, 1, 0, 0.2352941, 1,
1.887386, 1.127238, 1.548172, 1, 0, 0.227451, 1,
1.912214, -0.8702617, 1.730099, 1, 0, 0.2235294, 1,
1.912567, 0.7131967, -0.5141113, 1, 0, 0.2156863, 1,
1.933341, 1.037378, 1.441556, 1, 0, 0.2117647, 1,
1.961477, -1.217098, 2.5643, 1, 0, 0.2039216, 1,
1.975634, -1.343887, 0.7924142, 1, 0, 0.1960784, 1,
1.997583, -0.8928188, 1.2159, 1, 0, 0.1921569, 1,
2.003688, -0.8838066, 1.27557, 1, 0, 0.1843137, 1,
2.009264, -1.085877, 1.908316, 1, 0, 0.1803922, 1,
2.016471, 0.1085989, 2.21716, 1, 0, 0.172549, 1,
2.036393, -1.594481, 2.317701, 1, 0, 0.1686275, 1,
2.040162, -0.1574793, 1.744493, 1, 0, 0.1607843, 1,
2.046879, -2.80487, 1.09864, 1, 0, 0.1568628, 1,
2.072537, 1.613401, 1.323843, 1, 0, 0.1490196, 1,
2.078221, -0.6689995, 1.451017, 1, 0, 0.145098, 1,
2.082962, -0.2359122, 2.284451, 1, 0, 0.1372549, 1,
2.085224, 1.057894, 0.7908137, 1, 0, 0.1333333, 1,
2.110312, 0.4248896, 4.157885, 1, 0, 0.1254902, 1,
2.121276, 0.4024355, 0.4832694, 1, 0, 0.1215686, 1,
2.124051, 0.09623067, 3.011595, 1, 0, 0.1137255, 1,
2.14201, 0.5774217, 1.468295, 1, 0, 0.1098039, 1,
2.187116, -1.983726, 2.116214, 1, 0, 0.1019608, 1,
2.201951, 0.6673518, 2.144265, 1, 0, 0.09411765, 1,
2.216816, -1.238244, 0.1322043, 1, 0, 0.09019608, 1,
2.282933, -0.4763061, 2.308205, 1, 0, 0.08235294, 1,
2.294482, -1.702708, 3.793615, 1, 0, 0.07843138, 1,
2.366006, 0.7444229, 1.938135, 1, 0, 0.07058824, 1,
2.366795, 0.01000271, 3.526654, 1, 0, 0.06666667, 1,
2.40702, 0.6876732, 2.704257, 1, 0, 0.05882353, 1,
2.438387, 1.366304, 2.12484, 1, 0, 0.05490196, 1,
2.450415, -1.023817, 0.4406958, 1, 0, 0.04705882, 1,
2.457053, 0.530081, 2.145241, 1, 0, 0.04313726, 1,
2.503377, 0.9523489, -0.4176876, 1, 0, 0.03529412, 1,
2.775381, 0.4055868, 2.250506, 1, 0, 0.03137255, 1,
2.858031, -0.6520067, 2.787653, 1, 0, 0.02352941, 1,
2.879285, 0.6255728, 0.7644764, 1, 0, 0.01960784, 1,
3.149244, 1.778156, 1.273737, 1, 0, 0.01176471, 1,
3.500741, -0.3637828, 2.823127, 1, 0, 0.007843138, 1
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
0.3190963, -4.43175, -7.41223, 0, -0.5, 0.5, 0.5,
0.3190963, -4.43175, -7.41223, 1, -0.5, 0.5, 0.5,
0.3190963, -4.43175, -7.41223, 1, 1.5, 0.5, 0.5,
0.3190963, -4.43175, -7.41223, 0, 1.5, 0.5, 0.5
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
-3.941125, -0.1854386, -7.41223, 0, -0.5, 0.5, 0.5,
-3.941125, -0.1854386, -7.41223, 1, -0.5, 0.5, 0.5,
-3.941125, -0.1854386, -7.41223, 1, 1.5, 0.5, 0.5,
-3.941125, -0.1854386, -7.41223, 0, 1.5, 0.5, 0.5
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
-3.941125, -4.43175, -0.1056643, 0, -0.5, 0.5, 0.5,
-3.941125, -4.43175, -0.1056643, 1, -0.5, 0.5, 0.5,
-3.941125, -4.43175, -0.1056643, 1, 1.5, 0.5, 0.5,
-3.941125, -4.43175, -0.1056643, 0, 1.5, 0.5, 0.5
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
-2, -3.451832, -5.7261,
3, -3.451832, -5.7261,
-2, -3.451832, -5.7261,
-2, -3.615152, -6.007122,
-1, -3.451832, -5.7261,
-1, -3.615152, -6.007122,
0, -3.451832, -5.7261,
0, -3.615152, -6.007122,
1, -3.451832, -5.7261,
1, -3.615152, -6.007122,
2, -3.451832, -5.7261,
2, -3.615152, -6.007122,
3, -3.451832, -5.7261,
3, -3.615152, -6.007122
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
-2, -3.941792, -6.569165, 0, -0.5, 0.5, 0.5,
-2, -3.941792, -6.569165, 1, -0.5, 0.5, 0.5,
-2, -3.941792, -6.569165, 1, 1.5, 0.5, 0.5,
-2, -3.941792, -6.569165, 0, 1.5, 0.5, 0.5,
-1, -3.941792, -6.569165, 0, -0.5, 0.5, 0.5,
-1, -3.941792, -6.569165, 1, -0.5, 0.5, 0.5,
-1, -3.941792, -6.569165, 1, 1.5, 0.5, 0.5,
-1, -3.941792, -6.569165, 0, 1.5, 0.5, 0.5,
0, -3.941792, -6.569165, 0, -0.5, 0.5, 0.5,
0, -3.941792, -6.569165, 1, -0.5, 0.5, 0.5,
0, -3.941792, -6.569165, 1, 1.5, 0.5, 0.5,
0, -3.941792, -6.569165, 0, 1.5, 0.5, 0.5,
1, -3.941792, -6.569165, 0, -0.5, 0.5, 0.5,
1, -3.941792, -6.569165, 1, -0.5, 0.5, 0.5,
1, -3.941792, -6.569165, 1, 1.5, 0.5, 0.5,
1, -3.941792, -6.569165, 0, 1.5, 0.5, 0.5,
2, -3.941792, -6.569165, 0, -0.5, 0.5, 0.5,
2, -3.941792, -6.569165, 1, -0.5, 0.5, 0.5,
2, -3.941792, -6.569165, 1, 1.5, 0.5, 0.5,
2, -3.941792, -6.569165, 0, 1.5, 0.5, 0.5,
3, -3.941792, -6.569165, 0, -0.5, 0.5, 0.5,
3, -3.941792, -6.569165, 1, -0.5, 0.5, 0.5,
3, -3.941792, -6.569165, 1, 1.5, 0.5, 0.5,
3, -3.941792, -6.569165, 0, 1.5, 0.5, 0.5
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
-2.957997, -3, -5.7261,
-2.957997, 2, -5.7261,
-2.957997, -3, -5.7261,
-3.121852, -3, -6.007122,
-2.957997, -2, -5.7261,
-3.121852, -2, -6.007122,
-2.957997, -1, -5.7261,
-3.121852, -1, -6.007122,
-2.957997, 0, -5.7261,
-3.121852, 0, -6.007122,
-2.957997, 1, -5.7261,
-3.121852, 1, -6.007122,
-2.957997, 2, -5.7261,
-3.121852, 2, -6.007122
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
-3.449561, -3, -6.569165, 0, -0.5, 0.5, 0.5,
-3.449561, -3, -6.569165, 1, -0.5, 0.5, 0.5,
-3.449561, -3, -6.569165, 1, 1.5, 0.5, 0.5,
-3.449561, -3, -6.569165, 0, 1.5, 0.5, 0.5,
-3.449561, -2, -6.569165, 0, -0.5, 0.5, 0.5,
-3.449561, -2, -6.569165, 1, -0.5, 0.5, 0.5,
-3.449561, -2, -6.569165, 1, 1.5, 0.5, 0.5,
-3.449561, -2, -6.569165, 0, 1.5, 0.5, 0.5,
-3.449561, -1, -6.569165, 0, -0.5, 0.5, 0.5,
-3.449561, -1, -6.569165, 1, -0.5, 0.5, 0.5,
-3.449561, -1, -6.569165, 1, 1.5, 0.5, 0.5,
-3.449561, -1, -6.569165, 0, 1.5, 0.5, 0.5,
-3.449561, 0, -6.569165, 0, -0.5, 0.5, 0.5,
-3.449561, 0, -6.569165, 1, -0.5, 0.5, 0.5,
-3.449561, 0, -6.569165, 1, 1.5, 0.5, 0.5,
-3.449561, 0, -6.569165, 0, 1.5, 0.5, 0.5,
-3.449561, 1, -6.569165, 0, -0.5, 0.5, 0.5,
-3.449561, 1, -6.569165, 1, -0.5, 0.5, 0.5,
-3.449561, 1, -6.569165, 1, 1.5, 0.5, 0.5,
-3.449561, 1, -6.569165, 0, 1.5, 0.5, 0.5,
-3.449561, 2, -6.569165, 0, -0.5, 0.5, 0.5,
-3.449561, 2, -6.569165, 1, -0.5, 0.5, 0.5,
-3.449561, 2, -6.569165, 1, 1.5, 0.5, 0.5,
-3.449561, 2, -6.569165, 0, 1.5, 0.5, 0.5
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
-2.957997, -3.451832, -4,
-2.957997, -3.451832, 4,
-2.957997, -3.451832, -4,
-3.121852, -3.615152, -4,
-2.957997, -3.451832, -2,
-3.121852, -3.615152, -2,
-2.957997, -3.451832, 0,
-3.121852, -3.615152, 0,
-2.957997, -3.451832, 2,
-3.121852, -3.615152, 2,
-2.957997, -3.451832, 4,
-3.121852, -3.615152, 4
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
-3.449561, -3.941792, -4, 0, -0.5, 0.5, 0.5,
-3.449561, -3.941792, -4, 1, -0.5, 0.5, 0.5,
-3.449561, -3.941792, -4, 1, 1.5, 0.5, 0.5,
-3.449561, -3.941792, -4, 0, 1.5, 0.5, 0.5,
-3.449561, -3.941792, -2, 0, -0.5, 0.5, 0.5,
-3.449561, -3.941792, -2, 1, -0.5, 0.5, 0.5,
-3.449561, -3.941792, -2, 1, 1.5, 0.5, 0.5,
-3.449561, -3.941792, -2, 0, 1.5, 0.5, 0.5,
-3.449561, -3.941792, 0, 0, -0.5, 0.5, 0.5,
-3.449561, -3.941792, 0, 1, -0.5, 0.5, 0.5,
-3.449561, -3.941792, 0, 1, 1.5, 0.5, 0.5,
-3.449561, -3.941792, 0, 0, 1.5, 0.5, 0.5,
-3.449561, -3.941792, 2, 0, -0.5, 0.5, 0.5,
-3.449561, -3.941792, 2, 1, -0.5, 0.5, 0.5,
-3.449561, -3.941792, 2, 1, 1.5, 0.5, 0.5,
-3.449561, -3.941792, 2, 0, 1.5, 0.5, 0.5,
-3.449561, -3.941792, 4, 0, -0.5, 0.5, 0.5,
-3.449561, -3.941792, 4, 1, -0.5, 0.5, 0.5,
-3.449561, -3.941792, 4, 1, 1.5, 0.5, 0.5,
-3.449561, -3.941792, 4, 0, 1.5, 0.5, 0.5
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
-2.957997, -3.451832, -5.7261,
-2.957997, 3.080955, -5.7261,
-2.957997, -3.451832, 5.514771,
-2.957997, 3.080955, 5.514771,
-2.957997, -3.451832, -5.7261,
-2.957997, -3.451832, 5.514771,
-2.957997, 3.080955, -5.7261,
-2.957997, 3.080955, 5.514771,
-2.957997, -3.451832, -5.7261,
3.59619, -3.451832, -5.7261,
-2.957997, -3.451832, 5.514771,
3.59619, -3.451832, 5.514771,
-2.957997, 3.080955, -5.7261,
3.59619, 3.080955, -5.7261,
-2.957997, 3.080955, 5.514771,
3.59619, 3.080955, 5.514771,
3.59619, -3.451832, -5.7261,
3.59619, 3.080955, -5.7261,
3.59619, -3.451832, 5.514771,
3.59619, 3.080955, 5.514771,
3.59619, -3.451832, -5.7261,
3.59619, -3.451832, 5.514771,
3.59619, 3.080955, -5.7261,
3.59619, 3.080955, 5.514771
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
var radius = 7.774726;
var distance = 34.59063;
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
mvMatrix.translate( -0.3190963, 0.1854386, 0.1056643 );
mvMatrix.scale( 1.282567, 1.286769, 0.7478233 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.59063);
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
pyrifenox<-read.table("pyrifenox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrifenox$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrifenox' not found
```

```r
y<-pyrifenox$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrifenox' not found
```

```r
z<-pyrifenox$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrifenox' not found
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
-2.862548, -1.008775, -2.650034, 0, 0, 1, 1, 1,
-2.796356, -1.142577, -1.078627, 1, 0, 0, 1, 1,
-2.560308, -0.8559505, -1.896182, 1, 0, 0, 1, 1,
-2.501152, 0.6739388, -1.613838, 1, 0, 0, 1, 1,
-2.429162, -0.2644921, -1.362924, 1, 0, 0, 1, 1,
-2.4264, 0.3063252, 0.08943094, 1, 0, 0, 1, 1,
-2.41108, -0.748799, -3.843398, 0, 0, 0, 1, 1,
-2.398177, -0.4174064, -0.4599903, 0, 0, 0, 1, 1,
-2.328866, 0.4169343, -0.8508362, 0, 0, 0, 1, 1,
-2.313981, 1.102911, -0.9237024, 0, 0, 0, 1, 1,
-2.305685, 1.633981, -0.8657232, 0, 0, 0, 1, 1,
-2.303591, -0.3632079, -0.7403343, 0, 0, 0, 1, 1,
-2.285644, 0.6182261, 0.2265151, 0, 0, 0, 1, 1,
-2.27277, -0.8622456, -1.490406, 1, 1, 1, 1, 1,
-2.259932, 1.675317, -1.780198, 1, 1, 1, 1, 1,
-2.257785, 0.822837, 0.2201075, 1, 1, 1, 1, 1,
-2.240939, -0.1096148, -2.358459, 1, 1, 1, 1, 1,
-2.240428, 0.3833797, 0.2891995, 1, 1, 1, 1, 1,
-2.193339, 0.2794766, -2.218079, 1, 1, 1, 1, 1,
-2.172055, 0.939113, 0.07418674, 1, 1, 1, 1, 1,
-2.120947, 1.457815, -0.8595503, 1, 1, 1, 1, 1,
-2.110714, -1.209593, -0.5076683, 1, 1, 1, 1, 1,
-2.090822, -0.451089, -4.622635, 1, 1, 1, 1, 1,
-2.08428, -0.8432584, -1.075476, 1, 1, 1, 1, 1,
-2.06001, -0.8337496, -3.354509, 1, 1, 1, 1, 1,
-2.035976, 0.9804482, -0.7743495, 1, 1, 1, 1, 1,
-2.024217, -0.2009603, -0.8280979, 1, 1, 1, 1, 1,
-2.007683, -1.116817, -0.8072244, 1, 1, 1, 1, 1,
-2.002147, -1.918442, -2.5603, 0, 0, 1, 1, 1,
-1.975218, 0.9854101, 0.353579, 1, 0, 0, 1, 1,
-1.965395, -0.1629013, -1.954084, 1, 0, 0, 1, 1,
-1.964692, 1.265912, -1.015915, 1, 0, 0, 1, 1,
-1.939166, 0.2813779, 0.3258597, 1, 0, 0, 1, 1,
-1.938173, 1.140998, -0.8436946, 1, 0, 0, 1, 1,
-1.916954, -0.2884481, -3.302694, 0, 0, 0, 1, 1,
-1.915455, -0.6021391, -1.611823, 0, 0, 0, 1, 1,
-1.887538, -0.2970614, -1.826037, 0, 0, 0, 1, 1,
-1.883919, -0.7182158, -0.7091766, 0, 0, 0, 1, 1,
-1.861999, 0.4244542, -2.722584, 0, 0, 0, 1, 1,
-1.851337, -1.305545, -2.072519, 0, 0, 0, 1, 1,
-1.841538, 1.673826, -0.2685387, 0, 0, 0, 1, 1,
-1.837991, 1.061428, 0.2827471, 1, 1, 1, 1, 1,
-1.837708, -0.1057043, -1.682178, 1, 1, 1, 1, 1,
-1.831994, 0.3462238, 0.9475778, 1, 1, 1, 1, 1,
-1.819939, 0.6904938, -1.201153, 1, 1, 1, 1, 1,
-1.818603, 0.8974168, -1.406971, 1, 1, 1, 1, 1,
-1.794723, 0.09643242, -1.88864, 1, 1, 1, 1, 1,
-1.791821, 0.1246424, -3.581801, 1, 1, 1, 1, 1,
-1.778514, -3.014145, -3.634579, 1, 1, 1, 1, 1,
-1.759614, 0.1277205, -0.2141514, 1, 1, 1, 1, 1,
-1.743037, 0.2086924, 0.7863067, 1, 1, 1, 1, 1,
-1.740605, 1.246626, -0.9044657, 1, 1, 1, 1, 1,
-1.73373, 0.2846976, -1.588566, 1, 1, 1, 1, 1,
-1.727156, 0.8179237, -1.450711, 1, 1, 1, 1, 1,
-1.726475, 0.4907353, 0.1358583, 1, 1, 1, 1, 1,
-1.710021, 0.6145649, -2.231091, 1, 1, 1, 1, 1,
-1.701931, -1.973642, -2.654357, 0, 0, 1, 1, 1,
-1.69879, -1.119807, -2.227291, 1, 0, 0, 1, 1,
-1.696032, -2.140639, -1.430835, 1, 0, 0, 1, 1,
-1.692706, -0.8678917, -2.563059, 1, 0, 0, 1, 1,
-1.681347, 1.134822, 0.4217388, 1, 0, 0, 1, 1,
-1.669322, 0.02802862, -3.690102, 1, 0, 0, 1, 1,
-1.659597, -0.7989134, -0.7345132, 0, 0, 0, 1, 1,
-1.652214, 1.47148, -0.9754252, 0, 0, 0, 1, 1,
-1.63793, -2.329417, -3.097569, 0, 0, 0, 1, 1,
-1.606722, -2.084045, -3.215577, 0, 0, 0, 1, 1,
-1.602827, -0.4892363, -2.748028, 0, 0, 0, 1, 1,
-1.594766, 0.9365284, -0.8439202, 0, 0, 0, 1, 1,
-1.58448, -0.4961452, -0.2932898, 0, 0, 0, 1, 1,
-1.576285, -0.9374323, -1.961165, 1, 1, 1, 1, 1,
-1.572248, -0.224365, -3.035395, 1, 1, 1, 1, 1,
-1.567605, 1.783008, 1.169594, 1, 1, 1, 1, 1,
-1.565713, 0.6861792, -0.3338783, 1, 1, 1, 1, 1,
-1.553113, -0.2319793, -1.576351, 1, 1, 1, 1, 1,
-1.552547, -1.245023, -2.69428, 1, 1, 1, 1, 1,
-1.548225, -0.4693793, -1.117167, 1, 1, 1, 1, 1,
-1.530265, 1.469254, -1.607345, 1, 1, 1, 1, 1,
-1.528718, -0.05867665, -2.669238, 1, 1, 1, 1, 1,
-1.521426, 1.427606, -2.315526, 1, 1, 1, 1, 1,
-1.521049, 1.083797, -0.4496098, 1, 1, 1, 1, 1,
-1.518635, 1.634668, -0.7543932, 1, 1, 1, 1, 1,
-1.51826, -0.4535598, -3.112898, 1, 1, 1, 1, 1,
-1.517276, -0.08737983, -1.861044, 1, 1, 1, 1, 1,
-1.513818, -0.2953719, -2.091886, 1, 1, 1, 1, 1,
-1.509484, -0.0518181, -2.198807, 0, 0, 1, 1, 1,
-1.502347, 0.9830689, -0.840691, 1, 0, 0, 1, 1,
-1.490376, -0.4080246, -1.21709, 1, 0, 0, 1, 1,
-1.485694, -0.2121661, -1.111596, 1, 0, 0, 1, 1,
-1.47362, -1.342506, -0.8722457, 1, 0, 0, 1, 1,
-1.459764, 0.4157954, -2.372459, 1, 0, 0, 1, 1,
-1.459611, 0.2015508, -1.229589, 0, 0, 0, 1, 1,
-1.457674, 2.041868, -0.2211539, 0, 0, 0, 1, 1,
-1.440058, -0.2374257, -0.6496387, 0, 0, 0, 1, 1,
-1.43733, 0.7184735, -0.3108061, 0, 0, 0, 1, 1,
-1.429667, -0.08449186, -3.50572, 0, 0, 0, 1, 1,
-1.397658, 1.225976, -0.4586879, 0, 0, 0, 1, 1,
-1.39322, 0.4691008, -0.6134777, 0, 0, 0, 1, 1,
-1.391069, -0.06558422, -2.23428, 1, 1, 1, 1, 1,
-1.374176, 0.9018299, -0.5512836, 1, 1, 1, 1, 1,
-1.356065, -0.5806581, -0.9229795, 1, 1, 1, 1, 1,
-1.355385, 0.1357621, -0.539976, 1, 1, 1, 1, 1,
-1.349935, 0.5753143, -3.253246, 1, 1, 1, 1, 1,
-1.338785, -0.616295, -1.03861, 1, 1, 1, 1, 1,
-1.333957, -1.175957, -1.484541, 1, 1, 1, 1, 1,
-1.320357, 0.989831, -2.085982, 1, 1, 1, 1, 1,
-1.319811, 0.6188987, -1.121645, 1, 1, 1, 1, 1,
-1.313731, 1.810082, -1.559798, 1, 1, 1, 1, 1,
-1.313152, -0.794154, -1.788833, 1, 1, 1, 1, 1,
-1.291556, 1.187347, -0.3416403, 1, 1, 1, 1, 1,
-1.291278, 0.4075525, -2.972742, 1, 1, 1, 1, 1,
-1.291232, -0.509681, -1.995143, 1, 1, 1, 1, 1,
-1.290323, 0.05312032, -2.858406, 1, 1, 1, 1, 1,
-1.285796, -0.1667164, -0.7924097, 0, 0, 1, 1, 1,
-1.285408, 0.3439909, -1.22005, 1, 0, 0, 1, 1,
-1.284508, 0.7256729, -0.4019326, 1, 0, 0, 1, 1,
-1.280272, 0.6835742, -2.373972, 1, 0, 0, 1, 1,
-1.266167, 0.4734364, -1.020039, 1, 0, 0, 1, 1,
-1.263385, 0.1394736, -2.096599, 1, 0, 0, 1, 1,
-1.262256, -0.8152267, -2.447555, 0, 0, 0, 1, 1,
-1.239594, -1.14698, -4.654871, 0, 0, 0, 1, 1,
-1.239099, -0.5183266, -0.7419257, 0, 0, 0, 1, 1,
-1.237295, 0.8965774, -0.1423283, 0, 0, 0, 1, 1,
-1.229732, -1.180429, -2.418833, 0, 0, 0, 1, 1,
-1.216982, -0.5738676, -2.485797, 0, 0, 0, 1, 1,
-1.209109, 0.05136145, -0.06482793, 0, 0, 0, 1, 1,
-1.200406, 1.317115, -3.055458, 1, 1, 1, 1, 1,
-1.19965, -0.8812146, -2.577282, 1, 1, 1, 1, 1,
-1.195125, 0.2212664, 0.4145806, 1, 1, 1, 1, 1,
-1.191182, 1.256417, -1.620967, 1, 1, 1, 1, 1,
-1.189898, -1.514021, -3.600706, 1, 1, 1, 1, 1,
-1.185962, 0.352719, -2.777239, 1, 1, 1, 1, 1,
-1.183114, -0.02295356, -2.77168, 1, 1, 1, 1, 1,
-1.180989, 0.3274704, -1.583473, 1, 1, 1, 1, 1,
-1.171237, 0.4176763, -0.9962208, 1, 1, 1, 1, 1,
-1.16105, -1.450253, -2.392627, 1, 1, 1, 1, 1,
-1.158004, 1.389179, -0.6791461, 1, 1, 1, 1, 1,
-1.131041, 1.239233, -2.363409, 1, 1, 1, 1, 1,
-1.130302, -0.9880128, -2.946065, 1, 1, 1, 1, 1,
-1.123308, 0.328893, -2.960746, 1, 1, 1, 1, 1,
-1.11766, 0.2194534, -1.202488, 1, 1, 1, 1, 1,
-1.114625, -0.6979066, -2.083089, 0, 0, 1, 1, 1,
-1.097544, 0.3126376, -0.6797575, 1, 0, 0, 1, 1,
-1.095893, -0.388121, -1.625141, 1, 0, 0, 1, 1,
-1.093941, 0.08185977, -0.5356196, 1, 0, 0, 1, 1,
-1.093738, 0.4002048, -0.339409, 1, 0, 0, 1, 1,
-1.091006, 1.77963, -0.3347249, 1, 0, 0, 1, 1,
-1.087861, -1.109359, -2.188585, 0, 0, 0, 1, 1,
-1.082605, -0.5503696, -2.930413, 0, 0, 0, 1, 1,
-1.076203, 0.7643189, -1.447591, 0, 0, 0, 1, 1,
-1.066055, 0.1940646, -1.405775, 0, 0, 0, 1, 1,
-1.065475, 1.005206, -0.3703115, 0, 0, 0, 1, 1,
-1.063092, -0.9445159, -2.384594, 0, 0, 0, 1, 1,
-1.060977, -1.879069, -5.3096, 0, 0, 0, 1, 1,
-1.052582, 0.3088574, -2.318871, 1, 1, 1, 1, 1,
-1.051372, 0.509968, -0.170389, 1, 1, 1, 1, 1,
-1.047976, 1.043295, 0.04264946, 1, 1, 1, 1, 1,
-1.046739, 0.2706534, -1.139362, 1, 1, 1, 1, 1,
-1.034191, 0.6366897, -0.9831237, 1, 1, 1, 1, 1,
-1.033462, 1.104901, -0.8277353, 1, 1, 1, 1, 1,
-1.031923, 2.017774, -0.3307692, 1, 1, 1, 1, 1,
-1.031206, -0.642469, -2.289752, 1, 1, 1, 1, 1,
-1.026262, 0.4089361, -2.026384, 1, 1, 1, 1, 1,
-1.023069, 0.8217142, -1.119194, 1, 1, 1, 1, 1,
-1.021118, 1.708281, -0.8692592, 1, 1, 1, 1, 1,
-1.020399, 0.8799944, -3.535817, 1, 1, 1, 1, 1,
-1.015796, 0.3770784, -0.3530879, 1, 1, 1, 1, 1,
-1.015237, -0.5307036, -2.593351, 1, 1, 1, 1, 1,
-1.012798, 0.1665976, -0.710224, 1, 1, 1, 1, 1,
-1.011747, -1.161233, -3.498631, 0, 0, 1, 1, 1,
-1.005201, 0.1534032, -2.144791, 1, 0, 0, 1, 1,
-1.001409, 0.9490328, 1.885978, 1, 0, 0, 1, 1,
-1.00026, -0.3896082, -0.3179282, 1, 0, 0, 1, 1,
-0.9994096, 0.2075899, -0.932804, 1, 0, 0, 1, 1,
-0.9968744, -1.237794, -2.732759, 1, 0, 0, 1, 1,
-0.9965802, -0.480989, -3.618792, 0, 0, 0, 1, 1,
-0.9949986, -0.07343465, -0.4775912, 0, 0, 0, 1, 1,
-0.9942204, 0.8617634, -0.9488579, 0, 0, 0, 1, 1,
-0.9868833, -0.8815457, -2.518553, 0, 0, 0, 1, 1,
-0.9801239, 0.7640506, -0.5243993, 0, 0, 0, 1, 1,
-0.9654592, -1.464792, -1.09308, 0, 0, 0, 1, 1,
-0.959766, -0.6553769, -1.894793, 0, 0, 0, 1, 1,
-0.9590495, 0.1098118, 0.8534737, 1, 1, 1, 1, 1,
-0.958341, 0.1605904, -1.325285, 1, 1, 1, 1, 1,
-0.9532937, 2.529554, 0.6496413, 1, 1, 1, 1, 1,
-0.9469467, -0.09993883, -2.459124, 1, 1, 1, 1, 1,
-0.9457503, 0.4326807, -0.2512429, 1, 1, 1, 1, 1,
-0.9405318, -0.1864814, -1.959987, 1, 1, 1, 1, 1,
-0.9372265, 1.06575, -0.4071952, 1, 1, 1, 1, 1,
-0.9284489, 0.9259852, 0.2355091, 1, 1, 1, 1, 1,
-0.9263924, -0.5375064, -3.294279, 1, 1, 1, 1, 1,
-0.9248798, -0.4186559, -1.697802, 1, 1, 1, 1, 1,
-0.9236407, 0.2781646, -1.699267, 1, 1, 1, 1, 1,
-0.9217932, -1.096662, -3.616909, 1, 1, 1, 1, 1,
-0.9205387, -0.8100095, -2.920644, 1, 1, 1, 1, 1,
-0.9197837, 0.3256107, -1.762868, 1, 1, 1, 1, 1,
-0.9197373, -0.5026401, -3.144817, 1, 1, 1, 1, 1,
-0.9152057, -0.2716713, -1.446684, 0, 0, 1, 1, 1,
-0.9127755, -0.1835704, 0.1830663, 1, 0, 0, 1, 1,
-0.9114505, 0.8543094, -0.1856079, 1, 0, 0, 1, 1,
-0.9064182, -0.3179652, -1.462396, 1, 0, 0, 1, 1,
-0.9045444, 0.1520613, -2.309005, 1, 0, 0, 1, 1,
-0.8996905, -0.5437095, -1.255065, 1, 0, 0, 1, 1,
-0.8968065, 0.6566105, -0.9938179, 0, 0, 0, 1, 1,
-0.8895168, 0.728395, -0.8129535, 0, 0, 0, 1, 1,
-0.8737807, -1.957838, -3.039643, 0, 0, 0, 1, 1,
-0.8693416, 0.6319648, -1.493891, 0, 0, 0, 1, 1,
-0.8593804, -1.517311, -3.903867, 0, 0, 0, 1, 1,
-0.8584352, 0.8443409, -0.2516288, 0, 0, 0, 1, 1,
-0.8568791, 0.9821183, -0.8589707, 0, 0, 0, 1, 1,
-0.8546607, 0.3491171, 0.3263945, 1, 1, 1, 1, 1,
-0.8535357, -0.7421007, -1.442661, 1, 1, 1, 1, 1,
-0.8514283, 0.4896308, -2.56914, 1, 1, 1, 1, 1,
-0.8424284, -0.1707441, -1.99875, 1, 1, 1, 1, 1,
-0.8383266, 2.298581, 0.07943967, 1, 1, 1, 1, 1,
-0.8341305, 0.112999, -1.091777, 1, 1, 1, 1, 1,
-0.8288772, 0.6693712, -0.9975234, 1, 1, 1, 1, 1,
-0.8268821, 0.294412, -2.367107, 1, 1, 1, 1, 1,
-0.8268777, 0.5124882, 0.5746157, 1, 1, 1, 1, 1,
-0.826796, -0.9178681, -3.064098, 1, 1, 1, 1, 1,
-0.8207644, -1.262208, -2.777876, 1, 1, 1, 1, 1,
-0.820655, -1.762606, -2.691714, 1, 1, 1, 1, 1,
-0.8193238, 1.515272, -0.6589516, 1, 1, 1, 1, 1,
-0.8089001, 0.1276003, -2.196529, 1, 1, 1, 1, 1,
-0.7989218, 0.3095695, -1.802433, 1, 1, 1, 1, 1,
-0.795496, -0.04474744, -2.03182, 0, 0, 1, 1, 1,
-0.7946993, 0.4945984, -2.725723, 1, 0, 0, 1, 1,
-0.7942615, -0.519749, -3.527902, 1, 0, 0, 1, 1,
-0.7930817, 1.549026, -1.390423, 1, 0, 0, 1, 1,
-0.7886526, -1.123294, -2.337571, 1, 0, 0, 1, 1,
-0.783964, 0.858086, -2.584953, 1, 0, 0, 1, 1,
-0.7817743, 0.2223881, 0.5787162, 0, 0, 0, 1, 1,
-0.7777058, 0.7961016, -1.195853, 0, 0, 0, 1, 1,
-0.7762366, -2.029868, -2.480899, 0, 0, 0, 1, 1,
-0.7737526, 1.689176, -0.1102051, 0, 0, 0, 1, 1,
-0.7616925, 1.257899, -0.226275, 0, 0, 0, 1, 1,
-0.7613912, -0.2326773, -0.151037, 0, 0, 0, 1, 1,
-0.7559867, -1.180667, -2.779684, 0, 0, 0, 1, 1,
-0.7559291, 0.8019831, 1.290721, 1, 1, 1, 1, 1,
-0.7545815, 1.577383, -1.811192, 1, 1, 1, 1, 1,
-0.7541359, -1.028996, -4.811263, 1, 1, 1, 1, 1,
-0.7468642, 0.7707568, -1.53884, 1, 1, 1, 1, 1,
-0.7464605, -1.316119, -4.074125, 1, 1, 1, 1, 1,
-0.746084, 0.7551799, -1.100005, 1, 1, 1, 1, 1,
-0.7429589, -0.8464071, -2.223415, 1, 1, 1, 1, 1,
-0.7412536, -1.932536, -3.625766, 1, 1, 1, 1, 1,
-0.7393407, 0.6421059, -0.8194045, 1, 1, 1, 1, 1,
-0.7385732, -1.47485, -3.061786, 1, 1, 1, 1, 1,
-0.7379684, 1.166961, -0.9382944, 1, 1, 1, 1, 1,
-0.7353461, 0.07186503, -0.03197045, 1, 1, 1, 1, 1,
-0.7346537, -0.7743264, -3.346638, 1, 1, 1, 1, 1,
-0.7301437, -0.1699525, -1.765697, 1, 1, 1, 1, 1,
-0.7275654, -0.09577844, -0.7884132, 1, 1, 1, 1, 1,
-0.7068705, 0.4036649, -0.9368353, 0, 0, 1, 1, 1,
-0.7062474, 2.108223, 1.327757, 1, 0, 0, 1, 1,
-0.7059167, -0.7257939, -2.135899, 1, 0, 0, 1, 1,
-0.7039356, -0.019498, -1.508541, 1, 0, 0, 1, 1,
-0.702825, 0.8501703, -0.5083165, 1, 0, 0, 1, 1,
-0.7015506, -0.08043819, -1.457331, 1, 0, 0, 1, 1,
-0.6976327, 0.7841941, 0.2653859, 0, 0, 0, 1, 1,
-0.6942613, 0.05190258, -2.158298, 0, 0, 0, 1, 1,
-0.6932975, -0.7804932, -1.785225, 0, 0, 0, 1, 1,
-0.6846749, 0.7066375, -0.3694967, 0, 0, 0, 1, 1,
-0.6744586, 0.1386492, -2.54717, 0, 0, 0, 1, 1,
-0.6735014, -0.1916469, 0.8073718, 0, 0, 0, 1, 1,
-0.6734619, 0.03422638, -1.188113, 0, 0, 0, 1, 1,
-0.672972, 0.6990364, -1.876543, 1, 1, 1, 1, 1,
-0.6726412, 1.692052, -1.952759, 1, 1, 1, 1, 1,
-0.6690385, -0.1387089, -2.043668, 1, 1, 1, 1, 1,
-0.6689873, 0.1831783, 0.1926219, 1, 1, 1, 1, 1,
-0.6664369, -0.2110253, -1.532351, 1, 1, 1, 1, 1,
-0.6642483, -0.0052984, -1.043245, 1, 1, 1, 1, 1,
-0.6641401, -1.193487, -2.076457, 1, 1, 1, 1, 1,
-0.663357, 0.4669299, 0.3232437, 1, 1, 1, 1, 1,
-0.6608556, -0.127302, -1.224199, 1, 1, 1, 1, 1,
-0.6534631, -0.4720853, -2.535913, 1, 1, 1, 1, 1,
-0.6531824, 0.02283021, -0.6633384, 1, 1, 1, 1, 1,
-0.6526236, 0.3586327, -0.3265761, 1, 1, 1, 1, 1,
-0.6492245, -0.5830762, -3.942001, 1, 1, 1, 1, 1,
-0.6470107, -0.4250678, -4.320102, 1, 1, 1, 1, 1,
-0.6449675, -0.0807625, -1.791776, 1, 1, 1, 1, 1,
-0.644237, 0.977739, -0.1943596, 0, 0, 1, 1, 1,
-0.6375328, 0.1841675, -1.720964, 1, 0, 0, 1, 1,
-0.6360863, -0.009604962, -2.024836, 1, 0, 0, 1, 1,
-0.6358942, 0.3389304, -1.051617, 1, 0, 0, 1, 1,
-0.6350393, -0.5479205, -1.896737, 1, 0, 0, 1, 1,
-0.6253956, -2.153877, -4.024985, 1, 0, 0, 1, 1,
-0.6173955, 2.107998, -0.51157, 0, 0, 0, 1, 1,
-0.6159044, 1.244953, -1.318358, 0, 0, 0, 1, 1,
-0.6141549, -0.7080486, -1.884566, 0, 0, 0, 1, 1,
-0.6125014, -1.225633, -3.799994, 0, 0, 0, 1, 1,
-0.6099165, 1.061368, -1.067096, 0, 0, 0, 1, 1,
-0.6081606, 0.3796118, -1.353108, 0, 0, 0, 1, 1,
-0.6059055, 0.2082166, -2.218708, 0, 0, 0, 1, 1,
-0.601135, -1.218341, -1.900547, 1, 1, 1, 1, 1,
-0.5990458, 0.04303756, -1.435621, 1, 1, 1, 1, 1,
-0.5982665, -1.454069, -0.8061457, 1, 1, 1, 1, 1,
-0.5974277, 1.211187, 0.2530354, 1, 1, 1, 1, 1,
-0.5973084, 0.923637, -0.5127261, 1, 1, 1, 1, 1,
-0.5964491, 1.704441, 0.6249486, 1, 1, 1, 1, 1,
-0.5959575, -0.9723155, -1.499299, 1, 1, 1, 1, 1,
-0.5955209, -0.8376405, -1.243215, 1, 1, 1, 1, 1,
-0.5940452, 0.004442404, -2.150173, 1, 1, 1, 1, 1,
-0.5925587, 0.1808569, -1.865798, 1, 1, 1, 1, 1,
-0.5889679, 0.8828306, 0.5931801, 1, 1, 1, 1, 1,
-0.5857038, -0.7017825, -3.033391, 1, 1, 1, 1, 1,
-0.5789049, -1.463254, -2.932163, 1, 1, 1, 1, 1,
-0.5745684, -0.06724072, -2.362571, 1, 1, 1, 1, 1,
-0.5711301, 1.21467, 0.6112359, 1, 1, 1, 1, 1,
-0.5685963, -0.4638901, -0.5891916, 0, 0, 1, 1, 1,
-0.5669323, -0.7306666, -2.114921, 1, 0, 0, 1, 1,
-0.5615332, -1.235784, -1.822425, 1, 0, 0, 1, 1,
-0.5572573, -0.2017096, -2.310941, 1, 0, 0, 1, 1,
-0.5509074, -1.452337, -1.944878, 1, 0, 0, 1, 1,
-0.5401797, -1.000886, -4.187221, 1, 0, 0, 1, 1,
-0.5386843, 0.3696338, 0.08334581, 0, 0, 0, 1, 1,
-0.5379112, 0.07751661, -0.8667954, 0, 0, 0, 1, 1,
-0.5252434, 1.008413, -1.358368, 0, 0, 0, 1, 1,
-0.5229752, -0.7495424, -2.224217, 0, 0, 0, 1, 1,
-0.5219151, -1.047983, -4.139459, 0, 0, 0, 1, 1,
-0.5142891, 0.1623073, -0.8957481, 0, 0, 0, 1, 1,
-0.5141019, -0.9479343, -2.54306, 0, 0, 0, 1, 1,
-0.5039594, 0.0379169, -1.772129, 1, 1, 1, 1, 1,
-0.5032354, -0.2589717, -1.209146, 1, 1, 1, 1, 1,
-0.5018557, 2.413946, -0.8825451, 1, 1, 1, 1, 1,
-0.4997755, -0.2607814, -3.869178, 1, 1, 1, 1, 1,
-0.4947309, 1.81401, -0.6222471, 1, 1, 1, 1, 1,
-0.492264, 1.010991, -0.1676877, 1, 1, 1, 1, 1,
-0.4916849, -0.3796346, -1.938454, 1, 1, 1, 1, 1,
-0.4907176, 1.062395, -0.3020482, 1, 1, 1, 1, 1,
-0.4851825, 0.7742195, -0.6286219, 1, 1, 1, 1, 1,
-0.4767332, 0.5453117, 0.3719097, 1, 1, 1, 1, 1,
-0.4756629, -0.4481635, -3.684855, 1, 1, 1, 1, 1,
-0.4745745, -0.3296826, -3.638551, 1, 1, 1, 1, 1,
-0.4717259, -0.8760258, -2.790682, 1, 1, 1, 1, 1,
-0.4684548, 0.7981687, -0.2393295, 1, 1, 1, 1, 1,
-0.4683456, -0.1295846, -2.094111, 1, 1, 1, 1, 1,
-0.4662251, 0.09791204, -1.069886, 0, 0, 1, 1, 1,
-0.4657034, 0.9608358, 1.186374, 1, 0, 0, 1, 1,
-0.4430459, 1.093301, -0.2073561, 1, 0, 0, 1, 1,
-0.4406826, 0.6342826, 0.6276486, 1, 0, 0, 1, 1,
-0.436854, -1.329744, -2.436058, 1, 0, 0, 1, 1,
-0.4350039, -0.2601409, -2.582732, 1, 0, 0, 1, 1,
-0.4331729, -0.4086614, -1.482212, 0, 0, 0, 1, 1,
-0.4187224, -0.433028, -2.527431, 0, 0, 0, 1, 1,
-0.4182491, -1.272833, -1.709182, 0, 0, 0, 1, 1,
-0.4169765, -1.434301, -2.544612, 0, 0, 0, 1, 1,
-0.416497, 2.597045, 0.8386467, 0, 0, 0, 1, 1,
-0.4127726, -0.9155883, -3.809285, 0, 0, 0, 1, 1,
-0.4126564, 0.05765432, -1.685766, 0, 0, 0, 1, 1,
-0.4105425, -0.9095302, -3.303413, 1, 1, 1, 1, 1,
-0.4102841, -0.5996869, -2.004376, 1, 1, 1, 1, 1,
-0.4059735, 1.706275, -0.9978182, 1, 1, 1, 1, 1,
-0.4015265, 1.002915, -1.215759, 1, 1, 1, 1, 1,
-0.3976746, 1.34453, -0.4657241, 1, 1, 1, 1, 1,
-0.3932467, 1.74774, -0.04007891, 1, 1, 1, 1, 1,
-0.3927199, -0.7364755, -3.0248, 1, 1, 1, 1, 1,
-0.3919134, 0.7049333, 0.4549997, 1, 1, 1, 1, 1,
-0.3885401, -0.9369351, -2.811742, 1, 1, 1, 1, 1,
-0.3866704, 0.1304135, -0.3553957, 1, 1, 1, 1, 1,
-0.38389, 1.698779, 0.7158334, 1, 1, 1, 1, 1,
-0.3790403, -0.1099004, -1.132255, 1, 1, 1, 1, 1,
-0.3763441, 1.326496, -0.9133803, 1, 1, 1, 1, 1,
-0.3713344, -0.4416982, -2.969126, 1, 1, 1, 1, 1,
-0.3701614, 1.472748, 0.1533904, 1, 1, 1, 1, 1,
-0.3690287, -0.3904366, -1.267196, 0, 0, 1, 1, 1,
-0.3650046, 0.6074923, -0.4826906, 1, 0, 0, 1, 1,
-0.3618514, 1.646302, -1.762136, 1, 0, 0, 1, 1,
-0.3594981, 0.3250294, -2.151992, 1, 0, 0, 1, 1,
-0.3580549, -0.8382248, -3.562611, 1, 0, 0, 1, 1,
-0.3578609, 1.038736, -1.389304, 1, 0, 0, 1, 1,
-0.3515839, -0.9716424, -1.489402, 0, 0, 0, 1, 1,
-0.3509094, 0.3528563, -1.989698, 0, 0, 0, 1, 1,
-0.3396306, 1.048094, 0.6752512, 0, 0, 0, 1, 1,
-0.334295, 0.4467988, 0.2576867, 0, 0, 0, 1, 1,
-0.3330437, -1.199785, -3.519047, 0, 0, 0, 1, 1,
-0.3329444, 0.6746829, 0.2881203, 0, 0, 0, 1, 1,
-0.3326466, 0.5704974, -0.369022, 0, 0, 0, 1, 1,
-0.3305986, -0.8207536, -2.403221, 1, 1, 1, 1, 1,
-0.3303548, 0.9907954, -1.018695, 1, 1, 1, 1, 1,
-0.327225, 1.162977, -0.8630049, 1, 1, 1, 1, 1,
-0.3257416, 1.22822, -1.55428, 1, 1, 1, 1, 1,
-0.3249874, 1.023962, -0.2774197, 1, 1, 1, 1, 1,
-0.3167163, 0.6659898, -0.8217438, 1, 1, 1, 1, 1,
-0.3103083, 1.7191, 0.8795221, 1, 1, 1, 1, 1,
-0.3087241, -1.219399, -2.219061, 1, 1, 1, 1, 1,
-0.3083391, -2.107775, -1.814885, 1, 1, 1, 1, 1,
-0.3054454, -0.05267617, -3.015483, 1, 1, 1, 1, 1,
-0.3047585, -0.1829689, -1.594166, 1, 1, 1, 1, 1,
-0.3037298, -1.796628, -5.562398, 1, 1, 1, 1, 1,
-0.3021412, 1.454829, 0.7261496, 1, 1, 1, 1, 1,
-0.2973593, 0.01934354, -2.111802, 1, 1, 1, 1, 1,
-0.2953314, -0.6635743, -3.379583, 1, 1, 1, 1, 1,
-0.2908558, 0.8819132, -1.306454, 0, 0, 1, 1, 1,
-0.2904714, -1.00074, -2.993483, 1, 0, 0, 1, 1,
-0.2903185, -1.205434, -3.993779, 1, 0, 0, 1, 1,
-0.2842541, -0.22635, -2.336217, 1, 0, 0, 1, 1,
-0.2814324, -1.268694, -3.161831, 1, 0, 0, 1, 1,
-0.280959, 0.8149548, 0.01735751, 1, 0, 0, 1, 1,
-0.2797303, -0.09879176, -3.962264, 0, 0, 0, 1, 1,
-0.2781823, -0.8065435, -1.466707, 0, 0, 0, 1, 1,
-0.2764808, -0.6903701, -2.679878, 0, 0, 0, 1, 1,
-0.2753578, 0.7063326, -0.6732441, 0, 0, 0, 1, 1,
-0.2742985, -1.688924, -3.267698, 0, 0, 0, 1, 1,
-0.2740506, -1.287571, -1.95069, 0, 0, 0, 1, 1,
-0.2734589, 0.6689507, -2.186351, 0, 0, 0, 1, 1,
-0.2734552, -0.3876014, -3.601857, 1, 1, 1, 1, 1,
-0.2723697, 0.498148, -0.9746484, 1, 1, 1, 1, 1,
-0.2704105, 1.076556, -0.08299572, 1, 1, 1, 1, 1,
-0.2685745, -0.7416316, -3.991259, 1, 1, 1, 1, 1,
-0.2684831, -0.3845187, -2.452888, 1, 1, 1, 1, 1,
-0.2677607, -0.5943652, -1.505279, 1, 1, 1, 1, 1,
-0.2663413, 0.1986846, -0.782097, 1, 1, 1, 1, 1,
-0.2539573, -0.1178682, -0.386914, 1, 1, 1, 1, 1,
-0.2530122, -0.7146793, -0.8463324, 1, 1, 1, 1, 1,
-0.2499807, -0.113651, -3.205863, 1, 1, 1, 1, 1,
-0.2457305, -0.7970126, -2.777156, 1, 1, 1, 1, 1,
-0.2419243, -1.420626, -2.762704, 1, 1, 1, 1, 1,
-0.2373418, 0.4436245, -1.624345, 1, 1, 1, 1, 1,
-0.2363266, 0.2125021, -0.4424216, 1, 1, 1, 1, 1,
-0.234242, -1.279841, -2.512619, 1, 1, 1, 1, 1,
-0.2325574, -0.002391621, 0.549494, 0, 0, 1, 1, 1,
-0.2258844, 1.117149, 0.5177686, 1, 0, 0, 1, 1,
-0.2246819, -1.692055, -2.770838, 1, 0, 0, 1, 1,
-0.2219404, 0.5651121, 1.061534, 1, 0, 0, 1, 1,
-0.2185545, 0.3826151, -0.4170958, 1, 0, 0, 1, 1,
-0.2158652, 0.5737378, 0.1129775, 1, 0, 0, 1, 1,
-0.2138832, 1.521623, 0.4512141, 0, 0, 0, 1, 1,
-0.2130046, -1.020484, -2.359029, 0, 0, 0, 1, 1,
-0.2098246, -0.561506, -2.140734, 0, 0, 0, 1, 1,
-0.2062636, -0.2738975, -2.211424, 0, 0, 0, 1, 1,
-0.2031444, 0.1010197, -0.1940266, 0, 0, 0, 1, 1,
-0.1997549, -0.6287147, -2.279011, 0, 0, 0, 1, 1,
-0.1964554, 0.9084987, 0.5222958, 0, 0, 0, 1, 1,
-0.1924231, 1.474281, 0.5760044, 1, 1, 1, 1, 1,
-0.1923522, 0.8099382, -1.928387, 1, 1, 1, 1, 1,
-0.1868874, -0.590557, -3.083073, 1, 1, 1, 1, 1,
-0.1865577, 1.033509, -0.5885698, 1, 1, 1, 1, 1,
-0.183801, 0.813218, -1.508975, 1, 1, 1, 1, 1,
-0.1831614, 0.9422553, 0.2952451, 1, 1, 1, 1, 1,
-0.1737102, -0.7923196, -2.226108, 1, 1, 1, 1, 1,
-0.1691606, -0.1194259, -2.44905, 1, 1, 1, 1, 1,
-0.1691091, -0.9458646, -3.392057, 1, 1, 1, 1, 1,
-0.1644383, -1.034928, -3.595101, 1, 1, 1, 1, 1,
-0.1575611, 1.127227, -0.9625924, 1, 1, 1, 1, 1,
-0.1562965, 1.26585, 0.02904792, 1, 1, 1, 1, 1,
-0.1556988, 0.0274182, 0.360072, 1, 1, 1, 1, 1,
-0.153432, -0.3163868, -5.343453, 1, 1, 1, 1, 1,
-0.1479662, -1.393858, -2.707921, 1, 1, 1, 1, 1,
-0.1474686, 2.943107, -0.06585621, 0, 0, 1, 1, 1,
-0.1407551, -0.7902768, -3.247532, 1, 0, 0, 1, 1,
-0.1399378, 0.1819861, -1.684013, 1, 0, 0, 1, 1,
-0.1398974, 0.1823199, -0.2357894, 1, 0, 0, 1, 1,
-0.1369534, 0.2146908, -1.683182, 1, 0, 0, 1, 1,
-0.13626, 1.261898, -0.7294616, 1, 0, 0, 1, 1,
-0.130525, -1.064186, -3.224285, 0, 0, 0, 1, 1,
-0.1272731, -0.4069358, -2.37035, 0, 0, 0, 1, 1,
-0.1211779, -1.843367, -3.240209, 0, 0, 0, 1, 1,
-0.1200779, 0.2782002, -2.112294, 0, 0, 0, 1, 1,
-0.1197589, -0.8988167, -3.768725, 0, 0, 0, 1, 1,
-0.1172993, 0.1278224, -0.3404099, 0, 0, 0, 1, 1,
-0.1163079, -0.6329773, -1.393973, 0, 0, 0, 1, 1,
-0.1129654, 0.1694287, 0.3500249, 1, 1, 1, 1, 1,
-0.1103253, 0.6299631, 1.454303, 1, 1, 1, 1, 1,
-0.1100926, 0.511124, -0.4909646, 1, 1, 1, 1, 1,
-0.105662, -0.9840071, -3.416273, 1, 1, 1, 1, 1,
-0.1047364, 0.4476638, -0.7267953, 1, 1, 1, 1, 1,
-0.1031591, -0.8280883, -4.281757, 1, 1, 1, 1, 1,
-0.1010412, 0.5973954, -1.031055, 1, 1, 1, 1, 1,
-0.09563369, -0.6031752, -1.881902, 1, 1, 1, 1, 1,
-0.08918467, -1.012737, -1.961935, 1, 1, 1, 1, 1,
-0.089007, -2.695681, -3.372816, 1, 1, 1, 1, 1,
-0.0881218, 1.088862, -0.1970351, 1, 1, 1, 1, 1,
-0.08655441, 0.5888553, -0.2381891, 1, 1, 1, 1, 1,
-0.08026001, -2.289394, -2.903974, 1, 1, 1, 1, 1,
-0.08017103, -0.7359154, -3.987005, 1, 1, 1, 1, 1,
-0.07785098, -0.3008199, -1.779852, 1, 1, 1, 1, 1,
-0.0756043, -0.3763688, -2.709429, 0, 0, 1, 1, 1,
-0.07254264, -1.717678, -1.996961, 1, 0, 0, 1, 1,
-0.07113601, -0.6344663, -3.684629, 1, 0, 0, 1, 1,
-0.06859007, 0.9866287, -0.0929305, 1, 0, 0, 1, 1,
-0.06797259, -1.021612, -2.648981, 1, 0, 0, 1, 1,
-0.06531955, 0.8148011, 0.582588, 1, 0, 0, 1, 1,
-0.06372732, 0.0968192, -0.3242274, 0, 0, 0, 1, 1,
-0.06320739, -1.752246, -2.846598, 0, 0, 0, 1, 1,
-0.06309212, 0.5149199, -1.475261, 0, 0, 0, 1, 1,
-0.06038679, -1.476278, -3.80106, 0, 0, 0, 1, 1,
-0.05217859, 1.587086, -0.2147755, 0, 0, 0, 1, 1,
-0.04976254, 0.3855537, 0.222377, 0, 0, 0, 1, 1,
-0.04793556, -1.326535, -1.967402, 0, 0, 0, 1, 1,
-0.04786136, 0.8743572, 1.584998, 1, 1, 1, 1, 1,
-0.04128581, -0.1951705, -3.453516, 1, 1, 1, 1, 1,
-0.03945678, 0.1140057, -0.3701747, 1, 1, 1, 1, 1,
-0.03743978, 1.220218, 0.7385467, 1, 1, 1, 1, 1,
-0.03720151, -0.477335, -1.991665, 1, 1, 1, 1, 1,
-0.03607823, -0.4768952, -4.207015, 1, 1, 1, 1, 1,
-0.03455028, -0.01297111, -2.001702, 1, 1, 1, 1, 1,
-0.03421977, 0.9150412, -1.001069, 1, 1, 1, 1, 1,
-0.02908961, -0.6419556, -3.862252, 1, 1, 1, 1, 1,
-0.02880978, -0.255849, -3.147408, 1, 1, 1, 1, 1,
-0.02781715, -1.338699, -3.122914, 1, 1, 1, 1, 1,
-0.02757838, -0.5339903, -3.345404, 1, 1, 1, 1, 1,
-0.02452455, 0.2282692, -1.418591, 1, 1, 1, 1, 1,
-0.02322714, -0.4771283, -4.189947, 1, 1, 1, 1, 1,
-0.01992666, 0.8170652, -0.4949317, 1, 1, 1, 1, 1,
-0.002239538, 0.04234312, 1.374172, 0, 0, 1, 1, 1,
0.001600474, -0.5332958, 2.522894, 1, 0, 0, 1, 1,
0.004267724, 1.100655, 0.09107829, 1, 0, 0, 1, 1,
0.00601167, -0.9877148, 2.073224, 1, 0, 0, 1, 1,
0.00754057, 1.641188, 0.6030781, 1, 0, 0, 1, 1,
0.009135249, -0.8167776, 3.067526, 1, 0, 0, 1, 1,
0.01203617, -0.5979853, 3.650937, 0, 0, 0, 1, 1,
0.01380197, 0.3652205, 0.6338965, 0, 0, 0, 1, 1,
0.01624568, -0.7083807, 1.843543, 0, 0, 0, 1, 1,
0.01694754, -0.5847688, 2.632887, 0, 0, 0, 1, 1,
0.01759337, 0.6103467, -2.037371, 0, 0, 0, 1, 1,
0.01955035, -0.7269116, 1.677259, 0, 0, 0, 1, 1,
0.02141501, 0.2079286, 0.509501, 0, 0, 0, 1, 1,
0.02525362, -0.3958023, 4.027281, 1, 1, 1, 1, 1,
0.03277896, -0.2431684, 3.192751, 1, 1, 1, 1, 1,
0.03357909, 0.4855767, -1.854589, 1, 1, 1, 1, 1,
0.0349791, 1.088751, -0.4885732, 1, 1, 1, 1, 1,
0.03707156, -0.992227, 2.401481, 1, 1, 1, 1, 1,
0.03721539, 1.412561, -0.8559774, 1, 1, 1, 1, 1,
0.03987301, 0.8299061, -1.118485, 1, 1, 1, 1, 1,
0.04488426, 0.6270144, -2.426206, 1, 1, 1, 1, 1,
0.04705501, -1.273654, 3.103889, 1, 1, 1, 1, 1,
0.04970508, 0.9481838, -0.8230239, 1, 1, 1, 1, 1,
0.05490387, -0.5883336, 3.183925, 1, 1, 1, 1, 1,
0.05777366, 1.749146, -2.181409, 1, 1, 1, 1, 1,
0.06012981, 0.6007832, 0.9669562, 1, 1, 1, 1, 1,
0.06157421, -0.6451981, 4.004159, 1, 1, 1, 1, 1,
0.06170914, 1.388665, -1.436886, 1, 1, 1, 1, 1,
0.06617015, -0.01742095, 1.92364, 0, 0, 1, 1, 1,
0.06617044, 2.985817, 0.6505854, 1, 0, 0, 1, 1,
0.06706372, -1.805547, 4.842573, 1, 0, 0, 1, 1,
0.06716865, 1.569043, -0.2500921, 1, 0, 0, 1, 1,
0.06864324, -1.594662, 2.001141, 1, 0, 0, 1, 1,
0.06875381, -0.5116464, 1.922993, 1, 0, 0, 1, 1,
0.07338774, -0.8847701, 2.73383, 0, 0, 0, 1, 1,
0.07475698, -1.550441, 3.640079, 0, 0, 0, 1, 1,
0.07558502, -0.6876436, 3.125967, 0, 0, 0, 1, 1,
0.07919587, 0.5458073, -0.324894, 0, 0, 0, 1, 1,
0.07969691, -0.3952886, 2.11111, 0, 0, 0, 1, 1,
0.07979083, 0.4638245, -1.204972, 0, 0, 0, 1, 1,
0.08112957, -0.04610514, 3.319368, 0, 0, 0, 1, 1,
0.08224082, -1.028009, 2.820989, 1, 1, 1, 1, 1,
0.08252434, 0.2891257, -1.854772, 1, 1, 1, 1, 1,
0.082643, -0.05021927, 1.685596, 1, 1, 1, 1, 1,
0.08765201, -1.11162, 4.164592, 1, 1, 1, 1, 1,
0.08863004, -0.7347624, 4.713115, 1, 1, 1, 1, 1,
0.08890627, -0.2812883, 2.461112, 1, 1, 1, 1, 1,
0.09189056, 0.1340733, -0.4634014, 1, 1, 1, 1, 1,
0.09327779, 2.345178, -1.330767, 1, 1, 1, 1, 1,
0.09853046, -0.5979232, 1.143876, 1, 1, 1, 1, 1,
0.09881528, -0.5658899, 2.330917, 1, 1, 1, 1, 1,
0.1000187, -0.8096593, 1.552753, 1, 1, 1, 1, 1,
0.1026253, 0.1307896, -1.25009, 1, 1, 1, 1, 1,
0.1038842, 1.800377, 0.7691088, 1, 1, 1, 1, 1,
0.1064896, 0.6972625, 0.6387655, 1, 1, 1, 1, 1,
0.1075776, -1.259678, 2.962806, 1, 1, 1, 1, 1,
0.1104305, -0.05808427, 2.373632, 0, 0, 1, 1, 1,
0.1116322, -0.3152935, 0.9451126, 1, 0, 0, 1, 1,
0.1118807, -0.3733111, 2.583592, 1, 0, 0, 1, 1,
0.1118867, 0.1034075, 1.885493, 1, 0, 0, 1, 1,
0.113764, -0.5394745, 2.370025, 1, 0, 0, 1, 1,
0.114931, 1.261327, 0.3789131, 1, 0, 0, 1, 1,
0.1167992, -0.03454598, 4.112091, 0, 0, 0, 1, 1,
0.1218385, 1.126609, -0.5372321, 0, 0, 0, 1, 1,
0.1232795, -1.898517, 3.708618, 0, 0, 0, 1, 1,
0.1235962, 0.6969649, -0.01490438, 0, 0, 0, 1, 1,
0.1323552, -0.8550717, 2.637936, 0, 0, 0, 1, 1,
0.1332423, -0.3901585, 2.868011, 0, 0, 0, 1, 1,
0.1336202, -0.06568685, 3.480346, 0, 0, 0, 1, 1,
0.1360213, 1.378665, 0.778551, 1, 1, 1, 1, 1,
0.136754, 0.7905532, 1.093897, 1, 1, 1, 1, 1,
0.1420094, 1.274614, -1.032249, 1, 1, 1, 1, 1,
0.1449463, -0.1687623, 3.823555, 1, 1, 1, 1, 1,
0.1485462, 0.6430709, -0.03497947, 1, 1, 1, 1, 1,
0.1496403, 0.3908507, 2.454153, 1, 1, 1, 1, 1,
0.1539996, -1.553849, 1.60756, 1, 1, 1, 1, 1,
0.1582483, 0.7537507, 0.2253575, 1, 1, 1, 1, 1,
0.1638754, -0.4947593, 3.801107, 1, 1, 1, 1, 1,
0.1671101, 1.43791, 0.1064145, 1, 1, 1, 1, 1,
0.1674967, -0.732472, 4.137136, 1, 1, 1, 1, 1,
0.1689623, -0.1636188, 1.98933, 1, 1, 1, 1, 1,
0.1724, 0.4086209, 0.2298761, 1, 1, 1, 1, 1,
0.1740311, 0.4311875, 1.482048, 1, 1, 1, 1, 1,
0.1753553, 0.2618154, 1.436855, 1, 1, 1, 1, 1,
0.1782667, 1.073939, 1.639041, 0, 0, 1, 1, 1,
0.1794537, 0.5638034, 1.056817, 1, 0, 0, 1, 1,
0.1823546, 1.936421, 0.6816704, 1, 0, 0, 1, 1,
0.1831645, -1.087, 3.701805, 1, 0, 0, 1, 1,
0.1844919, 0.487907, -1.81155, 1, 0, 0, 1, 1,
0.1886185, -0.4422729, 2.108041, 1, 0, 0, 1, 1,
0.19352, 0.8330187, -0.6830028, 0, 0, 0, 1, 1,
0.194057, 0.5593028, 1.061831, 0, 0, 0, 1, 1,
0.1961876, -0.8232822, 3.496164, 0, 0, 0, 1, 1,
0.1963655, -0.3533716, 5.351069, 0, 0, 0, 1, 1,
0.1976451, -1.485713, 3.801385, 0, 0, 0, 1, 1,
0.1999841, -0.6940308, 4.542392, 0, 0, 0, 1, 1,
0.2034061, 1.126212, -1.032286, 0, 0, 0, 1, 1,
0.2036539, -1.928421, 3.774147, 1, 1, 1, 1, 1,
0.2043599, 0.1785379, 1.26685, 1, 1, 1, 1, 1,
0.2068395, 0.4531213, 2.083582, 1, 1, 1, 1, 1,
0.2088225, 0.3667082, -1.30595, 1, 1, 1, 1, 1,
0.212301, -1.489717, 2.227268, 1, 1, 1, 1, 1,
0.2172105, 0.1714527, 0.08149178, 1, 1, 1, 1, 1,
0.2211393, -0.3314153, 1.973426, 1, 1, 1, 1, 1,
0.2258379, -0.2110854, 3.019309, 1, 1, 1, 1, 1,
0.2285011, -2.606318, 3.539315, 1, 1, 1, 1, 1,
0.2310522, 0.2433694, 1.071715, 1, 1, 1, 1, 1,
0.2319395, 1.872457, -0.3158036, 1, 1, 1, 1, 1,
0.2366445, -1.22211, 4.667126, 1, 1, 1, 1, 1,
0.2377072, -0.3458126, 2.699191, 1, 1, 1, 1, 1,
0.2391099, 0.01947976, 2.057657, 1, 1, 1, 1, 1,
0.2421553, -0.7080192, 1.986714, 1, 1, 1, 1, 1,
0.2449982, -0.8827755, 2.795597, 0, 0, 1, 1, 1,
0.2454413, 0.02469409, 1.264915, 1, 0, 0, 1, 1,
0.2466444, -1.257612, 4.23454, 1, 0, 0, 1, 1,
0.2484729, -1.048098, 2.148175, 1, 0, 0, 1, 1,
0.2491179, 0.7387151, 0.02519856, 1, 0, 0, 1, 1,
0.2507897, 0.1433675, 0.4864427, 1, 0, 0, 1, 1,
0.2510168, -1.223228, 2.190043, 0, 0, 0, 1, 1,
0.2537426, -1.457577, 4.159109, 0, 0, 0, 1, 1,
0.2545286, 0.449442, 0.297004, 0, 0, 0, 1, 1,
0.2550696, 1.731653, -0.3713847, 0, 0, 0, 1, 1,
0.2588983, 1.007272, -0.3033921, 0, 0, 0, 1, 1,
0.2595709, -0.2413457, 3.730517, 0, 0, 0, 1, 1,
0.2608007, -0.9510342, 3.403018, 0, 0, 0, 1, 1,
0.2616609, 0.0852095, 0.02125601, 1, 1, 1, 1, 1,
0.2638045, -1.349729, 4.884768, 1, 1, 1, 1, 1,
0.2651719, -0.787936, 3.312179, 1, 1, 1, 1, 1,
0.2680428, -0.5881982, 3.231972, 1, 1, 1, 1, 1,
0.2683357, -0.5222596, 3.419673, 1, 1, 1, 1, 1,
0.2697073, -0.4676464, 1.420318, 1, 1, 1, 1, 1,
0.2718923, 0.9080498, -0.9675469, 1, 1, 1, 1, 1,
0.2728794, -0.5782114, 2.23103, 1, 1, 1, 1, 1,
0.2823547, -0.5143957, 2.889546, 1, 1, 1, 1, 1,
0.2841011, 1.217104, -0.1375108, 1, 1, 1, 1, 1,
0.2847789, -0.308049, 2.563914, 1, 1, 1, 1, 1,
0.285374, -0.6031985, 3.292862, 1, 1, 1, 1, 1,
0.2937773, -1.534886, 2.23746, 1, 1, 1, 1, 1,
0.297426, 1.948212, 1.421381, 1, 1, 1, 1, 1,
0.297814, -1.03558, 2.948096, 1, 1, 1, 1, 1,
0.2981794, 0.49042, -0.3002632, 0, 0, 1, 1, 1,
0.3014263, 0.8951283, 1.067065, 1, 0, 0, 1, 1,
0.3045126, -0.4539483, 2.470622, 1, 0, 0, 1, 1,
0.306195, -1.542471, 1.799886, 1, 0, 0, 1, 1,
0.3107649, -1.319615, 2.298941, 1, 0, 0, 1, 1,
0.3113583, -0.6145803, 3.894118, 1, 0, 0, 1, 1,
0.3151556, 2.633553, -0.384049, 0, 0, 0, 1, 1,
0.3167871, -0.5638605, 2.738519, 0, 0, 0, 1, 1,
0.3175669, -0.3738263, 2.90379, 0, 0, 0, 1, 1,
0.3177345, -0.8788117, 2.839155, 0, 0, 0, 1, 1,
0.3207563, -0.06747527, 2.210056, 0, 0, 0, 1, 1,
0.3221036, -1.367371, 2.933864, 0, 0, 0, 1, 1,
0.3232383, 0.4847336, 0.6138381, 0, 0, 0, 1, 1,
0.3247261, -0.1260179, 2.852504, 1, 1, 1, 1, 1,
0.3293661, 0.8470721, -0.2818396, 1, 1, 1, 1, 1,
0.3308784, 0.3119774, 0.1698931, 1, 1, 1, 1, 1,
0.3309844, 2.581922, 0.1918018, 1, 1, 1, 1, 1,
0.331363, -0.03991799, 0.9883221, 1, 1, 1, 1, 1,
0.331724, -0.2148491, 2.349119, 1, 1, 1, 1, 1,
0.3411354, 1.69837, -1.351474, 1, 1, 1, 1, 1,
0.3471884, 1.135321, 0.4888049, 1, 1, 1, 1, 1,
0.349231, -0.3316224, 1.490574, 1, 1, 1, 1, 1,
0.3493384, 0.1095642, 1.188923, 1, 1, 1, 1, 1,
0.3507995, -0.2255108, 3.435126, 1, 1, 1, 1, 1,
0.3512603, 0.1524902, 0.891101, 1, 1, 1, 1, 1,
0.3520227, 0.9972241, -0.2143782, 1, 1, 1, 1, 1,
0.3527214, -1.260729, 3.099227, 1, 1, 1, 1, 1,
0.3527861, 1.625564, -0.9570614, 1, 1, 1, 1, 1,
0.3600483, -2.249975, 1.886691, 0, 0, 1, 1, 1,
0.3605891, 0.3231857, 0.007689901, 1, 0, 0, 1, 1,
0.3619464, 1.106993, 1.198885, 1, 0, 0, 1, 1,
0.3625521, -1.101543, 2.534923, 1, 0, 0, 1, 1,
0.3636213, -0.1745453, 1.999389, 1, 0, 0, 1, 1,
0.3656817, -1.728469, 3.211404, 1, 0, 0, 1, 1,
0.3680651, 0.6365653, -0.4117765, 0, 0, 0, 1, 1,
0.3713534, 1.101675, -1.083769, 0, 0, 0, 1, 1,
0.3766786, -1.720646, 3.016446, 0, 0, 0, 1, 1,
0.3768593, -1.427018, 2.103821, 0, 0, 0, 1, 1,
0.3825302, -1.59067, 2.213466, 0, 0, 0, 1, 1,
0.3830902, -1.19719, 2.224053, 0, 0, 0, 1, 1,
0.3838684, -0.9220835, 3.298386, 0, 0, 0, 1, 1,
0.3849007, 0.4696487, -0.003895256, 1, 1, 1, 1, 1,
0.3865284, 0.7506728, 0.4497138, 1, 1, 1, 1, 1,
0.3868836, 1.462235, 0.1477659, 1, 1, 1, 1, 1,
0.3897472, 0.1093901, 1.025793, 1, 1, 1, 1, 1,
0.3938595, 2.605912, 0.8594713, 1, 1, 1, 1, 1,
0.3953441, 1.509984, 0.9559208, 1, 1, 1, 1, 1,
0.3991917, -0.08525926, 2.673269, 1, 1, 1, 1, 1,
0.4000006, -0.402591, 0.5519186, 1, 1, 1, 1, 1,
0.4087749, -0.7964517, 1.291534, 1, 1, 1, 1, 1,
0.4153172, -0.2253752, 1.623827, 1, 1, 1, 1, 1,
0.4199388, -0.7467495, 3.074548, 1, 1, 1, 1, 1,
0.4215797, 0.4002261, 1.159434, 1, 1, 1, 1, 1,
0.4231422, 2.083362, -0.9609191, 1, 1, 1, 1, 1,
0.4234365, -1.039425, 2.866269, 1, 1, 1, 1, 1,
0.4252259, -0.50933, 1.499157, 1, 1, 1, 1, 1,
0.4261794, -0.2761291, 1.778252, 0, 0, 1, 1, 1,
0.428157, 1.29675, 0.2960894, 1, 0, 0, 1, 1,
0.4311135, -1.266601, 2.847514, 1, 0, 0, 1, 1,
0.4318656, 0.7528846, 1.420342, 1, 0, 0, 1, 1,
0.4347072, -1.109955, 1.388033, 1, 0, 0, 1, 1,
0.4457005, -0.3875126, 1.572297, 1, 0, 0, 1, 1,
0.4509651, -0.1072994, 3.604199, 0, 0, 0, 1, 1,
0.4515156, -0.7165439, 3.072862, 0, 0, 0, 1, 1,
0.4538974, -0.9398295, 4.800225, 0, 0, 0, 1, 1,
0.4623547, 0.7087308, 0.7692344, 0, 0, 0, 1, 1,
0.462581, 2.034072, -0.4698216, 0, 0, 0, 1, 1,
0.4642909, -0.901483, 3.491405, 0, 0, 0, 1, 1,
0.4680277, -0.4104318, 3.539421, 0, 0, 0, 1, 1,
0.4777991, -0.4038073, 2.748116, 1, 1, 1, 1, 1,
0.4797721, 0.6534743, 0.1597166, 1, 1, 1, 1, 1,
0.4839931, -0.5840545, 2.231958, 1, 1, 1, 1, 1,
0.4911087, -0.09800757, 0.5892014, 1, 1, 1, 1, 1,
0.4926236, -0.53461, 2.583887, 1, 1, 1, 1, 1,
0.4966319, 1.424964, -1.109824, 1, 1, 1, 1, 1,
0.4986487, -0.8646311, 1.503648, 1, 1, 1, 1, 1,
0.5003629, 0.5689704, 0.7778742, 1, 1, 1, 1, 1,
0.5017868, -0.02766651, 2.338404, 1, 1, 1, 1, 1,
0.5020183, -1.583215, 2.760397, 1, 1, 1, 1, 1,
0.5020924, -1.491809, 2.928776, 1, 1, 1, 1, 1,
0.502516, 0.6562163, 1.268219, 1, 1, 1, 1, 1,
0.5061946, 1.461064, 1.946831, 1, 1, 1, 1, 1,
0.5082497, -0.5564024, 2.136281, 1, 1, 1, 1, 1,
0.5162317, 0.5236222, 1.184774, 1, 1, 1, 1, 1,
0.5207016, 0.1444117, 1.686415, 0, 0, 1, 1, 1,
0.5233251, -0.3314229, 2.730534, 1, 0, 0, 1, 1,
0.5258725, -1.243235, 1.095997, 1, 0, 0, 1, 1,
0.5263212, -0.1612081, 2.471123, 1, 0, 0, 1, 1,
0.5265429, -1.551986, 3.377023, 1, 0, 0, 1, 1,
0.5314378, 1.242245, 0.5681558, 1, 0, 0, 1, 1,
0.5319866, 0.6352457, -0.5208154, 0, 0, 0, 1, 1,
0.5402157, -0.6183992, 1.473717, 0, 0, 0, 1, 1,
0.5443092, 1.391097, 0.3190372, 0, 0, 0, 1, 1,
0.5472016, -1.293106, 3.101368, 0, 0, 0, 1, 1,
0.5526223, 0.5747706, 0.8149148, 0, 0, 0, 1, 1,
0.5653915, -0.1307521, 0.04258751, 0, 0, 0, 1, 1,
0.5683483, 0.07499331, 2.515054, 0, 0, 0, 1, 1,
0.57398, -1.928889, 3.774998, 1, 1, 1, 1, 1,
0.5747256, 0.7293597, 0.2951783, 1, 1, 1, 1, 1,
0.5765226, 0.7743037, -0.2471843, 1, 1, 1, 1, 1,
0.578344, -0.3213259, 3.125032, 1, 1, 1, 1, 1,
0.5806962, -1.230174, 3.708509, 1, 1, 1, 1, 1,
0.5809484, -0.3200819, 1.787635, 1, 1, 1, 1, 1,
0.5821412, 0.4240629, -0.7312197, 1, 1, 1, 1, 1,
0.5837457, -0.2871709, 3.301224, 1, 1, 1, 1, 1,
0.5926807, -1.092643, 5.165647, 1, 1, 1, 1, 1,
0.5964198, -1.767813, 3.690432, 1, 1, 1, 1, 1,
0.6050775, -1.191204, 1.944873, 1, 1, 1, 1, 1,
0.6055138, -0.05417465, 3.094623, 1, 1, 1, 1, 1,
0.6118322, 0.8795152, -0.1488153, 1, 1, 1, 1, 1,
0.6133523, 1.849424, 0.8436247, 1, 1, 1, 1, 1,
0.6265617, 0.3643571, 1.858031, 1, 1, 1, 1, 1,
0.6297312, -0.5982963, 2.95775, 0, 0, 1, 1, 1,
0.6317158, -0.9491372, 2.484755, 1, 0, 0, 1, 1,
0.6334609, -2.58064, 3.256674, 1, 0, 0, 1, 1,
0.6458193, 0.3467104, -1.201158, 1, 0, 0, 1, 1,
0.6472467, 0.1028859, 0.3211946, 1, 0, 0, 1, 1,
0.6540332, -0.6249414, 2.712919, 1, 0, 0, 1, 1,
0.6561598, -0.536023, 1.43573, 0, 0, 0, 1, 1,
0.6562431, 1.014053, -1.295604, 0, 0, 0, 1, 1,
0.6607678, 0.04445789, 0.6277863, 0, 0, 0, 1, 1,
0.6697512, 1.063724, 2.36297, 0, 0, 0, 1, 1,
0.6699331, 1.571182, 0.3150855, 0, 0, 0, 1, 1,
0.6742979, 1.824413, -0.1071835, 0, 0, 0, 1, 1,
0.6758943, -1.191729, 1.569852, 0, 0, 0, 1, 1,
0.6771272, 1.503064, 1.724361, 1, 1, 1, 1, 1,
0.6793576, -0.9583442, 1.711334, 1, 1, 1, 1, 1,
0.6814918, -1.442288, 2.479482, 1, 1, 1, 1, 1,
0.684655, -0.7061285, 1.142634, 1, 1, 1, 1, 1,
0.6933185, 1.014031, 2.002735, 1, 1, 1, 1, 1,
0.6939415, -0.7800629, 0.4240973, 1, 1, 1, 1, 1,
0.7025843, 0.9752006, 0.4724608, 1, 1, 1, 1, 1,
0.7060009, 0.1016563, 1.769232, 1, 1, 1, 1, 1,
0.7083693, 0.3963134, 2.633868, 1, 1, 1, 1, 1,
0.7185132, 0.776536, 1.989839, 1, 1, 1, 1, 1,
0.7190618, 0.7908069, 1.42418, 1, 1, 1, 1, 1,
0.7266049, -1.679466, 2.034586, 1, 1, 1, 1, 1,
0.7315236, -3.356695, 3.16963, 1, 1, 1, 1, 1,
0.7325109, -0.464693, 0.5592191, 1, 1, 1, 1, 1,
0.7359971, -1.108582, 1.905486, 1, 1, 1, 1, 1,
0.7450587, 0.3912012, 1.847346, 0, 0, 1, 1, 1,
0.7471043, 0.2689331, 2.623492, 1, 0, 0, 1, 1,
0.7495123, -0.5200855, 1.805752, 1, 0, 0, 1, 1,
0.7588532, -0.2992156, 2.037878, 1, 0, 0, 1, 1,
0.7602209, 0.3116299, 1.812115, 1, 0, 0, 1, 1,
0.7620136, 1.02358, 0.908021, 1, 0, 0, 1, 1,
0.7637668, 0.6446893, 1.040326, 0, 0, 0, 1, 1,
0.7650457, -1.393212, 4.304141, 0, 0, 0, 1, 1,
0.7667706, 0.8479868, 0.7707935, 0, 0, 0, 1, 1,
0.7677885, -0.4610505, 1.915327, 0, 0, 0, 1, 1,
0.7758018, 0.8028951, 0.2436999, 0, 0, 0, 1, 1,
0.7766889, 2.050161, 0.8074756, 0, 0, 0, 1, 1,
0.778828, 0.254082, 1.767875, 0, 0, 0, 1, 1,
0.7804681, -0.6149211, 2.193965, 1, 1, 1, 1, 1,
0.7842746, 0.875828, 0.1462287, 1, 1, 1, 1, 1,
0.7895753, -0.48362, 1.679694, 1, 1, 1, 1, 1,
0.7905958, 1.293967, 1.204419, 1, 1, 1, 1, 1,
0.7972569, 0.5345191, 2.592821, 1, 1, 1, 1, 1,
0.8047091, 1.084177, 1.250335, 1, 1, 1, 1, 1,
0.8074394, -0.3109153, 1.361215, 1, 1, 1, 1, 1,
0.8089423, -0.7415074, 3.305983, 1, 1, 1, 1, 1,
0.815777, -1.26264, 2.512241, 1, 1, 1, 1, 1,
0.8195232, 0.5377006, 1.045961, 1, 1, 1, 1, 1,
0.8208524, -0.2513939, 1.089428, 1, 1, 1, 1, 1,
0.8228079, -0.09950492, 2.894577, 1, 1, 1, 1, 1,
0.835723, -0.4291498, 2.324022, 1, 1, 1, 1, 1,
0.837044, 1.337067, -0.7173342, 1, 1, 1, 1, 1,
0.8387806, -0.7962347, 2.344269, 1, 1, 1, 1, 1,
0.8496978, -0.2886766, 1.697909, 0, 0, 1, 1, 1,
0.8514514, 0.2301198, -0.03940526, 1, 0, 0, 1, 1,
0.852627, -1.442414, 4.14535, 1, 0, 0, 1, 1,
0.854499, 1.187554, -0.4697542, 1, 0, 0, 1, 1,
0.8580624, 0.4412955, 0.4233462, 1, 0, 0, 1, 1,
0.8605081, -0.7833559, 2.777116, 1, 0, 0, 1, 1,
0.8721684, 1.328207, 0.03432699, 0, 0, 0, 1, 1,
0.8787364, 0.4410028, 0.3189233, 0, 0, 0, 1, 1,
0.8810614, 0.3351646, 0.9266514, 0, 0, 0, 1, 1,
0.8812492, -0.7697256, 2.937779, 0, 0, 0, 1, 1,
0.8820956, -0.5742507, 1.909375, 0, 0, 0, 1, 1,
0.8827366, 1.65342, 0.4645843, 0, 0, 0, 1, 1,
0.8858376, 0.4519976, 0.1175181, 0, 0, 0, 1, 1,
0.889886, 0.03971682, 0.6506901, 1, 1, 1, 1, 1,
0.8908197, 0.6721349, 1.502496, 1, 1, 1, 1, 1,
0.8930735, -0.2890735, 2.838412, 1, 1, 1, 1, 1,
0.8937005, -0.9991277, 2.712384, 1, 1, 1, 1, 1,
0.8962018, 0.5167903, 0.8982553, 1, 1, 1, 1, 1,
0.8981871, -1.123961, 4.779325, 1, 1, 1, 1, 1,
0.8989024, 0.1436782, 1.810101, 1, 1, 1, 1, 1,
0.8998551, 0.6725889, 0.480171, 1, 1, 1, 1, 1,
0.9054454, 0.3403431, 1.795883, 1, 1, 1, 1, 1,
0.905948, -1.719143, 2.542337, 1, 1, 1, 1, 1,
0.9150771, 0.6353933, 0.2318916, 1, 1, 1, 1, 1,
0.9187173, -0.010738, 1.639, 1, 1, 1, 1, 1,
0.919708, -0.6242476, 1.120571, 1, 1, 1, 1, 1,
0.9234647, 0.7346152, 0.2500578, 1, 1, 1, 1, 1,
0.9531798, -0.5395832, 4.046436, 1, 1, 1, 1, 1,
0.9555662, -0.6689848, 2.420298, 0, 0, 1, 1, 1,
0.9562886, 0.6334448, 0.9804817, 1, 0, 0, 1, 1,
0.96706, 0.4724177, 0.2873412, 1, 0, 0, 1, 1,
0.9803458, 0.9647213, 0.9407268, 1, 0, 0, 1, 1,
0.9858503, -0.7101153, 3.171634, 1, 0, 0, 1, 1,
0.9922615, -1.049066, 1.310038, 1, 0, 0, 1, 1,
1.002619, 0.2378241, -0.5744696, 0, 0, 0, 1, 1,
1.00351, -1.610136, 2.673116, 0, 0, 0, 1, 1,
1.008335, -0.7626328, 3.756984, 0, 0, 0, 1, 1,
1.01132, 0.7589833, 1.609907, 0, 0, 0, 1, 1,
1.01899, -0.8035371, 3.621441, 0, 0, 0, 1, 1,
1.02618, 0.2586575, -0.4769442, 0, 0, 0, 1, 1,
1.038376, -1.765015, 3.134646, 0, 0, 0, 1, 1,
1.039208, 0.5035684, 1.230282, 1, 1, 1, 1, 1,
1.043741, 0.9403471, 0.3023813, 1, 1, 1, 1, 1,
1.04578, 0.6095677, 0.730711, 1, 1, 1, 1, 1,
1.045882, -1.406166, 2.793209, 1, 1, 1, 1, 1,
1.047863, -0.8117554, 1.277001, 1, 1, 1, 1, 1,
1.055169, 0.9404784, 1.679458, 1, 1, 1, 1, 1,
1.060462, -1.19554, 1.723595, 1, 1, 1, 1, 1,
1.060584, 0.5055469, 2.07511, 1, 1, 1, 1, 1,
1.063158, -2.006706, 2.658942, 1, 1, 1, 1, 1,
1.066749, 1.754461, 1.064958, 1, 1, 1, 1, 1,
1.09766, -0.2988779, 2.329803, 1, 1, 1, 1, 1,
1.09813, -0.6903734, 3.557249, 1, 1, 1, 1, 1,
1.111554, -0.3462075, 2.64637, 1, 1, 1, 1, 1,
1.117523, -1.621213, 1.752453, 1, 1, 1, 1, 1,
1.125034, 0.4113102, 1.459218, 1, 1, 1, 1, 1,
1.132776, 0.7744148, 1.650531, 0, 0, 1, 1, 1,
1.133703, -0.8789687, 1.460623, 1, 0, 0, 1, 1,
1.145871, 0.4662483, 2.070969, 1, 0, 0, 1, 1,
1.151456, 0.5185143, 0.4932259, 1, 0, 0, 1, 1,
1.154749, -0.6188214, 0.5053179, 1, 0, 0, 1, 1,
1.160252, -1.007929, 3.213324, 1, 0, 0, 1, 1,
1.161058, -1.0983, 3.070018, 0, 0, 0, 1, 1,
1.161758, 0.7848532, -0.600688, 0, 0, 0, 1, 1,
1.163202, 0.2724369, 1.714245, 0, 0, 0, 1, 1,
1.164781, 1.89538, -1.742205, 0, 0, 0, 1, 1,
1.168556, 0.3678333, 1.918828, 0, 0, 0, 1, 1,
1.178633, -1.913074, 1.870778, 0, 0, 0, 1, 1,
1.190413, 0.4745888, 1.622743, 0, 0, 0, 1, 1,
1.198648, 0.201457, 2.386115, 1, 1, 1, 1, 1,
1.218676, -1.041524, 3.14883, 1, 1, 1, 1, 1,
1.233233, -0.8418416, 1.770513, 1, 1, 1, 1, 1,
1.236422, -0.471779, 1.813732, 1, 1, 1, 1, 1,
1.243803, 1.340974, 0.4983609, 1, 1, 1, 1, 1,
1.253016, 0.612973, 2.100919, 1, 1, 1, 1, 1,
1.265748, 0.02213376, 3.925888, 1, 1, 1, 1, 1,
1.26891, 1.191127, 0.9589995, 1, 1, 1, 1, 1,
1.274242, -0.3311614, 3.50721, 1, 1, 1, 1, 1,
1.278226, -1.570092, 2.474305, 1, 1, 1, 1, 1,
1.283169, 0.157891, 1.212322, 1, 1, 1, 1, 1,
1.284358, -1.566557, 1.94475, 1, 1, 1, 1, 1,
1.288519, -0.1887158, 1.107973, 1, 1, 1, 1, 1,
1.28962, 1.168433, 0.8005714, 1, 1, 1, 1, 1,
1.300211, -0.1672607, 2.701608, 1, 1, 1, 1, 1,
1.306466, -0.5861071, 1.544184, 0, 0, 1, 1, 1,
1.310526, -0.9543728, 1.86758, 1, 0, 0, 1, 1,
1.312174, 1.32535, 0.9671229, 1, 0, 0, 1, 1,
1.314363, 0.3699971, 2.960599, 1, 0, 0, 1, 1,
1.319194, 0.04502508, 2.975489, 1, 0, 0, 1, 1,
1.33324, 1.335999, 0.316301, 1, 0, 0, 1, 1,
1.343275, 0.964168, 1.27662, 0, 0, 0, 1, 1,
1.348467, 1.730961, 1.927788, 0, 0, 0, 1, 1,
1.348961, -3.043219, 0.5140741, 0, 0, 0, 1, 1,
1.349496, -0.9784228, 1.568276, 0, 0, 0, 1, 1,
1.362807, -0.9638402, 3.565536, 0, 0, 0, 1, 1,
1.371778, 0.8819697, 1.142282, 0, 0, 0, 1, 1,
1.376342, -0.255728, 1.125661, 0, 0, 0, 1, 1,
1.377641, 0.2941375, 2.048155, 1, 1, 1, 1, 1,
1.392522, -1.102919, 2.66295, 1, 1, 1, 1, 1,
1.398028, 1.27029, 2.426243, 1, 1, 1, 1, 1,
1.41166, -0.6957022, 3.071981, 1, 1, 1, 1, 1,
1.416531, 2.140993, 0.9741749, 1, 1, 1, 1, 1,
1.438833, -0.9971673, 2.666635, 1, 1, 1, 1, 1,
1.442505, 0.8575112, 0.4044346, 1, 1, 1, 1, 1,
1.44838, -0.2510133, 2.416544, 1, 1, 1, 1, 1,
1.45453, 0.6238741, 2.021894, 1, 1, 1, 1, 1,
1.459223, 0.1900356, -0.09762964, 1, 1, 1, 1, 1,
1.460259, 0.2382628, 1.857165, 1, 1, 1, 1, 1,
1.460436, -0.1633014, 2.350645, 1, 1, 1, 1, 1,
1.478929, 0.4943793, -0.1278121, 1, 1, 1, 1, 1,
1.483469, 1.682702, -0.02054746, 1, 1, 1, 1, 1,
1.488243, -0.818701, 1.804293, 1, 1, 1, 1, 1,
1.490369, -0.5782615, 0.736849, 0, 0, 1, 1, 1,
1.497247, 0.5103601, 1.046019, 1, 0, 0, 1, 1,
1.505314, -1.794477, 3.269649, 1, 0, 0, 1, 1,
1.509962, 0.4398475, 0.8008109, 1, 0, 0, 1, 1,
1.516863, 0.1537641, -0.32442, 1, 0, 0, 1, 1,
1.522185, -0.4720258, 1.852799, 1, 0, 0, 1, 1,
1.522807, 0.8617789, 1.001069, 0, 0, 0, 1, 1,
1.53012, -1.490846, 2.778799, 0, 0, 0, 1, 1,
1.539405, -0.01402748, 2.261812, 0, 0, 0, 1, 1,
1.539828, 1.242224, -0.05301158, 0, 0, 0, 1, 1,
1.541807, 0.6440437, 2.258406, 0, 0, 0, 1, 1,
1.546104, -0.9191839, 1.657854, 0, 0, 0, 1, 1,
1.555801, -1.424878, 3.033914, 0, 0, 0, 1, 1,
1.566616, 0.376231, 2.540319, 1, 1, 1, 1, 1,
1.56802, -0.6641498, 1.132897, 1, 1, 1, 1, 1,
1.579058, 0.3953013, -0.01162174, 1, 1, 1, 1, 1,
1.586513, 1.39982, 1.538847, 1, 1, 1, 1, 1,
1.593746, -0.4640837, 1.242024, 1, 1, 1, 1, 1,
1.610453, -0.8604516, 3.463232, 1, 1, 1, 1, 1,
1.626214, 0.1475179, -0.1651833, 1, 1, 1, 1, 1,
1.631173, 1.079885, 0.2865142, 1, 1, 1, 1, 1,
1.644241, 1.724911, 2.177232, 1, 1, 1, 1, 1,
1.658837, 0.05299961, -0.1984705, 1, 1, 1, 1, 1,
1.666079, -0.5847952, 0.3795814, 1, 1, 1, 1, 1,
1.677058, 0.8877686, 0.3199301, 1, 1, 1, 1, 1,
1.682676, -0.3673722, 1.615011, 1, 1, 1, 1, 1,
1.701579, 0.9702874, 2.606014, 1, 1, 1, 1, 1,
1.70686, -0.2694207, 1.04366, 1, 1, 1, 1, 1,
1.712157, -0.271243, 1.708236, 0, 0, 1, 1, 1,
1.723094, -0.6800554, 1.986832, 1, 0, 0, 1, 1,
1.729021, 1.750786, 0.4719723, 1, 0, 0, 1, 1,
1.737786, 0.3184729, 1.139677, 1, 0, 0, 1, 1,
1.763397, -0.7896638, 0.6111155, 1, 0, 0, 1, 1,
1.767013, -0.1586578, -1.442022, 1, 0, 0, 1, 1,
1.808967, -0.192004, 2.700786, 0, 0, 0, 1, 1,
1.811708, 0.3129793, 1.513423, 0, 0, 0, 1, 1,
1.856684, 0.9035673, -0.2456563, 0, 0, 0, 1, 1,
1.869501, -0.6414091, 0.5913795, 0, 0, 0, 1, 1,
1.887386, 1.127238, 1.548172, 0, 0, 0, 1, 1,
1.912214, -0.8702617, 1.730099, 0, 0, 0, 1, 1,
1.912567, 0.7131967, -0.5141113, 0, 0, 0, 1, 1,
1.933341, 1.037378, 1.441556, 1, 1, 1, 1, 1,
1.961477, -1.217098, 2.5643, 1, 1, 1, 1, 1,
1.975634, -1.343887, 0.7924142, 1, 1, 1, 1, 1,
1.997583, -0.8928188, 1.2159, 1, 1, 1, 1, 1,
2.003688, -0.8838066, 1.27557, 1, 1, 1, 1, 1,
2.009264, -1.085877, 1.908316, 1, 1, 1, 1, 1,
2.016471, 0.1085989, 2.21716, 1, 1, 1, 1, 1,
2.036393, -1.594481, 2.317701, 1, 1, 1, 1, 1,
2.040162, -0.1574793, 1.744493, 1, 1, 1, 1, 1,
2.046879, -2.80487, 1.09864, 1, 1, 1, 1, 1,
2.072537, 1.613401, 1.323843, 1, 1, 1, 1, 1,
2.078221, -0.6689995, 1.451017, 1, 1, 1, 1, 1,
2.082962, -0.2359122, 2.284451, 1, 1, 1, 1, 1,
2.085224, 1.057894, 0.7908137, 1, 1, 1, 1, 1,
2.110312, 0.4248896, 4.157885, 1, 1, 1, 1, 1,
2.121276, 0.4024355, 0.4832694, 0, 0, 1, 1, 1,
2.124051, 0.09623067, 3.011595, 1, 0, 0, 1, 1,
2.14201, 0.5774217, 1.468295, 1, 0, 0, 1, 1,
2.187116, -1.983726, 2.116214, 1, 0, 0, 1, 1,
2.201951, 0.6673518, 2.144265, 1, 0, 0, 1, 1,
2.216816, -1.238244, 0.1322043, 1, 0, 0, 1, 1,
2.282933, -0.4763061, 2.308205, 0, 0, 0, 1, 1,
2.294482, -1.702708, 3.793615, 0, 0, 0, 1, 1,
2.366006, 0.7444229, 1.938135, 0, 0, 0, 1, 1,
2.366795, 0.01000271, 3.526654, 0, 0, 0, 1, 1,
2.40702, 0.6876732, 2.704257, 0, 0, 0, 1, 1,
2.438387, 1.366304, 2.12484, 0, 0, 0, 1, 1,
2.450415, -1.023817, 0.4406958, 0, 0, 0, 1, 1,
2.457053, 0.530081, 2.145241, 1, 1, 1, 1, 1,
2.503377, 0.9523489, -0.4176876, 1, 1, 1, 1, 1,
2.775381, 0.4055868, 2.250506, 1, 1, 1, 1, 1,
2.858031, -0.6520067, 2.787653, 1, 1, 1, 1, 1,
2.879285, 0.6255728, 0.7644764, 1, 1, 1, 1, 1,
3.149244, 1.778156, 1.273737, 1, 1, 1, 1, 1,
3.500741, -0.3637828, 2.823127, 1, 1, 1, 1, 1
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
var radius = 9.625782;
var distance = 33.81015;
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
mvMatrix.translate( -0.3190963, 0.1854386, 0.1056643 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.81015);
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