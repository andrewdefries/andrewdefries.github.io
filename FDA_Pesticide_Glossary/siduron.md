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
-3.166217, 0.9513716, -1.558044, 1, 0, 0, 1,
-2.872141, -0.8205889, 0.1974694, 1, 0.007843138, 0, 1,
-2.756539, -0.7300442, -2.154717, 1, 0.01176471, 0, 1,
-2.754412, -0.1438735, -1.268945, 1, 0.01960784, 0, 1,
-2.715006, -0.3340389, -1.332257, 1, 0.02352941, 0, 1,
-2.694992, 1.323983, -0.4959559, 1, 0.03137255, 0, 1,
-2.673702, -0.707171, -3.03993, 1, 0.03529412, 0, 1,
-2.660894, -0.01040449, -0.8883934, 1, 0.04313726, 0, 1,
-2.558748, -0.9269099, -2.372084, 1, 0.04705882, 0, 1,
-2.29704, -0.1029616, -3.258151, 1, 0.05490196, 0, 1,
-2.296335, -0.4442922, -1.581693, 1, 0.05882353, 0, 1,
-2.235038, 1.018877, -0.6740938, 1, 0.06666667, 0, 1,
-2.228174, -0.9148311, -2.479985, 1, 0.07058824, 0, 1,
-2.22446, -0.1020752, -0.5672514, 1, 0.07843138, 0, 1,
-2.208117, -0.962811, -1.449, 1, 0.08235294, 0, 1,
-2.205488, -0.3763298, -2.355773, 1, 0.09019608, 0, 1,
-2.182119, 0.8032113, -0.8911044, 1, 0.09411765, 0, 1,
-2.17068, 1.322227, -0.1168929, 1, 0.1019608, 0, 1,
-2.165203, -3.059826, -1.9031, 1, 0.1098039, 0, 1,
-2.146753, -0.4066226, -0.01097999, 1, 0.1137255, 0, 1,
-2.146258, -1.067789, -2.131638, 1, 0.1215686, 0, 1,
-2.139233, 1.602327, -1.484536, 1, 0.1254902, 0, 1,
-2.129897, -0.7707777, -0.8913664, 1, 0.1333333, 0, 1,
-2.128319, 0.5586436, -2.108709, 1, 0.1372549, 0, 1,
-2.066187, 0.3417621, -1.912385, 1, 0.145098, 0, 1,
-2.053089, 0.1653062, -1.609038, 1, 0.1490196, 0, 1,
-2.037392, 0.2241557, -0.3825058, 1, 0.1568628, 0, 1,
-2.034017, -0.2429482, -3.413537, 1, 0.1607843, 0, 1,
-1.987441, -0.3878128, -2.387117, 1, 0.1686275, 0, 1,
-1.980562, -1.640913, -2.371888, 1, 0.172549, 0, 1,
-1.953186, 0.1262865, -1.925037, 1, 0.1803922, 0, 1,
-1.912859, -1.436474, -0.5980762, 1, 0.1843137, 0, 1,
-1.909927, 1.586208, 0.7050933, 1, 0.1921569, 0, 1,
-1.909042, -0.3977832, -3.279129, 1, 0.1960784, 0, 1,
-1.8849, 2.243781, -1.929208, 1, 0.2039216, 0, 1,
-1.856607, -0.3988499, -1.639904, 1, 0.2117647, 0, 1,
-1.852232, 2.152496, 0.1971031, 1, 0.2156863, 0, 1,
-1.845699, -1.217825, -2.574619, 1, 0.2235294, 0, 1,
-1.839586, 0.2719289, -1.056835, 1, 0.227451, 0, 1,
-1.839328, 0.1603791, -1.356659, 1, 0.2352941, 0, 1,
-1.814099, -0.8186356, -0.6532583, 1, 0.2392157, 0, 1,
-1.811537, 0.1120676, -1.333061, 1, 0.2470588, 0, 1,
-1.796162, -1.818953, -1.735652, 1, 0.2509804, 0, 1,
-1.789138, -0.9631509, -1.920444, 1, 0.2588235, 0, 1,
-1.782446, 0.7727751, 0.0782325, 1, 0.2627451, 0, 1,
-1.782391, 0.4750391, -1.703688, 1, 0.2705882, 0, 1,
-1.779162, -0.8334449, -0.9446474, 1, 0.2745098, 0, 1,
-1.770752, -0.8841183, -2.605055, 1, 0.282353, 0, 1,
-1.767033, 0.9468809, -2.189529, 1, 0.2862745, 0, 1,
-1.758214, -1.500925, -1.423454, 1, 0.2941177, 0, 1,
-1.757016, 1.193245, -0.7400385, 1, 0.3019608, 0, 1,
-1.755904, -1.058563, -1.371648, 1, 0.3058824, 0, 1,
-1.746036, -0.2892421, -2.313773, 1, 0.3137255, 0, 1,
-1.739621, 0.1749207, -2.885408, 1, 0.3176471, 0, 1,
-1.738168, -0.1061399, -2.954963, 1, 0.3254902, 0, 1,
-1.728701, 0.636295, -2.574545, 1, 0.3294118, 0, 1,
-1.708513, 0.2511654, -0.7300782, 1, 0.3372549, 0, 1,
-1.708308, -1.492108, -4.560649, 1, 0.3411765, 0, 1,
-1.684039, -0.2197069, -2.228457, 1, 0.3490196, 0, 1,
-1.673881, -0.5450298, -2.793096, 1, 0.3529412, 0, 1,
-1.673753, -0.2547908, -2.934669, 1, 0.3607843, 0, 1,
-1.655433, -0.2960723, -2.366499, 1, 0.3647059, 0, 1,
-1.650485, -1.344783, -1.198199, 1, 0.372549, 0, 1,
-1.642346, 0.5671706, 1.421688, 1, 0.3764706, 0, 1,
-1.635914, -0.03305339, -0.7796363, 1, 0.3843137, 0, 1,
-1.618874, -1.044515, -2.524879, 1, 0.3882353, 0, 1,
-1.592449, 0.4851882, -1.07479, 1, 0.3960784, 0, 1,
-1.592098, -0.6805646, -0.9384779, 1, 0.4039216, 0, 1,
-1.57678, 0.7314287, -0.6252587, 1, 0.4078431, 0, 1,
-1.574932, 0.8925902, 0.5088798, 1, 0.4156863, 0, 1,
-1.567776, 0.5718154, -1.544457, 1, 0.4196078, 0, 1,
-1.56399, -1.632522, -1.908189, 1, 0.427451, 0, 1,
-1.529029, 0.5137312, -0.7152885, 1, 0.4313726, 0, 1,
-1.528231, -1.818881, -2.103693, 1, 0.4392157, 0, 1,
-1.521258, 0.2973024, -0.2847282, 1, 0.4431373, 0, 1,
-1.494979, -0.5860997, -1.066655, 1, 0.4509804, 0, 1,
-1.47523, -1.088773, -1.820033, 1, 0.454902, 0, 1,
-1.471877, 0.3860157, -0.3989669, 1, 0.4627451, 0, 1,
-1.466413, -0.03000731, -1.630753, 1, 0.4666667, 0, 1,
-1.46052, 0.6083602, -0.3224171, 1, 0.4745098, 0, 1,
-1.454127, -0.8299319, -2.25065, 1, 0.4784314, 0, 1,
-1.452937, 0.8129801, -2.539374, 1, 0.4862745, 0, 1,
-1.44869, 2.588635, 0.3474981, 1, 0.4901961, 0, 1,
-1.447244, -0.2537594, -1.388561, 1, 0.4980392, 0, 1,
-1.441072, 0.4125057, -0.2470147, 1, 0.5058824, 0, 1,
-1.440956, -1.648975, -1.637729, 1, 0.509804, 0, 1,
-1.439581, -1.706062, -2.244647, 1, 0.5176471, 0, 1,
-1.426373, 0.2018923, -2.048398, 1, 0.5215687, 0, 1,
-1.426155, 1.605688, -0.09396468, 1, 0.5294118, 0, 1,
-1.425424, -0.6307816, -1.641531, 1, 0.5333334, 0, 1,
-1.417856, -1.602107, -3.324639, 1, 0.5411765, 0, 1,
-1.414528, 0.6042318, -0.6308701, 1, 0.5450981, 0, 1,
-1.406882, 0.8496966, -0.6793983, 1, 0.5529412, 0, 1,
-1.405088, -0.979677, -3.544798, 1, 0.5568628, 0, 1,
-1.404703, -0.2475776, -2.596825, 1, 0.5647059, 0, 1,
-1.400295, 1.407765, -0.7993387, 1, 0.5686275, 0, 1,
-1.396292, -1.078715, -1.780363, 1, 0.5764706, 0, 1,
-1.393706, -0.2522684, -0.8982323, 1, 0.5803922, 0, 1,
-1.375744, 0.5880727, 0.7001391, 1, 0.5882353, 0, 1,
-1.370365, 0.5250216, -0.6300524, 1, 0.5921569, 0, 1,
-1.366531, -0.2180126, -0.8140763, 1, 0.6, 0, 1,
-1.358893, -0.9349519, -2.528936, 1, 0.6078432, 0, 1,
-1.35786, -0.08151791, -3.523102, 1, 0.6117647, 0, 1,
-1.348081, -0.3522133, -3.130276, 1, 0.6196079, 0, 1,
-1.348029, 1.558202, 0.100661, 1, 0.6235294, 0, 1,
-1.339457, 1.21832, -1.414869, 1, 0.6313726, 0, 1,
-1.325991, -0.0599965, -0.8135636, 1, 0.6352941, 0, 1,
-1.325122, -1.340331, -1.410369, 1, 0.6431373, 0, 1,
-1.325101, -0.2531016, -4.56727, 1, 0.6470588, 0, 1,
-1.321297, 0.07305607, -1.474987, 1, 0.654902, 0, 1,
-1.319268, -0.9448457, -2.402917, 1, 0.6588235, 0, 1,
-1.296751, 0.06483909, 0.9776956, 1, 0.6666667, 0, 1,
-1.273869, -1.375324, -2.238545, 1, 0.6705883, 0, 1,
-1.265017, 1.690866, -0.9615158, 1, 0.6784314, 0, 1,
-1.253443, -0.3371153, -2.903703, 1, 0.682353, 0, 1,
-1.248276, -0.2206616, -2.190046, 1, 0.6901961, 0, 1,
-1.239175, -0.245979, -1.869175, 1, 0.6941177, 0, 1,
-1.235715, 0.1152014, -1.089331, 1, 0.7019608, 0, 1,
-1.235381, 0.675847, -0.489243, 1, 0.7098039, 0, 1,
-1.234375, -0.07903366, 0.1779853, 1, 0.7137255, 0, 1,
-1.23398, -1.725482, -3.619023, 1, 0.7215686, 0, 1,
-1.231724, 0.63918, -2.128895, 1, 0.7254902, 0, 1,
-1.227667, -1.147615, -2.686244, 1, 0.7333333, 0, 1,
-1.22066, -0.1318634, -1.40201, 1, 0.7372549, 0, 1,
-1.218646, 1.177021, -0.7842744, 1, 0.7450981, 0, 1,
-1.21739, 2.024163, -0.6323381, 1, 0.7490196, 0, 1,
-1.215763, -1.566548, -1.751715, 1, 0.7568628, 0, 1,
-1.213466, 0.4487338, -1.742198, 1, 0.7607843, 0, 1,
-1.195179, -0.5052429, -0.9532697, 1, 0.7686275, 0, 1,
-1.189406, 0.9319637, 0.338995, 1, 0.772549, 0, 1,
-1.170275, 0.04004595, -0.4220232, 1, 0.7803922, 0, 1,
-1.169991, -0.6569363, -2.218709, 1, 0.7843137, 0, 1,
-1.162867, -0.3541242, -4.320959, 1, 0.7921569, 0, 1,
-1.161644, -0.925997, -1.548476, 1, 0.7960784, 0, 1,
-1.147434, 0.5947182, -0.4261005, 1, 0.8039216, 0, 1,
-1.140232, -1.792146, -1.524369, 1, 0.8117647, 0, 1,
-1.139377, 0.6678294, -0.137394, 1, 0.8156863, 0, 1,
-1.134056, 1.02377, -3.314675, 1, 0.8235294, 0, 1,
-1.121381, 0.3788632, -3.050905, 1, 0.827451, 0, 1,
-1.117426, 0.9694098, -1.170762, 1, 0.8352941, 0, 1,
-1.114779, -0.3723992, -2.289025, 1, 0.8392157, 0, 1,
-1.103194, -0.4765292, -1.370049, 1, 0.8470588, 0, 1,
-1.102303, 0.3502845, -0.868484, 1, 0.8509804, 0, 1,
-1.100852, -0.0376234, -0.04272524, 1, 0.8588235, 0, 1,
-1.095166, 0.1717273, -2.150452, 1, 0.8627451, 0, 1,
-1.084585, -0.4209205, -2.192728, 1, 0.8705882, 0, 1,
-1.080098, 1.099964, -0.03795746, 1, 0.8745098, 0, 1,
-1.074209, -0.5054502, -1.611334, 1, 0.8823529, 0, 1,
-1.068974, 1.554333, 0.6734095, 1, 0.8862745, 0, 1,
-1.064553, -1.291113, -2.222803, 1, 0.8941177, 0, 1,
-1.063244, 0.4618109, 0.9931856, 1, 0.8980392, 0, 1,
-1.063031, -0.4239003, -2.19491, 1, 0.9058824, 0, 1,
-1.060316, -2.725429, -3.016391, 1, 0.9137255, 0, 1,
-1.05936, -1.510647, -1.801613, 1, 0.9176471, 0, 1,
-1.055894, -0.5216544, -1.647364, 1, 0.9254902, 0, 1,
-1.055092, 0.7490079, -0.7082435, 1, 0.9294118, 0, 1,
-1.046677, 1.578104, -1.479634, 1, 0.9372549, 0, 1,
-1.037443, -0.3697147, -2.190994, 1, 0.9411765, 0, 1,
-1.025329, -2.307121, -2.082093, 1, 0.9490196, 0, 1,
-1.024583, 0.04543607, -1.304942, 1, 0.9529412, 0, 1,
-1.022983, -0.2632964, -1.063619, 1, 0.9607843, 0, 1,
-1.022578, -2.827272, -1.904508, 1, 0.9647059, 0, 1,
-1.013073, 0.1910777, -1.592142, 1, 0.972549, 0, 1,
-1.009566, -0.009516885, 0.1919671, 1, 0.9764706, 0, 1,
-1.008932, -2.058531, -1.176462, 1, 0.9843137, 0, 1,
-1.004865, -1.884142, -2.963953, 1, 0.9882353, 0, 1,
-1.002594, -1.13346, -1.46812, 1, 0.9960784, 0, 1,
-0.998838, -1.380466, -1.325641, 0.9960784, 1, 0, 1,
-0.9958174, -0.7740145, -1.970703, 0.9921569, 1, 0, 1,
-0.9876422, 1.341702, 1.004821, 0.9843137, 1, 0, 1,
-0.9861935, -0.6032191, -2.592191, 0.9803922, 1, 0, 1,
-0.9825749, -0.06334598, -1.466586, 0.972549, 1, 0, 1,
-0.9787936, 0.4936057, 0.05349011, 0.9686275, 1, 0, 1,
-0.976704, 0.9554541, -0.9579843, 0.9607843, 1, 0, 1,
-0.9458404, -0.0074373, -1.150558, 0.9568627, 1, 0, 1,
-0.9452701, 0.6194759, -1.676, 0.9490196, 1, 0, 1,
-0.9424795, 1.482318, -1.637846, 0.945098, 1, 0, 1,
-0.9371397, 0.1403855, -1.694997, 0.9372549, 1, 0, 1,
-0.930481, -0.7021085, -1.702806, 0.9333333, 1, 0, 1,
-0.9300678, 0.8969721, -1.682632, 0.9254902, 1, 0, 1,
-0.924813, 0.8359871, -1.433629, 0.9215686, 1, 0, 1,
-0.9154574, -0.4951663, -2.979764, 0.9137255, 1, 0, 1,
-0.9134379, -0.6347067, -1.313652, 0.9098039, 1, 0, 1,
-0.9132891, -0.4544007, -2.562638, 0.9019608, 1, 0, 1,
-0.9121158, -1.781361, -2.941036, 0.8941177, 1, 0, 1,
-0.9108201, -1.701851, -1.628796, 0.8901961, 1, 0, 1,
-0.9081598, -1.2823, -1.63426, 0.8823529, 1, 0, 1,
-0.8964798, 0.1844521, -0.9987496, 0.8784314, 1, 0, 1,
-0.8958271, 1.091068, -1.534196, 0.8705882, 1, 0, 1,
-0.8939432, 0.7844241, 0.6790019, 0.8666667, 1, 0, 1,
-0.891787, 1.904774, -0.237342, 0.8588235, 1, 0, 1,
-0.8907676, -0.3003438, -2.615303, 0.854902, 1, 0, 1,
-0.8907624, -0.6434721, -2.24098, 0.8470588, 1, 0, 1,
-0.8871908, 0.8122945, -0.3065558, 0.8431373, 1, 0, 1,
-0.8827475, 1.795314, -1.649733, 0.8352941, 1, 0, 1,
-0.878298, -1.041469, -1.74869, 0.8313726, 1, 0, 1,
-0.8716626, 1.79092, -1.08486, 0.8235294, 1, 0, 1,
-0.8696057, 1.474988, -2.186874, 0.8196079, 1, 0, 1,
-0.8656234, -0.6361272, -1.73807, 0.8117647, 1, 0, 1,
-0.8607817, -0.214969, -1.723887, 0.8078431, 1, 0, 1,
-0.8542041, -0.8787661, -1.24944, 0.8, 1, 0, 1,
-0.8463063, 0.5056705, -1.208227, 0.7921569, 1, 0, 1,
-0.8453521, -0.007868202, 1.032979, 0.7882353, 1, 0, 1,
-0.8381807, 0.04165425, -2.580357, 0.7803922, 1, 0, 1,
-0.8354434, 1.191282, -0.5999076, 0.7764706, 1, 0, 1,
-0.8305914, -1.66912, -3.759421, 0.7686275, 1, 0, 1,
-0.8270104, 0.02953103, -0.1108798, 0.7647059, 1, 0, 1,
-0.8222365, 1.222539, -0.8800411, 0.7568628, 1, 0, 1,
-0.8207745, -0.3761967, -2.476042, 0.7529412, 1, 0, 1,
-0.8175771, 1.551974, -1.225816, 0.7450981, 1, 0, 1,
-0.8140841, -1.300367, -2.97049, 0.7411765, 1, 0, 1,
-0.8132399, -0.7088443, -2.170066, 0.7333333, 1, 0, 1,
-0.8099465, 0.3448193, -2.831374, 0.7294118, 1, 0, 1,
-0.8089958, 0.1461811, -1.019477, 0.7215686, 1, 0, 1,
-0.8087519, 0.4606619, -0.8664051, 0.7176471, 1, 0, 1,
-0.8007972, -0.8349432, -1.713077, 0.7098039, 1, 0, 1,
-0.7997525, 0.2739431, -0.5324578, 0.7058824, 1, 0, 1,
-0.7989231, -0.1939574, -2.19208, 0.6980392, 1, 0, 1,
-0.7943887, 0.8774483, -1.563807, 0.6901961, 1, 0, 1,
-0.7886544, 0.844244, -0.2625082, 0.6862745, 1, 0, 1,
-0.7852604, -1.409582, -0.7728991, 0.6784314, 1, 0, 1,
-0.7840528, -1.040937, -2.484122, 0.6745098, 1, 0, 1,
-0.7838379, -1.234324, -4.319267, 0.6666667, 1, 0, 1,
-0.7785941, 0.03807419, -1.86911, 0.6627451, 1, 0, 1,
-0.7763228, 1.535977, -0.9773656, 0.654902, 1, 0, 1,
-0.7733181, -0.3487813, -2.159109, 0.6509804, 1, 0, 1,
-0.771836, -1.068096, -2.417975, 0.6431373, 1, 0, 1,
-0.7556347, 0.7789692, -0.7075064, 0.6392157, 1, 0, 1,
-0.7500181, -0.5830868, -1.661273, 0.6313726, 1, 0, 1,
-0.7480335, -0.9444153, -2.660321, 0.627451, 1, 0, 1,
-0.7459818, 2.164894, 0.198667, 0.6196079, 1, 0, 1,
-0.7374092, -0.416491, -0.7282785, 0.6156863, 1, 0, 1,
-0.7349969, -0.3794688, -3.1894, 0.6078432, 1, 0, 1,
-0.7331741, -0.5075119, -3.229244, 0.6039216, 1, 0, 1,
-0.7240944, -1.85577, -4.265094, 0.5960785, 1, 0, 1,
-0.7229454, -3.264181, -2.099451, 0.5882353, 1, 0, 1,
-0.722533, -0.01196143, -2.709278, 0.5843138, 1, 0, 1,
-0.7198773, -0.6766096, -2.961122, 0.5764706, 1, 0, 1,
-0.7191912, -0.1440686, -3.073425, 0.572549, 1, 0, 1,
-0.7156016, 0.5437084, -0.2186062, 0.5647059, 1, 0, 1,
-0.7139639, -0.6305946, -2.814311, 0.5607843, 1, 0, 1,
-0.7117877, 0.923355, -0.03696349, 0.5529412, 1, 0, 1,
-0.7108807, 1.532467, -0.6417232, 0.5490196, 1, 0, 1,
-0.7073467, 1.86204, 1.231313, 0.5411765, 1, 0, 1,
-0.7066649, 0.4916634, -2.174201, 0.5372549, 1, 0, 1,
-0.7025939, -0.8904243, -2.154548, 0.5294118, 1, 0, 1,
-0.6983145, -0.07866906, -1.857858, 0.5254902, 1, 0, 1,
-0.6902282, 0.06787802, -1.545661, 0.5176471, 1, 0, 1,
-0.6858506, -1.183744, -1.648643, 0.5137255, 1, 0, 1,
-0.683061, -1.746782, -2.535897, 0.5058824, 1, 0, 1,
-0.6820683, 0.6890097, -0.4464509, 0.5019608, 1, 0, 1,
-0.6760929, 0.9120785, -1.687653, 0.4941176, 1, 0, 1,
-0.6748098, 1.227057, 0.6352672, 0.4862745, 1, 0, 1,
-0.6742759, -0.6307255, -2.027834, 0.4823529, 1, 0, 1,
-0.6737196, -0.6734012, -3.073657, 0.4745098, 1, 0, 1,
-0.6666229, 0.5434285, -1.401575, 0.4705882, 1, 0, 1,
-0.662272, 1.07192, 1.559108, 0.4627451, 1, 0, 1,
-0.6562555, 1.768135, -1.609687, 0.4588235, 1, 0, 1,
-0.6527354, 0.9193742, -1.110116, 0.4509804, 1, 0, 1,
-0.6407669, 0.9905354, 0.8402717, 0.4470588, 1, 0, 1,
-0.6401945, 1.224573, -0.4524625, 0.4392157, 1, 0, 1,
-0.6387961, 1.448329, -0.1102265, 0.4352941, 1, 0, 1,
-0.6385025, 0.6934474, -0.7508002, 0.427451, 1, 0, 1,
-0.6335581, 0.238575, -1.617027, 0.4235294, 1, 0, 1,
-0.6324197, -0.7508667, -1.89155, 0.4156863, 1, 0, 1,
-0.6276449, -1.86117, -1.922036, 0.4117647, 1, 0, 1,
-0.6250425, 1.092344, 1.208705, 0.4039216, 1, 0, 1,
-0.620254, 0.3095568, -0.6171927, 0.3960784, 1, 0, 1,
-0.615869, 2.121505, -1.605432, 0.3921569, 1, 0, 1,
-0.6079858, -0.2344997, -0.9103433, 0.3843137, 1, 0, 1,
-0.6063119, -1.036893, -2.685942, 0.3803922, 1, 0, 1,
-0.6034156, 0.8287003, 0.2729293, 0.372549, 1, 0, 1,
-0.6028386, 0.9144797, 0.6057444, 0.3686275, 1, 0, 1,
-0.5910321, -0.7644541, -2.461842, 0.3607843, 1, 0, 1,
-0.5869917, -2.267526, -4.747494, 0.3568628, 1, 0, 1,
-0.5855383, -1.770305, -2.657053, 0.3490196, 1, 0, 1,
-0.5808336, 2.608179, -0.8436829, 0.345098, 1, 0, 1,
-0.5738648, 0.3821126, -1.114468, 0.3372549, 1, 0, 1,
-0.5733969, -0.2787126, -3.035828, 0.3333333, 1, 0, 1,
-0.5705585, 1.04473, -0.1908669, 0.3254902, 1, 0, 1,
-0.5705197, -0.10935, -0.8907422, 0.3215686, 1, 0, 1,
-0.5699198, 1.514811, -0.2146158, 0.3137255, 1, 0, 1,
-0.5694833, 0.008503315, -1.616697, 0.3098039, 1, 0, 1,
-0.5680267, -1.850902, -3.481415, 0.3019608, 1, 0, 1,
-0.5678429, 0.2861735, -0.5463269, 0.2941177, 1, 0, 1,
-0.5666986, 0.9430616, -1.543219, 0.2901961, 1, 0, 1,
-0.5656489, 1.523291, -1.488574, 0.282353, 1, 0, 1,
-0.5653569, 1.093732, -0.2622374, 0.2784314, 1, 0, 1,
-0.5626277, -0.8139703, -2.123891, 0.2705882, 1, 0, 1,
-0.5555102, 0.1166706, -0.6277149, 0.2666667, 1, 0, 1,
-0.5554775, 0.687851, -0.468262, 0.2588235, 1, 0, 1,
-0.5509318, -0.09300373, -2.169344, 0.254902, 1, 0, 1,
-0.5495923, -0.9965988, -4.136469, 0.2470588, 1, 0, 1,
-0.5434691, -0.9877695, -3.105751, 0.2431373, 1, 0, 1,
-0.5402427, -0.1163563, -2.409212, 0.2352941, 1, 0, 1,
-0.5392271, -1.527983, -3.092167, 0.2313726, 1, 0, 1,
-0.5390511, -0.07123002, -1.690912, 0.2235294, 1, 0, 1,
-0.538, -0.9788927, -2.760419, 0.2196078, 1, 0, 1,
-0.53601, 1.526974, 0.07566242, 0.2117647, 1, 0, 1,
-0.5288113, 0.4183577, -3.04241, 0.2078431, 1, 0, 1,
-0.528186, -0.3957445, -1.469506, 0.2, 1, 0, 1,
-0.5270842, 1.327017, -2.030597, 0.1921569, 1, 0, 1,
-0.5263798, 0.7457849, 0.036918, 0.1882353, 1, 0, 1,
-0.5260254, -1.239214, -4.964334, 0.1803922, 1, 0, 1,
-0.5233496, -1.390159, -1.965192, 0.1764706, 1, 0, 1,
-0.5227818, -0.3766533, -3.521916, 0.1686275, 1, 0, 1,
-0.5224606, -0.03555935, -2.065639, 0.1647059, 1, 0, 1,
-0.5192325, 0.3290272, -3.949362, 0.1568628, 1, 0, 1,
-0.5192079, -0.8153485, -4.091415, 0.1529412, 1, 0, 1,
-0.518465, -0.1858022, -1.640341, 0.145098, 1, 0, 1,
-0.5176591, -0.09781569, -2.204248, 0.1411765, 1, 0, 1,
-0.5168931, 1.83655, -0.1487286, 0.1333333, 1, 0, 1,
-0.5160671, 0.01437711, -0.06865957, 0.1294118, 1, 0, 1,
-0.5145429, -1.302559, -3.44249, 0.1215686, 1, 0, 1,
-0.5139675, -0.1351032, -1.071713, 0.1176471, 1, 0, 1,
-0.5133693, -0.1781733, -2.02319, 0.1098039, 1, 0, 1,
-0.5073403, -1.384364, -2.577397, 0.1058824, 1, 0, 1,
-0.4922999, 1.454469, -2.434115, 0.09803922, 1, 0, 1,
-0.4883933, -0.127171, -4.864522, 0.09019608, 1, 0, 1,
-0.4869683, -0.2087328, -1.795067, 0.08627451, 1, 0, 1,
-0.481528, 1.669198, -1.251391, 0.07843138, 1, 0, 1,
-0.4771818, -0.2806769, -1.69243, 0.07450981, 1, 0, 1,
-0.4747616, 1.626268, 2.041781, 0.06666667, 1, 0, 1,
-0.4690557, -0.5893619, -1.658212, 0.0627451, 1, 0, 1,
-0.4646417, 0.2112456, 0.6085092, 0.05490196, 1, 0, 1,
-0.4625713, 1.528509, 0.1248857, 0.05098039, 1, 0, 1,
-0.4570312, 2.143186, -0.08429316, 0.04313726, 1, 0, 1,
-0.4477671, -0.297507, -2.027668, 0.03921569, 1, 0, 1,
-0.4473011, -0.3768225, -2.48409, 0.03137255, 1, 0, 1,
-0.4437899, -0.7923455, -3.369013, 0.02745098, 1, 0, 1,
-0.4420301, -2.585406, -2.811571, 0.01960784, 1, 0, 1,
-0.4382838, -1.039087, -4.467494, 0.01568628, 1, 0, 1,
-0.4301439, 1.588899, -0.3671612, 0.007843138, 1, 0, 1,
-0.4240547, 0.1710635, -2.343194, 0.003921569, 1, 0, 1,
-0.4234147, -0.9167125, -2.264218, 0, 1, 0.003921569, 1,
-0.421254, -1.281005, -4.134617, 0, 1, 0.01176471, 1,
-0.4206536, -1.158689, -3.608386, 0, 1, 0.01568628, 1,
-0.4157461, -0.6276438, -3.591709, 0, 1, 0.02352941, 1,
-0.4157057, -0.167147, -1.312714, 0, 1, 0.02745098, 1,
-0.4149437, 1.42697, 0.5769765, 0, 1, 0.03529412, 1,
-0.41288, 1.315289, -0.5796525, 0, 1, 0.03921569, 1,
-0.4121705, -0.2399653, -3.349884, 0, 1, 0.04705882, 1,
-0.4108406, 1.290025, 1.643408, 0, 1, 0.05098039, 1,
-0.4066764, -1.47308, -2.637187, 0, 1, 0.05882353, 1,
-0.4042664, -1.103334, -3.896117, 0, 1, 0.0627451, 1,
-0.3996101, 1.634047, -1.223075, 0, 1, 0.07058824, 1,
-0.3910413, -1.175421, -2.078631, 0, 1, 0.07450981, 1,
-0.3909324, -1.526313, -3.923637, 0, 1, 0.08235294, 1,
-0.389282, -0.5486562, -0.646219, 0, 1, 0.08627451, 1,
-0.3866418, -1.277839, -2.905292, 0, 1, 0.09411765, 1,
-0.3809301, -0.177087, -1.182546, 0, 1, 0.1019608, 1,
-0.3739001, -0.1284622, -2.756534, 0, 1, 0.1058824, 1,
-0.3705904, 0.1718824, -1.665095, 0, 1, 0.1137255, 1,
-0.3684984, -0.605689, -3.716978, 0, 1, 0.1176471, 1,
-0.365015, 1.25376, 0.4641627, 0, 1, 0.1254902, 1,
-0.3593884, 0.1567936, -0.6002773, 0, 1, 0.1294118, 1,
-0.3592346, 1.930393, 0.7428214, 0, 1, 0.1372549, 1,
-0.358296, -1.103837, -3.982481, 0, 1, 0.1411765, 1,
-0.3513907, -0.2170827, -2.169932, 0, 1, 0.1490196, 1,
-0.3495413, 1.245717, -0.1139906, 0, 1, 0.1529412, 1,
-0.3468292, -0.6407267, -1.558333, 0, 1, 0.1607843, 1,
-0.3444406, -0.493477, -1.2339, 0, 1, 0.1647059, 1,
-0.3443058, 2.312842, -0.06599553, 0, 1, 0.172549, 1,
-0.3420192, 1.728847, 0.6632386, 0, 1, 0.1764706, 1,
-0.3337581, 0.8808788, -1.397283, 0, 1, 0.1843137, 1,
-0.3312357, 0.3363008, -1.781816, 0, 1, 0.1882353, 1,
-0.3271477, 0.9447488, -1.163882, 0, 1, 0.1960784, 1,
-0.3221414, -0.586733, -1.415828, 0, 1, 0.2039216, 1,
-0.3214148, 0.3013954, -0.6263207, 0, 1, 0.2078431, 1,
-0.3198154, -1.980657, -2.93185, 0, 1, 0.2156863, 1,
-0.3065342, 0.6177307, -0.2007524, 0, 1, 0.2196078, 1,
-0.304566, 0.4286311, -1.924952, 0, 1, 0.227451, 1,
-0.3024562, 1.323564, -0.845279, 0, 1, 0.2313726, 1,
-0.3017792, -0.6506481, -3.747629, 0, 1, 0.2392157, 1,
-0.2953623, -0.6010757, -3.055567, 0, 1, 0.2431373, 1,
-0.2933234, 0.09230896, -4.068916, 0, 1, 0.2509804, 1,
-0.2870325, -0.2737544, -3.215537, 0, 1, 0.254902, 1,
-0.2858981, 0.914944, -0.2364707, 0, 1, 0.2627451, 1,
-0.285201, 0.4012899, -0.4102401, 0, 1, 0.2666667, 1,
-0.2796513, 1.68075, 0.4947858, 0, 1, 0.2745098, 1,
-0.2787091, -0.8918334, -3.197286, 0, 1, 0.2784314, 1,
-0.2753093, 0.798451, -0.7699681, 0, 1, 0.2862745, 1,
-0.2744776, -1.088542, -4.535472, 0, 1, 0.2901961, 1,
-0.2721946, 0.1486105, -3.38974, 0, 1, 0.2980392, 1,
-0.2614245, -1.15552, -3.240854, 0, 1, 0.3058824, 1,
-0.2595955, -1.021199, -2.689019, 0, 1, 0.3098039, 1,
-0.259282, 0.5403345, 0.56757, 0, 1, 0.3176471, 1,
-0.2587531, -1.349417, -3.061627, 0, 1, 0.3215686, 1,
-0.2581353, 0.03780178, -0.8805057, 0, 1, 0.3294118, 1,
-0.2537332, 0.669109, -1.369355, 0, 1, 0.3333333, 1,
-0.253054, -0.7209663, -2.153721, 0, 1, 0.3411765, 1,
-0.2526427, -0.607363, -4.042132, 0, 1, 0.345098, 1,
-0.2488597, 0.7967504, -0.254086, 0, 1, 0.3529412, 1,
-0.2456335, -0.8255882, -3.556196, 0, 1, 0.3568628, 1,
-0.2382189, 0.8647173, -1.059842, 0, 1, 0.3647059, 1,
-0.2356881, -0.462378, -2.621248, 0, 1, 0.3686275, 1,
-0.2327611, 1.158789, 0.7208586, 0, 1, 0.3764706, 1,
-0.232085, 0.4639827, -1.962943, 0, 1, 0.3803922, 1,
-0.2283046, 0.1560419, -1.485566, 0, 1, 0.3882353, 1,
-0.2211612, -0.9574046, -2.657617, 0, 1, 0.3921569, 1,
-0.22092, 0.134593, -1.72372, 0, 1, 0.4, 1,
-0.2208808, -0.3925132, -2.174261, 0, 1, 0.4078431, 1,
-0.2202977, 0.02465381, -3.62334, 0, 1, 0.4117647, 1,
-0.2182875, 0.7407581, -0.142381, 0, 1, 0.4196078, 1,
-0.2174927, 0.1059493, 0.1395168, 0, 1, 0.4235294, 1,
-0.2146025, 0.604605, -0.7426723, 0, 1, 0.4313726, 1,
-0.2062224, 0.493955, -0.1978158, 0, 1, 0.4352941, 1,
-0.2036525, -0.2035812, -2.661887, 0, 1, 0.4431373, 1,
-0.2000265, -0.1475537, -2.757358, 0, 1, 0.4470588, 1,
-0.1994961, -1.395753, -3.903652, 0, 1, 0.454902, 1,
-0.1981694, 0.8524272, 0.1822773, 0, 1, 0.4588235, 1,
-0.1970982, 0.2630645, -0.5381084, 0, 1, 0.4666667, 1,
-0.1959041, 0.06952216, 0.2542148, 0, 1, 0.4705882, 1,
-0.1943428, 1.209695, -0.8522267, 0, 1, 0.4784314, 1,
-0.1932317, -0.9811075, -1.112719, 0, 1, 0.4823529, 1,
-0.1914455, -0.6611026, -1.515162, 0, 1, 0.4901961, 1,
-0.191426, 0.4479756, -1.073954, 0, 1, 0.4941176, 1,
-0.1865228, -0.1147521, -4.812593, 0, 1, 0.5019608, 1,
-0.185607, -0.4598152, -1.971591, 0, 1, 0.509804, 1,
-0.182564, -0.005623405, -1.15002, 0, 1, 0.5137255, 1,
-0.1821516, -0.7627566, -2.996789, 0, 1, 0.5215687, 1,
-0.1807774, 0.8220294, -0.876563, 0, 1, 0.5254902, 1,
-0.177846, -0.7353291, -2.441862, 0, 1, 0.5333334, 1,
-0.177002, 0.1798313, -0.2810721, 0, 1, 0.5372549, 1,
-0.1695576, -1.466508, -3.2408, 0, 1, 0.5450981, 1,
-0.1693007, -0.1850031, 0.03044203, 0, 1, 0.5490196, 1,
-0.1618597, 0.0473109, -1.773115, 0, 1, 0.5568628, 1,
-0.1536954, -1.370813, -2.583036, 0, 1, 0.5607843, 1,
-0.144072, 0.1995337, 2.423519, 0, 1, 0.5686275, 1,
-0.140371, -1.148324, -2.198823, 0, 1, 0.572549, 1,
-0.1380358, -0.1998487, -2.348858, 0, 1, 0.5803922, 1,
-0.1361766, 2.521966, -2.017869, 0, 1, 0.5843138, 1,
-0.1350014, -0.1786055, -2.692561, 0, 1, 0.5921569, 1,
-0.130712, 1.229712, 1.810923, 0, 1, 0.5960785, 1,
-0.1289064, -0.736196, -3.782822, 0, 1, 0.6039216, 1,
-0.12595, -0.9336572, -2.646074, 0, 1, 0.6117647, 1,
-0.1236418, -0.001182635, -0.1898437, 0, 1, 0.6156863, 1,
-0.1146906, 1.011961, -0.1752983, 0, 1, 0.6235294, 1,
-0.1137424, -0.8022986, -3.825535, 0, 1, 0.627451, 1,
-0.1112837, 0.2356417, -1.280293, 0, 1, 0.6352941, 1,
-0.1098329, 0.07051118, -0.738133, 0, 1, 0.6392157, 1,
-0.1096024, 0.5748066, -0.9070873, 0, 1, 0.6470588, 1,
-0.1077537, -0.16948, -1.06938, 0, 1, 0.6509804, 1,
-0.1066734, 0.4075585, -0.5710507, 0, 1, 0.6588235, 1,
-0.106161, -1.146205, -2.754651, 0, 1, 0.6627451, 1,
-0.104543, 0.6459712, 0.2933042, 0, 1, 0.6705883, 1,
-0.1040028, 1.053854, -0.8898019, 0, 1, 0.6745098, 1,
-0.1019993, -0.1013845, -1.311672, 0, 1, 0.682353, 1,
-0.1014609, -0.7097996, -3.653217, 0, 1, 0.6862745, 1,
-0.1012238, 1.360182, 0.591363, 0, 1, 0.6941177, 1,
-0.09990649, 1.509063, -0.3571503, 0, 1, 0.7019608, 1,
-0.09867766, -0.4434314, -4.876621, 0, 1, 0.7058824, 1,
-0.09514952, -1.561349, -3.098982, 0, 1, 0.7137255, 1,
-0.09494226, -0.987472, -3.229493, 0, 1, 0.7176471, 1,
-0.08951373, 1.696504, -0.2361846, 0, 1, 0.7254902, 1,
-0.08661364, 0.6711817, -0.5679072, 0, 1, 0.7294118, 1,
-0.08530246, 1.360034, 0.9414318, 0, 1, 0.7372549, 1,
-0.08027889, -0.875659, -2.71724, 0, 1, 0.7411765, 1,
-0.07864504, -0.004004221, -1.814951, 0, 1, 0.7490196, 1,
-0.07758879, 0.7134778, -1.240744, 0, 1, 0.7529412, 1,
-0.07685344, -0.6126379, -1.349242, 0, 1, 0.7607843, 1,
-0.07524839, -0.728959, -2.641747, 0, 1, 0.7647059, 1,
-0.07501166, 0.09456257, 0.2440339, 0, 1, 0.772549, 1,
-0.07429196, 0.5802749, -0.06664642, 0, 1, 0.7764706, 1,
-0.07353824, 0.01243951, -1.628133, 0, 1, 0.7843137, 1,
-0.07223756, -0.6702528, -1.99616, 0, 1, 0.7882353, 1,
-0.07216982, 0.3778711, -1.165577, 0, 1, 0.7960784, 1,
-0.06948791, 1.111519, -0.3723855, 0, 1, 0.8039216, 1,
-0.06801909, -0.4079162, -2.497132, 0, 1, 0.8078431, 1,
-0.06552051, -0.1537803, -2.861129, 0, 1, 0.8156863, 1,
-0.06492105, 1.042771, -1.078472, 0, 1, 0.8196079, 1,
-0.06407823, -0.9518703, -4.812016, 0, 1, 0.827451, 1,
-0.06205744, 0.4712135, -1.303968, 0, 1, 0.8313726, 1,
-0.0588298, 1.383639, -0.5365073, 0, 1, 0.8392157, 1,
-0.05816013, 0.3199274, 0.9134275, 0, 1, 0.8431373, 1,
-0.05797899, -0.1275102, -1.464676, 0, 1, 0.8509804, 1,
-0.05784576, 1.312929, -1.052465, 0, 1, 0.854902, 1,
-0.05241629, 0.9619385, 0.5681361, 0, 1, 0.8627451, 1,
-0.04811417, -0.4232076, -3.093851, 0, 1, 0.8666667, 1,
-0.04581184, -0.3076534, -4.399939, 0, 1, 0.8745098, 1,
-0.04413396, -0.1851539, -4.427373, 0, 1, 0.8784314, 1,
-0.04388608, -0.3309563, -3.148898, 0, 1, 0.8862745, 1,
-0.03960579, -0.9831951, -3.471795, 0, 1, 0.8901961, 1,
-0.03911263, -0.4894348, -3.049764, 0, 1, 0.8980392, 1,
-0.03816686, -1.880198, -2.707715, 0, 1, 0.9058824, 1,
-0.03733304, 1.445877, -1.73965, 0, 1, 0.9098039, 1,
-0.03500424, 0.8216575, -0.2291151, 0, 1, 0.9176471, 1,
-0.03363321, 0.4769413, 0.468209, 0, 1, 0.9215686, 1,
-0.0322508, -0.09205791, -2.277087, 0, 1, 0.9294118, 1,
-0.03121522, 0.5164422, 0.3435183, 0, 1, 0.9333333, 1,
-0.02956805, 1.968123, -1.315652, 0, 1, 0.9411765, 1,
-0.02833911, 0.6953137, -1.214967, 0, 1, 0.945098, 1,
-0.02667938, -0.2929721, -1.193661, 0, 1, 0.9529412, 1,
-0.02091402, -0.600155, -3.560174, 0, 1, 0.9568627, 1,
-0.01898029, -0.1300483, -1.952145, 0, 1, 0.9647059, 1,
-0.01791251, 0.8773654, -1.038695, 0, 1, 0.9686275, 1,
-0.01128848, -0.5431299, -3.01879, 0, 1, 0.9764706, 1,
-0.003617545, 0.3128346, -0.08777284, 0, 1, 0.9803922, 1,
0.001369024, 0.5284626, -1.770362, 0, 1, 0.9882353, 1,
0.001961168, -2.554698, 4.148643, 0, 1, 0.9921569, 1,
0.002465211, 1.930993, -0.3097128, 0, 1, 1, 1,
0.005451763, 0.4825567, 0.1200628, 0, 0.9921569, 1, 1,
0.006228962, -0.4053409, 4.66131, 0, 0.9882353, 1, 1,
0.007270181, -2.257972, 2.653004, 0, 0.9803922, 1, 1,
0.01179317, 1.653134, 0.2753356, 0, 0.9764706, 1, 1,
0.01854338, 1.042231, -0.3279529, 0, 0.9686275, 1, 1,
0.01947267, -0.2756532, 1.952586, 0, 0.9647059, 1, 1,
0.02001817, 0.258803, 0.1974155, 0, 0.9568627, 1, 1,
0.02115828, -1.004604, 1.759072, 0, 0.9529412, 1, 1,
0.0225694, -0.6920202, 3.655996, 0, 0.945098, 1, 1,
0.02637, -0.6884113, 2.635476, 0, 0.9411765, 1, 1,
0.02827677, 1.405235, -0.9130751, 0, 0.9333333, 1, 1,
0.03148136, 0.472432, -0.02326723, 0, 0.9294118, 1, 1,
0.03259782, 0.8629449, 0.3202343, 0, 0.9215686, 1, 1,
0.03467767, -0.9404722, 2.459414, 0, 0.9176471, 1, 1,
0.03920506, 0.1674256, -1.430786, 0, 0.9098039, 1, 1,
0.04126113, -3.036602, 4.425513, 0, 0.9058824, 1, 1,
0.04310946, -0.01359697, 0.5845088, 0, 0.8980392, 1, 1,
0.04544565, 0.403907, 2.1655, 0, 0.8901961, 1, 1,
0.05529664, -0.8489802, 5.776291, 0, 0.8862745, 1, 1,
0.05632294, 1.04395, -1.146686, 0, 0.8784314, 1, 1,
0.06770292, -0.9405186, 1.346686, 0, 0.8745098, 1, 1,
0.07015137, -1.440254, 2.646905, 0, 0.8666667, 1, 1,
0.07184111, 1.696328, 3.330668, 0, 0.8627451, 1, 1,
0.07394657, 1.011781, -0.6432885, 0, 0.854902, 1, 1,
0.07428958, 0.106948, -0.1525297, 0, 0.8509804, 1, 1,
0.07886934, 0.7198157, -0.4381312, 0, 0.8431373, 1, 1,
0.08057277, -0.3885869, 3.683608, 0, 0.8392157, 1, 1,
0.08194875, 0.4555251, 0.6600229, 0, 0.8313726, 1, 1,
0.08202029, 1.742625, 0.483489, 0, 0.827451, 1, 1,
0.08286592, 0.7013571, 0.3741485, 0, 0.8196079, 1, 1,
0.08337027, 0.7891623, 0.6312095, 0, 0.8156863, 1, 1,
0.0884457, -0.6659094, 2.484291, 0, 0.8078431, 1, 1,
0.08931459, -0.275508, 2.066054, 0, 0.8039216, 1, 1,
0.09448433, 0.4773403, 0.07177501, 0, 0.7960784, 1, 1,
0.09925636, 1.173445, -0.445109, 0, 0.7882353, 1, 1,
0.1159689, -0.7792, 2.079669, 0, 0.7843137, 1, 1,
0.1169443, 2.427841, -1.114179, 0, 0.7764706, 1, 1,
0.1170908, 1.517607, 0.7594965, 0, 0.772549, 1, 1,
0.117731, -0.3701832, 1.431283, 0, 0.7647059, 1, 1,
0.1235055, 0.1245184, 1.154794, 0, 0.7607843, 1, 1,
0.1240957, -0.7000809, 3.191756, 0, 0.7529412, 1, 1,
0.1250428, 0.07343605, 2.450537, 0, 0.7490196, 1, 1,
0.1281346, -0.0353751, 1.112353, 0, 0.7411765, 1, 1,
0.1302978, -0.9631656, 3.483575, 0, 0.7372549, 1, 1,
0.1307857, 0.5937482, -0.01515154, 0, 0.7294118, 1, 1,
0.1317427, 0.8726351, 0.259483, 0, 0.7254902, 1, 1,
0.1350737, -2.640184, 5.043794, 0, 0.7176471, 1, 1,
0.1355127, 0.789692, -0.1151138, 0, 0.7137255, 1, 1,
0.1355992, 2.135173, 1.396274, 0, 0.7058824, 1, 1,
0.1373594, 1.215885, -1.130871, 0, 0.6980392, 1, 1,
0.1383086, 2.100681, -0.1436693, 0, 0.6941177, 1, 1,
0.1402113, -1.377889, 3.99508, 0, 0.6862745, 1, 1,
0.140613, 1.553205, -0.2775401, 0, 0.682353, 1, 1,
0.1417559, 0.09308425, 0.5534294, 0, 0.6745098, 1, 1,
0.1480144, -1.497439, 2.817248, 0, 0.6705883, 1, 1,
0.1490932, -1.299913, 2.10408, 0, 0.6627451, 1, 1,
0.1508304, 0.3973784, 2.393713, 0, 0.6588235, 1, 1,
0.1518701, 0.3994061, -0.9291948, 0, 0.6509804, 1, 1,
0.1520652, -1.526214, 3.02477, 0, 0.6470588, 1, 1,
0.1526186, -1.132229, 2.065996, 0, 0.6392157, 1, 1,
0.1530562, -0.2167802, 2.322722, 0, 0.6352941, 1, 1,
0.1571864, 0.4653585, -0.2128292, 0, 0.627451, 1, 1,
0.1658638, 0.8678916, 1.307857, 0, 0.6235294, 1, 1,
0.166302, 1.675529, 1.139282, 0, 0.6156863, 1, 1,
0.1713892, 1.416895, 0.3857158, 0, 0.6117647, 1, 1,
0.1732516, 0.4108692, 0.2515846, 0, 0.6039216, 1, 1,
0.173862, -0.2342266, 2.15813, 0, 0.5960785, 1, 1,
0.1758056, -1.379457, 3.430445, 0, 0.5921569, 1, 1,
0.1781604, 0.4149911, 0.5606763, 0, 0.5843138, 1, 1,
0.1808709, 1.7537, 0.8053677, 0, 0.5803922, 1, 1,
0.1834807, 1.519343, 0.5533845, 0, 0.572549, 1, 1,
0.1834918, -0.7713243, 2.338262, 0, 0.5686275, 1, 1,
0.1837568, 1.168182, -2.225388, 0, 0.5607843, 1, 1,
0.185077, -0.1331325, 2.059065, 0, 0.5568628, 1, 1,
0.189338, -0.1948285, 1.987593, 0, 0.5490196, 1, 1,
0.1935972, 1.028398, 0.2952003, 0, 0.5450981, 1, 1,
0.1936933, -0.03818472, 2.973704, 0, 0.5372549, 1, 1,
0.203051, -0.0859589, 1.462414, 0, 0.5333334, 1, 1,
0.2075933, -1.346635, 2.783109, 0, 0.5254902, 1, 1,
0.2103979, 1.033988, -0.855657, 0, 0.5215687, 1, 1,
0.210655, -0.136671, 1.672819, 0, 0.5137255, 1, 1,
0.217542, -2.14649, 3.501628, 0, 0.509804, 1, 1,
0.2184298, -0.4468183, 1.25365, 0, 0.5019608, 1, 1,
0.2331489, -2.200826, 2.506746, 0, 0.4941176, 1, 1,
0.2340034, -0.1781685, 2.58185, 0, 0.4901961, 1, 1,
0.2373323, 1.284241, 0.1311287, 0, 0.4823529, 1, 1,
0.2387439, -1.250979, 4.129932, 0, 0.4784314, 1, 1,
0.244022, -0.8940428, 3.636353, 0, 0.4705882, 1, 1,
0.2493912, -1.125995, 2.099823, 0, 0.4666667, 1, 1,
0.2517445, 0.6448612, 1.010717, 0, 0.4588235, 1, 1,
0.2522867, 0.2408248, 0.9451874, 0, 0.454902, 1, 1,
0.2546495, -0.3007684, 0.5921849, 0, 0.4470588, 1, 1,
0.2625878, 0.2118999, 2.532713, 0, 0.4431373, 1, 1,
0.2651798, -0.8514566, 2.467044, 0, 0.4352941, 1, 1,
0.2686121, 0.3187892, 0.6462183, 0, 0.4313726, 1, 1,
0.2704245, 0.6713098, -0.08169074, 0, 0.4235294, 1, 1,
0.2711563, -1.951791, 3.628376, 0, 0.4196078, 1, 1,
0.2723536, -0.8381882, 2.800411, 0, 0.4117647, 1, 1,
0.2779942, -0.05441758, 2.383973, 0, 0.4078431, 1, 1,
0.2850243, 0.4974165, 1.992128, 0, 0.4, 1, 1,
0.2880507, -1.252409, 4.084456, 0, 0.3921569, 1, 1,
0.2896282, 0.02795403, 0.4809126, 0, 0.3882353, 1, 1,
0.2930439, -0.4081666, 1.635103, 0, 0.3803922, 1, 1,
0.2937148, -0.8675154, 4.44764, 0, 0.3764706, 1, 1,
0.2955686, 0.8229431, 0.4094293, 0, 0.3686275, 1, 1,
0.2980638, -0.2224394, 2.13398, 0, 0.3647059, 1, 1,
0.2995371, -1.082655, 2.709061, 0, 0.3568628, 1, 1,
0.3045263, -0.9036014, 3.37185, 0, 0.3529412, 1, 1,
0.3067836, 0.563444, 0.6718154, 0, 0.345098, 1, 1,
0.309664, -0.8758401, 1.283289, 0, 0.3411765, 1, 1,
0.3098614, 0.4794873, -0.2571546, 0, 0.3333333, 1, 1,
0.313329, 0.1285901, 1.354529, 0, 0.3294118, 1, 1,
0.3190225, 0.8947992, -0.6056178, 0, 0.3215686, 1, 1,
0.3238474, 0.6768527, -0.5470365, 0, 0.3176471, 1, 1,
0.3286479, 0.1507954, 1.794683, 0, 0.3098039, 1, 1,
0.3296661, 0.1164418, 1.227986, 0, 0.3058824, 1, 1,
0.3327354, -0.5915904, 0.9944555, 0, 0.2980392, 1, 1,
0.3334792, -0.7809629, 3.960386, 0, 0.2901961, 1, 1,
0.3369149, -0.8336101, 2.931039, 0, 0.2862745, 1, 1,
0.3379428, -0.5083529, 2.650164, 0, 0.2784314, 1, 1,
0.3393542, 0.1809536, 0.7127886, 0, 0.2745098, 1, 1,
0.341096, 0.03605974, 0.8051717, 0, 0.2666667, 1, 1,
0.3451628, 1.118721, -0.915076, 0, 0.2627451, 1, 1,
0.345371, -1.058372, 3.641278, 0, 0.254902, 1, 1,
0.3508098, 0.5179168, -0.1120704, 0, 0.2509804, 1, 1,
0.352394, -0.3564726, 0.4448031, 0, 0.2431373, 1, 1,
0.3530516, 2.57662, -0.228009, 0, 0.2392157, 1, 1,
0.3531309, -0.7217591, 2.447301, 0, 0.2313726, 1, 1,
0.365909, -0.3347951, 2.925489, 0, 0.227451, 1, 1,
0.3661407, -1.285842, 2.335148, 0, 0.2196078, 1, 1,
0.36688, -1.079022, 3.304401, 0, 0.2156863, 1, 1,
0.367236, -0.35805, 0.5542035, 0, 0.2078431, 1, 1,
0.3693523, 1.232196, 0.168965, 0, 0.2039216, 1, 1,
0.3700157, 0.6017453, -0.4328882, 0, 0.1960784, 1, 1,
0.3701862, -0.4775201, 2.990427, 0, 0.1882353, 1, 1,
0.3706068, -0.7906816, 2.931792, 0, 0.1843137, 1, 1,
0.3730816, 1.522547, -0.001329732, 0, 0.1764706, 1, 1,
0.3759269, 0.8461986, 0.00651175, 0, 0.172549, 1, 1,
0.3778552, 1.40573, -1.068012, 0, 0.1647059, 1, 1,
0.3828106, 0.5726529, 1.218393, 0, 0.1607843, 1, 1,
0.3844902, -0.235551, 2.684181, 0, 0.1529412, 1, 1,
0.3876857, -0.1240707, 2.224455, 0, 0.1490196, 1, 1,
0.3879686, -0.5579008, 2.793513, 0, 0.1411765, 1, 1,
0.3880868, -1.263137, 2.906193, 0, 0.1372549, 1, 1,
0.3922944, -0.3347845, 2.332652, 0, 0.1294118, 1, 1,
0.3927638, -1.116831, 2.642609, 0, 0.1254902, 1, 1,
0.3966633, 0.155958, 2.344191, 0, 0.1176471, 1, 1,
0.4025641, 0.6734443, 0.2709018, 0, 0.1137255, 1, 1,
0.4064736, 1.908558, 0.3872462, 0, 0.1058824, 1, 1,
0.408585, -0.8240284, 1.073613, 0, 0.09803922, 1, 1,
0.4134677, -2.007142, 3.362024, 0, 0.09411765, 1, 1,
0.4154202, 0.2734333, 1.560485, 0, 0.08627451, 1, 1,
0.4167209, 1.573866, 0.08695565, 0, 0.08235294, 1, 1,
0.4243121, 1.778828, 1.587306, 0, 0.07450981, 1, 1,
0.425036, 1.124189, 0.277772, 0, 0.07058824, 1, 1,
0.4261191, 0.6341981, -0.01212881, 0, 0.0627451, 1, 1,
0.429944, -0.3557271, 1.544072, 0, 0.05882353, 1, 1,
0.4322293, 1.466771, 2.416925, 0, 0.05098039, 1, 1,
0.4358584, 0.5531119, 2.241245, 0, 0.04705882, 1, 1,
0.4379945, 0.01834437, 2.260871, 0, 0.03921569, 1, 1,
0.4405105, -0.7979594, 2.853024, 0, 0.03529412, 1, 1,
0.4415835, -0.3851768, 2.833557, 0, 0.02745098, 1, 1,
0.4421997, 0.8797889, 0.2599073, 0, 0.02352941, 1, 1,
0.4462842, 0.3070127, 2.652111, 0, 0.01568628, 1, 1,
0.4513624, -2.339881, 3.561394, 0, 0.01176471, 1, 1,
0.4518951, 1.875107, 0.08573555, 0, 0.003921569, 1, 1,
0.4546322, 0.8888028, 2.188179, 0.003921569, 0, 1, 1,
0.4593436, -0.5925602, 2.935152, 0.007843138, 0, 1, 1,
0.4612553, 1.325551, 0.8084449, 0.01568628, 0, 1, 1,
0.463485, 0.1276655, 1.996611, 0.01960784, 0, 1, 1,
0.4645383, 0.5757669, 2.246675, 0.02745098, 0, 1, 1,
0.4666731, 0.7098323, -0.8278068, 0.03137255, 0, 1, 1,
0.4704556, 0.8436487, 1.814446, 0.03921569, 0, 1, 1,
0.4714189, 1.183724, 0.691341, 0.04313726, 0, 1, 1,
0.4739064, 2.232572, -1.475683, 0.05098039, 0, 1, 1,
0.4745143, -0.9232325, 2.625459, 0.05490196, 0, 1, 1,
0.4746696, -0.07180479, 3.103884, 0.0627451, 0, 1, 1,
0.4751319, -1.086347, 2.900052, 0.06666667, 0, 1, 1,
0.4759023, -0.3234188, -0.04392825, 0.07450981, 0, 1, 1,
0.4760503, -0.9932233, 3.304272, 0.07843138, 0, 1, 1,
0.477272, 0.1829858, 1.172824, 0.08627451, 0, 1, 1,
0.4864975, -1.844728, 2.784399, 0.09019608, 0, 1, 1,
0.4910216, 0.2967989, 0.307095, 0.09803922, 0, 1, 1,
0.4939002, -0.3574669, -0.03529487, 0.1058824, 0, 1, 1,
0.4973537, -1.044816, 1.638842, 0.1098039, 0, 1, 1,
0.4978541, -1.591378, 2.719881, 0.1176471, 0, 1, 1,
0.4981249, 0.2854237, -0.1339752, 0.1215686, 0, 1, 1,
0.5006502, 2.060626, 2.126475, 0.1294118, 0, 1, 1,
0.5038844, 0.4288369, 0.6056849, 0.1333333, 0, 1, 1,
0.510162, 0.6504317, 0.2045223, 0.1411765, 0, 1, 1,
0.5130647, 2.79099, -0.9671432, 0.145098, 0, 1, 1,
0.515175, -0.6456464, 2.18108, 0.1529412, 0, 1, 1,
0.5214301, -0.6902994, 2.547424, 0.1568628, 0, 1, 1,
0.5215412, -0.9067383, 1.577081, 0.1647059, 0, 1, 1,
0.5217766, -0.06508245, 0.5758325, 0.1686275, 0, 1, 1,
0.5286071, -1.848554, 3.624356, 0.1764706, 0, 1, 1,
0.5296556, 0.0840897, 1.389217, 0.1803922, 0, 1, 1,
0.5302037, -0.7054754, 2.711178, 0.1882353, 0, 1, 1,
0.5303101, -0.4653565, 2.575388, 0.1921569, 0, 1, 1,
0.5307299, -0.9858217, 2.387715, 0.2, 0, 1, 1,
0.5324289, 1.342729, 0.3997509, 0.2078431, 0, 1, 1,
0.5432241, 1.263254, -1.243217, 0.2117647, 0, 1, 1,
0.5433223, 0.1278455, 0.7982834, 0.2196078, 0, 1, 1,
0.5456827, 0.7970437, 1.317011, 0.2235294, 0, 1, 1,
0.5490081, -0.1166237, 1.207864, 0.2313726, 0, 1, 1,
0.5531548, 0.6053601, 0.3537084, 0.2352941, 0, 1, 1,
0.5538812, 0.3766949, 1.221394, 0.2431373, 0, 1, 1,
0.5549733, 2.627235, -0.7573658, 0.2470588, 0, 1, 1,
0.5567914, 0.6144955, 1.165692, 0.254902, 0, 1, 1,
0.5650995, 0.9608797, 1.188376, 0.2588235, 0, 1, 1,
0.5676217, 0.1946225, 1.599161, 0.2666667, 0, 1, 1,
0.5682329, 0.6817635, 0.1698725, 0.2705882, 0, 1, 1,
0.5698792, 1.150198, 1.800287, 0.2784314, 0, 1, 1,
0.5773892, 0.8279328, -0.09235363, 0.282353, 0, 1, 1,
0.5805613, -0.2318509, 2.520212, 0.2901961, 0, 1, 1,
0.5846816, 0.08201542, 0.9668464, 0.2941177, 0, 1, 1,
0.5934237, -0.201913, 1.320435, 0.3019608, 0, 1, 1,
0.5989718, -0.5010465, 2.098533, 0.3098039, 0, 1, 1,
0.6006977, 0.4372568, 2.536806, 0.3137255, 0, 1, 1,
0.6036362, -0.5663018, 1.696139, 0.3215686, 0, 1, 1,
0.6068949, -1.024607, 2.450464, 0.3254902, 0, 1, 1,
0.6088893, -1.659411, 2.951227, 0.3333333, 0, 1, 1,
0.6106066, -0.03568069, 2.94409, 0.3372549, 0, 1, 1,
0.6140546, -0.623084, 1.406681, 0.345098, 0, 1, 1,
0.6141027, 1.721918, 1.388258, 0.3490196, 0, 1, 1,
0.6143744, -0.6238534, 1.972681, 0.3568628, 0, 1, 1,
0.6158071, 0.7857504, -0.566782, 0.3607843, 0, 1, 1,
0.6162236, -1.494196, 3.829968, 0.3686275, 0, 1, 1,
0.617125, -1.620106, 1.229944, 0.372549, 0, 1, 1,
0.6212991, -2.239131, 2.526406, 0.3803922, 0, 1, 1,
0.6213054, 0.08872641, 1.50286, 0.3843137, 0, 1, 1,
0.6223729, -0.446181, 4.27822, 0.3921569, 0, 1, 1,
0.6244473, -0.9611686, 2.317348, 0.3960784, 0, 1, 1,
0.6359258, -0.007008673, 1.032061, 0.4039216, 0, 1, 1,
0.6376205, 1.246328, 0.4473373, 0.4117647, 0, 1, 1,
0.6453698, -0.2317592, 1.35571, 0.4156863, 0, 1, 1,
0.6465225, 1.204828, 2.167336, 0.4235294, 0, 1, 1,
0.6492648, -0.4288394, 2.456476, 0.427451, 0, 1, 1,
0.6498591, -0.5933371, 2.239666, 0.4352941, 0, 1, 1,
0.6509196, 0.6999559, 0.6262316, 0.4392157, 0, 1, 1,
0.6519251, 0.8575595, 0.530636, 0.4470588, 0, 1, 1,
0.6519717, 0.8086921, 1.157394, 0.4509804, 0, 1, 1,
0.6628463, -1.055711, 2.279394, 0.4588235, 0, 1, 1,
0.664413, 0.4863474, 1.012457, 0.4627451, 0, 1, 1,
0.6644917, 0.6198655, 1.400991, 0.4705882, 0, 1, 1,
0.6666703, 0.3504929, 2.102196, 0.4745098, 0, 1, 1,
0.6718754, 1.779518, 0.8788037, 0.4823529, 0, 1, 1,
0.6770011, -0.2674288, 3.551488, 0.4862745, 0, 1, 1,
0.6830899, -0.8408157, 3.910126, 0.4941176, 0, 1, 1,
0.683669, -0.1515123, 1.214052, 0.5019608, 0, 1, 1,
0.6846362, 0.5903022, 0.3877979, 0.5058824, 0, 1, 1,
0.6852009, -2.304901, 3.556795, 0.5137255, 0, 1, 1,
0.6942019, -0.0210554, 0.4374644, 0.5176471, 0, 1, 1,
0.7033067, 1.363924, -0.4427588, 0.5254902, 0, 1, 1,
0.7033998, -2.545909, 3.877584, 0.5294118, 0, 1, 1,
0.7053484, -0.7380493, 3.579013, 0.5372549, 0, 1, 1,
0.7088919, 1.412092, 1.309604, 0.5411765, 0, 1, 1,
0.7195753, -0.2775153, 2.869619, 0.5490196, 0, 1, 1,
0.7195934, -0.5878137, 3.187705, 0.5529412, 0, 1, 1,
0.7310258, -1.173734, 3.683289, 0.5607843, 0, 1, 1,
0.7357054, -0.2307408, 2.315446, 0.5647059, 0, 1, 1,
0.7359619, -0.7549776, 2.820949, 0.572549, 0, 1, 1,
0.7415164, 0.2125048, -0.003313039, 0.5764706, 0, 1, 1,
0.7431349, -0.7954182, 0.658661, 0.5843138, 0, 1, 1,
0.7466775, 0.3872466, 1.318935, 0.5882353, 0, 1, 1,
0.7484607, -0.09280829, 0.6386307, 0.5960785, 0, 1, 1,
0.7488816, 0.7338963, 0.3739425, 0.6039216, 0, 1, 1,
0.7515742, -0.9715747, 2.572453, 0.6078432, 0, 1, 1,
0.7567257, -0.3273159, 1.520641, 0.6156863, 0, 1, 1,
0.75683, 0.4095513, 1.31045, 0.6196079, 0, 1, 1,
0.7601894, 0.9366693, 1.211297, 0.627451, 0, 1, 1,
0.7609167, -0.1269553, 1.311908, 0.6313726, 0, 1, 1,
0.7621465, -2.132849, 2.54369, 0.6392157, 0, 1, 1,
0.7621722, -1.061787, 1.207562, 0.6431373, 0, 1, 1,
0.7657383, -0.440962, 1.74804, 0.6509804, 0, 1, 1,
0.7658865, 0.4330445, 0.1082948, 0.654902, 0, 1, 1,
0.7690511, 0.5615918, -0.1711735, 0.6627451, 0, 1, 1,
0.7715409, -1.264269, 1.269196, 0.6666667, 0, 1, 1,
0.7804375, 0.2617285, 1.622428, 0.6745098, 0, 1, 1,
0.7925592, 1.012637, -1.689968, 0.6784314, 0, 1, 1,
0.7949779, 0.6379899, 2.661589, 0.6862745, 0, 1, 1,
0.7952401, 0.4791816, 0.134405, 0.6901961, 0, 1, 1,
0.7981757, 0.1519581, 1.449706, 0.6980392, 0, 1, 1,
0.7987961, 0.3918037, 1.804844, 0.7058824, 0, 1, 1,
0.8011006, 0.9659984, -0.6162795, 0.7098039, 0, 1, 1,
0.8041468, -0.7758749, 0.9868237, 0.7176471, 0, 1, 1,
0.8066981, 0.1579417, 0.603298, 0.7215686, 0, 1, 1,
0.8142616, -0.03504175, 0.3349012, 0.7294118, 0, 1, 1,
0.8173852, -1.316902, 2.023102, 0.7333333, 0, 1, 1,
0.8180565, -1.1387, 3.014164, 0.7411765, 0, 1, 1,
0.8182811, -1.465859, 1.742684, 0.7450981, 0, 1, 1,
0.8231716, -0.1268411, 2.27411, 0.7529412, 0, 1, 1,
0.8404006, 0.5884718, 1.46358, 0.7568628, 0, 1, 1,
0.8423901, 1.693648, 2.181429, 0.7647059, 0, 1, 1,
0.8458796, 2.248939, 0.2779479, 0.7686275, 0, 1, 1,
0.8488587, 0.0335113, 2.285607, 0.7764706, 0, 1, 1,
0.8504862, -0.3943197, 3.1147, 0.7803922, 0, 1, 1,
0.8522429, 0.8369576, -0.9642072, 0.7882353, 0, 1, 1,
0.855651, -0.6856025, 3.4357, 0.7921569, 0, 1, 1,
0.8556929, 0.3654512, -0.1955602, 0.8, 0, 1, 1,
0.8584424, -2.365891, 1.897219, 0.8078431, 0, 1, 1,
0.8718387, 0.04310589, 1.592353, 0.8117647, 0, 1, 1,
0.872022, 0.6590741, 1.444852, 0.8196079, 0, 1, 1,
0.8726557, 0.2096411, 1.932597, 0.8235294, 0, 1, 1,
0.8759372, -1.680254, 4.155227, 0.8313726, 0, 1, 1,
0.8817638, 0.8650434, 0.5281883, 0.8352941, 0, 1, 1,
0.8823332, -0.9705095, 2.189035, 0.8431373, 0, 1, 1,
0.8826699, -0.6235025, 1.873718, 0.8470588, 0, 1, 1,
0.8828182, 1.379954, 2.1546, 0.854902, 0, 1, 1,
0.8847398, -0.7148442, 0.8952019, 0.8588235, 0, 1, 1,
0.8895311, -0.8130373, 3.409416, 0.8666667, 0, 1, 1,
0.8935727, 0.2473924, 1.382933, 0.8705882, 0, 1, 1,
0.9117267, 0.05019706, 1.399801, 0.8784314, 0, 1, 1,
0.9252442, -0.7672982, 0.7960422, 0.8823529, 0, 1, 1,
0.9272683, -0.6119188, 1.05702, 0.8901961, 0, 1, 1,
0.9347368, -0.4473259, -0.2292737, 0.8941177, 0, 1, 1,
0.9359804, -0.3477807, 3.081189, 0.9019608, 0, 1, 1,
0.9404081, -1.091596, 2.437496, 0.9098039, 0, 1, 1,
0.9435406, -0.314157, 1.711477, 0.9137255, 0, 1, 1,
0.9532214, -1.688198, 1.832815, 0.9215686, 0, 1, 1,
0.9642597, -1.720806, 2.241638, 0.9254902, 0, 1, 1,
0.9665858, -0.251373, 1.280054, 0.9333333, 0, 1, 1,
0.9683812, 0.4051726, 1.540802, 0.9372549, 0, 1, 1,
0.9736096, -1.366289, 2.284432, 0.945098, 0, 1, 1,
0.975588, -0.4903788, 2.29651, 0.9490196, 0, 1, 1,
0.981775, 0.07277077, 1.393499, 0.9568627, 0, 1, 1,
0.9930943, -0.1070248, 1.977098, 0.9607843, 0, 1, 1,
0.9942266, -2.14165, 2.278611, 0.9686275, 0, 1, 1,
0.9951581, -1.35798, 2.909406, 0.972549, 0, 1, 1,
1.007109, -1.353316, 4.045777, 0.9803922, 0, 1, 1,
1.008622, -1.266035, 0.9873203, 0.9843137, 0, 1, 1,
1.012705, 0.4671035, -0.5755833, 0.9921569, 0, 1, 1,
1.016421, 0.3053673, 2.402371, 0.9960784, 0, 1, 1,
1.024127, -0.2483327, 1.545485, 1, 0, 0.9960784, 1,
1.033898, 0.3535166, 0.1860101, 1, 0, 0.9882353, 1,
1.041875, -0.3930022, 2.993303, 1, 0, 0.9843137, 1,
1.045337, -1.176605, 1.277933, 1, 0, 0.9764706, 1,
1.047391, 1.113155, -0.2978021, 1, 0, 0.972549, 1,
1.05202, 0.9510047, 1.587391, 1, 0, 0.9647059, 1,
1.054372, -0.03132832, 2.610887, 1, 0, 0.9607843, 1,
1.062606, 0.1206004, 0.7155441, 1, 0, 0.9529412, 1,
1.062887, -2.348338, 3.190583, 1, 0, 0.9490196, 1,
1.072089, -0.5141621, 0.3691236, 1, 0, 0.9411765, 1,
1.07327, -0.7420068, 1.201031, 1, 0, 0.9372549, 1,
1.074257, 1.429726, 0.2239192, 1, 0, 0.9294118, 1,
1.075153, -0.3487198, 2.579509, 1, 0, 0.9254902, 1,
1.079162, -0.9215683, 2.661632, 1, 0, 0.9176471, 1,
1.081306, 0.1036637, 2.775789, 1, 0, 0.9137255, 1,
1.08371, 0.2923093, 1.417434, 1, 0, 0.9058824, 1,
1.088521, -0.2376876, 1.002077, 1, 0, 0.9019608, 1,
1.089214, -0.3914877, 1.061082, 1, 0, 0.8941177, 1,
1.09212, 0.8008423, 1.82223, 1, 0, 0.8862745, 1,
1.09478, -0.2793456, 0.6212701, 1, 0, 0.8823529, 1,
1.104118, 0.4845243, 0.05490077, 1, 0, 0.8745098, 1,
1.106443, -0.8850601, 1.129905, 1, 0, 0.8705882, 1,
1.108807, 1.862992, -0.5855725, 1, 0, 0.8627451, 1,
1.111677, 1.456093, -1.375018, 1, 0, 0.8588235, 1,
1.114538, 0.244407, 1.669324, 1, 0, 0.8509804, 1,
1.12125, -0.3418661, 1.541093, 1, 0, 0.8470588, 1,
1.128821, 1.926225, 0.5952467, 1, 0, 0.8392157, 1,
1.130921, 0.791733, 1.015636, 1, 0, 0.8352941, 1,
1.136136, 0.4876894, 0.1377734, 1, 0, 0.827451, 1,
1.139256, -0.6782741, 1.311604, 1, 0, 0.8235294, 1,
1.140557, 0.8906512, -0.4534591, 1, 0, 0.8156863, 1,
1.142644, 0.3266563, 1.160786, 1, 0, 0.8117647, 1,
1.148613, -0.9259825, 2.249893, 1, 0, 0.8039216, 1,
1.157483, -1.843419, 2.819695, 1, 0, 0.7960784, 1,
1.161121, 0.2442799, 0.9461948, 1, 0, 0.7921569, 1,
1.166046, -0.06368854, -0.2705277, 1, 0, 0.7843137, 1,
1.183985, -0.3117723, 1.107656, 1, 0, 0.7803922, 1,
1.184658, 1.107055, 0.5618979, 1, 0, 0.772549, 1,
1.186249, 0.499624, 1.501134, 1, 0, 0.7686275, 1,
1.193781, 0.1052029, -0.2408461, 1, 0, 0.7607843, 1,
1.196345, -0.144718, 1.944581, 1, 0, 0.7568628, 1,
1.201613, 1.224688, 1.629138, 1, 0, 0.7490196, 1,
1.20295, -0.5402545, 2.989282, 1, 0, 0.7450981, 1,
1.208326, 1.102773, 3.294469, 1, 0, 0.7372549, 1,
1.214975, 0.693605, 1.043767, 1, 0, 0.7333333, 1,
1.219029, -0.5505399, 2.132354, 1, 0, 0.7254902, 1,
1.222125, -2.220011, 2.324803, 1, 0, 0.7215686, 1,
1.223155, -1.432534, 3.567723, 1, 0, 0.7137255, 1,
1.228366, -1.441399, 1.942217, 1, 0, 0.7098039, 1,
1.2291, 2.235391, 1.282382, 1, 0, 0.7019608, 1,
1.230403, 0.475839, 0.4276686, 1, 0, 0.6941177, 1,
1.230766, -0.6487128, 2.824723, 1, 0, 0.6901961, 1,
1.240638, 1.033539, 1.378518, 1, 0, 0.682353, 1,
1.241718, -1.189775, 2.679952, 1, 0, 0.6784314, 1,
1.241867, -0.2496469, 1.64516, 1, 0, 0.6705883, 1,
1.246667, 1.378583, 1.510242, 1, 0, 0.6666667, 1,
1.247527, -1.353235, 1.028123, 1, 0, 0.6588235, 1,
1.254344, 0.7018836, 0.9945378, 1, 0, 0.654902, 1,
1.255076, -0.540701, -0.134149, 1, 0, 0.6470588, 1,
1.255161, -0.9602042, 3.683361, 1, 0, 0.6431373, 1,
1.261003, -0.8346036, 2.794153, 1, 0, 0.6352941, 1,
1.269118, -0.111827, 1.078061, 1, 0, 0.6313726, 1,
1.269293, -0.3639746, 1.901934, 1, 0, 0.6235294, 1,
1.272538, 0.2423619, -0.705045, 1, 0, 0.6196079, 1,
1.273759, 1.229671, 0.8071352, 1, 0, 0.6117647, 1,
1.282026, -1.509769, 1.843409, 1, 0, 0.6078432, 1,
1.289655, 0.9544409, 2.163888, 1, 0, 0.6, 1,
1.300998, 3.062143, 0.6624029, 1, 0, 0.5921569, 1,
1.302276, 0.2750313, 2.327976, 1, 0, 0.5882353, 1,
1.307081, 2.001669, 0.3642294, 1, 0, 0.5803922, 1,
1.308234, 0.6005225, -0.7613574, 1, 0, 0.5764706, 1,
1.309939, 0.5247875, 0.4632044, 1, 0, 0.5686275, 1,
1.317301, -1.614152, 1.628068, 1, 0, 0.5647059, 1,
1.320335, -1.179163, 4.060625, 1, 0, 0.5568628, 1,
1.324913, -0.8208957, 1.391812, 1, 0, 0.5529412, 1,
1.326263, -0.4174302, 1.92608, 1, 0, 0.5450981, 1,
1.336884, 1.371545, 0.139084, 1, 0, 0.5411765, 1,
1.337671, 1.126885, 0.9337975, 1, 0, 0.5333334, 1,
1.342709, 0.05044985, 2.387076, 1, 0, 0.5294118, 1,
1.351897, 1.274553, 0.28844, 1, 0, 0.5215687, 1,
1.35292, 0.5278385, 3.902027, 1, 0, 0.5176471, 1,
1.358047, 0.6250077, 0.7740746, 1, 0, 0.509804, 1,
1.358938, -1.210771, 0.471784, 1, 0, 0.5058824, 1,
1.359345, -0.8756596, 2.028895, 1, 0, 0.4980392, 1,
1.370967, -0.6604831, 0.9071555, 1, 0, 0.4901961, 1,
1.380522, -0.09880482, 3.005534, 1, 0, 0.4862745, 1,
1.38326, -0.1733161, 0.8345374, 1, 0, 0.4784314, 1,
1.393681, 0.2607003, 0.1171295, 1, 0, 0.4745098, 1,
1.404669, -0.06234358, 2.47653, 1, 0, 0.4666667, 1,
1.407767, 0.05841844, 0.03619817, 1, 0, 0.4627451, 1,
1.410458, 1.113614, 3.073524, 1, 0, 0.454902, 1,
1.411445, 0.3073342, 1.653159, 1, 0, 0.4509804, 1,
1.420802, 0.08697832, 3.247264, 1, 0, 0.4431373, 1,
1.421384, -0.4021401, 3.163769, 1, 0, 0.4392157, 1,
1.429298, -0.9535232, 2.93445, 1, 0, 0.4313726, 1,
1.439981, -1.073046, 1.183903, 1, 0, 0.427451, 1,
1.441055, -0.2988537, 1.245311, 1, 0, 0.4196078, 1,
1.44219, 0.300434, 2.130883, 1, 0, 0.4156863, 1,
1.447184, 0.8386713, 1.863346, 1, 0, 0.4078431, 1,
1.453648, 0.436218, 2.626128, 1, 0, 0.4039216, 1,
1.45721, -0.1951395, 1.600443, 1, 0, 0.3960784, 1,
1.463829, -1.663738, 2.403873, 1, 0, 0.3882353, 1,
1.466012, 0.9165085, 1.541895, 1, 0, 0.3843137, 1,
1.468093, -1.504869, 3.295873, 1, 0, 0.3764706, 1,
1.469097, -0.09353764, 2.230866, 1, 0, 0.372549, 1,
1.472312, 2.776389, -0.01311717, 1, 0, 0.3647059, 1,
1.498495, 1.077537, 1.902387, 1, 0, 0.3607843, 1,
1.505912, -0.8033649, 1.813911, 1, 0, 0.3529412, 1,
1.510349, -0.9709328, 0.2853312, 1, 0, 0.3490196, 1,
1.52993, -1.003273, 3.027111, 1, 0, 0.3411765, 1,
1.530513, 1.334355, 2.624752, 1, 0, 0.3372549, 1,
1.53404, -0.2505958, 3.808792, 1, 0, 0.3294118, 1,
1.536174, 1.578095, 1.641615, 1, 0, 0.3254902, 1,
1.540354, 0.07018904, 0.426106, 1, 0, 0.3176471, 1,
1.540519, 1.823476, 0.6903168, 1, 0, 0.3137255, 1,
1.548906, -1.571261, 2.968205, 1, 0, 0.3058824, 1,
1.566565, 1.03124, 2.698231, 1, 0, 0.2980392, 1,
1.568763, -1.378707, 0.5924501, 1, 0, 0.2941177, 1,
1.605595, 1.762936, 0.3090744, 1, 0, 0.2862745, 1,
1.607361, -0.02893897, 2.669009, 1, 0, 0.282353, 1,
1.629078, -0.08590437, 1.260772, 1, 0, 0.2745098, 1,
1.637034, 0.164242, -0.7259101, 1, 0, 0.2705882, 1,
1.637633, -1.413007, -0.2944377, 1, 0, 0.2627451, 1,
1.646049, -0.1138132, 1.925344, 1, 0, 0.2588235, 1,
1.646746, 0.9347463, 1.331866, 1, 0, 0.2509804, 1,
1.648513, -1.332507, 1.48237, 1, 0, 0.2470588, 1,
1.65062, -1.510665, 2.879082, 1, 0, 0.2392157, 1,
1.653674, 0.5151854, 0.2327525, 1, 0, 0.2352941, 1,
1.667269, 1.001211, 0.6348146, 1, 0, 0.227451, 1,
1.66881, -0.1040251, 3.335949, 1, 0, 0.2235294, 1,
1.704092, -0.3166139, 1.330635, 1, 0, 0.2156863, 1,
1.704924, 2.036615, 2.001862, 1, 0, 0.2117647, 1,
1.73573, 1.334323, 1.696634, 1, 0, 0.2039216, 1,
1.738536, -1.646491, 0.4783469, 1, 0, 0.1960784, 1,
1.764875, -0.6437266, 3.450031, 1, 0, 0.1921569, 1,
1.777996, 1.815023, 0.450995, 1, 0, 0.1843137, 1,
1.788272, 0.8425172, 1.358557, 1, 0, 0.1803922, 1,
1.788683, 0.7972296, 2.357825, 1, 0, 0.172549, 1,
1.793608, 0.04286195, 0.6658842, 1, 0, 0.1686275, 1,
1.803762, -0.5988151, 2.483087, 1, 0, 0.1607843, 1,
1.807471, 0.6609812, 1.242469, 1, 0, 0.1568628, 1,
1.811695, 1.03656, 2.827459, 1, 0, 0.1490196, 1,
1.825585, -0.2060616, 2.015808, 1, 0, 0.145098, 1,
1.849442, -0.523664, 0.3845101, 1, 0, 0.1372549, 1,
1.855115, 0.5421513, 1.431059, 1, 0, 0.1333333, 1,
1.856494, 0.6254106, 1.882146, 1, 0, 0.1254902, 1,
1.868764, -0.7730887, 1.994308, 1, 0, 0.1215686, 1,
1.87475, -1.038634, 1.912001, 1, 0, 0.1137255, 1,
1.928876, 2.078362, 0.1407175, 1, 0, 0.1098039, 1,
2.012722, -0.4503432, 2.072361, 1, 0, 0.1019608, 1,
2.023453, 2.037368, -0.7482174, 1, 0, 0.09411765, 1,
2.056615, -0.6626586, 1.849599, 1, 0, 0.09019608, 1,
2.069711, 0.07171076, 1.549827, 1, 0, 0.08235294, 1,
2.123308, -2.018384, 2.300593, 1, 0, 0.07843138, 1,
2.146151, -0.2560594, 1.303632, 1, 0, 0.07058824, 1,
2.184165, 1.291696, 1.596256, 1, 0, 0.06666667, 1,
2.206855, 0.1319811, 3.400684, 1, 0, 0.05882353, 1,
2.218488, -1.300519, 2.4533, 1, 0, 0.05490196, 1,
2.231377, -0.6444337, 2.214316, 1, 0, 0.04705882, 1,
2.395612, -0.04529966, 1.705768, 1, 0, 0.04313726, 1,
2.4707, -0.04100024, 1.869026, 1, 0, 0.03529412, 1,
2.470847, -0.2363105, 0.7900967, 1, 0, 0.03137255, 1,
2.548834, 0.3574286, 0.4733686, 1, 0, 0.02352941, 1,
2.625292, 1.405151, 0.7119328, 1, 0, 0.01960784, 1,
2.745924, -1.591655, 1.11579, 1, 0, 0.01176471, 1,
3.007813, -0.2109239, 0.2062415, 1, 0, 0.007843138, 1
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
-0.07920229, -4.336493, -6.78487, 0, -0.5, 0.5, 0.5,
-0.07920229, -4.336493, -6.78487, 1, -0.5, 0.5, 0.5,
-0.07920229, -4.336493, -6.78487, 1, 1.5, 0.5, 0.5,
-0.07920229, -4.336493, -6.78487, 0, 1.5, 0.5, 0.5
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
-4.212716, -0.1010191, -6.78487, 0, -0.5, 0.5, 0.5,
-4.212716, -0.1010191, -6.78487, 1, -0.5, 0.5, 0.5,
-4.212716, -0.1010191, -6.78487, 1, 1.5, 0.5, 0.5,
-4.212716, -0.1010191, -6.78487, 0, 1.5, 0.5, 0.5
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
-4.212716, -4.336493, 0.4059789, 0, -0.5, 0.5, 0.5,
-4.212716, -4.336493, 0.4059789, 1, -0.5, 0.5, 0.5,
-4.212716, -4.336493, 0.4059789, 1, 1.5, 0.5, 0.5,
-4.212716, -4.336493, 0.4059789, 0, 1.5, 0.5, 0.5
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
-3, -3.359076, -5.125443,
3, -3.359076, -5.125443,
-3, -3.359076, -5.125443,
-3, -3.521979, -5.402014,
-2, -3.359076, -5.125443,
-2, -3.521979, -5.402014,
-1, -3.359076, -5.125443,
-1, -3.521979, -5.402014,
0, -3.359076, -5.125443,
0, -3.521979, -5.402014,
1, -3.359076, -5.125443,
1, -3.521979, -5.402014,
2, -3.359076, -5.125443,
2, -3.521979, -5.402014,
3, -3.359076, -5.125443,
3, -3.521979, -5.402014
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
-3, -3.847785, -5.955156, 0, -0.5, 0.5, 0.5,
-3, -3.847785, -5.955156, 1, -0.5, 0.5, 0.5,
-3, -3.847785, -5.955156, 1, 1.5, 0.5, 0.5,
-3, -3.847785, -5.955156, 0, 1.5, 0.5, 0.5,
-2, -3.847785, -5.955156, 0, -0.5, 0.5, 0.5,
-2, -3.847785, -5.955156, 1, -0.5, 0.5, 0.5,
-2, -3.847785, -5.955156, 1, 1.5, 0.5, 0.5,
-2, -3.847785, -5.955156, 0, 1.5, 0.5, 0.5,
-1, -3.847785, -5.955156, 0, -0.5, 0.5, 0.5,
-1, -3.847785, -5.955156, 1, -0.5, 0.5, 0.5,
-1, -3.847785, -5.955156, 1, 1.5, 0.5, 0.5,
-1, -3.847785, -5.955156, 0, 1.5, 0.5, 0.5,
0, -3.847785, -5.955156, 0, -0.5, 0.5, 0.5,
0, -3.847785, -5.955156, 1, -0.5, 0.5, 0.5,
0, -3.847785, -5.955156, 1, 1.5, 0.5, 0.5,
0, -3.847785, -5.955156, 0, 1.5, 0.5, 0.5,
1, -3.847785, -5.955156, 0, -0.5, 0.5, 0.5,
1, -3.847785, -5.955156, 1, -0.5, 0.5, 0.5,
1, -3.847785, -5.955156, 1, 1.5, 0.5, 0.5,
1, -3.847785, -5.955156, 0, 1.5, 0.5, 0.5,
2, -3.847785, -5.955156, 0, -0.5, 0.5, 0.5,
2, -3.847785, -5.955156, 1, -0.5, 0.5, 0.5,
2, -3.847785, -5.955156, 1, 1.5, 0.5, 0.5,
2, -3.847785, -5.955156, 0, 1.5, 0.5, 0.5,
3, -3.847785, -5.955156, 0, -0.5, 0.5, 0.5,
3, -3.847785, -5.955156, 1, -0.5, 0.5, 0.5,
3, -3.847785, -5.955156, 1, 1.5, 0.5, 0.5,
3, -3.847785, -5.955156, 0, 1.5, 0.5, 0.5
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
-3.258828, -3, -5.125443,
-3.258828, 3, -5.125443,
-3.258828, -3, -5.125443,
-3.417809, -3, -5.402014,
-3.258828, -2, -5.125443,
-3.417809, -2, -5.402014,
-3.258828, -1, -5.125443,
-3.417809, -1, -5.402014,
-3.258828, 0, -5.125443,
-3.417809, 0, -5.402014,
-3.258828, 1, -5.125443,
-3.417809, 1, -5.402014,
-3.258828, 2, -5.125443,
-3.417809, 2, -5.402014,
-3.258828, 3, -5.125443,
-3.417809, 3, -5.402014
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
-3.735772, -3, -5.955156, 0, -0.5, 0.5, 0.5,
-3.735772, -3, -5.955156, 1, -0.5, 0.5, 0.5,
-3.735772, -3, -5.955156, 1, 1.5, 0.5, 0.5,
-3.735772, -3, -5.955156, 0, 1.5, 0.5, 0.5,
-3.735772, -2, -5.955156, 0, -0.5, 0.5, 0.5,
-3.735772, -2, -5.955156, 1, -0.5, 0.5, 0.5,
-3.735772, -2, -5.955156, 1, 1.5, 0.5, 0.5,
-3.735772, -2, -5.955156, 0, 1.5, 0.5, 0.5,
-3.735772, -1, -5.955156, 0, -0.5, 0.5, 0.5,
-3.735772, -1, -5.955156, 1, -0.5, 0.5, 0.5,
-3.735772, -1, -5.955156, 1, 1.5, 0.5, 0.5,
-3.735772, -1, -5.955156, 0, 1.5, 0.5, 0.5,
-3.735772, 0, -5.955156, 0, -0.5, 0.5, 0.5,
-3.735772, 0, -5.955156, 1, -0.5, 0.5, 0.5,
-3.735772, 0, -5.955156, 1, 1.5, 0.5, 0.5,
-3.735772, 0, -5.955156, 0, 1.5, 0.5, 0.5,
-3.735772, 1, -5.955156, 0, -0.5, 0.5, 0.5,
-3.735772, 1, -5.955156, 1, -0.5, 0.5, 0.5,
-3.735772, 1, -5.955156, 1, 1.5, 0.5, 0.5,
-3.735772, 1, -5.955156, 0, 1.5, 0.5, 0.5,
-3.735772, 2, -5.955156, 0, -0.5, 0.5, 0.5,
-3.735772, 2, -5.955156, 1, -0.5, 0.5, 0.5,
-3.735772, 2, -5.955156, 1, 1.5, 0.5, 0.5,
-3.735772, 2, -5.955156, 0, 1.5, 0.5, 0.5,
-3.735772, 3, -5.955156, 0, -0.5, 0.5, 0.5,
-3.735772, 3, -5.955156, 1, -0.5, 0.5, 0.5,
-3.735772, 3, -5.955156, 1, 1.5, 0.5, 0.5,
-3.735772, 3, -5.955156, 0, 1.5, 0.5, 0.5
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
-3.258828, -3.359076, -4,
-3.258828, -3.359076, 4,
-3.258828, -3.359076, -4,
-3.417809, -3.521979, -4,
-3.258828, -3.359076, -2,
-3.417809, -3.521979, -2,
-3.258828, -3.359076, 0,
-3.417809, -3.521979, 0,
-3.258828, -3.359076, 2,
-3.417809, -3.521979, 2,
-3.258828, -3.359076, 4,
-3.417809, -3.521979, 4
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
-3.735772, -3.847785, -4, 0, -0.5, 0.5, 0.5,
-3.735772, -3.847785, -4, 1, -0.5, 0.5, 0.5,
-3.735772, -3.847785, -4, 1, 1.5, 0.5, 0.5,
-3.735772, -3.847785, -4, 0, 1.5, 0.5, 0.5,
-3.735772, -3.847785, -2, 0, -0.5, 0.5, 0.5,
-3.735772, -3.847785, -2, 1, -0.5, 0.5, 0.5,
-3.735772, -3.847785, -2, 1, 1.5, 0.5, 0.5,
-3.735772, -3.847785, -2, 0, 1.5, 0.5, 0.5,
-3.735772, -3.847785, 0, 0, -0.5, 0.5, 0.5,
-3.735772, -3.847785, 0, 1, -0.5, 0.5, 0.5,
-3.735772, -3.847785, 0, 1, 1.5, 0.5, 0.5,
-3.735772, -3.847785, 0, 0, 1.5, 0.5, 0.5,
-3.735772, -3.847785, 2, 0, -0.5, 0.5, 0.5,
-3.735772, -3.847785, 2, 1, -0.5, 0.5, 0.5,
-3.735772, -3.847785, 2, 1, 1.5, 0.5, 0.5,
-3.735772, -3.847785, 2, 0, 1.5, 0.5, 0.5,
-3.735772, -3.847785, 4, 0, -0.5, 0.5, 0.5,
-3.735772, -3.847785, 4, 1, -0.5, 0.5, 0.5,
-3.735772, -3.847785, 4, 1, 1.5, 0.5, 0.5,
-3.735772, -3.847785, 4, 0, 1.5, 0.5, 0.5
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
-3.258828, -3.359076, -5.125443,
-3.258828, 3.157038, -5.125443,
-3.258828, -3.359076, 5.937401,
-3.258828, 3.157038, 5.937401,
-3.258828, -3.359076, -5.125443,
-3.258828, -3.359076, 5.937401,
-3.258828, 3.157038, -5.125443,
-3.258828, 3.157038, 5.937401,
-3.258828, -3.359076, -5.125443,
3.100423, -3.359076, -5.125443,
-3.258828, -3.359076, 5.937401,
3.100423, -3.359076, 5.937401,
-3.258828, 3.157038, -5.125443,
3.100423, 3.157038, -5.125443,
-3.258828, 3.157038, 5.937401,
3.100423, 3.157038, 5.937401,
3.100423, -3.359076, -5.125443,
3.100423, 3.157038, -5.125443,
3.100423, -3.359076, 5.937401,
3.100423, 3.157038, 5.937401,
3.100423, -3.359076, -5.125443,
3.100423, -3.359076, 5.937401,
3.100423, 3.157038, -5.125443,
3.100423, 3.157038, 5.937401
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
var radius = 7.650776;
var distance = 34.03917;
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
mvMatrix.translate( 0.07920229, 0.1010191, -0.4059789 );
mvMatrix.scale( 1.300809, 1.269494, 0.7477434 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.03917);
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
siduron<-read.table("siduron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-siduron$V2
```

```
## Error in eval(expr, envir, enclos): object 'siduron' not found
```

```r
y<-siduron$V3
```

```
## Error in eval(expr, envir, enclos): object 'siduron' not found
```

```r
z<-siduron$V4
```

```
## Error in eval(expr, envir, enclos): object 'siduron' not found
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
-3.166217, 0.9513716, -1.558044, 0, 0, 1, 1, 1,
-2.872141, -0.8205889, 0.1974694, 1, 0, 0, 1, 1,
-2.756539, -0.7300442, -2.154717, 1, 0, 0, 1, 1,
-2.754412, -0.1438735, -1.268945, 1, 0, 0, 1, 1,
-2.715006, -0.3340389, -1.332257, 1, 0, 0, 1, 1,
-2.694992, 1.323983, -0.4959559, 1, 0, 0, 1, 1,
-2.673702, -0.707171, -3.03993, 0, 0, 0, 1, 1,
-2.660894, -0.01040449, -0.8883934, 0, 0, 0, 1, 1,
-2.558748, -0.9269099, -2.372084, 0, 0, 0, 1, 1,
-2.29704, -0.1029616, -3.258151, 0, 0, 0, 1, 1,
-2.296335, -0.4442922, -1.581693, 0, 0, 0, 1, 1,
-2.235038, 1.018877, -0.6740938, 0, 0, 0, 1, 1,
-2.228174, -0.9148311, -2.479985, 0, 0, 0, 1, 1,
-2.22446, -0.1020752, -0.5672514, 1, 1, 1, 1, 1,
-2.208117, -0.962811, -1.449, 1, 1, 1, 1, 1,
-2.205488, -0.3763298, -2.355773, 1, 1, 1, 1, 1,
-2.182119, 0.8032113, -0.8911044, 1, 1, 1, 1, 1,
-2.17068, 1.322227, -0.1168929, 1, 1, 1, 1, 1,
-2.165203, -3.059826, -1.9031, 1, 1, 1, 1, 1,
-2.146753, -0.4066226, -0.01097999, 1, 1, 1, 1, 1,
-2.146258, -1.067789, -2.131638, 1, 1, 1, 1, 1,
-2.139233, 1.602327, -1.484536, 1, 1, 1, 1, 1,
-2.129897, -0.7707777, -0.8913664, 1, 1, 1, 1, 1,
-2.128319, 0.5586436, -2.108709, 1, 1, 1, 1, 1,
-2.066187, 0.3417621, -1.912385, 1, 1, 1, 1, 1,
-2.053089, 0.1653062, -1.609038, 1, 1, 1, 1, 1,
-2.037392, 0.2241557, -0.3825058, 1, 1, 1, 1, 1,
-2.034017, -0.2429482, -3.413537, 1, 1, 1, 1, 1,
-1.987441, -0.3878128, -2.387117, 0, 0, 1, 1, 1,
-1.980562, -1.640913, -2.371888, 1, 0, 0, 1, 1,
-1.953186, 0.1262865, -1.925037, 1, 0, 0, 1, 1,
-1.912859, -1.436474, -0.5980762, 1, 0, 0, 1, 1,
-1.909927, 1.586208, 0.7050933, 1, 0, 0, 1, 1,
-1.909042, -0.3977832, -3.279129, 1, 0, 0, 1, 1,
-1.8849, 2.243781, -1.929208, 0, 0, 0, 1, 1,
-1.856607, -0.3988499, -1.639904, 0, 0, 0, 1, 1,
-1.852232, 2.152496, 0.1971031, 0, 0, 0, 1, 1,
-1.845699, -1.217825, -2.574619, 0, 0, 0, 1, 1,
-1.839586, 0.2719289, -1.056835, 0, 0, 0, 1, 1,
-1.839328, 0.1603791, -1.356659, 0, 0, 0, 1, 1,
-1.814099, -0.8186356, -0.6532583, 0, 0, 0, 1, 1,
-1.811537, 0.1120676, -1.333061, 1, 1, 1, 1, 1,
-1.796162, -1.818953, -1.735652, 1, 1, 1, 1, 1,
-1.789138, -0.9631509, -1.920444, 1, 1, 1, 1, 1,
-1.782446, 0.7727751, 0.0782325, 1, 1, 1, 1, 1,
-1.782391, 0.4750391, -1.703688, 1, 1, 1, 1, 1,
-1.779162, -0.8334449, -0.9446474, 1, 1, 1, 1, 1,
-1.770752, -0.8841183, -2.605055, 1, 1, 1, 1, 1,
-1.767033, 0.9468809, -2.189529, 1, 1, 1, 1, 1,
-1.758214, -1.500925, -1.423454, 1, 1, 1, 1, 1,
-1.757016, 1.193245, -0.7400385, 1, 1, 1, 1, 1,
-1.755904, -1.058563, -1.371648, 1, 1, 1, 1, 1,
-1.746036, -0.2892421, -2.313773, 1, 1, 1, 1, 1,
-1.739621, 0.1749207, -2.885408, 1, 1, 1, 1, 1,
-1.738168, -0.1061399, -2.954963, 1, 1, 1, 1, 1,
-1.728701, 0.636295, -2.574545, 1, 1, 1, 1, 1,
-1.708513, 0.2511654, -0.7300782, 0, 0, 1, 1, 1,
-1.708308, -1.492108, -4.560649, 1, 0, 0, 1, 1,
-1.684039, -0.2197069, -2.228457, 1, 0, 0, 1, 1,
-1.673881, -0.5450298, -2.793096, 1, 0, 0, 1, 1,
-1.673753, -0.2547908, -2.934669, 1, 0, 0, 1, 1,
-1.655433, -0.2960723, -2.366499, 1, 0, 0, 1, 1,
-1.650485, -1.344783, -1.198199, 0, 0, 0, 1, 1,
-1.642346, 0.5671706, 1.421688, 0, 0, 0, 1, 1,
-1.635914, -0.03305339, -0.7796363, 0, 0, 0, 1, 1,
-1.618874, -1.044515, -2.524879, 0, 0, 0, 1, 1,
-1.592449, 0.4851882, -1.07479, 0, 0, 0, 1, 1,
-1.592098, -0.6805646, -0.9384779, 0, 0, 0, 1, 1,
-1.57678, 0.7314287, -0.6252587, 0, 0, 0, 1, 1,
-1.574932, 0.8925902, 0.5088798, 1, 1, 1, 1, 1,
-1.567776, 0.5718154, -1.544457, 1, 1, 1, 1, 1,
-1.56399, -1.632522, -1.908189, 1, 1, 1, 1, 1,
-1.529029, 0.5137312, -0.7152885, 1, 1, 1, 1, 1,
-1.528231, -1.818881, -2.103693, 1, 1, 1, 1, 1,
-1.521258, 0.2973024, -0.2847282, 1, 1, 1, 1, 1,
-1.494979, -0.5860997, -1.066655, 1, 1, 1, 1, 1,
-1.47523, -1.088773, -1.820033, 1, 1, 1, 1, 1,
-1.471877, 0.3860157, -0.3989669, 1, 1, 1, 1, 1,
-1.466413, -0.03000731, -1.630753, 1, 1, 1, 1, 1,
-1.46052, 0.6083602, -0.3224171, 1, 1, 1, 1, 1,
-1.454127, -0.8299319, -2.25065, 1, 1, 1, 1, 1,
-1.452937, 0.8129801, -2.539374, 1, 1, 1, 1, 1,
-1.44869, 2.588635, 0.3474981, 1, 1, 1, 1, 1,
-1.447244, -0.2537594, -1.388561, 1, 1, 1, 1, 1,
-1.441072, 0.4125057, -0.2470147, 0, 0, 1, 1, 1,
-1.440956, -1.648975, -1.637729, 1, 0, 0, 1, 1,
-1.439581, -1.706062, -2.244647, 1, 0, 0, 1, 1,
-1.426373, 0.2018923, -2.048398, 1, 0, 0, 1, 1,
-1.426155, 1.605688, -0.09396468, 1, 0, 0, 1, 1,
-1.425424, -0.6307816, -1.641531, 1, 0, 0, 1, 1,
-1.417856, -1.602107, -3.324639, 0, 0, 0, 1, 1,
-1.414528, 0.6042318, -0.6308701, 0, 0, 0, 1, 1,
-1.406882, 0.8496966, -0.6793983, 0, 0, 0, 1, 1,
-1.405088, -0.979677, -3.544798, 0, 0, 0, 1, 1,
-1.404703, -0.2475776, -2.596825, 0, 0, 0, 1, 1,
-1.400295, 1.407765, -0.7993387, 0, 0, 0, 1, 1,
-1.396292, -1.078715, -1.780363, 0, 0, 0, 1, 1,
-1.393706, -0.2522684, -0.8982323, 1, 1, 1, 1, 1,
-1.375744, 0.5880727, 0.7001391, 1, 1, 1, 1, 1,
-1.370365, 0.5250216, -0.6300524, 1, 1, 1, 1, 1,
-1.366531, -0.2180126, -0.8140763, 1, 1, 1, 1, 1,
-1.358893, -0.9349519, -2.528936, 1, 1, 1, 1, 1,
-1.35786, -0.08151791, -3.523102, 1, 1, 1, 1, 1,
-1.348081, -0.3522133, -3.130276, 1, 1, 1, 1, 1,
-1.348029, 1.558202, 0.100661, 1, 1, 1, 1, 1,
-1.339457, 1.21832, -1.414869, 1, 1, 1, 1, 1,
-1.325991, -0.0599965, -0.8135636, 1, 1, 1, 1, 1,
-1.325122, -1.340331, -1.410369, 1, 1, 1, 1, 1,
-1.325101, -0.2531016, -4.56727, 1, 1, 1, 1, 1,
-1.321297, 0.07305607, -1.474987, 1, 1, 1, 1, 1,
-1.319268, -0.9448457, -2.402917, 1, 1, 1, 1, 1,
-1.296751, 0.06483909, 0.9776956, 1, 1, 1, 1, 1,
-1.273869, -1.375324, -2.238545, 0, 0, 1, 1, 1,
-1.265017, 1.690866, -0.9615158, 1, 0, 0, 1, 1,
-1.253443, -0.3371153, -2.903703, 1, 0, 0, 1, 1,
-1.248276, -0.2206616, -2.190046, 1, 0, 0, 1, 1,
-1.239175, -0.245979, -1.869175, 1, 0, 0, 1, 1,
-1.235715, 0.1152014, -1.089331, 1, 0, 0, 1, 1,
-1.235381, 0.675847, -0.489243, 0, 0, 0, 1, 1,
-1.234375, -0.07903366, 0.1779853, 0, 0, 0, 1, 1,
-1.23398, -1.725482, -3.619023, 0, 0, 0, 1, 1,
-1.231724, 0.63918, -2.128895, 0, 0, 0, 1, 1,
-1.227667, -1.147615, -2.686244, 0, 0, 0, 1, 1,
-1.22066, -0.1318634, -1.40201, 0, 0, 0, 1, 1,
-1.218646, 1.177021, -0.7842744, 0, 0, 0, 1, 1,
-1.21739, 2.024163, -0.6323381, 1, 1, 1, 1, 1,
-1.215763, -1.566548, -1.751715, 1, 1, 1, 1, 1,
-1.213466, 0.4487338, -1.742198, 1, 1, 1, 1, 1,
-1.195179, -0.5052429, -0.9532697, 1, 1, 1, 1, 1,
-1.189406, 0.9319637, 0.338995, 1, 1, 1, 1, 1,
-1.170275, 0.04004595, -0.4220232, 1, 1, 1, 1, 1,
-1.169991, -0.6569363, -2.218709, 1, 1, 1, 1, 1,
-1.162867, -0.3541242, -4.320959, 1, 1, 1, 1, 1,
-1.161644, -0.925997, -1.548476, 1, 1, 1, 1, 1,
-1.147434, 0.5947182, -0.4261005, 1, 1, 1, 1, 1,
-1.140232, -1.792146, -1.524369, 1, 1, 1, 1, 1,
-1.139377, 0.6678294, -0.137394, 1, 1, 1, 1, 1,
-1.134056, 1.02377, -3.314675, 1, 1, 1, 1, 1,
-1.121381, 0.3788632, -3.050905, 1, 1, 1, 1, 1,
-1.117426, 0.9694098, -1.170762, 1, 1, 1, 1, 1,
-1.114779, -0.3723992, -2.289025, 0, 0, 1, 1, 1,
-1.103194, -0.4765292, -1.370049, 1, 0, 0, 1, 1,
-1.102303, 0.3502845, -0.868484, 1, 0, 0, 1, 1,
-1.100852, -0.0376234, -0.04272524, 1, 0, 0, 1, 1,
-1.095166, 0.1717273, -2.150452, 1, 0, 0, 1, 1,
-1.084585, -0.4209205, -2.192728, 1, 0, 0, 1, 1,
-1.080098, 1.099964, -0.03795746, 0, 0, 0, 1, 1,
-1.074209, -0.5054502, -1.611334, 0, 0, 0, 1, 1,
-1.068974, 1.554333, 0.6734095, 0, 0, 0, 1, 1,
-1.064553, -1.291113, -2.222803, 0, 0, 0, 1, 1,
-1.063244, 0.4618109, 0.9931856, 0, 0, 0, 1, 1,
-1.063031, -0.4239003, -2.19491, 0, 0, 0, 1, 1,
-1.060316, -2.725429, -3.016391, 0, 0, 0, 1, 1,
-1.05936, -1.510647, -1.801613, 1, 1, 1, 1, 1,
-1.055894, -0.5216544, -1.647364, 1, 1, 1, 1, 1,
-1.055092, 0.7490079, -0.7082435, 1, 1, 1, 1, 1,
-1.046677, 1.578104, -1.479634, 1, 1, 1, 1, 1,
-1.037443, -0.3697147, -2.190994, 1, 1, 1, 1, 1,
-1.025329, -2.307121, -2.082093, 1, 1, 1, 1, 1,
-1.024583, 0.04543607, -1.304942, 1, 1, 1, 1, 1,
-1.022983, -0.2632964, -1.063619, 1, 1, 1, 1, 1,
-1.022578, -2.827272, -1.904508, 1, 1, 1, 1, 1,
-1.013073, 0.1910777, -1.592142, 1, 1, 1, 1, 1,
-1.009566, -0.009516885, 0.1919671, 1, 1, 1, 1, 1,
-1.008932, -2.058531, -1.176462, 1, 1, 1, 1, 1,
-1.004865, -1.884142, -2.963953, 1, 1, 1, 1, 1,
-1.002594, -1.13346, -1.46812, 1, 1, 1, 1, 1,
-0.998838, -1.380466, -1.325641, 1, 1, 1, 1, 1,
-0.9958174, -0.7740145, -1.970703, 0, 0, 1, 1, 1,
-0.9876422, 1.341702, 1.004821, 1, 0, 0, 1, 1,
-0.9861935, -0.6032191, -2.592191, 1, 0, 0, 1, 1,
-0.9825749, -0.06334598, -1.466586, 1, 0, 0, 1, 1,
-0.9787936, 0.4936057, 0.05349011, 1, 0, 0, 1, 1,
-0.976704, 0.9554541, -0.9579843, 1, 0, 0, 1, 1,
-0.9458404, -0.0074373, -1.150558, 0, 0, 0, 1, 1,
-0.9452701, 0.6194759, -1.676, 0, 0, 0, 1, 1,
-0.9424795, 1.482318, -1.637846, 0, 0, 0, 1, 1,
-0.9371397, 0.1403855, -1.694997, 0, 0, 0, 1, 1,
-0.930481, -0.7021085, -1.702806, 0, 0, 0, 1, 1,
-0.9300678, 0.8969721, -1.682632, 0, 0, 0, 1, 1,
-0.924813, 0.8359871, -1.433629, 0, 0, 0, 1, 1,
-0.9154574, -0.4951663, -2.979764, 1, 1, 1, 1, 1,
-0.9134379, -0.6347067, -1.313652, 1, 1, 1, 1, 1,
-0.9132891, -0.4544007, -2.562638, 1, 1, 1, 1, 1,
-0.9121158, -1.781361, -2.941036, 1, 1, 1, 1, 1,
-0.9108201, -1.701851, -1.628796, 1, 1, 1, 1, 1,
-0.9081598, -1.2823, -1.63426, 1, 1, 1, 1, 1,
-0.8964798, 0.1844521, -0.9987496, 1, 1, 1, 1, 1,
-0.8958271, 1.091068, -1.534196, 1, 1, 1, 1, 1,
-0.8939432, 0.7844241, 0.6790019, 1, 1, 1, 1, 1,
-0.891787, 1.904774, -0.237342, 1, 1, 1, 1, 1,
-0.8907676, -0.3003438, -2.615303, 1, 1, 1, 1, 1,
-0.8907624, -0.6434721, -2.24098, 1, 1, 1, 1, 1,
-0.8871908, 0.8122945, -0.3065558, 1, 1, 1, 1, 1,
-0.8827475, 1.795314, -1.649733, 1, 1, 1, 1, 1,
-0.878298, -1.041469, -1.74869, 1, 1, 1, 1, 1,
-0.8716626, 1.79092, -1.08486, 0, 0, 1, 1, 1,
-0.8696057, 1.474988, -2.186874, 1, 0, 0, 1, 1,
-0.8656234, -0.6361272, -1.73807, 1, 0, 0, 1, 1,
-0.8607817, -0.214969, -1.723887, 1, 0, 0, 1, 1,
-0.8542041, -0.8787661, -1.24944, 1, 0, 0, 1, 1,
-0.8463063, 0.5056705, -1.208227, 1, 0, 0, 1, 1,
-0.8453521, -0.007868202, 1.032979, 0, 0, 0, 1, 1,
-0.8381807, 0.04165425, -2.580357, 0, 0, 0, 1, 1,
-0.8354434, 1.191282, -0.5999076, 0, 0, 0, 1, 1,
-0.8305914, -1.66912, -3.759421, 0, 0, 0, 1, 1,
-0.8270104, 0.02953103, -0.1108798, 0, 0, 0, 1, 1,
-0.8222365, 1.222539, -0.8800411, 0, 0, 0, 1, 1,
-0.8207745, -0.3761967, -2.476042, 0, 0, 0, 1, 1,
-0.8175771, 1.551974, -1.225816, 1, 1, 1, 1, 1,
-0.8140841, -1.300367, -2.97049, 1, 1, 1, 1, 1,
-0.8132399, -0.7088443, -2.170066, 1, 1, 1, 1, 1,
-0.8099465, 0.3448193, -2.831374, 1, 1, 1, 1, 1,
-0.8089958, 0.1461811, -1.019477, 1, 1, 1, 1, 1,
-0.8087519, 0.4606619, -0.8664051, 1, 1, 1, 1, 1,
-0.8007972, -0.8349432, -1.713077, 1, 1, 1, 1, 1,
-0.7997525, 0.2739431, -0.5324578, 1, 1, 1, 1, 1,
-0.7989231, -0.1939574, -2.19208, 1, 1, 1, 1, 1,
-0.7943887, 0.8774483, -1.563807, 1, 1, 1, 1, 1,
-0.7886544, 0.844244, -0.2625082, 1, 1, 1, 1, 1,
-0.7852604, -1.409582, -0.7728991, 1, 1, 1, 1, 1,
-0.7840528, -1.040937, -2.484122, 1, 1, 1, 1, 1,
-0.7838379, -1.234324, -4.319267, 1, 1, 1, 1, 1,
-0.7785941, 0.03807419, -1.86911, 1, 1, 1, 1, 1,
-0.7763228, 1.535977, -0.9773656, 0, 0, 1, 1, 1,
-0.7733181, -0.3487813, -2.159109, 1, 0, 0, 1, 1,
-0.771836, -1.068096, -2.417975, 1, 0, 0, 1, 1,
-0.7556347, 0.7789692, -0.7075064, 1, 0, 0, 1, 1,
-0.7500181, -0.5830868, -1.661273, 1, 0, 0, 1, 1,
-0.7480335, -0.9444153, -2.660321, 1, 0, 0, 1, 1,
-0.7459818, 2.164894, 0.198667, 0, 0, 0, 1, 1,
-0.7374092, -0.416491, -0.7282785, 0, 0, 0, 1, 1,
-0.7349969, -0.3794688, -3.1894, 0, 0, 0, 1, 1,
-0.7331741, -0.5075119, -3.229244, 0, 0, 0, 1, 1,
-0.7240944, -1.85577, -4.265094, 0, 0, 0, 1, 1,
-0.7229454, -3.264181, -2.099451, 0, 0, 0, 1, 1,
-0.722533, -0.01196143, -2.709278, 0, 0, 0, 1, 1,
-0.7198773, -0.6766096, -2.961122, 1, 1, 1, 1, 1,
-0.7191912, -0.1440686, -3.073425, 1, 1, 1, 1, 1,
-0.7156016, 0.5437084, -0.2186062, 1, 1, 1, 1, 1,
-0.7139639, -0.6305946, -2.814311, 1, 1, 1, 1, 1,
-0.7117877, 0.923355, -0.03696349, 1, 1, 1, 1, 1,
-0.7108807, 1.532467, -0.6417232, 1, 1, 1, 1, 1,
-0.7073467, 1.86204, 1.231313, 1, 1, 1, 1, 1,
-0.7066649, 0.4916634, -2.174201, 1, 1, 1, 1, 1,
-0.7025939, -0.8904243, -2.154548, 1, 1, 1, 1, 1,
-0.6983145, -0.07866906, -1.857858, 1, 1, 1, 1, 1,
-0.6902282, 0.06787802, -1.545661, 1, 1, 1, 1, 1,
-0.6858506, -1.183744, -1.648643, 1, 1, 1, 1, 1,
-0.683061, -1.746782, -2.535897, 1, 1, 1, 1, 1,
-0.6820683, 0.6890097, -0.4464509, 1, 1, 1, 1, 1,
-0.6760929, 0.9120785, -1.687653, 1, 1, 1, 1, 1,
-0.6748098, 1.227057, 0.6352672, 0, 0, 1, 1, 1,
-0.6742759, -0.6307255, -2.027834, 1, 0, 0, 1, 1,
-0.6737196, -0.6734012, -3.073657, 1, 0, 0, 1, 1,
-0.6666229, 0.5434285, -1.401575, 1, 0, 0, 1, 1,
-0.662272, 1.07192, 1.559108, 1, 0, 0, 1, 1,
-0.6562555, 1.768135, -1.609687, 1, 0, 0, 1, 1,
-0.6527354, 0.9193742, -1.110116, 0, 0, 0, 1, 1,
-0.6407669, 0.9905354, 0.8402717, 0, 0, 0, 1, 1,
-0.6401945, 1.224573, -0.4524625, 0, 0, 0, 1, 1,
-0.6387961, 1.448329, -0.1102265, 0, 0, 0, 1, 1,
-0.6385025, 0.6934474, -0.7508002, 0, 0, 0, 1, 1,
-0.6335581, 0.238575, -1.617027, 0, 0, 0, 1, 1,
-0.6324197, -0.7508667, -1.89155, 0, 0, 0, 1, 1,
-0.6276449, -1.86117, -1.922036, 1, 1, 1, 1, 1,
-0.6250425, 1.092344, 1.208705, 1, 1, 1, 1, 1,
-0.620254, 0.3095568, -0.6171927, 1, 1, 1, 1, 1,
-0.615869, 2.121505, -1.605432, 1, 1, 1, 1, 1,
-0.6079858, -0.2344997, -0.9103433, 1, 1, 1, 1, 1,
-0.6063119, -1.036893, -2.685942, 1, 1, 1, 1, 1,
-0.6034156, 0.8287003, 0.2729293, 1, 1, 1, 1, 1,
-0.6028386, 0.9144797, 0.6057444, 1, 1, 1, 1, 1,
-0.5910321, -0.7644541, -2.461842, 1, 1, 1, 1, 1,
-0.5869917, -2.267526, -4.747494, 1, 1, 1, 1, 1,
-0.5855383, -1.770305, -2.657053, 1, 1, 1, 1, 1,
-0.5808336, 2.608179, -0.8436829, 1, 1, 1, 1, 1,
-0.5738648, 0.3821126, -1.114468, 1, 1, 1, 1, 1,
-0.5733969, -0.2787126, -3.035828, 1, 1, 1, 1, 1,
-0.5705585, 1.04473, -0.1908669, 1, 1, 1, 1, 1,
-0.5705197, -0.10935, -0.8907422, 0, 0, 1, 1, 1,
-0.5699198, 1.514811, -0.2146158, 1, 0, 0, 1, 1,
-0.5694833, 0.008503315, -1.616697, 1, 0, 0, 1, 1,
-0.5680267, -1.850902, -3.481415, 1, 0, 0, 1, 1,
-0.5678429, 0.2861735, -0.5463269, 1, 0, 0, 1, 1,
-0.5666986, 0.9430616, -1.543219, 1, 0, 0, 1, 1,
-0.5656489, 1.523291, -1.488574, 0, 0, 0, 1, 1,
-0.5653569, 1.093732, -0.2622374, 0, 0, 0, 1, 1,
-0.5626277, -0.8139703, -2.123891, 0, 0, 0, 1, 1,
-0.5555102, 0.1166706, -0.6277149, 0, 0, 0, 1, 1,
-0.5554775, 0.687851, -0.468262, 0, 0, 0, 1, 1,
-0.5509318, -0.09300373, -2.169344, 0, 0, 0, 1, 1,
-0.5495923, -0.9965988, -4.136469, 0, 0, 0, 1, 1,
-0.5434691, -0.9877695, -3.105751, 1, 1, 1, 1, 1,
-0.5402427, -0.1163563, -2.409212, 1, 1, 1, 1, 1,
-0.5392271, -1.527983, -3.092167, 1, 1, 1, 1, 1,
-0.5390511, -0.07123002, -1.690912, 1, 1, 1, 1, 1,
-0.538, -0.9788927, -2.760419, 1, 1, 1, 1, 1,
-0.53601, 1.526974, 0.07566242, 1, 1, 1, 1, 1,
-0.5288113, 0.4183577, -3.04241, 1, 1, 1, 1, 1,
-0.528186, -0.3957445, -1.469506, 1, 1, 1, 1, 1,
-0.5270842, 1.327017, -2.030597, 1, 1, 1, 1, 1,
-0.5263798, 0.7457849, 0.036918, 1, 1, 1, 1, 1,
-0.5260254, -1.239214, -4.964334, 1, 1, 1, 1, 1,
-0.5233496, -1.390159, -1.965192, 1, 1, 1, 1, 1,
-0.5227818, -0.3766533, -3.521916, 1, 1, 1, 1, 1,
-0.5224606, -0.03555935, -2.065639, 1, 1, 1, 1, 1,
-0.5192325, 0.3290272, -3.949362, 1, 1, 1, 1, 1,
-0.5192079, -0.8153485, -4.091415, 0, 0, 1, 1, 1,
-0.518465, -0.1858022, -1.640341, 1, 0, 0, 1, 1,
-0.5176591, -0.09781569, -2.204248, 1, 0, 0, 1, 1,
-0.5168931, 1.83655, -0.1487286, 1, 0, 0, 1, 1,
-0.5160671, 0.01437711, -0.06865957, 1, 0, 0, 1, 1,
-0.5145429, -1.302559, -3.44249, 1, 0, 0, 1, 1,
-0.5139675, -0.1351032, -1.071713, 0, 0, 0, 1, 1,
-0.5133693, -0.1781733, -2.02319, 0, 0, 0, 1, 1,
-0.5073403, -1.384364, -2.577397, 0, 0, 0, 1, 1,
-0.4922999, 1.454469, -2.434115, 0, 0, 0, 1, 1,
-0.4883933, -0.127171, -4.864522, 0, 0, 0, 1, 1,
-0.4869683, -0.2087328, -1.795067, 0, 0, 0, 1, 1,
-0.481528, 1.669198, -1.251391, 0, 0, 0, 1, 1,
-0.4771818, -0.2806769, -1.69243, 1, 1, 1, 1, 1,
-0.4747616, 1.626268, 2.041781, 1, 1, 1, 1, 1,
-0.4690557, -0.5893619, -1.658212, 1, 1, 1, 1, 1,
-0.4646417, 0.2112456, 0.6085092, 1, 1, 1, 1, 1,
-0.4625713, 1.528509, 0.1248857, 1, 1, 1, 1, 1,
-0.4570312, 2.143186, -0.08429316, 1, 1, 1, 1, 1,
-0.4477671, -0.297507, -2.027668, 1, 1, 1, 1, 1,
-0.4473011, -0.3768225, -2.48409, 1, 1, 1, 1, 1,
-0.4437899, -0.7923455, -3.369013, 1, 1, 1, 1, 1,
-0.4420301, -2.585406, -2.811571, 1, 1, 1, 1, 1,
-0.4382838, -1.039087, -4.467494, 1, 1, 1, 1, 1,
-0.4301439, 1.588899, -0.3671612, 1, 1, 1, 1, 1,
-0.4240547, 0.1710635, -2.343194, 1, 1, 1, 1, 1,
-0.4234147, -0.9167125, -2.264218, 1, 1, 1, 1, 1,
-0.421254, -1.281005, -4.134617, 1, 1, 1, 1, 1,
-0.4206536, -1.158689, -3.608386, 0, 0, 1, 1, 1,
-0.4157461, -0.6276438, -3.591709, 1, 0, 0, 1, 1,
-0.4157057, -0.167147, -1.312714, 1, 0, 0, 1, 1,
-0.4149437, 1.42697, 0.5769765, 1, 0, 0, 1, 1,
-0.41288, 1.315289, -0.5796525, 1, 0, 0, 1, 1,
-0.4121705, -0.2399653, -3.349884, 1, 0, 0, 1, 1,
-0.4108406, 1.290025, 1.643408, 0, 0, 0, 1, 1,
-0.4066764, -1.47308, -2.637187, 0, 0, 0, 1, 1,
-0.4042664, -1.103334, -3.896117, 0, 0, 0, 1, 1,
-0.3996101, 1.634047, -1.223075, 0, 0, 0, 1, 1,
-0.3910413, -1.175421, -2.078631, 0, 0, 0, 1, 1,
-0.3909324, -1.526313, -3.923637, 0, 0, 0, 1, 1,
-0.389282, -0.5486562, -0.646219, 0, 0, 0, 1, 1,
-0.3866418, -1.277839, -2.905292, 1, 1, 1, 1, 1,
-0.3809301, -0.177087, -1.182546, 1, 1, 1, 1, 1,
-0.3739001, -0.1284622, -2.756534, 1, 1, 1, 1, 1,
-0.3705904, 0.1718824, -1.665095, 1, 1, 1, 1, 1,
-0.3684984, -0.605689, -3.716978, 1, 1, 1, 1, 1,
-0.365015, 1.25376, 0.4641627, 1, 1, 1, 1, 1,
-0.3593884, 0.1567936, -0.6002773, 1, 1, 1, 1, 1,
-0.3592346, 1.930393, 0.7428214, 1, 1, 1, 1, 1,
-0.358296, -1.103837, -3.982481, 1, 1, 1, 1, 1,
-0.3513907, -0.2170827, -2.169932, 1, 1, 1, 1, 1,
-0.3495413, 1.245717, -0.1139906, 1, 1, 1, 1, 1,
-0.3468292, -0.6407267, -1.558333, 1, 1, 1, 1, 1,
-0.3444406, -0.493477, -1.2339, 1, 1, 1, 1, 1,
-0.3443058, 2.312842, -0.06599553, 1, 1, 1, 1, 1,
-0.3420192, 1.728847, 0.6632386, 1, 1, 1, 1, 1,
-0.3337581, 0.8808788, -1.397283, 0, 0, 1, 1, 1,
-0.3312357, 0.3363008, -1.781816, 1, 0, 0, 1, 1,
-0.3271477, 0.9447488, -1.163882, 1, 0, 0, 1, 1,
-0.3221414, -0.586733, -1.415828, 1, 0, 0, 1, 1,
-0.3214148, 0.3013954, -0.6263207, 1, 0, 0, 1, 1,
-0.3198154, -1.980657, -2.93185, 1, 0, 0, 1, 1,
-0.3065342, 0.6177307, -0.2007524, 0, 0, 0, 1, 1,
-0.304566, 0.4286311, -1.924952, 0, 0, 0, 1, 1,
-0.3024562, 1.323564, -0.845279, 0, 0, 0, 1, 1,
-0.3017792, -0.6506481, -3.747629, 0, 0, 0, 1, 1,
-0.2953623, -0.6010757, -3.055567, 0, 0, 0, 1, 1,
-0.2933234, 0.09230896, -4.068916, 0, 0, 0, 1, 1,
-0.2870325, -0.2737544, -3.215537, 0, 0, 0, 1, 1,
-0.2858981, 0.914944, -0.2364707, 1, 1, 1, 1, 1,
-0.285201, 0.4012899, -0.4102401, 1, 1, 1, 1, 1,
-0.2796513, 1.68075, 0.4947858, 1, 1, 1, 1, 1,
-0.2787091, -0.8918334, -3.197286, 1, 1, 1, 1, 1,
-0.2753093, 0.798451, -0.7699681, 1, 1, 1, 1, 1,
-0.2744776, -1.088542, -4.535472, 1, 1, 1, 1, 1,
-0.2721946, 0.1486105, -3.38974, 1, 1, 1, 1, 1,
-0.2614245, -1.15552, -3.240854, 1, 1, 1, 1, 1,
-0.2595955, -1.021199, -2.689019, 1, 1, 1, 1, 1,
-0.259282, 0.5403345, 0.56757, 1, 1, 1, 1, 1,
-0.2587531, -1.349417, -3.061627, 1, 1, 1, 1, 1,
-0.2581353, 0.03780178, -0.8805057, 1, 1, 1, 1, 1,
-0.2537332, 0.669109, -1.369355, 1, 1, 1, 1, 1,
-0.253054, -0.7209663, -2.153721, 1, 1, 1, 1, 1,
-0.2526427, -0.607363, -4.042132, 1, 1, 1, 1, 1,
-0.2488597, 0.7967504, -0.254086, 0, 0, 1, 1, 1,
-0.2456335, -0.8255882, -3.556196, 1, 0, 0, 1, 1,
-0.2382189, 0.8647173, -1.059842, 1, 0, 0, 1, 1,
-0.2356881, -0.462378, -2.621248, 1, 0, 0, 1, 1,
-0.2327611, 1.158789, 0.7208586, 1, 0, 0, 1, 1,
-0.232085, 0.4639827, -1.962943, 1, 0, 0, 1, 1,
-0.2283046, 0.1560419, -1.485566, 0, 0, 0, 1, 1,
-0.2211612, -0.9574046, -2.657617, 0, 0, 0, 1, 1,
-0.22092, 0.134593, -1.72372, 0, 0, 0, 1, 1,
-0.2208808, -0.3925132, -2.174261, 0, 0, 0, 1, 1,
-0.2202977, 0.02465381, -3.62334, 0, 0, 0, 1, 1,
-0.2182875, 0.7407581, -0.142381, 0, 0, 0, 1, 1,
-0.2174927, 0.1059493, 0.1395168, 0, 0, 0, 1, 1,
-0.2146025, 0.604605, -0.7426723, 1, 1, 1, 1, 1,
-0.2062224, 0.493955, -0.1978158, 1, 1, 1, 1, 1,
-0.2036525, -0.2035812, -2.661887, 1, 1, 1, 1, 1,
-0.2000265, -0.1475537, -2.757358, 1, 1, 1, 1, 1,
-0.1994961, -1.395753, -3.903652, 1, 1, 1, 1, 1,
-0.1981694, 0.8524272, 0.1822773, 1, 1, 1, 1, 1,
-0.1970982, 0.2630645, -0.5381084, 1, 1, 1, 1, 1,
-0.1959041, 0.06952216, 0.2542148, 1, 1, 1, 1, 1,
-0.1943428, 1.209695, -0.8522267, 1, 1, 1, 1, 1,
-0.1932317, -0.9811075, -1.112719, 1, 1, 1, 1, 1,
-0.1914455, -0.6611026, -1.515162, 1, 1, 1, 1, 1,
-0.191426, 0.4479756, -1.073954, 1, 1, 1, 1, 1,
-0.1865228, -0.1147521, -4.812593, 1, 1, 1, 1, 1,
-0.185607, -0.4598152, -1.971591, 1, 1, 1, 1, 1,
-0.182564, -0.005623405, -1.15002, 1, 1, 1, 1, 1,
-0.1821516, -0.7627566, -2.996789, 0, 0, 1, 1, 1,
-0.1807774, 0.8220294, -0.876563, 1, 0, 0, 1, 1,
-0.177846, -0.7353291, -2.441862, 1, 0, 0, 1, 1,
-0.177002, 0.1798313, -0.2810721, 1, 0, 0, 1, 1,
-0.1695576, -1.466508, -3.2408, 1, 0, 0, 1, 1,
-0.1693007, -0.1850031, 0.03044203, 1, 0, 0, 1, 1,
-0.1618597, 0.0473109, -1.773115, 0, 0, 0, 1, 1,
-0.1536954, -1.370813, -2.583036, 0, 0, 0, 1, 1,
-0.144072, 0.1995337, 2.423519, 0, 0, 0, 1, 1,
-0.140371, -1.148324, -2.198823, 0, 0, 0, 1, 1,
-0.1380358, -0.1998487, -2.348858, 0, 0, 0, 1, 1,
-0.1361766, 2.521966, -2.017869, 0, 0, 0, 1, 1,
-0.1350014, -0.1786055, -2.692561, 0, 0, 0, 1, 1,
-0.130712, 1.229712, 1.810923, 1, 1, 1, 1, 1,
-0.1289064, -0.736196, -3.782822, 1, 1, 1, 1, 1,
-0.12595, -0.9336572, -2.646074, 1, 1, 1, 1, 1,
-0.1236418, -0.001182635, -0.1898437, 1, 1, 1, 1, 1,
-0.1146906, 1.011961, -0.1752983, 1, 1, 1, 1, 1,
-0.1137424, -0.8022986, -3.825535, 1, 1, 1, 1, 1,
-0.1112837, 0.2356417, -1.280293, 1, 1, 1, 1, 1,
-0.1098329, 0.07051118, -0.738133, 1, 1, 1, 1, 1,
-0.1096024, 0.5748066, -0.9070873, 1, 1, 1, 1, 1,
-0.1077537, -0.16948, -1.06938, 1, 1, 1, 1, 1,
-0.1066734, 0.4075585, -0.5710507, 1, 1, 1, 1, 1,
-0.106161, -1.146205, -2.754651, 1, 1, 1, 1, 1,
-0.104543, 0.6459712, 0.2933042, 1, 1, 1, 1, 1,
-0.1040028, 1.053854, -0.8898019, 1, 1, 1, 1, 1,
-0.1019993, -0.1013845, -1.311672, 1, 1, 1, 1, 1,
-0.1014609, -0.7097996, -3.653217, 0, 0, 1, 1, 1,
-0.1012238, 1.360182, 0.591363, 1, 0, 0, 1, 1,
-0.09990649, 1.509063, -0.3571503, 1, 0, 0, 1, 1,
-0.09867766, -0.4434314, -4.876621, 1, 0, 0, 1, 1,
-0.09514952, -1.561349, -3.098982, 1, 0, 0, 1, 1,
-0.09494226, -0.987472, -3.229493, 1, 0, 0, 1, 1,
-0.08951373, 1.696504, -0.2361846, 0, 0, 0, 1, 1,
-0.08661364, 0.6711817, -0.5679072, 0, 0, 0, 1, 1,
-0.08530246, 1.360034, 0.9414318, 0, 0, 0, 1, 1,
-0.08027889, -0.875659, -2.71724, 0, 0, 0, 1, 1,
-0.07864504, -0.004004221, -1.814951, 0, 0, 0, 1, 1,
-0.07758879, 0.7134778, -1.240744, 0, 0, 0, 1, 1,
-0.07685344, -0.6126379, -1.349242, 0, 0, 0, 1, 1,
-0.07524839, -0.728959, -2.641747, 1, 1, 1, 1, 1,
-0.07501166, 0.09456257, 0.2440339, 1, 1, 1, 1, 1,
-0.07429196, 0.5802749, -0.06664642, 1, 1, 1, 1, 1,
-0.07353824, 0.01243951, -1.628133, 1, 1, 1, 1, 1,
-0.07223756, -0.6702528, -1.99616, 1, 1, 1, 1, 1,
-0.07216982, 0.3778711, -1.165577, 1, 1, 1, 1, 1,
-0.06948791, 1.111519, -0.3723855, 1, 1, 1, 1, 1,
-0.06801909, -0.4079162, -2.497132, 1, 1, 1, 1, 1,
-0.06552051, -0.1537803, -2.861129, 1, 1, 1, 1, 1,
-0.06492105, 1.042771, -1.078472, 1, 1, 1, 1, 1,
-0.06407823, -0.9518703, -4.812016, 1, 1, 1, 1, 1,
-0.06205744, 0.4712135, -1.303968, 1, 1, 1, 1, 1,
-0.0588298, 1.383639, -0.5365073, 1, 1, 1, 1, 1,
-0.05816013, 0.3199274, 0.9134275, 1, 1, 1, 1, 1,
-0.05797899, -0.1275102, -1.464676, 1, 1, 1, 1, 1,
-0.05784576, 1.312929, -1.052465, 0, 0, 1, 1, 1,
-0.05241629, 0.9619385, 0.5681361, 1, 0, 0, 1, 1,
-0.04811417, -0.4232076, -3.093851, 1, 0, 0, 1, 1,
-0.04581184, -0.3076534, -4.399939, 1, 0, 0, 1, 1,
-0.04413396, -0.1851539, -4.427373, 1, 0, 0, 1, 1,
-0.04388608, -0.3309563, -3.148898, 1, 0, 0, 1, 1,
-0.03960579, -0.9831951, -3.471795, 0, 0, 0, 1, 1,
-0.03911263, -0.4894348, -3.049764, 0, 0, 0, 1, 1,
-0.03816686, -1.880198, -2.707715, 0, 0, 0, 1, 1,
-0.03733304, 1.445877, -1.73965, 0, 0, 0, 1, 1,
-0.03500424, 0.8216575, -0.2291151, 0, 0, 0, 1, 1,
-0.03363321, 0.4769413, 0.468209, 0, 0, 0, 1, 1,
-0.0322508, -0.09205791, -2.277087, 0, 0, 0, 1, 1,
-0.03121522, 0.5164422, 0.3435183, 1, 1, 1, 1, 1,
-0.02956805, 1.968123, -1.315652, 1, 1, 1, 1, 1,
-0.02833911, 0.6953137, -1.214967, 1, 1, 1, 1, 1,
-0.02667938, -0.2929721, -1.193661, 1, 1, 1, 1, 1,
-0.02091402, -0.600155, -3.560174, 1, 1, 1, 1, 1,
-0.01898029, -0.1300483, -1.952145, 1, 1, 1, 1, 1,
-0.01791251, 0.8773654, -1.038695, 1, 1, 1, 1, 1,
-0.01128848, -0.5431299, -3.01879, 1, 1, 1, 1, 1,
-0.003617545, 0.3128346, -0.08777284, 1, 1, 1, 1, 1,
0.001369024, 0.5284626, -1.770362, 1, 1, 1, 1, 1,
0.001961168, -2.554698, 4.148643, 1, 1, 1, 1, 1,
0.002465211, 1.930993, -0.3097128, 1, 1, 1, 1, 1,
0.005451763, 0.4825567, 0.1200628, 1, 1, 1, 1, 1,
0.006228962, -0.4053409, 4.66131, 1, 1, 1, 1, 1,
0.007270181, -2.257972, 2.653004, 1, 1, 1, 1, 1,
0.01179317, 1.653134, 0.2753356, 0, 0, 1, 1, 1,
0.01854338, 1.042231, -0.3279529, 1, 0, 0, 1, 1,
0.01947267, -0.2756532, 1.952586, 1, 0, 0, 1, 1,
0.02001817, 0.258803, 0.1974155, 1, 0, 0, 1, 1,
0.02115828, -1.004604, 1.759072, 1, 0, 0, 1, 1,
0.0225694, -0.6920202, 3.655996, 1, 0, 0, 1, 1,
0.02637, -0.6884113, 2.635476, 0, 0, 0, 1, 1,
0.02827677, 1.405235, -0.9130751, 0, 0, 0, 1, 1,
0.03148136, 0.472432, -0.02326723, 0, 0, 0, 1, 1,
0.03259782, 0.8629449, 0.3202343, 0, 0, 0, 1, 1,
0.03467767, -0.9404722, 2.459414, 0, 0, 0, 1, 1,
0.03920506, 0.1674256, -1.430786, 0, 0, 0, 1, 1,
0.04126113, -3.036602, 4.425513, 0, 0, 0, 1, 1,
0.04310946, -0.01359697, 0.5845088, 1, 1, 1, 1, 1,
0.04544565, 0.403907, 2.1655, 1, 1, 1, 1, 1,
0.05529664, -0.8489802, 5.776291, 1, 1, 1, 1, 1,
0.05632294, 1.04395, -1.146686, 1, 1, 1, 1, 1,
0.06770292, -0.9405186, 1.346686, 1, 1, 1, 1, 1,
0.07015137, -1.440254, 2.646905, 1, 1, 1, 1, 1,
0.07184111, 1.696328, 3.330668, 1, 1, 1, 1, 1,
0.07394657, 1.011781, -0.6432885, 1, 1, 1, 1, 1,
0.07428958, 0.106948, -0.1525297, 1, 1, 1, 1, 1,
0.07886934, 0.7198157, -0.4381312, 1, 1, 1, 1, 1,
0.08057277, -0.3885869, 3.683608, 1, 1, 1, 1, 1,
0.08194875, 0.4555251, 0.6600229, 1, 1, 1, 1, 1,
0.08202029, 1.742625, 0.483489, 1, 1, 1, 1, 1,
0.08286592, 0.7013571, 0.3741485, 1, 1, 1, 1, 1,
0.08337027, 0.7891623, 0.6312095, 1, 1, 1, 1, 1,
0.0884457, -0.6659094, 2.484291, 0, 0, 1, 1, 1,
0.08931459, -0.275508, 2.066054, 1, 0, 0, 1, 1,
0.09448433, 0.4773403, 0.07177501, 1, 0, 0, 1, 1,
0.09925636, 1.173445, -0.445109, 1, 0, 0, 1, 1,
0.1159689, -0.7792, 2.079669, 1, 0, 0, 1, 1,
0.1169443, 2.427841, -1.114179, 1, 0, 0, 1, 1,
0.1170908, 1.517607, 0.7594965, 0, 0, 0, 1, 1,
0.117731, -0.3701832, 1.431283, 0, 0, 0, 1, 1,
0.1235055, 0.1245184, 1.154794, 0, 0, 0, 1, 1,
0.1240957, -0.7000809, 3.191756, 0, 0, 0, 1, 1,
0.1250428, 0.07343605, 2.450537, 0, 0, 0, 1, 1,
0.1281346, -0.0353751, 1.112353, 0, 0, 0, 1, 1,
0.1302978, -0.9631656, 3.483575, 0, 0, 0, 1, 1,
0.1307857, 0.5937482, -0.01515154, 1, 1, 1, 1, 1,
0.1317427, 0.8726351, 0.259483, 1, 1, 1, 1, 1,
0.1350737, -2.640184, 5.043794, 1, 1, 1, 1, 1,
0.1355127, 0.789692, -0.1151138, 1, 1, 1, 1, 1,
0.1355992, 2.135173, 1.396274, 1, 1, 1, 1, 1,
0.1373594, 1.215885, -1.130871, 1, 1, 1, 1, 1,
0.1383086, 2.100681, -0.1436693, 1, 1, 1, 1, 1,
0.1402113, -1.377889, 3.99508, 1, 1, 1, 1, 1,
0.140613, 1.553205, -0.2775401, 1, 1, 1, 1, 1,
0.1417559, 0.09308425, 0.5534294, 1, 1, 1, 1, 1,
0.1480144, -1.497439, 2.817248, 1, 1, 1, 1, 1,
0.1490932, -1.299913, 2.10408, 1, 1, 1, 1, 1,
0.1508304, 0.3973784, 2.393713, 1, 1, 1, 1, 1,
0.1518701, 0.3994061, -0.9291948, 1, 1, 1, 1, 1,
0.1520652, -1.526214, 3.02477, 1, 1, 1, 1, 1,
0.1526186, -1.132229, 2.065996, 0, 0, 1, 1, 1,
0.1530562, -0.2167802, 2.322722, 1, 0, 0, 1, 1,
0.1571864, 0.4653585, -0.2128292, 1, 0, 0, 1, 1,
0.1658638, 0.8678916, 1.307857, 1, 0, 0, 1, 1,
0.166302, 1.675529, 1.139282, 1, 0, 0, 1, 1,
0.1713892, 1.416895, 0.3857158, 1, 0, 0, 1, 1,
0.1732516, 0.4108692, 0.2515846, 0, 0, 0, 1, 1,
0.173862, -0.2342266, 2.15813, 0, 0, 0, 1, 1,
0.1758056, -1.379457, 3.430445, 0, 0, 0, 1, 1,
0.1781604, 0.4149911, 0.5606763, 0, 0, 0, 1, 1,
0.1808709, 1.7537, 0.8053677, 0, 0, 0, 1, 1,
0.1834807, 1.519343, 0.5533845, 0, 0, 0, 1, 1,
0.1834918, -0.7713243, 2.338262, 0, 0, 0, 1, 1,
0.1837568, 1.168182, -2.225388, 1, 1, 1, 1, 1,
0.185077, -0.1331325, 2.059065, 1, 1, 1, 1, 1,
0.189338, -0.1948285, 1.987593, 1, 1, 1, 1, 1,
0.1935972, 1.028398, 0.2952003, 1, 1, 1, 1, 1,
0.1936933, -0.03818472, 2.973704, 1, 1, 1, 1, 1,
0.203051, -0.0859589, 1.462414, 1, 1, 1, 1, 1,
0.2075933, -1.346635, 2.783109, 1, 1, 1, 1, 1,
0.2103979, 1.033988, -0.855657, 1, 1, 1, 1, 1,
0.210655, -0.136671, 1.672819, 1, 1, 1, 1, 1,
0.217542, -2.14649, 3.501628, 1, 1, 1, 1, 1,
0.2184298, -0.4468183, 1.25365, 1, 1, 1, 1, 1,
0.2331489, -2.200826, 2.506746, 1, 1, 1, 1, 1,
0.2340034, -0.1781685, 2.58185, 1, 1, 1, 1, 1,
0.2373323, 1.284241, 0.1311287, 1, 1, 1, 1, 1,
0.2387439, -1.250979, 4.129932, 1, 1, 1, 1, 1,
0.244022, -0.8940428, 3.636353, 0, 0, 1, 1, 1,
0.2493912, -1.125995, 2.099823, 1, 0, 0, 1, 1,
0.2517445, 0.6448612, 1.010717, 1, 0, 0, 1, 1,
0.2522867, 0.2408248, 0.9451874, 1, 0, 0, 1, 1,
0.2546495, -0.3007684, 0.5921849, 1, 0, 0, 1, 1,
0.2625878, 0.2118999, 2.532713, 1, 0, 0, 1, 1,
0.2651798, -0.8514566, 2.467044, 0, 0, 0, 1, 1,
0.2686121, 0.3187892, 0.6462183, 0, 0, 0, 1, 1,
0.2704245, 0.6713098, -0.08169074, 0, 0, 0, 1, 1,
0.2711563, -1.951791, 3.628376, 0, 0, 0, 1, 1,
0.2723536, -0.8381882, 2.800411, 0, 0, 0, 1, 1,
0.2779942, -0.05441758, 2.383973, 0, 0, 0, 1, 1,
0.2850243, 0.4974165, 1.992128, 0, 0, 0, 1, 1,
0.2880507, -1.252409, 4.084456, 1, 1, 1, 1, 1,
0.2896282, 0.02795403, 0.4809126, 1, 1, 1, 1, 1,
0.2930439, -0.4081666, 1.635103, 1, 1, 1, 1, 1,
0.2937148, -0.8675154, 4.44764, 1, 1, 1, 1, 1,
0.2955686, 0.8229431, 0.4094293, 1, 1, 1, 1, 1,
0.2980638, -0.2224394, 2.13398, 1, 1, 1, 1, 1,
0.2995371, -1.082655, 2.709061, 1, 1, 1, 1, 1,
0.3045263, -0.9036014, 3.37185, 1, 1, 1, 1, 1,
0.3067836, 0.563444, 0.6718154, 1, 1, 1, 1, 1,
0.309664, -0.8758401, 1.283289, 1, 1, 1, 1, 1,
0.3098614, 0.4794873, -0.2571546, 1, 1, 1, 1, 1,
0.313329, 0.1285901, 1.354529, 1, 1, 1, 1, 1,
0.3190225, 0.8947992, -0.6056178, 1, 1, 1, 1, 1,
0.3238474, 0.6768527, -0.5470365, 1, 1, 1, 1, 1,
0.3286479, 0.1507954, 1.794683, 1, 1, 1, 1, 1,
0.3296661, 0.1164418, 1.227986, 0, 0, 1, 1, 1,
0.3327354, -0.5915904, 0.9944555, 1, 0, 0, 1, 1,
0.3334792, -0.7809629, 3.960386, 1, 0, 0, 1, 1,
0.3369149, -0.8336101, 2.931039, 1, 0, 0, 1, 1,
0.3379428, -0.5083529, 2.650164, 1, 0, 0, 1, 1,
0.3393542, 0.1809536, 0.7127886, 1, 0, 0, 1, 1,
0.341096, 0.03605974, 0.8051717, 0, 0, 0, 1, 1,
0.3451628, 1.118721, -0.915076, 0, 0, 0, 1, 1,
0.345371, -1.058372, 3.641278, 0, 0, 0, 1, 1,
0.3508098, 0.5179168, -0.1120704, 0, 0, 0, 1, 1,
0.352394, -0.3564726, 0.4448031, 0, 0, 0, 1, 1,
0.3530516, 2.57662, -0.228009, 0, 0, 0, 1, 1,
0.3531309, -0.7217591, 2.447301, 0, 0, 0, 1, 1,
0.365909, -0.3347951, 2.925489, 1, 1, 1, 1, 1,
0.3661407, -1.285842, 2.335148, 1, 1, 1, 1, 1,
0.36688, -1.079022, 3.304401, 1, 1, 1, 1, 1,
0.367236, -0.35805, 0.5542035, 1, 1, 1, 1, 1,
0.3693523, 1.232196, 0.168965, 1, 1, 1, 1, 1,
0.3700157, 0.6017453, -0.4328882, 1, 1, 1, 1, 1,
0.3701862, -0.4775201, 2.990427, 1, 1, 1, 1, 1,
0.3706068, -0.7906816, 2.931792, 1, 1, 1, 1, 1,
0.3730816, 1.522547, -0.001329732, 1, 1, 1, 1, 1,
0.3759269, 0.8461986, 0.00651175, 1, 1, 1, 1, 1,
0.3778552, 1.40573, -1.068012, 1, 1, 1, 1, 1,
0.3828106, 0.5726529, 1.218393, 1, 1, 1, 1, 1,
0.3844902, -0.235551, 2.684181, 1, 1, 1, 1, 1,
0.3876857, -0.1240707, 2.224455, 1, 1, 1, 1, 1,
0.3879686, -0.5579008, 2.793513, 1, 1, 1, 1, 1,
0.3880868, -1.263137, 2.906193, 0, 0, 1, 1, 1,
0.3922944, -0.3347845, 2.332652, 1, 0, 0, 1, 1,
0.3927638, -1.116831, 2.642609, 1, 0, 0, 1, 1,
0.3966633, 0.155958, 2.344191, 1, 0, 0, 1, 1,
0.4025641, 0.6734443, 0.2709018, 1, 0, 0, 1, 1,
0.4064736, 1.908558, 0.3872462, 1, 0, 0, 1, 1,
0.408585, -0.8240284, 1.073613, 0, 0, 0, 1, 1,
0.4134677, -2.007142, 3.362024, 0, 0, 0, 1, 1,
0.4154202, 0.2734333, 1.560485, 0, 0, 0, 1, 1,
0.4167209, 1.573866, 0.08695565, 0, 0, 0, 1, 1,
0.4243121, 1.778828, 1.587306, 0, 0, 0, 1, 1,
0.425036, 1.124189, 0.277772, 0, 0, 0, 1, 1,
0.4261191, 0.6341981, -0.01212881, 0, 0, 0, 1, 1,
0.429944, -0.3557271, 1.544072, 1, 1, 1, 1, 1,
0.4322293, 1.466771, 2.416925, 1, 1, 1, 1, 1,
0.4358584, 0.5531119, 2.241245, 1, 1, 1, 1, 1,
0.4379945, 0.01834437, 2.260871, 1, 1, 1, 1, 1,
0.4405105, -0.7979594, 2.853024, 1, 1, 1, 1, 1,
0.4415835, -0.3851768, 2.833557, 1, 1, 1, 1, 1,
0.4421997, 0.8797889, 0.2599073, 1, 1, 1, 1, 1,
0.4462842, 0.3070127, 2.652111, 1, 1, 1, 1, 1,
0.4513624, -2.339881, 3.561394, 1, 1, 1, 1, 1,
0.4518951, 1.875107, 0.08573555, 1, 1, 1, 1, 1,
0.4546322, 0.8888028, 2.188179, 1, 1, 1, 1, 1,
0.4593436, -0.5925602, 2.935152, 1, 1, 1, 1, 1,
0.4612553, 1.325551, 0.8084449, 1, 1, 1, 1, 1,
0.463485, 0.1276655, 1.996611, 1, 1, 1, 1, 1,
0.4645383, 0.5757669, 2.246675, 1, 1, 1, 1, 1,
0.4666731, 0.7098323, -0.8278068, 0, 0, 1, 1, 1,
0.4704556, 0.8436487, 1.814446, 1, 0, 0, 1, 1,
0.4714189, 1.183724, 0.691341, 1, 0, 0, 1, 1,
0.4739064, 2.232572, -1.475683, 1, 0, 0, 1, 1,
0.4745143, -0.9232325, 2.625459, 1, 0, 0, 1, 1,
0.4746696, -0.07180479, 3.103884, 1, 0, 0, 1, 1,
0.4751319, -1.086347, 2.900052, 0, 0, 0, 1, 1,
0.4759023, -0.3234188, -0.04392825, 0, 0, 0, 1, 1,
0.4760503, -0.9932233, 3.304272, 0, 0, 0, 1, 1,
0.477272, 0.1829858, 1.172824, 0, 0, 0, 1, 1,
0.4864975, -1.844728, 2.784399, 0, 0, 0, 1, 1,
0.4910216, 0.2967989, 0.307095, 0, 0, 0, 1, 1,
0.4939002, -0.3574669, -0.03529487, 0, 0, 0, 1, 1,
0.4973537, -1.044816, 1.638842, 1, 1, 1, 1, 1,
0.4978541, -1.591378, 2.719881, 1, 1, 1, 1, 1,
0.4981249, 0.2854237, -0.1339752, 1, 1, 1, 1, 1,
0.5006502, 2.060626, 2.126475, 1, 1, 1, 1, 1,
0.5038844, 0.4288369, 0.6056849, 1, 1, 1, 1, 1,
0.510162, 0.6504317, 0.2045223, 1, 1, 1, 1, 1,
0.5130647, 2.79099, -0.9671432, 1, 1, 1, 1, 1,
0.515175, -0.6456464, 2.18108, 1, 1, 1, 1, 1,
0.5214301, -0.6902994, 2.547424, 1, 1, 1, 1, 1,
0.5215412, -0.9067383, 1.577081, 1, 1, 1, 1, 1,
0.5217766, -0.06508245, 0.5758325, 1, 1, 1, 1, 1,
0.5286071, -1.848554, 3.624356, 1, 1, 1, 1, 1,
0.5296556, 0.0840897, 1.389217, 1, 1, 1, 1, 1,
0.5302037, -0.7054754, 2.711178, 1, 1, 1, 1, 1,
0.5303101, -0.4653565, 2.575388, 1, 1, 1, 1, 1,
0.5307299, -0.9858217, 2.387715, 0, 0, 1, 1, 1,
0.5324289, 1.342729, 0.3997509, 1, 0, 0, 1, 1,
0.5432241, 1.263254, -1.243217, 1, 0, 0, 1, 1,
0.5433223, 0.1278455, 0.7982834, 1, 0, 0, 1, 1,
0.5456827, 0.7970437, 1.317011, 1, 0, 0, 1, 1,
0.5490081, -0.1166237, 1.207864, 1, 0, 0, 1, 1,
0.5531548, 0.6053601, 0.3537084, 0, 0, 0, 1, 1,
0.5538812, 0.3766949, 1.221394, 0, 0, 0, 1, 1,
0.5549733, 2.627235, -0.7573658, 0, 0, 0, 1, 1,
0.5567914, 0.6144955, 1.165692, 0, 0, 0, 1, 1,
0.5650995, 0.9608797, 1.188376, 0, 0, 0, 1, 1,
0.5676217, 0.1946225, 1.599161, 0, 0, 0, 1, 1,
0.5682329, 0.6817635, 0.1698725, 0, 0, 0, 1, 1,
0.5698792, 1.150198, 1.800287, 1, 1, 1, 1, 1,
0.5773892, 0.8279328, -0.09235363, 1, 1, 1, 1, 1,
0.5805613, -0.2318509, 2.520212, 1, 1, 1, 1, 1,
0.5846816, 0.08201542, 0.9668464, 1, 1, 1, 1, 1,
0.5934237, -0.201913, 1.320435, 1, 1, 1, 1, 1,
0.5989718, -0.5010465, 2.098533, 1, 1, 1, 1, 1,
0.6006977, 0.4372568, 2.536806, 1, 1, 1, 1, 1,
0.6036362, -0.5663018, 1.696139, 1, 1, 1, 1, 1,
0.6068949, -1.024607, 2.450464, 1, 1, 1, 1, 1,
0.6088893, -1.659411, 2.951227, 1, 1, 1, 1, 1,
0.6106066, -0.03568069, 2.94409, 1, 1, 1, 1, 1,
0.6140546, -0.623084, 1.406681, 1, 1, 1, 1, 1,
0.6141027, 1.721918, 1.388258, 1, 1, 1, 1, 1,
0.6143744, -0.6238534, 1.972681, 1, 1, 1, 1, 1,
0.6158071, 0.7857504, -0.566782, 1, 1, 1, 1, 1,
0.6162236, -1.494196, 3.829968, 0, 0, 1, 1, 1,
0.617125, -1.620106, 1.229944, 1, 0, 0, 1, 1,
0.6212991, -2.239131, 2.526406, 1, 0, 0, 1, 1,
0.6213054, 0.08872641, 1.50286, 1, 0, 0, 1, 1,
0.6223729, -0.446181, 4.27822, 1, 0, 0, 1, 1,
0.6244473, -0.9611686, 2.317348, 1, 0, 0, 1, 1,
0.6359258, -0.007008673, 1.032061, 0, 0, 0, 1, 1,
0.6376205, 1.246328, 0.4473373, 0, 0, 0, 1, 1,
0.6453698, -0.2317592, 1.35571, 0, 0, 0, 1, 1,
0.6465225, 1.204828, 2.167336, 0, 0, 0, 1, 1,
0.6492648, -0.4288394, 2.456476, 0, 0, 0, 1, 1,
0.6498591, -0.5933371, 2.239666, 0, 0, 0, 1, 1,
0.6509196, 0.6999559, 0.6262316, 0, 0, 0, 1, 1,
0.6519251, 0.8575595, 0.530636, 1, 1, 1, 1, 1,
0.6519717, 0.8086921, 1.157394, 1, 1, 1, 1, 1,
0.6628463, -1.055711, 2.279394, 1, 1, 1, 1, 1,
0.664413, 0.4863474, 1.012457, 1, 1, 1, 1, 1,
0.6644917, 0.6198655, 1.400991, 1, 1, 1, 1, 1,
0.6666703, 0.3504929, 2.102196, 1, 1, 1, 1, 1,
0.6718754, 1.779518, 0.8788037, 1, 1, 1, 1, 1,
0.6770011, -0.2674288, 3.551488, 1, 1, 1, 1, 1,
0.6830899, -0.8408157, 3.910126, 1, 1, 1, 1, 1,
0.683669, -0.1515123, 1.214052, 1, 1, 1, 1, 1,
0.6846362, 0.5903022, 0.3877979, 1, 1, 1, 1, 1,
0.6852009, -2.304901, 3.556795, 1, 1, 1, 1, 1,
0.6942019, -0.0210554, 0.4374644, 1, 1, 1, 1, 1,
0.7033067, 1.363924, -0.4427588, 1, 1, 1, 1, 1,
0.7033998, -2.545909, 3.877584, 1, 1, 1, 1, 1,
0.7053484, -0.7380493, 3.579013, 0, 0, 1, 1, 1,
0.7088919, 1.412092, 1.309604, 1, 0, 0, 1, 1,
0.7195753, -0.2775153, 2.869619, 1, 0, 0, 1, 1,
0.7195934, -0.5878137, 3.187705, 1, 0, 0, 1, 1,
0.7310258, -1.173734, 3.683289, 1, 0, 0, 1, 1,
0.7357054, -0.2307408, 2.315446, 1, 0, 0, 1, 1,
0.7359619, -0.7549776, 2.820949, 0, 0, 0, 1, 1,
0.7415164, 0.2125048, -0.003313039, 0, 0, 0, 1, 1,
0.7431349, -0.7954182, 0.658661, 0, 0, 0, 1, 1,
0.7466775, 0.3872466, 1.318935, 0, 0, 0, 1, 1,
0.7484607, -0.09280829, 0.6386307, 0, 0, 0, 1, 1,
0.7488816, 0.7338963, 0.3739425, 0, 0, 0, 1, 1,
0.7515742, -0.9715747, 2.572453, 0, 0, 0, 1, 1,
0.7567257, -0.3273159, 1.520641, 1, 1, 1, 1, 1,
0.75683, 0.4095513, 1.31045, 1, 1, 1, 1, 1,
0.7601894, 0.9366693, 1.211297, 1, 1, 1, 1, 1,
0.7609167, -0.1269553, 1.311908, 1, 1, 1, 1, 1,
0.7621465, -2.132849, 2.54369, 1, 1, 1, 1, 1,
0.7621722, -1.061787, 1.207562, 1, 1, 1, 1, 1,
0.7657383, -0.440962, 1.74804, 1, 1, 1, 1, 1,
0.7658865, 0.4330445, 0.1082948, 1, 1, 1, 1, 1,
0.7690511, 0.5615918, -0.1711735, 1, 1, 1, 1, 1,
0.7715409, -1.264269, 1.269196, 1, 1, 1, 1, 1,
0.7804375, 0.2617285, 1.622428, 1, 1, 1, 1, 1,
0.7925592, 1.012637, -1.689968, 1, 1, 1, 1, 1,
0.7949779, 0.6379899, 2.661589, 1, 1, 1, 1, 1,
0.7952401, 0.4791816, 0.134405, 1, 1, 1, 1, 1,
0.7981757, 0.1519581, 1.449706, 1, 1, 1, 1, 1,
0.7987961, 0.3918037, 1.804844, 0, 0, 1, 1, 1,
0.8011006, 0.9659984, -0.6162795, 1, 0, 0, 1, 1,
0.8041468, -0.7758749, 0.9868237, 1, 0, 0, 1, 1,
0.8066981, 0.1579417, 0.603298, 1, 0, 0, 1, 1,
0.8142616, -0.03504175, 0.3349012, 1, 0, 0, 1, 1,
0.8173852, -1.316902, 2.023102, 1, 0, 0, 1, 1,
0.8180565, -1.1387, 3.014164, 0, 0, 0, 1, 1,
0.8182811, -1.465859, 1.742684, 0, 0, 0, 1, 1,
0.8231716, -0.1268411, 2.27411, 0, 0, 0, 1, 1,
0.8404006, 0.5884718, 1.46358, 0, 0, 0, 1, 1,
0.8423901, 1.693648, 2.181429, 0, 0, 0, 1, 1,
0.8458796, 2.248939, 0.2779479, 0, 0, 0, 1, 1,
0.8488587, 0.0335113, 2.285607, 0, 0, 0, 1, 1,
0.8504862, -0.3943197, 3.1147, 1, 1, 1, 1, 1,
0.8522429, 0.8369576, -0.9642072, 1, 1, 1, 1, 1,
0.855651, -0.6856025, 3.4357, 1, 1, 1, 1, 1,
0.8556929, 0.3654512, -0.1955602, 1, 1, 1, 1, 1,
0.8584424, -2.365891, 1.897219, 1, 1, 1, 1, 1,
0.8718387, 0.04310589, 1.592353, 1, 1, 1, 1, 1,
0.872022, 0.6590741, 1.444852, 1, 1, 1, 1, 1,
0.8726557, 0.2096411, 1.932597, 1, 1, 1, 1, 1,
0.8759372, -1.680254, 4.155227, 1, 1, 1, 1, 1,
0.8817638, 0.8650434, 0.5281883, 1, 1, 1, 1, 1,
0.8823332, -0.9705095, 2.189035, 1, 1, 1, 1, 1,
0.8826699, -0.6235025, 1.873718, 1, 1, 1, 1, 1,
0.8828182, 1.379954, 2.1546, 1, 1, 1, 1, 1,
0.8847398, -0.7148442, 0.8952019, 1, 1, 1, 1, 1,
0.8895311, -0.8130373, 3.409416, 1, 1, 1, 1, 1,
0.8935727, 0.2473924, 1.382933, 0, 0, 1, 1, 1,
0.9117267, 0.05019706, 1.399801, 1, 0, 0, 1, 1,
0.9252442, -0.7672982, 0.7960422, 1, 0, 0, 1, 1,
0.9272683, -0.6119188, 1.05702, 1, 0, 0, 1, 1,
0.9347368, -0.4473259, -0.2292737, 1, 0, 0, 1, 1,
0.9359804, -0.3477807, 3.081189, 1, 0, 0, 1, 1,
0.9404081, -1.091596, 2.437496, 0, 0, 0, 1, 1,
0.9435406, -0.314157, 1.711477, 0, 0, 0, 1, 1,
0.9532214, -1.688198, 1.832815, 0, 0, 0, 1, 1,
0.9642597, -1.720806, 2.241638, 0, 0, 0, 1, 1,
0.9665858, -0.251373, 1.280054, 0, 0, 0, 1, 1,
0.9683812, 0.4051726, 1.540802, 0, 0, 0, 1, 1,
0.9736096, -1.366289, 2.284432, 0, 0, 0, 1, 1,
0.975588, -0.4903788, 2.29651, 1, 1, 1, 1, 1,
0.981775, 0.07277077, 1.393499, 1, 1, 1, 1, 1,
0.9930943, -0.1070248, 1.977098, 1, 1, 1, 1, 1,
0.9942266, -2.14165, 2.278611, 1, 1, 1, 1, 1,
0.9951581, -1.35798, 2.909406, 1, 1, 1, 1, 1,
1.007109, -1.353316, 4.045777, 1, 1, 1, 1, 1,
1.008622, -1.266035, 0.9873203, 1, 1, 1, 1, 1,
1.012705, 0.4671035, -0.5755833, 1, 1, 1, 1, 1,
1.016421, 0.3053673, 2.402371, 1, 1, 1, 1, 1,
1.024127, -0.2483327, 1.545485, 1, 1, 1, 1, 1,
1.033898, 0.3535166, 0.1860101, 1, 1, 1, 1, 1,
1.041875, -0.3930022, 2.993303, 1, 1, 1, 1, 1,
1.045337, -1.176605, 1.277933, 1, 1, 1, 1, 1,
1.047391, 1.113155, -0.2978021, 1, 1, 1, 1, 1,
1.05202, 0.9510047, 1.587391, 1, 1, 1, 1, 1,
1.054372, -0.03132832, 2.610887, 0, 0, 1, 1, 1,
1.062606, 0.1206004, 0.7155441, 1, 0, 0, 1, 1,
1.062887, -2.348338, 3.190583, 1, 0, 0, 1, 1,
1.072089, -0.5141621, 0.3691236, 1, 0, 0, 1, 1,
1.07327, -0.7420068, 1.201031, 1, 0, 0, 1, 1,
1.074257, 1.429726, 0.2239192, 1, 0, 0, 1, 1,
1.075153, -0.3487198, 2.579509, 0, 0, 0, 1, 1,
1.079162, -0.9215683, 2.661632, 0, 0, 0, 1, 1,
1.081306, 0.1036637, 2.775789, 0, 0, 0, 1, 1,
1.08371, 0.2923093, 1.417434, 0, 0, 0, 1, 1,
1.088521, -0.2376876, 1.002077, 0, 0, 0, 1, 1,
1.089214, -0.3914877, 1.061082, 0, 0, 0, 1, 1,
1.09212, 0.8008423, 1.82223, 0, 0, 0, 1, 1,
1.09478, -0.2793456, 0.6212701, 1, 1, 1, 1, 1,
1.104118, 0.4845243, 0.05490077, 1, 1, 1, 1, 1,
1.106443, -0.8850601, 1.129905, 1, 1, 1, 1, 1,
1.108807, 1.862992, -0.5855725, 1, 1, 1, 1, 1,
1.111677, 1.456093, -1.375018, 1, 1, 1, 1, 1,
1.114538, 0.244407, 1.669324, 1, 1, 1, 1, 1,
1.12125, -0.3418661, 1.541093, 1, 1, 1, 1, 1,
1.128821, 1.926225, 0.5952467, 1, 1, 1, 1, 1,
1.130921, 0.791733, 1.015636, 1, 1, 1, 1, 1,
1.136136, 0.4876894, 0.1377734, 1, 1, 1, 1, 1,
1.139256, -0.6782741, 1.311604, 1, 1, 1, 1, 1,
1.140557, 0.8906512, -0.4534591, 1, 1, 1, 1, 1,
1.142644, 0.3266563, 1.160786, 1, 1, 1, 1, 1,
1.148613, -0.9259825, 2.249893, 1, 1, 1, 1, 1,
1.157483, -1.843419, 2.819695, 1, 1, 1, 1, 1,
1.161121, 0.2442799, 0.9461948, 0, 0, 1, 1, 1,
1.166046, -0.06368854, -0.2705277, 1, 0, 0, 1, 1,
1.183985, -0.3117723, 1.107656, 1, 0, 0, 1, 1,
1.184658, 1.107055, 0.5618979, 1, 0, 0, 1, 1,
1.186249, 0.499624, 1.501134, 1, 0, 0, 1, 1,
1.193781, 0.1052029, -0.2408461, 1, 0, 0, 1, 1,
1.196345, -0.144718, 1.944581, 0, 0, 0, 1, 1,
1.201613, 1.224688, 1.629138, 0, 0, 0, 1, 1,
1.20295, -0.5402545, 2.989282, 0, 0, 0, 1, 1,
1.208326, 1.102773, 3.294469, 0, 0, 0, 1, 1,
1.214975, 0.693605, 1.043767, 0, 0, 0, 1, 1,
1.219029, -0.5505399, 2.132354, 0, 0, 0, 1, 1,
1.222125, -2.220011, 2.324803, 0, 0, 0, 1, 1,
1.223155, -1.432534, 3.567723, 1, 1, 1, 1, 1,
1.228366, -1.441399, 1.942217, 1, 1, 1, 1, 1,
1.2291, 2.235391, 1.282382, 1, 1, 1, 1, 1,
1.230403, 0.475839, 0.4276686, 1, 1, 1, 1, 1,
1.230766, -0.6487128, 2.824723, 1, 1, 1, 1, 1,
1.240638, 1.033539, 1.378518, 1, 1, 1, 1, 1,
1.241718, -1.189775, 2.679952, 1, 1, 1, 1, 1,
1.241867, -0.2496469, 1.64516, 1, 1, 1, 1, 1,
1.246667, 1.378583, 1.510242, 1, 1, 1, 1, 1,
1.247527, -1.353235, 1.028123, 1, 1, 1, 1, 1,
1.254344, 0.7018836, 0.9945378, 1, 1, 1, 1, 1,
1.255076, -0.540701, -0.134149, 1, 1, 1, 1, 1,
1.255161, -0.9602042, 3.683361, 1, 1, 1, 1, 1,
1.261003, -0.8346036, 2.794153, 1, 1, 1, 1, 1,
1.269118, -0.111827, 1.078061, 1, 1, 1, 1, 1,
1.269293, -0.3639746, 1.901934, 0, 0, 1, 1, 1,
1.272538, 0.2423619, -0.705045, 1, 0, 0, 1, 1,
1.273759, 1.229671, 0.8071352, 1, 0, 0, 1, 1,
1.282026, -1.509769, 1.843409, 1, 0, 0, 1, 1,
1.289655, 0.9544409, 2.163888, 1, 0, 0, 1, 1,
1.300998, 3.062143, 0.6624029, 1, 0, 0, 1, 1,
1.302276, 0.2750313, 2.327976, 0, 0, 0, 1, 1,
1.307081, 2.001669, 0.3642294, 0, 0, 0, 1, 1,
1.308234, 0.6005225, -0.7613574, 0, 0, 0, 1, 1,
1.309939, 0.5247875, 0.4632044, 0, 0, 0, 1, 1,
1.317301, -1.614152, 1.628068, 0, 0, 0, 1, 1,
1.320335, -1.179163, 4.060625, 0, 0, 0, 1, 1,
1.324913, -0.8208957, 1.391812, 0, 0, 0, 1, 1,
1.326263, -0.4174302, 1.92608, 1, 1, 1, 1, 1,
1.336884, 1.371545, 0.139084, 1, 1, 1, 1, 1,
1.337671, 1.126885, 0.9337975, 1, 1, 1, 1, 1,
1.342709, 0.05044985, 2.387076, 1, 1, 1, 1, 1,
1.351897, 1.274553, 0.28844, 1, 1, 1, 1, 1,
1.35292, 0.5278385, 3.902027, 1, 1, 1, 1, 1,
1.358047, 0.6250077, 0.7740746, 1, 1, 1, 1, 1,
1.358938, -1.210771, 0.471784, 1, 1, 1, 1, 1,
1.359345, -0.8756596, 2.028895, 1, 1, 1, 1, 1,
1.370967, -0.6604831, 0.9071555, 1, 1, 1, 1, 1,
1.380522, -0.09880482, 3.005534, 1, 1, 1, 1, 1,
1.38326, -0.1733161, 0.8345374, 1, 1, 1, 1, 1,
1.393681, 0.2607003, 0.1171295, 1, 1, 1, 1, 1,
1.404669, -0.06234358, 2.47653, 1, 1, 1, 1, 1,
1.407767, 0.05841844, 0.03619817, 1, 1, 1, 1, 1,
1.410458, 1.113614, 3.073524, 0, 0, 1, 1, 1,
1.411445, 0.3073342, 1.653159, 1, 0, 0, 1, 1,
1.420802, 0.08697832, 3.247264, 1, 0, 0, 1, 1,
1.421384, -0.4021401, 3.163769, 1, 0, 0, 1, 1,
1.429298, -0.9535232, 2.93445, 1, 0, 0, 1, 1,
1.439981, -1.073046, 1.183903, 1, 0, 0, 1, 1,
1.441055, -0.2988537, 1.245311, 0, 0, 0, 1, 1,
1.44219, 0.300434, 2.130883, 0, 0, 0, 1, 1,
1.447184, 0.8386713, 1.863346, 0, 0, 0, 1, 1,
1.453648, 0.436218, 2.626128, 0, 0, 0, 1, 1,
1.45721, -0.1951395, 1.600443, 0, 0, 0, 1, 1,
1.463829, -1.663738, 2.403873, 0, 0, 0, 1, 1,
1.466012, 0.9165085, 1.541895, 0, 0, 0, 1, 1,
1.468093, -1.504869, 3.295873, 1, 1, 1, 1, 1,
1.469097, -0.09353764, 2.230866, 1, 1, 1, 1, 1,
1.472312, 2.776389, -0.01311717, 1, 1, 1, 1, 1,
1.498495, 1.077537, 1.902387, 1, 1, 1, 1, 1,
1.505912, -0.8033649, 1.813911, 1, 1, 1, 1, 1,
1.510349, -0.9709328, 0.2853312, 1, 1, 1, 1, 1,
1.52993, -1.003273, 3.027111, 1, 1, 1, 1, 1,
1.530513, 1.334355, 2.624752, 1, 1, 1, 1, 1,
1.53404, -0.2505958, 3.808792, 1, 1, 1, 1, 1,
1.536174, 1.578095, 1.641615, 1, 1, 1, 1, 1,
1.540354, 0.07018904, 0.426106, 1, 1, 1, 1, 1,
1.540519, 1.823476, 0.6903168, 1, 1, 1, 1, 1,
1.548906, -1.571261, 2.968205, 1, 1, 1, 1, 1,
1.566565, 1.03124, 2.698231, 1, 1, 1, 1, 1,
1.568763, -1.378707, 0.5924501, 1, 1, 1, 1, 1,
1.605595, 1.762936, 0.3090744, 0, 0, 1, 1, 1,
1.607361, -0.02893897, 2.669009, 1, 0, 0, 1, 1,
1.629078, -0.08590437, 1.260772, 1, 0, 0, 1, 1,
1.637034, 0.164242, -0.7259101, 1, 0, 0, 1, 1,
1.637633, -1.413007, -0.2944377, 1, 0, 0, 1, 1,
1.646049, -0.1138132, 1.925344, 1, 0, 0, 1, 1,
1.646746, 0.9347463, 1.331866, 0, 0, 0, 1, 1,
1.648513, -1.332507, 1.48237, 0, 0, 0, 1, 1,
1.65062, -1.510665, 2.879082, 0, 0, 0, 1, 1,
1.653674, 0.5151854, 0.2327525, 0, 0, 0, 1, 1,
1.667269, 1.001211, 0.6348146, 0, 0, 0, 1, 1,
1.66881, -0.1040251, 3.335949, 0, 0, 0, 1, 1,
1.704092, -0.3166139, 1.330635, 0, 0, 0, 1, 1,
1.704924, 2.036615, 2.001862, 1, 1, 1, 1, 1,
1.73573, 1.334323, 1.696634, 1, 1, 1, 1, 1,
1.738536, -1.646491, 0.4783469, 1, 1, 1, 1, 1,
1.764875, -0.6437266, 3.450031, 1, 1, 1, 1, 1,
1.777996, 1.815023, 0.450995, 1, 1, 1, 1, 1,
1.788272, 0.8425172, 1.358557, 1, 1, 1, 1, 1,
1.788683, 0.7972296, 2.357825, 1, 1, 1, 1, 1,
1.793608, 0.04286195, 0.6658842, 1, 1, 1, 1, 1,
1.803762, -0.5988151, 2.483087, 1, 1, 1, 1, 1,
1.807471, 0.6609812, 1.242469, 1, 1, 1, 1, 1,
1.811695, 1.03656, 2.827459, 1, 1, 1, 1, 1,
1.825585, -0.2060616, 2.015808, 1, 1, 1, 1, 1,
1.849442, -0.523664, 0.3845101, 1, 1, 1, 1, 1,
1.855115, 0.5421513, 1.431059, 1, 1, 1, 1, 1,
1.856494, 0.6254106, 1.882146, 1, 1, 1, 1, 1,
1.868764, -0.7730887, 1.994308, 0, 0, 1, 1, 1,
1.87475, -1.038634, 1.912001, 1, 0, 0, 1, 1,
1.928876, 2.078362, 0.1407175, 1, 0, 0, 1, 1,
2.012722, -0.4503432, 2.072361, 1, 0, 0, 1, 1,
2.023453, 2.037368, -0.7482174, 1, 0, 0, 1, 1,
2.056615, -0.6626586, 1.849599, 1, 0, 0, 1, 1,
2.069711, 0.07171076, 1.549827, 0, 0, 0, 1, 1,
2.123308, -2.018384, 2.300593, 0, 0, 0, 1, 1,
2.146151, -0.2560594, 1.303632, 0, 0, 0, 1, 1,
2.184165, 1.291696, 1.596256, 0, 0, 0, 1, 1,
2.206855, 0.1319811, 3.400684, 0, 0, 0, 1, 1,
2.218488, -1.300519, 2.4533, 0, 0, 0, 1, 1,
2.231377, -0.6444337, 2.214316, 0, 0, 0, 1, 1,
2.395612, -0.04529966, 1.705768, 1, 1, 1, 1, 1,
2.4707, -0.04100024, 1.869026, 1, 1, 1, 1, 1,
2.470847, -0.2363105, 0.7900967, 1, 1, 1, 1, 1,
2.548834, 0.3574286, 0.4733686, 1, 1, 1, 1, 1,
2.625292, 1.405151, 0.7119328, 1, 1, 1, 1, 1,
2.745924, -1.591655, 1.11579, 1, 1, 1, 1, 1,
3.007813, -0.2109239, 0.2062415, 1, 1, 1, 1, 1
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
var radius = 9.501892;
var distance = 33.375;
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
mvMatrix.translate( 0.07920241, 0.1010189, -0.4059789 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.375);
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
