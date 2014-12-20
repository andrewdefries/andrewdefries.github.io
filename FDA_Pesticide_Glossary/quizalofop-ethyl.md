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
-3.688318, -0.6856042, -2.963331, 1, 0, 0, 1,
-3.373186, -1.523961, -2.400722, 1, 0.007843138, 0, 1,
-3.247679, 0.2150403, -1.191823, 1, 0.01176471, 0, 1,
-2.994004, 0.0709703, -1.607077, 1, 0.01960784, 0, 1,
-2.891568, 1.06745, -1.435646, 1, 0.02352941, 0, 1,
-2.800326, -1.390942, -1.675375, 1, 0.03137255, 0, 1,
-2.736719, 0.5348328, -2.37502, 1, 0.03529412, 0, 1,
-2.60122, -0.2127182, -1.198822, 1, 0.04313726, 0, 1,
-2.578604, 0.6172246, 0.4740263, 1, 0.04705882, 0, 1,
-2.577835, -0.6479707, -4.136301, 1, 0.05490196, 0, 1,
-2.454517, -0.2849765, -1.26017, 1, 0.05882353, 0, 1,
-2.348193, -0.2465684, -1.646853, 1, 0.06666667, 0, 1,
-2.33714, -1.69876, -2.945785, 1, 0.07058824, 0, 1,
-2.322661, -0.6344199, -1.394533, 1, 0.07843138, 0, 1,
-2.279712, 0.07430852, -2.057268, 1, 0.08235294, 0, 1,
-2.26869, -0.05813951, -0.7027394, 1, 0.09019608, 0, 1,
-2.255184, -0.6814229, -2.158311, 1, 0.09411765, 0, 1,
-2.208652, -1.509051, -4.107125, 1, 0.1019608, 0, 1,
-2.189476, -0.3477989, -2.612265, 1, 0.1098039, 0, 1,
-2.188302, -0.2975707, -1.513281, 1, 0.1137255, 0, 1,
-2.171598, -0.1681596, -0.9871668, 1, 0.1215686, 0, 1,
-2.128269, 0.5605972, -2.724935, 1, 0.1254902, 0, 1,
-2.119874, -0.9213973, -0.2286448, 1, 0.1333333, 0, 1,
-2.105429, 0.3174809, -0.9054531, 1, 0.1372549, 0, 1,
-2.070587, 0.3684117, -2.720946, 1, 0.145098, 0, 1,
-2.052089, 1.763573, -1.512243, 1, 0.1490196, 0, 1,
-2.033546, 0.9770837, -0.8333863, 1, 0.1568628, 0, 1,
-2.033401, -0.5996777, -0.9763149, 1, 0.1607843, 0, 1,
-1.988086, -2.304517, -3.007595, 1, 0.1686275, 0, 1,
-1.954044, -1.852316, -2.503875, 1, 0.172549, 0, 1,
-1.898811, 0.9935285, -4.172976, 1, 0.1803922, 0, 1,
-1.876671, -0.7426756, -2.05297, 1, 0.1843137, 0, 1,
-1.873618, 1.776381, -0.1049888, 1, 0.1921569, 0, 1,
-1.871449, 2.912438, -1.847839, 1, 0.1960784, 0, 1,
-1.843671, -0.5271746, -2.231909, 1, 0.2039216, 0, 1,
-1.830905, 0.5403504, -1.926686, 1, 0.2117647, 0, 1,
-1.811446, 0.880805, -0.8117183, 1, 0.2156863, 0, 1,
-1.803233, -1.905212, -0.5604378, 1, 0.2235294, 0, 1,
-1.801713, 1.829389, -1.626855, 1, 0.227451, 0, 1,
-1.796151, -0.7025934, -0.8455662, 1, 0.2352941, 0, 1,
-1.792395, -0.03600364, -3.372139, 1, 0.2392157, 0, 1,
-1.778784, 0.143767, -0.8407318, 1, 0.2470588, 0, 1,
-1.766908, 1.35692, -2.096889, 1, 0.2509804, 0, 1,
-1.763734, -0.1700154, -2.38444, 1, 0.2588235, 0, 1,
-1.755874, -1.706661, -2.277367, 1, 0.2627451, 0, 1,
-1.727785, 0.5237744, -0.6626909, 1, 0.2705882, 0, 1,
-1.71316, 0.2150244, -2.320135, 1, 0.2745098, 0, 1,
-1.709687, 0.5961414, -2.411832, 1, 0.282353, 0, 1,
-1.697274, -2.768011, -2.214972, 1, 0.2862745, 0, 1,
-1.688425, 1.41664, -1.912417, 1, 0.2941177, 0, 1,
-1.678312, -0.08931289, -0.3513213, 1, 0.3019608, 0, 1,
-1.677295, -0.03262505, -1.412972, 1, 0.3058824, 0, 1,
-1.665383, 0.1443197, -0.5838963, 1, 0.3137255, 0, 1,
-1.664575, -0.1856775, -1.311336, 1, 0.3176471, 0, 1,
-1.636631, -1.119461, -3.976012, 1, 0.3254902, 0, 1,
-1.6173, 0.4852945, -2.687181, 1, 0.3294118, 0, 1,
-1.601338, -2.499871, -1.007056, 1, 0.3372549, 0, 1,
-1.596447, 0.4402444, -2.020944, 1, 0.3411765, 0, 1,
-1.580983, 0.6539965, -1.715352, 1, 0.3490196, 0, 1,
-1.565807, -0.4144401, -2.798797, 1, 0.3529412, 0, 1,
-1.546214, 0.09062996, -1.064436, 1, 0.3607843, 0, 1,
-1.53431, -1.550991, -2.584068, 1, 0.3647059, 0, 1,
-1.530457, -1.697082, -3.146508, 1, 0.372549, 0, 1,
-1.530247, 0.2625485, -1.453049, 1, 0.3764706, 0, 1,
-1.511178, -0.1643783, -0.8576705, 1, 0.3843137, 0, 1,
-1.483658, 1.357238, 1.230407, 1, 0.3882353, 0, 1,
-1.470473, 0.286386, -0.07320695, 1, 0.3960784, 0, 1,
-1.463494, -1.135151, -2.987728, 1, 0.4039216, 0, 1,
-1.458237, 0.6347165, -1.710733, 1, 0.4078431, 0, 1,
-1.448955, 1.703994, -0.6434158, 1, 0.4156863, 0, 1,
-1.442036, 0.5775659, 0.3556217, 1, 0.4196078, 0, 1,
-1.44157, 0.6493159, -1.324219, 1, 0.427451, 0, 1,
-1.430926, -0.5472527, -1.818452, 1, 0.4313726, 0, 1,
-1.415711, 2.132264, 0.332228, 1, 0.4392157, 0, 1,
-1.405564, 0.09526508, -0.4487205, 1, 0.4431373, 0, 1,
-1.40436, 2.19756, -1.276179, 1, 0.4509804, 0, 1,
-1.40274, 0.3607526, -0.4335201, 1, 0.454902, 0, 1,
-1.400397, -1.067788, -3.041004, 1, 0.4627451, 0, 1,
-1.383724, 0.7683223, -0.8268346, 1, 0.4666667, 0, 1,
-1.364312, -0.7169759, -2.453124, 1, 0.4745098, 0, 1,
-1.357703, -0.3517218, -0.5755076, 1, 0.4784314, 0, 1,
-1.357093, -0.4837731, 0.09926873, 1, 0.4862745, 0, 1,
-1.357029, 1.203768, -0.9225495, 1, 0.4901961, 0, 1,
-1.349547, 0.06386545, -2.391678, 1, 0.4980392, 0, 1,
-1.338498, -1.08589, -4.195536, 1, 0.5058824, 0, 1,
-1.327666, 1.257581, 0.5875873, 1, 0.509804, 0, 1,
-1.326686, 0.01272758, -2.530366, 1, 0.5176471, 0, 1,
-1.326063, -1.155146, -1.090427, 1, 0.5215687, 0, 1,
-1.319872, -0.1140891, -2.371419, 1, 0.5294118, 0, 1,
-1.31247, 0.5891602, -2.289758, 1, 0.5333334, 0, 1,
-1.311284, 0.7001313, -0.8069278, 1, 0.5411765, 0, 1,
-1.305157, 0.5503746, -0.2474608, 1, 0.5450981, 0, 1,
-1.298791, -0.2796201, -2.294263, 1, 0.5529412, 0, 1,
-1.287775, -0.3624139, -1.478988, 1, 0.5568628, 0, 1,
-1.278225, -1.498543, -0.9640478, 1, 0.5647059, 0, 1,
-1.275953, -1.048242, -1.854388, 1, 0.5686275, 0, 1,
-1.271889, 0.6704749, -1.444219, 1, 0.5764706, 0, 1,
-1.257356, 0.9224945, -2.028577, 1, 0.5803922, 0, 1,
-1.239125, -0.2154521, -2.970142, 1, 0.5882353, 0, 1,
-1.237871, -0.78975, -4.414847, 1, 0.5921569, 0, 1,
-1.236937, 0.002757859, -0.6343616, 1, 0.6, 0, 1,
-1.22436, -0.3508054, -2.461244, 1, 0.6078432, 0, 1,
-1.215673, 0.4724088, -2.649049, 1, 0.6117647, 0, 1,
-1.213954, -0.4300316, -1.870831, 1, 0.6196079, 0, 1,
-1.205464, 1.676396, 0.1350638, 1, 0.6235294, 0, 1,
-1.202207, 0.8461226, -0.8273661, 1, 0.6313726, 0, 1,
-1.200823, -0.4115714, -1.450537, 1, 0.6352941, 0, 1,
-1.196484, -0.4383263, -1.652316, 1, 0.6431373, 0, 1,
-1.196474, 1.628104, -1.765677, 1, 0.6470588, 0, 1,
-1.192723, -0.9441832, -1.720993, 1, 0.654902, 0, 1,
-1.188093, 0.4566025, 0.7445775, 1, 0.6588235, 0, 1,
-1.186908, -1.250565, -2.645275, 1, 0.6666667, 0, 1,
-1.185129, 0.3707833, -1.841496, 1, 0.6705883, 0, 1,
-1.183519, 0.06360779, -2.899433, 1, 0.6784314, 0, 1,
-1.182473, 0.6166241, -1.399228, 1, 0.682353, 0, 1,
-1.179878, 0.813431, 0.1534698, 1, 0.6901961, 0, 1,
-1.17569, 1.067882, 0.57393, 1, 0.6941177, 0, 1,
-1.173132, 0.7957665, -0.4411789, 1, 0.7019608, 0, 1,
-1.162005, 0.5927372, -1.833617, 1, 0.7098039, 0, 1,
-1.156173, 0.2267414, -0.9674202, 1, 0.7137255, 0, 1,
-1.154589, 0.3218043, -0.7042028, 1, 0.7215686, 0, 1,
-1.151805, -0.9849273, -1.492513, 1, 0.7254902, 0, 1,
-1.146302, -2.465062, -2.197369, 1, 0.7333333, 0, 1,
-1.139994, 0.2865006, -0.1725656, 1, 0.7372549, 0, 1,
-1.12898, -0.9230592, -0.6455986, 1, 0.7450981, 0, 1,
-1.123331, -0.4211426, -2.050932, 1, 0.7490196, 0, 1,
-1.121336, -0.1317799, -1.036283, 1, 0.7568628, 0, 1,
-1.121319, 0.48387, -1.57718, 1, 0.7607843, 0, 1,
-1.110541, -0.6805738, -3.08763, 1, 0.7686275, 0, 1,
-1.107849, 1.350757, 1.018099, 1, 0.772549, 0, 1,
-1.096999, -1.27636, -1.771304, 1, 0.7803922, 0, 1,
-1.094695, -1.123359, -3.478526, 1, 0.7843137, 0, 1,
-1.094688, -1.423213, -3.054279, 1, 0.7921569, 0, 1,
-1.085365, -0.6834447, -2.647486, 1, 0.7960784, 0, 1,
-1.080539, -0.9815023, -0.999454, 1, 0.8039216, 0, 1,
-1.075419, 0.8484322, -0.7913823, 1, 0.8117647, 0, 1,
-1.071595, -0.2909807, 0.3854685, 1, 0.8156863, 0, 1,
-1.064422, -0.6697088, -2.945827, 1, 0.8235294, 0, 1,
-1.060731, -1.096558, -0.9674814, 1, 0.827451, 0, 1,
-1.060727, -0.02929997, -2.264896, 1, 0.8352941, 0, 1,
-1.053655, -1.83175, -1.399757, 1, 0.8392157, 0, 1,
-1.050581, 0.8119417, -1.571907, 1, 0.8470588, 0, 1,
-1.048282, -0.619256, -0.7673077, 1, 0.8509804, 0, 1,
-1.048223, 0.1493672, -1.806453, 1, 0.8588235, 0, 1,
-1.043285, 0.4829278, -0.3729755, 1, 0.8627451, 0, 1,
-1.030329, -0.9543308, -2.578257, 1, 0.8705882, 0, 1,
-1.027487, -0.5282667, -1.500067, 1, 0.8745098, 0, 1,
-1.019542, -0.06700908, -2.867338, 1, 0.8823529, 0, 1,
-1.012185, 0.2530802, -0.8693172, 1, 0.8862745, 0, 1,
-1.009706, -0.2999886, -0.9264394, 1, 0.8941177, 0, 1,
-1.00959, 0.5985357, -1.811332, 1, 0.8980392, 0, 1,
-1.008548, 0.2476549, -0.7783604, 1, 0.9058824, 0, 1,
-1.006224, 0.07926773, -1.759946, 1, 0.9137255, 0, 1,
-1.000937, -0.1207646, -2.963713, 1, 0.9176471, 0, 1,
-0.997263, 0.7284841, -2.403813, 1, 0.9254902, 0, 1,
-0.9958165, 1.25652, 1.001191, 1, 0.9294118, 0, 1,
-0.9945168, 0.3785981, -1.163127, 1, 0.9372549, 0, 1,
-0.9930478, 0.5110324, -1.949641, 1, 0.9411765, 0, 1,
-0.992582, -0.585442, -3.012693, 1, 0.9490196, 0, 1,
-0.9924095, -0.5010747, -1.112454, 1, 0.9529412, 0, 1,
-0.9880888, 0.5911583, -0.2603025, 1, 0.9607843, 0, 1,
-0.979261, -0.4815837, -1.398805, 1, 0.9647059, 0, 1,
-0.9736884, 0.8528865, -0.4172086, 1, 0.972549, 0, 1,
-0.973141, 0.03405987, -0.6328247, 1, 0.9764706, 0, 1,
-0.9673359, 1.117069, -1.476842, 1, 0.9843137, 0, 1,
-0.9661964, 0.1076508, 0.005960078, 1, 0.9882353, 0, 1,
-0.9644806, -0.6046871, -4.108135, 1, 0.9960784, 0, 1,
-0.9599012, 0.07782818, -0.9173322, 0.9960784, 1, 0, 1,
-0.9579126, -0.2819766, -1.874227, 0.9921569, 1, 0, 1,
-0.9488966, -1.567195, -2.484079, 0.9843137, 1, 0, 1,
-0.9479891, -0.5133145, -2.511555, 0.9803922, 1, 0, 1,
-0.9442222, 0.6060846, -1.297694, 0.972549, 1, 0, 1,
-0.9387618, 0.4224743, -1.360649, 0.9686275, 1, 0, 1,
-0.9324685, -0.5173705, -3.324592, 0.9607843, 1, 0, 1,
-0.9322721, -0.1370203, -2.904541, 0.9568627, 1, 0, 1,
-0.9295247, -0.01855863, -0.9250587, 0.9490196, 1, 0, 1,
-0.9279062, 1.695741, -1.8687, 0.945098, 1, 0, 1,
-0.9246247, -0.1766967, -2.465328, 0.9372549, 1, 0, 1,
-0.9227002, 0.2856966, -0.75147, 0.9333333, 1, 0, 1,
-0.9200623, 0.148992, -1.852677, 0.9254902, 1, 0, 1,
-0.9183706, 1.61713, -0.9013892, 0.9215686, 1, 0, 1,
-0.9105894, -1.009997, -2.298493, 0.9137255, 1, 0, 1,
-0.9101589, -0.2457104, -1.606896, 0.9098039, 1, 0, 1,
-0.9089996, 0.2085436, -1.996187, 0.9019608, 1, 0, 1,
-0.9015869, -0.9444786, -3.571553, 0.8941177, 1, 0, 1,
-0.8973488, -1.12019, -1.572365, 0.8901961, 1, 0, 1,
-0.8896379, -0.1812643, -2.395815, 0.8823529, 1, 0, 1,
-0.8776495, 0.9486982, -0.5108172, 0.8784314, 1, 0, 1,
-0.8714468, -0.6232474, -1.38134, 0.8705882, 1, 0, 1,
-0.8677789, -0.6215428, -1.085918, 0.8666667, 1, 0, 1,
-0.8644433, 0.5591815, -1.967649, 0.8588235, 1, 0, 1,
-0.863444, -1.6271, -3.01529, 0.854902, 1, 0, 1,
-0.8592285, -0.9420513, -1.698597, 0.8470588, 1, 0, 1,
-0.8510358, -0.5718808, -2.093409, 0.8431373, 1, 0, 1,
-0.8499972, -0.01213982, -2.240708, 0.8352941, 1, 0, 1,
-0.8471797, -1.00272, -1.687135, 0.8313726, 1, 0, 1,
-0.846193, 1.222987, 1.530354, 0.8235294, 1, 0, 1,
-0.8422599, -1.417174, -2.477328, 0.8196079, 1, 0, 1,
-0.8389408, -0.1387609, 0.08416636, 0.8117647, 1, 0, 1,
-0.8322117, 0.6784425, -2.358832, 0.8078431, 1, 0, 1,
-0.8317833, -0.5240183, -3.55518, 0.8, 1, 0, 1,
-0.8303946, 0.1082773, -1.326616, 0.7921569, 1, 0, 1,
-0.8274733, -0.3292023, -1.649747, 0.7882353, 1, 0, 1,
-0.8221421, -0.02243021, -1.188782, 0.7803922, 1, 0, 1,
-0.8185686, -1.773496, -2.489489, 0.7764706, 1, 0, 1,
-0.8167241, -0.4258822, -2.045206, 0.7686275, 1, 0, 1,
-0.8140576, 0.3401321, 0.108477, 0.7647059, 1, 0, 1,
-0.8104246, 1.320158, -3.37905, 0.7568628, 1, 0, 1,
-0.8074073, 0.5972724, -2.039996, 0.7529412, 1, 0, 1,
-0.8003051, -0.5441223, -2.315798, 0.7450981, 1, 0, 1,
-0.7993523, -1.559242, -1.270016, 0.7411765, 1, 0, 1,
-0.7915242, 0.7302092, -0.05646061, 0.7333333, 1, 0, 1,
-0.7910568, -0.3992462, -1.654482, 0.7294118, 1, 0, 1,
-0.7899709, -0.3221721, -1.517116, 0.7215686, 1, 0, 1,
-0.78993, 1.004127, -0.9695635, 0.7176471, 1, 0, 1,
-0.7848585, -0.7073997, -0.6644301, 0.7098039, 1, 0, 1,
-0.7827364, -0.293218, -2.698377, 0.7058824, 1, 0, 1,
-0.7695826, -0.2101399, -2.289266, 0.6980392, 1, 0, 1,
-0.7624009, 0.4242117, -2.242397, 0.6901961, 1, 0, 1,
-0.7617744, 0.1755163, -2.677196, 0.6862745, 1, 0, 1,
-0.757952, -1.36314, -3.581474, 0.6784314, 1, 0, 1,
-0.751626, 1.13393, -1.397069, 0.6745098, 1, 0, 1,
-0.7508968, 0.2658854, -3.542351, 0.6666667, 1, 0, 1,
-0.7455233, 1.346211, 0.3873897, 0.6627451, 1, 0, 1,
-0.7442036, 0.9241393, -1.352827, 0.654902, 1, 0, 1,
-0.738507, -0.737012, -2.570661, 0.6509804, 1, 0, 1,
-0.7322658, 0.4748802, -0.3032846, 0.6431373, 1, 0, 1,
-0.7315191, -2.090885, -3.018966, 0.6392157, 1, 0, 1,
-0.7257853, -1.181345, -1.99481, 0.6313726, 1, 0, 1,
-0.7255768, -0.8358096, -1.234767, 0.627451, 1, 0, 1,
-0.7210947, 0.111488, -0.1913761, 0.6196079, 1, 0, 1,
-0.7145899, 0.9143523, 0.853227, 0.6156863, 1, 0, 1,
-0.7142926, -0.1013279, -2.535683, 0.6078432, 1, 0, 1,
-0.7135001, -0.2066325, -2.733582, 0.6039216, 1, 0, 1,
-0.7120283, -0.1240817, -2.339363, 0.5960785, 1, 0, 1,
-0.7093529, 1.084156, 0.7536364, 0.5882353, 1, 0, 1,
-0.7067545, -1.785774, -2.641714, 0.5843138, 1, 0, 1,
-0.7061671, -0.1069574, -2.981692, 0.5764706, 1, 0, 1,
-0.7051325, 0.2131969, -0.8513696, 0.572549, 1, 0, 1,
-0.7032891, 0.7770401, 0.6640016, 0.5647059, 1, 0, 1,
-0.7010401, 0.9849896, 0.3777188, 0.5607843, 1, 0, 1,
-0.6961257, -1.398834, -4.285907, 0.5529412, 1, 0, 1,
-0.6938362, 1.249007, -0.7749492, 0.5490196, 1, 0, 1,
-0.6929948, 0.2272225, -1.168226, 0.5411765, 1, 0, 1,
-0.6929519, 1.524158, 0.4390683, 0.5372549, 1, 0, 1,
-0.690956, -0.2133402, -3.010276, 0.5294118, 1, 0, 1,
-0.6894156, -2.332142, -3.212867, 0.5254902, 1, 0, 1,
-0.6889378, 1.331136, -0.317286, 0.5176471, 1, 0, 1,
-0.6843383, -0.126676, -0.8553687, 0.5137255, 1, 0, 1,
-0.6834585, 0.2968968, -1.168321, 0.5058824, 1, 0, 1,
-0.6824991, -0.01800389, -1.911917, 0.5019608, 1, 0, 1,
-0.6794133, -0.4653229, -1.592847, 0.4941176, 1, 0, 1,
-0.6792939, -2.050506, -1.732078, 0.4862745, 1, 0, 1,
-0.6714628, 0.4138188, -1.499007, 0.4823529, 1, 0, 1,
-0.6698697, 0.6502212, -0.5390425, 0.4745098, 1, 0, 1,
-0.6678494, 0.1558684, -3.251521, 0.4705882, 1, 0, 1,
-0.6667111, 0.6105552, -2.215174, 0.4627451, 1, 0, 1,
-0.6650184, 0.4140876, -1.09168, 0.4588235, 1, 0, 1,
-0.6577364, 0.1338442, -0.4310633, 0.4509804, 1, 0, 1,
-0.652629, -0.01616826, -2.404147, 0.4470588, 1, 0, 1,
-0.6516512, -1.168079, -2.169394, 0.4392157, 1, 0, 1,
-0.6498502, 0.1738184, -1.921168, 0.4352941, 1, 0, 1,
-0.6489454, -0.7047424, -3.228099, 0.427451, 1, 0, 1,
-0.6483639, -0.3312507, -4.983319, 0.4235294, 1, 0, 1,
-0.6471508, 0.5125688, -0.2886232, 0.4156863, 1, 0, 1,
-0.6448526, -0.09935592, -3.476878, 0.4117647, 1, 0, 1,
-0.6446754, 0.1154093, -0.4718436, 0.4039216, 1, 0, 1,
-0.6435887, 1.186817, -1.432647, 0.3960784, 1, 0, 1,
-0.6425094, -0.6777133, -1.481507, 0.3921569, 1, 0, 1,
-0.6406138, -1.56715, -2.294116, 0.3843137, 1, 0, 1,
-0.6389988, 1.116647, 0.6715984, 0.3803922, 1, 0, 1,
-0.636888, -2.252884, -1.992543, 0.372549, 1, 0, 1,
-0.6365427, -0.1152133, -2.206945, 0.3686275, 1, 0, 1,
-0.6323043, 0.2466982, -1.652452, 0.3607843, 1, 0, 1,
-0.6302199, 0.1463227, -0.2108355, 0.3568628, 1, 0, 1,
-0.6279551, 1.364588, -1.091818, 0.3490196, 1, 0, 1,
-0.6250224, 0.4305366, 0.9389917, 0.345098, 1, 0, 1,
-0.6198085, 1.2168, -0.1089078, 0.3372549, 1, 0, 1,
-0.6188465, -1.078041, -4.104292, 0.3333333, 1, 0, 1,
-0.6172795, 0.7534786, 0.780984, 0.3254902, 1, 0, 1,
-0.613145, -0.3898464, -3.05584, 0.3215686, 1, 0, 1,
-0.6119274, -0.4824584, -3.378462, 0.3137255, 1, 0, 1,
-0.6063859, -0.387152, -1.724451, 0.3098039, 1, 0, 1,
-0.6038851, 1.451478, -2.382913, 0.3019608, 1, 0, 1,
-0.6028776, 0.08367876, -2.11375, 0.2941177, 1, 0, 1,
-0.5989384, 0.1412118, -0.9853626, 0.2901961, 1, 0, 1,
-0.5981658, 0.9116274, -1.799676, 0.282353, 1, 0, 1,
-0.5961183, 0.03724588, -3.635942, 0.2784314, 1, 0, 1,
-0.5951519, 0.005885678, -1.939121, 0.2705882, 1, 0, 1,
-0.5904947, 1.24637, 0.5428358, 0.2666667, 1, 0, 1,
-0.5853118, -0.8459282, -2.110159, 0.2588235, 1, 0, 1,
-0.582832, 0.9643744, 0.7159896, 0.254902, 1, 0, 1,
-0.5710537, 0.4306898, -0.6568422, 0.2470588, 1, 0, 1,
-0.570732, 0.2618236, -4.162269, 0.2431373, 1, 0, 1,
-0.5649526, 0.6230443, -0.366243, 0.2352941, 1, 0, 1,
-0.5594643, -1.244808, -3.18697, 0.2313726, 1, 0, 1,
-0.5493827, -0.9654683, -2.494065, 0.2235294, 1, 0, 1,
-0.5459547, -0.430401, -2.659841, 0.2196078, 1, 0, 1,
-0.545357, -1.647084, -2.837249, 0.2117647, 1, 0, 1,
-0.5450766, -1.024306, -3.031751, 0.2078431, 1, 0, 1,
-0.544697, 0.3920073, -2.383039, 0.2, 1, 0, 1,
-0.5438969, 1.016077, 1.913818, 0.1921569, 1, 0, 1,
-0.5412273, -0.6030303, -2.846315, 0.1882353, 1, 0, 1,
-0.5407733, 1.681532, 1.183253, 0.1803922, 1, 0, 1,
-0.5381588, -0.4181473, -1.732732, 0.1764706, 1, 0, 1,
-0.5324917, 0.098866, 0.4754486, 0.1686275, 1, 0, 1,
-0.5291849, -0.6562937, -1.516262, 0.1647059, 1, 0, 1,
-0.5282305, -0.4294783, -2.00651, 0.1568628, 1, 0, 1,
-0.5230659, 0.2097522, -1.689308, 0.1529412, 1, 0, 1,
-0.5229881, -0.1206016, -3.05612, 0.145098, 1, 0, 1,
-0.5188467, -0.1151563, -2.332679, 0.1411765, 1, 0, 1,
-0.5184813, 1.191041, 1.260266, 0.1333333, 1, 0, 1,
-0.5173315, 0.2625006, 0.1108237, 0.1294118, 1, 0, 1,
-0.5125966, -0.4500231, -3.048398, 0.1215686, 1, 0, 1,
-0.503505, -1.133588, -1.833008, 0.1176471, 1, 0, 1,
-0.501999, -2.461319, -2.435236, 0.1098039, 1, 0, 1,
-0.493427, -0.2404204, -4.452744, 0.1058824, 1, 0, 1,
-0.4924226, 1.756143, -0.01651484, 0.09803922, 1, 0, 1,
-0.4862852, -0.9393689, -1.435564, 0.09019608, 1, 0, 1,
-0.4856074, 0.5862448, -0.7692379, 0.08627451, 1, 0, 1,
-0.4841944, -0.6176415, -3.049674, 0.07843138, 1, 0, 1,
-0.4836569, 0.4119847, -0.8430545, 0.07450981, 1, 0, 1,
-0.4808167, 0.08571903, -0.7488053, 0.06666667, 1, 0, 1,
-0.4769288, -0.1270756, -2.774269, 0.0627451, 1, 0, 1,
-0.4743612, 0.9781422, -1.841391, 0.05490196, 1, 0, 1,
-0.4668944, -0.1622355, -2.269365, 0.05098039, 1, 0, 1,
-0.4629487, 0.09788836, -2.128482, 0.04313726, 1, 0, 1,
-0.4601519, -0.9516378, -2.905182, 0.03921569, 1, 0, 1,
-0.4599563, 0.1605117, -1.742768, 0.03137255, 1, 0, 1,
-0.4589729, -0.08810442, -1.828724, 0.02745098, 1, 0, 1,
-0.4559729, -0.5775692, -3.027281, 0.01960784, 1, 0, 1,
-0.4484882, 0.6153828, -0.4543705, 0.01568628, 1, 0, 1,
-0.4454405, 1.175681, 0.3149715, 0.007843138, 1, 0, 1,
-0.4454215, 1.317249, -0.6935025, 0.003921569, 1, 0, 1,
-0.4410634, -0.7945636, -1.54718, 0, 1, 0.003921569, 1,
-0.4384522, 0.8675219, -1.043241, 0, 1, 0.01176471, 1,
-0.4375956, -1.332377, -2.533, 0, 1, 0.01568628, 1,
-0.429957, 0.04774325, -0.7053578, 0, 1, 0.02352941, 1,
-0.4256317, -0.2233016, -2.352239, 0, 1, 0.02745098, 1,
-0.4250227, 0.4948469, -0.3695848, 0, 1, 0.03529412, 1,
-0.4189349, 0.7096906, -1.055285, 0, 1, 0.03921569, 1,
-0.4171714, -0.1273147, -0.8251707, 0, 1, 0.04705882, 1,
-0.4124303, 2.13954, 0.193949, 0, 1, 0.05098039, 1,
-0.4036928, 0.9818887, 0.253969, 0, 1, 0.05882353, 1,
-0.4017769, -0.4981605, -2.656991, 0, 1, 0.0627451, 1,
-0.3970117, -0.9464281, -3.112822, 0, 1, 0.07058824, 1,
-0.3936259, 0.5724919, 0.2946019, 0, 1, 0.07450981, 1,
-0.3926763, 0.4027789, 1.632084, 0, 1, 0.08235294, 1,
-0.3917435, -0.2538765, -1.177169, 0, 1, 0.08627451, 1,
-0.391001, -1.603655, -4.032133, 0, 1, 0.09411765, 1,
-0.3896033, 0.8854002, 1.746567, 0, 1, 0.1019608, 1,
-0.383556, 1.179659, -0.3722833, 0, 1, 0.1058824, 1,
-0.3819939, -0.05247939, -0.8048115, 0, 1, 0.1137255, 1,
-0.3777285, -0.7139519, -1.421527, 0, 1, 0.1176471, 1,
-0.3742426, -1.541724, -4.14219, 0, 1, 0.1254902, 1,
-0.3717437, 0.1001565, -1.950301, 0, 1, 0.1294118, 1,
-0.371079, 0.505887, -0.7598311, 0, 1, 0.1372549, 1,
-0.368042, 0.774084, -0.236702, 0, 1, 0.1411765, 1,
-0.3607084, -0.9018424, -2.77608, 0, 1, 0.1490196, 1,
-0.3573363, 0.1974344, -1.180039, 0, 1, 0.1529412, 1,
-0.3551674, 0.4077324, -0.2208021, 0, 1, 0.1607843, 1,
-0.3513106, 0.4620115, 0.06165998, 0, 1, 0.1647059, 1,
-0.3483333, 0.2246078, -1.516848, 0, 1, 0.172549, 1,
-0.3459482, -1.931105, -2.046706, 0, 1, 0.1764706, 1,
-0.3459167, 1.486095, 0.6068876, 0, 1, 0.1843137, 1,
-0.3452793, 0.9198661, 0.7592962, 0, 1, 0.1882353, 1,
-0.3384975, 0.2848613, -1.02105, 0, 1, 0.1960784, 1,
-0.3330494, 1.267217, 1.300318, 0, 1, 0.2039216, 1,
-0.3299759, -0.829089, -4.791578, 0, 1, 0.2078431, 1,
-0.3298535, -0.518535, -1.453893, 0, 1, 0.2156863, 1,
-0.3295431, 0.4289955, -0.8652658, 0, 1, 0.2196078, 1,
-0.3215344, -0.2361724, -3.231354, 0, 1, 0.227451, 1,
-0.3208798, -1.085725, -3.393008, 0, 1, 0.2313726, 1,
-0.3199481, -1.218826, -2.096859, 0, 1, 0.2392157, 1,
-0.3194437, 1.163251, 0.975087, 0, 1, 0.2431373, 1,
-0.3192825, -0.1298915, -2.881216, 0, 1, 0.2509804, 1,
-0.3192018, 0.4798229, -2.454976, 0, 1, 0.254902, 1,
-0.3162002, 0.8931752, -1.308267, 0, 1, 0.2627451, 1,
-0.3089603, 1.947907, -2.200093, 0, 1, 0.2666667, 1,
-0.301991, -0.8875359, -2.170206, 0, 1, 0.2745098, 1,
-0.3017647, -1.614311, -3.480011, 0, 1, 0.2784314, 1,
-0.2971012, 0.9154072, -0.3899127, 0, 1, 0.2862745, 1,
-0.294154, -1.131768, -2.321461, 0, 1, 0.2901961, 1,
-0.2891166, 0.3680307, -1.333316, 0, 1, 0.2980392, 1,
-0.2884558, -0.1175126, -2.676619, 0, 1, 0.3058824, 1,
-0.2883206, 1.626762, 0.4930388, 0, 1, 0.3098039, 1,
-0.2813439, -0.02009321, -0.2989691, 0, 1, 0.3176471, 1,
-0.2752913, 1.793956, -2.811198, 0, 1, 0.3215686, 1,
-0.274214, 0.1265978, -0.5755495, 0, 1, 0.3294118, 1,
-0.2737221, 0.03701478, -1.983286, 0, 1, 0.3333333, 1,
-0.2709481, -0.2763541, -2.519192, 0, 1, 0.3411765, 1,
-0.2625938, -1.520572, -2.678652, 0, 1, 0.345098, 1,
-0.2621598, 0.4460707, -0.192352, 0, 1, 0.3529412, 1,
-0.2611359, -1.44357, -3.775389, 0, 1, 0.3568628, 1,
-0.2571679, -0.4131509, -2.989766, 0, 1, 0.3647059, 1,
-0.2486101, -0.4977475, -1.1167, 0, 1, 0.3686275, 1,
-0.2460672, -0.001355411, -0.1480049, 0, 1, 0.3764706, 1,
-0.2448318, -0.1610783, -2.143731, 0, 1, 0.3803922, 1,
-0.2429376, -0.526628, -2.529414, 0, 1, 0.3882353, 1,
-0.2425453, -2.113736, -2.892494, 0, 1, 0.3921569, 1,
-0.2400705, -0.1095396, -0.2302281, 0, 1, 0.4, 1,
-0.2380184, -0.5964252, -1.930336, 0, 1, 0.4078431, 1,
-0.2298341, -0.0714841, -2.609883, 0, 1, 0.4117647, 1,
-0.221005, -0.7128182, -1.866221, 0, 1, 0.4196078, 1,
-0.2195431, 0.5529632, 0.08548929, 0, 1, 0.4235294, 1,
-0.2191161, -0.117257, -2.132538, 0, 1, 0.4313726, 1,
-0.2187037, 1.717366, -0.4502918, 0, 1, 0.4352941, 1,
-0.2184642, -0.8662885, -1.977707, 0, 1, 0.4431373, 1,
-0.2151954, -1.616681, -3.363572, 0, 1, 0.4470588, 1,
-0.2123834, -1.118978, -1.878186, 0, 1, 0.454902, 1,
-0.209341, -0.8606349, -3.508793, 0, 1, 0.4588235, 1,
-0.2087585, 0.6759704, 2.21302, 0, 1, 0.4666667, 1,
-0.2072656, 1.642266, 0.8784638, 0, 1, 0.4705882, 1,
-0.1968325, 0.1227198, -1.119618, 0, 1, 0.4784314, 1,
-0.1965932, 2.15626, -1.04757, 0, 1, 0.4823529, 1,
-0.1955724, -0.06716458, -1.861104, 0, 1, 0.4901961, 1,
-0.1899958, 1.224304, -1.192071, 0, 1, 0.4941176, 1,
-0.1879611, 0.3944984, -2.369081, 0, 1, 0.5019608, 1,
-0.1864122, 1.594175, 0.6299027, 0, 1, 0.509804, 1,
-0.1822357, 0.8911912, -1.251963, 0, 1, 0.5137255, 1,
-0.1812832, 0.5129634, -2.052866, 0, 1, 0.5215687, 1,
-0.1762849, -0.009043664, 0.4068868, 0, 1, 0.5254902, 1,
-0.1736915, -0.5829827, -1.360717, 0, 1, 0.5333334, 1,
-0.1706853, -0.1154456, -0.8997175, 0, 1, 0.5372549, 1,
-0.1697201, 1.488801, 0.5417881, 0, 1, 0.5450981, 1,
-0.1634831, -0.08665998, -0.8098572, 0, 1, 0.5490196, 1,
-0.1622576, 0.6372815, -0.5691072, 0, 1, 0.5568628, 1,
-0.1537739, -0.02587049, -1.106544, 0, 1, 0.5607843, 1,
-0.1525109, 0.591285, -0.04334502, 0, 1, 0.5686275, 1,
-0.1485326, 0.6295888, -1.238377, 0, 1, 0.572549, 1,
-0.1415629, -0.3805225, -2.671725, 0, 1, 0.5803922, 1,
-0.1406793, 0.9033154, -0.7714808, 0, 1, 0.5843138, 1,
-0.138916, -0.1859284, -3.073164, 0, 1, 0.5921569, 1,
-0.1376525, 1.027685, 0.4614998, 0, 1, 0.5960785, 1,
-0.1367215, -1.019576, -4.318421, 0, 1, 0.6039216, 1,
-0.136559, -0.638888, -1.760968, 0, 1, 0.6117647, 1,
-0.1353341, -1.280333, -2.688623, 0, 1, 0.6156863, 1,
-0.1334907, -0.2819054, -3.252842, 0, 1, 0.6235294, 1,
-0.1312709, -0.9280605, -3.258839, 0, 1, 0.627451, 1,
-0.1287436, -0.257564, -2.171981, 0, 1, 0.6352941, 1,
-0.127597, 0.7415501, 0.1730041, 0, 1, 0.6392157, 1,
-0.1272212, -0.01827995, -3.655015, 0, 1, 0.6470588, 1,
-0.126895, -2.133158, -4.398518, 0, 1, 0.6509804, 1,
-0.1243356, 0.02217983, -1.639708, 0, 1, 0.6588235, 1,
-0.1222723, -1.141981, -2.686166, 0, 1, 0.6627451, 1,
-0.1194804, -1.545167, -5.166735, 0, 1, 0.6705883, 1,
-0.1191688, -0.07840122, -1.455164, 0, 1, 0.6745098, 1,
-0.1156621, -0.2255885, -1.540592, 0, 1, 0.682353, 1,
-0.1136076, -1.906925, -3.742348, 0, 1, 0.6862745, 1,
-0.1121377, -0.4913667, -2.210305, 0, 1, 0.6941177, 1,
-0.1081542, 0.2488678, 0.3630179, 0, 1, 0.7019608, 1,
-0.1068198, -1.244027, -3.324266, 0, 1, 0.7058824, 1,
-0.1023382, -1.240868, -4.058486, 0, 1, 0.7137255, 1,
-0.1022657, 0.3793482, 0.4600068, 0, 1, 0.7176471, 1,
-0.1012598, 1.073689, -1.295032, 0, 1, 0.7254902, 1,
-0.09603126, 0.3434957, 0.7557151, 0, 1, 0.7294118, 1,
-0.09336606, 0.5485403, -0.7343158, 0, 1, 0.7372549, 1,
-0.09295169, -0.4682937, -0.9310927, 0, 1, 0.7411765, 1,
-0.08793074, -0.2893255, -1.260597, 0, 1, 0.7490196, 1,
-0.08780099, 0.4689046, -1.890114, 0, 1, 0.7529412, 1,
-0.0847057, 1.285884, 0.1897168, 0, 1, 0.7607843, 1,
-0.07798558, -0.09924076, -4.088682, 0, 1, 0.7647059, 1,
-0.07764296, 0.3129652, 1.188287, 0, 1, 0.772549, 1,
-0.07097681, 3.323966, -0.8470722, 0, 1, 0.7764706, 1,
-0.07088117, -1.285287, -3.011642, 0, 1, 0.7843137, 1,
-0.06860925, -0.8285189, -3.649658, 0, 1, 0.7882353, 1,
-0.06770231, 1.339902, -1.128201, 0, 1, 0.7960784, 1,
-0.06257489, -0.6696681, -2.961596, 0, 1, 0.8039216, 1,
-0.06064009, -0.1106961, -1.761047, 0, 1, 0.8078431, 1,
-0.06040497, 0.5879357, -3.02972, 0, 1, 0.8156863, 1,
-0.05928833, 0.002311773, -0.2760546, 0, 1, 0.8196079, 1,
-0.05619066, 1.352808, 0.7031865, 0, 1, 0.827451, 1,
-0.0536283, 1.197352, -0.7113531, 0, 1, 0.8313726, 1,
-0.05291296, -0.8168442, -3.463758, 0, 1, 0.8392157, 1,
-0.045186, -1.397927, -2.838587, 0, 1, 0.8431373, 1,
-0.04012248, -0.807386, -2.354971, 0, 1, 0.8509804, 1,
-0.03712702, -0.8630303, -4.261973, 0, 1, 0.854902, 1,
-0.03308317, 2.05124, 0.9082376, 0, 1, 0.8627451, 1,
-0.03207121, -0.3613846, -3.678267, 0, 1, 0.8666667, 1,
-0.03127781, -0.4724615, -1.415153, 0, 1, 0.8745098, 1,
-0.02788189, 0.4599954, 0.06264116, 0, 1, 0.8784314, 1,
-0.02787583, 1.085604, -1.047622, 0, 1, 0.8862745, 1,
-0.02622266, 0.2774727, -0.06958846, 0, 1, 0.8901961, 1,
-0.02393577, 1.344509, -0.816799, 0, 1, 0.8980392, 1,
-0.01837364, 1.003157, 0.4545707, 0, 1, 0.9058824, 1,
-0.01620721, -1.290399, -4.509075, 0, 1, 0.9098039, 1,
-0.01597673, 0.360378, -0.5454521, 0, 1, 0.9176471, 1,
-0.01324585, -1.129702, -3.721373, 0, 1, 0.9215686, 1,
-0.01052119, -0.3515921, -4.282735, 0, 1, 0.9294118, 1,
-0.009786573, 2.302144, 0.0669396, 0, 1, 0.9333333, 1,
-0.009044056, -0.1362993, -3.553589, 0, 1, 0.9411765, 1,
-0.005755111, -0.7593958, -1.120025, 0, 1, 0.945098, 1,
-0.005211818, -1.127039, -2.86709, 0, 1, 0.9529412, 1,
-0.004533643, 0.6675388, -0.7651159, 0, 1, 0.9568627, 1,
0.001240757, 0.6044803, 0.004805823, 0, 1, 0.9647059, 1,
0.001912429, -1.931234, 2.845439, 0, 1, 0.9686275, 1,
0.002306851, 3.320652, -0.0998369, 0, 1, 0.9764706, 1,
0.005921856, 0.1780987, -0.6512792, 0, 1, 0.9803922, 1,
0.01214304, -0.7076532, 3.568138, 0, 1, 0.9882353, 1,
0.01417291, 0.7328823, -2.395588, 0, 1, 0.9921569, 1,
0.01614542, 0.00808051, 1.606113, 0, 1, 1, 1,
0.01722468, -0.9979123, 1.93215, 0, 0.9921569, 1, 1,
0.01817916, -2.755392, 2.546615, 0, 0.9882353, 1, 1,
0.0184987, -0.2801495, 3.2518, 0, 0.9803922, 1, 1,
0.01940052, 1.720654, 0.7455424, 0, 0.9764706, 1, 1,
0.02437344, -0.1919796, 3.566792, 0, 0.9686275, 1, 1,
0.02628409, -1.44541, 2.538876, 0, 0.9647059, 1, 1,
0.02950139, 0.8991797, 0.5351781, 0, 0.9568627, 1, 1,
0.03072512, 0.5707403, -0.4340377, 0, 0.9529412, 1, 1,
0.03742191, 0.2214818, 1.705189, 0, 0.945098, 1, 1,
0.03761772, -1.847986, 1.370065, 0, 0.9411765, 1, 1,
0.03797623, -0.2147608, 1.714465, 0, 0.9333333, 1, 1,
0.04064241, 1.14049, 1.60824, 0, 0.9294118, 1, 1,
0.04246553, 1.368118, -0.3463922, 0, 0.9215686, 1, 1,
0.04351083, 0.2011352, -0.1675004, 0, 0.9176471, 1, 1,
0.0445761, 0.7191839, -1.0058, 0, 0.9098039, 1, 1,
0.04501141, 0.1029053, 0.5365254, 0, 0.9058824, 1, 1,
0.04565553, 0.6700711, 1.091679, 0, 0.8980392, 1, 1,
0.04619728, -1.362717, 3.431511, 0, 0.8901961, 1, 1,
0.04751591, -0.7136756, 5.166784, 0, 0.8862745, 1, 1,
0.04771293, 0.1775201, -2.052527, 0, 0.8784314, 1, 1,
0.04779478, 0.8565407, -0.7299238, 0, 0.8745098, 1, 1,
0.05043208, -0.3110275, 3.733939, 0, 0.8666667, 1, 1,
0.0512583, 2.763211, -1.928104, 0, 0.8627451, 1, 1,
0.05222688, -0.5309739, 2.406044, 0, 0.854902, 1, 1,
0.06156576, -1.174065, 3.3139, 0, 0.8509804, 1, 1,
0.06682712, -1.076072, 0.5930186, 0, 0.8431373, 1, 1,
0.0738936, 0.7178999, 0.4210114, 0, 0.8392157, 1, 1,
0.07593389, -0.5858512, 1.642395, 0, 0.8313726, 1, 1,
0.08028268, 0.1569519, 3.241703, 0, 0.827451, 1, 1,
0.08171505, 0.001160844, 2.425006, 0, 0.8196079, 1, 1,
0.08802462, 0.5219968, 1.052234, 0, 0.8156863, 1, 1,
0.09073844, 0.1764483, -0.02248966, 0, 0.8078431, 1, 1,
0.0928785, 0.3920685, -0.1526032, 0, 0.8039216, 1, 1,
0.09646471, 0.03046116, 2.017511, 0, 0.7960784, 1, 1,
0.09671862, -1.039096, 2.588728, 0, 0.7882353, 1, 1,
0.09841897, 1.043413, 1.712634, 0, 0.7843137, 1, 1,
0.1002709, -0.931084, 3.484516, 0, 0.7764706, 1, 1,
0.1005152, 1.017458, -0.2429276, 0, 0.772549, 1, 1,
0.1057439, -0.740617, 3.189284, 0, 0.7647059, 1, 1,
0.1081821, -0.207818, 1.615278, 0, 0.7607843, 1, 1,
0.11846, 0.2555012, 0.1712615, 0, 0.7529412, 1, 1,
0.1209846, 0.9471726, 1.150157, 0, 0.7490196, 1, 1,
0.1288168, -1.675914, 2.60255, 0, 0.7411765, 1, 1,
0.1313998, -0.8364786, 2.212062, 0, 0.7372549, 1, 1,
0.1344039, -0.7313569, 3.340981, 0, 0.7294118, 1, 1,
0.1390124, -1.1125, 3.91216, 0, 0.7254902, 1, 1,
0.1392258, 0.5217747, -0.5903921, 0, 0.7176471, 1, 1,
0.1393721, 0.7019297, -0.418258, 0, 0.7137255, 1, 1,
0.1404519, 1.241303, 0.1666088, 0, 0.7058824, 1, 1,
0.1413132, 0.1591186, -0.9599513, 0, 0.6980392, 1, 1,
0.1438566, 0.5664659, -0.4911535, 0, 0.6941177, 1, 1,
0.1440745, -1.710905, 2.060964, 0, 0.6862745, 1, 1,
0.1472571, -1.382102, 4.364426, 0, 0.682353, 1, 1,
0.1530097, 0.9080659, 0.3402021, 0, 0.6745098, 1, 1,
0.1532018, 0.9412696, 1.588736, 0, 0.6705883, 1, 1,
0.1544106, -0.2039649, 1.137784, 0, 0.6627451, 1, 1,
0.1549678, -0.2772912, 3.496342, 0, 0.6588235, 1, 1,
0.1572476, -0.4480197, 3.11897, 0, 0.6509804, 1, 1,
0.159005, -0.1460772, 2.589716, 0, 0.6470588, 1, 1,
0.1592717, -0.7950234, 2.537539, 0, 0.6392157, 1, 1,
0.1596466, 1.329742, 1.246107, 0, 0.6352941, 1, 1,
0.1604554, -0.04072322, 0.6854654, 0, 0.627451, 1, 1,
0.161578, 0.1726447, -0.7606437, 0, 0.6235294, 1, 1,
0.1622565, 1.343354, -0.2204862, 0, 0.6156863, 1, 1,
0.1624229, 1.560799, 1.089281, 0, 0.6117647, 1, 1,
0.1657967, -0.05878738, 1.366706, 0, 0.6039216, 1, 1,
0.1664977, 2.571105, 0.8394282, 0, 0.5960785, 1, 1,
0.1669402, 0.4522215, 1.626066, 0, 0.5921569, 1, 1,
0.1694888, 0.9030008, -0.04052225, 0, 0.5843138, 1, 1,
0.1695491, 0.1554381, 1.093618, 0, 0.5803922, 1, 1,
0.1701455, -0.5436094, 2.496726, 0, 0.572549, 1, 1,
0.1735742, -0.9477588, 1.517085, 0, 0.5686275, 1, 1,
0.1750284, -1.356875, 1.876941, 0, 0.5607843, 1, 1,
0.1764233, -0.7515676, 2.601438, 0, 0.5568628, 1, 1,
0.1764786, -0.1335501, 2.581234, 0, 0.5490196, 1, 1,
0.1795409, 0.8165332, -0.6751617, 0, 0.5450981, 1, 1,
0.1811775, -0.2167212, 3.015435, 0, 0.5372549, 1, 1,
0.1822416, 0.3831809, -0.1417009, 0, 0.5333334, 1, 1,
0.1826661, 0.7935162, -0.2815984, 0, 0.5254902, 1, 1,
0.1893202, -0.4496384, 2.727817, 0, 0.5215687, 1, 1,
0.1905048, -0.3314462, 1.232352, 0, 0.5137255, 1, 1,
0.1910842, 1.460663, 1.518585, 0, 0.509804, 1, 1,
0.1911516, 0.1843199, 1.890754, 0, 0.5019608, 1, 1,
0.1919024, -1.922596, 2.432296, 0, 0.4941176, 1, 1,
0.1965472, -1.083067, 2.157179, 0, 0.4901961, 1, 1,
0.1969499, 0.4218202, 0.1317023, 0, 0.4823529, 1, 1,
0.2017002, 0.8907393, -0.2530008, 0, 0.4784314, 1, 1,
0.2037846, 0.1214619, -0.2577031, 0, 0.4705882, 1, 1,
0.211678, -1.454236, 2.66954, 0, 0.4666667, 1, 1,
0.2132819, -0.1541729, 3.661094, 0, 0.4588235, 1, 1,
0.2141907, -0.8150892, 1.735744, 0, 0.454902, 1, 1,
0.2142087, -0.8182784, 2.962504, 0, 0.4470588, 1, 1,
0.2162393, 1.451571, 0.4097357, 0, 0.4431373, 1, 1,
0.2162823, 0.6729698, 0.2011755, 0, 0.4352941, 1, 1,
0.2164482, -1.529463, 2.315218, 0, 0.4313726, 1, 1,
0.2182014, 1.74134, -0.1489759, 0, 0.4235294, 1, 1,
0.2217273, 1.21403, -0.4836488, 0, 0.4196078, 1, 1,
0.2223003, 0.9542285, -0.161129, 0, 0.4117647, 1, 1,
0.2247041, 1.107539, -1.239927, 0, 0.4078431, 1, 1,
0.225942, -1.426688, 3.65333, 0, 0.4, 1, 1,
0.2338156, 1.293142, -0.7783078, 0, 0.3921569, 1, 1,
0.2381639, -0.1985008, 1.289727, 0, 0.3882353, 1, 1,
0.2386359, -1.914754, 2.485475, 0, 0.3803922, 1, 1,
0.2403478, -0.225747, 2.888306, 0, 0.3764706, 1, 1,
0.2406493, -0.6473783, 2.646046, 0, 0.3686275, 1, 1,
0.2424204, -0.3628377, 5.080022, 0, 0.3647059, 1, 1,
0.2435926, 1.12764, 0.447706, 0, 0.3568628, 1, 1,
0.2458077, 1.072319, -0.1840937, 0, 0.3529412, 1, 1,
0.246935, 1.674769, 0.4751371, 0, 0.345098, 1, 1,
0.2521532, 2.775626, -0.3222142, 0, 0.3411765, 1, 1,
0.2529449, 1.317512, 1.15709, 0, 0.3333333, 1, 1,
0.2555971, 0.07360221, 0.3913171, 0, 0.3294118, 1, 1,
0.2598654, -0.6391131, 3.312583, 0, 0.3215686, 1, 1,
0.261055, -1.007698, 2.155016, 0, 0.3176471, 1, 1,
0.263087, 0.6879225, 1.51088, 0, 0.3098039, 1, 1,
0.2655499, -0.4342412, 2.302112, 0, 0.3058824, 1, 1,
0.2660994, 0.4699019, 0.2876523, 0, 0.2980392, 1, 1,
0.270365, -0.7248058, 2.614253, 0, 0.2901961, 1, 1,
0.2732608, -1.64384, 3.257646, 0, 0.2862745, 1, 1,
0.2734588, -1.873041, 4.408385, 0, 0.2784314, 1, 1,
0.2769698, 0.4094635, 0.4702014, 0, 0.2745098, 1, 1,
0.2787979, 1.914138, -0.01490294, 0, 0.2666667, 1, 1,
0.2810669, -0.04526162, 2.220014, 0, 0.2627451, 1, 1,
0.2821009, 1.686862, 0.1175726, 0, 0.254902, 1, 1,
0.2856946, -0.9266694, 2.204714, 0, 0.2509804, 1, 1,
0.2892376, 0.4462563, -0.05602489, 0, 0.2431373, 1, 1,
0.2938875, 1.111905, 0.9058483, 0, 0.2392157, 1, 1,
0.3007012, 0.5678619, 1.251858, 0, 0.2313726, 1, 1,
0.3073656, 1.34274, 1.226645, 0, 0.227451, 1, 1,
0.3086727, 1.080979, -0.2129161, 0, 0.2196078, 1, 1,
0.3093939, -0.7457063, 3.27715, 0, 0.2156863, 1, 1,
0.309889, 0.2955142, 1.083956, 0, 0.2078431, 1, 1,
0.310355, 0.06818219, 1.060338, 0, 0.2039216, 1, 1,
0.3111273, -0.1001764, 0.6282518, 0, 0.1960784, 1, 1,
0.318784, -0.7305122, 1.367378, 0, 0.1882353, 1, 1,
0.3205282, 0.1457196, 2.506688, 0, 0.1843137, 1, 1,
0.3230878, 0.6071594, -0.02979585, 0, 0.1764706, 1, 1,
0.3233361, -0.2136032, 3.570819, 0, 0.172549, 1, 1,
0.3269113, 0.901387, -0.2297591, 0, 0.1647059, 1, 1,
0.3270397, -1.339092, 2.368563, 0, 0.1607843, 1, 1,
0.3287407, 1.07591, 0.4453233, 0, 0.1529412, 1, 1,
0.3290654, 0.6646137, 0.5391881, 0, 0.1490196, 1, 1,
0.3326961, 0.01370633, 0.6134141, 0, 0.1411765, 1, 1,
0.3359026, -1.496434, 4.045589, 0, 0.1372549, 1, 1,
0.3363372, -0.2680411, 2.332694, 0, 0.1294118, 1, 1,
0.3391536, -0.3104785, 2.510998, 0, 0.1254902, 1, 1,
0.3439497, 0.832794, 0.1209058, 0, 0.1176471, 1, 1,
0.3501347, 0.1255066, -0.1450155, 0, 0.1137255, 1, 1,
0.3533197, -0.4354115, 2.129583, 0, 0.1058824, 1, 1,
0.3557061, 0.5956486, -0.2056174, 0, 0.09803922, 1, 1,
0.3559071, -0.6732576, 4.381904, 0, 0.09411765, 1, 1,
0.3559176, -0.9188745, 3.826344, 0, 0.08627451, 1, 1,
0.3570548, 0.09736884, 2.182869, 0, 0.08235294, 1, 1,
0.3670379, -1.463328, 3.843568, 0, 0.07450981, 1, 1,
0.3744141, 0.7620346, 1.200069, 0, 0.07058824, 1, 1,
0.3763068, 1.217844, -0.3335281, 0, 0.0627451, 1, 1,
0.3792568, -0.1709332, 2.549479, 0, 0.05882353, 1, 1,
0.3823212, -0.6481988, 1.223667, 0, 0.05098039, 1, 1,
0.3878035, 0.9057906, 2.00028, 0, 0.04705882, 1, 1,
0.3911093, -1.597285, 4.348249, 0, 0.03921569, 1, 1,
0.3942439, -0.2255843, 1.046868, 0, 0.03529412, 1, 1,
0.3960035, 0.2526488, 0.02035558, 0, 0.02745098, 1, 1,
0.3969032, -2.883423, 5.181984, 0, 0.02352941, 1, 1,
0.3998559, -0.071846, 1.608169, 0, 0.01568628, 1, 1,
0.4037991, 0.3247511, -0.2220461, 0, 0.01176471, 1, 1,
0.4112813, -0.6557286, 2.169418, 0, 0.003921569, 1, 1,
0.4138251, 0.6220823, -0.8330888, 0.003921569, 0, 1, 1,
0.4221638, -1.368381, 1.735792, 0.007843138, 0, 1, 1,
0.4227143, 0.6470949, 0.5082172, 0.01568628, 0, 1, 1,
0.4231545, 0.09606733, 1.849413, 0.01960784, 0, 1, 1,
0.4253198, 1.622553, 1.464637, 0.02745098, 0, 1, 1,
0.4282686, -1.202769, 4.520258, 0.03137255, 0, 1, 1,
0.4283683, -1.138112, 3.325381, 0.03921569, 0, 1, 1,
0.4328727, -0.6153014, 4.475919, 0.04313726, 0, 1, 1,
0.4381954, -0.3688191, 2.98548, 0.05098039, 0, 1, 1,
0.4385671, 1.993043, 1.481309, 0.05490196, 0, 1, 1,
0.439296, -2.203856, 2.646207, 0.0627451, 0, 1, 1,
0.4398655, 0.2271255, 1.962587, 0.06666667, 0, 1, 1,
0.4409432, 0.6560545, 1.310671, 0.07450981, 0, 1, 1,
0.4419504, -0.08939586, 2.647395, 0.07843138, 0, 1, 1,
0.4442312, -0.8565996, 2.61819, 0.08627451, 0, 1, 1,
0.4490423, 0.9135539, 1.257352, 0.09019608, 0, 1, 1,
0.4494958, 0.4081866, 0.3123817, 0.09803922, 0, 1, 1,
0.4523048, 0.1293251, 1.836891, 0.1058824, 0, 1, 1,
0.4526315, 0.2681178, 1.056956, 0.1098039, 0, 1, 1,
0.4534194, 1.301654, 0.4402156, 0.1176471, 0, 1, 1,
0.458476, 0.5749072, -0.01178974, 0.1215686, 0, 1, 1,
0.4646968, -0.8956773, 2.601481, 0.1294118, 0, 1, 1,
0.4656633, 0.3094405, 0.8891268, 0.1333333, 0, 1, 1,
0.478354, -0.2109967, 1.490352, 0.1411765, 0, 1, 1,
0.4783683, -1.013419, 3.523863, 0.145098, 0, 1, 1,
0.4796888, -1.26993, 4.02177, 0.1529412, 0, 1, 1,
0.4834681, 0.5211206, -0.06022529, 0.1568628, 0, 1, 1,
0.4848024, 0.2845919, 2.238267, 0.1647059, 0, 1, 1,
0.4851521, -1.814439, 2.909025, 0.1686275, 0, 1, 1,
0.4887866, 1.149601, 0.192864, 0.1764706, 0, 1, 1,
0.4915746, -0.4809066, 2.475813, 0.1803922, 0, 1, 1,
0.4961627, -0.8226802, 2.135371, 0.1882353, 0, 1, 1,
0.5013005, 0.5038236, 3.237635, 0.1921569, 0, 1, 1,
0.5031088, -0.7929534, 4.250353, 0.2, 0, 1, 1,
0.5048588, 0.9451536, -0.1124314, 0.2078431, 0, 1, 1,
0.5053018, -0.8058288, 2.861055, 0.2117647, 0, 1, 1,
0.508301, 0.484336, -1.301963, 0.2196078, 0, 1, 1,
0.5110838, -0.02826967, 2.174942, 0.2235294, 0, 1, 1,
0.5193402, -0.6707429, 3.655207, 0.2313726, 0, 1, 1,
0.527308, -0.4632064, 2.553767, 0.2352941, 0, 1, 1,
0.538506, -0.3740746, 1.12951, 0.2431373, 0, 1, 1,
0.5401961, -0.8691554, 0.4315339, 0.2470588, 0, 1, 1,
0.5436262, 0.7926633, 2.223293, 0.254902, 0, 1, 1,
0.5543795, 1.54255, -0.1807163, 0.2588235, 0, 1, 1,
0.5587165, 0.0864301, 1.702644, 0.2666667, 0, 1, 1,
0.5595632, 2.343558, -0.5295765, 0.2705882, 0, 1, 1,
0.5606976, 0.09993118, 2.25868, 0.2784314, 0, 1, 1,
0.5663228, -0.3881697, 0.8067004, 0.282353, 0, 1, 1,
0.5675183, -1.508654, 4.35483, 0.2901961, 0, 1, 1,
0.572985, -0.2315982, 1.501636, 0.2941177, 0, 1, 1,
0.5740991, -0.3219579, 1.361493, 0.3019608, 0, 1, 1,
0.5762674, 1.227465, 0.09977762, 0.3098039, 0, 1, 1,
0.5769839, -1.040432, 4.620192, 0.3137255, 0, 1, 1,
0.5818378, 0.2343743, -1.111179, 0.3215686, 0, 1, 1,
0.5838291, 0.4814633, 0.2793026, 0.3254902, 0, 1, 1,
0.5854262, 0.2072507, 1.196951, 0.3333333, 0, 1, 1,
0.585694, 0.3112683, 1.081021, 0.3372549, 0, 1, 1,
0.5881464, 0.4922867, -0.5062813, 0.345098, 0, 1, 1,
0.5940759, 0.1679487, 1.566259, 0.3490196, 0, 1, 1,
0.5946516, -1.882193, 1.411427, 0.3568628, 0, 1, 1,
0.5957812, -0.01850842, 0.4834649, 0.3607843, 0, 1, 1,
0.6031908, 0.2470758, 1.624183, 0.3686275, 0, 1, 1,
0.605469, 1.124282, -0.4879316, 0.372549, 0, 1, 1,
0.6057522, 0.2457729, 0.7162492, 0.3803922, 0, 1, 1,
0.6128548, -1.506322, 2.764896, 0.3843137, 0, 1, 1,
0.6134548, -0.1997405, 0.6962821, 0.3921569, 0, 1, 1,
0.6134999, -0.3550206, 2.489563, 0.3960784, 0, 1, 1,
0.6159527, -1.210665, 2.590697, 0.4039216, 0, 1, 1,
0.6183257, -1.127117, 2.992804, 0.4117647, 0, 1, 1,
0.6200781, 1.287961, -1.044066, 0.4156863, 0, 1, 1,
0.6216691, 0.389423, -0.1235423, 0.4235294, 0, 1, 1,
0.6294426, -0.655693, 0.3547697, 0.427451, 0, 1, 1,
0.6359788, 1.65357, -0.2029372, 0.4352941, 0, 1, 1,
0.6361195, 0.8777736, -1.318453, 0.4392157, 0, 1, 1,
0.6398137, 0.3981928, -0.455272, 0.4470588, 0, 1, 1,
0.6443132, 0.8118745, 0.4720263, 0.4509804, 0, 1, 1,
0.644856, -0.4455239, 1.2991, 0.4588235, 0, 1, 1,
0.6471121, 0.5844117, -0.0308947, 0.4627451, 0, 1, 1,
0.6503572, 0.5507292, 0.7490398, 0.4705882, 0, 1, 1,
0.6504321, -0.6530094, 1.976057, 0.4745098, 0, 1, 1,
0.6522806, -0.9911665, 3.550393, 0.4823529, 0, 1, 1,
0.6552358, -0.3358804, 1.254671, 0.4862745, 0, 1, 1,
0.655834, -1.301103, 0.993461, 0.4941176, 0, 1, 1,
0.6600913, -0.9223738, 2.802237, 0.5019608, 0, 1, 1,
0.6656945, -0.3272333, 1.152867, 0.5058824, 0, 1, 1,
0.666425, 0.6245909, 0.03606267, 0.5137255, 0, 1, 1,
0.6668612, 0.4209584, 1.100061, 0.5176471, 0, 1, 1,
0.6713791, 0.2609738, 1.104373, 0.5254902, 0, 1, 1,
0.6729088, 0.4487117, 0.5157379, 0.5294118, 0, 1, 1,
0.6807017, 0.4349056, 0.688419, 0.5372549, 0, 1, 1,
0.6831142, 1.671043, -0.9546818, 0.5411765, 0, 1, 1,
0.683423, -0.7627397, 3.521868, 0.5490196, 0, 1, 1,
0.6839574, 0.5943976, -0.1395775, 0.5529412, 0, 1, 1,
0.6842557, -0.4124348, 1.857048, 0.5607843, 0, 1, 1,
0.6912894, -1.105765, 3.513847, 0.5647059, 0, 1, 1,
0.7056528, 0.0593157, 0.2036452, 0.572549, 0, 1, 1,
0.7077402, -0.4143005, 3.438505, 0.5764706, 0, 1, 1,
0.7077469, 2.122371, -0.5276825, 0.5843138, 0, 1, 1,
0.710587, -0.0114117, 1.902805, 0.5882353, 0, 1, 1,
0.7187377, -0.3168219, 0.5087841, 0.5960785, 0, 1, 1,
0.7235207, -0.835031, 1.722858, 0.6039216, 0, 1, 1,
0.7253082, 0.1252991, 2.676172, 0.6078432, 0, 1, 1,
0.7338169, 0.3999173, 0.3628882, 0.6156863, 0, 1, 1,
0.7357824, 1.006118, -0.8671599, 0.6196079, 0, 1, 1,
0.7358342, -0.7225788, 3.472235, 0.627451, 0, 1, 1,
0.7376627, -0.9675774, 2.676484, 0.6313726, 0, 1, 1,
0.7394274, -1.582952, 0.7722425, 0.6392157, 0, 1, 1,
0.7449918, -1.722072, 0.6662446, 0.6431373, 0, 1, 1,
0.7490883, -0.5328559, 0.9043378, 0.6509804, 0, 1, 1,
0.7560013, -0.7756927, 1.926852, 0.654902, 0, 1, 1,
0.7578577, 1.177997, 0.680274, 0.6627451, 0, 1, 1,
0.7630098, -1.732697, 1.762591, 0.6666667, 0, 1, 1,
0.7633629, 1.54232, 0.7614237, 0.6745098, 0, 1, 1,
0.7660961, 0.2101523, 1.682617, 0.6784314, 0, 1, 1,
0.7661487, -0.4149691, 1.57509, 0.6862745, 0, 1, 1,
0.7661839, -0.03119693, 2.441696, 0.6901961, 0, 1, 1,
0.7677149, -0.3323922, 0.6257362, 0.6980392, 0, 1, 1,
0.7691413, -1.137451, 3.048612, 0.7058824, 0, 1, 1,
0.7692505, -0.4145186, 2.713339, 0.7098039, 0, 1, 1,
0.7707129, 0.3973095, 1.599506, 0.7176471, 0, 1, 1,
0.7710543, 0.4493963, 3.437682, 0.7215686, 0, 1, 1,
0.7721716, 0.8970798, 0.3550337, 0.7294118, 0, 1, 1,
0.7789618, 1.325771, 1.347855, 0.7333333, 0, 1, 1,
0.7825464, -2.488413, 4.238359, 0.7411765, 0, 1, 1,
0.7834048, 0.5262469, 0.7664758, 0.7450981, 0, 1, 1,
0.78518, -1.060879, 2.295439, 0.7529412, 0, 1, 1,
0.7872503, 0.3358737, 3.072596, 0.7568628, 0, 1, 1,
0.7879912, 0.1377488, 1.517544, 0.7647059, 0, 1, 1,
0.7913901, 1.918832, -0.2436632, 0.7686275, 0, 1, 1,
0.7977766, 0.9872196, -0.1626189, 0.7764706, 0, 1, 1,
0.7996402, -0.67411, 1.46699, 0.7803922, 0, 1, 1,
0.805735, -2.257234, 4.622135, 0.7882353, 0, 1, 1,
0.80611, 1.538361, 0.107529, 0.7921569, 0, 1, 1,
0.8062984, 1.071648, 1.000204, 0.8, 0, 1, 1,
0.8105977, -1.527788, 2.275826, 0.8078431, 0, 1, 1,
0.8147603, 1.031893, 1.75712, 0.8117647, 0, 1, 1,
0.8195078, -0.8536691, 1.193872, 0.8196079, 0, 1, 1,
0.821447, -1.493829, 1.167459, 0.8235294, 0, 1, 1,
0.8276364, 1.064321, -0.1134629, 0.8313726, 0, 1, 1,
0.8290954, -0.03412379, 2.314267, 0.8352941, 0, 1, 1,
0.8339947, 0.3334446, 2.175216, 0.8431373, 0, 1, 1,
0.83455, 0.1650083, 2.968281, 0.8470588, 0, 1, 1,
0.8360466, -0.01730402, 1.95757, 0.854902, 0, 1, 1,
0.8440363, -0.7468246, 4.098622, 0.8588235, 0, 1, 1,
0.8496429, -0.1668146, 0.9647189, 0.8666667, 0, 1, 1,
0.8680264, 0.2684582, 1.412404, 0.8705882, 0, 1, 1,
0.8705469, -0.8415655, 3.763673, 0.8784314, 0, 1, 1,
0.873319, -0.6688925, 1.42958, 0.8823529, 0, 1, 1,
0.8882108, 0.01925219, 2.012008, 0.8901961, 0, 1, 1,
0.8953311, 1.713055, 1.367141, 0.8941177, 0, 1, 1,
0.8976952, 0.1914202, 1.221658, 0.9019608, 0, 1, 1,
0.899043, -0.5975381, 2.090615, 0.9098039, 0, 1, 1,
0.8991575, -0.8638791, 1.797089, 0.9137255, 0, 1, 1,
0.9074438, -0.7541824, 2.311329, 0.9215686, 0, 1, 1,
0.9130173, -0.7701414, 4.093915, 0.9254902, 0, 1, 1,
0.9133716, 0.6782299, -0.5370032, 0.9333333, 0, 1, 1,
0.920347, -1.734087, 2.407845, 0.9372549, 0, 1, 1,
0.9256237, -0.8191349, 0.7257604, 0.945098, 0, 1, 1,
0.9260671, 0.4742496, 1.036881, 0.9490196, 0, 1, 1,
0.9287109, 0.4699311, 0.2032581, 0.9568627, 0, 1, 1,
0.9316954, -0.07021728, 0.4843183, 0.9607843, 0, 1, 1,
0.9328332, -1.758268, 3.10561, 0.9686275, 0, 1, 1,
0.9345137, 0.9851236, 0.5418195, 0.972549, 0, 1, 1,
0.9372679, -1.163362, 2.651829, 0.9803922, 0, 1, 1,
0.937762, -0.9565903, 1.94466, 0.9843137, 0, 1, 1,
0.9440607, -1.738875, 4.339804, 0.9921569, 0, 1, 1,
0.9509602, 1.798715, 1.192245, 0.9960784, 0, 1, 1,
0.9553162, -0.2828924, 4.318324, 1, 0, 0.9960784, 1,
0.9556091, -0.2860787, 2.54256, 1, 0, 0.9882353, 1,
0.9587245, -1.553213, 2.458745, 1, 0, 0.9843137, 1,
0.9602309, -1.11587, 3.23772, 1, 0, 0.9764706, 1,
0.9614623, 1.49795, 0.2755179, 1, 0, 0.972549, 1,
0.9621103, -2.06831, 2.228652, 1, 0, 0.9647059, 1,
0.9635291, 0.9382578, 2.411573, 1, 0, 0.9607843, 1,
0.9645312, -0.7669033, 2.931146, 1, 0, 0.9529412, 1,
0.9665138, 0.1718362, 0.4605948, 1, 0, 0.9490196, 1,
0.9695154, 0.7120363, 0.7941347, 1, 0, 0.9411765, 1,
0.971567, 0.2106034, 1.12419, 1, 0, 0.9372549, 1,
0.9757082, 0.9920256, 0.2627887, 1, 0, 0.9294118, 1,
0.9814802, -0.6703765, 2.255925, 1, 0, 0.9254902, 1,
0.9846663, -0.1429476, 1.374252, 1, 0, 0.9176471, 1,
0.9916162, 0.821358, 2.798865, 1, 0, 0.9137255, 1,
0.9946197, 0.6946814, 2.211717, 1, 0, 0.9058824, 1,
0.9951952, 2.098662, 0.761642, 1, 0, 0.9019608, 1,
1.001401, 0.4259889, 0.6159105, 1, 0, 0.8941177, 1,
1.003548, 1.545156, 0.05959623, 1, 0, 0.8862745, 1,
1.010994, -0.6854114, 2.780073, 1, 0, 0.8823529, 1,
1.017748, 0.9441694, -0.6991594, 1, 0, 0.8745098, 1,
1.021004, -0.3313343, 0.6944026, 1, 0, 0.8705882, 1,
1.025055, 0.03486676, 1.338056, 1, 0, 0.8627451, 1,
1.025514, 0.2398883, 1.22419, 1, 0, 0.8588235, 1,
1.028593, -0.1936514, 1.816123, 1, 0, 0.8509804, 1,
1.030417, -0.4382858, 0.5187335, 1, 0, 0.8470588, 1,
1.031342, 0.671125, -0.6883978, 1, 0, 0.8392157, 1,
1.047431, -1.319489, 2.367194, 1, 0, 0.8352941, 1,
1.049612, 0.1402439, 2.089772, 1, 0, 0.827451, 1,
1.051622, 0.9783311, -0.2661648, 1, 0, 0.8235294, 1,
1.053942, 0.3663069, 1.867503, 1, 0, 0.8156863, 1,
1.067917, 0.126487, 1.840263, 1, 0, 0.8117647, 1,
1.07104, -0.1895975, 0.8068672, 1, 0, 0.8039216, 1,
1.080832, -0.09892772, 1.074265, 1, 0, 0.7960784, 1,
1.08433, -0.6096962, 0.5281397, 1, 0, 0.7921569, 1,
1.0982, -0.9722334, 1.378074, 1, 0, 0.7843137, 1,
1.10126, 0.2778991, 0.9171971, 1, 0, 0.7803922, 1,
1.109297, 0.1188758, 1.557219, 1, 0, 0.772549, 1,
1.11194, -0.7434302, 2.372108, 1, 0, 0.7686275, 1,
1.113298, 0.749948, 1.370895, 1, 0, 0.7607843, 1,
1.116694, -1.665612, 4.467953, 1, 0, 0.7568628, 1,
1.120006, -0.9448148, 1.681022, 1, 0, 0.7490196, 1,
1.123001, -2.337839, 0.9809461, 1, 0, 0.7450981, 1,
1.127058, -0.5083271, 1.392533, 1, 0, 0.7372549, 1,
1.130952, 1.75552, 0.4874201, 1, 0, 0.7333333, 1,
1.131005, 1.275398, -0.7939231, 1, 0, 0.7254902, 1,
1.13362, -0.001534676, 1.568138, 1, 0, 0.7215686, 1,
1.139773, 0.4495226, 2.563975, 1, 0, 0.7137255, 1,
1.1427, -0.1477237, 2.370182, 1, 0, 0.7098039, 1,
1.152196, -0.7389697, 1.452801, 1, 0, 0.7019608, 1,
1.15298, -0.1852593, 3.475545, 1, 0, 0.6941177, 1,
1.169327, 0.4131877, 1.634848, 1, 0, 0.6901961, 1,
1.182333, -0.6289829, 2.585595, 1, 0, 0.682353, 1,
1.191281, 1.170811, 1.655334, 1, 0, 0.6784314, 1,
1.198917, 0.7475395, 0.6481253, 1, 0, 0.6705883, 1,
1.211015, 0.9539359, 1.229209, 1, 0, 0.6666667, 1,
1.215699, 0.5589286, 0.9010046, 1, 0, 0.6588235, 1,
1.216338, 1.761875, 2.939756, 1, 0, 0.654902, 1,
1.228396, -0.635138, 2.080168, 1, 0, 0.6470588, 1,
1.229627, -2.510137, 2.437656, 1, 0, 0.6431373, 1,
1.23148, -0.564404, 1.17081, 1, 0, 0.6352941, 1,
1.232799, 0.7815792, 1.361775, 1, 0, 0.6313726, 1,
1.238006, 0.4255073, 1.420107, 1, 0, 0.6235294, 1,
1.238268, 2.273691, 1.330113, 1, 0, 0.6196079, 1,
1.238974, -0.8337396, 2.338488, 1, 0, 0.6117647, 1,
1.247173, 0.6622777, -0.7993429, 1, 0, 0.6078432, 1,
1.252686, 0.8859823, 1.183555, 1, 0, 0.6, 1,
1.25668, -0.2601609, 1.447674, 1, 0, 0.5921569, 1,
1.269174, -0.2934679, 1.418869, 1, 0, 0.5882353, 1,
1.276348, 1.394007, 2.859646, 1, 0, 0.5803922, 1,
1.277131, 1.468272, -0.4889961, 1, 0, 0.5764706, 1,
1.279081, -0.5062696, 2.837594, 1, 0, 0.5686275, 1,
1.280694, -1.188863, 3.486201, 1, 0, 0.5647059, 1,
1.284008, 1.008853, 0.2793112, 1, 0, 0.5568628, 1,
1.294613, -1.2515, 0.6142153, 1, 0, 0.5529412, 1,
1.294942, -0.1383369, 0.4425754, 1, 0, 0.5450981, 1,
1.296556, 0.5714161, 0.3172768, 1, 0, 0.5411765, 1,
1.300125, -1.185768, 2.556526, 1, 0, 0.5333334, 1,
1.312473, -0.1876401, 2.270569, 1, 0, 0.5294118, 1,
1.317663, -1.23755, 2.768896, 1, 0, 0.5215687, 1,
1.319268, -2.264954, 2.170641, 1, 0, 0.5176471, 1,
1.321799, -0.5278413, 1.779386, 1, 0, 0.509804, 1,
1.329745, -0.8580003, 1.783209, 1, 0, 0.5058824, 1,
1.331094, -0.5940027, 4.307767, 1, 0, 0.4980392, 1,
1.352317, -1.580735, 3.81481, 1, 0, 0.4901961, 1,
1.367858, -0.5539086, 2.074243, 1, 0, 0.4862745, 1,
1.383908, 0.3369075, 0.1912485, 1, 0, 0.4784314, 1,
1.385346, -0.3897797, 2.847886, 1, 0, 0.4745098, 1,
1.388529, 0.2649579, 0.6432665, 1, 0, 0.4666667, 1,
1.391867, -0.6030046, 2.180333, 1, 0, 0.4627451, 1,
1.394288, 0.6010436, 1.909264, 1, 0, 0.454902, 1,
1.39833, -0.1537221, 1.639567, 1, 0, 0.4509804, 1,
1.399398, -0.6394463, 0.5978304, 1, 0, 0.4431373, 1,
1.401855, 0.6853263, 1.37592, 1, 0, 0.4392157, 1,
1.406457, 0.9945158, 0.6257336, 1, 0, 0.4313726, 1,
1.417529, 1.104001, 0.5127242, 1, 0, 0.427451, 1,
1.421882, 0.4057618, -0.4384317, 1, 0, 0.4196078, 1,
1.424504, -1.46107, 1.495444, 1, 0, 0.4156863, 1,
1.429892, 0.4928333, 2.485277, 1, 0, 0.4078431, 1,
1.432742, 0.416481, 1.580789, 1, 0, 0.4039216, 1,
1.436596, 0.3988869, 3.15904, 1, 0, 0.3960784, 1,
1.466009, -1.871645, 2.08518, 1, 0, 0.3882353, 1,
1.48335, 0.3257257, 0.9572111, 1, 0, 0.3843137, 1,
1.487561, 0.05819042, 0.8960827, 1, 0, 0.3764706, 1,
1.491563, -1.536019, 1.428699, 1, 0, 0.372549, 1,
1.514453, 0.7519032, 0.2934484, 1, 0, 0.3647059, 1,
1.522946, 0.8735564, 0.4649363, 1, 0, 0.3607843, 1,
1.556913, -0.09485602, -1.748749, 1, 0, 0.3529412, 1,
1.559231, 0.8616468, 1.633658, 1, 0, 0.3490196, 1,
1.57098, 1.675356, 0.3634042, 1, 0, 0.3411765, 1,
1.57233, 0.2419052, 0.9936816, 1, 0, 0.3372549, 1,
1.572448, 0.1456851, 2.343314, 1, 0, 0.3294118, 1,
1.577464, 0.1171202, 0.8942246, 1, 0, 0.3254902, 1,
1.590371, 0.006882035, 3.208491, 1, 0, 0.3176471, 1,
1.600384, 0.1441159, 0.7638188, 1, 0, 0.3137255, 1,
1.601879, 0.9075197, 0.4318674, 1, 0, 0.3058824, 1,
1.61255, 0.5449782, -0.02743651, 1, 0, 0.2980392, 1,
1.61834, -0.8569496, 1.850008, 1, 0, 0.2941177, 1,
1.627933, 0.6020114, 0.4505656, 1, 0, 0.2862745, 1,
1.63894, 0.6199924, 1.360162, 1, 0, 0.282353, 1,
1.64448, -0.08121602, 1.755599, 1, 0, 0.2745098, 1,
1.646889, 0.6263819, 1.600733, 1, 0, 0.2705882, 1,
1.652138, 1.964958, -0.00496474, 1, 0, 0.2627451, 1,
1.663781, 0.7034904, 1.179429, 1, 0, 0.2588235, 1,
1.664521, -2.39241, 2.76837, 1, 0, 0.2509804, 1,
1.688798, -1.368861, 0.04865897, 1, 0, 0.2470588, 1,
1.690245, 0.1407575, 0.7043921, 1, 0, 0.2392157, 1,
1.704221, -0.9532415, 2.382034, 1, 0, 0.2352941, 1,
1.708889, 1.440745, -0.001920886, 1, 0, 0.227451, 1,
1.717089, -0.7568591, 1.665345, 1, 0, 0.2235294, 1,
1.723102, 1.219025, 0.7607034, 1, 0, 0.2156863, 1,
1.740999, 0.2539629, 2.382312, 1, 0, 0.2117647, 1,
1.750032, 0.2479393, 1.937501, 1, 0, 0.2039216, 1,
1.753338, -0.3863995, 2.871294, 1, 0, 0.1960784, 1,
1.764773, 0.3345014, 2.350489, 1, 0, 0.1921569, 1,
1.789202, -1.64911, 4.220184, 1, 0, 0.1843137, 1,
1.790651, -1.761751, 1.663303, 1, 0, 0.1803922, 1,
1.796695, 0.5772632, 2.341241, 1, 0, 0.172549, 1,
1.81684, -0.1382286, 1.921635, 1, 0, 0.1686275, 1,
1.82997, -0.8077081, 3.310004, 1, 0, 0.1607843, 1,
1.830475, 0.9129002, 1.055303, 1, 0, 0.1568628, 1,
1.846385, 0.03146907, 1.73187, 1, 0, 0.1490196, 1,
1.860511, 0.6368467, 2.705281, 1, 0, 0.145098, 1,
1.874547, -0.8846408, 1.759133, 1, 0, 0.1372549, 1,
1.897736, 1.134328, -0.5139477, 1, 0, 0.1333333, 1,
1.985149, 0.3574712, 0.1748573, 1, 0, 0.1254902, 1,
2.005683, -0.4978417, 1.349736, 1, 0, 0.1215686, 1,
2.034779, -0.1903692, 1.47796, 1, 0, 0.1137255, 1,
2.037616, -0.6020578, 2.401995, 1, 0, 0.1098039, 1,
2.054417, 0.6005677, 2.719824, 1, 0, 0.1019608, 1,
2.059688, -0.7482145, 1.250274, 1, 0, 0.09411765, 1,
2.118732, -1.067061, 2.422974, 1, 0, 0.09019608, 1,
2.120038, -1.909063, 2.145608, 1, 0, 0.08235294, 1,
2.125582, -0.1182804, 1.839579, 1, 0, 0.07843138, 1,
2.150221, 0.7682393, 1.597968, 1, 0, 0.07058824, 1,
2.160429, -1.958414, 2.367505, 1, 0, 0.06666667, 1,
2.31608, 0.7735056, 1.452934, 1, 0, 0.05882353, 1,
2.321375, 0.8547431, 0.07299425, 1, 0, 0.05490196, 1,
2.396894, -0.8232919, 2.432338, 1, 0, 0.04705882, 1,
2.400016, 0.7768276, 0.6526302, 1, 0, 0.04313726, 1,
2.499525, 0.0971543, 1.513747, 1, 0, 0.03529412, 1,
2.53372, -0.189836, 1.73113, 1, 0, 0.03137255, 1,
2.629475, -1.30744, 1.650941, 1, 0, 0.02352941, 1,
2.637186, 0.3845803, 0.8040062, 1, 0, 0.01960784, 1,
2.698638, 0.6776239, 0.3773898, 1, 0, 0.01176471, 1,
2.720341, 0.3186235, 1.009227, 1, 0, 0.007843138, 1
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
-0.4839885, -3.935575, -6.920843, 0, -0.5, 0.5, 0.5,
-0.4839885, -3.935575, -6.920843, 1, -0.5, 0.5, 0.5,
-0.4839885, -3.935575, -6.920843, 1, 1.5, 0.5, 0.5,
-0.4839885, -3.935575, -6.920843, 0, 1.5, 0.5, 0.5
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
-4.774586, 0.2202716, -6.920843, 0, -0.5, 0.5, 0.5,
-4.774586, 0.2202716, -6.920843, 1, -0.5, 0.5, 0.5,
-4.774586, 0.2202716, -6.920843, 1, 1.5, 0.5, 0.5,
-4.774586, 0.2202716, -6.920843, 0, 1.5, 0.5, 0.5
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
-4.774586, -3.935575, 0.007624865, 0, -0.5, 0.5, 0.5,
-4.774586, -3.935575, 0.007624865, 1, -0.5, 0.5, 0.5,
-4.774586, -3.935575, 0.007624865, 1, 1.5, 0.5, 0.5,
-4.774586, -3.935575, 0.007624865, 0, 1.5, 0.5, 0.5
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
-3, -2.976534, -5.321966,
2, -2.976534, -5.321966,
-3, -2.976534, -5.321966,
-3, -3.136374, -5.588445,
-2, -2.976534, -5.321966,
-2, -3.136374, -5.588445,
-1, -2.976534, -5.321966,
-1, -3.136374, -5.588445,
0, -2.976534, -5.321966,
0, -3.136374, -5.588445,
1, -2.976534, -5.321966,
1, -3.136374, -5.588445,
2, -2.976534, -5.321966,
2, -3.136374, -5.588445
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
-3, -3.456055, -6.121404, 0, -0.5, 0.5, 0.5,
-3, -3.456055, -6.121404, 1, -0.5, 0.5, 0.5,
-3, -3.456055, -6.121404, 1, 1.5, 0.5, 0.5,
-3, -3.456055, -6.121404, 0, 1.5, 0.5, 0.5,
-2, -3.456055, -6.121404, 0, -0.5, 0.5, 0.5,
-2, -3.456055, -6.121404, 1, -0.5, 0.5, 0.5,
-2, -3.456055, -6.121404, 1, 1.5, 0.5, 0.5,
-2, -3.456055, -6.121404, 0, 1.5, 0.5, 0.5,
-1, -3.456055, -6.121404, 0, -0.5, 0.5, 0.5,
-1, -3.456055, -6.121404, 1, -0.5, 0.5, 0.5,
-1, -3.456055, -6.121404, 1, 1.5, 0.5, 0.5,
-1, -3.456055, -6.121404, 0, 1.5, 0.5, 0.5,
0, -3.456055, -6.121404, 0, -0.5, 0.5, 0.5,
0, -3.456055, -6.121404, 1, -0.5, 0.5, 0.5,
0, -3.456055, -6.121404, 1, 1.5, 0.5, 0.5,
0, -3.456055, -6.121404, 0, 1.5, 0.5, 0.5,
1, -3.456055, -6.121404, 0, -0.5, 0.5, 0.5,
1, -3.456055, -6.121404, 1, -0.5, 0.5, 0.5,
1, -3.456055, -6.121404, 1, 1.5, 0.5, 0.5,
1, -3.456055, -6.121404, 0, 1.5, 0.5, 0.5,
2, -3.456055, -6.121404, 0, -0.5, 0.5, 0.5,
2, -3.456055, -6.121404, 1, -0.5, 0.5, 0.5,
2, -3.456055, -6.121404, 1, 1.5, 0.5, 0.5,
2, -3.456055, -6.121404, 0, 1.5, 0.5, 0.5
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
-3.784448, -2, -5.321966,
-3.784448, 3, -5.321966,
-3.784448, -2, -5.321966,
-3.949471, -2, -5.588445,
-3.784448, -1, -5.321966,
-3.949471, -1, -5.588445,
-3.784448, 0, -5.321966,
-3.949471, 0, -5.588445,
-3.784448, 1, -5.321966,
-3.949471, 1, -5.588445,
-3.784448, 2, -5.321966,
-3.949471, 2, -5.588445,
-3.784448, 3, -5.321966,
-3.949471, 3, -5.588445
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
-4.279517, -2, -6.121404, 0, -0.5, 0.5, 0.5,
-4.279517, -2, -6.121404, 1, -0.5, 0.5, 0.5,
-4.279517, -2, -6.121404, 1, 1.5, 0.5, 0.5,
-4.279517, -2, -6.121404, 0, 1.5, 0.5, 0.5,
-4.279517, -1, -6.121404, 0, -0.5, 0.5, 0.5,
-4.279517, -1, -6.121404, 1, -0.5, 0.5, 0.5,
-4.279517, -1, -6.121404, 1, 1.5, 0.5, 0.5,
-4.279517, -1, -6.121404, 0, 1.5, 0.5, 0.5,
-4.279517, 0, -6.121404, 0, -0.5, 0.5, 0.5,
-4.279517, 0, -6.121404, 1, -0.5, 0.5, 0.5,
-4.279517, 0, -6.121404, 1, 1.5, 0.5, 0.5,
-4.279517, 0, -6.121404, 0, 1.5, 0.5, 0.5,
-4.279517, 1, -6.121404, 0, -0.5, 0.5, 0.5,
-4.279517, 1, -6.121404, 1, -0.5, 0.5, 0.5,
-4.279517, 1, -6.121404, 1, 1.5, 0.5, 0.5,
-4.279517, 1, -6.121404, 0, 1.5, 0.5, 0.5,
-4.279517, 2, -6.121404, 0, -0.5, 0.5, 0.5,
-4.279517, 2, -6.121404, 1, -0.5, 0.5, 0.5,
-4.279517, 2, -6.121404, 1, 1.5, 0.5, 0.5,
-4.279517, 2, -6.121404, 0, 1.5, 0.5, 0.5,
-4.279517, 3, -6.121404, 0, -0.5, 0.5, 0.5,
-4.279517, 3, -6.121404, 1, -0.5, 0.5, 0.5,
-4.279517, 3, -6.121404, 1, 1.5, 0.5, 0.5,
-4.279517, 3, -6.121404, 0, 1.5, 0.5, 0.5
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
-3.784448, -2.976534, -4,
-3.784448, -2.976534, 4,
-3.784448, -2.976534, -4,
-3.949471, -3.136374, -4,
-3.784448, -2.976534, -2,
-3.949471, -3.136374, -2,
-3.784448, -2.976534, 0,
-3.949471, -3.136374, 0,
-3.784448, -2.976534, 2,
-3.949471, -3.136374, 2,
-3.784448, -2.976534, 4,
-3.949471, -3.136374, 4
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
-4.279517, -3.456055, -4, 0, -0.5, 0.5, 0.5,
-4.279517, -3.456055, -4, 1, -0.5, 0.5, 0.5,
-4.279517, -3.456055, -4, 1, 1.5, 0.5, 0.5,
-4.279517, -3.456055, -4, 0, 1.5, 0.5, 0.5,
-4.279517, -3.456055, -2, 0, -0.5, 0.5, 0.5,
-4.279517, -3.456055, -2, 1, -0.5, 0.5, 0.5,
-4.279517, -3.456055, -2, 1, 1.5, 0.5, 0.5,
-4.279517, -3.456055, -2, 0, 1.5, 0.5, 0.5,
-4.279517, -3.456055, 0, 0, -0.5, 0.5, 0.5,
-4.279517, -3.456055, 0, 1, -0.5, 0.5, 0.5,
-4.279517, -3.456055, 0, 1, 1.5, 0.5, 0.5,
-4.279517, -3.456055, 0, 0, 1.5, 0.5, 0.5,
-4.279517, -3.456055, 2, 0, -0.5, 0.5, 0.5,
-4.279517, -3.456055, 2, 1, -0.5, 0.5, 0.5,
-4.279517, -3.456055, 2, 1, 1.5, 0.5, 0.5,
-4.279517, -3.456055, 2, 0, 1.5, 0.5, 0.5,
-4.279517, -3.456055, 4, 0, -0.5, 0.5, 0.5,
-4.279517, -3.456055, 4, 1, -0.5, 0.5, 0.5,
-4.279517, -3.456055, 4, 1, 1.5, 0.5, 0.5,
-4.279517, -3.456055, 4, 0, 1.5, 0.5, 0.5
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
-3.784448, -2.976534, -5.321966,
-3.784448, 3.417077, -5.321966,
-3.784448, -2.976534, 5.337215,
-3.784448, 3.417077, 5.337215,
-3.784448, -2.976534, -5.321966,
-3.784448, -2.976534, 5.337215,
-3.784448, 3.417077, -5.321966,
-3.784448, 3.417077, 5.337215,
-3.784448, -2.976534, -5.321966,
2.816471, -2.976534, -5.321966,
-3.784448, -2.976534, 5.337215,
2.816471, -2.976534, 5.337215,
-3.784448, 3.417077, -5.321966,
2.816471, 3.417077, -5.321966,
-3.784448, 3.417077, 5.337215,
2.816471, 3.417077, 5.337215,
2.816471, -2.976534, -5.321966,
2.816471, 3.417077, -5.321966,
2.816471, -2.976534, 5.337215,
2.816471, 3.417077, 5.337215,
2.816471, -2.976534, -5.321966,
2.816471, -2.976534, 5.337215,
2.816471, 3.417077, -5.321966,
2.816471, 3.417077, 5.337215
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
var radius = 7.515073;
var distance = 33.43541;
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
mvMatrix.translate( 0.4839885, -0.2202716, -0.007624865 );
mvMatrix.scale( 1.230957, 1.270869, 0.7622954 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.43541);
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
quizalofop-ethyl<-read.table("quizalofop-ethyl.xyz")
```

```
## Error in read.table("quizalofop-ethyl.xyz"): no lines available in input
```

```r
x<-quizalofop-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
```

```r
y<-quizalofop-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
```

```r
z<-quizalofop-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'quizalofop' not found
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
-3.688318, -0.6856042, -2.963331, 0, 0, 1, 1, 1,
-3.373186, -1.523961, -2.400722, 1, 0, 0, 1, 1,
-3.247679, 0.2150403, -1.191823, 1, 0, 0, 1, 1,
-2.994004, 0.0709703, -1.607077, 1, 0, 0, 1, 1,
-2.891568, 1.06745, -1.435646, 1, 0, 0, 1, 1,
-2.800326, -1.390942, -1.675375, 1, 0, 0, 1, 1,
-2.736719, 0.5348328, -2.37502, 0, 0, 0, 1, 1,
-2.60122, -0.2127182, -1.198822, 0, 0, 0, 1, 1,
-2.578604, 0.6172246, 0.4740263, 0, 0, 0, 1, 1,
-2.577835, -0.6479707, -4.136301, 0, 0, 0, 1, 1,
-2.454517, -0.2849765, -1.26017, 0, 0, 0, 1, 1,
-2.348193, -0.2465684, -1.646853, 0, 0, 0, 1, 1,
-2.33714, -1.69876, -2.945785, 0, 0, 0, 1, 1,
-2.322661, -0.6344199, -1.394533, 1, 1, 1, 1, 1,
-2.279712, 0.07430852, -2.057268, 1, 1, 1, 1, 1,
-2.26869, -0.05813951, -0.7027394, 1, 1, 1, 1, 1,
-2.255184, -0.6814229, -2.158311, 1, 1, 1, 1, 1,
-2.208652, -1.509051, -4.107125, 1, 1, 1, 1, 1,
-2.189476, -0.3477989, -2.612265, 1, 1, 1, 1, 1,
-2.188302, -0.2975707, -1.513281, 1, 1, 1, 1, 1,
-2.171598, -0.1681596, -0.9871668, 1, 1, 1, 1, 1,
-2.128269, 0.5605972, -2.724935, 1, 1, 1, 1, 1,
-2.119874, -0.9213973, -0.2286448, 1, 1, 1, 1, 1,
-2.105429, 0.3174809, -0.9054531, 1, 1, 1, 1, 1,
-2.070587, 0.3684117, -2.720946, 1, 1, 1, 1, 1,
-2.052089, 1.763573, -1.512243, 1, 1, 1, 1, 1,
-2.033546, 0.9770837, -0.8333863, 1, 1, 1, 1, 1,
-2.033401, -0.5996777, -0.9763149, 1, 1, 1, 1, 1,
-1.988086, -2.304517, -3.007595, 0, 0, 1, 1, 1,
-1.954044, -1.852316, -2.503875, 1, 0, 0, 1, 1,
-1.898811, 0.9935285, -4.172976, 1, 0, 0, 1, 1,
-1.876671, -0.7426756, -2.05297, 1, 0, 0, 1, 1,
-1.873618, 1.776381, -0.1049888, 1, 0, 0, 1, 1,
-1.871449, 2.912438, -1.847839, 1, 0, 0, 1, 1,
-1.843671, -0.5271746, -2.231909, 0, 0, 0, 1, 1,
-1.830905, 0.5403504, -1.926686, 0, 0, 0, 1, 1,
-1.811446, 0.880805, -0.8117183, 0, 0, 0, 1, 1,
-1.803233, -1.905212, -0.5604378, 0, 0, 0, 1, 1,
-1.801713, 1.829389, -1.626855, 0, 0, 0, 1, 1,
-1.796151, -0.7025934, -0.8455662, 0, 0, 0, 1, 1,
-1.792395, -0.03600364, -3.372139, 0, 0, 0, 1, 1,
-1.778784, 0.143767, -0.8407318, 1, 1, 1, 1, 1,
-1.766908, 1.35692, -2.096889, 1, 1, 1, 1, 1,
-1.763734, -0.1700154, -2.38444, 1, 1, 1, 1, 1,
-1.755874, -1.706661, -2.277367, 1, 1, 1, 1, 1,
-1.727785, 0.5237744, -0.6626909, 1, 1, 1, 1, 1,
-1.71316, 0.2150244, -2.320135, 1, 1, 1, 1, 1,
-1.709687, 0.5961414, -2.411832, 1, 1, 1, 1, 1,
-1.697274, -2.768011, -2.214972, 1, 1, 1, 1, 1,
-1.688425, 1.41664, -1.912417, 1, 1, 1, 1, 1,
-1.678312, -0.08931289, -0.3513213, 1, 1, 1, 1, 1,
-1.677295, -0.03262505, -1.412972, 1, 1, 1, 1, 1,
-1.665383, 0.1443197, -0.5838963, 1, 1, 1, 1, 1,
-1.664575, -0.1856775, -1.311336, 1, 1, 1, 1, 1,
-1.636631, -1.119461, -3.976012, 1, 1, 1, 1, 1,
-1.6173, 0.4852945, -2.687181, 1, 1, 1, 1, 1,
-1.601338, -2.499871, -1.007056, 0, 0, 1, 1, 1,
-1.596447, 0.4402444, -2.020944, 1, 0, 0, 1, 1,
-1.580983, 0.6539965, -1.715352, 1, 0, 0, 1, 1,
-1.565807, -0.4144401, -2.798797, 1, 0, 0, 1, 1,
-1.546214, 0.09062996, -1.064436, 1, 0, 0, 1, 1,
-1.53431, -1.550991, -2.584068, 1, 0, 0, 1, 1,
-1.530457, -1.697082, -3.146508, 0, 0, 0, 1, 1,
-1.530247, 0.2625485, -1.453049, 0, 0, 0, 1, 1,
-1.511178, -0.1643783, -0.8576705, 0, 0, 0, 1, 1,
-1.483658, 1.357238, 1.230407, 0, 0, 0, 1, 1,
-1.470473, 0.286386, -0.07320695, 0, 0, 0, 1, 1,
-1.463494, -1.135151, -2.987728, 0, 0, 0, 1, 1,
-1.458237, 0.6347165, -1.710733, 0, 0, 0, 1, 1,
-1.448955, 1.703994, -0.6434158, 1, 1, 1, 1, 1,
-1.442036, 0.5775659, 0.3556217, 1, 1, 1, 1, 1,
-1.44157, 0.6493159, -1.324219, 1, 1, 1, 1, 1,
-1.430926, -0.5472527, -1.818452, 1, 1, 1, 1, 1,
-1.415711, 2.132264, 0.332228, 1, 1, 1, 1, 1,
-1.405564, 0.09526508, -0.4487205, 1, 1, 1, 1, 1,
-1.40436, 2.19756, -1.276179, 1, 1, 1, 1, 1,
-1.40274, 0.3607526, -0.4335201, 1, 1, 1, 1, 1,
-1.400397, -1.067788, -3.041004, 1, 1, 1, 1, 1,
-1.383724, 0.7683223, -0.8268346, 1, 1, 1, 1, 1,
-1.364312, -0.7169759, -2.453124, 1, 1, 1, 1, 1,
-1.357703, -0.3517218, -0.5755076, 1, 1, 1, 1, 1,
-1.357093, -0.4837731, 0.09926873, 1, 1, 1, 1, 1,
-1.357029, 1.203768, -0.9225495, 1, 1, 1, 1, 1,
-1.349547, 0.06386545, -2.391678, 1, 1, 1, 1, 1,
-1.338498, -1.08589, -4.195536, 0, 0, 1, 1, 1,
-1.327666, 1.257581, 0.5875873, 1, 0, 0, 1, 1,
-1.326686, 0.01272758, -2.530366, 1, 0, 0, 1, 1,
-1.326063, -1.155146, -1.090427, 1, 0, 0, 1, 1,
-1.319872, -0.1140891, -2.371419, 1, 0, 0, 1, 1,
-1.31247, 0.5891602, -2.289758, 1, 0, 0, 1, 1,
-1.311284, 0.7001313, -0.8069278, 0, 0, 0, 1, 1,
-1.305157, 0.5503746, -0.2474608, 0, 0, 0, 1, 1,
-1.298791, -0.2796201, -2.294263, 0, 0, 0, 1, 1,
-1.287775, -0.3624139, -1.478988, 0, 0, 0, 1, 1,
-1.278225, -1.498543, -0.9640478, 0, 0, 0, 1, 1,
-1.275953, -1.048242, -1.854388, 0, 0, 0, 1, 1,
-1.271889, 0.6704749, -1.444219, 0, 0, 0, 1, 1,
-1.257356, 0.9224945, -2.028577, 1, 1, 1, 1, 1,
-1.239125, -0.2154521, -2.970142, 1, 1, 1, 1, 1,
-1.237871, -0.78975, -4.414847, 1, 1, 1, 1, 1,
-1.236937, 0.002757859, -0.6343616, 1, 1, 1, 1, 1,
-1.22436, -0.3508054, -2.461244, 1, 1, 1, 1, 1,
-1.215673, 0.4724088, -2.649049, 1, 1, 1, 1, 1,
-1.213954, -0.4300316, -1.870831, 1, 1, 1, 1, 1,
-1.205464, 1.676396, 0.1350638, 1, 1, 1, 1, 1,
-1.202207, 0.8461226, -0.8273661, 1, 1, 1, 1, 1,
-1.200823, -0.4115714, -1.450537, 1, 1, 1, 1, 1,
-1.196484, -0.4383263, -1.652316, 1, 1, 1, 1, 1,
-1.196474, 1.628104, -1.765677, 1, 1, 1, 1, 1,
-1.192723, -0.9441832, -1.720993, 1, 1, 1, 1, 1,
-1.188093, 0.4566025, 0.7445775, 1, 1, 1, 1, 1,
-1.186908, -1.250565, -2.645275, 1, 1, 1, 1, 1,
-1.185129, 0.3707833, -1.841496, 0, 0, 1, 1, 1,
-1.183519, 0.06360779, -2.899433, 1, 0, 0, 1, 1,
-1.182473, 0.6166241, -1.399228, 1, 0, 0, 1, 1,
-1.179878, 0.813431, 0.1534698, 1, 0, 0, 1, 1,
-1.17569, 1.067882, 0.57393, 1, 0, 0, 1, 1,
-1.173132, 0.7957665, -0.4411789, 1, 0, 0, 1, 1,
-1.162005, 0.5927372, -1.833617, 0, 0, 0, 1, 1,
-1.156173, 0.2267414, -0.9674202, 0, 0, 0, 1, 1,
-1.154589, 0.3218043, -0.7042028, 0, 0, 0, 1, 1,
-1.151805, -0.9849273, -1.492513, 0, 0, 0, 1, 1,
-1.146302, -2.465062, -2.197369, 0, 0, 0, 1, 1,
-1.139994, 0.2865006, -0.1725656, 0, 0, 0, 1, 1,
-1.12898, -0.9230592, -0.6455986, 0, 0, 0, 1, 1,
-1.123331, -0.4211426, -2.050932, 1, 1, 1, 1, 1,
-1.121336, -0.1317799, -1.036283, 1, 1, 1, 1, 1,
-1.121319, 0.48387, -1.57718, 1, 1, 1, 1, 1,
-1.110541, -0.6805738, -3.08763, 1, 1, 1, 1, 1,
-1.107849, 1.350757, 1.018099, 1, 1, 1, 1, 1,
-1.096999, -1.27636, -1.771304, 1, 1, 1, 1, 1,
-1.094695, -1.123359, -3.478526, 1, 1, 1, 1, 1,
-1.094688, -1.423213, -3.054279, 1, 1, 1, 1, 1,
-1.085365, -0.6834447, -2.647486, 1, 1, 1, 1, 1,
-1.080539, -0.9815023, -0.999454, 1, 1, 1, 1, 1,
-1.075419, 0.8484322, -0.7913823, 1, 1, 1, 1, 1,
-1.071595, -0.2909807, 0.3854685, 1, 1, 1, 1, 1,
-1.064422, -0.6697088, -2.945827, 1, 1, 1, 1, 1,
-1.060731, -1.096558, -0.9674814, 1, 1, 1, 1, 1,
-1.060727, -0.02929997, -2.264896, 1, 1, 1, 1, 1,
-1.053655, -1.83175, -1.399757, 0, 0, 1, 1, 1,
-1.050581, 0.8119417, -1.571907, 1, 0, 0, 1, 1,
-1.048282, -0.619256, -0.7673077, 1, 0, 0, 1, 1,
-1.048223, 0.1493672, -1.806453, 1, 0, 0, 1, 1,
-1.043285, 0.4829278, -0.3729755, 1, 0, 0, 1, 1,
-1.030329, -0.9543308, -2.578257, 1, 0, 0, 1, 1,
-1.027487, -0.5282667, -1.500067, 0, 0, 0, 1, 1,
-1.019542, -0.06700908, -2.867338, 0, 0, 0, 1, 1,
-1.012185, 0.2530802, -0.8693172, 0, 0, 0, 1, 1,
-1.009706, -0.2999886, -0.9264394, 0, 0, 0, 1, 1,
-1.00959, 0.5985357, -1.811332, 0, 0, 0, 1, 1,
-1.008548, 0.2476549, -0.7783604, 0, 0, 0, 1, 1,
-1.006224, 0.07926773, -1.759946, 0, 0, 0, 1, 1,
-1.000937, -0.1207646, -2.963713, 1, 1, 1, 1, 1,
-0.997263, 0.7284841, -2.403813, 1, 1, 1, 1, 1,
-0.9958165, 1.25652, 1.001191, 1, 1, 1, 1, 1,
-0.9945168, 0.3785981, -1.163127, 1, 1, 1, 1, 1,
-0.9930478, 0.5110324, -1.949641, 1, 1, 1, 1, 1,
-0.992582, -0.585442, -3.012693, 1, 1, 1, 1, 1,
-0.9924095, -0.5010747, -1.112454, 1, 1, 1, 1, 1,
-0.9880888, 0.5911583, -0.2603025, 1, 1, 1, 1, 1,
-0.979261, -0.4815837, -1.398805, 1, 1, 1, 1, 1,
-0.9736884, 0.8528865, -0.4172086, 1, 1, 1, 1, 1,
-0.973141, 0.03405987, -0.6328247, 1, 1, 1, 1, 1,
-0.9673359, 1.117069, -1.476842, 1, 1, 1, 1, 1,
-0.9661964, 0.1076508, 0.005960078, 1, 1, 1, 1, 1,
-0.9644806, -0.6046871, -4.108135, 1, 1, 1, 1, 1,
-0.9599012, 0.07782818, -0.9173322, 1, 1, 1, 1, 1,
-0.9579126, -0.2819766, -1.874227, 0, 0, 1, 1, 1,
-0.9488966, -1.567195, -2.484079, 1, 0, 0, 1, 1,
-0.9479891, -0.5133145, -2.511555, 1, 0, 0, 1, 1,
-0.9442222, 0.6060846, -1.297694, 1, 0, 0, 1, 1,
-0.9387618, 0.4224743, -1.360649, 1, 0, 0, 1, 1,
-0.9324685, -0.5173705, -3.324592, 1, 0, 0, 1, 1,
-0.9322721, -0.1370203, -2.904541, 0, 0, 0, 1, 1,
-0.9295247, -0.01855863, -0.9250587, 0, 0, 0, 1, 1,
-0.9279062, 1.695741, -1.8687, 0, 0, 0, 1, 1,
-0.9246247, -0.1766967, -2.465328, 0, 0, 0, 1, 1,
-0.9227002, 0.2856966, -0.75147, 0, 0, 0, 1, 1,
-0.9200623, 0.148992, -1.852677, 0, 0, 0, 1, 1,
-0.9183706, 1.61713, -0.9013892, 0, 0, 0, 1, 1,
-0.9105894, -1.009997, -2.298493, 1, 1, 1, 1, 1,
-0.9101589, -0.2457104, -1.606896, 1, 1, 1, 1, 1,
-0.9089996, 0.2085436, -1.996187, 1, 1, 1, 1, 1,
-0.9015869, -0.9444786, -3.571553, 1, 1, 1, 1, 1,
-0.8973488, -1.12019, -1.572365, 1, 1, 1, 1, 1,
-0.8896379, -0.1812643, -2.395815, 1, 1, 1, 1, 1,
-0.8776495, 0.9486982, -0.5108172, 1, 1, 1, 1, 1,
-0.8714468, -0.6232474, -1.38134, 1, 1, 1, 1, 1,
-0.8677789, -0.6215428, -1.085918, 1, 1, 1, 1, 1,
-0.8644433, 0.5591815, -1.967649, 1, 1, 1, 1, 1,
-0.863444, -1.6271, -3.01529, 1, 1, 1, 1, 1,
-0.8592285, -0.9420513, -1.698597, 1, 1, 1, 1, 1,
-0.8510358, -0.5718808, -2.093409, 1, 1, 1, 1, 1,
-0.8499972, -0.01213982, -2.240708, 1, 1, 1, 1, 1,
-0.8471797, -1.00272, -1.687135, 1, 1, 1, 1, 1,
-0.846193, 1.222987, 1.530354, 0, 0, 1, 1, 1,
-0.8422599, -1.417174, -2.477328, 1, 0, 0, 1, 1,
-0.8389408, -0.1387609, 0.08416636, 1, 0, 0, 1, 1,
-0.8322117, 0.6784425, -2.358832, 1, 0, 0, 1, 1,
-0.8317833, -0.5240183, -3.55518, 1, 0, 0, 1, 1,
-0.8303946, 0.1082773, -1.326616, 1, 0, 0, 1, 1,
-0.8274733, -0.3292023, -1.649747, 0, 0, 0, 1, 1,
-0.8221421, -0.02243021, -1.188782, 0, 0, 0, 1, 1,
-0.8185686, -1.773496, -2.489489, 0, 0, 0, 1, 1,
-0.8167241, -0.4258822, -2.045206, 0, 0, 0, 1, 1,
-0.8140576, 0.3401321, 0.108477, 0, 0, 0, 1, 1,
-0.8104246, 1.320158, -3.37905, 0, 0, 0, 1, 1,
-0.8074073, 0.5972724, -2.039996, 0, 0, 0, 1, 1,
-0.8003051, -0.5441223, -2.315798, 1, 1, 1, 1, 1,
-0.7993523, -1.559242, -1.270016, 1, 1, 1, 1, 1,
-0.7915242, 0.7302092, -0.05646061, 1, 1, 1, 1, 1,
-0.7910568, -0.3992462, -1.654482, 1, 1, 1, 1, 1,
-0.7899709, -0.3221721, -1.517116, 1, 1, 1, 1, 1,
-0.78993, 1.004127, -0.9695635, 1, 1, 1, 1, 1,
-0.7848585, -0.7073997, -0.6644301, 1, 1, 1, 1, 1,
-0.7827364, -0.293218, -2.698377, 1, 1, 1, 1, 1,
-0.7695826, -0.2101399, -2.289266, 1, 1, 1, 1, 1,
-0.7624009, 0.4242117, -2.242397, 1, 1, 1, 1, 1,
-0.7617744, 0.1755163, -2.677196, 1, 1, 1, 1, 1,
-0.757952, -1.36314, -3.581474, 1, 1, 1, 1, 1,
-0.751626, 1.13393, -1.397069, 1, 1, 1, 1, 1,
-0.7508968, 0.2658854, -3.542351, 1, 1, 1, 1, 1,
-0.7455233, 1.346211, 0.3873897, 1, 1, 1, 1, 1,
-0.7442036, 0.9241393, -1.352827, 0, 0, 1, 1, 1,
-0.738507, -0.737012, -2.570661, 1, 0, 0, 1, 1,
-0.7322658, 0.4748802, -0.3032846, 1, 0, 0, 1, 1,
-0.7315191, -2.090885, -3.018966, 1, 0, 0, 1, 1,
-0.7257853, -1.181345, -1.99481, 1, 0, 0, 1, 1,
-0.7255768, -0.8358096, -1.234767, 1, 0, 0, 1, 1,
-0.7210947, 0.111488, -0.1913761, 0, 0, 0, 1, 1,
-0.7145899, 0.9143523, 0.853227, 0, 0, 0, 1, 1,
-0.7142926, -0.1013279, -2.535683, 0, 0, 0, 1, 1,
-0.7135001, -0.2066325, -2.733582, 0, 0, 0, 1, 1,
-0.7120283, -0.1240817, -2.339363, 0, 0, 0, 1, 1,
-0.7093529, 1.084156, 0.7536364, 0, 0, 0, 1, 1,
-0.7067545, -1.785774, -2.641714, 0, 0, 0, 1, 1,
-0.7061671, -0.1069574, -2.981692, 1, 1, 1, 1, 1,
-0.7051325, 0.2131969, -0.8513696, 1, 1, 1, 1, 1,
-0.7032891, 0.7770401, 0.6640016, 1, 1, 1, 1, 1,
-0.7010401, 0.9849896, 0.3777188, 1, 1, 1, 1, 1,
-0.6961257, -1.398834, -4.285907, 1, 1, 1, 1, 1,
-0.6938362, 1.249007, -0.7749492, 1, 1, 1, 1, 1,
-0.6929948, 0.2272225, -1.168226, 1, 1, 1, 1, 1,
-0.6929519, 1.524158, 0.4390683, 1, 1, 1, 1, 1,
-0.690956, -0.2133402, -3.010276, 1, 1, 1, 1, 1,
-0.6894156, -2.332142, -3.212867, 1, 1, 1, 1, 1,
-0.6889378, 1.331136, -0.317286, 1, 1, 1, 1, 1,
-0.6843383, -0.126676, -0.8553687, 1, 1, 1, 1, 1,
-0.6834585, 0.2968968, -1.168321, 1, 1, 1, 1, 1,
-0.6824991, -0.01800389, -1.911917, 1, 1, 1, 1, 1,
-0.6794133, -0.4653229, -1.592847, 1, 1, 1, 1, 1,
-0.6792939, -2.050506, -1.732078, 0, 0, 1, 1, 1,
-0.6714628, 0.4138188, -1.499007, 1, 0, 0, 1, 1,
-0.6698697, 0.6502212, -0.5390425, 1, 0, 0, 1, 1,
-0.6678494, 0.1558684, -3.251521, 1, 0, 0, 1, 1,
-0.6667111, 0.6105552, -2.215174, 1, 0, 0, 1, 1,
-0.6650184, 0.4140876, -1.09168, 1, 0, 0, 1, 1,
-0.6577364, 0.1338442, -0.4310633, 0, 0, 0, 1, 1,
-0.652629, -0.01616826, -2.404147, 0, 0, 0, 1, 1,
-0.6516512, -1.168079, -2.169394, 0, 0, 0, 1, 1,
-0.6498502, 0.1738184, -1.921168, 0, 0, 0, 1, 1,
-0.6489454, -0.7047424, -3.228099, 0, 0, 0, 1, 1,
-0.6483639, -0.3312507, -4.983319, 0, 0, 0, 1, 1,
-0.6471508, 0.5125688, -0.2886232, 0, 0, 0, 1, 1,
-0.6448526, -0.09935592, -3.476878, 1, 1, 1, 1, 1,
-0.6446754, 0.1154093, -0.4718436, 1, 1, 1, 1, 1,
-0.6435887, 1.186817, -1.432647, 1, 1, 1, 1, 1,
-0.6425094, -0.6777133, -1.481507, 1, 1, 1, 1, 1,
-0.6406138, -1.56715, -2.294116, 1, 1, 1, 1, 1,
-0.6389988, 1.116647, 0.6715984, 1, 1, 1, 1, 1,
-0.636888, -2.252884, -1.992543, 1, 1, 1, 1, 1,
-0.6365427, -0.1152133, -2.206945, 1, 1, 1, 1, 1,
-0.6323043, 0.2466982, -1.652452, 1, 1, 1, 1, 1,
-0.6302199, 0.1463227, -0.2108355, 1, 1, 1, 1, 1,
-0.6279551, 1.364588, -1.091818, 1, 1, 1, 1, 1,
-0.6250224, 0.4305366, 0.9389917, 1, 1, 1, 1, 1,
-0.6198085, 1.2168, -0.1089078, 1, 1, 1, 1, 1,
-0.6188465, -1.078041, -4.104292, 1, 1, 1, 1, 1,
-0.6172795, 0.7534786, 0.780984, 1, 1, 1, 1, 1,
-0.613145, -0.3898464, -3.05584, 0, 0, 1, 1, 1,
-0.6119274, -0.4824584, -3.378462, 1, 0, 0, 1, 1,
-0.6063859, -0.387152, -1.724451, 1, 0, 0, 1, 1,
-0.6038851, 1.451478, -2.382913, 1, 0, 0, 1, 1,
-0.6028776, 0.08367876, -2.11375, 1, 0, 0, 1, 1,
-0.5989384, 0.1412118, -0.9853626, 1, 0, 0, 1, 1,
-0.5981658, 0.9116274, -1.799676, 0, 0, 0, 1, 1,
-0.5961183, 0.03724588, -3.635942, 0, 0, 0, 1, 1,
-0.5951519, 0.005885678, -1.939121, 0, 0, 0, 1, 1,
-0.5904947, 1.24637, 0.5428358, 0, 0, 0, 1, 1,
-0.5853118, -0.8459282, -2.110159, 0, 0, 0, 1, 1,
-0.582832, 0.9643744, 0.7159896, 0, 0, 0, 1, 1,
-0.5710537, 0.4306898, -0.6568422, 0, 0, 0, 1, 1,
-0.570732, 0.2618236, -4.162269, 1, 1, 1, 1, 1,
-0.5649526, 0.6230443, -0.366243, 1, 1, 1, 1, 1,
-0.5594643, -1.244808, -3.18697, 1, 1, 1, 1, 1,
-0.5493827, -0.9654683, -2.494065, 1, 1, 1, 1, 1,
-0.5459547, -0.430401, -2.659841, 1, 1, 1, 1, 1,
-0.545357, -1.647084, -2.837249, 1, 1, 1, 1, 1,
-0.5450766, -1.024306, -3.031751, 1, 1, 1, 1, 1,
-0.544697, 0.3920073, -2.383039, 1, 1, 1, 1, 1,
-0.5438969, 1.016077, 1.913818, 1, 1, 1, 1, 1,
-0.5412273, -0.6030303, -2.846315, 1, 1, 1, 1, 1,
-0.5407733, 1.681532, 1.183253, 1, 1, 1, 1, 1,
-0.5381588, -0.4181473, -1.732732, 1, 1, 1, 1, 1,
-0.5324917, 0.098866, 0.4754486, 1, 1, 1, 1, 1,
-0.5291849, -0.6562937, -1.516262, 1, 1, 1, 1, 1,
-0.5282305, -0.4294783, -2.00651, 1, 1, 1, 1, 1,
-0.5230659, 0.2097522, -1.689308, 0, 0, 1, 1, 1,
-0.5229881, -0.1206016, -3.05612, 1, 0, 0, 1, 1,
-0.5188467, -0.1151563, -2.332679, 1, 0, 0, 1, 1,
-0.5184813, 1.191041, 1.260266, 1, 0, 0, 1, 1,
-0.5173315, 0.2625006, 0.1108237, 1, 0, 0, 1, 1,
-0.5125966, -0.4500231, -3.048398, 1, 0, 0, 1, 1,
-0.503505, -1.133588, -1.833008, 0, 0, 0, 1, 1,
-0.501999, -2.461319, -2.435236, 0, 0, 0, 1, 1,
-0.493427, -0.2404204, -4.452744, 0, 0, 0, 1, 1,
-0.4924226, 1.756143, -0.01651484, 0, 0, 0, 1, 1,
-0.4862852, -0.9393689, -1.435564, 0, 0, 0, 1, 1,
-0.4856074, 0.5862448, -0.7692379, 0, 0, 0, 1, 1,
-0.4841944, -0.6176415, -3.049674, 0, 0, 0, 1, 1,
-0.4836569, 0.4119847, -0.8430545, 1, 1, 1, 1, 1,
-0.4808167, 0.08571903, -0.7488053, 1, 1, 1, 1, 1,
-0.4769288, -0.1270756, -2.774269, 1, 1, 1, 1, 1,
-0.4743612, 0.9781422, -1.841391, 1, 1, 1, 1, 1,
-0.4668944, -0.1622355, -2.269365, 1, 1, 1, 1, 1,
-0.4629487, 0.09788836, -2.128482, 1, 1, 1, 1, 1,
-0.4601519, -0.9516378, -2.905182, 1, 1, 1, 1, 1,
-0.4599563, 0.1605117, -1.742768, 1, 1, 1, 1, 1,
-0.4589729, -0.08810442, -1.828724, 1, 1, 1, 1, 1,
-0.4559729, -0.5775692, -3.027281, 1, 1, 1, 1, 1,
-0.4484882, 0.6153828, -0.4543705, 1, 1, 1, 1, 1,
-0.4454405, 1.175681, 0.3149715, 1, 1, 1, 1, 1,
-0.4454215, 1.317249, -0.6935025, 1, 1, 1, 1, 1,
-0.4410634, -0.7945636, -1.54718, 1, 1, 1, 1, 1,
-0.4384522, 0.8675219, -1.043241, 1, 1, 1, 1, 1,
-0.4375956, -1.332377, -2.533, 0, 0, 1, 1, 1,
-0.429957, 0.04774325, -0.7053578, 1, 0, 0, 1, 1,
-0.4256317, -0.2233016, -2.352239, 1, 0, 0, 1, 1,
-0.4250227, 0.4948469, -0.3695848, 1, 0, 0, 1, 1,
-0.4189349, 0.7096906, -1.055285, 1, 0, 0, 1, 1,
-0.4171714, -0.1273147, -0.8251707, 1, 0, 0, 1, 1,
-0.4124303, 2.13954, 0.193949, 0, 0, 0, 1, 1,
-0.4036928, 0.9818887, 0.253969, 0, 0, 0, 1, 1,
-0.4017769, -0.4981605, -2.656991, 0, 0, 0, 1, 1,
-0.3970117, -0.9464281, -3.112822, 0, 0, 0, 1, 1,
-0.3936259, 0.5724919, 0.2946019, 0, 0, 0, 1, 1,
-0.3926763, 0.4027789, 1.632084, 0, 0, 0, 1, 1,
-0.3917435, -0.2538765, -1.177169, 0, 0, 0, 1, 1,
-0.391001, -1.603655, -4.032133, 1, 1, 1, 1, 1,
-0.3896033, 0.8854002, 1.746567, 1, 1, 1, 1, 1,
-0.383556, 1.179659, -0.3722833, 1, 1, 1, 1, 1,
-0.3819939, -0.05247939, -0.8048115, 1, 1, 1, 1, 1,
-0.3777285, -0.7139519, -1.421527, 1, 1, 1, 1, 1,
-0.3742426, -1.541724, -4.14219, 1, 1, 1, 1, 1,
-0.3717437, 0.1001565, -1.950301, 1, 1, 1, 1, 1,
-0.371079, 0.505887, -0.7598311, 1, 1, 1, 1, 1,
-0.368042, 0.774084, -0.236702, 1, 1, 1, 1, 1,
-0.3607084, -0.9018424, -2.77608, 1, 1, 1, 1, 1,
-0.3573363, 0.1974344, -1.180039, 1, 1, 1, 1, 1,
-0.3551674, 0.4077324, -0.2208021, 1, 1, 1, 1, 1,
-0.3513106, 0.4620115, 0.06165998, 1, 1, 1, 1, 1,
-0.3483333, 0.2246078, -1.516848, 1, 1, 1, 1, 1,
-0.3459482, -1.931105, -2.046706, 1, 1, 1, 1, 1,
-0.3459167, 1.486095, 0.6068876, 0, 0, 1, 1, 1,
-0.3452793, 0.9198661, 0.7592962, 1, 0, 0, 1, 1,
-0.3384975, 0.2848613, -1.02105, 1, 0, 0, 1, 1,
-0.3330494, 1.267217, 1.300318, 1, 0, 0, 1, 1,
-0.3299759, -0.829089, -4.791578, 1, 0, 0, 1, 1,
-0.3298535, -0.518535, -1.453893, 1, 0, 0, 1, 1,
-0.3295431, 0.4289955, -0.8652658, 0, 0, 0, 1, 1,
-0.3215344, -0.2361724, -3.231354, 0, 0, 0, 1, 1,
-0.3208798, -1.085725, -3.393008, 0, 0, 0, 1, 1,
-0.3199481, -1.218826, -2.096859, 0, 0, 0, 1, 1,
-0.3194437, 1.163251, 0.975087, 0, 0, 0, 1, 1,
-0.3192825, -0.1298915, -2.881216, 0, 0, 0, 1, 1,
-0.3192018, 0.4798229, -2.454976, 0, 0, 0, 1, 1,
-0.3162002, 0.8931752, -1.308267, 1, 1, 1, 1, 1,
-0.3089603, 1.947907, -2.200093, 1, 1, 1, 1, 1,
-0.301991, -0.8875359, -2.170206, 1, 1, 1, 1, 1,
-0.3017647, -1.614311, -3.480011, 1, 1, 1, 1, 1,
-0.2971012, 0.9154072, -0.3899127, 1, 1, 1, 1, 1,
-0.294154, -1.131768, -2.321461, 1, 1, 1, 1, 1,
-0.2891166, 0.3680307, -1.333316, 1, 1, 1, 1, 1,
-0.2884558, -0.1175126, -2.676619, 1, 1, 1, 1, 1,
-0.2883206, 1.626762, 0.4930388, 1, 1, 1, 1, 1,
-0.2813439, -0.02009321, -0.2989691, 1, 1, 1, 1, 1,
-0.2752913, 1.793956, -2.811198, 1, 1, 1, 1, 1,
-0.274214, 0.1265978, -0.5755495, 1, 1, 1, 1, 1,
-0.2737221, 0.03701478, -1.983286, 1, 1, 1, 1, 1,
-0.2709481, -0.2763541, -2.519192, 1, 1, 1, 1, 1,
-0.2625938, -1.520572, -2.678652, 1, 1, 1, 1, 1,
-0.2621598, 0.4460707, -0.192352, 0, 0, 1, 1, 1,
-0.2611359, -1.44357, -3.775389, 1, 0, 0, 1, 1,
-0.2571679, -0.4131509, -2.989766, 1, 0, 0, 1, 1,
-0.2486101, -0.4977475, -1.1167, 1, 0, 0, 1, 1,
-0.2460672, -0.001355411, -0.1480049, 1, 0, 0, 1, 1,
-0.2448318, -0.1610783, -2.143731, 1, 0, 0, 1, 1,
-0.2429376, -0.526628, -2.529414, 0, 0, 0, 1, 1,
-0.2425453, -2.113736, -2.892494, 0, 0, 0, 1, 1,
-0.2400705, -0.1095396, -0.2302281, 0, 0, 0, 1, 1,
-0.2380184, -0.5964252, -1.930336, 0, 0, 0, 1, 1,
-0.2298341, -0.0714841, -2.609883, 0, 0, 0, 1, 1,
-0.221005, -0.7128182, -1.866221, 0, 0, 0, 1, 1,
-0.2195431, 0.5529632, 0.08548929, 0, 0, 0, 1, 1,
-0.2191161, -0.117257, -2.132538, 1, 1, 1, 1, 1,
-0.2187037, 1.717366, -0.4502918, 1, 1, 1, 1, 1,
-0.2184642, -0.8662885, -1.977707, 1, 1, 1, 1, 1,
-0.2151954, -1.616681, -3.363572, 1, 1, 1, 1, 1,
-0.2123834, -1.118978, -1.878186, 1, 1, 1, 1, 1,
-0.209341, -0.8606349, -3.508793, 1, 1, 1, 1, 1,
-0.2087585, 0.6759704, 2.21302, 1, 1, 1, 1, 1,
-0.2072656, 1.642266, 0.8784638, 1, 1, 1, 1, 1,
-0.1968325, 0.1227198, -1.119618, 1, 1, 1, 1, 1,
-0.1965932, 2.15626, -1.04757, 1, 1, 1, 1, 1,
-0.1955724, -0.06716458, -1.861104, 1, 1, 1, 1, 1,
-0.1899958, 1.224304, -1.192071, 1, 1, 1, 1, 1,
-0.1879611, 0.3944984, -2.369081, 1, 1, 1, 1, 1,
-0.1864122, 1.594175, 0.6299027, 1, 1, 1, 1, 1,
-0.1822357, 0.8911912, -1.251963, 1, 1, 1, 1, 1,
-0.1812832, 0.5129634, -2.052866, 0, 0, 1, 1, 1,
-0.1762849, -0.009043664, 0.4068868, 1, 0, 0, 1, 1,
-0.1736915, -0.5829827, -1.360717, 1, 0, 0, 1, 1,
-0.1706853, -0.1154456, -0.8997175, 1, 0, 0, 1, 1,
-0.1697201, 1.488801, 0.5417881, 1, 0, 0, 1, 1,
-0.1634831, -0.08665998, -0.8098572, 1, 0, 0, 1, 1,
-0.1622576, 0.6372815, -0.5691072, 0, 0, 0, 1, 1,
-0.1537739, -0.02587049, -1.106544, 0, 0, 0, 1, 1,
-0.1525109, 0.591285, -0.04334502, 0, 0, 0, 1, 1,
-0.1485326, 0.6295888, -1.238377, 0, 0, 0, 1, 1,
-0.1415629, -0.3805225, -2.671725, 0, 0, 0, 1, 1,
-0.1406793, 0.9033154, -0.7714808, 0, 0, 0, 1, 1,
-0.138916, -0.1859284, -3.073164, 0, 0, 0, 1, 1,
-0.1376525, 1.027685, 0.4614998, 1, 1, 1, 1, 1,
-0.1367215, -1.019576, -4.318421, 1, 1, 1, 1, 1,
-0.136559, -0.638888, -1.760968, 1, 1, 1, 1, 1,
-0.1353341, -1.280333, -2.688623, 1, 1, 1, 1, 1,
-0.1334907, -0.2819054, -3.252842, 1, 1, 1, 1, 1,
-0.1312709, -0.9280605, -3.258839, 1, 1, 1, 1, 1,
-0.1287436, -0.257564, -2.171981, 1, 1, 1, 1, 1,
-0.127597, 0.7415501, 0.1730041, 1, 1, 1, 1, 1,
-0.1272212, -0.01827995, -3.655015, 1, 1, 1, 1, 1,
-0.126895, -2.133158, -4.398518, 1, 1, 1, 1, 1,
-0.1243356, 0.02217983, -1.639708, 1, 1, 1, 1, 1,
-0.1222723, -1.141981, -2.686166, 1, 1, 1, 1, 1,
-0.1194804, -1.545167, -5.166735, 1, 1, 1, 1, 1,
-0.1191688, -0.07840122, -1.455164, 1, 1, 1, 1, 1,
-0.1156621, -0.2255885, -1.540592, 1, 1, 1, 1, 1,
-0.1136076, -1.906925, -3.742348, 0, 0, 1, 1, 1,
-0.1121377, -0.4913667, -2.210305, 1, 0, 0, 1, 1,
-0.1081542, 0.2488678, 0.3630179, 1, 0, 0, 1, 1,
-0.1068198, -1.244027, -3.324266, 1, 0, 0, 1, 1,
-0.1023382, -1.240868, -4.058486, 1, 0, 0, 1, 1,
-0.1022657, 0.3793482, 0.4600068, 1, 0, 0, 1, 1,
-0.1012598, 1.073689, -1.295032, 0, 0, 0, 1, 1,
-0.09603126, 0.3434957, 0.7557151, 0, 0, 0, 1, 1,
-0.09336606, 0.5485403, -0.7343158, 0, 0, 0, 1, 1,
-0.09295169, -0.4682937, -0.9310927, 0, 0, 0, 1, 1,
-0.08793074, -0.2893255, -1.260597, 0, 0, 0, 1, 1,
-0.08780099, 0.4689046, -1.890114, 0, 0, 0, 1, 1,
-0.0847057, 1.285884, 0.1897168, 0, 0, 0, 1, 1,
-0.07798558, -0.09924076, -4.088682, 1, 1, 1, 1, 1,
-0.07764296, 0.3129652, 1.188287, 1, 1, 1, 1, 1,
-0.07097681, 3.323966, -0.8470722, 1, 1, 1, 1, 1,
-0.07088117, -1.285287, -3.011642, 1, 1, 1, 1, 1,
-0.06860925, -0.8285189, -3.649658, 1, 1, 1, 1, 1,
-0.06770231, 1.339902, -1.128201, 1, 1, 1, 1, 1,
-0.06257489, -0.6696681, -2.961596, 1, 1, 1, 1, 1,
-0.06064009, -0.1106961, -1.761047, 1, 1, 1, 1, 1,
-0.06040497, 0.5879357, -3.02972, 1, 1, 1, 1, 1,
-0.05928833, 0.002311773, -0.2760546, 1, 1, 1, 1, 1,
-0.05619066, 1.352808, 0.7031865, 1, 1, 1, 1, 1,
-0.0536283, 1.197352, -0.7113531, 1, 1, 1, 1, 1,
-0.05291296, -0.8168442, -3.463758, 1, 1, 1, 1, 1,
-0.045186, -1.397927, -2.838587, 1, 1, 1, 1, 1,
-0.04012248, -0.807386, -2.354971, 1, 1, 1, 1, 1,
-0.03712702, -0.8630303, -4.261973, 0, 0, 1, 1, 1,
-0.03308317, 2.05124, 0.9082376, 1, 0, 0, 1, 1,
-0.03207121, -0.3613846, -3.678267, 1, 0, 0, 1, 1,
-0.03127781, -0.4724615, -1.415153, 1, 0, 0, 1, 1,
-0.02788189, 0.4599954, 0.06264116, 1, 0, 0, 1, 1,
-0.02787583, 1.085604, -1.047622, 1, 0, 0, 1, 1,
-0.02622266, 0.2774727, -0.06958846, 0, 0, 0, 1, 1,
-0.02393577, 1.344509, -0.816799, 0, 0, 0, 1, 1,
-0.01837364, 1.003157, 0.4545707, 0, 0, 0, 1, 1,
-0.01620721, -1.290399, -4.509075, 0, 0, 0, 1, 1,
-0.01597673, 0.360378, -0.5454521, 0, 0, 0, 1, 1,
-0.01324585, -1.129702, -3.721373, 0, 0, 0, 1, 1,
-0.01052119, -0.3515921, -4.282735, 0, 0, 0, 1, 1,
-0.009786573, 2.302144, 0.0669396, 1, 1, 1, 1, 1,
-0.009044056, -0.1362993, -3.553589, 1, 1, 1, 1, 1,
-0.005755111, -0.7593958, -1.120025, 1, 1, 1, 1, 1,
-0.005211818, -1.127039, -2.86709, 1, 1, 1, 1, 1,
-0.004533643, 0.6675388, -0.7651159, 1, 1, 1, 1, 1,
0.001240757, 0.6044803, 0.004805823, 1, 1, 1, 1, 1,
0.001912429, -1.931234, 2.845439, 1, 1, 1, 1, 1,
0.002306851, 3.320652, -0.0998369, 1, 1, 1, 1, 1,
0.005921856, 0.1780987, -0.6512792, 1, 1, 1, 1, 1,
0.01214304, -0.7076532, 3.568138, 1, 1, 1, 1, 1,
0.01417291, 0.7328823, -2.395588, 1, 1, 1, 1, 1,
0.01614542, 0.00808051, 1.606113, 1, 1, 1, 1, 1,
0.01722468, -0.9979123, 1.93215, 1, 1, 1, 1, 1,
0.01817916, -2.755392, 2.546615, 1, 1, 1, 1, 1,
0.0184987, -0.2801495, 3.2518, 1, 1, 1, 1, 1,
0.01940052, 1.720654, 0.7455424, 0, 0, 1, 1, 1,
0.02437344, -0.1919796, 3.566792, 1, 0, 0, 1, 1,
0.02628409, -1.44541, 2.538876, 1, 0, 0, 1, 1,
0.02950139, 0.8991797, 0.5351781, 1, 0, 0, 1, 1,
0.03072512, 0.5707403, -0.4340377, 1, 0, 0, 1, 1,
0.03742191, 0.2214818, 1.705189, 1, 0, 0, 1, 1,
0.03761772, -1.847986, 1.370065, 0, 0, 0, 1, 1,
0.03797623, -0.2147608, 1.714465, 0, 0, 0, 1, 1,
0.04064241, 1.14049, 1.60824, 0, 0, 0, 1, 1,
0.04246553, 1.368118, -0.3463922, 0, 0, 0, 1, 1,
0.04351083, 0.2011352, -0.1675004, 0, 0, 0, 1, 1,
0.0445761, 0.7191839, -1.0058, 0, 0, 0, 1, 1,
0.04501141, 0.1029053, 0.5365254, 0, 0, 0, 1, 1,
0.04565553, 0.6700711, 1.091679, 1, 1, 1, 1, 1,
0.04619728, -1.362717, 3.431511, 1, 1, 1, 1, 1,
0.04751591, -0.7136756, 5.166784, 1, 1, 1, 1, 1,
0.04771293, 0.1775201, -2.052527, 1, 1, 1, 1, 1,
0.04779478, 0.8565407, -0.7299238, 1, 1, 1, 1, 1,
0.05043208, -0.3110275, 3.733939, 1, 1, 1, 1, 1,
0.0512583, 2.763211, -1.928104, 1, 1, 1, 1, 1,
0.05222688, -0.5309739, 2.406044, 1, 1, 1, 1, 1,
0.06156576, -1.174065, 3.3139, 1, 1, 1, 1, 1,
0.06682712, -1.076072, 0.5930186, 1, 1, 1, 1, 1,
0.0738936, 0.7178999, 0.4210114, 1, 1, 1, 1, 1,
0.07593389, -0.5858512, 1.642395, 1, 1, 1, 1, 1,
0.08028268, 0.1569519, 3.241703, 1, 1, 1, 1, 1,
0.08171505, 0.001160844, 2.425006, 1, 1, 1, 1, 1,
0.08802462, 0.5219968, 1.052234, 1, 1, 1, 1, 1,
0.09073844, 0.1764483, -0.02248966, 0, 0, 1, 1, 1,
0.0928785, 0.3920685, -0.1526032, 1, 0, 0, 1, 1,
0.09646471, 0.03046116, 2.017511, 1, 0, 0, 1, 1,
0.09671862, -1.039096, 2.588728, 1, 0, 0, 1, 1,
0.09841897, 1.043413, 1.712634, 1, 0, 0, 1, 1,
0.1002709, -0.931084, 3.484516, 1, 0, 0, 1, 1,
0.1005152, 1.017458, -0.2429276, 0, 0, 0, 1, 1,
0.1057439, -0.740617, 3.189284, 0, 0, 0, 1, 1,
0.1081821, -0.207818, 1.615278, 0, 0, 0, 1, 1,
0.11846, 0.2555012, 0.1712615, 0, 0, 0, 1, 1,
0.1209846, 0.9471726, 1.150157, 0, 0, 0, 1, 1,
0.1288168, -1.675914, 2.60255, 0, 0, 0, 1, 1,
0.1313998, -0.8364786, 2.212062, 0, 0, 0, 1, 1,
0.1344039, -0.7313569, 3.340981, 1, 1, 1, 1, 1,
0.1390124, -1.1125, 3.91216, 1, 1, 1, 1, 1,
0.1392258, 0.5217747, -0.5903921, 1, 1, 1, 1, 1,
0.1393721, 0.7019297, -0.418258, 1, 1, 1, 1, 1,
0.1404519, 1.241303, 0.1666088, 1, 1, 1, 1, 1,
0.1413132, 0.1591186, -0.9599513, 1, 1, 1, 1, 1,
0.1438566, 0.5664659, -0.4911535, 1, 1, 1, 1, 1,
0.1440745, -1.710905, 2.060964, 1, 1, 1, 1, 1,
0.1472571, -1.382102, 4.364426, 1, 1, 1, 1, 1,
0.1530097, 0.9080659, 0.3402021, 1, 1, 1, 1, 1,
0.1532018, 0.9412696, 1.588736, 1, 1, 1, 1, 1,
0.1544106, -0.2039649, 1.137784, 1, 1, 1, 1, 1,
0.1549678, -0.2772912, 3.496342, 1, 1, 1, 1, 1,
0.1572476, -0.4480197, 3.11897, 1, 1, 1, 1, 1,
0.159005, -0.1460772, 2.589716, 1, 1, 1, 1, 1,
0.1592717, -0.7950234, 2.537539, 0, 0, 1, 1, 1,
0.1596466, 1.329742, 1.246107, 1, 0, 0, 1, 1,
0.1604554, -0.04072322, 0.6854654, 1, 0, 0, 1, 1,
0.161578, 0.1726447, -0.7606437, 1, 0, 0, 1, 1,
0.1622565, 1.343354, -0.2204862, 1, 0, 0, 1, 1,
0.1624229, 1.560799, 1.089281, 1, 0, 0, 1, 1,
0.1657967, -0.05878738, 1.366706, 0, 0, 0, 1, 1,
0.1664977, 2.571105, 0.8394282, 0, 0, 0, 1, 1,
0.1669402, 0.4522215, 1.626066, 0, 0, 0, 1, 1,
0.1694888, 0.9030008, -0.04052225, 0, 0, 0, 1, 1,
0.1695491, 0.1554381, 1.093618, 0, 0, 0, 1, 1,
0.1701455, -0.5436094, 2.496726, 0, 0, 0, 1, 1,
0.1735742, -0.9477588, 1.517085, 0, 0, 0, 1, 1,
0.1750284, -1.356875, 1.876941, 1, 1, 1, 1, 1,
0.1764233, -0.7515676, 2.601438, 1, 1, 1, 1, 1,
0.1764786, -0.1335501, 2.581234, 1, 1, 1, 1, 1,
0.1795409, 0.8165332, -0.6751617, 1, 1, 1, 1, 1,
0.1811775, -0.2167212, 3.015435, 1, 1, 1, 1, 1,
0.1822416, 0.3831809, -0.1417009, 1, 1, 1, 1, 1,
0.1826661, 0.7935162, -0.2815984, 1, 1, 1, 1, 1,
0.1893202, -0.4496384, 2.727817, 1, 1, 1, 1, 1,
0.1905048, -0.3314462, 1.232352, 1, 1, 1, 1, 1,
0.1910842, 1.460663, 1.518585, 1, 1, 1, 1, 1,
0.1911516, 0.1843199, 1.890754, 1, 1, 1, 1, 1,
0.1919024, -1.922596, 2.432296, 1, 1, 1, 1, 1,
0.1965472, -1.083067, 2.157179, 1, 1, 1, 1, 1,
0.1969499, 0.4218202, 0.1317023, 1, 1, 1, 1, 1,
0.2017002, 0.8907393, -0.2530008, 1, 1, 1, 1, 1,
0.2037846, 0.1214619, -0.2577031, 0, 0, 1, 1, 1,
0.211678, -1.454236, 2.66954, 1, 0, 0, 1, 1,
0.2132819, -0.1541729, 3.661094, 1, 0, 0, 1, 1,
0.2141907, -0.8150892, 1.735744, 1, 0, 0, 1, 1,
0.2142087, -0.8182784, 2.962504, 1, 0, 0, 1, 1,
0.2162393, 1.451571, 0.4097357, 1, 0, 0, 1, 1,
0.2162823, 0.6729698, 0.2011755, 0, 0, 0, 1, 1,
0.2164482, -1.529463, 2.315218, 0, 0, 0, 1, 1,
0.2182014, 1.74134, -0.1489759, 0, 0, 0, 1, 1,
0.2217273, 1.21403, -0.4836488, 0, 0, 0, 1, 1,
0.2223003, 0.9542285, -0.161129, 0, 0, 0, 1, 1,
0.2247041, 1.107539, -1.239927, 0, 0, 0, 1, 1,
0.225942, -1.426688, 3.65333, 0, 0, 0, 1, 1,
0.2338156, 1.293142, -0.7783078, 1, 1, 1, 1, 1,
0.2381639, -0.1985008, 1.289727, 1, 1, 1, 1, 1,
0.2386359, -1.914754, 2.485475, 1, 1, 1, 1, 1,
0.2403478, -0.225747, 2.888306, 1, 1, 1, 1, 1,
0.2406493, -0.6473783, 2.646046, 1, 1, 1, 1, 1,
0.2424204, -0.3628377, 5.080022, 1, 1, 1, 1, 1,
0.2435926, 1.12764, 0.447706, 1, 1, 1, 1, 1,
0.2458077, 1.072319, -0.1840937, 1, 1, 1, 1, 1,
0.246935, 1.674769, 0.4751371, 1, 1, 1, 1, 1,
0.2521532, 2.775626, -0.3222142, 1, 1, 1, 1, 1,
0.2529449, 1.317512, 1.15709, 1, 1, 1, 1, 1,
0.2555971, 0.07360221, 0.3913171, 1, 1, 1, 1, 1,
0.2598654, -0.6391131, 3.312583, 1, 1, 1, 1, 1,
0.261055, -1.007698, 2.155016, 1, 1, 1, 1, 1,
0.263087, 0.6879225, 1.51088, 1, 1, 1, 1, 1,
0.2655499, -0.4342412, 2.302112, 0, 0, 1, 1, 1,
0.2660994, 0.4699019, 0.2876523, 1, 0, 0, 1, 1,
0.270365, -0.7248058, 2.614253, 1, 0, 0, 1, 1,
0.2732608, -1.64384, 3.257646, 1, 0, 0, 1, 1,
0.2734588, -1.873041, 4.408385, 1, 0, 0, 1, 1,
0.2769698, 0.4094635, 0.4702014, 1, 0, 0, 1, 1,
0.2787979, 1.914138, -0.01490294, 0, 0, 0, 1, 1,
0.2810669, -0.04526162, 2.220014, 0, 0, 0, 1, 1,
0.2821009, 1.686862, 0.1175726, 0, 0, 0, 1, 1,
0.2856946, -0.9266694, 2.204714, 0, 0, 0, 1, 1,
0.2892376, 0.4462563, -0.05602489, 0, 0, 0, 1, 1,
0.2938875, 1.111905, 0.9058483, 0, 0, 0, 1, 1,
0.3007012, 0.5678619, 1.251858, 0, 0, 0, 1, 1,
0.3073656, 1.34274, 1.226645, 1, 1, 1, 1, 1,
0.3086727, 1.080979, -0.2129161, 1, 1, 1, 1, 1,
0.3093939, -0.7457063, 3.27715, 1, 1, 1, 1, 1,
0.309889, 0.2955142, 1.083956, 1, 1, 1, 1, 1,
0.310355, 0.06818219, 1.060338, 1, 1, 1, 1, 1,
0.3111273, -0.1001764, 0.6282518, 1, 1, 1, 1, 1,
0.318784, -0.7305122, 1.367378, 1, 1, 1, 1, 1,
0.3205282, 0.1457196, 2.506688, 1, 1, 1, 1, 1,
0.3230878, 0.6071594, -0.02979585, 1, 1, 1, 1, 1,
0.3233361, -0.2136032, 3.570819, 1, 1, 1, 1, 1,
0.3269113, 0.901387, -0.2297591, 1, 1, 1, 1, 1,
0.3270397, -1.339092, 2.368563, 1, 1, 1, 1, 1,
0.3287407, 1.07591, 0.4453233, 1, 1, 1, 1, 1,
0.3290654, 0.6646137, 0.5391881, 1, 1, 1, 1, 1,
0.3326961, 0.01370633, 0.6134141, 1, 1, 1, 1, 1,
0.3359026, -1.496434, 4.045589, 0, 0, 1, 1, 1,
0.3363372, -0.2680411, 2.332694, 1, 0, 0, 1, 1,
0.3391536, -0.3104785, 2.510998, 1, 0, 0, 1, 1,
0.3439497, 0.832794, 0.1209058, 1, 0, 0, 1, 1,
0.3501347, 0.1255066, -0.1450155, 1, 0, 0, 1, 1,
0.3533197, -0.4354115, 2.129583, 1, 0, 0, 1, 1,
0.3557061, 0.5956486, -0.2056174, 0, 0, 0, 1, 1,
0.3559071, -0.6732576, 4.381904, 0, 0, 0, 1, 1,
0.3559176, -0.9188745, 3.826344, 0, 0, 0, 1, 1,
0.3570548, 0.09736884, 2.182869, 0, 0, 0, 1, 1,
0.3670379, -1.463328, 3.843568, 0, 0, 0, 1, 1,
0.3744141, 0.7620346, 1.200069, 0, 0, 0, 1, 1,
0.3763068, 1.217844, -0.3335281, 0, 0, 0, 1, 1,
0.3792568, -0.1709332, 2.549479, 1, 1, 1, 1, 1,
0.3823212, -0.6481988, 1.223667, 1, 1, 1, 1, 1,
0.3878035, 0.9057906, 2.00028, 1, 1, 1, 1, 1,
0.3911093, -1.597285, 4.348249, 1, 1, 1, 1, 1,
0.3942439, -0.2255843, 1.046868, 1, 1, 1, 1, 1,
0.3960035, 0.2526488, 0.02035558, 1, 1, 1, 1, 1,
0.3969032, -2.883423, 5.181984, 1, 1, 1, 1, 1,
0.3998559, -0.071846, 1.608169, 1, 1, 1, 1, 1,
0.4037991, 0.3247511, -0.2220461, 1, 1, 1, 1, 1,
0.4112813, -0.6557286, 2.169418, 1, 1, 1, 1, 1,
0.4138251, 0.6220823, -0.8330888, 1, 1, 1, 1, 1,
0.4221638, -1.368381, 1.735792, 1, 1, 1, 1, 1,
0.4227143, 0.6470949, 0.5082172, 1, 1, 1, 1, 1,
0.4231545, 0.09606733, 1.849413, 1, 1, 1, 1, 1,
0.4253198, 1.622553, 1.464637, 1, 1, 1, 1, 1,
0.4282686, -1.202769, 4.520258, 0, 0, 1, 1, 1,
0.4283683, -1.138112, 3.325381, 1, 0, 0, 1, 1,
0.4328727, -0.6153014, 4.475919, 1, 0, 0, 1, 1,
0.4381954, -0.3688191, 2.98548, 1, 0, 0, 1, 1,
0.4385671, 1.993043, 1.481309, 1, 0, 0, 1, 1,
0.439296, -2.203856, 2.646207, 1, 0, 0, 1, 1,
0.4398655, 0.2271255, 1.962587, 0, 0, 0, 1, 1,
0.4409432, 0.6560545, 1.310671, 0, 0, 0, 1, 1,
0.4419504, -0.08939586, 2.647395, 0, 0, 0, 1, 1,
0.4442312, -0.8565996, 2.61819, 0, 0, 0, 1, 1,
0.4490423, 0.9135539, 1.257352, 0, 0, 0, 1, 1,
0.4494958, 0.4081866, 0.3123817, 0, 0, 0, 1, 1,
0.4523048, 0.1293251, 1.836891, 0, 0, 0, 1, 1,
0.4526315, 0.2681178, 1.056956, 1, 1, 1, 1, 1,
0.4534194, 1.301654, 0.4402156, 1, 1, 1, 1, 1,
0.458476, 0.5749072, -0.01178974, 1, 1, 1, 1, 1,
0.4646968, -0.8956773, 2.601481, 1, 1, 1, 1, 1,
0.4656633, 0.3094405, 0.8891268, 1, 1, 1, 1, 1,
0.478354, -0.2109967, 1.490352, 1, 1, 1, 1, 1,
0.4783683, -1.013419, 3.523863, 1, 1, 1, 1, 1,
0.4796888, -1.26993, 4.02177, 1, 1, 1, 1, 1,
0.4834681, 0.5211206, -0.06022529, 1, 1, 1, 1, 1,
0.4848024, 0.2845919, 2.238267, 1, 1, 1, 1, 1,
0.4851521, -1.814439, 2.909025, 1, 1, 1, 1, 1,
0.4887866, 1.149601, 0.192864, 1, 1, 1, 1, 1,
0.4915746, -0.4809066, 2.475813, 1, 1, 1, 1, 1,
0.4961627, -0.8226802, 2.135371, 1, 1, 1, 1, 1,
0.5013005, 0.5038236, 3.237635, 1, 1, 1, 1, 1,
0.5031088, -0.7929534, 4.250353, 0, 0, 1, 1, 1,
0.5048588, 0.9451536, -0.1124314, 1, 0, 0, 1, 1,
0.5053018, -0.8058288, 2.861055, 1, 0, 0, 1, 1,
0.508301, 0.484336, -1.301963, 1, 0, 0, 1, 1,
0.5110838, -0.02826967, 2.174942, 1, 0, 0, 1, 1,
0.5193402, -0.6707429, 3.655207, 1, 0, 0, 1, 1,
0.527308, -0.4632064, 2.553767, 0, 0, 0, 1, 1,
0.538506, -0.3740746, 1.12951, 0, 0, 0, 1, 1,
0.5401961, -0.8691554, 0.4315339, 0, 0, 0, 1, 1,
0.5436262, 0.7926633, 2.223293, 0, 0, 0, 1, 1,
0.5543795, 1.54255, -0.1807163, 0, 0, 0, 1, 1,
0.5587165, 0.0864301, 1.702644, 0, 0, 0, 1, 1,
0.5595632, 2.343558, -0.5295765, 0, 0, 0, 1, 1,
0.5606976, 0.09993118, 2.25868, 1, 1, 1, 1, 1,
0.5663228, -0.3881697, 0.8067004, 1, 1, 1, 1, 1,
0.5675183, -1.508654, 4.35483, 1, 1, 1, 1, 1,
0.572985, -0.2315982, 1.501636, 1, 1, 1, 1, 1,
0.5740991, -0.3219579, 1.361493, 1, 1, 1, 1, 1,
0.5762674, 1.227465, 0.09977762, 1, 1, 1, 1, 1,
0.5769839, -1.040432, 4.620192, 1, 1, 1, 1, 1,
0.5818378, 0.2343743, -1.111179, 1, 1, 1, 1, 1,
0.5838291, 0.4814633, 0.2793026, 1, 1, 1, 1, 1,
0.5854262, 0.2072507, 1.196951, 1, 1, 1, 1, 1,
0.585694, 0.3112683, 1.081021, 1, 1, 1, 1, 1,
0.5881464, 0.4922867, -0.5062813, 1, 1, 1, 1, 1,
0.5940759, 0.1679487, 1.566259, 1, 1, 1, 1, 1,
0.5946516, -1.882193, 1.411427, 1, 1, 1, 1, 1,
0.5957812, -0.01850842, 0.4834649, 1, 1, 1, 1, 1,
0.6031908, 0.2470758, 1.624183, 0, 0, 1, 1, 1,
0.605469, 1.124282, -0.4879316, 1, 0, 0, 1, 1,
0.6057522, 0.2457729, 0.7162492, 1, 0, 0, 1, 1,
0.6128548, -1.506322, 2.764896, 1, 0, 0, 1, 1,
0.6134548, -0.1997405, 0.6962821, 1, 0, 0, 1, 1,
0.6134999, -0.3550206, 2.489563, 1, 0, 0, 1, 1,
0.6159527, -1.210665, 2.590697, 0, 0, 0, 1, 1,
0.6183257, -1.127117, 2.992804, 0, 0, 0, 1, 1,
0.6200781, 1.287961, -1.044066, 0, 0, 0, 1, 1,
0.6216691, 0.389423, -0.1235423, 0, 0, 0, 1, 1,
0.6294426, -0.655693, 0.3547697, 0, 0, 0, 1, 1,
0.6359788, 1.65357, -0.2029372, 0, 0, 0, 1, 1,
0.6361195, 0.8777736, -1.318453, 0, 0, 0, 1, 1,
0.6398137, 0.3981928, -0.455272, 1, 1, 1, 1, 1,
0.6443132, 0.8118745, 0.4720263, 1, 1, 1, 1, 1,
0.644856, -0.4455239, 1.2991, 1, 1, 1, 1, 1,
0.6471121, 0.5844117, -0.0308947, 1, 1, 1, 1, 1,
0.6503572, 0.5507292, 0.7490398, 1, 1, 1, 1, 1,
0.6504321, -0.6530094, 1.976057, 1, 1, 1, 1, 1,
0.6522806, -0.9911665, 3.550393, 1, 1, 1, 1, 1,
0.6552358, -0.3358804, 1.254671, 1, 1, 1, 1, 1,
0.655834, -1.301103, 0.993461, 1, 1, 1, 1, 1,
0.6600913, -0.9223738, 2.802237, 1, 1, 1, 1, 1,
0.6656945, -0.3272333, 1.152867, 1, 1, 1, 1, 1,
0.666425, 0.6245909, 0.03606267, 1, 1, 1, 1, 1,
0.6668612, 0.4209584, 1.100061, 1, 1, 1, 1, 1,
0.6713791, 0.2609738, 1.104373, 1, 1, 1, 1, 1,
0.6729088, 0.4487117, 0.5157379, 1, 1, 1, 1, 1,
0.6807017, 0.4349056, 0.688419, 0, 0, 1, 1, 1,
0.6831142, 1.671043, -0.9546818, 1, 0, 0, 1, 1,
0.683423, -0.7627397, 3.521868, 1, 0, 0, 1, 1,
0.6839574, 0.5943976, -0.1395775, 1, 0, 0, 1, 1,
0.6842557, -0.4124348, 1.857048, 1, 0, 0, 1, 1,
0.6912894, -1.105765, 3.513847, 1, 0, 0, 1, 1,
0.7056528, 0.0593157, 0.2036452, 0, 0, 0, 1, 1,
0.7077402, -0.4143005, 3.438505, 0, 0, 0, 1, 1,
0.7077469, 2.122371, -0.5276825, 0, 0, 0, 1, 1,
0.710587, -0.0114117, 1.902805, 0, 0, 0, 1, 1,
0.7187377, -0.3168219, 0.5087841, 0, 0, 0, 1, 1,
0.7235207, -0.835031, 1.722858, 0, 0, 0, 1, 1,
0.7253082, 0.1252991, 2.676172, 0, 0, 0, 1, 1,
0.7338169, 0.3999173, 0.3628882, 1, 1, 1, 1, 1,
0.7357824, 1.006118, -0.8671599, 1, 1, 1, 1, 1,
0.7358342, -0.7225788, 3.472235, 1, 1, 1, 1, 1,
0.7376627, -0.9675774, 2.676484, 1, 1, 1, 1, 1,
0.7394274, -1.582952, 0.7722425, 1, 1, 1, 1, 1,
0.7449918, -1.722072, 0.6662446, 1, 1, 1, 1, 1,
0.7490883, -0.5328559, 0.9043378, 1, 1, 1, 1, 1,
0.7560013, -0.7756927, 1.926852, 1, 1, 1, 1, 1,
0.7578577, 1.177997, 0.680274, 1, 1, 1, 1, 1,
0.7630098, -1.732697, 1.762591, 1, 1, 1, 1, 1,
0.7633629, 1.54232, 0.7614237, 1, 1, 1, 1, 1,
0.7660961, 0.2101523, 1.682617, 1, 1, 1, 1, 1,
0.7661487, -0.4149691, 1.57509, 1, 1, 1, 1, 1,
0.7661839, -0.03119693, 2.441696, 1, 1, 1, 1, 1,
0.7677149, -0.3323922, 0.6257362, 1, 1, 1, 1, 1,
0.7691413, -1.137451, 3.048612, 0, 0, 1, 1, 1,
0.7692505, -0.4145186, 2.713339, 1, 0, 0, 1, 1,
0.7707129, 0.3973095, 1.599506, 1, 0, 0, 1, 1,
0.7710543, 0.4493963, 3.437682, 1, 0, 0, 1, 1,
0.7721716, 0.8970798, 0.3550337, 1, 0, 0, 1, 1,
0.7789618, 1.325771, 1.347855, 1, 0, 0, 1, 1,
0.7825464, -2.488413, 4.238359, 0, 0, 0, 1, 1,
0.7834048, 0.5262469, 0.7664758, 0, 0, 0, 1, 1,
0.78518, -1.060879, 2.295439, 0, 0, 0, 1, 1,
0.7872503, 0.3358737, 3.072596, 0, 0, 0, 1, 1,
0.7879912, 0.1377488, 1.517544, 0, 0, 0, 1, 1,
0.7913901, 1.918832, -0.2436632, 0, 0, 0, 1, 1,
0.7977766, 0.9872196, -0.1626189, 0, 0, 0, 1, 1,
0.7996402, -0.67411, 1.46699, 1, 1, 1, 1, 1,
0.805735, -2.257234, 4.622135, 1, 1, 1, 1, 1,
0.80611, 1.538361, 0.107529, 1, 1, 1, 1, 1,
0.8062984, 1.071648, 1.000204, 1, 1, 1, 1, 1,
0.8105977, -1.527788, 2.275826, 1, 1, 1, 1, 1,
0.8147603, 1.031893, 1.75712, 1, 1, 1, 1, 1,
0.8195078, -0.8536691, 1.193872, 1, 1, 1, 1, 1,
0.821447, -1.493829, 1.167459, 1, 1, 1, 1, 1,
0.8276364, 1.064321, -0.1134629, 1, 1, 1, 1, 1,
0.8290954, -0.03412379, 2.314267, 1, 1, 1, 1, 1,
0.8339947, 0.3334446, 2.175216, 1, 1, 1, 1, 1,
0.83455, 0.1650083, 2.968281, 1, 1, 1, 1, 1,
0.8360466, -0.01730402, 1.95757, 1, 1, 1, 1, 1,
0.8440363, -0.7468246, 4.098622, 1, 1, 1, 1, 1,
0.8496429, -0.1668146, 0.9647189, 1, 1, 1, 1, 1,
0.8680264, 0.2684582, 1.412404, 0, 0, 1, 1, 1,
0.8705469, -0.8415655, 3.763673, 1, 0, 0, 1, 1,
0.873319, -0.6688925, 1.42958, 1, 0, 0, 1, 1,
0.8882108, 0.01925219, 2.012008, 1, 0, 0, 1, 1,
0.8953311, 1.713055, 1.367141, 1, 0, 0, 1, 1,
0.8976952, 0.1914202, 1.221658, 1, 0, 0, 1, 1,
0.899043, -0.5975381, 2.090615, 0, 0, 0, 1, 1,
0.8991575, -0.8638791, 1.797089, 0, 0, 0, 1, 1,
0.9074438, -0.7541824, 2.311329, 0, 0, 0, 1, 1,
0.9130173, -0.7701414, 4.093915, 0, 0, 0, 1, 1,
0.9133716, 0.6782299, -0.5370032, 0, 0, 0, 1, 1,
0.920347, -1.734087, 2.407845, 0, 0, 0, 1, 1,
0.9256237, -0.8191349, 0.7257604, 0, 0, 0, 1, 1,
0.9260671, 0.4742496, 1.036881, 1, 1, 1, 1, 1,
0.9287109, 0.4699311, 0.2032581, 1, 1, 1, 1, 1,
0.9316954, -0.07021728, 0.4843183, 1, 1, 1, 1, 1,
0.9328332, -1.758268, 3.10561, 1, 1, 1, 1, 1,
0.9345137, 0.9851236, 0.5418195, 1, 1, 1, 1, 1,
0.9372679, -1.163362, 2.651829, 1, 1, 1, 1, 1,
0.937762, -0.9565903, 1.94466, 1, 1, 1, 1, 1,
0.9440607, -1.738875, 4.339804, 1, 1, 1, 1, 1,
0.9509602, 1.798715, 1.192245, 1, 1, 1, 1, 1,
0.9553162, -0.2828924, 4.318324, 1, 1, 1, 1, 1,
0.9556091, -0.2860787, 2.54256, 1, 1, 1, 1, 1,
0.9587245, -1.553213, 2.458745, 1, 1, 1, 1, 1,
0.9602309, -1.11587, 3.23772, 1, 1, 1, 1, 1,
0.9614623, 1.49795, 0.2755179, 1, 1, 1, 1, 1,
0.9621103, -2.06831, 2.228652, 1, 1, 1, 1, 1,
0.9635291, 0.9382578, 2.411573, 0, 0, 1, 1, 1,
0.9645312, -0.7669033, 2.931146, 1, 0, 0, 1, 1,
0.9665138, 0.1718362, 0.4605948, 1, 0, 0, 1, 1,
0.9695154, 0.7120363, 0.7941347, 1, 0, 0, 1, 1,
0.971567, 0.2106034, 1.12419, 1, 0, 0, 1, 1,
0.9757082, 0.9920256, 0.2627887, 1, 0, 0, 1, 1,
0.9814802, -0.6703765, 2.255925, 0, 0, 0, 1, 1,
0.9846663, -0.1429476, 1.374252, 0, 0, 0, 1, 1,
0.9916162, 0.821358, 2.798865, 0, 0, 0, 1, 1,
0.9946197, 0.6946814, 2.211717, 0, 0, 0, 1, 1,
0.9951952, 2.098662, 0.761642, 0, 0, 0, 1, 1,
1.001401, 0.4259889, 0.6159105, 0, 0, 0, 1, 1,
1.003548, 1.545156, 0.05959623, 0, 0, 0, 1, 1,
1.010994, -0.6854114, 2.780073, 1, 1, 1, 1, 1,
1.017748, 0.9441694, -0.6991594, 1, 1, 1, 1, 1,
1.021004, -0.3313343, 0.6944026, 1, 1, 1, 1, 1,
1.025055, 0.03486676, 1.338056, 1, 1, 1, 1, 1,
1.025514, 0.2398883, 1.22419, 1, 1, 1, 1, 1,
1.028593, -0.1936514, 1.816123, 1, 1, 1, 1, 1,
1.030417, -0.4382858, 0.5187335, 1, 1, 1, 1, 1,
1.031342, 0.671125, -0.6883978, 1, 1, 1, 1, 1,
1.047431, -1.319489, 2.367194, 1, 1, 1, 1, 1,
1.049612, 0.1402439, 2.089772, 1, 1, 1, 1, 1,
1.051622, 0.9783311, -0.2661648, 1, 1, 1, 1, 1,
1.053942, 0.3663069, 1.867503, 1, 1, 1, 1, 1,
1.067917, 0.126487, 1.840263, 1, 1, 1, 1, 1,
1.07104, -0.1895975, 0.8068672, 1, 1, 1, 1, 1,
1.080832, -0.09892772, 1.074265, 1, 1, 1, 1, 1,
1.08433, -0.6096962, 0.5281397, 0, 0, 1, 1, 1,
1.0982, -0.9722334, 1.378074, 1, 0, 0, 1, 1,
1.10126, 0.2778991, 0.9171971, 1, 0, 0, 1, 1,
1.109297, 0.1188758, 1.557219, 1, 0, 0, 1, 1,
1.11194, -0.7434302, 2.372108, 1, 0, 0, 1, 1,
1.113298, 0.749948, 1.370895, 1, 0, 0, 1, 1,
1.116694, -1.665612, 4.467953, 0, 0, 0, 1, 1,
1.120006, -0.9448148, 1.681022, 0, 0, 0, 1, 1,
1.123001, -2.337839, 0.9809461, 0, 0, 0, 1, 1,
1.127058, -0.5083271, 1.392533, 0, 0, 0, 1, 1,
1.130952, 1.75552, 0.4874201, 0, 0, 0, 1, 1,
1.131005, 1.275398, -0.7939231, 0, 0, 0, 1, 1,
1.13362, -0.001534676, 1.568138, 0, 0, 0, 1, 1,
1.139773, 0.4495226, 2.563975, 1, 1, 1, 1, 1,
1.1427, -0.1477237, 2.370182, 1, 1, 1, 1, 1,
1.152196, -0.7389697, 1.452801, 1, 1, 1, 1, 1,
1.15298, -0.1852593, 3.475545, 1, 1, 1, 1, 1,
1.169327, 0.4131877, 1.634848, 1, 1, 1, 1, 1,
1.182333, -0.6289829, 2.585595, 1, 1, 1, 1, 1,
1.191281, 1.170811, 1.655334, 1, 1, 1, 1, 1,
1.198917, 0.7475395, 0.6481253, 1, 1, 1, 1, 1,
1.211015, 0.9539359, 1.229209, 1, 1, 1, 1, 1,
1.215699, 0.5589286, 0.9010046, 1, 1, 1, 1, 1,
1.216338, 1.761875, 2.939756, 1, 1, 1, 1, 1,
1.228396, -0.635138, 2.080168, 1, 1, 1, 1, 1,
1.229627, -2.510137, 2.437656, 1, 1, 1, 1, 1,
1.23148, -0.564404, 1.17081, 1, 1, 1, 1, 1,
1.232799, 0.7815792, 1.361775, 1, 1, 1, 1, 1,
1.238006, 0.4255073, 1.420107, 0, 0, 1, 1, 1,
1.238268, 2.273691, 1.330113, 1, 0, 0, 1, 1,
1.238974, -0.8337396, 2.338488, 1, 0, 0, 1, 1,
1.247173, 0.6622777, -0.7993429, 1, 0, 0, 1, 1,
1.252686, 0.8859823, 1.183555, 1, 0, 0, 1, 1,
1.25668, -0.2601609, 1.447674, 1, 0, 0, 1, 1,
1.269174, -0.2934679, 1.418869, 0, 0, 0, 1, 1,
1.276348, 1.394007, 2.859646, 0, 0, 0, 1, 1,
1.277131, 1.468272, -0.4889961, 0, 0, 0, 1, 1,
1.279081, -0.5062696, 2.837594, 0, 0, 0, 1, 1,
1.280694, -1.188863, 3.486201, 0, 0, 0, 1, 1,
1.284008, 1.008853, 0.2793112, 0, 0, 0, 1, 1,
1.294613, -1.2515, 0.6142153, 0, 0, 0, 1, 1,
1.294942, -0.1383369, 0.4425754, 1, 1, 1, 1, 1,
1.296556, 0.5714161, 0.3172768, 1, 1, 1, 1, 1,
1.300125, -1.185768, 2.556526, 1, 1, 1, 1, 1,
1.312473, -0.1876401, 2.270569, 1, 1, 1, 1, 1,
1.317663, -1.23755, 2.768896, 1, 1, 1, 1, 1,
1.319268, -2.264954, 2.170641, 1, 1, 1, 1, 1,
1.321799, -0.5278413, 1.779386, 1, 1, 1, 1, 1,
1.329745, -0.8580003, 1.783209, 1, 1, 1, 1, 1,
1.331094, -0.5940027, 4.307767, 1, 1, 1, 1, 1,
1.352317, -1.580735, 3.81481, 1, 1, 1, 1, 1,
1.367858, -0.5539086, 2.074243, 1, 1, 1, 1, 1,
1.383908, 0.3369075, 0.1912485, 1, 1, 1, 1, 1,
1.385346, -0.3897797, 2.847886, 1, 1, 1, 1, 1,
1.388529, 0.2649579, 0.6432665, 1, 1, 1, 1, 1,
1.391867, -0.6030046, 2.180333, 1, 1, 1, 1, 1,
1.394288, 0.6010436, 1.909264, 0, 0, 1, 1, 1,
1.39833, -0.1537221, 1.639567, 1, 0, 0, 1, 1,
1.399398, -0.6394463, 0.5978304, 1, 0, 0, 1, 1,
1.401855, 0.6853263, 1.37592, 1, 0, 0, 1, 1,
1.406457, 0.9945158, 0.6257336, 1, 0, 0, 1, 1,
1.417529, 1.104001, 0.5127242, 1, 0, 0, 1, 1,
1.421882, 0.4057618, -0.4384317, 0, 0, 0, 1, 1,
1.424504, -1.46107, 1.495444, 0, 0, 0, 1, 1,
1.429892, 0.4928333, 2.485277, 0, 0, 0, 1, 1,
1.432742, 0.416481, 1.580789, 0, 0, 0, 1, 1,
1.436596, 0.3988869, 3.15904, 0, 0, 0, 1, 1,
1.466009, -1.871645, 2.08518, 0, 0, 0, 1, 1,
1.48335, 0.3257257, 0.9572111, 0, 0, 0, 1, 1,
1.487561, 0.05819042, 0.8960827, 1, 1, 1, 1, 1,
1.491563, -1.536019, 1.428699, 1, 1, 1, 1, 1,
1.514453, 0.7519032, 0.2934484, 1, 1, 1, 1, 1,
1.522946, 0.8735564, 0.4649363, 1, 1, 1, 1, 1,
1.556913, -0.09485602, -1.748749, 1, 1, 1, 1, 1,
1.559231, 0.8616468, 1.633658, 1, 1, 1, 1, 1,
1.57098, 1.675356, 0.3634042, 1, 1, 1, 1, 1,
1.57233, 0.2419052, 0.9936816, 1, 1, 1, 1, 1,
1.572448, 0.1456851, 2.343314, 1, 1, 1, 1, 1,
1.577464, 0.1171202, 0.8942246, 1, 1, 1, 1, 1,
1.590371, 0.006882035, 3.208491, 1, 1, 1, 1, 1,
1.600384, 0.1441159, 0.7638188, 1, 1, 1, 1, 1,
1.601879, 0.9075197, 0.4318674, 1, 1, 1, 1, 1,
1.61255, 0.5449782, -0.02743651, 1, 1, 1, 1, 1,
1.61834, -0.8569496, 1.850008, 1, 1, 1, 1, 1,
1.627933, 0.6020114, 0.4505656, 0, 0, 1, 1, 1,
1.63894, 0.6199924, 1.360162, 1, 0, 0, 1, 1,
1.64448, -0.08121602, 1.755599, 1, 0, 0, 1, 1,
1.646889, 0.6263819, 1.600733, 1, 0, 0, 1, 1,
1.652138, 1.964958, -0.00496474, 1, 0, 0, 1, 1,
1.663781, 0.7034904, 1.179429, 1, 0, 0, 1, 1,
1.664521, -2.39241, 2.76837, 0, 0, 0, 1, 1,
1.688798, -1.368861, 0.04865897, 0, 0, 0, 1, 1,
1.690245, 0.1407575, 0.7043921, 0, 0, 0, 1, 1,
1.704221, -0.9532415, 2.382034, 0, 0, 0, 1, 1,
1.708889, 1.440745, -0.001920886, 0, 0, 0, 1, 1,
1.717089, -0.7568591, 1.665345, 0, 0, 0, 1, 1,
1.723102, 1.219025, 0.7607034, 0, 0, 0, 1, 1,
1.740999, 0.2539629, 2.382312, 1, 1, 1, 1, 1,
1.750032, 0.2479393, 1.937501, 1, 1, 1, 1, 1,
1.753338, -0.3863995, 2.871294, 1, 1, 1, 1, 1,
1.764773, 0.3345014, 2.350489, 1, 1, 1, 1, 1,
1.789202, -1.64911, 4.220184, 1, 1, 1, 1, 1,
1.790651, -1.761751, 1.663303, 1, 1, 1, 1, 1,
1.796695, 0.5772632, 2.341241, 1, 1, 1, 1, 1,
1.81684, -0.1382286, 1.921635, 1, 1, 1, 1, 1,
1.82997, -0.8077081, 3.310004, 1, 1, 1, 1, 1,
1.830475, 0.9129002, 1.055303, 1, 1, 1, 1, 1,
1.846385, 0.03146907, 1.73187, 1, 1, 1, 1, 1,
1.860511, 0.6368467, 2.705281, 1, 1, 1, 1, 1,
1.874547, -0.8846408, 1.759133, 1, 1, 1, 1, 1,
1.897736, 1.134328, -0.5139477, 1, 1, 1, 1, 1,
1.985149, 0.3574712, 0.1748573, 1, 1, 1, 1, 1,
2.005683, -0.4978417, 1.349736, 0, 0, 1, 1, 1,
2.034779, -0.1903692, 1.47796, 1, 0, 0, 1, 1,
2.037616, -0.6020578, 2.401995, 1, 0, 0, 1, 1,
2.054417, 0.6005677, 2.719824, 1, 0, 0, 1, 1,
2.059688, -0.7482145, 1.250274, 1, 0, 0, 1, 1,
2.118732, -1.067061, 2.422974, 1, 0, 0, 1, 1,
2.120038, -1.909063, 2.145608, 0, 0, 0, 1, 1,
2.125582, -0.1182804, 1.839579, 0, 0, 0, 1, 1,
2.150221, 0.7682393, 1.597968, 0, 0, 0, 1, 1,
2.160429, -1.958414, 2.367505, 0, 0, 0, 1, 1,
2.31608, 0.7735056, 1.452934, 0, 0, 0, 1, 1,
2.321375, 0.8547431, 0.07299425, 0, 0, 0, 1, 1,
2.396894, -0.8232919, 2.432338, 0, 0, 0, 1, 1,
2.400016, 0.7768276, 0.6526302, 1, 1, 1, 1, 1,
2.499525, 0.0971543, 1.513747, 1, 1, 1, 1, 1,
2.53372, -0.189836, 1.73113, 1, 1, 1, 1, 1,
2.629475, -1.30744, 1.650941, 1, 1, 1, 1, 1,
2.637186, 0.3845803, 0.8040062, 1, 1, 1, 1, 1,
2.698638, 0.6776239, 0.3773898, 1, 1, 1, 1, 1,
2.720341, 0.3186235, 1.009227, 1, 1, 1, 1, 1
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
var radius = 9.375163;
var distance = 32.92986;
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
mvMatrix.translate( 0.4839886, -0.2202715, -0.007624865 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.92986);
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
